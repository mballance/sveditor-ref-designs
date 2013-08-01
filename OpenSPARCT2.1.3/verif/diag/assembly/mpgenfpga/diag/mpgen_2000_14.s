/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: mpgen_2000_14.s
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
!	Seed = 327144533
!	Riesling can be on
!	1 Thread, 2000 lines
!	mpgen   created on Dec 20, 2005 (16:35:03)
!	mpgen_2000_14.s created on Mar 27, 2009 (14:45:33)
!	RC file : random.rc
!	cmd = /import/n2-tools/release/tools/mpgen/mpgen,1.051220 -rc random.rc -o mpgen_2000_14 -p 1 -l 2000

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
!	%f0  = 387f1b3a c1a2f912 b2e7a718 beddaa90
!	%f4  = db3a9fba 03f28cb6 e8565995 01d8c311
!	%f8  = 085ef8fc 55bcd0e4 35f9d9b5 68749b12
!	%f12 = 2c1dcc99 d99016a7 0018a914 55a60ace
	ldda	[%g1]ASI_BLK_P,%f0
	add	%g1,64,%g1
!	%f16 = c1a82d81 111e5971 b10adae6 8a09d43e
!	%f20 = bb92c521 41a7ae52 4d93d50d 0b1ebad0
!	%f24 = 9e9ca80e 337245b2 2236a3af 06650118
!	%f28 = ac70227c 5ce5d8d4 0276f658 0431947f
	ldda	[%g1]ASI_BLK_P,%f16
	add	%g1,64,%g1
!	%f32 = 3ecdbc03 71e4ea53 1710a812 cea693c9
!	%f36 = fde79f25 8a6374ca d46301df 90ce83db
!	%f40 = 636fd3ef 1ad7fb31 e5088c92 96a3bd26
!	%f44 = cb9116a8 c483699f 6447987d 0adb3b9a
	ldda	[%g1]ASI_BLK_P,%f32

!	Set up the Graphics Status Register

	setx	0xd7b9b99800000071,%g7,%g1 ! GSR scale = 14, align = 1
	wr	%g1,%g0,%gsr		! GSR = d7b9b99800000071
	wr	%g0,%y			! Clear Y register
	xorcc	%g0,%g0,%g3		! init %g3 and set flags
	membar	#Sync			! Force the block loads to complete

!	Start of Random Code for processor 0

p0_label_1:
!	Mem[0000000010181408] = 8722fb52, %l2 = 314fc2742e86e6c5
	ldsha	[%i6+%o4]0x80,%l2	! %l2 = ffffffffffff8722
!	%f0  = 387f1b3a c1a2f912, %l7 = 1df067a2adf81584
!	Mem[0000000030141438] = edfde4921e776b13
	add	%i5,0x038,%g1
	stda	%f0,[%g1+%l7]ASI_PST16_SL ! Mem[0000000030141438] = edfde4923a1b6b13
!	%l2 = ffffffffffff8722, imm = 00000000000008cf, %l7 = 1df067a2adf81584
	orn	%l2,0x8cf,%l7		! %l7 = fffffffffffff732
!	Mem[0000000010041408] = ed698757, %l0 = ff49b51e11fb0551
	ldstuba	[%i1+%o4]0x88,%l0	! %l0 = 00000057000000ff
!	Mem[0000000030001408] = 191c8c47, %l4 = e003b5cea923ef4d
	ldstuba	[%i0+%o4]0x89,%l4	! %l4 = 00000047000000ff
!	Mem[0000000010041410] = 912da300 8bbf9c5e, %l0 = 00000057, %l1 = 07a983c7
	ldda	[%i1+0x010]%asi,%l0	! %l0 = 00000000912da300 000000008bbf9c5e
!	Mem[0000000010141408] = 4d84b6c8, %l4 = 0000000000000047
	swapa	[%i5+%o4]0x88,%l4	! %l4 = 000000004d84b6c8
!	Mem[0000000010181400] = 4f01a054, %l5 = a04179762d2ff124
	ldsba	[%i6+%g0]0x80,%l5	! %l5 = 000000000000004f
!	%l2 = ffff8722, %l3 = 4c6eeaed, Mem[0000000030001408] = ff8c1c19 d283ea3e
	stda	%l2,[%i0+%o4]0x81	! Mem[0000000030001408] = ffff8722 4c6eeaed
!	Starting 10 instruction Store Burst
!	%f25 = 337245b2, Mem[0000000030181400] = a9a963b8
	sta	%f25,[%i6+%g0]0x81	! Mem[0000000030181400] = 337245b2

p0_label_2:
!	%f2  = b2e7a718 beddaa90, Mem[00000000300c1408] = 31d1df63 d1d91b01
	stda	%f2 ,[%i3+%o4]0x89	! Mem[00000000300c1408] = b2e7a718 beddaa90
!	%l5 = 000000000000004f, Mem[0000000010081432] = 8fb346f1, %asi = 80
	stha	%l5,[%i2+0x032]%asi	! Mem[0000000010081430] = 8fb3004f
!	%l2 = ffffffffffff8722, Mem[0000000030041410] = 9c3baf36
	stba	%l2,[%i1+%o5]0x89	! Mem[0000000030041410] = 9c3baf22
!	%f24 = 9e9ca80e, Mem[0000000030141408] = 07d4d5a8
	sta	%f24,[%i5+%o4]0x89	! Mem[0000000030141408] = 9e9ca80e
!	Mem[000000001000142d] = f8082b64, %l7 = fffffffffffff732
	ldstub	[%i0+0x02d],%l7		! %l7 = 00000008000000ff
!	%f6  = e8565995, Mem[0000000010101410] = 49ae1dec
	sta	%f6 ,[%i4+%o5]0x80	! Mem[0000000010101410] = e8565995
!	%l2 = ffffffffffff8722, Mem[0000000010181400] = 54a0014f
	stha	%l2,[%i6+%g0]0x88	! Mem[0000000010181400] = 54a08722
!	%l5 = 000000000000004f, Mem[0000000010141408] = 00000047
	stwa	%l5,[%i5+%o4]0x88	! Mem[0000000010141408] = 0000004f
!	%l1 = 000000008bbf9c5e, Mem[0000000030001400] = d0a4e5e1
	stba	%l1,[%i0+%g0]0x89	! Mem[0000000030001400] = d0a4e55e
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = 90aaddbe18a7e7b2, %l7 = 0000000000000008
	ldxa	[%i3+%o4]0x81,%l7	! %l7 = 90aaddbe18a7e7b2

p0_label_3:
!	Mem[0000000010181410] = 56188efa, %l7 = 90aaddbe18a7e7b2
	ldsba	[%i6+%o5]0x88,%l7	! %l7 = fffffffffffffffa
!	Mem[0000000010041410] = 912da300, %l5 = 000000000000004f
	ldsba	[%i1+%o5]0x80,%l5	! %l5 = ffffffffffffff91
!	Mem[0000000010041408] = ed6987ff, %l2 = ffffffffffff8722
	lduha	[%i1+%o4]0x88,%l2	! %l2 = 00000000000087ff
!	Mem[0000000010181400] = 2287a0546a090251, %f16 = c1a82d81 111e5971
	ldda	[%i6+%g0]0x80,%f16	! %f16 = 2287a054 6a090251
!	Mem[00000000300c1408] = b2e7a718 beddaa90, %l0 = 912da300, %l1 = 8bbf9c5e
	ldda	[%i3+%o4]0x89,%l0	! %l0 = 00000000beddaa90 00000000b2e7a718
!	Mem[00000000211c0000] = f4374340, %l1 = 00000000b2e7a718
	ldsb	[%o2+%g0],%l1		! %l1 = fffffffffffffff4
!	Mem[0000000010181410] = fa8e1856 c25ce69e, %l2 = 000087ff, %l3 = 4c6eeaed
	ldd	[%i6+%o5],%l2		! %l2 = 00000000fa8e1856 00000000c25ce69e
!	Mem[0000000030081410] = 2cba2347, %l1 = fffffffffffffff4
	lduwa	[%i2+%o5]0x89,%l1	! %l1 = 000000002cba2347
!	Mem[0000000030041410] = 22af3b9c, %l5 = ffffffffffffff91
	lduwa	[%i1+%o5]0x81,%l5	! %l5 = 0000000022af3b9c
!	Starting 10 instruction Store Burst
!	Mem[0000000010101400] = d822e0ea, %l3 = 00000000c25ce69e
	ldstuba	[%i4+%g0]0x88,%l3	! %l3 = 000000ea000000ff

p0_label_4:
!	%l0 = 00000000beddaa90, Mem[0000000010081410] = 5ac107e5
	stba	%l0,[%i2+%o5]0x80	! Mem[0000000010081410] = 90c107e5
!	Mem[0000000010041428] = 15fbe418912eb6b5, %f22 = 4d93d50d 0b1ebad0
	ldda	[%i1+0x028]%asi,%f22	! %f22 = 15fbe418 912eb6b5
!	%l0 = beddaa90, %l1 = 2cba2347, Mem[0000000030101400] = 9f905609 7c81a49b
	stda	%l0,[%i4+%g0]0x81	! Mem[0000000030101400] = beddaa90 2cba2347
!	%f5  = 03f28cb6, Mem[00000000300c1408] = beddaa90
	sta	%f5 ,[%i3+%o4]0x89	! Mem[00000000300c1408] = 03f28cb6
!	Mem[00000000100c1408] = fa3bb515, %l2 = 00000000fa8e1856
	ldstuba	[%i3+%o4]0x88,%l2	! %l2 = 00000015000000ff
!	%f10 = 35f9d9b5 68749b12, Mem[0000000030141400] = a72a72c9 b0f91c21
	stda	%f10,[%i5+%g0]0x81	! Mem[0000000030141400] = 35f9d9b5 68749b12
!	%f20 = bb92c521 41a7ae52, Mem[0000000030041400] = d58a36f2 9e275972
	stda	%f20,[%i1+%g0]0x89	! Mem[0000000030041400] = bb92c521 41a7ae52
!	%f2  = b2e7a718, Mem[0000000030101410] = 281160b5
	sta	%f2 ,[%i4+%o5]0x81	! Mem[0000000030101410] = b2e7a718
!	Mem[0000000010141400] = 621b1957, %l4 = 000000004d84b6c8
	ldstuba	[%i5+%g0]0x88,%l4	! %l4 = 00000057000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101434] = 3357ee94, %l5 = 0000000022af3b9c
	ldsw	[%i4+0x034],%l5		! %l5 = 000000003357ee94

p0_label_5:
!	Mem[00000000300c1400] = 69305030, %l0 = 00000000beddaa90
	lduba	[%i3+%g0]0x81,%l0	! %l0 = 0000000000000069
!	Mem[0000000010041434] = 8213c76a, %f26 = 2236a3af
	ld	[%i1+0x034],%f26	! %f26 = 8213c76a
!	Mem[0000000010041410] = 912da300, %f8  = 085ef8fc
	lda	[%i1+%o5]0x80,%f8 	! %f8 = 912da300
!	Mem[0000000010181408] = 8722fb52, %l5 = 000000003357ee94
	lduwa	[%i6+%o4]0x80,%l5	! %l5 = 000000008722fb52
!	%l6 = ce96c1ebfcfa7d02, %l2 = 0000000000000015, %l2 = 0000000000000015
	subc	%l6,%l2,%l2		! %l2 = ce96c1ebfcfa7ced
!	Mem[0000000030001410] = 5e6fd4f1 b22311ac, %l2 = fcfa7ced, %l3 = 000000ea
	ldda	[%i0+%o5]0x89,%l2	! %l2 = 00000000b22311ac 000000005e6fd4f1
!	Mem[00000000201c0000] = 0921e0d4, %l2 = 00000000b22311ac
	ldsha	[%o0+0x000]%asi,%l2	! %l2 = 0000000000000921
	membar	#Sync			! Added by membar checker (1)
!	Mem[0000000010001400] = c55e4cc8 8c8408f9 abfbcd2c 297c2a6b
!	Mem[0000000010001410] = 6ba957a3 777b6b28 040231ed 0e056cf2
!	Mem[0000000010001420] = 59c9c11a 628d28db c61011a9 f8ff2b64
!	Mem[0000000010001430] = f76c5b0c beff5d9a 9b7db159 480b1a4b
	ldda	[%i0]ASI_BLK_AIUP,%f0	! Block Load from 0000000010001400
!	Mem[00000000300c1408] = b2e7a71803f28cb6, %f18 = b10adae6 8a09d43e
	ldda	[%i3+%o4]0x89,%f18	! %f18 = b2e7a718 03f28cb6
!	Starting 10 instruction Store Burst
!	%l4 = 00000057, %l5 = 8722fb52, Mem[0000000010041408] = ff8769ed db8f359f
	stda	%l4,[%i1+%o4]0x80	! Mem[0000000010041408] = 00000057 8722fb52

p0_label_6:
!	Mem[00000000100c1410] = ec6e6b4e, %l1 = 000000002cba2347
	swapa	[%i3+%o5]0x88,%l1	! %l1 = 00000000ec6e6b4e
!	Mem[0000000030081408] = c3f62d0f, %l3 = 000000005e6fd4f1
	ldstuba	[%i2+%o4]0x89,%l3	! %l3 = 0000000f000000ff
!	Mem[0000000030001408] = ffff8722, %l4 = 0000000000000057
	ldstuba	[%i0+%o4]0x81,%l4	! %l4 = 000000ff000000ff
!	%l1 = 00000000ec6e6b4e, Mem[0000000010101408] = 68fb190e
	stha	%l1,[%i4+%o4]0x88	! Mem[0000000010101408] = 68fb6b4e
	membar	#Sync			! Added by membar checker (2)
!	%l6 = ce96c1ebfcfa7d02, Mem[0000000010001410] = a357a96b
	stwa	%l6,[%i0+%o5]0x88	! Mem[0000000010001410] = fcfa7d02
!	%l4 = 00000000000000ff, Mem[0000000010001404] = 8c8408f9, %asi = 80
	stwa	%l4,[%i0+0x004]%asi	! Mem[0000000010001404] = 000000ff
!	%l5 = 000000008722fb52, Mem[0000000030141408] = 0ea89c9ef8a278b8
	stxa	%l5,[%i5+%o4]0x81	! Mem[0000000030141408] = 000000008722fb52
!	Mem[0000000010081400] = 8547009d613ab002, %l3 = 000000000000000f, %l6 = ce96c1ebfcfa7d02
	casxa	[%i2]0x80,%l3,%l6	! %l6 = 8547009d613ab002
!	Mem[0000000010001420] = 59c9c11a628d28db, %l6 = 8547009d613ab002, %l3 = 000000000000000f
	add	%i0,0x20,%g1
	casxa	[%g1]0x80,%l6,%l3	! %l3 = 59c9c11a628d28db
!	Starting 10 instruction Load Burst
!	Mem[0000000010141424] = 8aa63b93, %f1  = 8c8408f9
	lda	[%i5+0x024]%asi,%f1 	! %f1 = 8aa63b93

p0_label_7:
!	Mem[0000000030081410] = 4723ba2c, %l3 = 59c9c11a628d28db
	ldswa	[%i2+%o5]0x81,%l3	! %l3 = 000000004723ba2c
!	Mem[00000000300c1410] = cafae7c80030de0b, %l3 = 000000004723ba2c
	ldxa	[%i3+%o5]0x89,%l3	! %l3 = cafae7c80030de0b
!	%l2 = 0000000000000921, %l6 = 8547009d613ab002, %l7 = fffffffffffffffa
	sub	%l2,%l6,%l7		! %l7 = 7ab8ff629ec5591f
!	%l1 = 00000000ec6e6b4e, %l6 = 8547009d613ab002, %l3 = cafae7c80030de0b
	sdivx	%l1,%l6,%l3		! %l3 = 0000000000000000
!	Mem[0000000030041408] = 026b205fee309fe5, %l5 = 000000008722fb52
	ldxa	[%i1+%o4]0x89,%l5	! %l5 = 026b205fee309fe5
!	%f14 = 9b7db159, %f10 = c61011a9 f8ff2b64
	fstod	%f14,%f10		! %f10 = bb6fb62b 20000000
!	%f18 = b2e7a718, %f6  = 040231ed, %f14 = 9b7db159
	fadds	%f18,%f6 ,%f14		! %f14 = b2e7a718
!	Mem[00000000100c1408] = fa3bb5ff, %l3 = 0000000000000000
	ldsba	[%i3+%o4]0x88,%l3	! %l3 = ffffffffffffffff
!	Mem[00000000100c1408] = ffb53bfaf05e1d00, %l4 = 00000000000000ff
	ldxa	[%i3+%o4]0x80,%l4	! %l4 = ffb53bfaf05e1d00
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1408] = 03f28cb6, %l0 = 0000000000000069
	ldstuba	[%i3+%o4]0x89,%l0	! %l0 = 000000b6000000ff

p0_label_8:
!	Mem[0000000030001400] = 5ee5a4d0, %l5 = 026b205fee309fe5
	ldstuba	[%i0+%g0]0x81,%l5	! %l5 = 0000005e000000ff
!	%l7 = 7ab8ff629ec5591f, %l0 = 00000000000000b6, %l4  = ffb53bfaf05e1d00
	mulx	%l7,%l0,%l4		! %l4 = 3f85901ce04d5c0a
!	%l3 = ffffffffffffffff, Mem[00000000211c0000] = f4374340
	sth	%l3,[%o2+%g0]		! Mem[00000000211c0000] = ffff4340
!	Mem[000000001000143c] = 480b1a4b, %l5 = 000000000000005e
	swap	[%i0+0x03c],%l5		! %l5 = 00000000480b1a4b
!	%l6 = 8547009d613ab002, Mem[0000000030141400] = 35f9d9b5
	stha	%l6,[%i5+%g0]0x81	! Mem[0000000030141400] = b002d9b5
!	%l2 = 00000921, %l3 = ffffffff, Mem[0000000010141408] = 4f000000 deb926bc
	stda	%l2,[%i5+%o4]0x80	! Mem[0000000010141408] = 00000921 ffffffff
!	%l0 = 00000000000000b6, %l7 = 7ab8ff629ec5591f, %y  = 00000000
	udiv	%l0,%l7,%l4		! %l4 = 0000000000000000
	mov	%l0,%y			! %y = 000000b6
!	Mem[00000000100c1408] = fa3bb5ff, %l6 = 8547009d613ab002
	ldstuba	[%i3+%o4]0x88,%l6	! %l6 = 000000ff000000ff
!	%l3 = ffffffffffffffff, Mem[0000000010101408] = 68fb6b4e
	stha	%l3,[%i4+%o4]0x88	! Mem[0000000010101408] = 68fbffff
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = 00000921, %l0 = 00000000000000b6
	lduha	[%i5+%o4]0x80,%l0	! %l0 = 0000000000000000

p0_label_9:
!	Mem[0000000030181400] = b2457233, %l5 = 00000000480b1a4b
	ldswa	[%i6+%g0]0x89,%l5	! %l5 = ffffffffb2457233
!	Mem[0000000010181408] = 8722fb52 8eaf168c, %l6 = 000000ff, %l7 = 9ec5591f
	ldda	[%i6+%o4]0x80,%l6	! %l6 = 000000008722fb52 000000008eaf168c
!	Mem[0000000010101408] = 68fbffff, %l0 = 0000000000000000
	ldsba	[%i4+%o4]0x88,%l0	! %l0 = ffffffffffffffff
!	Mem[00000000100c1408] = 001d5ef0fa3bb5ff, %l0 = ffffffffffffffff
	ldxa	[%i3+%o4]0x88,%l0	! %l0 = 001d5ef0fa3bb5ff
!	Mem[0000000010181400] = 54a08722, %f15 = 480b1a4b
	lda	[%i6+%g0]0x88,%f15	! %f15 = 54a08722
!	Mem[0000000010041408] = 00000057, %l0 = 001d5ef0fa3bb5ff
	ldsba	[%i1+%o4]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000010081408] = c52572cc, %l3 = ffffffffffffffff
	ldsba	[%i2+%o4]0x80,%l3	! %l3 = ffffffffffffffc5
!	Mem[0000000010001424] = 628d28db, %l4 = 0000000000000000
	ldsha	[%i0+0x026]%asi,%l4	! %l4 = 00000000000028db
!	Mem[0000000030101410] = b2e7a718, %l2 = 0000000000000921
	ldsba	[%i4+%o5]0x81,%l2	! %l2 = ffffffffffffffb2
!	Starting 10 instruction Store Burst
!	Mem[000000001018142c] = b394d6e9, %l1 = ec6e6b4e, %l6 = 8722fb52
	add	%i6,0x2c,%g1
	casa	[%g1]0x80,%l1,%l6	! %l6 = 00000000b394d6e9

p0_label_10:
!	%l6 = 00000000b394d6e9, Mem[0000000010181408] = 8722fb52
	stba	%l6,[%i6+%o4]0x80	! Mem[0000000010181408] = e922fb52
!	Mem[0000000010001410] = fcfa7d02, %l6 = 00000000b394d6e9
	ldstuba	[%i0+%o5]0x88,%l6	! %l6 = 00000002000000ff
!	%l4 = 00000000000028db, Mem[0000000010181408] = e922fb528eaf168c
	stxa	%l4,[%i6+%o4]0x80	! Mem[0000000010181408] = 00000000000028db
!	%f12 = f76c5b0c beff5d9a, Mem[0000000030001408] = ffff8722 4c6eeaed
	stda	%f12,[%i0+%o4]0x81	! Mem[0000000030001408] = f76c5b0c beff5d9a
!	%l3 = ffffffffffffffc5, Mem[0000000010081410] = 90c107e5
	stwa	%l3,[%i2+%o5]0x80	! Mem[0000000010081410] = ffffffc5
!	%f6  = 040231ed 0e056cf2, Mem[00000000100c1400] = 9486c738 93b16a13
	stda	%f6 ,[%i3+%g0]0x88	! Mem[00000000100c1400] = 040231ed 0e056cf2
!	%l4 = 00000000000028db, Mem[0000000010001432] = f76c5b0c, %asi = 80
	stha	%l4,[%i0+0x032]%asi	! Mem[0000000010001430] = f76c28db
!	Mem[0000000010001400] = c55e4cc8, %l1 = 00000000ec6e6b4e, %asi = 80
	swapa	[%i0+0x000]%asi,%l1	! %l1 = 00000000c55e4cc8
!	%l3 = ffffffffffffffc5, Mem[0000000010001428] = c61011a9f8ff2b64
	stx	%l3,[%i0+0x028]		! Mem[0000000010001428] = ffffffffffffffc5
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = 2287a0546a090251, %f10 = bb6fb62b 20000000
	ldda	[%i6+0x000]%asi,%f10	! %f10 = 2287a054 6a090251

p0_label_11:
!	Mem[0000000010141410] = 94702eaa, %l0 = 0000000000000000
	lduba	[%i5+0x011]%asi,%l0	! %l0 = 0000000000000070
!	Mem[0000000030081410] = 4723ba2c, %l5 = ffffffffb2457233
	ldsha	[%i2+%o5]0x81,%l5	! %l5 = 0000000000004723
!	Mem[00000000100c1400] = f26c050e, %l2 = ffffffffffffffb2
	lduha	[%i3+%g0]0x80,%l2	! %l2 = 000000000000f26c
!	Mem[0000000010141410] = 94702eaa, %l7 = 000000008eaf168c
	lduha	[%i5+%o5]0x80,%l7	! %l7 = 0000000000009470
!	Mem[0000000010041410] = 00a32d91, %l1 = 00000000c55e4cc8
	ldsha	[%i1+%o5]0x88,%l1	! %l1 = 0000000000002d91
!	Mem[0000000030181408] = 7c9fdf28, %l2 = 000000000000f26c
	ldsba	[%i6+%o4]0x81,%l2	! %l2 = 000000000000007c
!	Mem[0000000030141400] = b002d9b568749b12, %f20 = bb92c521 41a7ae52
	ldda	[%i5+%g0]0x81,%f20	! %f20 = b002d9b5 68749b12
!	Mem[0000000010141400] = dd6ffd6e 621b19ff, %l6 = 00000002, %l7 = 00009470
	ldda	[%i5+%g0]0x88,%l6	! %l6 = 00000000621b19ff 00000000dd6ffd6e
!	Mem[0000000010081408] = c52572cc, %l4 = 00000000000028db
	ldsha	[%i2+%o4]0x80,%l4	! %l4 = ffffffffffffc525
!	Starting 10 instruction Store Burst
!	%l2 = 0000007c, %l3 = ffffffc5, Mem[0000000030081410] = 2cba2347 a11993b6
	stda	%l2,[%i2+%o5]0x89	! Mem[0000000030081410] = 0000007c ffffffc5

p0_label_12:
!	%f19 = 03f28cb6, Mem[0000000030181408] = 28df9f7c
	sta	%f19,[%i6+%o4]0x89	! Mem[0000000030181408] = 03f28cb6
!	%f16 = 2287a054 6a090251, Mem[0000000010101410] = e8565995 cc7ea199
	stda	%f16,[%i4+0x010]%asi	! Mem[0000000010101410] = 2287a054 6a090251
!	%l5 = 0000000000004723, Mem[0000000030181400] = 337245b2
	stha	%l5,[%i6+%g0]0x81	! Mem[0000000030181400] = 472345b2
!	%l2 = 000000000000007c, imm = 0000000000000d45, %l0 = 0000000000000070
	sub	%l2,0xd45,%l0		! %l0 = fffffffffffff337
!	%l6 = 621b19ff, %l7 = dd6ffd6e, Mem[0000000030001410] = b22311ac 5e6fd4f1
	stda	%l6,[%i0+%o5]0x89	! Mem[0000000030001410] = 621b19ff dd6ffd6e
!	Code Fragment 4
p0_fragment_1:
!	%l0 = fffffffffffff337
	setx	0x97b4dfb04d960068,%g7,%l0 ! %l0 = 97b4dfb04d960068
!	%l1 = 0000000000002d91
	setx	0x98a65cefe81f72d5,%g7,%l1 ! %l1 = 98a65cefe81f72d5
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 97b4dfb04d960068
	setx	0x50cc4c57f33a71c9,%g7,%l0 ! %l0 = 50cc4c57f33a71c9
!	%l1 = 98a65cefe81f72d5
	setx	0x80e69ec876d568f1,%g7,%l1 ! %l1 = 80e69ec876d568f1
!	Mem[0000000010041408] = 00000057, %l6 = 00000000621b19ff
	swap	[%i1+%o4],%l6		! %l6 = 0000000000000057
!	Mem[0000000010101400] = d822e0ff, %l2 = 000000000000007c
	ldstuba	[%i4+%g0]0x88,%l2	! %l2 = 000000ff000000ff
!	%l7 = 00000000dd6ffd6e, Mem[00000000201c0001] = 0921e0d4, %asi = 80
	stba	%l7,[%o0+0x001]%asi	! Mem[00000000201c0000] = 096ee0d4
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = 52fb2287ff191b62, %l0 = 50cc4c57f33a71c9
	ldxa	[%i1+%o4]0x88,%l0	! %l0 = 52fb2287ff191b62

p0_label_13:
!	Mem[0000000010101410] = 2287a054, %l1 = 80e69ec876d568f1
	lduwa	[%i4+%o5]0x80,%l1	! %l1 = 000000002287a054
!	Mem[0000000030001400] = d0a4e5ff, %l3 = ffffffffffffffc5
	ldswa	[%i0+%g0]0x89,%l3	! %l3 = ffffffffd0a4e5ff
!	Mem[0000000010041408] = ff191b62, %l4 = ffffffffffffc525
	ldsba	[%i1+%o4]0x88,%l4	! %l4 = 0000000000000062
!	Mem[0000000030041400] = 52aea741, %l1 = 000000002287a054
	lduha	[%i1+%g0]0x81,%l1	! %l1 = 00000000000052ae
!	%f7  = 0e056cf2, %f7  = 0e056cf2, %f2  = abfbcd2c 297c2a6b
	fsmuld	%f7 ,%f7 ,%f2 		! %f2  = 33916298 74453100
!	Mem[0000000010001410] = ff7dfafc 777b6b28, %l0 = ff191b62, %l1 = 000052ae
	ldda	[%i0+%o5]0x80,%l0	! %l0 = 00000000ff7dfafc 00000000777b6b28
!	Mem[0000000030001400] = de42b973d0a4e5ff, %l6 = 0000000000000057
	ldxa	[%i0+%g0]0x89,%l6	! %l6 = de42b973d0a4e5ff
!	Mem[0000000010141400] = ff191b626efd6fdd, %f30 = 0276f658 0431947f
	ldda	[%i5+%g0]0x80,%f30	! %f30 = ff191b62 6efd6fdd
!	Mem[0000000010001430] = f76c28db, %l3 = ffffffffd0a4e5ff
	ldsw	[%i0+0x030],%l3		! %l3 = fffffffff76c28db
!	Starting 10 instruction Store Burst
!	%l5 = 0000000000004723, Mem[0000000030001400] = ffe5a4d0
	stba	%l5,[%i0+%g0]0x81	! Mem[0000000030001400] = 23e5a4d0

p0_label_14:
!	%l0 = ff7dfafc, %l1 = 777b6b28, Mem[0000000010101400] = ffe022d8 1dbf8bef
	stda	%l0,[%i4+%g0]0x80	! Mem[0000000010101400] = ff7dfafc 777b6b28
!	%f15 = 54a08722, %f26 = 8213c76a, %f16 = 2287a054
	fdivs	%f15,%f26,%f16		! %f16 = ff800000
!	%l0 = 00000000ff7dfafc, Mem[0000000010181430] = afa8d920
	stw	%l0,[%i6+0x030]		! Mem[0000000010181430] = ff7dfafc
!	%l4 = 0000000000000062, Mem[0000000010081408] = c52572cc
	stba	%l4,[%i2+%o4]0x80	! Mem[0000000010081408] = 622572cc
!	%l2 = 00000000000000ff, Mem[0000000030081400] = 1fd40e2f
	stwa	%l2,[%i2+%g0]0x81	! Mem[0000000030081400] = 000000ff
!	%l1 = 00000000777b6b28, Mem[0000000010001412] = ff7dfafc
	stb	%l1,[%i0+0x012]		! Mem[0000000010001410] = ff7d28fc
!	%l6 = de42b973d0a4e5ff, Mem[0000000010141410] = 94702eaa
	stha	%l6,[%i5+%o5]0x80	! Mem[0000000010141410] = e5ff2eaa
!	%l6 = de42b973d0a4e5ff, Mem[0000000010001400] = 4e6b6eec
	stha	%l6,[%i0+%g0]0x88	! Mem[0000000010001400] = 4e6be5ff
!	%f25 = 337245b2, Mem[0000000010181408] = 00000000
	sta	%f25,[%i6+%o4]0x80	! Mem[0000000010181408] = 337245b2
!	Starting 10 instruction Load Burst
!	%l6 = de42b973d0a4e5ff, %l2 = 00000000000000ff, %l2 = 00000000000000ff
	udivx	%l6,%l2,%l2		! %l2 = 00df21db4f1fc4aa

p0_label_15:
!	Mem[00000000100c1400] = f26c050e, %l2 = 00df21db4f1fc4aa
	lduba	[%i3+%g0]0x80,%l2	! %l2 = 00000000000000f2
!	Mem[00000000100c1408] = ffb53bfa, %l7 = 00000000dd6ffd6e
	lduba	[%i3+%o4]0x80,%l7	! %l7 = 00000000000000ff
	membar	#Sync			! Added by membar checker (3)
!	Mem[00000000100c1400] = f26c050e ed310204 ffb53bfa f05e1d00
!	Mem[00000000100c1410] = 4723ba2c 563635da ebdefbb1 a4f2a45f
!	Mem[00000000100c1420] = 9ed71d1b f3bf85e6 bbcd90b3 a62bd723
!	Mem[00000000100c1430] = d8785725 4164d38a 904449f1 0023df27
	ldda	[%i3]ASI_BLK_AIUP,%f0	! Block Load from 00000000100c1400
!	Mem[00000000100c1400] = 0e056cf2, %l4 = 0000000000000062
	lduha	[%i3+%g0]0x88,%l4	! %l4 = 0000000000006cf2
!	Mem[0000000010041410] = 912da300, %l3 = fffffffff76c28db
	lduha	[%i1+%o5]0x80,%l3	! %l3 = 000000000000912d
!	Mem[0000000010081408] = 622572cc, %f23 = 912eb6b5
	lda	[%i2+0x008]%asi,%f23	! %f23 = 622572cc
!	Mem[0000000010141428] = 8ddb922c, %l3 = 000000000000912d
	ldsba	[%i5+0x02b]%asi,%l3	! %l3 = 000000000000002c
!	Mem[00000000300c1400] = 69305030, %l1 = 00000000777b6b28
	ldsba	[%i3+%g0]0x81,%l1	! %l1 = 0000000000000069
!	Mem[00000000300c1410] = 0030de0b, %l6 = de42b973d0a4e5ff
	ldsba	[%i3+%o5]0x89,%l6	! %l6 = 000000000000000b
!	Starting 10 instruction Store Burst
!	%f28 = ac70227c 5ce5d8d4, %l6 = 000000000000000b
!	Mem[0000000030181410] = d33e922ff4aa8ebf
	add	%i6,0x010,%g1
	stda	%f28,[%g1+%l6]ASI_PST16_S ! Mem[0000000030181410] = ac70922f5ce5d8d4

p0_label_16:
!	%f20 = b002d9b5 68749b12, Mem[0000000030181400] = b2452347 7072df0f
	stda	%f20,[%i6+%g0]0x89	! Mem[0000000030181400] = b002d9b5 68749b12
!	Mem[00000000100c1408] = ffb53bfa, %l2 = 00000000000000f2
	ldstuba	[%i3+%o4]0x80,%l2	! %l2 = 000000ff000000ff
!	Mem[00000000201c0001] = 096ee0d4, %l1 = 0000000000000069
	ldstuba	[%o0+0x001]%asi,%l1	! %l1 = 0000006e000000ff
!	%l3 = 000000000000002c, Mem[0000000010141408] = 21090000
	stwa	%l3,[%i5+%o4]0x88	! Mem[0000000010141408] = 0000002c
!	%l6 = 000000000000000b, Mem[0000000030001410] = ff191b62
	stha	%l6,[%i0+%o5]0x81	! Mem[0000000030001410] = 000b1b62
!	%l4 = 00006cf2, %l5 = 00004723, Mem[0000000010041408] = ff191b62 52fb2287
	stda	%l4,[%i1+%o4]0x88	! Mem[0000000010041408] = 00006cf2 00004723
!	%l2 = 00000000000000ff, Mem[00000000300c1408] = ff8cf203
	stha	%l2,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00fff203
!	%l3 = 000000000000002c, Mem[0000000010081400] = 9d004785
	stha	%l3,[%i2+%g0]0x88	! Mem[0000000010081400] = 9d00002c
!	Mem[0000000030101410] = 18a7e7b2, %l6 = 000000000000000b
	swapa	[%i4+%o5]0x89,%l6	! %l6 = 0000000018a7e7b2
!	Starting 10 instruction Load Burst
!	Mem[0000000010001418] = 040231ed 0e056cf2, %l4 = 00006cf2, %l5 = 00004723
	ldda	[%i0+0x018]%asi,%l4	! %l4 = 00000000040231ed 000000000e056cf2

p0_label_17:
!	Mem[0000000010041420] = 0e1fa963, %l3 = 000000000000002c
	ldsha	[%i1+0x020]%asi,%l3	! %l3 = 0000000000000e1f
!	Mem[0000000010001410] = ff7d28fc777b6b28, %l6 = 0000000018a7e7b2
	ldx	[%i0+%o5],%l6		! %l6 = ff7d28fc777b6b28
!	Mem[0000000010001408] = abfbcd2c297c2a6b, %f30 = ff191b62 6efd6fdd
	ldda	[%i0+%o4]0x80,%f30	! %f30 = abfbcd2c 297c2a6b
!	Mem[0000000030041408] = e59f30ee, %l0 = 00000000ff7dfafc
	ldsha	[%i1+%o4]0x81,%l0	! %l0 = ffffffffffffe59f
!	Mem[0000000010001400] = ffe56b4e, %l1 = 000000000000006e
	ldsba	[%i0+%g0]0x80,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000030101410] = 0b000000, %l6 = ff7d28fc777b6b28
	ldswa	[%i4+%o5]0x81,%l6	! %l6 = 000000000b000000
!	Mem[00000000300c1408] = 00fff203, %f29 = 5ce5d8d4
	lda	[%i3+%o4]0x81,%f29	! %f29 = 00fff203
!	Mem[0000000030041410] = 22af3b9c8c35d704, %f20 = b002d9b5 68749b12
	ldda	[%i1+%o5]0x81,%f20	! %f20 = 22af3b9c 8c35d704
!	Mem[0000000010181424] = eafcea4a, %l0 = ffffffffffffe59f
	ldsha	[%i6+0x024]%asi,%l0	! %l0 = ffffffffffffeafc
!	Starting 10 instruction Store Burst
!	%f22 = 15fbe418 622572cc, Mem[0000000010141408] = 0000002c ffffffff
	stda	%f22,[%i5+%o4]0x88	! Mem[0000000010141408] = 15fbe418 622572cc

p0_label_18:
!	Mem[00000000201c0000] = 09ffe0d4, %l4 = 00000000040231ed
	ldstuba	[%o0+0x000]%asi,%l4	! %l4 = 00000009000000ff
!	%l1 = ffffffffffffffff, Mem[0000000030001400] = 23e5a4d0
	stba	%l1,[%i0+%g0]0x81	! Mem[0000000030001400] = ffe5a4d0
!	%l6 = 0b000000, %l7 = 000000ff, Mem[0000000010081408] = 622572cc 5f46de5a
	stda	%l6,[%i2+%o4]0x80	! Mem[0000000010081408] = 0b000000 000000ff
!	%l3 = 0000000000000e1f, Mem[000000001018143a] = 53f42ec0, %asi = 80
	stba	%l3,[%i6+0x03a]%asi	! Mem[0000000010181438] = 53f41fc0
!	%l4 = 0000000000000009, Mem[0000000030101400] = beddaa90
	stwa	%l4,[%i4+%g0]0x81	! Mem[0000000030101400] = 00000009
!	%f27 = 06650118, Mem[0000000030101410] = 0b000000
	sta	%f27,[%i4+%o5]0x81	! Mem[0000000030101410] = 06650118
!	Code Fragment 3
p0_fragment_2:
!	%l0 = ffffffffffffeafc
	setx	0x184f3c706e94f438,%g7,%l0 ! %l0 = 184f3c706e94f438
!	%l1 = ffffffffffffffff
	setx	0x30b740705146500a,%g7,%l1 ! %l1 = 30b740705146500a
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 184f3c706e94f438
	setx	0xfaeb254849688103,%g7,%l0 ! %l0 = faeb254849688103
!	%l1 = 30b740705146500a
	setx	0xac6182bfd66d7210,%g7,%l1 ! %l1 = ac6182bfd66d7210
	membar	#Sync			! Added by membar checker (4)
!	%l0 = faeb254849688103, Mem[00000000100c1410] = 2cba2347
	stwa	%l0,[%i3+%o5]0x88	! Mem[00000000100c1410] = 49688103
!	%l2 = 00000000000000ff, Mem[0000000010041404] = bfe0501b, %asi = 80
	stwa	%l2,[%i1+0x004]%asi	! Mem[0000000010041404] = 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = ffe56b4e 000000ff abfbcd2c 297c2a6b
!	Mem[0000000010001410] = ff7d28fc 777b6b28 040231ed 0e056cf2
!	Mem[0000000010001420] = 59c9c11a 628d28db ffffffff ffffffc5
!	Mem[0000000010001430] = f76c28db beff5d9a 9b7db159 0000005e
	ldda	[%i0]ASI_BLK_AIUP,%f16	! Block Load from 0000000010001400

p0_label_19:
!	Mem[0000000010101410] = 2287a054, %l0 = faeb254849688103
	lduha	[%i4+%o5]0x80,%l0	! %l0 = 0000000000002287
!	Mem[00000000100c1408] = ffb53bfa, %l6 = 000000000b000000
	lduba	[%i3+0x00a]%asi,%l6	! %l6 = 000000000000003b
!	Mem[00000000201c0000] = ffffe0d4, %l6 = 000000000000003b
	ldsb	[%o0+0x001],%l6		! %l6 = ffffffffffffffff
!	%f4  = 4723ba2c, %f12 = d8785725, %f6  = ebdefbb1
	fmuls	%f4 ,%f12,%f6 		! %f6  = e01ed417
!	Mem[0000000010081400] = 9d00002c, %l2 = 00000000000000ff
	lduwa	[%i2+%g0]0x88,%l2	! %l2 = 000000009d00002c
!	Mem[00000000300c1410] = cafae7c80030de0b, %f8  = 9ed71d1b f3bf85e6
	ldda	[%i3+%o5]0x89,%f8 	! %f8  = cafae7c8 0030de0b
!	Mem[0000000010141410] = e5ff2eaa, %f2  = ffb53bfa
	ld	[%i5+%o5],%f2 	! %f2 = e5ff2eaa
!	Mem[0000000010101400] = ff7dfafc, %f11 = a62bd723
	lda	[%i4+%g0]0x80,%f11	! %f11 = ff7dfafc
!	%l2 = 000000009d00002c, %l5 = 000000000e056cf2, %l7 = 00000000000000ff
	xnor	%l2,%l5,%l7		! %l7 = ffffffff6cfa9321
!	Starting 10 instruction Store Burst
!	Mem[000000001010141c] = 12ba6ace, %l0 = 0000000000002287
	swap	[%i4+0x01c],%l0		! %l0 = 0000000012ba6ace

p0_label_20:
!	%l0 = 0000000012ba6ace, Mem[0000000010141400] = ff191b62
	stha	%l0,[%i5+%g0]0x80	! Mem[0000000010141400] = 6ace1b62
	membar	#Sync			! Added by membar checker (5)
!	%l7 = ffffffff6cfa9321, Mem[000000001000142a] = ffffffff, %asi = 80
	stha	%l7,[%i0+0x02a]%asi	! Mem[0000000010001428] = ffff9321
!	%l0 = 12ba6ace, %l1 = d66d7210, Mem[0000000010141438] = 9762f8d6 48907ab2
	std	%l0,[%i5+0x038]		! Mem[0000000010141438] = 12ba6ace d66d7210
!	%l5 = 000000000e056cf2, Mem[00000000211c0001] = ffff4340
	stb	%l5,[%o2+0x001]		! Mem[00000000211c0000] = fff24340
!	Mem[0000000030141408] = 00000000, %l1 = ac6182bfd66d7210
	swapa	[%i5+%o4]0x89,%l1	! %l1 = 0000000000000000
!	%l2 = 000000009d00002c, Mem[00000000100c1410] = 03816849563635da
	stx	%l2,[%i3+%o5]		! Mem[00000000100c1410] = 000000009d00002c
!	Mem[00000000211c0001] = fff24340, %l3 = 0000000000000e1f
	ldstuba	[%o2+0x001]%asi,%l3	! %l3 = 000000f2000000ff
!	Mem[0000000030041408] = e59f30ee, %l6 = ffffffffffffffff
	swapa	[%i1+%o4]0x81,%l6	! %l6 = 00000000e59f30ee
!	Mem[0000000010001408] = abfbcd2c, %l7 = ffffffff6cfa9321
	ldstuba	[%i0+%o4]0x80,%l7	! %l7 = 000000ab000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = fffbcd2c, %l4 = 0000000000000009
	ldsha	[%i0+%o4]0x80,%l4	! %l4 = fffffffffffffffb

p0_label_21:
!	Mem[0000000010141408] = 15fbe418622572cc, %l5 = 000000000e056cf2
	ldxa	[%i5+%o4]0x88,%l5	! %l5 = 15fbe418622572cc
!	Mem[0000000010181400] = 2287a054, %f11 = ff7dfafc
	lda	[%i6+%g0]0x80,%f11	! %f11 = 2287a054
!	Mem[0000000010101408] = 481d692268fbffff, %l6 = 00000000e59f30ee
	ldxa	[%i4+%o4]0x88,%l6	! %l6 = 481d692268fbffff
!	Mem[0000000010101434] = 3357ee94, %l6 = 481d692268fbffff
	ldsh	[%i4+0x034],%l6		! %l6 = 0000000000003357
!	%l3 = 00000000000000f2, %l2 = 000000009d00002c, %l0 = 0000000012ba6ace
	andn	%l3,%l2,%l0		! %l0 = 00000000000000d2
!	Mem[00000000211c0000] = ffff4340, %l3 = 00000000000000f2
	ldsha	[%o2+0x000]%asi,%l3	! %l3 = ffffffffffffffff
!	%l0 = 00000000000000d2, immed = fffffd0e, %y  = 000000b6
	sdiv	%l0,-0x2f2,%l6		! %l6 = ffffffffc234f72c
	mov	%l0,%y			! %y = 000000d2
!	Mem[0000000030081400] = ff000000, %l2 = 000000009d00002c
	ldsba	[%i2+%g0]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000010181408] = b2457233, %l0 = 00000000000000d2
	lduha	[%i6+%o4]0x88,%l0	! %l0 = 0000000000007233
!	Starting 10 instruction Store Burst
!	%l7 = 00000000000000ab, Mem[0000000021800080] = d7c3889d
	stb	%l7,[%o3+0x080]		! Mem[0000000021800080] = abc3889d

p0_label_22:
!	%f23 = 0e056cf2, Mem[00000000300c1408] = 03f2ff00
	sta	%f23,[%i3+%o4]0x89	! Mem[00000000300c1408] = 0e056cf2
!	%f8  = cafae7c8 0030de0b, Mem[0000000030041408] = ffffffff 5f206b02
	stda	%f8 ,[%i1+%o4]0x81	! Mem[0000000030041408] = cafae7c8 0030de0b
!	%l5 = 15fbe418622572cc, Mem[0000000030141400] = b002d9b568749b12
	stxa	%l5,[%i5+%g0]0x81	! Mem[0000000030141400] = 15fbe418622572cc
!	%f2  = e5ff2eaa f05e1d00, Mem[0000000030141408] = 10726dd6 8722fb52
	stda	%f2 ,[%i5+%o4]0x81	! Mem[0000000030141408] = e5ff2eaa f05e1d00
!	%f22 = 040231ed 0e056cf2, Mem[0000000010081428] = cca9669d 606f1373
	stda	%f22,[%i2+0x028]%asi	! Mem[0000000010081428] = 040231ed 0e056cf2
!	%l4 = fffffffffffffffb, Mem[0000000030181410] = 2f9270ac
	stwa	%l4,[%i6+%o5]0x89	! Mem[0000000030181410] = fffffffb
!	Mem[0000000010001400] = 4e6be5ff, %l4 = fffffffffffffffb
	ldstuba	[%i0+%g0]0x88,%l4	! %l4 = 000000ff000000ff
!	Mem[000000001018143c] = c3fa212d, %l3 = ffffffffffffffff, %asi = 80
	swapa	[%i6+0x03c]%asi,%l3	! %l3 = 00000000c3fa212d
!	%l1 = 0000000000000000, Mem[0000000030181410] = fffffffb
	stwa	%l1,[%i6+%o5]0x89	! Mem[0000000030181410] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = ff7d28fc 777b6b28, %l0 = 00007233, %l1 = 00000000
	ldda	[%i0+%o5]0x80,%l0	! %l0 = 00000000ff7d28fc 00000000777b6b28

p0_label_23:
!	Mem[00000000300c1400] = 69305030, %f22 = 040231ed
	lda	[%i3+%g0]0x81,%f22	! %f22 = 69305030
!	Mem[0000000030101408] = 78032e67, %l1 = 00000000777b6b28
	lduba	[%i4+%o4]0x81,%l1	! %l1 = 0000000000000078
!	Mem[0000000030101400] = 09000000, %l5 = 15fbe418622572cc
	ldswa	[%i4+%g0]0x89,%l5	! %l5 = 0000000009000000
!	Mem[0000000010141424] = 8aa63b93, %f0  = f26c050e
	ld	[%i5+0x024],%f0 	! %f0 = 8aa63b93
!	Mem[00000000300c1400] = 30503069, %l6 = ffffffffc234f72c
	ldsha	[%i3+%g0]0x89,%l6	! %l6 = 0000000000003069
!	Mem[0000000010041434] = 8213c76a, %l0 = 00000000ff7d28fc
	lduwa	[%i1+0x034]%asi,%l0	! %l0 = 000000008213c76a
!	Mem[0000000030001410] = 621b0b00, %l7 = 00000000000000ab
	lduba	[%i0+%o5]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000020800000] = 10e98b5d, %l1 = 0000000000000078
	ldsh	[%o1+%g0],%l1		! %l1 = 00000000000010e9
!	Mem[0000000030101410] = 06650118322ca653, %l6 = 0000000000003069
	ldxa	[%i4+%o5]0x81,%l6	! %l6 = 06650118322ca653
!	Starting 10 instruction Store Burst
!	%l3 = 00000000c3fa212d, Mem[00000000201c0001] = ffffe0d4
	stb	%l3,[%o0+0x001]		! Mem[00000000201c0000] = ff2de0d4

p0_label_24:
!	%l7 = 0000000000000000, Mem[0000000010181410] = 9ee65cc256188efa
	stxa	%l7,[%i6+%o5]0x88	! Mem[0000000010181410] = 0000000000000000
!	%l6 = 322ca653, %l7 = 00000000, Mem[00000000100c1410] = 00000000 9d00002c
	std	%l6,[%i3+%o5]		! Mem[00000000100c1410] = 322ca653 00000000
!	Mem[0000000030081410] = 0000007c, %l4 = 00000000000000ff
	ldstuba	[%i2+%o5]0x89,%l4	! %l4 = 0000007c000000ff
!	Mem[0000000010081400] = 2c00009d, %l7 = 0000000000000000
	swapa	[%i2+%g0]0x80,%l7	! %l7 = 000000002c00009d
!	%f28 = f76c28db beff5d9a, %l5 = 0000000009000000
!	Mem[0000000030101400] = 000000092cba2347
	stda	%f28,[%i4+%l5]ASI_PST8_S ! Mem[0000000030101400] = 000000092cba2347
!	%f9  = 0030de0b, Mem[0000000010181408] = 337245b2
	sta	%f9 ,[%i6+0x008]%asi	! Mem[0000000010181408] = 0030de0b
!	%f22 = 69305030 0e056cf2, Mem[0000000030101400] = 00000009 2cba2347
	stda	%f22,[%i4+%g0]0x81	! Mem[0000000030101400] = 69305030 0e056cf2
!	%l4 = 0000007c, %l5 = 09000000, Mem[0000000010181400] = 54a08722 5102096a
	stda	%l4,[%i6+%g0]0x88	! Mem[0000000010181400] = 0000007c 09000000
!	%l3 = 00000000c3fa212d, Mem[0000000010041408] = 00006cf2
	stwa	%l3,[%i1+%o4]0x88	! Mem[0000000010041408] = c3fa212d
!	Starting 10 instruction Load Burst
!	Mem[0000000010041428] = 15fbe418 912eb6b5, %l0 = 8213c76a, %l1 = 000010e9
	ldd	[%i1+0x028],%l0		! %l0 = 0000000015fbe418 00000000912eb6b5

p0_label_25:
!	Mem[0000000021800080] = abc3889d, %l5 = 0000000009000000
	lduba	[%o3+0x081]%asi,%l5	! %l5 = 00000000000000c3
!	Mem[00000000300c1400] = 30503069, %f31 = 0000005e
	lda	[%i3+%g0]0x89,%f31	! %f31 = 30503069
!	%l4 = 000000000000007c, imm = fffffffffffff298, %l5 = 00000000000000c3
	sub	%l4,-0xd68,%l5		! %l5 = 0000000000000de4
!	Mem[0000000030101400] = 69305030, %l0 = 0000000015fbe418
	ldswa	[%i4+%g0]0x81,%l0	! %l0 = 0000000069305030
!	Mem[0000000010101408] = fffffb68, %l4 = 000000000000007c
	lduwa	[%i4+%o4]0x80,%l4	! %l4 = 00000000fffffb68
!	Mem[0000000010101400] = 286b7b77fcfa7dff, %l1 = 00000000912eb6b5
	ldxa	[%i4+%g0]0x88,%l1	! %l1 = 286b7b77fcfa7dff
!	Mem[0000000010181400] = 0000007c, %l5 = 0000000000000de4
	ldswa	[%i6+%g0]0x88,%l5	! %l5 = 000000000000007c
!	Mem[0000000010181408] = 0030de0b, %l4 = 00000000fffffb68
	lduha	[%i6+%o4]0x80,%l4	! %l4 = 0000000000000030
!	Mem[0000000010141400] = 6ace1b62, %l2 = 0000000000000000
	lduha	[%i5+%g0]0x80,%l2	! %l2 = 0000000000006ace
!	Starting 10 instruction Store Burst
!	%f10 = bbcd90b3 2287a054, Mem[00000000100c1400] = 0e056cf2 040231ed
	stda	%f10,[%i3+%g0]0x88	! Mem[00000000100c1400] = bbcd90b3 2287a054

p0_label_26:
!	Mem[0000000010001404] = 000000ff, %l7 = 2c00009d, %l2 = 00006ace
	add	%i0,0x04,%g1
	casa	[%g1]0x80,%l7,%l2	! %l2 = 00000000000000ff
!	%f24 = 59c9c11a 628d28db, %l2 = 00000000000000ff
!	Mem[0000000010001400] = ffe56b4e000000ff
	stda	%f24,[%i0+%l2]ASI_PST32_P ! Mem[0000000010001400] = 59c9c11a628d28db
!	%l1 = 286b7b77fcfa7dff, Mem[00000000201c0000] = ff2de0d4
	stb	%l1,[%o0+%g0]		! Mem[00000000201c0000] = ff2de0d4
!	%f10 = bbcd90b3 2287a054, %l1 = 286b7b77fcfa7dff
!	Mem[00000000100c1420] = 9ed71d1bf3bf85e6
	add	%i3,0x020,%g1
	stda	%f10,[%g1+%l1]ASI_PST32_P ! Mem[00000000100c1420] = bbcd90b32287a054
!	%l6 = 322ca653, %l7 = 2c00009d, Mem[0000000010041410] = 912da300 8bbf9c5e
	stda	%l6,[%i1+%o5]0x80	! Mem[0000000010041410] = 322ca653 2c00009d
!	%l0 = 69305030, %l1 = fcfa7dff, Mem[0000000010101400] = ff7dfafc 777b6b28
	stda	%l0,[%i4+%g0]0x80	! Mem[0000000010101400] = 69305030 fcfa7dff
!	Mem[000000001000140c] = 297c2a6b, %l0 = 0000000069305030
	swap	[%i0+0x00c],%l0		! %l0 = 00000000297c2a6b
!	%l7 = 000000002c00009d, Mem[000000001004143e] = 744e9a59
	sth	%l7,[%i1+0x03e]		! Mem[000000001004143c] = 744e009d
!	%f12 = d8785725 4164d38a, %l2 = 00000000000000ff
!	Mem[0000000030041438] = 5643df0bcf5dd38f
	add	%i1,0x038,%g1
	stda	%f12,[%g1+%l2]ASI_PST32_S ! Mem[0000000030041438] = d87857254164d38a
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = ffffffc5 9d80f033, %l4 = 00000030, %l5 = 0000007c
	ldda	[%i2+%o5]0x80,%l4	! %l4 = 00000000ffffffc5 000000009d80f033

p0_label_27:
!	Mem[0000000030081410] = ffffffc5000000ff, %l4 = 00000000ffffffc5
	ldxa	[%i2+%o5]0x89,%l4	! %l4 = ffffffc5000000ff
!	Mem[0000000010101400] = 69305030, %l6 = 06650118322ca653
	ldsba	[%i4+%g0]0x80,%l6	! %l6 = 0000000000000069
!	Mem[0000000030141410] = 2dc9d53a, %l0 = 00000000297c2a6b
	ldsha	[%i5+%o5]0x89,%l0	! %l0 = ffffffffffffd53a
!	Mem[0000000010141438] = 12ba6ace, %l2 = 00000000000000ff
	ldub	[%i5+0x03b],%l2		! %l2 = 00000000000000ce
!	Mem[0000000010141410] = aa2effe5, %l7 = 000000002c00009d
	lduha	[%i5+%o5]0x88,%l7	! %l7 = 000000000000ffe5
!	Mem[0000000010081408] = 0b000000000000ff, %l6 = 0000000000000069
	ldxa	[%i2+%o4]0x80,%l6	! %l6 = 0b000000000000ff
!	Mem[0000000030041408] = cafae7c8 0030de0b, %l2 = 000000ce, %l3 = c3fa212d
	ldda	[%i1+%o4]0x81,%l2	! %l2 = 00000000cafae7c8 000000000030de0b
!	Mem[0000000010081400] = 00000000, %l0 = ffffffffffffd53a
	ldsha	[%i2+%g0]0x88,%l0	! %l0 = 0000000000000000
!	Mem[00000000100c1438] = 904449f1, %l3 = 000000000030de0b
	lduha	[%i3+0x038]%asi,%l3	! %l3 = 0000000000009044
!	Starting 10 instruction Store Burst
!	Mem[00000000211c0001] = ffff4340, %l3 = 0000000000009044
	ldstuba	[%o2+0x001]%asi,%l3	! %l3 = 000000ff000000ff

p0_label_28:
!	%l5 = 000000009d80f033, immed = 00000078, %y  = 000000d2
	smul	%l5,0x078,%l3		! %l3 = ffffffd1d47097e8, %y = ffffffd1
!	%f10 = bbcd90b3 2287a054, Mem[00000000100c1438] = 904449f1 0023df27
	std	%f10,[%i3+0x038]	! Mem[00000000100c1438] = bbcd90b3 2287a054
!	%l6 = 0b000000000000ff, Mem[0000000030041400] = 52aea741
	stha	%l6,[%i1+%g0]0x81	! Mem[0000000030041400] = 00ffa741
!	%f8  = cafae7c8, Mem[0000000010181408] = 0030de0b
	sta	%f8 ,[%i6+%o4]0x80	! Mem[0000000010181408] = cafae7c8
!	%l2 = cafae7c8, %l3 = d47097e8, Mem[0000000030181400] = 129b7468 b5d902b0
	stda	%l2,[%i6+%g0]0x81	! Mem[0000000030181400] = cafae7c8 d47097e8
!	%l0 = 0000000000000000, Mem[00000000201c0000] = ff2de0d4
	stb	%l0,[%o0+%g0]		! Mem[00000000201c0000] = 002de0d4
!	Mem[0000000010041420] = 0e1fa963e60f9592, %l7 = 000000000000ffe5, %l1 = 286b7b77fcfa7dff
	add	%i1,0x20,%g1
	casxa	[%g1]0x80,%l7,%l1	! %l1 = 0e1fa963e60f9592
!	%l7 = 000000000000ffe5, Mem[00000000300c1410] = 0030de0b
	stba	%l7,[%i3+%o5]0x89	! Mem[00000000300c1410] = 0030dee5
!	Mem[0000000010181410] = 00000000, %l6 = 0b000000000000ff
	ldstuba	[%i6+%o5]0x80,%l6	! %l6 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = 54a08722, %f31 = 30503069
	lda	[%i4+%o5]0x88,%f31	! %f31 = 54a08722

p0_label_29:
!	Mem[0000000010181400] = 0000007c, %l2 = 00000000cafae7c8
	lduba	[%i6+%g0]0x88,%l2	! %l2 = 000000000000007c
!	Mem[0000000010001410] = ff7d28fc, %l7 = 000000000000ffe5
	lduwa	[%i0+%o5]0x80,%l7	! %l7 = 00000000ff7d28fc
!	Mem[0000000030141410] = 2dc9d53a, %l3 = ffffffd1d47097e8
	lduba	[%i5+%o5]0x89,%l3	! %l3 = 000000000000003a
!	Mem[0000000010041400] = 583c1429000000ff, %f26 = ffffffff ffffffc5
	ldd	[%i1+%g0],%f26		! %f26 = 583c1429 000000ff
!	Mem[00000000201c0000] = 002de0d4, %l6 = 0000000000000000
	ldsha	[%o0+0x000]%asi,%l6	! %l6 = 000000000000002d
!	Mem[0000000020800000] = 10e98b5d, %l3 = 000000000000003a
	lduha	[%o1+0x000]%asi,%l3	! %l3 = 00000000000010e9
!	Mem[0000000010141400] = 6ace1b62, %l1 = 0e1fa963e60f9592
	lduba	[%i5+%g0]0x80,%l1	! %l1 = 000000000000006a
!	Mem[0000000010081408] = 0b000000000000ff, %f8  = cafae7c8 0030de0b
	ldda	[%i2+%o4]0x80,%f8 	! %f8  = 0b000000 000000ff
!	%l3 = 00000000000010e9, %l0 = 0000000000000000, %y  = ffffffd1
	sdiv	%l3,%l0,%l0		! %l0 = 0000000000000028
	mov	%l0,%y			! %y = 00000028
!	Starting 10 instruction Store Burst
!	Mem[0000000030041410] = 22af3b9c, %l5 = 000000009d80f033
	ldstuba	[%i1+%o5]0x81,%l5	! %l5 = 00000022000000ff

p0_label_30:
!	Mem[0000000010141430] = 4b9a26a4, %l0 = 00000028, %l1 = 0000006a
	add	%i5,0x30,%g1
	casa	[%g1]0x80,%l0,%l1	! %l1 = 000000004b9a26a4
!	%f2  = e5ff2eaa, Mem[0000000010181404] = 00000009
	st	%f2 ,[%i6+0x004]	! Mem[0000000010181404] = e5ff2eaa
!	%l4 = ffffffc5000000ff, imm = fffffffffffff3c5, %l0 = 0000000000000028
	orn	%l4,-0xc3b,%l0		! %l0 = ffffffc500000cff
!	%l4 = ffffffc5000000ff, Mem[0000000010181400] = 0000007c
	stba	%l4,[%i6+%g0]0x88	! Mem[0000000010181400] = 000000ff
!	Mem[0000000010181408] = cafae7c8, %l0 = ffffffc500000cff
	ldstuba	[%i6+%o4]0x80,%l0	! %l0 = 000000ca000000ff
!	Mem[0000000030001408] = 0c5b6cf7, %l6 = 000000000000002d
	swapa	[%i0+%o4]0x89,%l6	! %l6 = 000000000c5b6cf7
!	%l4 = ffffffc5000000ff, Mem[0000000030141408] = 001d5ef0aa2effe5
	stxa	%l4,[%i5+%o4]0x89	! Mem[0000000030141408] = ffffffc5000000ff
!	Mem[0000000010181400] = 000000ff, %l4 = ffffffc5000000ff
	swapa	[%i6+%g0]0x88,%l4	! %l4 = 00000000000000ff
!	%f30 = 9b7db159 54a08722, Mem[0000000010081410] = ffffffc5 9d80f033
	stda	%f30,[%i2+0x010]%asi	! Mem[0000000010081410] = 9b7db159 54a08722
!	Starting 10 instruction Load Burst
!	Mem[0000000030081410] = 000000ff, %f29 = beff5d9a
	lda	[%i2+%o5]0x89,%f29	! %f29 = 000000ff

p0_label_31:
!	Mem[0000000010041408] = 00004723 c3fa212d, %l0 = 000000ca, %l1 = 4b9a26a4
	ldda	[%i1+%o4]0x88,%l0	! %l0 = 00000000c3fa212d 0000000000004723
!	Mem[0000000010181408] = c8e7faff, %l0 = 00000000c3fa212d
	ldsha	[%i6+%o4]0x88,%l0	! %l0 = fffffffffffffaff
!	Mem[00000000300c1400] = 69305030, %l2 = 000000000000007c
	lduwa	[%i3+%g0]0x81,%l2	! %l2 = 0000000069305030
!	Mem[00000000100c1430] = d8785725, %l3 = 00000000000010e9
	lduba	[%i3+0x030]%asi,%l3	! %l3 = 00000000000000d8
!	Mem[0000000010001400] = 59c9c11a 628d28db, %l0 = fffffaff, %l1 = 00004723
	ldda	[%i0+%g0]0x80,%l0	! %l0 = 0000000059c9c11a 00000000628d28db
!	Mem[0000000010181408] = c8e7faff, %l6 = 000000000c5b6cf7
	lduwa	[%i6+%o4]0x88,%l6	! %l6 = 00000000c8e7faff
!	Mem[00000000100c1410] = 322ca653, %l5 = 0000000000000022
	ldsba	[%i3+%o5]0x80,%l5	! %l5 = 0000000000000032
!	Mem[00000000100c142c] = a62bd723, %l7 = 00000000ff7d28fc
	ldsh	[%i3+0x02c],%l7		! %l7 = ffffffffffffa62b
!	Mem[0000000010101408] = fffffb68, %l7 = ffffffffffffa62b
	lduwa	[%i4+%o4]0x80,%l7	! %l7 = 00000000fffffb68
!	Starting 10 instruction Store Burst
!	%f0  = 8aa63b93 ed310204, Mem[0000000030041408] = c8e7faca 0bde3000
	stda	%f0 ,[%i1+%o4]0x89	! Mem[0000000030041408] = 8aa63b93 ed310204

p0_label_32:
!	%l3 = 00000000000000d8, Mem[0000000010081424] = d49ffbc6, %asi = 80
	stwa	%l3,[%i2+0x024]%asi	! Mem[0000000010081424] = 000000d8
!	%l3 = 00000000000000d8, Mem[0000000010181404] = e5ff2eaa, %asi = 80
	stha	%l3,[%i6+0x004]%asi	! Mem[0000000010181404] = 00d82eaa
!	%l0 = 0000000059c9c11a, %l5 = 0000000000000032, %l7 = 00000000fffffb68
	add	%l0,%l5,%l7		! %l7 = 0000000059c9c14c
!	%l0 = 0000000059c9c11a, Mem[0000000030041400] = 41a7ff00
	stwa	%l0,[%i1+%g0]0x89	! Mem[0000000030041400] = 59c9c11a
!	%l4 = 000000ff, %l5 = 00000032, Mem[0000000010101400] = 30503069 ff7dfafc
	stda	%l4,[%i4+%g0]0x88	! Mem[0000000010101400] = 000000ff 00000032
!	%l0 = 59c9c11a, %l1 = 628d28db, Mem[0000000030041408] = 040231ed 933ba68a
	stda	%l0,[%i1+%o4]0x81	! Mem[0000000030041408] = 59c9c11a 628d28db
!	Mem[00000000100c1428] = bbcd90b3, %l5 = 0000000000000032, %asi = 80
	swapa	[%i3+0x028]%asi,%l5	! %l5 = 00000000bbcd90b3
!	%l1 = 00000000628d28db, imm = 0000000000000dbd, %l0 = 0000000059c9c11a
	andn	%l1,0xdbd,%l0		! %l0 = 00000000628d2042
!	Mem[0000000030101408] = 672e0378, %l0 = 00000000628d2042
	swapa	[%i4+%o4]0x89,%l0	! %l0 = 00000000672e0378
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = fc287dff, %l7 = 0000000059c9c14c
	ldsba	[%i0+%o5]0x88,%l7	! %l7 = ffffffffffffffff

p0_label_33:
!	Mem[0000000020800000] = 10e98b5d, %l4 = 00000000000000ff
	ldsba	[%o1+0x001]%asi,%l4	! %l4 = ffffffffffffffe9
!	Mem[000000001000142c] = ffffffc5, %l7 = ffffffffffffffff
	lduwa	[%i0+0x02c]%asi,%l7	! %l7 = 00000000ffffffc5
!	Mem[0000000010041408] = 2d21fac3, %f30 = 9b7db159
	lda	[%i1+%o4]0x80,%f30	! %f30 = 2d21fac3
!	%l4 = ffffffffffffffe9, Mem[0000000030041410] = ffaf3b9c
	stba	%l4,[%i1+%o5]0x81	! Mem[0000000030041410] = e9af3b9c
!	Mem[00000000300c1408] = f26c050e, %f13 = 4164d38a
	lda	[%i3+%o4]0x81,%f13	! %f13 = f26c050e
!	Mem[000000001010141c] = 00002287, %l6 = 00000000c8e7faff
	lduha	[%i4+0x01e]%asi,%l6	! %l6 = 0000000000002287
!	Mem[0000000010001410] = ff7d28fc, %l4 = ffffffffffffffe9
	lduwa	[%i0+%o5]0x80,%l4	! %l4 = 00000000ff7d28fc
!	Mem[0000000030141410] = 2dc9d53a, %l5 = 00000000bbcd90b3
	lduwa	[%i5+%o5]0x89,%l5	! %l5 = 000000002dc9d53a
!	Mem[000000001000143c] = 0000005e, %l1 = 00000000628d28db
	ldub	[%i0+0x03e],%l1		! %l1 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010141410] = e5ff2eaa, %l3 = 00000000000000d8
	ldstuba	[%i5+%o5]0x80,%l3	! %l3 = 000000e5000000ff

p0_label_34:
!	%l2 = 0000000069305030, Mem[0000000030141408] = ff000000
	stha	%l2,[%i5+%o4]0x81	! Mem[0000000030141408] = 50300000
!	%f18 = abfbcd2c 297c2a6b, Mem[0000000010141400] = 6ace1b62 6efd6fdd
	stda	%f18,[%i5+%g0]0x80	! Mem[0000000010141400] = abfbcd2c 297c2a6b
!	%f10 = bbcd90b3, Mem[0000000010101408] = 68fbffff
	sta	%f10,[%i4+%o4]0x88	! Mem[0000000010101408] = bbcd90b3
!	%f10 = bbcd90b3 2287a054, Mem[0000000030041408] = 1ac1c959 db288d62
	stda	%f10,[%i1+%o4]0x89	! Mem[0000000030041408] = bbcd90b3 2287a054
!	Mem[0000000010081400] = 00000000, %l5 = 000000002dc9d53a
	ldstuba	[%i2+%g0]0x80,%l5	! %l5 = 00000000000000ff
!	%l0 = 672e0378, %l1 = 00000000, Mem[0000000010181428] = 5ab29912 b394d6e9
	stda	%l0,[%i6+0x028]%asi	! Mem[0000000010181428] = 672e0378 00000000
!	Mem[0000000010141400] = 2ccdfbab, %l2 = 0000000069305030
	ldstuba	[%i5+%g0]0x88,%l2	! %l2 = 000000ab000000ff
!	Mem[00000000211c0001] = ffff4340, %l1 = 0000000000000000
	ldstub	[%o2+0x001],%l1		! %l1 = 000000ff000000ff
!	%f16 = ffe56b4e 000000ff, Mem[0000000010181400] = ff000000 00d82eaa
	stda	%f16,[%i6+%g0]0x80	! Mem[0000000010181400] = ffe56b4e 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = 02b03a61000000ff, %l5 = 0000000000000000
	ldxa	[%i2+%g0]0x88,%l5	! %l5 = 02b03a61000000ff

p0_label_35:
!	Mem[00000000300c1410] = 0030dee5, %l0 = 00000000672e0378
	ldswa	[%i3+%o5]0x89,%l0	! %l0 = 000000000030dee5
!	Mem[0000000030041408] = 54a08722b390cdbb, %l5 = 02b03a61000000ff
	ldxa	[%i1+%o4]0x81,%l5	! %l5 = 54a08722b390cdbb
!	Mem[0000000010001408] = fffbcd2c, %l7 = 00000000ffffffc5
	ldsh	[%i0+0x00a],%l7		! %l7 = ffffffffffffcd2c
!	Mem[0000000030041408] = 54a08722, %l2 = 00000000000000ab
	ldswa	[%i1+%o4]0x81,%l2	! %l2 = 0000000054a08722
!	Mem[0000000010041408] = 00004723c3fa212d, %l0 = 000000000030dee5
	ldxa	[%i1+%o4]0x88,%l0	! %l0 = 00004723c3fa212d
!	Mem[0000000030041400] = 59c9c11a, %l1 = 00000000000000ff
	lduba	[%i1+%g0]0x89,%l1	! %l1 = 000000000000001a
!	Code Fragment 3
p0_fragment_3:
!	%l0 = 00004723c3fa212d
	setx	0xd3e64787fe2f2762,%g7,%l0 ! %l0 = d3e64787fe2f2762
!	%l1 = 000000000000001a
	setx	0x10bef8c84d5d1b99,%g7,%l1 ! %l1 = 10bef8c84d5d1b99
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = d3e64787fe2f2762
	setx	0x1d7a4a879bfb0b5a,%g7,%l0 ! %l0 = 1d7a4a879bfb0b5a
!	%l1 = 10bef8c84d5d1b99
	setx	0x5d8c6527afd91451,%g7,%l1 ! %l1 = 5d8c6527afd91451
!	Mem[0000000010041410] = 53a62c32, %f8  = 0b000000
	lda	[%i1+%o5]0x88,%f8 	! %f8 = 53a62c32
!	Mem[00000000100c1410] = 53a62c32, %l3 = 00000000000000e5
	lduba	[%i3+%o5]0x88,%l3	! %l3 = 0000000000000032
!	Starting 10 instruction Store Burst
!	Mem[0000000010101408] = bbcd90b3, %l6 = 0000000000002287
	ldstuba	[%i4+%o4]0x88,%l6	! %l6 = 000000b3000000ff

p0_label_36:
!	%f23 = 0e056cf2, Mem[00000000300c1400] = 30503069
	sta	%f23,[%i3+%g0]0x89	! Mem[00000000300c1400] = 0e056cf2
!	Mem[0000000030141410] = 3ad5c92d, %l5 = 54a08722b390cdbb
	ldstuba	[%i5+%o5]0x81,%l5	! %l5 = 0000003a000000ff
!	%l7 = ffffffffffffcd2c, Mem[0000000030141400] = 15fbe418
	stwa	%l7,[%i5+%g0]0x81	! Mem[0000000030141400] = ffffcd2c
!	Mem[0000000010181404] = 000000ff, %l7 = ffffffffffffcd2c
	ldstub	[%i6+0x004],%l7		! %l7 = 00000000000000ff
!	Mem[0000000030181400] = cafae7c8, %l7 = 0000000000000000
	ldstuba	[%i6+%g0]0x81,%l7	! %l7 = 000000ca000000ff
!	%l0 = 1d7a4a879bfb0b5a, Mem[0000000010081400] = 000000ff
	stba	%l0,[%i2+%g0]0x88	! Mem[0000000010081400] = 0000005a
!	%l0 = 1d7a4a879bfb0b5a, Mem[0000000010001403] = 59c9c11a, %asi = 80
	stba	%l0,[%i0+0x003]%asi	! Mem[0000000010001400] = 59c9c15a
!	%l2 = 54a08722, %l3 = 00000032, Mem[0000000030181400] = fffae7c8 d47097e8
	stda	%l2,[%i6+%g0]0x81	! Mem[0000000030181400] = 54a08722 00000032
!	Mem[0000000020800000] = 10e98b5d, %l1 = 5d8c6527afd91451
	ldstuba	[%o1+0x000]%asi,%l1	! %l1 = 00000010000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = 621b0b00, %l5 = 000000000000003a
	lduba	[%i0+%o5]0x89,%l5	! %l5 = 0000000000000000

p0_label_37:
!	Mem[0000000030141400] = 2ccdffff, %l4 = 00000000ff7d28fc
	lduha	[%i5+%g0]0x89,%l4	! %l4 = 000000000000ffff
!	%l0 = 1d7a4a879bfb0b5a, imm = 0000000000000d5a, %l5 = 0000000000000000
	addc	%l0,0xd5a,%l5		! %l5 = 1d7a4a879bfb18b4
!	Mem[0000000010101410] = 54a08722, %f21 = 777b6b28
	lda	[%i4+%o5]0x88,%f21	! %f21 = 54a08722
!	Mem[0000000030081408] = ff2df6c3, %l3 = 0000000000000032
	ldsha	[%i2+%o4]0x81,%l3	! %l3 = ffffffffffffff2d
!	Mem[0000000030081408] = c3f62dff, %f7  = a4f2a45f
	lda	[%i2+%o4]0x89,%f7 	! %f7 = c3f62dff
!	Mem[0000000010001410] = fc287dff, %l3 = ffffffffffffff2d
	ldswa	[%i0+%o5]0x88,%l3	! %l3 = fffffffffc287dff
!	Mem[0000000010081400] = 02b03a610000005a, %l4 = 000000000000ffff
	ldxa	[%i2+%g0]0x88,%l4	! %l4 = 02b03a610000005a
!	Mem[0000000030141408] = 50300000, %l1 = 0000000000000010
	lduba	[%i5+%o4]0x81,%l1	! %l1 = 0000000000000050
!	Mem[0000000030141400] = cc7225622ccdffff, %l2 = 0000000054a08722
	ldxa	[%i5+%g0]0x89,%l2	! %l2 = cc7225622ccdffff
!	Starting 10 instruction Store Burst
!	Mem[000000001000142c] = ffffffc5, %l5 = 1d7a4a879bfb18b4
	ldstuba	[%i0+0x02c]%asi,%l5	! %l5 = 000000ff000000ff

p0_label_38:
!	%l5 = 00000000000000ff, Mem[0000000030041408] = 2287a054
	stba	%l5,[%i1+%o4]0x89	! Mem[0000000030041408] = 2287a0ff
!	%f28 = f76c28db 000000ff, Mem[0000000010041408] = c3fa212d 00004723
	stda	%f28,[%i1+%o4]0x88	! Mem[0000000010041408] = f76c28db 000000ff
!	%f17 = 000000ff, Mem[0000000030041408] = 2287a0ff
	sta	%f17,[%i1+%o4]0x89	! Mem[0000000030041408] = 000000ff
!	%f30 = 2d21fac3 54a08722, Mem[0000000030141400] = 2ccdffff cc722562
	stda	%f30,[%i5+%g0]0x89	! Mem[0000000030141400] = 2d21fac3 54a08722
!	%l0 = 1d7a4a879bfb0b5a, Mem[00000000100c1408] = ffb53bfaf05e1d00
	stxa	%l0,[%i3+%o4]0x80	! Mem[00000000100c1408] = 1d7a4a879bfb0b5a
!	%l4 = 02b03a610000005a, Mem[0000000030181408] = 03f28cb6
	stwa	%l4,[%i6+%o4]0x89	! Mem[0000000030181408] = 0000005a
!	Mem[0000000020800001] = ffe98b5d, %l2 = cc7225622ccdffff
	ldstuba	[%o1+0x001]%asi,%l2	! %l2 = 000000e9000000ff
!	Mem[0000000010041410] = 53a62c32, %l7 = 00000000000000ca
	swapa	[%i1+%o5]0x88,%l7	! %l7 = 0000000053a62c32
!	Mem[000000001000142c] = ffffffc5, %l0 = 9bfb0b5a, %l7 = 53a62c32
	add	%i0,0x2c,%g1
	casa	[%g1]0x80,%l0,%l7	! %l7 = 00000000ffffffc5
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = ffffffc500003050, %f22 = 69305030 0e056cf2
	ldda	[%i5+%o4]0x89,%f22	! %f22 = ffffffc5 00003050

p0_label_39:
!	Mem[0000000030101408] = 42208d62, %f11 = 2287a054
	lda	[%i4+%o4]0x81,%f11	! %f11 = 42208d62
!	Mem[0000000010181408] = fffae7c8, %l1 = 0000000000000050
	ldsba	[%i6+0x009]%asi,%l1	! %l1 = fffffffffffffffa
!	Mem[0000000010101428] = dff0c03b 4ea07165, %l4 = 0000005a, %l5 = 000000ff
	ldda	[%i4+0x028]%asi,%l4	! %l4 = 00000000dff0c03b 000000004ea07165
!	Mem[00000000100c1408] = 5a0bfb9b 874a7a1d, %l4 = dff0c03b, %l5 = 4ea07165
	ldda	[%i3+%o4]0x88,%l4	! %l4 = 00000000874a7a1d 000000005a0bfb9b
!	Mem[0000000030081408] = c3f62dff, %l1 = fffffffffffffffa
	ldsba	[%i2+%o4]0x89,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000030001410] = 621b0b00, %l0 = 1d7a4a879bfb0b5a
	lduwa	[%i0+%o5]0x89,%l0	! %l0 = 00000000621b0b00
!	Mem[0000000010001408] = 2ccdfbff, %l6 = 00000000000000b3
	ldsba	[%i0+%o4]0x88,%l6	! %l6 = ffffffffffffffff
!	Mem[00000000100c1408] = 1d7a4a87 9bfb0b5a, %l6 = ffffffff, %l7 = ffffffc5
	ldda	[%i3+%o4]0x80,%l6	! %l6 = 000000001d7a4a87 000000009bfb0b5a
!	Mem[0000000030181410] = 00000000, %l7 = 000000009bfb0b5a
	lduwa	[%i6+%o5]0x81,%l7	! %l7 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f24 = 59c9c11a, Mem[00000000300c1410] = 0030dee5
	sta	%f24,[%i3+%o5]0x89	! Mem[00000000300c1410] = 59c9c11a

p0_label_40:
!	Mem[0000000030181400] = 2287a054, %l2 = 00000000000000e9
	ldstuba	[%i6+%g0]0x89,%l2	! %l2 = 00000054000000ff
!	%l0 = 00000000621b0b00, Mem[00000000100c1438] = bbcd90b32287a054, %asi = 80
	stxa	%l0,[%i3+0x038]%asi	! Mem[00000000100c1438] = 00000000621b0b00
!	Mem[0000000010001400] = 59c9c15a628d28db, %l1 = ffffffffffffffff, %l7 = 0000000000000000
	casxa	[%i0]0x80,%l1,%l7	! %l7 = 59c9c15a628d28db
!	Mem[0000000010001400] = 59c9c15a, %l3 = fffffffffc287dff
	swapa	[%i0+%g0]0x80,%l3	! %l3 = 0000000059c9c15a
!	%l0 = 621b0b00, %l1 = ffffffff, Mem[0000000030181410] = 00000000 d4d8e55c
	stda	%l0,[%i6+%o5]0x89	! Mem[0000000030181410] = 621b0b00 ffffffff
!	Mem[0000000030001410] = 000b1b62, %l6 = 000000001d7a4a87
	swapa	[%i0+%o5]0x81,%l6	! %l6 = 00000000000b1b62
!	%l3 = 0000000059c9c15a, Mem[0000000010081430] = 8fb3004f08b6b8b1
	stx	%l3,[%i2+0x030]		! Mem[0000000010081430] = 0000000059c9c15a
!	%l1 = ffffffffffffffff, Mem[0000000030141400] = 2287a054
	stba	%l1,[%i5+%g0]0x81	! Mem[0000000030141400] = ff87a054
!	Mem[0000000020800001] = ffff8b5d, %l1 = ffffffffffffffff
	ldstuba	[%o1+0x001]%asi,%l1	! %l1 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = 9c3bafe9, %l5 = 000000005a0bfb9b
	ldsha	[%i1+%o5]0x89,%l5	! %l5 = ffffffffffffafe9

p0_label_41:
!	Mem[0000000030181408] = 0000005a, %l5 = ffffffffffffafe9
	lduwa	[%i6+%o4]0x89,%l5	! %l5 = 000000000000005a
!	Mem[00000000300c1408] = 0e056cf2, %l7 = 59c9c15a628d28db
	lduha	[%i3+%o4]0x89,%l7	! %l7 = 0000000000006cf2
!	Mem[0000000010181400] = 4e6be5ff, %l7 = 0000000000006cf2
	ldsba	[%i6+%g0]0x88,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000030001400] = ffe5a4d0 73b942de, %l2 = 00000054, %l3 = 59c9c15a
	ldda	[%i0+%g0]0x81,%l2	! %l2 = 00000000ffe5a4d0 0000000073b942de
!	Mem[0000000030081410] = 000000ff, %l5 = 000000000000005a
	lduwa	[%i2+%o5]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[000000001018141c] = 835706b4, %l1 = 00000000000000ff
	lduwa	[%i6+0x01c]%asi,%l1	! %l1 = 00000000835706b4
!	Mem[00000000211c0000] = ffff4340, %l1 = 00000000835706b4
	lduha	[%o2+0x000]%asi,%l1	! %l1 = 000000000000ffff
!	Mem[0000000010101410] = 54a08722, %f6  = e01ed417
	lda	[%i4+%o5]0x88,%f6 	! %f6 = 54a08722
!	Mem[0000000010181428] = 672e0378, %f14 = 904449f1
	lda	[%i6+0x028]%asi,%f14	! %f14 = 672e0378
!	Starting 10 instruction Store Burst
!	Mem[0000000010081408] = 0b000000, %l3 = 0000000073b942de
	swapa	[%i2+%o4]0x80,%l3	! %l3 = 000000000b000000

p0_label_42:
!	Mem[0000000010101400] = ff000000, %l6 = 00000000000b1b62
	ldstuba	[%i4+%g0]0x80,%l6	! %l6 = 000000ff000000ff
!	%f8  = 53a62c32 000000ff, Mem[0000000010081428] = 040231ed 0e056cf2
	std	%f8 ,[%i2+0x028]	! Mem[0000000010081428] = 53a62c32 000000ff
!	%l3 = 000000000b000000, Mem[00000000100c1410] = 53a62c32
	stwa	%l3,[%i3+%o5]0x88	! Mem[00000000100c1410] = 0b000000
!	%f12 = d8785725, Mem[0000000010181404] = ff0000ff
	st	%f12,[%i6+0x004]	! Mem[0000000010181404] = d8785725
!	Mem[00000000100c1400] = 54a08722, %l5 = 00000000000000ff
	swapa	[%i3+%g0]0x80,%l5	! %l5 = 0000000054a08722
!	%f28 = f76c28db 000000ff, Mem[0000000030081400] = ff000000 93d1d309
	stda	%f28,[%i2+%g0]0x89	! Mem[0000000030081400] = f76c28db 000000ff
!	Code Fragment 3
p0_fragment_4:
!	%l0 = 00000000621b0b00
	setx	0x6b471c8f89b6aca4,%g7,%l0 ! %l0 = 6b471c8f89b6aca4
!	%l1 = 000000000000ffff
	setx	0xd85bf0e020864005,%g7,%l1 ! %l1 = d85bf0e020864005
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 6b471c8f89b6aca4
	setx	0xe114cf77bf13d42b,%g7,%l0 ! %l0 = e114cf77bf13d42b
!	%l1 = d85bf0e020864005
	setx	0x59a766af8f3b2ece,%g7,%l1 ! %l1 = 59a766af8f3b2ece
!	Mem[0000000030181410] = 000b1b62, %l5 = 0000000054a08722
	ldswa	[%i6+%o5]0x81,%l5	! %l5 = 00000000000b1b62
!	Mem[00000000300c1410] = 1ac1c959, %l6 = 00000000000000ff
	ldstuba	[%i3+%o5]0x81,%l6	! %l6 = 0000001a000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = 2287a05459b17d9b, %l4 = 00000000874a7a1d
	ldxa	[%i2+%o5]0x88,%l4	! %l4 = 2287a05459b17d9b

p0_label_43:
!	Mem[0000000021800080] = abc3889d, %l4 = 2287a05459b17d9b
	lduh	[%o3+0x080],%l4		! %l4 = 000000000000abc3
!	Mem[0000000010181400] = ffe56b4e, %l7 = ffffffffffffffff
	lduba	[%i6+%g0]0x80,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010041400] = 29143c58, %l3 = 000000000b000000
	lduha	[%i1+%g0]0x88,%l3	! %l3 = 0000000000003c58
!	Mem[00000000300c1410] = 59c9c1ff, %l7 = 00000000000000ff
	ldsha	[%i3+%o5]0x89,%l7	! %l7 = ffffffffffffc1ff
!	Mem[0000000020800040] = a6110596, %l4 = 000000000000abc3
	ldsba	[%o1+0x040]%asi,%l4	! %l4 = ffffffffffffffa6
!	Mem[0000000030041410] = e9af3b9c, %l5 = 00000000000b1b62
	ldsba	[%i1+%o5]0x81,%l5	! %l5 = ffffffffffffffe9
!	Mem[00000000100c1408] = 874a7a1d, %l1 = 59a766af8f3b2ece
	lduha	[%i3+%o4]0x88,%l1	! %l1 = 0000000000007a1d
!	Mem[00000000100c1408] = 1d7a4a879bfb0b5a, %l4 = ffffffffffffffa6
	ldxa	[%i3+%o4]0x80,%l4	! %l4 = 1d7a4a879bfb0b5a
!	Mem[00000000218000c0] = 089bafd4, %l6 = 000000000000001a
	ldsh	[%o3+0x0c0],%l6		! %l6 = 000000000000089b
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1408] = 1d7a4a87, %l1 = 0000000000007a1d
	ldstuba	[%i3+%o4]0x80,%l1	! %l1 = 0000001d000000ff

p0_label_44:
!	Mem[0000000010041408] = 000000ff, %l7 = ffffffffffffc1ff
	swapa	[%i1+%o4]0x88,%l7	! %l7 = 00000000000000ff
!	%l2 = 00000000ffe5a4d0, Mem[00000000100c1408] = 874a7aff
	stha	%l2,[%i3+%o4]0x88	! Mem[00000000100c1408] = 874aa4d0
!	Mem[000000001000140c] = 69305030, %l3 = 00003c58, %l0 = bf13d42b
	add	%i0,0x0c,%g1
	casa	[%g1]0x80,%l3,%l0	! %l0 = 0000000069305030
!	%l0 = 0000000069305030, Mem[0000000010001428] = ffff9321ffffffc5
	stx	%l0,[%i0+0x028]		! Mem[0000000010001428] = 0000000069305030
!	%l0 = 0000000069305030, imm = fffffffffffff307, %l5 = ffffffffffffffe9
	add	%l0,-0xcf9,%l5		! %l5 = 0000000069304337
!	Mem[0000000030181410] = 621b0b00, %l2 = 00000000ffe5a4d0
	swapa	[%i6+%o5]0x89,%l2	! %l2 = 00000000621b0b00
!	%l6 = 000000000000089b, Mem[0000000010081408] = ff000000de42b973
	stxa	%l6,[%i2+%o4]0x88	! Mem[0000000010081408] = 000000000000089b
!	%f14 = 672e0378 0023df27, Mem[0000000010181438] = 53f41fc0 ffffffff
	std	%f14,[%i6+0x038]	! Mem[0000000010181438] = 672e0378 0023df27
!	Mem[0000000010101410] = 2287a054, %l6 = 000000000000089b
	ldstuba	[%i4+%o5]0x80,%l6	! %l6 = 00000022000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101428] = dff0c03b4ea07165, %l0 = 0000000069305030
	ldxa	[%i4+0x028]%asi,%l0	! %l0 = dff0c03b4ea07165

p0_label_45:
!	Mem[0000000010101430] = 3cbc4a5c3357ee94, %l6 = 0000000000000022
	ldx	[%i4+0x030],%l6		! %l6 = 3cbc4a5c3357ee94
!	Mem[0000000010181408] = fffae7c8000028db, %l6 = 3cbc4a5c3357ee94
	ldx	[%i6+%o4],%l6		! %l6 = fffae7c8000028db
!	Mem[0000000010081400] = 5a000000613ab002, %l0 = dff0c03b4ea07165
	ldxa	[%i2+%g0]0x80,%l0	! %l0 = 5a000000613ab002
!	Mem[0000000020800040] = a6110596, %l3 = 0000000000003c58
	ldsb	[%o1+0x041],%l3		! %l3 = 0000000000000011
!	Mem[0000000030181400] = 2287a0ff, %l1 = 000000000000001d
	lduha	[%i6+%g0]0x89,%l1	! %l1 = 000000000000a0ff
!	Mem[0000000030081410] = 000000ff, %l5 = 0000000069304337
	lduwa	[%i2+%o5]0x89,%l5	! %l5 = 00000000000000ff
	membar	#Sync			! Added by membar checker (6)
!	Mem[0000000030001400] = ffe5a4d0 73b942de 2d000000 beff5d9a
!	Mem[0000000030001410] = 1d7a4a87 6efd6fdd 5ea25b74 56860dd4
!	Mem[0000000030001420] = 772efcfd eb35b308 b52df303 d6bc032f
!	Mem[0000000030001430] = 0daaa74c cfa24919 f7bef48f ce4e00a6
	ldda	[%i0]ASI_BLK_AIUS,%f16	! Block Load from 0000000030001400
!	Mem[00000000100c1408] = 874aa4d0, %l5 = 00000000000000ff
	lduba	[%i3+%o4]0x88,%l5	! %l5 = 00000000000000d0
!	Mem[0000000010181404] = d8785725, %f6  = 54a08722
	lda	[%i6+0x004]%asi,%f6 	! %f6 = d8785725
!	Starting 10 instruction Store Burst
!	%l1 = 000000000000a0ff, Mem[0000000030041400] = 1ac1c95921c592bb
	stxa	%l1,[%i1+%g0]0x81	! Mem[0000000030041400] = 000000000000a0ff

p0_label_46:
!	%f2  = e5ff2eaa f05e1d00, Mem[0000000010101400] = 000000ff 00000032
	stda	%f2 ,[%i4+%g0]0x88	! Mem[0000000010101400] = e5ff2eaa f05e1d00
!	Mem[0000000030001400] = ffe5a4d0, %l1 = 000000000000a0ff
	ldstuba	[%i0+%g0]0x81,%l1	! %l1 = 000000ff000000ff
!	%l3 = 0000000000000011, Mem[0000000030101408] = 42208d622bfb7c59
	stxa	%l3,[%i4+%o4]0x81	! Mem[0000000030101408] = 0000000000000011
!	%l1 = 00000000000000ff, Mem[0000000010001410] = ff7d28fc777b6b28
	stxa	%l1,[%i0+%o5]0x80	! Mem[0000000010001410] = 00000000000000ff
!	%f12 = d8785725, Mem[0000000010041408] = ffc1ffff
	sta	%f12,[%i1+%o4]0x80	! Mem[0000000010041408] = d8785725
!	%l1 = 00000000000000ff, Mem[0000000010101428] = dff0c03b, %asi = 80
	stwa	%l1,[%i4+0x028]%asi	! Mem[0000000010101428] = 000000ff
!	Mem[0000000010181410] = 000000ff, %l1 = 00000000000000ff
	swapa	[%i6+%o5]0x88,%l1	! %l1 = 00000000000000ff
!	Code Fragment 3
p0_fragment_5:
!	%l0 = 5a000000613ab002
	setx	0x9203dd70732f27b8,%g7,%l0 ! %l0 = 9203dd70732f27b8
!	%l1 = 00000000000000ff
	setx	0x6d007f603be9c07d,%g7,%l1 ! %l1 = 6d007f603be9c07d
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 9203dd70732f27b8
	setx	0x285b7e6fba8739fa,%g7,%l0 ! %l0 = 285b7e6fba8739fa
!	%l1 = 6d007f603be9c07d
	setx	0xc79a349fc159118c,%g7,%l1 ! %l1 = c79a349fc159118c
!	%l0 = ba8739fa, %l1 = c159118c, Mem[00000000300c1410] = ffc1c959 c8e7faca
	stda	%l0,[%i3+%o5]0x81	! Mem[00000000300c1410] = ba8739fa c159118c
!	Starting 10 instruction Load Burst
!	Mem[000000001010140c] = 22691d48, %l4 = 1d7a4a879bfb0b5a
	lduw	[%i4+0x00c],%l4		! %l4 = 0000000022691d48

p0_label_47:
!	Mem[00000000100c1400] = 000000ff, %l5 = 00000000000000d0
	lduba	[%i3+%g0]0x80,%l5	! %l5 = 0000000000000000
!	Mem[000000001010140c] = 22691d48, %l5 = 0000000000000000
	lduha	[%i4+0x00c]%asi,%l5	! %l5 = 0000000000002269
!	Mem[0000000030181400] = 2287a0ff, %f4  = 4723ba2c
	lda	[%i6+%g0]0x89,%f4 	! %f4 = 2287a0ff
!	Mem[0000000010081418] = 3f8445a6 e86a4aef, %l0 = ba8739fa, %l1 = c159118c
	ldd	[%i2+0x018],%l0		! %l0 = 000000003f8445a6 00000000e86a4aef
!	Mem[0000000010141410] = aa2effff, %l2 = 00000000621b0b00
	ldsha	[%i5+%o5]0x88,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000010081428] = 53a62c32, %l2 = ffffffffffffffff
	ldsba	[%i2+0x02a]%asi,%l2	! %l2 = 000000000000002c
!	Mem[0000000010181408] = fffae7c8, %l7 = 00000000000000ff
	ldsba	[%i6+%o4]0x80,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000030041410] = e9af3b9c8c35d704, %l5 = 0000000000002269
	ldxa	[%i1+%o5]0x81,%l5	! %l5 = e9af3b9c8c35d704
!	Mem[0000000010081410] = 9b7db159, %l3 = 0000000000000011
	ldsha	[%i2+%o5]0x80,%l3	! %l3 = ffffffffffff9b7d
!	Starting 10 instruction Store Burst
!	%l3 = ffffffffffff9b7d, Mem[0000000010141400] = fffbcd2c297c2a6b, %asi = 80
	stxa	%l3,[%i5+0x000]%asi	! Mem[0000000010141400] = ffffffffffff9b7d

p0_label_48:
!	%l5 = e9af3b9c8c35d704, Mem[0000000030101408] = 1100000000000000
	stxa	%l5,[%i4+%o4]0x89	! Mem[0000000030101408] = e9af3b9c8c35d704
!	%l4 = 0000000022691d48, Mem[0000000030141408] = 50300000
	stha	%l4,[%i5+%o4]0x81	! Mem[0000000030141408] = 1d480000
!	%l1 = 00000000e86a4aef, Mem[0000000030081400] = ff000000db286cf7
	stxa	%l1,[%i2+%g0]0x81	! Mem[0000000030081400] = 00000000e86a4aef
!	%f8  = 53a62c32 000000ff, Mem[0000000010181410] = ff000000 00000000
	stda	%f8 ,[%i6+%o5]0x80	! Mem[0000000010181410] = 53a62c32 000000ff
!	%f0  = 8aa63b93 ed310204, %f17 = 73b942de
	fdtoi	%f0 ,%f17		! %f17 = 00000000
!	%l1 = 00000000e86a4aef, Mem[00000000100c140c] = 9bfb0b5a
	sth	%l1,[%i3+0x00c]		! Mem[00000000100c140c] = 4aef0b5a
!	%l0 = 000000003f8445a6, Mem[00000000211c0001] = ffff4340, %asi = 80
	stba	%l0,[%o2+0x001]%asi	! Mem[00000000211c0000] = ffa64340
!	Mem[0000000010141438] = 12ba6ace, %l6 = 000028db, %l7 = ffffffff
	add	%i5,0x38,%g1
	casa	[%g1]0x80,%l6,%l7	! %l7 = 0000000012ba6ace
!	Mem[0000000010141400] = ffffffffffff9b7d, %l1 = 00000000e86a4aef, %l6 = fffae7c8000028db
	casxa	[%i5]0x80,%l1,%l6	! %l6 = ffffffffffff9b7d
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = 00000000, %l4 = 0000000022691d48
	ldswa	[%i0+%o5]0x80,%l4	! %l4 = 0000000000000000

p0_label_49:
!	Mem[0000000030181410] = d0a4e5ff, %l2 = 000000000000002c
	ldswa	[%i6+%o5]0x81,%l2	! %l2 = ffffffffd0a4e5ff
!	Mem[00000000300c1408] = 0e056cf2, %l2 = ffffffffd0a4e5ff
	ldswa	[%i3+%o4]0x89,%l2	! %l2 = 000000000e056cf2
!	Mem[0000000010101418] = 5202829c, %l7 = 0000000012ba6ace
	ldsba	[%i4+0x019]%asi,%l7	! %l7 = 0000000000000002
!	Mem[0000000030101408] = 04d7358c9c3bafe9, %f24 = 772efcfd eb35b308
	ldda	[%i4+%o4]0x81,%f24	! %f24 = 04d7358c 9c3bafe9
!	Mem[00000000100c1400] = 000000ff, %l6 = ffffffffffff9b7d
	ldsha	[%i3+%g0]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000030181400] = 320000002287a0ff, %l2 = 000000000e056cf2
	ldxa	[%i6+%g0]0x89,%l2	! %l2 = 320000002287a0ff
!	Mem[0000000030041400] = 00000000, %l0 = 000000003f8445a6
	lduha	[%i1+%g0]0x89,%l0	! %l0 = 0000000000000000
!	%f10 = bbcd90b3, %f2  = e5ff2eaa, %f20 = 1d7a4a87
	fsubs	%f10,%f2 ,%f20		! %f20 = 65ff2eaa
!	Mem[0000000030181410] = d0a4e5ff, %l5 = e9af3b9c8c35d704
	ldsha	[%i6+%o5]0x81,%l5	! %l5 = ffffffffffffd0a4
!	Starting 10 instruction Store Burst
!	%l2 = 320000002287a0ff, Mem[00000000211c0000] = ffa64340, %asi = 80
	stha	%l2,[%o2+0x000]%asi	! Mem[00000000211c0000] = a0ff4340

p0_label_50:
!	Mem[0000000010101420] = 3bd122bc, %l2 = 320000002287a0ff
	ldstuba	[%i4+0x020]%asi,%l2	! %l2 = 0000003b000000ff
!	%l1 = 00000000e86a4aef, Mem[0000000010101432] = 3cbc4a5c
	sth	%l1,[%i4+0x032]		! Mem[0000000010101430] = 3cbc4aef
!	%l7 = 0000000000000002, Mem[0000000021800040] = 239b75ef
	sth	%l7,[%o3+0x040]		! Mem[0000000021800040] = 000275ef
!	Mem[0000000010181410] = 322ca653, %l1 = 00000000e86a4aef
	ldstuba	[%i6+%o5]0x88,%l1	! %l1 = 00000053000000ff
!	%l7 = 0000000000000002, Mem[00000000100c1400] = 000000ff
	stha	%l7,[%i3+%g0]0x80	! Mem[00000000100c1400] = 000200ff
!	%l0 = 0000000000000000, Mem[000000001008141d] = e86a4aef, %asi = 80
	stba	%l0,[%i2+0x01d]%asi	! Mem[000000001008141c] = e8004aef
!	%f5  = 563635da, Mem[0000000010081434] = 59c9c15a
	st	%f5 ,[%i2+0x034]	! Mem[0000000010081434] = 563635da
!	Mem[0000000030001408] = 2d000000, %l5 = ffffffffffffd0a4
	ldstuba	[%i0+%o4]0x81,%l5	! %l5 = 0000002d000000ff
!	%l1 = 0000000000000053, Mem[0000000010001400] = db288d62ff7d28fc
	stxa	%l1,[%i0+%g0]0x88	! Mem[0000000010001400] = 0000000000000053
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = 0b000000, %l2 = 000000000000003b
	lduba	[%i3+%o5]0x88,%l2	! %l2 = 0000000000000000

p0_label_51:
!	Mem[0000000030141408] = 1d480000, %f31 = ce4e00a6
	lda	[%i5+%o4]0x81,%f31	! %f31 = 1d480000
!	Mem[0000000010041400] = 583c1429, %l7 = 0000000000000002
	ldsh	[%i1+0x002],%l7		! %l7 = 0000000000001429
!	Mem[0000000010101408] = 481d6922bbcd90ff, %f4  = 2287a0ff 563635da
	ldda	[%i4+%o4]0x88,%f4 	! %f4  = 481d6922 bbcd90ff
!	%l4 = 0000000000000000, immed = 00000449, %y  = 00000028
	smul	%l4,0x449,%l2		! %l2 = 0000000000000000, %y = 00000000
!	Mem[0000000010181400] = 4e6be5ff, %l5 = 000000000000002d
	ldsha	[%i6+%g0]0x88,%l5	! %l5 = ffffffffffffe5ff
!	Mem[0000000010041408] = d8785725, %l0 = 0000000000000000
	lduwa	[%i1+%o4]0x80,%l0	! %l0 = 00000000d8785725
!	Mem[0000000030181408] = 0000005a, %f15 = 0023df27
	lda	[%i6+%o4]0x89,%f15	! %f15 = 0000005a
!	Mem[0000000010181410] = ff000000 322ca6ff, %l6 = 00000000, %l7 = 00001429
	ldda	[%i6+%o5]0x88,%l6	! %l6 = 00000000322ca6ff 00000000ff000000
!	Mem[00000000300c1410] = ba8739fa, %l0 = 00000000d8785725
	ldsba	[%i3+%o5]0x81,%l0	! %l0 = ffffffffffffffba
!	Starting 10 instruction Store Burst
!	Mem[00000000201c0001] = 002de0d4, %l5 = ffffffffffffe5ff
	ldstub	[%o0+0x001],%l5		! %l5 = 0000002d000000ff

p0_label_52:
!	%f2  = e5ff2eaa, Mem[0000000010141410] = aa2effff
	sta	%f2 ,[%i5+%o5]0x88	! Mem[0000000010141410] = e5ff2eaa
!	%l5 = 000000000000002d, Mem[00000000100c1408] = d0a44a874aef0b5a
	stxa	%l5,[%i3+%o4]0x80	! Mem[00000000100c1408] = 000000000000002d
!	Mem[0000000010001420] = 59c9c11a628d28db, %l0 = ffffffffffffffba, %l0 = ffffffffffffffba
	add	%i0,0x20,%g1
	casxa	[%g1]0x80,%l0,%l0	! %l0 = 59c9c11a628d28db
!	%l1 = 0000000000000053, Mem[0000000010101410] = 54a087ff
	stwa	%l1,[%i4+%o5]0x88	! Mem[0000000010101410] = 00000053
!	%l4 = 00000000, %l5 = 0000002d, Mem[0000000030081410] = ff000000 c5ffffff
	stda	%l4,[%i2+%o5]0x81	! Mem[0000000030081410] = 00000000 0000002d
!	Mem[0000000010181408] = fffae7c8, %l4 = 0000000000000000
	ldstuba	[%i6+%o4]0x80,%l4	! %l4 = 000000ff000000ff
!	Mem[0000000010181410] = ffa62c32, %l2 = 0000000000000000
	ldstuba	[%i6+%o5]0x80,%l2	! %l2 = 000000ff000000ff
!	%l2 = 00000000000000ff, Mem[0000000010101408] = bbcd90ff
	stwa	%l2,[%i4+%o4]0x88	! Mem[0000000010101408] = 000000ff
!	Mem[0000000010101430] = 3cbc4aef, %l4 = 00000000000000ff, %asi = 80
	swapa	[%i4+0x030]%asi,%l4	! %l4 = 000000003cbc4aef
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = 000000ff, %l0 = 59c9c11a628d28db
	ldswa	[%i1+%o4]0x89,%l0	! %l0 = 00000000000000ff

p0_label_53:
!	Mem[0000000010101408] = 000000ff, %l5 = 000000000000002d
	lduba	[%i4+%o4]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010181410] = ffa62c32, %l5 = 00000000000000ff
	lduha	[%i6+%o5]0x80,%l5	! %l5 = 000000000000ffa6
!	Mem[0000000030181400] = ffa08722, %f24 = 04d7358c
	lda	[%i6+%g0]0x81,%f24	! %f24 = ffa08722
!	Mem[0000000010001408] = 30503069 2ccdfbff, %l6 = 322ca6ff, %l7 = ff000000
	ldda	[%i0+%o4]0x88,%l6	! %l6 = 000000002ccdfbff 0000000030503069
!	Mem[0000000010101400] = f05e1d00, %l4 = 000000003cbc4aef
	ldswa	[%i4+%g0]0x88,%l4	! %l4 = fffffffff05e1d00
!	Mem[0000000030101408] = 8c35d704, %f24 = ffa08722
	lda	[%i4+%o4]0x89,%f24	! %f24 = 8c35d704
!	Mem[0000000010041404] = 000000ff, %l3 = ffffffffffff9b7d
	lduha	[%i1+0x006]%asi,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010001408] = 30503069 2ccdfbff, %l6 = 2ccdfbff, %l7 = 30503069
	ldda	[%i0+%o4]0x88,%l6	! %l6 = 000000002ccdfbff 0000000030503069
!	Mem[0000000010101428] = 000000ff4ea07165, %l2 = 00000000000000ff
	ldx	[%i4+0x028],%l2		! %l2 = 000000ff4ea07165
!	Starting 10 instruction Store Burst
!	Mem[0000000010181400] = ffe56b4e, %l7 = 0000000030503069
	swapa	[%i6+%g0]0x80,%l7	! %l7 = 00000000ffe56b4e

p0_label_54:
!	%f22 = 5ea25b74 56860dd4, Mem[0000000010101408] = ff000000 22691d48
	std	%f22,[%i4+%o4]	! Mem[0000000010101408] = 5ea25b74 56860dd4
	membar	#Sync			! Added by membar checker (7)
!	%l3 = 00000000000000ff, Mem[0000000030001400] = ffe5a4d0
	stwa	%l3,[%i0+%g0]0x81	! Mem[0000000030001400] = 000000ff
!	%f19 = beff5d9a, Mem[0000000030181400] = 2287a0ff
	sta	%f19,[%i6+%g0]0x89	! Mem[0000000030181400] = beff5d9a
!	%l3 = 00000000000000ff, Mem[0000000020800041] = a6110596, %asi = 80
	stba	%l3,[%o1+0x041]%asi	! Mem[0000000020800040] = a6ff0596
!	%l1 = 0000000000000053, %l6 = 000000002ccdfbff, %l0 = 00000000000000ff
	orn	%l1,%l6,%l0		! %l0 = ffffffffd3320453
!	Mem[0000000030001408] = ff000000, %l1 = 0000000000000053
	swapa	[%i0+%o4]0x81,%l1	! %l1 = 00000000ff000000
!	%f28 = 0daaa74c cfa24919, Mem[0000000010041410] = 000000ca 9d00002c
	stda	%f28,[%i1+%o5]0x88	! Mem[0000000010041410] = 0daaa74c cfa24919
!	%l0 = d3320453, %l1 = ff000000, Mem[00000000300c1408] = f26c050e 18a7e7b2
	stda	%l0,[%i3+%o4]0x81	! Mem[00000000300c1408] = d3320453 ff000000
!	%l1 = 00000000ff000000, Mem[00000000300c1410] = fa3987ba
	stwa	%l1,[%i3+%o5]0x89	! Mem[00000000300c1410] = ff000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030101410] = 53a62c32 18016506, %l6 = 2ccdfbff, %l7 = ffe56b4e
	ldda	[%i4+%o5]0x89,%l6	! %l6 = 0000000018016506 0000000053a62c32

p0_label_55:
!	%l6 = 0000000018016506, imm = ffffffffffffff36, %l3 = 00000000000000ff
	subc	%l6,-0x0ca,%l3		! %l3 = 00000000180165d0
!	Mem[00000000300c1408] = 000000ff 530432d3, %l2 = 4ea07165, %l3 = 180165d0
	ldda	[%i3+%o4]0x89,%l2	! %l2 = 00000000530432d3 00000000000000ff
!	Mem[00000000100c1408] = 00000000, %l0 = ffffffffd3320453
	ldsha	[%i3+%o4]0x88,%l0	! %l0 = 0000000000000000
!	Mem[00000000100c1400] = 000200ff, %f29 = cfa24919
	lda	[%i3+%g0]0x80,%f29	! %f29 = 000200ff
!	Mem[0000000010141410] = e5ff2eaa, %l1 = 00000000ff000000
	lduwa	[%i5+%o5]0x88,%l1	! %l1 = 00000000e5ff2eaa
!	Mem[0000000010141410] = e5ff2eaa, %l5 = 000000000000ffa6
	ldsba	[%i5+%o5]0x88,%l5	! %l5 = ffffffffffffffaa
!	Mem[0000000010081410] = 59b17d9b, %l4 = fffffffff05e1d00
	lduba	[%i2+%o5]0x88,%l4	! %l4 = 000000000000009b
!	%f3  = f05e1d00, %f7  = c3f62dff, %f14 = 672e0378 0000005a
	fsmuld	%f3 ,%f7 ,%f14		! %f14 = 469ab2f8 cafc6000
!	Mem[0000000010081420] = 185dc333, %l3 = 00000000000000ff
	ldsw	[%i2+0x020],%l3		! %l3 = 00000000185dc333
!	Starting 10 instruction Store Burst
!	%f22 = 5ea25b74, Mem[0000000030181400] = 9a5dffbe
	sta	%f22,[%i6+%g0]0x81	! Mem[0000000030181400] = 5ea25b74

p0_label_56:
!	%l5 = ffffffffffffffaa, Mem[0000000010101410] = 53000000
	stha	%l5,[%i4+%o5]0x80	! Mem[0000000010101410] = ffaa0000
!	Mem[0000000030001400] = 000000ff, %l1 = 00000000e5ff2eaa
	ldstuba	[%i0+%g0]0x81,%l1	! %l1 = 00000000000000ff
!	%l4 = 000000000000009b, Mem[0000000010001400] = 00000053
	stba	%l4,[%i0+%g0]0x88	! Mem[0000000010001400] = 0000009b
!	%l2 = 530432d3, %l3 = 185dc333, Mem[0000000010081400] = 0000005a 02b03a61
	stda	%l2,[%i2+%g0]0x88	! Mem[0000000010081400] = 530432d3 185dc333
!	%f10 = bbcd90b3 42208d62, Mem[0000000030141408] = 0000481d ffffffc5
	stda	%f10,[%i5+%o4]0x89	! Mem[0000000030141408] = bbcd90b3 42208d62
!	%l4 = 000000000000009b, Mem[0000000030001410] = 874a7a1d
	stha	%l4,[%i0+%o5]0x89	! Mem[0000000030001410] = 874a009b
!	%l3 = 00000000185dc333, Mem[0000000010181410] = ffa62c32000000ff
	stxa	%l3,[%i6+%o5]0x80	! Mem[0000000010181410] = 00000000185dc333
!	%f30 = f7bef48f 1d480000, Mem[0000000010081408] = 9b080000 00000000
	stda	%f30,[%i2+%o4]0x80	! Mem[0000000010081408] = f7bef48f 1d480000
!	Mem[0000000010001408] = fffbcd2c, %l3 = 00000000185dc333, %asi = 80
	swapa	[%i0+0x008]%asi,%l3	! %l3 = 00000000fffbcd2c
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = 29143c58, %l3 = 00000000fffbcd2c
	ldsba	[%i1+%g0]0x88,%l3	! %l3 = 0000000000000058

p0_label_57:
!	Mem[000000001018140c] = 000028db, %l1 = 0000000000000000
	ldsha	[%i6+0x00e]%asi,%l1	! %l1 = 00000000000028db
!	Mem[0000000010101408] = 745ba25e, %l4 = 000000000000009b
	ldsha	[%i4+%o4]0x88,%l4	! %l4 = ffffffffffffa25e
!	Mem[0000000010181418] = 1aba4d75835706b4, %l0 = 0000000000000000
	ldx	[%i6+0x018],%l0		! %l0 = 1aba4d75835706b4
!	Mem[0000000010141408] = cc722562, %f28 = 0daaa74c
	lda	[%i5+%o4]0x80,%f28	! %f28 = cc722562
!	Mem[0000000010181400] = 30503069, %l1 = 00000000000028db
	ldswa	[%i6+%g0]0x80,%l1	! %l1 = 0000000030503069
!	Mem[00000000100c1410] = 0000000b, %l1 = 0000000030503069
	lduwa	[%i3+%o5]0x80,%l1	! %l1 = 000000000000000b
!	Mem[0000000010081400] = d3320453, %l7 = 0000000053a62c32
	lduha	[%i2+%g0]0x80,%l7	! %l7 = 000000000000d332
!	Mem[0000000010181410] = 00000000, %l4 = ffffffffffffa25e
	lduwa	[%i6+%o5]0x80,%l4	! %l4 = 0000000000000000
!	%l4 = 0000000000000000, %l2 = 00000000530432d3, %l1 = 000000000000000b
	addc	%l4,%l2,%l1		! %l1 = 00000000530432d3
!	Starting 10 instruction Store Burst
!	%f26 = b52df303, %f30 = f7bef48f
	fcmpes	%fcc3,%f26,%f30		! %fcc3 = 2

p0_label_58:
!	Mem[0000000010081408] = 8ff4bef7, %l6 = 0000000018016506
	ldstuba	[%i2+%o4]0x88,%l6	! %l6 = 000000f7000000ff
!	%l0 = 1aba4d75835706b4, Mem[0000000010101410] = ffaa0000
	stha	%l0,[%i4+%o5]0x80	! Mem[0000000010101410] = 06b40000
!	%l7 = 000000000000d332, Mem[0000000010001400] = 0000009b
	stba	%l7,[%i0+%g0]0x88	! Mem[0000000010001400] = 00000032
!	Mem[000000001018141c] = 835706b4, %l5 = ffffffaa, %l5 = ffffffaa
	add	%i6,0x1c,%g1
	casa	[%g1]0x80,%l5,%l5	! %l5 = 00000000835706b4
!	Mem[0000000030101408] = 8c35d704, %l0 = 1aba4d75835706b4
	ldstuba	[%i4+%o4]0x89,%l0	! %l0 = 00000004000000ff
!	%l1 = 00000000530432d3, Mem[00000000100c1400] = 000200ff
	stwa	%l1,[%i3+%g0]0x80	! Mem[00000000100c1400] = 530432d3
!	%l2 = 00000000530432d3, Mem[0000000010001408] = 185dc333
	stha	%l2,[%i0+%o4]0x80	! Mem[0000000010001408] = 32d3c333
!	Mem[0000000030041410] = 9c3bafe9, %l5 = 00000000835706b4
	swapa	[%i1+%o5]0x89,%l5	! %l5 = 000000009c3bafe9
!	Mem[000000001018140e] = 000028db, %l5 = 000000009c3bafe9
	ldstuba	[%i6+0x00e]%asi,%l5	! %l5 = 00000028000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001430] = f76c28db, %l0 = 0000000000000004
	ldub	[%i0+0x031],%l0		! %l0 = 000000000000006c

p0_label_59:
!	Mem[0000000010001400] = 32000000, %l1 = 00000000530432d3
	lduba	[%i0+%g0]0x80,%l1	! %l1 = 0000000000000032
!	Mem[0000000030081400] = 00000000 e86a4aef, %l2 = 530432d3, %l3 = 00000058
	ldda	[%i2+%g0]0x81,%l2	! %l2 = 0000000000000000 00000000e86a4aef
!	Mem[00000000100c1410] = 0000000b, %l7 = 000000000000d332
	ldswa	[%i3+0x010]%asi,%l7	! %l7 = 000000000000000b
!	Mem[0000000010041410] = 1949a2cf 4ca7aa0d, %l6 = 000000f7, %l7 = 0000000b
	ldda	[%i1+%o5]0x80,%l6	! %l6 = 000000001949a2cf 000000004ca7aa0d
!	Mem[0000000010001400] = 0000000000000032, %f12 = d8785725 f26c050e
	ldda	[%i0+%g0]0x88,%f12	! %f12 = 00000000 00000032
!	Mem[0000000010001410] = 00000000, %l6 = 000000001949a2cf
	ldsba	[%i0+%o5]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000030141408] = bbcd90b342208d62, %f10 = bbcd90b3 42208d62
	ldda	[%i5+%o4]0x89,%f10	! %f10 = bbcd90b3 42208d62
!	Mem[0000000010101400] = 001d5ef0, %l2 = 0000000000000000
	ldsha	[%i4+%g0]0x80,%l2	! %l2 = 000000000000001d
!	Mem[000000001018141c] = 835706b4, %l3 = 00000000e86a4aef
	lduwa	[%i6+0x01c]%asi,%l3	! %l3 = 00000000835706b4
!	Starting 10 instruction Store Burst
!	Mem[0000000020800001] = ffff8b5d, %l7 = 000000004ca7aa0d
	ldstub	[%o1+0x001],%l7		! %l7 = 000000ff000000ff

p0_label_60:
!	%f16 = ffe5a4d0 00000000, %l7 = 00000000000000ff
!	Mem[0000000010001418] = 040231ed0e056cf2
	add	%i0,0x018,%g1
	stda	%f16,[%g1+%l7]ASI_PST8_PL ! Mem[0000000010001418] = 00000000d0a4e5ff
!	Code Fragment 4
p0_fragment_6:
!	%l0 = 000000000000006c
	setx	0xb7e0787fdb746492,%g7,%l0 ! %l0 = b7e0787fdb746492
!	%l1 = 0000000000000032
	setx	0x867ba1f00809098c,%g7,%l1 ! %l1 = 867ba1f00809098c
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = b7e0787fdb746492
	setx	0xf02d37e784e63019,%g7,%l0 ! %l0 = f02d37e784e63019
!	%l1 = 867ba1f00809098c
	setx	0xa6fa840796615403,%g7,%l1 ! %l1 = a6fa840796615403
!	%l5 = 0000000000000028, Mem[0000000030081410] = 00000000
	stha	%l5,[%i2+%o5]0x81	! Mem[0000000030081410] = 00280000
!	%l3 = 00000000835706b4, Mem[0000000010141400] = ffffffffffff9b7d
	stx	%l3,[%i5+%g0]		! Mem[0000000010141400] = 00000000835706b4
!	%l6 = 00000000, %l7 = 000000ff, Mem[0000000010041410] = cfa24919 0daaa74c
	stda	%l6,[%i1+%o5]0x88	! Mem[0000000010041410] = 00000000 000000ff
!	%l7 = 00000000000000ff, Mem[0000000030141408] = 42208d62
	stha	%l7,[%i5+%o4]0x89	! Mem[0000000030141408] = 422000ff
!	Mem[00000000201c0000] = 00ffe0d4, %l1 = a6fa840796615403
	ldstub	[%o0+%g0],%l1		! %l1 = 00000000000000ff
!	Mem[0000000030101408] = 8c35d7ff, %l0 = f02d37e784e63019
	swapa	[%i4+%o4]0x89,%l0	! %l0 = 000000008c35d7ff
!	Mem[0000000010001410] = 00000000, %l0 = 000000008c35d7ff
	swapa	[%i0+%o5]0x88,%l0	! %l0 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = 59b17d9b, %l1 = 0000000000000000
	lduha	[%i2+%o5]0x88,%l1	! %l1 = 0000000000007d9b

p0_label_61:
!	Mem[0000000010041404] = 000000ff, %l4 = 0000000000000000
	lduba	[%i1+0x004]%asi,%l4	! %l4 = 0000000000000000
!	Mem[00000000211c0000] = a0ff4340, %l1 = 0000000000007d9b
	lduba	[%o2+0x001]%asi,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030001400] = ff0000ff, %l5 = 0000000000000028
	lduba	[%i0+%g0]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010141420] = 0dbd81898aa63b93, %f6  = d8785725 c3f62dff
	ldda	[%i5+0x020]%asi,%f6 	! %f6  = 0dbd8189 8aa63b93
!	Mem[0000000010041408] = d8785725, %l7 = 00000000000000ff
	lduha	[%i1+%o4]0x80,%l7	! %l7 = 000000000000d878
!	Mem[0000000030101408] = 1930e6849c3bafe9, %f2  = e5ff2eaa f05e1d00
	ldda	[%i4+%o4]0x81,%f2 	! %f2  = 1930e684 9c3bafe9
!	Mem[00000000100c1410] = 0000000b, %l7 = 000000000000d878
	ldswa	[%i3+%o5]0x80,%l7	! %l7 = 000000000000000b
!	Mem[0000000010101400] = f05e1d00, %l2 = 000000000000001d
	lduha	[%i4+%g0]0x88,%l2	! %l2 = 0000000000001d00
!	Mem[0000000010181408] = c8e7faff, %l0 = 0000000000000000
	ldswa	[%i6+%o4]0x88,%l0	! %l0 = ffffffffc8e7faff
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000000000, Mem[0000000010001410] = 8c35d7ff
	stha	%l4,[%i0+%o5]0x88	! Mem[0000000010001410] = 8c350000

p0_label_62:
!	Code Fragment 4
p0_fragment_7:
!	%l0 = ffffffffc8e7faff
	setx	0xac870d8f87b4136e,%g7,%l0 ! %l0 = ac870d8f87b4136e
!	%l1 = 00000000000000ff
	setx	0x8f13fd7835cb0832,%g7,%l1 ! %l1 = 8f13fd7835cb0832
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = ac870d8f87b4136e
	setx	0xf03f5947b87b239d,%g7,%l0 ! %l0 = f03f5947b87b239d
!	%l1 = 8f13fd7835cb0832
	setx	0x488fa0405b94589b,%g7,%l1 ! %l1 = 488fa0405b94589b
!	%f24 = 8c35d704 9c3bafe9, %l7 = 000000000000000b
!	Mem[0000000030141410] = ffd5c92df8bd5546
	add	%i5,0x010,%g1
	stda	%f24,[%g1+%l7]ASI_PST8_S ! Mem[0000000030141410] = ffd5c92d9cbdafe9
!	%l7 = 000000000000000b, Mem[0000000030081408] = ff2df6c3dee144c3
	stxa	%l7,[%i2+%o4]0x81	! Mem[0000000030081408] = 000000000000000b
!	Mem[0000000010041420] = 0e1fa963e60f9592, %l7 = 000000000000000b
	ldx	[%i1+0x020],%l7		! %l7 = 0e1fa963e60f9592
!	%f6  = 0dbd8189 8aa63b93, Mem[0000000010101418] = 5202829c 00002287
	std	%f6 ,[%i4+0x018]	! Mem[0000000010101418] = 0dbd8189 8aa63b93
!	%l1 = 488fa0405b94589b, Mem[0000000030101400] = 30503069
	stwa	%l1,[%i4+%g0]0x89	! Mem[0000000030101400] = 5b94589b
!	%f18 = 2d000000 beff5d9a, Mem[0000000010041400] = 583c1429 000000ff
	stda	%f18,[%i1+%g0]0x80	! Mem[0000000010041400] = 2d000000 beff5d9a
!	Mem[0000000030001410] = 874a009b, %l0 = f03f5947b87b239d
	swapa	[%i0+%o5]0x89,%l0	! %l0 = 00000000874a009b
!	%l5 = 00000000000000ff, Mem[00000000300c1410] = 000000ff
	stwa	%l5,[%i3+%o5]0x81	! Mem[00000000300c1410] = 000000ff
!	Starting 10 instruction Load Burst
!	%l7 = 0e1fa963e60f9592, %l4 = 0000000000000000, %y  = 00000000
	smul	%l7,%l4,%l3		! %l3 = 0000000000000000, %y = 00000000

p0_label_63:
!	Mem[0000000030081408] = 00000000, %l1 = 488fa0405b94589b
	ldsha	[%i2+%o4]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000020800040] = a6ff0596, %l2 = 0000000000001d00
	lduha	[%o1+0x040]%asi,%l2	! %l2 = 000000000000a6ff
!	Mem[0000000010001400] = 32000000, %l6 = 0000000000000000
	lduba	[%i0+%g0]0x80,%l6	! %l6 = 0000000000000032
!	Mem[00000000100c1414] = 00000000, %f18 = 2d000000
	ld	[%i3+0x014],%f18	! %f18 = 00000000
!	Mem[0000000010101400] = f05e1d00, %l0 = 00000000874a009b
	ldswa	[%i4+%g0]0x88,%l0	! %l0 = fffffffff05e1d00
!	Mem[0000000010181410] = 00000000 185dc333, %l4 = 00000000, %l5 = 000000ff
	ldda	[%i6+%o5]0x80,%l4	! %l4 = 0000000000000000 00000000185dc333
!	Mem[0000000030181410] = ffe5a4d0, %f23 = 56860dd4
	lda	[%i6+%o5]0x89,%f23	! %f23 = ffe5a4d0
!	Mem[0000000010101410] = 0000b406, %l7 = 0e1fa963e60f9592
	ldsha	[%i4+%o5]0x88,%l7	! %l7 = ffffffffffffb406
!	Mem[00000000100c1400] = d3320453, %l6 = 0000000000000032
	ldsba	[%i3+%g0]0x88,%l6	! %l6 = 0000000000000053
!	Starting 10 instruction Store Burst
!	Mem[0000000010101430] = 000000ff, %l0 = fffffffff05e1d00, %asi = 80
	swapa	[%i4+0x030]%asi,%l0	! %l0 = 00000000000000ff

p0_label_64:
!	%l2 = 000000000000a6ff, Mem[0000000010141408] = cc72256218e4fb15
	stxa	%l2,[%i5+%o4]0x80	! Mem[0000000010141408] = 000000000000a6ff
!	%l1 = 0000000000000000, Mem[0000000030041410] = 835706b4
	stha	%l1,[%i1+%o5]0x89	! Mem[0000000030041410] = 83570000
!	Mem[0000000021800081] = abc3889d, %l5 = 00000000185dc333
	ldstuba	[%o3+0x081]%asi,%l5	! %l5 = 000000c3000000ff
!	Mem[0000000010081400] = 530432d3, %l2 = 000000000000a6ff
	swapa	[%i2+%g0]0x88,%l2	! %l2 = 00000000530432d3
!	%l2 = 00000000530432d3, Mem[0000000030101400] = 9b58945b
	stha	%l2,[%i4+%g0]0x81	! Mem[0000000030101400] = 32d3945b
!	%l0 = 00000000000000ff, Mem[0000000010001400] = 00000032
	stwa	%l0,[%i0+%g0]0x88	! Mem[0000000010001400] = 000000ff
!	%l6 = 00000053, %l7 = ffffb406, Mem[0000000010081400] = 0000a6ff 185dc333
	stda	%l6,[%i2+%g0]0x88	! Mem[0000000010081400] = 00000053 ffffb406
!	%l7 = ffffffffffffb406, Mem[0000000010141410] = aa2effe5
	stha	%l7,[%i5+%o5]0x80	! Mem[0000000010141410] = b406ffe5
!	%l6 = 00000053, %l7 = ffffb406, Mem[0000000030141400] = ff87a054 c3fa212d
	stda	%l6,[%i5+%g0]0x81	! Mem[0000000030141400] = 00000053 ffffb406
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = 00000000, %f11 = 42208d62
	lda	[%i2+%g0]0x89,%f11	! %f11 = 00000000

p0_label_65:
!	Mem[0000000010041428] = 15fbe418, %l5 = 00000000000000c3
	lduba	[%i1+0x02b]%asi,%l5	! %l5 = 0000000000000018
!	Mem[00000000100c1400] = 530432d3 b390cdbb, %l6 = 00000053, %l7 = ffffb406
	ldda	[%i3+%g0]0x80,%l6	! %l6 = 00000000530432d3 00000000b390cdbb
!	Mem[0000000030181408] = 5a000000, %l5 = 0000000000000018
	ldswa	[%i6+%o4]0x81,%l5	! %l5 = 000000005a000000
!	Mem[0000000010141410] = 745d4957 e5ff06b4, %l2 = 530432d3, %l3 = 00000000
	ldda	[%i5+%o5]0x88,%l2	! %l2 = 00000000e5ff06b4 00000000745d4957
!	Mem[00000000100c1410] = 0000000b, %l7 = 00000000b390cdbb
	lduha	[%i3+%o5]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000030101410] = 06650118, %l7 = 0000000000000000
	ldsba	[%i4+%o5]0x81,%l7	! %l7 = 0000000000000006
!	Mem[0000000030081408] = 0b00000000000000, %l2 = 00000000e5ff06b4
	ldxa	[%i2+%o4]0x89,%l2	! %l2 = 0b00000000000000
!	Mem[000000001004140c] = db286cf7, %f5  = bbcd90ff
	ld	[%i1+0x00c],%f5 	! %f5 = db286cf7
!	Mem[0000000010001408] = 32d3c33369305030, %f16 = ffe5a4d0 00000000
	ldda	[%i0+0x008]%asi,%f16	! %f16 = 32d3c333 69305030
!	Starting 10 instruction Store Burst
!	%l0 = 000000ff, %l1 = 00000000, Mem[0000000010041438] = c0c732b3 744e009d
	std	%l0,[%i1+0x038]		! Mem[0000000010041438] = 000000ff 00000000

p0_label_66:
!	Mem[0000000010081410] = 9b7db159, %l0 = 00000000000000ff
	ldstuba	[%i2+0x010]%asi,%l0	! %l0 = 0000009b000000ff
!	%f18 = 00000000 beff5d9a, Mem[0000000010001408] = 32d3c333 69305030
	stda	%f18,[%i0+%o4]0x80	! Mem[0000000010001408] = 00000000 beff5d9a
!	Mem[0000000030001410] = b87b239d, %l5 = 000000005a000000
	ldstuba	[%i0+%o5]0x89,%l5	! %l5 = 0000009d000000ff
!	Mem[0000000010101408] = 745ba25e, %l2 = 0b00000000000000
	ldstuba	[%i4+%o4]0x88,%l2	! %l2 = 0000005e000000ff
!	%f31 = 1d480000, Mem[0000000010101400] = 001d5ef0
	sta	%f31,[%i4+0x000]%asi	! Mem[0000000010101400] = 1d480000
!	%f27 = d6bc032f, Mem[0000000030081410] = 00002800
	sta	%f27,[%i2+%o5]0x89	! Mem[0000000030081410] = d6bc032f
!	%f6  = 0dbd8189 8aa63b93, Mem[0000000010181418] = 1aba4d75 835706b4
	stda	%f6 ,[%i6+0x018]%asi	! Mem[0000000010181418] = 0dbd8189 8aa63b93
!	Mem[0000000010181400] = 69305030, %l7 = 0000000000000006
	ldstuba	[%i6+%g0]0x88,%l7	! %l7 = 00000030000000ff
!	%f28 = cc722562, Mem[0000000010141400] = 00000000
	sta	%f28,[%i5+%g0]0x80	! Mem[0000000010141400] = cc722562
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = 00000000, %l3 = 00000000745d4957
	ldsba	[%i6+%o5]0x88,%l3	! %l3 = 0000000000000000

p0_label_67:
!	%l2 = 0000005e, %l3 = 00000000, Mem[0000000010041408] = d8785725 db286cf7
	stda	%l2,[%i1+%o4]0x80	! Mem[0000000010041408] = 0000005e 00000000
!	Mem[0000000030041410] = 00005783, %l4 = 0000000000000000
	ldswa	[%i1+%o5]0x81,%l4	! %l4 = 0000000000005783
!	Mem[0000000010041410] = 00000000, %l6 = 00000000530432d3
	lduha	[%i1+%o5]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000030041410] = 00005783, %l7 = 0000000000000030
	ldsba	[%i1+%o5]0x81,%l7	! %l7 = 0000000000000000
!	%l4 = 0000000000005783, %l3 = 0000000000000000, %y  = 00000000
	sdiv	%l4,%l3,%l0		! Div by zero, %l0 = 00000000000000eb
	mov	%l0,%y			! %y = 000000c3
!	Mem[0000000030141400] = 00000053, %l1 = 0000000000000000
	ldswa	[%i5+%g0]0x81,%l1	! %l1 = 0000000000000053
!	Mem[0000000010101408] = 745ba2ff, %l6 = 0000000000000000
	lduwa	[%i4+%o4]0x88,%l6	! %l6 = 00000000745ba2ff
!	%f28 = cc722562, %f25 = 9c3bafe9, %f29 = 000200ff
	fadds	%f28,%f25,%f29		! %f29 = cc722562
!	Mem[0000000030081408] = 00000000, %l5 = 000000000000009d
	ldsba	[%i2+%o4]0x81,%l5	! %l5 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l2 = 000000000000005e, Mem[0000000030081410] = 2f03bcd6
	stwa	%l2,[%i2+%o5]0x81	! Mem[0000000030081410] = 0000005e

p0_label_68:
!	%f28 = cc722562, Mem[0000000010101408] = ffa25b74
	st	%f28,[%i4+%o4]		! Mem[0000000010101408] = cc722562
!	%f6  = 0dbd8189 8aa63b93, Mem[0000000030081400] = 00000000 e86a4aef
	stda	%f6 ,[%i2+%g0]0x81	! Mem[0000000030081400] = 0dbd8189 8aa63b93
!	Mem[0000000021800080] = abff889d, %l5 = 0000000000000000
	ldstub	[%o3+0x080],%l5		! %l5 = 000000ab000000ff
!	Mem[0000000021800180] = 61114d6f, %l5 = 00000000000000ab
	ldstuba	[%o3+0x180]%asi,%l5	! %l5 = 00000061000000ff
!	Mem[0000000030081400] = 0dbd8189, %l4 = 0000000000005783
	swapa	[%i2+%g0]0x81,%l4	! %l4 = 000000000dbd8189
!	%l7 = 0000000000000000, Mem[0000000010141410] = b406ffe5
	stba	%l7,[%i5+%o5]0x80	! Mem[0000000010141410] = 0006ffe5
!	Mem[0000000010081408] = ffbef48f, %l0 = 00000000000000c3
	swapa	[%i2+%o4]0x80,%l0	! %l0 = 00000000ffbef48f
!	%l5 = 0000000000000061, Mem[0000000010181412] = 00000000, %asi = 80
	stha	%l5,[%i6+0x012]%asi	! Mem[0000000010181410] = 00000061
!	Mem[0000000010181410] = 00000061, %l6 = 00000000745ba2ff
	ldstuba	[%i6+%o5]0x80,%l6	! %l6 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	%f29 = cc722562, %f4  = 481d6922
	fcmpes	%fcc0,%f29,%f4 		! %fcc0 = 1

p0_label_69:
!	Mem[0000000010181410] = ff000061185dc333, %l0 = 00000000ffbef48f
	ldxa	[%i6+0x010]%asi,%l0	! %l0 = ff000061185dc333
!	Mem[00000000100c1408] = 000000000000002d, %l1 = 0000000000000053
	ldxa	[%i3+%o4]0x80,%l1	! %l1 = 000000000000002d
!	Mem[0000000010101400] = 0000481d, %f18 = 00000000
	lda	[%i4+%g0]0x88,%f18	! %f18 = 0000481d
!	Mem[0000000010101410] = 06b40000, %l1 = 000000000000002d
	lduwa	[%i4+%o5]0x80,%l1	! %l1 = 0000000006b40000
!	Mem[0000000030181408] = 2ab73dc90000005a, %f26 = b52df303 d6bc032f
	ldda	[%i6+%o4]0x89,%f26	! %f26 = 2ab73dc9 0000005a
!	Mem[00000000211c0000] = a0ff4340, %l2 = 000000000000005e
	ldub	[%o2+0x001],%l2		! %l2 = 00000000000000ff
!	Mem[00000000300c1410] = 000000ff, %l0 = ff000061185dc333
	lduba	[%i3+%o5]0x81,%l0	! %l0 = 0000000000000000
!	Mem[00000000300c1408] = d3320453, %f27 = 0000005a
	lda	[%i3+%o4]0x81,%f27	! %f27 = d3320453
!	Mem[00000000100c1400] = d3320453, %l3 = 0000000000000000
	ldsba	[%i3+%g0]0x88,%l3	! %l3 = 0000000000000053
!	Starting 10 instruction Store Burst
!	Mem[0000000030081408] = 00000000, %l1 = 0000000006b40000
	ldstuba	[%i2+%o4]0x89,%l1	! %l1 = 00000000000000ff

p0_label_70:
!	%l1 = 0000000000000000, Mem[0000000010141410] = 745d4957e5ff0600
	stxa	%l1,[%i5+%o5]0x88	! Mem[0000000010141410] = 0000000000000000
!	%f6  = 0dbd8189 8aa63b93, %l1 = 0000000000000000
!	Mem[0000000030101408] = 1930e6849c3bafe9
	add	%i4,0x008,%g1
	stda	%f6,[%g1+%l1]ASI_PST16_S ! Mem[0000000030101408] = 1930e6849c3bafe9
!	Mem[00000000100c1400] = d3320453, %l7 = 0000000000000000
	swapa	[%i3+%g0]0x88,%l7	! %l7 = 00000000d3320453
!	%l7 = 00000000d3320453, Mem[0000000010141400] = cc722562835706b4
	stxa	%l7,[%i5+%g0]0x80	! Mem[0000000010141400] = 00000000d3320453
!	Mem[0000000030101400] = 32d3945b, %l3 = 0000000000000053
	swapa	[%i4+%g0]0x81,%l3	! %l3 = 0000000032d3945b
!	Mem[00000000300c1400] = 0e056cf2, %l4 = 000000000dbd8189
	swapa	[%i3+%g0]0x89,%l4	! %l4 = 000000000e056cf2
!	Mem[0000000010001438] = 9b7db1590000005e, %l5 = 0000000000000061, %l5 = 0000000000000061
	add	%i0,0x38,%g1
	casxa	[%g1]0x80,%l5,%l5	! %l5 = 9b7db1590000005e
!	%f23 = ffe5a4d0, Mem[000000001004141c] = f99a2ba4
	sta	%f23,[%i1+0x01c]%asi	! Mem[000000001004141c] = ffe5a4d0
!	Mem[0000000010141404] = d3320453, %l0 = 00000000, %l7 = d3320453
	add	%i5,0x04,%g1
	casa	[%g1]0x80,%l0,%l7	! %l7 = 00000000d3320453
!	Starting 10 instruction Load Burst
!	Mem[0000000010081424] = 000000d8, %f21 = 6efd6fdd
	ld	[%i2+0x024],%f21	! %f21 = 000000d8

p0_label_71:
!	Mem[0000000010141410] = 0000000000000000, %l3 = 0000000032d3945b
	ldx	[%i5+%o5],%l3		! %l3 = 0000000000000000
!	Mem[0000000030001400] = ff0000ff 73b942de, %l2 = 000000ff, %l3 = 00000000
	ldda	[%i0+%g0]0x81,%l2	! %l2 = 00000000ff0000ff 0000000073b942de
!	Mem[0000000010141400] = 00000000, %l1 = 0000000000000000
	ldswa	[%i5+%g0]0x88,%l1	! %l1 = 0000000000000000
!	Mem[000000001004143c] = 00000000, %l7 = 00000000d3320453
	ldsw	[%i1+0x03c],%l7		! %l7 = 0000000000000000
!	Mem[0000000030141410] = ffd5c92d, %l2 = 00000000ff0000ff
	ldswa	[%i5+%o5]0x81,%l2	! %l2 = ffffffffffd5c92d
!	Mem[0000000010101408] = cc722562, %l6 = 0000000000000000
	ldswa	[%i4+%o4]0x80,%l6	! %l6 = ffffffffcc722562
!	Mem[0000000010101400] = 0000481d, %l3 = 0000000073b942de
	ldsha	[%i4+%g0]0x88,%l3	! %l3 = 000000000000481d
!	Mem[0000000030041408] = ff000000, %l7 = 0000000000000000
	ldsba	[%i1+%o4]0x81,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000021800100] = 9f729500, %l3 = 000000000000481d
	ldsb	[%o3+0x101],%l3		! %l3 = 0000000000000072
!	Starting 10 instruction Store Burst
!	%l3 = 0000000000000072, Mem[0000000020800040] = a6ff0596
	sth	%l3,[%o1+0x040]		! Mem[0000000020800040] = 00720596

p0_label_72:
!	%l6 = cc722562, %l7 = ffffffff, Mem[0000000010081408] = c3000000 0000481d
	stda	%l6,[%i2+%o4]0x88	! Mem[0000000010081408] = cc722562 ffffffff
!	%l2 = ffd5c92d, %l3 = 00000072, Mem[0000000030001410] = ff237bb8 6efd6fdd
	stda	%l2,[%i0+%o5]0x81	! Mem[0000000030001410] = ffd5c92d 00000072
!	Mem[0000000030041410] = 00005783, %l1 = 0000000000000000
	swapa	[%i1+%o5]0x81,%l1	! %l1 = 0000000000005783
!	%f24 = 8c35d704 9c3bafe9, Mem[00000000100c1420] = bbcd90b3 2287a054
	std	%f24,[%i3+0x020]	! Mem[00000000100c1420] = 8c35d704 9c3bafe9
!	Mem[00000000100c1408] = 00000000, %l2 = ffffffffffd5c92d
	ldstuba	[%i3+%o4]0x80,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010101400] = 1d480000, %l3 = 0000000000000072
	ldstuba	[%i4+%g0]0x80,%l3	! %l3 = 0000001d000000ff
!	%l0 = 00000000, %l1 = 00005783, Mem[0000000010141400] = 00000000 d3320453
	stda	%l0,[%i5+%g0]0x80	! Mem[0000000010141400] = 00000000 00005783
!	Mem[0000000030081410] = 5e000000, %l4 = 000000000e056cf2
	ldstuba	[%i2+%o5]0x89,%l4	! %l4 = 00000000000000ff
!	%l4 = 0000000000000000, Mem[00000000100c1410] = 0b000000
	stwa	%l4,[%i3+%o5]0x88	! Mem[00000000100c1410] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = d3320453, %l1 = 0000000000005783
	ldsha	[%i3+%o4]0x81,%l1	! %l1 = ffffffffffffd332

p0_label_73:
!	Mem[00000000100c1434] = 4164d38a, %l6 = ffffffffcc722562
	ldsha	[%i3+0x036]%asi,%l6	! %l6 = ffffffffffffd38a
!	Mem[0000000030081410] = 5e0000ff, %l4 = 0000000000000000
	swapa	[%i2+%o5]0x89,%l4	! %l4 = 000000005e0000ff
!	Mem[0000000030101410] = 18016506, %l4 = 000000005e0000ff
	lduba	[%i4+%o5]0x89,%l4	! %l4 = 0000000000000006
!	Mem[0000000010081410] = 2287a05459b17dff, %f6  = 0dbd8189 8aa63b93
	ldda	[%i2+%o5]0x88,%f6 	! %f6  = 2287a054 59b17dff
!	Mem[0000000030141408] = ff002042, %l3 = 000000000000001d
	ldsba	[%i5+%o4]0x81,%l3	! %l3 = ffffffffffffffff
!	%l1 = ffffffffffffd332, immd = 0000000000000017, %l7 = ffffffffffffffff
	udivx	%l1,0x017,%l7		! %l7 = 0b21642c8590b023
!	%f6  = 2287a054, %f6  = 2287a054, %f31 = 1d480000
	fmuls	%f6 ,%f6 ,%f31		! %f31 = 058fb4fa
!	Mem[00000000201c0000] = ffffe0d4, %l3 = ffffffffffffffff
	lduh	[%o0+%g0],%l3		! %l3 = 000000000000ffff
!	Mem[0000000021800040] = 000275ef, %l1 = ffffffffffffd332
	ldsba	[%o3+0x040]%asi,%l1	! %l1 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f2  = 1930e684 9c3bafe9, %f20 = 65ff2eaa
	fdtoi	%f2 ,%f20		! %f20 = 00000000

p0_label_74:
!	%l0 = 0000000000000000, Mem[0000000030081408] = ff000000
	stba	%l0,[%i2+%o4]0x81	! Mem[0000000030081408] = 00000000
!	%f22 = 5ea25b74, Mem[0000000030081400] = 00005783
	sta	%f22,[%i2+%g0]0x81	! Mem[0000000030081400] = 5ea25b74
!	%l0 = 0000000000000000, Mem[0000000030181410] = d0a4e5ff
	stwa	%l0,[%i6+%o5]0x81	! Mem[0000000030181410] = 00000000
!	Mem[0000000010101438] = a516a8d8, %l7 = 0b21642c8590b023
	swap	[%i4+0x038],%l7		! %l7 = 00000000a516a8d8
!	%l5 = 9b7db1590000005e, Mem[00000000100c1410] = 0000000000000000
	stxa	%l5,[%i3+%o5]0x88	! Mem[00000000100c1410] = 9b7db1590000005e
!	Mem[0000000010181400] = 693050ff, %l4 = 0000000000000006
	swapa	[%i6+%g0]0x88,%l4	! %l4 = 00000000693050ff
!	Mem[0000000030001408] = 00000053, %l0 = 0000000000000000
	swapa	[%i0+%o4]0x81,%l0	! %l0 = 0000000000000053
!	%l3 = 000000000000ffff, Mem[00000000211c0001] = a0ff4340
	stb	%l3,[%o2+0x001]		! Mem[00000000211c0000] = a0ff4340
!	Mem[0000000030041400] = 00000000, %l2 = 0000000000000000
	ldstuba	[%i1+%g0]0x81,%l2	! %l2 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = 00000000, %l2 = 0000000000000000
	lduba	[%i3+%g0]0x80,%l2	! %l2 = 0000000000000000

p0_label_75:
!	Mem[0000000010081408] = cc722562, %l7 = 00000000a516a8d8
	lduwa	[%i2+%o4]0x88,%l7	! %l7 = 00000000cc722562
!	Mem[00000000100c1410] = 5e000000, %l0 = 0000000000000053
	ldsha	[%i3+%o5]0x80,%l0	! %l0 = 0000000000005e00
!	Mem[0000000010101400] = 000048ff, %l3 = 000000000000ffff
	lduha	[%i4+%g0]0x88,%l3	! %l3 = 00000000000048ff
!	Mem[0000000030181400] = 5ea25b74, %l6 = ffffffffffffd38a
	lduwa	[%i6+%g0]0x81,%l6	! %l6 = 000000005ea25b74
!	Mem[00000000211c0000] = a0ff4340, %l2 = 0000000000000000
	lduha	[%o2+0x000]%asi,%l2	! %l2 = 000000000000a0ff
!	Mem[0000000010101400] = ff480000, %f30 = f7bef48f
	lda	[%i4+%g0]0x80,%f30	! %f30 = ff480000
!	Mem[00000000201c0000] = ffffe0d4, %l4 = 00000000693050ff
	ldub	[%o0+%g0],%l4		! %l4 = 00000000000000ff
!	Mem[0000000030001408] = 00000000, %l3 = 00000000000048ff
	ldsha	[%i0+%o4]0x81,%l3	! %l3 = 0000000000000000
!	Mem[00000000100c1410] = 5e000000, %l5 = 9b7db1590000005e
	lduha	[%i3+%o5]0x80,%l5	! %l5 = 0000000000005e00
!	Starting 10 instruction Store Burst
!	Mem[000000001018140c] = 0000ffdb, %l4 = 00000000000000ff, %asi = 80
	swapa	[%i6+0x00c]%asi,%l4	! %l4 = 000000000000ffdb

p0_label_76:
!	%l2 = 0000a0ff, %l3 = 00000000, Mem[00000000100c1410] = 5e000000 59b17d9b
	stda	%l2,[%i3+0x010]%asi	! Mem[00000000100c1410] = 0000a0ff 00000000
!	%l7 = 00000000cc722562, Mem[0000000010101410] = 06b40000, %asi = 80
	stwa	%l7,[%i4+0x010]%asi	! Mem[0000000010101410] = cc722562
!	%f8  = 53a62c32, Mem[0000000030181410] = 00000000
	sta	%f8 ,[%i6+%o5]0x81	! Mem[0000000030181410] = 53a62c32
!	Code Fragment 4
p0_fragment_8:
!	%l0 = 0000000000005e00
	setx	0x4960422fb4019055,%g7,%l0 ! %l0 = 4960422fb4019055
!	%l1 = 0000000000000000
	setx	0xf63588783b65d057,%g7,%l1 ! %l1 = f63588783b65d057
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 4960422fb4019055
	setx	0xf440029863721566,%g7,%l0 ! %l0 = f440029863721566
!	%l1 = f63588783b65d057
	setx	0x0ce979e7c09920b4,%g7,%l1 ! %l1 = 0ce979e7c09920b4
!	Mem[0000000030001410] = 2dc9d5ff, %l5 = 0000000000005e00
	ldstuba	[%i0+%o5]0x89,%l5	! %l5 = 000000ff000000ff
!	%l6 = 000000005ea25b74, imm = 00000000000006b3, %l1 = 0ce979e7c09920b4
	and	%l6,0x6b3,%l1		! %l1 = 0000000000000230
!	%l3 = 0000000000000000, Mem[0000000030081408] = 00000000
	stwa	%l3,[%i2+%o4]0x81	! Mem[0000000030081408] = 00000000
!	%l0 = 63721566, %l1 = 00000230, Mem[0000000030141408] = 422000ff bbcd90b3
	stda	%l0,[%i5+%o4]0x89	! Mem[0000000030141408] = 63721566 00000230
!	%l1 = 0000000000000230, Mem[0000000030181400] = 745ba25e
	stha	%l1,[%i6+%g0]0x89	! Mem[0000000030181400] = 745b0230
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = 00000000, %l0 = f440029863721566
	lduwa	[%i1+%o5]0x89,%l0	! %l0 = 0000000000000000

p0_label_77:
!	Mem[0000000010141430] = 4b9a26a41efcd590, %l0 = 0000000000000000
	ldx	[%i5+0x030],%l0		! %l0 = 4b9a26a41efcd590
	membar	#Sync			! Added by membar checker (8)
!	Mem[0000000010141400] = 00000000 00005783 00000000 0000a6ff
!	Mem[0000000010141410] = 00000000 00000000 78c55430 7eeeb05c
!	Mem[0000000010141420] = 0dbd8189 8aa63b93 8ddb922c ed3c7995
!	Mem[0000000010141430] = 4b9a26a4 1efcd590 12ba6ace d66d7210
	ldda	[%i5]ASI_BLK_P,%f0	! Block Load from 0000000010141400
!	Mem[0000000010081408] = cc722562, %f21 = 000000d8
	lda	[%i2+%o4]0x88,%f21	! %f21 = cc722562
!	Mem[0000000010081420] = 185dc333000000d8, %f20 = 00000000 cc722562
	ldd	[%i2+0x020],%f20	! %f20 = 185dc333 000000d8
!	Mem[0000000010101410] = cc722562 6a090251, %l4 = 0000ffdb, %l5 = 000000ff
	ldd	[%i4+%o5],%l4		! %l4 = 00000000cc722562 000000006a090251
!	Mem[00000000201c0000] = ffffe0d4, %l0 = 4b9a26a41efcd590
	lduh	[%o0+%g0],%l0		! %l0 = 000000000000ffff
!	Mem[0000000010141400] = 8357000000000000, %l6 = 000000005ea25b74
	ldxa	[%i5+%g0]0x88,%l6	! %l6 = 8357000000000000
!	Mem[00000000300c1410] = ff000000, %l5 = 000000006a090251
	ldswa	[%i3+%o5]0x89,%l5	! %l5 = ffffffffff000000
!	Mem[00000000201c0000] = ffffe0d4, %l6 = 8357000000000000
	ldsh	[%o0+%g0],%l6		! %l6 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l6 = ffffffffffffffff, Mem[00000000100c1408] = ff000000
	stwa	%l6,[%i3+%o4]0x80	! Mem[00000000100c1408] = ffffffff

p0_label_78:
!	Mem[00000000100c1420] = 8c35d704, %l3 = 00000000, %l4 = cc722562
	add	%i3,0x20,%g1
	casa	[%g1]0x80,%l3,%l4	! %l4 = 000000008c35d704
!	%l7 = 00000000cc722562, Mem[00000000300c1408] = 530432d3
	stba	%l7,[%i3+%o4]0x89	! Mem[00000000300c1408] = 53043262
!	Mem[0000000030141410] = ffd5c92d, %l1 = 0000000000000230
	swapa	[%i5+%o5]0x81,%l1	! %l1 = 00000000ffd5c92d
	membar	#Sync			! Added by membar checker (9)
!	%l5 = ffffffffff000000, Mem[000000001014140d] = 0000a6ff
	stb	%l5,[%i5+0x00d]		! Mem[000000001014140c] = 0000a6ff
!	%f0  = 00000000 00005783 00000000 0000a6ff
!	%f4  = 00000000 00000000 78c55430 7eeeb05c
!	%f8  = 0dbd8189 8aa63b93 8ddb922c ed3c7995
!	%f12 = 4b9a26a4 1efcd590 12ba6ace d66d7210
	stda	%f0,[%i5]ASI_BLK_SL	! Block Store to 0000000030141400
!	%f0  = 00000000 00005783 00000000 0000a6ff
!	%f4  = 00000000 00000000 78c55430 7eeeb05c
!	%f8  = 0dbd8189 8aa63b93 8ddb922c ed3c7995
!	%f12 = 4b9a26a4 1efcd590 12ba6ace d66d7210
	stda	%f0,[%i3]ASI_BLK_AIUPL	! Block Store to 00000000100c1400
!	%l3 = 0000000000000000, Mem[0000000030181410] = 53a62c32
	stha	%l3,[%i6+%o5]0x81	! Mem[0000000030181410] = 00002c32
!	%l1 = 00000000ffd5c92d, Mem[000000001014143c] = d66d7210
	stb	%l1,[%i5+0x03c]		! Mem[000000001014143c] = 2d6d7210
!	Mem[0000000010041410] = 00000000, %l6 = ffffffffffffffff
	ldstuba	[%i1+%o5]0x88,%l6	! %l6 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = cc722562, %f23 = ffe5a4d0
	lda	[%i4+%o5]0x80,%f23	! %f23 = cc722562

p0_label_79:
	membar	#Sync			! Added by membar checker (10)
!	Mem[0000000030141400] = 83570000 00000000 ffa60000 00000000
!	Mem[0000000030141410] = 00000000 00000000 5cb0ee7e 3054c578
!	Mem[0000000030141420] = 933ba68a 8981bd0d 95793ced 2c92db8d
!	Mem[0000000030141430] = 90d5fc1e a4269a4b 10726dd6 ce6aba12
	ldda	[%i5]ASI_BLK_AIUS,%f0	! Block Load from 0000000030141400
!	Mem[0000000010041400] = 2d000000, %f16 = 32d3c333
	lda	[%i1+%g0]0x80,%f16	! %f16 = 2d000000
!	Mem[0000000030001408] = 00000000, %f29 = cc722562
	lda	[%i0+%o4]0x81,%f29	! %f29 = 00000000
!	Mem[0000000010141420] = 0dbd8189 8aa63b93, %l6 = 00000000, %l7 = cc722562
	ldda	[%i5+0x020]%asi,%l6	! %l6 = 000000000dbd8189 000000008aa63b93
!	Mem[0000000030141400] = 83570000, %l1 = 00000000ffd5c92d
	ldsba	[%i5+%g0]0x81,%l1	! %l1 = ffffffffffffff83
!	Mem[00000000300c1410] = 000000ff, %l4 = 000000008c35d704
	lduha	[%i3+%o5]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000010081428] = 53a62c32000000ff, %f30 = ff480000 058fb4fa
	ldd	[%i2+0x028],%f30	! %f30 = 53a62c32 000000ff
!	%l4 = 0000000000000000, %l6 = 000000000dbd8189, %l0 = 000000000000ffff
	orn	%l4,%l6,%l0		! %l0 = fffffffff2427e76
!	Mem[0000000020800040] = 00720596, %l2 = 000000000000a0ff
	lduh	[%o1+0x040],%l2		! %l2 = 0000000000000072
!	Starting 10 instruction Store Burst
!	Mem[000000001000141c] = d0a4e5ff, %l5 = ffffffffff000000, %asi = 80
	swapa	[%i0+0x01c]%asi,%l5	! %l5 = 00000000d0a4e5ff

p0_label_80:
!	%l2 = 0000000000000072, Mem[0000000010081438] = 6d72e30b, %asi = 80
	stwa	%l2,[%i2+0x038]%asi	! Mem[0000000010081438] = 00000072
!	%f26 = 2ab73dc9 d3320453, %f26 = 2ab73dc9
	fdtos	%f26,%f26		! %f26 = 00000000
!	%l4 = 0000000000000000, Mem[0000000010081426] = 000000d8, %asi = 80
	stha	%l4,[%i2+0x026]%asi	! Mem[0000000010081424] = 00000000
	membar	#Sync			! Added by membar checker (11)
!	%l6 = 0dbd8189, %l7 = 8aa63b93, Mem[0000000030141400] = 83570000 00000000
	stda	%l6,[%i5+%g0]0x81	! Mem[0000000030141400] = 0dbd8189 8aa63b93
!	%f20 = 185dc333 000000d8, Mem[00000000100c1400] = 00005783 00000000
	stda	%f20,[%i3+%g0]0x88	! Mem[00000000100c1400] = 185dc333 000000d8
!	%l5 = 00000000d0a4e5ff, Mem[00000000100c1400] = d800000033c35d18
	stxa	%l5,[%i3+%g0]0x80	! Mem[00000000100c1400] = 00000000d0a4e5ff
!	%l4 = 0000000000000000, Mem[0000000010101400] = ff480000
	stha	%l4,[%i4+%g0]0x80	! Mem[0000000010101400] = 00000000
!	%f24 = 8c35d704 9c3bafe9, %l0 = fffffffff2427e76
!	Mem[0000000030181428] = 8a7b2b9583e56b63
	add	%i6,0x028,%g1
	stda	%f24,[%g1+%l0]ASI_PST16_S ! Mem[0000000030181428] = 8a7bd7049c3b6b63
!	%f16 = 2d000000 69305030 0000481d beff5d9a
!	%f20 = 185dc333 000000d8 5ea25b74 cc722562
!	%f24 = 8c35d704 9c3bafe9 00000000 d3320453
!	%f28 = cc722562 00000000 53a62c32 000000ff
	stda	%f16,[%i1]ASI_BLK_AIUSL	! Block Store to 0000000030041400
!	Starting 10 instruction Load Burst
!	Mem[0000000030101410] = 06650118, %l1 = ffffffffffffff83
	ldsha	[%i4+%o5]0x81,%l1	! %l1 = 0000000000000665

p0_label_81:
	membar	#Sync			! Added by membar checker (12)
!	Mem[0000000010041408] = 0000005e, %f10 = 95793ced
	lda	[%i1+%o4]0x80,%f10	! %f10 = 0000005e
!	%l3 = 0000000000000000, Mem[0000000030181400] = 30025b74
	stha	%l3,[%i6+%g0]0x81	! Mem[0000000030181400] = 00005b74
!	Mem[0000000030081410] = 00000000, %l5 = 00000000d0a4e5ff
	lduha	[%i2+%o5]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000030141408] = ffa60000, %l6 = 000000000dbd8189
	ldsha	[%i5+%o4]0x81,%l6	! %l6 = ffffffffffffffa6
!	Mem[0000000020800000] = ffff8b5d, %l1 = 0000000000000665
	lduba	[%o1+0x000]%asi,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010041400] = 0000002d, %l4 = 0000000000000000
	ldswa	[%i1+%g0]0x88,%l4	! %l4 = 000000000000002d
!	Mem[0000000010081438] = 0000007294c2fd7c, %l4 = 000000000000002d
	ldx	[%i2+0x038],%l4		! %l4 = 0000007294c2fd7c
!	Mem[0000000010001400] = 00000000 000000ff, %l4 = 94c2fd7c, %l5 = 00000000
	ldda	[%i0+%g0]0x88,%l4	! %l4 = 00000000000000ff 0000000000000000
!	Mem[0000000030001410] = 72000000 2dc9d5ff, %l0 = f2427e76, %l1 = 000000ff
	ldda	[%i0+%o5]0x89,%l0	! %l0 = 000000002dc9d5ff 0000000072000000
!	Starting 10 instruction Store Burst
!	%l7 = 000000008aa63b93, Mem[0000000010081400] = 5300000006b4ffff
	stxa	%l7,[%i2+%g0]0x80	! Mem[0000000010081400] = 000000008aa63b93

p0_label_82:
!	%l4 = 000000ff, %l5 = 00000000, Mem[0000000030181410] = 322c0000 ffffffff
	stda	%l4,[%i6+%o5]0x89	! Mem[0000000030181410] = 000000ff 00000000
!	Mem[0000000010181400] = 06000000, %l3 = 0000000000000000
	ldstuba	[%i6+%g0]0x80,%l3	! %l3 = 00000006000000ff
!	%l0 = 000000002dc9d5ff, Mem[0000000010041410] = 000000ff000000ff
	stxa	%l0,[%i1+%o5]0x88	! Mem[0000000010041410] = 000000002dc9d5ff
!	%l2 = 0000000000000072, Mem[0000000030141400] = 0dbd81898aa63b93
	stxa	%l2,[%i5+%g0]0x81	! Mem[0000000030141400] = 0000000000000072
!	%l4 = 000000ff, %l5 = 00000000, Mem[0000000010001430] = f76c28db beff5d9a
	std	%l4,[%i0+0x030]		! Mem[0000000010001430] = 000000ff 00000000
!	Mem[0000000030101400] = 53000000, %l4 = 00000000000000ff
	ldstuba	[%i4+%g0]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030181400] = 00005b74, %l1 = 0000000072000000
	ldstuba	[%i6+%g0]0x81,%l1	! %l1 = 00000000000000ff
!	%f16 = 2d000000 69305030 0000481d beff5d9a
!	%f20 = 185dc333 000000d8 5ea25b74 cc722562
!	%f24 = 8c35d704 9c3bafe9 00000000 d3320453
!	%f28 = cc722562 00000000 53a62c32 000000ff
	stda	%f16,[%i5]ASI_BLK_SL	! Block Store to 0000000030141400
!	%l0 = 000000002dc9d5ff, %l0 = 000000002dc9d5ff, %l3  = 0000000000000006
	mulx	%l0,%l0,%l3		! %l3 = 0830945d63505401
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = 62320453, %l1 = 0000000000000000
	lduba	[%i3+%o4]0x81,%l1	! %l1 = 0000000000000062

p0_label_83:
!	Mem[0000000010041400] = 2d000000, %l3 = 0830945d63505401
	ldub	[%i1+0x002],%l3		! %l3 = 0000000000000000
	membar	#Sync			! Added by membar checker (13)
!	Mem[0000000010141404] = 00005783, %l4 = 0000000000000000
	ldswa	[%i5+0x004]%asi,%l4	! %l4 = 0000000000005783
!	Mem[0000000010141410] = 0000000000000000, %f4  = 00000000 00000000
	ldd	[%i5+%o5],%f4 		! %f4  = 00000000 00000000
!	Mem[00000000100c1410] = 0000000000000000, %l1 = 0000000000000062
	ldxa	[%i3+%o5]0x88,%l1	! %l1 = 0000000000000000
!	%l1 = 0000000000000000, imm = fffffffffffff61f, %l5 = 0000000000000000
	orn	%l1,-0x9e1,%l5		! %l5 = 00000000000009e0
!	Mem[0000000010181408] = fffae7c8, %l4 = 0000000000005783
	ldswa	[%i6+%o4]0x80,%l4	! %l4 = fffffffffffae7c8
!	Mem[0000000010181400] = ff000000, %l2 = 0000000000000072
	ldswa	[%i6+%g0]0x80,%l2	! %l2 = ffffffffff000000
!	Mem[0000000010141404] = 00005783, %f14 = 10726dd6
	ld	[%i5+0x004],%f14	! %f14 = 00005783
!	Mem[0000000010081408] = cc722562, %l1 = 0000000000000000
	lduwa	[%i2+%o4]0x88,%l1	! %l1 = 00000000cc722562
!	Starting 10 instruction Store Burst
!	%l0 = 000000002dc9d5ff, Mem[000000001014140e] = 0000a6ff, %asi = 80
	stha	%l0,[%i5+0x00e]%asi	! Mem[000000001014140c] = 0000d5ff

p0_label_84:
!	Mem[0000000030081400] = 745ba25e, %l2 = ffffffffff000000
	swapa	[%i2+%g0]0x89,%l2	! %l2 = 00000000745ba25e
!	%l5 = 00000000000009e0, Mem[0000000030141410] = 000000d8
	stwa	%l5,[%i5+%o5]0x89	! Mem[0000000030141410] = 000009e0
!	%l3 = 0000000000000000, %l3 = 0000000000000000, %l4 = fffffffffffae7c8
	add	%l3,%l3,%l4		! %l4 = 0000000000000000
!	Mem[0000000030041408] = beff5d9a, %l1 = 00000000cc722562
	swapa	[%i1+%o4]0x89,%l1	! %l1 = 00000000beff5d9a
!	%l1 = 00000000beff5d9a, Mem[0000000010141412] = 00000000
	sth	%l1,[%i5+0x012]		! Mem[0000000010141410] = 00005d9a
!	Mem[00000000218000c0] = 089bafd4, %l6 = ffffffffffffffa6
	ldstuba	[%o3+0x0c0]%asi,%l6	! %l6 = 00000008000000ff
!	%f26 = 00000000 d3320453, Mem[00000000300c1400] = 0dbd8189 be1327aa
	stda	%f26,[%i3+%g0]0x89	! Mem[00000000300c1400] = 00000000 d3320453
!	Mem[0000000030101400] = ff000053, %l4 = 0000000000000000
	ldstuba	[%i4+%g0]0x81,%l4	! %l4 = 000000ff000000ff
!	Mem[0000000010141410] = 00005d9a, %l6 = 0000000000000008
	ldstuba	[%i5+%o5]0x80,%l6	! %l6 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = 622572cc, %l4 = 00000000000000ff
	ldsba	[%i4+%o5]0x88,%l4	! %l4 = ffffffffffffffcc

p0_label_85:
!	Mem[0000000030081408] = 00000000, %f7  = 3054c578
	lda	[%i2+%o4]0x89,%f7 	! %f7 = 00000000
!	Mem[0000000010141408] = 00000000, %l5 = 00000000000009e0
	lduba	[%i5+%o4]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000030001400] = ff0000ff 73b942de 00000000 beff5d9a
!	Mem[0000000030001410] = ffd5c92d 00000072 5ea25b74 56860dd4
!	Mem[0000000030001420] = 772efcfd eb35b308 b52df303 d6bc032f
!	Mem[0000000030001430] = 0daaa74c cfa24919 f7bef48f ce4e00a6
	ldda	[%i0]ASI_BLK_S,%f16	! Block Load from 0000000030001400
!	Mem[0000000030181400] = 32000000745b00ff, %l4 = ffffffffffffffcc
	ldxa	[%i6+%g0]0x89,%l4	! %l4 = 32000000745b00ff
!	Mem[0000000030141410] = e0090000, %l1 = 00000000beff5d9a
	ldsba	[%i5+%o5]0x81,%l1	! %l1 = ffffffffffffffe0
!	Mem[0000000010041408] = 0000005e 00000000, %l0 = 2dc9d5ff, %l1 = ffffffe0
	ldda	[%i1+%o4]0x80,%l0	! %l0 = 000000000000005e 0000000000000000
!	Mem[0000000010101408] = cc722562, %l6 = 0000000000000000
	lduwa	[%i4+%o4]0x80,%l6	! %l6 = 00000000cc722562
!	Mem[0000000010141408] = 00000000, %l7 = 000000008aa63b93
	ldswa	[%i5+%o4]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000010041438] = 000000ff, %l7 = 0000000000000000
	ldsh	[%i1+0x03a],%l7		! %l7 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l2 = 00000000745ba25e, Mem[00000000100c1408] = 0000a6ff
	stba	%l2,[%i3+%o4]0x88	! Mem[00000000100c1408] = 0000a65e

p0_label_86:
!	%l1 = 0000000000000000, Mem[0000000010141408] = 00000000
	stba	%l1,[%i5+%o4]0x80	! Mem[0000000010141408] = 00000000
	membar	#Sync			! Added by membar checker (14)
!	%f4  = 00000000 00000000, Mem[0000000030001400] = ff0000ff de42b973
	stda	%f4 ,[%i0+%g0]0x89	! Mem[0000000030001400] = 00000000 00000000
!	Mem[0000000010101410] = cc722562, %l6 = 00000000cc722562
	swapa	[%i4+%o5]0x80,%l6	! %l6 = 00000000cc722562
!	%f10 = 0000005e 2c92db8d, %l5 = 0000000000000000
!	Mem[0000000030001428] = b52df303d6bc032f
	add	%i0,0x028,%g1
	stda	%f10,[%g1+%l5]ASI_PST32_S ! Mem[0000000030001428] = b52df303d6bc032f
!	%l0 = 0000005e, %l1 = 00000000, Mem[00000000100c1400] = 00000000 d0a4e5ff
	stda	%l0,[%i3+%g0]0x80	! Mem[00000000100c1400] = 0000005e 00000000
!	%f12 = 90d5fc1e, Mem[0000000010141400] = 00000000
	sta	%f12,[%i5+%g0]0x80	! Mem[0000000010141400] = 90d5fc1e
!	%l3 = 0000000000000000, Mem[0000000030001408] = 9a5dffbe00000000
	stxa	%l3,[%i0+%o4]0x89	! Mem[0000000030001408] = 0000000000000000
!	%f24 = 772efcfd eb35b308, %l3 = 0000000000000000
!	Mem[0000000030001408] = 0000000000000000
	add	%i0,0x008,%g1
	stda	%f24,[%g1+%l3]ASI_PST32_SL ! Mem[0000000030001408] = 0000000000000000
!	%l0 = 000000000000005e, Mem[00000000218001c0] = 78014628, %asi = 80
	stha	%l0,[%o3+0x1c0]%asi	! Mem[00000000218001c0] = 005e4628
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = ff7db159, %l3 = 0000000000000000
	ldswa	[%i2+%o5]0x80,%l3	! %l3 = ffffffffff7db159

p0_label_87:
!	Mem[00000000201c0000] = ffffe0d4, %l1 = 0000000000000000
	ldsh	[%o0+%g0],%l1		! %l1 = ffffffffffffffff
!	Mem[0000000030081410] = 00000000, %l4 = 32000000745b00ff
	ldsha	[%i2+%o5]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000030001408] = 00000000 00000000, %l2 = 745ba25e, %l3 = ff7db159
	ldda	[%i0+%o4]0x81,%l2	! %l2 = 0000000000000000 0000000000000000
!	Mem[0000000010141404] = 00005783, %l7 = 00000000000000ff
	ldsba	[%i5+0x004]%asi,%l7	! %l7 = 0000000000000000
!	Mem[00000000218001c0] = 005e4628, %l2 = 0000000000000000
	ldub	[%o3+0x1c1],%l2		! %l2 = 000000000000005e
!	Mem[0000000010101400] = 00000000aa2effe5, %l4 = 0000000000000000
	ldxa	[%i4+%g0]0x80,%l4	! %l4 = 00000000aa2effe5
!	Mem[0000000010101410] = cc7225626a090251, %f20 = ffd5c92d 00000072
	ldda	[%i4+%o5]0x80,%f20	! %f20 = cc722562 6a090251
!	Mem[0000000010141410] = ff005d9a 00000000, %l6 = cc722562, %l7 = 00000000
	ldda	[%i5+%o5]0x80,%l6	! %l6 = 00000000ff005d9a 0000000000000000
!	Mem[0000000010181400] = 000000ff, %l6 = 00000000ff005d9a
	ldswa	[%i6+%g0]0x88,%l6	! %l6 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l4 = 00000000aa2effe5, Mem[0000000010101400] = 00000000
	stha	%l4,[%i4+%g0]0x88	! Mem[0000000010101400] = 0000ffe5

p0_label_88:
!	%l0 = 000000000000005e, Mem[0000000010081400] = 00000000
	stha	%l0,[%i2+%g0]0x80	! Mem[0000000010081400] = 005e0000
!	%l0 = 000000000000005e, imm = fffffffffffff592, %l0 = 000000000000005e
	sub	%l0,-0xa6e,%l0		! %l0 = 0000000000000acc
!	%l4 = aa2effe5, %l5 = 00000000, Mem[0000000010101400] = e5ff0000 aa2effe5
	stda	%l4,[%i4+%g0]0x80	! Mem[0000000010101400] = aa2effe5 00000000
!	%f10 = 0000005e 2c92db8d, Mem[0000000010181408] = fffae7c8 000000ff
	stda	%f10,[%i6+%o4]0x80	! Mem[0000000010181408] = 0000005e 2c92db8d
!	%l1 = ffffffffffffffff, Mem[0000000010141400] = 1efcd590
	stwa	%l1,[%i5+%g0]0x88	! Mem[0000000010141400] = ffffffff
!	%l4 = aa2effe5, %l5 = 00000000, Mem[00000000100c1408] = 0000a65e 00000000
	stda	%l4,[%i3+%o4]0x88	! Mem[00000000100c1408] = aa2effe5 00000000
!	Mem[0000000010081418] = 3f8445a6, %l7 = 0000000000000000, %asi = 80
	swapa	[%i2+0x018]%asi,%l7	! %l7 = 000000003f8445a6
!	%l6 = 00000000000000ff, Mem[0000000010001400] = ff000000
	stha	%l6,[%i0+%g0]0x80	! Mem[0000000010001400] = 00ff0000
!	%l3 = 0000000000000000, Mem[0000000030081410] = 00000000
	stba	%l3,[%i2+%o5]0x89	! Mem[0000000030081410] = 00000000
!	Starting 10 instruction Load Burst
!	%l5 = 0000000000000000, Mem[0000000010181400] = ff000000
	stwa	%l5,[%i6+%g0]0x80	! Mem[0000000010181400] = 00000000

p0_label_89:
!	Mem[0000000030181400] = ff005b74 00000032 5a000000 c93db72a
!	Mem[0000000030181410] = ff000000 00000000 469497b9 7c55eadd
!	Mem[0000000030181420] = 6ea696bb 42107eed 8a7bd704 9c3b6b63
!	Mem[0000000030181430] = c0856eb2 32dfe348 82e676b7 1bbb1267
	ldda	[%i6]ASI_BLK_S,%f0	! Block Load from 0000000030181400
!	Mem[00000000100c1400] = 0000005e, %f23 = 56860dd4
	lda	[%i3+0x000]%asi,%f23	! %f23 = 0000005e
!	Mem[0000000030041408] = 622572cc, %l6 = 00000000000000ff
	ldsba	[%i1+%o4]0x81,%l6	! %l6 = 0000000000000062
!	Mem[0000000010081428] = 53a62c32, %l7 = 000000003f8445a6
	ldsb	[%i2+0x02b],%l7		! %l7 = 0000000000000032
!	Code Fragment 3
p0_fragment_9:
!	%l0 = 0000000000000acc
	setx	0xc18490a016781ffb,%g7,%l0 ! %l0 = c18490a016781ffb
!	%l1 = ffffffffffffffff
	setx	0xaa8a342fc71cf602,%g7,%l1 ! %l1 = aa8a342fc71cf602
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = c18490a016781ffb
	setx	0xa391c740790a3049,%g7,%l0 ! %l0 = a391c740790a3049
!	%l1 = aa8a342fc71cf602
	setx	0xdb04b707bc611f4d,%g7,%l1 ! %l1 = db04b707bc611f4d
!	Mem[00000000300c1410] = 000000ff, %l2 = 000000000000005e
	lduba	[%i3+%o5]0x81,%l2	! %l2 = 0000000000000000
!	Mem[000000001008143c] = 94c2fd7c, %l3 = 0000000000000000
	ldsh	[%i2+0x03e],%l3		! %l3 = fffffffffffffd7c
!	Mem[0000000010141410] = 9a5d00ff, %l7 = 0000000000000032
	lduba	[%i5+%o5]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010181410] = ff000061, %l7 = 00000000000000ff
	lduba	[%i6+%o5]0x80,%l7	! %l7 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%f30 = f7bef48f ce4e00a6, Mem[0000000010081408] = 622572cc ffffffff
	std	%f30,[%i2+%o4]	! Mem[0000000010081408] = f7bef48f ce4e00a6

p0_label_90:
!	%f18 = 00000000 beff5d9a, Mem[0000000010041410] = ffd5c92d 00000000
	stda	%f18,[%i1+%o5]0x80	! Mem[0000000010041410] = 00000000 beff5d9a
!	%l4 = 00000000aa2effe5, Mem[0000000030141408] = 0000481dbeff5d9a
	stxa	%l4,[%i5+%o4]0x89	! Mem[0000000030141408] = 00000000aa2effe5
!	%l6 = 0000000000000062, Mem[0000000010181400] = 255778d800000000
	stxa	%l6,[%i6+%g0]0x88	! Mem[0000000010181400] = 0000000000000062
!	Mem[0000000010041410] = 00000000, %l5 = 0000000000000000
	ldstuba	[%i1+%o5]0x88,%l5	! %l5 = 00000000000000ff
!	%f28 = 0daaa74c cfa24919, Mem[0000000010081430] = 00000000 563635da
	std	%f28,[%i2+0x030]	! Mem[0000000010081430] = 0daaa74c cfa24919
!	%l1 = db04b707bc611f4d, Mem[0000000020800040] = 00720596
	sth	%l1,[%o1+0x040]		! Mem[0000000020800040] = 1f4d0596
!	Mem[000000001008140a] = f7bef48f, %l4 = 00000000aa2effe5
	ldstuba	[%i2+0x00a]%asi,%l4	! %l4 = 000000f4000000ff
!	Mem[00000000100c1418] = 5cb0ee7e, %l7 = 000000ff, %l3 = fffffd7c
	add	%i3,0x18,%g1
	casa	[%g1]0x80,%l7,%l3	! %l3 = 000000005cb0ee7e
!	Mem[0000000010041430] = f6f76b8b, %l1 = db04b707bc611f4d
	swap	[%i1+0x030],%l1		! %l1 = 00000000f6f76b8b
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = 62320453, %l1 = 00000000f6f76b8b
	ldsha	[%i3+%o4]0x81,%l1	! %l1 = 0000000000006232

p0_label_91:
!	Mem[0000000030041408] = cc722562, %l1 = 0000000000006232
	lduwa	[%i1+%o4]0x89,%l1	! %l1 = 00000000cc722562
!	Mem[0000000010041434] = 8213c76a, %l2 = 0000000000000000
	lduba	[%i1+0x037]%asi,%l2	! %l2 = 000000000000006a
!	Mem[00000000100c1408] = e5ff2eaa, %l0 = a391c740790a3049
	ldswa	[%i3+%o4]0x80,%l0	! %l0 = ffffffffe5ff2eaa
!	Mem[0000000010181410] = 610000ff, %l2 = 000000000000006a
	lduba	[%i6+%o5]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010081400] = 933ba68a00005e00, %f22 = 5ea25b74 0000005e
	ldda	[%i2+%g0]0x88,%f22	! %f22 = 933ba68a 00005e00
!	Mem[00000000300c1408] = 62320453, %l7 = 00000000000000ff
	ldsha	[%i3+%o4]0x81,%l7	! %l7 = 0000000000006232
!	Mem[0000000030181400] = 745b00ff, %l0 = ffffffffe5ff2eaa
	lduha	[%i6+%g0]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010141410] = 9a5d00ff, %l2 = 00000000000000ff
	lduha	[%i5+%o5]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010181400] = 00000062, %f25 = eb35b308
	lda	[%i6+%g0]0x88,%f25	! %f25 = 00000062
!	Starting 10 instruction Store Burst
!	%l0 = 00000000000000ff, %l7 = 0000000000006232, %l2 = 00000000000000ff
	and	%l0,%l7,%l2		! %l2 = 0000000000000032

p0_label_92:
!	Mem[0000000010001409] = 00000000, %l7 = 0000000000006232
	ldstuba	[%i0+0x009]%asi,%l7	! %l7 = 00000000000000ff
!	%l0 = 00000000000000ff, Mem[00000000211c0000] = a0ff4340, %asi = 80
	stba	%l0,[%o2+0x000]%asi	! Mem[00000000211c0000] = ffff4340
!	%l0 = 000000ff, %l1 = cc722562, Mem[0000000010141408] = 00000000 0000d5ff
	stda	%l0,[%i5+%o4]0x80	! Mem[0000000010141408] = 000000ff cc722562
!	%f8  = 6ea696bb 42107eed, Mem[00000000100c1400] = 0000005e 00000000
	stda	%f8 ,[%i3+%g0]0x80	! Mem[00000000100c1400] = 6ea696bb 42107eed
!	Mem[00000000100c1400] = bb96a66e, %l6 = 0000000000000062
	ldstuba	[%i3+%g0]0x88,%l6	! %l6 = 0000006e000000ff
!	Mem[0000000030141410] = 000009e0, %l3 = 000000005cb0ee7e
	swapa	[%i5+%o5]0x89,%l3	! %l3 = 00000000000009e0
!	Mem[00000000100c1410] = 00000000, %l3 = 00000000000009e0
	swapa	[%i3+%o5]0x88,%l3	! %l3 = 0000000000000000
!	%l0 = 00000000000000ff, Mem[0000000010101410] = cc722562
	stwa	%l0,[%i4+%o5]0x80	! Mem[0000000010101410] = 000000ff
!	%f18 = 00000000 beff5d9a, Mem[0000000010181430] = ff7dfafc 4fbc8c90
	stda	%f18,[%i6+0x030]%asi	! Mem[0000000010181430] = 00000000 beff5d9a
!	Starting 10 instruction Load Burst
!	Mem[00000000100c141c] = 3054c578, %l2 = 0000000000000032
	ldsha	[%i3+0x01c]%asi,%l2	! %l2 = 0000000000003054

p0_label_93:
!	Mem[0000000030181410] = 00000000 000000ff, %l0 = 000000ff, %l1 = cc722562
	ldda	[%i6+%o5]0x89,%l0	! %l0 = 00000000000000ff 0000000000000000
!	Mem[0000000010101408] = cc722562, %l4 = 00000000000000f4
	ldsba	[%i4+%o4]0x80,%l4	! %l4 = ffffffffffffffcc
!	Mem[0000000010041400] = 0000002d, %l4 = ffffffffffffffcc
	lduwa	[%i1+%g0]0x88,%l4	! %l4 = 000000000000002d
!	Mem[00000000100c1400] = ffa696bb, %f17 = 73b942de
	lda	[%i3+%g0]0x80,%f17	! %f17 = ffa696bb
!	Mem[00000000100c1400] = ffa696bb, %l3 = 0000000000000000
	ldsba	[%i3+%g0]0x80,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000030001400] = 00000000, %f8  = 6ea696bb
	lda	[%i0+%g0]0x89,%f8 	! %f8 = 00000000
!	Mem[0000000021800080] = ffff889d, %l5 = 0000000000000000
	lduh	[%o3+0x080],%l5		! %l5 = 000000000000ffff
!	%l6 = 000000000000006e, imm = fffffffffffffd3c, %l5 = 000000000000ffff
	and	%l6,-0x2c4,%l5		! %l5 = 000000000000002c
!	Mem[0000000030041410] = d8000000, %l3 = ffffffffffffffff
	ldswa	[%i1+%o5]0x81,%l3	! %l3 = ffffffffd8000000
!	Starting 10 instruction Store Burst
!	%l5 = 000000000000002c, Mem[0000000030041408] = 622572cc
	stwa	%l5,[%i1+%o4]0x81	! Mem[0000000030041408] = 0000002c

p0_label_94:
!	Mem[0000000010001408] = 0000ff00, %l1 = 0000000000000000
	ldstuba	[%i0+%o4]0x88,%l1	! %l1 = 00000000000000ff
!	%f22 = 933ba68a 00005e00, Mem[00000000300c1410] = ff000000 8c1159c1
	stda	%f22,[%i3+%o5]0x89	! Mem[00000000300c1410] = 933ba68a 00005e00
!	%f30 = f7bef48f, Mem[0000000030041410] = d8000000
	sta	%f30,[%i1+%o5]0x81	! Mem[0000000030041410] = f7bef48f
!	%f10 = 8a7bd704, Mem[0000000010041438] = 000000ff
	sta	%f10,[%i1+0x038]%asi	! Mem[0000000010041438] = 8a7bd704
!	%l7 = 0000000000000000, %l0 = 00000000000000ff, %l4  = 000000000000002d
	mulx	%l7,%l0,%l4		! %l4 = 0000000000000000
!	%f31 = ce4e00a6, Mem[0000000030041410] = 8ff4bef7
	sta	%f31,[%i1+%o5]0x89	! Mem[0000000030041410] = ce4e00a6
!	%f26 = b52df303, Mem[0000000030141408] = aa2effe5
	sta	%f26,[%i5+%o4]0x89	! Mem[0000000030141408] = b52df303
!	%l2 = 00003054, %l3 = d8000000, Mem[0000000030141400] = 69305030 2d000000
	stda	%l2,[%i5+%g0]0x89	! Mem[0000000030141400] = 00003054 d8000000
!	%l7 = 0000000000000000, Mem[0000000010181410] = ff000061
	sth	%l7,[%i6+%o5]		! Mem[0000000010181410] = 00000061
!	Starting 10 instruction Load Burst
!	Mem[0000000030181410] = 00000000 000000ff, %l6 = 0000006e, %l7 = 00000000
	ldda	[%i6+%o5]0x89,%l6	! %l6 = 00000000000000ff 0000000000000000

p0_label_95:
!	Mem[00000000300c1410] = 005e0000, %l5 = 000000000000002c
	lduwa	[%i3+%o5]0x81,%l5	! %l5 = 00000000005e0000
!	Mem[000000001000140c] = beff5d9a, %l6 = 00000000000000ff
	lduw	[%i0+0x00c],%l6		! %l6 = 00000000beff5d9a
!	Mem[0000000010081408] = f7beff8fce4e00a6, %l1 = 0000000000000000
	ldxa	[%i2+%o4]0x80,%l1	! %l1 = f7beff8fce4e00a6
!	Mem[0000000030001400] = 00000000, %f8  = 00000000
	lda	[%i0+%g0]0x81,%f8 	! %f8 = 00000000
!	Mem[0000000010141400] = 83570000ffffffff, %l3 = ffffffffd8000000
	ldxa	[%i5+%g0]0x88,%l3	! %l3 = 83570000ffffffff
!	Code Fragment 4
p0_fragment_10:
!	%l0 = 00000000000000ff
	setx	0xb16e40279e21f0a9,%g7,%l0 ! %l0 = b16e40279e21f0a9
!	%l1 = f7beff8fce4e00a6
	setx	0xed015c7fedbf0be0,%g7,%l1 ! %l1 = ed015c7fedbf0be0
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = b16e40279e21f0a9
	setx	0x045f22b7f4048912,%g7,%l0 ! %l0 = 045f22b7f4048912
!	%l1 = ed015c7fedbf0be0
	setx	0xe8252a17ceebfbd4,%g7,%l1 ! %l1 = e8252a17ceebfbd4
!	Mem[0000000030141400] = 54300000000000d8, %f22 = 933ba68a 00005e00
	ldda	[%i5+%g0]0x81,%f22	! %f22 = 54300000 000000d8
!	Mem[0000000030081410] = 00000000, %l7 = 0000000000000000
	ldsba	[%i2+%o5]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000030101408] = 1930e684, %l6 = 00000000beff5d9a
	ldsha	[%i4+%o4]0x81,%l6	! %l6 = 0000000000001930
!	Starting 10 instruction Store Burst
!	%f4  = ff000000 00000000, Mem[0000000010001408] = 0000ffff 9a5dffbe
	stda	%f4 ,[%i0+%o4]0x88	! Mem[0000000010001408] = ff000000 00000000

p0_label_96:
!	Mem[000000001000143c] = 0000005e, %l2 = 0000000000003054
	swap	[%i0+0x03c],%l2		! %l2 = 000000000000005e
!	%l0 = f4048912, %l1 = ceebfbd4, Mem[0000000030041400] = 69305030 2d000000
	stda	%l0,[%i1+%g0]0x89	! Mem[0000000030041400] = f4048912 ceebfbd4
!	Mem[00000000100c142e] = 2c92db8d, %l6 = 0000000000001930
	ldstuba	[%i3+0x02e]%asi,%l6	! %l6 = 000000db000000ff
	membar	#Sync			! Added by membar checker (15)
!	%l3 = 83570000ffffffff, Mem[0000000030181408] = 5a000000
	stwa	%l3,[%i6+%o4]0x81	! Mem[0000000030181408] = ffffffff
!	%f4  = ff000000, %f8  = 00000000
	fcmpes	%fcc1,%f4 ,%f8 		! %fcc1 = 1
!	Mem[00000000100c142c] = 2c92ff8d, %l6 = 00000000000000db, %asi = 80
	swapa	[%i3+0x02c]%asi,%l6	! %l6 = 000000002c92ff8d
!	%l7 = 0000000000000000, Mem[0000000010141410] = 9a5d00ff
	stwa	%l7,[%i5+%o5]0x88	! Mem[0000000010141410] = 00000000
!	%l0 = 045f22b7f4048912, Mem[0000000030001408] = 0000000000000000
	stxa	%l0,[%i0+%o4]0x81	! Mem[0000000030001408] = 045f22b7f4048912
!	%f24 = 772efcfd 00000062, Mem[0000000010081408] = 8fffbef7 a6004ece
	stda	%f24,[%i2+%o4]0x88	! Mem[0000000010081408] = 772efcfd 00000062
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = 000000ff6a090251, %f4  = ff000000 00000000
	ldda	[%i4+%o5]0x80,%f4 	! %f4  = 000000ff 6a090251

p0_label_97:
	membar	#Sync			! Added by membar checker (16)
!	Mem[00000000100c1400] = ffa696bb 42107eed e5ff2eaa 00000000
!	Mem[00000000100c1410] = e0090000 00000000 5cb0ee7e 3054c578
!	Mem[00000000100c1420] = 933ba68a 8981bd0d 95793ced 000000db
!	Mem[00000000100c1430] = 90d5fc1e a4269a4b 10726dd6 ce6aba12
	ldda	[%i3]ASI_BLK_AIUPL,%f0	! Block Load from 00000000100c1400
!	Mem[00000000100c140c] = 00000000, %l3 = 83570000ffffffff
	ldsha	[%i3+0x00e]%asi,%l3	! %l3 = 0000000000000000
!	Mem[0000000030081410] = 00000000, %f18 = 00000000
	lda	[%i2+%o5]0x81,%f18	! %f18 = 00000000
!	Mem[0000000030081410] = 00000000, %f17 = ffa696bb
	lda	[%i2+%o5]0x81,%f17	! %f17 = 00000000
!	Mem[0000000010181408] = 0000005e, %l1 = e8252a17ceebfbd4
	lduha	[%i6+%o4]0x80,%l1	! %l1 = 0000000000000000
!	Mem[00000000100c1410] = 000009e0, %l2 = 000000000000005e
	ldsba	[%i3+%o5]0x88,%l2	! %l2 = ffffffffffffffe0
!	Mem[0000000010001438] = 9b7db15900003054, %f28 = 0daaa74c cfa24919
	ldda	[%i0+0x038]%asi,%f28	! %f28 = 9b7db159 00003054
!	Mem[0000000030181408] = 2ab73dc9ffffffff, %f20 = cc722562 6a090251
	ldda	[%i6+%o4]0x89,%f20	! %f20 = 2ab73dc9 ffffffff
!	Mem[0000000020800040] = 1f4d0596, %l0 = 045f22b7f4048912
	ldsb	[%o1+0x041],%l0		! %l0 = 000000000000004d
!	Starting 10 instruction Store Burst
!	%f26 = b52df303 d6bc032f, %l0 = 000000000000004d
!	Mem[0000000030141410] = 7eeeb05c33c35d18
	add	%i5,0x010,%g1
	stda	%f26,[%g1+%l0]ASI_PST16_SL ! Mem[0000000030141410] = 2f03b05c03f32db5

p0_label_98:
!	Mem[0000000010041400] = 0000002d, %l2 = ffffffffffffffe0
	ldstuba	[%i1+%g0]0x88,%l2	! %l2 = 0000002d000000ff
!	Mem[0000000010101410] = ff000000, %l3 = 0000000000000000
	swapa	[%i4+%o5]0x88,%l3	! %l3 = 00000000ff000000
!	%f18 = 00000000 beff5d9a, %l7 = 0000000000000000
!	Mem[0000000030081408] = 000000000000000b
	add	%i2,0x008,%g1
	stda	%f18,[%g1+%l7]ASI_PST32_S ! Mem[0000000030081408] = 000000000000000b
!	Mem[0000000010101410] = 00000000, %l3 = 00000000ff000000
	swapa	[%i4+%o5]0x80,%l3	! %l3 = 0000000000000000
!	%l6 = 000000002c92ff8d, Mem[000000001014141e] = 7eeeb05c
	stb	%l6,[%i5+0x01e]		! Mem[000000001014141c] = 7eee8d5c
!	Mem[0000000030041400] = 128904f4, %l0 = 000000000000004d
	ldstuba	[%i1+%g0]0x81,%l0	! %l0 = 00000012000000ff
!	%l5 = 00000000005e0000, %l5 = 00000000005e0000, %l3 = 0000000000000000
	andn	%l5,%l5,%l3		! %l3 = 0000000000000000
!	Mem[00000000300c1408] = 62320453, %l4 = 0000000000000000
	swapa	[%i3+%o4]0x81,%l4	! %l4 = 0000000062320453
!	Mem[0000000030001408] = b7225f04, %l1 = 0000000000000000
	ldstuba	[%i0+%o4]0x89,%l1	! %l1 = 00000004000000ff
!	Starting 10 instruction Load Burst
!	%f21 = ffffffff, %f24 = 772efcfd, %f26 = b52df303
	fdivs	%f21,%f24,%f26		! %f26 = ffffffff

p0_label_99:
!	Mem[0000000010081410] = ff7db159, %l3 = 0000000000000000
	ldsba	[%i2+%o5]0x80,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010181408] = 0000005e 2c92db8d, %l6 = 2c92ff8d, %l7 = 00000000
	ldd	[%i6+%o4],%l6		! %l6 = 000000000000005e 000000002c92db8d
!	Mem[0000000030001408] = 128904f4 b7225fff, %l0 = 00000012, %l1 = 00000004
	ldda	[%i0+%o4]0x89,%l0	! %l0 = 00000000b7225fff 00000000128904f4
!	Mem[0000000010181410] = 00000061, %l4 = 0000000062320453
	ldsba	[%i6+%o5]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000030101400] = ff000053, %f19 = beff5d9a
	lda	[%i4+%g0]0x81,%f19	! %f19 = ff000053
!	Mem[0000000010181408] = 0000005e, %l0 = 00000000b7225fff
	ldsba	[%i6+%o4]0x80,%l0	! %l0 = 0000000000000000
!	Mem[000000001010140c] = 56860dd4, %l3 = ffffffffffffffff
	lduw	[%i4+0x00c],%l3		! %l3 = 0000000056860dd4
!	Mem[0000000010001408] = 00000000000000ff, %f22 = 54300000 000000d8
	ldd	[%i0+%o4],%f22		! %f22 = 00000000 000000ff
!	Mem[000000001000142c] = 69305030, %f26 = ffffffff
	lda	[%i0+0x02c]%asi,%f26	! %f26 = 69305030
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000000000, Mem[0000000030041400] = f40489ff
	stwa	%l4,[%i1+%g0]0x89	! Mem[0000000030041400] = 00000000

p0_label_100:
!	Mem[00000000100c1408] = aa2effe5, %l6 = 000000000000005e
	ldstuba	[%i3+%o4]0x88,%l6	! %l6 = 000000e5000000ff
!	Mem[0000000030001400] = 00000000, %l7 = 000000002c92db8d
	ldstuba	[%i0+%g0]0x81,%l7	! %l7 = 00000000000000ff
!	%l7 = 0000000000000000, Mem[0000000030081408] = 00000000
	stha	%l7,[%i2+%o4]0x89	! Mem[0000000030081408] = 00000000
!	%l4 = 0000000000000000, Mem[00000000211c0000] = ffff4340, %asi = 80
	stha	%l4,[%o2+0x000]%asi	! Mem[00000000211c0000] = 00004340
!	%f22 = 00000000 000000ff, Mem[0000000010101420] = ffd122bc e15cb604
	std	%f22,[%i4+0x020]	! Mem[0000000010101420] = 00000000 000000ff
!	%f22 = 00000000 000000ff, Mem[0000000010041408] = 0000005e 00000000
	stda	%f22,[%i1+%o4]0x80	! Mem[0000000010041408] = 00000000 000000ff
!	Mem[0000000010141436] = 1efcd590, %l7 = 0000000000000000
	ldstub	[%i5+0x036],%l7		! %l7 = 000000d5000000ff
!	%l5 = 00000000005e0000, Mem[0000000030081410] = 00000000
	stba	%l5,[%i2+%o5]0x89	! Mem[0000000030081410] = 00000000
!	%l2 = 0000002d, %l3 = 56860dd4, Mem[0000000010141408] = ff000000 622572cc
	stda	%l2,[%i5+%o4]0x88	! Mem[0000000010141408] = 0000002d 56860dd4
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = 00000000, %l2 = 000000000000002d
	lduba	[%i1+%o4]0x80,%l2	! %l2 = 0000000000000000

p0_label_101:
!	Mem[0000000010181408] = 5e000000, %l1 = 00000000128904f4
	ldsha	[%i6+%o4]0x88,%l1	! %l1 = 0000000000000000
!	Mem[00000000300c1408] = 00000000, %l4 = 0000000000000000
	lduwa	[%i3+%o4]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000030001400] = 000000ff, %l6 = 00000000000000e5
	ldsba	[%i0+%g0]0x89,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000030101400] = ff0000530e056cf2, %f10 = db000000 ed3c7995
	ldda	[%i4+%g0]0x81,%f10	! %f10 = ff000053 0e056cf2
!	Mem[0000000010101410] = ff000000, %l4 = 0000000000000000
	lduha	[%i4+%o5]0x80,%l4	! %l4 = 000000000000ff00
!	Mem[0000000010181400] = 6200000000000000, %f30 = f7bef48f ce4e00a6
	ldda	[%i6+%g0]0x80,%f30	! %f30 = 62000000 00000000
!	Mem[0000000030181400] = 745b00ff, %l4 = 000000000000ff00
	lduwa	[%i6+%g0]0x89,%l4	! %l4 = 00000000745b00ff
!	%l5 = 00000000005e0000, %l7 = 00000000000000d5, %y  = 000000c3
	udiv	%l5,%l7,%l1		! %l1 = 00000000ea5e3013
	mov	%l0,%y			! %y = 00000000
!	Mem[0000000030141410] = 2f03b05c, %l7 = 00000000000000d5
	ldsha	[%i5+%o5]0x81,%l7	! %l7 = 0000000000002f03
!	Starting 10 instruction Store Burst
!	%f16 = ff0000ff 00000000 00000000 ff000053
!	%f20 = 2ab73dc9 ffffffff 00000000 000000ff
!	%f24 = 772efcfd 00000062 69305030 d6bc032f
!	%f28 = 9b7db159 00003054 62000000 00000000
	stda	%f16,[%i1]ASI_COMMIT_P	! Block Store to 0000000010041400

p0_label_102:
!	%l7 = 0000000000002f03, Mem[0000000010181400] = 00000062
	stwa	%l7,[%i6+%g0]0x88	! Mem[0000000010181400] = 00002f03
!	%l3 = 0000000056860dd4, Mem[000000001018140a] = 0000005e, %asi = 80
	stba	%l3,[%i6+0x00a]%asi	! Mem[0000000010181408] = 0000d45e
!	%f1  = bb96a6ff, %f7  = 7eeeb05c, %f3  = aa2effe5
	fmuls	%f1 ,%f7 ,%f3 		! %f3  = fb0c770a
!	Mem[0000000030081410] = 00000000, %l5 = 00000000005e0000
	ldstuba	[%i2+%o5]0x81,%l5	! %l5 = 00000000000000ff
!	Code Fragment 4
p0_fragment_11:
!	%l0 = 0000000000000000
	setx	0x2cc57727d94a24a5,%g7,%l0 ! %l0 = 2cc57727d94a24a5
!	%l1 = 00000000ea5e3013
	setx	0x08c51c104d6fb513,%g7,%l1 ! %l1 = 08c51c104d6fb513
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 2cc57727d94a24a5
	setx	0x8c467237edfaba52,%g7,%l0 ! %l0 = 8c467237edfaba52
!	%l1 = 08c51c104d6fb513
	setx	0x46640dd7c2a6aed3,%g7,%l1 ! %l1 = 46640dd7c2a6aed3
!	Mem[00000000300c1410] = 005e0000, %l7 = 0000000000002f03
	swapa	[%i3+%o5]0x81,%l7	! %l7 = 00000000005e0000
!	%l4 = 00000000745b00ff, Mem[00000000300c1408] = 000000ff00000000
	stxa	%l4,[%i3+%o4]0x89	! Mem[00000000300c1408] = 00000000745b00ff
!	%l5 = 0000000000000000, Mem[0000000030141400] = 54300000
	stha	%l5,[%i5+%g0]0x81	! Mem[0000000030141400] = 00000000
!	%l0 = 8c467237edfaba52, Mem[0000000021800101] = 9f729500, %asi = 80
	stba	%l0,[%o3+0x101]%asi	! Mem[0000000021800100] = 9f529500
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = 00000000, %l4 = 00000000745b00ff
	ldsha	[%i1+%g0]0x81,%l4	! %l4 = 0000000000000000

p0_label_103:
!	%l3 = 0000000056860dd4, imm = fffffffffffffd1e, %l0 = 8c467237edfaba52
	orn	%l3,-0x2e2,%l0		! %l0 = 0000000056860ff5
!	Mem[00000000300c1410] = 00002f03, %l4 = 0000000000000000
	lduwa	[%i3+%o5]0x81,%l4	! %l4 = 0000000000002f03
	membar	#Sync			! Added by membar checker (17)
!	%f13 = 1efcd590, Mem[00000000100c1438] = 10726dd6
	st	%f13,[%i3+0x038]	! Mem[00000000100c1438] = 1efcd590
!	Mem[0000000030081410] = ff000000, %l1 = 46640dd7c2a6aed3
	lduha	[%i2+%o5]0x81,%l1	! %l1 = 000000000000ff00
!	Mem[0000000030001408] = ff5f22b7, %l1 = 000000000000ff00
	ldsha	[%i0+%o4]0x81,%l1	! %l1 = ffffffffffffff5f
!	Mem[0000000010001400] = 0000ff00, %l7 = 00000000005e0000
	lduba	[%i0+%g0]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000030041400] = 00000000, %l1 = ffffffffffffff5f
	lduwa	[%i1+%g0]0x89,%l1	! %l1 = 0000000000000000
!	%l4 = 0000000000002f03, %l6 = ffffffffffffffff, %l4 = 0000000000002f03
	or	%l4,%l6,%l4		! %l4 = ffffffffffffffff
!	Mem[0000000030101410] = 06650118, %l6 = ffffffffffffffff
	ldsba	[%i4+%o5]0x81,%l6	! %l6 = 0000000000000006
!	Starting 10 instruction Store Burst
!	%l0 = 56860ff5, %l1 = 00000000, Mem[0000000010141400] = ffffffff 83570000
	stda	%l0,[%i5+%g0]0x88	! Mem[0000000010141400] = 56860ff5 00000000

p0_label_104:
!	%f8  = 0dbd8189 8aa63b93, Mem[0000000010041410] = 2ab73dc9 ffffffff
	stda	%f8 ,[%i1+%o5]0x80	! Mem[0000000010041410] = 0dbd8189 8aa63b93
!	%l0 = 0000000056860ff5, %l5 = 0000000000000000, %l3 = 0000000056860dd4
	subc	%l0,%l5,%l3		! %l3 = 0000000056860ff5
!	%l6 = 0000000000000006, Mem[0000000030081410] = 2d000000000000ff
	stxa	%l6,[%i2+%o5]0x89	! Mem[0000000030081410] = 0000000000000006
!	%l3 = 0000000056860ff5, Mem[00000000100c1420] = 933ba68a
	stw	%l3,[%i3+0x020]		! Mem[00000000100c1420] = 56860ff5
!	%l6 = 0000000000000006, Mem[0000000010141410] = 00000000
	stwa	%l6,[%i5+%o5]0x80	! Mem[0000000010141410] = 00000006
!	%l7 = 0000000000000000, Mem[0000000010081408] = 62000000fdfc2e77
	stxa	%l7,[%i2+%o4]0x80	! Mem[0000000010081408] = 0000000000000000
!	%f4  = 00000000, Mem[0000000030141408] = 03f32db5
	sta	%f4 ,[%i5+%o4]0x81	! Mem[0000000030141408] = 00000000
!	%f20 = 2ab73dc9, Mem[0000000010141434] = 1efcff90
	sta	%f20,[%i5+0x034]%asi	! Mem[0000000010141434] = 2ab73dc9
!	Mem[0000000010181400] = 032f0000, %l4 = ffffffffffffffff
	swapa	[%i6+%g0]0x80,%l4	! %l4 = 00000000032f0000
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = ffffe0d4, %l2 = 0000000000000000
	ldsba	[%o0+0x000]%asi,%l2	! %l2 = ffffffffffffffff

p0_label_105:
!	Mem[000000001010141c] = 8aa63b93, %f25 = 00000062
	lda	[%i4+0x01c]%asi,%f25	! %f25 = 8aa63b93
!	Mem[0000000010101408] = 622572cc, %l4 = 00000000032f0000
	ldswa	[%i4+%o4]0x88,%l4	! %l4 = 00000000622572cc
!	Mem[0000000030101400] = f26c050e530000ff, %l2 = ffffffffffffffff
	ldxa	[%i4+%g0]0x89,%l2	! %l2 = f26c050e530000ff
!	Mem[0000000030001400] = ff000000, %f20 = 2ab73dc9
	lda	[%i0+%g0]0x81,%f20	! %f20 = ff000000
!	Mem[00000000211c0000] = 00004340, %l0 = 0000000056860ff5
	ldsh	[%o2+%g0],%l0		! %l0 = 0000000000000000
!	Mem[00000000300c1400] = 530432d3, %l6 = 0000000000000006
	ldsba	[%i3+%g0]0x81,%l6	! %l6 = 0000000000000053
!	%l5 = 0000000000000000, %l0 = 0000000000000000, %l3 = 0000000056860ff5
	or	%l5,%l0,%l3		! %l3 = 0000000000000000
!	Mem[0000000010041400] = ff0000ff, %l4 = 00000000622572cc
	ldsba	[%i1+%g0]0x88,%l4	! %l4 = ffffffffffffffff
!	Mem[00000000300c1410] = 00002f038aa63b93, %l2 = f26c050e530000ff
	ldxa	[%i3+%o5]0x81,%l2	! %l2 = 00002f038aa63b93
!	Starting 10 instruction Store Burst
!	%l5 = 0000000000000000, Mem[0000000030101400] = ff0000530e056cf2
	stxa	%l5,[%i4+%g0]0x81	! Mem[0000000030101400] = 0000000000000000

p0_label_106:
!	%f1  = bb96a6ff, Mem[0000000010001410] = 8c350000
	sta	%f1 ,[%i0+%o5]0x88	! Mem[0000000010001410] = bb96a6ff
!	%l6 = 00000053, %l7 = 00000000, Mem[0000000010041408] = 00000000 ff000053
	stda	%l6,[%i1+%o4]0x80	! Mem[0000000010041408] = 00000053 00000000
!	Mem[0000000010041430] = 9b7db159, %l2 = 00002f038aa63b93
	swap	[%i1+0x030],%l2		! %l2 = 000000009b7db159
!	%f18 = 00000000, Mem[0000000030181400] = 745b00ff
	sta	%f18,[%i6+%g0]0x89	! Mem[0000000030181400] = 00000000
!	%l1 = 0000000000000000, Mem[0000000010001430] = 000000ff00000000
	stx	%l1,[%i0+0x030]		! Mem[0000000010001430] = 0000000000000000
!	Mem[0000000010081424] = 00000000, %l3 = 0000000000000000, %asi = 80
	swapa	[%i2+0x024]%asi,%l3	! %l3 = 0000000000000000
!	Mem[0000000020800001] = ffff8b5d, %l0 = 0000000000000000
	ldstub	[%o1+0x001],%l0		! %l0 = 000000ff000000ff
!	%f1  = bb96a6ff, Mem[0000000030101410] = 06650118
	sta	%f1 ,[%i4+%o5]0x81	! Mem[0000000030101410] = bb96a6ff
!	%f10 = ff000053 0e056cf2, Mem[0000000010081408] = 00000000 00000000
	stda	%f10,[%i2+%o4]0x88	! Mem[0000000010081408] = ff000053 0e056cf2
!	Starting 10 instruction Load Burst
!	Mem[0000000010041434] = 00003054, %l7 = 0000000000000000
	lduh	[%i1+0x034],%l7		! %l7 = 0000000000000000

p0_label_107:
!	Mem[0000000010081430] = 0daaa74c, %l3 = 0000000000000000
	ldsb	[%i2+0x031],%l3		! %l3 = ffffffffffffffaa
!	Mem[0000000030041410] = a6004ece, %l1 = 0000000000000000
	lduwa	[%i1+%o5]0x81,%l1	! %l1 = 00000000a6004ece
!	Mem[0000000030001400] = ff000000, %f1  = bb96a6ff
	lda	[%i0+%g0]0x81,%f1 	! %f1 = ff000000
!	Mem[00000000100c1410] = 000009e0, %f13 = 1efcd590
	lda	[%i3+%o5]0x88,%f13	! %f13 = 000009e0
!	Code Fragment 4
p0_fragment_12:
!	%l0 = 00000000000000ff
	setx	0xb90416a05efc5c93,%g7,%l0 ! %l0 = b90416a05efc5c93
!	%l1 = 00000000a6004ece
	setx	0x21946e501cfb9269,%g7,%l1 ! %l1 = 21946e501cfb9269
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = b90416a05efc5c93
	setx	0x091f14583505c78f,%g7,%l0 ! %l0 = 091f14583505c78f
!	%l1 = 21946e501cfb9269
	setx	0xedc72097ba7cf017,%g7,%l1 ! %l1 = edc72097ba7cf017
!	Mem[0000000010181410] = 00000061, %l3 = ffffffffffffffaa
	lduha	[%i6+%o5]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000010001410] = ffa696bb, %l5 = 0000000000000000
	lduha	[%i0+%o5]0x80,%l5	! %l5 = 000000000000ffa6
!	Mem[00000000300c1408] = ff005b74, %l0 = 091f14583505c78f
	ldsha	[%i3+%o4]0x81,%l0	! %l0 = ffffffffffffff00
!	%f2  = 00000000, %f19 = ff000053
	fcmpes	%fcc2,%f2 ,%f19		! %fcc2 = 2
!	Starting 10 instruction Store Burst
!	Mem[0000000010141408] = 2d000000d40d8656, %l5 = 000000000000ffa6, %l3 = 0000000000000000
	add	%i5,0x08,%g1
	casxa	[%g1]0x80,%l5,%l3	! %l3 = 2d000000d40d8656

p0_label_108:
!	Mem[0000000010041420] = 772efcfd00000062, %l2 = 000000009b7db159, %l5 = 000000000000ffa6
	add	%i1,0x20,%g1
	casxa	[%g1]0x80,%l2,%l5	! %l5 = 772efcfd00000062
!	Mem[00000000300c1410] = 032f0000, %l0 = ffffffffffffff00
	swapa	[%i3+%o5]0x89,%l0	! %l0 = 00000000032f0000
!	%l1 = edc72097ba7cf017, Mem[0000000010141400] = f50f8656
	stba	%l1,[%i5+%g0]0x80	! Mem[0000000010141400] = 170f8656
!	Code Fragment 4
p0_fragment_13:
!	%l0 = 00000000032f0000
	setx	0x3e14a00063b94c61,%g7,%l0 ! %l0 = 3e14a00063b94c61
!	%l1 = edc72097ba7cf017
	setx	0x5093c0a05410ec9a,%g7,%l1 ! %l1 = 5093c0a05410ec9a
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 3e14a00063b94c61
	setx	0x08c687bfd22be29b,%g7,%l0 ! %l0 = 08c687bfd22be29b
!	%l1 = 5093c0a05410ec9a
	setx	0x5cb2f1df91a3bc31,%g7,%l1 ! %l1 = 5cb2f1df91a3bc31
!	%l3 = 2d000000d40d8656, Mem[00000000201c0001] = ffffe0d4, %asi = 80
	stba	%l3,[%o0+0x001]%asi	! Mem[00000000201c0000] = ff56e0d4
!	Mem[00000000211c0001] = 00004340, %l2 = 000000009b7db159
	ldstuba	[%o2+0x001]%asi,%l2	! %l2 = 00000000000000ff
!	%l1 = 5cb2f1df91a3bc31, Mem[0000000010141410] = 06000000
	stwa	%l1,[%i5+%o5]0x88	! Mem[0000000010141410] = 91a3bc31
!	%f22 = 00000000 000000ff, Mem[0000000030081408] = 00000000 0b000000
	stda	%f22,[%i2+%o4]0x89	! Mem[0000000030081408] = 00000000 000000ff
!	%l5 = 772efcfd00000062, Mem[0000000030041400] = 00000000
	stha	%l5,[%i1+%g0]0x89	! Mem[0000000030041400] = 00000062
!	Starting 10 instruction Load Burst
!	Mem[0000000030001400] = ff000000 00000000 ff5f22b7 f4048912
!	Mem[0000000030001410] = ffd5c92d 00000072 5ea25b74 56860dd4
!	Mem[0000000030001420] = 772efcfd eb35b308 b52df303 d6bc032f
!	Mem[0000000030001430] = 0daaa74c cfa24919 f7bef48f ce4e00a6
	ldda	[%i0]ASI_BLK_S,%f16	! Block Load from 0000000030001400

p0_label_109:
!	Mem[0000000010001410] = ffa696bb000000ff, %l0 = 08c687bfd22be29b
	ldxa	[%i0+%o5]0x80,%l0	! %l0 = ffa696bb000000ff
!	Mem[0000000010101414] = 6a090251, %l1 = 5cb2f1df91a3bc31
	lduwa	[%i4+0x014]%asi,%l1	! %l1 = 000000006a090251
!	Code Fragment 4
p0_fragment_14:
!	%l0 = ffa696bb000000ff
	setx	0x834c1a8ff6405af1,%g7,%l0 ! %l0 = 834c1a8ff6405af1
!	%l1 = 000000006a090251
	setx	0xe58bb6c861f7820d,%g7,%l1 ! %l1 = e58bb6c861f7820d
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 834c1a8ff6405af1
	setx	0xa02513803c91ef8a,%g7,%l0 ! %l0 = a02513803c91ef8a
!	%l1 = e58bb6c861f7820d
	setx	0x6d0a90781bf987c9,%g7,%l1 ! %l1 = 6d0a90781bf987c9
!	Mem[00000000218000c0] = ff9bafd4, %l1 = 6d0a90781bf987c9
	ldsh	[%o3+0x0c0],%l1		! %l1 = ffffffffffffff9b
!	Mem[0000000030181410] = ff000000, %l1 = ffffffffffffff9b
	ldswa	[%i6+%o5]0x81,%l1	! %l1 = ffffffffff000000
!	Mem[0000000010001400] = 00ff0000, %l7 = 0000000000000000
	ldswa	[%i0+%g0]0x80,%l7	! %l7 = 0000000000ff0000
!	Mem[0000000030001408] = ff5f22b7 f4048912, %l6 = 00000053, %l7 = 00ff0000
	ldda	[%i0+%o4]0x81,%l6	! %l6 = 00000000ff5f22b7 00000000f4048912
!	Mem[0000000030001408] = ff5f22b7, %l2 = 0000000000000000
	lduha	[%i0+%o4]0x81,%l2	! %l2 = 000000000000ff5f
!	Mem[0000000030101410] = ffa696bb, %l0 = a02513803c91ef8a
	ldswa	[%i4+%o5]0x89,%l0	! %l0 = ffffffffffa696bb
!	Starting 10 instruction Store Burst
!	%l0 = ffffffffffa696bb, Mem[00000000100c1400] = ffa696bb
	stha	%l0,[%i3+%g0]0x80	! Mem[00000000100c1400] = 96bb96bb

p0_label_110:
!	Mem[0000000010081408] = f26c050e530000ff, %f8  = 0dbd8189 8aa63b93
	ldda	[%i2+%o4]0x80,%f8 	! %f8  = f26c050e 530000ff
!	%f12 = 4b9a26a4, Mem[0000000030181400] = 00000000
	sta	%f12,[%i6+%g0]0x81	! Mem[0000000030181400] = 4b9a26a4
!	%f10 = ff000053 0e056cf2, Mem[0000000030081408] = 000000ff 00000000
	stda	%f10,[%i2+%o4]0x89	! Mem[0000000030081408] = ff000053 0e056cf2
!	%f2  = 00000000 fb0c770a, %l7 = 00000000f4048912
!	Mem[0000000030101428] = 1ee35897d81082ce
	add	%i4,0x028,%g1
	stda	%f2,[%g1+%l7]ASI_PST32_SL ! Mem[0000000030101428] = 1ee3589700000000
!	%l1 = ffffffffff000000, Mem[00000000201c0000] = ff56e0d4
	stb	%l1,[%o0+%g0]		! Mem[00000000201c0000] = 0056e0d4
!	Mem[0000000010001408] = 00000000, %l0 = ffffffffffa696bb
	swapa	[%i0+%o4]0x80,%l0	! %l0 = 0000000000000000
!	Code Fragment 4
p0_fragment_15:
!	%l0 = 0000000000000000
	setx	0x9235282fb92d5dbf,%g7,%l0 ! %l0 = 9235282fb92d5dbf
!	%l1 = ffffffffff000000
	setx	0x6faed897e7015fbc,%g7,%l1 ! %l1 = 6faed897e7015fbc
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 9235282fb92d5dbf
	setx	0xacc8a85009722287,%g7,%l0 ! %l0 = acc8a85009722287
!	%l1 = 6faed897e7015fbc
	setx	0xa3cb2c37fa88c8cb,%g7,%l1 ! %l1 = a3cb2c37fa88c8cb
!	Mem[0000000010101408] = cc722562, %l7 = f4048912, %l1 = fa88c8cb
	add	%i4,0x08,%g1
	casa	[%g1]0x80,%l7,%l1	! %l1 = 00000000cc722562
!	Mem[0000000010141420] = 0dbd81898aa63b93, %l3 = 2d000000d40d8656, %l7 = 00000000f4048912
	add	%i5,0x20,%g1
	casxa	[%g1]0x80,%l3,%l7	! %l7 = 0dbd81898aa63b93
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = ff000000, %l1 = 00000000cc722562
	ldsba	[%i4+%o5]0x80,%l1	! %l1 = ffffffffffffffff

p0_label_111:
!	Mem[00000000300c1408] = 00000000745b00ff, %f6  = 78c55430 7eeeb05c
	ldda	[%i3+%o4]0x89,%f6 	! %f6  = 00000000 745b00ff
!	Mem[0000000010101428] = 000000ff, %l3 = 2d000000d40d8656
	ldsh	[%i4+0x02a],%l3		! %l3 = 00000000000000ff
!	Mem[00000000211c0000] = 00ff4340, %l5 = 772efcfd00000062
	ldsh	[%o2+%g0],%l5		! %l5 = 00000000000000ff
!	Mem[0000000010041428] = 69305030 d6bc032f, %l0 = 09722287, %l1 = ffffffff
	ldd	[%i1+0x028],%l0		! %l0 = 0000000069305030 00000000d6bc032f
!	Mem[0000000030081408] = f26c050e, %l2 = 000000000000ff5f
	ldsha	[%i2+%o4]0x81,%l2	! %l2 = fffffffffffff26c
!	Mem[0000000010141400] = 170f8656, %f21 = 00000072
	lda	[%i5+%g0]0x80,%f21	! %f21 = 170f8656
!	Mem[0000000010081400] = 933ba68a 00005e00, %l6 = ff5f22b7, %l7 = 8aa63b93
	ldda	[%i2+%g0]0x88,%l6	! %l6 = 0000000000005e00 00000000933ba68a
!	Mem[00000000100c1414] = 00000000, %l7 = 00000000933ba68a
	ldsw	[%i3+0x014],%l7		! %l7 = 0000000000000000
!	Mem[00000000100c1410] = e0090000 00000000, %l0 = 69305030, %l1 = d6bc032f
	ldda	[%i3+0x010]%asi,%l0	! %l0 = 00000000e0090000 0000000000000000
!	Starting 10 instruction Store Burst
!	%l7 = 0000000000000000, Mem[00000000211c0000] = 00ff4340, %asi = 80
	stha	%l7,[%o2+0x000]%asi	! Mem[00000000211c0000] = 00004340

p0_label_112:
!	%f24 = 772efcfd eb35b308, %l2 = fffffffffffff26c
!	Mem[0000000030041408] = 0000002c1d480000
	add	%i1,0x008,%g1
	stda	%f24,[%g1+%l2]ASI_PST8_SL ! Mem[0000000030041408] = 000035eb1dfc2e00
!	Mem[0000000010081408] = f26c050e, %l0 = 00000000e0090000
	ldstuba	[%i2+%o4]0x80,%l0	! %l0 = 000000f2000000ff
!	%l2 = fffff26c, %l3 = 000000ff, Mem[0000000010041410] = 8981bd0d 933ba68a
	stda	%l2,[%i1+%o5]0x88	! Mem[0000000010041410] = fffff26c 000000ff
!	%l7 = 0000000000000000, Mem[000000001018142f] = 00000000, %asi = 80
	stba	%l7,[%i6+0x02f]%asi	! Mem[000000001018142c] = 00000000
!	Mem[0000000030101400] = 00000000, %l0 = 00000000000000f2
	swapa	[%i4+%g0]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000030041410] = a6004ece, %l4 = ffffffffffffffff
	ldstuba	[%i1+%o5]0x81,%l4	! %l4 = 000000a6000000ff
!	Mem[0000000030181410] = 000000ff, %l4 = 00000000000000a6
	ldstuba	[%i6+%o5]0x89,%l4	! %l4 = 000000ff000000ff
!	%f2  = 00000000, Mem[0000000010101410] = 000000ff
	sta	%f2 ,[%i4+%o5]0x88	! Mem[0000000010101410] = 00000000
!	Mem[0000000030081400] = 000000ff, %l0 = 0000000000000000
	swapa	[%i2+%g0]0x81,%l0	! %l0 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = 00000000, %l2 = fffffffffffff26c
	ldsba	[%i5+%o4]0x81,%l2	! %l2 = 0000000000000000

p0_label_113:
!	%l3 = 00000000000000ff, %l1 = 0000000000000000, %l6 = 0000000000005e00
	sub	%l3,%l1,%l6		! %l6 = 00000000000000ff
!	Mem[00000000100c1410] = 000009e0, %l1 = 0000000000000000
	ldswa	[%i3+%o5]0x88,%l1	! %l1 = 00000000000009e0
!	Mem[0000000010181434] = beff5d9a, %l3 = 00000000000000ff
	ldsw	[%i6+0x034],%l3		! %l3 = ffffffffbeff5d9a
!	Mem[00000000100c140c] = 00000000, %l5 = 00000000000000ff
	lduba	[%i3+0x00e]%asi,%l5	! %l5 = 0000000000000000
!	Mem[0000000010141410] = 31bca391, %f25 = eb35b308
	lda	[%i5+%o5]0x80,%f25	! %f25 = 31bca391
!	Mem[0000000030041410] = ff004ece, %l6 = 00000000000000ff
	ldsha	[%i1+%o5]0x81,%l6	! %l6 = ffffffffffffff00
!	Mem[0000000010041408] = 53000000, %l2 = 0000000000000000
	ldsba	[%i1+%o4]0x88,%l2	! %l2 = 0000000000000000
!	%l5 = 0000000000000000, %l3 = ffffffffbeff5d9a, %l6 = ffffffffffffff00
	subc	%l5,%l3,%l6		! %l6 = 000000004100a266
!	Mem[0000000030041410] = 185dc333ce4e00ff, %f28 = 0daaa74c cfa24919
	ldda	[%i1+%o5]0x89,%f28	! %f28 = 185dc333 ce4e00ff
!	Starting 10 instruction Store Burst
!	%l2 = 00000000, %l3 = beff5d9a, Mem[0000000030181408] = ffffffff c93db72a
	stda	%l2,[%i6+%o4]0x81	! Mem[0000000030181408] = 00000000 beff5d9a

p0_label_114:
!	Mem[0000000030081400] = 00000000, %l1 = 00000000000009e0
	swapa	[%i2+%g0]0x81,%l1	! %l1 = 0000000000000000
!	%l3 = ffffffffbeff5d9a, Mem[0000000010001400] = 0000ff00
	stwa	%l3,[%i0+%g0]0x88	! Mem[0000000010001400] = beff5d9a
!	Mem[0000000030041408] = eb350000, %l1 = 0000000000000000
	ldstuba	[%i1+%o4]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030081400] = e0090000, %l5 = 0000000000000000
	ldstuba	[%i2+%g0]0x89,%l5	! %l5 = 00000000000000ff
!	%f29 = ce4e00ff, Mem[0000000010141410] = 91a3bc31
	sta	%f29,[%i5+%o5]0x88	! Mem[0000000010141410] = ce4e00ff
!	Mem[00000000300c1400] = 530432d3, %l0 = 00000000000000ff
	swapa	[%i3+%g0]0x81,%l0	! %l0 = 00000000530432d3
!	%f18 = ff5f22b7 f4048912, Mem[0000000010001410] = ffa696bb 000000ff
	stda	%f18,[%i0+%o5]0x80	! Mem[0000000010001410] = ff5f22b7 f4048912
!	Mem[0000000030101400] = 000000f2, %l1 = 0000000000000000
	swapa	[%i4+%g0]0x81,%l1	! %l1 = 00000000000000f2
!	%l6 = 000000004100a266, Mem[0000000010001408] = ff000000bb96a6ff
	stxa	%l6,[%i0+%o4]0x88	! Mem[0000000010001408] = 000000004100a266
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = 61000000, %l7 = 0000000000000000
	ldswa	[%i6+%o5]0x88,%l7	! %l7 = 0000000061000000

p0_label_115:
!	Mem[0000000021800180] = ff114d6f, %l6 = 000000004100a266
	ldub	[%o3+0x181],%l6		! %l6 = 0000000000000011
!	Mem[00000000100c1400] = bb96bb96, %l0 = 00000000530432d3
	ldsba	[%i3+%g0]0x88,%l0	! %l0 = ffffffffffffff96
!	Mem[0000000030101410] = ffa696bb, %l2 = 0000000000000000
	lduba	[%i4+%o5]0x89,%l2	! %l2 = 00000000000000bb
!	Mem[0000000030041410] = ce4e00ff, %l5 = 0000000000000000
	lduwa	[%i1+%o5]0x89,%l5	! %l5 = 00000000ce4e00ff
!	Mem[0000000030181400] = 32000000a4269a4b, %f22 = 5ea25b74 56860dd4
	ldda	[%i6+%g0]0x89,%f22	! %f22 = 32000000 a4269a4b
!	Mem[0000000030141400] = 00000000, %l5 = 00000000ce4e00ff
	lduwa	[%i5+%g0]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000030181408] = 00000000, %l0 = ffffffffffffff96
	ldswa	[%i6+%o4]0x81,%l0	! %l0 = 0000000000000000
!	Mem[000000001014140c] = d40d8656, %l6 = 0000000000000011
	lduwa	[%i5+0x00c]%asi,%l6	! %l6 = 00000000d40d8656
!	Mem[0000000030081410] = 0000000000000006, %l1 = 00000000000000f2
	ldxa	[%i2+%o5]0x89,%l1	! %l1 = 0000000000000006
!	Starting 10 instruction Store Burst
!	%l5 = 0000000000000000, imm = 0000000000000ae7, %l0 = 0000000000000000
	and	%l5,0xae7,%l0		! %l0 = 0000000000000000

p0_label_116:
!	%l3 = ffffffffbeff5d9a, Mem[0000000010141410] = ce4e00ff
	stha	%l3,[%i5+%o5]0x88	! Mem[0000000010141410] = ce4e5d9a
!	%l6 = 00000000d40d8656, Mem[0000000030081410] = 0000000000000006
	stxa	%l6,[%i2+%o5]0x89	! Mem[0000000030081410] = 00000000d40d8656
!	%f6  = 00000000 745b00ff, Mem[0000000010081410] = 59b17dff 2287a054
	stda	%f6 ,[%i2+%o5]0x88	! Mem[0000000010081410] = 00000000 745b00ff
!	%f10 = ff000053 0e056cf2, %l1 = 0000000000000006
!	Mem[0000000030041418] = 622572cc745ba25e
	add	%i1,0x018,%g1
	stda	%f10,[%g1+%l1]ASI_PST32_S ! Mem[0000000030041418] = ff000053745ba25e
!	Mem[0000000010081400] = 00005e00, %l6 = 00000000d40d8656
	ldstuba	[%i2+%g0]0x88,%l6	! %l6 = 00000000000000ff
!	%f30 = f7bef48f, Mem[0000000030101400] = 00000000
	sta	%f30,[%i4+%g0]0x81	! Mem[0000000030101400] = f7bef48f
!	%l6 = 00000000, %l7 = 61000000, Mem[00000000100c1408] = ffff2eaa 00000000
	stda	%l6,[%i3+%o4]0x80	! Mem[00000000100c1408] = 00000000 61000000
!	%l7 = 0000000061000000, Mem[00000000100c1400] = 96bb96bb
	stwa	%l7,[%i3+%g0]0x80	! Mem[00000000100c1400] = 61000000
!	%l7 = 0000000061000000, Mem[0000000030041400] = 62000000
	stwa	%l7,[%i1+%g0]0x81	! Mem[0000000030041400] = 61000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = ff004ece, %l7 = 0000000061000000
	lduwa	[%i1+%o5]0x81,%l7	! %l7 = 00000000ff004ece

p0_label_117:
!	Mem[0000000030041400] = 61000000, %l6 = 0000000000000000
	lduwa	[%i1+%g0]0x81,%l6	! %l6 = 0000000061000000
!	Mem[0000000030001400] = ff000000, %l7 = 00000000ff004ece
	lduba	[%i0+%g0]0x81,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010101400] = aa2effe5, %l1 = 0000000000000006
	ldsba	[%i4+%g0]0x80,%l1	! %l1 = ffffffffffffffaa
!	%l1 = ffffffffffffffaa, Mem[0000000030041408] = ff0035eb
	stba	%l1,[%i1+%o4]0x81	! Mem[0000000030041408] = aa0035eb
!	Mem[0000000030181408] = 00000000 beff5d9a, %l2 = 000000bb, %l3 = beff5d9a
	ldda	[%i6+%o4]0x81,%l2	! %l2 = 0000000000000000 00000000beff5d9a
!	Mem[000000001014141c] = 7eee8d5c, %l5 = 0000000000000000
	ldsw	[%i5+0x01c],%l5		! %l5 = 000000007eee8d5c
!	Mem[0000000010001410] = b7225fff, %f31 = ce4e00a6
	lda	[%i0+%o5]0x88,%f31	! %f31 = b7225fff
!	Mem[0000000010101408] = cc72256256860dd4, %l2 = 0000000000000000
	ldxa	[%i4+%o4]0x80,%l2	! %l2 = cc72256256860dd4
!	Mem[0000000010001438] = 9b7db15900003054, %f22 = 32000000 a4269a4b
	ldda	[%i0+0x038]%asi,%f22	! %f22 = 9b7db159 00003054
!	Starting 10 instruction Store Burst
!	%f26 = b52df303 d6bc032f, Mem[0000000030181410] = 000000ff 00000000
	stda	%f26,[%i6+%o5]0x89	! Mem[0000000030181410] = b52df303 d6bc032f

p0_label_118:
!	Mem[000000001010142c] = 4ea07165, %l5 = 000000007eee8d5c, %asi = 80
	swapa	[%i4+0x02c]%asi,%l5	! %l5 = 000000004ea07165
!	Mem[0000000030001410] = 2dc9d5ff, %l1 = ffffffffffffffaa
	swapa	[%i0+%o5]0x89,%l1	! %l1 = 000000002dc9d5ff
!	%l2 = 56860dd4, %l3 = beff5d9a, Mem[0000000030101410] = ffa696bb 53a62c32
	stda	%l2,[%i4+%o5]0x89	! Mem[0000000030101410] = 56860dd4 beff5d9a
!	%l6 = 0000000061000000, Mem[0000000030041400] = 00000061
	stha	%l6,[%i1+%g0]0x89	! Mem[0000000030041400] = 00000000
!	%l0 = 0000000000000000, Mem[0000000010001400] = 9a5dffbe
	stba	%l0,[%i0+%g0]0x80	! Mem[0000000010001400] = 005dffbe
!	Mem[0000000010001400] = 005dffbe, %l1 = 000000002dc9d5ff
	swapa	[%i0+%g0]0x80,%l1	! %l1 = 00000000005dffbe
!	%f8  = f26c050e, Mem[000000001000143c] = 00003054
	st	%f8 ,[%i0+0x03c]	! Mem[000000001000143c] = f26c050e
!	%f0  = ed7e1042, %f26 = b52df303, %f0  = ed7e1042
	fmuls	%f0 ,%f26,%f0 		! %f0  = 632ca229
!	%l2 = 56860dd4, %l3 = beff5d9a, Mem[0000000010041400] = ff0000ff 00000000
	stda	%l2,[%i1+%g0]0x88	! Mem[0000000010041400] = 56860dd4 beff5d9a
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = ffffffff00000000, %l7 = 00000000000000ff
	ldxa	[%i6+%g0]0x80,%l7	! %l7 = ffffffff00000000

p0_label_119:
!	Mem[00000000100c1428] = 95793ced, %l0 = 0000000000000000
	ldswa	[%i3+0x028]%asi,%l0	! %l0 = ffffffff95793ced
!	Mem[0000000030181410] = d6bc032f, %l5 = 000000004ea07165
	lduba	[%i6+%o5]0x89,%l5	! %l5 = 000000000000002f
!	Mem[0000000010101400] = e5ff2eaa, %l0 = ffffffff95793ced
	ldswa	[%i4+%g0]0x88,%l0	! %l0 = ffffffffe5ff2eaa
!	Mem[00000000100c1408] = 00000000, %l6 = 0000000061000000
	ldsba	[%i3+%o4]0x88,%l6	! %l6 = 0000000000000000
!	Mem[00000000100c1408] = 00000000, %f0  = 632ca229
	lda	[%i3+%o4]0x80,%f0 	! %f0 = 00000000
!	Mem[0000000010001410] = ff5f22b7, %f9  = 530000ff
	lda	[%i0+%o5]0x80,%f9 	! %f9 = ff5f22b7
!	Mem[0000000010181400] = ffffffff, %l3 = 00000000beff5d9a
	ldsha	[%i6+%g0]0x88,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000030081400] = ff0009e08aa63b93, %f4  = 00000000 000009e0
	ldda	[%i2+%g0]0x81,%f4 	! %f4  = ff0009e0 8aa63b93
!	Mem[0000000010141408] = 0000002d, %f3  = fb0c770a
	lda	[%i5+%o4]0x88,%f3 	! %f3 = 0000002d
!	Starting 10 instruction Store Burst
!	%l4 = 00000000000000ff, Mem[0000000010081430] = 0daaa74c
	sth	%l4,[%i2+0x030]		! Mem[0000000010081430] = 00ffa74c

p0_label_120:
!	%f8  = f26c050e, Mem[0000000010181400] = ffffffff
	sta	%f8 ,[%i6+%g0]0x80	! Mem[0000000010181400] = f26c050e
!	%l4 = 00000000000000ff, Mem[0000000020800040] = 1f4d0596
	stb	%l4,[%o1+0x040]		! Mem[0000000020800040] = ff4d0596
!	Mem[0000000010141400] = 170f865600000000, %l1 = 00000000005dffbe
	ldxa	[%i5+%g0]0x80,%l1	! %l1 = 170f865600000000
!	Mem[000000001010143c] = f67ef096, %l4 = 00000000000000ff
	swap	[%i4+0x03c],%l4		! %l4 = 00000000f67ef096
!	%l2 = cc72256256860dd4, Mem[0000000030081408] = ff0000530e056cf2
	stxa	%l2,[%i2+%o4]0x89	! Mem[0000000030081408] = cc72256256860dd4
!	%l0 = e5ff2eaa, %l1 = 00000000, Mem[0000000030141400] = 00000000 d8000000
	stda	%l0,[%i5+%g0]0x89	! Mem[0000000030141400] = e5ff2eaa 00000000
!	%l1 = 170f865600000000, immed = fffff4a3, %y  = 00000000
	udiv	%l1,-0xb5d,%l4		! %l4 = 0000000000000000
	mov	%l0,%y			! %y = e5ff2eaa
!	%f28 = 185dc333, Mem[000000001004142c] = d6bc032f
	sta	%f28,[%i1+0x02c]%asi	! Mem[000000001004142c] = 185dc333
!	%f2  = 00000000, Mem[0000000010081410] = ff005b74
	sta	%f2 ,[%i2+%o5]0x80	! Mem[0000000010081410] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = 000000006a090251, %f8  = f26c050e ff5f22b7
	ldda	[%i4+%o5]0x80,%f8 	! %f8  = 00000000 6a090251

p0_label_121:
!	Code Fragment 3
p0_fragment_16:
!	%l0 = ffffffffe5ff2eaa
	setx	0xfdf821e7b9f740b9,%g7,%l0 ! %l0 = fdf821e7b9f740b9
!	%l1 = 170f865600000000
	setx	0xbad536485610474d,%g7,%l1 ! %l1 = bad536485610474d
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = fdf821e7b9f740b9
	setx	0xacdd5ef822016a8c,%g7,%l0 ! %l0 = acdd5ef822016a8c
!	%l1 = bad536485610474d
	setx	0x40697497fbdf5d0e,%g7,%l1 ! %l1 = 40697497fbdf5d0e
!	Mem[0000000010081410] = 00000000, %l1 = 40697497fbdf5d0e
	lduha	[%i2+%o5]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000030041410] = ce4e00ff, %l5 = 000000000000002f
	ldsha	[%i1+%o5]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010001410] = ff5f22b7, %l0 = acdd5ef822016a8c
	lduba	[%i0+%o5]0x80,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010081408] = ff000053 0e056cff, %l6 = 00000000, %l7 = 00000000
	ldda	[%i2+%o4]0x88,%l6	! %l6 = 000000000e056cff 00000000ff000053
!	Mem[0000000010001400] = 2dc9d5ff, %f0  = 00000000
	lda	[%i0+%g0]0x80,%f0 	! %f0 = 2dc9d5ff
!	Mem[0000000010001408] = 66a20041, %l0 = 00000000000000ff
	ldswa	[%i0+%o4]0x80,%l0	! %l0 = 0000000066a20041
!	Mem[00000000100c1410] = e0090000, %l5 = 00000000000000ff
	lduwa	[%i3+%o5]0x80,%l5	! %l5 = 00000000e0090000
!	Mem[0000000030041408] = aa0035eb, %l7 = 00000000ff000053
	ldsha	[%i1+%o4]0x81,%l7	! %l7 = ffffffffffffaa00
!	Starting 10 instruction Store Burst
!	%f31 = b7225fff, %f25 = 31bca391, %f11 = 0e056cf2
	fadds	%f31,%f25,%f11		! %f11 = b722486b

p0_label_122:
!	Mem[0000000010181410] = 61000000, %l7 = ffffffffffffaa00
	swapa	[%i6+%o5]0x88,%l7	! %l7 = 0000000061000000
!	%f0  = 2dc9d5ff ff000000 00000000 0000002d
!	%f4  = ff0009e0 8aa63b93 00000000 745b00ff
!	%f8  = 00000000 6a090251 ff000053 b722486b
!	%f12 = 4b9a26a4 000009e0 12ba6ace d66d7210
	stda	%f0,[%i2]ASI_BLK_AIUSL	! Block Store to 0000000030081400
!	%f22 = 9b7db159, Mem[0000000030041400] = 00000000
	sta	%f22,[%i1+%g0]0x89	! Mem[0000000030041400] = 9b7db159
!	%f22 = 9b7db159 00003054, %l5 = 00000000e0090000
!	Mem[00000000100c1408] = 0000000061000000
	add	%i3,0x008,%g1
	stda	%f22,[%g1+%l5]ASI_PST32_P ! Mem[00000000100c1408] = 0000000061000000
!	%l4 = 0000000000000000, Mem[0000000010181400] = 0e056cf2
	stba	%l4,[%i6+%g0]0x88	! Mem[0000000010181400] = 0e056c00
!	Mem[0000000010041408] = 53000000, %l7 = 0000000061000000
	swapa	[%i1+%o4]0x88,%l7	! %l7 = 0000000053000000
!	%f20 = ffd5c92d 170f8656, %l0 = 0000000066a20041
!	Mem[0000000030181400] = 4b9a26a400000032
	stda	%f20,[%i6+%l0]ASI_PST32_S ! Mem[0000000030181400] = 4b9a26a4170f8656
	membar	#Sync			! Added by membar checker (18)
!	%f29 = ce4e00ff, Mem[0000000030001408] = b7225fff
	sta	%f29,[%i0+%o4]0x89	! Mem[0000000030001408] = ce4e00ff
!	Mem[0000000010001424] = 628d28db, %l5 = 00000000e0090000
	swap	[%i0+0x024],%l5		! %l5 = 00000000628d28db
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = aa2effe500000000, %l4 = 0000000000000000
	ldxa	[%i4+%g0]0x80,%l4	! %l4 = aa2effe500000000

p0_label_123:
!	Mem[00000000201c0000] = 0056e0d4, %l4 = aa2effe500000000
	lduh	[%o0+%g0],%l4		! %l4 = 0000000000000056
!	Mem[0000000010081400] = ff5e0000, %l7 = 0000000053000000
	ldsba	[%i2+%g0]0x80,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000030001408] = ff004ecef4048912, %l4 = 0000000000000056
	ldxa	[%i0+%o4]0x81,%l4	! %l4 = ff004ecef4048912
!	Mem[0000000030041408] = eb3500aa, %f29 = ce4e00ff
	lda	[%i1+%o4]0x89,%f29	! %f29 = eb3500aa
!	%l4 = ff004ecef4048912, %l3 = ffffffffffffffff, %l1 = 0000000000000000
	xor	%l4,%l3,%l1		! %l1 = 00ffb1310bfb76ed
!	Mem[0000000030081400] = 000000ff ffd5c92d 2d000000 00000000
!	Mem[0000000030081410] = 933ba68a e00900ff ff005b74 00000000
!	Mem[0000000030081420] = 5102096a 00000000 6b4822b7 530000ff
!	Mem[0000000030081430] = e0090000 a4269a4b 10726dd6 ce6aba12
	ldda	[%i2]ASI_BLK_AIUSL,%f0	! Block Load from 0000000030081400
!	Mem[0000000030001400] = ff000000, %f22 = 9b7db159
	lda	[%i0+%g0]0x81,%f22	! %f22 = ff000000
!	Mem[0000000010081400] = ff5e0000, %l4 = ff004ecef4048912
	ldswa	[%i2+%g0]0x80,%l4	! %l4 = ffffffffff5e0000
!	Mem[0000000030041410] = 185dc333ce4e00ff, %l5 = 00000000628d28db
	ldxa	[%i1+%o5]0x89,%l5	! %l5 = 185dc333ce4e00ff
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (19)
!	%l6 = 0e056cff, %l7 = ffffffff, Mem[0000000030081410] = 933ba68a e00900ff
	stda	%l6,[%i2+%o5]0x81	! Mem[0000000030081410] = 0e056cff ffffffff

p0_label_124:
!	%l0 = 0000000066a20041, Mem[0000000030141410] = 2f03b05c
	stha	%l0,[%i5+%o5]0x81	! Mem[0000000030141410] = 0041b05c
!	%f8  = 00000000, %f15 = d66d7210, %f2  = 00000000
	fadds	%f8 ,%f15,%f2 		! %f2  = d66d7210
!	%l1 = 00ffb1310bfb76ed, Mem[0000000010041410] = 6cf2ffff
	stba	%l1,[%i1+%o5]0x80	! Mem[0000000010041410] = edf2ffff
!	Mem[0000000030081410] = 0e056cff, %l5 = 185dc333ce4e00ff
	swapa	[%i2+%o5]0x81,%l5	! %l5 = 000000000e056cff
!	%l5 = 000000000e056cff, Mem[0000000010101410] = 00000000
	stwa	%l5,[%i4+%o5]0x80	! Mem[0000000010101410] = 0e056cff
!	Mem[0000000010141408] = 2d000000, %l2 = cc72256256860dd4
	ldstuba	[%i5+%o4]0x80,%l2	! %l2 = 0000002d000000ff
!	Mem[0000000010141400] = 170f8656, %l7 = ffffffffffffffff
	swapa	[%i5+%g0]0x80,%l7	! %l7 = 00000000170f8656
!	%l7 = 00000000170f8656, Mem[0000000010001410] = ff5f22b7
	stha	%l7,[%i0+%o5]0x80	! Mem[0000000010001410] = 865622b7
!	%l7 = 00000000170f8656, Mem[0000000010101408] = cc722562
	stwa	%l7,[%i4+%o4]0x80	! Mem[0000000010101408] = 170f8656
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = ffd5c92d, %l7 = 00000000170f8656
	ldsba	[%i0+%g0]0x88,%l7	! %l7 = 000000000000002d

p0_label_125:
!	Mem[00000000100c1438] = 1efcd590, %l5 = 000000000e056cff
	ldsh	[%i3+0x038],%l5		! %l5 = 0000000000001efc
!	Mem[00000000100c1408] = 00000061 00000000, %l0 = 66a20041, %l1 = 0bfb76ed
	ldda	[%i3+%o4]0x88,%l0	! %l0 = 0000000000000000 0000000000000061
!	Mem[0000000010001410] = 865622b7, %l7 = 000000000000002d
	ldsba	[%i0+0x010]%asi,%l7	! %l7 = ffffffffffffff86
!	Mem[0000000030081410] = ce4e00ff, %l0 = 0000000000000000
	lduwa	[%i2+%o5]0x81,%l0	! %l0 = 00000000ce4e00ff
!	Mem[00000000100c1408] = 00000000, %l4 = ffffffffff5e0000
	lduh	[%i3+0x00a],%l4		! %l4 = 0000000000000000
!	Mem[0000000030081400] = ff000000, %l5 = 0000000000001efc
	ldsba	[%i2+%g0]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000030101410] = beff5d9a56860dd4, %f24 = 772efcfd 31bca391
	ldda	[%i4+%o5]0x89,%f24	! %f24 = beff5d9a 56860dd4
!	Mem[0000000010001408] = 4100a266, %l2 = 000000000000002d
	ldswa	[%i0+%o4]0x88,%l2	! %l2 = 000000004100a266
!	Mem[0000000010101400] = aa2effe5, %l3 = ffffffffffffffff
	lduba	[%i4+%g0]0x80,%l3	! %l3 = 00000000000000aa
!	Starting 10 instruction Store Burst
!	Mem[0000000020800040] = ff4d0596, %l0 = 00000000ce4e00ff
	ldstub	[%o1+0x040],%l0		! %l0 = 000000ff000000ff

p0_label_126:
!	Mem[00000000218000c1] = ff9bafd4, %l6 = 000000000e056cff
	ldstuba	[%o3+0x0c1]%asi,%l6	! %l6 = 0000009b000000ff
!	Mem[0000000010081400] = 00005eff, %l4 = 0000000000000000
	swapa	[%i2+%g0]0x88,%l4	! %l4 = 0000000000005eff
!	%f2  = d66d7210, Mem[00000000100c1410] = e0090000
	sta	%f2 ,[%i3+%o5]0x80	! Mem[00000000100c1410] = d66d7210
!	%l6 = 000000000000009b, Mem[0000000010041408] = 61000000
	stha	%l6,[%i1+%o4]0x88	! Mem[0000000010041408] = 6100009b
!	%l0 = 00000000000000ff, %l4 = 0000000000005eff, %y  = e5ff2eaa
	umul	%l0,%l4,%l7		! %l7 = 00000000005ea001, %y = 00000000
!	%l3 = 00000000000000aa, Mem[0000000030141400] = aa2effe5
	stwa	%l3,[%i5+%g0]0x81	! Mem[0000000030141400] = 000000aa
!	%l0 = 00000000000000ff, Mem[00000000300c1408] = 00000000745b00ff
	stxa	%l0,[%i3+%o4]0x89	! Mem[00000000300c1408] = 00000000000000ff
!	%f14 = 12ba6ace d66d7210, Mem[0000000010041408] = 6100009b 00000000
	stda	%f14,[%i1+%o4]0x88	! Mem[0000000010041408] = 12ba6ace d66d7210
!	Mem[0000000030101408] = 84e63019, %l2 = 000000004100a266
	swapa	[%i4+%o4]0x89,%l2	! %l2 = 0000000084e63019
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = 8ff4bef7, %l0 = 00000000000000ff
	ldswa	[%i4+%g0]0x89,%l0	! %l0 = ffffffff8ff4bef7

p0_label_127:
!	Mem[0000000010101434] = 3357ee94, %l0 = ffffffff8ff4bef7
	ldsb	[%i4+0x036],%l0		! %l0 = ffffffffffffffee
!	Mem[00000000211c0000] = 00004340, %l2 = 0000000084e63019
	ldsh	[%o2+%g0],%l2		! %l2 = 0000000000000000
!	%l1 = 0000000000000061, immd = fffffffffffff460, %l2 = 0000000000000000
	udivx	%l1,-0xba0,%l2		! %l2 = 0000000000000000
!	Mem[00000000100c1410] = 10726dd6, %l3 = 00000000000000aa
	lduba	[%i3+%o5]0x88,%l3	! %l3 = 00000000000000d6
!	Mem[0000000030141400] = 000000aa00000000, %f2  = d66d7210 0000002d
	ldda	[%i5+%g0]0x81,%f2 	! %f2  = 000000aa 00000000
!	Mem[0000000010181438] = 672e0378, %l2 = 0000000000000000
	ldsw	[%i6+0x038],%l2		! %l2 = 00000000672e0378
!	Mem[0000000030001408] = ff004ecef4048912, %l0 = ffffffffffffffee
	ldxa	[%i0+%o4]0x81,%l0	! %l0 = ff004ecef4048912
!	Mem[00000000100c1438] = 1efcd590, %l0 = ff004ecef4048912
	ldsha	[%i3+0x038]%asi,%l0	! %l0 = 0000000000001efc
!	Mem[0000000010181408] = 0000d45e, %f31 = b7225fff
	lda	[%i6+%o4]0x80,%f31	! %f31 = 0000d45e
!	Starting 10 instruction Store Burst
!	%f28 = 185dc333 eb3500aa, Mem[0000000010081408] = 0e056cff ff000053
	stda	%f28,[%i2+%o4]0x88	! Mem[0000000010081408] = 185dc333 eb3500aa

p0_label_128:
!	%l6 = 000000000000009b, Mem[00000000211c0001] = 00004340
	stb	%l6,[%o2+0x001]		! Mem[00000000211c0000] = 009b4340
!	%l3 = 00000000000000d6, Mem[0000000010081408] = aa0035eb
	stwa	%l3,[%i2+%o4]0x80	! Mem[0000000010081408] = 000000d6
!	%l6 = 0000009b, %l7 = 005ea001, Mem[0000000010001418] = 00000000 ff000000
	std	%l6,[%i0+0x018]		! Mem[0000000010001418] = 0000009b 005ea001
!	%l3 = 00000000000000d6, Mem[0000000010041410] = edf2ffff
	stba	%l3,[%i1+%o5]0x80	! Mem[0000000010041410] = d6f2ffff
!	Mem[00000000218000c0] = ffffafd4, %l4 = 0000000000005eff
	ldstuba	[%o3+0x0c0]%asi,%l4	! %l4 = 000000ff000000ff
!	Mem[0000000030181410] = 2f03bcd6, %l3 = 00000000000000d6
	swapa	[%i6+%o5]0x81,%l3	! %l3 = 000000002f03bcd6
!	%f15 = d66d7210, Mem[00000000100c1408] = 00000000
	sta	%f15,[%i3+%o4]0x80	! Mem[00000000100c1408] = d66d7210
!	%f26 = b52df303 d6bc032f, %l5 = 0000000000000000
!	Mem[00000000100c1438] = 1efcd590ce6aba12
	add	%i3,0x038,%g1
	stda	%f26,[%g1+%l5]ASI_PST16_PL ! Mem[00000000100c1438] = 1efcd590ce6aba12
!	Mem[0000000010141430] = 4b9a26a4, %l0 = 00001efc, %l6 = 0000009b
	add	%i5,0x30,%g1
	casa	[%g1]0x80,%l0,%l6	! %l6 = 000000004b9a26a4
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = ff000000, %l1 = 0000000000000061
	lduha	[%i3+%g0]0x89,%l1	! %l1 = 0000000000000000

p0_label_129:
!	Mem[0000000010081410] = 00000000, %l3 = 000000002f03bcd6
	ldswa	[%i2+%o5]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000010001400] = 00000000ffd5c92d, %l2 = 00000000672e0378
	ldxa	[%i0+%g0]0x88,%l2	! %l2 = 00000000ffd5c92d
!	Mem[0000000010041408] = 10726dd6ce6aba12, %f18 = ff5f22b7 f4048912
	ldda	[%i1+%o4]0x80,%f18	! %f18 = 10726dd6 ce6aba12
!	Mem[0000000030001410] = 72000000ffffffaa, %l5 = 0000000000000000
	ldxa	[%i0+%o5]0x89,%l5	! %l5 = 72000000ffffffaa
!	Mem[0000000030081410] = ce4e00ff, %l1 = 0000000000000000
	ldswa	[%i2+%o5]0x81,%l1	! %l1 = ffffffffce4e00ff
!	Mem[0000000010081400] = 00000000, %l4 = 00000000000000ff
	ldswa	[%i2+%g0]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000030081408] = 2d000000, %l1 = ffffffffce4e00ff
	lduba	[%i2+%o4]0x81,%l1	! %l1 = 000000000000002d
!	Mem[0000000010001400] = ffd5c92d, %l2 = 00000000ffd5c92d
	lduha	[%i0+%g0]0x88,%l2	! %l2 = 000000000000c92d
!	Mem[00000000300c1408] = ff00000000000000, %f22 = ff000000 00003054
	ldda	[%i3+%o4]0x81,%f22	! %f22 = ff000000 00000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010001408] = 4100a266, %l3 = 0000000000000000
	ldstuba	[%i0+%o4]0x88,%l3	! %l3 = 00000066000000ff

p0_label_130:
!	Mem[0000000030181410] = 000000d6, %l0 = 0000000000001efc
	ldstuba	[%i6+%o5]0x81,%l0	! %l0 = 00000000000000ff
!	%l5 = 72000000ffffffaa, Mem[0000000030001400] = ff00000000000000
	stxa	%l5,[%i0+%g0]0x81	! Mem[0000000030001400] = 72000000ffffffaa
!	%f4  = ff0009e0 8aa63b93, %l1 = 000000000000002d
!	Mem[00000000300c1418] = 9914c0339da7051e
	add	%i3,0x018,%g1
	stda	%f4,[%g1+%l1]ASI_PST32_S ! Mem[00000000300c1418] = 9914c0338aa63b93
!	Mem[0000000030181410] = ff0000d6, %l5 = 72000000ffffffaa
	ldstuba	[%i6+%o5]0x81,%l5	! %l5 = 000000ff000000ff
!	Mem[00000000300c1400] = ff000000, %l4 = 0000000000000000
	ldstuba	[%i3+%g0]0x89,%l4	! %l4 = 00000000000000ff
!	%f2  = 000000aa 00000000, %l4 = 0000000000000000
!	Mem[0000000010101410] = 0e056cff6a090251
	add	%i4,0x010,%g1
	stda	%f2,[%g1+%l4]ASI_PST32_PL ! Mem[0000000010101410] = 0e056cff6a090251
!	%l7 = 00000000005ea001, Mem[0000000030141400] = aa000000
	stba	%l7,[%i5+%g0]0x89	! Mem[0000000030141400] = aa000001
!	Mem[0000000030041408] = aa0035eb, %l6 = 000000004b9a26a4
	ldstuba	[%i1+%o4]0x81,%l6	! %l6 = 000000aa000000ff
!	%l2 = 0000c92d, %l3 = 00000066, Mem[00000000300c1410] = ffffff00 933ba68a
	stda	%l2,[%i3+%o5]0x89	! Mem[00000000300c1410] = 0000c92d 00000066
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = ff0000ff, %l5 = 00000000000000ff
	lduba	[%i3+%g0]0x81,%l5	! %l5 = 00000000000000ff

p0_label_131:
!	Mem[000000001008142c] = 000000ff, %l2 = 000000000000c92d
	lduha	[%i2+0x02e]%asi,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030041410] = ce4e00ff, %l7 = 00000000005ea001
	lduwa	[%i1+%o5]0x89,%l7	! %l7 = 00000000ce4e00ff
!	Mem[0000000030081410] = ce4e00ff ffffffff, %l6 = 000000aa, %l7 = ce4e00ff
	ldda	[%i2+%o5]0x81,%l6	! %l6 = 00000000ce4e00ff 00000000ffffffff
!	Mem[0000000010001408] = ffa20041, %l4 = 0000000000000000
	ldsba	[%i0+%o4]0x80,%l4	! %l4 = ffffffffffffffff
!	Mem[00000000300c1410] = 2dc90000, %l3 = 0000000000000066
	lduha	[%i3+%o5]0x81,%l3	! %l3 = 0000000000002dc9
!	Mem[0000000030081410] = ce4e00ff, %l6 = 00000000ce4e00ff
	ldsba	[%i2+%o5]0x81,%l6	! %l6 = ffffffffffffffce
!	Mem[0000000030041410] = ff004ece33c35d18, %l4 = ffffffffffffffff
	ldxa	[%i1+%o5]0x81,%l4	! %l4 = ff004ece33c35d18
!	Mem[0000000030141408] = 00000000, %l7 = 00000000ffffffff
	ldsha	[%i5+%o4]0x89,%l7	! %l7 = 0000000000000000
!	Mem[00000000201c0000] = 0056e0d4, %l5 = 00000000000000ff
	lduh	[%o0+%g0],%l5		! %l5 = 0000000000000056
!	Starting 10 instruction Store Burst
!	Mem[0000000010181428] = 672e0378, %l3 = 0000000000002dc9
	swap	[%i6+0x028],%l3		! %l3 = 00000000672e0378

p0_label_132:
!	%f22 = ff000000, Mem[00000000300c1400] = ff0000ff
	sta	%f22,[%i3+%g0]0x81	! Mem[00000000300c1400] = ff000000
!	%l1 = 000000000000002d, Mem[0000000010001400] = ffd5c92d
	stwa	%l1,[%i0+%g0]0x88	! Mem[0000000010001400] = 0000002d
!	Mem[0000000021800041] = 000275ef, %l0 = 0000000000000000
	ldstub	[%o3+0x041],%l0		! %l0 = 00000002000000ff
!	%l4 = 33c35d18, %l5 = 00000056, Mem[0000000010001410] = b7225686 128904f4
	stda	%l4,[%i0+%o5]0x88	! Mem[0000000010001410] = 33c35d18 00000056
!	%l0 = 00000002, %l1 = 0000002d, Mem[00000000100c1408] = 10726dd6 00000061
	stda	%l0,[%i3+%o4]0x88	! Mem[00000000100c1408] = 00000002 0000002d
!	%l7 = 0000000000000000, Mem[00000000100c1400] = 61000000
	stwa	%l7,[%i3+%g0]0x80	! Mem[00000000100c1400] = 00000000
!	Mem[0000000030101410] = d40d8656, %l7 = 0000000000000000
	swapa	[%i4+%o5]0x81,%l7	! %l7 = 00000000d40d8656
!	%l3 = 00000000672e0378, Mem[0000000010001400] = 000000000000002d
	stxa	%l3,[%i0+%g0]0x88	! Mem[0000000010001400] = 00000000672e0378
!	%f2  = 000000aa, Mem[0000000010141418] = 78c55430
	st	%f2 ,[%i5+0x018]	! Mem[0000000010141418] = 000000aa
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = 00000000, %l7 = 00000000d40d8656
	lduha	[%i3+%g0]0x88,%l7	! %l7 = 0000000000000000

p0_label_133:
!	Mem[0000000030181408] = 00000000beff5d9a, %l2 = 00000000000000ff
	ldxa	[%i6+%o4]0x81,%l2	! %l2 = 00000000beff5d9a
!	%f19 = ce6aba12, %f9  = 6a090251
	fcmpes	%fcc3,%f19,%f9 		! %fcc3 = 1
!	Mem[0000000010101400] = e5ff2eaa, %l0 = 0000000000000002
	lduha	[%i4+%g0]0x88,%l0	! %l0 = 0000000000002eaa
!	Mem[0000000030101408] = 66a20041, %l6 = ffffffffffffffce
	lduwa	[%i4+%o4]0x81,%l6	! %l6 = 0000000066a20041
!	Mem[0000000030141410] = b52df3035cb04100, %f6  = 00000000 745b00ff
	ldda	[%i5+%o5]0x89,%f6 	! %f6  = b52df303 5cb04100
!	Mem[0000000030001400] = aaffffff00000072, %f24 = beff5d9a 56860dd4
	ldda	[%i0+%g0]0x89,%f24	! %f24 = aaffffff 00000072
!	Mem[0000000010101400] = e5ff2eaa, %l4 = ff004ece33c35d18
	ldswa	[%i4+%g0]0x88,%l4	! %l4 = ffffffffe5ff2eaa
!	Mem[00000000201c0000] = 0056e0d4, %l5 = 0000000000000056
	ldsba	[%o0+0x000]%asi,%l5	! %l5 = 0000000000000000
!	Code Fragment 3
p0_fragment_17:
!	%l0 = 0000000000002eaa
	setx	0xcc33ed2fde354dd4,%g7,%l0 ! %l0 = cc33ed2fde354dd4
!	%l1 = 000000000000002d
	setx	0x0f1d1f00593d6d69,%g7,%l1 ! %l1 = 0f1d1f00593d6d69
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = cc33ed2fde354dd4
	setx	0x172011c861f9a597,%g7,%l0 ! %l0 = 172011c861f9a597
!	%l1 = 0f1d1f00593d6d69
	setx	0x8d52416005951f31,%g7,%l1 ! %l1 = 8d52416005951f31
!	Starting 10 instruction Store Burst
!	Mem[0000000030081400] = 000000ff, %l7 = 0000000000000000
	swapa	[%i2+%g0]0x81,%l7	! %l7 = 00000000000000ff

p0_label_134:
!	Mem[0000000010081400] = 00000000, %l3 = 672e0378, %l0 = 61f9a597
	casa	[%i2]0x80,%l3,%l0	! %l0 = 0000000000000000
!	%l4 = e5ff2eaa, %l5 = 00000000, Mem[0000000010101408] = 170f8656 56860dd4
	stda	%l4,[%i4+%o4]0x80	! Mem[0000000010101408] = e5ff2eaa 00000000
!	Mem[0000000030141400] = aa000001, %l4 = ffffffffe5ff2eaa
	ldstuba	[%i5+%g0]0x89,%l4	! %l4 = 00000001000000ff
!	%l4 = 0000000000000001, Mem[0000000030141410] = 0041b05c03f32db5
	stxa	%l4,[%i5+%o5]0x81	! Mem[0000000030141410] = 0000000000000001
!	%f8  = 00000000 6a090251, %l5 = 0000000000000000
!	Mem[0000000030101430] = 92df3465715a3ea5
	add	%i4,0x030,%g1
	stda	%f8,[%g1+%l5]ASI_PST32_S ! Mem[0000000030101430] = 92df3465715a3ea5
!	%l3 = 00000000672e0378, Mem[000000001018141e] = 8aa63b93, %asi = 80
	stba	%l3,[%i6+0x01e]%asi	! Mem[000000001018141c] = 8aa67893
!	Mem[0000000010181418] = 0dbd8189, %l4 = 00000001, %l2 = beff5d9a
	add	%i6,0x18,%g1
	casa	[%g1]0x80,%l4,%l2	! %l2 = 000000000dbd8189
!	%l6 = 0000000066a20041, Mem[0000000030001410] = ffffffaa
	stba	%l6,[%i0+%o5]0x89	! Mem[0000000030001410] = ffffff41
!	Mem[000000001004141c] = 000000ff, %l0 = 0000000000000000, %asi = 80
	swapa	[%i1+0x01c]%asi,%l0	! %l0 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = ce4e5d9a, %f14 = 12ba6ace
	lda	[%i5+%o5]0x88,%f14	! %f14 = ce4e5d9a

p0_label_135:
!	Mem[0000000010041420] = 772efcfd00000062, %f22 = ff000000 00000000
	ldd	[%i1+0x020],%f22	! %f22 = 772efcfd 00000062
!	Mem[0000000030081400] = 00000000, %l6 = 0000000066a20041
	ldsha	[%i2+%g0]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000030001410] = 41ffffff00000072, %l3 = 00000000672e0378
	ldxa	[%i0+%o5]0x81,%l3	! %l3 = 41ffffff00000072
!	Mem[0000000010001400] = 78032e67, %l5 = 0000000000000000
	lduha	[%i0+%g0]0x80,%l5	! %l5 = 0000000000007803
!	Mem[0000000010181410] = 00aaffff185dc333, %f8  = 00000000 6a090251
	ldda	[%i6+%o5]0x80,%f8 	! %f8  = 00aaffff 185dc333
!	Mem[0000000030141400] = ff0000aa, %l1 = 8d52416005951f31
	lduwa	[%i5+%g0]0x81,%l1	! %l1 = 00000000ff0000aa
!	Code Fragment 4
p0_fragment_18:
!	%l0 = 00000000000000ff
	setx	0x7977c46821c001ee,%g7,%l0 ! %l0 = 7977c46821c001ee
!	%l1 = 00000000ff0000aa
	setx	0x0a3efea86ae0bea2,%g7,%l1 ! %l1 = 0a3efea86ae0bea2
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 7977c46821c001ee
	setx	0x4ebeced8593b2253,%g7,%l0 ! %l0 = 4ebeced8593b2253
!	%l1 = 0a3efea86ae0bea2
	setx	0xc5347b3f8ea7e180,%g7,%l1 ! %l1 = c5347b3f8ea7e180
!	Mem[0000000010081400] = 00000000, %l4 = 0000000000000001
	lduha	[%i2+%g0]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000030101408] = 4100a266, %l2 = 000000000dbd8189
	ldsha	[%i4+%o4]0x89,%l2	! %l2 = ffffffffffffa266
!	Starting 10 instruction Store Burst
!	%l4 = 00000000, %l5 = 00007803, Mem[0000000010041410] = fffff2d6 000000ff
	stda	%l4,[%i1+%o5]0x88	! Mem[0000000010041410] = 00000000 00007803

p0_label_136:
!	Mem[00000000100c1430] = 90d5fc1e, %l7 = 000000ff, %l4 = 00000000
	add	%i3,0x30,%g1
	casa	[%g1]0x80,%l7,%l4	! %l4 = 0000000090d5fc1e
!	Mem[0000000010181426] = eafcea4a, %l7 = 00000000000000ff
	ldstuba	[%i6+0x026]%asi,%l7	! %l7 = 000000ea000000ff
!	%l2 = ffffa266, %l3 = 00000072, Mem[00000000100c1410] = 10726dd6 00000000
	stda	%l2,[%i3+%o5]0x88	! Mem[00000000100c1410] = ffffa266 00000072
!	Mem[00000000211c0000] = 009b4340, %l5 = 0000000000007803
	ldstub	[%o2+%g0],%l5		! %l5 = 00000000000000ff
!	%l2 = ffffffffffffa266, Mem[00000000201c0000] = 0056e0d4
	sth	%l2,[%o0+%g0]		! Mem[00000000201c0000] = a266e0d4
!	%l3 = 41ffffff00000072, Mem[0000000010041404] = 9a5dffbe
	stw	%l3,[%i1+0x004]		! Mem[0000000010041404] = 00000072
!	%f18 = 10726dd6 ce6aba12, %l2 = ffffffffffffa266
!	Mem[0000000030001400] = 72000000ffffffaa
	stda	%f18,[%i0+%l2]ASI_PST16_S ! Mem[0000000030001400] = 72006dd6ce6affaa
!	%l6 = 0000000000000000, Mem[0000000010001400] = 78032e67
	stba	%l6,[%i0+%g0]0x80	! Mem[0000000010001400] = 00032e67
!	Mem[0000000030101410] = 00000000, %l5 = 0000000000000000
	ldstuba	[%i4+%o5]0x89,%l5	! %l5 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = 10726dd6, %l6 = 0000000000000000
	lduba	[%i1+%o4]0x80,%l6	! %l6 = 0000000000000010

p0_label_137:
!	Mem[0000000010101400] = e5ff2eaa, %l0 = 4ebeced8593b2253
	ldsha	[%i4+%g0]0x88,%l0	! %l0 = 0000000000002eaa
!	Mem[0000000030041400] = 59b17d9b, %l7 = 00000000000000ea
	ldswa	[%i1+%g0]0x81,%l7	! %l7 = 0000000059b17d9b
!	Mem[00000000300c1400] = 000000ff, %l3 = 41ffffff00000072
	lduwa	[%i3+%g0]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010041408] = d66d7210, %l7 = 0000000059b17d9b
	ldsha	[%i1+%o4]0x88,%l7	! %l7 = 0000000000007210
!	Mem[0000000010181400] = 006c050e 00000000, %l0 = 00002eaa, %l1 = 8ea7e180
	ldda	[%i6+%g0]0x80,%l0	! %l0 = 00000000006c050e 0000000000000000
!	%l7 = 0000000000007210, imm = 0000000000000588, %l3 = 00000000000000ff
	or	%l7,0x588,%l3		! %l3 = 0000000000007798
!	Mem[0000000010001410] = 185dc333, %l7 = 0000000000007210
	ldswa	[%i0+%o5]0x80,%l7	! %l7 = 00000000185dc333
!	Mem[0000000010101410] = ff6c050e, %l5 = 0000000000000000
	lduha	[%i4+%o5]0x88,%l5	! %l5 = 000000000000050e
!	%l3 = 0000000000007798, imm = fffffffffffff097, %l2 = ffffffffffffa266
	andn	%l3,-0xf69,%l2		! %l2 = 0000000000000708
!	Starting 10 instruction Store Burst
!	%l6 = 00000010, %l7 = 185dc333, Mem[00000000300c1408] = ff000000 00000000
	stda	%l6,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00000010 185dc333

p0_label_138:
!	%l6 = 00000010, %l7 = 185dc333, Mem[00000000300c1410] = 0000c92d 00000066
	stda	%l6,[%i3+%o5]0x89	! Mem[00000000300c1410] = 00000010 185dc333
!	%l4 = 90d5fc1e, %l5 = 0000050e, Mem[0000000010081400] = 00000000 8aa63b93
	stda	%l4,[%i2+%g0]0x80	! Mem[0000000010081400] = 90d5fc1e 0000050e
!	%f10 = ff000053 b722486b, Mem[0000000030081408] = 0000002d 00000000
	stda	%f10,[%i2+%o4]0x89	! Mem[0000000030081408] = ff000053 b722486b
!	Mem[0000000010141408] = ff000000, %l4 = 0000000090d5fc1e, %asi = 80
	swapa	[%i5+0x008]%asi,%l4	! %l4 = 00000000ff000000
!	Mem[0000000030001410] = 41ffffff, %l0 = 00000000006c050e
	swapa	[%i0+%o5]0x81,%l0	! %l0 = 0000000041ffffff
!	Mem[0000000010001408] = ffa20041, %l7 = 00000000185dc333
	ldstuba	[%i0+%o4]0x80,%l7	! %l7 = 000000ff000000ff
!	Mem[000000001010143a] = 8590b023, %l6 = 0000000000000010
	ldstuba	[%i4+0x03a]%asi,%l6	! %l6 = 000000b0000000ff
!	%l7 = 00000000000000ff, Mem[0000000030001408] = ff004ecef4048912
	stxa	%l7,[%i0+%o4]0x81	! Mem[0000000030001408] = 00000000000000ff
!	%l4 = ff000000, %l5 = 0000050e, Mem[0000000030041408] = eb3500ff 002efc1d
	stda	%l4,[%i1+%o4]0x89	! Mem[0000000030041408] = ff000000 0000050e
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = 185dc333ce4e00ff, %f24 = aaffffff 00000072
	ldda	[%i1+%o5]0x89,%f24	! %f24 = 185dc333 ce4e00ff

p0_label_139:
!	Mem[0000000010101410] = 0e056cff, %f22 = 772efcfd
	lda	[%i4+%o5]0x80,%f22	! %f22 = 0e056cff
!	Mem[0000000030041400] = 59b17d9b d4fbebce, %l4 = ff000000, %l5 = 0000050e
	ldda	[%i1+%g0]0x81,%l4	! %l4 = 0000000059b17d9b 00000000d4fbebce
!	Mem[00000000300c1400] = 000000ff, %l0 = 0000000041ffffff
	ldsba	[%i3+%g0]0x89,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000030041408] = 000000ff0e050000, %f22 = 0e056cff 00000062
	ldda	[%i1+%o4]0x81,%f22	! %f22 = 000000ff 0e050000
!	Mem[0000000020800040] = ff4d0596, %l4 = 0000000059b17d9b
	lduh	[%o1+0x040],%l4		! %l4 = 000000000000ff4d
!	Mem[00000000211c0000] = ff9b4340, %l4 = 000000000000ff4d
	lduba	[%o2+0x001]%asi,%l4	! %l4 = 000000000000009b
!	Mem[0000000010101400] = aa2effe5 00000000, %l0 = ffffffff, %l1 = 00000000
	ldda	[%i4+%g0]0x80,%l0	! %l0 = 00000000aa2effe5 0000000000000000
!	Mem[00000000100c1400] = 00000000, %l1 = 0000000000000000
	ldsha	[%i3+%g0]0x80,%l1	! %l1 = 0000000000000000
!	Mem[00000000100c1410] = 00000072ffffa266, %l0 = 00000000aa2effe5
	ldxa	[%i3+%o5]0x88,%l0	! %l0 = 00000072ffffa266
!	Starting 10 instruction Store Burst
!	%l0 = ffffa266, %l1 = 00000000, Mem[0000000030101408] = 66a20041 9c3bafe9
	stda	%l0,[%i4+%o4]0x81	! Mem[0000000030101408] = ffffa266 00000000

p0_label_140:
!	%l6 = 00000000000000b0, Mem[00000000100c1422] = 56860ff5
	sth	%l6,[%i3+0x022]		! Mem[00000000100c1420] = 568600b0
!	Mem[0000000010001418] = 0000009b, %l1 = 0000000000000000, %asi = 80
	swapa	[%i0+0x018]%asi,%l1	! %l1 = 000000000000009b
!	Mem[0000000030001408] = 00000000, %l7 = 00000000000000ff
	swapa	[%i0+%o4]0x81,%l7	! %l7 = 0000000000000000
!	%l5 = 00000000d4fbebce, Mem[0000000010001408] = 4100a2ff
	stwa	%l5,[%i0+%o4]0x88	! Mem[0000000010001408] = d4fbebce
!	%f30 = f7bef48f, Mem[0000000030081410] = ff004ece
	sta	%f30,[%i2+%o5]0x89	! Mem[0000000030081410] = f7bef48f
!	%l0 = 00000072ffffa266, Mem[0000000030101410] = ff000000
	stba	%l0,[%i4+%o5]0x81	! Mem[0000000030101410] = 66000000
!	%l1 = 000000000000009b, Mem[0000000010101410] = ff6c050e
	stha	%l1,[%i4+%o5]0x88	! Mem[0000000010101410] = ff6c009b
!	Mem[0000000010041424] = 00000062, %l6 = 00000000000000b0, %asi = 80
	swapa	[%i1+0x024]%asi,%l6	! %l6 = 0000000000000062
!	%l4 = 000000000000009b, Mem[0000000030101408] = ffffa266
	stba	%l4,[%i4+%o4]0x81	! Mem[0000000030101408] = 9bffa266
!	Starting 10 instruction Load Burst
!	Mem[000000001014141c] = 7eee8d5c, %l4 = 000000000000009b
	lduwa	[%i5+0x01c]%asi,%l4	! %l4 = 000000007eee8d5c

p0_label_141:
!	Mem[00000000100c1400] = 00000000, %l5 = 00000000d4fbebce
	ldswa	[%i3+%g0]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000010001400] = 672e0300, %l5 = 0000000000000000
	lduwa	[%i0+%g0]0x88,%l5	! %l5 = 00000000672e0300
!	Mem[0000000020800000] = ffff8b5d, %l1 = 000000000000009b
	lduha	[%o1+0x000]%asi,%l1	! %l1 = 000000000000ffff
!	%l1 = 000000000000ffff, immed = 000001a7, %y  = 00000000
	sdiv	%l1,0x1a7,%l0		! %l0 = 000000000000009a
	mov	%l0,%y			! %y = 0000009a
!	Mem[0000000010041408] = d66d7210, %l5 = 00000000672e0300
	lduwa	[%i1+%o4]0x88,%l5	! %l5 = 00000000d66d7210
!	Mem[0000000030141400] = ff0000aa00000000, %f22 = 000000ff 0e050000
	ldda	[%i5+%g0]0x81,%f22	! %f22 = ff0000aa 00000000
!	%f13 = 000009e0, %f10 = ff000053
	fcmpes	%fcc3,%f13,%f10		! %fcc3 = 2
!	%f31 = 0000d45e, %f20 = ffd5c92d, %f28 = 185dc333
	fmuls	%f31,%f20,%f28		! %f28 = ffd5c92d
!	Mem[0000000010141400] = ffffffff, %l4 = 000000007eee8d5c
	ldswa	[%i5+%g0]0x88,%l4	! %l4 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l0 = 000000000000009a, imm = 0000000000000d1e, %l1 = 000000000000ffff
	xor	%l0,0xd1e,%l1		! %l1 = 0000000000000d84

p0_label_142:
!	Mem[0000000010081408] = d6000000, %l4 = ffffffffffffffff
	ldstuba	[%i2+%o4]0x88,%l4	! %l4 = 00000000000000ff
!	%l4 = 0000000000000000, Mem[0000000010181400] = 006c050e
	stwa	%l4,[%i6+%g0]0x80	! Mem[0000000010181400] = 00000000
!	Mem[00000000300c1410] = 00000010, %l1 = 0000000000000d84
	ldstuba	[%i3+%o5]0x89,%l1	! %l1 = 00000010000000ff
!	%l6 = 0000000000000062, %l2 = 0000000000000708, %l5  = 00000000d66d7210
	mulx	%l6,%l2,%l5		! %l5 = 000000000002b110
!	%l1 = 0000000000000010, Mem[0000000010081431] = 00ffa74c
	stb	%l1,[%i2+0x031]		! Mem[0000000010081430] = 0010a74c
!	Mem[0000000030041410] = ff004ece, %l0 = 000000000000009a
	ldstuba	[%i1+%o5]0x81,%l0	! %l0 = 000000ff000000ff
!	Mem[0000000010041400] = 56860dd4, %l0 = 00000000000000ff
	ldstuba	[%i1+%g0]0x88,%l0	! %l0 = 000000d4000000ff
!	Mem[0000000010081400] = 90d5fc1e, %l2 = 0000000000000708
	ldstuba	[%i2+%g0]0x80,%l2	! %l2 = 00000090000000ff
!	Mem[00000000100c1408] = 02000000, %l1 = 0000000000000010
	swapa	[%i3+%o4]0x80,%l1	! %l1 = 0000000002000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030181410] = d60000ff, %l2 = 0000000000000090
	lduha	[%i6+%o5]0x89,%l2	! %l2 = 00000000000000ff

p0_label_143:
!	Mem[0000000030141408] = 00000000, %l4 = 0000000000000000
	lduba	[%i5+%o4]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000010001400] = 00032e67, %l2 = 00000000000000ff
	lduw	[%i0+%g0],%l2		! %l2 = 0000000000032e67
!	Mem[0000000010101410] = 9b006cff, %l6 = 0000000000000062
	ldsha	[%i4+%o5]0x80,%l6	! %l6 = ffffffffffff9b00
!	Mem[00000000300c1410] = ff000000, %f7  = 5cb04100
	lda	[%i3+%o5]0x81,%f7 	! %f7 = ff000000
!	Mem[0000000030181408] = 00000000, %l5 = 000000000002b110
	ldsba	[%i6+%o4]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000030101400] = 8ff4bef7, %l4 = 0000000000000000
	ldsba	[%i4+%g0]0x89,%l4	! %l4 = fffffffffffffff7
!	Mem[0000000010181410] = 00aaffff, %l0 = 00000000000000d4
	ldsh	[%i6+%o5],%l0		! %l0 = 00000000000000aa
!	Mem[0000000010001410] = 0000005633c35d18, %f30 = f7bef48f 0000d45e
	ldda	[%i0+%o5]0x88,%f30	! %f30 = 00000056 33c35d18
!	Mem[0000000010001400] = 00032e67, %f18 = 10726dd6
	lda	[%i0+%g0]0x80,%f18	! %f18 = 00032e67
!	Starting 10 instruction Store Burst
!	Mem[0000000030181408] = 00000000, %l7 = 0000000000000000
	swapa	[%i6+%o4]0x89,%l7	! %l7 = 0000000000000000

p0_label_144:
!	Mem[0000000030141410] = 00000000, %l5 = 0000000000000000
	ldstuba	[%i5+%o5]0x81,%l5	! %l5 = 00000000000000ff
!	%l2 = 0000000000032e67, Mem[0000000010081400] = 1efcd5ff
	stwa	%l2,[%i2+%g0]0x88	! Mem[0000000010081400] = 00032e67
!	Mem[0000000010141410] = 9a5d4ece, %l5 = 0000000000000000
	ldstuba	[%i5+%o5]0x80,%l5	! %l5 = 0000009a000000ff
!	%f22 = ff0000aa 00000000, Mem[0000000030101408] = 9bffa266 00000000
	stda	%f22,[%i4+%o4]0x81	! Mem[0000000030101408] = ff0000aa 00000000
!	%l2 = 00032e67, %l3 = 00007798, Mem[0000000010001410] = 33c35d18 00000056
	stda	%l2,[%i0+%o5]0x88	! Mem[0000000010001410] = 00032e67 00007798
!	Mem[00000000300c1410] = 000000ff, %l5 = 000000000000009a
	swapa	[%i3+%o5]0x89,%l5	! %l5 = 00000000000000ff
!	%l7 = 0000000000000000, Mem[0000000010101408] = aa2effe5
	stwa	%l7,[%i4+%o4]0x88	! Mem[0000000010101408] = 00000000
!	Mem[0000000010081400] = 672e0300, %l6 = ffffffffffff9b00
	ldstuba	[%i2+%g0]0x80,%l6	! %l6 = 00000067000000ff
!	Mem[0000000010001400] = 672e0300, %l5 = 00000000000000ff
	ldstuba	[%i0+%g0]0x88,%l5	! %l5 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = f7bef48f, %l3 = 0000000000007798
	lduha	[%i4+%g0]0x81,%l3	! %l3 = 000000000000f7be

p0_label_145:
!	Mem[0000000010041430] = 8aa63b93 00003054, %l4 = fffffff7, %l5 = 00000000
	ldd	[%i1+0x030],%l4		! %l4 = 000000008aa63b93 0000000000003054
!	Mem[0000000010001400] = ff032e67, %l1 = 0000000002000000
	ldswa	[%i0+%g0]0x80,%l1	! %l1 = ffffffffff032e67
!	Mem[0000000010041410] = 00000000, %l4 = 000000008aa63b93
	lduba	[%i1+%o5]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000030181400] = a4269a4b, %f15 = d66d7210
	lda	[%i6+%g0]0x89,%f15	! %f15 = a4269a4b
!	Mem[00000000100c1408] = 00000010, %f31 = 33c35d18
	ld	[%i3+%o4],%f31	! %f31 = 00000010
!	Mem[0000000010081410] = 00000000, %l2 = 0000000000032e67
	lduwa	[%i2+%o5]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000030001408] = ff000000 ff000000, %l2 = 00000000, %l3 = 0000f7be
	ldda	[%i0+%o4]0x89,%l2	! %l2 = 00000000ff000000 00000000ff000000
!	%f4  = ff0009e0, %f12 = 4b9a26a4, %f20 = ffd5c92d 170f8656
	fsmuld	%f4 ,%f12,%f20		! %f20 = c9634651 0f64e000
!	Mem[0000000010001408] = d4fbebce, %l3 = 00000000ff000000
	lduba	[%i0+%o4]0x88,%l3	! %l3 = 00000000000000ce
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1408] = 00000010, %l5 = 0000000000003054
	swapa	[%i3+%o4]0x81,%l5	! %l5 = 0000000000000010

p0_label_146:
!	Mem[0000000030041408] = ff000000, %l1 = ffffffffff032e67
	ldstuba	[%i1+%o4]0x89,%l1	! %l1 = 00000000000000ff
!	%f8  = 00aaffff 185dc333, Mem[0000000010041400] = ff0d8656 00000072
	stda	%f8 ,[%i1+%g0]0x80	! Mem[0000000010041400] = 00aaffff 185dc333
!	Mem[0000000010181408] = 0000d45e, %l6 = 0000000000000067
	ldstuba	[%i6+%o4]0x80,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010181400] = 00000000, %l4 = 0000000000000000
	swapa	[%i6+%g0]0x80,%l4	! %l4 = 0000000000000000
!	%l4 = 0000000000000000, Mem[0000000030001400] = 72006dd6ce6affaa
	stxa	%l4,[%i0+%g0]0x81	! Mem[0000000030001400] = 0000000000000000
!	%f15 = a4269a4b, Mem[0000000030041410] = ce4e00ff
	sta	%f15,[%i1+%o5]0x89	! Mem[0000000030041410] = a4269a4b
!	%l4 = 0000000000000000, Mem[000000001000140b] = ceebfbd4
	stb	%l4,[%i0+0x00b]		! Mem[0000000010001408] = ceebfb00
!	Mem[00000000300c1408] = 00003054, %l6 = 0000000000000000
	ldstuba	[%i3+%o4]0x81,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010041404] = 185dc333, %l1 = 00000000, %l7 = 00000000
	add	%i1,0x04,%g1
	casa	[%g1]0x80,%l1,%l7	! %l7 = 00000000185dc333
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = ff0000aa, %l3 = 00000000000000ce
	ldswa	[%i4+%o4]0x81,%l3	! %l3 = ffffffffff0000aa

p0_label_147:
!	%f2  = 000000aa, %f19 = ce6aba12
	fsqrts	%f2 ,%f19		! %l0 = 00000000000000cc, Unfinished, %fsr = 2900000400
!	Mem[0000000010181400] = 00000000, %l1 = 0000000000000000
	lduba	[%i6+%g0]0x88,%l1	! %l1 = 0000000000000000
!	Mem[000000001010140c] = 00000000, %l7 = 00000000185dc333
	lduba	[%i4+0x00e]%asi,%l7	! %l7 = 0000000000000000
!	%f16 = ff000000 00000000, %f11 = b722486b
	fxtos	%f16,%f11		! %f11 = db800000
!	Mem[0000000030001408] = 000000ff000000ff, %f28 = ffd5c92d eb3500aa
	ldda	[%i0+%o4]0x81,%f28	! %f28 = 000000ff 000000ff
!	Mem[0000000010101400] = aa2effe5, %l6 = 0000000000000000
	ldsba	[%i4+%g0]0x80,%l6	! %l6 = ffffffffffffffaa
!	Mem[0000000010141408] = 90d5fc1ed40d8656, %l3 = ffffffffff0000aa
	ldxa	[%i5+%o4]0x80,%l3	! %l3 = 90d5fc1ed40d8656
!	Mem[00000000300c1408] = 543000ff, %l7 = 0000000000000000
	lduha	[%i3+%o4]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[0000000021800180] = ff114d6f, %l5 = 0000000000000010
	lduh	[%o3+0x180],%l5		! %l5 = 000000000000ff11
!	Starting 10 instruction Store Burst
!	Mem[0000000010001426] = e0090000, %l3 = 90d5fc1ed40d8656
	ldstuba	[%i0+0x026]%asi,%l3	! %l3 = 00000000000000ff

p0_label_148:
!	Mem[0000000030101400] = f7bef48f, %l7 = 00000000000000ff
	ldstuba	[%i4+%g0]0x81,%l7	! %l7 = 000000f7000000ff
!	%l3 = 0000000000000000, Mem[0000000030181400] = 4b9a26a4
	stwa	%l3,[%i6+%g0]0x81	! Mem[0000000030181400] = 00000000
!	%f10 = ff000053 db800000, Mem[0000000010181430] = 00000000 beff5d9a
	stda	%f10,[%i6+0x030]%asi	! Mem[0000000010181430] = ff000053 db800000
!	%l6 = ffffffaa, %l7 = 000000f7, Mem[0000000010001400] = ff032e67 00000000
	std	%l6,[%i0+%g0]		! Mem[0000000010001400] = ffffffaa 000000f7
!	%f18 = 00032e67 ce6aba12, %l4 = 0000000000000000
!	Mem[0000000030001410] = 006c050e00000072
	add	%i0,0x010,%g1
	stda	%f18,[%g1+%l4]ASI_PST32_S ! Mem[0000000030001410] = 006c050e00000072
!	Mem[0000000010141408] = 90d5fc1e, %l6 = ffffffffffffffaa
	swapa	[%i5+%o4]0x80,%l6	! %l6 = 0000000090d5fc1e
!	%l6 = 0000000090d5fc1e, Mem[0000000010001400] = f7000000aaffffff
	stxa	%l6,[%i0+%g0]0x88	! Mem[0000000010001400] = 0000000090d5fc1e
!	Mem[0000000010081408] = ff0000d6, %l6 = 0000000090d5fc1e
	swapa	[%i2+%o4]0x80,%l6	! %l6 = 00000000ff0000d6
!	Mem[0000000010041401] = 00aaffff, %l4 = 0000000000000000
	ldstub	[%i1+0x001],%l4		! %l4 = 000000aa000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = 90d5fc1e33c35d18, %f2  = 000000aa 00000000
	ldda	[%i2+%o4]0x80,%f2 	! %f2  = 90d5fc1e 33c35d18

p0_label_149:
!	Mem[00000000100c1408] = 10000000, %f23 = 00000000
	lda	[%i3+%o4]0x88,%f23	! %f23 = 10000000
!	Mem[0000000030081400] = 00000000, %l2 = 00000000ff000000
	lduba	[%i2+%g0]0x81,%l2	! %l2 = 0000000000000000
!	%f5  = 8aa63b93, %f7  = ff000000
	fcmpes	%fcc1,%f5 ,%f7 		! %fcc1 = 2
!	Mem[0000000010101410] = ff6c009b, %l7 = 00000000000000f7
	ldsha	[%i4+%o5]0x88,%l7	! %l7 = 000000000000009b
!	Mem[0000000030101408] = aa0000ff, %l0 = 00000000000000cc
	ldsba	[%i4+%o4]0x89,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000030041400] = 59b17d9bd4fbebce, %f0  = 2dc9d5ff ff000000
	ldda	[%i1+%g0]0x81,%f0 	! %f0  = 59b17d9b d4fbebce
!	Mem[0000000030181408] = 00000000, %l7 = 000000000000009b
	ldsba	[%i6+%o4]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000010081408] = 1efcd590, %l2 = 0000000000000000
	lduba	[%i2+%o4]0x88,%l2	! %l2 = 0000000000000090
!	%f21 = 0f64e000, %f11 = db800000, %f6  = b52df303
	fadds	%f21,%f11,%f6 		! %f6  = db800000
!	Starting 10 instruction Store Burst
!	%l5 = 000000000000ff11, Mem[00000000100c1430] = 90d5fc1e
	stw	%l5,[%i3+0x030]		! Mem[00000000100c1430] = 0000ff11

p0_label_150:
!	%l1 = 0000000000000000, Mem[0000000010101410] = 9b006cff
	stwa	%l1,[%i4+%o5]0x80	! Mem[0000000010101410] = 00000000
!	%f24 = 185dc333 ce4e00ff, Mem[0000000030041408] = ff0000ff 0e050000
	stda	%f24,[%i1+%o4]0x81	! Mem[0000000030041408] = 185dc333 ce4e00ff
!	Mem[0000000030041400] = 9b7db159, %l4 = 00000000000000aa
	ldstuba	[%i1+%g0]0x89,%l4	! %l4 = 00000059000000ff
!	%f12 = 4b9a26a4 000009e0, %l4 = 0000000000000059
!	Mem[00000000100c1400] = 0000000042107eed
	stda	%f12,[%i3+%l4]ASI_PST8_P ! Mem[00000000100c1400] = 009a00a400107ee0
!	%l4 = 00000059, %l5 = 0000ff11, Mem[0000000030101408] = aa0000ff 00000000
	stda	%l4,[%i4+%o4]0x89	! Mem[0000000030101408] = 00000059 0000ff11
!	%l2 = 0000000000000090, Mem[0000000010041410] = 00000000
	stba	%l2,[%i1+%o5]0x88	! Mem[0000000010041410] = 00000090
!	Mem[0000000030081408] = 6b4822b7, %l7 = 0000000000000000
	ldstuba	[%i2+%o4]0x81,%l7	! %l7 = 0000006b000000ff
!	%l0 = ffffffff, %l1 = 00000000, Mem[0000000010101410] = 00000000 5102096a
	stda	%l0,[%i4+%o5]0x88	! Mem[0000000010101410] = ffffffff 00000000
!	%l0 = ffffffff, %l1 = 00000000, Mem[0000000030041410] = 4b9a26a4 33c35d18
	stda	%l0,[%i1+%o5]0x81	! Mem[0000000030041410] = ffffffff 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = 90d5fc1e, %l4 = 0000000000000059
	ldswa	[%i2+%o4]0x80,%l4	! %l4 = ffffffff90d5fc1e

p0_label_151:
!	Mem[0000000010041408] = d66d7210, %l6 = 00000000ff0000d6
	lduha	[%i1+%o4]0x88,%l6	! %l6 = 0000000000007210
!	Mem[0000000010181410] = 00aaffff, %l5 = 000000000000ff11
	ldsha	[%i6+0x012]%asi,%l5	! %l5 = ffffffffffffffff
!	Mem[00000000100c1400] = 009a00a4, %l5 = ffffffffffffffff
	ldswa	[%i3+%g0]0x80,%l5	! %l5 = 00000000009a00a4
!	Mem[0000000030001408] = ff000000 ff000000, %l6 = 00007210, %l7 = 0000006b
	ldda	[%i0+%o4]0x89,%l6	! %l6 = 00000000ff000000 00000000ff000000
!	Mem[0000000010041408] = d66d7210, %l5 = 00000000009a00a4
	lduha	[%i1+%o4]0x88,%l5	! %l5 = 0000000000007210
!	Mem[0000000010001410] = 672e0300, %l3 = 0000000000000000
	ldswa	[%i0+%o5]0x80,%l3	! %l3 = 00000000672e0300
!	Mem[0000000010101438] = 8590ff23 000000ff, %l4 = 90d5fc1e, %l5 = 00007210
	ldda	[%i4+0x038]%asi,%l4	! %l4 = 000000008590ff23 00000000000000ff
!	Mem[0000000010181420] = d4189176 eafcff4a, %l6 = ff000000, %l7 = ff000000
	ldda	[%i6+0x020]%asi,%l6	! %l6 = 00000000d4189176 00000000eafcff4a
!	Mem[0000000010181438] = 672e0378, %l4 = 000000008590ff23
	lduw	[%i6+0x038],%l4		! %l4 = 00000000672e0378
!	Starting 10 instruction Store Burst
!	Mem[0000000030041408] = 33c35d18, %l3 = 00000000672e0300
	swapa	[%i1+%o4]0x89,%l3	! %l3 = 0000000033c35d18

p0_label_152:
!	Mem[0000000030141410] = ff000000, %l0 = ffffffffffffffff
	ldstuba	[%i5+%o5]0x81,%l0	! %l0 = 000000ff000000ff
!	%l6 = 00000000d4189176, Mem[0000000010141410] = ce4e5dff
	stwa	%l6,[%i5+%o5]0x88	! Mem[0000000010141410] = d4189176
!	Mem[000000001014141c] = 7eee8d5c, %l4 = 00000000672e0378
	ldstub	[%i5+0x01c],%l4		! %l4 = 0000007e000000ff
!	%f31 = 00000010, Mem[0000000010141400] = ffffffff
	sta	%f31,[%i5+0x000]%asi	! Mem[0000000010141400] = 00000010
!	Mem[00000000300c1408] = 543000ff, %l3 = 0000000033c35d18
	swapa	[%i3+%o4]0x89,%l3	! %l3 = 00000000543000ff
!	%l2 = 00000090, %l3 = 543000ff, Mem[0000000010101410] = ffffffff 00000000
	stda	%l2,[%i4+%o5]0x88	! Mem[0000000010101410] = 00000090 543000ff
!	%f29 = 000000ff, %f28 = 000000ff
	fcmpes	%fcc0,%f29,%f28		! %fcc0 = 0
!	%l0 = 00000000000000ff, imm = ffffffffffffff56, %l6 = 00000000d4189176
	add	%l0,-0x0aa,%l6		! %l6 = 0000000000000055
!	Mem[0000000010041410] = 90000000, %l3 = 00000000543000ff
	ldstuba	[%i1+%o5]0x80,%l3	! %l3 = 00000090000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = 90d5fc1e, %l4 = 000000000000007e
	lduba	[%i2+%o4]0x80,%l4	! %l4 = 0000000000000090

p0_label_153:
!	Mem[0000000010001420] = 59c9c11a, %l0 = 00000000000000ff
	lduwa	[%i0+0x020]%asi,%l0	! %l0 = 0000000059c9c11a
!	Mem[0000000010041408] = 10726dd6ce6aba12, %f28 = 000000ff 000000ff
	ldda	[%i1+%o4]0x80,%f28	! %f28 = 10726dd6 ce6aba12
!	Mem[0000000010141408] = 56860dd4aaffffff, %f10 = ff000053 db800000
	ldda	[%i5+%o4]0x88,%f10	! %f10 = 56860dd4 aaffffff
!	%l2 = 0000000000000090, imm = 0000000000000664, %l5 = 00000000000000ff
	orn	%l2,0x664,%l5		! %l5 = fffffffffffff99b
!	%l6 = 00000055, %l7 = eafcff4a, Mem[00000000100c1410] = 66a2ffff 72000000
	stda	%l6,[%i3+%o5]0x80	! Mem[00000000100c1410] = 00000055 eafcff4a
!	Mem[0000000030081400] = 00000000ffd5c92d, %l2 = 0000000000000090
	ldxa	[%i2+%g0]0x81,%l2	! %l2 = 00000000ffd5c92d
!	Mem[0000000010001430] = 00000000, %l7 = 00000000eafcff4a
	ldsh	[%i0+0x030],%l7		! %l7 = 0000000000000000
!	Mem[0000000010141404] = 00000000, %l3 = 0000000000000090
	ldsh	[%i5+0x004],%l3		! %l3 = 0000000000000000
!	Mem[000000001010143c] = 000000ff, %l0 = 0000000059c9c11a
	ldsb	[%i4+0x03d],%l0		! %l0 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f0  = 59b17d9b d4fbebce, Mem[0000000030041400] = 9b7db1ff ceebfbd4
	stda	%f0 ,[%i1+%g0]0x89	! Mem[0000000030041400] = 59b17d9b d4fbebce

p0_label_154:
!	%l5 = fffffffffffff99b, Mem[00000000100c1408] = 10000000
	stha	%l5,[%i3+%o4]0x88	! Mem[00000000100c1408] = 1000f99b
!	%f30 = 00000056 00000010, Mem[0000000010081408] = 1efcd590 185dc333
	stda	%f30,[%i2+%o4]0x88	! Mem[0000000010081408] = 00000056 00000010
!	%f16 = ff000000 00000000, Mem[0000000010001408] = ceebfb00 00000000
	stda	%f16,[%i0+%o4]0x80	! Mem[0000000010001408] = ff000000 00000000
!	Mem[0000000030141408] = 00000000, %l4 = 0000000000000090
	ldstuba	[%i5+%o4]0x89,%l4	! %l4 = 00000000000000ff
!	%f28 = 10726dd6 ce6aba12, Mem[0000000010181400] = 00000000 00000000
	stda	%f28,[%i6+%g0]0x80	! Mem[0000000010181400] = 10726dd6 ce6aba12
!	Mem[0000000010001408] = 000000ff, %l5 = fffffffffffff99b
	ldstuba	[%i0+%o4]0x88,%l5	! %l5 = 000000ff000000ff
!	%l2 = ffd5c92d, %l3 = 00000000, Mem[0000000030181408] = 00000000 beff5d9a
	stda	%l2,[%i6+%o4]0x81	! Mem[0000000030181408] = ffd5c92d 00000000
!	%l1 = 0000000000000000, Mem[0000000010181400] = 10726dd6
	stha	%l1,[%i6+%g0]0x80	! Mem[0000000010181400] = 00006dd6
!	Mem[0000000010041410] = ff000000, %l3 = 0000000000000000
	swapa	[%i1+%o5]0x80,%l3	! %l3 = 00000000ff000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = 10000000, %l3 = 00000000ff000000
	ldswa	[%i5+%g0]0x88,%l3	! %l3 = 0000000010000000

p0_label_155:
!	%l1 = 0000000000000000, %l6 = 0000000000000055, %l5 = 00000000000000ff
	subc	%l1,%l6,%l5		! %l5 = ffffffffffffffab
!	%l1 = 0000000000000000, %l2 = 00000000ffd5c92d, %l0 = 0000000000000000
	sub	%l1,%l2,%l0		! %l0 = ffffffff002a36d3
!	Mem[00000000300c1400] = 000000ff, %l3 = 0000000010000000
	ldsba	[%i3+%g0]0x89,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000030081408] = ff4822b7, %l6 = 0000000000000055
	lduha	[%i2+%o4]0x81,%l6	! %l6 = 000000000000ff48
!	Mem[0000000030101410] = 66000000, %l1 = 0000000000000000
	lduwa	[%i4+%o5]0x81,%l1	! %l1 = 0000000066000000
!	Mem[0000000010181408] = 5ed400ff, %l1 = 0000000066000000
	ldsba	[%i6+%o4]0x88,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000030101410] = 66000000, %l4 = 0000000000000000
	ldswa	[%i4+%o5]0x81,%l4	! %l4 = 0000000066000000
!	Mem[0000000010001430] = 00000000, %l1 = ffffffffffffffff
	ldsw	[%i0+0x030],%l1		! %l1 = 0000000000000000
!	Mem[00000000300c1408] = 33c35d18, %l1 = 0000000000000000
	ldsha	[%i3+%o4]0x89,%l1	! %l1 = 0000000000005d18
!	Starting 10 instruction Store Burst
!	%l0 = 002a36d3, %l1 = 00005d18, Mem[0000000030101400] = ffbef48f 00000000
	stda	%l0,[%i4+%g0]0x81	! Mem[0000000030101400] = 002a36d3 00005d18

p0_label_156:
!	Mem[0000000010001410] = 672e0300, %l5 = ffffffffffffffab
	ldstuba	[%i0+%o5]0x80,%l5	! %l5 = 00000067000000ff
!	%l7 = 0000000000000000, Mem[0000000030181410] = d60000ff
	stha	%l7,[%i6+%o5]0x89	! Mem[0000000030181410] = d6000000
!	%l5 = 0000000000000067, imm = fffffffffffff8e2, %l7 = 0000000000000000
	xor	%l5,-0x71e,%l7		! %l7 = fffffffffffff885
!	%l1 = 0000000000005d18, Mem[0000000030001408] = 000000ff
	stha	%l1,[%i0+%o4]0x81	! Mem[0000000030001408] = 5d1800ff
!	Mem[0000000030081400] = 00000000, %l1 = 0000000000005d18
	ldstuba	[%i2+%g0]0x89,%l1	! %l1 = 00000000000000ff
!	%f14 = ce4e5d9a a4269a4b, Mem[0000000030181408] = 2dc9d5ff 00000000
	stda	%f14,[%i6+%o4]0x89	! Mem[0000000030181408] = ce4e5d9a a4269a4b
!	%f8  = 00aaffff, Mem[0000000010181408] = 5ed400ff
	sta	%f8 ,[%i6+%o4]0x88	! Mem[0000000010181408] = 00aaffff
!	Mem[0000000030101410] = 66000000, %l2 = 00000000ffd5c92d
	swapa	[%i4+%o5]0x81,%l2	! %l2 = 0000000066000000
!	Mem[0000000030081400] = 000000ff, %l7 = fffffffffffff885
	ldstuba	[%i2+%g0]0x89,%l7	! %l7 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = 4b9a26a4, %l0 = ffffffff002a36d3
	ldsha	[%i6+%o4]0x81,%l0	! %l0 = 0000000000004b9a

p0_label_157:
!	Mem[0000000030141400] = ff0000aa00000000, %l5 = 0000000000000067
	ldxa	[%i5+%g0]0x81,%l5	! %l5 = ff0000aa00000000
!	Mem[0000000030101408] = 59000000, %l1 = 0000000000000000
	ldsba	[%i4+%o4]0x81,%l1	! %l1 = 0000000000000059
!	Mem[0000000010001400] = 90d5fc1e, %l4 = 0000000066000000
	lduwa	[%i0+%g0]0x88,%l4	! %l4 = 0000000090d5fc1e
!	Mem[0000000030081410] = 8ff4bef7 ffffffff, %l2 = 66000000, %l3 = ffffffff
	ldda	[%i2+%o5]0x81,%l2	! %l2 = 000000008ff4bef7 00000000ffffffff
!	Mem[00000000211c0000] = ff9b4340, %l5 = ff0000aa00000000
	ldub	[%o2+%g0],%l5		! %l5 = 00000000000000ff
!	%f14 = ce4e5d9a a4269a4b, %f2  = 90d5fc1e 33c35d18
	fxtod	%f14,%f2 		! %f2  = c3c8d8d1 32adecb3
!	Mem[0000000030141410] = ff000000, %l3 = 00000000ffffffff
	ldsba	[%i5+%o5]0x81,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000030001400] = 0000000000000000, %f4  = ff0009e0 8aa63b93
	ldda	[%i0+%g0]0x81,%f4 	! %f4  = 00000000 00000000
!	Mem[0000000010081438] = 00000072, %l4 = 0000000090d5fc1e
	lduw	[%i2+0x038],%l4		! %l4 = 0000000000000072
!	Starting 10 instruction Store Burst
!	Mem[0000000030141410] = 000000ff, %l4 = 0000000000000072
	ldstuba	[%i5+%o5]0x89,%l4	! %l4 = 000000ff000000ff

p0_label_158:
!	Mem[0000000010041400] = 00ffffff, %l5 = 00000000000000ff
	ldstuba	[%i1+%g0]0x80,%l5	! %l5 = 00000000000000ff
!	%f0  = 59b17d9b d4fbebce, %l0 = 0000000000004b9a
!	Mem[0000000030001428] = b52df303d6bc032f
	add	%i0,0x028,%g1
	stda	%f0,[%g1+%l0]ASI_PST8_SL ! Mem[0000000030001428] = b5ebf3d49bbc0359
!	Mem[0000000030141410] = ff000000, %l5 = 0000000000000000
	swapa	[%i5+%o5]0x81,%l5	! %l5 = 00000000ff000000
!	Mem[00000000211c0001] = ff9b4340, %l7 = 00000000000000ff
	ldstuba	[%o2+0x001]%asi,%l7	! %l7 = 0000009b000000ff
!	%f30 = 00000056 00000010, Mem[0000000030181410] = d6000000 b52df303
	stda	%f30,[%i6+%o5]0x89	! Mem[0000000030181410] = 00000056 00000010
!	Mem[0000000010041410] = 00000000, %l5 = 00000000ff000000
	ldstuba	[%i1+%o5]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030041408] = 672e0300, %l6 = 000000000000ff48
	ldstuba	[%i1+%o4]0x89,%l6	! %l6 = 00000000000000ff
!	%f10 = 56860dd4 aaffffff, %l4 = 00000000000000ff
!	Mem[00000000300c1430] = 76e77a146ed6ddf6
	add	%i3,0x030,%g1
	stda	%f10,[%g1+%l4]ASI_PST32_SL ! Mem[00000000300c1430] = ffffffaad40d8656
!	%l7 = 000000000000009b, Mem[00000000100c1400] = 009a00a4
	stwa	%l7,[%i3+%g0]0x80	! Mem[00000000100c1400] = 0000009b
!	Starting 10 instruction Load Burst
!	%l5 = 0000000000000000, immd = 000000000000067d, %l6 = 0000000000000000
	udivx	%l5,0x67d,%l6		! %l6 = 0000000000000000

p0_label_159:
!	Mem[00000000100c1408] = 1000f99b, %l4 = 00000000000000ff
	ldswa	[%i3+%o4]0x88,%l4	! %l4 = 000000001000f99b
!	Code Fragment 3
p0_fragment_19:
!	%l0 = 0000000000004b9a
	setx	0xaf1902483d19bbf8,%g7,%l0 ! %l0 = af1902483d19bbf8
!	%l1 = 0000000000000059
	setx	0x87978587fe438e57,%g7,%l1 ! %l1 = 87978587fe438e57
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = af1902483d19bbf8
	setx	0x5fa68daf9d5fb962,%g7,%l0 ! %l0 = 5fa68daf9d5fb962
!	%l1 = 87978587fe438e57
	setx	0x31d0b68fb4175e87,%g7,%l1 ! %l1 = 31d0b68fb4175e87
!	Mem[0000000010141410] = 769118d400000000, %l3 = ffffffffffffffff
	ldxa	[%i5+%o5]0x80,%l3	! %l3 = 769118d400000000
!	%f26 = b52df303, %f13 = 000009e0
	fcmpes	%fcc0,%f26,%f13		! %fcc0 = 1
!	Mem[0000000010181420] = d4189176, %l0 = 5fa68daf9d5fb962
	ldsh	[%i6+0x022],%l0		! %l0 = ffffffffffff9176
!	Mem[0000000030101408] = 00000059, %l3 = 769118d400000000
	lduba	[%i4+%o4]0x89,%l3	! %l3 = 0000000000000059
!	Mem[0000000010101400] = aa2effe500000000, %f24 = 185dc333 ce4e00ff
	ldda	[%i4+0x000]%asi,%f24	! %f24 = aa2effe5 00000000
!	Mem[0000000030101410] = beff5d9a2dc9d5ff, %f14 = ce4e5d9a a4269a4b
	ldda	[%i4+%o5]0x89,%f14	! %f14 = beff5d9a 2dc9d5ff
!	Mem[0000000010041418] = 00000000 00000000, %l6 = 00000000, %l7 = 0000009b
	ldda	[%i1+0x018]%asi,%l6	! %l6 = 0000000000000000 0000000000000000
!	Starting 10 instruction Store Burst
!	%l2 = 000000008ff4bef7, Mem[00000000300c1400] = 000000ff
	stwa	%l2,[%i3+%g0]0x89	! Mem[00000000300c1400] = 8ff4bef7

p0_label_160:
!	Mem[0000000021800040] = 00ff75ef, %l1 = 31d0b68fb4175e87
	ldstub	[%o3+0x040],%l1		! %l1 = 00000000000000ff
!	Mem[0000000030181408] = 4b9a26a4, %l6 = 0000000000000000
	swapa	[%i6+%o4]0x81,%l6	! %l6 = 000000004b9a26a4
!	%f22 = ff0000aa 10000000, Mem[0000000010001438] = 9b7db159 f26c050e
	stda	%f22,[%i0+0x038]%asi	! Mem[0000000010001438] = ff0000aa 10000000
!	%l6 = 000000004b9a26a4, Mem[0000000030181408] = 000000009a5d4ece
	stxa	%l6,[%i6+%o4]0x81	! Mem[0000000030181408] = 000000004b9a26a4
!	Mem[00000000201c0001] = a266e0d4, %l7 = 0000000000000000
	ldstuba	[%o0+0x001]%asi,%l7	! %l7 = 00000066000000ff
!	%l4 = 000000001000f99b, Mem[0000000010181422] = d4189176
	stb	%l4,[%i6+0x022]		! Mem[0000000010181420] = d4189b76
!	Mem[0000000010101410] = 90000000, %l0 = ffffffffffff9176
	swapa	[%i4+%o5]0x80,%l0	! %l0 = 0000000090000000
!	%l0 = 0000000090000000, Mem[0000000010081408] = 00000010
	stwa	%l0,[%i2+%o4]0x88	! Mem[0000000010081408] = 90000000
!	Mem[0000000010181400] = 00006dd6, %l0 = 0000000090000000
	swapa	[%i6+%g0]0x80,%l0	! %l0 = 0000000000006dd6
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = 0000009a, %l5 = 0000000000000000
	ldsba	[%i3+%o5]0x89,%l5	! %l5 = ffffffffffffff9a

p0_label_161:
!	Mem[0000000010001400] = 1efcd59000000000, %f20 = c9634651 0f64e000
	ldda	[%i0+%g0]0x80,%f20	! %f20 = 1efcd590 00000000
!	Mem[0000000010001400] = 1efcd590 00000000, %l4 = 1000f99b, %l5 = ffffff9a
	ldda	[%i0+%g0]0x80,%l4	! %l4 = 000000001efcd590 0000000000000000
!	Mem[0000000010181410] = 00aaffff 185dc333, %l0 = 00006dd6, %l1 = 00000000
	ldda	[%i6+%o5]0x80,%l0	! %l0 = 0000000000aaffff 00000000185dc333
!	Mem[0000000030141408] = ff000000, %l6 = 000000004b9a26a4
	ldsha	[%i5+%o4]0x81,%l6	! %l6 = ffffffffffffff00
!	Code Fragment 4
p0_fragment_20:
!	%l0 = 0000000000aaffff
	setx	0xa0815f379ff97fc1,%g7,%l0 ! %l0 = a0815f379ff97fc1
!	%l1 = 00000000185dc333
	setx	0xf93a9407d4e979d8,%g7,%l1 ! %l1 = f93a9407d4e979d8
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = a0815f379ff97fc1
	setx	0x6eff5b3805680257,%g7,%l0 ! %l0 = 6eff5b3805680257
!	%l1 = f93a9407d4e979d8
	setx	0x380c04281c1da1b3,%g7,%l1 ! %l1 = 380c04281c1da1b3
!	Mem[0000000010081438] = 0000007294c2fd7c, %f26 = b52df303 d6bc032f
	ldd	[%i2+0x038],%f26	! %f26 = 00000072 94c2fd7c
!	Mem[00000000300c1400] = f7bef48f, %l0 = 6eff5b3805680257
	lduwa	[%i3+%g0]0x81,%l0	! %l0 = 00000000f7bef48f
!	Mem[0000000010001434] = 00000000, %f30 = 00000056
	ld	[%i0+0x034],%f30	! %f30 = 00000000
!	Mem[00000000100c1434] = a4269a4b, %l7 = 0000000000000066
	ldsha	[%i3+0x036]%asi,%l7	! %l7 = ffffffffffff9a4b
!	Starting 10 instruction Store Burst
!	%l3 = 0000000000000059, Mem[0000000010181438] = 672e0378, %asi = 80
	stba	%l3,[%i6+0x038]%asi	! Mem[0000000010181438] = 592e0378

p0_label_162:
!	Mem[0000000030041400] = ceebfbd4, %l1 = 380c04281c1da1b3
	ldstuba	[%i1+%g0]0x81,%l1	! %l1 = 000000ce000000ff
!	%f23 = 10000000, Mem[00000000100c1408] = 9bf90010
	sta	%f23,[%i3+%o4]0x80	! Mem[00000000100c1408] = 10000000
!	%l0 = 00000000f7bef48f, Mem[0000000030041408] = ff004ece672e03ff
	stxa	%l0,[%i1+%o4]0x89	! Mem[0000000030041408] = 00000000f7bef48f
!	%l6 = ffffffffffffff00, Mem[0000000030141410] = 00000000
	stba	%l6,[%i5+%o5]0x89	! Mem[0000000030141410] = 00000000
!	%l0 = 00000000f7bef48f, Mem[0000000010081400] = 00032eff
	stha	%l0,[%i2+%g0]0x88	! Mem[0000000010081400] = 0003f48f
!	%l0 = f7bef48f, %l1 = 000000ce, Mem[0000000030041400] = ffebfbd4 9b7db159
	stda	%l0,[%i1+%g0]0x81	! Mem[0000000030041400] = f7bef48f 000000ce
!	Mem[0000000010181408] = ffffaa00, %l4 = 000000001efcd590
	ldstuba	[%i6+%o4]0x80,%l4	! %l4 = 000000ff000000ff
!	%l2 = 8ff4bef7, %l3 = 00000059, Mem[0000000010081410] = 00000000 00000000
	stda	%l2,[%i2+%o5]0x80	! Mem[0000000010081410] = 8ff4bef7 00000059
!	%f16 = ff000000 00000000 00032e67 ce6aba12
!	%f20 = 1efcd590 00000000 ff0000aa 10000000
!	%f24 = aa2effe5 00000000 00000072 94c2fd7c
!	%f28 = 10726dd6 ce6aba12 00000000 00000010
	stda	%f16,[%i5]ASI_BLK_SL	! Block Store to 0000000030141400
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = f7bef48f, %l4 = 00000000000000ff
	lduha	[%i3+%g0]0x81,%l4	! %l4 = 000000000000f7be

p0_label_163:
!	Code Fragment 3
p0_fragment_21:
!	%l0 = 00000000f7bef48f
	setx	0x86e3f9a00540f724,%g7,%l0 ! %l0 = 86e3f9a00540f724
!	%l1 = 00000000000000ce
	setx	0x61898b17aceb2742,%g7,%l1 ! %l1 = 61898b17aceb2742
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 86e3f9a00540f724
	setx	0x92f16dffadac9db5,%g7,%l0 ! %l0 = 92f16dffadac9db5
!	%l1 = 61898b17aceb2742
	setx	0x460a5dcfda87dee0,%g7,%l1 ! %l1 = 460a5dcfda87dee0
!	Mem[0000000010041410] = ff000000, %f10 = 56860dd4
	lda	[%i1+0x010]%asi,%f10	! %f10 = ff000000
!	Mem[0000000030081410] = 8ff4bef7ffffffff, %f8  = 00aaffff 185dc333
	ldda	[%i2+%o5]0x81,%f8 	! %f8  = 8ff4bef7 ffffffff
!	%f11 = aaffffff, %f15 = 2dc9d5ff
	fcmps	%fcc3,%f11,%f15		! %fcc3 = 1
!	Mem[00000000100c142c] = 000000db, %l6 = ffffffffffffff00
	ldswa	[%i3+0x02c]%asi,%l6	! %l6 = 00000000000000db
	membar	#Sync			! Added by membar checker (20)
!	Mem[0000000010141428] = 8ddb922ced3c7995, %f8  = 8ff4bef7 ffffffff
	ldda	[%i5+0x028]%asi,%f8 	! %f8  = 8ddb922c ed3c7995
!	Mem[0000000010101408] = 0000000000000000, %l3 = 0000000000000059
	ldxa	[%i4+%o4]0x88,%l3	! %l3 = 0000000000000000
!	Mem[000000001010143c] = 000000ff, %f28 = 10726dd6
	ld	[%i4+0x03c],%f28	! %f28 = 000000ff
!	Mem[0000000030041400] = 8ff4bef7, %f15 = 2dc9d5ff
	lda	[%i1+%g0]0x89,%f15	! %f15 = 8ff4bef7
!	Starting 10 instruction Store Burst
!	Mem[0000000030181400] = 00000000, %l2 = 000000008ff4bef7
	ldstuba	[%i6+%g0]0x81,%l2	! %l2 = 00000000000000ff

p0_label_164:
!	%f23 = 10000000, Mem[0000000010101400] = e5ff2eaa
	sta	%f23,[%i4+%g0]0x88	! Mem[0000000010101400] = 10000000
!	%l0 = adac9db5, %l1 = da87dee0, Mem[0000000010001410] = 00032eff 00007798
	stda	%l0,[%i0+%o5]0x88	! Mem[0000000010001410] = adac9db5 da87dee0
!	%l4 = 000000000000f7be, Mem[0000000010081434] = cfa24919, %asi = 80
	stwa	%l4,[%i2+0x034]%asi	! Mem[0000000010081434] = 0000f7be
!	Mem[00000000218000c0] = ffffafd4, %l7 = ffffffffffff9a4b
	ldstub	[%o3+0x0c0],%l7		! %l7 = 000000ff000000ff
!	%l3 = 0000000000000000, Mem[0000000010181400] = 00000090
	stha	%l3,[%i6+%g0]0x88	! Mem[0000000010181400] = 00000000
!	%l1 = 460a5dcfda87dee0, Mem[0000000030101408] = 00000059
	stwa	%l1,[%i4+%o4]0x89	! Mem[0000000030101408] = da87dee0
!	%f22 = ff0000aa 10000000, Mem[0000000010101438] = 8590ff23 000000ff
	std	%f22,[%i4+0x038]	! Mem[0000000010101438] = ff0000aa 10000000
!	%l5 = 0000000000000000, %l6 = 00000000000000db, %l7 = 00000000000000ff
	andn	%l5,%l6,%l7		! %l7 = 0000000000000000
!	%l2 = 0000000000000000, Mem[0000000030141408] = ce6aba12
	stba	%l2,[%i5+%o4]0x89	! Mem[0000000030141408] = ce6aba00
!	Starting 10 instruction Load Burst
!	Mem[0000000030101410] = ffd5c92d, %l2 = 0000000000000000
	ldsha	[%i4+%o5]0x81,%l2	! %l2 = ffffffffffffffd5

p0_label_165:
!	Mem[0000000030001400] = 00000000, %l6 = 00000000000000db
	ldsba	[%i0+%g0]0x81,%l6	! %l6 = 0000000000000000
!	Mem[00000000300c1410] = 185dc333 0000009a, %l0 = adac9db5, %l1 = da87dee0
	ldda	[%i3+%o5]0x89,%l0	! %l0 = 000000000000009a 00000000185dc333
!	Mem[0000000030081410] = 8ff4bef7, %l0 = 000000000000009a
	ldswa	[%i2+%o5]0x81,%l0	! %l0 = ffffffff8ff4bef7
!	Mem[0000000030101410] = ffd5c92d, %f17 = 00000000
	lda	[%i4+%o5]0x81,%f17	! %f17 = ffd5c92d
!	Mem[0000000030041410] = ffffffff, %l0 = ffffffff8ff4bef7
	ldsba	[%i1+%o5]0x81,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010041410] = 000000ff, %f29 = ce6aba12
	lda	[%i1+%o5]0x88,%f29	! %f29 = 000000ff
!	Mem[0000000010001410] = adac9db5, %f25 = 00000000
	lda	[%i0+%o5]0x88,%f25	! %f25 = adac9db5
!	%l3 = 0000000000000000, imm = 0000000000000ba0, %l1 = 00000000185dc333
	addc	%l3,0xba0,%l1		! %l1 = 0000000000000ba0
!	Mem[0000000030081408] = b72248ff, %l1 = 0000000000000ba0
	ldsba	[%i2+%o4]0x89,%l1	! %l1 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l7 = 0000000000000000, Mem[00000000300c1400] = 000000008ff4bef7
	stxa	%l7,[%i3+%g0]0x89	! Mem[00000000300c1400] = 0000000000000000

p0_label_166:
!	%l2 = ffffffd5, %l3 = 00000000, Mem[00000000100c1408] = 00000010 0000002d
	stda	%l2,[%i3+%o4]0x88	! Mem[00000000100c1408] = ffffffd5 00000000
!	%f30 = 00000000 00000010, %l7 = 0000000000000000
!	Mem[0000000010181438] = 592e03780023df27
	add	%i6,0x038,%g1
	stda	%f30,[%g1+%l7]ASI_PST16_P ! Mem[0000000010181438] = 592e03780023df27
!	%l6 = 0000000000000000, Mem[0000000010081408] = 00000090
	stha	%l6,[%i2+%o4]0x80	! Mem[0000000010081408] = 00000090
!	%l6 = 0000000000000000, Mem[0000000030181410] = 10000000
	stwa	%l6,[%i6+%o5]0x81	! Mem[0000000030181410] = 00000000
!	%f12 = 4b9a26a4 000009e0, %l7 = 0000000000000000
!	Mem[00000000100c1410] = 00000055eafcff4a
	add	%i3,0x010,%g1
	stda	%f12,[%g1+%l7]ASI_PST16_P ! Mem[00000000100c1410] = 00000055eafcff4a
!	%l7 = 0000000000000000, Mem[0000000030101408] = e0de87da
	stwa	%l7,[%i4+%o4]0x81	! Mem[0000000030101408] = 00000000
!	Mem[00000000300c1400] = 00000000, %l6 = 0000000000000000
	ldstuba	[%i3+%g0]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010001410] = da87dee0 adac9db5, %l6 = 00000000, %l7 = 00000000
	ldda	[%i0+%o5]0x88,%l6	! %l6 = 00000000adac9db5 00000000da87dee0
!	Mem[00000000211c0000] = ffff4340, %l0 = ffffffffffffffff
	ldstub	[%o2+%g0],%l0		! %l0 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = f7bef48f000000ce, %l2 = ffffffffffffffd5
	ldxa	[%i1+%g0]0x81,%l2	! %l2 = f7bef48f000000ce

p0_label_167:
!	Mem[00000000300c1400] = ff000000, %l6 = 00000000adac9db5
	lduwa	[%i3+%g0]0x81,%l6	! %l6 = 00000000ff000000
!	Mem[00000000300c1408] = 33c35d18 33c35d18, %l6 = ff000000, %l7 = da87dee0
	ldda	[%i3+%o4]0x89,%l6	! %l6 = 0000000033c35d18 0000000033c35d18
!	Mem[0000000030081408] = b72248ff, %l5 = 0000000000000000
	ldswa	[%i2+%o4]0x89,%l5	! %l5 = ffffffffb72248ff
!	Mem[0000000010081418] = 00000000, %l2 = f7bef48f000000ce
	lduba	[%i2+0x01b]%asi,%l2	! %l2 = 0000000000000000
	membar	#Sync			! Added by membar checker (21)
!	Mem[00000000100c1400] = 0000009b 00107ee0 d5ffffff 00000000
!	Mem[00000000100c1410] = 00000055 eafcff4a 5cb0ee7e 3054c578
!	Mem[00000000100c1420] = 568600b0 8981bd0d 95793ced 000000db
!	Mem[00000000100c1430] = 0000ff11 a4269a4b 1efcd590 ce6aba12
	ldda	[%i3]ASI_BLK_PL,%f0	! Block Load from 00000000100c1400
!	Mem[00000000100c1408] = d5ffffff, %l1 = ffffffffffffffff
	ldswa	[%i3+%o4]0x80,%l1	! %l1 = ffffffffd5ffffff
!	Mem[0000000010041410] = ff000000, %l7 = 0000000033c35d18
	ldsha	[%i1+0x012]%asi,%l7	! %l7 = 0000000000000000
!	%l6 = 0000000033c35d18, %l5 = ffffffffb72248ff, %l5 = ffffffffb72248ff
	addc	%l6,%l5,%l5		! %l5 = ffffffffeae5a617
!	Mem[0000000030181408] = 00000000, %l3 = 0000000000000000
	ldsha	[%i6+%o4]0x81,%l3	! %l3 = 0000000000000000
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (22)
!	%f24 = aa2effe5 adac9db5, Mem[00000000100c1408] = ffffffd5 00000000
	stda	%f24,[%i3+%o4]0x88	! Mem[00000000100c1408] = aa2effe5 adac9db5

p0_label_168:
!	%l7 = 0000000000000000, Mem[000000001004143c] = 00000000, %asi = 80
	stwa	%l7,[%i1+0x03c]%asi	! Mem[000000001004143c] = 00000000
!	%l2 = 00000000, %l3 = 00000000, Mem[0000000010081408] = 90000000 00000056
	stda	%l2,[%i2+%o4]0x88	! Mem[0000000010081408] = 00000000 00000000
!	%l6 = 0000000033c35d18, Mem[0000000010101410] = ffff9176
	stha	%l6,[%i4+%o5]0x80	! Mem[0000000010101410] = 5d189176
!	%f28 = 000000ff, Mem[0000000030141410] = 00000000
	sta	%f28,[%i5+%o5]0x81	! Mem[0000000030141410] = 000000ff
!	Mem[0000000010081418] = 00000000e8004aef, %l0 = 00000000000000ff, %l6 = 0000000033c35d18
	add	%i2,0x18,%g1
	casxa	[%g1]0x80,%l0,%l6	! %l6 = 00000000e8004aef
!	%l0 = 000000ff, %l1 = d5ffffff, Mem[0000000010181400] = 00000000 ce6aba12
	stda	%l0,[%i6+%g0]0x80	! Mem[0000000010181400] = 000000ff d5ffffff
!	Mem[0000000010101400] = 00000010, %l0 = 00000000000000ff
	swap	[%i4+%g0],%l0		! %l0 = 0000000000000010
!	Mem[0000000030181400] = 000000ff, %l4 = 000000000000f7be
	swapa	[%i6+%g0]0x89,%l4	! %l4 = 00000000000000ff
!	%l4 = 00000000000000ff, Mem[0000000010141401] = 00000010
	stb	%l4,[%i5+0x001]		! Mem[0000000010141400] = 00ff0010
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = ffff4340, %l1 = ffffffffd5ffffff
	ldsha	[%o2+0x000]%asi,%l1	! %l1 = ffffffffffffffff

p0_label_169:
!	Mem[000000001000143c] = 10000000, %f9  = b0008656
	ld	[%i0+0x03c],%f9 	! %f9 = 10000000
!	Mem[0000000020800000] = ffff8b5d, %l0 = 0000000000000010
	ldsha	[%o1+0x000]%asi,%l0	! %l0 = ffffffffffffffff
!	Mem[00000000211c0000] = ffff4340, %l7 = 0000000000000000
	ldub	[%o2+%g0],%l7		! %l7 = 00000000000000ff
!	Mem[0000000010081414] = 00000059, %l6 = 00000000e8004aef
	ldsb	[%i2+0x014],%l6		! %l6 = 0000000000000000
!	Mem[0000000030141408] = 00ba6ace 672e0300, %l0 = ffffffff, %l1 = ffffffff
	ldda	[%i5+%o4]0x81,%l0	! %l0 = 0000000000ba6ace 00000000672e0300
!	Mem[0000000010181400] = 000000ff, %l6 = 0000000000000000
	ldub	[%i6+%g0],%l6		! %l6 = 0000000000000000
!	%l1 = 00000000672e0300, immd = 0000000000000180, %l3 = 0000000000000000
	udivx	%l1,0x180,%l3		! %l3 = 000000000044c957
!	Mem[00000000300c1400] = ff000000 00000000, %l0 = 00ba6ace, %l1 = 672e0300
	ldda	[%i3+%g0]0x81,%l0	! %l0 = 00000000ff000000 0000000000000000
!	%f21 = 00000000, %f4  = 4afffcea, %f6  = 78c55430
	fsubs	%f21,%f4 ,%f6 		! %f6  = cafffcea
!	Starting 10 instruction Store Burst
!	%l2 = 00000000, %l3 = 0044c957, Mem[0000000010081400] = 8ff40300 0000050e
	stda	%l2,[%i2+%g0]0x80	! Mem[0000000010081400] = 00000000 0044c957

p0_label_170:
!	%l4 = 00000000000000ff, Mem[0000000010041410] = ff00000003780000
	stxa	%l4,[%i1+%o5]0x80	! Mem[0000000010041410] = 00000000000000ff
!	%l4 = 00000000000000ff, Mem[0000000030101408] = 00000000
	stba	%l4,[%i4+%o4]0x81	! Mem[0000000030101408] = ff000000
!	%l0 = ff000000, %l1 = 00000000, Mem[0000000010181428] = 00002dc9 00000000
	std	%l0,[%i6+0x028]		! Mem[0000000010181428] = ff000000 00000000
!	%l4 = 000000ff, %l5 = eae5a617, Mem[0000000030081400] = ff000000 ffd5c92d
	stda	%l4,[%i2+%g0]0x81	! Mem[0000000030081400] = 000000ff eae5a617
!	%l5 = ffffffffeae5a617, Mem[0000000010141432] = 4b9a26a4
	sth	%l5,[%i5+0x032]		! Mem[0000000010141430] = 4b9aa617
!	%f10 = db000000 ed3c7995, Mem[0000000030081408] = b72248ff ff000053
	stda	%f10,[%i2+%o4]0x89	! Mem[0000000030081408] = db000000 ed3c7995
!	%l0 = 00000000ff000000, Mem[0000000010101410] = 5d189176ff003054
	stxa	%l0,[%i4+%o5]0x80	! Mem[0000000010101410] = 00000000ff000000
!	Mem[0000000010141408] = ffffffaa, %l5 = ffffffffeae5a617
	swapa	[%i5+%o4]0x80,%l5	! %l5 = 00000000ffffffaa
!	Mem[0000000010141400] = 00ff0010, %l2 = 0000000000000000
	ldstuba	[%i5+%g0]0x80,%l2	! %l2 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = 0000009b00107ee0, %f30 = 00000000 00000010
	ldda	[%i3+%g0]0x80,%f30	! %f30 = 0000009b 00107ee0

p0_label_171:
!	%f25 = adac9db5, %f19 = ce6aba12, %f16 = ff000000 ffd5c92d
	fsmuld	%f25,%f19,%f16		! %f16 = 3f93c8b3 c5531740
!	Mem[0000000030101410] = ffd5c92d, %l2 = 0000000000000000
	ldsba	[%i4+%o5]0x81,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000030041400] = f7bef48f, %l7 = 00000000000000ff
	lduha	[%i1+%g0]0x81,%l7	! %l7 = 000000000000f7be
!	Mem[0000000010081408] = 00000000, %l2 = ffffffffffffffff
	ldsh	[%i2+%o4],%l2		! %l2 = 0000000000000000
!	Mem[00000000218001c0] = 005e4628, %l1 = 0000000000000000
	ldsh	[%o3+0x1c0],%l1		! %l1 = 000000000000005e
!	Mem[0000000010041410] = ff00000000000000, %f20 = 1efcd590 00000000
	ldda	[%i1+%o5]0x88,%f20	! %f20 = ff000000 00000000
!	Mem[0000000010041400] = ffffffff, %f25 = adac9db5
	lda	[%i1+%g0]0x88,%f25	! %f25 = ffffffff
!	Mem[0000000010041400] = ffffffff, %l2 = 0000000000000000
	lduwa	[%i1+%g0]0x88,%l2	! %l2 = 00000000ffffffff
!	Mem[0000000010141400] = 000000001000ffff, %l4 = 00000000000000ff
	ldxa	[%i5+%g0]0x88,%l4	! %l4 = 000000001000ffff
!	Starting 10 instruction Store Burst
!	%l0 = ff000000, %l1 = 0000005e, Mem[00000000100c1410] = 00000055 eafcff4a
	stda	%l0,[%i3+%o5]0x80	! Mem[00000000100c1410] = ff000000 0000005e

p0_label_172:
!	%l0 = 00000000ff000000, Mem[0000000010141408] = 17a6e5ea
	stwa	%l0,[%i5+%o4]0x88	! Mem[0000000010141408] = ff000000
!	%l2 = 00000000ffffffff, Mem[0000000010101400] = 000000ff
	stwa	%l2,[%i4+%g0]0x80	! Mem[0000000010101400] = ffffffff
!	Mem[0000000010141422] = 0dbd8189, %l3 = 000000000044c957
	ldstuba	[%i5+0x022]%asi,%l3	! %l3 = 00000081000000ff
!	%l3 = 0000000000000081, Mem[0000000030101410] = 2dc9d5ff
	stba	%l3,[%i4+%o5]0x89	! Mem[0000000030101410] = 2dc9d581
!	Mem[0000000030101408] = 000000ff, %l6 = 0000000000000000
	ldstuba	[%i4+%o4]0x89,%l6	! %l6 = 000000ff000000ff
!	%l2 = ffffffff, %l3 = 00000081, Mem[0000000030041408] = 8ff4bef7 00000000
	stda	%l2,[%i1+%o4]0x81	! Mem[0000000030041408] = ffffffff 00000081
!	Mem[0000000010001408] = 000000ff, %l3 = 0000000000000081
	ldstuba	[%i0+%o4]0x88,%l3	! %l3 = 000000ff000000ff
!	Mem[0000000010101424] = 000000ff, %l4 = 000000001000ffff
	swap	[%i4+0x024],%l4		! %l4 = 00000000000000ff
!	%l6 = 00000000000000ff, immed = fffff090, %y  = 0000009a
	smul	%l6,-0xf70,%l0		! %l0 = fffffffffff09f70, %y = ffffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081418] = 00000000, %l3 = 00000000000000ff
	lduh	[%i2+0x018],%l3		! %l3 = 0000000000000000

p0_label_173:
!	Mem[0000000030101400] = 002a36d3, %l4 = 00000000000000ff
	lduwa	[%i4+%g0]0x81,%l4	! %l4 = 00000000002a36d3
!	Mem[0000000030001410] = 0e056c00, %l2 = 00000000ffffffff
	ldsha	[%i0+%o5]0x89,%l2	! %l2 = 0000000000006c00
!	Mem[0000000010101430] = f05e1d00, %l7 = 000000000000f7be
	ldswa	[%i4+0x030]%asi,%l7	! %l7 = fffffffff05e1d00
!	Mem[0000000030001400] = 0000000000000000, %f6  = cafffcea 7eeeb05c
	ldda	[%i0+%g0]0x81,%f6 	! %f6  = 00000000 00000000
!	Mem[00000000100c1410] = ff000000, %l7 = fffffffff05e1d00
	lduha	[%i3+%o5]0x80,%l7	! %l7 = 000000000000ff00
!	Mem[0000000021800080] = ffff889d, %l5 = 00000000ffffffaa
	ldub	[%o3+0x081],%l5		! %l5 = 00000000000000ff
!	Mem[00000000218001c0] = 005e4628, %l1 = 000000000000005e
	ldsba	[%o3+0x1c1]%asi,%l1	! %l1 = 000000000000005e
!	Mem[00000000300c1400] = ff00000000000000, %f30 = 0000009b 00107ee0
	ldda	[%i3+%g0]0x81,%f30	! %f30 = ff000000 00000000
!	Mem[0000000030001408] = 5d1800ff000000ff, %l1 = 000000000000005e
	ldxa	[%i0+%o4]0x81,%l1	! %l1 = 5d1800ff000000ff
!	Starting 10 instruction Store Burst
!	%l4 = 00000000002a36d3, Mem[0000000010001400] = 90d5fc1e
	stwa	%l4,[%i0+%g0]0x88	! Mem[0000000010001400] = 002a36d3

p0_label_174:
!	%l3 = 0000000000000000, Mem[00000000100c1408] = adac9db5
	stwa	%l3,[%i3+%o4]0x88	! Mem[00000000100c1408] = 00000000
!	%f14 = 12ba6ace 90d5fc1e, Mem[0000000010041420] = 772efcfd 000000b0
	stda	%f14,[%i1+0x020]%asi	! Mem[0000000010041420] = 12ba6ace 90d5fc1e
!	Mem[0000000030081400] = 000000ff, %l0 = fffffffffff09f70
	ldstuba	[%i2+%g0]0x81,%l0	! %l0 = 00000000000000ff
!	Mem[0000000021800001] = 3ebde67b, %l0 = 0000000000000000
	ldstuba	[%o3+0x001]%asi,%l0	! %l0 = 000000bd000000ff
!	%l7 = 000000000000ff00, Mem[00000000201c0000] = a2ffe0d4, %asi = 80
	stba	%l7,[%o0+0x000]%asi	! Mem[00000000201c0000] = 00ffe0d4
!	%f2  = 00000000 ffffffd5, Mem[00000000100c1408] = 00000000 aa2effe5
	stda	%f2 ,[%i3+%o4]0x88	! Mem[00000000100c1408] = 00000000 ffffffd5
!	%f8  = 0dbd8189 10000000, Mem[0000000030081410] = 8ff4bef7 ffffffff
	stda	%f8 ,[%i2+%o5]0x81	! Mem[0000000030081410] = 0dbd8189 10000000
!	Mem[0000000030081408] = 95793ced, %l6 = 00000000000000ff
	ldstuba	[%i2+%o4]0x81,%l6	! %l6 = 00000095000000ff
!	%f8  = 0dbd8189 10000000, %l1 = 5d1800ff000000ff
!	Mem[0000000010081428] = 53a62c32000000ff
	add	%i2,0x028,%g1
	stda	%f8,[%g1+%l1]ASI_PST8_P ! Mem[0000000010081428] = 0dbd818910000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = adac9db5, %l0 = 00000000000000bd
	ldsba	[%i0+%o5]0x88,%l0	! %l0 = ffffffffffffffb5

p0_label_175:
!	Mem[00000000100c1410] = 000000ff, %l1 = 5d1800ff000000ff
	ldsba	[%i3+%o5]0x88,%l1	! %l1 = ffffffffffffffff
!	%f30 = ff000000, %f11 = ed3c7995, %f10 = db000000
	fdivs	%f30,%f11,%f10		! %f10 = 512ddbd2
!	Mem[0000000010181400] = 000000ff, %l3 = 0000000000000000
	lduwa	[%i6+%g0]0x80,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030001410] = 006c050e, %l4 = 00000000002a36d3
	lduba	[%i0+%o5]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000030181410] = 00000000, %l7 = 000000000000ff00
	ldsba	[%i6+%o5]0x81,%l7	! %l7 = 0000000000000000
!	Mem[00000000300c1410] = 9a000000, %l7 = 0000000000000000
	lduba	[%i3+%o5]0x81,%l7	! %l7 = 000000000000009a
!	Mem[0000000010101410] = 00000000ff000000, %l2 = 0000000000006c00
	ldxa	[%i4+%o5]0x80,%l2	! %l2 = 00000000ff000000
!	Mem[0000000030141410] = 1efcd590ff000000, %l1 = ffffffffffffffff
	ldxa	[%i5+%o5]0x89,%l1	! %l1 = 1efcd590ff000000
!	Mem[00000000100c1410] = 000000ff, %l3 = 00000000000000ff
	lduwa	[%i3+%o5]0x88,%l3	! %l3 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000030001410] = 0e056c00, %l5 = 00000000000000ff
	ldstuba	[%i0+%o5]0x89,%l5	! %l5 = 00000000000000ff

p0_label_176:
!	Code Fragment 3
p0_fragment_22:
!	%l0 = ffffffffffffffb5
	setx	0xd163d617dad6e529,%g7,%l0 ! %l0 = d163d617dad6e529
!	%l1 = 1efcd590ff000000
	setx	0xef8ca8dfc5196ed3,%g7,%l1 ! %l1 = ef8ca8dfc5196ed3
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = d163d617dad6e529
	setx	0x90e58a67d3130a5f,%g7,%l0 ! %l0 = 90e58a67d3130a5f
!	%l1 = ef8ca8dfc5196ed3
	setx	0x94660b68661fda6b,%g7,%l1 ! %l1 = 94660b68661fda6b
!	%l3 = 00000000000000ff, imm = fffffffffffffefd, %l0 = 90e58a67d3130a5f
	and	%l3,-0x103,%l0		! %l0 = 00000000000000fd
!	%l7 = 000000000000009a, Mem[00000000300c1410] = 0000009a
	stha	%l7,[%i3+%o5]0x89	! Mem[00000000300c1410] = 0000009a
!	%l7 = 000000000000009a, Mem[0000000010001413] = b59dacad
	stb	%l7,[%i0+0x013]		! Mem[0000000010001410] = b59dac9a
!	Mem[0000000010081430] = 0010a74c, %l3 = 00000000000000ff
	swap	[%i2+0x030],%l3		! %l3 = 000000000010a74c
!	%f0  = e07e1000, Mem[0000000010141400] = ffff0010
	sta	%f0 ,[%i5+%g0]0x80	! Mem[0000000010141400] = e07e1000
!	Mem[0000000020800000] = ffff8b5d, %l2 = 00000000ff000000
	ldstuba	[%o1+0x000]%asi,%l2	! %l2 = 000000ff000000ff
!	%l7 = 000000000000009a, Mem[0000000010181410] = 00aaffff
	stba	%l7,[%i6+%o5]0x80	! Mem[0000000010181410] = 9aaaffff
!	Mem[0000000010041408] = 10726dd6, %l5 = 00000000, %l7 = 0000009a
	add	%i1,0x08,%g1
	casa	[%g1]0x80,%l5,%l7	! %l7 = 0000000010726dd6
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = 00ffe0d4, %l7 = 0000000010726dd6
	lduba	[%o0+0x000]%asi,%l7	! %l7 = 0000000000000000

p0_label_177:
!	Mem[0000000010001410] = da87dee09aac9db5, %f10 = 512ddbd2 ed3c7995
	ldda	[%i0+%o5]0x88,%f10	! %f10 = da87dee0 9aac9db5
!	Mem[00000000100c1428] = 95793ced000000db, %f2  = 00000000 ffffffd5
	ldd	[%i3+0x028],%f2 	! %f2  = 95793ced 000000db
!	Mem[00000000100c143c] = ce6aba12, %l7 = 0000000000000000
	ldswa	[%i3+0x03c]%asi,%l7	! %l7 = ffffffffce6aba12
!	Mem[0000000010141410] = d4189176, %l6 = 0000000000000095
	lduwa	[%i5+%o5]0x88,%l6	! %l6 = 00000000d4189176
!	Mem[0000000030141408] = 00032e67ce6aba00, %l3 = 000000000010a74c
	ldxa	[%i5+%o4]0x89,%l3	! %l3 = 00032e67ce6aba00
!	Mem[00000000300c1410] = 9a00000033c35d18, %f2  = 95793ced 000000db
	ldda	[%i3+%o5]0x81,%f2 	! %f2  = 9a000000 33c35d18
!	Mem[0000000030101410] = 81d5c92d9a5dffbe, %f10 = da87dee0 9aac9db5
	ldda	[%i4+%o5]0x81,%f10	! %f10 = 81d5c92d 9a5dffbe
!	Mem[0000000010081400] = 00000000, %l5 = 0000000000000000
	lduha	[%i2+%g0]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000030141410] = 000000ff, %l4 = 0000000000000000
	ldsha	[%i5+%o5]0x81,%l4	! %l4 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l7 = ffffffffce6aba12, Mem[0000000030101400] = d3362a00
	stha	%l7,[%i4+%g0]0x89	! Mem[0000000030101400] = d336ba12

p0_label_178:
!	%f11 = 9a5dffbe, Mem[0000000010001410] = 9aac9db5
	sta	%f11,[%i0+%o5]0x88	! Mem[0000000010001410] = 9a5dffbe
!	%f18 = 00032e67, Mem[0000000010141400] = e07e1000
	sta	%f18,[%i5+%g0]0x80	! Mem[0000000010141400] = 00032e67
!	Mem[0000000010081428] = 0dbd8189, %l6 = 00000000d4189176
	ldstub	[%i2+0x028],%l6		! %l6 = 0000000d000000ff
!	%l5 = 0000000000000000, Mem[0000000010081410] = f7bef48f
	stha	%l5,[%i2+%o5]0x88	! Mem[0000000010081410] = f7be0000
!	Mem[0000000010081410] = f7be0000, %l3 = 00032e67ce6aba00
	ldstuba	[%i2+%o5]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030141408] = 00ba6ace, %l2 = 00000000000000ff
	ldstuba	[%i5+%o4]0x81,%l2	! %l2 = 00000000000000ff
!	%f12 = 4b9a26a4 11ff0000, Mem[0000000010081410] = ff00bef7 00000059
	stda	%f12,[%i2+0x010]%asi	! Mem[0000000010081410] = 4b9a26a4 11ff0000
!	%l0 = 00000000000000fd, Mem[0000000010181410] = 9aaaffff185dc333
	stxa	%l0,[%i6+%o5]0x80	! Mem[0000000010181410] = 00000000000000fd
!	Mem[0000000030181408] = 00000000, %l6 = 000000000000000d
	ldstuba	[%i6+%o4]0x89,%l6	! %l6 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = ff000000, %l3 = 0000000000000000
	ldsha	[%i5+%o5]0x89,%l3	! %l3 = 0000000000000000

p0_label_179:
!	%l7 = ffffffffce6aba12, imm = fffffffffffffdce, %l6 = 0000000000000000
	xnor	%l7,-0x232,%l6		! %l6 = ffffffffce6ab823
!	Mem[0000000010141400] = 00032e6700000000, %l2 = 0000000000000000
	ldxa	[%i5+%g0]0x80,%l2	! %l2 = 00032e6700000000
!	Mem[0000000010181400] = 000000ff, %f23 = 10000000
	lda	[%i6+%g0]0x80,%f23	! %f23 = 000000ff
!	Mem[0000000030041410] = 00000000ffffffff, %f30 = ff000000 00000000
	ldda	[%i1+%o5]0x89,%f30	! %f30 = 00000000 ffffffff
!	Mem[0000000030041408] = ffffffff00000081, %l5 = 0000000000000000
	ldxa	[%i1+%o4]0x81,%l5	! %l5 = ffffffff00000081
!	%l3 = 0000000000000000, imm = 0000000000000766, %l4 = 0000000000000000
	andn	%l3,0x766,%l4		! %l4 = 0000000000000000
!	Mem[0000000030081410] = 0dbd8189, %l0 = 00000000000000fd
	ldsba	[%i2+%o5]0x81,%l0	! %l0 = 000000000000000d
!	Mem[0000000010081400] = 00000000, %l1 = 94660b68661fda6b
	ldswa	[%i2+%g0]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000010001400] = d3362a00, %l5 = ffffffff00000081
	ldsha	[%i0+%g0]0x80,%l5	! %l5 = ffffffffffffd336
!	Starting 10 instruction Store Burst
!	%l0 = 000000000000000d, Mem[00000000300c1408] = 185dc333185dc333
	stxa	%l0,[%i3+%o4]0x81	! Mem[00000000300c1408] = 000000000000000d

p0_label_180:
!	%f20 = ff000000 00000000, %l6 = ffffffffce6ab823
!	Mem[0000000030141420] = 00000000e5ff2eaa
	add	%i5,0x020,%g1
	stda	%f20,[%g1+%l6]ASI_PST32_SL ! Mem[0000000030141420] = 00000000000000ff
!	%f4  = 4afffcea 55000000, Mem[0000000010181400] = ff000000 ffffffd5
	stda	%f4 ,[%i6+%g0]0x88	! Mem[0000000010181400] = 4afffcea 55000000
!	Mem[00000000100c143c] = ce6aba12, %l2 = 00032e6700000000, %asi = 80
	swapa	[%i3+0x03c]%asi,%l2	! %l2 = 00000000ce6aba12
!	%l4 = 0000000000000000, Mem[0000000010081408] = 00000000
	stha	%l4,[%i2+%o4]0x80	! Mem[0000000010081408] = 00000000
!	%f21 = 00000000, %f0  = e07e1000, %f24 = aa2effe5 ffffffff
	fsmuld	%f21,%f0 ,%f24		! %f24 = 80000000 00000000
!	%l2 = 00000000ce6aba12, Mem[0000000030081410] = 0dbd8189
	stha	%l2,[%i2+%o5]0x81	! Mem[0000000030081410] = ba128189
!	Mem[0000000030041410] = ffffffff, %l3 = 0000000000000000
	swapa	[%i1+%o5]0x89,%l3	! %l3 = 00000000ffffffff
!	%l4 = 0000000000000000, Mem[0000000030181408] = ff0000004b9a26a4
	stxa	%l4,[%i6+%o4]0x81	! Mem[0000000030181408] = 0000000000000000
!	%l5 = ffffffffffffd336, imm = 00000000000002cf, %l2 = 00000000ce6aba12
	xor	%l5,0x2cf,%l2		! %l2 = ffffffffffffd1f9
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = 00000000, %l1 = 0000000000000000
	ldsba	[%i1+%o5]0x89,%l1	! %l1 = 0000000000000000

p0_label_181:
!	Mem[00000000100c1408] = ffffffd5, %l7 = ffffffffce6aba12
	ldsha	[%i3+%o4]0x88,%l7	! %l7 = ffffffffffffffd5
!	%l3 = 00000000ffffffff, imm = 0000000000000ccd, %l5 = ffffffffffffd336
	andn	%l3,0xccd,%l5		! %l5 = 00000000fffff332
!	Mem[0000000010181408] = ffffaa00, %l1 = 0000000000000000
	lduha	[%i6+%o4]0x80,%l1	! %l1 = 000000000000ffff
!	Mem[0000000030141410] = 1efcd590ff000000, %l6 = ffffffffce6ab823
	ldxa	[%i5+%o5]0x89,%l6	! %l6 = 1efcd590ff000000
!	Mem[0000000030001408] = 5d1800ff, %l2 = ffffffffffffd1f9
	lduba	[%i0+%o4]0x81,%l2	! %l2 = 000000000000005d
!	Mem[00000000100c1430] = 0000ff11, %l7 = ffffffffffffffd5
	ldswa	[%i3+0x030]%asi,%l7	! %l7 = 000000000000ff11
!	Mem[0000000030081408] = ff793ced, %f9  = 10000000
	lda	[%i2+%o4]0x81,%f9 	! %f9 = ff793ced
!	Mem[0000000030101400] = 12ba36d3, %l4 = 0000000000000000
	ldstuba	[%i4+%g0]0x81,%l4	! %l4 = 00000012000000ff
!	Mem[0000000021800100] = 9f529500, %l6 = 1efcd590ff000000
	ldub	[%o3+0x100],%l6		! %l6 = 000000000000009f
!	Starting 10 instruction Store Burst
!	%l5 = 00000000fffff332, Mem[0000000030101408] = 000000ff
	stwa	%l5,[%i4+%o4]0x89	! Mem[0000000030101408] = fffff332

p0_label_182:
!	%f30 = 00000000 ffffffff, Mem[0000000030141408] = ffba6ace 672e0300
	stda	%f30,[%i5+%o4]0x81	! Mem[0000000030141408] = 00000000 ffffffff
!	%f22 = ff0000aa 000000ff, Mem[0000000030081410] = 898112ba 00000010
	stda	%f22,[%i2+%o5]0x89	! Mem[0000000030081410] = ff0000aa 000000ff
!	%l0 = 000000000000000d, Mem[0000000010141408] = 000000ffd40d8656
	stxa	%l0,[%i5+%o4]0x80	! Mem[0000000010141408] = 000000000000000d
!	Mem[00000000100c1410] = 000000ff, %l3 = 00000000ffffffff
	ldstuba	[%i3+%o5]0x88,%l3	! %l3 = 000000ff000000ff
!	%l4 = 0000000000000012, Mem[0000000010141414] = 00000000, %asi = 80
	stwa	%l4,[%i5+0x014]%asi	! Mem[0000000010141414] = 00000012
!	Mem[0000000010041408] = 10726dd6ce6aba12, %l7 = 000000000000ff11, %l2 = 000000000000005d
	add	%i1,0x08,%g1
	casxa	[%g1]0x80,%l7,%l2	! %l2 = 10726dd6ce6aba12
!	%l2 = 10726dd6ce6aba12, Mem[0000000030101410] = 81d5c92d
	stha	%l2,[%i4+%o5]0x81	! Mem[0000000030101410] = ba12c92d
!	Mem[0000000010101428] = 000000ff, %l4 = 00000012, %l3 = 000000ff
	add	%i4,0x28,%g1
	casa	[%g1]0x80,%l4,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010041400] = ffffffff, %l1 = 000000000000ffff
	ldstuba	[%i1+%g0]0x88,%l1	! %l1 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = 769118d400000012, %l7 = 000000000000ff11
	ldxa	[%i5+%o5]0x80,%l7	! %l7 = 769118d400000012

p0_label_183:
!	Mem[000000001014140c] = 0000000d, %f20 = ff000000
	lda	[%i5+0x00c]%asi,%f20	! %f20 = 0000000d
!	Mem[0000000030181410] = 0000000056000000, %l1 = 00000000000000ff
	ldxa	[%i6+%o5]0x81,%l1	! %l1 = 0000000056000000
!	Mem[0000000021800180] = ff114d6f, %l3 = 00000000000000ff
	ldsh	[%o3+0x180],%l3		! %l3 = ffffffffffffff11
!	Mem[0000000010041408] = 10726dd6, %f31 = ffffffff
	lda	[%i1+%o4]0x80,%f31	! %f31 = 10726dd6
!	%l2 = 10726dd6ce6aba12, immed = fffff411, %y  = ffffffff
	udiv	%l2,-0xbef,%l0		! %l0 = 00000000ffffffff
	mov	%l0,%y			! %y = ffffffff
!	Mem[00000000100c1410] = ff000000 0000005e, %l2 = ce6aba12, %l3 = ffffff11
	ldda	[%i3+%o5]0x80,%l2	! %l2 = 00000000ff000000 000000000000005e
!	Mem[0000000030001410] = 0e056cff, %l0 = 00000000ffffffff
	ldsba	[%i0+%o5]0x89,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010001410] = da87dee09a5dffbe, %f20 = 0000000d 00000000
	ldda	[%i0+%o5]0x88,%f20	! %f20 = da87dee0 9a5dffbe
!	Mem[0000000010181410] = 00000000, %l1 = 0000000056000000
	ldsb	[%i6+0x013],%l1		! %l1 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010001400] = d3362a00, %l0 = ffffffffffffffff
	ldstuba	[%i0+%g0]0x80,%l0	! %l0 = 000000d3000000ff

p0_label_184:
!	%f30 = 00000000 10726dd6, %l2 = 00000000ff000000
!	Mem[0000000030081438] = 10726dd6ce6aba12
	add	%i2,0x038,%g1
	stda	%f30,[%g1+%l2]ASI_PST16_S ! Mem[0000000030081438] = 10726dd6ce6aba12
!	%l4 = 0000000000000012, Mem[0000000020800001] = ffff8b5d
	stb	%l4,[%o1+0x001]		! Mem[0000000020800000] = ff128b5d
!	%l7 = 769118d400000012, Mem[0000000030181408] = 00000000
	stba	%l7,[%i6+%o4]0x81	! Mem[0000000030181408] = 12000000
!	%f12 = 4b9a26a4 11ff0000, Mem[0000000030081400] = ff0000ff eae5a617
	stda	%f12,[%i2+%g0]0x81	! Mem[0000000030081400] = 4b9a26a4 11ff0000
!	%f8  = 0dbd8189 ff793ced, Mem[0000000030141408] = 00000000 ffffffff
	stda	%f8 ,[%i5+%o4]0x89	! Mem[0000000030141408] = 0dbd8189 ff793ced
!	%l6 = 0000009f, %l7 = 00000012, Mem[0000000010181428] = ff000000 00000000
	std	%l6,[%i6+0x028]		! Mem[0000000010181428] = 0000009f 00000012
!	%f2  = 9a000000 33c35d18, Mem[0000000030141400] = 00000000 000000ff
	stda	%f2 ,[%i5+%g0]0x81	! Mem[0000000030141400] = 9a000000 33c35d18
!	%l6 = 000000000000009f, Mem[0000000010181400] = 55000000
	stwa	%l6,[%i6+%g0]0x88	! Mem[0000000010181400] = 0000009f
!	%l1 = 0000000000000000, Mem[0000000030141408] = ff793ced
	stwa	%l1,[%i5+%o4]0x89	! Mem[0000000030141408] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = 9a000000 33c35d18, %l4 = 00000012, %l5 = fffff332
	ldda	[%i3+%o5]0x81,%l4	! %l4 = 000000009a000000 0000000033c35d18

p0_label_185:
!	Mem[00000000300c1400] = 000000ff, %l5 = 0000000033c35d18
	ldswa	[%i3+%g0]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010141408] = 0d00000000000000, %f14 = 12ba6ace 90d5fc1e
	ldda	[%i5+%o4]0x88,%f14	! %f14 = 0d000000 00000000
!	Mem[0000000010101410] = 00000000, %f18 = 00032e67
	lda	[%i4+%o5]0x88,%f18	! %f18 = 00000000
!	Mem[00000000100c1410] = ff0000000000005e, %l5 = 00000000000000ff
	ldxa	[%i3+%o5]0x80,%l5	! %l5 = ff0000000000005e
!	Mem[0000000030181400] = bef70000, %l0 = 00000000000000d3
	lduwa	[%i6+%g0]0x81,%l0	! %l0 = 00000000bef70000
!	Mem[0000000010141408] = 00000000, %f17 = c5531740
	lda	[%i5+%o4]0x88,%f17	! %f17 = 00000000
!	Mem[0000000021800180] = ff114d6f, %l5 = ff0000000000005e
	ldsba	[%o3+0x180]%asi,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000030081400] = a4269a4b, %l2 = 00000000ff000000
	ldswa	[%i2+%g0]0x89,%l2	! %l2 = ffffffffa4269a4b
!	Mem[00000000100c1408] = d5ffffff, %l7 = 769118d400000012
	ldswa	[%i3+%o4]0x80,%l7	! %l7 = ffffffffd5ffffff
!	Starting 10 instruction Store Burst
!	%l3 = 000000000000005e, Mem[00000000300c1408] = 00000000
	stwa	%l3,[%i3+%o4]0x81	! Mem[00000000300c1408] = 0000005e

p0_label_186:
!	Mem[0000000030181410] = 00000000, %l7 = ffffffffd5ffffff
	ldstuba	[%i6+%o5]0x81,%l7	! %l7 = 00000000000000ff
!	Mem[00000000100c1438] = 1efcd59000000000, %l6 = 000000000000009f, %l0 = 00000000bef70000
	add	%i3,0x38,%g1
	casxa	[%g1]0x80,%l6,%l0	! %l0 = 1efcd59000000000
!	Mem[0000000010141400] = 00032e67, %l5 = ffffffffffffffff
	swapa	[%i5+%g0]0x80,%l5	! %l5 = 0000000000032e67
!	Mem[0000000010081428] = ffbd8189, %l6 = 0000009f, %l4 = 9a000000
	add	%i2,0x28,%g1
	casa	[%g1]0x80,%l6,%l4	! %l4 = 00000000ffbd8189
!	%l2 = a4269a4b, %l3 = 0000005e, Mem[0000000010001400] = ff362a00 00000000
	stda	%l2,[%i0+%g0]0x80	! Mem[0000000010001400] = a4269a4b 0000005e
!	Mem[00000000100c1410] = ff000000, %l4 = 00000000ffbd8189
	swapa	[%i3+%o5]0x80,%l4	! %l4 = 00000000ff000000
!	%l0 = 00000000, %l1 = 00000000, Mem[0000000010141400] = ffffffff 00000000
	stda	%l0,[%i5+%g0]0x80	! Mem[0000000010141400] = 00000000 00000000
!	%f8  = 0dbd8189 ff793ced, Mem[0000000010101400] = ffffffff 00000000
	stda	%f8 ,[%i4+%g0]0x88	! Mem[0000000010101400] = 0dbd8189 ff793ced
!	Mem[0000000030141410] = ff000000, %l0 = 1efcd59000000000
	ldstuba	[%i5+%o5]0x89,%l0	! %l0 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = ffffffd5, %l0 = 0000000000000000
	ldsba	[%i3+%o4]0x88,%l0	! %l0 = ffffffffffffffd5

p0_label_187:
!	Mem[0000000010041410] = 00000000000000ff, %f2  = 9a000000 33c35d18
	ldda	[%i1+0x010]%asi,%f2 	! %f2  = 00000000 000000ff
!	Mem[0000000030001408] = ff000000ff00185d, %f0  = e07e1000 9b000000
	ldda	[%i0+%o4]0x89,%f0 	! %f0  = ff000000 ff00185d
!	Mem[0000000030081408] = ff793ced000000db, %f0  = ff000000 ff00185d
	ldda	[%i2+%o4]0x81,%f0 	! %f0  = ff793ced 000000db
!	Mem[0000000030101408] = fffff332, %l4 = 00000000ff000000
	lduba	[%i4+%o4]0x89,%l4	! %l4 = 0000000000000032
!	Mem[00000000100c1430] = 0000ff11, %l6 = 000000000000009f
	ldswa	[%i3+0x030]%asi,%l6	! %l6 = 000000000000ff11
!	Mem[0000000030081410] = ff000000, %l1 = 0000000000000000
	ldsha	[%i2+%o5]0x81,%l1	! %l1 = ffffffffffffff00
!	Mem[00000000100c1400] = 0000009b, %l4 = 0000000000000032
	ldswa	[%i3+%g0]0x80,%l4	! %l4 = 000000000000009b
!	%f1  = 000000db, %f20 = da87dee0, %f30 = 00000000
	fmuls	%f1 ,%f20,%f30		! %l0 = fffffffffffffff7, Unfinished, %fsr = 1a00000400
!	Mem[0000000010101400] = ed3c79ff, %l6 = 000000000000ff11
	ldsba	[%i4+%g0]0x80,%l6	! %l6 = ffffffffffffffed
!	Starting 10 instruction Store Burst
!	Mem[0000000010181418] = 0dbd81898aa67893, %l2 = ffffffffa4269a4b, %l2 = ffffffffa4269a4b
	add	%i6,0x18,%g1
	casxa	[%g1]0x80,%l2,%l2	! %l2 = 0dbd81898aa67893

p0_label_188:
!	%f24 = 80000000 00000000, Mem[0000000010181410] = 00000000 000000fd
	stda	%f24,[%i6+%o5]0x80	! Mem[0000000010181410] = 80000000 00000000
!	Mem[00000000100c1400] = 9b000000, %l7 = 0000000000000000
	swapa	[%i3+%g0]0x88,%l7	! %l7 = 000000009b000000
!	%f8  = 0dbd8189 ff793ced, Mem[0000000010101408] = 00000000 00000000
	stda	%f8 ,[%i4+%o4]0x80	! Mem[0000000010101408] = 0dbd8189 ff793ced
!	%f16 = 3f93c8b3 00000000 00000000 ce6aba12
!	%f20 = da87dee0 9a5dffbe ff0000aa 000000ff
!	%f24 = 80000000 00000000 00000072 94c2fd7c
!	%f28 = 000000ff 000000ff 00000000 10726dd6
	stda	%f16,[%i6]ASI_BLK_PL	! Block Store to 0000000010181400
!	Mem[0000000010081408] = 00000000, %l0 = fffffffffffffff7
	swapa	[%i2+%o4]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000010041408] = 10726dd6, %l6 = ffffffffffffffed
	swapa	[%i1+%o4]0x80,%l6	! %l6 = 0000000010726dd6
!	%l3 = 000000000000005e, Mem[0000000010001414] = e0de87da, %asi = 80
	stha	%l3,[%i0+0x014]%asi	! Mem[0000000010001414] = 005e87da
!	%f0  = ff793ced 000000db 00000000 000000ff
!	%f4  = 4afffcea 55000000 00000000 00000000
!	%f8  = 0dbd8189 ff793ced 81d5c92d 9a5dffbe
!	%f12 = 4b9a26a4 11ff0000 0d000000 00000000
	stda	%f0,[%i0]ASI_BLK_SL	! Block Store to 0000000030001400
!	%l2 = 0dbd81898aa67893, Mem[0000000010041400] = ffffffff
	stba	%l2,[%i1+%g0]0x88	! Mem[0000000010041400] = ffffff93
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = 0000005e0000000d, %l6 = 0000000010726dd6
	ldxa	[%i3+%o4]0x81,%l6	! %l6 = 0000005e0000000d

p0_label_189:
!	Mem[0000000010141430] = 4b9aa617, %l5 = 0000000000032e67
	ldsw	[%i5+0x030],%l5		! %l5 = 000000004b9aa617
!	Mem[0000000030081408] = db000000 ed3c79ff, %l6 = 0000000d, %l7 = 9b000000
	ldda	[%i2+%o4]0x89,%l6	! %l6 = 00000000ed3c79ff 00000000db000000
!	Mem[0000000010101410] = 00000000, %l3 = 000000000000005e
	lduba	[%i4+%o5]0x88,%l3	! %l3 = 0000000000000000
!	Mem[00000000100c1410] = 8981bdff, %l3 = 0000000000000000
	lduha	[%i3+%o5]0x88,%l3	! %l3 = 000000000000bdff
!	Mem[0000000021800000] = 3effe67b, %l7 = 00000000db000000
	lduba	[%o3+0x000]%asi,%l7	! %l7 = 000000000000003e
!	Mem[0000000010041400] = ffffff93, %f30 = 00000000
	lda	[%i1+%g0]0x88,%f30	! %f30 = ffffff93
!	Mem[0000000030141410] = ff0000ff, %l2 = 0dbd81898aa67893
	ldsha	[%i5+%o5]0x81,%l2	! %l2 = ffffffffffffff00
!	Mem[00000000300c1410] = 9a000000 33c35d18, %l0 = 00000000, %l1 = ffffff00
	ldda	[%i3+%o5]0x81,%l0	! %l0 = 000000009a000000 0000000033c35d18
!	Mem[0000000010081410] = 4b9a26a4, %l1 = 0000000033c35d18
	ldsha	[%i2+%o5]0x80,%l1	! %l1 = 0000000000004b9a
!	Starting 10 instruction Store Burst
!	Mem[0000000030141410] = ff0000ff, %l4 = 000000000000009b
	ldstuba	[%i5+%o5]0x89,%l4	! %l4 = 000000ff000000ff

p0_label_190:
!	Mem[0000000010041410] = 00000000, %l4 = 00000000000000ff
	ldstuba	[%i1+%o5]0x88,%l4	! %l4 = 00000000000000ff
!	%f28 = 000000ff 000000ff, %l5 = 000000004b9aa617
!	Mem[0000000030141428] = 7cfdc29472000000
	add	%i5,0x028,%g1
	stda	%f28,[%g1+%l5]ASI_PST16_S ! Mem[0000000030141428] = 7cfd00ff000000ff
!	%l5 = 000000004b9aa617, Mem[0000000030001408] = 000000ff
	stwa	%l5,[%i0+%o4]0x89	! Mem[0000000030001408] = 4b9aa617
!	%l6 = 00000000ed3c79ff, Mem[00000000300c1410] = 0000009a
	stwa	%l6,[%i3+%o5]0x89	! Mem[00000000300c1410] = ed3c79ff
	membar	#Sync			! Added by membar checker (23)
!	Mem[0000000010001410] = beff5d9a, %l2 = ffffffffffffff00
	ldstuba	[%i0+%o5]0x80,%l2	! %l2 = 000000be000000ff
!	Mem[0000000030001410] = 00000055, %l5 = 000000004b9aa617
	ldstuba	[%i0+%o5]0x81,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010041408] = ffffffed, %l4 = 0000000000000000
	swapa	[%i1+%o4]0x80,%l4	! %l4 = 00000000ffffffed
!	Mem[0000000030181408] = 12000000, %l4 = 00000000ffffffed
	ldsha	[%i6+%o4]0x81,%l4	! %l4 = 0000000000001200
!	%l6 = 00000000ed3c79ff, Mem[00000000201c0000] = 00ffe0d4, %asi = 80
	stha	%l6,[%o0+0x000]%asi	! Mem[00000000201c0000] = 79ffe0d4
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = a4269a4b, %l5 = 0000000000000000
	ldswa	[%i0+%g0]0x80,%l5	! %l5 = ffffffffa4269a4b

p0_label_191:
!	Mem[00000000300c1400] = 000000ff, %l1 = 0000000000004b9a
	ldsha	[%i3+%g0]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010081418] = 00000000 e8004aef, %l6 = ed3c79ff, %l7 = 0000003e
	ldda	[%i2+0x018]%asi,%l6	! %l6 = 0000000000000000 00000000e8004aef
!	Mem[0000000010181410] = beff5d9ae0de87da, %l3 = 000000000000bdff
	ldxa	[%i6+0x010]%asi,%l3	! %l3 = beff5d9ae0de87da
!	Mem[0000000010001400] = a4269a4b, %l5 = ffffffffa4269a4b
	ldsba	[%i0+%g0]0x80,%l5	! %l5 = ffffffffffffffa4
!	Mem[0000000030081410] = ff000000, %l1 = 00000000000000ff
	lduha	[%i2+%o5]0x81,%l1	! %l1 = 000000000000ff00
!	%l6 = 0000000000000000, %l0 = 000000009a000000, %l3 = beff5d9ae0de87da
	xnor	%l6,%l0,%l3		! %l3 = ffffffff65ffffff
!	%l7 = 00000000e8004aef, imm = 0000000000000b15, %l4 = 0000000000001200
	xnor	%l7,0xb15,%l4		! %l4 = ffffffff17ffbe05
!	Mem[0000000010001410] = ffff5d9a, %l2 = 00000000000000be
	ldsb	[%i0+%o5],%l2		! %l2 = ffffffffffffffff
!	Mem[0000000010181410] = beff5d9ae0de87da, %l1 = 000000000000ff00
	ldxa	[%i6+%o5]0x80,%l1	! %l1 = beff5d9ae0de87da
!	Starting 10 instruction Store Burst
!	Mem[0000000010181408] = ce6aba12, %l7 = 00000000e8004aef
	ldstuba	[%i6+%o4]0x88,%l7	! %l7 = 00000012000000ff

p0_label_192:
!	%f12 = 4b9a26a4 11ff0000, Mem[0000000010141410] = d4189176 12000000
	stda	%f12,[%i5+%o5]0x88	! Mem[0000000010141410] = 4b9a26a4 11ff0000
!	%f0  = ff793ced 000000db, Mem[0000000030101410] = 2dc912ba beff5d9a
	stda	%f0 ,[%i4+%o5]0x89	! Mem[0000000030101410] = ff793ced 000000db
!	%f4  = 4afffcea 55000000, %l6 = 0000000000000000
!	Mem[0000000030141430] = 12ba6aced66d7210
	add	%i5,0x030,%g1
	stda	%f4,[%g1+%l6]ASI_PST8_SL ! Mem[0000000030141430] = 12ba6aced66d7210
!	%l6 = 00000000, %l7 = 00000012, Mem[0000000010081410] = 4b9a26a4 11ff0000
	stda	%l6,[%i2+%o5]0x80	! Mem[0000000010081410] = 00000000 00000012
!	%f30 = ffffff93 10726dd6, %l2 = ffffffffffffffff
!	Mem[0000000030181428] = 8a7bd7049c3b6b63
	add	%i6,0x028,%g1
	stda	%f30,[%g1+%l2]ASI_PST16_S ! Mem[0000000030181428] = ffffff9310726dd6
!	Mem[0000000030001408] = 4b9aa617, %l2 = ffffffffffffffff
	ldstuba	[%i0+%o4]0x89,%l2	! %l2 = 00000017000000ff
!	Mem[0000000030101408] = 32f3ffff, %l3 = ffffffff65ffffff
	swapa	[%i4+%o4]0x81,%l3	! %l3 = 0000000032f3ffff
!	%f16 = 3f93c8b3 00000000, Mem[0000000010101410] = 00000000 000000ff
	stda	%f16,[%i4+%o5]0x88	! Mem[0000000010101410] = 3f93c8b3 00000000
!	%l7 = 0000000000000012, Mem[0000000010141410] = 11ff0000
	stwa	%l7,[%i5+%o5]0x88	! Mem[0000000010141410] = 00000012
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = 9a000000, %l0 = 000000009a000000
	lduba	[%i5+%g0]0x81,%l0	! %l0 = 000000000000009a

p0_label_193:
!	Mem[000000001004142c] = 185dc333, %f10 = 81d5c92d
	ld	[%i1+0x02c],%f10	! %f10 = 185dc333
!	Mem[0000000010081410] = 00000000, %l6 = 0000000000000000
	ldswa	[%i2+%o5]0x88,%l6	! %l6 = 0000000000000000
!	Mem[00000000211c0000] = ffff4340, %l7 = 0000000000000012
	ldsb	[%o2+%g0],%l7		! %l7 = ffffffffffffffff
!	Mem[0000000020800000] = ff128b5d, %l0 = 000000000000009a
	lduha	[%o1+0x000]%asi,%l0	! %l0 = 000000000000ff12
!	Mem[0000000020800040] = ff4d0596, %l2 = 0000000000000017
	ldub	[%o1+0x041],%l2		! %l2 = 000000000000004d
!	Mem[0000000030141400] = 0000009a, %l5 = ffffffffffffffa4
	ldsha	[%i5+%g0]0x89,%l5	! %l5 = 000000000000009a
!	Mem[00000000100c1438] = 1efcd59000000000, %l7 = ffffffffffffffff
	ldxa	[%i3+0x038]%asi,%l7	! %l7 = 1efcd59000000000
!	Mem[00000000300c1410] = ed3c79ff, %l1 = beff5d9ae0de87da
	lduwa	[%i3+%o5]0x89,%l1	! %l1 = 00000000ed3c79ff
!	Mem[0000000030081410] = ff000000, %l1 = 00000000ed3c79ff
	lduha	[%i2+%o5]0x81,%l1	! %l1 = 000000000000ff00
!	Starting 10 instruction Store Burst
!	%f16 = 3f93c8b3, Mem[0000000030041400] = f7bef48f
	sta	%f16,[%i1+%g0]0x81	! Mem[0000000030041400] = 3f93c8b3

p0_label_194:
!	%l0 = 000000000000ff12, Mem[0000000010141408] = 000000000000000d, %asi = 80
	stxa	%l0,[%i5+0x008]%asi	! Mem[0000000010141408] = 000000000000ff12
!	%l6 = 00000000, %l7 = 00000000, Mem[0000000030101410] = 000000db ff793ced
	stda	%l6,[%i4+%o5]0x89	! Mem[0000000030101410] = 00000000 00000000
!	%l3 = 0000000032f3ffff, Mem[00000000201c0000] = 79ffe0d4, %asi = 80
	stha	%l3,[%o0+0x000]%asi	! Mem[00000000201c0000] = ffffe0d4
!	%f8  = 0dbd8189 ff793ced, Mem[00000000300c1408] = 0000005e 0000000d
	stda	%f8 ,[%i3+%o4]0x81	! Mem[00000000300c1408] = 0dbd8189 ff793ced
!	%l6 = 00000000, %l7 = 00000000, Mem[0000000010101410] = 00000000 b3c8933f
	stda	%l6,[%i4+%o5]0x80	! Mem[0000000010101410] = 00000000 00000000
!	%l0 = 0000ff12, %l1 = 0000ff00, Mem[0000000010141410] = 12000000 a4269a4b
	stda	%l0,[%i5+%o5]0x80	! Mem[0000000010141410] = 0000ff12 0000ff00
!	%l3 = 0000000032f3ffff, Mem[0000000010081408] = fffffff700000000
	stxa	%l3,[%i2+%o4]0x80	! Mem[0000000010081408] = 0000000032f3ffff
!	%l4 = 17ffbe05, %l5 = 0000009a, Mem[0000000030181410] = ff000000 56000000
	stda	%l4,[%i6+%o5]0x81	! Mem[0000000030181410] = 17ffbe05 0000009a
!	%l6 = 0000000000000000, Mem[0000000030181408] = 00000012
	stwa	%l6,[%i6+%o4]0x89	! Mem[0000000030181408] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = ff000000, %l4 = ffffffff17ffbe05
	lduwa	[%i0+0x008]%asi,%l4	! %l4 = 00000000ff000000

p0_label_195:
!	Mem[0000000030181400] = bef70000, %l4 = 00000000ff000000
	ldswa	[%i6+%g0]0x81,%l4	! %l4 = ffffffffbef70000
!	Mem[0000000020800040] = ff4d0596, %l0 = 000000000000ff12
	ldsha	[%o1+0x040]%asi,%l0	! %l0 = ffffffffffffff4d
!	%f29 = 000000ff, %f8  = 0dbd8189
	fsqrts	%f29,%f8 		! %l0 = ffffffffffffff6f, Unfinished, %fsr = 1a00000400
!	Mem[0000000010041418] = 0000000000000000, %l0 = ffffffffffffff6f
	ldx	[%i1+0x018],%l0		! %l0 = 0000000000000000
!	Mem[0000000010041410] = 000000ff, %l5 = 000000000000009a
	ldsba	[%i1+%o5]0x88,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000030141408] = 00000000, %l3 = 0000000032f3ffff
	ldsha	[%i5+%o4]0x89,%l3	! %l3 = 0000000000000000
!	%l7 = 1efcd59000000000, %l3 = 0000000000000000, %l7 = 1efcd59000000000
	sdivx	%l7,%l3,%l7		! Div by zero, %l0 = 0000000000000050
!	Mem[00000000211c0000] = ffff4340, %l7 = 1efcd59000000000
	ldsha	[%o2+0x000]%asi,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010041420] = 12ba6ace, %l0 = 0000000000000028
	ldsw	[%i1+0x020],%l0		! %l0 = 0000000012ba6ace
!	Starting 10 instruction Store Burst
!	%f10 = 185dc333, Mem[00000000100c1414] = 0000005e
	sta	%f10,[%i3+0x014]%asi	! Mem[00000000100c1414] = 185dc333

p0_label_196:
!	%f0  = ff793ced 000000db 00000000 000000ff
!	%f4  = 4afffcea 55000000 00000000 00000000
!	%f8  = 0dbd8189 ff793ced 185dc333 9a5dffbe
!	%f12 = 4b9a26a4 11ff0000 0d000000 00000000
	stda	%f0,[%i3]ASI_BLK_AIUSL	! Block Store to 00000000300c1400
!	%l0 = 12ba6ace, %l1 = 0000ff00, Mem[0000000030001410] = ff000055 eafcff4a
	stda	%l0,[%i0+%o5]0x81	! Mem[0000000030001410] = 12ba6ace 0000ff00
!	%l7 = ffffffffffffffff, Mem[0000000010041400] = 93ffffff
	stba	%l7,[%i1+%g0]0x80	! Mem[0000000010041400] = ffffffff
!	%l7 = ffffffffffffffff, Mem[00000000201c0000] = ffffe0d4
	sth	%l7,[%o0+%g0]		! Mem[00000000201c0000] = ffffe0d4
!	%l2 = 0000004d, %l3 = 00000000, Mem[0000000030101400] = ffba36d3 00005d18
	stda	%l2,[%i4+%g0]0x81	! Mem[0000000030101400] = 0000004d 00000000
!	Mem[0000000010141408] = 00000000, %l1 = 000000000000ff00
	swapa	[%i5+%o4]0x80,%l1	! %l1 = 0000000000000000
!	%l2 = 000000000000004d, Mem[0000000010141422] = 0dbdff89, %asi = 80
	stba	%l2,[%i5+0x022]%asi	! Mem[0000000010141420] = 0dbd4d89
!	Mem[000000001008140c] = 32f3ffff, %l0 = 0000000012ba6ace
	swap	[%i2+0x00c],%l0		! %l0 = 0000000032f3ffff
!	%f22 = ff0000aa, Mem[0000000030181400] = 0000f7be
	sta	%f22,[%i6+%g0]0x89	! Mem[0000000030181400] = ff0000aa
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = 0000ff11 a4269a4b, %l4 = bef70000, %l5 = ffffffff
	ldda	[%i2+%g0]0x89,%l4	! %l4 = 00000000a4269a4b 000000000000ff11

p0_label_197:
!	Mem[0000000030081400] = a4269a4b, %l7 = ffffffffffffffff
	ldswa	[%i2+%g0]0x89,%l7	! %l7 = ffffffffa4269a4b
!	Mem[0000000030041408] = ffffffff, %l5 = 000000000000ff11
	lduba	[%i1+%o4]0x89,%l5	! %l5 = 00000000000000ff
	membar	#Sync			! Added by membar checker (24)
!	Mem[0000000030101400] = 0000004d 00000000 65ffffff 11ff0000
!	Mem[0000000030101410] = 00000000 00000000 c8abde0b ba10dc28
!	Mem[0000000030101420] = 5ab60844 afafea85 1ee35897 00000000
!	Mem[0000000030101430] = 92df3465 715a3ea5 796d3fe2 9dcc20cf
	ldda	[%i4]ASI_BLK_S,%f0	! Block Load from 0000000030101400
!	Mem[0000000010041400] = ffffffff 185dc333, %l6 = 00000000, %l7 = a4269a4b
	ldda	[%i1+%g0]0x80,%l6	! %l6 = 00000000ffffffff 00000000185dc333
!	Mem[0000000030101410] = 00000000, %l1 = 0000000000000000
	lduba	[%i4+%o5]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000030101408] = 65ffffff11ff0000, %f18 = 00000000 ce6aba12
	ldda	[%i4+%o4]0x81,%f18	! %f18 = 65ffffff 11ff0000
!	Mem[0000000030181410] = 17ffbe05, %l7 = 00000000185dc333
	lduha	[%i6+%o5]0x81,%l7	! %l7 = 00000000000017ff
!	Mem[00000000300c1410] = 55000000, %l1 = 0000000000000000
	ldsba	[%i3+%o5]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000030181408] = 00000000, %l2 = 000000000000004d
	ldswa	[%i6+%o4]0x89,%l2	! %l2 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l4 = 00000000a4269a4b, Mem[0000000010181400] = 00000000
	stwa	%l4,[%i6+%g0]0x80	! Mem[0000000010181400] = a4269a4b

p0_label_198:
!	%f28 = 000000ff 000000ff, Mem[0000000010101428] = 000000ff 7eee8d5c
	stda	%f28,[%i4+0x028]%asi	! Mem[0000000010101428] = 000000ff 000000ff
!	%f30 = ffffff93 10726dd6, Mem[00000000300c1400] = db000000 ed3c79ff
	stda	%f30,[%i3+%g0]0x81	! Mem[00000000300c1400] = ffffff93 10726dd6
!	%l3 = 0000000000000000, Mem[00000000300c1400] = ffffff93
	stwa	%l3,[%i3+%g0]0x81	! Mem[00000000300c1400] = 00000000
!	Mem[0000000030081408] = ff793ced, %l0 = 0000000032f3ffff
	ldstuba	[%i2+%o4]0x81,%l0	! %l0 = 000000ff000000ff
!	%f20 = da87dee0 9a5dffbe, %l2 = 0000000000000000
!	Mem[00000000100c1410] = ffbd8189185dc333
	add	%i3,0x010,%g1
	stda	%f20,[%g1+%l2]ASI_PST8_P ! Mem[00000000100c1410] = ffbd8189185dc333
!	%f31 = 10726dd6, Mem[0000000030001410] = ce6aba12
	sta	%f31,[%i0+%o5]0x89	! Mem[0000000030001410] = 10726dd6
!	Mem[00000000100c1410] = ffbd8189, %l6 = 00000000ffffffff
	swapa	[%i3+%o5]0x80,%l6	! %l6 = 00000000ffbd8189
!	Mem[0000000030101400] = 4d000000, %l3 = 0000000000000000
	swapa	[%i4+%g0]0x89,%l3	! %l3 = 000000004d000000
!	%l5 = 00000000000000ff, Mem[0000000030081400] = a4269a4b
	stwa	%l5,[%i2+%g0]0x89	! Mem[0000000030081400] = 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = 0000000000000000, %l0 = 00000000000000ff
	ldxa	[%i4+%g0]0x81,%l0	! %l0 = 0000000000000000

p0_label_199:
!	Mem[0000000010001400] = 4b9a26a4, %l0 = 0000000000000000
	ldswa	[%i0+%g0]0x88,%l0	! %l0 = 000000004b9a26a4
!	Mem[0000000030141400] = 0000009a, %l3 = 000000004d000000
	ldsba	[%i5+%g0]0x89,%l3	! %l3 = ffffffffffffff9a
!	Mem[0000000010001408] = ff000000, %l4 = 00000000a4269a4b
	lduba	[%i0+%o4]0x80,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030081408] = db000000 ed3c79ff, %l4 = 000000ff, %l5 = 000000ff
	ldda	[%i2+%o4]0x89,%l4	! %l4 = 00000000ed3c79ff 00000000db000000
!	%l3 = ffffffffffffff9a, immed = 00000a3c, %y  = ffffffff
	sdiv	%l3,0xa3c,%l7		! %l7 = 0000000000000000
	mov	%l0,%y			! %y = 4b9a26a4
!	Mem[000000001004141c] = 00000000, %f16 = 3f93c8b3
	ld	[%i1+0x01c],%f16	! %f16 = 00000000
!	Mem[0000000030141408] = 000000008981bd0d, %l6 = 00000000ffbd8189
	ldxa	[%i5+%o4]0x81,%l6	! %l6 = 000000008981bd0d
!	Mem[0000000020800040] = ff4d0596, %l7 = 0000000000000000
	lduh	[%o1+0x040],%l7		! %l7 = 000000000000ff4d
!	Mem[0000000030041410] = 00000000, %l1 = 0000000000000000
	lduwa	[%i1+%o5]0x89,%l1	! %l1 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010141410] = 0000ff120000ff00, %l7 = 000000000000ff4d, %l6 = 000000008981bd0d
	add	%i5,0x10,%g1
	casxa	[%g1]0x80,%l7,%l6	! %l6 = 0000ff120000ff00

p0_label_200:
!	%l2 = 0000000000000000, Mem[0000000030041408] = ffffffff
	stha	%l2,[%i1+%o4]0x81	! Mem[0000000030041408] = 0000ffff
!	%l2 = 0000000000000000, Mem[00000000100c1408] = d5ffffff00000000
	stxa	%l2,[%i3+%o4]0x80	! Mem[00000000100c1408] = 0000000000000000
!	%l2 = 00000000, %l3 = ffffff9a, Mem[0000000010181400] = a4269a4b b3c8933f
	stda	%l2,[%i6+%g0]0x80	! Mem[0000000010181400] = 00000000 ffffff9a
!	%f16 = 00000000 00000000, Mem[0000000010041408] = 00000000 ce6aba12
	stda	%f16,[%i1+%o4]0x80	! Mem[0000000010041408] = 00000000 00000000
!	%l0 = 4b9a26a4, %l1 = 00000000, Mem[0000000010081400] = 00000000 0044c957
	std	%l0,[%i2+%g0]		! Mem[0000000010081400] = 4b9a26a4 00000000
!	Mem[000000001010140c] = ff793ced, %l5 = 00000000db000000
	swap	[%i4+0x00c],%l5		! %l5 = 00000000ff793ced
!	%l4 = 00000000ed3c79ff, Mem[0000000010041408] = 00000000
	stha	%l4,[%i1+%o4]0x80	! Mem[0000000010041408] = 79ff0000
!	%l3 = ffffffffffffff9a, Mem[0000000010081408] = 00000000
	stha	%l3,[%i2+%o4]0x80	! Mem[0000000010081408] = ff9a0000
!	Mem[0000000010001404] = 0000005e, %l0 = 4b9a26a4, %l7 = 0000ff4d
	add	%i0,0x04,%g1
	casa	[%g1]0x80,%l0,%l7	! %l7 = 000000000000005e
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = 000000ff, %l0 = 000000004b9a26a4
	ldswa	[%i1+%o5]0x88,%l0	! %l0 = 00000000000000ff

	ba,a	p0_not_taken_0_end
p0_not_taken_0:
!	The following code should not be executed
	sdiv	%l3,%l7,%l0
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
	cmp	%l1,%g2			! %l1 should be 0000000000000000
	bne,a,pn %xcc,p0_reg_l1_fail
	mov	%l1,%g3
	ldx	[%g1+0x010],%g2
	cmp	%l2,%g2			! %l2 should be 0000000000000000
	bne,a,pn %xcc,p0_reg_l2_fail
	mov	%l2,%g3
	ldx	[%g1+0x018],%g2
	cmp	%l3,%g2			! %l3 should be ffffffffffffff9a
	bne,a,pn %xcc,p0_reg_l3_fail
	mov	%l3,%g3
	ldx	[%g1+0x020],%g2
	cmp	%l4,%g2			! %l4 should be 00000000ed3c79ff
	bne,a,pn %xcc,p0_reg_l4_fail
	mov	%l4,%g3
	ldx	[%g1+0x028],%g2
	cmp	%l5,%g2			! %l5 should be 00000000ff793ced
	bne,a,pn %xcc,p0_reg_l5_fail
	mov	%l5,%g3
	ldx	[%g1+0x030],%g2
	cmp	%l6,%g2			! %l6 should be 0000ff120000ff00
	bne,a,pn %xcc,p0_reg_l6_fail
	mov	%l6,%g3
	ldx	[%g1+0x038],%g2
	cmp	%l7,%g2			! %l7 should be 000000000000005e
	bne,a,pn %xcc,p0_reg_l7_fail
	mov	%l7,%g3

!	Check %y register

	set	0x4b9a26a4,%g2
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
	cmp	%l0,%l1			! %f0  should be 0000004d 00000000
	bne	%xcc,p0_f0_fail
	std	%f2,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x08],%l0
	cmp	%l0,%l1			! %f2  should be 65ffffff 11ff0000
	bne	%xcc,p0_f2_fail
	std	%f4,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x10],%l0
	cmp	%l0,%l1			! %f4  should be 00000000 00000000
	bne	%xcc,p0_f4_fail
	std	%f6,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x18],%l0
	cmp	%l0,%l1			! %f6  should be c8abde0b ba10dc28
	bne	%xcc,p0_f6_fail
	std	%f8,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x20],%l0
	cmp	%l0,%l1			! %f8  should be 5ab60844 afafea85
	bne	%xcc,p0_f8_fail
	std	%f10,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x28],%l0
	cmp	%l0,%l1			! %f10 should be 1ee35897 00000000
	bne	%xcc,p0_f10_fail
	std	%f12,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x30],%l0
	cmp	%l0,%l1			! %f12 should be 92df3465 715a3ea5
	bne	%xcc,p0_f12_fail
	std	%f14,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x38],%l0
	cmp	%l0,%l1			! %f14 should be 796d3fe2 9dcc20cf
	bne	%xcc,p0_f14_fail
	std	%f16,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x40],%l0
	cmp	%l0,%l1			! %f16 should be 00000000 00000000
	bne	%xcc,p0_f16_fail
	std	%f18,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x48],%l0
	cmp	%l0,%l1			! %f18 should be 65ffffff 11ff0000
	bne	%xcc,p0_f18_fail
	std	%f20,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x50],%l0
	cmp	%l0,%l1			! %f20 should be da87dee0 9a5dffbe
	bne	%xcc,p0_f20_fail
	std	%f22,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x58],%l0
	cmp	%l0,%l1			! %f22 should be ff0000aa 000000ff
	bne	%xcc,p0_f22_fail
	std	%f24,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x60],%l0
	cmp	%l0,%l1			! %f24 should be 80000000 00000000
	bne	%xcc,p0_f24_fail
	std	%f26,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x68],%l0
	cmp	%l0,%l1			! %f26 should be 00000072 94c2fd7c
	bne	%xcc,p0_f26_fail
	std	%f28,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x70],%l0
	cmp	%l0,%l1			! %f28 should be 000000ff 000000ff
	bne	%xcc,p0_f28_fail
	std	%f30,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x78],%l0
	cmp	%l0,%l1			! %f30 should be ffffff93 10726dd6
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
	xnor	%l2,0x3c7,%l3
	done

p0_trap1o:
	xnor	%l2,0x3c7,%l3
	done


p0_trap2e:
	fsubs	%f7 ,%f12,%f13
	done

p0_trap2o:
	fsubs	%f7 ,%f12,%f13
	done


p0_trap3e:
	or	%l1,%l1,%l3
	xnor	%l1,0x4eb,%l2
	andn	%l5,0xbbb,%l1
	and	%l0,%l2,%l2
	xor	%l1,0xf9e,%l5
	subc	%l1,%l5,%l5
	done

p0_trap3o:
	or	%l1,%l1,%l3
	xnor	%l1,0x4eb,%l2
	andn	%l5,0xbbb,%l1
	and	%l0,%l2,%l2
	xor	%l1,0xf9e,%l5
	subc	%l1,%l5,%l5
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
	ldx	[%g1+0x000],%l0		! %l0 = ff49b51e11fb0551
	ldx	[%g1+0x008],%l1		! %l1 = 3d41a2f407a983c7
	ldx	[%g1+0x010],%l2		! %l2 = 314fc2742e86e6c5
	ldx	[%g1+0x018],%l3		! %l3 = 1d36d2384c6eeaed
	ldx	[%g1+0x020],%l4		! %l4 = e003b5cea923ef4d
	ldx	[%g1+0x028],%l5		! %l5 = a04179762d2ff124
	ldx	[%g1+0x030],%l6		! %l6 = ce96c1ebfcfa7d02
	ldx	[%g1+0x038],%l7		! %l7 = 1df067a2adf81584

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
	xnor	%l2,0x3c7,%l3
	addc	%l5,%l1,%l4
	fsqrts	%f12,%f13
	fsubs	%f4 ,%f6 ,%f0 
	swap	[%i5+0x000],%l3		! Mem[0000000010141400]
	fcmps	%fcc0,%f12,%f12
	smul	%l4,-0x30a,%l5
	jmpl	%o7,%g0
	addc	%l6,-0x090,%l6
p0_near_0_he:
	jmpl	%o7,%g0
	ldsb	[%i1+0x012],%l5		! Mem[0000000010041412]
	jmpl	%o7,%g0
	nop
near0_b2b_h:
	jmpl	%o7,%g0
	or	%l4,%l4,%l2
	jmpl	%o7,%g0
	nop
near0_b2b_l:
	jmpl	%o7,%g0
	orn	%l2,0xbd4,%l2
	jmpl	%o7,%g0
	nop
user_near0_end:
	.seg	"text"
	.align	0x2000
user_near1_start:
p0_near_1_le:
	xor	%l4,-0x6e7,%l4
	jmpl	%o7,%g0
	sub	%l1,%l1,%l0
p0_near_1_he:
	and	%l6,0x521,%l0
	jmpl	%o7,%g0
	fsqrts	%f22,%f29
near1_b2b_h:
	xnor	%l1,%l1,%l5
	orn	%l3,%l6,%l5
	sub	%l6,0x243,%l5
	jmpl	%o7,%g0
	orn	%l2,%l6,%l4
near1_b2b_l:
	addc	%l3,0x086,%l6
	smul	%l5,%l2,%l7
	fadds	%f4 ,%f15,%f10
	jmpl	%o7,%g0
	sdivx	%l2,%l3,%l3
user_near1_end:
	.seg	"text"
	.align	0x2000
user_near2_start:
p0_near_2_le:
	smul	%l1,0x14e,%l1
	jmpl	%o7,%g0
	fadds	%f9 ,%f7 ,%f8 
p0_near_2_he:
	ldsb	[%i5+0x00b],%l4		! Mem[000000001014140b]
	xnor	%l5,%l6,%l6
	ldstub	[%i4+0x005],%l4		! Mem[0000000010101405]
	addc	%l6,%l6,%l2
	udivx	%l2,-0xeeb,%l6
	mulx	%l0,%l2,%l0
	jmpl	%o7,%g0
	sdivx	%l7,-0x22f,%l2
near2_b2b_h:
	fsubs	%f24,%f26,%f24
	udivx	%l4,%l6,%l7
	jmpl	%o7,%g0
	xnor	%l7,%l7,%l7
near2_b2b_l:
	andn	%l6,%l5,%l1
	fdivs	%f13,%f1 ,%f11
	jmpl	%o7,%g0
	sdivx	%l2,-0xe73,%l2
user_near2_end:
	.seg	"text"
	.align	0x2000
user_near3_start:
p0_near_3_le:
	jmpl	%o7,%g0
	xor	%l4,%l2,%l6
	jmpl	%o7,%g0
	nop
p0_near_3_he:
	xnor	%l3,%l0,%l0
	smul	%l0,%l3,%l6
	jmpl	%o7,%g0
	smul	%l2,%l1,%l3
near3_b2b_h:
	jmpl	%o7,%g0
	fadds	%f18,%f29,%f26
	jmpl	%o7,%g0
	nop
near3_b2b_l:
	jmpl	%o7,%g0
	andn	%l3,%l0,%l0
	jmpl	%o7,%g0
	nop
user_near3_end:
	.seg	"text"
	.text
	.align	0x2000
user_far0_start:
p0_far_0_le:
	andn	%l7,-0x0fa,%l2
	addc	%l1,%l7,%l4
	orn	%l6,%l2,%l7
	fcmps	%fcc3,%f10,%f4 
	umul	%l5,-0xd7e,%l5
	sdivx	%l0,0x4ce,%l0
	jmpl	%o7,%g0
	fadds	%f6 ,%f0 ,%f0 
p0_far_0_lem:
	andn	%l7,-0x0fa,%l2
	addc	%l1,%l7,%l4
	orn	%l6,%l2,%l7
	fcmps	%fcc3,%f10,%f4 
	umul	%l5,-0xd7e,%l5
	sdivx	%l0,0x4ce,%l0
	jmpl	%o7,%g0
	fadds	%f6 ,%f0 ,%f0 
p0_far_0_he:
	jmpl	%o7,%g0
	fdivs	%f24,%f21,%f24
	jmpl	%o7,%g0
	nop
p0_far_0_hem:
	jmpl	%o7,%g0
	fdivs	%f24,%f21,%f24
	jmpl	%o7,%g0
	nop
p0_loop_branch_0:
	jmpl	%o7+12,%g0
	add	%l0,1,%l0
far0_b2b_h:
	addc	%l7,%l2,%l0
	jmpl	%o7,%g0
	mulx	%l2,0x102,%l4
far0_b2b_l:
	addc	%l5,-0xa47,%l3
	jmpl	%o7,%g0
	mulx	%l2,%l1,%l4
user_far0_end:
	.seg	"text"
	.text
	.align	0x2000
user_far1_start:
p0_far_1_le:
	fsubs	%f0 ,%f14,%f7 
	jmpl	%o7,%g0
	or	%l6,-0x7fc,%l3
p0_far_1_lem:
	fsubs	%f0 ,%f14,%f7 
	jmpl	%o7,%g0
	or	%l6,-0x7fc,%l3
p0_far_1_he:
	addc	%l0,0xf8b,%l3
	fmuls	%f18,%f27,%f18
	fsqrts	%f24,%f22
	jmpl	%o7,%g0
	andn	%l2,-0x04d,%l6
p0_far_1_hem:
	addc	%l0,0xf8b,%l3
	fmuls	%f18,%f27,%f18
	fsqrts	%f24,%f22
	jmpl	%o7,%g0
	andn	%l2,-0x04d,%l6
p0_loop_branch_1:
	jmpl	%o7+12,%g0
	add	%l0,2,%l0
far1_b2b_h:
	xnor	%l5,-0x9b2,%l4
	fdivs	%f19,%f18,%f16
	smul	%l1,%l4,%l2
	fsqrts	%f24,%f29
	andn	%l3,0xf94,%l4
	fsubs	%f30,%f30,%f20
	udivx	%l3,%l1,%l6
	jmpl	%o7,%g0
	umul	%l2,-0x464,%l7
far1_b2b_l:
	xnor	%l0,%l7,%l7
	fadds	%f10,%f14,%f9 
	addc	%l0,%l3,%l7
	subc	%l6,0x850,%l7
	umul	%l6,-0xbc3,%l0
	mulx	%l5,%l7,%l5
	orn	%l4,%l7,%l2
	jmpl	%o7,%g0
	fdivs	%f7 ,%f15,%f11
user_far1_end:
	.seg	"text"
	.text
	.align	0x2000
user_far2_start:
p0_far_2_le:
	fdivs	%f8 ,%f3 ,%f3 
	umul	%l6,-0x44f,%l2
	ldub	[%i3+0x021],%l2		! Mem[00000000100c1421]
	ld	[%i2+0x030],%f3 	! Mem[0000000010081430]
	stw	%l4,[%i0+0x024]		! Mem[0000000010001424]
	sdivx	%l4,-0x217,%l3
	jmpl	%o7,%g0
	fdtos	%f4 ,%f3 
p0_far_2_lem:
	fdivs	%f8 ,%f3 ,%f3 
	umul	%l6,-0x44f,%l2
	membar	#Sync
	ldub	[%i3+0x021],%l2		! Mem[00000000100c1421]
	ld	[%i2+0x030],%f3 	! Mem[0000000010081430]
	stw	%l4,[%i0+0x024]		! Mem[0000000010001424]
	sdivx	%l4,-0x217,%l3
	jmpl	%o7,%g0
	fdtos	%f4 ,%f3 
p0_far_2_he:
	smul	%l5,%l7,%l5
	umul	%l6,0x901,%l4
	or	%l7,0x8b9,%l2
	udivx	%l0,%l2,%l2
	jmpl	%o7,%g0
	fcmps	%fcc0,%f30,%f25
p0_far_2_hem:
	smul	%l5,%l7,%l5
	umul	%l6,0x901,%l4
	or	%l7,0x8b9,%l2
	udivx	%l0,%l2,%l2
	jmpl	%o7,%g0
	fcmps	%fcc0,%f30,%f25
p0_loop_branch_2:
	jmpl	%o7+12,%g0
	add	%l0,3,%l0
far2_b2b_h:
	sub	%l2,%l0,%l3
	jmpl	%o7,%g0
	smul	%l2,-0xef0,%l4
far2_b2b_l:
	fdivs	%f2 ,%f12,%f5 
	jmpl	%o7,%g0
	fadds	%f13,%f8 ,%f1 
user_far2_end:
	.seg	"text"
	.text
	.align	0x2000
user_far3_start:
p0_far_3_le:
	ldd	[%i0+0x030],%f4 	! Mem[0000000010001430]
	jmpl	%o7,%g0
	addc	%l4,0xf68,%l6
p0_far_3_lem:
	membar	#Sync
	ldd	[%i0+0x030],%f4 	! Mem[0000000010001430]
	jmpl	%o7,%g0
	addc	%l4,0xf68,%l6
p0_far_3_he:
	fdivs	%f27,%f20,%f30
	sdivx	%l6,%l1,%l6
	xor	%l5,%l1,%l5
	xor	%l5,%l6,%l6
	sdivx	%l3,%l2,%l2
	subc	%l6,%l7,%l1
	jmpl	%o7,%g0
	ldd	[%i1+0x028],%l2		! Mem[0000000010041428]
p0_far_3_hem:
	fdivs	%f27,%f20,%f30
	sdivx	%l6,%l1,%l6
	xor	%l5,%l1,%l5
	xor	%l5,%l6,%l6
	sdivx	%l3,%l2,%l2
	subc	%l6,%l7,%l1
	membar	#Sync
	jmpl	%o7,%g0
	ldd	[%i1+0x028],%l2		! Mem[0000000010041428]
p0_loop_branch_3:
	jmpl	%o7+12,%g0
	add	%l0,4,%l0
far3_b2b_h:
	sdivx	%l2,-0xedc,%l6
	sdivx	%l3,-0x552,%l5
	xnor	%l0,%l4,%l4
	subc	%l1,-0xc66,%l4
	jmpl	%o7,%g0
	smul	%l4,%l5,%l1
far3_b2b_l:
	fsqrts	%f1 ,%f1 
	umul	%l0,0xc12,%l3
	sdivx	%l1,%l5,%l6
	subc	%l5,%l7,%l7
	jmpl	%o7,%g0
	andn	%l7,%l0,%l2
user_far3_end:
	.seg	"text"
	.align	0x2000
user_jump0_start:
	INIT_MEM(0, 0x0010, 1, +, 0, +, 0)
p0_jmpl_0_le:
	mulx	%l7,-0x279,%l2
	sdivx	%l1,-0x969,%l5
	fcmps	%fcc0,%f11,%f13
	fadds	%f1 ,%f14,%f4 
	ld	[%i3+0x020],%f12	! Mem[00000000100c1420]
	and	%l4,%l5,%l4
	fsubs	%f14,%f14,%f6 
	jmpl	%g6+8,%g0
	xor	%l0,-0x2b3,%l3
p0_call_0_le:
	fmuls	%f2 ,%f8 ,%f5 
	sdivx	%l5,0xba9,%l3
	sdivx	%l6,-0x89d,%l5
	mulx	%l0,%l2,%l1
	retl
	sub	%l4,0x835,%l1
p0_jmpl_0_lo:
	mulx	%l7,-0x279,%l2
	sdivx	%l1,-0x969,%l5
	fcmps	%fcc0,%f11,%f13
	fadds	%f1 ,%f14,%f4 
	ld	[%o3+0x020],%f12	! Mem[00000000100c1420]
	and	%l4,%l5,%l4
	fsubs	%f14,%f14,%f6 
	jmpl	%g6+8,%g0
	xor	%l0,-0x2b3,%l3
p0_call_0_lo:
	fmuls	%f2 ,%f8 ,%f5 
	sdivx	%l5,0xba9,%l3
	sdivx	%l6,-0x89d,%l5
	mulx	%l0,%l2,%l1
	retl
	sub	%l4,0x835,%l1
p0_jmpl_0_he:
	fdivs	%f25,%f24,%f23
	or	%l0,%l1,%l1
	jmpl	%g6+8,%g0
	or	%l6,%l1,%l0
p0_call_0_he:
	fdivs	%f29,%f19,%f16
	fadds	%f20,%f18,%f19
	addc	%l0,0x63c,%l0
	subc	%l0,-0xd61,%l3
	retl
	xnor	%l4,%l4,%l7
p0_jmpl_0_ho:
	fdivs	%f25,%f24,%f23
	or	%l0,%l1,%l1
	jmpl	%g6+8,%g0
	or	%l6,%l1,%l0
p0_call_0_ho:
	fdivs	%f29,%f19,%f16
	fadds	%f20,%f18,%f19
	addc	%l0,0x63c,%l0
	subc	%l0,-0xd61,%l3
	retl
	xnor	%l4,%l4,%l7
user_jump0_end:
	.seg	"text"
	.align	0x2000
user_jump1_start:
	INIT_MEM(0, 0x0020, 1, +, 0, +, 0)
p0_jmpl_1_le:
	andn	%l6,-0x60a,%l6
	udivx	%l3,%l4,%l7
	jmpl	%g6+8,%g0
	umul	%l2,%l3,%l4
p0_call_1_le:
	sub	%l3,-0x8d1,%l5
	xor	%l7,%l1,%l5
	fsubs	%f6 ,%f13,%f3 
	fstoi	%f4 ,%f15
	umul	%l1,%l2,%l7
	retl
	subc	%l0,%l2,%l6
p0_jmpl_1_lo:
	andn	%l6,-0x60a,%l6
	udivx	%l3,%l4,%l7
	jmpl	%g6+8,%g0
	umul	%l2,%l3,%l4
p0_call_1_lo:
	sub	%l3,-0x8d1,%l5
	xor	%l7,%l1,%l5
	fsubs	%f6 ,%f13,%f3 
	fstoi	%f4 ,%f15
	umul	%l1,%l2,%l7
	retl
	subc	%l0,%l2,%l6
p0_jmpl_1_he:
	addc	%l0,-0x21a,%l7
	xnor	%l1,%l7,%l6
	or	%l7,0x7b6,%l0
	jmpl	%g6+8,%g0
	sdivx	%l7,0x55c,%l7
p0_call_1_he:
	xor	%l1,%l2,%l3
	mulx	%l2,0xd44,%l6
	retl
	fdivs	%f19,%f25,%f30
p0_jmpl_1_ho:
	addc	%l0,-0x21a,%l7
	xnor	%l1,%l7,%l6
	or	%l7,0x7b6,%l0
	jmpl	%g6+8,%g0
	sdivx	%l7,0x55c,%l7
p0_call_1_ho:
	xor	%l1,%l2,%l3
	mulx	%l2,0xd44,%l6
	retl
	fdivs	%f19,%f25,%f30
user_jump1_end:
	.seg	"text"
	.align	0x2000
user_jump2_start:
	INIT_MEM(0, 0x0030, 1, +, 0, +, 0)
p0_jmpl_2_le:
	fcmps	%fcc1,%f11,%f12
	andn	%l3,0x071,%l6
	xnor	%l5,%l7,%l5
	fdivs	%f10,%f13,%f14
	jmpl	%g6+8,%g0
	xnor	%l4,0xb1b,%l1
p0_call_2_le:
	fdivs	%f9 ,%f1 ,%f14
	fmuls	%f10,%f11,%f15
	addc	%l5,%l1,%l7
	retl
	mulx	%l4,%l3,%l4
p0_jmpl_2_lo:
	fcmps	%fcc1,%f11,%f12
	andn	%l3,0x071,%l6
	xnor	%l5,%l7,%l5
	fdivs	%f10,%f13,%f14
	jmpl	%g6+8,%g0
	xnor	%l4,0xb1b,%l1
p0_call_2_lo:
	fdivs	%f9 ,%f1 ,%f14
	fmuls	%f10,%f11,%f15
	addc	%l5,%l1,%l7
	retl
	mulx	%l4,%l3,%l4
p0_jmpl_2_he:
	sub	%l7,%l6,%l3
	sdivx	%l2,%l1,%l3
	jmpl	%g6+8,%g0
	sdivx	%l5,0xbe3,%l2
p0_call_2_he:
	fdivs	%f26,%f23,%f19
	add	%l2,-0x5ed,%l7
	fcmps	%fcc2,%f31,%f26
	fsubs	%f29,%f21,%f27
	subc	%l5,-0x3ca,%l2
	retl
	or	%l3,%l6,%l7
p0_jmpl_2_ho:
	sub	%l7,%l6,%l3
	sdivx	%l2,%l1,%l3
	jmpl	%g6+8,%g0
	sdivx	%l5,0xbe3,%l2
p0_call_2_ho:
	fdivs	%f26,%f23,%f19
	add	%l2,-0x5ed,%l7
	fcmps	%fcc2,%f31,%f26
	fsubs	%f29,%f21,%f27
	subc	%l5,-0x3ca,%l2
	retl
	or	%l3,%l6,%l7
user_jump2_end:
	.seg	"text"
	.align	0x2000
user_jump3_start:
	INIT_MEM(0, 0x0040, 1, +, 0, +, 0)
p0_jmpl_3_le:
	jmpl	%g6+8,%g0
	udivx	%l3,0x844,%l6
p0_call_3_le:
	retl
	udivx	%l0,%l5,%l4
p0_jmpl_3_lo:
	jmpl	%g6+8,%g0
	udivx	%l3,0x844,%l6
p0_call_3_lo:
	retl
	udivx	%l0,%l5,%l4
p0_jmpl_3_he:
	fitod	%f18,%f20
	xnor	%l1,-0xb0d,%l5
	fcmps	%fcc0,%f18,%f23
	smul	%l5,%l2,%l6
	jmpl	%g6+8,%g0
	smul	%l4,%l1,%l5
p0_call_3_he:
	retl
	sdivx	%l5,-0xbc6,%l7
p0_jmpl_3_ho:
	fitod	%f18,%f20
	xnor	%l1,-0xb0d,%l5
	fcmps	%fcc0,%f18,%f23
	smul	%l5,%l2,%l6
	jmpl	%g6+8,%g0
	smul	%l4,%l1,%l5
p0_call_3_ho:
	retl
	sdivx	%l5,-0xbc6,%l7
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
	.word	0xff49b51e,0x11fb0551		! Init value for %l0
	.word	0x3d41a2f4,0x07a983c7		! Init value for %l1
	.word	0x314fc274,0x2e86e6c5		! Init value for %l2
	.word	0x1d36d238,0x4c6eeaed		! Init value for %l3
	.word	0xe003b5ce,0xa923ef4d		! Init value for %l4
	.word	0xa0417976,0x2d2ff124		! Init value for %l5
	.word	0xce96c1eb,0xfcfa7d02		! Init value for %l6
	.word	0x1df067a2,0xadf81584		! Init value for %l7
	.align	64
p0_init_freg:
	.word	0x387f1b3a,0xc1a2f912		! Init value for %f0 
	.word	0xb2e7a718,0xbeddaa90		! Init value for %f2 
	.word	0xdb3a9fba,0x03f28cb6		! Init value for %f4 
	.word	0xe8565995,0x01d8c311		! Init value for %f6 
	.word	0x085ef8fc,0x55bcd0e4		! Init value for %f8 
	.word	0x35f9d9b5,0x68749b12		! Init value for %f10
	.word	0x2c1dcc99,0xd99016a7		! Init value for %f12
	.word	0x0018a914,0x55a60ace		! Init value for %f14
	.word	0xc1a82d81,0x111e5971		! Init value for %f16
	.word	0xb10adae6,0x8a09d43e		! Init value for %f18
	.word	0xbb92c521,0x41a7ae52		! Init value for %f20
	.word	0x4d93d50d,0x0b1ebad0		! Init value for %f22
	.word	0x9e9ca80e,0x337245b2		! Init value for %f24
	.word	0x2236a3af,0x06650118		! Init value for %f26
	.word	0xac70227c,0x5ce5d8d4		! Init value for %f28
	.word	0x0276f658,0x0431947f		! Init value for %f30
	.word	0x3ecdbc03,0x71e4ea53		! Init value for %f32
	.word	0x1710a812,0xcea693c9		! Init value for %f34
	.word	0xfde79f25,0x8a6374ca		! Init value for %f36
	.word	0xd46301df,0x90ce83db		! Init value for %f38
	.word	0x636fd3ef,0x1ad7fb31		! Init value for %f40
	.word	0xe5088c92,0x96a3bd26		! Init value for %f42
	.word	0xcb9116a8,0xc483699f		! Init value for %f44
	.word	0x6447987d,0x0adb3b9a		! Init value for %f46
	.word	0xf70c78ae,0x18f8f9ca
	.word	0x62ba8d1e,0xca5f9294
	.word	0x8b2f9190,0x2916c0b6
	.word	0x2ea5d0b8,0xfd11ff3d
	.word	0x8f3a873f,0x39fc7405
	.word	0x706f1217,0x2b1b8b60
	.word	0xcfcdd6e6,0x829c1c80
	.word	0x1ec553bd,0x40326384
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
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000000
	.word	0xffffffff,0xffffff9a
	.word	0x00000000,0xed3c79ff
	.word	0x00000000,0xff793ced
	.word	0x0000ff12,0x0000ff00
	.word	0x00000000,0x0000005e
p0_expected_fp_regs:
	.word	0x0000004d,0x00000000
	.word	0x65ffffff,0x11ff0000
	.word	0x00000000,0x00000000
	.word	0xc8abde0b,0xba10dc28
	.word	0x5ab60844,0xafafea85
	.word	0x1ee35897,0x00000000
	.word	0x92df3465,0x715a3ea5
	.word	0x796d3fe2,0x9dcc20cf
	.word	0x00000000,0x00000000
	.word	0x65ffffff,0x11ff0000
	.word	0xda87dee0,0x9a5dffbe
	.word	0xff0000aa,0x000000ff
	.word	0x80000000,0x00000000
	.word	0x00000072,0x94c2fd7c
	.word	0x000000ff,0x000000ff
	.word	0xffffff93,0x10726dd6
	.word	0x0000001a,0x00000400		! %fsr = 0000001a00000400
p0_local0_expect:
	.word	0xa4269a4b,0x0000005e
	.word	0xff000000,0x00000000
	.word	0xffff5d9a,0x005e87da
	.word	0x00000000,0x005ea001
	.word	0x59c9c11a,0xe009ff00
	.word	0x00000000,0x69305030
	.word	0x00000000,0x00000000
	.word	0xff0000aa,0x10000000
p0_local0_sec_expect:
	.word	0xdb000000,0xed3c79ff
	.word	0xffa69a4b,0x00000000
	.word	0xd66d7210,0x0000ff00
	.word	0x00000000,0x00000000
	.word	0xed3c79ff,0x8981bd0d
	.word	0xbeff5d9a,0x2dc9d581
	.word	0x0000ff11,0xa4269a4b
	.word	0x00000000,0x0000000d
p0_local1_expect:
	.word	0xffffffff,0x185dc333
	.word	0x79ff0000,0x00000000
	.word	0xff000000,0x000000ff
	.word	0x00000000,0x00000000
	.word	0x12ba6ace,0x90d5fc1e
	.word	0x69305030,0x185dc333
	.word	0x8aa63b93,0x00003054
	.word	0x62000000,0x00000000
p0_local1_sec_expect:
	.word	0x3f93c8b3,0x000000ce
	.word	0x0000ffff,0x00000081
	.word	0x00000000,0x00000000
	.word	0xff000053,0x745ba25e
	.word	0xe9af3b9c,0x04d7358c
	.word	0x530432d3,0x00000000
	.word	0x00000000,0x622572cc
	.word	0xff000000,0x322ca653
p0_local2_expect:
	.word	0x4b9a26a4,0x00000000
	.word	0xff9a0000,0x12ba6ace
	.word	0x00000000,0x00000012
	.word	0x00000000,0xe8004aef
	.word	0x185dc333,0x00000000
	.word	0xffbd8189,0x10000000
	.word	0x000000ff,0x0000f7be
	.word	0x00000072,0x94c2fd7c
p0_local2_sec_expect:
	.word	0xff000000,0x11ff0000
	.word	0xff793ced,0x000000db
	.word	0xff000000,0xaa0000ff
	.word	0xff005b74,0x00000000
	.word	0x5102096a,0x00000000
	.word	0x6b4822b7,0x530000ff
	.word	0xe0090000,0xa4269a4b
	.word	0x10726dd6,0xce6aba12
p0_local3_expect:
	.word	0x00000000,0x00107ee0
	.word	0x00000000,0x00000000
	.word	0xffffffff,0x185dc333
	.word	0x5cb0ee7e,0x3054c578
	.word	0x568600b0,0x8981bd0d
	.word	0x95793ced,0x000000db
	.word	0x0000ff11,0xa4269a4b
	.word	0x1efcd590,0x00000000
p0_local3_sec_expect:
	.word	0x00000000,0x10726dd6
	.word	0xff000000,0x00000000
	.word	0x00000055,0xeafcff4a
	.word	0x00000000,0x00000000
	.word	0xed3c79ff,0x8981bd0d
	.word	0xbeff5d9a,0x33c35d18
	.word	0x0000ff11,0xa4269a4b
	.word	0x00000000,0x0000000d
p0_local4_expect:
	.word	0xed3c79ff,0x8981bd0d
	.word	0x0dbd8189,0xdb000000
	.word	0x00000000,0x00000000
	.word	0x0dbd8189,0x8aa63b93
	.word	0x00000000,0x1000ffff
	.word	0x000000ff,0x000000ff
	.word	0xf05e1d00,0x3357ee94
	.word	0xff0000aa,0x10000000
p0_local4_sec_expect:
	.word	0x00000000,0x00000000
	.word	0x65ffffff,0x11ff0000
	.word	0x00000000,0x00000000
	.word	0xc8abde0b,0xba10dc28
	.word	0x5ab60844,0xafafea85
	.word	0x1ee35897,0x00000000
	.word	0x92df3465,0x715a3ea5
	.word	0x796d3fe2,0x9dcc20cf
p0_local5_expect:
	.word	0x00000000,0x00000000
	.word	0x0000ff00,0x0000ff12
	.word	0x0000ff12,0x0000ff00
	.word	0x000000aa,0xffee8d5c
	.word	0x0dbd4d89,0x8aa63b93
	.word	0x8ddb922c,0xed3c7995
	.word	0x4b9aa617,0x2ab73dc9
	.word	0x12ba6ace,0x2d6d7210
p0_local5_sec_expect:
	.word	0x9a000000,0x33c35d18
	.word	0x00000000,0x8981bd0d
	.word	0xff0000ff,0x90d5fc1e
	.word	0x00000010,0xaa0000ff
	.word	0x00000000,0x000000ff
	.word	0x7cfd00ff,0x000000ff
	.word	0x12ba6ace,0xd66d7210
	.word	0x10000000,0x00000000
p0_local6_expect:
	.word	0x00000000,0xffffff9a
	.word	0xffba6ace,0x00000000
	.word	0xbeff5d9a,0xe0de87da
	.word	0xff000000,0xaa0000ff
	.word	0x00000000,0x00000080
	.word	0x7cfdc294,0x72000000
	.word	0xff000000,0xff000000
	.word	0xd66d7210,0x00000000
p0_local6_sec_expect:
	.word	0xaa0000ff,0x170f8656
	.word	0x00000000,0x00000000
	.word	0x17ffbe05,0x0000009a
	.word	0x469497b9,0x7c55eadd
	.word	0x6ea696bb,0x42107eed
	.word	0xffffff93,0x10726dd6
	.word	0xc0856eb2,0x32dfe348
	.word	0x82e676b7,0x1bbb1267
share0_expect:
	.word	0xffffe0d4,0xd09d1d7a
	.word	0x08a80033,0x48d0f2db
	.word	0xeb7c318d,0xc4652e46
	.word	0x112a0a4d,0xcc058e15
	.word	0x88be50cc,0x93709c76
	.word	0x24cdc99a,0xdf6ccd37
	.word	0xfa0ad68d,0x9940871f
	.word	0x3586ea56,0xe3e882f4
share1_expect:
	.word	0xff128b5d,0x8ac09e07
	.word	0xf6907c13,0xd3207f33
	.word	0x6dd9203c,0xf50c43c6
	.word	0xf844231d,0x5834b7d1
	.word	0x7161b8de,0x9566dceb
	.word	0xa4b80961,0xd8123da5
	.word	0xea0923c2,0xb7d92df3
	.word	0xac387fca,0xd47cfc23
	.word	0xff4d0596,0x576f6df7
	.word	0xa94c222c,0xae2dee29
	.word	0xc041bda4,0xb50dbff1
	.word	0xa83367eb,0x7b936eab
	.word	0x50840aaa,0x53152742
	.word	0xcf490078,0x4661afb9
	.word	0xbcd00b0b,0xe3d4ddb3
	.word	0x4b7dfed5,0xc47a1edc
share2_expect:
	.word	0xffff4340,0xff9bcb15
	.word	0x7ab0f17e,0xfa761bb4
	.word	0x66adc16e,0x21bea823
	.word	0x286dda68,0x40aecb02
	.word	0x43cf3024,0x577da23d
	.word	0x11d67c0b,0x67d47058
	.word	0x2f5f3c23,0x452a102b
	.word	0x97f1a8e2,0xbd38e5a4
share3_expect:
	.word	0x3effe67b,0x4af5440f
	.word	0x6e4230b7,0xcb6dd0bb
	.word	0x525a5289,0x08fa567e
	.word	0xe382a2ed,0xdd929863
	.word	0x557422e5,0x5c54beae
	.word	0x91622f36,0x1abb7c47
	.word	0x77eef8b2,0x0eac4d32
	.word	0x319fedba,0x4f851f16
	.word	0xffff75ef,0xb118980e
	.word	0x491ce849,0xfd8bce8c
	.word	0xdf3ba0a8,0x56d1a323
	.word	0x3547574c,0xd859ee26
	.word	0xea9f1fa6,0xabec0d82
	.word	0xba87fd5b,0xd5a4bfd6
	.word	0x4551f4dd,0x98c03f81
	.word	0x4625949f,0x1f580d2d
	.word	0xffff889d,0xaef34bd6
	.word	0xa4cfdca5,0xced368b8
	.word	0x40ed646d,0x71013c62
	.word	0x39667ee1,0xa7ea2b6b
	.word	0x84a2df9d,0x3f3e8c44
	.word	0x9c2d2217,0x04321266
	.word	0x5b839ce3,0xff45226c
	.word	0x1f09ac20,0x39e39992
	.word	0xffffafd4,0x9c8c2ae4
	.word	0x9916d0ea,0x3627dfa6
	.word	0xd6d71318,0x020d6c51
	.word	0xc3990231,0xca950aa1
	.word	0xe17e648a,0xbb7f3647
	.word	0x137d935f,0x7c65f4f6
	.word	0x88372fb6,0xe05fce86
	.word	0x1d8bacfb,0xc4ff8ad3
	.word	0x9f529500,0xf258c169
	.word	0xc0f68fd4,0x723d93a2
	.word	0x1d0e0f58,0x6b8f1605
	.word	0xccb37270,0xabb6b0b7
	.word	0xe9a58feb,0x825888fc
	.word	0xa9624a0d,0xab49e44e
	.word	0x16ddc094,0x3942bdd9
	.word	0x265c2bac,0x1526385e
	.word	0xc9c4df64,0x47feb736
	.word	0xd3d67e17,0x14dfd304
	.word	0x19f50c4d,0x63d52af8
	.word	0x9fdc49f0,0x41db8c78
	.word	0xcee740ce,0x5e91c5a6
	.word	0x98cba266,0x8c5474de
	.word	0xdb55b548,0x4703f7c9
	.word	0xfe49cc64,0x8ceb8760
	.word	0xff114d6f,0x26943da0
	.word	0xd52b35b0,0x66489df5
	.word	0x5e58bfad,0xab4351ba
	.word	0xd5a03e3c,0xae9b9319
	.word	0xe69dcf06,0x79880b86
	.word	0x5a645434,0xe99749c6
	.word	0x186327fc,0x53a2cdf1
	.word	0x25b45d97,0x1f566b08
	.word	0x005e4628,0xfbb8668c
	.word	0x359fdccc,0x5ea6a355
	.word	0xec6d750e,0x92b81437
	.word	0x7daa8402,0x4ec06b35
	.word	0xe3277130,0xa1a3b495
	.word	0x5b2ccce1,0x78058e00
	.word	0x2e4f70ab,0x4d276e1e
	.word	0xe93bb563,0xf2c86e68
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
	.word	0x8f6d4058,0x367d2e34
	.word	0x00000000,0x00000002
	.word	0x47c95f30,0x34200d7e
	.word	0x00000000,0x00000003
	.word	0x0964cb3f,0x92fcaeed
	.word	0x00000000,0x00000004
	.word	0x64ad54af,0x9d8ada50
	.word	0x00000000,0x00000005
	.word	0xba4c302f,0x80f71b64
	.word	0x00000000,0x00000006
	.word	0x1ef26b18,0x42532a4c
	.word	0x00000000,0x00000007
	.word	0x44f22c07,0xfed232ed
	.word	0x00000000,0x00000008
	.word	0xcc89fdb0,0x3fd5e7dd
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
	.word	0xc55e4cc8,0x8c8408f9,0xabfbcd2c,0x297c2a6b
	.word	0x6ba957a3,0x777b6b28,0x040231ed,0x0e056cf2
	.word	0x59c9c11a,0x628d28db,0xc61011a9,0xf8082b64
	.word	0xf76c5b0c,0xbeff5d9a,0x9b7db159,0x480b1a4b
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
	.word	0xe1e5a4d0,0x73b942de,0x478c1c19,0xd283ea3e
	.word	0xac1123b2,0xf1d46f5e,0x5ea25b74,0x56860dd4
	.word	0x772efcfd,0xeb35b308,0xb52df303,0xd6bc032f
	.word	0x0daaa74c,0xcfa24919,0xf7bef48f,0xce4e00a6
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
	.word	0x583c1429,0xbfe0501b,0x578769ed,0xdb8f359f
	.word	0x912da300,0x8bbf9c5e,0x4e48f5ef,0xf99a2ba4
	.word	0x0e1fa963,0xe60f9592,0x15fbe418,0x912eb6b5
	.word	0xf6f76b8b,0x8213c76a,0xc0c732b3,0x744e9a59
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
	.word	0xf2368ad5,0x7259279e,0xe59f30ee,0x5f206b02
	.word	0x36af3b9c,0x8c35d704,0xee67ea93,0x82e42f37
	.word	0x9fb53d54,0xa5096c5c,0xb0691c8a,0x9dfb21b0
	.word	0x8e8e4040,0x3fba840f,0x5643df0b,0xcf5dd38f
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
	.word	0x8547009d,0x613ab002,0xc52572cc,0x5f46de5a
	.word	0x5ac107e5,0x9d80f033,0x3f8445a6,0xe86a4aef
	.word	0x185dc333,0xd49ffbc6,0xcca9669d,0x606f1373
	.word	0x8fb346f1,0x08b6b8b1,0x6d72e30b,0x94c2fd7c
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
	.word	0x1fd40e2f,0x09d3d193,0x0f2df6c3,0xdee144c3
	.word	0x4723ba2c,0xb69319a1,0x0d0e8140,0x44b7f20d
	.word	0x1896be5b,0x3e460390,0x8bf3de6b,0xaf4675f7
	.word	0xcd6be006,0xc11f1019,0xa5631029,0x36522799
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
	.word	0x38c78694,0x136ab193,0x15b53bfa,0xf05e1d00
	.word	0x4e6b6eec,0x563635da,0xebdefbb1,0xa4f2a45f
	.word	0x9ed71d1b,0xf3bf85e6,0xbbcd90b3,0xa62bd723
	.word	0xd8785725,0x4164d38a,0x904449f1,0x0023df27
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
	.word	0x69305030,0xaa2713be,0x63dfd131,0x011bd9d1
	.word	0x0bde3000,0xc8e7faca,0x9914c033,0x9da7051e
	.word	0x3e07c3fa,0x0cec9855,0xa9bc7c61,0x7627c1a7
	.word	0x76e77a14,0x6ed6ddf6,0x18f3f355,0xfe33170b
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
	.word	0xeae022d8,0x1dbf8bef,0x0e19fb68,0x22691d48
	.word	0x49ae1dec,0xcc7ea199,0x5202829c,0x12ba6ace
	.word	0x3bd122bc,0xe15cb604,0xdff0c03b,0x4ea07165
	.word	0x3cbc4a5c,0x3357ee94,0xa516a8d8,0xf67ef096
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
	.word	0x9f905609,0x7c81a49b,0x78032e67,0x2bfb7c59
	.word	0x281160b5,0x322ca653,0xc8abde0b,0xba10dc28
	.word	0x5ab60844,0xafafea85,0x1ee35897,0xd81082ce
	.word	0x92df3465,0x715a3ea5,0x796d3fe2,0x9dcc20cf
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
	.word	0x57191b62,0x6efd6fdd,0xc8b6844d,0xdeb926bc
	.word	0x94702eaa,0x57495d74,0x78c55430,0x7eeeb05c
	.word	0x0dbd8189,0x8aa63b93,0x8ddb922c,0xed3c7995
	.word	0x4b9a26a4,0x1efcd590,0x9762f8d6,0x48907ab2
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
	.word	0xa72a72c9,0xb0f91c21,0xa8d5d407,0xf8a278b8
	.word	0x3ad5c92d,0xf8bd5546,0x0c60df6a,0x33c96892
	.word	0x340f3584,0xa0a912f4,0x54b32e27,0xed9767c3
	.word	0x84a65de4,0x2c5c3392,0xedfde492,0x1e776b13
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
	.word	0x4f01a054,0x6a090251,0x8722fb52,0x8eaf168c
	.word	0xfa8e1856,0xc25ce69e,0x1aba4d75,0x835706b4
	.word	0xd4189176,0xeafcea4a,0x5ab29912,0xb394d6e9
	.word	0xafa8d920,0x4fbc8c90,0x53f42ec0,0xc3fa212d
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
	.word	0xa9a963b8,0x0fdf7270,0x7c9fdf28,0xc93db72a
	.word	0xd33e922f,0xf4aa8ebf,0x469497b9,0x7c55eadd
	.word	0x6ea696bb,0x42107eed,0x8a7b2b95,0x83e56b63
	.word	0xc0856eb2,0x32dfe348,0x82e676b7,0x1bbb1267
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
	.word	0x0921e0d4,0xd09d1d7a,0x08a80033,0x48d0f2db
	.word	0xeb7c318d,0xc4652e46,0x112a0a4d,0xcc058e15
	.word	0x88be50cc,0x93709c76,0x24cdc99a,0xdf6ccd37
	.word	0xfa0ad68d,0x9940871f,0x3586ea56,0xe3e882f4
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
	.word	0x10e98b5d,0x8ac09e07,0xf6907c13,0xd3207f33
	.word	0x6dd9203c,0xf50c43c6,0xf844231d,0x5834b7d1
	.word	0x7161b8de,0x9566dceb,0xa4b80961,0xd8123da5
	.word	0xea0923c2,0xb7d92df3,0xac387fca,0xd47cfc23
	.word	0xa6110596,0x576f6df7,0xa94c222c,0xae2dee29
	.word	0xc041bda4,0xb50dbff1,0xa83367eb,0x7b936eab
	.word	0x50840aaa,0x53152742,0xcf490078,0x4661afb9
	.word	0xbcd00b0b,0xe3d4ddb3,0x4b7dfed5,0xc47a1edc
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
	.word	0xf4374340,0xff9bcb15,0x7ab0f17e,0xfa761bb4
	.word	0x66adc16e,0x21bea823,0x286dda68,0x40aecb02
	.word	0x43cf3024,0x577da23d,0x11d67c0b,0x67d47058
	.word	0x2f5f3c23,0x452a102b,0x97f1a8e2,0xbd38e5a4
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
	.word	0x3ebde67b,0x4af5440f,0x6e4230b7,0xcb6dd0bb
	.word	0x525a5289,0x08fa567e,0xe382a2ed,0xdd929863
	.word	0x557422e5,0x5c54beae,0x91622f36,0x1abb7c47
	.word	0x77eef8b2,0x0eac4d32,0x319fedba,0x4f851f16
	.word	0x239b75ef,0xb118980e,0x491ce849,0xfd8bce8c
	.word	0xdf3ba0a8,0x56d1a323,0x3547574c,0xd859ee26
	.word	0xea9f1fa6,0xabec0d82,0xba87fd5b,0xd5a4bfd6
	.word	0x4551f4dd,0x98c03f81,0x4625949f,0x1f580d2d
	.word	0xd7c3889d,0xaef34bd6,0xa4cfdca5,0xced368b8
	.word	0x40ed646d,0x71013c62,0x39667ee1,0xa7ea2b6b
	.word	0x84a2df9d,0x3f3e8c44,0x9c2d2217,0x04321266
	.word	0x5b839ce3,0xff45226c,0x1f09ac20,0x39e39992
	.word	0x089bafd4,0x9c8c2ae4,0x9916d0ea,0x3627dfa6
	.word	0xd6d71318,0x020d6c51,0xc3990231,0xca950aa1
	.word	0xe17e648a,0xbb7f3647,0x137d935f,0x7c65f4f6
	.word	0x88372fb6,0xe05fce86,0x1d8bacfb,0xc4ff8ad3
	.word	0x9f729500,0xf258c169,0xc0f68fd4,0x723d93a2
	.word	0x1d0e0f58,0x6b8f1605,0xccb37270,0xabb6b0b7
	.word	0xe9a58feb,0x825888fc,0xa9624a0d,0xab49e44e
	.word	0x16ddc094,0x3942bdd9,0x265c2bac,0x1526385e
	.word	0xc9c4df64,0x47feb736,0xd3d67e17,0x14dfd304
	.word	0x19f50c4d,0x63d52af8,0x9fdc49f0,0x41db8c78
	.word	0xcee740ce,0x5e91c5a6,0x98cba266,0x8c5474de
	.word	0xdb55b548,0x4703f7c9,0xfe49cc64,0x8ceb8760
	.word	0x61114d6f,0x26943da0,0xd52b35b0,0x66489df5
	.word	0x5e58bfad,0xab4351ba,0xd5a03e3c,0xae9b9319
	.word	0xe69dcf06,0x79880b86,0x5a645434,0xe99749c6
	.word	0x186327fc,0x53a2cdf1,0x25b45d97,0x1f566b08
	.word	0x78014628,0xfbb8668c,0x359fdccc,0x5ea6a355
	.word	0xec6d750e,0x92b81437,0x7daa8402,0x4ec06b35
	.word	0xe3277130,0xa1a3b495,0x5b2ccce1,0x78058e00
	.word	0x2e4f70ab,0x4d276e1e,0xe93bb563,0xf2c86e68
share3_end:
