/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: mpgen_3000_4.s
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
!	Seed = 330103944
!	Riesling can be on
!	1 Thread, 3000 lines
!	mpgen   created on Dec 20, 2005 (16:35:03)
!	mpgen_3000_4.s created on Mar 30, 2009 (10:39:44)
!	RC file : mar26.rc
!	cmd = /import/n2-tools/release/tools/mpgen/mpgen,1.051220 -rc mar26.rc -o mpgen_3000_4 -p 1 -l 3000

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
!	%f0  = 20f78943 de755f9c c79a3507 77e2eb4b
!	%f4  = 558bf3ff e57bb2c1 0c00b638 6e655127
!	%f8  = 7db8a8fe 14ef7179 ccaa8168 0deee902
!	%f12 = 91ee73e8 b973a44a 1ee581c0 04177388
	ldda	[%g1]ASI_BLK_P,%f0
	add	%g1,64,%g1
!	%f16 = a8b6e34d d0cacac6 f0650335 ea03c50b
!	%f20 = 15387d9f 1339feff 6b6b3b17 7df7f8a9
!	%f24 = ed901724 5dd135f3 bae226e5 94672388
!	%f28 = 0ee506e6 361d1261 2d851ca8 4c21830b
	ldda	[%g1]ASI_BLK_P,%f16
	add	%g1,64,%g1
!	%f32 = 4014644f eb334309 95d534e2 ff50d1f8
!	%f36 = 9a27eaa0 cb24cf18 c640745d 82d0516d
!	%f40 = c2665184 ccc9514e 4a40e736 5e2d6617
!	%f44 = 5b7f7d89 2b145723 fe500423 c4763fa6
	ldda	[%g1]ASI_BLK_P,%f32

!	Set up the Graphics Status Register

	setx	0xd77d9e580000004a,%g7,%g1 ! GSR scale =  9, align = 2
	wr	%g1,%g0,%gsr		! GSR = d77d9e580000004a
	wr	%g0,%y			! Clear Y register
	xorcc	%g0,%g0,%g3		! init %g3 and set flags
	membar	#Sync			! Force the block loads to complete

!	Start of Random Code for processor 0

p0_label_1:
!	Mem[0000000010001408] = 99b7b3ce, %l3 = 7d898a4fde606c50
	lduwa	[%i0+%o4]0x88,%l3	! %l3 = 0000000099b7b3ce
!	%l3 = 0000000099b7b3ce, Mem[0000000010041434] = b73a9ac9
	stb	%l3,[%i1+0x034]		! Mem[0000000010041434] = ce3a9ac9
!	%f16 = a8b6e34d d0cacac6 f0650335 ea03c50b
!	%f20 = 15387d9f 1339feff 6b6b3b17 7df7f8a9
!	%f24 = ed901724 5dd135f3 bae226e5 94672388
!	%f28 = 0ee506e6 361d1261 2d851ca8 4c21830b
	stda	%f16,[%i1]ASI_COMMIT_S	! Block Store to 0000000030041400
!	%l2 = ce1ad5725bcb4924, Mem[00000000100c1400] = dd9ad2e97ae6bc84
	stxa	%l2,[%i3+%g0]0x80	! Mem[00000000100c1400] = ce1ad5725bcb4924
!	%l3 = 0000000099b7b3ce, Mem[0000000010001408] = ceb3b799
	stwa	%l3,[%i0+%o4]0x80	! Mem[0000000010001408] = 99b7b3ce
!	Mem[0000000010081403] = 20111a10, %l0 = 1ff2331e45532e40
	ldstuba	[%i2+0x003]%asi,%l0	! %l0 = 00000010000000ff
!	%l1 = 99af98c64e701f45, Mem[0000000020800000] = 25bf5afb, %asi = 80
	stha	%l1,[%o1+0x000]%asi	! Mem[0000000020800000] = 1f455afb
	membar	#Sync			! Added by membar checker (1)
!	Mem[0000000030041400] = a8b6e34dd0cacac6, %f2  = c79a3507 77e2eb4b
	ldda	[%i1+%g0]0x81,%f2 	! %f2  = a8b6e34d d0cacac6
!	%l1 = 99af98c64e701f45, Mem[0000000030001400] = db0bfd232ed80ec1
	stxa	%l1,[%i0+%g0]0x81	! Mem[0000000030001400] = 99af98c64e701f45
!	Starting 10 instruction Store Burst
!	%l1 = 99af98c64e701f45, Mem[000000001010143a] = 59b9ad5e
	stb	%l1,[%i4+0x03a]		! Mem[0000000010101438] = 59b9455e

p0_label_2:
!	Mem[0000000010081410] = 9daead72, %l2 = ce1ad5725bcb4924
	ldstuba	[%i2+%o5]0x80,%l2	! %l2 = 0000009d000000ff
!	%l7 = bbe3da7a00fee70c, Mem[0000000030081410] = b334a2cc
	stwa	%l7,[%i2+%o5]0x89	! Mem[0000000030081410] = 00fee70c
!	%f14 = 1ee581c0 04177388, %l4 = 302ee882849d4601
!	Mem[0000000010181428] = 8813d4f41719e847
	add	%i6,0x028,%g1
	stda	%f14,[%g1+%l4]ASI_PST32_P ! Mem[0000000010181428] = 8813d4f404177388
!	Mem[00000000201c0000] = cdb78a5f, %l6 = 3cf0f6e4a0b730d7
	ldstub	[%o0+%g0],%l6		! %l6 = 000000cd000000ff
!	%l0 = 00000010, %l1 = 4e701f45, Mem[0000000010081408] = 4d686ff2 f1a6dfe2
	std	%l0,[%i2+%o4]		! Mem[0000000010081408] = 00000010 4e701f45
!	Mem[0000000010181400] = 9bb9c06d, %l1 = 99af98c64e701f45
	ldstuba	[%i6+%g0]0x88,%l1	! %l1 = 0000006d000000ff
!	%l2 = 000000000000009d, Mem[0000000030041400] = a8b6e34d
	stba	%l2,[%i1+%g0]0x81	! Mem[0000000030041400] = 9db6e34d
!	Mem[00000000211c0000] = 0dbf6217, %l0 = 0000000000000010
	ldstub	[%o2+%g0],%l0		! %l0 = 0000000d000000ff
!	%l0 = 000000000000000d, Mem[0000000030041408] = f0650335
	stba	%l0,[%i1+%o4]0x81	! Mem[0000000030041408] = 0d650335
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = c4b07af0, %l0 = 000000000000000d
	lduba	[%i4+%o4]0x81,%l0	! %l0 = 00000000000000c4

p0_label_3:
!	Mem[0000000010041408] = 8f3fd040, %l5 = 03af7910d1fe0a95
	ldswa	[%i1+%o4]0x80,%l5	! %l5 = ffffffff8f3fd040
!	Mem[0000000010141410] = dcf438ac, %l4 = 302ee882849d4601
	ldsba	[%i5+%o5]0x88,%l4	! %l4 = ffffffffffffffac
!	Mem[0000000010141400] = 3af8cdfb 108689c0, %l2 = 0000009d, %l3 = 99b7b3ce
	ldda	[%i5+%g0]0x80,%l2	! %l2 = 000000003af8cdfb 00000000108689c0
!	Mem[0000000030001400] = 99af98c6, %f17 = d0cacac6
	lda	[%i0+%g0]0x81,%f17	! %f17 = 99af98c6
!	Mem[0000000030101410] = e7809014 a2212971, %l0 = 000000c4, %l1 = 0000006d
	ldda	[%i4+%o5]0x81,%l0	! %l0 = 00000000e7809014 00000000a2212971
!	Mem[00000000100c1410] = e97d9b19637f6beb, %l7 = bbe3da7a00fee70c
	ldx	[%i3+%o5],%l7		! %l7 = e97d9b19637f6beb
!	Mem[0000000010181400] = 9bb9c0ff, %l2 = 000000003af8cdfb
	ldsha	[%i6+%g0]0x88,%l2	! %l2 = ffffffffffffc0ff
!	Mem[00000000300c1400] = 9af0f88f, %l3 = 00000000108689c0
	ldsba	[%i3+%g0]0x81,%l3	! %l3 = ffffffffffffff9a
!	Mem[00000000300c1400] = 9af0f88f482217b6, %l5 = ffffffff8f3fd040
	ldxa	[%i3+%g0]0x81,%l5	! %l5 = 9af0f88f482217b6
!	Starting 10 instruction Store Burst
!	%f14 = 1ee581c0 04177388, Mem[00000000100c1408] = daacf11a c6a99928
	stda	%f14,[%i3+%o4]0x88	! Mem[00000000100c1408] = 1ee581c0 04177388

p0_label_4:
!	%f18 = f0650335 ea03c50b, Mem[0000000030041400] = 4de3b69d c6cacad0
	stda	%f18,[%i1+%g0]0x89	! Mem[0000000030041400] = f0650335 ea03c50b
!	Mem[0000000030141400] = 680a473c, %l3 = ffffffffffffff9a
	swapa	[%i5+%g0]0x89,%l3	! %l3 = 00000000680a473c
!	%l3 = 00000000680a473c, Mem[00000000100c1430] = 546131672a88f947, %asi = 80
	stxa	%l3,[%i3+0x030]%asi	! Mem[00000000100c1430] = 00000000680a473c
!	Mem[0000000030041410] = 9f7d3815, %l0 = 00000000e7809014
	swapa	[%i1+%o5]0x89,%l0	! %l0 = 000000009f7d3815
!	%f28 = 0ee506e6 361d1261, Mem[0000000030181408] = e0fce500 28f8237d
	stda	%f28,[%i6+%o4]0x89	! Mem[0000000030181408] = 0ee506e6 361d1261
!	Mem[00000000300c1400] = 8ff8f09a, %l6 = 00000000000000cd
	ldstuba	[%i3+%g0]0x89,%l6	! %l6 = 0000009a000000ff
!	Mem[0000000010081410] = ffaead72, %l1 = 00000000a2212971
	ldstuba	[%i2+%o5]0x80,%l1	! %l1 = 000000ff000000ff
!	Mem[00000000211c0000] = ffbf6217, %l4 = ffffffffffffffac
	ldstub	[%o2+%g0],%l4		! %l4 = 000000ff000000ff
!	%l0 = 000000009f7d3815, Mem[0000000030041408] = 3503650d
	stba	%l0,[%i1+%o4]0x89	! Mem[0000000030041408] = 35036515
!	Starting 10 instruction Load Burst
!	%f20 = 15387d9f 1339feff, %f0  = 20f78943
	fxtos	%f20,%f0 		! %f0  = 5da9c3ed

p0_label_5:
!	Mem[0000000010141400] = fbcdf83a, %l2 = ffffffffffffc0ff
	ldsba	[%i5+%g0]0x88,%l2	! %l2 = 000000000000003a
!	Mem[0000000010181410] = 136427e1, %l4 = 00000000000000ff
	lduwa	[%i6+%o5]0x80,%l4	! %l4 = 00000000136427e1
!	Mem[0000000010041408] = 40d03f8f, %l4 = 00000000136427e1
	ldstuba	[%i1+%o4]0x88,%l4	! %l4 = 0000008f000000ff
!	Mem[00000000100c1400] = 72d51ace, %l6 = 000000000000009a
	lduwa	[%i3+%g0]0x88,%l6	! %l6 = 0000000072d51ace
!	Mem[0000000030101400] = 07e03aec, %l4 = 000000000000008f
	ldswa	[%i4+%g0]0x81,%l4	! %l4 = 0000000007e03aec
!	Mem[00000000211c0000] = ffbf6217, %l6 = 0000000072d51ace
	ldsha	[%o2+0x000]%asi,%l6	! %l6 = ffffffffffffffbf
!	Mem[0000000010181408] = faf0b3bf010bd512, %f20 = 15387d9f 1339feff
	ldda	[%i6+%o4]0x88,%f20	! %f20 = faf0b3bf 010bd512
!	Mem[000000001000141c] = fbece2be, %l2 = 000000000000003a
	ldswa	[%i0+0x01c]%asi,%l2	! %l2 = fffffffffbece2be
!	Mem[0000000030041408] = 35036515, %l5 = 9af0f88f482217b6
	lduwa	[%i1+%o4]0x89,%l5	! %l5 = 0000000035036515
!	Starting 10 instruction Store Burst
!	%f28 = 0ee506e6, Mem[0000000030101410] = 149080e7
	sta	%f28,[%i4+%o5]0x89	! Mem[0000000030101410] = 0ee506e6

p0_label_6:
!	%l2 = fffffffffbece2be, Mem[0000000010081408] = 00000010
	stw	%l2,[%i2+%o4]		! Mem[0000000010081408] = fbece2be
!	%l1 = 00000000000000ff, Mem[0000000010141430] = 1c4dac65b3ae6c4e, %asi = 80
	stxa	%l1,[%i5+0x030]%asi	! Mem[0000000010141430] = 00000000000000ff
!	%f28 = 0ee506e6, Mem[0000000010141408] = 4cf4137a
	sta	%f28,[%i5+%o4]0x80	! Mem[0000000010141408] = 0ee506e6
!	%l0 = 000000009f7d3815, Mem[00000000300c1408] = 76ad0d8e6bb216b7
	stxa	%l0,[%i3+%o4]0x81	! Mem[00000000300c1408] = 000000009f7d3815
!	%f26 = bae226e5, Mem[00000000300c1408] = 00000000
	sta	%f26,[%i3+%o4]0x81	! Mem[00000000300c1408] = bae226e5
!	%l7 = e97d9b19637f6beb, Mem[0000000030081410] = 00fee70c
	stwa	%l7,[%i2+%o5]0x89	! Mem[0000000030081410] = 637f6beb
!	%f0  = 5da9c3ed de755f9c a8b6e34d d0cacac6
!	%f4  = 558bf3ff e57bb2c1 0c00b638 6e655127
!	%f8  = 7db8a8fe 14ef7179 ccaa8168 0deee902
!	%f12 = 91ee73e8 b973a44a 1ee581c0 04177388
	stda	%f0,[%i3]ASI_BLK_AIUP	! Block Store to 00000000100c1400
!	%f24 = ed901724 5dd135f3, %l7 = e97d9b19637f6beb
!	Mem[0000000010081430] = 8d34ba01c7f80afc
	add	%i2,0x030,%g1
	stda	%f24,[%g1+%l7]ASI_PST32_P ! Mem[0000000010081430] = ed9017245dd135f3
!	%l0 = 9f7d3815, %l1 = 000000ff, Mem[0000000010081418] = 34df140a eb8541c3
	std	%l0,[%i2+0x018]		! Mem[0000000010081418] = 9f7d3815 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = 149080e71339feff, %l1 = 00000000000000ff
	ldxa	[%i1+%o5]0x81,%l1	! %l1 = 149080e71339feff

p0_label_7:
!	Mem[0000000010181410] = e1276413, %f20 = faf0b3bf
	lda	[%i6+%o5]0x88,%f20	! %f20 = e1276413
!	Mem[0000000030081410] = eb6b7f63, %l6 = ffffffffffffffbf
	lduha	[%i2+%o5]0x81,%l6	! %l6 = 000000000000eb6b
!	Mem[0000000020800000] = 1f455afb, %l4 = 0000000007e03aec
	lduh	[%o1+%g0],%l4		! %l4 = 0000000000001f45
!	Mem[0000000010181428] = 8813d4f4, %l5 = 0000000035036515
	ldsba	[%i6+0x028]%asi,%l5	! %l5 = ffffffffffffff88
!	Mem[0000000030081408] = 77c578d4d59b4244, %f22 = 6b6b3b17 7df7f8a9
	ldda	[%i2+%o4]0x89,%f22	! %f22 = 77c578d4 d59b4244
!	Mem[0000000010081408] = fbece2be, %l2 = fffffffffbece2be
	lduha	[%i2+%o4]0x80,%l2	! %l2 = 000000000000fbec
!	Mem[00000000300c1400] = fff0f88f, %f26 = bae226e5
	lda	[%i3+%g0]0x81,%f26	! %f26 = fff0f88f
!	Mem[0000000010041408] = 40d03fff, %l1 = 149080e71339feff
	ldsba	[%i1+%o4]0x88,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000030141408] = c1dfcd30, %l3 = 00000000680a473c
	lduwa	[%i5+%o4]0x89,%l3	! %l3 = 00000000c1dfcd30
!	Starting 10 instruction Store Burst
!	%l1 = ffffffffffffffff, Mem[00000000300c1408] = bae226e5
	stba	%l1,[%i3+%o4]0x81	! Mem[00000000300c1408] = ffe226e5

p0_label_8:
!	Mem[0000000010081410] = 72adaeff, %l2 = 000000000000fbec
	swapa	[%i2+%o5]0x88,%l2	! %l2 = 0000000072adaeff
!	%l6 = 0000eb6b, %l7 = 637f6beb, Mem[00000000300c1408] = e526e2ff 15387d9f
	stda	%l6,[%i3+%o4]0x89	! Mem[00000000300c1408] = 0000eb6b 637f6beb
!	%l2 = 0000000072adaeff, Mem[0000000030141400] = 9affffff
	stha	%l2,[%i5+%g0]0x81	! Mem[0000000030141400] = aeffffff
!	%l6 = 000000000000eb6b, Mem[0000000020800040] = 8d4f8327, %asi = 80
	stha	%l6,[%o1+0x040]%asi	! Mem[0000000020800040] = eb6b8327
!	Mem[0000000010041408] = 40d03fff, %l6 = 000000000000eb6b
	ldstuba	[%i1+%o4]0x88,%l6	! %l6 = 000000ff000000ff
!	%f18 = f0650335, Mem[0000000030041400] = ea03c50b
	sta	%f18,[%i1+%g0]0x89	! Mem[0000000030041400] = f0650335
!	%f24 = ed901724, Mem[0000000030001408] = 7d817430
	sta	%f24,[%i0+%o4]0x89	! Mem[0000000030001408] = ed901724
!	Code Fragment 4
p0_fragment_1:
!	%l0 = 000000009f7d3815
	setx	0x1900b4c8278d86d7,%g7,%l0 ! %l0 = 1900b4c8278d86d7
!	%l1 = ffffffffffffffff
	setx	0x124c20e86af0e56c,%g7,%l1 ! %l1 = 124c20e86af0e56c
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 1900b4c8278d86d7
	setx	0xba6cc0c03565cc5f,%g7,%l0 ! %l0 = ba6cc0c03565cc5f
!	%l1 = 124c20e86af0e56c
	setx	0x1370b5afcb05d618,%g7,%l1 ! %l1 = 1370b5afcb05d618
!	%l6 = 000000ff, %l7 = 637f6beb, Mem[0000000030041408] = 15650335 ea03c50b
	stda	%l6,[%i1+%o4]0x81	! Mem[0000000030041408] = 000000ff 637f6beb
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = 350365f0, %l3 = 00000000c1dfcd30
	ldsba	[%i1+%g0]0x81,%l3	! %l3 = 0000000000000035

p0_label_9:
!	Mem[0000000030001400] = 99af98c6, %l6 = 00000000000000ff
	ldsba	[%i0+%g0]0x81,%l6	! %l6 = ffffffffffffff99
!	Mem[0000000010101410] = a978e4bd, %l4 = 0000000000001f45
	lduwa	[%i4+%o5]0x88,%l4	! %l4 = 00000000a978e4bd
!	Mem[0000000030141410] = 71138651ce321760, %l0 = ba6cc0c03565cc5f
	ldxa	[%i5+%o5]0x81,%l0	! %l0 = 71138651ce321760
!	Mem[0000000010081408] = fbece2be4e701f45, %f30 = 2d851ca8 4c21830b
	ldda	[%i2+%o4]0x80,%f30	! %f30 = fbece2be 4e701f45
!	Mem[0000000010141408] = e606e50e, %l6 = ffffffffffffff99
	ldsba	[%i5+%o4]0x88,%l6	! %l6 = 000000000000000e
!	Mem[0000000030181410] = 73e09b65, %l3 = 0000000000000035
	ldsha	[%i6+%o5]0x89,%l3	! %l3 = ffffffffffff9b65
!	Mem[00000000218000c0] = 17bde748, %l7 = e97d9b19637f6beb
	ldub	[%o3+0x0c1],%l7		! %l7 = 00000000000000bd
!	Mem[0000000030181410] = 659be073, %l3 = ffffffffffff9b65
	ldswa	[%i6+%o5]0x81,%l3	! %l3 = 00000000659be073
!	Mem[0000000030081400] = 6ddc71827487e36b, %f10 = ccaa8168 0deee902
	ldda	[%i2+%g0]0x89,%f10	! %f10 = 6ddc7182 7487e36b
!	Starting 10 instruction Store Burst
!	%f16 = a8b6e34d 99af98c6 f0650335 ea03c50b
!	%f20 = e1276413 010bd512 77c578d4 d59b4244
!	%f24 = ed901724 5dd135f3 fff0f88f 94672388
!	%f28 = 0ee506e6 361d1261 fbece2be 4e701f45
	stda	%f16,[%i0]ASI_BLK_SL	! Block Store to 0000000030001400

p0_label_10:
!	Mem[00000000300c1410] = d3935e28, %l2 = 0000000072adaeff
	ldstuba	[%i3+%o5]0x89,%l2	! %l2 = 00000028000000ff
!	%f12 = 91ee73e8 b973a44a, %l2 = 0000000000000028
!	Mem[0000000030181418] = 12b2c461c27fbf15
	add	%i6,0x018,%g1
	stda	%f12,[%g1+%l2]ASI_PST16_S ! Mem[0000000030181418] = 91eec461c27fbf15
!	%f6  = 0c00b638, Mem[0000000010181400] = ffc0b99b
	sta	%f6 ,[%i6+%g0]0x80	! Mem[0000000010181400] = 0c00b638
!	Mem[0000000010101410] = a978e4bd, %l2 = 0000000000000028
	swapa	[%i4+%o5]0x88,%l2	! %l2 = 00000000a978e4bd
!	%l6 = 000000000000000e, Mem[0000000010181417] = 5970dae6
	stb	%l6,[%i6+0x017]		! Mem[0000000010181414] = 5970da0e
!	Mem[0000000010041400] = d33226a2, %l0 = 71138651ce321760
	ldstuba	[%i1+%g0]0x88,%l0	! %l0 = 000000a2000000ff
!	Mem[0000000010141418] = ae20de4318cb7144, %l2 = 00000000a978e4bd, %l0 = 00000000000000a2
	add	%i5,0x18,%g1
	casxa	[%g1]0x80,%l2,%l0	! %l0 = ae20de4318cb7144
!	%l1 = 1370b5afcb05d618, Mem[0000000010181400] = 0c00b638
	stba	%l1,[%i6+%g0]0x80	! Mem[0000000010181400] = 1800b638
!	%f10 = 6ddc7182 7487e36b, %l6 = 000000000000000e
!	Mem[0000000010181418] = 77af373eff915b93
	add	%i6,0x018,%g1
	stda	%f10,[%g1+%l6]ASI_PST8_P ! Mem[0000000010181418] = 77af373e7487e393
!	Starting 10 instruction Load Burst
!	Mem[0000000030181410] = 73e09b65, %l4 = 00000000a978e4bd
	ldswa	[%i6+%o5]0x89,%l4	! %l4 = 0000000073e09b65

p0_label_11:
!	Mem[0000000010101438] = 59b9455e4164c439, %l1 = 1370b5afcb05d618
	ldx	[%i4+0x038],%l1		! %l1 = 59b9455e4164c439
!	Mem[0000000010081430] = ed9017245dd135f3, %l2 = 00000000a978e4bd
	ldxa	[%i2+0x030]%asi,%l2	! %l2 = ed9017245dd135f3
	membar	#Sync			! Added by membar checker (2)
!	Mem[00000000100c1408] = a8b6e34d, %l6 = 000000000000000e
	lduwa	[%i3+%o4]0x80,%l6	! %l6 = 00000000a8b6e34d
!	Mem[0000000030181410] = 659be073138969d1, %f16 = a8b6e34d 99af98c6
	ldda	[%i6+%o5]0x81,%f16	! %f16 = 659be073 138969d1
!	Mem[0000000010041414] = 65ae1846, %l4 = 0000000073e09b65
	lduha	[%i1+0x014]%asi,%l4	! %l4 = 00000000000065ae
!	Mem[0000000010041410] = eca4f0ab, %l5 = ffffffffffffff88
	lduba	[%i1+%o5]0x80,%l5	! %l5 = 00000000000000ec
!	Mem[0000000010041400] = d33226ff, %l0 = ae20de4318cb7144
	lduha	[%i1+%g0]0x88,%l0	! %l0 = 00000000000026ff
!	Mem[0000000010041434] = ce3a9ac9, %l0 = 00000000000026ff
	lduha	[%i1+0x034]%asi,%l0	! %l0 = 000000000000ce3a
!	Mem[00000000100c1408] = 4de3b6a8, %l4 = 00000000000065ae
	lduwa	[%i3+%o4]0x88,%l4	! %l4 = 000000004de3b6a8
!	Starting 10 instruction Store Burst
!	Mem[0000000010041400] = d33226ff, %l1 = 59b9455e4164c439
	swapa	[%i1+%g0]0x88,%l1	! %l1 = 00000000d33226ff

p0_label_12:
!	%f26 = fff0f88f 94672388, Mem[0000000010141430] = 00000000 000000ff
	std	%f26,[%i5+0x030]	! Mem[0000000010141430] = fff0f88f 94672388
!	%l7 = 00000000000000bd, Mem[0000000030081400] = 6ddc71827487e36b
	stxa	%l7,[%i2+%g0]0x89	! Mem[0000000030081400] = 00000000000000bd
!	%l4 = 000000004de3b6a8, Mem[0000000021800080] = d8a1d810, %asi = 80
	stha	%l4,[%o3+0x080]%asi	! Mem[0000000021800080] = b6a8d810
!	%f12 = 91ee73e8 b973a44a, Mem[0000000030041408] = ff000000 eb6b7f63
	stda	%f12,[%i1+%o4]0x89	! Mem[0000000030041408] = 91ee73e8 b973a44a
!	Mem[0000000010141400] = 3af8cdfb, %l3 = 00000000659be073
	ldstuba	[%i5+%g0]0x80,%l3	! %l3 = 0000003a000000ff
!	Mem[00000000201c0000] = ffb78a5f, %l1 = 00000000d33226ff
	ldstub	[%o0+%g0],%l1		! %l1 = 000000ff000000ff
!	Mem[0000000010181434] = 6d58355b, %l7 = 00000000000000bd, %asi = 80
	swapa	[%i6+0x034]%asi,%l7	! %l7 = 000000006d58355b
!	%f18 = f0650335 ea03c50b, %l1 = 00000000000000ff
!	Mem[0000000010001428] = dc4fb833bf2fc9c8
	add	%i0,0x028,%g1
	stda	%f18,[%g1+%l1]ASI_PST8_P ! Mem[0000000010001428] = f0650335ea03c50b
!	%l4 = 000000004de3b6a8, Mem[00000000100c1410] = 558bf3ff
	stha	%l4,[%i3+%o5]0x80	! Mem[00000000100c1410] = b6a8f3ff
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = 770a6842 d3935eff, %l4 = 4de3b6a8, %l5 = 000000ec
	ldda	[%i3+%o5]0x89,%l4	! %l4 = 00000000d3935eff 00000000770a6842

p0_label_13:
!	Mem[0000000010041438] = 1dd83067, %l4 = 00000000d3935eff
	lduw	[%i1+0x038],%l4		! %l4 = 000000001dd83067
!	Mem[00000000300c1400] = fff0f88f, %l5 = 00000000770a6842
	lduha	[%i3+%g0]0x81,%l5	! %l5 = 000000000000fff0
!	Mem[0000000030141408] = c1dfcd30, %f18 = f0650335
	lda	[%i5+%o4]0x89,%f18	! %f18 = c1dfcd30
!	Mem[00000000100c142c] = 0deee902, %f28 = 0ee506e6
	lda	[%i3+0x02c]%asi,%f28	! %f28 = 0deee902
!	Mem[0000000030001400] = c698af99, %l2 = ed9017245dd135f3
	ldswa	[%i0+%g0]0x81,%l2	! %l2 = ffffffffc698af99
!	Mem[0000000030001408] = f0650335ea03c50b, %f20 = e1276413 010bd512
	ldda	[%i0+%o4]0x89,%f20	! %f20 = f0650335 ea03c50b
!	Mem[0000000010101410] = 28000000, %l7 = 000000006d58355b
	lduwa	[%i4+%o5]0x80,%l7	! %l7 = 0000000028000000
!	Mem[0000000030181400] = b54cf92a, %l1 = 00000000000000ff
	lduwa	[%i6+%g0]0x89,%l1	! %l1 = 00000000b54cf92a
!	Mem[0000000030081408] = 44429bd5, %l5 = 000000000000fff0
	ldsba	[%i2+%o4]0x81,%l5	! %l5 = 0000000000000044
!	Starting 10 instruction Store Burst
!	%l1 = 00000000b54cf92a, Mem[0000000020800000] = 1f455afb
	stb	%l1,[%o1+%g0]		! Mem[0000000020800000] = 2a455afb

p0_label_14:
!	%l1 = 00000000b54cf92a, Mem[0000000010181400] = 38b60018
	stba	%l1,[%i6+%g0]0x88	! Mem[0000000010181400] = 38b6002a
!	%f28 = 0deee902 361d1261, %l5 = 0000000000000044
!	Mem[0000000010041410] = eca4f0ab65ae1846
	add	%i1,0x010,%g1
	stda	%f28,[%g1+%l5]ASI_PST32_PL ! Mem[0000000010041410] = eca4f0ab65ae1846
!	%l3 = 000000000000003a, Mem[0000000021800100] = 38e937bf, %asi = 80
	stha	%l3,[%o3+0x100]%asi	! Mem[0000000021800100] = 003a37bf
!	%f22 = 77c578d4 d59b4244, Mem[0000000010101410] = 00000028 94e5bb1f
	stda	%f22,[%i4+%o5]0x88	! Mem[0000000010101410] = 77c578d4 d59b4244
!	%f29 = 361d1261, Mem[0000000030181400] = b54cf92a
	sta	%f29,[%i6+%g0]0x89	! Mem[0000000030181400] = 361d1261
!	Mem[0000000010141410] = dcf438ac, %l5 = 0000000000000044
	ldstuba	[%i5+%o5]0x88,%l5	! %l5 = 000000ac000000ff
!	%f15 = 04177388, Mem[00000000100c1408] = a8b6e34d
	sta	%f15,[%i3+%o4]0x80	! Mem[00000000100c1408] = 04177388
!	Mem[0000000030081408] = 44429bd5, %l7 = 0000000028000000
	swapa	[%i2+%o4]0x81,%l7	! %l7 = 0000000044429bd5
!	Mem[0000000010141404] = 108689c0, %l4 = 1dd83067, %l0 = 0000ce3a
	add	%i5,0x04,%g1
	casa	[%g1]0x80,%l4,%l0	! %l0 = 00000000108689c0
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = 61121d36e606e50e, %l4 = 000000001dd83067
	ldxa	[%i6+%o4]0x81,%l4	! %l4 = 61121d36e606e50e

p0_label_15:
!	Mem[00000000300c1400] = fff0f88f, %l6 = 00000000a8b6e34d
	ldsba	[%i3+%g0]0x81,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000030141410] = 71138651, %l5 = 00000000000000ac
	lduba	[%i5+%o5]0x81,%l5	! %l5 = 0000000000000071
!	Mem[0000000010041410] = eca4f0ab65ae1846, %l0 = 00000000108689c0
	ldxa	[%i1+%o5]0x80,%l0	! %l0 = eca4f0ab65ae1846
!	Mem[0000000010101410] = 44429bd5d478c577, %l4 = 61121d36e606e50e
	ldxa	[%i4+0x010]%asi,%l4	! %l4 = 44429bd5d478c577
!	Mem[0000000010041410] = eca4f0ab 65ae1846, %l6 = ffffffff, %l7 = 44429bd5
	ldda	[%i1+%o5]0x80,%l6	! %l6 = 00000000eca4f0ab 0000000065ae1846
!	Mem[0000000010001428] = f0650335 ea03c50b, %l2 = c698af99, %l3 = 0000003a
	ldd	[%i0+0x028],%l2		! %l2 = 00000000f0650335 00000000ea03c50b
!	Mem[0000000030181408] = 61121d36, %f0  = 5da9c3ed
	lda	[%i6+%o4]0x81,%f0 	! %f0 = 61121d36
!	Mem[0000000010181400] = 2a00b638, %f22 = 77c578d4
	lda	[%i6+%g0]0x80,%f22	! %f22 = 2a00b638
!	Mem[0000000030181410] = 659be073, %l5 = 0000000000000071
	ldsha	[%i6+%o5]0x81,%l5	! %l5 = 000000000000659b
!	Starting 10 instruction Store Burst
!	%f22 = 2a00b638, Mem[00000000300c1408] = 0000eb6b
	sta	%f22,[%i3+%o4]0x89	! Mem[00000000300c1408] = 2a00b638

p0_label_16:
!	%l0 = 65ae1846, %l1 = b54cf92a, Mem[0000000010001408] = ceb3b799 f14968a5
	stda	%l0,[%i0+%o4]0x88	! Mem[0000000010001408] = 65ae1846 b54cf92a
!	%l0 = eca4f0ab65ae1846, Mem[0000000010041408] = e623f83940d03fff
	stxa	%l0,[%i1+%o4]0x88	! Mem[0000000010041408] = eca4f0ab65ae1846
!	%f30 = fbece2be 4e701f45, Mem[0000000010001400] = 0ed3abd3 c4b85521
	stda	%f30,[%i0+%g0]0x88	! Mem[0000000010001400] = fbece2be 4e701f45
!	Mem[0000000010041408] = 4618ae65, %l3 = 00000000ea03c50b
	swapa	[%i1+%o4]0x80,%l3	! %l3 = 000000004618ae65
!	Mem[00000000201c0000] = ffb78a5f, %l4 = 44429bd5d478c577
	ldstub	[%o0+%g0],%l4		! %l4 = 000000ff000000ff
!	Mem[0000000030141410] = 71138651, %l0 = eca4f0ab65ae1846
	ldstuba	[%i5+%o5]0x81,%l0	! %l0 = 00000071000000ff
!	%f20 = f0650335 ea03c50b, Mem[0000000030081410] = 637f6beb b0c71fcf
	stda	%f20,[%i2+%o5]0x89	! Mem[0000000030081410] = f0650335 ea03c50b
!	%l2 = 00000000f0650335, Mem[0000000030141410] = ff138651
	stba	%l2,[%i5+%o5]0x81	! Mem[0000000030141410] = 35138651
!	%f16 = 659be073 138969d1, Mem[0000000010141408] = 0ee506e6 605c70a5
	stda	%f16,[%i5+%o4]0x80	! Mem[0000000010141408] = 659be073 138969d1
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = ffb78a5f, %l3 = 000000004618ae65
	lduha	[%o0+0x000]%asi,%l3	! %l3 = 000000000000ffb7

p0_label_17:
!	Mem[0000000010101408] = a2d90de9, %l5 = 000000000000659b
	ldswa	[%i4+%o4]0x88,%l5	! %l5 = ffffffffa2d90de9
!	Mem[00000000100c1400] = 5da9c3ed, %l4 = 00000000000000ff
	ldsb	[%i3+0x003],%l4		! %l4 = ffffffffffffffed
!	Mem[0000000010001400] = fbece2be4e701f45, %f14 = 1ee581c0 04177388
	ldda	[%i0+%g0]0x88,%f14	! %f14 = fbece2be 4e701f45
!	Mem[0000000030181408] = 61121d36, %l1 = 00000000b54cf92a
	lduwa	[%i6+%o4]0x81,%l1	! %l1 = 0000000061121d36
!	Mem[0000000030081400] = bd000000, %l4 = ffffffffffffffed
	ldswa	[%i2+%g0]0x81,%l4	! %l4 = ffffffffbd000000
!	Mem[0000000010001400] = 4e701f45, %l2 = 00000000f0650335
	lduha	[%i0+%g0]0x88,%l2	! %l2 = 0000000000001f45
!	Mem[0000000030041400] = f0650335, %l7 = 0000000065ae1846
	ldsha	[%i1+%g0]0x89,%l7	! %l7 = 0000000000000335
!	Mem[00000000211c0000] = ffbf6217, %l0 = 0000000000000071
	ldub	[%o2+0x001],%l0		! %l0 = 00000000000000bf
!	Mem[0000000030101408] = c4b07af09720c804, %f0  = 61121d36 de755f9c
	ldda	[%i4+%o4]0x81,%f0 	! %f0  = c4b07af0 9720c804
!	Starting 10 instruction Store Burst
!	%l1 = 0000000061121d36, Mem[0000000010181408] = 12d50b01, %asi = 80
	stwa	%l1,[%i6+0x008]%asi	! Mem[0000000010181408] = 61121d36

p0_label_18:
!	Mem[0000000020800000] = 2a455afb, %l5 = ffffffffa2d90de9
	ldstuba	[%o1+0x000]%asi,%l5	! %l5 = 0000002a000000ff
!	Mem[000000001018141c] = 7487e393, %l2 = 0000000000001f45
	swap	[%i6+0x01c],%l2		! %l2 = 000000007487e393
!	%l3 = 000000000000ffb7, Mem[0000000010081408] = bee2ecfb
	stba	%l3,[%i2+%o4]0x88	! Mem[0000000010081408] = bee2ecb7
!	%l6 = eca4f0ab, %l7 = 00000335, Mem[0000000030101410] = 0ee506e6 712921a2
	stda	%l6,[%i4+%o5]0x89	! Mem[0000000030101410] = eca4f0ab 00000335
!	Mem[0000000010141428] = d184f620, %l3 = 000000000000ffb7
	swap	[%i5+0x028],%l3		! %l3 = 00000000d184f620
!	%l4 = ffffffffbd000000, Mem[0000000010101430] = c3438a9b, %asi = 80
	stwa	%l4,[%i4+0x030]%asi	! Mem[0000000010101430] = bd000000
!	%l5 = 000000000000002a, Mem[0000000010081410] = 0000fbec
	stba	%l5,[%i2+%o5]0x88	! Mem[0000000010081410] = 0000fb2a
!	%f28 = 0deee902 361d1261, %l7 = 0000000000000335
!	Mem[0000000010101418] = f1da490a8ec5e15b
	add	%i4,0x018,%g1
	stda	%f28,[%g1+%l7]ASI_PST8_P ! Mem[0000000010101418] = f1dae9028e1de161
!	%l4 = ffffffffbd000000, Mem[0000000010001402] = 451f704e
	stb	%l4,[%i0+0x002]		! Mem[0000000010001400] = 451f004e
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = 04177388d0cacac6, %f18 = c1dfcd30 ea03c50b
	ldda	[%i3+%o4]0x80,%f18	! %f18 = 04177388 d0cacac6

p0_label_19:
!	Mem[0000000010041408] = ea03c50b, %l2 = 000000007487e393
	ldswa	[%i1+%o4]0x80,%l2	! %l2 = ffffffffea03c50b
!	Mem[0000000010001410] = f8135518, %l2 = ffffffffea03c50b
	lduba	[%i0+%o5]0x88,%l2	! %l2 = 0000000000000018
!	Mem[00000000100c1410] = c1b27be5 fff3a8b6, %l4 = bd000000, %l5 = 0000002a
	ldda	[%i3+%o5]0x88,%l4	! %l4 = 00000000fff3a8b6 00000000c1b27be5
!	Mem[0000000010181400] = 2a00b638 972211f2, %l6 = eca4f0ab, %l7 = 00000335
	ldda	[%i6+%g0]0x80,%l6	! %l6 = 000000002a00b638 00000000972211f2
!	Mem[0000000010001410] = f8135518, %l0 = 00000000000000bf
	ldswa	[%i0+%o5]0x88,%l0	! %l0 = fffffffff8135518
!	Mem[0000000030181408] = 61121d36 e606e50e, %l4 = fff3a8b6, %l5 = c1b27be5
	ldda	[%i6+%o4]0x81,%l4	! %l4 = 0000000061121d36 00000000e606e50e
!	Mem[0000000010041408] = 0bc503ea, %l1 = 0000000061121d36
	ldswa	[%i1+%o4]0x88,%l1	! %l1 = 000000000bc503ea
!	Mem[0000000010101400] = f99370f9, %l3 = 00000000d184f620
	lduwa	[%i4+%g0]0x80,%l3	! %l3 = 00000000f99370f9
!	Mem[000000001000141c] = fbece2be, %l2 = 0000000000000018
	ldsb	[%i0+0x01d],%l2		! %l2 = ffffffffffffffec
!	Starting 10 instruction Store Burst
!	Mem[0000000030101410] = eca4f0ab, %l2 = ffffffffffffffec
	ldstuba	[%i4+%o5]0x89,%l2	! %l2 = 000000ab000000ff

p0_label_20:
!	%l6 = 000000002a00b638, Mem[0000000030081400] = bd000000
	stba	%l6,[%i2+%g0]0x81	! Mem[0000000030081400] = 38000000
!	Mem[0000000030041400] = f0650335, %l3 = 00000000f99370f9
	ldstuba	[%i1+%g0]0x89,%l3	! %l3 = 00000035000000ff
!	Mem[000000001004142a] = d9c5dfe6, %l1 = 000000000bc503ea
	ldstub	[%i1+0x02a],%l1		! %l1 = 000000df000000ff
!	%l1 = 00000000000000df, Mem[00000000100c1411] = b6a8f3ff, %asi = 80
	stba	%l1,[%i3+0x011]%asi	! Mem[00000000100c1410] = b6dff3ff
!	Mem[0000000010041408] = ea03c50babf0a4ec, %l7 = 00000000972211f2, %l6 = 000000002a00b638
	add	%i1,0x08,%g1
	casxa	[%g1]0x80,%l7,%l6	! %l6 = ea03c50babf0a4ec
!	Mem[0000000010101434] = 9ce49b57, %l2 = 00000000000000ab, %asi = 80
	swapa	[%i4+0x034]%asi,%l2	! %l2 = 000000009ce49b57
!	Mem[0000000030041410] = 149080e7, %l1 = 00000000000000df
	ldstuba	[%i1+%o5]0x81,%l1	! %l1 = 00000014000000ff
!	%l0 = fffffffff8135518, Mem[0000000010041408] = ea03c50b
	stb	%l0,[%i1+%o4]		! Mem[0000000010041408] = 1803c50b
!	%f16 = 659be073 138969d1 04177388 d0cacac6
!	%f20 = f0650335 ea03c50b 2a00b638 d59b4244
!	%f24 = ed901724 5dd135f3 fff0f88f 94672388
!	%f28 = 0deee902 361d1261 fbece2be 4e701f45
	stda	%f16,[%i6]ASI_BLK_AIUSL	! Block Store to 0000000030181400
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (3)
!	Mem[0000000010181400] = 2a00b638, %f15 = 4e701f45
	lda	[%i6+%g0]0x80,%f15	! %f15 = 2a00b638

p0_label_21:
!	Mem[0000000030001408] = 0bc503ea, %l2 = 000000009ce49b57
	lduha	[%i0+%o4]0x81,%l2	! %l2 = 0000000000000bc5
!	Mem[00000000100c1410] = b6dff3ff, %l5 = 00000000e606e50e
	lduwa	[%i3+%o5]0x80,%l5	! %l5 = 00000000b6dff3ff
!	Mem[0000000010001400] = 451f004e, %l5 = 00000000b6dff3ff
	ldsba	[%i0+%g0]0x80,%l5	! %l5 = 0000000000000045
!	Mem[0000000030001410] = 12d50b01, %l2 = 0000000000000bc5
	lduwa	[%i0+%o5]0x81,%l2	! %l2 = 0000000012d50b01
!	Mem[0000000030101400] = 07e03aec, %l3 = 0000000000000035
	lduwa	[%i4+%g0]0x81,%l3	! %l3 = 0000000007e03aec
!	Mem[0000000010041414] = 65ae1846, %l4 = 0000000061121d36
	lduwa	[%i1+0x014]%asi,%l4	! %l4 = 0000000065ae1846
!	Mem[0000000010001400] = 4e001f45, %l3 = 0000000007e03aec
	lduwa	[%i0+%g0]0x88,%l3	! %l3 = 000000004e001f45
!	Mem[0000000020800040] = eb6b8327, %l7 = 00000000972211f2
	ldsb	[%o1+0x041],%l7		! %l7 = 000000000000006b
!	Mem[0000000010001430] = 5570b11d, %f2  = a8b6e34d
	ld	[%i0+0x030],%f2 	! %f2 = 5570b11d
!	Starting 10 instruction Store Burst
!	%f18 = 04177388 d0cacac6, %l0 = fffffffff8135518
!	Mem[0000000030181438] = 451f704ebee2ecfb
	add	%i6,0x038,%g1
	stda	%f18,[%g1+%l0]ASI_PST32_SL ! Mem[0000000030181438] = 451f704ebee2ecfb

p0_label_22:
!	%f21 = ea03c50b, Mem[0000000010101434] = 000000ab
	sta	%f21,[%i4+0x034]%asi	! Mem[0000000010101434] = ea03c50b
!	%l3 = 000000004e001f45, Mem[0000000030181410] = ea03c50b
	stba	%l3,[%i6+%o5]0x89	! Mem[0000000030181410] = ea03c545
!	%l7 = 000000000000006b, Mem[0000000010041410] = eca4f0ab
	stwa	%l7,[%i1+%o5]0x80	! Mem[0000000010041410] = 0000006b
!	%f8  = 7db8a8fe 14ef7179, %l0 = fffffffff8135518
!	Mem[00000000100c1428] = ccaa81680deee902
	add	%i3,0x028,%g1
	stda	%f8,[%g1+%l0]ASI_PST32_PL ! Mem[00000000100c1428] = ccaa81680deee902
!	%l4 = 0000000065ae1846, Mem[00000000100c1408] = 88731704
	stha	%l4,[%i3+%o4]0x88	! Mem[00000000100c1408] = 88731846
!	Mem[0000000030181400] = d1698913, %l5 = 0000000000000045
	ldstuba	[%i6+%g0]0x81,%l5	! %l5 = 000000d1000000ff
!	%l5 = 00000000000000d1, Mem[0000000030001410] = 12d50b01136427e1
	stxa	%l5,[%i0+%o5]0x81	! Mem[0000000030001410] = 00000000000000d1
!	%f28 = 0deee902 361d1261, Mem[00000000100c1408] = 88731846 c6cacad0
	stda	%f28,[%i3+%o4]0x88	! Mem[00000000100c1408] = 0deee902 361d1261
!	%f4  = 558bf3ff e57bb2c1, Mem[00000000300c1408] = 2a00b638 637f6beb
	stda	%f4 ,[%i3+%o4]0x89	! Mem[00000000300c1408] = 558bf3ff e57bb2c1
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = f99370f9, %l7 = 000000000000006b
	lduba	[%i4+%g0]0x80,%l7	! %l7 = 00000000000000f9

p0_label_23:
!	Mem[0000000030181408] = c6cacad0, %l3 = 000000004e001f45
	ldsba	[%i6+%o4]0x81,%l3	! %l3 = ffffffffffffffc6
!	Mem[0000000010041408] = 1803c50babf0a4ec, %f18 = 04177388 d0cacac6
	ldd	[%i1+%o4],%f18		! %f18 = 1803c50b abf0a4ec
!	Mem[00000000100c1408] = 61121d36, %l0 = fffffffff8135518
	lduba	[%i3+%o4]0x80,%l0	! %l0 = 0000000000000061
!	Mem[0000000010101408] = a2d90de9, %f24 = ed901724
	lda	[%i4+%o4]0x88,%f24	! %f24 = a2d90de9
!	Mem[0000000030101410] = fff0a4ec35030000, %f22 = 2a00b638 d59b4244
	ldda	[%i4+%o5]0x81,%f22	! %f22 = fff0a4ec 35030000
!	Mem[000000001004143c] = ffe8eccc, %l5 = 00000000000000d1
	ldsh	[%i1+0x03c],%l5		! %l5 = ffffffffffffffe8
!	Mem[0000000010101430] = bd000000ea03c50b, %f28 = 0deee902 361d1261
	ldd	[%i4+0x030],%f28	! %f28 = bd000000 ea03c50b
!	Mem[0000000010001408] = 4618ae652af94cb5, %l2 = 0000000012d50b01
	ldx	[%i0+%o4],%l2		! %l2 = 4618ae652af94cb5
!	Mem[00000000100c142c] = 0deee902, %l2 = 4618ae652af94cb5
	lduw	[%i3+0x02c],%l2		! %l2 = 000000000deee902
!	Starting 10 instruction Store Burst
!	Mem[00000000201c0000] = ffb78a5f, %l5 = ffffffffffffffe8
	ldstuba	[%o0+0x000]%asi,%l5	! %l5 = 000000ff000000ff

p0_label_24:
!	Mem[0000000030081400] = 38000000, %l1 = 0000000000000014
	ldstuba	[%i2+%g0]0x81,%l1	! %l1 = 00000038000000ff
!	%l2 = 000000000deee902, Mem[0000000030101408] = f07ab0c4
	stba	%l2,[%i4+%o4]0x89	! Mem[0000000030101408] = f07ab002
!	%f14 = fbece2be 2a00b638, %l2 = 000000000deee902
!	Mem[00000000100c1438] = 1ee581c004177388
	add	%i3,0x038,%g1
	stda	%f14,[%g1+%l2]ASI_PST8_PL ! Mem[00000000100c1438] = 1eb681c004177388
!	%f14 = fbece2be 2a00b638, Mem[0000000010041408] = 0bc50318 eca4f0ab
	stda	%f14,[%i1+%o4]0x88	! Mem[0000000010041408] = fbece2be 2a00b638
!	%l6 = abf0a4ec, %l7 = 000000f9, Mem[0000000010141400] = fff8cdfb 108689c0
	stda	%l6,[%i5+%g0]0x80	! Mem[0000000010141400] = abf0a4ec 000000f9
!	%l3 = ffffffffffffffc6, Mem[0000000010181410] = e1276413
	stwa	%l3,[%i6+%o5]0x88	! Mem[0000000010181410] = ffffffc6
!	%f2  = 5570b11d, Mem[0000000010081408] = b7ece2be
	sta	%f2 ,[%i2+%o4]0x80	! Mem[0000000010081408] = 5570b11d
!	Mem[0000000010101410] = d59b4244, %l5 = 00000000000000ff
	swapa	[%i4+%o5]0x88,%l5	! %l5 = 00000000d59b4244
!	Mem[0000000030141400] = aeffffff, %l3 = ffffffffffffffc6
	swapa	[%i5+%g0]0x81,%l3	! %l3 = 00000000aeffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = ffffffc6d046c574, %f14 = fbece2be 2a00b638
	ldda	[%i5+%g0]0x81,%f14	! %f14 = ffffffc6 d046c574

p0_label_25:
!	Mem[0000000030041408] = 4aa473b9, %l5 = 00000000d59b4244
	ldsba	[%i1+%o4]0x81,%l5	! %l5 = 000000000000004a
!	Mem[00000000211c0000] = ffbf6217, %l6 = ea03c50babf0a4ec
	ldub	[%o2+%g0],%l6		! %l6 = 00000000000000ff
!	Mem[0000000010181400] = 2a00b638, %l5 = 000000000000004a
	ldsba	[%i6+%g0]0x80,%l5	! %l5 = 000000000000002a
!	Mem[0000000030101410] = fff0a4ec, %l4 = 0000000065ae1846
	ldsha	[%i4+%o5]0x81,%l4	! %l4 = fffffffffffffff0
!	Mem[00000000100c1408] = 61121d36, %l4 = fffffffffffffff0
	ldsha	[%i3+%o4]0x80,%l4	! %l4 = 0000000000006112
!	Mem[0000000010041410] = 0000006b65ae1846, %l7 = 00000000000000f9
	ldxa	[%i1+0x010]%asi,%l7	! %l7 = 0000006b65ae1846
!	Mem[0000000010101408] = e90dd9a2, %l4 = 0000000000006112
	lduba	[%i4+%o4]0x80,%l4	! %l4 = 00000000000000e9
!	Mem[0000000030101400] = ec3ae007, %l5 = 000000000000002a
	lduha	[%i4+%g0]0x89,%l5	! %l5 = 000000000000e007
!	Mem[0000000010041400] = 4164c439, %l1 = 0000000000000038
	ldsba	[%i1+%g0]0x88,%l1	! %l1 = 0000000000000039
!	Starting 10 instruction Store Burst
!	%l4 = 00000000000000e9, Mem[0000000010001410] = 185513f8
	stha	%l4,[%i0+%o5]0x80	! Mem[0000000010001410] = 00e913f8

p0_label_26:
!	%l6 = 00000000000000ff, Mem[0000000010001410] = 00e913f8
	stwa	%l6,[%i0+%o5]0x80	! Mem[0000000010001410] = 000000ff
!	%l3 = 00000000aeffffff, Mem[00000000211c0000] = ffbf6217, %asi = 80
	stha	%l3,[%o2+0x000]%asi	! Mem[00000000211c0000] = ffff6217
!	%l0 = 0000000000000061, Mem[0000000010101410] = 000000ff
	stba	%l0,[%i4+%o5]0x88	! Mem[0000000010101410] = 00000061
!	%l3 = 00000000aeffffff, Mem[0000000030181408] = d0cacac6
	stha	%l3,[%i6+%o4]0x89	! Mem[0000000030181408] = d0caffff
!	Mem[0000000010141400] = abf0a4ec, %l2 = 000000000deee902
	ldstuba	[%i5+%g0]0x80,%l2	! %l2 = 000000ab000000ff
!	Mem[00000000300c1408] = e57bb2c1, %l0 = 0000000000000061
	swapa	[%i3+%o4]0x89,%l0	! %l0 = 00000000e57bb2c1
!	Mem[00000000100c1408] = 61121d36, %l7 = 0000006b65ae1846
	swapa	[%i3+%o4]0x80,%l7	! %l7 = 0000000061121d36
!	%f14 = ffffffc6 d046c574, Mem[00000000300c1410] = d3935eff 770a6842
	stda	%f14,[%i3+%o5]0x89	! Mem[00000000300c1410] = ffffffc6 d046c574
!	Mem[0000000030041400] = ff0365f0, %l1 = 0000000000000039
	swapa	[%i1+%g0]0x81,%l1	! %l1 = 00000000ff0365f0
!	Starting 10 instruction Load Burst
!	%f31 = 4e701f45, %f16 = 659be073, %f2  = 5570b11d
	fadds	%f31,%f16,%f2 		! %f2  = 659be073

p0_label_27:
!	Mem[0000000030101410] = fff0a4ec35030000, %f6  = 0c00b638 6e655127
	ldda	[%i4+%o5]0x81,%f6 	! %f6  = fff0a4ec 35030000
!	Mem[000000001008140c] = 4e701f45, %f7  = 35030000
	ld	[%i2+0x00c],%f7 	! %f7 = 4e701f45
!	Mem[0000000030101410] = eca4f0ff, %l1 = 00000000ff0365f0
	lduwa	[%i4+%o5]0x89,%l1	! %l1 = 00000000eca4f0ff
!	Mem[0000000010181400] = 2a00b638, %f6  = fff0a4ec
	lda	[%i6+%g0]0x80,%f6 	! %f6 = 2a00b638
!	Mem[00000000300c1400] = b6172248 8ff8f0ff, %l2 = 000000ab, %l3 = aeffffff
	ldda	[%i3+%g0]0x89,%l2	! %l2 = 000000008ff8f0ff 00000000b6172248
!	Mem[00000000201c0000] = ffb78a5f, %l3 = 00000000b6172248
	ldsh	[%o0+%g0],%l3		! %l3 = ffffffffffffffb7
!	Mem[0000000010081410] = 2afb0000, %l7 = 0000000061121d36
	ldsha	[%i2+%o5]0x80,%l7	! %l7 = 0000000000002afb
!	Mem[00000000300c1408] = 61000000, %l2 = 000000008ff8f0ff
	ldsba	[%i3+%o4]0x81,%l2	! %l2 = 0000000000000061
!	Mem[0000000030041408] = 4aa473b9e873ee91, %f12 = 91ee73e8 b973a44a
	ldda	[%i1+%o4]0x81,%f12	! %f12 = 4aa473b9 e873ee91
!	Starting 10 instruction Store Burst
!	Mem[000000001008141e] = 000000ff, %l1 = 00000000eca4f0ff
	ldstuba	[%i2+0x01e]%asi,%l1	! %l1 = 00000000000000ff

p0_label_28:
!	Mem[0000000020800040] = eb6b8327, %l0 = 00000000e57bb2c1
	ldstuba	[%o1+0x040]%asi,%l0	! %l0 = 000000eb000000ff
!	%l2 = 00000061, %l3 = ffffffb7, Mem[0000000010041408] = 38b6002a bee2ecfb
	stda	%l2,[%i1+%o4]0x80	! Mem[0000000010041408] = 00000061 ffffffb7
!	Mem[0000000010101408] = e90dd9a2f13130af, %f12 = 4aa473b9 e873ee91
	ldd	[%i4+%o4],%f12		! %f12 = e90dd9a2 f13130af
!	%l3 = ffffffffffffffb7, Mem[0000000010041410] = 6b000000
	stha	%l3,[%i1+%o5]0x88	! Mem[0000000010041410] = 6b00ffb7
!	Mem[0000000010141438] = aabd396d2ea0965c, %l1 = 0000000000000000, %l7 = 0000000000002afb
	add	%i5,0x38,%g1
	casxa	[%g1]0x80,%l1,%l7	! %l7 = aabd396d2ea0965c
!	Mem[0000000020800041] = ff6b8327, %l0 = 00000000000000eb
	ldstuba	[%o1+0x041]%asi,%l0	! %l0 = 0000006b000000ff
!	%l1 = 0000000000000000, Mem[0000000030141408] = 30cddfc1
	stba	%l1,[%i5+%o4]0x81	! Mem[0000000030141408] = 00cddfc1
!	%l0 = 000000000000006b, Mem[0000000010101400] = f97093f9
	stba	%l0,[%i4+%g0]0x88	! Mem[0000000010101400] = f970936b
!	%f16 = 659be073 138969d1 1803c50b abf0a4ec
!	%f20 = f0650335 ea03c50b fff0a4ec 35030000
!	%f24 = a2d90de9 5dd135f3 fff0f88f 94672388
!	%f28 = bd000000 ea03c50b fbece2be 4e701f45
	stda	%f16,[%i2]ASI_COMMIT_S	! Block Store to 0000000030081400
!	Starting 10 instruction Load Burst
!	Mem[0000000020800000] = ff455afb, %l2 = 0000000000000061
	ldsh	[%o1+%g0],%l2		! %l2 = ffffffffffffff45

p0_label_29:
!	Mem[000000001010141c] = 8e1de161, %l5 = 000000000000e007
	ldsh	[%i4+0x01e],%l5		! %l5 = ffffffffffffe161
!	Mem[0000000010141410] = ff38f4dc, %f13 = f13130af
	lda	[%i5+%o5]0x80,%f13	! %f13 = ff38f4dc
!	Mem[0000000010041400] = 39c46441, %f7  = 4e701f45
	lda	[%i1+%g0]0x80,%f7 	! %f7 = 39c46441
!	Mem[0000000021800000] = 676ce2e2, %l3 = ffffffffffffffb7
	lduba	[%o3+0x001]%asi,%l3	! %l3 = 000000000000006c
!	Mem[0000000030001408] = f0650335ea03c50b, %f6  = 2a00b638 39c46441
	ldda	[%i0+%o4]0x89,%f6 	! %f6  = f0650335 ea03c50b
!	Mem[0000000030001400] = c698af99, %l4 = 00000000000000e9
	lduha	[%i0+%g0]0x81,%l4	! %l4 = 000000000000c698
!	Mem[0000000030101400] = 7f095755ec3ae007, %l6 = 00000000000000ff
	ldxa	[%i4+%g0]0x89,%l6	! %l6 = 7f095755ec3ae007
!	Mem[0000000010181428] = 8813d4f404177388, %l4 = 000000000000c698
	ldx	[%i6+0x028],%l4		! %l4 = 8813d4f404177388
!	Mem[00000000300c1408] = 00000061, %l1 = 0000000000000000
	ldswa	[%i3+%o4]0x89,%l1	! %l1 = 0000000000000061
!	Starting 10 instruction Store Burst
!	%f4  = 558bf3ff e57bb2c1, Mem[0000000010181408] = 61121d36 bfb3f0fa
	stda	%f4 ,[%i6+0x008]%asi	! Mem[0000000010181408] = 558bf3ff e57bb2c1

p0_label_30:
!	%f7  = ea03c50b, Mem[0000000010041428] = d9c5ffe6
	st	%f7 ,[%i1+0x028]	! Mem[0000000010041428] = ea03c50b
!	%l4 = 04177388, %l5 = ffffe161, Mem[00000000100c1400] = edc3a95d 9c5f75de
	stda	%l4,[%i3+%g0]0x88	! Mem[00000000100c1400] = 04177388 ffffe161
!	%l7 = aabd396d2ea0965c, Mem[0000000010041400] = 39c46441
	stwa	%l7,[%i1+%g0]0x80	! Mem[0000000010041400] = 2ea0965c
!	Mem[0000000021800140] = 668f4ce0, %l5 = ffffffffffffe161
	ldstuba	[%o3+0x140]%asi,%l5	! %l5 = 00000066000000ff
!	Mem[0000000010001408] = 4618ae65, %l6 = 7f095755ec3ae007
	swapa	[%i0+%o4]0x80,%l6	! %l6 = 000000004618ae65
!	Mem[0000000030141408] = 00cddfc1, %l4 = 8813d4f404177388
	swapa	[%i5+%o4]0x81,%l4	! %l4 = 0000000000cddfc1
!	%f6  = f0650335, Mem[0000000010101408] = a2d90de9
	sta	%f6 ,[%i4+%o4]0x88	! Mem[0000000010101408] = f0650335
!	Mem[00000000300c1400] = 8ff8f0ff, %l2 = ffffffffffffff45
	ldstuba	[%i3+%g0]0x89,%l2	! %l2 = 000000ff000000ff
!	%l2 = 00000000000000ff, Mem[0000000030041408] = b973a44a
	stha	%l2,[%i1+%o4]0x89	! Mem[0000000030041408] = b97300ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = 350365f0, %l2 = 00000000000000ff
	lduwa	[%i4+%o4]0x80,%l2	! %l2 = 00000000350365f0

p0_label_31:
!	Mem[0000000010001400] = 451f004e bee2ecfb, %l4 = 00cddfc1, %l5 = 00000066
	ldda	[%i0+%g0]0x80,%l4	! %l4 = 00000000451f004e 00000000bee2ecfb
!	Mem[0000000020800000] = ff455afb, %l5 = 00000000bee2ecfb
	ldsha	[%o1+0x000]%asi,%l5	! %l5 = ffffffffffffff45
!	Mem[0000000010141410] = ff38f4dc, %l1 = 0000000000000061
	lduwa	[%i5+%o5]0x80,%l1	! %l1 = 00000000ff38f4dc
!	Mem[0000000010181408] = 558bf3ff, %l1 = 00000000ff38f4dc
	lduha	[%i6+%o4]0x80,%l1	! %l1 = 000000000000558b
!	Mem[0000000010141410] = ff38f4dc, %l1 = 000000000000558b
	lduba	[%i5+%o5]0x80,%l1	! %l1 = 00000000000000ff
!	Mem[00000000211c0000] = ffff6217, %l0 = 000000000000006b
	ldub	[%o2+%g0],%l0		! %l0 = 00000000000000ff
!	Mem[0000000030001408] = f0650335 ea03c50b, %l0 = 000000ff, %l1 = 000000ff
	ldda	[%i0+%o4]0x89,%l0	! %l0 = 00000000ea03c50b 00000000f0650335
!	Mem[0000000030101410] = fff0a4ec, %l4 = 00000000451f004e
	ldsha	[%i4+%o5]0x81,%l4	! %l4 = fffffffffffffff0
	membar	#Sync			! Added by membar checker (4)
!	Mem[0000000030081410] = f0650335ea03c50b, %l0 = 00000000ea03c50b
	ldxa	[%i2+%o5]0x81,%l0	! %l0 = f0650335ea03c50b
!	Starting 10 instruction Store Burst
!	%f10 = 6ddc7182 7487e36b, Mem[0000000010101428] = eaf4a174 6dabee61
	std	%f10,[%i4+0x028]	! Mem[0000000010101428] = 6ddc7182 7487e36b

p0_label_32:
!	%f8  = 7db8a8fe, Mem[0000000030181408] = ffffcad0
	sta	%f8 ,[%i6+%o4]0x81	! Mem[0000000030181408] = 7db8a8fe
!	Mem[0000000020800040] = ffff8327, %l7 = aabd396d2ea0965c
	ldstuba	[%o1+0x040]%asi,%l7	! %l7 = 000000ff000000ff
!	%f26 = fff0f88f, Mem[0000000010181408] = 558bf3ff
	sta	%f26,[%i6+%o4]0x80	! Mem[0000000010181408] = fff0f88f
!	Mem[000000001004143c] = ffe8eccc, %l4 = fffffff0, %l0 = ea03c50b
	add	%i1,0x3c,%g1
	casa	[%g1]0x80,%l4,%l0	! %l0 = 00000000ffe8eccc
!	%l2 = 00000000350365f0, Mem[0000000010141424] = a0e0805f, %asi = 80
	stwa	%l2,[%i5+0x024]%asi	! Mem[0000000010141424] = 350365f0
!	Mem[0000000010041410] = b7ff006b, %l1 = 00000000f0650335
	swapa	[%i1+%o5]0x80,%l1	! %l1 = 00000000b7ff006b
!	%l3 = 000000000000006c, Mem[0000000010101410] = 61000000
	stba	%l3,[%i4+%o5]0x80	! Mem[0000000010101410] = 6c000000
!	Mem[00000000211c0000] = ffff6217, %l1 = 00000000b7ff006b
	ldstub	[%o2+%g0],%l1		! %l1 = 000000ff000000ff
!	%f0  = c4b07af0 9720c804 659be073 d0cacac6
!	%f4  = 558bf3ff e57bb2c1 f0650335 ea03c50b
!	%f8  = 7db8a8fe 14ef7179 6ddc7182 7487e36b
!	%f12 = e90dd9a2 ff38f4dc ffffffc6 d046c574
	stda	%f0,[%i1]ASI_BLK_AIUPL	! Block Store to 0000000010041400
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = ffff6217, %l0 = 00000000ffe8eccc
	lduha	[%o2+0x000]%asi,%l0	! %l0 = 000000000000ffff

p0_label_33:
!	Mem[0000000030081410] = f0650335, %l7 = 00000000000000ff
	lduha	[%i2+%o5]0x81,%l7	! %l7 = 000000000000f065
!	Mem[0000000010081408] = 1db17055, %l1 = 00000000000000ff
	lduba	[%i2+%o4]0x88,%l1	! %l1 = 0000000000000055
!	Mem[0000000010141408] = 659be073138969d1, %l3 = 000000000000006c
	ldxa	[%i5+0x008]%asi,%l3	! %l3 = 659be073138969d1
!	Mem[0000000010141424] = 350365f0, %f22 = fff0a4ec
	ld	[%i5+0x024],%f22	! %f22 = 350365f0
	membar	#Sync			! Added by membar checker (5)
!	Mem[000000001004143c] = c6ffffff, %l6 = 000000004618ae65
	ldswa	[%i1+0x03c]%asi,%l6	! %l6 = ffffffffc6ffffff
!	Mem[0000000030181408] = fea8b87d, %l7 = 000000000000f065
	ldsba	[%i6+%o4]0x89,%l7	! %l7 = 000000000000007d
!	Mem[000000001004142c] = 8271dc6d, %f7  = ea03c50b
	ld	[%i1+0x02c],%f7 	! %f7 = 8271dc6d
!	Mem[0000000030181408] = 7db8a8fe, %l2 = 00000000350365f0
	ldsba	[%i6+%o4]0x81,%l2	! %l2 = 000000000000007d
!	Mem[000000001004142c] = 8271dc6d, %l2 = 000000000000007d
	ldsb	[%i1+0x02f],%l2		! %l2 = 000000000000006d
!	Starting 10 instruction Store Burst
!	%l0 = 000000000000ffff, Mem[00000000100c1418] = 0c00b6386e655127, %asi = 80
	stxa	%l0,[%i3+0x018]%asi	! Mem[00000000100c1418] = 000000000000ffff

p0_label_34:
!	Mem[0000000030141410] = 51861335, %l5 = ffffffffffffff45
	ldstuba	[%i5+%o5]0x89,%l5	! %l5 = 00000035000000ff
!	%l7 = 000000000000007d, Mem[0000000010181402] = 2a00b638
	sth	%l7,[%i6+0x002]		! Mem[0000000010181400] = 2a00007d
!	Mem[0000000010041410] = e57bb2c1, %l7 = 000000000000007d
	swapa	[%i1+%o5]0x88,%l7	! %l7 = 00000000e57bb2c1
!	%l5 = 0000000000000035, Mem[0000000010081408] = 5570b11d4e701f45
	stxa	%l5,[%i2+%o4]0x80	! Mem[0000000010081408] = 0000000000000035
!	%l6 = c6ffffff, %l7 = e57bb2c1, Mem[00000000100c1400] = 88731704 61e1ffff
	stda	%l6,[%i3+%g0]0x80	! Mem[00000000100c1400] = c6ffffff e57bb2c1
!	%l6 = c6ffffff, %l7 = e57bb2c1, Mem[0000000010101408] = f0650335 af3031f1
	stda	%l6,[%i4+%o4]0x88	! Mem[0000000010101408] = c6ffffff e57bb2c1
!	Mem[0000000010001400] = 451f004e, %l3 = 659be073138969d1
	ldstuba	[%i0+%g0]0x80,%l3	! %l3 = 00000045000000ff
!	%f22 = 350365f0 35030000, %l7 = 00000000e57bb2c1
!	Mem[0000000030181428] = 882367948ff8f0ff
	add	%i6,0x028,%g1
	stda	%f22,[%g1+%l7]ASI_PST32_S ! Mem[0000000030181428] = 8823679435030000
!	Mem[0000000010101414] = d478c577, %l1 = 0000000000000055, %asi = 80
	swapa	[%i4+0x014]%asi,%l1	! %l1 = 00000000d478c577
!	Starting 10 instruction Load Burst
!	Mem[0000000010181430] = 9685a354, %l3 = 0000000000000045
	ldswa	[%i6+0x030]%asi,%l3	! %l3 = ffffffff9685a354

p0_label_35:
!	Mem[0000000010101410] = 6c000000, %f7  = 8271dc6d
	lda	[%i4+%o5]0x80,%f7 	! %f7 = 6c000000
!	Mem[0000000030081408] = 0bc50318, %l7 = 00000000e57bb2c1
	lduwa	[%i2+%o4]0x89,%l7	! %l7 = 000000000bc50318
!	%f26 = fff0f88f, %f4  = 558bf3ff
	fcmps	%fcc2,%f26,%f4 		! %fcc2 = 3
!	Mem[0000000010041408] = c6cacad0, %l0 = 000000000000ffff
	ldswa	[%i1+%o4]0x80,%l0	! %l0 = ffffffffc6cacad0
!	Mem[00000000100c1400] = ffffffc6, %l3 = ffffffff9685a354
	ldswa	[%i3+%g0]0x88,%l3	! %l3 = ffffffffffffffc6
!	Mem[0000000010041408] = d0cacac6, %f17 = 138969d1
	lda	[%i1+%o4]0x88,%f17	! %f17 = d0cacac6
!	Mem[0000000030041410] = e78090ff, %l3 = ffffffffffffffc6
	ldsha	[%i1+%o5]0x89,%l3	! %l3 = ffffffffffff90ff
!	Mem[0000000010181400] = 7d00002a, %l2 = 000000000000006d
	lduba	[%i6+%g0]0x88,%l2	! %l2 = 000000000000002a
!	Mem[00000000100c1400] = c6ffffff, %l1 = 00000000d478c577
	lduba	[%i3+%g0]0x80,%l1	! %l1 = 00000000000000c6
!	Starting 10 instruction Store Burst
!	%l6 = ffffffffc6ffffff, Mem[00000000300c1408] = 61000000
	stha	%l6,[%i3+%o4]0x81	! Mem[00000000300c1408] = ffff0000

p0_label_36:
!	%l1 = 00000000000000c6, Mem[00000000300c1408] = ffff0000fff38b55
	stxa	%l1,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00000000000000c6
!	%l1 = 00000000000000c6, Mem[00000000100c1408] = 4618ae65
	stba	%l1,[%i3+%o4]0x88	! Mem[00000000100c1408] = 4618aec6
!	%l6 = ffffffffc6ffffff, Mem[0000000010181410] = c6ffffff
	stha	%l6,[%i6+%o5]0x80	! Mem[0000000010181410] = ffffffff
!	%l3 = ffffffffffff90ff, Mem[00000000100c1400] = ffffffc6
	stwa	%l3,[%i3+%g0]0x88	! Mem[00000000100c1400] = ffff90ff
!	%l2 = 0000002a, %l3 = ffff90ff, Mem[00000000300c1408] = 00000000 000000c6
	stda	%l2,[%i3+%o4]0x81	! Mem[00000000300c1408] = 0000002a ffff90ff
!	%l2 = 000000000000002a, Mem[00000000201c0000] = ffb78a5f
	sth	%l2,[%o0+%g0]		! Mem[00000000201c0000] = 002a8a5f
!	%f8  = 7db8a8fe 14ef7179, Mem[0000000010101418] = f1dae902 8e1de161
	std	%f8 ,[%i4+0x018]	! Mem[0000000010101418] = 7db8a8fe 14ef7179
!	%f10 = 6ddc7182, Mem[0000000010141400] = eca4f0ff
	sta	%f10,[%i5+%g0]0x88	! Mem[0000000010141400] = 6ddc7182
!	%f28 = bd000000 ea03c50b, Mem[0000000030001410] = 00000000 d1000000
	stda	%f28,[%i0+%o5]0x89	! Mem[0000000030001410] = bd000000 ea03c50b
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = 138969ff, %l1 = 00000000000000c6
	lduha	[%i6+%g0]0x89,%l1	! %l1 = 00000000000069ff

p0_label_37:
!	Mem[0000000020800000] = ff455afb, %l5 = 0000000000000035
	ldsh	[%o1+%g0],%l5		! %l5 = ffffffffffffff45
!	Mem[00000000201c0000] = 002a8a5f, %l1 = 00000000000069ff
	ldsha	[%o0+0x000]%asi,%l1	! %l1 = 000000000000002a
!	Mem[0000000010141410] = 8df9b91b dcf438ff, %l0 = c6cacad0, %l1 = 0000002a
	ldda	[%i5+%o5]0x88,%l0	! %l0 = 00000000dcf438ff 000000008df9b91b
!	Mem[0000000010001434] = 605aab5c, %l3 = ffffffffffff90ff
	ldub	[%i0+0x035],%l3		! %l3 = 000000000000005a
!	Mem[00000000211c0000] = ffff6217, %l5 = ffffffffffffff45
	ldsh	[%o2+%g0],%l5		! %l5 = ffffffffffffffff
!	Mem[00000000100c1400] = ffff90ff, %l2 = 000000000000002a
	lduha	[%i3+%g0]0x88,%l2	! %l2 = 00000000000090ff
!	Mem[0000000010081410] = 2afb00003d60a266, %f16 = 659be073 d0cacac6
	ldda	[%i2+%o5]0x80,%f16	! %f16 = 2afb0000 3d60a266
!	Mem[0000000030181410] = 45c503ea, %l4 = fffffffffffffff0
	ldswa	[%i6+%o5]0x81,%l4	! %l4 = 0000000045c503ea
!	Mem[0000000030001410] = 0bc503ea 000000bd, %l0 = dcf438ff, %l1 = 8df9b91b
	ldda	[%i0+%o5]0x81,%l0	! %l0 = 000000000bc503ea 00000000000000bd
!	Starting 10 instruction Store Burst
!	%l3 = 000000000000005a, Mem[00000000100c142c] = 0deee902
	stw	%l3,[%i3+0x02c]		! Mem[00000000100c142c] = 0000005a

p0_label_38:
!	%f22 = 350365f0 35030000, Mem[0000000010081400] = ff1a1120 8abf9df2
	stda	%f22,[%i2+%g0]0x88	! Mem[0000000010081400] = 350365f0 35030000
!	%f28 = bd000000 ea03c50b, Mem[0000000010081438] = c86f6dfa ae1cdcd0
	std	%f28,[%i2+0x038]	! Mem[0000000010081438] = bd000000 ea03c50b
!	%l2 = 00000000000090ff, Mem[0000000010001408] = ec3ae007
	stha	%l2,[%i0+%o4]0x80	! Mem[0000000010001408] = 90ffe007
!	%f24 = a2d90de9 5dd135f3, %l1 = 00000000000000bd
!	Mem[0000000030041428] = bae226e594672388
	add	%i1,0x028,%g1
	stda	%f24,[%g1+%l1]ASI_PST32_S ! Mem[0000000030041428] = bae226e55dd135f3
!	%l6 = ffffffffc6ffffff, Mem[0000000030081410] = 0bc503ea350365f0
	stxa	%l6,[%i2+%o5]0x89	! Mem[0000000030081410] = ffffffffc6ffffff
!	Mem[00000000300c1408] = 0000002a, %l2 = 00000000000090ff
	swapa	[%i3+%o4]0x81,%l2	! %l2 = 000000000000002a
!	Mem[000000001008142c] = 810ff2fb, %l2 = 0000002a, %l4 = 45c503ea
	add	%i2,0x2c,%g1
	casa	[%g1]0x80,%l2,%l4	! %l4 = 00000000810ff2fb
!	%f10 = 6ddc7182 7487e36b, %l1 = 00000000000000bd
!	Mem[0000000030081430] = bd000000ea03c50b
	add	%i2,0x030,%g1
	stda	%f10,[%g1+%l1]ASI_PST32_SL ! Mem[0000000030081430] = 6be38774ea03c50b
!	Mem[0000000010001408] = 90ffe007, %l3 = 000000000000005a
	ldstuba	[%i0+%o4]0x80,%l3	! %l3 = 00000090000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = c6ffffff, %l2 = 000000000000002a
	ldsba	[%i4+%o4]0x88,%l2	! %l2 = ffffffffffffffff

p0_label_39:
!	Mem[0000000030001408] = 0bc503ea350365f0, %l6 = ffffffffc6ffffff
	ldxa	[%i0+%o4]0x81,%l6	! %l6 = 0bc503ea350365f0
!	Mem[0000000010181400] = 2a00007d972211f2, %l7 = 000000000bc50318
	ldxa	[%i6+%g0]0x80,%l7	! %l7 = 2a00007d972211f2
!	Mem[00000000100c1414] = e57bb2c1, %l6 = 0bc503ea350365f0
	ldsb	[%i3+0x015],%l6		! %l6 = 000000000000007b
!	Mem[0000000010141410] = ff38f4dc1bb9f98d, %l5 = ffffffffffffffff
	ldx	[%i5+%o5],%l5		! %l5 = ff38f4dc1bb9f98d
!	Mem[0000000030141408] = 04177388, %l1 = 00000000000000bd
	lduha	[%i5+%o4]0x81,%l1	! %l1 = 0000000000000417
!	Mem[0000000010041428] = 6be387748271dc6d, %f8  = 7db8a8fe 14ef7179
	ldda	[%i1+0x028]%asi,%f8 	! %f8  = 6be38774 8271dc6d
!	Mem[000000001010142c] = 7487e36b, %l2 = ffffffffffffffff
	ldswa	[%i4+0x02c]%asi,%l2	! %l2 = 000000007487e36b
!	Mem[0000000030181410] = 45c503ea, %f26 = fff0f88f
	lda	[%i6+%o5]0x81,%f26	! %f26 = 45c503ea
!	Mem[0000000010181408] = 8ff8f0ff, %f19 = abf0a4ec
	lda	[%i6+%o4]0x88,%f19	! %f19 = 8ff8f0ff
!	Starting 10 instruction Store Burst
!	%l3 = 0000000000000090, Mem[0000000030101410] = fff0a4ec
	stwa	%l3,[%i4+%o5]0x81	! Mem[0000000030101410] = 00000090

p0_label_40:
!	Mem[0000000010141408] = 659be073, %l2 = 000000007487e36b
	swapa	[%i5+%o4]0x80,%l2	! %l2 = 00000000659be073
!	Mem[00000000201c0001] = 002a8a5f, %l2 = 00000000659be073
	ldstuba	[%o0+0x001]%asi,%l2	! %l2 = 0000002a000000ff
!	Mem[0000000010081400] = 00000335, %l6 = 000000000000007b, %asi = 80
	swapa	[%i2+0x000]%asi,%l6	! %l6 = 0000000000000335
!	Mem[0000000010001410] = 000000ff, %l0 = 000000000bc503ea
	ldstuba	[%i0+%o5]0x80,%l0	! %l0 = 00000000000000ff
!	%l0 = 00000000, %l1 = 00000417, Mem[0000000030181408] = fea8b87d 04177388
	stda	%l0,[%i6+%o4]0x89	! Mem[0000000030181408] = 00000000 00000417
!	%f14 = ffffffc6 d046c574, %l2 = 000000000000002a
!	Mem[0000000010041430] = dcf438ffa2d90de9
	add	%i1,0x030,%g1
	stda	%f14,[%g1+%l2]ASI_PST32_PL ! Mem[0000000010041430] = dcf438ffc6ffffff
!	Mem[000000001014143d] = 2ea0965c, %l5 = ff38f4dc1bb9f98d
	ldstuba	[%i5+0x03d]%asi,%l5	! %l5 = 000000a0000000ff
!	Mem[0000000010001420] = f218444f, %l2 = 0000002a, %l5 = 000000a0
	add	%i0,0x20,%g1
	casa	[%g1]0x80,%l2,%l5	! %l5 = 00000000f218444f
!	%l6 = 0000000000000335, Mem[00000000100c1400] = ffff90ff
	stha	%l6,[%i3+%g0]0x88	! Mem[00000000100c1400] = ffff0335
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = ff38f4dc1bb9f98d, %l2 = 000000000000002a
	ldxa	[%i5+%o5]0x80,%l2	! %l2 = ff38f4dc1bb9f98d

p0_label_41:
!	Mem[00000000100c1400] = ffff0335, %l6 = 0000000000000335
	ldswa	[%i3+%g0]0x88,%l6	! %l6 = ffffffffffff0335
!	Mem[00000000300c1408] = 000090ff, %l5 = 00000000f218444f
	lduwa	[%i3+%o4]0x81,%l5	! %l5 = 00000000000090ff
!	Mem[0000000010101410] = 0000006c, %f7  = 6c000000
	lda	[%i4+%o5]0x88,%f7 	! %f7 = 0000006c
!	Mem[0000000010181410] = ffffffff, %l0 = 0000000000000000
	lduha	[%i6+%o5]0x80,%l0	! %l0 = 000000000000ffff
!	Mem[0000000030181410] = 45c503ea, %f0  = c4b07af0
	lda	[%i6+%o5]0x81,%f0 	! %f0 = 45c503ea
!	Mem[0000000010101410] = 550000000000006c, %f0  = 45c503ea 9720c804
	ldda	[%i4+%o5]0x88,%f0 	! %f0  = 55000000 0000006c
!	Mem[0000000030081400] = 659be073, %l0 = 000000000000ffff
	lduwa	[%i2+%g0]0x81,%l0	! %l0 = 00000000659be073
!	Mem[0000000010081408] = 00000000, %l0 = 00000000659be073
	lduha	[%i2+%o4]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000010081400] = 0000007bf0650335, %l1 = 0000000000000417
	ldx	[%i2+%g0],%l1		! %l1 = 0000007bf0650335
!	Starting 10 instruction Store Burst
!	%f14 = ffffffc6, Mem[0000000030001400] = 99af98c6
	sta	%f14,[%i0+%g0]0x89	! Mem[0000000030001400] = ffffffc6

p0_label_42:
!	Mem[0000000030141408] = 88731704, %l3 = 0000000000000090
	ldstuba	[%i5+%o4]0x89,%l3	! %l3 = 00000004000000ff
!	%l0 = 0000000000000000, Mem[00000000300c1410] = 74c546d0
	stwa	%l0,[%i3+%o5]0x81	! Mem[00000000300c1410] = 00000000
!	%l5 = 00000000000090ff, Mem[000000001018142a] = 8813d4f4, %asi = 80
	stha	%l5,[%i6+0x02a]%asi	! Mem[0000000010181428] = 881390ff
!	Mem[00000000100c1408] = c6ae1846, %l1 = 0000007bf0650335
	swapa	[%i3+%o4]0x80,%l1	! %l1 = 00000000c6ae1846
!	%l7 = 2a00007d972211f2, Mem[0000000010181410] = ffffffff5970da0e
	stxa	%l7,[%i6+%o5]0x80	! Mem[0000000010181410] = 2a00007d972211f2
!	Mem[0000000010041430] = dcf438ffc6ffffff, %l7 = 2a00007d972211f2, %l1 = 00000000c6ae1846
	add	%i1,0x30,%g1
	casxa	[%g1]0x80,%l7,%l1	! %l1 = dcf438ffc6ffffff
!	Mem[00000000100c1410] = fff3dfb6, %l2 = ff38f4dc1bb9f98d
	ldstuba	[%i3+%o5]0x88,%l2	! %l2 = 000000b6000000ff
!	%l3 = 0000000000000004, Mem[0000000010001408] = ffffe007
	stha	%l3,[%i0+%o4]0x80	! Mem[0000000010001408] = 0004e007
!	Mem[0000000030181410] = ea03c545, %l3 = 0000000000000004
	ldstuba	[%i6+%o5]0x89,%l3	! %l3 = 00000045000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = c1b27be5 8ff8f0ff, %l0 = 00000000, %l1 = c6ffffff
	ldda	[%i6+%o4]0x88,%l0	! %l0 = 000000008ff8f0ff 00000000c1b27be5

p0_label_43:
!	Mem[0000000030081400] = 659be073, %l7 = 2a00007d972211f2
	lduba	[%i2+%g0]0x81,%l7	! %l7 = 0000000000000065
!	Mem[0000000010001400] = ff1f004e, %l5 = 00000000000090ff
	ldswa	[%i0+%g0]0x80,%l5	! %l5 = ffffffffff1f004e
!	Mem[0000000030181410] = ffc503ea, %l5 = ffffffffff1f004e
	ldsba	[%i6+%o5]0x81,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000030181408] = 0000041700000000, %f4  = 558bf3ff e57bb2c1
	ldda	[%i6+%o4]0x89,%f4 	! %f4  = 00000417 00000000
!	Mem[00000000201c0000] = 00ff8a5f, %l2 = 00000000000000b6
	ldsba	[%o0+0x001]%asi,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000010001410] = ff0000ff, %l7 = 0000000000000065
	ldsba	[%i0+%o5]0x88,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000030001410] = 0bc503ea, %l1 = 00000000c1b27be5
	lduwa	[%i0+%o5]0x81,%l1	! %l1 = 000000000bc503ea
!	Mem[0000000010181410] = f2112297 7d00002a, %l4 = 810ff2fb, %l5 = ffffffff
	ldda	[%i6+%o5]0x88,%l4	! %l4 = 000000007d00002a 00000000f2112297
!	Mem[0000000010101400] = 6b9370f9, %f13 = ff38f4dc
	ld	[%i4+%g0],%f13	! %f13 = 6b9370f9
!	Starting 10 instruction Store Burst
!	%l2 = ffffffff, %l3 = 00000045, Mem[0000000010181408] = fff0f88f e57bb2c1
	std	%l2,[%i6+%o4]		! Mem[0000000010181408] = ffffffff 00000045

p0_label_44:
!	%l6 = ffff0335, %l7 = ffffffff, Mem[0000000010001400] = 4e001fff fbece2be
	stda	%l6,[%i0+%g0]0x88	! Mem[0000000010001400] = ffff0335 ffffffff
!	%f11 = 7487e36b, Mem[000000001010143c] = 4164c439
	sta	%f11,[%i4+0x03c]%asi	! Mem[000000001010143c] = 7487e36b
!	%f6  = f0650335 0000006c, Mem[0000000010001410] = ff0000ff 7b99f878
	stda	%f6 ,[%i0+%o5]0x80	! Mem[0000000010001410] = f0650335 0000006c
!	%l4 = 000000007d00002a, Mem[0000000030001400] = c6ffffff4de3b6a8
	stxa	%l4,[%i0+%g0]0x81	! Mem[0000000030001400] = 000000007d00002a
!	Mem[0000000030001408] = 0bc503ea, %l2 = ffffffffffffffff
	swapa	[%i0+%o4]0x81,%l2	! %l2 = 000000000bc503ea
!	%l7 = ffffffffffffffff, Mem[00000000100c1410] = ffdff3ff
	stwa	%l7,[%i3+%o5]0x80	! Mem[00000000100c1410] = ffffffff
!	Mem[0000000010101408] = ffffffc6, %l5 = 00000000f2112297
	swapa	[%i4+%o4]0x80,%l5	! %l5 = 00000000ffffffc6
!	%l2 = 000000000bc503ea, Mem[0000000030041410] = fffe3913e78090ff
	stxa	%l2,[%i1+%o5]0x89	! Mem[0000000030041410] = 000000000bc503ea
!	Mem[0000000010101410] = 6c000000, %l1 = 000000000bc503ea
	swapa	[%i4+%o5]0x80,%l1	! %l1 = 000000006c000000
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = 00ff8a5f, %l6 = ffffffffffff0335
	lduha	[%o0+0x000]%asi,%l6	! %l6 = 00000000000000ff

p0_label_45:
!	Mem[0000000030001400] = 00000000, %f8  = 6be38774
	lda	[%i0+%g0]0x89,%f8 	! %f8 = 00000000
!	Mem[0000000030081400] = 659be073 138969d1, %l0 = 8ff8f0ff, %l1 = 6c000000
	ldda	[%i2+%g0]0x81,%l0	! %l0 = 00000000659be073 00000000138969d1
!	Mem[00000000300c1408] = ff900000, %l4 = 000000007d00002a
	lduba	[%i3+%o4]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000010181408] = ffffffff, %f15 = d046c574
	lda	[%i6+%o4]0x80,%f15	! %f15 = ffffffff
!	Mem[0000000010101410] = 0bc503ea00000055, %f28 = bd000000 ea03c50b
	ldda	[%i4+%o5]0x80,%f28	! %f28 = 0bc503ea 00000055
!	Mem[00000000300c1400] = 8ff8f0ff, %l6 = 00000000000000ff
	ldsba	[%i3+%g0]0x89,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010101400] = 6b9370f9b2e29e30, %f10 = 6ddc7182 7487e36b
	ldd	[%i4+%g0],%f10		! %f10 = 6b9370f9 b2e29e30
!	Mem[00000000100c141c] = 0000ffff, %f29 = 00000055
	ld	[%i3+0x01c],%f29	! %f29 = 0000ffff
!	Mem[0000000030001408] = ffffffff 350365f0, %l6 = ffffffff, %l7 = ffffffff
	ldda	[%i0+%o4]0x81,%l6	! %l6 = 00000000ffffffff 00000000350365f0
!	Starting 10 instruction Store Burst
!	%l6 = 00000000ffffffff, Mem[0000000010181410] = 2a00007d
	stha	%l6,[%i6+%o5]0x80	! Mem[0000000010181410] = ffff007d

p0_label_46:
!	Mem[00000000211c0000] = ffff6217, %l4 = 0000000000000000
	ldstub	[%o2+%g0],%l4		! %l4 = 000000ff000000ff
!	%l2 = 000000000bc503ea, Mem[00000000300c1410] = ffffffc600000000
	stxa	%l2,[%i3+%o5]0x89	! Mem[00000000300c1410] = 000000000bc503ea
!	%l0 = 659be073, %l1 = 138969d1, Mem[00000000100c1410] = ffffffff e57bb2c1
	stda	%l0,[%i3+%o5]0x80	! Mem[00000000100c1410] = 659be073 138969d1
!	%l4 = 00000000000000ff, Mem[0000000030001400] = 00000000
	stwa	%l4,[%i0+%g0]0x81	! Mem[0000000030001400] = 000000ff
!	%f2  = 659be073, Mem[0000000030001410] = 0bc503ea
	sta	%f2 ,[%i0+%o5]0x81	! Mem[0000000030001410] = 659be073
!	%l0 = 00000000659be073, Mem[0000000010081428] = 4d6791ca810ff2fb
	stx	%l0,[%i2+0x028]		! Mem[0000000010081428] = 00000000659be073
!	%f30 = fbece2be 4e701f45, Mem[0000000010101410] = ea03c50b 55000000
	stda	%f30,[%i4+%o5]0x88	! Mem[0000000010101410] = fbece2be 4e701f45
!	%f11 = b2e29e30, Mem[0000000030101400] = 07e03aec
	sta	%f11,[%i4+%g0]0x81	! Mem[0000000030101400] = b2e29e30
!	%l2 = 0bc503ea, %l3 = 00000045, Mem[00000000300c1408] = 000090ff ffff90ff
	stda	%l2,[%i3+%o4]0x81	! Mem[00000000300c1408] = 0bc503ea 00000045
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = 0000007d, %l4 = 00000000000000ff
	lduwa	[%i1+%o5]0x88,%l4	! %l4 = 000000000000007d

p0_label_47:
!	Mem[00000000100c1428] = ccaa81680000005a, %l5 = 00000000ffffffc6
	ldxa	[%i3+0x028]%asi,%l5	! %l5 = ccaa81680000005a
!	Mem[0000000010141400] = 8271dc6d 000000f9, %l2 = 0bc503ea, %l3 = 00000045
	ldda	[%i5+%g0]0x80,%l2	! %l2 = 000000008271dc6d 00000000000000f9
!	Mem[0000000010141408] = d16989136be38774, %f14 = ffffffc6 ffffffff
	ldda	[%i5+%o4]0x88,%f14	! %f14 = d1698913 6be38774
!	Mem[00000000300c1400] = 8ff8f0ff, %l4 = 000000000000007d
	lduha	[%i3+%g0]0x89,%l4	! %l4 = 000000000000f0ff
!	Mem[0000000030041410] = ea03c50b, %l4 = 000000000000f0ff
	lduha	[%i1+%o5]0x81,%l4	! %l4 = 000000000000ea03
!	Mem[0000000010101400] = 6b9370f9 b2e29e30, %l2 = 8271dc6d, %l3 = 000000f9
	ldda	[%i4+0x000]%asi,%l2	! %l2 = 000000006b9370f9 00000000b2e29e30
!	Mem[0000000010041408] = c6cacad0, %l7 = 00000000350365f0
	lduwa	[%i1+%o4]0x80,%l7	! %l7 = 00000000c6cacad0
!	Mem[0000000010141408] = 7487e36b 138969d1, %l4 = 0000ea03, %l5 = 0000005a
	ldda	[%i5+%o4]0x80,%l4	! %l4 = 000000007487e36b 00000000138969d1
!	Mem[0000000010081400] = 350365f07b000000, %l7 = 00000000c6cacad0
	ldxa	[%i2+%g0]0x88,%l7	! %l7 = 350365f07b000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010181434] = 000000bd, %l3 = 00000000b2e29e30
	ldstuba	[%i6+0x034]%asi,%l3	! %l3 = 00000000000000ff

p0_label_48:
!	%f18 = 1803c50b 8ff8f0ff, %l0 = 00000000659be073
!	Mem[0000000030141418] = 2c29b42fdaecdf4c
	add	%i5,0x018,%g1
	stda	%f18,[%g1+%l0]ASI_PST16_S ! Mem[0000000030141418] = 2c29b42f8ff8f0ff
!	%f16 = 2afb0000 3d60a266 1803c50b 8ff8f0ff
!	%f20 = f0650335 ea03c50b 350365f0 35030000
!	%f24 = a2d90de9 5dd135f3 45c503ea 94672388
!	%f28 = 0bc503ea 0000ffff fbece2be 4e701f45
	stda	%f16,[%i5]ASI_COMMIT_P	! Block Store to 0000000010141400
!	Mem[000000001008142c] = 659be073, %l5 = 138969d1, %l2 = 6b9370f9
	add	%i2,0x2c,%g1
	casa	[%g1]0x80,%l5,%l2	! %l2 = 00000000659be073
!	%f12 = e90dd9a2 6b9370f9, Mem[0000000010181400] = 2a00007d 972211f2
	stda	%f12,[%i6+0x000]%asi	! Mem[0000000010181400] = e90dd9a2 6b9370f9
	membar	#Sync			! Added by membar checker (6)
!	%l0 = 659be073, %l1 = 138969d1, Mem[0000000010141408] = 0bc50318 fff0f88f
	stda	%l0,[%i5+%o4]0x88	! Mem[0000000010141408] = 659be073 138969d1
!	%l2 = 00000000659be073, Mem[0000000030101408] = 02b07af0
	stha	%l2,[%i4+%o4]0x81	! Mem[0000000030101408] = e0737af0
!	Mem[00000000100c1408] = f0650335, %l6 = 00000000ffffffff
	swapa	[%i3+%o4]0x80,%l6	! %l6 = 00000000f0650335
!	Mem[00000000100c1434] = b973a44a, %l6 = 00000000f0650335
	ldstub	[%i3+0x034],%l6		! %l6 = 000000b9000000ff
!	%l4 = 7487e36b, %l5 = 138969d1, Mem[0000000010181400] = e90dd9a2 6b9370f9
	std	%l4,[%i6+%g0]		! Mem[0000000010181400] = 7487e36b 138969d1
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = 350365f07b000000, %f20 = f0650335 ea03c50b
	ldda	[%i2+%g0]0x88,%f20	! %f20 = 350365f0 7b000000

p0_label_49:
!	Mem[00000000300c1408] = 0bc503ea00000045, %l1 = 00000000138969d1
	ldxa	[%i3+%o4]0x81,%l1	! %l1 = 0bc503ea00000045
!	Mem[0000000030141408] = ff177388, %l7 = 350365f07b000000
	ldswa	[%i5+%o4]0x81,%l7	! %l7 = ffffffffff177388
!	Mem[0000000030001400] = ff000000, %l5 = 00000000138969d1
	lduha	[%i0+%g0]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000030181400] = 138969ff, %l1 = 0bc503ea00000045
	ldswa	[%i6+%g0]0x89,%l1	! %l1 = 00000000138969ff
!	Mem[0000000010101400] = f970936b, %l2 = 00000000659be073
	ldsba	[%i4+%g0]0x88,%l2	! %l2 = 000000000000006b
!	Mem[0000000010141400] = 2afb0000, %l7 = ffffffffff177388
	ldswa	[%i5+%g0]0x80,%l7	! %l7 = 000000002afb0000
!	Mem[00000000100c1410] = 659be073, %l1 = 00000000138969ff
	ldsba	[%i3+0x011]%asi,%l1	! %l1 = ffffffffffffff9b
!	Mem[0000000010181410] = ffff007d, %l0 = 00000000659be073
	lduwa	[%i6+%o5]0x80,%l0	! %l0 = 00000000ffff007d
!	Mem[00000000300c1408] = 0bc503ea, %l4 = 000000007487e36b
	ldsba	[%i3+%o4]0x81,%l4	! %l4 = 000000000000000b
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1410] = ea03c50b, %l7 = 000000002afb0000
	ldstuba	[%i3+%o5]0x81,%l7	! %l7 = 000000ea000000ff

p0_label_50:
!	%l6 = 000000b9, %l7 = 000000ea, Mem[0000000030181410] = ffc503ea 350365f0
	stda	%l6,[%i6+%o5]0x81	! Mem[0000000030181410] = 000000b9 000000ea
!	%l0 = 00000000ffff007d, Mem[0000000010101408] = e57bb2c1972211f2
	stxa	%l0,[%i4+%o4]0x88	! Mem[0000000010101408] = 00000000ffff007d
!	Mem[00000000201c0000] = 00ff8a5f, %l3 = 0000000000000000
	ldstuba	[%o0+0x000]%asi,%l3	! %l3 = 00000000000000ff
!	%l5 = 0000000000000000, Mem[00000000100c140c] = 02e9ee0d, %asi = 80
	stha	%l5,[%i3+0x00c]%asi	! Mem[00000000100c140c] = 0000ee0d
!	%f28 = 0bc503ea 0000ffff, Mem[0000000010041418] = 0bc503ea 350365f0
	std	%f28,[%i1+0x018]	! Mem[0000000010041418] = 0bc503ea 0000ffff
!	Mem[00000000100c141c] = 0000ffff, %l7 = 00000000000000ea
	ldstuba	[%i3+0x01c]%asi,%l7	! %l7 = 00000000000000ff
!	%l7 = 0000000000000000, Mem[0000000010101418] = 7db8a8fe, %asi = 80
	stwa	%l7,[%i4+0x018]%asi	! Mem[0000000010101418] = 00000000
!	%l5 = 0000000000000000, Mem[00000000100c1408] = ffffffff0000ee0d
	stx	%l5,[%i3+%o4]		! Mem[00000000100c1408] = 0000000000000000
!	Mem[0000000010041408] = d0cacac6, %l0 = 00000000ffff007d
	ldstuba	[%i1+%o4]0x88,%l0	! %l0 = 000000c6000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = ff177388, %l1 = ffffffffffffff9b
	ldsba	[%i5+%o4]0x81,%l1	! %l1 = ffffffffffffffff

p0_label_51:
!	Mem[000000001008140c] = 00000035, %l7 = 0000000000000000
	ldsb	[%i2+0x00e],%l7		! %l7 = 0000000000000000
!	Mem[0000000030181400] = 659be073138969ff, %l4 = 000000000000000b
	ldxa	[%i6+%g0]0x89,%l4	! %l4 = 659be073138969ff
!	Mem[0000000010101408] = 00000000 ffff007d, %l0 = 000000c6, %l1 = ffffffff
	ldda	[%i4+%o4]0x88,%l0	! %l0 = 00000000ffff007d 0000000000000000
!	Mem[0000000010141410] = 350365f0, %f20 = 350365f0
	lda	[%i5+%o5]0x88,%f20	! %f20 = 350365f0
!	Mem[0000000030041408] = ff0073b9, %l6 = 00000000000000b9
	ldsha	[%i1+%o4]0x81,%l6	! %l6 = ffffffffffffff00
!	Mem[0000000010041410] = 7d000000, %l7 = 0000000000000000
	lduba	[%i1+%o5]0x80,%l7	! %l7 = 000000000000007d
!	Mem[0000000010181434] = ff0000bd, %l0 = 00000000ffff007d
	lduha	[%i6+0x036]%asi,%l0	! %l0 = 00000000000000bd
!	Mem[0000000010041400] = 04c82097, %l3 = 0000000000000000
	ldsha	[%i1+%g0]0x80,%l3	! %l3 = 00000000000004c8
!	Mem[0000000010001420] = f218444f, %l0 = 00000000000000bd
	lduh	[%i0+0x022],%l0		! %l0 = 000000000000444f
!	Starting 10 instruction Store Burst
!	Mem[00000000201c0001] = ffff8a5f, %l7 = 000000000000007d
	ldstuba	[%o0+0x001]%asi,%l7	! %l7 = 000000ff000000ff

p0_label_52:
!	Mem[0000000020800041] = ffff8327, %l6 = ffffffffffffff00
	ldstub	[%o1+0x041],%l6		! %l6 = 000000ff000000ff
!	Mem[0000000010181420] = 916a153e, %l7 = 00000000000000ff, %asi = 80
	swapa	[%i6+0x020]%asi,%l7	! %l7 = 00000000916a153e
!	Mem[0000000010181408] = ffffffff, %l3 = 00000000000004c8
	ldstuba	[%i6+%o4]0x88,%l3	! %l3 = 000000ff000000ff
!	%l7 = 00000000916a153e, Mem[00000000100c1400] = 3503ffff
	stba	%l7,[%i3+%g0]0x80	! Mem[00000000100c1400] = 3e03ffff
!	Mem[0000000030001408] = ffffffff, %l5 = 0000000000000000
	swapa	[%i0+%o4]0x81,%l5	! %l5 = 00000000ffffffff
!	Mem[00000000100c1400] = ffff033e, %l1 = 0000000000000000
	ldstuba	[%i3+%g0]0x88,%l1	! %l1 = 0000003e000000ff
!	%f16 = 2afb0000 3d60a266, Mem[0000000010041408] = d0cacaff 659be073
	stda	%f16,[%i1+%o4]0x88	! Mem[0000000010041408] = 2afb0000 3d60a266
!	%l4 = 138969ff, %l5 = ffffffff, Mem[0000000010001400] = ffff0335 ffffffff
	stda	%l4,[%i0+%g0]0x88	! Mem[0000000010001400] = 138969ff ffffffff
!	Mem[0000000030041400] = 00000039, %l5 = 00000000ffffffff
	swapa	[%i1+%g0]0x81,%l5	! %l5 = 0000000000000039
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = 0000fb2a, %f16 = 2afb0000
	lda	[%i5+%g0]0x88,%f16	! %f16 = 0000fb2a

p0_label_53:
!	Mem[0000000010181410] = ffff007d, %l0 = 000000000000444f
	lduha	[%i6+%o5]0x80,%l0	! %l0 = 000000000000ffff
!	Mem[00000000211c0000] = ffff6217, %l0 = 000000000000ffff
	ldsb	[%o2+%g0],%l0		! %l0 = ffffffffffffffff
!	Mem[0000000010001408] = 07e00400, %l7 = 00000000916a153e
	ldswa	[%i0+%o4]0x88,%l7	! %l7 = 0000000007e00400
!	Mem[0000000010001408] = 0004e007, %l4 = 659be073138969ff
	ldsw	[%i0+%o4],%l4		! %l4 = 000000000004e007
!	Mem[0000000030001408] = 00000000, %l1 = 000000000000003e
	lduba	[%i0+%o4]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000030081400] = 73e09b65, %l6 = 00000000000000ff
	lduba	[%i2+%g0]0x89,%l6	! %l6 = 0000000000000065
!	Mem[00000000100c1410] = 659be073, %l5 = 0000000000000039
	ldsba	[%i3+%o5]0x80,%l5	! %l5 = 0000000000000065
!	Mem[0000000030181400] = ff698913, %f23 = 35030000
	lda	[%i6+%g0]0x81,%f23	! %f23 = ff698913
!	Mem[0000000030081408] = 0bc50318, %l7 = 0000000007e00400
	lduba	[%i2+%o4]0x89,%l7	! %l7 = 0000000000000018
!	Starting 10 instruction Store Burst
!	%l4 = 0004e007, %l5 = 00000065, Mem[0000000030141408] = 887317ff d193210e
	stda	%l4,[%i5+%o4]0x89	! Mem[0000000030141408] = 0004e007 00000065

p0_label_54:
!	%l5 = 0000000000000065, Mem[0000000010101400] = 309ee2b2f970936b
	stxa	%l5,[%i4+%g0]0x88	! Mem[0000000010101400] = 0000000000000065
!	%l7 = 0000000000000018, Mem[0000000030181408] = 0000000017040000
	stxa	%l7,[%i6+%o4]0x81	! Mem[0000000030181408] = 0000000000000018
!	%f26 = 45c503ea 94672388, %l5 = 0000000000000065
!	Mem[0000000030001428] = 882367948ff8f0ff
	add	%i0,0x028,%g1
	stda	%f26,[%g1+%l5]ASI_PST32_S ! Mem[0000000030001428] = 8823679494672388
!	Mem[00000000300c1400] = 8ff8f0ff, %l3 = 00000000000000ff
	swapa	[%i3+%g0]0x89,%l3	! %l3 = 000000008ff8f0ff
!	Mem[0000000010141410] = f0650335ea03c50b, %l2 = 000000000000006b, %l7 = 0000000000000018
	add	%i5,0x10,%g1
	casxa	[%g1]0x80,%l2,%l7	! %l7 = f0650335ea03c50b
!	%f6  = f0650335 0000006c, Mem[0000000030181400] = 138969ff 659be073
	stda	%f6 ,[%i6+%g0]0x89	! Mem[0000000030181400] = f0650335 0000006c
!	Mem[0000000010081400] = 7b000000, %l5 = 0000000000000065
	ldstuba	[%i2+%g0]0x88,%l5	! %l5 = 00000000000000ff
!	%l2 = 000000000000006b, Mem[0000000030081410] = ffffffffc6ffffff
	stxa	%l2,[%i2+%o5]0x89	! Mem[0000000030081410] = 000000000000006b
!	%l3 = 000000008ff8f0ff, Mem[0000000010001426] = b0e78089
	stb	%l3,[%i0+0x026]		! Mem[0000000010001424] = b0e7ff89
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = ffffffff, %l0 = ffffffffffffffff
	ldswa	[%i6+%o4]0x80,%l0	! %l0 = ffffffffffffffff

p0_label_55:
!	Mem[0000000010181410] = ffff007d972211f2, %f6  = f0650335 0000006c
	ldda	[%i6+%o5]0x80,%f6 	! %f6  = ffff007d 972211f2
!	Mem[0000000030001400] = 000000ff, %l4 = 000000000004e007
	ldsba	[%i0+%g0]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000030181410] = ea000000 b9000000, %l0 = ffffffff, %l1 = 00000000
	ldda	[%i6+%o5]0x89,%l0	! %l0 = 00000000b9000000 00000000ea000000
!	Mem[0000000030041408] = 91ee73e8 b97300ff, %l0 = b9000000, %l1 = ea000000
	ldda	[%i1+%o4]0x89,%l0	! %l0 = 00000000b97300ff 0000000091ee73e8
!	Mem[00000000100c1434] = ff73a44a, %f18 = 1803c50b
	ld	[%i3+0x034],%f18	! %f18 = ff73a44a
!	Mem[0000000010141410] = 350365f0, %l1 = 0000000091ee73e8
	ldsha	[%i5+%o5]0x88,%l1	! %l1 = 00000000000065f0
!	Mem[0000000030141410] = ff138651 ce321760, %l4 = 00000000, %l5 = 00000000
	ldda	[%i5+%o5]0x81,%l4	! %l4 = 00000000ff138651 00000000ce321760
!	Mem[00000000100c1408] = 00000000, %f10 = 6b9370f9
	lda	[%i3+%o4]0x80,%f10	! %f10 = 00000000
!	Mem[0000000010101400] = 00000065, %l7 = f0650335ea03c50b
	ldsha	[%i4+%g0]0x88,%l7	! %l7 = 0000000000000065
!	Starting 10 instruction Store Burst
!	Mem[0000000010101410] = 4e701f45, %l2 = 000000000000006b
	swapa	[%i4+%o5]0x88,%l2	! %l2 = 000000004e701f45

p0_label_56:
!	Mem[0000000010041418] = 0bc503ea, %l5 = 00000000ce321760, %asi = 80
	swapa	[%i1+0x018]%asi,%l5	! %l5 = 000000000bc503ea
!	%f14 = d1698913 6be38774, Mem[0000000010101400] = 00000065 00000000
	stda	%f14,[%i4+%g0]0x88	! Mem[0000000010101400] = d1698913 6be38774
!	%l0 = 00000000b97300ff, Mem[0000000030101400] = b2e29e305557097f
	stxa	%l0,[%i4+%g0]0x81	! Mem[0000000030101400] = 00000000b97300ff
!	%l3 = 000000008ff8f0ff, Mem[00000000300c1400] = 000000ff
	stha	%l3,[%i3+%g0]0x89	! Mem[00000000300c1400] = 0000f0ff
!	%l4 = 00000000ff138651, Mem[0000000010041408] = 66a2603d
	stba	%l4,[%i1+%o4]0x80	! Mem[0000000010041408] = 51a2603d
!	%f0  = 55000000 0000006c, Mem[0000000030001410] = 73e09b65 bd000000
	stda	%f0 ,[%i0+%o5]0x89	! Mem[0000000030001410] = 55000000 0000006c
!	Mem[0000000010141410] = 350365f0, %l7 = 0000000000000065
	ldstuba	[%i5+%o5]0x88,%l7	! %l7 = 000000f0000000ff
!	%l6 = 0000000000000065, Mem[0000000021800080] = b6a8d810, %asi = 80
	stba	%l6,[%o3+0x080]%asi	! Mem[0000000021800080] = 65a8d810
!	%f21 = 7b000000, Mem[0000000030181410] = b9000000
	sta	%f21,[%i6+%o5]0x89	! Mem[0000000030181410] = 7b000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = ea03c50b00000000, %l5 = 000000000bc503ea
	ldxa	[%i1+%o5]0x81,%l5	! %l5 = ea03c50b00000000

p0_label_57:
!	Mem[00000000100c1400] = ff03ffffe57bb2c1, %l6 = 0000000000000065
	ldxa	[%i3+%g0]0x80,%l6	! %l6 = ff03ffffe57bb2c1
!	Mem[00000000300c1400] = fff00000 482217b6, %l0 = b97300ff, %l1 = 000065f0
	ldda	[%i3+%g0]0x81,%l0	! %l0 = 00000000fff00000 00000000482217b6
!	Mem[0000000010101410] = 6b000000, %l0 = 00000000fff00000
	lduba	[%i4+%o5]0x80,%l0	! %l0 = 000000000000006b
!	Mem[000000001018143c] = a8baaeab, %l5 = ea03c50b00000000
	ldsh	[%i6+0x03e],%l5		! %l5 = ffffffffffffaeab
!	Mem[0000000030101410] = 90000000, %l1 = 00000000482217b6
	ldswa	[%i4+%o5]0x89,%l1	! %l1 = ffffffff90000000
!	Mem[0000000010041438] = 74c546d0c6ffffff, %l4 = 00000000ff138651
	ldx	[%i1+0x038],%l4		! %l4 = 74c546d0c6ffffff
!	Mem[0000000010141430] = 0bc503ea0000ffff, %l1 = ffffffff90000000
	ldx	[%i5+0x030],%l1		! %l1 = 0bc503ea0000ffff
!	Mem[0000000010141400] = 2afb00003d60a266, %f6  = ffff007d 972211f2
	ldda	[%i5+%g0]0x80,%f6 	! %f6  = 2afb0000 3d60a266
!	Mem[0000000030181410] = 0000007b000000ea, %f16 = 0000fb2a 3d60a266
	ldda	[%i6+%o5]0x81,%f16	! %f16 = 0000007b 000000ea
!	Starting 10 instruction Store Burst
!	%l2 = 000000004e701f45, Mem[00000000201c0000] = ffff8a5f, %asi = 80
	stha	%l2,[%o0+0x000]%asi	! Mem[00000000201c0000] = 1f458a5f

p0_label_58:
!	%l6 = ff03ffffe57bb2c1, Mem[0000000010001400] = ff698913
	stba	%l6,[%i0+%g0]0x80	! Mem[0000000010001400] = c1698913
!	%f10 = 00000000 b2e29e30, Mem[0000000030081400] = 659be073 138969d1
	stda	%f10,[%i2+%g0]0x81	! Mem[0000000030081400] = 00000000 b2e29e30
!	%f30 = fbece2be 4e701f45, Mem[0000000010181408] = ffffffff 45000000
	stda	%f30,[%i6+%o4]0x88	! Mem[0000000010181408] = fbece2be 4e701f45
!	Mem[0000000030041410] = ea03c50b, %l2 = 000000004e701f45
	ldstuba	[%i1+%o5]0x81,%l2	! %l2 = 000000ea000000ff
!	Mem[000000001008140c] = 00000035, %l0 = 000000000000006b, %asi = 80
	swapa	[%i2+0x00c]%asi,%l0	! %l0 = 0000000000000035
!	%f31 = 4e701f45, Mem[0000000010041400] = 9720c804
	sta	%f31,[%i1+%g0]0x88	! Mem[0000000010041400] = 4e701f45
!	%f24 = a2d90de9 5dd135f3, Mem[0000000010041430] = dcf438ff c6ffffff
	std	%f24,[%i1+0x030]	! Mem[0000000010041430] = a2d90de9 5dd135f3
!	%l0 = 0000000000000035, Mem[0000000030181408] = 00000000
	stha	%l0,[%i6+%o4]0x81	! Mem[0000000030181408] = 00350000
!	%l5 = ffffffffffffaeab, Mem[0000000030181400] = 0000006c
	stba	%l5,[%i6+%g0]0x89	! Mem[0000000030181400] = 000000ab
!	Starting 10 instruction Load Burst
!	Mem[000000001010140c] = 00000000, %l2 = 00000000000000ea
	ldsba	[%i4+0x00d]%asi,%l2	! %l2 = 0000000000000000

p0_label_59:
!	Mem[0000000010041430] = a2d90de9, %l0 = 0000000000000035
	ldsba	[%i1+0x030]%asi,%l0	! %l0 = ffffffffffffffa2
!	%f28 = 0bc503ea, Mem[0000000010141438] = fbece2be
	sta	%f28,[%i5+0x038]%asi	! Mem[0000000010141438] = 0bc503ea
!	Mem[0000000010041410] = 7d000000, %l4 = 74c546d0c6ffffff
	ldsha	[%i1+%o5]0x80,%l4	! %l4 = 0000000000007d00
!	Mem[0000000030001408] = 00000000, %l7 = 00000000000000f0
	lduwa	[%i0+%o4]0x89,%l7	! %l7 = 0000000000000000
!	Mem[00000000100c1408] = 00000000, %l1 = 0bc503ea0000ffff
	lduba	[%i3+%o4]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010101410] = 0000006b, %l1 = 0000000000000000
	lduba	[%i4+%o5]0x88,%l1	! %l1 = 000000000000006b
!	Mem[0000000030081410] = 6b000000, %l3 = 000000008ff8f0ff
	ldswa	[%i2+%o5]0x81,%l3	! %l3 = 000000006b000000
!	Mem[00000000300c1410] = ff03c50b00000000, %f10 = 00000000 b2e29e30
	ldda	[%i3+%o5]0x81,%f10	! %f10 = ff03c50b 00000000
!	Mem[0000000030181408] = 1800000000003500, %l3 = 000000006b000000
	ldxa	[%i6+%o4]0x89,%l3	! %l3 = 1800000000003500
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000007d00, Mem[0000000030041410] = ff03c50b
	stba	%l4,[%i1+%o5]0x81	! Mem[0000000030041410] = 0003c50b

p0_label_60:
!	%f12 = e90dd9a2 6b9370f9, %l7 = 0000000000000000
!	Mem[0000000010181438] = 9bc3ad66a8baaeab
	add	%i6,0x038,%g1
	stda	%f12,[%g1+%l7]ASI_PST16_PL ! Mem[0000000010181438] = 9bc3ad66a8baaeab
!	%l1 = 000000000000006b, Mem[0000000010101408] = 7d00ffff
	stba	%l1,[%i4+%o4]0x80	! Mem[0000000010101408] = 6b00ffff
!	%l4 = 0000000000007d00, Mem[0000000010141410] = ff650335
	stha	%l4,[%i5+%o5]0x80	! Mem[0000000010141410] = 7d000335
!	%l1 = 000000000000006b, Mem[00000000211c0000] = ffff6217, %asi = 80
	stha	%l1,[%o2+0x000]%asi	! Mem[00000000211c0000] = 006b6217
!	%f24 = a2d90de9, Mem[00000000100c1410] = 73e09b65
	sta	%f24,[%i3+%o5]0x88	! Mem[00000000100c1410] = a2d90de9
!	Mem[00000000300c1400] = fff00000482217b6, %l5 = ffffffffffffaeab
	ldxa	[%i3+%g0]0x81,%l5	! %l5 = fff00000482217b6
!	%f24 = a2d90de9 5dd135f3, Mem[0000000010181408] = 4e701f45 fbece2be
	stda	%f24,[%i6+%o4]0x88	! Mem[0000000010181408] = a2d90de9 5dd135f3
!	%l6 = ff03ffffe57bb2c1, Mem[0000000010001410] = f0650335
	stha	%l6,[%i0+%o5]0x80	! Mem[0000000010001410] = b2c10335
!	Mem[00000000100c1436] = ff73a44a, %l0 = ffffffffffffffa2
	ldstuba	[%i3+0x036]%asi,%l0	! %l0 = 000000a4000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = 0bc50300, %l1 = 000000000000006b
	ldsba	[%i1+%o5]0x89,%l1	! %l1 = 0000000000000000

p0_label_61:
!	Mem[0000000010081408] = 00000000, %l6 = ff03ffffe57bb2c1
	ldsha	[%i2+%o4]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000010101400] = 7487e36b138969d1, %f20 = 350365f0 7b000000
	ldda	[%i4+%g0]0x80,%f20	! %f20 = 7487e36b 138969d1
!	Mem[00000000100c1400] = ff03ffffe57bb2c1, %l4 = 0000000000007d00
	ldx	[%i3+%g0],%l4		! %l4 = ff03ffffe57bb2c1
!	Mem[0000000030141410] = 601732ce 518613ff, %l6 = 00000000, %l7 = 00000000
	ldda	[%i5+%o5]0x89,%l6	! %l6 = 00000000518613ff 00000000601732ce
!	Mem[00000000100c1410] = e90dd9a2, %l6 = 00000000518613ff
	ldswa	[%i3+%o5]0x80,%l6	! %l6 = ffffffffe90dd9a2
!	Mem[00000000100c1408] = 00000000 00000000, %l6 = e90dd9a2, %l7 = 601732ce
	ldda	[%i3+%o4]0x80,%l6	! %l6 = 0000000000000000 0000000000000000
!	Mem[0000000010141408] = 73e09b65, %f10 = ff03c50b
	lda	[%i5+%o4]0x80,%f10	! %f10 = 73e09b65
!	Mem[0000000010001410] = 3503c1b2, %l7 = 0000000000000000
	ldswa	[%i0+%o5]0x88,%l7	! %l7 = 000000003503c1b2
!	Mem[0000000030101400] = 00000000, %f19 = 8ff8f0ff
	lda	[%i4+%g0]0x89,%f19	! %f19 = 00000000
!	Starting 10 instruction Store Burst
!	%l4 = ff03ffffe57bb2c1, Mem[0000000030101408] = 04c82097f07a73e0
	stxa	%l4,[%i4+%o4]0x89	! Mem[0000000030101408] = ff03ffffe57bb2c1

p0_label_62:
!	%f14 = d1698913 6be38774, Mem[0000000030101408] = c1b27be5 ffff03ff
	stda	%f14,[%i4+%o4]0x81	! Mem[0000000030101408] = d1698913 6be38774
!	Mem[0000000010141400] = 2afb0000, %l5 = fff00000482217b6
	ldstuba	[%i5+%g0]0x80,%l5	! %l5 = 0000002a000000ff
!	%f10 = 73e09b65 00000000, Mem[0000000010141430] = 0bc503ea 0000ffff
	stda	%f10,[%i5+0x030]%asi	! Mem[0000000010141430] = 73e09b65 00000000
!	Mem[0000000010181400] = 6be38774, %l6 = 0000000000000000
	ldstuba	[%i6+%g0]0x88,%l6	! %l6 = 00000074000000ff
!	%f22 = 350365f0, Mem[00000000300c1408] = ea03c50b
	sta	%f22,[%i3+%o4]0x89	! Mem[00000000300c1408] = 350365f0
!	%l4 = ff03ffffe57bb2c1, Mem[0000000010001430] = 5570b11d, %asi = 80
	stba	%l4,[%i0+0x030]%asi	! Mem[0000000010001430] = c170b11d
!	%l6 = 0000000000000074, Mem[00000000100c1418] = 00000000ff00ffff
	stx	%l6,[%i3+0x018]		! Mem[00000000100c1418] = 0000000000000074
!	%f8  = 00000000 8271dc6d, Mem[0000000010081410] = 2afb0000 3d60a266
	stda	%f8 ,[%i2+%o5]0x80	! Mem[0000000010081410] = 00000000 8271dc6d
!	%f0  = 55000000 0000006c, Mem[0000000030041408] = ff0073b9 e873ee91
	stda	%f0 ,[%i1+%o4]0x81	! Mem[0000000030041408] = 55000000 0000006c
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = 00000000, %f13 = 6b9370f9
	lda	[%i4+%g0]0x89,%f13	! %f13 = 00000000

p0_label_63:
!	Mem[0000000010001408] = 0004e007 2af94cb5, %l0 = 000000a4, %l1 = 00000000
	ldda	[%i0+%o4]0x80,%l0	! %l0 = 000000000004e007 000000002af94cb5
!	Mem[00000000100c142c] = 0000005a, %f17 = 000000ea
	lda	[%i3+0x02c]%asi,%f17	! %f17 = 0000005a
!	Mem[00000000100c1400] = ffff03ff, %l3 = 1800000000003500
	ldsha	[%i3+%g0]0x88,%l3	! %l3 = 00000000000003ff
!	Mem[0000000010081408] = 00000000, %l4 = ff03ffffe57bb2c1
	ldsha	[%i2+%o4]0x80,%l4	! %l4 = 0000000000000000
!	Mem[00000000300c1410] = ff03c50b 00000000, %l0 = 0004e007, %l1 = 2af94cb5
	ldda	[%i3+%o5]0x81,%l0	! %l0 = 00000000ff03c50b 0000000000000000
!	Mem[0000000010101438] = 59b9455e7487e36b, %f8  = 00000000 8271dc6d
	ldda	[%i4+0x038]%asi,%f8 	! %f8  = 59b9455e 7487e36b
!	Mem[0000000010141434] = 00000000, %l6 = 0000000000000074
	ldsba	[%i5+0x035]%asi,%l6	! %l6 = 0000000000000000
!	%f3  = d0cacac6, %f6  = 2afb0000 3d60a266
	fstod	%f3 ,%f6 		! %f6  = c2195958 c0000000
!	Mem[0000000030081408] = 1803c50b, %l2 = 0000000000000000
	ldsba	[%i2+%o4]0x81,%l2	! %l2 = 0000000000000018
!	Starting 10 instruction Store Burst
!	%f24 = a2d90de9 5dd135f3, %l4 = 0000000000000000
!	Mem[0000000030001428] = 8823679494672388
	add	%i0,0x028,%g1
	stda	%f24,[%g1+%l4]ASI_PST8_S ! Mem[0000000030001428] = 8823679494672388

p0_label_64:
!	Mem[0000000010001414] = 0000006c, %l2 = 0000000000000018, %asi = 80
	swapa	[%i0+0x014]%asi,%l2	! %l2 = 000000000000006c
!	%f24 = a2d90de9 5dd135f3, Mem[0000000010081430] = ed901724 5dd135f3
	stda	%f24,[%i2+0x030]%asi	! Mem[0000000010081430] = a2d90de9 5dd135f3
!	%f18 = ff73a44a 00000000, Mem[0000000010181408] = 5dd135f3 a2d90de9
	stda	%f18,[%i6+%o4]0x88	! Mem[0000000010181408] = ff73a44a 00000000
!	%l0 = 00000000ff03c50b, Mem[0000000010181408] = 00000000
	stha	%l0,[%i6+%o4]0x88	! Mem[0000000010181408] = 0000c50b
!	Mem[0000000010001410] = 3503c1b2, %l1 = 0000000000000000
	ldstuba	[%i0+%o5]0x88,%l1	! %l1 = 000000b2000000ff
!	%l0 = ff03c50b, %l1 = 000000b2, Mem[0000000010101408] = 6b00ffff 00000000
	stda	%l0,[%i4+%o4]0x80	! Mem[0000000010101408] = ff03c50b 000000b2
!	%l2 = 0000006c, %l3 = 000003ff, Mem[0000000030041400] = ffffffff f0650335
	stda	%l2,[%i1+%g0]0x89	! Mem[0000000030041400] = 0000006c 000003ff
!	%f12 = e90dd9a2, Mem[0000000030181410] = 0000007b
	sta	%f12,[%i6+%o5]0x81	! Mem[0000000030181410] = e90dd9a2
!	%f24 = a2d90de9 5dd135f3, %l4 = 0000000000000000
!	Mem[0000000030181410] = e90dd9a2000000ea
	add	%i6,0x010,%g1
	stda	%f24,[%g1+%l4]ASI_PST32_SL ! Mem[0000000030181410] = e90dd9a2000000ea
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = 4e701f45, %f24 = a2d90de9
	lda	[%i1+%g0]0x88,%f24	! %f24 = 4e701f45

p0_label_65:
!	Mem[0000000021800080] = 65a8d810, %l2 = 000000000000006c
	ldsha	[%o3+0x080]%asi,%l2	! %l2 = 00000000000065a8
!	Mem[0000000010001400] = c1698913 ffffffff, %l2 = 000065a8, %l3 = 000003ff
	ldda	[%i0+%g0]0x80,%l2	! %l2 = 00000000c1698913 00000000ffffffff
!	Mem[0000000010141424] = 5dd135f3, %l4 = 0000000000000000
	lduha	[%i5+0x026]%asi,%l4	! %l4 = 00000000000035f3
!	Mem[0000000030181408] = 00003500, %l2 = 00000000c1698913
	lduha	[%i6+%o4]0x89,%l2	! %l2 = 0000000000003500
!	Mem[0000000030181410] = a2d90de9, %l4 = 00000000000035f3
	ldsha	[%i6+%o5]0x89,%l4	! %l4 = 0000000000000de9
!	Mem[000000001010141c] = 14ef7179, %f14 = d1698913
	lda	[%i4+0x01c]%asi,%f14	! %f14 = 14ef7179
!	Mem[0000000030141400] = c6ffffff, %l4 = 0000000000000de9
	ldsha	[%i5+%g0]0x89,%l4	! %l4 = ffffffffffffffff
!	Mem[00000000100c1410] = a2d90de9, %l3 = 00000000ffffffff
	lduwa	[%i3+%o5]0x88,%l3	! %l3 = 00000000a2d90de9
!	Mem[0000000030001410] = 6c000000, %l3 = 00000000a2d90de9
	lduwa	[%i0+%o5]0x81,%l3	! %l3 = 000000006c000000
!	Starting 10 instruction Store Burst
!	%l5 = 000000000000002a, Mem[0000000010181410] = 7d00ffff
	stba	%l5,[%i6+%o5]0x88	! Mem[0000000010181410] = 7d00ff2a

p0_label_66:
!	%l7 = 000000003503c1b2, Mem[0000000010041400] = 451f704e
	stha	%l7,[%i1+%g0]0x80	! Mem[0000000010041400] = c1b2704e
!	%l7 = 000000003503c1b2, Mem[0000000010141400] = 0000fbff
	stwa	%l7,[%i5+%g0]0x88	! Mem[0000000010141400] = 3503c1b2
!	Mem[0000000010081400] = 7b0000ff, %l5 = 000000000000002a
	ldstuba	[%i2+%g0]0x88,%l5	! %l5 = 000000ff000000ff
!	Mem[0000000010101400] = 6be38774, %l5 = 00000000000000ff
	ldstuba	[%i4+%g0]0x88,%l5	! %l5 = 00000074000000ff
!	%f12 = e90dd9a2 00000000, %l7 = 000000003503c1b2
!	Mem[0000000030041418] = 6b6b3b177df7f8a9
	add	%i1,0x018,%g1
	stda	%f12,[%g1+%l7]ASI_PST16_SL ! Mem[0000000030041418] = 6b6b00007df7f8a9
!	%l5 = 0000000000000074, Mem[0000000030081408] = 1803c50b
	stha	%l5,[%i2+%o4]0x81	! Mem[0000000030081408] = 0074c50b
!	%f30 = fbece2be 4e701f45, Mem[0000000030141400] = c6ffffff 74c546d0
	stda	%f30,[%i5+%g0]0x89	! Mem[0000000030141400] = fbece2be 4e701f45
!	Mem[0000000010041408] = 3d60a251, %l6 = 0000000000000000
	lduha	[%i1+%o4]0x88,%l6	! %l6 = 000000000000a251
!	Mem[00000000201c0001] = 1f458a5f, %l4 = ffffffffffffffff
	ldstuba	[%o0+0x001]%asi,%l4	! %l4 = 00000045000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = 1fff8a5f, %l0 = 00000000ff03c50b
	ldsb	[%o0+%g0],%l0		! %l0 = 000000000000001f

p0_label_67:
!	Mem[0000000030101400] = 00000000, %l2 = 0000000000003500
	ldswa	[%i4+%g0]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000010001408] = 07e00400, %l4 = 0000000000000045
	lduwa	[%i0+%o4]0x88,%l4	! %l4 = 0000000007e00400
!	Mem[0000000030081410] = 6b000000, %l1 = 00000000000000b2
	ldsba	[%i2+%o5]0x81,%l1	! %l1 = 000000000000006b
!	Mem[0000000010041410] = 0000007d, %l4 = 0000000007e00400
	lduwa	[%i1+%o5]0x88,%l4	! %l4 = 000000000000007d
	membar	#Sync			! Added by membar checker (7)
!	Mem[0000000010081400] = ff00007b f0650335 00000000 0000006b
!	Mem[0000000010081410] = 00000000 8271dc6d 9f7d3815 0000ffff
!	Mem[0000000010081420] = ff4a02e7 fafdc045 00000000 659be073
!	Mem[0000000010081430] = a2d90de9 5dd135f3 bd000000 ea03c50b
	ldda	[%i2]ASI_BLK_PL,%f0	! Block Load from 0000000010081400
!	Mem[0000000030041410] = 000000000bc50300, %f22 = 350365f0 ff698913
	ldda	[%i1+%o5]0x89,%f22	! %f22 = 00000000 0bc50300
!	Mem[0000000010081430] = a2d90de9, %l3 = 000000006c000000
	lduha	[%i2+0x032]%asi,%l3	! %l3 = 0000000000000de9
!	Mem[0000000010081400] = ff00007b f0650335 00000000 0000006b
!	Mem[0000000010081410] = 00000000 8271dc6d 9f7d3815 0000ffff
!	Mem[0000000010081420] = ff4a02e7 fafdc045 00000000 659be073
!	Mem[0000000010081430] = a2d90de9 5dd135f3 bd000000 ea03c50b
	ldda	[%i2]ASI_BLK_P,%f16	! Block Load from 0000000010081400
!	Mem[0000000010081400] = ff00007b, %l3 = 0000000000000de9
	lduwa	[%i2+%g0]0x80,%l3	! %l3 = 00000000ff00007b
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1400] = ff03ffff, %l1 = 0000006b, %l6 = 0000a251
	casa	[%i3]0x80,%l1,%l6	! %l6 = 00000000ff03ffff

p0_label_68:
!	Mem[0000000010041410] = 7d000000, %l6 = 00000000ff03ffff
	ldstuba	[%i1+%o5]0x80,%l6	! %l6 = 0000007d000000ff
!	%l5 = 0000000000000074, Mem[0000000030141410] = ff138651ce321760
	stxa	%l5,[%i5+%o5]0x81	! Mem[0000000030141410] = 0000000000000074
!	%l1 = 000000000000006b, Mem[00000000100c1408] = 00000000
	stba	%l1,[%i3+%o4]0x88	! Mem[00000000100c1408] = 0000006b
!	Mem[0000000021800141] = ff8f4ce0, %l4 = 000000000000007d
	ldstuba	[%o3+0x141]%asi,%l4	! %l4 = 0000008f000000ff
!	Mem[000000001008143b] = bd000000, %l7 = 000000003503c1b2
	ldstuba	[%i2+0x03b]%asi,%l7	! %l7 = 00000000000000ff
	membar	#Sync			! Added by membar checker (8)
!	%l2 = 0000000000000000, Mem[0000000010081408] = 00000000
	stha	%l2,[%i2+%o4]0x80	! Mem[0000000010081408] = 00000000
!	%l0 = 000000000000001f, Mem[00000000300c1410] = 0bc503ff
	stba	%l0,[%i3+%o5]0x89	! Mem[00000000300c1410] = 0bc5031f
!	Mem[0000000010141410] = 3503007d, %l1 = 000000000000006b
	swapa	[%i5+%o5]0x88,%l1	! %l1 = 000000003503007d
!	Mem[000000001000143c] = cf88a66f, %l6 = 000000000000007d, %asi = 80
	swapa	[%i0+0x03c]%asi,%l6	! %l6 = 00000000cf88a66f
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = ff03ffff, %l6 = 00000000cf88a66f
	ldsha	[%i3+%g0]0x80,%l6	! %l6 = ffffffffffffff03

p0_label_69:
!	Mem[0000000010181410] = 2aff007d972211f2, %l2 = 0000000000000000
	ldxa	[%i6+0x010]%asi,%l2	! %l2 = 2aff007d972211f2
!	Mem[0000000010181410] = 2aff007d, %l6 = ffffffffffffff03
	lduh	[%i6+0x012],%l6		! %l6 = 000000000000007d
!	Mem[0000000010041408] = 3d60a251, %f24 = ff4a02e7
	lda	[%i1+%o4]0x88,%f24	! %f24 = 3d60a251
!	Mem[0000000010181410] = f21122977d00ff2a, %l1 = 000000003503007d
	ldxa	[%i6+%o5]0x88,%l1	! %l1 = f21122977d00ff2a
!	Mem[0000000030041408] = 00000055, %l2 = 2aff007d972211f2
	ldsha	[%i1+%o4]0x89,%l2	! %l2 = 0000000000000055
!	Mem[0000000010181410] = 7d00ff2a, %l4 = 000000000000008f
	ldsba	[%i6+%o5]0x88,%l4	! %l4 = 000000000000002a
!	Mem[0000000010141400] = 3503c1b2, %l7 = 0000000000000000
	ldsha	[%i5+%g0]0x88,%l7	! %l7 = ffffffffffffc1b2
!	Mem[00000000100c140c] = 00000000, %l4 = 000000000000002a
	lduba	[%i3+0x00f]%asi,%l4	! %l4 = 0000000000000000
!	Mem[00000000300c1408] = f0650335, %f2  = 6b000000
	lda	[%i3+%o4]0x81,%f2 	! %f2 = f0650335
!	Starting 10 instruction Store Burst
!	%l5 = 0000000000000074, Mem[000000001004140c] = 0000fb2a
	stw	%l5,[%i1+0x00c]		! Mem[000000001004140c] = 00000074

p0_label_70:
!	Mem[00000000100c1400] = ffff03ff, %l5 = 0000000000000074
	swapa	[%i3+%g0]0x88,%l5	! %l5 = 00000000ffff03ff
!	%l2 = 00000055, %l3 = ff00007b, Mem[0000000030101408] = d1698913 6be38774
	stda	%l2,[%i4+%o4]0x81	! Mem[0000000030101408] = 00000055 ff00007b
!	Mem[0000000010101420] = a9e450bc, %l6 = 000000000000007d
	swap	[%i4+0x020],%l6		! %l6 = 00000000a9e450bc
!	Mem[0000000010101424] = 9965483d, %l4 = 0000000000000000
	swap	[%i4+0x024],%l4		! %l4 = 000000009965483d
!	Mem[0000000030141410] = 00000000, %l1 = f21122977d00ff2a
	swapa	[%i5+%o5]0x89,%l1	! %l1 = 0000000000000000
!	%l7 = ffffffffffffc1b2, Mem[0000000030041410] = 0bc50300
	stwa	%l7,[%i1+%o5]0x89	! Mem[0000000030041410] = ffffc1b2
!	%l3 = 00000000ff00007b, Mem[00000000100c1418] = 00000000, %asi = 80
	stwa	%l3,[%i3+0x018]%asi	! Mem[00000000100c1418] = ff00007b
!	%f30 = bd000000 ea03c50b, Mem[0000000030101410] = 00000090 35030000
	stda	%f30,[%i4+%o5]0x81	! Mem[0000000030101410] = bd000000 ea03c50b
!	Mem[0000000010181430] = 9685a354, %l1 = 0000000000000000
	ldsh	[%i6+0x030],%l1		! %l1 = ffffffffffff9685
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = 1fff8a5f, %l3 = 00000000ff00007b
	ldsb	[%o0+%g0],%l3		! %l3 = 000000000000001f

p0_label_71:
!	%l7 = ffffffffffffc1b2, imm = ffffffffffffff8b, %l5 = 00000000ffff03ff
	addc	%l7,-0x075,%l5		! %l5 = ffffffffffffc13d
!	Mem[0000000010101410] = 6b000000, %l6 = 00000000a9e450bc
	lduwa	[%i4+%o5]0x80,%l6	! %l6 = 000000006b000000
!	Mem[0000000010101410] = 6b000000, %l5 = ffffffffffffc13d
	ldswa	[%i4+%o5]0x80,%l5	! %l5 = 000000006b000000
!	Mem[000000001004140c] = 00000074, %l5 = 000000006b000000
	ldswa	[%i1+0x00c]%asi,%l5	! %l5 = 0000000000000074
!	Mem[0000000030041408] = 55000000, %l4 = 000000009965483d
	ldswa	[%i1+%o4]0x81,%l4	! %l4 = 0000000055000000
!	Mem[0000000010081410] = 00000000, %l2 = 0000000000000055
	lduwa	[%i2+%o5]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000030181408] = 00003500, %f4  = 6ddc7182
	lda	[%i6+%o4]0x89,%f4 	! %f4 = 00003500
!	Mem[0000000010081400] = ff00007b, %l1 = ffffffffffff9685
	lduwa	[%i2+%g0]0x80,%l1	! %l1 = 00000000ff00007b
!	Mem[00000000100c1400] = c1b27be5 00000074, %l4 = 55000000, %l5 = 00000074
	ldda	[%i3+%g0]0x88,%l4	! %l4 = 0000000000000074 00000000c1b27be5
!	Starting 10 instruction Store Burst
!	%f16 = ff00007b, Mem[0000000010141410] = 0000006b
	sta	%f16,[%i5+%o5]0x88	! Mem[0000000010141410] = ff00007b

p0_label_72:
!	%f0  = 350365f0 7b0000ff f0650335 00000000
!	%f4  = 00003500 00000000 ffff0000 15387d9f
!	%f8  = 45c0fdfa e7024aff 73e09b65 00000000
!	%f12 = f335d15d e90dd9a2 0bc503ea 000000bd
	stda	%f0,[%i5]ASI_BLK_AIUP	! Block Store to 0000000010141400
!	Mem[0000000030141410] = 7d00ff2a, %l4 = 0000000000000074
	swapa	[%i5+%o5]0x89,%l4	! %l4 = 000000007d00ff2a
!	%f18 = 00000000 0000006b, %l4 = 000000007d00ff2a
!	Mem[0000000030001410] = 6c00000000000055
	add	%i0,0x010,%g1
	stda	%f18,[%g1+%l4]ASI_PST8_S ! Mem[0000000030001410] = 6c00000000000055
!	%l6 = 6b000000, %l7 = ffffc1b2, Mem[00000000100c1410] = a2d90de9 d1698913
	stda	%l6,[%i3+%o5]0x88	! Mem[00000000100c1410] = 6b000000 ffffc1b2
!	Mem[0000000010101408] = 0bc503ff, %l6 = 000000006b000000
	swapa	[%i4+%o4]0x88,%l6	! %l6 = 000000000bc503ff
!	Mem[0000000030041400] = 6c000000, %l1 = 00000000ff00007b
	ldstuba	[%i1+%g0]0x81,%l1	! %l1 = 0000006c000000ff
!	%l2 = 0000000000000000, Mem[0000000030101400] = 00000000
	stwa	%l2,[%i4+%g0]0x81	! Mem[0000000030101400] = 00000000
!	%l1 = 000000000000006c, Mem[0000000010081410] = 00000000
	stba	%l1,[%i2+%o5]0x88	! Mem[0000000010081410] = 0000006c
!	%l5 = 00000000c1b27be5, Mem[0000000030101410] = 000000bd
	stha	%l5,[%i4+%o5]0x89	! Mem[0000000030101410] = 00007be5
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = ff87e36b, %l7 = ffffffffffffc1b2
	lduw	[%i4+%g0],%l7		! %l7 = 00000000ff87e36b

p0_label_73:
!	Mem[0000000030181400] = f0650335 000000ab, %l0 = 0000001f, %l1 = 0000006c
	ldda	[%i6+%g0]0x89,%l0	! %l0 = 00000000000000ab 00000000f0650335
!	Mem[0000000010001400] = c1698913, %l2 = 0000000000000000
	ldswa	[%i0+%g0]0x80,%l2	! %l2 = ffffffffc1698913
!	Mem[0000000030041410] = b2c1ffff00000000, %l6 = 000000000bc503ff
	ldxa	[%i1+%o5]0x81,%l6	! %l6 = b2c1ffff00000000
!	Mem[0000000020800040] = ffff8327, %l4 = 000000007d00ff2a
	ldsh	[%o1+0x040],%l4		! %l4 = ffffffffffffffff
!	Mem[0000000010101428] = 6ddc7182 7487e36b, %l6 = 00000000, %l7 = ff87e36b
	ldda	[%i4+0x028]%asi,%l6	! %l6 = 000000006ddc7182 000000007487e36b
!	Mem[0000000030041410] = ffffc1b2, %l3 = 000000000000001f
	lduwa	[%i1+%o5]0x89,%l3	! %l3 = 00000000ffffc1b2
	membar	#Sync			! Added by membar checker (9)
!	Mem[0000000010141418] = ffff000015387d9f, %f22 = 9f7d3815 0000ffff
	ldd	[%i5+0x018],%f22	! %f22 = ffff0000 15387d9f
!	Mem[00000000201c0000] = 1fff8a5f, %l3 = 00000000ffffc1b2
	ldsh	[%o0+%g0],%l3		! %l3 = 0000000000001fff
!	Mem[0000000010001410] = 3503c1ff, %l5 = 00000000c1b27be5
	ldsba	[%i0+%o5]0x88,%l5	! %l5 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l1 = 00000000f0650335, Mem[0000000030141408] = 000000650004e007
	stxa	%l1,[%i5+%o4]0x89	! Mem[0000000030141408] = 00000000f0650335

p0_label_74:
!	%f30 = bd000000 ea03c50b, Mem[00000000100c1410] = 6b000000 ffffc1b2
	stda	%f30,[%i3+%o5]0x88	! Mem[00000000100c1410] = bd000000 ea03c50b
!	%l7 = 000000007487e36b, Mem[0000000030101400] = 00000000
	stba	%l7,[%i4+%g0]0x89	! Mem[0000000030101400] = 0000006b
!	%l3 = 0000000000001fff, Mem[00000000201c0000] = 1fff8a5f, %asi = 80
	stha	%l3,[%o0+0x000]%asi	! Mem[00000000201c0000] = 1fff8a5f
!	%l1 = 00000000f0650335, Mem[00000000201c0000] = 1fff8a5f, %asi = 80
	stha	%l1,[%o0+0x000]%asi	! Mem[00000000201c0000] = 03358a5f
!	%l1 = 00000000f0650335, Mem[0000000020800040] = ffff8327
	sth	%l1,[%o1+0x040]		! Mem[0000000020800040] = 03358327
!	%l5 = ffffffffffffffff, Mem[0000000030041410] = ffffc1b2
	stba	%l5,[%i1+%o5]0x89	! Mem[0000000030041410] = ffffc1ff
!	%f20 = 00000000 8271dc6d, %l6 = 000000006ddc7182
!	Mem[00000000300c1410] = 1f03c50b00000000
	add	%i3,0x010,%g1
	stda	%f20,[%g1+%l6]ASI_PST32_SL ! Mem[00000000300c1410] = 1f03c50b00000000
!	%l3 = 0000000000001fff, Mem[0000000030001400] = 000000ff
	stwa	%l3,[%i0+%g0]0x81	! Mem[0000000030001400] = 00001fff
!	%l2 = ffffffffc1698913, Mem[0000000030141400] = 451f704e
	stba	%l2,[%i5+%g0]0x81	! Mem[0000000030141400] = 131f704e
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = 74000000, %f10 = 73e09b65
	lda	[%i3+0x000]%asi,%f10	! %f10 = 74000000

p0_label_75:
!	Mem[00000000100c1408] = 6b000000, %l6 = 000000006ddc7182
	ldswa	[%i3+%o4]0x80,%l6	! %l6 = 000000006b000000
!	Mem[0000000010101410] = 0000006b, %l4 = ffffffffffffffff
	lduha	[%i4+%o5]0x88,%l4	! %l4 = 000000000000006b
!	Mem[0000000030081410] = 0000006b, %l6 = 000000006b000000
	lduwa	[%i2+%o5]0x89,%l6	! %l6 = 000000000000006b
!	Mem[00000000300c1410] = 000000000bc5031f, %f12 = f335d15d e90dd9a2
	ldda	[%i3+%o5]0x89,%f12	! %f12 = 00000000 0bc5031f
!	Mem[0000000030101400] = 6b000000, %l5 = ffffffffffffffff
	lduwa	[%i4+%g0]0x81,%l5	! %l5 = 000000006b000000
!	Mem[0000000010041428] = 6be38774, %l7 = 000000007487e36b
	ldsb	[%i1+0x02a],%l7		! %l7 = ffffffffffffff87
!	Mem[0000000010181408] = 0000c50b, %l5 = 000000006b000000
	lduha	[%i6+%o4]0x88,%l5	! %l5 = 000000000000c50b
!	Mem[0000000010141410] = 00000000 00350000, %l2 = c1698913, %l3 = 00001fff
	ldda	[%i5+%o5]0x88,%l2	! %l2 = 0000000000350000 0000000000000000
!	Mem[00000000211c0000] = 006b6217, %l0 = 00000000000000ab
	lduha	[%o2+0x000]%asi,%l0	! %l0 = 000000000000006b
!	Starting 10 instruction Store Burst
!	Mem[0000000010001408] = 0004e0072af94cb5, %l7 = ffffffffffffff87, %l2 = 0000000000350000
	add	%i0,0x08,%g1
	casxa	[%g1]0x80,%l7,%l2	! %l2 = 0004e0072af94cb5

p0_label_76:
!	%f8  = 45c0fdfa e7024aff, Mem[0000000010181410] = 2aff007d 972211f2
	stda	%f8 ,[%i6+%o5]0x80	! Mem[0000000010181410] = 45c0fdfa e7024aff
!	%l0 = 000000000000006b, Mem[00000000201c0000] = 03358a5f, %asi = 80
	stba	%l0,[%o0+0x000]%asi	! Mem[00000000201c0000] = 6b358a5f
!	Mem[0000000010101400] = ff87e36b, %l6 = 000000000000006b
	swapa	[%i4+%g0]0x80,%l6	! %l6 = 00000000ff87e36b
!	%f4  = 00003500, Mem[0000000010141408] = f0650335
	sta	%f4 ,[%i5+%o4]0x80	! Mem[0000000010141408] = 00003500
!	Mem[0000000030181408] = 00350000, %l7 = ffffffffffffff87
	ldstuba	[%i6+%o4]0x81,%l7	! %l7 = 00000000000000ff
!	%l3 = 0000000000000000, Mem[0000000010001410] = ffc10335
	stwa	%l3,[%i0+%o5]0x80	! Mem[0000000010001410] = 00000000
!	%l4 = 000000000000006b, Mem[0000000010041408] = 3d60a251
	stba	%l4,[%i1+%o4]0x88	! Mem[0000000010041408] = 3d60a26b
!	%l6 = 00000000ff87e36b, Mem[0000000030141400] = 131f704ebee2ecfb
	stxa	%l6,[%i5+%g0]0x81	! Mem[0000000030141400] = 00000000ff87e36b
!	%f6  = ffff0000, Mem[00000000100c1408] = 6b000000
	sta	%f6 ,[%i3+%o4]0x80	! Mem[00000000100c1408] = ffff0000
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = c1b2704e f07ab0c4, %l2 = 2af94cb5, %l3 = 00000000
	ldda	[%i1+%g0]0x80,%l2	! %l2 = 00000000c1b2704e 00000000f07ab0c4

p0_label_77:
!	Mem[0000000010181410] = 45c0fdfa e7024aff, %l6 = ff87e36b, %l7 = 00000000
	ldda	[%i6+%o5]0x80,%l6	! %l6 = 0000000045c0fdfa 00000000e7024aff
!	Mem[00000000100c1408] = ffff000000000000, %l7 = 00000000e7024aff
	ldx	[%i3+%o4],%l7		! %l7 = ffff000000000000
!	Mem[0000000030001408] = 00000000, %l0 = 000000000000006b
	lduha	[%i0+%o4]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000010101408] = 0000006b, %l2 = 00000000c1b2704e
	ldsha	[%i4+%o4]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000030181410] = e90dd9a2, %l0 = 0000000000000000
	lduwa	[%i6+%o5]0x81,%l0	! %l0 = 00000000e90dd9a2
!	Mem[0000000010081410] = 0000006c, %l5 = 000000000000c50b
	lduha	[%i2+%o5]0x88,%l5	! %l5 = 000000000000006c
!	Mem[0000000010041408] = 74000000 3d60a26b, %l4 = 0000006b, %l5 = 0000006c
	ldda	[%i1+%o4]0x88,%l4	! %l4 = 000000003d60a26b 0000000074000000
!	Mem[0000000010181400] = 6be387ff, %l5 = 0000000074000000
	ldsba	[%i6+%g0]0x88,%l5	! %l5 = ffffffffffffffff
!	Code Fragment 3
p0_fragment_2:
!	%l0 = 00000000e90dd9a2
	setx	0x3c4901efa445ff68,%g7,%l0 ! %l0 = 3c4901efa445ff68
!	%l1 = 00000000f0650335
	setx	0x4c31fd305a90d47f,%g7,%l1 ! %l1 = 4c31fd305a90d47f
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 3c4901efa445ff68
	setx	0x7927142877749a38,%g7,%l0 ! %l0 = 7927142877749a38
!	%l1 = 4c31fd305a90d47f
	setx	0x6b4b5bb7beeaf195,%g7,%l1 ! %l1 = 6b4b5bb7beeaf195
!	Starting 10 instruction Store Burst
!	%l3 = 00000000f07ab0c4, Mem[0000000010181400] = ff87e36b138969d1
	stxa	%l3,[%i6+%g0]0x80	! Mem[0000000010181400] = 00000000f07ab0c4

p0_label_78:
!	%l3 = 00000000f07ab0c4, Mem[00000000300c1400] = fff00000
	stwa	%l3,[%i3+%g0]0x81	! Mem[00000000300c1400] = f07ab0c4
!	%l2 = 0000000000000000, Mem[0000000010181408] = 0bc50000
	stw	%l2,[%i6+%o4]		! Mem[0000000010181408] = 00000000
!	%l6 = 0000000045c0fdfa, Mem[0000000010001400] = 138969c1
	stwa	%l6,[%i0+%g0]0x88	! Mem[0000000010001400] = 45c0fdfa
!	Mem[0000000030001408] = 00000000, %l0 = 7927142877749a38
	swapa	[%i0+%o4]0x89,%l0	! %l0 = 0000000000000000
!	%l0 = 0000000000000000, Mem[00000000100c1410] = 0bc503ea
	stwa	%l0,[%i3+%o5]0x80	! Mem[00000000100c1410] = 00000000
!	Mem[0000000010181418] = 77af373e, %l4 = 3d60a26b, %l5 = ffffffff
	add	%i6,0x18,%g1
	casa	[%g1]0x80,%l4,%l5	! %l5 = 0000000077af373e
!	%l6 = 0000000045c0fdfa, Mem[00000000100c1408] = 000000000000ffff
	stxa	%l6,[%i3+%o4]0x88	! Mem[00000000100c1408] = 0000000045c0fdfa
!	%l2 = 00000000, %l3 = f07ab0c4, Mem[0000000010141408] = 00003500 00000000
	std	%l2,[%i5+%o4]		! Mem[0000000010141408] = 00000000 f07ab0c4
!	%f2  = f0650335 00000000, %l1 = 6b4b5bb7beeaf195
!	Mem[0000000030181408] = ff35000000000018
	add	%i6,0x008,%g1
	stda	%f2,[%g1+%l1]ASI_PST16_SL ! Mem[0000000030181408] = 0000000035030018
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = 00000000f07ab0c4, %l4 = 000000003d60a26b
	ldxa	[%i5+%o4]0x80,%l4	! %l4 = 00000000f07ab0c4

p0_label_79:
!	Mem[0000000010001400] = fafdc045ffffffff, %l7 = ffff000000000000
	ldx	[%i0+%g0],%l7		! %l7 = fafdc045ffffffff
!	Mem[0000000010141400] = 350365f07b0000ff, %f12 = 00000000 0bc5031f
	ldda	[%i5+%g0]0x80,%f12	! %f12 = 350365f0 7b0000ff
!	Mem[000000001008141c] = 0000ffff, %l0 = 0000000000000000
	ldsh	[%i2+0x01c],%l0		! %l0 = 0000000000000000
!	Mem[0000000030141400] = 00000000, %l1 = 6b4b5bb7beeaf195
	lduba	[%i5+%g0]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000030101408] = 00000055, %l7 = fafdc045ffffffff
	lduwa	[%i4+%o4]0x81,%l7	! %l7 = 0000000000000055
!	Mem[0000000030001408] = f065033577749a38, %l4 = 00000000f07ab0c4
	ldxa	[%i0+%o4]0x89,%l4	! %l4 = f065033577749a38
	membar	#Sync			! Added by membar checker (10)
!	Mem[0000000010001400] = fafdc045 ffffffff 0004e007 2af94cb5
!	Mem[0000000010001410] = 00000000 00000018 a7d756a7 fbece2be
!	Mem[0000000010001420] = f218444f b0e7ff89 f0650335 ea03c50b
!	Mem[0000000010001430] = c170b11d 605aab5c b25ee3dd 0000007d
	ldda	[%i0]ASI_BLK_AIUPL,%f0	! Block Load from 0000000010001400
!	Mem[0000000010081408] = 00000000, %l7 = 0000000000000055
	lduha	[%i2+%o4]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000010101438] = 59b9455e 7487e36b, %l6 = 45c0fdfa, %l7 = 00000000
	ldda	[%i4+0x038]%asi,%l6	! %l6 = 0000000059b9455e 000000007487e36b
!	Starting 10 instruction Store Burst
!	%l4 = f065033577749a38, Mem[0000000010181428] = 881390ff04177388, %asi = 80
	stxa	%l4,[%i6+0x028]%asi	! Mem[0000000010181428] = f065033577749a38

p0_label_80:
!	Mem[00000000100c1414] = 000000bd, %l2 = 00000000, %l2 = 00000000
	add	%i3,0x14,%g1
	casa	[%g1]0x80,%l2,%l2	! %l2 = 00000000000000bd
!	Mem[0000000010141400] = 350365f0, %l6 = 0000000059b9455e
	swapa	[%i5+%g0]0x80,%l6	! %l6 = 00000000350365f0
!	%l2 = 000000bd, %l3 = f07ab0c4, Mem[00000000300c1400] = c4b07af0 b6172248
	stda	%l2,[%i3+%g0]0x89	! Mem[00000000300c1400] = 000000bd f07ab0c4
!	%f0  = ffffffff 45c0fdfa b54cf92a 07e00400
!	%f4  = 18000000 00000000 bee2ecfb a756d7a7
!	%f8  = 89ffe7b0 4f4418f2 0bc503ea 350365f0
!	%f12 = 5cab5a60 1db170c1 7d000000 dde35eb2
	stda	%f0,[%i3]ASI_BLK_AIUS	! Block Store to 00000000300c1400
!	Mem[0000000010101400] = 0000006b, %l2 = 00000000000000bd
	swapa	[%i4+%g0]0x80,%l2	! %l2 = 000000000000006b
!	%f17 = f0650335, Mem[0000000010101400] = bd000000
	sta	%f17,[%i4+%g0]0x88	! Mem[0000000010101400] = f0650335
!	%l5 = 0000000077af373e, Mem[0000000030001400] = ff1f0000
	stha	%l5,[%i0+%g0]0x89	! Mem[0000000030001400] = ff1f373e
!	%l6 = 00000000350365f0, Mem[0000000030101408] = 55000000
	stwa	%l6,[%i4+%o4]0x89	! Mem[0000000030101408] = 350365f0
!	%l6 = 00000000350365f0, Mem[0000000030041408] = 55000000
	stba	%l6,[%i1+%o4]0x81	! Mem[0000000030041408] = f0000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = 59b9455e, %l6 = 00000000350365f0
	ldsha	[%i5+%g0]0x80,%l6	! %l6 = 00000000000059b9

p0_label_81:
!	Mem[0000000010181408] = 00000000, %l7 = 000000007487e36b
	ldswa	[%i6+%o4]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000010001400] = 45c0fdfa, %l7 = 0000000000000000
	ldswa	[%i0+%g0]0x88,%l7	! %l7 = 0000000045c0fdfa
	membar	#Sync			! Added by membar checker (11)
!	Mem[00000000100c1410] = 00000000, %l6 = 00000000000059b9
	lduba	[%i3+%o5]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000010181410] = fafdc045, %l5 = 0000000077af373e
	lduha	[%i6+%o5]0x88,%l5	! %l5 = 000000000000c045
!	Mem[0000000030141410] = 7400000000000074, %f28 = a2d90de9 5dd135f3
	ldda	[%i5+%o5]0x81,%f28	! %f28 = 74000000 00000074
!	Mem[0000000010081410] = 6ddc71820000006c, %f4  = 18000000 00000000
	ldda	[%i2+%o5]0x88,%f4 	! %f4  = 6ddc7182 0000006c
!	Mem[00000000100c1410] = 00000000, %l6 = 0000000000000000
	lduwa	[%i3+%o5]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000030081400] = 00000000 b2e29e30, %l0 = 00000000, %l1 = 00000000
	ldda	[%i2+%g0]0x81,%l0	! %l0 = 0000000000000000 00000000b2e29e30
!	Mem[00000000300c1408] = b54cf92a, %l3 = 00000000f07ab0c4
	lduwa	[%i3+%o4]0x81,%l3	! %l3 = 00000000b54cf92a
!	Starting 10 instruction Store Burst
!	Mem[0000000030141410] = 00000074, %l0 = 0000000000000000
	ldstuba	[%i5+%o5]0x89,%l0	! %l0 = 00000074000000ff

p0_label_82:
!	%f0  = ffffffff 45c0fdfa, %l6 = 0000000000000000
!	Mem[0000000010141410] = 0000350000000000
	add	%i5,0x010,%g1
	stda	%f0,[%g1+%l6]ASI_PST32_PL ! Mem[0000000010141410] = 0000350000000000
!	%f16 = ff00007b f0650335 00000000 0000006b
!	%f20 = 00000000 8271dc6d ffff0000 15387d9f
!	%f24 = 3d60a251 fafdc045 00000000 659be073
!	%f28 = 74000000 00000074 bd000000 ea03c50b
	stda	%f16,[%i4]ASI_BLK_S	! Block Store to 0000000030101400
!	%l4 = f065033577749a38, Mem[0000000010041418] = ce3217600000ffff, %asi = 80
	stxa	%l4,[%i1+0x018]%asi	! Mem[0000000010041418] = f065033577749a38
!	%l0 = 00000074, %l1 = b2e29e30, Mem[0000000010001408] = 0004e007 2af94cb5
	stda	%l0,[%i0+%o4]0x80	! Mem[0000000010001408] = 00000074 b2e29e30
!	%l6 = 00000000, %l7 = 45c0fdfa, Mem[0000000010081430] = a2d90de9 5dd135f3
	stda	%l6,[%i2+0x030]%asi	! Mem[0000000010081430] = 00000000 45c0fdfa
!	%f8  = 89ffe7b0 4f4418f2, Mem[0000000030001400] = ff1f373e 2a00007d
	stda	%f8 ,[%i0+%g0]0x89	! Mem[0000000030001400] = 89ffe7b0 4f4418f2
!	Mem[0000000010181400] = 00000000, %l6 = 0000000000000000
	swapa	[%i6+%g0]0x80,%l6	! %l6 = 0000000000000000
!	%l5 = 000000000000c045, Mem[00000000300c1410] = 00000018
	stha	%l5,[%i3+%o5]0x89	! Mem[00000000300c1410] = 0000c045
!	%f8  = 89ffe7b0 4f4418f2, Mem[0000000010181408] = 00000000 ff73a44a
	stda	%f8 ,[%i6+%o4]0x88	! Mem[0000000010181408] = 89ffe7b0 4f4418f2
!	Starting 10 instruction Load Burst
!	Mem[0000000010181418] = 77af373e, %l7 = 0000000045c0fdfa
	ldsba	[%i6+0x01b]%asi,%l7	! %l7 = 000000000000003e

p0_label_83:
!	Mem[0000000030141400] = 6be387ff 00000000, %l0 = 00000074, %l1 = b2e29e30
	ldda	[%i5+%g0]0x89,%l0	! %l0 = 0000000000000000 000000006be387ff
!	Mem[00000000100c1420] = 7db8a8fe, %l2 = 000000000000006b
	lduw	[%i3+0x020],%l2		! %l2 = 000000007db8a8fe
!	Mem[0000000030181408] = 00000000, %l1 = 000000006be387ff
	ldsha	[%i6+%o4]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000030001408] = 389a7477, %l0 = 0000000000000000
	lduha	[%i0+%o4]0x81,%l0	! %l0 = 000000000000389a
!	Mem[0000000021800040] = 5af7c5e9, %l5 = 000000000000c045
	ldub	[%o3+0x041],%l5		! %l5 = 00000000000000f7
!	Mem[0000000010181400] = 00000000 f07ab0c4, %l0 = 0000389a, %l1 = 00000000
	ldda	[%i6+%g0]0x80,%l0	! %l0 = 0000000000000000 00000000f07ab0c4
	membar	#Sync			! Added by membar checker (12)
!	Mem[0000000030101408] = 00000000, %l3 = 00000000b54cf92a
	ldsha	[%i4+%o4]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000010141410] = 0000350000000000, %f10 = 0bc503ea 350365f0
	ldda	[%i5+0x010]%asi,%f10	! %f10 = 00003500 00000000
!	Mem[0000000010141400] = ff00007b 5e45b959, %l6 = 00000000, %l7 = 0000003e
	ldda	[%i5+%g0]0x88,%l6	! %l6 = 000000005e45b959 00000000ff00007b
!	Starting 10 instruction Store Burst
!	Mem[0000000030041410] = ffc1ffff, %l5 = 00000000000000f7
	ldsha	[%i1+%o5]0x81,%l5	! %l5 = ffffffffffffffc1

p0_label_84:
!	%l6 = 5e45b959, %l7 = ff00007b, Mem[0000000010181410] = fafdc045 ff4a02e7
	stda	%l6,[%i6+%o5]0x88	! Mem[0000000010181410] = 5e45b959 ff00007b
!	Mem[0000000010081410] = 6c000000, %l6 = 000000005e45b959
	ldstuba	[%i2+%o5]0x80,%l6	! %l6 = 0000006c000000ff
!	%l4 = 77749a38, %l5 = ffffffc1, Mem[0000000010041408] = 3d60a26b 74000000
	stda	%l4,[%i1+%o4]0x88	! Mem[0000000010041408] = 77749a38 ffffffc1
!	Mem[0000000030041410] = ffffc1ff, %l3 = 0000000000000000
	swapa	[%i1+%o5]0x89,%l3	! %l3 = 00000000ffffc1ff
!	Mem[0000000010181410] = 5e45b959, %l2 = 000000007db8a8fe
	ldstuba	[%i6+%o5]0x88,%l2	! %l2 = 00000059000000ff
!	%l2 = 00000059, %l3 = ffffc1ff, Mem[0000000010141408] = 00000000 f07ab0c4
	stda	%l2,[%i5+0x008]%asi	! Mem[0000000010141408] = 00000059 ffffc1ff
!	Mem[0000000010081400] = 7b0000ff, %l3 = 00000000ffffc1ff
	swapa	[%i2+%g0]0x88,%l3	! %l3 = 000000007b0000ff
!	%f10 = 00003500, Mem[0000000010041408] = 389a7477
	st	%f10,[%i1+%o4]		! Mem[0000000010041408] = 00003500
!	%l3 = 000000007b0000ff, Mem[0000000030001410] = 550000000000006c
	stxa	%l3,[%i0+%o5]0x89	! Mem[0000000030001410] = 000000007b0000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = 6b000000 bee2ecfb, %l0 = 00000000, %l1 = f07ab0c4
	ldda	[%i4+%o5]0x80,%l0	! %l0 = 000000006b000000 00000000bee2ecfb

p0_label_85:
!	Mem[0000000010001400] = fafdc045, %l0 = 000000006b000000
	lduha	[%i0+%g0]0x80,%l0	! %l0 = 000000000000fafd
!	Mem[0000000010001408] = 00000074b2e29e30, %l4 = f065033577749a38
	ldxa	[%i0+0x008]%asi,%l4	! %l4 = 00000074b2e29e30
!	Mem[0000000010181410] = ff00007b 5e45b9ff, %l4 = b2e29e30, %l5 = ffffffc1
	ldda	[%i6+%o5]0x88,%l4	! %l4 = 000000005e45b9ff 00000000ff00007b
!	Mem[0000000010041408] = 00003500, %l2 = 0000000000000059
	ldsw	[%i1+%o4],%l2		! %l2 = 0000000000003500
!	Mem[0000000030041408] = f0000000, %l1 = 00000000bee2ecfb
	lduba	[%i1+%o4]0x81,%l1	! %l1 = 00000000000000f0
!	Mem[0000000010101408] = 6b000000, %l3 = 000000007b0000ff
	lduha	[%i4+%o4]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000010141400] = 5e45b959, %l7 = 00000000ff00007b
	lduba	[%i5+%g0]0x88,%l7	! %l7 = 0000000000000059
!	Mem[00000000100c1408] = 45c0fdfa, %l4 = 000000005e45b9ff
	ldsba	[%i3+%o4]0x88,%l4	! %l4 = fffffffffffffffa
!	Mem[00000000300c1400] = fafdc045ffffffff, %l6 = 000000000000006c
	ldxa	[%i3+%g0]0x89,%l6	! %l6 = fafdc045ffffffff
!	Starting 10 instruction Store Burst
!	%l4 = fffffffffffffffa, Mem[0000000010081400] = ffc1ffff
	stwa	%l4,[%i2+%g0]0x80	! Mem[0000000010081400] = fffffffa

p0_label_86:
!	%l6 = fafdc045ffffffff, Mem[0000000010141422] = 45c0fdfa
	sth	%l6,[%i5+0x022]		! Mem[0000000010141420] = 45c0ffff
!	Mem[00000000100c1400] = 74000000e57bb2c1, %l1 = 00000000000000f0, %l1 = 00000000000000f0
	casxa	[%i3]0x80,%l1,%l1	! %l1 = 74000000e57bb2c1
!	%l7 = 0000000000000059, Mem[0000000010041408] = 00003500c1ffffff
	stxa	%l7,[%i1+%o4]0x80	! Mem[0000000010041408] = 0000000000000059
!	%l7 = 0000000000000059, Mem[0000000010101410] = 6b000000bee2ecfb
	stxa	%l7,[%i4+%o5]0x80	! Mem[0000000010101410] = 0000000000000059
!	%l3 = 0000000000000000, Mem[0000000010101408] = 6b000000
	stba	%l3,[%i4+%o4]0x88	! Mem[0000000010101408] = 6b000000
!	%f4  = 6ddc7182 0000006c, %l6 = fafdc045ffffffff
!	Mem[0000000010081400] = fffffffaf0650335
	stda	%f4,[%i2+%l6]ASI_PST16_PL ! Mem[0000000010081400] = 6c0000008271dc6d
!	%l7 = 0000000000000059, Mem[0000000010101424] = 00000000, %asi = 80
	stba	%l7,[%i4+0x024]%asi	! Mem[0000000010101424] = 59000000
!	Mem[0000000010041429] = 6be38774, %l2 = 0000000000003500
	ldstub	[%i1+0x029],%l2		! %l2 = 000000e3000000ff
!	%f2  = b54cf92a, %f22 = ffff0000 15387d9f
	fstod	%f2 ,%f22		! %f22 = bea99f25 40000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = 4f4418f2, %l5 = 00000000ff00007b
	lduha	[%i6+%o4]0x88,%l5	! %l5 = 00000000000018f2

p0_label_87:
!	Mem[0000000010041410] = ff000000, %l0 = 000000000000fafd
	ldsha	[%i1+%o5]0x80,%l0	! %l0 = ffffffffffffff00
!	Mem[0000000030001410] = ff00007b00000000, %l5 = 00000000000018f2
	ldxa	[%i0+%o5]0x81,%l5	! %l5 = ff00007b00000000
!	Mem[0000000010001400] = fafdc045, %l5 = ff00007b00000000
	ldsba	[%i0+%g0]0x80,%l5	! %l5 = fffffffffffffffa
!	%l5 = fffffffffffffffa, imm = fffffffffffff436, %l5 = fffffffffffffffa
	subc	%l5,-0xbca,%l5		! %l5 = 0000000000000bc4
	membar	#Sync			! Added by membar checker (13)
!	Mem[0000000010141400] = 59b9455e 7b0000ff 00000059 ffffc1ff
!	Mem[0000000010141410] = 00003500 00000000 ffff0000 15387d9f
!	Mem[0000000010141420] = 45c0ffff e7024aff 73e09b65 00000000
!	Mem[0000000010141430] = f335d15d e90dd9a2 0bc503ea 000000bd
	ldda	[%i5]ASI_BLK_AIUP,%f0	! Block Load from 0000000010141400
!	Mem[0000000030101410] = 00000000, %l4 = fffffffffffffffa
	lduba	[%i4+%o5]0x89,%l4	! %l4 = 0000000000000000
!	Mem[000000001010140c] = 000000b2, %l3 = 0000000000000000
	ldsh	[%i4+0x00c],%l3		! %l3 = 0000000000000000
!	Mem[0000000030181408] = 00000000, %l4 = 0000000000000000
	lduha	[%i6+%o4]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000010141400] = 59b9455e, %l6 = fafdc045ffffffff
	lduba	[%i5+%g0]0x80,%l6	! %l6 = 0000000000000059
!	Starting 10 instruction Store Burst
!	%l2 = 00000000000000e3, Mem[0000000010001408] = 00000074
	stba	%l2,[%i0+%o4]0x80	! Mem[0000000010001408] = e3000074

p0_label_88:
!	Mem[0000000030081408] = 0bc57400, %l7 = 0000000000000059
	swapa	[%i2+%o4]0x89,%l7	! %l7 = 000000000bc57400
	membar	#Sync			! Added by membar checker (14)
!	%l2 = 000000e3, %l3 = 00000000, Mem[0000000010141420] = 45c0ffff e7024aff
	std	%l2,[%i5+0x020]		! Mem[0000000010141420] = 000000e3 00000000
!	%l4 = 0000000000000000, Mem[0000000010081408] = 00000000
	stwa	%l4,[%i2+%o4]0x88	! Mem[0000000010081408] = 00000000
!	%l2 = 00000000000000e3, Mem[0000000030181410] = e90dd9a2
	stwa	%l2,[%i6+%o5]0x81	! Mem[0000000030181410] = 000000e3
!	Mem[0000000030101408] = 00000000, %l7 = 000000000bc57400
	swapa	[%i4+%o4]0x89,%l7	! %l7 = 0000000000000000
!	%f12 = f335d15d e90dd9a2, Mem[0000000030001410] = ff00007b 00000000
	stda	%f12,[%i0+%o5]0x81	! Mem[0000000030001410] = f335d15d e90dd9a2
!	%l0 = ffffff00, %l1 = e57bb2c1, Mem[0000000010181438] = 9bc3ad66 a8baaeab
	stda	%l0,[%i6+0x038]%asi	! Mem[0000000010181438] = ffffff00 e57bb2c1
!	Mem[0000000030181408] = 00000000, %l0 = ffffffffffffff00
	swapa	[%i6+%o4]0x89,%l0	! %l0 = 0000000000000000
!	%f6  = ffff0000 15387d9f, %l3 = 0000000000000000
!	Mem[00000000300c1428] = 0bc503ea350365f0
	add	%i3,0x028,%g1
	stda	%f6,[%g1+%l3]ASI_PST32_S ! Mem[00000000300c1428] = 0bc503ea350365f0
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = 00000000, %l5 = 0000000000000bc4
	lduwa	[%i4+%o5]0x80,%l5	! %l5 = 0000000000000000

p0_label_89:
!	Mem[00000000100c1410] = bd00000000000000, %l6 = 0000000000000059
	ldxa	[%i3+%o5]0x88,%l6	! %l6 = bd00000000000000
!	Mem[00000000100c1410] = 00000000, %f26 = 00000000
	ld	[%i3+%o5],%f26	! %f26 = 00000000
!	Mem[00000000300c1400] = ffffffff, %l1 = 74000000e57bb2c1
	ldsba	[%i3+%g0]0x89,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010101438] = 59b9455e, %l0 = 0000000000000000
	ldsha	[%i4+0x03a]%asi,%l0	! %l0 = 000000000000455e
!	Mem[0000000010081410] = ff000000, %l0 = 000000000000455e
	ldsh	[%i2+0x012],%l0		! %l0 = 0000000000000000
!	Mem[0000000030141408] = f0650335, %l0 = 0000000000000000
	lduwa	[%i5+%o4]0x89,%l0	! %l0 = 00000000f0650335
!	Mem[0000000010101414] = 00000059, %l0 = 00000000f0650335
	lduwa	[%i4+0x014]%asi,%l0	! %l0 = 0000000000000059
!	Mem[0000000010081428] = 00000000659be073, %f28 = 74000000 00000074
	ldd	[%i2+0x028],%f28	! %f28 = 00000000 659be073
!	Mem[0000000010101400] = f0650335, %l0 = 0000000000000059
	ldswa	[%i4+%g0]0x88,%l0	! %l0 = fffffffff0650335
!	Starting 10 instruction Store Burst
!	%l6 = bd00000000000000, Mem[0000000010081400] = 0000006c
	stwa	%l6,[%i2+%g0]0x88	! Mem[0000000010081400] = 00000000

p0_label_90:
!	Mem[0000000010041408] = 00000000, %l4 = 0000000000000000
	ldstuba	[%i1+%o4]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010001410] = 00000000, %l4 = 0000000000000000
	swapa	[%i0+%o5]0x88,%l4	! %l4 = 0000000000000000
!	%l0 = f0650335, %l1 = ffffffff, Mem[0000000030141400] = 00000000 6be387ff
	stda	%l0,[%i5+%g0]0x89	! Mem[0000000030141400] = f0650335 ffffffff
!	Mem[0000000010141400] = 5e45b959, %l7 = 0000000000000000
	ldstuba	[%i5+%g0]0x88,%l7	! %l7 = 00000059000000ff
!	%l2 = 00000000000000e3, Mem[00000000211c0000] = 006b6217
	sth	%l2,[%o2+%g0]		! Mem[00000000211c0000] = 00e36217
!	Mem[000000001008143b] = bd0000ff, %l1 = ffffffffffffffff
	ldstuba	[%i2+0x03b]%asi,%l1	! %l1 = 000000ff000000ff
!	%f16 = ff00007b f0650335 00000000 0000006b
!	%f20 = 00000000 8271dc6d bea99f25 40000000
!	%f24 = 3d60a251 fafdc045 00000000 659be073
!	%f28 = 00000000 659be073 bd000000 ea03c50b
	stda	%f16,[%i6]ASI_BLK_PL	! Block Store to 0000000010181400
!	%l2 = 00000000000000e3, Mem[0000000030141400] = f0650335
	stba	%l2,[%i5+%g0]0x89	! Mem[0000000030141400] = f06503e3
!	Mem[0000000010141428] = 73e09b65, %l6 = bd00000000000000, %asi = 80
	swapa	[%i5+0x028]%asi,%l6	! %l6 = 0000000073e09b65
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = 00000000 00000000, %l2 = 000000e3, %l3 = 00000000
	ldda	[%i1+%o5]0x81,%l2	! %l2 = 0000000000000000 0000000000000000

p0_label_91:
!	Mem[0000000030081408] = 00000059, %l4 = 0000000000000000
	ldsha	[%i2+%o4]0x89,%l4	! %l4 = 0000000000000059
!	Mem[0000000010041410] = ff000000, %l4 = 0000000000000059
	ldswa	[%i1+%o5]0x80,%l4	! %l4 = ffffffffff000000
!	Mem[0000000010001414] = 00000018, %l6 = 0000000073e09b65
	ldsh	[%i0+0x014],%l6		! %l6 = 0000000000000000
!	Mem[00000000100c1400] = 00000074, %l4 = ffffffffff000000
	lduba	[%i3+%g0]0x88,%l4	! %l4 = 0000000000000074
!	Mem[0000000030181400] = 000000ab, %l4 = 0000000000000074
	lduba	[%i6+%g0]0x89,%l4	! %l4 = 00000000000000ab
!	Mem[0000000030041408] = f0000000, %l7 = 0000000000000059
	ldswa	[%i1+%o4]0x81,%l7	! %l7 = fffffffff0000000
!	Mem[0000000010141408] = 00000059, %l1 = 00000000000000ff
	lduwa	[%i5+%o4]0x80,%l1	! %l1 = 0000000000000059
!	Mem[000000001004142c] = 8271dc6d, %l2 = 0000000000000000
	ldswa	[%i1+0x02c]%asi,%l2	! %l2 = ffffffff8271dc6d
!	Mem[00000000300c1408] = b54cf92a, %l3 = 0000000000000000
	ldsba	[%i3+%o4]0x81,%l3	! %l3 = ffffffffffffffb5
!	Starting 10 instruction Store Burst
!	%f1  = 7b0000ff, Mem[0000000030081410] = 0000006b
	sta	%f1 ,[%i2+%o5]0x89	! Mem[0000000030081410] = 7b0000ff

p0_label_92:
!	Mem[0000000010041420] = 7971ef14fea8b87d, %l7 = fffffffff0000000
	ldx	[%i1+0x020],%l7		! %l7 = 7971ef14fea8b87d
!	Mem[00000000100c1400] = 00000074, %l2 = ffffffff8271dc6d
	ldstuba	[%i3+%g0]0x88,%l2	! %l2 = 00000074000000ff
!	Mem[0000000030081408] = 00000059, %l0 = fffffffff0650335
	swapa	[%i2+%o4]0x89,%l0	! %l0 = 0000000000000059
!	Mem[00000000100c1408] = 45c0fdfa, %l3 = ffffffffffffffb5
	ldstuba	[%i3+%o4]0x88,%l3	! %l3 = 000000fa000000ff
!	%l3 = 00000000000000fa, Mem[0000000010101400] = 350365f0
	sth	%l3,[%i4+%g0]		! Mem[0000000010101400] = 00fa65f0
!	%f0  = 59b9455e 7b0000ff, Mem[0000000010141400] = ffb9455e 7b0000ff
	stda	%f0 ,[%i5+%g0]0x80	! Mem[0000000010141400] = 59b9455e 7b0000ff
!	%f16 = ff00007b f0650335 00000000 0000006b
!	%f20 = 00000000 8271dc6d bea99f25 40000000
!	%f24 = 3d60a251 fafdc045 00000000 659be073
!	%f28 = 00000000 659be073 bd000000 ea03c50b
	stda	%f16,[%i2]ASI_BLK_AIUS	! Block Store to 0000000030081400
!	Mem[0000000010141438] = 0bc503ea, %l1 = 0000000000000059
	swap	[%i5+0x038],%l1		! %l1 = 000000000bc503ea
!	Mem[0000000010141418] = ffff0000, %l2 = 0000000000000074, %asi = 80
	swapa	[%i5+0x018]%asi,%l2	! %l2 = 00000000ffff0000
!	Starting 10 instruction Load Burst
!	Mem[0000000030101410] = 00000000, %l1 = 000000000bc503ea
	lduba	[%i4+%o5]0x81,%l1	! %l1 = 0000000000000000

p0_label_93:
!	Mem[0000000010101408] = 6b000000, %l5 = 0000000000000000
	lduwa	[%i4+%o4]0x88,%l5	! %l5 = 000000006b000000
!	Mem[0000000010001420] = f218444f, %f6  = ffff0000
	ld	[%i0+0x020],%f6 	! %f6 = f218444f
	membar	#Sync			! Added by membar checker (15)
!	Mem[00000000300c1400] = ffffffff 45c0fdfa b54cf92a 07e00400
!	Mem[00000000300c1410] = 45c00000 00000000 bee2ecfb a756d7a7
!	Mem[00000000300c1420] = 89ffe7b0 4f4418f2 0bc503ea 350365f0
!	Mem[00000000300c1430] = 5cab5a60 1db170c1 7d000000 dde35eb2
	ldda	[%i3]ASI_BLK_AIUSL,%f16	! Block Load from 00000000300c1400
!	Mem[0000000010181408] = 0000006b, %f9  = e7024aff
	lda	[%i6+%o4]0x88,%f9 	! %f9 = 0000006b
!	Mem[0000000010041408] = ff000000, %l7 = 7971ef14fea8b87d
	ldswa	[%i1+%o4]0x80,%l7	! %l7 = ffffffffff000000
!	Mem[000000001004143c] = c6ffffff, %l6 = 0000000000000000
	ldsba	[%i1+0x03d]%asi,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000020800040] = 03358327, %l1 = 0000000000000000
	ldsh	[%o1+0x040],%l1		! %l1 = 0000000000000335
!	Mem[0000000010141410] = 00003500, %l6 = ffffffffffffffff
	ldsw	[%i5+%o5],%l6		! %l6 = 0000000000003500
!	Mem[0000000030101400] = 7b0000ff, %l0 = 0000000000000059
	ldsba	[%i4+%g0]0x89,%l0	! %l0 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1410] = 00000000, %l4 = 00000000000000ab
	ldstuba	[%i3+%o5]0x80,%l4	! %l4 = 00000000000000ff

p0_label_94:
!	Mem[000000001010142c] = 7487e36b, %l6 = 0000000000003500
	ldstub	[%i4+0x02c],%l6		! %l6 = 00000074000000ff
!	Mem[0000000010101400] = f065fa00, %l4 = 0000000000000000
	swapa	[%i4+%g0]0x88,%l4	! %l4 = 00000000f065fa00
!	%l3 = 00000000000000fa, Mem[0000000010081400] = 000000008271dc6d
	stxa	%l3,[%i2+%g0]0x80	! Mem[0000000010081400] = 00000000000000fa
!	%l7 = ffffffffff000000, Mem[0000000030181408] = 00ffffff35030018
	stxa	%l7,[%i6+%o4]0x81	! Mem[0000000030181408] = ffffffffff000000
	membar	#Sync			! Added by membar checker (16)
!	%l7 = ffffffffff000000, Mem[00000000300c1400] = ffffffff
	stwa	%l7,[%i3+%g0]0x81	! Mem[00000000300c1400] = ff000000
!	%l2 = ffff0000, %l3 = 000000fa, Mem[0000000010041410] = 000000ff 558bf3ff
	stda	%l2,[%i1+%o5]0x88	! Mem[0000000010041410] = ffff0000 000000fa
!	Mem[0000000021800001] = 676ce2e2, %l3 = 00000000000000fa
	ldstuba	[%o3+0x001]%asi,%l3	! %l3 = 0000006c000000ff
!	%l2 = ffff0000, %l3 = 0000006c, Mem[0000000010081410] = 000000ff 6ddc7182
	stda	%l2,[%i2+%o5]0x88	! Mem[0000000010081410] = ffff0000 0000006c
!	%l6 = 00000074, %l7 = ff000000, Mem[0000000010101400] = 00000000 d1698913
	stda	%l6,[%i4+%g0]0x88	! Mem[0000000010101400] = 00000074 ff000000
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = ff000000, %l4 = 00000000f065fa00
	ldsha	[%i3+%g0]0x80,%l4	! %l4 = ffffffffffffff00

p0_label_95:
!	Mem[0000000030141410] = ff00000000000074, %f6  = f218444f 15387d9f
	ldda	[%i5+%o5]0x81,%f6 	! %f6  = ff000000 00000074
!	Mem[0000000010001408] = e3000074, %l4 = ffffffffffffff00
	ldsw	[%i0+%o4],%l4		! %l4 = ffffffffe3000074
!	Mem[0000000030181410] = ea000000e3000000, %l2 = 00000000ffff0000
	ldxa	[%i6+%o5]0x89,%l2	! %l2 = ea000000e3000000
!	Mem[0000000030181408] = ffffffff, %f26 = f0650335
	lda	[%i6+%o4]0x81,%f26	! %f26 = ffffffff
!	Mem[0000000030101408] = 0074c50b, %l2 = ea000000e3000000
	ldswa	[%i4+%o4]0x81,%l2	! %l2 = 000000000074c50b
!	Mem[00000000100c1400] = ff000000e57bb2c1, %f6  = ff000000 00000074
	ldda	[%i3+%g0]0x80,%f6 	! %f6  = ff000000 e57bb2c1
!	Mem[00000000100c1408] = 45c0fdff, %l1 = 0000000000000335
	ldsha	[%i3+%o4]0x88,%l1	! %l1 = fffffffffffffdff
!	Mem[0000000010001400] = 45c0fdfa, %l5 = 000000006b000000
	ldsha	[%i0+%g0]0x88,%l5	! %l5 = fffffffffffffdfa
!	Mem[0000000010181400] = f0650335, %l7 = ffffffffff000000
	lduha	[%i6+%g0]0x88,%l7	! %l7 = 0000000000000335
!	Starting 10 instruction Store Burst
!	%f26 = ffffffff ea03c50b, %l7 = 0000000000000335
!	Mem[0000000010141430] = f335d15de90dd9a2
	add	%i5,0x030,%g1
	stda	%f26,[%g1+%l7]ASI_PST32_P ! Mem[0000000010141430] = f335d15dea03c50b

p0_label_96:
!	%f16 = fafdc045 ffffffff 0004e007 2af94cb5
!	%f20 = 00000000 0000c045 a7d756a7 fbece2be
!	%f24 = f218444f b0e7ff89 ffffffff ea03c50b
!	%f28 = c170b11d 605aab5c b25ee3dd 0000007d
	stda	%f16,[%i5]ASI_BLK_PL	! Block Store to 0000000010141400
!	Mem[00000000100c1410] = 000000ff, %l5 = fffffffffffffdfa
	ldstuba	[%i3+%o5]0x88,%l5	! %l5 = 000000ff000000ff
!	Mem[0000000010081400] = 00000000, %l6 = 0000000000000074
	ldstuba	[%i2+%g0]0x80,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030101410] = 00000000, %l2 = 000000000074c50b
	ldstuba	[%i4+%o5]0x81,%l2	! %l2 = 00000000000000ff
!	%l1 = fffffffffffffdff, Mem[0000000030141408] = 350365f0
	stwa	%l1,[%i5+%o4]0x81	! Mem[0000000030141408] = fffffdff
!	%l4 = ffffffffe3000074, Mem[0000000010181400] = f0650335
	stwa	%l4,[%i6+%g0]0x88	! Mem[0000000010181400] = e3000074
!	Mem[000000001010140b] = 0000006b, %l5 = 00000000000000ff
	ldstub	[%i4+0x00b],%l5		! %l5 = 0000006b000000ff
!	%l6 = 0000000000000000, Mem[0000000010141400] = ffffffff45c0fdfa
	stxa	%l6,[%i5+%g0]0x80	! Mem[0000000010141400] = 0000000000000000
!	Mem[0000000010001410] = 00000000, %l6 = 0000000000000000
	swapa	[%i0+%o5]0x80,%l6	! %l6 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = 000000ffffffffff, %l6 = 0000000000000000
	ldxa	[%i6+%o4]0x89,%l6	! %l6 = 000000ffffffffff

p0_label_97:
!	Mem[00000000100c1400] = c1b27be5 000000ff, %l6 = ffffffff, %l7 = 00000335
	ldda	[%i3+%g0]0x88,%l6	! %l6 = 00000000000000ff 00000000c1b27be5
!	Mem[0000000030041410] = 00000000, %l7 = 00000000c1b27be5
	ldswa	[%i1+%o5]0x89,%l7	! %l7 = 0000000000000000
	membar	#Sync			! Added by membar checker (17)
!	Mem[0000000030141400] = e30365f0 ffffffff fffffdff 00000000
!	Mem[0000000030141410] = ff000000 00000074 2c29b42f 8ff8f0ff
!	Mem[0000000030141420] = c930c085 c708073f 16b6b0d2 61a3aebe
!	Mem[0000000030141430] = 3e12147d a1050441 3fbc3a07 5264b172
	ldda	[%i5]ASI_BLK_AIUSL,%f0	! Block Load from 0000000030141400
!	Mem[00000000100c1434] = ff73ff4a, %l2 = 0000000000000000
	ldsw	[%i3+0x034],%l2		! %l2 = ffffffffff73ff4a
!	Mem[000000001010142c] = ff87e36b, %l1 = fffffffffffffdff
	lduba	[%i4+0x02d]%asi,%l1	! %l1 = 0000000000000087
!	Mem[0000000010141420] = 89ffe7b0 4f4418f2, %l6 = 000000ff, %l7 = 00000000
	ldd	[%i5+0x020],%l6		! %l6 = 0000000089ffe7b0 000000004f4418f2
!	Mem[0000000010041408] = 59000000 000000ff, %l0 = ffffffff, %l1 = 00000087
	ldda	[%i1+%o4]0x88,%l0	! %l0 = 00000000000000ff 0000000059000000
!	Mem[0000000030081408] = 00000000, %f27 = ea03c50b
	lda	[%i2+%o4]0x81,%f27	! %f27 = 00000000
!	Mem[0000000010081408] = 00000000, %l2 = ffffffffff73ff4a
	ldsha	[%i2+%o4]0x80,%l2	! %l2 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l7 = 000000004f4418f2, Mem[000000001018140c] = 00000000, %asi = 80
	stha	%l7,[%i6+0x00c]%asi	! Mem[000000001018140c] = 18f20000

p0_label_98:
!	Mem[0000000010001408] = e3000074, %l6 = 0000000089ffe7b0
	ldstuba	[%i0+%o4]0x80,%l6	! %l6 = 000000e3000000ff
	membar	#Sync			! Added by membar checker (18)
!	%l6 = 00000000000000e3, Mem[0000000030141408] = 00000000fffdffff
	stxa	%l6,[%i5+%o4]0x89	! Mem[0000000030141408] = 00000000000000e3
!	%f10 = beaea361, Mem[0000000010141400] = 00000000
	sta	%f10,[%i5+%g0]0x88	! Mem[0000000010141400] = beaea361
!	Mem[000000001010140d] = 000000b2, %l0 = 00000000000000ff
	ldstub	[%i4+0x00d],%l0		! %l0 = 00000000000000ff
!	Mem[00000000100c1404] = e57bb2c1, %l5 = 0000006b, %l1 = 59000000
	add	%i3,0x04,%g1
	casa	[%g1]0x80,%l5,%l1	! %l1 = 00000000e57bb2c1
!	Mem[0000000030101408] = 0074c50b, %l7 = 000000004f4418f2
	swapa	[%i4+%o4]0x81,%l7	! %l7 = 000000000074c50b
!	%l4 = e3000074, %l5 = 0000006b, Mem[00000000100c1418] = ff00007b 00000074
	std	%l4,[%i3+0x018]		! Mem[00000000100c1418] = e3000074 0000006b
!	Mem[0000000010041400] = 4e70b2c1, %l3 = 000000000000006c
	ldstuba	[%i1+%g0]0x88,%l3	! %l3 = 000000c1000000ff
!	%f24 = f218444f b0e7ff89, %l3 = 00000000000000c1
!	Mem[0000000010081418] = 9f7d38150000ffff
	add	%i2,0x018,%g1
	stda	%f24,[%g1+%l3]ASI_PST16_P ! Mem[0000000010081418] = 9f7d38150000ff89
!	Starting 10 instruction Load Burst
!	Mem[0000000010001428] = f0650335, %l4 = ffffffffe3000074
	ldsba	[%i0+0x02a]%asi,%l4	! %l4 = 0000000000000003

p0_label_99:
!	Mem[0000000020800000] = ff455afb, %l0 = 0000000000000000
	ldsh	[%o1+%g0],%l0		! %l0 = ffffffffffffff45
!	Mem[0000000010181408] = 0000006b, %f7  = 2fb4292c
	lda	[%i6+%o4]0x88,%f7 	! %f7 = 0000006b
!	Mem[0000000030081410] = 00000000, %l5 = 000000000000006b
	ldswa	[%i2+%o5]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000010001400] = 45c0fdfa, %l6 = 00000000000000e3
	lduwa	[%i0+%g0]0x88,%l6	! %l6 = 0000000045c0fdfa
!	Mem[0000000010181408] = 6b00000018f20000, %f2  = 00000000 fffdffff
	ldda	[%i6+%o4]0x80,%f2 	! %f2  = 6b000000 18f20000
!	Mem[0000000030001410] = a2d90de9 5dd135f3, %l2 = 00000000, %l3 = 000000c1
	ldda	[%i0+%o5]0x89,%l2	! %l2 = 000000005dd135f3 00000000a2d90de9
!	Mem[0000000010181438] = 0bc503ea000000bd, %l0 = ffffffffffffff45
	ldxa	[%i6+0x038]%asi,%l0	! %l0 = 0bc503ea000000bd
!	Mem[0000000010101400] = 74000000, %f6  = fff0f88f
	lda	[%i4+%g0]0x80,%f6 	! %f6 = 74000000
!	Mem[000000001000142c] = ea03c50b, %l2 = 000000005dd135f3
	ldsha	[%i0+0x02e]%asi,%l2	! %l2 = ffffffffffffc50b
!	Starting 10 instruction Store Burst
!	Mem[0000000030141408] = e3000000, %l6 = 0000000045c0fdfa
	ldstuba	[%i5+%o4]0x81,%l6	! %l6 = 000000e3000000ff

p0_label_100:
!	%l5 = 0000000000000000, Mem[0000000010181438] = 0bc503ea000000bd
	stx	%l5,[%i6+0x038]		! Mem[0000000010181438] = 0000000000000000
!	%l1 = 00000000e57bb2c1, Mem[0000000030081410] = 000000008271dc6d
	stxa	%l1,[%i2+%o5]0x81	! Mem[0000000030081410] = 00000000e57bb2c1
!	%l0 = 000000bd, %l1 = e57bb2c1, Mem[0000000010001430] = c170b11d 605aab5c
	stda	%l0,[%i0+0x030]%asi	! Mem[0000000010001430] = 000000bd e57bb2c1
!	%l3 = 00000000a2d90de9, Mem[0000000010141439] = 7d000000, %asi = 80
	stba	%l3,[%i5+0x039]%asi	! Mem[0000000010141438] = 7de90000
!	%l1 = 00000000e57bb2c1, Mem[00000000201c0001] = 6b358a5f, %asi = 80
	stba	%l1,[%o0+0x001]%asi	! Mem[00000000201c0000] = 6bc18a5f
!	Mem[0000000030001400] = f218444f, %l5 = 0000000000000000
	swapa	[%i0+%g0]0x81,%l5	! %l5 = 00000000f218444f
!	%l2 = ffffffffffffc50b, Mem[0000000030181408] = ffffffff
	stwa	%l2,[%i6+%o4]0x81	! Mem[0000000030181408] = ffffc50b
!	%l0 = 000000bd, %l1 = e57bb2c1, Mem[00000000300c1400] = 000000ff fafdc045
	stda	%l0,[%i3+%g0]0x89	! Mem[00000000300c1400] = 000000bd e57bb2c1
!	Mem[0000000010141408] = b54cf92a, %l4 = 0000000000000003
	swapa	[%i5+%o4]0x80,%l4	! %l4 = 00000000b54cf92a
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = beaea361, %l4 = 00000000b54cf92a
	lduwa	[%i5+%g0]0x88,%l4	! %l4 = 00000000beaea361

p0_label_101:
!	Mem[0000000010141408] = 0004e007 03000000, %l4 = beaea361, %l5 = f218444f
	ldda	[%i5+%o4]0x88,%l4	! %l4 = 0000000003000000 000000000004e007
!	Mem[0000000010041408] = ff000000, %l6 = 00000000000000e3
	ldsba	[%i1+%o4]0x80,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010001438] = b25ee3dd 0000007d, %l6 = ffffffff, %l7 = 0074c50b
	ldda	[%i0+0x038]%asi,%l6	! %l6 = 00000000b25ee3dd 000000000000007d
!	Mem[0000000030141410] = ff000000, %l5 = 000000000004e007
	lduwa	[%i5+%o5]0x81,%l5	! %l5 = 00000000ff000000
!	Mem[0000000010041400] = ffb2704e, %l3 = 00000000a2d90de9
	ldsha	[%i1+%g0]0x80,%l3	! %l3 = ffffffffffffffb2
	membar	#Sync			! Added by membar checker (19)
!	Mem[0000000010041400] = ffb2704e f07ab0c4 ff000000 00000059
!	Mem[0000000010041410] = 0000ffff fa000000 f0650335 77749a38
!	Mem[0000000010041420] = 7971ef14 fea8b87d 6bff8774 8271dc6d
!	Mem[0000000010041430] = a2d90de9 5dd135f3 74c546d0 c6ffffff
	ldda	[%i1]ASI_BLK_PL,%f0	! Block Load from 0000000010041400
!	Mem[00000000100c1410] = ff000000 000000bd, %l2 = ffffc50b, %l3 = ffffffb2
	ldda	[%i3+%o5]0x80,%l2	! %l2 = 00000000ff000000 00000000000000bd
!	Mem[0000000030081410] = c1b27be5 00000000, %l6 = b25ee3dd, %l7 = 0000007d
	ldda	[%i2+%o5]0x89,%l6	! %l6 = 0000000000000000 00000000c1b27be5
!	Mem[0000000030141408] = ff000000, %l7 = 00000000c1b27be5
	ldsba	[%i5+%o4]0x81,%l7	! %l7 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l1 = 00000000e57bb2c1, Mem[000000001000140f] = b2e29e30, %asi = 80
	stba	%l1,[%i0+0x00f]%asi	! Mem[000000001000140c] = b2e29ec1

p0_label_102:
!	%l6 = 0000000000000000, Mem[0000000010181410] = 6ddc7182
	stwa	%l6,[%i6+%o5]0x80	! Mem[0000000010181410] = 00000000
!	%l0 = 0bc503ea000000bd, Mem[0000000030141400] = e30365f0
	stba	%l0,[%i5+%g0]0x81	! Mem[0000000030141400] = bd0365f0
!	Mem[00000000211c0001] = 00e36217, %l4 = 0000000003000000
	ldstuba	[%o2+0x001]%asi,%l4	! %l4 = 000000e3000000ff
!	%f26 = ffffffff 00000000, %l0 = 0bc503ea000000bd
!	Mem[0000000030041400] = ff000000ff030000
	stda	%f26,[%i1+%l0]ASI_PST8_S ! Mem[0000000030041400] = ff00ffff00000000
!	Mem[000000001008140a] = 00000000, %l6 = 0000000000000000
	ldstuba	[%i2+0x00a]%asi,%l6	! %l6 = 00000000000000ff
!	%l2 = 00000000ff000000, Mem[0000000030101410] = 000000ff
	stha	%l2,[%i4+%o5]0x89	! Mem[0000000030101410] = 00000000
!	Mem[0000000010101410] = 00000000, %l4 = 00000000000000e3
	ldstuba	[%i4+%o5]0x80,%l4	! %l4 = 00000000000000ff
!	%f31 = 0000007d, Mem[00000000100c1400] = ff000000
	sta	%f31,[%i3+%g0]0x80	! Mem[00000000100c1400] = 0000007d
!	Mem[0000000010141405] = 00000000, %l1 = 00000000e57bb2c1
	ldstuba	[%i5+0x005]%asi,%l1	! %l1 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = f0000000, %f24 = f218444f
	lda	[%i1+%o4]0x81,%f24	! %f24 = f0000000

p0_label_103:
!	Mem[0000000010081410] = ffff0000, %l2 = 00000000ff000000
	lduwa	[%i2+%o5]0x88,%l2	! %l2 = 00000000ffff0000
!	Mem[0000000010101410] = ff000000, %l7 = ffffffffffffffff
	lduba	[%i4+%o5]0x80,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030141410] = ff000000, %l4 = 0000000000000000
	lduba	[%i5+%o5]0x81,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030181410] = ea000000 e3000000, %l2 = ffff0000, %l3 = 000000bd
	ldda	[%i6+%o5]0x89,%l2	! %l2 = 00000000e3000000 00000000ea000000
!	Mem[0000000010041418] = f065033577749a38, %l0 = 0bc503ea000000bd
	ldx	[%i1+0x018],%l0		! %l0 = f065033577749a38
!	Mem[0000000010041400] = ffb2704e, %l1 = 0000000000000000
	ldswa	[%i1+%g0]0x80,%l1	! %l1 = ffffffffffb2704e
!	Mem[0000000010101410] = ff000000, %l4 = 00000000000000ff
	ldsba	[%i4+%o5]0x80,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010141410] = 45c00000, %l0 = f065033577749a38
	lduha	[%i5+%o5]0x80,%l0	! %l0 = 00000000000045c0
!	Mem[0000000010141428] = 0bc503ea, %l1 = ffffffffffb2704e
	ldub	[%i5+0x028],%l1		! %l1 = 000000000000000b
!	Starting 10 instruction Store Burst
!	%l1 = 000000000000000b, Mem[00000000100c1400] = 0000007de57bb2c1
	stxa	%l1,[%i3+%g0]0x80	! Mem[00000000100c1400] = 000000000000000b

p0_label_104:
!	%f26 = ffffffff 00000000, Mem[0000000030041400] = ffff00ff 00000000
	stda	%f26,[%i1+%g0]0x89	! Mem[0000000030041400] = ffffffff 00000000
	membar	#Sync			! Added by membar checker (20)
!	%f29 = 605aab5c, Mem[0000000010041404] = f07ab0c4
	st	%f29,[%i1+0x004]	! Mem[0000000010041404] = 605aab5c
!	%f22 = a7d756a7 fbece2be, %l6 = 0000000000000000
!	Mem[0000000030141400] = bd0365f0ffffffff
	stda	%f22,[%i5+%l6]ASI_PST16_SL ! Mem[0000000030141400] = bd0365f0ffffffff
!	%l0 = 00000000000045c0, Mem[0000000010001410] = 1800000000000000
	stxa	%l0,[%i0+%o5]0x88	! Mem[0000000010001410] = 00000000000045c0
!	Mem[000000001010142b] = 6ddc7182, %l4 = ffffffffffffffff
	ldstub	[%i4+0x02b],%l4		! %l4 = 00000082000000ff
!	Mem[0000000010181424] = 51a2603d, %l2 = e3000000, %l1 = 0000000b
	add	%i6,0x24,%g1
	casa	[%g1]0x80,%l2,%l1	! %l1 = 0000000051a2603d
!	Mem[00000000100c1400] = 00000000, %l0 = 00000000000045c0
	ldstuba	[%i3+%g0]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010141400] = 61a3aebe, %l6 = 0000000000000000
	ldstuba	[%i5+%g0]0x80,%l6	! %l6 = 00000061000000ff
!	%l4 = 0000000000000082, Mem[0000000010041410] = 0000fffffa000000
	stxa	%l4,[%i1+%o5]0x80	! Mem[0000000010041410] = 0000000000000082
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = 000000ff, %l3 = 00000000ea000000
	ldsba	[%i3+%g0]0x88,%l3	! %l3 = ffffffffffffffff

p0_label_105:
!	Mem[0000000030001410] = 5dd135f3, %l7 = 00000000000000ff
	ldswa	[%i0+%o5]0x89,%l7	! %l7 = 000000005dd135f3
!	Mem[0000000030141408] = 000000ff, %l3 = ffffffffffffffff
	ldsba	[%i5+%o4]0x89,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010101410] = ff000000, %l2 = 00000000e3000000
	lduha	[%i4+%o5]0x80,%l2	! %l2 = 000000000000ff00
!	Mem[0000000030181410] = 000000e3, %l6 = 0000000000000061
	ldsba	[%i6+%o5]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000030101400] = 7b0000ff, %l1 = 0000000051a2603d
	ldsha	[%i4+%g0]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010101408] = 000000ff, %l6 = 0000000000000000
	ldswa	[%i4+%o4]0x80,%l6	! %l6 = 00000000000000ff
!	Mem[00000000100c1400] = ff0000000000000b, %f6  = 389a7477 350365f0
	ldda	[%i3+%g0]0x80,%f6 	! %f6  = ff000000 0000000b
!	%l1 = 00000000000000ff, %l3 = ffffffffffffffff, %y  = 00000000
	umul	%l1,%l3,%l5		! %l5 = 000000feffffff01, %y = 000000fe
!	Mem[0000000010041410] = 00000000, %f26 = ffffffff
	lda	[%i1+%o5]0x88,%f26	! %f26 = 00000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030081408] = 00000000, %l5 = 000000feffffff01
	ldstuba	[%i2+%o4]0x89,%l5	! %l5 = 00000000000000ff

p0_label_106:
!	%f0  = c4b07af0 4e70b2ff 59000000 000000ff
!	%f4  = 000000fa ffff0000 ff000000 0000000b
!	%f8  = 7db8a8fe 14ef7179 6ddc7182 7487ff6b
!	%f12 = f335d15d e90dd9a2 ffffffc6 d046c574
	stda	%f0,[%i3]ASI_BLK_S	! Block Store to 00000000300c1400
!	Mem[0000000010141400] = beaea3ff, %l6 = 00000000000000ff
	swapa	[%i5+%g0]0x88,%l6	! %l6 = 00000000beaea3ff
!	%f19 = 2af94cb5, Mem[0000000030101400] = 7b0000ff
	sta	%f19,[%i4+%g0]0x89	! Mem[0000000030101400] = 2af94cb5
!	%f25 = b0e7ff89, %f18 = 0004e007 2af94cb5
	fitod	%f25,%f18		! %f18 = c1d3c600 1dc00000
!	%l3 = ffffffffffffffff, Mem[00000000300c1400] = ffb2704ef07ab0c4
	stxa	%l3,[%i3+%g0]0x89	! Mem[00000000300c1400] = ffffffffffffffff
!	Mem[0000000010001408] = 740000ff, %l3 = ffffffffffffffff
	ldstuba	[%i0+%o4]0x88,%l3	! %l3 = 000000ff000000ff
!	%f24 = f0000000 b0e7ff89, Mem[0000000010001400] = fafdc045 ffffffff
	stda	%f24,[%i0+%g0]0x80	! Mem[0000000010001400] = f0000000 b0e7ff89
!	%l0 = 00000000, %l1 = 000000ff, Mem[0000000030001400] = 00000000 89ffe7b0
	stda	%l0,[%i0+%g0]0x89	! Mem[0000000030001400] = 00000000 000000ff
!	%l6 = 00000000beaea3ff, Mem[0000000030041408] = 000000f0
	stwa	%l6,[%i1+%o4]0x89	! Mem[0000000030041408] = beaea3ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = 0004e00703000000, %l0 = 0000000000000000
	ldxa	[%i5+%o4]0x88,%l0	! %l0 = 0004e00703000000

p0_label_107:
!	Mem[0000000030101408] = f218444f, %f28 = c170b11d
	lda	[%i4+%o4]0x89,%f28	! %f28 = f218444f
	membar	#Sync			! Added by membar checker (21)
!	Mem[00000000300c1400] = ffffffff ffffffff 59000000 000000ff
!	Mem[00000000300c1410] = 000000fa ffff0000 ff000000 0000000b
!	Mem[00000000300c1420] = 7db8a8fe 14ef7179 6ddc7182 7487ff6b
!	Mem[00000000300c1430] = f335d15d e90dd9a2 ffffffc6 d046c574
	ldda	[%i3]ASI_BLK_S,%f16	! Block Load from 00000000300c1400
!	Mem[0000000030101410] = 00000000, %f7  = 0000000b
	lda	[%i4+%o5]0x81,%f7 	! %f7 = 00000000
!	Mem[0000000010081408] = 00ff0000, %l1 = 00000000000000ff
	lduwa	[%i2+%o4]0x88,%l1	! %l1 = 0000000000ff0000
!	Mem[0000000030001400] = 00000000, %l1 = 0000000000ff0000
	ldswa	[%i0+%g0]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000030141410] = 000000ff, %l6 = 00000000beaea3ff
	ldswa	[%i5+%o5]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[00000000100c1410] = bd000000000000ff, %l1 = 0000000000000000
	ldxa	[%i3+%o5]0x88,%l1	! %l1 = bd000000000000ff
!	Mem[0000000010101408] = 000000ff, %l2 = 000000000000ff00
	ldsha	[%i4+%o4]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000010141408] = 03000000, %l0 = 0004e00703000000
	lduba	[%i5+%o4]0x88,%l0	! %l0 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030181410] = 000000e3, %l1 = bd000000000000ff
	swapa	[%i6+%o5]0x81,%l1	! %l1 = 00000000000000e3

p0_label_108:
!	%l0 = 00000000, %l1 = 000000e3, Mem[0000000010001400] = f0000000 b0e7ff89
	stda	%l0,[%i0+%g0]0x80	! Mem[0000000010001400] = 00000000 000000e3
!	%l6 = 00000000000000ff, Mem[0000000010081408] = 0000ff000000006b, %asi = 80
	stxa	%l6,[%i2+0x008]%asi	! Mem[0000000010081408] = 00000000000000ff
!	%l5 = 0000000000000000, Mem[0000000021800180] = f69b6a88
	stb	%l5,[%o3+0x180]		! Mem[0000000021800180] = 009b6a88
!	Mem[0000000010001400] = 00000000, %l2 = 0000000000000000
	swapa	[%i0+%g0]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000030041400] = 00000000, %l1 = 00000000000000e3
	ldstuba	[%i1+%g0]0x81,%l1	! %l1 = 00000000000000ff
!	%l1 = 0000000000000000, Mem[0000000030141400] = bd0365f0
	stba	%l1,[%i5+%g0]0x81	! Mem[0000000030141400] = 000365f0
!	%f6  = ff000000 00000000, Mem[0000000010041408] = ff000000 00000059
	stda	%f6 ,[%i1+%o4]0x80	! Mem[0000000010041408] = ff000000 00000000
!	%l5 = 0000000000000000, Mem[0000000030181408] = ffffc50b
	stha	%l5,[%i6+%o4]0x81	! Mem[0000000030181408] = 0000c50b
!	Mem[0000000030001400] = 00000000, %l7 = 000000005dd135f3
	swapa	[%i0+%g0]0x89,%l7	! %l7 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = ffffffffffffffff, %f0  = c4b07af0 4e70b2ff
	ldda	[%i3+%g0]0x81,%f0 	! %f0  = ffffffff ffffffff

p0_label_109:
!	Mem[000000001004141c] = 77749a38, %l4 = 0000000000000082
	lduh	[%i1+0x01e],%l4		! %l4 = 0000000000009a38
!	Mem[0000000020800040] = 03358327, %l6 = 00000000000000ff
	ldub	[%o1+0x040],%l6		! %l6 = 0000000000000003
!	Mem[0000000030101400] = b54cf92a, %l5 = 0000000000000000
	ldsba	[%i4+%g0]0x81,%l5	! %l5 = ffffffffffffffb5
!	Mem[0000000010081434] = 45c0fdfa, %l5 = ffffffffffffffb5
	ldub	[%i2+0x035],%l5		! %l5 = 00000000000000c0
!	Mem[0000000030041410] = 00000000, %f10 = 6ddc7182
	lda	[%i1+%o5]0x81,%f10	! %f10 = 00000000
!	Mem[0000000030041408] = ffa3aebe, %l3 = 00000000000000ff
	lduha	[%i1+%o4]0x81,%l3	! %l3 = 000000000000ffa3
!	Mem[0000000010141438] = 7de90000dde35eb2, %l5 = 00000000000000c0
	ldxa	[%i5+0x038]%asi,%l5	! %l5 = 7de90000dde35eb2
!	Mem[0000000030101400] = 350365f0 2af94cb5, %l0 = 00000000, %l1 = 00000000
	ldda	[%i4+%g0]0x89,%l0	! %l0 = 000000002af94cb5 00000000350365f0
!	Mem[0000000030041408] = ffa3aebe, %l7 = 0000000000000000
	ldsha	[%i1+%o4]0x81,%l7	! %l7 = ffffffffffffffa3
!	Starting 10 instruction Store Burst
!	%l5 = 7de90000dde35eb2, Mem[0000000010101434] = ea03c50b
	stb	%l5,[%i4+0x034]		! Mem[0000000010101434] = b203c50b

p0_label_110:
!	Mem[00000000218001c1] = 4cb07723, %l6 = 0000000000000003
	ldstub	[%o3+0x1c1],%l6		! %l6 = 000000b0000000ff
!	%l1 = 00000000350365f0, Mem[0000000010181410] = 00000000
	stwa	%l1,[%i6+%o5]0x88	! Mem[0000000010181410] = 350365f0
!	%f10 = 00000000 7487ff6b, %l7 = ffffffffffffffa3
!	Mem[0000000010101418] = 0000000014ef7179
	add	%i4,0x018,%g1
	stda	%f10,[%g1+%l7]ASI_PST32_PL ! Mem[0000000010101418] = 6bff877400000000
	membar	#Sync			! Added by membar checker (22)
!	%l7 = ffffffffffffffa3, Mem[00000000300c1410] = fa000000
	stha	%l7,[%i3+%o5]0x89	! Mem[00000000300c1410] = fa00ffa3
!	%l1 = 00000000350365f0, Mem[0000000030101400] = b54cf92a
	stha	%l1,[%i4+%g0]0x81	! Mem[0000000030101400] = 65f0f92a
!	Mem[0000000030181400] = ab000000, %l7 = ffffffffffffffa3
	ldstuba	[%i6+%g0]0x81,%l7	! %l7 = 000000ab000000ff
!	%l0 = 000000002af94cb5, Mem[0000000010001434] = e57bb2c1
	stw	%l0,[%i0+0x034]		! Mem[0000000010001434] = 2af94cb5
!	%l4 = 0000000000009a38, Mem[0000000030081410] = 00000000
	stwa	%l4,[%i2+%o5]0x81	! Mem[0000000030081410] = 00009a38
!	%l2 = 00000000, %l3 = 0000ffa3, Mem[0000000030001400] = f335d15d ff000000
	stda	%l2,[%i0+%g0]0x81	! Mem[0000000030001400] = 00000000 0000ffa3
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = 00000000 000000ff, %l4 = 00009a38, %l5 = dde35eb2
	ldda	[%i1+%o4]0x88,%l4	! %l4 = 00000000000000ff 0000000000000000

p0_label_111:
!	Mem[0000000010001408] = ff000074b2e29ec1, %l4 = 00000000000000ff
	ldxa	[%i0+%o4]0x80,%l4	! %l4 = ff000074b2e29ec1
!	Mem[0000000010041400] = 4e70b2ff, %l0 = 000000002af94cb5
	lduba	[%i1+%g0]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010041400] = ffb2704e, %l5 = 0000000000000000
	lduwa	[%i1+%g0]0x80,%l5	! %l5 = 00000000ffb2704e
!	Mem[0000000010041410] = 00000000, %f31 = d046c574
	lda	[%i1+%o5]0x88,%f31	! %f31 = 00000000
!	Mem[0000000010041420] = 7971ef14, %l6 = 00000000000000b0
	lduba	[%i1+0x021]%asi,%l6	! %l6 = 0000000000000071
!	Mem[0000000010181408] = 0000006b, %l5 = 00000000ffb2704e
	ldswa	[%i6+%o4]0x88,%l5	! %l5 = 000000000000006b
!	Mem[0000000010141408] = 0000000307e00400, %f20 = 000000fa ffff0000
	ldda	[%i5+%o4]0x80,%f20	! %f20 = 00000003 07e00400
!	Mem[00000000300c1410] = a3ff00faffff0000, %f28 = f335d15d e90dd9a2
	ldda	[%i3+%o5]0x81,%f28	! %f28 = a3ff00fa ffff0000
!	Mem[0000000030041400] = ff000000ffffffff, %f28 = a3ff00fa ffff0000
	ldda	[%i1+%g0]0x81,%f28	! %f28 = ff000000 ffffffff
!	Starting 10 instruction Store Burst
!	%l1 = 00000000350365f0, Mem[0000000010141422] = 89ffe7b0, %asi = 80
	stha	%l1,[%i5+0x022]%asi	! Mem[0000000010141420] = 89ff65f0

p0_label_112:
!	%l1 = 00000000350365f0, Mem[00000000300c1410] = fa00ffa3
	stba	%l1,[%i3+%o5]0x89	! Mem[00000000300c1410] = fa00fff0
!	%l0 = 00000000000000ff, Mem[0000000030081400] = 7b0000ff
	stha	%l0,[%i2+%g0]0x89	! Mem[0000000030081400] = 7b0000ff
!	Mem[0000000010001408] = ff000074, %l7 = 00000000000000ab
	swapa	[%i0+%o4]0x80,%l7	! %l7 = 00000000ff000074
!	%l4 = ff000074b2e29ec1, Mem[0000000030101400] = 2af9f065
	stha	%l4,[%i4+%g0]0x89	! Mem[0000000030101400] = 2af99ec1
!	%f14 = ffffffc6 d046c574, %l1 = 00000000350365f0
!	Mem[0000000030141430] = 3e12147da1050441
	add	%i5,0x030,%g1
	stda	%f14,[%g1+%l1]ASI_PST32_S ! Mem[0000000030141430] = 3e12147da1050441
!	%l6 = 0000000000000071, Mem[0000000010001428] = f0650335ea03c50b, %asi = 80
	stxa	%l6,[%i0+0x028]%asi	! Mem[0000000010001428] = 0000000000000071
!	%l5 = 000000000000006b, Mem[0000000010181408] = 0000006b
	stha	%l5,[%i6+%o4]0x88	! Mem[0000000010181408] = 0000006b
!	%f14 = ffffffc6, Mem[0000000030041408] = beaea3ff
	sta	%f14,[%i1+%o4]0x89	! Mem[0000000030041408] = ffffffc6
!	Mem[0000000010141408] = 00000003, %l5 = 000000000000006b
	swapa	[%i5+%o4]0x80,%l5	! %l5 = 0000000000000003
!	Starting 10 instruction Load Burst
!	Mem[0000000010141428] = 0bc503ea ffffffff, %l0 = 000000ff, %l1 = 350365f0
	ldd	[%i5+0x028],%l0		! %l0 = 000000000bc503ea 00000000ffffffff

p0_label_113:
!	Mem[0000000030041410] = 0000000000000000, %l4 = ff000074b2e29ec1
	ldxa	[%i1+%o5]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000030181400] = ff000000, %f0  = ffffffff
	lda	[%i6+%g0]0x81,%f0 	! %f0 = ff000000
!	Mem[0000000010041430] = a2d90de9 5dd135f3, %l0 = 0bc503ea, %l1 = ffffffff
	ldd	[%i1+0x030],%l0		! %l0 = 00000000a2d90de9 000000005dd135f3
!	Mem[0000000010001410] = c0450000, %l3 = 000000000000ffa3
	ldswa	[%i0+%o5]0x80,%l3	! %l3 = ffffffffc0450000
!	Mem[0000000030141400] = f0650300, %l3 = ffffffffc0450000
	lduha	[%i5+%g0]0x89,%l3	! %l3 = 0000000000000300
!	Mem[0000000010081400] = fa000000000000ff, %f30 = ffffffc6 00000000
	ldda	[%i2+%g0]0x88,%f30	! %f30 = fa000000 000000ff
!	Mem[0000000010041400] = ffb2704e, %l4 = 0000000000000000
	ldsba	[%i1+%g0]0x80,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000021800100] = 003a37bf, %l2 = 0000000000000000
	ldub	[%o3+0x100],%l2		! %l2 = 0000000000000000
!	Mem[0000000010081408] = 00000000, %f26 = 6ddc7182
	lda	[%i2+%o4]0x88,%f26	! %f26 = 00000000
!	Starting 10 instruction Store Burst
!	%l6 = 00000071, %l7 = ff000074, Mem[0000000010181420] = 45c0fdfa 51a2603d
	stda	%l6,[%i6+0x020]%asi	! Mem[0000000010181420] = 00000071 ff000074

p0_label_114:
!	%l0 = a2d90de9, %l1 = 5dd135f3, Mem[0000000010181410] = f0650335 00000000
	stda	%l0,[%i6+0x010]%asi	! Mem[0000000010181410] = a2d90de9 5dd135f3
!	%f9  = 14ef7179, Mem[0000000010081408] = 00000000
	sta	%f9 ,[%i2+%o4]0x80	! Mem[0000000010081408] = 14ef7179
!	Mem[0000000010101400] = 00000074, %l0 = 00000000a2d90de9
	ldstuba	[%i4+%g0]0x88,%l0	! %l0 = 00000074000000ff
!	Mem[0000000030001400] = 00000000, %l4 = ffffffffffffffff
	swapa	[%i0+%g0]0x81,%l4	! %l4 = 0000000000000000
!	%l7 = 00000000ff000074, Mem[0000000010081408] = 14ef7179000000ff
	stxa	%l7,[%i2+%o4]0x80	! Mem[0000000010081408] = 00000000ff000074
!	Mem[00000000100c1410] = 000000ff, %l2 = 0000000000000000
	swapa	[%i3+%o5]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[00000000211c0000] = 00ff6217, %l1 = 000000005dd135f3
	ldstuba	[%o2+0x000]%asi,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010081430] = 00000000, %l6 = 0000000000000071
	swap	[%i2+0x030],%l6		! %l6 = 0000000000000000
!	%l2 = 000000ff, %l3 = 00000300, Mem[0000000010101430] = bd000000 b203c50b
	std	%l2,[%i4+0x030]		! Mem[0000000010101430] = 000000ff 00000300
!	Starting 10 instruction Load Burst
!	Mem[0000000020800000] = ff455afb, %l1 = 0000000000000000
	ldsha	[%o1+0x000]%asi,%l1	! %l1 = ffffffffffffff45

p0_label_115:
!	Mem[0000000010041438] = 74c546d0, %l2 = 00000000000000ff
	ldsha	[%i1+0x03a]%asi,%l2	! %l2 = 00000000000046d0
!	Mem[0000000030101408] = f218444f, %l1 = ffffffffffffff45
	lduha	[%i4+%o4]0x89,%l1	! %l1 = 000000000000444f
!	Mem[00000000218000c0] = 17bde748, %l1 = 000000000000444f
	ldsb	[%o3+0x0c1],%l1		! %l1 = ffffffffffffffbd
!	Mem[00000000300c1400] = ffffffffffffffff, %f12 = f335d15d e90dd9a2
	ldda	[%i3+%g0]0x89,%f12	! %f12 = ffffffff ffffffff
!	Mem[0000000010041428] = 6bff8774, %f14 = ffffffc6
	lda	[%i1+0x028]%asi,%f14	! %f14 = 6bff8774
!	Mem[00000000100c1400] = ff000000, %l4 = 0000000000000000
	ldswa	[%i3+%g0]0x80,%l4	! %l4 = ffffffffff000000
!	Mem[0000000010101408] = 000000ff, %l5 = 0000000000000003
	ldsha	[%i4+%o4]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000010141408] = 0000006b07e00400, %l3 = 0000000000000300
	ldxa	[%i5+0x008]%asi,%l3	! %l3 = 0000006b07e00400
!	Mem[0000000010041438] = 74c546d0, %l0 = 0000000000000074
	lduh	[%i1+0x038],%l0		! %l0 = 00000000000074c5
!	Starting 10 instruction Store Burst
!	Mem[0000000010141400] = ff000000, %l3 = 0000006b07e00400
	ldstuba	[%i5+%g0]0x80,%l3	! %l3 = 000000ff000000ff

p0_label_116:
!	%l5 = 0000000000000000, Mem[0000000020800000] = ff455afb, %asi = 80
	stha	%l5,[%o1+0x000]%asi	! Mem[0000000020800000] = 00005afb
!	Mem[00000000100c143d] = 04177388, %l6 = 0000000000000000
	ldstub	[%i3+0x03d],%l6		! %l6 = 00000017000000ff
!	%l3 = 00000000000000ff, Mem[0000000030181410] = ff000000
	stwa	%l3,[%i6+%o5]0x89	! Mem[0000000030181410] = 000000ff
!	Mem[0000000030181410] = ff000000, %l2 = 00000000000046d0
	ldstuba	[%i6+%o5]0x81,%l2	! %l2 = 000000ff000000ff
!	%f24 = 7db8a8fe 14ef7179, Mem[0000000010141408] = 6b000000 0004e007
	stda	%f24,[%i5+%o4]0x88	! Mem[0000000010141408] = 7db8a8fe 14ef7179
!	%l0 = 00000000000074c5, Mem[00000000201c0000] = 6bc18a5f
	sth	%l0,[%o0+%g0]		! Mem[00000000201c0000] = 74c58a5f
!	Mem[000000001008141e] = 0000ff89, %l0 = 00000000000074c5
	ldstub	[%i2+0x01e],%l0		! %l0 = 000000ff000000ff
!	Mem[00000000300c1410] = fa00fff0, %l1 = ffffffffffffffbd
	swapa	[%i3+%o5]0x89,%l1	! %l1 = 00000000fa00fff0
!	Mem[0000000010101418] = 6bff8774, %l1 = fa00fff0, %l6 = 00000017
	add	%i4,0x18,%g1
	casa	[%g1]0x80,%l1,%l6	! %l6 = 000000006bff8774
!	Starting 10 instruction Load Burst
!	Mem[0000000010101424] = 59000000, %l4 = ffffffffff000000
	ldub	[%i4+0x026],%l4		! %l4 = 0000000000000000

p0_label_117:
!	Mem[0000000010101400] = ff000000 000000ff, %l2 = 000000ff, %l3 = 000000ff
	ldd	[%i4+%g0],%l2		! %l2 = 00000000ff000000 00000000000000ff
!	Mem[00000000300c1408] = 00000059, %l5 = 0000000000000000
	lduha	[%i3+%o4]0x89,%l5	! %l5 = 0000000000000059
!	Mem[00000000201c0000] = 74c58a5f, %l7 = 00000000ff000074
	lduha	[%o0+0x000]%asi,%l7	! %l7 = 00000000000074c5
!	Mem[0000000010181418] = 00000040 259fa9be, %l2 = ff000000, %l3 = 000000ff
	ldda	[%i6+0x018]%asi,%l2	! %l2 = 0000000000000040 00000000259fa9be
!	Mem[00000000100c1408] = 45c0fdff, %l1 = 00000000fa00fff0
	ldswa	[%i3+%o4]0x88,%l1	! %l1 = 0000000045c0fdff
!	Mem[0000000030141410] = ff000000, %l1 = 0000000045c0fdff
	ldsba	[%i5+%o5]0x81,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010141408] = 14ef7179, %l7 = 00000000000074c5
	lduwa	[%i5+%o4]0x88,%l7	! %l7 = 0000000014ef7179
!	Mem[0000000010101400] = ff000000, %l7 = 0000000014ef7179
	ldsha	[%i4+%g0]0x80,%l7	! %l7 = ffffffffffffff00
!	Mem[0000000010101410] = ff000000 00000059, %l0 = 000000ff, %l1 = ffffffff
	ldda	[%i4+%o5]0x80,%l0	! %l0 = 00000000ff000000 0000000000000059
!	Starting 10 instruction Store Burst
!	%l6 = 000000006bff8774, Mem[0000000030041400] = ff000000
	stha	%l6,[%i1+%g0]0x81	! Mem[0000000030041400] = 87740000

p0_label_118:
!	%l7 = ffffffffffffff00, Mem[0000000030041410] = 0000000000000000
	stxa	%l7,[%i1+%o5]0x81	! Mem[0000000030041410] = ffffffffffffff00
!	%l4 = 00000000, %l5 = 00000059, Mem[0000000030001400] = ffffffff 0000ffa3
	stda	%l4,[%i0+%g0]0x81	! Mem[0000000030001400] = 00000000 00000059
!	%l5 = 0000000000000059, Mem[0000000030001408] = 77749a38
	stwa	%l5,[%i0+%o4]0x89	! Mem[0000000030001408] = 00000059
!	%f12 = ffffffff ffffffff, Mem[00000000100c1400] = ff000000 0000000b
	stda	%f12,[%i3+%g0]0x80	! Mem[00000000100c1400] = ffffffff ffffffff
!	%f4  = 000000fa ffff0000, %l6 = 000000006bff8774
!	Mem[0000000030141438] = 3fbc3a075264b172
	add	%i5,0x038,%g1
	stda	%f4,[%g1+%l6]ASI_PST16_S ! Mem[0000000030141438] = 3fbc00fa5264b172
!	Mem[00000000300c1410] = bdffffff, %l1 = 0000000000000059
	ldstuba	[%i3+%o5]0x81,%l1	! %l1 = 000000bd000000ff
!	%f8  = 7db8a8fe 14ef7179, Mem[0000000010001408] = 000000ab b2e29ec1
	stda	%f8 ,[%i0+%o4]0x80	! Mem[0000000010001408] = 7db8a8fe 14ef7179
!	%l3 = 00000000259fa9be, Mem[00000000218001c1] = 4cff7723
	stb	%l3,[%o3+0x1c1]		! Mem[00000000218001c0] = 4cbe7723
!	%f12 = ffffffff ffffffff, %l6 = 000000006bff8774
!	Mem[00000000100c1420] = 7db8a8fe14ef7179
	add	%i3,0x020,%g1
	stda	%f12,[%g1+%l6]ASI_PST32_P ! Mem[00000000100c1420] = 7db8a8fe14ef7179
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = 00000000, %l4 = 0000000000000000
	lduba	[%i1+%o5]0x80,%l4	! %l4 = 0000000000000000

p0_label_119:
!	Mem[00000000300c1400] = ffffffff, %l6 = 000000006bff8774
	lduha	[%i3+%g0]0x89,%l6	! %l6 = 000000000000ffff
!	Mem[0000000030081400] = 350365f07b0000ff, %l6 = 000000000000ffff
	ldxa	[%i2+%g0]0x89,%l6	! %l6 = 350365f07b0000ff
!	Mem[0000000010081400] = ff000000, %l4 = 0000000000000000
	ldsha	[%i2+%g0]0x80,%l4	! %l4 = ffffffffffffff00
!	Mem[0000000010001400] = 00000000, %l1 = 00000000000000bd
	lduba	[%i0+%g0]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010001418] = a7d756a7, %l1 = 0000000000000000
	ldswa	[%i0+0x018]%asi,%l1	! %l1 = ffffffffa7d756a7
!	Mem[0000000010041438] = 74c546d0, %l6 = 350365f07b0000ff
	lduw	[%i1+0x038],%l6		! %l6 = 0000000074c546d0
!	Mem[0000000010141400] = 000000ff, %f14 = 6bff8774
	lda	[%i5+%g0]0x88,%f14	! %f14 = 000000ff
!	Mem[0000000010001400] = 00000000, %f23 = 0000000b
	lda	[%i0+%g0]0x88,%f23	! %f23 = 00000000
!	Mem[0000000010081410] = ffff0000, %l2 = 0000000000000040
	ldstuba	[%i2+%o5]0x88,%l2	! %l2 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l4 = ffffffffffffff00, Mem[0000000030141400] = 000365f0
	stwa	%l4,[%i5+%g0]0x81	! Mem[0000000030141400] = ffffff00

p0_label_120:
!	%f12 = ffffffff ffffffff, %f2  = 59000000 000000ff
	fxtod	%f12,%f2 		! %f2  = bff00000 00000000
!	%f4  = 000000fa, Mem[0000000010181410] = e90dd9a2
	sta	%f4 ,[%i6+%o5]0x88	! Mem[0000000010181410] = 000000fa
!	%l4 = ffffff00, %l5 = 00000059, Mem[0000000010181400] = e3000074 ff00007b
	stda	%l4,[%i6+%g0]0x88	! Mem[0000000010181400] = ffffff00 00000059
!	%l6 = 0000000074c546d0, Mem[000000001010140e] = 00ff00b2
	sth	%l6,[%i4+0x00e]		! Mem[000000001010140c] = 00ff46d0
!	%f12 = ffffffff ffffffff, %l6 = 0000000074c546d0
!	Mem[0000000010001408] = 7db8a8fe14ef7179
	add	%i0,0x008,%g1
	stda	%f12,[%g1+%l6]ASI_PST32_P ! Mem[0000000010001408] = 7db8a8fe14ef7179
!	Mem[0000000030181400] = 000000ff, %l1 = ffffffffa7d756a7
	swapa	[%i6+%g0]0x89,%l1	! %l1 = 00000000000000ff
!	%l2 = 0000000000000000, Mem[0000000010101410] = 000000ff
	stba	%l2,[%i4+%o5]0x88	! Mem[0000000010101410] = 00000000
!	%l5 = 0000000000000059, Mem[0000000010181400] = 00000059ffffff00
	stxa	%l5,[%i6+%g0]0x88	! Mem[0000000010181400] = 0000000000000059
!	%f6  = ff000000, Mem[0000000010181400] = 59000000
	sta	%f6 ,[%i6+%g0]0x80	! Mem[0000000010181400] = ff000000
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = fffdc045, %l0 = 00000000ff000000
	ldsha	[%i3+%o4]0x80,%l0	! %l0 = fffffffffffffffd

p0_label_121:
!	Mem[0000000030101408] = f218444f, %l2 = 0000000000000000
	lduha	[%i4+%o4]0x89,%l2	! %l2 = 000000000000444f
!	Mem[0000000030041410] = ffffffff ffffff00, %l2 = 0000444f, %l3 = 259fa9be
	ldda	[%i1+%o5]0x81,%l2	! %l2 = 00000000ffffffff 00000000ffffff00
!	Mem[0000000010041410] = 00000000, %l7 = ffffffffffffff00
	lduba	[%i1+%o5]0x88,%l7	! %l7 = 0000000000000000
!	Mem[00000000100c1420] = 7db8a8fe, %l2 = 00000000ffffffff
	lduha	[%i3+0x022]%asi,%l2	! %l2 = 000000000000a8fe
!	Mem[0000000010101400] = ff000000, %f10 = 00000000
	lda	[%i4+%g0]0x80,%f10	! %f10 = ff000000
!	Mem[0000000030101410] = 00000000, %l4 = ffffffffffffff00
	lduha	[%i4+%o5]0x81,%l4	! %l4 = 0000000000000000
!	Mem[00000000300c1400] = ffffffff ffffffff, %l0 = fffffffd, %l1 = 000000ff
	ldda	[%i3+%g0]0x89,%l0	! %l0 = 00000000ffffffff 00000000ffffffff
!	Mem[0000000010181400] = ff000000, %l7 = 0000000000000000
	ldsb	[%i6+0x002],%l7		! %l7 = 0000000000000000
!	Mem[000000001000142c] = 00000071, %f24 = 7db8a8fe
	ld	[%i0+0x02c],%f24	! %f24 = 00000071
!	Starting 10 instruction Store Burst
!	%l6 = 0000000074c546d0, Mem[00000000100c1400] = ffffffffffffffff
	stx	%l6,[%i3+%g0]		! Mem[00000000100c1400] = 0000000074c546d0

p0_label_122:
!	Mem[0000000020800040] = 03358327, %l7 = 0000000000000000
	ldstuba	[%o1+0x040]%asi,%l7	! %l7 = 00000003000000ff
!	%l3 = 00000000ffffff00, Mem[0000000010181408] = 0000006b
	stwa	%l3,[%i6+%o4]0x88	! Mem[0000000010181408] = ffffff00
!	Mem[0000000030041410] = ffffffff, %l6 = 0000000074c546d0
	swapa	[%i1+%o5]0x81,%l6	! %l6 = 00000000ffffffff
!	Mem[0000000010181430] = 73e09b6500000000, %l3 = 00000000ffffff00, %l7 = 0000000000000003
	add	%i6,0x30,%g1
	casxa	[%g1]0x80,%l3,%l7	! %l7 = 73e09b6500000000
!	%l1 = 00000000ffffffff, Mem[00000000100c141d] = 0000006b, %asi = 80
	stba	%l1,[%i3+0x01d]%asi	! Mem[00000000100c141c] = 00ff006b
!	%l3 = 00000000ffffff00, Mem[0000000010141410] = 000000000000c045
	stxa	%l3,[%i5+%o5]0x88	! Mem[0000000010141410] = 00000000ffffff00
!	%f22 = ff000000 00000000, %l3 = 00000000ffffff00
!	Mem[0000000010081430] = 0000007145c0fdfa
	add	%i2,0x030,%g1
	stda	%f22,[%g1+%l3]ASI_PST32_P ! Mem[0000000010081430] = 0000007145c0fdfa
!	%l2 = 000000000000a8fe, Mem[0000000010081410] = ff00ffff
	stwa	%l2,[%i2+%o5]0x80	! Mem[0000000010081410] = 0000a8fe
!	Mem[00000000300c1410] = ffffffff, %l1 = 00000000ffffffff
	ldstuba	[%i3+%o5]0x89,%l1	! %l1 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = 0000a8fe, %l1 = 00000000000000ff
	lduha	[%i2+%o5]0x80,%l1	! %l1 = 0000000000000000

p0_label_123:
!	Mem[0000000030141408] = 00000000000000ff, %l3 = 00000000ffffff00
	ldxa	[%i5+%o4]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010101410] = 00000000 00000059, %l4 = 00000000, %l5 = 00000059
	ldda	[%i4+%o5]0x80,%l4	! %l4 = 0000000000000000 0000000000000059
!	Mem[0000000010181408] = 00ffffff18f20000, %f22 = ff000000 00000000
	ldda	[%i6+0x008]%asi,%f22	! %f22 = 00ffffff 18f20000
!	Mem[0000000010181408] = 00ffffff18f20000, %l7 = 73e09b6500000000
	ldxa	[%i6+0x008]%asi,%l7	! %l7 = 00ffffff18f20000
!	Mem[000000001000142c] = 00000071, %l3 = 00000000000000ff
	ldsb	[%i0+0x02e],%l3		! %l3 = 0000000000000000
!	Mem[0000000010141414] = 00000000, %l6 = 00000000ffffffff
	ldub	[%i5+0x016],%l6		! %l6 = 0000000000000000
!	Mem[0000000010041410] = 00000000, %l2 = 000000000000a8fe
	ldswa	[%i1+%o5]0x80,%l2	! %l2 = 0000000000000000
!	Mem[00000000100c1408] = 45c0fdff, %l1 = 0000000000000000
	ldsba	[%i3+%o4]0x88,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010041408] = 000000ff, %l1 = ffffffffffffffff
	ldswa	[%i1+%o4]0x88,%l1	! %l1 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%f26 = 00000000 7487ff6b, Mem[0000000010101400] = ff000000 000000ff
	stda	%f26,[%i4+%g0]0x80	! Mem[0000000010101400] = 00000000 7487ff6b

p0_label_124:
!	%l2 = 0000000000000000, Mem[0000000010141405] = 00ff0000, %asi = 80
	stba	%l2,[%i5+0x005]%asi	! Mem[0000000010141404] = 00000000
!	%l3 = 0000000000000000, Mem[0000000030041410] = 00ffffffd046c574
	stxa	%l3,[%i1+%o5]0x89	! Mem[0000000030041410] = 0000000000000000
!	%l6 = 0000000000000000, Mem[0000000010181408] = 00ffffff
	stba	%l6,[%i6+%o4]0x80	! Mem[0000000010181408] = 00ffffff
!	%l3 = 0000000000000000, Mem[0000000010141410] = 00000000ffffff00
	stxa	%l3,[%i5+%o5]0x88	! Mem[0000000010141410] = 0000000000000000
!	%f30 = fa000000 000000ff, Mem[0000000010041400] = ffb2704e 605aab5c
	stda	%f30,[%i1+%g0]0x80	! Mem[0000000010041400] = fa000000 000000ff
!	Mem[0000000030001408] = 59000000, %l5 = 0000000000000059
	swapa	[%i0+%o4]0x81,%l5	! %l5 = 0000000059000000
!	%f28 = ff000000, Mem[0000000030101410] = 00000000
	sta	%f28,[%i4+%o5]0x81	! Mem[0000000030101410] = ff000000
!	%f8  = 7db8a8fe, Mem[0000000030041408] = ffffffc6
	sta	%f8 ,[%i1+%o4]0x89	! Mem[0000000030041408] = 7db8a8fe
!	%f16 = ffffffff ffffffff 59000000 000000ff
!	%f20 = 00000003 07e00400 00ffffff 18f20000
!	%f24 = 00000071 14ef7179 00000000 7487ff6b
!	%f28 = ff000000 ffffffff fa000000 000000ff
	stda	%f16,[%i1]ASI_BLK_S	! Block Store to 0000000030041400
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = ffff6217, %l3 = 0000000000000000
	ldsb	[%o2+0x001],%l3		! %l3 = ffffffffffffffff

p0_label_125:
!	Mem[00000000100c1408] = 45c0fdff, %l7 = 00ffffff18f20000
	ldswa	[%i3+%o4]0x88,%l7	! %l7 = 0000000045c0fdff
!	Mem[00000000300c1410] = ffffffff, %l7 = 0000000045c0fdff
	lduba	[%i3+%o5]0x89,%l7	! %l7 = 00000000000000ff
	membar	#Sync			! Added by membar checker (23)
!	Mem[0000000010041408] = ff000000, %l0 = 00000000ffffffff
	ldsba	[%i1+%o4]0x80,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000030101408] = 4f4418f2, %l1 = 00000000000000ff
	lduha	[%i4+%o4]0x81,%l1	! %l1 = 0000000000004f44
!	Mem[0000000030141400] = ffffff00, %l6 = 0000000000000000
	lduwa	[%i5+%g0]0x81,%l6	! %l6 = 00000000ffffff00
!	Mem[0000000030081400] = ff00007b, %l3 = ffffffffffffffff
	ldswa	[%i2+%g0]0x81,%l3	! %l3 = ffffffffff00007b
!	Mem[0000000010001438] = b25ee3dd, %l0 = ffffffffffffffff
	ldsha	[%i0+0x038]%asi,%l0	! %l0 = ffffffffffffb25e
!	Mem[0000000030101400] = c19ef92a, %l2 = 0000000000000000
	ldsba	[%i4+%g0]0x81,%l2	! %l2 = ffffffffffffffc1
!	Mem[0000000010101400] = 6bff877400000000, %l5 = 0000000059000000
	ldxa	[%i4+%g0]0x88,%l5	! %l5 = 6bff877400000000
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1408] = 45c0fdff, %l1 = 0000000000004f44
	ldsha	[%i3+%o4]0x88,%l1	! %l1 = fffffffffffffdff

p0_label_126:
!	%l1 = fffffffffffffdff, Mem[0000000030181400] = a7d756a7
	stwa	%l1,[%i6+%g0]0x89	! Mem[0000000030181400] = fffffdff
!	Mem[0000000010001410] = 000045c0, %l7 = 00000000000000ff
	swapa	[%i0+%o5]0x88,%l7	! %l7 = 00000000000045c0
!	Mem[0000000030141400] = 00ffffff, %l3 = ffffffffff00007b
	ldstuba	[%i5+%g0]0x89,%l3	! %l3 = 000000ff000000ff
!	%l1 = fffffffffffffdff, Mem[00000000100c1410] = 00000000000000bd
	stxa	%l1,[%i3+%o5]0x80	! Mem[00000000100c1410] = fffffffffffffdff
!	Mem[0000000030101400] = 2af99ec1, %l2 = ffffffffffffffc1
	swapa	[%i4+%g0]0x89,%l2	! %l2 = 000000002af99ec1
!	%l2 = 2af99ec1, %l3 = 000000ff, Mem[0000000030141408] = 000000ff 00000000
	stda	%l2,[%i5+%o4]0x89	! Mem[0000000030141408] = 2af99ec1 000000ff
!	%l6 = ffffff00, %l7 = 000045c0, Mem[0000000030141408] = 2af99ec1 000000ff
	stda	%l6,[%i5+%o4]0x89	! Mem[0000000030141408] = ffffff00 000045c0
!	Mem[0000000010081408] = 00000000, %l5 = 6bff877400000000
	swapa	[%i2+%o4]0x80,%l5	! %l5 = 0000000000000000
!	%l4 = 0000000000000000, Mem[0000000010181408] = 00ffffff18f20000
	stxa	%l4,[%i6+%o4]0x80	! Mem[0000000010181408] = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = 000000ff, %l2 = 000000002af99ec1
	lduha	[%i5+%g0]0x88,%l2	! %l2 = 00000000000000ff

p0_label_127:
!	Mem[0000000030041400] = ffffffff, %l1 = fffffffffffffdff
	ldswa	[%i1+%g0]0x81,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000030001408] = 00000059350365f0, %f26 = 00000000 7487ff6b
	ldda	[%i0+%o4]0x81,%f26	! %f26 = 00000059 350365f0
!	Code Fragment 4
p0_fragment_3:
!	%l0 = ffffffffffffb25e
	setx	0xbef2abbfc074a362,%g7,%l0 ! %l0 = bef2abbfc074a362
!	%l1 = ffffffffffffffff
	setx	0x558fdd905c8edc34,%g7,%l1 ! %l1 = 558fdd905c8edc34
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = bef2abbfc074a362
	setx	0x110e6b67aa2ad740,%g7,%l0 ! %l0 = 110e6b67aa2ad740
!	%l1 = 558fdd905c8edc34
	setx	0xdb620cdfae154a03,%g7,%l1 ! %l1 = db620cdfae154a03
!	Mem[0000000010001400] = 00000000, %l0 = 110e6b67aa2ad740
	lduha	[%i0+%g0]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000030101410] = ff000000, %l2 = 00000000000000ff
	ldsba	[%i4+%o5]0x81,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000030181410] = ff000000, %l5 = 0000000000000000
	lduwa	[%i6+%o5]0x81,%l5	! %l5 = 00000000ff000000
!	Mem[0000000010001428] = 00000000, %f26 = 00000059
	ld	[%i0+0x028],%f26	! %f26 = 00000000
!	Mem[0000000030081408] = 000000ff, %l5 = 00000000ff000000
	ldswa	[%i2+%o4]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010081410] = fea80000, %l1 = db620cdfae154a03
	lduba	[%i2+%o5]0x88,%l1	! %l1 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l1 = 0000000000000000, Mem[0000000030081410] = 389a0000
	stha	%l1,[%i2+%o5]0x89	! Mem[0000000030081410] = 389a0000

p0_label_128:
!	%l3 = 00000000000000ff, Mem[00000000100c1400] = 00000000
	stba	%l3,[%i3+%g0]0x88	! Mem[00000000100c1400] = 000000ff
!	%l3 = 00000000000000ff, Mem[0000000030001410] = a2d90de95dd135f3
	stxa	%l3,[%i0+%o5]0x89	! Mem[0000000030001410] = 00000000000000ff
!	Mem[0000000010101410] = 00000000, %l7 = 00000000000045c0
	ldstuba	[%i4+%o5]0x80,%l7	! %l7 = 00000000000000ff
!	%l2 = ffffffffffffffff, Mem[0000000010001430] = 000000bd, %asi = 80
	stwa	%l2,[%i0+0x030]%asi	! Mem[0000000010001430] = ffffffff
!	Mem[0000000010101400] = 00000000, %l5 = 00000000000000ff
	ldstuba	[%i4+%g0]0x80,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030001408] = 59000000, %l7 = 0000000000000000
	swapa	[%i0+%o4]0x89,%l7	! %l7 = 0000000059000000
!	%f2  = bff00000 00000000, %l5 = 0000000000000000
!	Mem[0000000010181430] = 73e09b6500000000
	add	%i6,0x030,%g1
	stda	%f2,[%g1+%l5]ASI_PST16_P ! Mem[0000000010181430] = 73e09b6500000000
!	Mem[0000000010141408] = 7971ef14, %l2 = ffffffffffffffff
	ldstuba	[%i5+%o4]0x80,%l2	! %l2 = 00000079000000ff
!	%l3 = 00000000000000ff, Mem[00000000201c0000] = 74c58a5f, %asi = 80
	stha	%l3,[%o0+0x000]%asi	! Mem[00000000201c0000] = 00ff8a5f
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = 00ff8a5f, %l3 = 00000000000000ff
	ldsb	[%o0+%g0],%l3		! %l3 = 0000000000000000

p0_label_129:
!	Mem[0000000010181400] = 00000000000000ff, %f10 = ff000000 7487ff6b
	ldda	[%i6+%g0]0x88,%f10	! %f10 = 00000000 000000ff
!	Mem[0000000010041418] = f0650335, %l7 = 0000000059000000
	lduha	[%i1+0x01a]%asi,%l7	! %l7 = 0000000000000335
!	Mem[0000000010081400] = ff000000000000fa, %f14 = 000000ff d046c574
	ldda	[%i2+%g0]0x80,%f14	! %f14 = ff000000 000000fa
!	Mem[0000000010001424] = b0e7ff89, %l0 = 0000000000000000
	lduha	[%i0+0x024]%asi,%l0	! %l0 = 000000000000b0e7
!	Mem[0000000010001410] = 000000ff, %l5 = 0000000000000000
	lduwa	[%i0+%o5]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010001424] = b0e7ff89, %l5 = 00000000000000ff
	ldsb	[%i0+0x025],%l5		! %l5 = ffffffffffffffe7
!	Mem[0000000020800000] = 00005afb, %l5 = ffffffffffffffe7
	ldub	[%o1+0x001],%l5		! %l5 = 0000000000000000
!	Mem[0000000010101408] = ff000000, %l5 = 0000000000000000
	lduba	[%i4+%o4]0x88,%l5	! %l5 = 0000000000000000
!	Mem[00000000300c1410] = 0000ffffffffffff, %l4 = 0000000000000000
	ldxa	[%i3+%o5]0x89,%l4	! %l4 = 0000ffffffffffff
!	Starting 10 instruction Store Burst
!	Mem[000000001000143c] = 0000007d, %l7 = 0000000000000335
	swap	[%i0+0x03c],%l7		! %l7 = 000000000000007d

p0_label_130:
!	Mem[00000000211c0000] = ffff6217, %l6 = 00000000ffffff00
	ldstub	[%o2+%g0],%l6		! %l6 = 000000ff000000ff
!	%l7 = 000000000000007d, Mem[0000000010101432] = 000000ff
	sth	%l7,[%i4+0x032]		! Mem[0000000010101430] = 0000007d
!	%l2 = 0000000000000079, Mem[0000000010041408] = 000000ff
	stwa	%l2,[%i1+%o4]0x88	! Mem[0000000010041408] = 00000079
!	Mem[0000000010181418] = 00000040, %l7 = 000000000000007d, %asi = 80
	swapa	[%i6+0x018]%asi,%l7	! %l7 = 0000000000000040
!	%l6 = 000000ff, %l7 = 00000040, Mem[0000000010081400] = 000000ff fa000000
	stda	%l6,[%i2+%g0]0x88	! Mem[0000000010081400] = 000000ff 00000040
!	%f26 = 00000000 350365f0, Mem[0000000010181410] = 000000fa f335d15d
	stda	%f26,[%i6+%o5]0x88	! Mem[0000000010181410] = 00000000 350365f0
!	%f0  = ff000000 ffffffff bff00000 00000000
!	%f4  = 000000fa ffff0000 ff000000 00000000
!	%f8  = 7db8a8fe 14ef7179 00000000 000000ff
!	%f12 = ffffffff ffffffff ff000000 000000fa
	stda	%f0,[%i0]ASI_BLK_AIUP	! Block Store to 0000000010001400
!	Mem[0000000010181414] = 00000000, %l3 = 0000000000000000
	swap	[%i6+0x014],%l3		! %l3 = 0000000000000000
!	%l1 = 0000000000000000, Mem[0000000010001400] = 000000ff
	stha	%l1,[%i0+%g0]0x88	! Mem[0000000010001400] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = ff000000, %l4 = 0000ffffffffffff
	ldswa	[%i5+%g0]0x80,%l4	! %l4 = ffffffffff000000

p0_label_131:
!	Mem[00000000100c1408] = fffdc045, %l5 = 0000000000000000
	ldswa	[%i3+%o4]0x80,%l5	! %l5 = fffffffffffdc045
!	Mem[0000000030081400] = 7b0000ff, %l4 = ffffffffff000000
	ldswa	[%i2+%g0]0x89,%l4	! %l4 = 000000007b0000ff
!	Mem[0000000010041400] = fa000000, %l3 = 0000000000000000
	ldsha	[%i1+%g0]0x80,%l3	! %l3 = fffffffffffffa00
!	Mem[0000000030181408] = 0bc50000, %l4 = 000000007b0000ff
	lduwa	[%i6+%o4]0x89,%l4	! %l4 = 000000000bc50000
!	Mem[0000000010081420] = ff4a02e7, %l7 = 0000000000000040
	lduw	[%i2+0x020],%l7		! %l7 = 00000000ff4a02e7
!	Mem[00000000100c1410] = ffffffff, %l3 = fffffffffffffa00
	ldsba	[%i3+%o5]0x80,%l3	! %l3 = ffffffffffffffff
!	Mem[00000000300c1408] = 00000059, %l7 = 00000000ff4a02e7
	lduwa	[%i3+%o4]0x89,%l7	! %l7 = 0000000000000059
!	Mem[0000000010141410] = 00000000 00000000, %l6 = 000000ff, %l7 = 00000059
	ldda	[%i5+%o5]0x88,%l6	! %l6 = 0000000000000000 0000000000000000
!	Mem[0000000030101408] = f218444f, %l2 = 0000000000000079
	lduba	[%i4+%o4]0x89,%l2	! %l2 = 000000000000004f
!	Starting 10 instruction Store Burst
!	%l5 = fffffffffffdc045, Mem[0000000010001408] = bff00000
	stha	%l5,[%i0+%o4]0x80	! Mem[0000000010001408] = c0450000

p0_label_132:
!	%f28 = ff000000 ffffffff, Mem[0000000030001408] = 00000000 f0650335
	stda	%f28,[%i0+%o4]0x89	! Mem[0000000030001408] = ff000000 ffffffff
!	%l2 = 000000000000004f, Mem[00000000100c1400] = d046c574000000ff
	stxa	%l2,[%i3+%g0]0x88	! Mem[00000000100c1400] = 000000000000004f
!	Mem[0000000030001408] = ffffffff, %l6 = 0000000000000000
	swapa	[%i0+%o4]0x81,%l6	! %l6 = 00000000ffffffff
!	Mem[0000000030081410] = 00009a38, %l7 = 0000000000000000
	swapa	[%i2+%o5]0x81,%l7	! %l7 = 0000000000009a38
!	%l1 = 0000000000000000, Mem[0000000010101410] = ff000000, %asi = 80
	stha	%l1,[%i4+0x010]%asi	! Mem[0000000010101410] = 00000000
	membar	#Sync			! Added by membar checker (24)
!	Mem[0000000010001428] = 00000000000000ff, %l7 = 0000000000009a38, %l2 = 000000000000004f
	add	%i0,0x28,%g1
	casxa	[%g1]0x80,%l7,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010041420] = 7971ef14, %l4 = 000000000bc50000, %asi = 80
	swapa	[%i1+0x020]%asi,%l4	! %l4 = 000000007971ef14
!	%l6 = 00000000ffffffff, Mem[0000000010081408] = 00000000
	stha	%l6,[%i2+%o4]0x88	! Mem[0000000010081408] = 0000ffff
!	Mem[0000000030041400] = ffffffff, %l3 = ffffffffffffffff
	swapa	[%i1+%g0]0x81,%l3	! %l3 = 00000000ffffffff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = 4f00000000000000, %f0  = ff000000 ffffffff
	ldda	[%i3+%g0]0x80,%f0 	! %f0  = 4f000000 00000000

p0_label_133:
!	Mem[0000000030081400] = ff00007b, %l1 = 0000000000000000
	lduha	[%i2+%g0]0x81,%l1	! %l1 = 000000000000ff00
!	Mem[0000000030001410] = ff000000, %l2 = 00000000000000ff
	ldswa	[%i0+%o5]0x81,%l2	! %l2 = ffffffffff000000
!	Mem[0000000030141408] = 00ffffff c0450000, %l2 = ff000000, %l3 = ffffffff
	ldda	[%i5+%o4]0x81,%l2	! %l2 = 0000000000ffffff 00000000c0450000
!	Mem[0000000030001408] = 00000000, %l3 = 00000000c0450000
	lduha	[%i0+%o4]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000010141400] = ff000000 00000000, %l2 = 00ffffff, %l3 = 00000000
	ldda	[%i5+%g0]0x80,%l2	! %l2 = 00000000ff000000 0000000000000000
!	Mem[0000000010101408] = 000000ff00ff46d0, %f14 = ff000000 000000fa
	ldda	[%i4+%o4]0x80,%f14	! %f14 = 000000ff 00ff46d0
!	Mem[0000000010001400] = 00000000, %l3 = 0000000000000000
	lduba	[%i0+%g0]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000030141410] = 000000ff, %l3 = 0000000000000000
	lduwa	[%i5+%o5]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030081400] = ff00007b, %f3  = 00000000
	lda	[%i2+%g0]0x81,%f3 	! %f3 = ff00007b
!	Starting 10 instruction Store Burst
!	%l6 = 00000000ffffffff, Mem[0000000030141400] = ffffffff00ffffff
	stxa	%l6,[%i5+%g0]0x89	! Mem[0000000030141400] = 00000000ffffffff

p0_label_134:
!	%l3 = 00000000000000ff, Mem[0000000010081400] = ff00000040000000
	stxa	%l3,[%i2+%g0]0x80	! Mem[0000000010081400] = 00000000000000ff
!	%f12 = ffffffff ffffffff, Mem[0000000030181408] = 0000c50b ff000000
	stda	%f12,[%i6+%o4]0x81	! Mem[0000000030181408] = ffffffff ffffffff
!	%f6  = ff000000 00000000, Mem[0000000030141408] = ffffff00 000045c0
	stda	%f6 ,[%i5+%o4]0x89	! Mem[0000000030141408] = ff000000 00000000
!	%l0 = 000000000000b0e7, Mem[0000000030081410] = 00000000e57bb2c1
	stxa	%l0,[%i2+%o5]0x81	! Mem[0000000030081410] = 000000000000b0e7
!	%l0 = 000000000000b0e7, Mem[00000000300c1400] = ffffffff
	stha	%l0,[%i3+%g0]0x81	! Mem[00000000300c1400] = b0e7ffff
!	Mem[0000000010141438] = 7de90000, %l5 = fffdc045, %l1 = 0000ff00
	add	%i5,0x38,%g1
	casa	[%g1]0x80,%l5,%l1	! %l1 = 000000007de90000
!	%f10 = 00000000 000000ff, Mem[00000000300c1408] = 00000059 ff000000
	stda	%f10,[%i3+%o4]0x89	! Mem[00000000300c1408] = 00000000 000000ff
!	%l4 = 000000007971ef14, Mem[0000000010181408] = 00000000
	stwa	%l4,[%i6+%o4]0x88	! Mem[0000000010181408] = 7971ef14
!	%l6 = 00000000ffffffff, Mem[0000000010001420] = 7db8a8fe, %asi = 80
	stwa	%l6,[%i0+0x020]%asi	! Mem[0000000010001420] = ffffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = f0650335, %l2 = 00000000ff000000
	ldsha	[%i6+%o5]0x80,%l2	! %l2 = fffffffffffff065

p0_label_135:
!	Mem[00000000100c1400] = 0000004f, %l4 = 000000007971ef14
	lduwa	[%i3+%g0]0x88,%l4	! %l4 = 000000000000004f
!	Mem[00000000300c1410] = ffffffff, %l1 = 000000007de90000
	ldsba	[%i3+%o5]0x81,%l1	! %l1 = ffffffffffffffff
!	Mem[00000000100c1400] = 4f000000, %f25 = 14ef7179
	ld	[%i3+%g0],%f25	! %f25 = 4f000000
!	Mem[0000000030081400] = ff00007b f0650335, %l2 = fffff065, %l3 = 000000ff
	ldda	[%i2+%g0]0x81,%l2	! %l2 = 00000000ff00007b 00000000f0650335
!	Mem[0000000020800000] = 00005afb, %l3 = 00000000f0650335
	ldsb	[%o1+0x001],%l3		! %l3 = 0000000000000000
	membar	#Sync			! Added by membar checker (25)
!	Mem[0000000030181400] = fffdffff 350365f0 ffffffff ffffffff
!	Mem[0000000030181410] = ff000000 000000ea 44429bd5 38b6002a
!	Mem[0000000030181420] = f335d15d 241790ed 88236794 35030000
!	Mem[0000000030181430] = 61121d36 02e9ee0d 451f704e bee2ecfb
	ldda	[%i6]ASI_BLK_S,%f16	! Block Load from 0000000030181400
!	Mem[0000000010041408] = 00000000 00000079, %l6 = ffffffff, %l7 = 00009a38
	ldda	[%i1+%o4]0x88,%l6	! %l6 = 0000000000000079 0000000000000000
!	Mem[0000000010001408] = c045000000000000, %l2 = 00000000ff00007b
	ldxa	[%i0+%o4]0x80,%l2	! %l2 = c045000000000000
!	Mem[0000000010001410] = 000000fa, %l4 = 000000000000004f
	lduha	[%i0+%o5]0x80,%l4	! %l4 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l2 = c045000000000000, Mem[0000000030001408] = 00000000
	stwa	%l2,[%i0+%o4]0x89	! Mem[0000000030001408] = 00000000

p0_label_136:
!	Mem[0000000010041404] = 000000ff, %l6 = 0000000000000079
	lduh	[%i1+0x004],%l6		! %l6 = 0000000000000000
!	%l2 = c045000000000000, Mem[0000000010001400] = 00000000
	stwa	%l2,[%i0+%g0]0x88	! Mem[0000000010001400] = 00000000
!	%f12 = ffffffff ffffffff, %f6  = ff000000
	fxtos	%f12,%f6 		! %f6  = bf800000
!	Mem[0000000010001420] = ffffffff14ef7179, %l7 = 0000000000000000, %l4 = 0000000000000000
	add	%i0,0x20,%g1
	casxa	[%g1]0x80,%l7,%l4	! %l4 = ffffffff14ef7179
!	%l2 = c045000000000000, Mem[00000000100c1410] = ffffffff
	stha	%l2,[%i3+%o5]0x88	! Mem[00000000100c1410] = ffff0000
!	%l1 = ffffffffffffffff, Mem[0000000021800100] = 003a37bf, %asi = 80
	stha	%l1,[%o3+0x100]%asi	! Mem[0000000021800100] = ffff37bf
!	%l6 = 0000000000000000, Mem[0000000010001424] = 14ef7179
	sth	%l6,[%i0+0x024]		! Mem[0000000010001424] = 00007179
!	Mem[0000000030101408] = f218444f, %l3 = 0000000000000000
	ldstuba	[%i4+%o4]0x89,%l3	! %l3 = 0000004f000000ff
!	%l2 = 00000000, %l3 = 0000004f, Mem[0000000010181410] = 350365f0 00000000
	stda	%l2,[%i6+%o5]0x88	! Mem[0000000010181410] = 00000000 0000004f
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = 59000000, %l4 = ffffffff14ef7179
	lduba	[%i1+%o4]0x81,%l4	! %l4 = 0000000000000059

p0_label_137:
!	Mem[00000000211c0000] = ffff6217, %l3 = 000000000000004f
	ldub	[%o2+%g0],%l3		! %l3 = 00000000000000ff
!	Mem[0000000030041408] = 00000059, %l6 = 0000000000000000
	lduha	[%i1+%o4]0x89,%l6	! %l6 = 0000000000000059
!	Mem[0000000010001400] = 00000000, %l6 = 0000000000000059
	ldswa	[%i0+%g0]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000010181400] = ff000000, %l1 = ffffffffffffffff
	ldsba	[%i6+%g0]0x80,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000030081408] = 6b000000 000000ff, %l6 = 00000000, %l7 = 00000000
	ldda	[%i2+%o4]0x89,%l6	! %l6 = 00000000000000ff 000000006b000000
!	Mem[0000000010181408] = 14ef7179, %l2 = c045000000000000
	ldsba	[%i6+%o4]0x80,%l2	! %l2 = 0000000000000014
!	Mem[00000000201c0000] = 00ff8a5f, %l5 = fffffffffffdc045
	lduba	[%o0+0x000]%asi,%l5	! %l5 = 0000000000000000
!	Mem[0000000010141410] = 00000000, %l1 = ffffffffffffffff
	lduha	[%i5+%o5]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010081410] = fea80000, %l6 = 00000000000000ff
	ldswa	[%i2+%o5]0x88,%l6	! %l6 = fffffffffea80000
!	Starting 10 instruction Store Burst
!	%f2  = bff00000, Mem[0000000030001410] = 000000ff
	sta	%f2 ,[%i0+%o5]0x89	! Mem[0000000030001410] = bff00000

p0_label_138:
!	%l2 = 00000014, %l3 = 000000ff, Mem[0000000010141400] = 000000ff 00000000
	stda	%l2,[%i5+%g0]0x88	! Mem[0000000010141400] = 00000014 000000ff
!	Mem[00000000201c0000] = 00ff8a5f, %l5 = 0000000000000000
	ldstuba	[%o0+0x000]%asi,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010181408] = 7971ef14, %l4 = 0000000000000059
	swapa	[%i6+%o4]0x88,%l4	! %l4 = 000000007971ef14
!	Mem[0000000010101408] = 000000ff, %l2 = 0000000000000014
	swapa	[%i4+%o4]0x80,%l2	! %l2 = 00000000000000ff
!	Mem[00000000300c1400] = ffffe7b0, %l0 = 000000000000b0e7
	swapa	[%i3+%g0]0x89,%l0	! %l0 = 00000000ffffe7b0
!	Mem[0000000010141420] = 89ff65f04f4418f2, %l0 = 00000000ffffe7b0, %l5 = 0000000000000000
	add	%i5,0x20,%g1
	casxa	[%g1]0x80,%l0,%l5	! %l5 = 89ff65f04f4418f2
!	%l6 = fea80000, %l7 = 6b000000, Mem[00000000100c1400] = 4f000000 00000000
	stda	%l6,[%i3+%g0]0x80	! Mem[00000000100c1400] = fea80000 6b000000
!	%l6 = fea80000, %l7 = 6b000000, Mem[0000000030041408] = 00000059 ff000000
	stda	%l6,[%i1+%o4]0x89	! Mem[0000000030041408] = fea80000 6b000000
!	Mem[0000000010181424] = ff000074, %l2 = 00000000000000ff
	swap	[%i6+0x024],%l2		! %l2 = 00000000ff000074
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = ff000000 00000000, %l0 = ffffe7b0, %l1 = 00000000
	ldda	[%i5+%o4]0x89,%l0	! %l0 = 0000000000000000 00000000ff000000

p0_label_139:
!	Mem[0000000030081408] = ff0000000000006b, %f0  = 4f000000 00000000
	ldda	[%i2+%o4]0x81,%f0 	! %f0  = ff000000 0000006b
!	Mem[0000000030081410] = e7b0000000000000, %l0 = 0000000000000000
	ldxa	[%i2+%o5]0x89,%l0	! %l0 = e7b0000000000000
!	Mem[00000000100c1408] = fffdc04500000000, %l1 = 00000000ff000000
	ldxa	[%i3+%o4]0x80,%l1	! %l1 = fffdc04500000000
!	Mem[0000000010041408] = 00000079, %f5  = ffff0000
	lda	[%i1+%o4]0x88,%f5 	! %f5 = 00000079
!	Mem[0000000010141428] = 0bc503eaffffffff, %f8  = 7db8a8fe 14ef7179
	ldda	[%i5+0x028]%asi,%f8 	! %f8  = 0bc503ea ffffffff
!	Mem[00000000100c1400] = fea80000, %l0 = e7b0000000000000
	ldstuba	[%i3+%g0]0x80,%l0	! %l0 = 000000fe000000ff
!	Mem[0000000010041410] = 00000000, %l7 = 000000006b000000
	ldswa	[%i1+%o5]0x80,%l7	! %l7 = 0000000000000000
!	Mem[00000000100c1408] = fffdc04500000000, %l5 = 89ff65f04f4418f2
	ldxa	[%i3+%o4]0x80,%l5	! %l5 = fffdc04500000000
!	Mem[00000000201c0000] = ffff8a5f, %l0 = 00000000000000fe
	ldsba	[%o0+0x000]%asi,%l0	! %l0 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	Mem[0000000010041411] = 00000000, %l2 = 00000000ff000074
	ldstuba	[%i1+0x011]%asi,%l2	! %l2 = 00000000000000ff

p0_label_140:
!	%f12 = ffffffff, Mem[00000000300c1408] = ff000000
	sta	%f12,[%i3+%o4]0x81	! Mem[00000000300c1408] = ffffffff
!	%l4 = 000000007971ef14, Mem[0000000010101400] = 000000ff
	stwa	%l4,[%i4+%g0]0x88	! Mem[0000000010101400] = 7971ef14
!	%f30 = 451f704e bee2ecfb, Mem[0000000030101408] = ff4418f2 0000006b
	stda	%f30,[%i4+%o4]0x81	! Mem[0000000030101408] = 451f704e bee2ecfb
!	Mem[0000000030081408] = 000000ff, %l3 = 00000000000000ff
	swapa	[%i2+%o4]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[00000000201c0001] = ffff8a5f, %l3 = 00000000000000ff
	ldstuba	[%o0+0x001]%asi,%l3	! %l3 = 000000ff000000ff
!	%l0 = ffffffffffffffff, Mem[0000000030101410] = ff000000
	stha	%l0,[%i4+%o5]0x81	! Mem[0000000030101410] = ffff0000
!	%l0 = ffffffff, %l1 = 00000000, Mem[0000000010081410] = 0000a8fe 6c000000
	stda	%l0,[%i2+0x010]%asi	! Mem[0000000010081410] = ffffffff 00000000
!	Mem[00000000100c1410] = ffff0000, %l3 = 00000000000000ff
	ldstuba	[%i3+%o5]0x88,%l3	! %l3 = 00000000000000ff
!	%l6 = fffffffffea80000, Mem[0000000030041400] = ffffffffffffffff
	stxa	%l6,[%i1+%g0]0x81	! Mem[0000000030041400] = fffffffffea80000
!	Starting 10 instruction Load Burst
!	Mem[0000000010041434] = 5dd135f3, %f7  = 00000000
	lda	[%i1+0x034]%asi,%f7 	! %f7 = 5dd135f3

p0_label_141:
!	Mem[0000000010141424] = 4f4418f2, %l2 = 0000000000000000
	lduba	[%i5+0x026]%asi,%l2	! %l2 = 0000000000000018
!	Mem[0000000030001400] = 00000000, %f14 = 000000ff
	lda	[%i0+%g0]0x81,%f14	! %f14 = 00000000
!	Mem[0000000010041410] = 00ff000000000082, %l0 = ffffffffffffffff
	ldxa	[%i1+%o5]0x80,%l0	! %l0 = 00ff000000000082
!	Mem[00000000100c1430] = 91ee73e8, %l6 = fffffffffea80000
	ldsb	[%i3+0x030],%l6		! %l6 = ffffffffffffff91
!	Mem[0000000030001400] = 00000000, %l7 = 0000000000000000
	lduba	[%i0+%g0]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000010001418] = ff00000000000000, %f2  = bff00000 ff00007b
	ldd	[%i0+0x018],%f2 	! %f2  = ff000000 00000000
!	Mem[0000000010141410] = 0000000000000000, %l7 = 0000000000000000
	ldxa	[%i5+%o5]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000030101408] = fbece2be 4e701f45, %l6 = ffffff91, %l7 = 00000000
	ldda	[%i4+%o4]0x89,%l6	! %l6 = 000000004e701f45 00000000fbece2be
!	Mem[0000000010001400] = 00000000, %l2 = 0000000000000018
	lduwa	[%i0+%g0]0x88,%l2	! %l2 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l4 = 000000007971ef14, Mem[00000000100c1400] = ffa80000
	stba	%l4,[%i3+%g0]0x80	! Mem[00000000100c1400] = 14a80000

p0_label_142:
!	Mem[0000000030181400] = fffffdff, %l2 = 0000000000000000
	ldstuba	[%i6+%g0]0x89,%l2	! %l2 = 000000ff000000ff
!	%f31 = bee2ecfb, Mem[0000000010101408] = 00000014
	sta	%f31,[%i4+%o4]0x80	! Mem[0000000010101408] = bee2ecfb
!	Mem[0000000010141400] = 14000000, %l5 = fffdc04500000000
	ldstuba	[%i5+%g0]0x80,%l5	! %l5 = 00000014000000ff
!	%l0 = 00ff000000000082, Mem[0000000030141410] = ff000000
	stba	%l0,[%i5+%o5]0x81	! Mem[0000000030141410] = 82000000
!	Mem[0000000010081408] = ffff0000, %l1 = fffdc04500000000
	swap	[%i2+%o4],%l1		! %l1 = 00000000ffff0000
!	%f29 = 02e9ee0d, Mem[0000000010101410] = 00000000
	sta	%f29,[%i4+%o5]0x88	! Mem[0000000010101410] = 02e9ee0d
!	%l0 = 00000082, %l1 = ffff0000, Mem[0000000010081408] = 00000000 740000ff
	stda	%l0,[%i2+%o4]0x88	! Mem[0000000010081408] = 00000082 ffff0000
!	%l2 = 000000ff, %l3 = 00000000, Mem[0000000030001410] = 0000f0bf 00000000
	stda	%l2,[%i0+%o5]0x81	! Mem[0000000030001410] = 000000ff 00000000
	membar	#Sync			! Added by membar checker (26)
!	%l5 = 0000000000000014, Mem[0000000030181400] = f0650335fffffdff
	stxa	%l5,[%i6+%g0]0x89	! Mem[0000000030181400] = 0000000000000014
!	Starting 10 instruction Load Burst
!	Mem[0000000020800040] = ff358327, %l1 = 00000000ffff0000
	ldsba	[%o1+0x041]%asi,%l1	! %l1 = 0000000000000035

p0_label_143:
!	Mem[0000000010101438] = 59b9455e, %l6 = 000000004e701f45
	ldsha	[%i4+0x038]%asi,%l6	! %l6 = 00000000000059b9
!	Mem[00000000100c1408] = fffdc045, %l2 = 00000000000000ff
	ldsha	[%i3+%o4]0x80,%l2	! %l2 = fffffffffffffffd
!	Mem[0000000030181400] = 00000014, %l7 = 00000000fbece2be
	lduba	[%i6+%g0]0x89,%l7	! %l7 = 0000000000000014
!	Mem[0000000010101408] = fbece2be, %l2 = fffffffffffffffd
	lduha	[%i4+%o4]0x88,%l2	! %l2 = 000000000000e2be
!	Mem[0000000021800140] = ffff4ce0, %l2 = 000000000000e2be
	lduba	[%o3+0x140]%asi,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030181400] = 00000014, %l7 = 0000000000000014
	lduwa	[%i6+%g0]0x89,%l7	! %l7 = 0000000000000014
!	Mem[00000000100c1400] = 0000a814, %l1 = 0000000000000035
	ldsba	[%i3+%g0]0x88,%l1	! %l1 = 0000000000000014
!	Mem[00000000100c1400] = 14a80000 6b000000 fffdc045 00000000
!	Mem[00000000100c1410] = ff00ffff fffffdff e3000074 00ff006b
!	Mem[00000000100c1420] = 7db8a8fe 14ef7179 ccaa8168 0000005a
!	Mem[00000000100c1430] = 91ee73e8 ff73ff4a 1eb681c0 04ff7388
	ldda	[%i3]ASI_BLK_AIUP,%f16	! Block Load from 00000000100c1400
!	Mem[0000000010001400] = 00000000, %l7 = 0000000000000014
	ldswa	[%i0+%g0]0x80,%l7	! %l7 = 0000000000000000
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (27)
!	%l3 = 0000000000000000, Mem[00000000100c1408] = fffdc045
	stba	%l3,[%i3+%o4]0x80	! Mem[00000000100c1408] = 00fdc045

p0_label_144:
!	Mem[0000000010001420] = ffffffff00007179, %l2 = 00000000000000ff, %l4 = 000000007971ef14
	add	%i0,0x20,%g1
	casxa	[%g1]0x80,%l2,%l4	! %l4 = ffffffff00007179
!	%f0  = ff000000 0000006b, Mem[0000000030001408] = 00000000 000000ff
	stda	%f0 ,[%i0+%o4]0x81	! Mem[0000000030001408] = ff000000 0000006b
!	%l4 = ffffffff00007179, Mem[0000000010141408] = 7db8a8fe14ef71ff
	stxa	%l4,[%i5+%o4]0x88	! Mem[0000000010141408] = ffffffff00007179
!	Mem[000000001008141c] = 0000ff89, %l3 = 0000000000000000
	ldstuba	[%i2+0x01c]%asi,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030041400] = ffffffff, %l7 = 0000000000000000
	swapa	[%i1+%g0]0x81,%l7	! %l7 = 00000000ffffffff
!	%f31 = 04ff7388, %f26 = ccaa8168
	fcmps	%fcc0,%f31,%f26		! %fcc0 = 2
!	%l2 = 00000000000000ff, Mem[00000000100c1410] = ff00ffff
	stba	%l2,[%i3+%o5]0x80	! Mem[00000000100c1410] = ff00ffff
!	Mem[00000000300c1408] = ffffffff, %l4 = ffffffff00007179
	swapa	[%i3+%o4]0x89,%l4	! %l4 = 00000000ffffffff
!	%l2 = 00000000000000ff, Mem[0000000010141412] = 00000000
	sth	%l2,[%i5+0x012]		! Mem[0000000010141410] = 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030081410] = 00000000, %l6 = 00000000000059b9
	ldsba	[%i2+%o5]0x81,%l6	! %l6 = 0000000000000000

p0_label_145:
!	Mem[00000000100c1408] = 00fdc045, %l2 = 00000000000000ff
	lduba	[%i3+%o4]0x80,%l2	! %l2 = 0000000000000000
!	Mem[00000000201c0000] = ffff8a5f, %l7 = 00000000ffffffff
	ldsb	[%o0+0x001],%l7		! %l7 = ffffffffffffffff
!	Mem[0000000030141400] = ffffffff, %l1 = 0000000000000014
	ldswa	[%i5+%g0]0x89,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010141408] = ffffffff 00007179, %l4 = ffffffff, %l5 = 00000014
	ldda	[%i5+%o4]0x88,%l4	! %l4 = 0000000000007179 00000000ffffffff
!	Mem[0000000030001410] = 000000ff 00000000, %l0 = 00000082, %l1 = ffffffff
	ldda	[%i0+%o5]0x81,%l0	! %l0 = 00000000000000ff 0000000000000000
!	Mem[0000000010001408] = c0450000, %l7 = ffffffffffffffff
	ldsba	[%i0+%o4]0x80,%l7	! %l7 = ffffffffffffffc0
!	Mem[000000001004140c] = 00000000, %f20 = ff00ffff
	ld	[%i1+0x00c],%f20	! %f20 = 00000000
!	Mem[0000000010081400] = 00000000, %l3 = 0000000000000000
	ldsha	[%i2+%g0]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000021800040] = 5af7c5e9, %l3 = 0000000000000000
	ldsb	[%o3+0x041],%l3		! %l3 = fffffffffffffff7
!	Starting 10 instruction Store Burst
!	%f14 = 00000000 00ff46d0, %l6 = 0000000000000000
!	Mem[0000000030141438] = 3fbc00fa5264b172
	add	%i5,0x038,%g1
	stda	%f14,[%g1+%l6]ASI_PST32_S ! Mem[0000000030141438] = 3fbc00fa5264b172

p0_label_146:
!	%l4 = 0000000000007179, Mem[0000000010081408] = 00000082
	stba	%l4,[%i2+%o4]0x88	! Mem[0000000010081408] = 00000079
!	%f0  = ff000000 0000006b, %f26 = ccaa8168
	fdtoi	%f0 ,%f26		! %f26 = 80000000
!	%l1 = 0000000000000000, Mem[0000000010041410] = 00ff0000
	stha	%l1,[%i1+%o5]0x80	! Mem[0000000010041410] = 00000000
!	%l5 = 00000000ffffffff, Mem[0000000010181410] = 00000000
	stba	%l5,[%i6+%o5]0x80	! Mem[0000000010181410] = ff000000
!	Mem[00000000201c0001] = ffff8a5f, %l1 = 0000000000000000
	ldstuba	[%o0+0x001]%asi,%l1	! %l1 = 000000ff000000ff
!	%l4 = 00007179, %l5 = ffffffff, Mem[0000000010101408] = bee2ecfb 00ff46d0
	std	%l4,[%i4+%o4]		! Mem[0000000010101408] = 00007179 ffffffff
!	Mem[0000000010001400] = 00000000, %l0 = 00000000000000ff
	ldstuba	[%i0+%g0]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010081410] = ffffffff, %l4 = 0000000000007179
	ldstuba	[%i2+%o5]0x88,%l4	! %l4 = 000000ff000000ff
!	%l1 = 00000000000000ff, Mem[0000000010081418] = 9f7d3815ff00ff89, %asi = 80
	stxa	%l1,[%i2+0x018]%asi	! Mem[0000000010081418] = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = 00fdc045 00000000, %l6 = 00000000, %l7 = ffffffc0
	ldda	[%i3+%o4]0x80,%l6	! %l6 = 0000000000fdc045 0000000000000000

p0_label_147:
!	Mem[000000001004140c] = 00000000, %l4 = 00000000000000ff
	ldsw	[%i1+0x00c],%l4		! %l4 = 0000000000000000
!	Mem[00000000300c1408] = 79710000, %l3 = fffffffffffffff7
	lduwa	[%i3+%o4]0x81,%l3	! %l3 = 0000000079710000
!	Mem[0000000010081410] = ffffffff, %l0 = 0000000000000000
	ldsha	[%i2+%o5]0x88,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000030041408] = 0000a8fe, %f8  = 0bc503ea
	lda	[%i1+%o4]0x81,%f8 	! %f8 = 0000a8fe
!	Mem[0000000030001410] = 00000000ff000000, %f24 = 7db8a8fe 14ef7179
	ldda	[%i0+%o5]0x89,%f24	! %f24 = 00000000 ff000000
!	Mem[0000000010001400] = 000000ff, %f23 = 00ff006b
	lda	[%i0+%g0]0x88,%f23	! %f23 = 000000ff
!	Mem[00000000100c142c] = 0000005a, %l5 = 00000000ffffffff
	ldsba	[%i3+0x02f]%asi,%l5	! %l5 = 000000000000005a
!	Mem[0000000030141408] = ff00000000000000, %f14 = 00000000 00ff46d0
	ldda	[%i5+%o4]0x89,%f14	! %f14 = ff000000 00000000
!	Mem[00000000300c1408] = 79710000, %l0 = ffffffffffffffff
	lduha	[%i3+%o4]0x81,%l0	! %l0 = 0000000000007971
!	Starting 10 instruction Store Burst
!	Mem[0000000010001408] = 000045c0, %l1 = 00000000000000ff
	swapa	[%i0+%o4]0x88,%l1	! %l1 = 00000000000045c0

p0_label_148:
!	Mem[0000000030081410] = 00000000, %l0 = 0000000000007971
	swapa	[%i2+%o5]0x89,%l0	! %l0 = 0000000000000000
!	%l5 = 000000000000005a, Mem[00000000100c1400] = 14a80000
	stwa	%l5,[%i3+%g0]0x80	! Mem[00000000100c1400] = 0000005a
!	Mem[0000000010181408] = 00000059, %l6 = 0000000000fdc045
	swapa	[%i6+%o4]0x88,%l6	! %l6 = 0000000000000059
!	%f8  = 0000a8fe ffffffff, Mem[0000000030141408] = 00000000 000000ff
	stda	%f8 ,[%i5+%o4]0x81	! Mem[0000000030141408] = 0000a8fe ffffffff
!	%l7 = 0000000000000000, Mem[0000000030101400] = ffffffc1
	stwa	%l7,[%i4+%g0]0x89	! Mem[0000000030101400] = 00000000
!	Mem[0000000010081400] = 00000000, %l6 = 0000000000000059
	swapa	[%i2+%g0]0x88,%l6	! %l6 = 0000000000000000
!	%l6 = 0000000000000000, Mem[0000000010181408] = 45c0fd00
	stha	%l6,[%i6+%o4]0x80	! Mem[0000000010181408] = 0000fd00
!	Mem[0000000010041400] = 000000fa, %l1 = 00000000000045c0
	swapa	[%i1+%g0]0x88,%l1	! %l1 = 00000000000000fa
!	%l6 = 0000000000000000, Mem[0000000021800180] = 009b6a88
	sth	%l6,[%o3+0x180]		! Mem[0000000021800180] = 00006a88
!	Starting 10 instruction Load Burst
!	Mem[0000000010141430] = 5cab5a60, %l1 = 00000000000000fa
	ldsha	[%i5+0x030]%asi,%l1	! %l1 = 0000000000005cab

p0_label_149:
!	Mem[0000000020800040] = ff358327, %l3 = 0000000079710000
	ldsba	[%o1+0x040]%asi,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010101408] = 79710000, %l0 = 0000000000000000
	ldsba	[%i4+%o4]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000030081410] = 71790000, %l3 = ffffffffffffffff
	lduha	[%i2+%o5]0x81,%l3	! %l3 = 0000000000007179
!	Mem[0000000010041410] = 00000000, %l5 = 000000000000005a
	lduba	[%i1+%o5]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000030001408] = ff000000, %l7 = 0000000000000000
	ldsba	[%i0+%o4]0x81,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000030081408] = ff0000000000006b, %l6 = 0000000000000000
	ldxa	[%i2+%o4]0x81,%l6	! %l6 = ff0000000000006b
!	Mem[0000000030101408] = 451f704e, %l2 = 0000000000000000
	lduba	[%i4+%o4]0x81,%l2	! %l2 = 0000000000000045
!	Mem[0000000030101408] = 451f704e, %f6  = bf800000
	lda	[%i4+%o4]0x81,%f6 	! %f6 = 451f704e
!	Mem[0000000030141410] = 00000082, %l1 = 0000000000005cab
	lduba	[%i5+%o5]0x89,%l1	! %l1 = 0000000000000082
!	Starting 10 instruction Store Burst
!	%l5 = 0000000000000000, Mem[0000000010101408] = 00007179
	stba	%l5,[%i4+%o4]0x80	! Mem[0000000010101408] = 00007179

p0_label_150:
!	Mem[0000000010181400] = ff000000, %l3 = 0000000000007179
	swapa	[%i6+%g0]0x80,%l3	! %l3 = 00000000ff000000
!	Mem[00000000300c1410] = ffffffff, %l1 = 0000000000000082
	ldstuba	[%i3+%o5]0x89,%l1	! %l1 = 000000ff000000ff
!	Mem[0000000030041408] = 0000a8fe, %l4 = 0000000000000000
	ldstuba	[%i1+%o4]0x81,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030001410] = 000000ff, %l0 = 0000000000000000
	swapa	[%i0+%o5]0x81,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010101408] = 00007179, %l3 = 00000000ff000000
	swapa	[%i4+%o4]0x80,%l3	! %l3 = 0000000000007179
!	Mem[0000000010101408] = ff000000, %l1 = 00000000000000ff
	ldstuba	[%i4+%o4]0x80,%l1	! %l1 = 000000ff000000ff
!	Mem[00000000300c1410] = ffffffff, %l2 = 0000000000000045
	ldstuba	[%i3+%o5]0x89,%l2	! %l2 = 000000ff000000ff
!	%f14 = ff000000 00000000, %l3 = 0000000000007179
!	Mem[0000000010181410] = ff0000004f000000
	add	%i6,0x010,%g1
	stda	%f14,[%g1+%l3]ASI_PST32_P ! Mem[0000000010181410] = ff00000000000000
!	%f2  = ff000000, Mem[0000000010041404] = 000000ff
	sta	%f2 ,[%i1+0x004]%asi	! Mem[0000000010041404] = ff000000
!	Starting 10 instruction Load Burst
!	Mem[000000001018142c] = 00000000, %l3 = 0000000000007179
	ldsha	[%i6+0x02e]%asi,%l3	! %l3 = 0000000000000000

p0_label_151:
!	Mem[0000000010101410] = 0deee902, %l4 = 0000000000000000
	ldsha	[%i4+%o5]0x80,%l4	! %l4 = 0000000000000dee
!	Mem[0000000030101400] = 00000000, %l3 = 0000000000000000
	ldswa	[%i4+%g0]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000010181408] = 0000fd00, %l1 = 00000000000000ff
	lduba	[%i6+%o4]0x80,%l1	! %l1 = 0000000000000000
!	Mem[00000000100c1400] = 0000005a, %l3 = 0000000000000000
	lduba	[%i3+%g0]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000010041408] = 0000000000000079, %l7 = ffffffffffffffff
	ldxa	[%i1+%o4]0x88,%l7	! %l7 = 0000000000000079
!	Mem[0000000010141434] = 1db170c1, %l1 = 0000000000000000
	lduwa	[%i5+0x034]%asi,%l1	! %l1 = 000000001db170c1
!	Mem[00000000218000c0] = 17bde748, %l0 = 00000000000000ff
	lduha	[%o3+0x0c0]%asi,%l0	! %l0 = 00000000000017bd
!	Mem[0000000030041400] = 00000000 fea80000, %l2 = 000000ff, %l3 = 00000000
	ldda	[%i1+%g0]0x81,%l2	! %l2 = 0000000000000000 00000000fea80000
!	Mem[0000000010041400] = c0450000, %l6 = ff0000000000006b
	lduwa	[%i1+%g0]0x80,%l6	! %l6 = 00000000c0450000
!	Starting 10 instruction Store Burst
!	%l3 = 00000000fea80000, Mem[0000000030101410] = ffff0000
	stha	%l3,[%i4+%o5]0x81	! Mem[0000000030101410] = 00000000

p0_label_152:
!	Mem[0000000030081408] = ff000000, %l7 = 0000000000000079
	ldstuba	[%i2+%o4]0x81,%l7	! %l7 = 000000ff000000ff
!	%l2 = 00000000, %l3 = fea80000, Mem[0000000010041408] = 00000079 00000000
	stda	%l2,[%i1+%o4]0x88	! Mem[0000000010041408] = 00000000 fea80000
!	%l0 = 00000000000017bd, Mem[00000000300c1408] = 0000000000007179
	stxa	%l0,[%i3+%o4]0x89	! Mem[00000000300c1408] = 00000000000017bd
!	%l7 = 00000000000000ff, Mem[0000000030041408] = ff00a8fe0000006b
	stxa	%l7,[%i1+%o4]0x81	! Mem[0000000030041408] = 00000000000000ff
!	%l2 = 00000000, %l3 = fea80000, Mem[0000000010041408] = 00000000 fea80000
	stda	%l2,[%i1+%o4]0x88	! Mem[0000000010041408] = 00000000 fea80000
!	%f4  = 000000fa 00000079, Mem[0000000010001410] = fa000000 0000ffff
	stda	%f4 ,[%i0+%o5]0x88	! Mem[0000000010001410] = 000000fa 00000079
!	%f0  = ff000000 0000006b ff000000 00000000
!	%f4  = 000000fa 00000079 451f704e 5dd135f3
!	%f8  = 0000a8fe ffffffff 00000000 000000ff
!	%f12 = ffffffff ffffffff ff000000 00000000
	stda	%f0,[%i2]ASI_BLK_PL	! Block Store to 0000000010081400
!	%l7 = 00000000000000ff, Mem[000000001018142a] = 73e09b65, %asi = 80
	stha	%l7,[%i6+0x02a]%asi	! Mem[0000000010181428] = 73e000ff
!	Mem[0000000030041410] = 03000000, %l6 = 00000000c0450000
	swapa	[%i1+%o5]0x89,%l6	! %l6 = 0000000003000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030181410] = ff000000, %l4 = 0000000000000dee
	lduha	[%i6+%o5]0x81,%l4	! %l4 = 000000000000ff00

p0_label_153:
!	Mem[0000000010141400] = ff000000, %l0 = 00000000000017bd
	lduha	[%i5+%g0]0x80,%l0	! %l0 = 000000000000ff00
!	Mem[00000000100c1438] = 1eb681c004ff7388, %l7 = 00000000000000ff
	ldx	[%i3+0x038],%l7		! %l7 = 1eb681c004ff7388
!	Mem[0000000010101410] = 0deee902, %l0 = 000000000000ff00
	lduba	[%i4+%o5]0x80,%l0	! %l0 = 000000000000000d
!	Mem[00000000100c1408] = 00fdc045, %l1 = 000000001db170c1
	ldswa	[%i3+%o4]0x80,%l1	! %l1 = 0000000000fdc045
!	Mem[0000000030141408] = 0000a8fe, %l3 = 00000000fea80000
	lduwa	[%i5+%o4]0x81,%l3	! %l3 = 000000000000a8fe
!	Mem[0000000030101408] = 4e701f45, %l1 = 0000000000fdc045
	lduha	[%i4+%o4]0x89,%l1	! %l1 = 0000000000001f45
	membar	#Sync			! Added by membar checker (28)
!	Mem[000000001008140c] = 000000ff, %l0 = 000000000000000d
	ldub	[%i2+0x00f],%l0		! %l0 = 00000000000000ff
!	Mem[00000000211c0000] = ffff6217, %l2 = 0000000000000000
	lduba	[%o2+0x001]%asi,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030041410] = c0450000, %l2 = 00000000000000ff
	lduba	[%i1+%o5]0x89,%l2	! %l2 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010181410] = ff000000, %l6 = 0000000003000000
	ldstuba	[%i6+%o5]0x80,%l6	! %l6 = 000000ff000000ff

p0_label_154:
!	%l1 = 0000000000001f45, Mem[0000000010081408] = ff00000000000000
	stxa	%l1,[%i2+%o4]0x88	! Mem[0000000010081408] = 0000000000001f45
!	%f16 = 14a80000 6b000000 fffdc045 00000000
!	%f20 = 00000000 fffffdff e3000074 000000ff
!	%f24 = 00000000 ff000000 80000000 0000005a
!	%f28 = 91ee73e8 ff73ff4a 1eb681c0 04ff7388
	stda	%f16,[%i5]ASI_BLK_AIUS	! Block Store to 0000000030141400
!	%f14 = ff000000 00000000, Mem[0000000010041400] = c0450000 ff000000
	stda	%f14,[%i1+0x000]%asi	! Mem[0000000010041400] = ff000000 00000000
!	Mem[0000000010081400] = 0000006b, %l2 = 0000000000000000
	ldstuba	[%i2+%g0]0x88,%l2	! %l2 = 0000006b000000ff
!	Mem[0000000010001410] = 00000079, %l5 = 0000000000000000
	swapa	[%i0+%o5]0x88,%l5	! %l5 = 0000000000000079
!	%l6 = 000000ff, %l7 = 04ff7388, Mem[0000000030181410] = ff000000 000000ea
	stda	%l6,[%i6+%o5]0x81	! Mem[0000000030181410] = 000000ff 04ff7388
!	%f16 = 14a80000 6b000000 fffdc045 00000000
!	%f20 = 00000000 fffffdff e3000074 000000ff
!	%f24 = 00000000 ff000000 80000000 0000005a
!	%f28 = 91ee73e8 ff73ff4a 1eb681c0 04ff7388
	stda	%f16,[%i4]ASI_BLK_S	! Block Store to 0000000030101400
!	Mem[0000000010041408] = 00000000, %l6 = 00000000000000ff
	ldstuba	[%i1+%o4]0x80,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030081408] = 000000ff, %l1 = 0000000000001f45
	ldstuba	[%i2+%o4]0x89,%l1	! %l1 = 000000ff000000ff
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (29)
!	Mem[000000001010143c] = 7487e36b, %f4  = 000000fa
	lda	[%i4+0x03c]%asi,%f4 	! %f4 = 7487e36b

p0_label_155:
!	Mem[0000000010141400] = 000000ff000000ff, %f12 = ffffffff ffffffff
	ldda	[%i5+%g0]0x88,%f12	! %f12 = 000000ff 000000ff
!	Mem[0000000030181400] = 14000000, %f2  = ff000000
	lda	[%i6+%g0]0x81,%f2 	! %f2 = 14000000
!	Mem[0000000030041400] = 00000000, %l7 = 1eb681c004ff7388
	ldsha	[%i1+%g0]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000010041410] = 00000000, %l6 = 0000000000000000
	ldsha	[%i1+%o5]0x80,%l6	! %l6 = 0000000000000000
!	Mem[00000000300c1408] = 000017bd, %l6 = 0000000000000000
	ldsba	[%i3+%o4]0x89,%l6	! %l6 = ffffffffffffffbd
!	Mem[0000000030101410] = fffdffff00000000, %l3 = 000000000000a8fe
	ldxa	[%i4+%o5]0x89,%l3	! %l3 = fffdffff00000000
!	Mem[0000000030101408] = 45c0fdff, %l3 = fffdffff00000000
	lduba	[%i4+%o4]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030181408] = ffffffff, %l5 = 0000000000000079
	ldsha	[%i6+%o4]0x89,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000030001400] = 00000000, %l2 = 000000000000006b
	ldswa	[%i0+%g0]0x89,%l2	! %l2 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f18 = fffdc045, Mem[0000000010041408] = 000000ff
	sta	%f18,[%i1+%o4]0x88	! Mem[0000000010041408] = fffdc045

p0_label_156:
!	%l4 = 000000000000ff00, Mem[0000000030001400] = 0000000000000059
	stxa	%l4,[%i0+%g0]0x81	! Mem[0000000030001400] = 000000000000ff00
!	%l3 = 00000000000000ff, Mem[0000000010141400] = 000000ff000000ff
	stxa	%l3,[%i5+%g0]0x88	! Mem[0000000010141400] = 00000000000000ff
!	%l5 = ffffffffffffffff, Mem[00000000300c1410] = ffffffffffff0000
	stxa	%l5,[%i3+%o5]0x81	! Mem[00000000300c1410] = ffffffffffffffff
!	Mem[00000000100c1408] = 00fdc04500000000, %l4 = 000000000000ff00, %l5 = ffffffffffffffff
	add	%i3,0x08,%g1
	casxa	[%g1]0x80,%l4,%l5	! %l5 = 00fdc04500000000
!	Mem[0000000010001430] = ffffffff, %l5 = 00000000, %l4 = 0000ff00
	add	%i0,0x30,%g1
	casa	[%g1]0x80,%l5,%l4	! %l4 = 00000000ffffffff
!	%f3  = 00000000, Mem[0000000010041414] = 00000082
	st	%f3 ,[%i1+0x014]	! Mem[0000000010041414] = 00000000
!	%l0 = 00000000000000ff, Mem[0000000010101430] = 0000007d00000300, %asi = 80
	stxa	%l0,[%i4+0x030]%asi	! Mem[0000000010101430] = 00000000000000ff
!	%l6 = ffffffffffffffbd, Mem[0000000010141408] = ffffffff00007179
	stxa	%l6,[%i5+%o4]0x88	! Mem[0000000010141408] = ffffffffffffffbd
!	%l4 = ffffffff, %l5 = 00000000, Mem[0000000010001400] = 000000ff ffffffff
	stda	%l4,[%i0+%g0]0x88	! Mem[0000000010001400] = ffffffff 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030001400] = 00000000, %l2 = 0000000000000000
	ldsba	[%i0+%g0]0x81,%l2	! %l2 = 0000000000000000

p0_label_157:
!	Mem[0000000030081400] = 7b0000ff, %l3 = 00000000000000ff
	ldsha	[%i2+%g0]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010081400] = ff000000, %l2 = 0000000000000000
	lduha	[%i2+0x000]%asi,%l2	! %l2 = 000000000000ff00
!	Mem[0000000010041408] = fffdc045, %l6 = ffffffffffffffbd
	ldsba	[%i1+%o4]0x88,%l6	! %l6 = 0000000000000045
!	Mem[0000000030181410] = 000000ff, %l7 = 0000000000000000
	ldsba	[%i6+%o5]0x81,%l7	! %l7 = 0000000000000000
!	%l3 = 00000000000000ff, Mem[0000000010181400] = 0000717900000000
	stxa	%l3,[%i6+%g0]0x80	! Mem[0000000010181400] = 00000000000000ff
!	Mem[0000000010001408] = 000000ff, %f26 = 80000000
	lda	[%i0+%o4]0x88,%f26	! %f26 = 000000ff
!	Mem[0000000010001408] = 000000ff, %l0 = 00000000000000ff
	lduha	[%i0+%o4]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[00000000100c1400] = 5a000000, %l6 = 0000000000000045
	ldsha	[%i3+%g0]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000020800000] = 00005afb, %l1 = 00000000000000ff
	lduha	[%o1+0x000]%asi,%l1	! %l1 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030041408] = 00000000, %l0 = 00000000000000ff
	ldstuba	[%i1+%o4]0x81,%l0	! %l0 = 00000000000000ff

p0_label_158:
!	%f26 = 000000ff 0000005a, %l0 = 0000000000000000
!	Mem[0000000030001438] = 451f704ebee2ecfb
	add	%i0,0x038,%g1
	stda	%f26,[%g1+%l0]ASI_PST16_SL ! Mem[0000000030001438] = 451f704ebee2ecfb
!	Mem[0000000030141410] = 00000000, %l3 = 00000000000000ff
	ldstuba	[%i5+%o5]0x81,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030181408] = ffffffff, %l2 = 000000000000ff00
	ldstuba	[%i6+%o4]0x81,%l2	! %l2 = 000000ff000000ff
!	%l7 = 0000000000000000, Mem[0000000030041408] = ff000000
	stha	%l7,[%i1+%o4]0x81	! Mem[0000000030041408] = 00000000
!	%f16 = 14a80000 6b000000 fffdc045 00000000
!	%f20 = 00000000 fffffdff e3000074 000000ff
!	%f24 = 00000000 ff000000 000000ff 0000005a
!	%f28 = 91ee73e8 ff73ff4a 1eb681c0 04ff7388
	stda	%f16,[%i2]ASI_COMMIT_P	! Block Store to 0000000010081400
!	%l4 = 00000000ffffffff, imm = fffffffffffffa67, %l5 = 00fdc04500000000
	addc	%l4,-0x599,%l5		! %l5 = 00000000fffffa66
!	%f10 = 00000000 000000ff, %l4 = 00000000ffffffff
!	Mem[0000000030041438] = fa000000000000ff
	add	%i1,0x038,%g1
	stda	%f10,[%g1+%l4]ASI_PST8_SL ! Mem[0000000030041438] = ff00000000000000
!	%l2 = 000000ff, %l3 = 00000000, Mem[0000000010101400] = 14ef7179 7487ff6b
	stda	%l2,[%i4+%g0]0x80	! Mem[0000000010101400] = 000000ff 00000000
!	Mem[0000000030001408] = ff000000, %l0 = 0000000000000000
	ldstuba	[%i0+%o4]0x81,%l0	! %l0 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = ffffffff0000b0e7, %f0  = ff000000 0000006b
	ldda	[%i3+%g0]0x89,%f0 	! %f0  = ffffffff 0000b0e7

p0_label_159:
!	Mem[0000000030141410] = ff000000, %l6 = 0000000000000000
	ldsha	[%i5+%o5]0x81,%l6	! %l6 = ffffffffffffff00
!	Mem[0000000030101408] = 45c0fdff, %l0 = 00000000000000ff
	lduha	[%i4+%o4]0x89,%l0	! %l0 = 000000000000fdff
!	Mem[00000000100c1400] = 0000005a6b000000, %f12 = 000000ff 000000ff
	ldd	[%i3+%g0],%f12		! %f12 = 0000005a 6b000000
!	Mem[0000000030081400] = ff00007b, %l5 = 00000000fffffa66
	lduba	[%i2+%g0]0x81,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010141400] = 00000000000000ff, %l5 = 00000000000000ff
	ldxa	[%i5+%g0]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010041430] = a2d90de95dd135f3, %f10 = 00000000 000000ff
	ldd	[%i1+0x030],%f10	! %f10 = a2d90de9 5dd135f3
	membar	#Sync			! Added by membar checker (30)
!	Mem[0000000030141400] = 14a80000 6b000000 fffdc045 00000000
!	Mem[0000000030141410] = ff000000 fffffdff e3000074 000000ff
!	Mem[0000000030141420] = 00000000 ff000000 80000000 0000005a
!	Mem[0000000030141430] = 91ee73e8 ff73ff4a 1eb681c0 04ff7388
	ldda	[%i5]ASI_BLK_SL,%f0	! Block Load from 0000000030141400
!	Mem[00000000100c1408] = 00fdc045, %l1 = 0000000000000000
	ldsha	[%i3+%o4]0x80,%l1	! %l1 = 00000000000000fd
!	Mem[0000000010181408] = 0000fd00, %l4 = 00000000ffffffff
	lduha	[%i6+%o4]0x80,%l4	! %l4 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l3 = 0000000000000000, Mem[0000000010181438] = 0000000000000000
	stx	%l3,[%i6+0x038]		! Mem[0000000010181438] = 0000000000000000

p0_label_160:
!	Mem[00000000300c1408] = 000017bd, %l5 = 00000000000000ff
	ldstuba	[%i3+%o4]0x89,%l5	! %l5 = 000000bd000000ff
	membar	#Sync			! Added by membar checker (31)
!	%l3 = 0000000000000000, Mem[0000000030141400] = 0000006b0000a814
	stxa	%l3,[%i5+%g0]0x89	! Mem[0000000030141400] = 0000000000000000
!	%f8  = 000000ff 00000000, Mem[0000000010041408] = 45c0fdff 0000a8fe
	stda	%f8 ,[%i1+%o4]0x80	! Mem[0000000010041408] = 000000ff 00000000
!	%l0 = 0000fdff, %l1 = 000000fd, Mem[0000000030141400] = 00000000 00000000
	stda	%l0,[%i5+%g0]0x81	! Mem[0000000030141400] = 0000fdff 000000fd
!	%l4 = 00000000, %l5 = 000000bd, Mem[0000000030041410] = c0450000 0004e007
	stda	%l4,[%i1+%o5]0x89	! Mem[0000000030041410] = 00000000 000000bd
!	%f0  = 0000006b 0000a814, %l5 = 00000000000000bd
!	Mem[0000000030141420] = 00000000ff000000
	add	%i5,0x020,%g1
	stda	%f0,[%g1+%l5]ASI_PST16_SL ! Mem[0000000030141420] = 14a800006b000000
!	%l0 = 0000fdff, %l1 = 000000fd, Mem[0000000030181410] = ff000000 8873ff04
	stda	%l0,[%i6+%o5]0x89	! Mem[0000000030181410] = 0000fdff 000000fd
!	%l0 = 0000fdff, %l1 = 000000fd, Mem[0000000010181400] = 00000000 ff000000
	stda	%l0,[%i6+%g0]0x88	! Mem[0000000010181400] = 0000fdff 000000fd
!	%l2 = 00000000000000ff, Mem[0000000010141410] = 000000ff
	stha	%l2,[%i5+%o5]0x80	! Mem[0000000010141410] = 00ff00ff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1430] = 91ee73e8ff73ff4a, %f28 = 91ee73e8 ff73ff4a
	ldda	[%i3+0x030]%asi,%f28	! %f28 = 91ee73e8 ff73ff4a

p0_label_161:
!	Mem[0000000030181408] = ffffffffffffffff, %f30 = 1eb681c0 04ff7388
	ldda	[%i6+%o4]0x81,%f30	! %f30 = ffffffff ffffffff
!	Mem[0000000030181408] = ffffffffffffffff, %l0 = 000000000000fdff
	ldxa	[%i6+%o4]0x89,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000030181408] = ffffffffffffffff, %f8  = 000000ff 00000000
	ldda	[%i6+%o4]0x89,%f8 	! %f8  = ffffffff ffffffff
!	Mem[0000000010001400] = 00000000ffffffff, %l3 = 0000000000000000
	ldxa	[%i0+%g0]0x88,%l3	! %l3 = 00000000ffffffff
!	Mem[0000000030001400] = 00000000 0000ff00, %l4 = 00000000, %l5 = 000000bd
	ldda	[%i0+%g0]0x81,%l4	! %l4 = 0000000000000000 000000000000ff00
!	Mem[0000000030001408] = ff000000, %l5 = 000000000000ff00
	ldsba	[%i0+%o4]0x81,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000010181410] = 000000ff, %l0 = ffffffffffffffff
	ldstuba	[%i6+%o5]0x88,%l0	! %l0 = 000000ff000000ff
!	Mem[00000000100c1400] = 0000005a, %f3  = 45c0fdff
	lda	[%i3+%g0]0x80,%f3 	! %f3 = 0000005a
!	Mem[0000000010001408] = ff000000, %l4 = 0000000000000000
	swapa	[%i0+%o4]0x80,%l4	! %l4 = 00000000ff000000
!	Starting 10 instruction Store Burst
!	%l4 = ff000000, %l5 = ffffffff, Mem[0000000010101408] = 000000ff ffffffff
	stda	%l4,[%i4+%o4]0x88	! Mem[0000000010101408] = ff000000 ffffffff

p0_label_162:
!	%l3 = 00000000ffffffff, Mem[0000000020800040] = ff358327, %asi = 80
	stba	%l3,[%o1+0x040]%asi	! Mem[0000000020800040] = ff358327
!	Mem[0000000010101410] = 02e9ee0d, %l0 = 00000000000000ff
	swapa	[%i4+%o5]0x88,%l0	! %l0 = 0000000002e9ee0d
!	Mem[0000000030101400] = 0000a814, %l5 = ffffffffffffffff
	swapa	[%i4+%g0]0x89,%l5	! %l5 = 000000000000a814
!	Mem[0000000010001400] = ffffffff, %l6 = ffffffffffffff00
	swapa	[%i0+%g0]0x88,%l6	! %l6 = 00000000ffffffff
!	%l0 = 0000000002e9ee0d, Mem[0000000010081410] = 00000000
	stwa	%l0,[%i2+%o5]0x80	! Mem[0000000010081410] = 02e9ee0d
!	%l5 = 000000000000a814, Mem[0000000030001400] = 00000000
	stha	%l5,[%i0+%g0]0x81	! Mem[0000000030001400] = a8140000
!	%f17 = 6b000000, Mem[0000000030001410] = 00000000
	sta	%f17,[%i0+%o5]0x89	! Mem[0000000030001410] = 6b000000
!	%l3 = 00000000ffffffff, Mem[0000000010101408] = ff000000
	stba	%l3,[%i4+%o4]0x88	! Mem[0000000010101408] = ff0000ff
!	%l4 = 00000000ff000000, Mem[0000000030001410] = 6b000000
	stwa	%l4,[%i0+%o5]0x89	! Mem[0000000030001410] = ff000000
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = ffff8a5f, %l1 = 00000000000000fd
	ldsha	[%o0+0x000]%asi,%l1	! %l1 = ffffffffffffffff

p0_label_163:
!	Mem[0000000030041408] = ff000000 00000000, %l2 = 000000ff, %l3 = ffffffff
	ldda	[%i1+%o4]0x89,%l2	! %l2 = 0000000000000000 00000000ff000000
!	Mem[0000000030081408] = 000000ff, %l1 = ffffffffffffffff
	lduwa	[%i2+%o4]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[0000000021800040] = 5af7c5e9, %l3 = 00000000ff000000
	ldsha	[%o3+0x040]%asi,%l3	! %l3 = 0000000000005af7
!	Mem[0000000030181400] = 0000000000000014, %l6 = 00000000ffffffff
	ldxa	[%i6+%g0]0x89,%l6	! %l6 = 0000000000000014
!	Mem[00000000300c1400] = 0000b0e7, %l7 = 0000000000000000
	ldsba	[%i3+%g0]0x89,%l7	! %l7 = ffffffffffffffe7
!	Mem[0000000030181410] = fffd0000, %l7 = ffffffffffffffe7
	lduwa	[%i6+%o5]0x81,%l7	! %l7 = 00000000fffd0000
!	Mem[0000000010101400] = 000000ff00000000, %f0  = 0000006b 0000a814
	ldda	[%i4+0x000]%asi,%f0 	! %f0  = 000000ff 00000000
!	Mem[0000000010181400] = 0000fdff, %l4 = 00000000ff000000
	lduba	[%i6+%g0]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[00000000201c0000] = ffff8a5f, %l3 = 0000000000005af7
	ldsba	[%o0+0x000]%asi,%l3	! %l3 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l0 = 0000000002e9ee0d, Mem[00000000211c0000] = ffff6217, %asi = 80
	stba	%l0,[%o2+0x000]%asi	! Mem[00000000211c0000] = 0dff6217

p0_label_164:
!	Mem[000000001000142c] = 000000ff, %l2 = 0000000000000000
	swap	[%i0+0x02c],%l2		! %l2 = 00000000000000ff
!	%l2 = 000000ff, %l3 = ffffffff, Mem[0000000010081408] = 45c0fdff 00000000
	stda	%l2,[%i2+%o4]0x88	! Mem[0000000010081408] = 000000ff ffffffff
!	%l3 = ffffffffffffffff, Mem[0000000030041400] = 00000000
	stha	%l3,[%i1+%g0]0x89	! Mem[0000000030041400] = 0000ffff
!	%f0  = 000000ff 00000000 00000000 0000005a
!	%f4  = fffdffff 000000ff ff000000 740000e3
!	%f8  = ffffffff ffffffff 5a000000 00000080
!	%f12 = 4aff73ff e873ee91 8873ff04 c081b61e
	stda	%f0,[%i4]ASI_BLK_S	! Block Store to 0000000030101400
!	%l6 = 0000000000000014, Mem[0000000010141408] = bdffffffffffffff
	stxa	%l6,[%i5+%o4]0x80	! Mem[0000000010141408] = 0000000000000014
!	Mem[00000000100c1408] = 00fdc045, %l3 = ffffffffffffffff
	ldstuba	[%i3+0x008]%asi,%l3	! %l3 = 00000000000000ff
!	%f24 = 00000000 ff000000, %l6 = 0000000000000014
!	Mem[0000000030081410] = 717900000000b0e7
	add	%i2,0x010,%g1
	stda	%f24,[%g1+%l6]ASI_PST32_SL ! Mem[0000000030081410] = 717900000000b0e7
!	%l0 = 0000000002e9ee0d, Mem[00000000100c1408] = 45c0fdff
	stha	%l0,[%i3+%o4]0x88	! Mem[00000000100c1408] = 45c0ee0d
!	%l6 = 0000000000000014, Mem[0000000010181408] = 0000fd00
	stba	%l6,[%i6+%o4]0x80	! Mem[0000000010181408] = 1400fd00
!	Starting 10 instruction Load Burst
!	Mem[0000000030081410] = 71790000, %l7 = 00000000fffd0000
	ldsba	[%i2+%o5]0x81,%l7	! %l7 = 0000000000000071

p0_label_165:
!	Mem[0000000030001410] = 000000ff00000000, %l6 = 0000000000000014
	ldxa	[%i0+%o5]0x81,%l6	! %l6 = 000000ff00000000
!	Mem[0000000010181400] = 0000fdff, %l5 = 000000000000a814
	lduba	[%i6+%g0]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010041400] = ff000000, %l6 = 000000ff00000000
	ldsha	[%i1+%g0]0x80,%l6	! %l6 = ffffffffffffff00
	membar	#Sync			! Added by membar checker (32)
!	Mem[0000000030101408] = 00000000, %l0 = 0000000002e9ee0d
	lduwa	[%i4+%o4]0x81,%l0	! %l0 = 0000000000000000
!	Mem[00000000300c1400] = 0000b0e7, %f1  = 00000000
	lda	[%i3+%g0]0x89,%f1 	! %f1 = 0000b0e7
!	Mem[0000000030041400] = 0000a8fe0000ffff, %f10 = 5a000000 00000080
	ldda	[%i1+%g0]0x89,%f10	! %f10 = 0000a8fe 0000ffff
!	Mem[000000001008142c] = 0000005a, %l4 = 00000000000000ff
	ldsba	[%i2+0x02c]%asi,%l4	! %l4 = 0000000000000000
!	Mem[0000000010141408] = 0000000000000014, %f24 = 00000000 ff000000
	ldda	[%i5+%o4]0x80,%f24	! %f24 = 00000000 00000014
!	Mem[0000000010181428] = 73e000ff 00000000, %l6 = ffffff00, %l7 = 00000071
	ldda	[%i6+0x028]%asi,%l6	! %l6 = 0000000073e000ff 0000000000000000
!	Starting 10 instruction Store Burst
!	%l2 = 000000ff, %l3 = 00000000, Mem[0000000010181410] = 000000ff 00000000
	stda	%l2,[%i6+%o5]0x88	! Mem[0000000010181410] = 000000ff 00000000

p0_label_166:
!	%l7 = 0000000000000000, Mem[0000000030141410] = 000000ff
	stwa	%l7,[%i5+%o5]0x89	! Mem[0000000030141410] = 00000000
!	%l2 = 00000000000000ff, Mem[00000000300c1400] = e7b00000
	stba	%l2,[%i3+%g0]0x81	! Mem[00000000300c1400] = ffb00000
!	%l3 = 0000000000000000, Mem[0000000010141410] = ff00ff00
	stha	%l3,[%i5+%o5]0x88	! Mem[0000000010141410] = ff000000
!	Mem[0000000020800000] = 00005afb, %l3 = 0000000000000000
	ldstub	[%o1+%g0],%l3		! %l3 = 00000000000000ff
!	%l6 = 73e000ff, %l7 = 00000000, Mem[0000000030101400] = 000000ff 00000000
	stda	%l6,[%i4+%g0]0x81	! Mem[0000000030101400] = 73e000ff 00000000
!	%l7 = 0000000000000000, Mem[0000000010081410] = 0deee902
	stba	%l7,[%i2+%o5]0x88	! Mem[0000000010081410] = 0deee900
!	%f2  = 00000000 0000005a, Mem[0000000010101410] = ff000000 00000059
	stda	%f2 ,[%i4+%o5]0x80	! Mem[0000000010101410] = 00000000 0000005a
!	Mem[0000000010101408] = ff0000ff, %l1 = 00000000000000ff
	swapa	[%i4+%o4]0x88,%l1	! %l1 = 00000000ff0000ff
!	Mem[00000000211c0001] = 0dff6217, %l0 = 0000000000000000
	ldstuba	[%o2+0x001]%asi,%l0	! %l0 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = 0000005a, %l1 = 00000000ff0000ff
	lduba	[%i3+%g0]0x80,%l1	! %l1 = 0000000000000000

p0_label_167:
!	Mem[0000000030141410] = 00000000, %l1 = 0000000000000000
	lduba	[%i5+%o5]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000030181410] = fffd0000, %l5 = 00000000000000ff
	lduba	[%i6+%o5]0x81,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030081408] = ff000000 0000006b, %l2 = 000000ff, %l3 = 00000000
	ldda	[%i2+%o4]0x81,%l2	! %l2 = 00000000ff000000 000000000000006b
!	Mem[0000000010001410] = 00000000, %l6 = 0000000073e000ff
	ldsha	[%i0+%o5]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000030101410] = fffffdff, %l7 = 0000000000000000
	ldsha	[%i4+%o5]0x89,%l7	! %l7 = fffffffffffffdff
!	Mem[0000000030141410] = 00000000, %f9  = ffffffff
	lda	[%i5+%o5]0x89,%f9 	! %f9 = 00000000
!	Mem[0000000010181408] = 00fd0014, %f0  = 000000ff
	lda	[%i6+%o4]0x88,%f0 	! %f0 = 00fd0014
!	Mem[0000000030141410] = 00000000, %l7 = fffffffffffffdff
	ldsha	[%i5+%o5]0x81,%l7	! %l7 = 0000000000000000
!	Mem[000000001010141c] = 00000000, %f7  = 740000e3
	lda	[%i4+0x01c]%asi,%f7 	! %f7 = 00000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030081410] = 00007971, %l5 = 00000000000000ff
	swapa	[%i2+%o5]0x89,%l5	! %l5 = 0000000000007971

p0_label_168:
!	%f10 = 0000a8fe, Mem[00000000300c1410] = ffffffff
	sta	%f10,[%i3+%o5]0x89	! Mem[00000000300c1410] = 0000a8fe
!	%l6 = 0000000000000000, Mem[0000000030101408] = 5a00000000000000
	stxa	%l6,[%i4+%o4]0x89	! Mem[0000000030101408] = 0000000000000000
!	%l4 = 0000000000000000, Mem[0000000010041410] = 00000000
	stba	%l4,[%i1+%o5]0x88	! Mem[0000000010041410] = 00000000
!	%f23 = 000000ff, Mem[0000000010001414] = fa000000
	st	%f23,[%i0+0x014]	! Mem[0000000010001414] = 000000ff
!	%f7  = 00000000, Mem[0000000010041410] = 00000000
	sta	%f7 ,[%i1+%o5]0x88	! Mem[0000000010041410] = 00000000
!	%l0 = 00000000000000ff, Mem[00000000100c141a] = e3000074
	sth	%l0,[%i3+0x01a]		! Mem[00000000100c1418] = e30000ff
!	Mem[0000000010001410] = 00000000, %l3 = 000000000000006b
	swapa	[%i0+%o5]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000030081400] = ff00007b, %l2 = 00000000ff000000
	swapa	[%i2+%g0]0x81,%l2	! %l2 = 00000000ff00007b
!	%l0 = 00000000000000ff, Mem[0000000030001400] = 000014a8
	stha	%l0,[%i0+%g0]0x89	! Mem[0000000030001400] = 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = 000000ff, %l7 = 0000000000000000
	lduwa	[%i4+%o4]0x88,%l7	! %l7 = 00000000000000ff

p0_label_169:
!	Mem[0000000010181408] = 1400fd00 00000000, %l6 = 00000000, %l7 = 000000ff
	ldda	[%i6+%o4]0x80,%l6	! %l6 = 000000001400fd00 0000000000000000
!	Mem[0000000010141400] = 00000000000000ff, %l1 = 0000000000000000
	ldxa	[%i5+%g0]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010001408] = 00000000, %l7 = 0000000000000000
	lduba	[%i0+%o4]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000010181410] = ff00000000000000, %l0 = 00000000000000ff
	ldxa	[%i6+%o5]0x80,%l0	! %l0 = ff00000000000000
!	Mem[0000000010181438] = 0000000000000000, %f10 = 0000a8fe 0000ffff
	ldd	[%i6+0x038],%f10	! %f10 = 00000000 00000000
!	Mem[0000000010001400] = 00ffffff, %l6 = 000000001400fd00
	ldswa	[%i0+%g0]0x80,%l6	! %l6 = 0000000000ffffff
!	Mem[00000000211c0000] = 0dff6217, %l5 = 0000000000007971
	lduha	[%o2+0x000]%asi,%l5	! %l5 = 0000000000000dff
!	Mem[0000000030081410] = ff000000, %l0 = ff00000000000000
	ldswa	[%i2+%o5]0x81,%l0	! %l0 = ffffffffff000000
!	Mem[0000000030101400] = 73e000ff00000000, %l3 = 0000000000000000
	ldxa	[%i4+%g0]0x81,%l3	! %l3 = 73e000ff00000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010141400] = 000000ff, %l0 = ffffffffff000000
	swapa	[%i5+%g0]0x88,%l0	! %l0 = 00000000000000ff

p0_label_170:
!	%f20 = 00000000 fffffdff, Mem[0000000010001408] = 00000000 00000000
	stda	%f20,[%i0+%o4]0x88	! Mem[0000000010001408] = 00000000 fffffdff
!	Mem[0000000010081408] = ff000000, %l0 = 00000000000000ff
	ldstuba	[%i2+%o4]0x80,%l0	! %l0 = 000000ff000000ff
!	%l0 = 00000000000000ff, Mem[0000000030001400] = ff0000000000ff00
	stxa	%l0,[%i0+%g0]0x81	! Mem[0000000030001400] = 00000000000000ff
!	%f10 = 00000000 00000000, Mem[0000000010041410] = 00000000 00000000
	stda	%f10,[%i1+%o5]0x88	! Mem[0000000010041410] = 00000000 00000000
!	%f22 = e3000074 000000ff, %l3 = 73e000ff00000000
!	Mem[0000000030041410] = 00000000bd000000
	add	%i1,0x010,%g1
	stda	%f22,[%g1+%l3]ASI_PST32_SL ! Mem[0000000030041410] = 00000000bd000000
!	%l4 = 0000000000000000, Mem[00000000100c1400] = 0000005a
	stba	%l4,[%i3+%g0]0x80	! Mem[00000000100c1400] = 0000005a
!	%l4 = 0000000000000000, Mem[00000000218000c0] = 17bde748, %asi = 80
	stha	%l4,[%o3+0x0c0]%asi	! Mem[00000000218000c0] = 0000e748
!	%f20 = 00000000, Mem[00000000100c1408] = 0deec045
	sta	%f20,[%i3+0x008]%asi	! Mem[00000000100c1408] = 00000000
!	%l1 = 00000000000000ff, Mem[0000000010001410] = 6b000000000000ff
	stx	%l1,[%i0+%o5]		! Mem[0000000010001410] = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = 1400fd00, %l1 = 00000000000000ff
	ldswa	[%i6+%o4]0x80,%l1	! %l1 = 000000001400fd00

p0_label_171:
!	Mem[0000000010141408] = 00000000, %l4 = 0000000000000000
	lduwa	[%i5+%o4]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000030001410] = 000000ff, %l4 = 0000000000000000
	lduba	[%i0+%o5]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000030081408] = 000000ff, %l7 = 0000000000000000
	lduba	[%i2+%o4]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010141400] = ff000000, %l3 = 73e000ff00000000
	ldsha	[%i5+%g0]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000030081400] = 350365f0000000ff, %f26 = 000000ff 0000005a
	ldda	[%i2+%g0]0x89,%f26	! %f26 = 350365f0 000000ff
!	Mem[0000000010001408] = fffdffff00000000, %f0  = 00fd0014 0000b0e7
	ldda	[%i0+%o4]0x80,%f0 	! %f0  = fffdffff 00000000
!	Mem[0000000030081408] = 000000ff, %l3 = 0000000000000000
	ldswa	[%i2+%o4]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[00000000300c1410] = 0000a8fe, %l1 = 000000001400fd00
	lduba	[%i3+%o5]0x89,%l1	! %l1 = 00000000000000fe
!	Mem[00000000100c1408] = 00000000, %l5 = 0000000000000dff
	lduha	[%i3+%o4]0x88,%l5	! %l5 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f15 = c081b61e, Mem[0000000010101408] = 000000ff
	sta	%f15,[%i4+%o4]0x88	! Mem[0000000010101408] = c081b61e

p0_label_172:
!	Mem[00000000100c1400] = 0000005a, %l5 = 0000000000000000
	ldstuba	[%i3+%g0]0x80,%l5	! %l5 = 00000000000000ff
!	%l3 = 00000000000000ff, Mem[00000000300c1408] = ff170000
	stba	%l3,[%i3+%o4]0x81	! Mem[00000000300c1408] = ff170000
!	%f8  = ffffffff 00000000, Mem[0000000010041410] = 00000000 00000000
	stda	%f8 ,[%i1+%o5]0x88	! Mem[0000000010041410] = ffffffff 00000000
!	%l2 = 00000000ff00007b, Mem[0000000030141408] = 45c0fdff
	stba	%l2,[%i5+%o4]0x89	! Mem[0000000030141408] = 45c0fd7b
!	%l3 = 00000000000000ff, Mem[0000000030101410] = fffffdff
	stba	%l3,[%i4+%o5]0x89	! Mem[0000000030101410] = fffffdff
!	Mem[0000000030001408] = ff000000, %l0 = 00000000000000ff
	ldstuba	[%i0+%o4]0x81,%l0	! %l0 = 000000ff000000ff
!	%l0 = 00000000000000ff, Mem[0000000010001400] = 00ffffff
	stwa	%l0,[%i0+%g0]0x80	! Mem[0000000010001400] = 000000ff
!	%l7 = 00000000000000ff, Mem[0000000010101410] = 5a00000000000000
	stxa	%l7,[%i4+%o5]0x88	! Mem[0000000010101410] = 00000000000000ff
!	%l6 = 0000000000ffffff, Mem[0000000030101410] = fffffdff
	stba	%l6,[%i4+%o5]0x89	! Mem[0000000030101410] = fffffdff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = 00fd0014, %l1 = 00000000000000fe
	ldsha	[%i6+%o4]0x88,%l1	! %l1 = 0000000000000014

p0_label_173:
!	Mem[0000000010001400] = 000000ff 00000000, %l6 = 00ffffff, %l7 = 000000ff
	ldda	[%i0+%g0]0x80,%l6	! %l6 = 00000000000000ff 0000000000000000
!	Mem[00000000211c0000] = 0dff6217, %l6 = 00000000000000ff
	ldsba	[%o2+0x000]%asi,%l6	! %l6 = 000000000000000d
!	Mem[0000000010081400] = 14a80000, %l0 = 00000000000000ff
	lduwa	[%i2+%g0]0x80,%l0	! %l0 = 0000000014a80000
!	Mem[0000000010081408] = ff000000ffffffff, %f4  = fffdffff 000000ff
	ldd	[%i2+%o4],%f4 		! %f4  = ff000000 ffffffff
!	Mem[00000000100c1418] = e30000ff, %f8  = ffffffff
	ld	[%i3+0x018],%f8 	! %f8 = e30000ff
!	Mem[0000000010101420] = 0000007d, %l6 = 000000000000000d
	ldsba	[%i4+0x022]%asi,%l6	! %l6 = 0000000000000000
!	Mem[0000000030141400] = fffd0000, %l2 = 00000000ff00007b
	lduha	[%i5+%g0]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000010101400] = 000000ff, %l1 = 0000000000000014
	lduha	[%i4+%g0]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000010141400] = 000000ff00000000, %f24 = 00000000 00000014
	ldda	[%i5+%g0]0x80,%f24	! %f24 = 000000ff 00000000
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000000000, Mem[00000000300c1408] = ff17000000000000
	stxa	%l4,[%i3+%o4]0x81	! Mem[00000000300c1408] = 0000000000000000

p0_label_174:
!	%f28 = 91ee73e8 ff73ff4a, Mem[0000000030081400] = 000000ff 350365f0
	stda	%f28,[%i2+%g0]0x89	! Mem[0000000030081400] = 91ee73e8 ff73ff4a
!	%f10 = 00000000 00000000, Mem[0000000010141418] = bee2ecfb a756d7a7
	stda	%f10,[%i5+0x018]%asi	! Mem[0000000010141418] = 00000000 00000000
!	Mem[0000000010001430] = ffffffffffffffff, %l6 = 0000000000000000, %l1 = 0000000000000000
	add	%i0,0x30,%g1
	casxa	[%g1]0x80,%l6,%l1	! %l1 = ffffffffffffffff
!	%l3 = 00000000000000ff, Mem[0000000030141410] = 00000000
	stha	%l3,[%i5+%o5]0x81	! Mem[0000000030141410] = 00ff0000
!	%l5 = 0000000000000000, Mem[00000000100c1408] = 0000000000000000
	stxa	%l5,[%i3+%o4]0x80	! Mem[00000000100c1408] = 0000000000000000
!	%l1 = ffffffffffffffff, Mem[0000000010101428] = 6ddc71ffff87e36b
	stx	%l1,[%i4+0x028]		! Mem[0000000010101428] = ffffffffffffffff
!	%l4 = 00000000, %l5 = 00000000, Mem[0000000030001400] = 00000000 ff000000
	stda	%l4,[%i0+%g0]0x89	! Mem[0000000030001400] = 00000000 00000000
!	%l2 = 00000000, %l3 = 000000ff, Mem[0000000010041428] = 6bff8774 8271dc6d
	std	%l2,[%i1+0x028]		! Mem[0000000010041428] = 00000000 000000ff
!	Mem[0000000030081410] = 000000ff, %l1 = ffffffffffffffff
	ldstuba	[%i2+%o5]0x89,%l1	! %l1 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[000000001000141c] = 00000000, %l2 = 0000000000000000
	ldsh	[%i0+0x01e],%l2		! %l2 = 0000000000000000

p0_label_175:
!	Mem[0000000030141408] = 7bfdc045 00000000, %l6 = 00000000, %l7 = 00000000
	ldda	[%i5+%o4]0x81,%l6	! %l6 = 000000007bfdc045 0000000000000000
!	Mem[0000000010041400] = ff00000000000000, %l5 = 0000000000000000
	ldxa	[%i1+%g0]0x80,%l5	! %l5 = ff00000000000000
!	Mem[0000000030041408] = 00000000, %l7 = 0000000000000000
	ldsha	[%i1+%o4]0x89,%l7	! %l7 = 0000000000000000
!	Mem[00000000300c1410] = fea80000ffffffff, %l2 = 0000000000000000
	ldxa	[%i3+%o5]0x81,%l2	! %l2 = fea80000ffffffff
!	Mem[0000000010181418] = 0000007d, %l1 = 00000000000000ff
	ldsw	[%i6+0x018],%l1		! %l1 = 000000000000007d
!	%l0 = 0000000014a80000, immed = 00000565, %y  = 000000fe
	umul	%l0,0x565,%l3		! %l3 = 0000006f6e480000, %y = 0000006f
!	Mem[0000000010181400] = fffd0000, %l0 = 0000000014a80000
	ldsha	[%i6+%g0]0x80,%l0	! %l0 = fffffffffffffffd
!	Mem[0000000021800140] = ffff4ce0, %l4 = 0000000000000000
	ldsb	[%o3+0x141],%l4		! %l4 = ffffffffffffffff
!	Mem[0000000010141410] = 000000ff00000000, %f20 = 00000000 fffffdff
	ldda	[%i5+%o5]0x80,%f20	! %f20 = 000000ff 00000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010101400] = 000000ff, %l2 = fea80000ffffffff
	swapa	[%i4+%g0]0x80,%l2	! %l2 = 00000000000000ff

p0_label_176:
!	Mem[0000000010141410] = ff000000, %l4 = ffffffffffffffff
	swapa	[%i5+%o5]0x88,%l4	! %l4 = 00000000ff000000
!	%f25 = 00000000, Mem[0000000010041410] = 00000000
	sta	%f25,[%i1+%o5]0x88	! Mem[0000000010041410] = 00000000
!	%f0  = fffdffff 00000000 00000000 0000005a
!	%f4  = ff000000 ffffffff ff000000 00000000
!	%f8  = e30000ff 00000000 00000000 00000000
!	%f12 = 4aff73ff e873ee91 8873ff04 c081b61e
	stda	%f0,[%i2]ASI_BLK_AIUP	! Block Store to 0000000010081400
!	Mem[0000000030181400] = 00000014, %l0 = fffffffffffffffd
	swapa	[%i6+%g0]0x89,%l0	! %l0 = 0000000000000014
!	%l6 = 000000007bfdc045, Mem[0000000010001408] = fffffdff
	stha	%l6,[%i0+%o4]0x88	! Mem[0000000010001408] = ffffc045
!	%f30 = ffffffff ffffffff, Mem[0000000030081408] = 000000ff 6b000000
	stda	%f30,[%i2+%o4]0x89	! Mem[0000000030081408] = ffffffff ffffffff
!	%l1 = 000000000000007d, Mem[00000000100c1408] = 00000000
	stwa	%l1,[%i3+%o4]0x80	! Mem[00000000100c1408] = 0000007d
!	%l4 = 00000000ff000000, Mem[0000000010101400] = ffffffff
	stwa	%l4,[%i4+%g0]0x80	! Mem[0000000010101400] = ff000000
	membar	#Sync			! Added by membar checker (33)
!	Mem[0000000010081406] = 00000000, %l4 = 00000000ff000000
	ldstuba	[%i2+0x006]%asi,%l4	! %l4 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = 6b000000 000000ff, %l0 = 00000014, %l1 = 0000007d
	ldda	[%i0+%o4]0x89,%l0	! %l0 = 00000000000000ff 000000006b000000

p0_label_177:
!	Mem[00000000211c0000] = 0dff6217, %l3 = 0000006f6e480000
	ldsb	[%o2+%g0],%l3		! %l3 = 000000000000000d
!	Mem[0000000030001400] = 00000000, %l5 = ff00000000000000
	ldsba	[%i0+%g0]0x81,%l5	! %l5 = 0000000000000000
!	Mem[000000001014141c] = 00000000, %l1 = 000000006b000000
	lduba	[%i5+0x01c]%asi,%l1	! %l1 = 0000000000000000
!	Mem[0000000010101438] = 59b9455e, %l3 = 000000000000000d
	lduh	[%i4+0x03a],%l3		! %l3 = 000000000000455e
!	Mem[0000000030101408] = 00000000, %l4 = 0000000000000000
	ldsba	[%i4+%o4]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000010181400] = 0000fdff, %l2 = 00000000000000ff
	ldsha	[%i6+%g0]0x88,%l2	! %l2 = fffffffffffffdff
!	Mem[0000000030101410] = fffdffff000000ff, %l1 = 0000000000000000
	ldxa	[%i4+%o5]0x81,%l1	! %l1 = fffdffff000000ff
!	Mem[0000000030141408] = 7bfdc04500000000, %f22 = e3000074 000000ff
	ldda	[%i5+%o4]0x81,%f22	! %f22 = 7bfdc045 00000000
!	Mem[0000000030181408] = ffffffff, %l7 = 0000000000000000
	ldswa	[%i6+%o4]0x89,%l7	! %l7 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1410] = 0000a8fe, %l2 = fffffffffffffdff
	ldstuba	[%i3+%o5]0x89,%l2	! %l2 = 000000fe000000ff

p0_label_178:
!	Mem[0000000010101408] = c081b61e, %l6 = 000000007bfdc045
	swapa	[%i4+%o4]0x88,%l6	! %l6 = 00000000c081b61e
!	Mem[0000000010041400] = ff000000, %l2 = 00000000000000fe
	ldstuba	[%i1+%g0]0x80,%l2	! %l2 = 000000ff000000ff
!	%f2  = 00000000 0000005a, Mem[0000000030101410] = fffdffff 000000ff
	stda	%f2 ,[%i4+%o5]0x81	! Mem[0000000030101410] = 00000000 0000005a
!	Mem[00000000300c1400] = ffb00000, %l5 = 0000000000000000
	ldstuba	[%i3+%g0]0x81,%l5	! %l5 = 000000ff000000ff
!	%l6 = 00000000c081b61e, Mem[0000000030101408] = 00000000
	stwa	%l6,[%i4+%o4]0x89	! Mem[0000000030101408] = c081b61e
!	%l5 = 00000000000000ff, Mem[0000000030041400] = ffff0000
	stwa	%l5,[%i1+%g0]0x81	! Mem[0000000030041400] = 000000ff
!	%l5 = 00000000000000ff, Mem[0000000010181400] = 0000fdff
	stwa	%l5,[%i6+%g0]0x88	! Mem[0000000010181400] = 000000ff
!	Mem[0000000010101421] = 0000007d, %l5 = 00000000000000ff
	ldstuba	[%i4+0x021]%asi,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010181410] = 000000ff, %l7 = ffffffffffffffff
	swapa	[%i6+%o5]0x88,%l7	! %l7 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c142c] = 0000005a, %f16 = 14a80000
	lda	[%i3+0x02c]%asi,%f16	! %f16 = 0000005a

p0_label_179:
!	Mem[0000000030081400] = 4aff73ff, %l7 = 00000000000000ff
	ldsha	[%i2+%g0]0x81,%l7	! %l7 = 0000000000004aff
!	Mem[0000000030001400] = 00000000 00000000, %l0 = 000000ff, %l1 = 000000ff
	ldda	[%i0+%g0]0x89,%l0	! %l0 = 0000000000000000 0000000000000000
!	Mem[00000000100c1410] = ff00ffff, %l5 = 0000000000000000
	ldsba	[%i3+%o5]0x80,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000030181408] = ffffffff, %l7 = 0000000000004aff
	lduwa	[%i6+%o4]0x89,%l7	! %l7 = 00000000ffffffff
!	Mem[00000000201c0000] = ffff8a5f, %l1 = 0000000000000000
	lduba	[%o0+0x000]%asi,%l1	! %l1 = 00000000000000ff
!	Mem[00000000100c1410] = ffff00ff, %f16 = 0000005a
	lda	[%i3+%o5]0x88,%f16	! %f16 = ffff00ff
!	Mem[0000000030041408] = 00000000, %l5 = ffffffffffffffff
	ldsba	[%i1+%o4]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000010141410] = 00000000ffffffff, %l2 = 00000000000000ff
	ldxa	[%i5+%o5]0x88,%l2	! %l2 = 00000000ffffffff
!	Mem[00000000100c1408] = 0000007d00000000, %l2 = 00000000ffffffff
	ldxa	[%i3+%o4]0x80,%l2	! %l2 = 0000007d00000000
!	Starting 10 instruction Store Burst
!	%f2  = 00000000 0000005a, Mem[0000000010101418] = 6bff8774 00000000
	stda	%f2 ,[%i4+0x018]%asi	! Mem[0000000010101418] = 00000000 0000005a

p0_label_180:
!	%l4 = 0000000000000000, Mem[0000000010101410] = 000000ff
	stha	%l4,[%i4+%o5]0x88	! Mem[0000000010101410] = 00000000
!	%l6 = c081b61e, %l7 = ffffffff, Mem[0000000010081438] = 8873ff04 c081b61e
	std	%l6,[%i2+0x038]		! Mem[0000000010081438] = c081b61e ffffffff
!	%f8  = e30000ff 00000000, %l0 = 0000000000000000
!	Mem[0000000030181430] = 61121d3602e9ee0d
	add	%i6,0x030,%g1
	stda	%f8,[%g1+%l0]ASI_PST32_S ! Mem[0000000030181430] = 61121d3602e9ee0d
!	%f16 = ffff00ff 6b000000 fffdc045 00000000
!	%f20 = 000000ff 00000000 7bfdc045 00000000
!	%f24 = 000000ff 00000000 350365f0 000000ff
!	%f28 = 91ee73e8 ff73ff4a ffffffff ffffffff
	stda	%f16,[%i4]ASI_COMMIT_S	! Block Store to 0000000030101400
!	Mem[0000000030001408] = 000000ff, %l6 = 00000000c081b61e
	ldstuba	[%i0+%o4]0x89,%l6	! %l6 = 000000ff000000ff
!	%l0 = 0000000000000000, Mem[0000000010181400] = ff000000fd000000
	stxa	%l0,[%i6+%g0]0x80	! Mem[0000000010181400] = 0000000000000000
!	%l5 = 0000000000000000, Mem[00000000100c1408] = 0000007d
	stha	%l5,[%i3+%o4]0x80	! Mem[00000000100c1408] = 0000007d
!	Mem[0000000030081410] = 000000ff, %l2 = 0000007d00000000
	ldstuba	[%i2+%o5]0x89,%l2	! %l2 = 000000ff000000ff
!	Mem[00000000211c0001] = 0dff6217, %l6 = 00000000000000ff
	ldstuba	[%o2+0x001]%asi,%l6	! %l6 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010041418] = f0650335 77749a38, %l0 = 00000000, %l1 = 000000ff
	ldd	[%i1+0x018],%l0		! %l0 = 00000000f0650335 0000000077749a38

p0_label_181:
!	Mem[0000000010041408] = 000000ff, %l1 = 0000000077749a38
	lduha	[%i1+%o4]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000030041408] = 00000000 000000ff, %l2 = 000000ff, %l3 = 0000455e
	ldda	[%i1+%o4]0x81,%l2	! %l2 = 0000000000000000 00000000000000ff
!	Mem[0000000010141408] = 14000000 00000000, %l4 = 00000000, %l5 = 00000000
	ldda	[%i5+%o4]0x88,%l4	! %l4 = 0000000000000000 0000000014000000
	membar	#Sync			! Added by membar checker (34)
!	Mem[0000000010101408] = ffffffff 7bfdc045, %l0 = f0650335, %l1 = 00000000
	ldda	[%i4+%o4]0x88,%l0	! %l0 = 000000007bfdc045 00000000ffffffff
!	Mem[0000000030181410] = 0000fdff, %l3 = 00000000000000ff
	lduha	[%i6+%o5]0x89,%l3	! %l3 = 000000000000fdff
!	Mem[0000000030001408] = 000000ff, %l3 = 000000000000fdff
	lduba	[%i0+%o4]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010101408] = 7bfdc045, %l5 = 0000000014000000
	lduba	[%i4+%o4]0x88,%l5	! %l5 = 0000000000000045
!	Mem[0000000030101410] = ff000000, %l6 = 00000000000000ff
	lduwa	[%i4+%o5]0x89,%l6	! %l6 = 00000000ff000000
!	Mem[0000000010001410] = 00000000, %l6 = 00000000ff000000
	ldsha	[%i0+%o5]0x88,%l6	! %l6 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010041420] = 0bc50000, %l4 = 0000000000000000, %asi = 80
	swapa	[%i1+0x020]%asi,%l4	! %l4 = 000000000bc50000

p0_label_182:
!	Mem[0000000010001400] = ff000000, %l1 = 00000000ffffffff
	ldstuba	[%i0+%g0]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010101418] = 00000000, %l7 = 00000000ffffffff
	swap	[%i4+0x018],%l7		! %l7 = 0000000000000000
!	%l0 = 7bfdc045, %l1 = 00000000, Mem[00000000100c1400] = 5a0000ff 0000006b
	stda	%l0,[%i3+%g0]0x88	! Mem[00000000100c1400] = 7bfdc045 00000000
!	Mem[00000000211c0001] = 0dff6217, %l2 = 0000000000000000
	ldstub	[%o2+0x001],%l2		! %l2 = 000000ff000000ff
!	%f20 = 000000ff 00000000, Mem[0000000010141408] = 00000000 14000000
	stda	%f20,[%i5+%o4]0x88	! Mem[0000000010141408] = 000000ff 00000000
!	%f4  = ff000000, Mem[000000001014143c] = dde35eb2
	sta	%f4 ,[%i5+0x03c]%asi	! Mem[000000001014143c] = ff000000
!	Mem[0000000010101408] = 45c0fd7b, %l6 = 0000000000000000
	ldstuba	[%i4+%o4]0x80,%l6	! %l6 = 00000045000000ff
!	%l6 = 0000000000000045, Mem[00000000211c0001] = 0dff6217, %asi = 80
	stba	%l6,[%o2+0x001]%asi	! Mem[00000000211c0000] = 0d456217
!	Mem[0000000010181410] = ffffffff, %l7 = 0000000000000000
	swapa	[%i6+%o5]0x88,%l7	! %l7 = 00000000ffffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = 00000000 00000000, %l0 = 7bfdc045, %l1 = 00000000
	ldda	[%i4+%o5]0x88,%l0	! %l0 = 0000000000000000 0000000000000000

p0_label_183:
!	Mem[0000000030181408] = ffffffff, %l4 = 000000000bc50000
	lduwa	[%i6+%o4]0x89,%l4	! %l4 = 00000000ffffffff
!	Mem[0000000010041410] = 00000000ffffffff, %l2 = 00000000000000ff
	ldxa	[%i1+%o5]0x80,%l2	! %l2 = 00000000ffffffff
!	Mem[0000000030141410] = 00ff0000fffffdff, %f30 = ffffffff ffffffff
	ldda	[%i5+%o5]0x81,%f30	! %f30 = 00ff0000 fffffdff
!	Mem[0000000010181408] = 1400fd0000000000, %f26 = 350365f0 000000ff
	ldd	[%i6+%o4],%f26		! %f26 = 1400fd00 00000000
!	Mem[0000000030041400] = 0000a8fe ff000000, %l4 = ffffffff, %l5 = 00000045
	ldda	[%i1+%g0]0x89,%l4	! %l4 = 00000000ff000000 000000000000a8fe
!	Mem[0000000010081408] = 5a000000 00000000, %l6 = 00000045, %l7 = ffffffff
	ldda	[%i2+%o4]0x88,%l6	! %l6 = 0000000000000000 000000005a000000
!	Mem[00000000300c1400] = ffffffff0000b0ff, %f6  = ff000000 00000000
	ldda	[%i3+%g0]0x89,%f6 	! %f6  = ffffffff 0000b0ff
!	Mem[0000000030141400] = fffd0000, %l5 = 000000000000a8fe
	ldsba	[%i5+%g0]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000010081400] = 00ff0000fffffdff, %l2 = 00000000ffffffff
	ldxa	[%i2+%g0]0x88,%l2	! %l2 = 00ff0000fffffdff
!	Starting 10 instruction Store Burst
!	%l4 = 00000000ff000000, Mem[0000000010041410] = 00000000
	stba	%l4,[%i1+%o5]0x80	! Mem[0000000010041410] = 00000000

p0_label_184:
!	%f18 = fffdc045 00000000, %l0 = 0000000000000000
!	Mem[0000000030001418] = 44429bd5d478c577
	add	%i0,0x018,%g1
	stda	%f18,[%g1+%l0]ASI_PST32_S ! Mem[0000000030001418] = 44429bd5d478c577
!	Mem[0000000030001408] = ff000000, %l4 = 00000000ff000000
	ldstuba	[%i0+%o4]0x81,%l4	! %l4 = 000000ff000000ff
!	%l4 = 00000000000000ff, Mem[0000000010001408] = 45c0ffff00000000
	stxa	%l4,[%i0+%o4]0x80	! Mem[0000000010001408] = 00000000000000ff
!	%l2 = fffffdff, %l3 = 000000ff, Mem[00000000300c1408] = 00000000 00000000
	stda	%l2,[%i3+%o4]0x89	! Mem[00000000300c1408] = fffffdff 000000ff
!	%l4 = 00000000000000ff, Mem[0000000010181410] = 00000000
	stba	%l4,[%i6+%o5]0x80	! Mem[0000000010181410] = ff000000
!	%f22 = 7bfdc045 00000000, Mem[0000000010041410] = 00000000 ffffffff
	stda	%f22,[%i1+0x010]%asi	! Mem[0000000010041410] = 7bfdc045 00000000
!	Mem[0000000030001410] = 000000ff, %l0 = 0000000000000000
	swapa	[%i0+%o5]0x81,%l0	! %l0 = 00000000000000ff
!	%l5 = 0000000000000000, Mem[0000000030181408] = ffffffffffffffff
	stxa	%l5,[%i6+%o4]0x89	! Mem[0000000030181408] = 0000000000000000
!	%l6 = 0000000000000000, Mem[0000000010101400] = ff000000
	stwa	%l6,[%i4+%g0]0x80	! Mem[0000000010101400] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = 7bfdc045, %f14 = 8873ff04
	lda	[%i1+%o5]0x80,%f14	! %f14 = 7bfdc045

p0_label_185:
!	Mem[0000000021800080] = 65a8d810, %l6 = 0000000000000000
	ldsha	[%o3+0x080]%asi,%l6	! %l6 = 00000000000065a8
!	Mem[0000000030001408] = ff000000, %l1 = 0000000000000000
	lduha	[%i0+%o4]0x81,%l1	! %l1 = 000000000000ff00
!	Mem[0000000010141408] = 00000000, %l0 = 00000000000000ff
	lduha	[%i5+%o4]0x88,%l0	! %l0 = 0000000000000000
!	Mem[00000000100c1400] = 7bfdc045, %f30 = 00ff0000
	lda	[%i3+%g0]0x88,%f30	! %f30 = 7bfdc045
!	Mem[0000000030101410] = 000000ff, %l5 = 0000000000000000
	lduwa	[%i4+%o5]0x81,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010101400] = 0000000000000000, %l7 = 000000005a000000
	ldxa	[%i4+%g0]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000030001400] = 00000000, %l5 = 00000000000000ff
	lduwa	[%i0+%g0]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000030181410] = 0000fdff, %l1 = 000000000000ff00
	ldsba	[%i6+%o5]0x89,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010141400] = ff000000, %l1 = ffffffffffffffff
	lduba	[%i5+%g0]0x88,%l1	! %l1 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f4  = ff000000 ffffffff, Mem[0000000010041400] = ff000000 00000000
	stda	%f4 ,[%i1+%g0]0x80	! Mem[0000000010041400] = ff000000 ffffffff

p0_label_186:
!	%l4 = 00000000000000ff, Mem[0000000010141408] = 00000000
	stha	%l4,[%i5+%o4]0x80	! Mem[0000000010141408] = 00ff0000
!	%l5 = 0000000000000000, Mem[0000000010041408] = 00000000ff000000
	stxa	%l5,[%i1+%o4]0x88	! Mem[0000000010041408] = 0000000000000000
!	Mem[0000000010041410] = 45c0fd7b, %l0 = 0000000000000000
	ldstuba	[%i1+%o5]0x88,%l0	! %l0 = 0000007b000000ff
!	%l0 = 000000000000007b, Mem[0000000010141408] = 0000ff00
	stwa	%l0,[%i5+%o4]0x88	! Mem[0000000010141408] = 0000007b
!	%f10 = 00000000 00000000, %l7 = 0000000000000000
!	Mem[0000000030141428] = 800000000000005a
	add	%i5,0x028,%g1
	stda	%f10,[%g1+%l7]ASI_PST16_S ! Mem[0000000030141428] = 800000000000005a
!	Mem[00000000100c1429] = ccaa8168, %l6 = 00000000000065a8
	ldstuba	[%i3+0x029]%asi,%l6	! %l6 = 000000aa000000ff
!	%l0 = 0000007b, %l1 = 00000000, Mem[0000000010081400] = fffdffff 0000ff00
	stda	%l0,[%i2+0x000]%asi	! Mem[0000000010081400] = 0000007b 00000000
!	%l4 = 00000000000000ff, Mem[0000000010141410] = ffffffff
	stwa	%l4,[%i5+%o5]0x80	! Mem[0000000010141410] = 000000ff
!	%f12 = 4aff73ff e873ee91, Mem[0000000030101410] = 000000ff 00000000
	stda	%f12,[%i4+%o5]0x81	! Mem[0000000030101410] = 4aff73ff e873ee91
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = 0000007b, %f4  = ff000000
	lda	[%i5+%o4]0x88,%f4 	! %f4 = 0000007b

p0_label_187:
!	Mem[00000000300c1410] = 0000a8ff, %l7 = 0000000000000000
	ldsha	[%i3+%o5]0x89,%l7	! %l7 = ffffffffffffa8ff
!	Mem[0000000010001400] = 00000000ff0000ff, %f22 = 7bfdc045 00000000
	ldda	[%i0+%g0]0x88,%f22	! %f22 = 00000000 ff0000ff
!	Mem[0000000010081410] = 000000ff, %l3 = 00000000000000ff
	lduha	[%i2+%o5]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[00000000300c1410] = ffa80000, %l1 = 0000000000000000
	lduha	[%i3+%o5]0x81,%l1	! %l1 = 000000000000ffa8
!	Mem[00000000300c1408] = fffffdff, %l1 = 000000000000ffa8
	lduwa	[%i3+%o4]0x89,%l1	! %l1 = 00000000fffffdff
!	Mem[0000000030141408] = 7bfdc045, %l2 = 00ff0000fffffdff
	lduba	[%i5+%o4]0x81,%l2	! %l2 = 000000000000007b
!	Mem[0000000010081400] = 7b000000, %l3 = 00000000000000ff
	ldsha	[%i2+%g0]0x88,%l3	! %l3 = 0000000000000000
!	Mem[00000000100c1410] = ff00ffff fffffdff, %l0 = 0000007b, %l1 = fffffdff
	ldda	[%i3+%o5]0x80,%l0	! %l0 = 00000000ff00ffff 00000000fffffdff
!	Mem[00000000100c1408] = 0000007d00000000, %f6  = ffffffff 0000b0ff
	ldda	[%i3+%o4]0x80,%f6 	! %f6  = 0000007d 00000000
!	Starting 10 instruction Store Burst
!	%l5 = 0000000000000000, Mem[0000000010181400] = 00000000
	stha	%l5,[%i6+%g0]0x88	! Mem[0000000010181400] = 00000000

p0_label_188:
!	%f10 = 00000000 00000000, Mem[0000000010141418] = 00000000 00000000
	std	%f10,[%i5+0x018]	! Mem[0000000010141418] = 00000000 00000000
!	%f11 = 00000000, Mem[0000000010141400] = ff000000
	sta	%f11,[%i5+%g0]0x88	! Mem[0000000010141400] = 00000000
!	%f27 = 00000000, Mem[0000000010141410] = 000000ff
	sta	%f27,[%i5+%o5]0x80	! Mem[0000000010141410] = 00000000
!	%f30 = 7bfdc045 fffffdff, Mem[0000000010141410] = 00000000 00000000
	stda	%f30,[%i5+%o5]0x88	! Mem[0000000010141410] = 7bfdc045 fffffdff
!	%f30 = 7bfdc045, Mem[0000000030041400] = ff000000
	sta	%f30,[%i1+%g0]0x89	! Mem[0000000030041400] = 7bfdc045
!	%f11 = 00000000, Mem[000000001000140c] = 000000ff
	sta	%f11,[%i0+0x00c]%asi	! Mem[000000001000140c] = 00000000
!	Mem[0000000010081400] = 7b000000, %l7 = ffffffffffffa8ff
	ldstuba	[%i2+%g0]0x88,%l7	! %l7 = 00000000000000ff
!	%l3 = 0000000000000000, Mem[0000000010041408] = 00000000
	stba	%l3,[%i1+%o4]0x80	! Mem[0000000010041408] = 00000000
!	%l3 = 0000000000000000, Mem[0000000030081408] = ffffffff
	stwa	%l3,[%i2+%o4]0x81	! Mem[0000000030081408] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = ff000000 ffffffff, %l0 = ff00ffff, %l1 = fffffdff
	ldda	[%i2+%o5]0x80,%l0	! %l0 = 00000000ff000000 00000000ffffffff

p0_label_189:
!	Mem[0000000030001408] = ff000000, %f17 = 6b000000
	lda	[%i0+%o4]0x81,%f17	! %f17 = ff000000
!	Mem[0000000010141400] = 00000000, %l6 = 00000000000000aa
	lduba	[%i5+%g0]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000010101408] = 7bfdc0ff, %l2 = 000000000000007b
	lduha	[%i4+%o4]0x88,%l2	! %l2 = 000000000000c0ff
!	Mem[0000000010001410] = 00000000, %l5 = 0000000000000000
	ldswa	[%i0+%o5]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000030101400] = ff00ffff, %l3 = 0000000000000000
	ldsba	[%i4+%g0]0x89,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010041424] = fea8b87d, %l5 = 0000000000000000
	lduba	[%i1+0x027]%asi,%l5	! %l5 = 000000000000007d
!	Mem[0000000010081408] = 5a000000 00000000, %l2 = 0000c0ff, %l3 = ffffffff
	ldda	[%i2+%o4]0x88,%l2	! %l2 = 0000000000000000 000000005a000000
!	Mem[00000000300c1408] = fffdffff, %l4 = 00000000000000ff
	ldsba	[%i3+%o4]0x81,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010041408] = 00000000, %l3 = 000000005a000000
	ldsha	[%i1+%o4]0x80,%l3	! %l3 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l4 = ffffffffffffffff, Mem[0000000010041408] = 00000000
	stha	%l4,[%i1+%o4]0x88	! Mem[0000000010041408] = 0000ffff

p0_label_190:
!	%l3 = 0000000000000000, Mem[0000000010101410] = 00000000
	stba	%l3,[%i4+%o5]0x80	! Mem[0000000010101410] = 00000000
!	%f24 = 000000ff, Mem[0000000010081428] = 00000000
	sta	%f24,[%i2+0x028]%asi	! Mem[0000000010081428] = 000000ff
!	%f30 = 7bfdc045 fffffdff, %l2 = 0000000000000000
!	Mem[00000000300c1428] = 6ddc71827487ff6b
	add	%i3,0x028,%g1
	stda	%f30,[%g1+%l2]ASI_PST8_SL ! Mem[00000000300c1428] = 6ddc71827487ff6b
!	Mem[0000000030141410] = 0000ff00, %l4 = ffffffffffffffff
	swapa	[%i5+%o5]0x89,%l4	! %l4 = 000000000000ff00
!	%f14 = 7bfdc045 c081b61e, Mem[0000000030101400] = ff00ffff 0000006b
	stda	%f14,[%i4+%g0]0x89	! Mem[0000000030101400] = 7bfdc045 c081b61e
!	Mem[0000000010181410] = ff000000, %l7 = 0000000000000000
	lduba	[%i6+%o5]0x80,%l7	! %l7 = 00000000000000ff
!	%l3 = 0000000000000000, Mem[0000000010081438] = c081b61effffffff
	stx	%l3,[%i2+0x038]		! Mem[0000000010081438] = 0000000000000000
!	%f2  = 00000000, Mem[0000000030081408] = 00000000
	sta	%f2 ,[%i2+%o4]0x81	! Mem[0000000030081408] = 00000000
!	%l1 = 00000000ffffffff, Mem[0000000030001410] = 00000000
	stha	%l1,[%i0+%o5]0x89	! Mem[0000000030001410] = 0000ffff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = 0000007d, %l7 = 00000000000000ff
	ldsha	[%i3+%o4]0x80,%l7	! %l7 = 0000000000000000

p0_label_191:
!	Mem[0000000010101408] = 7bfdc0ff, %l1 = 00000000ffffffff
	ldsba	[%i4+%o4]0x88,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000030101410] = 4aff73ff, %l1 = ffffffffffffffff
	lduba	[%i4+%o5]0x81,%l1	! %l1 = 000000000000004a
!	Mem[0000000030141408] = 7bfdc045, %l6 = 0000000000000000
	ldsha	[%i5+%o4]0x81,%l6	! %l6 = 0000000000007bfd
!	Mem[00000000100c1400] = 45c0fd7b, %l3 = 0000000000000000
	ldsb	[%i3+0x001],%l3		! %l3 = ffffffffffffffc0
!	Mem[0000000030081408] = 00000000, %l2 = 0000000000000000
	ldsba	[%i2+%o4]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000010081408] = 00000000, %l2 = 0000000000000000
	lduwa	[%i2+%o4]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000030001410] = ffff000000000000, %f22 = 00000000 ff0000ff
	ldda	[%i0+%o5]0x81,%f22	! %f22 = ffff0000 00000000
!	Mem[0000000030101408] = 45c0fdff, %l1 = 000000000000004a
	ldsba	[%i4+%o4]0x89,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000030081400] = ff73ff4a, %l6 = 0000000000007bfd
	lduha	[%i2+%g0]0x89,%l6	! %l6 = 000000000000ff4a
!	Starting 10 instruction Store Burst
!	%l6 = 0000ff4a, %l7 = 00000000, Mem[00000000100c1400] = 45c0fd7b 00000000
	std	%l6,[%i3+%g0]		! Mem[00000000100c1400] = 0000ff4a 00000000

p0_label_192:
!	%f16 = ffff00ff ff000000, %l2 = 0000000000000000
!	Mem[0000000030001428] = 8823679494672388
	add	%i0,0x028,%g1
	stda	%f16,[%g1+%l2]ASI_PST8_S ! Mem[0000000030001428] = 8823679494672388
!	%f1  = 00000000, Mem[0000000010141410] = fffffdff
	sta	%f1 ,[%i5+%o5]0x88	! Mem[0000000010141410] = 00000000
!	Mem[00000000211c0001] = 0d456217, %l5 = 000000000000007d
	ldstuba	[%o2+0x001]%asi,%l5	! %l5 = 00000045000000ff
!	Mem[0000000010141410] = 00000000, %l4 = 000000000000ff00
	swapa	[%i5+%o5]0x88,%l4	! %l4 = 0000000000000000
!	%l0 = ff000000, %l1 = ffffffff, Mem[00000000300c1410] = 0000a8ff ffffffff
	stda	%l0,[%i3+%o5]0x89	! Mem[00000000300c1410] = ff000000 ffffffff
!	%l7 = 0000000000000000, Mem[0000000030001400] = 00000000
	stwa	%l7,[%i0+%g0]0x89	! Mem[0000000030001400] = 00000000
!	%l3 = ffffffffffffffc0, Mem[0000000030101400] = c081b61e
	stba	%l3,[%i4+%g0]0x89	! Mem[0000000030101400] = c081b6c0
!	Mem[000000001018140e] = 00000000, %l5 = 0000000000000045
	ldstub	[%i6+0x00e],%l5		! %l5 = 00000000000000ff
!	%l6 = 000000000000ff4a, Mem[0000000021800140] = ffff4ce0, %asi = 80
	stba	%l6,[%o3+0x140]%asi	! Mem[0000000021800140] = 4aff4ce0
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = ff00007b00000000, %f24 = 000000ff 00000000
	ldda	[%i2+%g0]0x80,%f24	! %f24 = ff00007b 00000000

p0_label_193:
!	Mem[00000000201c0000] = ffff8a5f, %l6 = 000000000000ff4a
	lduh	[%o0+%g0],%l6		! %l6 = 000000000000ffff
!	Mem[00000000100c1408] = 7d000000, %l6 = 000000000000ffff
	ldsha	[%i3+%o4]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000010041418] = f0650335, %l3 = ffffffffffffffc0
	ldsw	[%i1+0x018],%l3		! %l3 = fffffffff0650335
!	Mem[0000000010001418] = ff00000000000000, %l3 = fffffffff0650335
	ldx	[%i0+0x018],%l3		! %l3 = ff00000000000000
!	Mem[0000000010101400] = 0000000000000000, %l0 = 00000000ff000000
	ldxa	[%i4+%g0]0x80,%l0	! %l0 = 0000000000000000
!	Mem[000000001014143c] = ff000000, %l0 = 0000000000000000
	ldsh	[%i5+0x03e],%l0		! %l0 = 0000000000000000
!	Mem[0000000030001400] = 00000000, %l1 = ffffffffffffffff
	lduba	[%i0+%g0]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000030041408] = 00000000, %l6 = 0000000000000000
	lduba	[%i1+%o4]0x81,%l6	! %l6 = 0000000000000000
!	Mem[00000000300c1410] = 000000ff, %l5 = 0000000000000000
	lduha	[%i3+%o5]0x81,%l5	! %l5 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f4  = 0000007b ffffffff, Mem[0000000010181400] = 00000000 00000000
	stda	%f4 ,[%i6+%g0]0x80	! Mem[0000000010181400] = 0000007b ffffffff

p0_label_194:
!	%l6 = 0000000000000000, Mem[0000000010141410] = 7bfdc0450000ff00
	stxa	%l6,[%i5+%o5]0x88	! Mem[0000000010141410] = 0000000000000000
!	%l6 = 0000000000000000, Mem[0000000010101410] = 00000000
	stha	%l6,[%i4+%o5]0x88	! Mem[0000000010101410] = 00000000
!	Mem[0000000030141410] = ffffffff, %l0 = 0000000000000000
	swapa	[%i5+%o5]0x81,%l0	! %l0 = 00000000ffffffff
!	Mem[0000000030041408] = 00000000, %l3 = ff00000000000000
	swapa	[%i1+%o4]0x89,%l3	! %l3 = 0000000000000000
!	%f4  = 0000007b ffffffff, Mem[0000000030181410] = fffd0000 fd000000
	stda	%f4 ,[%i6+%o5]0x81	! Mem[0000000030181410] = 0000007b ffffffff
!	%l1 = 0000000000000000, Mem[0000000030101400] = c0b681c0
	stha	%l1,[%i4+%g0]0x81	! Mem[0000000030101400] = 000081c0
!	%l7 = 0000000000000000, Mem[0000000030041400] = 45c0fd7bfea80000
	stxa	%l7,[%i1+%g0]0x81	! Mem[0000000030041400] = 0000000000000000
!	%f26 = 1400fd00 00000000, Mem[0000000030181408] = 00000000 00000000
	stda	%f26,[%i6+%o4]0x89	! Mem[0000000030181408] = 1400fd00 00000000
!	%l4 = 0000000000000000, Mem[0000000030101410] = 4aff73ffe873ee91
	stxa	%l4,[%i4+%o5]0x81	! Mem[0000000030101410] = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030101410] = 00000000, %l2 = 0000000000000000
	lduha	[%i4+%o5]0x81,%l2	! %l2 = 0000000000000000

p0_label_195:
!	Mem[000000001008142c] = 00000000, %l7 = 0000000000000000
	ldub	[%i2+0x02d],%l7		! %l7 = 0000000000000000
!	Mem[0000000030001410] = 0000ffff, %l1 = 0000000000000000
	ldswa	[%i0+%o5]0x89,%l1	! %l1 = 000000000000ffff
!	Mem[0000000030141410] = 00000000, %l4 = 0000000000000000
	ldsha	[%i5+%o5]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000010141410] = 00000000 00000000, %l0 = ffffffff, %l1 = 0000ffff
	ldda	[%i5+%o5]0x80,%l0	! %l0 = 0000000000000000 0000000000000000
!	Mem[0000000010181430] = 73e09b6500000000, %l4 = 0000000000000000
	ldx	[%i6+0x030],%l4		! %l4 = 73e09b6500000000
!	Mem[00000000211c0000] = 0dff6217, %l1 = 0000000000000000
	ldsba	[%o2+0x000]%asi,%l1	! %l1 = 000000000000000d
!	Mem[0000000010141410] = 00000000, %l7 = 0000000000000000
	ldsba	[%i5+%o5]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000021800040] = 5af7c5e9, %l5 = 0000000000000000
	lduh	[%o3+0x040],%l5		! %l5 = 0000000000005af7
!	Mem[0000000010141410] = 00000000, %l4 = 73e09b6500000000
	lduwa	[%i5+%o5]0x88,%l4	! %l4 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010001414] = 000000ff, %l5 = 00005af7, %l7 = 00000000
	add	%i0,0x14,%g1
	casa	[%g1]0x80,%l5,%l7	! %l7 = 00000000000000ff

p0_label_196:
!	%l4 = 0000000000000000, Mem[0000000030181410] = 7b000000
	stba	%l4,[%i6+%o5]0x89	! Mem[0000000030181410] = 7b000000
!	Mem[0000000010001400] = ff0000ff, %l7 = 00000000000000ff
	ldstuba	[%i0+%g0]0x88,%l7	! %l7 = 000000ff000000ff
!	%l0 = 00000000, %l1 = 0000000d, Mem[00000000100c1410] = ffff00ff fffdffff
	stda	%l0,[%i3+%o5]0x88	! Mem[00000000100c1410] = 00000000 0000000d
!	%l5 = 0000000000005af7, Mem[00000000300c1400] = ffb00000
	stwa	%l5,[%i3+%g0]0x81	! Mem[00000000300c1400] = 00005af7
!	Mem[00000000300c1410] = ff000000, %l0 = 0000000000000000
	swapa	[%i3+%o5]0x89,%l0	! %l0 = 00000000ff000000
!	Mem[0000000030081400] = ff73ff4a, %l7 = 00000000000000ff
	swapa	[%i2+%g0]0x89,%l7	! %l7 = 00000000ff73ff4a
!	%l6 = 0000000000000000, Mem[00000000100c1400] = 4aff0000
	stba	%l6,[%i3+%g0]0x88	! Mem[00000000100c1400] = 4aff0000
!	%l0 = 00000000ff000000, Mem[0000000030001410] = ffff0000
	stba	%l0,[%i0+%o5]0x81	! Mem[0000000030001410] = 00ff0000
!	Mem[0000000030081400] = ff000000, %l0 = 00000000ff000000
	swapa	[%i2+%g0]0x81,%l0	! %l0 = 00000000ff000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = fffffffd, %f23 = 00000000
	lda	[%i6+%g0]0x89,%f23	! %f23 = fffffffd

p0_label_197:
!	Mem[0000000010041404] = ffffffff, %l4 = 0000000000000000
	ldsh	[%i1+0x006],%l4		! %l4 = ffffffffffffffff
!	Mem[0000000030081400] = ff000000, %f17 = ff000000
	lda	[%i2+%g0]0x81,%f17	! %f17 = ff000000
!	Mem[0000000010081408] = 00000000, %l6 = 0000000000000000
	lduwa	[%i2+%o4]0x80,%l6	! %l6 = 0000000000000000
!	Mem[00000000300c1408] = fffdffff, %l1 = 000000000000000d
	ldsha	[%i3+%o4]0x81,%l1	! %l1 = fffffffffffffffd
!	Mem[0000000010041400] = 000000ff, %l2 = 0000000000000000
	ldsba	[%i1+%g0]0x88,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000010181400] = 7b000000, %f26 = 1400fd00
	lda	[%i6+%g0]0x88,%f26	! %f26 = 7b000000
!	Mem[0000000010181408] = 1400fd00, %l2 = ffffffffffffffff
	ldswa	[%i6+%o4]0x80,%l2	! %l2 = 000000001400fd00
!	Mem[000000001008143c] = 00000000, %f13 = e873ee91
	lda	[%i2+0x03c]%asi,%f13	! %f13 = 00000000
!	Mem[00000000100c1400] = 0000ff4a, %l1 = fffffffffffffffd
	ldsba	[%i3+%g0]0x80,%l1	! %l1 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l4 = ffffffff, %l5 = 00005af7, Mem[0000000030141400] = 0000fdff 000000fd
	stda	%l4,[%i5+%g0]0x81	! Mem[0000000030141400] = ffffffff 00005af7

p0_label_198:
!	%l1 = 0000000000000000, Mem[0000000010081420] = e30000ff, %asi = 80
	stha	%l1,[%i2+0x020]%asi	! Mem[0000000010081420] = 000000ff
!	%l3 = 0000000000000000, Mem[00000000100c1400] = 0000ff4a
	stha	%l3,[%i3+%g0]0x80	! Mem[00000000100c1400] = 0000ff4a
!	%l4 = ffffffffffffffff, Mem[0000000030001410] = 00ff000000000000
	stxa	%l4,[%i0+%o5]0x81	! Mem[0000000030001410] = ffffffffffffffff
!	%f1  = 00000000, Mem[0000000010001408] = 00000000
	sta	%f1 ,[%i0+%o4]0x88	! Mem[0000000010001408] = 00000000
!	%l3 = 0000000000000000, Mem[0000000010181408] = 1400fd00
	stwa	%l3,[%i6+%o4]0x80	! Mem[0000000010181408] = 00000000
!	Mem[00000000100c1425] = 14ef7179, %l6 = 0000000000000000
	ldstuba	[%i3+0x025]%asi,%l6	! %l6 = 000000ef000000ff
!	%l5 = 0000000000005af7, Mem[00000000100c1408] = 000000007d000000
	stxa	%l5,[%i3+%o4]0x88	! Mem[00000000100c1408] = 0000000000005af7
!	Mem[0000000010001400] = ff0000ff, %l4 = ffffffffffffffff
	ldstuba	[%i0+%g0]0x88,%l4	! %l4 = 000000ff000000ff
!	Mem[0000000030001408] = ff000000, %l4 = 00000000000000ff
	ldstuba	[%i0+%o4]0x81,%l4	! %l4 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[000000001008140c] = 0000005a, %l2 = 000000001400fd00
	ldsha	[%i2+0x00c]%asi,%l2	! %l2 = 0000000000000000

p0_label_199:
!	Mem[00000000300c1408] = fffdffff ff000000, %l4 = 000000ff, %l5 = 00005af7
	ldda	[%i3+%o4]0x81,%l4	! %l4 = 00000000fffdffff 00000000ff000000
!	Mem[0000000010181400] = 7b000000, %l3 = 0000000000000000
	ldsha	[%i6+%g0]0x88,%l3	! %l3 = 0000000000000000
!	Mem[000000001004142c] = 000000ff, %l2 = 0000000000000000
	ldswa	[%i1+0x02c]%asi,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010141410] = 0000000000000000, %l1 = 0000000000000000
	ldxa	[%i5+%o5]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000010001410] = 00000000, %l1 = 0000000000000000
	lduwa	[%i0+%o5]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000010141400] = 00000000, %l2 = 00000000000000ff
	lduba	[%i5+%g0]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000030081408] = ffffffff00000000, %l4 = 00000000fffdffff
	ldxa	[%i2+%o4]0x89,%l4	! %l4 = ffffffff00000000
!	Mem[0000000010001410] = 00000000, %l2 = 0000000000000000
	lduwa	[%i0+%o5]0x88,%l2	! %l2 = 0000000000000000
!	Mem[00000000201c0000] = ffff8a5f, %l6 = 00000000000000ef
	lduba	[%o0+0x000]%asi,%l6	! %l6 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l1 = 0000000000000000, Mem[0000000010181408] = 00000000
	stw	%l1,[%i6+%o4]		! Mem[0000000010181408] = 00000000

p0_label_200:
!	%l5 = 00000000ff000000, Mem[00000000211c0000] = 0dff6217
	sth	%l5,[%o2+%g0]		! Mem[00000000211c0000] = 00006217
!	Mem[0000000030001400] = 00000000, %l0 = 00000000ff000000
	ldstuba	[%i0+%g0]0x81,%l0	! %l0 = 00000000000000ff
!	%l6 = 00000000000000ff, Mem[0000000010081438] = 0000000000000000, %asi = 80
	stxa	%l6,[%i2+0x038]%asi	! Mem[0000000010081438] = 00000000000000ff
!	%f18 = fffdc045 00000000, %l0 = 0000000000000000
!	Mem[00000000100c1438] = 1eb681c004ff7388
	add	%i3,0x038,%g1
	stda	%f18,[%g1+%l0]ASI_PST32_PL ! Mem[00000000100c1438] = 1eb681c004ff7388
!	%l4 = ffffffff00000000, Mem[0000000030001400] = ff000000
	stwa	%l4,[%i0+%g0]0x81	! Mem[0000000030001400] = 00000000
!	Mem[00000000201c0001] = ffff8a5f, %l1 = 0000000000000000
	ldstub	[%o0+0x001],%l1		! %l1 = 000000ff000000ff
!	%l5 = 00000000ff000000, Mem[0000000010001408] = 00000000
	stba	%l5,[%i0+%o4]0x88	! Mem[0000000010001408] = 00000000
!	%f26 = 7b000000 00000000, Mem[0000000010101420] = 00ff007d 59000000
	std	%f26,[%i4+0x020]	! Mem[0000000010101420] = 7b000000 00000000
!	%l7 = 00000000ff73ff4a, Mem[0000000030181410] = ffffffff7b000000
	stxa	%l7,[%i6+%o5]0x89	! Mem[0000000030181410] = 00000000ff73ff4a
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1420] = 7db8a8fe14ff7179, %l7 = 00000000ff73ff4a
	ldx	[%i3+0x020],%l7		! %l7 = 7db8a8fe14ff7179

p0_label_201:
!	Mem[000000001000143c] = 000000fa, %l3 = 0000000000000000
	lduw	[%i0+0x03c],%l3		! %l3 = 00000000000000fa
!	Mem[0000000010101400] = 00000000, %l1 = 00000000000000ff
	lduba	[%i4+%g0]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000030181408] = 00000000, %l0 = 0000000000000000
	ldsha	[%i6+%o4]0x89,%l0	! %l0 = 0000000000000000
!	Mem[000000001018143c] = 00000000, %l5 = 00000000ff000000
	ldsha	[%i6+0x03e]%asi,%l5	! %l5 = 0000000000000000
!	Mem[00000000100c1410] = 00000000, %l7 = 7db8a8fe14ff7179
	lduwa	[%i3+%o5]0x88,%l7	! %l7 = 0000000000000000
!	Mem[00000000300c1408] = fffffdff, %l1 = 0000000000000000
	ldsba	[%i3+%o4]0x89,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000021800000] = 67ffe2e2, %l5 = 0000000000000000
	ldsha	[%o3+0x000]%asi,%l5	! %l5 = 00000000000067ff
!	Mem[0000000030181410] = ff73ff4a, %l0 = 0000000000000000
	lduba	[%i6+%o5]0x89,%l0	! %l0 = 000000000000004a
!	Mem[0000000030181410] = ff73ff4a, %l0 = 000000000000004a
	ldsba	[%i6+%o5]0x89,%l0	! %l0 = 000000000000004a
!	Starting 10 instruction Store Burst
!	%f4  = 0000007b ffffffff, Mem[0000000010141400] = 00000000 00000000
	stda	%f4 ,[%i5+%g0]0x80	! Mem[0000000010141400] = 0000007b ffffffff

p0_label_202:
!	%f18 = fffdc045 00000000, Mem[0000000010081408] = 00000000 0000005a
	std	%f18,[%i2+%o4]	! Mem[0000000010081408] = fffdc045 00000000
!	%l3 = 00000000000000fa, Mem[0000000010001410] = 00000000
	stba	%l3,[%i0+%o5]0x88	! Mem[0000000010001410] = 000000fa
!	%f20 = 000000ff 00000000, Mem[0000000030081408] = 00000000 ffffffff
	stda	%f20,[%i2+%o4]0x81	! Mem[0000000030081408] = 000000ff 00000000
!	%l4 = ffffffff00000000, Mem[0000000010041428] = 00000000000000ff, %asi = 80
	stxa	%l4,[%i1+0x028]%asi	! Mem[0000000010041428] = ffffffff00000000
!	%f28 = 91ee73e8 ff73ff4a, %l7 = 0000000000000000
!	Mem[0000000010041420] = 00000000fea8b87d
	add	%i1,0x020,%g1
	stda	%f28,[%g1+%l7]ASI_PST32_PL ! Mem[0000000010041420] = 00000000fea8b87d
!	Mem[00000000100c1400] = 4aff0000, %l2 = 0000000000000000
	ldstuba	[%i3+%g0]0x88,%l2	! %l2 = 00000000000000ff
!	%l5 = 00000000000067ff, Mem[0000000030041400] = 00000000
	stba	%l5,[%i1+%g0]0x81	! Mem[0000000030041400] = ff000000
!	Mem[0000000030141410] = 00000000, %l5 = 00000000000067ff
	ldstuba	[%i5+%o5]0x89,%l5	! %l5 = 00000000000000ff
!	%f2  = 00000000 0000005a, %l5 = 0000000000000000
!	Mem[0000000030101428] = 350365f0000000ff
	add	%i4,0x028,%g1
	stda	%f2,[%g1+%l5]ASI_PST8_S ! Mem[0000000030101428] = 350365f0000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = 00000000, %l4 = ffffffff00000000
	lduha	[%i4+%o5]0x88,%l4	! %l4 = 0000000000000000

p0_label_203:
!	Mem[0000000010141400] = 0000007bffffffff, %l5 = 0000000000000000
	ldxa	[%i5+0x000]%asi,%l5	! %l5 = 0000007bffffffff
!	Mem[0000000010141430] = 5cab5a60, %l4 = 0000000000000000
	lduba	[%i5+0x030]%asi,%l4	! %l4 = 000000000000005c
!	Mem[0000000030181408] = 00000000, %l3 = 00000000000000fa
	lduwa	[%i6+%o4]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000030181408] = 1400fd0000000000, %l0 = 000000000000004a
	ldxa	[%i6+%o4]0x89,%l0	! %l0 = 1400fd0000000000
!	Mem[0000000010141400] = 7b000000, %l4 = 000000000000005c
	ldsha	[%i5+%g0]0x88,%l4	! %l4 = 0000000000000000
!	Mem[00000000100c1410] = 00000000, %l1 = ffffffffffffffff
	ldsba	[%i3+%o5]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000030141400] = ffffffff, %l2 = 0000000000000000
	lduba	[%i5+%g0]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010141400] = 0000007b, %l1 = 0000000000000000
	ldsha	[%i5+%g0]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000010001430] = ffffffff, %l4 = 0000000000000000
	ldsw	[%i0+0x030],%l4		! %l4 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1408] = fffdffff, %l1 = 0000000000000000
	swapa	[%i3+%o4]0x81,%l1	! %l1 = 00000000fffdffff

p0_label_204:
!	%l4 = ffffffffffffffff, Mem[0000000021800180] = 00006a88, %asi = 80
	stha	%l4,[%o3+0x180]%asi	! Mem[0000000021800180] = ffff6a88
!	%f16 = ffff00ff ff000000, Mem[0000000010101410] = 00000000 00000000
	std	%f16,[%i4+%o5]	! Mem[0000000010101410] = ffff00ff ff000000
!	%f18 = fffdc045 00000000, Mem[0000000030181410] = 4aff73ff 00000000
	stda	%f18,[%i6+%o5]0x81	! Mem[0000000030181410] = fffdc045 00000000
!	%f6  = 0000007d 00000000, Mem[0000000010001410] = 000000fa ff000000
	stda	%f6 ,[%i0+%o5]0x88	! Mem[0000000010001410] = 0000007d 00000000
!	%l2 = 000000ff, %l3 = 00000000, Mem[0000000010181408] = 00000000 00ff0000
	stda	%l2,[%i6+%o4]0x88	! Mem[0000000010181408] = 000000ff 00000000
!	%l0 = 1400fd0000000000, Mem[0000000010141428] = 0bc503eaffffffff
	stx	%l0,[%i5+0x028]		! Mem[0000000010141428] = 1400fd0000000000
!	%l1 = 00000000fffdffff, Mem[0000000030101408] = fffdc045
	stha	%l1,[%i4+%o4]0x81	! Mem[0000000030101408] = ffffc045
!	Mem[0000000010081400] = ff00007b, %l3 = 0000000000000000
	swapa	[%i2+%g0]0x80,%l3	! %l3 = 00000000ff00007b
!	Mem[000000001008142e] = 00000000, %l6 = 00000000000000ff
	ldstub	[%i2+0x02e],%l6		! %l6 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = 7bfdc0ff, %l1 = 00000000fffdffff
	lduha	[%i4+%o4]0x88,%l1	! %l1 = 000000000000c0ff

p0_label_205:
!	Mem[0000000010001408] = 00000000, %l6 = 0000000000000000
	ldsba	[%i0+%o4]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000030101410] = 00000000, %l6 = 0000000000000000
	lduba	[%i4+%o5]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000010041410] = 45c0fdff, %l1 = 000000000000c0ff
	lduba	[%i1+%o5]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030101410] = 0000000000000000, %l2 = 00000000000000ff
	ldxa	[%i4+%o5]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000030101400] = 000081c045c0fd7b, %l1 = 00000000000000ff
	ldxa	[%i4+%g0]0x81,%l1	! %l1 = 000081c045c0fd7b
!	Mem[0000000010141418] = 00000000, %l4 = ffffffffffffffff
	lduba	[%i5+0x01a]%asi,%l4	! %l4 = 0000000000000000
!	Mem[000000001010142c] = ffffffff, %l0 = 1400fd0000000000
	lduwa	[%i4+0x02c]%asi,%l0	! %l0 = 00000000ffffffff
!	Mem[0000000010101438] = 59b9455e, %l1 = 000081c045c0fd7b
	lduw	[%i4+0x038],%l1		! %l1 = 0000000059b9455e
!	Mem[0000000030181408] = 00000000, %l5 = 0000007bffffffff
	lduba	[%i6+%o4]0x89,%l5	! %l5 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l5 = 0000000000000000, Mem[0000000030141410] = ff000000
	stha	%l5,[%i5+%o5]0x81	! Mem[0000000030141410] = 00000000

p0_label_206:
!	Mem[0000000010141438] = 7de90000, %l1 = 0000000059b9455e
	ldstuba	[%i5+0x038]%asi,%l1	! %l1 = 0000007d000000ff
!	%l3 = 00000000ff00007b, Mem[0000000010141418] = 00000000, %asi = 80
	stwa	%l3,[%i5+0x018]%asi	! Mem[0000000010141418] = ff00007b
!	%l3 = 00000000ff00007b, Mem[0000000030041408] = ff00000000000000
	stxa	%l3,[%i1+%o4]0x89	! Mem[0000000030041408] = 00000000ff00007b
!	Mem[0000000030001410] = ffffffff, %l5 = 0000000000000000
	ldstuba	[%i0+%o5]0x89,%l5	! %l5 = 000000ff000000ff
!	%f4  = 0000007b ffffffff, Mem[0000000030081408] = ff000000 00000000
	stda	%f4 ,[%i2+%o4]0x89	! Mem[0000000030081408] = 0000007b ffffffff
!	Mem[0000000030141400] = ffffffff, %l7 = 0000000000000000
	ldstuba	[%i5+%g0]0x81,%l7	! %l7 = 000000ff000000ff
!	%l2 = 0000000000000000, Mem[000000001000140d] = 00000000, %asi = 80
	stba	%l2,[%i0+0x00d]%asi	! Mem[000000001000140c] = 00000000
!	Mem[0000000010041434] = 5dd135f3, %l4 = 00000000, %l0 = ffffffff
	add	%i1,0x34,%g1
	casa	[%g1]0x80,%l4,%l0	! %l0 = 000000005dd135f3
!	%f28 = 91ee73e8, Mem[0000000030081408] = ffffffff
	sta	%f28,[%i2+%o4]0x89	! Mem[0000000030081408] = 91ee73e8
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = ffc0fd7bffffffff, %l7 = 00000000000000ff
	ldxa	[%i4+%o4]0x80,%l7	! %l7 = ffc0fd7bffffffff

p0_label_207:
!	Mem[0000000030101410] = 00000000, %l4 = 0000000000000000
	ldswa	[%i4+%o5]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000010041418] = f065033577749a38, %f28 = 91ee73e8 ff73ff4a
	ldda	[%i1+0x018]%asi,%f28	! %f28 = f0650335 77749a38
!	Mem[00000000100c1410] = 00000000, %l6 = 0000000000000000
	ldsba	[%i3+%o5]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000030181410] = fffdc045, %f29 = 77749a38
	lda	[%i6+%o5]0x81,%f29	! %f29 = fffdc045
!	Mem[0000000020800040] = ff358327, %l5 = 00000000000000ff
	ldub	[%o1+0x041],%l5		! %l5 = 0000000000000035
!	Mem[0000000010141408] = 7b000000, %l5 = 0000000000000035
	ldsba	[%i5+%o4]0x80,%l5	! %l5 = 000000000000007b
!	Mem[0000000030041410] = 00000000, %l3 = 00000000ff00007b
	lduba	[%i1+%o5]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000010141410] = 00000000, %l6 = 0000000000000000
	ldsha	[%i5+%o5]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000010081414] = ffffffff, %l1 = 000000000000007d
	ldsha	[%i2+0x016]%asi,%l1	! %l1 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%f30 = 7bfdc045 fffffdff, Mem[0000000030001400] = 00000000 00000000
	stda	%f30,[%i0+%g0]0x89	! Mem[0000000030001400] = 7bfdc045 fffffdff

p0_label_208:
!	%l0 = 5dd135f3, %l1 = ffffffff, Mem[0000000010041400] = ff000000 ffffffff
	stda	%l0,[%i1+%g0]0x80	! Mem[0000000010041400] = 5dd135f3 ffffffff
!	%l2 = 0000000000000000, Mem[000000001010140c] = ffffffff
	sth	%l2,[%i4+0x00c]		! Mem[000000001010140c] = 0000ffff
!	Mem[00000000100c1400] = ff00ff4a, %l7 = ffc0fd7bffffffff
	ldstuba	[%i3+%g0]0x80,%l7	! %l7 = 000000ff000000ff
!	Code Fragment 4
p0_fragment_4:
!	%l0 = 000000005dd135f3
	setx	0x0b37fa3f86ea0354,%g7,%l0 ! %l0 = 0b37fa3f86ea0354
!	%l1 = ffffffffffffffff
	setx	0x26c856dfbd88bea5,%g7,%l1 ! %l1 = 26c856dfbd88bea5
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 0b37fa3f86ea0354
	setx	0x77a37727f0212e2f,%g7,%l0 ! %l0 = 77a37727f0212e2f
!	%l1 = 26c856dfbd88bea5
	setx	0x52d033287e68ecc1,%g7,%l1 ! %l1 = 52d033287e68ecc1
!	%f28 = f0650335 fffdc045, %f6  = 0000007d
	fdtoi	%f28,%f6 		! %f6  = 80000000
!	%f10 = 00000000 00000000, %f29 = fffdc045
	fdtoi	%f10,%f29		! %f29 = 00000000
!	%l0 = 77a37727f0212e2f, Mem[0000000030081400] = ff000000
	stha	%l0,[%i2+%g0]0x81	! Mem[0000000030081400] = 2e2f0000
!	%l4 = 0000000000000000, Mem[00000000300c1410] = 00000000ffffffff
	stxa	%l4,[%i3+%o5]0x81	! Mem[00000000300c1410] = 0000000000000000
!	%l5 = 000000000000007b, Mem[00000000300c1410] = 0000000000000000
	stxa	%l5,[%i3+%o5]0x89	! Mem[00000000300c1410] = 000000000000007b
!	Starting 10 instruction Load Burst
!	Mem[0000000010001420] = ffffffff00007179, %l6 = 0000000000000000
	ldxa	[%i0+0x020]%asi,%l6	! %l6 = ffffffff00007179

p0_label_209:
!	Mem[0000000010141400] = 0000007b, %l2 = 0000000000000000
	ldswa	[%i5+%g0]0x80,%l2	! %l2 = 000000000000007b
!	Mem[0000000030001410] = ffffffff, %l7 = 00000000000000ff
	ldsba	[%i0+%o5]0x81,%l7	! %l7 = ffffffffffffffff
!	Mem[00000000218001c0] = 4cbe7723, %l7 = ffffffffffffffff
	lduh	[%o3+0x1c0],%l7		! %l7 = 0000000000004cbe
!	Mem[0000000030181400] = 00000000fffffffd, %f30 = 7bfdc045 fffffdff
	ldda	[%i6+%g0]0x89,%f30	! %f30 = 00000000 fffffffd
!	Mem[0000000030141400] = f75a0000 ffffffff, %l6 = 00007179, %l7 = 00004cbe
	ldda	[%i5+%g0]0x89,%l6	! %l6 = 00000000ffffffff 00000000f75a0000
!	Mem[0000000030141408] = 7bfdc045, %l2 = 000000000000007b
	lduba	[%i5+%o4]0x81,%l2	! %l2 = 000000000000007b
!	Mem[0000000010101408] = 7bfdc0ff, %l0 = 77a37727f0212e2f
	lduba	[%i4+%o4]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010101428] = ffffffff ffffffff, %l2 = 0000007b, %l3 = 00000000
	ldd	[%i4+0x028],%l2		! %l2 = 00000000ffffffff 00000000ffffffff
!	Mem[0000000030181410] = 45c0fdff, %l4 = 0000000000000000
	ldsba	[%i6+%o5]0x89,%l4	! %l4 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l4 = ffffffffffffffff, Mem[0000000010141410] = 0000000000000000
	stxa	%l4,[%i5+%o5]0x88	! Mem[0000000010141410] = ffffffffffffffff

p0_label_210:
!	Mem[0000000010141408] = 7b000000, %l7 = 00000000f75a0000
	swapa	[%i5+%o4]0x80,%l7	! %l7 = 000000007b000000
!	%l7 = 000000007b000000, Mem[0000000030181400] = fdffffff
	stwa	%l7,[%i6+%g0]0x81	! Mem[0000000030181400] = 7b000000
!	Mem[00000000300c1400] = f75a0000, %l4 = ffffffffffffffff
	ldstuba	[%i3+%g0]0x89,%l4	! %l4 = 00000000000000ff
!	%l5 = 000000000000007b, Mem[00000000300c1408] = 00000000
	stba	%l5,[%i3+%o4]0x81	! Mem[00000000300c1408] = 7b000000
!	Mem[0000000030041400] = 000000ff, %l5 = 000000000000007b
	ldstuba	[%i1+%g0]0x89,%l5	! %l5 = 000000ff000000ff
!	Mem[0000000010141408] = 00005af7, %l6 = 00000000ffffffff
	swapa	[%i5+%o4]0x88,%l6	! %l6 = 0000000000005af7
!	%l7 = 000000007b000000, Mem[0000000010141404] = ffffffff
	stw	%l7,[%i5+0x004]		! Mem[0000000010141404] = 7b000000
!	Mem[0000000030141400] = ffffffff, %l2 = 00000000ffffffff
	ldstuba	[%i5+%g0]0x81,%l2	! %l2 = 000000ff000000ff
!	%f30 = 00000000 fffffffd, %l3 = 00000000ffffffff
!	Mem[0000000030001410] = ffffffffffffffff
	add	%i0,0x010,%g1
	stda	%f30,[%g1+%l3]ASI_PST16_S ! Mem[0000000030001410] = 00000000fffffffd
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = ff005af7ffffffff, %l2 = 00000000000000ff
	ldxa	[%i3+%g0]0x81,%l2	! %l2 = ff005af7ffffffff

p0_label_211:
!	Mem[0000000020800000] = ff005afb, %l5 = 00000000000000ff
	ldsh	[%o1+%g0],%l5		! %l5 = ffffffffffffff00
!	Mem[0000000010041410] = 45c0fdff, %l5 = ffffffffffffff00
	lduwa	[%i1+%o5]0x88,%l5	! %l5 = 0000000045c0fdff
!	Mem[0000000010101400] = 00000000, %l3 = 00000000ffffffff
	lduba	[%i4+%g0]0x80,%l3	! %l3 = 0000000000000000
!	Mem[00000000100c1400] = 4aff00ff, %l4 = 0000000000000000
	lduba	[%i3+%g0]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010001404] = 00000000, %l3 = 0000000000000000
	ldub	[%i0+0x005],%l3		! %l3 = 0000000000000000
!	Mem[0000000010081400] = 00000000, %l1 = 52d033287e68ecc1
	ldsha	[%i2+%g0]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000030141408] = 7bfdc045, %l3 = 0000000000000000
	ldsba	[%i5+%o4]0x81,%l3	! %l3 = 000000000000007b
!	Mem[0000000010001410] = 00000000, %l2 = ff005af7ffffffff
	ldsha	[%i0+%o5]0x88,%l2	! %l2 = 0000000000000000
!	%l4 = 00000000000000ff, Mem[00000000100c1410] = 00000000
	stba	%l4,[%i3+%o5]0x88	! Mem[00000000100c1410] = 000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000010141410] = ffffffff, %l0 = 00000000000000ff
	swapa	[%i5+%o5]0x88,%l0	! %l0 = 00000000ffffffff

p0_label_212:
!	%l4 = 000000ff, %l5 = 45c0fdff, Mem[0000000030001400] = fffdffff 45c0fd7b
	stda	%l4,[%i0+%g0]0x81	! Mem[0000000030001400] = 000000ff 45c0fdff
!	%f30 = 00000000 fffffffd, %l6 = 0000000000005af7
!	Mem[0000000010081400] = 0000000000000000
	stda	%f30,[%i2+%l6]ASI_PST16_P ! Mem[0000000010081400] = 00000000fffffffd
!	%l0 = 00000000ffffffff, Mem[0000000030141408] = 45c0fd7b
	stha	%l0,[%i5+%o4]0x89	! Mem[0000000030141408] = 45c0ffff
!	%f14 = 7bfdc045 c081b61e, Mem[0000000030001410] = 00000000 fdffffff
	stda	%f14,[%i0+%o5]0x89	! Mem[0000000030001410] = 7bfdc045 c081b61e
!	%f12 = 4aff73ff 00000000, %l1 = 0000000000000000
!	Mem[0000000010181430] = 73e09b6500000000
	add	%i6,0x030,%g1
	stda	%f12,[%g1+%l1]ASI_PST32_P ! Mem[0000000010181430] = 73e09b6500000000
!	Mem[0000000010041408] = ffff0000, %l3 = 000000000000007b
	swapa	[%i1+%o4]0x80,%l3	! %l3 = 00000000ffff0000
!	%l4 = 00000000000000ff, Mem[0000000030181408] = 00000000
	stwa	%l4,[%i6+%o4]0x89	! Mem[0000000030181408] = 000000ff
!	%f10 = 00000000 00000000, %l6 = 0000000000005af7
!	Mem[0000000030141410] = 00000000fffffdff
	add	%i5,0x010,%g1
	stda	%f10,[%g1+%l6]ASI_PST8_S ! Mem[0000000030141410] = 00000000ff000000
!	%f8  = e30000ff 00000000, Mem[0000000030041408] = 7b0000ff 00000000
	stda	%f8 ,[%i1+%o4]0x81	! Mem[0000000030041408] = e30000ff 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = fffdc045, %l2 = 0000000000000000
	ldswa	[%i2+%o4]0x80,%l2	! %l2 = fffffffffffdc045

p0_label_213:
!	Mem[0000000030101410] = 00000000, %f31 = fffffffd
	lda	[%i4+%o5]0x89,%f31	! %f31 = 00000000
!	Mem[0000000010001430] = ffffffff ffffffff, %l2 = fffdc045, %l3 = ffff0000
	ldda	[%i0+0x030]%asi,%l2	! %l2 = 00000000ffffffff 00000000ffffffff
!	Mem[0000000010001428] = 00000000, %l6 = 0000000000005af7
	lduw	[%i0+0x028],%l6		! %l6 = 0000000000000000
!	Mem[0000000030101410] = 00000000, %l1 = 0000000000000000
	lduwa	[%i4+%o5]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000010101400] = 00000000, %l2 = 00000000ffffffff
	lduwa	[%i4+%g0]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000030041410] = 00000000, %l3 = 00000000ffffffff
	lduba	[%i1+%o5]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000010141438] = ffe90000, %l3 = 0000000000000000
	lduha	[%i5+0x03a]%asi,%l3	! %l3 = 0000000000000000
!	Mem[00000000218000c0] = 0000e748, %l3 = 0000000000000000
	lduh	[%o3+0x0c0],%l3		! %l3 = 0000000000000000
!	Mem[0000000010041400] = 5dd135f3 ffffffff, %l2 = 00000000, %l3 = 00000000
	ldda	[%i1+%g0]0x80,%l2	! %l2 = 000000005dd135f3 00000000ffffffff
!	Starting 10 instruction Store Burst
!	Mem[0000000030181410] = 45c0fdff, %l5 = 0000000045c0fdff
	swapa	[%i6+%o5]0x89,%l5	! %l5 = 0000000045c0fdff

p0_label_214:
!	Mem[0000000010001408] = 00000000, %l3 = ffffffff, %l0 = ffffffff
	add	%i0,0x08,%g1
	casa	[%g1]0x80,%l3,%l0	! %l0 = 0000000000000000
!	Mem[00000000100c1401] = ff00ff4a, %l3 = 00000000ffffffff
	ldstuba	[%i3+0x001]%asi,%l3	! %l3 = 00000000000000ff
!	%l0 = 0000000000000000, Mem[00000000100c1410] = 0000000d000000ff
	stxa	%l0,[%i3+%o5]0x88	! Mem[00000000100c1410] = 0000000000000000
!	%l2 = 5dd135f3, %l3 = 00000000, Mem[0000000030041410] = 00000000 000000bd
	stda	%l2,[%i1+%o5]0x89	! Mem[0000000030041410] = 5dd135f3 00000000
!	%l1 = 0000000000000000, Mem[0000000030181410] = fffdc045
	stwa	%l1,[%i6+%o5]0x81	! Mem[0000000030181410] = 00000000
!	%f18 = fffdc045 00000000, %l3 = 0000000000000000
!	Mem[0000000030181418] = 44429bd538b6002a
	add	%i6,0x018,%g1
	stda	%f18,[%g1+%l3]ASI_PST16_SL ! Mem[0000000030181418] = 44429bd538b6002a
!	Mem[0000000010081408] = fffdc04500000000, %l7 = 000000007b000000
	ldxa	[%i2+%o4]0x80,%l7	! %l7 = fffdc04500000000
!	%f16 = ffff00ff ff000000 fffdc045 00000000
!	%f20 = 000000ff 00000000 ffff0000 fffffffd
!	%f24 = ff00007b 00000000 7b000000 00000000
!	%f28 = f0650335 00000000 00000000 00000000
	stda	%f16,[%i0]ASI_BLK_AIUS	! Block Store to 0000000030001400
!	Mem[0000000010101410] = ffff00ff, %l6 = 0000000000000000
	ldstuba	[%i4+%o5]0x80,%l6	! %l6 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = ffffff4a, %l5 = 0000000045c0fdff
	ldsba	[%i3+0x002]%asi,%l5	! %l5 = ffffffffffffffff

p0_label_215:
!	Mem[0000000010101404] = 00000000, %l7 = fffdc04500000000
	lduba	[%i4+0x006]%asi,%l7	! %l7 = 0000000000000000
!	Mem[0000000010081400] = 00000000 fffffffd, %l2 = 5dd135f3, %l3 = 00000000
	ldda	[%i2+%g0]0x80,%l2	! %l2 = 0000000000000000 00000000fffffffd
!	Mem[0000000010141438] = ffe90000, %f15 = c081b61e
	ld	[%i5+0x038],%f15	! %f15 = ffe90000
	membar	#Sync			! Added by membar checker (35)
!	Mem[0000000010001408] = 00000000, %l3 = 00000000fffffffd
	lduwa	[%i0+%o4]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000010141410] = ff000000 ffffffff, %l0 = 00000000, %l1 = 00000000
	ldda	[%i5+%o5]0x80,%l0	! %l0 = 00000000ff000000 00000000ffffffff
!	Mem[0000000010181428] = 73e000ff00000000, %l6 = 00000000000000ff
	ldx	[%i6+0x028],%l6		! %l6 = 73e000ff00000000
!	Mem[0000000010181408] = ff000000 00000000, %l4 = 000000ff, %l5 = ffffffff
	ldda	[%i6+%o4]0x80,%l4	! %l4 = 00000000ff000000 0000000000000000
!	Mem[00000000100c1408] = 00005af7, %l4 = 00000000ff000000
	lduba	[%i3+%o4]0x88,%l4	! %l4 = 00000000000000f7
!	Mem[0000000010141410] = ffffffff000000ff, %f24 = ff00007b 00000000
	ldda	[%i5+%o5]0x88,%f24	! %f24 = ffffffff 000000ff
!	Starting 10 instruction Store Burst
!	%l6 = 73e000ff00000000, Mem[0000000010041438] = 74c546d0, %asi = 80
	stwa	%l6,[%i1+0x038]%asi	! Mem[0000000010041438] = 00000000

p0_label_216:
!	%l7 = 0000000000000000, Mem[0000000010101408] = 7bfdc0ff
	stba	%l7,[%i4+%o4]0x88	! Mem[0000000010101408] = 7bfdc000
!	%l0 = ff000000, %l1 = ffffffff, Mem[0000000010001400] = ff0000ff 00000000
	stda	%l0,[%i0+%g0]0x88	! Mem[0000000010001400] = ff000000 ffffffff
!	%f22 = ffff0000 fffffffd, Mem[0000000030001400] = ff00ffff 000000ff
	stda	%f22,[%i0+%g0]0x89	! Mem[0000000030001400] = ffff0000 fffffffd
!	Mem[0000000030141400] = ffffffff, %l7 = 0000000000000000
	swapa	[%i5+%g0]0x89,%l7	! %l7 = 00000000ffffffff
!	%l4 = 00000000000000f7, Mem[0000000021800180] = ffff6a88
	stb	%l4,[%o3+0x180]		! Mem[0000000021800180] = f7ff6a88
!	%l6 = 73e000ff00000000, Mem[0000000010181430] = 73e09b6500000000
	stx	%l6,[%i6+0x030]		! Mem[0000000010181430] = 73e000ff00000000
!	Mem[0000000010101415] = ff000000, %l2 = 0000000000000000
	ldstuba	[%i4+0x015]%asi,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030181408] = 000000ff, %l2 = 0000000000000000
	swapa	[%i6+%o4]0x89,%l2	! %l2 = 00000000000000ff
!	%l5 = 0000000000000000, Mem[0000000030041408] = e30000ff
	stha	%l5,[%i1+%o4]0x81	! Mem[0000000030041408] = 000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = 00000000, %l4 = 00000000000000f7
	ldsba	[%i3+%o5]0x80,%l4	! %l4 = 0000000000000000

p0_label_217:
!	Mem[0000000030081410] = 000000ff, %l5 = 0000000000000000
	ldswa	[%i2+%o5]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[00000000300c1408] = 0000007b, %f28 = f0650335
	lda	[%i3+%o4]0x89,%f28	! %f28 = 0000007b
!	Mem[0000000030001400] = fffffffd, %l1 = 00000000ffffffff
	ldsba	[%i0+%g0]0x89,%l1	! %l1 = fffffffffffffffd
!	Mem[0000000010041428] = ffffffff 00000000, %l6 = 00000000, %l7 = ffffffff
	ldd	[%i1+0x028],%l6		! %l6 = 00000000ffffffff 0000000000000000
!	Mem[0000000010141410] = ff000000ffffffff, %f6  = 80000000 00000000
	ldda	[%i5+0x010]%asi,%f6 	! %f6  = ff000000 ffffffff
!	Mem[0000000010141400] = 0000007b 7b000000, %l2 = 000000ff, %l3 = 00000000
	ldda	[%i5+%g0]0x80,%l2	! %l2 = 000000000000007b 000000007b000000
!	Mem[0000000010001418] = ff000000 00000000, %l4 = 00000000, %l5 = 000000ff
	ldda	[%i0+0x018]%asi,%l4	! %l4 = 00000000ff000000 0000000000000000
!	Mem[0000000010041410] = fffdc045, %l6 = 00000000ffffffff
	ldsb	[%i1+%o5],%l6		! %l6 = ffffffffffffffff
!	Mem[0000000030141400] = 00000000, %l1 = fffffffffffffffd
	ldsba	[%i5+%g0]0x81,%l1	! %l1 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010101408] = 00c0fd7b, %l5 = 0000000000000000
	swapa	[%i4+%o4]0x80,%l5	! %l5 = 0000000000c0fd7b

p0_label_218:
!	Mem[0000000010001410] = 00000000, %l5 = 0000000000c0fd7b
	swapa	[%i0+%o5]0x80,%l5	! %l5 = 0000000000000000
!	%l0 = ff000000, %l1 = 00000000, Mem[0000000030041410] = f335d15d 00000000
	stda	%l0,[%i1+%o5]0x81	! Mem[0000000030041410] = ff000000 00000000
!	Code Fragment 4
p0_fragment_5:
!	%l0 = 00000000ff000000
	setx	0xfe76afa7ce315dee,%g7,%l0 ! %l0 = fe76afa7ce315dee
!	%l1 = 0000000000000000
	setx	0x143a5a5878f41125,%g7,%l1 ! %l1 = 143a5a5878f41125
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = fe76afa7ce315dee
	setx	0x9fdf22a7a591fc84,%g7,%l0 ! %l0 = 9fdf22a7a591fc84
!	%l1 = 143a5a5878f41125
	setx	0x508faf979da4b2a8,%g7,%l1 ! %l1 = 508faf979da4b2a8
!	%f14 = 7bfdc045 ffe90000, %l6 = ffffffffffffffff
!	Mem[0000000030141400] = 0000000000005af7
	stda	%f14,[%i5+%l6]ASI_PST32_SL ! Mem[0000000030141400] = 0000e9ff45c0fd7b
!	%f9  = 00000000, Mem[0000000010101408] = 00000000
	sta	%f9 ,[%i4+%o4]0x88	! Mem[0000000010101408] = 00000000
!	%f12 = 4aff73ff, Mem[0000000010041410] = 45c0fdff
	sta	%f12,[%i1+%o5]0x88	! Mem[0000000010041410] = 4aff73ff
!	%l7 = 0000000000000000, Mem[0000000010041400] = 5dd135f3ffffffff
	stxa	%l7,[%i1+%g0]0x80	! Mem[0000000010041400] = 0000000000000000
!	%l2 = 0000007b, %l3 = 7b000000, Mem[0000000030081400] = 00002f2e 91ee73e8
	stda	%l2,[%i2+%g0]0x89	! Mem[0000000030081400] = 0000007b 7b000000
!	%l2 = 0000007b, %l3 = 7b000000, Mem[0000000030181410] = 00000000 00000000
	stda	%l2,[%i6+%o5]0x81	! Mem[0000000030181410] = 0000007b 7b000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = c0810000, %l2 = 000000000000007b
	ldsha	[%i4+%g0]0x89,%l2	! %l2 = 0000000000000000

p0_label_219:
!	Mem[0000000030101400] = 7bfdc045 c0810000, %l0 = a591fc84, %l1 = 9da4b2a8
	ldda	[%i4+%g0]0x89,%l0	! %l0 = 00000000c0810000 000000007bfdc045
!	Mem[00000000300c1400] = ff005af7, %l2 = 0000000000000000
	lduba	[%i3+%g0]0x81,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030181410] = 7b000000, %l2 = 00000000000000ff
	lduha	[%i6+%o5]0x89,%l2	! %l2 = 0000000000000000
!	Mem[00000000100c1408] = f75a0000, %l2 = 0000000000000000
	ldsha	[%i3+%o4]0x80,%l2	! %l2 = fffffffffffff75a
!	Mem[0000000010101400] = 00000000, %l4 = 00000000ff000000
	swapa	[%i4+%g0]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000030181400] = 7b000000, %l7 = 0000000000000000
	ldsha	[%i6+%g0]0x81,%l7	! %l7 = 0000000000007b00
!	Mem[00000000211c0000] = 00006217, %l1 = 000000007bfdc045
	ldsb	[%o2+%g0],%l1		! %l1 = 0000000000000000
!	Mem[0000000030041400] = 000000ff, %f4  = 0000007b
	lda	[%i1+%g0]0x89,%f4 	! %f4 = 000000ff
!	Mem[0000000021800100] = ffff37bf, %l4 = 0000000000000000
	ldsb	[%o3+0x100],%l4		! %l4 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l2 = fffffffffffff75a, Mem[0000000010001400] = 000000ff
	stwa	%l2,[%i0+%g0]0x80	! Mem[0000000010001400] = fffff75a

p0_label_220:
!	%l0 = 00000000c0810000, Mem[0000000030041408] = 000000ff
	stha	%l0,[%i1+%o4]0x81	! Mem[0000000030041408] = 000000ff
!	Mem[00000000100c1410] = 00000000, %l3 = 000000007b000000
	swapa	[%i3+%o5]0x80,%l3	! %l3 = 0000000000000000
!	%l7 = 0000000000007b00, Mem[0000000030001410] = 000000ff
	stwa	%l7,[%i0+%o5]0x81	! Mem[0000000030001410] = 00007b00
!	Mem[0000000010101410] = ffff00ff, %l6 = ffffffffffffffff
	ldstuba	[%i4+%o5]0x80,%l6	! %l6 = 000000ff000000ff
!	%l2 = fffffffffffff75a, Mem[0000000010081420] = 000000ff, %asi = 80
	stwa	%l2,[%i2+0x020]%asi	! Mem[0000000010081420] = fffff75a
!	%f16 = ffff00ff ff000000, %l6 = 00000000000000ff
!	Mem[0000000030181418] = 44429bd538b6002a
	add	%i6,0x018,%g1
	stda	%f16,[%g1+%l6]ASI_PST8_S ! Mem[0000000030181418] = ffff00ffff000000
!	Mem[0000000010101410] = ff00ffff, %l5 = 0000000000000000
	ldstuba	[%i4+%o5]0x88,%l5	! %l5 = 000000ff000000ff
!	%l7 = 0000000000007b00, Mem[0000000021800080] = 65a8d810, %asi = 80
	stha	%l7,[%o3+0x080]%asi	! Mem[0000000021800080] = 7b00d810
!	%f18 = fffdc045 00000000, Mem[0000000030181410] = 7b000000 0000007b
	stda	%f18,[%i6+%o5]0x89	! Mem[0000000030181410] = fffdc045 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = ffffc045, %l3 = 0000000000000000
	ldswa	[%i4+%o4]0x81,%l3	! %l3 = ffffffffffffc045

p0_label_221:
!	Mem[0000000030001408] = 00000000 45c0fdff, %l4 = ffffffff, %l5 = 000000ff
	ldda	[%i0+%o4]0x89,%l4	! %l4 = 0000000045c0fdff 0000000000000000
!	Mem[0000000030081400] = 7b0000000000007b, %l4 = 0000000045c0fdff
	ldxa	[%i2+%g0]0x81,%l4	! %l4 = 7b0000000000007b
!	Mem[0000000010081408] = 45c0fdff, %l1 = 0000000000000000
	ldsha	[%i2+%o4]0x88,%l1	! %l1 = fffffffffffffdff
!	Mem[0000000010141400] = 0000007b, %l6 = 00000000000000ff
	ldsha	[%i5+%g0]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000010141410] = ff000000, %l2 = fffffffffffff75a
	ldsha	[%i5+%o5]0x80,%l2	! %l2 = ffffffffffffff00
!	Mem[0000000010101410] = ffff00ff, %l6 = 0000000000000000
	ldsba	[%i4+%o5]0x80,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010001400] = fffff75a, %f12 = 4aff73ff
	ld	[%i0+%g0],%f12	! %f12 = fffff75a
!	Mem[0000000030101400] = c0810000, %f21 = 00000000
	lda	[%i4+%g0]0x89,%f21	! %f21 = c0810000
!	Mem[000000001018142c] = 00000000, %l3 = ffffffffffffc045
	lduh	[%i6+0x02c],%l3		! %l3 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1410] = 7b000000, %l1 = fffffffffffffdff
	ldstuba	[%i3+%o5]0x81,%l1	! %l1 = 0000007b000000ff

p0_label_222:
!	Mem[00000000201c0000] = ffff8a5f, %l4 = 7b0000000000007b
	ldstub	[%o0+%g0],%l4		! %l4 = 000000ff000000ff
!	Mem[0000000010041400] = 00000000, %l3 = 0000000000000000
	swapa	[%i1+%g0]0x80,%l3	! %l3 = 0000000000000000
!	Mem[000000001010142a] = ffffffff, %l3 = 0000000000000000
	ldstuba	[%i4+0x02a]%asi,%l3	! %l3 = 000000ff000000ff
!	Mem[00000000100c141a] = e30000ff, %l7 = 0000000000007b00
	ldstub	[%i3+0x01a],%l7		! %l7 = 00000000000000ff
!	Mem[0000000010001408] = 00000000, %l3 = 00000000000000ff
	ldstuba	[%i0+%o4]0x80,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010101408] = 00000000, %l0 = 00000000c0810000
	ldstuba	[%i4+%o4]0x80,%l0	! %l0 = 00000000000000ff
!	%f30 = 00000000 00000000, %l7 = 0000000000000000
!	Mem[00000000100c1410] = 7b00000000000000
	add	%i3,0x010,%g1
	stda	%f30,[%g1+%l7]ASI_PST8_PL ! Mem[00000000100c1410] = 7b00000000000000
!	%f0  = fffdffff 00000000, %l5 = 0000000000000000
!	Mem[0000000030001430] = f065033500000000
	add	%i0,0x030,%g1
	stda	%f0,[%g1+%l5]ASI_PST8_SL ! Mem[0000000030001430] = f065033500000000
!	Mem[0000000010041427] = fea8b87d, %l3 = 0000000000000000
	ldstuba	[%i1+0x027]%asi,%l3	! %l3 = 0000007d000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = e873ee91, %l1 = 000000000000007b
	lduwa	[%i2+%o4]0x81,%l1	! %l1 = 00000000e873ee91

p0_label_223:
!	Mem[0000000030001408] = 0000000045c0fdff, %f10 = 00000000 00000000
	ldda	[%i0+%o4]0x89,%f10	! %f10 = 00000000 45c0fdff
!	Mem[0000000010081420] = fffff75a, %l7 = 0000000000000000
	lduw	[%i2+0x020],%l7		! %l7 = 00000000fffff75a
!	Mem[00000000300c1408] = 0000007b, %l0 = 0000000000000000
	lduwa	[%i3+%o4]0x89,%l0	! %l0 = 000000000000007b
!	Mem[0000000010081408] = 45c0fdff, %l2 = ffffffffffffff00
	ldsba	[%i2+%o4]0x88,%l2	! %l2 = ffffffffffffffff
!	Mem[000000001008143c] = 000000ff, %l2 = ffffffffffffffff
	lduwa	[%i2+0x03c]%asi,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030041408] = 00000000 ff000000, %l4 = 000000ff, %l5 = 00000000
	ldda	[%i1+%o4]0x89,%l4	! %l4 = 00000000ff000000 0000000000000000
!	Mem[0000000010101418] = ffffffff 0000005a, %l6 = ffffffff, %l7 = fffff75a
	ldd	[%i4+0x018],%l6		! %l6 = 00000000ffffffff 000000000000005a
!	Mem[0000000030081410] = 000000ff, %f16 = ffff00ff
	lda	[%i2+%o5]0x89,%f16	! %f16 = 000000ff
!	Mem[0000000010081400] = fdffffff00000000, %f26 = 7b000000 00000000
	ldda	[%i2+%g0]0x88,%f26	! %f26 = fdffffff 00000000
!	Starting 10 instruction Store Burst
!	%l2 = 00000000000000ff, Mem[0000000010001400] = fffff75a
	stha	%l2,[%i0+%g0]0x80	! Mem[0000000010001400] = 00fff75a

p0_label_224:
!	%l2 = 00000000000000ff, Mem[000000001018142c] = 00000000
	stw	%l2,[%i6+0x02c]		! Mem[000000001018142c] = 000000ff
!	%f22 = ffff0000 fffffffd, Mem[00000000100c1410] = 0000007b 00000000
	stda	%f22,[%i3+%o5]0x88	! Mem[00000000100c1410] = ffff0000 fffffffd
!	Mem[0000000010041408] = 7b000000, %l1 = 00000000e873ee91
	swapa	[%i1+%o4]0x88,%l1	! %l1 = 000000007b000000
!	%f23 = fffffffd, Mem[0000000030181400] = 0000007b
	sta	%f23,[%i6+%g0]0x89	! Mem[0000000030181400] = fffffffd
!	%f12 = fffff75a 00000000, %l7 = 000000000000005a
!	Mem[00000000300c1420] = 7db8a8fe14ef7179
	add	%i3,0x020,%g1
	stda	%f12,[%g1+%l7]ASI_PST32_SL ! Mem[00000000300c1420] = 7db8a8fe5af7ffff
!	%l3 = 000000000000007d, Mem[0000000010001400] = 5af7ff00
	stha	%l3,[%i0+%g0]0x88	! Mem[0000000010001400] = 5af7007d
!	%l6 = 00000000ffffffff, Mem[0000000010141410] = ff000000
	stha	%l6,[%i5+%o5]0x80	! Mem[0000000010141410] = ffff0000
!	%f27 = 00000000, Mem[0000000030181408] = 00000000
	sta	%f27,[%i6+%o4]0x89	! Mem[0000000030181408] = 00000000
!	%f30 = 00000000 00000000, Mem[0000000010041408] = 91ee73e8 00000000
	stda	%f30,[%i1+%o4]0x80	! Mem[0000000010041408] = 00000000 00000000
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = 00006217, %l4 = 00000000ff000000
	ldsha	[%o2+0x000]%asi,%l4	! %l4 = 0000000000000000

p0_label_225:
!	Mem[0000000010001408] = ff000000, %l7 = 000000000000005a
	ldsba	[%i0+%o4]0x80,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010041408] = 00000000, %l5 = 0000000000000000
	lduba	[%i1+%o4]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000010141408] = ffffffff, %l1 = 000000007b000000
	ldsba	[%i5+0x00a]%asi,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010181400] = 0000007b, %l7 = ffffffffffffffff
	lduwa	[%i6+%g0]0x80,%l7	! %l7 = 000000000000007b
!	Mem[0000000030041408] = ff000000, %l0 = 000000000000007b
	ldswa	[%i1+%o4]0x89,%l0	! %l0 = ffffffffff000000
!	Mem[0000000010041408] = 00000000, %l7 = 000000000000007b
	ldsba	[%i1+%o4]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000010041420] = 00000000fea8b8ff, %l1 = ffffffffffffffff
	ldxa	[%i1+0x020]%asi,%l1	! %l1 = 00000000fea8b8ff
!	Mem[00000000100c1410] = fdffffff, %l5 = 00000000, %l1 = fea8b8ff
	add	%i3,0x10,%g1
	casa	[%g1]0x80,%l5,%l1	! %l1 = 00000000fdffffff
!	Mem[0000000010001408] = ff000000, %l7 = 0000000000000000
	lduba	[%i0+%o4]0x80,%l7	! %l7 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l6 = 00000000ffffffff, Mem[00000000211c0000] = 00006217, %asi = 80
	stha	%l6,[%o2+0x000]%asi	! Mem[00000000211c0000] = ffff6217

p0_label_226:
!	%l3 = 000000000000007d, Mem[0000000010041400] = 0000000000000000
	stxa	%l3,[%i1+%g0]0x88	! Mem[0000000010041400] = 000000000000007d
!	%l0 = ff000000, %l1 = fdffffff, Mem[0000000010001410] = 7bfdc000 0000007d
	stda	%l0,[%i0+%o5]0x88	! Mem[0000000010001410] = ff000000 fdffffff
!	Mem[0000000010181410] = ff000000, %l0 = ffffffffff000000
	swap	[%i6+%o5],%l0		! %l0 = 00000000ff000000
!	%l1 = 00000000fdffffff, Mem[0000000030041410] = 00000000000000ff
	stxa	%l1,[%i1+%o5]0x89	! Mem[0000000030041410] = 00000000fdffffff
!	%f2  = 00000000 0000005a, Mem[00000000100c1400] = ffffff4a 00000000
	stda	%f2 ,[%i3+%g0]0x80	! Mem[00000000100c1400] = 00000000 0000005a
!	%f10 = 00000000 45c0fdff, Mem[0000000030001408] = 45c0fdff 00000000
	stda	%f10,[%i0+%o4]0x89	! Mem[0000000030001408] = 00000000 45c0fdff
!	Mem[000000001014141b] = ff00007b, %l6 = 00000000ffffffff
	ldstuba	[%i5+0x01b]%asi,%l6	! %l6 = 0000007b000000ff
!	%l2 = 00000000000000ff, Mem[0000000010001400] = 5af7007d
	stwa	%l2,[%i0+%g0]0x88	! Mem[0000000010001400] = 000000ff
!	%f28 = 0000007b 00000000, Mem[0000000030081410] = ff000000 0000b0e7
	stda	%f28,[%i2+%o5]0x81	! Mem[0000000030081410] = 0000007b 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = 00000000, %l5 = 0000000000000000
	lduha	[%i1+%o4]0x88,%l5	! %l5 = 0000000000000000

p0_label_227:
!	Mem[00000000100c1408] = 00005af7, %l0 = 00000000ff000000
	lduwa	[%i3+%o4]0x88,%l0	! %l0 = 0000000000005af7
!	Mem[0000000030181410] = fffdc04500000000, %l0 = 0000000000005af7
	ldxa	[%i6+%o5]0x89,%l0	! %l0 = fffdc04500000000
!	Mem[0000000030181410] = 00000000, %l3 = 000000000000007d
	lduwa	[%i6+%o5]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000030141400] = 0000e9ff, %l2 = 00000000000000ff
	ldsha	[%i5+%g0]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000010041400] = 0000007d, %l6 = 000000000000007b
	ldswa	[%i1+%g0]0x88,%l6	! %l6 = 000000000000007d
!	Mem[0000000010141410] = ffff0000ffffffff, %f8  = e30000ff 00000000
	ldda	[%i5+%o5]0x80,%f8 	! %f8  = ffff0000 ffffffff
!	Mem[00000000100c1410] = ffff0000 fffffffd, %l0 = 00000000, %l1 = fdffffff
	ldda	[%i3+%o5]0x88,%l0	! %l0 = 00000000fffffffd 00000000ffff0000
!	Mem[0000000030001400] = fdffffff, %l4 = 0000000000000000
	ldswa	[%i0+%g0]0x81,%l4	! %l4 = fffffffffdffffff
!	Mem[0000000030181410] = fffdc04500000000, %l4 = fffffffffdffffff
	ldxa	[%i6+%o5]0x89,%l4	! %l4 = fffdc04500000000
!	Starting 10 instruction Store Burst
!	%l4 = 00000000, %l5 = 00000000, Mem[0000000010081408] = 45c0fdff 00000000
	stda	%l4,[%i2+%o4]0x88	! Mem[0000000010081408] = 00000000 00000000

p0_label_228:
!	Mem[0000000010041422] = 00000000, %l0 = 00000000fffffffd
	ldstub	[%i1+0x022],%l0		! %l0 = 00000000000000ff
!	Mem[0000000010081410] = 000000ff, %l5 = 0000000000000000
	swapa	[%i2+%o5]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[00000000100c1408] = f75a0000, %l0 = 0000000000000000
	ldstuba	[%i3+%o4]0x80,%l0	! %l0 = 000000f7000000ff
!	Mem[0000000030041410] = fdffffff, %l5 = 00000000000000ff
	ldstuba	[%i1+%o5]0x89,%l5	! %l5 = 000000ff000000ff
!	Mem[00000000211c0000] = ffff6217, %l2 = 0000000000000000
	ldstub	[%o2+%g0],%l2		! %l2 = 000000ff000000ff
!	%f19 = 00000000, Mem[00000000300c1408] = 7b000000
	sta	%f19,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00000000
!	%l1 = 00000000ffff0000, Mem[0000000010081403] = 00000000, %asi = 80
	stba	%l1,[%i2+0x003]%asi	! Mem[0000000010081400] = 00000000
!	Mem[0000000010081408] = 00000000, %l4 = fffdc04500000000
	ldstuba	[%i2+0x008]%asi,%l4	! %l4 = 00000000000000ff
!	Mem[00000000300c1400] = f75a00ff, %l7 = 00000000000000ff
	ldstuba	[%i3+%g0]0x89,%l7	! %l7 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001404] = ffffffff, %l0 = 00000000000000f7
	lduba	[%i0+0x006]%asi,%l0	! %l0 = 00000000000000ff

p0_label_229:
!	Mem[0000000010101424] = 00000000, %l5 = 00000000000000ff
	lduh	[%i4+0x024],%l5		! %l5 = 0000000000000000
!	Mem[0000000030081400] = 7b000000, %l3 = 0000000000000000
	ldswa	[%i2+%g0]0x81,%l3	! %l3 = 000000007b000000
!	Mem[0000000010141430] = 5cab5a60, %l0 = 00000000000000ff
	lduw	[%i5+0x030],%l0		! %l0 = 000000005cab5a60
!	Mem[0000000030181400] = 00000000fffffffd, %f6  = ff000000 ffffffff
	ldda	[%i6+%g0]0x89,%f6 	! %f6  = 00000000 fffffffd
!	Mem[0000000010081400] = 00000000, %l3 = 000000007b000000
	lduba	[%i2+%g0]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000030001408] = 45c0fdff, %l2 = 00000000000000ff
	ldswa	[%i0+%o4]0x89,%l2	! %l2 = 0000000045c0fdff
!	Mem[00000000100c1408] = 00005aff, %f26 = fdffffff
	lda	[%i3+%o4]0x88,%f26	! %f26 = 00005aff
!	Mem[00000000100c1400] = 00000000, %l7 = 00000000000000ff
	ldswa	[%i3+%g0]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000030001400] = ffff0000fffffffd, %l4 = 0000000000000000
	ldxa	[%i0+%g0]0x89,%l4	! %l4 = ffff0000fffffffd
!	Starting 10 instruction Store Burst
!	Mem[0000000010081408] = ff000000, %l0 = 000000005cab5a60
	ldstuba	[%i2+%o4]0x80,%l0	! %l0 = 000000ff000000ff

p0_label_230:
!	Mem[0000000030101410] = 00000000, %l4 = ffff0000fffffffd
	ldswa	[%i4+%o5]0x89,%l4	! %l4 = 0000000000000000
!	%f16 = 000000ff, Mem[0000000010081408] = ff000000
	sta	%f16,[%i2+%o4]0x80	! Mem[0000000010081408] = 000000ff
!	%f30 = 00000000 00000000, %l2 = 0000000045c0fdff
!	Mem[0000000030001410] = 00007b0000000000
	add	%i0,0x010,%g1
	stda	%f30,[%g1+%l2]ASI_PST8_SL ! Mem[0000000030001410] = 0000000000000000
!	%l0 = 00000000000000ff, Mem[0000000030081410] = 7b000000
	stwa	%l0,[%i2+%o5]0x89	! Mem[0000000030081410] = 000000ff
!	Mem[0000000010041410] = 4aff73ff, %l4 = 0000000000000000
	swapa	[%i1+%o5]0x88,%l4	! %l4 = 000000004aff73ff
!	Mem[00000000300c1410] = 000000ff, %l2 = 0000000045c0fdff
	ldstuba	[%i3+%o5]0x89,%l2	! %l2 = 000000ff000000ff
!	Mem[00000000218000c1] = 0000e748, %l2 = 00000000000000ff
	ldstuba	[%o3+0x0c1]%asi,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010141408] = ffffffff, %l2 = 0000000000000000
	ldstuba	[%i5+%o4]0x80,%l2	! %l2 = 000000ff000000ff
!	Mem[0000000010001438] = ff000000, %l7 = 0000000000000000, %asi = 80
	swapa	[%i0+0x038]%asi,%l7	! %l7 = 00000000ff000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = 000000ff00000000, %l7 = 00000000ff000000
	ldxa	[%i1+%o4]0x81,%l7	! %l7 = 000000ff00000000

p0_label_231:
!	Mem[0000000030041400] = 000000ff, %f31 = 00000000
	lda	[%i1+%g0]0x89,%f31	! %f31 = 000000ff
!	%l0 = 00000000000000ff, Mem[00000000211c0000] = ffff6217, %asi = 80
	stha	%l0,[%o2+0x000]%asi	! Mem[00000000211c0000] = 00ff6217
!	Mem[0000000010041424] = fea8b8ff, %l1 = 00000000ffff0000
	ldswa	[%i1+0x024]%asi,%l1	! %l1 = fffffffffea8b8ff
!	Mem[0000000030141410] = 00000000, %l6 = 000000000000007d
	lduba	[%i5+%o5]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000010081410] = 00000000, %l1 = fffffffffea8b8ff
	lduwa	[%i2+%o5]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000030181400] = fdffffff, %l2 = 00000000000000ff
	lduha	[%i6+%g0]0x81,%l2	! %l2 = 000000000000fdff
!	Mem[0000000030101408] = 45c0ffff, %f6  = 00000000
	lda	[%i4+%o4]0x89,%f6 	! %f6 = 45c0ffff
!	Mem[00000000100c1408] = 00005aff, %l7 = 000000ff00000000
	lduha	[%i3+%o4]0x88,%l7	! %l7 = 0000000000005aff
!	Mem[0000000030041410] = fdffffff, %l2 = 000000000000fdff
	lduwa	[%i1+%o5]0x89,%l2	! %l2 = 00000000fdffffff
!	Starting 10 instruction Store Burst
!	Mem[0000000030081410] = ff000000, %l5 = 0000000000000000
	ldstuba	[%i2+%o5]0x81,%l5	! %l5 = 000000ff000000ff

p0_label_232:
!	%l1 = 0000000000000000, Mem[0000000030081400] = 7b000000
	stba	%l1,[%i2+%g0]0x81	! Mem[0000000030081400] = 00000000
!	Mem[00000000300c1408] = 00000000, %l2 = 00000000fdffffff
	ldstuba	[%i3+%o4]0x89,%l2	! %l2 = 00000000000000ff
!	%l0 = 00000000000000ff, Mem[0000000010181400] = 0000007b
	stwa	%l0,[%i6+%g0]0x80	! Mem[0000000010181400] = 000000ff
!	%l3 = 0000000000000000, Mem[00000000201c0000] = ffff8a5f, %asi = 80
	stha	%l3,[%o0+0x000]%asi	! Mem[00000000201c0000] = 00008a5f
!	%l1 = 0000000000000000, Mem[000000001008143c] = 000000ff, %asi = 80
	stwa	%l1,[%i2+0x03c]%asi	! Mem[000000001008143c] = 00000000
!	Mem[0000000010001408] = ff00000000000000, %l4 = 000000004aff73ff, %l0 = 00000000000000ff
	add	%i0,0x08,%g1
	casxa	[%g1]0x80,%l4,%l0	! %l0 = ff00000000000000
!	%f14 = 7bfdc045, Mem[0000000010081400] = 00000000
	sta	%f14,[%i2+%g0]0x88	! Mem[0000000010081400] = 7bfdc045
!	%l0 = ff00000000000000, Mem[0000000010081410] = ffffffff00000000
	stxa	%l0,[%i2+%o5]0x88	! Mem[0000000010081410] = ff00000000000000
!	%l1 = 0000000000000000, Mem[0000000030081408] = 91ee73e8
	stba	%l1,[%i2+%o4]0x89	! Mem[0000000030081408] = 91ee7300
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = 0000007b, %l3 = 0000000000000000
	ldswa	[%i5+%g0]0x80,%l3	! %l3 = 000000000000007b

p0_label_233:
!	Mem[0000000030081400] = 00000000, %f16 = 000000ff
	lda	[%i2+%g0]0x81,%f16	! %f16 = 00000000
!	Mem[0000000030081408] = 0073ee91, %l1 = 0000000000000000
	ldsha	[%i2+%o4]0x81,%l1	! %l1 = 0000000000000073
!	Code Fragment 4
p0_fragment_6:
!	%l0 = ff00000000000000
	setx	0x47d75257a7237b59,%g7,%l0 ! %l0 = 47d75257a7237b59
!	%l1 = 0000000000000073
	setx	0xeeb74bd7daff97a1,%g7,%l1 ! %l1 = eeb74bd7daff97a1
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 47d75257a7237b59
	setx	0x0ff33be7f091944e,%g7,%l0 ! %l0 = 0ff33be7f091944e
!	%l1 = eeb74bd7daff97a1
	setx	0x9e0a69f7c2e3737e,%g7,%l1 ! %l1 = 9e0a69f7c2e3737e
!	Mem[0000000030181400] = fdffffff, %l0 = 0ff33be7f091944e
	lduba	[%i6+%g0]0x81,%l0	! %l0 = 00000000000000fd
!	Mem[0000000010081424] = 00000000, %l2 = 0000000000000000
	ldswa	[%i2+0x024]%asi,%l2	! %l2 = 0000000000000000
!	Mem[0000000010181408] = ff000000, %l6 = 0000000000000000
	ldsha	[%i6+%o4]0x80,%l6	! %l6 = ffffffffffffff00
!	Mem[00000000100c1410] = fdffffff, %l5 = 00000000000000ff
	lduwa	[%i3+%o5]0x80,%l5	! %l5 = 00000000fdffffff
!	Mem[0000000030141408] = 45c0ffff, %l5 = 00000000fdffffff
	ldsha	[%i5+%o4]0x89,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000010141428] = 1400fd00, %f7  = fffffffd
	lda	[%i5+0x028]%asi,%f7 	! %f7 = 1400fd00
!	Starting 10 instruction Store Burst
!	%f2  = 00000000 0000005a, %l0 = 00000000000000fd
!	Mem[00000000300c1400] = ff005af7ffffffff
	stda	%f2,[%i3+%l0]ASI_PST16_SL ! Mem[00000000300c1400] = 5a005af700000000

p0_label_234:
!	%l2 = 00000000, %l3 = 0000007b, Mem[00000000100c1408] = ff5a0000 00000000
	stda	%l2,[%i3+%o4]0x80	! Mem[00000000100c1408] = 00000000 0000007b
!	%l5 = ffffffffffffffff, Mem[0000000030001408] = 0000000045c0fdff
	stxa	%l5,[%i0+%o4]0x89	! Mem[0000000030001408] = ffffffffffffffff
!	%l0 = 00000000000000fd, Mem[0000000010141410] = 0000ffff
	stwa	%l0,[%i5+%o5]0x88	! Mem[0000000010141410] = 000000fd
!	Mem[0000000030101410] = 00000000, %l1 = 9e0a69f7c2e3737e
	ldstuba	[%i4+%o5]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030101400] = c0810000, %l5 = ffffffffffffffff
	ldstuba	[%i4+%g0]0x89,%l5	! %l5 = 00000000000000ff
!	%f26 = 00005aff, Mem[0000000030001408] = ffffffff
	sta	%f26,[%i0+%o4]0x89	! Mem[0000000030001408] = 00005aff
!	%f10 = 00000000 45c0fdff, Mem[00000000100c1408] = 00000000 0000007b
	stda	%f10,[%i3+%o4]0x80	! Mem[00000000100c1408] = 00000000 45c0fdff
!	Mem[00000000201c0000] = 00008a5f, %l6 = ffffffffffffff00
	ldstub	[%o0+%g0],%l6		! %l6 = 00000000000000ff
!	Mem[0000000030001400] = fffffffd, %l4 = 000000004aff73ff
	swapa	[%i0+%g0]0x89,%l4	! %l4 = 00000000fffffffd
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = 00000000000000ff, %f20 = 000000ff c0810000
	ldda	[%i1+%g0]0x89,%f20	! %f20 = 00000000 000000ff

p0_label_235:
!	Mem[0000000010181410] = ff00000000000000, %l5 = 0000000000000000
	ldxa	[%i6+%o5]0x80,%l5	! %l5 = ff00000000000000
!	Mem[0000000010041410] = 00000000, %l3 = 000000000000007b
	ldswa	[%i1+%o5]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000010181400] = ff000000, %l7 = 0000000000005aff
	lduha	[%i6+%g0]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000030001410] = 00000000, %l3 = 0000000000000000
	lduba	[%i0+%o5]0x81,%l3	! %l3 = 0000000000000000
!	Mem[00000000218001c0] = 4cbe7723, %l1 = 0000000000000000
	lduha	[%o3+0x1c0]%asi,%l1	! %l1 = 0000000000004cbe
!	Mem[0000000010141418] = ff0000ff 00000000, %l4 = fffffffd, %l5 = 00000000
	ldd	[%i5+0x018],%l4		! %l4 = 00000000ff0000ff 0000000000000000
!	Mem[0000000030041400] = 00000000 000000ff, %l0 = 000000fd, %l1 = 00004cbe
	ldda	[%i1+%g0]0x89,%l0	! %l0 = 00000000000000ff 0000000000000000
!	Mem[0000000010001408] = ff00000000000000, %l4 = 00000000ff0000ff
	ldxa	[%i0+%o4]0x80,%l4	! %l4 = ff00000000000000
!	Mem[0000000030101400] = c08100ff, %l4 = ff00000000000000
	lduha	[%i4+%g0]0x89,%l4	! %l4 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l1 = 0000000000000000, Mem[0000000030181408] = 00000000
	stha	%l1,[%i6+%o4]0x81	! Mem[0000000030181408] = 00000000

p0_label_236:
!	%l5 = 0000000000000000, Mem[0000000010101400] = ff000000
	stha	%l5,[%i4+%g0]0x80	! Mem[0000000010101400] = 00000000
!	%f24 = ffffffff 000000ff, Mem[0000000030041410] = fffffffd 00000000
	stda	%f24,[%i1+%o5]0x81	! Mem[0000000030041410] = ffffffff 000000ff
!	%l6 = 00000000, %l7 = 00000000, Mem[0000000010181408] = ff000000 00000000
	stda	%l6,[%i6+%o4]0x80	! Mem[0000000010181408] = 00000000 00000000
!	%l0 = 00000000000000ff, Mem[0000000010001400] = 000000ff
	stha	%l0,[%i0+%g0]0x88	! Mem[0000000010001400] = 000000ff
!	%l1 = 0000000000000000, Mem[0000000010141428] = 1400fd00
	stw	%l1,[%i5+0x028]		! Mem[0000000010141428] = 00000000
!	%f4  = 000000ff, Mem[0000000010001400] = 000000ff
	sta	%f4 ,[%i0+%g0]0x88	! Mem[0000000010001400] = 000000ff
!	%f22 = ffff0000 fffffffd, Mem[00000000300c1400] = 5a005af7 00000000
	stda	%f22,[%i3+%g0]0x81	! Mem[00000000300c1400] = ffff0000 fffffffd
!	%f18 = fffdc045 00000000, %l7 = 0000000000000000
!	Mem[0000000030181428] = 8823679435030000
	add	%i6,0x028,%g1
	stda	%f18,[%g1+%l7]ASI_PST16_SL ! Mem[0000000030181428] = 8823679435030000
!	%l1 = 0000000000000000, Mem[0000000030081400] = 00000000
	stha	%l1,[%i2+%g0]0x81	! Mem[0000000030081400] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = ffffffff, %l0 = 00000000000000ff
	lduwa	[%i5+%o4]0x88,%l0	! %l0 = 00000000ffffffff

p0_label_237:
!	Mem[0000000030081400] = 000000000000007b, %f6  = 45c0ffff 1400fd00
	ldda	[%i2+%g0]0x81,%f6 	! %f6  = 00000000 0000007b
!	Mem[0000000010181410] = 000000ff, %l1 = 0000000000000000
	ldswa	[%i6+%o5]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010041420] = 0000ff00 fea8b8ff, %l0 = ffffffff, %l1 = 000000ff
	ldd	[%i1+0x020],%l0		! %l0 = 000000000000ff00 00000000fea8b8ff
!	Mem[0000000010081410] = 00000000000000ff, %l3 = 0000000000000000
	ldxa	[%i2+%o5]0x80,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030181400] = fffffffd, %l3 = 00000000000000ff
	ldswa	[%i6+%g0]0x89,%l3	! %l3 = fffffffffffffffd
!	Mem[0000000030081410] = ff000000, %l3 = fffffffffffffffd
	ldsba	[%i2+%o5]0x81,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000030141408] = ffffc04500000000, %f16 = 00000000 ff000000
	ldda	[%i5+%o4]0x81,%f16	! %f16 = ffffc045 00000000
!	Mem[0000000030101410] = 000000ff, %l3 = ffffffffffffffff
	ldsha	[%i4+%o5]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[00000000211c0000] = 00ff6217, %l0 = 000000000000ff00
	ldsb	[%o2+0x001],%l0		! %l0 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%f24 = ffffffff 000000ff, Mem[0000000010041410] = 00000000 00000000
	std	%f24,[%i1+%o5]	! Mem[0000000010041410] = ffffffff 000000ff

p0_label_238:
!	%l5 = 0000000000000000, Mem[0000000010081410] = 00000000
	stwa	%l5,[%i2+%o5]0x88	! Mem[0000000010081410] = 00000000
!	%l2 = 0000000000000000, Mem[0000000010001410] = ff000000
	stwa	%l2,[%i0+%o5]0x88	! Mem[0000000010001410] = 00000000
!	%l0 = ffffffffffffffff, Mem[0000000010081400] = 45c0fd7bfffffffd
	stxa	%l0,[%i2+%g0]0x80	! Mem[0000000010081400] = ffffffffffffffff
!	%l5 = 0000000000000000, Mem[0000000030141400] = 0000e9ff
	stha	%l5,[%i5+%g0]0x81	! Mem[0000000030141400] = 0000e9ff
!	%f5  = ffffffff, Mem[0000000010181410] = ff000000
	sta	%f5 ,[%i6+%o5]0x80	! Mem[0000000010181410] = ffffffff
!	%l4 = 00000000000000ff, Mem[0000000020800040] = ff358327, %asi = 80
	stba	%l4,[%o1+0x040]%asi	! Mem[0000000020800040] = ff358327
!	%l2 = 0000000000000000, Mem[00000000300c1408] = 000000ff
	stwa	%l2,[%i3+%o4]0x89	! Mem[00000000300c1408] = 00000000
!	Mem[0000000010141438] = ffe90000ff000000, %l7 = 0000000000000000, %l6 = 0000000000000000
	add	%i5,0x38,%g1
	casxa	[%g1]0x80,%l7,%l6	! %l6 = ffe90000ff000000
!	%l3 = 00000000000000ff, Mem[0000000030181400] = fdffffff
	stba	%l3,[%i6+%g0]0x81	! Mem[0000000030181400] = ffffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001414] = fffffffd, %l0 = ffffffffffffffff
	lduha	[%i0+0x014]%asi,%l0	! %l0 = 000000000000ffff

p0_label_239:
!	Mem[000000001008140c] = 00000000, %l5 = 0000000000000000
	ldsw	[%i2+0x00c],%l5		! %l5 = 0000000000000000
!	Mem[0000000010081434] = e873ee91, %l6 = ffe90000ff000000
	ldswa	[%i2+0x034]%asi,%l6	! %l6 = ffffffffe873ee91
!	Mem[00000000100c1400] = 5a00000000000000, %l0 = 000000000000ffff
	ldxa	[%i3+%g0]0x88,%l0	! %l0 = 5a00000000000000
!	Mem[0000000010141428] = 00000000, %l6 = ffffffffe873ee91
	ldsb	[%i5+0x02b],%l6		! %l6 = 0000000000000000
!	Mem[0000000030001400] = ffff00004aff73ff, %l7 = 0000000000000000
	ldxa	[%i0+%g0]0x89,%l7	! %l7 = ffff00004aff73ff
!	Mem[000000001010142c] = ffffffff, %l2 = 0000000000000000
	ldswa	[%i4+0x02c]%asi,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000030081400] = 00000000 0000007b, %l2 = ffffffff, %l3 = 000000ff
	ldda	[%i2+%g0]0x81,%l2	! %l2 = 0000000000000000 000000000000007b
!	Mem[0000000010181410] = ffffffff 00000000, %l6 = 00000000, %l7 = 4aff73ff
	ldda	[%i6+%o5]0x80,%l6	! %l6 = 00000000ffffffff 0000000000000000
!	Mem[0000000030101410] = ff000000, %l5 = 0000000000000000
	lduba	[%i4+%o5]0x81,%l5	! %l5 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000030081408] = 91ee7300, %l1 = 00000000fea8b8ff
	ldstuba	[%i2+%o4]0x89,%l1	! %l1 = 00000000000000ff

p0_label_240:
!	Mem[000000001010143c] = 7487e36b, %l3 = 000000000000007b, %asi = 80
	swapa	[%i4+0x03c]%asi,%l3	! %l3 = 000000007487e36b
!	%l5 = 00000000000000ff, Mem[0000000010181408] = 00000000
	stha	%l5,[%i6+%o4]0x88	! Mem[0000000010181408] = 000000ff
!	Mem[0000000030081408] = 91ee73ff, %l5 = 00000000000000ff
	ldstuba	[%i2+%o4]0x89,%l5	! %l5 = 000000ff000000ff
!	%f25 = 000000ff, Mem[00000000100c1410] = fffffffd
	sta	%f25,[%i3+%o5]0x88	! Mem[00000000100c1410] = 000000ff
!	%l6 = 00000000ffffffff, Mem[00000000100c1410] = 000000ff
	stwa	%l6,[%i3+%o5]0x88	! Mem[00000000100c1410] = ffffffff
!	%f20 = 00000000 000000ff, Mem[0000000030141400] = 0000e9ff 45c0fd7b
	stda	%f20,[%i5+%g0]0x81	! Mem[0000000030141400] = 00000000 000000ff
!	%l0 = 5a00000000000000, Mem[0000000010081428] = 000000ff0000ff00
	stx	%l0,[%i2+0x028]		! Mem[0000000010081428] = 5a00000000000000
!	%f2  = 00000000 0000005a, %l4 = 00000000000000ff
!	Mem[0000000010001428] = 0000000000000000
	add	%i0,0x028,%g1
	stda	%f2,[%g1+%l4]ASI_PST8_PL ! Mem[0000000010001428] = 5a00000000000000
!	%l0 = 00000000, %l1 = 00000000, Mem[0000000010181430] = 73e000ff 00000000
	std	%l0,[%i6+0x030]		! Mem[0000000010181430] = 00000000 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030101410] = 000000ff, %l0 = 5a00000000000000
	lduwa	[%i4+%o5]0x89,%l0	! %l0 = 00000000000000ff

p0_label_241:
!	Mem[0000000030041408] = ff000000, %f12 = fffff75a
	lda	[%i1+%o4]0x89,%f12	! %f12 = ff000000
!	Mem[0000000030081408] = 91ee73ff, %l1 = 0000000000000000
	lduwa	[%i2+%o4]0x89,%l1	! %l1 = 0000000091ee73ff
!	Mem[00000000300c1410] = ff000000, %l2 = 0000000000000000
	ldswa	[%i3+%o5]0x81,%l2	! %l2 = ffffffffff000000
!	Mem[0000000010041408] = 00000000, %l6 = 00000000ffffffff
	lduw	[%i1+%o4],%l6		! %l6 = 0000000000000000
!	Mem[0000000030101408] = 45c0ffff, %l2 = ffffffffff000000
	lduba	[%i4+%o4]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010141424] = 4f4418f2, %l0 = 00000000000000ff
	ldsw	[%i5+0x024],%l0		! %l0 = 000000004f4418f2
!	Mem[0000000030181400] = ffffffff00000000, %f22 = ffff0000 fffffffd
	ldda	[%i6+%g0]0x81,%f22	! %f22 = ffffffff 00000000
!	Mem[0000000030101408] = ffffc045, %l7 = 0000000000000000
	lduwa	[%i4+%o4]0x81,%l7	! %l7 = 00000000ffffc045
!	Mem[0000000030181400] = ffffffff, %l0 = 000000004f4418f2
	ldsba	[%i6+%g0]0x89,%l0	! %l0 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	Mem[0000000010081408] = 000000ff, %l5 = 00000000000000ff
	ldstuba	[%i2+%o4]0x80,%l5	! %l5 = 00000000000000ff

p0_label_242:
!	%l4 = 00000000000000ff, Mem[0000000030181410] = 00000000
	stba	%l4,[%i6+%o5]0x81	! Mem[0000000030181410] = ff000000
!	%l6 = 0000000000000000, Mem[0000000010041420] = 0000ff00fea8b8ff, %asi = 80
	stxa	%l6,[%i1+0x020]%asi	! Mem[0000000010041420] = 0000000000000000
!	%f16 = ffffc045 00000000, %l7 = 00000000ffffc045
!	Mem[00000000300c1430] = f335d15de90dd9a2
	add	%i3,0x030,%g1
	stda	%f16,[%g1+%l7]ASI_PST8_S ! Mem[00000000300c1430] = f3ffd15de900d900
!	%l1 = 0000000091ee73ff, Mem[0000000030041410] = ffffffff
	stha	%l1,[%i1+%o5]0x81	! Mem[0000000030041410] = 73ffffff
!	Mem[00000000211c0001] = 00ff6217, %l2 = 00000000000000ff
	ldstub	[%o2+0x001],%l2		! %l2 = 000000ff000000ff
!	%f4  = 000000ff ffffffff, Mem[0000000010141418] = ff0000ff 00000000
	std	%f4 ,[%i5+0x018]	! Mem[0000000010141418] = 000000ff ffffffff
!	Mem[0000000021800000] = 67ffe2e2, %l3 = 000000007487e36b
	ldstuba	[%o3+0x000]%asi,%l3	! %l3 = 00000067000000ff
!	%l3 = 0000000000000067, Mem[0000000030101410] = ff00000000000000
	stxa	%l3,[%i4+%o5]0x81	! Mem[0000000030101410] = 0000000000000067
!	%l3 = 0000000000000067, Mem[0000000030101410] = 00000000
	stba	%l3,[%i4+%o5]0x81	! Mem[0000000030101410] = 67000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = 45c0ffff, %f1  = 00000000
	lda	[%i5+%o4]0x89,%f1 	! %f1 = 45c0ffff

p0_label_243:
!	Mem[0000000030101400] = c08100ff, %l3 = 0000000000000067
	ldsba	[%i4+%g0]0x89,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000030101410] = 67000000, %l1 = 0000000091ee73ff
	lduha	[%i4+%o5]0x81,%l1	! %l1 = 0000000000006700
!	Mem[0000000010101400] = 00000000, %l7 = 00000000ffffc045
	lduba	[%i4+%g0]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000010081408] = ff0000ff, %l2 = 00000000000000ff
	ldsha	[%i2+%o4]0x80,%l2	! %l2 = ffffffffffffff00
!	Mem[0000000010001408] = ff000000, %l0 = ffffffffffffffff
	lduwa	[%i0+%o4]0x80,%l0	! %l0 = 00000000ff000000
!	Mem[0000000010081410] = 00000000000000ff, %f30 = 00000000 000000ff
	ldd	[%i2+%o5],%f30		! %f30 = 00000000 000000ff
!	Mem[0000000030041410] = 73ffffff, %l7 = 0000000000000000
	ldswa	[%i1+%o5]0x81,%l7	! %l7 = 0000000073ffffff
!	Mem[0000000010101400] = 00000000, %l7 = 0000000073ffffff
	ldsha	[%i4+%g0]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000010181410] = ffffffff, %l5 = 0000000000000000
	ldswa	[%i6+%o5]0x80,%l5	! %l5 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l0 = ff000000, %l1 = 00006700, Mem[0000000010101410] = ffff00ff ffff0000
	stda	%l0,[%i4+%o5]0x80	! Mem[0000000010101410] = ff000000 00006700

p0_label_244:
!	Mem[0000000030041410] = 73ffffff, %l5 = ffffffffffffffff
	ldstuba	[%i1+%o5]0x81,%l5	! %l5 = 00000073000000ff
!	%f16 = ffffc045 00000000, %l0 = 00000000ff000000
!	Mem[0000000010101428] = ffffffffffffffff
	add	%i4,0x028,%g1
	stda	%f16,[%g1+%l0]ASI_PST8_PL ! Mem[0000000010101428] = ffffffffffffffff
!	%l6 = 0000000000000000, Mem[0000000010001410] = 00000000
	stha	%l6,[%i0+%o5]0x88	! Mem[0000000010001410] = 00000000
!	Mem[00000000300c1400] = ffff0000, %l6 = 0000000000000000
	swapa	[%i3+%g0]0x81,%l6	! %l6 = 00000000ffff0000
!	Mem[0000000021800080] = 7b00d810, %l0 = 00000000ff000000
	ldstuba	[%o3+0x080]%asi,%l0	! %l0 = 0000007b000000ff
!	%f25 = 000000ff, Mem[00000000100c1400] = 00000000
	sta	%f25,[%i3+%g0]0x80	! Mem[00000000100c1400] = 000000ff
!	%l7 = 0000000000000000, Mem[00000000300c1408] = 00000000ff000000
	stxa	%l7,[%i3+%o4]0x81	! Mem[00000000300c1408] = 0000000000000000
!	Mem[000000001018141c] = 259fa9be, %l0 = 0000007b, %l5 = 00000073
	add	%i6,0x1c,%g1
	casa	[%g1]0x80,%l0,%l5	! %l5 = 00000000259fa9be
!	%f26 = 00005aff 00000000, Mem[00000000300c1400] = 00000000 fdffffff
	stda	%f26,[%i3+%g0]0x89	! Mem[00000000300c1400] = 00005aff 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = ff0000ff, %l3 = ffffffffffffffff
	ldswa	[%i2+%o4]0x80,%l3	! %l3 = ffffffffff0000ff

p0_label_245:
!	Mem[0000000030101400] = c08100ff, %l6 = 00000000ffff0000
	lduha	[%i4+%g0]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010001410] = fdffffff 00000000, %l2 = ffffff00, %l3 = ff0000ff
	ldda	[%i0+%o5]0x88,%l2	! %l2 = 0000000000000000 00000000fdffffff
!	Mem[0000000030041410] = ffffffff, %l2 = 0000000000000000
	lduwa	[%i1+%o5]0x89,%l2	! %l2 = 00000000ffffffff
!	Mem[00000000201c0000] = ff008a5f, %l0 = 000000000000007b
	lduha	[%o0+0x000]%asi,%l0	! %l0 = 000000000000ff00
!	Mem[00000000100c1408] = 00000000, %l1 = 0000000000006700
	lduwa	[%i3+%o4]0x88,%l1	! %l1 = 0000000000000000
!	Mem[00000000100c1408] = 00000000, %l1 = 0000000000000000
	lduwa	[%i3+%o4]0x88,%l1	! %l1 = 0000000000000000
!	%f0  = fffdffff 45c0ffff, %f7  = 0000007b
	fdtoi	%f0 ,%f7 		! %f7  = 80000000
!	Mem[00000000300c1408] = 00000000, %f5  = ffffffff
	lda	[%i3+%o4]0x81,%f5 	! %f5 = 00000000
!	Mem[0000000010081428] = 5a000000 00000000, %l2 = ffffffff, %l3 = fdffffff
	ldda	[%i2+0x028]%asi,%l2	! %l2 = 000000005a000000 0000000000000000
!	Starting 10 instruction Store Burst
!	%l0 = 000000000000ff00, Mem[0000000010081420] = fffff75a00000000, %asi = 80
	stxa	%l0,[%i2+0x020]%asi	! Mem[0000000010081420] = 000000000000ff00

p0_label_246:
!	%l0 = 000000000000ff00, Mem[0000000030181410] = fffdc045000000ff
	stxa	%l0,[%i6+%o5]0x89	! Mem[0000000030181410] = 000000000000ff00
!	%l4 = 00000000000000ff, Mem[0000000010101410] = ff000000
	stha	%l4,[%i4+%o5]0x80	! Mem[0000000010101410] = 00ff0000
!	%f20 = 00000000 000000ff, Mem[0000000010001410] = 00000000 fffffffd
	stda	%f20,[%i0+%o5]0x80	! Mem[0000000010001410] = 00000000 000000ff
!	Mem[00000000100c1410] = ffffffff, %l1 = 0000000000000000
	swapa	[%i3+%o5]0x80,%l1	! %l1 = 00000000ffffffff
!	%l1 = 00000000ffffffff, %l4 = 00000000000000ff, %l3 = 0000000000000000
	or	%l1,%l4,%l3		! %l3 = 00000000ffffffff
!	%l6 = 00000000000000ff, Mem[0000000030041400] = 000000ff
	stha	%l6,[%i1+%g0]0x89	! Mem[0000000030041400] = 000000ff
!	%f14 = 7bfdc045 ffe90000, %l6 = 00000000000000ff
!	Mem[0000000010141408] = ffffffffff000000
	add	%i5,0x008,%g1
	stda	%f14,[%g1+%l6]ASI_PST16_PL ! Mem[0000000010141408] = 0000e9ff45c0fd7b
!	%f8  = ffff0000, Mem[0000000030181408] = 00000000
	sta	%f8 ,[%i6+%o4]0x81	! Mem[0000000030181408] = ffff0000
!	%l6 = 00000000000000ff, Mem[0000000030181400] = 00000000ffffffff
	stxa	%l6,[%i6+%g0]0x89	! Mem[0000000030181400] = 00000000000000ff
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (36)
!	Mem[0000000030181400] = ff000000 00000000 ffff0000 00fd0014
!	Mem[0000000030181410] = 00ff0000 00000000 ffff00ff ff000000
!	Mem[0000000030181420] = f335d15d 241790ed 88236794 35030000
!	Mem[0000000030181430] = 61121d36 02e9ee0d 451f704e bee2ecfb
	ldda	[%i6]ASI_BLK_AIUSL,%f0	! Block Load from 0000000030181400

p0_label_247:
!	Mem[0000000030041408] = 00000000ff000000, %l7 = 0000000000000000
	ldxa	[%i1+%o4]0x89,%l7	! %l7 = 00000000ff000000
!	Mem[0000000010181400] = 000000ffffffffff, %l3 = 00000000ffffffff
	ldxa	[%i6+0x000]%asi,%l3	! %l3 = 000000ffffffffff
!	Mem[0000000010001410] = 00000000, %l6 = 00000000000000ff
	ldsba	[%i0+%o5]0x80,%l6	! %l6 = 0000000000000000
!	Mem[00000000300c1408] = 00000000, %l3 = 000000ffffffffff
	lduwa	[%i3+%o4]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000010181408] = ff000000, %l2 = 000000005a000000
	ldswa	[%i6+%o4]0x80,%l2	! %l2 = ffffffffff000000
!	Mem[0000000010141410] = 000000fd, %l7 = 00000000ff000000
	ldsha	[%i5+%o5]0x88,%l7	! %l7 = 00000000000000fd
!	Mem[0000000010081438] = 0000000000000000, %f18 = fffdc045 00000000
	ldd	[%i2+0x038],%f18	! %f18 = 00000000 00000000
!	Mem[0000000030141410] = 00000000, %l1 = 00000000ffffffff
	ldswa	[%i5+%o5]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000030101408] = ffffc04500000000, %f22 = ffffffff 00000000
	ldda	[%i4+%o4]0x81,%f22	! %f22 = ffffc045 00000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010101408] = ff000000, %l7 = 00000000000000fd
	swapa	[%i4+%o4]0x80,%l7	! %l7 = 00000000ff000000

p0_label_248:
!	Mem[0000000030101410] = 00000067, %l6 = 0000000000000000
	ldstuba	[%i4+%o5]0x89,%l6	! %l6 = 00000067000000ff
!	%l2 = ffffffffff000000, Mem[000000001014142c] = 00000000, %asi = 80
	stba	%l2,[%i5+0x02c]%asi	! Mem[000000001014142c] = 00000000
!	Mem[0000000010001411] = 00000000, %l6 = 0000000000000067
	ldstub	[%i0+0x011],%l6		! %l6 = 00000000000000ff
!	%l1 = 0000000000000000, Mem[0000000030141408] = ffffc04500000000
	stxa	%l1,[%i5+%o4]0x81	! Mem[0000000030141408] = 0000000000000000
!	%l4 = 00000000000000ff, Mem[0000000030081408] = ff73ee917b000000
	stxa	%l4,[%i2+%o4]0x81	! Mem[0000000030081408] = 00000000000000ff
!	%f16 = ffffc045 00000000, Mem[0000000010041410] = ffffffff ff000000
	stda	%f16,[%i1+%o5]0x88	! Mem[0000000010041410] = ffffc045 00000000
!	Mem[0000000030101408] = ffffc045, %l7 = 00000000ff000000
	swapa	[%i4+%o4]0x81,%l7	! %l7 = 00000000ffffc045
!	%l1 = 0000000000000000, Mem[0000000030101408] = ff000000
	stwa	%l1,[%i4+%o4]0x81	! Mem[0000000030101408] = 00000000
!	Mem[0000000010081400] = ffffffff, %l0 = 000000000000ff00
	swapa	[%i2+%g0]0x80,%l0	! %l0 = 00000000ffffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = ff0000ff00000000, %l7 = 00000000ffffc045
	ldxa	[%i2+%o4]0x80,%l7	! %l7 = ff0000ff00000000

p0_label_249:
!	Mem[0000000010181410] = ffffffff, %f28 = 0000007b
	lda	[%i6+%o5]0x80,%f28	! %f28 = ffffffff
!	Mem[0000000010041410] = 00000000, %f17 = 00000000
	lda	[%i1+%o5]0x88,%f17	! %f17 = 00000000
!	Mem[00000000300c1410] = 00000000 000000ff, %l4 = 000000ff, %l5 = 259fa9be
	ldda	[%i3+%o5]0x89,%l4	! %l4 = 00000000000000ff 0000000000000000
!	Mem[0000000010101430] = 00000000, %l2 = ffffffffff000000
	lduh	[%i4+0x030],%l2		! %l2 = 0000000000000000
!	Mem[0000000030101408] = 0000000000000000, %l1 = 0000000000000000
	ldxa	[%i4+%o4]0x89,%l1	! %l1 = 0000000000000000
!	Mem[000000001010143c] = 0000007b, %l3 = 0000000000000000
	ldsha	[%i4+0x03c]%asi,%l3	! %l3 = 0000000000000000
!	Mem[0000000030181400] = 000000ff, %l6 = 0000000000000000
	ldswa	[%i6+%g0]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010041408] = 00000000 00000000, %l4 = 000000ff, %l5 = 00000000
	ldda	[%i1+0x008]%asi,%l4	! %l4 = 0000000000000000 0000000000000000
!	Mem[0000000010101410] = 00ff0000 00006700, %l4 = 00000000, %l5 = 00000000
	ldda	[%i4+%o5]0x80,%l4	! %l4 = 0000000000ff0000 0000000000006700
!	Starting 10 instruction Store Burst
!	Mem[0000000010081410] = 00000000, %l0 = 00000000ffffffff
	swapa	[%i2+%o5]0x80,%l0	! %l0 = 0000000000000000

p0_label_250:
!	Mem[0000000010181408] = ff000000, %l2 = 0000000000000000
	swapa	[%i6+%o4]0x80,%l2	! %l2 = 00000000ff000000
!	%f18 = 00000000 00000000, %l0 = 0000000000000000
!	Mem[0000000010101418] = ffffffff0000005a
	add	%i4,0x018,%g1
	stda	%f18,[%g1+%l0]ASI_PST8_PL ! Mem[0000000010101418] = ffffffff0000005a
!	Mem[0000000010001408] = 000000ff, %l7 = ff0000ff00000000
	swapa	[%i0+%o4]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030001408] = 00005aff, %l0 = 0000000000000000
	ldstuba	[%i0+%o4]0x89,%l0	! %l0 = 000000ff000000ff
!	Mem[0000000010101408] = fd000000, %l0 = 00000000000000ff
	ldstuba	[%i4+%o4]0x88,%l0	! %l0 = 00000000000000ff
!	%l4 = 0000000000ff0000, Mem[0000000010081410] = ffffffff
	stba	%l4,[%i2+%o5]0x88	! Mem[0000000010081410] = ffffff00
!	%f0  = 00000000, %f27 = 00000000, %f26 = 00005aff
	fsubs	%f0 ,%f27,%f26		! %f26 = 00000000
!	Mem[0000000030141410] = 00000000, %l1 = 0000000000000000
	swapa	[%i5+%o5]0x81,%l1	! %l1 = 0000000000000000
!	%l2 = 00000000ff000000, Mem[0000000010041400] = 0000007d
	stwa	%l2,[%i1+%g0]0x88	! Mem[0000000010041400] = ff000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = 00000000, %l2 = 00000000ff000000
	ldsha	[%i2+%o4]0x89,%l2	! %l2 = 0000000000000000

p0_label_251:
!	Mem[0000000010101404] = 00000000, %l4 = 0000000000ff0000
	ldsh	[%i4+0x004],%l4		! %l4 = 0000000000000000
!	Mem[0000000010041410] = 0000000045c0ffff, %f10 = 00000335 94672388
	ldda	[%i1+%o5]0x80,%f10	! %f10 = 00000000 45c0ffff
!	Mem[0000000010141400] = 0000007b, %l2 = 0000000000000000
	lduba	[%i5+%g0]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000030101410] = ff000000, %l7 = 00000000000000ff
	ldsha	[%i4+%o5]0x81,%l7	! %l7 = ffffffffffffff00
!	Mem[0000000030081400] = 00000000, %f3  = 0000ffff
	lda	[%i2+%g0]0x81,%f3 	! %f3 = 00000000
!	Mem[0000000010141408] = ffe90000, %l1 = 0000000000000000
	lduwa	[%i5+%o4]0x88,%l1	! %l1 = 00000000ffe90000
!	Mem[0000000030181400] = ff000000 00000000, %l6 = 000000ff, %l7 = ffffff00
	ldda	[%i6+%g0]0x81,%l6	! %l6 = 00000000ff000000 0000000000000000
!	Mem[0000000010141400] = 7b000000, %l6 = 00000000ff000000
	lduwa	[%i5+%g0]0x88,%l6	! %l6 = 000000007b000000
!	Mem[0000000010141408] = 0000e9ff, %l3 = 0000000000000000
	ldub	[%i5+0x00b],%l3		! %l3 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000030141408] = 00000000, %l0 = 0000000000000000
	swapa	[%i5+%o4]0x81,%l0	! %l0 = 0000000000000000

p0_label_252:
!	%l2 = 00000000, %l3 = 000000ff, Mem[0000000010081400] = 0000ff00 ffffffff
	stda	%l2,[%i2+%g0]0x80	! Mem[0000000010081400] = 00000000 000000ff
!	%f0  = 00000000 000000ff, Mem[0000000010081408] = ff0000ff 00000000
	stda	%f0 ,[%i2+%o4]0x80	! Mem[0000000010081408] = 00000000 000000ff
!	Mem[00000000211c0000] = 00ff6217, %l7 = 0000000000000000
	ldstuba	[%o2+0x000]%asi,%l7	! %l7 = 00000000000000ff
!	%l3 = 00000000000000ff, Mem[0000000010081408] = ff00000000000000
	stxa	%l3,[%i2+%o4]0x88	! Mem[0000000010081408] = 00000000000000ff
!	Mem[0000000010041408] = 00000000, %l1 = 00000000ffe90000
	ldstuba	[%i1+%o4]0x80,%l1	! %l1 = 00000000000000ff
!	%l1 = 0000000000000000, Mem[0000000010101438] = 59b9455e0000007b
	stx	%l1,[%i4+0x038]		! Mem[0000000010101438] = 0000000000000000
!	Mem[00000000300c1410] = 000000ff, %l3 = 00000000000000ff
	swapa	[%i3+%o5]0x89,%l3	! %l3 = 00000000000000ff
!	%l0 = 00000000, %l1 = 00000000, Mem[00000000300c1400] = 00000000 ff5a0000
	stda	%l0,[%i3+%g0]0x81	! Mem[00000000300c1400] = 00000000 00000000
!	%l0 = 00000000, %l1 = 00000000, Mem[0000000030081400] = 00000000 7b000000
	stda	%l0,[%i2+%g0]0x89	! Mem[0000000030081400] = 00000000 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010081414] = 000000ff, %l3 = 00000000000000ff
	ldsh	[%i2+0x016],%l3		! %l3 = 00000000000000ff

p0_label_253:
!	Mem[0000000010081404] = 000000ff, %l4 = 0000000000000000
	ldsha	[%i2+0x004]%asi,%l4	! %l4 = 0000000000000000
!	Mem[00000000300c1410] = ff000000, %f31 = 000000ff
	lda	[%i3+%o5]0x81,%f31	! %f31 = ff000000
	membar	#Sync			! Added by membar checker (37)
!	Mem[00000000300c1400] = 00000000 00000000 00000000 00000000
!	Mem[00000000300c1410] = ff000000 00000000 ff000000 0000000b
!	Mem[00000000300c1420] = 7db8a8fe 5af7ffff 6ddc7182 7487ff6b
!	Mem[00000000300c1430] = f3ffd15d e900d900 ffffffc6 d046c574
	ldda	[%i3]ASI_BLK_AIUS,%f0	! Block Load from 00000000300c1400
!	Mem[0000000030141410] = 00000000, %l3 = 00000000000000ff
	lduwa	[%i5+%o5]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000030001410] = 00000000, %l6 = 000000007b000000
	lduha	[%i0+%o5]0x81,%l6	! %l6 = 0000000000000000
!	%f26 = 00000000, Mem[00000000100c1410] = 00000000
	sta	%f26,[%i3+%o5]0x88	! Mem[00000000100c1410] = 00000000
!	Mem[0000000010101408] = ffff0000 fd0000ff, %l4 = 00000000, %l5 = 00006700
	ldda	[%i4+%o4]0x88,%l4	! %l4 = 00000000fd0000ff 00000000ffff0000
!	Mem[0000000030101408] = 0000000000000000, %l0 = 0000000000000000
	ldxa	[%i4+%o4]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000030081400] = 00000000, %l2 = 0000000000000000
	ldsha	[%i2+%g0]0x89,%l2	! %l2 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f24 = ffffffff 000000ff, Mem[0000000030101408] = 00000000 00000000
	stda	%f24,[%i4+%o4]0x81	! Mem[0000000030101408] = ffffffff 000000ff

p0_label_254:
!	%l7 = 0000000000000000, Mem[0000000030141408] = 0000000000000000
	stxa	%l7,[%i5+%o4]0x81	! Mem[0000000030141408] = 0000000000000000
!	%l7 = 0000000000000000, Mem[0000000010081408] = ff00000000000000
	stxa	%l7,[%i2+%o4]0x80	! Mem[0000000010081408] = 0000000000000000
!	%l2 = 0000000000000000, Mem[0000000010101428] = ffffffff
	sth	%l2,[%i4+0x028]		! Mem[0000000010101428] = 0000ffff
!	%f17 = 00000000, Mem[0000000030101410] = 000000ff
	sta	%f17,[%i4+%o5]0x89	! Mem[0000000030101410] = 00000000
!	%l3 = 0000000000000000, Mem[0000000030101408] = ffffffff000000ff
	stxa	%l3,[%i4+%o4]0x81	! Mem[0000000030101408] = 0000000000000000
!	%f24 = ffffffff 000000ff, %f24 = ffffffff 000000ff
	fxtod	%f24,%f24		! %f24 = c1efffff e0200000
!	Mem[0000000010081408] = 00000000, %l5 = 00000000ffff0000
	swapa	[%i2+%o4]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000010081434] = e873ee91, %l4 = fd0000ff, %l2 = 00000000
	add	%i2,0x34,%g1
	casa	[%g1]0x80,%l4,%l2	! %l2 = 00000000e873ee91
!	Mem[0000000010101408] = ff0000fd, %l0 = 0000000000000000
	ldstuba	[%i4+%o4]0x80,%l0	! %l0 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[000000001004141c] = 77749a38, %l7 = 0000000000000000
	ldsba	[%i1+0x01c]%asi,%l7	! %l7 = 0000000000000077

p0_label_255:
!	Mem[0000000030001408] = 00005aff, %l0 = 00000000000000ff
	lduba	[%i0+%o4]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[00000000201c0000] = ff008a5f, %l7 = 0000000000000077
	ldsha	[%o0+0x000]%asi,%l7	! %l7 = ffffffffffffff00
!	Mem[0000000010141408] = ffe90000, %l1 = 0000000000000000
	lduba	[%i5+%o4]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000030041410] = ffffffff000000ff, %f30 = 00000000 ff000000
	ldda	[%i1+%o5]0x81,%f30	! %f30 = ffffffff 000000ff
!	Mem[0000000010181414] = 00000000, %f20 = 00000000
	ld	[%i6+0x014],%f20	! %f20 = 00000000
!	%f22 = ffffc045 00000000, Mem[0000000010181400] = ff000000 ffffffff
	stda	%f22,[%i6+%g0]0x88	! Mem[0000000010181400] = ffffc045 00000000
!	Mem[0000000030081400] = 00000000, %l2 = 00000000e873ee91
	lduwa	[%i2+%g0]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000010101410] = 00ff0000, %l4 = 00000000fd0000ff
	ldsba	[%i4+%o5]0x80,%l4	! %l4 = 0000000000000000
!	Mem[00000000201c0000] = ff008a5f, %l3 = 0000000000000000
	ldsha	[%o0+0x000]%asi,%l3	! %l3 = ffffffffffffff00
!	Starting 10 instruction Store Burst
!	%l2 = 0000000000000000, Mem[0000000030101408] = 00000000
	stba	%l2,[%i4+%o4]0x89	! Mem[0000000030101408] = 00000000

p0_label_256:
!	%f30 = ffffffff 000000ff, Mem[0000000010101408] = fd0000ff ffff0000
	stda	%f30,[%i4+%o4]0x88	! Mem[0000000010101408] = ffffffff 000000ff
!	%l0 = 000000ff, %l1 = 00000000, Mem[00000000100c1438] = 1eb681c0 04ff7388
	std	%l0,[%i3+0x038]		! Mem[00000000100c1438] = 000000ff 00000000
!	%l5 = 0000000000000000, Mem[0000000030041400] = 000000ff
	stha	%l5,[%i1+%g0]0x89	! Mem[0000000030041400] = 00000000
!	%l2 = 0000000000000000, Mem[0000000010181400] = 0000000045c0ffff
	stx	%l2,[%i6+%g0]		! Mem[0000000010181400] = 0000000000000000
!	%l4 = 00000000, %l5 = 00000000, Mem[0000000030041408] = 000000ff 00000000
	stda	%l4,[%i1+%o4]0x81	! Mem[0000000030041408] = 00000000 00000000
!	%f30 = ffffffff 000000ff, %l6 = 0000000000000000
!	Mem[0000000010141438] = ffe90000ff000000
	add	%i5,0x038,%g1
	stda	%f30,[%g1+%l6]ASI_PST32_P ! Mem[0000000010141438] = ffe90000ff000000
!	Mem[0000000010101410] = 00ff0000, %l7 = ffffffffffffff00
	swapa	[%i4+%o5]0x80,%l7	! %l7 = 0000000000ff0000
!	%l4 = 0000000000000000, Mem[0000000010081408] = 0000ffff
	stba	%l4,[%i2+%o4]0x88	! Mem[0000000010081408] = 0000ff00
!	%l6 = 0000000000000000, Mem[0000000010081410] = 00ffffff
	stwa	%l6,[%i2+%o5]0x80	! Mem[0000000010081410] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = 000000ff, %l1 = 0000000000000000
	ldsba	[%i0+%g0]0x88,%l1	! %l1 = ffffffffffffffff

p0_label_257:
!	Mem[0000000010001400] = ff000000, %l2 = 0000000000000000
	lduha	[%i0+%g0]0x80,%l2	! %l2 = 000000000000ff00
!	Mem[0000000010081408] = 00ff0000, %l2 = 000000000000ff00
	ldsba	[%i2+%o4]0x80,%l2	! %l2 = 0000000000000000
!	Mem[00000000300c1400] = 0000000000000000, %f18 = 00000000 00000000
	ldda	[%i3+%g0]0x89,%f18	! %f18 = 00000000 00000000
!	Mem[0000000010141410] = fd000000ffffffff, %f12 = f3ffd15d e900d900
	ldda	[%i5+%o5]0x80,%f12	! %f12 = fd000000 ffffffff
!	Mem[0000000030001408] = ff5a0000, %l2 = 0000000000000000
	ldswa	[%i0+%o4]0x81,%l2	! %l2 = ffffffffff5a0000
!	Mem[0000000010101438] = 00000000, %f0  = 00000000
	ld	[%i4+0x038],%f0 	! %f0 = 00000000
!	Mem[0000000010101410] = 00ffffff, %l3 = ffffffffffffff00
	lduba	[%i4+%o5]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010001418] = ff00000000000000, %f6  = ff000000 0000000b
	ldd	[%i0+0x018],%f6 	! %f6  = ff000000 00000000
!	Mem[0000000010081408] = 0000ff00, %l6 = 0000000000000000
	ldsha	[%i2+%o4]0x88,%l6	! %l6 = ffffffffffffff00
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000000000, Mem[0000000030001400] = ff73ff4a
	stba	%l4,[%i0+%g0]0x81	! Mem[0000000030001400] = 0073ff4a

p0_label_258:
!	%f30 = ffffffff 000000ff, Mem[0000000030181408] = ffff0000 00fd0014
	stda	%f30,[%i6+%o4]0x81	! Mem[0000000030181408] = ffffffff 000000ff
!	Mem[0000000010001400] = ff000000, %l7 = 0000000000ff0000
	swapa	[%i0+%g0]0x80,%l7	! %l7 = 00000000ff000000
!	%f20 = 00000000 000000ff, %l4 = 0000000000000000
!	Mem[0000000030001408] = ff5a0000ffffffff
	add	%i0,0x008,%g1
	stda	%f20,[%g1+%l4]ASI_PST32_SL ! Mem[0000000030001408] = ff5a0000ffffffff
!	Mem[0000000010141428] = 00000000, %l0 = 00000000000000ff, %asi = 80
	swapa	[%i5+0x028]%asi,%l0	! %l0 = 0000000000000000
!	Mem[0000000010041410] = 00000000, %l4 = 0000000000000000
	swapa	[%i1+%o5]0x88,%l4	! %l4 = 0000000000000000
!	%f12 = fd000000 ffffffff, Mem[0000000030081410] = 000000ff 00000000
	stda	%f12,[%i2+%o5]0x89	! Mem[0000000030081410] = fd000000 ffffffff
!	Mem[0000000021800181] = f7ff6a88, %l6 = ffffffffffffff00
	ldstub	[%o3+0x181],%l6		! %l6 = 000000ff000000ff
!	%l5 = 0000000000000000, Mem[0000000010041408] = ff00000000000000
	stxa	%l5,[%i1+%o4]0x80	! Mem[0000000010041408] = 0000000000000000
!	Mem[0000000010181408] = 00000000, %l6 = 000000ff, %l5 = 00000000
	add	%i6,0x08,%g1
	casa	[%g1]0x80,%l6,%l5	! %l5 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = ffffffff, %l6 = 00000000000000ff
	lduha	[%i6+%o4]0x81,%l6	! %l6 = 000000000000ffff

p0_label_259:
!	Mem[0000000010001408] = 00000000, %l3 = 00000000000000ff
	ldsha	[%i0+%o4]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000010141410] = 000000fd, %l1 = ffffffffffffffff
	ldsba	[%i5+%o5]0x88,%l1	! %l1 = fffffffffffffffd
!	Mem[0000000010101410] = ffffff00, %l6 = 000000000000ffff
	ldsha	[%i4+%o5]0x80,%l6	! %l6 = ffffffffffffffff
!	Mem[00000000100c1410] = 00000000 0000ffff, %l0 = 00000000, %l1 = fffffffd
	ldda	[%i3+%o5]0x80,%l0	! %l0 = 0000000000000000 000000000000ffff
!	Mem[00000000300c1408] = 00000000, %l0 = 0000000000000000
	lduba	[%i3+%o4]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000010041404] = 00000000, %l0 = 0000000000000000
	ldsha	[%i1+0x004]%asi,%l0	! %l0 = 0000000000000000
!	Mem[000000001018143c] = 00000000, %l3 = 0000000000000000
	lduwa	[%i6+0x03c]%asi,%l3	! %l3 = 0000000000000000
!	Mem[00000000100c1400] = 000000ff, %l7 = 00000000ff000000
	ldswa	[%i3+%g0]0x80,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030001408] = ff5a0000, %l5 = 0000000000000000
	ldsba	[%i0+%o4]0x81,%l5	! %l5 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l5 = ffffffffffffffff, Mem[0000000030041408] = 00000000
	stha	%l5,[%i1+%o4]0x89	! Mem[0000000030041408] = 0000ffff

p0_label_260:
!	Mem[0000000010101410] = 00ffffff, %l2 = ffffffffff5a0000
	ldstuba	[%i4+%o5]0x88,%l2	! %l2 = 000000ff000000ff
!	Mem[0000000030081408] = 00000000, %l3 = 0000000000000000
	ldstuba	[%i2+%o4]0x81,%l3	! %l3 = 00000000000000ff
!	%f29 = 00000000, Mem[0000000010181424] = 000000ff
	sta	%f29,[%i6+0x024]%asi	! Mem[0000000010181424] = 00000000
!	%f6  = ff000000 00000000, Mem[0000000010101410] = ffffff00 00006700
	stda	%f6 ,[%i4+%o5]0x80	! Mem[0000000010101410] = ff000000 00000000
!	%f6  = ff000000 00000000, Mem[0000000010041408] = 00000000 00000000
	stda	%f6 ,[%i1+%o4]0x80	! Mem[0000000010041408] = ff000000 00000000
!	%f16 = ffffc045 00000000 00000000 00000000
!	%f20 = 00000000 000000ff ffffc045 00000000
!	%f24 = c1efffff e0200000 00000000 00000000
!	%f28 = ffffffff 00000000 ffffffff 000000ff
	stda	%f16,[%i0]ASI_BLK_PL	! Block Store to 0000000010001400
!	Mem[0000000030181408] = ffffffff, %l1 = 000000000000ffff
	ldstuba	[%i6+%o4]0x89,%l1	! %l1 = 000000ff000000ff
!	%f2  = 00000000 00000000, Mem[0000000030001408] = ff5a0000 ffffffff
	stda	%f2 ,[%i0+%o4]0x81	! Mem[0000000030001408] = 00000000 00000000
!	%l1 = 00000000000000ff, Mem[0000000020800040] = ff358327
	stb	%l1,[%o1+0x040]		! Mem[0000000020800040] = ff358327
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = 0000ffff, %l0 = 0000000000000000
	ldswa	[%i1+%o4]0x89,%l0	! %l0 = 000000000000ffff

p0_label_261:
!	Mem[00000000201c0000] = ff008a5f, %l6 = ffffffffffffffff
	ldsb	[%o0+0x001],%l6		! %l6 = 0000000000000000
!	Mem[0000000010101428] = 0000ffff, %l1 = 00000000000000ff
	ldsba	[%i4+0x02a]%asi,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010141420] = 89ff65f0, %l6 = 0000000000000000
	lduw	[%i5+0x020],%l6		! %l6 = 0000000089ff65f0
!	Mem[0000000030081410] = ffffffff, %l4 = 0000000000000000
	ldsba	[%i2+%o5]0x81,%l4	! %l4 = ffffffffffffffff
!	Mem[00000000201c0000] = ff008a5f, %l0 = 000000000000ffff
	ldsh	[%o0+%g0],%l0		! %l0 = ffffffffffffff00
!	Mem[0000000030001400] = ffff00004aff7300, %l6 = 0000000089ff65f0
	ldxa	[%i0+%g0]0x89,%l6	! %l6 = ffff00004aff7300
!	Mem[0000000030101408] = 00000000, %l1 = ffffffffffffffff
	lduba	[%i4+%o4]0x89,%l1	! %l1 = 0000000000000000
!	Mem[00000000300c1400] = 00000000, %l3 = 0000000000000000
	lduha	[%i3+%g0]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000010141408] = ffe90000, %l0 = ffffffffffffff00
	lduwa	[%i5+%o4]0x88,%l0	! %l0 = 00000000ffe90000
!	Starting 10 instruction Store Burst
!	Mem[0000000010141436] = 1db170c1, %l4 = ffffffffffffffff
	ldstuba	[%i5+0x036]%asi,%l4	! %l4 = 00000070000000ff

p0_label_262:
!	Mem[0000000010141408] = 0000e9ff, %l1 = 00000000, %l4 = 00000070
	add	%i5,0x08,%g1
	casa	[%g1]0x80,%l1,%l4	! %l4 = 000000000000e9ff
!	%l1 = 0000000000000000, Mem[0000000020800000] = ff005afb, %asi = 80
	stba	%l1,[%o1+0x000]%asi	! Mem[0000000020800000] = 00005afb
!	%l5 = ffffffffffffffff, Mem[00000000201c0000] = ff008a5f, %asi = 80
	stba	%l5,[%o0+0x000]%asi	! Mem[00000000201c0000] = ff008a5f
!	%l3 = 0000000000000000, Mem[00000000100c1400] = 5a000000ff000000
	stxa	%l3,[%i3+%g0]0x88	! Mem[00000000100c1400] = 0000000000000000
!	Mem[00000000100c1410] = 00000000, %l3 = 0000000000000000
	swapa	[%i3+%o5]0x80,%l3	! %l3 = 0000000000000000
!	%l3 = 0000000000000000, Mem[0000000030081400] = 00000000
	stba	%l3,[%i2+%g0]0x81	! Mem[0000000030081400] = 00000000
!	%l6 = ffff00004aff7300, Mem[000000001000140c] = 00000000
	stb	%l6,[%i0+0x00c]		! Mem[000000001000140c] = 00000000
!	%l3 = 0000000000000000, Mem[0000000030101410] = 00000000
	stha	%l3,[%i4+%o5]0x81	! Mem[0000000030101410] = 00000000
!	%f6  = ff000000 00000000, %l3 = 0000000000000000
!	Mem[0000000030041410] = ffffffff000000ff
	add	%i1,0x010,%g1
	stda	%f6,[%g1+%l3]ASI_PST8_S ! Mem[0000000030041410] = ffffffff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = 00000000, %f6  = ff000000
	lda	[%i5+%o5]0x81,%f6 	! %f6 = 00000000

p0_label_263:
!	Mem[00000000300c1410] = ff000000, %l1 = 0000000000000000
	ldsha	[%i3+%o5]0x81,%l1	! %l1 = ffffffffffffff00
!	Mem[00000000100c1400] = 0000000000000000, %l1 = ffffffffffffff00
	ldxa	[%i3+%g0]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010041400] = ff000000, %l0 = 00000000ffe90000
	lduwa	[%i1+%g0]0x88,%l0	! %l0 = 00000000ff000000
!	Mem[0000000020800040] = ff358327, %l0 = 00000000ff000000
	ldub	[%o1+0x041],%l0		! %l0 = 0000000000000035
!	Mem[0000000030041410] = ffffffff000000ff, %f14 = ffffffc6 d046c574
	ldda	[%i1+%o5]0x81,%f14	! %f14 = ffffffff 000000ff
!	Mem[0000000030041410] = ffffffff, %l7 = 00000000000000ff
	ldsha	[%i1+%o5]0x89,%l7	! %l7 = ffffffffffffffff
!	Mem[000000001014140c] = 45c0fd7b, %l7 = ffffffffffffffff
	ldsh	[%i5+0x00e],%l7		! %l7 = fffffffffffffd7b
!	Mem[0000000030181408] = ffffffff, %l1 = 0000000000000000
	lduwa	[%i6+%o4]0x81,%l1	! %l1 = 00000000ffffffff
!	Mem[00000000100c1420] = 7db8a8fe, %l0 = 0000000000000035
	lduba	[%i3+0x020]%asi,%l0	! %l0 = 000000000000007d
!	Starting 10 instruction Store Burst
!	%l3 = 0000000000000000, Mem[0000000010141410] = fd000000ffffffff
	stxa	%l3,[%i5+%o5]0x80	! Mem[0000000010141410] = 0000000000000000

p0_label_264:
!	%l4 = 000000000000e9ff, Mem[00000000211c0000] = ffff6217
	sth	%l4,[%o2+%g0]		! Mem[00000000211c0000] = e9ff6217
!	%f2  = 00000000 00000000, Mem[0000000010141400] = 7b000000 0000007b
	stda	%f2 ,[%i5+%g0]0x88	! Mem[0000000010141400] = 00000000 00000000
!	%l6 = 4aff7300, %l7 = fffffd7b, Mem[0000000010181410] = ffffffff 00000000
	stda	%l6,[%i6+%o5]0x80	! Mem[0000000010181410] = 4aff7300 fffffd7b
	membar	#Sync			! Added by membar checker (38)
!	Mem[0000000010001438] = ff000000, %l0 = 0000007d, %l3 = 00000000
	add	%i0,0x38,%g1
	casa	[%g1]0x80,%l0,%l3	! %l3 = 00000000ff000000
!	%l7 = fffffffffffffd7b, Mem[0000000030081408] = ff000000000000ff
	stxa	%l7,[%i2+%o4]0x89	! Mem[0000000030081408] = fffffffffffffd7b
!	%f18 = 00000000 00000000, Mem[0000000010141400] = 00000000 00000000
	stda	%f18,[%i5+%g0]0x80	! Mem[0000000010141400] = 00000000 00000000
!	Mem[000000001000140d] = 00000000, %l3 = 00000000ff000000
	ldstuba	[%i0+0x00d]%asi,%l3	! %l3 = 00000000000000ff
!	Mem[0000000020800001] = 00005afb, %l0 = 000000000000007d
	ldstuba	[%o1+0x001]%asi,%l0	! %l0 = 00000000000000ff
!	%f26 = 00000000 00000000, %l2 = 00000000000000ff
!	Mem[0000000030001408] = 0000000000000000
	add	%i0,0x008,%g1
	stda	%f26,[%g1+%l2]ASI_PST16_S ! Mem[0000000030001408] = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = 0000000000000000, %f4  = ff000000 00000000
	ldda	[%i0+%o5]0x89,%f4 	! %f4  = 00000000 00000000

p0_label_265:
!	Mem[0000000010141408] = ffe90000, %l1 = 00000000ffffffff
	ldsba	[%i5+%o4]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010181400] = 00000000, %l0 = 0000000000000000
	lduha	[%i6+%g0]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000010041408] = 00000000 000000ff, %l6 = 4aff7300, %l7 = fffffd7b
	ldda	[%i1+%o4]0x88,%l6	! %l6 = 00000000000000ff 0000000000000000
!	Mem[0000000010141404] = 00000000, %l5 = ffffffffffffffff
	ldsba	[%i5+0x006]%asi,%l5	! %l5 = 0000000000000000
!	Mem[0000000010081400] = 00000000, %l2 = 00000000000000ff
	lduba	[%i2+%g0]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000021800040] = 5af7c5e9, %l6 = 00000000000000ff
	lduha	[%o3+0x040]%asi,%l6	! %l6 = 0000000000005af7
!	Mem[0000000010141408] = 7bfdc045ffe90000, %f24 = c1efffff e0200000
	ldda	[%i5+%o4]0x88,%f24	! %f24 = 7bfdc045 ffe90000
!	Mem[00000000300c1400] = 00000000, %l2 = 0000000000000000
	lduba	[%i3+%g0]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000010081400] = 00000000, %l2 = 0000000000000000
	ldsha	[%i2+%g0]0x80,%l2	! %l2 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1410] = 00000000, %l0 = 0000000000000000
	ldstuba	[%i3+%o5]0x88,%l0	! %l0 = 00000000000000ff

p0_label_266:
!	%l5 = 0000000000000000, Mem[0000000010001408] = 00000000
	stba	%l5,[%i0+%o4]0x80	! Mem[0000000010001408] = 00000000
!	%l0 = 0000000000000000, Mem[0000000030181400] = ff000000
	stwa	%l0,[%i6+%g0]0x81	! Mem[0000000030181400] = 00000000
!	%l2 = 0000000000000000, Mem[00000000211c0000] = e9ff6217
	sth	%l2,[%o2+%g0]		! Mem[00000000211c0000] = 00006217
!	Mem[0000000010001408] = 00000000, %l6 = 0000000000005af7
	swapa	[%i0+%o4]0x88,%l6	! %l6 = 0000000000000000
!	%f6  = 00000000 00000000, %l2 = 0000000000000000
!	Mem[00000000100c1400] = 0000000000000000
	stda	%f6,[%i3+%l2]ASI_PST8_P ! Mem[00000000100c1400] = 0000000000000000
!	%f16 = ffffc045 00000000, Mem[0000000030141408] = 00000000 00000000
	stda	%f16,[%i5+%o4]0x89	! Mem[0000000030141408] = ffffc045 00000000
!	%l5 = 0000000000000000, Mem[0000000010101410] = 000000ff
	stba	%l5,[%i4+%o5]0x88	! Mem[0000000010101410] = 00000000
!	%l3 = 0000000000000000, Mem[0000000010081400] = 00000000
	stw	%l3,[%i2+%g0]		! Mem[0000000010081400] = 00000000
!	Mem[0000000030041410] = ffffffff, %l0 = 0000000000000000
	swapa	[%i1+%o5]0x89,%l0	! %l0 = 00000000ffffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001414] = 00000000, %l1 = 0000000000000000
	lduha	[%i0+0x016]%asi,%l1	! %l1 = 0000000000000000

p0_label_267:
!	Mem[000000001004141c] = 77749a38, %l3 = 0000000000000000
	lduw	[%i1+0x01c],%l3		! %l3 = 0000000077749a38
!	Mem[0000000030081410] = ffffffff, %l7 = 0000000000000000
	lduha	[%i2+%o5]0x81,%l7	! %l7 = 000000000000ffff
!	Mem[0000000010001400] = 00000000, %l3 = 0000000077749a38
	ldswa	[%i0+%g0]0x88,%l3	! %l3 = 0000000000000000
!	Mem[00000000300c1400] = 00000000 00000000, %l0 = ffffffff, %l1 = 00000000
	ldda	[%i3+%g0]0x89,%l0	! %l0 = 0000000000000000 0000000000000000
!	Mem[0000000010081438] = 0000000000000000, %f2  = 00000000 00000000
	ldda	[%i2+0x038]%asi,%f2 	! %f2  = 00000000 00000000
!	Mem[0000000030001408] = 00000000, %l7 = 000000000000ffff
	ldsha	[%i0+%o4]0x81,%l7	! %l7 = 0000000000000000
!	Mem[00000000100c1410] = 000000ff, %f14 = ffffffff
	lda	[%i3+%o5]0x88,%f14	! %f14 = 000000ff
!	Mem[0000000010141400] = 00000000, %l7 = 0000000000000000
	ldsha	[%i5+%g0]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000010181400] = 00000000, %l2 = 0000000000000000
	ldswa	[%i6+%g0]0x80,%l2	! %l2 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f20 = 00000000 000000ff, %l0 = 0000000000000000
!	Mem[0000000030041400] = 0000000000000000
	stda	%f20,[%i1+%l0]ASI_PST16_S ! Mem[0000000030041400] = 0000000000000000

p0_label_268:
!	Mem[00000000100c1410] = 000000ff, %l5 = 0000000000000000
	swapa	[%i3+%o5]0x88,%l5	! %l5 = 00000000000000ff
!	%f22 = ffffc045 00000000, Mem[00000000100c1430] = 91ee73e8 ff73ff4a
	stda	%f22,[%i3+0x030]%asi	! Mem[00000000100c1430] = ffffc045 00000000
!	Mem[0000000030101408] = 00000000, %l6 = 0000000000000000
	swapa	[%i4+%o4]0x89,%l6	! %l6 = 0000000000000000
!	%f16 = ffffc045 00000000, Mem[0000000010181410] = 0073ff4a 7bfdffff
	stda	%f16,[%i6+%o5]0x88	! Mem[0000000010181410] = ffffc045 00000000
!	%f24 = 7bfdc045, Mem[000000001008141c] = 00000000
	sta	%f24,[%i2+0x01c]%asi	! Mem[000000001008141c] = 7bfdc045
!	%l1 = 0000000000000000, Mem[0000000010101410] = 00000000
	stwa	%l1,[%i4+%o5]0x88	! Mem[0000000010101410] = 00000000
!	%f2  = 00000000 00000000, %l1 = 0000000000000000
!	Mem[0000000010181420] = 0000007100000000
	add	%i6,0x020,%g1
	stda	%f2,[%g1+%l1]ASI_PST32_PL ! Mem[0000000010181420] = 0000007100000000
!	%l6 = 0000000000000000, Mem[0000000010041400] = 000000ff
	stba	%l6,[%i1+%g0]0x80	! Mem[0000000010041400] = 000000ff
!	Mem[0000000010001410] = 000000ff, %l1 = 0000000000000000
	ldstuba	[%i0+%o5]0x88,%l1	! %l1 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c141c] = 00ff006b, %l0 = 0000000000000000
	ldswa	[%i3+0x01c]%asi,%l0	! %l0 = 0000000000ff006b

p0_label_269:
!	%l6 = 0000000000000000, %l5 = 00000000000000ff, %l2 = 0000000000000000
	subc	%l6,%l5,%l2		! %l2 = ffffffffffffff01
!	Mem[0000000010081408] = 00ff0000, %l6 = 0000000000000000
	lduw	[%i2+%o4],%l6		! %l6 = 0000000000ff0000
!	Mem[0000000010101400] = 0000000000000000, %l1 = 00000000000000ff
	ldxa	[%i4+0x000]%asi,%l1	! %l1 = 0000000000000000
!	Mem[00000000300c1408] = 00000000, %l2 = ffffffffffffff01
	lduwa	[%i3+%o4]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000030141410] = 00000000 ff000000, %l0 = 00ff006b, %l1 = 00000000
	ldda	[%i5+%o5]0x81,%l0	! %l0 = 0000000000000000 00000000ff000000
!	Mem[0000000010041430] = a2d90de9, %l1 = 00000000ff000000
	lduba	[%i1+0x032]%asi,%l1	! %l1 = 000000000000000d
!	Mem[0000000030141408] = 00000000, %l6 = 0000000000ff0000
	ldsba	[%i5+%o4]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000010101404] = 00000000, %l5 = 00000000000000ff
	lduh	[%i4+0x004],%l5		! %l5 = 0000000000000000
!	Mem[0000000010101408] = ff000000, %l5 = 0000000000000000
	ldsba	[%i4+%o4]0x80,%l5	! %l5 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l0 = 0000000000000000, Mem[0000000010181438] = 00000000, %asi = 80
	stwa	%l0,[%i6+0x038]%asi	! Mem[0000000010181438] = 00000000

p0_label_270:
!	%l4 = 000000000000e9ff, Mem[00000000300c1400] = 00000000
	stha	%l4,[%i3+%g0]0x81	! Mem[00000000300c1400] = e9ff0000
!	Mem[0000000010181429] = 73e000ff, %l0 = 0000000000000000
	ldstuba	[%i6+0x029]%asi,%l0	! %l0 = 000000e0000000ff
!	%f19 = 00000000, Mem[0000000030041408] = ffff0000
	sta	%f19,[%i1+%o4]0x81	! Mem[0000000030041408] = 00000000
!	%l7 = 0000000000000000, Mem[0000000030181408] = ffffffff
	stwa	%l7,[%i6+%o4]0x89	! Mem[0000000030181408] = 00000000
!	%l4 = 000000000000e9ff, Mem[0000000010141400] = 00000000
	stba	%l4,[%i5+%g0]0x80	! Mem[0000000010141400] = ff000000
!	%f2  = 00000000 00000000, Mem[00000000100c1410] = 00000000 ffff0000
	stda	%f2 ,[%i3+%o5]0x88	! Mem[00000000100c1410] = 00000000 00000000
!	Mem[00000000211c0001] = 00006217, %l6 = 0000000000000000
	ldstub	[%o2+0x001],%l6		! %l6 = 00000000000000ff
!	%l3 = 0000000000000000, Mem[0000000010081408] = 00ff000000000000
	stxa	%l3,[%i2+%o4]0x80	! Mem[0000000010081408] = 0000000000000000
!	%l0 = 000000e0, %l1 = 0000000d, Mem[0000000030141400] = 00000000 ff000000
	stda	%l0,[%i5+%g0]0x89	! Mem[0000000030141400] = 000000e0 0000000d
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1430] = ffffc045, %l6 = 0000000000000000
	lduha	[%i3+0x030]%asi,%l6	! %l6 = 000000000000ffff

p0_label_271:
!	Mem[0000000030081408] = 7bfdffff, %l5 = ffffffffffffffff
	ldswa	[%i2+%o4]0x81,%l5	! %l5 = 000000007bfdffff
!	%l0 = 00000000000000e0, immed = 00000d0e, %y  = 0000006f
	smul	%l0,0xd0e,%l7		! %l7 = 00000000000b6c40, %y = 00000000
!	Mem[0000000010181408] = 00000000, %l6 = 000000000000ffff
	lduha	[%i6+%o4]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000010181408] = 0000000000000000, %f24 = 7bfdc045 ffe90000
	ldda	[%i6+%o4]0x88,%f24	! %f24 = 00000000 00000000
!	Mem[0000000010101408] = ff000000, %f10 = 6ddc7182
	lda	[%i4+%o4]0x80,%f10	! %f10 = ff000000
!	Mem[00000000218001c0] = 4cbe7723, %l7 = 00000000000b6c40
	ldub	[%o3+0x1c0],%l7		! %l7 = 000000000000004c
!	Mem[0000000010181400] = 0000000000000000, %f30 = ffffffff 000000ff
	ldda	[%i6+%g0]0x80,%f30	! %f30 = 00000000 00000000
!	Mem[0000000030041410] = 00000000, %l5 = 000000007bfdffff
	ldsba	[%i1+%o5]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000010081410] = 00000000, %l6 = 0000000000000000
	lduha	[%i2+%o5]0x88,%l6	! %l6 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010001408] = f75a0000, %l2 = 0000000000000000
	swapa	[%i0+%o4]0x80,%l2	! %l2 = 00000000f75a0000

p0_label_272:
!	Mem[0000000010181411] = 00000000, %l3 = 0000000000000000
	ldstub	[%i6+0x011],%l3		! %l3 = 00000000000000ff
!	%l3 = 0000000000000000, Mem[00000000300c1408] = 00000000
	stba	%l3,[%i3+%o4]0x89	! Mem[00000000300c1408] = 00000000
!	%l0 = 00000000000000e0, Mem[00000000211c0000] = 00ff6217, %asi = 80
	stha	%l0,[%o2+0x000]%asi	! Mem[00000000211c0000] = 00e06217
!	%f10 = ff000000 7487ff6b, Mem[0000000010141400] = 000000ff 00000000
	stda	%f10,[%i5+%g0]0x88	! Mem[0000000010141400] = ff000000 7487ff6b
!	Mem[0000000010041400] = 000000ff, %l3 = 0000000000000000
	swapa	[%i1+%g0]0x80,%l3	! %l3 = 00000000000000ff
!	Mem[00000000300c1408] = 00000000, %l2 = 00000000f75a0000
	ldstuba	[%i3+%o4]0x81,%l2	! %l2 = 00000000000000ff
!	%l6 = 0000000000000000, Mem[0000000010001400] = 00000000
	stba	%l6,[%i0+%g0]0x88	! Mem[0000000010001400] = 00000000
!	%l0 = 00000000000000e0, Mem[0000000030141410] = 00000000
	stha	%l0,[%i5+%o5]0x89	! Mem[0000000030141410] = 000000e0
!	%l2 = 00000000, %l3 = 000000ff, Mem[0000000010041408] = 000000ff 00000000
	stda	%l2,[%i1+%o4]0x88	! Mem[0000000010041408] = 00000000 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = 00000000, %l3 = 00000000000000ff
	lduwa	[%i1+%g0]0x81,%l3	! %l3 = 0000000000000000

p0_label_273:
!	Mem[0000000010101428] = 0000ffff, %l0 = 00000000000000e0
	lduha	[%i4+0x028]%asi,%l0	! %l0 = 0000000000000000
!	Mem[0000000030081410] = ffffffff, %l4 = 000000000000e9ff
	lduha	[%i2+%o5]0x89,%l4	! %l4 = 000000000000ffff
!	Mem[0000000010141404] = 000000ff, %l1 = 000000000000000d
	ldsb	[%i5+0x005],%l1		! %l1 = 0000000000000000
!	Mem[00000000100c143c] = 00000000, %f31 = 00000000
	ld	[%i3+0x03c],%f31	! %f31 = 00000000
!	Mem[0000000030041408] = 00000000, %l4 = 000000000000ffff
	ldsba	[%i1+%o4]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000010141400] = 6bff8774, %l3 = 0000000000000000
	lduwa	[%i5+%g0]0x80,%l3	! %l3 = 000000006bff8774
!	Mem[0000000030041410] = 00000000, %l7 = 000000000000004c
	lduba	[%i1+%o5]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000030001400] = 4aff7300, %l5 = 0000000000000000
	lduha	[%i0+%g0]0x89,%l5	! %l5 = 0000000000007300
!	Mem[0000000030041408] = 00000000, %f3  = 00000000
	lda	[%i1+%o4]0x89,%f3 	! %f3 = 00000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030101400] = c08100ff, %l2 = 0000000000000000
	ldstuba	[%i4+%g0]0x89,%l2	! %l2 = 000000ff000000ff

p0_label_274:
!	%l0 = 0000000000000000, Mem[0000000010041431] = a2d90de9
	stb	%l0,[%i1+0x031]		! Mem[0000000010041430] = a2000de9
!	Mem[0000000010041430] = a2000de9, %l2 = 00000000000000ff
	swap	[%i1+0x030],%l2		! %l2 = 00000000a2000de9
!	%l3 = 000000006bff8774, Mem[0000000010101400] = 00000000
	stha	%l3,[%i4+%g0]0x80	! Mem[0000000010101400] = 87740000
!	Mem[0000000010041410] = 00000000, %l6 = 0000000000000000
	ldstuba	[%i1+%o5]0x88,%l6	! %l6 = 00000000000000ff
!	%l2 = 00000000a2000de9, Mem[0000000010001410] = 00000000000000ff
	stxa	%l2,[%i0+%o5]0x88	! Mem[0000000010001410] = 00000000a2000de9
!	Mem[0000000010141408] = 0000e9ff, %l5 = 0000000000007300
	swapa	[%i5+%o4]0x80,%l5	! %l5 = 000000000000e9ff
!	%l7 = 0000000000000000, Mem[0000000021800000] = ffffe2e2
	stb	%l7,[%o3+%g0]		! Mem[0000000021800000] = 00ffe2e2
!	Mem[0000000010001400] = 00000000, %l4 = 0000000000000000
	swapa	[%i0+%g0]0x88,%l4	! %l4 = 0000000000000000
!	%f24 = 00000000 00000000, Mem[0000000010041410] = ff000000 45c0ffff
	stda	%f24,[%i1+%o5]0x80	! Mem[0000000010041410] = 00000000 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = 00000000, %l1 = 0000000000000000
	lduwa	[%i0+%o4]0x80,%l1	! %l1 = 0000000000000000

p0_label_275:
!	Mem[0000000030181408] = 00000000, %l6 = 0000000000000000
	lduha	[%i6+%o4]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000030181400] = 0000000000000000, %l0 = 0000000000000000
	ldxa	[%i6+%g0]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000010041408] = 00000000, %l7 = 0000000000000000
	lduba	[%i1+%o4]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000030081400] = 00000000, %l0 = 0000000000000000
	ldsba	[%i2+%g0]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000030041408] = 0000000000000000, %f16 = ffffc045 00000000
	ldda	[%i1+%o4]0x89,%f16	! %f16 = 00000000 00000000
!	Mem[000000001000141c] = 45c0ffff, %f4  = 00000000
	ld	[%i0+0x01c],%f4 	! %f4 = 45c0ffff
!	Mem[0000000010001400] = ffffc04500000000, %f28 = ffffffff 00000000
	ldda	[%i0+%g0]0x88,%f28	! %f28 = ffffc045 00000000
!	Mem[0000000030041400] = 00000000, %l6 = 0000000000000000
	ldswa	[%i1+%g0]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000010081410] = 00000000, %l3 = 000000006bff8774
	lduha	[%i2+%o5]0x80,%l3	! %l3 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l2 = a2000de9, %l3 = 00000000, Mem[0000000010001400] = 00000000 ffffc045
	stda	%l2,[%i0+%g0]0x88	! Mem[0000000010001400] = a2000de9 00000000

p0_label_276:
!	Mem[0000000010101400] = 87740000, %l0 = 0000000000000000
	ldstuba	[%i4+%g0]0x80,%l0	! %l0 = 00000087000000ff
!	%f4  = 45c0ffff, Mem[0000000030001410] = 00000000
	sta	%f4 ,[%i0+%o5]0x89	! Mem[0000000030001410] = 45c0ffff
!	%l3 = 0000000000000000, Mem[0000000030141408] = 00000000
	stha	%l3,[%i5+%o4]0x89	! Mem[0000000030141408] = 00000000
!	%l6 = 00000000, %l7 = 00000000, Mem[0000000010041428] = ffffffff 00000000
	stda	%l6,[%i1+0x028]%asi	! Mem[0000000010041428] = 00000000 00000000
!	%f24 = 00000000 00000000, Mem[00000000300c1408] = 000000ff 00000000
	stda	%f24,[%i3+%o4]0x89	! Mem[00000000300c1408] = 00000000 00000000
!	%f30 = 00000000, Mem[0000000030181400] = 00000000
	sta	%f30,[%i6+%g0]0x81	! Mem[0000000030181400] = 00000000
!	%l3 = 0000000000000000, Mem[0000000010081408] = 0000000000000000
	stxa	%l3,[%i2+%o4]0x80	! Mem[0000000010081408] = 0000000000000000
!	%l0 = 0000000000000087, Mem[0000000010041400] = 00000000
	stba	%l0,[%i1+%g0]0x88	! Mem[0000000010041400] = 00000087
!	Mem[000000001004140f] = ff000000, %l3 = 0000000000000000
	ldstuba	[%i1+0x00f]%asi,%l3	! %l3 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = 000000ff, %l4 = 0000000000000000
	ldswa	[%i4+%o4]0x88,%l4	! %l4 = 00000000000000ff

p0_label_277:
!	Mem[00000000201c0000] = ff008a5f, %l2 = 00000000a2000de9
	ldsha	[%o0+0x000]%asi,%l2	! %l2 = ffffffffffffff00
!	Mem[0000000010141408] = 00730000, %l2 = ffffffffffffff00
	ldsha	[%i5+%o4]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000030181408] = 00000000, %l0 = 0000000000000087
	ldsba	[%i6+%o4]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000010001404] = 00000000, %l2 = 0000000000000000
	ldsw	[%i0+0x004],%l2		! %l2 = 0000000000000000
!	Mem[00000000300c1408] = 0000000000000000, %f12 = fd000000 ffffffff
	ldda	[%i3+%o4]0x81,%f12	! %f12 = 00000000 00000000
!	Mem[0000000010041400] = 00000087, %l1 = 0000000000000000
	ldsha	[%i1+%g0]0x88,%l1	! %l1 = 0000000000000087
!	Mem[0000000010001410] = e90d00a200000000, %f14 = 000000ff 000000ff
	ldda	[%i0+%o5]0x80,%f14	! %f14 = e90d00a2 00000000
!	Mem[0000000030041410] = 00000000, %l4 = 00000000000000ff
	lduha	[%i1+%o5]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000010141410] = 00000000, %f31 = 00000000
	lda	[%i5+%o5]0x88,%f31	! %f31 = 00000000
!	Starting 10 instruction Store Burst
!	%f18 = 00000000 00000000, %l3 = 0000000000000000
!	Mem[0000000010101420] = 7b00000000000000
	add	%i4,0x020,%g1
	stda	%f18,[%g1+%l3]ASI_PST32_PL ! Mem[0000000010101420] = 7b00000000000000

p0_label_278:
!	%l4 = 0000000000000000, Mem[0000000010041400] = 87000000
	stba	%l4,[%i1+%g0]0x80	! Mem[0000000010041400] = 00000000
!	%l4 = 0000000000000000, Mem[0000000010041410] = 00000000
	stwa	%l4,[%i1+%o5]0x88	! Mem[0000000010041410] = 00000000
!	Mem[0000000020800000] = 00ff5afb, %l0 = 0000000000000000
	ldstub	[%o1+%g0],%l0		! %l0 = 00000000000000ff
!	Mem[0000000010101417] = 00000000, %l6 = 0000000000000000
	ldstuba	[%i4+0x017]%asi,%l6	! %l6 = 00000000000000ff
!	%l5 = 000000000000e9ff, Mem[00000000300c1400] = e9ff0000
	stba	%l5,[%i3+%g0]0x81	! Mem[00000000300c1400] = ffff0000
!	%l7 = 0000000000000000, Mem[00000000211c0000] = 00e06217, %asi = 80
	stha	%l7,[%o2+0x000]%asi	! Mem[00000000211c0000] = 00006217
!	%l1 = 0000000000000087, Mem[0000000010041410] = 0000000000000000
	stxa	%l1,[%i1+%o5]0x80	! Mem[0000000010041410] = 0000000000000087
!	Mem[0000000010081438] = 0000000000000000, %l0 = 0000000000000000, %l5 = 000000000000e9ff
	add	%i2,0x38,%g1
	casxa	[%g1]0x80,%l0,%l5	! %l5 = 0000000000000000
!	%f9  = 5af7ffff, Mem[0000000010001408] = 00000000
	sta	%f9 ,[%i0+%o4]0x80	! Mem[0000000010001408] = 5af7ffff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = 00000000, %f13 = 00000000
	lda	[%i6+%g0]0x80,%f13	! %f13 = 00000000

p0_label_279:
!	Mem[0000000010001428] = 00000000, %l6 = 0000000000000000
	ldsha	[%i0+0x02a]%asi,%l6	! %l6 = 0000000000000000
!	Mem[0000000030141408] = 00000000, %l2 = 0000000000000000
	lduha	[%i5+%o4]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000010081420] = 00000000 0000ff00, %l0 = 00000000, %l1 = 00000087
	ldd	[%i2+0x020],%l0		! %l0 = 0000000000000000 000000000000ff00
!	Mem[00000000100c1400] = 00000000, %l0 = 0000000000000000
	swapa	[%i3+%g0]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000010041438] = 00000000, %l6 = 0000000000000000
	lduba	[%i1+0x038]%asi,%l6	! %l6 = 0000000000000000
!	Mem[0000000010041404] = 00000000, %l2 = 0000000000000000
	lduw	[%i1+0x004],%l2		! %l2 = 0000000000000000
!	Mem[0000000010041408] = 00000000, %l1 = 000000000000ff00
	ldswa	[%i1+%o4]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010041400] = 00000000, %l4 = 0000000000000000
	ldswa	[%i1+%g0]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000030181400] = 0000000000000000, %l6 = 0000000000000000
	ldxa	[%i6+%g0]0x81,%l6	! %l6 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l5 = 0000000000000000, Mem[0000000010141414] = 00000000
	stw	%l5,[%i5+0x014]		! Mem[0000000010141414] = 00000000

p0_label_280:
!	%f1  = 00000000, Mem[0000000030101410] = 00000000
	sta	%f1 ,[%i4+%o5]0x89	! Mem[0000000030101410] = 00000000
!	%l2 = 00000000, %l3 = 00000000, Mem[0000000030041408] = 00000000 00000000
	stda	%l2,[%i1+%o4]0x89	! Mem[0000000030041408] = 00000000 00000000
!	%l6 = 0000000000000000, Mem[0000000030141400] = 000000e0
	stwa	%l6,[%i5+%g0]0x89	! Mem[0000000030141400] = 00000000
!	%l1 = 0000000000000000, Mem[0000000030081408] = 7bfdffff
	stwa	%l1,[%i2+%o4]0x81	! Mem[0000000030081408] = 00000000
!	%l2 = 00000000, %l3 = 00000000, Mem[0000000010041410] = 00000000 00000087
	stda	%l2,[%i1+%o5]0x80	! Mem[0000000010041410] = 00000000 00000000
!	%l5 = 0000000000000000, Mem[0000000010141400] = 7487ff6b
	stha	%l5,[%i5+%g0]0x88	! Mem[0000000010141400] = 74870000
!	Mem[00000000201c0001] = ff008a5f, %l1 = 0000000000000000
	ldstub	[%o0+0x001],%l1		! %l1 = 00000000000000ff
!	%l2 = 00000000, %l3 = 00000000, Mem[0000000010181408] = 00000000 00000000
	stda	%l2,[%i6+%o4]0x88	! Mem[0000000010181408] = 00000000 00000000
!	%f2  = 00000000, Mem[00000000100c1400] = 00000000
	sta	%f2 ,[%i3+%g0]0x88	! Mem[00000000100c1400] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = 00000000, %l5 = 0000000000000000
	ldswa	[%i3+%o4]0x80,%l5	! %l5 = 0000000000000000

p0_label_281:
!	Mem[0000000030101408] = 00000000, %l4 = 0000000000000000
	lduha	[%i4+%o4]0x81,%l4	! %l4 = 0000000000000000
!	Mem[00000000100c1400] = 0000000000000000, %f30 = 00000000 00000000
	ldda	[%i3+%g0]0x80,%f30	! %f30 = 00000000 00000000
!	Mem[0000000010181408] = 0000000000000000, %l2 = 0000000000000000
	ldxa	[%i6+0x008]%asi,%l2	! %l2 = 0000000000000000
!	Mem[0000000010041408] = ff0000ff00000000, %f6  = 00000000 00000000
	ldda	[%i1+%o4]0x88,%f6 	! %f6  = ff0000ff 00000000
!	Mem[00000000100c1430] = ffffc045, %l1 = 0000000000000000
	ldsba	[%i3+0x032]%asi,%l1	! %l1 = ffffffffffffffc0
!	Mem[0000000010001400] = a2000de9, %l5 = 0000000000000000
	lduwa	[%i0+%g0]0x88,%l5	! %l5 = 00000000a2000de9
!	Mem[0000000010081408] = 00000000, %l6 = 0000000000000000
	lduwa	[%i2+%o4]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000010081438] = 000000000000e9ff, %f28 = ffffc045 00000000
	ldd	[%i2+0x038],%f28	! %f28 = 00000000 0000e9ff
!	Mem[0000000010081408] = 00000000, %l0 = 0000000000000000
	lduwa	[%i2+%o4]0x80,%l0	! %l0 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030001410] = ffffc045, %l2 = 0000000000000000
	ldstuba	[%i0+%o5]0x81,%l2	! %l2 = 000000ff000000ff

p0_label_282:
!	Mem[0000000030181408] = 00000000, %l3 = 0000000000000000
	swapa	[%i6+%o4]0x89,%l3	! %l3 = 0000000000000000
!	%l6 = 00000000, %l7 = 00000000, Mem[0000000010141400] = 74870000 ff000000
	stda	%l6,[%i5+%g0]0x88	! Mem[0000000010141400] = 00000000 00000000
!	%l1 = ffffffffffffffc0, Mem[0000000010081410] = 00000000
	stha	%l1,[%i2+%o5]0x80	! Mem[0000000010081410] = ffc00000
!	Mem[0000000010041410] = 00000000, %l3 = 0000000000000000
	swapa	[%i1+%o5]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000030001400] = 0073ff4a, %l2 = 00000000000000ff
	swapa	[%i0+%g0]0x81,%l2	! %l2 = 000000000073ff4a
!	%l0 = 0000000000000000, Mem[0000000010181410] = 00ff000045c0ffff
	stxa	%l0,[%i6+%o5]0x80	! Mem[0000000010181410] = 0000000000000000
!	Mem[0000000030041408] = 00000000, %l2 = 000000000073ff4a
	swapa	[%i1+%o4]0x81,%l2	! %l2 = 0000000000000000
!	%f16 = 00000000 00000000 00000000 00000000
!	%f20 = 00000000 000000ff ffffc045 00000000
!	%f24 = 00000000 00000000 00000000 00000000
!	%f28 = 00000000 0000e9ff 00000000 00000000
	stda	%f16,[%i1]ASI_BLK_AIUP	! Block Store to 0000000010041400
!	Mem[0000000030081400] = 00000000, %l3 = 0000000000000000
	ldstuba	[%i2+%g0]0x81,%l3	! %l3 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = 00000000, %l2 = 0000000000000000
	lduwa	[%i3+%o5]0x88,%l2	! %l2 = 0000000000000000

p0_label_283:
!	Mem[0000000010141438] = ffe90000ff000000, %l5 = 00000000a2000de9
	ldxa	[%i5+0x038]%asi,%l5	! %l5 = ffe90000ff000000
!	Mem[0000000030181400] = 0000000000000000, %f8  = 7db8a8fe 5af7ffff
	ldda	[%i6+%g0]0x81,%f8 	! %f8  = 00000000 00000000
	membar	#Sync			! Added by membar checker (39)
!	Mem[0000000010041400] = 0000000000000000, %l2 = 0000000000000000
	ldxa	[%i1+%g0]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000030101408] = 00000000, %l7 = 0000000000000000
	ldsba	[%i4+%o4]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000010041408] = 00000000, %l7 = 0000000000000000
	lduba	[%i1+%o4]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000010181408] = 00000000, %l1 = ffffffffffffffc0
	ldsha	[%i6+%o4]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000030181400] = 00000000 00000000, %l4 = 00000000, %l5 = ff000000
	ldda	[%i6+%g0]0x81,%l4	! %l4 = 0000000000000000 0000000000000000
!	%f0  = 00000000, Mem[00000000100c141c] = 00ff006b
	sta	%f0 ,[%i3+0x01c]%asi	! Mem[00000000100c141c] = 00000000
!	Mem[0000000030001410] = 0000000045c0ffff, %f10 = ff000000 7487ff6b
	ldda	[%i0+%o5]0x89,%f10	! %f10 = 00000000 45c0ffff
!	Starting 10 instruction Store Burst
!	%l0 = 0000000000000000, Mem[0000000030141408] = 00000000
	stwa	%l0,[%i5+%o4]0x81	! Mem[0000000030141408] = 00000000

p0_label_284:
!	%l0 = 00000000, %l1 = 00000000, Mem[00000000300c1410] = ff000000 00000000
	stda	%l0,[%i3+%o5]0x81	! Mem[00000000300c1410] = 00000000 00000000
!	%l3 = 0000000000000000, Mem[0000000010041408] = 00000000
	stha	%l3,[%i1+%o4]0x88	! Mem[0000000010041408] = 00000000
!	%l6 = 0000000000000000, Mem[0000000030141400] = 0000000d00000000
	stxa	%l6,[%i5+%g0]0x89	! Mem[0000000030141400] = 0000000000000000
!	Mem[0000000030181410] = 0000ff00, %l6 = 0000000000000000
	swapa	[%i6+%o5]0x89,%l6	! %l6 = 000000000000ff00
!	%f4  = 45c0ffff 00000000, %l3 = 0000000000000000
!	Mem[0000000010081418] = ff0000007bfdc045
	add	%i2,0x018,%g1
	stda	%f4,[%g1+%l3]ASI_PST16_P ! Mem[0000000010081418] = ff0000007bfdc045
!	%l1 = 0000000000000000, Mem[00000000100c1400] = 0000000000000000
	stxa	%l1,[%i3+%g0]0x88	! Mem[00000000100c1400] = 0000000000000000
!	%l0 = 0000000000000000, Mem[0000000010101438] = 00000000
	stw	%l0,[%i4+0x038]		! Mem[0000000010101438] = 00000000
!	%f16 = 00000000 00000000, Mem[00000000300c1410] = 00000000 00000000
	stda	%f16,[%i3+%o5]0x81	! Mem[00000000300c1410] = 00000000 00000000
!	Mem[0000000010141408] = 00730000, %l5 = 0000000000000000
	ldstuba	[%i5+%o4]0x88,%l5	! %l5 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = 00000000, %l7 = 0000000000000000
	lduba	[%i5+%g0]0x80,%l7	! %l7 = 0000000000000000

p0_label_285:
!	Mem[00000000300c1410] = 00000000, %l5 = 0000000000000000
	lduba	[%i3+%o5]0x81,%l5	! %l5 = 0000000000000000
!	Mem[00000000300c1400] = 0000ffff, %l1 = 0000000000000000
	lduwa	[%i3+%g0]0x89,%l1	! %l1 = 000000000000ffff
!	Mem[0000000030001408] = 00000000, %l7 = 0000000000000000
	ldswa	[%i0+%o4]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000010041410] = 00000000, %l1 = 000000000000ffff
	lduba	[%i1+%o5]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000030101408] = 00000000 00000000, %l6 = 0000ff00, %l7 = 00000000
	ldda	[%i4+%o4]0x89,%l6	! %l6 = 0000000000000000 0000000000000000
!	Mem[0000000010041400] = 00000000, %l4 = 0000000000000000
	ldswa	[%i1+%g0]0x80,%l4	! %l4 = 0000000000000000
!	Mem[00000000300c1400] = 0000ffff, %l7 = 0000000000000000
	ldsha	[%i3+%g0]0x89,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010041400] = 00000000, %l1 = 0000000000000000
	lduha	[%i1+%g0]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010041400] = 00000000, %l6 = 0000000000000000
	lduwa	[%i1+%g0]0x88,%l6	! %l6 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f6  = ff0000ff 00000000, Mem[0000000010181408] = 00000000 00000000
	stda	%f6 ,[%i6+%o4]0x80	! Mem[0000000010181408] = ff0000ff 00000000

p0_label_286:
!	Mem[0000000010081400] = 00000000, %l5 = 0000000000000000
	ldstuba	[%i2+%g0]0x80,%l5	! %l5 = 00000000000000ff
!	%l4 = 0000000000000000, Mem[00000000201c0000] = ffff8a5f
	stb	%l4,[%o0+%g0]		! Mem[00000000201c0000] = 00ff8a5f
!	%l3 = 0000000000000000, Mem[0000000010181408] = ff0000ff
	stha	%l3,[%i6+%o4]0x80	! Mem[0000000010181408] = 000000ff
!	%f19 = 00000000, Mem[00000000100c1400] = 00000000
	sta	%f19,[%i3+%g0]0x88	! Mem[00000000100c1400] = 00000000
!	%l6 = 0000000000000000, Mem[0000000030141410] = 000000ff000000e0
	stxa	%l6,[%i5+%o5]0x89	! Mem[0000000030141410] = 0000000000000000
!	%l0 = 00000000, %l1 = 00000000, Mem[00000000100c1400] = 00000000 00000000
	stda	%l0,[%i3+%g0]0x88	! Mem[00000000100c1400] = 00000000 00000000
!	Mem[0000000030041408] = 0073ff4a, %l0 = 0000000000000000
	swapa	[%i1+%o4]0x81,%l0	! %l0 = 000000000073ff4a
!	Mem[0000000010181410] = 00000000, %l7 = ffffffffffffffff
	swapa	[%i6+%o5]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000030041408] = 00000000, %l2 = 0000000000000000
	ldstuba	[%i1+%o4]0x81,%l2	! %l2 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030081410] = ffffffff, %l1 = 0000000000000000
	lduha	[%i2+%o5]0x89,%l1	! %l1 = 000000000000ffff

p0_label_287:
!	Mem[0000000030101408] = 00000000, %l4 = 0000000000000000
	ldsha	[%i4+%o4]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000030001400] = 000000ff, %f18 = 00000000
	lda	[%i0+%g0]0x81,%f18	! %f18 = 000000ff
	membar	#Sync			! Added by membar checker (40)
!	Mem[00000000100c1400] = 00000000 00000000 00000000 45c0fdff
!	Mem[00000000100c1410] = 00000000 00000000 e300ffff 00000000
!	Mem[00000000100c1420] = 7db8a8fe 14ff7179 ccff8168 0000005a
!	Mem[00000000100c1430] = ffffc045 00000000 000000ff 00000000
	ldda	[%i3]ASI_BLK_AIUPL,%f16	! Block Load from 00000000100c1400
!	Mem[00000000211c0000] = 00006217, %l1 = 000000000000ffff
	ldub	[%o2+%g0],%l1		! %l1 = 0000000000000000
!	Mem[0000000030041400] = 00000000 00000000, %l4 = 00000000, %l5 = 00000000
	ldda	[%i1+%g0]0x81,%l4	! %l4 = 0000000000000000 0000000000000000
!	Mem[0000000030181400] = 0000000000000000, %f12 = 00000000 00000000
	ldda	[%i6+%g0]0x81,%f12	! %f12 = 00000000 00000000
!	Mem[0000000010141410] = 00000000 00000000, %l6 = 00000000, %l7 = 00000000
	ldda	[%i5+%o5]0x80,%l6	! %l6 = 0000000000000000 0000000000000000
!	Mem[0000000030101408] = 00000000, %l4 = 0000000000000000
	lduwa	[%i4+%o4]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000030081400] = ff000000, %f11 = 45c0ffff
	lda	[%i2+%g0]0x81,%f11	! %f11 = ff000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010101428] = 0000ffff, %l6 = 0000000000000000
	ldstub	[%i4+0x028],%l6		! %l6 = 00000000000000ff

p0_label_288:
!	Mem[0000000030041410] = 00000000, %l6 = 0000000000000000
	swapa	[%i1+%o5]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000010181408] = 000000ff, %l4 = 0000000000000000
	ldstuba	[%i6+0x008]%asi,%l4	! %l4 = 00000000000000ff
!	Mem[00000000300c1400] = ffff0000, %l1 = 0000000000000000
	swapa	[%i3+%g0]0x81,%l1	! %l1 = 00000000ffff0000
!	Mem[0000000010181410] = ffffffff, %l2 = 0000000000000000
	swapa	[%i6+%o5]0x80,%l2	! %l2 = 00000000ffffffff
!	Mem[00000000100c1410] = 00000000, %l2 = 00000000ffffffff
	swapa	[%i3+%o5]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000010141410] = 00000000, %l2 = 0000000000000000
	ldstuba	[%i5+%o5]0x88,%l2	! %l2 = 00000000000000ff
!	%f14 = e90d00a2 00000000, Mem[0000000010141400] = 00000000 00000000
	stda	%f14,[%i5+0x000]%asi	! Mem[0000000010141400] = e90d00a2 00000000
!	%f6  = ff0000ff, Mem[0000000010181400] = 00000000
	sta	%f6 ,[%i6+%g0]0x88	! Mem[0000000010181400] = ff0000ff
!	%f2  = 00000000 00000000, Mem[0000000030101408] = 00000000 00000000
	stda	%f2 ,[%i4+%o4]0x81	! Mem[0000000030101408] = 00000000 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000020800040] = ff358327, %l3 = 0000000000000000
	ldsb	[%o1+0x040],%l3		! %l3 = ffffffffffffffff

p0_label_289:
!	Mem[00000000300c1400] = 0000000000000000, %f14 = e90d00a2 00000000
	ldda	[%i3+%g0]0x81,%f14	! %f14 = 00000000 00000000
!	Mem[00000000100c1410] = ffffffff, %l7 = 0000000000000000
	lduwa	[%i3+0x010]%asi,%l7	! %l7 = 00000000ffffffff
!	Mem[0000000010001400] = a2000de9, %l7 = 00000000ffffffff
	ldsba	[%i0+%g0]0x88,%l7	! %l7 = ffffffffffffffe9
!	Mem[0000000010181400] = ff0000ff, %l5 = 0000000000000000
	lduba	[%i6+%g0]0x80,%l5	! %l5 = 00000000000000ff
!	Mem[00000000300c1400] = 00000000 00000000, %l2 = 00000000, %l3 = ffffffff
	ldda	[%i3+%g0]0x89,%l2	! %l2 = 0000000000000000 0000000000000000
!	Mem[0000000030081408] = 00000000, %f10 = 00000000
	lda	[%i2+%o4]0x89,%f10	! %f10 = 00000000
!	Mem[0000000030001410] = ffffc04500000000, %l5 = 00000000000000ff
	ldxa	[%i0+%o5]0x81,%l5	! %l5 = ffffc04500000000
!	Mem[0000000030141400] = 0000000000000000, %l7 = ffffffffffffffe9
	ldxa	[%i5+%g0]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000030001408] = 00000000 00000000, %l6 = 00000000, %l7 = 00000000
	ldda	[%i0+%o4]0x81,%l6	! %l6 = 0000000000000000 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010081410] = ffc00000, %l3 = 0000000000000000
	swapa	[%i2+%o5]0x80,%l3	! %l3 = 00000000ffc00000

p0_label_290:
!	%f0  = 00000000, Mem[0000000030141400] = 00000000
	sta	%f0 ,[%i5+%g0]0x89	! Mem[0000000030141400] = 00000000
!	Mem[0000000030081400] = 000000ff, %l2 = 0000000000000000
	swapa	[%i2+%g0]0x89,%l2	! %l2 = 00000000000000ff
!	%l0 = 000000000073ff4a, Mem[0000000030181408] = 00000000
	stba	%l0,[%i6+%o4]0x81	! Mem[0000000030181408] = 4a000000
!	Mem[0000000010181420] = 0000007100000000, %l7 = 0000000000000000, %l0 = 000000000073ff4a
	add	%i6,0x20,%g1
	casxa	[%g1]0x80,%l7,%l0	! %l0 = 0000007100000000
!	Mem[0000000010001408] = 5af7ffff, %l0 = 0000007100000000
	swapa	[%i0+%o4]0x80,%l0	! %l0 = 000000005af7ffff
!	Mem[000000001010140c] = ffffffff, %l3 = 00000000ffc00000
	ldstuba	[%i4+0x00c]%asi,%l3	! %l3 = 000000ff000000ff
!	Mem[0000000010141434] = 1db1ffc1, %l0 = 000000005af7ffff, %asi = 80
	swapa	[%i5+0x034]%asi,%l0	! %l0 = 000000001db1ffc1
!	%l7 = 0000000000000000, Mem[0000000010141408] = 7bfdc045007300ff
	stxa	%l7,[%i5+%o4]0x88	! Mem[0000000010141408] = 0000000000000000
!	Mem[0000000030181410] = 00000000, %l3 = 00000000000000ff
	ldstuba	[%i6+%o5]0x81,%l3	! %l3 = 00000000000000ff
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (41)
!	Mem[0000000010101400] = ff740000 00000000 ff000000 ffffffff
!	Mem[0000000010101410] = 00000000 000000ff ffffffff 0000005a
!	Mem[0000000010101420] = 7b000000 00000000 ff00ffff ffffffff
!	Mem[0000000010101430] = 00000000 000000ff 00000000 00000000
	ldda	[%i4]ASI_BLK_AIUP,%f0	! Block Load from 0000000010101400

p0_label_291:
!	Mem[00000000100c1408] = 00000000, %l4 = 0000000000000000
	lduwa	[%i3+%o4]0x88,%l4	! %l4 = 0000000000000000
!	Mem[00000000100c1418] = e300ffff, %l7 = 0000000000000000
	ldsb	[%i3+0x01a],%l7		! %l7 = ffffffffffffffff
!	Mem[0000000010001408] = 00000000, %l6 = 0000000000000000
	lduwa	[%i0+0x008]%asi,%l6	! %l6 = 0000000000000000
!	Mem[00000000100c1400] = 0000000000000000, %l6 = 0000000000000000
	ldxa	[%i3+%g0]0x88,%l6	! %l6 = 0000000000000000
!	Mem[00000000300c1400] = 00000000 00000000 00000000 00000000
!	Mem[00000000300c1410] = 00000000 00000000 ff000000 0000000b
!	Mem[00000000300c1420] = 7db8a8fe 5af7ffff 6ddc7182 7487ff6b
!	Mem[00000000300c1430] = f3ffd15d e900d900 ffffffc6 d046c574
	ldda	[%i3]ASI_BLK_S,%f0	! Block Load from 00000000300c1400
!	Mem[0000000030041400] = 00000000, %l2 = 00000000000000ff
	lduha	[%i1+%g0]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000030141410] = 00000000, %l4 = 0000000000000000
	lduwa	[%i5+%o5]0x89,%l4	! %l4 = 0000000000000000
!	Mem[00000000300c1400] = 0000000000000000, %l2 = 0000000000000000
	ldxa	[%i3+%g0]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000010141400] = e90d00a2, %l1 = 00000000ffff0000
	ldswa	[%i5+%g0]0x80,%l1	! %l1 = ffffffffe90d00a2
!	Starting 10 instruction Store Burst
!	%l0 = 1db1ffc1, %l1 = e90d00a2, Mem[0000000010181408] = ff0000ff 00000000
	std	%l0,[%i6+%o4]		! Mem[0000000010181408] = 1db1ffc1 e90d00a2

p0_label_292:
!	%l3 = 0000000000000000, Mem[0000000010041408] = 0000000000000000
	stxa	%l3,[%i1+%o4]0x88	! Mem[0000000010041408] = 0000000000000000
!	%f0  = 00000000 00000000 00000000 00000000
!	%f4  = 00000000 00000000 ff000000 0000000b
!	%f8  = 7db8a8fe 5af7ffff 6ddc7182 7487ff6b
!	%f12 = f3ffd15d e900d900 ffffffc6 d046c574
	stda	%f0,[%i6]ASI_BLK_SL	! Block Store to 0000000030181400
	membar	#Sync			! Added by membar checker (42)
!	%l6 = 0000000000000000, Mem[00000000300c1408] = 00000000
	stha	%l6,[%i3+%o4]0x89	! Mem[00000000300c1408] = 00000000
!	%f22 = 00000000 ffff00e3, Mem[0000000010041410] = 00000000 ff000000
	stda	%f22,[%i1+%o5]0x88	! Mem[0000000010041410] = 00000000 ffff00e3
!	%l2 = 0000000000000000, Mem[0000000010141400] = a2000de9
	stwa	%l2,[%i5+%g0]0x88	! Mem[0000000010141400] = 00000000
!	%f0  = 00000000 00000000 00000000 00000000
!	%f4  = 00000000 00000000 ff000000 0000000b
!	%f8  = 7db8a8fe 5af7ffff 6ddc7182 7487ff6b
!	%f12 = f3ffd15d e900d900 ffffffc6 d046c574
	stda	%f0,[%i4]ASI_BLK_AIUS	! Block Store to 0000000030101400
!	Mem[0000000030141400] = 00000000, %l0 = 000000001db1ffc1
	ldstuba	[%i5+%g0]0x89,%l0	! %l0 = 00000000000000ff
	membar	#Sync			! Added by membar checker (43)
!	Mem[0000000010101400] = 000074ff, %l7 = ffffffffffffffff
	swapa	[%i4+%g0]0x88,%l7	! %l7 = 00000000000074ff
!	Mem[00000000100c1400] = 00000000, %l5 = ffffc04500000000
	swapa	[%i3+%g0]0x80,%l5	! %l5 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = 00000000 ff0000ff, %l0 = 00000000, %l1 = e90d00a2
	ldda	[%i6+%g0]0x88,%l0	! %l0 = 00000000ff0000ff 0000000000000000

p0_label_293:
!	Mem[00000000201c0000] = 00ff8a5f, %l3 = 0000000000000000
	ldsha	[%o0+0x000]%asi,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030181400] = 00000000, %f15 = d046c574
	lda	[%i6+%g0]0x81,%f15	! %f15 = 00000000
!	Mem[0000000010101400] = 00000000ffffffff, %l6 = 0000000000000000
	ldxa	[%i4+%g0]0x88,%l6	! %l6 = 00000000ffffffff
!	Mem[0000000010041410] = e300ffff, %l7 = 00000000000074ff
	lduha	[%i1+%o5]0x80,%l7	! %l7 = 000000000000e300
!	Mem[0000000010101408] = 000000ff, %l3 = 00000000000000ff
	lduba	[%i4+%o4]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010101408] = ffffffff000000ff, %f4  = 00000000 00000000
	ldda	[%i4+%o4]0x88,%f4 	! %f4  = ffffffff 000000ff
!	Mem[0000000010041400] = 0000000000000000, %l0 = 00000000ff0000ff
	ldxa	[%i1+%g0]0x80,%l0	! %l0 = 0000000000000000
!	Mem[00000000201c0000] = 00ff8a5f, %l1 = 0000000000000000
	ldsba	[%o0+0x001]%asi,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010081400] = 000000ff, %l5 = 0000000000000000
	ldswa	[%i2+%g0]0x88,%l5	! %l5 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000010001420] = 000020e0, %l2 = 00000000, %l4 = 00000000
	add	%i0,0x20,%g1
	casa	[%g1]0x80,%l2,%l4	! %l4 = 00000000000020e0

p0_label_294:
!	%f3  = 00000000, Mem[0000000010081408] = 00000000
	sta	%f3 ,[%i2+%o4]0x80	! Mem[0000000010081408] = 00000000
!	%f28 = 00000000 45c0ffff, Mem[0000000030001400] = ff000000 ffff0000
	stda	%f28,[%i0+%g0]0x89	! Mem[0000000030001400] = 00000000 45c0ffff
!	Mem[0000000030101410] = 00000000, %l5 = 00000000000000ff
	ldstuba	[%i4+%o5]0x81,%l5	! %l5 = 00000000000000ff
!	%l0 = 0000000000000000, Mem[0000000010041408] = 0000000000000000
	stxa	%l0,[%i1+%o4]0x80	! Mem[0000000010041408] = 0000000000000000
!	%f6  = ff000000 0000000b, Mem[0000000010101408] = 000000ff ffffffff
	stda	%f6 ,[%i4+%o4]0x88	! Mem[0000000010101408] = ff000000 0000000b
!	%l4 = 00000000000020e0, Mem[0000000010141400] = 00000000
	stwa	%l4,[%i5+%g0]0x80	! Mem[0000000010141400] = 000020e0
!	Mem[000000001008140c] = 00000000, %l6 = ffffffff, %l1 = ffffffff
	add	%i2,0x0c,%g1
	casa	[%g1]0x80,%l6,%l1	! %l1 = 0000000000000000
!	%l0 = 0000000000000000, Mem[0000000030041400] = 00000000
	stwa	%l0,[%i1+%g0]0x89	! Mem[0000000030041400] = 00000000
!	Mem[00000000100c1410] = ffffffff, %l7 = 000000000000e300
	ldstuba	[%i3+%o5]0x88,%l7	! %l7 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = 00000000, %l1 = 0000000000000000
	lduba	[%i3+%o5]0x81,%l1	! %l1 = 0000000000000000

p0_label_295:
!	Mem[0000000010141428] = 000000ff00000000, %l0 = 0000000000000000
	ldx	[%i5+0x028],%l0		! %l0 = 000000ff00000000
!	Mem[0000000010181400] = ff0000ff, %l7 = 00000000000000ff
	ldsba	[%i6+%g0]0x80,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010181410] = 00000000, %l3 = 00000000000000ff
	lduba	[%i6+%o5]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000030001400] = ffffc04500000000, %f28 = 00000000 45c0ffff
	ldda	[%i0+%g0]0x81,%f28	! %f28 = ffffc045 00000000
!	Mem[0000000030101408] = 00000000, %l7 = ffffffffffffffff
	lduwa	[%i4+%o4]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000010081410] = 00000000, %l2 = 0000000000000000
	lduwa	[%i2+%o5]0x80,%l2	! %l2 = 0000000000000000
!	Mem[00000000211c0000] = 00006217, %l2 = 0000000000000000
	ldub	[%o2+%g0],%l2		! %l2 = 0000000000000000
!	Mem[0000000010041400] = 00000000, %l7 = 0000000000000000
	lduba	[%i1+%g0]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000030141400] = ff000000, %l2 = 0000000000000000
	ldswa	[%i5+%g0]0x81,%l2	! %l2 = ffffffffff000000
!	Starting 10 instruction Store Burst
!	%l7 = 0000000000000000, Mem[0000000010081408] = 0000000000000000
	stx	%l7,[%i2+%o4]		! Mem[0000000010081408] = 0000000000000000

p0_label_296:
!	Mem[0000000030081408] = 00000000, %l0 = 000000ff00000000
	swapa	[%i2+%o4]0x89,%l0	! %l0 = 0000000000000000
!	%l6 = 00000000ffffffff, Mem[0000000010181400] = ff0000ff00000000, %asi = 80
	stxa	%l6,[%i6+0x000]%asi	! Mem[0000000010181400] = 00000000ffffffff
!	%l5 = 0000000000000000, Mem[0000000010081400] = ff000000000000ff
	stxa	%l5,[%i2+%g0]0x80	! Mem[0000000010081400] = 0000000000000000
!	Mem[0000000030141410] = 00000000, %l1 = 0000000000000000
	ldstuba	[%i5+%o5]0x81,%l1	! %l1 = 00000000000000ff
!	%l0 = 0000000000000000, Mem[0000000030101400] = 0000000000000000
	stxa	%l0,[%i4+%g0]0x81	! Mem[0000000030101400] = 0000000000000000
!	%l6 = ffffffff, %l7 = 00000000, Mem[0000000010101408] = 0000000b ff000000
	stda	%l6,[%i4+%o4]0x88	! Mem[0000000010101408] = ffffffff 00000000
!	%l2 = ff000000, %l3 = 00000000, Mem[0000000010101408] = ffffffff 00000000
	stda	%l2,[%i4+%o4]0x88	! Mem[0000000010101408] = ff000000 00000000
!	%l2 = ff000000, %l3 = 00000000, Mem[00000000100c1400] = 00000000 00000000
	stda	%l2,[%i3+%g0]0x80	! Mem[00000000100c1400] = ff000000 00000000
!	%f0  = 00000000 00000000 00000000 00000000
!	%f4  = ffffffff 000000ff ff000000 0000000b
!	%f8  = 7db8a8fe 5af7ffff 6ddc7182 7487ff6b
!	%f12 = f3ffd15d e900d900 ffffffc6 00000000
	stda	%f0,[%i2]ASI_BLK_S	! Block Store to 0000000030081400
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = 00000000, %l6 = 00000000ffffffff
	ldsha	[%i3+%o4]0x89,%l6	! %l6 = 0000000000000000

p0_label_297:
!	Mem[0000000030041400] = 00000000, %l5 = 0000000000000000
	ldsba	[%i1+%g0]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000030041410] = 00000000, %l7 = 0000000000000000
	lduba	[%i1+%o5]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000030001410] = ffffc045, %l1 = 0000000000000000
	lduha	[%i0+%o5]0x81,%l1	! %l1 = 000000000000ffff
	membar	#Sync			! Added by membar checker (44)
!	Mem[0000000030081400] = 00000000 00000000 00000000 00000000
!	Mem[0000000030081410] = ffffffff 000000ff ff000000 0000000b
!	Mem[0000000030081420] = 7db8a8fe 5af7ffff 6ddc7182 7487ff6b
!	Mem[0000000030081430] = f3ffd15d e900d900 ffffffc6 00000000
	ldda	[%i2]ASI_BLK_S,%f0	! Block Load from 0000000030081400
!	Mem[000000001010141c] = 0000005a, %f29 = 00000000
	ld	[%i4+0x01c],%f29	! %f29 = 0000005a
!	Mem[0000000010041408] = 00000000, %l2 = ffffffffff000000
	lduba	[%i1+%o4]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000010101408] = ff000000, %l1 = 000000000000ffff
	ldsha	[%i4+%o4]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010041410] = ffff00e3, %l3 = 0000000000000000
	lduwa	[%i1+%o5]0x88,%l3	! %l3 = 00000000ffff00e3
!	Mem[0000000030181408] = 0000000000000000, %f26 = 5a000000 6881ffcc
	ldda	[%i6+%o4]0x81,%f26	! %f26 = 00000000 00000000
!	Starting 10 instruction Store Burst
!	%l3 = 00000000ffff00e3, Mem[0000000010141400] = 000020e0, %asi = 80
	stwa	%l3,[%i5+0x000]%asi	! Mem[0000000010141400] = ffff00e3

p0_label_298:
!	Mem[0000000010101408] = 000000ff, %l7 = 0000000000000000
	ldstuba	[%i4+%o4]0x80,%l7	! %l7 = 00000000000000ff
!	%l2 = 0000000000000000, Mem[0000000010081420] = 00000000
	stw	%l2,[%i2+0x020]		! Mem[0000000010081420] = 00000000
!	Mem[0000000030181408] = 00000000, %l3 = 00000000ffff00e3
	ldstuba	[%i6+%o4]0x81,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010141408] = 00000000, %l7 = 0000000000000000
	swapa	[%i5+%o4]0x80,%l7	! %l7 = 0000000000000000
!	%f31 = ff000000, Mem[0000000010081400] = 00000000
	sta	%f31,[%i2+%g0]0x88	! Mem[0000000010081400] = ff000000
!	Mem[0000000010141420] = 89ff65f04f4418f2, %l1 = 0000000000000000, %l6 = 0000000000000000
	add	%i5,0x20,%g1
	casxa	[%g1]0x80,%l1,%l6	! %l6 = 89ff65f04f4418f2
!	%f24 = 7971ff14, Mem[0000000010101414] = 000000ff
	sta	%f24,[%i4+0x014]%asi	! Mem[0000000010101414] = 7971ff14
!	Mem[0000000030181408] = ff000000, %l6 = 89ff65f04f4418f2
	swapa	[%i6+%o4]0x81,%l6	! %l6 = 00000000ff000000
!	Mem[0000000010181410] = 00000000, %l4 = 00000000000020e0
	swapa	[%i6+%o5]0x80,%l4	! %l4 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = 00000000, %f23 = ffff00e3
	lda	[%i5+%o4]0x81,%f23	! %f23 = 00000000

p0_label_299:
!	Mem[0000000010041400] = 00000000, %l3 = 0000000000000000
	lduba	[%i1+%g0]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000010001408] = 0000ff0000000000, %l5 = 0000000000000000
	ldxa	[%i0+%o4]0x88,%l5	! %l5 = 0000ff0000000000
!	Mem[00000000100c1410] = ffffffff00000000, %l2 = 0000000000000000
	ldxa	[%i3+%o5]0x80,%l2	! %l2 = ffffffff00000000
!	Mem[0000000021800000] = 00ffe2e2, %l4 = 0000000000000000
	lduha	[%o3+0x000]%asi,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030081408] = 00000000, %l0 = 0000000000000000
	ldsha	[%i2+%o4]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000010001408] = 00000000, %l7 = 0000000000000000
	lduba	[%i0+%o4]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000010141400] = ffff00e3, %f29 = 0000005a
	ld	[%i5+%g0],%f29	! %f29 = ffff00e3
!	Mem[0000000030001408] = 00000000, %l6 = 00000000ff000000
	ldsha	[%i0+%o4]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000030001410] = ffffc045 00000000, %l4 = 000000ff, %l5 = 00000000
	ldda	[%i0+%o5]0x81,%l4	! %l4 = 00000000ffffc045 0000000000000000
!	Starting 10 instruction Store Burst
!	%f31 = ff000000, Mem[0000000010081400] = 000000ff
	sta	%f31,[%i2+0x000]%asi	! Mem[0000000010081400] = ff000000

p0_label_300:
!	%l4 = 00000000ffffc045, Mem[0000000030141400] = 00000000000000ff
	stxa	%l4,[%i5+%g0]0x89	! Mem[0000000030141400] = 00000000ffffc045
!	%l6 = 0000000000000000, Mem[00000000300c1400] = 0000000000000000
	stxa	%l6,[%i3+%g0]0x89	! Mem[00000000300c1400] = 0000000000000000
!	%l3 = 0000000000000000, Mem[000000001004140e] = 00000000, %asi = 80
	stha	%l3,[%i1+0x00e]%asi	! Mem[000000001004140c] = 00000000
!	%l6 = 0000000000000000, Mem[0000000010181400] = 00000000
	stba	%l6,[%i6+%g0]0x80	! Mem[0000000010181400] = 00000000
!	%l1 = 0000000000000000, Mem[0000000030001408] = 00000000
	stba	%l1,[%i0+%o4]0x81	! Mem[0000000030001408] = 00000000
!	Mem[0000000030001400] = ffffc045, %l3 = 0000000000000000
	ldstuba	[%i0+%g0]0x81,%l3	! %l3 = 000000ff000000ff
!	%f25 = fea8b87d, Mem[0000000010041410] = e300ffff
	sta	%f25,[%i1+%o5]0x80	! Mem[0000000010041410] = fea8b87d
!	%l4 = 00000000ffffc045, Mem[0000000010001400] = e90d00a200000000
	stxa	%l4,[%i0+%g0]0x80	! Mem[0000000010001400] = 00000000ffffc045
!	%l0 = 0000000000000000, Mem[0000000010001410] = e90d00a200000000
	stxa	%l0,[%i0+%o5]0x80	! Mem[0000000010001410] = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = ffffffff, %f26 = 00000000
	lda	[%i4+%g0]0x80,%f26	! %f26 = ffffffff

	ba,a	p0_not_taken_0_end
p0_not_taken_0:
!	The following code should not be executed
	fstox	%f20,%f24
	nop
	sta	%l4,[%i5+0x014]%asi
	nop
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
	cmp	%l1,%g2			! %l1 should be 0000000000000000
	bne,a,pn %xcc,p0_reg_l1_fail
	mov	%l1,%g3
	ldx	[%g1+0x010],%g2
	cmp	%l2,%g2			! %l2 should be ffffffff00000000
	bne,a,pn %xcc,p0_reg_l2_fail
	mov	%l2,%g3
	ldx	[%g1+0x018],%g2
	cmp	%l3,%g2			! %l3 should be 00000000000000ff
	bne,a,pn %xcc,p0_reg_l3_fail
	mov	%l3,%g3
	ldx	[%g1+0x020],%g2
	cmp	%l4,%g2			! %l4 should be 00000000ffffc045
	bne,a,pn %xcc,p0_reg_l4_fail
	mov	%l4,%g3
	ldx	[%g1+0x028],%g2
	cmp	%l5,%g2			! %l5 should be 0000000000000000
	bne,a,pn %xcc,p0_reg_l5_fail
	mov	%l5,%g3
	ldx	[%g1+0x030],%g2
	cmp	%l6,%g2			! %l6 should be 0000000000000000
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
	cmp	%l0,%l1			! %f0  should be 00000000 00000000
	bne	%xcc,p0_f0_fail
	std	%f2,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x08],%l0
	cmp	%l0,%l1			! %f2  should be 00000000 00000000
	bne	%xcc,p0_f2_fail
	std	%f4,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x10],%l0
	cmp	%l0,%l1			! %f4  should be ffffffff 000000ff
	bne	%xcc,p0_f4_fail
	std	%f6,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x18],%l0
	cmp	%l0,%l1			! %f6  should be ff000000 0000000b
	bne	%xcc,p0_f6_fail
	std	%f8,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x20],%l0
	cmp	%l0,%l1			! %f8  should be 7db8a8fe 5af7ffff
	bne	%xcc,p0_f8_fail
	std	%f10,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x28],%l0
	cmp	%l0,%l1			! %f10 should be 6ddc7182 7487ff6b
	bne	%xcc,p0_f10_fail
	std	%f12,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x30],%l0
	cmp	%l0,%l1			! %f12 should be f3ffd15d e900d900
	bne	%xcc,p0_f12_fail
	std	%f14,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x38],%l0
	cmp	%l0,%l1			! %f14 should be ffffffc6 00000000
	bne	%xcc,p0_f14_fail
	std	%f16,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x40],%l0
	cmp	%l0,%l1			! %f16 should be 00000000 00000000
	bne	%xcc,p0_f16_fail
	std	%f18,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x48],%l0
	cmp	%l0,%l1			! %f18 should be fffdc045 00000000
	bne	%xcc,p0_f18_fail
	std	%f20,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x50],%l0
	cmp	%l0,%l1			! %f20 should be 00000000 00000000
	bne	%xcc,p0_f20_fail
	std	%f22,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x58],%l0
	cmp	%l0,%l1			! %f22 should be 00000000 00000000
	bne	%xcc,p0_f22_fail
	std	%f24,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x60],%l0
	cmp	%l0,%l1			! %f24 should be 7971ff14 fea8b87d
	bne	%xcc,p0_f24_fail
	std	%f26,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x68],%l0
	cmp	%l0,%l1			! %f26 should be ffffffff 00000000
	bne	%xcc,p0_f26_fail
	std	%f28,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x70],%l0
	cmp	%l0,%l1			! %f28 should be ffffc045 ffff00e3
	bne	%xcc,p0_f28_fail
	std	%f30,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x78],%l0
	cmp	%l0,%l1			! %f30 should be 00000000 ff000000
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
	membar	#Sync
	ldda	[%i5]ASI_BLK_AIUP,%f16
	membar	#Sync
	done

p0_trap1o:
	membar	#Sync
	ldda	[%o5]ASI_BLK_AIUP,%f16
	membar	#Sync
	done


p0_trap2e:
	fitod	%f7 ,%f14
	andn	%l4,-0x7ab,%l7
	add	%l1,-0x7c7,%l7
	mulx	%l1,0x6b9,%l5
	sdivx	%l2,%l0,%l0
	ldsba	[%i1+%o5]ASI_AS_IF_USER_PRIMARY,%l3	! Mem[0000000010041410]
	done

p0_trap2o:
	fitod	%f7 ,%f14
	andn	%l4,-0x7ab,%l7
	add	%l1,-0x7c7,%l7
	mulx	%l1,0x6b9,%l5
	sdivx	%l2,%l0,%l0
	ldsba	[%o1+%i5]ASI_AS_IF_USER_PRIMARY,%l3	! Mem[0000000010041410]
	done


p0_trap3e:
	subc	%l1,0x5a7,%l4
	done

p0_trap3o:
	subc	%l1,0x5a7,%l4
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
	ldx	[%g1+0x000],%l0		! %l0 = 1ff2331e45532e40
	ldx	[%g1+0x008],%l1		! %l1 = 99af98c64e701f45
	ldx	[%g1+0x010],%l2		! %l2 = ce1ad5725bcb4924
	ldx	[%g1+0x018],%l3		! %l3 = 7d898a4fde606c50
	ldx	[%g1+0x020],%l4		! %l4 = 302ee882849d4601
	ldx	[%g1+0x028],%l5		! %l5 = 03af7910d1fe0a95
	ldx	[%g1+0x030],%l6		! %l6 = 3cf0f6e4a0b730d7
	ldx	[%g1+0x038],%l7		! %l7 = bbe3da7a00fee70c

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
	sth	%l4,[%i3+0x020]		! Mem[00000000100c1420]
	ldsb	[%i5+0x01d],%l7		! Mem[000000001014141d]
	fitos	%f7 ,%f1 
	fstoi	%f2 ,%f12
	stw	%l0,[%i6+0x010]		! Mem[0000000010181410]
	sdivx	%l4,-0xf01,%l7
	sdivx	%l6,%l7,%l5
	jmpl	%o7,%g0
	sub	%l5,-0xc16,%l7
p0_near_0_he:
	fdtoi	%f24,%f26
	fadds	%f22,%f26,%f29
	udivx	%l6,-0x290,%l4
	ld	[%i4+0x020],%f20	! Mem[0000000010101420]
	fstoi	%f28,%f25
	lduh	[%i1+0x02a],%l2		! Mem[000000001004142a]
	jmpl	%o7,%g0
	ldx	[%i4+0x030],%l1		! Mem[0000000010101430]
near0_b2b_h:
	fsqrts	%f30,%f21
	udivx	%l0,%l4,%l5
	fdivs	%f28,%f19,%f31
	add	%l3,0x06c,%l7
	fdtos	%f26,%f29
	fdtos	%f20,%f27
	jmpl	%o7,%g0
	nop
near0_b2b_l:
	fstoi	%f11,%f0 
	fmuls	%f14,%f11,%f12
	sdivx	%l4,0x0c4,%l2
	mulx	%l3,%l1,%l6
	nop
	addc	%l0,%l5,%l3
	jmpl	%o7,%g0
	fmuls	%f1 ,%f1 ,%f4 
user_near0_end:
	.seg	"text"
	.align	0x2000
user_near1_start:
p0_near_1_le:
	ld	[%i4+0x024],%f2 	! Mem[0000000010101424]
	addc	%l7,%l2,%l2
	umul	%l2,-0xa51,%l3
	sub	%l3,%l1,%l4
	ld	[%i0+0x03c],%f13	! Mem[000000001000143c]
	subc	%l2,%l0,%l1
	jmpl	%o7,%g0
	orn	%l6,-0x739,%l3
p0_near_1_he:
	nop
	fsubs	%f27,%f28,%f25
	swap	[%i6+0x018],%l3		! Mem[0000000010181418]
	nop
	ldsh	[%i5+0x01e],%l5		! Mem[000000001014141e]
	jmpl	%o7,%g0
	fitod	%f25,%f16
near1_b2b_h:
	fstoi	%f21,%f26
	fdtoi	%f28,%f16
	udivx	%l5,%l2,%l7
	fmuls	%f26,%f26,%f18
	udivx	%l4,%l3,%l4
	fadds	%f25,%f22,%f23
	jmpl	%o7,%g0
	or	%l5,0x5d9,%l3
near1_b2b_l:
	smul	%l4,%l4,%l5
	mulx	%l5,0x1ff,%l5
	smul	%l4,%l5,%l3
	sub	%l2,%l0,%l3
	fstoi	%f6 ,%f4 
	udivx	%l4,0x069,%l5
	jmpl	%o7,%g0
	fsubs	%f7 ,%f13,%f0 
user_near1_end:
	.seg	"text"
	.align	0x2000
user_near2_start:
p0_near_2_le:
	xnor	%l5,-0xbd7,%l1
	jmpl	%o7,%g0
	fdtoi	%f4 ,%f10
p0_near_2_he:
	sub	%l5,-0x4a4,%l3
	fsubs	%f22,%f30,%f16
	stb	%l5,[%i3+0x01e]		! Mem[00000000100c141e]
	swap	[%i4+0x020],%l5		! Mem[0000000010101420]
	sdivx	%l0,-0xf5b,%l0
	mulx	%l2,0xb65,%l5
	jmpl	%o7,%g0
	ldd	[%i4+0x020],%f18	! Mem[0000000010101420]
near2_b2b_h:
	fdtoi	%f16,%f31
	fdtos	%f22,%f21
	fmuls	%f22,%f29,%f17
	mulx	%l7,0x290,%l1
	smul	%l6,-0x0bb,%l1
	jmpl	%o7,%g0
	and	%l0,-0x648,%l4
near2_b2b_l:
	sub	%l7,0x3ed,%l1
	addc	%l2,0x705,%l5
	fdtos	%f4 ,%f10
	smul	%l1,-0x800,%l0
	orn	%l4,0x660,%l4
	jmpl	%o7,%g0
	smul	%l4,0xdcb,%l5
user_near2_end:
	.seg	"text"
	.align	0x2000
user_near3_start:
p0_near_3_le:
	std	%f4 ,[%i6+0x018]	! Mem[0000000010181418]
	addc	%l2,0x66c,%l0
	st	%f8 ,[%i6+0x01c]	! Mem[000000001018141c]
	std	%l0,[%i6+0x030]		! Mem[0000000010181430]
	subc	%l4,%l3,%l3
	jmpl	%o7,%g0
	addc	%l5,%l0,%l0
p0_near_3_he:
	stx	%l4,[%i2+0x030]		! Mem[0000000010081430]
	fstoi	%f26,%f30
	fmuls	%f28,%f22,%f30
	jmpl	%o7,%g0
	xnor	%l2,%l0,%l0
near3_b2b_h:
	fmuls	%f18,%f19,%f30
	and	%l6,%l7,%l5
	jmpl	%o7,%g0
	fsqrts	%f31,%f17
near3_b2b_l:
	sdivx	%l4,%l5,%l1
	fcmps	%fcc0,%f13,%f15
	jmpl	%o7,%g0
	xnor	%l6,%l1,%l4
user_near3_end:
	.seg	"text"
	.text
	.align	0x2000
user_far0_start:
p0_far_0_le:
	orn	%l2,%l2,%l5
	fdtos	%f4 ,%f11
	xor	%l4,%l4,%l0
	sub	%l3,-0x38c,%l3
	udivx	%l5,-0x594,%l0
	jmpl	%o7,%g0
	swap	[%i1+0x00c],%l1		! Mem[000000001004140c]
p0_far_0_lem:
	orn	%l2,%l2,%l5
	fdtos	%f4 ,%f11
	xor	%l4,%l4,%l0
	sub	%l3,-0x38c,%l3
	udivx	%l5,-0x594,%l0
	membar	#Sync
	jmpl	%o7,%g0
	swap	[%i1+0x00c],%l1		! Mem[000000001004140c]
p0_far_0_he:
	jmpl	%o7,%g0
	fadds	%f28,%f18,%f18
	jmpl	%o7,%g0
	nop
p0_far_0_hem:
	jmpl	%o7,%g0
	fadds	%f28,%f18,%f18
	jmpl	%o7,%g0
	nop
p0_loop_branch_0:
	jmpl	%o7+12,%g0
	add	%l0,1,%l0
far0_b2b_h:
	andn	%l1,%l1,%l7
	and	%l7,%l1,%l6
	fsqrts	%f28,%f23
	and	%l2,-0xea7,%l1
	fstoi	%f20,%f16
	addc	%l3,%l0,%l6
	fadds	%f26,%f28,%f31
	jmpl	%o7,%g0
	udivx	%l7,%l0,%l7
far0_b2b_l:
	fitos	%f15,%f15
	andn	%l3,%l1,%l2
	sub	%l0,%l2,%l3
	umul	%l0,-0x4f1,%l6
	fsubs	%f15,%f4 ,%f2 
	fmuls	%f5 ,%f6 ,%f10
	fsubs	%f0 ,%f5 ,%f11
	jmpl	%o7,%g0
	fsubs	%f0 ,%f6 ,%f10
user_far0_end:
	.seg	"text"
	.text
	.align	0x2000
user_far1_start:
p0_far_1_le:
	ldx	[%i1+0x028],%l4		! Mem[0000000010041428]
	fdtoi	%f4 ,%f14
	ldstub	[%i0+0x004],%l7		! Mem[0000000010001404]
	jmpl	%o7,%g0
	udivx	%l6,0x85f,%l6
p0_far_1_lem:
	membar	#Sync
	ldx	[%i1+0x028],%l4		! Mem[0000000010041428]
	fdtoi	%f4 ,%f14
	ldstub	[%i0+0x004],%l7		! Mem[0000000010001404]
	jmpl	%o7,%g0
	udivx	%l6,0x85f,%l6
p0_far_1_he:
	jmpl	%o7,%g0
	stb	%l7,[%i6+0x016]		! Mem[0000000010181416]
	jmpl	%o7,%g0
	nop
p0_far_1_hem:
	membar	#Sync
	jmpl	%o7,%g0
	stb	%l7,[%i6+0x016]		! Mem[0000000010181416]
	jmpl	%o7,%g0
	nop
p0_loop_branch_1:
	jmpl	%o7+12,%g0
	add	%l0,2,%l0
far1_b2b_h:
	or	%l5,-0x07f,%l1
	udivx	%l5,%l1,%l2
	fmuls	%f29,%f29,%f24
	fdtoi	%f20,%f21
	sdivx	%l6,%l3,%l5
	orn	%l4,0x55a,%l1
	and	%l3,0xe5b,%l4
	jmpl	%o7,%g0
	add	%l7,-0x26d,%l0
far1_b2b_l:
	addc	%l3,%l7,%l7
	fstoi	%f9 ,%f5 
	fitos	%f11,%f12
	xnor	%l4,%l7,%l2
	nop
	nop
	fitod	%f6 ,%f10
	jmpl	%o7,%g0
	fstod	%f12,%f12
user_far1_end:
	.seg	"text"
	.text
	.align	0x2000
user_far2_start:
p0_far_2_le:
	stx	%l7,[%i3+0x020]		! Mem[00000000100c1420]
	fadds	%f7 ,%f2 ,%f11
	fstoi	%f9 ,%f0 
	ldsb	[%i6+0x031],%l0		! Mem[0000000010181431]
	ldstub	[%o0+0x001],%l7		! Mem[00000000201c0001]
	fdtoi	%f8 ,%f15
	mulx	%l5,-0xa45,%l5
	jmpl	%o7,%g0
	stb	%l4,[%i4+0x027]		! Mem[0000000010101427]
p0_far_2_lem:
	membar	#Sync
	stx	%l7,[%i3+0x020]		! Mem[00000000100c1420]
	fadds	%f7 ,%f2 ,%f11
	fstoi	%f9 ,%f0 
	ldsb	[%i6+0x031],%l0		! Mem[0000000010181431]
	ldstub	[%o0+0x001],%l7		! Mem[00000000201c0001]
	fdtoi	%f8 ,%f15
	mulx	%l5,-0xa45,%l5
	membar	#Sync
	jmpl	%o7,%g0
	stb	%l4,[%i4+0x027]		! Mem[0000000010101427]
p0_far_2_he:
	swap	[%i0+0x02c],%l0		! Mem[000000001000142c]
	subc	%l3,0xd90,%l7
	add	%l5,%l7,%l7
	fcmps	%fcc2,%f25,%f27
	jmpl	%o7,%g0
	fsqrts	%f22,%f24
p0_far_2_hem:
	membar	#Sync
	swap	[%i0+0x02c],%l0		! Mem[000000001000142c]
	subc	%l3,0xd90,%l7
	add	%l5,%l7,%l7
	fcmps	%fcc2,%f25,%f27
	jmpl	%o7,%g0
	fsqrts	%f22,%f24
p0_loop_branch_2:
	jmpl	%o7+12,%g0
	add	%l0,3,%l0
far2_b2b_h:
	add	%l5,%l7,%l5
	jmpl	%o7,%g0
	umul	%l3,0x17d,%l2
far2_b2b_l:
	orn	%l0,0xfbc,%l1
	jmpl	%o7,%g0
	orn	%l7,%l1,%l4
user_far2_end:
	.seg	"text"
	.text
	.align	0x2000
user_far3_start:
p0_far_3_le:
	stw	%l6,[%i3+0x00c]		! Mem[00000000100c140c]
	fadds	%f7 ,%f14,%f6 
	sub	%l7,%l5,%l0
	jmpl	%o7,%g0
	swap	[%i5+0x02c],%l7		! Mem[000000001014142c]
p0_far_3_lem:
	membar	#Sync
	stw	%l6,[%i3+0x00c]		! Mem[00000000100c140c]
	fadds	%f7 ,%f14,%f6 
	sub	%l7,%l5,%l0
	membar	#Sync
	jmpl	%o7,%g0
	swap	[%i5+0x02c],%l7		! Mem[000000001014142c]
p0_far_3_he:
	and	%l4,-0xa6f,%l5
	andn	%l5,0xd18,%l7
	fdivs	%f19,%f16,%f24
	xor	%l3,%l0,%l1
	st	%f16,[%i4+0x024]	! Mem[0000000010101424]
	sub	%l6,%l4,%l3
	sdivx	%l5,%l3,%l1
	jmpl	%o7,%g0
	udivx	%l1,0x095,%l3
p0_far_3_hem:
	and	%l4,-0xa6f,%l5
	andn	%l5,0xd18,%l7
	fdivs	%f19,%f16,%f24
	xor	%l3,%l0,%l1
	membar	#Sync
	st	%f16,[%i4+0x024]	! Mem[0000000010101424]
	sub	%l6,%l4,%l3
	sdivx	%l5,%l3,%l1
	jmpl	%o7,%g0
	udivx	%l1,0x095,%l3
p0_loop_branch_3:
	jmpl	%o7+12,%g0
	add	%l0,4,%l0
far3_b2b_h:
	nop
	addc	%l2,0x189,%l0
	jmpl	%o7,%g0
	fdivs	%f21,%f20,%f31
far3_b2b_l:
	udivx	%l6,0x750,%l7
	xor	%l6,0xb3b,%l7
	jmpl	%o7,%g0
	fcmps	%fcc1,%f12,%f9 
user_far3_end:
	.seg	"text"
	.align	0x2000
user_jump0_start:
	INIT_MEM(0, 0x0010, 1, +, 0, +, 0)
p0_jmpl_0_le:
	std	%l4,[%i6+0x018]		! Mem[0000000010181418]
	add	%l1,%l5,%l0
	subc	%l5,%l6,%l5
	fitod	%f7 ,%f14
	smul	%l5,-0x192,%l2
	xor	%l7,%l2,%l1
	ldd	[%i3+0x020],%f4 	! Mem[00000000100c1420]
	jmpl	%g6+8,%g0
	std	%l0,[%i3+0x008]		! Mem[00000000100c1408]
p0_call_0_le:
	xnor	%l5,0x87c,%l6
	retl
	fdtos	%f4 ,%f10
p0_jmpl_0_lo:
	std	%l4,[%o6+0x018]		! Mem[0000000010181418]
	add	%l1,%l5,%l0
	subc	%l5,%l6,%l5
	fitod	%f7 ,%f14
	smul	%l5,-0x192,%l2
	xor	%l7,%l2,%l1
	ldd	[%o3+0x020],%f4 	! Mem[00000000100c1420]
	jmpl	%g6+8,%g0
	std	%l0,[%o3+0x008]		! Mem[00000000100c1408]
p0_call_0_lo:
	xnor	%l5,0x87c,%l6
	retl
	fdtos	%f4 ,%f10
p0_jmpl_0_he:
	fdtos	%f24,%f18
	mulx	%l5,0x0f4,%l5
	sdivx	%l1,%l6,%l5
	ldsh	[%i1+0x00c],%l2		! Mem[000000001004140c]
	jmpl	%g6+8,%g0
	ldd	[%i3+0x010],%f18	! Mem[00000000100c1410]
p0_call_0_he:
	fsqrts	%f28,%f23
	st	%f20,[%i2+0x024]	! Mem[0000000010081424]
	fitod	%f31,%f24
	ldd	[%i4+0x020],%f22	! Mem[0000000010101420]
	retl
	subc	%l1,%l1,%l2
p0_jmpl_0_ho:
	fdtos	%f24,%f18
	mulx	%l5,0x0f4,%l5
	sdivx	%l1,%l6,%l5
	ldsh	[%o1+0x00c],%l2		! Mem[000000001004140c]
	jmpl	%g6+8,%g0
	ldd	[%o3+0x010],%f18	! Mem[00000000100c1410]
p0_call_0_ho:
	fsqrts	%f28,%f23
	st	%f20,[%o2+0x024]	! Mem[0000000010081424]
	fitod	%f31,%f24
	ldd	[%o4+0x020],%f22	! Mem[0000000010101420]
	retl
	subc	%l1,%l1,%l2
user_jump0_end:
	.seg	"text"
	.align	0x2000
user_jump1_start:
	INIT_MEM(0, 0x0020, 1, +, 0, +, 0)
p0_jmpl_1_le:
	orn	%l4,-0x915,%l5
	fsqrts	%f12,%f8 
	umul	%l6,%l7,%l4
	jmpl	%g6+8,%g0
	smul	%l2,-0xd55,%l7
p0_call_1_le:
	ld	[%i0+0x030],%f10	! Mem[0000000010001430]
	ldsh	[%i2+0x01c],%l5		! Mem[000000001008141c]
	fsqrts	%f9 ,%f11
	std	%l0,[%i5+0x038]		! Mem[0000000010141438]
	sth	%l3,[%i4+0x02a]		! Mem[000000001010142a]
	fdivs	%f13,%f13,%f13
	fdivs	%f4 ,%f2 ,%f3 
	retl
	smul	%l7,0xf4b,%l5
p0_jmpl_1_lo:
	orn	%l4,-0x915,%l5
	fsqrts	%f12,%f8 
	umul	%l6,%l7,%l4
	jmpl	%g6+8,%g0
	smul	%l2,-0xd55,%l7
p0_call_1_lo:
	ld	[%o0+0x030],%f10	! Mem[0000000010001430]
	ldsh	[%o2+0x01c],%l5		! Mem[000000001008141c]
	fsqrts	%f9 ,%f11
	std	%l0,[%o5+0x038]		! Mem[0000000010141438]
	sth	%l3,[%o4+0x02a]		! Mem[000000001010142a]
	fdivs	%f13,%f13,%f13
	fdivs	%f4 ,%f2 ,%f3 
	retl
	smul	%l7,0xf4b,%l5
p0_jmpl_1_he:
	ld	[%i0+0x014],%f28	! Mem[0000000010001414]
	lduw	[%i3+0x030],%l0		! Mem[00000000100c1430]
	mulx	%l2,%l2,%l7
	swap	[%i2+0x03c],%l4		! Mem[000000001008143c]
	add	%l6,%l0,%l5
	fadds	%f21,%f25,%f22
	jmpl	%g6+8,%g0
	fstoi	%f18,%f21
p0_call_1_he:
	retl
	sub	%l2,0xd28,%l7
p0_jmpl_1_ho:
	ld	[%o0+0x014],%f28	! Mem[0000000010001414]
	lduw	[%o3+0x030],%l0		! Mem[00000000100c1430]
	mulx	%l2,%l2,%l7
	swap	[%o2+0x03c],%l4		! Mem[000000001008143c]
	add	%l6,%l0,%l5
	fadds	%f21,%f25,%f22
	jmpl	%g6+8,%g0
	fstoi	%f18,%f21
p0_call_1_ho:
	retl
	sub	%l2,0xd28,%l7
user_jump1_end:
	.seg	"text"
	.align	0x2000
user_jump2_start:
	INIT_MEM(0, 0x0030, 1, +, 0, +, 0)
p0_jmpl_2_le:
	fstoi	%f0 ,%f2 
	orn	%l1,0xae0,%l4
	fmuls	%f1 ,%f5 ,%f2 
	mulx	%l2,%l2,%l2
	udivx	%l3,0xca2,%l0
	jmpl	%g6+8,%g0
	nop
p0_call_2_le:
	fstod	%f8 ,%f0 
	ldd	[%i3+0x028],%l0		! Mem[00000000100c1428]
	swap	[%i4+0x004],%l0		! Mem[0000000010101404]
	retl
	fdivs	%f8 ,%f11,%f7 
p0_jmpl_2_lo:
	fstoi	%f0 ,%f2 
	orn	%l1,0xae0,%l4
	fmuls	%f1 ,%f5 ,%f2 
	mulx	%l2,%l2,%l2
	udivx	%l3,0xca2,%l0
	jmpl	%g6+8,%g0
	nop
p0_call_2_lo:
	fstod	%f8 ,%f0 
	ldd	[%o3+0x028],%l0		! Mem[00000000100c1428]
	swap	[%o4+0x004],%l0		! Mem[0000000010101404]
	retl
	fdivs	%f8 ,%f11,%f7 
p0_jmpl_2_he:
	fdtoi	%f16,%f16
	fitod	%f26,%f20
	fstod	%f22,%f30
	ldd	[%i5+0x020],%f28	! Mem[0000000010141420]
	fmuls	%f28,%f24,%f18
	sth	%l0,[%i5+0x038]		! Mem[0000000010141438]
	jmpl	%g6+8,%g0
	fstod	%f22,%f18
p0_call_2_he:
	fdtoi	%f26,%f23
	fsubs	%f19,%f26,%f28
	addc	%l6,%l0,%l6
	udivx	%l7,%l3,%l7
	retl
	ldd	[%i4+0x000],%l0		! Mem[0000000010101400]
p0_jmpl_2_ho:
	fdtoi	%f16,%f16
	fitod	%f26,%f20
	fstod	%f22,%f30
	ldd	[%o5+0x020],%f28	! Mem[0000000010141420]
	fmuls	%f28,%f24,%f18
	sth	%l0,[%o5+0x038]		! Mem[0000000010141438]
	jmpl	%g6+8,%g0
	fstod	%f22,%f18
p0_call_2_ho:
	fdtoi	%f26,%f23
	fsubs	%f19,%f26,%f28
	addc	%l6,%l0,%l6
	udivx	%l7,%l3,%l7
	retl
	ldd	[%o4+0x000],%l0		! Mem[0000000010101400]
user_jump2_end:
	.seg	"text"
	.align	0x2000
user_jump3_start:
	INIT_MEM(0, 0x0040, 1, +, 0, +, 0)
p0_jmpl_3_le:
	fmuls	%f6 ,%f4 ,%f10
	jmpl	%g6+8,%g0
	ldx	[%i5+0x008],%l0		! Mem[0000000010141408]
p0_call_3_le:
	retl
	fmuls	%f7 ,%f7 ,%f1 
p0_jmpl_3_lo:
	fmuls	%f6 ,%f4 ,%f10
	jmpl	%g6+8,%g0
	ldx	[%o5+0x008],%l0		! Mem[0000000010141408]
p0_call_3_lo:
	retl
	fmuls	%f7 ,%f7 ,%f1 
p0_jmpl_3_he:
	orn	%l5,-0xf30,%l7
	fitos	%f23,%f20
	swap	[%i2+0x030],%l5		! Mem[0000000010081430]
	ldstub	[%o0+0x000],%l4		! Mem[00000000201c0000]
	jmpl	%g6+8,%g0
	fstod	%f23,%f18
p0_call_3_he:
	ldx	[%i4+0x008],%l3		! Mem[0000000010101408]
	sth	%l0,[%i0+0x014]		! Mem[0000000010001414]
	retl
	fstoi	%f28,%f26
p0_jmpl_3_ho:
	orn	%l5,-0xf30,%l7
	fitos	%f23,%f20
	swap	[%o2+0x030],%l5		! Mem[0000000010081430]
	ldstub	[%i0+0x000],%l4		! Mem[00000000201c0000]
	jmpl	%g6+8,%g0
	fstod	%f23,%f18
p0_call_3_ho:
	ldx	[%o4+0x008],%l3		! Mem[0000000010101408]
	sth	%l0,[%o0+0x014]		! Mem[0000000010001414]
	retl
	fstoi	%f28,%f26
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
	.word	0x1ff2331e,0x45532e40		! Init value for %l0
	.word	0x99af98c6,0x4e701f45		! Init value for %l1
	.word	0xce1ad572,0x5bcb4924		! Init value for %l2
	.word	0x7d898a4f,0xde606c50		! Init value for %l3
	.word	0x302ee882,0x849d4601		! Init value for %l4
	.word	0x03af7910,0xd1fe0a95		! Init value for %l5
	.word	0x3cf0f6e4,0xa0b730d7		! Init value for %l6
	.word	0xbbe3da7a,0x00fee70c		! Init value for %l7
	.align	64
p0_init_freg:
	.word	0x20f78943,0xde755f9c		! Init value for %f0 
	.word	0xc79a3507,0x77e2eb4b		! Init value for %f2 
	.word	0x558bf3ff,0xe57bb2c1		! Init value for %f4 
	.word	0x0c00b638,0x6e655127		! Init value for %f6 
	.word	0x7db8a8fe,0x14ef7179		! Init value for %f8 
	.word	0xccaa8168,0x0deee902		! Init value for %f10
	.word	0x91ee73e8,0xb973a44a		! Init value for %f12
	.word	0x1ee581c0,0x04177388		! Init value for %f14
	.word	0xa8b6e34d,0xd0cacac6		! Init value for %f16
	.word	0xf0650335,0xea03c50b		! Init value for %f18
	.word	0x15387d9f,0x1339feff		! Init value for %f20
	.word	0x6b6b3b17,0x7df7f8a9		! Init value for %f22
	.word	0xed901724,0x5dd135f3		! Init value for %f24
	.word	0xbae226e5,0x94672388		! Init value for %f26
	.word	0x0ee506e6,0x361d1261		! Init value for %f28
	.word	0x2d851ca8,0x4c21830b		! Init value for %f30
	.word	0x4014644f,0xeb334309		! Init value for %f32
	.word	0x95d534e2,0xff50d1f8		! Init value for %f34
	.word	0x9a27eaa0,0xcb24cf18		! Init value for %f36
	.word	0xc640745d,0x82d0516d		! Init value for %f38
	.word	0xc2665184,0xccc9514e		! Init value for %f40
	.word	0x4a40e736,0x5e2d6617		! Init value for %f42
	.word	0x5b7f7d89,0x2b145723		! Init value for %f44
	.word	0xfe500423,0xc4763fa6		! Init value for %f46
	.word	0x10e014bf,0x52544c76
	.word	0x8cc93fc3,0x5493d322
	.word	0x64b17c65,0x7eec65bb
	.word	0x8dedcf7c,0x39a0b664
	.word	0x58c30b29,0x4752c3aa
	.word	0x35b670c8,0xcce6fa5b
	.word	0x4c80a1da,0x316e8063
	.word	0x5166536d,0x583537cf
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
	.word	0x00000000,0x00000000
	.word	0xffffffff,0x00000000
	.word	0x00000000,0x000000ff
	.word	0x00000000,0xffffc045
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000000
p0_expected_fp_regs:
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000000
	.word	0xffffffff,0x000000ff
	.word	0xff000000,0x0000000b
	.word	0x7db8a8fe,0x5af7ffff
	.word	0x6ddc7182,0x7487ff6b
	.word	0xf3ffd15d,0xe900d900
	.word	0xffffffc6,0x00000000
	.word	0x00000000,0x00000000
	.word	0xfffdc045,0x00000000
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000000
	.word	0x7971ff14,0xfea8b87d
	.word	0xffffffff,0x00000000
	.word	0xffffc045,0xffff00e3
	.word	0x00000000,0xff000000
	.word	0x0000000c,0x00000800		! %fsr = 0000000c00000800
p0_local0_expect:
	.word	0x00000000,0xffffc045
	.word	0x00000000,0x00ff0000
	.word	0x00000000,0x00000000
	.word	0x00000000,0x45c0ffff
	.word	0x000020e0,0xffffefc1
	.word	0x00000000,0x00000000
	.word	0x00000000,0xffffffff
	.word	0xff000000,0xffffffff
p0_local0_sec_expect:
	.word	0xffffc045,0x00000000
	.word	0x00000000,0x00000000
	.word	0xffffc045,0x00000000
	.word	0xffff0000,0xfffffffd
	.word	0xff00007b,0x00000000
	.word	0x7b000000,0x00000000
	.word	0xf0650335,0x00000000
	.word	0x00000000,0x00000000
p0_local1_expect:
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000000
	.word	0xfea8b87d,0x00000000
	.word	0xffffc045,0x00000000
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000000
	.word	0x00000000,0x0000e9ff
	.word	0x00000000,0x00000000
p0_local1_sec_expect:
	.word	0x00000000,0x00000000
	.word	0xff000000,0x00000000
	.word	0x00000000,0x000000ff
	.word	0x00ffffff,0x18f20000
	.word	0x00000071,0x14ef7179
	.word	0x00000000,0x7487ff6b
	.word	0xff000000,0xffffffff
	.word	0xff000000,0x00000000
p0_local2_expect:
	.word	0xff000000,0x00000000
	.word	0x00000000,0x00000000
	.word	0x00000000,0x000000ff
	.word	0xff000000,0x7bfdc045
	.word	0x00000000,0x0000ff00
	.word	0x5a000000,0x00000000
	.word	0x4aff73ff,0xe873ee91
	.word	0x00000000,0x0000e9ff
p0_local2_sec_expect:
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000000
	.word	0xffffffff,0x000000ff
	.word	0xff000000,0x0000000b
	.word	0x7db8a8fe,0x5af7ffff
	.word	0x6ddc7182,0x7487ff6b
	.word	0xf3ffd15d,0xe900d900
	.word	0xffffffc6,0x00000000
p0_local3_expect:
	.word	0xff000000,0x00000000
	.word	0x00000000,0x45c0fdff
	.word	0xffffffff,0x00000000
	.word	0xe300ffff,0x00000000
	.word	0x7db8a8fe,0x14ff7179
	.word	0xccff8168,0x0000005a
	.word	0xffffc045,0x00000000
	.word	0x000000ff,0x00000000
p0_local3_sec_expect:
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000000
	.word	0xff000000,0x0000000b
	.word	0x7db8a8fe,0x5af7ffff
	.word	0x6ddc7182,0x7487ff6b
	.word	0xf3ffd15d,0xe900d900
	.word	0xffffffc6,0xd046c574
p0_local4_expect:
	.word	0xffffffff,0x00000000
	.word	0xff0000ff,0x00000000
	.word	0x00000000,0x7971ff14
	.word	0xffffffff,0x0000005a
	.word	0x7b000000,0x00000000
	.word	0xff00ffff,0xffffffff
	.word	0x00000000,0x000000ff
	.word	0x00000000,0x00000000
p0_local4_sec_expect:
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000000
	.word	0xff000000,0x00000000
	.word	0xff000000,0x0000000b
	.word	0x7db8a8fe,0x5af7ffff
	.word	0x6ddc7182,0x7487ff6b
	.word	0xf3ffd15d,0xe900d900
	.word	0xffffffc6,0xd046c574
p0_local5_expect:
	.word	0xffff00e3,0x00000000
	.word	0x00000000,0x00000000
	.word	0xff000000,0x00000000
	.word	0x000000ff,0xffffffff
	.word	0x89ff65f0,0x4f4418f2
	.word	0x000000ff,0x00000000
	.word	0x5cab5a60,0x5af7ffff
	.word	0xffe90000,0xff000000
p0_local5_sec_expect:
	.word	0x45c0ffff,0x00000000
	.word	0x00000000,0x45c0ffff
	.word	0xff000000,0x00000000
	.word	0xe3000074,0x000000ff
	.word	0x14a80000,0x6b000000
	.word	0x80000000,0x0000005a
	.word	0x91ee73e8,0xff73ff4a
	.word	0x1eb681c0,0x04ff7388
p0_local6_expect:
	.word	0x00000000,0xffffffff
	.word	0x1db1ffc1,0xe90d00a2
	.word	0x000020e0,0x00000000
	.word	0x0000007d,0x259fa9be
	.word	0x00000071,0x00000000
	.word	0x73ff00ff,0x000000ff
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000000
p0_local6_sec_expect:
	.word	0x00000000,0x00000000
	.word	0x4f4418f2,0x00000000
	.word	0x00000000,0x00000000
	.word	0x0b000000,0x000000ff
	.word	0xfffff75a,0xfea8b87d
	.word	0x6bff8774,0x8271dc6d
	.word	0x00d900e9,0x5dd1fff3
	.word	0x74c546d0,0xc6ffffff
share0_expect:
	.word	0x00ff8a5f,0xf1aea331
	.word	0xd030bbdd,0xb83a2000
	.word	0x1db9a9a8,0x6f955801
	.word	0x00f86c36,0xe81d4b08
	.word	0x0f4e3436,0x330562d8
	.word	0x1596a50d,0x9288d3f9
	.word	0x0eab70ae,0x6a267f10
	.word	0xbeb2f1f2,0xb5f24890
share1_expect:
	.word	0xffff5afb,0xf55c5830
	.word	0xc4e2cbfb,0x6056e3a8
	.word	0x90689602,0xefab2fcc
	.word	0xa75dea81,0x4c0a8025
	.word	0x8f190ecb,0xc9d66075
	.word	0xab4c26b3,0x617d0a03
	.word	0x9cac17ff,0xfe35b1d5
	.word	0x20f3aaeb,0x25e3e0a3
	.word	0xff358327,0xcf35281f
	.word	0xeaf59704,0x76b3c965
	.word	0xd41a40d1,0xdc9f633e
	.word	0x776edec5,0x0709a8ca
	.word	0xceff04a1,0xfe127848
	.word	0x04cb5b2e,0x388982b5
	.word	0xd116b1bf,0x32e2c9a0
	.word	0xfb41b5b0,0x753052d1
share2_expect:
	.word	0x00006217,0x70c84bb9
	.word	0x455cae17,0xe1a47622
	.word	0xeef58e6f,0x40e5f71b
	.word	0x4d8c1844,0xcd02fc24
	.word	0x0208d8c5,0x139e0439
	.word	0x40535dd7,0x32624e61
	.word	0xce4e9e59,0x8299f141
	.word	0x544d8445,0xc71decc0
share3_expect:
	.word	0x00ffe2e2,0x6234a9b8
	.word	0x6e2a2c37,0x2ad5ffc3
	.word	0xe4ceebbc,0x064e2d5a
	.word	0xbaeba7c4,0x28ebe866
	.word	0x09c24a6a,0x61a081dc
	.word	0x393d62ce,0xe652b4f8
	.word	0x91c2a2bf,0x04915610
	.word	0x7051d82c,0x841d4821
	.word	0x5af7c5e9,0x4fac8a29
	.word	0x21e65134,0x931413c6
	.word	0x2462838a,0x287876f1
	.word	0xb4f1fa3e,0x6b9fbb97
	.word	0x7b7f6af6,0x41e8e4c9
	.word	0x7a806112,0xe40292cb
	.word	0x0f846c3c,0x2541e0d6
	.word	0x1a0742ab,0xd2584637
	.word	0xff00d810,0x249dab34
	.word	0xb6d8df2c,0x3b590b35
	.word	0xd0ff18ba,0x48cb2ea5
	.word	0x207e4efd,0x701f4a00
	.word	0xb5af8111,0x723e6d98
	.word	0x0b49410c,0xd0147d94
	.word	0x85bc6a3f,0x40b1b310
	.word	0x2681a7c1,0xb557b39f
	.word	0x00ffe748,0x73e9c277
	.word	0xb2cb39ee,0x2dc0882c
	.word	0xcd5519f3,0xd7d5f621
	.word	0xdf7c49ee,0xb6e70884
	.word	0x1e4d866c,0xd171e302
	.word	0x49cf5e01,0x7937f060
	.word	0x146a0681,0xf2c2c92b
	.word	0x54573398,0xb08f8b35
	.word	0xffff37bf,0x6aeda816
	.word	0x511a1518,0xa78bc0d6
	.word	0x79177e33,0x3c66bb5c
	.word	0x4f1f2a7a,0xc70012c1
	.word	0x8177ca7d,0xd419163e
	.word	0x95091edb,0x2ada683f
	.word	0x661b418e,0x8e5e65ff
	.word	0xeb160c15,0x68ecc188
	.word	0x4aff4ce0,0x36a53442
	.word	0xe8eba8c0,0x17481fa4
	.word	0x5e038ad0,0xcfb45e75
	.word	0x9625f761,0x5e09fc50
	.word	0xb785275b,0x57f6bd5d
	.word	0x62eba06c,0xf24b0ed2
	.word	0x8a4494a6,0x39935082
	.word	0x521fc6a6,0x39888c10
	.word	0xf7ff6a88,0x22244ce0
	.word	0x06c465eb,0x9c4969fb
	.word	0x50da0b25,0x556236a6
	.word	0x7661f9e8,0x2c985984
	.word	0x0fd840c5,0x78336b59
	.word	0xb5e75a5d,0x618cc16c
	.word	0x62845a5d,0x0edc5cc0
	.word	0x8c82a018,0x2055198b
	.word	0x4cbe7723,0x7167e428
	.word	0x353c9caf,0x9f0d0529
	.word	0x44c71435,0x7fd27dfa
	.word	0x2cdeb2c6,0x8fb92240
	.word	0x8dd30620,0x97dc727c
	.word	0x71dae224,0xcd430122
	.word	0x44688c77,0xe389ac86
	.word	0xe170f152,0xc3ac65f0
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
	.word	0x9e93ec57,0xed731119
	.word	0x00000000,0x00000002
	.word	0x40417b67,0x90ead7ce
	.word	0x00000000,0x00000003
	.word	0x923564ef,0xb76957c1
	.word	0x00000000,0x00000004
	.word	0x9c9cdd87,0xdb058223
	.word	0x00000000,0x00000005
	.word	0x93693c68,0x37d5e0ce
	.word	0x00000000,0x00000006
	.word	0xdd1d3cbf,0xb06c49eb
	.word	0x00000000,0x00000007
	.word	0xc95594df,0xc6918876
	.word	0x00000000,0x00000008
	.word	0x61305420,0x4f33d83e
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
	.word	0xd3abd30e,0x2155b8c4,0xceb3b799,0xa56849f1
	.word	0x185513f8,0x7b99f878,0xa7d756a7,0xfbece2be
	.word	0xf218444f,0xb0e78089,0xdc4fb833,0xbf2fc9c8
	.word	0x5570b11d,0x605aab5c,0xb25ee3dd,0xcf88a66f
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
	.word	0xdb0bfd23,0x2ed80ec1,0x3074817d,0xe4f90e2a
	.word	0x862ad7ef,0x5fa35308,0x64a0efb6,0x257ee6fa
	.word	0x8d9a36a9,0x4830182b,0xd0ee2a5a,0xfbc929ba
	.word	0x105be782,0x93c5d2d1,0x940e4ade,0x87ce244b
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
	.word	0xa22632d3,0xd07c4d1e,0x8f3fd040,0x39f823e6
	.word	0xeca4f0ab,0x65ae1846,0xfab62615,0xe275c067
	.word	0xede75d23,0x7d5a797b,0xd9c5dfe6,0xf86c3336
	.word	0x67939d6b,0xb73a9ac9,0x1dd83067,0xffe8eccc
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
	.word	0x06c7b421,0x8398d40a,0x899adc33,0xff517b31
	.word	0x141abdff,0x672182c0,0xfdbf84d7,0x1f518473
	.word	0xeed81a7a,0xbd5fc3d8,0xe0231644,0x3835c3c9
	.word	0x89ddccb5,0x973243f9,0xdd2d2927,0x93a11e96
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
	.word	0x20111a10,0xf29dbf8a,0x4d686ff2,0xf1a6dfe2
	.word	0x9daead72,0x3d60a266,0x34df140a,0xeb8541c3
	.word	0xff4a02e7,0xfafdc045,0x4d6791ca,0x810ff2fb
	.word	0x8d34ba01,0xc7f80afc,0xc86f6dfa,0xae1cdcd0
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
	.word	0x6be38774,0x8271dc6d,0x44429bd5,0xd478c577
	.word	0xcca234b3,0xcf1fc7b0,0xc5d81bb6,0x4fb02962
	.word	0xd96a8830,0x63d8ffc9,0x30f2fe35,0x4ec7a21a
	.word	0x76378999,0x3220aafe,0x42b1bfaa,0xa93cedbd
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
	.word	0xdd9ad2e9,0x7ae6bc84,0x1af1acda,0x2899a9c6
	.word	0xe97d9b19,0x637f6beb,0x9528a84b,0x1d84bced
	.word	0x6d923ff4,0xa06208d5,0x4cecc3fb,0x89227b80
	.word	0x54613167,0x2a88f947,0x157d4a4d,0xb53f352f
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
	.word	0x9af0f88f,0x482217b6,0x76ad0d8e,0x6bb216b7
	.word	0x285e93d3,0x42680a77,0x607810ef,0x5950daf9
	.word	0xe8bbf79b,0x96bd842c,0xcd5b7f9f,0x7855148b
	.word	0x4e35b02b,0x68873977,0xcdceed77,0x60535a2f
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
	.word	0xf99370f9,0xb2e29e30,0xe90dd9a2,0xf13130af
	.word	0xbde478a9,0x1fbbe594,0xf1da490a,0x8ec5e15b
	.word	0xa9e450bc,0x9965483d,0xeaf4a174,0x6dabee61
	.word	0xc3438a9b,0x9ce49b57,0x59b9ad5e,0x4164c439
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
	.word	0x07e03aec,0x5557097f,0xc4b07af0,0x9720c804
	.word	0xe7809014,0xa2212971,0xb503d525,0x36fbcec4
	.word	0x3edb6274,0x0b913d7d,0xcf76cb0a,0x7444f0a7
	.word	0x7fcedb97,0x761dc0b8,0xb5461c25,0x4a9f37ad
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
	.word	0x3af8cdfb,0x108689c0,0x4cf4137a,0x605c70a5
	.word	0xac38f4dc,0x1bb9f98d,0xae20de43,0x18cb7144
	.word	0x680b8433,0xa0e0805f,0xd184f620,0x47eea4a2
	.word	0x1c4dac65,0xb3ae6c4e,0xaabd396d,0x2ea0965c
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
	.word	0x3c470a68,0xd046c574,0x30cddfc1,0x0e2193d1
	.word	0x71138651,0xce321760,0x2c29b42f,0xdaecdf4c
	.word	0xc930c085,0xc708073f,0x16b6b0d2,0x61a3aebe
	.word	0x3e12147d,0xa1050441,0x3fbc3a07,0x5264b172
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
	.word	0x6dc0b99b,0x972211f2,0x12d50b01,0xbfb3f0fa
	.word	0x136427e1,0x5970dae6,0x77af373e,0xff915b93
	.word	0x916a153e,0xa98b8a0a,0x8813d4f4,0x1719e847
	.word	0x9685a354,0x6d58355b,0x9bc3ad66,0xa8baaeab
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
	.word	0x2af94cb5,0xe60429de,0x00e5fce0,0x7d23f828
	.word	0x659be073,0x138969d1,0x12b2c461,0xc27fbf15
	.word	0x44ae15f7,0x1e34622f,0x0d233247,0x8953a05d
	.word	0x3769cd7e,0x1f784657,0x72d8dea6,0x5dfea6e6
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
	.word	0xcdb78a5f,0xf1aea331,0xd030bbdd,0xb83a2000
	.word	0x1db9a9a8,0x6f955801,0x00f86c36,0xe81d4b08
	.word	0x0f4e3436,0x330562d8,0x1596a50d,0x9288d3f9
	.word	0x0eab70ae,0x6a267f10,0xbeb2f1f2,0xb5f24890
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
	.word	0x25bf5afb,0xf55c5830,0xc4e2cbfb,0x6056e3a8
	.word	0x90689602,0xefab2fcc,0xa75dea81,0x4c0a8025
	.word	0x8f190ecb,0xc9d66075,0xab4c26b3,0x617d0a03
	.word	0x9cac17ff,0xfe35b1d5,0x20f3aaeb,0x25e3e0a3
	.word	0x8d4f8327,0xcf35281f,0xeaf59704,0x76b3c965
	.word	0xd41a40d1,0xdc9f633e,0x776edec5,0x0709a8ca
	.word	0xceff04a1,0xfe127848,0x04cb5b2e,0x388982b5
	.word	0xd116b1bf,0x32e2c9a0,0xfb41b5b0,0x753052d1
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
	.word	0x0dbf6217,0x70c84bb9,0x455cae17,0xe1a47622
	.word	0xeef58e6f,0x40e5f71b,0x4d8c1844,0xcd02fc24
	.word	0x0208d8c5,0x139e0439,0x40535dd7,0x32624e61
	.word	0xce4e9e59,0x8299f141,0x544d8445,0xc71decc0
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
	.word	0x676ce2e2,0x6234a9b8,0x6e2a2c37,0x2ad5ffc3
	.word	0xe4ceebbc,0x064e2d5a,0xbaeba7c4,0x28ebe866
	.word	0x09c24a6a,0x61a081dc,0x393d62ce,0xe652b4f8
	.word	0x91c2a2bf,0x04915610,0x7051d82c,0x841d4821
	.word	0x5af7c5e9,0x4fac8a29,0x21e65134,0x931413c6
	.word	0x2462838a,0x287876f1,0xb4f1fa3e,0x6b9fbb97
	.word	0x7b7f6af6,0x41e8e4c9,0x7a806112,0xe40292cb
	.word	0x0f846c3c,0x2541e0d6,0x1a0742ab,0xd2584637
	.word	0xd8a1d810,0x249dab34,0xb6d8df2c,0x3b590b35
	.word	0xd0ff18ba,0x48cb2ea5,0x207e4efd,0x701f4a00
	.word	0xb5af8111,0x723e6d98,0x0b49410c,0xd0147d94
	.word	0x85bc6a3f,0x40b1b310,0x2681a7c1,0xb557b39f
	.word	0x17bde748,0x73e9c277,0xb2cb39ee,0x2dc0882c
	.word	0xcd5519f3,0xd7d5f621,0xdf7c49ee,0xb6e70884
	.word	0x1e4d866c,0xd171e302,0x49cf5e01,0x7937f060
	.word	0x146a0681,0xf2c2c92b,0x54573398,0xb08f8b35
	.word	0x38e937bf,0x6aeda816,0x511a1518,0xa78bc0d6
	.word	0x79177e33,0x3c66bb5c,0x4f1f2a7a,0xc70012c1
	.word	0x8177ca7d,0xd419163e,0x95091edb,0x2ada683f
	.word	0x661b418e,0x8e5e65ff,0xeb160c15,0x68ecc188
	.word	0x668f4ce0,0x36a53442,0xe8eba8c0,0x17481fa4
	.word	0x5e038ad0,0xcfb45e75,0x9625f761,0x5e09fc50
	.word	0xb785275b,0x57f6bd5d,0x62eba06c,0xf24b0ed2
	.word	0x8a4494a6,0x39935082,0x521fc6a6,0x39888c10
	.word	0xf69b6a88,0x22244ce0,0x06c465eb,0x9c4969fb
	.word	0x50da0b25,0x556236a6,0x7661f9e8,0x2c985984
	.word	0x0fd840c5,0x78336b59,0xb5e75a5d,0x618cc16c
	.word	0x62845a5d,0x0edc5cc0,0x8c82a018,0x2055198b
	.word	0x4cb07723,0x7167e428,0x353c9caf,0x9f0d0529
	.word	0x44c71435,0x7fd27dfa,0x2cdeb2c6,0x8fb92240
	.word	0x8dd30620,0x97dc727c,0x71dae224,0xcd430122
	.word	0x44688c77,0xe389ac86,0xe170f152,0xc3ac65f0
share3_end:
