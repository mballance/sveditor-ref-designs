/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: mpgen_1500_16.s
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
!	Seed = 626121605
!	Riesling can be on
!	1 Thread, 1500 lines
!	mpgen   created on May 4, 2009 (15:17:56), Version 2.81
!	mpgen_1500_16.s created on Jun 26, 2009 (12:16:05)
!	RC file : random.rc
!	cmd = /import/n2-tools/release/tools/mpgen/mpgen,1.090504 -rc random.rc -o mpgen_1500_16 -p 1 -l 1500

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
!	%f0  = 3ae18290 55d21e61 43d5344e 67dbda67
!	%f4  = 1a75c47c 0e79351d 11e08a9a 69d57803
!	%f8  = 5ab7ba28 36d3d899 719242a6 2c53d85f
!	%f12 = 20f2af94 3d80a4d5 313d0872 06c3777b
	ldda	[%g1]ASI_BLK_P,%f0
	add	%g1,64,%g1
!	%f16 = 16e3b0c0 71b0f5d1 62c347fe 69099157
!	%f20 = 5a6589ac 78a4e78d 5da32d4a 1de021f3
!	%f24 = 0cdcc658 0be75609 6ec2a456 6bf1e54f
!	%f28 = 0e63b2c4 5c49dd45 21fb5922 51b6576b
	ldda	[%g1]ASI_BLK_P,%f16
	add	%g1,64,%g1
!	%f32 = 30b65af0 35a0d941 5166b7ae 580db447
!	%f36 = 6dde8adc 3f3f65fd 6669ebfa 379cf7e3
!	%f40 = 6e9fce88 75335f79 7881e206 4ce9de3f
!	%f44 = 6ca371f4 364161b5 35cf45d2 1736e35b
	ldda	[%g1]ASI_BLK_P,%f32

!	Set up the Graphics Status Register

	setx	0x8b05f16a00000056,%g7,%g1 ! %gsr scale = 10, align = 6
	wr	%g1,%g0,%gsr		! %gsr = 8b05f16a00000056

	wr	%g0,%y			! Clear %y register
	xorcc	%g0,%g0,%g3		! %g3 = 0, %ccr = 44
	membar	#Sync			! Force the block loads to complete

!	Start of Random Code for processor 0

p0_label_1:
!	Starting 10 instruction Store Burst
!	Mem[0000000030181400] = c0730010, %l5 = 0000000083c7a6f5
	swapa	[%i6+%g0]0x89,%l5	! %l5 = 00000000c0730010
!	%f4  = 1a75c47c 0e79351d, %l3 = 0cc569211866de2f
!	Mem[0000000010141418] = 7fbf643a53f46723
	add	%i5,0x018,%g1
	stda	%f4,[%g1+%l3]ASI_PST16_PL ! Mem[0000000010141418] = 1d35790e7cc4751a
!	%l7 = afccd7e789e79ffb, Mem[00000000100c1410] = 0e1b045c4b30097d
	stxa	%l7,[%i3+%o5]0x80	! Mem[00000000100c1410] = afccd7e789e79ffb
!	%l6 = 3d3518eb8f7a0df0, Mem[0000000030141408] = 9e17a010
	stha	%l6,[%i5+%o4]0x89	! Mem[0000000030141408] = 9e170df0
!	%l6 = 3d3518eb8f7a0df0, %l2 = 424eec46433ca664, %y  = 00000000
	smul	%l6,%l2,%l0		! %l0 = e272491e44f711c0, %y = e272491e
!	%f6  = 11e08a9a 69d57803, Mem[00000000300c1410] = 2086218c 24f2b3ed
	stda	%f6 ,[%i3+%o5]0x81	! Mem[00000000300c1410] = 11e08a9a 69d57803
!	Mem[0000000030081410] = 2c230c44, %l0 = 0000000044f711c0
	swapa	[%i2+%o5]0x89,%l0	! %l0 = 000000002c230c44
!	%f28 = 0e63b2c4, Mem[0000000030041408] = 3ec14a1e
	sta	%f28,[%i1+%o4]0x81	! Mem[0000000030041408] = 0e63b2c4
!	Mem[0000000010101408] = 7813d88e, %l2 = 00000000433ca664
	swapa	[%i4+%o4]0x80,%l2	! %l2 = 000000007813d88e
!	Mem[0000000030181410] = 5201bcac, %l3 = 000000001866de2f
	swapa	[%i6+%o5]0x81,%l3	! %l3 = 000000005201bcac

p0_label_2:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = 9ce7fa6c, %f8  = 5ab7ba28
	lda	[%i1+%o5]0x88,%f8 	! %f8 = 9ce7fa6c
!	Mem[0000000010041404] = 1b36df01, %f19 = 69099157
	ld	[%i1+0x004],%f19	! %f19 = 1b36df01
!	Mem[0000000030041408] = 0e63b2c43f77b6f7, %f30 = 21fb5922 51b6576b
	ldda	[%i1+%o4]0x81,%f30	! %f30 = 0e63b2c4 3f77b6f7
!	%l4 = ecd8878adbafa80a, %l5 = 00000000c0730010, %y  = e272491e
	sdiv	%l4,%l5,%l4		! %l4 = 00000000770cc697
	mov	%l0,%y			! %y = 2c230c44
!	Mem[0000000010101408] = 433ca664, %l5 = 00000000c0730010
	lduha	[%i4+%o4]0x80,%l5	! %l5 = 000000000000433c
!	Mem[0000000010081408] = 0d43e1ce2d4561e7, %f14 = 313d0872 06c3777b
	ldd	[%i2+%o4],%f14		! %f14 = 0d43e1ce 2d4561e7
!	Mem[0000000010141400] = 4b801d30, %l1 = c51059930d6feda9
	ldsha	[%i5+%g0]0x80,%l1	! %l1 = 0000000000004b80
!	Mem[0000000030041408] = c4b2630e, %l5 = 000000000000433c
	ldsha	[%i1+%o4]0x89,%l5	! %l5 = 000000000000630e
!	Mem[0000000010101434] = 6902e215, %l7 = afccd7e789e79ffb, %asi = 80
	lduwa	[%i4+0x034]%asi,%l7	! %l7 = 000000006902e215
!	Mem[0000000010041410] = 9ce7fa6c, %l6 = 3d3518eb8f7a0df0
	ldswa	[%i1+%o5]0x88,%l6	! %l6 = ffffffff9ce7fa6c

p0_label_3:
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1410] = afccd7e7, %l6 = 000000009ce7fa6c
	swapa	[%i3+%o5]0x80,%l6	! %l6 = 00000000afccd7e7
!	Mem[0000000010101410] = 65087abc, %l1 = 0000000000004b80
	ldstuba	[%i4+%o5]0x80,%l1	! %l1 = 0000000000000065
!	%o0 = deadbeefdeadbeef
	set	share0_start,%o0	! set %o0[0] to VA
!	Mem[00000000201c0000] = 52b2ddf0, %l6 = 00000000afccd7e7
	ldstuba	[%o0+0x000]%asi,%l6	! %l6 = 0000000000000052
!	%f17 = 71b0f5d1, Mem[0000000030081408] = 69b0d57e
	sta	%f17,[%i2+%o4]0x81	! Mem[0000000030081408] = 71b0f5d1
!	%l3 = 000000005201bcac, Mem[0000000030081400] = 40926208
	stba	%l3,[%i2+%g0]0x89	! Mem[0000000030081400] = 409262ac
!	Mem[000000001014142d] = 4363717f, %l7 = 000000006902e215
	ldstub	[%i5+0x02d],%l7		! %l7 = 0000000000000063
!	%l1 = 0000000000000065, Mem[00000000300c1408] = 3395d0de
	stwa	%l1,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00000065
!	%l7 = 0000000000000063, Mem[0000000010181400] = 5dce8590368d3561
	stxa	%l7,[%i6+%g0]0x80	! Mem[0000000010181400] = 0000000000000063
!	%l3 = 000000005201bcac, Mem[0000000030081410] = c011f744
	stha	%l3,[%i2+%o5]0x81	! Mem[0000000030081410] = bcacf744
!	%f16 = 16e3b0c0 71b0f5d1, Mem[0000000010041408] = 2e060e6e 020a7807
	std	%f16,[%i1+%o4]		! Mem[0000000010041408] = 16e3b0c0 71b0f5d1

p0_label_4:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = 9ce7fa6c, %l4 = 00000000770cc697
	lduha	[%i1+%o5]0x88,%l4	! %l4 = 000000000000fa6c
!	Mem[0000000030101410] = ec0f1d3b, %l7 = 0000000000000063
	ldsba	[%i4+%o5]0x89,%l7	! %l7 = 000000000000003b
!	Mem[000000001014140e] = 2c883f87, %l4 = 000000000000fa6c, %asi = 80
	ldsha	[%i5+0x00e]%asi,%l4	! %l4 = 0000000000003f87
!	Mem[0000000010101410] = ff087abc, %l2 = 000000007813d88e
	lduwa	[%i4+%o5]0x80,%l2	! %l2 = 00000000ff087abc
!	Mem[0000000030101408] = 3e3c8858, %l0 = 000000002c230c44
	ldswa	[%i4+%o4]0x89,%l0	! %l0 = 000000003e3c8858
!	Mem[000000001008143c] = 29e146fb, %l4 = 0000000000003f87
	ldsh	[%i2+0x03c],%l4		! %l4 = 00000000000029e1
!	Mem[0000000010101424] = 3d35d1d9, %l1 = 0000000000000065
	lduh	[%i4+0x024],%l1		! %l1 = 0000000000003d35
!	Mem[0000000010001420] = 5e6bd2e8, %l4 = 00000000000029e1, %asi = 80
	lduwa	[%i0+0x020]%asi,%l4	! %l4 = 000000005e6bd2e8
!	Mem[00000000100c1400] = 701c4575, %l3 = 000000005201bcac
	lduwa	[%i3+%g0]0x88,%l3	! %l3 = 00000000701c4575
!	Mem[0000000010001408] = 273e35650eab195c, %f24 = 0cdcc658 0be75609
	ldda	[%i0+%o4]0x88,%f24	! %f24 = 273e3565 0eab195c

p0_label_5:
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1410] = 9a8ae011, %l3 = 00000000701c4575
	swapa	[%i3+%o5]0x89,%l3	! %l3 = 000000009a8ae011
!	%l3 = 000000009a8ae011, Mem[0000000010141408] = eefbd57b
	stwa	%l3,[%i5+%o4]0x88	! Mem[0000000010141408] = 9a8ae011
!	Mem[0000000030001400] = 80413f2a, %l3 = 000000009a8ae011
	swapa	[%i0+%g0]0x89,%l3	! %l3 = 0000000080413f2a
!	Mem[0000000030141408] = f00d179e76fcde77, %l2 = 00000000ff087abc
	ldxa	[%i5+%o4]0x81,%l2	! %l2 = f00d179e76fcde77
!	%l4 = 000000005e6bd2e8, Mem[0000000030101410] = 3b1d0fec
	stba	%l4,[%i4+%o5]0x81	! Mem[0000000030101410] = e81d0fec
!	%l2 = f00d179e76fcde77, Mem[0000000010001410] = 2d18413c
	stha	%l2,[%i0+%o5]0x80	! Mem[0000000010001410] = de77413c
!	Mem[0000000030181408] = fe62f50f, %l1 = 0000000000003d35
	swapa	[%i6+%o4]0x89,%l1	! %l1 = 00000000fe62f50f
!	Mem[0000000010101408] = 433ca664, %l7 = 000000000000003b
	ldstuba	[%i4+%o4]0x80,%l7	! %l7 = 0000000000000043
!	Mem[0000000010101400] = 7e6fa4d0, %l7 = 0000000000000043
	swapa	[%i4+%g0]0x80,%l7	! %l7 = 000000007e6fa4d0
!	%l3 = 0000000080413f2a, Mem[0000000010041408] = d1f5b071c0b0e316
	stxa	%l3,[%i1+%o4]0x88	! Mem[0000000010041408] = 0000000080413f2a

p0_label_6:
!	Starting 10 instruction Load Burst
!	%o2 = deadbeefdeadbeef
	set	share2_start,%o2	! set %o2[0] to VA
!	Mem[00000000211c0001] = 4efb0480, %l0 = 000000003e3c8858, %asi = 80
	ldsba	[%o2+0x001]%asi,%l0	! %l0 = fffffffffffffffb
!	Mem[0000000030181408] = 353d0000, %l0 = fffffffffffffffb
	lduha	[%i6+%o4]0x81,%l0	! %l0 = 000000000000353d
	membar	#Sync			! Added by membar checker (1)
!	Mem[0000000030181400] = f5a6c783 0f04ccd1 353d0000 08e66057
!	Mem[0000000030181410] = 1866de2f 3c146e8d 6b74384a 23ca20f3
!	Mem[0000000030181420] = 40536958 28818d09 0ea59f56 3fb0144f
!	Mem[0000000030181430] = 3dffc5c4 664dc445 63d34422 79bfb66b
	ldda	[%i6+%g0]ASI_BLK_AIUSL,%f16	! Block Load from 0000000030181400
!	Mem[0000000010101408] = ff3ca66465cc45a7, %f10 = 719242a6 2c53d85f
	ldda	[%i4+%o4]0x80,%f10	! %f10 = ff3ca664 65cc45a7
!	Mem[0000000030001410] = 6cf60e46, %l5 = 000000000000630e
	lduwa	[%i0+%o5]0x89,%l5	! %l5 = 000000006cf60e46
!	Mem[0000000030081400] = ac62924011396151, %l1 = 00000000fe62f50f
	ldxa	[%i2+%g0]0x81,%l1	! %l1 = ac62924011396151
!	Mem[00000000211c0000] = 4efb0480, %l2 = f00d179e76fcde77, %asi = 80
	ldsha	[%o2+0x000]%asi,%l2	! %l2 = 0000000000004efb
!	Mem[00000000100c1410] = 6cfae79c, %l0 = 000000000000353d
	ldsha	[%i3+%o5]0x88,%l0	! %l0 = ffffffffffffe79c
!	Mem[0000000030041400] = 63cbf1e0, %l5 = 000000006cf60e46
	lduha	[%i1+%g0]0x81,%l5	! %l5 = 00000000000063cb
!	Mem[0000000030081410] = bcacf7444f832b0d, %l3 = 0000000080413f2a
	ldxa	[%i2+%o5]0x81,%l3	! %l3 = bcacf7444f832b0d

p0_label_7:
!	Starting 10 instruction Store Burst
!	%l3 = bcacf7444f832b0d, immd = 00000ae3, %y  = 2c230c44
	umul	%l3,0xae3,%l4		! %l4 = 00000361a0fdae87, %y = 00000361
!	%l5 = 00000000000063cb, Mem[00000000300c1400] = 535b22a0
	stba	%l5,[%i3+%g0]0x81	! Mem[00000000300c1400] = cb5b22a0
!	%l6 = 0000000000000052, Mem[0000000030001410] = 4da93d136cf60e46
	stxa	%l6,[%i0+%o5]0x89	! Mem[0000000030001410] = 0000000000000052
!	%l1 = ac62924011396151, Mem[000000001010140c] = 65cc45a7, %asi = 80
	stwa	%l1,[%i4+0x00c]%asi	! Mem[000000001010140c] = 11396151
!	%l6 = 0000000000000052, Mem[0000000010041410] = 6cfae79c
	stba	%l6,[%i1+%o5]0x80	! Mem[0000000010041410] = 52fae79c
!	%f15 = 2d4561e7, Mem[00000000300c1400] = cb5b22a0
	sta	%f15,[%i3+%g0]0x81	! Mem[00000000300c1400] = 2d4561e7
!	%l6 = 00000052, %l7 = 7e6fa4d0, Mem[0000000010001400] = 07b92350 546fc421
	stda	%l6,[%i0+%g0]0x80	! Mem[0000000010001400] = 00000052 7e6fa4d0
!	%l5 = 00000000000063cb, Mem[0000000010041410] = bd57e9529ce7fa52
	stxa	%l5,[%i1+%o5]0x88	! Mem[0000000010041410] = 00000000000063cb
!	%l4 = 00000361a0fdae87, Mem[0000000010141400] = 812a657d301d804b
	stxa	%l4,[%i5+%g0]0x88	! Mem[0000000010141400] = 00000361a0fdae87
!	Mem[0000000010041400] = b0db4135, %l5 = 00000000000063cb
	ldstuba	[%i1+%g0]0x88,%l5	! %l5 = 0000000000000035

p0_label_8:
!	Starting 10 instruction Load Burst
!	%o3 = deadbeefdeadbeef
	set	share3_start,%o3	! set %o3[0] to VA
!	Mem[00000000218001c0] = 19076600, %l4 = 00000361a0fdae87
	ldsb	[%o3+0x1c0],%l4		! %l4 = 0000000000000019
!	Mem[0000000010181410] = 37d6377c, %l4 = 0000000000000019, %asi = 80
	ldswa	[%i6+0x010]%asi,%l4	! %l4 = 0000000037d6377c
!	Mem[00000000201c0000] = ffb2ddf0, %l6 = 0000000000000052
	ldsb	[%o0+%g0],%l6		! %l6 = ffffffffffffffff
!	%l0 = ffffffffffffe79c, imm = 0000000000000145, %l1 = ac62924011396151
	andn	%l0,0x145,%l1		! %l1 = ffffffffffffe698
!	Mem[00000000300c1400] = e761452d, %l2 = 0000000000004efb
	ldswa	[%i3+%g0]0x89,%l2	! %l2 = ffffffffe761452d
!	Mem[0000000010081414] = 56bd189d, %l7 = 000000007e6fa4d0, %asi = 80
	lduha	[%i2+0x014]%asi,%l7	! %l7 = 00000000000056bd
!	Mem[00000000211c0001] = 4efb0480, %l1 = ffffffffffffe698
	ldub	[%o2+0x001],%l1		! %l1 = 00000000000000fb
!	Mem[0000000030041400] = 63cbf1e0, %l6 = ffffffffffffffff
	ldsba	[%i1+%g0]0x81,%l6	! %l6 = 0000000000000063
!	Mem[00000000100c1400] = 75451c70, %l5 = 0000000000000035
	swap	[%i3+%g0],%l5		! %l5 = 0000000075451c70
!	Mem[00000000211c0000] = 4efb0480, %l7 = 00000000000056bd, %asi = 80
	lduha	[%o2+0x000]%asi,%l7	! %l7 = 0000000000004efb

p0_label_9:
!	Starting 10 instruction Store Burst
!	%f12 = 20f2af94 3d80a4d5, Mem[0000000010181400] = 00000000 63000000
	stda	%f12,[%i6+%g0]0x88	! Mem[0000000010181400] = 20f2af94 3d80a4d5
!	%f5  = 0e79351d, Mem[0000000030041400] = e0f1cb63
	sta	%f5 ,[%i1+%g0]0x89	! Mem[0000000030041400] = 0e79351d
!	%f6  = 11e08a9a 69d57803, Mem[0000000010001400] = 00000052 7e6fa4d0
	stda	%f6 ,[%i0+%g0]0x80	! Mem[0000000010001400] = 11e08a9a 69d57803
!	%l7 = 0000000000004efb, Mem[0000000010181428] = 0f1f7da617ab475f
	stx	%l7,[%i6+0x028]		! Mem[0000000010181428] = 0000000000004efb
!	%l2 = e761452d, %l3 = 4f832b0d, Mem[0000000010181400] = d5a4803d 94aff220
	stda	%l2,[%i6+%g0]0x80	! Mem[0000000010181400] = e761452d 4f832b0d
!	Mem[0000000021800181] = 0cf9a7d0, %l3 = bcacf7444f832b0d
	ldstub	[%o3+0x181],%l3		! %l3 = 00000000000000f9
!	%l5 = 0000000075451c70, %l1 = 00000000000000fb, %l4 = 0000000037d6377c
	addc	%l5,%l1,%l4		! %l4 = 0000000075451d6b
!	%l3 = 00000000000000f9, Mem[0000000010181400] = 2d4561e7
	stwa	%l3,[%i6+%g0]0x88	! Mem[0000000010181400] = 000000f9
!	Mem[0000000010081418] = 2f10b01a, %l2 = 00000000e761452d, %asi = 80
	swapa	[%i2+0x018]%asi,%l2	! %l2 = 000000002f10b01a
!	%f10 = ff3ca664 65cc45a7, Mem[0000000010001410] = de77413c 0d3cc6dd, %asi = 80
	stda	%f10,[%i0+0x010]%asi	! Mem[0000000010001410] = ff3ca664 65cc45a7

p0_label_10:
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = 4efb0480, %l4 = 0000000075451d6b
	lduh	[%o2+%g0],%l4		! %l4 = 0000000000004efb
!	Mem[0000000010001408] = 5c19ab0e, %l7 = 0000000000004efb
	lduha	[%i0+%o4]0x80,%l7	! %l7 = 0000000000005c19
!	Mem[0000000010101410] = ff087abc, %l7 = 0000000000005c19
	ldsw	[%i4+%o5],%l7		! %l7 = ffffffffff087abc
!	Mem[0000000010101408] = ff3ca664, %l0 = ffffffffffffe79c
	lduwa	[%i4+%o4]0x80,%l0	! %l0 = 00000000ff3ca664
!	Mem[00000000100c1400] = 00000035, %f28 = 45c44d66
	lda	[%i3+%g0]0x80,%f28	! %f28 = 00000035
!	Mem[0000000010041410] = cb630000, %f18 = 5760e608
	lda	[%i1+0x010]%asi,%f18	! %f18 = cb630000
!	Mem[0000000010081410] = 1e5e7dfc, %l7 = ffffffffff087abc
	lduha	[%i2+%o5]0x80,%l7	! %l7 = 0000000000001e5e
!	Mem[0000000030141408] = 9e170df0, %f15 = 2d4561e7
	lda	[%i5+%o4]0x89,%f15	! %f15 = 9e170df0
!	Mem[0000000010081408] = 0d43e1ce2d4561e7, %f2  = 43d5344e 67dbda67, %asi = 80
	ldda	[%i2+0x008]%asi,%f2 	! %f2  = 0d43e1ce 2d4561e7
!	Mem[0000000010001434] = 74b74e95, %f14 = 0d43e1ce
	lda	[%i0+0x034]%asi,%f14	! %f14 = 74b74e95

p0_label_11:
!	Starting 10 instruction Store Burst
!	Mem[0000000030181400] = f5a6c783, %l0 = 00000000ff3ca664
	ldstuba	[%i6+%g0]0x81,%l0	! %l0 = 00000000000000f5
!	Mem[0000000010081410] = 1e5e7dfc, %l0 = 00000000000000f5
	swapa	[%i2+%o5]0x80,%l0	! %l0 = 000000001e5e7dfc
!	%l7 = 0000000000001e5e, Mem[00000000100c1410] = 9ce7fa6c
	stha	%l7,[%i3+%o5]0x80	! Mem[00000000100c1410] = 1e5efa6c
!	Mem[0000000010101418] = 2ea362da, %l1 = 00000000000000fb, %asi = 80
	swapa	[%i4+0x018]%asi,%l1	! %l1 = 000000002ea362da
!	%l0 = 000000001e5e7dfc, %l5 = 0000000075451c70, %l0 = 000000001e5e7dfc
	xor	%l0,%l5,%l0		! %l0 = 000000006b1b618c
!	Mem[00000000100c1432] = 39dbdb74, %l3 = 00000000000000f9
	ldstub	[%i3+0x032],%l3		! %l3 = 00000000000000db
!	Mem[0000000010181418] = 0a87d59a, %l2 = 000000002f10b01a
	ldstuba	[%i6+0x018]%asi,%l2	! %l2 = 000000000000000a
!	%f14 = 74b74e95 9e170df0, %l2 = 000000000000000a
!	Mem[0000000030141430] = 0359fb6413311f65
	add	%i5,0x030,%g1
	stda	%f14,[%g1+%l2]ASI_PST32_S ! Mem[0000000030141430] = 74b74e9513311f65
!	Mem[0000000030141410] = 4ceea806, %l0 = 000000006b1b618c
	swapa	[%i5+%o5]0x89,%l0	! %l0 = 000000004ceea806
!	%l5 = 0000000075451c70, Mem[0000000030041410] = 0ed714cc2c6ed22d
	stxa	%l5,[%i1+%o5]0x81	! Mem[0000000030041410] = 0000000075451c70

p0_label_12:
!	Starting 10 instruction Load Burst
!	Mem[0000000030181410] = 1866de2f, %l7 = 0000000000001e5e
	lduwa	[%i6+%o5]0x81,%l7	! %l7 = 000000001866de2f
!	Mem[0000000030141408] = 9e170df0, %l6 = 0000000000000063
	lduha	[%i5+%o4]0x89,%l6	! %l6 = 0000000000000df0
	membar	#Sync			! Added by membar checker (2)
!	Mem[0000000010101400] = 00000043 0d0d4fa1 ff3ca664 11396151
!	Mem[0000000010101410] = ff087abc 4eba2a5d 000000fb 2808c743
!	Mem[0000000010101420] = 4f634468 3d35d1d9 757f8ee6 71ef4b9f
!	Mem[0000000010101430] = 51ff4dd4 6902e215 36cf08b2 52f04ebb
	ldda	[%i4+%g0]ASI_BLK_AIUPL,%f16	! Block Load from 0000000010101400
!	Mem[0000000030001408] = 72af2ebe 4806a517, %l0 = 4ceea806, %l1 = 2ea362da
	ldda	[%i0+%o4]0x81,%l0	! %l0 = 0000000072af2ebe 000000004806a517
!	Mem[0000000030141410] = 8c611b6b 24c355ad, %l0 = 72af2ebe, %l1 = 4806a517
	ldda	[%i5+%o5]0x81,%l0	! %l0 = 000000008c611b6b 0000000024c355ad
!	Mem[00000000100c1408] = 2e25eb3b, %l2 = 000000000000000a
	ldsha	[%i3+%o4]0x88,%l2	! %l2 = ffffffffffffeb3b
!	Mem[0000000010181400] = f9000000, %l0 = 000000008c611b6b
	lduwa	[%i6+%g0]0x80,%l0	! %l0 = 00000000f9000000
!	Mem[0000000030181408] = 00003d35, %l0 = 00000000f9000000
	ldsha	[%i6+%o4]0x89,%l0	! %l0 = 0000000000003d35
!	Mem[0000000030081408] = d1f5b071, %l4 = 0000000000004efb
	ldsha	[%i2+%o4]0x89,%l4	! %l4 = ffffffffffffb071
!	Mem[0000000010141400] = 87aefda0, %l5 = 0000000075451c70, %asi = 80
	lduwa	[%i5+0x000]%asi,%l5	! %l5 = 0000000087aefda0

p0_label_13:
!	Starting 10 instruction Store Burst
!	Mem[0000000010081428] = 2ddd60265ca20fdf, %l3 = 00000000000000db, %l5 = 0000000087aefda0
	add	%i2,0x28,%g1
	casxa	[%g1]0x80,%l3,%l5	! %l5 = 2ddd60265ca20fdf
!	Mem[00000000300c1410] = 701c4575, %l4 = ffffffffffffb071
	ldstuba	[%i3+%o5]0x89,%l4	! %l4 = 0000000000000075
!	%l2 = ffffffffffffeb3b, Mem[00000000100c1410] = 1e5efa6c89e79ffb
	stxa	%l2,[%i3+%o5]0x80	! Mem[00000000100c1410] = ffffffffffffeb3b
!	%f2  = 0d43e1ce 2d4561e7, %l3 = 00000000000000db
!	Mem[0000000010041430] = 6511c6b45e5a6b75
	add	%i1,0x030,%g1
	stda	%f2,[%g1+%l3]ASI_PST16_P ! Mem[0000000010041430] = 0d43c6b42d4561e7
!	%f30 = bb4ef052, Mem[0000000030141408] = 9e170df0
	sta	%f30,[%i5+%o4]0x89	! Mem[0000000030141408] = bb4ef052
!	Mem[000000001010141c] = 2808c743, %l6 = 00000df0, %l1 = 24c355ad
	add	%i4,0x1c,%g1
	casa	[%g1]0x80,%l6,%l1	! %l1 = 000000002808c743
!	%l6 = 00000df0, %l7 = 1866de2f, Mem[0000000030041410] = 00000000 701c4575
	stda	%l6,[%i1+%o5]0x89	! Mem[0000000030041410] = 00000df0 1866de2f
!	%f13 = 3d80a4d5, Mem[0000000010081408] = 0d43e1ce
	sta	%f13,[%i2+%o4]0x80	! Mem[0000000010081408] = 3d80a4d5
!	%l3 = 00000000000000db, imm = fffffffffffff33a, %l0 = 0000000000003d35
	add	%l3,-0xcc6,%l0		! %l0 = fffffffffffff415
!	Mem[0000000030181410] = 2fde6618, %l4 = 0000000000000075
	swapa	[%i6+%o5]0x89,%l4	! %l4 = 000000002fde6618

p0_label_14:
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = 52f04ebb, %l5 = 2ddd60265ca20fdf
	ldsha	[%i5+%o4]0x81,%l5	! %l5 = 00000000000052f0
!	%l3 = 00000000000000db, %l1 = 000000002808c743, %l6 = 0000000000000df0
	udivx	%l3,%l1,%l6		! %l6 = 0000000000000000
!	Mem[0000000030101410] = ec0f1de8, %l4 = 000000002fde6618
	ldsba	[%i4+%o5]0x89,%l4	! %l4 = ffffffffffffffe8
!	Mem[0000000010041410] = cb630000, %l2 = ffffffffffffeb3b
	lduba	[%i1+%o5]0x80,%l2	! %l2 = 00000000000000cb
!	Mem[0000000021800181] = 0cffa7d0, %l0 = fffffffffffff415
	ldub	[%o3+0x181],%l0		! %l0 = 00000000000000ff
!	Mem[00000000300c1410] = ff451c70, %l3 = 00000000000000db
	ldsha	[%i3+%o5]0x81,%l3	! %l3 = ffffffffffffff45
!	Mem[0000000030081408] = d1f5b071, %l2 = 00000000000000cb
	ldswa	[%i2+%o4]0x89,%l2	! %l2 = ffffffffd1f5b071
!	Mem[0000000030101400] = 11b7761800a30d1c, %f8  = 9ce7fa6c 36d3d899
	ldda	[%i4+%g0]0x89,%f8 	! %f8  = 11b77618 00a30d1c
!	Mem[0000000010081410] = f5000000, %f2  = 0d43e1ce
	lda	[%i2+%o5]0x88,%f2 	! %f2 = f5000000
!	Mem[0000000030181400] = d1cc040f83c7a6ff, %l2 = ffffffffd1f5b071
	ldxa	[%i6+%g0]0x89,%l2	! %l2 = d1cc040f83c7a6ff

p0_label_15:
!	Starting 10 instruction Store Burst
!	%l1 = 000000002808c743, Mem[0000000010181420] = 62269d28
	stw	%l1,[%i6+0x020]		! Mem[0000000010181420] = 2808c743
!	%l4 = ffffffffffffffe8, Mem[0000000010081400] = e129ee1e1084a84a
	stxa	%l4,[%i2+%g0]0x88	! Mem[0000000010081400] = ffffffffffffffe8
!	%l2 = d1cc040f83c7a6ff, Mem[00000000300c1410] = 701c45ff
	stba	%l2,[%i3+%o5]0x89	! Mem[00000000300c1410] = 701c45ff
!	%f9  = 00a30d1c, Mem[0000000030001408] = be2eaf72
	sta	%f9 ,[%i0+%o4]0x89	! Mem[0000000030001408] = 00a30d1c
!	%l5 = 00000000000052f0, Mem[00000000100c1410] = ffffffff
	stwa	%l5,[%i3+%o5]0x80	! Mem[00000000100c1410] = 000052f0
!	%l5 = 00000000000052f0, Mem[0000000030181408] = 00003d35
	stha	%l5,[%i6+%o4]0x89	! Mem[0000000030181408] = 000052f0
!	%l2 = d1cc040f83c7a6ff, Mem[0000000010181408] = 7d498f4e
	stba	%l2,[%i6+%o4]0x80	! Mem[0000000010181408] = ff498f4e
!	Mem[0000000030181408] = 000052f0, %l2 = 0000000083c7a6ff
	swapa	[%i6+%o4]0x89,%l2	! %l2 = 00000000000052f0
!	Mem[0000000010181400] = 000000f9, %l2 = 00000000000052f0
	swapa	[%i6+%g0]0x88,%l2	! %l2 = 00000000000000f9
!	%l3 = ffffffffffffff45, Mem[0000000010181408] = 4e8f49ff
	stwa	%l3,[%i6+%o4]0x88	! Mem[0000000010181408] = ffffff45

p0_label_16:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = 64a63cff, %l5 = 00000000000052f0
	lduba	[%i4+%o4]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[00000000100c1418] = 659bd17a0459d763, %l7 = 000000001866de2f
	ldx	[%i3+0x018],%l7		! %l7 = 659bd17a0459d763
!	Mem[0000000010141438] = 6797e612, %l5 = 00000000000000ff
	lduh	[%i5+0x038],%l5		! %l5 = 0000000000006797
!	Mem[0000000030041408] = 0e63b2c4, %l5 = 0000000000006797
	ldsba	[%i1+%o4]0x81,%l5	! %l5 = 000000000000000e
!	Mem[00000000100c1408] = 2e25eb3b, %f15 = 9e170df0
	lda	[%i3+%o4]0x88,%f15	! %f15 = 2e25eb3b
!	Mem[0000000010081400] = e8ffffff, %l3 = ffffffffffffff45
	lduwa	[%i2+%g0]0x80,%l3	! %l3 = 00000000e8ffffff
!	Mem[000000001010143a] = 36cf08b2, %l5 = 000000000000000e
	ldsh	[%i4+0x03a],%l5		! %l5 = 00000000000008b2
!	Mem[00000000100c1400] = 00000035, %f23 = fb000000
	lda	[%i3+0x000]%asi,%f23	! %f23 = 00000035
!	Mem[00000000211c0000] = 4efb0480, %l4 = ffffffffffffffe8, %asi = 80
	lduba	[%o2+0x000]%asi,%l4	! %l4 = 000000000000004e
!	Code Fragment 4, seed = 720917
p0_fragment_1:
!	%l0 = 00000000000000ff
	setx	0xc6fd742ed2649c7e,%g7,%l0 ! %l0 = c6fd742ed2649c7e
!	%l1 = 000000002808c743
	setx	0xfaba033196da8129,%g7,%l1 ! %l1 = faba033196da8129
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = c6fd742ed2649c7e
	setx	0x083fad6ad2c8e1e4,%g7,%l0 ! %l0 = 083fad6ad2c8e1e4
!	%l1 = faba033196da8129
	setx	0x4fcca800b38441af,%g7,%l1 ! %l1 = 4fcca800b38441af
p0_fragment_1_end:

p0_label_17:
!	Starting 10 instruction Store Burst
!	%l5 = 00000000000008b2, Mem[0000000010081400] = e8ffffff
	stwa	%l5,[%i2+%g0]0x80	! Mem[0000000010081400] = 000008b2
!	%l2 = 000000f9, %l3 = e8ffffff, Mem[00000000300c1400] = 2d4561e7 43e9f431
	stda	%l2,[%i3+%g0]0x81	! Mem[00000000300c1400] = 000000f9 e8ffffff
!	%l4 = 000000000000004e, Mem[0000000030181410] = 00000075
	stba	%l4,[%i6+%o5]0x89	! Mem[0000000030181410] = 0000004e
!	%l5 = 00000000000008b2, Mem[0000000030141400] = 6013d255
	stwa	%l5,[%i5+%g0]0x89	! Mem[0000000030141400] = 000008b2
!	%l1 = 4fcca800b38441af, Mem[0000000010001416] = 65cc45a7
	sth	%l1,[%i0+0x016]		! Mem[0000000010001414] = 65cc41af
!	%l5 = 00000000000008b2, Mem[0000000030181410] = 0000004e
	stha	%l5,[%i6+%o5]0x89	! Mem[0000000030181410] = 000008b2
!	Mem[0000000010001408] = 0eab195c, %l4 = 000000000000004e
	ldstuba	[%i0+%o4]0x88,%l4	! %l4 = 000000000000005c
!	Mem[00000000300c1400] = 000000f9 e8ffffff 00000065 15d6eab7
!	%f0  = 3ae18290 55d21e61 f5000000 2d4561e7
!	%f4  = 1a75c47c 0e79351d 11e08a9a 69d57803
!	%f8  = 11b77618 00a30d1c ff3ca664 65cc45a7
!	%f12 = 20f2af94 3d80a4d5 74b74e95 2e25eb3b
	stda	%f0 ,[%i3+%g0]ASI_BLK_S	! Block Store to 00000000300c1400
!	%f27 = e68e7f75, %f25 = 6844634f, %f30 = bb4ef052
	fmuls	%f27,%f25,%f30		! %f30 = ff800000
!	%l2 = 000000f9, %l3 = e8ffffff, Mem[0000000010181438] = 6bd33372 58aa167b, %asi = 80
	stda	%l2,[%i6+0x038]%asi	! Mem[0000000010181438] = 000000f9 e8ffffff

p0_label_18:
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = ffa6c783, %l4 = 000000000000005c
	ldsha	[%i6+%o4]0x81,%l4	! %l4 = ffffffffffffffa6
!	Mem[0000000030001410] = 52000000, %l5 = 00000000000008b2
	lduha	[%i0+%o5]0x81,%l5	! %l5 = 0000000000005200
!	Mem[0000000030041408] = 0e63b2c4, %l1 = 4fcca800b38441af
	lduba	[%i1+%o4]0x81,%l1	! %l1 = 000000000000000e
!	Mem[0000000030141408] = 77defc76bb4ef052, %f24 = d9d1353d 6844634f
	ldda	[%i5+%o4]0x89,%f24	! %f24 = 77defc76 bb4ef052
!	Mem[0000000030181410] = b2080000 3c146e8d, %l0 = d2c8e1e4, %l1 = 0000000e
	ldda	[%i6+%o5]0x81,%l0	! %l0 = 00000000b2080000 000000003c146e8d
!	Mem[0000000010141400] = 87aefda0, %f16 = a14f0d0d
	ld	[%i5+%g0],%f16		! %f16 = 87aefda0
!	Mem[0000000030041408] = c4b2630e, %l7 = 659bd17a0459d763
	ldswa	[%i1+%o4]0x89,%l7	! %l7 = ffffffffc4b2630e
!	Mem[0000000010101418] = 000000fb, %l6 = 0000000000000000, %asi = 80
	lduha	[%i4+0x018]%asi,%l6	! %l6 = 0000000000000000
!	Mem[0000000030181410] = b2080000, %l6 = 0000000000000000
	lduha	[%i6+%o5]0x81,%l6	! %l6 = 000000000000b208
!	Mem[0000000010181400] = f0520000, %l4 = ffffffffffffffa6
	lduw	[%i6+%g0],%l4		! %l4 = 00000000f0520000

p0_label_19:
!	Starting 10 instruction Store Burst
!	%l1 = 000000003c146e8d, Mem[00000000300c1408] = f50000002d4561e7
	stxa	%l1,[%i3+%o4]0x81	! Mem[00000000300c1408] = 000000003c146e8d
!	Mem[00000000201c0001] = ffb2ddf0, %l6 = 000000000000b208
	ldstub	[%o0+0x001],%l6		! %l6 = 00000000000000b2
!	Mem[0000000010141410] = 1ce1fe27, %l2 = 00000000000000f9
	ldstuba	[%i5+%o5]0x88,%l2	! %l2 = 0000000000000027
	membar	#Sync			! Added by membar checker (3)
!	%f29 = d44dff51, Mem[0000000010101434] = 6902e215
	st	%f29,[%i4+0x034]	! Mem[0000000010101434] = d44dff51
!	%l2 = 00000027, %l3 = e8ffffff, Mem[0000000010081430] = 257f5914 44a2b855
	std	%l2,[%i2+0x030]		! Mem[0000000010081430] = 00000027 e8ffffff
!	%l3 = 00000000e8ffffff, Mem[0000000021800101] = 1eff9f70, %asi = 80
	stba	%l3,[%o3+0x101]%asi	! Mem[0000000021800100] = 1eff9f70
!	%f17 = 43000000, %f30 = ff800000, %f28 = 15e20269
	fmuls	%f17,%f30,%f28		! %f28 = ff800000
!	Mem[00000000100c1408] = 3beb252e, %l7 = 00000000c4b2630e
	swapa	[%i3+%o4]0x80,%l7	! %l7 = 000000003beb252e
!	%f6  = 11e08a9a, %f7  = 69d57803
	fcmpes	%fcc1,%f6 ,%f7 		! %fcc1 = 1
!	%f18 = 51613911, Mem[0000000030141408] = bb4ef052
	sta	%f18,[%i5+%o4]0x89	! Mem[0000000030141408] = 51613911

p0_label_20:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041415] = 00000000, %l6 = 00000000000000b2, %asi = 80
	ldsba	[%i1+0x015]%asi,%l6	! %l6 = 0000000000000000
!	Mem[0000000030081408] = d1f5b071, %f19 = 64a63cff
	lda	[%i2+%o4]0x89,%f19	! %f19 = d1f5b071
!	Mem[0000000010181424] = 1f5d4f99, %f20 = 5d2aba4e
	ld	[%i6+0x024],%f20	! %f20 = 1f5d4f99
!	Mem[0000000010041410] = cb630000, %l6 = 0000000000000000
	ldsba	[%i1+%o5]0x80,%l6	! %l6 = ffffffffffffffcb
!	Mem[0000000010101410] = ff087abc, %l1 = 000000003c146e8d
	ldsha	[%i4+%o5]0x80,%l1	! %l1 = ffffffffffffff08
!	Mem[000000001000140c] = 65353e27, %l6 = ffffffffffffffcb, %asi = 80
	ldswa	[%i0+0x00c]%asi,%l6	! %l6 = 0000000065353e27
!	Mem[0000000030001410] = 0000000000000052, %l2 = 0000000000000027
	ldxa	[%i0+%o5]0x89,%l2	! %l2 = 0000000000000052
!	Mem[0000000010001400] = 11e08a9a69d57803, %l0 = 00000000b2080000
	ldxa	[%i0+%g0]0x80,%l0	! %l0 = 11e08a9a69d57803
!	Mem[0000000010101400] = 00000043, %l3 = 00000000e8ffffff
	lduha	[%i4+%g0]0x80,%l3	! %l3 = 0000000000000000
!	Mem[00000000300c1400] = 3ae18290, %l7 = 000000003beb252e
	ldsba	[%i3+%g0]0x81,%l7	! %l7 = 000000000000003a

p0_label_21:
!	Starting 10 instruction Store Burst
!	Mem[0000000010181408] = ffffff45, %l2 = 0000000000000052
	swapa	[%i6+%o4]0x88,%l2	! %l2 = 00000000ffffff45
!	%l7 = 000000000000003a, Mem[0000000010101408] = 64a63cff
	stwa	%l7,[%i4+%o4]0x88	! Mem[0000000010101408] = 0000003a
!	%l1 = ffffffffffffff08, Mem[00000000300c1408] = 00000000
	stwa	%l1,[%i3+%o4]0x89	! Mem[00000000300c1408] = ffffff08
!	Mem[0000000010141400] = 87aefda0, %l6 = 0000000065353e27
	swapa	[%i5+%g0]0x80,%l6	! %l6 = 0000000087aefda0
!	%f30 = ff800000 b208cf36, %l6 = 0000000087aefda0
!	Mem[0000000010001430] = 24bb245474b74e95
	add	%i0,0x030,%g1
	stda	%f30,[%g1+%l6]ASI_PST32_PL ! Mem[0000000010001430] = 24bb245474b74e95
!	Mem[0000000010101410] = ff087abc, %l0 = 11e08a9a69d57803
	ldstuba	[%i4+%o5]0x80,%l0	! %l0 = 00000000000000ff
!	%l6 = 0000000087aefda0, Mem[00000000300c1400] = 3ae18290
	stba	%l6,[%i3+%g0]0x81	! Mem[00000000300c1400] = a0e18290
!	%f16 = 87aefda0, Mem[0000000010081408] = 3d80a4d5
	sta	%f16,[%i2+%o4]0x80	! Mem[0000000010081408] = 87aefda0
!	Mem[0000000010041410] = cb63000000000000, %l0 = 00000000000000ff, %l1 = ffffffffffffff08
	add	%i1,0x10,%g1
	casxa	[%g1]0x80,%l0,%l1	! %l1 = cb63000000000000
!	%l0 = 00000000000000ff, Mem[0000000010141426] = 05d278b9
	sth	%l0,[%i5+0x026]		! Mem[0000000010141424] = 05d200ff

p0_label_22:
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (4)
!	Mem[0000000010181400] = f0520000 4f832b0d 52000000 7489e967
!	Mem[0000000010181410] = 37d6377c 18f3fc1d ff87d59a 1454b703
!	Mem[0000000010181420] = 2808c743 1f5d4f99 00000000 00004efb
!	Mem[0000000010181430] = 18fb0294 5d97cbd5 000000f9 e8ffffff
	ldda	[%i6+%g0]ASI_BLK_P,%f16	! Block Load from 0000000010181400
!	Mem[0000000030041400] = 0e79351d, %f7  = 69d57803
	lda	[%i1+%g0]0x89,%f7 	! %f7 = 0e79351d
!	Mem[0000000010141410] = 3d7bd36b1ce1feff, %l3 = 0000000000000000
	ldxa	[%i5+%o5]0x88,%l3	! %l3 = 3d7bd36b1ce1feff
!	Mem[0000000010181400] = f0520000, %l1 = cb63000000000000
	ldsba	[%i6+%g0]0x80,%l1	! %l1 = fffffffffffffff0
!	Mem[0000000030041410] = f00d0000, %l0 = 00000000000000ff
	lduwa	[%i1+%o5]0x81,%l0	! %l0 = 00000000f00d0000
!	Mem[0000000030001400] = 11e08a9a, %l7 = 000000000000003a
	lduba	[%i0+%g0]0x81,%l7	! %l7 = 0000000000000011
!	Mem[0000000030101410] = ec0f1de8, %l5 = 0000000000005200
	ldswa	[%i4+%o5]0x89,%l5	! %l5 = ffffffffec0f1de8
!	Mem[00000000300c1410] = 7cc4751a, %l0 = 00000000f00d0000
	ldsha	[%i3+%o5]0x89,%l0	! %l0 = 000000000000751a
!	Mem[0000000010181410] = 1dfcf3187c37d637, %f12 = 20f2af94 3d80a4d5
	ldda	[%i6+%o5]0x88,%f12	! %f12 = 1dfcf318 7c37d637
!	Mem[00000000201c0000] = ffffddf0, %l1 = fffffffffffffff0
	ldsh	[%o0+%g0],%l1		! %l1 = ffffffffffffffff

p0_label_23:
!	Starting 10 instruction Store Burst
!	%l7 = 0000000000000011, Mem[0000000030081410] = bcacf744
	stha	%l7,[%i2+%o5]0x81	! Mem[0000000030081410] = 0011f744
!	Mem[0000000010141410] = fffee11c6bd37b3d, %l5 = ffffffffec0f1de8, %l6 = 0000000087aefda0
	add	%i5,0x10,%g1
	casxa	[%g1]0x80,%l5,%l6	! %l6 = fffee11c6bd37b3d
!	%l2 = 00000000ffffff45, Mem[00000000100c1408] = c4b2630e719dfbc7
	stxa	%l2,[%i3+%o4]0x80	! Mem[00000000100c1408] = 00000000ffffff45
!	%l7 = 0000000000000011, Mem[0000000030101410] = e81d0fec
	stha	%l7,[%i4+%o5]0x81	! Mem[0000000030101410] = 00110fec
!	%l5 = ffffffffec0f1de8, Mem[0000000010141408] = 9a8ae011
	stwa	%l5,[%i5+%o4]0x88	! Mem[0000000010141408] = ec0f1de8
!	Mem[0000000010101400] = 00000043, %l3 = 3d7bd36b1ce1feff
	ldstuba	[%i4+%g0]0x80,%l3	! %l3 = 0000000000000000
!	Mem[00000000211c0001] = 4efb0480, %l3 = 0000000000000000
	ldstub	[%o2+0x001],%l3		! %l3 = 00000000000000fb
!	Mem[0000000030081400] = 409262ac, %l3 = 00000000000000fb
	swapa	[%i2+%g0]0x89,%l3	! %l3 = 00000000409262ac
!	%l2 = ffffff45, %l3 = 409262ac, Mem[0000000010141408] = ec0f1de8 873f882c
	stda	%l2,[%i5+%o4]0x88	! Mem[0000000010141408] = ffffff45 409262ac
!	%l3 = 00000000409262ac, Mem[0000000030001408] = 00a30d1c
	stba	%l3,[%i0+%o4]0x89	! Mem[0000000030001408] = 00a30dac

p0_label_24:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = 0eab19ff, %l3 = 00000000409262ac
	lduwa	[%i0+%o4]0x88,%l3	! %l3 = 000000000eab19ff
!	Mem[0000000010181410] = 7c37d637, %l6 = fffee11c6bd37b3d
	ldsha	[%i6+%o5]0x88,%l6	! %l6 = ffffffffffffd637
!	%l7 = 0000000000000011, immd = fffffcb2, %y  = 00000361
	udiv	%l7,-0x34e,%l5		! %l5 = 0000000000000361
	mov	%l0,%y			! %y = 0000751a
!	Mem[0000000010181400] = f05200004f832b0d, %f8  = 11b77618 00a30d1c, %asi = 80
	ldda	[%i6+0x000]%asi,%f8 	! %f8  = f0520000 4f832b0d
!	Mem[0000000021800080] = 4a538710, %l4 = 00000000f0520000
	ldub	[%o3+0x080],%l4		! %l4 = 000000000000004a
!	Mem[000000001004140c] = 00000000, %l3 = 000000000eab19ff, %asi = 80
	lduwa	[%i1+0x00c]%asi,%l3	! %l3 = 0000000000000000
!	Mem[0000000030181400] = ffa6c7830f04ccd1, %f12 = 1dfcf318 7c37d637
	ldda	[%i6+%g0]0x81,%f12	! %f12 = ffa6c783 0f04ccd1
!	Mem[0000000010141400] = 273e3565, %l2 = 00000000ffffff45
	ldsba	[%i5+%g0]0x88,%l2	! %l2 = 0000000000000065
!	Mem[0000000010081410] = f5000000, %l4 = 000000000000004a
	lduwa	[%i2+%o5]0x88,%l4	! %l4 = 00000000f5000000
!	Mem[0000000030101408] = 970c35223e3c8858, %f10 = ff3ca664 65cc45a7
	ldda	[%i4+%o4]0x89,%f10	! %f10 = 970c3522 3e3c8858

p0_label_25:
!	Starting 10 instruction Store Burst
!	%l6 = ffffffffffffd637, Mem[0000000010041408] = 80413f2a
	stwa	%l6,[%i1+%o4]0x88	! Mem[0000000010041408] = ffffd637
!	%l5 = 0000000000000361, Mem[000000001010141c] = 2808c743, %asi = 80
	stwa	%l5,[%i4+0x01c]%asi	! Mem[000000001010141c] = 00000361
!	%l4 = 00000000f5000000, Mem[0000000010081408] = 87aefda0
	stha	%l4,[%i2+%o4]0x80	! Mem[0000000010081408] = 0000fda0
!	%f18 = 52000000, Mem[000000001014141c] = 7cc4751a
	st	%f18,[%i5+0x01c]	! Mem[000000001014141c] = 52000000
!	%l2 = 0000000000000065, Mem[00000000300c1410] = 1d35790e7cc4751a
	stxa	%l2,[%i3+%o5]0x89	! Mem[00000000300c1410] = 0000000000000065
!	Mem[0000000010181400] = f0520000, %l7 = 0000000000000011
	ldstuba	[%i6+%g0]0x80,%l7	! %l7 = 00000000000000f0
	membar	#Sync			! Added by membar checker (5)
!	%l7 = 00000000000000f0, Mem[0000000010181400] = 000052ff
	stba	%l7,[%i6+%g0]0x88	! Mem[0000000010181400] = 000052f0
!	%f30 = 000000f9 e8ffffff, Mem[0000000010041400] = ff41dbb0 1b36df01
	stda	%f30,[%i1+%g0]0x80	! Mem[0000000010041400] = 000000f9 e8ffffff
!	%f18 = 52000000 7489e967, Mem[0000000030141408] = 11396151 76fcde77
	stda	%f18,[%i5+%o4]0x81	! Mem[0000000030141408] = 52000000 7489e967
!	Mem[0000000030101408] = 58883c3e, %l7 = 00000000000000f0
	ldstuba	[%i4+%o4]0x81,%l7	! %l7 = 0000000000000058

p0_label_26:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = 65353e27 61030000 45ffffff ac629240
!	Mem[0000000010141410] = fffee11c 6bd37b3d 1d35790e 52000000
!	Mem[0000000010141420] = 33caf8c8 05d200ff 6503ce46 43ff717f
!	Mem[0000000010141430] = 79c1b034 660abef5 6797e612 1c1bda9b
	ldda	[%i5+%g0]ASI_BLK_AIUP,%f0 	! Block Load from 0000000010141400
!	Mem[0000000010001429] = 5f78f166, %l6 = ffffffffffffd637
	ldsb	[%i0+0x029],%l6		! %l6 = 0000000000000078
!	Mem[0000000010141410] = fffee11c, %l1 = ffffffffffffffff
	lduba	[%i5+%o5]0x80,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030081408] = d7782a69d1f5b071, %f26 = 00000000 00004efb
	ldda	[%i2+%o4]0x89,%f26	! %f26 = d7782a69 d1f5b071
!	Mem[0000000030181408] = ffa6c783, %f28 = 18fb0294
	lda	[%i6+%o4]0x81,%f28	! %f28 = ffa6c783
!	Mem[0000000030181408] = 83c7a6ff, %f18 = 52000000
	lda	[%i6+%o4]0x89,%f18	! %f18 = 83c7a6ff
!	Mem[00000000300c1408] = 08ffffff3c146e8d, %f18 = 83c7a6ff 7489e967
	ldda	[%i3+%o4]0x81,%f18	! %f18 = 08ffffff 3c146e8d
!	%f12 = 79c1b034, %f16 = f0520000
	fcmpes	%fcc1,%f12,%f16		! %fcc1 = 2
!	Mem[0000000010041408] = ffffd637, %l4 = 00000000f5000000
	lduha	[%i1+%o4]0x88,%l4	! %l4 = 000000000000d637
!	Mem[0000000010041410] = cb630000, %l6 = 0000000000000078
	ldsba	[%i1+%o5]0x80,%l6	! %l6 = ffffffffffffffcb

p0_label_27:
!	Starting 10 instruction Store Burst
!	%o1 = deadbeefdeadbeef
	set	share1_start,%o1	! set %o1[0] to VA
!	Mem[0000000020800041] = 63852650, %l5 = 0000000000000361
	ldstuba	[%o1+0x041]%asi,%l5	! %l5 = 0000000000000085
!	%l0 = 000000000000751a, Mem[0000000030181410] = 000008b2
	stwa	%l0,[%i6+%o5]0x89	! Mem[0000000030181410] = 0000751a
	membar	#Sync			! Added by membar checker (6)
!	%l2 = 0000000000000065, Mem[0000000010141400] = 273e3565
	stwa	%l2,[%i5+%g0]0x88	! Mem[0000000010141400] = 00000065
!	Mem[0000000010001408] = 0eab19ff, %l4 = 000000000000d637
	ldstuba	[%i0+%o4]0x88,%l4	! %l4 = 00000000000000ff
!	%l2 = 0000000000000065, Mem[0000000030081408] = 71b0f5d1
	stwa	%l2,[%i2+%o4]0x81	! Mem[0000000030081408] = 00000065
!	%l1 = 00000000000000ff, Mem[00000000201c0000] = ffffddf0
	sth	%l1,[%o0+%g0]		! Mem[00000000201c0000] = 00ffddf0
!	Mem[000000001018142c] = 00004efb, %l1 = 00000000000000ff, %asi = 80
	swapa	[%i6+0x02c]%asi,%l1	! %l1 = 0000000000004efb
!	Mem[0000000030141400] = 000008b2, %l1 = 0000000000004efb
	ldstuba	[%i5+%g0]0x89,%l1	! %l1 = 00000000000000b2
!	Mem[0000000010181418] = ff87d59a1454b703, %l4 = 00000000000000ff, %l6 = ffffffffffffffcb
	add	%i6,0x18,%g1
	casxa	[%g1]0x80,%l4,%l6	! %l6 = ff87d59a1454b703
!	%f24 = 2808c743 1f5d4f99, Mem[0000000010081408] = a0fd0000 e761452d
	stda	%f24,[%i2+%o4]0x88	! Mem[0000000010081408] = 2808c743 1f5d4f99

p0_label_28:
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = 8c611b6b24c355ad, %f16 = f0520000 4f832b0d
	ldda	[%i5+%o5]0x81,%f16	! %f16 = 8c611b6b 24c355ad
!	Mem[00000000211c0000] = 4eff0480, %l2 = 0000000000000065
	ldub	[%o2+%g0],%l2		! %l2 = 000000000000004e
!	Mem[0000000030141400] = ff080000, %l6 = ff87d59a1454b703
	lduha	[%i5+%g0]0x81,%l6	! %l6 = 000000000000ff08
!	Mem[0000000030081410] = 0d2b834f44f71100, %f30 = 000000f9 e8ffffff
	ldda	[%i2+%o5]0x89,%f30	! %f30 = 0d2b834f 44f71100
!	Mem[0000000010141410] = 1ce1feff, %l7 = 0000000000000058
	lduwa	[%i5+%o5]0x88,%l7	! %l7 = 000000001ce1feff
!	Mem[0000000030041410] = 00000df0, %f26 = d7782a69
	lda	[%i1+%o5]0x89,%f26	! %f26 = 00000df0
!	Mem[00000000300c1408] = 8d6e143cffffff08, %f20 = 37d6377c 18f3fc1d
	ldda	[%i3+%o4]0x89,%f20	! %f20 = 8d6e143c ffffff08
!	Mem[0000000030041410] = 00000df0, %l6 = 000000000000ff08
	lduha	[%i1+%o5]0x89,%l6	! %l6 = 0000000000000df0
!	Mem[0000000010041414] = 00000000, %l1 = 00000000000000b2
	ldsb	[%i1+0x014],%l1		! %l1 = 0000000000000000
!	Mem[0000000030081408] = 65000000, %l0 = 000000000000751a
	lduha	[%i2+%o4]0x89,%l0	! %l0 = 0000000000000000

p0_label_29:
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1410] = 00000065, %l3 = 0000000000000000
	swapa	[%i3+%o5]0x89,%l3	! %l3 = 0000000000000065
!	%l4 = 00000000000000ff, Mem[0000000010101408] = 0000003a
	stwa	%l4,[%i4+%o4]0x88	! Mem[0000000010101408] = 000000ff
!	%l4 = 00000000000000ff, Mem[0000000030141400] = ff080000
	stwa	%l4,[%i5+%g0]0x81	! Mem[0000000030141400] = 000000ff
!	%l7 = 000000001ce1feff, Mem[0000000010181436] = 5d97cbd5
	sth	%l7,[%i6+0x036]		! Mem[0000000010181434] = 5d97feff
!	%l7 = 000000001ce1feff, Mem[0000000010001418] = 4f0fbd5a, %asi = 80
	stwa	%l7,[%i0+0x018]%asi	! Mem[0000000010001418] = 1ce1feff
!	%f18 = 08ffffff 3c146e8d, %l4 = 00000000000000ff
!	Mem[0000000030181430] = 3dffc5c4664dc445
	add	%i6,0x030,%g1
	stda	%f18,[%g1+%l4]ASI_PST32_SL ! Mem[0000000030181430] = 8d6e143cffffff08
!	%l7 = 000000001ce1feff, Mem[0000000010001400] = 9a8ae011
	stwa	%l7,[%i0+%g0]0x88	! Mem[0000000010001400] = 1ce1feff
!	%l0 = 00000000, %l1 = 00000000, Mem[0000000010101418] = 000000fb 00000361
	std	%l0,[%i4+0x018]		! Mem[0000000010101418] = 00000000 00000000
!	%l1 = 0000000000000000, Mem[0000000010041400] = 000000f9
	stba	%l1,[%i1+%g0]0x80	! Mem[0000000010041400] = 000000f9
!	%l2 = 000000000000004e, Mem[0000000010001428] = 5f78f166, %asi = 80
	stha	%l2,[%i0+0x028]%asi	! Mem[0000000010001428] = 004ef166

p0_label_30:
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = fb000000, %f20 = 8d6e143c
	lda	[%i2+%g0]0x81,%f20	! %f20 = fb000000
!	Mem[0000000030081408] = 00000065, %l0 = 0000000000000000
	ldswa	[%i2+%o4]0x81,%l0	! %l0 = 0000000000000065
!	Mem[0000000030101410] = ec0f1100, %l5 = 0000000000000085
	ldswa	[%i4+%o5]0x89,%l5	! %l5 = ffffffffec0f1100
!	Mem[0000000010001410] = 64a63cff, %f15 = 1c1bda9b
	lda	[%i0+%o5]0x88,%f15	! %f15 = 64a63cff
!	Mem[0000000030101408] = 3e3c88ff, %l5 = ffffffffec0f1100
	ldsba	[%i4+%o4]0x89,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000030181408] = 5760e60883c7a6ff, %l4 = 00000000000000ff
	ldxa	[%i6+%o4]0x89,%l4	! %l4 = 5760e60883c7a6ff
!	Mem[0000000010181420] = 2808c7431f5d4f99, %l6 = 0000000000000df0
	ldx	[%i6+0x020],%l6		! %l6 = 2808c7431f5d4f99
!	Mem[00000000100c1400] = 00000035, %l4 = 5760e60883c7a6ff
	lduha	[%i3+%g0]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000030141410] = 6b1b618c, %l5 = ffffffffffffffff
	lduba	[%i5+%o5]0x89,%l5	! %l5 = 000000000000008c
!	Mem[0000000010181404] = 4f832b0d, %l4 = 0000000000000000, %asi = 80
	ldsha	[%i6+0x004]%asi,%l4	! %l4 = 0000000000004f83

p0_label_31:
!	Starting 10 instruction Store Burst
!	%l2 = 0000004e, %l3 = 00000065, Mem[00000000100c1400] = 35000000 c1a48d20
	stda	%l2,[%i3+%g0]0x88	! Mem[00000000100c1400] = 0000004e 00000065
!	%f24 = 2808c743, Mem[00000000300c1400] = a0e18290
	sta	%f24,[%i3+%g0]0x81	! Mem[00000000300c1400] = 2808c743
!	Mem[0000000010141410] = fffee11c, %l0 = 0000000000000065
	swap	[%i5+%o5],%l0		! %l0 = 00000000fffee11c
!	Mem[0000000030081408] = 65000000, %l1 = 0000000000000000
	ldstuba	[%i2+%o4]0x89,%l1	! %l1 = 0000000000000000
!	%l4 = 0000000000004f83, Mem[0000000010141408] = 45ffffff
	stwa	%l4,[%i5+%o4]0x80	! Mem[0000000010141408] = 00004f83
!	Mem[0000000030081408] = ff000065, %l2 = 000000000000004e
	ldstuba	[%i2+%o4]0x81,%l2	! %l2 = 00000000000000ff
!	%l0 = fffee11c, %l1 = 00000000, Mem[0000000030181410] = 1a750000 3c146e8d
	stda	%l0,[%i6+%o5]0x81	! Mem[0000000030181410] = fffee11c 00000000
!	%f0  = 65353e27 61030000, Mem[0000000030141410] = 8c611b6b 24c355ad
	stda	%f0 ,[%i5+%o5]0x81	! Mem[0000000030141410] = 65353e27 61030000
!	Mem[0000000030141410] = 273e3565, %l6 = 2808c7431f5d4f99
	ldstuba	[%i5+%o5]0x89,%l6	! %l6 = 0000000000000065
!	Mem[0000000010101404] = 0d0d4fa1, %l7 = 000000001ce1feff
	ldstuba	[%i4+0x004]%asi,%l7	! %l7 = 000000000000000d

p0_label_32:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = 00000000, %f0  = 65353e27
	lda	[%i3+%o4]0x80,%f0 	! %f0 = 00000000
!	Mem[0000000030181400] = ffa6c783, %l4 = 0000000000004f83
	lduwa	[%i6+%g0]0x81,%l4	! %l4 = 00000000ffa6c783
!	Mem[0000000010141410] = 3d7bd36b 65000000, %l2 = 000000ff, %l3 = 00000065
	ldda	[%i5+%o5]0x88,%l2	! %l2 = 0000000065000000 000000003d7bd36b
!	Mem[00000000100c1408] = 00000000ffffff45, %f0  = 00000000 61030000
	ldda	[%i3+%o4]0x80,%f0 	! %f0  = 00000000 ffffff45
!	Mem[0000000010141430] = 79c1b034, %l3 = 000000003d7bd36b
	ldsw	[%i5+0x030],%l3		! %l3 = 0000000079c1b034
!	Mem[0000000030181408] = 83c7a6ff, %l7 = 000000000000000d
	ldsba	[%i6+%o4]0x89,%l7	! %l7 = ffffffffffffffff
!	Mem[00000000100c1400] = 00000065 0000004e, %l6 = 00000065, %l7 = ffffffff
	ldda	[%i3+%g0]0x88,%l6	! %l6 = 000000000000004e 0000000000000065
!	Mem[0000000030041410] = f00d0000, %l3 = 0000000079c1b034
	ldswa	[%i1+%o5]0x81,%l3	! %l3 = fffffffff00d0000
!	Mem[0000000030141410] = 273e35ff, %l4 = 00000000ffa6c783
	ldsha	[%i5+%o5]0x89,%l4	! %l4 = 00000000000035ff
!	Mem[0000000010181408] = 52000000, %f16 = 8c611b6b
	lda	[%i6+%o4]0x80,%f16	! %f16 = 52000000

p0_label_33:
!	Starting 10 instruction Store Burst
!	Mem[0000000030001408] = ac0da300, %l5 = 000000000000008c
	ldstuba	[%i0+%o4]0x81,%l5	! %l5 = 00000000000000ac
!	%l5 = 00000000000000ac, %l0 = 00000000fffee11c, %l1 = 0000000000000000
	add	%l5,%l0,%l1		! %l1 = 00000000fffee1c8
!	%l2 = 0000000065000000, Mem[00000000100c1408] = 45ffffff00000000
	stxa	%l2,[%i3+%o4]0x88	! Mem[00000000100c1408] = 0000000065000000
!	Mem[0000000010101418] = 00000000, %l0 = 00000000fffee11c
	swap	[%i4+0x018],%l0		! %l0 = 0000000000000000
!	%f27 = d1f5b071, Mem[0000000030181400] = 83c7a6ff
	sta	%f27,[%i6+%g0]0x89	! Mem[0000000030181400] = d1f5b071
!	Mem[0000000010181400] = f0520000 4f832b0d 52000000 7489e967
!	%f0  = 00000000 ffffff45 45ffffff ac629240
!	%f4  = fffee11c 6bd37b3d 1d35790e 52000000
!	%f8  = 33caf8c8 05d200ff 6503ce46 43ff717f
!	%f12 = 79c1b034 660abef5 6797e612 64a63cff
	stda	%f0 ,[%i6+%g0]ASI_BLK_PL	! Block Store to 0000000010181400
!	Mem[0000000010141410] = 00000065, %l2 = 0000000065000000
	ldstuba	[%i5+%o5]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000010081408] = 1f5d4f99, %l3 = fffffffff00d0000
	ldstuba	[%i2+%o4]0x88,%l3	! %l3 = 0000000000000099
!	Mem[0000000010001400] = fffee11c, %l2 = 0000000000000000
	ldstuba	[%i0+%g0]0x80,%l2	! %l2 = 00000000000000ff
!	%l0 = 0000000000000000, Mem[0000000010081410] = 000000f556bd189d
	stxa	%l0,[%i2+%o5]0x80	! Mem[0000000010081410] = 0000000000000000

p0_label_34:
!	Starting 10 instruction Load Burst
!	Mem[0000000030101410] = ec0f1100, %l4 = 00000000000035ff
	lduha	[%i4+%o5]0x89,%l4	! %l4 = 0000000000001100
!	Mem[0000000030041408] = 0e63b2c4, %l3 = 0000000000000099
	lduba	[%i1+%o4]0x81,%l3	! %l3 = 000000000000000e
!	Mem[0000000010081400] = ffffffff b2080000, %l2 = 000000ff, %l3 = 0000000e
	ldda	[%i2+%g0]0x88,%l2	! %l2 = 00000000b2080000 00000000ffffffff
!	Mem[0000000030181400] = d1cc040fd1f5b071, %f26 = 00000df0 d1f5b071
	ldda	[%i6+%g0]0x89,%f26	! %f26 = d1cc040f d1f5b071
!	Mem[0000000030081400] = fb00000011396151, %l2 = 00000000b2080000
	ldxa	[%i2+%g0]0x81,%l2	! %l2 = fb00000011396151
!	Mem[0000000010081430] = 00000027, %l1 = 00000000fffee1c8, %asi = 80
	lduwa	[%i2+0x030]%asi,%l1	! %l1 = 0000000000000027
!	Mem[0000000010141400] = 0000036100000065, %l6 = 000000000000004e
	ldxa	[%i5+%g0]0x88,%l6	! %l6 = 0000036100000065
!	Mem[0000000030001410] = 5200000000000000, %l0 = 0000000000000000
	ldxa	[%i0+%o5]0x81,%l0	! %l0 = 5200000000000000
!	Mem[0000000020800000] = 75f0c420, %l2 = fb00000011396151
	ldub	[%o1+%g0],%l2		! %l2 = 0000000000000075
!	Mem[0000000030181410] = fffee11c, %l4 = 0000000000001100
	ldsba	[%i6+%o5]0x81,%l4	! %l4 = ffffffffffffffff

p0_label_35:
!	Starting 10 instruction Store Burst
!	Mem[0000000010101410] = ff087abc, %l4 = 00000000ffffffff
	swapa	[%i4+%o5]0x80,%l4	! %l4 = 00000000ff087abc
!	%f0  = 00000000, %f21 = ffffff08, %f28 = ffa6c783
	fmuls	%f0 ,%f21,%f28		! %f28 = ffffff08
!	%l6 = 0000036100000065, %l5 = 00000000000000ac, %y  = 0000751a
	smul	%l6,%l5,%l5		! %l5 = 00000000000043dc, %y = 00000000
!	Mem[00000000100c1426] = 658f5af9, %l6 = 0000036100000065
	ldstub	[%i3+0x026],%l6		! %l6 = 000000000000005a
!	Mem[0000000010001400] = 1ce1feff, %l0 = 5200000000000000
	ldstuba	[%i0+%g0]0x88,%l0	! %l0 = 00000000000000ff
!	%f17 = 24c355ad, Mem[0000000030181400] = d1f5b071
	sta	%f17,[%i6+%g0]0x89	! Mem[0000000030181400] = 24c355ad
!	Mem[0000000010081432] = 00000027, %l5 = 00000000000043dc
	ldub	[%i2+0x032],%l5		! %l5 = 0000000000000000
!	Mem[0000000010001408] = ff19ab0e, %l1 = 0000000000000027
	swapa	[%i0+%o4]0x80,%l1	! %l1 = 00000000ff19ab0e
!	%l0 = 000000ff, %l1 = ff19ab0e, Mem[0000000010181400] = 45ffffff 00000000
	stda	%l0,[%i6+%g0]0x80	! Mem[0000000010181400] = 000000ff ff19ab0e
!	%l3 = 00000000ffffffff, Mem[0000000010141410] = ff000065
	stba	%l3,[%i5+%o5]0x80	! Mem[0000000010141410] = ff000065

p0_label_36:
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = ff0da300, %l6 = 000000000000005a
	ldswa	[%i0+%o4]0x81,%l6	! %l6 = ffffffffff0da300
!	Mem[00000000100c1408] = 65000000, %l3 = 00000000ffffffff
	ldsba	[%i3+%o4]0x88,%l3	! %l3 = 0000000000000000
!	Mem[000000001008141d] = 28af9783, %l7 = 0000000000000065
	ldub	[%i2+0x01d],%l7		! %l7 = 00000000000000af
!	Mem[0000000021800180] = 0cffa7d0, %l4 = 00000000ff087abc
	ldsh	[%o3+0x180],%l4		! %l4 = 0000000000000cff
!	Mem[0000000020800041] = 63ff2650, %l0 = 00000000000000ff
	ldsb	[%o1+0x041],%l0		! %l0 = ffffffffffffffff
!	Mem[0000000010141408] = 00004f83, %l5 = 0000000000000000
	ldsba	[%i5+%o4]0x80,%l5	! %l5 = 0000000000000000
!	Mem[00000000100c1410] = 000052f0, %l5 = 0000000000000000
	lduw	[%i3+%o5],%l5		! %l5 = 00000000000052f0
	membar	#Sync			! Added by membar checker (7)
!	Mem[0000000010181408] = ac629240, %l3 = 0000000000000000
	lduba	[%i6+%o4]0x88,%l3	! %l3 = 0000000000000040
!	Mem[0000000030041410] = f00d0000, %l7 = 00000000000000af
	ldsha	[%i1+%o5]0x81,%l7	! %l7 = fffffffffffff00d
!	Mem[000000001014141c] = 52000000, %f23 = 1454b703
	ld	[%i5+0x01c],%f23	! %f23 = 52000000

p0_label_37:
!	Starting 10 instruction Store Burst
!	Mem[0000000030141410] = 273e35ff, %l1 = 00000000ff19ab0e
	swapa	[%i5+%o5]0x89,%l1	! %l1 = 00000000273e35ff
!	%l4 = 0000000000000cff, Mem[00000000300c1408] = ffffff08
	stha	%l4,[%i3+%o4]0x89	! Mem[00000000300c1408] = ffff0cff
!	%f9  = 05d200ff, Mem[0000000010001404] = 69d57803
	st	%f9 ,[%i0+0x004]	! Mem[0000000010001404] = 05d200ff
!	%l1 = 00000000273e35ff, Mem[0000000020800000] = 75f0c420, %asi = 80
	stha	%l1,[%o1+0x000]%asi	! Mem[0000000020800000] = 35ffc420
!	%l4 = 0000000000000cff, Mem[00000000300c1410] = 00000000
	stba	%l4,[%i3+%o5]0x89	! Mem[00000000300c1410] = 000000ff
!	Mem[0000000010141400] = 00000065, %l4 = 0000000000000cff
	swapa	[%i5+%g0]0x88,%l4	! %l4 = 0000000000000065
!	Mem[00000000211c0001] = 4eff0480, %l3 = 0000000000000040
	ldstuba	[%o2+0x001]%asi,%l3	! %l3 = 00000000000000ff
!	%f28 = ffffff08 5d97cbd5, Mem[0000000030181400] = ad55c324 0f04ccd1
	stda	%f28,[%i6+%g0]0x81	! Mem[0000000030181400] = ffffff08 5d97cbd5
!	%l0 = ffffffff, %l1 = 273e35ff, Mem[0000000030181410] = 1ce1feff 00000000
	stda	%l0,[%i6+%o5]0x89	! Mem[0000000030181410] = ffffffff 273e35ff
!	Mem[0000000010101400] = ff000043, %l1 = 00000000273e35ff
	ldstuba	[%i4+%g0]0x80,%l1	! %l1 = 00000000000000ff

p0_label_38:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = ac629240, %l5 = 00000000000052f0
	ldsba	[%i6+%o4]0x88,%l5	! %l5 = 0000000000000040
!	Mem[0000000030141408] = 52000000, %l5 = 0000000000000040
	ldsba	[%i5+%o4]0x81,%l5	! %l5 = 0000000000000052
!	Mem[0000000010101400] = ff000043, %l1 = 00000000000000ff
	ldsba	[%i4+%g0]0x80,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000030141410] = 0eab19ff, %l5 = 0000000000000052
	lduba	[%i5+%o5]0x81,%l5	! %l5 = 000000000000000e
!	Mem[0000000010181400] = 000000ffff19ab0e, %l6 = ffffffffff0da300
	ldxa	[%i6+%g0]0x80,%l6	! %l6 = 000000ffff19ab0e
	membar	#Sync			! Added by membar checker (8)
!	Mem[0000000030181400] = ffffff08 5d97cbd5 ffa6c783 08e66057
!	Mem[0000000030181410] = ffffffff ff353e27 6b74384a 23ca20f3
!	Mem[0000000030181420] = 40536958 28818d09 0ea59f56 3fb0144f
!	Mem[0000000030181430] = 8d6e143c ffffff08 63d34422 79bfb66b
	ldda	[%i6+%g0]ASI_BLK_SL,%f16	! Block Load from 0000000030181400
!	Mem[0000000030181408] = 83c7a6ff, %l3 = 00000000000000ff
	ldsha	[%i6+%o4]0x89,%l3	! %l3 = ffffffffffffa6ff
!	Mem[0000000010041410] = 000063cb, %l6 = 000000ffff19ab0e
	lduha	[%i1+%o5]0x88,%l6	! %l6 = 00000000000063cb
!	Mem[0000000010081400] = 000008b2ffffffff, %f4  = fffee11c 6bd37b3d
	ldda	[%i2+%g0]0x80,%f4 	! %f4  = 000008b2 ffffffff
!	Mem[0000000030101408] = ff883c3e, %l0 = ffffffffffffffff
	lduba	[%i4+%o4]0x81,%l0	! %l0 = 00000000000000ff

p0_label_39:
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000000065, Mem[0000000010041408] = 37d6ffff, %asi = 80
	stwa	%l4,[%i1+0x008]%asi	! Mem[0000000010041408] = 00000065
!	%l7 = fffffffffffff00d, Mem[0000000010141408] = 00004f83ac629240
	stxa	%l7,[%i5+%o4]0x80	! Mem[0000000010141408] = fffffffffffff00d
!	%l5 = 000000000000000e, Mem[000000001014140c] = fffff00d, %asi = 80
	stwa	%l5,[%i5+0x00c]%asi	! Mem[000000001014140c] = 0000000e
!	Mem[0000000010141410] = 650000ff, %l0 = 00000000000000ff
	ldstuba	[%i5+%o5]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[00000000100c1408] = 00000065, %l7 = fffffffffffff00d
	ldstuba	[%i3+%o4]0x80,%l7	! %l7 = 0000000000000000
!	Mem[00000000100c1408] = 650000ff, %l7 = 0000000000000000
	swapa	[%i3+%o4]0x88,%l7	! %l7 = 00000000650000ff
!	Mem[0000000010181410] = 3d7bd36b, %l2 = 0000000000000075
	ldstuba	[%i6+%o5]0x80,%l2	! %l2 = 000000000000003d
!	%l1 = ffffffffffffffff, Mem[0000000030101408] = 3e3c88ff
	stba	%l1,[%i4+%o4]0x89	! Mem[0000000030101408] = 3e3c88ff
!	%l6 = 00000000000063cb, Mem[0000000010181410] = ff7bd36b1ce1feff
	stxa	%l6,[%i6+%o5]0x80	! Mem[0000000010181410] = 00000000000063cb
!	%l0 = 000000ff, %l1 = ffffffff, Mem[0000000030001400] = 11e08a9a 318ccb91
	stda	%l0,[%i0+%g0]0x81	! Mem[0000000030001400] = 000000ff ffffffff

p0_label_40:
!	Starting 10 instruction Load Burst
!	Mem[000000001000140c] = 65353e27, %l0 = 00000000000000ff, %asi = 80
	lduwa	[%i0+0x00c]%asi,%l0	! %l0 = 0000000065353e27
!	Mem[00000000300c1400] = 2808c743, %f3  = ac629240
	lda	[%i3+%g0]0x81,%f3 	! %f3 = 2808c743
!	Mem[0000000010181400] = ff000000, %f9  = 05d200ff
	lda	[%i6+%g0]0x88,%f9 	! %f9 = ff000000
!	Mem[00000000211c0000] = 4eff0480, %l3 = ffffffffffffa6ff
	ldsh	[%o2+%g0],%l3		! %l3 = 0000000000004eff
!	%l4 = 0000000000000065, imm = 00000000000003d3, %l2 = 000000000000003d
	and	%l4,0x3d3,%l2		! %l2 = 0000000000000041
!	Mem[0000000030141400] = f1a9d73dff000000, %f8  = 33caf8c8 ff000000
	ldda	[%i5+%g0]0x89,%f8 	! %f8  = f1a9d73d ff000000
!	Mem[0000000010101408] = ff000000, %l2 = 0000000000000041
	ldsba	[%i4+%o4]0x80,%l2	! %l2 = ffffffffffffffff
!	Mem[00000000100c1410] = f0520000, %l2 = ffffffffffffffff
	ldsha	[%i3+%o5]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000010041438] = 5f331092, %f8  = f1a9d73d
	lda	[%i1+0x038]%asi,%f8 	! %f8 = 5f331092
!	Mem[0000000030001408] = ff0da300, %l0 = 0000000065353e27
	ldsha	[%i0+%o4]0x81,%l0	! %l0 = ffffffffffffff0d

p0_label_41:
!	Starting 10 instruction Store Burst
!	Mem[0000000010081413] = 00000000, %l5 = 000000000000000e
	ldstub	[%i2+0x013],%l5		! %l5 = 0000000000000000
	membar	#Sync			! Added by membar checker (9)
!	%l7 = 00000000650000ff, Mem[0000000030181400] = 08ffffff
	stwa	%l7,[%i6+%g0]0x89	! Mem[0000000030181400] = 650000ff
!	%f29 = 3c146e8d, Mem[0000000010081410] = 000000ff
	sta	%f29,[%i2+%o5]0x80	! Mem[0000000010081410] = 3c146e8d
!	%f22 = f320ca23 4a38746b, Mem[0000000030101410] = 00110fec 41356ccd
	stda	%f22,[%i4+%o5]0x81	! Mem[0000000030101410] = f320ca23 4a38746b
!	Mem[00000000100c1418] = 659bd17a, %l3 = 00004eff, %l4 = 00000065
	add	%i3,0x18,%g1
	casa	[%g1]0x80,%l3,%l4	! %l4 = 00000000659bd17a
!	%l4 = 00000000659bd17a, Mem[0000000030001410] = 5200000000000000
	stxa	%l4,[%i0+%o5]0x81	! Mem[0000000030001410] = 00000000659bd17a
!	%f24 = 098d8128 58695340, Mem[0000000010141408] = ffffffff 0000000e
	stda	%f24,[%i5+%o4]0x80	! Mem[0000000010141408] = 098d8128 58695340
!	%f26 = 4f14b03f 569fa50e, Mem[0000000010141408] = 28818d09 40536958
	stda	%f26,[%i5+%o4]0x88	! Mem[0000000010141408] = 4f14b03f 569fa50e
!	Mem[0000000010141420] = 33caf8c8, %l6 = 00000000000063cb
	ldstub	[%i5+0x020],%l6		! %l6 = 0000000000000033
!	Mem[000000001004143c] = 4f8dcb1b, %l6 = 00000033, %l4 = 659bd17a
	add	%i1,0x3c,%g1
	casa	[%g1]0x80,%l6,%l4	! %l4 = 000000004f8dcb1b

p0_label_42:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = fffee11c, %l5 = 0000000000000000
	ldub	[%i0+%g0],%l5		! %l5 = 00000000000000ff
!	Mem[0000000030181408] = ffa6c783, %l2 = 0000000000000000
	ldswa	[%i6+%o4]0x81,%l2	! %l2 = ffffffffffa6c783
!	Mem[00000000100c1408] = 00000000, %l7 = 00000000650000ff
	ldswa	[%i3+%o4]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000010181408] = 409262acffffff45, %l3 = 0000000000004eff
	ldxa	[%i6+%o4]0x80,%l3	! %l3 = 409262acffffff45
!	%l3 = 409262acffffff45, immd = fffffd17, %y  = 00000000
	smul	%l3,-0x2e9,%l3		! %l3 = 0000000000022033, %y = 00000000
!	Mem[0000000010141400] = 00000cff, %f1  = ffffff45
	lda	[%i5+%g0]0x88,%f1 	! %f1 = 00000cff
!	Mem[0000000030081410] = 0011f744, %l6 = 0000000000000033
	ldsba	[%i2+%o5]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000010101408] = 000000ff, %f1  = 00000cff
	lda	[%i4+%o4]0x88,%f1 	! %f1 = 000000ff
!	Mem[0000000010101410] = ffffffff, %l1 = ffffffffffffffff
	lduba	[%i4+%o5]0x80,%l1	! %l1 = 00000000000000ff
!	Mem[00000000300c1408] = ffff0cff, %l3 = 0000000000022033
	ldswa	[%i3+%o4]0x89,%l3	! %l3 = ffffffffffff0cff

p0_label_43:
!	Starting 10 instruction Store Burst
!	%f21 = ffffffff, %f25 = 58695340, %f12 = 79c1b034
	fdivs	%f21,%f25,%f12		! %f12 = ffffffff
!	Mem[00000000201c0001] = 00ffddf0, %l1 = 00000000000000ff
	ldstub	[%o0+0x001],%l1		! %l1 = 00000000000000ff
!	%f3  = 2808c743, Mem[0000000010141408] = 0ea59f56
	sta	%f3 ,[%i5+%o4]0x80	! Mem[0000000010141408] = 2808c743
!	%f27 = 569fa50e, %f25 = 58695340
	fcmpes	%fcc1,%f27,%f25		! %fcc1 = 1
!	%l6 = 00000000, %l7 = 00000000, Mem[00000000300c1400] = 43c70828 611ed255
	stda	%l6,[%i3+%g0]0x89	! Mem[00000000300c1400] = 00000000 00000000
!	Mem[0000000010141400] = ff0c0000 61030000 2808c743 3fb0144f
!	%f16 = d5cb975d 08ffffff 5760e608 83c7a6ff
!	%f20 = 273e35ff ffffffff f320ca23 4a38746b
!	%f24 = 098d8128 58695340 4f14b03f 569fa50e
!	%f28 = 08ffffff 3c146e8d 6bb6bf79 2244d363
	stda	%f16,[%i5+%g0]ASI_BLK_PL	! Block Store to 0000000010141400
	membar	#Sync			! Added by membar checker (10)
!	Mem[0000000010141400] = 08ffffff, %l6 = 0000000000000000
	swapa	[%i5+%g0]0x88,%l6	! %l6 = 0000000008ffffff
!	Mem[0000000010181410] = 00000000, %l5 = 00000000000000ff
	ldstuba	[%i6+%o5]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000010141400] = 00000000 5d97cbd5 ffa6c783 08e66057
!	%f16 = d5cb975d 08ffffff 5760e608 83c7a6ff
!	%f20 = 273e35ff ffffffff f320ca23 4a38746b
!	%f24 = 098d8128 58695340 4f14b03f 569fa50e
!	%f28 = 08ffffff 3c146e8d 6bb6bf79 2244d363
	stda	%f16,[%i5+%g0]ASI_BLK_PL	! Block Store to 0000000010141400
!	%l0 = ffffffffffffff0d, Mem[0000000010181408] = 409262ac, %asi = 80
	stwa	%l0,[%i6+0x008]%asi	! Mem[0000000010181408] = ffffff0d

p0_label_44:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181414] = 000063cb, %l5 = 0000000000000000, %asi = 80
	ldswa	[%i6+0x014]%asi,%l5	! %l5 = 00000000000063cb
!	Mem[0000000030141400] = ff000000, %l3 = ffffffffffff0cff
	ldswa	[%i5+%g0]0x89,%l3	! %l3 = ffffffffff000000
!	Mem[0000000030001400] = ffffffffff000000, %l5 = 00000000000063cb
	ldxa	[%i0+%g0]0x89,%l5	! %l5 = ffffffffff000000
!	Mem[0000000010001418] = 1ce1feff, %l3 = ffffffffff000000, %asi = 80
	ldsba	[%i0+0x018]%asi,%l3	! %l3 = 000000000000001c
!	Mem[0000000010101410] = ffffffff, %l6 = 0000000008ffffff
	ldsba	[%i4+%o5]0x80,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000030101400] = 1c0da3001876b711, %f10 = 6503ce46 43ff717f
	ldda	[%i4+%g0]0x81,%f10	! %f10 = 1c0da300 1876b711
!	Mem[0000000010081410] = 3c146e8d, %l7 = 0000000000000000
	lduba	[%i2+%o5]0x80,%l7	! %l7 = 000000000000003c
!	Mem[0000000010081408] = ff4f5d1f, %l5 = ffffffffff000000
	lduba	[%i2+%o4]0x80,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030141410] = 0eab19ff61030000, %l1 = 00000000000000ff
	ldxa	[%i5+%o5]0x81,%l1	! %l1 = 0eab19ff61030000
	membar	#Sync			! Added by membar checker (11)
!	Mem[0000000010141400] = ffffff08, %l4 = 000000004f8dcb1b
	lduwa	[%i5+%g0]0x80,%l4	! %l4 = 00000000ffffff08

p0_label_45:
!	Starting 10 instruction Store Burst
!	%f18 = 5760e608 83c7a6ff, Mem[0000000030101408] = 3e3c88ff 970c3522
	stda	%f18,[%i4+%o4]0x89	! Mem[0000000030101408] = 5760e608 83c7a6ff
!	%l7 = 000000000000003c, Mem[0000000010081408] = 1f5d4fff
	stba	%l7,[%i2+%o4]0x88	! Mem[0000000010081408] = 1f5d4f3c
!	%l0 = ffffff0d, %l1 = 61030000, Mem[0000000010141400] = 08ffffff d5cb975d
	stda	%l0,[%i5+%g0]0x88	! Mem[0000000010141400] = ffffff0d 61030000
!	%l0 = ffffff0d, %l1 = 61030000, Mem[0000000030041408] = 0e63b2c4 3f77b6f7
	stda	%l0,[%i1+%o4]0x81	! Mem[0000000030041408] = ffffff0d 61030000
!	Mem[0000000010141400] = ffffff0d, %l5 = 00000000000000ff
	ldstuba	[%i5+%g0]0x88,%l5	! %l5 = 000000000000000d
!	Mem[0000000030181410] = ffffffff, %l3 = 000000000000001c
	ldstuba	[%i6+%o5]0x81,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010041404] = e8ffffff, %l7 = 000000000000003c
	swap	[%i1+0x004],%l7		! %l7 = 00000000e8ffffff
!	Mem[0000000020800040] = 63ff2650, %l7 = 00000000e8ffffff, %asi = 80
	lduba	[%o1+0x040]%asi,%l7	! %l7 = 0000000000000063
!	Mem[0000000010101410] = ffffffff, %l6 = ffffffffffffffff
	ldstuba	[%i4+%o5]0x80,%l6	! %l6 = 00000000000000ff
!	%l4 = 00000000ffffff08, Mem[00000000300c1410] = 00000000000000ff
	stxa	%l4,[%i3+%o5]0x89	! Mem[00000000300c1410] = 00000000ffffff08

p0_label_46:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141438] = 63d3442279bfb66b, %l6 = 00000000000000ff
	ldx	[%i5+0x038],%l6		! %l6 = 63d3442279bfb66b
!	Mem[0000000010141410] = ffffffff, %l4 = 00000000ffffff08
	lduwa	[%i5+%o5]0x80,%l4	! %l4 = 00000000ffffffff
!	Mem[0000000010141438] = 63d34422, %f1  = 000000ff
	ld	[%i5+0x038],%f1 	! %f1 = 63d34422
!	Mem[0000000030041410] = 1866de2f00000df0, %l1 = 0eab19ff61030000
	ldxa	[%i1+%o5]0x89,%l1	! %l1 = 1866de2f00000df0
!	Mem[0000000030081400] = 000000fb, %l0 = ffffffffffffff0d
	ldsba	[%i2+%g0]0x89,%l0	! %l0 = fffffffffffffffb
!	Mem[0000000030081408] = ff000065, %f31 = 2244d363
	lda	[%i2+%o4]0x81,%f31	! %f31 = ff000065
!	Mem[0000000010101410] = ffffffff4eba2a5d, %l3 = 00000000000000ff
	ldx	[%i4+%o5],%l3		! %l3 = ffffffff4eba2a5d
!	Mem[000000001008141c] = 28af9783, %l1 = 1866de2f00000df0
	ldub	[%i2+0x01c],%l1		! %l1 = 0000000000000028
!	Mem[00000000100c1437] = 65083535, %l4 = 00000000ffffffff
	ldub	[%i3+0x037],%l4		! %l4 = 0000000000000035
!	Mem[00000000300c1410] = 08ffffff00000000, %l6 = 63d3442279bfb66b
	ldxa	[%i3+%o5]0x81,%l6	! %l6 = 08ffffff00000000

p0_label_47:
!	Starting 10 instruction Store Burst
!	%l5 = 000000000000000d, Mem[0000000010141410] = 273e35ffffffffff
	stxa	%l5,[%i5+%o5]0x88	! Mem[0000000010141410] = 000000000000000d
!	%l1 = 0000000000000028, Mem[0000000010041400] = 000000f90000003c
	stxa	%l1,[%i1+%g0]0x80	! Mem[0000000010041400] = 0000000000000028
!	%f30 = 6bb6bf79, Mem[0000000010081408] = 1f5d4f3c
	sta	%f30,[%i2+%o4]0x88	! Mem[0000000010081408] = 6bb6bf79
!	%l2 = ffa6c783, %l3 = 4eba2a5d, Mem[0000000010041428] = 3f8f70c6 7958f9ff
	std	%l2,[%i1+0x028]		! Mem[0000000010041428] = ffa6c783 4eba2a5d
!	%f6  = 1d35790e, Mem[0000000030101408] = ffa6c783
	sta	%f6 ,[%i4+%o4]0x81	! Mem[0000000030101408] = 1d35790e
!	Mem[0000000021800000] = 659d5eb0, %l4 = 0000000000000035
	ldstub	[%o3+%g0],%l4		! %l4 = 0000000000000065
!	%f12 = ffffffff, Mem[0000000010141408] = ffa6c783
	sta	%f12,[%i5+%o4]0x80	! Mem[0000000010141408] = ffffffff
!	%l3 = ffffffff4eba2a5d, Mem[0000000030041400] = 0e79351d
	stha	%l3,[%i1+%g0]0x89	! Mem[0000000030041400] = 0e792a5d
!	%f30 = 6bb6bf79, Mem[0000000030141408] = 00000052
	sta	%f30,[%i5+%o4]0x89	! Mem[0000000030141408] = 6bb6bf79
!	Code Fragment 4, seed = 228557
p0_fragment_2:
!	%l0 = fffffffffffffffb
	setx	0xd7452237dc52eebe,%g7,%l0 ! %l0 = d7452237dc52eebe
!	%l1 = 0000000000000028
	setx	0x7491cf25d9953f69,%g7,%l1 ! %l1 = 7491cf25d9953f69
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = d7452237dc52eebe
	setx	0x0f73fe6e3e144c24,%g7,%l0 ! %l0 = 0f73fe6e3e144c24
!	%l1 = 7491cf25d9953f69
	setx	0x03e6fe82b0f097ef,%g7,%l1 ! %l1 = 03e6fe82b0f097ef
p0_fragment_2_end:

p0_label_48:
!	Starting 10 instruction Load Burst
!	%l0 = 0f73fe6e3e144c24, %l2 = ffffffffffa6c783, %y  = 00000000
	udiv	%l0,%l2,%l6		! %l6 = 0000000000000000
	mov	%l0,%y			! %y = 3e144c24
!	Mem[0000000010041410] = 000063cb, %l4 = 0000000000000065
	lduha	[%i1+%o5]0x88,%l4	! %l4 = 00000000000063cb
!	Mem[0000000030041400] = 5d2a790e, %f8  = 5f331092
	lda	[%i1+%g0]0x81,%f8 	! %f8 = 5d2a790e
!	Mem[0000000030081408] = 650000ff, %l3 = ffffffff4eba2a5d
	ldswa	[%i2+%o4]0x89,%l3	! %l3 = 00000000650000ff
!	Mem[0000000010041410] = cb630000 00000000, %l2 = ffa6c783, %l3 = 650000ff
	ldda	[%i1+%o5]0x80,%l2	! %l2 = 00000000cb630000 0000000000000000
!	Mem[00000000300c1408] = 8d6e143cffff0cff, %f0  = 00000000 63d34422
	ldda	[%i3+%o4]0x89,%f0 	! %f0  = 8d6e143c ffff0cff
!	Mem[00000000100c1408] = 00000000, %f9  = ff000000
	lda	[%i3+%o4]0x80,%f9 	! %f9 = 00000000
!	Mem[00000000100c1410] = 000052f0, %l2 = 00000000cb630000
	ldsha	[%i3+%o5]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000030181408] = 83c7a6ff, %l2 = 0000000000000000
	lduwa	[%i6+%o4]0x89,%l2	! %l2 = 0000000083c7a6ff
!	Mem[0000000030041410] = 00000df0, %l5 = 000000000000000d
	lduba	[%i1+%o5]0x89,%l5	! %l5 = 00000000000000f0

p0_label_49:
!	Starting 10 instruction Store Burst
!	Mem[0000000010041410] = cb630000, %l7 = 0000000000000063
	ldstuba	[%i1+%o5]0x80,%l7	! %l7 = 00000000000000cb
!	%l6 = 0000000000000000, Mem[0000000010101410] = ffffffff, %asi = 80
	stha	%l6,[%i4+0x010]%asi	! Mem[0000000010101410] = 0000ffff
!	Mem[0000000030001410] = 00000000, %l0 = 0f73fe6e3e144c24
	ldstuba	[%i0+%o5]0x81,%l0	! %l0 = 0000000000000000
!	%l0 = 0000000000000000, Mem[0000000030081408] = ff000065
	stba	%l0,[%i2+%o4]0x81	! Mem[0000000030081408] = 00000065
!	Mem[0000000010101408] = 000000ff, %l4 = 00000000000063cb
	swapa	[%i4+%o4]0x88,%l4	! %l4 = 00000000000000ff
!	%l5 = 00000000000000f0, %l2 = 0000000083c7a6ff, %l0 = 0000000000000000
	or	%l5,%l2,%l0		! %l0 = 0000000083c7a6ff
!	%l0 = 0000000083c7a6ff, Mem[0000000010001400] = 1ce1feff
	stwa	%l0,[%i0+%g0]0x88	! Mem[0000000010001400] = 83c7a6ff
!	Mem[0000000020800001] = 35ffc420, %l7 = 00000000000000cb
	ldstub	[%o1+0x001],%l7		! %l7 = 00000000000000ff
!	%l3 = 0000000000000000, Mem[00000000218000c0] = 03bd5540, %asi = 80
	stha	%l3,[%o3+0x0c0]%asi	! Mem[00000000218000c0] = 00005540
!	%l5 = 00000000000000f0, Mem[0000000030081408] = 65000000
	stha	%l5,[%i2+%o4]0x89	! Mem[0000000030081408] = 650000f0

p0_label_50:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001414] = 65cc41af, %l7 = 00000000000000ff
	lduh	[%i0+0x014],%l7		! %l7 = 00000000000065cc
!	Code Fragment 4, seed = 504272
p0_fragment_3:
!	%l0 = 0000000083c7a6ff
	setx	0x4d774062e124b9a6,%g7,%l0 ! %l0 = 4d774062e124b9a6
!	%l1 = 03e6fe82b0f097ef
	setx	0x9525355f81c535d1,%g7,%l1 ! %l1 = 9525355f81c535d1
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 4d774062e124b9a6
	setx	0x5c524ebf2750960c,%g7,%l0 ! %l0 = 5c524ebf2750960c
!	%l1 = 9525355f81c535d1
	setx	0xd4f75f2542aedd57,%g7,%l1 ! %l1 = d4f75f2542aedd57
p0_fragment_3_end:
!	Mem[0000000010081400] = 000008b2, %f5  = ffffffff
	lda	[%i2+%g0]0x80,%f5 	! %f5 = 000008b2
!	Mem[00000000300c1400] = 00000000, %l6 = 0000000000000000
	lduha	[%i3+%g0]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000010181408] = 45ffffff 0dffffff, %l4 = 000000ff, %l5 = 000000f0
	ldda	[%i6+%o4]0x88,%l4	! %l4 = 000000000dffffff 0000000045ffffff
!	Mem[00000000300c1410] = ffffff08, %l7 = 00000000000065cc
	lduwa	[%i3+%o5]0x89,%l7	! %l7 = 00000000ffffff08
!	Mem[0000000010141400] = ffffffff, %l4 = 000000000dffffff
	lduha	[%i5+%g0]0x80,%l4	! %l4 = 000000000000ffff
	membar	#Sync			! Added by membar checker (12)
!	Mem[0000000030141400] = 000000ff 3dd7a9f1 79bfb66b 7489e967
!	Mem[0000000030141410] = 0eab19ff 61030000 6a7c8eea 50da7913
!	Mem[0000000030141420] = 7f1cccf8 50c29e29 029537f6 7599666f
!	Mem[0000000030141430] = 74b74e95 13311f65 24e5bec2 260b228b
	ldda	[%i5+%g0]ASI_BLK_AIUSL,%f16	! Block Load from 0000000030141400
!	Mem[0000000030181400] = ff000065, %l5 = 0000000045ffffff
	lduha	[%i6+%g0]0x81,%l5	! %l5 = 000000000000ff00
!	Mem[0000000010141410] = 0d000000, %l5 = 000000000000ff00
	lduba	[%i5+%o5]0x80,%l5	! %l5 = 000000000000000d

p0_label_51:
!	Starting 10 instruction Store Burst
!	%l5 = 000000000000000d, Mem[00000000100c1408] = 00000000
	stba	%l5,[%i3+%o4]0x80	! Mem[00000000100c1408] = 0d000000
!	%l3 = 0000000000000000, Mem[0000000030001400] = ffffffffff000000
	stxa	%l3,[%i0+%g0]0x89	! Mem[0000000030001400] = 0000000000000000
!	%f15 = 64a63cff, Mem[0000000010181410] = ff000000
	sta	%f15,[%i6+%o5]0x80	! Mem[0000000010181410] = 64a63cff
!	Mem[0000000010081410] = 3c146e8d, %l0 = 000000002750960c
	swapa	[%i2+%o5]0x80,%l0	! %l0 = 000000003c146e8d
!	Mem[00000000201c0001] = 00ffddf0, %l4 = 000000000000ffff
	ldstub	[%o0+0x001],%l4		! %l4 = 00000000000000ff
!	%f28 = 651f3113, Mem[0000000010141408] = ffffffff
	sta	%f28,[%i5+%o4]0x80	! Mem[0000000010141408] = 651f3113
!	%f10 = 1c0da300 1876b711, %l2 = 0000000083c7a6ff
!	Mem[0000000010041408] = 0000006500000000
	add	%i1,0x008,%g1
	stda	%f10,[%g1+%l2]ASI_PST8_PL ! Mem[0000000010041408] = 11b7761800a30d1c
!	Code Fragment 4, seed = 880006
p0_fragment_4:
!	%l0 = 000000003c146e8d
	setx	0x235540c0eb4e71f6,%g7,%l0 ! %l0 = 235540c0eb4e71f6
!	%l1 = d4f75f2542aedd57
	setx	0x5cf127ca0063bd21,%g7,%l1 ! %l1 = 5cf127ca0063bd21
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 235540c0eb4e71f6
	setx	0x7f1be5fcabb6bc5c,%g7,%l0 ! %l0 = 7f1be5fcabb6bc5c
!	%l1 = 5cf127ca0063bd21
	setx	0x6ecc439031f672a7,%g7,%l1 ! %l1 = 6ecc439031f672a7
p0_fragment_4_end:
!	Mem[0000000030041410] = f00d0000, %l0 = 7f1be5fcabb6bc5c
	ldstuba	[%i1+%o5]0x81,%l0	! %l0 = 00000000000000f0
!	%l2 = 83c7a6ff, %l3 = 00000000, Mem[0000000010001408] = 00000027 65353e27
	stda	%l2,[%i0+%o4]0x80	! Mem[0000000010001408] = 83c7a6ff 00000000

p0_label_52:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = 00000000 00000028, %l6 = 00000000, %l7 = ffffff08
	ldd	[%i1+%g0],%l6		! %l6 = 0000000000000000 0000000000000028
!	Mem[00000000100c1408] = 0000000d, %l2 = 0000000083c7a6ff
	ldswa	[%i3+%o4]0x88,%l2	! %l2 = 000000000000000d
!	Mem[00000000300c1400] = 00000000 00000000, %l4 = 000000ff, %l5 = 0000000d
	ldda	[%i3+%g0]0x81,%l4	! %l4 = 0000000000000000 0000000000000000
!	Mem[0000000010101424] = 3d35d1d9, %f3  = 2808c743
	lda	[%i4+0x024]%asi,%f3 	! %f3 = 3d35d1d9
!	Mem[00000000201c0001] = 00ffddf0, %l4 = 0000000000000000, %asi = 80
	ldsba	[%o0+0x001]%asi,%l4	! %l4 = ffffffffffffffff
!	Mem[00000000100c140d] = 00000000, %l6 = 0000000000000000
	ldsb	[%i3+0x00d],%l6		! %l6 = 0000000000000000
!	Mem[0000000010041408] = 11b77618, %l0 = 00000000000000f0
	ldsba	[%i1+%o4]0x80,%l0	! %l0 = 0000000000000011
!	Mem[0000000010141438] = 63d3442279bfb66b, %l4 = ffffffffffffffff
	ldx	[%i5+0x038],%l4		! %l4 = 63d3442279bfb66b
!	Mem[0000000010081408] = 79bfb66b, %l1 = 6ecc439031f672a7
	lduha	[%i2+%o4]0x80,%l1	! %l1 = 00000000000079bf
!	%l0 = 0000000000000011, %l6 = 0000000000000000, %y  = 3e144c24
	umul	%l0,%l6,%l6		! %l6 = 0000000000000000, %y = 00000000

p0_label_53:
!	Starting 10 instruction Store Burst
!	%l7 = 0000000000000028, Mem[00000000100c1410] = 000052f0
	stba	%l7,[%i3+%o5]0x80	! Mem[00000000100c1410] = 280052f0
!	Mem[0000000030081408] = 650000f0, %l1 = 00000000000079bf
	swapa	[%i2+%o4]0x89,%l1	! %l1 = 00000000650000f0
!	%l4 = 79bfb66b, %l5 = 00000000, Mem[0000000010041428] = ffa6c783 4eba2a5d, %asi = 80
	stda	%l4,[%i1+0x028]%asi	! Mem[0000000010041428] = 79bfb66b 00000000
!	%l5 = 0000000000000000, immd = fffffffffffff5a8, %l108 = 0000000000000003
	sdivx	%l5,-0xa58,%l3		! %l3 = 0000000000000000
!	Mem[0000000010141430] = 8d6e143cffffff08, %l6 = 0000000000000000, %l0 = 0000000000000011
	add	%i5,0x30,%g1
	casxa	[%g1]0x80,%l6,%l0	! %l0 = 8d6e143cffffff08
!	%l7 = 0000000000000028, Mem[0000000030001400] = 0000000000000000
	stxa	%l7,[%i0+%g0]0x89	! Mem[0000000030001400] = 0000000000000028
!	Mem[00000000211c0001] = 4eff0480, %l0 = 8d6e143cffffff08
	ldstub	[%o2+0x001],%l0		! %l0 = 00000000000000ff
!	%l4 = 63d3442279bfb66b, Mem[0000000010141410] = 000000000000000d
	stxa	%l4,[%i5+%o5]0x88	! Mem[0000000010141410] = 63d3442279bfb66b
!	%l0 = 000000ff, %l1 = 650000f0, Mem[0000000010181408] = 0dffffff 45ffffff
	stda	%l0,[%i6+%o4]0x88	! Mem[0000000010181408] = 000000ff 650000f0
!	%l3 = 0000000000000000, Mem[0000000010101426] = 3d35d1d9, %asi = 80
	stha	%l3,[%i4+0x026]%asi	! Mem[0000000010101424] = 3d350000

p0_label_54:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081428] = 2ddd60265ca20fdf, %f28 = 651f3113 954eb774
	ldd	[%i2+0x028],%f28	! %f28 = 2ddd6026 5ca20fdf
!	Mem[0000000010101408] = cb63000011396151, %l7 = 0000000000000028
	ldxa	[%i4+%o4]0x80,%l7	! %l7 = cb63000011396151
!	Mem[0000000030041400] = 0e792a5d, %l4 = 63d3442279bfb66b
	ldswa	[%i1+%g0]0x89,%l4	! %l4 = 000000000e792a5d
!	Mem[0000000030181400] = 650000ff, %l0 = 00000000000000ff
	lduha	[%i6+%g0]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010041427] = 6544fd39, %l5 = 0000000000000000, %asi = 80
	lduba	[%i1+0x027]%asi,%l5	! %l5 = 0000000000000039
!	Mem[0000000010001410] = 64a63cff, %f14 = 6797e612
	lda	[%i0+%o5]0x88,%f14	! %f14 = 64a63cff
!	Mem[0000000030041410] = 00000dff, %l5 = 0000000000000039
	lduba	[%i1+%o5]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030001400] = 28000000, %f11 = 1876b711
	lda	[%i0+%g0]0x81,%f11	! %f11 = 28000000
!	Mem[0000000010181410] = 64a63cff, %l1 = 00000000650000f0
	lduba	[%i6+%o5]0x80,%l1	! %l1 = 0000000000000064
!	Mem[0000000010081400] = b2080000, %l6 = 0000000000000000
	lduha	[%i2+%g0]0x88,%l6	! %l6 = 0000000000000000

p0_label_55:
!	Starting 10 instruction Store Burst
!	%l5 = 00000000000000ff, Mem[0000000010141408] = 13311f65
	stba	%l5,[%i5+%o4]0x88	! Mem[0000000010141408] = 13311fff
!	%l2 = 0000000d, %l3 = 00000000, Mem[0000000010081410] = 0c965027 00000000
	stda	%l2,[%i2+%o5]0x88	! Mem[0000000010081410] = 0000000d 00000000
!	%f26 = 6f669975, %f31 = c2bee524, %f15 = 64a63cff
	fdivs	%f26,%f31,%f15		! %f15 = ec1a9f6f
!	%l5 = 00000000000000ff, Mem[00000000211c0001] = 4eff0480, %asi = 80
	stba	%l5,[%o2+0x001]%asi	! Mem[00000000211c0000] = 4eff0480
!	%f26 = 6f669975 f6379502, Mem[0000000030081400] = 000000fb 51613911
	stda	%f26,[%i2+%g0]0x89	! Mem[0000000030081400] = 6f669975 f6379502
!	Mem[0000000010081400] = b2080000, %l2 = 000000000000000d
	ldstuba	[%i2+%g0]0x88,%l2	! %l2 = 0000000000000000
!	%l6 = 00000000, %l7 = 11396151, Mem[0000000030181400] = 650000ff d5cb975d
	stda	%l6,[%i6+%g0]0x89	! Mem[0000000030181400] = 00000000 11396151
!	%l1 = 0000000000000064, %l1 = 0000000000000064, %l2 = 0000000000000000
	andn	%l1,%l1,%l2		! %l2 = 0000000000000000
!	%l6 = 00000000, %l7 = 11396151, Mem[0000000030041400] = 0e792a5d 71fe6c7d
	stda	%l6,[%i1+%g0]0x89	! Mem[0000000030041400] = 00000000 11396151
!	%f28 = 2ddd6026 5ca20fdf, %l7 = cb63000011396151
!	Mem[0000000010041410] = ff63000000000000
	add	%i1,0x010,%g1
	stda	%f28,[%g1+%l7]ASI_PST32_P ! Mem[0000000010041410] = ff6300005ca20fdf

p0_label_56:
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (13)
!	Mem[0000000010141400] = ffffffff 00000361 ff1f3113 08e66057
!	Mem[0000000010141410] = 6bb6bf79 2244d363 6b74384a 23ca20f3
!	Mem[0000000010141420] = 40536958 28818d09 0ea59f56 3fb0144f
!	Mem[0000000010141430] = 8d6e143c ffffff08 63d34422 79bfb66b
	ldda	[%i5+%g0]ASI_BLK_PL,%f16	! Block Load from 0000000010141400
!	Mem[0000000010001400] = ffa6c783, %f13 = 660abef5
	lda	[%i0+%g0]0x80,%f13	! %f13 = ffa6c783
!	Mem[00000000100c1400] = 4e000000, %l3 = 0000000000000000
	ldsba	[%i3+%g0]0x80,%l3	! %l3 = 000000000000004e
!	Mem[0000000030141400] = f1a9d73dff000000, %f0  = 8d6e143c ffff0cff
	ldda	[%i5+%g0]0x89,%f0 	! %f0  = f1a9d73d ff000000
!	Mem[00000000211c0000] = 4eff0480, %l3 = 000000000000004e
	ldsh	[%o2+%g0],%l3		! %l3 = 0000000000004eff
!	Mem[0000000010081410] = 0000000d, %l4 = 000000000e792a5d
	ldsha	[%i2+%o5]0x88,%l4	! %l4 = 000000000000000d
!	Mem[0000000010181400] = 000000ff ff19ab0e, %l4 = 0000000d, %l5 = 000000ff
	ldd	[%i6+%g0],%l4		! %l4 = 00000000000000ff 00000000ff19ab0e
!	Mem[0000000010101400] = ff000043, %l3 = 0000000000004eff
	ldsba	[%i4+%g0]0x80,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000030181408] = ffa6c78308e66057, %f10 = 1c0da300 28000000
	ldda	[%i6+%o4]0x81,%f10	! %f10 = ffa6c783 08e66057
!	Mem[0000000010041400] = 00000000, %l3 = ffffffffffffffff
	lduwa	[%i1+%g0]0x80,%l3	! %l3 = 0000000000000000

p0_label_57:
!	Starting 10 instruction Store Burst
!	Mem[0000000010141408] = ff1f3113, %l2 = 0000000000000000
	swapa	[%i5+%o4]0x80,%l2	! %l2 = 00000000ff1f3113
!	%l2 = 00000000ff1f3113, Mem[0000000010181408] = 650000f0000000ff
	stxa	%l2,[%i6+%o4]0x88	! Mem[0000000010181408] = 00000000ff1f3113
!	%f18 = 5760e608 13311fff, Mem[0000000030101408] = 1d35790e 08e66057
	stda	%f18,[%i4+%o4]0x81	! Mem[0000000030101408] = 5760e608 13311fff
!	Mem[0000000030101400] = 00a30d1c, %l1 = 0000000000000064
	swapa	[%i4+%g0]0x89,%l1	! %l1 = 0000000000a30d1c
!	%l7 = cb63000011396151, Mem[0000000030101408] = ff1f311308e66057
	stxa	%l7,[%i4+%o4]0x89	! Mem[0000000030101408] = cb63000011396151
!	Mem[0000000020800000] = 35ffc420, %l5 = 00000000ff19ab0e
	ldstub	[%o1+%g0],%l5		! %l5 = 0000000000000035
!	%l1 = 0000000000a30d1c, Mem[00000000300c1400] = 00000000
	stha	%l1,[%i3+%g0]0x81	! Mem[00000000300c1400] = 0d1c0000
!	%l4 = 00000000000000ff, Mem[00000000100c1422] = 5c978008, %asi = 80
	stba	%l4,[%i3+0x022]%asi	! Mem[00000000100c1420] = 5c97ff08
!	Mem[0000000010181417] = 000063cb, %l2 = 00000000ff1f3113
	ldstuba	[%i6+0x017]%asi,%l2	! %l2 = 00000000000000cb
!	%l1 = 0000000000a30d1c, Mem[0000000010001408] = 83c7a6ff00000000
	stxa	%l1,[%i0+%o4]0x80	! Mem[0000000010001408] = 0000000000a30d1c

p0_label_58:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = f0520028, %l0 = 00000000000000ff
	ldsba	[%i3+%o5]0x88,%l0	! %l0 = 0000000000000028
!	Mem[00000000100c1400] = 0000004e, %l0 = 0000000000000028
	ldsha	[%i3+%g0]0x88,%l0	! %l0 = 000000000000004e
!	Mem[0000000010101400] = 430000ff, %l3 = 0000000000000000
	lduha	[%i4+%g0]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010001418] = 1ce1feff, %f10 = ffa6c783
	ld	[%i0+0x018],%f10	! %f10 = 1ce1feff
!	Mem[0000000030181400] = 00000000, %l5 = 0000000000000035
	ldsha	[%i6+%g0]0x89,%l5	! %l5 = 0000000000000000
!	%l2 = 00000000000000cb, immd = 00000000000000dd, %l108 = 0000000000000000
	udivx	%l2,0x0dd,%l0		! %l0 = 0000000000000000
!	%l3 = 00000000000000ff, immd = 00000c40, %y  = 00000000
	udiv	%l3,0xc40,%l7		! %l7 = 0000000000000000
	mov	%l0,%y			! %y = 00000000
!	Mem[00000000100c143e] = 4def72db, %l2 = 00000000000000cb, %asi = 80
	ldsha	[%i3+0x03e]%asi,%l2	! %l2 = 00000000000072db
!	Mem[000000001000143a] = 6e43f332, %l7 = 0000000000000000, %asi = 80
	lduha	[%i0+0x03a]%asi,%l7	! %l7 = 000000000000f332
!	Mem[00000000100c1420] = 5c97ff08658ffff9, %f8  = 5d2a790e 00000000, %asi = 80
	ldda	[%i3+0x020]%asi,%f8 	! %f8  = 5c97ff08 658ffff9

p0_label_59:
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1408] = ff0cffff, %l0 = 0000000000000000
	swapa	[%i3+%o4]0x81,%l0	! %l0 = 00000000ff0cffff
!	Mem[0000000030001410] = ff000000, %l6 = 0000000000000000
	ldstuba	[%i0+%o5]0x81,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030181400] = 00000000, %l6 = 00000000000000ff
	swapa	[%i6+%g0]0x81,%l6	! %l6 = 0000000000000000
!	%l6 = 0000000000000000, Mem[0000000030001400] = 28000000
	stwa	%l6,[%i0+%g0]0x81	! Mem[0000000030001400] = 00000000
!	%l1 = 0000000000a30d1c, Mem[0000000010041438] = 5f3310924f8dcb1b, %asi = 80
	stxa	%l1,[%i1+0x038]%asi	! Mem[0000000010041438] = 0000000000a30d1c
!	Mem[0000000010001408] = 00000000, %l6 = 0000000000000000
	ldstuba	[%i0+%o4]0x88,%l6	! %l6 = 0000000000000000
	membar	#Sync			! Added by membar checker (14)
!	%f26 = 4f14b03f, Mem[0000000010141430] = 8d6e143c
	st	%f26,[%i5+0x030]	! Mem[0000000010141430] = 4f14b03f
!	%f10 = 1ce1feff 08e66057, %l4 = 00000000000000ff
!	Mem[0000000030141418] = 6a7c8eea50da7913
	add	%i5,0x018,%g1
	stda	%f10,[%g1+%l4]ASI_PST8_S ! Mem[0000000030141418] = 1ce1feff08e66057
!	%l7 = 000000000000f332, Mem[0000000030101400] = 64000000
	stha	%l7,[%i4+%g0]0x81	! Mem[0000000030101400] = f3320000
!	Mem[0000000030101400] = f3320000, %l5 = 0000000000000000
	ldstuba	[%i4+%g0]0x81,%l5	! %l5 = 00000000000000f3

p0_label_60:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = 13311fff 00000000, %l0 = ff0cffff, %l1 = 00a30d1c
	ldda	[%i6+%o4]0x80,%l0	! %l0 = 0000000013311fff 0000000000000000
!	Mem[0000000010141408] = 0000000008e66057, %f6  = 1d35790e 52000000
	ldda	[%i5+%o4]0x80,%f6 	! %f6  = 00000000 08e66057
!	Mem[00000000300c1408] = 8d6e143c00000000, %l7 = 000000000000f332
	ldxa	[%i3+%o4]0x89,%l7	! %l7 = 8d6e143c00000000
!	Mem[0000000010001400] = ffa6c783, %f15 = ec1a9f6f
	lda	[%i0+%g0]0x80,%f15	! %f15 = ffa6c783
!	Mem[0000000010181400] = ff000000, %l0 = 0000000013311fff
	lduha	[%i6+%g0]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000030101400] = ff320000, %l4 = 00000000000000ff
	ldswa	[%i4+%g0]0x81,%l4	! %l4 = ffffffffff320000
!	Mem[0000000010081404] = ffffffff, %l4 = ffffffffff320000
	ldsh	[%i2+0x004],%l4		! %l4 = ffffffffffffffff
!	Mem[0000000010141408] = 00000000, %l3 = 00000000000000ff
	lduwa	[%i5+%o4]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000010141408] = 00000000, %l2 = 00000000000072db
	lduha	[%i5+%o4]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000030141408] = 67e989746bb6bf79, %l2 = 0000000000000000
	ldxa	[%i5+%o4]0x89,%l2	! %l2 = 67e989746bb6bf79

p0_label_61:
!	Starting 10 instruction Store Burst
!	%f22 = f320ca23 4a38746b, Mem[0000000010081400] = b20800ff ffffffff
	stda	%f22,[%i2+%g0]0x88	! Mem[0000000010081400] = f320ca23 4a38746b
!	%f21 = 79bfb66b, Mem[00000000300c1410] = ffffff08
	sta	%f21,[%i3+%o5]0x89	! Mem[00000000300c1410] = 79bfb66b
!	Mem[0000000010041410] = ff630000, %l6 = 0000000000000000
	ldstuba	[%i1+%o5]0x80,%l6	! %l6 = 00000000000000ff
!	%f16 = 61030000 ffffffff, %l1 = 0000000000000000
!	Mem[0000000010041408] = 11b7761800a30d1c
	add	%i1,0x008,%g1
	stda	%f16,[%g1+%l1]ASI_PST16_P ! Mem[0000000010041408] = 11b7761800a30d1c
!	Mem[0000000010081408] = 6bb6bf79, %l1 = 0000000000000000
	swapa	[%i2+%o4]0x88,%l1	! %l1 = 000000006bb6bf79
!	%f6  = 00000000, Mem[0000000030001408] = ff0da300
	sta	%f6 ,[%i0+%o4]0x81	! Mem[0000000030001408] = 00000000
!	Mem[00000000100c1408] = 0000000d, %l4 = 00000000ffffffff
	swapa	[%i3+%o4]0x88,%l4	! %l4 = 000000000000000d
!	Mem[0000000010081408] = 00000000, %l2 = 000000006bb6bf79
	swapa	[%i2+%o4]0x80,%l2	! %l2 = 0000000000000000
!	%l1 = 000000006bb6bf79, Mem[0000000010001400] = ffa6c783
	stba	%l1,[%i0+%g0]0x80	! Mem[0000000010001400] = 79a6c783
!	Mem[0000000010081400] = 6b74384a 23ca20f3 6bb6bf79 43c70828
!	%f0  = f1a9d73d ff000000 45ffffff 3d35d1d9
!	%f4  = 000008b2 000008b2 00000000 08e66057
!	%f8  = 5c97ff08 658ffff9 1ce1feff 08e66057
!	%f12 = ffffffff ffa6c783 64a63cff ffa6c783
	stda	%f0 ,[%i2+%g0]ASI_BLK_AIUPL	! Block Store to 0000000010081400

p0_label_62:
!	Starting 10 instruction Load Burst
!	Mem[0000000030101410] = 6b74384a23ca20f3, %l2 = 0000000000000000
	ldxa	[%i4+%o5]0x89,%l2	! %l2 = 6b74384a23ca20f3
!	Mem[0000000030101400] = 000032ff, %l3 = 0000000000000000
	ldswa	[%i4+%g0]0x89,%l3	! %l3 = 00000000000032ff
!	Mem[0000000030041400] = 00000000, %l0 = 0000000000000000
	lduba	[%i1+%g0]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000010181410] = 64a63cff, %l0 = 0000000000000000
	ldsba	[%i6+%o5]0x80,%l0	! %l0 = 0000000000000064
!	Mem[0000000010141418] = 6b74384a23ca20f3, %f18 = 5760e608 13311fff, %asi = 80
	ldda	[%i5+0x018]%asi,%f18	! %f18 = 6b74384a 23ca20f3
!	Mem[0000000010141408] = 00000000, %l6 = 00000000000000ff
	ldswa	[%i5+%o4]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000010101418] = fffee11c00000000, %l2 = 6b74384a23ca20f3
	ldx	[%i4+0x018],%l2		! %l2 = fffee11c00000000
!	Mem[0000000010001400] = 79a6c783, %l7 = 8d6e143c00000000
	lduha	[%i0+%g0]0x80,%l7	! %l7 = 00000000000079a6
	membar	#Sync			! Added by membar checker (15)
!	Mem[0000000010081410] = b2080000, %l3 = 00000000000032ff
	ldswa	[%i2+%o5]0x80,%l3	! %l3 = ffffffffb2080000
!	Mem[00000000100c1400] = 00000065 0000004e, %l0 = 00000064, %l1 = 6bb6bf79
	ldda	[%i3+%g0]0x88,%l0	! %l0 = 000000000000004e 0000000000000065

p0_label_63:
!	Starting 10 instruction Store Burst
!	%l0 = 000000000000004e, Mem[0000000030041400] = 00000000
	stwa	%l0,[%i1+%g0]0x81	! Mem[0000000030041400] = 0000004e
!	Mem[0000000010041410] = ff630000, %l0 = 000000000000004e
	ldstuba	[%i1+%o5]0x80,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010081400] = ff000000, %l3 = 00000000b2080000
	swapa	[%i2+%g0]0x88,%l3	! %l3 = 00000000ff000000
!	%l7 = 00000000000079a6, Mem[0000000010081408] = 3d35d1d9
	stha	%l7,[%i2+%o4]0x88	! Mem[0000000010081408] = 3d3579a6
!	%l7 = 00000000000079a6, Mem[0000000030101400] = ff320000
	stwa	%l7,[%i4+%g0]0x81	! Mem[0000000030101400] = 000079a6
!	%f26 = 4f14b03f 569fa50e, %l3 = 00000000ff000000
!	Mem[0000000010141438] = 63d3442279bfb66b
	add	%i5,0x038,%g1
	stda	%f26,[%g1+%l3]ASI_PST32_PL ! Mem[0000000010141438] = 63d3442279bfb66b
!	Mem[00000000300c1408] = 00000000, %l6 = 0000000000000000
	swapa	[%i3+%o4]0x81,%l6	! %l6 = 0000000000000000
!	%f24 = 098d8128 58695340, Mem[0000000010101410] = ffff0000 5d2aba4e
	stda	%f24,[%i4+%o5]0x88	! Mem[0000000010101410] = 098d8128 58695340
!	%l3 = 00000000ff000000, Mem[0000000010141410] = 79bfb66b
	stwa	%l3,[%i5+%o5]0x88	! Mem[0000000010141410] = ff000000
!	%f8  = 5c97ff08 658ffff9, Mem[0000000010001408] = ff000000 00a30d1c
	stda	%f8 ,[%i0+%o4]0x80	! Mem[0000000010001408] = 5c97ff08 658ffff9

p0_label_64:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = 64a63cff, %l4 = 000000000000000d
	lduba	[%i6+%o5]0x80,%l4	! %l4 = 0000000000000064
!	Mem[0000000030181410] = ffffffff, %l6 = 0000000000000000
	ldsba	[%i6+%o5]0x81,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010141410] = 000000ff, %l1 = 0000000000000065, %asi = 80
	ldsba	[%i5+0x010]%asi,%l1	! %l1 = 0000000000000000
!	Mem[0000000030081408] = d7782a69000079bf, %f4  = 000008b2 000008b2
	ldda	[%i2+%o4]0x89,%f4 	! %f4  = d7782a69 000079bf
!	Mem[0000000030081400] = 6f669975f6379502, %l6 = ffffffffffffffff
	ldxa	[%i2+%g0]0x89,%l6	! %l6 = 6f669975f6379502
!	Mem[0000000030041400] = 4e000000, %l3 = 00000000ff000000
	lduha	[%i1+%g0]0x89,%l3	! %l3 = 0000000000000000
!	Mem[00000000100c140c] = 00000000, %l7 = 00000000000079a6, %asi = 80
	ldsha	[%i3+0x00c]%asi,%l7	! %l7 = 0000000000000000
!	Mem[0000000030141410] = 0eab19ff, %l2 = fffee11c00000000
	lduha	[%i5+%o5]0x81,%l2	! %l2 = 0000000000000eab
!	Mem[0000000010181404] = ff19ab0e, %l5 = 00000000000000f3, %asi = 80
	ldsha	[%i6+0x004]%asi,%l5	! %l5 = ffffffffffffff19
!	%f19 = 23ca20f3, %f28 = 08ffffff, %f4  = d7782a69 000079bf
	fsmuld	%f19,%f28,%f4 		! %f4  = 35a9441e 46bbe1a0

p0_label_65:
!	Starting 10 instruction Store Burst
!	Mem[00000000211c0001] = 4eff0480, %l7 = 0000000000000000
	ldstub	[%o2+0x001],%l7		! %l7 = 00000000000000ff
!	Mem[0000000010081400] = b2080000, %l1 = 0000000000000000
	ldstuba	[%i2+%g0]0x88,%l1	! %l1 = 0000000000000000
!	%l6 = f6379502, %l7 = 000000ff, Mem[0000000010041410] = ff630000 5ca20fdf
	stda	%l6,[%i1+%o5]0x80	! Mem[0000000010041410] = f6379502 000000ff
!	%l1 = 0000000000000000, Mem[0000000030001400] = 00000000
	stwa	%l1,[%i0+%g0]0x89	! Mem[0000000030001400] = 00000000
!	%f11 = 08e66057, Mem[0000000030181408] = 83c7a6ff
	sta	%f11,[%i6+%o4]0x89	! Mem[0000000030181408] = 08e66057
!	Mem[0000000010001400] = 83c7a679, %l1 = 0000000000000000
	ldstuba	[%i0+%g0]0x88,%l1	! %l1 = 0000000000000079
!	Mem[000000001000140c] = 658ffff9, %l5 = 00000000ffffff19, %asi = 80
	swapa	[%i0+0x00c]%asi,%l5	! %l5 = 00000000658ffff9
!	%l7 = 00000000000000ff, Mem[00000000211c0001] = 4eff0480
	stb	%l7,[%o2+0x001]		! Mem[00000000211c0000] = 4eff0480
!	%f24 = 098d8128 58695340, %l3 = 0000000000000000
!	Mem[0000000010101418] = fffee11c00000000
	add	%i4,0x018,%g1
	stda	%f24,[%g1+%l3]ASI_PST32_P ! Mem[0000000010101418] = fffee11c00000000
!	%l5 = 00000000658ffff9, Mem[0000000010081400] = b20800ff
	stha	%l5,[%i2+%g0]0x88	! Mem[0000000010081400] = b208fff9

p0_label_66:
!	Starting 10 instruction Load Burst
!	%l2 = 0000000000000eab, %l2 = 0000000000000eab, %l5 = 00000000658ffff9
	and	%l2,%l2,%l5		! %l5 = 0000000000000eab
!	%f8  = 5c97ff08 658ffff9, %l1 = 0000000000000079
!	Mem[0000000030001428] = 0af6c3167793510f
	add	%i0,0x028,%g1
	stda	%f8,[%g1+%l1]ASI_PST8_S ! Mem[0000000030001428] = 0a97ff08659351f9
!	Mem[0000000010101428] = 757f8ee6, %l5 = 0000000000000eab, %asi = 80
	ldsha	[%i4+0x028]%asi,%l5	! %l5 = 000000000000757f
!	Mem[0000000010041410] = 029537f6, %l5 = 000000000000757f
	ldsba	[%i1+%o5]0x88,%l5	! %l5 = fffffffffffffff6
!	Mem[00000000211c0000] = 4eff0480, %l0 = 00000000000000ff
	ldsh	[%o2+%g0],%l0		! %l0 = 0000000000004eff
!	Mem[00000000100c1400] = 4e000000, %l1 = 0000000000000079
	ldswa	[%i3+%g0]0x80,%l1	! %l1 = 000000004e000000
!	%l3 = 0000000000000000, Mem[0000000030041408] = ffffff0d
	stba	%l3,[%i1+%o4]0x81	! Mem[0000000030041408] = 00ffff0d
!	Mem[0000000010141410] = ff000000, %l5 = fffffffffffffff6
	ldsha	[%i5+%o5]0x88,%l5	! %l5 = 0000000000000000
!	Mem[00000000300c1400] = 0d1c0000, %l6 = 6f669975f6379502
	ldsha	[%i3+%g0]0x81,%l6	! %l6 = 0000000000000d1c
!	Mem[000000001008142c] = fffee11c, %f4  = 35a9441e
	ld	[%i2+0x02c],%f4 	! %f4 = fffee11c

p0_label_67:
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000000064, Mem[0000000030181410] = ffffffff
	stha	%l4,[%i6+%o5]0x81	! Mem[0000000030181410] = 0064ffff
!	%l1 = 000000004e000000, Mem[0000000010141400] = ffffffff
	stba	%l1,[%i5+%g0]0x80	! Mem[0000000010141400] = 00ffffff
!	%l1 = 000000004e000000, Mem[0000000021800080] = 4a538710, %asi = 80
	stha	%l1,[%o3+0x080]%asi	! Mem[0000000021800080] = 00008710
!	%l6 = 0000000000000d1c, Mem[0000000030181400] = 000000ff51613911
	stxa	%l6,[%i6+%g0]0x81	! Mem[0000000030181400] = 0000000000000d1c
!	%l6 = 0000000000000d1c, Mem[0000000010041416] = 000000ff, %asi = 80
	stha	%l6,[%i1+0x016]%asi	! Mem[0000000010041414] = 00000d1c
!	%l0 = 0000000000004eff, Mem[00000000100c1410] = f0520028
	stha	%l0,[%i3+%o5]0x88	! Mem[00000000100c1410] = f0524eff
!	Mem[0000000010001408] = 08ff975c, %l1 = 000000004e000000
	ldstuba	[%i0+%o4]0x88,%l1	! %l1 = 000000000000005c
!	%l2 = 0000000000000eab, Mem[0000000010041400] = 2800000000000000
	stxa	%l2,[%i1+%g0]0x88	! Mem[0000000010041400] = 0000000000000eab
!	Mem[00000000100c1434] = 65083535, %l4 = 0000000000000064
	swap	[%i3+0x034],%l4		! %l4 = 0000000065083535
!	%l3 = 0000000000000000, Mem[0000000010141410] = ff000000
	stha	%l3,[%i5+%o5]0x88	! Mem[0000000010141410] = ff000000

p0_label_68:
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = 0000004e51613911, %l7 = 00000000000000ff
	ldxa	[%i1+%g0]0x81,%l7	! %l7 = 0000004e51613911
	membar	#Sync			! Added by membar checker (16)
!	Mem[00000000100c1400] = 4e000000 65000000 ffffffff 00000000
!	Mem[00000000100c1410] = ff4e52f0 ffffeb3b 659bd17a 0459d763
!	Mem[00000000100c1420] = 5c97ff08 658ffff9 3b7abf86 4196d5bf
!	Mem[00000000100c1430] = 39dbff74 00000064 28e09b52 4def72db
	ldda	[%i3+%g0]ASI_BLK_AIUP,%f0 	! Block Load from 00000000100c1400
!	Mem[0000000030081410] = 44f71100, %l2 = 0000000000000eab
	lduba	[%i2+%o5]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000030181408] = 08e66057, %l6 = 0000000000000d1c
	lduba	[%i6+%o4]0x89,%l6	! %l6 = 0000000000000057
!	Mem[0000000030101408] = 11396151, %l2 = 0000000000000000
	lduwa	[%i4+%o4]0x89,%l2	! %l2 = 0000000011396151
!	Mem[0000000030081410] = 44f71100, %l6 = 0000000000000057
	lduwa	[%i2+%o5]0x89,%l6	! %l6 = 0000000044f71100
!	Mem[00000000300c1410] = 79bfb66b, %l5 = 0000000000000000
	swapa	[%i3+%o5]0x89,%l5	! %l5 = 0000000079bfb66b
!	Mem[0000000010001424] = 58b11659, %l5 = 0000000079bfb66b
	ldsw	[%i0+0x024],%l5		! %l5 = 0000000058b11659
!	Mem[0000000020800000] = ffffc420, %l7 = 0000004e51613911, %asi = 80
	ldsha	[%o1+0x000]%asi,%l7	! %l7 = ffffffffffffffff
!	Mem[00000000211c0001] = 4eff0480, %l2 = 0000000011396151
	ldsb	[%o2+0x001],%l2		! %l2 = ffffffffffffffff

p0_label_69:
!	Starting 10 instruction Store Burst
!	%l1 = 000000000000005c, Mem[0000000030101408] = 11396151
	stba	%l1,[%i4+%o4]0x89	! Mem[0000000030101408] = 1139615c
!	Mem[0000000010081400] = f9ff08b2 3dd7a9f1 a679353d ffffff45
!	%f16 = 61030000 ffffffff 6b74384a 23ca20f3
!	%f20 = 63d34422 79bfb66b f320ca23 4a38746b
!	%f24 = 098d8128 58695340 4f14b03f 569fa50e
!	%f28 = 08ffffff 3c146e8d 6bb6bf79 2244d363
	stda	%f16,[%i2+%g0]ASI_COMMIT_P	! Block Store to 0000000010081400
!	Mem[0000000030081400] = f6379502, %l6 = 0000000044f71100
	swapa	[%i2+%g0]0x89,%l6	! %l6 = 00000000f6379502
!	%l7 = ffffffffffffffff, Mem[0000000010001408] = 08ff97ff
	stha	%l7,[%i0+%o4]0x88	! Mem[0000000010001408] = 08ffffff
!	Code Fragment 4, seed = 591431
p0_fragment_5:
!	%l0 = 0000000000004eff
	setx	0x0418489b940b3cee,%g7,%l0 ! %l0 = 0418489b940b3cee
!	%l1 = 000000000000005c
	setx	0xe4c6bc60a49bf699,%g7,%l1 ! %l1 = e4c6bc60a49bf699
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 0418489b940b3cee
	setx	0x5e0a16d0aa111c54,%g7,%l0 ! %l0 = 5e0a16d0aa111c54
!	%l1 = e4c6bc60a49bf699
	setx	0x5ad32ac6b8bc311f,%g7,%l1 ! %l1 = 5ad32ac6b8bc311f
p0_fragment_5_end:
!	%l7 = ffffffffffffffff, Mem[0000000010141434] = ffffff08, %asi = 80
	stha	%l7,[%i5+0x034]%asi	! Mem[0000000010141434] = ffffff08
!	%f9  = 658ffff9, Mem[0000000010041434] = 2d4561e7
	st	%f9 ,[%i1+0x034]	! Mem[0000000010041434] = 658ffff9
!	%l2 = ffffffffffffffff, Mem[0000000010041410] = 1c0d0000029537f6
	stxa	%l2,[%i1+%o5]0x88	! Mem[0000000010041410] = ffffffffffffffff
!	%l0 = 5e0a16d0aa111c54, Mem[0000000030001410] = 000000ff
	stba	%l0,[%i0+%o5]0x89	! Mem[0000000030001410] = 00000054
!	%l5 = 0000000058b11659, Mem[0000000030041408] = 00ffff0d61030000
	stxa	%l5,[%i1+%o4]0x81	! Mem[0000000030041408] = 0000000058b11659

p0_label_70:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = f0524eff, %l2 = ffffffffffffffff
	lduwa	[%i3+%o5]0x88,%l2	! %l2 = 00000000f0524eff
!	Mem[0000000010181410] = 64a63cff, %l6 = 00000000f6379502
	ldsha	[%i6+%o5]0x80,%l6	! %l6 = 00000000000064a6
!	Mem[0000000010041410] = ffffffffffffffff, %l0 = 5e0a16d0aa111c54, %asi = 80
	ldxa	[%i1+0x010]%asi,%l0	! %l0 = ffffffffffffffff
!	Mem[00000000211c0000] = 4eff0480, %l5 = 0000000058b11659
	lduh	[%o2+%g0],%l5		! %l5 = 0000000000004eff
!	Mem[0000000010181408] = ff1f3113, %l3 = 0000000000000000
	lduwa	[%i6+%o4]0x88,%l3	! %l3 = 00000000ff1f3113
!	Mem[0000000010141408] = 00000000, %l3 = 00000000ff1f3113
	ldswa	[%i5+%o4]0x88,%l3	! %l3 = 0000000000000000
	membar	#Sync			! Added by membar checker (17)
!	Mem[0000000010081420] = 098d812858695340, %f10 = 3b7abf86 4196d5bf, %asi = 80
	ldda	[%i2+0x020]%asi,%f10	! %f10 = 098d8128 58695340
!	Mem[0000000010181410] = ff3ca664, %l5 = 0000000000004eff
	ldsba	[%i6+%o5]0x88,%l5	! %l5 = 0000000000000064
!	Mem[0000000030101408] = 5c613911, %l5 = 0000000000000064
	lduha	[%i4+%o4]0x81,%l5	! %l5 = 0000000000005c61
!	Mem[0000000010181400] = ff000000, %f26 = 4f14b03f
	lda	[%i6+%g0]0x88,%f26	! %f26 = ff000000

p0_label_71:
!	Starting 10 instruction Store Burst
!	%l6 = 00000000000064a6, Mem[0000000030141400] = ff000000
	stba	%l6,[%i5+%g0]0x89	! Mem[0000000030141400] = ff0000a6
!	Mem[0000000010041408] = 1876b711, %l0 = ffffffffffffffff
	ldstuba	[%i1+%o4]0x88,%l0	! %l0 = 0000000000000011
!	%l6 = 000064a6, %l7 = ffffffff, Mem[0000000010041428] = 79bfb66b 00000000
	std	%l6,[%i1+0x028]		! Mem[0000000010041428] = 000064a6 ffffffff
!	Mem[000000001008141e] = 4a38746b, %l6 = 00000000000064a6
	ldstub	[%i2+0x01e],%l6		! %l6 = 0000000000000074
!	%l0 = 0000000000000011, Mem[00000000211c0000] = 4eff0480
	sth	%l0,[%o2+%g0]		! Mem[00000000211c0000] = 00110480
!	%f3  = 00000000, Mem[0000000030101400] = a6790000
	sta	%f3 ,[%i4+%g0]0x89	! Mem[0000000030101400] = 00000000
!	%f9  = 658ffff9, %f2  = ffffffff, %f26 = ff000000
	fsubs	%f9 ,%f2 ,%f26		! %f26 = ffffffff
!	%l4 = 65083535, %l5 = 00005c61, Mem[0000000030081410] = 0011f744 4f832b0d
	stda	%l4,[%i2+%o5]0x81	! Mem[0000000030081410] = 65083535 00005c61
!	%l7 = ffffffffffffffff, Mem[00000000300c1408] = 00000000
	stha	%l7,[%i3+%o4]0x81	! Mem[00000000300c1408] = ffff0000
!	Mem[0000000010041400] = 00000eab, %l1 = 00000000b8bc311f
	swapa	[%i1+%g0]0x88,%l1	! %l1 = 0000000000000eab

p0_label_72:
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = 0000004e, %l7 = ffffffffffffffff
	lduha	[%i1+%g0]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000010001400] = 83c7a6ff, %l3 = 0000000000000000
	lduha	[%i0+%g0]0x88,%l3	! %l3 = 000000000000a6ff
!	%f21 = 79bfb66b, %f7  = 0459d763
	fcmpes	%fcc0,%f21,%f7 		! %fcc0 = 2
!	Mem[0000000010001408] = 19ffffff08ffffff, %f4  = ff4e52f0 ffffeb3b
	ldda	[%i0+%o4]0x88,%f4 	! %f4  = 19ffffff 08ffffff
!	Mem[00000000100c1410] = ff4e52f0ffffeb3b, %f2  = ffffffff 00000000
	ldd	[%i3+%o5],%f2 		! %f2  = ff4e52f0 ffffeb3b
!	Mem[00000000100c142c] = 4196d5bf, %l3 = 000000000000a6ff
	ldsw	[%i3+0x02c],%l3		! %l3 = 000000004196d5bf
!	Mem[00000000100c1400] = 4e000000 65000000, %l2 = f0524eff, %l3 = 4196d5bf
	ldd	[%i3+%g0],%l2		! %l2 = 000000004e000000 0000000065000000
!	Mem[000000001000141c] = 448927c3, %l2 = 000000004e000000
	lduw	[%i0+0x01c],%l2		! %l2 = 00000000448927c3
!	Mem[00000000211c0000] = 00110480, %l5 = 0000000000005c61, %asi = 80
	lduha	[%o2+0x000]%asi,%l5	! %l5 = 0000000000000011
!	Mem[0000000030141408] = 79bfb66b 7489e967, %l4 = 65083535, %l5 = 00000011
	ldda	[%i5+%o4]0x81,%l4	! %l4 = 0000000079bfb66b 000000007489e967

p0_label_73:
!	Starting 10 instruction Store Burst
!	%l2 = 00000000448927c3, immd = fffffffffffff202, %l3  = 0000000065000000
	mulx	%l2,-0xdfe,%l3		! %l3 = fffffc4108e5a586
!	Mem[0000000010101400] = 430000ff, %l1 = 0000000000000eab
	swapa	[%i4+%g0]0x88,%l1	! %l1 = 00000000430000ff
!	%f14 = 28e09b52 4def72db, Mem[0000000030041408] = 00000000 58b11659
	stda	%f14,[%i1+%o4]0x81	! Mem[0000000030041408] = 28e09b52 4def72db
!	%l1 = 00000000430000ff, Mem[0000000030001400] = 0000000000000000
	stxa	%l1,[%i0+%g0]0x89	! Mem[0000000030001400] = 00000000430000ff
!	%f12 = 39dbff74, Mem[0000000030081408] = 000079bf
	sta	%f12,[%i2+%o4]0x89	! Mem[0000000030081408] = 39dbff74
!	Mem[0000000030081408] = 39dbff74, %l5 = 000000007489e967
	ldstuba	[%i2+%o4]0x89,%l5	! %l5 = 0000000000000074
!	Mem[0000000010181410] = 64a63cff, %l2 = 00000000448927c3
	swapa	[%i6+%o5]0x80,%l2	! %l2 = 0000000064a63cff
!	%l3 = fffffc4108e5a586, imm = 0000000000000992, %l1 = 00000000430000ff
	or	%l3,0x992,%l1		! %l1 = fffffc4108e5ad96
!	%f12 = 39dbff74 00000064, Mem[0000000030041410] = 00000dff 1866de2f
	stda	%f12,[%i1+%o5]0x89	! Mem[0000000030041410] = 39dbff74 00000064
!	Mem[0000000030181410] = 0064ffff, %l3 = fffffc4108e5a586
	ldstuba	[%i6+%o5]0x81,%l3	! %l3 = 0000000000000000

p0_label_74:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = c3278944, %l6 = 0000000000000074
	ldswa	[%i6+%o5]0x88,%l6	! %l6 = ffffffffc3278944
!	Mem[00000000201c0000] = 00ffddf0, %l7 = 0000000000000000
	lduh	[%o0+%g0],%l7		! %l7 = 00000000000000ff
!	Mem[0000000010041408] = 1876b7ff, %l6 = ffffffffc3278944
	lduba	[%i1+%o4]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030041410] = 00000064, %l5 = 0000000000000074
	ldsba	[%i1+%o5]0x89,%l5	! %l5 = 0000000000000064
!	Mem[0000000030141410] = 0eab19ff, %l2 = 0000000064a63cff
	ldsha	[%i5+%o5]0x81,%l2	! %l2 = 0000000000000eab
!	Mem[000000001018141a] = 00000052, %l6 = 00000000000000ff, %asi = 80
	lduha	[%i6+0x01a]%asi,%l6	! %l6 = 0000000000000052
!	Mem[0000000030001400] = 430000ff, %l5 = 0000000000000064
	ldswa	[%i0+%g0]0x89,%l5	! %l5 = 00000000430000ff
!	Mem[0000000010001410] = ff3ca664, %l6 = 0000000000000052
	ldswa	[%i0+%o5]0x80,%l6	! %l6 = ffffffffff3ca664
!	Mem[00000000201c0000] = 00ffddf0, %l0 = 0000000000000011
	ldsh	[%o0+%g0],%l0		! %l0 = 00000000000000ff
!	Mem[0000000010141400] = ffffff00, %l6 = ffffffffff3ca664
	ldsha	[%i5+%g0]0x88,%l6	! %l6 = ffffffffffffff00

p0_label_75:
!	Starting 10 instruction Store Burst
!	Mem[0000000010181438] = ff3ca664, %l6 = 00000000ffffff00
	swap	[%i6+0x038],%l6		! %l6 = 00000000ff3ca664
!	Mem[0000000010001410] = ff3ca664, %l5 = 00000000430000ff
	swapa	[%i0+%o5]0x80,%l5	! %l5 = 00000000ff3ca664
!	%l3 = 0000000000000000, imm = 00000000000009ce, %l1 = fffffc4108e5ad96
	orn	%l3,0x9ce,%l1		! %l1 = fffffffffffff631
!	%l2 = 0000000000000eab, Mem[0000000010101408] = cb630000
	stw	%l2,[%i4+%o4]		! Mem[0000000010101408] = 00000eab
!	%l0 = 00000000000000ff, Mem[0000000010001420] = 5e6bd2e8
	stw	%l0,[%i0+0x020]		! Mem[0000000010001420] = 000000ff
!	Mem[0000000010101410] = 40536958, %l0 = 00000000000000ff
	ldstuba	[%i4+%o5]0x80,%l0	! %l0 = 0000000000000040
!	%l2 = 0000000000000eab, Mem[0000000010181408] = ff1f3113
	stba	%l2,[%i6+%o4]0x88	! Mem[0000000010181408] = ff1f31ab
!	Mem[00000000300c1400] = 00001c0d, %l3 = 0000000000000000
	ldstuba	[%i3+%g0]0x89,%l3	! %l3 = 000000000000000d
!	%l4 = 0000000079bfb66b, Mem[0000000010041400] = 1f31bcb800000000
	stx	%l4,[%i1+%g0]		! Mem[0000000010041400] = 0000000079bfb66b
!	%l0 = 0000000000000040, Mem[0000000010141408] = 00000000
	stwa	%l0,[%i5+%o4]0x88	! Mem[0000000010141408] = 00000040

p0_label_76:
!	Starting 10 instruction Load Burst
!	Mem[000000001010140a] = 00000eab, %l2 = 0000000000000eab, %asi = 80
	lduha	[%i4+0x00a]%asi,%l2	! %l2 = 0000000000000eab
!	Mem[0000000030141410] = ff19ab0e, %l4 = 0000000079bfb66b
	ldsba	[%i5+%o5]0x89,%l4	! %l4 = 000000000000000e
!	Mem[0000000010101400] = 00000eab, %l6 = 00000000ff3ca664
	ldsha	[%i4+%g0]0x88,%l6	! %l6 = 0000000000000eab
!	Mem[0000000030141400] = f1a9d73dff0000a6, %f4  = 19ffffff 08ffffff
	ldda	[%i5+%g0]0x89,%f4 	! %f4  = f1a9d73d ff0000a6
!	Mem[0000000010141408] = 40000000, %l5 = 00000000ff3ca664
	ldsha	[%i5+%o4]0x80,%l5	! %l5 = 0000000000004000
!	Mem[0000000010101410] = ff53695828818d09, %f22 = f320ca23 4a38746b, %asi = 80
	ldda	[%i4+0x010]%asi,%f22	! %f22 = ff536958 28818d09
!	Mem[0000000010101400] = 00000eab, %l3 = 000000000000000d
	lduba	[%i4+%g0]0x88,%l3	! %l3 = 00000000000000ab
!	Mem[0000000010001410] = ff000043, %l1 = fffffffffffff631
	ldsha	[%i0+%o5]0x88,%l1	! %l1 = 0000000000000043
!	Mem[0000000010041434] = 658ffff9, %l2 = 0000000000000eab
	ldsw	[%i1+0x034],%l2		! %l2 = 00000000658ffff9
!	Mem[0000000010081400] = ffffffff00000361, %f24 = 098d8128 58695340
	ldda	[%i2+%g0]0x88,%f24	! %f24 = ffffffff 00000361

p0_label_77:
!	Starting 10 instruction Store Burst
!	%l3 = 00000000000000ab, Mem[0000000010181400] = 000000ff
	stwa	%l3,[%i6+%g0]0x80	! Mem[0000000010181400] = 000000ab
!	Mem[000000001014140c] = 08e66057, %l5 = 0000000000004000
	swap	[%i5+0x00c],%l5		! %l5 = 0000000008e66057
!	%l5 = 0000000008e66057, Mem[0000000030041410] = 64000000
	stwa	%l5,[%i1+%o5]0x81	! Mem[0000000030041410] = 08e66057
!	%l5 = 0000000008e66057, Mem[0000000020800041] = 63ff2650
	stb	%l5,[%o1+0x041]		! Mem[0000000020800040] = 63572650
!	%f0  = 4e000000 65000000, %l5 = 0000000008e66057
!	Mem[0000000010081428] = 4f14b03f569fa50e
	add	%i2,0x028,%g1
	stda	%f0,[%g1+%l5]ASI_PST16_PL ! Mem[0000000010081428] = 000000650000a50e
!	%f11 = 58695340, Mem[0000000010101438] = 36cf08b2
	sta	%f11,[%i4+0x038]%asi	! Mem[0000000010101438] = 58695340
!	%f17 = ffffffff, Mem[0000000010081430] = 08ffffff
	sta	%f17,[%i2+0x030]%asi	! Mem[0000000010081430] = ffffffff
!	%l0 = 00000040, %l1 = 00000043, Mem[0000000030001410] = 54000000 659bd17a
	stda	%l0,[%i0+%o5]0x81	! Mem[0000000030001410] = 00000040 00000043
!	Mem[0000000030101410] = 23ca20f3, %l6 = 0000000000000eab
	ldstuba	[%i4+%o5]0x89,%l6	! %l6 = 00000000000000f3
!	Mem[0000000010001400] = ffa6c783, %l1 = 0000000000000043
	ldstuba	[%i0+%g0]0x80,%l1	! %l1 = 00000000000000ff

p0_label_78:
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = 08e66057, %l7 = 00000000000000ff
	ldsba	[%i1+%o5]0x81,%l7	! %l7 = 0000000000000008
!	Mem[0000000030101408] = 1139615c, %l3 = 00000000000000ab
	ldsha	[%i4+%o4]0x89,%l3	! %l3 = 000000000000615c
!	Mem[0000000010141410] = 63d34422ff000000, %f24 = ffffffff 00000361
	ldda	[%i5+%o5]0x88,%f24	! %f24 = 63d34422 ff000000
!	Mem[0000000010141410] = 000000ff, %l6 = 00000000000000f3
	ldsba	[%i5+%o5]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000010141420] = 4053695828818d09, %l1 = 00000000000000ff
	ldx	[%i5+0x020],%l1		! %l1 = 4053695828818d09
!	Mem[0000000030041408] = 28e09b52, %f5  = ff0000a6
	lda	[%i1+%o4]0x81,%f5 	! %f5 = 28e09b52
!	Mem[0000000010101410] = 586953ff, %l3 = 000000000000615c
	lduwa	[%i4+%o5]0x88,%l3	! %l3 = 00000000586953ff
!	Mem[0000000010141420] = 40536958, %f5  = 28e09b52
	lda	[%i5+0x020]%asi,%f5 	! %f5 = 40536958
!	Mem[0000000010101400] = 00000eab, %l6 = 0000000000000000
	ldswa	[%i4+%g0]0x88,%l6	! %l6 = 0000000000000eab
!	Mem[0000000010081410] = 2244d363, %l7 = 0000000000000008
	lduwa	[%i2+%o5]0x88,%l7	! %l7 = 000000002244d363

p0_label_79:
!	Starting 10 instruction Store Burst
!	%f2  = ff4e52f0, Mem[0000000030081408] = 39dbffff
	sta	%f2 ,[%i2+%o4]0x89	! Mem[0000000030081408] = ff4e52f0
!	Mem[0000000010041418] = 5169feba, %l0 = 0000000000000040
	ldstuba	[%i1+0x018]%asi,%l0	! %l0 = 0000000000000051
!	Mem[0000000010001410] = 430000ff, %l4 = 000000000000000e
	swapa	[%i0+%o5]0x80,%l4	! %l4 = 00000000430000ff
!	Mem[00000000218000c1] = 00005540, %l4 = 00000000430000ff
	ldstub	[%o3+0x0c1],%l4		! %l4 = 0000000000000000
!	%l6 = 0000000000000eab, Mem[0000000010101418] = fffee11c
	stb	%l6,[%i4+0x018]		! Mem[0000000010101418] = abfee11c
!	%l0 = 0000000000000051, imm = fffffffffffffbd9, %l0 = 0000000000000051
	or	%l0,-0x427,%l0		! %l0 = fffffffffffffbd9
!	%l5 = 0000000008e66057, Mem[0000000010001408] = 08ffffff
	stwa	%l5,[%i0+%o4]0x88	! Mem[0000000010001408] = 08e66057
!	Mem[0000000010001412] = 0000000e, %l2 = 00000000658ffff9
	ldstub	[%i0+0x012],%l2		! %l2 = 0000000000000000
!	Mem[00000000211c0001] = 00110480, %l0 = fffffffffffffbd9
	ldstub	[%o2+0x001],%l0		! %l0 = 0000000000000011
!	Mem[0000000030101410] = 23ca20ff, %l3 = 00000000586953ff
	swapa	[%i4+%o5]0x89,%l3	! %l3 = 0000000023ca20ff

p0_label_80:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = 40000000, %l5 = 0000000008e66057
	lduha	[%i5+%o4]0x80,%l5	! %l5 = 0000000000004000
!	Mem[0000000010001400] = ff00d205 83c7a6ff, %l6 = 00000eab, %l7 = 2244d363
	ldda	[%i0+%g0]0x88,%l6	! %l6 = 0000000083c7a6ff 00000000ff00d205
!	Mem[00000000100c1400] = 000000650000004e, %f2  = ff4e52f0 ffffeb3b
	ldda	[%i3+%g0]0x88,%f2 	! %f2  = 00000065 0000004e
!	Mem[00000000100c1400] = 00000065 0000004e, %l2 = 00000000, %l3 = 23ca20ff
	ldda	[%i3+%g0]0x88,%l2	! %l2 = 000000000000004e 0000000000000065
!	Mem[0000000030101400] = 000000001876b711, %f10 = 098d8128 58695340
	ldda	[%i4+%g0]0x81,%f10	! %f10 = 00000000 1876b711
!	Mem[0000000010001410] = 0000ff0e, %l0 = 0000000000000011
	lduba	[%i0+%o5]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000010041400] = 00000000, %l6 = 0000000083c7a6ff
	lduha	[%i1+%g0]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000030101408] = 5c613911, %l7 = 00000000ff00d205
	lduwa	[%i4+%o4]0x81,%l7	! %l7 = 000000005c613911
!	Mem[0000000010181408] = ab311fff 00000000, %l0 = 00000000, %l1 = 28818d09, %asi = 80
	ldda	[%i6+0x008]%asi,%l0	! %l0 = 00000000ab311fff 0000000000000000
!	Mem[0000000010101410] = ff536958, %f8  = 5c97ff08
	lda	[%i4+%o5]0x80,%f8 	! %f8 = ff536958

p0_label_81:
!	Starting 10 instruction Store Burst
!	Mem[0000000010081400] = 61030000, %l4 = 0000000000000000
	swapa	[%i2+%g0]0x80,%l4	! %l4 = 0000000061030000
!	Mem[0000000030181408] = 08e66057, %l7 = 000000005c613911
	swapa	[%i6+%o4]0x89,%l7	! %l7 = 0000000008e66057
!	Mem[0000000010141408] = 00000040, %l0 = 00000000ab311fff
	ldstuba	[%i5+%o4]0x88,%l0	! %l0 = 0000000000000040
!	Mem[00000000100c1400] = 4e000000, %l2 = 000000000000004e
	ldstuba	[%i3+%g0]0x80,%l2	! %l2 = 000000000000004e
!	Mem[00000000100c1410] = ff4e52f0, %l6 = 00000000, %l5 = 00004000
	add	%i3,0x10,%g1
	casa	[%g1]0x80,%l6,%l5	! %l5 = 00000000ff4e52f0
!	%f22 = ff536958 28818d09, Mem[0000000010001410] = 0eff0000 af41cc65
	stda	%f22,[%i0+%o5]0x88	! Mem[0000000010001410] = ff536958 28818d09
!	%l4 = 61030000, %l5 = ff4e52f0, Mem[0000000010101400] = ab0e0000 ff0d4fa1
	stda	%l4,[%i4+%g0]0x80	! Mem[0000000010101400] = 61030000 ff4e52f0
!	%f20 = 63d34422 79bfb66b, Mem[0000000010181438] = ffffff00 12e69767
	std	%f20,[%i6+0x038]	! Mem[0000000010181438] = 63d34422 79bfb66b
!	Mem[0000000010081400] = 00000000, %l1 = 0000000000000000
	ldstuba	[%i2+%g0]0x80,%l1	! %l1 = 0000000000000000
!	%f14 = 28e09b52 4def72db, Mem[00000000300c1410] = 00000000 00000000
	stda	%f14,[%i3+%o5]0x89	! Mem[00000000300c1410] = 28e09b52 4def72db

p0_label_82:
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = 1139615c, %l0 = 0000000000000040
	ldswa	[%i6+%o4]0x81,%l0	! %l0 = 000000001139615c
!	Mem[0000000020800041] = 63572650, %l1 = 0000000000000000, %asi = 80
	lduba	[%o1+0x041]%asi,%l1	! %l1 = 0000000000000057
!	Mem[0000000010041400] = 00000000, %l0 = 000000001139615c
	lduwa	[%i1+%g0]0x80,%l0	! %l0 = 0000000000000000
!	Mem[00000000100c1400] = ff000000, %l0 = 0000000000000000
	ldswa	[%i3+%g0]0x80,%l0	! %l0 = ffffffffff000000
!	Mem[0000000030101410] = ff5369584a38746b, %l7 = 0000000008e66057
	ldxa	[%i4+%o5]0x81,%l7	! %l7 = ff5369584a38746b
!	%l2 = 000000000000004e, %l3 = 0000000000000065, %l4 = 0000000061030000
	sdivx	%l2,%l3,%l4		! %l4 = 0000000000000000
!	Mem[0000000030181400] = 00000000, %l5 = 00000000ff4e52f0
	ldsba	[%i6+%g0]0x89,%l5	! %l5 = 0000000000000000
!	Mem[00000000100c1403] = ff000000, %l0 = ffffffffff000000
	ldsb	[%i3+0x003],%l0		! %l0 = 0000000000000000
!	Mem[0000000010001410] = ff53695828818d09, %l5 = 0000000000000000
	ldxa	[%i0+%o5]0x88,%l5	! %l5 = ff53695828818d09
!	Mem[0000000010081410] = 2244d363, %f8  = ff536958
	lda	[%i2+%o5]0x88,%f8 	! %f8 = 2244d363

p0_label_83:
!	Starting 10 instruction Store Burst
!	Mem[0000000010101410] = ff536958, %l5 = ff53695828818d09
	ldstuba	[%i4+%o5]0x80,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030181410] = ff64ffff, %l3 = 0000000000000065
	lduha	[%i6+%o5]0x81,%l3	! %l3 = 000000000000ff64
!	%l0 = 0000000000000000, Mem[0000000010041428] = 000064a6ffffffff
	stx	%l0,[%i1+0x028]		! Mem[0000000010041428] = 0000000000000000
!	Mem[0000000030181400] = 00000000, %l3 = 000000000000ff64
	ldstuba	[%i6+%g0]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000010041410] = ffffffff, %l4 = 0000000000000000
	swapa	[%i1+%o5]0x80,%l4	! %l4 = 00000000ffffffff
!	Mem[0000000021800081] = 00008710, %l6 = 0000000000000000
	ldstub	[%o3+0x081],%l6		! %l6 = 0000000000000000
!	Mem[0000000010141400] = 00ffffff, %l2 = 000000000000004e
	ldstuba	[%i5+%g0]0x80,%l2	! %l2 = 0000000000000000
!	%l2 = 0000000000000000, Mem[0000000010181400] = 000000abff19ab0e
	stxa	%l2,[%i6+%g0]0x80	! Mem[0000000010181400] = 0000000000000000
!	Mem[00000000100c1408] = ffffffff, %l6 = 0000000000000000
	ldstuba	[%i3+%o4]0x80,%l6	! %l6 = 00000000000000ff
!	%l5 = 00000000000000ff, Mem[0000000010181408] = ab311fff
	sth	%l5,[%i6+%o4]		! Mem[0000000010181408] = 00ff1fff

p0_label_84:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141418] = 6b74384a 23ca20f3, %l2 = 00000000, %l3 = 00000000
	ldd	[%i5+0x018],%l2		! %l2 = 000000006b74384a 0000000023ca20f3
!	Mem[0000000010101408] = ab0e0000, %l6 = 00000000000000ff
	ldsba	[%i4+%o4]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000030081408] = d7782a69ff4e52f0, %l7 = ff5369584a38746b
	ldxa	[%i2+%o4]0x89,%l7	! %l7 = d7782a69ff4e52f0
!	Mem[0000000030001410] = 00000040 00000043, %l2 = 6b74384a, %l3 = 23ca20f3
	ldda	[%i0+%o5]0x81,%l2	! %l2 = 0000000000000040 0000000000000043
!	Mem[0000000030181400] = ff000000, %f8  = 2244d363
	lda	[%i6+%g0]0x81,%f8 	! %f8 = ff000000
!	Mem[0000000030001410] = 0000004000000043, %l0 = 0000000000000000
	ldxa	[%i0+%o5]0x81,%l0	! %l0 = 0000004000000043
!	Mem[0000000030141408] = 67e989746bb6bf79, %l3 = 0000000000000043
	ldxa	[%i5+%o4]0x89,%l3	! %l3 = 67e989746bb6bf79
!	Mem[0000000010141438] = 63d3442279bfb66b, %l4 = 00000000ffffffff, %asi = 80
	ldxa	[%i5+0x038]%asi,%l4	! %l4 = 63d3442279bfb66b
!	Mem[0000000010041408] = ffb77618, %f21 = 79bfb66b
	lda	[%i1+%o4]0x80,%f21	! %f21 = ffb77618
!	Mem[0000000010141408] = ff000000, %l2 = 0000000000000040
	lduba	[%i5+%o4]0x80,%l2	! %l2 = 00000000000000ff

p0_label_85:
!	Starting 10 instruction Store Burst
!	%l3 = 67e989746bb6bf79, Mem[0000000030141408] = 79bfb66b
	stha	%l3,[%i5+%o4]0x81	! Mem[0000000030141408] = bf79b66b
!	%l4 = 79bfb66b, %l5 = 000000ff, Mem[0000000030041410] = 5760e608 39dbff74
	stda	%l4,[%i1+%o5]0x89	! Mem[0000000030041410] = 79bfb66b 000000ff
!	%l1 = 0000000000000057, Mem[00000000100c1438] = 28e09b52
	stw	%l1,[%i3+0x038]		! Mem[00000000100c1438] = 00000057
!	%l4 = 79bfb66b, %l5 = 000000ff, Mem[0000000010101410] = ff536958 28818d09
	stda	%l4,[%i4+%o5]0x80	! Mem[0000000010101410] = 79bfb66b 000000ff
!	%l7 = d7782a69ff4e52f0, Mem[0000000030141410] = 0eab19ff
	stha	%l7,[%i5+%o5]0x81	! Mem[0000000030141410] = 52f019ff
!	%f26 = ffffffff 569fa50e, %l6 = 0000000000000000
!	Mem[00000000100c1400] = ff00000065000000
	stda	%f26,[%i3+%l6]ASI_PST32_P ! Mem[00000000100c1400] = ff00000065000000
!	Mem[00000000100c142c] = 4196d5bf, %l4 = 79bfb66b, %l4 = 79bfb66b
	add	%i3,0x2c,%g1
	casa	[%g1]0x80,%l4,%l4	! %l4 = 000000004196d5bf
!	%l1 = 0000000000000057, Mem[0000000010141408] = ff000000
	stba	%l1,[%i5+%o4]0x80	! Mem[0000000010141408] = 57000000
!	%l7 = d7782a69ff4e52f0, Mem[0000000010001408] = 5760e608
	stba	%l7,[%i0+%o4]0x80	! Mem[0000000010001408] = f060e608
!	%l6 = 0000000000000000, %l3 = 67e989746bb6bf79, %l3  = 67e989746bb6bf79
	mulx	%l6,%l3,%l3		! %l3 = 0000000000000000

p0_label_86:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = 0000000079bfb66b, %f2  = 00000065 0000004e
	ldda	[%i1+%g0]0x80,%f2 	! %f2  = 00000000 79bfb66b
!	Mem[0000000010181400] = 00000000, %f2  = 00000000
	lda	[%i6+%g0]0x88,%f2 	! %f2 = 00000000
!	Mem[0000000030081400] = 6f669975 44f71100, %l4 = 4196d5bf, %l5 = 000000ff
	ldda	[%i2+%g0]0x89,%l4	! %l4 = 0000000044f71100 000000006f669975
!	Mem[0000000010141402] = ffffffff, %l1 = 0000000000000057, %asi = 80
	lduha	[%i5+0x002]%asi,%l1	! %l1 = 000000000000ffff
!	Mem[0000000030141400] = ff0000a6, %l7 = d7782a69ff4e52f0
	lduha	[%i5+%g0]0x89,%l7	! %l7 = 00000000000000a6
!	Mem[0000000010001408] = f060e608ffffff19, %l3 = 0000000000000000
	ldxa	[%i0+%o4]0x80,%l3	! %l3 = f060e608ffffff19
!	Mem[0000000030001408] = 00000000, %l4 = 0000000044f71100
	ldswa	[%i0+%o4]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000010181400] = 00000000, %f22 = ff536958
	lda	[%i6+%g0]0x88,%f22	! %f22 = 00000000
!	Mem[00000000100c1410] = f0524eff, %l0 = 0000004000000043
	ldsba	[%i3+%o5]0x88,%l0	! %l0 = ffffffffffffffff
!	%l6 = 0000000000000000, immd = fffffff0, %y  = 00000000
	udiv	%l6,-0x010,%l2		! %l2 = 0000000000000000
	mov	%l0,%y			! %y = ffffffff

p0_label_87:
!	Starting 10 instruction Store Burst
!	Mem[0000000010181410] = 448927c3, %l3 = f060e608ffffff19
	ldstuba	[%i6+%o5]0x80,%l3	! %l3 = 0000000000000044
!	Mem[0000000030181408] = 5c613911, %l2 = 0000000000000000
	swapa	[%i6+%o4]0x89,%l2	! %l2 = 000000005c613911
!	%f19 = 23ca20f3, %f24 = 63d34422 ff000000
	fstod	%f19,%f24		! %f24 = 3c79441e 60000000
!	%l2 = 000000005c613911, Mem[0000000020800001] = ffffc420
	stb	%l2,[%o1+0x001]		! Mem[0000000020800000] = ff11c420
!	%l4 = 00000000, %l5 = 6f669975, Mem[0000000030081400] = 0011f744 7599666f
	stda	%l4,[%i2+%g0]0x81	! Mem[0000000030081400] = 00000000 6f669975
!	%f24 = 3c79441e 60000000, Mem[0000000010101400] = 61030000 ff4e52f0, %asi = 80
	stda	%f24,[%i4+0x000]%asi	! Mem[0000000010101400] = 3c79441e 60000000
!	%f8  = ff000000 658ffff9, Mem[0000000010041400] = 00000000 79bfb66b
	std	%f8 ,[%i1+%g0]		! Mem[0000000010041400] = ff000000 658ffff9
!	%l4 = 0000000000000000, Mem[0000000010141400] = ffffffff00000361
	stxa	%l4,[%i5+%g0]0x80	! Mem[0000000010141400] = 0000000000000000
!	%f16 = 61030000, Mem[0000000010041404] = 658ffff9
	st	%f16,[%i1+0x004]	! Mem[0000000010041404] = 61030000
!	Mem[0000000021800180] = 0cffa7d0, %l7 = 00000000000000a6
	ldstub	[%o3+0x180],%l7		! %l7 = 000000000000000c

p0_label_88:
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = 529be028, %l1 = 000000000000ffff
	ldswa	[%i1+%o4]0x89,%l1	! %l1 = 00000000529be028
!	Mem[00000000300c1410] = 4def72db, %l1 = 00000000529be028
	lduha	[%i3+%o5]0x89,%l1	! %l1 = 00000000000072db
!	Mem[0000000030141400] = ff0000a6, %l3 = 0000000000000044
	ldsba	[%i5+%g0]0x89,%l3	! %l3 = ffffffffffffffa6
!	Mem[0000000010181410] = c32789ff, %l3 = ffffffffffffffa6
	ldsha	[%i6+%o5]0x88,%l3	! %l3 = ffffffffffff89ff
!	Mem[0000000010141418] = 6b74384a, %l2 = 000000005c613911
	lduw	[%i5+0x018],%l2		! %l2 = 000000006b74384a
!	Mem[00000000100c1410] = f0524eff, %f15 = 4def72db
	lda	[%i3+%o5]0x88,%f15	! %f15 = f0524eff
!	Mem[00000000100c1408] = ffffffff, %l7 = 000000000000000c
	lduwa	[%i3+%o4]0x88,%l7	! %l7 = 00000000ffffffff
!	Mem[0000000010081400] = 000000ff, %l3 = ffffffffffff89ff
	ldsba	[%i2+%g0]0x88,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000030101408] = 5c613911, %l1 = 00000000000072db
	ldsba	[%i4+%o4]0x81,%l1	! %l1 = 000000000000005c
!	Mem[0000000010001410] = 28818d09, %l5 = 000000006f669975
	ldsba	[%i0+%o5]0x88,%l5	! %l5 = 0000000000000009

p0_label_89:
!	Starting 10 instruction Store Burst
!	%l3 = ffffffffffffffff, Mem[0000000010001408] = 08e660f0
	stwa	%l3,[%i0+%o4]0x88	! Mem[0000000010001408] = ffffffff
!	%l4 = 0000000000000000, Mem[0000000010181400] = 00000000
	stwa	%l4,[%i6+%g0]0x80	! Mem[0000000010181400] = 00000000
!	Code Fragment 3, seed = 757997
p0_fragment_6:
!	%l0 = ffffffffffffffff
	setx	0xbc6b4f8d01006dbe,%g7,%l0 ! %l0 = bc6b4f8d01006dbe
!	%l1 = 000000000000005c
	setx	0xee6afed18bf68e69,%g7,%l1 ! %l1 = ee6afed18bf68e69
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = bc6b4f8d01006dbe
	setx	0x3d804e03f8206b24,%g7,%l0 ! %l0 = 3d804e03f8206b24
!	%l1 = ee6afed18bf68e69
	setx	0x062a383d56ee86ef,%g7,%l1 ! %l1 = 062a383d56ee86ef
p0_fragment_6_end:
!	%l2 = 000000006b74384a, Mem[0000000030181400] = 000000ff
	stwa	%l2,[%i6+%g0]0x89	! Mem[0000000030181400] = 6b74384a
!	%l6 = 00000000, %l7 = ffffffff, Mem[0000000010141410] = 000000ff 2244d363
	stda	%l6,[%i5+%o5]0x80	! Mem[0000000010141410] = 00000000 ffffffff
!	%l0 = 3d804e03f8206b24, Mem[00000000300c1408] = 0000ffff
	stwa	%l0,[%i3+%o4]0x89	! Mem[00000000300c1408] = f8206b24
!	Mem[0000000010041400] = ff000000 61030000 ffb77618 00a30d1c
!	%f0  = 4e000000 65000000 00000000 79bfb66b
!	%f4  = f1a9d73d 40536958 659bd17a 0459d763
!	%f8  = ff000000 658ffff9 00000000 1876b711
!	%f12 = 39dbff74 00000064 28e09b52 f0524eff
	stda	%f0 ,[%i1+%g0]ASI_COMMIT_P	! Block Store to 0000000010041400
!	%l3 = ffffffffffffffff, Mem[00000000201c0001] = 00ffddf0
	stb	%l3,[%o0+0x001]		! Mem[00000000201c0000] = 00ffddf0
	membar	#Sync			! Added by membar checker (18)
!	Mem[0000000010041424] = 658ffff9, %l3 = ffffffff, %l1 = 56ee86ef
	add	%i1,0x24,%g1
	casa	[%g1]0x80,%l3,%l1	! %l1 = 00000000658ffff9
!	Mem[0000000010181410] = c32789ff, %l0 = 3d804e03f8206b24
	ldstuba	[%i6+%o5]0x88,%l0	! %l0 = 00000000000000ff

p0_label_90:
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = ff1c000000000000, %f0  = 4e000000 65000000
	ldda	[%i3+%g0]0x81,%f0 	! %f0  = ff1c0000 00000000
!	Mem[0000000030141400] = ff0000a6, %l7 = 00000000ffffffff
	lduwa	[%i5+%g0]0x89,%l7	! %l7 = 00000000ff0000a6
!	Mem[0000000010181410] = ff8927c3, %l0 = 00000000000000ff
	ldsha	[%i6+%o5]0x80,%l0	! %l0 = ffffffffffffff89
!	Mem[0000000010041416] = 40536958, %l7 = 00000000ff0000a6, %asi = 80
	lduha	[%i1+0x016]%asi,%l7	! %l7 = 0000000000006958
!	Mem[0000000010141408] = 57000000, %l3 = ffffffffffffffff
	ldswa	[%i5+%o4]0x80,%l3	! %l3 = 0000000057000000
!	Mem[0000000010141418] = 6b74384a, %f8  = ff000000
	ld	[%i5+0x018],%f8 	! %f8 = 6b74384a
!	Mem[0000000030101400] = 00000000, %l1 = 00000000658ffff9
	lduha	[%i4+%g0]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000010181410] = ff8927c3000063ff, %f30 = 6bb6bf79 2244d363
	ldd	[%i6+%o5],%f30		! %f30 = ff8927c3 000063ff
!	Mem[0000000010181410] = ff8927c3000063ff, %f0  = ff1c0000 00000000
	ldda	[%i6+%o5]0x80,%f0 	! %f0  = ff8927c3 000063ff
!	Mem[000000001018142c] = 46ce0365, %l7 = 0000000000006958, %asi = 80
	lduwa	[%i6+0x02c]%asi,%l7	! %l7 = 0000000046ce0365

p0_label_91:
!	Starting 10 instruction Store Burst
!	Mem[0000000010081410] = 2244d363, %l4 = 0000000000000000
	ldstuba	[%i2+%o5]0x88,%l4	! %l4 = 0000000000000063
!	%l5 = 0000000000000009, Mem[0000000030141410] = ff19f052
	stba	%l5,[%i5+%o5]0x89	! Mem[0000000030141410] = ff19f009
!	Mem[000000001010143c] = 52f04ebb, %l6 = 0000000000000000
	swap	[%i4+0x03c],%l6		! %l6 = 0000000052f04ebb
!	Mem[0000000030141410] = 09f019ff, %l0 = 00000000ffffff89
	swapa	[%i5+%o5]0x81,%l0	! %l0 = 0000000009f019ff
!	Mem[00000000201c0000] = 00ffddf0, %l6 = 0000000052f04ebb
	ldstub	[%o0+%g0],%l6		! %l6 = 0000000000000000
!	%l1 = 0000000000000000, Mem[0000000010101400] = 1e44793c
	stwa	%l1,[%i4+%g0]0x88	! Mem[0000000010101400] = 00000000
!	Mem[0000000010141410] = 00000000, %l5 = 0000000000000009
	swap	[%i5+%o5],%l5		! %l5 = 0000000000000000
!	%l0 = 09f019ff, %l1 = 00000000, Mem[00000000100c1400] = 000000ff 00000065
	stda	%l0,[%i3+%g0]0x88	! Mem[00000000100c1400] = 09f019ff 00000000
!	%l6 = 0000000000000000, Mem[0000000010181400] = 00000000
	stwa	%l6,[%i6+%g0]0x88	! Mem[0000000010181400] = 00000000
!	Mem[00000000211c0001] = 00ff0480, %l7 = 0000000046ce0365
	ldstub	[%o2+0x001],%l7		! %l7 = 00000000000000ff

p0_label_92:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041402] = 4e000000, %l4 = 0000000000000063
	ldsh	[%i1+0x002],%l4		! %l4 = 0000000000000000
!	Mem[00000000211c0000] = 00ff0480, %l5 = 0000000000000000
	ldub	[%o2+%g0],%l5		! %l5 = 0000000000000000
!	Mem[0000000010101420] = 4f634468, %l1 = 0000000000000000
	lduw	[%i4+0x020],%l1		! %l1 = 000000004f634468
!	Mem[0000000010101410] = 6bb6bf79, %l0 = 0000000009f019ff
	lduba	[%i4+%o5]0x88,%l0	! %l0 = 0000000000000079
!	Mem[0000000030081410] = 35350865, %f31 = 000063ff
	lda	[%i2+%o5]0x89,%f31	! %f31 = 35350865
!	Mem[00000000100c1400] = ff19f009 00000000, %l6 = 00000000, %l7 = 000000ff
	ldda	[%i3+%g0]0x80,%l6	! %l6 = 00000000ff19f009 0000000000000000
!	Mem[0000000010181400] = 00000000, %l2 = 000000006b74384a
	ldswa	[%i6+%g0]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000010141420] = 4053695828818d09, %l3 = 0000000057000000, %asi = 80
	ldxa	[%i5+0x020]%asi,%l3	! %l3 = 4053695828818d09
!	Mem[00000000201c0000] = ffffddf0, %l7 = 0000000000000000, %asi = 80
	lduba	[%o0+0x000]%asi,%l7	! %l7 = 00000000000000ff
!	Mem[00000000100c1400] = ff19f009, %l1 = 000000004f634468
	lduwa	[%i3+%g0]0x80,%l1	! %l1 = 00000000ff19f009

p0_label_93:
!	Starting 10 instruction Store Burst
!	%l3 = 4053695828818d09, Mem[0000000010041410] = f1a9d73d
	stba	%l3,[%i1+%o5]0x80	! Mem[0000000010041410] = 09a9d73d
!	Mem[0000000030041400] = 4e000000, %l4 = 0000000000000000
	swapa	[%i1+%g0]0x89,%l4	! %l4 = 000000004e000000
!	Mem[0000000030081400] = 00000000 6f669975 f0524eff 692a78d7
!	%f16 = 61030000 ffffffff 6b74384a 23ca20f3
!	%f20 = 63d34422 ffb77618 00000000 28818d09
!	%f24 = 3c79441e 60000000 ffffffff 569fa50e
!	%f28 = 08ffffff 3c146e8d ff8927c3 35350865
	stda	%f16,[%i2+%g0]ASI_BLK_S	! Block Store to 0000000030081400
!	Mem[0000000010181410] = ff8927c3 000063ff, %l2 = 00000000, %l3 = 28818d09
	ldda	[%i6+%o5]0x80,%l2	! %l2 = 00000000ff8927c3 00000000000063ff
!	%f19 = 23ca20f3, Mem[0000000030041408] = 529be028
	sta	%f19,[%i1+%o4]0x89	! Mem[0000000030041408] = 23ca20f3
!	Mem[00000000211c0000] = 00ff0480, %l1 = 00000000ff19f009
	ldsh	[%o2+%g0],%l1		! %l1 = 00000000000000ff
!	Mem[00000000201c0000] = ffffddf0, %l3 = 00000000000063ff
	ldstub	[%o0+%g0],%l3		! %l3 = 00000000000000ff
!	%f20 = 63d34422, Mem[0000000030181408] = 00000000
	sta	%f20,[%i6+%o4]0x81	! Mem[0000000030181408] = 63d34422
!	Mem[00000000100c1408] = ffffffff, %l1 = 00000000000000ff
	ldstuba	[%i3+%o4]0x80,%l1	! %l1 = 00000000000000ff
!	%f8  = 6b74384a 658ffff9, Mem[0000000010001408] = ffffffff ffffff19
	stda	%f8 ,[%i0+%o4]0x80	! Mem[0000000010001408] = 6b74384a 658ffff9

p0_label_94:
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = 00000000, %l7 = 00000000000000ff
	ldsha	[%i1+%g0]0x81,%l7	! %l7 = 0000000000000000
!	Mem[000000001018141a] = 00000052, %l5 = 0000000000000000
	lduh	[%i6+0x01a],%l5		! %l5 = 0000000000000052
	membar	#Sync			! Added by membar checker (19)
!	Mem[0000000010081410] = 2244d3ff, %l7 = 0000000000000000
	ldsba	[%i2+%o5]0x88,%l7	! %l7 = ffffffffffffffff
!	Mem[00000000300c1408] = 8d6e143cf8206b24, %l0 = 0000000000000079
	ldxa	[%i3+%o4]0x89,%l0	! %l0 = 8d6e143cf8206b24
!	Mem[0000000030001400] = 430000ff, %l3 = 00000000000000ff
	lduba	[%i0+%g0]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[00000000100c1400] = 09f019ff, %l4 = 000000004e000000
	lduwa	[%i3+%g0]0x88,%l4	! %l4 = 0000000009f019ff
!	Mem[0000000030041410] = 6bb6bf79 ff000000, %l4 = 09f019ff, %l5 = 00000052
	ldda	[%i1+%o5]0x81,%l4	! %l4 = 000000006bb6bf79 00000000ff000000
!	Mem[0000000030001408] = 00000000, %l4 = 000000006bb6bf79
	ldsba	[%i0+%o4]0x89,%l4	! %l4 = 0000000000000000
!	Mem[00000000211c0000] = 00ff0480, %l2 = 00000000ff8927c3, %asi = 80
	ldsha	[%o2+0x000]%asi,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030081400] = 00000361, %l6 = 00000000ff19f009
	lduha	[%i2+%g0]0x89,%l6	! %l6 = 0000000000000361

p0_label_95:
!	Starting 10 instruction Store Burst
!	Mem[0000000010041400] = 0000004e, %l2 = 00000000000000ff
	swapa	[%i1+%g0]0x88,%l2	! %l2 = 000000000000004e
!	%l5 = 00000000ff000000, %l4 = 0000000000000000, %l5  = 00000000ff000000
	mulx	%l5,%l4,%l5		! %l5 = 0000000000000000
!	%l1 = 00000000000000ff, Mem[0000000030181400] = 4a38746b00000d1c
	stxa	%l1,[%i6+%g0]0x81	! Mem[0000000030181400] = 00000000000000ff
!	%f14 = 28e09b52 f0524eff, Mem[0000000030041400] = 00000000 11396151
	stda	%f14,[%i1+%g0]0x89	! Mem[0000000030041400] = 28e09b52 f0524eff
!	%f26 = ffffffff, Mem[0000000010081414] = 79bfb66b
	sta	%f26,[%i2+0x014]%asi	! Mem[0000000010081414] = ffffffff
!	%f0  = ff8927c3, Mem[0000000030181408] = 2244d363
	sta	%f0 ,[%i6+%o4]0x89	! Mem[0000000030181408] = ff8927c3
!	Mem[0000000010141400] = 00000000, %l0 = 8d6e143cf8206b24
	ldstuba	[%i5+%g0]0x80,%l0	! %l0 = 0000000000000000
!	%l3 = 00000000000000ff, Mem[0000000010101400] = 0000006000000000
	stxa	%l3,[%i4+%g0]0x88	! Mem[0000000010101400] = 00000000000000ff
!	Mem[0000000010081408] = 6b74384a, %l0 = 0000000000000000
	swapa	[%i2+%o4]0x80,%l0	! %l0 = 000000006b74384a
!	%f10 = 00000000, Mem[0000000010041408] = 00000000
	sta	%f10,[%i1+%o4]0x80	! Mem[0000000010041408] = 00000000

p0_label_96:
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = f0524eff, %l0 = 000000006b74384a
	lduba	[%i1+%g0]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030041408] = 23ca20f3, %l4 = 0000000000000000
	lduba	[%i1+%o4]0x89,%l4	! %l4 = 00000000000000f3
!	Mem[0000000030001410] = 40000000, %l5 = 0000000000000000
	ldswa	[%i0+%o5]0x89,%l5	! %l5 = 0000000040000000
!	Mem[0000000020800000] = ff11c420, %l0 = 00000000000000ff
	ldsh	[%o1+%g0],%l0		! %l0 = ffffffffffffff11
!	Mem[0000000010041410] = 09a9d73d, %l0 = ffffffffffffff11
	lduwa	[%i1+%o5]0x80,%l0	! %l0 = 0000000009a9d73d
!	Mem[0000000010041408] = 00000000, %l7 = ffffffffffffffff
	lduba	[%i1+%o4]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000010081408] = 0000000023ca20f3, %l3 = 00000000000000ff
	ldx	[%i2+%o4],%l3		! %l3 = 0000000023ca20f3
!	Mem[0000000010041400] = ff00000065000000, %l0 = 0000000009a9d73d, %asi = 80
	ldxa	[%i1+0x000]%asi,%l0	! %l0 = ff00000065000000
!	Mem[0000000020800000] = ff11c420, %l4 = 00000000000000f3, %asi = 80
	ldsha	[%o1+0x000]%asi,%l4	! %l4 = ffffffffffffff11
!	Mem[0000000010001400] = ffa6c783 05d200ff 6b74384a 658ffff9
!	Mem[0000000010001410] = 098d8128 586953ff 1ce1feff 448927c3
!	Mem[0000000010001420] = 000000ff 58b11659 004ef166 5a03941f
!	Mem[0000000010001430] = 24bb2454 74b74e95 6e43f332 73bcff3b
	ldda	[%i0+%g0]ASI_BLK_AIUP,%f0 	! Block Load from 0000000010001400

p0_label_97:
!	Starting 10 instruction Store Burst
!	Mem[0000000030141410] = ffffff89, %l4 = ffffffffffffff11
	ldstuba	[%i5+%o5]0x81,%l4	! %l4 = 00000000000000ff
!	%f12 = 24bb2454, Mem[0000000010041408] = 00000000
	sta	%f12,[%i1+%o4]0x88	! Mem[0000000010041408] = 24bb2454
!	Mem[00000000100c1410] = ff4e52f0, %l4 = 00000000000000ff
	ldstuba	[%i3+%o5]0x80,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010081408] = 00000000, %l0 = 0000000065000000
	swapa	[%i2+%o4]0x80,%l0	! %l0 = 0000000000000000
!	%f30 = ff8927c3, Mem[00000000300c1408] = 246b20f8
	sta	%f30,[%i3+%o4]0x81	! Mem[00000000300c1408] = ff8927c3
!	%f31 = 35350865, Mem[00000000100c1410] = ff4e52f0
	sta	%f31,[%i3+%o5]0x80	! Mem[00000000100c1410] = 35350865
!	%l1 = 00000000000000ff, Mem[0000000030181410] = ffff64ff
	stwa	%l1,[%i6+%o5]0x89	! Mem[0000000030181410] = 000000ff
!	%l7 = 0000000000000000, Mem[0000000010141410] = 00000009
	stwa	%l7,[%i5+%o5]0x80	! Mem[0000000010141410] = 00000000
!	Mem[0000000010001400] = 83c7a6ff, %l7 = 0000000000000000
	ldstuba	[%i0+%g0]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010141410] = 00000000, %l3 = 0000000023ca20f3
	ldstuba	[%i5+%o5]0x88,%l3	! %l3 = 0000000000000000

p0_label_98:
!	Starting 10 instruction Load Burst
!	%l7 = 00000000000000ff, imm = 00000000000003d3, %l1 = 00000000000000ff
	andn	%l7,0x3d3,%l1		! %l1 = 000000000000002c
!	Mem[00000000100c1430] = 39dbff74 00000064, %l2 = 0000004e, %l3 = 00000000, %asi = 80
	ldda	[%i3+0x030]%asi,%l2	! %l2 = 0000000039dbff74 0000000000000064
!	Mem[0000000030081400] = 00000361, %l0 = 0000000000000000
	lduha	[%i2+%g0]0x89,%l0	! %l0 = 0000000000000361
!	Mem[00000000300c1408] = c32789ff, %l7 = 00000000000000ff
	lduha	[%i3+%o4]0x89,%l7	! %l7 = 00000000000089ff
!	Mem[0000000010101410] = 79bfb66b000000ff, %f18 = 6b74384a 23ca20f3
	ldda	[%i4+%o5]0x80,%f18	! %f18 = 79bfb66b 000000ff
!	Mem[0000000030001400] = 430000ff, %f31 = 35350865
	lda	[%i0+%g0]0x89,%f31	! %f31 = 430000ff
!	Mem[0000000030101400] = 00000000, %f25 = 60000000
	lda	[%i4+%g0]0x81,%f25	! %f25 = 00000000
!	Mem[0000000010141412] = ff000000, %l0 = 0000000000000361, %asi = 80
	lduba	[%i5+0x012]%asi,%l0	! %l0 = 0000000000000000
!	Mem[00000000100c1408] = ffffffff, %f17 = ffffffff
	lda	[%i3+%o4]0x80,%f17	! %f17 = ffffffff
!	Mem[00000000100c1400] = ff19f009, %l5 = 0000000040000000
	lduw	[%i3+%g0],%l5		! %l5 = 00000000ff19f009

p0_label_99:
!	Starting 10 instruction Store Burst
!	%l3 = 0000000000000064, Mem[0000000010141408] = 0040000000000057
	stxa	%l3,[%i5+%o4]0x88	! Mem[0000000010141408] = 0000000000000064
!	%f27 = 569fa50e, Mem[000000001004143c] = f0524eff
	sta	%f27,[%i1+0x03c]%asi	! Mem[000000001004143c] = 569fa50e
!	Mem[00000000201c0001] = ffffddf0, %l1 = 000000000000002c
	ldstuba	[%o0+0x001]%asi,%l1	! %l1 = 00000000000000ff
!	%l7 = 00000000000089ff, Mem[00000000100c1410] = 3bebffff65083535
	stxa	%l7,[%i3+%o5]0x88	! Mem[00000000100c1410] = 00000000000089ff
!	Mem[000000001010143b] = 58695340, %l5 = 00000000ff19f009
	ldstuba	[%i4+0x03b]%asi,%l5	! %l5 = 0000000000000040
!	%f31 = 430000ff, Mem[0000000010181408] = 00ff1fff
	sta	%f31,[%i6+%o4]0x80	! Mem[0000000010181408] = 430000ff
!	Mem[0000000030041408] = f320ca23, %l7 = 00000000000089ff
	swapa	[%i1+%o4]0x81,%l7	! %l7 = 00000000f320ca23
!	%l4 = 00000000000000ff, Mem[0000000030081410] = 63d34422
	stha	%l4,[%i2+%o5]0x81	! Mem[0000000030081410] = 00ff4422
!	%l0 = 0000000000000000, Mem[0000000021800180] = ffffa7d0
	sth	%l0,[%o3+0x180]		! Mem[0000000021800180] = 0000a7d0
!	Mem[00000000100c143f] = 4def72db, %l3 = 0000000000000064
	ldstub	[%i3+0x03f],%l3		! %l3 = 00000000000000db

p0_label_100:
!	Starting 10 instruction Load Burst
!	Mem[0000000020800040] = 63572650, %l3 = 00000000000000db, %asi = 80
	ldsha	[%o1+0x040]%asi,%l3	! %l3 = 0000000000006357
!	Mem[0000000010041420] = ff000000, %l7 = 00000000f320ca23
	ldsw	[%i1+0x020],%l7		! %l7 = ffffffffff000000
!	Mem[0000000010141420] = 40536958 28818d09, %l6 = 00000361, %l7 = ff000000, %asi = 80
	ldda	[%i5+0x020]%asi,%l6	! %l6 = 0000000040536958 0000000028818d09
!	Mem[00000000100c1400] = 00000000 09f019ff, %l4 = 000000ff, %l5 = 00000040
	ldda	[%i3+%g0]0x88,%l4	! %l4 = 0000000009f019ff 0000000000000000
!	Mem[0000000010041408] = 6bb6bf7924bb2454, %f4  = 098d8128 586953ff
	ldda	[%i1+%o4]0x88,%f4 	! %f4  = 6bb6bf79 24bb2454
!	Mem[00000000100c1400] = ff19f009, %l3 = 0000000000006357
	lduba	[%i3+%g0]0x80,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030101410] = 586953ff, %l0 = 0000000000000000
	ldsba	[%i4+%o5]0x89,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010001438] = 6e43f332 73bcff3b, %l4 = 09f019ff, %l5 = 00000000, %asi = 80
	ldda	[%i0+0x038]%asi,%l4	! %l4 = 000000006e43f332 0000000073bcff3b
!	Mem[0000000030001410] = 00000040, %l3 = 00000000000000ff
	lduba	[%i0+%o5]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000030081410] = 1876b7ff 2244ff00, %l6 = 40536958, %l7 = 28818d09
	ldda	[%i2+%o5]0x89,%l6	! %l6 = 000000002244ff00 000000001876b7ff

p0_label_101:
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (20)
!	%l3 = 0000000000000000, Mem[0000000010001410] = 098d8128
	stha	%l3,[%i0+%o5]0x80	! Mem[0000000010001410] = 00008128
!	%l3 = 0000000000000000, Mem[0000000010001408] = 4a38746b
	stba	%l3,[%i0+%o4]0x88	! Mem[0000000010001408] = 4a387400
!	%l5 = 0000000073bcff3b, Mem[0000000030141408] = bf79b66b
	stwa	%l5,[%i5+%o4]0x81	! Mem[0000000030141408] = 73bcff3b
!	Mem[0000000030041400] = ff4e52f0, %l7 = 000000001876b7ff
	swapa	[%i1+%g0]0x81,%l7	! %l7 = 00000000ff4e52f0
!	Mem[0000000030141400] = a60000ff, %l0 = ffffffffffffffff
	ldstuba	[%i5+%g0]0x81,%l0	! %l0 = 00000000000000a6
!	Mem[00000000300c1408] = c32789ff, %l7 = 00000000ff4e52f0
	ldstuba	[%i3+%o4]0x89,%l7	! %l7 = 00000000000000ff
!	%l7 = 00000000000000ff, Mem[0000000030181408] = c32789ff
	stba	%l7,[%i6+%o4]0x81	! Mem[0000000030181408] = ff2789ff
!	%f4  = 6bb6bf79, Mem[0000000030181400] = 00000000
	sta	%f4 ,[%i6+%g0]0x81	! Mem[0000000030181400] = 6bb6bf79
!	Mem[0000000010041408] = 24bb2454, %l4 = 000000006e43f332
	ldstuba	[%i1+%o4]0x88,%l4	! %l4 = 0000000000000054
!	%l4 = 0000000000000054, Mem[00000000100c1408] = ffffffff
	stba	%l4,[%i3+%o4]0x80	! Mem[00000000100c1408] = 54ffffff

p0_label_102:
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = 00000361, %l7 = 00000000000000ff
	ldsba	[%i2+%g0]0x89,%l7	! %l7 = 0000000000000061
!	Mem[0000000010041400] = 000000ff, %f0  = ffa6c783
	lda	[%i1+%g0]0x88,%f0 	! %f0 = 000000ff
!	Mem[0000000010081415] = ffffffff, %l5 = 0000000073bcff3b, %asi = 80
	lduba	[%i2+0x015]%asi,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030181408] = ff8927ff, %f11 = 5a03941f
	lda	[%i6+%o4]0x89,%f11	! %f11 = ff8927ff
!	Mem[0000000030041408] = 000089ff4def72db, %l2 = 0000000039dbff74
	ldxa	[%i1+%o4]0x81,%l2	! %l2 = 000089ff4def72db
!	Mem[0000000030141408] = 73bcff3b7489e967, %f18 = 79bfb66b 000000ff
	ldda	[%i5+%o4]0x81,%f18	! %f18 = 73bcff3b 7489e967
!	Mem[0000000030181408] = ff2789ff 08e66057, %l4 = 00000054, %l5 = 000000ff
	ldda	[%i6+%o4]0x81,%l4	! %l4 = 00000000ff2789ff 0000000008e66057
!	Mem[0000000030081400] = ffffffff 00000361, %l4 = ff2789ff, %l5 = 08e66057
	ldda	[%i2+%g0]0x89,%l4	! %l4 = 0000000000000361 00000000ffffffff
!	Mem[0000000010041410] = 3dd7a909, %l2 = 000089ff4def72db
	ldsha	[%i1+%o5]0x88,%l2	! %l2 = ffffffffffffa909
!	Code Fragment 4, seed = 426841
p0_fragment_7:
!	%l0 = 00000000000000a6
	setx	0x0f40a6e62543065e,%g7,%l0 ! %l0 = 0f40a6e62543065e
!	%l1 = 00000000000000ff
	setx	0x759688e8a31a4509,%g7,%l1 ! %l1 = 759688e8a31a4509
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 0f40a6e62543065e
	setx	0x2b30db98f932dfc4,%g7,%l0 ! %l0 = 2b30db98f932dfc4
!	%l1 = 759688e8a31a4509
	setx	0xba34b6a5d40b598f,%g7,%l1 ! %l1 = ba34b6a5d40b598f
p0_fragment_7_end:

p0_label_103:
!	Starting 10 instruction Store Burst
!	%f26 = ffffffff, Mem[00000000300c1408] = c32789ff
	sta	%f26,[%i3+%o4]0x89	! Mem[00000000300c1408] = ffffffff
!	Mem[0000000030081410] = 2244ff00, %l4 = 0000000000000361
	ldsba	[%i2+%o5]0x89,%l4	! %l4 = 0000000000000000
!	%f14 = 6e43f332, Mem[0000000010181420] = ff00d205
	st	%f14,[%i6+0x020]	! Mem[0000000010181420] = 6e43f332
!	%l6 = 000000002244ff00, Mem[000000001014141c] = 23ca20f3
	stb	%l6,[%i5+0x01c]		! Mem[000000001014141c] = 00ca20f3
!	Mem[0000000010001410] = 28810000, %l4 = 0000000000000000
	swapa	[%i0+%o5]0x88,%l4	! %l4 = 0000000028810000
!	%f18 = 73bcff3b, Mem[000000001018140c] = 00000000
	sta	%f18,[%i6+0x00c]%asi	! Mem[000000001018140c] = 73bcff3b
!	%l0 = 2b30db98f932dfc4, Mem[0000000030041400] = 1876b7ff
	stha	%l0,[%i1+%g0]0x81	! Mem[0000000030041400] = dfc4b7ff
!	Mem[0000000010041400] = 000000ff, %l4 = 0000000028810000
	ldstuba	[%i1+%g0]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010001410] = 00000000, %l2 = 00000000ffffa909
	swapa	[%i0+%o5]0x80,%l2	! %l2 = 0000000000000000
!	%f10 = 004ef166 ff8927ff, Mem[00000000300c1400] = 00001cff 00000000
	stda	%f10,[%i3+%g0]0x89	! Mem[00000000300c1400] = 004ef166 ff8927ff

p0_label_104:
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = 5760e608 ff8927ff, %l2 = 00000000, %l3 = 00000000
	ldda	[%i6+%o4]0x89,%l2	! %l2 = 00000000ff8927ff 000000005760e608
!	%f3  = 658ffff9, %f3  = 658ffff9
	fcmps	%fcc2,%f3 ,%f3 		! %fcc2 = 0
!	Mem[0000000010181403] = 00000000, %l7 = 0000000000000061, %asi = 80
	lduba	[%i6+0x003]%asi,%l7	! %l7 = 0000000000000000
!	Mem[0000000010101436] = d44dff51, %l7 = 0000000000000000, %asi = 80
	lduha	[%i4+0x036]%asi,%l7	! %l7 = 000000000000ff51
!	Mem[00000000100c143c] = 4def72ff, %l6 = 000000002244ff00, %asi = 80
	lduba	[%i3+0x03c]%asi,%l6	! %l6 = 000000000000004d
!	Mem[0000000030141400] = ff0000ff, %l5 = 00000000ffffffff
	lduwa	[%i5+%g0]0x89,%l5	! %l5 = 00000000ff0000ff
!	Mem[0000000010181410] = c32789ff, %f10 = 004ef166
	lda	[%i6+%o5]0x88,%f10	! %f10 = c32789ff
!	Mem[00000000100c143c] = 4def72ff, %l5 = 00000000ff0000ff, %asi = 80
	ldswa	[%i3+0x03c]%asi,%l5	! %l5 = 000000004def72ff
!	Mem[0000000030181400] = 79bfb66b, %l4 = 00000000000000ff
	lduba	[%i6+%g0]0x89,%l4	! %l4 = 000000000000006b
!	Mem[0000000021800041] = 7e7734e0, %l3 = 000000005760e608, %asi = 80
	ldsba	[%o3+0x041]%asi,%l3	! %l3 = 0000000000000077

p0_label_105:
!	Starting 10 instruction Store Burst
!	Mem[0000000010141430] = 4f14b03f, %l1 = 00000000d40b598f
	swap	[%i5+0x030],%l1		! %l1 = 000000004f14b03f
!	%l7 = 000000000000ff51, Mem[00000000300c1408] = ffffffff
	stwa	%l7,[%i3+%o4]0x89	! Mem[00000000300c1408] = 0000ff51
!	%f14 = 6e43f332 73bcff3b, Mem[0000000010141400] = 000000ff 00000000
	stda	%f14,[%i5+%g0]0x88	! Mem[0000000010141400] = 6e43f332 73bcff3b
!	%f2  = 6b74384a, Mem[0000000010081410] = 2244d3ff
	sta	%f2 ,[%i2+%o5]0x88	! Mem[0000000010081410] = 6b74384a
!	%l0 = 2b30db98f932dfc4, Mem[0000000010101400] = ff000000
	stwa	%l0,[%i4+%g0]0x80	! Mem[0000000010101400] = f932dfc4
!	%l2 = 00000000ff8927ff, Mem[0000000010081400] = 000000ff
	stha	%l2,[%i2+%g0]0x88	! Mem[0000000010081400] = 000027ff
!	%l3 = 0000000000000077, %l3 = 0000000000000077, %l5  = 000000004def72ff
	mulx	%l3,%l3,%l5		! %l5 = 0000000000003751
!	Mem[0000000010001408] = 0074384a, %l7 = 000000000000ff51
	swapa	[%i0+%o4]0x80,%l7	! %l7 = 000000000074384a
!	%l7 = 000000000074384a, %l6 = 000000000000004d, %l4 = 000000000000006b
	sdivx	%l7,%l6,%l4		! %l4 = 0000000000018264
!	Mem[0000000030041408] = 000089ff, %l2 = 00000000ff8927ff
	ldstuba	[%i1+%o4]0x81,%l2	! %l2 = 0000000000000000

p0_label_106:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = ff00000065000000, %l6 = 000000000000004d
	ldx	[%i1+%g0],%l6		! %l6 = ff00000065000000
!	Mem[0000000010141408] = 0000000000000064, %f20 = 63d34422 ffb77618
	ldda	[%i5+%o4]0x88,%f20	! %f20 = 00000000 00000064
!	Mem[0000000030001410] = 00000040, %l0 = 2b30db98f932dfc4
	lduha	[%i0+%o5]0x81,%l0	! %l0 = 0000000000000000
!	%f2  = 6b74384a, %f20 = 00000000, %f9  = 58b11659
	fmuls	%f2 ,%f20,%f9 		! %f9  = 00000000
!	Mem[0000000010081420] = 098d8128, %l7 = 000000000074384a
	ldsh	[%i2+0x020],%l7		! %l7 = 000000000000098d
!	Mem[0000000010101428] = 757f8ee6, %l5 = 0000000000003751, %asi = 80
	ldswa	[%i4+0x028]%asi,%l5	! %l5 = 00000000757f8ee6
!	Mem[0000000010181408] = ff000043, %l4 = 0000000000018264
	ldswa	[%i6+%o4]0x88,%l4	! %l4 = ffffffffff000043
!	Mem[00000000100c1400] = ff19f009, %f22 = 00000000
	lda	[%i3+%g0]0x80,%f22	! %f22 = ff19f009
!	Mem[0000000030141408] = 3bffbc73, %l2 = 0000000000000000
	ldswa	[%i5+%o4]0x89,%l2	! %l2 = 000000003bffbc73
!	Mem[0000000010141408] = 64000000 00000000, %l2 = 3bffbc73, %l3 = 00000077, %asi = 80
	ldda	[%i5+0x008]%asi,%l2	! %l2 = 0000000064000000 0000000000000000

p0_label_107:
!	Starting 10 instruction Store Burst
!	%l2 = 0000000064000000, Mem[0000000030141410] = ffffff89
	stba	%l2,[%i5+%o5]0x81	! Mem[0000000030141410] = 00ffff89
!	Mem[0000000010101418] = abfee11c00000000, %l5 = 00000000757f8ee6, %l5 = 00000000757f8ee6
	add	%i4,0x18,%g1
	casxa	[%g1]0x80,%l5,%l5	! %l5 = abfee11c00000000
!	%l7 = 000000000000098d, Mem[0000000030101410] = ff536958
	stba	%l7,[%i4+%o5]0x81	! Mem[0000000030101410] = 8d536958
!	Mem[0000000021800101] = 1eff9f70, %l6 = ff00000065000000
	ldstuba	[%o3+0x101]%asi,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030041400] = dfc4b7ff, %l0 = 0000000000000000
	ldstuba	[%i1+%g0]0x81,%l0	! %l0 = 00000000000000df
!	%l6 = 00000000000000ff, Mem[000000001014141c] = 00ca20f3, %asi = 80
	stwa	%l6,[%i5+0x01c]%asi	! Mem[000000001014141c] = 000000ff
!	%f30 = ff8927c3, %f16 = 61030000 ffffffff
	fstod	%f30,%f16		! %f16 = fff924f8 60000000
!	%l3 = 0000000000000000, Mem[0000000010041408] = 6bb6bf7924bb24ff
	stxa	%l3,[%i1+%o4]0x88	! Mem[0000000010041408] = 0000000000000000
!	%f26 = ffffffff, Mem[0000000010101400] = f932dfc4
	sta	%f26,[%i4+%g0]0x80	! Mem[0000000010101400] = ffffffff
!	Mem[000000001014140f] = 00000000, %l5 = abfee11c00000000
	ldstuba	[%i5+0x00f]%asi,%l5	! %l5 = 0000000000000000

p0_label_108:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = 54ffffff00000000, %f4  = 6bb6bf79 24bb2454
	ldd	[%i3+%o4],%f4 		! %f4  = 54ffffff 00000000
!	Mem[0000000030141410] = 00ffff89, %l3 = 0000000000000000
	lduwa	[%i5+%o5]0x81,%l3	! %l3 = 0000000000ffff89
!	Mem[0000000030041400] = ffc4b7ff, %l4 = ffffffffff000043
	ldsba	[%i1+%g0]0x81,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010141410] = 000000ff, %f18 = 73bcff3b
	lda	[%i5+%o5]0x88,%f18	! %f18 = 000000ff
!	Mem[00000000300c1400] = 004ef166ff8927ff, %f22 = ff19f009 28818d09
	ldda	[%i3+%g0]0x89,%f22	! %f22 = 004ef166 ff8927ff
!	Mem[0000000030141400] = ff0000ff, %l5 = 0000000000000000
	ldsba	[%i5+%g0]0x89,%l5	! %l5 = ffffffffffffffff
!	%l0 = 00000000000000df, Mem[0000000030081400] = 61030000
	stha	%l0,[%i2+%g0]0x81	! Mem[0000000030081400] = 00df0000
!	Mem[00000000100c1410] = ff89000000000000, %l1 = 000000004f14b03f, %asi = 80
	ldxa	[%i3+0x010]%asi,%l1	! %l1 = ff89000000000000
!	Mem[0000000010081410] = 6b74384a, %l1 = ff89000000000000
	lduwa	[%i2+%o5]0x88,%l1	! %l1 = 000000006b74384a
!	Mem[0000000030101410] = 5869538d, %l4 = ffffffffffffffff
	lduha	[%i4+%o5]0x89,%l4	! %l4 = 000000000000538d

p0_label_109:
!	Starting 10 instruction Store Burst
!	%f16 = fff924f8, Mem[0000000030041400] = ffc4b7ff
	sta	%f16,[%i1+%g0]0x81	! Mem[0000000030041400] = fff924f8
!	Mem[0000000030101408] = 5c613911, %l4 = 000000000000538d
	swapa	[%i4+%o4]0x81,%l4	! %l4 = 000000005c613911
!	%l4 = 000000005c613911, Mem[00000000100c1408] = 54ffffff
	stba	%l4,[%i3+%o4]0x80	! Mem[00000000100c1408] = 11ffffff
!	Mem[0000000030081410] = 00ff4422, %l3 = 0000000000ffff89
	swapa	[%i2+%o5]0x81,%l3	! %l3 = 0000000000ff4422
!	Mem[00000000100c143c] = 4def72ff, %l5 = ffffffffffffffff
	ldstub	[%i3+0x03c],%l5		! %l5 = 000000000000004d
!	%l4 = 000000005c613911, %l7 = 000000000000098d, %l4 = 000000005c613911
	andn	%l4,%l7,%l4		! %l4 = 000000005c613010
!	Mem[0000000010041400] = 000000ff, %l1 = 000000006b74384a
	ldstuba	[%i1+%g0]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010041408] = 00000000, %l1 = 00000000000000ff
	swapa	[%i1+%o4]0x80,%l1	! %l1 = 0000000000000000
!	%l5 = 000000000000004d, Mem[000000001000141a] = 1ce1feff, %asi = 80
	stha	%l5,[%i0+0x01a]%asi	! Mem[0000000010001418] = 1ce1004d
!	%l4 = 000000005c613010, Mem[00000000300c1400] = ff2789ff66f14e00
	stxa	%l4,[%i3+%g0]0x81	! Mem[00000000300c1400] = 000000005c613010

p0_label_110:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = 51ff0000, %l3 = 0000000000ff4422
	lduha	[%i0+%o4]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000010141400] = 3bffbc73, %l2 = 0000000064000000
	ldswa	[%i5+%g0]0x80,%l2	! %l2 = 000000003bffbc73
!	Mem[0000000030141400] = ff0000ff, %l3 = 0000000000000000
	ldsha	[%i5+%g0]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030001410] = 40000000, %l5 = 000000000000004d
	ldswa	[%i0+%o5]0x89,%l5	! %l5 = 0000000040000000
!	%l1 = 0000000000000000, %l2 = 000000003bffbc73, %l4  = 000000005c613010
	mulx	%l1,%l2,%l4		! %l4 = 0000000000000000
!	Mem[0000000010001408] = 0000ff51, %l5 = 0000000040000000
	lduba	[%i0+%o4]0x80,%l5	! %l5 = 0000000000000000
!	Mem[000000001014141c] = 000000ff, %l4 = 0000000000000000
	ldsh	[%i5+0x01c],%l4		! %l4 = 0000000000000000
!	Mem[00000000100c1400] = 09f019ff, %l2 = 000000003bffbc73
	ldsha	[%i3+%g0]0x88,%l2	! %l2 = 00000000000019ff
!	Mem[0000000010101428] = 757f8ee671ef4b9f, %f10 = c32789ff ff8927ff, %asi = 80
	ldda	[%i4+0x028]%asi,%f10	! %f10 = 757f8ee6 71ef4b9f
	membar	#Sync			! Added by membar checker (21)
!	Mem[0000000030081400] = 00df0000 ffffffff 6b74384a 23ca20f3
!	Mem[0000000030081410] = 00ffff89 ffb77618 00000000 28818d09
!	Mem[0000000030081420] = 3c79441e 60000000 ffffffff 569fa50e
!	Mem[0000000030081430] = 08ffffff 3c146e8d ff8927c3 35350865
	ldda	[%i2+%g0]ASI_BLK_S,%f0 	! Block Load from 0000000030081400

p0_label_111:
!	Starting 10 instruction Store Burst
!	%l5 = 0000000000000000, Mem[0000000010081400] = ff270000
	stwa	%l5,[%i2+%g0]0x80	! Mem[0000000010081400] = 00000000
!	Mem[0000000010001434] = 74b74e95, %l7 = 000000000000098d, %asi = 80
	swapa	[%i0+0x034]%asi,%l7	! %l7 = 0000000074b74e95
!	Mem[0000000010001400] = ffa6c783, %l2 = 00000000000019ff
	swapa	[%i0+%g0]0x80,%l2	! %l2 = 00000000ffa6c783
!	%l7 = 0000000074b74e95, Mem[0000000030101400] = 00000000
	stba	%l7,[%i4+%g0]0x89	! Mem[0000000030101400] = 00000095
!	%l5 = 0000000000000000, Mem[00000000100c1430] = 39dbff7400000064
	stx	%l5,[%i3+0x030]		! Mem[00000000100c1430] = 0000000000000000
!	%f30 = ff8927c3 430000ff, Mem[0000000010141410] = ff000000 ffffffff
	std	%f30,[%i5+%o5]		! Mem[0000000010141410] = ff8927c3 430000ff
!	Mem[00000000300c1408] = 51ff0000, %l2 = 00000000ffa6c783
	swapa	[%i3+%o4]0x81,%l2	! %l2 = 0000000051ff0000
!	%l6 = 000000ff, %l7 = 74b74e95, Mem[00000000300c1408] = ffa6c783 3c146e8d
	stda	%l6,[%i3+%o4]0x81	! Mem[00000000300c1408] = 000000ff 74b74e95
!	Mem[0000000010181420] = 6e43f332, %l4 = 0000000000000000, %asi = 80
	swapa	[%i6+0x020]%asi,%l4	! %l4 = 000000006e43f332
!	%f2  = 6b74384a 23ca20f3, Mem[00000000300c1400] = 00000000 1030615c
	stda	%f2 ,[%i3+%g0]0x89	! Mem[00000000300c1400] = 6b74384a 23ca20f3

p0_label_112:
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = 73bcff3b, %l1 = 0000000000000000
	ldsba	[%i5+%o4]0x81,%l1	! %l1 = 0000000000000073
!	Mem[0000000030041408] = ff0089ff 4def72db, %l2 = 51ff0000, %l3 = 000000ff
	ldda	[%i1+%o4]0x81,%l2	! %l2 = 00000000ff0089ff 000000004def72db
!	Mem[0000000010041400] = ff000000 65000000, %l4 = 6e43f332, %l5 = 00000000
	ldda	[%i1+%g0]0x80,%l4	! %l4 = 00000000ff000000 0000000065000000
!	Mem[0000000010181410] = ff8927c3, %l1 = 0000000000000073
	lduha	[%i6+%o5]0x80,%l1	! %l1 = 000000000000ff89
!	Mem[0000000010101410] = 79bfb66b, %l4 = 00000000ff000000
	lduwa	[%i4+%o5]0x80,%l4	! %l4 = 0000000079bfb66b
!	Mem[0000000010181408] = 430000ff73bcff3b, %f24 = 3c79441e 00000000
	ldda	[%i6+%o4]0x80,%f24	! %f24 = 430000ff 73bcff3b
!	Mem[0000000010081420] = 098d812858695340, %f28 = 08ffffff 3c146e8d
	ldd	[%i2+0x020],%f28	! %f28 = 098d8128 58695340
!	Mem[0000000030081410] = 89ffff00, %l2 = 00000000ff0089ff
	ldswa	[%i2+%o5]0x89,%l2	! %l2 = ffffffff89ffff00
!	Mem[0000000010101400] = ffffffff, %l4 = 0000000079bfb66b
	ldsba	[%i4+%g0]0x80,%l4	! %l4 = ffffffffffffffff
!	Mem[00000000201c0000] = ffffddf0, %l4 = ffffffffffffffff
	ldub	[%o0+%g0],%l4		! %l4 = 00000000000000ff

p0_label_113:
!	Starting 10 instruction Store Burst
!	Mem[0000000030041400] = f824f9ff, %l0 = 00000000000000df
	ldstuba	[%i1+%g0]0x89,%l0	! %l0 = 00000000000000ff
!	%l1 = 000000000000ff89, Mem[0000000010001420] = 000000ff58b11659
	stx	%l1,[%i0+0x020]		! Mem[0000000010001420] = 000000000000ff89
!	Mem[0000000010041408] = 000000ff, %l4 = 00000000000000ff
	swapa	[%i1+%o4]0x80,%l4	! %l4 = 00000000000000ff
!	%l1 = 000000000000ff89, Mem[0000000010041408] = 00000000ff000000
	stxa	%l1,[%i1+%o4]0x88	! Mem[0000000010041408] = 000000000000ff89
!	%f20 = 00000000 00000064, Mem[0000000010081408] = 65000000 23ca20f3
	stda	%f20,[%i2+%o4]0x80	! Mem[0000000010081408] = 00000000 00000064
!	%l3 = 000000004def72db, Mem[00000000300c1400] = f320ca234a38746b
	stxa	%l3,[%i3+%g0]0x81	! Mem[00000000300c1400] = 000000004def72db
!	Mem[00000000100c1408] = 11ffffff, %l5 = 0000000065000000
	swapa	[%i3+%o4]0x80,%l5	! %l5 = 0000000011ffffff
!	Mem[000000001014141e] = 000000ff, %l0 = 00000000000000ff
	ldstub	[%i5+0x01e],%l0		! %l0 = 0000000000000000
!	Mem[0000000010181410] = ff8927c3, %l3 = 4def72db, %l7 = 74b74e95
	add	%i6,0x10,%g1
	casa	[%g1]0x80,%l3,%l7	! %l7 = 00000000ff8927c3
!	%l2 = ffffffff89ffff00, Mem[0000000010181410] = c32789ff
	stba	%l2,[%i6+%o5]0x88	! Mem[0000000010181410] = c3278900

p0_label_114:
!	Starting 10 instruction Load Burst
!	%l3 = 000000004def72db, Mem[0000000020800001] = ff11c420
	stb	%l3,[%o1+0x001]		! Mem[0000000020800000] = ffdbc420
!	Mem[0000000010141408] = 64000000, %l1 = 000000000000ff89
	ldsba	[%i5+%o4]0x80,%l1	! %l1 = 0000000000000064
!	Mem[0000000030181400] = 6bb6bf79000000ff, %l3 = 000000004def72db
	ldxa	[%i6+%g0]0x81,%l3	! %l3 = 6bb6bf79000000ff
!	Mem[0000000030081400] = ffffffff0000df00, %l0 = 0000000000000000
	ldxa	[%i2+%g0]0x89,%l0	! %l0 = ffffffff0000df00
!	Mem[0000000020800041] = 63572650, %l3 = 6bb6bf79000000ff
	ldub	[%o1+0x041],%l3		! %l3 = 0000000000000057
!	Mem[00000000100c1400] = 09f019ff, %l5 = 0000000011ffffff
	ldsha	[%i3+%g0]0x88,%l5	! %l5 = 00000000000019ff
!	Mem[0000000010101400] = ffffffff, %f8  = 3c79441e
	lda	[%i4+%g0]0x88,%f8 	! %f8 = ffffffff
!	Mem[0000000010181400] = 0000000000000000, %f8  = ffffffff 60000000
	ldd	[%i6+%g0],%f8 		! %f8  = 00000000 00000000
!	Mem[0000000030101400] = 00000095, %l1 = 0000000000000064
	lduba	[%i4+%g0]0x89,%l1	! %l1 = 0000000000000095
!	Mem[0000000010001400] = 000019ff, %l0 = ffffffff0000df00
	lduwa	[%i0+%g0]0x80,%l0	! %l0 = 00000000000019ff

p0_label_115:
!	Starting 10 instruction Store Burst
!	%f0  = 00df0000 ffffffff, Mem[0000000010001410] = ffffa909 586953ff
	stda	%f0 ,[%i0+%o5]0x80	! Mem[0000000010001410] = 00df0000 ffffffff
!	%l6 = 000000ff, %l7 = ff8927c3, Mem[00000000300c1400] = 00000000 4def72db
	stda	%l6,[%i3+%g0]0x81	! Mem[00000000300c1400] = 000000ff ff8927c3
!	Mem[0000000030101400] = 95000000, %l5 = 00000000000019ff
	swapa	[%i4+%g0]0x81,%l5	! %l5 = 0000000095000000
!	%l6 = 00000000000000ff, Mem[0000000030001410] = 40000000
	stwa	%l6,[%i0+%o5]0x89	! Mem[0000000030001410] = 000000ff
!	Mem[0000000010101407] = 00000000, %l7 = 00000000ff8927c3
	ldstub	[%i4+0x007],%l7		! %l7 = 0000000000000000
!	%f28 = 098d8128 58695340, %l1 = 0000000000000095
!	Mem[0000000010041418] = 659bd17a0459d763
	add	%i1,0x018,%g1
	stda	%f28,[%g1+%l1]ASI_PST16_PL ! Mem[0000000010041418] = 4053d17a2881d763
!	%f10 = ffffffff 569fa50e, %l0 = 00000000000019ff
!	Mem[0000000010181420] = 00000000c8f8ca33
	add	%i6,0x020,%g1
	stda	%f10,[%g1+%l0]ASI_PST8_P ! Mem[0000000010181420] = ffffffff569fa50e
!	Mem[0000000010141438] = 63d34422, %l4 = 000000ff, %l5 = 95000000
	add	%i5,0x38,%g1
	casa	[%g1]0x80,%l4,%l5	! %l5 = 0000000063d34422
!	Mem[0000000030141400] = ff0000ff, %l0 = 00000000000019ff
	ldstuba	[%i5+%g0]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[00000000211c0000] = 00ff0480, %l0 = 00000000000000ff
	ldstuba	[%o2+0x000]%asi,%l0	! %l0 = 0000000000000000

p0_label_116:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = ff000043c32789ff, %l7 = 0000000000000000
	ldxa	[%i5+%o5]0x88,%l7	! %l7 = ff000043c32789ff
!	Mem[0000000010081400] = 00000000ffffffff, %l1 = 0000000000000095
	ldxa	[%i2+%g0]0x80,%l1	! %l1 = 00000000ffffffff
!	Mem[00000000300c1400] = ff000000, %l2 = ffffffff89ffff00
	ldsba	[%i3+%g0]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000010041400] = ff00000065000000, %l1 = 00000000ffffffff
	ldxa	[%i1+%g0]0x80,%l1	! %l1 = ff00000065000000
!	Mem[0000000030141400] = ff0000ff, %l0 = 0000000000000000
	lduwa	[%i5+%g0]0x89,%l0	! %l0 = 00000000ff0000ff
!	%l7 = ff000043c32789ff, immd = fffffffffffff985, %l108 = 0000000000000002
	sdivx	%l7,-0x67b,%l2		! %l2 = 00002780cecfd4dd
!	Mem[0000000010181400] = 00000000, %l7 = ff000043c32789ff
	ldswa	[%i6+%g0]0x80,%l7	! %l7 = 0000000000000000
!	%f8  = 00000000, %f9  = 00000000
	fcmps	%fcc1,%f8 ,%f9 		! %fcc1 = 0
!	Mem[0000000030001400] = ff000043 00000000, %l2 = cecfd4dd, %l3 = 00000057
	ldda	[%i0+%g0]0x81,%l2	! %l2 = 00000000ff000043 0000000000000000
!	Mem[0000000010001426] = 0000ff89, %l3 = 0000000000000000
	ldsh	[%i0+0x026],%l3		! %l3 = ffffffffffffff89

p0_label_117:
!	Starting 10 instruction Store Burst
!	%l2 = ff000043, %l3 = ffffff89, Mem[0000000010101408] = ab0e0000 51613911
	stda	%l2,[%i4+%o4]0x88	! Mem[0000000010101408] = ff000043 ffffff89
!	Mem[0000000030041410] = 79bfb66b, %l2 = 00000000ff000043
	swapa	[%i1+%o5]0x89,%l2	! %l2 = 0000000079bfb66b
!	%l4 = 00000000000000ff, imm = 0000000000000d69, %l2 = 0000000079bfb66b
	xnor	%l4,0xd69,%l2		! %l2 = fffffffffffff269
!	Mem[0000000030101408] = 0000538d, %l5 = 0000000063d34422
	ldstuba	[%i4+%o4]0x81,%l5	! %l5 = 0000000000000000
!	%l5 = 0000000000000000, Mem[0000000010101400] = ffffffff
	stba	%l5,[%i4+%g0]0x88	! Mem[0000000010101400] = ffffff00
!	Mem[00000000100c140a] = 65000000, %l7 = 0000000000000000
	ldstub	[%i3+0x00a],%l7		! %l7 = 0000000000000000
!	Mem[0000000030101410] = 5869538d, %l4 = 00000000000000ff
	swapa	[%i4+%o5]0x89,%l4	! %l4 = 000000005869538d
!	%l6 = 00000000000000ff, Mem[0000000030041410] = 430000ffff000000
	stxa	%l6,[%i1+%o5]0x81	! Mem[0000000030041410] = 00000000000000ff
!	%l0 = ff0000ff, %l1 = 65000000, Mem[0000000010181438] = 63d34422 79bfb66b, %asi = 80
	stda	%l0,[%i6+0x038]%asi	! Mem[0000000010181438] = ff0000ff 65000000
!	%f12 = 08ffffff, Mem[0000000010001408] = 0000ff51
	sta	%f12,[%i0+%o4]0x80	! Mem[0000000010001408] = 08ffffff

p0_label_118:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = 00000065 000000ff, %l2 = fffff269, %l3 = ffffff89
	ldda	[%i1+%g0]0x88,%l2	! %l2 = 00000000000000ff 0000000000000065
!	Mem[00000000201c0000] = ffffddf0, %l0 = 00000000ff0000ff, %asi = 80
	ldsba	[%o0+0x000]%asi,%l0	! %l0 = ffffffffffffffff
	membar	#Sync			! Added by membar checker (22)
!	Mem[0000000010101400] = 00ffffff 000000ff 430000ff 89ffffff
!	Mem[0000000010101410] = 79bfb66b 000000ff abfee11c 00000000
!	Mem[0000000010101420] = 4f634468 3d350000 757f8ee6 71ef4b9f
!	Mem[0000000010101430] = 51ff4dd4 d44dff51 586953ff 00000000
	ldda	[%i4+%g0]ASI_BLK_P,%f0 	! Block Load from 0000000010101400
!	Mem[00000000300c1408] = 000000ff, %l0 = ffffffffffffffff
	ldsba	[%i3+%o4]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000010101410] = 6bb6bf79, %l6 = 00000000000000ff
	lduwa	[%i4+%o5]0x88,%l6	! %l6 = 000000006bb6bf79
!	Mem[0000000030081410] = 89ffff00, %l2 = 00000000000000ff
	lduha	[%i2+%o5]0x89,%l2	! %l2 = 000000000000ff00
!	Mem[0000000010141400] = 73bcff3b, %l6 = 000000006bb6bf79
	ldsha	[%i5+%g0]0x88,%l6	! %l6 = ffffffffffffff3b
!	Mem[0000000030141410] = 89ffff00, %l3 = 0000000000000065
	lduwa	[%i5+%o5]0x89,%l3	! %l3 = 0000000089ffff00
!	Mem[0000000010141400] = 3bffbc73, %l2 = 000000000000ff00
	lduwa	[%i5+%g0]0x80,%l2	! %l2 = 000000003bffbc73
!	Mem[0000000010181400] = 0000000000000000, %l1 = ff00000065000000, %asi = 80
	ldxa	[%i6+0x000]%asi,%l1	! %l1 = 0000000000000000

p0_label_119:
!	Starting 10 instruction Store Burst
!	%f6  = abfee11c 00000000, Mem[0000000010001408] = 08ffffff 658ffff9
	stda	%f6 ,[%i0+%o4]0x80	! Mem[0000000010001408] = abfee11c 00000000
!	%f4  = 79bfb66b 000000ff, %l1 = 0000000000000000
!	Mem[0000000030101408] = ff00538d000063cb
	add	%i4,0x008,%g1
	stda	%f4,[%g1+%l1]ASI_PST32_SL ! Mem[0000000030101408] = ff00538d000063cb
!	%l7 = 0000000000000000, Mem[0000000010081400] = 00000000
	stwa	%l7,[%i2+%g0]0x88	! Mem[0000000010081400] = 00000000
!	%f3  = 89ffffff, Mem[0000000010181408] = ff000043
	sta	%f3 ,[%i6+%o4]0x88	! Mem[0000000010181408] = 89ffffff
!	%f18 = 000000ff 7489e967, Mem[0000000030081400] = 0000df00 ffffffff
	stda	%f18,[%i2+%g0]0x89	! Mem[0000000030081400] = 000000ff 7489e967
!	%l4 = 5869538d, %l5 = 00000000, Mem[0000000010081408] = 00000000 00000064
	stda	%l4,[%i2+%o4]0x80	! Mem[0000000010081408] = 5869538d 00000000
!	Mem[0000000010141400] = 3bffbc7332f3436e, %l5 = 0000000000000000, %l6 = ffffffffffffff3b
	casxa	[%i5]0x80,%l5,%l6	! %l6 = 3bffbc7332f3436e
!	Mem[0000000030101410] = 000000ff, %l2 = 000000003bffbc73
	swapa	[%i4+%o5]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[000000001010140f] = 89ffffff, %l3 = 0000000089ffff00
	ldstub	[%i4+0x00f],%l3		! %l3 = 00000000000000ff
!	%l3 = 00000000000000ff, Mem[0000000020800040] = 63572650
	stb	%l3,[%o1+0x040]		! Mem[0000000020800040] = ff572650

p0_label_120:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = ff89000000000000, %f26 = ffffffff 569fa50e
	ldda	[%i3+%o5]0x80,%f26	! %f26 = ff890000 00000000
!	Mem[0000000030101410] = 3bffbc73, %l3 = 00000000000000ff
	lduwa	[%i4+%o5]0x89,%l3	! %l3 = 000000003bffbc73
!	Mem[0000000030101408] = ff00538d, %l3 = 000000003bffbc73
	lduba	[%i4+%o4]0x81,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010001410] = ffffffff 0000df00, %l2 = 000000ff, %l3 = 000000ff
	ldda	[%i0+%o5]0x88,%l2	! %l2 = 000000000000df00 00000000ffffffff
!	Mem[0000000010081410] = 4a38746b, %l2 = 000000000000df00
	ldsba	[%i2+%o5]0x80,%l2	! %l2 = 000000000000004a
!	Mem[0000000030101400] = 000019ff, %l6 = 3bffbc7332f3436e
	lduba	[%i4+%g0]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000010101408] = 430000ff, %l3 = 00000000ffffffff
	ldsha	[%i4+%o4]0x80,%l3	! %l3 = 0000000000004300
!	Mem[0000000010041400] = ff00000065000000, %f26 = ff890000 00000000
	ldda	[%i1+%g0]0x80,%f26	! %f26 = ff000000 65000000
!	Mem[0000000030181410] = ff000000, %l7 = 0000000000000000
	lduha	[%i6+%o5]0x81,%l7	! %l7 = 000000000000ff00
!	Mem[0000000010001408] = abfee11c, %l1 = 0000000000000000
	ldsba	[%i0+%o4]0x80,%l1	! %l1 = ffffffffffffffab

p0_label_121:
!	Starting 10 instruction Store Burst
!	%l6 = 00000000, %l7 = 0000ff00, Mem[0000000030141400] = ff0000ff f1a9d73d
	stda	%l6,[%i5+%g0]0x89	! Mem[0000000030141400] = 00000000 0000ff00
!	%f24 = 430000ff 73bcff3b, %l6 = 0000000000000000
!	Mem[00000000100c1430] = 0000000000000000
	add	%i3,0x030,%g1
	stda	%f24,[%g1+%l6]ASI_PST8_P ! Mem[00000000100c1430] = 0000000000000000
	membar	#Sync			! Added by membar checker (23)
!	%l3 = 0000000000004300, Mem[000000001010142b] = 757f8ee6
	stb	%l3,[%i4+0x02b]		! Mem[0000000010101428] = 757f8e00
!	%f6  = abfee11c, Mem[0000000010001410] = 0000df00
	sta	%f6 ,[%i0+%o5]0x88	! Mem[0000000010001410] = abfee11c
!	Mem[0000000010081420] = 098d8128, %l0 = 0000000000000000, %asi = 80
	swapa	[%i2+0x020]%asi,%l0	! %l0 = 00000000098d8128
!	Mem[0000000030141408] = 73bcff3b, %l5 = 0000000000000000
	swapa	[%i5+%o4]0x81,%l5	! %l5 = 0000000073bcff3b
!	%l1 = ffffffffffffffab, Mem[0000000010141410] = ff8927c3
	stba	%l1,[%i5+%o5]0x80	! Mem[0000000010141410] = ab8927c3
!	Mem[00000000100c1400] = 09f019ff, %l0 = 00000000098d8128
	ldstuba	[%i3+%g0]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030101400] = 000019ff 1876b711 ff00538d 000063cb
!	%f0  = 00ffffff 000000ff 430000ff 89ffffff
!	%f4  = 79bfb66b 000000ff abfee11c 00000000
!	%f8  = 4f634468 3d350000 757f8ee6 71ef4b9f
!	%f12 = 51ff4dd4 d44dff51 586953ff 00000000
	stda	%f0 ,[%i4+%g0]ASI_BLK_S	! Block Store to 0000000030101400
!	%l0 = 00000000000000ff, Mem[0000000030001400] = ff00004300000000
	stxa	%l0,[%i0+%g0]0x81	! Mem[0000000030001400] = 00000000000000ff

p0_label_122:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = 00000000, %f22 = 004ef166
	lda	[%i6+%g0]0x88,%f22	! %f22 = 00000000
!	Mem[0000000010081438] = 6bb6bf79, %l2 = 000000000000004a, %asi = 80
	lduwa	[%i2+0x038]%asi,%l2	! %l2 = 000000006bb6bf79
!	Mem[00000000201c0000] = ffffddf0, %l1 = ffffffffffffffab, %asi = 80
	ldsba	[%o0+0x000]%asi,%l1	! %l1 = ffffffffffffffff
!	Mem[000000001000141b] = 1ce1004d, %l4 = 000000005869538d, %asi = 80
	lduba	[%i0+0x01b]%asi,%l4	! %l4 = 000000000000004d
	membar	#Sync			! Added by membar checker (24)
!	Mem[0000000010101410] = 6bb6bf79, %f16 = fff924f8
	lda	[%i4+%o5]0x88,%f16	! %f16 = 6bb6bf79
!	Mem[0000000030001410] = 000000ff, %l4 = 000000000000004d
	lduba	[%i0+%o5]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010101408] = 430000ff, %l2 = 000000006bb6bf79
	lduba	[%i4+%o4]0x80,%l2	! %l2 = 0000000000000043
!	%f5  = 000000ff, %f10 = 757f8ee6
	fsqrts	%f5 ,%f10		! tt=0x22, %l0 = 0000000000000121
!	Mem[0000000010181400] = 00000000, %l6 = 0000000000000000
	lduwa	[%i6+%g0]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000010181418] = 000000520e79351d, %l1 = ffffffffffffffff
	ldx	[%i6+0x018],%l1		! %l1 = 000000520e79351d

p0_label_123:
!	Starting 10 instruction Store Burst
!	Mem[000000001008142c] = 0000a50e, %l3 = 0000000000004300, %asi = 80
	swapa	[%i2+0x02c]%asi,%l3	! %l3 = 000000000000a50e
!	%f25 = 73bcff3b, Mem[0000000010101418] = abfee11c
	st	%f25,[%i4+0x018]	! Mem[0000000010101418] = 73bcff3b
!	%l3 = 000000000000a50e, Mem[0000000010001400] = ff190000
	stha	%l3,[%i0+%g0]0x88	! Mem[0000000010001400] = ff19a50e
!	Mem[0000000010181400] = 00000000, %l7 = 000000000000ff00
	swapa	[%i6+%g0]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000010101400] = 00ffffff, %l5 = 0000000073bcff3b
	ldstuba	[%i4+%g0]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000010181410] = 008927c3, %l5 = 0000000000000000
	swapa	[%i6+%o5]0x80,%l5	! %l5 = 00000000008927c3
!	%f5  = 000000ff, Mem[0000000030041400] = f824f9ff
	sta	%f5 ,[%i1+%g0]0x89	! Mem[0000000030041400] = 000000ff
!	%l3 = 000000000000a50e, Mem[0000000030101408] = ff000043
	stwa	%l3,[%i4+%o4]0x89	! Mem[0000000030101408] = 0000a50e
!	%f4  = 79bfb66b 000000ff, Mem[00000000300c1410] = db72ef4d 529be028
	stda	%f4 ,[%i3+%o5]0x81	! Mem[00000000300c1410] = 79bfb66b 000000ff
!	Mem[0000000010081408] = 8d536958, %l7 = 0000000000000000
	ldstuba	[%i2+%o4]0x88,%l7	! %l7 = 0000000000000058

p0_label_124:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = ff00000000000064, %l2 = 0000000000000043
	ldxa	[%i5+%o4]0x88,%l2	! %l2 = ff00000000000064
!	Mem[0000000030041400] = ff000000, %l4 = 00000000000000ff
	ldsba	[%i1+%g0]0x81,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000030001408] = 00000000, %l0 = 0000000000000121
	lduwa	[%i0+%o4]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000030081400] = 7489e967, %l7 = 0000000000000058
	lduha	[%i2+%g0]0x89,%l7	! %l7 = 000000000000e967
!	Mem[0000000030041410] = ff00000000000000, %l7 = 000000000000e967
	ldxa	[%i1+%o5]0x89,%l7	! %l7 = ff00000000000000
!	Mem[00000000100c1408] = 6500ff0000000000, %f4  = 79bfb66b 000000ff
	ldda	[%i3+%o4]0x80,%f4 	! %f4  = 6500ff00 00000000
!	Mem[000000001004141e] = 2881d763, %l1 = 000000520e79351d, %asi = 80
	lduha	[%i1+0x01e]%asi,%l1	! %l1 = 000000000000d763
!	Mem[0000000010001429] = 004ef166, %l6 = 0000000000000000, %asi = 80
	ldsba	[%i0+0x029]%asi,%l6	! %l6 = 000000000000004e
!	Mem[0000000010081400] = 00000000, %l5 = 00000000008927c3
	lduha	[%i2+%g0]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000010001424] = 0000ff89, %l5 = 0000000000000000, %asi = 80
	ldswa	[%i0+0x024]%asi,%l5	! %l5 = 000000000000ff89

p0_label_125:
!	Starting 10 instruction Store Burst
!	%l4 = ffffffffffffffff, Mem[0000000010041400] = ff000000
	stba	%l4,[%i1+%g0]0x80	! Mem[0000000010041400] = ff000000
!	Mem[00000000300c1408] = ff000000, %l3 = 000000000000a50e
	ldstuba	[%i3+%o4]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000010081400] = 00000000, %l4 = 00000000ffffffff
	swapa	[%i2+%g0]0x88,%l4	! %l4 = 0000000000000000
!	%l6 = 0000004e, %l7 = 00000000, Mem[0000000010141410] = c32789ab ff000043
	stda	%l6,[%i5+%o5]0x88	! Mem[0000000010141410] = 0000004e 00000000
!	Mem[0000000030001410] = 000000ff, %l1 = 000000000000d763
	swapa	[%i0+%o5]0x89,%l1	! %l1 = 00000000000000ff
!	%f30 = ff8927c3, Mem[0000000010001414] = ffffffff
	st	%f30,[%i0+0x014]	! Mem[0000000010001414] = ff8927c3
!	%f28 = 098d8128 58695340, Mem[00000000300c1410] = 6bb6bf79 ff000000
	stda	%f28,[%i3+%o5]0x89	! Mem[00000000300c1410] = 098d8128 58695340
!	%l4 = 0000000000000000, Mem[00000000211c0000] = ffff0480
	sth	%l4,[%o2+%g0]		! Mem[00000000211c0000] = 00000480
!	%l2 = ff00000000000064, Mem[00000000100c1422] = 5c97ff08, %asi = 80
	stha	%l2,[%i3+0x022]%asi	! Mem[00000000100c1420] = 5c970064
!	%f24 = 430000ff, Mem[00000000100c1400] = ff19f009
	sta	%f24,[%i3+%g0]0x80	! Mem[00000000100c1400] = 430000ff

p0_label_126:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = 4e000000, %l5 = 000000000000ff89
	ldsw	[%i5+%o5],%l5		! %l5 = 000000004e000000
!	Mem[0000000030181410] = ff000000, %l2 = ff00000000000064
	lduha	[%i6+%o5]0x81,%l2	! %l2 = 000000000000ff00
!	Mem[0000000010141400] = 73bcff3b, %l5 = 000000004e000000
	ldsba	[%i5+%g0]0x88,%l5	! %l5 = 000000000000003b
!	Mem[0000000030101400] = ff000000ffffff00, %f26 = ff000000 65000000
	ldda	[%i4+%g0]0x89,%f26	! %f26 = ff000000 ffffff00
!	Mem[0000000010141408] = 64000000, %f13 = d44dff51
	lda	[%i5+%o4]0x80,%f13	! %f13 = 64000000
!	Mem[0000000010101408] = 430000ff, %l6 = 000000000000004e
	lduba	[%i4+%o4]0x80,%l6	! %l6 = 0000000000000043
!	Mem[0000000010081408] = ff69538d00000000, %f2  = 430000ff 89ffffff
	ldda	[%i2+%o4]0x80,%f2 	! %f2  = ff69538d 00000000
!	Mem[0000000010141400] = 73bcff3b, %l6 = 0000000000000043
	lduba	[%i5+%g0]0x88,%l6	! %l6 = 000000000000003b
!	Mem[00000000300c1400] = 000000ff, %l6 = 000000000000003b
	ldswa	[%i3+%g0]0x81,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010141438] = 63d3442279bfb66b, %f24 = 430000ff 73bcff3b
	ldd	[%i5+0x038],%f24	! %f24 = 63d34422 79bfb66b

p0_label_127:
!	Starting 10 instruction Store Burst
!	%l3 = 0000000000000000, Mem[0000000030181410] = 000000ff
	stha	%l3,[%i6+%o5]0x89	! Mem[0000000030181410] = 00000000
!	%f4  = 6500ff00 00000000, Mem[00000000300c1400] = ff000000 c32789ff
	stda	%f4 ,[%i3+%g0]0x89	! Mem[00000000300c1400] = 6500ff00 00000000
!	Mem[00000000300c1408] = ff0000ff, %l2 = 000000000000ff00
	swapa	[%i3+%o4]0x89,%l2	! %l2 = 00000000ff0000ff
!	Mem[000000001008143b] = 6bb6bf79, %l7 = ff00000000000000
	ldstub	[%i2+0x03b],%l7		! %l7 = 0000000000000079
!	%l1 = 00000000000000ff, %l1 = 00000000000000ff, %l1 = 00000000000000ff
	sdivx	%l1,%l1,%l1		! %l1 = 0000000000000001
!	Mem[0000000010101434] = d44dff51, %l2 = 00000000ff0000ff
	ldstuba	[%i4+0x034]%asi,%l2	! %l2 = 00000000000000d4
!	%f4  = 6500ff00, Mem[0000000010081410] = 4a38746b
	sta	%f4 ,[%i2+%o5]0x80	! Mem[0000000010081410] = 6500ff00
!	%f10 = 757f8ee6 71ef4b9f, %l0 = 0000000000000000
!	Mem[0000000010141410] = 4e00000000000000
	add	%i5,0x010,%g1
	stda	%f10,[%g1+%l0]ASI_PST32_P ! Mem[0000000010141410] = 4e00000000000000
!	%l5 = 000000000000003b, Mem[0000000030001408] = 00000000
	stba	%l5,[%i0+%o4]0x89	! Mem[0000000030001408] = 0000003b
!	%f2  = ff69538d 00000000, %l5 = 000000000000003b
!	Mem[00000000100c1428] = 3b7abf864196d5bf
	add	%i3,0x028,%g1
	stda	%f2,[%g1+%l5]ASI_PST16_PL ! Mem[00000000100c1428] = 00000000419669ff

p0_label_128:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = abfee11c, %l6 = 00000000000000ff
	lduba	[%i0+%o4]0x80,%l6	! %l6 = 00000000000000ab
!	Mem[0000000010181410] = 00000000, %f26 = ff000000
	lda	[%i6+%o5]0x80,%f26	! %f26 = 00000000
!	Mem[0000000030181408] = ff2789ff, %l1 = 0000000000000001
	lduha	[%i6+%o4]0x81,%l1	! %l1 = 000000000000ff27
!	Mem[00000000100c1408] = 6500ff00 00000000, %l4 = 00000000, %l5 = 0000003b
	ldd	[%i3+%o4],%l4		! %l4 = 000000006500ff00 0000000000000000
!	Mem[0000000030041400] = ff000000, %l7 = 0000000000000079
	lduwa	[%i1+%g0]0x81,%l7	! %l7 = 00000000ff000000
!	Mem[0000000030141408] = 00000000, %l5 = 0000000000000000
	lduha	[%i5+%o4]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000010181428] = 7f71ff4346ce0365, %f20 = 00000000 00000064
	ldd	[%i6+0x028],%f20	! %f20 = 7f71ff43 46ce0365
!	Mem[0000000010041400] = ff000000, %l5 = 0000000000000000
	lduba	[%i1+%g0]0x80,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030041400] = 000000ff, %l6 = 00000000000000ab
	lduha	[%i1+%g0]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010181400] = 00ff0000 00000000, %l2 = 000000d4, %l3 = 00000000
	ldda	[%i6+%g0]0x80,%l2	! %l2 = 0000000000ff0000 0000000000000000

p0_label_129:
!	Starting 10 instruction Store Burst
!	%l3 = 0000000000000000, Mem[0000000010081408] = ff69538d
	stba	%l3,[%i2+%o4]0x80	! Mem[0000000010081408] = 0069538d
!	%f30 = ff8927c3, Mem[00000000300c1410] = 40536958
	sta	%f30,[%i3+%o5]0x81	! Mem[00000000300c1410] = ff8927c3
!	%f6  = abfee11c 00000000, %l3 = 0000000000000000
!	Mem[0000000030101438] = 586953ff00000000
	add	%i4,0x038,%g1
	stda	%f6,[%g1+%l3]ASI_PST8_S ! Mem[0000000030101438] = 586953ff00000000
!	Mem[000000001000141e] = 448927c3, %l2 = 0000000000ff0000
	ldstuba	[%i0+0x01e]%asi,%l2	! %l2 = 0000000000000027
!	Mem[00000000300c1410] = ff8927c3, %l2 = 0000000000000027
	swapa	[%i3+%o5]0x81,%l2	! %l2 = 00000000ff8927c3
!	%f3  = 00000000, Mem[0000000030181408] = ff8927ff
	sta	%f3 ,[%i6+%o4]0x89	! Mem[0000000030181408] = 00000000
!	Mem[0000000010041408] = 0000ff89, %l1 = 000000000000ff27
	ldstuba	[%i1+%o4]0x88,%l1	! %l1 = 0000000000000089
!	%f22 = 00000000 ff8927ff, Mem[00000000300c1410] = 00000027 28818d09
	stda	%f22,[%i3+%o5]0x81	! Mem[00000000300c1410] = 00000000 ff8927ff
!	%f20 = 7f71ff43 46ce0365, %l7 = 00000000ff000000
!	Mem[0000000030001430] = 6d8917843a93b705
	add	%i0,0x030,%g1
	stda	%f20,[%g1+%l7]ASI_PST8_SL ! Mem[0000000030001430] = 6d8917843a93b705
!	%f24 = 63d34422 79bfb66b, %l3 = 0000000000000000
!	Mem[0000000010041428] = 000000001876b711
	add	%i1,0x028,%g1
	stda	%f24,[%g1+%l3]ASI_PST16_P ! Mem[0000000010041428] = 000000001876b711

p0_label_130:
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = 0000d763, %l5 = 00000000000000ff
	ldsha	[%i0+%o5]0x89,%l5	! %l5 = ffffffffffffd763
!	Mem[0000000030041400] = 28e09b52000000ff, %f30 = ff8927c3 430000ff
	ldda	[%i1+%g0]0x89,%f30	! %f30 = 28e09b52 000000ff
!	Mem[0000000010141408] = 00000064, %l2 = 00000000ff8927c3
	ldsba	[%i5+%o4]0x88,%l2	! %l2 = 0000000000000064
!	Mem[000000001008142e] = 00004300, %l0 = 0000000000000000, %asi = 80
	ldsha	[%i2+0x02e]%asi,%l0	! %l0 = 0000000000004300
!	Mem[00000000211c0000] = 00000480, %l3 = 0000000000000000
	ldub	[%o2+%g0],%l3		! %l3 = 0000000000000000
!	Mem[0000000010141438] = 63d34422, %l1 = 0000000000000089, %asi = 80
	ldswa	[%i5+0x038]%asi,%l1	! %l1 = 0000000063d34422
!	%l3 = 0000000000000000, immd = 0000043c, %y  = ffffffff
	umul	%l3,0x43c,%l3		! %l3 = 0000000000000000, %y = 00000000
!	Mem[0000000010041414] = 40536958, %l4 = 000000006500ff00
	lduw	[%i1+0x014],%l4		! %l4 = 0000000040536958
!	Mem[0000000030181408] = 0000000008e66057, %l2 = 0000000000000064
	ldxa	[%i6+%o4]0x81,%l2	! %l2 = 0000000008e66057
!	Mem[0000000010001400] = ff19a50e, %l5 = ffffffffffffd763
	lduha	[%i0+%g0]0x88,%l5	! %l5 = 000000000000a50e

p0_label_131:
!	Starting 10 instruction Store Burst
!	%l4 = 0000000040536958, Mem[000000001010143c] = 00000000, %asi = 80
	stha	%l4,[%i4+0x03c]%asi	! Mem[000000001010143c] = 69580000
!	%l3 = 0000000000000000, Mem[0000000030081410] = 89ffff00
	stwa	%l3,[%i2+%o5]0x89	! Mem[0000000030081410] = 00000000
!	%l4 = 0000000040536958, Mem[0000000010081408] = 8d536900
	stba	%l4,[%i2+%o4]0x88	! Mem[0000000010081408] = 8d536958
!	%l6 = 00000000000000ff, Mem[0000000020800000] = ffdbc420
	stb	%l6,[%o1+%g0]		! Mem[0000000020800000] = ffdbc420
!	%f29 = 58695340, Mem[00000000300c1400] = 00000000
	sta	%f29,[%i3+%g0]0x89	! Mem[00000000300c1400] = 58695340
!	%l0 = 0000000000004300, Mem[0000000010141400] = 73bcff3b
	stba	%l0,[%i5+%g0]0x88	! Mem[0000000010141400] = 73bcff00
!	%f0  = 00ffffff 000000ff, %l2 = 0000000008e66057
!	Mem[0000000010101428] = 757f8e0071ef4b9f
	add	%i4,0x028,%g1
	stda	%f0,[%g1+%l2]ASI_PST16_PL ! Mem[0000000010101428] = ff000000ffff4b9f
!	%f26 = 00000000 ffffff00, %l1 = 0000000063d34422
!	Mem[0000000010001400] = 0ea519ff05d200ff
	stda	%f26,[%i0+%l1]ASI_PST16_P ! Mem[0000000010001400] = 0ea519ffffff00ff
!	Mem[00000000201c0001] = ffffddf0, %l2 = 0000000008e66057
	ldstuba	[%o0+0x001]%asi,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010141410] = 0000004e, %l2 = 00000000000000ff
	swapa	[%i5+%o5]0x88,%l2	! %l2 = 000000000000004e

p0_label_132:
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = 58695340, %l2 = 000000000000004e
	lduha	[%i3+%g0]0x89,%l2	! %l2 = 0000000000005340
!	Mem[0000000010141410] = ff000000, %l6 = 00000000000000ff
	ldswa	[%i5+%o5]0x80,%l6	! %l6 = ffffffffff000000
!	Mem[0000000010041400] = ff000000, %l5 = 000000000000a50e, %asi = 80
	lduwa	[%i1+0x000]%asi,%l5	! %l5 = 00000000ff000000
!	Mem[0000000010141400] = 00ffbc73, %l6 = ffffffffff000000
	lduha	[%i5+%g0]0x80,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010001410] = abfee11c, %l7 = 00000000ff000000
	lduba	[%i0+%o5]0x88,%l7	! %l7 = 000000000000001c
!	Mem[0000000030001400] = 00000000, %l2 = 0000000000005340
	ldswa	[%i0+%g0]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000030101410] = ff0000006bb6bf79, %f2  = ff69538d 00000000
	ldda	[%i4+%o5]0x89,%f2 	! %f2  = ff000000 6bb6bf79
!	Mem[0000000010101408] = ff000043, %l3 = 0000000000000000
	lduba	[%i4+%o4]0x88,%l3	! %l3 = 0000000000000043
!	Mem[0000000030101408] = 0000a50e, %l7 = 000000000000001c
	ldsha	[%i4+%o4]0x89,%l7	! %l7 = ffffffffffffa50e
!	%l5 = 00000000ff000000, %l1 = 0000000063d34422, %l2 = 0000000000000000
	xnor	%l5,%l1,%l2		! %l2 = ffffffff632cbbdd

p0_label_133:
!	Starting 10 instruction Store Burst
!	Mem[0000000010141410] = 000000ff, %l3 = 0000000000000043
	ldstuba	[%i5+%o5]0x88,%l3	! %l3 = 00000000000000ff
!	Code Fragment 3, seed = 909139
p0_fragment_8:
!	%l0 = 0000000000004300
	setx	0xd8016edb53c7408e,%g7,%l0 ! %l0 = d8016edb53c7408e
!	%l1 = 0000000063d34422
	setx	0x8813d95c0a992839,%g7,%l1 ! %l1 = 8813d95c0a992839
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = d8016edb53c7408e
	setx	0x7bccd364dca01bf4,%g7,%l0 ! %l0 = 7bccd364dca01bf4
!	%l1 = 8813d95c0a992839
	setx	0x5143fd02d1cb9ebf,%g7,%l1 ! %l1 = 5143fd02d1cb9ebf
p0_fragment_8_end:
!	Mem[0000000030141400] = 00000000, %l7 = 00000000ffffa50e
	swapa	[%i5+%g0]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000030001408] = 0000003b, %l0 = 00000000dca01bf4
	swapa	[%i0+%o4]0x89,%l0	! %l0 = 000000000000003b
!	%l0 = 000000000000003b, Mem[0000000010181408] = 3bffbc7389ffffff
	stxa	%l0,[%i6+%o4]0x88	! Mem[0000000010181408] = 000000000000003b
!	%l3 = 00000000000000ff, Mem[0000000010001408] = 1ce1feab
	stba	%l3,[%i0+%o4]0x88	! Mem[0000000010001408] = 1ce1feff
!	%f28 = 098d8128 58695340, Mem[0000000010081408] = 5869538d 00000000
	stda	%f28,[%i2+%o4]0x80	! Mem[0000000010081408] = 098d8128 58695340
!	%l5 = 00000000ff000000, imm = fffffffffffff9b2, %l2 = ffffffff632cbbdd
	sub	%l5,-0x64e,%l2		! %l2 = 00000000ff00064e
!	%l4 = 0000000040536958, Mem[0000000030001408] = f41ba0dc
	stwa	%l4,[%i0+%o4]0x81	! Mem[0000000030001408] = 40536958
!	%l1 = 5143fd02d1cb9ebf, Mem[0000000010041409] = ffff0000, %asi = 80
	stba	%l1,[%i1+0x009]%asi	! Mem[0000000010041408] = ffbf0000

p0_label_134:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = 73bcff00, %l4 = 0000000040536958
	lduwa	[%i5+%g0]0x88,%l4	! %l4 = 0000000073bcff00
!	Mem[0000000030081408] = 4a38746b, %l1 = 5143fd02d1cb9ebf
	lduba	[%i2+%o4]0x89,%l1	! %l1 = 000000000000006b
!	Mem[0000000010001400] = ff19a50e, %l2 = 00000000ff00064e
	lduwa	[%i0+%g0]0x88,%l2	! %l2 = 00000000ff19a50e
!	Mem[00000000100c1410] = ff890000, %l5 = 00000000ff000000
	ldsha	[%i3+%o5]0x80,%l5	! %l5 = ffffffffffffff89
!	Mem[0000000030101410] = 79bfb66b 000000ff, %l4 = 73bcff00, %l5 = ffffff89
	ldda	[%i4+%o5]0x81,%l4	! %l4 = 0000000079bfb66b 00000000000000ff
!	Mem[0000000010001408] = fffee11c, %l7 = 0000000000000000
	ldswa	[%i0+%o4]0x80,%l7	! %l7 = fffffffffffee11c
!	Mem[0000000030081410] = 00000000ffb77618, %f12 = 51ff4dd4 64000000
	ldda	[%i2+%o5]0x81,%f12	! %f12 = 00000000 ffb77618
!	Mem[0000000010181420] = ffffffff569fa50e, %l5 = 00000000000000ff, %asi = 80
	ldxa	[%i6+0x020]%asi,%l5	! %l5 = ffffffff569fa50e
!	Mem[0000000010041408] = ffbf000000000000, %f14 = 586953ff 00000000
	ldd	[%i1+%o4],%f14		! %f14 = ffbf0000 00000000
!	Mem[0000000010001400] = 0ea519ffffff00ff, %l0 = 000000000000003b
	ldxa	[%i0+%g0]0x80,%l0	! %l0 = 0ea519ffffff00ff

p0_label_135:
!	Starting 10 instruction Store Burst
!	%l3 = 00000000000000ff, Mem[00000000201c0001] = ffffddf0, %asi = 80
	stba	%l3,[%o0+0x001]%asi	! Mem[00000000201c0000] = ffffddf0
!	%f12 = 00000000, Mem[00000000100c1410] = 000089ff
	sta	%f12,[%i3+%o5]0x88	! Mem[00000000100c1410] = 00000000
!	%l4 = 0000000079bfb66b, Mem[0000000010081400] = ffffffff
	stha	%l4,[%i2+%g0]0x80	! Mem[0000000010081400] = b66bffff
!	%f22 = 00000000, Mem[0000000010041408] = 0000bfff
	sta	%f22,[%i1+%o4]0x88	! Mem[0000000010041408] = 00000000
!	%l0 = 0ea519ffffff00ff, Mem[0000000010001402] = 0ea519ff
	sth	%l0,[%i0+0x002]		! Mem[0000000010001400] = 0ea500ff
!	Mem[0000000030141410] = 00ffff89, %l2 = 00000000ff19a50e
	swapa	[%i5+%o5]0x81,%l2	! %l2 = 0000000000ffff89
!	Mem[0000000010001420] = 00000000, %l0 = 0ea519ffffff00ff
	ldstub	[%i0+0x020],%l0		! %l0 = 0000000000000000
!	%l4 = 79bfb66b, %l5 = 569fa50e, Mem[0000000010041400] = 000000ff 00000065
	stda	%l4,[%i1+%g0]0x88	! Mem[0000000010041400] = 79bfb66b 569fa50e
!	Mem[0000000010001414] = ff8927c3, %l4 = 0000000079bfb66b
	swap	[%i0+0x014],%l4		! %l4 = 00000000ff8927c3
!	%f20 = 7f71ff43 46ce0365, Mem[0000000010181428] = 7f71ff43 46ce0365, %asi = 80
	stda	%f20,[%i6+0x028]%asi	! Mem[0000000010181428] = 7f71ff43 46ce0365

p0_label_136:
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = ff000000, %l7 = fffffffffffee11c
	ldsha	[%i1+%g0]0x81,%l7	! %l7 = ffffffffffffff00
!	%l4 = 00000000ff8927c3, %l6 = 00000000000000ff, %l3 = 00000000000000ff
	sdivx	%l4,%l6,%l3		! %l3 = 00000000010089b1
!	Mem[0000000010181410] = 00000000, %l6 = 00000000000000ff
	ldswa	[%i6+%o5]0x80,%l6	! %l6 = 0000000000000000
!	Mem[00000000300c1400] = 58695340, %l4 = 00000000ff8927c3
	ldsba	[%i3+%g0]0x89,%l4	! %l4 = 0000000000000040
!	Mem[0000000010081400] = ffff6bb6, %l4 = 0000000000000040
	ldsha	[%i2+%g0]0x88,%l4	! %l4 = 0000000000006bb6
!	Mem[0000000010181400] = 0000ff00, %l4 = 0000000000006bb6
	ldsba	[%i6+%g0]0x88,%l4	! %l4 = 0000000000000000
!	Mem[00000000300c1400] = 40536958 00ff0065, %l0 = 00000000, %l1 = 0000006b
	ldda	[%i3+%g0]0x81,%l0	! %l0 = 0000000040536958 0000000000ff0065
!	Mem[0000000010041408] = 00000000, %f7  = 00000000
	lda	[%i1+%o4]0x80,%f7 	! %f7 = 00000000
!	Mem[0000000010001414] = 79bfb66b, %l6 = 0000000000000000
	lduw	[%i0+0x014],%l6		! %l6 = 0000000079bfb66b
	membar	#Sync			! Added by membar checker (25)
!	Mem[0000000010141400] = 00ffbc73 32f3436e 64000000 000000ff
!	Mem[0000000010141410] = ff000000 00000000 6b74384a 0000ffff
!	Mem[0000000010141420] = 40536958 28818d09 0ea59f56 3fb0144f
!	Mem[0000000010141430] = d40b598f ffffff08 63d34422 79bfb66b
	ldda	[%i5+%g0]ASI_BLK_P,%f16	! Block Load from 0000000010141400

p0_label_137:
!	Starting 10 instruction Store Burst
!	%l6 = 0000000079bfb66b, immd = fffffdc0, %y  = 00000000
	udiv	%l6,-0x240,%l7		! %l7 = 0000000000000000
	mov	%l0,%y			! %y = 40536958
!	%f18 = 64000000 000000ff, Mem[0000000010181438] = ff0000ff 65000000
	std	%f18,[%i6+0x038]	! Mem[0000000010181438] = 64000000 000000ff
!	%l4 = 0000000000000000, Mem[00000000100c1410] = 00000000
	stba	%l4,[%i3+%o5]0x88	! Mem[00000000100c1410] = 00000000
!	%l4 = 0000000000000000, Mem[0000000021800080] = 00ff8710
	sth	%l4,[%o3+0x080]		! Mem[0000000021800080] = 00008710
!	%f12 = 00000000, %f5  = 00000000, %f11 = 71ef4b9f
	fmuls	%f12,%f5 ,%f11		! %f11 = 00000000
!	%l1 = 0000000000ff0065, imm = fffffffffffff987, %l1 = 0000000000ff0065
	sub	%l1,-0x679,%l1		! %l1 = 0000000000ff06de
!	%f15 = 00000000, Mem[0000000030041410] = 00000000
	sta	%f15,[%i1+%o5]0x81	! Mem[0000000030041410] = 00000000
!	%l6 = 0000000079bfb66b, Mem[00000000300c1408] = 0000ff00
	stha	%l6,[%i3+%o4]0x89	! Mem[00000000300c1408] = 0000b66b
!	%l6 = 0000000079bfb66b, Mem[0000000020800000] = ffdbc420
	sth	%l6,[%o1+%g0]		! Mem[0000000020800000] = b66bc420
!	Mem[000000001014141d] = 0000ffff, %l6 = 0000000079bfb66b
	ldstub	[%i5+0x01d],%l6		! %l6 = 0000000000000000

p0_label_138:
!	Starting 10 instruction Load Burst
!	Mem[0000000021800140] = 7a2565a0, %l3 = 00000000010089b1, %asi = 80
	ldsha	[%o3+0x140]%asi,%l3	! %l3 = 0000000000007a25
!	Mem[0000000010081424] = 58695340, %l3 = 0000000000007a25, %asi = 80
	lduba	[%i2+0x024]%asi,%l3	! %l3 = 0000000000000058
!	Mem[0000000010081408] = 098d8128, %f6  = abfee11c
	lda	[%i2+0x008]%asi,%f6 	! %f6 = 098d8128
!	Mem[0000000010001438] = 6e43f332 73bcff3b, %l4 = 00000000, %l5 = 569fa50e
	ldd	[%i0+0x038],%l4		! %l4 = 000000006e43f332 0000000073bcff3b
!	Mem[0000000010001400] = ff00a50e, %l5 = 0000000073bcff3b
	lduwa	[%i0+%g0]0x88,%l5	! %l5 = 00000000ff00a50e
!	Mem[0000000010181400] = 0000ff00, %f2  = ff000000
	lda	[%i6+%g0]0x88,%f2 	! %f2 = 0000ff00
!	Mem[0000000010141408] = 64000000, %f8  = 4f634468
	lda	[%i5+%o4]0x80,%f8 	! %f8 = 64000000
!	Mem[0000000030181410] = 273e35ff 00000000, %l6 = 00000000, %l7 = 00000000
	ldda	[%i6+%o5]0x89,%l6	! %l6 = 0000000000000000 00000000273e35ff
!	Mem[0000000010181408] = 0000003b, %l1 = 0000000000ff06de
	lduwa	[%i6+%o4]0x88,%l1	! %l1 = 000000000000003b
!	Mem[00000000300c1408] = 0000b66b, %l2 = 0000000000ffff89
	ldsha	[%i3+%o4]0x89,%l2	! %l2 = ffffffffffffb66b

p0_label_139:
!	Starting 10 instruction Store Burst
!	%l2 = ffffffffffffb66b, Mem[0000000010041410] = 3dd7a909
	stwa	%l2,[%i1+%o5]0x88	! Mem[0000000010041410] = ffffb66b
!	%l7 = 00000000273e35ff, Mem[0000000030081408] = f320ca234a38746b
	stxa	%l7,[%i2+%o4]0x89	! Mem[0000000030081408] = 00000000273e35ff
!	%l1 = 000000000000003b, Mem[0000000010041428] = 000000001876b711, %asi = 80
	stxa	%l1,[%i1+0x028]%asi	! Mem[0000000010041428] = 000000000000003b
!	%l0 = 0000000040536958, Mem[00000000100c1434] = 00000000, %asi = 80
	stba	%l0,[%i3+0x034]%asi	! Mem[00000000100c1434] = 58000000
!	%l0 = 0000000040536958, Mem[0000000030001400] = 00000000
	stba	%l0,[%i0+%g0]0x89	! Mem[0000000030001400] = 00000058
!	Mem[00000000100c1408] = 6500ff00, %l3 = 0000000000000058
	swapa	[%i3+%o4]0x80,%l3	! %l3 = 000000006500ff00
!	Mem[0000000010081430] = ffffffff, %l7 = 00000000273e35ff, %asi = 80
	swapa	[%i2+0x030]%asi,%l7	! %l7 = 00000000ffffffff
!	Mem[000000001004143f] = 569fa50e, %l3 = 000000006500ff00
	ldstuba	[%i1+0x03f]%asi,%l3	! %l3 = 000000000000000e
!	Mem[0000000010101408] = ff000043, %l4 = 000000006e43f332
	swapa	[%i4+%o4]0x88,%l4	! %l4 = 00000000ff000043
!	Mem[0000000030141400] = ffffa50e, %l6 = 0000000000000000
	ldstuba	[%i5+%g0]0x89,%l6	! %l6 = 000000000000000e

p0_label_140:
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = ff8900ff, %f3  = 6bb6bf79
	lda	[%i1+%o4]0x89,%f3 	! %f3 = ff8900ff
!	Mem[00000000300c1400] = 58695340, %l1 = 000000000000003b
	ldsba	[%i3+%g0]0x89,%l1	! %l1 = 0000000000000040
!	Mem[0000000030041408] = db72ef4d ff8900ff, %l2 = ffffb66b, %l3 = 0000000e
	ldda	[%i1+%o4]0x89,%l2	! %l2 = 00000000ff8900ff 00000000db72ef4d
!	Mem[0000000030181400] = 79bfb66b, %l0 = 0000000040536958
	lduba	[%i6+%g0]0x89,%l0	! %l0 = 000000000000006b
!	Mem[000000001014140c] = 000000ff, %l7 = 00000000ffffffff, %asi = 80
	ldswa	[%i5+0x00c]%asi,%l7	! %l7 = 00000000000000ff
!	Mem[00000000201c0001] = ffffddf0, %l3 = 00000000db72ef4d
	ldsb	[%o0+0x001],%l3		! %l3 = ffffffffffffffff
!	Mem[0000000021800180] = 0000a7d0, %l2 = 00000000ff8900ff
	ldub	[%o3+0x180],%l2		! %l2 = 0000000000000000
!	Mem[0000000010041414] = 40536958, %f0  = 00ffffff
	ld	[%i1+0x014],%f0 	! %f0 = 40536958
!	Mem[0000000030141410] = 0ea519ff, %l1 = 0000000000000040
	lduba	[%i5+%o5]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010101400] = ff000000ffffffff, %l0 = 000000000000006b
	ldxa	[%i4+%g0]0x88,%l0	! %l0 = ff000000ffffffff

p0_label_141:
!	Starting 10 instruction Store Burst
!	%l1 = 00000000000000ff, Mem[0000000010101408] = 32f3436e
	stwa	%l1,[%i4+%o4]0x80	! Mem[0000000010101408] = 000000ff
!	%l5 = 00000000ff00a50e, Mem[0000000030041408] = ff8900ff
	stba	%l5,[%i1+%o4]0x89	! Mem[0000000030041408] = ff89000e
!	%f30 = 63d34422 79bfb66b, %l2 = 0000000000000000
!	Mem[0000000030001408] = 405369584806a517
	add	%i0,0x008,%g1
	stda	%f30,[%g1+%l2]ASI_PST8_SL ! Mem[0000000030001408] = 405369584806a517
!	%l5 = 00000000ff00a50e, Mem[0000000030081410] = 00000000
	stba	%l5,[%i2+%o5]0x89	! Mem[0000000030081410] = 0000000e
!	%f18 = 64000000 000000ff, Mem[0000000010001400] = 0ea500ff ffff00ff
	std	%f18,[%i0+%g0]		! Mem[0000000010001400] = 64000000 000000ff
!	%l4 = ff000043, %l5 = ff00a50e, Mem[0000000030141400] = ffffa5ff 0000ff00
	stda	%l4,[%i5+%g0]0x89	! Mem[0000000030141400] = ff000043 ff00a50e
!	Mem[0000000010181400] = 0000ff00, %l3 = ffffffffffffffff
	ldstuba	[%i6+%g0]0x88,%l3	! %l3 = 0000000000000000
!	%f4  = 6500ff00, %f1  = 000000ff
	fstoi	%f4 ,%f1 		! %f1  = 7fffffff
!	Mem[0000000010141400] = 73bcff00, %l4 = 00000000ff000043
	ldstuba	[%i5+%g0]0x88,%l4	! %l4 = 0000000000000000
!	%l4 = 0000000000000000, Mem[0000000010041400] = 79bfb66b
	stwa	%l4,[%i1+%g0]0x88	! Mem[0000000010041400] = 00000000

p0_label_142:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = 00000064, %l3 = 0000000000000000
	ldsha	[%i0+%g0]0x88,%l3	! %l3 = 0000000000000064
!	Mem[00000000100c141d] = 0459d763, %l7 = 00000000000000ff, %asi = 80
	ldsba	[%i3+0x01d]%asi,%l7	! %l7 = 0000000000000059
!	Mem[0000000010001411] = 1ce1feab, %l2 = 0000000000000000
	ldsb	[%i0+0x011],%l2		! %l2 = ffffffffffffffe1
!	Mem[00000000100c1408] = 0000000058000000, %f4  = 6500ff00 00000000
	ldda	[%i3+%o4]0x88,%f4 	! %f4  = 00000000 58000000
!	Mem[0000000030141400] = ff000043, %l1 = 00000000000000ff
	ldsba	[%i5+%g0]0x89,%l1	! %l1 = 0000000000000043
!	Mem[0000000030041408] = 0e0089ff, %l0 = ff000000ffffffff
	ldsba	[%i1+%o4]0x81,%l0	! %l0 = 000000000000000e
!	Mem[0000000030141408] = 000000007489e967, %f22 = 6b74384a 0000ffff
	ldda	[%i5+%o4]0x81,%f22	! %f22 = 00000000 7489e967
!	Mem[00000000201c0000] = ffffddf0, %l1 = 0000000000000043
	ldsh	[%o0+%g0],%l1		! %l1 = ffffffffffffffff
!	Mem[0000000030101408] = 0000a50e, %l0 = 000000000000000e
	ldsha	[%i4+%o4]0x89,%l0	! %l0 = ffffffffffffa50e
!	Mem[0000000010101400] = ff000000ffffffff, %l0 = ffffffffffffa50e
	ldxa	[%i4+%g0]0x88,%l0	! %l0 = ff000000ffffffff

p0_label_143:
!	Starting 10 instruction Store Burst
!	Mem[0000000030101408] = 0ea50000, %l4 = 0000000000000000
	ldstuba	[%i4+%o4]0x81,%l4	! %l4 = 000000000000000e
!	%l0 = ffffffff, %l1 = ffffffff, Mem[0000000030141410] = 0ea519ff 00000361
	stda	%l0,[%i5+%o5]0x89	! Mem[0000000030141410] = ffffffff ffffffff
!	Mem[0000000030141408] = 00000000, %l2 = 00000000ffffffe1
	swapa	[%i5+%o4]0x89,%l2	! %l2 = 0000000000000000
!	%l0 = ff000000ffffffff, Mem[0000000030001408] = 40536958
	stwa	%l0,[%i0+%o4]0x81	! Mem[0000000030001408] = ffffffff
!	%f30 = 63d34422 79bfb66b, %l4 = 000000000000000e
!	Mem[0000000030081428] = ffffffff569fa50e
	add	%i2,0x028,%g1
	stda	%f30,[%g1+%l4]ASI_PST8_S ! Mem[0000000030081428] = ffffffff79bfb60e
!	%l3 = 0000000000000064, Mem[0000000020800000] = b66bc420
	sth	%l3,[%o1+%g0]		! Mem[0000000020800000] = 0064c420
!	%f24 = 40536958 28818d09, Mem[0000000010101400] = ffffffff 000000ff
	stda	%f24,[%i4+%g0]0x80	! Mem[0000000010101400] = 40536958 28818d09
!	Mem[0000000010081404] = ffffffff, %l4 = 0000000e, %l0 = ffffffff
	add	%i2,0x04,%g1
	casa	[%g1]0x80,%l4,%l0	! %l0 = 00000000ffffffff
!	%l4 = 000000000000000e, Mem[0000000030001408] = ffffffff
	stwa	%l4,[%i0+%o4]0x89	! Mem[0000000030001408] = 0000000e
!	%l1 = ffffffffffffffff, Mem[0000000010041400] = 00000000
	stha	%l1,[%i1+%g0]0x80	! Mem[0000000010041400] = ffff0000

p0_label_144:
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = 63d70000, %l5 = 00000000ff00a50e
	ldswa	[%i0+%o5]0x81,%l5	! %l5 = 0000000063d70000
!	Mem[0000000010141400] = ffffbc73 32f3436e, %l6 = 0000000e, %l7 = 00000059
	ldda	[%i5+%g0]0x80,%l6	! %l6 = 00000000ffffbc73 0000000032f3436e
!	Mem[0000000030001400] = 58000000000000ff, %l2 = 0000000000000000
	ldxa	[%i0+%g0]0x81,%l2	! %l2 = 58000000000000ff
!	Mem[0000000010101420] = 4f6344683d350000, %f16 = 00ffbc73 32f3436e, %asi = 80
	ldda	[%i4+0x020]%asi,%f16	! %f16 = 4f634468 3d350000
!	Mem[00000000100c1400] = 00000000ff000043, %l1 = ffffffffffffffff
	ldxa	[%i3+%g0]0x88,%l1	! %l1 = 00000000ff000043
!	Mem[00000000300c1408] = 6bb60000, %l6 = 00000000ffffbc73
	ldswa	[%i3+%o4]0x81,%l6	! %l6 = 000000006bb60000
!	Mem[0000000030181400] = 6bb6bf79, %l4 = 000000000000000e
	lduha	[%i6+%g0]0x81,%l4	! %l4 = 0000000000006bb6
!	Mem[00000000100c1400] = ff000043, %f1  = 7fffffff
	lda	[%i3+%g0]0x88,%f1 	! %f1 = ff000043
!	Mem[00000000100c1410] = 00000000, %l7 = 0000000032f3436e
	lduha	[%i3+%o5]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000010081408] = 098d812858695340, %l4 = 0000000000006bb6
	ldxa	[%i2+%o4]0x80,%l4	! %l4 = 098d812858695340

p0_label_145:
!	Starting 10 instruction Store Burst
!	%l4 = 58695340, %l5 = 63d70000, Mem[0000000030001410] = 0000d763 43000000
	stda	%l4,[%i0+%o5]0x89	! Mem[0000000030001410] = 58695340 63d70000
!	%l4 = 098d812858695340, Mem[0000000030001408] = 0000000e
	stba	%l4,[%i0+%o4]0x89	! Mem[0000000030001408] = 00000040
!	Mem[0000000030001410] = 40536958, %l1 = 00000000ff000043
	ldstuba	[%i0+%o5]0x81,%l1	! %l1 = 0000000000000040
!	%l4 = 098d812858695340, Mem[0000000020800000] = 0064c420, %asi = 80
	stha	%l4,[%o1+0x000]%asi	! Mem[0000000020800000] = 5340c420
!	Mem[0000000010101400] = 40536958, %l7 = 0000000000000000
	swapa	[%i4+%g0]0x80,%l7	! %l7 = 0000000040536958
!	%f8  = 64000000 3d350000, %l7 = 0000000040536958
!	Mem[0000000030181420] = 4053695828818d09
	add	%i6,0x020,%g1
	stda	%f8,[%g1+%l7]ASI_PST8_S ! Mem[0000000030181420] = 400069003d818d09
!	%f14 = ffbf0000, Mem[0000000030041410] = 00000000
	sta	%f14,[%i1+%o5]0x81	! Mem[0000000030041410] = ffbf0000
!	%l0 = 00000000ffffffff, Mem[0000000030081410] = 0e000000
	stwa	%l0,[%i2+%o5]0x81	! Mem[0000000030081410] = ffffffff
!	%f8  = 64000000 3d350000, %l4 = 098d812858695340
!	Mem[0000000010081420] = 0000000058695340
	add	%i2,0x020,%g1
	stda	%f8,[%g1+%l4]ASI_PST8_PL ! Mem[0000000010081420] = 0000000058690040
	membar	#Sync			! Added by membar checker (26)
!	%f9  = 3d350000, Mem[0000000010141404] = 32f3436e
	sta	%f9 ,[%i5+0x004]%asi	! Mem[0000000010141404] = 3d350000

p0_label_146:
!	Starting 10 instruction Load Burst
!	Mem[0000000020800000] = 5340c420, %l7 = 0000000040536958
	ldsh	[%o1+%g0],%l7		! %l7 = 0000000000005340
!	Mem[0000000030181410] = 00000000, %l2 = 58000000000000ff
	lduha	[%i6+%o5]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000030081410] = ffffffff, %f2  = 0000ff00
	lda	[%i2+%o5]0x89,%f2 	! %f2 = ffffffff
!	Mem[0000000030181400] = 6bb6bf79, %l0 = 00000000ffffffff
	lduba	[%i6+%g0]0x81,%l0	! %l0 = 000000000000006b
!	Mem[0000000030081410] = ffffffffffb77618, %f6  = 098d8128 00000000
	ldda	[%i2+%o5]0x81,%f6 	! %f6  = ffffffff ffb77618
!	Mem[00000000300c1400] = 58695340, %l5 = 0000000063d70000
	lduwa	[%i3+%g0]0x89,%l5	! %l5 = 0000000058695340
!	Mem[00000000100c1428] = 00000000, %l7 = 0000000000005340
	ldsw	[%i3+0x028],%l7		! %l7 = 0000000000000000
!	%l4 = 098d812858695340, %l6 = 000000006bb60000, %l3  = 0000000000000064
	mulx	%l4,%l6,%l3		! %l3 = afa2e0acef800000
!	Mem[0000000010141410] = 00000000000000ff, %f20 = ff000000 00000000
	ldda	[%i5+%o5]0x88,%f20	! %f20 = 00000000 000000ff
!	Mem[00000000100c1402] = 430000ff, %l1 = 0000000000000040
	ldub	[%i3+0x002],%l1		! %l1 = 0000000000000000

p0_label_147:
!	Starting 10 instruction Store Burst
!	%l3 = afa2e0acef800000, Mem[0000000030101400] = ffffff00
	stha	%l3,[%i4+%g0]0x89	! Mem[0000000030101400] = ffff0000
!	Mem[0000000010101400] = 00000000 28818d09 000000ff 89ffffff
!	%f0  = 40536958 ff000043 ffffffff ff8900ff
!	%f4  = 00000000 58000000 ffffffff ffb77618
!	%f8  = 64000000 3d350000 757f8ee6 00000000
!	%f12 = 00000000 ffb77618 ffbf0000 00000000
	stda	%f0 ,[%i4+%g0]ASI_BLK_P	! Block Store to 0000000010101400
!	Mem[00000000300c1410] = 00000000, %l4 = 098d812858695340
	ldstuba	[%i3+%o5]0x81,%l4	! %l4 = 0000000000000000
!	%l0 = 000000000000006b, Mem[0000000010141408] = 00000064
	stha	%l0,[%i5+%o4]0x88	! Mem[0000000010141408] = 0000006b
!	Mem[00000000300c1408] = 0000b66b, %l1 = 0000000000000000
	swapa	[%i3+%o4]0x89,%l1	! %l1 = 000000000000b66b
!	Code Fragment 3, seed = 955309
p0_fragment_9:
!	%l0 = 000000000000006b
	setx	0xe54f86cfa92717be,%g7,%l0 ! %l0 = e54f86cfa92717be
!	%l1 = 000000000000b66b
	setx	0xbfdcc5d3c0251869,%g7,%l1 ! %l1 = bfdcc5d3c0251869
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = e54f86cfa92717be
	setx	0x8d1538a67f50d524,%g7,%l0 ! %l0 = 8d1538a67f50d524
!	%l1 = bfdcc5d3c0251869
	setx	0x93f9b94d4efad0ef,%g7,%l1 ! %l1 = 93f9b94d4efad0ef
p0_fragment_9_end:
!	%l7 = 0000000000000000, Mem[00000000100c142b] = 00000000, %asi = 80
	stba	%l7,[%i3+0x02b]%asi	! Mem[00000000100c1428] = 00000000
!	%l2 = 00000000, %l3 = ef800000, Mem[0000000030001408] = 00000040 17a50648
	stda	%l2,[%i0+%o4]0x89	! Mem[0000000030001408] = 00000000 ef800000
!	%l0 = 7f50d524, %l1 = 4efad0ef, Mem[0000000010101428] = 757f8ee6 00000000
	std	%l0,[%i4+0x028]		! Mem[0000000010101428] = 7f50d524 4efad0ef
!	%l4 = 0000000000000000, Mem[0000000010081410] = 00ff0065
	stba	%l4,[%i2+%o5]0x88	! Mem[0000000010081410] = 00ff0000

p0_label_148:
!	Starting 10 instruction Load Burst
!	%l4 = 0000000000000000, %l0 = 8d1538a67f50d524, %y  = 40536958
	sdiv	%l4,%l0,%l0		! %l0 = 000000007fffffff
	mov	%l0,%y			! %y = 7fffffff
!	Mem[0000000010081408] = 4053695828818d09, %l5 = 0000000058695340
	ldxa	[%i2+%o4]0x88,%l5	! %l5 = 4053695828818d09
!	Mem[0000000010001408] = 1ce1feff, %l4 = 0000000000000000
	ldsha	[%i0+%o4]0x88,%l4	! %l4 = fffffffffffffeff
!	Mem[0000000010041410] = 6bb6ffff40536958, %l4 = fffffffffffffeff
	ldxa	[%i1+%o5]0x80,%l4	! %l4 = 6bb6ffff40536958
	membar	#Sync			! Added by membar checker (27)
!	Mem[0000000010101410] = 0000000058000000, %l6 = 000000006bb60000
	ldxa	[%i4+%o5]0x80,%l6	! %l6 = 0000000058000000
!	Mem[0000000030101410] = 6bb6bf79, %l2 = 0000000000000000
	lduba	[%i4+%o5]0x89,%l2	! %l2 = 0000000000000079
!	Mem[0000000010001400] = 64000000 000000ff, %l6 = 58000000, %l7 = 00000000
	ldda	[%i0+%g0]0x80,%l6	! %l6 = 0000000064000000 00000000000000ff
!	Mem[0000000010141400] = 73bcffff, %l6 = 0000000064000000
	lduha	[%i5+%g0]0x88,%l6	! %l6 = 000000000000ffff
!	Mem[0000000010001400] = 64000000, %f20 = 00000000
	lda	[%i0+%g0]0x80,%f20	! %f20 = 64000000
!	Mem[0000000030141400] = ff000043, %l2 = 0000000000000079
	ldswa	[%i5+%g0]0x89,%l2	! %l2 = ffffffffff000043

p0_label_149:
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1408] = 58000000, %l6 = 000000000000ffff
	swapa	[%i3+%o4]0x88,%l6	! %l6 = 0000000058000000
!	%f25 = 28818d09, Mem[0000000010141408] = 6b000000
	sta	%f25,[%i5+%o4]0x80	! Mem[0000000010141408] = 28818d09
!	Mem[0000000010101410] = 00000000, %l2 = 00000000ff000043
	swapa	[%i4+%o5]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000030081408] = ff353e27, %l0 = 000000007fffffff
	swapa	[%i2+%o4]0x81,%l0	! %l0 = 00000000ff353e27
!	Mem[0000000030081410] = ffffffff, %l3 = 00000000ef800000
	swapa	[%i2+%o5]0x81,%l3	! %l3 = 00000000ffffffff
!	%l3 = 00000000ffffffff, Mem[0000000010101431] = 00000000, %asi = 80
	stba	%l3,[%i4+0x031]%asi	! Mem[0000000010101430] = 00ff0000
!	Mem[00000000211c0001] = 00000480, %l5 = 4053695828818d09
	ldstub	[%o2+0x001],%l5		! %l5 = 0000000000000000
!	Mem[0000000030101400] = 0000ffff, %l4 = 0000000040536958
	swapa	[%i4+%g0]0x81,%l4	! %l4 = 000000000000ffff
!	%l7 = 00000000000000ff, Mem[0000000030181408] = 00000000
	stwa	%l7,[%i6+%o4]0x81	! Mem[0000000030181408] = 000000ff
!	%l5 = 0000000000000000, Mem[0000000030081410] = 000080ef
	stba	%l5,[%i2+%o5]0x89	! Mem[0000000030081410] = 00008000

p0_label_150:
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = 586953ff, %l6 = 0000000058000000
	lduwa	[%i0+%o5]0x89,%l6	! %l6 = 00000000586953ff
!	Mem[0000000010101408] = ffffffff, %l2 = 0000000000000000
	lduba	[%i4+%o4]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[000000001008142c] = 00004300, %l1 = 93f9b94d4efad0ef, %asi = 80
	ldswa	[%i2+0x02c]%asi,%l1	! %l1 = 0000000000004300
!	Mem[0000000030181410] = 00000000, %l7 = 00000000000000ff
	lduha	[%i6+%o5]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000030101400] = 58695340, %l0 = 00000000ff353e27
	lduwa	[%i4+%g0]0x89,%l0	! %l0 = 0000000058695340
!	Mem[0000000030041410] = 0000bfff, %l1 = 0000000000004300
	ldsba	[%i1+%o5]0x89,%l1	! %l1 = ffffffffffffffff
!	Mem[00000000100c1410] = 0000000000000000, %f18 = 64000000 000000ff
	ldda	[%i3+%o5]0x88,%f18	! %f18 = 00000000 00000000
!	Mem[0000000010081408] = 098d8128, %l0 = 0000000058695340
	lduh	[%i2+%o4],%l0		! %l0 = 000000000000098d
!	Mem[0000000010041409] = 00000000, %l5 = 0000000000000000
	ldub	[%i1+0x009],%l5		! %l5 = 0000000000000000
!	Mem[0000000030001400] = 00000058, %l7 = 0000000000000000
	ldswa	[%i0+%g0]0x89,%l7	! %l7 = 0000000000000058

!	End of Random Code for Thread 0


!	Check Registers

p0_check_registers:
	set	p0_expected_registers,%g1
	ldx	[%g1+0x000],%g2
	cmp	%l0,%g2			! %l0 should be 000000000000098d
	bne	%xcc,p0_reg_l0_fail
	mov	%l0,%g3
	ldx	[%g1+0x008],%g2
	cmp	%l1,%g2			! %l1 should be ffffffffffffffff
	bne	%xcc,p0_reg_l1_fail
	mov	%l1,%g3
	ldx	[%g1+0x010],%g2
	cmp	%l2,%g2			! %l2 should be 00000000000000ff
	bne	%xcc,p0_reg_l2_fail
	mov	%l2,%g3
	ldx	[%g1+0x018],%g2
	cmp	%l3,%g2			! %l3 should be 00000000ffffffff
	bne	%xcc,p0_reg_l3_fail
	mov	%l3,%g3
	ldx	[%g1+0x020],%g2
	cmp	%l4,%g2			! %l4 should be 000000000000ffff
	bne	%xcc,p0_reg_l4_fail
	mov	%l4,%g3
	ldx	[%g1+0x028],%g2
	cmp	%l5,%g2			! %l5 should be 0000000000000000
	bne	%xcc,p0_reg_l5_fail
	mov	%l5,%g3
	ldx	[%g1+0x030],%g2
	cmp	%l6,%g2			! %l6 should be 00000000586953ff
	bne	%xcc,p0_reg_l6_fail
	mov	%l6,%g3
	ldx	[%g1+0x038],%g2
	cmp	%l7,%g2			! %l7 should be 0000000000000058
	bne	%xcc,p0_reg_l7_fail
	mov	%l7,%g3

!	Check %y register

	set	0x7fffffff,%g2
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
	cmp	%l0,%l1			! %f0  should be 40536958 ff000043
	bne	%xcc,p0_freg_fail
	std	%f2,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x08],%l0
	cmp	%l0,%l1			! %f2  should be ffffffff ff8900ff
	bne	%xcc,p0_freg_fail
	std	%f4,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x10],%l0
	cmp	%l0,%l1			! %f4  should be 00000000 58000000
	bne	%xcc,p0_freg_fail
	std	%f6,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x18],%l0
	cmp	%l0,%l1			! %f6  should be ffffffff ffb77618
	bne	%xcc,p0_freg_fail
	std	%f8,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x20],%l0
	cmp	%l0,%l1			! %f8  should be 64000000 3d350000
	bne	%xcc,p0_freg_fail
	std	%f10,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x28],%l0
	cmp	%l0,%l1			! %f10 should be 757f8ee6 00000000
	bne	%xcc,p0_freg_fail
	std	%f12,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x30],%l0
	cmp	%l0,%l1			! %f12 should be 00000000 ffb77618
	bne	%xcc,p0_freg_fail
	std	%f14,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x38],%l0
	cmp	%l0,%l1			! %f14 should be ffbf0000 00000000
	bne	%xcc,p0_freg_fail
	std	%f16,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x40],%l0
	cmp	%l0,%l1			! %f16 should be 4f634468 3d350000
	bne	%xcc,p0_freg_fail
	std	%f18,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x48],%l0
	cmp	%l0,%l1			! %f18 should be 00000000 00000000
	bne	%xcc,p0_freg_fail
	std	%f20,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x50],%l0
	cmp	%l0,%l1			! %f20 should be 64000000 000000ff
	bne	%xcc,p0_freg_fail
	std	%f22,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x58],%l0
	cmp	%l0,%l1			! %f22 should be 00000000 7489e967
	bne	%xcc,p0_freg_fail
	std	%f24,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x60],%l0
	cmp	%l0,%l1			! %f24 should be 40536958 28818d09
	bne	%xcc,p0_freg_fail
	std	%f26,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x68],%l0
	cmp	%l0,%l1			! %f26 should be 0ea59f56 3fb0144f
	bne	%xcc,p0_freg_fail
	std	%f28,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x70],%l0
	cmp	%l0,%l1			! %f28 should be d40b598f ffffff08
	bne	%xcc,p0_freg_fail
	std	%f30,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x78],%l0
	cmp	%l0,%l1			! %f30 should be 63d34422 79bfb66b
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
	ldx	[%g1+0x000],%l0		! %l0 = 408b5ea8211430fe
	ldx	[%g1+0x008],%l1		! %l1 = c51059930d6feda9
	ldx	[%g1+0x010],%l2		! %l2 = 424eec46433ca664
	ldx	[%g1+0x018],%l3		! %l3 = 0cc569211866de2f
	ldx	[%g1+0x020],%l4		! %l4 = ecd8878adbafa80a
	ldx	[%g1+0x028],%l5		! %l5 = a5b0ef8183c7a6f5
	ldx	[%g1+0x030],%l6		! %l6 = 3d3518eb8f7a0df0
	ldx	[%g1+0x038],%l7		! %l7 = afccd7e789e79ffb

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
	stb	%l2,[%i0+0x02f]		! Mem[000000001000142f]
	ldstub	[%o2+0x001],%l3		! Mem[00000000211c0001]
	xnor	%l6,-0x57b,%l1
	xnor	%l1,%l6,%l7
	umul	%l2,-0x0bc,%l3
	umul	%l0,%l2,%l5
	smul	%l1,0x705,%l2
	jmpl	%o7,%g0
	add	%l7,0x435,%l6
p0_near_0_he:
	addc	%l1,%l2,%l2
	fcmps	%fcc1,%f19,%f16
	and	%l2,0xf5e,%l0
	jmpl	%o7,%g0
	fcmps	%fcc1,%f30,%f16
p0_near_0_lo:
	stb	%l2,[%o0+0x02f]		! Mem[000000001000142f]
	ldstub	[%i2+0x001],%l3		! Mem[00000000211c0001]
	xnor	%l6,-0x57b,%l1
	xnor	%l1,%l6,%l7
	umul	%l2,-0x0bc,%l3
	umul	%l0,%l2,%l5
	smul	%l1,0x705,%l2
	jmpl	%o7,%g0
	add	%l7,0x435,%l6
p0_near_0_ho:
	addc	%l1,%l2,%l2
	fcmps	%fcc1,%f19,%f16
	and	%l2,0xf5e,%l0
	jmpl	%o7,%g0
	fcmps	%fcc1,%f30,%f16
near0_b2b_h:
	orn	%l5,%l0,%l3
	fmuls	%f29,%f25,%f19
	fdtos	%f24,%f19
	umul	%l5,0x1dc,%l4
	jmpl	%o7,%g0
	orn	%l7,%l2,%l4
near0_b2b_l:
	udivx	%l4,0x053,%l2
	orn	%l3,-0xff6,%l0
	mulx	%l0,%l6,%l1
	addc	%l4,%l2,%l0
	jmpl	%o7,%g0
	and	%l5,%l0,%l1
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
	xor	%l4,%l5,%l4
	fsqrts	%f14,%f14
	fadds	%f3 ,%f12,%f6 
	jmpl	%o7,%g0
	sdivx	%l5,0x3a6,%l3
p0_near_1_he:
	mulx	%l3,%l1,%l6
	jmpl	%o7,%g0
	mulx	%l5,-0xa06,%l7
p0_near_1_lo:
	xor	%l4,%l5,%l4
	fsqrts	%f14,%f14
	fadds	%f3 ,%f12,%f6 
	jmpl	%o7,%g0
	sdivx	%l5,0x3a6,%l3
p0_near_1_ho:
	mulx	%l3,%l1,%l6
	jmpl	%o7,%g0
	mulx	%l5,-0xa06,%l7
near1_b2b_h:
	fmuls	%f17,%f27,%f26
	fsubs	%f19,%f17,%f22
	smul	%l5,0x78d,%l4
	fadds	%f24,%f20,%f29
	sub	%l4,0xff2,%l0
	mulx	%l4,-0x1e6,%l1
	jmpl	%o7,%g0
	andn	%l2,-0xc88,%l6
near1_b2b_l:
	andn	%l7,0xb83,%l0
	and	%l0,0xf79,%l0
	fdivs	%f9 ,%f3 ,%f1 
	smul	%l5,0x779,%l5
	smul	%l4,%l6,%l2
	add	%l6,0x839,%l2
	jmpl	%o7,%g0
	umul	%l2,-0x79e,%l4
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
	fmuls	%f13,%f0 ,%f8 
	andn	%l6,%l3,%l7
	jmpl	%o7,%g0
	and	%l1,-0xd75,%l0
p0_near_2_he:
	xnor	%l0,%l3,%l1
	xor	%l2,0x591,%l7
	umul	%l7,%l2,%l3
	orn	%l5,%l2,%l5
	jmpl	%o7,%g0
	fdivs	%f28,%f20,%f26
p0_near_2_lo:
	fmuls	%f13,%f0 ,%f8 
	andn	%l6,%l3,%l7
	jmpl	%o7,%g0
	and	%l1,-0xd75,%l0
p0_near_2_ho:
	xnor	%l0,%l3,%l1
	xor	%l2,0x591,%l7
	umul	%l7,%l2,%l3
	orn	%l5,%l2,%l5
	jmpl	%o7,%g0
	fdivs	%f28,%f20,%f26
near2_b2b_h:
	fsubs	%f20,%f29,%f20
	andn	%l5,-0x9ba,%l0
	addc	%l1,%l4,%l4
	fsqrts	%f21,%f29
	smul	%l1,%l6,%l2
	fadds	%f24,%f26,%f18
	jmpl	%o7,%g0
	sub	%l2,%l6,%l1
near2_b2b_l:
	fdivs	%f8 ,%f14,%f11
	orn	%l7,0x36f,%l3
	fadds	%f5 ,%f15,%f8 
	xor	%l7,%l7,%l7
	xnor	%l2,-0x7d7,%l5
	umul	%l3,0x3ec,%l1
	jmpl	%o7,%g0
	and	%l7,%l5,%l2
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
	fsubs	%f7 ,%f0 ,%f5 
	udivx	%l2,0x763,%l5
	orn	%l5,%l2,%l2
	fcmps	%fcc0,%f3 ,%f1 
	add	%l1,0x7f3,%l2
	jmpl	%o7,%g0
	addc	%l6,-0x270,%l4
p0_near_3_he:
	udivx	%l1,%l3,%l0
	jmpl	%o7,%g0
	or	%l1,0xb35,%l6
p0_near_3_lo:
	fsubs	%f7 ,%f0 ,%f5 
	udivx	%l2,0x763,%l5
	orn	%l5,%l2,%l2
	fcmps	%fcc0,%f3 ,%f1 
	add	%l1,0x7f3,%l2
	jmpl	%o7,%g0
	addc	%l6,-0x270,%l4
p0_near_3_ho:
	udivx	%l1,%l3,%l0
	jmpl	%o7,%g0
	or	%l1,0xb35,%l6
near3_b2b_h:
	jmpl	%o7,%g0
	fsubs	%f22,%f26,%f16
	jmpl	%o7,%g0
	nop
near3_b2b_l:
	jmpl	%o7,%g0
	add	%l2,0x058,%l3
	jmpl	%o7,%g0
	nop
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
	fmuls	%f5 ,%f6 ,%f10
	smul	%l3,-0x2ae,%l2
	smul	%l4,%l7,%l2
	sdivx	%l7,0x777,%l4
	orn	%l2,%l6,%l6
	xnor	%l7,%l7,%l3
	jmpl	%o7,%g0
	sdivx	%l1,%l6,%l4
p0_far_0_he:
	and	%l4,%l4,%l5
	sdivx	%l4,%l2,%l6
	jmpl	%o7,%g0
	udivx	%l2,0xb3c,%l0
p0_far_0_lo:
	fmuls	%f5 ,%f6 ,%f10
	smul	%l3,-0x2ae,%l2
	smul	%l4,%l7,%l2
	sdivx	%l7,0x777,%l4
	orn	%l2,%l6,%l6
	xnor	%l7,%l7,%l3
	jmpl	%o7,%g0
	sdivx	%l1,%l6,%l4
p0_far_0_ho:
	and	%l4,%l4,%l5
	sdivx	%l4,%l2,%l6
	jmpl	%o7,%g0
	udivx	%l2,0xb3c,%l0
far0_b2b_h:
	mulx	%l0,0x91a,%l0
	umul	%l3,-0x514,%l3
	sdivx	%l0,%l1,%l1
	fmuls	%f19,%f24,%f21
	jmpl	%o7,%g0
	smul	%l0,-0x1c2,%l0
far0_b2b_l:
	fmuls	%f12,%f6 ,%f0 
	xor	%l4,-0x3ad,%l2
	fsubs	%f7 ,%f5 ,%f6 
	orn	%l0,-0x15c,%l1
	jmpl	%o7,%g0
	and	%l2,%l1,%l7
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
	xnor	%l4,%l3,%l1
	umul	%l7,0xf6a,%l4
	jmpl	%o7,%g0
	fsubs	%f12,%f1 ,%f6 
p0_far_1_he:
	jmpl	%o7,%g0
	xnor	%l3,%l5,%l4
	jmpl	%o7,%g0
	nop
p0_far_1_lo:
	xnor	%l4,%l3,%l1
	umul	%l7,0xf6a,%l4
	jmpl	%o7,%g0
	fsubs	%f12,%f1 ,%f6 
p0_far_1_ho:
	jmpl	%o7,%g0
	xnor	%l3,%l5,%l4
	jmpl	%o7,%g0
	nop
	jmpl	%o7,%g0
	nop
far1_b2b_h:
	xnor	%l6,0xc02,%l4
	smul	%l0,0x62e,%l3
	subc	%l3,%l4,%l1
	fdivs	%f30,%f23,%f28
	jmpl	%o7,%g0
	smul	%l7,0xef9,%l2
far1_b2b_l:
	andn	%l2,0x046,%l1
	sdivx	%l3,%l5,%l3
	xnor	%l5,%l5,%l3
	or	%l6,%l7,%l2
	jmpl	%o7,%g0
	xor	%l4,%l3,%l7
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
	jmpl	%o7,%g0
	ldsw	[%i1+0x008],%l0		! Mem[0000000010041408]
	jmpl	%o7,%g0
	nop
p0_far_2_he:
	fsqrts	%f24,%f16
	fmuls	%f23,%f22,%f23
	udivx	%l3,%l7,%l6
	sdivx	%l4,0x60b,%l6
	jmpl	%o7,%g0
	fcmps	%fcc1,%f26,%f29
p0_far_2_lo:
	jmpl	%o7,%g0
	ldsw	[%o1+0x008],%l0		! Mem[0000000010041408]
	jmpl	%o7,%g0
	nop
	jmpl	%o7,%g0
	nop
p0_far_2_ho:
	fsqrts	%f24,%f16
	fmuls	%f23,%f22,%f23
	udivx	%l3,%l7,%l6
	sdivx	%l4,0x60b,%l6
	jmpl	%o7,%g0
	fcmps	%fcc1,%f26,%f29
far2_b2b_h:
	or	%l6,%l5,%l0
	xnor	%l5,%l2,%l7
	jmpl	%o7,%g0
	fsubs	%f26,%f18,%f19
far2_b2b_l:
	umul	%l6,%l4,%l6
	subc	%l2,-0x62b,%l4
	jmpl	%o7,%g0
	smul	%l7,0x253,%l1
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
	or	%l0,-0x722,%l4
	sub	%l6,%l4,%l6
	swap	[%i2+0x000],%l2		! Mem[0000000010081400]
	andn	%l3,%l7,%l3
	fadds	%f4 ,%f0 ,%f3 
	udivx	%l3,%l7,%l3
	jmpl	%o7,%g0
	swap	[%i3+0x004],%l1		! Mem[00000000100c1404]
p0_far_3_he:
	fcmps	%fcc1,%f30,%f16
	andn	%l0,%l3,%l7
	fcmps	%fcc3,%f25,%f23
	xor	%l5,0x1f5,%l3
	jmpl	%o7,%g0
	addc	%l2,%l4,%l3
p0_far_3_lo:
	or	%l0,-0x722,%l4
	sub	%l6,%l4,%l6
	swap	[%o2+0x000],%l2		! Mem[0000000010081400]
	andn	%l3,%l7,%l3
	fadds	%f4 ,%f0 ,%f3 
	udivx	%l3,%l7,%l3
	jmpl	%o7,%g0
	swap	[%o3+0x004],%l1		! Mem[00000000100c1404]
p0_far_3_ho:
	fcmps	%fcc1,%f30,%f16
	andn	%l0,%l3,%l7
	fcmps	%fcc3,%f25,%f23
	xor	%l5,0x1f5,%l3
	jmpl	%o7,%g0
	addc	%l2,%l4,%l3
far3_b2b_h:
	andn	%l7,%l5,%l4
	and	%l2,%l3,%l0
	sub	%l5,%l0,%l7
	or	%l4,-0xc85,%l5
	jmpl	%o7,%g0
	fitos	%f31,%f20
far3_b2b_l:
	andn	%l2,0x8bb,%l2
	addc	%l6,-0xe4b,%l1
	fsqrts	%f12,%f0 
	addc	%l2,%l7,%l2
	jmpl	%o7,%g0
	mulx	%l2,-0x840,%l5
user_far3_end:
	.seg	"text"
	.align	0x2000
user_jump0_start:
	.skip	16
p0_jmpl_0_le:
	andn	%l3,-0x6ed,%l1
	fcmps	%fcc1,%f1 ,%f3 
	smul	%l4,0xe8d,%l4
	addc	%l6,%l6,%l6
	fdivs	%f8 ,%f3 ,%f13
	xor	%l0,-0x7a0,%l2
	xnor	%l6,%l3,%l5
	jmpl	%g6+8,%g0
	fcmps	%fcc2,%f5 ,%f11
p0_call_0_le:
	and	%l6,0x82c,%l4
	retl
	xor	%l3,%l6,%l5
p0_jmpl_0_lo:
	andn	%l3,-0x6ed,%l1
	fcmps	%fcc1,%f1 ,%f3 
	smul	%l4,0xe8d,%l4
	addc	%l6,%l6,%l6
	fdivs	%f8 ,%f3 ,%f13
	xor	%l0,-0x7a0,%l2
	xnor	%l6,%l3,%l5
	jmpl	%g6+8,%g0
	fcmps	%fcc2,%f5 ,%f11
p0_call_0_lo:
	and	%l6,0x82c,%l4
	retl
	xor	%l3,%l6,%l5
p0_jmpl_0_he:
	fsqrts	%f23,%f26
	fsubs	%f29,%f17,%f26
	xnor	%l5,%l5,%l3
	smul	%l7,%l2,%l2
	orn	%l2,%l6,%l4
	jmpl	%g6+8,%g0
	fdivs	%f26,%f19,%f19
p0_call_0_he:
	add	%l6,%l2,%l7
	retl
	fcmps	%fcc3,%f16,%f30
p0_jmpl_0_ho:
	fsqrts	%f23,%f26
	fsubs	%f29,%f17,%f26
	xnor	%l5,%l5,%l3
	smul	%l7,%l2,%l2
	orn	%l2,%l6,%l4
	jmpl	%g6+8,%g0
	fdivs	%f26,%f19,%f19
p0_call_0_ho:
	add	%l6,%l2,%l7
	retl
	fcmps	%fcc3,%f16,%f30
user_jump0_end:
	.seg	"text"
	.align	0x2000
user_jump1_start:
	.skip	32
p0_jmpl_1_le:
	smul	%l4,%l1,%l2
	andn	%l0,%l6,%l2
	xor	%l6,0x431,%l3
	xnor	%l4,%l4,%l5
	and	%l2,%l4,%l5
	jmpl	%g6+8,%g0
	fsqrts	%f5 ,%f3 
p0_call_1_le:
	udivx	%l7,%l1,%l0
	stw	%l1,[%i6+0x014]		! Mem[0000000010181414]
	umul	%l2,%l6,%l1
	or	%l7,%l5,%l5
	retl
	sdivx	%l4,%l0,%l5
p0_jmpl_1_lo:
	smul	%l4,%l1,%l2
	andn	%l0,%l6,%l2
	xor	%l6,0x431,%l3
	xnor	%l4,%l4,%l5
	and	%l2,%l4,%l5
	jmpl	%g6+8,%g0
	fsqrts	%f5 ,%f3 
p0_call_1_lo:
	udivx	%l7,%l1,%l0
	stw	%l1,[%o6+0x014]		! Mem[0000000010181414]
	umul	%l2,%l6,%l1
	or	%l7,%l5,%l5
	retl
	sdivx	%l4,%l0,%l5
p0_jmpl_1_he:
	ldd	[%i1+0x008],%l0		! Mem[0000000010041408]
	jmpl	%g6+8,%g0
	fmuls	%f30,%f20,%f18
p0_call_1_he:
	fdivs	%f20,%f18,%f25
	addc	%l1,%l7,%l2
	smul	%l6,%l6,%l3
	std	%l4,[%i0+0x020]		! Mem[0000000010001420]
	xnor	%l4,0xbd5,%l1
	fsubs	%f26,%f21,%f18
	retl
	sub	%l5,-0x9ea,%l3
p0_jmpl_1_ho:
	ldd	[%o1+0x008],%l0		! Mem[0000000010041408]
	jmpl	%g6+8,%g0
	fmuls	%f30,%f20,%f18
p0_call_1_ho:
	fdivs	%f20,%f18,%f25
	addc	%l1,%l7,%l2
	smul	%l6,%l6,%l3
	std	%l4,[%o0+0x020]		! Mem[0000000010001420]
	xnor	%l4,0xbd5,%l1
	fsubs	%f26,%f21,%f18
	retl
	sub	%l5,-0x9ea,%l3
user_jump1_end:
	.seg	"text"
	.align	0x2000
user_jump2_start:
	.skip	48
p0_jmpl_2_le:
	jmpl	%g6+8,%g0
	sub	%l6,0x370,%l2
p0_call_2_le:
	subc	%l6,%l3,%l3
	xor	%l2,-0xe76,%l7
	sdivx	%l5,%l0,%l0
	fdivs	%f10,%f2 ,%f0 
	retl
	xnor	%l7,%l6,%l3
p0_jmpl_2_lo:
	jmpl	%g6+8,%g0
	sub	%l6,0x370,%l2
p0_call_2_lo:
	subc	%l6,%l3,%l3
	xor	%l2,-0xe76,%l7
	sdivx	%l5,%l0,%l0
	fdivs	%f10,%f2 ,%f0 
	retl
	xnor	%l7,%l6,%l3
p0_jmpl_2_he:
	fsubs	%f18,%f30,%f17
	jmpl	%g6+8,%g0
	lduh	[%o1+0x000],%l5		! Mem[0000000020800000]
p0_call_2_he:
	or	%l4,%l0,%l4
	fmuls	%f31,%f27,%f24
	smul	%l3,-0x552,%l5
	orn	%l4,0x218,%l6
	smul	%l4,%l6,%l4
	addc	%l6,%l5,%l6
	or	%l7,%l7,%l7
	retl
	orn	%l1,%l6,%l2
p0_jmpl_2_ho:
	fsubs	%f18,%f30,%f17
	jmpl	%g6+8,%g0
	lduh	[%i1+0x000],%l5		! Mem[0000000020800000]
p0_call_2_ho:
	or	%l4,%l0,%l4
	fmuls	%f31,%f27,%f24
	smul	%l3,-0x552,%l5
	orn	%l4,0x218,%l6
	smul	%l4,%l6,%l4
	addc	%l6,%l5,%l6
	or	%l7,%l7,%l7
	retl
	orn	%l1,%l6,%l2
user_jump2_end:
	.seg	"text"
	.align	0x2000
user_jump3_start:
	.skip	64
p0_jmpl_3_le:
	fadds	%f9 ,%f1 ,%f13
	udivx	%l4,%l2,%l2
	udivx	%l2,%l2,%l2
	fadds	%f4 ,%f6 ,%f2 
	fdivs	%f0 ,%f12,%f8 
	mulx	%l5,-0x58c,%l3
	jmpl	%g6+8,%g0
	fmuls	%f0 ,%f10,%f3 
p0_call_3_le:
	swap	[%i1+0x010],%l7		! Mem[0000000010041410]
	retl
	or	%l2,-0xd8d,%l1
p0_jmpl_3_lo:
	fadds	%f9 ,%f1 ,%f13
	udivx	%l4,%l2,%l2
	udivx	%l2,%l2,%l2
	fadds	%f4 ,%f6 ,%f2 
	fdivs	%f0 ,%f12,%f8 
	mulx	%l5,-0x58c,%l3
	jmpl	%g6+8,%g0
	fmuls	%f0 ,%f10,%f3 
p0_call_3_lo:
	swap	[%o1+0x010],%l7		! Mem[0000000010041410]
	retl
	or	%l2,-0xd8d,%l1
p0_jmpl_3_he:
	stw	%l7,[%i6+0x024]		! Mem[0000000010181424]
	xor	%l2,-0x15d,%l6
	mulx	%l3,-0x313,%l5
	andn	%l0,0x4d1,%l6
	jmpl	%g6+8,%g0
	subc	%l3,%l3,%l2
p0_call_3_he:
	retl
	fcmps	%fcc3,%f27,%f22
p0_jmpl_3_ho:
	stw	%l7,[%o6+0x024]		! Mem[0000000010181424]
	xor	%l2,-0x15d,%l6
	mulx	%l3,-0x313,%l5
	andn	%l0,0x4d1,%l6
	jmpl	%g6+8,%g0
	subc	%l3,%l3,%l2
p0_call_3_ho:
	retl
	fcmps	%fcc3,%f27,%f22
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
	.word	0x408b5ea8,0x211430fe		! Init value for %l0
	.word	0xc5105993,0x0d6feda9		! Init value for %l1
	.word	0x424eec46,0x433ca664		! Init value for %l2
	.word	0x0cc56921,0x1866de2f		! Init value for %l3
	.word	0xecd8878a,0xdbafa80a		! Init value for %l4
	.word	0xa5b0ef81,0x83c7a6f5		! Init value for %l5
	.word	0x3d3518eb,0x8f7a0df0		! Init value for %l6
	.word	0xafccd7e7,0x89e79ffb		! Init value for %l7
	.align	64
p0_init_freg:
	.word	0x3ae18290,0x55d21e61		! Init value for %f0 
	.word	0x43d5344e,0x67dbda67		! Init value for %f2 
	.word	0x1a75c47c,0x0e79351d		! Init value for %f4 
	.word	0x11e08a9a,0x69d57803		! Init value for %f6 
	.word	0x5ab7ba28,0x36d3d899		! Init value for %f8 
	.word	0x719242a6,0x2c53d85f		! Init value for %f10
	.word	0x20f2af94,0x3d80a4d5		! Init value for %f12
	.word	0x313d0872,0x06c3777b		! Init value for %f14
	.word	0x16e3b0c0,0x71b0f5d1		! Init value for %f16
	.word	0x62c347fe,0x69099157		! Init value for %f18
	.word	0x5a6589ac,0x78a4e78d		! Init value for %f20
	.word	0x5da32d4a,0x1de021f3		! Init value for %f22
	.word	0x0cdcc658,0x0be75609		! Init value for %f24
	.word	0x6ec2a456,0x6bf1e54f		! Init value for %f26
	.word	0x0e63b2c4,0x5c49dd45		! Init value for %f28
	.word	0x21fb5922,0x51b6576b		! Init value for %f30
	.word	0x30b65af0,0x35a0d941		! Init value for %f32
	.word	0x5166b7ae,0x580db447		! Init value for %f34
	.word	0x6dde8adc,0x3f3f65fd		! Init value for %f36
	.word	0x6669ebfa,0x379cf7e3		! Init value for %f38
	.word	0x6e9fce88,0x75335f79		! Init value for %f40
	.word	0x7881e206,0x4ce9de3f		! Init value for %f42
	.word	0x6ca371f4,0x364161b5		! Init value for %f44
	.word	0x35cf45d2,0x1736e35b		! Init value for %f46
	.word	0x3c648120,0x02a0c8b1
	.word	0x4162835e,0x3e1f4337
	.word	0x0adbc80c,0x4777b06d
	.word	0x7347c6aa,0x59f2f9d3
	.word	0x1aebd2b8,0x5316f4e9
	.word	0x2652fbb6,0x7ad2c32f
	.word	0x0e8ced24,0x4df63225
	.word	0x7fabce82,0x2a8c1b4b
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
	.word	0x00000000,0x0000098d		! %l0
	.word	0xffffffff,0xffffffff		! %l1
	.word	0x00000000,0x000000ff		! %l2
	.word	0x00000000,0xffffffff		! %l3
	.word	0x00000000,0x0000ffff		! %l4
	.word	0x00000000,0x00000000		! %l5
	.word	0x00000000,0x586953ff		! %l6
	.word	0x00000000,0x00000058		! %l7
p0_expected_fp_regs:
	.word	0x40536958,0xff000043		! %f0
	.word	0xffffffff,0xff8900ff		! %f2
	.word	0x00000000,0x58000000		! %f4
	.word	0xffffffff,0xffb77618		! %f6
	.word	0x64000000,0x3d350000		! %f8
	.word	0x757f8ee6,0x00000000		! %f10
	.word	0x00000000,0xffb77618		! %f12
	.word	0xffbf0000,0x00000000		! %f14
	.word	0x4f634468,0x3d350000		! %f16
	.word	0x00000000,0x00000000		! %f18
	.word	0x64000000,0x000000ff		! %f20
	.word	0x00000000,0x7489e967		! %f22
	.word	0x40536958,0x28818d09		! %f24
	.word	0x0ea59f56,0x3fb0144f		! %f26
	.word	0xd40b598f,0xffffff08		! %f28
	.word	0x63d34422,0x79bfb66b		! %f30
	.word	0x00000000,0x00000b30		! %fsr
p0_local0_expect:
	.word	0x64000000,0x000000ff,0xfffee11c,0x00000000 ! PA = 0000000010001400
	.word	0x1ce1feab,0x79bfb66b,0x1ce1004d,0x4489ffc3 ! PA = 0000000010001410
	.word	0xff000000,0x0000ff89,0x004ef166,0x5a03941f ! PA = 0000000010001420
	.word	0x24bb2454,0x0000098d,0x6e43f332,0x73bcff3b ! PA = 0000000010001430
p0_local0_sec_expect:
	.word	0x58000000,0x000000ff,0x00000000,0x000080ef ! PA = 0000000030001400
	.word	0xff536958,0x0000d763,0x7854d00a,0x43c681b3 ! PA = 0000000030001410
	.word	0x678acf18,0x7be0c3c9,0x0a97ff08,0x659351f9 ! PA = 0000000030001420
	.word	0x6d891784,0x3a93b705,0x7c0ab3e2,0x5f908f2b ! PA = 0000000030001430
!	Scratch Area for Non-Transactional Memory Stores
	.word	0xee05e9de,0xf2b92f6f,0x42fccc82,0xa0f9ecdb
	.word	0x23145546,0xbac9a8a7,0xa34c7d2a,0x55cbadd3
	.word	0x47fd452e,0x315e5f5f,0x2ae8f652,0xd129f84b
	.word	0xf4f06196,0xdb554b97,0xc4f91ffa,0xfd108443
p0_local1_expect:
	.word	0xffff0000,0x0ea59f56,0x00000000,0x00000000 ! PA = 0000000010041400
	.word	0x6bb6ffff,0x40536958,0x4053d17a,0x2881d763 ! PA = 0000000010041410
	.word	0xff000000,0x658ffff9,0x00000000,0x0000003b ! PA = 0000000010041420
	.word	0x39dbff74,0x00000064,0x28e09b52,0x569fa5ff ! PA = 0000000010041430
p0_local1_sec_expect:
	.word	0xff000000,0x529be028,0x0e0089ff,0x4def72db ! PA = 0000000030041400
	.word	0xffbf0000,0x000000ff,0x5062496a,0x1192b993 ! PA = 0000000030041410
	.word	0x0d11bb78,0x603cc2a9,0x73c5fa76,0x0deb8eef ! PA = 0000000030041420
	.word	0x753031e4,0x3d9a6be5,0x39b00942,0x09fbb30b ! PA = 0000000030041430
p0_local2_expect:
	.word	0xb66bffff,0xffffffff,0x098d8128,0x58695340 ! PA = 0000000010081400
	.word	0x0000ff00,0xffffffff,0xf320ca23,0x4a38ff6b ! PA = 0000000010081410
	.word	0x00000000,0x58690040,0x00000065,0x00004300 ! PA = 0000000010081420
	.word	0x273e35ff,0x3c146e8d,0x6bb6bfff,0x2244d363 ! PA = 0000000010081430
p0_local2_sec_expect:
	.word	0x67e98974,0xff000000,0x7fffffff,0x00000000 ! PA = 0000000030081400
	.word	0x00800000,0xffb77618,0x00000000,0x28818d09 ! PA = 0000000030081410
	.word	0x3c79441e,0x60000000,0xffffffff,0x79bfb60e ! PA = 0000000030081420
	.word	0x08ffffff,0x3c146e8d,0xff8927c3,0x35350865 ! PA = 0000000030081430
p0_local3_expect:
	.word	0x430000ff,0x00000000,0xffff0000,0x00000000 ! PA = 00000000100c1400
	.word	0x00000000,0x00000000,0x659bd17a,0x0459d763 ! PA = 00000000100c1410
	.word	0x5c970064,0x658ffff9,0x00000000,0x419669ff ! PA = 00000000100c1420
	.word	0x00000000,0x58000000,0x00000057,0xffef72ff ! PA = 00000000100c1430
p0_local3_sec_expect:
	.word	0x40536958,0x00ff0065,0x00000000,0x74b74e95 ! PA = 00000000300c1400
	.word	0xff000000,0xff8927ff,0x11e08a9a,0x69d57803 ! PA = 00000000300c1410
	.word	0x11b77618,0x00a30d1c,0xff3ca664,0x65cc45a7 ! PA = 00000000300c1420
	.word	0x20f2af94,0x3d80a4d5,0x74b74e95,0x2e25eb3b ! PA = 00000000300c1430
p0_local4_expect:
	.word	0x40536958,0xff000043,0xffffffff,0xff8900ff ! PA = 0000000010101400
	.word	0xff000043,0x58000000,0xffffffff,0xffb77618 ! PA = 0000000010101410
	.word	0x64000000,0x3d350000,0x7f50d524,0x4efad0ef ! PA = 0000000010101420
	.word	0x00ff0000,0xffb77618,0xffbf0000,0x00000000 ! PA = 0000000010101430
p0_local4_sec_expect:
	.word	0x40536958,0x000000ff,0xffa50000,0x89ffffff ! PA = 0000000030101400
	.word	0x79bfb66b,0x000000ff,0xabfee11c,0x00000000 ! PA = 0000000030101410
	.word	0x4f634468,0x3d350000,0x757f8ee6,0x71ef4b9f ! PA = 0000000030101420
	.word	0x51ff4dd4,0xd44dff51,0x586953ff,0x00000000 ! PA = 0000000030101430
p0_local5_expect:
	.word	0xffffbc73,0x3d350000,0x28818d09,0x000000ff ! PA = 0000000010141400
	.word	0xff000000,0x00000000,0x6b74384a,0x00ffffff ! PA = 0000000010141410
	.word	0x40536958,0x28818d09,0x0ea59f56,0x3fb0144f ! PA = 0000000010141420
	.word	0xd40b598f,0xffffff08,0x63d34422,0x79bfb66b ! PA = 0000000010141430
p0_local5_sec_expect:
	.word	0x430000ff,0x0ea500ff,0xe1ffffff,0x7489e967 ! PA = 0000000030141400
	.word	0xffffffff,0xffffffff,0x1ce1feff,0x08e66057 ! PA = 0000000030141410
	.word	0x7f1cccf8,0x50c29e29,0x029537f6,0x7599666f ! PA = 0000000030141420
	.word	0x74b74e95,0x13311f65,0x24e5bec2,0x260b228b ! PA = 0000000030141430
p0_local6_expect:
	.word	0xffff0000,0x00000000,0x3b000000,0x00000000 ! PA = 0000000010181400
	.word	0x00000000,0x000063ff,0x00000052,0x0e79351d ! PA = 0000000010181410
	.word	0xffffffff,0x569fa50e,0x7f71ff43,0x46ce0365 ! PA = 0000000010181420
	.word	0xf5be0a66,0x34b0c179,0x64000000,0x000000ff ! PA = 0000000010181430
p0_local6_sec_expect:
	.word	0x6bb6bf79,0x000000ff,0x000000ff,0x08e66057 ! PA = 0000000030181400
	.word	0x00000000,0xff353e27,0x6b74384a,0x23ca20f3 ! PA = 0000000030181410
	.word	0x40006900,0x3d818d09,0x0ea59f56,0x3fb0144f ! PA = 0000000030181420
	.word	0x8d6e143c,0xffffff08,0x63d34422,0x79bfb66b ! PA = 0000000030181430
share0_expect:
	.word	0xffffddf0,0x297d7041,0x2e8692ae,0x78894347 ! PA = 00000000201c0000
	.word	0x51667ddc,0x3893acfd,0x3c94b6fa,0x4161b6e3 ! PA = 00000000201c0010
	.word	0x4ece3188,0x15ce5679,0x74ea9d06,0x5c7ecd3f ! PA = 00000000201c0020
	.word	0x738344f4,0x3d2208b5,0x3018f0d2,0x03d3025b ! PA = 00000000201c0030
share1_expect:
	.word	0x5340c420,0x12f61fb1,0x06a01e5e,0x58a99237 ! PA = 0000000020800000
	.word	0x47ff7b0c,0x5fa0b76d,0x00fc51aa,0x5c0278d3 ! PA = 0000000020800010
	.word	0x4481f5b8,0x73a2abe9,0x557176b6,0x25ae722f ! PA = 0000000020800020
	.word	0x68608024,0x50a39925,0x1f973982,0x162afa4b ! PA = 0000000020800030
	.word	0xff572650,0x732ddb21,0x3da5060e,0x7f3e4d27 ! PA = 0000000020800040
	.word	0x0d87b43c,0x192a8ddd,0x3f7e085a,0x7f5366c3 ! PA = 0000000020800050
	.word	0x0a19b5e8,0x211d8d59,0x137d2c66,0x0b96031f ! PA = 0000000020800060
	.word	0x29327754,0x5e217595,0x5d011e32,0x64ce9e3b ! PA = 0000000020800070
share2_expect:
	.word	0x00ff0480,0x7ca3a291,0x20b849be,0x72fe7417 ! PA = 00000000211c0000
	.word	0x6f7a296c,0x53e0304d,0x32acdb0a,0x43bb80b3 ! PA = 00000000211c0010
	.word	0x6a007218,0x401dfac9,0x1210be16,0x274c800f ! PA = 00000000211c0020
	.word	0x50542a84,0x61aa9e05,0x1ec99ee2,0x2884ee2b ! PA = 00000000211c0030
share3_expect:
	.word	0xff9d5eb0,0x5c967601,0x54bce96e,0x5b610707 ! PA = 0000000021800000
	.word	0x6111da9c,0x75309ebd,0x78dbc9ba,0x3e61c6a3 ! PA = 0000000021800010
	.word	0x40612a48,0x2542f439,0x63ef2bc6,0x2aa8e8ff ! PA = 0000000021800020
	.word	0x35e099b4,0x060e1275,0x5723bb92,0x0ed4ea1b ! PA = 0000000021800030
	.word	0x7e7734e0,0x2b055571,0x0655e51e,0x709d05f7 ! PA = 0000000021800040
	.word	0x2b49c7cc,0x494ad92d,0x441dd46a,0x712d3893 ! PA = 0000000021800050
	.word	0x2b26de78,0x47eb79a9,0x7b9b7576,0x50423def ! PA = 0000000021800060
	.word	0x1fb2c4e4,0x14dad2e5,0x64027442,0x2a05920b ! PA = 0000000021800070
	.word	0x00008710,0x5aaf40e1,0x19e63cce,0x6ba970e7 ! PA = 0000000021800080
	.word	0x1cdcf0fc,0x731ddf9d,0x0a45fb1a,0x3ac4d683 ! PA = 0000000021800090
	.word	0x39fc8ea8,0x32368b19,0x5b589b26,0x4b6f7edf ! PA = 00000000218000a0
	.word	0x7165ac14,0x665fdf55,0x3f18c8f2,0x611de5fb ! PA = 00000000218000b0
	.word	0x00ff5540,0x29133851,0x5b90f07e,0x763d47d7 ! PA = 00000000218000c0
	.word	0x3a46562c,0x5c58b20d,0x34e73dca,0x468fa073 ! PA = 00000000218000d0
	.word	0x1e4d3ad8,0x71032889,0x45299cd6,0x3847abcf ! PA = 00000000218000e0
	.word	0x5c544f44,0x51ac37c5,0x2dd9b9a2,0x5fe4e5eb ! PA = 00000000218000f0
	.word	0x1eff9f70,0x0e703bc1,0x2f39002e,0x1acf8ac7 ! PA = 0000000021800100
	.word	0x6dc0f75c,0x256a507d,0x51549c7a,0x7cb49663 ! PA = 0000000021800110
	.word	0x5b43e308,0x03f051f9,0x6ad17a86,0x0ba1c4bf ! PA = 0000000021800120
	.word	0x0f99ae74,0x1c8edc35,0x71784652,0x06e191db ! PA = 0000000021800130
	.word	0x7a2565a0,0x2dc54b31,0x40816bde,0x349739b7 ! PA = 0000000021800140
	.word	0x3747d48c,0x1581baed,0x40a1172a,0x721ab853 ! PA = 0000000021800150
	.word	0x75cb8738,0x4d5d0769,0x1dd33436,0x0314c9af ! PA = 0000000021800160
	.word	0x6810c9a4,0x6b96cca5,0x76e76f02,0x5b5ae9cb ! PA = 0000000021800170
	.word	0x0000a7d0,0x44d166a1,0x32cd338e,0x5f8b54a7 ! PA = 0000000021800180
	.word	0x5c95edbc,0x0a8df15d,0x679fadda,0x58690643 ! PA = 0000000021800190
	.word	0x248f2768,0x026848d9,0x7f71c9e6,0x14f7ba9f ! PA = 00000000218001a0
	.word	0x2054a0d4,0x32130915,0x06da33b2,0x7757edbb ! PA = 00000000218001b0
	.word	0x19076600,0x1c138e11,0x513f573e,0x6862db97 ! PA = 00000000218001c0
	.word	0x192642ec,0x693df3cd,0x5ee3608a,0x6e068033 ! PA = 00000000218001d0
	.word	0x7ff9c398,0x1af11649,0x30b03b96,0x6061978f ! PA = 00000000218001e0
	.word	0x00c03404,0x22129185,0x75c39462,0x799f9dab ! PA = 00000000218001f0
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
	.word	0x07b92350,0x546fc421,0x5c19ab0e,0x65353e27	! PA = 0000000010001400
	.word	0x2d18413c,0x0d3cc6dd,0x4f0fbd5a,0x448927c3	! PA = 0000000010001410
	.word	0x5e6bd2e8,0x58b11659,0x5f78f166,0x5a03941f	! PA = 0000000010001420
	.word	0x24bb2454,0x74b74e95,0x6e43f332,0x73bcff3b	! PA = 0000000010001430
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
	.word	0x2a3f4180,0x318ccb91,0x72af2ebe,0x4806a517	! PA = 0000000030001400
	.word	0x460ef66c,0x133da94d,0x7854d00a,0x43c681b3	! PA = 0000000030001410
	.word	0x678acf18,0x7be0c3c9,0x0af6c316,0x7793510f	! PA = 0000000030001420
	.word	0x6d891784,0x3a93b705,0x7c0ab3e2,0x5f908f2b	! PA = 0000000030001430
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
	.word	0x3541dbb0,0x1b36df01,0x2e060e6e,0x020a7807	! PA = 0000000010041400
	.word	0x6cfae79c,0x52e957bd,0x5169feba,0x20d207a3	! PA = 0000000010041410
	.word	0x7673c748,0x6544fd39,0x3f8f70c6,0x7958f9ff	! PA = 0000000010041420
	.word	0x6511c6b4,0x5e5a6b75,0x5f331092,0x4f8dcb1b	! PA = 0000000010041430
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
	.word	0x63cbf1e0,0x7d6cfe71,0x3ec14a1e,0x3f77b6f7	! PA = 0000000030041400
	.word	0x0ed714cc,0x2c6ed22d,0x5062496a,0x1192b993	! PA = 0000000030041410
	.word	0x0d11bb78,0x603cc2a9,0x73c5fa76,0x0deb8eef	! PA = 0000000030041420
	.word	0x753031e4,0x3d9a6be5,0x39b00942,0x09fbb30b	! PA = 0000000030041430
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
	.word	0x4aa88410,0x1eee29e1,0x0d43e1ce,0x2d4561e7	! PA = 0000000010081400
	.word	0x1e5e7dfc,0x56bd189d,0x2f10b01a,0x28af9783	! PA = 0000000010081410
	.word	0x1f0faba8,0x4ae71419,0x2ddd6026,0x5ca20fdf	! PA = 0000000010081420
	.word	0x257f5914,0x44a2b855,0x49349df2,0x29e146fb	! PA = 0000000010081430
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
	.word	0x08629240,0x11396151,0x69b0d57e,0x692a78d7	! PA = 0000000030081400
	.word	0x440c232c,0x4f832b0d,0x1b0832ca,0x458fa173	! PA = 0000000030081410
	.word	0x41d897d8,0x0622f189,0x33d8a1d6,0x75937ccf	! PA = 0000000030081420
	.word	0x4b5a3c44,0x5e8250c5,0x1733cea2,0x0f0586eb	! PA = 0000000030081430
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
	.word	0x75451c70,0x208da4c1,0x3beb252e,0x719dfbc7	! PA = 00000000100c1400
	.word	0x0e1b045c,0x4b30097d,0x659bd17a,0x0459d763	! PA = 00000000100c1410
	.word	0x5c978008,0x658f5af9,0x3b7abf86,0x4196d5bf	! PA = 00000000100c1420
	.word	0x39dbdb74,0x65083535,0x28e09b52,0x4def72db	! PA = 00000000100c1430
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
	.word	0x535b22a0,0x43e9f431,0x3395d0de,0x15d6eab7	! PA = 00000000300c1400
	.word	0x2086218c,0x24f2b3ed,0x33de8c2a,0x2df53953	! PA = 00000000300c1410
	.word	0x58376438,0x1f8b5069,0x1a46b936,0x72431aaf	! PA = 00000000300c1420
	.word	0x71df36a4,0x10c365a5,0x2f2e0402,0x1fe60acb	! PA = 00000000300c1430
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
	.word	0x7e6fa4d0,0x0d0d4fa1,0x7813d88e,0x65cc45a7	! PA = 0000000010101400
	.word	0x65087abc,0x4eba2a5d,0x2ea362da,0x2808c743	! PA = 0000000010101410
	.word	0x4f634468,0x3d35d1d9,0x757f8ee6,0x71ef4b9f	! PA = 0000000010101420
	.word	0x51ff4dd4,0x6902e215,0x36cf08b2,0x52f04ebb	! PA = 0000000010101430
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
	.word	0x1c0da300,0x1876b711,0x58883c3e,0x22350c97	! PA = 0000000030101400
	.word	0x3b1d0fec,0x41356ccd,0x327d558a,0x64fb8133	! PA = 0000000030101410
	.word	0x3e862098,0x0a6ddf49,0x72284096,0x53b2688f	! PA = 0000000030101420
	.word	0x46972104,0x33d5aa85,0x5836a962,0x39d53eab	! PA = 0000000030101430
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
	.word	0x4b801d30,0x7d652a81,0x7bd5fbee,0x2c883f87	! PA = 0000000010141400
	.word	0x27fee11c,0x6bd37b3d,0x7fbf643a,0x53f46723	! PA = 0000000010141410
	.word	0x33caf8c8,0x05d278b9,0x6503ce46,0x4363717f	! PA = 0000000010141420
	.word	0x79c1b034,0x660abef5,0x6797e612,0x1c1bda9b	! PA = 0000000010141430
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
	.word	0x55d21360,0x3dd7a9f1,0x10a0179e,0x76fcde77	! PA = 0000000030141400
	.word	0x06a8ee4c,0x24c355ad,0x6a7c8eea,0x50da7913	! PA = 0000000030141410
	.word	0x7f1cccf8,0x50c29e29,0x029537f6,0x7599666f	! PA = 0000000030141420
	.word	0x0359fb64,0x13311f65,0x24e5bec2,0x260b228b	! PA = 0000000030141430
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
	.word	0x5dce8590,0x368d3561,0x7d498f4e,0x7489e967	! PA = 0000000010181400
	.word	0x37d6377c,0x18f3fc1d,0x0a87d59a,0x1454b703	! PA = 0000000010181410
	.word	0x62269d28,0x1f5d4f99,0x0f1f7da6,0x17ab475f	! PA = 0000000010181420
	.word	0x18fb0294,0x5d97cbd5,0x6bd33372,0x58aa167b	! PA = 0000000010181430
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
	.word	0x100073c0,0x0f04ccd1,0x0ff562fe,0x08e66057	! PA = 0000000030181400
	.word	0x5201bcac,0x3c146e8d,0x6b74384a,0x23ca20f3	! PA = 0000000030181410
	.word	0x40536958,0x28818d09,0x0ea59f56,0x3fb0144f	! PA = 0000000030181420
	.word	0x3dffc5c4,0x664dc445,0x63d34422,0x79bfb66b	! PA = 0000000030181430
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
	.word	0x52b2ddf0,0x297d7041,0x2e8692ae,0x78894347	! PA = 00000000201c0000
	.word	0x51667ddc,0x3893acfd,0x3c94b6fa,0x4161b6e3	! PA = 00000000201c0010
	.word	0x4ece3188,0x15ce5679,0x74ea9d06,0x5c7ecd3f	! PA = 00000000201c0020
	.word	0x738344f4,0x3d2208b5,0x3018f0d2,0x03d3025b	! PA = 00000000201c0030
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
	.word	0x75f0c420,0x12f61fb1,0x06a01e5e,0x58a99237	! PA = 0000000020800000
	.word	0x47ff7b0c,0x5fa0b76d,0x00fc51aa,0x5c0278d3	! PA = 0000000020800010
	.word	0x4481f5b8,0x73a2abe9,0x557176b6,0x25ae722f	! PA = 0000000020800020
	.word	0x68608024,0x50a39925,0x1f973982,0x162afa4b	! PA = 0000000020800030
	.word	0x63852650,0x732ddb21,0x3da5060e,0x7f3e4d27	! PA = 0000000020800040
	.word	0x0d87b43c,0x192a8ddd,0x3f7e085a,0x7f5366c3	! PA = 0000000020800050
	.word	0x0a19b5e8,0x211d8d59,0x137d2c66,0x0b96031f	! PA = 0000000020800060
	.word	0x29327754,0x5e217595,0x5d011e32,0x64ce9e3b	! PA = 0000000020800070
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
	.word	0x4efb0480,0x7ca3a291,0x20b849be,0x72fe7417	! PA = 00000000211c0000
	.word	0x6f7a296c,0x53e0304d,0x32acdb0a,0x43bb80b3	! PA = 00000000211c0010
	.word	0x6a007218,0x401dfac9,0x1210be16,0x274c800f	! PA = 00000000211c0020
	.word	0x50542a84,0x61aa9e05,0x1ec99ee2,0x2884ee2b	! PA = 00000000211c0030
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
	.word	0x659d5eb0,0x5c967601,0x54bce96e,0x5b610707	! PA = 0000000021800000
	.word	0x6111da9c,0x75309ebd,0x78dbc9ba,0x3e61c6a3	! PA = 0000000021800010
	.word	0x40612a48,0x2542f439,0x63ef2bc6,0x2aa8e8ff	! PA = 0000000021800020
	.word	0x35e099b4,0x060e1275,0x5723bb92,0x0ed4ea1b	! PA = 0000000021800030
	.word	0x7e7734e0,0x2b055571,0x0655e51e,0x709d05f7	! PA = 0000000021800040
	.word	0x2b49c7cc,0x494ad92d,0x441dd46a,0x712d3893	! PA = 0000000021800050
	.word	0x2b26de78,0x47eb79a9,0x7b9b7576,0x50423def	! PA = 0000000021800060
	.word	0x1fb2c4e4,0x14dad2e5,0x64027442,0x2a05920b	! PA = 0000000021800070
	.word	0x4a538710,0x5aaf40e1,0x19e63cce,0x6ba970e7	! PA = 0000000021800080
	.word	0x1cdcf0fc,0x731ddf9d,0x0a45fb1a,0x3ac4d683	! PA = 0000000021800090
	.word	0x39fc8ea8,0x32368b19,0x5b589b26,0x4b6f7edf	! PA = 00000000218000a0
	.word	0x7165ac14,0x665fdf55,0x3f18c8f2,0x611de5fb	! PA = 00000000218000b0
	.word	0x03bd5540,0x29133851,0x5b90f07e,0x763d47d7	! PA = 00000000218000c0
	.word	0x3a46562c,0x5c58b20d,0x34e73dca,0x468fa073	! PA = 00000000218000d0
	.word	0x1e4d3ad8,0x71032889,0x45299cd6,0x3847abcf	! PA = 00000000218000e0
	.word	0x5c544f44,0x51ac37c5,0x2dd9b9a2,0x5fe4e5eb	! PA = 00000000218000f0
	.word	0x1eff9f70,0x0e703bc1,0x2f39002e,0x1acf8ac7	! PA = 0000000021800100
	.word	0x6dc0f75c,0x256a507d,0x51549c7a,0x7cb49663	! PA = 0000000021800110
	.word	0x5b43e308,0x03f051f9,0x6ad17a86,0x0ba1c4bf	! PA = 0000000021800120
	.word	0x0f99ae74,0x1c8edc35,0x71784652,0x06e191db	! PA = 0000000021800130
	.word	0x7a2565a0,0x2dc54b31,0x40816bde,0x349739b7	! PA = 0000000021800140
	.word	0x3747d48c,0x1581baed,0x40a1172a,0x721ab853	! PA = 0000000021800150
	.word	0x75cb8738,0x4d5d0769,0x1dd33436,0x0314c9af	! PA = 0000000021800160
	.word	0x6810c9a4,0x6b96cca5,0x76e76f02,0x5b5ae9cb	! PA = 0000000021800170
	.word	0x0cf9a7d0,0x44d166a1,0x32cd338e,0x5f8b54a7	! PA = 0000000021800180
	.word	0x5c95edbc,0x0a8df15d,0x679fadda,0x58690643	! PA = 0000000021800190
	.word	0x248f2768,0x026848d9,0x7f71c9e6,0x14f7ba9f	! PA = 00000000218001a0
	.word	0x2054a0d4,0x32130915,0x06da33b2,0x7757edbb	! PA = 00000000218001b0
	.word	0x19076600,0x1c138e11,0x513f573e,0x6862db97	! PA = 00000000218001c0
	.word	0x192642ec,0x693df3cd,0x5ee3608a,0x6e068033	! PA = 00000000218001d0
	.word	0x7ff9c398,0x1af11649,0x30b03b96,0x6061978f	! PA = 00000000218001e0
	.word	0x00c03404,0x22129185,0x75c39462,0x799f9dab	! PA = 00000000218001f0
share3_end:
