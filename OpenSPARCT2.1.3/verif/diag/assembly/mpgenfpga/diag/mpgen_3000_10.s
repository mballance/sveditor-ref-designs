/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: mpgen_3000_10.s
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
!	Seed = 626121756
!	Riesling can be on
!	1 Thread, 3000 lines
!	mpgen   created on May 4, 2009 (15:17:56), Version 2.81
!	mpgen_3000_10.s created on Jun 26, 2009 (12:17:56)
!	RC file : random.rc
!	cmd = /import/n2-tools/release/tools/mpgen/mpgen,1.090504 -rc random.rc -o mpgen_3000_10 -p 1 -l 3000

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
!	%f0  = 160db338 734b0369 1d1bc036 2473a5af
!	%f4  = 08fab5a4 63b588a5 4a25bb02 6c4085cb
!	%f8  = 5c1753d0 1efce2a1 10ed3f8e 77b3b0a7
!	%f12 = 0d3359bc 2d622d5d 4b4d79da 6c502243
	ldda	[%g1]ASI_BLK_P,%f0
	add	%g1,64,%g1
!	%f16 = 5bb85368 674144d9 731955e6 11d9969f
!	%f20 = 20d58cd4 610cc515 30a77fb2 1f3089bb
!	%f24 = 2f6c1200 680a0a11 3f1e633e 6dee3797
!	%f28 = 47baaeec 6bcd2fcd 12802c8a 50c09c33
	ldda	[%g1]ASI_BLK_P,%f16
	add	%g1,64,%g1
!	%f32 = 6ac9ef98 70751249 6b76c796 0886738f
!	%f36 = 19982004 65a74d85 44dfe062 142b39ab
!	%f40 = 4c054c30 7e4c3d81 4718e2ee 57432a87
!	%f44 = 2b7f401c 650afe3d 2d0afb3a 53674223
	ldda	[%g1]ASI_BLK_P,%f32

!	Set up the Graphics Status Register

	setx	0x96227b0b00000045,%g7,%g1 ! %gsr scale =  8, align = 5
	wr	%g1,%g0,%gsr		! %gsr = 96227b0b00000045

	wr	%g0,%y			! Clear %y register
	xorcc	%g0,%g0,%g3		! %g3 = 0, %ccr = 44
	membar	#Sync			! Force the block loads to complete

!	Start of Random Code for processor 0

p0_label_1:
!	Starting 10 instruction Store Burst
!	Mem[00000000100c140e] = 262e8b0f, %l4 = 7c423b0e2d785052
	ldstub	[%i3+0x00e],%l4		! %l4 = 000000000000008b
!	Mem[0000000010001408] = f63e1d26, %l0 = 00000000ab0b7346
	swapa	[%i0+%o4]0x88,%l0	! %l0 = 00000000f63e1d26
!	%l2 = 2feccb3256e48bac, Mem[0000000030181410] = d4df5666
	stha	%l2,[%i6+%o5]0x89	! Mem[0000000030181410] = d4df8bac
!	%l2 = 56e48bac, %l3 = e56960f7, Mem[0000000030001400] = 28acd64e 99c27733
	stda	%l2,[%i0+%g0]0x89	! Mem[0000000030001400] = 56e48bac e56960f7
!	%l0 = f63e1d26, %l1 = 38a73d71, Mem[0000000030141408] = 86c19d75 bf8f6462
	stda	%l0,[%i5+%o4]0x89	! Mem[0000000030141408] = f63e1d26 38a73d71
!	%l2 = 56e48bac, %l3 = e56960f7, Mem[0000000010001408] = ab0b7346 6ff1d039
	stda	%l2,[%i0+%o4]0x88	! Mem[0000000010001408] = 56e48bac e56960f7
!	%f29 = 6bcd2fcd, Mem[0000000030101400] = a89d622c
	sta	%f29,[%i4+%g0]0x89	! Mem[0000000030101400] = 6bcd2fcd
!	%f9  = 1efce2a1, Mem[0000000010101400] = 65ce2d78
	sta	%f9 ,[%i4+%g0]0x80	! Mem[0000000010101400] = 1efce2a1
!	Mem[0000000030001400] = ac8be456, %l3 = 00000000e56960f7
	swapa	[%i0+%g0]0x81,%l3	! %l3 = 00000000ac8be456
!	%f28 = 47baaeec 6bcd2fcd, %l0 = 00000000f63e1d26
!	Mem[0000000010001438] = 2034ec9a6fb31203
	add	%i0,0x038,%g1
	stda	%f28,[%g1+%l0]ASI_PST32_P ! Mem[0000000010001438] = 47baaeec6fb31203

p0_label_2:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141428] = 3fb4e72e5e3f75c7, %l4 = 000000000000008b
	ldx	[%i5+0x028],%l4		! %l4 = 3fb4e72e5e3f75c7
!	Mem[0000000030101400] = cd2fcd6b, %l3 = 00000000ac8be456
	lduba	[%i4+%g0]0x81,%l3	! %l3 = 00000000000000cd
!	Mem[0000000030041400] = 7949103188c04b04, %f6  = 4a25bb02 6c4085cb
	ldda	[%i1+%g0]0x89,%f6 	! %f6  = 79491031 88c04b04
!	%o3 = deadbeefdeadbeef
	set	share3_start,%o3	! set %o3[0] to VA
!	Mem[00000000218000c1] = 5c3aa7e8, %l3 = 00000000000000cd
	ldsb	[%o3+0x0c1],%l3		! %l3 = 000000000000003a
!	Mem[0000000030001400] = e56960f7, %l7 = 3bb9c82d7ecee8c3
	ldswa	[%i0+%g0]0x81,%l7	! %l7 = ffffffffe56960f7
!	Mem[0000000010041408] = 70272656, %l3 = 000000000000003a
	ldsba	[%i1+%o4]0x80,%l3	! %l3 = 0000000000000070
!	Mem[0000000010141410] = 3b764e44567adac5, %l0 = 00000000f63e1d26
	ldxa	[%i5+%o5]0x80,%l0	! %l0 = 3b764e44567adac5
!	Mem[0000000010041400] = 0ab23858, %f0  = 160db338
	ld	[%i1+%g0],%f0 		! %f0 = 0ab23858
!	Mem[0000000030141408] = f63e1d26, %f4  = 08fab5a4
	lda	[%i5+%o4]0x89,%f4 	! %f4 = f63e1d26
!	Mem[0000000010181424] = 2b7cf9a1, %l4 = 3fb4e72e5e3f75c7
	lduw	[%i6+0x024],%l4		! %l4 = 000000002b7cf9a1

p0_label_3:
!	Starting 10 instruction Store Burst
!	%l0 = 3b764e44567adac5, Mem[0000000030081400] = 6e24c4e8
	stha	%l0,[%i2+%g0]0x81	! Mem[0000000030081400] = dac5c4e8
!	%l3 = 0000000000000070, imm = fffffffffffff80a, %l1 = a23681cd38a73d71
	xnor	%l3,-0x7f6,%l1		! %l1 = 0000000000000785
!	%l7 = ffffffffe56960f7, Mem[0000000010141438] = 3529337a2eec7163
	stx	%l7,[%i5+0x038]		! Mem[0000000010141438] = ffffffffe56960f7
!	%l5 = a1950b5e568b7cbd, Mem[000000001000140c] = f76069e5, %asi = 80
	stwa	%l5,[%i0+0x00c]%asi	! Mem[000000001000140c] = 568b7cbd
!	Mem[00000000100c140c] = 262eff0f, %l7 = e56960f7, %l3 = 00000070
	add	%i3,0x0c,%g1
	casa	[%g1]0x80,%l7,%l3	! %l3 = 00000000262eff0f
!	%l6 = 5af14cba13ff9938, Mem[0000000010041400] = 5838b20a
	stba	%l6,[%i1+%g0]0x88	! Mem[0000000010041400] = 5838b238
!	Mem[0000000010181400] = 080dd638, %l7 = ffffffffe56960f7
	ldstuba	[%i6+%g0]0x80,%l7	! %l7 = 0000000000000008
!	Mem[0000000010101410] = 586f43e4, %l7 = 0000000000000008
	ldstuba	[%i4+%o5]0x80,%l7	! %l7 = 0000000000000058
!	%l1 = 0000000000000785, Mem[0000000010041410] = 0e0bc4c4
	stha	%l1,[%i1+%o5]0x80	! Mem[0000000010041410] = 0785c4c4
!	%l6 = 13ff9938, %l7 = 00000058, Mem[0000000010001428] = 06b5f64e 3cd85467
	std	%l6,[%i0+0x028]		! Mem[0000000010001428] = 13ff9938 00000058

p0_label_4:
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = 6836503c, %l4 = 000000002b7cf9a1
	ldswa	[%i6+%g0]0x89,%l4	! %l4 = 000000006836503c
!	Mem[0000000010081408] = 2ffdec2e b67dac68, %l6 = 13ff9938, %l7 = 00000058
	ldda	[%i2+%o4]0x88,%l6	! %l6 = 00000000b67dac68 000000002ffdec2e
!	Mem[0000000010101433] = 0b48cffc, %l7 = 000000002ffdec2e, %asi = 80
	lduba	[%i4+0x033]%asi,%l7	! %l7 = 00000000000000fc
!	%f6  = 79491031, %f7  = 88c04b04, %f20 = 20d58cd4
	fmuls	%f6 ,%f7 ,%f20		! %f20 = c2970710
!	Mem[0000000010181410] = a448580f, %l6 = 00000000b67dac68
	lduha	[%i6+%o5]0x88,%l6	! %l6 = 000000000000580f
!	Mem[0000000030181410] = d4df8bac, %l7 = 00000000000000fc
	ldswa	[%i6+%o5]0x89,%l7	! %l7 = ffffffffd4df8bac
!	Mem[0000000030081400] = e8c4c5da, %l0 = 3b764e44567adac5
	lduwa	[%i2+%g0]0x89,%l0	! %l0 = 00000000e8c4c5da
!	Mem[00000000100c1408] = 1645c52a, %l5 = a1950b5e568b7cbd
	lduba	[%i3+%o4]0x88,%l5	! %l5 = 000000000000002a
!	Mem[0000000030041408] = 06e4d02a, %l5 = 000000000000002a
	ldswa	[%i1+%o4]0x89,%l5	! %l5 = 0000000006e4d02a
!	Mem[0000000030181400] = 6836503c, %l4 = 000000006836503c
	ldswa	[%i6+%g0]0x89,%l4	! %l4 = 000000006836503c

p0_label_5:
!	Starting 10 instruction Store Burst
!	Mem[0000000010141414] = 567adac5, %l0 = 00000000e8c4c5da, %asi = 80
	swapa	[%i5+0x014]%asi,%l0	! %l0 = 00000000567adac5
!	%f25 = 680a0a11, Mem[0000000030181400] = 6836503c
	sta	%f25,[%i6+%g0]0x89	! Mem[0000000030181400] = 680a0a11
!	%l6 = 000000000000580f, Mem[0000000010081400] = 7e8e44b839005ee9
	stxa	%l6,[%i2+%g0]0x80	! Mem[0000000010081400] = 000000000000580f
!	%l0 = 00000000567adac5, imm = fffffffffffff8cd, %l7 = ffffffffd4df8bac
	sub	%l0,-0x733,%l7		! %l7 = 00000000567ae1f8
!	Mem[00000000100c1400] = 297a4118, %l0 = 00000000567adac5
	ldstuba	[%i3+%g0]0x80,%l0	! %l0 = 0000000000000029
!	Mem[0000000010001430] = 106c167c277aff1d, %l6 = 000000000000580f, %l6 = 000000000000580f
	add	%i0,0x30,%g1
	casxa	[%g1]0x80,%l6,%l6	! %l6 = 106c167c277aff1d
!	Mem[0000000010181400] = 38d60dff, %l5 = 0000000006e4d02a
	ldstuba	[%i6+%g0]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[00000000100c1408] = 2ac54516, %l4 = 000000006836503c
	swapa	[%i3+%o4]0x80,%l4	! %l4 = 000000002ac54516
!	%l6 = 106c167c277aff1d, Mem[0000000010101410] = ff6f43e40a49f5e5
	stxa	%l6,[%i4+%o5]0x80	! Mem[0000000010101410] = 106c167c277aff1d
!	%l3 = 00000000262eff0f, Mem[0000000030081410] = 659eb65417a95895
	stxa	%l3,[%i2+%o5]0x81	! Mem[0000000030081410] = 00000000262eff0f

p0_label_6:
!	Starting 10 instruction Load Burst
!	Mem[0000000021800000] = 1a90db58, %l3 = 00000000262eff0f
	lduh	[%o3+%g0],%l3		! %l3 = 0000000000001a90
!	Mem[0000000030081410] = 00000000262eff0f, %f0  = 0ab23858 734b0369
	ldda	[%i2+%o5]0x81,%f0 	! %f0  = 00000000 262eff0f
!	Mem[0000000010041400] = 09c057275838b238, %l0 = 0000000000000029
	ldxa	[%i1+%g0]0x88,%l0	! %l0 = 09c057275838b238
!	Mem[0000000010181400] = ff0dd638, %l0 = 09c057275838b238
	lduba	[%i6+%g0]0x80,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030001400] = f76069e5, %f18 = 731955e6
	lda	[%i0+%g0]0x89,%f18	! %f18 = f76069e5
!	Mem[0000000030101408] = 0b4b6226, %l7 = 00000000567ae1f8
	ldsha	[%i4+%o4]0x81,%l7	! %l7 = 0000000000000b4b
!	%l5 = 00000000000000ff, immd = 00000d1f, %y  = 00000000
	smul	%l5,0xd1f,%l3		! %l3 = 00000000000d11e1, %y = 00000000
!	Mem[0000000010041410] = 0785c4c4, %l6 = 106c167c277aff1d
	ldsba	[%i1+%o5]0x80,%l6	! %l6 = 0000000000000007
!	Mem[0000000010081410] = 3991ff242f93bc25, %f22 = 30a77fb2 1f3089bb, %asi = 80
	ldda	[%i2+0x010]%asi,%f22	! %f22 = 3991ff24 2f93bc25
!	Mem[0000000030141410] = 746d9658, %l0 = 00000000000000ff
	lduba	[%i5+%o5]0x89,%l0	! %l0 = 0000000000000058

p0_label_7:
!	Starting 10 instruction Store Burst
!	%l5 = 00000000000000ff, Mem[0000000030041400] = 7949103188c04b04
	stxa	%l5,[%i1+%g0]0x89	! Mem[0000000030041400] = 00000000000000ff
!	%f30 = 12802c8a 50c09c33, %l2 = 2feccb3256e48bac
!	Mem[0000000010081438] = 2d2e1f5a74c8c1c3
	add	%i2,0x038,%g1
	stda	%f30,[%g1+%l2]ASI_PST8_P ! Mem[0000000010081438] = 122e2c5a50c0c1c3
!	Mem[00000000100c143c] = 3202a1a3, %l0 = 0000000000000058
	swap	[%i3+0x03c],%l0		! %l0 = 000000003202a1a3
!	%f12 = 0d3359bc 2d622d5d, Mem[00000000300c1400] = 48b9b918 39e71353
	stda	%f12,[%i3+%g0]0x89	! Mem[00000000300c1400] = 0d3359bc 2d622d5d
!	%l0 = 000000003202a1a3, Mem[000000001010141c] = 2d850d0b, %asi = 80
	stha	%l0,[%i4+0x01c]%asi	! Mem[000000001010141c] = a1a30d0b
!	%f30 = 12802c8a 50c09c33, Mem[0000000030101408] = 0b4b6226 08aec9df
	stda	%f30,[%i4+%o4]0x81	! Mem[0000000030101408] = 12802c8a 50c09c33
!	%l5 = 00000000000000ff, Mem[0000000010101410] = 106c167c277aff1d
	stx	%l5,[%i4+%o5]		! Mem[0000000010101410] = 00000000000000ff
!	%l2 = 2feccb3256e48bac, Mem[0000000010081400] = 00000000, %asi = 80
	stha	%l2,[%i2+0x000]%asi	! Mem[0000000010081400] = 8bac0000
!	Mem[0000000010081410] = 3991ff24, %l5 = 00000000000000ff
	ldstuba	[%i2+%o5]0x80,%l5	! %l5 = 0000000000000039
!	%f9  = 1efce2a1, %f24 = 2f6c1200, %f21 = 610cc515
	fdivs	%f9 ,%f24,%f21		! %f21 = 2f091e05

p0_label_8:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = 7d743b36, %l0 = 000000003202a1a3
	ldsba	[%i6+%o4]0x80,%l0	! %l0 = 000000000000007d
!	Mem[0000000030101400] = cd2fcd6b, %l5 = 0000000000000039
	lduba	[%i4+%g0]0x81,%l5	! %l5 = 00000000000000cd
!	Mem[0000000010101417] = 000000ff, %l5 = 00000000000000cd
	ldsb	[%i4+0x017],%l5		! %l5 = ffffffffffffffff
!	Mem[0000000030141400] = 6d777208, %l5 = ffffffffffffffff
	ldsha	[%i5+%g0]0x81,%l5	! %l5 = 0000000000006d77
!	Mem[0000000010001408] = bd7c8b5656e48bac, %l4 = 000000002ac54516
	ldxa	[%i0+%o4]0x88,%l4	! %l4 = bd7c8b5656e48bac
!	Mem[0000000030141408] = 261d3ef6, %l1 = 0000000000000785
	ldsha	[%i5+%o4]0x81,%l1	! %l1 = 000000000000261d
!	Mem[0000000030041408] = 2ad0e406, %l6 = 0000000000000007
	lduba	[%i1+%o4]0x81,%l6	! %l6 = 000000000000002a
!	Mem[0000000010041400] = 09c05727 5838b238, %l0 = 0000007d, %l1 = 0000261d
	ldda	[%i1+%g0]0x88,%l0	! %l0 = 000000005838b238 0000000009c05727
!	Mem[0000000010141410] = 444e763b, %l5 = 0000000000006d77
	lduba	[%i5+%o5]0x88,%l5	! %l5 = 000000000000003b
!	Mem[0000000030001408] = 392c44a6, %l6 = 000000000000002a
	ldsha	[%i0+%o4]0x81,%l6	! %l6 = 000000000000392c

p0_label_9:
!	Starting 10 instruction Store Burst
!	Mem[0000000030041410] = f403ea39, %l2 = 2feccb3256e48bac
	ldstuba	[%i1+%o5]0x89,%l2	! %l2 = 0000000000000039
!	%f13 = 2d622d5d, Mem[0000000010181400] = 38d60dff
	sta	%f13,[%i6+%g0]0x88	! Mem[0000000010181400] = 2d622d5d
!	%l1 = 0000000009c05727, Mem[00000000100c1418] = 0fb8d5e2, %asi = 80
	stwa	%l1,[%i3+0x018]%asi	! Mem[00000000100c1418] = 09c05727
!	Mem[0000000010141418] = 1f6bf0a2, %l3 = 00000000000d11e1
	swap	[%i5+0x018],%l3		! %l3 = 000000001f6bf0a2
!	%f24 = 2f6c1200 680a0a11, %l0 = 000000005838b238
!	Mem[0000000010101418] = 65632b42a1a30d0b
	add	%i4,0x018,%g1
	stda	%f24,[%g1+%l0]ASI_PST32_PL ! Mem[0000000010101418] = 65632b42a1a30d0b
!	%f18 = f76069e5 11d9969f, %l0 = 000000005838b238
!	Mem[0000000010181428] = 27f29a8e3d0ebfa7
	add	%i6,0x028,%g1
	stda	%f18,[%g1+%l0]ASI_PST16_PL ! Mem[0000000010181428] = 27f29a8e3d0e60f7
!	Mem[00000000100c1430] = 5368399c, %l3 = 000000001f6bf0a2
	swap	[%i3+0x030],%l3		! %l3 = 000000005368399c
!	%o0 = deadbeefdeadbeef
	set	share0_start,%o0	! set %o0[0] to VA
!	%l6 = 000000000000392c, Mem[00000000201c0000] = 2ea99298, %asi = 80
	stba	%l6,[%o0+0x000]%asi	! Mem[00000000201c0000] = 2ca99298
!	%l0 = 5838b238, %l1 = 09c05727, Mem[0000000030101408] = 8a2c8012 339cc050
	stda	%l0,[%i4+%o4]0x89	! Mem[0000000030101408] = 5838b238 09c05727
!	%o1 = deadbeefdeadbeef
	set	share1_start,%o1	! set %o1[0] to VA
!	%l3 = 000000005368399c, Mem[0000000020800000] = 1544eac8
	sth	%l3,[%o1+%g0]		! Mem[0000000020800000] = 399ceac8

p0_label_10:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = 767c894d, %l4 = bd7c8b5656e48bac
	ldstuba	[%i4+%o4]0x88,%l4	! %l4 = 000000000000004d
!	Mem[00000000201c0001] = 2ca99298, %l5 = 000000000000003b, %asi = 80
	ldsba	[%o0+0x001]%asi,%l5	! %l5 = ffffffffffffffa9
!	Mem[0000000010041410] = 0785c4c4, %l1 = 0000000009c05727
	ldsha	[%i1+%o5]0x80,%l1	! %l1 = 0000000000000785
	membar	#Sync			! Added by membar checker (1)
!	Mem[0000000030041400] = ff000000 00000000 2ad0e406 79b3983f
!	Mem[0000000030041410] = ffea03f4 1a2a6bb5 09e5e7d2 6d65bd5b
!	Mem[0000000030041420] = 7bc7b320 65cff2b1 6552c55e 403d3d37
!	Mem[0000000030041430] = 167d9a0c 5e46fa6d 49c3a8aa 08aa13d3
	ldda	[%i1+%g0]ASI_BLK_AIUS,%f0 	! Block Load from 0000000030041400
!	Mem[0000000010041410] = 0785c4c4, %l1 = 0000000000000785
	ldswa	[%i1+%o5]0x80,%l1	! %l1 = 000000000785c4c4
!	Mem[0000000030041408] = 2ad0e406, %l7 = 0000000000000b4b
	lduba	[%i1+%o4]0x81,%l7	! %l7 = 000000000000002a
!	Mem[0000000030041400] = 00000000 000000ff, %l6 = 0000392c, %l7 = 0000002a
	ldda	[%i1+%g0]0x89,%l6	! %l6 = 00000000000000ff 0000000000000000
!	Mem[00000000300c1408] = 7cc872c6, %l1 = 000000000785c4c4
	lduha	[%i3+%o4]0x81,%l1	! %l1 = 0000000000007cc8
!	Mem[0000000010181408] = 7d743b36, %l7 = 0000000000000000
	lduba	[%i6+%o4]0x80,%l7	! %l7 = 000000000000007d
!	%f11 = 403d3d37, %f29 = 6bcd2fcd, %f26 = 3f1e633e
	fadds	%f11,%f29,%f26		! %f26 = 6bcd2fcd

p0_label_11:
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (2)
!	%l4 = 000000000000004d, Mem[0000000030041400] = ff00000000000000
	stxa	%l4,[%i1+%g0]0x81	! Mem[0000000030041400] = 000000000000004d
!	Mem[00000000300c1410] = b458121a, %l6 = 00000000000000ff
	ldstuba	[%i3+%o5]0x89,%l6	! %l6 = 000000000000001a
!	%l7 = 000000000000007d, Mem[0000000030081400] = e8c4c5da
	stwa	%l7,[%i2+%g0]0x89	! Mem[0000000030081400] = 0000007d
!	Mem[0000000010001410] = 647a0074, %l5 = 00000000ffffffa9
	swapa	[%i0+%o5]0x88,%l5	! %l5 = 00000000647a0074
!	%l0 = 000000005838b238, Mem[0000000030081400] = 0000007d
	stba	%l0,[%i2+%g0]0x89	! Mem[0000000030081400] = 00000038
!	%l6 = 000000000000001a, Mem[0000000030041410] = ffea03f41a2a6bb5
	stxa	%l6,[%i1+%o5]0x81	! Mem[0000000030041410] = 000000000000001a
!	%f20 = c2970710 2f091e05, %l1 = 0000000000007cc8
!	Mem[0000000030141438] = 16ee6e2a4a705353
	add	%i5,0x038,%g1
	stda	%f20,[%g1+%l1]ASI_PST16_S ! Mem[0000000030141438] = c2976e2a4a705353
!	%l2 = 0000000000000039, imm = fffffffffffff035, %l7 = 000000000000007d
	xnor	%l2,-0xfcb,%l7		! %l7 = 0000000000000ff3
!	%f10 = 6552c55e 403d3d37, Mem[00000000300c1408] = c672c87c ffb3242b
	stda	%f10,[%i3+%o4]0x89	! Mem[00000000300c1408] = 6552c55e 403d3d37
!	%f30 = 12802c8a 50c09c33, %l3 = 000000005368399c
!	Mem[0000000030081420] = 4bcf73802e14f591
	add	%i2,0x020,%g1
	stda	%f30,[%g1+%l3]ASI_PST8_S ! Mem[0000000030081420] = 12cf738a50c0f591

p0_label_12:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = d809e229, %l5 = 00000000647a0074
	lduwa	[%i5+%g0]0x88,%l5	! %l5 = 00000000d809e229
!	Mem[0000000010081408] = 68ac7db6, %f5  = 1a2a6bb5
	lda	[%i2+%o4]0x80,%f5 	! %f5 = 68ac7db6
!	Mem[0000000030081400] = 38000000, %l1 = 0000000000007cc8
	ldswa	[%i2+%g0]0x81,%l1	! %l1 = 0000000038000000
!	Mem[0000000010101434] = 2262e29d, %l2 = 0000000000000039, %asi = 80
	lduba	[%i4+0x034]%asi,%l2	! %l2 = 0000000000000022
!	Mem[0000000010181408] = 363b747d, %l4 = 000000000000004d
	lduba	[%i6+%o4]0x88,%l4	! %l4 = 000000000000007d
!	%l0 = 5838b238, %l1 = 38000000, Mem[0000000010081400] = 0000ac8b 0f580000
	stda	%l0,[%i2+%g0]0x88	! Mem[0000000010081400] = 5838b238 38000000
!	%l3 = 000000005368399c, %l1 = 0000000038000000, %y  = 00000000
	sdiv	%l3,%l1,%l0		! %l0 = 0000000000000001
	mov	%l0,%y			! %y = 00000001
!	%o2 = deadbeefdeadbeef
	set	share2_start,%o2	! set %o2[0] to VA
!	Mem[00000000211c0000] = 10ad8f28, %l4 = 000000000000007d
	ldub	[%o2+%g0],%l4		! %l4 = 0000000000000010
!	Mem[00000000211c0001] = 10ad8f28, %l0 = 0000000000000001
	ldsb	[%o2+0x001],%l0		! %l0 = ffffffffffffffad
!	Mem[0000000030081410] = 00000000, %l5 = 00000000d809e229
	lduwa	[%i2+%o5]0x89,%l5	! %l5 = 0000000000000000

p0_label_13:
!	Starting 10 instruction Store Burst
!	Mem[0000000010141418] = 000d11e1, %l3 = 5368399c, %l6 = 0000001a
	add	%i5,0x18,%g1
	casa	[%g1]0x80,%l3,%l6	! %l6 = 00000000000d11e1
!	Mem[00000000100c1400] = ff7a4118, %l1 = 0000000038000000
	swapa	[%i3+%g0]0x80,%l1	! %l1 = 00000000ff7a4118
!	%f8  = 7bc7b320 65cff2b1, Mem[0000000010081428] = 66a46d0e 10f3b827
	std	%f8 ,[%i2+0x028]	! Mem[0000000010081428] = 7bc7b320 65cff2b1
!	%l2 = 0000000000000022, Mem[00000000211c0000] = 10ad8f28
	sth	%l2,[%o2+%g0]		! Mem[00000000211c0000] = 00228f28
!	Mem[0000000010181400] = 2d622d5d, %l4 = 0000000000000010
	ldstuba	[%i6+%g0]0x88,%l4	! %l4 = 000000000000005d
!	%l2 = 0000000000000022, Mem[0000000030041400] = 00000000
	stba	%l2,[%i1+%g0]0x81	! Mem[0000000030041400] = 22000000
!	Mem[0000000030081400] = 00000038, %l6 = 00000000000d11e1
	swapa	[%i2+%g0]0x89,%l6	! %l6 = 0000000000000038
!	%l3 = 000000005368399c, Mem[00000000100c142e] = 58e9f207
	sth	%l3,[%i3+0x02e]		! Mem[00000000100c142c] = 58e9399c
!	%f19 = 11d9969f, Mem[0000000010101410] = 00000000
	sta	%f19,[%i4+%o5]0x88	! Mem[0000000010101410] = 11d9969f
!	Mem[0000000010041410] = 0785c4c4, %l6 = 0000000000000038
	swapa	[%i1+%o5]0x80,%l6	! %l6 = 000000000785c4c4

p0_label_14:
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = 392c44a6, %l4 = 000000000000005d
	lduwa	[%i0+%o4]0x81,%l4	! %l4 = 00000000392c44a6
!	Mem[0000000030141408] = 38a73d71f63e1d26, %f18 = f76069e5 11d9969f
	ldda	[%i5+%o4]0x89,%f18	! %f18 = 38a73d71 f63e1d26
!	%l6 = 000000000785c4c4, %l7 = 0000000000000ff3, %l6 = 000000000785c4c4
	addc	%l6,%l7,%l6		! %l6 = 000000000785d4b7
!	Code Fragment 4, seed = 586984
p0_fragment_1:
!	%l0 = ffffffffffffffad
	setx	0x00314662a24138e6,%g7,%l0 ! %l0 = 00314662a24138e6
!	%l1 = 00000000ff7a4118
	setx	0xd7b8273f119a9111,%g7,%l1 ! %l1 = d7b8273f119a9111
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 00314662a24138e6
	setx	0xcabfbda65eb80d4c,%g7,%l0 ! %l0 = cabfbda65eb80d4c
!	%l1 = d7b8273f119a9111
	setx	0x97c113488c3db097,%g7,%l1 ! %l1 = 97c113488c3db097
p0_fragment_1_end:
!	Mem[0000000030101400] = 6bcd2fcd, %l0 = cabfbda65eb80d4c
	lduwa	[%i4+%g0]0x89,%l0	! %l0 = 000000006bcd2fcd
!	Mem[0000000030181400] = 110a0a68 76afbbd9 08d790e6 41fe059f
!	Mem[0000000030181410] = ac8bdfd4 5918ec15 663eaab2 2b7428bb
!	Mem[0000000030181420] = 5b51d500 1b62e111 23217e3e 72b80697
!	Mem[0000000030181430] = 186fe1ec 2051b6cd 1bf2378a 2b279b33
	ldda	[%i6+%g0]ASI_BLK_S,%f0 	! Block Load from 0000000030181400
!	Mem[0000000030001400] = f76069e5, %l4 = 00000000392c44a6
	lduha	[%i0+%g0]0x89,%l4	! %l4 = 00000000000069e5
!	Mem[0000000010181410] = a5ef8402 a448580f, %l4 = 000069e5, %l5 = 00000000
	ldda	[%i6+%o5]0x88,%l4	! %l4 = 00000000a448580f 00000000a5ef8402
!	Mem[0000000020800040] = 680d3ef8, %l7 = 0000000000000ff3
	ldsh	[%o1+0x040],%l7		! %l7 = 000000000000680d
!	Mem[0000000010141400] = 895b7772d809e229, %f26 = 6bcd2fcd 6dee3797
	ldda	[%i5+%g0]0x88,%f26	! %f26 = 895b7772 d809e229

p0_label_15:
!	Starting 10 instruction Store Burst
!	%l0 = 000000006bcd2fcd, Mem[0000000030101410] = 14eb1c0f
	stba	%l0,[%i4+%o5]0x89	! Mem[0000000030101410] = 14eb1ccd
!	%l7 = 000000000000680d, %l5 = 00000000a5ef8402, %y  = 00000001
	smul	%l7,%l5,%l7		! %l7 = ffffdb64baca841a, %y = ffffdb64
!	%l1 = 97c113488c3db097, Mem[00000000300c1410] = b45812ff
	stha	%l1,[%i3+%o5]0x89	! Mem[00000000300c1410] = b458b097
!	Mem[00000000300c1408] = 373d3d40, %l6 = 000000000785d4b7
	ldstuba	[%i3+%o4]0x81,%l6	! %l6 = 0000000000000037
!	%l4 = a448580f, %l5 = a5ef8402, Mem[0000000030081410] = 00000000 262eff0f
	stda	%l4,[%i2+%o5]0x81	! Mem[0000000030081410] = a448580f a5ef8402
!	Mem[0000000010041410] = 00000038, %l5 = 00000000a5ef8402
	ldstuba	[%i1+%o5]0x80,%l5	! %l5 = 0000000000000000
!	%l3 = 000000005368399c, Mem[0000000030041408] = 06e4d02a
	stba	%l3,[%i1+%o4]0x89	! Mem[0000000030041408] = 06e4d09c
!	%l7 = ffffdb64baca841a, Mem[0000000010081400] = 380000005838b238
	stxa	%l7,[%i2+%g0]0x88	! Mem[0000000010081400] = ffffdb64baca841a
!	Mem[0000000030041408] = 06e4d09c, %l0 = 000000006bcd2fcd
	swapa	[%i1+%o4]0x89,%l0	! %l0 = 0000000006e4d09c
!	Mem[0000000010081408] = b67dac68, %l6 = 0000000000000037
	swapa	[%i2+%o4]0x88,%l6	! %l6 = 00000000b67dac68

p0_label_16:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = 29e209d8, %l3 = 000000005368399c
	lduha	[%i5+%g0]0x80,%l3	! %l3 = 00000000000029e2
!	Mem[0000000010041408] = 70272656, %l4 = 00000000a448580f
	lduba	[%i1+%o4]0x80,%l4	! %l4 = 0000000000000070
!	Mem[00000000218000c1] = 5c3aa7e8, %l2 = 0000000000000022
	ldub	[%o3+0x0c1],%l2		! %l2 = 000000000000003a
!	Mem[00000000300c1400] = 2d622d5d, %l4 = 0000000000000070
	ldsha	[%i3+%g0]0x89,%l4	! %l4 = 0000000000002d5d
!	Mem[0000000030081408] = 78fcf366 4c0e4e1f, %l6 = b67dac68, %l7 = baca841a
	ldda	[%i2+%o4]0x81,%l6	! %l6 = 0000000078fcf366 000000004c0e4e1f
!	Mem[0000000030141400] = 6d7772081f5044f9, %l1 = 97c113488c3db097
	ldxa	[%i5+%g0]0x81,%l1	! %l1 = 6d7772081f5044f9
!	Mem[0000000030001400] = f76069e5, %f18 = 38a73d71
	lda	[%i0+%g0]0x89,%f18	! %f18 = f76069e5
!	Mem[0000000010181408] = 7d743b362f6154af, %l7 = 000000004c0e4e1f
	ldxa	[%i6+%o4]0x80,%l7	! %l7 = 7d743b362f6154af
!	Mem[0000000010101400] = 1efce2a1, %l7 = 7d743b362f6154af
	lduha	[%i4+%g0]0x80,%l7	! %l7 = 0000000000001efc
!	Mem[0000000030101408] = 38b23858, %f27 = d809e229
	lda	[%i4+%o4]0x81,%f27	! %f27 = 38b23858

p0_label_17:
!	Starting 10 instruction Store Burst
!	%l5 = 0000000000000000, Mem[0000000010041414] = 7e1e6745
	stw	%l5,[%i1+0x014]		! Mem[0000000010041414] = 00000000
!	%f6  = 663eaab2 2b7428bb, Mem[0000000010181408] = 7d743b36 2f6154af
	stda	%f6 ,[%i6+%o4]0x80	! Mem[0000000010181408] = 663eaab2 2b7428bb
!	Mem[0000000010141410] = 3b764e44, %l2 = 000000000000003a
	swap	[%i5+%o5],%l2		! %l2 = 000000003b764e44
!	%l6 = 78fcf366, %l7 = 00001efc, Mem[0000000030081410] = a448580f a5ef8402
	stda	%l6,[%i2+%o5]0x81	! Mem[0000000030081410] = 78fcf366 00001efc
!	Mem[0000000010181408] = 663eaab2, %l5 = 0000000000000000
	swapa	[%i6+%o4]0x80,%l5	! %l5 = 00000000663eaab2
!	%l6 = 0000000078fcf366, Mem[00000000100c1428] = 1f25d06e58e9399c
	stx	%l6,[%i3+0x028]		! Mem[00000000100c1428] = 0000000078fcf366
!	Mem[000000001010140b] = ff897c76, %l2 = 000000003b764e44
	ldstub	[%i4+0x00b],%l2		! %l2 = 0000000000000076
!	%f1  = 76afbbd9, Mem[00000000100c1410] = 246b2984
	sta	%f1 ,[%i3+0x010]%asi	! Mem[00000000100c1410] = 76afbbd9
!	Mem[0000000030041400] = 00000022, %l1 = 6d7772081f5044f9
	ldstuba	[%i1+%g0]0x89,%l1	! %l1 = 0000000000000022
!	%f4  = ac8bdfd4 5918ec15, Mem[0000000010141408] = d6231164 cfb6b028
	stda	%f4 ,[%i5+%o4]0x88	! Mem[0000000010141408] = ac8bdfd4 5918ec15

p0_label_18:
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = 00228f28, %l0 = 0000000006e4d09c
	lduh	[%o2+%g0],%l0		! %l0 = 0000000000000022
!	Mem[0000000020800040] = 680d3ef8, %l1 = 0000000000000022, %asi = 80
	lduba	[%o1+0x040]%asi,%l1	! %l1 = 0000000000000068
!	Mem[0000000010141408] = 15ec1859, %l6 = 0000000078fcf366, %asi = 80
	lduba	[%i5+0x008]%asi,%l6	! %l6 = 0000000000000015
!	Mem[00000000300c1410] = 97b058b4, %l3 = 00000000000029e2
	lduba	[%i3+%o5]0x81,%l3	! %l3 = 0000000000000097
!	Mem[0000000030181410] = ac8bdfd4, %f11 = 72b80697
	lda	[%i6+%o5]0x81,%f11	! %f11 = ac8bdfd4
!	Mem[00000000100c1400] = c92dc37200000038, %l5 = 00000000663eaab2
	ldxa	[%i3+%g0]0x88,%l5	! %l5 = c92dc37200000038
!	Mem[0000000030101410] = cd1ceb14 3126c255, %l0 = 00000022, %l1 = 00000068
	ldda	[%i4+%o5]0x81,%l0	! %l0 = 00000000cd1ceb14 000000003126c255
!	Mem[0000000010001430] = 106c167c, %l2 = 0000000000000076, %asi = 80
	ldswa	[%i0+0x030]%asi,%l2	! %l2 = 00000000106c167c
!	Mem[0000000010001404] = 4fd15129, %l6 = 0000000000000015
	lduw	[%i0+0x004],%l6		! %l6 = 000000004fd15129
!	Mem[0000000010081400] = ffffdb64baca841a, %f2  = 08d790e6 41fe059f
	ldda	[%i2+%g0]0x88,%f2 	! %f2  = ffffdb64 baca841a

p0_label_19:
!	Starting 10 instruction Store Burst
!	Mem[0000000010101410] = 9f96d911, %l7 = 0000000000001efc
	ldstuba	[%i4+%o5]0x80,%l7	! %l7 = 000000000000009f
!	%f31 = 50c09c33, Mem[0000000010001408] = 56e48bac
	sta	%f31,[%i0+%o4]0x88	! Mem[0000000010001408] = 50c09c33
!	%l7 = 000000000000009f, Mem[0000000010141408] = 15ec1859
	stw	%l7,[%i5+%o4]		! Mem[0000000010141408] = 0000009f
!	Mem[0000000010141408] = 9f000000, %l7 = 000000000000009f
	ldstuba	[%i5+%o4]0x88,%l7	! %l7 = 0000000000000000
	membar	#Sync			! Added by membar checker (3)
!	%f16 = 5bb85368 674144d9, Mem[0000000030181400] = 680a0a11 d9bbaf76
	stda	%f16,[%i6+%g0]0x89	! Mem[0000000030181400] = 5bb85368 674144d9
!	Mem[0000000010001408] = 50c09c33, %l3 = 0000000000000097
	ldstuba	[%i0+%o4]0x88,%l3	! %l3 = 0000000000000033
!	Mem[0000000010081418] = 7fd4f082, %l0 = 00000000cd1ceb14
	swap	[%i2+0x018],%l0		! %l0 = 000000007fd4f082
!	Mem[000000001018141c] = 0c9164cb, %l0 = 000000007fd4f082
	ldstub	[%i6+0x01c],%l0		! %l0 = 000000000000000c
!	%l5 = c92dc37200000038, imm = fffffffffffffc08, %l5 = c92dc37200000038
	add	%l5,-0x3f8,%l5		! %l5 = c92dc371fffffc40
!	Mem[0000000030141408] = f63e1d26, %l6 = 000000004fd15129
	swapa	[%i5+%o4]0x89,%l6	! %l6 = 00000000f63e1d26

p0_label_20:
!	Starting 10 instruction Load Burst
!	%l6 = 00000000f63e1d26, imm = fffffffffffff51d, %l0 = 000000000000000c
	xor	%l6,-0xae3,%l0		! %l0 = ffffffff09c1e83b
!	Mem[0000000010181408] = bb28742b00000000, %l5 = c92dc371fffffc40
	ldxa	[%i6+%o4]0x88,%l5	! %l5 = bb28742b00000000
	membar	#Sync			! Added by membar checker (4)
!	Mem[0000000010001400] = 0f8e1bf8 4fd15129 ff9cc050 568b7cbd
!	Mem[0000000010001410] = a9ffffff 66a24265 630075c2 371c9d8b
!	Mem[0000000010001420] = 0ef13490 652bc861 13ff9938 00000058
!	Mem[0000000010001430] = 106c167c 277aff1d 47baaeec 6fb31203
	ldda	[%i0+%g0]ASI_BLK_P,%f16	! Block Load from 0000000010001400
!	Mem[0000000030101408] = 38b238582757c009, %f8  = 5b51d500 1b62e111
	ldda	[%i4+%o4]0x81,%f8 	! %f8  = 38b23858 2757c009
!	Mem[00000000201c0001] = 2ca99298, %l0 = ffffffff09c1e83b
	ldsb	[%o0+0x001],%l0		! %l0 = ffffffffffffffa9
!	Mem[0000000030041400] = 4d000000 000000ff, %l2 = 106c167c, %l3 = 00000033
	ldda	[%i1+%g0]0x89,%l2	! %l2 = 00000000000000ff 000000004d000000
!	Mem[0000000030001408] = a6442c39, %f14 = 1bf2378a
	lda	[%i0+%o4]0x89,%f14	! %f14 = a6442c39
!	Mem[0000000010181400] = 2d622dff, %l7 = 0000000000000000
	lduba	[%i6+%g0]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030081400] = e1110d00, %f5  = 5918ec15
	lda	[%i2+%g0]0x81,%f5 	! %f5 = e1110d00
!	Mem[0000000010001410] = a9ffffff66a24265, %f12 = 186fe1ec 2051b6cd
	ldda	[%i0+%o5]0x80,%f12	! %f12 = a9ffffff 66a24265

p0_label_21:
!	Starting 10 instruction Store Burst
!	Code Fragment 3, seed = 703783
p0_fragment_2:
!	%l0 = ffffffffffffffa9
	setx	0x4a54656539ca65ee,%g7,%l0 ! %l0 = 4a54656539ca65ee
!	%l1 = 000000003126c255
	setx	0x1e1f3c3bac26cf99,%g7,%l1 ! %l1 = 1e1f3c3bac26cf99
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 4a54656539ca65ee
	setx	0xa1dbf1fc1758a554,%g7,%l0 ! %l0 = a1dbf1fc1758a554
!	%l1 = 1e1f3c3bac26cf99
	setx	0x1f7e1495e0e16a1f,%g7,%l1 ! %l1 = 1f7e1495e0e16a1f
p0_fragment_2_end:
!	%l7 = 00000000000000ff, Mem[0000000010041438] = 72634dfa
	sth	%l7,[%i1+0x038]		! Mem[0000000010041438] = 00ff4dfa
!	%f22 = 630075c2 371c9d8b, Mem[0000000010081400] = 1a84caba 64dbffff
	stda	%f22,[%i2+%g0]0x80	! Mem[0000000010081400] = 630075c2 371c9d8b
!	%f6  = 663eaab2 2b7428bb, Mem[0000000030041408] = cd2fcd6b 79b3983f
	stda	%f6 ,[%i1+%o4]0x81	! Mem[0000000030041408] = 663eaab2 2b7428bb
!	%f12 = a9ffffff 66a24265, Mem[0000000030041400] = ff000000 0000004d
	stda	%f12,[%i1+%g0]0x81	! Mem[0000000030041400] = a9ffffff 66a24265
!	%l3 = 000000004d000000, Mem[0000000030001410] = 3b1c4194
	stwa	%l3,[%i0+%o5]0x81	! Mem[0000000030001410] = 4d000000
!	Mem[00000000300c1408] = ff3d3d40, %l1 = 00000000e0e16a1f
	swapa	[%i3+%o4]0x81,%l1	! %l1 = 00000000ff3d3d40
!	%f9  = 2757c009, Mem[0000000030101408] = 5838b238
	sta	%f9 ,[%i4+%o4]0x89	! Mem[0000000030101408] = 2757c009
!	Mem[0000000010141410] = 0000003ae8c4c5da, %l2 = 00000000000000ff, %l5 = bb28742b00000000
	add	%i5,0x10,%g1
	casxa	[%g1]0x80,%l2,%l5	! %l5 = 0000003ae8c4c5da
!	%l2 = 000000ff, %l3 = 4d000000, Mem[0000000030081400] = 000d11e1 5900477a
	stda	%l2,[%i2+%g0]0x89	! Mem[0000000030081400] = 000000ff 4d000000

p0_label_22:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = 69ba58702d622dff, %l7 = 00000000000000ff
	ldxa	[%i6+%g0]0x88,%l7	! %l7 = 69ba58702d622dff
!	Mem[0000000030041400] = a9ffffff, %l1 = 00000000ff3d3d40
	lduha	[%i1+%g0]0x81,%l1	! %l1 = 000000000000a9ff
!	Mem[0000000010041408] = 70272656, %f5  = e1110d00
	lda	[%i1+%o4]0x80,%f5 	! %f5 = 70272656
!	Mem[0000000010101410] = ff96d911, %f2  = ffffdb64
	lda	[%i4+%o5]0x80,%f2 	! %f2 = ff96d911
!	Mem[00000000201c0000] = 2ca99298, %l6 = 00000000f63e1d26, %asi = 80
	lduha	[%o0+0x000]%asi,%l6	! %l6 = 0000000000002ca9
!	Code Fragment 4, seed = 648853
p0_fragment_3:
!	%l0 = a1dbf1fc1758a554
	setx	0x0330151ab69be87e,%g7,%l0 ! %l0 = 0330151ab69be87e
!	%l1 = 000000000000a9ff
	setx	0x6dae295610600d29,%g7,%l1 ! %l1 = 6dae295610600d29
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 0330151ab69be87e
	setx	0x38912f08ad48ade4,%g7,%l0 ! %l0 = 38912f08ad48ade4
!	%l1 = 6dae295610600d29
	setx	0x0ebd30295aea4daf,%g7,%l1 ! %l1 = 0ebd30295aea4daf
p0_fragment_3_end:
!	Mem[00000000300c1400] = 2d622d5d, %l2 = 00000000000000ff
	lduba	[%i3+%g0]0x89,%l2	! %l2 = 000000000000005d
!	Mem[0000000030101400] = cd2fcd6b 2b6efe19, %l6 = 00002ca9, %l7 = 2d622dff
	ldda	[%i4+%g0]0x81,%l6	! %l6 = 00000000cd2fcd6b 000000002b6efe19
!	Mem[0000000030101410] = 55c22631 14eb1ccd, %l0 = ad48ade4, %l1 = 5aea4daf
	ldda	[%i4+%o5]0x89,%l0	! %l0 = 0000000014eb1ccd 0000000055c22631
!	Mem[0000000010081426] = 397b6e21, %l3 = 000000004d000000, %asi = 80
	ldsha	[%i2+0x026]%asi,%l3	! %l3 = 0000000000006e21

p0_label_23:
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1400] = 38000000, %l2 = 000000000000005d
	swapa	[%i3+%g0]0x80,%l2	! %l2 = 0000000038000000
!	%l7 = 000000002b6efe19, Mem[0000000030101400] = cd2fcd6b2b6efe19
	stxa	%l7,[%i4+%g0]0x81	! Mem[0000000030101400] = 000000002b6efe19
!	%l3 = 0000000000006e21, Mem[0000000010101400] = a1e2fc1e
	stwa	%l3,[%i4+%g0]0x88	! Mem[0000000010101400] = 00006e21
!	Mem[0000000010101438] = 2ef9121a, %l6 = cd2fcd6b, %l7 = 2b6efe19
	add	%i4,0x38,%g1
	casa	[%g1]0x80,%l6,%l7	! %l7 = 000000002ef9121a
!	Code Fragment 4, seed = 267743
p0_fragment_4:
!	%l0 = 0000000014eb1ccd
	setx	0xed657aa9e74dd82e,%g7,%l0 ! %l0 = ed657aa9e74dd82e
!	%l1 = 0000000055c22631
	setx	0x7a012e11bcecadd9,%g7,%l1 ! %l1 = 7a012e11bcecadd9
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = ed657aa9e74dd82e
	setx	0x546081d929452f94,%g7,%l0 ! %l0 = 546081d929452f94
!	%l1 = 7a012e11bcecadd9
	setx	0x1200b0be31a4e05f,%g7,%l1 ! %l1 = 1200b0be31a4e05f
p0_fragment_4_end:
!	Mem[0000000030041400] = ffffffa9, %l0 = 0000000029452f94
	swapa	[%i1+%g0]0x89,%l0	! %l0 = 00000000ffffffa9
!	%f23 = 371c9d8b, Mem[0000000010141400] = 29e209d8
	sta	%f23,[%i5+%g0]0x80	! Mem[0000000010141400] = 371c9d8b
!	%l4 = 0000000000002d5d, Mem[0000000030041410] = 1a00000000000000
	stxa	%l4,[%i1+%o5]0x89	! Mem[0000000030041410] = 0000000000002d5d
!	%l1 = 1200b0be31a4e05f, Mem[0000000010081400] = c2750063
	stba	%l1,[%i2+%g0]0x88	! Mem[0000000010081400] = c275005f
!	Mem[0000000010041410] = 380000ff, %l0 = 00000000ffffffa9
	ldsba	[%i1+%o5]0x88,%l0	! %l0 = ffffffffffffffff

p0_label_24:
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = ff000000, %l7 = 000000002ef9121a
	lduba	[%i2+%g0]0x81,%l7	! %l7 = 00000000000000ff
!	Mem[000000001014142a] = 3fb4e72e, %l0 = ffffffffffffffff
	ldsb	[%i5+0x02a],%l0		! %l0 = ffffffffffffffe7
!	Mem[0000000030081400] = ff000000, %l2 = 0000000038000000
	lduha	[%i2+%g0]0x81,%l2	! %l2 = 000000000000ff00
!	Mem[00000000300c1408] = 6552c55e1f6ae1e0, %f10 = 23217e3e ac8bdfd4
	ldda	[%i3+%o4]0x89,%f10	! %f10 = 6552c55e 1f6ae1e0
!	Mem[0000000030101410] = cd1ceb143126c255, %l4 = 0000000000002d5d
	ldxa	[%i4+%o5]0x81,%l4	! %l4 = cd1ceb143126c255
!	Mem[0000000010181410] = a448580f, %l2 = 000000000000ff00
	ldsha	[%i6+%o5]0x88,%l2	! %l2 = 000000000000580f
!	%f12 = a9ffffff, %f8  = 38b23858
	fcmpes	%fcc2,%f12,%f8 		! %fcc2 = 1
!	Mem[0000000010081420] = 1f22d550, %l3 = 0000000000006e21, %asi = 80
	lduha	[%i2+0x020]%asi,%l3	! %l3 = 0000000000001f22
!	Mem[0000000010081428] = 7bc7b320, %f7  = 2b7428bb
	ld	[%i2+0x028],%f7 	! %f7 = 7bc7b320
!	Mem[00000000300c1400] = 5d2d622d bc59330d, %l2 = 0000580f, %l3 = 00001f22
	ldda	[%i3+%g0]0x81,%l2	! %l2 = 000000005d2d622d 00000000bc59330d

p0_label_25:
!	Starting 10 instruction Store Burst
!	Mem[0000000010001400] = 0f8e1bf8, %l0 = ffffffffffffffe7
	ldstuba	[%i0+%g0]0x80,%l0	! %l0 = 000000000000000f
!	%l6 = 00000000cd2fcd6b, Mem[00000000211c0000] = 00228f28, %asi = 80
	stha	%l6,[%o2+0x000]%asi	! Mem[00000000211c0000] = cd6b8f28
!	Mem[0000000010001408] = ff9cc050, %l5 = 0000003ae8c4c5da
	ldstuba	[%i0+%o4]0x80,%l5	! %l5 = 00000000000000ff
!	Mem[00000000100c1410] = 76afbbd9, %l4 = 000000003126c255
	swapa	[%i3+%o5]0x80,%l4	! %l4 = 0000000076afbbd9
!	Mem[0000000010001410] = a9ffffff66a24265, %l1 = 1200b0be31a4e05f, %l2 = 000000005d2d622d
	add	%i0,0x10,%g1
	casxa	[%g1]0x80,%l1,%l2	! %l2 = a9ffffff66a24265
!	%l2 = a9ffffff66a24265, Mem[0000000030081410] = fc1e000066f3fc78
	stxa	%l2,[%i2+%o5]0x89	! Mem[0000000030081410] = a9ffffff66a24265
!	Mem[00000000100c1410] = 55c22631, %l0 = 000000000000000f
	swapa	[%i3+%o5]0x88,%l0	! %l0 = 0000000055c22631
!	%l0 = 0000000055c22631, Mem[0000000030001408] = a6442c39
	stha	%l0,[%i0+%o4]0x89	! Mem[0000000030001408] = a6442631
!	%l0 = 55c22631, %l1 = 31a4e05f, Mem[0000000030001408] = 312644a6 4e5c925f
	stda	%l0,[%i0+%o4]0x81	! Mem[0000000030001408] = 55c22631 31a4e05f
!	%f22 = 630075c2 371c9d8b, Mem[00000000300c1410] = 97b058b4 6ed57575
	stda	%f22,[%i3+%o5]0x81	! Mem[00000000300c1410] = 630075c2 371c9d8b

p0_label_26:
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (5)
!	Mem[00000000100c1400] = 0000005d 72c32dc9 6836503c 262eff0f
!	Mem[00000000100c1410] = 0f000000 6a7a4105 09c05727 1248e92b
!	Mem[00000000100c1420] = 3b188db0 4cdb8901 00000000 78fcf366
!	Mem[00000000100c1430] = 1f6bf0a2 642621bd 162d60ba 00000058
	ldda	[%i3+%g0]ASI_BLK_P,%f16	! Block Load from 00000000100c1400
!	Mem[0000000010101400] = 216e0000, %l7 = 00000000000000ff
	ldsba	[%i4+%g0]0x80,%l7	! %l7 = 0000000000000021
!	Mem[0000000030101408] = 2757c009, %f12 = a9ffffff
	lda	[%i4+%o4]0x89,%f12	! %f12 = 2757c009
!	Mem[00000000300c1400] = 5d2d622d, %l4 = 0000000076afbbd9
	lduba	[%i3+%g0]0x81,%l4	! %l4 = 000000000000005d
!	Mem[0000000010181400] = 69ba58702d622dff, %l0 = 0000000055c22631
	ldxa	[%i6+%g0]0x88,%l0	! %l0 = 69ba58702d622dff
!	Mem[000000001014141c] = 05dfe0eb, %f9  = 2757c009
	ld	[%i5+0x01c],%f9 	! %f9 = 05dfe0eb
!	Mem[0000000030181408] = 08d790e6, %l4 = 000000000000005d
	lduha	[%i6+%o4]0x81,%l4	! %l4 = 00000000000008d7
!	Mem[000000001004141a] = 531f7b22, %l3 = 00000000bc59330d
	ldsh	[%i1+0x01a],%l3		! %l3 = 0000000000007b22
!	Mem[00000000300c1408] = 1f6ae1e0, %l7 = 0000000000000021
	ldsba	[%i3+%o4]0x89,%l7	! %l7 = ffffffffffffffe0
!	%f1  = 76afbbd9, %f6  = 663eaab2
	fcmpes	%fcc3,%f1 ,%f6 		! %fcc3 = 2

p0_label_27:
!	Starting 10 instruction Store Burst
!	Mem[0000000010101408] = ff7c89ff, %l4 = 00000000000008d7
	ldstuba	[%i4+%o4]0x88,%l4	! %l4 = 00000000000000ff
!	%f25 = 4cdb8901, Mem[00000000300c1400] = 5d2d622d
	sta	%f25,[%i3+%g0]0x81	! Mem[00000000300c1400] = 4cdb8901
!	%l2 = a9ffffff66a24265, Mem[0000000030001400] = e56960f7
	stha	%l2,[%i0+%g0]0x81	! Mem[0000000030001400] = 426560f7
!	Mem[0000000030041410] = 5d2d0000, %l2 = a9ffffff66a24265
	ldstuba	[%i1+%o5]0x81,%l2	! %l2 = 000000000000005d
!	%l6 = 00000000cd2fcd6b, Mem[0000000010101400] = 216e0000
	stwa	%l6,[%i4+%g0]0x80	! Mem[0000000010101400] = cd2fcd6b
!	Mem[0000000010101400] = 6bcd2fcd, %l5 = 00000000000000ff
	swapa	[%i4+%g0]0x88,%l5	! %l5 = 000000006bcd2fcd
!	%l2 = 000000000000005d, Mem[0000000010101414] = 000000ff, %asi = 80
	stha	%l2,[%i4+0x014]%asi	! Mem[0000000010101414] = 005d00ff
!	Mem[000000001004141b] = 531f7b22, %l3 = 0000000000007b22
	ldstuba	[%i1+0x01b]%asi,%l3	! %l3 = 0000000000000022
!	%f19 = 262eff0f, Mem[0000000010181428] = 27f29a8e
	sta	%f19,[%i6+0x028]%asi	! Mem[0000000010181428] = 262eff0f
!	Mem[0000000010141403] = 371c9d8b, %l1 = 1200b0be31a4e05f
	ldstub	[%i5+0x003],%l1		! %l1 = 000000000000008b

p0_label_28:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = dac5c4e83a000000, %l2 = 000000000000005d
	ldxa	[%i5+%o5]0x88,%l2	! %l2 = dac5c4e83a000000
!	Mem[0000000010041400] = 09c057275838b238, %l0 = 69ba58702d622dff
	ldxa	[%i1+%g0]0x88,%l0	! %l0 = 09c057275838b238
!	Mem[000000001018143e] = 0b0c6143, %l0 = 09c057275838b238, %asi = 80
	ldsha	[%i6+0x03e]%asi,%l0	! %l0 = 0000000000006143
!	Mem[000000001018141c] = ff9164cb, %l3 = 0000000000000022, %asi = 80
	lduwa	[%i6+0x01c]%asi,%l3	! %l3 = 00000000ff9164cb
!	Mem[0000000010101418] = 65632b42a1a30d0b, %l5 = 000000006bcd2fcd
	ldx	[%i4+0x018],%l5		! %l5 = 65632b42a1a30d0b
!	%l6 = 00000000cd2fcd6b, %l5 = 65632b42a1a30d0b, %l5 = 65632b42a1a30d0b
	xnor	%l6,%l5,%l5		! %l5 = 9a9cd4bd93733f9f
!	%f0  = 110a0a68, %f11 = 1f6ae1e0, %f6  = 663eaab2 7bc7b320
	fsmuld	%f0 ,%f11,%f6 		! %f6  = 361fa9d3 bfa0c000
!	Mem[0000000010101408] = ff897cff, %f3  = baca841a
	lda	[%i4+%o4]0x80,%f3 	! %f3 = ff897cff
!	Mem[0000000030181408] = 08d790e6, %f12 = 2757c009
	lda	[%i6+%o4]0x81,%f12	! %f12 = 08d790e6
!	Mem[00000000100c1400] = c92dc372 5d000000, %l2 = 3a000000, %l3 = ff9164cb
	ldda	[%i3+%g0]0x88,%l2	! %l2 = 000000005d000000 00000000c92dc372

p0_label_29:
!	Starting 10 instruction Store Burst
!	%l5 = 9a9cd4bd93733f9f, Mem[0000000030041408] = 663eaab2
	stba	%l5,[%i1+%o4]0x81	! Mem[0000000030041408] = 9f3eaab2
!	Mem[0000000030081400] = 000000ff, %l3 = 00000000c92dc372
	ldstuba	[%i2+%g0]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030081410] = 66a24265, %l1 = 000000000000008b
	ldstuba	[%i2+%o5]0x89,%l1	! %l1 = 0000000000000065
!	%l3 = 00000000000000ff, Mem[0000000020800000] = 399ceac8
	sth	%l3,[%o1+%g0]		! Mem[0000000020800000] = 00ffeac8
!	Mem[0000000010001436] = 277aff1d, %l6 = 00000000cd2fcd6b
	ldstuba	[%i0+0x036]%asi,%l6	! %l6 = 00000000000000ff
!	%l5 = 9a9cd4bd93733f9f, Mem[0000000030101400] = 00000000
	stba	%l5,[%i4+%g0]0x89	! Mem[0000000030101400] = 0000009f
!	Mem[0000000010181410] = a448580f, %l6 = 00000000000000ff
	ldstuba	[%i6+%o5]0x88,%l6	! %l6 = 000000000000000f
!	Mem[0000000010081400] = 5f0075c2 371c9d8b 37000000 2eecfd2f
!	%f16 = 0000005d 72c32dc9 6836503c 262eff0f
!	%f20 = 0f000000 6a7a4105 09c05727 1248e92b
!	%f24 = 3b188db0 4cdb8901 00000000 78fcf366
!	%f28 = 1f6bf0a2 642621bd 162d60ba 00000058
	stda	%f16,[%i2+%g0]ASI_BLK_AIUP	! Block Store to 0000000010081400
!	%l2 = 000000005d000000, Mem[0000000030041400] = 29452f94
	stha	%l2,[%i1+%g0]0x89	! Mem[0000000030041400] = 29450000
!	Mem[00000000211c0001] = cd6b8f28, %l5 = 9a9cd4bd93733f9f
	ldstuba	[%o2+0x001]%asi,%l5	! %l5 = 000000000000006b

p0_label_30:
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = 4d000000, %l6 = 000000000000000f
	lduwa	[%i0+%o5]0x81,%l6	! %l6 = 000000004d000000
!	Mem[00000000300c1400] = 4cdb8901, %f11 = 1f6ae1e0
	lda	[%i3+%g0]0x81,%f11	! %f11 = 4cdb8901
!	Mem[0000000010101410] = 11d996ff, %l2 = 000000005d000000
	lduwa	[%i4+%o5]0x88,%l2	! %l2 = 0000000011d996ff
!	Mem[0000000030041408] = 9f3eaab2, %l1 = 0000000000000065
	ldsba	[%i1+%o4]0x81,%l1	! %l1 = ffffffffffffff9f
	membar	#Sync			! Added by membar checker (6)
!	Mem[0000000010081410] = 0f0000006a7a4105, %f2  = ff96d911 ff897cff
	ldda	[%i2+%o5]0x80,%f2 	! %f2  = 0f000000 6a7a4105
!	Mem[0000000030101410] = 55c2263114eb1ccd, %f12 = 08d790e6 66a24265
	ldda	[%i4+%o5]0x89,%f12	! %f12 = 55c22631 14eb1ccd
!	Mem[0000000020800000] = 00ffeac8, %l7 = ffffffffffffffe0
	lduh	[%o1+%g0],%l7		! %l7 = 00000000000000ff
!	Mem[0000000010141416] = e8c4c5da, %l6 = 000000004d000000
	ldsb	[%i5+0x016],%l6		! %l6 = ffffffffffffffc5
!	Mem[00000000300c1410] = c2750063, %l4 = 00000000000000ff
	ldswa	[%i3+%o5]0x89,%l4	! %l4 = ffffffffc2750063
!	Mem[0000000030141400] = 6d777208, %l5 = 000000000000006b
	lduha	[%i5+%g0]0x81,%l5	! %l5 = 0000000000006d77

p0_label_31:
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1410] = c2750063, %l5 = 0000000000006d77
	ldstuba	[%i3+%o5]0x89,%l5	! %l5 = 0000000000000063
!	%l3 = 00000000000000ff, Mem[0000000030101410] = 14eb1ccd
	stwa	%l3,[%i4+%o5]0x89	! Mem[0000000030101410] = 000000ff
!	%l0 = 0000000000006143, Mem[0000000030141408] = 4fd15129
	stwa	%l0,[%i5+%o4]0x89	! Mem[0000000030141408] = 00006143
!	%l2 = 11d996ff, %l3 = 000000ff, Mem[00000000100c1430] = 1f6bf0a2 642621bd
	std	%l2,[%i3+0x030]		! Mem[00000000100c1430] = 11d996ff 000000ff
!	Mem[0000000010001420] = 0ef13490, %l3 = 00000000000000ff, %asi = 80
	swapa	[%i0+0x020]%asi,%l3	! %l3 = 000000000ef13490
!	%l7 = 00000000000000ff, Mem[0000000010041410] = 380000ff
	stba	%l7,[%i1+%o5]0x88	! Mem[0000000010041410] = 380000ff
!	%f24 = 3b188db0 4cdb8901, %l1 = ffffffffffffff9f
!	Mem[0000000010001408] = ff9cc050568b7cbd
	add	%i0,0x008,%g1
	stda	%f24,[%g1+%l1]ASI_PST16_P ! Mem[0000000010001408] = 3b188db04cdb8901
!	Mem[0000000010141410] = 0000003a, %l5 = 00000063, %l0 = 00006143
	add	%i5,0x10,%g1
	casa	[%g1]0x80,%l5,%l0	! %l0 = 000000000000003a
!	%l0 = 000000000000003a, Mem[0000000010041400] = 5838b238
	stha	%l0,[%i1+%g0]0x88	! Mem[0000000010041400] = 5838003a
!	Mem[00000000100c1410] = 0000000f, %l2 = 0000000011d996ff
	ldstuba	[%i3+%o5]0x88,%l2	! %l2 = 000000000000000f

p0_label_32:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = 371c9dff, %l4 = ffffffffc2750063
	ldsh	[%i5+%g0],%l4		! %l4 = 000000000000371c
!	Mem[0000000010001400] = 2951d14f f81b8eff, %l6 = ffffffc5, %l7 = 000000ff
	ldda	[%i0+%g0]0x88,%l6	! %l6 = 00000000f81b8eff 000000002951d14f
!	Mem[000000001018140c] = 2b7428bb, %l3 = 000000000ef13490, %asi = 80
	ldsha	[%i6+0x00c]%asi,%l3	! %l3 = 0000000000002b74
!	%l2 = 000000000000000f, imm = fffffffffffffe65, %l2 = 000000000000000f
	add	%l2,-0x19b,%l2		! %l2 = fffffffffffffe74
!	Mem[0000000010141400] = ff9d1c37, %f28 = 1f6bf0a2
	lda	[%i5+%g0]0x88,%f28	! %f28 = ff9d1c37
!	Mem[00000000300c1408] = 1f6ae1e0, %l2 = fffffffffffffe74
	lduha	[%i3+%o4]0x89,%l2	! %l2 = 000000000000e1e0
!	Mem[0000000030001400] = 426560f7, %f11 = 4cdb8901
	lda	[%i0+%g0]0x81,%f11	! %f11 = 426560f7
!	%l4 = 000000000000371c, %l1 = ffffffffffffff9f, %l5 = 0000000000000063
	addc	%l4,%l1,%l5		! %l5 = 00000000000036bb
!	Mem[000000001014140a] = ff00009f, %l6 = 00000000f81b8eff
	ldsh	[%i5+0x00a],%l6		! %l6 = 000000000000009f
!	Mem[0000000010101400] = 000000ff, %l4 = 000000000000371c
	lduba	[%i4+%g0]0x88,%l4	! %l4 = 00000000000000ff

p0_label_33:
!	Starting 10 instruction Store Burst
!	%l3 = 0000000000002b74, Mem[0000000010181408] = 00000000
	stwa	%l3,[%i6+%o4]0x88	! Mem[0000000010181408] = 00002b74
!	%l4 = 00000000000000ff, Mem[0000000010181400] = ff2d622d7058ba69
	stxa	%l4,[%i6+%g0]0x80	! Mem[0000000010181400] = 00000000000000ff
!	%f4  = ac8bdfd4 70272656, %l3 = 0000000000002b74
!	Mem[0000000030041408] = 9f3eaab22b7428bb
	add	%i1,0x008,%g1
	stda	%f4,[%g1+%l3]ASI_PST8_S ! Mem[0000000030041408] = 9f8bdfd42b2728bb
!	%l6 = 000000000000009f, Mem[0000000010001400] = ff8e1bf84fd15129
	stxa	%l6,[%i0+%g0]0x80	! Mem[0000000010001400] = 000000000000009f
!	Mem[0000000030141408] = 43610000, %l4 = 00000000000000ff
	swapa	[%i5+%o4]0x81,%l4	! %l4 = 0000000043610000
!	%f24 = 3b188db0 4cdb8901, Mem[0000000010101400] = 000000ff a92c986e
	stda	%f24,[%i4+%g0]0x88	! Mem[0000000010101400] = 3b188db0 4cdb8901
!	Mem[000000001000141b] = 630075c2, %l2 = 000000000000e1e0
	ldstuba	[%i0+0x01b]%asi,%l2	! %l2 = 00000000000000c2
!	Mem[000000001000141b] = 630075ff, %l5 = 00000000000036bb
	ldstub	[%i0+0x01b],%l5		! %l5 = 00000000000000ff
!	Mem[00000000100c1437] = 000000ff, %l0 = 000000000000003a
	ldstuba	[%i3+0x037]%asi,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010101408] = ff897cff, %l2 = 00000000000000c2
	swapa	[%i4+%o4]0x80,%l2	! %l2 = 00000000ff897cff

p0_label_34:
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = 5bb85368 674144d9, %l4 = 43610000, %l5 = 000000ff
	ldda	[%i6+%g0]0x89,%l4	! %l4 = 00000000674144d9 000000005bb85368
!	Mem[0000000010181410] = a44858ff, %l4 = 00000000674144d9
	lduwa	[%i6+%o5]0x88,%l4	! %l4 = 00000000a44858ff
!	Mem[0000000030001400] = 426560f7, %l7 = 000000002951d14f
	ldsha	[%i0+%g0]0x81,%l7	! %l7 = 0000000000004265
!	Mem[0000000010141408] = ff00009f, %l6 = 000000000000009f
	lduba	[%i5+%o4]0x80,%l6	! %l6 = 00000000000000ff
!	Mem[00000000100c1400] = 0000005d, %l7 = 0000000000004265
	ldsba	[%i3+%g0]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000010081410] = 0f000000, %l3 = 0000000000002b74
	ldswa	[%i2+%o5]0x80,%l3	! %l3 = 000000000f000000
!	Mem[00000000100c1410] = ff000000 6a7a4105, %l2 = ff897cff, %l3 = 0f000000
	ldda	[%i3+%o5]0x80,%l2	! %l2 = 00000000ff000000 000000006a7a4105
!	Mem[0000000010101410] = 11d996ff, %l2 = 00000000ff000000
	ldswa	[%i4+%o5]0x88,%l2	! %l2 = 0000000011d996ff
!	Mem[00000000211c0000] = cdff8f28, %l5 = 000000005bb85368
	lduh	[%o2+%g0],%l5		! %l5 = 000000000000cdff
!	Mem[0000000010101408] = c2000000, %l6 = 00000000000000ff
	ldsha	[%i4+%o4]0x88,%l6	! %l6 = 0000000000000000

p0_label_35:
!	Starting 10 instruction Store Burst
!	Mem[0000000010081408] = 6836503c, %l6 = 0000000000000000
	ldstuba	[%i2+%o4]0x80,%l6	! %l6 = 0000000000000068
!	%l1 = ffffffffffffff9f, Mem[0000000010101410] = ff96d911, %asi = 80
	stwa	%l1,[%i4+0x010]%asi	! Mem[0000000010101410] = ffffff9f
!	%l1 = ffffffffffffff9f, Mem[0000000010181410] = ff5848a40284efa5
	stx	%l1,[%i6+%o5]		! Mem[0000000010181410] = ffffffffffffff9f
!	Mem[00000000201c0001] = 2ca99298, %l4 = 00000000a44858ff
	ldstuba	[%o0+0x001]%asi,%l4	! %l4 = 00000000000000a9
!	Mem[0000000030041408] = d4df8b9f, %l2 = 0000000011d996ff
	swapa	[%i1+%o4]0x89,%l2	! %l2 = 00000000d4df8b9f
!	Mem[0000000030101410] = 000000ff, %l5 = 000000000000cdff
	swapa	[%i4+%o5]0x89,%l5	! %l5 = 00000000000000ff
!	%f16 = 0000005d 72c32dc9, Mem[0000000030141408] = ff000000 38a73d71
	stda	%f16,[%i5+%o4]0x89	! Mem[0000000030141408] = 0000005d 72c32dc9
!	Mem[000000001010143a] = 2ef9121a, %l7 = 0000000000000000
	ldstuba	[%i4+0x03a]%asi,%l7	! %l7 = 0000000000000012
!	Mem[0000000010041434] = 372a2ffd, %l4 = 00000000000000a9
	ldstuba	[%i1+0x034]%asi,%l4	! %l4 = 0000000000000037
!	%f28 = ff9d1c37, Mem[0000000010001410] = ffffffa9
	sta	%f28,[%i0+%o5]0x88	! Mem[0000000010001410] = ff9d1c37

p0_label_36:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081424] = 4cdb8901, %l1 = ffffffffffffff9f, %asi = 80
	lduwa	[%i2+0x024]%asi,%l1	! %l1 = 000000004cdb8901
!	Mem[0000000030181400] = d9444167, %l2 = 00000000d4df8b9f
	ldsba	[%i6+%g0]0x81,%l2	! %l2 = ffffffffffffffd9
!	Mem[0000000030001410] = 0000004d, %l5 = 00000000000000ff
	lduba	[%i0+%o5]0x89,%l5	! %l5 = 000000000000004d
!	Mem[0000000010041410] = 380000ff, %l4 = 0000000000000037
	ldswa	[%i1+%o5]0x88,%l4	! %l4 = 00000000380000ff
!	Mem[0000000010101400] = 0189db4c, %l2 = ffffffffffffffd9
	ldsba	[%i4+%g0]0x80,%l2	! %l2 = 0000000000000001
!	Mem[0000000030181400] = d9444167, %l4 = 00000000380000ff
	ldsha	[%i6+%g0]0x81,%l4	! %l4 = ffffffffffffd944
!	Mem[0000000010041408] = 70272656, %l2 = 0000000000000001
	ldsha	[%i1+%o4]0x80,%l2	! %l2 = 0000000000007027
!	Mem[0000000010001408] = 3b188db0 4cdb8901, %l6 = 00000068, %l7 = 00000012
	ldda	[%i0+%o4]0x80,%l6	! %l6 = 000000003b188db0 000000004cdb8901
!	Mem[0000000010101400] = 0189db4c, %l7 = 000000004cdb8901
	ldsha	[%i4+%g0]0x80,%l7	! %l7 = 0000000000000189
!	Mem[0000000010041400] = 5838003a, %l7 = 0000000000000189
	ldsba	[%i1+%g0]0x88,%l7	! %l7 = 000000000000003a

p0_label_37:
!	Starting 10 instruction Store Burst
!	Mem[0000000030001408] = 55c22631, %l1 = 000000004cdb8901
	ldstuba	[%i0+%o4]0x81,%l1	! %l1 = 0000000000000055
!	%l2 = 0000000000007027, Mem[0000000030181400] = 674144d9
	stha	%l2,[%i6+%g0]0x89	! Mem[0000000030181400] = 67417027
!	%f2  = 0f000000 6a7a4105, Mem[00000000100c1408] = 6836503c 262eff0f
	stda	%f2 ,[%i3+%o4]0x80	! Mem[00000000100c1408] = 0f000000 6a7a4105
!	Mem[0000000010101430] = 0b48cffc2262e29d, %l7 = 000000000000003a, %l7 = 000000000000003a
	add	%i4,0x30,%g1
	casxa	[%g1]0x80,%l7,%l7	! %l7 = 0b48cffc2262e29d
!	Mem[0000000010081400] = 0000005d, %l6 = 3b188db0, %l5 = 0000004d
	casa	[%i2]0x80,%l6,%l5	! %l5 = 000000000000005d
!	%l7 = 0b48cffc2262e29d, Mem[00000000100c1400] = 0000005d
	stha	%l7,[%i3+%g0]0x80	! Mem[00000000100c1400] = e29d005d
!	%l5 = 000000000000005d, Mem[0000000010141410] = 0000003ae8c4c5da
	stx	%l5,[%i5+%o5]		! Mem[0000000010141410] = 000000000000005d
!	Mem[0000000010081408] = ff36503c, %l1 = 0000000000000055
	ldstuba	[%i2+%o4]0x80,%l1	! %l1 = 00000000000000ff
!	%f30 = 162d60ba 00000058, Mem[0000000010181410] = ffffffff ffffff9f
	stda	%f30,[%i6+%o5]0x80	! Mem[0000000010181410] = 162d60ba 00000058
!	%l5 = 000000000000005d, Mem[00000000100c1428] = 00000000
	sth	%l5,[%i3+0x028]		! Mem[00000000100c1428] = 005d0000

p0_label_38:
!	Starting 10 instruction Load Burst
!	%l6 = 000000003b188db0, immd = 000006b0, %y  = ffffdb64
	smul	%l6,0x6b0,%l1		! %l1 = 0000018b34338900, %y = 0000018b
!	Mem[0000000030101410] = 55c22631 0000cdff, %l6 = 3b188db0, %l7 = 2262e29d
	ldda	[%i4+%o5]0x89,%l6	! %l6 = 000000000000cdff 0000000055c22631
!	Mem[0000000010181408] = 00002b74, %l2 = 0000000000007027
	lduba	[%i6+%o4]0x88,%l2	! %l2 = 0000000000000074
!	Mem[0000000010101408] = 000000c2, %l2 = 0000000000000074
	lduba	[%i4+%o4]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000010081400] = 5d000000, %l6 = 000000000000cdff
	ldsha	[%i2+%g0]0x88,%l6	! %l6 = 0000000000000000
!	Mem[00000000300c1408] = e0e16a1f, %f12 = 55c22631
	lda	[%i3+%o4]0x81,%f12	! %f12 = e0e16a1f
!	Mem[0000000010001420] = 000000ff, %l7 = 0000000055c22631, %asi = 80
	ldsba	[%i0+0x020]%asi,%l7	! %l7 = 0000000000000000
!	Mem[00000000300c1410] = 8b9d1c37c27500ff, %l4 = ffffffffffffd944
	ldxa	[%i3+%o5]0x89,%l4	! %l4 = 8b9d1c37c27500ff
	membar	#Sync			! Added by membar checker (7)
!	Mem[0000000030001400] = 426560f7 f76069e5 ffc22631 31a4e05f
!	Mem[0000000030001410] = 4d000000 50e0aed5 608eaa72 0a61517b
!	Mem[0000000030001420] = 1c99e2c0 72071fd1 4ade89fe 07c68b57
!	Mem[0000000030001430] = 20ca5bac 494b318d 743a0f4a 3f663bf3
	ldda	[%i0+%g0]ASI_BLK_AIUSL,%f0 	! Block Load from 0000000030001400
!	Mem[0000000010081400] = 0000005d, %l4 = 8b9d1c37c27500ff
	ldsba	[%i2+%g0]0x80,%l4	! %l4 = 0000000000000000

p0_label_39:
!	Starting 10 instruction Store Burst
!	Mem[00000000201c0001] = 2cff9298, %l6 = 0000000000000000
	ldstuba	[%o0+0x001]%asi,%l6	! %l6 = 00000000000000ff
!	%l2 = 0000000000000000, Mem[0000000010101410] = ffffff9f005d00ff
	stxa	%l2,[%i4+%o5]0x80	! Mem[0000000010101410] = 0000000000000000
!	%l2 = 00000000, %l3 = 6a7a4105, Mem[00000000300c1410] = ff0075c2 371c9d8b
	stda	%l2,[%i3+%o5]0x81	! Mem[00000000300c1410] = 00000000 6a7a4105
!	%f22 = 09c05727 1248e92b, %l3 = 000000006a7a4105
!	Mem[00000000300c1438] = 44282b6a122bd393
	add	%i3,0x038,%g1
	stda	%f22,[%g1+%l3]ASI_PST8_S ! Mem[00000000300c1438] = 44282b6a1248d32b
!	%l4 = 0000000000000000, Mem[0000000010041422] = 22330cf0, %asi = 80
	stha	%l4,[%i1+0x022]%asi	! Mem[0000000010041420] = 22330000
!	%l4 = 0000000000000000, Mem[0000000021800041] = 62e22388
	stb	%l4,[%o3+0x041]		! Mem[0000000021800040] = 62002388
	membar	#Sync			! Added by membar checker (8)
!	%l6 = 00000000000000ff, Mem[0000000030001410] = 4d000000
	stha	%l6,[%i0+%o5]0x81	! Mem[0000000030001410] = 00ff0000
!	%l4 = 00000000, %l5 = 0000005d, Mem[00000000300c1408] = e0e16a1f 5ec55265
	stda	%l4,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00000000 0000005d
!	%l0 = 00000000000000ff, Mem[0000000030041408] = 11d996ff
	stha	%l0,[%i1+%o4]0x89	! Mem[0000000030041408] = 11d900ff
!	%l3 = 000000006a7a4105, Mem[0000000020800000] = 00ffeac8, %asi = 80
	stba	%l3,[%o1+0x000]%asi	! Mem[0000000020800000] = 05ffeac8

p0_label_40:
!	Starting 10 instruction Load Burst
!	Mem[0000000030001400] = 426560f7, %l6 = 00000000000000ff
	ldsba	[%i0+%g0]0x81,%l6	! %l6 = 0000000000000042
!	Mem[0000000030081400] = 4d000000000000ff, %f12 = 8d314b49 ac5bca20
	ldda	[%i2+%g0]0x89,%f12	! %f12 = 4d000000 000000ff
!	Mem[0000000010001410] = ff9d1c37, %l5 = 000000000000005d
	ldswa	[%i0+%o5]0x88,%l5	! %l5 = ffffffffff9d1c37
!	Mem[0000000010101410] = 00000000, %l4 = 0000000000000000
	ldswa	[%i4+%o5]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000030081400] = ff0000000000004d, %f4  = d5aee050 0000004d
	ldda	[%i2+%g0]0x81,%f4 	! %f4  = ff000000 0000004d
!	Mem[0000000010101400] = 0189db4c, %l4 = 0000000000000000
	ldswa	[%i4+%g0]0x80,%l4	! %l4 = 000000000189db4c
!	Mem[0000000030041400] = 6542a26629450000, %f12 = 4d000000 000000ff
	ldda	[%i1+%g0]0x89,%f12	! %f12 = 6542a266 29450000
!	Mem[00000000201c0000] = 2cff9298, %l5 = ffffffffff9d1c37, %asi = 80
	lduha	[%o0+0x000]%asi,%l5	! %l5 = 0000000000002cff
!	Mem[0000000010141400] = 371c9dff, %l4 = 000000000189db4c
	lduba	[%i5+%g0]0x80,%l4	! %l4 = 0000000000000037
!	Mem[0000000030181400] = 67417027, %l1 = 0000018b34338900
	lduba	[%i6+%g0]0x89,%l1	! %l1 = 0000000000000027

p0_label_41:
!	Starting 10 instruction Store Burst
!	%f23 = 1248e92b, %f4  = ff000000
	fsqrts	%f23,%f4 		! %f4  = 28e2c9f0
!	%l6 = 0000000000000042, Mem[0000000030041410] = 00002dff
	stba	%l6,[%i1+%o5]0x89	! Mem[0000000030041410] = 00002d42
!	%l1 = 0000000000000027, Mem[0000000020800041] = 680d3ef8, %asi = 80
	stba	%l1,[%o1+0x041]%asi	! Mem[0000000020800040] = 68273ef8
!	%l4 = 00000037, %l5 = 00002cff, Mem[0000000030141410] = 746d9658 353f155c
	stda	%l4,[%i5+%o5]0x89	! Mem[0000000030141410] = 00000037 00002cff
!	%l6 = 00000042, %l7 = 00000000, Mem[0000000030041410] = 00002d42 00000000
	stda	%l6,[%i1+%o5]0x89	! Mem[0000000030041410] = 00000042 00000000
!	Mem[0000000010041410] = 380000ff, %l2 = 0000000000000000
	ldstuba	[%i1+%o5]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010181410] = ba602d16, %l3 = 000000006a7a4105
	swapa	[%i6+%o5]0x88,%l3	! %l3 = 00000000ba602d16
!	Mem[0000000030001410] = 00ff0000, %l1 = 0000000000000027
	swapa	[%i0+%o5]0x81,%l1	! %l1 = 0000000000ff0000
!	Mem[0000000010041414] = 00000000, %l5 = 0000000000002cff
	swap	[%i1+0x014],%l5		! %l5 = 0000000000000000
!	Mem[0000000010081410] = 0000000f, %l4 = 0000000000000037
	ldstuba	[%i2+%o5]0x88,%l4	! %l4 = 000000000000000f

p0_label_42:
!	Starting 10 instruction Load Burst
!	Mem[0000000030101410] = 55c22631 0000cdff, %l4 = 0000000f, %l5 = 00000000
	ldda	[%i4+%o5]0x89,%l4	! %l4 = 000000000000cdff 0000000055c22631
!	Mem[00000000100c1424] = 4cdb8901, %l2 = 00000000000000ff, %asi = 80
	ldsha	[%i3+0x024]%asi,%l2	! %l2 = 0000000000004cdb
!	%f14 = f33b663f, Mem[0000000010041408] = 56262770
	sta	%f14,[%i1+%o4]0x88	! Mem[0000000010041408] = f33b663f
!	Mem[0000000030081400] = ff000000, %l6 = 0000000000000042
	lduwa	[%i2+%g0]0x81,%l6	! %l6 = 00000000ff000000
!	Mem[0000000021800181] = 2c4b5078, %l6 = 00000000ff000000, %asi = 80
	ldsba	[%o3+0x181]%asi,%l6	! %l6 = 000000000000004b
!	Mem[00000000218001c0] = 11b780a8, %l1 = 0000000000ff0000
	ldsb	[%o3+0x1c0],%l1		! %l1 = 0000000000000011
!	Mem[0000000030041400] = 00004529, %l5 = 0000000055c22631
	lduwa	[%i1+%g0]0x81,%l5	! %l5 = 0000000000004529
!	Mem[0000000030001410] = 27000000, %f31 = 00000058
	lda	[%i0+%o5]0x89,%f31	! %f31 = 27000000
!	Mem[0000000030141410] = 00000037, %l5 = 0000000000004529
	lduba	[%i5+%o5]0x89,%l5	! %l5 = 0000000000000037
!	Mem[0000000010081408] = 3c5036ff, %f25 = 4cdb8901
	lda	[%i2+%o4]0x88,%f25	! %f25 = 3c5036ff

p0_label_43:
!	Starting 10 instruction Store Burst
!	%f23 = 1248e92b, %f7  = 72aa8e60, %f28 = ff9d1c37
	fmuls	%f23,%f7 ,%f28		! %f28 = 4585da93
!	%l5 = 0000000000000037, Mem[00000000100c1401] = e29d005d
	stb	%l5,[%i3+0x001]		! Mem[00000000100c1400] = e237005d
!	%l6 = 000000000000004b, Mem[0000000010181400] = 00000000000000ff
	stx	%l6,[%i6+%g0]		! Mem[0000000010181400] = 000000000000004b
!	%l5 = 0000000000000037, Mem[0000000030181408] = 08d790e6
	stwa	%l5,[%i6+%o4]0x81	! Mem[0000000030181408] = 00000037
!	Mem[0000000030141400] = 0872776d, %l4 = 000000000000cdff
	swapa	[%i5+%g0]0x89,%l4	! %l4 = 000000000872776d
!	Mem[00000000211c0001] = cdff8f28, %l0 = 00000000000000ff
	ldstub	[%o2+0x001],%l0		! %l0 = 00000000000000ff
!	%l6 = 000000000000004b, Mem[0000000010181410] = 05417a6a
	stba	%l6,[%i6+%o5]0x80	! Mem[0000000010181410] = 4b417a6a
!	%f7  = 72aa8e60, %f18 = 6836503c
	fcmps	%fcc3,%f7 ,%f18		! %fcc3 = 2
!	%l0 = 00000000000000ff, Mem[00000000218000c0] = 5c3aa7e8
	sth	%l0,[%o3+0x0c0]		! Mem[00000000218000c0] = 00ffa7e8
!	Mem[00000000211c0001] = cdff8f28, %l2 = 0000000000004cdb
	ldstub	[%o2+0x001],%l2		! %l2 = 00000000000000ff

p0_label_44:
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = 9f000000, %l2 = 00000000000000ff
	ldsba	[%i4+%g0]0x81,%l2	! %l2 = ffffffffffffff9f
	membar	#Sync			! Added by membar checker (9)
!	Mem[0000000010181400] = 00000000 0000004b 742b0000 2b7428bb
!	Mem[0000000010181410] = 4b417a6a 00000058 186b2602 ff9164cb
!	Mem[0000000010181420] = 028d56d0 2b7cf9a1 262eff0f 3d0e60f7
!	Mem[0000000010181430] = 306cccbc 2ab1f45d 2255c4da 0b0c6143
	ldda	[%i6+%g0]ASI_BLK_AIUPL,%f0 	! Block Load from 0000000010181400
!	Mem[00000000300c1408] = 5d00000000000000, %f26 = 00000000 78fcf366
	ldda	[%i3+%o4]0x89,%f26	! %f26 = 5d000000 00000000
!	Mem[0000000010181420] = 028d56d02b7cf9a1, %f22 = 09c05727 1248e92b
	ldd	[%i6+0x020],%f22	! %f22 = 028d56d0 2b7cf9a1
!	Mem[00000000211c0000] = cdff8f28, %l7 = 0000000000000000, %asi = 80
	lduba	[%o2+0x000]%asi,%l7	! %l7 = 00000000000000cd
!	%f5  = 6a7a414b, %f24 = 3b188db0
	fcmps	%fcc1,%f5 ,%f24		! %fcc1 = 2
!	Mem[0000000030181410] = d4df8bac, %l2 = ffffffffffffff9f
	lduha	[%i6+%o5]0x89,%l2	! %l2 = 0000000000008bac
!	Mem[0000000010181410] = 6a7a414b, %l4 = 000000000872776d
	lduwa	[%i6+%o5]0x88,%l4	! %l4 = 000000006a7a414b
!	Mem[0000000030101410] = ffcd00003126c255, %f30 = 162d60ba 27000000
	ldda	[%i4+%o5]0x81,%f30	! %f30 = ffcd0000 3126c255
!	Mem[00000000201c0000] = 2cff9298, %l2 = 0000000000008bac
	ldsh	[%o0+%g0],%l2		! %l2 = 0000000000002cff

p0_label_45:
!	Starting 10 instruction Store Burst
!	%l5 = 0000000000000037, Mem[0000000010001400] = 00000000
	stha	%l5,[%i0+%g0]0x80	! Mem[0000000010001400] = 00370000
!	Mem[0000000010181400] = 00000000 0000004b 742b0000 2b7428bb
!	%f16 = 0000005d 72c32dc9 6836503c 262eff0f
!	%f20 = 0f000000 6a7a4105 028d56d0 2b7cf9a1
!	%f24 = 3b188db0 3c5036ff 5d000000 00000000
!	%f28 = 4585da93 642621bd ffcd0000 3126c255
	stda	%f16,[%i6+%g0]ASI_BLK_PL	! Block Store to 0000000010181400
!	%l7 = 00000000000000cd, Mem[0000000010141408] = ff00009f
	stba	%l7,[%i5+%o4]0x80	! Mem[0000000010141408] = cd00009f
!	%l2 = 0000000000002cff, Mem[0000000030181408] = 37000000
	stha	%l2,[%i6+%o4]0x89	! Mem[0000000030181408] = 37002cff
!	%f16 = 0000005d 72c32dc9, %l7 = 00000000000000cd
!	Mem[0000000030141430] = 661bf38c4565fded
	add	%i5,0x030,%g1
	stda	%f16,[%g1+%l7]ASI_PST16_S ! Mem[0000000030141430] = 0000005d45652dc9
!	%l0 = 00000000000000ff, Mem[0000000010041438] = 00ff4dfa, %asi = 80
	stba	%l0,[%i1+0x038]%asi	! Mem[0000000010041438] = ffff4dfa
!	Mem[0000000010041428] = 61dc79ae, %l3 = 00000000ba602d16
	swap	[%i1+0x028],%l3		! %l3 = 0000000061dc79ae
!	Mem[0000000010001410] = 371c9dff, %l6 = 000000000000004b
	ldstuba	[%i0+%o5]0x80,%l6	! %l6 = 0000000000000037
!	%f12 = 5df4b12a, Mem[0000000030181400] = 67417027
	sta	%f12,[%i6+%g0]0x89	! Mem[0000000030181400] = 5df4b12a
!	%l1 = 0000000000000011, Mem[0000000030081408] = 78fcf366
	stba	%l1,[%i2+%o4]0x81	! Mem[0000000030081408] = 11fcf366

p0_label_46:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = 5838003a, %l4 = 000000006a7a414b
	ldsba	[%i1+%g0]0x88,%l4	! %l4 = 000000000000003a
!	Mem[0000000010101400] = 0189db4c, %l5 = 0000000000000037
	lduba	[%i4+%g0]0x80,%l5	! %l5 = 0000000000000001
!	Mem[0000000030101410] = ffcd0000, %f7  = 02266b18
	lda	[%i4+%o5]0x81,%f7 	! %f7 = ffcd0000
!	Mem[0000000030101400] = 9f000000, %f0  = 4b000000
	lda	[%i4+%g0]0x81,%f0 	! %f0 = 9f000000
!	Mem[0000000030001400] = 426560f7, %l3 = 0000000061dc79ae
	lduwa	[%i0+%g0]0x81,%l3	! %l3 = 00000000426560f7
	membar	#Sync			! Added by membar checker (10)
!	Mem[0000000010181408] = 0fff2e26, %l7 = 00000000000000cd
	ldswa	[%i6+%o4]0x80,%l7	! %l7 = 000000000fff2e26
!	Mem[00000000100c143d] = 00000058, %l3 = 00000000426560f7, %asi = 80
	lduba	[%i3+0x03d]%asi,%l3	! %l3 = 0000000000000000
!	Mem[0000000010141410] = 000000000000005d, %f22 = 028d56d0 2b7cf9a1
	ldda	[%i5+%o5]0x80,%f22	! %f22 = 00000000 0000005d
!	Mem[0000000030101400] = 19fe6e2b0000009f, %l5 = 0000000000000001
	ldxa	[%i4+%g0]0x89,%l5	! %l5 = 19fe6e2b0000009f
!	Mem[0000000030081400] = ff000000 0000004d, %l0 = 000000ff, %l1 = 00000011
	ldda	[%i2+%g0]0x81,%l0	! %l0 = 00000000ff000000 000000000000004d

p0_label_47:
!	Starting 10 instruction Store Burst
!	Mem[0000000010141400] = ff9d1c37, %l5 = 000000000000009f
	swapa	[%i5+%g0]0x88,%l5	! %l5 = 00000000ff9d1c37
!	%l1 = 000000000000004d, Mem[0000000010141400] = 0000009f
	stha	%l1,[%i5+%g0]0x88	! Mem[0000000010141400] = 0000004d
!	Mem[00000000100c1408] = 0f000000, %l0 = 00000000ff000000
	ldstuba	[%i3+%o4]0x80,%l0	! %l0 = 000000000000000f
!	Mem[0000000010081434] = 642621bd, %l0 = 000000000000000f, %asi = 80
	swapa	[%i2+0x034]%asi,%l0	! %l0 = 00000000642621bd
!	%l5 = 00000000ff9d1c37, Mem[0000000030141408] = c92dc3725d000000
	stxa	%l5,[%i5+%o4]0x81	! Mem[0000000030141408] = 00000000ff9d1c37
!	%l3 = 0000000000000000, Mem[0000000010101410] = 0000000000000000
	stxa	%l3,[%i4+%o5]0x80	! Mem[0000000010101410] = 0000000000000000
!	Mem[0000000010101400] = 0189db4c, %l5 = 00000000ff9d1c37
	ldstuba	[%i4+%g0]0x80,%l5	! %l5 = 0000000000000001
!	%f28 = 4585da93 642621bd, %l5 = 0000000000000001
!	Mem[0000000010101430] = 0b48cffc2262e29d
	add	%i4,0x030,%g1
	stda	%f28,[%g1+%l5]ASI_PST8_P ! Mem[0000000010101430] = 0b48cffc2262e2bd
!	%l6 = 0000000000000037, Mem[0000000030081410] = 66a242ff
	stwa	%l6,[%i2+%o5]0x89	! Mem[0000000030081410] = 00000037
!	%l3 = 0000000000000000, Mem[0000000030141400] = 0000cdff
	stwa	%l3,[%i5+%g0]0x89	! Mem[0000000030141400] = 00000000

p0_label_48:
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = 5df4b12a, %f23 = 0000005d
	lda	[%i6+%g0]0x89,%f23	! %f23 = 5df4b12a
!	Mem[0000000030081400] = ff0000000000004d, %f10 = f7600e3d 0fff2e26
	ldda	[%i2+%g0]0x81,%f10	! %f10 = ff000000 0000004d
!	Mem[0000000010101410] = 00000000, %l7 = 000000000fff2e26
	lduha	[%i4+%o5]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000010181400] = c92dc372, %l2 = 0000000000002cff
	lduha	[%i6+%g0]0x80,%l2	! %l2 = 000000000000c92d
!	Mem[0000000010081400] = 5d000000, %l3 = 0000000000000000
	lduba	[%i2+%g0]0x88,%l3	! %l3 = 0000000000000000
!	Mem[00000000211c0000] = cdff8f28, %l1 = 000000000000004d
	lduh	[%o2+%g0],%l1		! %l1 = 000000000000cdff
!	Mem[0000000010141420] = 3175ce706ee44ec1, %l2 = 000000000000c92d
	ldx	[%i5+0x020],%l2		! %l2 = 3175ce706ee44ec1
!	Mem[0000000010001417] = 66a24265, %l7 = 0000000000000000, %asi = 80
	ldsba	[%i0+0x017]%asi,%l7	! %l7 = 0000000000000065
!	Mem[0000000030081408] = 1f4e0e4c66f3fc11, %f18 = 6836503c 262eff0f
	ldda	[%i2+%o4]0x89,%f18	! %f18 = 1f4e0e4c 66f3fc11
	membar	#Sync			! Added by membar checker (11)
!	Mem[0000000030141400] = 00000000 1f5044f9 00000000 ff9d1c37
!	Mem[0000000030141410] = 37000000 ff2c0000 7d0b3d52 07624cdb
!	Mem[0000000030141420] = 0e7254a0 537d1e31 43da12de 0e78e4b7
!	Mem[0000000030141430] = 0000005d 45652dc9 c2976e2a 4a705353
	ldda	[%i5+%g0]ASI_BLK_AIUS,%f16	! Block Load from 0000000030141400

p0_label_49:
!	Starting 10 instruction Store Burst
!	Mem[00000000211c0000] = cdff8f28, %l2 = 3175ce706ee44ec1
	ldstuba	[%o2+0x000]%asi,%l2	! %l2 = 00000000000000cd
!	%f20 = 37000000 ff2c0000, Mem[0000000010041400] = 5838003a 09c05727
	stda	%f20,[%i1+%g0]0x88	! Mem[0000000010041400] = 37000000 ff2c0000
	membar	#Sync			! Added by membar checker (12)
!	%f24 = 0e7254a0 537d1e31, %l1 = 000000000000cdff
!	Mem[0000000030141418] = 7d0b3d5207624cdb
	add	%i5,0x018,%g1
	stda	%f24,[%g1+%l1]ASI_PST16_S ! Mem[0000000030141418] = 0e7254a0537d1e31
!	%l0 = 642621bd, %l1 = 0000cdff, Mem[0000000010141400] = 0000004d 895b7772
	stda	%l0,[%i5+%g0]0x88	! Mem[0000000010141400] = 642621bd 0000cdff
!	Mem[0000000021800181] = 2c4b5078, %l2 = 00000000000000cd
	ldstuba	[%o3+0x181]%asi,%l2	! %l2 = 000000000000004b
!	Mem[00000000201c0000] = 2cff9298, %l5 = 0000000000000001
	ldstuba	[%o0+0x000]%asi,%l5	! %l5 = 000000000000002c
!	%l5 = 000000000000002c, Mem[0000000010181408] = 0fff2e26
	stba	%l5,[%i6+%o4]0x80	! Mem[0000000010181408] = 2cff2e26
!	%l2 = 000000000000004b, Mem[0000000010081410] = 05417a6a000000ff
	stxa	%l2,[%i2+%o5]0x88	! Mem[0000000010081410] = 000000000000004b
!	%l6 = 0000000000000037, Mem[0000000010081414] = 00000000
	sth	%l6,[%i2+0x014]		! Mem[0000000010081414] = 00370000
!	%f16 = 00000000 1f5044f9, Mem[0000000010001408] = b08d183b 0189db4c
	stda	%f16,[%i0+%o4]0x88	! Mem[0000000010001408] = 00000000 1f5044f9

p0_label_50:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = ff000000, %l6 = 0000000000000037
	lduba	[%i3+%o4]0x80,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010181410] = 6a7a4105, %l3 = 0000000000000000
	ldsba	[%i6+%o5]0x88,%l3	! %l3 = 0000000000000005
!	Mem[0000000010181408] = 262eff2c, %l1 = 000000000000cdff
	lduha	[%i6+%o4]0x88,%l1	! %l1 = 000000000000ff2c
!	Mem[0000000030081400] = 000000ff, %f4  = 58000000
	lda	[%i2+%g0]0x89,%f4 	! %f4 = 000000ff
!	Mem[0000000010141401] = bd212664, %l7 = 0000000000000065, %asi = 80
	lduba	[%i5+0x001]%asi,%l7	! %l7 = 0000000000000021
!	Mem[0000000010081400] = 0000005d, %l1 = 000000000000ff2c
	ldsha	[%i2+%g0]0x80,%l1	! %l1 = 0000000000000000
!	%f27 = 0e78e4b7, %f10 = ff000000, %f6  = cb6491ff ffcd0000
	fsmuld	%f27,%f10,%f6 		! %f6  = c1bf1c96 e0000000
!	Mem[0000000010101404] = b08d183b, %l7 = 0000000000000021, %asi = 80
	ldsha	[%i4+0x004]%asi,%l7	! %l7 = ffffffffffffb08d
!	Mem[0000000030101410] = ffcd0000, %f15 = dac45522
	lda	[%i4+%o5]0x81,%f15	! %f15 = ffcd0000
!	Mem[0000000020800000] = 05ffeac8, %l6 = 00000000000000ff
	ldub	[%o1+%g0],%l6		! %l6 = 0000000000000005

p0_label_51:
!	Starting 10 instruction Store Burst
!	%f9  = d0568d02, Mem[000000001004141c] = 4a4cb16b
	st	%f9 ,[%i1+0x01c]	! Mem[000000001004141c] = d0568d02
!	%l4 = 000000000000003a, %l4 = 000000000000003a, %l0 = 00000000642621bd
	andn	%l4,%l4,%l0		! %l0 = 0000000000000000
!	%f0  = 9f000000, %f27 = 0e78e4b7, %f6  = c1bf1c96 e0000000
	fsmuld	%f0 ,%f27,%f6 		! %f6  = b5bf1c96 e0000000
!	%f12 = 5df4b12a bccc6c30, Mem[0000000030101410] = ffcd0000 3126c255
	stda	%f12,[%i4+%o5]0x81	! Mem[0000000030101410] = 5df4b12a bccc6c30
!	%l2 = 000000000000004b, Mem[0000000030081410] = 37000000
	stha	%l2,[%i2+%o5]0x81	! Mem[0000000030081410] = 004b0000
!	Mem[0000000030141408] = 00000000, %l5 = 000000000000002c
	ldstuba	[%i5+%o4]0x81,%l5	! %l5 = 0000000000000000
!	%l4 = 000000000000003a, Mem[0000000030001408] = 5fe0a4313126c2ff
	stxa	%l4,[%i0+%o4]0x89	! Mem[0000000030001408] = 000000000000003a
!	Mem[0000000030001400] = f7606542, %l3 = 0000000000000005
	swapa	[%i0+%g0]0x89,%l3	! %l3 = 00000000f7606542
!	%l5 = 0000000000000000, Mem[0000000010041408] = f33b663f
	stha	%l5,[%i1+%o4]0x88	! Mem[0000000010041408] = f33b0000
!	Mem[00000000100c1408] = 000000ff, %l5 = 0000000000000000
	swapa	[%i3+%o4]0x88,%l5	! %l5 = 00000000000000ff

p0_label_52:
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = ffff9298, %l3 = 00000000f7606542
	ldub	[%o0+%g0],%l3		! %l3 = 00000000000000ff
!	Mem[00000000201c0000] = ffff9298, %l2 = 000000000000004b
	lduh	[%o0+%g0],%l2		! %l2 = 000000000000ffff
!	Mem[0000000030041408] = bb28272b11d900ff, %l0 = 0000000000000000
	ldxa	[%i1+%o4]0x89,%l0	! %l0 = bb28272b11d900ff
!	Mem[00000000300c1400] = 4cdb8901 bc59330d 00000000 0000005d
!	Mem[00000000300c1410] = 00000000 6a7a4105 2a53b292 525ea51b
!	Mem[00000000300c1420] = 500923e0 09ce2871 7fdb8c1e 27d7b0f7
!	Mem[00000000300c1430] = 1672e6cc 0b101c2d 44282b6a 1248d32b
	ldda	[%i3+%g0]ASI_BLK_S,%f16	! Block Load from 00000000300c1400
!	Mem[0000000010141410] = 000000000000005d, %f6  = b5bf1c96 e0000000
	ldda	[%i5+%o5]0x80,%f6 	! %f6  = 00000000 0000005d
!	Mem[00000000100c1408] = 00000000, %l1 = 0000000000000000
	ldswa	[%i3+%o4]0x80,%l1	! %l1 = 0000000000000000
!	Mem[00000000300c1408] = 00000000, %f3  = 00002b74
	lda	[%i3+%o4]0x89,%f3 	! %f3 = 00000000
!	Mem[0000000010081410] = 0000004b, %l5 = 00000000000000ff
	lduha	[%i2+%o5]0x88,%l5	! %l5 = 000000000000004b
	membar	#Sync			! Added by membar checker (13)
!	Mem[00000000100c1400] = e237005d 72c32dc9 00000000 6a7a4105
!	Mem[00000000100c1410] = ff000000 6a7a4105 09c05727 1248e92b
!	Mem[00000000100c1420] = 3b188db0 4cdb8901 005d0000 78fcf366
!	Mem[00000000100c1430] = 11d996ff 000000ff 162d60ba 00000058
	ldda	[%i3+%g0]ASI_BLK_P,%f0 	! Block Load from 00000000100c1400
!	Mem[0000000030041408] = ff00d911, %l2 = 000000000000ffff
	ldsha	[%i1+%o4]0x81,%l2	! %l2 = ffffffffffffff00

p0_label_53:
!	Starting 10 instruction Store Burst
!	%f22 = 2a53b292 525ea51b, %l0 = bb28272b11d900ff
!	Mem[0000000010041400] = 00002cff00000037
	stda	%f22,[%i1+%l0]ASI_PST16_P ! Mem[0000000010041400] = 2a53b292525ea51b
!	%l7 = ffffffffffffb08d, Mem[0000000030041410] = 00000042
	stwa	%l7,[%i1+%o5]0x89	! Mem[0000000030041410] = ffffb08d
!	%l7 = ffffffffffffb08d, Mem[0000000030041408] = ff00d911
	stba	%l7,[%i1+%o4]0x81	! Mem[0000000030041408] = 8d00d911
!	%l1 = 0000000000000000, Mem[000000001018140f] = 3c503668
	stb	%l1,[%i6+0x00f]		! Mem[000000001018140c] = 3c503600
!	%f7  = 1248e92b, Mem[0000000010001408] = f944501f
	sta	%f7 ,[%i0+%o4]0x80	! Mem[0000000010001408] = 1248e92b
!	%f15 = 00000058, Mem[0000000010081430] = 1f6bf0a2
	sta	%f15,[%i2+0x030]%asi	! Mem[0000000010081430] = 00000058
!	Mem[0000000030181400] = 5df4b12a, %l7 = 00000000ffffb08d
	swapa	[%i6+%g0]0x89,%l7	! %l7 = 000000005df4b12a
!	%l6 = 0000000000000005, %l6 = 0000000000000005, %l3 = 00000000000000ff
	orn	%l6,%l6,%l3		! %l3 = ffffffffffffffff
!	Mem[0000000030181400] = ffffb08d, %l1 = 0000000000000000
	swapa	[%i6+%g0]0x89,%l1	! %l1 = 00000000ffffb08d
!	%l4 = 0000003a, %l5 = 0000004b, Mem[0000000030081400] = ff000000 0000004d
	stda	%l4,[%i2+%g0]0x81	! Mem[0000000030081400] = 0000003a 0000004b

p0_label_54:
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = 8db0ffff, %l6 = 0000000000000005
	ldswa	[%i1+%o5]0x81,%l6	! %l6 = ffffffff8db0ffff
!	Mem[00000000100c1432] = 11d996ff, %l2 = ffffffffffffff00
	ldub	[%i3+0x032],%l2		! %l2 = 0000000000000096
!	Code Fragment 3, seed = 941425
p0_fragment_5:
!	%l0 = bb28272b11d900ff
	setx	0xe4b718ccc371cd9e,%g7,%l0 ! %l0 = e4b718ccc371cd9e
!	%l1 = 00000000ffffb08d
	setx	0x6795510ba70f6849,%g7,%l1 ! %l1 = 6795510ba70f6849
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = e4b718ccc371cd9e
	setx	0x7ab22993bc4f9f04,%g7,%l0 ! %l0 = 7ab22993bc4f9f04
!	%l1 = 6795510ba70f6849
	setx	0x06884d38faecf4cf,%g7,%l1 ! %l1 = 06884d38faecf4cf
p0_fragment_5_end:
!	Code Fragment 4, seed = 862117
p0_fragment_6:
!	%l0 = 7ab22993bc4f9f04
	setx	0x1f2efbe7a0dfeffe,%g7,%l0 ! %l0 = 1f2efbe7a0dfeffe
!	%l1 = 06884d38faecf4cf
	setx	0xe09a088f3d9b7ca9,%g7,%l1 ! %l1 = e09a088f3d9b7ca9
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 1f2efbe7a0dfeffe
	setx	0x8c92426f8dff0564,%g7,%l0 ! %l0 = 8c92426f8dff0564
!	%l1 = e09a088f3d9b7ca9
	setx	0x070318f15e470d2f,%g7,%l1 ! %l1 = 070318f15e470d2f
p0_fragment_6_end:
!	Mem[0000000010001404] = 0000009f, %l6 = ffffffff8db0ffff
	ldsh	[%i0+0x004],%l6		! %l6 = 0000000000000000
!	Mem[0000000030041410] = ffffb08d, %l7 = 000000005df4b12a
	lduha	[%i1+%o5]0x89,%l7	! %l7 = 000000000000b08d
!	Mem[00000000300c1408] = 00000000 0000005d, %l4 = 0000003a, %l5 = 0000004b
	ldda	[%i3+%o4]0x81,%l4	! %l4 = 0000000000000000 000000000000005d
!	Mem[0000000010001408] = 1248e92b, %l5 = 000000000000005d
	lduwa	[%i0+%o4]0x80,%l5	! %l5 = 000000001248e92b
!	Mem[0000000030141408] = ff000000ff9d1c37, %f4  = ff000000 6a7a4105
	ldda	[%i5+%o4]0x81,%f4 	! %f4  = ff000000 ff9d1c37
!	Mem[0000000030001400] = 05000000f76069e5, %l2 = 0000000000000096
	ldxa	[%i0+%g0]0x81,%l2	! %l2 = 05000000f76069e5

p0_label_55:
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000000000, Mem[0000000030181410] = ac8bdfd4
	stwa	%l4,[%i6+%o5]0x81	! Mem[0000000030181410] = 00000000
!	Mem[00000000100c1400] = e237005d, %l0 = 000000008dff0564
	swapa	[%i3+%g0]0x80,%l0	! %l0 = 00000000e237005d
!	%l6 = 0000000000000000, Mem[0000000010141408] = cd00009f
	stwa	%l6,[%i5+%o4]0x80	! Mem[0000000010141408] = 00000000
!	Mem[00000000300c1400] = 4cdb8901, %l2 = 00000000f76069e5
	swapa	[%i3+%g0]0x81,%l2	! %l2 = 000000004cdb8901
!	%l6 = 0000000000000000, Mem[0000000030101408] = 09c05727
	stha	%l6,[%i4+%o4]0x81	! Mem[0000000030101408] = 00005727
!	Mem[0000000010001410] = ff9d1cff, %l0 = 00000000e237005d
	ldstuba	[%i0+%o5]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010181408] = 262eff2c, %l1 = 070318f15e470d2f
	ldstuba	[%i6+%o4]0x88,%l1	! %l1 = 000000000000002c
!	%f3  = 6a7a4105, Mem[0000000030101410] = 2ab1f45d
	sta	%f3 ,[%i4+%o5]0x89	! Mem[0000000030101410] = 6a7a4105
!	%l6 = 0000000000000000, Mem[0000000010001410] = 6542a266ff9d1cff
	stxa	%l6,[%i0+%o5]0x88	! Mem[0000000010001410] = 0000000000000000
!	Mem[0000000030081410] = 00004b00, %l1 = 000000000000002c
	ldstuba	[%i2+%o5]0x89,%l1	! %l1 = 0000000000000000

p0_label_56:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = 1248e92b00000000, %l4 = 0000000000000000
	ldxa	[%i0+%o4]0x80,%l4	! %l4 = 1248e92b00000000
!	Mem[00000000300c1408] = 00000000, %l6 = 0000000000000000
	lduha	[%i3+%o4]0x81,%l6	! %l6 = 0000000000000000
!	Mem[00000000100c1400] = 8dff0564 72c32dc9, %l4 = 00000000, %l5 = 1248e92b
	ldda	[%i3+%g0]0x80,%l4	! %l4 = 000000008dff0564 0000000072c32dc9
!	Mem[00000000300c1400] = f76069e5, %l4 = 000000008dff0564
	lduha	[%i3+%g0]0x81,%l4	! %l4 = 000000000000f760
!	Mem[00000000100c1418] = 09c05727 1248e92b, %l4 = 0000f760, %l5 = 72c32dc9
	ldd	[%i3+0x018],%l4		! %l4 = 0000000009c05727 000000001248e92b
!	Mem[0000000010081410] = 000037000000004b, %f18 = 00000000 0000005d
	ldda	[%i2+%o5]0x88,%f18	! %f18 = 00003700 0000004b
!	Mem[0000000010041410] = 380000ff, %l4 = 0000000009c05727
	ldsha	[%i1+%o5]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030141400] = 000000001f5044f9, %l3 = ffffffffffffffff
	ldxa	[%i5+%g0]0x81,%l3	! %l3 = 000000001f5044f9
!	Mem[00000000100c1438] = 162d60ba00000058, %l2 = 000000004cdb8901
	ldx	[%i3+0x038],%l2		! %l2 = 162d60ba00000058
!	Mem[0000000010001408] = 2be94812, %l3 = 000000001f5044f9
	lduha	[%i0+%o4]0x88,%l3	! %l3 = 0000000000004812

p0_label_57:
!	Starting 10 instruction Store Burst
!	Mem[0000000010081408] = 3c5036ff, %l5 = 000000001248e92b
	swapa	[%i2+%o4]0x88,%l5	! %l5 = 000000003c5036ff
!	%l4 = 000000ff, %l5 = 3c5036ff, Mem[0000000030181408] = 37002cff 9f05fe41
	stda	%l4,[%i6+%o4]0x89	! Mem[0000000030181408] = 000000ff 3c5036ff
!	Mem[000000001004141c] = d0568d02, %l0 = 000000ff, %l4 = 000000ff
	add	%i1,0x1c,%g1
	casa	[%g1]0x80,%l0,%l4	! %l4 = 00000000d0568d02
!	Mem[000000001014141c] = 05dfe0eb, %l4 = 00000000d0568d02
	ldstub	[%i5+0x01c],%l4		! %l4 = 0000000000000005
!	%l1 = 0000000000000000, Mem[00000000211c0000] = ffff8f28, %asi = 80
	stha	%l1,[%o2+0x000]%asi	! Mem[00000000211c0000] = 00008f28
!	%l2 = 162d60ba00000058, Mem[00000000211c0001] = 00008f28
	stb	%l2,[%o2+0x001]		! Mem[00000000211c0000] = 00588f28
!	%f2  = 00000000, Mem[0000000010041410] = 380000ff
	sta	%f2 ,[%i1+%o5]0x88	! Mem[0000000010041410] = 00000000
!	%l4 = 00000005, %l5 = 3c5036ff, Mem[0000000010181418] = a1f97c2b d0568d02, %asi = 80
	stda	%l4,[%i6+0x018]%asi	! Mem[0000000010181418] = 00000005 3c5036ff
!	Mem[00000000201c0000] = ffff9298, %l2 = 162d60ba00000058
	ldstuba	[%o0+0x000]%asi,%l2	! %l2 = 00000000000000ff
!	%l5 = 000000003c5036ff, Mem[0000000030141400] = 00000000
	stha	%l5,[%i5+%g0]0x89	! Mem[0000000030141400] = 000036ff

p0_label_58:
!	Starting 10 instruction Load Burst
!	Mem[0000000030101410] = 05417a6a, %l3 = 0000000000004812
	ldswa	[%i4+%o5]0x81,%l3	! %l3 = 0000000005417a6a
!	Mem[0000000010101410] = 0000000000000000, %f24 = 500923e0 09ce2871
	ldda	[%i4+%o5]0x80,%f24	! %f24 = 00000000 00000000
!	Mem[0000000030001410] = 0000002750e0aed5, %f18 = 00003700 0000004b
	ldda	[%i0+%o5]0x81,%f18	! %f18 = 00000027 50e0aed5
!	Mem[0000000010141410] = 5d000000 00000000, %l2 = 000000ff, %l3 = 05417a6a
	ldda	[%i5+%o5]0x88,%l2	! %l2 = 0000000000000000 000000005d000000
!	Mem[0000000010181408] = 262effff, %l7 = 000000000000b08d
	lduwa	[%i6+%o4]0x88,%l7	! %l7 = 00000000262effff
!	Mem[0000000030041408] = 11d9008d, %f7  = 1248e92b
	lda	[%i1+%o4]0x89,%f7 	! %f7 = 11d9008d
!	Mem[00000000211c0001] = 00588f28, %l4 = 0000000000000005, %asi = 80
	lduba	[%o2+0x001]%asi,%l4	! %l4 = 0000000000000058
!	Mem[0000000030141408] = 000000ff, %l1 = 0000000000000000
	lduha	[%i5+%o4]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030181400] = 000000006853b85b, %l3 = 000000005d000000
	ldxa	[%i6+%g0]0x81,%l3	! %l3 = 000000006853b85b
!	Mem[0000000010081408] = 2be94812262eff0f, %l0 = 00000000000000ff
	ldx	[%i2+%o4],%l0		! %l0 = 2be94812262eff0f

p0_label_59:
!	Starting 10 instruction Store Burst
!	%l0 = 262eff0f, %l1 = 000000ff, Mem[0000000010041410] = 00000000 ff2c0000
	stda	%l0,[%i1+%o5]0x88	! Mem[0000000010041410] = 262eff0f 000000ff
	membar	#Sync			! Added by membar checker (14)
!	%f5  = ff9d1c37, Mem[00000000100c1400] = 8dff0564
	sta	%f5 ,[%i3+%g0]0x80	! Mem[00000000100c1400] = ff9d1c37
!	Mem[000000001010140d] = 5187c8ef, %l3 = 000000006853b85b
	ldstub	[%i4+0x00d],%l3		! %l3 = 0000000000000087
!	%f4  = ff000000 ff9d1c37, %f11 = 78fcf366
	fdtos	%f4 ,%f11		! %f11 = ff800000
!	Mem[0000000010141423] = 3175ce70, %l3 = 0000000000000087
	ldstub	[%i5+0x023],%l3		! %l3 = 0000000000000070
!	%l0 = 2be94812262eff0f, imm = 00000000000002a2, %l2 = 0000000000000000
	subc	%l0,0x2a2,%l2		! %l2 = 2be94812262efc6d
!	%l2 = 2be94812262efc6d, Mem[0000000030081408] = 11fcf366
	stha	%l2,[%i2+%o4]0x81	! Mem[0000000030081408] = fc6df366
!	Mem[0000000010041419] = 531f7bff, %l4 = 0000000000000058
	ldstuba	[%i1+0x019]%asi,%l4	! %l4 = 000000000000001f
!	%f10 = 005d0000, Mem[0000000030141410] = 00000037
	sta	%f10,[%i5+%o5]0x89	! Mem[0000000030141410] = 005d0000
!	%l7 = 00000000262effff, Mem[0000000010101408] = c2000000
	stba	%l7,[%i4+%o4]0x88	! Mem[0000000010101408] = c20000ff

p0_label_60:
!	Starting 10 instruction Load Burst
!	%l3 = 0000000000000070, %l4 = 000000000000001f, %l1 = 00000000000000ff
	orn	%l3,%l4,%l1		! %l1 = fffffffffffffff0
!	Mem[0000000010041410] = 262eff0f, %l0 = 2be94812262eff0f
	lduha	[%i1+%o5]0x88,%l0	! %l0 = 000000000000ff0f
!	Mem[0000000010141408] = 00000000 d4df8bac, %l4 = 0000001f, %l5 = 3c5036ff
	ldda	[%i5+%o4]0x80,%l4	! %l4 = 0000000000000000 00000000d4df8bac
!	Mem[0000000010181424] = b08d183b, %l5 = 00000000d4df8bac, %asi = 80
	ldsha	[%i6+0x024]%asi,%l5	! %l5 = ffffffffffffb08d
!	Mem[00000000100c1430] = 11d996ff 000000ff, %l0 = 0000ff0f, %l1 = fffffff0
	ldd	[%i3+0x030],%l0		! %l0 = 0000000011d996ff 00000000000000ff
!	Mem[0000000010101426] = 33abd3e1, %l3 = 0000000000000070
	lduh	[%i4+0x026],%l3		! %l3 = 000000000000d3e1
	membar	#Sync			! Added by membar checker (15)
!	Mem[0000000030081400] = 0000003a 0000004b fc6df366 4c0e4e1f
!	Mem[0000000030081410] = ff4b0000 ffffffa9 0b9f9532 5efcd93b
!	Mem[0000000030081420] = 12cf738a 50c0f591 1ef470be 78059f17
!	Mem[0000000030081430] = 276dc86c 6eb5f34d 0335b20a 522e9bb3
	ldda	[%i2+%g0]ASI_BLK_S,%f16	! Block Load from 0000000030081400
!	Mem[00000000100c1408] = 00000000, %l6 = 0000000000000000
	ldsba	[%i3+%o4]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000030181410] = 00000000, %f5  = ff9d1c37
	lda	[%i6+%o5]0x81,%f5 	! %f5 = 00000000
!	Mem[00000000218000c0] = 00ffa7e8, %l0 = 0000000011d996ff
	lduh	[%o3+0x0c0],%l0		! %l0 = 00000000000000ff

p0_label_61:
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (16)
!	%f4  = ff000000 00000000, %l4 = 0000000000000000
!	Mem[0000000030081430] = 276dc86c6eb5f34d
	add	%i2,0x030,%g1
	stda	%f4,[%g1+%l4]ASI_PST16_S ! Mem[0000000030081430] = 276dc86c6eb5f34d
!	Mem[0000000030181410] = 00000000, %l3 = 000000000000d3e1
	swapa	[%i6+%o5]0x89,%l3	! %l3 = 0000000000000000
!	%l3 = 0000000000000000, Mem[0000000030041410] = 8db0ffff
	stwa	%l3,[%i1+%o5]0x81	! Mem[0000000030041410] = 00000000
!	Mem[00000000211c0000] = 00588f28, %l5 = ffffffffffffb08d
	ldstub	[%o2+%g0],%l5		! %l5 = 0000000000000000
!	%l2 = 262efc6d, %l3 = 00000000, Mem[0000000030101400] = 9f000000 2b6efe19
	stda	%l2,[%i4+%g0]0x81	! Mem[0000000030101400] = 262efc6d 00000000
!	%l3 = 0000000000000000, immd = fffff0e4, %y  = 0000018b
	smul	%l3,-0xf1c,%l2		! %l2 = 0000000000000000, %y = 00000000
!	Mem[0000000030141408] = 000000ff, %l2 = 0000000000000000
	swapa	[%i5+%o4]0x89,%l2	! %l2 = 00000000000000ff
!	%l0 = 00000000000000ff, Mem[00000000100c1410] = ff000000
	stha	%l0,[%i3+%o5]0x80	! Mem[00000000100c1410] = 00ff0000
!	%l2 = 00000000000000ff, %l1 = 00000000000000ff, %l7 = 00000000262effff
	orn	%l2,%l1,%l7		! %l7 = ffffffffffffffff
!	%f20 = ff4b0000, %f3  = 6a7a4105
	fcmpes	%fcc2,%f20,%f3 		! %fcc2 = 1

p0_label_62:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = c92dc3725d000000, %f18 = fc6df366 4c0e4e1f
	ldda	[%i6+%g0]0x80,%f18	! %f18 = c92dc372 5d000000
!	Mem[00000000218001c0] = 11b780a8, %l3 = 0000000000000000, %asi = 80
	lduha	[%o3+0x1c0]%asi,%l3	! %l3 = 00000000000011b7
!	Mem[0000000010001408] = 2be94812, %l1 = 00000000000000ff
	ldsha	[%i0+%o4]0x88,%l1	! %l1 = 0000000000004812
!	Mem[0000000030141410] = 00005d00 ff2c0000, %l0 = 000000ff, %l1 = 00004812
	ldda	[%i5+%o5]0x81,%l0	! %l0 = 0000000000005d00 00000000ff2c0000
!	Mem[0000000030041408] = 11d9008d, %l7 = ffffffffffffffff
	ldswa	[%i1+%o4]0x89,%l7	! %l7 = 0000000011d9008d
!	Mem[0000000010141410] = 00000000, %l2 = 00000000000000ff
	ldsb	[%i5+%o5],%l2		! %l2 = 0000000000000000
!	Mem[0000000010181408] = 262effff, %l1 = 00000000ff2c0000
	lduba	[%i6+%o4]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010041438] = ffff4dfa 796b91e3, %l0 = 00005d00, %l1 = 000000ff, %asi = 80
	ldda	[%i1+0x038]%asi,%l0	! %l0 = 00000000ffff4dfa 00000000796b91e3
!	Mem[0000000030141410] = 00002cff 005d0000, %l2 = 00000000, %l3 = 000011b7
	ldda	[%i5+%o5]0x89,%l2	! %l2 = 00000000005d0000 0000000000002cff
!	Mem[0000000030181400] = 000000006853b85b, %f18 = c92dc372 5d000000
	ldda	[%i6+%g0]0x81,%f18	! %f18 = 00000000 6853b85b

p0_label_63:
!	Starting 10 instruction Store Burst
!	Mem[0000000010141406] = ffcd0000, %l2 = 00000000005d0000
	ldstub	[%i5+0x006],%l2		! %l2 = 0000000000000000
!	%f18 = 00000000 6853b85b, Mem[00000000300c1410] = 00000000 05417a6a
	stda	%f18,[%i3+%o5]0x89	! Mem[00000000300c1410] = 00000000 6853b85b
!	%l4 = 0000000000000000, Mem[00000000100c1405] = 72c32dc9, %asi = 80
	stba	%l4,[%i3+0x005]%asi	! Mem[00000000100c1404] = 72002dc9
!	%f24 = 12cf738a 50c0f591, %l6 = 0000000000000000
!	Mem[0000000010041428] = ba602d16432b2e47
	add	%i1,0x028,%g1
	stda	%f24,[%g1+%l6]ASI_PST8_P ! Mem[0000000010041428] = ba602d16432b2e47
!	%f28 = 276dc86c 6eb5f34d, Mem[0000000010141410] = 00000000 0000005d
	stda	%f28,[%i5+%o5]0x80	! Mem[0000000010141410] = 276dc86c 6eb5f34d
!	Mem[00000000300c1408] = 00000000, %l4 = 0000000000000000
	ldstuba	[%i3+%o4]0x81,%l4	! %l4 = 0000000000000000
!	%l4 = 0000000000000000, Mem[0000000010101410] = 00000000
	stha	%l4,[%i4+%o5]0x88	! Mem[0000000010101410] = 00000000
!	%l4 = 0000000000000000, Mem[0000000010101410] = 00000000
	stwa	%l4,[%i4+%o5]0x80	! Mem[0000000010101410] = 00000000
!	%l1 = 00000000796b91e3, Mem[0000000030081400] = 0000003a
	stha	%l1,[%i2+%g0]0x81	! Mem[0000000030081400] = 91e3003a
!	%f24 = 12cf738a 50c0f591, %l5 = 0000000000000000
!	Mem[0000000010081408] = 2be94812262eff0f
	add	%i2,0x008,%g1
	stda	%f24,[%g1+%l5]ASI_PST16_PL ! Mem[0000000010081408] = 2be94812262eff0f

p0_label_64:
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = 5bb85368, %l2 = 0000000000000000
	lduba	[%i3+%o5]0x81,%l2	! %l2 = 000000000000005b
!	Mem[0000000030081400] = 91e3003a, %l5 = 0000000000000000
	ldsha	[%i2+%g0]0x81,%l5	! %l5 = ffffffffffff91e3
!	Mem[0000000010141400] = bd212664, %l5 = ffffffffffff91e3
	lduwa	[%i5+%g0]0x80,%l5	! %l5 = 00000000bd212664
!	Mem[00000000100c143d] = 00000058, %l5 = 00000000bd212664
	ldsb	[%i3+0x03d],%l5		! %l5 = 0000000000000000
!	Mem[0000000010181408] = 262effff, %l7 = 0000000011d9008d
	ldsha	[%i6+%o4]0x88,%l7	! %l7 = ffffffffffffffff
!	Mem[00000000300c1408] = 000000ff, %l4 = 0000000000000000
	lduha	[%i3+%o4]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010041404] = 525ea51b, %l1 = 00000000796b91e3
	lduw	[%i1+0x004],%l1		! %l1 = 00000000525ea51b
!	Mem[0000000030101408] = 000057272757c009, %f20 = ff4b0000 ffffffa9
	ldda	[%i4+%o4]0x81,%f20	! %f20 = 00005727 2757c009
!	Mem[0000000010001410] = 00000000, %l3 = 0000000000002cff, %asi = 80
	ldswa	[%i0+0x010]%asi,%l3	! %l3 = 0000000000000000
!	Mem[0000000010181410] = 0f0000006a7a4105, %f16 = 0000003a 0000004b
	ldda	[%i6+%o5]0x88,%f16	! %f16 = 0f000000 6a7a4105

p0_label_65:
!	Starting 10 instruction Store Burst
!	%l1 = 00000000525ea51b, Mem[0000000010041415] = ff000000
	stb	%l1,[%i1+0x015]		! Mem[0000000010041414] = ff1b0000
!	Mem[0000000030001410] = 00000027, %l2 = 000000000000005b
	swapa	[%i0+%o5]0x81,%l2	! %l2 = 0000000000000027
!	%l6 = 0000000000000000, Mem[0000000030141408] = 00000000
	stba	%l6,[%i5+%o4]0x81	! Mem[0000000030141408] = 00000000
!	Mem[0000000030001410] = 0000005b, %l4 = 00000000000000ff
	ldstuba	[%i0+%o5]0x81,%l4	! %l4 = 0000000000000000
!	%l7 = ffffffffffffffff, Mem[0000000030101400] = 6dfc2e26
	stwa	%l7,[%i4+%g0]0x89	! Mem[0000000030101400] = ffffffff
!	Mem[0000000010081408] = 2be94812, %l6 = 00000000, %l2 = 00000027
	add	%i2,0x08,%g1
	casa	[%g1]0x80,%l6,%l2	! %l2 = 000000002be94812
!	%f12 = 11d996ff, %f10 = 005d0000, %f17 = 6a7a4105
	fadds	%f12,%f10,%f17		! tt=0x22, %l0 = 00000000ffff4e1c
!	%f13 = 000000ff, Mem[00000000100c1400] = ff9d1c37
	sta	%f13,[%i3+%g0]0x80	! Mem[00000000100c1400] = 000000ff
!	%f8  = 3b188db0 4cdb8901, Mem[00000000100c1408] = 00000000 05417a6a
	stda	%f8 ,[%i3+%o4]0x88	! Mem[00000000100c1408] = 3b188db0 4cdb8901
!	Mem[0000000030081410] = ff4b0000, %l1 = 00000000525ea51b
	swapa	[%i2+%o5]0x81,%l1	! %l1 = 00000000ff4b0000

p0_label_66:
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = ff588f28, %l7 = ffffffffffffffff, %asi = 80
	lduha	[%o2+0x000]%asi,%l7	! %l7 = 000000000000ff58
!	%f9  = 4cdb8901, Mem[00000000100c1400] = 000000ff
	sta	%f9 ,[%i3+%g0]0x80	! Mem[00000000100c1400] = 4cdb8901
!	Mem[00000000211c0001] = ff588f28, %l0 = 00000000ffff4e1c
	ldsb	[%o2+0x001],%l0		! %l0 = 0000000000000058
!	Mem[0000000030041410] = 00000000, %l7 = 000000000000ff58
	lduwa	[%i1+%o5]0x81,%l7	! %l7 = 0000000000000000
!	%f27 = 78059f17, %f29 = 6eb5f34d, %f16 = 0f000000 6a7a4105
	fsmuld	%f27,%f29,%f16		! %f16 = 4ce7be1e 5dabbac0
!	Mem[0000000010181410] = 05417a6a0000000f, %f8  = 3b188db0 4cdb8901
	ldda	[%i6+%o5]0x80,%f8 	! %f8  = 05417a6a 0000000f
!	Mem[0000000030081400] = 3a00e391, %l7 = 0000000000000000
	ldswa	[%i2+%g0]0x89,%l7	! %l7 = 000000003a00e391
!	Mem[0000000010141410] = 276dc86c6eb5f34d, %l4 = 0000000000000000
	ldxa	[%i5+%o5]0x80,%l4	! %l4 = 276dc86c6eb5f34d
!	Mem[0000000010081410] = 4b000000, %l4 = 276dc86c6eb5f34d
	lduwa	[%i2+%o5]0x80,%l4	! %l4 = 000000004b000000
!	Mem[0000000010001404] = 0000009f, %l1 = 00000000ff4b0000, %asi = 80
	ldswa	[%i0+0x004]%asi,%l1	! %l1 = 000000000000009f

p0_label_67:
!	Starting 10 instruction Store Burst
!	%l6 = 0000000000000000, Mem[0000000010001410] = 0000000000000000
	stxa	%l6,[%i0+%o5]0x80	! Mem[0000000010001410] = 0000000000000000
!	Mem[0000000020800040] = 68273ef8, %l7 = 000000003a00e391
	ldstub	[%o1+0x040],%l7		! %l7 = 0000000000000068
!	%l1 = 000000000000009f, Mem[00000000100c1428] = 005d000078fcf366
	stx	%l1,[%i3+0x028]		! Mem[00000000100c1428] = 000000000000009f
!	Mem[0000000030081410] = 525ea51b, %l6 = 0000000000000000
	swapa	[%i2+%o5]0x81,%l6	! %l6 = 00000000525ea51b
!	%l1 = 000000000000009f, Mem[0000000020800041] = ff273ef8, %asi = 80
	stba	%l1,[%o1+0x041]%asi	! Mem[0000000020800040] = ff9f3ef8
!	%l6 = 00000000525ea51b, %l1 = 000000000000009f, %l5 = 0000000000000000
	andn	%l6,%l1,%l5		! %l5 = 00000000525ea500
!	%l0 = 00000058, %l1 = 0000009f, Mem[0000000010001410] = 00000000 00000000
	stda	%l0,[%i0+%o5]0x80	! Mem[0000000010001410] = 00000058 0000009f
!	Mem[00000000100c1414] = 6a7a4105, %l1 = 0000009f, %l6 = 525ea51b
	add	%i3,0x14,%g1
	casa	[%g1]0x80,%l1,%l6	! %l6 = 000000006a7a4105
!	%l4 = 000000004b000000, Mem[00000000211c0000] = ff588f28
	sth	%l4,[%o2+%g0]		! Mem[00000000211c0000] = 00008f28
!	%f10 = 005d0000 ff800000, Mem[0000000030001408] = 0000003a 00000000
	stda	%f10,[%i0+%o4]0x89	! Mem[0000000030001408] = 005d0000 ff800000

p0_label_68:
!	Starting 10 instruction Load Burst
!	Mem[0000000021800180] = 2cff5078, %l7 = 0000000000000068
	lduh	[%o3+0x180],%l7		! %l7 = 0000000000002cff
!	Mem[0000000010041428] = ba602d16432b2e47, %l4 = 000000004b000000
	ldx	[%i1+0x028],%l4		! %l4 = ba602d16432b2e47
!	Mem[0000000030041400] = 00004529, %l1 = 000000000000009f
	lduba	[%i1+%g0]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000010041434] = ff2a2ffd, %l6 = 000000006a7a4105, %asi = 80
	ldswa	[%i1+0x034]%asi,%l6	! %l6 = ffffffffff2a2ffd
!	Mem[0000000010041410] = 0fff2e26, %l2 = 000000002be94812
	lduha	[%i1+%o5]0x80,%l2	! %l2 = 0000000000000fff
!	Mem[0000000030081410] = 00000000, %f21 = 2757c009
	lda	[%i2+%o5]0x89,%f21	! %f21 = 00000000
!	Mem[0000000010141400] = 642621bd, %l4 = ba602d16432b2e47
	lduha	[%i5+%g0]0x88,%l4	! %l4 = 00000000000021bd
!	Mem[0000000030101408] = 27570000, %l6 = ffffffffff2a2ffd
	ldswa	[%i4+%o4]0x89,%l6	! %l6 = 0000000027570000
!	Mem[0000000010081410] = 4b000000, %l3 = 0000000000000000
	lduwa	[%i2+%o5]0x80,%l3	! %l3 = 000000004b000000
!	Mem[0000000020800041] = ff9f3ef8, %l1 = 0000000000000000, %asi = 80
	lduba	[%o1+0x041]%asi,%l1	! %l1 = 000000000000009f

p0_label_69:
!	Starting 10 instruction Store Burst
!	%l7 = 0000000000002cff, Mem[0000000030101400] = ffffffff
	stwa	%l7,[%i4+%g0]0x81	! Mem[0000000030101400] = 00002cff
!	%l6 = 0000000027570000, Mem[00000000100c1410] = 00ff0000
	stba	%l6,[%i3+%o5]0x80	! Mem[00000000100c1410] = 00ff0000
!	%f18 = 00000000 6853b85b, %l2 = 0000000000000fff
!	Mem[0000000010041430] = 58d1dcdcff2a2ffd
	add	%i1,0x030,%g1
	stda	%f18,[%g1+%l2]ASI_PST32_PL ! Mem[0000000010041430] = 5bb8536800000000
!	%l1 = 000000000000009f, Mem[0000000030081400] = 3a00e391
	stwa	%l1,[%i2+%g0]0x89	! Mem[0000000030081400] = 0000009f
!	Mem[0000000010181400] = 72c32dc9, %l1 = 000000000000009f
	ldstuba	[%i6+%g0]0x88,%l1	! %l1 = 00000000000000c9
!	%l0 = 00000058, %l1 = 000000c9, Mem[0000000010181408] = 262effff 0036503c
	stda	%l0,[%i6+%o4]0x88	! Mem[0000000010181408] = 00000058 000000c9
!	Mem[0000000010001415] = 0000009f, %l3 = 000000004b000000
	ldstuba	[%i0+0x015]%asi,%l3	! %l3 = 0000000000000000
!	Mem[0000000010101410] = 00000000, %l6 = 0000000027570000
	swapa	[%i4+%o5]0x80,%l6	! %l6 = 0000000000000000
!	%f4  = ff000000 00000000, %l4 = 00000000000021bd
!	Mem[0000000010001438] = 47baaeec6fb31203
	add	%i0,0x038,%g1
	stda	%f4,[%g1+%l4]ASI_PST32_P ! Mem[0000000010001438] = 47baaeec00000000
!	Mem[000000001018142c] = 0000005d, %l3 = 0000000000000000, %asi = 80
	swapa	[%i6+0x02c]%asi,%l3	! %l3 = 000000000000005d

p0_label_70:
!	Starting 10 instruction Load Burst
!	Mem[0000000020800040] = ff9f3ef8, %l7 = 0000000000002cff, %asi = 80
	ldsha	[%o1+0x040]%asi,%l7	! %l7 = ffffffffffffff9f
	membar	#Sync			! Added by membar checker (17)
!	Mem[00000000300c1400] = f76069e5 bc59330d ff000000 0000005d
!	Mem[00000000300c1410] = 5bb85368 00000000 2a53b292 525ea51b
!	Mem[00000000300c1420] = 500923e0 09ce2871 7fdb8c1e 27d7b0f7
!	Mem[00000000300c1430] = 1672e6cc 0b101c2d 44282b6a 1248d32b
	ldda	[%i3+%g0]ASI_BLK_SL,%f16	! Block Load from 00000000300c1400
!	Mem[0000000010041408] = 4f1f0b00f33b0000, %l3 = 000000000000005d
	ldxa	[%i1+%o4]0x88,%l3	! %l3 = 4f1f0b00f33b0000
!	%l1 = 00000000000000c9, imm = 0000000000000cb1, %l6 = 0000000000000000
	addc	%l1,0xcb1,%l6		! %l6 = 0000000000000d7a
!	Mem[00000000300c1400] = 0d3359bc e56960f7, %l6 = 00000d7a, %l7 = ffffff9f
	ldda	[%i3+%g0]0x89,%l6	! %l6 = 00000000e56960f7 000000000d3359bc
!	Mem[00000000100c1408] = 0189db4c, %l1 = 00000000000000c9
	ldsha	[%i3+%o4]0x80,%l1	! %l1 = 0000000000000189
!	Mem[0000000021800100] = 1057e418, %l2 = 0000000000000fff
	ldsh	[%o3+0x100],%l2		! %l2 = 0000000000001057
!	Mem[0000000010001418] = 630075ff371c9d8b, %f0  = e237005d 72c32dc9
	ldd	[%i0+0x018],%f0 	! %f0  = 630075ff 371c9d8b
!	Mem[0000000030181408] = ff000000, %l0 = 0000000000000058
	ldsba	[%i6+%o4]0x81,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010041400] = 92b2532a, %l0 = ffffffffffffffff
	ldswa	[%i1+%g0]0x88,%l0	! %l0 = ffffffff92b2532a

p0_label_71:
!	Starting 10 instruction Store Burst
!	Mem[00000000100c143e] = 00000058, %l5 = 00000000525ea500
	ldstuba	[%i3+0x03e]%asi,%l5	! %l5 = 0000000000000000
!	Mem[0000000010101408] = c20000ff, %l5 = 0000000000000000
	swapa	[%i4+%o4]0x88,%l5	! %l5 = 00000000c20000ff
!	%l7 = 000000000d3359bc, %l0 = ffffffff92b2532a, %l2 = 0000000000001057
	and	%l7,%l0,%l2		! %l2 = 0000000000325128
!	Mem[0000000010041430] = 5bb85368, %l2 = 0000000000325128
	swap	[%i1+0x030],%l2		! %l2 = 000000005bb85368
!	Mem[0000000010141424] = 6ee44ec1, %l0 = 92b2532a, %l7 = 0d3359bc
	add	%i5,0x24,%g1
	casa	[%g1]0x80,%l0,%l7	! %l7 = 000000006ee44ec1
!	%f10 = 005d0000 ff800000, %l0 = ffffffff92b2532a
!	Mem[0000000030141420] = 0e7254a0537d1e31
	add	%i5,0x020,%g1
	stda	%f10,[%g1+%l0]ASI_PST32_SL ! Mem[0000000030141420] = 0e7254a000005d00
!	%f18 = 5d000000, Mem[0000000010141404] = ffcdff00
	sta	%f18,[%i5+0x004]%asi	! Mem[0000000010141404] = 5d000000
!	%l6 = e56960f7, %l7 = 6ee44ec1, Mem[0000000030081400] = 0000009f 4b000000
	stda	%l6,[%i2+%g0]0x89	! Mem[0000000030081400] = e56960f7 6ee44ec1
!	%f2  = 00000000, %f1  = 371c9d8b, %f3  = 6a7a4105
	fmuls	%f2 ,%f1 ,%f3 		! %f3  = 00000000
!	Mem[00000000211c0000] = 00008f28, %l7 = 000000006ee44ec1
	ldstub	[%o2+%g0],%l7		! %l7 = 0000000000000000

p0_label_72:
!	Starting 10 instruction Load Burst
!	Mem[0000000021800000] = 1a90db58, %l3 = 4f1f0b00f33b0000
	ldsb	[%o3+%g0],%l3		! %l3 = 000000000000001a
!	Mem[0000000010081408] = 2be94812, %l4 = 00000000000021bd
	ldsha	[%i2+%o4]0x80,%l4	! %l4 = 0000000000002be9
!	Mem[0000000010081408] = 1248e92b, %l4 = 0000000000002be9
	lduha	[%i2+%o4]0x88,%l4	! %l4 = 000000000000e92b
!	Mem[00000000100c1400] = 4cdb890172002dc9, %l7 = 0000000000000000
	ldxa	[%i3+%g0]0x80,%l7	! %l7 = 4cdb890172002dc9
!	Mem[0000000030081410] = a9ffffff 00000000, %l2 = 5bb85368, %l3 = 0000001a
	ldda	[%i2+%o5]0x89,%l2	! %l2 = 0000000000000000 00000000a9ffffff
!	Mem[00000000100c1400] = 0189db4c, %f12 = 11d996ff
	lda	[%i3+%g0]0x88,%f12	! %f12 = 0189db4c
!	Mem[0000000010101400] = ff89db4cb08d183b, %f4  = ff000000 00000000
	ldda	[%i4+%g0]0x80,%f4 	! %f4  = ff89db4c b08d183b
!	Mem[0000000021800100] = 1057e418, %l2 = 0000000000000000
	lduh	[%o3+0x100],%l2		! %l2 = 0000000000001057
!	Mem[00000000100c1410] = 00ff00006a7a4105, %f10 = 005d0000 ff800000
	ldda	[%i3+%o5]0x80,%f10	! %f10 = 00ff0000 6a7a4105
!	Mem[0000000010101408] = 00000000, %l1 = 0000000000000189
	lduwa	[%i4+%o4]0x80,%l1	! %l1 = 0000000000000000

p0_label_73:
!	Starting 10 instruction Store Burst
!	%f8  = 05417a6a 0000000f, %l7 = 4cdb890172002dc9
!	Mem[0000000030081420] = 12cf738a50c0f591
	add	%i2,0x020,%g1
	stda	%f8,[%g1+%l7]ASI_PST8_S ! Mem[0000000030081420] = 0541738a00c0f50f
!	Mem[0000000030001400] = 00000005, %l1 = 0000000000000000
	ldstuba	[%i0+%g0]0x89,%l1	! %l1 = 0000000000000005
!	Mem[0000000030141410] = 005d0000, %l2 = 0000000000001057
	ldstuba	[%i5+%o5]0x89,%l2	! %l2 = 0000000000000000
!	%f22 = 1ba55e52, Mem[0000000010181404] = 5d000000
	sta	%f22,[%i6+0x004]%asi	! Mem[0000000010181404] = 1ba55e52
!	%l1 = 0000000000000005, Mem[0000000030101400] = ff2c0000
	stba	%l1,[%i4+%g0]0x89	! Mem[0000000030101400] = ff2c0005
!	%f6  = 09c05727 11d9008d, Mem[0000000030041410] = 00000000 00000000
	stda	%f6 ,[%i1+%o5]0x89	! Mem[0000000030041410] = 09c05727 11d9008d
!	%l0 = ffffffff92b2532a, Mem[0000000030001400] = 000000ff
	stba	%l0,[%i0+%g0]0x89	! Mem[0000000030001400] = 0000002a
!	%f0  = 630075ff 371c9d8b, Mem[0000000010041418] = 53ff7bff d0568d02, %asi = 80
	stda	%f0 ,[%i1+0x018]%asi	! Mem[0000000010041418] = 630075ff 371c9d8b
!	%l5 = 00000000c20000ff, Mem[0000000010141408] = 00000000
	stba	%l5,[%i5+%o4]0x80	! Mem[0000000010141408] = ff000000
!	Mem[00000000100c1410] = 00ff0000, %l4 = 000000000000e92b
	ldstuba	[%i3+%o5]0x80,%l4	! %l4 = 0000000000000000

p0_label_74:
!	Starting 10 instruction Load Burst
!	Mem[0000000030101410] = 05417a6a, %l5 = 00000000c20000ff
	lduha	[%i4+%o5]0x81,%l5	! %l5 = 0000000000000541
!	Mem[0000000010181424] = b08d183b, %l2 = 0000000000000000
	lduw	[%i6+0x024],%l2		! %l2 = 00000000b08d183b
!	Mem[0000000020800001] = 05ffeac8, %l6 = 00000000e56960f7, %asi = 80
	ldsba	[%o1+0x001]%asi,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000030001400] = 2a000000, %l4 = 0000000000000000
	lduwa	[%i0+%g0]0x81,%l4	! %l4 = 000000002a000000
!	Mem[0000000030141408] = 371c9dff00000000, %l6 = ffffffffffffffff
	ldxa	[%i5+%o4]0x89,%l6	! %l6 = 371c9dff00000000
!	%f15 = 00000058, %f20 = 00000000, %f15 = 00000058
	fdivs	%f15,%f20,%f15		! %f15 = 7f800000
!	Mem[00000000100c1408] = 0189db4c, %f27 = 1e8cdb7f
	lda	[%i3+%o4]0x80,%f27	! %f27 = 0189db4c
!	Mem[0000000010101410] = 2757000000000000, %l1 = 0000000000000005
	ldxa	[%i4+%o5]0x80,%l1	! %l1 = 2757000000000000
!	Mem[0000000010081410] = 00003700 0000004b, %l4 = 2a000000, %l5 = 00000541
	ldda	[%i2+%o5]0x88,%l4	! %l4 = 000000000000004b 0000000000003700
!	Mem[0000000030041400] = 0000452966a24265, %f4  = ff89db4c b08d183b
	ldda	[%i1+%g0]0x81,%f4 	! %f4  = 00004529 66a24265

p0_label_75:
!	Starting 10 instruction Store Burst
!	%l4 = 000000000000004b, Mem[00000000100c1438] = 162d60ba, %asi = 80
	stwa	%l4,[%i3+0x038]%asi	! Mem[00000000100c1438] = 0000004b
!	Mem[0000000010181434] = 93da8545, %l4 = 000000000000004b
	swap	[%i6+0x034],%l4		! %l4 = 0000000093da8545
!	Mem[0000000030141400] = 000036ff, %l1 = 0000000000000000
	swapa	[%i5+%g0]0x89,%l1	! %l1 = 00000000000036ff
!	Mem[00000000100c1408] = 0189db4c, %l6 = 371c9dff00000000
	ldstuba	[%i3+%o4]0x80,%l6	! %l6 = 0000000000000001
!	%f16 = 0d3359bc e56960f7, Mem[0000000030101400] = 05002cff 00000000
	stda	%f16,[%i4+%g0]0x81	! Mem[0000000030101400] = 0d3359bc e56960f7
!	%l6 = 0000000000000001, Mem[0000000030081408] = fc6df366
	stha	%l6,[%i2+%o4]0x81	! Mem[0000000030081408] = 0001f366
!	%l5 = 0000000000003700, Mem[00000000211c0001] = ff008f28
	stb	%l5,[%o2+0x001]		! Mem[00000000211c0000] = ff008f28
	membar	#Sync			! Added by membar checker (18)
!	%l4 = 0000000093da8545, Mem[00000000300c1400] = e56960f7
	stwa	%l4,[%i3+%g0]0x89	! Mem[00000000300c1400] = 93da8545
!	%l3 = 00000000a9ffffff, Mem[0000000030001410] = 5b0000ff
	stha	%l3,[%i0+%o5]0x89	! Mem[0000000030001410] = 5b00ffff
!	%f4  = 00004529, Mem[0000000010081408] = 2be94812
	sta	%f4 ,[%i2+0x008]%asi	! Mem[0000000010081408] = 00004529

p0_label_76:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = 1248e92b, %l1 = 00000000000036ff
	ldswa	[%i0+%o4]0x80,%l1	! %l1 = 000000001248e92b
!	Mem[0000000021800001] = 1a90db58, %l3 = 00000000a9ffffff
	ldub	[%o3+0x001],%l3		! %l3 = 0000000000000090
!	%l7 = 4cdb890172002dc9, %l0 = ffffffff92b2532a, %y  = 00000000
	umul	%l7,%l0,%l7		! %l7 = 415383453aa1adfa, %y = 41538345
!	Mem[0000000010101424] = 33abd3e1, %l4 = 0000000093da8545
	ldsw	[%i4+0x024],%l4		! %l4 = 0000000033abd3e1
!	Mem[0000000010181400] = ff2dc3721ba55e52, %f24 = 7128ce09 e0230950
	ldd	[%i6+%g0],%f24		! %f24 = ff2dc372 1ba55e52
!	Code Fragment 3, seed = 320242
p0_fragment_7:
!	%l0 = ffffffff92b2532a
	setx	0xdaaec3a5e29ff296,%g7,%l0 ! %l0 = daaec3a5e29ff296
!	%l1 = 000000001248e92b
	setx	0x9578d26cd581dbc1,%g7,%l1 ! %l1 = 9578d26cd581dbc1
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = daaec3a5e29ff296
	setx	0xaa6267a467d718fc,%g7,%l0 ! %l0 = aa6267a467d718fc
!	%l1 = 9578d26cd581dbc1
	setx	0x1aa9fc7600dcad47,%g7,%l1 ! %l1 = 1aa9fc7600dcad47
p0_fragment_7_end:
!	Mem[0000000010001414] = 00ff009f, %l0 = aa6267a467d718fc
	ldsw	[%i0+0x014],%l0		! %l0 = 0000000000ff009f
!	Mem[0000000030081410] = 00000000, %l4 = 0000000033abd3e1
	ldswa	[%i2+%o5]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000030001400] = e56960f70000002a, %l4 = 0000000000000000
	ldxa	[%i0+%g0]0x89,%l4	! %l4 = e56960f70000002a
!	Mem[0000000010181438] = 55c226310000cdff, %f2  = 00000000 00000000
	ldd	[%i6+0x038],%f2 	! %f2  = 55c22631 0000cdff

p0_label_77:
!	Starting 10 instruction Store Burst
!	Mem[0000000010101408] = 00000000, %l6 = 00000001, %l1 = 00dcad47
	add	%i4,0x08,%g1
	casa	[%g1]0x80,%l6,%l1	! %l1 = 0000000000000000
!	%l3 = 0000000000000090, Mem[00000000100c1421] = 3b188db0, %asi = 80
	stba	%l3,[%i3+0x021]%asi	! Mem[00000000100c1420] = 3b908db0
!	Mem[00000000218001c1] = 11b780a8, %l3 = 0000000000000090
	ldstuba	[%o3+0x1c1]%asi,%l3	! %l3 = 00000000000000b7
!	%l5 = 0000000000003700, Mem[0000000010141400] = bd212664
	stba	%l5,[%i5+%g0]0x80	! Mem[0000000010141400] = 00212664
!	%l6 = 0000000000000001, Mem[0000000010041408] = f33b0000
	stha	%l6,[%i1+%o4]0x88	! Mem[0000000010041408] = f33b0001
!	%l4 = e56960f70000002a, Mem[00000000100c1408] = 4cdb89ff
	stha	%l4,[%i3+%o4]0x88	! Mem[00000000100c1408] = 4cdb002a
!	Mem[00000000300c1408] = ff000000, %l1 = 0000000000000000
	ldstuba	[%i3+%o4]0x81,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010001400] = 00003700, %l3 = 00000000000000b7
	swapa	[%i0+%g0]0x88,%l3	! %l3 = 0000000000003700
!	%l5 = 0000000000003700, imm = 0000000000000d6a, %l1 = 00000000000000ff
	addc	%l5,0xd6a,%l1		! %l1 = 000000000000446a
!	%l0 = 0000000000ff009f, Mem[0000000010101408] = 00000000
	stha	%l0,[%i4+%o4]0x80	! Mem[0000000010101408] = 009f0000

p0_label_78:
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = 0d3359bc e56960f7, %l2 = b08d183b, %l3 = 00003700
	ldda	[%i4+%g0]0x81,%l2	! %l2 = 000000000d3359bc 00000000e56960f7
!	Mem[0000000030181400] = 5bb85368 00000000, %l2 = 0d3359bc, %l3 = e56960f7
	ldda	[%i6+%g0]0x89,%l2	! %l2 = 0000000000000000 000000005bb85368
!	Mem[0000000030081408] = 0001f366, %l5 = 0000000000003700
	lduha	[%i2+%o4]0x81,%l5	! %l5 = 0000000000000001
!	Mem[00000000300c1400] = 0d3359bc93da8545, %f22 = 1ba55e52 92b2532a
	ldda	[%i3+%g0]0x89,%f22	! %f22 = 0d3359bc 93da8545
!	Mem[0000000010001400] = 000000b7, %l5 = 0000000000000001
	lduwa	[%i0+%g0]0x88,%l5	! %l5 = 00000000000000b7
!	Mem[00000000300c1400] = 93da8545, %l5 = 00000000000000b7
	lduha	[%i3+%g0]0x89,%l5	! %l5 = 0000000000008545
!	Mem[0000000010081410] = 4b000000, %f24 = ff2dc372
	lda	[%i2+%o5]0x80,%f24	! %f24 = 4b000000
!	Mem[0000000030001410] = ffff005b, %l7 = 415383453aa1adfa
	ldsha	[%i0+%o5]0x81,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000030001400] = 2a000000, %l7 = ffffffffffffffff
	ldsba	[%i0+%g0]0x81,%l7	! %l7 = 000000000000002a
!	%l6 = 0000000000000001, %l0 = 0000000000ff009f, %l3 = 000000005bb85368
	udivx	%l6,%l0,%l3		! %l3 = 0000000000000000

p0_label_79:
!	Starting 10 instruction Store Burst
!	Mem[0000000030141410] = 005d00ff, %l5 = 0000000000008545
	ldstuba	[%i5+%o5]0x89,%l5	! %l5 = 00000000000000ff
!	%l6 = 0000000000000001, Mem[0000000010101408] = 00009f00
	stha	%l6,[%i4+%o4]0x88	! Mem[0000000010101408] = 00000001
!	%l2 = 0000000000000000, Mem[0000000030101400] = 0d3359bc
	stha	%l2,[%i4+%g0]0x81	! Mem[0000000030101400] = 000059bc
!	%l4 = e56960f70000002a, Mem[0000000030141400] = 00000000
	stwa	%l4,[%i5+%g0]0x89	! Mem[0000000030141400] = 0000002a
!	%l4 = 0000002a, %l5 = 000000ff, Mem[0000000010001408] = 1248e92b 00000000
	stda	%l4,[%i0+%o4]0x80	! Mem[0000000010001408] = 0000002a 000000ff
!	Mem[0000000030081410] = 00000000, %l4 = e56960f70000002a
	ldstuba	[%i2+%o5]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000030081408] = 66f30100, %l1 = 000000000000446a
	swapa	[%i2+%o4]0x89,%l1	! %l1 = 0000000066f30100
!	%f31 = 6a2b2844, Mem[0000000030141410] = 005d00ff
	sta	%f31,[%i5+%o5]0x89	! Mem[0000000030141410] = 6a2b2844
!	%l6 = 0000000000000001, Mem[0000000030141410] = 6a2b2844
	stwa	%l6,[%i5+%o5]0x89	! Mem[0000000030141410] = 00000001
!	%l3 = 0000000000000000, Mem[00000000100c1438] = 0000004b0000ff58, %asi = 80
	stxa	%l3,[%i3+0x038]%asi	! Mem[00000000100c1438] = 0000000000000000

p0_label_80:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = 58000000, %l1 = 0000000066f30100
	lduha	[%i6+%o4]0x80,%l1	! %l1 = 0000000000005800
!	Mem[0000000010141408] = 000000ff, %f29 = cce67216
	lda	[%i5+%o4]0x88,%f29	! %f29 = 000000ff
!	Mem[0000000010001410] = 00000058, %l2 = 0000000000000000
	ldsha	[%i0+%o5]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000010001408] = 0000002a, %l2 = 0000000000000000
	lduwa	[%i0+%o4]0x80,%l2	! %l2 = 000000000000002a
!	%l4 = 0000000000000000, %l5 = 00000000000000ff, %l1 = 0000000000005800
	xnor	%l4,%l5,%l1		! %l1 = ffffffffffffff00
!	Mem[00000000100c1410] = 0000ffff, %l1 = ffffffffffffff00
	lduwa	[%i3+%o5]0x88,%l1	! %l1 = 000000000000ffff
!	Mem[0000000010141410] = 6cc86d27, %l5 = 00000000000000ff
	ldswa	[%i5+%o5]0x88,%l5	! %l5 = 000000006cc86d27
!	Mem[0000000010041404] = 525ea51b, %l2 = 000000000000002a
	lduw	[%i1+0x004],%l2		! %l2 = 00000000525ea51b
!	%l5 = 000000006cc86d27, immd = fffff0ba, %y  = 41538345
	sdiv	%l5,-0xf46,%l5		! %l5 = ffffffff80000000
	mov	%l0,%y			! %y = 00ff009f
!	Mem[00000000300c1410] = 6853b85b, %f1  = 371c9d8b
	lda	[%i3+%o5]0x89,%f1 	! %f1 = 6853b85b

p0_label_81:
!	Starting 10 instruction Store Burst
!	%l6 = 0000000000000001, Mem[0000000010101408] = 01000000
	stha	%l6,[%i4+%o4]0x80	! Mem[0000000010101408] = 00010000
!	%l2 = 525ea51b, %l3 = 00000000, Mem[0000000030181400] = 00000000 6853b85b
	stda	%l2,[%i6+%g0]0x81	! Mem[0000000030181400] = 525ea51b 00000000
!	Mem[00000000100c1400] = 0189db4c, %l7 = 000000000000002a
	swapa	[%i3+%g0]0x88,%l7	! %l7 = 000000000189db4c
!	%f6  = 09c05727 11d9008d, Mem[0000000010181420] = ff36503c b08d183b
	std	%f6 ,[%i6+0x020]	! Mem[0000000010181420] = 09c05727 11d9008d
!	%f14 = 162d60ba 7f800000, Mem[0000000010081400] = 5d000000 c92dc372
	stda	%f14,[%i2+%g0]0x88	! Mem[0000000010081400] = 162d60ba 7f800000
!	Mem[00000000100c1410] = ffff0000, %l5 = ffffffff80000000
	ldstuba	[%i3+%o5]0x80,%l5	! %l5 = 00000000000000ff
!	%l6 = 00000001, %l7 = 0189db4c, Mem[0000000010081410] = 4b000000 00370000
	stda	%l6,[%i2+%o5]0x80	! Mem[0000000010081410] = 00000001 0189db4c
!	%f12 = 0189db4c 000000ff, Mem[0000000010181438] = 55c22631 0000cdff, %asi = 80
	stda	%f12,[%i6+0x038]%asi	! Mem[0000000010181438] = 0189db4c 000000ff
!	%l1 = 000000000000ffff, Mem[00000000100c1400] = c92d00720000002a
	stxa	%l1,[%i3+%g0]0x88	! Mem[00000000100c1400] = 000000000000ffff
!	%l7 = 000000000189db4c, Mem[0000000030081410] = 000000ff
	stha	%l7,[%i2+%o5]0x89	! Mem[0000000030081410] = 0000db4c

p0_label_82:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = 0000807f, %l2 = 00000000525ea51b
	ldsba	[%i2+%g0]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000010081428] = 0000000078fcf366, %l0 = 0000000000ff009f
	ldx	[%i2+0x028],%l0		! %l0 = 0000000078fcf366
!	Mem[0000000010101428] = 1178a3ce59c5dbe7, %l4 = 0000000000000000, %asi = 80
	ldxa	[%i4+0x028]%asi,%l4	! %l4 = 1178a3ce59c5dbe7
!	Mem[0000000010181400] = 72c32dff, %l7 = 000000000189db4c
	lduha	[%i6+%g0]0x88,%l7	! %l7 = 0000000000002dff
!	Mem[0000000030001408] = ff800000, %l6 = 0000000000000001
	ldsba	[%i0+%o4]0x89,%l6	! %l6 = 0000000000000000
!	Code Fragment 4, seed = 687969
p0_fragment_8:
!	%l0 = 0000000078fcf366
	setx	0x45d3679b8505ae1e,%g7,%l0 ! %l0 = 45d3679b8505ae1e
!	%l1 = 000000000000ffff
	setx	0x6f439eed2a4760c9,%g7,%l1 ! %l1 = 6f439eed2a4760c9
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 45d3679b8505ae1e
	setx	0x4b8dd26833d02f84,%g7,%l0 ! %l0 = 4b8dd26833d02f84
!	%l1 = 6f439eed2a4760c9
	setx	0xe86390da52329d4f,%g7,%l1 ! %l1 = e86390da52329d4f
p0_fragment_8_end:
!	Mem[0000000010101400] = ff89db4c b08d183b, %l6 = 00000000, %l7 = 00002dff
	ldda	[%i4+%g0]0x80,%l6	! %l6 = 00000000ff89db4c 00000000b08d183b
!	Mem[0000000030041408] = 11d9008d, %l2 = 0000000000000000
	ldswa	[%i1+%o4]0x89,%l2	! %l2 = 0000000011d9008d
!	Mem[0000000030081410] = 4cdb0000, %f21 = 6853b85b
	lda	[%i2+%o5]0x81,%f21	! %f21 = 4cdb0000
!	%l2 = 0000000011d9008d, Mem[0000000010141408] = ff000000, %asi = 80
	stha	%l2,[%i5+0x008]%asi	! Mem[0000000010141408] = 008d0000

p0_label_83:
!	Starting 10 instruction Store Burst
!	Mem[0000000010081410] = 00000001, %l3 = 0000000000000000, %asi = 80
	swapa	[%i2+0x010]%asi,%l3	! %l3 = 0000000000000001
	membar	#Sync			! Added by membar checker (19)
!	Mem[0000000010041400] = 2a53b292 525ea51b 01003bf3 000b1f4f
!	Mem[0000000010041410] = 0fff2e26 ff1b0000 630075ff 371c9d8b
!	Mem[0000000010041420] = 22330000 24938341 ba602d16 432b2e47
!	Mem[0000000010041430] = 00325128 00000000 ffff4dfa 796b91e3
	ldda	[%i1+%g0]ASI_BLK_P,%f16	! Block Load from 0000000010041400
!	%l6 = 00000000ff89db4c, Mem[00000000300c1400] = 93da8545
	stha	%l6,[%i3+%g0]0x89	! Mem[00000000300c1400] = 93dadb4c
!	%f3  = 0000cdff, Mem[0000000030181400] = 1ba55e52
	sta	%f3 ,[%i6+%g0]0x89	! Mem[0000000030181400] = 0000cdff
!	%l0 = 4b8dd26833d02f84, Mem[0000000030181408] = ff000000
	stha	%l0,[%i6+%o4]0x81	! Mem[0000000030181408] = 2f840000
!	Mem[0000000010101408] = 00010000, %l7 = 00000000b08d183b
	ldstuba	[%i4+%o4]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000010041408] = 01003bf3, %l0 = 0000000033d02f84
	swapa	[%i1+%o4]0x80,%l0	! %l0 = 0000000001003bf3
!	%f4  = 00004529 66a24265, Mem[0000000010001410] = 00000058 00ff009f
	stda	%f4 ,[%i0+%o5]0x80	! Mem[0000000010001410] = 00004529 66a24265
!	Mem[0000000010101408] = 000001ff, %l6 = 00000000ff89db4c
	ldstuba	[%i4+%o4]0x88,%l6	! %l6 = 00000000000000ff
!	%l4 = 1178a3ce59c5dbe7, Mem[0000000030001408] = ff800000
	stha	%l4,[%i0+%o4]0x89	! Mem[0000000030001408] = ff80dbe7

p0_label_84:
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = 01000000, %l1 = e86390da52329d4f
	lduha	[%i5+%o5]0x81,%l1	! %l1 = 0000000000000100
!	Mem[0000000010041408] = 4f1f0b00842fd033, %f14 = 162d60ba 7f800000
	ldda	[%i1+%o4]0x88,%f14	! %f14 = 4f1f0b00 842fd033
!	Mem[0000000030001410] = ffff005b, %l4 = 1178a3ce59c5dbe7
	lduba	[%i0+%o5]0x81,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010081420] = 3b188db04cdb8901, %f14 = 4f1f0b00 842fd033
	ldd	[%i2+0x020],%f14	! %f14 = 3b188db0 4cdb8901
!	Mem[0000000030081408] = 0000446a, %f9  = 0000000f
	lda	[%i2+%o4]0x89,%f9 	! %f9 = 0000446a
!	Mem[0000000010001410] = 0000452966a24265, %f2  = 55c22631 0000cdff
	ldda	[%i0+%o5]0x80,%f2 	! %f2  = 00004529 66a24265
!	Mem[0000000010181408] = 58000000c9000000, %l6 = 00000000000000ff
	ldxa	[%i6+%o4]0x80,%l6	! %l6 = 58000000c9000000
!	Mem[0000000010101400] = 3b188db0 4cdb89ff, %l0 = 01003bf3, %l1 = 00000100
	ldda	[%i4+%g0]0x88,%l0	! %l0 = 000000004cdb89ff 000000003b188db0
!	Code Fragment 4, seed = 411795
p0_fragment_9:
!	%l0 = 000000004cdb89ff
	setx	0xc880f31a1ef1368e,%g7,%l0 ! %l0 = c880f31a1ef1368e
!	%l1 = 000000003b188db0
	setx	0x2a00299fad593e39,%g7,%l1 ! %l1 = 2a00299fad593e39
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = c880f31a1ef1368e
	setx	0x2c80331e159c51f4,%g7,%l0 ! %l0 = 2c80331e159c51f4
!	%l1 = 2a00299fad593e39
	setx	0xaedeb2a796c9f4bf,%g7,%l1 ! %l1 = aedeb2a796c9f4bf
p0_fragment_9_end:
!	Mem[00000000300c1408] = ff000000, %l5 = 00000000000000ff
	ldsha	[%i3+%o4]0x81,%l5	! %l5 = ffffffffffffff00

p0_label_85:
!	Starting 10 instruction Store Burst
!	%f8  = 05417a6a 0000446a, %l6 = 58000000c9000000
!	Mem[0000000010181400] = ff2dc3721ba55e52
	stda	%f8,[%i6+%l6]ASI_PST8_PL ! Mem[0000000010181400] = ff2dc3721ba55e52
!	Mem[0000000030081408] = 6a440000, %l3 = 0000000000000001
	swapa	[%i2+%o4]0x81,%l3	! %l3 = 000000006a440000
!	%l5 = ffffffffffffff00, Mem[00000000201c0001] = ffff9298, %asi = 80
	stba	%l5,[%o0+0x001]%asi	! Mem[00000000201c0000] = ff009298
!	%f11 = 6a7a4105, Mem[0000000030081410] = 0000db4c
	sta	%f11,[%i2+%o5]0x89	! Mem[0000000030081410] = 6a7a4105
!	Mem[0000000010181400] = ff2dc372, %l5 = ffffffffffffff00
	ldstuba	[%i6+%g0]0x80,%l5	! %l5 = 00000000000000ff
!	%l4 = 00000000000000ff, Mem[0000000030101400] = 000059bc
	stba	%l4,[%i4+%g0]0x81	! Mem[0000000030101400] = ff0059bc
	membar	#Sync			! Added by membar checker (20)
!	%f12 = 0189db4c 000000ff, Mem[0000000010041400] = 2a53b292 525ea51b, %asi = 80
	stda	%f12,[%i1+0x000]%asi	! Mem[0000000010041400] = 0189db4c 000000ff
!	Mem[0000000010181410] = 05417a6a, %l2 = 0000000011d9008d
	ldstuba	[%i6+%o5]0x80,%l2	! %l2 = 0000000000000005
!	%l4 = 00000000000000ff, Mem[0000000030101400] = ff0059bc
	stwa	%l4,[%i4+%g0]0x81	! Mem[0000000030101400] = 000000ff
!	%l3 = 000000006a440000, Mem[0000000030081410] = 05417a6a
	stba	%l3,[%i2+%o5]0x81	! Mem[0000000030081410] = 00417a6a

p0_label_86:
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = 005d0000ff80dbe7, %f22 = 630075ff 371c9d8b
	ldda	[%i0+%o4]0x89,%f22	! %f22 = 005d0000 ff80dbe7
!	%f23 = ff80dbe7, %f22 = 005d0000
	fcmps	%fcc2,%f23,%f22		! %fcc2 = 3
!	Mem[0000000030081408] = 00000001, %l0 = 2c80331e159c51f4
	ldswa	[%i2+%o4]0x81,%l0	! %l0 = 0000000000000001
!	Mem[0000000030101410] = 6a7a4105, %f6  = 09c05727
	lda	[%i4+%o5]0x89,%f6 	! %f6 = 6a7a4105
!	Mem[000000001010140c] = 51ffc8ef, %f26 = ba602d16
	ld	[%i4+0x00c],%f26	! %f26 = 51ffc8ef
!	Mem[0000000010181408] = 00000058, %l2 = 0000000000000005
	ldswa	[%i6+%o4]0x88,%l2	! %l2 = 0000000000000058
!	Mem[0000000010001408] = 2a000000, %l0 = 0000000000000001
	lduha	[%i0+%o4]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000030141410] = 01000000, %l6 = 58000000c9000000
	ldswa	[%i5+%o5]0x81,%l6	! %l6 = 0000000001000000
!	Mem[0000000010101400] = ff89db4c, %l1 = aedeb2a796c9f4bf
	lduba	[%i4+%g0]0x80,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010101408] = ff010000, %l3 = 000000006a440000
	lduba	[%i4+%o4]0x80,%l3	! %l3 = 00000000000000ff

p0_label_87:
!	Starting 10 instruction Store Burst
!	%f6  = 6a7a4105 11d9008d, %l1 = 00000000000000ff
!	Mem[0000000030141438] = c2976e2a4a705353
	add	%i5,0x038,%g1
	stda	%f6,[%g1+%l1]ASI_PST16_S ! Mem[0000000030141438] = 6a7a410511d9008d
!	%f8  = 05417a6a, Mem[0000000010041438] = ffff4dfa
	sta	%f8 ,[%i1+0x038]%asi	! Mem[0000000010041438] = 05417a6a
!	%l3 = 00000000000000ff, Mem[0000000010001408] = 0000002a
	stwa	%l3,[%i0+%o4]0x80	! Mem[0000000010001408] = 000000ff
!	%l7 = 0000000000000000, Mem[0000000010181410] = 6a7a41ff
	stba	%l7,[%i6+%o5]0x88	! Mem[0000000010181410] = 6a7a4100
!	%f0  = 630075ff 6853b85b, Mem[0000000030141410] = 01000000 ff2c0000
	stda	%f0 ,[%i5+%o5]0x81	! Mem[0000000030141410] = 630075ff 6853b85b
!	Mem[00000000100c1402] = ffff0000, %l5 = 00000000000000ff
	ldstuba	[%i3+0x002]%asi,%l5	! %l5 = 0000000000000000
!	%l1 = 00000000000000ff, Mem[0000000030181400] = ffcd0000
	stba	%l1,[%i6+%g0]0x81	! Mem[0000000030181400] = ffcd0000
!	%l2 = 0000000000000058, Mem[000000001004140e] = 000b1f4f
	sth	%l2,[%i1+0x00e]		! Mem[000000001004140c] = 000b0058
!	%l6 = 0000000001000000, Mem[0000000010101410] = 2757000000000000
	stx	%l6,[%i4+%o5]		! Mem[0000000010101410] = 0000000001000000
!	%f8  = 05417a6a 0000446a, Mem[0000000010001408] = 000000ff 000000ff, %asi = 80
	stda	%f8 ,[%i0+0x008]%asi	! Mem[0000000010001408] = 05417a6a 0000446a

p0_label_88:
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = 93dadb4c, %f14 = 3b188db0
	lda	[%i3+%g0]0x89,%f14	! %f14 = 93dadb4c
!	Mem[0000000010001408] = 6a7a4105, %l7 = 0000000000000000
	ldsba	[%i0+%o4]0x88,%l7	! %l7 = 0000000000000005
!	Mem[0000000010001410] = 29450000, %l2 = 0000000000000058
	lduwa	[%i0+%o5]0x88,%l2	! %l2 = 0000000029450000
	membar	#Sync			! Added by membar checker (21)
!	Mem[0000000010101400] = ff89db4c b08d183b ff010000 51ffc8ef
!	Mem[0000000010101410] = 00000000 01000000 65632b42 a1a30d0b
!	Mem[0000000010101420] = 476c3610 33abd3e1 1178a3ce 59c5dbe7
!	Mem[0000000010101430] = 0b48cffc 2262e2bd 2ef9ff1a 4d513183
	ldda	[%i4+%g0]ASI_BLK_P,%f16	! Block Load from 0000000010101400
!	Mem[0000000010081410] = 4cdb8901 00000000, %l6 = 01000000, %l7 = 00000005
	ldda	[%i2+%o5]0x88,%l6	! %l6 = 0000000000000000 000000004cdb8901
!	Mem[00000000211c0000] = ff008f28, %l2 = 0000000029450000, %asi = 80
	lduha	[%o2+0x000]%asi,%l2	! %l2 = 000000000000ff00
!	Mem[0000000030041400] = 00004529, %l3 = 00000000000000ff
	lduha	[%i1+%g0]0x81,%l3	! %l3 = 0000000000000000
!	Mem[000000001010141c] = a1a30d0b, %l5 = 0000000000000000
	ldub	[%i4+0x01c],%l5		! %l5 = 00000000000000a1
!	Mem[0000000030041410] = 8d00d911, %f14 = 93dadb4c
	lda	[%i1+%o5]0x81,%f14	! %f14 = 8d00d911
!	Mem[0000000010101434] = 2262e2bd, %l4 = 00000000000000ff
	lduh	[%i4+0x034],%l4		! %l4 = 0000000000002262

p0_label_89:
!	Starting 10 instruction Store Burst
!	Mem[00000000211c0000] = ff008f28, %l4 = 0000000000002262
	ldstub	[%o2+%g0],%l4		! %l4 = 00000000000000ff
!	Mem[0000000030041408] = 8d00d911, %l5 = 00000000000000a1
	swapa	[%i1+%o4]0x81,%l5	! %l5 = 000000008d00d911
!	%l4 = 00000000000000ff, Mem[0000000010041400] = 0189db4c
	stwa	%l4,[%i1+%g0]0x80	! Mem[0000000010041400] = 000000ff
!	%l7 = 000000004cdb8901, Mem[00000000100c1410] = ffff0000
	stha	%l7,[%i3+%o5]0x80	! Mem[00000000100c1410] = 89010000
!	%f2  = 00004529 66a24265, %l7 = 000000004cdb8901
!	Mem[0000000010181420] = 09c0572711d9008d
	add	%i6,0x020,%g1
	stda	%f2,[%g1+%l7]ASI_PST32_P ! Mem[0000000010181420] = 09c0572766a24265
!	%l0 = 0000000000000000, Mem[0000000030041400] = 29450000
	stwa	%l0,[%i1+%g0]0x89	! Mem[0000000030041400] = 00000000
!	%f28 = 0b48cffc 2262e2bd, Mem[0000000010081408] = 00004529 262eff0f
	stda	%f28,[%i2+%o4]0x80	! Mem[0000000010081408] = 0b48cffc 2262e2bd
	membar	#Sync			! Added by membar checker (22)
!	%l0 = 00000000, %l1 = 000000ff, Mem[0000000010101410] = 00000000 00000001
	stda	%l0,[%i4+%o5]0x88	! Mem[0000000010101410] = 00000000 000000ff
!	Mem[0000000030181400] = 0000cdff, %l0 = 0000000000000000
	ldstuba	[%i6+%g0]0x89,%l0	! %l0 = 00000000000000ff
!	%f11 = 6a7a4105, %f5  = 66a24265
	fcmps	%fcc1,%f11,%f5 		! %fcc1 = 2

p0_label_90:
!	Starting 10 instruction Load Burst
!	Mem[000000001010140c] = 51ffc8ef, %l5 = 000000008d00d911
	lduw	[%i4+0x00c],%l5		! %l5 = 0000000051ffc8ef
!	%l2 = 000000000000ff00, Mem[00000000100c1410] = 00000189
	stba	%l2,[%i3+%o5]0x88	! Mem[00000000100c1410] = 00000100
!	Mem[00000000100c1400] = ffffff00 00000000, %l2 = 0000ff00, %l3 = 00000000
	ldda	[%i3+%g0]0x80,%l2	! %l2 = 00000000ffffff00 0000000000000000
!	Mem[00000000211c0000] = ff008f28, %l1 = 00000000000000ff, %asi = 80
	lduba	[%o2+0x000]%asi,%l1	! %l1 = 00000000000000ff
!	Mem[00000000300c1400] = 4cdbda93, %l4 = 00000000000000ff
	lduwa	[%i3+%g0]0x81,%l4	! %l4 = 000000004cdbda93
!	Mem[0000000010081408] = 0b48cffc2262e2bd, %l3 = 0000000000000000
	ldxa	[%i2+%o4]0x80,%l3	! %l3 = 0b48cffc2262e2bd
!	Mem[0000000010041430] = 00325128, %l5 = 0000000051ffc8ef
	ldsh	[%i1+0x030],%l5		! %l5 = 0000000000000032
!	Mem[0000000010081408] = 0b48cffc, %l0 = 00000000000000ff
	lduwa	[%i2+%o4]0x80,%l0	! %l0 = 000000000b48cffc
!	Mem[0000000010041408] = 33d02f84, %l0 = 000000000b48cffc
	lduba	[%i1+%o4]0x80,%l0	! %l0 = 0000000000000033
!	Mem[0000000010081400] = 0000807fba602d16, %f30 = 2ef9ff1a 4d513183
	ldda	[%i2+%g0]0x80,%f30	! %f30 = 0000807f ba602d16

p0_label_91:
!	Starting 10 instruction Store Burst
!	%l2 = 00000000ffffff00, Mem[0000000010001400] = b7000000
	stba	%l2,[%i0+%g0]0x80	! Mem[0000000010001400] = 00000000
!	Mem[0000000010041404] = 000000ff, %l3 = 2262e2bd, %l1 = 000000ff
	add	%i1,0x04,%g1
	casa	[%g1]0x80,%l3,%l1	! %l1 = 00000000000000ff
!	%f30 = 0000807f, Mem[0000000030141410] = ff750063
	sta	%f30,[%i5+%o5]0x89	! Mem[0000000030141410] = 0000807f
!	%l5 = 0000000000000032, Mem[0000000030101400] = 000000ffe56960f7
	stxa	%l5,[%i4+%g0]0x81	! Mem[0000000030101400] = 0000000000000032
!	Mem[0000000010101410] = 00000000, %l3 = 0b48cffc2262e2bd
	ldstuba	[%i4+%o5]0x80,%l3	! %l3 = 0000000000000000
!	%l5 = 0000000000000032, Mem[0000000030101408] = 27570000
	stwa	%l5,[%i4+%o4]0x89	! Mem[0000000030101408] = 00000032
!	Mem[000000001000141c] = 371c9d8b, %l5 = 0000000000000032
	ldstuba	[%i0+0x01c]%asi,%l5	! %l5 = 0000000000000037
!	%l3 = 0000000000000000, %l6 = 0000000000000000, %y  = 00ff009f
	udiv	%l3,%l6,%l0		! Div by zero, %l0 = 000000000000005b
!	Mem[0000000030081408] = 00000001, %l1 = 00000000000000ff
	ldstuba	[%i2+%o4]0x81,%l1	! %l1 = 0000000000000000
!	%l4 = 4cdbda93, %l5 = 00000037, Mem[00000000300c1410] = 6853b85b 00000000
	stda	%l4,[%i3+%o5]0x89	! Mem[00000000300c1410] = 4cdbda93 00000037

p0_label_92:
!	Starting 10 instruction Load Burst
!	Mem[0000000030101410] = 05417a6a, %l5 = 0000000000000037
	lduwa	[%i4+%o5]0x81,%l5	! %l5 = 0000000005417a6a
!	Mem[00000000300c1408] = ff0000000000005d, %f22 = 65632b42 a1a30d0b
	ldda	[%i3+%o4]0x81,%f22	! %f22 = ff000000 0000005d
!	Mem[00000000211c0001] = ff008f28, %l0 = 000000000000005b, %asi = 80
	lduba	[%o2+0x001]%asi,%l0	! %l0 = 0000000000000000
!	Mem[000000001000141c] = ff1c9d8b, %f25 = 33abd3e1
	ld	[%i0+0x01c],%f25	! %f25 = ff1c9d8b
!	Mem[0000000010081410] = 000000000189db4c, %l5 = 0000000005417a6a
	ldxa	[%i2+%o5]0x80,%l5	! %l5 = 000000000189db4c
!	Mem[00000000100c1408] = 2a00db4c, %l7 = 000000004cdb8901
	lduha	[%i3+%o4]0x80,%l7	! %l7 = 0000000000002a00
!	Mem[0000000030081400] = 6ee44ec1 e56960f7, %l0 = 00000000, %l1 = 00000000
	ldda	[%i2+%g0]0x89,%l0	! %l0 = 00000000e56960f7 000000006ee44ec1
!	Mem[0000000030081410] = 00417a6a, %l1 = 000000006ee44ec1
	ldsha	[%i2+%o5]0x81,%l1	! %l1 = 0000000000000041
!	Mem[00000000300c1400] = 93dadb4c, %l6 = 0000000000000000
	ldsba	[%i3+%g0]0x89,%l6	! %l6 = 000000000000004c
!	Mem[0000000010141410] = 276dc86c6eb5f34d, %l1 = 0000000000000041
	ldxa	[%i5+%o5]0x80,%l1	! %l1 = 276dc86c6eb5f34d

p0_label_93:
!	Starting 10 instruction Store Burst
!	Mem[0000000010101410] = 000000ff, %l1 = 276dc86c6eb5f34d
	ldstuba	[%i4+%o5]0x88,%l1	! %l1 = 00000000000000ff
!	%l2 = 00000000ffffff00, Mem[0000000010101410] = ff000000
	stha	%l2,[%i4+%o5]0x80	! Mem[0000000010101410] = ff000000
!	%l0 = e56960f7, %l1 = 000000ff, Mem[0000000030101410] = 6a7a4105 306cccbc
	stda	%l0,[%i4+%o5]0x89	! Mem[0000000030101410] = e56960f7 000000ff
!	%f20 = 00000000, %f14 = 8d00d911
	fsqrts	%f20,%f14		! %f14 = 00000000
!	Mem[00000000100c140c] = b08d183b, %l3 = 0000000000000000, %asi = 80
	swapa	[%i3+0x00c]%asi,%l3	! %l3 = 00000000b08d183b
!	Mem[00000000100c1400] = ffffff0000000000, %l0 = 00000000e56960f7, %l1 = 00000000000000ff
	casxa	[%i3]0x80,%l0,%l1	! %l1 = ffffff0000000000
!	%f2  = 00004529 66a24265, %l4 = 000000004cdbda93
!	Mem[0000000010041430] = 0032512800000000
	add	%i1,0x030,%g1
	stda	%f2,[%g1+%l4]ASI_PST32_P ! Mem[0000000010041430] = 0000452966a24265
!	%l6 = 000000000000004c, Mem[000000001010140a] = ff010000, %asi = 80
	stha	%l6,[%i4+0x00a]%asi	! Mem[0000000010101408] = ff01004c
!	%l2 = ffffff00, %l3 = b08d183b, Mem[0000000030181408] = 2f840000 ff36503c
	stda	%l2,[%i6+%o4]0x81	! Mem[0000000030181408] = ffffff00 b08d183b
!	%l7 = 0000000000002a00, Mem[0000000010001410] = 00004529, %asi = 80
	stwa	%l7,[%i0+0x010]%asi	! Mem[0000000010001410] = 00002a00

p0_label_94:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = 4cdb002a, %l7 = 0000000000002a00
	lduwa	[%i3+%o4]0x88,%l7	! %l7 = 000000004cdb002a
!	Mem[0000000010041412] = 0fff2e26, %l1 = ffffff0000000000
	ldsb	[%i1+0x012],%l1		! %l1 = 000000000000002e
!	%f15 = 4cdb8901, %f4  = 00004529, %f12 = 0189db4c
	fmuls	%f15,%f4 ,%f12		! tt=0x22, %l0 = 00000000e5696119
!	Mem[00000000100c1408] = 4cdb002a, %l3 = 00000000b08d183b
	lduwa	[%i3+%o4]0x88,%l3	! %l3 = 000000004cdb002a
!	Mem[0000000030101400] = 00000000, %l1 = 000000000000002e
	ldsha	[%i4+%g0]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000030141400] = f944501f0000002a, %f30 = 0000807f ba602d16
	ldda	[%i5+%g0]0x89,%f30	! %f30 = f944501f 0000002a
!	%f23 = 0000005d, %f15 = 4cdb8901
	fcmpes	%fcc1,%f23,%f15		! %fcc1 = 1
!	Mem[0000000021800080] = 488c67b8, %l4 = 000000004cdbda93, %asi = 80
	ldsha	[%o3+0x080]%asi,%l4	! %l4 = 000000000000488c
!	Mem[0000000010101410] = ff000000, %l6 = 000000000000004c
	ldsba	[%i4+%o5]0x80,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010041400] = 000000ff, %l4 = 000000000000488c
	lduha	[%i1+%g0]0x80,%l4	! %l4 = 0000000000000000

p0_label_95:
!	Starting 10 instruction Store Burst
!	Mem[0000000020800041] = ff9f3ef8, %l1 = 0000000000000000
	ldstuba	[%o1+0x041]%asi,%l1	! %l1 = 000000000000009f
!	Mem[00000000211c0000] = ff008f28, %l3 = 000000004cdb002a
	ldstub	[%o2+%g0],%l3		! %l3 = 00000000000000ff
!	Mem[0000000010001410] = 00002a00, %l0 = 00000000e5696119
	swapa	[%i0+%o5]0x80,%l0	! %l0 = 0000000000002a00
!	Mem[00000000300c1410] = 93dadb4c, %l6 = ffffffffffffffff
	ldstuba	[%i3+%o5]0x81,%l6	! %l6 = 0000000000000093
!	%f30 = f944501f 0000002a, Mem[00000000300c1408] = 000000ff 5d000000
	stda	%f30,[%i3+%o4]0x89	! Mem[00000000300c1408] = f944501f 0000002a
!	%l0 = 00002a00, %l1 = 0000009f, Mem[0000000010001430] = 106c167c 277aff1d, %asi = 80
	stda	%l0,[%i0+0x030]%asi	! Mem[0000000010001430] = 00002a00 0000009f
!	Code Fragment 3, seed = 605048
p0_fragment_10:
!	%l0 = 0000000000002a00
	setx	0xed00b2c7841a9466,%g7,%l0 ! %l0 = ed00b2c7841a9466
!	%l1 = 000000000000009f
	setx	0xf12f71964bfb1491,%g7,%l1 ! %l1 = f12f71964bfb1491
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = ed00b2c7841a9466
	setx	0x742534b0781738cc,%g7,%l0 ! %l0 = 742534b0781738cc
!	%l1 = f12f71964bfb1491
	setx	0x0ac1393a377b0417,%g7,%l1 ! %l1 = 0ac1393a377b0417
p0_fragment_10_end:
!	Mem[0000000010081430] = 00000058, %l4 = 0000000000000000
	swap	[%i2+0x030],%l4		! %l4 = 0000000000000058
!	%f11 = 6a7a4105, %f29 = 2262e2bd, %f4  = 00004529 66a24265
	fsmuld	%f11,%f29,%f4 		! %f4  = 41abb961 924d5620
!	%f26 = 1178a3ce 59c5dbe7, Mem[0000000010181400] = 72c32dff 525ea51b
	stda	%f26,[%i6+%g0]0x88	! Mem[0000000010181400] = 1178a3ce 59c5dbe7

p0_label_96:
!	Starting 10 instruction Load Burst
!	Mem[0000000030101410] = e56960f7, %l0 = 742534b0781738cc
	ldsba	[%i4+%o5]0x89,%l0	! %l0 = fffffffffffffff7
!	Mem[0000000030181410] = 0000d3e1, %f2  = 00004529
	lda	[%i6+%o5]0x89,%f2 	! %f2 = 0000d3e1
!	Mem[0000000010181410] = 00417a6a, %f14 = 00000000
	lda	[%i6+%o5]0x80,%f14	! %f14 = 00417a6a
	membar	#Sync			! Added by membar checker (23)
!	Mem[0000000030101400] = 00000000 00000032 32000000 2757c009
!	Mem[0000000030101410] = f76069e5 ff000000 669a3ff2 06c320fb
!	Mem[0000000030101420] = 67ccc440 63f38b51 0c20177e 546b72d7
!	Mem[0000000030101430] = 0264f52c 2fcd750d 6c3314ca 0ad9bb73
	ldda	[%i4+%g0]ASI_BLK_S,%f0 	! Block Load from 0000000030101400
!	Mem[0000000020800000] = 05ffeac8, %l2 = 00000000ffffff00, %asi = 80
	ldsha	[%o1+0x000]%asi,%l2	! %l2 = 00000000000005ff
!	Mem[0000000030141410] = 5bb853680000807f, %l5 = 000000000189db4c
	ldxa	[%i5+%o5]0x89,%l5	! %l5 = 5bb853680000807f
!	Mem[00000000300c1410] = ffdadb4c, %l3 = 00000000000000ff
	lduba	[%i3+%o5]0x81,%l3	! %l3 = 00000000000000ff
!	%l5 = 5bb853680000807f, immd = fffff7e0, %y  = 00ff009f
	udiv	%l5,-0x820,%l1		! %l1 = 0000000000ff00a7
	mov	%l0,%y			! %y = fffffff7
!	Mem[0000000010041400] = 000000ff000000ff, %l4 = 0000000000000058
	ldxa	[%i1+%g0]0x80,%l4	! %l4 = 000000ff000000ff
!	Mem[00000000201c0000] = ff009298, %l7 = 000000004cdb002a, %asi = 80
	lduha	[%o0+0x000]%asi,%l7	! %l7 = 000000000000ff00

p0_label_97:
!	Starting 10 instruction Store Burst
!	%f3  = 2757c009, Mem[00000000300c1400] = 93dadb4c
	sta	%f3 ,[%i3+%g0]0x89	! Mem[00000000300c1400] = 2757c009
!	%f4  = f76069e5 ff000000, Mem[0000000010101408] = 4c0001ff efc8ff51
	stda	%f4 ,[%i4+%o4]0x88	! Mem[0000000010101408] = f76069e5 ff000000
!	%f5  = ff000000, Mem[00000000100c1400] = 00ffffff
	sta	%f5 ,[%i3+%g0]0x88	! Mem[00000000100c1400] = ff000000
!	%l0 = fffffffffffffff7, Mem[00000000100c1410] = 000100006a7a4105
	stxa	%l0,[%i3+%o5]0x80	! Mem[00000000100c1410] = fffffffffffffff7
!	Mem[0000000010081408] = fccf480b, %l7 = 000000000000ff00
	swapa	[%i2+%o4]0x88,%l7	! %l7 = 00000000fccf480b
!	Mem[0000000030181410] = 0000d3e1, %l6 = 0000000000000093
	swapa	[%i6+%o5]0x89,%l6	! %l6 = 000000000000d3e1
!	%f29 = 2262e2bd, Mem[0000000010181400] = e7dbc559
	sta	%f29,[%i6+%g0]0x80	! Mem[0000000010181400] = 2262e2bd
!	%l0 = fffffffffffffff7, Mem[0000000010001408] = 6a7a4105
	stha	%l0,[%i0+%o4]0x88	! Mem[0000000010001408] = 6a7afff7
!	Mem[0000000030101408] = 32000000, %l4 = 000000ff000000ff
	ldstuba	[%i4+%o4]0x81,%l4	! %l4 = 0000000000000032
!	Mem[0000000010181400] = 2262e2bd, %l1 = 0000000000ff00a7
	swapa	[%i6+%g0]0x80,%l1	! %l1 = 000000002262e2bd

p0_label_98:
!	Starting 10 instruction Load Burst
!	Mem[0000000020800041] = ffff3ef8, %l6 = 000000000000d3e1
	ldsb	[%o1+0x041],%l6		! %l6 = ffffffffffffffff
!	%l7 = 00000000fccf480b, immd = fffffb5f, %y  = fffffff7
	sdiv	%l7,-0x4a1,%l5		! %l5 = 0000000001bb2058
	mov	%l0,%y			! %y = fffffff7
!	Mem[0000000030101400] = 00000000, %l6 = ffffffffffffffff
	ldswa	[%i4+%g0]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000030041400] = 00000000, %l2 = 00000000000005ff
	lduha	[%i1+%g0]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000010041408] = 58000b00842fd033, %l1 = 000000002262e2bd
	ldxa	[%i1+%o4]0x88,%l1	! %l1 = 58000b00842fd033
!	Mem[0000000030081410] = 00417a6a, %f23 = 0000005d
	lda	[%i2+%o5]0x81,%f23	! %f23 = 00417a6a
!	Mem[0000000030081410] = 6a7a4100, %l4 = 0000000000000032
	lduha	[%i2+%o5]0x89,%l4	! %l4 = 0000000000004100
!	Mem[0000000020800000] = 05ffeac8, %l6 = 0000000000000000
	lduh	[%o1+%g0],%l6		! %l6 = 00000000000005ff
!	Mem[0000000010181410] = 00417a6a0000000f, %l1 = 58000b00842fd033
	ldxa	[%i6+%o5]0x80,%l1	! %l1 = 00417a6a0000000f
!	Mem[0000000010041434] = 66a24265, %f25 = ff1c9d8b
	lda	[%i1+0x034]%asi,%f25	! %f25 = 66a24265

p0_label_99:
!	Starting 10 instruction Store Burst
!	%f16 = ff89db4c b08d183b, Mem[0000000010001420] = 000000ff 652bc861, %asi = 80
	stda	%f16,[%i0+0x020]%asi	! Mem[0000000010001420] = ff89db4c b08d183b
!	Mem[0000000030081400] = e56960f7, %l5 = 0000000001bb2058
	swapa	[%i2+%g0]0x89,%l5	! %l5 = 00000000e56960f7
!	%l4 = 0000000000004100, Mem[0000000010081406] = ba602d16, %asi = 80
	stba	%l4,[%i2+0x006]%asi	! Mem[0000000010081404] = ba600016
!	Mem[0000000030181408] = ffffff00, %l3 = 00000000000000ff
	swapa	[%i6+%o4]0x81,%l3	! %l3 = 00000000ffffff00
!	%f10 = 0c20177e 546b72d7, Mem[0000000030181410] = 00000093 15ec1859
	stda	%f10,[%i6+%o5]0x89	! Mem[0000000030181410] = 0c20177e 546b72d7
!	Mem[0000000030141410] = 7f800000, %l1 = 00417a6a0000000f
	ldstuba	[%i5+%o5]0x81,%l1	! %l1 = 000000000000007f
!	%l3 = 00000000ffffff00, Mem[0000000030001400] = e56960f70000002a
	stxa	%l3,[%i0+%g0]0x89	! Mem[0000000030001400] = 00000000ffffff00
!	%l7 = 00000000fccf480b, imm = 00000000000005a8, %l1 = 000000000000007f
	addc	%l7,0x5a8,%l1		! %l1 = 00000000fccf4db3
!	Mem[0000000010101408] = 000000ff, %l2 = 0000000000000000
	ldstuba	[%i4+%o4]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000010181400] = 00ff00a7, %l4 = 0000000000004100
	swapa	[%i6+%g0]0x80,%l4	! %l4 = 0000000000ff00a7

p0_label_100:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = 0000807f, %l5 = 00000000e56960f7
	ldsha	[%i2+%g0]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000010181408] = 000000c900000058, %l5 = 0000000000000000
	ldxa	[%i6+%o4]0x88,%l5	! %l5 = 000000c900000058
!	Mem[0000000010101408] = ff0000ff, %l2 = 0000000000000000
	ldswa	[%i4+%o4]0x88,%l2	! %l2 = ffffffffff0000ff
!	Mem[0000000010141408] = 00008d00, %l0 = fffffffffffffff7
	lduba	[%i5+%o4]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000030141410] = 000080ff, %l3 = 00000000ffffff00
	ldsha	[%i5+%o5]0x89,%l3	! %l3 = ffffffffffff80ff
!	Mem[0000000021800100] = 1057e418, %l2 = ffffffffff0000ff
	lduh	[%o3+0x100],%l2		! %l2 = 0000000000001057
!	Mem[00000000100c1400] = 000000ff, %f23 = 00417a6a
	lda	[%i3+%g0]0x80,%f23	! %f23 = 000000ff
!	Mem[00000000100c1400] = 000000ff, %l6 = 00000000000005ff
	lduw	[%i3+%g0],%l6		! %l6 = 00000000000000ff
!	Mem[0000000010041408] = 58000b00 842fd033, %l4 = 00ff00a7, %l5 = 00000058
	ldda	[%i1+%o4]0x88,%l4	! %l4 = 00000000842fd033 0000000058000b00
!	Mem[0000000010081410] = 000000000189db4c, %l2 = 0000000000001057
	ldxa	[%i2+%o5]0x80,%l2	! %l2 = 000000000189db4c

p0_label_101:
!	Starting 10 instruction Store Burst
!	%l6 = 000000ff, %l7 = fccf480b, Mem[0000000010141410] = 276dc86c 6eb5f34d, %asi = 80
	stda	%l6,[%i5+0x010]%asi	! Mem[0000000010141410] = 000000ff fccf480b
!	%f27 = 59c5dbe7, Mem[0000000010181410] = 00417a6a
	sta	%f27,[%i6+%o5]0x80	! Mem[0000000010181410] = 59c5dbe7
!	Mem[0000000010081400] = 0000807f, %l0 = 0000000000000000
	ldstuba	[%i2+%g0]0x80,%l0	! %l0 = 0000000000000000
!	%l0 = 0000000000000000, Mem[0000000030181410] = 0c20177e546b72d7
	stxa	%l0,[%i6+%o5]0x89	! Mem[0000000030181410] = 0000000000000000
!	%f0  = 00000000 00000032, %l3 = ffffffffffff80ff
!	Mem[0000000010181430] = bd2126640000004b
	add	%i6,0x030,%g1
	stda	%f0,[%g1+%l3]ASI_PST8_P ! Mem[0000000010181430] = 0000000000000032
!	Mem[0000000030041408] = a1000000, %l1 = 00000000fccf4db3
	swapa	[%i1+%o4]0x89,%l1	! %l1 = 00000000a1000000
!	%l7 = 00000000fccf480b, Mem[0000000010041400] = 000000ff
	stwa	%l7,[%i1+%g0]0x80	! Mem[0000000010041400] = fccf480b
!	%f8  = 67ccc440 63f38b51, Mem[0000000030001400] = ffffff00 00000000
	stda	%f8 ,[%i0+%g0]0x89	! Mem[0000000030001400] = 67ccc440 63f38b51
!	%l5 = 0000000058000b00, Mem[0000000010101410] = ff000000
	stba	%l5,[%i4+%o5]0x80	! Mem[0000000010101410] = 00000000
!	Mem[0000000010141410] = 000000ff, %l3 = 00000000ffff80ff
	swapa	[%i5+%o5]0x80,%l3	! %l3 = 00000000000000ff

p0_label_102:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = 58000b00 842fd033, %l0 = 00000000, %l1 = a1000000
	ldda	[%i1+%o4]0x88,%l0	! %l0 = 00000000842fd033 0000000058000b00
!	Mem[0000000030041410] = 8d00d911, %l3 = 00000000000000ff
	ldsba	[%i1+%o5]0x81,%l3	! %l3 = ffffffffffffff8d
!	Mem[0000000030041410] = 11d9008d, %l3 = ffffffffffffff8d
	ldsba	[%i1+%o5]0x89,%l3	! %l3 = ffffffffffffff8d
!	Mem[00000000300c1408] = 2a0000001f5044f9, %l1 = 0000000058000b00
	ldxa	[%i3+%o4]0x81,%l1	! %l1 = 2a0000001f5044f9
!	Mem[0000000030141408] = 00000000, %l7 = 00000000fccf480b
	lduwa	[%i5+%o4]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000010041400] = fccf480b, %l1 = 2a0000001f5044f9
	lduwa	[%i1+%g0]0x80,%l1	! %l1 = 00000000fccf480b
!	Mem[0000000010141400] = 002126645d000000, %l4 = 00000000842fd033
	ldxa	[%i5+%g0]0x80,%l4	! %l4 = 002126645d000000
!	Mem[0000000030001410] = ffff005b, %f27 = 59c5dbe7
	lda	[%i0+%o5]0x81,%f27	! %f27 = ffff005b
!	Mem[0000000030001410] = ffff005b, %l0 = 00000000842fd033
	lduba	[%i0+%o5]0x81,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010041418] = 630075ff, %f25 = 66a24265
	ld	[%i1+0x018],%f25	! %f25 = 630075ff

p0_label_103:
!	Starting 10 instruction Store Burst
!	%l3 = ffffffffffffff8d, Mem[0000000010041410] = 262eff0f
	stba	%l3,[%i1+%o5]0x88	! Mem[0000000010041410] = 262eff8d
!	Mem[0000000010041408] = 33d02f84, %l5 = 0000000058000b00
	ldstuba	[%i1+%o4]0x80,%l5	! %l5 = 0000000000000033
!	Mem[0000000010141408] = 008d0000, %l6 = 00000000000000ff
	ldstuba	[%i5+%o4]0x80,%l6	! %l6 = 0000000000000000
!	%l3 = ffffffffffffff8d, Mem[0000000030181410] = 00000000
	stha	%l3,[%i6+%o5]0x81	! Mem[0000000030181410] = ff8d0000
!	Mem[0000000010001424] = b08d183b, %l4 = 000000005d000000
	swap	[%i0+0x024],%l4		! %l4 = 00000000b08d183b
!	Mem[00000000100c1408] = 4cdb002a, %l2 = 000000000189db4c
	ldstuba	[%i3+%o4]0x88,%l2	! %l2 = 000000000000002a
!	%l5 = 0000000000000033, Mem[0000000010101410] = 00000000ff000000
	stxa	%l5,[%i4+%o5]0x80	! Mem[0000000010101410] = 0000000000000033
!	Mem[0000000010141400] = 00212664, %l2 = 000000000000002a
	ldstuba	[%i5+%g0]0x80,%l2	! %l2 = 0000000000000000
!	Mem[00000000211c0001] = ff008f28, %l1 = 00000000fccf480b
	ldstuba	[%o2+0x001]%asi,%l1	! %l1 = 0000000000000000
!	%f28 = 0b48cffc, Mem[0000000030041400] = 00000000
	sta	%f28,[%i1+%g0]0x89	! Mem[0000000030041400] = 0b48cffc

p0_label_104:
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = fccf480b, %l0 = 00000000000000ff
	ldswa	[%i1+%g0]0x81,%l0	! %l0 = fffffffffccf480b
!	Mem[0000000030141408] = 371c9dff 00000000, %l0 = fccf480b, %l1 = 00000000
	ldda	[%i5+%o4]0x89,%l0	! %l0 = 0000000000000000 00000000371c9dff
!	Mem[0000000010181400] = 00004100, %f11 = 546b72d7
	lda	[%i6+%g0]0x80,%f11	! %f11 = 00004100
!	Mem[0000000020800040] = ffff3ef8, %l3 = ffffffffffffff8d
	lduh	[%o1+0x040],%l3		! %l3 = 000000000000ffff
!	Mem[0000000010141400] = 0000005d 642621ff, %l4 = b08d183b, %l5 = 00000033
	ldda	[%i5+%g0]0x88,%l4	! %l4 = 00000000642621ff 000000000000005d
!	%l6 = 0000000000000000, %l5 = 000000000000005d, %l6 = 0000000000000000
	andn	%l6,%l5,%l6		! %l6 = 0000000000000000
!	Mem[00000000211c0000] = ffff8f28, %l4 = 00000000642621ff, %asi = 80
	ldsha	[%o2+0x000]%asi,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000030081400] = 01bb2058, %f21 = 01000000
	lda	[%i2+%g0]0x89,%f21	! %f21 = 01bb2058
!	Mem[0000000010181428] = 00000000, %l3 = 000000000000ffff
	ldsh	[%i6+0x028],%l3		! %l3 = 0000000000000000
!	Mem[0000000010101410] = 00000000, %l0 = 0000000000000000
	lduba	[%i4+%o5]0x80,%l0	! %l0 = 0000000000000000

p0_label_105:
!	Starting 10 instruction Store Burst
!	%f12 = 0264f52c 2fcd750d, Mem[0000000030001410] = ffff005b 50e0aed5
	stda	%f12,[%i0+%o5]0x81	! Mem[0000000030001410] = 0264f52c 2fcd750d
!	%f22 = ff000000 000000ff, %l5 = 000000000000005d
!	Mem[00000000300c1418] = 2a53b292525ea51b
	add	%i3,0x018,%g1
	stda	%f22,[%g1+%l5]ASI_PST16_SL ! Mem[00000000300c1418] = ff00b292000000ff
!	Mem[0000000030181410] = 00008dff, %l2 = 0000000000000000
	swapa	[%i6+%o5]0x89,%l2	! %l2 = 0000000000008dff
!	%f2  = 32000000, Mem[0000000010001420] = ff89db4c
	st	%f2 ,[%i0+0x020]	! Mem[0000000010001420] = 32000000
!	%l7 = 0000000000000000, Mem[0000000010001400] = 00000000
	stha	%l7,[%i0+%g0]0x88	! Mem[0000000010001400] = 00000000
!	Mem[00000000300c1400] = 09c05727, %f14 = 6c3314ca
	lda	[%i3+%g0]0x81,%f14	! %f14 = 09c05727
!	Mem[0000000010181400] = 00004100, %l6 = 0000000000000000
	swapa	[%i6+%g0]0x80,%l6	! %l6 = 0000000000004100
!	%l6 = 0000000000004100, Mem[0000000010141408] = 00008dff
	stha	%l6,[%i5+%o4]0x88	! Mem[0000000010141408] = 00004100
!	Mem[0000000020800000] = 05ffeac8, %l1 = 00000000371c9dff
	ldstub	[%o1+%g0],%l1		! %l1 = 0000000000000005
!	%f6  = 669a3ff2 06c320fb, %l2 = 0000000000008dff
!	Mem[0000000030181428] = 23217e3e72b80697
	add	%i6,0x028,%g1
	stda	%f6,[%g1+%l2]ASI_PST32_SL ! Mem[0000000030181428] = fb20c306f23f9a66

p0_label_106:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = 262eff8d, %l5 = 000000000000005d
	lduba	[%i1+%o5]0x88,%l5	! %l5 = 000000000000008d
!	Mem[0000000030001410] = 0264f52c, %l5 = 000000000000008d
	lduba	[%i0+%o5]0x81,%l5	! %l5 = 0000000000000002
	membar	#Sync			! Added by membar checker (24)
!	Mem[0000000030141400] = 2a000000 1f5044f9 00000000 ff9d1c37
!	Mem[0000000030141410] = ff800000 6853b85b 0e7254a0 537d1e31
!	Mem[0000000030141420] = 0e7254a0 00005d00 43da12de 0e78e4b7
!	Mem[0000000030141430] = 0000005d 45652dc9 6a7a4105 11d9008d
	ldda	[%i5+%g0]ASI_BLK_AIUSL,%f0 	! Block Load from 0000000030141400
!	Mem[0000000010141408] = ac8bdfd400004100, %f28 = 0b48cffc 2262e2bd
	ldda	[%i5+%o4]0x88,%f28	! %f28 = ac8bdfd4 00004100
!	Mem[0000000010001408] = 6a7afff7, %l0 = 0000000000000000
	lduba	[%i0+%o4]0x88,%l0	! %l0 = 00000000000000f7
!	%f17 = b08d183b, %f15 = 05417a6a, %f18 = ff010000
	fsubs	%f17,%f15,%f18		! %f18 = b08d183b
!	Mem[0000000010141408] = 00410000, %l6 = 0000000000004100
	ldsw	[%i5+%o4],%l6		! %l6 = 0000000000410000
!	Mem[0000000030081400] = 01bb2058, %l5 = 0000000000000002
	ldswa	[%i2+%g0]0x89,%l5	! %l5 = 0000000001bb2058
!	Mem[00000000300c1410] = 4cdbdaff, %l0 = 00000000000000f7
	lduba	[%i3+%o5]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[00000000300c1408] = 0000002a, %l5 = 0000000001bb2058
	lduwa	[%i3+%o4]0x89,%l5	! %l5 = 000000000000002a

p0_label_107:
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (25)
!	%f29 = 00004100, Mem[0000000030141410] = 000080ff
	sta	%f29,[%i5+%o5]0x89	! Mem[0000000030141410] = 00004100
!	Mem[0000000010041400] = fccf480b, %l6 = 0000000000410000
	ldswa	[%i1+%g0]0x80,%l6	! %l6 = fffffffffccf480b
!	%l2 = 00008dff, %l3 = 00000000, Mem[0000000030041400] = fccf480b 66a24265
	stda	%l2,[%i1+%g0]0x81	! Mem[0000000030041400] = 00008dff 00000000
!	Mem[0000000010141420] = 3175ceff, %l6 = 00000000fccf480b
	swap	[%i5+0x020],%l6		! %l6 = 000000003175ceff
!	%l6 = 000000003175ceff, Mem[0000000010141410] = ff80ffff
	stwa	%l6,[%i5+%o5]0x88	! Mem[0000000010141410] = 3175ceff
!	%f6  = 311e7d53, %f3  = 00000000, %f6  = 311e7d53
	fadds	%f6 ,%f3 ,%f6 		! %f6  = 311e7d53
!	%f29 = 00004100, Mem[0000000010001410] = e5696119
	sta	%f29,[%i0+%o5]0x80	! Mem[0000000010001410] = 00004100
!	Mem[0000000010181408] = 58000000, %l3 = 0000000000000000
	swapa	[%i6+%o4]0x80,%l3	! %l3 = 0000000058000000
!	Mem[000000001000143f] = 00000000, %l1 = 0000000000000005
	ldstub	[%i0+0x03f],%l1		! %l1 = 0000000000000000
!	Mem[0000000010101418] = 65632b42, %l0 = 00000000000000ff
	swap	[%i4+0x018],%l0		! %l0 = 0000000065632b42

p0_label_108:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = 4cdb00ff, %l0 = 0000000065632b42
	ldsba	[%i3+%o4]0x88,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010081400] = ff00807f, %f30 = f944501f
	lda	[%i2+%g0]0x80,%f30	! %f30 = ff00807f
	membar	#Sync			! Added by membar checker (26)
!	Mem[0000000010001400] = 00000000 0000009f f7ff7a6a 0000446a
!	Mem[0000000010001410] = 00004100 66a24265 630075ff ff1c9d8b
!	Mem[0000000010001420] = 32000000 5d000000 13ff9938 00000058
!	Mem[0000000010001430] = 00002a00 0000009f 47baaeec 000000ff
	ldda	[%i0+%g0]ASI_BLK_P,%f16	! Block Load from 0000000010001400
!	Mem[0000000030041410] = 09c05727 11d9008d, %l2 = 00008dff, %l3 = 58000000
	ldda	[%i1+%o5]0x89,%l2	! %l2 = 0000000011d9008d 0000000009c05727
!	Mem[0000000010181410] = 59c5dbe7, %l4 = ffffffffffffffff
	ldsha	[%i6+%o5]0x80,%l4	! %l4 = 00000000000059c5
!	Mem[0000000030081408] = ff000001, %l5 = 000000000000002a
	lduba	[%i2+%o4]0x81,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010001408] = 6a7afff7, %l3 = 0000000009c05727
	ldsha	[%i0+%o4]0x88,%l3	! %l3 = fffffffffffffff7
!	Mem[0000000030041410] = 8d00d911, %l1 = 0000000000000000
	lduwa	[%i1+%o5]0x81,%l1	! %l1 = 000000008d00d911
!	Mem[0000000030001408] = e7db80ff, %l7 = 0000000000000000
	ldsha	[%i0+%o4]0x81,%l7	! %l7 = ffffffffffffe7db
!	Mem[0000000010081400] = 7f8000ff, %l0 = ffffffffffffffff
	lduba	[%i2+%g0]0x88,%l0	! %l0 = 00000000000000ff

p0_label_109:
!	Starting 10 instruction Store Burst
!	%l3 = fffffffffffffff7, Mem[0000000030101408] = 000000ff
	stba	%l3,[%i4+%o4]0x89	! Mem[0000000030101408] = 000000f7
!	%f24 = 32000000, Mem[0000000010101408] = ff0000ff
	sta	%f24,[%i4+%o4]0x80	! Mem[0000000010101408] = 32000000
!	Mem[0000000010181400] = 00000000, %l4 = 00000000000059c5
	swapa	[%i6+%g0]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000010181417] = 0000000f, %l0 = 00000000000000ff
	ldstuba	[%i6+0x017]%asi,%l0	! %l0 = 000000000000000f
!	Mem[00000000300c1400] = 09c05727 bc59330d 2a000000 1f5044f9
!	%f16 = 00000000 0000009f f7ff7a6a 0000446a
!	%f20 = 00004100 66a24265 630075ff ff1c9d8b
!	%f24 = 32000000 5d000000 13ff9938 00000058
!	%f28 = 00002a00 0000009f 47baaeec 000000ff
	stda	%f16,[%i3+%g0]ASI_COMMIT_S	! Block Store to 00000000300c1400
!	Mem[0000000010181410] = e7dbc559, %l4 = 0000000000000000
	ldstuba	[%i6+%o5]0x88,%l4	! %l4 = 0000000000000059
!	Mem[0000000030141408] = 00000000, %l0 = 000000000000000f
	swapa	[%i5+%o4]0x81,%l0	! %l0 = 0000000000000000
!	%l7 = ffffffffffffe7db, Mem[0000000010141404] = 5d000000
	stw	%l7,[%i5+0x004]		! Mem[0000000010141404] = ffffe7db
!	%f28 = 00002a00 0000009f, %l0 = 0000000000000000
!	Mem[0000000010081428] = 0000000078fcf366
	add	%i2,0x028,%g1
	stda	%f28,[%g1+%l0]ASI_PST32_P ! Mem[0000000010081428] = 0000000078fcf366
!	%l4 = 0000000000000059, Mem[00000000201c0000] = ff009298, %asi = 80
	stha	%l4,[%o0+0x000]%asi	! Mem[00000000201c0000] = 00599298

p0_label_110:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = fccf480b000000ff, %f10 = b7e4780e de12da43
	ldda	[%i1+%g0]0x80,%f10	! %f10 = fccf480b 000000ff
!	Mem[0000000030101400] = 3200000000000000, %l2 = 0000000011d9008d
	ldxa	[%i4+%g0]0x89,%l2	! %l2 = 3200000000000000
!	Mem[0000000010101428] = 1178a3ce59c5dbe7, %f2  = 371c9dff 00000000, %asi = 80
	ldda	[%i4+0x028]%asi,%f2 	! %f2  = 1178a3ce 59c5dbe7
!	Mem[0000000010001410] = 0000410066a24265, %l6 = 000000003175ceff
	ldxa	[%i0+%o5]0x80,%l6	! %l6 = 0000410066a24265
!	Mem[0000000010081410] = 4cdb890100000000, %f12 = c92d6545 5d000000
	ldda	[%i2+%o5]0x88,%f12	! %f12 = 4cdb8901 00000000
	membar	#Sync			! Added by membar checker (27)
!	Mem[00000000100c1408] = ff00db4c, %l5 = 00000000000000ff
	lduha	[%i3+%o4]0x80,%l5	! %l5 = 000000000000ff00
!	Mem[0000000010081416] = 0189db4c, %l1 = 000000008d00d911
	ldsh	[%i2+0x016],%l1		! %l1 = ffffffffffffdb4c
!	Mem[0000000030181400] = ffcd0000 00000000 000000ff b08d183b
!	Mem[0000000030181410] = 00000000 00000000 663eaab2 2b7428bb
!	Mem[0000000030181420] = 5b51d500 1b62e111 fb20c306 f23f9a66
!	Mem[0000000030181430] = 186fe1ec 2051b6cd 1bf2378a 2b279b33
	ldda	[%i6+%g0]ASI_BLK_S,%f16	! Block Load from 0000000030181400
!	Mem[00000000100c140c] = 00000000, %l2 = 3200000000000000, %asi = 80
	ldswa	[%i3+0x00c]%asi,%l2	! %l2 = 0000000000000000
!	Mem[0000000030181408] = 000000ff, %l0 = 0000000000000000
	lduha	[%i6+%o4]0x81,%l0	! %l0 = 0000000000000000

p0_label_111:
!	Starting 10 instruction Store Burst
!	%l7 = ffffffffffffe7db, Mem[0000000010081410] = 4cdb890100000000
	stxa	%l7,[%i2+%o5]0x88	! Mem[0000000010081410] = ffffffffffffe7db
!	Mem[0000000030081400] = 01bb2058, %l2 = 0000000000000000
	ldstuba	[%i2+%g0]0x89,%l2	! %l2 = 0000000000000058
!	Mem[0000000010181410] = ffc5dbe7, %l4 = 0000000000000059
	ldstuba	[%i6+%o5]0x80,%l4	! %l4 = 00000000000000ff
!	%f8  = 005d0000, %f25 = 1b62e111, %f4  = 5bb85368
	fdivs	%f8 ,%f25,%f4 		! tt=0x22, %l0 = 0000000000000022
!	%l3 = fffffffffffffff7, %l2 = 0000000000000058, %y  = fffffff7
	umul	%l3,%l2,%l5		! %l5 = 00000057fffffce8, %y = 00000057
!	Mem[000000001000140d] = 0000446a, %l6 = 0000410066a24265
	ldstuba	[%i0+0x00d]%asi,%l6	! %l6 = 0000000000000000
!	Mem[0000000030101400] = 00000000, %l0 = 0000000000000022
	ldstuba	[%i4+%g0]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000010101410] = 00000000, %l3 = 00000000fffffff7
	swapa	[%i4+%o5]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000010101400] = ff89db4c, %l6 = 0000000000000000
	swapa	[%i4+%g0]0x80,%l6	! %l6 = 00000000ff89db4c
!	Mem[0000000010041408] = ffd02f84, %l4 = 00000000000000ff
	ldstuba	[%i1+%o4]0x80,%l4	! %l4 = 00000000000000ff

p0_label_112:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = ff00807f, %l0 = 0000000000000000
	ldsba	[%i2+%g0]0x80,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000030041408] = fccf4db3, %l0 = ffffffffffffffff
	lduwa	[%i1+%o4]0x89,%l0	! %l0 = 00000000fccf4db3
!	Mem[0000000010101400] = 00000000b08d183b, %f14 = 8d00d911 05417a6a
	ldda	[%i4+%g0]0x80,%f14	! %f14 = 00000000 b08d183b
!	Code Fragment 3, seed = 809007
p0_fragment_11:
!	%l0 = 00000000fccf4db3
	setx	0x21e59fc4446f15ae,%g7,%l0 ! %l0 = 21e59fc4446f15ae
!	%l1 = ffffffffffffdb4c
	setx	0xa5421d3d17377359,%g7,%l1 ! %l1 = a5421d3d17377359
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 21e59fc4446f15ae
	setx	0x61de2feb5d22fd14,%g7,%l0 ! %l0 = 61de2feb5d22fd14
!	%l1 = a5421d3d17377359
	setx	0xbb36152dcd4735df,%g7,%l1 ! %l1 = bb36152dcd4735df
p0_fragment_11_end:
!	Mem[0000000010101408] = f76069e500000032, %f4  = 5bb85368 000080ff
	ldda	[%i4+%o4]0x88,%f4 	! %f4  = f76069e5 00000032
!	Mem[0000000030181400] = ffcd0000, %l7 = ffffffffffffe7db
	lduha	[%i6+%g0]0x81,%l7	! %l7 = 000000000000ffcd
!	Mem[0000000030081410] = 00417a6a, %l3 = 0000000000000000
	ldsba	[%i2+%o5]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000030041400] = 00000000ff8d0000, %f8  = 005d0000 a054720e
	ldda	[%i1+%g0]0x89,%f8 	! %f8  = 00000000 ff8d0000
!	%l3 = 0000000000000000, %l2 = 0000000000000058, %l1 = bb36152dcd4735df
	xor	%l3,%l2,%l1		! %l1 = 0000000000000058
!	Mem[0000000010041434] = 66a24265, %l1 = 0000000000000058, %asi = 80
	ldsha	[%i1+0x034]%asi,%l1	! %l1 = 00000000000066a2

p0_label_113:
!	Starting 10 instruction Store Burst
!	%f22 = 663eaab2 2b7428bb, Mem[0000000030041408] = b34dcffc 2b2728bb
	stda	%f22,[%i1+%o4]0x81	! Mem[0000000030041408] = 663eaab2 2b7428bb
!	%f26 = fb20c306 f23f9a66, %l5 = 00000057fffffce8
!	Mem[0000000010141438] = ffffffffe56960f7
	add	%i5,0x038,%g1
	stda	%f26,[%g1+%l5]ASI_PST8_PL ! Mem[0000000010141438] = fffffff2e5c320fb
!	Mem[0000000010081408] = 00ff0000, %l0 = 61de2feb5d22fd14
	ldstuba	[%i2+%o4]0x80,%l0	! %l0 = 0000000000000000
!	%l2 = 0000000000000058, Mem[00000000300c1408] = 6a7afff7
	stha	%l2,[%i3+%o4]0x89	! Mem[00000000300c1408] = 6a7a0058
!	Mem[0000000010001418] = 630075ff, %l4 = 000000ff, %l3 = 00000000
	add	%i0,0x18,%g1
	casa	[%g1]0x80,%l4,%l3	! %l3 = 00000000630075ff
!	%l4 = 00000000000000ff, Mem[0000000010081408] = ffff0000
	stha	%l4,[%i2+%o4]0x80	! Mem[0000000010081408] = 00ff0000
!	%l1 = 00000000000066a2, %l2 = 0000000000000058, %l7 = 000000000000ffcd
	or	%l1,%l2,%l7		! %l7 = 00000000000066fa
!	%l5 = 00000057fffffce8, Mem[00000000211c0000] = ffff8f28
	stb	%l5,[%o2+%g0]		! Mem[00000000211c0000] = e8ff8f28
!	%l2 = 0000000000000058, Mem[00000000100c1400] = 000000ff
	stwa	%l2,[%i3+%g0]0x80	! Mem[00000000100c1400] = 00000058
!	Mem[0000000030181400] = 0000cdff, %l5 = 00000057fffffce8
	ldstuba	[%i6+%g0]0x89,%l5	! %l5 = 00000000000000ff

p0_label_114:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = ffffffff, %l3 = 00000000630075ff
	ldsba	[%i3+%o5]0x88,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000030081408] = ff000001, %l0 = 0000000000000000
	ldsba	[%i2+%o4]0x81,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000030181400] = 0000cdff, %l3 = ffffffffffffffff
	lduba	[%i6+%g0]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[000000001010141c] = a1a30d0b, %l4 = 00000000000000ff, %asi = 80
	ldsha	[%i4+0x01c]%asi,%l4	! %l4 = ffffffffffffa1a3
!	Mem[00000000211c0000] = e8ff8f28, %l5 = 00000000000000ff
	ldsb	[%o2+%g0],%l5		! %l5 = ffffffffffffffe8
!	Mem[0000000030041410] = 09c0572711d9008d, %l7 = 00000000000066fa
	ldxa	[%i1+%o5]0x89,%l7	! %l7 = 09c0572711d9008d
!	Mem[0000000010141410] = 0b48cffc 3175ceff, %l6 = ff89db4c, %l7 = 11d9008d
	ldda	[%i5+%o5]0x88,%l6	! %l6 = 000000003175ceff 000000000b48cffc
!	Mem[0000000030081410] = 00417a6a, %l2 = 0000000000000058
	ldsha	[%i2+%o5]0x81,%l2	! %l2 = 0000000000000041
!	%l2 = 0000000000000041, Mem[0000000030041408] = b2aa3e66
	stba	%l2,[%i1+%o4]0x89	! Mem[0000000030041408] = b2aa3e41
!	Mem[0000000030041400] = 00008dff, %l6 = 000000003175ceff
	ldswa	[%i1+%g0]0x81,%l6	! %l6 = 0000000000008dff

p0_label_115:
!	Starting 10 instruction Store Burst
!	Mem[0000000030141408] = 0000000f, %l2 = 0000000000000041
	ldstuba	[%i5+%o4]0x81,%l2	! %l2 = 0000000000000000
!	%l5 = ffffffffffffffe8, Mem[0000000010141434] = 6fbed37d
	stw	%l5,[%i5+0x034]		! Mem[0000000010141434] = ffffffe8
!	Mem[0000000030001400] = 63f38b51, %l2 = 0000000000000000
	swapa	[%i0+%g0]0x89,%l2	! %l2 = 0000000063f38b51
!	%f10 = fccf480b 000000ff, Mem[0000000010081400] = 7f8000ff 160060ba
	stda	%f10,[%i2+%g0]0x88	! Mem[0000000010081400] = fccf480b 000000ff
!	%l2 = 0000000063f38b51, Mem[0000000010081410] = dbe7ffff
	stwa	%l2,[%i2+%o5]0x80	! Mem[0000000010081410] = 63f38b51
!	Mem[0000000030081410] = 6a7a4100, %l7 = 000000000b48cffc
	ldstuba	[%i2+%o5]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000010081408] = 0000ff00, %l2 = 0000000063f38b51
	swapa	[%i2+%o4]0x88,%l2	! %l2 = 000000000000ff00
	membar	#Sync			! Added by membar checker (28)
!	%l0 = ffffffffffffffff, Mem[0000000030181408] = 000000ff
	stwa	%l0,[%i6+%o4]0x81	! Mem[0000000030181408] = ffffffff
!	Mem[0000000030041400] = ff8d0000, %l4 = 00000000ffffa1a3
	swapa	[%i1+%g0]0x89,%l4	! %l4 = 00000000ff8d0000
!	%f4  = f76069e5, Mem[0000000030041410] = 11d9008d
	sta	%f4 ,[%i1+%o5]0x89	! Mem[0000000030041410] = f76069e5

p0_label_116:
!	Starting 10 instruction Load Burst
!	Mem[0000000021800180] = 2cff5078, %l4 = 00000000ff8d0000
	ldsh	[%o3+0x180],%l4		! %l4 = 0000000000002cff
!	Mem[0000000030081408] = ff000001, %l2 = 000000000000ff00
	ldsba	[%i2+%o4]0x81,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000030081410] = 6a7a41ff, %f12 = 4cdb8901
	lda	[%i2+%o5]0x89,%f12	! %f12 = 6a7a41ff
!	Mem[0000000030141400] = 2a000000, %l0 = ffffffffffffffff
	lduba	[%i5+%g0]0x81,%l0	! %l0 = 000000000000002a
!	Mem[0000000030081400] = ff20bb01, %l7 = 0000000000000000
	lduha	[%i2+%g0]0x81,%l7	! %l7 = 000000000000ff20
!	Mem[0000000010181438] = 0189db4c, %l5 = ffffffffffffffe8, %asi = 80
	ldswa	[%i6+0x038]%asi,%l5	! %l5 = 000000000189db4c
!	Mem[00000000100c1400] = 0000005800000000, %f16 = ffcd0000 00000000
	ldda	[%i3+%g0]0x80,%f16	! %f16 = 00000058 00000000
!	Mem[0000000030081410] = ff417a6affffffa9, %l4 = 0000000000002cff
	ldxa	[%i2+%o5]0x81,%l4	! %l4 = ff417a6affffffa9
!	%l1 = 00000000000066a2, %l3 = 00000000000000ff, %l5 = 000000000189db4c
	and	%l1,%l3,%l5		! %l5 = 00000000000000a2
!	Mem[0000000030181400] = 0000cdff, %l5 = 00000000000000a2
	lduwa	[%i6+%g0]0x89,%l5	! %l5 = 000000000000cdff

p0_label_117:
!	Starting 10 instruction Store Burst
!	%f19 = b08d183b, %f23 = 2b7428bb, %f11 = 000000ff
	fdivs	%f19,%f23,%f11		! %f11 = c493eff1
!	Mem[0000000010101428] = 1178a3ce, %l1 = 000066a2, %l4 = ffffffa9
	add	%i4,0x28,%g1
	casa	[%g1]0x80,%l1,%l4	! %l4 = 000000001178a3ce
!	Mem[00000000300c1408] = 6a7a0058, %l3 = 00000000000000ff
	ldstuba	[%i3+%o4]0x89,%l3	! %l3 = 0000000000000058
!	Mem[0000000010101410] = fffffff7, %l4 = 000000001178a3ce
	ldstuba	[%i4+%o5]0x80,%l4	! %l4 = 00000000000000ff
!	%l3 = 0000000000000058, Mem[0000000030141410] = 00004100
	stha	%l3,[%i5+%o5]0x89	! Mem[0000000030141410] = 00000058
!	Mem[0000000010101410] = f7ffffff, %l3 = 0000000000000058
	swapa	[%i4+%o5]0x88,%l3	! %l3 = 00000000f7ffffff
!	%l2 = ffffffff, %l3 = f7ffffff, Mem[0000000010001420] = 32000000 5d000000, %asi = 80
	stda	%l2,[%i0+0x020]%asi	! Mem[0000000010001420] = ffffffff f7ffffff
!	%l5 = 000000000000cdff, Mem[0000000030081400] = 01bb20ff
	stba	%l5,[%i2+%g0]0x89	! Mem[0000000030081400] = 01bb20ff
!	%f20 = 00000000 00000000, Mem[00000000100c1410] = ffffffff fffffff7
	stda	%f20,[%i3+%o5]0x80	! Mem[00000000100c1410] = 00000000 00000000
!	%f28 = 186fe1ec, %f7  = a054720e
	fcmps	%fcc0,%f28,%f7 		! %fcc0 = 2

p0_label_118:
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = 00000000, %l1 = 00000000000066a2
	ldsha	[%i3+%g0]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000030141400] = 2a000000, %l5 = 000000000000cdff
	ldsha	[%i5+%g0]0x81,%l5	! %l5 = 0000000000002a00
!	Mem[0000000021800000] = 1a90db58, %l5 = 0000000000002a00
	ldsh	[%o3+%g0],%l5		! %l5 = 0000000000001a90
!	Mem[00000000300c1410] = 00410000, %l1 = 0000000000000000
	lduba	[%i3+%o5]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000010001414] = 66a24265, %l1 = 0000000000000000
	lduh	[%i0+0x014],%l1		! %l1 = 00000000000066a2
!	Mem[0000000010081408] = 518bf363, %l7 = 000000000000ff20
	lduha	[%i2+%o4]0x80,%l7	! %l7 = 000000000000518b
!	Mem[0000000010181400] = 1178a3ce000059c5, %f6  = 311e7d53 a054720e
	ldda	[%i6+%g0]0x88,%f6 	! %f6  = 1178a3ce 000059c5
!	Mem[0000000030101400] = 000000ff, %l0 = 000000000000002a
	ldsba	[%i4+%g0]0x89,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010001408] = f7ff7a6a, %l0 = ffffffffffffffff
	ldswa	[%i0+%o4]0x80,%l0	! %l0 = fffffffff7ff7a6a
!	Mem[0000000030181400] = 0000cdff, %f30 = 1bf2378a
	lda	[%i6+%g0]0x89,%f30	! %f30 = 0000cdff

p0_label_119:
!	Starting 10 instruction Store Burst
!	%f22 = 663eaab2 2b7428bb, Mem[0000000010101438] = 2ef9ff1a 4d513183
	std	%f22,[%i4+0x038]	! Mem[0000000010101438] = 663eaab2 2b7428bb
!	%l5 = 0000000000001a90, Mem[00000000300c1410] = 00004100
	stwa	%l5,[%i3+%o5]0x81	! Mem[00000000300c1410] = 00001a90
!	Mem[00000000300c1410] = 00001a90, %l7 = 000000000000518b
	ldstuba	[%i3+%o5]0x81,%l7	! %l7 = 0000000000000000
!	%l1 = 00000000000066a2, Mem[0000000010181410] = ffc5dbe7
	stha	%l1,[%i6+%o5]0x80	! Mem[0000000010181410] = 66a2dbe7
!	%l1 = 00000000000066a2, Mem[0000000010001410] = 00004100
	stwa	%l1,[%i0+%o5]0x80	! Mem[0000000010001410] = 000066a2
!	%f14 = 00000000, Mem[0000000010181414] = 000000ff
	sta	%f14,[%i6+0x014]%asi	! Mem[0000000010181414] = 00000000
!	%l1 = 00000000000066a2, Mem[0000000010041428] = ba602d16432b2e47, %asi = 80
	stxa	%l1,[%i1+0x028]%asi	! Mem[0000000010041428] = 00000000000066a2
!	%f16 = 00000058 00000000, Mem[0000000010001410] = a2660000 6542a266
	stda	%f16,[%i0+%o5]0x88	! Mem[0000000010001410] = 00000058 00000000
!	%l5 = 0000000000001a90, Mem[0000000010101436] = 2262e2bd
	sth	%l5,[%i4+0x036]		! Mem[0000000010101434] = 22621a90
!	%l0 = fffffffff7ff7a6a, Mem[0000000030181408] = ffffffff
	stwa	%l0,[%i6+%o4]0x81	! Mem[0000000030181408] = f7ff7a6a

p0_label_120:
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = e56960f7, %l6 = 0000000000008dff
	lduwa	[%i1+%o5]0x81,%l6	! %l6 = 00000000e56960f7
!	Mem[00000000300c1408] = ff007a6a0000446a, %f2  = 1178a3ce 59c5dbe7
	ldda	[%i3+%o4]0x81,%f2 	! %f2  = ff007a6a 0000446a
!	Mem[0000000030141408] = ff00000f, %l6 = 00000000e56960f7
	ldsha	[%i5+%o4]0x81,%l6	! %l6 = ffffffffffffff00
!	Mem[0000000010001408] = f7ff7a6a00ff446a, %l5 = 0000000000001a90
	ldxa	[%i0+%o4]0x80,%l5	! %l5 = f7ff7a6a00ff446a
!	Mem[0000000010101408] = 32000000, %l1 = 00000000000066a2
	ldsba	[%i4+%o4]0x80,%l1	! %l1 = 0000000000000032
!	Mem[0000000030141400] = f944501f0000002a, %l7 = 0000000000000000
	ldxa	[%i5+%g0]0x89,%l7	! %l7 = f944501f0000002a
!	Mem[0000000010081400] = fccf480b000000ff, %f16 = 00000058 00000000
	ldda	[%i2+%g0]0x88,%f16	! %f16 = fccf480b 000000ff
!	Mem[0000000030041410] = f76069e5, %l7 = f944501f0000002a
	ldswa	[%i1+%o5]0x89,%l7	! %l7 = fffffffff76069e5
!	Mem[00000000100c1408] = ff00db4c, %l2 = ffffffffffffffff
	ldswa	[%i3+%o4]0x80,%l2	! %l2 = ffffffffff00db4c
!	Mem[0000000030001408] = e7db80ff, %l6 = ffffffffffffff00
	ldswa	[%i0+%o4]0x81,%l6	! %l6 = ffffffffe7db80ff

p0_label_121:
!	Starting 10 instruction Store Burst
!	Mem[0000000010181438] = 0189db4c000000ff, %l6 = ffffffffe7db80ff, %l5 = f7ff7a6a00ff446a
	add	%i6,0x38,%g1
	casxa	[%g1]0x80,%l6,%l5	! %l5 = 0189db4c000000ff
!	%f20 = 00000000 00000000, Mem[0000000030041408] = 413eaab2 2b7428bb
	stda	%f20,[%i1+%o4]0x81	! Mem[0000000030041408] = 00000000 00000000
!	%l4 = 000000ff, %l5 = 000000ff, Mem[0000000010041408] = 842fd0ff 58000b00
	stda	%l4,[%i1+%o4]0x88	! Mem[0000000010041408] = 000000ff 000000ff
!	%l5 = 0189db4c000000ff, Mem[0000000010181408] = 00000000
	stba	%l5,[%i6+%o4]0x88	! Mem[0000000010181408] = 000000ff
!	%l4 = 00000000000000ff, Mem[00000000211c0001] = e8ff8f28
	stb	%l4,[%o2+0x001]		! Mem[00000000211c0000] = e8ff8f28
!	%l2 = ff00db4c, %l3 = f7ffffff, Mem[0000000030101410] = e56960f7 000000ff
	stda	%l2,[%i4+%o5]0x89	! Mem[0000000030101410] = ff00db4c f7ffffff
!	Mem[0000000010181428] = 00000000, %l1 = 0000000000000032
	swap	[%i6+0x028],%l1		! %l1 = 0000000000000000
!	%l2 = ffffffffff00db4c, Mem[0000000030001400] = 00000000
	stba	%l2,[%i0+%g0]0x89	! Mem[0000000030001400] = 0000004c
!	%l7 = fffffffff76069e5, Mem[0000000010001410] = 0000000058000000
	stxa	%l7,[%i0+%o5]0x80	! Mem[0000000010001410] = fffffffff76069e5
!	%f5  = 00000032, Mem[0000000010001408] = 6a7afff7
	sta	%f5 ,[%i0+%o4]0x88	! Mem[0000000010001408] = 00000032

p0_label_122:
!	Starting 10 instruction Load Burst
!	Mem[0000000030001400] = 0000004c, %l3 = 00000000f7ffffff
	ldsba	[%i0+%g0]0x89,%l3	! %l3 = 000000000000004c
!	Mem[0000000010141408] = 00410000 d4df8bac, %l2 = ff00db4c, %l3 = 0000004c
	ldda	[%i5+%o4]0x80,%l2	! %l2 = 0000000000410000 00000000d4df8bac
!	Mem[00000000300c1408] = 6a440000 6a7a00ff, %l4 = 000000ff, %l5 = 000000ff
	ldda	[%i3+%o4]0x89,%l4	! %l4 = 000000006a7a00ff 000000006a440000
!	Mem[00000000100c1400] = 0000000058000000, %l7 = fffffffff76069e5
	ldxa	[%i3+%g0]0x88,%l7	! %l7 = 0000000058000000
!	Mem[00000000100c1410] = 00000000, %l0 = fffffffff7ff7a6a
	ldsba	[%i3+%o5]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000010101420] = 476c3610 33abd3e1, %l0 = 00000000, %l1 = 00000000, %asi = 80
	ldda	[%i4+0x020]%asi,%l0	! %l0 = 00000000476c3610 0000000033abd3e1
!	Mem[00000000100c1400] = 58000000, %l1 = 0000000033abd3e1
	ldsba	[%i3+%g0]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000030041410] = 09c05727f76069e5, %f8  = 00000000 ff8d0000
	ldda	[%i1+%o5]0x89,%f8 	! %f8  = 09c05727 f76069e5
!	Mem[0000000030101408] = f7000000, %l3 = 00000000d4df8bac
	ldsba	[%i4+%o4]0x81,%l3	! %l3 = fffffffffffffff7
!	Mem[000000001018142c] = 00000000, %l6 = ffffffffe7db80ff, %asi = 80
	lduha	[%i6+0x02c]%asi,%l6	! %l6 = 0000000000000000

p0_label_123:
!	Starting 10 instruction Store Burst
!	%l4 = 000000006a7a00ff, Mem[00000000300c1408] = 6a7a00ff
	stwa	%l4,[%i3+%o4]0x89	! Mem[00000000300c1408] = 6a7a00ff
!	Mem[0000000010081400] = ff000000 0b48cffc 518bf363 2262e2bd
!	%f16 = fccf480b 000000ff 000000ff b08d183b
!	%f20 = 00000000 00000000 663eaab2 2b7428bb
!	%f24 = 5b51d500 1b62e111 fb20c306 f23f9a66
!	%f28 = 186fe1ec 2051b6cd 0000cdff 2b279b33
	stda	%f16,[%i2+%g0]ASI_BLK_AIUP	! Block Store to 0000000010081400
!	%l1 = 0000000000000000, Mem[0000000010181400] = c5590000
	stwa	%l1,[%i6+%g0]0x80	! Mem[0000000010181400] = 00000000
!	%f8  = 09c05727 f76069e5, Mem[0000000030181408] = f7ff7a6a b08d183b
	stda	%f8 ,[%i6+%o4]0x81	! Mem[0000000030181408] = 09c05727 f76069e5
!	Mem[0000000021800100] = 1057e418, %l4 = 000000006a7a00ff
	ldstuba	[%o3+0x100]%asi,%l4	! %l4 = 0000000000000010
!	Mem[0000000010181400] = 00000000, %l1 = 0000000000000000
	ldstuba	[%i6+%g0]0x88,%l1	! %l1 = 0000000000000000
!	%l3 = fffffffffffffff7, Mem[0000000010041408] = ff000000
	sth	%l3,[%i1+%o4]		! Mem[0000000010041408] = fff70000
!	%l0 = 00000000476c3610, Mem[0000000030101400] = 000000ff
	stha	%l0,[%i4+%g0]0x89	! Mem[0000000030101400] = 00003610
!	%l0 = 476c3610, %l1 = 00000000, Mem[0000000010101410] = 58000000 00000033
	stda	%l0,[%i4+%o5]0x80	! Mem[0000000010101410] = 476c3610 00000000
!	Mem[0000000010181410] = 66a2dbe7, %l1 = 0000000000000000
	ldstuba	[%i6+%o5]0x80,%l1	! %l1 = 0000000000000066

p0_label_124:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = 00000032, %l6 = 0000000000000000
	lduba	[%i4+%o4]0x88,%l6	! %l6 = 0000000000000032
!	%f27 = f23f9a66, %f4  = f76069e5, %f2  = ff007a6a
	fmuls	%f27,%f4 ,%f2 		! %f2  = 7f800000
!	Mem[0000000030041400] = a3a1ffff00000000, %l2 = 0000000000410000
	ldxa	[%i1+%g0]0x81,%l2	! %l2 = a3a1ffff00000000
!	Mem[0000000021800040] = 62002388, %l3 = fffffffffffffff7
	lduh	[%o3+0x040],%l3		! %l3 = 0000000000006200
!	Mem[0000000010101420] = 476c3610, %f9  = f76069e5
	lda	[%i4+0x020]%asi,%f9 	! %f9 = 476c3610
!	Mem[00000000300c1408] = ff007a6a 0000446a, %l4 = 00000010, %l5 = 6a440000
	ldda	[%i3+%o4]0x81,%l4	! %l4 = 00000000ff007a6a 000000000000446a
!	Mem[0000000010141400] = ff212664ffffe7db, %l6 = 0000000000000032
	ldxa	[%i5+%g0]0x80,%l6	! %l6 = ff212664ffffe7db
!	Mem[0000000010001408] = 32000000, %l2 = a3a1ffff00000000
	ldsba	[%i0+%o4]0x80,%l2	! %l2 = 0000000000000032
!	%f13 = 00000000, %f31 = 2b279b33, %f10 = fccf480b
	fdivs	%f13,%f31,%f10		! %f10 = 00000000
	membar	#Sync			! Added by membar checker (29)
!	Mem[0000000030041400] = a3a1ffff 00000000 00000000 00000000
!	Mem[0000000030041410] = e56960f7 2757c009 09e5e7d2 6d65bd5b
!	Mem[0000000030041420] = 7bc7b320 65cff2b1 6552c55e 403d3d37
!	Mem[0000000030041430] = 167d9a0c 5e46fa6d 49c3a8aa 08aa13d3
	ldda	[%i1+%g0]ASI_BLK_SL,%f16	! Block Load from 0000000030041400

p0_label_125:
!	Starting 10 instruction Store Burst
!	Mem[0000000010081410] = 00000000, %l0 = 00000000476c3610
	swapa	[%i2+%o5]0x80,%l0	! %l0 = 0000000000000000
!	%l6 = ffffe7db, %l7 = 58000000, Mem[0000000010101408] = 32000000 e56960f7
	stda	%l6,[%i4+%o4]0x80	! Mem[0000000010101408] = ffffe7db 58000000
!	Mem[0000000010141424] = 6ee44ec1, %l5 = 000000000000446a, %asi = 80
	swapa	[%i5+0x024]%asi,%l5	! %l5 = 000000006ee44ec1
!	%l7 = 0000000058000000, Mem[00000000100c1408] = ff00db4c00000000
	stxa	%l7,[%i3+%o4]0x80	! Mem[00000000100c1408] = 0000000058000000
!	%l5 = 000000006ee44ec1, Mem[0000000030101410] = ff00db4c
	stwa	%l5,[%i4+%o5]0x89	! Mem[0000000030101410] = 6ee44ec1
!	%l6 = ffffe7db, %l7 = 58000000, Mem[0000000030141400] = 0000002a f944501f
	stda	%l6,[%i5+%g0]0x89	! Mem[0000000030141400] = ffffe7db 58000000
!	Mem[00000000218000c0] = 00ffa7e8, %l3 = 0000000000006200
	ldstub	[%o3+0x0c0],%l3		! %l3 = 0000000000000000
!	Mem[0000000030181400] = ffcd0000 00000000 09c05727 f76069e5
!	%f0  = f944501f 0000002a 7f800000 0000446a
!	%f4  = f76069e5 00000032 1178a3ce 000059c5
!	%f8  = 09c05727 476c3610 00000000 c493eff1
!	%f12 = 6a7a41ff 00000000 00000000 b08d183b
	stda	%f0 ,[%i6+%g0]ASI_BLK_AIUS	! Block Store to 0000000030181400
!	Mem[0000000010101408] = dbe7ffff, %l1 = 0000000000000066
	swapa	[%i4+%o4]0x88,%l1	! %l1 = 00000000dbe7ffff
!	%l2 = 00000032, %l3 = 00000000, Mem[00000000100c1408] = 00000000 58000000
	stda	%l2,[%i3+%o4]0x80	! Mem[00000000100c1408] = 00000032 00000000

p0_label_126:
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = 00000000, %l0 = 0000000000000000
	ldsba	[%i3+%g0]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000010041427] = 24938341, %l5 = 000000006ee44ec1, %asi = 80
	ldsba	[%i1+0x027]%asi,%l5	! %l5 = 0000000000000041
	membar	#Sync			! Added by membar checker (30)
!	Mem[0000000010181410] = 00000000e7dba2ff, %f30 = d313aa08 aaa8c349
	ldda	[%i6+%o5]0x88,%f30	! %f30 = 00000000 e7dba2ff
!	Mem[0000000010101408] = 66000000, %l7 = 0000000058000000
	ldsba	[%i4+%o4]0x80,%l7	! %l7 = 0000000000000066
!	Mem[0000000030101410] = c14ee46e, %l4 = 00000000ff007a6a
	ldswa	[%i4+%o5]0x81,%l4	! %l4 = ffffffffc14ee46e
!	Mem[0000000010081408] = 000000ffb08d183b, %f16 = 00000000 ffffa1a3
	ldda	[%i2+%o4]0x80,%f16	! %f16 = 000000ff b08d183b
!	Mem[0000000010101410] = 10366c47, %l4 = ffffffffc14ee46e
	ldsha	[%i4+%o5]0x88,%l4	! %l4 = 0000000000006c47
!	Mem[00000000100c1410] = 00000000, %l6 = ff212664ffffe7db
	lduha	[%i3+%o5]0x88,%l6	! %l6 = 0000000000000000
!	Mem[00000000300c1410] = ff001a90 66a24265, %l0 = 00000000, %l1 = dbe7ffff
	ldda	[%i3+%o5]0x81,%l0	! %l0 = 00000000ff001a90 0000000066a24265
!	Mem[00000000100c1410] = 00000000 00000000, %l4 = 00006c47, %l5 = 00000041
	ldd	[%i3+%o5],%l4		! %l4 = 0000000000000000 0000000000000000

p0_label_127:
!	Starting 10 instruction Store Burst
!	%l0 = 00000000ff001a90, Mem[00000000100c1400] = 00000058
	stba	%l0,[%i3+%g0]0x80	! Mem[00000000100c1400] = 90000058
!	%l0 = 00000000ff001a90, Mem[0000000030041400] = ffffa1a3
	stha	%l0,[%i1+%g0]0x89	! Mem[0000000030041400] = ffff1a90
!	%l0 = 00000000ff001a90, Mem[0000000010001410] = ffffffff
	stha	%l0,[%i0+%o5]0x80	! Mem[0000000010001410] = 1a90ffff
!	%f28 = 6dfa465e, Mem[0000000030001400] = 0000004c
	sta	%f28,[%i0+%g0]0x89	! Mem[0000000030001400] = 6dfa465e
!	Mem[0000000010041400] = fccf480b, %l7 = 0000000000000066
	swapa	[%i1+%g0]0x80,%l7	! %l7 = 00000000fccf480b
!	Mem[0000000030181408] = 0000807f, %l7 = 00000000fccf480b
	swapa	[%i6+%o4]0x89,%l7	! %l7 = 000000000000807f
!	Mem[0000000030041410] = f76069e5, %l6 = 0000000000000000
	swapa	[%i1+%o5]0x89,%l6	! %l6 = 00000000f76069e5
!	%f17 = b08d183b, Mem[0000000030041410] = 00000000
	sta	%f17,[%i1+%o5]0x89	! Mem[0000000030041410] = b08d183b
!	%l5 = 0000000000000000, Mem[0000000030081410] = ff417a6a
	stha	%l5,[%i2+%o5]0x81	! Mem[0000000030081410] = 00007a6a
!	Mem[0000000030141400] = dbe7ffff, %l2 = 0000000000000032
	swapa	[%i5+%g0]0x81,%l2	! %l2 = 00000000dbe7ffff

p0_label_128:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081420] = 5b51d5001b62e111, %f10 = 00000000 c493eff1
	ldd	[%i2+0x020],%f10	! %f10 = 5b51d500 1b62e111
!	Mem[0000000030101400] = 10360000, %l2 = 00000000dbe7ffff
	lduha	[%i4+%g0]0x81,%l2	! %l2 = 0000000000001036
!	Mem[0000000010101438] = 663eaab2 2b7428bb, %l6 = f76069e5, %l7 = 0000807f
	ldd	[%i4+0x038],%l6		! %l6 = 00000000663eaab2 000000002b7428bb
!	Mem[0000000010181408] = 000000c9 000000ff, %l2 = 00001036, %l3 = 00000000
	ldda	[%i6+%o4]0x88,%l2	! %l2 = 00000000000000ff 00000000000000c9
!	Mem[0000000010081408] = ff000000, %l1 = 0000000066a24265
	ldsha	[%i2+%o4]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010041410] = 262eff8d, %l5 = 0000000000000000
	lduwa	[%i1+%o5]0x88,%l5	! %l5 = 00000000262eff8d
!	Mem[000000001004141a] = 630075ff, %l3 = 00000000000000c9
	ldsh	[%i1+0x01a],%l3		! %l3 = 00000000000075ff
!	Mem[0000000010081410] = 476c361000000000, %l1 = 0000000000000000
	ldxa	[%i2+%o5]0x80,%l1	! %l1 = 476c361000000000
!	Mem[0000000010081410] = 476c361000000000, %l0 = 00000000ff001a90
	ldxa	[%i2+%o5]0x80,%l0	! %l0 = 476c361000000000
!	Mem[0000000021800000] = 1a90db58, %l2 = 00000000000000ff
	lduh	[%o3+%g0],%l2		! %l2 = 0000000000001a90

p0_label_129:
!	Starting 10 instruction Store Burst
!	%f26 = 373d3d40 5ec55265, Mem[0000000030181410] = f76069e5 00000032
	stda	%f26,[%i6+%o5]0x81	! Mem[0000000030181410] = 373d3d40 5ec55265
!	%l3 = 00000000000075ff, Mem[0000000010141408] = 00004100
	stba	%l3,[%i5+%o4]0x88	! Mem[0000000010141408] = 000041ff
!	Mem[0000000010001408] = 00000032, %l0 = 0000000000000000
	swapa	[%i0+%o4]0x88,%l0	! %l0 = 0000000000000032
!	%l0 = 00000032, %l1 = 00000000, Mem[0000000010181400] = ff000000 cea37811
	std	%l0,[%i6+%g0]		! Mem[0000000010181400] = 00000032 00000000
!	%l3 = 00000000000075ff, Mem[00000000201c0000] = 00599298
	sth	%l3,[%o0+%g0]		! Mem[00000000201c0000] = 75ff9298
!	%f23 = d2e7e509, Mem[0000000030141410] = 58000000
	sta	%f23,[%i5+%o5]0x81	! Mem[0000000030141410] = d2e7e509
!	%l5 = 00000000262eff8d, Mem[0000000030101410] = c14ee46e
	stha	%l5,[%i4+%o5]0x81	! Mem[0000000030101410] = ff8de46e
!	Mem[0000000030041410] = b08d183b, %l4 = 0000000000000000
	ldstuba	[%i1+%o5]0x89,%l4	! %l4 = 000000000000003b
!	%l2 = 0000000000001a90, Mem[0000000010101408] = 0000005800000066
	stxa	%l2,[%i4+%o4]0x88	! Mem[0000000010101408] = 0000000000001a90
!	%l2 = 00001a90, %l3 = 000075ff, Mem[0000000010041410] = 262eff8d 00001bff
	stda	%l2,[%i1+%o5]0x88	! Mem[0000000010041410] = 00001a90 000075ff

p0_label_130:
!	Starting 10 instruction Load Burst
!	%l4 = 000000000000003b, %l7 = 000000002b7428bb, %l6 = 00000000663eaab2
	orn	%l4,%l7,%l6		! %l6 = ffffffffd48bd77f
!	Mem[00000000300c1400] = 00000000, %l5 = 00000000262eff8d
	ldswa	[%i3+%g0]0x89,%l5	! %l5 = 0000000000000000
!	Mem[00000000201c0000] = 75ff9298, %l7 = 000000002b7428bb
	ldsh	[%o0+%g0],%l7		! %l7 = 00000000000075ff
!	Mem[0000000030081400] = 01bb20ff, %l3 = 00000000000075ff
	ldswa	[%i2+%g0]0x89,%l3	! %l3 = 0000000001bb20ff
!	Mem[0000000010001400] = 9f000000 00000000, %l0 = 00000032, %l1 = 00000000
	ldda	[%i0+%g0]0x88,%l0	! %l0 = 0000000000000000 000000009f000000
!	Mem[00000000100c1408] = 00000032, %l2 = 0000000000001a90, %asi = 80
	ldswa	[%i3+0x008]%asi,%l2	! %l2 = 0000000000000032
!	Mem[0000000010141438] = fffffff2 e5c320fb, %l2 = 00000032, %l3 = 01bb20ff, %asi = 80
	ldda	[%i5+0x038]%asi,%l2	! %l2 = 00000000fffffff2 00000000e5c320fb
!	Mem[00000000100c1430] = 11d996ff000000ff, %l5 = 0000000000000000
	ldx	[%i3+0x030],%l5		! %l5 = 11d996ff000000ff
!	Mem[0000000030101408] = f7000000, %f7  = 000059c5
	lda	[%i4+%o4]0x81,%f7 	! %f7 = f7000000
!	Mem[0000000010141410] = ffce7531, %l0 = 0000000000000000
	ldswa	[%i5+%o5]0x80,%l0	! %l0 = ffffffffffce7531

p0_label_131:
!	Starting 10 instruction Store Burst
!	%f24 = b1f2cf65, Mem[0000000030181400] = f944501f
	sta	%f24,[%i6+%g0]0x81	! Mem[0000000030181400] = b1f2cf65
!	%l1 = 000000009f000000, Mem[0000000010081408] = ff000000
	stha	%l1,[%i2+%o4]0x88	! Mem[0000000010081408] = ff000000
!	%l2 = fffffff2, %l3 = e5c320fb, Mem[0000000010141400] = ff212664 ffffe7db
	std	%l2,[%i5+%g0]		! Mem[0000000010141400] = fffffff2 e5c320fb
!	%l0 = ffce7531, %l1 = 9f000000, Mem[0000000010041408] = fff70000 ff000000
	stda	%l0,[%i1+%o4]0x80	! Mem[0000000010041408] = ffce7531 9f000000
!	Mem[0000000010041408] = ffce7531, %l7 = 00000000000075ff, %asi = 80
	swapa	[%i1+0x008]%asi,%l7	! %l7 = 00000000ffce7531
!	%l7 = 00000000ffce7531, %l7 = 00000000ffce7531, %l6 = ffffffffd48bd77f
	subc	%l7,%l7,%l6		! %l6 = 0000000000000000
!	Mem[00000000201c0001] = 75ff9298, %l5 = 11d996ff000000ff
	ldstuba	[%o0+0x001]%asi,%l5	! %l5 = 00000000000000ff
!	Mem[00000000100c1400] = 90000058, %l0 = ffffffffffce7531
	ldstuba	[%i3+%g0]0x80,%l0	! %l0 = 0000000000000090
!	%f12 = 6a7a41ff 00000000, Mem[0000000010101430] = 0b48cffc 22621a90, %asi = 80
	stda	%f12,[%i4+0x030]%asi	! Mem[0000000010101430] = 6a7a41ff 00000000
!	%l3 = 00000000e5c320fb, Mem[00000000100c1400] = 580000ff
	stha	%l3,[%i3+%g0]0x88	! Mem[00000000100c1400] = 580020fb

p0_label_132:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = 476c3610, %l1 = 000000009f000000
	lduba	[%i4+%o5]0x80,%l1	! %l1 = 0000000000000047
!	Mem[0000000010141430] = 3202565c, %l6 = 0000000000000000, %asi = 80
	swapa	[%i5+0x030]%asi,%l6	! %l6 = 000000003202565c
!	Mem[0000000020800041] = ffff3ef8, %l4 = 000000000000003b, %asi = 80
	ldsba	[%o1+0x041]%asi,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000030141400] = 00000032, %l6 = 000000003202565c
	ldsha	[%i5+%g0]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000010081400] = 0b48cffc, %l2 = 00000000fffffff2
	lduba	[%i2+%g0]0x88,%l2	! %l2 = 00000000000000fc
!	Mem[0000000021800001] = 1a90db58, %l6 = 0000000000000000
	ldub	[%o3+0x001],%l6		! %l6 = 0000000000000090
!	Mem[00000000100c1400] = 580020fb, %l4 = ffffffffffffffff
	lduha	[%i3+%g0]0x88,%l4	! %l4 = 00000000000020fb
!	%f1  = 0000002a, %f18 = 00000000
	fcmpes	%fcc0,%f1 ,%f18		! %fcc0 = 2
!	%l0 = 0000000000000090, immd = fffff09d, %y  = 00000057
	smul	%l0,-0xf63,%l7		! %l7 = fffffffffff75850, %y = ffffffff
!	Mem[0000000010181424] = 66a24265, %f2  = 7f800000
	lda	[%i6+0x024]%asi,%f2 	! %f2 = 66a24265

p0_label_133:
!	Starting 10 instruction Store Burst
!	Mem[0000000010101408] = 901a000000000000, %l5 = 00000000000000ff, %l7 = fffffffffff75850
	add	%i4,0x08,%g1
	casxa	[%g1]0x80,%l5,%l7	! %l7 = 901a000000000000
!	Mem[0000000010041400] = 66000000, %l6 = 0000000000000090
	ldstuba	[%i1+%g0]0x88,%l6	! %l6 = 0000000000000000
!	%f14 = 00000000 b08d183b, %l2 = 00000000000000fc
!	Mem[0000000010001428] = 13ff993800000058
	add	%i0,0x028,%g1
	stda	%f14,[%g1+%l2]ASI_PST32_P ! Mem[0000000010001428] = 13ff993800000058
!	Mem[00000000100c1400] = fb200058, %l0 = 0000000000000090
	swapa	[%i3+%g0]0x80,%l0	! %l0 = 00000000fb200058
!	Mem[0000000010101400] = 00000000, %l4 = 00000000000020fb
	swapa	[%i4+%g0]0x80,%l4	! %l4 = 0000000000000000
!	%l6 = 0000000000000000, Mem[00000000100c1400] = 90000000
	stha	%l6,[%i3+%g0]0x88	! Mem[00000000100c1400] = 90000000
!	Mem[0000000010141430] = 00000000, %l4 = 0000000000000000
	ldstuba	[%i5+0x030]%asi,%l4	! %l4 = 0000000000000000
!	%l2 = 00000000000000fc, Mem[0000000030001410] = 2cf56402
	stba	%l2,[%i0+%o5]0x89	! Mem[0000000030001410] = 2cf564fc
!	%f8  = 09c05727, Mem[0000000030101408] = 000000f7
	sta	%f8 ,[%i4+%o4]0x89	! Mem[0000000030101408] = 09c05727
!	Mem[0000000030081400] = ff20bb01, %l7 = 0000000000000000
	swapa	[%i2+%g0]0x81,%l7	! %l7 = 00000000ff20bb01

p0_label_134:
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = d2e7e509, %l2 = 00000000000000fc
	ldsha	[%i5+%o5]0x81,%l2	! %l2 = ffffffffffffd2e7
!	Mem[0000000010001408] = 00000000, %l4 = 0000000000000000
	ldsba	[%i0+%o4]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000030041408] = 00000000, %l6 = 0000000000000000
	lduha	[%i1+%o4]0x81,%l6	! %l6 = 0000000000000000
!	Mem[00000000100c1408] = 00000032, %l6 = 0000000000000000
	lduwa	[%i3+%o4]0x80,%l6	! %l6 = 0000000000000032
	membar	#Sync			! Added by membar checker (31)
!	Mem[0000000030001400] = 5e46fa6d 40c4cc67 e7db80ff 00005d00
!	Mem[0000000030001410] = fc64f52c 2fcd750d 608eaa72 0a61517b
!	Mem[0000000030001420] = 1c99e2c0 72071fd1 4ade89fe 07c68b57
!	Mem[0000000030001430] = 20ca5bac 494b318d 743a0f4a 3f663bf3
	ldda	[%i0+%g0]ASI_BLK_AIUSL,%f16	! Block Load from 0000000030001400
!	Mem[0000000030181408] = 0b48cffc, %l6 = 0000000000000032
	ldswa	[%i6+%o4]0x81,%l6	! %l6 = 000000000b48cffc
!	Mem[00000000300c1410] = ff001a9066a24265, %f8  = 09c05727 476c3610
	ldda	[%i3+%o5]0x81,%f8 	! %f8  = ff001a90 66a24265
!	Mem[0000000010041400] = 660000ff, %l1 = 0000000000000047
	lduha	[%i1+%g0]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010041410] = 901a0000, %l2 = ffffffffffffd2e7
	lduwa	[%i1+%o5]0x80,%l2	! %l2 = 00000000901a0000
!	Mem[000000001010143a] = 663eaab2, %l7 = 00000000ff20bb01
	lduh	[%i4+0x03a],%l7		! %l7 = 000000000000aab2

p0_label_135:
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (32)
!	%l7 = 000000000000aab2, Mem[0000000030001408] = ff80dbe7
	stha	%l7,[%i0+%o4]0x89	! Mem[0000000030001408] = ff80aab2
!	%l1 = 00000000000000ff, Mem[0000000010181408] = 000000ff
	stba	%l1,[%i6+%o4]0x88	! Mem[0000000010181408] = 000000ff
!	Mem[0000000030101408] = 2757c009, %l7 = 000000000000aab2
	swapa	[%i4+%o4]0x81,%l7	! %l7 = 000000002757c009
!	%l1 = 00000000000000ff, Mem[0000000030081400] = 00000000
	stwa	%l1,[%i2+%g0]0x89	! Mem[0000000030081400] = 000000ff
!	Mem[0000000010001425] = f7ffffff, %l3 = 00000000e5c320fb
	ldstub	[%i0+0x025],%l3		! %l3 = 00000000000000ff
!	%f17 = 6dfa465e, Mem[0000000010101410] = 10366c47
	sta	%f17,[%i4+%o5]0x88	! Mem[0000000010101410] = 6dfa465e
!	%f25 = c0e2991c, Mem[00000000100c1408] = 32000000
	sta	%f25,[%i3+%o4]0x88	! Mem[00000000100c1408] = c0e2991c
!	%f12 = 6a7a41ff 00000000, Mem[0000000010001430] = 00002a00 0000009f
	std	%f12,[%i0+0x030]	! Mem[0000000010001430] = 6a7a41ff 00000000
!	Mem[0000000010141400] = fffffff2, %l7 = 000000002757c009
	ldstuba	[%i5+%g0]0x80,%l7	! %l7 = 00000000000000ff
!	%f27 = fe89de4a, Mem[000000001014143c] = e5c320fb
	sta	%f27,[%i5+0x03c]%asi	! Mem[000000001014143c] = fe89de4a

p0_label_136:
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = 0000aab22757c009, %l3 = 00000000000000ff
	ldxa	[%i4+%o4]0x81,%l3	! %l3 = 0000aab22757c009
!	Mem[000000001004143d] = 796b91e3, %l1 = 00000000000000ff, %asi = 80
	lduba	[%i1+0x03d]%asi,%l1	! %l1 = 000000000000006b
!	Mem[0000000010101400] = 000020fb, %l3 = 0000aab22757c009
	ldsba	[%i4+%g0]0x80,%l3	! %l3 = 0000000000000000
!	Mem[00000000300c1400] = 00000000, %l1 = 000000000000006b
	ldsba	[%i3+%g0]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000030081410] = 00007a6a, %l1 = 0000000000000000
	lduba	[%i2+%o5]0x81,%l1	! %l1 = 0000000000000000
!	%l1 = 0000000000000000, immd = fffff8ba, %y  = ffffffff
	udiv	%l1,-0x746,%l3		! %l3 = 00000000ffffffff
	mov	%l0,%y			! %y = fb200058
!	Mem[0000000010181410] = e7dba2ff, %l0 = 00000000fb200058
	ldswa	[%i6+%o5]0x88,%l0	! %l0 = ffffffffe7dba2ff
!	Mem[0000000010141408] = ff410000, %l6 = 000000000b48cffc
	ldsha	[%i5+%o4]0x80,%l6	! %l6 = ffffffffffffff41
!	Mem[0000000030041400] = 901affff, %l4 = 0000000000000000
	ldsha	[%i1+%g0]0x81,%l4	! %l4 = ffffffffffff901a
!	Mem[0000000010141430] = ff000000ffffffe8, %f6  = 1178a3ce f7000000, %asi = 80
	ldda	[%i5+0x030]%asi,%f6 	! %f6  = ff000000 ffffffe8

p0_label_137:
!	Starting 10 instruction Store Burst
!	%l0 = ffffffffe7dba2ff, Mem[0000000030181408] = fccf480b
	stha	%l0,[%i6+%o4]0x89	! Mem[0000000030181408] = fccfa2ff
!	%f24 = d11f0772 c0e2991c, %l0 = ffffffffe7dba2ff
!	Mem[0000000010081438] = 0000cdff2b279b33
	add	%i2,0x038,%g1
	stda	%f24,[%g1+%l0]ASI_PST8_P ! Mem[0000000010081438] = d11f0772c0e2991c
!	Mem[0000000010081408] = 000000ff, %l4 = 00000000ffff901a
	swapa	[%i2+%o4]0x80,%l4	! %l4 = 00000000000000ff
!	%l6 = ffffffffffffff41, Mem[0000000030181400] = 65cff2b1
	stwa	%l6,[%i6+%g0]0x89	! Mem[0000000030181400] = ffffff41
!	%l0 = ffffffffe7dba2ff, Mem[0000000030081400] = ff000000c14ee46e
	stxa	%l0,[%i2+%g0]0x81	! Mem[0000000030081400] = ffffffffe7dba2ff
!	Mem[0000000010081404] = 000000ff, %l6 = 00000000ffffff41
	swap	[%i2+0x004],%l6		! %l6 = 00000000000000ff
!	Mem[0000000010181434] = 00000032, %l1 = 0000000000000000, %asi = 80
	swapa	[%i6+0x034]%asi,%l1	! %l1 = 0000000000000032
!	Mem[0000000010181408] = ff000000, %l5 = 00000000000000ff
	ldstuba	[%i6+%o4]0x80,%l5	! %l5 = 00000000000000ff
!	%f0  = f944501f, Mem[0000000010001434] = 00000000
	sta	%f0 ,[%i0+0x034]%asi	! Mem[0000000010001434] = f944501f
!	Mem[0000000010181430] = 0000000000000000, %l1 = 0000000000000032, %l1 = 0000000000000032
	add	%i6,0x30,%g1
	casxa	[%g1]0x80,%l1,%l1	! %l1 = 0000000000000000

p0_label_138:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = 00000000, %l4 = 00000000000000ff
	lduba	[%i0+%g0]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000010181400] = 32000000, %l4 = 0000000000000000
	lduba	[%i6+%g0]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000030041408] = 00000000, %f14 = 00000000
	lda	[%i1+%o4]0x81,%f14	! %f14 = 00000000
!	Mem[0000000030081410] = 00007a6a, %f31 = 4a0f3a74
	lda	[%i2+%o5]0x81,%f31	! %f31 = 00007a6a
!	Mem[0000000030001400] = 5e46fa6d 40c4cc67, %l4 = 00000000, %l5 = 000000ff
	ldda	[%i0+%g0]0x81,%l4	! %l4 = 000000005e46fa6d 0000000040c4cc67
!	Mem[00000000100c1408] = c0e2991c, %l0 = ffffffffe7dba2ff
	ldsha	[%i3+%o4]0x88,%l0	! %l0 = ffffffffffff991c
!	%f11 = 1b62e111, %f30 = f33b663f
	fcmpes	%fcc2,%f11,%f30		! %fcc2 = 2
!	Mem[0000000030141408] = 371c9dff0f0000ff, %l0 = ffffffffffff991c
	ldxa	[%i5+%o4]0x89,%l0	! %l0 = 371c9dff0f0000ff
!	Mem[000000001014141a] = 000d11e1, %l1 = 0000000000000000
	ldsh	[%i5+0x01a],%l1		! %l1 = 00000000000011e1
!	Mem[00000000100c1400] = 0000009000000000, %f12 = 6a7a41ff 00000000
	ldda	[%i3+%g0]0x80,%f12	! %f12 = 00000090 00000000

p0_label_139:
!	Starting 10 instruction Store Burst
!	%l2 = 00000000901a0000, Mem[0000000030041410] = b08d18ff
	stwa	%l2,[%i1+%o5]0x89	! Mem[0000000030041410] = 901a0000
!	Mem[0000000010041430] = 00004529, %l0 = 371c9dff0f0000ff
	ldstuba	[%i1+0x030]%asi,%l0	! %l0 = 0000000000000000
!	%l7 = 00000000000000ff, Mem[0000000010001421] = ffffffff, %asi = 80
	stba	%l7,[%i0+0x021]%asi	! Mem[0000000010001420] = ffffffff
!	%l4 = 000000005e46fa6d, Mem[0000000030141408] = 0f0000ff
	stba	%l4,[%i5+%o4]0x89	! Mem[0000000030141408] = 0f00006d
!	Mem[0000000010101404] = b08d183b, %l5 = 0000000040c4cc67
	ldstub	[%i4+0x004],%l5		! %l5 = 00000000000000b0
!	%l1 = 00000000000011e1, Mem[0000000030141410] = 09e5e7d2
	stba	%l1,[%i5+%o5]0x89	! Mem[0000000030141410] = 09e5e7e1
!	%l6 = 00000000000000ff, Mem[00000000100c1400] = 90000000
	stha	%l6,[%i3+%g0]0x88	! Mem[00000000100c1400] = 900000ff
!	%l6 = 00000000000000ff, Mem[0000000030081408] = 010000ff
	stha	%l6,[%i2+%o4]0x89	! Mem[0000000030081408] = 010000ff
!	%l5 = 00000000000000b0, Mem[0000000010041408] = 0000009fff750000
	stxa	%l5,[%i1+%o4]0x88	! Mem[0000000010041408] = 00000000000000b0
!	%f20 = 0d75cd2f 2cf564fc, %l7 = 00000000000000ff
!	Mem[0000000030101430] = 0264f52c2fcd750d
	add	%i4,0x030,%g1
	stda	%f20,[%g1+%l7]ASI_PST8_S ! Mem[0000000030101430] = 0d75cd2f2cf564fc

p0_label_140:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = ff000066, %f6  = ff000000
	lda	[%i1+%g0]0x80,%f6 	! %f6 = ff000066
!	Mem[0000000010101400] = 000020fb, %l1 = 00000000000011e1
	lduha	[%i4+%g0]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000030081408] = 1f4e0e4c010000ff, %f28 = 8d314b49 ac5bca20
	ldda	[%i2+%o4]0x89,%f28	! %f28 = 1f4e0e4c 010000ff
!	Mem[0000000010081410] = 476c3610, %l4 = 000000005e46fa6d
	ldsha	[%i2+%o5]0x80,%l4	! %l4 = 000000000000476c
!	Mem[0000000030081400] = ffffffffe7dba2ff, %f28 = 1f4e0e4c 010000ff
	ldda	[%i2+%g0]0x81,%f28	! %f28 = ffffffff e7dba2ff
!	Mem[0000000030141410] = 09e5e7e1, %l7 = 00000000000000ff
	lduha	[%i5+%o5]0x89,%l7	! %l7 = 000000000000e7e1
!	Mem[0000000010041410] = 901a0000ff750000, %l5 = 00000000000000b0
	ldxa	[%i1+%o5]0x80,%l5	! %l5 = 901a0000ff750000
!	%l5 = 901a0000ff750000, %l2 = 00000000901a0000, %l1  = 0000000000000000
	mulx	%l5,%l2,%l1		! %l1 = 8fcbc1e200000000
!	Mem[0000000030041410] = 901a0000, %f28 = ffffffff
	lda	[%i1+%o5]0x89,%f28	! %f28 = 901a0000
!	Mem[0000000010081408] = 1a90ffff, %l6 = 00000000000000ff
	ldsha	[%i2+%o4]0x88,%l6	! %l6 = ffffffffffffffff

p0_label_141:
!	Starting 10 instruction Store Burst
!	%l6 = ffffffff, %l7 = 0000e7e1, Mem[0000000030001408] = b2aa80ff 00005d00
	stda	%l6,[%i0+%o4]0x81	! Mem[0000000030001408] = ffffffff 0000e7e1
!	%l6 = ffffffff, %l7 = 0000e7e1, Mem[0000000030101400] = 00003610 32000000
	stda	%l6,[%i4+%g0]0x89	! Mem[0000000030101400] = ffffffff 0000e7e1
!	%l2 = 00000000901a0000, Mem[0000000010001400] = 000000000000009f
	stxa	%l2,[%i0+%g0]0x80	! Mem[0000000010001400] = 00000000901a0000
!	Mem[00000000100c1408] = c0e2991c, %l3 = 00000000ffffffff
	swapa	[%i3+%o4]0x88,%l3	! %l3 = 00000000c0e2991c
!	%l4 = 000000000000476c, immd = fffffffffffffe1e, %l108 = 0000000000000004
	udivx	%l4,-0x1e2,%l4		! %l4 = 0000000000000000
!	%f26 = 578bc607, Mem[0000000010081400] = 0b48cffc
	sta	%f26,[%i2+%g0]0x88	! Mem[0000000010081400] = 578bc607
!	%l3 = 00000000c0e2991c, Mem[0000000030141408] = 6d00000f
	stba	%l3,[%i5+%o4]0x81	! Mem[0000000030141408] = 1c00000f
!	%l5 = 901a0000ff750000, Mem[0000000010041408] = b0000000, %asi = 80
	stba	%l5,[%i1+0x008]%asi	! Mem[0000000010041408] = 00000000
!	Mem[00000000300c1410] = ff001a90, %l6 = ffffffffffffffff
	ldstuba	[%i3+%o5]0x81,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010181415] = 00000000, %l1 = 8fcbc1e200000000
	ldstub	[%i6+0x015],%l1		! %l1 = 0000000000000000

p0_label_142:
!	Starting 10 instruction Load Burst
!	Mem[000000001004143c] = 796b91e3, %l7 = 000000000000e7e1
	ldub	[%i1+0x03c],%l7		! %l7 = 0000000000000079
!	Mem[0000000021800081] = 488c67b8, %l2 = 00000000901a0000
	ldsb	[%o3+0x081],%l2		! %l2 = ffffffffffffff8c
!	Mem[0000000030041408] = 00000000, %f22 = 7b51610a
	lda	[%i1+%o4]0x81,%f22	! %f22 = 00000000
!	Mem[0000000030181410] = 373d3d40, %l0 = 0000000000000000
	lduba	[%i6+%o5]0x81,%l0	! %l0 = 0000000000000037
!	Mem[0000000010101404] = ff8d183b, %f26 = 578bc607
	ld	[%i4+0x004],%f26	! %f26 = ff8d183b
!	Mem[0000000030041400] = 901affff, %l2 = ffffffffffffff8c
	lduwa	[%i1+%g0]0x81,%l2	! %l2 = 00000000901affff
!	Mem[0000000010101400] = 000020fbff8d183b, %l4 = 0000000000000000
	ldxa	[%i4+%g0]0x80,%l4	! %l4 = 000020fbff8d183b
!	Mem[0000000010101410] = 5e46fa6d00000000, %l2 = 00000000901affff
	ldxa	[%i4+%o5]0x80,%l2	! %l2 = 5e46fa6d00000000
!	Mem[0000000030141400] = 32000000, %f1  = 0000002a
	lda	[%i5+%g0]0x89,%f1 	! %f1 = 32000000
!	Mem[00000000300c1410] = 901a00ff, %l0 = 0000000000000037
	ldswa	[%i3+%o5]0x89,%l0	! %l0 = ffffffff901a00ff

p0_label_143:
!	Starting 10 instruction Store Burst
!	%l7 = 0000000000000079, Mem[0000000030081408] = 010000ff
	stba	%l7,[%i2+%o4]0x89	! Mem[0000000030081408] = 01000079
!	%l2 = 5e46fa6d00000000, Mem[00000000300c1410] = 901a00ff
	stba	%l2,[%i3+%o5]0x89	! Mem[00000000300c1410] = 901a0000
!	Mem[0000000010141408] = ff410000, %l3 = 00000000c0e2991c
	swapa	[%i5+%o4]0x80,%l3	! %l3 = 00000000ff410000
!	%l6 = 00000000000000ff, Mem[00000000211c0000] = e8ff8f28, %asi = 80
	stba	%l6,[%o2+0x000]%asi	! Mem[00000000211c0000] = ffff8f28
!	%l4 = 000020fbff8d183b, Mem[000000001018142e] = 00000000
	sth	%l4,[%i6+0x02e]		! Mem[000000001018142c] = 0000183b
!	Mem[0000000030141400] = 32000000, %l5 = 901a0000ff750000
	ldstuba	[%i5+%g0]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000010181435] = 00000000, %l6 = 00000000000000ff
	ldstuba	[%i6+0x035]%asi,%l6	! %l6 = 0000000000000000
!	%l5 = 0000000000000000, Mem[0000000030141410] = e1e7e509
	stwa	%l5,[%i5+%o5]0x81	! Mem[0000000030141410] = 00000000
!	%f6  = ff000066 ffffffe8, Mem[0000000010041410] = 00001a90 000075ff
	stda	%f6 ,[%i1+%o5]0x88	! Mem[0000000010041410] = ff000066 ffffffe8
!	Mem[0000000010001400] = 00000000901a0000, %l7 = 0000000000000079, %l0 = ffffffff901a00ff
	casxa	[%i0]0x80,%l7,%l0	! %l0 = 00000000901a0000

p0_label_144:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081414] = 00000000, %l1 = 0000000000000000
	lduw	[%i2+0x014],%l1		! %l1 = 0000000000000000
!	Mem[0000000030041410] = 00001a90, %l6 = 0000000000000000
	ldsha	[%i1+%o5]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000030001408] = ffffffff, %l5 = 0000000000000000
	lduwa	[%i0+%o4]0x89,%l5	! %l5 = 00000000ffffffff
!	Mem[0000000030101400] = ffffffffe1e70000, %f2  = 66a24265 0000446a
	ldda	[%i4+%g0]0x81,%f2 	! %f2  = ffffffff e1e70000
!	Mem[0000000010101428] = 1178a3ce, %l0 = 00000000901a0000
	ldsh	[%i4+0x028],%l0		! %l0 = 0000000000001178
!	%f9  = 66a24265, %f8  = ff001a90, %f12 = 00000090
	fsubs	%f9 ,%f8 ,%f12		! %f12 = 7f001a90
!	Mem[0000000010141400] = fffffff2, %l5 = 00000000ffffffff
	lduba	[%i5+%g0]0x80,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030141408] = 1c00000f, %l7 = 0000000000000079
	ldsba	[%i5+%o4]0x81,%l7	! %l7 = 000000000000001c
!	Mem[0000000020800000] = ffffeac8, %l6 = 0000000000000000
	ldub	[%o1+%g0],%l6		! %l6 = 00000000000000ff
!	Mem[0000000010181408] = 000000ff, %f4  = f76069e5
	lda	[%i6+%o4]0x88,%f4 	! %f4 = 000000ff

p0_label_145:
!	Starting 10 instruction Store Burst
!	%f18 = 005d0000 ff80dbe7, %l3 = 00000000ff410000
!	Mem[0000000030181408] = ffa2cffc0000446a
	add	%i6,0x008,%g1
	stda	%f18,[%g1+%l3]ASI_PST32_S ! Mem[0000000030181408] = ffa2cffc0000446a
!	Mem[00000000300c1410] = 00001a90, %l0 = 0000000000001178
	swapa	[%i3+%o5]0x81,%l0	! %l0 = 0000000000001a90
!	%l5 = 00000000000000ff, Mem[00000000300c1408] = ff007a6a
	stha	%l5,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00ff7a6a
!	%f2  = ffffffff, %f0  = f944501f, %f1  = 32000000
	fadds	%f2 ,%f0 ,%f1 		! %f1  = ffffffff
!	Mem[0000000010041400] = 660000ff, %l7 = 000000000000001c
	ldstuba	[%i1+%g0]0x88,%l7	! %l7 = 00000000000000ff
!	%l4 = ff8d183b, %l5 = 000000ff, Mem[0000000030081400] = ffffffff e7dba2ff
	stda	%l4,[%i2+%g0]0x81	! Mem[0000000030081400] = ff8d183b 000000ff
!	%l7 = 00000000000000ff, Mem[0000000010001436] = f944501f
	sth	%l7,[%i0+0x036]		! Mem[0000000010001434] = f94400ff
!	%f14 = 00000000 b08d183b, Mem[0000000010001400] = 00000000 901a0000, %asi = 80
	stda	%f14,[%i0+0x000]%asi	! Mem[0000000010001400] = 00000000 b08d183b
!	Mem[0000000030181400] = ffffff41, %l7 = 00000000000000ff
	swapa	[%i6+%g0]0x89,%l7	! %l7 = 00000000ffffff41
!	%l4 = 000020fbff8d183b, immd = 0000000000000eda, %l4  = 000020fbff8d183b
	mulx	%l4,0xeda,%l4		! %l4 = 01e9de915579dc3e

p0_label_146:
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = e1e70000ffffffff, %l3 = 00000000ff410000
	ldxa	[%i0+%o4]0x89,%l3	! %l3 = e1e70000ffffffff
!	Mem[0000000010141438] = fffffff2, %l3 = e1e70000ffffffff
	ldsw	[%i5+0x038],%l3		! %l3 = fffffffffffffff2
!	Mem[0000000010041408] = 00000000, %l2 = 5e46fa6d00000000
	lduba	[%i1+%o4]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000010001408] = 00000000, %l4 = 01e9de915579dc3e
	ldswa	[%i0+%o4]0x80,%l4	! %l4 = 0000000000000000
!	Mem[00000000218001c0] = 11ff80a8, %l5 = 00000000000000ff, %asi = 80
	ldsha	[%o3+0x1c0]%asi,%l5	! %l5 = 00000000000011ff
!	Mem[0000000010141428] = 3fb4e72e, %l3 = fffffffffffffff2, %asi = 80
	ldswa	[%i5+0x028]%asi,%l3	! %l3 = 000000003fb4e72e
!	Mem[0000000030001410] = fc64f52c, %f5  = 00000032
	lda	[%i0+%o5]0x81,%f5 	! %f5 = fc64f52c
!	Mem[00000000300c1400] = 000000000000009f, %l4 = 0000000000000000
	ldxa	[%i3+%g0]0x81,%l4	! %l4 = 000000000000009f
!	Mem[0000000010141400] = fffffff2, %l5 = 00000000000011ff, %asi = 80
	lduha	[%i5+0x000]%asi,%l5	! %l5 = 000000000000ffff
!	Mem[0000000030081410] = 6a7a0000, %f18 = 005d0000
	lda	[%i2+%o5]0x89,%f18	! %f18 = 6a7a0000

p0_label_147:
!	Starting 10 instruction Store Burst
!	%f18 = 6a7a0000, Mem[000000001014140c] = d4df8bac
	st	%f18,[%i5+0x00c]	! Mem[000000001014140c] = 6a7a0000
!	%f12 = 7f001a90, Mem[00000000100c1400] = ff000090
	sta	%f12,[%i3+%g0]0x80	! Mem[00000000100c1400] = 7f001a90
!	%l0 = 00001a90, %l1 = 00000000, Mem[0000000030101410] = ff8de46e fffffff7
	stda	%l0,[%i4+%o5]0x81	! Mem[0000000030101410] = 00001a90 00000000
!	%l1 = 0000000000000000, Mem[0000000030041410] = 00001a902757c009
	stxa	%l1,[%i1+%o5]0x81	! Mem[0000000030041410] = 0000000000000000
!	%f2  = ffffffff e1e70000, Mem[0000000030181400] = ff000000 0000002a
	stda	%f2 ,[%i6+%g0]0x81	! Mem[0000000030181400] = ffffffff e1e70000
!	Mem[0000000010041408] = 00000000, %l3 = 000000003fb4e72e
	ldstuba	[%i1+%o4]0x80,%l3	! %l3 = 0000000000000000
!	%l7 = 00000000ffffff41, Mem[0000000010041400] = 660000ff
	stha	%l7,[%i1+%g0]0x88	! Mem[0000000010041400] = 6600ff41
!	%f10 = 5b51d500 1b62e111, Mem[0000000010181408] = 000000ff 000000c9
	stda	%f10,[%i6+%o4]0x88	! Mem[0000000010181408] = 5b51d500 1b62e111
!	Mem[0000000010181400] = 00000032, %l3 = 0000000000000000
	swapa	[%i6+%g0]0x80,%l3	! %l3 = 0000000000000032
!	%l6 = 00000000000000ff, Mem[00000000100c1400] = 7f001a90
	stba	%l6,[%i3+%g0]0x80	! Mem[00000000100c1400] = ff001a90

p0_label_148:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = 5e46fa6d, %l0 = 0000000000001a90
	lduwa	[%i4+%o5]0x80,%l0	! %l0 = 000000005e46fa6d
!	Mem[00000000100c141f] = 1248e92b, %l3 = 0000000000000032, %asi = 80
	lduba	[%i3+0x01f]%asi,%l3	! %l3 = 000000000000002b
!	Mem[00000000300c1400] = 9f000000 00000000, %l4 = 0000009f, %l5 = 0000ffff
	ldda	[%i3+%g0]0x89,%l4	! %l4 = 0000000000000000 000000009f000000
!	Mem[0000000010081400] = 07c68b57ffffff41, %f24 = d11f0772 c0e2991c
	ldda	[%i2+%g0]0x80,%f24	! %f24 = 07c68b57 ffffff41
!	Mem[0000000030181410] = 403d3d37, %l2 = 0000000000000000
	lduba	[%i6+%o5]0x89,%l2	! %l2 = 0000000000000037
!	Mem[0000000030041410] = 00000000 00000000, %l2 = 00000037, %l3 = 0000002b
	ldda	[%i1+%o5]0x81,%l2	! %l2 = 0000000000000000 0000000000000000
!	Mem[0000000010141410] = ffce7531 fccf480b, %l2 = 00000000, %l3 = 00000000
	ldda	[%i5+%o5]0x80,%l2	! %l2 = 00000000ffce7531 00000000fccf480b
!	Mem[0000000010081410] = 476c3610, %f13 = 00000000
	lda	[%i2+%o5]0x80,%f13	! %f13 = 476c3610
!	Mem[00000000300c1400] = 00000000, %l7 = 00000000ffffff41
	lduba	[%i3+%g0]0x81,%l7	! %l7 = 0000000000000000
!	Mem[00000000100c1408] = 00000000ffffffff, %l1 = 0000000000000000
	ldxa	[%i3+%o4]0x88,%l1	! %l1 = 00000000ffffffff

p0_label_149:
!	Starting 10 instruction Store Burst
!	%l7 = 0000000000000000, Mem[0000000010001410] = ffff901a
	stha	%l7,[%i0+%o5]0x88	! Mem[0000000010001410] = ffff0000
!	%f21 = 2cf564fc, Mem[0000000010081400] = 578bc607
	sta	%f21,[%i2+%g0]0x88	! Mem[0000000010081400] = 2cf564fc
!	%l4 = 0000000000000000, Mem[0000000010041430] = ff00452966a24265
	stx	%l4,[%i1+0x030]		! Mem[0000000010041430] = 0000000000000000
!	%l4 = 00000000, %l5 = 9f000000, Mem[0000000030141400] = ff000032 00000058
	stda	%l4,[%i5+%g0]0x81	! Mem[0000000030141400] = 00000000 9f000000
!	Mem[00000000100c1400] = ff001a90, %l3 = 00000000fccf480b
	swapa	[%i3+%g0]0x80,%l3	! %l3 = 00000000ff001a90
!	%l2 = 00000000ffce7531, Mem[0000000021800180] = 2cff5078
	sth	%l2,[%o3+0x180]		! Mem[0000000021800180] = 75315078
!	Mem[0000000030141410] = 00000000, %l1 = 00000000ffffffff
	swapa	[%i5+%o5]0x81,%l1	! %l1 = 0000000000000000
!	%l4 = 0000000000000000, Mem[000000001000142b] = 13ff9938, %asi = 80
	stba	%l4,[%i0+0x02b]%asi	! Mem[0000000010001428] = 13ff9900
!	%l3 = 00000000ff001a90, Mem[00000000201c0000] = 75ff9298, %asi = 80
	stha	%l3,[%o0+0x000]%asi	! Mem[00000000201c0000] = 1a909298
!	%f29 = e7dba2ff, Mem[00000000300c1408] = 00ff7a6a
	sta	%f29,[%i3+%o4]0x81	! Mem[00000000300c1408] = e7dba2ff

p0_label_150:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = 00000000, %l5 = 000000009f000000
	ldsba	[%i3+%o5]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000030141410] = ffffffff, %l7 = 0000000000000000
	ldswa	[%i5+%o5]0x89,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010041400] = 6600ff41, %l5 = 0000000000000000
	ldswa	[%i1+%g0]0x88,%l5	! %l5 = 000000006600ff41
!	Mem[0000000030181410] = 403d3d37, %l2 = 00000000ffce7531
	lduha	[%i6+%o5]0x89,%l2	! %l2 = 0000000000003d37
!	Mem[00000000211c0000] = ffff8f28, %l2 = 0000000000003d37
	lduh	[%o2+%g0],%l2		! %l2 = 000000000000ffff
!	Mem[0000000010101410] = 6dfa465e, %l0 = 000000005e46fa6d
	ldsha	[%i4+%o5]0x88,%l0	! %l0 = 000000000000465e
!	Mem[0000000030141400] = 00000000, %f23 = 72aa8e60
	lda	[%i5+%g0]0x89,%f23	! %f23 = 00000000
!	Mem[0000000030001400] = 5e46fa6d, %l4 = 0000000000000000
	ldswa	[%i0+%g0]0x81,%l4	! %l4 = 000000005e46fa6d
!	Mem[0000000010001424] = f7ffffff, %l6 = 00000000000000ff, %asi = 80
	lduha	[%i0+0x024]%asi,%l6	! %l6 = 000000000000f7ff
!	Mem[0000000010041420] = 22330000, %l4 = 000000005e46fa6d
	lduw	[%i1+0x020],%l4		! %l4 = 0000000022330000

p0_label_151:
!	Starting 10 instruction Store Burst
!	Mem[000000001014143c] = fe89de4a, %l1 = 0000000000000000, %asi = 80
	swapa	[%i5+0x03c]%asi,%l1	! %l1 = 00000000fe89de4a
!	%l0 = 000000000000465e, Mem[0000000010141400] = fffffff2e5c320fb
	stxa	%l0,[%i5+%g0]0x80	! Mem[0000000010141400] = 000000000000465e
!	%l1 = 00000000fe89de4a, Mem[0000000010141400] = 00000000
	stw	%l1,[%i5+%g0]		! Mem[0000000010141400] = fe89de4a
!	%l3 = 00000000ff001a90, Mem[0000000030141410] = ffffffff
	stha	%l3,[%i5+%o5]0x89	! Mem[0000000030141410] = ffff1a90
!	%l0 = 000000000000465e, Mem[0000000010141408] = c0e2991c6a7a0000
	stxa	%l0,[%i5+%o4]0x80	! Mem[0000000010141408] = 000000000000465e
!	Mem[0000000030181408] = ffa2cffc, %l7 = 00000000ffffffff
	swapa	[%i6+%o4]0x81,%l7	! %l7 = 00000000ffa2cffc
!	Mem[0000000010181420] = 09c05727, %l7 = ffa2cffc, %l5 = 6600ff41
	add	%i6,0x20,%g1
	casa	[%g1]0x80,%l7,%l5	! %l5 = 0000000009c05727
!	Mem[0000000010001420] = ffffffff, %l6 = 000000000000f7ff
	ldstuba	[%i0+0x020]%asi,%l6	! %l6 = 00000000000000ff
!	Mem[00000000201c0000] = 1a909298, %l3 = 00000000ff001a90
	ldstuba	[%o0+0x000]%asi,%l3	! %l3 = 000000000000001a
!	Mem[0000000010101410] = 5e46fa6d, %l6 = 00000000000000ff
	ldstuba	[%i4+%o5]0x80,%l6	! %l6 = 000000000000005e

p0_label_152:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = ffa2dbe7, %l2 = 000000000000ffff
	ldsba	[%i6+%o5]0x80,%l2	! %l2 = ffffffffffffffff
!	Mem[00000000300c1408] = e7dba2ff, %l1 = 00000000fe89de4a
	ldsha	[%i3+%o4]0x81,%l1	! %l1 = ffffffffffffe7db
!	Mem[0000000010101434] = 00000000, %l5 = 0000000009c05727
	ldsw	[%i4+0x034],%l5		! %l5 = 0000000000000000
!	Mem[00000000100c1408] = ffffffff, %l6 = 000000000000005e
	ldsha	[%i3+%o4]0x88,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010141406] = 0000465e, %l2 = ffffffffffffffff
	lduh	[%i5+0x006],%l2		! %l2 = 000000000000465e
!	%l2 = 000000000000465e, imm = fffffffffffff076, %l7 = 00000000ffa2cffc
	or	%l2,-0xf8a,%l7		! %l7 = fffffffffffff67e
!	Mem[0000000010101418] = 000000ff, %f5  = fc64f52c
	ld	[%i4+0x018],%f5 	! %f5 = 000000ff
!	%f12 = 7f001a90, %f8  = ff001a90
	fcmps	%fcc0,%f12,%f8 		! %fcc0 = 2
!	Mem[0000000030001410] = 2cf564fc, %l6 = ffffffffffffffff
	lduba	[%i0+%o5]0x89,%l6	! %l6 = 00000000000000fc
!	Code Fragment 3, seed = 92850
p0_fragment_12:
!	%l0 = 000000000000465e
	setx	0x3612071ab48f7496,%g7,%l0 ! %l0 = 3612071ab48f7496
!	%l1 = ffffffffffffe7db
	setx	0x475579a35c01bdc1,%g7,%l1 ! %l1 = 475579a35c01bdc1
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 3612071ab48f7496
	setx	0x701790760d795afc,%g7,%l0 ! %l0 = 701790760d795afc
!	%l1 = 475579a35c01bdc1
	setx	0xf82469c113934f47,%g7,%l1 ! %l1 = f82469c113934f47
p0_fragment_12_end:

p0_label_153:
!	Starting 10 instruction Store Burst
!	Mem[0000000030081408] = 01000079, %l7 = 00000000fffff67e
	swapa	[%i2+%o4]0x89,%l7	! %l7 = 0000000001000079
!	Mem[0000000010001408] = 00000000, %l7 = 0000000001000079
	swapa	[%i0+%o4]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000010041406] = 000000ff, %l0 = 701790760d795afc
	ldstub	[%i1+0x006],%l0		! %l0 = 0000000000000000
!	%l4 = 0000000022330000, Mem[0000000010181400] = 0000000000000000
	stxa	%l4,[%i6+%g0]0x80	! Mem[0000000010181400] = 0000000022330000
!	%f14 = 00000000 b08d183b, Mem[0000000010001410] = 0000ffff f76069e5
	stda	%f14,[%i0+%o5]0x80	! Mem[0000000010001410] = 00000000 b08d183b
!	%f4  = 000000ff 000000ff, %l3 = 000000000000001a
!	Mem[0000000010181420] = 09c0572766a24265
	add	%i6,0x020,%g1
	stda	%f4,[%g1+%l3]ASI_PST32_P ! Mem[0000000010181420] = 000000ff66a24265
!	Mem[000000001010140f] = 00000000, %l7 = 0000000000000000
	ldstub	[%i4+0x00f],%l7		! %l7 = 0000000000000000
!	%f22 = 00000000 00000000, %l4 = 0000000022330000
!	Mem[0000000030081418] = 0b9f95325efcd93b
	add	%i2,0x018,%g1
	stda	%f22,[%g1+%l4]ASI_PST16_S ! Mem[0000000030081418] = 0b9f95325efcd93b
!	%f6  = ff000066, Mem[0000000010081430] = 186fe1ec
	sta	%f6 ,[%i2+0x030]%asi	! Mem[0000000010081430] = ff000066
!	%l2 = 000000000000465e, Mem[0000000010041438] = 05417a6a796b91e3
	stx	%l2,[%i1+0x038]		! Mem[0000000010041438] = 000000000000465e

p0_label_154:
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = 2cf564fc, %l6 = 00000000000000fc
	lduwa	[%i0+%o5]0x89,%l6	! %l6 = 000000002cf564fc
!	Mem[0000000010041400] = ffff00006600ff41, %f30 = f33b663f 00007a6a
	ldda	[%i1+%g0]0x88,%f30	! %f30 = ffff0000 6600ff41
!	Mem[00000000211c0000] = ffff8f28, %l6 = 000000002cf564fc
	lduh	[%o2+%g0],%l6		! %l6 = 000000000000ffff
!	Mem[0000000020800040] = ffff3ef8, %l0 = 0000000000000000
	ldsb	[%o1+0x040],%l0		! %l0 = ffffffffffffffff
!	Mem[0000000010081410] = 476c3610, %f8  = ff001a90
	lda	[%i2+%o5]0x80,%f8 	! %f8 = 476c3610
!	Mem[0000000010181404] = 22330000, %l2 = 000000000000465e, %asi = 80
	lduwa	[%i6+0x004]%asi,%l2	! %l2 = 0000000022330000
!	Mem[0000000010141400] = fe89de4a, %f28 = 901a0000
	lda	[%i5+%g0]0x80,%f28	! %f28 = fe89de4a
!	Mem[0000000010181408] = 11e1621b, %l5 = 0000000000000000
	ldsha	[%i6+%o4]0x80,%l5	! %l5 = 00000000000011e1
!	Mem[0000000010001406] = b08d183b, %l5 = 00000000000011e1
	ldub	[%i0+0x006],%l5		! %l5 = 0000000000000018
	membar	#Sync			! Added by membar checker (33)
!	Mem[00000000100c1400] = fccf480b 00000000 ffffffff 00000000
!	Mem[00000000100c1410] = 00000000 00000000 09c05727 1248e92b
!	Mem[00000000100c1420] = 3b908db0 4cdb8901 00000000 0000009f
!	Mem[00000000100c1430] = 11d996ff 000000ff 00000000 00000000
	ldda	[%i3+%g0]ASI_BLK_P,%f16	! Block Load from 00000000100c1400

p0_label_155:
!	Starting 10 instruction Store Burst
!	%f5  = 000000ff, Mem[0000000030181410] = 403d3d37
	sta	%f5 ,[%i6+%o5]0x89	! Mem[0000000030181410] = 000000ff
!	Mem[0000000010101410] = ff46fa6d, %l5 = 0000000000000018
	ldstuba	[%i4+%o5]0x80,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030181400] = ffffffff, %l6 = 000000000000ffff
	swapa	[%i6+%g0]0x89,%l6	! %l6 = 00000000ffffffff
!	%l1 = f82469c113934f47, Mem[0000000021800101] = ff57e418
	stb	%l1,[%o3+0x101]		! Mem[0000000021800100] = ff47e418
!	%f18 = ffffffff 00000000, Mem[00000000300c1410] = 78110000 6542a266
	stda	%f18,[%i3+%o5]0x89	! Mem[00000000300c1410] = ffffffff 00000000
!	%l6 = 00000000ffffffff, Mem[00000000300c1408] = ffa2dbe7
	stwa	%l6,[%i3+%o4]0x89	! Mem[00000000300c1408] = ffffffff
!	Mem[0000000030101410] = 901a0000, %l6 = 00000000ffffffff
	ldstuba	[%i4+%o5]0x89,%l6	! %l6 = 0000000000000000
!	Mem[00000000100c1408] = ffffffff, %l7 = 0000000000000000
	swapa	[%i3+%o4]0x80,%l7	! %l7 = 00000000ffffffff
!	Mem[0000000010181400] = 00000000, %l1 = 0000000013934f47
	swapa	[%i6+%g0]0x80,%l1	! %l1 = 0000000000000000
!	%l0 = ffffffffffffffff, %l4 = 0000000022330000, %y  = fb200058
	umul	%l0,%l4,%l4		! %l4 = 2232ffffddcd0000, %y = 2232ffff

p0_label_156:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = 000000000b48cffc, %l7 = 00000000ffffffff
	ldxa	[%i3+%g0]0x88,%l7	! %l7 = 000000000b48cffc
!	Mem[0000000010181410] = 0000ff00e7dba2ff, %f12 = 7f001a90 476c3610
	ldda	[%i6+%o5]0x88,%f12	! %f12 = 0000ff00 e7dba2ff
!	Mem[0000000030101408] = 0000aab2, %l4 = 2232ffffddcd0000
	lduha	[%i4+%o4]0x81,%l4	! %l4 = 0000000000000000
!	Mem[00000000100c1408] = 00000000, %l1 = 0000000000000000
	lduha	[%i3+%o4]0x88,%l1	! %l1 = 0000000000000000
!	Mem[00000000100c1418] = 09c05727 1248e92b, %l0 = ffffffff, %l1 = 00000000
	ldd	[%i3+0x018],%l0		! %l0 = 0000000009c05727 000000001248e92b
!	Mem[0000000010181408] = 11e1621b, %l3 = 000000000000001a
	lduwa	[%i6+%o4]0x80,%l3	! %l3 = 0000000011e1621b
!	Mem[0000000020800000] = ffffeac8, %l4 = 0000000000000000, %asi = 80
	lduha	[%o1+0x000]%asi,%l4	! %l4 = 000000000000ffff
!	Mem[0000000010001436] = f94400ff, %l3 = 0000000011e1621b
	lduh	[%i0+0x036],%l3		! %l3 = 00000000000000ff
!	Mem[0000000010101400] = fb200000, %l5 = 00000000000000ff
	ldswa	[%i4+%g0]0x88,%l5	! %l5 = fffffffffb200000
!	Mem[00000000201c0000] = ff909298, %l7 = 000000000b48cffc, %asi = 80
	ldsha	[%o0+0x000]%asi,%l7	! %l7 = ffffffffffffff90

p0_label_157:
!	Starting 10 instruction Store Burst
!	Mem[0000000010101408] = 901a0000, %l2 = 0000000022330000
	swapa	[%i4+%o4]0x80,%l2	! %l2 = 00000000901a0000
!	%l0 = 0000000009c05727, Mem[0000000030001408] = ffffffff
	stba	%l0,[%i0+%o4]0x89	! Mem[0000000030001408] = ffffff27
!	Mem[0000000030041400] = ffff1a90, %l2 = 00000000901a0000
	ldstuba	[%i1+%g0]0x89,%l2	! %l2 = 0000000000000090
!	%l5 = fffffffffb200000, Mem[0000000010181400] = 13934f4722330000
	stxa	%l5,[%i6+%g0]0x80	! Mem[0000000010181400] = fffffffffb200000
!	Mem[0000000030101408] = b2aa0000, %l7 = ffffffffffffff90
	ldstuba	[%i4+%o4]0x89,%l7	! %l7 = 0000000000000000
!	%f30 = 00000000 00000000, Mem[0000000010041418] = 630075ff 371c9d8b
	std	%f30,[%i1+0x018]	! Mem[0000000010041418] = 00000000 00000000
!	Mem[0000000030081410] = 00007a6a, %l5 = 00000000fb200000
	swapa	[%i2+%o5]0x81,%l5	! %l5 = 0000000000007a6a
!	Mem[00000000218000c1] = ffffa7e8, %l6 = 0000000000000000
	ldstuba	[%o3+0x0c1]%asi,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030181400] = ffff0000 e1e70000 ffffffff 0000446a
!	%f16 = fccf480b 00000000 ffffffff 00000000
!	%f20 = 00000000 00000000 09c05727 1248e92b
!	%f24 = 3b908db0 4cdb8901 00000000 0000009f
!	%f28 = 11d996ff 000000ff 00000000 00000000
	stda	%f16,[%i6+%g0]ASI_BLK_SL	! Block Store to 0000000030181400
!	Mem[0000000010001410] = 00000000 b08d183b, %l6 = 000000ff, %l7 = 00000000
	ldda	[%i0+%o5]0x80,%l6	! %l6 = 0000000000000000 00000000b08d183b

p0_label_158:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = e8ffffff, %l1 = 000000001248e92b
	lduba	[%i1+%o5]0x80,%l1	! %l1 = 00000000000000e8
!	Mem[0000000010041400] = 41ff0066, %l4 = 000000000000ffff
	ldsha	[%i1+%g0]0x80,%l4	! %l4 = 00000000000041ff
!	Mem[0000000010081428] = fb20c306, %l1 = 00000000000000e8, %asi = 80
	ldswa	[%i2+0x028]%asi,%l1	! %l1 = fffffffffb20c306
!	Mem[00000000211c0000] = ffff8f28, %l1 = fffffffffb20c306
	ldsb	[%o2+%g0],%l1		! %l1 = ffffffffffffffff
!	Mem[0000000030081408] = 7ef6ffff4c0e4e1f, %l2 = 0000000000000090
	ldxa	[%i2+%o4]0x81,%l2	! %l2 = 7ef6ffff4c0e4e1f
!	Mem[0000000010041410] = e8ffffff, %l4 = 00000000000041ff
	lduba	[%i1+%o5]0x80,%l4	! %l4 = 00000000000000e8
!	Mem[00000000300c1408] = ffffffff, %l3 = 00000000000000ff
	ldsba	[%i3+%o4]0x89,%l3	! %l3 = ffffffffffffffff
!	%l2 = 7ef6ffff4c0e4e1f, %l2 = 7ef6ffff4c0e4e1f, %l1 = ffffffffffffffff
	subc	%l2,%l2,%l1		! %l1 = 0000000000000000
!	Mem[00000000300c1400] = 00000000, %f7  = ffffffe8
	lda	[%i3+%g0]0x81,%f7 	! %f7 = 00000000
!	Mem[0000000010141410] = 0b48cffc3175ceff, %f4  = 000000ff 000000ff
	ldda	[%i5+%o5]0x88,%f4 	! %f4  = 0b48cffc 3175ceff

p0_label_159:
!	Starting 10 instruction Store Burst
!	%f10 = 5b51d500, Mem[0000000010141410] = 3175ceff
	sta	%f10,[%i5+%o5]0x88	! Mem[0000000010141410] = 5b51d500
!	%l5 = 0000000000007a6a, %l5 = 0000000000007a6a, %l5 = 0000000000007a6a
	xnor	%l5,%l5,%l5		! %l5 = ffffffffffffffff
	membar	#Sync			! Added by membar checker (34)
!	%f24 = 3b908db0 4cdb8901, Mem[00000000100c1410] = 00000000 00000000
	stda	%f24,[%i3+%o5]0x80	! Mem[00000000100c1410] = 3b908db0 4cdb8901
!	%f4  = 0b48cffc 3175ceff, Mem[0000000030041400] = ffff1aff 00000000
	stda	%f4 ,[%i1+%g0]0x89	! Mem[0000000030041400] = 0b48cffc 3175ceff
!	%f16 = fccf480b 00000000, %l3 = ffffffffffffffff
!	Mem[0000000010101438] = 663eaab22b7428bb
	add	%i4,0x038,%g1
	stda	%f16,[%g1+%l3]ASI_PST8_PL ! Mem[0000000010101438] = 000000000b48cffc
!	Mem[0000000030101410] = 901a00ff, %l0 = 0000000009c05727
	ldstuba	[%i4+%o5]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010181410] = e7dba2ff, %l0 = 00000000000000ff
	ldstuba	[%i6+%o5]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030041400] = 3175ceff, %l0 = 00000000000000ff
	swapa	[%i1+%g0]0x89,%l0	! %l0 = 000000003175ceff
!	%f18 = ffffffff, Mem[0000000030101400] = ffffffff
	sta	%f18,[%i4+%g0]0x81	! Mem[0000000030101400] = ffffffff
!	%f4  = 0b48cffc 3175ceff, Mem[0000000010041410] = ffffffe8 ff000066
	stda	%f4 ,[%i1+%o5]0x88	! Mem[0000000010041410] = 0b48cffc 3175ceff

p0_label_160:
!	Starting 10 instruction Load Burst
!	%l6 = 0000000000000000, immd = 000003e5, %y  = 2232ffff
	smul	%l6,0x3e5,%l5		! %l5 = 0000000000000000, %y = 00000000
!	Mem[0000000030081408] = 7ef6ffff4c0e4e1f, %f20 = 00000000 00000000
	ldda	[%i2+%o4]0x81,%f20	! %f20 = 7ef6ffff 4c0e4e1f
!	Mem[0000000030081410] = 000020fb, %l6 = 0000000000000000
	ldsba	[%i2+%o5]0x89,%l6	! %l6 = fffffffffffffffb
!	Mem[0000000010001410] = 00000000, %l6 = fffffffffffffffb
	ldsba	[%i0+%o5]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000030081400] = ff8d183b 000000ff 7ef6ffff 4c0e4e1f
!	Mem[0000000030081410] = fb200000 ffffffa9 0b9f9532 5efcd93b
!	Mem[0000000030081420] = 0541738a 00c0f50f 1ef470be 78059f17
!	Mem[0000000030081430] = 276dc86c 6eb5f34d 0335b20a 522e9bb3
	ldda	[%i2+%g0]ASI_BLK_SL,%f0 	! Block Load from 0000000030081400
!	Mem[00000000300c1400] = 000000000000009f, %f30 = 00000000 00000000
	ldda	[%i3+%g0]0x81,%f30	! %f30 = 00000000 0000009f
!	%f15 = 0ab23503, %f4  = a9ffffff, %f29 = 000000ff
	fmuls	%f15,%f4 ,%f29		! tt=0x22, %l0 = 000000003175cf21
!	Mem[0000000030001400] = 5e46fa6d40c4cc67, %f22 = 09c05727 1248e92b
	ldda	[%i0+%g0]0x81,%f22	! %f22 = 5e46fa6d 40c4cc67
!	Mem[0000000010141408] = 00000000, %l0 = 000000003175cf21
	ldsba	[%i5+%o4]0x88,%l0	! %l0 = 0000000000000000
!	Mem[00000000211c0000] = ffff8f28, %l3 = ffffffffffffffff
	ldub	[%o2+%g0],%l3		! %l3 = 00000000000000ff

p0_label_161:
!	Starting 10 instruction Store Burst
!	Mem[0000000021800181] = 75315078, %l7 = 00000000b08d183b
	ldstub	[%o3+0x181],%l7		! %l7 = 0000000000000031
!	%l1 = 0000000000000000, %l5 = 0000000000000000, %l7 = 0000000000000031
	subc	%l1,%l5,%l7		! %l7 = 0000000000000000
!	%l6 = 0000000000000000, Mem[0000000021800180] = 75ff5078
	stb	%l6,[%o3+0x180]		! Mem[0000000021800180] = 00ff5078
!	Mem[0000000030181408] = 00000000, %l1 = 0000000000000000
	ldstuba	[%i6+%o4]0x81,%l1	! %l1 = 0000000000000000
!	Mem[000000001018142b] = 00000032, %l1 = 0000000000000000
	ldstuba	[%i6+0x02b]%asi,%l1	! %l1 = 0000000000000032
!	%l1 = 0000000000000032, imm = 00000000000003c9, %l0 = 0000000000000000
	sub	%l1,0x3c9,%l0		! %l0 = fffffffffffffc69
!	Mem[0000000030181408] = 000000ff, %l2 = 7ef6ffff4c0e4e1f
	ldstuba	[%i6+%o4]0x89,%l2	! %l2 = 00000000000000ff
!	%l0 = fffffffffffffc69, Mem[0000000010141437] = ffffffe8
	stb	%l0,[%i5+0x037]		! Mem[0000000010141434] = ffffff69
!	%l4 = 00000000000000e8, %l3 = 00000000000000ff, %l1  = 0000000000000032
	mulx	%l4,%l3,%l1		! %l1 = 000000000000e718
!	Mem[0000000010041400] = 41ff0066, %l4 = 00000000000000e8
	ldstuba	[%i1+%g0]0x80,%l4	! %l4 = 0000000000000041

p0_label_162:
!	Starting 10 instruction Load Burst
!	Mem[00000000218001c0] = 11ff80a8, %l1 = 000000000000e718, %asi = 80
	lduba	[%o3+0x1c0]%asi,%l1	! %l1 = 0000000000000011
!	Mem[0000000030181408] = ff000000, %f31 = 0000009f
	lda	[%i6+%o4]0x81,%f31	! %f31 = ff000000
!	Mem[00000000218000c0] = ffffa7e8, %l3 = 00000000000000ff, %asi = 80
	lduha	[%o3+0x0c0]%asi,%l3	! %l3 = 000000000000ffff
!	Mem[0000000030141410] = 901affff, %l4 = 0000000000000041
	lduwa	[%i5+%o5]0x81,%l4	! %l4 = 00000000901affff
!	Mem[00000000100c1408] = 00000000, %l4 = 00000000901affff
	ldsha	[%i3+%o4]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000010081410] = 476c3610 00000000, %l4 = 00000000, %l5 = 00000000
	ldda	[%i2+%o5]0x80,%l4	! %l4 = 00000000476c3610 0000000000000000
!	Mem[0000000010101406] = ff8d183b, %l2 = 00000000000000ff, %asi = 80
	ldsha	[%i4+0x006]%asi,%l2	! %l2 = 000000000000183b
!	Mem[0000000010181408] = 11e1621b, %l3 = 000000000000ffff
	ldsh	[%i6+%o4],%l3		! %l3 = 00000000000011e1
!	Mem[0000000030041410] = 00000000, %l2 = 000000000000183b
	ldsha	[%i1+%o5]0x89,%l2	! %l2 = 0000000000000000
!	Mem[00000000201c0000] = ff909298, %l0 = fffffffffffffc69
	ldub	[%o0+%g0],%l0		! %l0 = 00000000000000ff

p0_label_163:
!	Starting 10 instruction Store Burst
!	%l3 = 00000000000011e1, Mem[0000000010081400] = fc64f52cffffff41
	stxa	%l3,[%i2+%g0]0x80	! Mem[0000000010081400] = 00000000000011e1
!	%l1 = 0000000000000011, Mem[0000000030101400] = ffffffff
	stwa	%l1,[%i4+%g0]0x89	! Mem[0000000030101400] = 00000011
!	%f24 = 3b908db0 4cdb8901, %l7 = 0000000000000000
!	Mem[0000000010101408] = 22330000000000ff
	add	%i4,0x008,%g1
	stda	%f24,[%g1+%l7]ASI_PST32_PL ! Mem[0000000010101408] = 22330000000000ff
!	Mem[0000000010141408] = 00000000, %l3 = 00000000000011e1
	ldstuba	[%i5+%o4]0x80,%l3	! %l3 = 0000000000000000
!	Mem[00000000300c1400] = 00000000, %l0 = 00000000000000ff
	ldstuba	[%i3+%g0]0x81,%l0	! %l0 = 0000000000000000
!	%l0 = 0000000000000000, Mem[00000000100c1410] = 0189db4cb08d903b
	stxa	%l0,[%i3+%o5]0x88	! Mem[00000000100c1410] = 0000000000000000
!	Mem[0000000030001400] = 6dfa465e, %l1 = 0000000000000011
	ldstuba	[%i0+%g0]0x89,%l1	! %l1 = 000000000000005e
!	%l6 = 00000000, %l7 = 00000000, Mem[0000000010181410] = ffa2dbe7 00ff0000
	stda	%l6,[%i6+%o5]0x80	! Mem[0000000010181410] = 00000000 00000000
!	%l0 = 00000000, %l1 = 0000005e, Mem[0000000010001410] = 00000000 b08d183b
	stda	%l0,[%i0+%o5]0x80	! Mem[0000000010001410] = 00000000 0000005e
!	Mem[0000000030181410] = 00000000, %l2 = 0000000000000000
	ldstuba	[%i6+%o5]0x81,%l2	! %l2 = 0000000000000000

p0_label_164:
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = 11000000, %f22 = 5e46fa6d
	lda	[%i4+%g0]0x81,%f22	! %f22 = 11000000
!	%f30 = 00000000, %f10 = 179f0578, %f9  = 8a734105
	fmuls	%f30,%f10,%f9 		! %f9  = 00000000
!	Mem[00000000100c141c] = 1248e92b, %l5 = 0000000000000000, %asi = 80
	lduwa	[%i3+0x01c]%asi,%l5	! %l5 = 000000001248e92b
!	Mem[0000000030101400] = 11000000, %l7 = 0000000000000000
	lduwa	[%i4+%g0]0x81,%l7	! %l7 = 0000000011000000
!	Mem[0000000010001437] = f94400ff, %l3 = 0000000000000000
	ldsb	[%i0+0x037],%l3		! %l3 = ffffffffffffffff
!	Mem[0000000010181410] = 00000000, %l7 = 0000000011000000
	lduha	[%i6+%o5]0x88,%l7	! %l7 = 0000000000000000
!	%l7 = 0000000000000000, immd = fffffd4b, %y  = 00000000
	umul	%l7,-0x2b5,%l3		! %l3 = 0000000000000000, %y = 00000000
!	Mem[0000000030181400] = fccf480b00000000, %f6  = 3bd9fc5e 32959f0b
	ldda	[%i6+%g0]0x89,%f6 	! %f6  = fccf480b 00000000
!	Mem[0000000010141410] = 5b51d500, %l7 = 0000000000000000
	lduba	[%i5+%o5]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000030101400] = 00000011, %l7 = 0000000000000000
	lduha	[%i4+%g0]0x89,%l7	! %l7 = 0000000000000011

p0_label_165:
!	Starting 10 instruction Store Burst
!	%l0 = 0000000000000000, Mem[0000000010141408] = 000000ff
	stha	%l0,[%i5+%o4]0x88	! Mem[0000000010141408] = 00000000
!	%l0 = 0000000000000000, Mem[0000000010181410] = 0000000000000000
	stxa	%l0,[%i6+%o5]0x80	! Mem[0000000010181410] = 0000000000000000
!	%l4 = 476c3610, %l5 = 1248e92b, Mem[0000000030101400] = 11000000 e1e70000
	stda	%l4,[%i4+%g0]0x81	! Mem[0000000030101400] = 476c3610 1248e92b
!	%l0 = 00000000, %l1 = 0000005e, Mem[0000000010101400] = fb200000 3b188dff
	stda	%l0,[%i4+%g0]0x88	! Mem[0000000010101400] = 00000000 0000005e
!	%l7 = 0000000000000011, Mem[0000000010141400] = 5e4600004ade89fe
	stxa	%l7,[%i5+%g0]0x88	! Mem[0000000010141400] = 0000000000000011
!	Mem[0000000010081408] = 1a90ffff, %l7 = 0000000000000011
	swapa	[%i2+%o4]0x88,%l7	! %l7 = 000000001a90ffff
!	%l5 = 000000001248e92b, Mem[0000000010041410] = 3175ceff
	stwa	%l5,[%i1+%o5]0x88	! Mem[0000000010041410] = 1248e92b
!	Mem[0000000030101408] = b2aa00ff, %l0 = 0000000000000000
	ldstuba	[%i4+%o4]0x89,%l0	! %l0 = 00000000000000ff
	membar	#Sync			! Added by membar checker (35)
!	%l0 = 00000000000000ff, Mem[0000000030081410] = a9ffffff000020fb
	stxa	%l0,[%i2+%o5]0x89	! Mem[0000000030081410] = 00000000000000ff
!	Mem[0000000010001410] = 00000000, %l6 = 0000000000000000
	ldstuba	[%i0+%o5]0x80,%l6	! %l6 = 0000000000000000

p0_label_166:
!	Starting 10 instruction Load Burst
!	Mem[000000001000141a] = 630075ff, %l2 = 0000000000000000
	lduh	[%i0+0x01a],%l2		! %l2 = 00000000000075ff
!	Mem[0000000030081400] = 3b188dff, %l3 = 0000000000000000
	ldsha	[%i2+%g0]0x89,%l3	! %l3 = ffffffffffff8dff
!	Mem[0000000010081408] = 11000000, %l4 = 00000000476c3610
	lduba	[%i2+%o4]0x80,%l4	! %l4 = 0000000000000011
!	Mem[0000000010141438] = fffffff2, %l3 = ffffffffffff8dff
	ldsw	[%i5+0x038],%l3		! %l3 = fffffffffffffff2
!	Mem[00000000100c1428] = 000000000000009f, %f26 = 00000000 0000009f
	ldd	[%i3+0x028],%f26	! %f26 = 00000000 0000009f
!	Mem[0000000010101400] = 00000000, %l7 = 000000001a90ffff
	ldsh	[%i4+%g0],%l7		! %l7 = 0000000000000000
!	Mem[0000000030181400] = fccf480b00000000, %l2 = 00000000000075ff
	ldxa	[%i6+%g0]0x89,%l2	! %l2 = fccf480b00000000
!	Mem[0000000010181408] = 1b62e111, %f4  = a9ffffff
	lda	[%i6+%o4]0x88,%f4 	! %f4 = 1b62e111
!	Mem[0000000030041408] = 00000000, %f17 = 00000000
	lda	[%i1+%o4]0x89,%f17	! %f17 = 00000000
!	Mem[0000000010101400] = 00000000, %f11 = be70f41e
	lda	[%i4+0x000]%asi,%f11	! %f11 = 00000000

p0_label_167:
!	Starting 10 instruction Store Burst
!	%f28 = 11d996ff 000000ff, %l5 = 000000001248e92b
!	Mem[0000000030041418] = 09e5e7d26d65bd5b
	add	%i1,0x018,%g1
	stda	%f28,[%g1+%l5]ASI_PST32_S ! Mem[0000000030041418] = 11d996ff000000ff
!	%l0 = 00000000000000ff, Mem[0000000010001410] = 000000ff
	stba	%l0,[%i0+%o5]0x88	! Mem[0000000010001410] = 000000ff
!	%f8  = 0ff5c000, Mem[0000000010001408] = 79000001
	sta	%f8 ,[%i0+%o4]0x80	! Mem[0000000010001408] = 0ff5c000
!	%l2 = fccf480b00000000, Mem[0000000030081410] = 000000ff
	stha	%l2,[%i2+%o5]0x89	! Mem[0000000030081410] = 00000000
!	%f8  = 0ff5c000 00000000, Mem[0000000010181428] = 000000ff 0000183b, %asi = 80
	stda	%f8 ,[%i6+0x028]%asi	! Mem[0000000010181428] = 0ff5c000 00000000
!	%l2 = 00000000, %l3 = fffffff2, Mem[0000000010041438] = 00000000 0000465e
	std	%l2,[%i1+0x038]		! Mem[0000000010041438] = 00000000 fffffff2
!	%l3 = fffffffffffffff2, Mem[0000000021800140] = 690f1c48, %asi = 80
	stba	%l3,[%o3+0x140]%asi	! Mem[0000000021800140] = f20f1c48
!	Mem[0000000010141400] = 00000011, %l1 = 000000000000005e
	ldstuba	[%i5+%g0]0x88,%l1	! %l1 = 0000000000000011
!	Mem[0000000010101408] = 22330000, %l2 = 0000000000000000
	swapa	[%i4+%o4]0x80,%l2	! %l2 = 0000000022330000
!	Mem[0000000010081400] = 00000000000011e1, %l6 = 0000000000000000, %l3 = fffffffffffffff2
	casxa	[%i2]0x80,%l6,%l3	! %l3 = 00000000000011e1

p0_label_168:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = ff000000, %l6 = 0000000000000000
	ldsba	[%i5+%g0]0x80,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010081408] = 11000000b08d183b, %f14 = b39b2e52 0ab23503, %asi = 80
	ldda	[%i2+0x008]%asi,%f14	! %f14 = 11000000 b08d183b
!	Mem[0000000010081408] = 11000000 b08d183b, %l0 = 000000ff, %l1 = 00000011
	ldd	[%i2+%o4],%l0		! %l0 = 0000000011000000 00000000b08d183b
!	Mem[00000000211c0000] = ffff8f28, %l7 = 0000000000000000, %asi = 80
	ldsha	[%o2+0x000]%asi,%l7	! %l7 = ffffffffffffffff
!	%l2 = 0000000022330000, imm = 000000000000036b, %l5 = 000000001248e92b
	or	%l2,0x36b,%l5		! %l5 = 000000002233036b
!	Mem[0000000010141420] = fccf480b 0000446a, %l2 = 22330000, %l3 = 000011e1
	ldd	[%i5+0x020],%l2		! %l2 = 00000000fccf480b 000000000000446a
!	Mem[0000000010101400] = 00000000, %l1 = 00000000b08d183b
	lduba	[%i4+%g0]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000010101400] = 00000000, %f6  = fccf480b
	lda	[%i4+%g0]0x80,%f6 	! %f6 = 00000000
!	Mem[0000000010181400] = 000020fbffffffff, %l5 = 000000002233036b
	ldxa	[%i6+%g0]0x88,%l5	! %l5 = 000020fbffffffff
!	%l1 = 0000000000000000, imm = fffffffffffffd95, %l6 = ffffffffffffffff
	addc	%l1,-0x26b,%l6		! %l6 = fffffffffffffd95

p0_label_169:
!	Starting 10 instruction Store Burst
!	Mem[0000000030081400] = ff8d183b, %l1 = 0000000000000000
	swapa	[%i2+%g0]0x81,%l1	! %l1 = 00000000ff8d183b
!	Mem[0000000030001400] = ff46fa6d 40c4cc67 27ffffff 0000e7e1
!	%f16 = fccf480b 00000000 ffffffff 00000000
!	%f20 = 7ef6ffff 4c0e4e1f 11000000 40c4cc67
!	%f24 = 3b908db0 4cdb8901 00000000 0000009f
!	%f28 = 11d996ff 000000ff 00000000 ff000000
	stda	%f16,[%i0+%g0]ASI_BLK_SL	! Block Store to 0000000030001400
!	%l6 = fffffffffffffd95, Mem[00000000201c0001] = ff909298, %asi = 80
	stba	%l6,[%o0+0x001]%asi	! Mem[00000000201c0000] = ff959298
!	%l0 = 0000000011000000, Mem[0000000030041410] = 00000000
	stwa	%l0,[%i1+%o5]0x89	! Mem[0000000030041410] = 11000000
!	%l4 = 0000000000000011, Mem[0000000010041400] = ffff0066
	stba	%l4,[%i1+%g0]0x80	! Mem[0000000010041400] = 11ff0066
!	%f28 = 11d996ff 000000ff, %l0 = 0000000011000000
!	Mem[0000000010181428] = 0ff5c00000000000
	add	%i6,0x028,%g1
	stda	%f28,[%g1+%l0]ASI_PST8_P ! Mem[0000000010181428] = 0ff5c00000000000
!	%f26 = 00000000 0000009f, Mem[0000000010101418] = 000000ff a1a30d0b
	std	%f26,[%i4+0x018]	! Mem[0000000010101418] = 00000000 0000009f
!	%l2 = fccf480b, %l3 = 0000446a, Mem[0000000010101428] = 1178a3ce 59c5dbe7, %asi = 80
	stda	%l2,[%i4+0x028]%asi	! Mem[0000000010101428] = fccf480b 0000446a
!	%f4  = 1b62e111 000020fb, %l2 = 00000000fccf480b
!	Mem[0000000030141438] = 6a7a410511d9008d
	add	%i5,0x038,%g1
	stda	%f4,[%g1+%l2]ASI_PST32_S ! Mem[0000000030141438] = 1b62e111000020fb
!	%l4 = 0000000000000011, Mem[0000000010141408] = 5e46000000000000
	stxa	%l4,[%i5+%o4]0x88	! Mem[0000000010141408] = 0000000000000011

p0_label_170:
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = 7ef6ffff4c0e4e1f, %l2 = 00000000fccf480b
	ldxa	[%i2+%o4]0x81,%l2	! %l2 = 7ef6ffff4c0e4e1f
	membar	#Sync			! Added by membar checker (36)
!	Mem[0000000030001400] = fccf480b00000000, %f0  = ff000000 3b188dff
	ldda	[%i0+%g0]0x89,%f0 	! %f0  = fccf480b 00000000
!	Mem[0000000010001400] = 00000000b08d183b, %l5 = 000020fbffffffff
	ldxa	[%i0+%g0]0x80,%l5	! %l5 = 00000000b08d183b
!	Mem[0000000010001410] = 000000ff, %l0 = 0000000011000000
	ldswa	[%i0+%o5]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[00000000100c1408] = 00000000 00000000, %l6 = fffffd95, %l7 = ffffffff
	ldda	[%i3+%o4]0x88,%l6	! %l6 = 0000000000000000 0000000000000000
!	Mem[0000000010141408] = 11000000, %l3 = 000000000000446a
	ldswa	[%i5+%o4]0x80,%l3	! %l3 = 0000000011000000
!	Mem[0000000030041408] = 00000000, %l3 = 0000000011000000
	ldswa	[%i1+%o4]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000010001410] = ff0000000000005e, %f28 = 11d996ff 000000ff
	ldda	[%i0+%o5]0x80,%f28	! %f28 = ff000000 0000005e
!	%f4  = 1b62e111 000020fb, %f18 = ffffffff 00000000
	fxtod	%f4 ,%f18		! %f18 = 43bb62e1 11000021
!	Mem[0000000030181400] = 00000000, %l0 = 00000000000000ff
	lduba	[%i6+%g0]0x81,%l0	! %l0 = 0000000000000000

p0_label_171:
!	Starting 10 instruction Store Burst
!	%l1 = 00000000ff8d183b, Mem[0000000030101410] = 00000000901a00ff
	stxa	%l1,[%i4+%o5]0x89	! Mem[0000000030101410] = 00000000ff8d183b
!	%f1  = 00000000, Mem[0000000030181410] = 000000ff
	sta	%f1 ,[%i6+%o5]0x89	! Mem[0000000030181410] = 00000000
!	%l6 = 0000000000000000, Mem[0000000010001410] = ff000000
	stwa	%l6,[%i0+%o5]0x80	! Mem[0000000010001410] = 00000000
!	%f4  = 1b62e111, %f15 = b08d183b, %f15 = b08d183b
	fmuls	%f4 ,%f15,%f15		! %f15 = 8c7a16e0
!	Mem[0000000030041408] = 00000000, %l4 = 0000000000000011
	ldstuba	[%i1+%o4]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000010001408] = 0ff5c000, %l5 = b08d183b, %l6 = 00000000
	add	%i0,0x08,%g1
	casa	[%g1]0x80,%l5,%l6	! %l6 = 000000000ff5c000
!	Code Fragment 3, seed = 198814
p0_fragment_13:
!	%l0 = 0000000000000000
	setx	0x46b9a6b788a03136,%g7,%l0 ! %l0 = 46b9a6b788a03136
!	%l1 = 00000000ff8d183b
	setx	0x4798e645cf6a5861,%g7,%l1 ! %l1 = 4798e645cf6a5861
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 46b9a6b788a03136
	setx	0x52f5e320c48b739c,%g7,%l0 ! %l0 = 52f5e320c48b739c
!	%l1 = 4798e645cf6a5861
	setx	0x81279c091a6e85e7,%g7,%l1 ! %l1 = 81279c091a6e85e7
p0_fragment_13_end:
!	Mem[0000000010001408] = 0ff5c00000ff446a, %l2 = 7ef6ffff4c0e4e1f, %l5 = 00000000b08d183b
	add	%i0,0x08,%g1
	casxa	[%g1]0x80,%l2,%l5	! %l5 = 0ff5c00000ff446a
!	%l2 = 7ef6ffff4c0e4e1f, Mem[0000000010101410] = 6dfa46ff
	stba	%l2,[%i4+%o5]0x88	! Mem[0000000010101410] = 6dfa461f
!	Mem[0000000010181408] = 1b62e111, %l4 = 0000000000000000
	swapa	[%i6+%o4]0x88,%l4	! %l4 = 000000001b62e111

p0_label_172:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001438] = 47baaeec 000000ff, %l0 = c48b739c, %l1 = 1a6e85e7, %asi = 80
	ldda	[%i0+0x038]%asi,%l0	! %l0 = 0000000047baaeec 00000000000000ff
!	Mem[0000000010101428] = fccf480b, %l6 = 000000000ff5c000, %asi = 80
	ldswa	[%i4+0x028]%asi,%l6	! %l6 = fffffffffccf480b
!	Mem[00000000100c1408] = 00000000, %l3 = 0000000000000000
	ldsba	[%i3+%o4]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000010141428] = 3fb4e72e5e3f75c7, %f14 = 11000000 8c7a16e0, %asi = 80
	ldda	[%i5+0x028]%asi,%f14	! %f14 = 3fb4e72e 5e3f75c7
!	Mem[0000000010181408] = 00000000, %l5 = 0ff5c00000ff446a
	lduwa	[%i6+%o4]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000030081400] = 00000000 000000ff 7ef6ffff 4c0e4e1f
!	Mem[0000000030081410] = 00000000 00000000 0b9f9532 5efcd93b
!	Mem[0000000030081420] = 0541738a 00c0f50f 1ef470be 78059f17
!	Mem[0000000030081430] = 276dc86c 6eb5f34d 0335b20a 522e9bb3
	ldda	[%i2+%g0]ASI_BLK_S,%f16	! Block Load from 0000000030081400
!	Mem[00000000300c1400] = 000000ff, %l3 = 0000000000000000
	ldsba	[%i3+%g0]0x89,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010041408] = 000000ff, %l5 = 0000000000000000
	ldsba	[%i1+%o4]0x88,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000010141400] = 000000ff, %l5 = ffffffffffffffff
	ldsba	[%i5+%g0]0x88,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000030141410] = 901affff6853b85b, %l1 = 00000000000000ff
	ldxa	[%i5+%o5]0x81,%l1	! %l1 = 901affff6853b85b

p0_label_173:
!	Starting 10 instruction Store Burst
!	Mem[0000000030001410] = 4c0e4e1f, %l0 = 0000000047baaeec
	ldstuba	[%i0+%o5]0x89,%l0	! %l0 = 000000000000001f
!	%l6 = fccf480b, %l7 = 00000000, Mem[0000000010141400] = ff000000 00000000
	stda	%l6,[%i5+%g0]0x80	! Mem[0000000010141400] = fccf480b 00000000
!	%l6 = fffffffffccf480b, Mem[00000000100c1408] = 00000000
	stha	%l6,[%i3+%o4]0x88	! Mem[00000000100c1408] = 0000480b
!	%f13 = 6cc86d27, Mem[0000000030001408] = 00000000
	sta	%f13,[%i0+%o4]0x89	! Mem[0000000030001408] = 6cc86d27
!	%l4 = 000000001b62e111, Mem[0000000010141410] = 00d5515b
	stwa	%l4,[%i5+%o5]0x80	! Mem[0000000010141410] = 1b62e111
	membar	#Sync			! Added by membar checker (37)
!	%l6 = fffffffffccf480b, Mem[0000000030081410] = 00000000
	stha	%l6,[%i2+%o5]0x81	! Mem[0000000030081410] = 480b0000
!	%f10 = 179f0578 00000000, Mem[00000000100c1410] = 00000000 00000000
	stda	%f10,[%i3+%o5]0x80	! Mem[00000000100c1410] = 179f0578 00000000
!	%f0  = fccf480b 00000000, %l0 = 000000000000001f
!	Mem[0000000010141430] = ff000000ffffff69
	add	%i5,0x030,%g1
	stda	%f0,[%g1+%l0]ASI_PST16_P ! Mem[0000000010141430] = fccf480b00000000
!	%l4 = 000000001b62e111, Mem[0000000010101404] = 5e000000, %asi = 80
	stwa	%l4,[%i4+0x004]%asi	! Mem[0000000010101404] = 1b62e111
!	Mem[00000000201c0000] = ff959298, %l5 = ffffffffffffffff
	ldstub	[%o0+%g0],%l5		! %l5 = 00000000000000ff

p0_label_174:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = 5b51d50000000000, %f8  = 0ff5c000 00000000
	ldda	[%i6+%o4]0x88,%f8 	! %f8  = 5b51d500 00000000
!	Mem[0000000030041408] = ff000000, %l5 = 00000000000000ff
	ldsba	[%i1+%o4]0x81,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000030181410] = 0000000000000000, %l2 = 7ef6ffff4c0e4e1f
	ldxa	[%i6+%o5]0x81,%l2	! %l2 = 0000000000000000
!	Mem[00000000300c1408] = ffffffff, %f7  = 00000000
	lda	[%i3+%o4]0x89,%f7 	! %f7 = ffffffff
!	Mem[0000000030041400] = ff000000, %l4 = 000000001b62e111
	ldsba	[%i1+%g0]0x81,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010141410] = 1b62e111, %l4 = ffffffffffffffff
	ldswa	[%i5+%o5]0x80,%l4	! %l4 = 000000001b62e111
!	Mem[0000000010041420] = 22330000, %l6 = fffffffffccf480b
	ldub	[%i1+0x020],%l6		! %l6 = 0000000000000022
!	Mem[0000000030041400] = ff000000, %l2 = 0000000000000000
	lduha	[%i1+%g0]0x81,%l2	! %l2 = 000000000000ff00
!	Mem[0000000010181400] = ffffffff, %l2 = 000000000000ff00
	lduha	[%i6+%g0]0x88,%l2	! %l2 = 000000000000ffff
!	%l5 = ffffffffffffffff, %l2 = 000000000000ffff, %l3 = ffffffffffffffff
	sub	%l5,%l2,%l3		! %l3 = ffffffffffff0000

p0_label_175:
!	Starting 10 instruction Store Burst
!	Mem[0000000030081400] = 00000000, %l0 = 000000000000001f
	swapa	[%i2+%g0]0x89,%l0	! %l0 = 0000000000000000
!	%l1 = 901affff6853b85b, Mem[00000000300c1400] = 000000ff
	stba	%l1,[%i3+%g0]0x89	! Mem[00000000300c1400] = 0000005b
!	%l7 = 0000000000000000, Mem[0000000030141410] = ffff1a90
	stwa	%l7,[%i5+%o5]0x89	! Mem[0000000030141410] = 00000000
!	%f13 = 6cc86d27, Mem[0000000010101400] = 00000000
	sta	%f13,[%i4+%g0]0x88	! Mem[0000000010101400] = 6cc86d27
!	%l6 = 00000022, %l7 = 00000000, Mem[0000000030001408] = 6cc86d27 ffffffff
	stda	%l6,[%i0+%o4]0x89	! Mem[0000000030001408] = 00000022 00000000
!	Mem[00000000201c0001] = ff959298, %l1 = 901affff6853b85b
	ldstuba	[%o0+0x001]%asi,%l1	! %l1 = 0000000000000095
!	%f7  = ffffffff, Mem[0000000010101400] = 276dc86c
	sta	%f7 ,[%i4+%g0]0x80	! Mem[0000000010101400] = ffffffff
!	%f19 = 4c0e4e1f, %f28 = 276dc86c, %f24 = 0541738a
	fadds	%f19,%f28,%f24		! %f24 = 4c0e4e1f
!	%f8  = 5b51d500 00000000, %l7 = 0000000000000000
!	Mem[0000000010101418] = 000000000000009f
	add	%i4,0x018,%g1
	stda	%f8,[%g1+%l7]ASI_PST32_P ! Mem[0000000010101418] = 000000000000009f
!	%l4 = 000000001b62e111, Mem[0000000020800040] = ffff3ef8
	stb	%l4,[%o1+0x040]		! Mem[0000000020800040] = 11ff3ef8

p0_label_176:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = ffffffff, %l4 = 000000001b62e111
	ldsha	[%i4+%g0]0x80,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010041400] = 11ff0066, %l1 = 0000000000000095
	ldswa	[%i1+%g0]0x80,%l1	! %l1 = 0000000011ff0066
!	Mem[0000000010141410] = 1b62e111, %f10 = 179f0578
	lda	[%i5+%o5]0x80,%f10	! %f10 = 1b62e111
!	Mem[00000000300c1408] = ffffffff, %l6 = 0000000000000022
	ldswa	[%i3+%o4]0x81,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010181408] = 00000000, %l7 = 0000000000000000
	lduba	[%i6+%o4]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000010181410] = 00000000, %l5 = ffffffffffffffff
	ldswa	[%i6+%o5]0x88,%l5	! %l5 = 0000000000000000
!	%l5 = 0000000000000000, imm = 000000000000047c, %l0 = 0000000000000000
	or	%l5,0x47c,%l0		! %l0 = 000000000000047c
!	Mem[0000000010101410] = 1f46fa6d00000000, %l6 = ffffffffffffffff
	ldxa	[%i4+%o5]0x80,%l6	! %l6 = 1f46fa6d00000000
!	Mem[0000000030141408] = 1c00000f, %l7 = 0000000000000000
	lduwa	[%i5+%o4]0x81,%l7	! %l7 = 000000001c00000f
!	Mem[0000000010101425] = 33abd3e1, %l3 = ffffffffffff0000
	ldsb	[%i4+0x025],%l3		! %l3 = ffffffffffffffab

p0_label_177:
!	Starting 10 instruction Store Burst
!	%l1 = 0000000011ff0066, Mem[0000000030141400] = 0000009f00000000
	stxa	%l1,[%i5+%g0]0x89	! Mem[0000000030141400] = 0000000011ff0066
!	Mem[0000000030181410] = 00000000, %l1 = 0000000011ff0066
	swapa	[%i6+%o5]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000010181434] = 00ff0000, %l7 = 000000001c00000f
	swap	[%i6+0x034],%l7		! %l7 = 0000000000ff0000
!	%l2 = 000000000000ffff, Mem[0000000030041400] = ff000000fccf480b
	stxa	%l2,[%i1+%g0]0x81	! Mem[0000000030041400] = 000000000000ffff
!	%l0 = 000000000000047c, Mem[0000000010101408] = 00000000
	stwa	%l0,[%i4+%o4]0x80	! Mem[0000000010101408] = 0000047c
!	%f2  = 1f4e0e4c fffff67e, Mem[0000000030181410] = 6600ff11 00000000
	stda	%f2 ,[%i6+%o5]0x89	! Mem[0000000030181410] = 1f4e0e4c fffff67e
!	%l4 = ffffffffffffffff, Mem[0000000010081418] = 663eaab22b7428bb
	stx	%l4,[%i2+0x018]		! Mem[0000000010081418] = ffffffffffffffff
!	Mem[0000000010181400] = ffffffff, %l6 = 0000000000000000
	swapa	[%i6+%g0]0x88,%l6	! %l6 = 00000000ffffffff
!	%f6  = 00000000 ffffffff, Mem[00000000100c1400] = 0b48cffc 00000000
	stda	%f6 ,[%i3+%g0]0x88	! Mem[00000000100c1400] = 00000000 ffffffff
!	Mem[00000000218000c1] = ffffa7e8, %l7 = 0000000000ff0000
	ldstuba	[%o3+0x0c1]%asi,%l7	! %l7 = 00000000000000ff

p0_label_178:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181406] = fb200000, %l4 = ffffffffffffffff
	ldub	[%i6+0x006],%l4		! %l4 = 0000000000000000
!	Mem[0000000010141408] = 0000000000000011, %f0  = fccf480b 00000000
	ldda	[%i5+%o4]0x88,%f0 	! %f0  = 00000000 00000011
!	%l0 = 000000000000047c, immd = fffffffffffff45b, %l108 = 0000000000000004
	sdivx	%l0,-0xba5,%l4		! %l4 = 0000000000000000
!	Mem[0000000010081408] = 00000011, %l7 = 00000000000000ff
	ldswa	[%i2+%o4]0x88,%l7	! %l7 = 0000000000000011
!	Mem[00000000300c1410] = 00000000ffffffff, %f18 = 7ef6ffff 4c0e4e1f
	ldda	[%i3+%o5]0x81,%f18	! %f18 = 00000000 ffffffff
!	Mem[0000000010081407] = 000011e1, %l0 = 000000000000047c
	ldub	[%i2+0x007],%l0		! %l0 = 00000000000000e1
!	Mem[0000000010001428] = 13ff9900, %l3 = ffffffffffffffab
	ldsh	[%i0+0x028],%l3		! %l3 = 00000000000013ff
!	Mem[0000000010141400] = 0b48cffc, %l1 = 0000000000000000
	ldsba	[%i5+%g0]0x88,%l1	! %l1 = fffffffffffffffc
!	%l5 = 0000000000000000, imm = fffffffffffffbfd, %l1 = fffffffffffffffc
	and	%l5,-0x403,%l1		! %l1 = 0000000000000000
!	Mem[0000000010081400] = 00000000, %l5 = 0000000000000000
	lduha	[%i2+%g0]0x88,%l5	! %l5 = 0000000000000000

p0_label_179:
!	Starting 10 instruction Store Burst
!	%f28 = 276dc86c, Mem[0000000010001408] = 00c0f50f
	sta	%f28,[%i0+%o4]0x88	! Mem[0000000010001408] = 276dc86c
!	Mem[0000000010041400] = 11ff00660000ffff, %l3 = 00000000000013ff, %l1 = 0000000000000000
	casxa	[%i1]0x80,%l3,%l1	! %l1 = 11ff00660000ffff
!	Mem[0000000030101408] = ff00aab2, %l4 = 0000000000000000
	ldstuba	[%i4+%o4]0x81,%l4	! %l4 = 00000000000000ff
!	%l6 = ffffffff, %l7 = 00000011, Mem[0000000030101410] = 3b188dff 00000000
	stda	%l6,[%i4+%o5]0x81	! Mem[0000000030101410] = ffffffff 00000011
!	%l2 = 000000000000ffff, Mem[0000000021800180] = 00ff5078, %asi = 80
	stba	%l2,[%o3+0x180]%asi	! Mem[0000000021800180] = ffff5078
!	%l6 = ffffffff, %l7 = 00000011, Mem[0000000010001410] = 00000000 0000005e, %asi = 80
	stda	%l6,[%i0+0x010]%asi	! Mem[0000000010001410] = ffffffff 00000011
!	Mem[0000000030181400] = 00000000, %l6 = 00000000ffffffff
	swapa	[%i6+%g0]0x81,%l6	! %l6 = 0000000000000000
!	%f2  = 1f4e0e4c fffff67e, %l4 = 00000000000000ff
!	Mem[0000000010101410] = 1f46fa6d00000000
	add	%i4,0x010,%g1
	stda	%f2,[%g1+%l4]ASI_PST16_PL ! Mem[0000000010101410] = 7ef6ffff4c0e4e1f
!	%f31 = 522e9bb3, %f1  = 00000011
	fcmps	%fcc0,%f31,%f1 		! %fcc0 = 2
!	%l1 = 11ff00660000ffff, Mem[0000000010101410] = 1f4e0e4cfffff67e
	stxa	%l1,[%i4+%o5]0x88	! Mem[0000000010101410] = 11ff00660000ffff

p0_label_180:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = 00000011, %l1 = 11ff00660000ffff
	ldswa	[%i2+%o4]0x88,%l1	! %l1 = 0000000000000011
!	Mem[00000000100c1400] = ffffffff, %l0 = 00000000000000e1
	ldsha	[%i3+%g0]0x80,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010081410] = 476c3610, %l1 = 0000000000000011
	lduha	[%i2+%o5]0x80,%l1	! %l1 = 000000000000476c
!	Mem[0000000010181437] = 1c00000f, %l7 = 0000000000000011, %asi = 80
	ldsba	[%i6+0x037]%asi,%l7	! %l7 = 000000000000000f
!	Mem[0000000010001408] = 6cc86d2700ff446a, %f30 = 0335b20a 522e9bb3
	ldda	[%i0+%o4]0x80,%f30	! %f30 = 6cc86d27 00ff446a
!	Mem[000000001018141c] = 3c5036ff, %l6 = 0000000000000000
	lduh	[%i6+0x01c],%l6		! %l6 = 0000000000003c50
	membar	#Sync			! Added by membar checker (38)
!	Mem[00000000300c1400] = 5b000000 0000009f ffffffff 0000446a
!	Mem[00000000300c1410] = 00000000 ffffffff 630075ff ff1c9d8b
!	Mem[00000000300c1420] = 32000000 5d000000 13ff9938 00000058
!	Mem[00000000300c1430] = 00002a00 0000009f 47baaeec 000000ff
	ldda	[%i3+%g0]ASI_BLK_SL,%f0 	! Block Load from 00000000300c1400
!	Mem[00000000100c1428] = 00000000, %l7 = 000000000000000f
	ldsw	[%i3+0x028],%l7		! %l7 = 0000000000000000
!	Mem[0000000010181410] = 00000000 00000000, %l4 = 000000ff, %l5 = 00000000
	ldda	[%i6+%o5]0x80,%l4	! %l4 = 0000000000000000 0000000000000000
!	%l7 = 0000000000000000, imm = 0000000000000cf5, %l0 = ffffffffffffffff
	subc	%l7,0xcf5,%l0		! %l0 = fffffffffffff30b

p0_label_181:
!	Starting 10 instruction Store Burst
!	Mem[0000000030041408] = ff000000, %l4 = 0000000000000000
	ldstuba	[%i1+%o4]0x81,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010181428] = 0ff5c00000000000, %l4 = 00000000000000ff, %l4 = 00000000000000ff
	add	%i6,0x28,%g1
	casxa	[%g1]0x80,%l4,%l4	! %l4 = 0ff5c00000000000
!	%l4 = 0ff5c00000000000, Mem[0000000030181410] = 7ef6ffff
	stba	%l4,[%i6+%o5]0x81	! Mem[0000000030181410] = 00f6ffff
!	Mem[00000000100c1400] = ffffffff, %l3 = 00000000000013ff, %asi = 80
	swapa	[%i3+0x000]%asi,%l3	! %l3 = 00000000ffffffff
!	%l4 = 00000000, %l5 = 00000000, Mem[0000000030081408] = fffff67e 1f4e0e4c
	stda	%l4,[%i2+%o4]0x89	! Mem[0000000030081408] = 00000000 00000000
!	Mem[00000000201c0001] = ffff9298, %l7 = 0000000000000000
	ldstub	[%o0+0x001],%l7		! %l7 = 00000000000000ff
!	Mem[0000000030101408] = b2aa00ff, %l2 = 000000000000ffff
	ldstuba	[%i4+%o4]0x89,%l2	! %l2 = 00000000000000ff
!	%l2 = 00000000000000ff, Mem[0000000010141408] = 1100000000000000
	stxa	%l2,[%i5+%o4]0x80	! Mem[0000000010141408] = 00000000000000ff
!	%l6 = 00003c50, %l7 = 000000ff, Mem[0000000030081408] = 00000000 00000000
	stda	%l6,[%i2+%o4]0x81	! Mem[0000000030081408] = 00003c50 000000ff
!	Mem[0000000010081420] = 5b51d500, %l1 = 000000000000476c
	swap	[%i2+0x020],%l1		! %l1 = 000000005b51d500

p0_label_182:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = 11000000, %f31 = 00ff446a
	ld	[%i2+%o4],%f31		! %f31 = 11000000
!	Mem[0000000030141408] = 0f00001c, %l6 = 0000000000003c50
	ldswa	[%i5+%o4]0x89,%l6	! %l6 = 000000000f00001c
!	Mem[0000000010101410] = ffff0000, %l2 = 00000000000000ff
	lduwa	[%i4+%o5]0x80,%l2	! %l2 = 00000000ffff0000
!	Mem[0000000010041430] = 00000000, %l2 = 00000000ffff0000
	ldsh	[%i1+0x030],%l2		! %l2 = 0000000000000000
!	Mem[0000000030181410] = fffff600, %l6 = 000000000f00001c
	ldsba	[%i6+%o5]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000010181434] = 1c00000f, %l7 = 00000000000000ff
	ldub	[%i6+0x034],%l7		! %l7 = 000000000000001c
!	Mem[0000000010041400] = 6600ff11, %l1 = 000000005b51d500
	ldsha	[%i1+%g0]0x88,%l1	! %l1 = ffffffffffffff11
!	Mem[0000000030101408] = 09c05727 b2aa00ff, %l4 = 00000000, %l5 = 00000000
	ldda	[%i4+%o4]0x89,%l4	! %l4 = 00000000b2aa00ff 0000000009c05727
!	Mem[00000000300c1410] = ffffffff00000000, %l6 = 0000000000000000
	ldxa	[%i3+%o5]0x89,%l6	! %l6 = ffffffff00000000
!	Mem[0000000030101408] = b2aa00ff, %l4 = 00000000b2aa00ff
	ldswa	[%i4+%o4]0x89,%l4	! %l4 = ffffffffb2aa00ff

p0_label_183:
!	Starting 10 instruction Store Burst
!	%f20 = 00000000 00000000, %l3 = 00000000ffffffff
!	Mem[0000000010141410] = 1b62e111fccf480b
	add	%i5,0x010,%g1
	stda	%f20,[%g1+%l3]ASI_PST16_PL ! Mem[0000000010141410] = 0000000000000000
!	Mem[0000000030101410] = ffffffff, %l4 = ffffffffb2aa00ff
	ldstuba	[%i4+%o5]0x81,%l4	! %l4 = 00000000000000ff
!	%f23 = 5efcd93b, Mem[0000000010081434] = 2051b6cd
	sta	%f23,[%i2+0x034]%asi	! Mem[0000000010081434] = 5efcd93b
!	Mem[00000000100c1410] = 78059f17, %l3 = 00000000ffffffff
	ldstuba	[%i3+%o5]0x88,%l3	! %l3 = 0000000000000017
!	Mem[0000000010101408] = 7c040000, %l1 = ffffffffffffff11
	ldstuba	[%i4+%o4]0x88,%l1	! %l1 = 0000000000000000
!	%l6 = ffffffff00000000, %l2 = 0000000000000000, %l5 = 0000000009c05727
	sub	%l6,%l2,%l5		! %l5 = ffffffff00000000
!	Mem[00000000300c1400] = 0000005b, %l4 = 00000000000000ff
	swapa	[%i3+%g0]0x89,%l4	! %l4 = 000000000000005b
!	%l4 = 0000005b, %l5 = 00000000, Mem[0000000010101410] = ffff0000 6600ff11
	stda	%l4,[%i4+%o5]0x80	! Mem[0000000010101410] = 0000005b 00000000
!	%l4 = 000000000000005b, Mem[0000000030141400] = 6600ff11
	stwa	%l4,[%i5+%g0]0x81	! Mem[0000000030141400] = 0000005b
!	%l6 = ffffffff00000000, %l1 = 0000000000000000, %y  = 00000000
	umul	%l6,%l1,%l0		! %l0 = 0000000000000000, %y = 00000000

p0_label_184:
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = 0000005b, %f28 = 276dc86c
	lda	[%i5+%g0]0x81,%f28	! %f28 = 0000005b
!	Mem[0000000030141408] = 1c00000fff9d1c37, %l4 = 000000000000005b
	ldxa	[%i5+%o4]0x81,%l4	! %l4 = 1c00000fff9d1c37
!	Mem[000000001000142c] = 00000058, %l6 = ffffffff00000000
	lduw	[%i0+0x02c],%l6		! %l6 = 0000000000000058
!	Mem[0000000030001410] = 4c0e4eff, %l3 = 0000000000000017
	lduwa	[%i0+%o5]0x89,%l3	! %l3 = 000000004c0e4eff
!	Mem[0000000010001424] = f7ffffff, %f18 = 00000000
	ld	[%i0+0x024],%f18	! %f18 = f7ffffff
!	Mem[00000000201c0001] = ffff9298, %l3 = 000000004c0e4eff
	ldub	[%o0+0x001],%l3		! %l3 = 00000000000000ff
!	Mem[0000000010141408] = 00000000, %l4 = 1c00000fff9d1c37
	lduwa	[%i5+%o4]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000030001400] = fccf480b00000000, %l4 = 0000000000000000
	ldxa	[%i0+%g0]0x89,%l4	! %l4 = fccf480b00000000
!	Mem[0000000010101410] = 0000005b, %l1 = 0000000000000000
	lduba	[%i4+%o5]0x80,%l1	! %l1 = 0000000000000000
!	Mem[00000000300c1410] = 00000000, %f25 = 00c0f50f
	lda	[%i3+%o5]0x81,%f25	! %f25 = 00000000

p0_label_185:
!	Starting 10 instruction Store Burst
!	%l4 = fccf480b00000000, Mem[0000000030101400] = 10366c47
	stwa	%l4,[%i4+%g0]0x89	! Mem[0000000030101400] = 00000000
!	%f10 = 58000000 3899ff13, Mem[0000000010001418] = 630075ff ff1c9d8b
	std	%f10,[%i0+0x018]	! Mem[0000000010001418] = 58000000 3899ff13
	membar	#Sync			! Added by membar checker (39)
!	%l7 = 000000000000001c, Mem[00000000300c1410] = 00000000
	stwa	%l7,[%i3+%o5]0x89	! Mem[00000000300c1410] = 0000001c
!	Mem[0000000010141400] = fccf480b, %l6 = 0000000000000058
	ldstuba	[%i5+%g0]0x80,%l6	! %l6 = 00000000000000fc
!	%l4 = 00000000, %l5 = 00000000, Mem[00000000100c1408] = 0b480000 00000000
	stda	%l4,[%i3+%o4]0x80	! Mem[00000000100c1408] = 00000000 00000000
!	%l3 = 00000000000000ff, Mem[0000000010081408] = 00000011
	stba	%l3,[%i2+%o4]0x88	! Mem[0000000010081408] = 000000ff
!	%l6 = 00000000000000fc, Mem[0000000030181410] = fffff600
	stha	%l6,[%i6+%o5]0x89	! Mem[0000000030181410] = ffff00fc
!	%l4 = fccf480b00000000, Mem[0000000030001410] = 4c0e4eff
	stwa	%l4,[%i0+%o5]0x89	! Mem[0000000030001410] = 00000000
!	%f20 = 00000000, %f26 = 1ef470be, %f21 = 00000000
	fsubs	%f20,%f26,%f21		! %f21 = 9ef470be
!	%l0 = 0000000000000000, %l3 = 00000000000000ff, %y  = 00000000
	udiv	%l0,%l3,%l5		! %l5 = 0000000000000000
	mov	%l0,%y			! %y = 00000000

p0_label_186:
!	Starting 10 instruction Load Burst
!	Mem[0000000021800140] = f20f1c48, %l7 = 000000000000001c, %asi = 80
	ldsha	[%o3+0x140]%asi,%l7	! %l7 = fffffffffffff20f
!	Mem[0000000010041408] = ff000000 00000000, %l0 = 00000000, %l1 = 00000000
	ldda	[%i1+%o4]0x80,%l0	! %l0 = 00000000ff000000 0000000000000000
!	Mem[0000000010141434] = 00000000, %l2 = 0000000000000000, %asi = 80
	ldswa	[%i5+0x034]%asi,%l2	! %l2 = 0000000000000000
!	Mem[0000000030001400] = 00000000, %l1 = 0000000000000000
	ldsha	[%i0+%g0]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000010181410] = 00000000, %l5 = 0000000000000000
	lduba	[%i6+%o5]0x88,%l5	! %l5 = 0000000000000000
!	Mem[00000000100c1410] = 78059fff, %l4 = fccf480b00000000
	lduwa	[%i3+%o5]0x88,%l4	! %l4 = 0000000078059fff
!	Mem[0000000030181400] = ffffffff, %l4 = 0000000078059fff
	lduha	[%i6+%g0]0x89,%l4	! %l4 = 000000000000ffff
!	Mem[00000000201c0001] = ffff9298, %l4 = 000000000000ffff
	ldsb	[%o0+0x001],%l4		! %l4 = ffffffffffffffff
!	Mem[0000000010141408] = ff00000000000000, %l7 = fffffffffffff20f
	ldxa	[%i5+%o4]0x88,%l7	! %l7 = ff00000000000000
!	Mem[0000000010181410] = 00000000 00000000, %l4 = ffffffff, %l5 = 00000000
	ldd	[%i6+%o5],%l4		! %l4 = 0000000000000000 0000000000000000

p0_label_187:
!	Starting 10 instruction Store Burst
!	Mem[0000000030141410] = 00000000, %l1 = 0000000000000000
	ldstuba	[%i5+%o5]0x81,%l1	! %l1 = 0000000000000000
!	%l1 = 0000000000000000, Mem[0000000010041400] = 6600ff11
	stha	%l1,[%i1+%g0]0x88	! Mem[0000000010041400] = 66000000
!	%f12 = 9f000000 002a0000, Mem[0000000030181400] = ffffffff 0b48cffc
	stda	%f12,[%i6+%g0]0x81	! Mem[0000000030181400] = 9f000000 002a0000
!	%f10 = 58000000 3899ff13, %l2 = 0000000000000000
!	Mem[0000000010141438] = fffffff200000000
	add	%i5,0x038,%g1
	stda	%f10,[%g1+%l2]ASI_PST32_PL ! Mem[0000000010141438] = fffffff200000000
!	Mem[00000000300c1408] = ffffffff, %l3 = 00000000000000ff
	swapa	[%i3+%o4]0x81,%l3	! %l3 = 00000000ffffffff
!	%l6 = 00000000000000fc, Mem[00000000218000c0] = ffffa7e8, %asi = 80
	stba	%l6,[%o3+0x0c0]%asi	! Mem[00000000218000c0] = fcffa7e8
!	%l4 = 00000000, %l5 = 00000000, Mem[0000000030041400] = 00000000 0000ffff
	stda	%l4,[%i1+%g0]0x81	! Mem[0000000030041400] = 00000000 00000000
!	Mem[0000000010101400] = ffffffff, %l1 = 0000000000000000
	swapa	[%i4+%g0]0x88,%l1	! %l1 = 00000000ffffffff
!	Mem[0000000010181438] = 0189db4c000000ff, %l5 = 0000000000000000, %l6 = 00000000000000fc
	add	%i6,0x38,%g1
	casxa	[%g1]0x80,%l5,%l6	! %l6 = 0189db4c000000ff
!	%l3 = 00000000ffffffff, Mem[0000000010141400] = ffcf480b
	stwa	%l3,[%i5+%g0]0x80	! Mem[0000000010141400] = ffffffff

p0_label_188:
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = ff000000 00000000, %l6 = 000000ff, %l7 = 00000000
	ldda	[%i1+%o4]0x81,%l6	! %l6 = 00000000ff000000 0000000000000000
!	Mem[0000000020800041] = 11ff3ef8, %l1 = 00000000ffffffff
	ldsb	[%o1+0x041],%l1		! %l1 = ffffffffffffffff
!	Mem[0000000010101410] = 5b000000, %l4 = 0000000000000000
	lduha	[%i4+%o5]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000010081410] = 476c3610, %l4 = 0000000000000000
	ldswa	[%i2+%o5]0x80,%l4	! %l4 = 00000000476c3610
!	Mem[00000000201c0000] = ffff9298, %l5 = 0000000000000000, %asi = 80
	lduha	[%o0+0x000]%asi,%l5	! %l5 = 000000000000ffff
!	Mem[0000000010081408] = ff000000 b08d183b, %l4 = 476c3610, %l5 = 0000ffff
	ldda	[%i2+%o4]0x80,%l4	! %l4 = 00000000ff000000 00000000b08d183b
!	Mem[0000000010041410] = 1248e92b, %l3 = 00000000ffffffff
	ldsba	[%i1+%o5]0x88,%l3	! %l3 = 000000000000002b
!	Mem[0000000030101400] = 00000000, %l7 = 0000000000000000
	lduba	[%i4+%g0]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000010181400] = 000020fb00000000, %f30 = 6cc86d27 11000000
	ldda	[%i6+%g0]0x88,%f30	! %f30 = 000020fb 00000000
!	Mem[00000000100c1408] = 00000000, %l3 = 000000000000002b
	lduha	[%i3+%o4]0x88,%l3	! %l3 = 0000000000000000

p0_label_189:
!	Starting 10 instruction Store Burst
!	Mem[0000000010001400] = 00000000, %l3 = 0000000000000000
	ldstuba	[%i0+%g0]0x80,%l3	! %l3 = 0000000000000000
!	%f1  = 0000005b, %f11 = 3899ff13
	fcmps	%fcc2,%f1 ,%f11		! %fcc2 = 1
!	%l5 = 00000000b08d183b, Mem[00000000100c1408] = 00000000
	stwa	%l5,[%i3+%o4]0x80	! Mem[00000000100c1408] = b08d183b
!	Mem[0000000010001408] = 276dc86c, %l5 = 00000000b08d183b
	swapa	[%i0+%o4]0x88,%l5	! %l5 = 00000000276dc86c
!	Mem[0000000010001408] = 3b188db0, %l7 = 0000000000000000
	ldstuba	[%i0+%o4]0x80,%l7	! %l7 = 000000000000003b
!	Mem[0000000010081410] = 476c3610, %l5 = 00000000276dc86c
	swapa	[%i2+%o5]0x80,%l5	! %l5 = 00000000476c3610
!	%f18 = f7ffffff ffffffff, %l5 = 00000000476c3610
!	Mem[0000000010181428] = 0ff5c00000000000
	add	%i6,0x028,%g1
	stda	%f18,[%g1+%l5]ASI_PST16_P ! Mem[0000000010181428] = 0ff5c00000000000
!	Mem[00000000218000c1] = fcffa7e8, %l6 = 00000000ff000000
	ldstuba	[%o3+0x0c1]%asi,%l6	! %l6 = 00000000000000ff
!	%l5 = 00000000476c3610, Mem[0000000010041410] = 2be94812
	stwa	%l5,[%i1+%o5]0x80	! Mem[0000000010041410] = 476c3610
!	Mem[00000000211c0000] = ffff8f28, %l1 = ffffffffffffffff
	ldstub	[%o2+%g0],%l1		! %l1 = 00000000000000ff

p0_label_190:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = 0000005b, %f20 = 00000000
	lda	[%i4+0x010]%asi,%f20	! %f20 = 0000005b
!	Mem[0000000030141408] = 1c00000fff9d1c37, %f6  = 8b9d1cff ff750063
	ldda	[%i5+%o4]0x81,%f6 	! %f6  = 1c00000f ff9d1c37
!	%l4 = 00000000ff000000, %l0 = 00000000ff000000, %l4 = 00000000ff000000
	and	%l4,%l0,%l4		! %l4 = 00000000ff000000
!	Mem[0000000010101400] = 00000000, %l0 = 00000000ff000000
	lduha	[%i4+%g0]0x80,%l0	! %l0 = 0000000000000000
!	Mem[00000000100c1410] = 0000000078059fff, %l5 = 00000000476c3610
	ldxa	[%i3+%o5]0x88,%l5	! %l5 = 0000000078059fff
!	Mem[0000000010041400] = ffff000066000000, %f30 = 000020fb 00000000
	ldda	[%i1+%g0]0x88,%f30	! %f30 = ffff0000 66000000
!	Mem[0000000010041410] = 10366c47, %f14 = ff000000
	lda	[%i1+%o5]0x88,%f14	! %f14 = 10366c47
!	Mem[0000000010141418] = 000d11e1ffdfe0eb, %l3 = 0000000000000000, %asi = 80
	ldxa	[%i5+0x018]%asi,%l3	! %l3 = 000d11e1ffdfe0eb
!	Mem[00000000211c0001] = ffff8f28, %l3 = 000d11e1ffdfe0eb, %asi = 80
	lduba	[%o2+0x001]%asi,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010181410] = 0000000000000000, %f2  = 6a440000 ffffffff, %asi = 80
	ldda	[%i6+0x010]%asi,%f2 	! %f2  = 00000000 00000000

p0_label_191:
!	Starting 10 instruction Store Burst
!	%l2 = 0000000000000000, Mem[0000000030041400] = 0000000000000000
	stxa	%l2,[%i1+%g0]0x89	! Mem[0000000030041400] = 0000000000000000
!	Mem[00000000100c1408] = 3b188db0, %l5 = 0000000078059fff
	ldstuba	[%i3+%o4]0x88,%l5	! %l5 = 00000000000000b0
!	Mem[00000000201c0001] = ffff9298, %l6 = 00000000000000ff
	ldstub	[%o0+0x001],%l6		! %l6 = 00000000000000ff
!	%l2 = 0000000000000000, %l3 = 00000000000000ff, %l5 = 00000000000000b0
	udivx	%l2,%l3,%l5		! %l5 = 0000000000000000
!	%f2  = 00000000 00000000, %l1 = 00000000000000ff
!	Mem[00000000300c1400] = ff0000000000009f
	stda	%f2,[%i3+%l1]ASI_PST32_SL ! Mem[00000000300c1400] = 0000000000000000
!	%l0 = 0000000000000000, Mem[0000000010081408] = 000000ff
	stba	%l0,[%i2+%o4]0x88	! Mem[0000000010081408] = 00000000
!	%l7 = 000000000000003b, Mem[0000000010141400] = ffffffff
	stwa	%l7,[%i5+%g0]0x80	! Mem[0000000010141400] = 0000003b
!	%f30 = ffff0000 66000000, %l4 = 00000000ff000000
!	Mem[00000000300c1408] = 000000ff0000446a
	add	%i3,0x008,%g1
	stda	%f30,[%g1+%l4]ASI_PST32_S ! Mem[00000000300c1408] = 000000ff0000446a
!	%l2 = 0000000000000000, Mem[0000000010081400] = e111000000000000
	stxa	%l2,[%i2+%g0]0x88	! Mem[0000000010081400] = 0000000000000000
!	%l2 = 00000000, %l3 = 000000ff, Mem[0000000010081410] = 276dc86c 00000000
	stda	%l2,[%i2+%o5]0x80	! Mem[0000000010081410] = 00000000 000000ff

p0_label_192:
!	Starting 10 instruction Load Burst
!	%l5 = 0000000000000000, %l3 = 00000000000000ff, %y  = 00000000
	smul	%l5,%l3,%l0		! %l0 = 0000000000000000, %y = 00000000
!	Mem[0000000010181410] = 00000000 00000000, %l2 = 00000000, %l3 = 000000ff
	ldda	[%i6+%o5]0x80,%l2	! %l2 = 0000000000000000 0000000000000000
!	Mem[0000000030081408] = 503c0000, %l6 = 00000000000000ff
	ldswa	[%i2+%o4]0x89,%l6	! %l6 = 00000000503c0000
	membar	#Sync			! Added by membar checker (40)
!	Mem[0000000030141400] = 0000005b 00000000 1c00000f ff9d1c37
!	Mem[0000000030141410] = ff000000 6853b85b 0e7254a0 537d1e31
!	Mem[0000000030141420] = 0e7254a0 00005d00 43da12de 0e78e4b7
!	Mem[0000000030141430] = 0000005d 45652dc9 1b62e111 000020fb
	ldda	[%i5+%g0]ASI_BLK_S,%f16	! Block Load from 0000000030141400
!	Mem[0000000030001400] = 000000000b48cffc, %l6 = 00000000503c0000
	ldxa	[%i0+%g0]0x81,%l6	! %l6 = 000000000b48cffc
!	Mem[0000000010041408] = 000000ff, %l0 = 0000000000000000
	ldswa	[%i1+%o4]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010181408] = 0000000000d5515b, %f14 = 10366c47 ecaeba47
	ldda	[%i6+%o4]0x80,%f14	! %f14 = 00000000 00d5515b
!	Mem[00000000100c1410] = ff9f0578, %l2 = 0000000000000000, %asi = 80
	ldswa	[%i3+0x010]%asi,%l2	! %l2 = ffffffffff9f0578
!	Mem[00000000300c1410] = 0000001c, %f1  = 0000005b
	lda	[%i3+%o5]0x89,%f1 	! %f1 = 0000001c
!	Mem[0000000030001400] = 00000000, %l5 = 0000000000000000
	lduwa	[%i0+%g0]0x89,%l5	! %l5 = 0000000000000000

p0_label_193:
!	Starting 10 instruction Store Burst
!	%l6 = 000000000b48cffc, Mem[0000000030081400] = ff0000000000001f
	stxa	%l6,[%i2+%g0]0x89	! Mem[0000000030081400] = 000000000b48cffc
!	Mem[0000000030081410] = 00000b48, %l5 = 0000000000000000
	ldstuba	[%i2+%o5]0x89,%l5	! %l5 = 0000000000000048
!	%l7 = 000000000000003b, Mem[0000000010001438] = 47baaeec000000ff
	stx	%l7,[%i0+0x038]		! Mem[0000000010001438] = 000000000000003b
!	Mem[0000000010101408] = ff00047c, %l5 = 0000000000000048
	ldstuba	[%i4+%o4]0x80,%l5	! %l5 = 00000000000000ff
!	Mem[000000001000141f] = 3899ff13, %l4 = 00000000ff000000
	ldstub	[%i0+0x01f],%l4		! %l4 = 0000000000000013
!	Mem[0000000010101400] = 00000000, %l6 = 000000000b48cffc
	ldstuba	[%i4+%g0]0x80,%l6	! %l6 = 0000000000000000
!	%l1 = 00000000000000ff, Mem[00000000300c1408] = 000000ff
	stba	%l1,[%i3+%o4]0x81	! Mem[00000000300c1408] = ff0000ff
!	%l7 = 000000000000003b, Mem[000000001008140d] = b08d183b
	stb	%l7,[%i2+0x00d]		! Mem[000000001008140c] = b03b183b
!	%f8  = 0000005d, Mem[0000000010081408] = 00000000
	sta	%f8 ,[%i2+%o4]0x80	! Mem[0000000010081408] = 0000005d
!	%l3 = 0000000000000000, Mem[00000000211c0000] = ffff8f28, %asi = 80
	stba	%l3,[%o2+0x000]%asi	! Mem[00000000211c0000] = 00ff8f28

p0_label_194:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = 000000ff, %f10 = 58000000
	lda	[%i1+%o4]0x88,%f10	! %f10 = 000000ff
!	Mem[00000000300c1410] = 1c000000, %l0 = 00000000000000ff
	lduha	[%i3+%o5]0x81,%l0	! %l0 = 0000000000001c00
!	Mem[0000000010001408] = b08d18ff, %f4  = ffffffff
	lda	[%i0+%o4]0x88,%f4 	! %f4 = b08d18ff
!	%f31 = 000020fb, %f10 = 000000ff
	fsqrts	%f31,%f10		! tt=0x22, %l0 = 0000000000001c22
!	Mem[00000000218001c0] = 11ff80a8, %l7 = 000000000000003b, %asi = 80
	ldsba	[%o3+0x1c0]%asi,%l7	! %l7 = 0000000000000011
!	Mem[0000000010101410] = 0000005b, %l5 = 00000000000000ff
	lduwa	[%i4+%o5]0x80,%l5	! %l5 = 000000000000005b
!	Mem[00000000300c1410] = 0000001c, %l7 = 0000000000000011
	ldswa	[%i3+%o5]0x89,%l7	! %l7 = 000000000000001c
!	Mem[0000000010041408] = ff00000000000000, %f4  = b08d18ff 00000000
	ldda	[%i1+%o4]0x80,%f4 	! %f4  = ff000000 00000000
!	Mem[0000000010041408] = 00000000000000ff, %l1 = 00000000000000ff
	ldxa	[%i1+%o4]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[00000000300c1408] = 6a440000 ff0000ff, %l4 = 00000013, %l5 = 0000005b
	ldda	[%i3+%o4]0x89,%l4	! %l4 = 00000000ff0000ff 000000006a440000

p0_label_195:
!	Starting 10 instruction Store Burst
!	Mem[000000001004141b] = 00000000, %l6 = 0000000000000000
	ldstub	[%i1+0x01b],%l6		! %l6 = 0000000000000000
!	%f16 = 0000005b 00000000, Mem[0000000010101408] = ff00047c 000000ff
	stda	%f16,[%i4+%o4]0x80	! Mem[0000000010101408] = 0000005b 00000000
!	%f0  = 9f000000 0000001c, Mem[0000000010041410] = 476c3610 fccf480b
	stda	%f0 ,[%i1+%o5]0x80	! Mem[0000000010041410] = 9f000000 0000001c
!	%l3 = 0000000000000000, Mem[0000000030041408] = ff000000
	stha	%l3,[%i1+%o4]0x81	! Mem[0000000030041408] = 00000000
!	%l7 = 000000000000001c, Mem[0000000010041400] = 000000660000ffff
	stxa	%l7,[%i1+%g0]0x80	! Mem[0000000010041400] = 000000000000001c
	membar	#Sync			! Added by membar checker (41)
!	%f28 = 0000005d 45652dc9, %l0 = 0000000000001c22
!	Mem[0000000030141410] = ff0000006853b85b
	add	%i5,0x010,%g1
	stda	%f28,[%g1+%l0]ASI_PST16_SL ! Mem[0000000030141410] = ff0065456853b85b
!	%f4  = ff000000 00000000, Mem[0000000010181410] = 00000000 00000000, %asi = 80
	stda	%f4 ,[%i6+0x010]%asi	! Mem[0000000010181410] = ff000000 00000000
!	%f18 = 1c00000f ff9d1c37, Mem[0000000010101410] = 0000005b 00000000
	stda	%f18,[%i4+%o5]0x80	! Mem[0000000010101410] = 1c00000f ff9d1c37
!	%f8  = 0000005d 00000032, Mem[0000000030141400] = 5b000000 00000000
	stda	%f8 ,[%i5+%g0]0x89	! Mem[0000000030141400] = 0000005d 00000032
!	%f4  = ff000000 00000000, Mem[0000000010101420] = 476c3610 33abd3e1
	std	%f4 ,[%i4+0x020]	! Mem[0000000010101420] = ff000000 00000000

p0_label_196:
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = 00000000, %l1 = 00000000000000ff
	ldswa	[%i1+%g0]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000010181400] = 000020fb00000000, %l0 = 0000000000001c22
	ldxa	[%i6+%g0]0x88,%l0	! %l0 = 000020fb00000000
!	Mem[0000000010141403] = 0000003b, %l0 = 000020fb00000000, %asi = 80
	ldsba	[%i5+0x003]%asi,%l0	! %l0 = 000000000000003b
!	Mem[0000000010181408] = 00000000, %l3 = 0000000000000000
	lduba	[%i6+%o4]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000010181436] = 1c00000f, %l3 = 0000000000000000, %asi = 80
	ldsha	[%i6+0x036]%asi,%l3	! %l3 = 000000000000000f
!	Mem[00000000100c1418] = 09c057271248e92b, %l5 = 000000006a440000
	ldx	[%i3+0x018],%l5		! %l5 = 09c057271248e92b
!	%l7 = 000000000000001c, immd = fffffd4a, %y  = 00000000
	sdiv	%l7,-0x2b6,%l1		! %l1 = 0000000000000000
	mov	%l0,%y			! %y = 0000003b
!	Mem[0000000010141400] = 0000003b, %l6 = 0000000000000000
	lduwa	[%i5+%g0]0x80,%l6	! %l6 = 000000000000003b
!	Mem[0000000010041400] = 00000000, %l6 = 000000000000003b
	ldsba	[%i1+%g0]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000030101408] = ff00aab2, %l1 = 0000000000000000
	lduha	[%i4+%o4]0x81,%l1	! %l1 = 000000000000ff00

p0_label_197:
!	Starting 10 instruction Store Burst
!	%l0 = 000000000000003b, Mem[00000000201c0000] = ffff9298
	stb	%l0,[%o0+%g0]		! Mem[00000000201c0000] = 3bff9298
!	%f10 = 000000ff 3899ff13, Mem[0000000030081410] = 00000bff 00000000
	stda	%f10,[%i2+%o5]0x89	! Mem[0000000030081410] = 000000ff 3899ff13
!	%f9  = 00000032, Mem[00000000100c1414] = 00000000
	st	%f9 ,[%i3+0x014]	! Mem[00000000100c1414] = 00000032
!	%l4 = ff0000ff, %l5 = 1248e92b, Mem[0000000030081410] = 13ff9938 ff000000
	stda	%l4,[%i2+%o5]0x81	! Mem[0000000030081410] = ff0000ff 1248e92b
!	%l7 = 000000000000001c, Mem[0000000010001400] = 3b188db0000000ff
	stxa	%l7,[%i0+%g0]0x88	! Mem[0000000010001400] = 000000000000001c
!	Mem[000000001004142b] = 00000000, %l4 = 00000000ff0000ff
	ldstub	[%i1+0x02b],%l4		! %l4 = 0000000000000000
!	Mem[0000000010081400] = 00000000, %l0 = 000000000000003b
	ldstuba	[%i2+%g0]0x80,%l0	! %l0 = 0000000000000000
!	%l5 = 09c057271248e92b, Mem[0000000010041408] = 000000ff
	stwa	%l5,[%i1+%o4]0x88	! Mem[0000000010041408] = 1248e92b
!	%f10 = 000000ff, Mem[000000001010142c] = 0000446a
	sta	%f10,[%i4+0x02c]%asi	! Mem[000000001010142c] = 000000ff
!	Mem[0000000030041410] = 11000000, %l3 = 000000000000000f
	swapa	[%i1+%o5]0x89,%l3	! %l3 = 0000000011000000

p0_label_198:
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = ff00aab2 2757c009, %l6 = 00000000, %l7 = 0000001c
	ldda	[%i4+%o4]0x81,%l6	! %l6 = 00000000ff00aab2 000000002757c009
!	Mem[0000000030001408] = 00000000 00000022, %l4 = 00000000, %l5 = 1248e92b
	ldda	[%i0+%o4]0x89,%l4	! %l4 = 0000000000000022 0000000000000000
!	Mem[0000000010141410] = 0000000000000000, %l7 = 000000002757c009
	ldxa	[%i5+%o5]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000030001400] = 00000000, %l3 = 0000000011000000
	ldsba	[%i0+%g0]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000010041420] = 2233000024938341, %f30 = 1b62e111 000020fb, %asi = 80
	ldda	[%i1+0x020]%asi,%f30	! %f30 = 22330000 24938341
!	Mem[00000000300c1408] = ff0000ff, %l7 = 0000000000000000
	ldsba	[%i3+%o4]0x89,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010101400] = ff000000, %l0 = 0000000000000000
	ldswa	[%i4+%g0]0x80,%l0	! %l0 = ffffffffff000000
!	Mem[0000000030181410] = fc00ffff, %f15 = 00d5515b
	lda	[%i6+%o5]0x81,%f15	! %f15 = fc00ffff
!	Mem[0000000010041408] = 1248e92b, %l3 = 0000000000000000
	ldsha	[%i1+%o4]0x88,%l3	! %l3 = ffffffffffffe92b
!	Mem[0000000010041400] = 000000000000001c, %l4 = 0000000000000022
	ldxa	[%i1+%g0]0x80,%l4	! %l4 = 000000000000001c

p0_label_199:
!	Starting 10 instruction Store Burst
!	%f2  = 00000000, Mem[0000000010141408] = 00000000
	sta	%f2 ,[%i5+%o4]0x80	! Mem[0000000010141408] = 00000000
!	Mem[0000000030001408] = 22000000, %l2 = 00000000ff9f0578
	swapa	[%i0+%o4]0x81,%l2	! %l2 = 0000000022000000
!	Mem[0000000030081400] = 0b48cffc, %l3 = ffffffffffffe92b
	ldstuba	[%i2+%g0]0x89,%l3	! %l3 = 00000000000000fc
!	%l2 = 0000000022000000, Mem[0000000010041408] = 2be94812
	stba	%l2,[%i1+%o4]0x80	! Mem[0000000010041408] = 00e94812
!	Mem[0000000030181400] = 9f000000, %l7 = ffffffffffffffff
	ldstuba	[%i6+%g0]0x81,%l7	! %l7 = 000000000000009f
!	%f0  = 9f000000 0000001c, Mem[00000000300c1410] = 0000001c ffffffff
	stda	%f0 ,[%i3+%o5]0x89	! Mem[00000000300c1410] = 9f000000 0000001c
!	%f6  = 1c00000f ff9d1c37, Mem[0000000010141428] = 3fb4e72e 5e3f75c7, %asi = 80
	stda	%f6 ,[%i5+0x028]%asi	! Mem[0000000010141428] = 1c00000f ff9d1c37
!	Mem[00000000100c1410] = 78059fff, %l1 = 000000000000ff00
	swapa	[%i3+%o5]0x88,%l1	! %l1 = 0000000078059fff
!	%l1 = 0000000078059fff, Mem[0000000010101408] = 0000005b, %asi = 80
	stba	%l1,[%i4+0x008]%asi	! Mem[0000000010101408] = ff00005b
!	%f24 = 0e7254a0 00005d00, %l0 = ffffffffff000000
!	Mem[0000000030041410] = 0f00000000000000
	add	%i1,0x010,%g1
	stda	%f24,[%g1+%l0]ASI_PST8_SL ! Mem[0000000030041410] = 0f00000000000000

p0_label_200:
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = 503c0000, %l2 = 0000000022000000
	ldsha	[%i2+%o4]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000030081400] = 0b48cfff, %l4 = 000000000000001c
	swapa	[%i2+%g0]0x89,%l4	! %l4 = 000000000b48cfff
!	Mem[0000000010101400] = 000000ff, %l2 = 0000000000000000
	ldsba	[%i4+%g0]0x88,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000030041400] = 00000000, %f20 = ff000000
	lda	[%i1+%g0]0x81,%f20	! %f20 = 00000000
!	Mem[0000000030101410] = ffffffff00000011, %f6  = 1c00000f ff9d1c37
	ldda	[%i4+%o5]0x81,%f6 	! %f6  = ffffffff 00000011
!	Mem[0000000010101419] = 00000000, %l3 = 00000000000000fc, %asi = 80
	lduba	[%i4+0x019]%asi,%l3	! %l3 = 0000000000000000
!	Mem[0000000010001410] = ffffffff, %l0 = ffffffffff000000
	ldswa	[%i0+%o5]0x88,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010041410] = 1c0000000000009f, %l5 = 0000000000000000
	ldxa	[%i1+%o5]0x88,%l5	! %l5 = 1c0000000000009f
!	Mem[0000000010041410] = 0000009f, %l6 = 00000000ff00aab2
	lduba	[%i1+%o5]0x88,%l6	! %l6 = 000000000000009f
!	Mem[00000000100c1428] = 000000000000009f, %f4  = ff000000 00000000, %asi = 80
	ldda	[%i3+0x028]%asi,%f4 	! %f4  = 00000000 0000009f

p0_label_201:
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1408] = ff0000ff, %l6 = 000000000000009f
	swapa	[%i3+%o4]0x81,%l6	! %l6 = 00000000ff0000ff
!	%l1 = 0000000078059fff, Mem[0000000010041400] = 00000000
	stba	%l1,[%i1+%g0]0x80	! Mem[0000000010041400] = ff000000
!	%f0  = 9f000000 0000001c, Mem[0000000010081428] = fb20c306 f23f9a66, %asi = 80
	stda	%f0 ,[%i2+0x028]%asi	! Mem[0000000010081428] = 9f000000 0000001c
!	%l6 = 00000000ff0000ff, Mem[0000000010001400] = 1c000000, %asi = 80
	stwa	%l6,[%i0+0x000]%asi	! Mem[0000000010001400] = ff0000ff
!	%l5 = 1c0000000000009f, Mem[0000000030181408] = 000000ff
	stba	%l5,[%i6+%o4]0x89	! Mem[0000000030181408] = 0000009f
!	Mem[00000000211c0001] = 00ff8f28, %l0 = ffffffffffffffff
	ldstuba	[%o2+0x001]%asi,%l0	! %l0 = 00000000000000ff
!	%l2 = ffffffffffffffff, Mem[0000000030001408] = ff9f0578
	stwa	%l2,[%i0+%o4]0x81	! Mem[0000000030001408] = ffffffff
!	%l6 = ff0000ff, %l7 = 0000009f, Mem[00000000300c1410] = 1c000000 0000009f
	stda	%l6,[%i3+%o5]0x81	! Mem[00000000300c1410] = ff0000ff 0000009f
!	%l5 = 1c0000000000009f, Mem[00000000300c1410] = ff0000ff
	stba	%l5,[%i3+%o5]0x89	! Mem[00000000300c1410] = ff00009f
!	Mem[000000001000143a] = 00000000, %l5 = 1c0000000000009f
	ldstub	[%i0+0x03a],%l5		! %l5 = 0000000000000000

p0_label_202:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = 000000ff, %f22 = 0e7254a0
	lda	[%i1+%g0]0x88,%f22	! %f22 = 000000ff
!	Mem[0000000030101400] = 2be9481200000000, %f22 = 000000ff 537d1e31
	ldda	[%i4+%g0]0x89,%f22	! %f22 = 2be94812 00000000
!	Mem[0000000010181410] = ff000000, %l5 = 0000000000000000
	lduwa	[%i6+%o5]0x80,%l5	! %l5 = 00000000ff000000
!	Mem[00000000300c1408] = 9f000000, %l5 = 00000000ff000000
	lduwa	[%i3+%o4]0x89,%l5	! %l5 = 000000009f000000
!	Mem[00000000211c0000] = 00ff8f28, %l6 = 00000000ff0000ff
	ldsh	[%o2+%g0],%l6		! %l6 = 00000000000000ff
!	Mem[0000000030001410] = 00000000, %l7 = 000000000000009f
	lduba	[%i0+%o5]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000030141400] = 32000000, %f11 = 3899ff13
	lda	[%i5+%g0]0x81,%f11	! %f11 = 32000000
!	Mem[0000000010141400] = 3b000000, %l7 = 0000000000000000
	lduba	[%i5+%g0]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000010081438] = d11f0772, %l0 = 00000000000000ff, %asi = 80
	lduwa	[%i2+0x038]%asi,%l0	! %l0 = 00000000d11f0772
!	Mem[00000000300c1410] = 9f0000ff, %l2 = ffffffffffffffff
	lduba	[%i3+%o5]0x81,%l2	! %l2 = 000000000000009f

p0_label_203:
!	Starting 10 instruction Store Burst
!	Mem[0000000010141410] = 00000000, %l7 = 0000000000000000
	ldstuba	[%i5+%o5]0x88,%l7	! %l7 = 0000000000000000
!	%f19 = ff9d1c37, Mem[0000000010001400] = ff0000ff
	sta	%f19,[%i0+%g0]0x88	! Mem[0000000010001400] = ff9d1c37
!	%l1 = 0000000078059fff, Mem[0000000030181408] = 9f000000ffffffff
	stxa	%l1,[%i6+%o4]0x81	! Mem[0000000030181408] = 0000000078059fff
!	%l0 = 00000000d11f0772, Mem[00000000100c1400] = 000013ff
	stwa	%l0,[%i3+%g0]0x80	! Mem[00000000100c1400] = d11f0772
!	%f22 = 2be94812 00000000, Mem[0000000010001410] = ffffffff 00000011
	stda	%f22,[%i0+%o5]0x80	! Mem[0000000010001410] = 2be94812 00000000
!	%f28 = 0000005d 45652dc9, Mem[00000000300c1410] = 9f0000ff 0000009f
	stda	%f28,[%i3+%o5]0x81	! Mem[00000000300c1410] = 0000005d 45652dc9
!	Mem[0000000010181400] = 00000000 fb200000 00000000 00d5515b
!	%f0  = 9f000000 0000001c 00000000 00000000
!	%f4  = 00000000 0000009f ffffffff 00000011
!	%f8  = 0000005d 00000032 000000ff 32000000
!	%f12 = 9f000000 002a0000 00000000 fc00ffff
	stda	%f0 ,[%i6+%g0]ASI_BLK_AIUPL	! Block Store to 0000000010181400
!	%l5 = 000000009f000000, Mem[0000000030041410] = 0000000f
	stwa	%l5,[%i1+%o5]0x89	! Mem[0000000030041410] = 9f000000
!	Mem[0000000010041430] = 00000000, %l2 = 0000009f, %l3 = 00000000
	add	%i1,0x30,%g1
	casa	[%g1]0x80,%l2,%l3	! %l3 = 0000000000000000
!	%l6 = 00000000000000ff, Mem[00000000300c1410] = 0000005d45652dc9
	stxa	%l6,[%i3+%o5]0x81	! Mem[00000000300c1410] = 00000000000000ff

p0_label_204:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = 1c00000f, %l4 = 000000000b48cfff
	ldsba	[%i4+%o5]0x80,%l4	! %l4 = 000000000000001c
!	Mem[00000000100c1408] = ff8d183b, %l7 = 0000000000000000, %asi = 80
	ldsba	[%i3+0x008]%asi,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010001408] = ff188db0, %l1 = 0000000078059fff
	ldsba	[%i0+%o4]0x80,%l1	! %l1 = ffffffffffffffff
	membar	#Sync			! Added by membar checker (42)
!	Mem[000000001018142c] = ff000000, %l4 = 000000000000001c, %asi = 80
	lduwa	[%i6+0x02c]%asi,%l4	! %l4 = 00000000ff000000
!	Mem[00000000100c1408] = 3b188dff, %l7 = ffffffffffffffff
	ldsha	[%i3+%o4]0x88,%l7	! %l7 = ffffffffffff8dff
!	Mem[00000000201c0000] = 3bff9298, %l1 = ffffffffffffffff, %asi = 80
	lduha	[%o0+0x000]%asi,%l1	! %l1 = 0000000000003bff
!	%f15 = fc00ffff, %f19 = ff9d1c37
	fcmps	%fcc2,%f15,%f19		! %fcc2 = 3
!	Mem[00000000300c1400] = 00000000, %l4 = 00000000ff000000
	ldswa	[%i3+%g0]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000010041408] = 000000001248e900, %f4  = 00000000 0000009f
	ldda	[%i1+%o4]0x88,%f4 	! %f4  = 00000000 1248e900
!	Mem[0000000030181408] = 00000000, %l3 = 0000000000000000
	swapa	[%i6+%o4]0x81,%l3	! %l3 = 0000000000000000

p0_label_205:
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000000000, Mem[0000000030001410] = 00000000
	stba	%l4,[%i0+%o5]0x81	! Mem[0000000030001410] = 00000000
!	%l3 = 0000000000000000, Mem[0000000030141400] = 00000032
	stba	%l3,[%i5+%g0]0x89	! Mem[0000000030141400] = 00000000
!	%l5 = 000000009f000000, Mem[0000000030181400] = ff000000
	stba	%l5,[%i6+%g0]0x81	! Mem[0000000030181400] = 00000000
!	Mem[0000000010101419] = 00000000, %l3 = 0000000000000000
	ldstuba	[%i4+0x019]%asi,%l3	! %l3 = 0000000000000000
!	%l4 = 00000000, %l5 = 9f000000, Mem[0000000010101408] = ff00005b 00000000
	stda	%l4,[%i4+%o4]0x80	! Mem[0000000010101408] = 00000000 9f000000
!	%l4 = 00000000, %l5 = 9f000000, Mem[0000000030181400] = 00000000 002a0000
	stda	%l4,[%i6+%g0]0x81	! Mem[0000000030181400] = 00000000 9f000000
!	Mem[0000000010101400] = ff000000, %l7 = ffffffffffff8dff
	ldstuba	[%i4+%g0]0x80,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030101400] = 00000000, %l6 = 00000000000000ff
	swapa	[%i4+%g0]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000030081408] = 00003c50, %l3 = 0000000000000000
	ldstuba	[%i2+%o4]0x81,%l3	! %l3 = 0000000000000000
!	%f14 = 00000000 fc00ffff, Mem[0000000030001400] = 00000000 fccf480b
	stda	%f14,[%i0+%g0]0x89	! Mem[0000000030001400] = 00000000 fc00ffff

p0_label_206:
!	Starting 10 instruction Load Burst
!	%f8  = 0000005d, %f5  = 1248e900, %f6  = ffffffff
	fsubs	%f8 ,%f5 ,%f6 		! tt=0x22, %l0 = 00000000d11f0794
!	Mem[0000000010081400] = ff000000 00000000 0000005d b03b183b
!	Mem[0000000010081410] = 00000000 000000ff ffffffff ffffffff
!	Mem[0000000010081420] = 0000476c 1b62e111 9f000000 0000001c
!	Mem[0000000010081430] = ff000066 5efcd93b d11f0772 c0e2991c
	ldda	[%i2+%g0]ASI_BLK_AIUPL,%f16	! Block Load from 0000000010081400
!	Mem[0000000010001400] = 371c9dff00000000, %f6  = ffffffff 00000011, %asi = 80
	ldda	[%i0+0x000]%asi,%f6 	! %f6  = 371c9dff 00000000
!	Mem[0000000030181410] = 1f4e0e4cffff00fc, %f6  = 371c9dff 00000000
	ldda	[%i6+%o5]0x89,%f6 	! %f6  = 1f4e0e4c ffff00fc
!	Mem[000000001018141f] = ffffffff, %l1 = 0000000000003bff
	ldub	[%i6+0x01f],%l1		! %l1 = 00000000000000ff
!	Mem[000000001014141c] = ffdfe0eb, %l3 = 0000000000000000, %asi = 80
	ldsba	[%i5+0x01c]%asi,%l3	! %l3 = ffffffffffffffff
!	Mem[00000000300c1400] = 00000000, %l2 = 000000000000009f
	lduha	[%i3+%g0]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000030141400] = 00000000, %l2 = 0000000000000000
	lduba	[%i5+%g0]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000010001400] = ff9d1c37, %f5  = 1248e900
	lda	[%i0+%g0]0x88,%f5 	! %f5 = ff9d1c37
!	Mem[0000000030101400] = 000000ff, %l6 = 0000000000000000
	lduwa	[%i4+%g0]0x89,%l6	! %l6 = 00000000000000ff

p0_label_207:
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (43)
!	%l0 = 00000000d11f0794, Mem[0000000010081400] = ff000000
	stba	%l0,[%i2+%g0]0x80	! Mem[0000000010081400] = 94000000
!	Mem[0000000030101408] = ff00aab2, %l1 = 00000000000000ff
	ldstuba	[%i4+%o4]0x81,%l1	! %l1 = 00000000000000ff
!	%l4 = 0000000000000000, Mem[0000000030181408] = 00000000
	stha	%l4,[%i6+%o4]0x89	! Mem[0000000030181408] = 00000000
!	%l0 = 00000000d11f0794, Mem[0000000010001400] = 371c9dff
	stwa	%l0,[%i0+%g0]0x80	! Mem[0000000010001400] = d11f0794
!	%f1  = 0000001c, Mem[0000000010181408] = 00000000
	st	%f1 ,[%i6+%o4]		! Mem[0000000010181408] = 0000001c
!	%l4 = 0000000000000000, Mem[0000000030181400] = 000000009f000000
	stxa	%l4,[%i6+%g0]0x81	! Mem[0000000030181400] = 0000000000000000
!	Mem[00000000211c0001] = 00ff8f28, %l0 = 00000000d11f0794
	ldstuba	[%o2+0x001]%asi,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030101400] = 000000ff, %l7 = 00000000000000ff
	swapa	[%i4+%g0]0x89,%l7	! %l7 = 00000000000000ff
!	%l6 = 00000000000000ff, Mem[0000000030141408] = 1c00000fff9d1c37
	stxa	%l6,[%i5+%o4]0x81	! Mem[0000000030141408] = 00000000000000ff
!	%f11 = 32000000, Mem[00000000300c1400] = 00000000
	sta	%f11,[%i3+%g0]0x81	! Mem[00000000300c1400] = 32000000

p0_label_208:
!	Starting 10 instruction Load Burst
!	Mem[0000000021800001] = 1a90db58, %l4 = 0000000000000000, %asi = 80
	lduba	[%o3+0x001]%asi,%l4	! %l4 = 0000000000000090
!	Mem[000000001000142e] = 00000058, %l2 = 0000000000000000
	ldsh	[%i0+0x02e],%l2		! %l2 = 0000000000000058
!	Mem[0000000010181403] = 1c000000, %l5 = 000000009f000000
	ldsb	[%i6+0x003],%l5		! %l5 = 0000000000000000
!	Mem[0000000010041408] = 00e94812, %l4 = 0000000000000090
	lduha	[%i1+%o4]0x80,%l4	! %l4 = 00000000000000e9
!	Mem[0000000010141408] = 00000000, %l6 = 00000000000000ff
	ldsha	[%i5+%o4]0x80,%l6	! %l6 = 0000000000000000
!	Mem[00000000100c1410] = 0000ff00, %l3 = ffffffffffffffff
	ldsha	[%i3+%o5]0x88,%l3	! %l3 = ffffffffffffff00
!	Mem[0000000010101422] = ff000000, %l0 = 00000000000000ff
	lduh	[%i4+0x022],%l0		! %l0 = 0000000000000000
!	Mem[00000000100c1418] = 09c05727 1248e92b, %l6 = 00000000, %l7 = 000000ff
	ldd	[%i3+0x018],%l6		! %l6 = 0000000009c05727 000000001248e92b
!	Code Fragment 3, seed = 916570
p0_fragment_14:
!	%l0 = 0000000000000000
	setx	0x244b052678b50f56,%g7,%l0 ! %l0 = 244b052678b50f56
!	%l1 = 00000000000000ff
	setx	0x129fd8530b5b5c81,%g7,%l1 ! %l1 = 129fd8530b5b5c81
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 244b052678b50f56
	setx	0xefbd2d4cd517bdbc,%g7,%l0 ! %l0 = efbd2d4cd517bdbc
!	%l1 = 129fd8530b5b5c81
	setx	0x8cb94c2c72ab3607,%g7,%l1 ! %l1 = 8cb94c2c72ab3607
p0_fragment_14_end:
!	Mem[0000000030001410] = 00000000, %l5 = 0000000000000000
	ldsha	[%i0+%o5]0x81,%l5	! %l5 = 0000000000000000

p0_label_209:
!	Starting 10 instruction Store Burst
!	%f20 = ff000000 00000000, %l0 = efbd2d4cd517bdbc
!	Mem[0000000030101420] = 67ccc44063f38b51
	add	%i4,0x020,%g1
	stda	%f20,[%g1+%l0]ASI_PST16_SL ! Mem[0000000030101420] = 67ccc440000000ff
!	Mem[0000000030081408] = ff003c50, %l7 = 000000001248e92b
	ldstuba	[%i2+%o4]0x81,%l7	! %l7 = 00000000000000ff
!	%f25 = 6c470000, Mem[0000000010041408] = 00e94812
	sta	%f25,[%i1+0x008]%asi	! Mem[0000000010041408] = 6c470000
!	%l0 = efbd2d4cd517bdbc, Mem[0000000010101400] = ff000000
	sth	%l0,[%i4+%g0]		! Mem[0000000010101400] = bdbc0000
!	%l4 = 000000e9, %l5 = 00000000, Mem[00000000300c1410] = 00000000 000000ff
	stda	%l4,[%i3+%o5]0x81	! Mem[00000000300c1410] = 000000e9 00000000
!	Mem[0000000030081408] = 503c00ff, %l3 = ffffffffffffff00
	ldstuba	[%i2+%o4]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010081410] = 00000000, %l3 = 00000000000000ff
	ldstuba	[%i2+%o5]0x88,%l3	! %l3 = 0000000000000000
!	%f7  = ffff00fc, Mem[0000000030001408] = ffffffff
	sta	%f7 ,[%i0+%o4]0x81	! Mem[0000000030001408] = ffff00fc
!	%l1 = 8cb94c2c72ab3607, Mem[0000000030081410] = ff0000ff
	stba	%l1,[%i2+%o5]0x81	! Mem[0000000030081410] = 070000ff
!	Mem[00000000100c1434] = 000000ff, %l3 = 00000000, %l3 = 00000000
	add	%i3,0x34,%g1
	casa	[%g1]0x80,%l3,%l3	! %l3 = 00000000000000ff

p0_label_210:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = 6c470000 00000000, %l6 = 09c05727, %l7 = 000000ff
	ldd	[%i1+%o4],%l6		! %l6 = 000000006c470000 0000000000000000
!	Mem[00000000201c0000] = 3bff9298, %l6 = 000000006c470000
	lduh	[%o0+%g0],%l6		! %l6 = 0000000000003bff
!	Mem[0000000030181410] = ffff00fc, %l0 = efbd2d4cd517bdbc
	ldsha	[%i6+%o5]0x89,%l0	! %l0 = 00000000000000fc
!	Mem[0000000030041410] = 0000009f, %l7 = 0000000000000000
	ldsha	[%i1+%o5]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000030081408] = ff003c50 000000ff, %l4 = 000000e9, %l5 = 00000000
	ldda	[%i2+%o4]0x81,%l4	! %l4 = 00000000ff003c50 00000000000000ff
!	Mem[0000000010081420] = 0000476c, %l2 = 0000000000000058
	lduh	[%i2+0x020],%l2		! %l2 = 0000000000000000
!	Mem[0000000010081410] = ff000000 000000ff, %l4 = ff003c50, %l5 = 000000ff
	ldda	[%i2+%o5]0x80,%l4	! %l4 = 00000000ff000000 00000000000000ff
!	Mem[0000000030081408] = 503c00ff, %l0 = 00000000000000fc
	ldswa	[%i2+%o4]0x89,%l0	! %l0 = 00000000503c00ff
!	Mem[0000000010141410] = 000000ff, %l4 = 00000000ff000000
	lduha	[%i5+%o5]0x88,%l4	! %l4 = 00000000000000ff
!	%l4 = 00000000000000ff, imm = 000000000000019e, %l5 = 00000000000000ff
	xnor	%l4,0x19e,%l5		! %l5 = fffffffffffffe9e

p0_label_211:
!	Starting 10 instruction Store Burst
!	%f8  = 0000005d 00000032, %l4 = 00000000000000ff
!	Mem[0000000010001408] = ff188db000ff446a
	add	%i0,0x008,%g1
	stda	%f8,[%g1+%l4]ASI_PST16_PL ! Mem[0000000010001408] = 320000005d000000
!	Mem[0000000030181408] = 00000000, %l3 = 00000000000000ff
	ldstuba	[%i6+%o4]0x81,%l3	! %l3 = 0000000000000000
!	%l7 = 0000000000000000, Mem[0000000030141408] = 00000000
	stha	%l7,[%i5+%o4]0x89	! Mem[0000000030141408] = 00000000
!	Mem[0000000010081400] = 94000000, %l5 = fffffffffffffe9e
	ldstuba	[%i2+%g0]0x80,%l5	! %l5 = 0000000000000094
!	%f0  = 9f000000 0000001c, Mem[00000000100c1400] = 72071fd1 00000000
	stda	%f0 ,[%i3+%g0]0x88	! Mem[00000000100c1400] = 9f000000 0000001c
!	%l6 = 0000000000003bff, imm = fffffffffffffd5f, %l1 = 8cb94c2c72ab3607
	or	%l6,-0x2a1,%l1		! %l1 = ffffffffffffffff
!	%l3 = 0000000000000000, Mem[0000000030141408] = 00000000
	stwa	%l3,[%i5+%o4]0x81	! Mem[0000000030141408] = 00000000
!	Mem[0000000010101404] = 1b62e111, %l3 = 0000000000000000, %asi = 80
	swapa	[%i4+0x004]%asi,%l3	! %l3 = 000000001b62e111
!	%l6 = 0000000000003bff, Mem[0000000010081435] = 5efcd93b, %asi = 80
	stba	%l6,[%i2+0x035]%asi	! Mem[0000000010081434] = 5effd93b
!	%l7 = 0000000000000000, Mem[0000000030101408] = 09c05727b2aa00ff
	stxa	%l7,[%i4+%o4]0x89	! Mem[0000000030101408] = 0000000000000000

p0_label_212:
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = 00000000, %l7 = 0000000000000000
	ldswa	[%i0+%o5]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000010101400] = bdbc0000, %l0 = 00000000503c00ff
	lduha	[%i4+%g0]0x80,%l0	! %l0 = 000000000000bdbc
!	Mem[0000000030081400] = 1c00000000000000, %f30 = 1c99e2c0 72071fd1
	ldda	[%i2+%g0]0x81,%f30	! %f30 = 1c000000 00000000
!	Mem[00000000100c1400] = 0000001c, %l7 = 0000000000000000
	lduba	[%i3+%g0]0x88,%l7	! %l7 = 000000000000001c
!	Mem[0000000030141400] = 000000005d000000, %f2  = 00000000 00000000
	ldda	[%i5+%g0]0x81,%f2 	! %f2  = 00000000 5d000000
!	Mem[0000000010041408] = 6c47000000000000, %l3 = 000000001b62e111, %asi = 80
	ldxa	[%i1+0x008]%asi,%l3	! %l3 = 6c47000000000000
!	Mem[0000000010181408] = 1c000000, %l3 = 6c47000000000000
	lduwa	[%i6+%o4]0x88,%l3	! %l3 = 000000001c000000
!	Mem[0000000030181410] = fc00ffff, %f11 = 32000000
	lda	[%i6+%o5]0x81,%f11	! %f11 = fc00ffff
!	Mem[0000000030101400] = 000000ff, %l2 = 0000000000000000
	ldsba	[%i4+%g0]0x89,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000010101419] = 00ff0000, %l0 = 000000000000bdbc
	ldub	[%i4+0x019],%l0		! %l0 = 00000000000000ff

p0_label_213:
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1410] = 000000e9, %l2 = 00000000ffffffff
	swapa	[%i3+%o5]0x81,%l2	! %l2 = 00000000000000e9
!	%l4 = 00000000000000ff, Mem[0000000010101410] = 1c00000f
	stha	%l4,[%i4+%o5]0x80	! Mem[0000000010101410] = 00ff000f
!	%l5 = 0000000000000094, Mem[0000000010101408] = 00000000
	stwa	%l5,[%i4+%o4]0x88	! Mem[0000000010101408] = 00000094
!	%l2 = 00000000000000e9, Mem[0000000010001410] = 2be94812
	stba	%l2,[%i0+%o5]0x80	! Mem[0000000010001410] = e9e94812
!	Mem[0000000010041418] = 000000ff, %l7 = 000000000000001c
	ldstuba	[%i1+0x018]%asi,%l7	! %l7 = 0000000000000000
!	Mem[0000000010001410] = e9e94812, %l6 = 0000000000003bff
	ldsw	[%i0+%o5],%l6		! %l6 = ffffffffe9e94812
!	%l4 = 00000000000000ff, Mem[0000000030041408] = 00000000
	stha	%l4,[%i1+%o4]0x89	! Mem[0000000030041408] = 000000ff
!	Mem[0000000010041414] = 0000001c, %l7 = 0000000000000000, %asi = 80
	swapa	[%i1+0x014]%asi,%l7	! %l7 = 000000000000001c
!	%l7 = 000000000000001c, Mem[0000000010101410] = 00ff000fff9d1c37
	stx	%l7,[%i4+%o5]		! Mem[0000000010101410] = 000000000000001c
!	%l4 = 000000ff, %l5 = 00000094, Mem[0000000030001410] = 00000000 7ef6ffff
	stda	%l4,[%i0+%o5]0x89	! Mem[0000000030001410] = 000000ff 00000094

p0_label_214:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141431] = fccf480b, %l2 = 00000000000000e9
	ldub	[%i5+0x031],%l2		! %l2 = 00000000000000cf
!	Mem[00000000100c1410] = 00ff0000, %l5 = 0000000000000094
	ldswa	[%i3+%o5]0x80,%l5	! %l5 = 0000000000ff0000
!	Mem[0000000030181408] = 000000ff, %l1 = ffffffffffffffff
	ldsha	[%i6+%o4]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010141410] = 00000000 000000ff, %l6 = e9e94812, %l7 = 0000001c
	ldda	[%i5+%o5]0x88,%l6	! %l6 = 00000000000000ff 0000000000000000
!	Mem[000000001008141a] = ffffffff, %l2 = 00000000000000cf
	ldsh	[%i2+0x01a],%l2		! %l2 = ffffffffffffffff
!	Mem[0000000010081410] = ff000000, %l6 = 00000000000000ff
	ldsba	[%i2+%o5]0x80,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000030081410] = 2be94812ff000007, %l2 = ffffffffffffffff
	ldxa	[%i2+%o5]0x89,%l2	! %l2 = 2be94812ff000007
!	Mem[00000000211c0000] = 00ff8f28, %l2 = 2be94812ff000007
	lduh	[%o2+%g0],%l2		! %l2 = 00000000000000ff
!	Mem[0000000021800180] = ffff5078, %l5 = 0000000000ff0000, %asi = 80
	ldsha	[%o3+0x180]%asi,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000010081434] = 5effd93b, %f22 = ffffffff
	ld	[%i2+0x034],%f22	! %f22 = 5effd93b

p0_label_215:
!	Starting 10 instruction Store Burst
!	Mem[0000000030041400] = 00000000, %l7 = 0000000000000000
	ldstuba	[%i1+%g0]0x81,%l7	! %l7 = 0000000000000000
!	%l0 = 00000000000000ff, Mem[0000000010141408] = ff00000000000000
	stxa	%l0,[%i5+%o4]0x88	! Mem[0000000010141408] = 00000000000000ff
!	Mem[00000000218001c0] = 11ff80a8, %l4 = 00000000000000ff
	ldstuba	[%o3+0x1c0]%asi,%l4	! %l4 = 0000000000000011
!	%l3 = 000000001c000000, Mem[0000000010001410] = e9e94812, %asi = 80
	stwa	%l3,[%i0+0x010]%asi	! Mem[0000000010001410] = 1c000000
!	%l3 = 000000001c000000, Mem[00000000300c1400] = 3200000000000000
	stxa	%l3,[%i3+%g0]0x81	! Mem[00000000300c1400] = 000000001c000000
!	%f12 = 9f000000 002a0000, %l7 = 0000000000000000
!	Mem[00000000300c1428] = 13ff993800000058
	add	%i3,0x028,%g1
	stda	%f12,[%g1+%l7]ASI_PST8_SL ! Mem[00000000300c1428] = 13ff993800000058
!	%f12 = 9f000000, Mem[0000000010141408] = 000000ff
	sta	%f12,[%i5+%o4]0x88	! Mem[0000000010141408] = 9f000000
!	Mem[00000000100c1420] = 3b908db0, %l2 = 00000000000000ff
	swap	[%i3+0x020],%l2		! %l2 = 000000003b908db0
!	%l7 = 0000000000000000, imm = 0000000000000462, %l6 = ffffffffffffffff
	and	%l7,0x462,%l6		! %l6 = 0000000000000000
!	Mem[00000000211c0000] = 00ff8f28, %l6 = 0000000000000000
	ldstub	[%o2+%g0],%l6		! %l6 = 0000000000000000

p0_label_216:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001414] = 00000000, %l6 = 0000000000000000
	lduw	[%i0+0x014],%l6		! %l6 = 0000000000000000
!	Mem[0000000030181408] = ff000000, %l3 = 000000001c000000
	lduha	[%i6+%o4]0x81,%l3	! %l3 = 000000000000ff00
!	%l7 = 0000000000000000, %l0 = 00000000000000ff, %l7 = 0000000000000000
	addc	%l7,%l0,%l7		! %l7 = 00000000000000ff
!	Mem[0000000030181400] = 0000000000000000, %l2 = 000000003b908db0
	ldxa	[%i6+%g0]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000030181410] = fc00ffff, %l0 = 00000000000000ff
	ldsba	[%i6+%o5]0x81,%l0	! %l0 = fffffffffffffffc
!	Mem[0000000010101410] = 00000000, %l1 = 00000000000000ff
	ldsba	[%i4+%o5]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000010141408] = 0000009f00000000, %l5 = ffffffffffffffff
	ldxa	[%i5+%o4]0x80,%l5	! %l5 = 0000009f00000000
!	Mem[0000000030001408] = ffff00fc00000000, %f18 = 3b183bb0 5d000000
	ldda	[%i0+%o4]0x81,%f18	! %f18 = ffff00fc 00000000
!	Mem[0000000030001400] = fc00ffff, %l4 = 0000000000000011
	ldsba	[%i0+%g0]0x89,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010041408] = 0000476c, %l7 = 00000000000000ff
	lduwa	[%i1+%o4]0x88,%l7	! %l7 = 000000000000476c

p0_label_217:
!	Starting 10 instruction Store Burst
!	%l6 = 0000000000000000, %l1 = 0000000000000000, %l4 = ffffffffffffffff
	or	%l6,%l1,%l4		! %l4 = 0000000000000000
!	Mem[00000000300c1410] = ffffffff, %l3 = 000000000000ff00
	swapa	[%i3+%o5]0x89,%l3	! %l3 = 00000000ffffffff
!	Mem[00000000300c1400] = 00000000, %l2 = 0000000000000000
	swapa	[%i3+%g0]0x89,%l2	! %l2 = 0000000000000000
!	%l4 = 0000000000000000, Mem[0000000010081400] = 000000ff
	stha	%l4,[%i2+%g0]0x88	! Mem[0000000010081400] = 00000000
!	Mem[0000000010141408] = 0000009f, %l3 = 00000000ffffffff
	ldstuba	[%i5+%o4]0x80,%l3	! %l3 = 0000000000000000
!	%f0  = 9f000000 0000001c, Mem[0000000010181428] = 00000032 ff000000
	std	%f0 ,[%i6+0x028]	! Mem[0000000010181428] = 9f000000 0000001c
!	Mem[0000000030081400] = 1c000000 00000000 ff003c50 000000ff
!	%f0  = 9f000000 0000001c 00000000 5d000000
!	%f4  = 00000000 ff9d1c37 1f4e0e4c ffff00fc
!	%f8  = 0000005d 00000032 000000ff fc00ffff
!	%f12 = 9f000000 002a0000 00000000 fc00ffff
	stda	%f0 ,[%i2+%g0]ASI_BLK_S	! Block Store to 0000000030081400
!	%f11 = fc00ffff, Mem[0000000030181408] = 000000ff
	sta	%f11,[%i6+%o4]0x89	! Mem[0000000030181408] = fc00ffff
!	%l7 = 000000000000476c, Mem[00000000211c0000] = ffff8f28, %asi = 80
	stha	%l7,[%o2+0x000]%asi	! Mem[00000000211c0000] = 476c8f28
!	%f9  = 00000032, Mem[00000000300c1400] = 00000000
	sta	%f9 ,[%i3+%g0]0x89	! Mem[00000000300c1400] = 00000032

p0_label_218:
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = ffff00fc00000000, %f28 = 3bd9fc5e 660000ff
	ldda	[%i0+%o4]0x81,%f28	! %f28 = ffff00fc 00000000
!	%l3 = 0000000000000000, %l3 = 0000000000000000, %l4 = 0000000000000000
	addc	%l3,%l3,%l4		! %l4 = 0000000000000000
!	Code Fragment 3, seed = 182924
p0_fragment_15:
!	%l0 = fffffffffffffffc
	setx	0xe5d831d4d3ed6fc6,%g7,%l0 ! %l0 = e5d831d4d3ed6fc6
!	%l1 = 0000000000000000
	setx	0x07a5c93d310291f1,%g7,%l1 ! %l1 = 07a5c93d310291f1
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = e5d831d4d3ed6fc6
	setx	0xc162314c8259b82c,%g7,%l0 ! %l0 = c162314c8259b82c
!	%l1 = 07a5c93d310291f1
	setx	0x549ecb973fb0e577,%g7,%l1 ! %l1 = 549ecb973fb0e577
p0_fragment_15_end:
!	Mem[0000000030181410] = 1f4e0e4c ffff00fc, %l0 = 8259b82c, %l1 = 3fb0e577
	ldda	[%i6+%o5]0x89,%l0	! %l0 = 00000000ffff00fc 000000001f4e0e4c
!	Mem[0000000030101408] = 0000000000000000, %l6 = 0000000000000000
	ldxa	[%i4+%o4]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000030141400] = 0000005d00000000, %f24 = 11e1621b 6c470000
	ldda	[%i5+%g0]0x89,%f24	! %f24 = 0000005d 00000000
!	Mem[00000000100c1438] = 00000000, %l2 = 0000000000000000, %asi = 80
	lduwa	[%i3+0x038]%asi,%l2	! %l2 = 0000000000000000
!	Mem[00000000300c1410] = 00ff0000 00000000, %l4 = 00000000, %l5 = 00000000
	ldda	[%i3+%o5]0x81,%l4	! %l4 = 0000000000ff0000 0000000000000000
	membar	#Sync			! Added by membar checker (44)
!	Mem[0000000010081410] = 000000ff, %l5 = 0000000000000000
	ldsha	[%i2+%o5]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[0000000020800001] = ffffeac8, %l5 = 00000000000000ff
	ldub	[%o1+0x001],%l5		! %l5 = 00000000000000ff

p0_label_219:
!	Starting 10 instruction Store Burst
!	Mem[0000000010041410] = 0000009f, %l0 = 00000000ffff00fc
	swapa	[%i1+%o5]0x88,%l0	! %l0 = 000000000000009f
!	%f16 = 00000000, Mem[0000000030141408] = 00000000
	sta	%f16,[%i5+%o4]0x89	! Mem[0000000030141408] = 00000000
!	%l0 = 0000009f, %l1 = 1f4e0e4c, Mem[0000000030081400] = 9f000000 0000001c
	stda	%l0,[%i2+%g0]0x81	! Mem[0000000030081400] = 0000009f 1f4e0e4c
!	Mem[0000000030001410] = ff000000, %l0 = 000000000000009f
	ldstuba	[%i0+%o5]0x81,%l0	! %l0 = 00000000000000ff
!	%l6 = 0000000000000000, Mem[0000000010141408] = ff00009f00000000
	stxa	%l6,[%i5+%o4]0x80	! Mem[0000000010141408] = 0000000000000000
!	%l2 = 00000000, %l3 = 00000000, Mem[0000000010041410] = fc00ffff 00000000
	stda	%l2,[%i1+%o5]0x80	! Mem[0000000010041410] = 00000000 00000000
!	%f18 = ffff00fc 00000000, Mem[0000000010181410] = 9f000000 00000000
	std	%f18,[%i6+%o5]		! Mem[0000000010181410] = ffff00fc 00000000
!	Mem[0000000010001400] = 94071fd1, %l7 = 000000000000476c
	swapa	[%i0+%g0]0x88,%l7	! %l7 = 0000000094071fd1
!	%l6 = 0000000000000000, Mem[0000000030141400] = 00000000
	stwa	%l6,[%i5+%g0]0x89	! Mem[0000000030141400] = 00000000
!	%l2 = 0000000000000000, Mem[0000000030041410] = 9f000000
	stha	%l2,[%i1+%o5]0x89	! Mem[0000000030041410] = 9f000000

p0_label_220:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = 00000000, %l0 = 00000000000000ff
	ldswa	[%i4+%o5]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000010181400] = 0000001c, %l0 = 0000000000000000
	ldsba	[%i6+%g0]0x88,%l0	! %l0 = 000000000000001c
!	%f21 = 00000000, %f8  = 0000005d
	fcmpes	%fcc3,%f21,%f8 		! %fcc3 = 1
!	Mem[00000000300c1410] = 00ff0000, %l1 = 000000001f4e0e4c
	lduha	[%i3+%o5]0x81,%l1	! %l1 = 00000000000000ff
!	%l3 = 0000000000000000, %l1 = 00000000000000ff, %l1 = 00000000000000ff
	addc	%l3,%l1,%l1		! %l1 = 00000000000000ff
!	Mem[00000000100c1408] = ff8d183b, %l0 = 000000000000001c
	ldswa	[%i3+%o4]0x80,%l0	! %l0 = ffffffffff8d183b
!	Mem[00000000100c1400] = 1c000000 0000009f ff8d183b 00000000
!	Mem[00000000100c1410] = 00ff0000 00000032 09c05727 1248e92b
!	Mem[00000000100c1420] = 000000ff 4cdb8901 00000000 0000009f
!	Mem[00000000100c1430] = 11d996ff 000000ff 00000000 00000000
	ldda	[%i3+%g0]ASI_BLK_AIUP,%f16	! Block Load from 00000000100c1400
!	Mem[0000000010001400] = 000000000000476c, %f0  = 9f000000 0000001c
	ldda	[%i0+%g0]0x88,%f0 	! %f0  = 00000000 0000476c
!	Mem[0000000030101410] = ffffffff, %l3 = 0000000000000000
	lduha	[%i4+%o5]0x81,%l3	! %l3 = 000000000000ffff
!	%l1 = 00000000000000ff, imm = 00000000000000b9, %l6 = 0000000000000000
	add	%l1,0x0b9,%l6		! %l6 = 00000000000001b8

p0_label_221:
!	Starting 10 instruction Store Burst
!	Mem[0000000010001410] = 0000001c, %l3 = 000000000000ffff
	swapa	[%i0+%o5]0x88,%l3	! %l3 = 000000000000001c
!	%l0 = ff8d183b, %l1 = 000000ff, Mem[0000000030101410] = ffffffff 00000011
	stda	%l0,[%i4+%o5]0x81	! Mem[0000000030101410] = ff8d183b 000000ff
!	Mem[0000000030081410] = 00000000, %l1 = 00000000000000ff
	swapa	[%i2+%o5]0x89,%l1	! %l1 = 0000000000000000
!	Mem[00000000100c1408] = ff8d183b, %l6 = 00000000000001b8
	ldstuba	[%i3+%o4]0x80,%l6	! %l6 = 00000000000000ff
!	%f20 = 00ff0000 00000032, Mem[0000000010081408] = 0000005d b03b183b
	stda	%f20,[%i2+%o4]0x80	! Mem[0000000010081408] = 00ff0000 00000032
!	%l0 = ffffffffff8d183b, Mem[0000000030181400] = 00000000
	stha	%l0,[%i6+%g0]0x89	! Mem[0000000030181400] = 0000183b
!	Mem[00000000211c0001] = 476c8f28, %l3 = 000000000000001c
	ldstub	[%o2+0x001],%l3		! %l3 = 000000000000006c
!	Mem[0000000010001400] = 6c470000, %l0 = 00000000ff8d183b
	swapa	[%i0+%g0]0x80,%l0	! %l0 = 000000006c470000
!	Mem[0000000010041438] = 00000000fffffff2, %l2 = 0000000000000000, %l5 = 00000000000000ff
	add	%i1,0x38,%g1
	casxa	[%g1]0x80,%l2,%l5	! %l5 = 00000000fffffff2
!	%l7 = 0000000094071fd1, Mem[00000000300c1400] = 00000032
	stha	%l7,[%i3+%g0]0x89	! Mem[00000000300c1400] = 00001fd1

p0_label_222:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041428] = 000000ff000066a2, %f14 = 00000000 fc00ffff, %asi = 80
	ldda	[%i1+0x028]%asi,%f14	! %f14 = 000000ff 000066a2
!	Mem[0000000010041428] = 000000ff000066a2, %l1 = 0000000000000000
	ldx	[%i1+0x028],%l1		! %l1 = 000000ff000066a2
!	Mem[0000000010001400] = 3b188dff, %l2 = 0000000000000000
	ldswa	[%i0+%g0]0x88,%l2	! %l2 = 000000003b188dff
!	Mem[0000000010141400] = 0000003b, %f15 = 000066a2
	lda	[%i5+%g0]0x80,%f15	! %f15 = 0000003b
!	Mem[0000000010101432] = 6a7a41ff, %l1 = 000000ff000066a2, %asi = 80
	ldsha	[%i4+0x032]%asi,%l1	! %l1 = 00000000000041ff
!	Mem[0000000030141400] = 00000000, %l6 = 00000000000000ff
	lduba	[%i5+%g0]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000010181430] = 00002a000000009f, %f2  = 00000000 5d000000
	ldd	[%i6+0x030],%f2 	! %f2  = 00002a00 0000009f
!	Mem[0000000010001408] = 32000000, %l4 = 0000000000ff0000
	ldswa	[%i0+%o4]0x80,%l4	! %l4 = 0000000032000000
!	Mem[00000000100c1407] = 0000009f, %l0 = 000000006c470000
	ldub	[%i3+0x007],%l0		! %l0 = 000000000000009f
!	Mem[0000000010141426] = 0000446a, %l3 = 000000000000006c
	lduh	[%i5+0x026],%l3		! %l3 = 000000000000446a

p0_label_223:
!	Starting 10 instruction Store Burst
!	Mem[0000000030041410] = 0000009f, %l2 = 000000003b188dff
	ldstuba	[%i1+%o5]0x81,%l2	! %l2 = 0000000000000000
!	%l7 = 0000000094071fd1, Mem[0000000030141400] = 00000000
	stha	%l7,[%i5+%g0]0x81	! Mem[0000000030141400] = 1fd10000
!	Mem[0000000030041410] = ff00009f, %l3 = 000000000000446a
	swapa	[%i1+%o5]0x81,%l3	! %l3 = 00000000ff00009f
!	%l1 = 00000000000041ff, Mem[0000000010101400] = 000000000000bcbd
	stxa	%l1,[%i4+%g0]0x88	! Mem[0000000010101400] = 00000000000041ff
!	%f6  = 1f4e0e4c ffff00fc, %l0 = 000000000000009f
!	Mem[0000000010081430] = ff0000665effd93b
	add	%i2,0x030,%g1
	stda	%f6,[%g1+%l0]ASI_PST16_P ! Mem[0000000010081430] = 1f4e0e4cffff00fc
!	Mem[0000000010001415] = 00000000, %l2 = 0000000000000000
	ldstub	[%i0+0x015],%l2		! %l2 = 0000000000000000
!	%l4 = 0000000032000000, Mem[0000000030101410] = 3b188dff
	stba	%l4,[%i4+%o5]0x89	! Mem[0000000030101410] = 3b188d00
!	%l2 = 00000000, %l3 = ff00009f, Mem[0000000030001400] = ffff00fc 00000000
	stda	%l2,[%i0+%g0]0x81	! Mem[0000000030001400] = 00000000 ff00009f
!	%l5 = 00000000fffffff2, Mem[0000000010001410] = 0000ffff
	stwa	%l5,[%i0+%o5]0x88	! Mem[0000000010001410] = fffffff2
!	%l4 = 0000000032000000, Mem[00000000218000c0] = fcffa7e8
	sth	%l4,[%o3+0x0c0]		! Mem[00000000218000c0] = 0000a7e8

p0_label_224:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001430] = 6a7a41fff94400ff, %l2 = 0000000000000000
	ldx	[%i0+0x030],%l2		! %l2 = 6a7a41fff94400ff
!	Mem[00000000100c1410] = 00ff0000, %l7 = 0000000094071fd1
	ldswa	[%i3+%o5]0x80,%l7	! %l7 = 0000000000ff0000
!	Mem[0000000010081408] = 00ff0000 00000032, %l4 = 32000000, %l5 = fffffff2
	ldda	[%i2+%o4]0x80,%l4	! %l4 = 0000000000ff0000 0000000000000032
!	%f3  = 0000009f, %f23 = 1248e92b
	fsqrts	%f3 ,%f23		! tt=0x22, %l0 = 00000000000000c1
!	Mem[0000000010141400] = 000000003b000000, %l0 = 00000000000000c1
	ldxa	[%i5+%g0]0x88,%l0	! %l0 = 000000003b000000
!	Mem[0000000030101400] = ff000000, %l3 = 00000000ff00009f
	lduba	[%i4+%g0]0x81,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030081410] = ff000000ff9d1c37, %l5 = 0000000000000032
	ldxa	[%i2+%o5]0x81,%l5	! %l5 = ff000000ff9d1c37
!	Mem[0000000010141408] = 00000000, %l5 = ff000000ff9d1c37
	lduha	[%i5+%o4]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000030001410] = 000000ff, %l3 = 00000000000000ff
	ldsha	[%i0+%o5]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010181410] = ffff00fc, %l6 = 0000000000000000
	lduha	[%i6+%o5]0x80,%l6	! %l6 = 000000000000ffff

p0_label_225:
!	Starting 10 instruction Store Burst
!	%l3 = 00000000000000ff, Mem[00000000211c0001] = 47ff8f28
	stb	%l3,[%o2+0x001]		! Mem[00000000211c0000] = 47ff8f28
!	%l7 = 0000000000ff0000, %l7 = 0000000000ff0000, %l2 = 6a7a41fff94400ff
	udivx	%l7,%l7,%l2		! %l2 = 0000000000000001
!	Mem[0000000030101408] = 00000000, %l2 = 0000000000000001
	ldstuba	[%i4+%o4]0x81,%l2	! %l2 = 0000000000000000
!	%l1 = 00000000000041ff, Mem[0000000010101400] = ff410000
	stha	%l1,[%i4+%g0]0x80	! Mem[0000000010101400] = 41ff0000
!	%f22 = 09c05727 1248e92b, Mem[0000000010041400] = ff000000 0000001c
	stda	%f22,[%i1+%g0]0x80	! Mem[0000000010041400] = 09c05727 1248e92b
!	%l5 = 0000000000000000, Mem[000000001000141a] = 58000000
	sth	%l5,[%i0+0x01a]		! Mem[0000000010001418] = 58000000
!	%f24 = 000000ff 4cdb8901, %l3 = 00000000000000ff
!	Mem[0000000030081410] = ff000000ff9d1c37
	add	%i2,0x010,%g1
	stda	%f24,[%g1+%l3]ASI_PST16_S ! Mem[0000000030081410] = 000000ff4cdb8901
!	%l6 = 000000000000ffff, Mem[0000000010041400] = 09c05727
	sth	%l6,[%i1+%g0]		! Mem[0000000010041400] = ffff5727
	membar	#Sync			! Added by membar checker (45)
!	%l1 = 00000000000041ff, Mem[00000000100c1400] = 1c000000
	stwa	%l1,[%i3+%g0]0x80	! Mem[00000000100c1400] = 000041ff
!	%l5 = 0000000000000000, Mem[00000000201c0000] = 3bff9298
	sth	%l5,[%o0+%g0]		! Mem[00000000201c0000] = 00009298

p0_label_226:
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = 0000183b, %f3  = 0000009f
	lda	[%i6+%g0]0x89,%f3 	! %f3 = 0000183b
!	Mem[0000000030081410] = ff000000, %l3 = 00000000000000ff
	lduwa	[%i2+%o5]0x89,%l3	! %l3 = 00000000ff000000
!	Mem[0000000010041408] = 6c470000, %l3 = 00000000ff000000
	lduwa	[%i1+%o4]0x80,%l3	! %l3 = 000000006c470000
!	Mem[0000000010101408] = 94000000, %l4 = 0000000000ff0000
	ldsba	[%i4+%o4]0x80,%l4	! %l4 = ffffffffffffff94
!	Mem[0000000010101400] = 41ff0000 00000000, %l2 = 00000000, %l3 = 6c470000
	ldd	[%i4+%g0],%l2		! %l2 = 0000000041ff0000 0000000000000000
!	Mem[0000000030041410] = 6a440000, %l4 = ffffffffffffff94
	lduwa	[%i1+%o5]0x89,%l4	! %l4 = 000000006a440000
!	Mem[0000000030001400] = 00000000, %l5 = 0000000000000000
	lduha	[%i0+%g0]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000010001400] = 3b188dff, %l4 = 000000006a440000
	lduba	[%i0+%g0]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010041410] = 00000000, %l0 = 000000003b000000
	lduha	[%i1+%o5]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000010041402] = ffff5727, %l4 = 00000000000000ff, %asi = 80
	lduba	[%i1+0x002]%asi,%l4	! %l4 = 0000000000000057

p0_label_227:
!	Starting 10 instruction Store Burst
!	%l7 = 0000000000ff0000, %l0 = 0000000000000000, %y  = 0000003b
	umul	%l7,%l0,%l2		! %l2 = 0000000000000000, %y = 00000000
!	Mem[0000000010101408] = 00000094, %l0 = 0000000000000000
	ldstuba	[%i4+%o4]0x88,%l0	! %l0 = 0000000000000094
!	%f8  = 0000005d 00000032, Mem[0000000010101408] = 000000ff 0000009f
	stda	%f8 ,[%i4+%o4]0x88	! Mem[0000000010101408] = 0000005d 00000032
!	Mem[0000000030001400] = 00000000, %l4 = 0000000000000057
	swapa	[%i0+%g0]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000010141408] = 00000000, %l2 = 0000000000000000
	swapa	[%i5+%o4]0x80,%l2	! %l2 = 0000000000000000
!	%f12 = 9f000000, %f18 = ff8d183b, %f29 = 000000ff
	fmuls	%f12,%f18,%f29		! %f29 = ffcd183b
!	%f27 = 0000009f, Mem[0000000010181408] = 0000001c
	sta	%f27,[%i6+%o4]0x80	! Mem[0000000010181408] = 0000009f
!	Mem[0000000030041408] = ff000000, %l7 = 0000000000ff0000
	ldstuba	[%i1+%o4]0x81,%l7	! %l7 = 00000000000000ff
!	%l2 = 0000000000000000, Mem[0000000030041400] = 00000000000000ff
	stxa	%l2,[%i1+%g0]0x89	! Mem[0000000030041400] = 0000000000000000
!	%l2 = 0000000000000000, Mem[0000000010001410] = f2ffffff00ff0000
	stx	%l2,[%i0+%o5]		! Mem[0000000010001410] = 0000000000000000

p0_label_228:
!	Starting 10 instruction Load Burst
!	Mem[0000000030181410] = fc00ffff, %l1 = 00000000000041ff
	lduha	[%i6+%o5]0x81,%l1	! %l1 = 000000000000fc00
!	Mem[0000000010041408] = 6c470000 00000000, %l2 = 00000000, %l3 = 00000000
	ldda	[%i1+%o4]0x80,%l2	! %l2 = 000000006c470000 0000000000000000
!	Mem[000000001018140d] = 00000000, %l1 = 000000000000fc00, %asi = 80
	ldsba	[%i6+0x00d]%asi,%l1	! %l1 = 0000000000000000
!	Mem[0000000020800040] = 11ff3ef8, %l5 = 0000000000000000
	ldsh	[%o1+0x040],%l5		! %l5 = 00000000000011ff
!	Mem[0000000030141410] = 456500ff, %l6 = 000000000000ffff
	ldsba	[%i5+%o5]0x89,%l6	! %l6 = ffffffffffffffff
!	Code Fragment 4, seed = 159393
p0_fragment_16:
!	%l0 = 0000000000000094
	setx	0xbe3614d34499741e,%g7,%l0 ! %l0 = be3614d34499741e
!	%l1 = 0000000000000000
	setx	0x3198f13f358846c9,%g7,%l1 ! %l1 = 3198f13f358846c9
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = be3614d34499741e
	setx	0x260e856e19b43584,%g7,%l0 ! %l0 = 260e856e19b43584
!	%l1 = 3198f13f358846c9
	setx	0x4f46b75c27cfc34f,%g7,%l1 ! %l1 = 4f46b75c27cfc34f
p0_fragment_16_end:
!	Mem[0000000010101408] = 00000032, %l4 = 0000000000000000
	lduha	[%i4+%o4]0x88,%l4	! %l4 = 0000000000000032
!	Code Fragment 3, seed = 571235
p0_fragment_17:
!	%l0 = 260e856e19b43584
	setx	0x2a4bd484dc95900e,%g7,%l0 ! %l0 = 2a4bd484dc95900e
!	%l1 = 4f46b75c27cfc34f
	setx	0xe481b41a13ec5fb9,%g7,%l1 ! %l1 = e481b41a13ec5fb9
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 2a4bd484dc95900e
	setx	0x25f9117d8f83bb74,%g7,%l0 ! %l0 = 25f9117d8f83bb74
!	%l1 = e481b41a13ec5fb9
	setx	0x872853e18f73263f,%g7,%l1 ! %l1 = 872853e18f73263f
p0_fragment_17_end:
!	%l1 = 872853e18f73263f, %l2 = 000000006c470000, %l6 = ffffffffffffffff
	subc	%l1,%l2,%l6		! %l6 = 872853e1232c263f
!	Mem[0000000030041408] = ff000000, %f14 = 000000ff
	lda	[%i1+%o4]0x81,%f14	! %f14 = ff000000

p0_label_229:
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000000032, Mem[000000001018142c] = 0000001c, %asi = 80
	stha	%l4,[%i6+0x02c]%asi	! Mem[000000001018142c] = 0032001c
!	%l6 = 872853e1232c263f, Mem[0000000030081410] = 000000ff
	stha	%l6,[%i2+%o5]0x81	! Mem[0000000030081410] = 263f00ff
!	Mem[0000000010081410] = ff000000, %l1 = 872853e18f73263f
	ldstuba	[%i2+%o5]0x80,%l1	! %l1 = 00000000000000ff
!	%f9  = 00000032, Mem[0000000030101400] = 000000ff
	sta	%f9 ,[%i4+%g0]0x89	! Mem[0000000030101400] = 00000032
!	%l4 = 00000032, %l5 = 000011ff, Mem[0000000010041430] = 00000000 00000000
	std	%l4,[%i1+0x030]		! Mem[0000000010041430] = 00000032 000011ff
!	%l6 = 872853e1232c263f, Mem[0000000030101410] = 008d183b
	stha	%l6,[%i4+%o5]0x81	! Mem[0000000030101410] = 263f183b
!	Mem[0000000010001400] = 3b188dff, %l1 = 00000000000000ff
	swapa	[%i0+%g0]0x88,%l1	! %l1 = 000000003b188dff
!	%l3 = 0000000000000000, Mem[0000000010041408] = 0000476c
	stha	%l3,[%i1+%o4]0x88	! Mem[0000000010041408] = 00000000
!	%l6 = 872853e1232c263f, Mem[0000000030181410] = fc00ffff
	stha	%l6,[%i6+%o5]0x81	! Mem[0000000030181410] = 263fffff
!	Mem[00000000218001c1] = ffff80a8, %l1 = 000000003b188dff
	ldstuba	[%o3+0x1c1]%asi,%l1	! %l1 = 00000000000000ff

p0_label_230:
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = 00000032, %l5 = 00000000000011ff
	lduwa	[%i4+%g0]0x89,%l5	! %l5 = 0000000000000032
!	Mem[00000000100c1408] = 3b188dff, %l2 = 000000006c470000
	ldsba	[%i3+%o4]0x88,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000010081410] = ff000000000000ff, %f28 = 11d996ff ffcd183b
	ldda	[%i2+%o5]0x80,%f28	! %f28 = ff000000 000000ff
!	%f18 = ff8d183b, %f25 = 4cdb8901
	fcmps	%fcc1,%f18,%f25		! %fcc1 = 3
!	Mem[0000000030001400] = 00000057, %l5 = 0000000000000032
	ldswa	[%i0+%g0]0x89,%l5	! %l5 = 0000000000000057
!	Mem[0000000010141410] = ff00000000000000, %f24 = 000000ff 4cdb8901, %asi = 80
	ldda	[%i5+0x010]%asi,%f24	! %f24 = ff000000 00000000
!	Mem[0000000010001408] = 0000005d00000032, %l5 = 0000000000000057
	ldxa	[%i0+%o4]0x88,%l5	! %l5 = 0000005d00000032
!	Mem[0000000030181410] = 263fffff, %l7 = 00000000000000ff
	ldsha	[%i6+%o5]0x81,%l7	! %l7 = 000000000000263f
!	Mem[0000000030081408] = 00000000, %l7 = 000000000000263f
	lduwa	[%i2+%o4]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000030041408] = ff000000, %f21 = 00000032
	lda	[%i1+%o4]0x81,%f21	! %f21 = ff000000

p0_label_231:
!	Starting 10 instruction Store Burst
!	%l2 = ffffffffffffffff, Mem[0000000030001400] = 57000000
	stha	%l2,[%i0+%g0]0x81	! Mem[0000000030001400] = ffff0000
!	Mem[0000000010101400] = 41ff000000000000, %l4 = 0000000000000032, %l3 = 0000000000000000
	casxa	[%i4]0x80,%l4,%l3	! %l3 = 41ff000000000000
!	%l4 = 00000032, %l5 = 00000032, Mem[0000000010101428] = fccf480b 000000ff, %asi = 80
	stda	%l4,[%i4+0x028]%asi	! Mem[0000000010101428] = 00000032 00000032
!	%l4 = 0000000000000032, Mem[0000000010141408] = 0000000000000000
	stxa	%l4,[%i5+%o4]0x88	! Mem[0000000010141408] = 0000000000000032
!	%l5 = 0000005d00000032, Mem[0000000010101438] = 000000000b48cffc, %asi = 80
	stxa	%l5,[%i4+0x038]%asi	! Mem[0000000010101438] = 0000005d00000032
!	%l0 = 25f9117d8f83bb74, Mem[0000000010181408] = 0000009f
	stba	%l0,[%i6+%o4]0x80	! Mem[0000000010181408] = 7400009f
!	Mem[00000000300c1408] = 9f000000, %l4 = 0000000000000032
	swapa	[%i3+%o4]0x89,%l4	! %l4 = 000000009f000000
!	Mem[00000000300c1410] = 0000ff00, %l2 = 00000000ffffffff
	swapa	[%i3+%o5]0x89,%l2	! %l2 = 000000000000ff00
!	%l1 = 00000000000000ff, immd = 000000000000052b, %l108 = 0000000000000000
	sdivx	%l1,0x52b,%l0		! %l0 = 0000000000000000
!	Mem[00000000100c1408] = 3b188dff, %l0 = 0000000000000000
	swapa	[%i3+%o4]0x88,%l0	! %l0 = 000000003b188dff

p0_label_232:
!	Starting 10 instruction Load Burst
!	%l7 = 0000000000000000, %l6 = 872853e1232c263f, %y  = 00000000
	udiv	%l7,%l6,%l6		! %l6 = 0000000000000000
	mov	%l0,%y			! %y = 3b188dff
!	%l0 = 000000003b188dff, Mem[0000000010141434] = 00000000, %asi = 80
	stwa	%l0,[%i5+0x034]%asi	! Mem[0000000010141434] = 3b188dff
!	Mem[0000000010001408] = 0000005d00000032, %f12 = 9f000000 002a0000
	ldda	[%i0+%o4]0x88,%f12	! %f12 = 0000005d 00000032
!	Mem[0000000010101408] = 32000000 5d000000, %l0 = 3b188dff, %l1 = 000000ff, %asi = 80
	ldda	[%i4+0x008]%asi,%l0	! %l0 = 0000000032000000 000000005d000000
!	Mem[0000000010181408] = 7400009f, %l6 = 0000000000000000
	lduwa	[%i6+%o4]0x80,%l6	! %l6 = 000000007400009f
!	Mem[0000000030041400] = 0000000000000000, %f14 = ff000000 0000003b
	ldda	[%i1+%g0]0x89,%f14	! %f14 = 00000000 00000000
!	Mem[0000000020800000] = ffffeac8, %l4 = 000000009f000000
	ldsh	[%o1+%g0],%l4		! %l4 = ffffffffffffffff
!	Mem[0000000010101408] = 0000005d00000032, %f26 = 00000000 0000009f
	ldda	[%i4+%o4]0x88,%f26	! %f26 = 0000005d 00000032
!	Mem[0000000030181408] = ffff00fc78059fff, %l1 = 000000005d000000
	ldxa	[%i6+%o4]0x81,%l1	! %l1 = ffff00fc78059fff
!	%l1 = ffff00fc78059fff, %l6 = 000000007400009f, %y  = 3b188dff
	umul	%l1,%l6,%l7		! %l7 = 36628cca177e5f61, %y = 36628cca

p0_label_233:
!	Starting 10 instruction Store Burst
!	Mem[0000000021800100] = ff47e418, %l3 = 41ff000000000000
	ldstuba	[%o3+0x100]%asi,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010001434] = f94400ff, %l3 = 000000ff, %l0 = 32000000
	add	%i0,0x34,%g1
	casa	[%g1]0x80,%l3,%l0	! %l0 = 00000000f94400ff
!	%f24 = ff000000, Mem[0000000030101400] = 00000032
	sta	%f24,[%i4+%g0]0x89	! Mem[0000000030101400] = ff000000
!	Mem[00000000211c0001] = 47ff8f28, %l7 = 36628cca177e5f61
	ldstub	[%o2+0x001],%l7		! %l7 = 00000000000000ff
!	%l4 = ffffffffffffffff, Mem[00000000211c0001] = 47ff8f28, %asi = 80
	stba	%l4,[%o2+0x001]%asi	! Mem[00000000211c0000] = 47ff8f28
!	Mem[0000000010041410] = 00000000, %l2 = 000000000000ff00
	swapa	[%i1+%o5]0x80,%l2	! %l2 = 0000000000000000
!	%l6 = 000000007400009f, Mem[0000000030081410] = 263f00ff4cdb8901
	stxa	%l6,[%i2+%o5]0x81	! Mem[0000000030081410] = 000000007400009f
!	%l0 = 00000000f94400ff, Mem[000000001004140c] = 00000000, %asi = 80
	stha	%l0,[%i1+0x00c]%asi	! Mem[000000001004140c] = 00ff0000
!	%f10 = 000000ff, Mem[0000000030101400] = ff000000
	sta	%f10,[%i4+%g0]0x89	! Mem[0000000030101400] = 000000ff
!	%l2 = 0000000000000000, Mem[0000000030101410] = 263f183b
	stha	%l2,[%i4+%o5]0x81	! Mem[0000000030101410] = 0000183b

p0_label_234:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = ff000000 00000000, %l2 = 00000000, %l3 = 000000ff
	ldda	[%i0+%g0]0x80,%l2	! %l2 = 00000000ff000000 0000000000000000
!	Mem[0000000030101408] = 000000ff, %l0 = 00000000f94400ff
	lduwa	[%i4+%o4]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030041408] = 000000ff, %l2 = 00000000ff000000
	lduha	[%i1+%o4]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030041408] = 000000ff, %l6 = 000000007400009f
	lduha	[%i1+%o4]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030141410] = ff006545 6853b85b, %l2 = 000000ff, %l3 = 00000000
	ldda	[%i5+%o5]0x81,%l2	! %l2 = 00000000ff006545 000000006853b85b
!	Mem[0000000030001408] = ffff00fc 00000000, %l6 = 000000ff, %l7 = 000000ff
	ldda	[%i0+%o4]0x81,%l6	! %l6 = 00000000ffff00fc 0000000000000000
!	Mem[0000000030101410] = ff0000003b180000, %l1 = ffff00fc78059fff
	ldxa	[%i4+%o5]0x89,%l1	! %l1 = ff0000003b180000
!	Mem[0000000010081408] = 00ff000000000032, %f4  = 00000000 ff9d1c37
	ldda	[%i2+%o4]0x80,%f4 	! %f4  = 00ff0000 00000032
!	Mem[0000000010041410] = 0000000000ff0000, %l3 = 000000006853b85b
	ldxa	[%i1+%o5]0x88,%l3	! %l3 = 0000000000ff0000
!	Mem[0000000010041400] = ffff57271248e92b, %l2 = 00000000ff006545
	ldxa	[%i1+%g0]0x80,%l2	! %l2 = ffff57271248e92b

p0_label_235:
!	Starting 10 instruction Store Burst
!	Mem[0000000010001418] = 580000003899ffff, %l0 = 00000000000000ff, %l6 = 00000000ffff00fc
	add	%i0,0x18,%g1
	casxa	[%g1]0x80,%l0,%l6	! %l6 = 580000003899ffff
!	%l5 = 0000005d00000032, Mem[0000000010101428] = 00000032, %asi = 80
	stha	%l5,[%i4+0x028]%asi	! Mem[0000000010101428] = 00320032
!	%l5 = 0000005d00000032, Mem[0000000010141400] = 0000003b
	stha	%l5,[%i5+%g0]0x80	! Mem[0000000010141400] = 0032003b
!	%l0 = 00000000000000ff, Mem[0000000010141410] = 000000ff
	stwa	%l0,[%i5+%o5]0x88	! Mem[0000000010141410] = 000000ff
!	%l1 = ff0000003b180000, Mem[000000001010142b] = 00320032, %asi = 80
	stba	%l1,[%i4+0x02b]%asi	! Mem[0000000010101428] = 00320000
!	%f6  = 1f4e0e4c ffff00fc, %l7 = 0000000000000000
!	Mem[0000000030181420] = 0189db4cb08d903b
	add	%i6,0x020,%g1
	stda	%f6,[%g1+%l7]ASI_PST8_S ! Mem[0000000030181420] = 0189db4cb08d903b
!	%f20 = 00ff0000 ff000000, Mem[0000000030141400] = 0000d11f 0000005d
	stda	%f20,[%i5+%g0]0x89	! Mem[0000000030141400] = 00ff0000 ff000000
!	Mem[0000000010101410] = 00000000, %l6 = 580000003899ffff
	ldstuba	[%i4+%o5]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000030041408] = ff000000, %l5 = 0000005d00000032
	ldstuba	[%i1+%o4]0x81,%l5	! %l5 = 00000000000000ff
!	%l1 = ff0000003b180000, Mem[0000000010141408] = 32000000
	stba	%l1,[%i5+%o4]0x80	! Mem[0000000010141408] = 00000000

p0_label_236:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101424] = 00000000, %l2 = ffff57271248e92b, %asi = 80
	lduwa	[%i4+0x024]%asi,%l2	! %l2 = 0000000000000000
!	Mem[00000000300c1408] = 32000000 0000446a, %l6 = 00000000, %l7 = 00000000
	ldda	[%i3+%o4]0x81,%l6	! %l6 = 0000000032000000 000000000000446a
!	%f7  = ffff00fc, %f23 = 1248e92b, %f28 = ff000000
	fsubs	%f7 ,%f23,%f28		! %f28 = ffff00fc
!	Mem[00000000300c1410] = ffffffff, %l5 = 00000000000000ff
	lduha	[%i3+%o5]0x89,%l5	! %l5 = 000000000000ffff
!	Mem[0000000010001408] = 0000005d 00000032, %l0 = 000000ff, %l1 = 3b180000
	ldda	[%i0+%o4]0x88,%l0	! %l0 = 0000000000000032 000000000000005d
!	Mem[0000000030081408] = 00000000, %l6 = 0000000032000000
	lduha	[%i2+%o4]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000030101400] = 000000ff, %f3  = 0000183b
	lda	[%i4+%g0]0x89,%f3 	! %f3 = 000000ff
!	Mem[0000000010101410] = 1c000000000000ff, %f16 = 1c000000 0000009f
	ldda	[%i4+%o5]0x88,%f16	! %f16 = 1c000000 000000ff
!	Mem[0000000030041408] = 000000ff, %l2 = 0000000000000000
	lduha	[%i1+%o4]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[00000000100c1400] = 000041ff, %l6 = 0000000000000000
	ldswa	[%i3+%g0]0x80,%l6	! %l6 = 00000000000041ff

p0_label_237:
!	Starting 10 instruction Store Burst
!	%f20 = 00ff0000, Mem[0000000030081408] = 00000000
	sta	%f20,[%i2+%o4]0x81	! Mem[0000000030081408] = 00ff0000
!	Code Fragment 4, seed = 466897
p0_fragment_18:
!	%l0 = 0000000000000032
	setx	0x0bcd4b0cd7dc1a9e,%g7,%l0 ! %l0 = 0bcd4b0cd7dc1a9e
!	%l1 = 000000000000005d
	setx	0x44720037972c2549,%g7,%l1 ! %l1 = 44720037972c2549
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 0bcd4b0cd7dc1a9e
	setx	0x820013d47e53cc04,%g7,%l0 ! %l0 = 820013d47e53cc04
!	%l1 = 44720037972c2549
	setx	0xf26fc44992fd91cf,%g7,%l1 ! %l1 = f26fc44992fd91cf
p0_fragment_18_end:
!	Code Fragment 3, seed = 241846
p0_fragment_19:
!	%l0 = 820013d47e53cc04
	setx	0x4a6513a6bf368876,%g7,%l0 ! %l0 = 4a6513a6bf368876
!	%l1 = f26fc44992fd91cf
	setx	0xf19ed943c2720ba1,%g7,%l1 ! %l1 = f19ed943c2720ba1
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 4a6513a6bf368876
	setx	0xcb53b2fea975c2dc,%g7,%l0 ! %l0 = cb53b2fea975c2dc
!	%l1 = f19ed943c2720ba1
	setx	0x3b402713f4e8b127,%g7,%l1 ! %l1 = 3b402713f4e8b127
p0_fragment_19_end:
!	%l6 = 000041ff, %l7 = 0000446a, Mem[00000000100c1400] = 000041ff 0000009f
	stda	%l6,[%i3+%g0]0x80	! Mem[00000000100c1400] = 000041ff 0000446a
!	Mem[0000000010181410] = fc00ffff, %l1 = 3b402713f4e8b127
	ldstuba	[%i6+%o5]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[00000000211c0000] = 47ff8f28, %l0 = cb53b2fea975c2dc
	ldstuba	[%o2+0x000]%asi,%l0	! %l0 = 0000000000000047
!	%l6 = 000041ff, %l7 = 0000446a, Mem[00000000100c1410] = 0000ff00 32000000
	stda	%l6,[%i3+%o5]0x88	! Mem[00000000100c1410] = 000041ff 0000446a
!	%f2  = 00002a00 000000ff, Mem[0000000030181410] = ffff3f26 1f4e0e4c
	stda	%f2 ,[%i6+%o5]0x89	! Mem[0000000030181410] = 00002a00 000000ff
!	Mem[00000000300c1408] = 32000000, %l5 = 000000000000ffff
	ldstuba	[%i3+%o4]0x81,%l5	! %l5 = 0000000000000032
!	Code Fragment 3, seed = 914546
p0_fragment_20:
!	%l0 = 0000000000000047
	setx	0x38fb3ef25fa0e696,%g7,%l0 ! %l0 = 38fb3ef25fa0e696
!	%l1 = 00000000000000ff
	setx	0xf837c3958cc08fc1,%g7,%l1 ! %l1 = f837c3958cc08fc1
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 38fb3ef25fa0e696
	setx	0xb0a4482f67e78cfc,%g7,%l0 ! %l0 = b0a4482f67e78cfc
!	%l1 = f837c3958cc08fc1
	setx	0xdb39131ea412e147,%g7,%l1 ! %l1 = db39131ea412e147
p0_fragment_20_end:

p0_label_238:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181418] = 11000000, %l4 = ffffffffffffffff
	lduw	[%i6+0x018],%l4		! %l4 = 0000000011000000
!	Mem[0000000030101410] = 3b180000, %l3 = 0000000000ff0000
	lduba	[%i4+%o5]0x89,%l3	! %l3 = 0000000000000000
!	%f25 = 00000000, %f16 = 1c000000
	fcmpes	%fcc1,%f25,%f16		! %fcc1 = 1
!	Mem[0000000010141400] = 0032003b, %l0 = b0a4482f67e78cfc
	ldsba	[%i5+%g0]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000010081418] = ffffffffffffffff, %l7 = 000000000000446a, %asi = 80
	ldxa	[%i2+0x018]%asi,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000020800000] = ffffeac8, %l1 = db39131ea412e147
	ldsh	[%o1+%g0],%l1		! %l1 = ffffffffffffffff
!	Mem[00000000218001c0] = ffff80a8, %l0 = 0000000000000000, %asi = 80
	lduba	[%o3+0x1c0]%asi,%l0	! %l0 = 00000000000000ff
!	Mem[00000000300c1400] = 00001fd1, %l2 = 00000000000000ff
	lduha	[%i3+%g0]0x89,%l2	! %l2 = 0000000000001fd1
!	Mem[0000000010141408] = 0000000000000000, %l6 = 00000000000041ff
	ldxa	[%i5+%o4]0x80,%l6	! %l6 = 0000000000000000
!	Mem[00000000300c1408] = ff000000, %l2 = 0000000000001fd1
	lduwa	[%i3+%o4]0x81,%l2	! %l2 = 00000000ff000000

p0_label_239:
!	Starting 10 instruction Store Burst
!	%f14 = 00000000, Mem[0000000010001410] = 00000000
	sta	%f14,[%i0+%o5]0x80	! Mem[0000000010001410] = 00000000
!	%l0 = 000000ff, %l1 = ffffffff, Mem[0000000010001408] = 32000000 5d000000
	stda	%l0,[%i0+%o4]0x80	! Mem[0000000010001408] = 000000ff ffffffff
!	%l5 = 0000000000000032, Mem[0000000010001408] = ffffffffff000000
	stxa	%l5,[%i0+%o4]0x88	! Mem[0000000010001408] = 0000000000000032
!	%f4  = 00ff0000, Mem[0000000010041400] = 2757ffff
	sta	%f4 ,[%i1+%g0]0x88	! Mem[0000000010041400] = 00ff0000
!	%l7 = ffffffffffffffff, Mem[0000000010101420] = ff000000
	sth	%l7,[%i4+0x020]		! Mem[0000000010101420] = ffff0000
!	%l4 = 0000000011000000, Mem[0000000010081410] = 000000ff
	stba	%l4,[%i2+%o5]0x88	! Mem[0000000010081410] = 00000000
!	Mem[0000000030041400] = 00000000, %l4 = 0000000011000000
	swapa	[%i1+%g0]0x81,%l4	! %l4 = 0000000000000000
!	%f6  = 1f4e0e4c ffff00fc, Mem[0000000030081408] = 0000ff00 0000005d
	stda	%f6 ,[%i2+%o4]0x89	! Mem[0000000030081408] = 1f4e0e4c ffff00fc
!	%f12 = 0000005d 00000032, Mem[0000000010081438] = d11f0772 c0e2991c, %asi = 80
	stda	%f12,[%i2+0x038]%asi	! Mem[0000000010081438] = 0000005d 00000032
!	Mem[0000000010081414] = 000000ff, %l0 = 00000000000000ff, %asi = 80
	swapa	[%i2+0x014]%asi,%l0	! %l0 = 00000000000000ff

p0_label_240:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = 0000ff001248e92b, %f26 = 0000005d 00000032
	ldda	[%i1+%g0]0x80,%f26	! %f26 = 0000ff00 1248e92b
!	Mem[0000000010181400] = 1c000000, %l7 = ffffffffffffffff
	ldsba	[%i6+%g0]0x80,%l7	! %l7 = 000000000000001c
!	Mem[00000000300c1408] = ff000000, %l2 = 00000000ff000000
	ldsha	[%i3+%o4]0x81,%l2	! %l2 = ffffffffffffff00
!	Mem[0000000010181410] = fc00ffff, %f9  = 00000032
	lda	[%i6+%o5]0x88,%f9 	! %f9 = fc00ffff
!	Mem[0000000010081410] = 00000000, %l6 = 0000000000000000
	lduha	[%i2+%o5]0x88,%l6	! %l6 = 0000000000000000
!	%f30 = 00000000 00000000, Mem[00000000100c1408] = 00000000 00000000
	stda	%f30,[%i3+%o4]0x88	! Mem[00000000100c1408] = 00000000 00000000
!	Mem[0000000030041410] = 6a440000, %f9  = fc00ffff
	lda	[%i1+%o5]0x89,%f9 	! %f9 = 6a440000
!	Mem[00000000300c1410] = ffffffff, %l7 = 000000000000001c
	ldswa	[%i3+%o5]0x89,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000030141400] = ff000000, %l5 = 0000000000000032
	lduba	[%i5+%g0]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000030081408] = 1f4e0e4c ffff00fc, %l0 = 000000ff, %l1 = ffffffff
	ldda	[%i2+%o4]0x89,%l0	! %l0 = 00000000ffff00fc 000000001f4e0e4c

p0_label_241:
!	Starting 10 instruction Store Burst
!	Mem[0000000010181408] = 7400009f, %l0 = 00000000ffff00fc
	swapa	[%i6+%o4]0x80,%l0	! %l0 = 000000007400009f
!	%l4 = 0000000000000000, Mem[0000000030041410] = 000000006a440000
	stxa	%l4,[%i1+%o5]0x89	! Mem[0000000030041410] = 0000000000000000
!	Mem[0000000010081411] = 00000000, %l2 = ffffffffffffff00
	ldstub	[%i2+0x011],%l2		! %l2 = 0000000000000000
!	Mem[0000000010041435] = 000011ff, %l1 = 000000001f4e0e4c
	ldstuba	[%i1+0x035]%asi,%l1	! %l1 = 0000000000000000
!	%f8  = 0000005d, Mem[000000001000142c] = 00000058
	st	%f8 ,[%i0+0x02c]	! Mem[000000001000142c] = 0000005d
!	Mem[0000000010001408] = 32000000, %l7 = ffffffffffffffff
	ldstuba	[%i0+%o4]0x80,%l7	! %l7 = 0000000000000032
!	%l3 = 0000000000000000, Mem[00000000100c1400] = 6a440000ff410000
	stxa	%l3,[%i3+%g0]0x88	! Mem[00000000100c1400] = 0000000000000000
!	%f0  = 00000000 0000476c, Mem[00000000100c1410] = ff410000 6a440000
	stda	%f0 ,[%i3+%o5]0x80	! Mem[00000000100c1410] = 00000000 0000476c
!	Code Fragment 4, seed = 15368
p0_fragment_21:
!	%l0 = 000000007400009f
	setx	0xe385ecc27c181fe6,%g7,%l0 ! %l0 = e385ecc27c181fe6
!	%l1 = 0000000000000000
	setx	0x74b35ffdbb08c811,%g7,%l1 ! %l1 = 74b35ffdbb08c811
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = e385ecc27c181fe6
	setx	0xe1d37e74125c944c,%g7,%l0 ! %l0 = e1d37e74125c944c
!	%l1 = 74b35ffdbb08c811
	setx	0x5e33536c2e878797,%g7,%l1 ! %l1 = 5e33536c2e878797
p0_fragment_21_end:
!	%f9  = 6a440000, Mem[0000000030181400] = 3b180000
	sta	%f9 ,[%i6+%g0]0x81	! Mem[0000000030181400] = 6a440000

p0_label_242:
!	Starting 10 instruction Load Burst
!	%l0 = e1d37e74125c944c, %l7 = 0000000000000032, %y  = 36628cca
	sdiv	%l0,%l7,%l4		! %l4 = 000000007fffffff
	mov	%l0,%y			! %y = 125c944c
!	Mem[0000000021800041] = 62002388, %l2 = 0000000000000000, %asi = 80
	ldsba	[%o3+0x041]%asi,%l2	! %l2 = 0000000000000000
!	Mem[0000000030041400] = 1100000000000000, %l0 = e1d37e74125c944c
	ldxa	[%i1+%g0]0x81,%l0	! %l0 = 1100000000000000
!	Mem[0000000010141420] = fccf480b, %f25 = 00000000
	lda	[%i5+0x020]%asi,%f25	! %f25 = fccf480b
!	Mem[00000000300c1400] = d11f0000, %l5 = 0000000000000000
	ldsha	[%i3+%g0]0x81,%l5	! %l5 = ffffffffffffd11f
!	Mem[0000000010001408] = 000000ff, %l7 = 0000000000000032
	ldswa	[%i0+%o4]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030001410] = 000000ff, %f7  = ffff00fc
	lda	[%i0+%o5]0x89,%f7 	! %f7 = 000000ff
!	Mem[0000000030181400] = 0000446a, %l4 = 000000007fffffff
	ldsba	[%i6+%g0]0x89,%l4	! %l4 = 000000000000006a
!	Mem[0000000030141410] = ff006545, %l4 = 000000000000006a
	lduba	[%i5+%o5]0x81,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030001400] = 9f0000ff 0000ffff, %l0 = 00000000, %l1 = 2e878797
	ldda	[%i0+%g0]0x89,%l0	! %l0 = 000000000000ffff 000000009f0000ff

p0_label_243:
!	Starting 10 instruction Store Burst
!	%f8  = 0000005d, Mem[00000000100c1434] = 000000ff
	st	%f8 ,[%i3+0x034]	! Mem[00000000100c1434] = 0000005d
!	Mem[00000000201c0000] = 00009298, %l5 = ffffffffffffd11f
	ldstub	[%o0+%g0],%l5		! %l5 = 0000000000000000
!	%l1 = 000000009f0000ff, Mem[0000000021800100] = ff47e418
	sth	%l1,[%o3+0x100]		! Mem[0000000021800100] = 00ffe418
!	%l5 = 0000000000000000, Mem[0000000030181410] = ff000000002a0000
	stxa	%l5,[%i6+%o5]0x81	! Mem[0000000030181410] = 0000000000000000
!	%l0 = 0000ffff, %l1 = 9f0000ff, Mem[0000000030041408] = ff000000 00000000
	stda	%l0,[%i1+%o4]0x81	! Mem[0000000030041408] = 0000ffff 9f0000ff
!	Mem[0000000010081400] = 00000000, %l1 = 000000009f0000ff
	ldstuba	[%i2+%g0]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000030081408] = ffff00fc, %l7 = 00000000000000ff
	swapa	[%i2+%o4]0x89,%l7	! %l7 = 00000000ffff00fc
!	Mem[00000000100c142c] = 0000009f, %l2 = 0000000000000000
	ldstuba	[%i3+0x02c]%asi,%l2	! %l2 = 0000000000000000
!	Mem[0000000030181400] = 6a440000, %l1 = 0000000000000000
	swapa	[%i6+%g0]0x81,%l1	! %l1 = 000000006a440000
!	Mem[00000000100c1408] = 00000000, %l6 = 0000000000000000
	ldstuba	[%i3+%o4]0x80,%l6	! %l6 = 0000000000000000

p0_label_244:
!	Starting 10 instruction Load Burst
!	Mem[0000000020800000] = ffffeac8, %l7 = 00000000ffff00fc, %asi = 80
	lduha	[%o1+0x000]%asi,%l7	! %l7 = 000000000000ffff
!	Mem[0000000010181410] = ffff00fc, %l7 = 000000000000ffff
	lduha	[%i6+%o5]0x80,%l7	! %l7 = 000000000000ffff
!	Mem[0000000030081408] = ff0000004c0e4e1f, %f26 = 0000ff00 1248e92b
	ldda	[%i2+%o4]0x81,%f26	! %f26 = ff000000 4c0e4e1f
!	Mem[0000000010001408] = 000000ff, %l2 = 0000000000000000
	ldswa	[%i0+%o4]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030041410] = 00000000, %f8  = 0000005d
	lda	[%i1+%o5]0x81,%f8 	! %f8 = 00000000
!	Mem[0000000030141410] = 456500ff, %l5 = 0000000000000000
	ldswa	[%i5+%o5]0x89,%l5	! %l5 = 00000000456500ff
!	Mem[00000000201c0000] = ff009298, %l6 = 0000000000000000
	ldsb	[%o0+%g0],%l6		! %l6 = ffffffffffffffff
!	Mem[0000000010041410] = 0000ff00, %l6 = ffffffffffffffff
	lduwa	[%i1+%o5]0x80,%l6	! %l6 = 000000000000ff00
!	Mem[00000000300c1408] = 000000ff, %l6 = 000000000000ff00
	lduha	[%i3+%o4]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010081408] = 00ff0000, %f3  = 000000ff
	lda	[%i2+0x008]%asi,%f3 	! %f3 = 00ff0000

p0_label_245:
!	Starting 10 instruction Store Burst
!	%l7 = 000000000000ffff, Mem[0000000030001410] = 000000ff
	stba	%l7,[%i0+%o5]0x89	! Mem[0000000030001410] = 000000ff
!	%f0  = 00000000 0000476c, Mem[0000000010001418] = 58000000 3899ffff
	std	%f0 ,[%i0+0x018]	! Mem[0000000010001418] = 00000000 0000476c
!	Mem[000000001000140b] = ff000000, %l7 = 000000000000ffff
	ldstuba	[%i0+0x00b]%asi,%l7	! %l7 = 0000000000000000
!	Mem[0000000010181400] = 1c000000, %l7 = 0000000000000000
	swapa	[%i6+%g0]0x80,%l7	! %l7 = 000000001c000000
!	%l4 = 00000000000000ff, Mem[0000000030181410] = 00000000
	stwa	%l4,[%i6+%o5]0x89	! Mem[0000000030181410] = 000000ff
!	%l1 = 000000006a440000, Mem[0000000010001408] = ff0000ff00000000
	stxa	%l1,[%i0+%o4]0x80	! Mem[0000000010001408] = 000000006a440000
!	%f23 = 1248e92b, Mem[0000000030181408] = ffff00fc
	sta	%f23,[%i6+%o4]0x81	! Mem[0000000030181408] = 1248e92b
!	%l1 = 000000006a440000, Mem[00000000201c0000] = ff009298
	sth	%l1,[%o0+%g0]		! Mem[00000000201c0000] = 00009298
!	%l5 = 00000000456500ff, Mem[0000000010141400] = 3b003200
	stha	%l5,[%i5+%g0]0x88	! Mem[0000000010141400] = 3b0000ff
!	%l5 = 00000000456500ff, Mem[00000000100c1434] = 0000005d, %asi = 80
	stwa	%l5,[%i3+0x034]%asi	! Mem[00000000100c1434] = 456500ff

p0_label_246:
!	Starting 10 instruction Load Burst
!	%l3 = 0000000000000000, Mem[0000000030081410] = 00000000
	stha	%l3,[%i2+%o5]0x89	! Mem[0000000030081410] = 00000000
!	Mem[00000000100c1408] = 000000ff, %l5 = 00000000456500ff
	lduba	[%i3+%o4]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[000000001008142c] = 0000001c, %l6 = 00000000000000ff, %asi = 80
	lduwa	[%i2+0x02c]%asi,%l6	! %l6 = 000000000000001c
!	Mem[0000000010141408] = 00000000, %l5 = 00000000000000ff
	lduba	[%i5+%o4]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000010181420] = 320000005d000000, %l5 = 0000000000000000
	ldx	[%i6+0x020],%l5		! %l5 = 320000005d000000
!	Mem[0000000010181408] = fc00ffff, %l3 = 0000000000000000
	ldsba	[%i6+%o4]0x88,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000030041410] = 0000000000000000, %f6  = 1f4e0e4c 000000ff
	ldda	[%i1+%o5]0x81,%f6 	! %f6  = 00000000 00000000
!	Mem[0000000030081410] = 9f000074 00000000, %l0 = 0000ffff, %l1 = 6a440000
	ldda	[%i2+%o5]0x89,%l0	! %l0 = 0000000000000000 000000009f000074
!	Mem[00000000211c0000] = ffff8f28, %l5 = 320000005d000000
	ldsh	[%o2+%g0],%l5		! %l5 = ffffffffffffffff
!	Mem[0000000030141410] = 456500ff, %f1  = 0000476c
	lda	[%i5+%o5]0x89,%f1 	! %f1 = 456500ff

p0_label_247:
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1400] = 00000000, %l2 = 00000000000000ff
	swapa	[%i3+%g0]0x88,%l2	! %l2 = 0000000000000000
!	%l4 = 00000000000000ff, Mem[00000000300c1408] = ff0000000000446a
	stxa	%l4,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00000000000000ff
!	%l2 = 0000000000000000, Mem[0000000030141408] = 00000000
	stha	%l2,[%i5+%o4]0x81	! Mem[0000000030141408] = 00000000
!	Mem[0000000030101408] = 000000ff, %l4 = 00000000000000ff
	swapa	[%i4+%o4]0x89,%l4	! %l4 = 00000000000000ff
!	%l3 = ffffffffffffffff, Mem[0000000010001400] = ff00000000000000, %asi = 80
	stxa	%l3,[%i0+0x000]%asi	! Mem[0000000010001400] = ffffffffffffffff
!	%l5 = ffffffffffffffff, Mem[000000001008142c] = 0000001c, %asi = 80
	stha	%l5,[%i2+0x02c]%asi	! Mem[000000001008142c] = ffff001c
!	%f28 = ffff00fc, Mem[0000000030041410] = 00000000
	sta	%f28,[%i1+%o5]0x81	! Mem[0000000030041410] = ffff00fc
!	%f0  = 00000000 456500ff, Mem[0000000010001400] = ffffffff ffffffff
	stda	%f0 ,[%i0+%g0]0x80	! Mem[0000000010001400] = 00000000 456500ff
!	%l2 = 0000000000000000, Mem[0000000030041408] = ffff0000
	stha	%l2,[%i1+%o4]0x89	! Mem[0000000030041408] = ffff0000
!	Code Fragment 3, seed = 142716
p0_fragment_22:
!	%l0 = 0000000000000000
	setx	0xe06bd0dd21784846,%g7,%l0 ! %l0 = e06bd0dd21784846
!	%l1 = 000000009f000074
	setx	0x3d9a1a0b03e00271,%g7,%l1 ! %l1 = 3d9a1a0b03e00271
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = e06bd0dd21784846
	setx	0x68101b513fe640ac,%g7,%l0 ! %l0 = 68101b513fe640ac
!	%l1 = 3d9a1a0b03e00271
	setx	0x41b48377e8a105f7,%g7,%l1 ! %l1 = 41b48377e8a105f7
p0_fragment_22_end:

p0_label_248:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181418] = 11000000, %l3 = ffffffffffffffff
	ldub	[%i6+0x018],%l3		! %l3 = 0000000000000011
!	Mem[00000000300c1410] = ffffffff, %l7 = 000000001c000000
	ldswa	[%i3+%o5]0x81,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010181410] = ffff00fc00000000, %f0  = 00000000 456500ff
	ldda	[%i6+%o5]0x80,%f0 	! %f0  = ffff00fc 00000000
!	Mem[00000000300c1400] = 00001fd1, %l5 = ffffffffffffffff
	lduba	[%i3+%g0]0x89,%l5	! %l5 = 00000000000000d1
!	%f30 = 00000000, %f7  = 00000000, %f2  = 00002a00
	fsubs	%f30,%f7 ,%f2 		! %f2  = 00000000
!	%f31 = 00000000, %f18 = ff8d183b, %f19 = 00000000
	fsubs	%f31,%f18,%f19		! %f19 = ffcd183b
!	Mem[0000000010101400] = 41ff0000, %l5 = 00000000000000d1
	lduwa	[%i4+%g0]0x80,%l5	! %l5 = 0000000041ff0000
!	Mem[0000000030001400] = 0000ffff, %l1 = 41b48377e8a105f7
	ldsba	[%i0+%g0]0x89,%l1	! %l1 = ffffffffffffffff
!	%l5 = 0000000041ff0000, immd = 00000697, %y  = 125c944c
	smul	%l5,0x697,%l0		! %l0 = 000001b2e7690000, %y = 000001b2
!	Mem[0000000030001410] = 00000094000000ff, %f2  = 00000000 00ff0000
	ldda	[%i0+%o5]0x89,%f2 	! %f2  = 00000094 000000ff

p0_label_249:
!	Starting 10 instruction Store Burst
!	%l4 = 00000000000000ff, Mem[00000000100c1408] = 000000ff
	stba	%l4,[%i3+%o4]0x88	! Mem[00000000100c1408] = 000000ff
!	Mem[0000000021800181] = ffff5078, %l7 = ffffffffffffffff
	ldstuba	[%o3+0x181]%asi,%l7	! %l7 = 00000000000000ff
!	%f25 = fccf480b, Mem[0000000010081408] = 0000ff00
	sta	%f25,[%i2+%o4]0x88	! Mem[0000000010081408] = fccf480b
!	%f12 = 0000005d 00000032, %l0 = 000001b2e7690000
!	Mem[0000000010181420] = 320000005d000000
	add	%i6,0x020,%g1
	stda	%f12,[%g1+%l0]ASI_PST8_PL ! Mem[0000000010181420] = 320000005d000000
!	%f3  = 000000ff, Mem[00000000100c1408] = ff000000
	sta	%f3 ,[%i3+%o4]0x80	! Mem[00000000100c1408] = 000000ff
!	%f27 = 4c0e4e1f, Mem[00000000100c1400] = 000000ff
	sta	%f27,[%i3+%g0]0x88	! Mem[00000000100c1400] = 4c0e4e1f
!	Mem[0000000020800001] = ffffeac8, %l2 = 0000000000000000
	ldstub	[%o1+0x001],%l2		! %l2 = 00000000000000ff
!	%f12 = 0000005d 00000032, %l5 = 0000000041ff0000
!	Mem[00000000300c1428] = 13ff993800000058
	add	%i3,0x028,%g1
	stda	%f12,[%g1+%l5]ASI_PST32_S ! Mem[00000000300c1428] = 13ff993800000058
!	%l6 = 000000000000001c, Mem[0000000010101410] = ff000000
	stha	%l6,[%i4+%o5]0x80	! Mem[0000000010101410] = 001c0000
!	Mem[0000000010141438] = fffffff2, %l0 = e7690000, %l4 = 000000ff
	add	%i5,0x38,%g1
	casa	[%g1]0x80,%l0,%l4	! %l4 = 00000000fffffff2

p0_label_250:
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = 00000000000000ff, %f2  = 00000094 000000ff
	ldda	[%i3+%o4]0x81,%f2 	! %f2  = 00000000 000000ff
!	Mem[00000000201c0000] = 00009298, %l5 = 0000000041ff0000, %asi = 80
	lduha	[%o0+0x000]%asi,%l5	! %l5 = 0000000000000000
!	Mem[0000000030001410] = ff000000, %l1 = ffffffffffffffff
	ldswa	[%i0+%o5]0x81,%l1	! %l1 = ffffffffff000000
!	Mem[0000000010041410] = 0000ff00, %l1 = ffffffffff000000
	ldsba	[%i1+%o5]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000020800000] = ffffeac8, %l6 = 000000000000001c, %asi = 80
	ldsha	[%o1+0x000]%asi,%l6	! %l6 = ffffffffffffffff
!	Mem[00000000201c0000] = 00009298, %l2 = 00000000000000ff, %asi = 80
	ldsba	[%o0+0x000]%asi,%l2	! %l2 = 0000000000000000
!	%f3  = 000000ff, %f0  = ffff00fc, %f23 = 1248e92b
	fadds	%f3 ,%f0 ,%f23		! %f23 = ffff00fc
!	Mem[0000000030141400] = 00ff0000 ff000000, %l0 = e7690000, %l1 = 00000000
	ldda	[%i5+%g0]0x89,%l0	! %l0 = 00000000ff000000 0000000000ff0000
!	Mem[0000000010101408] = 00000032, %l5 = 0000000000000000
	ldsha	[%i4+%o4]0x88,%l5	! %l5 = 0000000000000032
!	Mem[0000000010041410] = 0000000000ff0000, %l1 = 0000000000ff0000
	ldxa	[%i1+%o5]0x88,%l1	! %l1 = 0000000000ff0000

p0_label_251:
!	Starting 10 instruction Store Burst
!	%l7 = 00000000000000ff, Mem[0000000030101410] = 0000183b
	stha	%l7,[%i4+%o5]0x81	! Mem[0000000030101410] = 00ff183b
!	Mem[000000001014143b] = fffffff2, %l5 = 0000000000000032
	ldstub	[%i5+0x03b],%l5		! %l5 = 00000000000000f2
!	Mem[0000000010081424] = 1b62e111, %l4 = 00000000fffffff2, %asi = 80
	swapa	[%i2+0x024]%asi,%l4	! %l4 = 000000001b62e111
!	%l2 = 0000000000000000, Mem[0000000010141438] = ffffffff00000000, %asi = 80
	stxa	%l2,[%i5+0x038]%asi	! Mem[0000000010141438] = 0000000000000000
!	%l4 = 000000001b62e111, Mem[0000000010141410] = 000000ff
	stba	%l4,[%i5+%o5]0x88	! Mem[0000000010141410] = 00000011
!	%l2 = 00000000, %l3 = 00000011, Mem[00000000100c1408] = 000000ff 00000000
	stda	%l2,[%i3+%o4]0x80	! Mem[00000000100c1408] = 00000000 00000011
!	%f16 = 1c000000, Mem[0000000010081438] = 0000005d
	sta	%f16,[%i2+0x038]%asi	! Mem[0000000010081438] = 1c000000
!	%l5 = 00000000000000f2, Mem[00000000100c1404] = 00000000
	sth	%l5,[%i3+0x004]		! Mem[00000000100c1404] = 00f20000
!	%l7 = 00000000000000ff, Mem[0000000010101400] = 0000ff41
	stwa	%l7,[%i4+%g0]0x88	! Mem[0000000010101400] = 000000ff
!	%l1 = 0000000000ff0000, Mem[0000000010141400] = ff00003b00000000
	stxa	%l1,[%i5+%g0]0x80	! Mem[0000000010141400] = 0000000000ff0000

p0_label_252:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = 00000000, %f23 = ffff00fc
	lda	[%i0+%o4]0x80,%f23	! %f23 = 00000000
!	Mem[00000000300c1400] = d11f0000, %l4 = 000000001b62e111
	lduwa	[%i3+%g0]0x81,%l4	! %l4 = 00000000d11f0000
!	Mem[0000000030001400] = 0000ffff, %l5 = 00000000000000f2
	lduwa	[%i0+%g0]0x89,%l5	! %l5 = 000000000000ffff
!	Mem[0000000030001400] = 0000ffff, %l2 = 0000000000000000
	swapa	[%i0+%g0]0x89,%l2	! %l2 = 000000000000ffff
!	Mem[0000000010081410] = 00ff0000 000000ff, %l2 = 0000ffff, %l3 = 00000011
	ldda	[%i2+%o5]0x80,%l2	! %l2 = 0000000000ff0000 00000000000000ff
!	Mem[0000000010001408] = 00000000, %l7 = 00000000000000ff
	ldswa	[%i0+%o4]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000030081410] = 00000000, %l1 = 0000000000ff0000
	ldsba	[%i2+%o5]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000010081412] = 00ff0000, %l0 = 00000000ff000000
	ldsb	[%i2+0x012],%l0		! %l0 = 0000000000000000
!	Mem[0000000010001410] = 0000000000000000, %l3 = 00000000000000ff
	ldxa	[%i0+%o5]0x88,%l3	! %l3 = 0000000000000000
!	Mem[00000000300c1400] = 00001fd1, %f3  = 000000ff
	lda	[%i3+%g0]0x89,%f3 	! %f3 = 00001fd1

p0_label_253:
!	Starting 10 instruction Store Burst
!	%l0 = 0000000000000000, imm = fffffffffffff658, %l4 = 00000000d11f0000
	andn	%l0,-0x9a8,%l4		! %l4 = 0000000000000000
!	%l7 = 0000000000000000, Mem[0000000010141400] = 00000000
	stba	%l7,[%i5+%g0]0x88	! Mem[0000000010141400] = 00000000
!	%l2 = 00ff0000, %l3 = 00000000, Mem[0000000010041400] = 00ff0000 2be94812
	stda	%l2,[%i1+%g0]0x88	! Mem[0000000010041400] = 00ff0000 00000000
!	Mem[0000000020800041] = 11ff3ef8, %l1 = 0000000000000000
	ldstuba	[%o1+0x041]%asi,%l1	! %l1 = 00000000000000ff
!	%l2 = 00ff0000, %l3 = 00000000, Mem[0000000010001410] = 00000000 00000000
	stda	%l2,[%i0+%o5]0x80	! Mem[0000000010001410] = 00ff0000 00000000
!	Mem[0000000030181400] = 00000000, %l7 = 0000000000000000
	swapa	[%i6+%g0]0x81,%l7	! %l7 = 0000000000000000
!	%l3 = 0000000000000000, Mem[00000000300c1408] = 00000000
	stha	%l3,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00000000
!	%f19 = ffcd183b, Mem[0000000030141400] = ff000000
	sta	%f19,[%i5+%g0]0x89	! Mem[0000000030141400] = ffcd183b
!	%l3 = 0000000000000000, Mem[0000000030101410] = 3b18ff00
	stwa	%l3,[%i4+%o5]0x89	! Mem[0000000030101410] = 00000000
!	Mem[0000000010041400] = 0000ff00 00000000 00000000 00ff0000
!	%f0  = ffff00fc 00000000 00000000 00001fd1
!	%f4  = 00ff0000 00000032 00000000 00000000
!	%f8  = 00000000 6a440000 000000ff fc00ffff
!	%f12 = 0000005d 00000032 00000000 00000000
	stda	%f0 ,[%i1+%g0]ASI_BLK_AIUPL	! Block Store to 0000000010041400

p0_label_254:
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = 0000ffff, %l0 = 0000000000000000
	lduba	[%i1+%o4]0x81,%l0	! %l0 = 0000000000000000
!	Mem[00000000100c1400] = 1f4e0e4c, %f16 = 1c000000
	lda	[%i3+%g0]0x80,%f16	! %f16 = 1f4e0e4c
!	Mem[00000000201c0001] = 00009298, %l7 = 0000000000000000, %asi = 80
	lduba	[%o0+0x001]%asi,%l7	! %l7 = 0000000000000000
!	Mem[0000000010101410] = 00001c00, %l5 = 000000000000ffff
	ldswa	[%i4+%o5]0x88,%l5	! %l5 = 0000000000001c00
!	Mem[0000000010081408] = 0b48cffc, %f29 = 000000ff
	lda	[%i2+%o4]0x80,%f29	! %f29 = 0b48cffc
!	Mem[0000000030041410] = ffff00fc, %l6 = ffffffffffffffff
	lduha	[%i1+%o5]0x81,%l6	! %l6 = 000000000000ffff
!	Mem[0000000021800000] = 1a90db58, %l5 = 0000000000001c00
	lduh	[%o3+%g0],%l5		! %l5 = 0000000000001a90
!	Mem[0000000030101410] = 00000000, %l5 = 0000000000001a90
	ldsha	[%i4+%o5]0x81,%l5	! %l5 = 0000000000000000
!	%f29 = 0b48cffc, %f7  = 00000000, %f27 = 4c0e4e1f
	fdivs	%f29,%f7 ,%f27		! %f27 = 7f800000
!	%l0 = 0000000000000000, %l0 = 0000000000000000, %l4 = 0000000000000000
	udivx	%l0,%l0,%l4		! Div by zero, %l0 = 0000000000000028

p0_label_255:
!	Starting 10 instruction Store Burst
!	Mem[0000000010101400] = 000000ff, %l5 = 0000000000000000
	swapa	[%i4+%g0]0x88,%l5	! %l5 = 00000000000000ff
!	%l7 = 0000000000000000, Mem[0000000030181400] = 00000000
	stwa	%l7,[%i6+%g0]0x89	! Mem[0000000030181400] = 00000000
!	%l2 = 0000000000ff0000, Mem[000000001000143f] = 0000003b, %asi = 80
	stba	%l2,[%i0+0x03f]%asi	! Mem[000000001000143c] = 00000000
!	%f18 = ff8d183b, Mem[0000000010181410] = ffff00fc
	sta	%f18,[%i6+%o5]0x80	! Mem[0000000010181410] = ff8d183b
!	Mem[0000000010001400] = 00000000 456500ff 00000000 6a440000
!	%f0  = ffff00fc 00000000 00000000 00001fd1
!	%f4  = 00ff0000 00000032 00000000 00000000
!	%f8  = 00000000 6a440000 000000ff fc00ffff
!	%f12 = 0000005d 00000032 00000000 00000000
	stda	%f0 ,[%i0+%g0]ASI_BLK_PL	! Block Store to 0000000010001400
!	%l0 = 0000000000000028, immd = 0000000000000f3e, %l108 = 0000000000000005
	sdivx	%l0,0xf3e,%l5		! %l5 = 0000000000000000
!	%l4 = 0000000000000000, Mem[00000000100c1400] = 1f4e0e4c
	stba	%l4,[%i3+%g0]0x80	! Mem[00000000100c1400] = 004e0e4c
!	%l6 = 000000000000ffff, Mem[0000000010101410] = 001c0000
	stw	%l6,[%i4+%o5]		! Mem[0000000010101410] = 0000ffff
!	%l0 = 0000000000000028, Mem[0000000010081400] = 000000ff
	stba	%l0,[%i2+%g0]0x88	! Mem[0000000010081400] = 00000028
!	Mem[0000000030081410] = 00000000, %l7 = 0000000000000000
	swapa	[%i2+%o5]0x89,%l7	! %l7 = 0000000000000000

p0_label_256:
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (46)
!	Mem[000000001000140c] = 00000000, %l5 = 0000000000000000
	lduh	[%i0+0x00c],%l5		! %l5 = 0000000000000000
!	Mem[0000000010101408] = 0000005d00000032, %l0 = 0000000000000028
	ldxa	[%i4+%o4]0x88,%l0	! %l0 = 0000005d00000032
!	Mem[0000000010141408] = 00000000, %l3 = 0000000000000000
	lduwa	[%i5+%o4]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000010001410] = 00ff000000000032, %f0  = ffff00fc 00000000
	ldda	[%i0+%o5]0x88,%f0 	! %f0  = 00ff0000 00000032
!	Mem[0000000030081400] = 9f000000, %l7 = 0000000000000000
	lduwa	[%i2+%g0]0x89,%l7	! %l7 = 000000009f000000
!	Mem[000000001014140f] = 00000000, %l1 = 00000000000000ff, %asi = 80
	ldsba	[%i5+0x00f]%asi,%l1	! %l1 = 0000000000000000
!	Mem[0000000010081422] = 0000476c, %l6 = 000000000000ffff, %asi = 80
	ldsha	[%i2+0x022]%asi,%l6	! %l6 = 000000000000476c
!	Mem[0000000010101410] = ffff0000, %l2 = 0000000000ff0000
	lduwa	[%i4+%o5]0x88,%l2	! %l2 = 00000000ffff0000
!	Mem[0000000030141410] = ff0065456853b85b, %f8  = 00000000 6a440000
	ldda	[%i5+%o5]0x81,%f8 	! %f8  = ff006545 6853b85b
!	Mem[0000000030141410] = 456500ff, %l1 = 0000000000000000
	lduha	[%i5+%o5]0x89,%l1	! %l1 = 00000000000000ff

p0_label_257:
!	Starting 10 instruction Store Burst
!	Mem[0000000010181408] = ffff00fc00000000, %l0 = 0000005d00000032, %l6 = 000000000000476c
	add	%i6,0x08,%g1
	casxa	[%g1]0x80,%l0,%l6	! %l6 = ffff00fc00000000
!	%l6 = ffff00fc00000000, Mem[0000000010001400] = 00000000
	stha	%l6,[%i0+%g0]0x80	! Mem[0000000010001400] = 00000000
!	%l4 = 00000000, %l5 = 00000000, Mem[0000000030101408] = ff000000 00000000
	stda	%l4,[%i4+%o4]0x81	! Mem[0000000030101408] = 00000000 00000000
!	%l0 = 0000005d00000032, Mem[0000000010041410] = 00000032
	stba	%l0,[%i1+%o5]0x88	! Mem[0000000010041410] = 00000032
!	%f20 = 00ff0000 ff000000, Mem[0000000030081400] = 9f000000 4c0e4e1f
	stda	%f20,[%i2+%g0]0x89	! Mem[0000000030081400] = 00ff0000 ff000000
!	%l7 = 000000009f000000, Mem[0000000010041417] = 0000ff00
	stb	%l7,[%i1+0x017]		! Mem[0000000010041414] = 0000ff00
!	%f17 = 000000ff, %f29 = 0b48cffc, %f30 = 00000000 00000000
	fsmuld	%f17,%f29,%f30		! tt=0x22, %l0 = 0000005d00000054
!	Mem[000000001018141c] = ffffffff, %l4 = 0000000000000000
	swap	[%i6+0x01c],%l4		! %l4 = 00000000ffffffff
!	%l6 = ffff00fc00000000, Mem[0000000030101400] = 000000ff
	stha	%l6,[%i4+%g0]0x89	! Mem[0000000030101400] = 00000000
!	%l6 = 00000000, %l7 = 9f000000, Mem[00000000100c1408] = 00000000 00000011
	std	%l6,[%i3+%o4]		! Mem[00000000100c1408] = 00000000 9f000000

p0_label_258:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = 00000000fc00ffff, %f0  = 00ff0000 00000032
	ldda	[%i0+%g0]0x80,%f0 	! %f0  = 00000000 fc00ffff
!	Mem[0000000030081408] = 000000ff, %l0 = 0000005d00000054
	ldsba	[%i2+%o4]0x89,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010001410] = 00000032, %l3 = 0000000000000000
	lduwa	[%i0+%o5]0x88,%l3	! %l3 = 0000000000000032
!	Mem[0000000030041400] = 11000000, %f31 = 00000000
	lda	[%i1+%g0]0x81,%f31	! %f31 = 11000000
!	Mem[0000000010001400] = 00000000, %l0 = ffffffffffffffff
	ldsha	[%i0+%g0]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000030081408] = 1f4e0e4c 000000ff, %l2 = ffff0000, %l3 = 00000032
	ldda	[%i2+%o4]0x89,%l2	! %l2 = 00000000000000ff 000000001f4e0e4c
!	Mem[0000000030101400] = 00000000, %l2 = 00000000000000ff
	lduba	[%i4+%g0]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000030081400] = 000000ff, %f13 = 00000032
	lda	[%i2+%g0]0x81,%f13	! %f13 = 000000ff
!	Mem[00000000201c0001] = 00009298, %l2 = 0000000000000000
	ldsb	[%o0+0x001],%l2		! %l2 = 0000000000000000
!	Mem[0000000010001412] = 32000000, %l1 = 00000000000000ff
	ldsb	[%i0+0x012],%l1		! %l1 = 0000000000000000

p0_label_259:
!	Starting 10 instruction Store Burst
!	%l6 = ffff00fc00000000, Mem[0000000030001400] = 00000000
	stha	%l6,[%i0+%g0]0x81	! Mem[0000000030001400] = 00000000
!	%l7 = 000000009f000000, Mem[0000000010101428] = 00320000, %asi = 80
	stwa	%l7,[%i4+0x028]%asi	! Mem[0000000010101428] = 9f000000
!	Code Fragment 3, seed = 18764
p0_fragment_23:
!	%l0 = 0000000000000000
	setx	0x3f553bf46b7c39c6,%g7,%l0 ! %l0 = 3f553bf46b7c39c6
!	%l1 = 0000000000000000
	setx	0xb4f6e2cb729f3bf1,%g7,%l1 ! %l1 = b4f6e2cb729f3bf1
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 3f553bf46b7c39c6
	setx	0x1711e3dcce1e422c,%g7,%l0 ! %l0 = 1711e3dcce1e422c
!	%l1 = b4f6e2cb729f3bf1
	setx	0x3b1f77f482974f77,%g7,%l1 ! %l1 = 3b1f77f482974f77
p0_fragment_23_end:
!	%f30 = 00000000 11000000, Mem[0000000010041408] = d11f0000 00000000
	stda	%f30,[%i1+%o4]0x80	! Mem[0000000010041408] = 00000000 11000000
!	%l2 = 0000000000000000, Mem[0000000030001410] = 000000ff
	stba	%l2,[%i0+%o5]0x89	! Mem[0000000030001410] = 00000000
!	%l0 = 1711e3dcce1e422c, Mem[0000000010181400] = 9f00000000000000
	stxa	%l0,[%i6+%g0]0x88	! Mem[0000000010181400] = 1711e3dcce1e422c
!	%l6 = ffff00fc00000000, Mem[0000000030141408] = ff00000000000000
	stxa	%l6,[%i5+%o4]0x89	! Mem[0000000030141408] = ffff00fc00000000
!	%l2 = 0000000000000000, Mem[00000000201c0001] = 00009298
	stb	%l2,[%o0+0x001]		! Mem[00000000201c0000] = 00009298
!	%f8  = ff006545 6853b85b, Mem[0000000010081400] = 00000028 00000000
	stda	%f8 ,[%i2+%g0]0x88	! Mem[0000000010081400] = ff006545 6853b85b
!	%l1 = 3b1f77f482974f77, Mem[0000000030181410] = ff000000
	stba	%l1,[%i6+%o5]0x81	! Mem[0000000030181410] = 77000000

p0_label_260:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081402] = 5bb85368, %l2 = 0000000000000000
	ldub	[%i2+0x002],%l2		! %l2 = 0000000000000053
!	Mem[0000000010141400] = 00000000 00ff0000, %l4 = ffffffff, %l5 = 00000000
	ldda	[%i5+%g0]0x80,%l4	! %l4 = 0000000000000000 0000000000ff0000
!	Mem[0000000020800040] = 11ff3ef8, %l0 = 1711e3dcce1e422c, %asi = 80
	ldsha	[%o1+0x040]%asi,%l0	! %l0 = 00000000000011ff
!	Mem[0000000010001410] = 00000032, %l6 = ffff00fc00000000
	ldsha	[%i0+%o5]0x88,%l6	! %l6 = 0000000000000032
!	Mem[0000000030081410] = 00000000, %l4 = 0000000000000000
	ldsha	[%i2+%o5]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000010101400] = 00000000, %f12 = 0000005d
	lda	[%i4+0x000]%asi,%f12	! %f12 = 00000000
!	Mem[0000000010041400] = 00000000, %l6 = 0000000000000032
	lduha	[%i1+%g0]0x80,%l6	! %l6 = 0000000000000000
!	Mem[00000000100c1410] = 00000000, %l2 = 0000000000000053
	ldsha	[%i3+%o5]0x80,%l2	! %l2 = 0000000000000000
!	Mem[000000001000142d] = ff000000, %l6 = 0000000000000000, %asi = 80
	lduba	[%i0+0x02d]%asi,%l6	! %l6 = 0000000000000000
!	%f3  = 00001fd1, %f6  = 00000000
	fcmps	%fcc1,%f3 ,%f6 		! %fcc1 = 2

p0_label_261:
!	Starting 10 instruction Store Burst
!	%l0 = 00000000000011ff, Mem[0000000030041408] = 0000ffff9f0000ff
	stxa	%l0,[%i1+%o4]0x81	! Mem[0000000030041408] = 00000000000011ff
!	Mem[00000000211c0001] = ffff8f28, %l1 = 3b1f77f482974f77
	ldstub	[%o2+0x001],%l1		! %l1 = 00000000000000ff
!	%l0 = 00000000000011ff, Mem[0000000030001400] = 00000000
	stba	%l0,[%i0+%g0]0x89	! Mem[0000000030001400] = 000000ff
!	Mem[0000000010001408] = 00001fd1, %l3 = 000000001f4e0e4c
	swapa	[%i0+%o4]0x88,%l3	! %l3 = 0000000000001fd1
!	Mem[00000000300c1400] = d11f0000, %l2 = 0000000000000000
	swapa	[%i3+%g0]0x81,%l2	! %l2 = 00000000d11f0000
!	%l5 = 0000000000ff0000, Mem[0000000010041408] = 00000000
	stb	%l5,[%i1+%o4]		! Mem[0000000010041408] = 00000000
!	Mem[0000000010041410] = 32000000, %l7 = 000000009f000000
	ldstuba	[%i1+%o5]0x80,%l7	! %l7 = 0000000000000032
!	%l2 = 00000000d11f0000, Mem[0000000010141408] = 00000000
	stha	%l2,[%i5+%o4]0x88	! Mem[0000000010141408] = 00000000
!	%f6  = 00000000 00000000, Mem[00000000300c1410] = ffffffff 00000000
	stda	%f6 ,[%i3+%o5]0x81	! Mem[00000000300c1410] = 00000000 00000000
!	%f6  = 00000000 00000000, Mem[0000000010041428] = ffff00fc ff000000
	std	%f6 ,[%i1+0x028]	! Mem[0000000010041428] = 00000000 00000000

p0_label_262:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = 00000000fc00ffff, %f12 = 00000000 000000ff
	ldda	[%i1+%g0]0x80,%f12	! %f12 = 00000000 fc00ffff
!	Mem[0000000010001410] = 00000032, %l7 = 0000000000000032
	lduwa	[%i0+%o5]0x88,%l7	! %l7 = 0000000000000032
!	Mem[0000000010141400] = 0000000000ff0000, %l1 = 00000000000000ff
	ldx	[%i5+%g0],%l1		! %l1 = 0000000000ff0000
!	Mem[0000000010001408] = 1f4e0e4c, %l2 = 00000000d11f0000
	ldswa	[%i0+%o4]0x88,%l2	! %l2 = 000000001f4e0e4c
	membar	#Sync			! Added by membar checker (47)
!	Mem[0000000030181400] = 00000000 00000000 1248e92b 78059fff
!	Mem[0000000030181410] = 77000000 00000000 2be94812 2757c009
!	Mem[0000000030181420] = 0189db4c b08d903b 9f000000 00000000
!	Mem[0000000030181430] = ff000000 ff96d911 00000000 00000000
	ldda	[%i6+%g0]ASI_BLK_S,%f0 	! Block Load from 0000000030181400
!	Mem[0000000010001420] = 0000446a, %f19 = ffcd183b
	lda	[%i0+0x020]%asi,%f19	! %f19 = 0000446a
!	Mem[0000000030101408] = 00000000 00000000, %l2 = 1f4e0e4c, %l3 = 00001fd1
	ldda	[%i4+%o4]0x81,%l2	! %l2 = 0000000000000000 0000000000000000
!	Mem[0000000010181400] = 1711e3dcce1e422c, %l7 = 0000000000000032
	ldxa	[%i6+%g0]0x88,%l7	! %l7 = 1711e3dcce1e422c
!	Mem[0000000010181400] = ce1e422c, %l7 = 1711e3dcce1e422c
	ldsha	[%i6+%g0]0x88,%l7	! %l7 = 000000000000422c
!	Mem[0000000030101410] = 00000000, %f30 = 00000000
	lda	[%i4+%o5]0x81,%f30	! %f30 = 00000000

p0_label_263:
!	Starting 10 instruction Store Burst
!	%l1 = 0000000000ff0000, Mem[00000000100c1400] = 4c0e4e00
	stwa	%l1,[%i3+%g0]0x88	! Mem[00000000100c1400] = 00ff0000
!	Mem[0000000030141400] = 3b18cdff, %l7 = 000000000000422c
	ldstuba	[%i5+%g0]0x81,%l7	! %l7 = 000000000000003b
!	Mem[00000000100c142c] = ff00009f, %l3 = 0000000000000000, %asi = 80
	swapa	[%i3+0x02c]%asi,%l3	! %l3 = 00000000ff00009f
!	Mem[0000000010081410] = 00ff0000, %l1 = 0000000000ff0000
	swapa	[%i2+%o5]0x80,%l1	! %l1 = 0000000000ff0000
!	Mem[0000000010141408] = 00000000, %l4 = 0000000000000000, %asi = 80
	swapa	[%i5+0x008]%asi,%l4	! %l4 = 0000000000000000
!	Mem[0000000010101400] = 00000000, %l3 = 00000000ff00009f
	ldstuba	[%i4+%g0]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000010101420] = ffff000000000000, %l0 = 00000000000011ff, %l0 = 00000000000011ff
	add	%i4,0x20,%g1
	casxa	[%g1]0x80,%l0,%l0	! %l0 = ffff000000000000
!	%l2 = 0000000000000000, Mem[0000000010001410] = 00000032
	stba	%l2,[%i0+%o5]0x88	! Mem[0000000010001410] = 00000000
!	Mem[0000000030081408] = 000000ff, %l7 = 000000000000003b
	swapa	[%i2+%o4]0x89,%l7	! %l7 = 00000000000000ff
!	%l4 = 00000000, %l5 = 00ff0000, Mem[0000000010081410] = 00ff0000 000000ff, %asi = 80
	stda	%l4,[%i2+0x010]%asi	! Mem[0000000010081410] = 00000000 00ff0000

p0_label_264:
!	Starting 10 instruction Load Burst
!	Mem[0000000030081410] = 00000000 7400009f, %l6 = 00000000, %l7 = 000000ff
	ldda	[%i2+%o5]0x81,%l6	! %l6 = 0000000000000000 000000007400009f
!	Mem[0000000030101408] = 00000000, %l3 = 0000000000000000
	ldsba	[%i4+%o4]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000010181410] = 000000003b188dff, %f26 = ff000000 7f800000
	ldda	[%i6+%o5]0x88,%f26	! %f26 = 00000000 3b188dff
!	Mem[0000000030041400] = 11000000, %l2 = 0000000000000000
	ldswa	[%i1+%g0]0x81,%l2	! %l2 = 0000000011000000
!	Mem[0000000010181410] = ff8d183b, %l0 = ffff000000000000
	lduha	[%i6+%o5]0x80,%l0	! %l0 = 000000000000ff8d
!	Mem[0000000010101408] = 32000000, %l3 = 0000000000000000
	lduba	[%i4+%o4]0x80,%l3	! %l3 = 0000000000000032
!	Mem[0000000030081408] = 1f4e0e4c0000003b, %l2 = 0000000011000000
	ldxa	[%i2+%o4]0x89,%l2	! %l2 = 1f4e0e4c0000003b
!	%l7 = 000000007400009f, imm = fffffffffffff4b9, %l3 = 0000000000000032
	and	%l7,-0xb47,%l3		! %l3 = 0000000074000099
!	Mem[0000000010101410] = ffff0000, %l5 = 0000000000ff0000
	ldswa	[%i4+%o5]0x88,%l5	! %l5 = ffffffffffff0000
!	Mem[000000001000140a] = 4c0e4e1f, %l2 = 1f4e0e4c0000003b, %asi = 80
	ldsha	[%i0+0x00a]%asi,%l2	! %l2 = 0000000000004e1f

p0_label_265:
!	Starting 10 instruction Store Burst
!	%l6 = 00000000, %l7 = 7400009f, Mem[0000000010141420] = fccf480b 0000446a
	std	%l6,[%i5+0x020]		! Mem[0000000010141420] = 00000000 7400009f
!	Mem[0000000030081410] = 00000000, %l1 = 0000000000ff0000
	swapa	[%i2+%o5]0x81,%l1	! %l1 = 0000000000000000
!	%l6 = 0000000000000000, Mem[0000000030141408] = 00000000fc00ffff
	stxa	%l6,[%i5+%o4]0x81	! Mem[0000000030141408] = 0000000000000000
!	%l7 = 000000007400009f, %l7 = 000000007400009f, %l6 = 0000000000000000
	subc	%l7,%l7,%l6		! %l6 = 0000000000000000
!	%l4 = 0000000000000000, %l6 = 0000000000000000, %y  = 000001b2
	smul	%l4,%l6,%l4		! %l4 = 0000000000000000, %y = 00000000
!	Mem[0000000030001400] = ff000000, %l5 = 00000000ffff0000
	swapa	[%i0+%g0]0x81,%l5	! %l5 = 00000000ff000000
!	Mem[0000000010181434] = 0000009f, %l0 = 000000000000ff8d
	ldstub	[%i6+0x034],%l0		! %l0 = 0000000000000000
!	%f24 = ff000000, Mem[0000000010081410] = 00000000
	sta	%f24,[%i2+%o5]0x88	! Mem[0000000010081410] = ff000000
!	Mem[00000000100c1408] = 00000000, %l0 = 0000000000000000
	swapa	[%i3+%o4]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000010081410] = ff000000, %l7 = 000000007400009f
	ldstuba	[%i2+%o5]0x88,%l7	! %l7 = 0000000000000000

p0_label_266:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041430] = 32000000 5d000000, %l0 = 00000000, %l1 = 00000000, %asi = 80
	ldda	[%i1+0x030]%asi,%l0	! %l0 = 0000000032000000 000000005d000000
!	Mem[0000000010001408] = 1f4e0e4c, %l6 = 0000000000000000
	lduwa	[%i0+%o4]0x88,%l6	! %l6 = 000000001f4e0e4c
!	%f0  = 00000000, %f17 = 000000ff, %f6  = 2be94812
	fmuls	%f0 ,%f17,%f6 		! %f6  = 00000000
!	Mem[0000000010081434] = ffff00fc, %l6 = 000000001f4e0e4c
	ldsh	[%i2+0x034],%l6		! %l6 = ffffffffffffffff
!	Mem[0000000010081410] = ff0000ff00ff0000, %f24 = ff000000 fccf480b, %asi = 80
	ldda	[%i2+0x010]%asi,%f24	! %f24 = ff0000ff 00ff0000
!	Mem[0000000010141434] = 3b188dff, %f4  = 77000000
	ld	[%i5+0x034],%f4 	! %f4 = 3b188dff
!	Mem[0000000010041408] = 00000000, %l1 = 000000005d000000
	lduba	[%i1+%o4]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000030101400] = 2be9481200000000, %f28 = ffff00fc 0b48cffc
	ldda	[%i4+%g0]0x89,%f28	! %f28 = 2be94812 00000000
!	Mem[0000000010101408] = 32000000 5d000000, %l6 = ffffffff, %l7 = 00000000
	ldd	[%i4+%o4],%l6		! %l6 = 0000000032000000 000000005d000000
!	Mem[0000000010181408] = ffff00fc, %l4 = 0000000000000000
	ldswa	[%i6+%o4]0x80,%l4	! %l4 = ffffffffffff00fc

p0_label_267:
!	Starting 10 instruction Store Burst
!	%l4 = ffff00fc, %l5 = ff000000, Mem[0000000010181400] = ce1e422c 1711e3dc
	stda	%l4,[%i6+%g0]0x88	! Mem[0000000010181400] = ffff00fc ff000000
!	%f31 = 11000000, Mem[0000000010041400] = 00000000
	sta	%f31,[%i1+%g0]0x88	! Mem[0000000010041400] = 11000000
!	Mem[0000000030081410] = 00ff0000, %l6 = 0000000032000000
	ldstuba	[%i2+%o5]0x81,%l6	! %l6 = 0000000000000000
!	Mem[00000000300c1410] = 00000000, %l7 = 000000005d000000
	ldstuba	[%i3+%o5]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000030041408] = 00000000, %l2 = 0000000000004e1f
	ldstuba	[%i1+%o4]0x89,%l2	! %l2 = 0000000000000000
!	%l0 = 32000000, %l1 = 00000000, Mem[00000000300c1408] = 00000000 000000ff
	stda	%l0,[%i3+%o4]0x81	! Mem[00000000300c1408] = 32000000 00000000
!	%l1 = 0000000000000000, Mem[0000000030141400] = ffcd18ff
	stba	%l1,[%i5+%g0]0x89	! Mem[0000000030141400] = ffcd1800
!	%l2 = 0000000000000000, Mem[0000000010101408] = 32000000
	stba	%l2,[%i4+%o4]0x80	! Mem[0000000010101408] = 00000000
!	%l0 = 32000000, %l1 = 00000000, Mem[0000000010101400] = ff000000 00000000
	std	%l0,[%i4+%g0]		! Mem[0000000010101400] = 32000000 00000000
!	%f18 = ff8d183b 0000446a, Mem[0000000010001408] = 1f4e0e4c 00000000
	stda	%f18,[%i0+%o4]0x88	! Mem[0000000010001408] = ff8d183b 0000446a

p0_label_268:
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = 32000000 00000000, %l6 = 00000000, %l7 = 00000000
	ldda	[%i3+%o4]0x81,%l6	! %l6 = 0000000032000000 0000000000000000
!	Mem[00000000201c0000] = 00009298, %l0 = 0000000032000000, %asi = 80
	ldsba	[%o0+0x000]%asi,%l0	! %l0 = 0000000000000000
!	Mem[00000000100c1400] = 0000ff0000f20000, %l1 = 0000000000000000
	ldxa	[%i3+%g0]0x80,%l1	! %l1 = 0000ff0000f20000
!	Mem[00000000211c0000] = ffff8f28, %l7 = 0000000000000000, %asi = 80
	ldsha	[%o2+0x000]%asi,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010141408] = 00000000, %l1 = 0000ff0000f20000
	lduba	[%i5+%o4]0x88,%l1	! %l1 = 0000000000000000
!	Mem[00000000100c141e] = 1248e92b, %l6 = 0000000032000000, %asi = 80
	ldsba	[%i3+0x01e]%asi,%l6	! %l6 = ffffffffffffffe9
	membar	#Sync			! Added by membar checker (48)
!	Mem[0000000030081400] = 000000ff 0000ff00 3b000000 4c0e4e1f
!	Mem[0000000030081410] = ffff0000 7400009f 1f4e0e4c ffff00fc
!	Mem[0000000030081420] = 0000005d 00000032 000000ff fc00ffff
!	Mem[0000000030081430] = 9f000000 002a0000 00000000 fc00ffff
	ldda	[%i2+%g0]ASI_BLK_AIUSL,%f0 	! Block Load from 0000000030081400
!	Mem[0000000030001410] = 00000000, %f27 = 3b188dff
	lda	[%i0+%o5]0x81,%f27	! %f27 = 00000000
!	Mem[0000000010041410] = ff000000, %l3 = 0000000074000099
	ldsh	[%i1+%o5],%l3		! %l3 = ffffffffffffff00
!	Mem[0000000010101400] = 00000032, %l4 = ffffffffffff00fc
	lduba	[%i4+%g0]0x88,%l4	! %l4 = 0000000000000032

p0_label_269:
!	Starting 10 instruction Store Burst
!	Mem[0000000010041400] = 11000000, %l6 = ffffffffffffffe9
	ldstuba	[%i1+%g0]0x88,%l6	! %l6 = 0000000000000000
!	Mem[00000000100c1408] = 00000000, %l4 = 0000000000000032
	swapa	[%i3+%o4]0x80,%l4	! %l4 = 0000000000000000
!	%f28 = 2be94812 00000000, %l4 = 0000000000000000
!	Mem[0000000030181408] = 1248e92b78059fff
	add	%i6,0x008,%g1
	stda	%f28,[%g1+%l4]ASI_PST16_S ! Mem[0000000030181408] = 1248e92b78059fff
!	Mem[0000000010181400] = fc00ffff, %l2 = 0000000000000000, %asi = 80
	swapa	[%i6+0x000]%asi,%l2	! %l2 = 00000000fc00ffff
!	Mem[00000000100c1420] = 000000ff, %l5 = ff000000, %l2 = fc00ffff
	add	%i3,0x20,%g1
	casa	[%g1]0x80,%l5,%l2	! %l2 = 00000000000000ff
!	%l0 = 0000000000000000, Mem[0000000010181424] = 5d000000
	stw	%l0,[%i6+0x024]		! Mem[0000000010181424] = 00000000
!	%l0 = 0000000000000000, Mem[0000000010181400] = 00000000
	stba	%l0,[%i6+%g0]0x88	! Mem[0000000010181400] = 00000000
!	Mem[0000000020800040] = 11ff3ef8, %l7 = ffffffffffffffff
	ldstuba	[%o1+0x040]%asi,%l7	! %l7 = 0000000000000011
!	%l4 = 0000000000000000, imm = fffffffffffff3ce, %l1 = 0000000000000000
	sub	%l4,-0xc32,%l1		! %l1 = 0000000000000c32
!	Mem[0000000030081410] = 0000ffff, %l1 = 0000000000000c32
	ldstuba	[%i2+%o5]0x89,%l1	! %l1 = 00000000000000ff

p0_label_270:
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = 000000ff0000ff00, %l3 = ffffffffffffff00
	ldxa	[%i2+%g0]0x81,%l3	! %l3 = 000000ff0000ff00
!	Mem[00000000211c0000] = ffff8f28, %l2 = 00000000000000ff
	ldub	[%o2+%g0],%l2		! %l2 = 00000000000000ff
!	Mem[0000000010041400] = 110000ff, %f25 = 00ff0000
	lda	[%i1+%g0]0x88,%f25	! %f25 = 110000ff
!	Mem[0000000010141400] = 00000000, %l0 = 0000000000000000
	ldswa	[%i5+%g0]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000030081410] = ffff0000, %l6 = 0000000000000000
	ldswa	[%i2+%o5]0x81,%l6	! %l6 = ffffffffffff0000
!	Mem[0000000010081400] = 5bb85368, %l1 = 00000000000000ff
	lduba	[%i2+%g0]0x80,%l1	! %l1 = 000000000000005b
!	Mem[0000000010141408] = 00000000, %l4 = 0000000000000000
	ldsha	[%i5+%o4]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000030081408] = 3b000000, %l2 = 00000000000000ff
	ldsba	[%i2+%o4]0x81,%l2	! %l2 = 000000000000003b
!	Mem[0000000010041410] = 00ff0000000000ff, %f24 = ff0000ff 110000ff
	ldda	[%i1+%o5]0x88,%f24	! %f24 = 00ff0000 000000ff
!	Mem[00000000211c0001] = ffff8f28, %l6 = ffffffffffff0000
	ldstub	[%o2+0x001],%l6		! %l6 = 00000000000000ff

p0_label_271:
!	Starting 10 instruction Store Burst
!	Mem[000000001010142c] = 00000032, %l3 = 000000000000ff00, %asi = 80
	swapa	[%i4+0x02c]%asi,%l3	! %l3 = 0000000000000032
!	%l3 = 0000000000000032, Mem[0000000010141400] = 00000000
	stba	%l3,[%i5+%g0]0x88	! Mem[0000000010141400] = 00000032
!	%f14 = ffff00fc 00000000, Mem[0000000010101400] = 32000000 00000000
	stda	%f14,[%i4+%g0]0x80	! Mem[0000000010101400] = ffff00fc 00000000
!	%l4 = 00000000, %l5 = ff000000, Mem[0000000010101408] = 00000000 0000005d
	stda	%l4,[%i4+%o4]0x88	! Mem[0000000010101408] = 00000000 ff000000
!	%f20 = 00ff0000 ff000000, Mem[0000000010181410] = ff8d183b 00000000
	stda	%f20,[%i6+%o5]0x80	! Mem[0000000010181410] = 00ff0000 ff000000
	membar	#Sync			! Added by membar checker (49)
!	%l5 = 00000000ff000000, Mem[0000000030081410] = ffff0000
	stwa	%l5,[%i2+%o5]0x81	! Mem[0000000030081410] = ff000000
!	Mem[0000000030101400] = 00000000, %l6 = 00000000000000ff
	swapa	[%i4+%g0]0x89,%l6	! %l6 = 0000000000000000
!	%l5 = 00000000ff000000, Mem[0000000010081434] = ffff00fc, %asi = 80
	stwa	%l5,[%i2+0x034]%asi	! Mem[0000000010081434] = ff000000
!	%l7 = 0000000000000011, Mem[0000000021800140] = f20f1c48, %asi = 80
	stba	%l7,[%o3+0x140]%asi	! Mem[0000000021800140] = 110f1c48
!	%l7 = 0000000000000011, Mem[0000000030041410] = ffff00fc00000000
	stxa	%l7,[%i1+%o5]0x81	! Mem[0000000030041410] = 0000000000000011

p0_label_272:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1424] = 4cdb8901, %l1 = 000000000000005b, %asi = 80
	ldswa	[%i3+0x024]%asi,%l1	! %l1 = 000000004cdb8901
!	Mem[0000000030141408] = 00000000, %l0 = 0000000000000000
	ldsba	[%i5+%o4]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000010181408] = fc00ffff, %f0  = 00ff0000
	lda	[%i6+%o4]0x88,%f0 	! %f0 = fc00ffff
!	Mem[0000000010081410] = ff0000ff, %f7  = 4c0e4e1f
	lda	[%i2+%o5]0x88,%f7 	! %f7 = ff0000ff
!	Mem[0000000010101408] = 00000000000000ff, %f0  = fc00ffff ff000000
	ldda	[%i4+%o4]0x80,%f0 	! %f0  = 00000000 000000ff
!	Mem[0000000010141408] = 00000000 00000000, %l0 = 00000000, %l1 = 4cdb8901
	ldda	[%i5+%o4]0x80,%l0	! %l0 = 0000000000000000 0000000000000000
!	%f13 = 0000009f, %f15 = 00000000, %f2  = 1f4e0e4c 0000003b
	fsmuld	%f13,%f15,%f2 		! %f2  = 00000000 00000000
!	Mem[0000000010001428] = ffff00fc, %l6 = 0000000000000000
	ldsw	[%i0+0x028],%l6		! %l6 = ffffffffffff00fc
!	Mem[0000000030081408] = 0000003b, %l7 = 0000000000000011
	lduha	[%i2+%o4]0x89,%l7	! %l7 = 000000000000003b
!	%l7 = 000000000000003b, immd = fffffced, %y  = 00000000
	smul	%l7,-0x313,%l1		! %l1 = ffffffffffff4a9f, %y = ffffffff

p0_label_273:
!	Starting 10 instruction Store Burst
!	Mem[0000000010101400] = ffff00fc, %l4 = 0000000000000000
	swapa	[%i4+%g0]0x80,%l4	! %l4 = 00000000ffff00fc
!	%l1 = ffffffffffff4a9f, Mem[00000000201c0001] = 00009298
	stb	%l1,[%o0+0x001]		! Mem[00000000201c0000] = 009f9298
!	Mem[0000000010141410] = 11000000, %l4 = 00000000ffff00fc
	ldstuba	[%i5+%o5]0x80,%l4	! %l4 = 0000000000000011
!	Mem[00000000211c0000] = ffff8f28, %l5 = 00000000ff000000
	ldstuba	[%o2+0x000]%asi,%l5	! %l5 = 00000000000000ff
!	%f14 = ffff00fc 00000000, Mem[00000000300c1400] = 00000000 1c000000
	stda	%f14,[%i3+%g0]0x81	! Mem[00000000300c1400] = ffff00fc 00000000
!	%l3 = 0000000000000032, Mem[0000000010041410] = ff0000000000ff00
	stxa	%l3,[%i1+%o5]0x80	! Mem[0000000010041410] = 0000000000000032
!	%l3 = 0000000000000032, Mem[00000000201c0000] = 009f9298
	stb	%l3,[%o0+%g0]		! Mem[00000000201c0000] = 329f9298
!	Mem[0000000030181408] = 2be94812, %l1 = ffffffffffff4a9f
	ldstuba	[%i6+%o4]0x89,%l1	! %l1 = 0000000000000012
!	%f8  = 32000000 5d000000, Mem[00000000100c1400] = 00ff0000 0000f200
	stda	%f8 ,[%i3+%g0]0x88	! Mem[00000000100c1400] = 32000000 5d000000
!	%f6  = fc00ffff ff0000ff, Mem[0000000010001428] = ffff00fc ff000000, %asi = 80
	stda	%f6 ,[%i0+0x028]%asi	! Mem[0000000010001428] = fc00ffff ff0000ff

p0_label_274:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041402] = ff000011, %l0 = 0000000000000000
	ldub	[%i1+0x002],%l0		! %l0 = 0000000000000000
!	Mem[0000000010001410] = 00000000, %f25 = 000000ff
	lda	[%i0+%o5]0x80,%f25	! %f25 = 00000000
!	Mem[0000000030141400] = 0018cdff, %l0 = 0000000000000000
	ldsba	[%i5+%g0]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000030081400] = 000000ff, %l2 = 000000000000003b
	ldsba	[%i2+%g0]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000030041410] = 00000000, %l0 = 0000000000000000
	ldsba	[%i1+%o5]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000030101410] = 00000000, %f8  = 32000000
	lda	[%i4+%o5]0x89,%f8 	! %f8 = 00000000
	membar	#Sync			! Added by membar checker (50)
!	Mem[0000000010001400] = 00000000 fc00ffff 6a440000 3b188dff
!	Mem[0000000010001410] = 00000000 0000ff00 00000000 00000000
!	Mem[0000000010001420] = 0000446a 00000000 fc00ffff ff0000ff
!	Mem[0000000010001430] = 32000000 5d000000 00000000 00000000
	ldda	[%i0+%g0]ASI_BLK_AIUPL,%f0 	! Block Load from 0000000010001400
!	Mem[0000000010181410] = 0000ff00, %l1 = 0000000000000012
	lduha	[%i6+%o5]0x88,%l1	! %l1 = 000000000000ff00
!	Mem[0000000010181408] = ffff00fc00000000, %f16 = 1f4e0e4c 000000ff
	ldda	[%i6+%o4]0x80,%f16	! %f16 = ffff00fc 00000000
!	Mem[0000000010041410] = 0000000000000032, %l1 = 000000000000ff00
	ldxa	[%i1+%o5]0x80,%l1	! %l1 = 0000000000000032

p0_label_275:
!	Starting 10 instruction Store Burst
!	%l2 = 0000000000000000, Mem[00000000100c1408] = 000000329f000000
	stxa	%l2,[%i3+%o4]0x80	! Mem[00000000100c1408] = 0000000000000000
!	%l2 = 0000000000000000, Mem[0000000010141400] = 3200000000ff0000
	stxa	%l2,[%i5+%g0]0x80	! Mem[0000000010141400] = 0000000000000000
!	%l4 = 0000000000000011, Mem[0000000010141410] = 000000ff
	stba	%l4,[%i5+%o5]0x88	! Mem[0000000010141410] = 00000011
!	%l4 = 0000000000000011, Mem[00000000100c1400] = 0000005d
	stha	%l4,[%i3+%g0]0x80	! Mem[00000000100c1400] = 0011005d
!	Mem[0000000010141400] = 00000000, %l6 = 00000000ffff00fc
	swapa	[%i5+%g0]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000010141434] = 3b188dff, %l1 = 0000000000000032
	swap	[%i5+0x034],%l1		! %l1 = 000000003b188dff
!	Mem[0000000010101410] = ffff0000, %l2 = 0000000000000000
	ldstuba	[%i4+%o5]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000030041400] = 11000000, %l5 = 00000000000000ff
	ldstuba	[%i1+%g0]0x81,%l5	! %l5 = 0000000000000011
!	%f30 = 00000000 11000000, Mem[0000000010081400] = 5bb85368 456500ff
	std	%f30,[%i2+%g0]		! Mem[0000000010081400] = 00000000 11000000
!	Mem[0000000010081424] = fffffff2, %l4 = 00000011, %l7 = 0000003b
	add	%i2,0x24,%g1
	casa	[%g1]0x80,%l4,%l7	! %l7 = 00000000fffffff2

p0_label_276:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = 00000000 000000ff, %l4 = 00000011, %l5 = 00000011
	ldda	[%i4+%o4]0x80,%l4	! %l4 = 0000000000000000 00000000000000ff
!	Mem[0000000010001410] = 00ff0000 00000000, %l6 = 00000000, %l7 = fffffff2
	ldda	[%i0+%o5]0x88,%l6	! %l6 = 0000000000000000 0000000000ff0000
!	Mem[00000000100c1400] = 0011005d, %l5 = 00000000000000ff
	lduba	[%i3+%g0]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000030001400] = 9f0000ff0000ffff, %f30 = 00000000 11000000
	ldda	[%i0+%g0]0x89,%f30	! %f30 = 9f0000ff 0000ffff
!	Mem[0000000010001400] = 00000000, %l5 = 0000000000000000
	ldswa	[%i0+%g0]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000010101430] = 6a7a41ff00000000, %l1 = 000000003b188dff
	ldx	[%i4+0x030],%l1		! %l1 = 6a7a41ff00000000
!	Mem[0000000030101410] = 00000000, %l2 = 0000000000000000
	ldsha	[%i4+%o5]0x89,%l2	! %l2 = 0000000000000000
!	Mem[000000001018142c] = 0032001c, %l1 = 6a7a41ff00000000, %asi = 80
	lduwa	[%i6+0x02c]%asi,%l1	! %l1 = 000000000032001c
!	Mem[0000000030141408] = 00000000, %l4 = 0000000000000000
	ldswa	[%i5+%o4]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000010001408] = ff8d183b 0000446a, %l0 = 00000000, %l1 = 0032001c
	ldda	[%i0+%o4]0x88,%l0	! %l0 = 000000000000446a 00000000ff8d183b

p0_label_277:
!	Starting 10 instruction Store Burst
!	Mem[0000000010001420] = 0000446a, %l0 = 000000000000446a
	swap	[%i0+0x020],%l0		! %l0 = 000000000000446a
!	%f22 = 09c05727, %f15 = 00000000, %f21 = ff000000
	fmuls	%f22,%f15,%f21		! %f21 = 00000000
!	Mem[0000000030001400] = ffff0000, %l0 = 000000000000446a
	swapa	[%i0+%g0]0x81,%l0	! %l0 = 00000000ffff0000
!	%f12 = 0000005d, Mem[0000000010081424] = fffffff2
	st	%f12,[%i2+0x024]	! Mem[0000000010081424] = 0000005d
!	Mem[0000000030041408] = ff000000, %l0 = 00000000ffff0000
	ldstuba	[%i1+%o4]0x81,%l0	! %l0 = 00000000000000ff
	membar	#Sync			! Added by membar checker (51)
!	%l6 = 00000000, %l7 = 00ff0000, Mem[0000000010001408] = 6a440000 3b188dff
	stda	%l6,[%i0+%o4]0x80	! Mem[0000000010001408] = 00000000 00ff0000
!	%l0 = 00000000000000ff, Mem[0000000010141408] = 00000000
	stha	%l0,[%i5+%o4]0x80	! Mem[0000000010141408] = 00ff0000
!	%l1 = 00000000ff8d183b, Mem[0000000021800000] = 1a90db58
	stb	%l1,[%o3+%g0]		! Mem[0000000021800000] = 3b90db58
!	Mem[0000000020800000] = ffffeac8, %l1 = 00000000ff8d183b
	ldstuba	[%o1+0x000]%asi,%l1	! %l1 = 00000000000000ff
!	%l7 = 0000000000ff0000, Mem[0000000030001408] = ffff00fc
	stwa	%l7,[%i0+%o4]0x81	! Mem[0000000030001408] = 00ff0000

p0_label_278:
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = 0018cdff, %l1 = 00000000000000ff
	lduba	[%i5+%g0]0x81,%l1	! %l1 = 0000000000000000
!	Mem[00000000201c0000] = 329f9298, %l2 = 0000000000000000
	ldub	[%o0+%g0],%l2		! %l2 = 0000000000000032
!	Mem[0000000010181408] = ffff00fc00000000, %f12 = 0000005d 00000032, %asi = 80
	ldda	[%i6+0x008]%asi,%f12	! %f12 = ffff00fc 00000000
!	Mem[0000000010001400] = ffff00fc 00000000, %l0 = 000000ff, %l1 = 00000000
	ldda	[%i0+%g0]0x88,%l0	! %l0 = 0000000000000000 00000000ffff00fc
!	Mem[0000000010041428] = 0000000000000000, %l6 = 0000000000000000, %asi = 80
	ldxa	[%i1+0x028]%asi,%l6	! %l6 = 0000000000000000
!	Mem[0000000010001410] = 00000000, %f0  = ffff00fc
	lda	[%i0+%o5]0x80,%f0 	! %f0 = 00000000
!	Mem[0000000030101408] = 0000000000000000, %l6 = 0000000000000000
	ldxa	[%i4+%o4]0x81,%l6	! %l6 = 0000000000000000
!	Mem[00000000100c1408] = 00000000, %l4 = 0000000000000000
	lduha	[%i3+%o4]0x88,%l4	! %l4 = 0000000000000000
!	Mem[000000001010140e] = 000000ff, %l4 = 0000000000000000, %asi = 80
	lduha	[%i4+0x00e]%asi,%l4	! %l4 = 00000000000000ff
!	Mem[0000000020800000] = ffffeac8, %l4 = 00000000000000ff
	ldub	[%o1+%g0],%l4		! %l4 = 00000000000000ff

p0_label_279:
!	Starting 10 instruction Store Burst
!	%l1 = 00000000ffff00fc, Mem[0000000010181410] = 00ff0000
	stba	%l1,[%i6+%o5]0x80	! Mem[0000000010181410] = fcff0000
!	%f12 = ffff00fc, Mem[0000000010041408] = 00000000
	sta	%f12,[%i1+%o4]0x88	! Mem[0000000010041408] = ffff00fc
!	%l4 = 000000ff, %l5 = 00000000, Mem[0000000010101400] = 00000000 00000000
	stda	%l4,[%i4+%g0]0x88	! Mem[0000000010101400] = 000000ff 00000000
!	%l2 = 0000000000000032, Mem[0000000010041425] = 00000000
	stb	%l2,[%i1+0x025]		! Mem[0000000010041424] = 00320000
!	Mem[000000001010142c] = 0000ff00, %l7 = 00ff0000, %l1 = ffff00fc
	add	%i4,0x2c,%g1
	casa	[%g1]0x80,%l7,%l1	! %l1 = 000000000000ff00
!	Mem[00000000100c1420] = 000000ff, %l1 = 000000000000ff00
	swap	[%i3+0x020],%l1		! %l1 = 00000000000000ff
!	%l1 = 00000000000000ff, Mem[0000000030181410] = 00000077
	stba	%l1,[%i6+%o5]0x89	! Mem[0000000030181410] = 000000ff
!	Mem[0000000010141408] = 0000ff00, %l3 = 0000000000000032
	ldstuba	[%i5+%o4]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000030001400] = 6a440000, %l3 = 0000000000000000
	swapa	[%i0+%g0]0x89,%l3	! %l3 = 000000006a440000
!	Mem[0000000030101400] = 000000ff, %l0 = 0000000000000000
	ldstuba	[%i4+%g0]0x89,%l0	! %l0 = 00000000000000ff

p0_label_280:
!	Starting 10 instruction Load Burst
!	Mem[0000000030081410] = 000000ff, %l3 = 000000006a440000
	ldswa	[%i2+%o5]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010101410] = ff00ffff, %f4  = 00ff0000
	lda	[%i4+%o5]0x80,%f4 	! %f4 = ff00ffff
!	Mem[0000000010041408] = fc00ffff, %l6 = 0000000000000000
	lduw	[%i1+%o4],%l6		! %l6 = 00000000fc00ffff
!	Mem[0000000010081424] = 0000005d, %l6 = 00000000fc00ffff, %asi = 80
	lduwa	[%i2+0x024]%asi,%l6	! %l6 = 000000000000005d
!	Mem[00000000100c140d] = 00000000, %l0 = 00000000000000ff
	ldub	[%i3+0x00d],%l0		! %l0 = 0000000000000000
!	Mem[0000000030101408] = 00000000, %l1 = 00000000000000ff
	lduba	[%i4+%o4]0x89,%l1	! %l1 = 0000000000000000
!	Mem[00000000300c1408] = 32000000, %l2 = 0000000000000032
	ldswa	[%i3+%o4]0x81,%l2	! %l2 = 0000000032000000
!	Mem[0000000030181410] = ff00000000000000, %l6 = 000000000000005d
	ldxa	[%i6+%o5]0x81,%l6	! %l6 = ff00000000000000
!	Mem[0000000010081430] = 1f4e0e4c ff000000, %l6 = 00000000, %l7 = 00ff0000, %asi = 80
	ldda	[%i2+0x030]%asi,%l6	! %l6 = 000000001f4e0e4c 00000000ff000000
!	Mem[0000000010041410] = 00000000, %l4 = 00000000000000ff
	ldsha	[%i1+%o5]0x88,%l4	! %l4 = 0000000000000000

p0_label_281:
!	Starting 10 instruction Store Burst
!	%f0  = 00000000, Mem[0000000030101400] = 000000ff
	sta	%f0 ,[%i4+%g0]0x89	! Mem[0000000030101400] = 00000000
!	%f26 = 00000000 00000000, Mem[0000000010001418] = 00000000 00000000
	std	%f26,[%i0+0x018]	! Mem[0000000010001418] = 00000000 00000000
!	Mem[0000000010081434] = ff000000, %l2 = 0000000032000000
	swap	[%i2+0x034],%l2		! %l2 = 00000000ff000000
!	%f28 = 2be94812, Mem[0000000030001408] = 00ff0000
	sta	%f28,[%i0+%o4]0x81	! Mem[0000000030001408] = 2be94812
!	%l6 = 000000001f4e0e4c, Mem[0000000010081410] = ff0000ff
	stwa	%l6,[%i2+%o5]0x80	! Mem[0000000010081410] = 1f4e0e4c
!	Mem[0000000010001410] = 00000000, %l3 = 00000000000000ff
	swapa	[%i0+%o5]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000030181408] = 2be948ff, %l6 = 000000001f4e0e4c
	swapa	[%i6+%o4]0x89,%l6	! %l6 = 000000002be948ff
!	Mem[0000000010101408] = 00000000, %l6 = 000000002be948ff
	ldstuba	[%i4+%o4]0x88,%l6	! %l6 = 0000000000000000
!	%l2 = 00000000ff000000, Mem[0000000010001400] = 00000000
	stba	%l2,[%i0+%g0]0x80	! Mem[0000000010001400] = 00000000
!	Mem[0000000010041434] = 5d000000, %l6 = 0000000000000000
	swap	[%i1+0x034],%l6		! %l6 = 000000005d000000

p0_label_282:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101420] = ffff0000, %l2 = 00000000ff000000, %asi = 80
	ldswa	[%i4+0x020]%asi,%l2	! %l2 = ffffffffffff0000
!	Mem[0000000021800000] = 3b90db58, %l2 = ffffffffffff0000, %asi = 80
	lduha	[%o3+0x000]%asi,%l2	! %l2 = 0000000000003b90
!	Mem[0000000030081410] = ff000000, %f12 = ffff00fc
	lda	[%i2+%o5]0x81,%f12	! %f12 = ff000000
!	Mem[0000000010181400] = 00000000, %l3 = 0000000000000000
	ldsba	[%i6+%g0]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000010101408] = 000000ff, %l0 = 0000000000000000
	ldswa	[%i4+%o4]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010081410] = 1f4e0e4c00ff0000, %f12 = ff000000 00000000, %asi = 80
	ldda	[%i2+0x010]%asi,%f12	! %f12 = 1f4e0e4c 00ff0000
!	Mem[0000000010181408] = ffff00fc, %l4 = 0000000000000000, %asi = 80
	ldswa	[%i6+0x008]%asi,%l4	! %l4 = ffffffffffff00fc
!	Mem[0000000021800080] = 488c67b8, %l7 = 00000000ff000000
	ldsb	[%o3+0x080],%l7		! %l7 = 0000000000000048
!	Mem[00000000300c1400] = ffff00fc, %l3 = 0000000000000000
	lduha	[%i3+%g0]0x81,%l3	! %l3 = 000000000000ffff
!	Mem[000000001004142c] = 00000000, %l7 = 0000000000000048, %asi = 80
	lduha	[%i1+0x02c]%asi,%l7	! %l7 = 0000000000000000

p0_label_283:
!	Starting 10 instruction Store Burst
!	%l1 = 0000000000000000, Mem[0000000010141408] = 0000ffff
	stha	%l1,[%i5+%o4]0x88	! Mem[0000000010141408] = 00000000
!	%l3 = 000000000000ffff, Mem[00000000300c1408] = 0000000000000032
	stxa	%l3,[%i3+%o4]0x89	! Mem[00000000300c1408] = 000000000000ffff
!	Mem[0000000010101400] = ff000000, %l5 = 0000000000000000
	ldstuba	[%i4+%g0]0x80,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030101400] = 00000000 1248e92b 00000000 00000000
!	%f0  = 00000000 00000000 ff8d183b 0000446a
!	%f4  = ff00ffff 00000000 00000000 00000000
!	%f8  = 00000000 6a440000 ff0000ff ffff00fc
!	%f12 = 1f4e0e4c 00ff0000 00000000 00000000
	stda	%f0 ,[%i4+%g0]ASI_BLK_AIUS	! Block Store to 0000000030101400
!	%l2 = 00003b90, %l3 = 0000ffff, Mem[0000000010141410] = 00000011 00000000
	stda	%l2,[%i5+%o5]0x88	! Mem[0000000010141410] = 00003b90 0000ffff
!	%l6 = 000000005d000000, Mem[0000000030141408] = 00000000
	stwa	%l6,[%i5+%o4]0x81	! Mem[0000000030141408] = 5d000000
!	%l2 = 00003b90, %l3 = 0000ffff, Mem[0000000010101408] = ff000000 000000ff
	stda	%l2,[%i4+%o4]0x80	! Mem[0000000010101408] = 00003b90 0000ffff
!	%l5 = 00000000000000ff, Mem[00000000100c140e] = 00000000
	stb	%l5,[%i3+0x00e]		! Mem[00000000100c140c] = 0000ff00
!	Mem[00000000100c1418] = 09c05727, %l3 = 000000000000ffff
	swap	[%i3+0x018],%l3		! %l3 = 0000000009c05727
!	%f14 = 00000000 00000000, Mem[00000000300c1400] = ffff00fc 00000000
	stda	%f14,[%i3+%g0]0x81	! Mem[00000000300c1400] = 00000000 00000000

p0_label_284:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = 903b0000, %l5 = 00000000000000ff
	ldsha	[%i5+%o5]0x80,%l5	! %l5 = ffffffffffff903b
!	%f1  = 00000000, %f0  = 00000000, %f21 = 00000000
	fsubs	%f1 ,%f0 ,%f21		! %f21 = 00000000
!	Mem[00000000201c0001] = 329f9298, %l2 = 0000000000003b90
	ldsb	[%o0+0x001],%l2		! %l2 = ffffffffffffff9f
!	Mem[0000000030181408] = 4c0e4e1f, %l0 = 00000000000000ff
	lduha	[%i6+%o4]0x81,%l0	! %l0 = 0000000000004c0e
!	Mem[0000000030141410] = 456500ff, %f17 = 00000000
	lda	[%i5+%o5]0x89,%f17	! %f17 = 456500ff
!	Mem[0000000030141410] = ff0065456853b85b, %f18 = ff8d183b 0000446a
	ldda	[%i5+%o5]0x81,%f18	! %f18 = ff006545 6853b85b
!	Mem[0000000010181408] = fc00ffff, %l7 = 0000000000000000
	ldsha	[%i6+%o4]0x88,%l7	! %l7 = ffffffffffffffff
!	Mem[00000000100c1428] = 0000000000000000, %l3 = 0000000009c05727
	ldx	[%i3+0x028],%l3		! %l3 = 0000000000000000
!	Mem[0000000010081410] = 1f4e0e4c00ff0000, %l5 = ffffffffffff903b
	ldxa	[%i2+%o5]0x80,%l5	! %l5 = 1f4e0e4c00ff0000
!	Mem[0000000030081408] = 3b000000, %l4 = ffffffffffff00fc
	ldsha	[%i2+%o4]0x81,%l4	! %l4 = 0000000000003b00

p0_label_285:
!	Starting 10 instruction Store Burst
!	Mem[0000000010041414] = 00000032, %l0 = 0000000000004c0e
	swap	[%i1+0x014],%l0		! %l0 = 0000000000000032
!	Mem[0000000010041400] = ff000011, %l5 = 0000000000ff0000
	swapa	[%i1+%g0]0x80,%l5	! %l5 = 00000000ff000011
	membar	#Sync			! Added by membar checker (52)
!	Mem[0000000010101408] = 903b0000, %l3 = 0000000000000000
	swapa	[%i4+%o4]0x88,%l3	! %l3 = 00000000903b0000
!	%l1 = 0000000000000000, Mem[00000000100c1428] = 0000000000000000
	stx	%l1,[%i3+0x028]		! Mem[00000000100c1428] = 0000000000000000
!	Mem[0000000030101400] = 00000000, %l2 = ffffffffffffff9f
	ldstuba	[%i4+%g0]0x89,%l2	! %l2 = 0000000000000000
!	%l4 = 0000000000003b00, Mem[0000000010101400] = ff000000
	stba	%l4,[%i4+%g0]0x80	! Mem[0000000010101400] = 00000000
!	%l6 = 000000005d000000, Mem[0000000030081400] = ff000000
	stha	%l6,[%i2+%g0]0x89	! Mem[0000000030081400] = ff000000
!	Mem[00000000211c0001] = ffff8f28, %l0 = 0000000000000032
	ldstub	[%o2+0x001],%l0		! %l0 = 00000000000000ff
!	%l0 = 000000ff, %l1 = 00000000, Mem[0000000010101400] = 00000000 00000000
	stda	%l0,[%i4+%g0]0x88	! Mem[0000000010101400] = 000000ff 00000000
!	%l6 = 000000005d000000, Mem[00000000300c1400] = 00000000
	stwa	%l6,[%i3+%g0]0x89	! Mem[00000000300c1400] = 5d000000

p0_label_286:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = 6c47000000000000, %l0 = 00000000000000ff
	ldxa	[%i3+%o5]0x88,%l0	! %l0 = 6c47000000000000
!	Mem[0000000010181400] = 00000000, %l5 = 00000000ff000011
	ldsba	[%i6+%g0]0x88,%l5	! %l5 = 0000000000000000
!	%l3 = 00000000903b0000, immd = fffffffffffff058, %l108 = 0000000000000007
	sdivx	%l3,-0xfa8,%l7		! %l7 = fffffffffff6c9a6
!	Mem[000000001018141c] = 00000000, %l2 = 0000000000000000
	lduh	[%i6+0x01c],%l2		! %l2 = 0000000000000000
!	%f3  = 0000446a, %f31 = 0000ffff
	fsqrts	%f3 ,%f31		! tt=0x22, %l0 = 6c47000000000022
!	Mem[0000000010081400] = 00000000, %l2 = 0000000000000000
	lduwa	[%i2+%g0]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000010001408] = 0000ff00 00000000, %l0 = 00000022, %l1 = 00000000
	ldda	[%i0+%o4]0x88,%l0	! %l0 = 0000000000000000 000000000000ff00
!	Mem[0000000010141400] = fc00ffff, %l3 = 00000000903b0000
	ldswa	[%i5+%g0]0x88,%l3	! %l3 = fffffffffc00ffff
!	Mem[0000000010181408] = fc00ffff, %l4 = 0000000000003b00
	lduwa	[%i6+%o4]0x88,%l4	! %l4 = 00000000fc00ffff
!	Mem[0000000030181410] = ff000000, %f20 = 00ff0000
	lda	[%i6+%o5]0x81,%f20	! %f20 = ff000000

p0_label_287:
!	Starting 10 instruction Store Burst
!	%f10 = ff0000ff ffff00fc, %l3 = fffffffffc00ffff
!	Mem[0000000030141408] = 5d00000000000000
	add	%i5,0x008,%g1
	stda	%f10,[%g1+%l3]ASI_PST8_S ! Mem[0000000030141408] = ff0000ffffff00fc
!	Mem[0000000030001410] = 00000000, %l1 = 000000000000ff00
	swapa	[%i0+%o5]0x89,%l1	! %l1 = 0000000000000000
!	%f14 = 00000000, Mem[0000000010141430] = fccf480b
	sta	%f14,[%i5+0x030]%asi	! Mem[0000000010141430] = 00000000
!	%l1 = 0000000000000000, Mem[0000000010041400] = 00ff0000fc00ffff
	stxa	%l1,[%i1+%g0]0x80	! Mem[0000000010041400] = 0000000000000000
!	%l3 = fffffffffc00ffff, Mem[0000000030141400] = ffcd1800
	stwa	%l3,[%i5+%g0]0x89	! Mem[0000000030141400] = fc00ffff
!	Mem[0000000010181400] = 00000000, %l1 = 0000000000000000
	swapa	[%i6+%g0]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000030181400] = 00000000 00000000 4c0e4e1f 78059fff
!	%f16 = ffff00fc 456500ff ff006545 6853b85b
!	%f20 = ff000000 00000000 09c05727 00000000
!	%f24 = 00ff0000 00000000 00000000 00000000
!	%f28 = 2be94812 00000000 9f0000ff 0000ffff
	stda	%f16,[%i6+%g0]ASI_BLK_AIUS	! Block Store to 0000000030181400
!	Mem[0000000030041408] = ff000000, %l5 = 0000000000000000
	swapa	[%i1+%o4]0x81,%l5	! %l5 = 00000000ff000000
!	Mem[0000000030081400] = 000000ff, %l0 = 0000000000000000
	swapa	[%i2+%g0]0x81,%l0	! %l0 = 00000000000000ff
!	Mem[0000000020800001] = ffffeac8, %l3 = fffffffffc00ffff
	ldstub	[%o1+0x001],%l3		! %l3 = 00000000000000ff

p0_label_288:
!	Starting 10 instruction Load Burst
!	%f3  = 0000446a, %f16 = ffff00fc, %f4  = ff00ffff
	fsubs	%f3 ,%f16,%f4 		! %f4  = ffff00fc
	membar	#Sync			! Added by membar checker (53)
!	Mem[0000000030181408] = 5bb85368 456500ff, %l0 = 000000ff, %l1 = 00000000
	ldda	[%i6+%o4]0x89,%l0	! %l0 = 00000000456500ff 000000005bb85368
!	Mem[0000000010181410] = fcff0000, %l5 = 00000000ff000000
	lduwa	[%i6+%o5]0x80,%l5	! %l5 = 00000000fcff0000
!	Mem[0000000010181410] = 0000fffc, %l6 = 000000005d000000
	lduwa	[%i6+%o5]0x88,%l6	! %l6 = 000000000000fffc
!	Mem[0000000010181400] = 00000000, %l6 = 000000000000fffc
	ldswa	[%i6+%g0]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000010081438] = 1c00000000000032, %f26 = 00000000 00000000
	ldd	[%i2+0x038],%f26	! %f26 = 1c000000 00000032
!	Mem[0000000010001410] = 000000ff, %f0  = 00000000
	lda	[%i0+%o5]0x80,%f0 	! %f0 = 000000ff
!	Mem[00000000300c1400] = 0000005d, %l5 = 00000000fcff0000
	ldsha	[%i3+%g0]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000010041439] = 00000000, %l1 = 000000005bb85368, %asi = 80
	ldsba	[%i1+0x039]%asi,%l1	! %l1 = 0000000000000000
!	Mem[0000000010181400] = 00000000000000ff, %f28 = 2be94812 00000000
	ldda	[%i6+%g0]0x80,%f28	! %f28 = 00000000 000000ff

p0_label_289:
!	Starting 10 instruction Store Burst
!	%l4 = 00000000fc00ffff, Mem[0000000010001408] = 0000000000ff0000
	stxa	%l4,[%i0+%o4]0x80	! Mem[0000000010001408] = 00000000fc00ffff
!	%l4 = 00000000fc00ffff, Mem[0000000010101400] = ff000000, %asi = 80
	stwa	%l4,[%i4+0x000]%asi	! Mem[0000000010101400] = fc00ffff
!	%f14 = 00000000 00000000, %l2 = 0000000000000000
!	Mem[0000000010141428] = 1c00000fff9d1c37
	add	%i5,0x028,%g1
	stda	%f14,[%g1+%l2]ASI_PST32_PL ! Mem[0000000010141428] = 1c00000fff9d1c37
!	Mem[0000000010141400] = fc00ffff, %l0 = 00000000456500ff
	ldstuba	[%i5+%g0]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010001408] = 00000000, %l2 = 0000000000000000
	swapa	[%i0+%o4]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000030181410] = 000000ff, %l7 = 00000000fff6c9a6
	swapa	[%i6+%o5]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[00000000100c1417] = 0000476c, %l2 = 0000000000000000
	ldstuba	[%i3+0x017]%asi,%l2	! %l2 = 000000000000006c
!	%l2 = 000000000000006c, Mem[0000000010101410] = ffff00ff
	stha	%l2,[%i4+%o5]0x88	! Mem[0000000010101410] = ffff006c
!	%f26 = 1c000000 00000032, Mem[0000000010101410] = 6c00ffff 0000001c
	stda	%f26,[%i4+%o5]0x80	! Mem[0000000010101410] = 1c000000 00000032
!	%l5 = 0000000000000000, Mem[0000000010001408] = 00000000fc00ffff
	stxa	%l5,[%i0+%o4]0x80	! Mem[0000000010001408] = 0000000000000000

p0_label_290:
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = ff8d183b0000446a, %f14 = 00000000 00000000
	ldda	[%i4+%o4]0x81,%f14	! %f14 = ff8d183b 0000446a
!	Mem[0000000010081400] = 00000000, %l6 = 0000000000000000
	ldswa	[%i2+%g0]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000010181432] = 00002a00, %l7 = 00000000000000ff
	ldsh	[%i6+0x032],%l7		! %l7 = 0000000000002a00
!	Mem[0000000010081402] = 00000000, %l5 = 0000000000000000
	ldsh	[%i2+0x002],%l5		! %l5 = 0000000000000000
!	Mem[0000000010081410] = 1f4e0e4c00ff0000, %f20 = ff000000 00000000
	ldd	[%i2+%o5],%f20		! %f20 = 1f4e0e4c 00ff0000
!	Mem[0000000030081408] = 3b0000004c0e4e1f, %l6 = 0000000000000000
	ldxa	[%i2+%o4]0x81,%l6	! %l6 = 3b0000004c0e4e1f
!	Mem[00000000300c1400] = 0000005d, %f30 = 9f0000ff
	lda	[%i3+%g0]0x81,%f30	! %f30 = 0000005d
!	Mem[0000000030101410] = ff00ffff00000000, %l4 = 00000000fc00ffff
	ldxa	[%i4+%o5]0x81,%l4	! %l4 = ff00ffff00000000
!	Mem[00000000100c1408] = 00000000, %l4 = ff00ffff00000000
	lduwa	[%i3+%o4]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000030141400] = ffff00fc, %l1 = 0000000000000000
	ldsba	[%i5+%g0]0x81,%l1	! %l1 = ffffffffffffffff

p0_label_291:
!	Starting 10 instruction Store Burst
!	%f29 = 000000ff, Mem[00000000100c1410] = 00000000
	sta	%f29,[%i3+%o5]0x80	! Mem[00000000100c1410] = 000000ff
!	%l0 = 00000000000000ff, Mem[0000000020800040] = ffff3ef8, %asi = 80
	stha	%l0,[%o1+0x040]%asi	! Mem[0000000020800040] = 00ff3ef8
!	%l2 = 000000000000006c, Mem[0000000030041408] = 00000000
	stha	%l2,[%i1+%o4]0x81	! Mem[0000000030041408] = 006c0000
!	%l6 = 3b0000004c0e4e1f, Mem[00000000100c1410] = 000000ff
	stwa	%l6,[%i3+%o5]0x80	! Mem[00000000100c1410] = 4c0e4e1f
!	%f22 = 09c05727, Mem[0000000010081410] = 4c0e4e1f
	sta	%f22,[%i2+%o5]0x88	! Mem[0000000010081410] = 09c05727
!	%f0  = 000000ff 00000000, %l0 = 00000000000000ff
!	Mem[0000000010181438] = ffff00fc00000000
	add	%i6,0x038,%g1
	stda	%f0,[%g1+%l0]ASI_PST8_PL ! Mem[0000000010181438] = 00000000ff000000
!	%l2 = 0000006c, %l3 = 000000ff, Mem[0000000030101408] = ff8d183b 0000446a
	stda	%l2,[%i4+%o4]0x81	! Mem[0000000030101408] = 0000006c 000000ff
!	Mem[0000000010101410] = 1c000000, %l0 = 000000ff, %l5 = 00000000
	add	%i4,0x10,%g1
	casa	[%g1]0x80,%l0,%l5	! %l5 = 000000001c000000
!	Mem[0000000010101420] = ffff0000, %l0 = 000000ff, %l0 = 000000ff
	add	%i4,0x20,%g1
	casa	[%g1]0x80,%l0,%l0	! %l0 = 00000000ffff0000
!	Mem[0000000010001434] = 5d000000, %l3 = 00000000000000ff
	ldstub	[%i0+0x034],%l3		! %l3 = 000000000000005d

p0_label_292:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041421] = 0000446a, %l3 = 000000000000005d, %asi = 80
	ldsba	[%i1+0x021]%asi,%l3	! %l3 = 0000000000000000
!	Mem[0000000020800000] = ffffeac8, %l5 = 000000001c000000
	ldub	[%o1+%g0],%l5		! %l5 = 00000000000000ff
!	Mem[0000000010041408] = ffff00fc, %l2 = 000000000000006c
	ldsba	[%i1+%o4]0x88,%l2	! %l2 = fffffffffffffffc
!	Mem[0000000010041410] = 00000000, %l7 = 0000000000002a00
	lduba	[%i1+%o5]0x88,%l7	! %l7 = 0000000000000000
!	Mem[00000000100c1400] = 0011005d 00000032, %l2 = fffffffc, %l3 = 00000000
	ldda	[%i3+%g0]0x80,%l2	! %l2 = 000000000011005d 0000000000000032
!	Mem[0000000010081400] = 00000000, %l6 = 3b0000004c0e4e1f
	ldsha	[%i2+%g0]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000010001400] = 00000000, %l1 = ffffffffffffffff
	ldsba	[%i0+%g0]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000020800000] = ffffeac8, %l5 = 00000000000000ff, %asi = 80
	ldsba	[%o1+0x000]%asi,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000030141400] = ffff00fc 0000ff00 ff0000ff ffff00fc
!	Mem[0000000030141410] = ff006545 6853b85b 0e7254a0 537d1e31
!	Mem[0000000030141420] = 0e7254a0 00005d00 43da12de 0e78e4b7
!	Mem[0000000030141430] = 0000005d 45652dc9 1b62e111 000020fb
	ldda	[%i5+%g0]ASI_BLK_AIUSL,%f16	! Block Load from 0000000030141400
!	Mem[00000000300c1410] = ff000000, %l4 = 0000000000000000
	ldsha	[%i3+%o5]0x81,%l4	! %l4 = ffffffffffffff00

p0_label_293:
!	Starting 10 instruction Store Burst
!	Mem[0000000010181422] = 32000000, %l6 = 0000000000000000
	ldstuba	[%i6+0x022]%asi,%l6	! %l6 = 0000000000000000
!	Mem[0000000010041410] = 00000000, %l1 = 0000000000000000
	ldstuba	[%i1+%o5]0x88,%l1	! %l1 = 0000000000000000
!	%l6 = 00000000, %l7 = 00000000, Mem[0000000030001410] = 00ff0000 94000000
	stda	%l6,[%i0+%o5]0x81	! Mem[0000000030001410] = 00000000 00000000
!	%l2 = 000000000011005d, Mem[00000000100c1410] = ff4700001f4e0e4c
	stxa	%l2,[%i3+%o5]0x88	! Mem[00000000100c1410] = 000000000011005d
!	Mem[0000000010181423] = 3200ff00, %l5 = ffffffffffffffff
	ldstuba	[%i6+0x023]%asi,%l5	! %l5 = 0000000000000000
!	Mem[0000000030181410] = a6c9f6ff, %l5 = 0000000000000000
	swapa	[%i6+%o5]0x81,%l5	! %l5 = 00000000a6c9f6ff
!	%f30 = fb200000, Mem[0000000010041410] = ff000000
	sta	%f30,[%i1+%o5]0x80	! Mem[0000000010041410] = fb200000
!	Mem[0000000010001400] = 00000000fc00ffff, %l3 = 0000000000000032, %l3 = 0000000000000032
	casxa	[%i0]0x80,%l3,%l3	! %l3 = 00000000fc00ffff
!	%l6 = 00000000, %l7 = 00000000, Mem[0000000010101420] = ffff0000 00000000, %asi = 80
	stda	%l6,[%i4+0x020]%asi	! Mem[0000000010101420] = 00000000 00000000
!	%l0 = ffff0000, %l1 = 00000000, Mem[0000000010141430] = 00000000 00000032, %asi = 80
	stda	%l0,[%i5+0x030]%asi	! Mem[0000000010141430] = ffff0000 00000000

p0_label_294:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = 000000ff, %l7 = 0000000000000000
	ldsha	[%i0+%o5]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000030081408] = 3b000000 4c0e4e1f, %l6 = 00000000, %l7 = 00000000
	ldda	[%i2+%o4]0x81,%l6	! %l6 = 000000003b000000 000000004c0e4e1f
!	Mem[00000000300c1408] = ffff0000, %l5 = 00000000a6c9f6ff
	ldsha	[%i3+%o4]0x81,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000030041408] = 00006c00, %l3 = 00000000fc00ffff
	ldsba	[%i1+%o4]0x89,%l3	! %l3 = 0000000000000000
!	%l0 = 00000000ffff0000, Mem[0000000030181410] = 0000000000000000
	stxa	%l0,[%i6+%o5]0x81	! Mem[0000000030181410] = 00000000ffff0000
!	Mem[0000000010081410] = 2757c009, %f14 = ff8d183b
	lda	[%i2+%o5]0x80,%f14	! %f14 = 2757c009
!	Mem[00000000100c1410] = 5d001100, %l6 = 000000003b000000
	ldswa	[%i3+%o5]0x80,%l6	! %l6 = 000000005d001100
!	Mem[0000000030101400] = ff000000, %l5 = ffffffffffffffff
	lduwa	[%i4+%g0]0x81,%l5	! %l5 = 00000000ff000000
!	Mem[00000000100c142c] = 00000000, %l6 = 000000005d001100
	lduw	[%i3+0x02c],%l6		! %l6 = 0000000000000000
!	Mem[0000000010001410] = ff000000, %f15 = 0000446a
	lda	[%i0+%o5]0x88,%f15	! %f15 = ff000000

p0_label_295:
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1400] = 0000005d, %l4 = 00000000ffffff00
	swapa	[%i3+%g0]0x81,%l4	! %l4 = 000000000000005d
!	%f28 = c92d6545, Mem[0000000010141418] = 000d11e1
	st	%f28,[%i5+0x018]	! Mem[0000000010141418] = c92d6545
!	%l4 = 000000000000005d, Mem[0000000010181403] = 00000000
	stb	%l4,[%i6+0x003]		! Mem[0000000010181400] = 0000005d
!	%l0 = 00000000ffff0000, Mem[0000000030081400] = 00000000
	stha	%l0,[%i2+%g0]0x81	! Mem[0000000030081400] = 00000000
!	%l2 = 000000000011005d, Mem[00000000201c0001] = 329f9298, %asi = 80
	stba	%l2,[%o0+0x001]%asi	! Mem[00000000201c0000] = 325d9298
	membar	#Sync			! Added by membar checker (54)
!	%l2 = 000000000011005d, Mem[0000000030141408] = ff0000ff
	stha	%l2,[%i5+%o4]0x81	! Mem[0000000030141408] = 005d00ff
!	%l3 = 0000000000000000, Mem[0000000030081410] = 000000ff
	stba	%l3,[%i2+%o5]0x89	! Mem[0000000030081410] = 00000000
!	Mem[0000000010081400] = 00000000, %l0 = 00000000ffff0000
	ldstuba	[%i2+%g0]0x88,%l0	! %l0 = 0000000000000000
!	%f24 = 005d0000, Mem[0000000010181408] = ffff00fc
	sta	%f24,[%i6+%o4]0x80	! Mem[0000000010181408] = 005d0000
!	%f26 = b7e4780e de12da43, %l7 = 000000004c0e4e1f
!	Mem[0000000010141410] = 903b0000ffff0000
	add	%i5,0x010,%g1
	stda	%f26,[%g1+%l7]ASI_PST8_P ! Mem[0000000010141410] = 903b000ede12da43

p0_label_296:
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = 00000000, %l3 = 0000000000000000
	lduwa	[%i2+%g0]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000030101408] = 6c000000, %l6 = 0000000000000000
	ldsba	[%i4+%o4]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000010001410] = 000000ff, %l1 = 0000000000000000
	lduba	[%i0+%o5]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000010001428] = fc00ffff, %l4 = 000000000000005d
	ldsw	[%i0+0x028],%l4		! %l4 = fffffffffc00ffff
!	Mem[0000000010001406] = fc00ffff, %l0 = 0000000000000000
	ldsh	[%i0+0x006],%l0		! %l0 = ffffffffffffffff
!	Mem[0000000030101410] = ffff00ff, %l7 = 000000004c0e4e1f
	ldswa	[%i4+%o5]0x89,%l7	! %l7 = ffffffffffff00ff
!	Mem[0000000030181400] = ffff00fc, %l3 = 0000000000000000
	lduha	[%i6+%g0]0x81,%l3	! %l3 = 000000000000ffff
!	Mem[00000000300c1408] = 00000000 0000ffff, %l6 = 00000000, %l7 = ffff00ff
	ldda	[%i3+%o4]0x89,%l6	! %l6 = 000000000000ffff 0000000000000000
!	Mem[0000000030141408] = 005d00ff, %f21 = 456500ff
	lda	[%i5+%o4]0x81,%f21	! %f21 = 005d00ff
!	Mem[00000000300c1410] = ff000000, %f5  = 00000000
	lda	[%i3+%o5]0x81,%f5 	! %f5 = ff000000

p0_label_297:
!	Starting 10 instruction Store Burst
!	Mem[0000000030041410] = 00000000, %l1 = 0000000000000000
	swapa	[%i1+%o5]0x89,%l1	! %l1 = 0000000000000000
!	%f14 = 2757c009 ff000000, Mem[0000000030181400] = ffff00fc 456500ff
	stda	%f14,[%i6+%g0]0x81	! Mem[0000000030181400] = 2757c009 ff000000
!	%l0 = ffffffffffffffff, Mem[0000000010081400] = 00000011000000ff
	stxa	%l0,[%i2+%g0]0x88	! Mem[0000000010081400] = ffffffffffffffff
!	Mem[0000000030081408] = 3b000000, %l5 = 00000000ff000000
	swapa	[%i2+%o4]0x81,%l5	! %l5 = 000000003b000000
!	%l1 = 0000000000000000, Mem[0000000030041400] = ff00000000000000
	stxa	%l1,[%i1+%g0]0x81	! Mem[0000000030041400] = 0000000000000000
!	%l6 = 0000ffff, %l7 = 00000000, Mem[0000000010141400] = ffff00fc 00000000
	stda	%l6,[%i5+%g0]0x80	! Mem[0000000010141400] = 0000ffff 00000000
!	%l4 = fffffffffc00ffff, Mem[0000000030101400] = ff000000
	stha	%l4,[%i4+%g0]0x81	! Mem[0000000030101400] = ffff0000
!	%l4 = fffffffffc00ffff, Mem[0000000010041400] = 00000000
	stha	%l4,[%i1+%g0]0x80	! Mem[0000000010041400] = ffff0000
!	Mem[0000000010101410] = 1c000000, %l4 = fffffffffc00ffff
	ldstub	[%i4+%o5],%l4		! %l4 = 000000000000001c
!	%f28 = c92d6545 5d000000, %l3 = 000000000000ffff
!	Mem[0000000010181410] = fcff0000ff000000
	add	%i6,0x010,%g1
	stda	%f28,[%g1+%l3]ASI_PST8_PL ! Mem[0000000010181410] = 0000005d45652dc9

p0_label_298:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = 903b000e de12da43, %l2 = 0011005d, %l3 = 0000ffff
	ldda	[%i5+%o5]0x80,%l2	! %l2 = 00000000903b000e 00000000de12da43
!	Mem[0000000030141408] = ff005d00, %l6 = 000000000000ffff
	ldsba	[%i5+%o4]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000010001400] = 00000000, %l5 = 000000003b000000
	lduha	[%i0+%g0]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000010141416] = de12da43, %l6 = 0000000000000000, %asi = 80
	ldsba	[%i5+0x016]%asi,%l6	! %l6 = ffffffffffffffda
!	%l2 = 00000000903b000e, %l3 = 00000000de12da43, %l0  = ffffffffffffffff
	mulx	%l2,%l3,%l0		! %l0 = 7d1dc92a2278efaa
!	Mem[0000000010141438] = 00000000 00000000, %l4 = 0000001c, %l5 = 00000000
	ldd	[%i5+0x038],%l4		! %l4 = 0000000000000000 0000000000000000
!	Mem[0000000030041408] = 00006c00, %l0 = 7d1dc92a2278efaa
	lduha	[%i1+%o4]0x89,%l0	! %l0 = 0000000000006c00
!	Mem[0000000030041410] = 00000000, %l4 = 0000000000000000
	ldswa	[%i1+%o5]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000010181400] = 0000005d, %l6 = ffffffffffffffda, %asi = 80
	ldswa	[%i6+0x000]%asi,%l6	! %l6 = 000000000000005d
!	Mem[00000000100c1410] = 5d001100, %l3 = 00000000de12da43
	lduha	[%i3+%o5]0x80,%l3	! %l3 = 0000000000005d00

p0_label_299:
!	Starting 10 instruction Store Burst
!	%f7  = 00000000, Mem[0000000030081400] = 00000000
	sta	%f7 ,[%i2+%g0]0x89	! Mem[0000000030081400] = 00000000
!	%f22 = 311e7d53 a054720e, Mem[0000000010041410] = fb200000 00004c0e
	stda	%f22,[%i1+%o5]0x80	! Mem[0000000010041410] = 311e7d53 a054720e
!	%f27 = de12da43, Mem[00000000300c1410] = 000000ff
	sta	%f27,[%i3+%o5]0x89	! Mem[00000000300c1410] = de12da43
!	%f30 = fb200000, Mem[0000000010181400] = 5d000000
	sta	%f30,[%i6+%g0]0x88	! Mem[0000000010181400] = fb200000
!	Mem[0000000010001408] = 00000000, %l2 = 00000000903b000e
	swapa	[%i0+%o4]0x88,%l2	! %l2 = 0000000000000000
!	%l4 = 0000000000000000, Mem[0000000010041408] = fc00ffff
	stwa	%l4,[%i1+%o4]0x80	! Mem[0000000010041408] = 00000000
!	%f22 = 311e7d53, Mem[0000000030041410] = 00000000
	sta	%f22,[%i1+%o5]0x81	! Mem[0000000030041410] = 311e7d53
!	%l6 = 0000005d, %l7 = 00000000, Mem[0000000010001408] = 903b000e 00000000
	stda	%l6,[%i0+%o4]0x88	! Mem[0000000010001408] = 0000005d 00000000
!	Mem[0000000010001430] = 32000000, %l6 = 000000000000005d, %asi = 80
	swapa	[%i0+0x030]%asi,%l6	! %l6 = 0000000032000000
!	%l0 = 0000000000006c00, %l1 = 0000000000000000, %l5  = 0000000000000000
	mulx	%l0,%l1,%l5		! %l5 = 0000000000000000

p0_label_300:
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = ff005d00, %l1 = 0000000000000000
	ldswa	[%i5+%o4]0x89,%l1	! %l1 = ffffffffff005d00
!	Mem[0000000020800000] = ffffeac8, %l7 = 0000000000000000
	ldsh	[%o1+%g0],%l7		! %l7 = ffffffffffffffff
!	Mem[0000000021800141] = 110f1c48, %l1 = ffffffffff005d00, %asi = 80
	lduba	[%o3+0x141]%asi,%l1	! %l1 = 000000000000000f
!	Mem[0000000010181400] = fb200000, %l1 = 000000000000000f
	lduha	[%i6+%g0]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000030141408] = ff005d00, %l1 = 0000000000000000
	lduwa	[%i5+%o4]0x89,%l1	! %l1 = 00000000ff005d00
!	Mem[0000000030101410] = ff00ffff00000000, %l0 = 0000000000006c00
	ldxa	[%i4+%o5]0x81,%l0	! %l0 = ff00ffff00000000
!	Mem[00000000201c0000] = 325d9298, %l6 = 0000000032000000
	lduh	[%o0+%g0],%l6		! %l6 = 000000000000325d
!	Mem[0000000010001410] = ff000000, %f10 = ff0000ff
	lda	[%i0+%o5]0x88,%f10	! %f10 = ff000000
!	Mem[0000000030141400] = 00ff0000 fc00ffff, %l4 = 00000000, %l5 = 00000000
	ldda	[%i5+%g0]0x89,%l4	! %l4 = 00000000fc00ffff 0000000000ff0000
!	Code Fragment 4, seed = 887835
p0_fragment_24:
!	%l0 = ff00ffff00000000
	setx	0xb8e455ba59f9224e,%g7,%l0 ! %l0 = b8e455ba59f9224e
!	%l1 = 00000000ff005d00
	setx	0x7ab2bb2d89185df9,%g7,%l1 ! %l1 = 7ab2bb2d89185df9
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = b8e455ba59f9224e
	setx	0x7f37893f6b7c65b4,%g7,%l0 ! %l0 = 7f37893f6b7c65b4
!	%l1 = 7ab2bb2d89185df9
	setx	0x5749ca269708bc7f,%g7,%l1 ! %l1 = 5749ca269708bc7f
p0_fragment_24_end:

!	End of Random Code for Thread 0


!	Check Registers

p0_check_registers:
	set	p0_expected_registers,%g1
	ldx	[%g1+0x000],%g2
	cmp	%l0,%g2			! %l0 should be 7f37893f6b7c65b4
	bne	%xcc,p0_reg_l0_fail
	mov	%l0,%g3
	ldx	[%g1+0x008],%g2
	cmp	%l1,%g2			! %l1 should be 5749ca269708bc7f
	bne	%xcc,p0_reg_l1_fail
	mov	%l1,%g3
	ldx	[%g1+0x010],%g2
	cmp	%l2,%g2			! %l2 should be 0000000000000000
	bne	%xcc,p0_reg_l2_fail
	mov	%l2,%g3
	ldx	[%g1+0x018],%g2
	cmp	%l3,%g2			! %l3 should be 0000000000005d00
	bne	%xcc,p0_reg_l3_fail
	mov	%l3,%g3
	ldx	[%g1+0x020],%g2
	cmp	%l4,%g2			! %l4 should be 00000000fc00ffff
	bne	%xcc,p0_reg_l4_fail
	mov	%l4,%g3
	ldx	[%g1+0x028],%g2
	cmp	%l5,%g2			! %l5 should be 0000000000ff0000
	bne	%xcc,p0_reg_l5_fail
	mov	%l5,%g3
	ldx	[%g1+0x030],%g2
	cmp	%l6,%g2			! %l6 should be 000000000000325d
	bne	%xcc,p0_reg_l6_fail
	mov	%l6,%g3
	ldx	[%g1+0x038],%g2
	cmp	%l7,%g2			! %l7 should be ffffffffffffffff
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
	cmp	%l0,%l1			! %f0  should be 000000ff 00000000
	bne	%xcc,p0_freg_fail
	std	%f2,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x08],%l0
	cmp	%l0,%l1			! %f2  should be ff8d183b 0000446a
	bne	%xcc,p0_freg_fail
	std	%f4,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x10],%l0
	cmp	%l0,%l1			! %f4  should be ffff00fc ff000000
	bne	%xcc,p0_freg_fail
	std	%f6,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x18],%l0
	cmp	%l0,%l1			! %f6  should be 00000000 00000000
	bne	%xcc,p0_freg_fail
	std	%f8,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x20],%l0
	cmp	%l0,%l1			! %f8  should be 00000000 6a440000
	bne	%xcc,p0_freg_fail
	std	%f10,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x28],%l0
	cmp	%l0,%l1			! %f10 should be ff000000 ffff00fc
	bne	%xcc,p0_freg_fail
	std	%f12,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x30],%l0
	cmp	%l0,%l1			! %f12 should be 1f4e0e4c 00ff0000
	bne	%xcc,p0_freg_fail
	std	%f14,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x38],%l0
	cmp	%l0,%l1			! %f14 should be 2757c009 ff000000
	bne	%xcc,p0_freg_fail
	std	%f16,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x40],%l0
	cmp	%l0,%l1			! %f16 should be 00ff0000 fc00ffff
	bne	%xcc,p0_freg_fail
	std	%f18,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x48],%l0
	cmp	%l0,%l1			! %f18 should be fc00ffff ff0000ff
	bne	%xcc,p0_freg_fail
	std	%f20,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x50],%l0
	cmp	%l0,%l1			! %f20 should be 5bb85368 005d00ff
	bne	%xcc,p0_freg_fail
	std	%f22,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x58],%l0
	cmp	%l0,%l1			! %f22 should be 311e7d53 a054720e
	bne	%xcc,p0_freg_fail
	std	%f24,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x60],%l0
	cmp	%l0,%l1			! %f24 should be 005d0000 a054720e
	bne	%xcc,p0_freg_fail
	std	%f26,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x68],%l0
	cmp	%l0,%l1			! %f26 should be b7e4780e de12da43
	bne	%xcc,p0_freg_fail
	std	%f28,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x70],%l0
	cmp	%l0,%l1			! %f28 should be c92d6545 5d000000
	bne	%xcc,p0_freg_fail
	std	%f30,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x78],%l0
	cmp	%l0,%l1			! %f30 should be fb200000 11e1621b
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
	ldx	[%g1+0x000],%l0		! %l0 = 154a55b7ab0b7346
	ldx	[%g1+0x008],%l1		! %l1 = a23681cd38a73d71
	ldx	[%g1+0x010],%l2		! %l2 = 2feccb3256e48bac
	ldx	[%g1+0x018],%l3		! %l3 = 44989497e56960f7
	ldx	[%g1+0x020],%l4		! %l4 = 7c423b0e2d785052
	ldx	[%g1+0x028],%l5		! %l5 = a1950b5e568b7cbd
	ldx	[%g1+0x030],%l6		! %l6 = 5af14cba13ff9938
	ldx	[%g1+0x038],%l7		! %l7 = 3bb9c82d7ecee8c3

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
	add	%l7,%l3,%l0
	jmpl	%o7,%g0
	subc	%l2,%l3,%l6
p0_near_0_he:
	xor	%l7,0xd17,%l4
	mulx	%l4,0xfc3,%l4
	jmpl	%o7,%g0
	sth	%l1,[%o1+0x040]		! Mem[0000000020800040]
p0_near_0_lo:
	add	%l7,%l3,%l0
	jmpl	%o7,%g0
	subc	%l2,%l3,%l6
p0_near_0_ho:
	xor	%l7,0xd17,%l4
	mulx	%l4,0xfc3,%l4
	jmpl	%o7,%g0
	sth	%l1,[%i1+0x040]		! Mem[0000000020800040]
near0_b2b_h:
	xnor	%l3,-0x37c,%l6
	addc	%l0,%l5,%l4
	umul	%l0,-0xa22,%l0
	jmpl	%o7,%g0
	mulx	%l5,%l4,%l3
near0_b2b_l:
	fsubs	%f7 ,%f8 ,%f15
	smul	%l3,%l1,%l3
	and	%l6,0xf59,%l7
	jmpl	%o7,%g0
	addc	%l5,%l1,%l4
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
	sub	%l7,0x9c5,%l6
	xnor	%l5,%l4,%l3
	jmpl	%o7,%g0
	udivx	%l4,0x8be,%l1
p0_near_1_he:
	or	%l2,0x828,%l7
	sdivx	%l6,0x9b5,%l6
	fsqrts	%f30,%f27
	fadds	%f31,%f17,%f26
	andn	%l5,0x301,%l7
	jmpl	%o7,%g0
	fdivs	%f30,%f27,%f23
p0_near_1_lo:
	sub	%l7,0x9c5,%l6
	xnor	%l5,%l4,%l3
	jmpl	%o7,%g0
	udivx	%l4,0x8be,%l1
p0_near_1_ho:
	or	%l2,0x828,%l7
	sdivx	%l6,0x9b5,%l6
	fsqrts	%f30,%f27
	fadds	%f31,%f17,%f26
	andn	%l5,0x301,%l7
	jmpl	%o7,%g0
	fdivs	%f30,%f27,%f23
near1_b2b_h:
	jmpl	%o7,%g0
	mulx	%l6,%l5,%l0
	jmpl	%o7,%g0
	nop
near1_b2b_l:
	jmpl	%o7,%g0
	fdivs	%f9 ,%f6 ,%f12
	jmpl	%o7,%g0
	nop
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
	orn	%l3,%l0,%l2
	add	%l5,%l0,%l0
	sth	%l5,[%o1+0x000]		! Mem[0000000020800000]
	fdtos	%f4 ,%f3 
	umul	%l1,0xac5,%l5
	mulx	%l6,-0x8b2,%l5
	jmpl	%o7,%g0
	xnor	%l7,%l5,%l2
p0_near_2_he:
	umul	%l5,%l3,%l0
	subc	%l5,0x742,%l0
	sdivx	%l2,0xc14,%l6
	xnor	%l7,0x8c4,%l2
	jmpl	%o7,%g0
	smul	%l7,-0x09f,%l1
p0_near_2_lo:
	orn	%l3,%l0,%l2
	add	%l5,%l0,%l0
	sth	%l5,[%i1+0x000]		! Mem[0000000020800000]
	fdtos	%f4 ,%f3 
	umul	%l1,0xac5,%l5
	mulx	%l6,-0x8b2,%l5
	jmpl	%o7,%g0
	xnor	%l7,%l5,%l2
p0_near_2_ho:
	umul	%l5,%l3,%l0
	subc	%l5,0x742,%l0
	sdivx	%l2,0xc14,%l6
	xnor	%l7,0x8c4,%l2
	jmpl	%o7,%g0
	smul	%l7,-0x09f,%l1
near2_b2b_h:
	xnor	%l4,%l4,%l2
	fcmps	%fcc0,%f24,%f16
	smul	%l1,0xb10,%l6
	subc	%l7,%l1,%l3
	mulx	%l0,-0x721,%l0
	umul	%l3,0x359,%l5
	umul	%l5,%l1,%l2
	jmpl	%o7,%g0
	fdivs	%f26,%f25,%f18
near2_b2b_l:
	and	%l2,0x22c,%l6
	fmuls	%f9 ,%f2 ,%f15
	mulx	%l2,%l5,%l6
	fsubs	%f9 ,%f11,%f0 
	sdivx	%l7,0x2c5,%l3
	fdivs	%f14,%f0 ,%f2 
	fcmps	%fcc0,%f7 ,%f9 
	jmpl	%o7,%g0
	xor	%l2,0x8a8,%l3
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
	jmpl	%o7,%g0
	add	%l4,%l7,%l7
	jmpl	%o7,%g0
	nop
p0_near_3_he:
	and	%l3,%l4,%l6
	xor	%l0,%l6,%l1
	subc	%l3,-0x1a0,%l6
	smul	%l3,%l5,%l6
	or	%l5,%l2,%l5
	jmpl	%o7,%g0
	xor	%l3,-0x6dc,%l1
p0_near_3_lo:
	jmpl	%o7,%g0
	add	%l4,%l7,%l7
	jmpl	%o7,%g0
	nop
p0_near_3_ho:
	and	%l3,%l4,%l6
	xor	%l0,%l6,%l1
	subc	%l3,-0x1a0,%l6
	smul	%l3,%l5,%l6
	or	%l5,%l2,%l5
	jmpl	%o7,%g0
	xor	%l3,-0x6dc,%l1
near3_b2b_h:
	xnor	%l7,-0x5f6,%l7
	fcmps	%fcc3,%f21,%f18
	fadds	%f26,%f17,%f23
	fadds	%f17,%f31,%f21
	fadds	%f26,%f19,%f29
	addc	%l6,%l3,%l6
	fadds	%f20,%f27,%f20
	jmpl	%o7,%g0
	fstod	%f20,%f24
near3_b2b_l:
	smul	%l1,-0xb96,%l6
	subc	%l4,0xa0d,%l3
	xor	%l0,-0x8cf,%l1
	subc	%l5,%l3,%l5
	fmuls	%f1 ,%f3 ,%f9 
	xnor	%l5,-0x918,%l6
	mulx	%l0,%l7,%l2
	jmpl	%o7,%g0
	fsubs	%f11,%f4 ,%f6 
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
	ldd	[%i4+0x038],%l2		! Mem[0000000010101438]
	fadds	%f8 ,%f1 ,%f10
	smul	%l6,%l5,%l4
	addc	%l1,-0xdfb,%l3
	ldsw	[%i1+0x034],%l0		! Mem[0000000010041434]
	xnor	%l6,%l0,%l6
	udivx	%l3,0xcec,%l5
	jmpl	%o7,%g0
	ldstub	[%o0+0x000],%l6		! Mem[00000000201c0000]
p0_far_0_he:
	andn	%l1,-0xc44,%l2
	mulx	%l1,0xf7a,%l5
	jmpl	%o7,%g0
	smul	%l1,%l7,%l0
p0_far_0_lo:
	ldd	[%o4+0x038],%l2		! Mem[0000000010101438]
	fadds	%f8 ,%f1 ,%f10
	smul	%l6,%l5,%l4
	addc	%l1,-0xdfb,%l3
	ldsw	[%o1+0x034],%l0		! Mem[0000000010041434]
	xnor	%l6,%l0,%l6
	udivx	%l3,0xcec,%l5
	jmpl	%o7,%g0
	ldstub	[%i0+0x000],%l6		! Mem[00000000201c0000]
p0_far_0_ho:
	andn	%l1,-0xc44,%l2
	mulx	%l1,0xf7a,%l5
	jmpl	%o7,%g0
	smul	%l1,%l7,%l0
far0_b2b_h:
	sdivx	%l3,0x361,%l6
	orn	%l7,%l1,%l2
	smul	%l4,%l1,%l2
	orn	%l6,%l3,%l4
	jmpl	%o7,%g0
	add	%l3,%l1,%l6
far0_b2b_l:
	sub	%l7,0xd07,%l6
	smul	%l6,%l5,%l3
	xnor	%l2,0x73b,%l7
	fsqrts	%f12,%f11
	jmpl	%o7,%g0
	mulx	%l5,%l7,%l5
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
	mulx	%l5,%l6,%l6
	sub	%l4,0xf8b,%l1
	fadds	%f4 ,%f9 ,%f1 
	jmpl	%o7,%g0
	or	%l2,%l7,%l3
p0_far_1_he:
	add	%l7,-0x805,%l1
	xor	%l4,%l2,%l3
	subc	%l7,%l6,%l3
	sdivx	%l2,%l1,%l3
	orn	%l5,0x8e6,%l3
	fstod	%f16,%f18
	jmpl	%o7,%g0
	subc	%l5,%l4,%l5
p0_far_1_lo:
	mulx	%l5,%l6,%l6
	sub	%l4,0xf8b,%l1
	fadds	%f4 ,%f9 ,%f1 
	jmpl	%o7,%g0
	or	%l2,%l7,%l3
p0_far_1_ho:
	add	%l7,-0x805,%l1
	xor	%l4,%l2,%l3
	subc	%l7,%l6,%l3
	sdivx	%l2,%l1,%l3
	orn	%l5,0x8e6,%l3
	fstod	%f16,%f18
	jmpl	%o7,%g0
	subc	%l5,%l4,%l5
far1_b2b_h:
	fadds	%f19,%f16,%f29
	jmpl	%o7,%g0
	mulx	%l2,0x968,%l5
far1_b2b_l:
	sdivx	%l5,%l0,%l7
	jmpl	%o7,%g0
	sdivx	%l7,0xd68,%l7
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
	ldsw	[%i5+0x02c],%l6		! Mem[000000001014142c]
	xnor	%l4,-0x0fe,%l2
	jmpl	%o7,%g0
	subc	%l5,0x43a,%l5
p0_far_2_he:
	fdtos	%f16,%f24
	or	%l1,0x76b,%l2
	jmpl	%o7,%g0
	mulx	%l3,0x2ac,%l6
p0_far_2_lo:
	ldsw	[%o5+0x02c],%l6		! Mem[000000001014142c]
	xnor	%l4,-0x0fe,%l2
	jmpl	%o7,%g0
	subc	%l5,0x43a,%l5
p0_far_2_ho:
	fdtos	%f16,%f24
	or	%l1,0x76b,%l2
	jmpl	%o7,%g0
	mulx	%l3,0x2ac,%l6
far2_b2b_h:
	jmpl	%o7,%g0
	xor	%l7,0xd10,%l1
	jmpl	%o7,%g0
	nop
far2_b2b_l:
	jmpl	%o7,%g0
	fsubs	%f5 ,%f4 ,%f0 
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
	xor	%l2,%l7,%l2
	jmpl	%o7,%g0
	fsubs	%f1 ,%f6 ,%f11
p0_far_3_he:
	fdivs	%f27,%f16,%f19
	fsqrts	%f24,%f20
	fcmps	%fcc3,%f27,%f29
	and	%l3,0x7d0,%l3
	xnor	%l2,-0xd18,%l4
	umul	%l0,-0x2a0,%l3
	sub	%l7,%l1,%l0
	jmpl	%o7,%g0
	orn	%l1,%l7,%l6
p0_far_3_lo:
	xor	%l2,%l7,%l2
	jmpl	%o7,%g0
	fsubs	%f1 ,%f6 ,%f11
p0_far_3_ho:
	fdivs	%f27,%f16,%f19
	fsqrts	%f24,%f20
	fcmps	%fcc3,%f27,%f29
	and	%l3,0x7d0,%l3
	xnor	%l2,-0xd18,%l4
	umul	%l0,-0x2a0,%l3
	sub	%l7,%l1,%l0
	jmpl	%o7,%g0
	orn	%l1,%l7,%l6
far3_b2b_h:
	subc	%l3,%l0,%l0
	jmpl	%o7,%g0
	and	%l5,0x552,%l2
far3_b2b_l:
	subc	%l5,0x191,%l4
	jmpl	%o7,%g0
	fmuls	%f1 ,%f2 ,%f8 
user_far3_end:
	.seg	"text"
	.align	0x2000
user_jump0_start:
	.skip	16
p0_jmpl_0_le:
	sub	%l4,%l6,%l2
	jmpl	%g6+8,%g0
	umul	%l7,-0xad1,%l5
p0_call_0_le:
	sub	%l0,%l1,%l4
	or	%l4,%l3,%l4
	sdivx	%l5,%l6,%l2
	udivx	%l4,%l4,%l5
	retl
	xor	%l1,%l4,%l1
p0_jmpl_0_lo:
	sub	%l4,%l6,%l2
	jmpl	%g6+8,%g0
	umul	%l7,-0xad1,%l5
p0_call_0_lo:
	sub	%l0,%l1,%l4
	or	%l4,%l3,%l4
	sdivx	%l5,%l6,%l2
	udivx	%l4,%l4,%l5
	retl
	xor	%l1,%l4,%l1
p0_jmpl_0_he:
	and	%l5,%l3,%l0
	sub	%l3,%l0,%l7
	fstoi	%f21,%f22
	orn	%l3,0x7a9,%l3
	jmpl	%g6+8,%g0
	subc	%l0,0x1f9,%l6
p0_call_0_he:
	sdivx	%l1,%l4,%l5
	retl
	ldd	[%i2+0x010],%f20	! Mem[0000000010081410]
p0_jmpl_0_ho:
	and	%l5,%l3,%l0
	sub	%l3,%l0,%l7
	fstoi	%f21,%f22
	orn	%l3,0x7a9,%l3
	jmpl	%g6+8,%g0
	subc	%l0,0x1f9,%l6
p0_call_0_ho:
	sdivx	%l1,%l4,%l5
	retl
	ldd	[%o2+0x010],%f20	! Mem[0000000010081410]
user_jump0_end:
	.seg	"text"
	.align	0x2000
user_jump1_start:
	.skip	32
p0_jmpl_1_le:
	xor	%l4,%l2,%l1
	jmpl	%g6+8,%g0
	fmuls	%f14,%f13,%f3 
p0_call_1_le:
	fmuls	%f3 ,%f7 ,%f4 
	sdivx	%l5,0xf4d,%l3
	mulx	%l4,%l7,%l2
	fdtos	%f0 ,%f6 
	retl
	xnor	%l5,-0x213,%l5
p0_jmpl_1_lo:
	xor	%l4,%l2,%l1
	jmpl	%g6+8,%g0
	fmuls	%f14,%f13,%f3 
p0_call_1_lo:
	fmuls	%f3 ,%f7 ,%f4 
	sdivx	%l5,0xf4d,%l3
	mulx	%l4,%l7,%l2
	fdtos	%f0 ,%f6 
	retl
	xnor	%l5,-0x213,%l5
p0_jmpl_1_he:
	fmuls	%f23,%f17,%f31
	xor	%l2,-0x8c2,%l0
	jmpl	%g6+8,%g0
	fcmps	%fcc3,%f20,%f21
p0_call_1_he:
	smul	%l4,-0xcd2,%l6
	retl
	ldsw	[%i4+0x01c],%l6		! Mem[000000001010141c]
p0_jmpl_1_ho:
	fmuls	%f23,%f17,%f31
	xor	%l2,-0x8c2,%l0
	jmpl	%g6+8,%g0
	fcmps	%fcc3,%f20,%f21
p0_call_1_ho:
	smul	%l4,-0xcd2,%l6
	retl
	ldsw	[%o4+0x01c],%l6		! Mem[000000001010141c]
user_jump1_end:
	.seg	"text"
	.align	0x2000
user_jump2_start:
	.skip	48
p0_jmpl_2_le:
	fdivs	%f7 ,%f13,%f15
	jmpl	%g6+8,%g0
	andn	%l3,-0xa30,%l1
p0_call_2_le:
	sub	%l3,%l5,%l2
	andn	%l6,%l1,%l6
	mulx	%l0,%l5,%l1
	retl
	xor	%l6,%l4,%l7
p0_jmpl_2_lo:
	fdivs	%f7 ,%f13,%f15
	jmpl	%g6+8,%g0
	andn	%l3,-0xa30,%l1
p0_call_2_lo:
	sub	%l3,%l5,%l2
	andn	%l6,%l1,%l6
	mulx	%l0,%l5,%l1
	retl
	xor	%l6,%l4,%l7
p0_jmpl_2_he:
	jmpl	%g6+8,%g0
	fmuls	%f29,%f21,%f22
p0_call_2_he:
	subc	%l4,0x8bc,%l7
	retl
	sub	%l4,%l4,%l2
p0_jmpl_2_ho:
	jmpl	%g6+8,%g0
	fmuls	%f29,%f21,%f22
p0_call_2_ho:
	subc	%l4,0x8bc,%l7
	retl
	sub	%l4,%l4,%l2
user_jump2_end:
	.seg	"text"
	.align	0x2000
user_jump3_start:
	.skip	64
p0_jmpl_3_le:
	or	%l6,%l0,%l4
	umul	%l0,0x96c,%l4
	fcmps	%fcc0,%f1 ,%f6 
	orn	%l2,0x36d,%l6
	addc	%l2,0x0c8,%l2
	jmpl	%g6+8,%g0
	orn	%l3,%l5,%l1
p0_call_3_le:
	fmuls	%f0 ,%f10,%f15
	fsqrts	%f6 ,%f12
	fdivs	%f4 ,%f11,%f7 
	fmuls	%f6 ,%f12,%f1 
	fcmps	%fcc3,%f2 ,%f9 
	mulx	%l7,%l4,%l1
	mulx	%l1,0x777,%l2
	retl
	stb	%l5,[%i6+0x031]		! Mem[0000000010181431]
p0_jmpl_3_lo:
	or	%l6,%l0,%l4
	umul	%l0,0x96c,%l4
	fcmps	%fcc0,%f1 ,%f6 
	orn	%l2,0x36d,%l6
	addc	%l2,0x0c8,%l2
	jmpl	%g6+8,%g0
	orn	%l3,%l5,%l1
p0_call_3_lo:
	fmuls	%f0 ,%f10,%f15
	fsqrts	%f6 ,%f12
	fdivs	%f4 ,%f11,%f7 
	fmuls	%f6 ,%f12,%f1 
	fcmps	%fcc3,%f2 ,%f9 
	mulx	%l7,%l4,%l1
	mulx	%l1,0x777,%l2
	retl
	stb	%l5,[%o6+0x031]		! Mem[0000000010181431]
p0_jmpl_3_he:
	fcmps	%fcc2,%f17,%f25
	subc	%l2,-0xd77,%l5
	fdivs	%f19,%f25,%f17
	fdivs	%f20,%f17,%f31
	jmpl	%g6+8,%g0
	xor	%l7,-0x9d9,%l6
p0_call_3_he:
	fstoi	%f25,%f18
	udivx	%l1,0xd8e,%l6
	add	%l4,%l1,%l6
	fsubs	%f16,%f27,%f22
	retl
	fmuls	%f26,%f17,%f28
p0_jmpl_3_ho:
	fcmps	%fcc2,%f17,%f25
	subc	%l2,-0xd77,%l5
	fdivs	%f19,%f25,%f17
	fdivs	%f20,%f17,%f31
	jmpl	%g6+8,%g0
	xor	%l7,-0x9d9,%l6
p0_call_3_ho:
	fstoi	%f25,%f18
	udivx	%l1,0xd8e,%l6
	add	%l4,%l1,%l6
	fsubs	%f16,%f27,%f22
	retl
	fmuls	%f26,%f17,%f28
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
	.word	0x154a55b7,0xab0b7346		! Init value for %l0
	.word	0xa23681cd,0x38a73d71		! Init value for %l1
	.word	0x2feccb32,0x56e48bac		! Init value for %l2
	.word	0x44989497,0xe56960f7		! Init value for %l3
	.word	0x7c423b0e,0x2d785052		! Init value for %l4
	.word	0xa1950b5e,0x568b7cbd		! Init value for %l5
	.word	0x5af14cba,0x13ff9938		! Init value for %l6
	.word	0x3bb9c82d,0x7ecee8c3		! Init value for %l7
	.align	64
p0_init_freg:
	.word	0x160db338,0x734b0369		! Init value for %f0 
	.word	0x1d1bc036,0x2473a5af		! Init value for %f2 
	.word	0x08fab5a4,0x63b588a5		! Init value for %f4 
	.word	0x4a25bb02,0x6c4085cb		! Init value for %f6 
	.word	0x5c1753d0,0x1efce2a1		! Init value for %f8 
	.word	0x10ed3f8e,0x77b3b0a7		! Init value for %f10
	.word	0x0d3359bc,0x2d622d5d		! Init value for %f12
	.word	0x4b4d79da,0x6c502243		! Init value for %f14
	.word	0x5bb85368,0x674144d9		! Init value for %f16
	.word	0x731955e6,0x11d9969f		! Init value for %f18
	.word	0x20d58cd4,0x610cc515		! Init value for %f20
	.word	0x30a77fb2,0x1f3089bb		! Init value for %f22
	.word	0x2f6c1200,0x680a0a11		! Init value for %f24
	.word	0x3f1e633e,0x6dee3797		! Init value for %f26
	.word	0x47baaeec,0x6bcd2fcd		! Init value for %f28
	.word	0x12802c8a,0x50c09c33		! Init value for %f30
	.word	0x6ac9ef98,0x70751249		! Init value for %f32
	.word	0x6b76c796,0x0886738f		! Init value for %f34
	.word	0x19982004,0x65a74d85		! Init value for %f36
	.word	0x44dfe062,0x142b39ab		! Init value for %f38
	.word	0x4c054c30,0x7e4c3d81		! Init value for %f40
	.word	0x4718e2ee,0x57432a87		! Init value for %f42
	.word	0x2b7f401c,0x650afe3d		! Init value for %f44
	.word	0x2d0afb3a,0x53674223		! Init value for %f46
	.word	0x5d6d87c8,0x69856bb9
	.word	0x46f71546,0x70513c7f
	.word	0x695d6f34,0x025421f5
	.word	0x0701dd12,0x0eb7959b
	.word	0x06ee0260,0x3fc27cf1
	.word	0x437fbe9e,0x61e98977
	.word	0x5f7c0d4c,0x0b4a98ad
	.word	0x1b00e5ea,0x4c2b1413
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
	.word	0x7f37893f,0x6b7c65b4		! %l0
	.word	0x5749ca26,0x9708bc7f		! %l1
	.word	0x00000000,0x00000000		! %l2
	.word	0x00000000,0x00005d00		! %l3
	.word	0x00000000,0xfc00ffff		! %l4
	.word	0x00000000,0x00ff0000		! %l5
	.word	0x00000000,0x0000325d		! %l6
	.word	0xffffffff,0xffffffff		! %l7
p0_expected_fp_regs:
	.word	0x000000ff,0x00000000		! %f0
	.word	0xff8d183b,0x0000446a		! %f2
	.word	0xffff00fc,0xff000000		! %f4
	.word	0x00000000,0x00000000		! %f6
	.word	0x00000000,0x6a440000		! %f8
	.word	0xff000000,0xffff00fc		! %f10
	.word	0x1f4e0e4c,0x00ff0000		! %f12
	.word	0x2757c009,0xff000000		! %f14
	.word	0x00ff0000,0xfc00ffff		! %f16
	.word	0xfc00ffff,0xff0000ff		! %f18
	.word	0x5bb85368,0x005d00ff		! %f20
	.word	0x311e7d53,0xa054720e		! %f22
	.word	0x005d0000,0xa054720e		! %f24
	.word	0xb7e4780e,0xde12da43		! %f26
	.word	0xc92d6545,0x5d000000		! %f28
	.word	0xfb200000,0x11e1621b		! %f30
	.word	0x0000001e,0x00000b60		! %fsr
p0_local0_expect:
	.word	0x00000000,0xfc00ffff,0x5d000000,0x00000000 ! PA = 0000000010001400
	.word	0x000000ff,0x0000ff00,0x00000000,0x00000000 ! PA = 0000000010001410
	.word	0x0000446a,0x00000000,0xfc00ffff,0xff0000ff ! PA = 0000000010001420
	.word	0x0000005d,0xff000000,0x00000000,0x00000000 ! PA = 0000000010001430
p0_local0_sec_expect:
	.word	0x00000000,0xff00009f,0x2be94812,0x00000000 ! PA = 0000000030001400
	.word	0x00000000,0x00000000,0x67ccc440,0x00000011 ! PA = 0000000030001410
	.word	0x0189db4c,0xb08d903b,0x9f000000,0x00000000 ! PA = 0000000030001420
	.word	0xff000000,0xff96d911,0x000000ff,0x00000000 ! PA = 0000000030001430
!	Scratch Area for Non-Transactional Memory Stores
	.word	0xfbf29b36,0x8a2d5477,0xfe5fce9a,0x5d0fcc23
	.word	0x17d3de1e,0x41ac242f,0x5de9f2c2,0xdbc9379b
	.word	0xcf1abd86,0xd0897967,0x4d5ab76a,0x1b1db493
	.word	0x2bba616e,0xe73dcc1f,0xfb988492,0x0d177b0b
p0_local1_expect:
	.word	0xffff0000,0x00000000,0x00000000,0x11000000 ! PA = 0000000010041400
	.word	0x311e7d53,0xa054720e,0x00000000,0x00000000 ! PA = 0000000010041410
	.word	0x0000446a,0x00320000,0x00000000,0x00000000 ! PA = 0000000010041420
	.word	0x32000000,0x00000000,0x00000000,0x00000000 ! PA = 0000000010041430
p0_local1_sec_expect:
	.word	0x00000000,0x00000000,0x006c0000,0x000011ff ! PA = 0000000030041400
	.word	0x311e7d53,0x00000011,0x11d996ff,0x000000ff ! PA = 0000000030041410
	.word	0x7bc7b320,0x65cff2b1,0x6552c55e,0x403d3d37 ! PA = 0000000030041420
	.word	0x167d9a0c,0x5e46fa6d,0x49c3a8aa,0x08aa13d3 ! PA = 0000000030041430
p0_local2_expect:
	.word	0xffffffff,0xffffffff,0x0b48cffc,0x00000032 ! PA = 0000000010081400
	.word	0x2757c009,0x00ff0000,0xffffffff,0xffffffff ! PA = 0000000010081410
	.word	0x0000476c,0x0000005d,0x9f000000,0xffff001c ! PA = 0000000010081420
	.word	0x1f4e0e4c,0x32000000,0x1c000000,0x00000032 ! PA = 0000000010081430
p0_local2_sec_expect:
	.word	0x00000000,0x0000ff00,0xff000000,0x4c0e4e1f ! PA = 0000000030081400
	.word	0x00000000,0x7400009f,0x1f4e0e4c,0xffff00fc ! PA = 0000000030081410
	.word	0x0000005d,0x00000032,0x000000ff,0xfc00ffff ! PA = 0000000030081420
	.word	0x9f000000,0x002a0000,0x00000000,0xfc00ffff ! PA = 0000000030081430
p0_local3_expect:
	.word	0x0011005d,0x00000032,0x00000000,0x0000ff00 ! PA = 00000000100c1400
	.word	0x5d001100,0x00000000,0x0000ffff,0x1248e92b ! PA = 00000000100c1410
	.word	0x0000ff00,0x4cdb8901,0x00000000,0x00000000 ! PA = 00000000100c1420
	.word	0x11d996ff,0x456500ff,0x00000000,0x00000000 ! PA = 00000000100c1430
p0_local3_sec_expect:
	.word	0xffffff00,0x00000000,0xffff0000,0x00000000 ! PA = 00000000300c1400
	.word	0x43da12de,0x00000000,0x630075ff,0xff1c9d8b ! PA = 00000000300c1410
	.word	0x32000000,0x5d000000,0x13ff9938,0x00000058 ! PA = 00000000300c1420
	.word	0x00002a00,0x0000009f,0x47baaeec,0x000000ff ! PA = 00000000300c1430
p0_local4_expect:
	.word	0xfc00ffff,0x00000000,0x00000000,0x0000ffff ! PA = 0000000010101400
	.word	0xff000000,0x00000032,0x00ff0000,0x0000009f ! PA = 0000000010101410
	.word	0x00000000,0x00000000,0x9f000000,0x0000ff00 ! PA = 0000000010101420
	.word	0x6a7a41ff,0x00000000,0x0000005d,0x00000032 ! PA = 0000000010101430
p0_local4_sec_expect:
	.word	0xffff0000,0x00000000,0x0000006c,0x000000ff ! PA = 0000000030101400
	.word	0xff00ffff,0x00000000,0x00000000,0x00000000 ! PA = 0000000030101410
	.word	0x00000000,0x6a440000,0xff0000ff,0xffff00fc ! PA = 0000000030101420
	.word	0x1f4e0e4c,0x00ff0000,0x00000000,0x00000000 ! PA = 0000000030101430
p0_local5_expect:
	.word	0x0000ffff,0x00000000,0x00000000,0x00000000 ! PA = 0000000010141400
	.word	0x903b000e,0xde12da43,0xc92d6545,0xffdfe0eb ! PA = 0000000010141410
	.word	0x00000000,0x7400009f,0x1c00000f,0xff9d1c37 ! PA = 0000000010141420
	.word	0xffff0000,0x00000000,0x00000000,0x00000000 ! PA = 0000000010141430
p0_local5_sec_expect:
	.word	0xffff00fc,0x0000ff00,0x005d00ff,0xffff00fc ! PA = 0000000030141400
	.word	0xff006545,0x6853b85b,0x0e7254a0,0x537d1e31 ! PA = 0000000030141410
	.word	0x0e7254a0,0x00005d00,0x43da12de,0x0e78e4b7 ! PA = 0000000030141420
	.word	0x0000005d,0x45652dc9,0x1b62e111,0x000020fb ! PA = 0000000030141430
p0_local6_expect:
	.word	0x000020fb,0x000000ff,0x005d0000,0x00000000 ! PA = 0000000010181400
	.word	0x0000005d,0x45652dc9,0x11000000,0x00000000 ! PA = 0000000010181410
	.word	0x3200ffff,0x00000000,0x9f000000,0x0032001c ! PA = 0000000010181420
	.word	0x00002a00,0xff00009f,0x00000000,0xff000000 ! PA = 0000000010181430
p0_local6_sec_expect:
	.word	0x2757c009,0xff000000,0xff006545,0x6853b85b ! PA = 0000000030181400
	.word	0x00000000,0xffff0000,0x09c05727,0x00000000 ! PA = 0000000030181410
	.word	0x00ff0000,0x00000000,0x00000000,0x00000000 ! PA = 0000000030181420
	.word	0x2be94812,0x00000000,0x9f0000ff,0x0000ffff ! PA = 0000000030181430
share0_expect:
	.word	0x325d9298,0x06344949,0x24cac296,0x7551a28f ! PA = 00000000201c0000
	.word	0x71ed3304,0x2de03485,0x66f8cb62,0x7ed198ab ! PA = 00000000201c0010
	.word	0x600acf30,0x426dd481,0x4449bdee,0x58ebb987 ! PA = 00000000201c0020
	.word	0x4b60331c,0x1db4453d,0x2c16c63a,0x61e90123 ! PA = 00000000201c0030
share1_expect:
	.word	0xffffeac8,0x258562b9,0x0e10d046,0x3d332b7f ! PA = 0000000020800000
	.word	0x04364234,0x7da9c8f5,0x56cc8812,0x1630b49b ! PA = 0000000020800010
	.word	0x01c34560,0x2a9cd3f1,0x220e599e,0x29e0d877 ! PA = 0000000020800020
	.word	0x4c38c04c,0x01089fad,0x0ed670ea,0x53379313 ! PA = 0000000020800030
	.word	0x00ff3ef8,0x7e020829,0x612cb9f6,0x1639a06f ! PA = 0000000020800040
	.word	0x5d0d0d64,0x6404a965,0x5dace0c2,0x65d87c8b ! PA = 0000000020800050
	.word	0x0b463790,0x38aedf61,0x0ad2514e,0x208e6367 ! PA = 0000000020800060
	.word	0x23b4897c,0x7f3dc61d,0x4404379a,0x7fba5103 ! PA = 0000000020800070
share2_expect:
	.word	0xffff8f28,0x4bc93999,0x4a617fa6,0x75bc015f ! PA = 00000000211c0000
	.word	0x5a0c9494,0x0b3fd5d5,0x3f4cd572,0x36cff07b ! PA = 00000000211c0010
	.word	0x511ea5c0,0x1c22f6d1,0x34b8a4fe,0x68ab5a57 ! PA = 00000000211c0020
	.word	0x104e8eac,0x1402b88d,0x3f331a4a,0x34d83af3 ! PA = 00000000211c0030
share3_expect:
	.word	0x3b90db58,0x4db9f709,0x35b22156,0x39d14e4f ! PA = 0000000021800000
	.word	0x268fd7c4,0x1c6a4e45,0x0b1f6622,0x16de106b ! PA = 0000000021800010
	.word	0x61978ff0,0x3f381a41,0x6da454ae,0x0eaebd47 ! PA = 0000000021800020
	.word	0x3641cfdc,0x71c676fd,0x17b618fa,0x7cb850e3 ! PA = 0000000021800030
	.word	0x62002388,0x35734079,0x7ee19f06,0x1950873f ! PA = 0000000021800040
	.word	0x6bb1d6f4,0x2f5312b5,0x4c5792d2,0x4889dc5b ! PA = 0000000021800050
	.word	0x34bbf620,0x36ed49b1,0x4b38605e,0x6fcf8c37 ! PA = 0000000021800060
	.word	0x4f894d0c,0x71b8016d,0x38a033aa,0x0e4192d3 ! PA = 0000000021800070
	.word	0x488c67b8,0x175415e9,0x2172f8b6,0x13d0ac2f ! PA = 0000000021800080
	.word	0x004d9224,0x3a892325,0x39e85b82,0x331a544b ! PA = 0000000021800090
	.word	0x5c56d850,0x33018521,0x5ad7c80e,0x2a04c727 ! PA = 00000000218000a0
	.word	0x5be0063c,0x03c657dd,0x10c46a5a,0x3d1b00c3 ! PA = 00000000218000b0
	.word	0x0000a7e8,0x5a7b7759,0x68a92e66,0x61a8bd1f ! PA = 00000000218000c0
	.word	0x18fe0954,0x035b7f95,0x6684c032,0x5296783b ! PA = 00000000218000d0
	.word	0x33f33680,0x6df3cc91,0x51a58bbe,0x0c056e17 ! PA = 00000000218000e0
	.word	0x50c0fb6c,0x1ea07a4d,0x42b5bd0a,0x69ab9ab3 ! PA = 00000000218000f0
	.word	0x00ffe418,0x28c864c9,0x1f874016,0x63efba0f ! PA = 0000000021800100
	.word	0x781e3c84,0x0dd92805,0x709fc0e2,0x27c5482b ! PA = 0000000021800110
	.word	0x10dc10b0,0x1d032001,0x3c84ab6e,0x05488107 ! PA = 0000000021800120
	.word	0x49672c9c,0x2fb568bd,0x54c72bba,0x711a60a3 ! PA = 0000000021800130
	.word	0x110f1c48,0x5ed9de39,0x40d02dc6,0x147ca2ff ! PA = 0000000021800140
	.word	0x1dc92bb4,0x0cd11c75,0x326c5d92,0x282dc41b ! PA = 0000000021800150
	.word	0x721c66e0,0x602e7f71,0x3018271e,0x1604fff7 ! PA = 0000000021800160
	.word	0x36cd99cc,0x0b34232d,0x610bb66a,0x1d4e5293 ! PA = 0000000021800170
	.word	0xffff5078,0x7c0ee3a9,0x2706f776,0x75e677ef ! PA = 0000000021800180
	.word	0x77d9d6e4,0x51d25ce5,0x71dd9642,0x2e16ec0b ! PA = 0000000021800190
	.word	0x307f3910,0x3234eae1,0x78c2fece,0x3f31eae7 ! PA = 00000000218001a0
	.word	0x0faf42fc,0x5c0ba99d,0x45565d1a,0x14ee7083 ! PA = 00000000218001b0
	.word	0xffff80a8,0x12867519,0x3c6e9d26,0x038438df ! PA = 00000000218001c0
	.word	0x11eb3e14,0x3d2be955,0x10a66af2,0x6887bffb ! PA = 00000000218001d0
	.word	0x2e8f8740,0x58956251,0x4aa8327e,0x728641d7 ! PA = 00000000218001e0
	.word	0x0087282c,0x13eafc0d,0x533a1fca,0x4b61ba73 ! PA = 00000000218001f0
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
	.word	0x0f8e1bf8,0x4fd15129,0x261d3ef6,0x39d0f16f	! PA = 0000000010001400
	.word	0x74007a64,0x66a24265,0x630075c2,0x371c9d8b	! PA = 0000000010001410
	.word	0x0ef13490,0x652bc861,0x06b5f64e,0x3cd85467	! PA = 0000000010001420
	.word	0x106c167c,0x277aff1d,0x2034ec9a,0x6fb31203	! PA = 0000000010001430
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
	.word	0x4ed6ac28,0x3377c299,0x392c44a6,0x4e5c925f	! PA = 0000000030001400
	.word	0x3b1c4194,0x50e0aed5,0x608eaa72,0x0a61517b	! PA = 0000000030001410
	.word	0x1c99e2c0,0x72071fd1,0x4ade89fe,0x07c68b57	! PA = 0000000030001420
	.word	0x20ca5bac,0x494b318d,0x743a0f4a,0x3f663bf3	! PA = 0000000030001430
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
	.word	0x0ab23858,0x2757c009,0x70272656,0x000b1f4f	! PA = 0000000010041400
	.word	0x0e0bc4c4,0x7e1e6745,0x531f7b22,0x4a4cb16b	! PA = 0000000010041410
	.word	0x22330cf0,0x24938341,0x61dc79ae,0x432b2e47	! PA = 0000000010041420
	.word	0x58d1dcdc,0x372a2ffd,0x72634dfa,0x796b91e3	! PA = 0000000010041430
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
	.word	0x044bc088,0x31104979,0x2ad0e406,0x79b3983f	! PA = 0000000030041400
	.word	0x39ea03f4,0x1a2a6bb5,0x09e5e7d2,0x6d65bd5b	! PA = 0000000030041410
	.word	0x7bc7b320,0x65cff2b1,0x6552c55e,0x403d3d37	! PA = 0000000030041420
	.word	0x167d9a0c,0x5e46fa6d,0x49c3a8aa,0x08aa13d3	! PA = 0000000030041430
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
	.word	0x7e8e44b8,0x39005ee9,0x68ac7db6,0x2eecfd2f	! PA = 0000000010081400
	.word	0x3991ff24,0x2f93bc25,0x7fd4f082,0x0ef3754b	! PA = 0000000010081410
	.word	0x1f22d550,0x397b6e21,0x66a46d0e,0x10f3b827	! PA = 0000000010081420
	.word	0x7d88933c,0x429090dd,0x2d2e1f5a,0x74c8c1c3	! PA = 0000000010081430
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
	.word	0x6e24c4e8,0x7a470059,0x78fcf366,0x4c0e4e1f	! PA = 0000000030081400
	.word	0x659eb654,0x17a95895,0x0b9f9532,0x5efcd93b	! PA = 0000000030081410
	.word	0x4bcf7380,0x2e14f591,0x1ef470be,0x78059f17	! PA = 0000000030081420
	.word	0x276dc86c,0x6eb5f34d,0x0335b20a,0x522e9bb3	! PA = 0000000030081430
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
	.word	0x297a4118,0x72c32dc9,0x2ac54516,0x262e8b0f	! PA = 00000000100c1400
	.word	0x246b2984,0x6a7a4105,0x0fb8d5e2,0x1248e92b	! PA = 00000000100c1410
	.word	0x3b188db0,0x4cdb8901,0x1f25d06e,0x58e9f207	! PA = 00000000100c1420
	.word	0x5368399c,0x642621bd,0x162d60ba,0x3202a1a3	! PA = 00000000100c1430
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
	.word	0x18b9b948,0x5313e739,0x7cc872c6,0x2b24b3ff	! PA = 00000000300c1400
	.word	0x1a1258b4,0x6ed57575,0x2a53b292,0x525ea51b	! PA = 00000000300c1410
	.word	0x500923e0,0x09ce2871,0x7fdb8c1e,0x27d7b0f7	! PA = 00000000300c1420
	.word	0x1672e6cc,0x0b101c2d,0x44282b6a,0x122bd393	! PA = 00000000300c1430
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
	.word	0x65ce2d78,0x6e982ca9,0x4d897c76,0x5187c8ef	! PA = 0000000010101400
	.word	0x586f43e4,0x0a49f5e5,0x65632b42,0x2d850d0b	! PA = 0000000010101410
	.word	0x476c3610,0x33abd3e1,0x1178a3ce,0x59c5dbe7	! PA = 0000000010101420
	.word	0x0b48cffc,0x2262e29d,0x2ef9121a,0x4d513183	! PA = 0000000010101430
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
	.word	0x2c629da8,0x2b6efe19,0x0b4b6226,0x08aec9df	! PA = 0000000030101400
	.word	0x0f1ceb14,0x3126c255,0x669a3ff2,0x06c320fb	! PA = 0000000030101410
	.word	0x67ccc440,0x63f38b51,0x0c20177e,0x546b72d7	! PA = 0000000030101420
	.word	0x0264f52c,0x2fcd750d,0x6c3314ca,0x0ad9bb73	! PA = 0000000030101430
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
	.word	0x29e209d8,0x72775b89,0x641123d6,0x28b0b6cf	! PA = 0000000010141400
	.word	0x3b764e44,0x567adac5,0x1f6bf0a2,0x05dfe0eb	! PA = 0000000010141410
	.word	0x3175ce70,0x6ee44ec1,0x3fb4e72e,0x5e3f75c7	! PA = 0000000010141420
	.word	0x3202565c,0x6fbed37d,0x3529337a,0x2eec7163	! PA = 0000000010141430
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
	.word	0x6d777208,0x1f5044f9,0x759dc186,0x62648fbf	! PA = 0000000030141400
	.word	0x58966d74,0x5c153f35,0x7d0b3d52,0x07624cdb	! PA = 0000000030141410
	.word	0x0e7254a0,0x537d1e31,0x43da12de,0x0e78e4b7	! PA = 0000000030141420
	.word	0x661bf38c,0x4565fded,0x16ee6e2a,0x4a705353	! PA = 0000000030141430
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
	.word	0x080dd638,0x7058ba69,0x7d743b36,0x2f6154af	! PA = 0000000010181400
	.word	0x0f5848a4,0x0284efa5,0x186b2602,0x0c9164cb	! PA = 0000000010181410
	.word	0x028d56d0,0x2b7cf9a1,0x27f29a8e,0x3d0ebfa7	! PA = 0000000010181420
	.word	0x306cccbc,0x2ab1f45d,0x2255c4da,0x0b0c6143	! PA = 0000000010181430
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
	.word	0x3c503668,0x76afbbd9,0x08d790e6,0x41fe059f	! PA = 0000000030181400
	.word	0x6656dfd4,0x5918ec15,0x663eaab2,0x2b7428bb	! PA = 0000000030181410
	.word	0x5b51d500,0x1b62e111,0x23217e3e,0x72b80697	! PA = 0000000030181420
	.word	0x186fe1ec,0x2051b6cd,0x1bf2378a,0x2b279b33	! PA = 0000000030181430
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
	.word	0x2ea99298,0x06344949,0x24cac296,0x7551a28f	! PA = 00000000201c0000
	.word	0x71ed3304,0x2de03485,0x66f8cb62,0x7ed198ab	! PA = 00000000201c0010
	.word	0x600acf30,0x426dd481,0x4449bdee,0x58ebb987	! PA = 00000000201c0020
	.word	0x4b60331c,0x1db4453d,0x2c16c63a,0x61e90123	! PA = 00000000201c0030
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
	.word	0x1544eac8,0x258562b9,0x0e10d046,0x3d332b7f	! PA = 0000000020800000
	.word	0x04364234,0x7da9c8f5,0x56cc8812,0x1630b49b	! PA = 0000000020800010
	.word	0x01c34560,0x2a9cd3f1,0x220e599e,0x29e0d877	! PA = 0000000020800020
	.word	0x4c38c04c,0x01089fad,0x0ed670ea,0x53379313	! PA = 0000000020800030
	.word	0x680d3ef8,0x7e020829,0x612cb9f6,0x1639a06f	! PA = 0000000020800040
	.word	0x5d0d0d64,0x6404a965,0x5dace0c2,0x65d87c8b	! PA = 0000000020800050
	.word	0x0b463790,0x38aedf61,0x0ad2514e,0x208e6367	! PA = 0000000020800060
	.word	0x23b4897c,0x7f3dc61d,0x4404379a,0x7fba5103	! PA = 0000000020800070
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
	.word	0x10ad8f28,0x4bc93999,0x4a617fa6,0x75bc015f	! PA = 00000000211c0000
	.word	0x5a0c9494,0x0b3fd5d5,0x3f4cd572,0x36cff07b	! PA = 00000000211c0010
	.word	0x511ea5c0,0x1c22f6d1,0x34b8a4fe,0x68ab5a57	! PA = 00000000211c0020
	.word	0x104e8eac,0x1402b88d,0x3f331a4a,0x34d83af3	! PA = 00000000211c0030
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
	.word	0x1a90db58,0x4db9f709,0x35b22156,0x39d14e4f	! PA = 0000000021800000
	.word	0x268fd7c4,0x1c6a4e45,0x0b1f6622,0x16de106b	! PA = 0000000021800010
	.word	0x61978ff0,0x3f381a41,0x6da454ae,0x0eaebd47	! PA = 0000000021800020
	.word	0x3641cfdc,0x71c676fd,0x17b618fa,0x7cb850e3	! PA = 0000000021800030
	.word	0x62e22388,0x35734079,0x7ee19f06,0x1950873f	! PA = 0000000021800040
	.word	0x6bb1d6f4,0x2f5312b5,0x4c5792d2,0x4889dc5b	! PA = 0000000021800050
	.word	0x34bbf620,0x36ed49b1,0x4b38605e,0x6fcf8c37	! PA = 0000000021800060
	.word	0x4f894d0c,0x71b8016d,0x38a033aa,0x0e4192d3	! PA = 0000000021800070
	.word	0x488c67b8,0x175415e9,0x2172f8b6,0x13d0ac2f	! PA = 0000000021800080
	.word	0x004d9224,0x3a892325,0x39e85b82,0x331a544b	! PA = 0000000021800090
	.word	0x5c56d850,0x33018521,0x5ad7c80e,0x2a04c727	! PA = 00000000218000a0
	.word	0x5be0063c,0x03c657dd,0x10c46a5a,0x3d1b00c3	! PA = 00000000218000b0
	.word	0x5c3aa7e8,0x5a7b7759,0x68a92e66,0x61a8bd1f	! PA = 00000000218000c0
	.word	0x18fe0954,0x035b7f95,0x6684c032,0x5296783b	! PA = 00000000218000d0
	.word	0x33f33680,0x6df3cc91,0x51a58bbe,0x0c056e17	! PA = 00000000218000e0
	.word	0x50c0fb6c,0x1ea07a4d,0x42b5bd0a,0x69ab9ab3	! PA = 00000000218000f0
	.word	0x1057e418,0x28c864c9,0x1f874016,0x63efba0f	! PA = 0000000021800100
	.word	0x781e3c84,0x0dd92805,0x709fc0e2,0x27c5482b	! PA = 0000000021800110
	.word	0x10dc10b0,0x1d032001,0x3c84ab6e,0x05488107	! PA = 0000000021800120
	.word	0x49672c9c,0x2fb568bd,0x54c72bba,0x711a60a3	! PA = 0000000021800130
	.word	0x690f1c48,0x5ed9de39,0x40d02dc6,0x147ca2ff	! PA = 0000000021800140
	.word	0x1dc92bb4,0x0cd11c75,0x326c5d92,0x282dc41b	! PA = 0000000021800150
	.word	0x721c66e0,0x602e7f71,0x3018271e,0x1604fff7	! PA = 0000000021800160
	.word	0x36cd99cc,0x0b34232d,0x610bb66a,0x1d4e5293	! PA = 0000000021800170
	.word	0x2c4b5078,0x7c0ee3a9,0x2706f776,0x75e677ef	! PA = 0000000021800180
	.word	0x77d9d6e4,0x51d25ce5,0x71dd9642,0x2e16ec0b	! PA = 0000000021800190
	.word	0x307f3910,0x3234eae1,0x78c2fece,0x3f31eae7	! PA = 00000000218001a0
	.word	0x0faf42fc,0x5c0ba99d,0x45565d1a,0x14ee7083	! PA = 00000000218001b0
	.word	0x11b780a8,0x12867519,0x3c6e9d26,0x038438df	! PA = 00000000218001c0
	.word	0x11eb3e14,0x3d2be955,0x10a66af2,0x6887bffb	! PA = 00000000218001d0
	.word	0x2e8f8740,0x58956251,0x4aa8327e,0x728641d7	! PA = 00000000218001e0
	.word	0x0087282c,0x13eafc0d,0x533a1fca,0x4b61ba73	! PA = 00000000218001f0
share3_end:
