/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: mpgen_3000_5.s
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
!	Seed = 626172941
!	Riesling can be on
!	1 Thread, 3000 lines
!	mpgen   created on May 4, 2009 (15:17:56), Version 2.81
!	mpgen_3000l_14.s created on Jun 26, 2009 (17:29:41)
!	RC file : random.rc
!	cmd = /import/n2-tools/release/tools/mpgen/mpgen,1.090504 -rc random.rc -o mpgen_3000l_14 -p 1 -l 3000

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
!	%f0  = 70371b50 2fdadc21 3809630e 74331627
!	%f4  = 7397b93c 5fb35edd 28acf55a 300e7fc3
!	%f8  = 54a4cae8 3a0b2e59 283ba966 02a86c1f
!	%f12 = 69e59c54 244ce695 71242b32 3d99573b
	ldda	[%g1]ASI_BLK_P,%f0
	add	%g1,64,%g1
!	%f16 = 23133980 2e35e391 0c24e6be 72b27d17
!	%f20 = 14c46e6c 3352414d 4e58080a 4259d9b3
!	%f24 = 63d9c718 0538dbc9 44ff7b16 48a6290f
!	%f28 = 1ca98f84 7a874f05 7b10ebe2 653ae72b
	ldda	[%g1]ASI_BLK_P,%f16
	add	%g1,64,%g1
!	%f32 = 41ebd3b0 7e9df701 4481c66e 59e45007
!	%f36 = 1f665f9c 7e1befbd 7b5336ba 7bf35fa3
!	%f40 = 2c58bf48 4c1b1539 5a5e28c6 7459d1ff
!	%f44 = 09a83eb4 5c2c0375 61df4892 4a86231b
	ldda	[%g1]ASI_BLK_P,%f32

!	Set up the Graphics Status Register

	setx	0x4ca161220000001e,%g7,%g1 ! %gsr scale =  3, align = 6
	wr	%g1,%g0,%gsr		! %gsr = 4ca161220000001e

	wr	%g0,%y			! Clear %y register
	xorcc	%g0,%g0,%g3		! %g3 = 0, %ccr = 44
	membar	#Sync			! Force the block loads to complete

!	Start of Random Code for processor 0

p0_label_1:
!	Starting 10 instruction Store Burst
!	%l1 = cf2f03c43b806569, Mem[0000000010101424] = 2b9f6799, %asi = 80
	stwa	%l1,[%i4+0x024]%asi	! Mem[0000000010101424] = 3b806569
!	Mem[0000000010141408] = 7a4a4aae, %l4 = 000000001099bbca
	swapa	[%i5+%o4]0x80,%l4	! %l4 = 000000007a4a4aae
!	%f8  = 54a4cae8 3a0b2e59, Mem[0000000030181410] = 6ca18f5d 4dc8d479
	stda	%f8 ,[%i6+%o5]0x89	! Mem[0000000030181410] = 54a4cae8 3a0b2e59
!	%f6  = 28acf55a 300e7fc3, Mem[0000000030081410] = 298287ec 743a04cd
	stda	%f6 ,[%i2+%o5]0x81	! Mem[0000000030081410] = 28acf55a 300e7fc3
!	Mem[0000000030181408] = 4e8e01be, %l1 = 000000003b806569
	swapa	[%i6+%o4]0x81,%l1	! %l1 = 000000004e8e01be
!	Mem[00000000100c1400] = 74da1530, %l2 = 00000000b78e9224
	swapa	[%i3+%g0]0x80,%l2	! %l2 = 0000000074da1530
!	Mem[0000000030141400] = 20bcf862, %l5 = 5a87e1747cf06eb5
	ldstuba	[%i5+%g0]0x89,%l5	! %l5 = 0000000000000062
!	Mem[00000000100c1400] = b78e9224 5cbc4281 6881b3ee 63d21787
!	%f0  = 70371b50 2fdadc21 3809630e 74331627
!	%f4  = 7397b93c 5fb35edd 28acf55a 300e7fc3
!	%f8  = 54a4cae8 3a0b2e59 283ba966 02a86c1f
!	%f12 = 69e59c54 244ce695 71242b32 3d99573b
	stda	%f0 ,[%i3+%g0]ASI_BLK_P	! Block Store to 00000000100c1400
!	Mem[0000000010041408] = 2edd7e41, %l7 = 186de40c90570fbb
	ldstuba	[%i1+%o4]0x88,%l7	! %l7 = 0000000000000041
!	%l2 = 74da1530, %l3 = 334ffdef, Mem[0000000010141400] = 5e64d5f0 0acc8841
	stda	%l2,[%i5+%g0]0x80	! Mem[0000000010141400] = 74da1530 334ffdef

p0_label_2:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = 1a81474e52afc167, %f28 = 1ca98f84 7a874f05
	ldda	[%i4+%o4]0x80,%f28	! %f28 = 1a81474e 52afc167
!	Mem[0000000010141408] = 1099bbca 438b1b47, %l6 = 05b349b0, %l7 = 00000041
	ldda	[%i5+%o4]0x80,%l6	! %l6 = 000000001099bbca 00000000438b1b47
!	Mem[00000000300c1400] = 600b8212, %l4 = 000000007a4a4aae
	ldsha	[%i3+%g0]0x89,%l4	! %l4 = ffffffffffff8212
	membar	#Sync			! Added by membar checker (1)
!	Mem[00000000100c1408] = 0e630938, %l7 = 00000000438b1b47
	ldsba	[%i3+%o4]0x88,%l7	! %l7 = 0000000000000038
!	Mem[0000000010101400] = 71547d900be04d61, %f0  = 70371b50 2fdadc21
	ldda	[%i4+%g0]0x80,%f0 	! %f0  = 71547d90 0be04d61
!	Mem[00000000100c1400] = 501b3770, %l0 = b38c9c1985e4f4be
	ldsba	[%i3+%g0]0x88,%l0	! %l0 = 0000000000000070
!	Mem[00000000100c1418] = 28acf55a, %l6 = 000000001099bbca
	ldsw	[%i3+0x018],%l6		! %l6 = 0000000028acf55a
!	%f6  = 28acf55a 300e7fc3, %f23 = 4259d9b3
	fdtos	%f6 ,%f23		! %f23 = 00000000
!	Mem[0000000030181410] = 592e0b3a, %l1 = 000000004e8e01be
	ldswa	[%i6+%o5]0x81,%l1	! %l1 = 00000000592e0b3a
!	Mem[0000000010041408] = c7d32f2d2edd7eff, %f30 = 7b10ebe2 653ae72b
	ldda	[%i1+%o4]0x88,%f30	! %f30 = c7d32f2d 2edd7eff

p0_label_3:
!	Starting 10 instruction Store Burst
!	%f2  = 3809630e 74331627, Mem[0000000030041408] = 13af88de 7616c2b7
	stda	%f2 ,[%i1+%o4]0x81	! Mem[0000000030041408] = 3809630e 74331627
!	%l5 = 0000000000000062, Mem[0000000010181410] = 3b672c3c
	stba	%l5,[%i6+%o5]0x80	! Mem[0000000010181410] = 62672c3c
!	%f4  = 7397b93c 5fb35edd, Mem[0000000030101410] = ac343f24 8d06917c
	stda	%f4 ,[%i4+%o5]0x89	! Mem[0000000030101410] = 7397b93c 5fb35edd
!	%l0 = 0000000000000070, Mem[0000000030101408] = 24b31afe
	stba	%l0,[%i4+%o4]0x81	! Mem[0000000030101408] = 70b31afe
!	Mem[0000000010141408] = cabb9910, %l5 = 0000000000000062
	swapa	[%i5+%o4]0x88,%l5	! %l5 = 00000000cabb9910
!	Mem[0000000010101408] = 4e47811a, %l4 = 00000000ffff8212
	swapa	[%i4+%o4]0x88,%l4	! %l4 = 000000004e47811a
!	Mem[0000000030001400] = 258e8a40, %l1 = 00000000592e0b3a
	ldstuba	[%i0+%g0]0x81,%l1	! %l1 = 0000000000000025
!	Mem[0000000030001400] = ff8e8a40, %l2 = 0000000074da1530
	lduwa	[%i0+%g0]0x81,%l2	! %l2 = 00000000ff8e8a40
!	%l3 = f4ae0dea334ffdef, Mem[00000000300c1410] = 4c66fa2f
	stwa	%l3,[%i3+%o5]0x89	! Mem[00000000300c1410] = 334ffdef
!	%l7 = 0000000000000038, Mem[0000000030101400] = c06bdc1d
	stwa	%l7,[%i4+%g0]0x89	! Mem[0000000030101400] = 00000038

p0_label_4:
!	Starting 10 instruction Load Burst
!	%o0 = deadbeefdeadbeef
	set	share0_start,%o0	! set %o0[0] to VA
!	Mem[00000000201c0000] = 0ba756b0, %l6 = 0000000028acf55a, %asi = 80
	lduba	[%o0+0x000]%asi,%l6	! %l6 = 000000000000000b
!	Mem[0000000010081408] = 3233908e3c3a1da7, %f30 = c7d32f2d 2edd7eff
	ldda	[%i2+%o4]0x80,%f30	! %f30 = 3233908e 3c3a1da7
!	Mem[0000000010141408] = 471b8b43 00000062, %l4 = 4e47811a, %l5 = cabb9910
	ldda	[%i5+%o4]0x88,%l4	! %l4 = 0000000000000062 00000000471b8b43
!	Mem[0000000010181400] = 501e6375, %l4 = 0000000000000062
	lduba	[%i6+%g0]0x88,%l4	! %l4 = 0000000000000075
!	Mem[0000000030001410] = 0dc30f4d2c9b9906, %f18 = 0c24e6be 72b27d17
	ldda	[%i0+%o5]0x89,%f18	! %f18 = 0dc30f4d 2c9b9906
!	Mem[0000000010101408] = ffff8212, %l3 = f4ae0dea334ffdef
	ldswa	[%i4+%o4]0x88,%l3	! %l3 = ffffffffffff8212
!	Mem[00000000201c0001] = 0ba756b0, %l1 = 0000000000000025
	ldsb	[%o0+0x001],%l1		! %l1 = ffffffffffffffa7
!	Mem[0000000010001400] = 097e7c10205141e1, %f0  = 71547d90 0be04d61
	ldda	[%i0+%g0]0x80,%f0 	! %f0  = 097e7c10 205141e1
!	Mem[0000000030081408] = 4c2df43e, %f12 = 69e59c54
	lda	[%i2+%o4]0x81,%f12	! %f12 = 4c2df43e
!	Mem[000000001014141a] = 7e45eefa, %l4 = 0000000000000075, %asi = 80
	ldsha	[%i5+0x01a]%asi,%l4	! %l4 = ffffffffffffeefa

p0_label_5:
!	Starting 10 instruction Store Burst
!	%o3 = deadbeefdeadbeef
	set	share3_start,%o3	! set %o3[0] to VA
!	%l0 = 0000000000000070, Mem[0000000021800180] = 431d8090, %asi = 80
	stba	%l0,[%o3+0x180]%asi	! Mem[0000000021800180] = 701d8090
!	%l6 = 000000000000000b, Mem[0000000010141400] = 74da1530
	stba	%l6,[%i5+%g0]0x80	! Mem[0000000010141400] = 0bda1530
!	%l2 = ff8e8a40, %l3 = ffff8212, Mem[0000000010141400] = 0bda1530 334ffdef
	stda	%l2,[%i5+%g0]0x80	! Mem[0000000010141400] = ff8e8a40 ffff8212
!	%l7 = 0000000000000038, Mem[000000001008141a] = 7d709ada
	sth	%l7,[%i2+0x01a]		! Mem[0000000010081418] = 7d700038
!	%l0 = 00000070, %l1 = ffffffa7, Mem[0000000030141410] = 0cf32831 6d4fd917
	stda	%l0,[%i5+%o5]0x89	! Mem[0000000030141410] = 00000070 ffffffa7
!	%o2 = deadbeefdeadbeef
	set	share2_start,%o2	! set %o2[0] to VA
!	%l3 = ffffffffffff8212, Mem[00000000211c0001] = 62494d40
	stb	%l3,[%o2+0x001]		! Mem[00000000211c0000] = 62124d40
!	%l2 = 00000000ff8e8a40, Mem[00000000100c1410] = 3cb99773
	stha	%l2,[%i3+%o5]0x88	! Mem[00000000100c1410] = 3cb98a40
!	%l3 = ffffffffffff8212, %l3 = ffffffffffff8212, %y  = 00000000
	smul	%l3,%l3,%l0		! %l0 = 000000003df24944, %y = 00000000
!	%l5 = 00000000471b8b43, Mem[0000000030041400] = 17b31aa05b870c31
	stxa	%l5,[%i1+%g0]0x81	! Mem[0000000030041400] = 00000000471b8b43
!	%f24 = 63d9c718 0538dbc9, Mem[0000000010141428] = 12015506 43a7a53f
	std	%f24,[%i5+0x028]	! Mem[0000000010141428] = 63d9c718 0538dbc9

p0_label_6:
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = effd4f33 6383edad, %l6 = 0000000b, %l7 = 00000038
	ldda	[%i3+%o5]0x81,%l6	! %l6 = 00000000effd4f33 000000006383edad
!	%l2 = 00000000ff8e8a40, %l3 = ffffffffffff8212, %l4 = ffffffffffffeefa
	udivx	%l2,%l3,%l4		! %l4 = 0000000000000000
!	Mem[0000000010101410] = 77ddaf7c69d2941d, %f10 = 283ba966 02a86c1f, %asi = 80
	ldda	[%i4+0x010]%asi,%f10	! %f10 = 77ddaf7c 69d2941d
!	Mem[0000000030181408] = 6965803b, %l2 = 00000000ff8e8a40
	lduba	[%i6+%o4]0x89,%l2	! %l2 = 000000000000003b
!	Mem[0000000030081400] = 15919b00, %l5 = 00000000471b8b43
	lduha	[%i2+%g0]0x81,%l5	! %l5 = 0000000000001591
!	Mem[0000000030081408] = 4c2df43e2050e497, %f12 = 4c2df43e 244ce695
	ldda	[%i2+%o4]0x81,%f12	! %f12 = 4c2df43e 2050e497
!	Mem[0000000010101435] = 0c9563d5, %l7 = 000000006383edad
	ldsb	[%i4+0x035],%l7		! %l7 = ffffffffffffff95
!	%f11 = 69d2941d, %f21 = 3352414d, %f2  = 3809630e 74331627
	fsmuld	%f11,%f21,%f2 		! %f2  = 43b59e66 d77d3720
!	Mem[0000000030001410] = 2c9b9906, %l0 = 000000003df24944
	ldswa	[%i0+%o5]0x89,%l0	! %l0 = 000000002c9b9906
!	Mem[0000000010141400] = ff8e8a40, %l1 = ffffffffffffffa7
	ldsha	[%i5+%g0]0x80,%l1	! %l1 = ffffffffffffff8e

p0_label_7:
!	Starting 10 instruction Store Burst
!	%l0 = 000000002c9b9906, Mem[0000000010041428] = 34617786734fadbf
	stx	%l0,[%i1+0x028]		! Mem[0000000010041428] = 000000002c9b9906
!	%f0  = 097e7c10 205141e1, %l3 = ffffffffffff8212
!	Mem[0000000010041410] = 625e7c5c09daa17d
	add	%i1,0x010,%g1
	stda	%f0,[%g1+%l3]ASI_PST16_P ! Mem[0000000010041410] = 625e7c5c2051a17d
!	%l6 = effd4f33, %l7 = ffffff95, Mem[0000000030081410] = 28acf55a 300e7fc3
	stda	%l6,[%i2+%o5]0x81	! Mem[0000000030081410] = effd4f33 ffffff95
!	%f4  = 7397b93c 5fb35edd, Mem[0000000030141410] = 70000000 a7ffffff
	stda	%f4 ,[%i5+%o5]0x81	! Mem[0000000030141410] = 7397b93c 5fb35edd
!	Mem[0000000010041400] = 74471470, %l0 = 2c9b9906, %l1 = ffffff8e
	casa	[%i1]0x80,%l0,%l1	! %l1 = 0000000074471470
!	%f4  = 7397b93c 5fb35edd, Mem[0000000010181430] = 71bcef54 67970d95, %asi = 80
	stda	%f4 ,[%i6+0x030]%asi	! Mem[0000000010181430] = 7397b93c 5fb35edd
!	%l7 = ffffffffffffff95, Mem[0000000010081434] = 15887a15
	stw	%l7,[%i2+0x034]		! Mem[0000000010081434] = ffffff95
!	Mem[0000000010101410] = 7cafdd77, %l7 = ffffffffffffff95
	ldstuba	[%i4+%o5]0x88,%l7	! %l7 = 0000000000000077
!	%l2 = 0000003b, %l3 = ffff8212, Mem[0000000010041410] = 625e7c5c 2051a17d
	stda	%l2,[%i1+%o5]0x80	! Mem[0000000010041410] = 0000003b ffff8212
!	Mem[0000000030141400] = 20bcf8ff, %l2 = 000000000000003b
	ldstuba	[%i5+%g0]0x89,%l2	! %l2 = 00000000000000ff

p0_label_8:
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = 12820b60, %l4 = 0000000000000000
	ldswa	[%i3+%g0]0x81,%l4	! %l4 = 0000000012820b60
!	Mem[0000000030041408] = 271633740e630938, %l7 = 0000000000000077
	ldxa	[%i1+%o4]0x89,%l7	! %l7 = 271633740e630938
!	%l6 = 00000000effd4f33, immd = 00000b2a, %y  = 00000000
	umul	%l6,0xb2a,%l7		! %l7 = 00000a7741f62f5e, %y = 00000a77
!	Mem[0000000010001408] = 5c4b99ce, %l3 = ffffffffffff8212
	lduw	[%i0+%o4],%l3		! %l3 = 000000005c4b99ce
!	Mem[00000000300c1408] = 15d1cf9e, %l1 = 0000000074471470
	ldsha	[%i3+%o4]0x81,%l1	! %l1 = 00000000000015d1
!	Mem[00000000300c1408] = 15d1cf9e, %l7 = 00000a7741f62f5e
	lduba	[%i3+%o4]0x81,%l7	! %l7 = 0000000000000015
!	Mem[0000000010181434] = 5fb35edd, %l0 = 000000002c9b9906, %asi = 80
	ldswa	[%i6+0x034]%asi,%l0	! %l0 = 000000005fb35edd
!	Mem[00000000211c0000] = 62124d40, %l7 = 0000000000000015, %asi = 80
	ldsha	[%o2+0x000]%asi,%l7	! %l7 = 0000000000006212
!	Mem[000000001010142c] = 08781f5f, %l1 = 00000000000015d1
	ldsw	[%i4+0x02c],%l1		! %l1 = 0000000008781f5f
!	Mem[0000000030041400] = 00000000, %l3 = 000000005c4b99ce
	ldswa	[%i1+%g0]0x81,%l3	! %l3 = 0000000000000000

p0_label_9:
!	Starting 10 instruction Store Burst
!	%l6 = 00000000effd4f33, Mem[0000000010041410] = 0000003b
	stba	%l6,[%i1+%o5]0x80	! Mem[0000000010041410] = 3300003b
!	Mem[0000000010101408] = ffff8212, %l0 = 000000005fb35edd
	ldstuba	[%i4+%o4]0x88,%l0	! %l0 = 0000000000000012
!	%l4 = 0000000012820b60, Mem[00000000100c1418] = 28acf55a300e7fc3
	stx	%l4,[%i3+0x018]		! Mem[00000000100c1418] = 0000000012820b60
!	%o1 = deadbeefdeadbeef
	set	share1_start,%o1	! set %o1[0] to VA
!	%l1 = 0000000008781f5f, Mem[0000000020800040] = 12897f10
	sth	%l1,[%o1+0x040]		! Mem[0000000020800040] = 1f5f7f10
!	%f28 = 1a81474e 52afc167, Mem[0000000030081408] = 4c2df43e 2050e497
	stda	%f28,[%i2+%o4]0x81	! Mem[0000000030081408] = 1a81474e 52afc167
!	Mem[00000000201c0000] = 0ba756b0, %l3 = 0000000000000000
	ldstuba	[%o0+0x000]%asi,%l3	! %l3 = 000000000000000b
!	%f6  = 28acf55a, %f23 = 00000000, %f6  = 28acf55a
	fsubs	%f6 ,%f23,%f6 		! %f6  = 28acf55a
!	%l2 = 00000000000000ff, Mem[000000001008143c] = 453ca6bb
	stw	%l2,[%i2+0x03c]		! Mem[000000001008143c] = 000000ff
!	%f0  = 097e7c10 205141e1, Mem[0000000030081408] = 1a81474e 52afc167
	stda	%f0 ,[%i2+%o4]0x81	! Mem[0000000030081408] = 097e7c10 205141e1
!	%l1 = 0000000008781f5f, Mem[0000000030181400] = 80fc2e29
	stha	%l1,[%i6+%g0]0x89	! Mem[0000000030181400] = 80fc1f5f

p0_label_10:
!	Starting 10 instruction Load Burst
!	Mem[00000000218001c0] = 48d52ec0, %l2 = 00000000000000ff
	ldsh	[%o3+0x1c0],%l2		! %l2 = 00000000000048d5
!	Mem[0000000010101430] = 4cad7a940c9563d5, %l0 = 0000000000000012, %asi = 80
	ldxa	[%i4+0x030]%asi,%l0	! %l0 = 4cad7a940c9563d5
!	%f16 = 23133980, %f28 = 1a81474e
	fcmps	%fcc0,%f16,%f28		! %fcc0 = 2
!	Mem[0000000010001428] = 58b818262ffee7df, %f0  = 097e7c10 205141e1
	ldd	[%i0+0x028],%f0 	! %f0  = 58b81826 2ffee7df
!	Mem[0000000010081400] = a167680cd09c9d4b, %l4 = 0000000012820b60
	ldxa	[%i2+%g0]0x88,%l4	! %l4 = a167680cd09c9d4b
!	Mem[0000000030081400] = 11cf0f65009b9115, %f16 = 23133980 2e35e391
	ldda	[%i2+%g0]0x89,%f16	! %f16 = 11cf0f65 009b9115
!	Mem[0000000030081410] = effd4f33, %l5 = 0000000000001591
	ldsba	[%i2+%o5]0x81,%l5	! %l5 = ffffffffffffffef
!	Mem[00000000211c0000] = 62124d40, %l3 = 000000000000000b
	ldsh	[%o2+%g0],%l3		! %l3 = 0000000000006212
!	Mem[0000000030141410] = 7397b93c, %l0 = 4cad7a940c9563d5
	lduha	[%i5+%o5]0x81,%l0	! %l0 = 0000000000007397
!	Mem[000000001004140f] = 2d2fd3c7, %l6 = 00000000effd4f33, %asi = 80
	lduba	[%i1+0x00f]%asi,%l6	! %l6 = 00000000000000c7

p0_label_11:
!	Starting 10 instruction Store Burst
!	%l5 = ffffffffffffffef, Mem[0000000010101410] = ffddaf7c
	stba	%l5,[%i4+%o5]0x80	! Mem[0000000010101410] = efddaf7c
!	%f9  = 3a0b2e59, Mem[0000000010181408] = 35f4be0e
	sta	%f9 ,[%i6+%o4]0x80	! Mem[0000000010181408] = 3a0b2e59
!	%f1  = 2ffee7df, Mem[0000000010101408] = ffff82ff
	sta	%f1 ,[%i4+%o4]0x88	! Mem[0000000010101408] = 2ffee7df
!	%l0 = 0000000000007397, Mem[00000000300c1410] = effd4f33
	stwa	%l0,[%i3+%o5]0x81	! Mem[00000000300c1410] = 00007397
!	Mem[0000000010181408] = 3a0b2e59, %l2 = 00000000000048d5
	swapa	[%i6+%o4]0x80,%l2	! %l2 = 000000003a0b2e59
!	Mem[00000000300c1400] = 600b8212, %l4 = a167680cd09c9d4b
	ldstuba	[%i3+%g0]0x89,%l4	! %l4 = 0000000000000012
!	%l4 = 0000000000000012, Mem[00000000100c1400] = 501b3770
	stwa	%l4,[%i3+%g0]0x88	! Mem[00000000100c1400] = 00000012
!	%l2 = 000000003a0b2e59, Mem[00000000300c1400] = ff820b60
	stba	%l2,[%i3+%g0]0x81	! Mem[00000000300c1400] = 59820b60
!	%l6 = 00000000000000c7, Mem[0000000010141400] = ff8e8a40
	stwa	%l6,[%i5+%g0]0x80	! Mem[0000000010141400] = 000000c7
!	Mem[0000000010001400] = 107c7e09, %l1 = 0000000008781f5f
	ldstuba	[%i0+%g0]0x88,%l1	! %l1 = 0000000000000009

p0_label_12:
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = 5ed6e928, %l4 = 0000000000000012
	ldsha	[%i5+%o4]0x89,%l4	! %l4 = ffffffffffffe928
!	Mem[0000000030081410] = effd4f33 ffffff95, %l4 = ffffe928, %l5 = ffffffef
	ldda	[%i2+%o5]0x81,%l4	! %l4 = 00000000effd4f33 00000000ffffff95
!	Mem[0000000030101410] = dd5eb35f, %l4 = 00000000effd4f33
	lduba	[%i4+%o5]0x81,%l4	! %l4 = 00000000000000dd
!	%f2  = 43b59e66, %f15 = 3d99573b, %f26 = 44ff7b16
	fsubs	%f2 ,%f15,%f26		! %f26 = 43b594d1
!	Mem[00000000100c1400] = 12000000, %l2 = 000000003a0b2e59
	ldsb	[%i3+%g0],%l2		! %l2 = 0000000000000012
!	Mem[0000000030081400] = 15919b00, %l0 = 0000000000007397
	ldswa	[%i2+%g0]0x81,%l0	! %l0 = 0000000015919b00
!	Mem[0000000010001400] = 107c7eff, %f24 = 63d9c718
	lda	[%i0+%g0]0x88,%f24	! %f24 = 107c7eff
!	Mem[0000000030081400] = 11cf0f65009b9115, %f18 = 0dc30f4d 2c9b9906
	ldda	[%i2+%g0]0x89,%f18	! %f18 = 11cf0f65 009b9115
!	Mem[00000000100c1408] = 3809630e74331627, %f22 = 4e58080a 00000000
	ldda	[%i3+%o4]0x80,%f22	! %f22 = 3809630e 74331627
!	Mem[0000000010181410] = 62672c3c, %l1 = 0000000000000009
	lduha	[%i6+%o5]0x80,%l1	! %l1 = 0000000000006267

p0_label_13:
!	Starting 10 instruction Store Burst
!	%l7 = 0000000000006212, Mem[0000000010141400] = c7000000
	stwa	%l7,[%i5+%g0]0x88	! Mem[0000000010141400] = 00006212
!	%l4 = 00000000000000dd, Mem[00000000300c1410] = 00007397
	stba	%l4,[%i3+%o5]0x81	! Mem[00000000300c1410] = dd007397
!	%l1 = 0000000000006267, Mem[0000000030101400] = d1e4950700000038
	stxa	%l1,[%i4+%g0]0x89	! Mem[0000000030101400] = 0000000000006267
!	%l3 = 0000000000006212, Mem[0000000010081408] = 8e903332
	stba	%l3,[%i2+%o4]0x88	! Mem[0000000010081408] = 8e903312
!	Mem[0000000010101408] = 2ffee7df, %l0 = 0000000015919b00
	swapa	[%i4+%o4]0x88,%l0	! %l0 = 000000002ffee7df
!	Mem[0000000010081400] = 4b9d9cd0, %l5 = 00000000ffffff95
	swapa	[%i2+%g0]0x80,%l5	! %l5 = 000000004b9d9cd0
!	Mem[0000000010001400] = 107c7eff, %l5 = 000000004b9d9cd0
	ldstuba	[%i0+%g0]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010081434] = ffffff95, %l4 = 00000000000000dd, %asi = 80
	swapa	[%i2+0x034]%asi,%l4	! %l4 = 00000000ffffff95
!	Mem[0000000010141410] = dcf55911, %l1 = 0000000000006267
	swapa	[%i5+%o5]0x88,%l1	! %l1 = 00000000dcf55911
!	%f16 = 11cf0f65 009b9115, Mem[0000000030141410] = 3cb99773 dd5eb35f
	stda	%f16,[%i5+%o5]0x89	! Mem[0000000030141410] = 11cf0f65 009b9115

p0_label_14:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = 1282ffff3b000033, %l7 = 0000000000006212
	ldxa	[%i1+%o5]0x88,%l7	! %l7 = 1282ffff3b000033
!	Mem[0000000010181408] = d5480000, %l7 = 1282ffff3b000033
	ldsba	[%i6+%o4]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000030041410] = 41ff998c, %f30 = 3233908e
	lda	[%i1+%o5]0x81,%f30	! %f30 = 41ff998c
!	Mem[00000000201c0000] = ffa756b0, %l3 = 0000000000006212
	ldub	[%o0+%g0],%l3		! %l3 = 00000000000000ff
!	Mem[0000000030181408] = 3b806569, %l1 = 00000000dcf55911
	lduwa	[%i6+%o4]0x81,%l1	! %l1 = 000000003b806569
!	Mem[0000000030101400] = 67620000, %f15 = 3d99573b
	lda	[%i4+%g0]0x81,%f15	! %f15 = 67620000
!	Mem[0000000010181408] = 000048d5, %l7 = 0000000000000000
	ldsba	[%i6+%o4]0x80,%l7	! %l7 = 0000000000000000
!	Mem[00000000300c1408] = 9ecfd115, %f2  = 43b59e66
	lda	[%i3+%o4]0x89,%f2 	! %f2 = 9ecfd115
!	Mem[0000000010101418] = 47ed0d9a57820f03, %l3 = 00000000000000ff, %asi = 80
	ldxa	[%i4+0x018]%asi,%l3	! %l3 = 47ed0d9a57820f03
!	Mem[0000000030001408] = 343e8d7e, %l7 = 0000000000000000
	ldsba	[%i0+%o4]0x81,%l7	! %l7 = 0000000000000034

p0_label_15:
!	Starting 10 instruction Store Burst
!	%l4 = ffffff95, %l5 = 000000ff, Mem[0000000010141408] = 62000000 438b1b47
	stda	%l4,[%i5+%o4]0x80	! Mem[0000000010141408] = ffffff95 000000ff
!	Mem[0000000010041428] = 00000000, %l0 = 000000002ffee7df, %asi = 80
	swapa	[%i1+0x028]%asi,%l0	! %l0 = 0000000000000000
!	Mem[0000000010001408] = 5c4b99ce, %l1 = 000000003b806569
	ldstuba	[%i0+%o4]0x80,%l1	! %l1 = 000000000000005c
!	Code Fragment 3, seed = 62132
p0_fragment_1:
!	%l0 = 0000000000000000
	setx	0xfa0cecea5e64d686,%g7,%l0 ! %l0 = fa0cecea5e64d686
!	%l1 = 000000000000005c
	setx	0x90ab6f0792f43cb1,%g7,%l1 ! %l1 = 90ab6f0792f43cb1
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = fa0cecea5e64d686
	setx	0xa8c28625630266ec,%g7,%l0 ! %l0 = a8c28625630266ec
!	%l1 = 90ab6f0792f43cb1
	setx	0x6452a325f0b15837,%g7,%l1 ! %l1 = 6452a325f0b15837
p0_fragment_1_end:
!	%l4 = ffffff95, %l5 = 000000ff, Mem[0000000010001400] = ff7e7c10 205141e1
	stda	%l4,[%i0+%g0]0x80	! Mem[0000000010001400] = ffffff95 000000ff
!	%f12 = 4c2df43e 2050e497, Mem[0000000030041400] = 00000000 471b8b43
	stda	%f12,[%i1+%g0]0x81	! Mem[0000000030041400] = 4c2df43e 2050e497
!	%l1 = 6452a325f0b15837, Mem[0000000030141410] = 009b9115
	stwa	%l1,[%i5+%o5]0x89	! Mem[0000000030141410] = f0b15837
!	%l7 = 0000000000000034, Mem[0000000030001410] = 2c9b9906
	stba	%l7,[%i0+%o5]0x89	! Mem[0000000030001410] = 2c9b9934
!	%l1 = 6452a325f0b15837, Mem[0000000030181408] = 3b806569
	stwa	%l1,[%i6+%o4]0x81	! Mem[0000000030181408] = f0b15837
!	%f27 = 48a6290f, Mem[0000000030141400] = 20bcf8ff
	sta	%f27,[%i5+%g0]0x89	! Mem[0000000030141400] = 48a6290f

p0_label_16:
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = 62124d40, %l2 = 0000000000000012, %asi = 80
	lduba	[%o2+0x000]%asi,%l2	! %l2 = 0000000000000062
	membar	#Sync			! Added by membar checker (2)
!	Mem[0000000010141400] = 12620000 ffff8212 ffffff95 000000ff
!	Mem[0000000010141410] = 67620000 262e44fd 7e45eefa 582b0ee3
!	Mem[0000000010141420] = 68bb2988 2b8c6e79 63d9c718 0538dbc9
!	Mem[0000000010141430] = 1aa1bcf4 7e5ba0b5 278d28d2 03735a5b
	ldda	[%i5+%g0]ASI_BLK_AIUPL,%f16	! Block Load from 0000000010141400
!	Mem[0000000020800040] = 1f5f7f10, %l4 = 00000000ffffff95, %asi = 80
	lduha	[%o1+0x040]%asi,%l4	! %l4 = 0000000000001f5f
!	Mem[0000000010041438] = 0524d352, %f4  = 7397b93c
	lda	[%i1+0x038]%asi,%f4 	! %f4 = 0524d352
!	Mem[0000000010101408] = 009b9115, %l4 = 0000000000001f5f
	ldsw	[%i4+%o4],%l4		! %l4 = 00000000009b9115
!	Mem[00000000100c1430] = 69e59c54 244ce695, %l0 = 630266ec, %l1 = f0b15837
	ldd	[%i3+0x030],%l0		! %l0 = 0000000069e59c54 00000000244ce695
!	Mem[0000000010181410] = 3c2c6762, %l4 = 00000000009b9115
	lduwa	[%i6+%o5]0x88,%l4	! %l4 = 000000003c2c6762
!	Mem[0000000010081400] = 95ffffff, %f3  = d77d3720
	lda	[%i2+%g0]0x88,%f3 	! %f3 = 95ffffff
!	Mem[0000000010041408] = ff7edd2e, %l4 = 000000003c2c6762
	ldsba	[%i1+%o4]0x80,%l4	! %l4 = ffffffffffffffff
!	Mem[00000000100c1400] = 00000012, %l4 = ffffffffffffffff
	lduwa	[%i3+%g0]0x88,%l4	! %l4 = 0000000000000012

p0_label_17:
!	Starting 10 instruction Store Burst
!	%f14 = 71242b32, Mem[0000000030001410] = 34999b2c
	sta	%f14,[%i0+%o5]0x81	! Mem[0000000030001410] = 71242b32
!	%l0 = 0000000069e59c54, Mem[0000000010081410] = bcf2376f
	stha	%l0,[%i2+%o5]0x88	! Mem[0000000010081410] = bcf29c54
!	%f24 = 796e8c2b, Mem[0000000010041410] = 3b000033
	sta	%f24,[%i1+%o5]0x88	! Mem[0000000010041410] = 796e8c2b
!	%l2 = 0000000000000062, Mem[0000000030101400] = 67620000
	stha	%l2,[%i4+%g0]0x81	! Mem[0000000030101400] = 00620000
!	%l5 = 00000000000000ff, Mem[0000000030001408] = 7e8d3e34
	stwa	%l5,[%i0+%o4]0x89	! Mem[0000000030001408] = 000000ff
!	%l5 = 00000000000000ff, Mem[00000000300c1410] = dd007397
	stwa	%l5,[%i3+%o5]0x81	! Mem[00000000300c1410] = 000000ff
!	%f6  = 28acf55a 300e7fc3, Mem[00000000100c1408] = 0e630938 27163374
	stda	%f6 ,[%i3+%o4]0x88	! Mem[00000000100c1408] = 28acf55a 300e7fc3
!	Mem[0000000030101400] = 00620000, %l3 = 47ed0d9a57820f03
	ldstuba	[%i4+%g0]0x81,%l3	! %l3 = 0000000000000000
!	%l6 = 00000000000000c7, Mem[0000000010041410] = 796e8c2b
	stba	%l6,[%i1+%o5]0x88	! Mem[0000000010041410] = 796e8cc7
!	Mem[0000000010181418] = 637b405a, %l0 = 0000000069e59c54
	swap	[%i6+0x018],%l0		! %l0 = 00000000637b405a

p0_label_18:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = 27251c7d d5480000, %l4 = 00000012, %l5 = 000000ff
	ldda	[%i6+%o4]0x88,%l4	! %l4 = 00000000d5480000 0000000027251c7d
!	Mem[0000000010101410] = efddaf7c, %l6 = 00000000000000c7
	ldswa	[%i4+%o5]0x80,%l6	! %l6 = ffffffffefddaf7c
!	Mem[0000000030101410] = dd5eb35f, %l3 = 0000000000000000
	lduba	[%i4+%o5]0x81,%l3	! %l3 = 00000000000000dd
!	%l6 = ffffffffefddaf7c, immd = ffffffbe, %y  = 00000a77
	sdiv	%l6,-0x042,%l7		! %l7 = ffffffff80000000
	mov	%l0,%y			! %y = 637b405a
!	Mem[0000000010181410] = 3c2c6762, %l1 = 00000000244ce695
	lduba	[%i6+%o5]0x88,%l1	! %l1 = 0000000000000062
!	Mem[0000000021800180] = 701d8090, %l0 = 00000000637b405a
	lduh	[%o3+0x180],%l0		! %l0 = 000000000000701d
!	Code Fragment 4, seed = 119404
p0_fragment_2:
!	%l0 = 000000000000701d
	setx	0xa8a556ba6ce310c6,%g7,%l0 ! %l0 = a8a556ba6ce310c6
!	%l1 = 0000000000000062
	setx	0x3377fbdae15a62f1,%g7,%l1 ! %l1 = 3377fbdae15a62f1
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = a8a556ba6ce310c6
	setx	0x36887783fc3cb92c,%g7,%l0 ! %l0 = 36887783fc3cb92c
!	%l1 = 3377fbdae15a62f1
	setx	0x73182d2590f81677,%g7,%l1 ! %l1 = 73182d2590f81677
p0_fragment_2_end:
!	Mem[0000000030141408] = 28e9d65e, %l1 = 73182d2590f81677
	lduwa	[%i5+%o4]0x81,%l1	! %l1 = 0000000028e9d65e
!	Mem[0000000010001410] = 2ab5f5fc 50abb09d, %l2 = 00000062, %l3 = 000000dd
	ldda	[%i0+%o5]0x80,%l2	! %l2 = 000000002ab5f5fc 0000000050abb09d
!	Mem[0000000010101408] = 67c1af5215919b00, %l1 = 0000000028e9d65e
	ldxa	[%i4+%o4]0x88,%l1	! %l1 = 67c1af5215919b00

p0_label_19:
!	Starting 10 instruction Store Burst
!	%f9  = 3a0b2e59, Mem[0000000010181410] = 62672c3c
	sta	%f9 ,[%i6+0x010]%asi	! Mem[0000000010181410] = 3a0b2e59
!	%f10 = 77ddaf7c, %f1  = 2ffee7df
	fsqrts	%f10,%f1 		! %f1  = 5ba87375
!	Mem[0000000030041410] = 8c99ff41, %l7 = ffffffff80000000
	ldstuba	[%i1+%o5]0x89,%l7	! %l7 = 0000000000000041
!	%f0  = 58b81826 5ba87375, %l5 = 0000000027251c7d
!	Mem[0000000030001420] = 197f8fd806730989
	add	%i0,0x020,%g1
	stda	%f0,[%g1+%l5]ASI_PST8_SL ! Mem[0000000030001420] = 757fa85b2618b889
!	%l4 = 00000000d5480000, Mem[00000000201c0001] = ffa756b0
	stb	%l4,[%o0+0x001]		! Mem[00000000201c0000] = ff0056b0
	membar	#Sync			! Added by membar checker (3)
!	%l5 = 0000000027251c7d, Mem[0000000010141428] = 63d9c718, %asi = 80
	stwa	%l5,[%i5+0x028]%asi	! Mem[0000000010141428] = 27251c7d
!	Mem[0000000010001408] = ff4b99ce13fb39e7, %l5 = 0000000027251c7d, %l1 = 67c1af5215919b00
	add	%i0,0x08,%g1
	casxa	[%g1]0x80,%l5,%l1	! %l1 = ff4b99ce13fb39e7
!	%l7 = 0000000000000041, Mem[0000000010101410] = efddaf7c69d2941d
	stxa	%l7,[%i4+%o5]0x80	! Mem[0000000010101410] = 0000000000000041
!	%l7 = 0000000000000041, Mem[0000000030101400] = 000062ff
	stha	%l7,[%i4+%g0]0x89	! Mem[0000000030101400] = 00000041
!	Mem[0000000020800000] = 53d72ce0, %l2 = 000000002ab5f5fc
	ldstuba	[%o1+0x000]%asi,%l2	! %l2 = 0000000000000053

p0_label_20:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141430] = 1aa1bcf4, %l7 = 0000000000000041, %asi = 80
	ldswa	[%i5+0x030]%asi,%l7	! %l7 = 000000001aa1bcf4
!	Mem[0000000010001418] = 0745e81a 196cef83, %l4 = d5480000, %l5 = 27251c7d
	ldd	[%i0+0x018],%l4		! %l4 = 000000000745e81a 00000000196cef83
!	Mem[00000000100c1400] = 00000012, %l4 = 000000000745e81a
	ldswa	[%i3+%g0]0x88,%l4	! %l4 = 0000000000000012
!	Mem[00000000201c0001] = ff0056b0, %l2 = 0000000000000053, %asi = 80
	lduba	[%o0+0x001]%asi,%l2	! %l2 = 0000000000000000
!	%f14 = 71242b32, %f4  = 0524d352, %f29 = f4bca11a
	fsubs	%f14,%f4 ,%f29		! %f29 = 71242b32
!	Mem[0000000010101420] = 686795283b806569, %f10 = 77ddaf7c 69d2941d, %asi = 80
	ldda	[%i4+0x020]%asi,%f10	! %f10 = 68679528 3b806569
!	Mem[000000001014143c] = 03735a5b, %l2 = 0000000000000000
	ldsb	[%i5+0x03c],%l2		! %l2 = 0000000000000003
!	Mem[0000000010081410] = bcf29c54, %f17 = 00006212
	lda	[%i2+%o5]0x88,%f17	! %f17 = bcf29c54
!	Mem[00000000211c0000] = 62124d40, %l4 = 0000000000000012, %asi = 80
	lduha	[%o2+0x000]%asi,%l4	! %l4 = 0000000000006212
!	Mem[00000000100c1410] = 3cb98a40, %f24 = 796e8c2b
	lda	[%i3+%o5]0x88,%f24	! %f24 = 3cb98a40

p0_label_21:
!	Starting 10 instruction Store Burst
!	%l7 = 000000001aa1bcf4, Mem[0000000030001408] = ff000000718e50d7
	stxa	%l7,[%i0+%o4]0x81	! Mem[0000000030001408] = 000000001aa1bcf4
!	%f4  = 0524d352 5fb35edd, Mem[0000000010141408] = ffffff95 000000ff
	stda	%f4 ,[%i5+%o4]0x80	! Mem[0000000010141408] = 0524d352 5fb35edd
!	%l1 = ff4b99ce13fb39e7, Mem[0000000010041400] = 74471470
	stha	%l1,[%i1+%g0]0x80	! Mem[0000000010041400] = 39e71470
!	%l4 = 00006212, %l5 = 196cef83, Mem[0000000010141400] = 00006212 1282ffff
	stda	%l4,[%i5+%g0]0x88	! Mem[0000000010141400] = 00006212 196cef83
!	%f22 = e30e2b58 faee457e, %l1 = ff4b99ce13fb39e7
!	Mem[0000000010181428] = 349fe4666f1adb1f
	add	%i6,0x028,%g1
	stda	%f22,[%g1+%l1]ASI_PST32_PL ! Mem[0000000010181428] = 7e45eefa582b0ee3
!	%l1 = ff4b99ce13fb39e7, Mem[0000000030181400] = 5f1ffc80
	stha	%l1,[%i6+%g0]0x81	! Mem[0000000030181400] = 39e7fc80
!	%l2 = 00000003, %l3 = 50abb09d, Mem[0000000010181400] = 501e6375 21f37876
	stda	%l2,[%i6+%g0]0x88	! Mem[0000000010181400] = 00000003 50abb09d
!	Mem[0000000030101400] = 00000041, %l4 = 0000000000006212
	ldstuba	[%i4+%g0]0x89,%l4	! %l4 = 0000000000000041
!	Mem[0000000030141408] = 28e9d65e, %l3 = 0000000050abb09d
	ldstuba	[%i5+%o4]0x81,%l3	! %l3 = 0000000000000028
!	Mem[0000000010081400] = 95ffffff, %l1 = 0000000013fb39e7
	swapa	[%i2+%g0]0x88,%l1	! %l1 = 0000000095ffffff

p0_label_22:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = 549cf2bc4820c25d, %l0 = 36887783fc3cb92c, %asi = 80
	ldxa	[%i2+0x010]%asi,%l0	! %l0 = 549cf2bc4820c25d
!	Mem[0000000010041408] = ff7edd2e 2d2fd3c7, %l4 = 00000041, %l5 = 196cef83, %asi = 80
	ldda	[%i1+0x008]%asi,%l4	! %l4 = 00000000ff7edd2e 000000002d2fd3c7
!	Mem[0000000010181400] = 00000003, %l2 = 0000000000000003
	lduha	[%i6+%g0]0x88,%l2	! %l2 = 0000000000000003
!	Mem[0000000010041408] = ff7edd2e, %l0 = 549cf2bc4820c25d
	ldsba	[%i1+%o4]0x80,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000030041400] = 97e45020 3ef42d4c, %l2 = 00000003, %l3 = 00000028
	ldda	[%i1+%g0]0x89,%l2	! %l2 = 000000003ef42d4c 0000000097e45020
!	Mem[00000000300c1410] = 000000ff 6383edad, %l6 = efddaf7c, %l7 = 1aa1bcf4
	ldda	[%i3+%o5]0x81,%l6	! %l6 = 00000000000000ff 000000006383edad
!	Mem[0000000010041408] = ff7edd2e, %l0 = ffffffffffffffff
	lduwa	[%i1+%o4]0x80,%l0	! %l0 = 00000000ff7edd2e
!	Mem[0000000010101400] = 71547d90, %l0 = 00000000ff7edd2e
	ldswa	[%i4+%g0]0x80,%l0	! %l0 = 0000000071547d90
!	Mem[0000000010141400] = 1262000083ef6c19, %l4 = 00000000ff7edd2e
	ldx	[%i5+%g0],%l4		! %l4 = 1262000083ef6c19
!	Mem[0000000010041410] = 796e8cc7, %l1 = 0000000095ffffff
	ldsba	[%i1+%o5]0x88,%l1	! %l1 = ffffffffffffffc7

p0_label_23:
!	Starting 10 instruction Store Burst
!	Mem[0000000010081400] = 13fb39e7, %l5 = 000000002d2fd3c7
	swapa	[%i2+%g0]0x88,%l5	! %l5 = 0000000013fb39e7
!	%l6 = 000000ff, %l7 = 6383edad, Mem[0000000010001410] = fcf5b52a 9db0ab50
	stda	%l6,[%i0+%o5]0x88	! Mem[0000000010001410] = 000000ff 6383edad
!	%f9  = 3a0b2e59, Mem[0000000010041408] = ff7edd2e
	sta	%f9 ,[%i1+%o4]0x80	! Mem[0000000010041408] = 3a0b2e59
!	%l1 = ffffffffffffffc7, Mem[0000000030181408] = 3758b1f0
	stha	%l1,[%i6+%o4]0x89	! Mem[0000000030181408] = 3758ffc7
!	%f25 = 8829bb68, Mem[0000000030181408] = 3758ffc7
	sta	%f25,[%i6+%o4]0x89	! Mem[0000000030181408] = 8829bb68
!	Mem[0000000030081410] = effd4f33, %l3 = 0000000097e45020
	ldstuba	[%i2+%o5]0x81,%l3	! %l3 = 00000000000000ef
!	%f4  = 0524d352 5fb35edd, Mem[0000000010101408] = 009b9115 52afc167, %asi = 80
	stda	%f4 ,[%i4+0x008]%asi	! Mem[0000000010101408] = 0524d352 5fb35edd
!	%f20 = fd442e26 00006267, Mem[00000000300c1400] = 59820b60 556cc1f1
	stda	%f20,[%i3+%g0]0x81	! Mem[00000000300c1400] = fd442e26 00006267
!	%l6 = 00000000000000ff, Mem[0000000020800040] = 1f5f7f10, %asi = 80
	stba	%l6,[%o1+0x040]%asi	! Mem[0000000020800040] = ff5f7f10
!	%l5 = 0000000013fb39e7, Mem[0000000030081408] = 097e7c10205141e1
	stxa	%l5,[%i2+%o4]0x81	! Mem[0000000030081408] = 0000000013fb39e7

p0_label_24:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = c37f0e30, %l6 = 00000000000000ff
	lduwa	[%i3+%o4]0x80,%l6	! %l6 = 00000000c37f0e30
!	Mem[0000000030101400] = ff000000, %l1 = ffffffffffffffc7
	ldswa	[%i4+%g0]0x81,%l1	! %l1 = ffffffffff000000
!	Mem[0000000010081400] = c7d32f2d, %f11 = 3b806569
	lda	[%i2+%g0]0x80,%f11	! %f11 = c7d32f2d
!	%f12 = 4c2df43e, %f10 = 68679528, %f24 = 3cb98a40 8829bb68
	fsmuld	%f12,%f10,%f24		! %f24 = 46a3ab97 c907f600
!	Mem[00000000211c0000] = 62124d40, %l0 = 0000000071547d90
	ldsh	[%o2+%g0],%l0		! %l0 = 0000000000006212
!	Mem[0000000010181410] = dd258119592e0b3a, %f18 = ff000000 95ffffff
	ldda	[%i6+%o5]0x88,%f18	! %f18 = dd258119 592e0b3a
!	Mem[0000000030181400] = 80fce739, %l0 = 0000000000006212
	lduha	[%i6+%g0]0x89,%l0	! %l0 = 000000000000e739
!	Mem[0000000030041410] = ed4b3b42 8c99ffff, %l4 = 83ef6c19, %l5 = 13fb39e7
	ldda	[%i1+%o5]0x89,%l4	! %l4 = 000000008c99ffff 00000000ed4b3b42
!	Mem[00000000100c1400] = 00000012, %l0 = 000000000000e739
	ldsha	[%i3+%g0]0x88,%l0	! %l0 = 0000000000000012
!	Mem[0000000010101408] = dd5eb35f52d32405, %f28 = b5a05b7e 71242b32
	ldda	[%i4+%o4]0x88,%f28	! %f28 = dd5eb35f 52d32405

p0_label_25:
!	Starting 10 instruction Store Burst
!	%l1 = ffffffffff000000, %l4 = 000000008c99ffff, %l6 = 00000000c37f0e30
	udivx	%l1,%l4,%l6		! %l6 = 00000001d21c88da
!	%f16 = 1282ffff, Mem[0000000010181400] = 03000000
	sta	%f16,[%i6+0x000]%asi	! Mem[0000000010181400] = 1282ffff
!	%l4 = 000000008c99ffff, Mem[0000000030041410] = ed4b3b428c99ffff
	stxa	%l4,[%i1+%o5]0x89	! Mem[0000000030041410] = 000000008c99ffff
!	Mem[0000000030001400] = 408a8eff, %l5 = 00000000ed4b3b42
	swapa	[%i0+%g0]0x89,%l5	! %l5 = 00000000408a8eff
!	Mem[00000000201c0001] = ff0056b0, %l1 = ffffffffff000000
	ldstuba	[%o0+0x001]%asi,%l1	! %l1 = 0000000000000000
!	%l0 = 0000000000000012, Mem[0000000010181400] = 1282ffff9db0ab50
	stxa	%l0,[%i6+%g0]0x80	! Mem[0000000010181400] = 0000000000000012
!	%l6 = 00000001d21c88da, Mem[0000000030101410] = 5fb35edd
	stba	%l6,[%i4+%o5]0x89	! Mem[0000000030101410] = 5fb35eda
!	Mem[00000000100c1400] = 00000012, %l4 = 000000008c99ffff
	swapa	[%i3+%g0]0x88,%l4	! %l4 = 0000000000000012
!	Mem[00000000201c0001] = ffff56b0, %l0 = 0000000000000012
	ldstuba	[%o0+0x001]%asi,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010181434] = 5fb35edd, %l5 = 00000000408a8eff
	swap	[%i6+0x034],%l5		! %l5 = 000000005fb35edd

p0_label_26:
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = 174c8a248829bb68, %l1 = 0000000000000000
	ldxa	[%i6+%o4]0x89,%l1	! %l1 = 174c8a248829bb68
!	Mem[0000000010081410] = bcf29c54, %f15 = 67620000
	lda	[%i2+%o5]0x88,%f15	! %f15 = bcf29c54
!	Mem[0000000010101428] = 662a35a608781f5f, %f10 = 68679528 c7d32f2d, %asi = 80
	ldda	[%i4+0x028]%asi,%f10	! %f10 = 662a35a6 08781f5f
!	Mem[0000000010101408] = 52d32405, %f27 = 18c7d963
	lda	[%i4+%o4]0x88,%f27	! %f27 = 52d32405
!	Mem[0000000030001408] = 00000000 1aa1bcf4, %l2 = 3ef42d4c, %l3 = 000000ef
	ldda	[%i0+%o4]0x81,%l2	! %l2 = 0000000000000000 000000001aa1bcf4
!	Mem[0000000010141400] = 00006212, %l5 = 000000005fb35edd
	ldswa	[%i5+%g0]0x88,%l5	! %l5 = 0000000000006212
!	Mem[0000000030041400] = 4c2df43e2050e497, %l6 = 00000001d21c88da
	ldxa	[%i1+%g0]0x81,%l6	! %l6 = 4c2df43e2050e497
!	Mem[0000000010001410] = ff000000, %l7 = 000000006383edad
	lduba	[%i0+%o5]0x80,%l7	! %l7 = 00000000000000ff
!	Mem[00000000300c1410] = ff000000, %l3 = 000000001aa1bcf4
	ldsha	[%i3+%o5]0x89,%l3	! %l3 = 0000000000000000
	membar	#Sync			! Added by membar checker (4)
!	Mem[0000000010081400] = c7d32f2d 0c6867a1 1233908e 3c3a1da7
!	Mem[0000000010081410] = 549cf2bc 4820c25d 7d700038 35fe1f43
!	Mem[0000000010081420] = 184c3c68 387fe9d9 7a7246e6 0804239f
!	Mem[0000000010081430] = 28d9c5d4 000000dd 6cdf40b2 000000ff
	ldda	[%i2+%g0]ASI_BLK_AIUPL,%f0 	! Block Load from 0000000010081400

p0_label_27:
!	Starting 10 instruction Store Burst
!	%f26 = c9db3805 52d32405, %l7 = 00000000000000ff
!	Mem[0000000010181430] = 7397b93c408a8eff
	add	%i6,0x030,%g1
	stda	%f26,[%g1+%l7]ASI_PST16_P ! Mem[0000000010181430] = c9db380552d32405
!	Mem[0000000010141410] = 67620000262e44fd, %l6 = 4c2df43e2050e497, %l0 = 00000000000000ff
	add	%i5,0x10,%g1
	casxa	[%g1]0x80,%l6,%l0	! %l0 = 67620000262e44fd
!	%f16 = 1282ffff, Mem[0000000010001408] = ff4b99ce
	sta	%f16,[%i0+%o4]0x80	! Mem[0000000010001408] = 1282ffff
!	Mem[00000000300c1410] = 000000ff, %l6 = 4c2df43e2050e497
	ldstuba	[%i3+%o5]0x81,%l6	! %l6 = 0000000000000000
!	%f13 = d4c5d928, Mem[0000000030081410] = 334ffdff
	sta	%f13,[%i2+%o5]0x89	! Mem[0000000030081410] = d4c5d928
!	Mem[0000000030081408] = 00000000, %l2 = 0000000000000000
	ldstuba	[%i2+%o4]0x81,%l2	! %l2 = 0000000000000000
!	%l6 = 00000000, %l7 = 000000ff, Mem[0000000010181400] = 00000000 00000012, %asi = 80
	stda	%l6,[%i6+0x000]%asi	! Mem[0000000010181400] = 00000000 000000ff
!	%l3 = 0000000000000000, Mem[0000000010181408] = 000048d5
	stha	%l3,[%i6+%o4]0x80	! Mem[0000000010181408] = 000048d5
!	Mem[0000000020800000] = ffd72ce0, %l3 = 0000000000000000
	ldstub	[%o1+%g0],%l3		! %l3 = 00000000000000ff
!	%f4  = 5dc22048 bcf29c54, Mem[0000000030041408] = 3809630e 74331627
	stda	%f4 ,[%i1+%o4]0x81	! Mem[0000000030041408] = 5dc22048 bcf29c54

p0_label_28:
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = 0f29a648, %l2 = 0000000000000000
	lduwa	[%i5+%g0]0x81,%l2	! %l2 = 000000000f29a648
!	Mem[0000000030081400] = 009b9115, %l1 = 174c8a248829bb68
	ldswa	[%i2+%g0]0x89,%l1	! %l1 = 00000000009b9115
!	Mem[0000000010041434] = 2151cd35, %l5 = 0000000000006212
	lduw	[%i1+0x034],%l5		! %l5 = 000000002151cd35
!	Mem[0000000010181408] = d5480000, %l1 = 00000000009b9115
	ldsha	[%i6+%o4]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000030001408] = 00000000, %l5 = 000000002151cd35
	lduba	[%i0+%o4]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000030181400] = 80fce739, %l5 = 0000000000000000
	ldswa	[%i6+%g0]0x89,%l5	! %l5 = ffffffff80fce739
!	Mem[0000000030141408] = ffe9d65e, %l0 = 67620000262e44fd
	ldswa	[%i5+%o4]0x81,%l0	! %l0 = ffffffffffe9d65e
!	Mem[0000000010081400] = 2d2fd3c7, %l5 = ffffffff80fce739
	ldswa	[%i2+%g0]0x88,%l5	! %l5 = 000000002d2fd3c7
!	Mem[00000000218000c0] = 33eb5e00, %l2 = 000000000f29a648
	ldsh	[%o3+0x0c0],%l2		! %l2 = 00000000000033eb
!	Mem[00000000100c1400] = ffff998c 2fdadc21 c37f0e30 5af5ac28
!	Mem[00000000100c1410] = 408ab93c 5fb35edd 00000000 12820b60
!	Mem[00000000100c1420] = 54a4cae8 3a0b2e59 283ba966 02a86c1f
!	Mem[00000000100c1430] = 69e59c54 244ce695 71242b32 3d99573b
	ldda	[%i3+%g0]ASI_BLK_AIUP,%f16	! Block Load from 00000000100c1400

p0_label_29:
!	Starting 10 instruction Store Burst
!	Mem[0000000010041410] = 796e8cc7, %l0 = ffffffffffe9d65e
	lduba	[%i1+%o5]0x88,%l0	! %l0 = 00000000000000c7
!	%f22 = 00000000 12820b60, Mem[0000000030181410] = 3a0b2e59 54a4cae8
	stda	%f22,[%i6+%o5]0x89	! Mem[0000000030181410] = 00000000 12820b60
!	%l2 = 00000000000033eb, Mem[0000000030001400] = 5179da09ed4b3b42
	stxa	%l2,[%i0+%g0]0x89	! Mem[0000000030001400] = 00000000000033eb
!	%f20 = 408ab93c 5fb35edd, Mem[00000000300c1410] = ff0000ff 6383edad
	stda	%f20,[%i3+%o5]0x81	! Mem[00000000300c1410] = 408ab93c 5fb35edd
!	Mem[00000000218001c1] = 48d52ec0, %l3 = 00000000000000ff
	ldstuba	[%o3+0x1c1]%asi,%l3	! %l3 = 00000000000000d5
!	Mem[0000000010041418] = 4a1d097a30b32f63, %l1 = 0000000000000000, %l5 = 000000002d2fd3c7
	add	%i1,0x18,%g1
	casxa	[%g1]0x80,%l1,%l5	! %l5 = 4a1d097a30b32f63
!	%l2 = 000033eb, %l3 = 000000d5, Mem[0000000030001400] = 000033eb 00000000
	stda	%l2,[%i0+%g0]0x89	! Mem[0000000030001400] = 000033eb 000000d5
!	%l7 = 00000000000000ff, Mem[0000000030001410] = 71242b32
	stwa	%l7,[%i0+%o5]0x81	! Mem[0000000030001410] = 000000ff
!	%l6 = 0000000000000000, Mem[0000000030181408] = 68bb2988
	stba	%l6,[%i6+%o4]0x81	! Mem[0000000030181408] = 00bb2988
!	%f3  = 8e903312, Mem[0000000030041410] = 8c99ffff
	sta	%f3 ,[%i1+%o5]0x89	! Mem[0000000030041410] = 8e903312

p0_label_30:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = 39e71470 55ecbcc1 3a0b2e59 2d2fd3c7
!	Mem[0000000010041410] = c78c6e79 ffff8212 4a1d097a 30b32f63
!	Mem[0000000010041420] = 7bd47808 595d72f9 2ffee7df 2c9b9906
!	Mem[0000000010041430] = 274a5374 2151cd35 0524d352 5d1fcadb
	ldda	[%i1+%g0]ASI_BLK_PL,%f16	! Block Load from 0000000010041400
!	Mem[00000000100c1410] = 3cb98a40, %l7 = 00000000000000ff
	ldsha	[%i3+%o5]0x88,%l7	! %l7 = ffffffffffff8a40
!	Mem[0000000020800040] = ff5f7f10, %l6 = 0000000000000000
	lduh	[%o1+0x040],%l6		! %l6 = 000000000000ff5f
!	Mem[0000000010041418] = 4a1d097a30b32f63, %l1 = 0000000000000000
	ldx	[%i1+0x018],%l1		! %l1 = 4a1d097a30b32f63
!	Code Fragment 4, seed = 970805
p0_fragment_3:
!	%l0 = 00000000000000c7
	setx	0xbdcaffe6ebb03b7e,%g7,%l0 ! %l0 = bdcaffe6ebb03b7e
!	%l1 = 4a1d097a30b32f63
	setx	0x6fc636610dfff029,%g7,%l1 ! %l1 = 6fc636610dfff029
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = bdcaffe6ebb03b7e
	setx	0x89f8c82ba0df20e4,%g7,%l0 ! %l0 = 89f8c82ba0df20e4
!	%l1 = 6fc636610dfff029
	setx	0x6e62719291f250af,%g7,%l1 ! %l1 = 6e62719291f250af
p0_fragment_3_end:
!	Mem[0000000010181438] = 264156325f8af63b, %f2  = a71d3a3c 8e903312, %asi = 80
	ldda	[%i6+0x038]%asi,%f2 	! %f2  = 26415632 5f8af63b
!	Mem[0000000030081408] = 000000ff, %l7 = ffffffffffff8a40
	lduwa	[%i2+%o4]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010041412] = c78c6e79, %l4 = 0000000000000012, %asi = 80
	ldsba	[%i1+0x012]%asi,%l4	! %l4 = 000000000000006e
!	Mem[0000000030081408] = 000000ff, %l1 = 6e62719291f250af
	lduha	[%i2+%o4]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010081410] = 549cf2bc, %l1 = 00000000000000ff
	lduba	[%i2+%o5]0x80,%l1	! %l1 = 0000000000000054

p0_label_31:
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1410] = 3cb98a40, %l3 = 00000000000000d5
	swapa	[%i3+%o5]0x88,%l3	! %l3 = 000000003cb98a40
!	%l7 = 00000000000000ff, Mem[0000000030181400] = 80fce739
	stba	%l7,[%i6+%g0]0x89	! Mem[0000000030181400] = 80fce7ff
	membar	#Sync			! Added by membar checker (5)
!	%f1  = 2d2fd3c7, Mem[000000001004141c] = 30b32f63
	st	%f1 ,[%i1+0x01c]	! Mem[000000001004141c] = 2d2fd3c7
!	Mem[0000000030101410] = 5fb35eda, %l7 = 00000000000000ff
	ldstuba	[%i4+%o5]0x89,%l7	! %l7 = 00000000000000da
!	%f2  = 26415632, Mem[0000000030141408] = ffe9d65e
	sta	%f2 ,[%i5+%o4]0x81	! Mem[0000000030141408] = 26415632
!	%f15 = b240df6c, Mem[0000000030041400] = 3ef42d4c
	sta	%f15,[%i1+%g0]0x89	! Mem[0000000030041400] = b240df6c
!	%f6  = 431ffe35 3800707d, Mem[0000000030101408] = fe1ab370 5738ba14
	stda	%f6 ,[%i4+%o4]0x89	! Mem[0000000030101408] = 431ffe35 3800707d
!	Mem[00000000300c1410] = 408ab93c, %l5 = 4a1d097a30b32f63
	ldstuba	[%i3+%o5]0x81,%l5	! %l5 = 0000000000000040
!	%l3 = 000000003cb98a40, Mem[0000000030101408] = 431ffe353800707d
	stxa	%l3,[%i4+%o4]0x89	! Mem[0000000030101408] = 000000003cb98a40
!	%f22 = 632fb330 7a091d4a, Mem[0000000010001408] = 1282ffff 13fb39e7
	stda	%f22,[%i0+%o4]0x80	! Mem[0000000010001408] = 632fb330 7a091d4a

p0_label_32:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = 6383edad000000ff, %f26 = 06999b2c dfe7fe2f
	ldda	[%i0+%o5]0x88,%f26	! %f26 = 6383edad 000000ff
!	Mem[0000000030181410] = 00000000 12820b60, %l4 = 0000006e, %l5 = 00000040
	ldda	[%i6+%o5]0x89,%l4	! %l4 = 0000000012820b60 0000000000000000
!	Mem[0000000030141400] = 0f29a648, %l5 = 0000000000000000
	ldsha	[%i5+%g0]0x81,%l5	! %l5 = 0000000000000f29
!	Mem[0000000010001400] = 95ffffff, %f29 = 74534a27
	lda	[%i0+%g0]0x88,%f29	! %f29 = 95ffffff
!	Mem[0000000010001410] = 000000ff, %l4 = 0000000012820b60
	ldsha	[%i0+%o5]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[00000000300c1408] = 15d1cf9e, %l4 = 00000000000000ff
	ldswa	[%i3+%o4]0x81,%l4	! %l4 = 0000000015d1cf9e
!	Mem[0000000030101410] = 5fb35eff, %l2 = 00000000000033eb
	lduha	[%i4+%o5]0x89,%l2	! %l2 = 0000000000005eff
!	Mem[0000000030041408] = 4820c25d, %l5 = 0000000000000f29
	lduwa	[%i1+%o4]0x89,%l5	! %l5 = 000000004820c25d
!	Mem[0000000030101408] = 000000003cb98a40, %f20 = 1282ffff 796e8cc7
	ldda	[%i4+%o4]0x89,%f20	! %f20 = 00000000 3cb98a40
!	Mem[0000000010081400] = a167680c2d2fd3c7, %f10 = 9f230408 e646727a
	ldda	[%i2+%g0]0x88,%f10	! %f10 = a167680c 2d2fd3c7

p0_label_33:
!	Starting 10 instruction Store Burst
!	%l2 = 0000000000005eff, Mem[0000000030141408] = 2641563254596a37
	stxa	%l2,[%i5+%o4]0x81	! Mem[0000000030141408] = 0000000000005eff
!	Mem[0000000030181410] = 0000000012820b60, %l5 = 000000004820c25d
	ldxa	[%i6+%o5]0x89,%l5	! %l5 = 0000000012820b60
!	%l0 = 89f8c82ba0df20e4, %l2 = 0000000000005eff, %l5 = 0000000012820b60
	orn	%l0,%l2,%l5		! %l5 = ffffffffffffa1e4
!	%l7 = 00000000000000da, Mem[0000000010181408] = d5480000
	stba	%l7,[%i6+%o4]0x88	! Mem[0000000010181408] = d54800da
!	%l6 = 0000ff5f, %l7 = 000000da, Mem[0000000010101438] = 2f7b6b72 432e6e7b
	std	%l6,[%i4+0x038]		! Mem[0000000010101438] = 0000ff5f 000000da
!	Mem[0000000010101428] = 662a35a608781f5f, %l2 = 0000000000005eff, %l1 = 0000000000000054
	add	%i4,0x28,%g1
	casxa	[%g1]0x80,%l2,%l1	! %l1 = 662a35a608781f5f
!	%l2 = 0000000000005eff, Mem[0000000030081400] = 15919b00
	stba	%l2,[%i2+%g0]0x81	! Mem[0000000030081400] = ff919b00
!	%l3 = 000000003cb98a40, Mem[0000000030041400] = 97e45020b240df6c
	stxa	%l3,[%i1+%g0]0x89	! Mem[0000000030041400] = 000000003cb98a40
!	%l7 = 00000000000000da, Mem[0000000010141410] = 67620000
	stwa	%l7,[%i5+%o5]0x80	! Mem[0000000010141410] = 000000da
!	%l7 = 00000000000000da, %l2 = 0000000000005eff, %l4 = 0000000015d1cf9e
	subc	%l7,%l2,%l4		! %l4 = ffffffffffffa1db

p0_label_34:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = 52d32405, %l6 = 000000000000ff5f
	lduba	[%i5+%o4]0x88,%l6	! %l6 = 0000000000000005
!	Mem[00000000201c0000] = ffff56b0, %l5 = ffffffffffffa1e4
	ldub	[%o0+%g0],%l5		! %l5 = 00000000000000ff
!	%l7 = 00000000000000da, imm = 00000000000004d0, %l2 = 0000000000005eff
	subc	%l7,0x4d0,%l2		! %l2 = fffffffffffffc0a
!	%l5 = 00000000000000ff, %l4 = ffffffffffffa1db, %l5 = 00000000000000ff
	xnor	%l5,%l4,%l5		! %l5 = 0000000000005edb
!	Mem[0000000010001410] = 000000ff, %l2 = fffffffffffffc0a
	ldswa	[%i0+%o5]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[00000000100c1410] = dd5eb35f 000000d5, %l0 = a0df20e4, %l1 = 08781f5f
	ldda	[%i3+%o5]0x88,%l0	! %l0 = 00000000000000d5 00000000dd5eb35f
!	Mem[0000000010141400] = 1262000083ef6c19, %l5 = 0000000000005edb
	ldxa	[%i5+%g0]0x80,%l5	! %l5 = 1262000083ef6c19
	membar	#Sync			! Added by membar checker (6)
!	Mem[0000000010141400] = 12620000 83ef6c19 0524d352 5fb35edd
!	Mem[0000000010141410] = 000000da 262e44fd 7e45eefa 582b0ee3
!	Mem[0000000010141420] = 68bb2988 2b8c6e79 27251c7d 0538dbc9
!	Mem[0000000010141430] = 1aa1bcf4 7e5ba0b5 278d28d2 03735a5b
	ldda	[%i5+%g0]ASI_BLK_P,%f0 	! Block Load from 0000000010141400
!	Mem[00000000100c1400] = ffff998c, %l3 = 000000003cb98a40
	lduba	[%i3+%g0]0x80,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030141410] = 3758b1f0, %f24 = f9725d59
	lda	[%i5+%o5]0x81,%f24	! %f24 = 3758b1f0

p0_label_35:
!	Starting 10 instruction Store Burst
!	%f29 = 95ffffff, Mem[0000000030141408] = 00000000
	sta	%f29,[%i5+%o4]0x89	! Mem[0000000030141408] = 95ffffff
!	%f4  = 000000da, Mem[0000000030041408] = 4820c25d
	sta	%f4 ,[%i1+%o4]0x89	! Mem[0000000030041408] = 000000da
!	Mem[0000000030101410] = 5fb35eff, %l0 = 00000000000000d5
	swapa	[%i4+%o5]0x89,%l0	! %l0 = 000000005fb35eff
!	Mem[0000000010001435] = 46b05055, %l4 = ffffffffffffa1db
	ldstub	[%i0+0x035],%l4		! %l4 = 00000000000000b0
!	Mem[0000000010081400] = c7d32f2d, %l5 = 0000000083ef6c19
	swapa	[%i2+%g0]0x80,%l5	! %l5 = 00000000c7d32f2d
	membar	#Sync			! Added by membar checker (7)
!	%l1 = 00000000dd5eb35f, Mem[0000000010141400] = 00006212
	stba	%l1,[%i5+%g0]0x88	! Mem[0000000010141400] = 0000625f
!	Mem[00000000201c0001] = ffff56b0, %l7 = 00000000000000da
	ldstuba	[%o0+0x001]%asi,%l7	! %l7 = 00000000000000ff
!	%l6 = 00000005, %l7 = 000000ff, Mem[0000000030081410] = 28d9c5d4 ffffff95
	stda	%l6,[%i2+%o5]0x81	! Mem[0000000030081410] = 00000005 000000ff
!	%l0 = 5fb35eff, %l1 = dd5eb35f, Mem[0000000010181408] = d54800da 27251c7d
	stda	%l0,[%i6+%o4]0x88	! Mem[0000000010181408] = 5fb35eff dd5eb35f
!	%l3 = 00000000000000ff, Mem[0000000010041412] = c78c6e79, %asi = 80
	stba	%l3,[%i1+0x012]%asi	! Mem[0000000010041410] = c78cff79

p0_label_36:
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = 009b91ff, %f14 = 278d28d2
	lda	[%i2+%g0]0x89,%f14	! %f14 = 009b91ff
!	Mem[0000000020800040] = ff5f7f10, %l7 = 00000000000000ff
	ldub	[%o1+0x040],%l7		! %l7 = 00000000000000ff
!	Mem[0000000010041400] = 7014e739, %l3 = 00000000000000ff
	lduba	[%i1+%g0]0x88,%l3	! %l3 = 0000000000000039
!	Mem[0000000030081410] = 05000000, %l5 = 00000000c7d32f2d
	ldsha	[%i2+%o5]0x89,%l5	! %l5 = 0000000000000000
!	Code Fragment 3, seed = 640021
p0_fragment_4:
!	%l0 = 000000005fb35eff
	setx	0x3d7c7cb160727c7e,%g7,%l0 ! %l0 = 3d7c7cb160727c7e
!	%l1 = 00000000dd5eb35f
	setx	0xdc16c1d245026129,%g7,%l1 ! %l1 = dc16c1d245026129
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 3d7c7cb160727c7e
	setx	0xf8dd3a652deac1e4,%g7,%l0 ! %l0 = f8dd3a652deac1e4
!	%l1 = dc16c1d245026129
	setx	0xd6b3f764328021af,%g7,%l1 ! %l1 = d6b3f764328021af
p0_fragment_4_end:
!	Mem[0000000010081400] = a167680c 196cef83, %l2 = 000000ff, %l3 = 00000039
	ldda	[%i2+%g0]0x88,%l2	! %l2 = 00000000196cef83 00000000a167680c
!	Mem[0000000010001418] = 0745e81a196cef83, %f24 = 3758b1f0 0878d47b, %asi = 80
	ldda	[%i0+0x018]%asi,%f24	! %f24 = 0745e81a 196cef83
!	Mem[0000000010181410] = 592e0b3a, %l6 = 0000000000000005
	ldstuba	[%i6+%o5]0x88,%l6	! %l6 = 000000000000003a
!	Mem[0000000010081424] = 387fe9d9, %f20 = 00000000
	ld	[%i2+0x024],%f20	! %f20 = 387fe9d9
!	Mem[0000000010141414] = 262e44fd, %l7 = 00000000000000ff, %asi = 80
	lduha	[%i5+0x014]%asi,%l7	! %l7 = 000000000000262e

p0_label_37:
!	Starting 10 instruction Store Burst
!	Mem[000000001018140d] = 5fb35edd, %l5 = 0000000000000000
	ldstuba	[%i6+0x00d]%asi,%l5	! %l5 = 00000000000000b3
!	%l2 = 00000000196cef83, Mem[00000000201c0001] = ffff56b0, %asi = 80
	stba	%l2,[%o0+0x001]%asi	! Mem[00000000201c0000] = ff8356b0
!	Mem[00000000300c1408] = 9ecfd115, %l5 = 00000000000000b3
	ldstuba	[%i3+%o4]0x89,%l5	! %l5 = 0000000000000015
!	%f28 = 35cd5121 95ffffff, %l5 = 0000000000000015
!	Mem[0000000030181408] = 00bb2988248a4c17
	add	%i6,0x008,%g1
	stda	%f28,[%g1+%l5]ASI_PST16_SL ! Mem[0000000030181408] = ffff298821514c17
!	Mem[00000000100c1428] = 283ba966, %l6 = 000000000000003a, %asi = 80
	swapa	[%i3+0x028]%asi,%l6	! %l6 = 00000000283ba966
!	%l6 = 00000000283ba966, Mem[0000000010041408] = c7d32f2d592e0b3a
	stxa	%l6,[%i1+%o4]0x88	! Mem[0000000010041408] = 00000000283ba966
!	Mem[0000000030001400] = eb330000, %l3 = 00000000a167680c
	swapa	[%i0+%g0]0x81,%l3	! %l3 = 00000000eb330000
!	%f28 = 35cd5121 95ffffff, %l4 = 00000000000000b0
!	Mem[0000000030001420] = 757fa85b2618b889
	add	%i0,0x020,%g1
	stda	%f28,[%g1+%l4]ASI_PST32_SL ! Mem[0000000030001420] = 757fa85b2618b889
!	%l4 = 00000000000000b0, Mem[00000000100c1408] = 300e7fc3
	stha	%l4,[%i3+%o4]0x88	! Mem[00000000100c1408] = 300e00b0
!	Mem[0000000010181408] = ff5eb35f, %l2 = 00000000196cef83
	swapa	[%i6+%o4]0x80,%l2	! %l2 = 00000000ff5eb35f

p0_label_38:
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = ff8356b0, %l0 = f8dd3a652deac1e4
	ldub	[%o0+%g0],%l0		! %l0 = 00000000000000ff
!	Mem[0000000010081400] = 83ef6c19, %l2 = 00000000ff5eb35f
	lduba	[%i2+%g0]0x80,%l2	! %l2 = 0000000000000083
!	Mem[0000000030041400] = 00000000 3cb98a40, %l0 = 000000ff, %l1 = 328021af
	ldda	[%i1+%g0]0x89,%l0	! %l0 = 000000003cb98a40 0000000000000000
!	Mem[0000000030101400] = ff000000, %l2 = 0000000000000083
	lduwa	[%i4+%g0]0x81,%l2	! %l2 = 00000000ff000000
!	Mem[000000001010143c] = 000000da, %l4 = 00000000000000b0
	lduw	[%i4+0x03c],%l4		! %l4 = 00000000000000da
!	Mem[0000000010081408] = 8e903312, %l6 = 00000000283ba966
	ldsba	[%i2+%o4]0x88,%l6	! %l6 = 0000000000000012
!	Mem[0000000030081408] = ff000000, %l3 = 00000000eb330000
	lduwa	[%i2+%o4]0x81,%l3	! %l3 = 00000000ff000000
!	Mem[0000000010041438] = 0524d352, %l1 = 0000000000000000
	ldsw	[%i1+0x038],%l1		! %l1 = 000000000524d352
!	Mem[0000000010041408] = 66a93b28, %l1 = 000000000524d352
	lduwa	[%i1+%o4]0x80,%l1	! %l1 = 0000000066a93b28
!	Mem[0000000030001408] = 00000000, %l6 = 0000000000000012
	lduha	[%i0+%o4]0x89,%l6	! %l6 = 0000000000000000

p0_label_39:
!	Starting 10 instruction Store Burst
!	%f30 = dbca1f5d 52d32405, Mem[0000000030081400] = ff919b00 650fcf11
	stda	%f30,[%i2+%g0]0x81	! Mem[0000000030081400] = dbca1f5d 52d32405
!	Mem[0000000010041408] = 66a93b28, %l6 = 0000000000000000
	swapa	[%i1+%o4]0x80,%l6	! %l6 = 0000000066a93b28
!	%f18 = c7d32f2d 592e0b3a, %l7 = 000000000000262e
!	Mem[00000000300c1438] = 79e7f6c23c417a8b
	add	%i3,0x038,%g1
	stda	%f18,[%g1+%l7]ASI_PST8_SL ! Mem[00000000300c1438] = 790b2e593c2f7a8b
!	%l0 = 3cb98a40, %l1 = 66a93b28, Mem[0000000010141410] = da000000 fd442e26
	stda	%l0,[%i5+%o5]0x88	! Mem[0000000010141410] = 3cb98a40 66a93b28
!	Mem[00000000100c1402] = ffff998c, %l2 = 00000000ff000000
	ldstuba	[%i3+0x002]%asi,%l2	! %l2 = 0000000000000099
!	Mem[0000000030141410] = 3758b1f0, %l3 = 00000000ff000000
	swapa	[%i5+%o5]0x81,%l3	! %l3 = 000000003758b1f0
!	Mem[0000000030181408] = 8829ffff, %l1 = 0000000066a93b28
	swapa	[%i6+%o4]0x89,%l1	! %l1 = 000000008829ffff
!	%l0 = 3cb98a40, %l1 = 8829ffff, Mem[0000000030181408] = 283ba966 21514c17
	stda	%l0,[%i6+%o4]0x81	! Mem[0000000030181408] = 3cb98a40 8829ffff
!	Mem[0000000030001400] = a167680c, %l1 = 000000008829ffff
	ldstuba	[%i0+%g0]0x81,%l1	! %l1 = 00000000000000a1
!	%f20 = 387fe9d9 3cb98a40, Mem[0000000010001438] = 69acd5f2 3bf59efb
	std	%f20,[%i0+0x038]	! Mem[0000000010001438] = 387fe9d9 3cb98a40

p0_label_40:
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = 408ab93c, %l7 = 000000000000262e
	lduwa	[%i6+%o4]0x89,%l7	! %l7 = 00000000408ab93c
!	Mem[0000000010141400] = 5f620000, %l3 = 000000003758b1f0
	ldswa	[%i5+%g0]0x80,%l3	! %l3 = 000000005f620000
!	Mem[0000000030081400] = dbca1f5d, %l7 = 00000000408ab93c
	ldsha	[%i2+%g0]0x81,%l7	! %l7 = ffffffffffffdbca
!	Mem[0000000030141400] = 0f29a648, %l3 = 000000005f620000
	ldsha	[%i5+%g0]0x81,%l3	! %l3 = 0000000000000f29
!	Mem[0000000010001438] = 387fe9d93cb98a40, %f24 = 0745e81a 196cef83
	ldd	[%i0+0x038],%f24	! %f24 = 387fe9d9 3cb98a40
!	Code Fragment 4, seed = 353826
p0_fragment_5:
!	%l0 = 000000003cb98a40
	setx	0xb3e3d99e14760916,%g7,%l0 ! %l0 = b3e3d99e14760916
!	%l1 = 00000000000000a1
	setx	0x1ed39033aa1e2a41,%g7,%l1 ! %l1 = 1ed39033aa1e2a41
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = b3e3d99e14760916
	setx	0x19e962c48ac41f7c,%g7,%l0 ! %l0 = 19e962c48ac41f7c
!	%l1 = 1ed39033aa1e2a41
	setx	0x3b76aa88f99cebc7,%g7,%l1 ! %l1 = 3b76aa88f99cebc7
p0_fragment_5_end:
!	Mem[0000000030081400] = dbca1f5d, %l7 = ffffffffffffdbca
	lduba	[%i2+%g0]0x81,%l7	! %l7 = 00000000000000db
!	Mem[0000000010081410] = 5dc22048 bcf29c54, %l4 = 000000da, %l5 = 00000015
	ldda	[%i2+%o5]0x88,%l4	! %l4 = 00000000bcf29c54 000000005dc22048
!	Mem[0000000010081408] = a71d3a3c8e903312, %l2 = 0000000000000099
	ldxa	[%i2+%o4]0x88,%l2	! %l2 = a71d3a3c8e903312
!	Mem[0000000010101420] = 68679528, %l2 = a71d3a3c8e903312
	lduh	[%i4+0x020],%l2		! %l2 = 0000000000006867

p0_label_41:
!	Starting 10 instruction Store Burst
!	Mem[0000000030141408] = 95ffffff, %l4 = 00000000bcf29c54
	ldstuba	[%i5+%o4]0x89,%l4	! %l4 = 00000000000000ff
!	%f20 = 387fe9d9 3cb98a40, Mem[0000000010141400] = 5f620000 83ef6c19
	stda	%f20,[%i5+%g0]0x80	! Mem[0000000010141400] = 387fe9d9 3cb98a40
!	%l5 = 000000005dc22048, Mem[0000000021800040] = 6fdd5da0, %asi = 80
	stha	%l5,[%o3+0x040]%asi	! Mem[0000000021800040] = 20485da0
!	Mem[0000000030141400] = 0f29a648 028337b1 ffffff95 00005eff
!	%f16 = c1bcec55 7014e739 c7d32f2d 592e0b3a
!	%f20 = 387fe9d9 3cb98a40 632fb330 7a091d4a
!	%f24 = 387fe9d9 3cb98a40 6383edad 000000ff
!	%f28 = 35cd5121 95ffffff dbca1f5d 52d32405
	stda	%f16,[%i5+%g0]ASI_BLK_SL	! Block Store to 0000000030141400
!	%l1 = 3b76aa88f99cebc7, Mem[0000000030141410] = 408ab93c
	stwa	%l1,[%i5+%o5]0x81	! Mem[0000000030141410] = f99cebc7
!	%f10 = 27251c7d 0538dbc9, Mem[0000000030081410] = 05000000 ff000000
	stda	%f10,[%i2+%o5]0x89	! Mem[0000000030081410] = 27251c7d 0538dbc9
!	%f20 = 387fe9d9, Mem[00000000100c1414] = 5fb35edd
	st	%f20,[%i3+0x014]	! Mem[00000000100c1414] = 387fe9d9
!	Mem[0000000010001400] = 95ffffff, %l1 = 00000000f99cebc7
	swapa	[%i0+%g0]0x88,%l1	! %l1 = 0000000095ffffff
!	%f16 = c1bcec55 7014e739, %l2 = 0000000000006867
!	Mem[0000000030041408] = da000000bcf29c54
	add	%i1,0x008,%g1
	stda	%f16,[%g1+%l2]ASI_PST32_SL ! Mem[0000000030041408] = 39e7147055ecbcc1
!	%l3 = 0000000000000f29, Mem[0000000010001436] = 46ff5055, %asi = 80
	stha	%l3,[%i0+0x036]%asi	! Mem[0000000010001434] = 46ff0f29

p0_label_42:
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = ffe7fc80, %l2 = 0000000000006867
	ldswa	[%i6+%g0]0x81,%l2	! %l2 = ffffffffffe7fc80
!	Mem[0000000030041400] = 408ab93c, %l2 = ffffffffffe7fc80
	lduha	[%i1+%g0]0x81,%l2	! %l2 = 000000000000408a
!	%l3 = 0000000000000f29, immd = fffff8d2, %y  = 637b405a
	sdiv	%l3,-0x72e,%l2		! %l2 = ffffffff80000000
	mov	%l0,%y			! %y = 8ac41f7c
!	Mem[0000000030041408] = 7014e739, %l1 = 0000000095ffffff
	lduba	[%i1+%o4]0x89,%l1	! %l1 = 0000000000000039
!	Mem[0000000010041420] = 7bd47808, %l4 = 00000000000000ff
	ldsw	[%i1+0x020],%l4		! %l4 = 000000007bd47808
	membar	#Sync			! Added by membar checker (8)
!	Mem[0000000010141410] = 3cb98a40, %l3 = 0000000000000f29
	ldswa	[%i5+%o5]0x88,%l3	! %l3 = 000000003cb98a40
!	Mem[0000000030181408] = 3cb98a40, %l5 = 000000005dc22048
	ldswa	[%i6+%o4]0x81,%l5	! %l5 = 000000003cb98a40
!	Mem[0000000030181400] = 91ba2c7980fce7ff, %l5 = 000000003cb98a40
	ldxa	[%i6+%g0]0x89,%l5	! %l5 = 91ba2c7980fce7ff
!	Mem[00000000100c1410] = 000000d5, %l0 = 19e962c48ac41f7c
	ldswa	[%i3+%o5]0x88,%l0	! %l0 = 00000000000000d5
!	Mem[0000000010101410] = 0000000000000041, %f26 = 6383edad 000000ff
	ldda	[%i4+%o5]0x80,%f26	! %f26 = 00000000 00000041

p0_label_43:
!	Starting 10 instruction Store Burst
!	%f10 = 27251c7d 0538dbc9, Mem[0000000010141400] = 387fe9d9 3cb98a40
	stda	%f10,[%i5+%g0]0x80	! Mem[0000000010141400] = 27251c7d 0538dbc9
!	%l1 = 0000000000000039, Mem[0000000010081410] = 549cf2bc
	stha	%l1,[%i2+%o5]0x80	! Mem[0000000010081410] = 0039f2bc
!	%f9  = 2b8c6e79, Mem[0000000010141408] = 52d32405
	sta	%f9 ,[%i5+%o4]0x88	! Mem[0000000010141408] = 2b8c6e79
!	%f4  = 000000da 262e44fd, Mem[0000000030001400] = 0c6867ff 000000d5
	stda	%f4 ,[%i0+%g0]0x89	! Mem[0000000030001400] = 000000da 262e44fd
!	%l6 = 66a93b28, %l7 = 000000db, Mem[0000000010001400] = f99cebc7 ff000000
	stda	%l6,[%i0+%g0]0x88	! Mem[0000000010001400] = 66a93b28 000000db
!	Mem[0000000010001410] = 000000ff, %l5 = 91ba2c7980fce7ff
	ldstuba	[%i0+%o5]0x88,%l5	! %l5 = 00000000000000ff
!	%l4 = 7bd47808, %l5 = 000000ff, Mem[0000000010101418] = 47ed0d9a 57820f03
	std	%l4,[%i4+0x018]		! Mem[0000000010101418] = 7bd47808 000000ff
!	Mem[0000000030101410] = 000000d5, %l2 = ffffffff80000000
	ldstuba	[%i4+%o5]0x89,%l2	! %l2 = 00000000000000d5
!	%f18 = c7d32f2d 592e0b3a, Mem[0000000030141400] = 7014e739 c1bcec55
	stda	%f18,[%i5+%g0]0x89	! Mem[0000000030141400] = c7d32f2d 592e0b3a
!	%l1 = 0000000000000039, %l7 = 00000000000000db, %l6 = 0000000066a93b28
	xnor	%l1,%l7,%l6		! %l6 = ffffffffffffff1d

p0_label_44:
!	Starting 10 instruction Load Burst
!	Mem[0000000020800040] = ff5f7f10, %l1 = 0000000000000039
	ldub	[%o1+0x040],%l1		! %l1 = 00000000000000ff
!	Mem[0000000010101410] = 00000000, %l2 = 00000000000000d5
	lduwa	[%i4+%o5]0x80,%l2	! %l2 = 0000000000000000
!	Mem[00000000100c1408] = 28acf55a300e00b0, %f12 = 1aa1bcf4 7e5ba0b5
	ldda	[%i3+%o4]0x88,%f12	! %f12 = 28acf55a 300e00b0
!	Mem[000000001000142c] = 2ffee7df, %l1 = 00000000000000ff
	ldsw	[%i0+0x02c],%l1		! %l1 = 000000002ffee7df
!	Mem[00000000100c1400] = 8cffffff, %l5 = 00000000000000ff
	ldsba	[%i3+%g0]0x88,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000030181410] = 600b8212 00000000, %l4 = 7bd47808, %l5 = ffffffff
	ldda	[%i6+%o5]0x81,%l4	! %l4 = 00000000600b8212 0000000000000000
!	Mem[0000000030101408] = 00000000 3cb98a40, %l2 = 00000000, %l3 = 3cb98a40
	ldda	[%i4+%o4]0x89,%l2	! %l2 = 000000003cb98a40 0000000000000000
!	Mem[00000000100c1400] = ffffff8c2fdadc21, %l7 = 00000000000000db
	ldxa	[%i3+%g0]0x80,%l7	! %l7 = ffffff8c2fdadc21
!	Mem[0000000030181410] = 00000000 12820b60, %l4 = 600b8212, %l5 = 00000000
	ldda	[%i6+%o5]0x89,%l4	! %l4 = 0000000012820b60 0000000000000000
!	Mem[0000000030081400] = dbca1f5d, %l2 = 000000003cb98a40
	lduha	[%i2+%g0]0x81,%l2	! %l2 = 000000000000dbca

p0_label_45:
!	Starting 10 instruction Store Burst
!	%l6 = ffffff1d, %l7 = 2fdadc21, Mem[0000000030141410] = c7eb9cf9 387fe9d9
	stda	%l6,[%i5+%o5]0x89	! Mem[0000000030141410] = ffffff1d 2fdadc21
!	%l2 = 000000000000dbca, imm = fffffffffffff137, %l6 = ffffffffffffff1d
	orn	%l2,-0xec9,%l6		! %l6 = 000000000000dfca
!	Mem[00000000100c141c] = 12820b60, %l6 = 000000000000dfca, %asi = 80
	swapa	[%i3+0x01c]%asi,%l6	! %l6 = 0000000012820b60
!	%l0 = 00000000000000d5, Mem[0000000021800040] = 20485da0
	sth	%l0,[%o3+0x040]		! Mem[0000000021800040] = 00d55da0
!	Code Fragment 4, seed = 458070
p0_fragment_6:
!	%l0 = 00000000000000d5
	setx	0xeafb2ca8cf2ac376,%g7,%l0 ! %l0 = eafb2ca8cf2ac376
!	%l1 = 000000002ffee7df
	setx	0xfb0f57df110d56a1,%g7,%l1 ! %l1 = fb0f57df110d56a1
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = eafb2ca8cf2ac376
	setx	0xc2b48bd14f4b1ddc,%g7,%l0 ! %l0 = c2b48bd14f4b1ddc
!	%l1 = fb0f57df110d56a1
	setx	0xc85818ba621b1c27,%g7,%l1 ! %l1 = c85818ba621b1c27
p0_fragment_6_end:
!	%l2 = 000000000000dbca, Mem[0000000010041400] = c1bcec557014e739
	stxa	%l2,[%i1+%g0]0x88	! Mem[0000000010041400] = 000000000000dbca
!	Code Fragment 3, seed = 135512
p0_fragment_7:
!	%l0 = c2b48bd14f4b1ddc
	setx	0xc541a8ba866fc566,%g7,%l0 ! %l0 = c541a8ba866fc566
!	%l1 = c85818ba621b1c27
	setx	0x214bc3084add7591,%g7,%l1 ! %l1 = 214bc3084add7591
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = c541a8ba866fc566
	setx	0x1d033295b9bfc9cc,%g7,%l0 ! %l0 = 1d033295b9bfc9cc
!	%l1 = 214bc3084add7591
	setx	0x3380ac7b60d2c517,%g7,%l1 ! %l1 = 3380ac7b60d2c517
p0_fragment_7_end:
!	%f6  = 7e45eefa, Mem[0000000010081400] = 83ef6c19
	sta	%f6 ,[%i2+%g0]0x80	! Mem[0000000010081400] = 7e45eefa
!	%f30 = dbca1f5d 52d32405, Mem[0000000010001400] = 283ba966 db000000
	stda	%f30,[%i0+%g0]0x80	! Mem[0000000010001400] = dbca1f5d 52d32405
!	Mem[00000000100c143c] = 3d99573b, %l3 = 0000000000000000
	swap	[%i3+0x03c],%l3		! %l3 = 000000003d99573b

p0_label_46:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = 0524d3525d1fcadb, %f28 = 35cd5121 95ffffff
	ldda	[%i0+%g0]0x88,%f28	! %f28 = 0524d352 5d1fcadb
!	Mem[0000000030101410] = 000000ff, %l1 = 3380ac7b60d2c517
	ldsha	[%i4+%o5]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030081410] = c9db3805, %l5 = 0000000000000000
	lduha	[%i2+%o5]0x81,%l5	! %l5 = 000000000000c9db
!	Mem[00000000300c1410] = ff8ab93c 5fb35edd, %l2 = 0000dbca, %l3 = 3d99573b
	ldda	[%i3+%o5]0x81,%l2	! %l2 = 00000000ff8ab93c 000000005fb35edd
!	Mem[0000000030081408] = e739fb13 000000ff, %l6 = 12820b60, %l7 = 2fdadc21
	ldda	[%i2+%o4]0x89,%l6	! %l6 = 00000000000000ff 00000000e739fb13
!	Mem[0000000030041410] = 8e903312, %l1 = 00000000000000ff
	ldswa	[%i1+%o5]0x89,%l1	! %l1 = ffffffff8e903312
!	Mem[0000000010141400] = 7d1c2527, %l0 = 1d033295b9bfc9cc
	ldswa	[%i5+%g0]0x88,%l0	! %l0 = 000000007d1c2527
!	Mem[0000000010001408] = 632fb330 7a091d4a, %l6 = 000000ff, %l7 = e739fb13, %asi = 80
	ldda	[%i0+0x008]%asi,%l6	! %l6 = 00000000632fb330 000000007a091d4a
!	Mem[0000000030141408] = c7d32f2d592e0b3a, %f16 = c1bcec55 7014e739
	ldda	[%i5+%o4]0x89,%f16	! %f16 = c7d32f2d 592e0b3a
!	Mem[00000000100c1408] = b0000e30, %l6 = 00000000632fb330
	lduba	[%i3+%o4]0x80,%l6	! %l6 = 00000000000000b0

p0_label_47:
!	Starting 10 instruction Store Burst
!	%l0 = 7d1c2527, %l1 = 8e903312, Mem[0000000010001400] = dbca1f5d 52d32405
	std	%l0,[%i0+%g0]		! Mem[0000000010001400] = 7d1c2527 8e903312
!	%f0  = 12620000 83ef6c19, Mem[0000000010101400] = 71547d90 0be04d61
	stda	%f0 ,[%i4+%g0]0x80	! Mem[0000000010101400] = 12620000 83ef6c19
!	Mem[0000000010181400] = 00000000, %l4 = 0000000012820b60
	ldstuba	[%i6+%g0]0x88,%l4	! %l4 = 0000000000000000
!	%l4 = 0000000000000000, Mem[00000000300c1400] = 262e44fd
	stha	%l4,[%i3+%g0]0x89	! Mem[00000000300c1400] = 262e0000
!	%l6 = 00000000000000b0, Mem[00000000100c1438] = 71242b32
	stb	%l6,[%i3+0x038]		! Mem[00000000100c1438] = b0242b32
!	Mem[0000000010001408] = 30b32f63, %l0 = 000000007d1c2527
	swapa	[%i0+%o4]0x88,%l0	! %l0 = 0000000030b32f63
!	Mem[0000000030101408] = 3cb98a40, %l6 = 00000000000000b0
	swapa	[%i4+%o4]0x89,%l6	! %l6 = 000000003cb98a40
!	Mem[00000000100c1410] = 000000d5, %l2 = 00000000ff8ab93c
	ldstuba	[%i3+%o5]0x88,%l2	! %l2 = 00000000000000d5
!	%l3 = 000000005fb35edd, Mem[0000000030181408] = 408ab93c
	stwa	%l3,[%i6+%o4]0x89	! Mem[0000000030181408] = 5fb35edd
!	Mem[0000000010101408] = 52d32405, %l7 = 000000007a091d4a
	ldstuba	[%i4+%o4]0x88,%l7	! %l7 = 0000000000000005

p0_label_48:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = 000000ff, %l6 = 000000003cb98a40
	lduwa	[%i6+%g0]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010101400] = 12620000, %l5 = 000000000000c9db
	ldswa	[%i4+%g0]0x80,%l5	! %l5 = 0000000012620000
!	Mem[00000000201c0000] = ff8356b0, %l5 = 0000000012620000
	ldsb	[%o0+%g0],%l5		! %l5 = ffffffffffffffff
!	Mem[00000000100c1408] = b0000e30, %f21 = 3cb98a40
	lda	[%i3+%o4]0x80,%f21	! %f21 = b0000e30
!	Mem[00000000100c1408] = 300e00b0, %l7 = 0000000000000005
	lduwa	[%i3+%o4]0x88,%l7	! %l7 = 00000000300e00b0
!	Mem[0000000010001408] = 4a1d097a7d1c2527, %f6  = 7e45eefa 582b0ee3
	ldda	[%i0+%o4]0x88,%f6 	! %f6  = 4a1d097a 7d1c2527
!	Mem[0000000010181408] = 196cef835fff5edd, %f8  = 68bb2988 2b8c6e79
	ldd	[%i6+%o4],%f8 		! %f8  = 196cef83 5fff5edd
!	Mem[0000000010101410] = 0000000000000041, %l7 = 00000000300e00b0, %asi = 80
	ldxa	[%i4+0x010]%asi,%l7	! %l7 = 0000000000000041
!	Mem[00000000300c1408] = ffd1cf9e 58f4b677, %l2 = 000000d5, %l3 = 5fb35edd
	ldda	[%i3+%o4]0x81,%l2	! %l2 = 00000000ffd1cf9e 0000000058f4b677
!	Mem[0000000030141408] = 3a0b2e59, %l6 = 00000000000000ff
	ldswa	[%i5+%o4]0x81,%l6	! %l6 = 000000003a0b2e59

p0_label_49:
!	Starting 10 instruction Store Burst
!	Mem[00000000201c0001] = ff8356b0, %l4 = 0000000000000000
	ldstuba	[%o0+0x001]%asi,%l4	! %l4 = 0000000000000083
!	%f21 = b0000e30, Mem[0000000010041410] = c78cff79
	sta	%f21,[%i1+%o5]0x80	! Mem[0000000010041410] = b0000e30
!	%f18 = c7d32f2d 592e0b3a, %l6 = 000000003a0b2e59
!	Mem[0000000030141438] = 0524d3525d1fcadb
	add	%i5,0x038,%g1
	stda	%f18,[%g1+%l6]ASI_PST8_SL ! Mem[0000000030141438] = 3a24d3592d1fd3db
!	%l0 = 0000000030b32f63, imm = 0000000000000c20, %l5 = ffffffffffffffff
	andn	%l0,0xc20,%l5		! %l5 = 0000000030b32343
!	%f4  = 000000da, Mem[00000000100c140c] = 5af5ac28
	st	%f4 ,[%i3+0x00c]	! Mem[00000000100c140c] = 000000da
!	%f21 = b0000e30, Mem[0000000030181410] = 600b8212
	sta	%f21,[%i6+%o5]0x81	! Mem[0000000030181410] = b0000e30
!	%l1 = ffffffff8e903312, Mem[0000000010081408] = 1233908e
	stba	%l1,[%i2+%o4]0x80	! Mem[0000000010081408] = 1233908e
!	%l1 = ffffffff8e903312, Mem[0000000030101408] = b000000000000000
	stxa	%l1,[%i4+%o4]0x81	! Mem[0000000030101408] = ffffffff8e903312
!	%l1 = ffffffff8e903312, Mem[0000000010001400] = 27251c7d
	stwa	%l1,[%i0+%g0]0x88	! Mem[0000000010001400] = 8e903312
!	%l2 = ffd1cf9e, %l3 = 58f4b677, Mem[0000000010181410] = ff0b2e59 198125dd
	stda	%l2,[%i6+%o5]0x80	! Mem[0000000010181410] = ffd1cf9e 58f4b677

p0_label_50:
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = 00000000, %l1 = ffffffff8e903312
	lduha	[%i0+%o4]0x89,%l1	! %l1 = 0000000000000000
!	Mem[00000000100c142a] = 0000003a, %l7 = 0000000000000041, %asi = 80
	ldsha	[%i3+0x02a]%asi,%l7	! %l7 = 000000000000003a
!	Mem[0000000030141410] = 1dffffff, %l6 = 000000003a0b2e59
	ldsba	[%i5+%o5]0x81,%l6	! %l6 = 000000000000001d
!	Mem[0000000030181400] = 80fce7ff, %l0 = 0000000030b32f63
	ldsha	[%i6+%g0]0x89,%l0	! %l0 = ffffffffffffe7ff
!	Mem[0000000010101408] = ff24d352, %l7 = 000000000000003a
	lduha	[%i4+%o4]0x80,%l7	! %l7 = 000000000000ff24
	membar	#Sync			! Added by membar checker (9)
!	Mem[00000000100c1400] = ffffff8c 2fdadc21 b0000e30 000000da
!	Mem[00000000100c1410] = ff000000 387fe9d9 00000000 0000dfca
!	Mem[00000000100c1420] = 54a4cae8 3a0b2e59 0000003a 02a86c1f
!	Mem[00000000100c1430] = 69e59c54 244ce695 b0242b32 00000000
	ldda	[%i3+%g0]ASI_BLK_AIUP,%f0 	! Block Load from 00000000100c1400
!	Mem[0000000010101408] = ff24d352, %l3 = 0000000058f4b677
	ldswa	[%i4+%o4]0x80,%l3	! %l3 = ffffffffff24d352
!	Mem[0000000030101400] = ff000000 00000000 ffffffff 8e903312
!	Mem[0000000030101410] = ff000000 3cb99773 7f3f704a 2c0578f3
!	Mem[0000000030101420] = 76aa6158 1ec1a509 50f65756 2aeaec4f
!	Mem[0000000030101430] = 25a83dc4 07a95c45 3da17c22 12120e6b
	ldda	[%i4+%g0]ASI_BLK_S,%f0 	! Block Load from 0000000030101400
!	Mem[0000000030001400] = 262e44fd, %l1 = 0000000000000000
	ldswa	[%i0+%g0]0x89,%l1	! %l1 = 00000000262e44fd
!	Mem[0000000010101410] = 4100000000000000, %f18 = c7d32f2d 592e0b3a
	ldda	[%i4+%o5]0x88,%f18	! %f18 = 41000000 00000000

p0_label_51:
!	Starting 10 instruction Store Burst
!	Mem[0000000010141408] = 796e8c2b, %l1 = 00000000262e44fd
	swapa	[%i5+%o4]0x80,%l1	! %l1 = 00000000796e8c2b
!	%l5 = 0000000030b32343, Mem[0000000010041410] = b0000e30ffff8212
	stx	%l5,[%i1+%o5]		! Mem[0000000010041410] = 0000000030b32343
!	%f19 = 00000000, Mem[0000000030141408] = 592e0b3a
	sta	%f19,[%i5+%o4]0x89	! Mem[0000000030141408] = 00000000
!	Mem[0000000010041424] = 595d72f9, %l3 = 00000000ff24d352, %asi = 80
	swapa	[%i1+0x024]%asi,%l3	! %l3 = 00000000595d72f9
	membar	#Sync			! Added by membar checker (10)
!	%l4 = 00000083, %l5 = 30b32343, Mem[00000000100c1430] = 69e59c54 244ce695, %asi = 80
	stda	%l4,[%i3+0x030]%asi	! Mem[00000000100c1430] = 00000083 30b32343
!	%l2 = 00000000ffd1cf9e, Mem[0000000010181408] = 196cef83
	stba	%l2,[%i6+%o4]0x80	! Mem[0000000010181408] = 9e6cef83
!	Mem[0000000010001400] = 1233908e, %l5 = 0000000030b32343
	ldstuba	[%i0+%g0]0x80,%l5	! %l5 = 0000000000000012
!	%f12 = 25a83dc4 07a95c45, %l0 = ffffffffffffe7ff
!	Mem[00000000300c1430] = 2e9673641d50b765
	add	%i3,0x030,%g1
	stda	%f12,[%g1+%l0]ASI_PST16_SL ! Mem[00000000300c1430] = 455ca907c43da825
!	%l6 = 000000000000001d, Mem[0000000030081400] = dbca1f5d52d32405
	stxa	%l6,[%i2+%g0]0x81	! Mem[0000000030081400] = 000000000000001d
!	%l3 = 00000000595d72f9, Mem[00000000300c1410] = ff8ab93c5fb35edd
	stxa	%l3,[%i3+%o5]0x81	! Mem[00000000300c1410] = 00000000595d72f9

p0_label_52:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = 00000000, %l5 = 0000000000000012
	ldsba	[%i1+%o4]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000010081420] = 184c3c68, %l4 = 0000000000000083
	lduh	[%i2+0x020],%l4		! %l4 = 000000000000184c
!	Mem[00000000100c1408] = b0000e30, %l6 = 000000000000001d
	ldsha	[%i3+%o4]0x80,%l6	! %l6 = ffffffffffffb000
!	Mem[0000000010101408] = 52d324ff, %f9  = 1ec1a509
	lda	[%i4+%o4]0x88,%f9 	! %f9 = 52d324ff
!	Mem[0000000030041400] = 408ab93c 00000000 39e71470 55ecbcc1
!	Mem[0000000030041410] = 1233908e 00000000 41c5c42a 465c9153
!	Mem[0000000030041420] = 528a5c38 1c576869 41737136 7569f2af
!	Mem[0000000030041430] = 2e43aea4 0e6afda5 54983c02 63e462cb
	ldda	[%i1+%g0]ASI_BLK_AIUS,%f16	! Block Load from 0000000030041400
!	Mem[0000000010141438] = 278d28d2, %l7 = 000000000000ff24
	ldsb	[%i5+0x038],%l7		! %l7 = 0000000000000027
!	Mem[0000000030081408] = ff00000013fb39e7, %f4  = ff000000 3cb99773
	ldda	[%i2+%o4]0x81,%f4 	! %f4  = ff000000 13fb39e7
!	Mem[0000000030041408] = 7014e739, %f13 = 07a95c45
	lda	[%i1+%o4]0x89,%f13	! %f13 = 7014e739
!	%f3  = 8e903312, %f15 = 12120e6b
	fcmpes	%fcc3,%f3 ,%f15		! %fcc3 = 1
!	Mem[0000000010041410] = 0000000030b32343, %l7 = 0000000000000027
	ldxa	[%i1+%o5]0x80,%l7	! %l7 = 0000000030b32343

p0_label_53:
!	Starting 10 instruction Store Burst
!	%l6 = ffffffffffffb000, Mem[0000000030141408] = 00000000
	stba	%l6,[%i5+%o4]0x81	! Mem[0000000030141408] = 00000000
!	Mem[0000000010081410] = 0039f2bc, %l0 = 00000000ffffe7ff
	swapa	[%i2+%o5]0x80,%l0	! %l0 = 000000000039f2bc
!	Mem[0000000010101400] = 12620000 83ef6c19 ff24d352 5fb35edd
!	%f16 = 408ab93c 00000000 39e71470 55ecbcc1
!	%f20 = 1233908e 00000000 41c5c42a 465c9153
!	%f24 = 528a5c38 1c576869 41737136 7569f2af
!	%f28 = 2e43aea4 0e6afda5 54983c02 63e462cb
	stda	%f16,[%i4+%g0]ASI_COMMIT_P	! Block Store to 0000000010101400
!	%l2 = ffd1cf9e, %l3 = 595d72f9, Mem[0000000010001410] = ff000000 aded8363, %asi = 80
	stda	%l2,[%i0+0x010]%asi	! Mem[0000000010001410] = ffd1cf9e 595d72f9
!	Mem[0000000010181410] = ffd1cf9e, %l2 = 00000000ffd1cf9e
	swapa	[%i6+%o5]0x80,%l2	! %l2 = 00000000ffd1cf9e
!	%l1 = 00000000796e8c2b, Mem[0000000030001408] = 00000000
	stha	%l1,[%i0+%o4]0x89	! Mem[0000000030001408] = 00008c2b
!	Mem[0000000010181431] = c9db3805, %l1 = 00000000796e8c2b
	ldstuba	[%i6+0x031]%asi,%l1	! %l1 = 00000000000000db
!	Mem[000000001000140b] = 27251c7d, %l5 = 0000000000000000
	ldstuba	[%i0+0x00b]%asi,%l5	! %l5 = 000000000000007d
!	%f27 = 7569f2af, %f13 = 7014e739, %f7  = 2c0578f3
	fsubs	%f27,%f13,%f7 		! %f7  = 7569cd75
!	Mem[0000000010041438] = 0524d352, %l7 = 0000000030b32343
	swap	[%i1+0x038],%l7		! %l7 = 000000000524d352

p0_label_54:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = 9ecfd1ff, %f7  = 7569cd75
	lda	[%i6+%o5]0x88,%f7 	! %f7 = 9ecfd1ff
!	Mem[0000000010001400] = ff33908e, %l5 = 000000000000007d
	lduwa	[%i0+%g0]0x80,%l5	! %l5 = 00000000ff33908e
!	Mem[0000000030181400] = ffe7fc80, %l5 = 00000000ff33908e
	lduwa	[%i6+%g0]0x81,%l5	! %l5 = 00000000ffe7fc80
!	Mem[0000000010081400] = faee457e, %f13 = 7014e739
	lda	[%i2+%g0]0x88,%f13	! %f13 = faee457e
!	Mem[0000000010141400] = 27251c7d0538dbc9, %l5 = 00000000ffe7fc80
	ldx	[%i5+%g0],%l5		! %l5 = 27251c7d0538dbc9
!	Mem[00000000211c0000] = 62124d40, %l3 = 00000000595d72f9, %asi = 80
	ldsha	[%o2+0x000]%asi,%l3	! %l3 = 0000000000006212
!	%l2 = 00000000ffd1cf9e, %l1 = 00000000000000db, %l0 = 000000000039f2bc
	udivx	%l2,%l1,%l0		! %l0 = 00000000012b0a4c
!	Mem[000000001014140e] = 5fb35edd, %l3 = 0000000000006212
	lduh	[%i5+0x00e],%l3		! %l3 = 0000000000005edd
!	Code Fragment 3, seed = 842996
p0_fragment_8:
!	%l0 = 00000000012b0a4c
	setx	0x01646b53f943c486,%g7,%l0 ! %l0 = 01646b53f943c486
!	%l1 = 00000000000000db
	setx	0x6d1a157ed4b7cab1,%g7,%l1 ! %l1 = 6d1a157ed4b7cab1
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 01646b53f943c486
	setx	0x7bcb256eeb0894ec,%g7,%l0 ! %l0 = 7bcb256eeb0894ec
!	%l1 = 6d1a157ed4b7cab1
	setx	0xece204de17f82637,%g7,%l1 ! %l1 = ece204de17f82637
p0_fragment_8_end:
!	Mem[0000000010001418] = 0745e81a196cef83, %f14 = 3da17c22 12120e6b
	ldd	[%i0+0x018],%f14	! %f14 = 0745e81a 196cef83

p0_label_55:
!	Starting 10 instruction Store Burst
!	%f30 = 54983c02, Mem[0000000030141408] = 00000000
	sta	%f30,[%i5+%o4]0x89	! Mem[0000000030141408] = 54983c02
	membar	#Sync			! Added by membar checker (11)
!	Mem[0000000010101408] = 39e71470, %l2 = 00000000ffd1cf9e
	swapa	[%i4+%o4]0x80,%l2	! %l2 = 0000000039e71470
!	%l1 = ece204de17f82637, Mem[0000000010041410] = 00000000
	stba	%l1,[%i1+%o5]0x88	! Mem[0000000010041410] = 00000037
!	Mem[0000000021800181] = 701d8090, %l1 = ece204de17f82637
	ldstub	[%o3+0x181],%l1		! %l1 = 000000000000001d
!	%l0 = 7bcb256eeb0894ec, Mem[00000000201c0001] = ffff56b0, %asi = 80
	stba	%l0,[%o0+0x001]%asi	! Mem[00000000201c0000] = ffec56b0
!	%l6 = ffffb000, %l7 = 0524d352, Mem[0000000010101428] = 41737136 7569f2af, %asi = 80
	stda	%l6,[%i4+0x028]%asi	! Mem[0000000010101428] = ffffb000 0524d352
!	Mem[00000000100c1400] = ffffff8c, %l1 = 000000000000001d
	ldstuba	[%i3+%g0]0x80,%l1	! %l1 = 00000000000000ff
!	%l0 = 7bcb256eeb0894ec, Mem[0000000030181410] = b0000e30
	stwa	%l0,[%i6+%o5]0x81	! Mem[0000000030181410] = eb0894ec
!	Mem[0000000010041430] = 274a5374, %l6 = 00000000ffffb000
	swap	[%i1+0x030],%l6		! %l6 = 00000000274a5374
!	%f16 = 408ab93c 00000000, Mem[0000000030001400] = fd442e26 da000000
	stda	%f16,[%i0+%g0]0x81	! Mem[0000000030001400] = 408ab93c 00000000

p0_label_56:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = 408ab93c, %l1 = 00000000000000ff
	lduha	[%i4+%g0]0x80,%l1	! %l1 = 000000000000408a
!	Mem[0000000010081400] = 7e45eefa, %l2 = 0000000039e71470
	lduh	[%i2+%g0],%l2		! %l2 = 0000000000007e45
!	%l1 = 000000000000408a, immd = 00000c39, %y  = 8ac41f7c
	umul	%l1,0xc39,%l6		! %l6 = 000000000314d6ba, %y = 00000000
!	Mem[0000000010041400] = 0000dbca, %l3 = 0000000000005edd
	ldsba	[%i1+%g0]0x88,%l3	! %l3 = ffffffffffffffca
!	Mem[0000000030001408] = 2b8c0000, %l5 = 27251c7d0538dbc9
	ldswa	[%i0+%o4]0x81,%l5	! %l5 = 000000002b8c0000
!	Mem[0000000010081400] = 7e45eefa, %l2 = 0000000000007e45
	lduha	[%i2+%g0]0x80,%l2	! %l2 = 0000000000007e45
!	Mem[0000000010001434] = 46ff0f29, %l4 = 000000000000184c, %asi = 80
	lduwa	[%i0+0x034]%asi,%l4	! %l4 = 0000000046ff0f29
!	Mem[000000001018143e] = 5f8af63b, %l1 = 000000000000408a
	lduh	[%i6+0x03e],%l1		! %l1 = 000000000000f63b
!	Mem[0000000030081408] = 000000ff, %l2 = 0000000000007e45
	ldsha	[%i2+%o4]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010081408] = 8e903312, %l1 = 000000000000f63b
	ldsha	[%i2+%o4]0x88,%l1	! %l1 = 0000000000003312

p0_label_57:
!	Starting 10 instruction Store Burst
!	Mem[0000000030101410] = 000000ff, %l2 = 00000000000000ff
	swapa	[%i4+%o5]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010081408] = 1233908e, %l1 = 0000000000003312
	ldstuba	[%i2+%o4]0x80,%l1	! %l1 = 0000000000000012
!	%l5 = 000000002b8c0000, Mem[0000000030181408] = dd5eb35f
	stba	%l5,[%i6+%o4]0x81	! Mem[0000000030181408] = 005eb35f
!	Mem[0000000030181410] = ec9408eb, %l5 = 000000002b8c0000
	swapa	[%i6+%o5]0x89,%l5	! %l5 = 00000000ec9408eb
!	Mem[0000000010141400] = 27251c7d, %l6 = 000000000314d6ba
	ldstuba	[%i5+%g0]0x80,%l6	! %l6 = 0000000000000027
!	%l3 = ffffffffffffffca, Mem[0000000030181410] = 2b8c0000
	stwa	%l3,[%i6+%o5]0x89	! Mem[0000000030181410] = ffffffca
!	%l4 = 46ff0f29, %l5 = ec9408eb, Mem[0000000030181410] = caffffff 00000000
	stda	%l4,[%i6+%o5]0x81	! Mem[0000000030181410] = 46ff0f29 ec9408eb
!	Mem[00000000300c1408] = ffd1cf9e, %l1 = 0000000000000012
	swapa	[%i3+%o4]0x81,%l1	! %l1 = 00000000ffd1cf9e
!	%f19 = 55ecbcc1, %f3  = 8e903312
	fcmpes	%fcc2,%f19,%f3 		! %fcc2 = 2
!	Mem[0000000010001400] = 8e9033ff, %l1 = 00000000ffd1cf9e
	swapa	[%i0+%g0]0x88,%l1	! %l1 = 000000008e9033ff

p0_label_58:
!	Starting 10 instruction Load Burst
!	%f24 = 528a5c38 1c576869, %f10 = 50f65756 2aeaec4f
	fxtod	%f24,%f10		! %f10 = 43d4a297 0e0715da
!	Mem[00000000300c1410] = 00000000595d72f9, %f30 = 54983c02 63e462cb
	ldda	[%i3+%o5]0x81,%f30	! %f30 = 00000000 595d72f9
!	Mem[00000000300c1410] = 00000000, %l5 = 00000000ec9408eb
	ldsba	[%i3+%o5]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000030001410] = ff000000, %l7 = 000000000524d352
	lduba	[%i0+%o5]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000030081400] = 00000000, %f28 = 2e43aea4
	lda	[%i2+%g0]0x81,%f28	! %f28 = 00000000
!	Mem[0000000030141408] = 023c9854, %l7 = 0000000000000000
	lduwa	[%i5+%o4]0x81,%l7	! %l7 = 00000000023c9854
!	Mem[0000000030041410] = 1233908e, %l3 = ffffffffffffffca
	lduba	[%i1+%o5]0x81,%l3	! %l3 = 0000000000000012
!	Mem[0000000010041408] = 00000000, %l5 = 0000000000000000
	ldsba	[%i1+%o4]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000010181410] = 9ecfd1ff, %l2 = 00000000000000ff
	ldsha	[%i6+%o5]0x88,%l2	! %l2 = ffffffffffffd1ff
!	%l2 = ffffffffffffd1ff, %l3 = 0000000000000012, %y  = 00000000
	umul	%l2,%l3,%l6		! %l6 = 00000011fffcc3ee, %y = 00000011

p0_label_59:
!	Starting 10 instruction Store Burst
!	%f15 = 196cef83, Mem[00000000300c1400] = 262e0000
	sta	%f15,[%i3+%g0]0x89	! Mem[00000000300c1400] = 196cef83
!	Code Fragment 3, seed = 971346
p0_fragment_9:
!	%l0 = 7bcb256eeb0894ec
	setx	0xfa4e0d1d103dd796,%g7,%l0 ! %l0 = fa4e0d1d103dd796
!	%l1 = 000000008e9033ff
	setx	0x8bcc9403525eb0c1,%g7,%l1 ! %l1 = 8bcc9403525eb0c1
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = fa4e0d1d103dd796
	setx	0x2cbb14d92e7fddfc,%g7,%l0 ! %l0 = 2cbb14d92e7fddfc
!	%l1 = 8bcc9403525eb0c1
	setx	0x7d12d813ca4e6247,%g7,%l1 ! %l1 = 7d12d813ca4e6247
p0_fragment_9_end:
!	%l3 = 0000000000000012, Mem[0000000010141410] = 408ab93c283ba966
	stxa	%l3,[%i5+%o5]0x80	! Mem[0000000010141410] = 0000000000000012
!	%l6 = fffcc3ee, %l7 = 023c9854, Mem[0000000010101408] = 9ecfd1ff c1bcec55
	stda	%l6,[%i4+%o4]0x88	! Mem[0000000010101408] = fffcc3ee 023c9854
!	Mem[0000000010001400] = 9ecfd1ff, %l0 = 2cbb14d92e7fddfc
	ldstuba	[%i0+%g0]0x80,%l0	! %l0 = 000000000000009e
!	Mem[000000001014143f] = 03735a5b, %l7 = 00000000023c9854
	ldstuba	[%i5+0x03f]%asi,%l7	! %l7 = 000000000000005b
!	Mem[0000000030181400] = ffe7fc80 792cba91 005eb35f 8829ffff
!	%f0  = ff000000 00000000 ffffffff 8e903312
!	%f4  = ff000000 13fb39e7 7f3f704a 9ecfd1ff
!	%f8  = 76aa6158 52d324ff 43d4a297 0e0715da
!	%f12 = 25a83dc4 faee457e 0745e81a 196cef83
	stda	%f0 ,[%i6+%g0]ASI_COMMIT_S	! Block Store to 0000000030181400
!	Mem[0000000010101408] = eec3fcff, %l7 = 000000000000005b
	ldstuba	[%i4+%o4]0x80,%l7	! %l7 = 00000000000000ee
!	Mem[0000000030001410] = ff000000, %l5 = 0000000000000000
	ldstuba	[%i0+%o5]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000010101410] = 8e903312, %l4 = 0000000046ff0f29
	ldstuba	[%i4+%o5]0x88,%l4	! %l4 = 0000000000000012

p0_label_60:
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = 00000000, %l6 = 00000011fffcc3ee
	lduba	[%i3+%o5]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000021800180] = 70ff8090, %l7 = 00000000000000ee, %asi = 80
	ldsha	[%o3+0x180]%asi,%l7	! %l7 = 00000000000070ff
!	Mem[0000000010041400] = cadb000000000000, %f26 = 41737136 7569f2af
	ldda	[%i1+%g0]0x80,%f26	! %f26 = cadb0000 00000000
!	%f10 = 43d4a297, %f30 = 00000000
	fcmps	%fcc3,%f10,%f30		! %fcc3 = 2
!	Mem[0000000010041408] = 0000000000000000, %l0 = 000000000000009e, %asi = 80
	ldxa	[%i1+0x008]%asi,%l0	! %l0 = 0000000000000000
!	Mem[0000000010101408] = fffcc3ff, %l3 = 0000000000000012
	lduwa	[%i4+%o4]0x88,%l3	! %l3 = 00000000fffcc3ff
!	Mem[0000000010001410] = ffd1cf9e, %l4 = 0000000000000012
	lduwa	[%i0+%o5]0x80,%l4	! %l4 = 00000000ffd1cf9e
!	Mem[00000000100c1410] = ff000000 387fe9d9, %l4 = ffd1cf9e, %l5 = 00000000
	ldda	[%i3+%o5]0x80,%l4	! %l4 = 00000000ff000000 00000000387fe9d9
!	Mem[0000000030081410] = c9db3805 7d1c2527, %l2 = ffffd1ff, %l3 = fffcc3ff
	ldda	[%i2+%o5]0x81,%l2	! %l2 = 00000000c9db3805 000000007d1c2527
!	Mem[0000000010001426] = 0d392c19, %l4 = 00000000ff000000
	ldsb	[%i0+0x026],%l4		! %l4 = 000000000000002c

p0_label_61:
!	Starting 10 instruction Store Burst
!	%l5 = 00000000387fe9d9, Mem[0000000010001408] = 27251cff7a091d4a
	stx	%l5,[%i0+%o4]		! Mem[0000000010001408] = 00000000387fe9d9
!	%l1 = 7d12d813ca4e6247, Mem[0000000030041400] = 3cb98a40
	stwa	%l1,[%i1+%g0]0x89	! Mem[0000000030041400] = ca4e6247
!	Mem[0000000010081410] = ffe7ffff, %l0 = 0000000000000000
	swapa	[%i2+%o5]0x88,%l0	! %l0 = 00000000ffe7ffff
!	%f28 = 00000000, Mem[0000000030081400] = 00000000
	sta	%f28,[%i2+%g0]0x81	! Mem[0000000030081400] = 00000000
!	Mem[0000000030081408] = 000000ff, %l0 = 00000000ffe7ffff
	ldstuba	[%i2+%o4]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030001400] = 3cb98a40, %l7 = 00000000000070ff
	ldstuba	[%i0+%g0]0x89,%l7	! %l7 = 0000000000000040
!	%l2 = 00000000c9db3805, Mem[0000000010101410] = 8e9033ff
	stwa	%l2,[%i4+%o5]0x88	! Mem[0000000010101410] = c9db3805
!	%l5 = 00000000387fe9d9, Mem[000000001000143a] = 387fe9d9
	stb	%l5,[%i0+0x03a]		! Mem[0000000010001438] = 387fd9d9
!	%f11 = 0e0715da, %f25 = 1c576869, %f25 = 1c576869
	fsubs	%f11,%f25,%f25		! %f25 = 9c576869
!	Mem[00000000211c0000] = 62124d40, %l3 = 000000007d1c2527
	ldsh	[%o2+%g0],%l3		! %l3 = 0000000000006212

p0_label_62:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = ffd1cf9e595d72f9, %l5 = 00000000387fe9d9
	ldxa	[%i0+%o5]0x80,%l5	! %l5 = ffd1cf9e595d72f9
!	Mem[00000000201c0001] = ffec56b0, %l0 = 00000000000000ff
	ldub	[%o0+0x001],%l0		! %l0 = 00000000000000ec
	membar	#Sync			! Added by membar checker (12)
!	Mem[0000000030181400] = 000000ff, %l4 = 000000000000002c
	lduwa	[%i6+%g0]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030041408] = c1bcec557014e739, %l3 = 0000000000006212
	ldxa	[%i1+%o4]0x89,%l3	! %l3 = c1bcec557014e739
!	Mem[0000000010181400] = ff000000000000ff, %f4  = ff000000 13fb39e7
	ldda	[%i6+%g0]0x80,%f4 	! %f4  = ff000000 000000ff
!	Mem[0000000010041408] = 00000000, %l0 = 00000000000000ec
	ldsha	[%i1+%o4]0x88,%l0	! %l0 = 0000000000000000
!	Mem[00000000100c1408] = b0000e30000000da, %l5 = ffd1cf9e595d72f9
	ldxa	[%i3+%o4]0x80,%l5	! %l5 = b0000e30000000da
!	Mem[0000000010001428] = 58b81826, %l4 = 00000000000000ff
	ldsb	[%i0+0x028],%l4		! %l4 = 0000000000000058
!	%l6 = 0000000000000000, Mem[0000000030081408] = ff000000
	stha	%l6,[%i2+%o4]0x81	! Mem[0000000030081408] = 00000000
!	Mem[0000000010141410] = 00000000, %l5 = b0000e30000000da
	ldsha	[%i5+%o5]0x80,%l5	! %l5 = 0000000000000000

p0_label_63:
!	Starting 10 instruction Store Burst
!	%l3 = c1bcec557014e739, Mem[0000000010001430] = 5781d11446ff0f29
	stx	%l3,[%i0+0x030]		! Mem[0000000010001430] = c1bcec557014e739
!	%l4 = 0000000000000058, Mem[0000000010181400] = 000000ff
	stba	%l4,[%i6+%g0]0x88	! Mem[0000000010181400] = 00000058
!	%l1 = 7d12d813ca4e6247, imm = ffffffffffffff55, %l1 = 7d12d813ca4e6247
	andn	%l1,-0x0ab,%l1		! %l1 = 0000000000000002
!	%l6 = 00000000, %l7 = 00000040, Mem[0000000010041400] = 0000dbca 00000000
	stda	%l6,[%i1+%g0]0x88	! Mem[0000000010041400] = 00000000 00000040
!	Mem[0000000010181400] = 58000000 000000ff 9e6cef83 5fff5edd
!	%f0  = ff000000 00000000 ffffffff 8e903312
!	%f4  = ff000000 000000ff 7f3f704a 9ecfd1ff
!	%f8  = 76aa6158 52d324ff 43d4a297 0e0715da
!	%f12 = 25a83dc4 faee457e 0745e81a 196cef83
	stda	%f0 ,[%i6+%g0]ASI_BLK_AIUP	! Block Store to 0000000010181400
!	%l5 = 0000000000000000, Mem[0000000030081408] = 00000000
	stwa	%l5,[%i2+%o4]0x81	! Mem[0000000030081408] = 00000000
!	%l4 = 0000000000000058, Mem[0000000030081400] = 00000000
	stha	%l4,[%i2+%g0]0x89	! Mem[0000000030081400] = 00000058
!	%f22 = 41c5c42a, Mem[0000000030141408] = 54983c02
	sta	%f22,[%i5+%o4]0x89	! Mem[0000000030141408] = 41c5c42a
!	%l0 = 0000000000000000, Mem[0000000030001400] = ff8ab93c00000000
	stxa	%l0,[%i0+%g0]0x81	! Mem[0000000030001400] = 0000000000000000
!	Mem[00000000100c1400] = ffffff8c 2fdadc21 b0000e30 000000da
!	%f16 = 408ab93c 00000000 39e71470 55ecbcc1
!	%f20 = 1233908e 00000000 41c5c42a 465c9153
!	%f24 = 528a5c38 9c576869 cadb0000 00000000
!	%f28 = 00000000 0e6afda5 00000000 595d72f9
	stda	%f16,[%i3+%g0]ASI_BLK_AIUP	! Block Store to 00000000100c1400

p0_label_64:
!	Starting 10 instruction Load Burst
!	Mem[000000001010141c] = 465c9153, %f7  = 9ecfd1ff
	ld	[%i4+0x01c],%f7 	! %f7 = 465c9153
	membar	#Sync			! Added by membar checker (13)
!	Mem[00000000100c1410] = 1233908e00000000, %f10 = 43d4a297 0e0715da
	ldda	[%i3+%o5]0x80,%f10	! %f10 = 1233908e 00000000
!	Mem[0000000010081400] = 7e45eefa, %l7 = 0000000000000040
	ldsba	[%i2+%g0]0x80,%l7	! %l7 = 000000000000007e
!	Mem[0000000030181400] = 000000ff, %l0 = 0000000000000000
	ldswa	[%i6+%g0]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[00000000211c0001] = 62124d40, %l0 = 00000000000000ff, %asi = 80
	ldsba	[%o2+0x001]%asi,%l0	! %l0 = 0000000000000012
!	Mem[0000000030001410] = ff0000ff4d0fc30d, %f18 = 39e71470 55ecbcc1
	ldda	[%i0+%o5]0x81,%f18	! %f18 = ff0000ff 4d0fc30d
!	Mem[00000000100c1400] = 000000003cb98a40, %l2 = 00000000c9db3805
	ldxa	[%i3+%g0]0x88,%l2	! %l2 = 000000003cb98a40
!	Mem[0000000010001428] = 58b818262ffee7df, %l2 = 000000003cb98a40, %asi = 80
	ldxa	[%i0+0x028]%asi,%l2	! %l2 = 58b818262ffee7df
!	Mem[00000000100c1410] = 1233908e, %l0 = 0000000000000012
	ldsba	[%i3+%o5]0x80,%l0	! %l0 = 0000000000000012
!	Mem[0000000010001408] = 00000000, %l2 = 58b818262ffee7df
	ldsw	[%i0+%o4],%l2		! %l2 = 0000000000000000

p0_label_65:
!	Starting 10 instruction Store Burst
!	%l1 = 0000000000000002, Mem[00000000300c1408] = 00000012
	stba	%l1,[%i3+%o4]0x81	! Mem[00000000300c1408] = 02000012
!	Mem[00000000100c1400] = 408ab93c, %l1 = 0000000000000002
	ldstuba	[%i3+%g0]0x80,%l1	! %l1 = 0000000000000040
!	%l0 = 0000000000000012, Mem[00000000100c1420] = 528a5c38
	sth	%l0,[%i3+0x020]		! Mem[00000000100c1420] = 00125c38
!	%l6 = 0000000000000000, Mem[0000000010001400] = ffcfd1ff, %asi = 80
	stha	%l6,[%i0+0x000]%asi	! Mem[0000000010001400] = 0000d1ff
!	Mem[00000000300c1410] = 00000000, %l2 = 0000000000000000
	swapa	[%i3+%o5]0x89,%l2	! %l2 = 0000000000000000
!	%l7 = 000000000000007e, Mem[0000000010001420] = 62a0a3a8
	stb	%l7,[%i0+0x020]		! Mem[0000000010001420] = 7ea0a3a8
!	Mem[0000000010141400] = 7d1c25ff, %l7 = 000000000000007e
	swapa	[%i5+%g0]0x88,%l7	! %l7 = 000000007d1c25ff
!	Mem[0000000030081400] = 58000000 0000001d 00000000 13fb39e7
!	%f0  = ff000000 00000000 ffffffff 8e903312
!	%f4  = ff000000 000000ff 7f3f704a 465c9153
!	%f8  = 76aa6158 52d324ff 1233908e 00000000
!	%f12 = 25a83dc4 faee457e 0745e81a 196cef83
	stda	%f0 ,[%i2+%g0]ASI_BLK_SL	! Block Store to 0000000030081400
!	%l5 = 0000000000000000, Mem[000000001018142c] = 0e0715da, %asi = 80
	stha	%l5,[%i6+0x02c]%asi	! Mem[000000001018142c] = 000015da
!	Mem[0000000030181400] = 000000ff, %l3 = c1bcec557014e739
	ldstuba	[%i6+%g0]0x89,%l3	! %l3 = 00000000000000ff

p0_label_66:
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = ffffffff, %l1 = 0000000000000040
	ldsba	[%i6+%o4]0x89,%l1	! %l1 = ffffffffffffffff
!	Mem[00000000100c1400] = 000000003cb98aff, %f20 = 1233908e 00000000
	ldda	[%i3+%g0]0x88,%f20	! %f20 = 00000000 3cb98aff
!	Mem[0000000030181400] = ff000000, %l7 = 000000007d1c25ff
	lduha	[%i6+%g0]0x81,%l7	! %l7 = 000000000000ff00
	membar	#Sync			! Added by membar checker (14)
!	Mem[0000000010081410] = 00000000, %l2 = 0000000000000000
	ldsba	[%i2+%o5]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000030041408] = 7014e739, %l3 = 00000000000000ff
	ldsha	[%i1+%o4]0x89,%l3	! %l3 = ffffffffffffe739
!	Mem[0000000030181410] = ff000000, %l6 = 0000000000000000
	ldsha	[%i6+%o5]0x81,%l6	! %l6 = ffffffffffffff00
!	Mem[0000000010101400] = 408ab93c, %f18 = ff0000ff
	lda	[%i4+%g0]0x80,%f18	! %f18 = 408ab93c
!	Mem[00000000300c1400] = 83ef6c19 00006267 02000012 58f4b677
!	Mem[00000000300c1410] = 00000000 595d72f9 48fbc6ea 3879d113
!	Mem[00000000300c1420] = 28c7c4f8 4886b629 7dd9eff6 0d783e6f
!	Mem[00000000300c1430] = 455ca907 c43da825 790b2e59 3c2f7a8b
	ldda	[%i3+%g0]ASI_BLK_SL,%f16	! Block Load from 00000000300c1400
!	Mem[0000000030181408] = ffffffff, %l7 = 000000000000ff00
	ldswa	[%i6+%o4]0x89,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010181408] = ffffffff, %l1 = ffffffffffffffff
	ldsba	[%i6+%o4]0x80,%l1	! %l1 = ffffffffffffffff

p0_label_67:
!	Starting 10 instruction Store Burst
!	%l0 = 00000012, %l1 = ffffffff, Mem[0000000010001408] = 00000000 387fe9d9
	stda	%l0,[%i0+%o4]0x80	! Mem[0000000010001408] = 00000012 ffffffff
!	Mem[00000000211c0000] = 62124d40, %l1 = ffffffffffffffff
	ldstuba	[%o2+0x000]%asi,%l1	! %l1 = 0000000000000062
!	Code Fragment 4, seed = 765982
p0_fragment_10:
!	%l0 = 0000000000000012
	setx	0x2b5d385d471a7536,%g7,%l0 ! %l0 = 2b5d385d471a7536
!	%l1 = 0000000000000062
	setx	0x7f8508bc85215c61,%g7,%l1 ! %l1 = 7f8508bc85215c61
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 2b5d385d471a7536
	setx	0x93b2ca551be3379c,%g7,%l0 ! %l0 = 93b2ca551be3379c
!	%l1 = 7f8508bc85215c61
	setx	0x54c73562808b09e7,%g7,%l1 ! %l1 = 54c73562808b09e7
p0_fragment_10_end:
!	Mem[0000000010181400] = 000000ff, %l4 = 0000000000000058
	swapa	[%i6+%g0]0x88,%l4	! %l4 = 00000000000000ff
!	%f30 = 8b7a2f3c 592e0b79, %l2 = 0000000000000000
!	Mem[0000000030041430] = 2e43aea40e6afda5
	add	%i1,0x030,%g1
	stda	%f30,[%g1+%l2]ASI_PST32_S ! Mem[0000000030041430] = 2e43aea40e6afda5
!	Mem[0000000010081400] = 7e45eefa 0c6867a1 ff33908e 3c3a1da7
!	%f16 = 67620000 196cef83 77b6f458 12000002
!	%f20 = f9725d59 00000000 13d17938 eac6fb48
!	%f24 = 29b68648 f8c4c728 6f3e780d f6efd97d
!	%f28 = 25a83dc4 07a95c45 8b7a2f3c 592e0b79
	stda	%f16,[%i2+%g0]ASI_COMMIT_P	! Block Store to 0000000010081400
!	%l2 = 00000000, %l3 = ffffe739, Mem[0000000030101408] = ffffffff 1233908e
	stda	%l2,[%i4+%o4]0x89	! Mem[0000000030101408] = 00000000 ffffe739
!	%l3 = ffffffffffffe739, Mem[0000000010141424] = 2b8c6e79, %asi = 80
	stha	%l3,[%i5+0x024]%asi	! Mem[0000000010141424] = e7396e79
!	%l2 = 0000000000000000, Mem[0000000010141408] = 262e44fd
	stha	%l2,[%i5+%o4]0x80	! Mem[0000000010141408] = 000044fd
!	Mem[00000000300c1408] = 02000012, %l6 = 00000000ffffff00
	swapa	[%i3+%o4]0x81,%l6	! %l6 = 0000000002000012

p0_label_68:
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = 83ef6c19, %l0 = 93b2ca551be3379c
	ldsha	[%i3+%g0]0x81,%l0	! %l0 = ffffffffffff83ef
!	Mem[0000000010181412] = ff000000, %l7 = ffffffffffffffff, %asi = 80
	lduha	[%i6+0x012]%asi,%l7	! %l7 = 0000000000000000
	membar	#Sync			! Added by membar checker (15)
!	Mem[0000000030041400] = 47624eca 00000000 39e71470 55ecbcc1
!	Mem[0000000030041410] = 1233908e 00000000 41c5c42a 465c9153
!	Mem[0000000030041420] = 528a5c38 1c576869 41737136 7569f2af
!	Mem[0000000030041430] = 2e43aea4 0e6afda5 54983c02 63e462cb
	ldda	[%i1+%g0]ASI_BLK_AIUS,%f0 	! Block Load from 0000000030041400
!	Mem[0000000010041408] = 00000000, %l3 = ffffffffffffe739
	ldsba	[%i1+%o4]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000010101400] = 3cb98a40, %f31 = 592e0b79
	lda	[%i4+%g0]0x88,%f31	! %f31 = 3cb98a40
!	Mem[0000000030001400] = 00000000, %l2 = 0000000000000000
	lduha	[%i0+%g0]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000010081410] = f9725d59, %l6 = 0000000002000012
	lduha	[%i2+%o5]0x80,%l6	! %l6 = 000000000000f972
!	Mem[0000000030001400] = 00000000, %l2 = 0000000000000000
	lduba	[%i0+%g0]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000010041408] = 00000000, %f25 = f8c4c728
	lda	[%i1+%o4]0x88,%f25	! %f25 = 00000000
!	Mem[0000000010181428] = 43d4a297, %l2 = 0000000000000000, %asi = 80
	lduha	[%i6+0x028]%asi,%l2	! %l2 = 00000000000043d4

p0_label_69:
!	Starting 10 instruction Store Burst
!	%f28 = 25a83dc4 07a95c45, Mem[0000000010041428] = 2ffee7df 2c9b9906, %asi = 80
	stda	%f28,[%i1+0x028]%asi	! Mem[0000000010041428] = 25a83dc4 07a95c45
!	%l4 = 00000000000000ff, Mem[0000000030101408] = 00000000
	stba	%l4,[%i4+%o4]0x89	! Mem[0000000030101408] = 000000ff
!	%l0 = ffffffffffff83ef, Mem[0000000010181410] = ff000000000000ff
	stxa	%l0,[%i6+%o5]0x88	! Mem[0000000010181410] = ffffffffffff83ef
!	%l3 = 0000000000000000, Mem[0000000030101410] = ff000000
	stwa	%l3,[%i4+%o5]0x81	! Mem[0000000030101410] = 00000000
!	Mem[00000000201c0000] = ffec56b0, %l7 = 0000000000000000
	ldstub	[%o0+%g0],%l7		! %l7 = 00000000000000ff
!	Code Fragment 3, seed = 880179
p0_fragment_11:
!	%l0 = ffffffffffff83ef
	setx	0x539e0e2a96efa98e,%g7,%l0 ! %l0 = 539e0e2a96efa98e
!	%l1 = 54c73562808b09e7
	setx	0xe4fbfb255c494139,%g7,%l1 ! %l1 = e4fbfb255c494139
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 539e0e2a96efa98e
	setx	0x803602935408e4f4,%g7,%l0 ! %l0 = 803602935408e4f4
!	%l1 = e4fbfb255c494139
	setx	0x44787fca734e17bf,%g7,%l1 ! %l1 = 44787fca734e17bf
p0_fragment_11_end:
!	Mem[000000001004141c] = 2d2fd3c7, %l7 = 000000ff, %l6 = 0000f972
	add	%i1,0x1c,%g1
	casa	[%g1]0x80,%l7,%l6	! %l6 = 000000002d2fd3c7
!	%l0 = 803602935408e4f4, Mem[0000000010141400] = 0000007e
	stba	%l0,[%i5+%g0]0x88	! Mem[0000000010141400] = 000000f4
!	Mem[00000000211c0000] = ff124d40, %l3 = 0000000000000000
	ldstuba	[%o2+0x000]%asi,%l3	! %l3 = 00000000000000ff
!	Mem[00000000100c142a] = cadb0000, %l0 = 803602935408e4f4
	ldstuba	[%i3+0x02a]%asi,%l0	! %l0 = 0000000000000000

p0_label_70:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = ef83ffff, %l4 = 00000000000000ff
	lduha	[%i6+%o5]0x80,%l4	! %l4 = 000000000000ef83
!	Mem[00000000100c1408] = 7014e739, %l5 = 0000000000000000
	ldswa	[%i3+%o4]0x88,%l5	! %l5 = 000000007014e739
!	Mem[0000000010001410] = f9725d599ecfd1ff, %l0 = 0000000000000000
	ldxa	[%i0+%o5]0x88,%l0	! %l0 = f9725d599ecfd1ff
!	Mem[0000000010081408] = 77b6f458 12000002, %l2 = 000043d4, %l3 = 000000ff, %asi = 80
	ldda	[%i2+0x008]%asi,%l2	! %l2 = 0000000077b6f458 0000000012000002
!	Mem[0000000020800040] = ff5f7f10, %l1 = 44787fca734e17bf
	ldub	[%o1+0x040],%l1		! %l1 = 00000000000000ff
!	Mem[0000000030081400] = 00000000, %l4 = 000000000000ef83
	ldsha	[%i2+%g0]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000010041428] = 25a83dc4, %l7 = 00000000000000ff, %asi = 80
	lduwa	[%i1+0x028]%asi,%l7	! %l7 = 0000000025a83dc4
!	%l6 = 000000002d2fd3c7, immd = fffffffffffffdf6, %l108 = 0000000000000007
	sdivx	%l6,-0x20a,%l7		! %l7 = ffffffffffe9d6e4
!	Mem[0000000010141408] = fd440000, %l7 = ffffffffffe9d6e4
	lduba	[%i5+%o4]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000010181400] = 00000058, %l5 = 000000007014e739
	lduha	[%i6+%g0]0x88,%l5	! %l5 = 0000000000000058

p0_label_71:
!	Starting 10 instruction Store Burst
!	%l5 = 0000000000000058, Mem[00000000211c0000] = ff124d40, %asi = 80
	stba	%l5,[%o2+0x000]%asi	! Mem[00000000211c0000] = 58124d40
!	%l0 = 9ecfd1ff, %l1 = 000000ff, Mem[0000000010141410] = 00000000 00000012
	stda	%l0,[%i5+%o5]0x80	! Mem[0000000010141410] = 9ecfd1ff 000000ff
!	Mem[0000000010001430] = c1bcec557014e739, %l3 = 0000000012000002, %l1 = 00000000000000ff
	add	%i0,0x30,%g1
	casxa	[%g1]0x80,%l3,%l1	! %l1 = c1bcec557014e739
!	%l5 = 0000000000000058, Mem[00000000100c1400] = ff8ab93c
	stha	%l5,[%i3+%g0]0x80	! Mem[00000000100c1400] = 0058b93c
!	%l2 = 0000000077b6f458, imm = fffffffffffff00c, %l2 = 0000000077b6f458
	and	%l2,-0xff4,%l2		! %l2 = 0000000077b6f008
!	Mem[0000000030181410] = 000000ff, %l2 = 0000000077b6f008
	ldstuba	[%i6+%o5]0x89,%l2	! %l2 = 00000000000000ff
!	%l1 = c1bcec557014e739, Mem[0000000021800100] = 5c539830, %asi = 80
	stha	%l1,[%o3+0x100]%asi	! Mem[0000000021800100] = e7399830
!	Mem[0000000030101410] = 00000000, %l2 = 00000000000000ff
	ldstuba	[%i4+%o5]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000030181410] = ff000000, %l5 = 0000000000000058
	swapa	[%i6+%o5]0x81,%l5	! %l5 = 00000000ff000000
!	%l5 = 00000000ff000000, Mem[0000000010081400] = 67620000
	stba	%l5,[%i2+%g0]0x80	! Mem[0000000010081400] = 00620000

p0_label_72:
!	Starting 10 instruction Load Burst
!	Mem[000000001004141c] = 2d2fd3c7, %l0 = f9725d599ecfd1ff
	ldsw	[%i1+0x01c],%l0		! %l0 = 000000002d2fd3c7
!	Mem[0000000010101408] = fffcc3ff, %l2 = 0000000000000000
	lduba	[%i4+%o4]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[000000001018140a] = ffffffff, %l3 = 0000000012000002, %asi = 80
	ldsba	[%i6+0x00a]%asi,%l3	! %l3 = ffffffffffffffff
!	Mem[00000000300c1410] = 00000000, %l1 = c1bcec557014e739
	ldsha	[%i3+%o5]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000030141410] = 2fdadc21ffffff1d, %l7 = 0000000000000000
	ldxa	[%i5+%o5]0x89,%l7	! %l7 = 2fdadc21ffffff1d
!	Mem[0000000010041420] = 7bd47808, %f25 = 00000000
	ld	[%i1+0x020],%f25	! %f25 = 7bd47808
!	Mem[0000000010101420] = 528a5c38, %f4  = 1233908e
	lda	[%i4+0x020]%asi,%f4 	! %f4 = 528a5c38
!	Mem[0000000010181410] = ef83ffffffffffff, %f6  = 41c5c42a 465c9153
	ldda	[%i6+%o5]0x80,%f6 	! %f6  = ef83ffff ffffffff
!	Mem[0000000030101410] = 000000ff, %f4  = 528a5c38
	lda	[%i4+%o5]0x89,%f4 	! %f4 = 000000ff
!	Mem[0000000021800181] = 70ff8090, %l3 = ffffffffffffffff
	ldub	[%o3+0x181],%l3		! %l3 = 00000000000000ff

p0_label_73:
!	Starting 10 instruction Store Burst
!	%f0  = 47624eca, Mem[00000000100c1410] = 8e903312
	sta	%f0 ,[%i3+%o5]0x88	! Mem[00000000100c1410] = 47624eca
!	%l6 = 000000002d2fd3c7, imm = fffffffffffff6a1, %l6 = 000000002d2fd3c7
	or	%l6,-0x95f,%l6		! %l6 = fffffffffffff7e7
!	Mem[0000000010101408] = fffcc3ff, %l6 = fffffffffffff7e7
	ldstuba	[%i4+%o4]0x88,%l6	! %l6 = 00000000000000ff
!	%f26 = 6f3e780d f6efd97d, %l0 = 000000002d2fd3c7
!	Mem[0000000010001430] = c1bcec557014e739
	add	%i0,0x030,%g1
	stda	%f26,[%g1+%l0]ASI_PST32_PL ! Mem[0000000010001430] = 7dd9eff60d783e6f
!	Mem[0000000010181409] = ffffffff, %l1 = 0000000000000000
	ldstub	[%i6+0x009],%l1		! %l1 = 00000000000000ff
!	%l2 = 000000ff, %l3 = 000000ff, Mem[0000000010141410] = 9ecfd1ff 000000ff
	stda	%l2,[%i5+%o5]0x80	! Mem[0000000010141410] = 000000ff 000000ff
!	%l3 = 00000000000000ff, Mem[0000000010141410] = ff000000ff000000
	stxa	%l3,[%i5+%o5]0x88	! Mem[0000000010141410] = 00000000000000ff
!	%l3 = 00000000000000ff, Mem[0000000010101428] = ffffb0000524d352
	stx	%l3,[%i4+0x028]		! Mem[0000000010101428] = 00000000000000ff
!	Mem[0000000010001400] = 0000d1ff 8e903312 00000012 ffffffff
!	%f0  = 47624eca 00000000 39e71470 55ecbcc1
!	%f4  = 000000ff 00000000 ef83ffff ffffffff
!	%f8  = 528a5c38 1c576869 41737136 7569f2af
!	%f12 = 2e43aea4 0e6afda5 54983c02 63e462cb
	stda	%f0 ,[%i0+%g0]ASI_COMMIT_P	! Block Store to 0000000010001400
!	Mem[0000000010081400] = 00620000, %l5 = 00000000ff000000, %asi = 80
	swapa	[%i2+0x000]%asi,%l5	! %l5 = 0000000000620000

p0_label_74:
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = 196cef83, %l0 = 000000002d2fd3c7
	lduwa	[%i3+%g0]0x89,%l0	! %l0 = 00000000196cef83
!	Mem[0000000030041400] = ca4e6247, %l3 = 00000000000000ff
	lduha	[%i1+%g0]0x89,%l3	! %l3 = 0000000000006247
!	%f1  = 00000000, %f0  = 47624eca, %f18 = 77b6f458 12000002
	fsmuld	%f1 ,%f0 ,%f18		! %f18 = 00000000 00000000
!	Mem[0000000030141410] = ffffff1d, %l1 = 00000000000000ff
	ldsha	[%i5+%o5]0x89,%l1	! %l1 = ffffffffffffff1d
!	Mem[0000000030001400] = 00000000, %l4 = 0000000000000000
	lduha	[%i0+%g0]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000010141410] = ff000000, %l6 = 00000000000000ff
	lduha	[%i5+%o5]0x80,%l6	! %l6 = 000000000000ff00
	membar	#Sync			! Added by membar checker (16)
!	Mem[0000000010001408] = 39e71470, %l6 = 000000000000ff00
	lduwa	[%i0+%o4]0x80,%l6	! %l6 = 0000000039e71470
!	Mem[00000000211c0000] = 58124d40, %l2 = 00000000000000ff, %asi = 80
	ldsba	[%o2+0x000]%asi,%l2	! %l2 = 0000000000000058
!	Mem[000000001014143a] = 278d28d2, %l1 = ffffffffffffff1d, %asi = 80
	ldsba	[%i5+0x03a]%asi,%l1	! %l1 = 0000000000000028
!	Mem[0000000030101400] = ff000000, %l2 = 0000000000000058
	lduba	[%i4+%g0]0x81,%l2	! %l2 = 00000000000000ff

p0_label_75:
!	Starting 10 instruction Store Burst
!	%l7 = 2fdadc21ffffff1d, Mem[00000000100c1408] = 39e71470
	stwa	%l7,[%i3+%o4]0x80	! Mem[00000000100c1408] = ffffff1d
!	%f10 = 41737136 7569f2af, %l0 = 00000000196cef83
!	Mem[00000000300c1410] = 00000000595d72f9
	add	%i3,0x010,%g1
	stda	%f10,[%g1+%l0]ASI_PST8_SL ! Mem[00000000300c1410] = aff20000595d7241
!	Mem[0000000010141410] = 000000ff, %l2 = 00000000000000ff
	swapa	[%i5+%o5]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[00000000100c1400] = 0058b93c, %l5 = 0000000000620000
	ldstuba	[%i3+%g0]0x80,%l5	! %l5 = 0000000000000000
!	%l5 = 0000000000000000, imm = 000000000000038f, %l4 = 0000000000000000
	xnor	%l5,0x38f,%l4		! %l4 = fffffffffffffc70
!	Mem[0000000030181410] = 58000000, %l6 = 0000000039e71470
	lduba	[%i6+%o5]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000010001410] = ff000000, %l2 = 00000000000000ff
	ldstuba	[%i0+%o5]0x88,%l2	! %l2 = 0000000000000000
!	%l6 = 0000000000000000, Mem[0000000010041400] = 00000000
	stha	%l6,[%i1+%g0]0x80	! Mem[0000000010041400] = 00000000
!	%f4  = 000000ff, Mem[0000000010081434] = 07a95c45
	sta	%f4 ,[%i2+0x034]%asi	! Mem[0000000010081434] = 000000ff
!	%f21 = 00000000, Mem[0000000010041410] = 37000000
	sta	%f21,[%i1+%o5]0x80	! Mem[0000000010041410] = 00000000

p0_label_76:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1430] = 00000000, %l0 = 00000000196cef83
	ldsw	[%i3+0x030],%l0		! %l0 = 0000000000000000
!	Mem[0000000030181408] = ffffffff, %l0 = 0000000000000000
	ldsba	[%i6+%o4]0x81,%l0	! %l0 = ffffffffffffffff
!	%f10 = 41737136, %f30 = 8b7a2f3c, %f6  = ef83ffff
	fsubs	%f10,%f30,%f6 		! %f6  = 41737136
!	Mem[0000000030101408] = ffffe739000000ff, %f6  = 41737136 ffffffff
	ldda	[%i4+%o4]0x89,%f6 	! %f6  = ffffe739 000000ff
!	Mem[0000000030041410] = 000000008e903312, %l3 = 0000000000006247
	ldxa	[%i1+%o5]0x89,%l3	! %l3 = 000000008e903312
!	Mem[0000000010141400] = f4000000, %l2 = 0000000000000000
	lduba	[%i5+%g0]0x80,%l2	! %l2 = 00000000000000f4
!	Mem[0000000030041400] = ca4e6247, %f19 = 00000000
	lda	[%i1+%g0]0x89,%f19	! %f19 = ca4e6247
!	Mem[0000000010181400] = 00000058, %l1 = 0000000000000028
	ldsha	[%i6+%g0]0x88,%l1	! %l1 = 0000000000000058
!	Mem[0000000030141410] = ffffff1d, %l2 = 00000000000000f4
	ldsha	[%i5+%o5]0x89,%l2	! %l2 = ffffffffffffff1d
!	Code Fragment 4, seed = 892803
p0_fragment_12:
!	%l0 = ffffffffffffffff
	setx	0x06061a523a706f0e,%g7,%l0 ! %l0 = 06061a523a706f0e
!	%l1 = 0000000000000058
	setx	0x34f722224b7d0eb9,%g7,%l1 ! %l1 = 34f722224b7d0eb9
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 06061a523a706f0e
	setx	0xcb91ef1403213a74,%g7,%l0 ! %l0 = cb91ef1403213a74
!	%l1 = 34f722224b7d0eb9
	setx	0xd0eb556c1dc4753f,%g7,%l1 ! %l1 = d0eb556c1dc4753f
p0_fragment_12_end:

p0_label_77:
!	Starting 10 instruction Store Burst
!	%l6 = 0000000000000000, Mem[0000000010041408] = 00000000
	stba	%l6,[%i1+%o4]0x88	! Mem[0000000010041408] = 00000000
!	Mem[0000000030101400] = 000000ff, %l4 = fffffffffffffc70
	ldstuba	[%i4+%g0]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010181408] = ffffffff, %l0 = 0000000003213a74
	swapa	[%i6+%o4]0x80,%l0	! %l0 = 00000000ffffffff
!	%f6  = ffffe739 000000ff, Mem[0000000010081408] = 58f4b677 02000012
	stda	%f6 ,[%i2+%o4]0x88	! Mem[0000000010081408] = ffffe739 000000ff
!	%l3 = 000000008e903312, Mem[0000000030041408] = 7014e739
	stba	%l3,[%i1+%o4]0x89	! Mem[0000000030041408] = 7014e712
!	Mem[0000000030181400] = ff000000, %l6 = 0000000000000000
	swapa	[%i6+%g0]0x81,%l6	! %l6 = 00000000ff000000
!	%l4 = 000000ff, %l5 = 00000000, Mem[0000000010141410] = 000000ff 00000000
	stda	%l4,[%i5+%o5]0x88	! Mem[0000000010141410] = 000000ff 00000000
!	%l5 = 0000000000000000, Mem[000000001004142b] = 25a83dc4, %asi = 80
	stba	%l5,[%i1+0x02b]%asi	! Mem[0000000010041428] = 25a83d00
!	%l0 = ffffffff, %l1 = 1dc4753f, Mem[0000000030101410] = ff000000 3cb99773
	stda	%l0,[%i4+%o5]0x81	! Mem[0000000030101410] = ffffffff 1dc4753f
!	Mem[0000000010041400] = 00000000, %l5 = 0000000000000000
	swapa	[%i1+%g0]0x80,%l5	! %l5 = 0000000000000000

p0_label_78:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c140f] = 55ecbcc1, %l5 = 0000000000000000, %asi = 80
	ldsba	[%i3+0x00f]%asi,%l5	! %l5 = ffffffffffffffc1
!	Mem[0000000010001408] = 39e71470, %l4 = 00000000000000ff, %asi = 80
	lduha	[%i0+0x008]%asi,%l4	! %l4 = 00000000000039e7
!	Mem[00000000300c1410] = 0000f2af, %l2 = ffffffffffffff1d
	ldsba	[%i3+%o5]0x89,%l2	! %l2 = ffffffffffffffaf
!	Mem[00000000100c1408] = 1dffffff, %l7 = 2fdadc21ffffff1d
	ldsba	[%i3+%o4]0x88,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000030001400] = 00000000, %l1 = d0eb556c1dc4753f
	lduwa	[%i0+%g0]0x81,%l1	! %l1 = 0000000000000000
!	Mem[00000000211c0000] = 58124d40, %l7 = ffffffffffffffff, %asi = 80
	ldsha	[%o2+0x000]%asi,%l7	! %l7 = 0000000000005812
!	Mem[0000000010041400] = 0000000040000000, %l2 = ffffffffffffffaf
	ldxa	[%i1+%g0]0x80,%l2	! %l2 = 0000000040000000
!	Mem[0000000010141400] = f40000000538dbc9, %l1 = 0000000000000000
	ldxa	[%i5+%g0]0x80,%l1	! %l1 = f40000000538dbc9
!	%f27 = f6efd97d, %f27 = f6efd97d
	fcmpes	%fcc2,%f27,%f27		! %fcc2 = 0
!	Mem[0000000010001410] = ff0000ff, %l2 = 0000000040000000
	ldsba	[%i0+%o5]0x80,%l2	! %l2 = ffffffffffffffff

p0_label_79:
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1400] = 83ef6c19 00006267 ffffff00 58f4b677
!	%f16 = 67620000 196cef83 00000000 ca4e6247
!	%f20 = f9725d59 00000000 13d17938 eac6fb48
!	%f24 = 29b68648 7bd47808 6f3e780d f6efd97d
!	%f28 = 25a83dc4 07a95c45 8b7a2f3c 3cb98a40
	stda	%f16,[%i3+%g0]ASI_BLK_S	! Block Store to 00000000300c1400
!	Mem[0000000030041408] = 12e71470, %l3 = 000000008e903312
	ldstuba	[%i1+%o4]0x81,%l3	! %l3 = 0000000000000012
!	%f30 = 8b7a2f3c 3cb98a40, %l3 = 0000000000000012
!	Mem[0000000030181430] = 25a83dc4faee457e
	add	%i6,0x030,%g1
	stda	%f30,[%g1+%l3]ASI_PST32_S ! Mem[0000000030181430] = 8b7a2f3cfaee457e
!	Mem[0000000010001434] = 0e6afda5, %l2 = 00000000ffffffff, %asi = 80
	swapa	[%i0+0x034]%asi,%l2	! %l2 = 000000000e6afda5
!	%f27 = f6efd97d, Mem[0000000010001430] = 2e43aea4
	sta	%f27,[%i0+0x030]%asi	! Mem[0000000010001430] = f6efd97d
!	Mem[0000000010141400] = f4000000, %l2 = 000000000e6afda5
	ldstuba	[%i5+%g0]0x80,%l2	! %l2 = 00000000000000f4
!	%f14 = 54983c02, Mem[0000000010141408] = 000044fd
	sta	%f14,[%i5+%o4]0x80	! Mem[0000000010141408] = 54983c02
!	%l4 = 00000000000039e7, Mem[0000000010141410] = 00000000000000ff
	stxa	%l4,[%i5+%o5]0x88	! Mem[0000000010141410] = 00000000000039e7
!	%f8  = 528a5c38, %f18 = 00000000, %f3  = 55ecbcc1
	fadds	%f8 ,%f18,%f3 		! %f3  = 528a5c38
!	%l3 = 0000000000000012, Mem[0000000030081410] = 000000ff
	stwa	%l3,[%i2+%o5]0x89	! Mem[0000000030081410] = 00000012

p0_label_80:
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = c1bcec55 7014e7ff, %l6 = ff000000, %l7 = 00005812
	ldda	[%i1+%o4]0x89,%l6	! %l6 = 000000007014e7ff 00000000c1bcec55
!	%l0 = 00000000ffffffff, %l6 = 000000007014e7ff, %l2 = 00000000000000f4
	xnor	%l0,%l6,%l2		! %l2 = ffffffff7014e7ff
!	Mem[0000000030001410] = ff0000ff4d0fc30d, %l4 = 00000000000039e7
	ldxa	[%i0+%o5]0x81,%l4	! %l4 = ff0000ff4d0fc30d
!	Mem[0000000010041408] = 00000000, %l0 = 00000000ffffffff
	ldswa	[%i1+%o4]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000010081410] = f9725d59, %l2 = ffffffff7014e7ff
	ldsba	[%i2+%o5]0x80,%l2	! %l2 = fffffffffffffff9
!	%f16 = 67620000, %f0  = 47624eca
	fcmps	%fcc3,%f16,%f0 		! %fcc3 = 2
!	Mem[0000000030081410] = 12000000, %l4 = ff0000ff4d0fc30d
	ldswa	[%i2+%o5]0x81,%l4	! %l4 = 0000000012000000
	membar	#Sync			! Added by membar checker (17)
!	Mem[00000000300c1408] = 00000000, %f7  = 000000ff
	lda	[%i3+%o4]0x89,%f7 	! %f7 = 00000000
!	Mem[0000000020800000] = ffd72ce0, %l7 = 00000000c1bcec55
	ldsh	[%o1+%g0],%l7		! %l7 = ffffffffffffffd7
!	Mem[00000000300c1400] = 67620000 196cef83, %l6 = 7014e7ff, %l7 = ffffffd7
	ldda	[%i3+%g0]0x81,%l6	! %l6 = 0000000067620000 00000000196cef83

p0_label_81:
!	Starting 10 instruction Store Burst
!	%l0 = 0000000000000000, Mem[0000000030141400] = c7d32f2d592e0b3a
	stxa	%l0,[%i5+%g0]0x89	! Mem[0000000030141400] = 0000000000000000
!	%l6 = 0000000067620000, Mem[00000000300c1410] = f9725d5900000000
	stxa	%l6,[%i3+%o5]0x81	! Mem[00000000300c1410] = 0000000067620000
!	%l4 = 0000000012000000, Mem[00000000201c0000] = ffec56b0
	stb	%l4,[%o0+%g0]		! Mem[00000000201c0000] = 00ec56b0
!	%l7 = 00000000196cef83, Mem[0000000030141408] = 2ac4c5412d2fd3c7
	stxa	%l7,[%i5+%o4]0x81	! Mem[0000000030141408] = 00000000196cef83
!	%f28 = 25a83dc4 07a95c45, Mem[0000000030001410] = ff0000ff 0dc30f4d
	stda	%f28,[%i0+%o5]0x89	! Mem[0000000030001410] = 25a83dc4 07a95c45
!	%l4 = 12000000, %l5 = ffffffc1, Mem[0000000010181410] = ef83ffff ffffffff
	stda	%l4,[%i6+%o5]0x80	! Mem[0000000010181410] = 12000000 ffffffc1
!	%l7 = 00000000196cef83, Mem[0000000030081408] = 8e903312
	stwa	%l7,[%i2+%o4]0x89	! Mem[0000000030081408] = 196cef83
!	%l2 = fffffffffffffff9, Mem[0000000030081410] = 12000000000000ff
	stxa	%l2,[%i2+%o5]0x81	! Mem[0000000030081410] = fffffffffffffff9
!	%l0 = 00000000, %l1 = 0538dbc9, Mem[0000000030141410] = 1dffffff 21dcda2f
	stda	%l0,[%i5+%o5]0x81	! Mem[0000000030141410] = 00000000 0538dbc9
!	%l2 = fffffffffffffff9, Mem[0000000030001400] = 00000000
	stha	%l2,[%i0+%g0]0x89	! Mem[0000000030001400] = 0000fff9

p0_label_82:
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = ffffffff, %l2 = fffffffffffffff9
	lduwa	[%i6+%o4]0x81,%l2	! %l2 = 00000000ffffffff
!	Mem[0000000010141429] = 27251c7d, %l1 = f40000000538dbc9, %asi = 80
	lduba	[%i5+0x029]%asi,%l1	! %l1 = 0000000000000025
!	Mem[0000000010101400] = 3cb98a40, %l6 = 0000000067620000
	lduwa	[%i4+%g0]0x88,%l6	! %l6 = 000000003cb98a40
!	Mem[0000000010001433] = f6efd97d, %l0 = 0000000000000000
	ldub	[%i0+0x033],%l0		! %l0 = 000000000000007d
!	Mem[0000000030001410] = 07a95c45, %l7 = 00000000196cef83
	lduha	[%i0+%o5]0x89,%l7	! %l7 = 0000000000005c45
!	Mem[0000000030181400] = 0000000000000000, %f6  = ffffe739 00000000
	ldda	[%i6+%g0]0x81,%f6 	! %f6  = 00000000 00000000
!	Mem[0000000030101408] = 000000ff, %f8  = 528a5c38
	lda	[%i4+%o4]0x89,%f8 	! %f8 = 000000ff
!	Mem[0000000010001408] = c1bcec55 7014e739, %l0 = 0000007d, %l1 = 00000025
	ldda	[%i0+%o4]0x88,%l0	! %l0 = 000000007014e739 00000000c1bcec55
!	Mem[00000000300c1408] = 00000000, %l0 = 000000007014e739
	ldswa	[%i3+%o4]0x89,%l0	! %l0 = 0000000000000000
!	%l5 = ffffffffffffffc1, imm = fffffffffffff2c4, %l1 = 00000000c1bcec55
	and	%l5,-0xd3c,%l1		! %l1 = fffffffffffff2c0

p0_label_83:
!	Starting 10 instruction Store Burst
!	Mem[0000000030141408] = 00000000, %l4 = 0000000012000000
	ldstuba	[%i5+%o4]0x81,%l4	! %l4 = 0000000000000000
!	%l6 = 3cb98a40, %l7 = 00005c45, Mem[0000000010041408] = 00000000 00000000, %asi = 80
	stda	%l6,[%i1+0x008]%asi	! Mem[0000000010041408] = 3cb98a40 00005c45
!	%l4 = 0000000000000000, Mem[0000000010001408] = 7014e739
	stha	%l4,[%i0+%o4]0x88	! Mem[0000000010001408] = 70140000
!	%l4 = 0000000000000000, Mem[0000000030001410] = 455ca907
	stba	%l4,[%i0+%o5]0x81	! Mem[0000000030001410] = 005ca907
!	%l4 = 00000000, %l5 = ffffffc1, Mem[0000000030081408] = 196cef83 ffffffff
	stda	%l4,[%i2+%o4]0x89	! Mem[0000000030081408] = 00000000 ffffffc1
!	Mem[0000000010001400] = 47624eca, %l0 = 0000000000000000
	swapa	[%i0+%g0]0x80,%l0	! %l0 = 0000000047624eca
!	%f3  = 528a5c38, Mem[0000000030001408] = 2b8c0000
	sta	%f3 ,[%i0+%o4]0x81	! Mem[0000000030001408] = 528a5c38
!	%l3 = 0000000000000012, Mem[0000000030101400] = ff000000
	stha	%l3,[%i4+%g0]0x81	! Mem[0000000030101400] = 00120000
!	Mem[0000000010181410] = 12000000, %l5 = 00000000ffffffc1
	swapa	[%i6+%o5]0x80,%l5	! %l5 = 0000000012000000
!	%l1 = fffffffffffff2c0, %l2 = 00000000ffffffff, %l0 = 0000000047624eca
	add	%l1,%l2,%l0		! %l0 = 00000000fffff2bf

p0_label_84:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = ffc3fcff54983c02, %f20 = f9725d59 00000000
	ldda	[%i4+%o4]0x80,%f20	! %f20 = ffc3fcff 54983c02
!	Mem[0000000010141400] = c9db3805000000ff, %f18 = 00000000 ca4e6247
	ldda	[%i5+%g0]0x88,%f18	! %f18 = c9db3805 000000ff
!	Mem[0000000010101410] = 0538dbc9, %l5 = 0000000012000000
	lduba	[%i4+%o5]0x80,%l5	! %l5 = 0000000000000005
!	Mem[0000000010081400] = ff000000, %l1 = fffffffffffff2c0
	lduwa	[%i2+%g0]0x80,%l1	! %l1 = 00000000ff000000
!	Mem[0000000030101400] = 00120000, %l0 = 00000000fffff2bf
	ldsha	[%i4+%g0]0x81,%l0	! %l0 = 0000000000000012
!	Mem[0000000010081400] = ff000000, %f7  = 00000000
	lda	[%i2+%g0]0x80,%f7 	! %f7 = ff000000
!	Mem[0000000010141410] = e7390000, %l5 = 0000000000000005, %asi = 80
	lduha	[%i5+0x010]%asi,%l5	! %l5 = 000000000000e739
!	Mem[00000000211c0000] = 58124d40, %l5 = 000000000000e739, %asi = 80
	ldsha	[%o2+0x000]%asi,%l5	! %l5 = 0000000000005812
!	Mem[0000000030181400] = 00000000, %l7 = 0000000000005c45
	lduba	[%i6+%g0]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000010041418] = 4a1d097a2d2fd3c7, %l3 = 0000000000000012, %asi = 80
	ldxa	[%i1+0x018]%asi,%l3	! %l3 = 4a1d097a2d2fd3c7

p0_label_85:
!	Starting 10 instruction Store Burst
!	%l3 = 4a1d097a2d2fd3c7, Mem[0000000010041410] = 0000000030b32343
	stxa	%l3,[%i1+%o5]0x80	! Mem[0000000010041410] = 4a1d097a2d2fd3c7
!	%f20 = ffc3fcff, %f3  = 528a5c38, %f29 = 07a95c45
	fmuls	%f20,%f3 ,%f29		! %f29 = ffc3fcff
!	%l2 = 00000000ffffffff, Mem[0000000010101410] = c9db3805
	stba	%l2,[%i4+%o5]0x88	! Mem[0000000010101410] = c9db38ff
!	%f16 = 67620000, Mem[0000000010001408] = 70140000
	sta	%f16,[%i0+%o4]0x88	! Mem[0000000010001408] = 67620000
!	Mem[0000000030141410] = 00000000, %l0 = 0000000000000012
	swapa	[%i5+%o5]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000030001410] = 07a95c00, %l7 = 0000000000000000
	swapa	[%i0+%o5]0x89,%l7	! %l7 = 0000000007a95c00
!	%l0 = 0000000000000000, Mem[0000000010001430] = f6efd97dffffffff
	stx	%l0,[%i0+0x030]		! Mem[0000000010001430] = 0000000000000000
!	%l3 = 4a1d097a2d2fd3c7, immd = fffffffffffff367, %l108 = 0000000000000002
	udivx	%l3,-0xc99,%l2		! %l2 = 0000000000000000
!	Mem[0000000030041408] = ffe71470, %l0 = 0000000000000000
	ldstuba	[%i1+%o4]0x81,%l0	! %l0 = 00000000000000ff
!	%l3 = 4a1d097a2d2fd3c7, Mem[0000000030181400] = 00000000
	stwa	%l3,[%i6+%g0]0x81	! Mem[0000000030181400] = 2d2fd3c7

p0_label_86:
!	Starting 10 instruction Load Burst
!	Mem[0000000030101410] = ffffffff, %l4 = 0000000000000000
	ldsba	[%i4+%o5]0x89,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010001408] = c1bcec5567620000, %l6 = 000000003cb98a40
	ldxa	[%i0+%o4]0x88,%l6	! %l6 = c1bcec5567620000
!	Mem[00000000201c0000] = 00ec56b0, %l5 = 0000000000005812, %asi = 80
	ldsba	[%o0+0x000]%asi,%l5	! %l5 = 0000000000000000
!	Mem[0000000030041408] = ffe71470, %l7 = 0000000007a95c00
	ldswa	[%i1+%o4]0x81,%l7	! %l7 = ffffffffffe71470
!	Mem[0000000030141410] = 12000000, %l3 = 4a1d097a2d2fd3c7
	lduha	[%i5+%o5]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000010101400] = 408ab93c, %f7  = ff000000
	lda	[%i4+%g0]0x80,%f7 	! %f7 = 408ab93c
!	Mem[00000000100c1404] = 00000000, %f31 = 3cb98a40
	lda	[%i3+0x004]%asi,%f31	! %f31 = 00000000
!	Mem[0000000010181400] = 58000000, %f0  = 47624eca
	lda	[%i6+%g0]0x80,%f0 	! %f0 = 58000000
!	Mem[00000000211c0000] = 58124d40, %l4 = ffffffffffffffff, %asi = 80
	ldsha	[%o2+0x000]%asi,%l4	! %l4 = 0000000000005812
!	Mem[0000000010181418] = 7f3f704a9ecfd1ff, %f18 = c9db3805 000000ff, %asi = 80
	ldda	[%i6+0x018]%asi,%f18	! %f18 = 7f3f704a 9ecfd1ff

p0_label_87:
!	Starting 10 instruction Store Burst
!	Mem[0000000010101400] = 3cb98a40, %l6 = c1bcec5567620000
	ldstuba	[%i4+%g0]0x88,%l6	! %l6 = 0000000000000040
!	%l5 = 0000000000000000, Mem[00000000300c1400] = 67620000
	stha	%l5,[%i3+%g0]0x81	! Mem[00000000300c1400] = 00000000
!	%l0 = 000000ff, %l1 = ff000000, Mem[00000000100c1400] = ff58b93c 00000000
	stda	%l0,[%i3+%g0]0x80	! Mem[00000000100c1400] = 000000ff ff000000
!	%f4  = 000000ff, %f25 = 7bd47808, %f29 = ffc3fcff
	fadds	%f4 ,%f25,%f29		! tt=0x22, %l0 = 0000000000000121
!	%f29 = ffc3fcff, Mem[0000000010041410] = 4a1d097a
	sta	%f29,[%i1+%o5]0x80	! Mem[0000000010041410] = ffc3fcff
!	Mem[0000000030181410] = 00000058, %l5 = 0000000000000000
	ldstuba	[%i6+%o5]0x81,%l5	! %l5 = 0000000000000000
!	%f20 = ffc3fcff 54983c02, %l2 = 0000000000000000
!	Mem[0000000030081428] = 000000008e903312
	add	%i2,0x028,%g1
	stda	%f20,[%g1+%l2]ASI_PST16_SL ! Mem[0000000030081428] = 000000008e903312
!	%l7 = ffffffffffe71470, Mem[0000000030041410] = 8e903312
	stwa	%l7,[%i1+%o5]0x89	! Mem[0000000030041410] = ffe71470
!	Mem[00000000100c1404] = ff000000, %l0 = 0000000000000121, %asi = 80
	swapa	[%i3+0x004]%asi,%l0	! %l0 = 00000000ff000000
!	%l6 = 0000000000000040, Mem[0000000010041410] = ffc3fcff
	stha	%l6,[%i1+%o5]0x80	! Mem[0000000010041410] = 0040fcff

p0_label_88:
!	Starting 10 instruction Load Burst
!	Mem[000000001000142c] = 7569f2af, %f0  = 58000000
	ld	[%i0+0x02c],%f0 	! %f0 = 7569f2af
!	Mem[0000000010041428] = 25a83d0007a95c45, %f24 = 29b68648 7bd47808
	ldd	[%i1+0x028],%f24	! %f24 = 25a83d00 07a95c45
!	Mem[0000000010001400] = 0000000000000000, %l5 = 0000000000000000
	ldxa	[%i0+%g0]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000030181410] = ff00005813fb39e7, %l1 = 00000000ff000000
	ldxa	[%i6+%o5]0x81,%l1	! %l1 = ff00005813fb39e7
!	Mem[0000000010081408] = 000000ff, %f7  = 408ab93c
	lda	[%i2+%o4]0x88,%f7 	! %f7 = 000000ff
!	Mem[000000001004140b] = 3cb98a40, %l0 = 00000000ff000000
	ldsb	[%i1+0x00b],%l0		! %l0 = 0000000000000040
!	Mem[0000000010101410] = c9db38ff, %l2 = 0000000000000000
	ldsha	[%i4+%o5]0x88,%l2	! %l2 = 00000000000038ff
!	Mem[0000000010101408] = ffc3fcff, %l6 = 0000000000000040
	lduwa	[%i4+%o4]0x80,%l6	! %l6 = 00000000ffc3fcff
!	Mem[0000000030041400] = 47624eca, %l4 = 0000000000005812
	lduba	[%i1+%g0]0x81,%l4	! %l4 = 0000000000000047
!	Mem[0000000030081400] = 00000000 000000ff 00000000 c1ffffff
!	%f0  = 7569f2af 00000000 39e71470 528a5c38
!	%f4  = 000000ff 00000000 00000000 000000ff
!	%f8  = 000000ff 1c576869 41737136 7569f2af
!	%f12 = 2e43aea4 0e6afda5 54983c02 63e462cb
	stda	%f0 ,[%i2+%g0]ASI_BLK_S	! Block Store to 0000000030081400

p0_label_89:
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000000047, imm = fffffffffffffc92, %l5 = 0000000000000000
	xnor	%l4,-0x36e,%l5		! %l5 = 000000000000032a
!	Mem[00000000100c1408] = ffffff1d, %l5 = 000000000000032a
	swapa	[%i3+%o4]0x80,%l5	! %l5 = 00000000ffffff1d
!	Mem[0000000030101408] = ff000000, %l5 = 00000000ffffff1d
	swapa	[%i4+%o4]0x81,%l5	! %l5 = 00000000ff000000
!	Mem[0000000010041417] = 2d2fd3c7, %l6 = 00000000ffc3fcff
	ldstuba	[%i1+0x017]%asi,%l6	! %l6 = 00000000000000c7
!	%l5 = 00000000ff000000, Mem[0000000030041408] = ffe71470
	stwa	%l5,[%i1+%o4]0x81	! Mem[0000000030041408] = ff000000
!	%f14 = 54983c02 63e462cb, Mem[0000000030041410] = 7014e7ff 00000000
	stda	%f14,[%i1+%o5]0x81	! Mem[0000000030041410] = 54983c02 63e462cb
!	Mem[00000000300c1408] = 00000000, %l0 = 0000000000000040
	ldstuba	[%i3+%o4]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000020800001] = ffd72ce0, %l5 = 00000000ff000000
	ldstuba	[%o1+0x001]%asi,%l5	! %l5 = 00000000000000d7
!	%l6 = 00000000000000c7, Mem[0000000030101400] = 0012000000000000
	stxa	%l6,[%i4+%g0]0x81	! Mem[0000000030101400] = 00000000000000c7
!	Mem[0000000010041400] = 00000000 40000000 3cb98a40 00005c45
!	%f16 = 67620000 196cef83 7f3f704a 9ecfd1ff
!	%f20 = ffc3fcff 54983c02 13d17938 eac6fb48
!	%f24 = 25a83d00 07a95c45 6f3e780d f6efd97d
!	%f28 = 25a83dc4 ffc3fcff 8b7a2f3c 00000000
	stda	%f16,[%i1+%g0]ASI_BLK_PL	! Block Store to 0000000010041400

p0_label_90:
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (18)
!	Mem[0000000010041430] = fffcc3ff, %f8  = 000000ff
	lda	[%i1+0x030]%asi,%f8 	! %f8 = fffcc3ff
!	Mem[00000000300c1408] = ff000000, %l1 = ff00005813fb39e7
	lduwa	[%i3+%o4]0x81,%l1	! %l1 = 00000000ff000000
!	%l0 = 0000000000000000, %l7 = ffffffffffe71470, %l0 = 0000000000000000
	addc	%l0,%l7,%l0		! %l0 = ffffffffffe71470
!	Mem[0000000010041410] = ffc3fcff54983c02, %l7 = ffffffffffe71470
	ldxa	[%i1+%o5]0x88,%l7	! %l7 = ffc3fcff54983c02
!	Mem[0000000030001408] = 528a5c38, %f25 = 07a95c45
	lda	[%i0+%o4]0x81,%f25	! %f25 = 528a5c38
!	Mem[00000000300c1410] = 00000000, %l2 = 00000000000038ff
	lduwa	[%i3+%o5]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000030101408] = ffffff1d, %l5 = 00000000000000d7
	ldswa	[%i4+%o4]0x81,%l5	! %l5 = ffffffffffffff1d
!	Mem[0000000010081438] = 8b7a2f3c592e0b79, %l5 = ffffffffffffff1d, %asi = 80
	ldxa	[%i2+0x038]%asi,%l5	! %l5 = 8b7a2f3c592e0b79
!	%f13 = 0e6afda5, %f5  = 00000000, %f0  = 7569f2af 00000000
	fsmuld	%f13,%f5 ,%f0 		! %f0  = 00000000 00000000
!	Mem[0000000010141409] = 54983c02, %l1 = 00000000ff000000, %asi = 80
	ldsba	[%i5+0x009]%asi,%l1	! %l1 = ffffffffffffff98

p0_label_91:
!	Starting 10 instruction Store Burst
!	%l5 = 8b7a2f3c592e0b79, Mem[0000000030141410] = 00000012
	stha	%l5,[%i5+%o5]0x81	! Mem[0000000030141410] = 0b790012
!	Mem[0000000030081400] = 7569f2af, %l3 = 0000000000000000
	ldstuba	[%i2+%g0]0x81,%l3	! %l3 = 0000000000000075
!	Mem[0000000010041400] = 83ef6c19, %l0 = 00000000ffe71470
	swapa	[%i1+%g0]0x80,%l0	! %l0 = 0000000083ef6c19
!	%l0 = 0000000083ef6c19, Mem[0000000010101408] = ffc3fcff
	stba	%l0,[%i4+%o4]0x80	! Mem[0000000010101408] = 19c3fcff
!	Mem[0000000010081400] = ff000000 196cef83 ff000000 39e7ffff
!	%f0  = 00000000 00000000 39e71470 528a5c38
!	%f4  = 000000ff 00000000 00000000 000000ff
!	%f8  = fffcc3ff 1c576869 41737136 7569f2af
!	%f12 = 2e43aea4 0e6afda5 54983c02 63e462cb
	stda	%f0 ,[%i2+%g0]ASI_BLK_P	! Block Store to 0000000010081400
!	Code Fragment 4, seed = 631092
p0_fragment_13:
!	%l0 = 0000000083ef6c19
	setx	0xf3ff5c965e95e286,%g7,%l0 ! %l0 = f3ff5c965e95e286
!	%l1 = ffffffffffffff98
	setx	0x2c8d3f1c3a4788b1,%g7,%l1 ! %l1 = 2c8d3f1c3a4788b1
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = f3ff5c965e95e286
	setx	0x7f4c74aa64e3f2ec,%g7,%l0 ! %l0 = 7f4c74aa64e3f2ec
!	%l1 = 2c8d3f1c3a4788b1
	setx	0xae3f702a14cd2437,%g7,%l1 ! %l1 = ae3f702a14cd2437
p0_fragment_13_end:
!	Mem[0000000010001400] = 00000000, %l1 = ae3f702a14cd2437
	ldstuba	[%i0+%g0]0x80,%l1	! %l1 = 0000000000000000
!	%l4 = 0000000000000047, Mem[0000000010181408] = 03213a74
	stwa	%l4,[%i6+%o4]0x80	! Mem[0000000010181408] = 00000047
!	Mem[0000000030081408] = 39e71470, %l0 = 7f4c74aa64e3f2ec
	ldswa	[%i2+%o4]0x81,%l0	! %l0 = 0000000039e71470
!	Mem[00000000100c1410] = 47624eca, %l5 = 00000000592e0b79
	swapa	[%i3+%o5]0x88,%l5	! %l5 = 0000000047624eca

p0_label_92:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = 54983c02, %l7 = ffc3fcff54983c02
	ldsba	[%i1+%o5]0x88,%l7	! %l7 = 0000000000000002
!	Mem[00000000100c1410] = 592e0b79, %l2 = 0000000000000000
	ldswa	[%i3+%o5]0x88,%l2	! %l2 = 00000000592e0b79
!	Code Fragment 4, seed = 248990
p0_fragment_14:
!	%l0 = 0000000039e71470
	setx	0xdbd529e2b89e1136,%g7,%l0 ! %l0 = dbd529e2b89e1136
!	%l1 = 0000000000000000
	setx	0x9a7cc5483c823861,%g7,%l1 ! %l1 = 9a7cc5483c823861
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = dbd529e2b89e1136
	setx	0xe54194ef6b9d539c,%g7,%l0 ! %l0 = e54194ef6b9d539c
!	%l1 = 9a7cc5483c823861
	setx	0x30e3c6f1e25a65e7,%g7,%l1 ! %l1 = 30e3c6f1e25a65e7
p0_fragment_14_end:
!	Mem[0000000030081408] = 39e71470, %f28 = 25a83dc4
	lda	[%i2+%o4]0x81,%f28	! %f28 = 39e71470
!	Mem[0000000030001410] = 00000000, %l6 = 00000000000000c7
	ldswa	[%i0+%o5]0x81,%l6	! %l6 = 0000000000000000
!	Mem[00000000100c1427] = 9c576869, %l4 = 0000000000000047, %asi = 80
	lduba	[%i3+0x027]%asi,%l4	! %l4 = 0000000000000069
!	Mem[0000000030001400] = 0000fff9, %l7 = 0000000000000002
	ldsha	[%i0+%g0]0x89,%l7	! %l7 = fffffffffffffff9
!	Mem[00000000201c0001] = 00ec56b0, %l1 = 30e3c6f1e25a65e7, %asi = 80
	ldsba	[%o0+0x001]%asi,%l1	! %l1 = ffffffffffffffec
!	Mem[0000000010141410] = e7390000, %l0 = e54194ef6b9d539c
	ldsba	[%i5+%o5]0x80,%l0	! %l0 = ffffffffffffffe7
!	Mem[0000000010181424] = 52d324ff, %l3 = 0000000000000075, %asi = 80
	lduba	[%i6+0x024]%asi,%l3	! %l3 = 0000000000000052

p0_label_93:
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000000069, Mem[00000000201c0001] = 00ec56b0, %asi = 80
	stba	%l4,[%o0+0x001]%asi	! Mem[00000000201c0000] = 006956b0
!	Mem[0000000010041410] = 023c9854, %l3 = 0000000000000052, %asi = 80
	swapa	[%i1+0x010]%asi,%l3	! %l3 = 00000000023c9854
!	%l5 = 0000000047624eca, Mem[0000000030001400] = f9ff000000000000
	stxa	%l5,[%i0+%g0]0x81	! Mem[0000000030001400] = 0000000047624eca
!	%f28 = 39e71470 ffc3fcff, Mem[0000000030181400] = c7d32f2d 00000000
	stda	%f28,[%i6+%g0]0x89	! Mem[0000000030181400] = 39e71470 ffc3fcff
!	%l3 = 00000000023c9854, Mem[0000000010081408] = 7014e739
	stba	%l3,[%i2+%o4]0x88	! Mem[0000000010081408] = 7014e754
!	Mem[00000000300c1410] = 00000000, %l1 = 00000000ffffffec
	swapa	[%i3+%o5]0x81,%l1	! %l1 = 0000000000000000
!	%l0 = ffffffe7, %l1 = 00000000, Mem[0000000030081400] = ff69f2af 00000000
	stda	%l0,[%i2+%g0]0x81	! Mem[0000000030081400] = ffffffe7 00000000
!	Mem[0000000021800001] = 17619770, %l7 = fffffffffffffff9
	ldstuba	[%o3+0x001]%asi,%l7	! %l7 = 0000000000000061
!	Mem[0000000010141400] = ff000000, %l4 = 0000000000000069
	ldstuba	[%i5+%g0]0x80,%l4	! %l4 = 00000000000000ff
!	%f10 = 41737136 7569f2af, %l1 = 0000000000000000
!	Mem[0000000010101408] = 19c3fcff54983c02
	add	%i4,0x008,%g1
	stda	%f10,[%g1+%l1]ASI_PST8_PL ! Mem[0000000010101408] = 19c3fcff54983c02

p0_label_94:
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = 1dffffff, %l5 = 0000000047624eca
	lduha	[%i4+%o4]0x89,%l5	! %l5 = 000000000000ffff
!	Mem[00000000100c1400] = 000000ff00000121, %l4 = 00000000000000ff
	ldxa	[%i3+%g0]0x80,%l4	! %l4 = 000000ff00000121
!	Mem[0000000030041400] = 47624eca, %l1 = 0000000000000000
	lduba	[%i1+%g0]0x81,%l1	! %l1 = 0000000000000047
!	Mem[00000000300c1408] = ff000000, %l4 = 000000ff00000121
	ldsba	[%i3+%o4]0x81,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010101408] = fffcc319, %l1 = 0000000000000047
	lduba	[%i4+%o4]0x88,%l1	! %l1 = 0000000000000019
!	Mem[00000000211c0000] = 58124d40, %l5 = 000000000000ffff, %asi = 80
	lduba	[%o2+0x000]%asi,%l5	! %l5 = 0000000000000058
!	Mem[0000000030181410] = 580000ff, %l6 = 0000000000000000
	lduba	[%i6+%o5]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030141408] = 000000ff, %l0 = ffffffffffffffe7
	lduwa	[%i5+%o4]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010041400] = ffe71470, %l0 = 00000000000000ff
	ldsba	[%i1+%g0]0x80,%l0	! %l0 = ffffffffffffffff
!	Mem[00000000100c1426] = 9c576869, %l4 = ffffffffffffffff, %asi = 80
	ldsha	[%i3+0x026]%asi,%l4	! %l4 = 0000000000006869

p0_label_95:
!	Starting 10 instruction Store Burst
!	Mem[0000000030001410] = 00000000, %l0 = ffffffffffffffff
	ldstuba	[%i0+%o5]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000030041408] = ff000000, %l3 = 00000000023c9854
	ldstuba	[%i1+%o4]0x81,%l3	! %l3 = 00000000000000ff
!	%l4 = 0000000000006869, Mem[0000000010001400] = ff000000
	stha	%l4,[%i0+%g0]0x80	! Mem[0000000010001400] = 68690000
!	%f12 = 2e43aea4 0e6afda5, Mem[0000000010081410] = ff000000 00000000
	stda	%f12,[%i2+%o5]0x88	! Mem[0000000010081410] = 2e43aea4 0e6afda5
!	%l1 = 0000000000000019, Mem[0000000010141400] = 000000ff
	stwa	%l1,[%i5+%g0]0x88	! Mem[0000000010141400] = 00000019
!	Mem[0000000030141408] = 000000ff, %l7 = 0000000000000061
	swapa	[%i5+%o4]0x89,%l7	! %l7 = 00000000000000ff
!	%l6 = 000000ff, %l7 = 000000ff, Mem[0000000010041408] = ffd1cf9e 4a703f7f
	stda	%l6,[%i1+%o4]0x80	! Mem[0000000010041408] = 000000ff 000000ff
!	%l7 = 00000000000000ff, Mem[0000000010141400] = 00000019
	stba	%l7,[%i5+%g0]0x88	! Mem[0000000010141400] = 000000ff
!	Mem[0000000030041408] = 000000ff, %l4 = 0000000000006869
	swapa	[%i1+%o4]0x89,%l4	! %l4 = 00000000000000ff
!	%l0 = 0000000000000000, imm = 0000000000000773, %l2 = 00000000592e0b79
	addc	%l0,0x773,%l2		! %l2 = 0000000000000773

p0_label_96:
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = 1200790b, %f4  = 000000ff
	lda	[%i5+%o5]0x89,%f4 	! %f4 = 1200790b
!	Mem[00000000100c1430] = 000000000e6afda5, %f16 = 67620000 196cef83, %asi = 80
	ldda	[%i3+0x030]%asi,%f16	! %f16 = 00000000 0e6afda5
!	%l7 = 00000000000000ff, %l7 = 00000000000000ff, %l2 = 0000000000000773
	or	%l7,%l7,%l2		! %l2 = 00000000000000ff
!	Mem[00000000300c1400] = 00000000196cef83, %f12 = 2e43aea4 0e6afda5
	ldda	[%i3+%g0]0x81,%f12	! %f12 = 00000000 196cef83
!	Mem[0000000010141438] = 278d28d2, %l5 = 0000000000000058
	ldsw	[%i5+0x038],%l5		! %l5 = 00000000278d28d2
!	Mem[0000000030141400] = 00000000, %f13 = 196cef83
	lda	[%i5+%g0]0x81,%f13	! %f13 = 00000000
!	Mem[0000000021800100] = e7399830, %l5 = 00000000278d28d2
	ldsb	[%o3+0x100],%l5		! %l5 = ffffffffffffffe7
!	Mem[000000001000140c] = 55ecbcc1, %l1 = 0000000000000019
	lduw	[%i0+0x00c],%l1		! %l1 = 0000000055ecbcc1
!	Mem[0000000010101410] = ff38dbc9 00000000, %l6 = 000000ff, %l7 = 000000ff
	ldda	[%i4+%o5]0x80,%l6	! %l6 = 00000000ff38dbc9 0000000000000000
!	Mem[0000000030001408] = 385c8a52, %l0 = 0000000000000000
	lduba	[%i0+%o4]0x89,%l0	! %l0 = 0000000000000052

p0_label_97:
!	Starting 10 instruction Store Burst
!	%l2 = 000000ff, %l3 = 000000ff, Mem[0000000010001420] = 528a5c38 1c576869, %asi = 80
	stda	%l2,[%i0+0x020]%asi	! Mem[0000000010001420] = 000000ff 000000ff
!	%l1 = 0000000055ecbcc1, Mem[0000000030141410] = c9db38051200790b
	stxa	%l1,[%i5+%o5]0x89	! Mem[0000000030141410] = 0000000055ecbcc1
!	%l2 = 00000000000000ff, %l0 = 0000000000000052, %y  = 00000011
	sdiv	%l2,%l0,%l2		! %l2 = 000000003512bb54
	mov	%l0,%y			! %y = 00000052
!	%l3 = 00000000000000ff, Mem[0000000030041400] = 47624eca
	stwa	%l3,[%i1+%g0]0x81	! Mem[0000000030041400] = 000000ff
!	%l2 = 000000003512bb54, imm = fffffffffffffb3c, %l1 = 0000000055ecbcc1
	subc	%l2,-0x4c4,%l1		! %l1 = 000000003512c018
!	Mem[0000000010001409] = 00006267, %l1 = 000000003512c018
	ldstub	[%i0+0x009],%l1		! %l1 = 0000000000000000
!	%f13 = 00000000, Mem[0000000010141408] = 023c9854
	sta	%f13,[%i5+%o4]0x88	! Mem[0000000010141408] = 00000000
!	Mem[0000000030141400] = 00000000 00000000 61000000 196cef83
!	%f0  = 00000000 00000000 39e71470 528a5c38
!	%f4  = 1200790b 00000000 00000000 000000ff
!	%f8  = fffcc3ff 1c576869 41737136 7569f2af
!	%f12 = 00000000 00000000 54983c02 63e462cb
	stda	%f0 ,[%i5+%g0]ASI_BLK_S	! Block Store to 0000000030141400
!	%l3 = 00000000000000ff, Mem[00000000100c1400] = ff000000
	stwa	%l3,[%i3+%g0]0x88	! Mem[00000000100c1400] = 000000ff
!	Mem[0000000030181408] = ffffffff, %l1 = 0000000000000000
	ldstuba	[%i6+%o4]0x89,%l1	! %l1 = 00000000000000ff

p0_label_98:
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = 00000000196cef83, %l7 = 0000000000000000
	ldxa	[%i3+%g0]0x81,%l7	! %l7 = 00000000196cef83
!	Mem[0000000010181408] = 00000047, %f30 = 8b7a2f3c
	lda	[%i6+%o4]0x80,%f30	! %f30 = 00000047
!	Mem[00000000300c1400] = 00000000, %f29 = ffc3fcff
	lda	[%i3+%g0]0x81,%f29	! %f29 = 00000000
	membar	#Sync			! Added by membar checker (19)
!	Mem[0000000010081410] = 2e43aea40e6afda5, %f22 = 13d17938 eac6fb48
	ldda	[%i2+%o5]0x88,%f22	! %f22 = 2e43aea4 0e6afda5
!	Mem[0000000030081410] = 000000ff, %l7 = 00000000196cef83
	ldswa	[%i2+%o5]0x81,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010001408] = 00ff6267, %l6 = 00000000ff38dbc9
	ldsha	[%i0+%o4]0x80,%l6	! %l6 = 00000000000000ff
!	Mem[00000000100c1400] = ff000000, %f8  = fffcc3ff
	ld	[%i3+%g0],%f8 		! %f8 = ff000000
!	Mem[0000000010181410] = c1ffffff, %l5 = ffffffffffffffe7
	lduwa	[%i6+%o5]0x88,%l5	! %l5 = 00000000c1ffffff
!	Mem[000000001008141e] = 000000ff, %l1 = 00000000000000ff
	ldsb	[%i2+0x01e],%l1		! %l1 = 0000000000000000
!	Mem[0000000030001408] = f4bca11a 385c8a52, %l4 = 000000ff, %l5 = c1ffffff
	ldda	[%i0+%o4]0x89,%l4	! %l4 = 00000000385c8a52 00000000f4bca11a

p0_label_99:
!	Starting 10 instruction Store Burst
!	Mem[0000000010041408] = ff000000, %l1 = 0000000000000000
	swapa	[%i1+%o4]0x88,%l1	! %l1 = 00000000ff000000
!	Mem[0000000010181401] = 58000000, %l4 = 00000000385c8a52
	ldstub	[%i6+0x001],%l4		! %l4 = 0000000000000000
!	%f2  = 39e71470 528a5c38, %l4 = 0000000000000000
!	Mem[0000000010101438] = 54983c0263e462cb
	add	%i4,0x038,%g1
	stda	%f2,[%g1+%l4]ASI_PST8_P ! Mem[0000000010101438] = 54983c0263e462cb
!	%l4 = 0000000000000000, Mem[0000000010001410] = ff0000ff00000000
	stxa	%l4,[%i0+%o5]0x80	! Mem[0000000010001410] = 0000000000000000
!	%l4 = 0000000000000000, Mem[0000000010141408] = dd5eb35f00000000
	stxa	%l4,[%i5+%o4]0x88	! Mem[0000000010141408] = 0000000000000000
!	%l4 = 0000000000000000, Mem[00000000300c1408] = ff000000
	stba	%l4,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00000000
!	%l7 = 00000000000000ff, Mem[0000000010041408] = 00000000, %asi = 80
	stha	%l7,[%i1+0x008]%asi	! Mem[0000000010041408] = 00ff0000
!	Mem[0000000030181410] = ff000058, %l3 = 00000000000000ff
	ldstuba	[%i6+%o5]0x81,%l3	! %l3 = 00000000000000ff
!	%f10 = 41737136 7569f2af, %l6 = 00000000000000ff
!	Mem[0000000010181438] = 0745e81a196cef83
	add	%i6,0x038,%g1
	stda	%f10,[%g1+%l6]ASI_PST8_PL ! Mem[0000000010181438] = aff2697536717341
!	Mem[00000000100c1410] = 592e0b79, %l7 = 00000000000000ff
	swapa	[%i3+%o5]0x88,%l7	! %l7 = 00000000592e0b79

p0_label_100:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1438] = 00000000595d72f9, %l2 = 000000003512bb54
	ldx	[%i3+0x038],%l2		! %l2 = 00000000595d72f9
!	Mem[0000000030041410] = cb62e463023c9854, %f16 = 00000000 0e6afda5
	ldda	[%i1+%o5]0x89,%f16	! %f16 = cb62e463 023c9854
!	Mem[0000000010101410] = c9db38ff, %l4 = 0000000000000000
	ldswa	[%i4+%o5]0x88,%l4	! %l4 = ffffffffc9db38ff
!	Mem[0000000010001410] = 00000000, %l5 = 00000000f4bca11a
	ldswa	[%i0+%o5]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000010101400] = ff8ab93c00000000, %l0 = 0000000000000052
	ldxa	[%i4+%g0]0x80,%l0	! %l0 = ff8ab93c00000000
!	Mem[00000000300c1410] = ffffffec67620000, %l4 = ffffffffc9db38ff
	ldxa	[%i3+%o5]0x81,%l4	! %l4 = ffffffec67620000
!	Mem[0000000030081400] = ffffffe7 00000000 39e71470 528a5c38
!	Mem[0000000030081410] = 000000ff 00000000 00000000 000000ff
!	Mem[0000000030081420] = 000000ff 1c576869 41737136 7569f2af
!	Mem[0000000030081430] = 2e43aea4 0e6afda5 54983c02 63e462cb
	ldda	[%i2+%g0]ASI_BLK_AIUSL,%f0 	! Block Load from 0000000030081400
!	Mem[0000000030081410] = 000000ff00000000, %f18 = 7f3f704a 9ecfd1ff
	ldda	[%i2+%o5]0x81,%f18	! %f18 = 000000ff 00000000
!	Mem[0000000030141410] = 1200790b, %l0 = ff8ab93c00000000
	lduwa	[%i5+%o5]0x81,%l0	! %l0 = 000000001200790b
!	Mem[0000000030141410] = 1200790b00000000, %f28 = 39e71470 00000000
	ldda	[%i5+%o5]0x81,%f28	! %f28 = 1200790b 00000000

p0_label_101:
!	Starting 10 instruction Store Burst
!	%l6 = 00000000000000ff, Mem[0000000020800000] = ffff2ce0
	stb	%l6,[%o1+%g0]		! Mem[0000000020800000] = ffff2ce0
!	%l0 = 000000001200790b, imm = fffffffffffff91b, %l7 = 00000000592e0b79
	sub	%l0,-0x6e5,%l7		! %l7 = 0000000012007ff0
!	%l4 = ffffffec67620000, Mem[0000000010001408] = 6762ff00
	stba	%l4,[%i0+%o4]0x88	! Mem[0000000010001408] = 6762ff00
!	%l2 = 00000000595d72f9, Mem[0000000030141408] = 39e71470528a5c38
	stxa	%l2,[%i5+%o4]0x81	! Mem[0000000030141408] = 00000000595d72f9
!	%l4 = ffffffec67620000, Mem[0000000020800040] = ff5f7f10
	sth	%l4,[%o1+0x040]		! Mem[0000000020800040] = 00007f10
!	%l5 = 0000000000000000, Mem[0000000021800080] = 43879fd0, %asi = 80
	stha	%l5,[%o3+0x080]%asi	! Mem[0000000021800080] = 00009fd0
!	%l0 = 1200790b, %l1 = ff000000, Mem[0000000010081408] = 54e71470 528a5c38
	stda	%l0,[%i2+%o4]0x80	! Mem[0000000010081408] = 1200790b ff000000
!	%l6 = 00000000000000ff, Mem[0000000030001408] = 385c8a52
	stha	%l6,[%i0+%o4]0x89	! Mem[0000000030001408] = 385c00ff
!	%f0  = 00000000 e7ffffff, %l7 = 0000000012007ff0
!	Mem[0000000010141428] = 27251c7d0538dbc9
	add	%i5,0x028,%g1
	stda	%f0,[%g1+%l7]ASI_PST8_P ! Mem[0000000010141428] = 000000000538dbc9
	membar	#Sync			! Added by membar checker (20)
!	%l0 = 000000001200790b, Mem[0000000030081400] = e7ffffff
	stha	%l0,[%i2+%g0]0x89	! Mem[0000000030081400] = e7ff790b

p0_label_102:
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = ecffffff, %l6 = 00000000000000ff
	lduwa	[%i3+%o5]0x89,%l6	! %l6 = 00000000ecffffff
!	Mem[0000000010181422] = 76aa6158, %l3 = 00000000000000ff
	lduh	[%i6+0x022],%l3		! %l3 = 0000000000006158
!	Mem[0000000030141400] = 00000000 00000000 00000000 595d72f9
!	Mem[0000000030141410] = 1200790b 00000000 00000000 000000ff
!	Mem[0000000030141420] = fffcc3ff 1c576869 41737136 7569f2af
!	Mem[0000000030141430] = 00000000 00000000 54983c02 63e462cb
	ldda	[%i5+%g0]ASI_BLK_SL,%f0 	! Block Load from 0000000030141400
!	Mem[0000000030181410] = 580000ff, %l4 = ffffffec67620000
	ldsha	[%i6+%o5]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030101400] = 00000000, %l0 = 000000001200790b
	lduba	[%i4+%g0]0x89,%l0	! %l0 = 0000000000000000
!	Mem[00000000300c1400] = 00000000, %l1 = 00000000ff000000
	ldsha	[%i3+%g0]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000010101410] = ff38dbc9, %l1 = 0000000000000000
	ldsba	[%i4+%o5]0x80,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010001438] = 54983c02, %l0 = 0000000000000000
	lduh	[%i0+0x038],%l0		! %l0 = 0000000000005498
!	Mem[0000000021800141] = 01cb4e60, %l3 = 0000000000006158
	ldsb	[%o3+0x141],%l3		! %l3 = ffffffffffffffcb
!	Mem[000000001000141c] = ffffffff, %f25 = 528a5c38
	ld	[%i0+0x01c],%f25	! %f25 = ffffffff

p0_label_103:
!	Starting 10 instruction Store Burst
!	%f22 = 2e43aea4 0e6afda5, %l4 = 00000000000000ff
!	Mem[0000000010181420] = 76aa615852d324ff
	add	%i6,0x020,%g1
	stda	%f22,[%g1+%l4]ASI_PST8_PL ! Mem[0000000010181420] = a5fd6a0ea4ae432e
!	%l1 = ffffffffffffffff, %l7 = 0000000012007ff0, %l4 = 00000000000000ff
	orn	%l1,%l7,%l4		! %l4 = ffffffffffffffff
!	%l2 = 00000000595d72f9, %l7 = 0000000012007ff0, %y  = 00000052
	umul	%l2,%l7,%l3		! %l3 = 0648bebea5a55070, %y = 0648bebe
	membar	#Sync			! Added by membar checker (21)
!	%l5 = 0000000000000000, Mem[0000000030141410] = 1200790b00000000
	stxa	%l5,[%i5+%o5]0x81	! Mem[0000000030141410] = 0000000000000000
!	%f12 = 00000000 00000000, Mem[0000000030081400] = 0b79ffe7 00000000
	stda	%f12,[%i2+%g0]0x81	! Mem[0000000030081400] = 00000000 00000000
!	Mem[0000000030041400] = 000000ff 00000000 69680000 55ecbcc1
!	%f0  = 00000000 00000000 f9725d59 00000000
!	%f4  = 00000000 0b790012 ff000000 00000000
!	%f8  = 6968571c ffc3fcff aff26975 36717341
!	%f12 = 00000000 00000000 cb62e463 023c9854
	stda	%f0 ,[%i1+%g0]ASI_BLK_SL	! Block Store to 0000000030041400
!	Mem[000000001000140a] = 00ff6267, %l3 = 0648bebea5a55070
	ldstub	[%i0+0x00a],%l3		! %l3 = 0000000000000062
!	Mem[00000000300c1408] = 00000000, %l0 = 0000000000005498
	ldstuba	[%i3+%o4]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000010181408] = 47000000, %l4 = 00000000ffffffff
	swapa	[%i6+%o4]0x88,%l4	! %l4 = 0000000047000000
!	%f14 = cb62e463 023c9854, %l6 = 00000000ecffffff
!	Mem[0000000010081410] = a5fd6a0ea4ae432e
	add	%i2,0x010,%g1
	stda	%f14,[%g1+%l6]ASI_PST8_P ! Mem[0000000010081410] = cb62e463023c9854

p0_label_104:
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = 00000000, %l7 = 0000000012007ff0
	lduwa	[%i5+%o4]0x81,%l7	! %l7 = 0000000000000000
!	%f27 = f6efd97d, %f3  = 00000000, %f19 = 00000000
	fdivs	%f27,%f3 ,%f19		! %f19 = ff800000
	membar	#Sync			! Added by membar checker (22)
!	Mem[0000000010041410] = 00000052fffcc3ff, %l5 = 0000000000000000
	ldxa	[%i1+%o5]0x80,%l5	! %l5 = 00000052fffcc3ff
!	Mem[0000000030041400] = 00000000, %l7 = 0000000000000000
	lduha	[%i1+%g0]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000010141408] = 0000000000000000, %f16 = cb62e463 023c9854
	ldda	[%i5+%o4]0x80,%f16	! %f16 = 00000000 00000000
!	%l7 = 0000000000000000, %l6 = 00000000ecffffff, %l1 = ffffffffffffffff
	xor	%l7,%l6,%l1		! %l1 = 00000000ecffffff
!	%l2 = 00000000595d72f9, %l3 = 0000000000000062, %l5 = 00000052fffcc3ff
	orn	%l2,%l3,%l5		! %l5 = fffffffffffffffd
!	Mem[0000000010141410] = e739000000000000, %l1 = 00000000ecffffff
	ldxa	[%i5+%o5]0x80,%l1	! %l1 = e739000000000000
!	%f12 = 00000000, %f19 = ff800000, %f26 = 6f3e780d
	fadds	%f12,%f19,%f26		! %f26 = ff800000
!	Mem[0000000030001408] = ff005c38 1aa1bcf4, %l6 = ecffffff, %l7 = 00000000
	ldda	[%i0+%o4]0x81,%l6	! %l6 = 00000000ff005c38 000000001aa1bcf4

p0_label_105:
!	Starting 10 instruction Store Burst
!	%l6 = 00000000ff005c38, Mem[0000000010001400] = 68690000
	stwa	%l6,[%i0+%g0]0x80	! Mem[0000000010001400] = ff005c38
!	%l1 = e739000000000000, Mem[0000000030181408] = ffffffff
	stha	%l1,[%i6+%o4]0x89	! Mem[0000000030181408] = ffff0000
!	Mem[0000000010141418] = 7e45eefa582b0ee3, %l5 = fffffffffffffffd, %l0 = 0000000000000000
	add	%i5,0x18,%g1
	casxa	[%g1]0x80,%l5,%l0	! %l0 = 7e45eefa582b0ee3
!	%f14 = cb62e463, Mem[0000000010081410] = cb62e463
	sta	%f14,[%i2+%o5]0x80	! Mem[0000000010081410] = cb62e463
!	%f16 = 00000000 00000000, Mem[0000000010001410] = 00000000 00000000
	stda	%f16,[%i0+%o5]0x80	! Mem[0000000010001410] = 00000000 00000000
!	%l0 = 582b0ee3, %l1 = 00000000, Mem[0000000010181430] = 25a83dc4 faee457e
	std	%l0,[%i6+0x030]		! Mem[0000000010181430] = 582b0ee3 00000000
!	%l2 = 00000000595d72f9, Mem[00000000300c1410] = ffffffec67620000
	stxa	%l2,[%i3+%o5]0x81	! Mem[00000000300c1410] = 00000000595d72f9
!	%l0 = 582b0ee3, %l1 = 00000000, Mem[0000000030181408] = 0000ffff 8e903312
	stda	%l0,[%i6+%o4]0x81	! Mem[0000000030181408] = 582b0ee3 00000000
!	%f0  = 00000000 00000000, Mem[0000000010041400] = ffe71470 00006267
	stda	%f0 ,[%i1+%g0]0x80	! Mem[0000000010041400] = 00000000 00000000
!	%l3 = 0000000000000062, Mem[00000000100c1420] = 00125c389c576869
	stx	%l3,[%i3+0x020]		! Mem[00000000100c1420] = 0000000000000062

p0_label_106:
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = 00000000, %l7 = 000000001aa1bcf4
	ldswa	[%i1+%o4]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000010181408] = ffffffff, %l5 = fffffffffffffffd
	ldsha	[%i6+%o4]0x80,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000030181400] = 39e71470 ffc3fcff, %l4 = 47000000, %l5 = ffffffff
	ldda	[%i6+%g0]0x89,%l4	! %l4 = 00000000ffc3fcff 0000000039e71470
!	Mem[0000000010181408] = ffffffff, %l7 = 0000000000000000
	ldsba	[%i6+%o4]0x88,%l7	! %l7 = ffffffffffffffff
!	Mem[00000000100c1430] = 000000000e6afda5, %l6 = 00000000ff005c38
	ldx	[%i3+0x030],%l6		! %l6 = 000000000e6afda5
!	Mem[00000000300c1410] = 00000000, %l4 = 00000000ffc3fcff
	lduha	[%i3+%o5]0x89,%l4	! %l4 = 0000000000000000
!	Mem[000000001004142c] = 0d783e6f, %f4  = 00000000
	ld	[%i1+0x02c],%f4 	! %f4 = 0d783e6f
!	Mem[0000000030001410] = 000000ff, %l5 = 0000000039e71470
	ldsba	[%i0+%o5]0x89,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000010081410] = 54983c02 63e462cb, %l2 = 595d72f9, %l3 = 00000062
	ldda	[%i2+%o5]0x88,%l2	! %l2 = 0000000063e462cb 0000000054983c02
!	Mem[0000000030181400] = 39e71470ffc3fcff, %l3 = 0000000054983c02
	ldxa	[%i6+%g0]0x89,%l3	! %l3 = 39e71470ffc3fcff

p0_label_107:
!	Starting 10 instruction Store Burst
!	Mem[0000000021800141] = 01cb4e60, %l1 = e739000000000000
	ldstuba	[%o3+0x141]%asi,%l1	! %l1 = 00000000000000cb
!	%f23 = 0e6afda5, Mem[0000000010181410] = ffffffc1
	sta	%f23,[%i6+%o5]0x80	! Mem[0000000010181410] = 0e6afda5
!	Mem[0000000010101430] = 2e43aea4, %l4 = 0000000000000000, %asi = 80
	swapa	[%i4+0x030]%asi,%l4	! %l4 = 000000002e43aea4
!	%l4 = 000000002e43aea4, Mem[0000000030101400] = 00000000000000c7
	stxa	%l4,[%i4+%g0]0x81	! Mem[0000000030101400] = 000000002e43aea4
!	%f3  = 00000000, Mem[0000000010041400] = 00000000
	sta	%f3 ,[%i1+%g0]0x88	! Mem[0000000010041400] = 00000000
!	Code Fragment 4, seed = 418355
p0_fragment_15:
!	%l0 = 7e45eefa582b0ee3
	setx	0xfa3d77ef265c098e,%g7,%l0 ! %l0 = fa3d77ef265c098e
!	%l1 = 00000000000000cb
	setx	0xcd16008a8f87a139,%g7,%l1 ! %l1 = cd16008a8f87a139
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = fa3d77ef265c098e
	setx	0x79a8d961ca7944f4,%g7,%l0 ! %l0 = 79a8d961ca7944f4
!	%l1 = cd16008a8f87a139
	setx	0x1d5697642e5077bf,%g7,%l1 ! %l1 = 1d5697642e5077bf
p0_fragment_15_end:
!	%l4 = 000000002e43aea4, Mem[0000000030101410] = ffffffff
	stha	%l4,[%i4+%o5]0x89	! Mem[0000000030101410] = ffffaea4
!	%l3 = 39e71470ffc3fcff, %l2 = 0000000063e462cb, %l0 = 79a8d961ca7944f4
	xnor	%l3,%l2,%l0		! %l0 = c618eb8f63d861cb
!	Mem[0000000021800001] = 17ff9770, %l3 = 39e71470ffc3fcff
	ldstuba	[%o3+0x001]%asi,%l3	! %l3 = 00000000000000ff
!	%f14 = cb62e463 023c9854, Mem[0000000030041410] = 1200790b 00000000
	stda	%f14,[%i1+%o5]0x81	! Mem[0000000030041410] = cb62e463 023c9854

p0_label_108:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081418] = 00000000, %l0 = c618eb8f63d861cb
	lduh	[%i2+0x018],%l0		! %l0 = 0000000000000000
!	Mem[0000000010101410] = c9db38ff, %l6 = 000000000e6afda5
	ldsba	[%i4+%o5]0x88,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010081408] = 1200790bff000000, %f4  = 0d783e6f 0b790012
	ldda	[%i2+%o4]0x80,%f4 	! %f4  = 1200790b ff000000
!	Mem[0000000010041410] = 52000000, %l0 = 0000000000000000
	lduha	[%i1+%o5]0x88,%l0	! %l0 = 0000000000000000
	membar	#Sync			! Added by membar checker (23)
!	Mem[00000000100c1400] = ff000000 00000121 0000032a 55ecbcc1
!	Mem[00000000100c1410] = ff000000 00000000 41c5c42a 465c9153
!	Mem[00000000100c1420] = 00000000 00000062 cadbff00 00000000
!	Mem[00000000100c1430] = 00000000 0e6afda5 00000000 595d72f9
	ldda	[%i3+%g0]ASI_BLK_P,%f16	! Block Load from 00000000100c1400
!	Mem[0000000030041408] = 00000000, %l2 = 0000000063e462cb
	ldsba	[%i1+%o4]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000030081408] = 7014e739, %l2 = 0000000000000000
	lduwa	[%i2+%o4]0x89,%l2	! %l2 = 000000007014e739
!	Mem[0000000010001408] = 00ffff6755ecbcc1, %l2 = 000000007014e739
	ldx	[%i0+%o4],%l2		! %l2 = 00ffff6755ecbcc1
!	Mem[0000000010041404] = 00000000, %l0 = 0000000000000000
	ldsw	[%i1+0x004],%l0		! %l0 = 0000000000000000
!	Mem[00000000211c0000] = 58124d40, %l6 = ffffffffffffffff
	ldsh	[%o2+%g0],%l6		! %l6 = 0000000000005812

p0_label_109:
!	Starting 10 instruction Store Burst
!	Mem[0000000030001410] = 000000ff, %l5 = 00000000ffffffff
	swapa	[%i0+%o5]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[00000000100c1400] = ff000000, %l1 = 1d5697642e5077bf
	ldstuba	[%i3+%g0]0x80,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010181400] = 58ff0000 00000000 ffffffff 8e903312
!	%f16 = ff000000 00000121 0000032a 55ecbcc1
!	%f20 = ff000000 00000000 41c5c42a 465c9153
!	%f24 = 00000000 00000062 cadbff00 00000000
!	%f28 = 00000000 0e6afda5 00000000 595d72f9
	stda	%f16,[%i6+%g0]ASI_COMMIT_P	! Block Store to 0000000010181400
	membar	#Sync			! Added by membar checker (24)
!	%l1 = 00000000000000ff, Mem[0000000010181400] = ff00000000000121
	stxa	%l1,[%i6+%g0]0x80	! Mem[0000000010181400] = 00000000000000ff
!	%f2  = f9725d59 00000000, Mem[0000000010081410] = 63e462cb 54983c02
	stda	%f2 ,[%i2+%o5]0x88	! Mem[0000000010081410] = f9725d59 00000000
!	Mem[0000000010001410] = 00000000, %l7 = 00000000ffffffff
	swapa	[%i0+%o5]0x88,%l7	! %l7 = 0000000000000000
!	Mem[000000001018141c] = 465c9153, %l0 = 0000000000000000
	ldstuba	[%i6+0x01c]%asi,%l0	! %l0 = 0000000000000046
!	%l0 = 0000000000000046, Mem[0000000030181410] = 580000ff
	stwa	%l0,[%i6+%o5]0x89	! Mem[0000000030181410] = 00000046
!	%f25 = 00000062, %f8  = 6968571c
	fcmpes	%fcc2,%f25,%f8 		! %fcc2 = 1
!	Mem[0000000030141410] = 00000000, %l1 = 00000000000000ff
	ldstuba	[%i5+%o5]0x89,%l1	! %l1 = 0000000000000000

p0_label_110:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = e7390000, %l0 = 0000000000000046
	ldswa	[%i5+%o5]0x80,%l0	! %l0 = ffffffffe7390000
!	Mem[0000000030141408] = 00000000595d72f9, %l2 = 00ffff6755ecbcc1
	ldxa	[%i5+%o4]0x81,%l2	! %l2 = 00000000595d72f9
!	Mem[0000000030181408] = 582b0ee3, %l2 = 00000000595d72f9
	ldswa	[%i6+%o4]0x81,%l2	! %l2 = 00000000582b0ee3
!	Mem[0000000010001418] = ef83ffffffffffff, %f12 = 00000000 00000000, %asi = 80
	ldda	[%i0+0x018]%asi,%f12	! %f12 = ef83ffff ffffffff
!	Mem[0000000010141434] = 7e5ba0b5, %l7 = 0000000000000000, %asi = 80
	ldswa	[%i5+0x034]%asi,%l7	! %l7 = 000000007e5ba0b5
!	Mem[0000000030101400] = 00000000, %l2 = 00000000582b0ee3
	lduha	[%i4+%g0]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000010001410] = ffffffff, %l1 = 0000000000000000
	ldsba	[%i0+%o5]0x80,%l1	! %l1 = ffffffffffffffff
!	Mem[00000000201c0000] = 006956b0, %l0 = ffffffffe7390000
	ldsh	[%o0+%g0],%l0		! %l0 = 0000000000000069
!	Mem[0000000030181410] = 46000000, %l0 = 0000000000000069
	ldsha	[%i6+%o5]0x81,%l0	! %l0 = 0000000000004600
!	Mem[0000000010041408] = 0000ff00, %f15 = 023c9854
	lda	[%i1+%o4]0x88,%f15	! %f15 = 0000ff00

p0_label_111:
!	Starting 10 instruction Store Burst
!	Mem[0000000010001408] = 67ffff00, %l7 = 000000007e5ba0b5
	swapa	[%i0+%o4]0x88,%l7	! %l7 = 0000000067ffff00
!	%f0  = 00000000, Mem[00000000300c1400] = 00000000
	sta	%f0 ,[%i3+%g0]0x89	! Mem[00000000300c1400] = 00000000
!	%l3 = 00000000000000ff, Mem[00000000300c1410] = 00000000
	stha	%l3,[%i3+%o5]0x81	! Mem[00000000300c1410] = 00ff0000
!	%l3 = 00000000000000ff, Mem[00000000100c1408] = 0000032a
	stha	%l3,[%i3+%o4]0x80	! Mem[00000000100c1408] = 00ff032a
!	%l6 = 0000000000005812, Mem[0000000010041410] = 00000052
	stba	%l6,[%i1+%o5]0x80	! Mem[0000000010041410] = 12000052
!	Mem[00000000100c1408] = 00ff032a, %l0 = 0000000000004600
	swapa	[%i3+%o4]0x80,%l0	! %l0 = 0000000000ff032a
!	Mem[00000000100c142d] = 00000000, %l6 = 0000000000005812
	ldstuba	[%i3+0x02d]%asi,%l6	! %l6 = 0000000000000000
!	%l4 = 000000002e43aea4, imm = 00000000000008df, %l2 = 0000000000000000
	xnor	%l4,0x8df,%l2		! %l2 = ffffffffd1bc5984
!	%l0 = 0000000000ff032a, Mem[0000000021800180] = 70ff8090
	sth	%l0,[%o3+0x180]		! Mem[0000000021800180] = 032a8090
!	Mem[0000000030001408] = 385c00ff, %l2 = ffffffffd1bc5984
	ldstuba	[%i0+%o4]0x89,%l2	! %l2 = 00000000000000ff

p0_label_112:
!	Starting 10 instruction Load Burst
!	Mem[000000001004143c] = 3c2f7a8b, %l1 = ffffffffffffffff, %asi = 80
	ldsha	[%i1+0x03c]%asi,%l1	! %l1 = 0000000000003c2f
!	%f30 = 00000000 595d72f9, %f10 = aff26975 36717341
	fdtox	%f30,%f10		! tt=0x22, %l0 = 0000000000ff034c
!	%f18 = 0000032a 55ecbcc1, Mem[0000000010101408] = 19c3fcff 54983c02
	stda	%f18,[%i4+%o4]0x80	! Mem[0000000010101408] = 0000032a 55ecbcc1
!	Mem[0000000030141408] = 00000000, %l4 = 000000002e43aea4
	ldsha	[%i5+%o4]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000030001408] = 385c00ff, %l4 = 0000000000000000
	ldsba	[%i0+%o4]0x89,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010141400] = ff000000, %f22 = 41c5c42a
	lda	[%i5+%g0]0x80,%f22	! %f22 = ff000000
!	Mem[0000000010181428] = cadbff00, %l7 = 0000000067ffff00, %asi = 80
	ldswa	[%i6+0x028]%asi,%l7	! %l7 = ffffffffcadbff00
!	%f17 = 00000121, %f25 = 00000062
	fcmpes	%fcc1,%f17,%f25		! %fcc1 = 2
!	Mem[0000000010101408] = 0000032a, %l5 = 00000000000000ff
	lduwa	[%i4+%o4]0x80,%l5	! %l5 = 000000000000032a
!	Mem[0000000010101400] = 3cb98aff, %l2 = 00000000000000ff
	ldsba	[%i4+%g0]0x88,%l2	! %l2 = ffffffffffffffff

p0_label_113:
!	Starting 10 instruction Store Burst
!	Mem[0000000010101408] = 2a030000, %l2 = 00000000ffffffff
	swapa	[%i4+%o4]0x88,%l2	! %l2 = 000000002a030000
!	%f23 = 465c9153, Mem[0000000010081418] = 00000000
	sta	%f23,[%i2+0x018]%asi	! Mem[0000000010081418] = 465c9153
!	%l4 = ffffffffffffffff, Mem[0000000020800000] = ffff2ce0
	sth	%l4,[%o1+%g0]		! Mem[0000000020800000] = ffff2ce0
!	Mem[0000000010001410] = ffffffff, %l1 = 0000000000003c2f
	swapa	[%i0+%o5]0x80,%l1	! %l1 = 00000000ffffffff
!	%l7 = ffffffffcadbff00, Mem[0000000030041400] = 0000000000000000
	stxa	%l7,[%i1+%g0]0x81	! Mem[0000000030041400] = ffffffffcadbff00
!	Mem[0000000010041430] = fffcc3ff, %l1 = 00000000ffffffff
	swap	[%i1+0x030],%l1		! %l1 = 00000000fffcc3ff
!	Mem[00000000300c1408] = 000000ff, %l2 = 000000002a030000
	ldstuba	[%i3+%o4]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010101420] = 528a5c38, %l5 = 000000000000032a
	swap	[%i4+0x020],%l5		! %l5 = 00000000528a5c38
!	Mem[0000000010101400] = 3cb98aff, %l0 = 0000000000ff034c
	ldstuba	[%i4+%g0]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030101408] = 1dffffff, %l4 = ffffffffffffffff
	ldstuba	[%i4+%o4]0x89,%l4	! %l4 = 00000000000000ff

p0_label_114:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = ff8ab93c, %f30 = 00000000
	lda	[%i4+%g0]0x80,%f30	! %f30 = ff8ab93c
!	Mem[000000001000140c] = 55ecbcc1, %l6 = 0000000000000000, %asi = 80
	ldsba	[%i0+0x00c]%asi,%l6	! %l6 = 0000000000000055
!	Mem[000000001000143a] = 54983c02, %l3 = 00000000000000ff, %asi = 80
	ldsba	[%i0+0x03a]%asi,%l3	! %l3 = 000000000000003c
!	%l1 = 00000000fffcc3ff, %l1 = 00000000fffcc3ff, %l2 = 00000000000000ff
	or	%l1,%l1,%l2		! %l2 = 00000000fffcc3ff
!	Mem[0000000010181410] = ff00000000000000, %f24 = 00000000 00000062
	ldda	[%i6+%o5]0x80,%f24	! %f24 = ff000000 00000000
!	Mem[0000000010081408] = 1200790b, %f17 = 00000121
	ld	[%i2+%o4],%f17		! %f17 = 1200790b
!	Mem[0000000010081410] = 00000000, %l4 = 00000000000000ff
	lduwa	[%i2+%o5]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000010081400] = 00000000 00000000, %l4 = 00000000, %l5 = 528a5c38
	ldda	[%i2+%g0]0x88,%l4	! %l4 = 0000000000000000 0000000000000000
!	Mem[0000000030041410] = cb62e463, %l1 = 00000000fffcc3ff
	ldsha	[%i1+%o5]0x81,%l1	! %l1 = ffffffffffffcb62
!	Mem[00000000100c1410] = ff000000, %l5 = 0000000000000000
	lduwa	[%i3+%o5]0x80,%l5	! %l5 = 00000000ff000000

p0_label_115:
!	Starting 10 instruction Store Burst
!	%f22 = ff000000 465c9153, %l4 = 0000000000000000
!	Mem[00000000300c1428] = 6f3e780df6efd97d
	add	%i3,0x028,%g1
	stda	%f22,[%g1+%l4]ASI_PST8_S ! Mem[00000000300c1428] = 6f3e780df6efd97d
!	%f0  = 00000000 00000000, Mem[0000000030141400] = 00000000 00000000
	stda	%f0 ,[%i5+%g0]0x81	! Mem[0000000030141400] = 00000000 00000000
!	Mem[0000000010001400] = ff005c38 00000000 b5a05b7e 55ecbcc1
!	%f0  = 00000000 00000000 f9725d59 00000000
!	%f4  = 1200790b ff000000 ff000000 00000000
!	%f8  = 6968571c ffc3fcff aff26975 36717341
!	%f12 = ef83ffff ffffffff cb62e463 0000ff00
	stda	%f0 ,[%i0+%g0]ASI_BLK_AIUP	! Block Store to 0000000010001400
!	%l4 = 00000000, %l5 = ff000000, Mem[0000000010181428] = cadbff00 00000000, %asi = 80
	stda	%l4,[%i6+0x028]%asi	! Mem[0000000010181428] = 00000000 ff000000
!	Code Fragment 4, seed = 394010
p0_fragment_16:
!	%l0 = 00000000000000ff
	setx	0x55473b7ab9779956,%g7,%l0 ! %l0 = 55473b7ab9779956
!	%l1 = ffffffffffffcb62
	setx	0x4fe404148adfc681,%g7,%l1 ! %l1 = 4fe404148adfc681
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 55473b7ab9779956
	setx	0x1e05caefe53807bc,%g7,%l0 ! %l0 = 1e05caefe53807bc
!	%l1 = 4fe404148adfc681
	setx	0x8b2a81bd46216007,%g7,%l1 ! %l1 = 8b2a81bd46216007
p0_fragment_16_end:
!	%l0 = 1e05caefe53807bc, Mem[000000001014142e] = 0538dbc9, %asi = 80
	stba	%l0,[%i5+0x02e]%asi	! Mem[000000001014142c] = 0538bcc9
!	%l4 = 0000000000000000, Mem[0000000010141400] = c9db3805000000ff
	stxa	%l4,[%i5+%g0]0x88	! Mem[0000000010141400] = 0000000000000000
!	Mem[0000000010181410] = ff000000, %l0 = 1e05caefe53807bc
	ldstuba	[%i6+%o5]0x80,%l0	! %l0 = 00000000000000ff
!	%f2  = f9725d59, Mem[0000000030181400] = ffc3fcff
	sta	%f2 ,[%i6+%g0]0x89	! Mem[0000000030181400] = f9725d59
!	Mem[0000000030081400] = 00000000, %l1 = 8b2a81bd46216007
	ldstuba	[%i2+%g0]0x89,%l1	! %l1 = 0000000000000000

p0_label_116:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = 00000000c9db38ff, %f24 = ff000000 00000000
	ldda	[%i4+%o5]0x88,%f24	! %f24 = 00000000 c9db38ff
!	Mem[00000000100c1410] = ff00000000000000, %l4 = 0000000000000000
	ldxa	[%i3+%o5]0x80,%l4	! %l4 = ff00000000000000
!	Mem[00000000100c1410] = 000000ff, %f21 = 00000000
	lda	[%i3+%o5]0x88,%f21	! %f21 = 000000ff
!	Mem[0000000030181400] = f9725d59, %l3 = 000000000000003c
	lduba	[%i6+%g0]0x89,%l3	! %l3 = 0000000000000059
!	Mem[00000000100c1400] = ff000000, %l0 = 00000000000000ff
	lduha	[%i3+%g0]0x80,%l0	! %l0 = 000000000000ff00
	membar	#Sync			! Added by membar checker (25)
!	Mem[0000000010101400] = ff8ab93c 00000000 ffffffff 55ecbcc1
!	Mem[0000000010101410] = ff38dbc9 00000000 41c5c42a 465c9153
!	Mem[0000000010101420] = 0000032a 1c576869 00000000 000000ff
!	Mem[0000000010101430] = 00000000 0e6afda5 54983c02 63e462cb
	ldda	[%i4+%g0]ASI_BLK_AIUPL,%f16	! Block Load from 0000000010101400
!	Mem[0000000010181410] = ff000000, %l1 = 0000000000000000
	ldswa	[%i6+%o5]0x80,%l1	! %l1 = ffffffffff000000
!	Mem[0000000030181400] = 595d72f9, %l0 = 000000000000ff00
	lduwa	[%i6+%g0]0x81,%l0	! %l0 = 00000000595d72f9
!	Mem[0000000010141438] = 278d28d203735aff, %l3 = 0000000000000059
	ldx	[%i5+0x038],%l3		! %l3 = 278d28d203735aff
!	%l7 = ffffffffcadbff00, immd = fffffffffffff86f, %l7  = ffffffffcadbff00
	mulx	%l7,-0x791,%l7		! %l7 = 00000192156b9100

p0_label_117:
!	Starting 10 instruction Store Burst
!	%l0 = 595d72f9, %l1 = ff000000, Mem[0000000010181430] = 00000000 0e6afda5, %asi = 80
	stda	%l0,[%i6+0x030]%asi	! Mem[0000000010181430] = 595d72f9 ff000000
!	Mem[0000000010101400] = ff8ab93c, %l4 = 0000000000000000
	swapa	[%i4+%g0]0x80,%l4	! %l4 = 00000000ff8ab93c
!	%l0 = 00000000595d72f9, Mem[0000000030181400] = 595d72f9
	stba	%l0,[%i6+%g0]0x81	! Mem[0000000030181400] = f95d72f9
!	%l6 = 0000000000000055, immd = 000007a1, %y  = 0648bebe
	smul	%l6,0x7a1,%l0		! %l0 = 0000000000028875, %y = 00000000
!	Mem[0000000030101400] = 00000000, %l3 = 278d28d203735aff
	ldstuba	[%i4+%g0]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000030041400] = ffffffff cadbff00 00000000 595d72f9
!	%f16 = 00000000 3cb98aff c1bcec55 ffffffff
!	%f20 = 00000000 c9db38ff 53915c46 2ac4c541
!	%f24 = 6968571c 2a030000 ff000000 00000000
!	%f28 = a5fd6a0e 00000000 cb62e463 023c9854
	stda	%f16,[%i1+%g0]ASI_BLK_SL	! Block Store to 0000000030041400
!	%f10 = aff26975 36717341, Mem[0000000030001408] = ff005c38 1aa1bcf4
	stda	%f10,[%i0+%o4]0x81	! Mem[0000000030001408] = aff26975 36717341
!	Mem[00000000300c1408] = 000000ff, %l3 = 0000000000000000
	swapa	[%i3+%o4]0x89,%l3	! %l3 = 00000000000000ff
!	%l6 = 0000000000000055, Mem[0000000010041410] = 12000052fffcc3ff
	stxa	%l6,[%i1+%o5]0x80	! Mem[0000000010041410] = 0000000000000055
!	%l7 = 00000192156b9100, Mem[0000000010181410] = ff000000
	stwa	%l7,[%i6+%o5]0x80	! Mem[0000000010181410] = 156b9100

p0_label_118:
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = ff000000, %l1 = ffffffffff000000
	ldswa	[%i4+%g0]0x81,%l1	! %l1 = ffffffffff000000
	membar	#Sync			! Added by membar checker (26)
!	Mem[0000000010041408] = 0000ff00, %l4 = 00000000ff8ab93c
	ldswa	[%i1+%o4]0x88,%l4	! %l4 = 000000000000ff00
!	Mem[0000000030181400] = f9725df9, %l3 = 00000000000000ff
	lduha	[%i6+%g0]0x89,%l3	! %l3 = 0000000000005df9
!	Mem[00000000201c0000] = 006956b0, %l5 = 00000000ff000000
	lduh	[%o0+%g0],%l5		! %l5 = 0000000000000069
!	Mem[00000000100c1410] = ff000000 00000000, %l6 = 00000055, %l7 = 156b9100
	ldda	[%i3+%o5]0x80,%l6	! %l6 = 00000000ff000000 0000000000000000
!	Mem[00000000300c1408] = 00000000 ca4e6247, %l0 = 00028875, %l1 = ff000000
	ldda	[%i3+%o4]0x81,%l0	! %l0 = 0000000000000000 00000000ca4e6247
!	Mem[0000000010041408] = ff0000000000ff00, %l7 = 0000000000000000
	ldxa	[%i1+%o4]0x88,%l7	! %l7 = ff0000000000ff00
!	Mem[0000000010141400] = 00000000, %l2 = 00000000fffcc3ff
	lduwa	[%i5+%g0]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000010101408] = c1bcec55 ffffffff, %l0 = 00000000, %l1 = ca4e6247
	ldda	[%i4+%o4]0x88,%l0	! %l0 = 00000000ffffffff 00000000c1bcec55
!	Mem[00000000100c1410] = ff000000, %l3 = 0000000000005df9, %asi = 80
	ldswa	[%i3+0x010]%asi,%l3	! %l3 = ffffffffff000000

p0_label_119:
!	Starting 10 instruction Store Burst
!	%l2 = 00000000, %l3 = ff000000, Mem[00000000100c1418] = 41c5c42a 465c9153
	std	%l2,[%i3+0x018]		! Mem[00000000100c1418] = 00000000 ff000000
!	%l2 = 00000000, %l3 = ff000000, Mem[0000000010001408] = f9725d59 00000000
	stda	%l2,[%i0+%o4]0x80	! Mem[0000000010001408] = 00000000 ff000000
!	%l6 = 00000000ff000000, Mem[0000000021800000] = 17ff9770
	sth	%l6,[%o3+%g0]		! Mem[0000000021800000] = 00009770
!	Mem[00000000100c1410] = ff000000, %l4 = 000000000000ff00
	swapa	[%i3+%o5]0x80,%l4	! %l4 = 00000000ff000000
!	%l4 = ff000000, %l5 = 00000069, Mem[0000000030001408] = 7569f2af 41737136
	stda	%l4,[%i0+%o4]0x89	! Mem[0000000030001408] = ff000000 00000069
!	Mem[0000000030041408] = ffffffff, %l2 = 0000000000000000
	swapa	[%i1+%o4]0x81,%l2	! %l2 = 00000000ffffffff
!	%l6 = 00000000ff000000, Mem[0000000030101400] = ff0000002e43aea4
	stxa	%l6,[%i4+%g0]0x81	! Mem[0000000030101400] = 00000000ff000000
!	Mem[00000000100c1400] = ff000000, %l7 = 000000000000ff00
	swapa	[%i3+%g0]0x80,%l7	! %l7 = 00000000ff000000
!	%l0 = 00000000ffffffff, Mem[0000000030081410] = 000000ff
	stba	%l0,[%i2+%o5]0x81	! Mem[0000000030081410] = ff0000ff
!	%f16 = 00000000 3cb98aff, Mem[0000000030101410] = ffffaea4 3f75c41d
	stda	%f16,[%i4+%o5]0x89	! Mem[0000000030101410] = 00000000 3cb98aff

p0_label_120:
!	Starting 10 instruction Load Burst
!	%l1 = 00000000c1bcec55, %l5 = 0000000000000069, %y  = 00000000
	umul	%l1,%l5,%l5		! %l5 = 0000004f767ceedd, %y = 0000004f
!	Mem[0000000010041404] = 00000000, %l1 = 00000000c1bcec55, %asi = 80
	lduba	[%i1+0x004]%asi,%l1	! %l1 = 0000000000000000
!	Mem[0000000030101410] = 000000003cb98aff, %f16 = 00000000 3cb98aff
	ldda	[%i4+%o5]0x89,%f16	! %f16 = 00000000 3cb98aff
!	Mem[00000000100c1410] = 0000000000ff0000, %f2  = f9725d59 00000000
	ldda	[%i3+%o5]0x88,%f2 	! %f2  = 00000000 00ff0000
!	Mem[0000000030101410] = 3cb98aff, %l0 = 00000000ffffffff
	lduha	[%i4+%o5]0x89,%l0	! %l0 = 0000000000008aff
!	Mem[0000000030181410] = e739fb13 00000046, %l0 = 00008aff, %l1 = 00000000
	ldda	[%i6+%o5]0x89,%l0	! %l0 = 0000000000000046 00000000e739fb13
!	Mem[00000000100c1408] = 00004600, %l2 = 00000000ffffffff
	lduwa	[%i3+%o4]0x80,%l2	! %l2 = 0000000000004600
!	Mem[00000000100c1408] = 00004600, %l7 = 00000000ff000000
	ldsba	[%i3+%o4]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000030141408] = f9725d59 00000000, %l4 = ff000000, %l5 = 767ceedd
	ldda	[%i5+%o4]0x89,%l4	! %l4 = 0000000000000000 00000000f9725d59
!	Mem[0000000030081408] = 385c8a527014e739, %l2 = 0000000000004600
	ldxa	[%i2+%o4]0x89,%l2	! %l2 = 385c8a527014e739

p0_label_121:
!	Starting 10 instruction Store Burst
!	%l7 = 0000000000000000, Mem[0000000010041408] = 0000ff00
	stha	%l7,[%i1+%o4]0x88	! Mem[0000000010041408] = 00000000
!	Mem[00000000100c140f] = 55ecbcc1, %l2 = 385c8a527014e739
	ldstuba	[%i3+0x00f]%asi,%l2	! %l2 = 00000000000000c1
!	Mem[0000000030101400] = 00000000, %l4 = 0000000000000000
	swapa	[%i4+%g0]0x81,%l4	! %l4 = 0000000000000000
!	%l6 = 00000000ff000000, Mem[00000000300c1408] = 00000000
	stba	%l6,[%i3+%o4]0x89	! Mem[00000000300c1408] = 00000000
!	%l2 = 000000c1, %l3 = ff000000, Mem[0000000030141408] = 00000000 f9725d59
	stda	%l2,[%i5+%o4]0x89	! Mem[0000000030141408] = 000000c1 ff000000
!	%l0 = 0000000000000046, Mem[00000000201c0000] = 006956b0, %asi = 80
	stha	%l0,[%o0+0x000]%asi	! Mem[00000000201c0000] = 004656b0
!	Mem[00000000201c0000] = 004656b0, %l0 = 0000000000000046
	ldstuba	[%o0+0x000]%asi,%l0	! %l0 = 0000000000000000
!	%l3 = ffffffffff000000, Mem[0000000010141400] = 00000000
	stha	%l3,[%i5+%g0]0x80	! Mem[0000000010141400] = 00000000
!	%f31 = 023c9854, Mem[0000000010141418] = 7e45eefa
	st	%f31,[%i5+0x018]	! Mem[0000000010141418] = 023c9854
!	%l2 = 00000000000000c1, Mem[00000000100c1430] = 000000000e6afda5
	stx	%l2,[%i3+0x030]		! Mem[00000000100c1430] = 00000000000000c1

p0_label_122:
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = c9db38ff, %l4 = 0000000000000000
	ldsha	[%i1+%o5]0x89,%l4	! %l4 = 00000000000038ff
!	Mem[00000000300c1400] = 83ef6c19 00000000, %l2 = 000000c1, %l3 = ff000000
	ldda	[%i3+%g0]0x89,%l2	! %l2 = 0000000000000000 0000000083ef6c19
!	%l3 = 0000000083ef6c19, %l5 = 00000000f9725d59, %l0 = 0000000000000000
	add	%l3,%l5,%l0		! %l0 = 000000017d61c972
!	Mem[00000000100c1436] = 000000c1, %l5 = 00000000f9725d59
	ldsb	[%i3+0x036],%l5		! %l5 = 0000000000000000
!	Mem[0000000010041408] = 00000000, %l1 = 00000000e739fb13
	ldsba	[%i1+%o4]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010081418] = 465c9153 000000ff, %l2 = 00000000, %l3 = 83ef6c19, %asi = 80
	ldda	[%i2+0x018]%asi,%l2	! %l2 = 00000000465c9153 00000000000000ff
!	Mem[00000000100c1400] = 00ff0000, %l1 = 0000000000000000
	ldsha	[%i3+%g0]0x88,%l1	! %l1 = 0000000000000000
!	Mem[00000000100c1400] = 00ff0000, %l3 = 00000000000000ff
	lduwa	[%i3+%g0]0x88,%l3	! %l3 = 0000000000ff0000
!	Mem[0000000010001408] = 00000000, %l5 = 0000000000000000
	ldsha	[%i0+%o4]0x80,%l5	! %l5 = 0000000000000000
!	%l2 = 00000000465c9153, Mem[0000000010181410] = 156b9100
	stwa	%l2,[%i6+%o5]0x80	! Mem[0000000010181410] = 465c9153

p0_label_123:
!	Starting 10 instruction Store Burst
!	Mem[0000000010001408] = 00000000, %l7 = 0000000000000000
	ldstuba	[%i0+%o4]0x88,%l7	! %l7 = 0000000000000000
!	%l5 = 0000000000000000, Mem[0000000030041400] = 3cb98aff
	stba	%l5,[%i1+%g0]0x89	! Mem[0000000030041400] = 3cb98a00
!	%l5 = 0000000000000000, Mem[0000000010001400] = 00000000
	stwa	%l5,[%i0+%g0]0x80	! Mem[0000000010001400] = 00000000
!	Mem[00000000100c1426] = 00000062, %l4 = 00000000000038ff
	ldstub	[%i3+0x026],%l4		! %l4 = 0000000000000000
!	Mem[0000000030181400] = f95d72f9, %l7 = 0000000000000000
	ldstuba	[%i6+%g0]0x81,%l7	! %l7 = 00000000000000f9
!	%f6  = ff000000 00000000, Mem[0000000030101408] = 1dffffff ffffe739
	stda	%f6 ,[%i4+%o4]0x89	! Mem[0000000030101408] = ff000000 00000000
!	Mem[0000000010141400] = 00000000, %l1 = 0000000000000000
	ldstuba	[%i5+%g0]0x88,%l1	! %l1 = 0000000000000000
!	Mem[000000001014142c] = 0538bcc9, %l3 = 00ff0000, %l1 = 00000000
	add	%i5,0x2c,%g1
	casa	[%g1]0x80,%l3,%l1	! %l1 = 000000000538bcc9
!	%f0  = 00000000 00000000, Mem[00000000300c1408] = 00000000 47624eca
	stda	%f0 ,[%i3+%o4]0x89	! Mem[00000000300c1408] = 00000000 00000000
!	%l7 = 00000000000000f9, Mem[0000000010041400] = 00000000
	stwa	%l7,[%i1+%g0]0x80	! Mem[0000000010041400] = 000000f9

p0_label_124:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = ffbcec5500460000, %f16 = 00000000 3cb98aff
	ldda	[%i3+%o4]0x88,%f16	! %f16 = ffbcec55 00460000
!	Mem[00000000211c0001] = 58124d40, %l2 = 00000000465c9153, %asi = 80
	lduba	[%o2+0x001]%asi,%l2	! %l2 = 0000000000000012
!	Mem[0000000010101410] = ff38dbc9, %l2 = 0000000000000012
	ldsha	[%i4+%o5]0x80,%l2	! %l2 = ffffffffffffff38
!	%f22 = 53915c46, %f0  = 00000000, %f26 = ff000000 00000000
	fsmuld	%f22,%f0 ,%f26		! %f26 = 00000000 00000000
!	Mem[0000000030001410] = ffffffff, %l5 = 0000000000000000
	lduha	[%i0+%o5]0x89,%l5	! %l5 = 000000000000ffff
!	Mem[0000000010001410] = 1200790b ff000000, %l4 = 00000000, %l5 = 0000ffff
	ldda	[%i0+%o5]0x80,%l4	! %l4 = 000000001200790b 00000000ff000000
!	Mem[0000000010101408] = c1bcec55 ffffffff, %l2 = ffffff38, %l3 = 00ff0000
	ldda	[%i4+%o4]0x88,%l2	! %l2 = 00000000ffffffff 00000000c1bcec55
!	Mem[00000000100c1408] = 00460000, %l3 = 00000000c1bcec55
	lduha	[%i3+%o4]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000020800000] = ffff2ce0, %l4 = 000000001200790b
	lduh	[%o1+%g0],%l4		! %l4 = 000000000000ffff
!	Mem[0000000010181400] = ff00000000000000, %l4 = 000000000000ffff
	ldxa	[%i6+%g0]0x88,%l4	! %l4 = ff00000000000000

p0_label_125:
!	Starting 10 instruction Store Burst
!	%f12 = ef83ffff ffffffff, %l0 = 000000017d61c972
!	Mem[0000000030181408] = 582b0ee300000000
	add	%i6,0x008,%g1
	stda	%f12,[%g1+%l0]ASI_PST32_S ! Mem[0000000030181408] = ef83ffff00000000
!	%f0  = 00000000 00000000, Mem[0000000030101410] = 3cb98aff 00000000
	stda	%f0 ,[%i4+%o5]0x89	! Mem[0000000030101410] = 00000000 00000000
!	%l7 = 00000000000000f9, Mem[00000000201c0000] = ff4656b0
	sth	%l7,[%o0+%g0]		! Mem[00000000201c0000] = 00f956b0
!	%f24 = 6968571c 2a030000, %l0 = 000000017d61c972
!	Mem[0000000030081418] = 00000000000000ff
	add	%i2,0x018,%g1
	stda	%f24,[%g1+%l0]ASI_PST16_S ! Mem[0000000030081418] = 000000002a0300ff
!	Mem[00000000300c1410] = 00ff0000, %l5 = 00000000ff000000
	ldstuba	[%i3+%o5]0x81,%l5	! %l5 = 0000000000000000
!	Mem[00000000201c0000] = 00f956b0, %l6 = 00000000ff000000
	ldstub	[%o0+%g0],%l6		! %l6 = 0000000000000000
!	Mem[0000000010001400] = 00000000, %l1 = 000000000538bcc9
	ldstuba	[%i0+%g0]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000030101400] = 00000000, %l4 = 0000000000000000
	swapa	[%i4+%g0]0x81,%l4	! %l4 = 0000000000000000
!	%l5 = 0000000000000000, Mem[0000000010001410] = 0b790012
	stha	%l5,[%i0+%o5]0x88	! Mem[0000000010001410] = 0b790000
!	Mem[00000000300c1408] = 00000000, %l0 = 000000017d61c972
	ldstuba	[%i3+%o4]0x89,%l0	! %l0 = 0000000000000000

p0_label_126:
!	Starting 10 instruction Load Burst
!	Mem[00000000218001c0] = 48ff2ec0, %l1 = 0000000000000000
	ldsh	[%o3+0x1c0],%l1		! %l1 = 00000000000048ff
!	Mem[00000000100c1423] = 00000000, %l3 = 0000000000000000
	ldub	[%i3+0x023],%l3		! %l3 = 0000000000000000
!	%l6 = 0000000000000000, immd = ffffffffffffff8c, %l108 = 0000000000000002
	sdivx	%l6,-0x074,%l2		! %l2 = 0000000000000000
!	Mem[0000000010101400] = 00000000, %l4 = 0000000000000000
	lduba	[%i4+%g0]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000010001400] = 000000ff, %l4 = 0000000000000000
	ldswa	[%i0+%g0]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010001400] = 00000000000000ff, %l1 = 00000000000048ff
	ldxa	[%i0+%g0]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030181408] = ffff83ef, %l3 = 0000000000000000
	ldsba	[%i6+%o4]0x89,%l3	! %l3 = ffffffffffffffef
!	Mem[0000000030041410] = ff38dbc9, %l0 = 0000000000000000
	lduwa	[%i1+%o5]0x81,%l0	! %l0 = 00000000ff38dbc9
!	%f4  = 1200790b, %f3  = 00ff0000, %f30 = cb62e463
	fsubs	%f4 ,%f3 ,%f30		! %f30 = 1200790b
!	Mem[0000000010141410] = 000039e7, %f23 = 2ac4c541
	lda	[%i5+%o5]0x88,%f23	! %f23 = 000039e7

p0_label_127:
!	Starting 10 instruction Store Burst
!	%f14 = cb62e463, Mem[0000000030081410] = ff0000ff
	sta	%f14,[%i2+%o5]0x81	! Mem[0000000030081410] = cb62e463
!	Mem[0000000010181408] = 0000032a, %l1 = 00000000000000ff
	ldstuba	[%i6+%o4]0x80,%l1	! %l1 = 0000000000000000
!	%f20 = 00000000 c9db38ff, %l3 = ffffffffffffffef
!	Mem[0000000010041400] = 000000f900000000
	stda	%f20,[%i1+%l3]ASI_PST32_P ! Mem[0000000010041400] = 00000000c9db38ff
!	%f11 = 36717341, Mem[0000000030101410] = 00000000
	sta	%f11,[%i4+%o5]0x89	! Mem[0000000030101410] = 36717341
!	Mem[0000000021800140] = 01ff4e60, %l0 = 00000000ff38dbc9
	ldstub	[%o3+0x140],%l0		! %l0 = 0000000000000001
!	%f20 = 00000000 c9db38ff, Mem[0000000010141408] = 00000000 00000000
	stda	%f20,[%i5+%o4]0x88	! Mem[0000000010141408] = 00000000 c9db38ff
!	Mem[0000000010001408] = ff000000, %l4 = 00000000000000ff
	swapa	[%i0+%o4]0x80,%l4	! %l4 = 00000000ff000000
!	%f8  = 6968571c, Mem[0000000010141410] = 000039e7
	sta	%f8 ,[%i5+%o5]0x88	! Mem[0000000010141410] = 6968571c
!	%l4 = 00000000ff000000, imm = 00000000000004ca, %l3 = ffffffffffffffef
	or	%l4,0x4ca,%l3		! %l3 = 00000000ff0004ca
!	Mem[00000000100c1408] = 00004600, %l2 = 0000000000000000
	swapa	[%i3+%o4]0x80,%l2	! %l2 = 0000000000004600

p0_label_128:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = 000000ff, %l3 = 00000000ff0004ca
	lduha	[%i0+%o4]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000010181400] = ff00000000000000, %f2  = 00000000 00ff0000
	ldda	[%i6+%g0]0x88,%f2 	! %f2  = ff000000 00000000
!	Mem[0000000010101408] = ffffffff, %l6 = 0000000000000000
	ldsha	[%i4+%o4]0x80,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000030141400] = 00000000, %l3 = 0000000000000000
	ldsba	[%i5+%g0]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000020800000] = ffff2ce0, %l7 = 00000000000000f9, %asi = 80
	lduha	[%o1+0x000]%asi,%l7	! %l7 = 000000000000ffff
!	Mem[0000000030101408] = 00000000, %l4 = 00000000ff000000
	lduha	[%i4+%o4]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000030081400] = 00000000 000000ff, %l0 = 00000001, %l1 = 00000000
	ldda	[%i2+%g0]0x89,%l0	! %l0 = 00000000000000ff 0000000000000000
!	Code Fragment 4, seed = 653218
p0_fragment_17:
!	%l0 = 00000000000000ff
	setx	0xd1b46073e51afd16,%g7,%l0 ! %l0 = d1b46073e51afd16
!	%l1 = 0000000000000000
	setx	0x83666fe933c0de41,%g7,%l1 ! %l1 = 83666fe933c0de41
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = d1b46073e51afd16
	setx	0xfb488a7e9ff8937c,%g7,%l0 ! %l0 = fb488a7e9ff8937c
!	%l1 = 83666fe933c0de41
	setx	0x2b935eb678b71fc7,%g7,%l1 ! %l1 = 2b935eb678b71fc7
p0_fragment_17_end:
!	Mem[0000000030001408] = 000000ff69000000, %l3 = 0000000000000000
	ldxa	[%i0+%o4]0x81,%l3	! %l3 = 000000ff69000000
!	Mem[0000000021800100] = e7399830, %l3 = 000000ff69000000, %asi = 80
	ldsha	[%o3+0x100]%asi,%l3	! %l3 = ffffffffffffe739

p0_label_129:
!	Starting 10 instruction Store Burst
!	Mem[0000000010141424] = e7396e79, %l7 = 000000000000ffff
	ldstuba	[%i5+0x024]%asi,%l7	! %l7 = 00000000000000e7
!	%l4 = 00000000, %l5 = 00000000, Mem[0000000030001400] = 00000000 47624eca
	stda	%l4,[%i0+%g0]0x81	! Mem[0000000030001400] = 00000000 00000000
!	%f8  = 6968571c, Mem[0000000010101410] = c9db38ff
	sta	%f8 ,[%i4+%o5]0x88	! Mem[0000000010101410] = 6968571c
!	%f12 = ef83ffff ffffffff, %l2 = 0000000000004600
!	Mem[0000000030001408] = 000000ff69000000
	add	%i0,0x008,%g1
	stda	%f12,[%g1+%l2]ASI_PST8_S ! Mem[0000000030001408] = 000000ff69000000
!	%l7 = 00000000000000e7, Mem[0000000010181400] = 00000000
	stba	%l7,[%i6+%g0]0x80	! Mem[0000000010181400] = e7000000
!	%l7 = 00000000000000e7, Mem[000000001018140c] = 55ecbcc1, %asi = 80
	stba	%l7,[%i6+0x00c]%asi	! Mem[000000001018140c] = e7ecbcc1
!	Mem[0000000010181410] = 53915c46, %l0 = fb488a7e9ff8937c
	ldstuba	[%i6+%o5]0x88,%l0	! %l0 = 0000000000000046
!	Mem[0000000010101408] = ffffffff, %l0 = 0000000000000046
	swapa	[%i4+%o4]0x88,%l0	! %l0 = 00000000ffffffff
!	%l1 = 2b935eb678b71fc7, Mem[000000001018141a] = 41c5c42a, %asi = 80
	stha	%l1,[%i6+0x01a]%asi	! Mem[0000000010181418] = 41c51fc7
!	Mem[0000000010101400] = 00000000, %l4 = 0000000000000000
	ldstuba	[%i4+%g0]0x80,%l4	! %l4 = 0000000000000000

p0_label_130:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = 0000ff00, %l6 = ffffffffffffffff
	ldsba	[%i3+%o5]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000010041400] = ff38dbc900000000, %l0 = 00000000ffffffff
	ldxa	[%i1+%g0]0x88,%l0	! %l0 = ff38dbc900000000
!	Mem[0000000010081400] = 00000000 00000000, %l4 = 00000000, %l5 = 00000000
	ldda	[%i2+%g0]0x88,%l4	! %l4 = 0000000000000000 0000000000000000
!	Mem[00000000100c1408] = ffbcec55 00000000, %l4 = 00000000, %l5 = 00000000
	ldda	[%i3+%o4]0x88,%l4	! %l4 = 0000000000000000 00000000ffbcec55
!	Mem[0000000010101400] = 00000000000000ff, %f24 = 6968571c 2a030000
	ldda	[%i4+%g0]0x88,%f24	! %f24 = 00000000 000000ff
!	Mem[0000000010181400] = 000000e7, %l0 = ff38dbc900000000
	ldsba	[%i6+%g0]0x88,%l0	! %l0 = ffffffffffffffe7
!	Mem[0000000030081400] = ff000000, %l5 = 00000000ffbcec55
	lduha	[%i2+%g0]0x81,%l5	! %l5 = 000000000000ff00
!	Mem[0000000010181408] = 2a0300ff, %f1  = 00000000
	lda	[%i6+%o4]0x88,%f1 	! %f1 = 2a0300ff
!	Mem[0000000010001400] = ff000000, %f20 = 00000000
	lda	[%i0+%g0]0x80,%f20	! %f20 = ff000000
!	Mem[0000000010001400] = 00000000 000000ff, %l6 = 00000000, %l7 = 000000e7
	ldda	[%i0+%g0]0x88,%l6	! %l6 = 00000000000000ff 0000000000000000

p0_label_131:
!	Starting 10 instruction Store Burst
!	Code Fragment 3, seed = 624180
p0_fragment_18:
!	%l0 = ffffffffffffffe7
	setx	0x38902e883c8bba86,%g7,%l0 ! %l0 = 38902e883c8bba86
!	%l1 = 2b935eb678b71fc7
	setx	0x3a21ba374d35e0b1,%g7,%l1 ! %l1 = 3a21ba374d35e0b1
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 38902e883c8bba86
	setx	0x0eaa70866562caec,%g7,%l0 ! %l0 = 0eaa70866562caec
!	%l1 = 3a21ba374d35e0b1
	setx	0xf3ced5af37f47c37,%g7,%l1 ! %l1 = f3ced5af37f47c37
p0_fragment_18_end:
!	Mem[0000000010041408] = 00000000, %l7 = 0000000000000000
	swapa	[%i1+%o4]0x80,%l7	! %l7 = 0000000000000000
!	%l2 = 00004600, %l3 = ffffe739, Mem[0000000010001430] = ef83ffff ffffffff
	std	%l2,[%i0+0x030]		! Mem[0000000010001430] = 00004600 ffffe739
!	%l3 = ffffffffffffe739, Mem[00000000201c0000] = fff956b0
	sth	%l3,[%o0+%g0]		! Mem[00000000201c0000] = e73956b0
!	Mem[0000000010141408] = c9db38ff, %l4 = 0000000000000000
	swapa	[%i5+%o4]0x88,%l4	! %l4 = 00000000c9db38ff
!	Mem[00000000300c1400] = 00000000, %l1 = f3ced5af37f47c37
	ldstuba	[%i3+%g0]0x89,%l1	! %l1 = 0000000000000000
!	%l6 = 00000000000000ff, Mem[0000000010181429] = 00000000
	stb	%l6,[%i6+0x029]		! Mem[0000000010181428] = 00ff0000
!	Mem[0000000010041410] = 00000000, %l3 = ffffffffffffe739
	ldstuba	[%i1+%o5]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000030101400] = 00000000 ff000000 00000000 000000ff
!	%f0  = 00000000 2a0300ff ff000000 00000000
!	%f4  = 1200790b ff000000 ff000000 00000000
!	%f8  = 6968571c ffc3fcff aff26975 36717341
!	%f12 = ef83ffff ffffffff cb62e463 0000ff00
	stda	%f0 ,[%i4+%g0]ASI_BLK_SL	! Block Store to 0000000030101400
!	%l3 = 0000000000000000, Mem[0000000010181400] = e7000000000000ff, %asi = 80
	stxa	%l3,[%i6+0x000]%asi	! Mem[0000000010181400] = 0000000000000000

p0_label_132:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = 000000ff, %l4 = 00000000c9db38ff
	ldsba	[%i0+%o4]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000030081410] = 63e462cb, %l5 = 000000000000ff00
	ldswa	[%i2+%o5]0x89,%l5	! %l5 = 0000000063e462cb
!	%f28 = a5fd6a0e, %f3  = 00000000, %f16 = ffbcec55
	fmuls	%f28,%f3 ,%f16		! %f16 = 80000000
!	Mem[0000000010041408] = 00000000000000ff, %l5 = 0000000063e462cb
	ldxa	[%i1+%o4]0x80,%l5	! %l5 = 00000000000000ff
	membar	#Sync			! Added by membar checker (27)
!	Mem[0000000030001400] = 00000000 00000000 000000ff 69000000
!	Mem[0000000030001410] = ffffffff c43da825 0da36aca 2f5af973
!	Mem[0000000030001420] = 757fa85b 2618b889 4df959d6 375e54cf
!	Mem[0000000030001430] = 5552b444 66ede8c5 11d206a2 02e7deeb
	ldda	[%i0+%g0]ASI_BLK_AIUSL,%f0 	! Block Load from 0000000030001400
!	Mem[00000000100c1400] = 0000ff00, %l1 = 0000000000000000
	lduha	[%i3+%g0]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000010101408] = 00000046, %l3 = 0000000000000000
	ldsha	[%i4+%o4]0x88,%l3	! %l3 = 0000000000000046
!	Mem[0000000030101408] = 00000000, %l3 = 0000000000000046
	ldsba	[%i4+%o4]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000010001410] = 000000ff0b790000, %f28 = a5fd6a0e 00000000
	ldda	[%i0+%o5]0x88,%f28	! %f28 = 000000ff 0b790000
!	Mem[0000000020800040] = 00007f10, %l2 = 0000000000004600, %asi = 80
	ldsha	[%o1+0x040]%asi,%l2	! %l2 = 0000000000000000

p0_label_133:
!	Starting 10 instruction Store Burst
!	%l7 = 0000000000000000, Mem[0000000010181410] = ff5c9153
	stba	%l7,[%i6+%o5]0x80	! Mem[0000000010181410] = 005c9153
!	%f8  = 89b81826, %f20 = ff000000
	fsqrts	%f8 ,%f20		! %f20 = 7fffffff
!	%l2 = 00000000, %l3 = 00000000, Mem[00000000100c1408] = 00000000 55ecbcff
	stda	%l2,[%i3+%o4]0x80	! Mem[00000000100c1408] = 00000000 00000000
!	Mem[0000000010141408] = 00000000, %l4 = 0000000000000000
	swapa	[%i5+%o4]0x80,%l4	! %l4 = 0000000000000000
!	%l3 = 0000000000000000, Mem[0000000020800040] = 00007f10, %asi = 80
	stha	%l3,[%o1+0x040]%asi	! Mem[0000000020800040] = 00007f10
!	Mem[0000000010041414] = 00000055, %l0 = 000000006562caec, %asi = 80
	swapa	[%i1+0x014]%asi,%l0	! %l0 = 0000000000000055
!	Mem[0000000010081439] = 54983c02, %l6 = 00000000000000ff
	ldstub	[%i2+0x039],%l6		! %l6 = 0000000000000098
!	%f8  = 89b81826 5ba87f75, Mem[0000000010041408] = 00000000 000000ff
	std	%f8 ,[%i1+%o4]		! Mem[0000000010041408] = 89b81826 5ba87f75
!	Mem[0000000010081410] = 00000000, %l2 = 0000000000000000
	swapa	[%i2+%o5]0x88,%l2	! %l2 = 0000000000000000
!	%l5 = 00000000000000ff, Mem[0000000021800000] = 00009770, %asi = 80
	stha	%l5,[%o3+0x000]%asi	! Mem[0000000021800000] = 00ff9770

p0_label_134:
!	Starting 10 instruction Load Burst
!	%f21 = c9db38ff, %f31 = 023c9854, %f28 = 000000ff
	fadds	%f21,%f31,%f28		! %f28 = c9db38ff
!	Mem[0000000010181400] = 00000000, %l5 = 00000000000000ff
	lduha	[%i6+%g0]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000010041408] = 2618b889, %l2 = 0000000000000000
	lduba	[%i1+%o4]0x88,%l2	! %l2 = 0000000000000089
!	Mem[0000000010101410] = 1c576869, %l3 = 0000000000000000
	lduba	[%i4+%o5]0x80,%l3	! %l3 = 000000000000001c
!	Mem[00000000300c1410] = ffff0000595d72f9, %l0 = 0000000000000055
	ldxa	[%i3+%o5]0x81,%l0	! %l0 = ffff0000595d72f9
!	Mem[00000000100c1408] = 0000000000000000, %l1 = 0000000000000000
	ldxa	[%i3+%o4]0x88,%l1	! %l1 = 0000000000000000
!	Mem[00000000300c1410] = 0000ffff, %l2 = 0000000000000089
	ldswa	[%i3+%o5]0x89,%l2	! %l2 = 000000000000ffff
!	Mem[0000000030181400] = ff5d72f9 7014e739, %l4 = 00000000, %l5 = 00000000
	ldda	[%i6+%g0]0x81,%l4	! %l4 = 00000000ff5d72f9 000000007014e739
!	Mem[00000000100c1412] = 0000ff00, %l4 = 00000000ff5d72f9, %asi = 80
	lduba	[%i3+0x012]%asi,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030081410] = 63e462cb, %l6 = 0000000000000098
	ldsha	[%i2+%o5]0x89,%l6	! %l6 = 00000000000062cb

p0_label_135:
!	Starting 10 instruction Store Burst
!	Mem[0000000030101410] = 000000ff, %l7 = 0000000000000000
	ldstuba	[%i4+%o5]0x81,%l7	! %l7 = 0000000000000000
!	%l3 = 000000000000001c, Mem[0000000010101400] = 00000000000000ff
	stxa	%l3,[%i4+%g0]0x88	! Mem[0000000010101400] = 000000000000001c
!	%f4  = 25a83dc4 ffffffff, %l5 = 000000007014e739
!	Mem[00000000100c1428] = cadbff0000ff0000
	add	%i3,0x028,%g1
	stda	%f4,[%g1+%l5]ASI_PST32_P ! Mem[00000000100c1428] = cadbff00ffffffff
!	%l6 = 00000000000062cb, imm = 000000000000045c, %l0 = ffff0000595d72f9
	xor	%l6,0x45c,%l0		! %l0 = 0000000000006697
!	%l4 = 00000000000000ff, Mem[0000000010141414] = 00000000, %asi = 80
	stha	%l4,[%i5+0x014]%asi	! Mem[0000000010141414] = 00ff0000
!	Mem[000000001000143b] = cb62e463, %l6 = 00000000000062cb
	ldstub	[%i0+0x03b],%l6		! %l6 = 0000000000000063
!	Mem[0000000010001408] = 000000ff, %l6 = 0000000000000063
	ldstuba	[%i0+%o4]0x80,%l6	! %l6 = 0000000000000000
	membar	#Sync			! Added by membar checker (28)
!	%l6 = 00000000, %l7 = 00000000, Mem[0000000030001400] = 00000000 00000000
	stda	%l6,[%i0+%g0]0x81	! Mem[0000000030001400] = 00000000 00000000
!	%l3 = 000000000000001c, immd = 00000c85, %y  = 0000004f
	smul	%l3,0xc85,%l1		! %l1 = 0000000000015e8c, %y = 00000000
!	%f8  = 89b81826 5ba87f75, Mem[0000000010081408] = 1200790b ff000000
	stda	%f8 ,[%i2+%o4]0x80	! Mem[0000000010081408] = 89b81826 5ba87f75

p0_label_136:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181430] = 595d72f9ff000000, %f10 = cf545e37 d659f94d
	ldd	[%i6+0x030],%f10	! %f10 = 595d72f9 ff000000
!	Mem[00000000218000c0] = 33eb5e00, %l3 = 000000000000001c, %asi = 80
	ldsha	[%o3+0x0c0]%asi,%l3	! %l3 = 00000000000033eb
!	%f17 = 00460000, %f28 = c9db38ff, %f26 = 00000000
	fdivs	%f17,%f28,%f26		! tt=0x22, %l0 = 00000000000066b9
!	Mem[0000000010141408] = 00000000, %l7 = 0000000000000000
	ldsha	[%i5+%o4]0x88,%l7	! %l7 = 0000000000000000
!	Mem[00000000300c1410] = 0000ffff, %l3 = 00000000000033eb
	ldsba	[%i3+%o5]0x89,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010041400] = 00000000, %f17 = 00460000
	lda	[%i1+%g0]0x88,%f17	! %f17 = 00000000
!	Mem[0000000010041400] = 00000000, %l7 = 0000000000000000
	lduha	[%i1+%g0]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000010141410] = 1c57686900ff0000, %f24 = 00000000 000000ff
	ldda	[%i5+%o5]0x80,%f24	! %f24 = 1c576869 00ff0000
!	Mem[0000000030041400] = 008ab93c 00000000, %l2 = 0000ffff, %l3 = ffffffff
	ldda	[%i1+%g0]0x81,%l2	! %l2 = 00000000008ab93c 0000000000000000
!	Mem[0000000010081410] = 00000000, %l3 = 0000000000000000
	ldswa	[%i2+%o5]0x80,%l3	! %l3 = 0000000000000000

p0_label_137:
!	Starting 10 instruction Store Burst
!	%f2  = 00000069 ff000000, Mem[0000000010001410] = 0b790000 000000ff
	stda	%f2 ,[%i0+%o5]0x88	! Mem[0000000010001410] = 00000069 ff000000
!	Mem[0000000010001408] = ff0000ff, %l2 = 00000000008ab93c
	ldstuba	[%i0+%o4]0x88,%l2	! %l2 = 00000000000000ff
!	%f8  = 89b81826, Mem[0000000010101408] = 00000046
	sta	%f8 ,[%i4+%o4]0x88	! Mem[0000000010101408] = 89b81826
!	Mem[000000001000143c] = 0000ff00, %l6 = 0000000000000000
	ldstuba	[%i0+0x03c]%asi,%l6	! %l6 = 0000000000000000
!	Mem[0000000030001410] = ffffffff, %l1 = 0000000000015e8c
	swapa	[%i0+%o5]0x89,%l1	! %l1 = 00000000ffffffff
!	Mem[0000000030001410] = 00015e8c, %l1 = 00000000ffffffff
	ldstuba	[%i0+%o5]0x89,%l1	! %l1 = 000000000000008c
!	%l0 = 000066b9, %l1 = 0000008c, Mem[0000000030041408] = 00000000 55ecbcc1
	stda	%l0,[%i1+%o4]0x81	! Mem[0000000030041408] = 000066b9 0000008c
!	Mem[0000000030141410] = 000000ff, %l1 = 000000000000008c
	swapa	[%i5+%o5]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010181400] = 0000000000000000, %l2 = 00000000000000ff, %l1 = 00000000000000ff
	casxa	[%i6]0x80,%l2,%l1	! %l1 = 0000000000000000
!	Mem[0000000010081430] = 2e43aea40e6afda5, %l3 = 0000000000000000, %l6 = 0000000000000000
	add	%i2,0x30,%g1
	casxa	[%g1]0x80,%l3,%l6	! %l6 = 2e43aea40e6afda5

p0_label_138:
!	Starting 10 instruction Load Burst
!	Mem[000000001018140d] = e7ecbcc1, %l0 = 00000000000066b9
	ldub	[%i6+0x00d],%l0		! %l0 = 00000000000000ec
!	Mem[0000000010141400] = 000000ff, %l3 = 0000000000000000
	lduwa	[%i5+%g0]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030141408] = 000000c1, %l6 = 2e43aea40e6afda5
	lduha	[%i5+%o4]0x89,%l6	! %l6 = 00000000000000c1
!	Mem[0000000030041400] = 008ab93c, %l1 = 0000000000000000
	ldswa	[%i1+%g0]0x81,%l1	! %l1 = 00000000008ab93c
!	Mem[00000000211c0001] = 58124d40, %l6 = 00000000000000c1, %asi = 80
	ldsba	[%o2+0x001]%asi,%l6	! %l6 = 0000000000000012
!	Mem[0000000010081430] = 2e43aea4, %l4 = 00000000000000ff
	lduw	[%i2+0x030],%l4		! %l4 = 000000002e43aea4
!	Mem[0000000010141418] = 023c9854, %l0 = 00000000000000ec
	ldsw	[%i5+0x018],%l0		! %l0 = 00000000023c9854
!	Mem[0000000030101410] = ff0000ff, %l6 = 0000000000000012
	ldsba	[%i4+%o5]0x81,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000030141408] = c1000000000000ff, %f10 = 595d72f9 ff000000
	ldda	[%i5+%o4]0x81,%f10	! %f10 = c1000000 000000ff
!	Mem[0000000010141414] = 00ff0000, %f28 = c9db38ff
	lda	[%i5+0x014]%asi,%f28	! %f28 = 00ff0000

p0_label_139:
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1438] = 00000000, %l1 = 008ab93c, %l1 = 008ab93c
	add	%i3,0x38,%g1
	casa	[%g1]0x80,%l1,%l1	! %l1 = 0000000000000000
!	Mem[0000000010141418] = 023c9854, %l4 = 000000002e43aea4
	swap	[%i5+0x018],%l4		! %l4 = 00000000023c9854
!	%l2 = 000000ff, %l3 = 000000ff, Mem[00000000100c1438] = 00000000 595d72f9, %asi = 80
	stda	%l2,[%i3+0x038]%asi	! Mem[00000000100c1438] = 000000ff 000000ff
!	%l6 = ffffffffffffffff, Mem[0000000030101400] = ff00032a
	stba	%l6,[%i4+%g0]0x81	! Mem[0000000030101400] = ff00032a
!	%f12 = c5e8ed66 44b45255, %f18 = c1bcec55 ffffffff
	fxtod	%f12,%f18		! %f18 = c3cd0b89 4cdda5d7
!	%f8  = 89b81826 5ba87f75, Mem[0000000030101408] = 00000000 ff000000
	stda	%f8 ,[%i4+%o4]0x89	! Mem[0000000030101408] = 89b81826 5ba87f75
!	Mem[0000000010041400] = 00000000, %l7 = 0000000000000000
	swapa	[%i1+%g0]0x80,%l7	! %l7 = 0000000000000000
!	%l2 = 00000000000000ff, Mem[000000001000140a] = ff0000ff
	sth	%l2,[%i0+0x00a]		! Mem[0000000010001408] = ff0000ff
!	Mem[00000000211c0000] = 58124d40, %l6 = ffffffffffffffff
	ldstub	[%o2+%g0],%l6		! %l6 = 0000000000000058
!	%l4 = 00000000023c9854, Mem[0000000030181400] = f9725dff
	stba	%l4,[%i6+%g0]0x89	! Mem[0000000030181400] = f9725d54

p0_label_140:
!	Starting 10 instruction Load Burst
!	%l7 = 0000000000000000, immd = 00000432, %y  = 00000000
	sdiv	%l7,0x432,%l4		! %l4 = 0000000000000000
	mov	%l0,%y			! %y = 023c9854
!	Mem[0000000010181400] = 00000000, %l0 = 00000000023c9854, %asi = 80
	lduwa	[%i6+0x000]%asi,%l0	! %l0 = 0000000000000000
!	Mem[0000000010181416] = 00000000, %l1 = 0000000000000000, %asi = 80
	lduba	[%i6+0x016]%asi,%l1	! %l1 = 0000000000000000
!	Mem[00000000211c0000] = ff124d40, %l1 = 0000000000000000
	lduh	[%o2+%g0],%l1		! %l1 = 000000000000ff12
!	Mem[0000000010081410] = f9725d5900000000, %l0 = 0000000000000000
	ldxa	[%i2+%o5]0x88,%l0	! %l0 = f9725d5900000000
!	%l0 = f9725d5900000000, immd = 0000000000000988, %l108 = 0000000000000001
	sdivx	%l0,0x988,%l1		! %l1 = ffff4ffc5d45aa64
!	Mem[0000000010081410] = 00000000595d72f9, %l3 = 00000000000000ff
	ldxa	[%i2+%o5]0x80,%l3	! %l3 = 00000000595d72f9
!	Mem[0000000010001400] = 000000ff, %l4 = 0000000000000000
	ldswa	[%i0+%g0]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010041428] = 7dd9eff6 0d783e6f, %l2 = 000000ff, %l3 = 595d72f9, %asi = 80
	ldda	[%i1+0x028]%asi,%l2	! %l2 = 000000007dd9eff6 000000000d783e6f
!	Mem[0000000030081408] = 39e71470, %f30 = 1200790b
	lda	[%i2+%o4]0x81,%f30	! %f30 = 39e71470

p0_label_141:
!	Starting 10 instruction Store Burst
!	%l2 = 7dd9eff6, %l3 = 0d783e6f, Mem[0000000010001428] = aff26975 36717341
	std	%l2,[%i0+0x028]		! Mem[0000000010001428] = 7dd9eff6 0d783e6f
!	Mem[0000000030101410] = ff0000ff, %l6 = 0000000000000058
	swapa	[%i4+%o5]0x81,%l6	! %l6 = 00000000ff0000ff
!	%l2 = 000000007dd9eff6, Mem[00000000100c1410] = 00ff0000
	stwa	%l2,[%i3+%o5]0x88	! Mem[00000000100c1410] = 7dd9eff6
!	%l6 = 00000000ff0000ff, %l2 = 000000007dd9eff6, %l3 = 000000000d783e6f
	addc	%l6,%l2,%l3		! %l3 = 000000017cd9f0f5
!	%f28 = 00ff0000 0b790000, %l3 = 000000017cd9f0f5
!	Mem[0000000030181438] = 0745e81a196cef83
	add	%i6,0x038,%g1
	stda	%f28,[%g1+%l3]ASI_PST32_SL ! Mem[0000000030181438] = 0000790b196cef83
!	%f22 = 53915c46, Mem[00000000300c1408] = 000000ff
	sta	%f22,[%i3+%o4]0x89	! Mem[00000000300c1408] = 53915c46
!	Mem[0000000030041410] = ff38dbc9, %l3 = 000000017cd9f0f5
	ldstuba	[%i1+%o5]0x81,%l3	! %l3 = 00000000000000ff
!	%l3 = 00000000000000ff, Mem[0000000021800000] = 00ff9770
	sth	%l3,[%o3+%g0]		! Mem[0000000021800000] = 00ff9770
!	%l1 = ffff4ffc5d45aa64, Mem[0000000030081410] = cb62e463
	stha	%l1,[%i2+%o5]0x81	! Mem[0000000030081410] = aa64e463
!	%f14 = ebdee702 a206d211, Mem[0000000010181400] = 00000000 00000000
	stda	%f14,[%i6+%g0]0x88	! Mem[0000000010181400] = ebdee702 a206d211

p0_label_142:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = 0000000000000000, %l5 = 000000007014e739
	ldxa	[%i3+%o4]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000030041400] = 3cb98a00, %l4 = 00000000000000ff
	ldswa	[%i1+%g0]0x89,%l4	! %l4 = 000000003cb98a00
!	Mem[0000000010141410] = 1c576869 00ff0000, %l6 = ff0000ff, %l7 = 00000000
	ldda	[%i5+%o5]0x80,%l6	! %l6 = 000000001c576869 0000000000ff0000
!	Mem[0000000030041408] = 000066b9, %l2 = 000000007dd9eff6
	ldsba	[%i1+%o4]0x81,%l2	! %l2 = 0000000000000000
!	Mem[00000000211c0000] = ff124d40, %l7 = 0000000000ff0000, %asi = 80
	lduha	[%o2+0x000]%asi,%l7	! %l7 = 000000000000ff12
!	Mem[00000000100c1420] = 00000000 0000ff62, %l6 = 1c576869, %l7 = 0000ff12
	ldd	[%i3+0x020],%l6		! %l6 = 0000000000000000 000000000000ff62
!	Mem[0000000030001410] = ff5e0100, %l3 = 00000000000000ff
	ldsba	[%i0+%o5]0x81,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010001400] = 000000ff, %l6 = 0000000000000000
	ldsha	[%i0+%g0]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030141410] = 00000000 0000008c, %l4 = 3cb98a00, %l5 = 00000000
	ldda	[%i5+%o5]0x89,%l4	! %l4 = 000000000000008c 0000000000000000
!	%l1 = ffff4ffc5d45aa64, Mem[00000000100c1438] = 000000ff, %asi = 80
	stwa	%l1,[%i3+0x038]%asi	! Mem[00000000100c1438] = 5d45aa64

p0_label_143:
!	Starting 10 instruction Store Burst
!	%l6 = 00000000000000ff, Mem[0000000010141400] = ff00000000000000
	stx	%l6,[%i5+%g0]		! Mem[0000000010141400] = 00000000000000ff
!	%l3 = ffffffffffffffff, Mem[0000000010141400] = 00000000
	stwa	%l3,[%i5+%g0]0x88	! Mem[0000000010141400] = ffffffff
!	%l6 = 00000000000000ff, immd = 00000f00, %y  = 023c9854
	sdiv	%l6,0xf00,%l1		! %l1 = 000000007fffffff
	mov	%l0,%y			! %y = 00000000
!	%l2 = 0000000000000000, Mem[0000000010041408] = 89b81826
	stwa	%l2,[%i1+%o4]0x80	! Mem[0000000010041408] = 00000000
!	%l0 = f9725d5900000000, Mem[0000000020800040] = 00007f10
	sth	%l0,[%o1+0x040]		! Mem[0000000020800040] = 00007f10
!	Mem[0000000030041400] = 008ab93c 00000000 000066b9 0000008c
!	%f16 = 80000000 00000000 c3cd0b89 4cdda5d7
!	%f20 = 7fffffff c9db38ff 53915c46 000039e7
!	%f24 = 1c576869 00ff0000 00000000 00000000
!	%f28 = 00ff0000 0b790000 39e71470 023c9854
	stda	%f16,[%i1+%g0]ASI_BLK_S	! Block Store to 0000000030041400
!	%l2 = 0000000000000000, Mem[00000000211c0001] = ff124d40
	stb	%l2,[%o2+0x001]		! Mem[00000000211c0000] = ff004d40
!	%l4 = 0000008c, %l5 = 00000000, Mem[0000000010101400] = 1c000000 00000000
	stda	%l4,[%i4+%g0]0x80	! Mem[0000000010101400] = 0000008c 00000000
!	%f29 = 0b790000, %f24 = 1c576869, %f10 = c1000000 000000ff
	fsmuld	%f29,%f24,%f10		! %f10 = 350a3091 c4200000
!	%f12 = c5e8ed66 44b45255, Mem[0000000030141408] = c1000000 000000ff
	stda	%f12,[%i5+%o4]0x81	! Mem[0000000030141408] = c5e8ed66 44b45255

p0_label_144:
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = ff5e0100c43da825, %l1 = 000000007fffffff
	ldxa	[%i0+%o5]0x81,%l1	! %l1 = ff5e0100c43da825
!	Mem[00000000100c1408] = 00000000, %l6 = 00000000000000ff
	ldsba	[%i3+%o4]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000030141400] = 00000000, %l6 = 0000000000000000
	ldswa	[%i5+%g0]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000030081408] = 7014e739, %l0 = f9725d5900000000
	ldswa	[%i2+%o4]0x89,%l0	! %l0 = 000000007014e739
!	Mem[0000000030081400] = ff000000, %l2 = 0000000000000000
	lduha	[%i2+%g0]0x81,%l2	! %l2 = 000000000000ff00
!	Mem[0000000030001410] = ff5e0100c43da825, %l6 = 0000000000000000
	ldxa	[%i0+%o5]0x81,%l6	! %l6 = ff5e0100c43da825
!	Mem[0000000010101410] = 000000006968571c, %l1 = ff5e0100c43da825
	ldxa	[%i4+%o5]0x88,%l1	! %l1 = 000000006968571c
!	Mem[0000000030181410] = 00000046, %l1 = 000000006968571c
	lduba	[%i6+%o5]0x89,%l1	! %l1 = 0000000000000046
!	Mem[0000000030001410] = 25a83dc400015eff, %f8  = 89b81826 5ba87f75
	ldda	[%i0+%o5]0x89,%f8 	! %f8  = 25a83dc4 00015eff
!	Mem[0000000010001400] = ff00000000000000, %f2  = 00000069 ff000000
	ldd	[%i0+%g0],%f2 		! %f2  = ff000000 00000000

p0_label_145:
!	Starting 10 instruction Store Burst
!	Mem[0000000030081400] = ff000000, %l2 = 000000000000ff00
	swapa	[%i2+%g0]0x81,%l2	! %l2 = 00000000ff000000
!	%f22 = 53915c46 000039e7, %l6 = ff5e0100c43da825
!	Mem[0000000010001430] = 00004600ffffe739
	add	%i0,0x030,%g1
	stda	%f22,[%g1+%l6]ASI_PST16_PL ! Mem[0000000010001430] = e7394600465ce739
!	%l4 = 000000000000008c, Mem[0000000010001408] = ff0000ffff000000
	stxa	%l4,[%i0+%o4]0x80	! Mem[0000000010001408] = 000000000000008c
	membar	#Sync			! Added by membar checker (29)
!	Mem[0000000010041410] = ff000000, %l1 = 0000000000000046
	swapa	[%i1+%o5]0x80,%l1	! %l1 = 00000000ff000000
!	Mem[0000000030041400] = 00000080, %l2 = 00000000ff000000
	swapa	[%i1+%g0]0x89,%l2	! %l2 = 0000000000000080
!	%l3 = ffffffffffffffff, Mem[0000000010181400] = a206d211
	stwa	%l3,[%i6+%g0]0x88	! Mem[0000000010181400] = ffffffff
!	%l1 = 00000000ff000000, Mem[0000000010041410] = ecca626546000000
	stxa	%l1,[%i1+%o5]0x88	! Mem[0000000010041410] = 00000000ff000000
!	Mem[00000000300c1410] = ffff0000, %l0 = 000000007014e739
	ldstuba	[%i3+%o5]0x81,%l0	! %l0 = 00000000000000ff
!	Mem[00000000211c0000] = ff004d40, %l0 = 00000000000000ff
	ldstub	[%o2+%g0],%l0		! %l0 = 00000000000000ff
!	%l6 = c43da825, %l7 = 0000ff62, Mem[0000000010181400] = ffffffff 02e7deeb
	stda	%l6,[%i6+%g0]0x80	! Mem[0000000010181400] = c43da825 0000ff62

p0_label_146:
!	Starting 10 instruction Load Burst
!	Mem[0000000030081410] = aa64e463, %l2 = 0000000000000080
	lduwa	[%i2+%o5]0x81,%l2	! %l2 = 00000000aa64e463
!	Mem[00000000100c1438] = 5d45aa64 000000ff, %l6 = c43da825, %l7 = 0000ff62
	ldd	[%i3+0x038],%l6		! %l6 = 000000005d45aa64 00000000000000ff
!	%l0 = 00000000000000ff, %l6 = 000000005d45aa64, %l7  = 00000000000000ff
	mulx	%l0,%l6,%l7		! %l7 = 0000005ce864b99c
!	Mem[0000000030041410] = ffffff7f, %l2 = 00000000aa64e463
	ldsha	[%i1+%o5]0x89,%l2	! %l2 = ffffffffffffff7f
!	Mem[0000000030181408] = ef83ffff, %l1 = 00000000ff000000
	lduha	[%i6+%o4]0x81,%l1	! %l1 = 000000000000ef83
!	Mem[00000000100c1418] = 00000000, %f30 = 39e71470
	lda	[%i3+0x018]%asi,%f30	! %f30 = 00000000
!	Mem[0000000030141410] = 8c000000, %l6 = 000000005d45aa64
	ldsha	[%i5+%o5]0x81,%l6	! %l6 = ffffffffffff8c00
!	Mem[0000000010081408] = 89b81826, %l6 = ffffffffffff8c00
	ldsba	[%i2+%o4]0x80,%l6	! %l6 = ffffffffffffff89
!	Code Fragment 4, seed = 287119
p0_fragment_19:
!	%l0 = 00000000000000ff
	setx	0xc0fa5e25fdd62aae,%g7,%l0 ! %l0 = c0fa5e25fdd62aae
!	%l1 = 000000000000ef83
	setx	0x45e37b7af1567859,%g7,%l1 ! %l1 = 45e37b7af1567859
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = c0fa5e25fdd62aae
	setx	0xc2cc7263cd36f214,%g7,%l0 ! %l0 = c2cc7263cd36f214
!	%l1 = 45e37b7af1567859
	setx	0x97dc8b0bc7fd1adf,%g7,%l1 ! %l1 = 97dc8b0bc7fd1adf
p0_fragment_19_end:
!	Mem[0000000010081410] = 00000000, %l2 = ffffffffffffff7f
	lduwa	[%i2+%o5]0x80,%l2	! %l2 = 0000000000000000

p0_label_147:
!	Starting 10 instruction Store Burst
!	%l2 = 00000000, %l3 = ffffffff, Mem[00000000100c1408] = 00000000 00000000
	stda	%l2,[%i3+%o4]0x88	! Mem[00000000100c1408] = 00000000 ffffffff
!	%l4 = 000000000000008c, Mem[0000000030001408] = 000000ff
	stba	%l4,[%i0+%o4]0x81	! Mem[0000000030001408] = 8c0000ff
!	%l6 = ffffffffffffff89, Mem[0000000030001408] = 8c0000ff
	stba	%l6,[%i0+%o4]0x81	! Mem[0000000030001408] = 890000ff
!	Mem[0000000030041400] = 000000ff, %l3 = ffffffffffffffff
	ldstuba	[%i1+%g0]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000030141408] = c5e8ed66, %l2 = 0000000000000000
	swapa	[%i5+%o4]0x81,%l2	! %l2 = 00000000c5e8ed66
!	%f14 = ebdee702, %f6  = 73f95a2f, %f7  = ca6aa30d
	fsubs	%f14,%f6 ,%f7 		! %f7  = f3f95b0e
!	%l7 = 0000005ce864b99c, Mem[0000000021800080] = 00009fd0, %asi = 80
	stba	%l7,[%o3+0x080]%asi	! Mem[0000000021800080] = 9c009fd0
!	Mem[0000000010141420] = 68bb2988, %l0 = c2cc7263cd36f214
	ldstub	[%i5+0x020],%l0		! %l0 = 0000000000000068
!	%l1 = 97dc8b0bc7fd1adf, Mem[0000000010181410] = 53915c00
	stwa	%l1,[%i6+%o5]0x88	! Mem[0000000010181410] = c7fd1adf
!	%l7 = 0000005ce864b99c, Mem[00000000100c1400] = 00ff0000
	stha	%l7,[%i3+%g0]0x88	! Mem[00000000100c1400] = 00ffb99c

p0_label_148:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = 000000ff00000000, %l3 = 0000000000000000
	ldxa	[%i1+%o5]0x80,%l3	! %l3 = 000000ff00000000
!	Mem[0000000010181408] = ff00032ae7ecbcc1, %f24 = 1c576869 00ff0000
	ldda	[%i6+%o4]0x80,%f24	! %f24 = ff00032a e7ecbcc1
!	Mem[0000000030101410] = 00000058, %l4 = 000000000000008c
	lduha	[%i4+%o5]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000030141410] = 00000000 0000008c, %l2 = c5e8ed66, %l3 = 00000000
	ldda	[%i5+%o5]0x89,%l2	! %l2 = 000000000000008c 0000000000000000
!	Mem[00000000300c1408] = 53915c46, %l0 = 0000000000000068
	lduba	[%i3+%o4]0x89,%l0	! %l0 = 0000000000000046
!	Mem[0000000030141408] = 5552b44400000000, %l4 = 0000000000000000
	ldxa	[%i5+%o4]0x89,%l4	! %l4 = 5552b44400000000
!	Mem[00000000100c1408] = 00000000, %l7 = 0000005ce864b99c, %asi = 80
	ldsba	[%i3+0x008]%asi,%l7	! %l7 = 0000000000000000
!	Mem[00000000300c1410] = ffff0000 595d72f9, %l2 = 0000008c, %l3 = 00000000
	ldda	[%i3+%o5]0x81,%l2	! %l2 = 00000000ffff0000 00000000595d72f9
!	Mem[0000000010181400] = 62ff000025a83dc4, %l1 = 97dc8b0bc7fd1adf
	ldxa	[%i6+%g0]0x88,%l1	! %l1 = 62ff000025a83dc4
!	%l2 = 00000000ffff0000, %l6 = ffffffffffffff89, %l4 = 5552b44400000000
	andn	%l2,%l6,%l4		! %l4 = 0000000000000000

p0_label_149:
!	Starting 10 instruction Store Burst
!	%l1 = 62ff000025a83dc4, Mem[0000000010101410] = 6968571c
	stba	%l1,[%i4+%o5]0x88	! Mem[0000000010101410] = 696857c4
!	%l0 = 0000000000000046, Mem[0000000010141410] = 6968571c
	stwa	%l0,[%i5+%o5]0x88	! Mem[0000000010141410] = 00000046
!	Mem[0000000030141408] = 00000000, %l1 = 62ff000025a83dc4
	ldstuba	[%i5+%o4]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000020800001] = ffff2ce0, %l7 = 0000000000000000
	ldstuba	[%o1+0x001]%asi,%l7	! %l7 = 00000000000000ff
!	Mem[00000000100c1408] = 00000000, %l7 = 00000000000000ff, %asi = 80
	swapa	[%i3+0x008]%asi,%l7	! %l7 = 0000000000000000
!	%l5 = 0000000000000000, Mem[000000001008141c] = 000000ff
	stw	%l5,[%i2+0x01c]		! Mem[000000001008141c] = 00000000
!	%f24 = ff00032a e7ecbcc1, %l3 = 00000000595d72f9
!	Mem[0000000010081428] = 417371367569f2af
	add	%i2,0x028,%g1
	stda	%f24,[%g1+%l3]ASI_PST32_PL ! Mem[0000000010081428] = c1bcece77569f2af
!	Mem[0000000010141400] = ffffffff, %l7 = 0000000000000000
	swapa	[%i5+%g0]0x88,%l7	! %l7 = 00000000ffffffff
!	Mem[0000000010141410] = 00000046, %l1 = 0000000000000000
	swapa	[%i5+%o5]0x88,%l1	! %l1 = 0000000000000046
!	Mem[0000000030181410] = 46000000, %l6 = 00000000ffffff89
	swapa	[%i6+%o5]0x81,%l6	! %l6 = 0000000046000000

p0_label_150:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = 0000008c00000000, %l0 = 0000000000000046
	ldxa	[%i4+%g0]0x80,%l0	! %l0 = 0000008c00000000
!	Mem[0000000010101430] = 00000000 0e6afda5, %l6 = 46000000, %l7 = ffffffff, %asi = 80
	ldda	[%i4+0x030]%asi,%l6	! %l6 = 0000000000000000 000000000e6afda5
!	Mem[0000000030081400] = 00ff0000, %l5 = 0000000000000000
	lduba	[%i2+%g0]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000010181408] = ff00032a e7ecbcc1, %l0 = 00000000, %l1 = 00000046, %asi = 80
	ldda	[%i6+0x008]%asi,%l0	! %l0 = 00000000ff00032a 00000000e7ecbcc1
!	Mem[0000000030181410] = ffffff8913fb39e7, %f18 = c3cd0b89 4cdda5d7
	ldda	[%i6+%o5]0x81,%f18	! %f18 = ffffff89 13fb39e7
!	Code Fragment 4, seed = 757261
p0_fragment_20:
!	%l0 = 00000000ff00032a
	setx	0x53d801550f27a4be,%g7,%l0 ! %l0 = 53d801550f27a4be
!	%l1 = 00000000e7ecbcc1
	setx	0xed72b1d4bb041569,%g7,%l1 ! %l1 = ed72b1d4bb041569
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 53d801550f27a4be
	setx	0x6e3834972d834224,%g7,%l0 ! %l0 = 6e3834972d834224
!	%l1 = ed72b1d4bb041569
	setx	0xa44f42a068e5adef,%g7,%l1 ! %l1 = a44f42a068e5adef
p0_fragment_20_end:
!	Mem[0000000010101400] = 8c000000, %l4 = 0000000000000000
	ldsha	[%i4+%g0]0x88,%l4	! %l4 = 0000000000000000
!	Mem[00000000100c1410] = f6efd97d, %l6 = 0000000000000000
	ldsba	[%i3+%o5]0x80,%l6	! %l6 = fffffffffffffff6
!	Mem[000000001018141b] = 41c51fc7, %l5 = 0000000000000000
	ldsb	[%i6+0x01b],%l5		! %l5 = ffffffffffffffc7
!	%l2 = 00000000ffff0000, %l2 = 00000000ffff0000, %l1 = a44f42a068e5adef
	udivx	%l2,%l2,%l1		! %l1 = 0000000000000001

p0_label_151:
!	Starting 10 instruction Store Burst
!	%l2 = 00000000ffff0000, immd = fffff850, %y  = 00000000
	smul	%l2,-0x7b0,%l5		! %l5 = 0000000007b00000, %y = 00000000
!	Mem[0000000010081400] = 00000000, %l5 = 0000000007b00000
	ldstuba	[%i2+%g0]0x80,%l5	! %l5 = 0000000000000000
!	%l4 = 0000000000000000, Mem[0000000020800041] = 00007f10, %asi = 80
	stba	%l4,[%o1+0x041]%asi	! Mem[0000000020800040] = 00007f10
!	%l0 = 2d834224, %l1 = 00000001, Mem[00000000100c1408] = 000000ff ffffffff, %asi = 80
	stda	%l0,[%i3+0x008]%asi	! Mem[00000000100c1408] = 2d834224 00000001
!	%f4  = 25a83dc4, Mem[00000000100c1400] = 00ffb99c
	sta	%f4 ,[%i3+%g0]0x88	! Mem[00000000100c1400] = 25a83dc4
!	%f16 = 80000000 00000000, %l6 = fffffffffffffff6
!	Mem[0000000030181408] = ef83ffff00000000
	add	%i6,0x008,%g1
	stda	%f16,[%g1+%l6]ASI_PST32_S ! Mem[0000000030181408] = 8000000000000000
!	%l2 = 00000000ffff0000, Mem[00000000300c1408] = 53915c46
	stba	%l2,[%i3+%o4]0x89	! Mem[00000000300c1408] = 53915c00
!	%l4 = 0000000000000000, Mem[0000000010001400] = 000000ff
	stwa	%l4,[%i0+%g0]0x88	! Mem[0000000010001400] = 00000000
!	Mem[0000000030001408] = 890000ff 69000000, %l4 = 00000000, %l5 = 00000000
	ldda	[%i0+%o4]0x81,%l4	! %l4 = 00000000890000ff 0000000069000000
!	%l3 = 00000000595d72f9, Mem[0000000010001410] = 000000ff
	stha	%l3,[%i0+%o5]0x80	! Mem[0000000010001410] = 72f900ff

p0_label_152:
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = 0000008c, %l2 = 00000000ffff0000
	lduba	[%i5+%o5]0x89,%l2	! %l2 = 000000000000008c
!	Mem[0000000010041418] = 48fbc6ea, %l1 = 0000000000000001
	ldsw	[%i1+0x018],%l1		! %l1 = 0000000048fbc6ea
!	Mem[000000001018143c] = 595d72f9, %f14 = ebdee702
	ld	[%i6+0x03c],%f14	! %f14 = 595d72f9
!	Mem[000000001000143a] = cb62e4ff, %l7 = 000000000e6afda5
	ldsh	[%i0+0x03a],%l7		! %l7 = ffffffffffffe4ff
!	Mem[0000000010101408] = 2618b889 55ecbcc1, %l0 = 2d834224, %l1 = 48fbc6ea
	ldda	[%i4+%o4]0x80,%l0	! %l0 = 000000002618b889 0000000055ecbcc1
!	Mem[0000000010101438] = 54983c02 63e462cb, %l2 = 0000008c, %l3 = 595d72f9, %asi = 80
	ldda	[%i4+0x038]%asi,%l2	! %l2 = 0000000054983c02 0000000063e462cb
!	Mem[0000000010081408] = 89b81826, %f26 = 00000000
	lda	[%i2+%o4]0x80,%f26	! %f26 = 89b81826
!	%l4 = 00000000890000ff, %l2 = 0000000054983c02, %l7 = ffffffffffffe4ff
	xnor	%l4,%l2,%l7		! %l7 = ffffffff2267c302
!	Mem[0000000010041410] = ff000000, %l6 = fffffffffffffff6
	ldsba	[%i1+%o5]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000030101408] = 757fa85b, %l2 = 0000000054983c02
	lduwa	[%i4+%o4]0x81,%l2	! %l2 = 00000000757fa85b

p0_label_153:
!	Starting 10 instruction Store Burst
!	%l7 = ffffffff2267c302, Mem[0000000030001400] = 00000000
	stwa	%l7,[%i0+%g0]0x81	! Mem[0000000030001400] = 2267c302
!	%f24 = ff00032a, %f4  = 25a83dc4, %f10 = 350a3091
	fsubs	%f24,%f4 ,%f10		! %f10 = ff00032a
!	%f28 = 00ff0000 0b790000, Mem[0000000010181410] = df1afdc7 00000000
	stda	%f28,[%i6+%o5]0x80	! Mem[0000000010181410] = 00ff0000 0b790000
!	%l7 = ffffffff2267c302, Mem[0000000010001410] = 00000069ff00f972
	stxa	%l7,[%i0+%o5]0x88	! Mem[0000000010001410] = ffffffff2267c302
!	Mem[0000000030041410] = 7fffffffc9db38ff, %f12 = c5e8ed66 44b45255
	ldda	[%i1+%o5]0x81,%f12	! %f12 = 7fffffff c9db38ff
!	Mem[0000000010141408] = 00000000, %l0 = 000000002618b889, %asi = 80
	swapa	[%i5+0x008]%asi,%l0	! %l0 = 0000000000000000
!	Mem[00000000100c142e] = ffffffff, %l7 = ffffffff2267c302
	ldstub	[%i3+0x02e],%l7		! %l7 = 00000000000000ff
!	%l6 = 00000000, %l7 = 000000ff, Mem[00000000100c1408] = 2d834224 00000001, %asi = 80
	stda	%l6,[%i3+0x008]%asi	! Mem[00000000100c1408] = 00000000 000000ff
!	%l7 = 00000000000000ff, Mem[0000000021800080] = 9c009fd0
	sth	%l7,[%o3+0x080]		! Mem[0000000021800080] = 00ff9fd0
!	Mem[0000000010001427] = ffc3fcff, %l0 = 0000000000000000
	ldstuba	[%i0+0x027]%asi,%l0	! %l0 = 00000000000000ff

p0_label_154:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001424] = ffc3fcff, %l0 = 00000000000000ff, %asi = 80
	lduwa	[%i0+0x024]%asi,%l0	! %l0 = 00000000ffc3fcff
!	Mem[0000000010141420] = ffbb2988 ff396e79, %l6 = 00000000, %l7 = 000000ff
	ldd	[%i5+0x020],%l6		! %l6 = 00000000ffbb2988 00000000ff396e79
!	Mem[0000000010181410] = 0000ff00, %l1 = 0000000055ecbcc1
	swapa	[%i6+%o5]0x88,%l1	! %l1 = 000000000000ff00
!	Mem[0000000010001400] = 00000000, %f2  = ff000000
	lda	[%i0+%g0]0x80,%f2 	! %f2 = 00000000
!	Mem[00000000300c1410] = f9725d590000ffff, %l1 = 000000000000ff00
	ldxa	[%i3+%o5]0x89,%l1	! %l1 = f9725d590000ffff
!	Mem[00000000100c1410] = 00000000 7dd9eff6, %l2 = 757fa85b, %l3 = 63e462cb
	ldda	[%i3+%o5]0x88,%l2	! %l2 = 000000007dd9eff6 0000000000000000
!	%f31 = 023c9854, %f24 = ff00032a, %f11 = c4200000
	fmuls	%f31,%f24,%f11		! %f11 = c1bc9cfd
!	Mem[0000000020800000] = ffff2ce0, %l0 = 00000000ffc3fcff, %asi = 80
	ldsba	[%o1+0x000]%asi,%l0	! %l0 = ffffffffffffffff
!	%f20 = 7fffffff, %f31 = 023c9854
	fcmps	%fcc3,%f20,%f31		! %fcc3 = 3
!	Mem[0000000030101400] = 2a0300ff, %l5 = 0000000069000000
	ldswa	[%i4+%g0]0x89,%l5	! %l5 = 000000002a0300ff

p0_label_155:
!	Starting 10 instruction Store Burst
!	Mem[0000000030001400] = 02c36722, %l1 = f9725d590000ffff
	ldstuba	[%i0+%g0]0x89,%l1	! %l1 = 0000000000000022
!	Code Fragment 4, seed = 680147
p0_fragment_21:
!	%l0 = ffffffffffffffff
	setx	0x0d8626c94f9cb48e,%g7,%l0 ! %l0 = 0d8626c94f9cb48e
!	%l1 = 0000000000000022
	setx	0xaecc227602845c39,%g7,%l1 ! %l1 = aecc227602845c39
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 0d8626c94f9cb48e
	setx	0x819c52ac17b50ff4,%g7,%l0 ! %l0 = 819c52ac17b50ff4
!	%l1 = aecc227602845c39
	setx	0x436256927ade52bf,%g7,%l1 ! %l1 = 436256927ade52bf
p0_fragment_21_end:
!	Mem[0000000030041400] = ff0000ff, %l6 = 00000000ffbb2988
	swapa	[%i1+%g0]0x81,%l6	! %l6 = 00000000ff0000ff
!	Mem[00000000211c0000] = ff004d40, %l1 = 436256927ade52bf
	ldstuba	[%o2+0x000]%asi,%l1	! %l1 = 00000000000000ff
!	%f13 = c9db38ff, Mem[0000000030001408] = ff000089
	sta	%f13,[%i0+%o4]0x89	! Mem[0000000030001408] = c9db38ff
!	%l3 = 0000000000000000, Mem[0000000021800040] = 00d55da0
	sth	%l3,[%o3+0x040]		! Mem[0000000021800040] = 00005da0
!	Mem[0000000010141430] = 1aa1bcf4, %l2 = 000000007dd9eff6, %asi = 80
	swapa	[%i5+0x030]%asi,%l2	! %l2 = 000000001aa1bcf4
!	Mem[0000000030181408] = 00000080, %l7 = 00000000ff396e79
	swapa	[%i6+%o4]0x89,%l7	! %l7 = 0000000000000080
!	%l6 = 00000000ff0000ff, Mem[0000000030101410] = 1200790b58000000
	stxa	%l6,[%i4+%o5]0x89	! Mem[0000000030101410] = 00000000ff0000ff
!	%l6 = ff0000ff, %l7 = 00000080, Mem[0000000030181400] = f9725d54 39e71470
	stda	%l6,[%i6+%g0]0x89	! Mem[0000000030181400] = ff0000ff 00000080

p0_label_156:
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = c9db38ff, %l0 = 819c52ac17b50ff4
	lduba	[%i0+%o4]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030041400] = ffbb2988, %f1  = 00000000
	lda	[%i1+%g0]0x81,%f1 	! %f1 = ffbb2988
!	Mem[00000000100c1408] = 00000000, %f2  = 00000000
	lda	[%i3+%o4]0x80,%f2 	! %f2 = 00000000
!	Mem[0000000030081408] = 7014e739, %l3 = 0000000000000000
	lduba	[%i2+%o4]0x89,%l3	! %l3 = 0000000000000039
!	Mem[0000000021800181] = 032a8090, %l4 = 00000000890000ff
	ldsb	[%o3+0x181],%l4		! %l4 = 000000000000002a
!	Mem[00000000100c1410] = f6efd97d 00000000, %l6 = ff0000ff, %l7 = 00000080
	ldda	[%i3+%o5]0x80,%l6	! %l6 = 00000000f6efd97d 0000000000000000
	membar	#Sync			! Added by membar checker (30)
!	Mem[00000000100c1400] = c43da825 00000121 00000000 000000ff
!	Mem[00000000100c1410] = f6efd97d 00000000 00000000 ff000000
!	Mem[00000000100c1420] = 00000000 0000ff62 cadbff00 ffffffff
!	Mem[00000000100c1430] = 00000000 000000c1 5d45aa64 000000ff
	ldda	[%i3+%g0]ASI_BLK_AIUP,%f16	! Block Load from 00000000100c1400
!	Mem[0000000010141400] = 00000000, %f2  = 00000000
	lda	[%i5+%g0]0x88,%f2 	! %f2 = 00000000
!	Mem[0000000030041410] = 7fffffff, %l2 = 000000001aa1bcf4
	ldsba	[%i1+%o5]0x81,%l2	! %l2 = 000000000000007f
!	Mem[0000000030081400] = 0000000000ff0000, %f4  = 25a83dc4 ffffffff
	ldda	[%i2+%g0]0x89,%f4 	! %f4  = 00000000 00ff0000

p0_label_157:
!	Starting 10 instruction Store Burst
!	%f8  = 25a83dc4 00015eff, Mem[0000000010041420] = 455ca907 003da825
	std	%f8 ,[%i1+0x020]	! Mem[0000000010041420] = 25a83dc4 00015eff
!	%f26 = cadbff00 ffffffff, Mem[0000000030141400] = 00000000 00000000
	stda	%f26,[%i5+%g0]0x89	! Mem[0000000030141400] = cadbff00 ffffffff
!	%l1 = 00000000000000ff, Mem[00000000211c0000] = ff004d40
	sth	%l1,[%o2+%g0]		! Mem[00000000211c0000] = 00ff4d40
!	%l7 = 0000000000000000, Mem[0000000010181408] = c1bcece72a0300ff
	stxa	%l7,[%i6+%o4]0x88	! Mem[0000000010181408] = 0000000000000000
!	Mem[000000001004141f] = 3879d113, %l4 = 000000000000002a
	ldstuba	[%i1+0x01f]%asi,%l4	! %l4 = 0000000000000013
!	%f8  = 25a83dc4 00015eff, Mem[0000000010081410] = 00000000 595d72f9
	std	%f8 ,[%i2+%o5]		! Mem[0000000010081410] = 25a83dc4 00015eff
!	%l7 = 0000000000000000, Mem[0000000010141408] = 2618b889
	stha	%l7,[%i5+%o4]0x80	! Mem[0000000010141408] = 0000b889
!	%l0 = 00000000000000ff, Mem[0000000010181408] = 00000000
	stba	%l0,[%i6+%o4]0x88	! Mem[0000000010181408] = 000000ff
!	Mem[000000001018142b] = 00ff0000, %l2 = 000000000000007f
	ldstuba	[%i6+0x02b]%asi,%l2	! %l2 = 0000000000000000
!	%f22 = 00000000 ff000000, Mem[0000000030101408] = 5ba87f75 89b81826
	stda	%f22,[%i4+%o4]0x89	! Mem[0000000030101408] = 00000000 ff000000

p0_label_158:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = 0000000000000000, %f0  = 00000000 ffbb2988
	ldda	[%i0+%g0]0x80,%f0 	! %f0  = 00000000 00000000
!	Mem[000000001010142e] = 000000ff, %l2 = 0000000000000000, %asi = 80
	ldsha	[%i4+0x02e]%asi,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010001400] = 00000000, %l1 = 00000000000000ff
	lduh	[%i0+%g0],%l1		! %l1 = 0000000000000000
!	Mem[0000000030181410] = ffffff89, %l0 = 00000000000000ff
	lduha	[%i6+%o5]0x81,%l0	! %l0 = 000000000000ffff
!	Mem[0000000030001410] = ff5e0100, %l3 = 0000000000000039
	lduha	[%i0+%o5]0x81,%l3	! %l3 = 000000000000ff5e
!	Mem[0000000030141408] = ff000000, %l5 = 000000002a0300ff
	ldsha	[%i5+%o4]0x81,%l5	! %l5 = ffffffffffffff00
!	Mem[00000000100c1400] = 25a83dc4, %l5 = ffffffffffffff00
	lduba	[%i3+%g0]0x88,%l5	! %l5 = 00000000000000c4
!	Mem[0000000030181400] = ff0000ff, %l1 = 0000000000000000
	lduwa	[%i6+%g0]0x89,%l1	! %l1 = 00000000ff0000ff
!	Mem[0000000010001408] = 00000000, %l3 = 000000000000ff5e
	lduha	[%i0+%o4]0x88,%l3	! %l3 = 0000000000000000
!	%l3 = 0000000000000000, immd = fffffffffffff491, %l108 = 0000000000000007
	sdivx	%l3,-0xb6f,%l7		! %l7 = 0000000000000000

p0_label_159:
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000000013, Mem[0000000020800040] = 00007f10
	sth	%l4,[%o1+0x040]		! Mem[0000000020800040] = 00137f10
!	%l2 = 00000000000000ff, Mem[0000000010181408] = 000000ff
	stba	%l2,[%i6+%o4]0x88	! Mem[0000000010181408] = 000000ff
!	Mem[0000000030181400] = ff0000ff, %l3 = 0000000000000000
	ldstuba	[%i6+%g0]0x89,%l3	! %l3 = 00000000000000ff
!	%l2 = 000000ff, %l3 = 000000ff, Mem[0000000030041410] = 7fffffff c9db38ff
	stda	%l2,[%i1+%o5]0x81	! Mem[0000000030041410] = 000000ff 000000ff
!	%f10 = ff00032a c1bc9cfd, Mem[0000000010181408] = ff000000 00000000
	stda	%f10,[%i6+%o4]0x80	! Mem[0000000010181408] = ff00032a c1bc9cfd
!	%l0 = 0000ffff, %l1 = ff0000ff, Mem[0000000010141428] = 00000000 0538bcc9, %asi = 80
	stda	%l0,[%i5+0x028]%asi	! Mem[0000000010141428] = 0000ffff ff0000ff
!	Mem[000000001000143e] = ff00ff00, %l5 = 00000000000000c4
	ldstub	[%i0+0x03e],%l5		! %l5 = 00000000000000ff
!	%f18 = 00000000, Mem[0000000030101408] = ff000000
	sta	%f18,[%i4+%o4]0x89	! Mem[0000000030101408] = 00000000
!	%l3 = 00000000000000ff, Mem[0000000030181408] = 00000000ff396e79
	stxa	%l3,[%i6+%o4]0x89	! Mem[0000000030181408] = 00000000000000ff
!	%l7 = 0000000000000000, Mem[0000000010141433] = 7dd9eff6
	stb	%l7,[%i5+0x033]		! Mem[0000000010141430] = 7dd9ef00

p0_label_160:
!	Starting 10 instruction Load Burst
!	%l6 = 00000000f6efd97d, immd = fffff4ac, %y  = 00000000
	udiv	%l6,-0xb54,%l6		! %l6 = 0000000000000000
	mov	%l0,%y			! %y = 0000ffff
!	Mem[0000000010141420] = ffbb2988ff396e79, %l7 = 0000000000000000
	ldx	[%i5+0x020],%l7		! %l7 = ffbb2988ff396e79
!	Mem[0000000010001408] = 00000000, %l0 = 000000000000ffff
	ldsha	[%i0+%o4]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000010001408] = 00000000, %f6  = 73f95a2f
	lda	[%i0+%o4]0x88,%f6 	! %f6 = 00000000
!	Mem[0000000030181408] = 000000ff, %l7 = ffbb2988ff396e79
	ldsha	[%i6+%o4]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030141408] = 000000ff, %l1 = 00000000ff0000ff
	ldsba	[%i5+%o4]0x89,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010001410] = 02c36722, %l7 = 00000000000000ff
	ldswa	[%i0+%o5]0x80,%l7	! %l7 = 0000000002c36722
!	Mem[0000000030081400] = 0000ff00, %l2 = 00000000000000ff
	ldsba	[%i2+%g0]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000010041410] = 00000000 ff000000, %l2 = 00000000, %l3 = 000000ff
	ldda	[%i1+%o5]0x88,%l2	! %l2 = 00000000ff000000 0000000000000000
!	Mem[0000000010101428] = 00000000 000000ff, %l2 = ff000000, %l3 = 00000000, %asi = 80
	ldda	[%i4+0x028]%asi,%l2	! %l2 = 0000000000000000 00000000000000ff

p0_label_161:
!	Starting 10 instruction Store Burst
!	Mem[0000000010141410] = 00000000, %l3 = 00000000000000ff
	swapa	[%i5+%o5]0x88,%l3	! %l3 = 0000000000000000
!	%l0 = 00000000, %l1 = ffffffff, Mem[00000000300c1410] = ffff0000 595d72f9
	stda	%l0,[%i3+%o5]0x81	! Mem[00000000300c1410] = 00000000 ffffffff
!	%f20 = f6efd97d 00000000, %l1 = ffffffffffffffff
!	Mem[0000000010141420] = ffbb2988ff396e79
	add	%i5,0x020,%g1
	stda	%f20,[%g1+%l1]ASI_PST16_P ! Mem[0000000010141420] = f6efd97d00000000
!	%l2 = 0000000000000000, Mem[0000000010141410] = 0000ff00000000ff
	stxa	%l2,[%i5+%o5]0x88	! Mem[0000000010141410] = 0000000000000000
!	%l4 = 0000000000000013, Mem[0000000030001400] = ff67c30200000000
	stxa	%l4,[%i0+%g0]0x81	! Mem[0000000030001400] = 0000000000000013
	membar	#Sync			! Added by membar checker (31)
!	%l4 = 0000000000000013, Mem[00000000100c1408] = 00000000
	stwa	%l4,[%i3+%o4]0x88	! Mem[00000000100c1408] = 00000013
!	%l3 = 0000000000000000, imm = 00000000000006f6, %l7 = 0000000002c36722
	xor	%l3,0x6f6,%l7		! %l7 = 00000000000006f6
!	Mem[0000000030081410] = 63e464aa, %l0 = 0000000000000000
	lduwa	[%i2+%o5]0x89,%l0	! %l0 = 0000000063e464aa
!	%l4 = 0000000000000013, Mem[00000000100c1408] = 13000000
	stwa	%l4,[%i3+%o4]0x80	! Mem[00000000100c1408] = 00000013
!	%f18 = 00000000, Mem[0000000010001408] = 00000000
	sta	%f18,[%i0+%o4]0x88	! Mem[0000000010001408] = 00000000

p0_label_162:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181426] = 00000062, %l7 = 00000000000006f6, %asi = 80
	lduha	[%i6+0x026]%asi,%l7	! %l7 = 0000000000000062
!	Mem[0000000010141410] = 00000000, %l2 = 0000000000000000
	lduha	[%i5+%o5]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000010041410] = 000000ff 00000000, %l4 = 00000013, %l5 = 000000ff
	ldda	[%i1+%o5]0x80,%l4	! %l4 = 00000000000000ff 0000000000000000
!	Mem[0000000030081408] = 7014e739, %f16 = c43da825
	lda	[%i2+%o4]0x89,%f16	! %f16 = 7014e739
!	Mem[0000000010181400] = 25a83dc4, %f11 = c1bc9cfd
	lda	[%i6+%g0]0x88,%f11	! %f11 = 25a83dc4
!	Mem[0000000030081408] = 39e71470, %l3 = 0000000000000000
	lduwa	[%i2+%o4]0x81,%l3	! %l3 = 0000000039e71470
!	Mem[0000000021800080] = 00ff9fd0, %l3 = 0000000039e71470
	ldsh	[%o3+0x080],%l3		! %l3 = 00000000000000ff
!	Mem[0000000010101410] = c4576869, %l1 = ffffffffffffffff
	ldsha	[%i4+%o5]0x80,%l1	! %l1 = ffffffffffffc457
!	Mem[0000000030141410] = 8c000000, %l4 = 00000000000000ff
	ldsha	[%i5+%o5]0x81,%l4	! %l4 = ffffffffffff8c00
!	Mem[0000000010041400] = 00000000, %l1 = ffffffffffffc457
	ldsba	[%i1+%g0]0x88,%l1	! %l1 = 0000000000000000

p0_label_163:
!	Starting 10 instruction Store Burst
!	Mem[0000000020800041] = 00137f10, %l2 = 0000000000000000
	ldstub	[%o1+0x041],%l2		! %l2 = 0000000000000013
!	%l6 = 00000000, %l7 = 00000062, Mem[0000000010181400] = 25a83dc4 62ff0000
	stda	%l6,[%i6+%g0]0x88	! Mem[0000000010181400] = 00000000 00000062
!	%l4 = ffffffffffff8c00, Mem[0000000030181410] = 89ffffff
	stwa	%l4,[%i6+%o5]0x89	! Mem[0000000030181410] = ffff8c00
!	%f22 = 00000000 ff000000, Mem[0000000010181438] = 00000000 595d72f9, %asi = 80
	stda	%f22,[%i6+0x038]%asi	! Mem[0000000010181438] = 00000000 ff000000
!	Mem[00000000201c0001] = e73956b0, %l2 = 0000000000000013
	ldstuba	[%o0+0x001]%asi,%l2	! %l2 = 0000000000000039
!	%f24 = 00000000, %f20 = f6efd97d
	fcmpes	%fcc2,%f24,%f20		! %fcc2 = 2
!	%l1 = 0000000000000000, Mem[00000000100c1428] = cadbff00ffffffff
	stx	%l1,[%i3+0x028]		! Mem[00000000100c1428] = 0000000000000000
!	%f22 = 00000000, %f24 = 00000000, %f0  = 00000000 00000000
	fsmuld	%f22,%f24,%f0 		! %f0  = 00000000 00000000
!	%l3 = 00000000000000ff, Mem[00000000201c0000] = e7ff56b0, %asi = 80
	stha	%l3,[%o0+0x000]%asi	! Mem[00000000201c0000] = 00ff56b0
!	%l4 = ffffffffffff8c00, Mem[0000000010101400] = 0000008c
	stwa	%l4,[%i4+%g0]0x80	! Mem[0000000010101400] = ffff8c00

p0_label_164:
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = 00ff56b0, %l0 = 0000000063e464aa, %asi = 80
	lduha	[%o0+0x000]%asi,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030141410] = 8c000000, %l4 = ffffffffffff8c00
	lduha	[%i5+%o5]0x81,%l4	! %l4 = 0000000000008c00
!	Mem[0000000021800040] = 00005da0, %l5 = 0000000000000000
	lduh	[%o3+0x040],%l5		! %l5 = 0000000000000000
!	Mem[0000000010141412] = 00000000, %l1 = 0000000000000000
	ldub	[%i5+0x012],%l1		! %l1 = 0000000000000000
!	%f28 = 00000000, %f30 = 5d45aa64
	fcmps	%fcc0,%f28,%f30		! %fcc0 = 1
!	Mem[0000000030001410] = 00015eff, %l2 = 0000000000000039
	lduba	[%i0+%o5]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030001408] = ff38dbc9 69000000, %l0 = 000000ff, %l1 = 00000000
	ldda	[%i0+%o4]0x81,%l0	! %l0 = 00000000ff38dbc9 0000000069000000
!	Mem[0000000030041410] = ff000000, %l6 = 0000000000000000
	ldswa	[%i1+%o5]0x89,%l6	! %l6 = ffffffffff000000
!	Mem[0000000010041400] = 00000000 c9db38ff, %l4 = 00008c00, %l5 = 00000000
	ldd	[%i1+%g0],%l4		! %l4 = 0000000000000000 00000000c9db38ff
!	Mem[0000000010141408] = 00000000 89b80000, %l4 = 00000000, %l5 = c9db38ff
	ldda	[%i5+%o4]0x88,%l4	! %l4 = 0000000089b80000 0000000000000000

p0_label_165:
!	Starting 10 instruction Store Burst
!	Mem[0000000021800100] = e7399830, %l2 = 00000000000000ff
	ldstuba	[%o3+0x100]%asi,%l2	! %l2 = 00000000000000e7
!	%l6 = ffffffffff000000, Mem[0000000010141408] = 0000b889
	stwa	%l6,[%i5+%o4]0x80	! Mem[0000000010141408] = ff000000
!	%f14 = 595d72f9 a206d211, Mem[0000000010141400] = 00000000 000000ff
	stda	%f14,[%i5+%g0]0x80	! Mem[0000000010141400] = 595d72f9 a206d211
!	%l5 = 0000000000000000, Mem[0000000030181410] = 008cffff13fb39e7
	stxa	%l5,[%i6+%o5]0x81	! Mem[0000000030181410] = 0000000000000000
!	%l3 = 00000000000000ff, Mem[0000000030101410] = ff0000ff
	stwa	%l3,[%i4+%o5]0x89	! Mem[0000000030101410] = 000000ff
!	%l4 = 0000000089b80000, Mem[00000000300c1410] = ffffffff00000000
	stxa	%l4,[%i3+%o5]0x89	! Mem[00000000300c1410] = 0000000089b80000
!	Mem[0000000010181408] = 2a0300ff, %l7 = 0000000000000062
	swapa	[%i6+%o4]0x88,%l7	! %l7 = 000000002a0300ff
!	%l1 = 0000000069000000, immd = 0000012c, %y  = 0000ffff
	smul	%l1,0x12c,%l0		! %l0 = 0000007b0c000000, %y = 0000007b
!	%l7 = 000000002a0300ff, Mem[00000000100c1408] = ff00000013000000
	stxa	%l7,[%i3+%o4]0x88	! Mem[00000000100c1408] = 000000002a0300ff
!	Mem[0000000010101400] = ffff8c00, %l1 = 0000000069000000
	ldstuba	[%i4+%g0]0x80,%l1	! %l1 = 00000000000000ff

p0_label_166:
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = ff000000, %l7 = 000000002a0300ff
	lduwa	[%i6+%o4]0x81,%l7	! %l7 = 00000000ff000000
!	Mem[00000000211c0000] = 00ff4d40, %l4 = 0000000089b80000
	ldsb	[%o2+%g0],%l4		! %l4 = 0000000000000000
!	%l6 = ffffffffff000000, %l7 = 00000000ff000000, %l7 = 00000000ff000000
	xnor	%l6,%l7,%l7		! %l7 = 00000000ffffffff
!	Mem[0000000010181410] = c1bcec55, %l6 = ffffffffff000000
	ldsba	[%i6+%o5]0x80,%l6	! %l6 = ffffffffffffffc1
!	Mem[00000000300c1408] = 53915c00, %l5 = 0000000000000000
	ldswa	[%i3+%o4]0x89,%l5	! %l5 = 0000000053915c00
!	Mem[0000000010081410] = ff5e0100c43da825, %f12 = 7fffffff c9db38ff
	ldda	[%i2+%o5]0x88,%f12	! %f12 = ff5e0100 c43da825
!	Mem[0000000010101400] = 008cffff, %l1 = 00000000000000ff
	lduwa	[%i4+%g0]0x88,%l1	! %l1 = 00000000008cffff
!	Mem[0000000030001400] = 00000000, %l6 = ffffffffffffffc1
	lduha	[%i0+%g0]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000010001430] = e7394600, %f15 = a206d211
	lda	[%i0+0x030]%asi,%f15	! %f15 = e7394600
!	Mem[00000000300c1400] = ff000000, %l0 = 0000007b0c000000
	lduha	[%i3+%g0]0x81,%l0	! %l0 = 000000000000ff00

p0_label_167:
!	Starting 10 instruction Store Burst
!	%l7 = 00000000ffffffff, Mem[0000000010141400] = 595d72f9a206d211
	stxa	%l7,[%i5+%g0]0x80	! Mem[0000000010141400] = 00000000ffffffff
!	%l2 = 00000000000000e7, Mem[00000000300c1410] = 89b80000
	stba	%l2,[%i3+%o5]0x89	! Mem[00000000300c1410] = 89b800e7
!	Mem[00000000100c1418] = 00000000, %l3 = 00000000000000ff, %asi = 80
	swapa	[%i3+0x018]%asi,%l3	! %l3 = 0000000000000000
!	%f9  = 00015eff, Mem[0000000010001408] = 00000000
	sta	%f9 ,[%i0+%o4]0x80	! Mem[0000000010001408] = 00015eff
!	%l5 = 0000000053915c00, Mem[00000000100c1408] = ff00032a00000000
	stx	%l5,[%i3+%o4]		! Mem[00000000100c1408] = 0000000053915c00
!	%f0  = 00000000 00000000, %l6 = 0000000000000000
!	Mem[0000000030041408] = c3cd0b894cdda5d7
	add	%i1,0x008,%g1
	stda	%f0,[%g1+%l6]ASI_PST8_S ! Mem[0000000030041408] = c3cd0b894cdda5d7
!	%l7 = 00000000ffffffff, Mem[0000000010141400] = 00000000
	stha	%l7,[%i5+%g0]0x88	! Mem[0000000010141400] = 0000ffff
!	%l2 = 000000e7, %l3 = 00000000, Mem[00000000100c1410] = f6efd97d 00000000
	stda	%l2,[%i3+%o5]0x80	! Mem[00000000100c1410] = 000000e7 00000000
!	Mem[0000000010181410] = 55ecbcc1, %l2 = 00000000000000e7
	swapa	[%i6+%o5]0x88,%l2	! %l2 = 0000000055ecbcc1
!	%f31 = 000000ff, Mem[0000000010001424] = ffc3fcff
	sta	%f31,[%i0+0x024]%asi	! Mem[0000000010001424] = 000000ff

p0_label_168:
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = 39e71470, %l1 = 00000000008cffff
	lduwa	[%i2+%o4]0x81,%l1	! %l1 = 0000000039e71470
!	Mem[00000000100c1400] = 25a83dc4, %l7 = 00000000ffffffff
	lduba	[%i3+%g0]0x88,%l7	! %l7 = 00000000000000c4
!	Mem[0000000010181408] = 62000000c1bc9cfd, %f8  = 25a83dc4 00015eff
	ldda	[%i6+%o4]0x80,%f8 	! %f8  = 62000000 c1bc9cfd
!	Mem[0000000010001410] = ffffffff2267c302, %f22 = 00000000 ff000000
	ldda	[%i0+%o5]0x88,%f22	! %f22 = ffffffff 2267c302
!	Mem[0000000030001408] = c9db38ff, %l0 = 000000000000ff00
	ldsha	[%i0+%o4]0x89,%l0	! %l0 = 00000000000038ff
!	Mem[0000000030041408] = c3cd0b89, %l1 = 0000000039e71470
	lduha	[%i1+%o4]0x81,%l1	! %l1 = 000000000000c3cd
!	Mem[0000000010001410] = 02c36722, %l7 = 00000000000000c4
	lduha	[%i0+%o5]0x80,%l7	! %l7 = 00000000000002c3
!	Mem[0000000030101400] = 00000000 2a0300ff, %l2 = 55ecbcc1, %l3 = 00000000
	ldda	[%i4+%g0]0x89,%l2	! %l2 = 000000002a0300ff 0000000000000000
!	Mem[0000000010041408] = 00000000, %l5 = 0000000053915c00
	ldsba	[%i1+%o4]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000030001410] = 00015eff, %l5 = 0000000000000000
	ldsha	[%i0+%o5]0x89,%l5	! %l5 = 0000000000005eff

p0_label_169:
!	Starting 10 instruction Store Burst
!	%l7 = 00000000000002c3, Mem[00000000300c1410] = e700b889
	stha	%l7,[%i3+%o5]0x81	! Mem[00000000300c1410] = 02c3b889
!	%l5 = 0000000000005eff, Mem[0000000030101410] = 000000ff
	stba	%l5,[%i4+%o5]0x89	! Mem[0000000030101410] = 000000ff
!	%f20 = f6efd97d 00000000, Mem[0000000010041400] = 00000000 ff38dbc9
	stda	%f20,[%i1+%g0]0x88	! Mem[0000000010041400] = f6efd97d 00000000
!	Mem[0000000030041410] = 000000ff, %l3 = 0000000000000000
	swapa	[%i1+%o5]0x81,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030101408] = 00000000, %l6 = 0000000000000000
	ldstuba	[%i4+%o4]0x81,%l6	! %l6 = 0000000000000000
!	%l7 = 00000000000002c3, Mem[0000000010041400] = 00000000
	stha	%l7,[%i1+%g0]0x80	! Mem[0000000010041400] = 02c30000
!	%l3 = 00000000000000ff, Mem[00000000100c1408] = 00000000
	stwa	%l3,[%i3+%o4]0x80	! Mem[00000000100c1408] = 000000ff
!	%l6 = 0000000000000000, Mem[0000000030081408] = 7014e739
	stwa	%l6,[%i2+%o4]0x89	! Mem[0000000030081408] = 00000000
!	%l0 = 00000000000038ff, Mem[0000000010081412] = 25a83dc4, %asi = 80
	stba	%l0,[%i2+0x012]%asi	! Mem[0000000010081410] = 25a8ffc4
!	Mem[0000000010141408] = ff000000, %l7 = 00000000000002c3
	ldsha	[%i5+%o4]0x80,%l7	! %l7 = ffffffffffffff00

p0_label_170:
!	Starting 10 instruction Load Burst
!	Mem[0000000030181410] = 00000000, %f7  = f3f95b0e
	lda	[%i6+%o5]0x89,%f7 	! %f7 = 00000000
!	Mem[0000000010041407] = 7dd9eff6, %l5 = 0000000000005eff, %asi = 80
	ldsba	[%i1+0x007]%asi,%l5	! %l5 = fffffffffffffff6
!	Mem[00000000100c1428] = 00000000, %l7 = ffffffffffffff00
	ldsh	[%i3+0x028],%l7		! %l7 = 0000000000000000
!	Mem[0000000021800101] = ff399830, %l6 = 0000000000000000
	ldsb	[%o3+0x101],%l6		! %l6 = 0000000000000039
!	Mem[0000000010181400] = 00000000 62000000, %l2 = 2a0300ff, %l3 = 000000ff, %asi = 80
	ldda	[%i6+0x000]%asi,%l2	! %l2 = 0000000000000000 0000000062000000
!	Code Fragment 4, seed = 861635
p0_fragment_22:
!	%l0 = 00000000000038ff
	setx	0x38453ad6a80e7d0e,%g7,%l0 ! %l0 = 38453ad6a80e7d0e
!	%l1 = 000000000000c3cd
	setx	0x19fa06422a55bcb9,%g7,%l1 ! %l1 = 19fa06422a55bcb9
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 38453ad6a80e7d0e
	setx	0x0609fdb91ab28874,%g7,%l0 ! %l0 = 0609fdb91ab28874
!	%l1 = 19fa06422a55bcb9
	setx	0x6e06da89f52c633f,%g7,%l1 ! %l1 = 6e06da89f52c633f
p0_fragment_22_end:
!	%l0 = 0609fdb91ab28874, immd = 0000000000000c5f, %l3  = 0000000062000000
	mulx	%l0,0xc5f,%l3		! %l3 = b599d4f146a6130c
!	Mem[00000000300c1400] = 83ef6c19000000ff, %f14 = 595d72f9 e7394600
	ldda	[%i3+%g0]0x89,%f14	! %f14 = 83ef6c19 000000ff
!	Mem[0000000030001410] = ff5e0100c43da825, %f30 = 5d45aa64 000000ff
	ldda	[%i0+%o5]0x81,%f30	! %f30 = ff5e0100 c43da825
!	Mem[0000000010141408] = 000000ff, %l1 = 6e06da89f52c633f
	ldsba	[%i5+%o4]0x88,%l1	! %l1 = ffffffffffffffff

p0_label_171:
!	Starting 10 instruction Store Burst
!	%f18 = 00000000 000000ff, Mem[0000000030041408] = c3cd0b89 4cdda5d7
	stda	%f18,[%i1+%o4]0x81	! Mem[0000000030041408] = 00000000 000000ff
!	Mem[0000000030041400] = 8829bbff, %l2 = 0000000000000000
	swapa	[%i1+%g0]0x89,%l2	! %l2 = 000000008829bbff
!	%l1 = ffffffffffffffff, Mem[0000000030041400] = 00000000
	stha	%l1,[%i1+%g0]0x89	! Mem[0000000030041400] = 0000ffff
!	Mem[0000000010181434] = ff000000, %l7 = 0000000000000000
	swap	[%i6+0x034],%l7		! %l7 = 00000000ff000000
!	Code Fragment 4, seed = 768110
p0_fragment_23:
!	%l0 = 0609fdb91ab28874
	setx	0xf7b85a6a452382b6,%g7,%l0 ! %l0 = f7b85a6a452382b6
!	%l1 = ffffffffffffffff
	setx	0x15294f98a40af1e1,%g7,%l1 ! %l1 = 15294f98a40af1e1
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = f7b85a6a452382b6
	setx	0x42d2a4107666d51c,%g7,%l0 ! %l0 = 42d2a4107666d51c
!	%l1 = 15294f98a40af1e1
	setx	0x3a2f0933d22a2f67,%g7,%l1 ! %l1 = 3a2f0933d22a2f67
p0_fragment_23_end:
!	%l2 = 8829bbff, %l3 = 46a6130c, Mem[0000000030181410] = 00000000 00000000
	stda	%l2,[%i6+%o5]0x89	! Mem[0000000030181410] = 8829bbff 46a6130c
!	Mem[0000000010181400] = 00000000, %l0 = 000000007666d51c
	swapa	[%i6+%g0]0x80,%l0	! %l0 = 0000000000000000
!	%l6 = 0000000000000039, Mem[0000000010101416] = 00000000
	sth	%l6,[%i4+0x016]		! Mem[0000000010101414] = 00000039
!	%l7 = 00000000ff000000, %l5 = fffffffffffffff6, %y  = 0000007b
	umul	%l7,%l5,%l1		! %l1 = fefffff60a000000, %y = fefffff6
!	%l5 = fffffffffffffff6, Mem[00000000201c0000] = 00ff56b0
	sth	%l5,[%o0+%g0]		! Mem[00000000201c0000] = fff656b0

p0_label_172:
!	Starting 10 instruction Load Burst
!	Mem[000000001010143c] = 63e462cb, %l2 = 000000008829bbff, %asi = 80
	ldsha	[%i4+0x03c]%asi,%l2	! %l2 = 00000000000063e4
!	Mem[0000000030001408] = ff38dbc9, %l4 = 0000000000000000
	lduba	[%i0+%o4]0x81,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010081408] = 2618b889, %l4 = 00000000000000ff
	ldsba	[%i2+%o4]0x88,%l4	! %l4 = ffffffffffffff89
!	Mem[0000000030081400] = 0000000000ff0000, %f22 = ffffffff 2267c302
	ldda	[%i2+%g0]0x89,%f22	! %f22 = 00000000 00ff0000
!	Mem[00000000100c1410] = 000000e700000000, %l1 = fefffff60a000000
	ldxa	[%i3+%o5]0x80,%l1	! %l1 = 000000e700000000
	membar	#Sync			! Added by membar checker (32)
!	Mem[0000000030081400] = 0000ff00 00000000 00000000 528a5c38
!	Mem[0000000030081410] = aa64e463 00000000 00000000 2a0300ff
!	Mem[0000000030081420] = 000000ff 1c576869 41737136 7569f2af
!	Mem[0000000030081430] = 2e43aea4 0e6afda5 54983c02 63e462cb
	ldda	[%i2+%g0]ASI_BLK_S,%f0 	! Block Load from 0000000030081400
!	Mem[0000000010081400] = ff000000, %l0 = 0000000000000000
	lduba	[%i2+%g0]0x80,%l0	! %l0 = 00000000000000ff
!	Mem[00000000300c1400] = ff000000, %l1 = 000000e700000000
	ldsha	[%i3+%g0]0x81,%l1	! %l1 = ffffffffffffff00
!	Mem[0000000030181408] = 000000ff, %f20 = f6efd97d
	lda	[%i6+%o4]0x89,%f20	! %f20 = 000000ff
!	Mem[0000000010101400] = ffff8c00 00000000 2618b889 55ecbcc1
!	Mem[0000000010101410] = c4576869 00000039 41c5c42a 465c9153
!	Mem[0000000010101420] = 0000032a 1c576869 00000000 000000ff
!	Mem[0000000010101430] = 00000000 0e6afda5 54983c02 63e462cb
	ldda	[%i4+%g0]ASI_BLK_AIUPL,%f16	! Block Load from 0000000010101400

p0_label_173:
!	Starting 10 instruction Store Burst
!	Mem[0000000010001418] = ff000000, %l6 = 00000039, %l1 = ffffff00
	add	%i0,0x18,%g1
	casa	[%g1]0x80,%l6,%l1	! %l1 = 00000000ff000000
!	Mem[0000000010101400] = 008cffff, %l4 = ffffffffffffff89
	ldstuba	[%i4+%g0]0x88,%l4	! %l4 = 00000000000000ff
!	%l2 = 00000000000063e4, Mem[0000000010041408] = 000000005ba87f75
	stxa	%l2,[%i1+%o4]0x80	! Mem[0000000010041408] = 00000000000063e4
!	%l0 = 00000000000000ff, Mem[0000000030181400] = ff0000ff
	stwa	%l0,[%i6+%g0]0x89	! Mem[0000000030181400] = 000000ff
!	Mem[0000000010141400] = ffff0000 ffffffff ff000000 00000000
!	%f16 = 00000000 008cffff c1bcec55 89b81826
!	%f20 = 39000000 696857c4 53915c46 2ac4c541
!	%f24 = 6968571c 2a030000 ff000000 00000000
!	%f28 = a5fd6a0e 00000000 cb62e463 023c9854
	stda	%f16,[%i5+%g0]ASI_BLK_P	! Block Store to 0000000010141400
!	%l4 = 00000000000000ff, Mem[0000000030101408] = 00000000000000ff
	stxa	%l4,[%i4+%o4]0x89	! Mem[0000000030101408] = 00000000000000ff
!	Mem[0000000010081404] = 00000000, %l4 = 00000000000000ff, %asi = 80
	swapa	[%i2+0x004]%asi,%l4	! %l4 = 0000000000000000
!	%f0  = 0000ff00 00000000, Mem[0000000010041410] = 000000ff 00000000
	std	%f0 ,[%i1+%o5]		! Mem[0000000010041410] = 0000ff00 00000000
!	%f16 = 00000000 008cffff, Mem[0000000010181400] = 1cd56676 00000062
	stda	%f16,[%i6+%g0]0x88	! Mem[0000000010181400] = 00000000 008cffff
	membar	#Sync			! Added by membar checker (33)
!	Mem[0000000010141404] = 008cffff, %l4 = 0000000000000000
	swap	[%i5+0x004],%l4		! %l4 = 00000000008cffff

p0_label_174:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = c4ffa825, %l0 = 00000000000000ff
	lduwa	[%i2+%o5]0x88,%l0	! %l0 = 00000000c4ffa825
!	Mem[00000000201c0001] = fff656b0, %l2 = 00000000000063e4, %asi = 80
	ldsba	[%o0+0x001]%asi,%l2	! %l2 = fffffffffffffff6
!	Mem[0000000010101410] = c4576869, %l4 = 00000000008cffff
	ldsha	[%i4+%o5]0x80,%l4	! %l4 = ffffffffffffc457
!	Mem[00000000100c1400] = c43da825, %l6 = 0000000000000039
	ldsha	[%i3+%g0]0x80,%l6	! %l6 = ffffffffffffc43d
!	Mem[0000000020800040] = 00ff7f10, %l3 = b599d4f146a6130c
	lduh	[%o1+0x040],%l3		! %l3 = 00000000000000ff
!	Mem[0000000010181410] = e7000000, %l1 = 00000000ff000000
	ldsha	[%i6+%o5]0x80,%l1	! %l1 = ffffffffffffe700
!	Mem[0000000010081410] = 25a8ffc4 00015eff, %l2 = fffffff6, %l3 = 000000ff
	ldda	[%i2+%o5]0x80,%l2	! %l2 = 0000000025a8ffc4 0000000000015eff
!	%f6  = 00000000, %f11 = 7569f2af, %f2  = 00000000
	fsubs	%f6 ,%f11,%f2 		! %f2  = f569f2af
!	%l1 = ffffffffffffe700, %l7 = 00000000ff000000, %y  = fefffff6
	sdiv	%l1,%l7,%l5		! %l5 = 000000007fffffff
	mov	%l0,%y			! %y = c4ffa825
!	Mem[0000000030041408] = 00000000, %l1 = ffffffffffffe700
	ldswa	[%i1+%o4]0x89,%l1	! %l1 = 0000000000000000

p0_label_175:
!	Starting 10 instruction Store Burst
!	Mem[0000000021800041] = 00005da0, %l3 = 0000000000015eff
	ldstuba	[%o3+0x041]%asi,%l3	! %l3 = 0000000000000000
!	%f11 = 7569f2af, %f19 = 89b81826
	fcmpes	%fcc0,%f11,%f19		! %fcc0 = 2
!	Mem[00000000300c1410] = 02c3b889, %l5 = 000000007fffffff
	ldstuba	[%i3+%o5]0x81,%l5	! %l5 = 0000000000000002
!	Mem[0000000030141400] = ffffffff, %l4 = ffffffffffffc457
	ldstuba	[%i5+%g0]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030181408] = ff000000, %l2 = 0000000025a8ffc4
	ldstuba	[%i6+%o4]0x81,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010181410] = 000000e7, %l2 = 00000000000000ff
	ldstuba	[%i6+%o5]0x88,%l2	! %l2 = 00000000000000e7
!	%l4 = 000000ff, %l5 = 00000002, Mem[0000000030101410] = 000000ff 00000000
	stda	%l4,[%i4+%o5]0x89	! Mem[0000000030101410] = 000000ff 00000002
!	%l5 = 0000000000000002, Mem[0000000030141410] = 8c000000
	stwa	%l5,[%i5+%o5]0x81	! Mem[0000000030141410] = 00000002
!	%f22 = 53915c46 2ac4c541, Mem[0000000010101400] = 008cffff 00000000
	stda	%f22,[%i4+%g0]0x88	! Mem[0000000010101400] = 53915c46 2ac4c541
!	%l0 = c4ffa825, %l1 = 00000000, Mem[0000000030181400] = ff000000 80000000
	stda	%l0,[%i6+%g0]0x81	! Mem[0000000030181400] = c4ffa825 00000000

p0_label_176:
!	Starting 10 instruction Load Burst
!	Mem[0000000020800040] = 00ff7f10, %l3 = 0000000000000000, %asi = 80
	lduha	[%o1+0x040]%asi,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030181408] = ff000000, %l0 = 00000000c4ffa825
	ldsba	[%i6+%o4]0x81,%l0	! %l0 = ffffffffffffffff
	membar	#Sync			! Added by membar checker (34)
!	Mem[00000000300c1400] = ff000000 196cef83 005c9153 00000000
!	Mem[00000000300c1410] = ffc3b889 00000000 13d17938 eac6fb48
!	Mem[00000000300c1420] = 29b68648 7bd47808 6f3e780d f6efd97d
!	Mem[00000000300c1430] = 25a83dc4 07a95c45 8b7a2f3c 3cb98a40
	ldda	[%i3+%g0]ASI_BLK_S,%f0 	! Block Load from 00000000300c1400
!	Mem[00000000201c0000] = fff656b0, %l0 = ffffffffffffffff
	ldsh	[%o0+%g0],%l0		! %l0 = fffffffffffffff6
!	Mem[0000000010101400] = 41c5c42a, %f28 = a5fd6a0e
	lda	[%i4+%g0]0x80,%f28	! %f28 = 41c5c42a
!	Mem[0000000010141410] = 39000000696857c4, %l0 = fffffffffffffff6
	ldxa	[%i5+%o5]0x80,%l0	! %l0 = 39000000696857c4
!	Mem[0000000010101410] = 696857c4, %l0 = 39000000696857c4
	ldswa	[%i4+%o5]0x88,%l0	! %l0 = 00000000696857c4
!	Mem[0000000010141400] = 00000000, %l6 = ffffffffffffc43d
	ldsha	[%i5+%g0]0x80,%l6	! %l6 = 0000000000000000
!	Mem[00000000300c1410] = ffc3b889 00000000, %l2 = 000000e7, %l3 = 000000ff
	ldda	[%i3+%o5]0x81,%l2	! %l2 = 00000000ffc3b889 0000000000000000
!	Mem[0000000030041408] = 00000000, %l0 = 00000000696857c4
	ldsha	[%i1+%o4]0x81,%l0	! %l0 = 0000000000000000

p0_label_177:
!	Starting 10 instruction Store Burst
!	Mem[0000000030101410] = ff000000, %l1 = 0000000000000000
	swapa	[%i4+%o5]0x81,%l1	! %l1 = 00000000ff000000
!	%l5 = 0000000000000002, Mem[0000000010001408] = 00015eff0000008c
	stxa	%l5,[%i0+%o4]0x80	! Mem[0000000010001408] = 0000000000000002
!	%l4 = 000000ff, %l5 = 00000002, Mem[0000000010181408] = 00000062 fd9cbcc1
	stda	%l4,[%i6+%o4]0x88	! Mem[0000000010181408] = 000000ff 00000002
!	%f12 = 25a83dc4 07a95c45, %l5 = 0000000000000002
!	Mem[0000000010141408] = c1bcec5589b81826
	add	%i5,0x008,%g1
	stda	%f12,[%g1+%l5]ASI_PST32_PL ! Mem[0000000010141408] = c1bcec55c43da825
!	Mem[0000000010141410] = 00000039, %l3 = 0000000000000000
	swapa	[%i5+%o5]0x88,%l3	! %l3 = 0000000000000039
!	Mem[0000000010181410] = ff000000, %l7 = 00000000ff000000, %asi = 80
	swapa	[%i6+0x010]%asi,%l7	! %l7 = 00000000ff000000
!	%f28 = 41c5c42a 00000000, %l5 = 0000000000000002
!	Mem[0000000030041400] = ffff000000000000
	stda	%f28,[%i1+%l5]ASI_PST8_S ! Mem[0000000030041400] = ffff000000000000
!	Mem[0000000030001408] = c9db38ff, %l6 = 0000000000000000
	ldstuba	[%i0+%o4]0x89,%l6	! %l6 = 00000000000000ff
!	%l2 = 00000000ffc3b889, Mem[0000000030041400] = ffff0000
	stba	%l2,[%i1+%g0]0x81	! Mem[0000000030041400] = 89ff0000
!	Mem[0000000010101400] = 41c5c42a, %l6 = 00000000000000ff
	ldstuba	[%i4+%g0]0x80,%l6	! %l6 = 0000000000000041

p0_label_178:
!	Starting 10 instruction Load Burst
!	%f7  = eac6fb48, %f2  = 005c9153, %f26 = ff000000
	fdivs	%f7 ,%f2 ,%f26		! %f26 = ff800000
!	Mem[000000001000142c] = 0d783e6f, %l5 = 0000000000000002, %asi = 80
	lduwa	[%i0+0x02c]%asi,%l5	! %l5 = 000000000d783e6f
!	Mem[00000000211c0000] = 00ff4d40, %l6 = 0000000000000041, %asi = 80
	ldsba	[%o2+0x000]%asi,%l6	! %l6 = 0000000000000000
!	Mem[0000000010081410] = c4ffa825, %l7 = 00000000ff000000
	ldsha	[%i2+%o5]0x88,%l7	! %l7 = ffffffffffffa825
!	Mem[0000000010081408] = 2618b889, %f31 = 023c9854
	lda	[%i2+%o4]0x88,%f31	! %f31 = 2618b889
!	Mem[0000000030001400] = 00000000, %l5 = 000000000d783e6f
	ldswa	[%i0+%g0]0x81,%l5	! %l5 = 0000000000000000
!	Mem[00000000300c1410] = ffc3b889, %l7 = ffffffffffffa825
	lduwa	[%i3+%o5]0x81,%l7	! %l7 = 00000000ffc3b889
!	Code Fragment 4, seed = 259069
p0_fragment_24:
!	%l0 = 0000000000000000
	setx	0x0993ded8545d653e,%g7,%l0 ! %l0 = 0993ded8545d653e
!	%l1 = 00000000ff000000
	setx	0x49d8cd457db7ede9,%g7,%l1 ! %l1 = 49d8cd457db7ede9
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 0993ded8545d653e
	setx	0xac7cd6696139b2a4,%g7,%l0 ! %l0 = ac7cd6696139b2a4
!	%l1 = 49d8cd457db7ede9
	setx	0x65744eaf63fb366f,%g7,%l1 ! %l1 = 65744eaf63fb366f
p0_fragment_24_end:
!	%l4 = 00000000000000ff, %l0 = ac7cd6696139b2a4, %y  = c4ffa825
	umul	%l4,%l0,%l7		! %l7 = 00000060d878f15c, %y = 00000060
!	Mem[0000000030081400] = 00ff0000, %l0 = ac7cd6696139b2a4
	ldsha	[%i2+%g0]0x89,%l0	! %l0 = 0000000000000000

p0_label_179:
!	Starting 10 instruction Store Burst
!	%l0 = 0000000000000000, Mem[0000000010081400] = ff000000
	stha	%l0,[%i2+%g0]0x80	! Mem[0000000010081400] = 00000000
!	%l6 = 0000000000000000, Mem[0000000010041408] = 00000000
	stba	%l6,[%i1+%o4]0x80	! Mem[0000000010041408] = 00000000
!	%f20 = 39000000 696857c4, %l6 = 0000000000000000
!	Mem[0000000010101400] = ffc5c42a465c9153
	stda	%f20,[%i4+%l6]ASI_PST8_PL ! Mem[0000000010101400] = ffc5c42a465c9153
!	%l4 = 00000000000000ff, Mem[00000000218000c0] = 33eb5e00, %asi = 80
	stha	%l4,[%o3+0x0c0]%asi	! Mem[00000000218000c0] = 00ff5e00
!	%f20 = 39000000 696857c4, %l4 = 00000000000000ff
!	Mem[0000000030001428] = 4df959d6375e54cf
	add	%i0,0x028,%g1
	stda	%f20,[%g1+%l4]ASI_PST8_SL ! Mem[0000000030001428] = c457686900000039
!	Mem[0000000030101400] = ff00032a, %l5 = 0000000000000000
	swapa	[%i4+%g0]0x81,%l5	! %l5 = 00000000ff00032a
!	Mem[0000000010081434] = 0e6afda5, %l6 = 0000000000000000
	swap	[%i2+0x034],%l6		! %l6 = 000000000e6afda5
!	%l6 = 000000000e6afda5, immd = 00000d6f, %y  = 00000060
	udiv	%l6,0xd6f,%l5		! %l5 = 0000000007268447
	mov	%l0,%y			! %y = 00000000
!	Mem[0000000010101400] = ffc5c42a, %l3 = 0000000000000039
	swapa	[%i4+%g0]0x80,%l3	! %l3 = 00000000ffc5c42a
!	Mem[0000000030041410] = 00000000, %l6 = 000000000e6afda5
	ldstuba	[%i1+%o5]0x89,%l6	! %l6 = 0000000000000000

p0_label_180:
!	Starting 10 instruction Load Burst
!	Code Fragment 4, seed = 578418
p0_fragment_25:
!	%l0 = 0000000000000000
	setx	0x1e0cec0ecbd8ee96,%g7,%l0 ! %l0 = 1e0cec0ecbd8ee96
!	%l1 = 65744eaf63fb366f
	setx	0x73f56fa4aa1a17c1,%g7,%l1 ! %l1 = 73f56fa4aa1a17c1
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 1e0cec0ecbd8ee96
	setx	0x726ebb622aaa94fc,%g7,%l0 ! %l0 = 726ebb622aaa94fc
!	%l1 = 73f56fa4aa1a17c1
	setx	0x9a5f291f6e076947,%g7,%l1 ! %l1 = 9a5f291f6e076947
p0_fragment_25_end:
!	Mem[0000000010001400] = 00000000, %l6 = 0000000000000000
	lduha	[%i0+%g0]0x88,%l6	! %l6 = 0000000000000000
	membar	#Sync			! Added by membar checker (35)
!	Mem[0000000010041400] = 02c30000 7dd9eff6 00000000 000063e4
!	Mem[0000000010041410] = 0000ff00 00000000 48fbc6ea 3879d1ff
!	Mem[0000000010041420] = 25a83dc4 00015eff 7dd9eff6 0d783e6f
!	Mem[0000000010041430] = ffffffff c43da825 00000000 3c2f7a8b
	ldda	[%i1+%g0]ASI_BLK_P,%f0 	! Block Load from 0000000010041400
!	Mem[0000000030041408] = 00000000, %l5 = 0000000007268447
	ldswa	[%i1+%o4]0x81,%l5	! %l5 = 0000000000000000
!	%f28 = 41c5c42a 00000000, %l2 = 00000000ffc3b889
!	Mem[0000000010141430] = a5fd6a0e00000000
	add	%i5,0x030,%g1
	stda	%f28,[%g1+%l2]ASI_PST16_P ! Mem[0000000010141430] = 41c56a0e00000000
!	Mem[0000000010081420] = fffcc3ff 1c576869, %l4 = 000000ff, %l5 = 00000000
	ldd	[%i2+0x020],%l4		! %l4 = 00000000fffcc3ff 000000001c576869
!	Mem[0000000010081410] = c4ffa825, %l6 = 0000000000000000
	ldsba	[%i2+%o5]0x88,%l6	! %l6 = 0000000000000025
!	Mem[0000000010001408] = 00000000, %f28 = 41c5c42a
	ld	[%i0+%o4],%f28		! %f28 = 00000000
!	Mem[0000000010141424] = 2a030000, %l5 = 000000001c576869, %asi = 80
	ldsha	[%i5+0x024]%asi,%l5	! %l5 = 0000000000002a03
!	Mem[0000000010041400] = f6efd97d 0000c302, %l2 = ffc3b889, %l3 = ffc5c42a
	ldda	[%i1+%g0]0x88,%l2	! %l2 = 000000000000c302 00000000f6efd97d

p0_label_181:
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (36)
!	%f10 = 7dd9eff6 0d783e6f, Mem[0000000010041400] = 0000c302 f6efd97d
	stda	%f10,[%i1+%g0]0x88	! Mem[0000000010041400] = 7dd9eff6 0d783e6f
!	Mem[0000000010181410] = ff000000, %l2 = 000000000000c302
	swap	[%i6+%o5],%l2		! %l2 = 00000000ff000000
!	Mem[0000000010041428] = 7dd9eff60d783e6f, %l7 = 00000060d878f15c, %l2 = 00000000ff000000
	add	%i1,0x28,%g1
	casxa	[%g1]0x80,%l7,%l2	! %l2 = 7dd9eff60d783e6f
!	%l5 = 0000000000002a03, Mem[0000000010081418] = 465c9153
	sth	%l5,[%i2+0x018]		! Mem[0000000010081418] = 2a039153
!	Mem[0000000030081410] = aa64e463, %l7 = 00000060d878f15c
	ldstuba	[%i2+%o5]0x81,%l7	! %l7 = 00000000000000aa
!	%f20 = 39000000 696857c4, Mem[0000000010081400] = 00000000 ff000000
	stda	%f20,[%i2+%g0]0x88	! Mem[0000000010081400] = 39000000 696857c4
!	%l3 = 00000000f6efd97d, Mem[0000000010101400] = 39000000
	stha	%l3,[%i4+%g0]0x88	! Mem[0000000010101400] = 3900d97d
!	Mem[0000000020800041] = 00ff7f10, %l0 = 726ebb622aaa94fc
	ldstub	[%o1+0x041],%l0		! %l0 = 00000000000000ff
!	Mem[0000000030101410] = 00000000, %l5 = 0000000000002a03
	swapa	[%i4+%o5]0x89,%l5	! %l5 = 0000000000000000
!	Code Fragment 3, seed = 650282
p0_fragment_26:
!	%l0 = 00000000000000ff
	setx	0xb1262d59ccde60d6,%g7,%l0 ! %l0 = b1262d59ccde60d6
!	%l1 = 9a5f291f6e076947
	setx	0x85dd0bd85ec1f601,%g7,%l1 ! %l1 = 85dd0bd85ec1f601
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = b1262d59ccde60d6
	setx	0xad1e72e2c2d91f3c,%g7,%l0 ! %l0 = ad1e72e2c2d91f3c
!	%l1 = 85dd0bd85ec1f601
	setx	0x59f7c6c3196cdf87,%g7,%l1 ! %l1 = 59f7c6c3196cdf87
p0_fragment_26_end:

p0_label_182:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = 02c30000, %l6 = 0000000000000025
	lduha	[%i6+%o5]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000030001400] = 00000000, %l3 = 00000000f6efd97d
	ldsba	[%i0+%g0]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000010181400] = ffff8c00, %l7 = 00000000000000aa
	lduba	[%i6+%g0]0x80,%l7	! %l7 = 00000000000000ff
!	Code Fragment 4, seed = 597852
p0_fragment_27:
!	%l0 = ad1e72e2c2d91f3c
	setx	0x131a55ee98389946,%g7,%l0 ! %l0 = 131a55ee98389946
!	%l1 = 59f7c6c3196cdf87
	setx	0x773408ba01c38371,%g7,%l1 ! %l1 = 773408ba01c38371
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 131a55ee98389946
	setx	0xe82fb5103f45f1ac,%g7,%l0 ! %l0 = e82fb5103f45f1ac
!	%l1 = 773408ba01c38371
	setx	0xf3131c820885e6f7,%g7,%l1 ! %l1 = f3131c820885e6f7
p0_fragment_27_end:
!	Mem[0000000010001410] = 2267c302, %l1 = f3131c820885e6f7
	ldswa	[%i0+%o5]0x88,%l1	! %l1 = 000000002267c302
!	Mem[0000000030141410] = 00000002, %l7 = 00000000000000ff
	ldsha	[%i5+%o5]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000030081408] = 00000000, %l2 = 7dd9eff60d783e6f
	ldsba	[%i2+%o4]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000010141410] = 00000000, %l6 = 0000000000000000
	ldsba	[%i5+%o5]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000030001408] = c9db38ff, %l4 = 00000000fffcc3ff
	lduba	[%i0+%o4]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030041408] = 00000000, %l2 = 0000000000000000
	lduwa	[%i1+%o4]0x81,%l2	! %l2 = 0000000000000000

p0_label_183:
!	Starting 10 instruction Store Burst
!	%l7 = 0000000000000000, Mem[0000000010101400] = 3900d97d
	stba	%l7,[%i4+%g0]0x88	! Mem[0000000010101400] = 3900d900
!	%f10 = 7dd9eff6 0d783e6f, %l2 = 0000000000000000
!	Mem[0000000010081438] = 54ff3c0263e462cb
	add	%i2,0x038,%g1
	stda	%f10,[%g1+%l2]ASI_PST32_P ! Mem[0000000010081438] = 54ff3c0263e462cb
!	Mem[0000000010041428] = 7dd9eff6, %l6 = 00000000, %l4 = 000000ff
	add	%i1,0x28,%g1
	casa	[%g1]0x80,%l6,%l4	! %l4 = 000000007dd9eff6
!	%f30 = cb62e463 2618b889, Mem[0000000010001400] = 00000000 00000000
	stda	%f30,[%i0+%g0]0x88	! Mem[0000000010001400] = cb62e463 2618b889
!	%f25 = 2a030000, Mem[00000000100c1410] = 000000e7
	sta	%f25,[%i3+%o5]0x80	! Mem[00000000100c1410] = 2a030000
!	Mem[00000000300c1408] = 53915c00, %l6 = 0000000000000000
	ldstuba	[%i3+%o4]0x89,%l6	! %l6 = 0000000000000000
!	%l2 = 0000000000000000, %l5 = 0000000000000000, %l6 = 0000000000000000
	xor	%l2,%l5,%l6		! %l6 = 0000000000000000
!	%l2 = 0000000000000000, Mem[0000000030141400] = ffffffff
	stba	%l2,[%i5+%g0]0x81	! Mem[0000000030141400] = 00ffffff
!	Mem[0000000010101410] = 696857c4, %l7 = 0000000000000000
	swapa	[%i4+%o5]0x88,%l7	! %l7 = 00000000696857c4
!	Mem[0000000010081400] = c4576869, %l5 = 0000000000000000
	ldstuba	[%i2+%g0]0x80,%l5	! %l5 = 00000000000000c4

p0_label_184:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = 00000000, %l5 = 00000000000000c4
	ldsha	[%i0+%o4]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000030181408] = 00000000 000000ff, %l4 = 7dd9eff6, %l5 = 00000000
	ldda	[%i6+%o4]0x89,%l4	! %l4 = 00000000000000ff 0000000000000000
!	Mem[00000000100c1410] = 000000000000032a, %l4 = 00000000000000ff
	ldxa	[%i3+%o5]0x88,%l4	! %l4 = 000000000000032a
!	Mem[0000000010001418] = ff00000000000000, %l2 = 0000000000000000, %asi = 80
	ldxa	[%i0+0x018]%asi,%l2	! %l2 = ff00000000000000
	membar	#Sync			! Added by membar checker (37)
!	Mem[0000000010101400] = 00d90039 465c9153 2618b889 55ecbcc1
!	Mem[0000000010101410] = 00000000 00000039 41c5c42a 465c9153
!	Mem[0000000010101420] = 0000032a 1c576869 00000000 000000ff
!	Mem[0000000010101430] = 00000000 0e6afda5 54983c02 63e462cb
	ldda	[%i4+%g0]ASI_BLK_AIUPL,%f0 	! Block Load from 0000000010101400
!	%f21 = 696857c4, %f23 = 2ac4c541, %f28 = 00000000
	fsubs	%f21,%f23,%f28		! %f28 = 696857c4
!	Mem[0000000030081408] = 00000000, %f31 = 2618b889
	lda	[%i2+%o4]0x89,%f31	! %f31 = 00000000
!	Mem[0000000010081400] = ff57686900000039, %f18 = c1bcec55 89b81826
	ldda	[%i2+%g0]0x80,%f18	! %f18 = ff576869 00000039
!	Mem[0000000030181400] = 00000000 25a8ffc4, %l4 = 0000032a, %l5 = 00000000
	ldda	[%i6+%g0]0x89,%l4	! %l4 = 0000000025a8ffc4 0000000000000000
!	Mem[0000000010041400] = 6f3e780d, %f23 = 2ac4c541
	lda	[%i1+%g0]0x80,%f23	! %f23 = 6f3e780d

p0_label_185:
!	Starting 10 instruction Store Burst
!	%l0 = 3f45f1ac, %l1 = 2267c302, Mem[0000000030081410] = 63e464ff 00000000
	stda	%l0,[%i2+%o5]0x89	! Mem[0000000030081410] = 3f45f1ac 2267c302
!	%l1 = 000000002267c302, %l2 = ff00000000000000, %l7 = 00000000696857c4
	xor	%l1,%l2,%l7		! %l7 = ff0000002267c302
!	Mem[0000000030001410] = ff5e0100, %l5 = 0000000000000000
	swapa	[%i0+%o5]0x81,%l5	! %l5 = 00000000ff5e0100
!	%f16 = 00000000, %f14 = cb62e463, %f18 = ff576869
	fmuls	%f16,%f14,%f18		! %f18 = 80000000
!	Mem[0000000010181408] = ff000000, %l2 = 0000000000000000
	swapa	[%i6+%o4]0x80,%l2	! %l2 = 00000000ff000000
!	Mem[00000000201c0000] = fff656b0, %l4 = 0000000025a8ffc4
	ldstuba	[%o0+0x000]%asi,%l4	! %l4 = 00000000000000ff
!	%l0 = e82fb5103f45f1ac, Mem[0000000030141408] = ff00000044b45255
	stxa	%l0,[%i5+%o4]0x81	! Mem[0000000030141408] = e82fb5103f45f1ac
!	Mem[0000000010001420] = 6968571c000000ff, %l5 = 00000000ff5e0100, %l4 = 00000000000000ff
	add	%i0,0x20,%g1
	casxa	[%g1]0x80,%l5,%l4	! %l4 = 6968571c000000ff
!	%l2 = ff000000, %l3 = 00000000, Mem[0000000030041408] = 00000000 000000ff
	stda	%l2,[%i1+%o4]0x81	! Mem[0000000030041408] = ff000000 00000000
!	Mem[0000000010181400] = ffff8c00, %l2 = 00000000ff000000
	ldstuba	[%i6+%g0]0x80,%l2	! %l2 = 00000000000000ff

p0_label_186:
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = 00000000, %l4 = 6968571c000000ff
	lduba	[%i4+%g0]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000010181410] = 0000c302, %l6 = 0000000000000000
	lduwa	[%i6+%o5]0x80,%l6	! %l6 = 000000000000c302
!	Mem[0000000010041410] = 00ff0000, %l4 = 0000000000000000
	ldsba	[%i1+%o5]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000030041400] = 0000ff89, %l4 = 0000000000000000
	ldsha	[%i1+%g0]0x89,%l4	! %l4 = ffffffffffffff89
!	Mem[0000000010081410] = 25a8ffc400015eff, %f24 = 6968571c 2a030000
	ldda	[%i2+%o5]0x80,%f24	! %f24 = 25a8ffc4 00015eff
!	Mem[0000000020800040] = 00ff7f10, %l5 = 00000000ff5e0100, %asi = 80
	ldsha	[%o1+0x040]%asi,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010181410] = 0000c302 0b790000, %l2 = 000000ff, %l3 = 00000000
	ldda	[%i6+%o5]0x80,%l2	! %l2 = 000000000000c302 000000000b790000
!	Mem[000000001000143e] = ff00ff00, %l7 = ff0000002267c302
	ldsh	[%i0+0x03e],%l7		! %l7 = ffffffffffffff00
!	Mem[0000000010141410] = 00000000, %f21 = 696857c4
	lda	[%i5+%o5]0x88,%f21	! %f21 = 00000000
!	Mem[0000000010041420] = 25a83dc4 00015eff, %l0 = 3f45f1ac, %l1 = 2267c302
	ldd	[%i1+0x020],%l0		! %l0 = 0000000025a83dc4 0000000000015eff

p0_label_187:
!	Starting 10 instruction Store Burst
!	%l2 = 0000c302, %l3 = 0b790000, Mem[0000000030041400] = 0000ff89 00000000
	stda	%l2,[%i1+%g0]0x89	! Mem[0000000030041400] = 0000c302 0b790000
!	%l4 = ffffffffffffff89, Mem[0000000010181410] = 02c30000
	stha	%l4,[%i6+%o5]0x88	! Mem[0000000010181410] = 02c3ff89
!	Mem[0000000010001408] = 00000000, %l4 = 00000000ffffff89
	swapa	[%i0+%o4]0x88,%l4	! %l4 = 0000000000000000
!	%l0 = 0000000025a83dc4, Mem[00000000100c1410] = 0000032a
	stba	%l0,[%i3+%o5]0x88	! Mem[00000000100c1410] = 000003c4
!	%l7 = ffffffffffffff00, Mem[0000000030101408] = ff000000
	stha	%l7,[%i4+%o4]0x81	! Mem[0000000030101408] = ff000000
!	Mem[0000000010101410] = 00000000, %l1 = 0000000000015eff
	ldstuba	[%i4+%o5]0x80,%l1	! %l1 = 0000000000000000
!	%l0 = 0000000025a83dc4, %l4 = 0000000000000000, %y  = 00000000
	sdiv	%l0,%l4,%l7		! Div by zero, %l0 = 0000000025a83dec
!	%l2 = 000000000000c302, Mem[0000000030001400] = 00000000
	stba	%l2,[%i0+%g0]0x81	! Mem[0000000030001400] = 02000000
!	Code Fragment 4, seed = 5216
p0_fragment_28:
!	%l0 = 0000000025a83dec
	setx	0xf5c911f842193526,%g7,%l0 ! %l0 = f5c911f842193526
!	%l1 = 0000000000000000
	setx	0x8e5e074186d6d951,%g7,%l1 ! %l1 = 8e5e074186d6d951
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = f5c911f842193526
	setx	0x1e01a734bb16e18c,%g7,%l0 ! %l0 = 1e01a734bb16e18c
!	%l1 = 8e5e074186d6d951
	setx	0x1cc8ac06c22950d7,%g7,%l1 ! %l1 = 1cc8ac06c22950d7
p0_fragment_28_end:
!	%l4 = 0000000000000000, Mem[000000001018140c] = 02000000, %asi = 80
	stwa	%l4,[%i6+0x00c]%asi	! Mem[000000001018140c] = 00000000

p0_label_188:
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = ffc3b889, %l0 = 1e01a734bb16e18c
	lduwa	[%i3+%o5]0x81,%l0	! %l0 = 00000000ffc3b889
!	Mem[0000000010181400] = ffff8c00, %l2 = 000000000000c302, %asi = 80
	lduha	[%i6+0x000]%asi,%l2	! %l2 = 000000000000ffff
!	Mem[00000000300c1408] = ff5c915300000000, %l3 = 000000000b790000
	ldxa	[%i3+%o4]0x81,%l3	! %l3 = ff5c915300000000
!	Mem[0000000010001410] = 02c36722, %l6 = 000000000000c302
	lduba	[%i0+%o5]0x80,%l6	! %l6 = 0000000000000002
!	Mem[0000000030181400] = c4ffa825, %l2 = 000000000000ffff
	ldsba	[%i6+%g0]0x81,%l2	! %l2 = ffffffffffffffc4
!	Mem[0000000030141400] = ffffff00, %l7 = ffffffffffffff00
	ldsba	[%i5+%g0]0x89,%l7	! %l7 = 0000000000000000
!	Mem[000000001014143b] = cb62e463, %l0 = 00000000ffc3b889, %asi = 80
	ldsba	[%i5+0x03b]%asi,%l0	! %l0 = 0000000000000063
!	Mem[000000001008140b] = 89b81826, %l3 = ff5c915300000000, %asi = 80
	ldsba	[%i2+0x00b]%asi,%l3	! %l3 = 0000000000000026
!	Mem[000000001010140c] = 55ecbcc1, %l6 = 0000000000000002
	ldsw	[%i4+0x00c],%l6		! %l6 = 0000000055ecbcc1
!	Mem[0000000010101424] = 1c576869, %l6 = 0000000055ecbcc1
	ldsb	[%i4+0x024],%l6		! %l6 = 000000000000001c

p0_label_189:
!	Starting 10 instruction Store Burst
!	%f29 = 00000000, Mem[0000000010141438] = cb62e463
	sta	%f29,[%i5+0x038]%asi	! Mem[0000000010141438] = 00000000
!	%l7 = 0000000000000000, Mem[0000000030141400] = 00ffffff
	stwa	%l7,[%i5+%g0]0x81	! Mem[0000000030141400] = 00000000
!	%l6 = 0000001c, %l7 = 00000000, Mem[00000000300c1400] = 000000ff 83ef6c19
	stda	%l6,[%i3+%g0]0x89	! Mem[00000000300c1400] = 0000001c 00000000
!	%l4 = 0000000000000000, Mem[0000000030001400] = 02000000
	stba	%l4,[%i0+%g0]0x81	! Mem[0000000030001400] = 00000000
!	%l3 = 0000000000000026, %l0 = 0000000000000063, %y  = 00000000
	umul	%l3,%l0,%l4		! %l4 = 0000000000000eb2, %y = 00000000
!	%f7  = 2ac4c541, Mem[0000000030081410] = acf1453f
	sta	%f7 ,[%i2+%o5]0x81	! Mem[0000000030081410] = 2ac4c541
!	Mem[0000000030041408] = 000000ff, %l2 = 00000000ffffffc4
	swapa	[%i1+%o4]0x89,%l2	! %l2 = 00000000000000ff
!	%l1 = 1cc8ac06c22950d7, Mem[0000000010001400] = cb62e4632618b889
	stxa	%l1,[%i0+%g0]0x88	! Mem[0000000010001400] = 1cc8ac06c22950d7
!	Mem[0000000010181400] = ffff8c00, %l4 = 0000000000000eb2
	swapa	[%i6+%g0]0x80,%l4	! %l4 = 00000000ffff8c00
!	Mem[0000000010101410] = ff000000, %l2 = 00000000000000ff, %asi = 80
	swapa	[%i4+0x010]%asi,%l2	! %l2 = 00000000ff000000

p0_label_190:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = 25a8ffc4, %l3 = 0000000000000026
	lduba	[%i2+%o5]0x80,%l3	! %l3 = 0000000000000025
!	Mem[00000000300c1410] = ffc3b889, %l0 = 0000000000000063
	ldsba	[%i3+%o5]0x81,%l0	! %l0 = ffffffffffffffff
!	Mem[000000001014140e] = c43da825, %l5 = 00000000000000ff, %asi = 80
	lduha	[%i5+0x00e]%asi,%l5	! %l5 = 000000000000a825
!	%l1 = 1cc8ac06c22950d7, Mem[000000001008141e] = 00000000, %asi = 80
	stha	%l1,[%i2+0x01e]%asi	! Mem[000000001008141c] = 000050d7
!	Mem[00000000100c1410] = 00000000000003c4, %f24 = 25a8ffc4 00015eff
	ldda	[%i3+%o5]0x88,%f24	! %f24 = 00000000 000003c4
!	Mem[0000000030081408] = 00000000, %f3  = 89b81826
	lda	[%i2+%o4]0x81,%f3 	! %f3 = 00000000
!	Mem[0000000030041410] = ff000000 000000ff, %l6 = 0000001c, %l7 = 00000000
	ldda	[%i1+%o5]0x89,%l6	! %l6 = 00000000000000ff 00000000ff000000
!	Mem[0000000010181410] = 89ffc3020b790000, %f6  = 53915c46 2ac4c541
	ldda	[%i6+%o5]0x80,%f6 	! %f6  = 89ffc302 0b790000
!	Mem[0000000030001410] = 25a83dc4 00000000, %l6 = 000000ff, %l7 = ff000000
	ldda	[%i0+%o5]0x89,%l6	! %l6 = 0000000000000000 0000000025a83dc4
!	Mem[0000000010001408] = ffffff89, %l0 = ffffffffffffffff
	ldsha	[%i0+%o4]0x88,%l0	! %l0 = ffffffffffffff89

p0_label_191:
!	Starting 10 instruction Store Burst
!	Mem[0000000010181400] = 00000eb2 00000000 00000000 00000000
!	%f16 = 00000000 008cffff 80000000 00000039
!	%f20 = 39000000 00000000 53915c46 6f3e780d
!	%f24 = 00000000 000003c4 ff800000 00000000
!	%f28 = 696857c4 00000000 cb62e463 00000000
	stda	%f16,[%i6+%g0]ASI_COMMIT_P	! Block Store to 0000000010181400
!	%l7 = 0000000025a83dc4, Mem[00000000211c0000] = 00ff4d40, %asi = 80
	stha	%l7,[%o2+0x000]%asi	! Mem[00000000211c0000] = 3dc44d40
	membar	#Sync			! Added by membar checker (38)
!	%l6 = 0000000000000000, Mem[0000000010101410] = 000000ff00000039
	stxa	%l6,[%i4+%o5]0x80	! Mem[0000000010101410] = 0000000000000000
!	%l1 = 1cc8ac06c22950d7, imm = fffffffffffff7e6, %l6 = 0000000000000000
	addc	%l1,-0x81a,%l6		! %l6 = 1cc8ac06c22948bd
!	%l0 = ffffffffffffff89, Mem[0000000010041424] = 00015eff, %asi = 80
	stha	%l0,[%i1+0x024]%asi	! Mem[0000000010041424] = ff895eff
!	%f16 = 00000000 008cffff, Mem[0000000030141400] = 00000000 00ffdbca
	stda	%f16,[%i5+%g0]0x81	! Mem[0000000030141400] = 00000000 008cffff
!	%l2 = ff000000, %l3 = 00000025, Mem[0000000010101410] = 00000000 00000000
	stda	%l2,[%i4+%o5]0x88	! Mem[0000000010101410] = ff000000 00000025
!	%f20 = 39000000 00000000, %l7 = 0000000025a83dc4
!	Mem[0000000010041420] = 25a83dc4ff895eff
	add	%i1,0x020,%g1
	stda	%f20,[%g1+%l7]ASI_PST16_P ! Mem[0000000010041420] = 25a80000ff895eff
!	Mem[0000000010101400] = 00d90039, %l3 = 0000000000000025
	ldstuba	[%i4+%g0]0x80,%l3	! %l3 = 0000000000000000
!	%l2 = 00000000ff000000, Mem[0000000010041410] = 0000ff00
	stba	%l2,[%i1+%o5]0x80	! Mem[0000000010041410] = 0000ff00

p0_label_192:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = 89b81826, %l2 = 00000000ff000000
	lduwa	[%i2+%o4]0x80,%l2	! %l2 = 0000000089b81826
!	Mem[0000000030001408] = c9db38ff, %l4 = 00000000ffff8c00
	lduha	[%i0+%o4]0x89,%l4	! %l4 = 00000000000038ff
!	Mem[00000000300c1408] = 53915cff, %f7  = 0b790000
	lda	[%i3+%o4]0x89,%f7 	! %f7 = 53915cff
!	Mem[00000000211c0001] = 3dc44d40, %l7 = 0000000025a83dc4, %asi = 80
	ldsba	[%o2+0x001]%asi,%l7	! %l7 = ffffffffffffffc4
!	Mem[00000000300c1410] = 89b8c3ff, %l2 = 0000000089b81826
	ldsha	[%i3+%o5]0x89,%l2	! %l2 = ffffffffffffc3ff
!	Mem[0000000010141408] = 55ecbcc1, %f26 = ff800000
	lda	[%i5+%o4]0x88,%f26	! %f26 = 55ecbcc1
!	Mem[0000000030001408] = c9db38ff, %l5 = 000000000000a825
	lduha	[%i0+%o4]0x89,%l5	! %l5 = 00000000000038ff
!	Mem[0000000030141400] = 00000000008cffff, %l5 = 00000000000038ff
	ldxa	[%i5+%g0]0x81,%l5	! %l5 = 00000000008cffff
!	Mem[0000000010081408] = 2618b889, %l4 = 00000000000038ff
	ldsba	[%i2+%o4]0x88,%l4	! %l4 = ffffffffffffff89
!	Mem[0000000010141408] = 55ecbcc1, %l5 = 00000000008cffff
	ldswa	[%i5+%o4]0x88,%l5	! %l5 = 0000000055ecbcc1

p0_label_193:
!	Starting 10 instruction Store Burst
!	%f16 = 00000000 008cffff, Mem[0000000010141410] = 00000000 c4576869
	stda	%f16,[%i5+%o5]0x88	! Mem[0000000010141410] = 00000000 008cffff
!	Mem[0000000010141410] = ffff8c00, %l4 = 00000000ffffff89
	swapa	[%i5+%o5]0x80,%l4	! %l4 = 00000000ffff8c00
!	%l2 = ffffffffffffc3ff, Mem[0000000010141400] = 00000000
	stwa	%l2,[%i5+%g0]0x80	! Mem[0000000010141400] = ffffc3ff
!	Mem[00000000100c1410] = c4030000, %l3 = 0000000000000000
	swapa	[%i3+%o5]0x80,%l3	! %l3 = 00000000c4030000
!	Mem[00000000100c1400] = c43da825, %l0 = 00000000ffffff89
	swapa	[%i3+%g0]0x80,%l0	! %l0 = 00000000c43da825
!	%f8  = 6968571c 2a030000, Mem[0000000010141400] = ffffc3ff 00000000
	stda	%f8 ,[%i5+%g0]0x80	! Mem[0000000010141400] = 6968571c 2a030000
!	%f16 = 00000000 008cffff, %l7 = ffffffffffffffc4
!	Mem[0000000010101418] = 41c5c42a465c9153
	add	%i4,0x018,%g1
	stda	%f16,[%g1+%l7]ASI_PST8_PL ! Mem[0000000010101418] = 41c58c2a465c0000
!	%l1 = 1cc8ac06c22950d7, Mem[0000000010101410] = 000000ff
	stba	%l1,[%i4+%o5]0x80	! Mem[0000000010101410] = d70000ff
!	%l5 = 0000000055ecbcc1, Mem[0000000030001410] = 00000000
	stha	%l5,[%i0+%o5]0x81	! Mem[0000000030001410] = bcc10000
!	%l2 = ffffffffffffc3ff, %l4 = 00000000ffff8c00, %y  = 00000000
	udiv	%l2,%l4,%l2		! %l2 = 0000000000000001
	mov	%l0,%y			! %y = c43da825

p0_label_194:
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = ff38dbc9, %l1 = 1cc8ac06c22950d7
	ldsba	[%i0+%o4]0x81,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010141410] = ffffff89, %l6 = 1cc8ac06c22948bd
	ldsha	[%i5+%o5]0x80,%l6	! %l6 = ffffffffffffffff
!	%l7 = ffffffffffffffc4, %l5 = 0000000055ecbcc1, %l0 = 00000000c43da825
	orn	%l7,%l5,%l0		! %l0 = fffffffffffffffe
!	Mem[0000000010181410] = 39000000, %l0 = fffffffffffffffe
	ldsha	[%i6+%o5]0x80,%l0	! %l0 = 0000000000003900
!	Mem[0000000030101408] = ff000000, %l0 = 0000000000003900
	ldsha	[%i4+%o4]0x81,%l0	! %l0 = ffffffffffffff00
!	Mem[0000000010001400] = d75029c2 06acc81c, %l6 = ffffffff, %l7 = ffffffc4
	ldda	[%i0+%g0]0x80,%l6	! %l6 = 00000000d75029c2 0000000006acc81c
!	Mem[0000000010181434] = 00000000, %l6 = 00000000d75029c2
	ldub	[%i6+0x034],%l6		! %l6 = 0000000000000000
!	Mem[0000000010181410] = 39000000 00000000, %l4 = ffff8c00, %l5 = 55ecbcc1, %asi = 80
	ldda	[%i6+0x010]%asi,%l4	! %l4 = 0000000039000000 0000000000000000
!	Mem[0000000030041410] = ff000000, %l3 = 00000000c4030000
	lduwa	[%i1+%o5]0x81,%l3	! %l3 = 00000000ff000000
!	Mem[00000000100c1410] = 00000000, %l4 = 0000000039000000
	lduwa	[%i3+%o5]0x88,%l4	! %l4 = 0000000000000000

p0_label_195:
!	Starting 10 instruction Store Burst
!	%f4  = 39000000, Mem[0000000010181408] = 80000000
	sta	%f4 ,[%i6+%o4]0x80	! Mem[0000000010181408] = 39000000
!	%f10 = ff000000 00000000, Mem[0000000010101400] = ffd90039 465c9153, %asi = 80
	stda	%f10,[%i4+0x000]%asi	! Mem[0000000010101400] = ff000000 00000000
!	Mem[0000000010081408] = 89b81826, %l3 = 00000000ff000000
	ldstuba	[%i2+%o4]0x80,%l3	! %l3 = 0000000000000089
!	Mem[0000000010001400] = d75029c2 06acc81c 89ffffff 00000002
!	%f16 = 00000000 008cffff 80000000 00000039
!	%f20 = 39000000 00000000 53915c46 6f3e780d
!	%f24 = 00000000 000003c4 55ecbcc1 00000000
!	%f28 = 696857c4 00000000 cb62e463 00000000
	stda	%f16,[%i0+%g0]ASI_COMMIT_P	! Block Store to 0000000010001400
!	%l3 = 0000000000000089, Mem[000000001014143e] = 023c9854
	sth	%l3,[%i5+0x03e]		! Mem[000000001014143c] = 023c0089
	membar	#Sync			! Added by membar checker (39)
!	%l4 = 0000000000000000, Mem[0000000010001429] = 55ecbcc1, %asi = 80
	stba	%l4,[%i0+0x029]%asi	! Mem[0000000010001428] = 5500bcc1
!	%l6 = 0000000000000000, %l3 = 0000000000000089, %l3  = 0000000000000089
	mulx	%l6,%l3,%l3		! %l3 = 0000000000000000
!	%f30 = cb62e463 00000000, Mem[0000000010081438] = 54ff3c02 63e462cb, %asi = 80
	stda	%f30,[%i2+0x038]%asi	! Mem[0000000010081438] = cb62e463 00000000
!	%l5 = 0000000000000000, Mem[0000000010001400] = ffff8c0000000000
	stxa	%l5,[%i0+%g0]0x88	! Mem[0000000010001400] = 0000000000000000
!	Mem[00000000300c1410] = ffc3b889, %l2 = 0000000000000001
	ldstuba	[%i3+%o5]0x81,%l2	! %l2 = 00000000000000ff

p0_label_196:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = 0000000000000000, %f22 = 53915c46 6f3e780d
	ldda	[%i3+%o5]0x88,%f22	! %f22 = 00000000 00000000
!	Mem[00000000300c1410] = ffc3b88900000000, %l0 = ffffffffffffff00
	ldxa	[%i3+%o5]0x81,%l0	! %l0 = ffc3b88900000000
!	Mem[0000000010101410] = d70000ff, %l4 = 0000000000000000
	ldsba	[%i4+%o5]0x80,%l4	! %l4 = ffffffffffffffd7
!	%l0 = ffc3b88900000000, immd = fffffffffffffe77, %l1  = ffffffffffffffff
	mulx	%l0,-0x189,%l1		! %l1 = 5c89b5af00000000
!	Mem[0000000030041400] = 0000c302, %l5 = 0000000000000000
	lduha	[%i1+%g0]0x89,%l5	! %l5 = 000000000000c302
!	Mem[0000000010081418] = 2a039153, %f26 = 55ecbcc1
	lda	[%i2+0x018]%asi,%f26	! %f26 = 2a039153
!	Mem[00000000100c1408] = 000000ff, %l1 = 5c89b5af00000000
	ldsb	[%i3+%o4],%l1		! %l1 = 0000000000000000
!	Mem[00000000100c1434] = 000000c1, %l3 = 0000000000000000
	lduh	[%i3+0x034],%l3		! %l3 = 0000000000000000
!	Mem[00000000300c1400] = 00000000 0000001c, %l4 = ffffffd7, %l5 = 0000c302
	ldda	[%i3+%g0]0x89,%l4	! %l4 = 000000000000001c 0000000000000000
!	Mem[0000000010181408] = 39000000 00000039, %l6 = 00000000, %l7 = 06acc81c
	ldda	[%i6+%o4]0x88,%l6	! %l6 = 0000000000000039 0000000039000000

p0_label_197:
!	Starting 10 instruction Store Burst
!	%f10 = ff000000 00000000, Mem[0000000030101408] = 000000ff 00000000
	stda	%f10,[%i4+%o4]0x89	! Mem[0000000030101408] = ff000000 00000000
!	Mem[0000000010041438] = 00000000, %l7 = 0000000039000000
	swap	[%i1+0x038],%l7		! %l7 = 0000000000000000
!	%l2 = 000000ff, %l3 = 00000000, Mem[0000000010101410] = ff0000d7 00000025
	stda	%l2,[%i4+%o5]0x88	! Mem[0000000010101410] = 000000ff 00000000
!	%l3 = 0000000000000000, Mem[0000000030101410] = 032a000002000000
	stxa	%l3,[%i4+%o5]0x81	! Mem[0000000030101410] = 0000000000000000
!	%f30 = cb62e463 00000000, Mem[0000000030101400] = 00000000 00000000
	stda	%f30,[%i4+%g0]0x81	! Mem[0000000030101400] = cb62e463 00000000
!	Mem[0000000010001408] = 8000000000000039, %l7 = 0000000000000000, %l4 = 000000000000001c
	add	%i0,0x08,%g1
	casxa	[%g1]0x80,%l7,%l4	! %l4 = 8000000000000039
!	%l4 = 00000039, %l5 = 00000000, Mem[0000000010141420] = 6968571c 2a030000, %asi = 80
	stda	%l4,[%i5+0x020]%asi	! Mem[0000000010141420] = 00000039 00000000
!	%l3 = 0000000000000000, Mem[0000000030081408] = 00000000
	stba	%l3,[%i2+%o4]0x81	! Mem[0000000030081408] = 00000000
!	%l3 = 0000000000000000, Mem[0000000021800180] = 032a8090, %asi = 80
	stha	%l3,[%o3+0x180]%asi	! Mem[0000000021800180] = 00008090
!	Mem[0000000010181408] = 00000039, %l5 = 0000000000000000
	ldstuba	[%i6+%o4]0x88,%l5	! %l5 = 0000000000000039

p0_label_198:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = 000000ff, %l0 = ffc3b88900000000
	lduha	[%i6+%o4]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010141428] = ff000000, %l4 = 8000000000000039
	lduh	[%i5+0x028],%l4		! %l4 = 000000000000ff00
!	Mem[0000000010141421] = 00000039, %l1 = 0000000000000000
	ldub	[%i5+0x021],%l1		! %l1 = 0000000000000000
!	Mem[0000000030141410] = 0000000002000000, %f10 = ff000000 00000000
	ldda	[%i5+%o5]0x89,%f10	! %f10 = 00000000 02000000
!	Mem[0000000010041424] = ff895eff, %l1 = 0000000000000000, %asi = 80
	lduwa	[%i1+0x024]%asi,%l1	! %l1 = 00000000ff895eff
!	Mem[0000000030181400] = c4ffa825, %l6 = 0000000000000039
	lduwa	[%i6+%g0]0x81,%l6	! %l6 = 00000000c4ffa825
!	Mem[0000000030101410] = 00000000, %l2 = 00000000000000ff
	lduwa	[%i4+%o5]0x81,%l2	! %l2 = 0000000000000000
!	Mem[00000000211c0001] = 3dc44d40, %l1 = 00000000ff895eff, %asi = 80
	ldsba	[%o2+0x001]%asi,%l1	! %l1 = ffffffffffffffc4
!	Mem[0000000010041402] = 6f3e780d, %l7 = 0000000000000000, %asi = 80
	ldsba	[%i1+0x002]%asi,%l7	! %l7 = 0000000000000078
!	Mem[0000000030041410] = ff000000000000ff, %l4 = 000000000000ff00
	ldxa	[%i1+%o5]0x89,%l4	! %l4 = ff000000000000ff

p0_label_199:
!	Starting 10 instruction Store Burst
!	Mem[0000000010001400] = 00000000, %l0 = 00000000000000ff
	ldstuba	[%i0+%g0]0x80,%l0	! %l0 = 0000000000000000
!	%f12 = a5fd6a0e 00000000, Mem[0000000030141400] = 00000000 008cffff
	stda	%f12,[%i5+%g0]0x81	! Mem[0000000030141400] = a5fd6a0e 00000000
!	%l7 = 0000000000000078, %l6 = 00000000c4ffa825, %l4 = ff000000000000ff
	addc	%l7,%l6,%l4		! %l4 = 00000000c4ffa89d
!	%l6 = 00000000c4ffa825, Mem[0000000021800080] = 00ff9fd0
	sth	%l6,[%o3+0x080]		! Mem[0000000021800080] = a8259fd0
!	Mem[0000000010101408] = 2618b889, %l0 = 0000000000000000
	ldstuba	[%i4+%o4]0x80,%l0	! %l0 = 0000000000000026
!	%l1 = ffffffffffffffc4, Mem[0000000020800040] = 00ff7f10
	sth	%l1,[%o1+0x040]		! Mem[0000000020800040] = ffc47f10
!	%l1 = ffffffffffffffc4, Mem[0000000010101400] = ff000000
	stba	%l1,[%i4+%g0]0x80	! Mem[0000000010101400] = c4000000
!	Mem[0000000010001400] = ff000000, %l1 = 00000000ffffffc4
	swapa	[%i0+%g0]0x80,%l1	! %l1 = 00000000ff000000
!	%l0 = 0000000000000026, Mem[0000000010081408] = ffb818265ba87f75
	stxa	%l0,[%i2+%o4]0x80	! Mem[0000000010081408] = 0000000000000026
!	%l0 = 0000000000000026, Mem[0000000010001402] = ffffffc4
	sth	%l0,[%i0+0x002]		! Mem[0000000010001400] = ffff0026

p0_label_200:
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = 0000001c, %l3 = 0000000000000000
	ldswa	[%i3+%g0]0x89,%l3	! %l3 = 000000000000001c
!	Mem[0000000030101410] = 00000000 00000000, %l2 = 00000000, %l3 = 0000001c
	ldda	[%i4+%o5]0x81,%l2	! %l2 = 0000000000000000 0000000000000000
!	Mem[0000000010081400] = 696857ff, %l1 = 00000000ff000000
	lduha	[%i2+%g0]0x88,%l1	! %l1 = 00000000000057ff
!	Mem[00000000100c1408] = 000000ff 53915c00, %l2 = 00000000, %l3 = 00000000
	ldda	[%i3+%o4]0x80,%l2	! %l2 = 00000000000000ff 0000000053915c00
!	Mem[0000000010181400] = 00000000, %l2 = 00000000000000ff
	ldswa	[%i6+%g0]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000010001410] = 00000039, %l2 = 0000000000000000
	lduha	[%i0+%o5]0x88,%l2	! %l2 = 0000000000000039
!	Mem[0000000030041410] = 000000ff, %l7 = 0000000000000078
	lduba	[%i1+%o5]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030041400] = 02c300000000790b, %l6 = 00000000c4ffa825
	ldxa	[%i1+%g0]0x81,%l6	! %l6 = 02c300000000790b
!	Mem[00000000100c1400] = ffffff89, %l1 = 00000000000057ff
	lduba	[%i3+%g0]0x80,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010001400] = ffff0026, %f16 = 00000000
	lda	[%i0+%g0]0x80,%f16	! %f16 = ffff0026

p0_label_201:
!	Starting 10 instruction Store Burst
!	%l1 = 00000000000000ff, Mem[00000000100c1408] = ff000000
	stwa	%l1,[%i3+%o4]0x88	! Mem[00000000100c1408] = 000000ff
!	%f22 = 00000000 00000000, Mem[0000000010141408] = 55ecbcc1 25a83dc4
	stda	%f22,[%i5+%o4]0x88	! Mem[0000000010141408] = 00000000 00000000
!	%l4 = 00000000c4ffa89d, Mem[0000000010041408] = e463000000000000
	stxa	%l4,[%i1+%o4]0x88	! Mem[0000000010041408] = 00000000c4ffa89d
!	%l3 = 0000000053915c00, Mem[0000000030181400] = c4ffa82500000000
	stxa	%l3,[%i6+%g0]0x81	! Mem[0000000030181400] = 0000000053915c00
!	%f16 = ffff0026 008cffff, Mem[0000000030181410] = ffbb2988 0c13a646
	stda	%f16,[%i6+%o5]0x81	! Mem[0000000030181410] = ffff0026 008cffff
!	Mem[0000000030141410] = 00000002, %l2 = 0000000000000039
	ldstuba	[%i5+%o5]0x81,%l2	! %l2 = 0000000000000000
!	%l1 = 00000000000000ff, Mem[00000000300c1400] = 0000001c
	stba	%l1,[%i3+%g0]0x89	! Mem[00000000300c1400] = 000000ff
!	%l4 = 00000000c4ffa89d, Mem[0000000010081410] = c4ffa825
	stwa	%l4,[%i2+%o5]0x88	! Mem[0000000010081410] = c4ffa89d
!	%f24 = 00000000 000003c4, Mem[0000000010001408] = 00000080 39000000
	stda	%f24,[%i0+%o4]0x88	! Mem[0000000010001408] = 00000000 000003c4
!	Mem[0000000010041408] = c4ffa89d, %l3 = 0000000053915c00
	swapa	[%i1+%o4]0x88,%l3	! %l3 = 00000000c4ffa89d

p0_label_202:
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = 0000c302, %f16 = ffff0026
	lda	[%i1+%g0]0x89,%f16	! %f16 = 0000c302
!	Mem[0000000010141400] = 6968571c, %l3 = 00000000c4ffa89d
	lduha	[%i5+%g0]0x80,%l3	! %l3 = 0000000000006968
!	Mem[000000001004140c] = 00000000, %l7 = 00000000000000ff
	lduw	[%i1+0x00c],%l7		! %l7 = 0000000000000000
!	Mem[00000000300c1410] = ffc3b889, %l1 = 00000000000000ff
	ldswa	[%i3+%o5]0x81,%l1	! %l1 = ffffffffffc3b889
!	Mem[0000000030041400] = 0000c302, %f3  = 00000000
	lda	[%i1+%g0]0x89,%f3 	! %f3 = 0000c302
!	Mem[0000000020800000] = ffff2ce0, %l2 = 0000000000000000
	ldub	[%o1+%g0],%l2		! %l2 = 00000000000000ff
!	Mem[0000000010181410] = 00000039, %l0 = 0000000000000026
	lduwa	[%i6+%o5]0x88,%l0	! %l0 = 0000000000000039
!	Mem[0000000010041400] = 6f3e780df6efd97d, %f14 = cb62e463 023c9854, %asi = 80
	ldda	[%i1+0x000]%asi,%f14	! %f14 = 6f3e780d f6efd97d
!	Mem[00000000211c0001] = 3dc44d40, %l6 = 02c300000000790b
	ldsb	[%o2+0x001],%l6		! %l6 = ffffffffffffffc4
!	Mem[0000000030181410] = 2600ffff, %l3 = 0000000000006968
	ldsha	[%i6+%o5]0x89,%l3	! %l3 = ffffffffffffffff

p0_label_203:
!	Starting 10 instruction Store Burst
!	Mem[0000000010001400] = ffff0026, %l2 = 00000000000000ff
	swapa	[%i0+%g0]0x80,%l2	! %l2 = 00000000ffff0026
!	%l7 = 0000000000000000, Mem[0000000010041414] = 00000000, %asi = 80
	stwa	%l7,[%i1+0x014]%asi	! Mem[0000000010041414] = 00000000
!	Mem[0000000010101408] = 89b818ff, %l7 = 0000000000000000
	ldstuba	[%i4+%o4]0x88,%l7	! %l7 = 00000000000000ff
!	%l7 = 00000000000000ff, Mem[0000000010101400] = c4000000
	stba	%l7,[%i4+%g0]0x80	! Mem[0000000010101400] = ff000000
!	%f7  = 53915cff, Mem[0000000010101400] = ff000000
	st	%f7 ,[%i4+%g0]		! Mem[0000000010101400] = 53915cff
!	%l4 = 00000000c4ffa89d, Mem[0000000030081400] = 00ff0000
	stha	%l4,[%i2+%g0]0x89	! Mem[0000000030081400] = 00ffa89d
!	%l0 = 0000000000000039, Mem[00000000300c1410] = ffc3b889
	stha	%l0,[%i3+%o5]0x81	! Mem[00000000300c1410] = 0039b889
!	Mem[0000000030101408] = 00000000, %l7 = 00000000000000ff
	ldstuba	[%i4+%o4]0x89,%l7	! %l7 = 0000000000000000
!	%f2  = c1bcec55 0000c302, %l3 = ffffffffffffffff
!	Mem[0000000030001430] = 5552b44466ede8c5
	add	%i0,0x030,%g1
	stda	%f2,[%g1+%l3]ASI_PST16_SL ! Mem[0000000030001430] = 02c3000055ecbcc1
!	%l2 = 00000000ffff0026, Mem[000000001008141b] = 2a039153
	stb	%l2,[%i2+0x01b]		! Mem[0000000010081418] = 2a039126

p0_label_204:
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = 0e6afda5, %l5 = 0000000000000039
	ldsba	[%i5+%g0]0x89,%l5	! %l5 = ffffffffffffffa5
!	Mem[00000000300c1408] = ff5c9153, %l3 = ffffffffffffffff
	lduba	[%i3+%o4]0x81,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030081408] = 00000000, %f6  = 89ffc302
	lda	[%i2+%o4]0x81,%f6 	! %f6 = 00000000
!	Mem[0000000010001420] = 00000000 000003c4, %l6 = ffffffc4, %l7 = 00000000
	ldd	[%i0+0x020],%l6		! %l6 = 0000000000000000 00000000000003c4
!	Mem[0000000010081408] = 2600000000000000, %f18 = 80000000 00000039
	ldda	[%i2+%o4]0x88,%f18	! %f18 = 26000000 00000000
!	Mem[0000000010001400] = ff000000, %l3 = 00000000000000ff
	ldsha	[%i0+%g0]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000010101400] = 53915cff, %f7  = 53915cff
	ld	[%i4+%g0],%f7 		! %f7 = 53915cff
!	Mem[0000000010101400] = 53915cff, %l7 = 00000000000003c4
	lduha	[%i4+%g0]0x80,%l7	! %l7 = 0000000000005391
!	Mem[0000000030101410] = 00000000, %l5 = ffffffffffffffa5
	lduha	[%i4+%o5]0x81,%l5	! %l5 = 0000000000000000
!	%l5 = 0000000000000000, imm = ffffffffffffff93, %l3 = 0000000000000000
	addc	%l5,-0x06d,%l3		! %l3 = ffffffffffffff93

p0_label_205:
!	Starting 10 instruction Store Burst
!	%l6 = 0000000000000000, Mem[0000000030181410] = 2600ffff
	stwa	%l6,[%i6+%o5]0x89	! Mem[0000000030181410] = 00000000
!	%f0  = 53915c46 3900d900, Mem[0000000010181428] = ff800000 00000000
	std	%f0 ,[%i6+0x028]	! Mem[0000000010181428] = 53915c46 3900d900
!	Mem[00000000100c141c] = ff000000, %l5 = 0000000000000000
	ldstub	[%i3+0x01c],%l5		! %l5 = 00000000000000ff
!	Mem[0000000010041414] = 00000000, %l0 = 00000039, %l6 = 00000000
	add	%i1,0x14,%g1
	casa	[%g1]0x80,%l0,%l6	! %l6 = 0000000000000000
!	Mem[0000000010041414] = 00000000, %l2 = 00000000ffff0026, %asi = 80
	swapa	[%i1+0x014]%asi,%l2	! %l2 = 0000000000000000
!	%l3 = ffffffffffffff93, Mem[0000000010181408] = ff000000
	stwa	%l3,[%i6+%o4]0x80	! Mem[0000000010181408] = ffffff93
!	%l4 = 00000000c4ffa89d, Mem[0000000010001408] = c4030000
	stba	%l4,[%i0+%o4]0x80	! Mem[0000000010001408] = 9d030000
!	%l5 = 00000000000000ff, Mem[0000000010001438] = cb62e46300000000
	stx	%l5,[%i0+0x038]		! Mem[0000000010001438] = 00000000000000ff
!	Mem[00000000100c1408] = ff000000, %l1 = 00000000ffc3b889, %asi = 80
	swapa	[%i3+0x008]%asi,%l1	! %l1 = 00000000ff000000
!	%l2 = 0000000000000000, %l5 = 00000000000000ff, %y  = c43da825
	sdiv	%l2,%l5,%l5		! %l5 = ffffffff80000000
	mov	%l0,%y			! %y = 00000039

p0_label_206:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = 39000000696857ff, %f0  = 53915c46 3900d900
	ldda	[%i2+%g0]0x88,%f0 	! %f0  = 39000000 696857ff
!	Mem[0000000010181410] = 00000039, %l2 = 0000000000000000
	lduwa	[%i6+%o5]0x88,%l2	! %l2 = 0000000000000039
!	Mem[0000000020800040] = ffc47f10, %l2 = 0000000000000039
	lduh	[%o1+0x040],%l2		! %l2 = 000000000000ffc4
!	Mem[000000001014143e] = 023c0089, %l5 = ffffffff80000000
	ldsb	[%i5+0x03e],%l5		! %l5 = 0000000000000000
!	Mem[0000000010181400] = ffff8c0000000000, %l2 = 000000000000ffc4
	ldxa	[%i6+%g0]0x88,%l2	! %l2 = ffff8c0000000000
!	Mem[0000000010101410] = 00000000 000000ff, %l2 = 00000000, %l3 = ffffff93
	ldda	[%i4+%o5]0x88,%l2	! %l2 = 00000000000000ff 0000000000000000
!	Mem[000000001008140c] = 00000026, %l6 = 0000000000000000
	ldsh	[%i2+0x00c],%l6		! %l6 = 0000000000000000
!	Mem[00000000201c0001] = fff656b0, %l7 = 0000000000005391, %asi = 80
	lduba	[%o0+0x001]%asi,%l7	! %l7 = 00000000000000f6
	membar	#Sync			! Added by membar checker (40)
!	Mem[0000000030141400] = a5fd6a0e 00000000 e82fb510 3f45f1ac
!	Mem[0000000030141410] = ff000002 00000000 00000000 000000ff
!	Mem[0000000030141420] = fffcc3ff 1c576869 41737136 7569f2af
!	Mem[0000000030141430] = 00000000 00000000 54983c02 63e462cb
	ldda	[%i5+%g0]ASI_BLK_AIUSL,%f0 	! Block Load from 0000000030141400
!	Mem[0000000010181410] = 0000000000000039, %l3 = 0000000000000000
	ldxa	[%i6+%o5]0x88,%l3	! %l3 = 0000000000000039

p0_label_207:
!	Starting 10 instruction Store Burst
!	Mem[0000000030041408] = ffffffc4, %l6 = 0000000000000000
	ldstuba	[%i1+%o4]0x89,%l6	! %l6 = 00000000000000c4
!	%l0 = 0000000000000039, Mem[00000000201c0000] = fff656b0, %asi = 80
	stha	%l0,[%o0+0x000]%asi	! Mem[00000000201c0000] = 003956b0
!	Mem[0000000030141408] = e82fb510, %l2 = 00000000000000ff
	swapa	[%i5+%o4]0x81,%l2	! %l2 = 00000000e82fb510
!	%l6 = 00000000000000c4, Mem[0000000030081400] = 9da8ff0000000000
	stxa	%l6,[%i2+%g0]0x81	! Mem[0000000030081400] = 00000000000000c4
!	Code Fragment 4, seed = 515380
p0_fragment_29:
!	%l0 = 0000000000000039
	setx	0xc7c3d2055da00286,%g7,%l0 ! %l0 = c7c3d2055da00286
!	%l1 = 00000000ff000000
	setx	0x6667a48f6db7a8b1,%g7,%l1 ! %l1 = 6667a48f6db7a8b1
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = c7c3d2055da00286
	setx	0x6e1d465017da12ec,%g7,%l0 ! %l0 = 6e1d465017da12ec
!	%l1 = 6667a48f6db7a8b1
	setx	0x51d4c91528694437,%g7,%l1 ! %l1 = 51d4c91528694437
p0_fragment_29_end:
!	Mem[00000000300c1400] = ff000000, %l1 = 51d4c91528694437
	ldstuba	[%i3+%g0]0x81,%l1	! %l1 = 00000000000000ff
!	%l1 = 00000000000000ff, Mem[0000000030181408] = 000000ff
	stha	%l1,[%i6+%o4]0x89	! Mem[0000000030181408] = 000000ff
!	%l6 = 000000c4, %l7 = 000000f6, Mem[0000000030181410] = 00000000 008cffff
	stda	%l6,[%i6+%o5]0x81	! Mem[0000000030181410] = 000000c4 000000f6
!	%l4 = 00000000c4ffa89d, %l6 = 00000000000000c4, %l2 = 00000000e82fb510
	orn	%l4,%l6,%l2		! %l2 = ffffffffffffffbf
!	%f25 = 000003c4, Mem[0000000010081400] = 696857ff
	sta	%f25,[%i2+%g0]0x88	! Mem[0000000010081400] = 000003c4

p0_label_208:
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = 000000ff, %l4 = 00000000c4ffa89d
	ldsba	[%i4+%o4]0x89,%l4	! %l4 = ffffffffffffffff
!	%l5 = 0000000000000000, imm = 000000000000017a, %l2 = ffffffffffffffbf
	andn	%l5,0x17a,%l2		! %l2 = 0000000000000000
!	Mem[0000000010101408] = ff18b88955ecbcc1, %l1 = 00000000000000ff
	ldxa	[%i4+%o4]0x80,%l1	! %l1 = ff18b88955ecbcc1
!	Mem[0000000010141400] = 6968571c, %l1 = ff18b88955ecbcc1
	lduwa	[%i5+%g0]0x80,%l1	! %l1 = 000000006968571c
!	Mem[00000000300c1400] = ff00000000000000, %f24 = 00000000 000003c4
	ldda	[%i3+%g0]0x81,%f24	! %f24 = ff000000 00000000
!	Mem[00000000218000c0] = 00ff5e00, %l1 = 000000006968571c, %asi = 80
	ldsba	[%o3+0x0c0]%asi,%l1	! %l1 = 0000000000000000
!	Mem[0000000010041408] = 53915c00, %l3 = 0000000000000039
	ldsha	[%i1+%o4]0x88,%l3	! %l3 = 0000000000005c00
!	Mem[0000000010101410] = 000000ff, %l4 = ffffffffffffffff
	lduba	[%i4+%o5]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030001400] = 13000000 00000000, %l0 = 17da12ec, %l1 = 00000000
	ldda	[%i0+%g0]0x89,%l0	! %l0 = 0000000000000000 0000000013000000
!	Mem[0000000010101400] = 53915cff, %l6 = 00000000000000c4
	ldsba	[%i4+%g0]0x80,%l6	! %l6 = 0000000000000053

p0_label_209:
!	Starting 10 instruction Store Burst
!	%l1 = 0000000013000000, Mem[00000000211c0000] = 3dc44d40
	sth	%l1,[%o2+%g0]		! Mem[00000000211c0000] = 00004d40
!	%l7 = 00000000000000f6, Mem[0000000010101408] = ff18b88955ecbcc1, %asi = 80
	stxa	%l7,[%i4+0x008]%asi	! Mem[0000000010101408] = 00000000000000f6
	membar	#Sync			! Added by membar checker (41)
!	%l5 = 0000000000000000, Mem[0000000030141408] = 000000ff3f45f1ac
	stxa	%l5,[%i5+%o4]0x81	! Mem[0000000030141408] = 0000000000000000
!	%l3 = 0000000000005c00, immd = fffffffffffffbb8, %l0  = 0000000000000000
	mulx	%l3,-0x448,%l0		! %l0 = fffffffffe762000
!	Mem[0000000030101410] = 00000000, %l4 = 00000000000000ff
	ldstuba	[%i4+%o5]0x89,%l4	! %l4 = 0000000000000000
!	%f8  = 6968571c ffc3fcff, %l4 = 0000000000000000
!	Mem[0000000010081428] = c1bcece77569f2af
	add	%i2,0x028,%g1
	stda	%f8,[%g1+%l4]ASI_PST16_PL ! Mem[0000000010081428] = c1bcece77569f2af
!	Mem[0000000030101400] = cb62e463, %l1 = 0000000013000000
	ldstuba	[%i4+%g0]0x81,%l1	! %l1 = 00000000000000cb
!	%f6  = ff000000 00000000, Mem[00000000100c1410] = 00000000 00000000
	stda	%f6 ,[%i3+%o5]0x80	! Mem[00000000100c1410] = ff000000 00000000
!	%l6 = 0000000000000053, Mem[0000000010041408] = 53915c00
	stha	%l6,[%i1+%o4]0x88	! Mem[0000000010041408] = 53910053
!	%l3 = 0000000000005c00, Mem[0000000030081400] = c400000000000000
	stxa	%l3,[%i2+%g0]0x89	! Mem[0000000030081400] = 0000000000005c00

p0_label_210:
!	Starting 10 instruction Load Burst
!	Mem[0000000030001400] = 00000000, %f24 = ff000000
	lda	[%i0+%g0]0x89,%f24	! %f24 = 00000000
!	Mem[00000000100c1400] = ffffff89, %l2 = 0000000000000000
	ldsw	[%i3+%g0],%l2		! %l2 = ffffffffffffff89
!	Mem[0000000030081400] = 0000000000005c00, %l7 = 00000000000000f6
	ldxa	[%i2+%g0]0x89,%l7	! %l7 = 0000000000005c00
!	Mem[00000000211c0001] = 00004d40, %l1 = 00000000000000cb
	ldsb	[%o2+0x001],%l1		! %l1 = 0000000000000000
!	Mem[0000000030141410] = 020000ff, %l1 = 0000000000000000
	ldsha	[%i5+%o5]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[00000000100c1410] = ff000000, %l5 = 0000000000000000
	lduwa	[%i3+%o5]0x80,%l5	! %l5 = 00000000ff000000
!	Mem[0000000030141400] = 0e6afda5, %l2 = ffffffffffffff89
	ldswa	[%i5+%g0]0x89,%l2	! %l2 = 000000000e6afda5
!	Mem[00000000211c0000] = 00004d40, %l6 = 0000000000000053, %asi = 80
	lduba	[%o2+0x000]%asi,%l6	! %l6 = 0000000000000000
!	Mem[0000000010101410] = ff000000, %l2 = 000000000e6afda5
	lduha	[%i4+%o5]0x80,%l2	! %l2 = 000000000000ff00
!	Mem[0000000030001408] = ff38dbc9, %l2 = 000000000000ff00
	ldsha	[%i0+%o4]0x81,%l2	! %l2 = ffffffffffffff38

p0_label_211:
!	Starting 10 instruction Store Burst
!	%l2 = ffffff38, %l3 = 00005c00, Mem[0000000010181408] = ffffff93 00000039
	stda	%l2,[%i6+%o4]0x80	! Mem[0000000010181408] = ffffff38 00005c00
!	Mem[0000000010141412] = ffffff89, %l0 = fffffffffe762000
	ldstub	[%i5+0x012],%l0		! %l0 = 00000000000000ff
!	Mem[0000000010001414] = 00000000, %l5 = 00000000ff000000
	swap	[%i0+0x014],%l5		! %l5 = 0000000000000000
!	%f10 = aff26975, Mem[0000000010041410] = 00ff0000
	sta	%f10,[%i1+%o5]0x88	! Mem[0000000010041410] = aff26975
!	%l7 = 0000000000005c00, Mem[0000000030001410] = bcc10000c43da825
	stxa	%l7,[%i0+%o5]0x81	! Mem[0000000030001410] = 0000000000005c00
!	Mem[0000000030081400] = 005c0000 00000000 00000000 528a5c38
!	%f0  = 00000000 0e6afda5 acf1453f 10b52fe8
!	%f4  = 00000000 020000ff ff000000 00000000
!	%f8  = 6968571c ffc3fcff aff26975 36717341
!	%f12 = 00000000 00000000 cb62e463 023c9854
	stda	%f0 ,[%i2+%g0]ASI_COMMIT_S	! Block Store to 0000000030081400
!	Mem[00000000211c0000] = 00004d40, %l0 = 00000000000000ff
	ldstub	[%o2+%g0],%l0		! %l0 = 0000000000000000
!	%l7 = 0000000000005c00, Mem[00000000100c1400] = 89ffffff
	stha	%l7,[%i3+%g0]0x88	! Mem[00000000100c1400] = 89ff5c00
!	Mem[0000000010181420] = 00000000, %l6 = 0000000000000000, %asi = 80
	swapa	[%i6+0x020]%asi,%l6	! %l6 = 0000000000000000
!	%f14 = cb62e463 023c9854, %l0 = 0000000000000000
!	Mem[0000000010181438] = cb62e46300000000
	add	%i6,0x038,%g1
	stda	%f14,[%g1+%l0]ASI_PST8_P ! Mem[0000000010181438] = cb62e46300000000

p0_label_212:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = 89b8c3ff, %l5 = 0000000000000000
	lduha	[%i3+%o4]0x88,%l5	! %l5 = 000000000000c3ff
!	Mem[00000000300c1400] = ff000000 00000000, %l4 = 00000000, %l5 = 0000c3ff
	ldda	[%i3+%g0]0x81,%l4	! %l4 = 00000000ff000000 0000000000000000
!	Mem[0000000030101400] = ff62e463, %f25 = 00000000
	lda	[%i4+%g0]0x81,%f25	! %f25 = ff62e463
	membar	#Sync			! Added by membar checker (42)
!	Mem[0000000010081400] = c4030000 00000039 00000000 00000026
!	Mem[0000000010081410] = 9da8ffc4 00015eff 2a039126 000050d7
!	Mem[0000000010081420] = fffcc3ff 1c576869 c1bcece7 7569f2af
!	Mem[0000000010081430] = 2e43aea4 00000000 cb62e463 00000000
	ldda	[%i2+%g0]ASI_BLK_AIUPL,%f0 	! Block Load from 0000000010081400
!	Mem[0000000010141410] = ffffff89, %l5 = 0000000000000000
	lduwa	[%i5+%o5]0x80,%l5	! %l5 = 00000000ffffff89
!	Mem[0000000030101400] = ff62e46300000000, %l1 = 00000000000000ff
	ldxa	[%i4+%g0]0x81,%l1	! %l1 = ff62e46300000000
!	Mem[0000000030101410] = ff00000000000000, %f26 = 2a039153 00000000
	ldda	[%i4+%o5]0x81,%f26	! %f26 = ff000000 00000000
!	Mem[0000000010181434] = 00000000, %l4 = 00000000ff000000
	ldsw	[%i6+0x034],%l4		! %l4 = 0000000000000000
!	Mem[0000000030101410] = ff000000, %l6 = 0000000000000000
	ldsba	[%i4+%o5]0x81,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000030081410] = 00000000, %f19 = 00000000
	lda	[%i2+%o5]0x81,%f19	! %f19 = 00000000

p0_label_213:
!	Starting 10 instruction Store Burst
!	%f18 = 26000000 00000000, Mem[00000000300c1408] = ff5c9153 00000000
	stda	%f18,[%i3+%o4]0x81	! Mem[00000000300c1408] = 26000000 00000000
!	Mem[0000000030181400] = 00000000, %l3 = 0000000000005c00
	ldstuba	[%i6+%g0]0x81,%l3	! %l3 = 0000000000000000
!	%f22 = 00000000 00000000, %l0 = 0000000000000000
!	Mem[00000000300c1410] = 0039b88900000000
	add	%i3,0x010,%g1
	stda	%f22,[%g1+%l0]ASI_PST8_S ! Mem[00000000300c1410] = 0039b88900000000
!	%l2 = ffffffffffffff38, Mem[0000000030141410] = ff00000200000000
	stxa	%l2,[%i5+%o5]0x81	! Mem[0000000030141410] = ffffffffffffff38
!	Mem[0000000030181410] = c4000000, %l4 = 0000000000000000
	ldstuba	[%i6+%o5]0x89,%l4	! %l4 = 0000000000000000
	membar	#Sync			! Added by membar checker (43)
!	%f16 = 0000c302 008cffff, Mem[0000000010081408] = 00000000 26000000
	stda	%f16,[%i2+%o4]0x88	! Mem[0000000010081408] = 0000c302 008cffff
!	Mem[0000000030001400] = 00000000, %l2 = ffffffffffffff38
	ldstuba	[%i0+%g0]0x89,%l2	! %l2 = 0000000000000000
!	%l3 = 0000000000000000, Mem[0000000010041416] = ffff0026, %asi = 80
	stba	%l3,[%i1+0x016]%asi	! Mem[0000000010041414] = ffff0026
!	%l5 = 00000000ffffff89, Mem[0000000030041400] = 02c30000
	stha	%l5,[%i1+%g0]0x81	! Mem[0000000030041400] = ff890000
!	Mem[000000001000143a] = 00000000, %l6 = ffffffffffffffff
	ldstub	[%i0+0x03a],%l6		! %l6 = 0000000000000000

p0_label_214:
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = ff38dbc9, %l2 = 0000000000000000
	lduba	[%i0+%o4]0x81,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010181400] = 00000000, %l1 = ff62e46300000000
	ldsba	[%i6+%g0]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010141410] = 00000000 89ffffff, %l4 = 00000000, %l5 = ffffff89
	ldda	[%i5+%o5]0x88,%l4	! %l4 = 0000000089ffffff 0000000000000000
!	Mem[0000000010181400] = 00000000 008cffff ffffff38 00005c00
!	Mem[0000000010181410] = 39000000 00000000 53915c46 6f3e780d
!	Mem[0000000010181420] = 00000000 000003c4 53915c46 3900d900
!	Mem[0000000010181430] = 696857c4 00000000 cb62e463 00000000
	ldda	[%i6+%g0]ASI_BLK_AIUPL,%f16	! Block Load from 0000000010181400
!	Mem[00000000201c0000] = 003956b0, %l6 = 0000000000000000
	ldsb	[%o0+%g0],%l6		! %l6 = 0000000000000000
!	Mem[0000000010041430] = ffffffff, %l7 = 0000000000005c00, %asi = 80
	lduwa	[%i1+0x030]%asi,%l7	! %l7 = 00000000ffffffff
!	Mem[0000000010101419] = 41c58c2a, %l0 = 0000000000000000
	ldsb	[%i4+0x019],%l0		! %l0 = ffffffffffffffc5
!	Mem[0000000010041410] = 7569f2af, %l1 = 0000000000000000, %asi = 80
	ldswa	[%i1+0x010]%asi,%l1	! %l1 = 000000007569f2af
!	Mem[00000000100c1404] = 00000121, %f2  = 26000000
	ld	[%i3+0x004],%f2 	! %f2 = 00000121
!	Mem[0000000010141408] = 00000000, %l7 = 00000000ffffffff
	lduha	[%i5+%o4]0x88,%l7	! %l7 = 0000000000000000

p0_label_215:
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (44)
!	%l4 = 89ffffff, %l5 = 00000000, Mem[0000000010181420] = 00000000 000003c4, %asi = 80
	stda	%l4,[%i6+0x020]%asi	! Mem[0000000010181420] = 89ffffff 00000000
!	Mem[000000001010140c] = 000000f6, %l0 = 00000000ffffffc5, %asi = 80
	swapa	[%i4+0x00c]%asi,%l0	! %l0 = 00000000000000f6
!	%l3 = 0000000000000000, imm = 00000000000001a5, %l2 = 00000000000000ff
	addc	%l3,0x1a5,%l2		! %l2 = 00000000000001a5
!	Mem[0000000010141438] = 00000000, %l6 = 0000000000000000
	ldstub	[%i5+0x038],%l6		! %l6 = 0000000000000000
!	Mem[0000000010181400] = 00000000, %l4 = 0000000089ffffff
	ldstuba	[%i6+%g0]0x88,%l4	! %l4 = 0000000000000000
!	%l0 = 000000f6, %l1 = 7569f2af, Mem[0000000010001428] = 5500bcc1 00000000
	std	%l0,[%i0+0x028]		! Mem[0000000010001428] = 000000f6 7569f2af
!	Mem[0000000030101410] = 000000ff, %l2 = 00000000000001a5
	swapa	[%i4+%o5]0x89,%l2	! %l2 = 00000000000000ff
!	%l3 = 0000000000000000, Mem[0000000010181408] = ffffff3800005c00
	stxa	%l3,[%i6+%o4]0x80	! Mem[0000000010181408] = 0000000000000000
!	%l6 = 0000000000000000, Mem[0000000010181410] = 00000039
	stha	%l6,[%i6+%o5]0x88	! Mem[0000000010181410] = 00000000
!	Mem[0000000030101400] = 63e462ff, %l6 = 0000000000000000
	ldstuba	[%i4+%g0]0x89,%l6	! %l6 = 00000000000000ff

p0_label_216:
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = a5fd6a0e, %l6 = 00000000000000ff
	ldsba	[%i5+%g0]0x81,%l6	! %l6 = ffffffffffffffa5
!	Code Fragment 4, seed = 592924
p0_fragment_30:
!	%l0 = 00000000000000f6
	setx	0xac8927052381f346,%g7,%l0 ! %l0 = ac8927052381f346
!	%l1 = 000000007569f2af
	setx	0x9a90b9636955bd71,%g7,%l1 ! %l1 = 9a90b9636955bd71
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = ac8927052381f346
	setx	0x6f39cf422a4b0bac,%g7,%l0 ! %l0 = 6f39cf422a4b0bac
!	%l1 = 9a90b9636955bd71
	setx	0x29b376b03e07e0f7,%g7,%l1 ! %l1 = 29b376b03e07e0f7
p0_fragment_30_end:
!	Mem[0000000010141400] = 1c576869, %l2 = 00000000000000ff
	ldsha	[%i5+%g0]0x88,%l2	! %l2 = 0000000000006869
!	Mem[0000000010141408] = 00000000, %l5 = 0000000000000000
	ldswa	[%i5+%o4]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000010081408] = ffff8c00, %l1 = 29b376b03e07e0f7
	ldsba	[%i2+%o4]0x80,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000030141410] = ffffffff, %l5 = 0000000000000000
	lduba	[%i5+%o5]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030081408] = acf1453f10b52fe8, %l3 = 0000000000000000
	ldxa	[%i2+%o4]0x81,%l3	! %l3 = acf1453f10b52fe8
!	Mem[0000000010001410] = 00000039, %f25 = 00000000
	lda	[%i0+%o5]0x88,%f25	! %f25 = 00000039
!	Mem[0000000030101408] = 000000ff, %l0 = 6f39cf422a4b0bac
	lduha	[%i4+%o4]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030141410] = 38ffffffffffffff, %l3 = acf1453f10b52fe8
	ldxa	[%i5+%o5]0x89,%l3	! %l3 = 38ffffffffffffff

p0_label_217:
!	Starting 10 instruction Store Burst
!	Mem[0000000010181434] = 00000000, %l7 = 0000000000000000
	swap	[%i6+0x034],%l7		! %l7 = 0000000000000000
!	Mem[0000000010081400] = 000003c4, %l3 = 38ffffffffffffff
	ldstuba	[%i2+%g0]0x88,%l3	! %l3 = 00000000000000c4
!	Mem[00000000201c0001] = 003956b0, %l1 = ffffffffffffffff
	ldstuba	[%o0+0x001]%asi,%l1	! %l1 = 0000000000000039
!	Mem[0000000010081408] = ffff8c00, %l2 = 0000000000006869
	swapa	[%i2+%o4]0x80,%l2	! %l2 = 00000000ffff8c00
!	Mem[0000000010081408] = 00006869, %l5 = 00000000000000ff
	lduha	[%i2+%o4]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000010141408] = 00000000, %l2 = 00000000ffff8c00
	ldstuba	[%i5+%o4]0x88,%l2	! %l2 = 0000000000000000
!	%l5 = 0000000000000000, Mem[00000000201c0000] = 00ff56b0, %asi = 80
	stba	%l5,[%o0+0x000]%asi	! Mem[00000000201c0000] = 00ff56b0
!	%l4 = 0000000000000000, Mem[0000000010181408] = 00000000
	stha	%l4,[%i6+%o4]0x88	! Mem[0000000010181408] = 00000000
!	%l2 = 0000000000000000, Mem[0000000020800041] = ffc47f10
	stb	%l2,[%o1+0x041]		! Mem[0000000020800040] = ff007f10
!	%f2  = 00000121 00000000, Mem[0000000010081410] = c4ffa89d ff5e0100
	stda	%f2 ,[%i2+%o5]0x88	! Mem[0000000010081410] = 00000121 00000000

p0_label_218:
!	Starting 10 instruction Load Burst
!	%l5 = 0000000000000000, %l5 = 0000000000000000, %l3 = 00000000000000c4
	add	%l5,%l5,%l3		! %l3 = 0000000000000000
!	Mem[0000000010181410] = 00000000, %l4 = 0000000000000000
	ldsba	[%i6+%o5]0x88,%l4	! %l4 = 0000000000000000
!	Mem[000000001010142c] = 000000ff, %f3  = 00000000
	lda	[%i4+0x02c]%asi,%f3 	! %f3 = 000000ff
!	Mem[0000000030181408] = 000000ff, %l3 = 0000000000000000
	ldsha	[%i6+%o4]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010181400] = ffff8c00 000000ff, %l4 = 00000000, %l5 = 00000000
	ldda	[%i6+%g0]0x88,%l4	! %l4 = 00000000000000ff 00000000ffff8c00
!	Mem[0000000010001410] = 39000000 ff000000, %l6 = ffffffa5, %l7 = 00000000
	ldda	[%i0+%o5]0x80,%l6	! %l6 = 0000000039000000 00000000ff000000
!	Mem[0000000030181400] = 000000ff, %l4 = 00000000000000ff
	ldsha	[%i6+%g0]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010141400] = 6968571c, %l4 = 00000000000000ff, %asi = 80
	ldswa	[%i5+0x000]%asi,%l4	! %l4 = 000000006968571c
!	Mem[000000001008142c] = 7569f2af, %f9  = ffc3fcff
	ld	[%i2+0x02c],%f9 	! %f9 = 7569f2af
!	Mem[0000000010001410] = 39000000, %l7 = 00000000ff000000
	lduw	[%i0+%o5],%l7		! %l7 = 0000000039000000

p0_label_219:
!	Starting 10 instruction Store Burst
!	%l0 = 000000ff, %l1 = 00000039, Mem[0000000030041400] = ff890000 0000790b
	stda	%l0,[%i1+%g0]0x81	! Mem[0000000030041400] = 000000ff 00000039
!	%l4 = 000000006968571c, Mem[0000000010001410] = 00000039
	stwa	%l4,[%i0+%o5]0x88	! Mem[0000000010001410] = 6968571c
!	%f23 = 465c9153, Mem[0000000010041438] = 39000000
	st	%f23,[%i1+0x038]	! Mem[0000000010041438] = 465c9153
!	Mem[00000000218000c1] = 00ff5e00, %l0 = 00000000000000ff
	ldstuba	[%o3+0x0c1]%asi,%l0	! %l0 = 00000000000000ff
!	Mem[00000000211c0001] = ff004d40, %l6 = 0000000039000000
	ldstuba	[%o2+0x001]%asi,%l6	! %l6 = 0000000000000000
!	Mem[0000000010141408] = 000000ff, %l6 = 0000000000000000
	swapa	[%i5+%o4]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010141400] = 6968571c 2a030000 00000000 00000000
!	%f16 = ffff8c00 00000000 005c0000 38ffffff
!	%f20 = 00000000 00000039 0d783e6f 465c9153
!	%f24 = c4030000 00000039 00d90039 465c9153
!	%f28 = 00000000 c4576869 00000000 63e462cb
	stda	%f16,[%i5+%g0]ASI_BLK_AIUPL	! Block Store to 0000000010141400
!	%l0 = 000000ff, %l1 = 00000039, Mem[0000000010041410] = aff26975 2600ffff
	stda	%l0,[%i1+%o5]0x88	! Mem[0000000010041410] = 000000ff 00000039
!	%l6 = 00000000000000ff, Mem[0000000030001408] = c9db38ff
	stha	%l6,[%i0+%o4]0x89	! Mem[0000000030001408] = c9db00ff
!	Mem[0000000030081400] = 00000000, %l0 = 00000000000000ff
	swapa	[%i2+%g0]0x81,%l0	! %l0 = 0000000000000000

p0_label_220:
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = 000000ff, %f6  = d7500000
	lda	[%i1+%o5]0x89,%f6 	! %f6 = 000000ff
!	%l4 = 000000006968571c, Mem[0000000010081410] = 0000000021010000
	stxa	%l4,[%i2+%o5]0x80	! Mem[0000000010081410] = 000000006968571c
!	Mem[0000000030101410] = a5010000, %l2 = 0000000000000000
	ldsba	[%i4+%o5]0x81,%l2	! %l2 = ffffffffffffffa5
!	%l1 = 0000000000000039, %l5 = 00000000ffff8c00, %y  = 00000039
	umul	%l1,%l5,%l7		! %l7 = 00000038ffe62c00, %y = 00000038
!	Mem[0000000030001408] = ff00dbc9, %l7 = 00000038ffe62c00
	ldsha	[%i0+%o4]0x81,%l7	! %l7 = ffffffffffffff00
!	Code Fragment 3, seed = 721922
p0_fragment_31:
!	%l0 = 0000000000000000
	setx	0xaf8251c0a5acfa16,%g7,%l0 ! %l0 = af8251c0a5acfa16
!	%l1 = 0000000000000039
	setx	0x83a52f12f5364b41,%g7,%l1 ! %l1 = 83a52f12f5364b41
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = af8251c0a5acfa16
	setx	0xfd99b5b1e5b6707c,%g7,%l0 ! %l0 = fd99b5b1e5b6707c
!	%l1 = 83a52f12f5364b41
	setx	0xd4e319480d126cc7,%g7,%l1 ! %l1 = d4e319480d126cc7
p0_fragment_31_end:
!	Mem[0000000030141410] = 38ffffffffffffff, %f2  = 00000121 000000ff
	ldda	[%i5+%o5]0x89,%f2 	! %f2  = 38ffffff ffffffff
!	Mem[000000001004142a] = 7dd9eff6, %l6 = 00000000000000ff
	ldsb	[%i1+0x02a],%l6		! %l6 = ffffffffffffffef
!	Mem[0000000010081408] = 69680000, %l0 = fd99b5b1e5b6707c
	lduha	[%i2+%o4]0x88,%l0	! %l0 = 0000000000000000
!	Mem[00000000201c0001] = 00ff56b0, %l3 = 00000000000000ff, %asi = 80
	lduba	[%o0+0x001]%asi,%l3	! %l3 = 00000000000000ff

p0_label_221:
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (45)
!	Mem[0000000010141410] = 00000039, %l4 = 000000006968571c
	swapa	[%i5+%o5]0x88,%l4	! %l4 = 0000000000000039
!	%l3 = 00000000000000ff, Mem[0000000030001408] = c9db00ff
	stwa	%l3,[%i0+%o4]0x89	! Mem[0000000030001408] = 000000ff
!	Mem[0000000030081410] = 00000000, %l0 = 0000000000000000
	ldstuba	[%i2+%o5]0x89,%l0	! %l0 = 0000000000000000
!	%f29 = c4576869, Mem[0000000030101400] = ff62e463
	sta	%f29,[%i4+%g0]0x81	! Mem[0000000030101400] = c4576869
!	%f5  = c4ffa89d, Mem[00000000300c1410] = 89b83900
	sta	%f5 ,[%i3+%o5]0x89	! Mem[00000000300c1410] = c4ffa89d
!	%l1 = d4e319480d126cc7, Mem[00000000100c1410] = 000000ff
	stwa	%l1,[%i3+%o5]0x88	! Mem[00000000100c1410] = 0d126cc7
!	Mem[0000000010101424] = 1c576869, %l1 = 0d126cc7, %l4 = 00000039
	add	%i4,0x24,%g1
	casa	[%g1]0x80,%l1,%l4	! %l4 = 000000001c576869
!	Mem[0000000010181435] = 00000000, %l7 = ffffffffffffff00
	ldstub	[%i6+0x035],%l7		! %l7 = 0000000000000000
!	Mem[0000000010141408] = 38ffffff, %l1 = 000000000d126cc7
	swapa	[%i5+%o4]0x88,%l1	! %l1 = 0000000038ffffff
!	Mem[0000000021800100] = ff399830, %l7 = 0000000000000000
	ldstub	[%o3+0x100],%l7		! %l7 = 00000000000000ff

p0_label_222:
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = 00000000000000ff, %f26 = 00d90039 465c9153
	ldda	[%i3+%g0]0x89,%f26	! %f26 = 00000000 000000ff
!	Mem[0000000030001410] = 00000000 00005c00, %l6 = ffffffef, %l7 = 000000ff
	ldda	[%i0+%o5]0x81,%l6	! %l6 = 0000000000000000 0000000000005c00
!	Mem[00000000211c0000] = ffff4d40, %l5 = 00000000ffff8c00, %asi = 80
	ldsha	[%o2+0x000]%asi,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000010081416] = 6968571c, %l1 = 0000000038ffffff
	ldsh	[%i2+0x016],%l1		! %l1 = 000000000000571c
!	%l1 = 000000000000571c, %l5 = ffffffffffffffff, %y  = 00000038
	umul	%l1,%l5,%l6		! %l6 = 0000571bffffa8e4, %y = 0000571b
!	Mem[0000000010001428] = 000000f6, %l6 = 0000571bffffa8e4
	ldsw	[%i0+0x028],%l6		! %l6 = 00000000000000f6
!	Mem[00000000211c0000] = ffff4d40, %l5 = ffffffffffffffff
	ldsb	[%o2+%g0],%l5		! %l5 = ffffffffffffffff
!	Mem[0000000030081400] = 000000ff, %l0 = 0000000000000000
	lduha	[%i2+%g0]0x81,%l0	! %l0 = 0000000000000000
!	%l3 = 00000000000000ff, %l3 = 00000000000000ff, %y  = 0000571b
	sdiv	%l3,%l3,%l1		! %l1 = 000000007fffffff
	mov	%l0,%y			! %y = 00000000
!	Mem[0000000030181410] = f6000000 c40000ff, %l2 = ffffffa5, %l3 = 000000ff
	ldda	[%i6+%o5]0x89,%l2	! %l2 = 00000000c40000ff 00000000f6000000

p0_label_223:
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1400] = 005cff89, %l6 = 00000000000000f6
	ldstuba	[%i3+%g0]0x80,%l6	! %l6 = 0000000000000000
!	%l6 = 0000000000000000, Mem[00000000300c1410] = 9da8ffc400000000
	stxa	%l6,[%i3+%o5]0x81	! Mem[00000000300c1410] = 0000000000000000
!	%f6  = 000000ff, %f21 = 00000039, %f12 = 00000000
	fsubs	%f6 ,%f21,%f12		! tt=0x22, %l0 = 0000000000000022
!	Mem[0000000030141410] = ffffffff, %l0 = 0000000000000022
	ldstuba	[%i5+%o5]0x81,%l0	! %l0 = 00000000000000ff
!	%l0 = 000000ff, %l1 = 7fffffff, Mem[0000000010041410] = 000000ff 00000039
	stda	%l0,[%i1+%o5]0x88	! Mem[0000000010041410] = 000000ff 7fffffff
!	Mem[00000000100c1436] = 000000c1, %l1 = 000000007fffffff
	ldstuba	[%i3+0x036]%asi,%l1	! %l1 = 0000000000000000
!	%l1 = 0000000000000000, Mem[0000000010001400] = ff000000
	stwa	%l1,[%i0+%g0]0x88	! Mem[0000000010001400] = 00000000
!	%f16 = ffff8c00, Mem[0000000030001400] = ff000000
	sta	%f16,[%i0+%g0]0x81	! Mem[0000000030001400] = ffff8c00
!	%l0 = 00000000000000ff, Mem[0000000030081408] = acf1453f
	stha	%l0,[%i2+%o4]0x81	! Mem[0000000030081408] = 00ff453f
!	Mem[0000000030101400] = 696857c4, %l0 = 00000000000000ff
	swapa	[%i4+%g0]0x89,%l0	! %l0 = 00000000696857c4

p0_label_224:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c140c] = 53915c00, %l3 = 00000000f6000000
	lduw	[%i3+0x00c],%l3		! %l3 = 0000000053915c00
!	Mem[0000000010181420] = 89ffffff 00000000, %l2 = c40000ff, %l3 = 53915c00, %asi = 80
	ldda	[%i6+0x020]%asi,%l2	! %l2 = 0000000089ffffff 0000000000000000
!	Mem[0000000030041408] = ffffffff, %f6  = 000000ff
	lda	[%i1+%o4]0x89,%f6 	! %f6 = ffffffff
!	Mem[00000000100c1408] = ffc3b889, %l3 = 0000000000000000
	ldswa	[%i3+%o4]0x80,%l3	! %l3 = ffffffffffc3b889
!	Mem[00000000300c1400] = 00000000000000ff, %f4  = ff5e0100 c4ffa89d
	ldda	[%i3+%g0]0x89,%f4 	! %f4  = 00000000 000000ff
!	Mem[0000000010081400] = 39000000000003ff, %f14 = 00000000 63e462cb
	ldda	[%i2+%g0]0x88,%f14	! %f14 = 39000000 000003ff
!	%l5 = ffffffffffffffff, %l5 = ffffffffffffffff, %l1 = 0000000000000000
	add	%l5,%l5,%l1		! %l1 = fffffffffffffffe
!	Mem[0000000010101410] = ff000000 00000000, %l0 = 696857c4, %l1 = fffffffe
	ldda	[%i4+%o5]0x80,%l0	! %l0 = 00000000ff000000 0000000000000000
!	Mem[0000000010181408] = 0000000000000000, %l4 = 000000001c576869, %asi = 80
	ldxa	[%i6+0x008]%asi,%l4	! %l4 = 0000000000000000
!	Mem[0000000030041400] = ff000000, %l6 = 0000000000000000
	ldswa	[%i1+%g0]0x89,%l6	! %l6 = ffffffffff000000

p0_label_225:
!	Starting 10 instruction Store Burst
!	%f10 = aff26975 e7ecbcc1, %l2 = 0000000089ffffff
!	Mem[0000000030001428] = c457686900000039
	add	%i0,0x028,%g1
	stda	%f10,[%g1+%l2]ASI_PST8_SL ! Mem[0000000030001428] = c1bcece77569f2af
!	Mem[00000000100c1400] = 89ff5cff, %l2 = 0000000089ffffff
	ldstuba	[%i3+%g0]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010181420] = 89ffffff00000000, %l2 = 00000000000000ff, %l7 = 0000000000005c00
	add	%i6,0x20,%g1
	casxa	[%g1]0x80,%l2,%l7	! %l7 = 89ffffff00000000
!	%f25 = 00000039, Mem[0000000030141400] = 0e6afda5
	sta	%f25,[%i5+%g0]0x89	! Mem[0000000030141400] = 00000039
!	%l0 = 00000000ff000000, Mem[0000000030141410] = ffffffff
	stwa	%l0,[%i5+%o5]0x89	! Mem[0000000030141410] = ff000000
!	%f26 = 00000000 000000ff, Mem[0000000010041438] = 465c9153 3c2f7a8b
	std	%f26,[%i1+0x038]	! Mem[0000000010041438] = 00000000 000000ff
!	%f8  = 6968571c 7569f2af, Mem[0000000010141400] = 00000000 ffff8c00
	stda	%f8 ,[%i5+%g0]0x88	! Mem[0000000010141400] = 6968571c 7569f2af
!	%l2 = 00000000000000ff, imm = fffffffffffff8fb, %l6 = ffffffffff000000
	andn	%l2,-0x705,%l6		! %l6 = 0000000000000004
!	Mem[0000000010081408] = 00006869, %l6 = 0000000000000004
	ldstuba	[%i2+%o4]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000010141424] = 000003c4, %l1 = 00000000, %l3 = ffc3b889
	add	%i5,0x24,%g1
	casa	[%g1]0x80,%l1,%l3	! %l3 = 00000000000003c4

p0_label_226:
!	Starting 10 instruction Load Burst
!	Mem[0000000030001400] = ffff8c00, %l4 = 0000000000000000
	lduwa	[%i0+%g0]0x81,%l4	! %l4 = 00000000ffff8c00
!	Mem[0000000030141408] = 0000000000000000, %l3 = 00000000000003c4
	ldxa	[%i5+%o4]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000010141410] = 1c57686900000000, %l4 = 00000000ffff8c00
	ldxa	[%i5+%o5]0x80,%l4	! %l4 = 1c57686900000000
!	Mem[0000000010181408] = 00000000, %l7 = 89ffffff00000000
	ldsba	[%i6+%o4]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000030081408] = 3f45ff00, %l1 = 0000000000000000
	lduwa	[%i2+%o4]0x89,%l1	! %l1 = 000000003f45ff00
!	Mem[00000000100c1408] = ffc3b88953915c00, %f4  = 00000000 000000ff
	ldda	[%i3+%o4]0x80,%f4 	! %f4  = ffc3b889 53915c00
!	Mem[0000000010041400] = 6f3e780d, %l5 = ffffffffffffffff
	lduba	[%i1+%g0]0x80,%l5	! %l5 = 000000000000006f
!	Mem[0000000010081408] = 696800ff, %f27 = 000000ff
	lda	[%i2+%o4]0x88,%f27	! %f27 = 696800ff
!	Mem[0000000030041408] = ffffffff, %f29 = c4576869
	lda	[%i1+%o4]0x81,%f29	! %f29 = ffffffff
!	Mem[0000000010181400] = ffff8c00 000000ff, %l4 = 00000000, %l5 = 0000006f
	ldda	[%i6+%g0]0x88,%l4	! %l4 = 00000000000000ff 00000000ffff8c00

p0_label_227:
!	Starting 10 instruction Store Burst
!	Mem[0000000030081400] = 000000ff 0e6afda5 00ff453f 10b52fe8
!	%f0  = 39000000 000003c4 38ffffff ffffffff
!	%f4  = ffc3b889 53915c00 ffffffff 2691032a
!	%f8  = 6968571c 7569f2af aff26975 e7ecbcc1
!	%f12 = 00000000 a4ae432e 39000000 000003ff
	stda	%f0 ,[%i2+%g0]ASI_BLK_S	! Block Store to 0000000030081400
!	%f22 = 0d783e6f 465c9153, Mem[0000000030101400] = 000000ff 00000000
	stda	%f22,[%i4+%g0]0x89	! Mem[0000000030101400] = 0d783e6f 465c9153
!	%f2  = 38ffffff ffffffff, %l6 = 0000000000000000
!	Mem[00000000100c1420] = 000000000000ff62
	add	%i3,0x020,%g1
	stda	%f2,[%g1+%l6]ASI_PST8_PL ! Mem[00000000100c1420] = 000000000000ff62
!	%l2 = 000000ff, %l3 = 00000000, Mem[0000000010181410] = 00000000 00000000
	stda	%l2,[%i6+%o5]0x80	! Mem[0000000010181410] = 000000ff 00000000
!	Mem[00000000100c1400] = 89ff5cff, %l1 = 000000003f45ff00
	ldstuba	[%i3+%g0]0x88,%l1	! %l1 = 00000000000000ff
!	%f28 = 00000000 ffffffff, Mem[0000000030101400] = 465c9153 0d783e6f
	stda	%f28,[%i4+%g0]0x89	! Mem[0000000030101400] = 00000000 ffffffff
!	%l3 = 0000000000000000, Mem[0000000010141400] = aff26975
	stwa	%l3,[%i5+%g0]0x80	! Mem[0000000010141400] = 00000000
!	%l6 = 0000000000000000, Mem[0000000010141400] = 00000000
	stwa	%l6,[%i5+%g0]0x88	! Mem[0000000010141400] = 00000000
!	%l1 = 00000000000000ff, imm = fffffffffffff9dd, %l5 = 00000000ffff8c00
	add	%l1,-0x623,%l5		! %l5 = fffffffffffffadc
!	Mem[0000000010001408] = 0000039d, %l5 = fffffffffffffadc
	ldstuba	[%i0+%o4]0x88,%l5	! %l5 = 000000000000009d

p0_label_228:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = 0000000000000000, %l3 = 0000000000000000
	ldxa	[%i0+%g0]0x88,%l3	! %l3 = 0000000000000000
!	%l3 = 0000000000000000, %l2 = 00000000000000ff, %l5 = 000000000000009d
	orn	%l3,%l2,%l5		! %l5 = ffffffffffffff00
!	Mem[0000000030041400] = 000000ff 00000039, %l4 = 000000ff, %l5 = ffffff00
	ldda	[%i1+%g0]0x81,%l4	! %l4 = 00000000000000ff 0000000000000039
!	Mem[0000000010001410] = 1c576869, %l3 = 0000000000000000, %asi = 80
	ldswa	[%i0+0x010]%asi,%l3	! %l3 = 000000001c576869
	membar	#Sync			! Added by membar checker (46)
!	Mem[0000000010081410] = 000000006968571c, %l6 = 0000000000000000
	ldxa	[%i2+%o5]0x80,%l6	! %l6 = 000000006968571c
!	Mem[0000000010041400] = 6f3e780d, %l0 = 00000000ff000000
	lduba	[%i1+%g0]0x80,%l0	! %l0 = 000000000000006f
!	Mem[0000000021800000] = 00ff9770, %l1 = 00000000000000ff
	lduh	[%o3+%g0],%l1		! %l1 = 00000000000000ff
!	Mem[0000000010181408] = 00000000, %l6 = 000000006968571c
	ldsb	[%i6+%o4],%l6		! %l6 = 0000000000000000
!	Mem[0000000030001410] = 00000000, %l0 = 000000000000006f
	ldswa	[%i0+%o5]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000010081410] = 1c576869 00000000, %l0 = 00000000, %l1 = 000000ff
	ldda	[%i2+%o5]0x88,%l0	! %l0 = 0000000000000000 000000001c576869

p0_label_229:
!	Starting 10 instruction Store Burst
!	%f2  = 38ffffff ffffffff, %l4 = 00000000000000ff
!	Mem[0000000030181408] = ff00000000000000
	add	%i6,0x008,%g1
	stda	%f2,[%g1+%l4]ASI_PST32_SL ! Mem[0000000030181408] = ffffffffffffff38
!	Mem[00000000100c1410] = c76c120d, %l5 = 0000000000000039
	swapa	[%i3+%o5]0x80,%l5	! %l5 = 00000000c76c120d
!	Mem[0000000020800041] = ff007f10, %l1 = 000000001c576869
	ldstub	[%o1+0x041],%l1		! %l1 = 0000000000000000
!	%l7 = 0000000000000000, Mem[0000000020800000] = ffff2ce0, %asi = 80
	stha	%l7,[%o1+0x000]%asi	! Mem[0000000020800000] = 00002ce0
!	Mem[00000000300c1410] = 00000000, %l1 = 0000000000000000
	ldstuba	[%i3+%o5]0x81,%l1	! %l1 = 0000000000000000
!	%l4 = 000000ff, %l5 = c76c120d, Mem[0000000010141438] = cb62e463 00000000, %asi = 80
	stda	%l4,[%i5+0x038]%asi	! Mem[0000000010141438] = 000000ff c76c120d
!	%l4 = 00000000000000ff, Mem[0000000010081400] = ff030000
	stwa	%l4,[%i2+%g0]0x80	! Mem[0000000010081400] = 000000ff
!	Mem[0000000030141400] = 39000000, %l1 = 0000000000000000
	swapa	[%i5+%g0]0x81,%l1	! %l1 = 0000000039000000
!	%f16 = ffff8c00 00000000, Mem[0000000030141408] = 00000000 00000000
	stda	%f16,[%i5+%o4]0x81	! Mem[0000000030141408] = ffff8c00 00000000
!	Mem[000000001000140c] = 00000000, %l1 = 0000000039000000
	swap	[%i0+0x00c],%l1		! %l1 = 0000000000000000

p0_label_230:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = 89ff5cff, %l7 = 0000000000000000
	ldsba	[%i3+%g0]0x88,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000030101408] = ff000000000000ff, %f2  = 38ffffff ffffffff
	ldda	[%i4+%o4]0x81,%f2 	! %f2  = ff000000 000000ff
!	Mem[0000000030081410] = 89b8c3ff, %l5 = 00000000c76c120d
	lduha	[%i2+%o5]0x89,%l5	! %l5 = 000000000000c3ff
!	Mem[0000000010141408] = c76c120d, %l6 = 0000000000000000, %asi = 80
	lduwa	[%i5+0x008]%asi,%l6	! %l6 = 00000000c76c120d
!	Mem[0000000021800040] = 00ff5da0, %l3 = 000000001c576869
	ldsh	[%o3+0x040],%l3		! %l3 = 00000000000000ff
!	Mem[00000000100c1438] = 5d45aa64, %f2  = ff000000
	ld	[%i3+0x038],%f2 	! %f2 = 5d45aa64
!	Mem[0000000010001410] = 000000ff 6968571c, %l0 = 00000000, %l1 = 00000000
	ldda	[%i0+%o5]0x88,%l0	! %l0 = 000000006968571c 00000000000000ff
!	Mem[00000000300c1410] = ff000000, %l4 = 00000000000000ff
	ldsha	[%i3+%o5]0x81,%l4	! %l4 = ffffffffffffff00
!	Mem[0000000010001410] = 1c576869, %l2 = 00000000000000ff, %asi = 80
	ldswa	[%i0+0x010]%asi,%l2	! %l2 = 000000001c576869
!	Mem[0000000030081408] = 38ffffffffffffff, %f22 = 0d783e6f 465c9153
	ldda	[%i2+%o4]0x81,%f22	! %f22 = 38ffffff ffffffff

p0_label_231:
!	Starting 10 instruction Store Burst
!	%l6 = 00000000c76c120d, Mem[0000000010181400] = ff000000008cffff
	stxa	%l6,[%i6+%g0]0x80	! Mem[0000000010181400] = 00000000c76c120d
!	Mem[0000000020800040] = ffff7f10, %l2 = 000000001c576869
	ldstuba	[%o1+0x040]%asi,%l2	! %l2 = 00000000000000ff
!	%f14 = 39000000, Mem[0000000030181400] = 000000ff
	sta	%f14,[%i6+%g0]0x89	! Mem[0000000030181400] = 39000000
!	%l6 = c76c120d, %l7 = ffffffff, Mem[0000000010101408] = 00000000 ffffffc5
	stda	%l6,[%i4+%o4]0x80	! Mem[0000000010101408] = c76c120d ffffffff
!	Mem[0000000010001400] = 00000000, %l1 = 00000000000000ff
	swapa	[%i0+%g0]0x88,%l1	! %l1 = 0000000000000000
!	%l7 = ffffffffffffffff, Mem[0000000030141408] = 00000000008cffff
	stxa	%l7,[%i5+%o4]0x89	! Mem[0000000030141408] = ffffffffffffffff
!	%l5 = 000000000000c3ff, Mem[0000000030001400] = ffff8c0000000013
	stxa	%l5,[%i0+%g0]0x81	! Mem[0000000030001400] = 000000000000c3ff
!	%f2  = 5d45aa64, %f25 = 00000039, %f13 = a4ae432e
	fmuls	%f2 ,%f25,%f13		! tt=0x22, %l0 = 000000006968573e
!	%l6 = c76c120d, %l7 = ffffffff, Mem[0000000010141410] = 1c576869 00000000
	stda	%l6,[%i5+%o5]0x80	! Mem[0000000010141410] = c76c120d ffffffff
!	%l5 = 000000000000c3ff, Mem[0000000010081410] = 00000000
	stha	%l5,[%i2+%o5]0x80	! Mem[0000000010081410] = c3ff0000

p0_label_232:
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = 000000ff, %f9  = 7569f2af
	lda	[%i4+%o4]0x89,%f9 	! %f9 = 000000ff
!	Mem[0000000010041408] = 53009153, %l3 = 00000000000000ff
	ldsba	[%i1+%o4]0x80,%l3	! %l3 = 0000000000000053
!	Mem[0000000030001408] = 000000ff, %l6 = 00000000c76c120d
	lduwa	[%i0+%o4]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030041410] = ff000000 000000ff, %l6 = 000000ff, %l7 = ffffffff
	ldda	[%i1+%o5]0x81,%l6	! %l6 = 00000000ff000000 00000000000000ff
!	Mem[0000000030001408] = ff000000, %l0 = 000000006968573e
	ldswa	[%i0+%o4]0x81,%l0	! %l0 = ffffffffff000000
!	Mem[0000000010101408] = c76c120d, %l2 = 00000000000000ff
	ldsba	[%i4+%o4]0x80,%l2	! %l2 = ffffffffffffffc7
!	%l1 = 0000000000000000, %l6 = 00000000ff000000, %l0 = ffffffffff000000
	sub	%l1,%l6,%l0		! %l0 = ffffffff01000000
!	Mem[0000000010081408] = ff006869, %l2 = ffffffffffffffc7
	lduba	[%i2+%o4]0x80,%l2	! %l2 = 00000000000000ff
!	%l7 = 00000000000000ff, %l7 = 00000000000000ff, %y  = 00000000
	smul	%l7,%l7,%l3		! %l3 = 000000000000fe01, %y = 00000000
	membar	#Sync			! Added by membar checker (47)
!	Mem[0000000010101400] = 53915cff 00000000 c76c120d ffffffff
!	Mem[0000000010101410] = ff000000 00000000 41c58c2a 465c0000
!	Mem[0000000010101420] = 0000032a 1c576869 00000000 000000ff
!	Mem[0000000010101430] = 00000000 0e6afda5 54983c02 63e462cb
	ldda	[%i4+%g0]ASI_BLK_P,%f16	! Block Load from 0000000010101400

p0_label_233:
!	Starting 10 instruction Store Burst
!	%l2 = 00000000000000ff, Mem[00000000100c1400] = ff5cff89
	stba	%l2,[%i3+%g0]0x80	! Mem[00000000100c1400] = ff5cff89
	membar	#Sync			! Added by membar checker (48)
!	%f16 = 53915cff, Mem[0000000010101408] = c76c120d
	sta	%f16,[%i4+%o4]0x80	! Mem[0000000010101408] = 53915cff
!	%l4 = ffffffffffffff00, Mem[00000000100c1408] = ffc3b889
	stha	%l4,[%i3+%o4]0x80	! Mem[00000000100c1408] = ff00b889
!	%l3 = 000000000000fe01, Mem[0000000010141408] = 005c00000d126cc7
	stxa	%l3,[%i5+%o4]0x88	! Mem[0000000010141408] = 000000000000fe01
!	%l4 = ffffffffffffff00, Mem[0000000010041400] = 0d783e6f
	stba	%l4,[%i1+%g0]0x88	! Mem[0000000010041400] = 0d783e00
!	%l1 = 0000000000000000, Mem[0000000010001421] = 00000000
	stb	%l1,[%i0+0x021]		! Mem[0000000010001420] = 00000000
!	%f15 = 000003ff, %f28 = 00000000
	fstoi	%f15,%f28		! tt=0x22, %l0 = ffffffff01000022
!	%f15 = 000003ff, Mem[0000000010141400] = 00000000
	sta	%f15,[%i5+%g0]0x88	! Mem[0000000010141400] = 000003ff
!	%l4 = ffffffffffffff00, Mem[00000000100c1410] = 0000003900000000
	stx	%l4,[%i3+%o5]		! Mem[00000000100c1410] = ffffffffffffff00
!	Mem[0000000030101410] = a5010000, %l3 = 000000000000fe01
	ldstuba	[%i4+%o5]0x81,%l3	! %l3 = 00000000000000a5

p0_label_234:
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = ffffffff, %l5 = 000000000000c3ff
	ldswa	[%i4+%g0]0x81,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000010101410] = 000000ff, %l5 = ffffffffffffffff
	lduwa	[%i4+%o5]0x88,%l5	! %l5 = 00000000000000ff
	membar	#Sync			! Added by membar checker (49)
!	Mem[00000000100c1400] = ff5cff89 00000121 ff00b889 53915c00
!	Mem[00000000100c1410] = ffffffff ffffff00 000000ff ff000000
!	Mem[00000000100c1420] = 00000000 0000ff62 00000000 00000000
!	Mem[00000000100c1430] = 00000000 0000ffc1 5d45aa64 000000ff
	ldda	[%i3+%g0]ASI_BLK_PL,%f0 	! Block Load from 00000000100c1400
!	Mem[0000000030041410] = ff000000, %l6 = 00000000ff000000
	ldsha	[%i1+%o5]0x81,%l6	! %l6 = ffffffffffffff00
!	Mem[0000000010001408] = ff030000, %l1 = 0000000000000000
	ldsba	[%i0+%o4]0x80,%l1	! %l1 = ffffffffffffffff
!	Mem[00000000300c1400] = ff00000000000000, %f28 = 00000000 0e6afda5
	ldda	[%i3+%g0]0x81,%f28	! %f28 = ff000000 00000000
!	Mem[0000000010001410] = 1c576869, %l7 = 00000000000000ff
	ldsw	[%i0+%o5],%l7		! %l7 = 000000001c576869
!	%l2 = 00000000000000ff, %l0 = ffffffff01000022, %l7 = 000000001c576869
	or	%l2,%l0,%l7		! %l7 = ffffffff010000ff
!	Mem[0000000010181400] = 0d126cc700000000, %f20 = ff000000 00000000
	ldda	[%i6+%g0]0x88,%f20	! %f20 = 0d126cc7 00000000
!	Mem[0000000010181400] = 00000000, %l1 = ffffffffffffffff
	ldswa	[%i6+%g0]0x80,%l1	! %l1 = 0000000000000000

p0_label_235:
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1408] = 26000000, %l1 = 0000000000000000
	swapa	[%i3+%o4]0x81,%l1	! %l1 = 0000000026000000
!	%f26 = 00000000 000000ff, Mem[0000000030001400] = 00000000 0000c3ff
	stda	%f26,[%i0+%g0]0x81	! Mem[0000000030001400] = 00000000 000000ff
!	Mem[000000001004142b] = 7dd9eff6, %l4 = ffffffffffffff00
	ldstub	[%i1+0x02b],%l4		! %l4 = 00000000000000f6
!	%l5 = 00000000000000ff, Mem[0000000010001400] = ff000000
	stba	%l5,[%i0+%g0]0x80	! Mem[0000000010001400] = ff000000
!	Mem[0000000030181400] = 00000039, %l0 = 0000000001000022
	swapa	[%i6+%g0]0x81,%l0	! %l0 = 0000000000000039
!	%l4 = 00000000000000f6, Mem[0000000021800000] = 00ff9770, %asi = 80
	stba	%l4,[%o3+0x000]%asi	! Mem[0000000021800000] = f6ff9770
!	Mem[0000000030101408] = 000000ff, %l2 = 00000000000000ff
	swapa	[%i4+%o4]0x89,%l2	! %l2 = 00000000000000ff
	membar	#Sync			! Added by membar checker (50)
!	%f28 = ff000000 00000000, Mem[00000000100c1400] = ff5cff89 00000121
	stda	%f28,[%i3+%g0]0x80	! Mem[00000000100c1400] = ff000000 00000000
!	Mem[0000000010101400] = 53915cff, %l3 = 00000000000000a5
	ldstuba	[%i4+%g0]0x80,%l3	! %l3 = 0000000000000053
!	%l2 = 00000000000000ff, Mem[0000000010141408] = 0000fe01
	stba	%l2,[%i5+%o4]0x88	! Mem[0000000010141408] = 0000feff

p0_label_236:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = 1c576869 0000ffc3, %l6 = ffffff00, %l7 = 010000ff
	ldda	[%i2+%o5]0x88,%l6	! %l6 = 000000000000ffc3 000000001c576869
!	Mem[0000000030041400] = 000000ff, %f4  = 00ffffff
	lda	[%i1+%g0]0x81,%f4 	! %f4 = 000000ff
!	%l0 = 0000000000000039, imm = fffffffffffff006, %l7 = 000000001c576869
	add	%l0,-0xffa,%l7		! %l7 = fffffffffffff03f
!	Mem[00000000100c1438] = 5d45aa64, %f3  = 89b800ff
	lda	[%i3+0x038]%asi,%f3 	! %f3 = 5d45aa64
!	Mem[0000000030041410] = 000000ff, %l2 = 00000000000000ff
	lduwa	[%i1+%o5]0x89,%l2	! %l2 = 00000000000000ff
!	%f21 = 00000000, %f10 = 00000000, %f21 = 00000000
	fdivs	%f21,%f10,%f21		! %f21 = 7fffffff
!	Mem[0000000020800040] = ffff7f10, %l2 = 00000000000000ff, %asi = 80
	ldsba	[%o1+0x040]%asi,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000030101408] = ff000000, %f13 = 00000000
	lda	[%i4+%o4]0x81,%f13	! %f13 = ff000000
!	Mem[00000000218001c0] = 48ff2ec0, %l4 = 00000000000000f6
	ldsb	[%o3+0x1c0],%l4		! %l4 = 0000000000000048
!	Mem[00000000201c0001] = 00ff56b0, %l2 = ffffffffffffffff
	ldub	[%o0+0x001],%l2		! %l2 = 00000000000000ff

p0_label_237:
!	Starting 10 instruction Store Burst
!	%l2 = 00000000000000ff, Mem[0000000010141400] = ff0300001c576869, %asi = 80
	stxa	%l2,[%i5+0x000]%asi	! Mem[0000000010141400] = 00000000000000ff
!	Mem[00000000300c1408] = 00000000, %l2 = 00000000000000ff
	ldstuba	[%i3+%o4]0x89,%l2	! %l2 = 0000000000000000
!	Code Fragment 3, seed = 601532
p0_fragment_32:
!	%l0 = 0000000000000039
	setx	0xdd7fa28a51748646,%g7,%l0 ! %l0 = dd7fa28a51748646
!	%l1 = 0000000026000000
	setx	0x1808a7ee167fe071,%g7,%l1 ! %l1 = 1808a7ee167fe071
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = dd7fa28a51748646
	setx	0xc4b94f343457beac,%g7,%l0 ! %l0 = c4b94f343457beac
!	%l1 = 1808a7ee167fe071
	setx	0x1d0f6456aeb223f7,%g7,%l1 ! %l1 = 1d0f6456aeb223f7
p0_fragment_32_end:
!	%f24 = 0000032a 1c576869, Mem[0000000010041410] = ff000000 ffffff7f
	stda	%f24,[%i1+%o5]0x80	! Mem[0000000010041410] = 0000032a 1c576869
!	%f26 = 00000000 000000ff, %l3 = 0000000000000053
!	Mem[00000000300c1428] = 6f3e780df6efd97d
	add	%i3,0x028,%g1
	stda	%f26,[%g1+%l3]ASI_PST8_SL ! Mem[00000000300c1428] = ff00780d00ef007d
!	Mem[00000000218000c0] = 00ff5e00, %l3 = 0000000000000053
	ldstuba	[%o3+0x0c0]%asi,%l3	! %l3 = 0000000000000000
!	%l6 = 000000000000ffc3, Mem[00000000100c140e] = 53915c00
	sth	%l6,[%i3+0x00e]		! Mem[00000000100c140c] = 5391ffc3
!	%f3  = 5d45aa64, Mem[00000000100c1410] = ffffffff
	sta	%f3 ,[%i3+%o5]0x88	! Mem[00000000100c1410] = 5d45aa64
!	%l4 = 0000000000000048, Mem[0000000030141400] = 00000000
	stha	%l4,[%i5+%g0]0x81	! Mem[0000000030141400] = 00480000
!	Mem[0000000010081408] = ff006869, %l7 = fffffffffffff03f
	ldstuba	[%i2+%o4]0x80,%l7	! %l7 = 00000000000000ff

p0_label_238:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = fffe0000, %l7 = 00000000000000ff, %asi = 80
	ldswa	[%i5+0x008]%asi,%l7	! %l7 = fffffffffffe0000
!	Mem[00000000300c1408] = 00000000000000ff, %l1 = 1d0f6456aeb223f7
	ldxa	[%i3+%o4]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[000000001000140c] = 39000000, %l3 = 0000000000000000, %asi = 80
	lduwa	[%i0+0x00c]%asi,%l3	! %l3 = 0000000039000000
!	Mem[0000000030101410] = ff010000, %l0 = c4b94f343457beac
	ldswa	[%i4+%o5]0x81,%l0	! %l0 = ffffffffff010000
!	Mem[0000000010041410] = 0000032a, %l6 = 000000000000ffc3
	ldsba	[%i1+%o5]0x80,%l6	! %l6 = 0000000000000000
!	Mem[00000000100c140b] = ff00b889, %l6 = 0000000000000000
	ldub	[%i3+0x00b],%l6		! %l6 = 0000000000000089
!	Mem[0000000010101408] = 53915cff, %f5  = ffffffff
	lda	[%i4+%o4]0x80,%f5 	! %f5 = 53915cff
!	Mem[00000000201c0001] = 00ff56b0, %l3 = 0000000039000000
	ldub	[%o0+0x001],%l3		! %l3 = 00000000000000ff
!	Mem[00000000100c1418] = 000000ff ff000000, %l4 = 00000048, %l5 = 000000ff
	ldd	[%i3+0x018],%l4		! %l4 = 00000000000000ff 00000000ff000000
!	Mem[0000000010101400] = ff5c91ff, %l4 = 00000000000000ff
	lduba	[%i4+%g0]0x88,%l4	! %l4 = 00000000000000ff

p0_label_239:
!	Starting 10 instruction Store Burst
!	Mem[00000000201c0001] = 00ff56b0, %l2 = 0000000000000000
	ldstub	[%o0+0x001],%l2		! %l2 = 00000000000000ff
!	%l7 = fffffffffffe0000, Mem[0000000010141400] = 00000000
	stba	%l7,[%i5+%g0]0x80	! Mem[0000000010141400] = 00000000
!	%f30 = 54983c02 63e462cb, %l7 = fffffffffffe0000
!	Mem[0000000030101428] = 417371367569f2af
	add	%i4,0x028,%g1
	stda	%f30,[%g1+%l7]ASI_PST8_SL ! Mem[0000000030101428] = 417371367569f2af
!	%l6 = 0000000000000089, imm = 0000000000000f90, %l5 = 00000000ff000000
	addc	%l6,0xf90,%l5		! %l5 = 0000000000001019
!	%l7 = fffffffffffe0000, Mem[0000000010101408] = 53915cff
	stwa	%l7,[%i4+%o4]0x80	! Mem[0000000010101408] = fffe0000
!	%l0 = ffffffffff010000, Mem[0000000010041410] = 6968571c2a030000
	stxa	%l0,[%i1+%o5]0x88	! Mem[0000000010041410] = ffffffffff010000
!	%f8  = 62ff0000, Mem[00000000300c1410] = 000000ff
	sta	%f8 ,[%i3+%o5]0x89	! Mem[00000000300c1410] = 62ff0000
!	%l2 = 00000000000000ff, Mem[0000000030181410] = ff0000c4
	stba	%l2,[%i6+%o5]0x81	! Mem[0000000030181410] = ff0000c4
!	%l7 = fffffffffffe0000, Mem[00000000300c1400] = 000000ff
	stba	%l7,[%i3+%g0]0x89	! Mem[00000000300c1400] = 00000000
!	%l1 = 00000000000000ff, imm = 0000000000000de3, %l4 = 00000000000000ff
	xnor	%l1,0xde3,%l4		! %l4 = fffffffffffff2e3

p0_label_240:
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = ff000000, %l7 = fffffffffffe0000
	ldswa	[%i1+%o5]0x81,%l7	! %l7 = ffffffffff000000
!	Mem[0000000030181410] = ff0000c4, %l7 = ffffffffff000000
	ldsba	[%i6+%o5]0x81,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000030081400] = 39000000, %l1 = 00000000000000ff
	ldsha	[%i2+%g0]0x81,%l1	! %l1 = 0000000000003900
!	Mem[00000000100c1404] = 00000000, %l3 = 00000000000000ff, %asi = 80
	ldsba	[%i3+0x004]%asi,%l3	! %l3 = 0000000000000000
!	Mem[0000000010141408] = 0000feff, %l2 = 00000000000000ff
	lduwa	[%i5+%o4]0x88,%l2	! %l2 = 000000000000feff
!	Mem[0000000030041408] = ffffffff, %l6 = 0000000000000089
	lduha	[%i1+%o4]0x89,%l6	! %l6 = 000000000000ffff
!	Mem[0000000030181400] = 22000001, %l2 = 000000000000feff
	lduba	[%i6+%g0]0x89,%l2	! %l2 = 0000000000000001
!	Mem[0000000010141400] = 00000000, %l2 = 0000000000000001
	lduba	[%i5+%g0]0x80,%l2	! %l2 = 0000000000000000
!	Mem[00000000100c1410] = 5d45aa64, %l2 = 0000000000000000
	lduba	[%i3+%o5]0x88,%l2	! %l2 = 0000000000000064
!	Mem[0000000010041404] = f6efd97d, %l6 = 000000000000ffff, %asi = 80
	ldsha	[%i1+0x004]%asi,%l6	! %l6 = fffffffffffff6ef

p0_label_241:
!	Starting 10 instruction Store Burst
!	%f7  = ff000000, Mem[0000000010001410] = 1c576869
	sta	%f7 ,[%i0+%o5]0x80	! Mem[0000000010001410] = ff000000
!	%l0 = ffffffffff010000, Mem[000000001014141d] = 6f3e780d, %asi = 80
	stba	%l0,[%i5+0x01d]%asi	! Mem[000000001014141c] = 6f00780d
!	%l2 = 0000000000000064, Mem[0000000010081436] = 00000000, %asi = 80
	stba	%l2,[%i2+0x036]%asi	! Mem[0000000010081434] = 00006400
!	%f10 = 00000000 00000000, Mem[0000000010041420] = 25a80000 ff895eff, %asi = 80
	stda	%f10,[%i1+0x020]%asi	! Mem[0000000010041420] = 00000000 00000000
!	Mem[00000000300c1400] = 00000000, %l4 = 00000000fffff2e3
	swapa	[%i3+%g0]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000030041408] = ffffffff, %l7 = ffffffffffffffff
	ldstuba	[%i1+%o4]0x81,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030081410] = 89b8c3ff, %l7 = 00000000000000ff
	ldstuba	[%i2+%o5]0x89,%l7	! %l7 = 00000000000000ff
!	%l0 = ffffffffff010000, Mem[0000000030101400] = ffffffff
	stwa	%l0,[%i4+%g0]0x89	! Mem[0000000030101400] = ff010000
!	%l4 = 00000000, %l5 = 00001019, Mem[00000000100c1418] = 000000ff ff000000
	std	%l4,[%i3+0x018]		! Mem[00000000100c1418] = 00000000 00001019
!	%l4 = 0000000000000000, Mem[00000000300c1408] = 000000ff
	stwa	%l4,[%i3+%o4]0x89	! Mem[00000000300c1408] = 00000000

p0_label_242:
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = 0000000000004800, %f26 = 00000000 000000ff
	ldda	[%i5+%g0]0x89,%f26	! %f26 = 00000000 00004800
!	Mem[0000000010041400] = 0d783e00, %l1 = 0000000000003900
	ldsha	[%i1+%g0]0x88,%l1	! %l1 = 0000000000003e00
!	Mem[0000000030001408] = ff000000, %l0 = ffffffffff010000
	ldswa	[%i0+%o4]0x81,%l0	! %l0 = ffffffffff000000
!	Mem[0000000010041408] = 0000000053910053, %f14 = ff000000 64aa455d
	ldda	[%i1+%o4]0x88,%f14	! %f14 = 00000000 53910053
!	Mem[0000000030081410] = ffc3b88953915c00, %l0 = ffffffffff000000
	ldxa	[%i2+%o5]0x81,%l0	! %l0 = ffc3b88953915c00
!	Mem[000000001014143c] = c76c120d, %l5 = 0000000000001019, %asi = 80
	lduwa	[%i5+0x03c]%asi,%l5	! %l5 = 00000000c76c120d
!	Mem[0000000030101400] = ff010000, %l7 = 00000000000000ff
	lduha	[%i4+%g0]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000030101410] = 00000000000001ff, %l4 = 0000000000000000
	ldxa	[%i4+%o5]0x89,%l4	! %l4 = 00000000000001ff
!	Mem[0000000010001408] = ff030000, %l6 = fffffffffffff6ef
	ldsha	[%i0+%o4]0x80,%l6	! %l6 = ffffffffffffff03
!	Mem[0000000010081410] = c3ff0000, %l5 = 00000000c76c120d
	ldswa	[%i2+%o5]0x80,%l5	! %l5 = ffffffffc3ff0000

p0_label_243:
!	Starting 10 instruction Store Burst
!	Mem[0000000030041408] = ffffffff, %l5 = ffffffffc3ff0000
	ldstuba	[%i1+%o4]0x81,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010041400] = 003e780d, %l3 = 0000000000000000
	swapa	[%i1+%g0]0x80,%l3	! %l3 = 00000000003e780d
!	%f21 = 7fffffff, Mem[0000000010141410] = 0d126cc7
	sta	%f21,[%i5+%o5]0x88	! Mem[0000000010141410] = 7fffffff
!	Mem[0000000030101400] = ff010000, %l0 = ffc3b88953915c00
	ldstuba	[%i4+%g0]0x89,%l0	! %l0 = 0000000000000000
!	%f8  = 62ff0000, Mem[0000000010041408] = 53910053
	sta	%f8 ,[%i1+%o4]0x88	! Mem[0000000010041408] = 62ff0000
!	Mem[0000000030041408] = ffffffff, %l1 = 0000000000003e00
	ldstuba	[%i1+%o4]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030141400] = 00004800, %l3 = 00000000003e780d
	swapa	[%i5+%g0]0x89,%l3	! %l3 = 0000000000004800
!	Mem[0000000010041410] = ff010000, %l7 = 0000000000000000
	swapa	[%i1+%o5]0x88,%l7	! %l7 = 00000000ff010000
!	%l6 = ffffff03, %l7 = ff010000, Mem[0000000030081410] = ffc3b889 53915c00
	stda	%l6,[%i2+%o5]0x81	! Mem[0000000030081410] = ffffff03 ff010000
!	%l5 = 00000000000000ff, Mem[0000000030041400] = 000000ff
	stba	%l5,[%i1+%g0]0x81	! Mem[0000000030041400] = ff0000ff

p0_label_244:
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = 000000ff, %l4 = 00000000000001ff
	lduha	[%i5+%o5]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000010181400] = 0d126cc700000000, %l7 = 00000000ff010000
	ldxa	[%i6+%g0]0x88,%l7	! %l7 = 0d126cc700000000
!	Mem[0000000010101408] = ffffffff0000feff, %f4  = 000000ff 53915cff
	ldda	[%i4+%o4]0x88,%f4 	! %f4  = ffffffff 0000feff
!	Mem[0000000030101410] = 00000000000001ff, %f4  = ffffffff 0000feff
	ldda	[%i4+%o5]0x89,%f4 	! %f4  = 00000000 000001ff
!	Mem[0000000010001408] = ff030000, %l6 = ffffffffffffff03
	ldswa	[%i0+%o4]0x80,%l6	! %l6 = ffffffffff030000
!	Mem[00000000100c1410] = 00ffffff 5d45aa64, %l6 = ff030000, %l7 = 00000000
	ldda	[%i3+%o5]0x88,%l6	! %l6 = 000000005d45aa64 0000000000ffffff
!	Mem[0000000010001400] = 000000ff, %l1 = 00000000000000ff
	lduha	[%i0+%g0]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010101410] = ff00000000000000, %l6 = 000000005d45aa64, %asi = 80
	ldxa	[%i4+0x010]%asi,%l6	! %l6 = ff00000000000000
!	Mem[00000000201c0000] = 00ff56b0, %l7 = 0000000000ffffff
	ldsh	[%o0+%g0],%l7		! %l7 = 00000000000000ff
!	Mem[000000001004140c] = 00000000, %l7 = 00000000000000ff, %asi = 80
	swapa	[%i1+0x00c]%asi,%l7	! %l7 = 0000000000000000

p0_label_245:
!	Starting 10 instruction Store Burst
!	%f24 = 0000032a 1c576869, %l1 = 00000000000000ff
!	Mem[0000000030041430] = 00ff00000b790000
	add	%i1,0x030,%g1
	stda	%f24,[%g1+%l1]ASI_PST8_S ! Mem[0000000030041430] = 0000032a1c576869
!	Mem[0000000030101408] = 000000ff, %l4 = 0000000000000000
	ldstuba	[%i4+%o4]0x89,%l4	! %l4 = 00000000000000ff
!	%l7 = 0000000000000000, Mem[0000000010101408] = fffe0000ffffffff
	stxa	%l7,[%i4+%o4]0x80	! Mem[0000000010101408] = 0000000000000000
!	%f22 = 41c58c2a 465c0000, %l7 = 0000000000000000
!	Mem[0000000010041430] = ffffffffc43da825
	add	%i1,0x030,%g1
	stda	%f22,[%g1+%l7]ASI_PST32_PL ! Mem[0000000010041430] = ffffffffc43da825
!	Mem[0000000030181400] = 22000001, %l6 = 0000000000000000
	swapa	[%i6+%g0]0x89,%l6	! %l6 = 0000000022000001
!	Mem[0000000010041438] = 00000000, %l7 = 00000000, %l4 = 000000ff
	add	%i1,0x38,%g1
	casa	[%g1]0x80,%l7,%l4	! %l4 = 0000000000000000
!	Mem[0000000010181410] = 000000ff, %l0 = 0000000000000000
	swapa	[%i6+%o5]0x80,%l0	! %l0 = 00000000000000ff
!	%l2 = 00000064, %l3 = 00004800, Mem[0000000010101408] = 00000000 00000000
	stda	%l2,[%i4+%o4]0x80	! Mem[0000000010101408] = 00000064 00004800
!	Mem[00000000300c1400] = fffff2e3, %l2 = 0000000000000064
	swapa	[%i3+%g0]0x81,%l2	! %l2 = 00000000fffff2e3
!	Mem[0000000010181400] = 00000000, %l1 = 00000000000000ff
	swapa	[%i6+%g0]0x88,%l1	! %l1 = 0000000000000000

p0_label_246:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = ff915cff, %l2 = 00000000fffff2e3
	ldsw	[%i4+%g0],%l2		! %l2 = ffffffffff915cff
!	Mem[00000000211c0000] = ffff4d40, %l3 = 0000000000004800
	lduh	[%o2+%g0],%l3		! %l3 = 000000000000ffff
!	Mem[0000000010141400] = 00000000, %l7 = 0000000000000000
	ldstuba	[%i5+%g0]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000010001400] = ff000000, %l4 = 0000000000000000
	lduwa	[%i0+%g0]0x80,%l4	! %l4 = 00000000ff000000
!	Mem[00000000100c1410] = 64aa455d, %f30 = 54983c02
	lda	[%i3+%o5]0x80,%f30	! %f30 = 64aa455d
!	Mem[0000000010001410] = ff000000, %l2 = ffffffffff915cff
	lduba	[%i0+%o5]0x80,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010181408] = 00000000, %l5 = 00000000000000ff
	ldswa	[%i6+%o4]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000010141428] = 53915c463900d900, %f22 = 41c58c2a 465c0000, %asi = 80
	ldda	[%i5+0x028]%asi,%f22	! %f22 = 53915c46 3900d900
!	Mem[0000000010141408] = 000000000000feff, %l4 = 00000000ff000000
	ldxa	[%i5+%o4]0x88,%l4	! %l4 = 000000000000feff
	membar	#Sync			! Added by membar checker (51)
!	Mem[0000000030081400] = 39000000 000003c4 38ffffff ffffffff
!	Mem[0000000030081410] = ffffff03 ff010000 ffffffff 2691032a
!	Mem[0000000030081420] = 6968571c 7569f2af aff26975 e7ecbcc1
!	Mem[0000000030081430] = 00000000 a4ae432e 39000000 000003ff
	ldda	[%i2+%g0]ASI_BLK_SL,%f16	! Block Load from 0000000030081400

p0_label_247:
!	Starting 10 instruction Store Burst
!	%l6 = 0000000022000001, Mem[00000000100c1408] = ff00b8895391ffc3
	stxa	%l6,[%i3+%o4]0x80	! Mem[00000000100c1408] = 0000000022000001
!	%f18 = ffffffff ffffff38, Mem[0000000030141408] = ffffffff ffffffff
	stda	%f18,[%i5+%o4]0x89	! Mem[0000000030141408] = ffffffff ffffff38
!	%l2 = 00000000000000ff, %l0 = 00000000000000ff, %y  = 00000000
	umul	%l2,%l0,%l1		! %l1 = 000000000000fe01, %y = 00000000
!	%l2 = 000000ff, %l3 = 0000ffff, Mem[00000000300c1408] = 00000000 00000000
	stda	%l2,[%i3+%o4]0x81	! Mem[00000000300c1408] = 000000ff 0000ffff
!	%f0  = 21010000 89ff5cff, Mem[0000000030001410] = 00000000 00005c00
	stda	%f0 ,[%i0+%o5]0x81	! Mem[0000000030001410] = 21010000 89ff5cff
!	%l6 = 22000001, %l7 = 00000000, Mem[00000000100c1438] = 5d45aa64 000000ff
	std	%l6,[%i3+0x038]		! Mem[00000000100c1438] = 22000001 00000000
!	%l2 = 00000000000000ff, Mem[0000000030181408] = ffffffff
	stba	%l2,[%i6+%o4]0x81	! Mem[0000000030181408] = ffffffff
!	%f22 = 2a039126, %f20 = 000001ff, %f4  = 00000000 000001ff
	fsmuld	%f22,%f20,%f4 		! tt=0x22, %l0 = 0000000000000121
!	%l4 = 000000000000feff, Mem[0000000030101408] = ff000000
	stwa	%l4,[%i4+%o4]0x81	! Mem[0000000030101408] = 0000feff
!	%l0 = 0000000000000121, Mem[00000000100c1410] = 64aa455dffffff00
	stxa	%l0,[%i3+%o5]0x80	! Mem[00000000100c1410] = 0000000000000121

p0_label_248:
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = ffff4d40, %l2 = 00000000000000ff
	ldsb	[%o2+%g0],%l2		! %l2 = ffffffffffffffff
!	Mem[0000000010141410] = ffffff7f ffffffff, %l0 = 00000121, %l1 = 0000fe01
	ldda	[%i5+%o5]0x80,%l0	! %l0 = 00000000ffffff7f 00000000ffffffff
!	Mem[00000000100c143c] = 00000000, %l7 = 0000000000000000
	ldsb	[%i3+0x03c],%l7		! %l7 = 0000000000000000
!	Mem[00000000100c1426] = 0000ff62, %l5 = 0000000000000000
	ldsb	[%i3+0x026],%l5		! %l5 = ffffffffffffffff
!	Mem[0000000010041408] = 0000ff62, %l5 = ffffffffffffffff
	lduha	[%i1+%o4]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000030001408] = 000000ff, %f10 = 00000000
	lda	[%i0+%o4]0x89,%f10	! %f10 = 000000ff
!	Mem[0000000010041410] = 00000000, %l7 = 0000000000000000
	lduwa	[%i1+%o5]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000030001410] = 00000121, %l4 = 000000000000feff
	lduwa	[%i0+%o5]0x89,%l4	! %l4 = 0000000000000121
!	Mem[0000000020800041] = ffff7f10, %l7 = 0000000000000000
	ldstub	[%o1+0x041],%l7		! %l7 = 00000000000000ff
!	Mem[0000000010081408] = 0000c302696800ff, %f14 = 00000000 53910053
	ldda	[%i2+%o4]0x88,%f14	! %f14 = 0000c302 696800ff

p0_label_249:
!	Starting 10 instruction Store Burst
!	Mem[0000000020800000] = 00002ce0, %l6 = 0000000022000001
	ldstuba	[%o1+0x000]%asi,%l6	! %l6 = 0000000000000000
!	%l2 = ffffffffffffffff, %l4 = 0000000000000121, %l6 = 0000000000000000
	subc	%l2,%l4,%l6		! %l6 = fffffffffffffede
!	Mem[0000000010081410] = c3ff0000, %l5 = 0000000000000000
	ldstuba	[%i2+%o5]0x80,%l5	! %l5 = 00000000000000c3
!	%l3 = 000000000000ffff, Mem[0000000010181410] = 00000000
	stwa	%l3,[%i6+%o5]0x88	! Mem[0000000010181410] = 0000ffff
!	%l0 = 00000000ffffff7f, Mem[0000000010001418] = 53915c466f3e780d, %asi = 80
	stxa	%l0,[%i0+0x018]%asi	! Mem[0000000010001418] = 00000000ffffff7f
!	Mem[0000000030101410] = 000001ff, %l5 = 00000000000000c3
	ldstuba	[%i4+%o5]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[000000001014141c] = 6f00780d, %l7 = 00000000000000ff
	swap	[%i5+0x01c],%l7		! %l7 = 000000006f00780d
!	%l2 = ffffffffffffffff, Mem[0000000030101408] = 0000feff
	stha	%l2,[%i4+%o4]0x81	! Mem[0000000030101408] = fffffeff
!	%l5 = 00000000000000ff, Mem[0000000030101408] = fffeffff
	stba	%l5,[%i4+%o4]0x89	! Mem[0000000030101408] = fffeffff
!	%l4 = 00000121, %l5 = 000000ff, Mem[0000000030101410] = ff010000 00000000
	stda	%l4,[%i4+%o5]0x81	! Mem[0000000030101410] = 00000121 000000ff

p0_label_250:
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = 38ffffff, %l4 = 0000000000000121
	ldsba	[%i2+%o4]0x81,%l4	! %l4 = 0000000000000038
!	Mem[0000000010141400] = ff000000, %l4 = 0000000000000038
	ldsba	[%i5+%g0]0x80,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010081410] = 0000ffff, %f0  = 21010000
	lda	[%i2+%o5]0x88,%f0 	! %f0 = 0000ffff
!	Mem[0000000010101400] = ff5c91ff, %l7 = 000000006f00780d
	lduba	[%i4+%g0]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010041428] = 7dd9efff0d783e6f, %l4 = ffffffffffffffff, %asi = 80
	ldxa	[%i1+0x028]%asi,%l4	! %l4 = 7dd9efff0d783e6f
!	Mem[0000000010101418] = 41c58c2a465c0000, %f0  = 0000ffff 89ff5cff
	ldd	[%i4+0x018],%f0 	! %f0  = 41c58c2a 465c0000
!	Mem[0000000010181414] = 00000000, %l4 = 7dd9efff0d783e6f, %asi = 80
	lduha	[%i6+0x014]%asi,%l4	! %l4 = 0000000000000000
!	Mem[0000000030081410] = ffffff03, %f6  = 000000ff
	lda	[%i2+%o5]0x81,%f6 	! %f6 = ffffff03
!	Mem[0000000010181434] = 00ff0000, %l3 = 000000000000ffff
	lduw	[%i6+0x034],%l3		! %l3 = 0000000000ff0000
!	Mem[0000000010181418] = 53915c466f3e780d, %l7 = 00000000000000ff
	ldx	[%i6+0x018],%l7		! %l7 = 53915c466f3e780d

p0_label_251:
!	Starting 10 instruction Store Burst
!	Mem[0000000010041434] = c43da825, %l3 = 00ff0000, %l4 = 00000000
	add	%i1,0x34,%g1
	casa	[%g1]0x80,%l3,%l4	! %l4 = 00000000c43da825
!	%l7 = 53915c466f3e780d, Mem[00000000100c1408] = 00000000
	stw	%l7,[%i3+%o4]		! Mem[00000000100c1408] = 6f3e780d
!	Mem[00000000300c1400] = 00000064, %l2 = 00000000ffffffff
	swapa	[%i3+%g0]0x81,%l2	! %l2 = 0000000000000064
!	%f0  = 41c58c2a 465c0000, Mem[0000000010181400] = 000000ff 0d126cc7
	stda	%f0 ,[%i6+%g0]0x88	! Mem[0000000010181400] = 41c58c2a 465c0000
!	%l7 = 53915c466f3e780d, %l2 = 0000000000000064, %l0 = 00000000ffffff7f
	udivx	%l7,%l2,%l0		! %l0 = 00d5ef00b44ffc14
!	%l3 = 0000000000ff0000, Mem[0000000030041400] = ff0000ff00000039
	stxa	%l3,[%i1+%g0]0x81	! Mem[0000000030041400] = 0000000000ff0000
!	Mem[0000000010101400] = ff915cff, %l5 = 00000000000000ff
	swapa	[%i4+%g0]0x80,%l5	! %l5 = 00000000ff915cff
!	Mem[00000000300c1410] = 62ff0000, %l2 = 0000000000000064
	ldstuba	[%i3+%o5]0x89,%l2	! %l2 = 0000000000000000
!	%l6 = fffffffffffffede, Mem[00000000100c1410] = 00000000
	stba	%l6,[%i3+%o5]0x80	! Mem[00000000100c1410] = de000000
!	Mem[00000000201c0001] = 00ff56b0, %l7 = 53915c466f3e780d
	ldstuba	[%o0+0x001]%asi,%l7	! %l7 = 00000000000000ff

p0_label_252:
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (52)
!	Mem[0000000010001400] = ff000000 00000000 ff030000 39000000
!	Mem[0000000010001410] = ff000000 ff000000 00000000 ffffff7f
!	Mem[0000000010001420] = 00000000 000003c4 000000f6 7569f2af
!	Mem[0000000010001430] = 696857c4 00000000 0000ff00 000000ff
	ldda	[%i0+%g0]ASI_BLK_AIUP,%f16	! Block Load from 0000000010001400
!	Mem[000000001014141c] = 000000ff, %f10 = 000000ff
	ld	[%i5+0x01c],%f10	! %f10 = 000000ff
!	Mem[00000000300c1400] = ffffffff, %l6 = fffffffffffffede
	ldsha	[%i3+%g0]0x89,%l6	! %l6 = ffffffffffffffff
!	%l6 = ffffffffffffffff, %l7 = 00000000000000ff, %l7 = 00000000000000ff
	xnor	%l6,%l7,%l7		! %l7 = 00000000000000ff
!	Mem[0000000030081410] = ffffff03, %l2 = 0000000000000000
	lduha	[%i2+%o5]0x81,%l2	! %l2 = 000000000000ffff
!	Mem[0000000030101400] = 00000000 ff0100ff, %l4 = c43da825, %l5 = ff915cff
	ldda	[%i4+%g0]0x89,%l4	! %l4 = 00000000ff0100ff 0000000000000000
!	Mem[0000000010101400] = 000000ff, %l5 = 0000000000000000
	ldsba	[%i4+%g0]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000030141410] = 38ffffffff000000, %f2  = 005c9153 5d45aa64
	ldda	[%i5+%o5]0x89,%f2 	! %f2  = 38ffffff ff000000
!	%l4 = 00000000ff0100ff, imm = ffffffffffffff12, %l2 = 000000000000ffff
	orn	%l4,-0x0ee,%l2		! %l2 = 00000000ff0100ff
!	Mem[0000000010141410] = ffffffff 7fffffff, %l2 = ff0100ff, %l3 = 00ff0000
	ldda	[%i5+%o5]0x88,%l2	! %l2 = 000000007fffffff 00000000ffffffff

p0_label_253:
!	Starting 10 instruction Store Burst
!	Mem[0000000010101400] = 000000ff00000000, %l1 = 00000000ffffffff, %l1 = 00000000ffffffff
	casxa	[%i4]0x80,%l1,%l1	! %l1 = 000000ff00000000
!	Mem[0000000030081410] = ffffff03, %l7 = 00000000000000ff
	swapa	[%i2+%o5]0x81,%l7	! %l7 = 00000000ffffff03
!	Mem[0000000010101400] = 000000ff 00000000 00000064 00004800
!	%f16 = ff000000 00000000 ff030000 39000000
!	%f20 = ff000000 ff000000 00000000 ffffff7f
!	%f24 = 00000000 000003c4 000000f6 7569f2af
!	%f28 = 696857c4 00000000 0000ff00 000000ff
	stda	%f16,[%i4+%g0]ASI_BLK_AIUPL	! Block Store to 0000000010101400
!	Mem[00000000100c1410] = 000000de, %l1 = 000000ff00000000
	ldstuba	[%i3+%o5]0x88,%l1	! %l1 = 00000000000000de
!	Mem[0000000010041400] = 00000000, %l5 = 0000000000000000
	swapa	[%i1+%g0]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000021800140] = ffff4e60, %l2 = 000000007fffffff
	ldstub	[%o3+0x140],%l2		! %l2 = 00000000000000ff
!	%f6  = ffffff03 ff000000, Mem[0000000010041408] = 62ff0000 ff000000
	stda	%f6 ,[%i1+%o4]0x88	! Mem[0000000010041408] = ffffff03 ff000000
!	Mem[0000000010141408] = fffe0000, %l5 = 0000000000000000
	ldstuba	[%i5+%o4]0x80,%l5	! %l5 = 00000000000000ff
!	%l7 = 00000000ffffff03, Mem[000000001010141a] = 7fffffff, %asi = 80
	stha	%l7,[%i4+0x01a]%asi	! Mem[0000000010101418] = 7fffff03
!	%l6 = ffffffffffffffff, Mem[00000000300c1410] = ff00ff6200000000
	stxa	%l6,[%i3+%o5]0x81	! Mem[00000000300c1410] = ffffffffffffffff

p0_label_254:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141406] = 000000ff, %l4 = 00000000ff0100ff
	lduh	[%i5+0x006],%l4		! %l4 = 00000000000000ff
!	Mem[0000000010041408] = 000000ff, %l4 = 00000000000000ff
	lduba	[%i1+%o4]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000010181408] = 00000000, %l7 = 00000000ffffff03
	ldswa	[%i6+%o4]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000030041408] = ffffffff, %l7 = 0000000000000000
	lduha	[%i1+%o4]0x81,%l7	! %l7 = 000000000000ffff
!	Mem[0000000010041410] = 00000000, %f15 = 696800ff
	lda	[%i1+%o5]0x88,%f15	! %f15 = 00000000
!	%l6 = ffffffffffffffff, %l2 = 00000000000000ff, %l3 = 00000000ffffffff
	xor	%l6,%l2,%l3		! %l3 = ffffffffffffff00
!	Mem[0000000030181408] = 38ffffffffffffff, %l2 = 00000000000000ff
	ldxa	[%i6+%o4]0x89,%l2	! %l2 = 38ffffffffffffff
!	Mem[0000000010141410] = 7fffffff, %l7 = 000000000000ffff
	ldsba	[%i5+%o5]0x88,%l7	! %l7 = ffffffffffffffff
!	Mem[00000000211c0001] = ffff4d40, %l0 = 00d5ef00b44ffc14, %asi = 80
	ldsba	[%o2+0x001]%asi,%l0	! %l0 = ffffffffffffffff
!	Mem[000000001018140e] = 00000000, %l4 = 0000000000000000
	lduh	[%i6+0x00e],%l4		! %l4 = 0000000000000000

p0_label_255:
!	Starting 10 instruction Store Burst
!	Mem[0000000010181430] = 696857c4, %l2 = ffffffff, %l0 = ffffffff
	add	%i6,0x30,%g1
	casa	[%g1]0x80,%l2,%l0	! %l0 = 00000000696857c4
!	%l4 = 0000000000000000, Mem[0000000030101408] = fffeffff
	stha	%l4,[%i4+%o4]0x89	! Mem[0000000030101408] = fffe0000
!	%f5  = 000001ff, Mem[0000000010081404] = 00000039
	st	%f5 ,[%i2+0x004]	! Mem[0000000010081404] = 000001ff
!	Mem[0000000030141400] = 0d783e00, %l3 = 00000000ffffff00
	swapa	[%i5+%g0]0x81,%l3	! %l3 = 000000000d783e00
!	%l4 = 00000000, %l5 = 000000ff, Mem[00000000300c1408] = 000000ff 0000ffff
	stda	%l4,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00000000 000000ff
	membar	#Sync			! Added by membar checker (53)
!	%f16 = ff000000, Mem[0000000010001400] = ff000000
	sta	%f16,[%i0+0x000]%asi	! Mem[0000000010001400] = ff000000
!	Mem[000000001018142c] = 3900d900, %l4 = 00000000, %l1 = 000000de
	add	%i6,0x2c,%g1
	casa	[%g1]0x80,%l4,%l1	! %l1 = 000000003900d900
!	%f25 = 000003c4, Mem[0000000010081428] = c1bcece7
	sta	%f25,[%i2+0x028]%asi	! Mem[0000000010081428] = 000003c4
!	%l7 = ffffffffffffffff, Mem[0000000010101410] = 000000ff
	stha	%l7,[%i4+%o5]0x80	! Mem[0000000010101410] = ffff00ff
!	%f5  = 000001ff, %f12 = c1ff0000
	fcmpes	%fcc0,%f5 ,%f12		! %fcc0 = 2

p0_label_256:
!	Starting 10 instruction Load Burst
!	Mem[0000000030001400] = 00000000, %l2 = 38ffffffffffffff
	ldsba	[%i0+%g0]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000010181414] = 00000000, %l1 = 000000003900d900, %asi = 80
	lduwa	[%i6+0x014]%asi,%l1	! %l1 = 0000000000000000
!	Mem[0000000030081410] = 000000ff, %f31 = 000000ff
	lda	[%i2+%o5]0x81,%f31	! %f31 = 000000ff
!	Mem[0000000030041410] = ff000000, %l4 = 0000000000000000
	ldsba	[%i1+%o5]0x81,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000030081408] = 38ffffff ffffffff, %l2 = 00000000, %l3 = 0d783e00
	ldda	[%i2+%o4]0x81,%l2	! %l2 = 0000000038ffffff 00000000ffffffff
!	Mem[0000000030141410] = 38ffffffff000000, %f4  = 00000000 000001ff
	ldda	[%i5+%o5]0x89,%f4 	! %f4  = 38ffffff ff000000
!	Mem[0000000010181408] = 00000000, %l6 = ffffffffffffffff
	lduha	[%i6+%o4]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000010041438] = 000000ff 000000ff, %l4 = ffffffff, %l5 = 000000ff
	ldd	[%i1+0x038],%l4		! %l4 = 00000000000000ff 00000000000000ff
!	Mem[0000000030081410] = ff000000, %f17 = 00000000
	lda	[%i2+%o5]0x89,%f17	! %f17 = ff000000
!	Mem[0000000030101410] = 21010000, %l2 = 0000000038ffffff
	lduba	[%i4+%o5]0x89,%l2	! %l2 = 0000000000000000

p0_label_257:
!	Starting 10 instruction Store Burst
!	%f4  = 38ffffff ff000000, Mem[0000000010001410] = 000000ff 000000ff
	stda	%f4 ,[%i0+%o5]0x88	! Mem[0000000010001410] = 38ffffff ff000000
!	%f22 = 00000000, Mem[0000000010041410] = 00000000
	sta	%f22,[%i1+%o5]0x80	! Mem[0000000010041410] = 00000000
!	Mem[0000000010141408] = fffe0000, %l5 = 00000000000000ff
	ldstuba	[%i5+%o4]0x80,%l5	! %l5 = 00000000000000ff
!	%l4 = 000000ff, %l5 = 000000ff, Mem[0000000030101408] = 0000feff 000000ff
	stda	%l4,[%i4+%o4]0x81	! Mem[0000000030101408] = 000000ff 000000ff
!	Mem[000000001010142a] = aff26975, %l4 = 00000000000000ff
	ldstub	[%i4+0x02a],%l4		! %l4 = 0000000000000069
!	%l4 = 0000000000000069, Mem[0000000010141438] = 000000ff
	stw	%l4,[%i5+0x038]		! Mem[0000000010141438] = 00000069
!	%l6 = 0000000000000000, Mem[0000000030041400] = 00000000
	stha	%l6,[%i1+%g0]0x89	! Mem[0000000030041400] = 00000000
!	%f2  = 38ffffff ff000000, Mem[0000000010081400] = 000000ff 000001ff, %asi = 80
	stda	%f2 ,[%i2+0x000]%asi	! Mem[0000000010081400] = 38ffffff ff000000
!	%l2 = 0000000000000000, Mem[0000000030101408] = 000000ff
	stwa	%l2,[%i4+%o4]0x81	! Mem[0000000030101408] = 00000000
!	%l0 = 00000000696857c4, Mem[00000000100c1408] = 6f3e780d
	stha	%l0,[%i3+%o4]0x80	! Mem[00000000100c1408] = 57c4780d

p0_label_258:
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = 00ff56b0, %l3 = 00000000ffffffff
	ldsh	[%o0+%g0],%l3		! %l3 = 00000000000000ff
!	%l6 = 0000000000000000, Mem[0000000010001400] = ff00000000000000
	stxa	%l6,[%i0+%g0]0x80	! Mem[0000000010001400] = 0000000000000000
!	Mem[0000000010101410] = ffff00ff000000ff, %l1 = 0000000000000000
	ldx	[%i4+%o5],%l1		! %l1 = ffff00ff000000ff
!	Mem[0000000010101400] = 00000000, %f29 = 00000000
	lda	[%i4+%g0]0x80,%f29	! %f29 = 00000000
!	Mem[0000000030041410] = 000000ff, %l5 = 00000000000000ff
	ldsba	[%i1+%o5]0x89,%l5	! %l5 = ffffffffffffffff
!	Mem[000000001008141e] = 000050d7, %l4 = 0000000000000069, %asi = 80
	lduba	[%i2+0x01e]%asi,%l4	! %l4 = 0000000000000050
!	Mem[0000000010001408] = ff030000, %l6 = 0000000000000000
	lduwa	[%i0+%o4]0x80,%l6	! %l6 = 00000000ff030000
!	Mem[0000000030041400] = 0000000000ff0000, %l7 = ffffffffffffffff
	ldxa	[%i1+%g0]0x81,%l7	! %l7 = 0000000000ff0000
!	%l0 = 00000000696857c4, Mem[00000000100c1410] = ff00000000000121
	stx	%l0,[%i3+%o5]		! Mem[00000000100c1410] = 00000000696857c4
!	%l6 = 00000000ff030000, %l3 = 00000000000000ff, %l5 = ffffffffffffffff
	sdivx	%l6,%l3,%l5		! %l5 = 0000000001000303

p0_label_259:
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000000050, Mem[00000000201c0000] = 00ff56b0
	sth	%l4,[%o0+%g0]		! Mem[00000000201c0000] = 005056b0
!	%l3 = 00000000000000ff, Mem[0000000010101438] = ff00000000ff0000, %asi = 80
	stxa	%l3,[%i4+0x038]%asi	! Mem[0000000010101438] = 00000000000000ff
!	%l6 = 00000000ff030000, Mem[00000000218000c0] = ffff5e00, %asi = 80
	stha	%l6,[%o3+0x0c0]%asi	! Mem[00000000218000c0] = 00005e00
!	%f7  = ff000000, Mem[0000000030041400] = 00000000
	sta	%f7 ,[%i1+%g0]0x89	! Mem[0000000030041400] = ff000000
!	Mem[0000000021800181] = 00008090, %l6 = 00000000ff030000
	ldstub	[%o3+0x181],%l6		! %l6 = 0000000000000000
!	%l4 = 0000000000000050, Mem[0000000010101408] = 00000039
	stwa	%l4,[%i4+%o4]0x80	! Mem[0000000010101408] = 00000050
!	Mem[0000000010181420] = 89ffffff, %l4 = 0000000000000050, %asi = 80
	swapa	[%i6+0x020]%asi,%l4	! %l4 = 0000000089ffffff
!	%l2 = 0000000000000000, Mem[0000000030141400] = 00ffffff
	stwa	%l2,[%i5+%g0]0x89	! Mem[0000000030141400] = 00000000
!	Mem[00000000201c0001] = 005056b0, %l2 = 0000000000000000
	ldstuba	[%o0+0x001]%asi,%l2	! %l2 = 0000000000000050
!	%l7 = 0000000000ff0000, Mem[0000000030081410] = ff000000
	stwa	%l7,[%i2+%o5]0x89	! Mem[0000000030081410] = 00ff0000

p0_label_260:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = fffe0000 00000000, %l4 = 89ffffff, %l5 = 01000303, %asi = 80
	ldda	[%i5+0x008]%asi,%l4	! %l4 = 00000000fffe0000 0000000000000000
!	Mem[0000000010001410] = ff000000, %l6 = 0000000000000000
	ldsba	[%i0+%o5]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000010041410] = ffffffff00000000, %l2 = 0000000000000050
	ldxa	[%i1+%o5]0x88,%l2	! %l2 = ffffffff00000000
!	%l0 = 00000000696857c4, %l3 = 00000000000000ff, %l7 = 0000000000ff0000
	udivx	%l0,%l3,%l7		! %l7 = 000000000069d229
!	Mem[0000000030141408] = ffffff38, %f0  = 41c58c2a
	lda	[%i5+%o4]0x89,%f0 	! %f0 = ffffff38
!	Mem[0000000021800140] = ffff4e60, %l5 = 0000000000000000, %asi = 80
	lduba	[%o3+0x140]%asi,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010081420] = fffcc3ff, %l1 = ffff00ff000000ff, %asi = 80
	ldsha	[%i2+0x020]%asi,%l1	! %l1 = fffffffffffffffc
!	Mem[0000000030001400] = 00000000, %l5 = 00000000000000ff
	ldsba	[%i0+%g0]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000030001410] = 21010000, %l2 = ffffffff00000000
	ldswa	[%i0+%o5]0x81,%l2	! %l2 = 0000000021010000
!	%f9  = 00000000, %f21 = ff000000
	fsqrts	%f9 ,%f21		! %f21 = 00000000

p0_label_261:
!	Starting 10 instruction Store Burst
!	%l4 = 00000000fffe0000, Mem[0000000030041400] = ff000000
	stha	%l4,[%i1+%g0]0x89	! Mem[0000000030041400] = ff000000
!	%l5 = 0000000000000000, Mem[0000000010101400] = ff00000000000000
	stxa	%l5,[%i4+%g0]0x88	! Mem[0000000010101400] = 0000000000000000
!	%l6 = 0000000000000000, Mem[0000000030141408] = 38ffffff
	stba	%l6,[%i5+%o4]0x81	! Mem[0000000030141408] = 00ffffff
!	Mem[0000000010041420] = 0000000000000000, %l1 = fffffffffffffffc, %l1 = fffffffffffffffc
	add	%i1,0x20,%g1
	casxa	[%g1]0x80,%l1,%l1	! %l1 = 0000000000000000
!	%l5 = 0000000000000000, Mem[0000000010141410] = ffffff7f
	stba	%l5,[%i5+%o5]0x80	! Mem[0000000010141410] = 00ffff7f
!	Mem[000000001008142f] = 7569f2af, %l2 = 0000000021010000
	ldstuba	[%i2+0x02f]%asi,%l2	! %l2 = 00000000000000af
!	%l5 = 0000000000000000, Mem[0000000010181408] = 0000000000000000
	stxa	%l5,[%i6+%o4]0x80	! Mem[0000000010181408] = 0000000000000000
!	Mem[0000000010081410] = 0000ffff, %l4 = 00000000fffe0000
	ldstuba	[%i2+%o5]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010141424] = 000003c4, %l1 = 00000000, %l2 = 000000af
	add	%i5,0x24,%g1
	casa	[%g1]0x80,%l1,%l2	! %l2 = 00000000000003c4
!	%l6 = 0000000000000000, Mem[0000000010041400] = 00000000
	stha	%l6,[%i1+%g0]0x80	! Mem[0000000010041400] = 00000000

p0_label_262:
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = 00000000 00000000, %l6 = 00000000, %l7 = 0069d229
	ldda	[%i5+%g0]0x89,%l6	! %l6 = 0000000000000000 0000000000000000
!	Mem[0000000010001410] = 000000ff, %l5 = 0000000000000000
	ldswa	[%i0+%o5]0x80,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010101408] = 50000000, %l2 = 00000000000003c4
	lduha	[%i4+%o4]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000010141410] = ffffffff7fffff00, %f14 = 0000c302 00000000
	ldda	[%i5+%o5]0x88,%f14	! %f14 = ffffffff 7fffff00
!	Mem[0000000010141408] = fffe0000, %l1 = 0000000000000000
	lduha	[%i5+%o4]0x80,%l1	! %l1 = 000000000000fffe
!	Mem[00000000211c0000] = ffff4d40, %l5 = 00000000000000ff
	lduh	[%o2+%g0],%l5		! %l5 = 000000000000ffff
!	Mem[0000000010081408] = ff006869, %l0 = 00000000696857c4
	ldsha	[%i2+%o4]0x80,%l0	! %l0 = ffffffffffffff00
!	Mem[000000001010140c] = 000003ff, %l6 = 0000000000000000, %asi = 80
	ldsba	[%i4+0x00c]%asi,%l6	! %l6 = 0000000000000000
!	Mem[0000000010081400] = 38ffffff, %f4  = 38ffffff
	lda	[%i2+%g0]0x80,%f4 	! %f4 = 38ffffff
!	%f18 = ff030000, %f31 = 000000ff
	fcmpes	%fcc3,%f18,%f31		! %fcc3 = 1

p0_label_263:
!	Starting 10 instruction Store Burst
!	Mem[0000000010141421] = 39000000, %l3 = 00000000000000ff
	ldstub	[%i5+0x021],%l3		! %l3 = 0000000000000000
!	%l0 = ffffffffffffff00, Mem[0000000030081410] = 0000ff00
	stha	%l0,[%i2+%o5]0x81	! Mem[0000000030081410] = ff00ff00
!	%l4 = 00000000000000ff, Mem[0000000010101410] = ff00ffff
	stba	%l4,[%i4+%o5]0x88	! Mem[0000000010101410] = ff00ffff
!	%l3 = 0000000000000000, Mem[0000000010001400] = 00000000
	stwa	%l3,[%i0+%g0]0x80	! Mem[0000000010001400] = 00000000
!	%l3 = 0000000000000000, %l1 = 000000000000fffe, %l3 = 0000000000000000
	xnor	%l3,%l1,%l3		! %l3 = ffffffffffff0001
!	%l1 = 000000000000fffe, immd = 0000000000000b24, %l7  = 0000000000000000
	mulx	%l1,0xb24,%l7		! %l7 = 000000000b23e9b8
!	%l6 = 0000000000000000, Mem[00000000100c1420] = 00000000
	stw	%l6,[%i3+0x020]		! Mem[00000000100c1420] = 00000000
!	%l2 = 0000000000000000, Mem[0000000030041408] = ffffffff
	stwa	%l2,[%i1+%o4]0x81	! Mem[0000000030041408] = 00000000
!	Mem[0000000010181400] = 465c0000, %l4 = 00000000000000ff
	swapa	[%i6+%g0]0x88,%l4	! %l4 = 00000000465c0000
!	%l1 = 000000000000fffe, Mem[0000000010081408] = 0000c302696800ff
	stxa	%l1,[%i2+%o4]0x88	! Mem[0000000010081408] = 000000000000fffe

p0_label_264:
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = ffffffffffffff00, %l7 = 000000000b23e9b8
	ldxa	[%i5+%o4]0x89,%l7	! %l7 = ffffffffffffff00
!	Mem[0000000010141400] = ff000000, %f19 = 39000000
	lda	[%i5+%g0]0x80,%f19	! %f19 = ff000000
!	Mem[0000000010141413] = 00ffff7f, %l6 = 0000000000000000
	ldub	[%i5+0x013],%l6		! %l6 = 000000000000007f
!	Mem[00000000211c0000] = ffff4d40, %l2 = 0000000000000000
	ldsh	[%o2+%g0],%l2		! %l2 = ffffffffffffffff
!	%f14 = ffffffff 7fffff00, %l6 = 000000000000007f
!	Mem[0000000030181408] = ffffffffffffff38
	add	%i6,0x008,%g1
	stda	%f14,[%g1+%l6]ASI_PST32_S ! Mem[0000000030181408] = ffffffff7fffff00
!	Mem[0000000010001410] = ff000000, %l0 = ffffffffffffff00
	lduba	[%i0+%o5]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000010101404] = 00000000, %f5  = ff000000
	ld	[%i4+0x004],%f5 	! %f5 = 00000000
!	Mem[0000000010141410] = 7fffff00, %l5 = 000000000000ffff
	ldswa	[%i5+%o5]0x88,%l5	! %l5 = 000000007fffff00
!	Mem[0000000030081408] = 38ffffff ffffffff, %l0 = 00000000, %l1 = 0000fffe
	ldda	[%i2+%o4]0x81,%l0	! %l0 = 0000000038ffffff 00000000ffffffff
!	Mem[00000000300c1410] = ffffffffffffffff, %l2 = ffffffffffffffff
	ldxa	[%i3+%o5]0x81,%l2	! %l2 = ffffffffffffffff

p0_label_265:
!	Starting 10 instruction Store Burst
!	%f2  = 38ffffff ff000000, Mem[0000000030041410] = ff000000 000000ff
	stda	%f2 ,[%i1+%o5]0x81	! Mem[0000000030041410] = 38ffffff ff000000
!	%l4 = 00000000465c0000, Mem[0000000030101400] = 00000000ff0100ff
	stxa	%l4,[%i4+%g0]0x89	! Mem[0000000030101400] = 00000000465c0000
!	%l7 = ffffffffffffff00, Mem[0000000010081400] = 38ffffff
	stwa	%l7,[%i2+%g0]0x80	! Mem[0000000010081400] = ffffff00
!	%f28 = 696857c4 00000000, Mem[0000000030081400] = 00000039 c4030000
	stda	%f28,[%i2+%g0]0x89	! Mem[0000000030081400] = 696857c4 00000000
!	%l0 = 0000000038ffffff, Mem[00000000300c1410] = ffffffff
	stha	%l0,[%i3+%o5]0x81	! Mem[00000000300c1410] = ffffffff
!	Mem[0000000030141410] = ff000000, %l3 = ffffffffffff0001
	ldstuba	[%i5+%o5]0x89,%l3	! %l3 = 0000000000000000
!	Mem[00000000201c0001] = 00ff56b0, %l6 = 000000000000007f
	ldstub	[%o0+0x001],%l6		! %l6 = 00000000000000ff
!	%l2 = ffffffffffffffff, Mem[00000000100c1400] = 000000ff
	stwa	%l2,[%i3+%g0]0x88	! Mem[00000000100c1400] = ffffffff
!	%l7 = ffffffffffffff00, Mem[0000000030001410] = 21010000
	stha	%l7,[%i0+%o5]0x81	! Mem[0000000030001410] = ff000000
!	%l0 = 0000000038ffffff, Mem[0000000030181408] = ffffffff
	stwa	%l0,[%i6+%o4]0x89	! Mem[0000000030181408] = 38ffffff

p0_label_266:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = 00000000, %f10 = 000000ff
	lda	[%i1+%g0]0x88,%f10	! %f10 = 00000000
!	%f5  = 00000000, %f8  = 62ff0000, %f12 = c1ff0000 ff000000
	fsmuld	%f5 ,%f8 ,%f12		! %f12 = 00000000 00000000
!	Mem[000000001010141a] = 7fffff03, %l1 = 00000000ffffffff
	ldub	[%i4+0x01a],%l1		! %l1 = 00000000000000ff
!	Mem[0000000030181400] = 00000000, %l7 = ffffffffffffff00
	lduha	[%i6+%g0]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000010181400] = 41c58c2a000000ff, %f10 = 00000000 00000000
	ldda	[%i6+%g0]0x88,%f10	! %f10 = 41c58c2a 000000ff
!	Mem[0000000030081410] = ff00ff00, %l6 = 00000000000000ff
	lduwa	[%i2+%o5]0x81,%l6	! %l6 = 00000000ff00ff00
!	Mem[0000000010081400] = ffffff00, %l4 = 00000000465c0000
	ldsba	[%i2+%g0]0x80,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000030081408] = ffffffffffffff38, %l1 = 00000000000000ff
	ldxa	[%i2+%o4]0x89,%l1	! %l1 = ffffffffffffff38
!	Mem[0000000010041400] = 00000000, %l5 = 000000007fffff00
	lduwa	[%i1+%g0]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000010181410] = ffff0000, %l0 = 0000000038ffffff
	ldswa	[%i6+%o5]0x80,%l0	! %l0 = ffffffffffff0000

p0_label_267:
!	Starting 10 instruction Store Burst
!	%f19 = ff000000, %f4  = 38ffffff, %f6  = ffffff03
	fsubs	%f19,%f4 ,%f6 		! %f6  = ff000000
!	%l0 = ffffffffffff0000, Mem[00000000300c1410] = ffffffffffffffff
	stxa	%l0,[%i3+%o5]0x81	! Mem[00000000300c1410] = ffffffffffff0000
!	Mem[0000000010181400] = ff000000, %l6 = 00000000ff00ff00
	ldstuba	[%i6+%g0]0x80,%l6	! %l6 = 00000000000000ff
!	Mem[00000000100c1400] = ffffffff, %l6 = 00000000000000ff
	ldstuba	[%i3+%g0]0x80,%l6	! %l6 = 00000000000000ff
!	%l2 = ffffffffffffffff, %l5 = 0000000000000000, %y  = 00000000
	umul	%l2,%l5,%l5		! %l5 = 0000000000000000, %y = 00000000
!	Mem[00000000100c1410] = 00000000, %l3 = 0000000000000000
	ldstuba	[%i3+%o5]0x80,%l3	! %l3 = 0000000000000000
!	%l6 = 00000000000000ff, immd = ffffffffffffff8e, %l108 = 0000000000000003
	udivx	%l6,-0x072,%l3		! %l3 = 0000000000000000
!	%l4 = ffffffff, %l5 = 00000000, Mem[00000000100c1408] = 0d78c457 01000022
	stda	%l4,[%i3+%o4]0x88	! Mem[00000000100c1408] = ffffffff 00000000
!	%l6 = 00000000000000ff, Mem[0000000030101410] = 00000121000000ff
	stxa	%l6,[%i4+%o5]0x81	! Mem[0000000030101410] = 00000000000000ff
!	%l7 = 0000000000000000, Mem[0000000010081408] = feff000000000000
	stxa	%l7,[%i2+%o4]0x80	! Mem[0000000010081408] = 0000000000000000

p0_label_268:
!	Starting 10 instruction Load Burst
!	Mem[000000001014143f] = c76c120d, %l0 = ffffffffffff0000
	ldub	[%i5+0x03f],%l0		! %l0 = 000000000000000d
!	Mem[0000000021800180] = 00ff8090, %l0 = 000000000000000d
	lduh	[%o3+0x180],%l0		! %l0 = 00000000000000ff
!	Mem[00000000100c1410] = 000000ff, %l3 = 0000000000000000
	ldswa	[%i3+%o5]0x88,%l3	! %l3 = 00000000000000ff
!	%f6  = ff000000, %f15 = 7fffff00, %f14 = ffffffff
	fdivs	%f6 ,%f15,%f14		! %f14 = 7fffff00
!	Mem[0000000030141410] = 38ffffffff0000ff, %f18 = ff030000 ff000000
	ldda	[%i5+%o5]0x89,%f18	! %f18 = 38ffffff ff0000ff
!	%l7 = 0000000000000000, %l6 = 00000000000000ff, %y  = 00000000
	smul	%l7,%l6,%l4		! %l4 = 0000000000000000, %y = 00000000
!	%f19 = ff0000ff, %f6  = ff000000
	fcmps	%fcc3,%f19,%f6 		! %fcc3 = 1
!	Mem[0000000030101408] = ff00000000000000, %f16 = ff000000 ff000000
	ldda	[%i4+%o4]0x89,%f16	! %f16 = ff000000 00000000
!	Mem[0000000010181408] = 00000000, %f27 = 7569f2af
	lda	[%i6+%o4]0x80,%f27	! %f27 = 00000000
!	Mem[0000000030001400] = 00000000, %l6 = 00000000000000ff
	swapa	[%i0+%g0]0x81,%l6	! %l6 = 0000000000000000

p0_label_269:
!	Starting 10 instruction Store Burst
!	Mem[0000000030181408] = 38ffffff, %l0 = 00000000000000ff
	swapa	[%i6+%o4]0x89,%l0	! %l0 = 0000000038ffffff
!	%l0 = 0000000038ffffff, Mem[0000000030141400] = 00000000
	stha	%l0,[%i5+%g0]0x81	! Mem[0000000030141400] = ffff0000
!	%l6 = 0000000000000000, Mem[0000000010041400] = 00000000
	stba	%l6,[%i1+%g0]0x88	! Mem[0000000010041400] = 00000000
!	Mem[0000000010081410] = 0000ffff, %l2 = 00000000ffffffff
	swapa	[%i2+%o5]0x88,%l2	! %l2 = 000000000000ffff
!	Mem[0000000030101410] = 00000000, %l1 = ffffffffffffff38
	ldswa	[%i4+%o5]0x89,%l1	! %l1 = 0000000000000000
!	%l7 = 0000000000000000, Mem[0000000010101410] = ffff00ff
	stba	%l7,[%i4+%o5]0x80	! Mem[0000000010101410] = 00ff00ff
!	%l4 = 00000000, %l5 = 00000000, Mem[0000000030041400] = ff000000 0000ff00
	stda	%l4,[%i1+%g0]0x89	! Mem[0000000030041400] = 00000000 00000000
!	%f4  = 38ffffff 00000000, Mem[0000000010181430] = 696857c4 00ff0000, %asi = 80
	stda	%f4 ,[%i6+0x030]%asi	! Mem[0000000010181430] = 38ffffff 00000000
!	Mem[0000000010041408] = 000000ff, %l5 = 0000000000000000
	ldstuba	[%i1+%o4]0x80,%l5	! %l5 = 0000000000000000
!	%l7 = 0000000000000000, Mem[0000000010081400] = ffffff00
	stba	%l7,[%i2+%g0]0x80	! Mem[0000000010081400] = 00ffff00

p0_label_270:
!	Starting 10 instruction Load Burst
!	%f13 = 00000000, %f19 = ff0000ff, %f30 = 0000ff00
	fdivs	%f13,%f19,%f30		! %f30 = 80000000
!	%l3 = 00000000000000ff, %l0 = 0000000038ffffff, %y  = 00000000
	smul	%l3,%l0,%l4		! %l4 = 00000038c6ffff01, %y = 00000038
!	%l5 = 0000000000000000, %l0 = 0000000038ffffff, %y  = 00000038
	sdiv	%l5,%l0,%l2		! %l2 = 00000000000000fb
	mov	%l0,%y			! %y = 38ffffff
!	Mem[00000000201c0000] = 00ff56b0, %l7 = 0000000000000000
	ldsb	[%o0+%g0],%l7		! %l7 = 0000000000000000
!	Mem[00000000100c1408] = ffffffff, %l0 = 0000000038ffffff
	ldsha	[%i3+%o4]0x80,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000021800100] = ff399830, %l0 = ffffffffffffffff, %asi = 80
	lduba	[%o3+0x100]%asi,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010001410] = 000000ff, %l4 = 00000038c6ffff01, %asi = 80
	ldswa	[%i0+0x010]%asi,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030101400] = 00005c46, %l3 = 00000000000000ff
	ldswa	[%i4+%g0]0x81,%l3	! %l3 = 0000000000005c46
!	Mem[0000000030081400] = 00000000c4576869, %f30 = 80000000 000000ff
	ldda	[%i2+%g0]0x81,%f30	! %f30 = 00000000 c4576869
!	Mem[0000000010001408] = 000003ff, %l0 = 00000000000000ff
	ldsba	[%i0+%o4]0x88,%l0	! %l0 = ffffffffffffffff

p0_label_271:
!	Starting 10 instruction Store Burst
!	%l5 = 0000000000000000, immd = fffffffffffffcab, %l108 = 0000000000000001
	sdivx	%l5,-0x355,%l1		! %l1 = 0000000000000000
!	%l4 = 00000000000000ff, Mem[0000000030041400] = 00000000
	stba	%l4,[%i1+%g0]0x81	! Mem[0000000030041400] = ff000000
!	%l3 = 0000000000005c46, Mem[00000000100c1408] = ffffffff
	stba	%l3,[%i3+%o4]0x88	! Mem[00000000100c1408] = ffffff46
!	Mem[0000000030181408] = ff000000, %l0 = ffffffffffffffff
	ldstuba	[%i6+%o4]0x81,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010101408] = 50000000, %l1 = 0000000000000000
	swapa	[%i4+%o4]0x88,%l1	! %l1 = 0000000050000000
!	%f18 = 38ffffff ff0000ff, %l2 = 00000000000000fb
!	Mem[0000000030001400] = 000000ff000000ff
	stda	%f18,[%i0+%l2]ASI_PST32_S ! Mem[0000000030001400] = 38ffffffff0000ff
!	%l3 = 0000000000005c46, Mem[0000000010041410] = 00000000ffffffff
	stx	%l3,[%i1+%o5]		! Mem[0000000010041410] = 0000000000005c46
!	%l6 = 00000000, %l7 = 00000000, Mem[0000000010141410] = 00ffff7f ffffffff
	stda	%l6,[%i5+%o5]0x80	! Mem[0000000010141410] = 00000000 00000000
!	%f30 = 00000000 c4576869, Mem[0000000010081408] = 00000000 00000000
	stda	%f30,[%i2+%o4]0x80	! Mem[0000000010081408] = 00000000 c4576869
!	%f18 = 38ffffff ff0000ff, Mem[0000000030181400] = 00000000 005c9153
	stda	%f18,[%i6+%g0]0x89	! Mem[0000000030181400] = 38ffffff ff0000ff

p0_label_272:
!	Starting 10 instruction Load Burst
!	Mem[0000000030101410] = 00000000, %l7 = 0000000000000000
	ldswa	[%i4+%o5]0x89,%l7	! %l7 = 0000000000000000
!	Mem[00000000201c0000] = 00ff56b0, %l6 = 0000000000000000
	ldsb	[%o0+%g0],%l6		! %l6 = 0000000000000000
!	Mem[0000000010081408] = 00000000, %l0 = 00000000000000ff
	lduwa	[%i2+%o4]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000030181410] = ff0000c4, %l0 = 0000000000000000
	lduwa	[%i6+%o5]0x81,%l0	! %l0 = 00000000ff0000c4
!	Mem[0000000030041410] = 000000ffffffff38, %f2  = 38ffffff ff000000
	ldda	[%i1+%o5]0x89,%f2 	! %f2  = 000000ff ffffff38
!	Mem[0000000010101408] = 00000000, %l0 = 00000000ff0000c4
	lduha	[%i4+%o4]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000030101400] = 00005c46, %l7 = 0000000000000000
	lduba	[%i4+%g0]0x81,%l7	! %l7 = 0000000000000000
!	Mem[00000000300c1410] = ffffffffffff0000, %f24 = 00000000 000003c4
	ldda	[%i3+%o5]0x81,%f24	! %f24 = ffffffff ffff0000
!	Mem[0000000010001400] = 00000000, %l3 = 0000000000005c46
	ldsba	[%i0+%g0]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000010141408] = 0000feff, %f17 = 00000000
	lda	[%i5+%o4]0x88,%f17	! %f17 = 0000feff

p0_label_273:
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1408] = 00000000, %l5 = 0000000000000000
	swapa	[%i3+%o4]0x89,%l5	! %l5 = 0000000000000000
!	Mem[00000000211c0001] = ffff4d40, %l5 = 0000000000000000
	ldstuba	[%o2+0x001]%asi,%l5	! %l5 = 00000000000000ff
!	%l7 = 0000000000000000, Mem[0000000030041408] = 00000000
	stha	%l7,[%i1+%o4]0x81	! Mem[0000000030041408] = 00000000
!	%l4 = 000000ff, %l5 = 000000ff, Mem[0000000010001430] = 696857c4 00000000
	std	%l4,[%i0+0x030]		! Mem[0000000010001430] = 000000ff 000000ff
!	%f2  = 000000ff, Mem[0000000010041408] = ff0000ff
	sta	%f2 ,[%i1+%o4]0x80	! Mem[0000000010041408] = 000000ff
!	%l1 = 0000000050000000, Mem[0000000030041400] = 00000000000000ff
	stxa	%l1,[%i1+%g0]0x89	! Mem[0000000030041400] = 0000000050000000
!	%l1 = 0000000050000000, Mem[0000000030001410] = ff000000
	stha	%l1,[%i0+%o5]0x81	! Mem[0000000030001410] = 00000000
!	%f1  = 465c0000, Mem[0000000030001400] = 38ffffff
	sta	%f1 ,[%i0+%g0]0x81	! Mem[0000000030001400] = 465c0000
!	Mem[0000000030001410] = 00000000, %l5 = 00000000000000ff
	ldstuba	[%i0+%o5]0x89,%l5	! %l5 = 0000000000000000
!	%f23 = ffffff7f, Mem[00000000100c1400] = ffffffff
	sta	%f23,[%i3+%g0]0x80	! Mem[00000000100c1400] = ffffff7f

p0_label_274:
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = 50000000, %l7 = 0000000000000000
	ldsha	[%i1+%g0]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000020800040] = ffff7f10, %l6 = 0000000000000000
	ldsh	[%o1+0x040],%l6		! %l6 = ffffffffffffffff
!	Mem[0000000030001410] = ff00000089ff5cff, %f30 = 00000000 c4576869
	ldda	[%i0+%o5]0x81,%f30	! %f30 = ff000000 89ff5cff
!	Mem[0000000010141420] = 39ff0000, %f21 = 00000000
	lda	[%i5+0x020]%asi,%f21	! %f21 = 39ff0000
!	Mem[0000000010081420] = fffcc3ff, %f28 = 696857c4
	lda	[%i2+0x020]%asi,%f28	! %f28 = fffcc3ff
!	Mem[0000000010041438] = 000000ff, %f25 = ffff0000
	ld	[%i1+0x038],%f25	! %f25 = 000000ff
!	Mem[00000000100c1410] = 000000ff, %l6 = ffffffffffffffff
	ldsha	[%i3+%o5]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010081400] = 00ffff00 ff000000, %l0 = 00000000, %l1 = 50000000
	ldd	[%i2+%g0],%l0		! %l0 = 0000000000ffff00 00000000ff000000
!	%f3  = ffffff38, %f2  = 000000ff
	fcmps	%fcc0,%f3 ,%f2 		! %fcc0 = 3
!	Mem[0000000030001410] = ff5cff89 000000ff, %l4 = 000000ff, %l5 = 00000000
	ldda	[%i0+%o5]0x89,%l4	! %l4 = 00000000000000ff 00000000ff5cff89

p0_label_275:
!	Starting 10 instruction Store Burst
!	%l5 = 00000000ff5cff89, Mem[00000000211c0001] = ffff4d40
	stb	%l5,[%o2+0x001]		! Mem[00000000211c0000] = ff894d40
!	Mem[0000000010001406] = 00000000, %l4 = 00000000000000ff
	ldstub	[%i0+0x006],%l4		! %l4 = 0000000000000000
!	Mem[0000000010141408] = fffe0000, %l0 = 0000000000ffff00
	ldstuba	[%i5+%o4]0x80,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030101408] = 00000000, %l4 = 0000000000000000
	swapa	[%i4+%o4]0x81,%l4	! %l4 = 0000000000000000
!	%l5 = 00000000ff5cff89, Mem[0000000030181408] = ff000000
	stba	%l5,[%i6+%o4]0x81	! Mem[0000000030181408] = 89000000
!	%l4 = 0000000000000000, Mem[0000000010101400] = 00000000
	stwa	%l4,[%i4+%g0]0x88	! Mem[0000000010101400] = 00000000
!	Mem[0000000030141400] = 0000ffff, %l5 = 00000000ff5cff89
	swapa	[%i5+%g0]0x89,%l5	! %l5 = 000000000000ffff
!	Mem[0000000010141408] = fffe000000000000, %l1 = 00000000ff000000, %l0 = 00000000000000ff
	add	%i5,0x08,%g1
	casxa	[%g1]0x80,%l1,%l0	! %l0 = fffe000000000000
!	%l6 = 000000ff, %l7 = 00000000, Mem[0000000010081400] = 00ffff00 ff000000, %asi = 80
	stda	%l6,[%i2+0x000]%asi	! Mem[0000000010081400] = 000000ff 00000000
!	%f28 = fffcc3ff, Mem[00000000300c1410] = ffffffff
	sta	%f28,[%i3+%o5]0x89	! Mem[00000000300c1410] = fffcc3ff

p0_label_276:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = 00000000, %l6 = 00000000000000ff
	lduba	[%i5+%o5]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000010101415] = 000000ff, %l4 = 0000000000000000
	ldub	[%i4+0x015],%l4		! %l4 = 0000000000000000
!	Mem[0000000030101408] = 00000000, %l4 = 0000000000000000
	lduwa	[%i4+%o4]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000030001408] = 000000ff, %l6 = 0000000000000000
	lduwa	[%i0+%o4]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010081410] = ffffffff, %f21 = 39ff0000
	lda	[%i2+%o5]0x80,%f21	! %f21 = ffffffff
!	%f15 = 7fffff00, Mem[00000000300c1408] = 00000000
	sta	%f15,[%i3+%o4]0x89	! Mem[00000000300c1408] = 7fffff00
!	Mem[00000000100c1431] = 00000000, %l2 = 00000000000000fb
	ldub	[%i3+0x031],%l2		! %l2 = 0000000000000000
!	Code Fragment 3, seed = 419150
p0_fragment_33:
!	%l0 = fffe000000000000
	setx	0xb86a124c43f0fbb6,%g7,%l0 ! %l0 = b86a124c43f0fbb6
!	%l1 = 00000000ff000000
	setx	0x2374a8dc91931ae1,%g7,%l1 ! %l1 = 2374a8dc91931ae1
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = b86a124c43f0fbb6
	setx	0x652afac5af6aae1c,%g7,%l0 ! %l0 = 652afac5af6aae1c
!	%l1 = 2374a8dc91931ae1
	setx	0xf4e5b51aeb9ab867,%g7,%l1 ! %l1 = f4e5b51aeb9ab867
p0_fragment_33_end:
!	%l3 = 0000000000000000, %l5 = 000000000000ffff, %y  = 38ffffff
	udiv	%l3,%l5,%l5		! %l5 = 00000000ffffffff
	mov	%l0,%y			! %y = af6aae1c
!	Mem[0000000010081418] = 2a039126000050d7, %l7 = 0000000000000000, %asi = 80
	ldxa	[%i2+0x018]%asi,%l7	! %l7 = 2a039126000050d7

p0_label_277:
!	Starting 10 instruction Store Burst
!	%f0  = ffffff38 465c0000, Mem[00000000100c1410] = ff000000 696857c4, %asi = 80
	stda	%f0 ,[%i3+0x010]%asi	! Mem[00000000100c1410] = ffffff38 465c0000
!	%l2 = 00000000, %l3 = 00000000, Mem[0000000030141400] = ff5cff89 00000000
	stda	%l2,[%i5+%g0]0x89	! Mem[0000000030141400] = 00000000 00000000
!	%l2 = 0000000000000000, Mem[0000000010141410] = 00000000
	stba	%l2,[%i5+%o5]0x80	! Mem[0000000010141410] = 00000000
!	%l4 = 00000000, %l5 = ffffffff, Mem[00000000100c1410] = ffffff38 465c0000
	stda	%l4,[%i3+%o5]0x80	! Mem[00000000100c1410] = 00000000 ffffffff
!	%l2 = 00000000, %l3 = 00000000, Mem[0000000010141408] = fffe0000 00000000, %asi = 80
	stda	%l2,[%i5+0x008]%asi	! Mem[0000000010141408] = 00000000 00000000
!	%f20 = ff000000 ffffffff, Mem[0000000010001408] = 000003ff 00000039
	stda	%f20,[%i0+%o4]0x88	! Mem[0000000010001408] = ff000000 ffffffff
!	%l2 = 0000000000000000, Mem[0000000010141400] = ff000000
	stwa	%l2,[%i5+%g0]0x80	! Mem[0000000010141400] = 00000000
!	%l2 = 0000000000000000, %l2 = 0000000000000000, %l3 = 0000000000000000
	sdivx	%l2,%l2,%l3		! Div by zero, %l0 = 652afac5af6aae44
!	Mem[0000000010041428] = 7dd9efff, %l4 = 0000000000000000
	swap	[%i1+0x028],%l4		! %l4 = 000000007dd9efff
!	%f12 = 00000000 00000000, Mem[0000000010041410] = 00000000 465c0000
	stda	%f12,[%i1+%o5]0x88	! Mem[0000000010041410] = 00000000 00000000

p0_label_278:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = 0000000000000000, %l3 = 0000000000000000
	ldxa	[%i6+%o4]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000030101410] = 00000000, %l0 = 652afac5af6aae44
	ldsha	[%i4+%o5]0x81,%l0	! %l0 = 0000000000000000
!	%l1 = f4e5b51aeb9ab867, imm = 0000000000000b6f, %l7 = 2a039126000050d7
	xor	%l1,0xb6f,%l7		! %l7 = f4e5b51aeb9ab308
!	Mem[00000000201c0001] = 00ff56b0, %l2 = 0000000000000000
	ldub	[%o0+0x001],%l2		! %l2 = 00000000000000ff
!	Mem[00000000211c0000] = ff894d40, %l1 = f4e5b51aeb9ab867, %asi = 80
	ldsha	[%o2+0x000]%asi,%l1	! %l1 = ffffffffffffff89
!	Mem[0000000010081404] = 00000000, %l4 = 000000007dd9efff, %asi = 80
	ldsha	[%i2+0x004]%asi,%l4	! %l4 = 0000000000000000
!	Mem[0000000030001408] = ff000000, %f21 = ffffffff
	lda	[%i0+%o4]0x81,%f21	! %f21 = ff000000
!	Mem[00000000100c1408] = ffffff46, %l0 = 0000000000000000
	ldsba	[%i3+%o4]0x88,%l0	! %l0 = 0000000000000046
!	Mem[0000000030081408] = ffffff38, %l4 = 0000000000000000
	lduba	[%i2+%o4]0x89,%l4	! %l4 = 0000000000000038
!	Mem[0000000030181410] = f6000000 c40000ff, %l2 = 000000ff, %l3 = 00000000
	ldda	[%i6+%o5]0x89,%l2	! %l2 = 00000000c40000ff 00000000f6000000

p0_label_279:
!	Starting 10 instruction Store Burst
!	%f12 = 00000000, Mem[00000000300c1400] = ffffffff
	sta	%f12,[%i3+%g0]0x89	! Mem[00000000300c1400] = 00000000
!	%f16 = ff000000 0000feff, %l3 = 00000000f6000000
!	Mem[0000000010001410] = 000000ffffffff38
	add	%i0,0x010,%g1
	stda	%f16,[%g1+%l3]ASI_PST32_PL ! Mem[0000000010001410] = 000000ffffffff38
!	%f21 = ff000000, Mem[0000000010041400] = 00000000
	sta	%f21,[%i1+%g0]0x88	! Mem[0000000010041400] = ff000000
!	%l0 = 0000000000000046, Mem[0000000010041410] = 00000000
	stwa	%l0,[%i1+%o5]0x80	! Mem[0000000010041410] = 00000046
!	%l6 = 000000ff, %l7 = eb9ab308, Mem[0000000010041400] = 000000ff f6efd97d
	stda	%l6,[%i1+%g0]0x80	! Mem[0000000010041400] = 000000ff eb9ab308
!	%f30 = ff000000, Mem[00000000300c1410] = ffc3fcff
	sta	%f30,[%i3+%o5]0x81	! Mem[00000000300c1410] = ff000000
!	%l7 = f4e5b51aeb9ab308, Mem[0000000030101408] = 00000000
	stha	%l7,[%i4+%o4]0x81	! Mem[0000000030101408] = b3080000
!	%f14 = 7fffff00 7fffff00, %l6 = 00000000000000ff
!	Mem[0000000030041428] = 0000000000000000
	add	%i1,0x028,%g1
	stda	%f14,[%g1+%l6]ASI_PST32_S ! Mem[0000000030041428] = 7fffff007fffff00
!	%l6 = 000000ff, %l7 = eb9ab308, Mem[0000000030181400] = ff0000ff ffffff38
	stda	%l6,[%i6+%g0]0x81	! Mem[0000000030181400] = 000000ff eb9ab308
!	Mem[0000000030181400] = 000000ff, %l6 = 00000000000000ff
	ldstuba	[%i6+%g0]0x81,%l6	! %l6 = 0000000000000000

p0_label_280:
!	Starting 10 instruction Load Burst
!	Mem[0000000030101410] = 00000000, %l6 = 0000000000000000
	ldsba	[%i4+%o5]0x89,%l6	! %l6 = 0000000000000000
!	Mem[00000000100c1420] = 00000000 0000ff62, %l4 = 00000038, %l5 = ffffffff, %asi = 80
	ldda	[%i3+0x020]%asi,%l4	! %l4 = 0000000000000000 000000000000ff62
!	Mem[00000000300c1400] = 00000000, %l7 = f4e5b51aeb9ab308
	lduha	[%i3+%g0]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000030181400] = ff0000ff, %l4 = 0000000000000000
	ldsha	[%i6+%g0]0x81,%l4	! %l4 = ffffffffffffff00
	membar	#Sync			! Added by membar checker (54)
!	Mem[00000000300c1400] = 00000000 00000000 00ffff7f 000000ff
!	Mem[00000000300c1410] = ff000000 ffff0000 13d17938 eac6fb48
!	Mem[00000000300c1420] = 29b68648 7bd47808 ff00780d 00ef007d
!	Mem[00000000300c1430] = 25a83dc4 07a95c45 8b7a2f3c 3cb98a40
	ldda	[%i3+%g0]ASI_BLK_AIUS,%f0 	! Block Load from 00000000300c1400
!	Mem[0000000030181410] = ff0000c4, %l1 = ffffffffffffff89
	lduwa	[%i6+%o5]0x81,%l1	! %l1 = 00000000ff0000c4
!	Mem[0000000010081400] = 000000ff, %f19 = ff0000ff
	lda	[%i2+%g0]0x80,%f19	! %f19 = 000000ff
!	%f31 = 89ff5cff, %f20 = ff000000, %f21 = ff000000
	fdivs	%f31,%f20,%f21		! %f21 = 00000000
!	Mem[0000000010081408] = 00000000, %l5 = 000000000000ff62
	lduha	[%i2+%o4]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000010181408] = 00000000, %l4 = ffffffffffffff00
	lduba	[%i6+%o4]0x88,%l4	! %l4 = 0000000000000000

p0_label_281:
!	Starting 10 instruction Store Burst
!	%l5 = 0000000000000000, Mem[0000000010141410] = 00000000
	stwa	%l5,[%i5+%o5]0x88	! Mem[0000000010141410] = 00000000
!	Mem[0000000010101408] = 00000000, %l4 = 0000000000000000
	swapa	[%i4+%o4]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000030101408] = b3080000, %l2 = 00000000c40000ff
	swapa	[%i4+%o4]0x81,%l2	! %l2 = 00000000b3080000
!	%l3 = 00000000f6000000, Mem[0000000010141438] = 00000069c76c120d, %asi = 80
	stxa	%l3,[%i5+0x038]%asi	! Mem[0000000010141438] = 00000000f6000000
!	%f22 = 00000000 ffffff7f, Mem[0000000010141418] = 53915c46 000000ff
	std	%f22,[%i5+0x018]	! Mem[0000000010141418] = 00000000 ffffff7f
!	Mem[00000000300c1410] = 000000ff, %l4 = 0000000000000000
	swapa	[%i3+%o5]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010081408] = 00000000, %l4 = 00000000000000ff
	swapa	[%i2+%o4]0x88,%l4	! %l4 = 0000000000000000
!	%l0 = 00000046, %l1 = ff0000c4, Mem[0000000030141410] = ff0000ff ffffff38
	stda	%l0,[%i5+%o5]0x81	! Mem[0000000030141410] = 00000046 ff0000c4
!	Mem[0000000010001410] = 000000ff, %l2 = 00000000b3080000
	swapa	[%i0+%o5]0x80,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010041410] = 00000046, %l5 = 0000000000000000, %asi = 80
	swapa	[%i1+0x010]%asi,%l5	! %l5 = 0000000000000046

p0_label_282:
!	Starting 10 instruction Load Burst
!	Code Fragment 4, seed = 639029
p0_fragment_34:
!	%l0 = 0000000000000046
	setx	0x3b1ce46e89c8bb7e,%g7,%l0 ! %l0 = 3b1ce46e89c8bb7e
!	%l1 = 00000000ff0000c4
	setx	0x3db343429ab07029,%g7,%l1 ! %l1 = 3db343429ab07029
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 3b1ce46e89c8bb7e
	setx	0x430307d9b8a7a0e4,%g7,%l0 ! %l0 = 430307d9b8a7a0e4
!	%l1 = 3db343429ab07029
	setx	0x5614cd972952d0af,%g7,%l1 ! %l1 = 5614cd972952d0af
p0_fragment_34_end:
!	Mem[0000000030141408] = ffffff00, %f28 = fffcc3ff
	lda	[%i5+%o4]0x89,%f28	! %f28 = ffffff00
!	Mem[000000001010143a] = 00000000, %l0 = 430307d9b8a7a0e4
	lduh	[%i4+0x03a],%l0		! %l0 = 0000000000000000
!	Mem[0000000030141410] = 00000046, %l7 = 0000000000000000
	lduwa	[%i5+%o5]0x81,%l7	! %l7 = 0000000000000046
!	Mem[0000000010101410] = 00ff00ff, %l4 = 0000000000000000
	lduha	[%i4+%o5]0x80,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010041410] = 00000000, %l6 = 0000000000000000
	ldsha	[%i1+%o5]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000030041400] = 00000050, %l1 = 5614cd972952d0af
	lduha	[%i1+%g0]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000010181408] = 00000000, %l4 = 00000000000000ff
	lduba	[%i6+%o4]0x88,%l4	! %l4 = 0000000000000000
!	Mem[000000001000141e] = ffffff7f, %l7 = 0000000000000046
	ldsb	[%i0+0x01e],%l7		! %l7 = ffffffffffffffff
!	Mem[0000000010041410] = 0000000000000000, %l4 = 0000000000000000
	ldxa	[%i1+%o5]0x88,%l4	! %l4 = 0000000000000000

p0_label_283:
!	Starting 10 instruction Store Burst
!	Mem[0000000010101410] = ff00ff00, %l7 = 00000000ffffffff
	swapa	[%i4+%o5]0x88,%l7	! %l7 = 00000000ff00ff00
!	%l1 = 0000000000000000, %l3 = 00000000f6000000, %y  = af6aae1c
	udiv	%l1,%l3,%l2		! %l2 = 00000000b68c27a8
	mov	%l0,%y			! %y = 00000000
	membar	#Sync			! Added by membar checker (55)
!	%f12 = 25a83dc4, Mem[00000000300c1408] = 00ffff7f
	sta	%f12,[%i3+%o4]0x81	! Mem[00000000300c1408] = 25a83dc4
!	%l3 = 00000000f6000000, imm = 0000000000000c1f, %l6 = 0000000000000000
	andn	%l3,0xc1f,%l6		! %l6 = 00000000f6000000
!	%l5 = 0000000000000046, Mem[0000000010001400] = 00ff000000000000
	stxa	%l5,[%i0+%g0]0x88	! Mem[0000000010001400] = 0000000000000046
!	%l4 = 0000000000000000, Mem[0000000030181410] = ff0000c4000000f6
	stxa	%l4,[%i6+%o5]0x81	! Mem[0000000030181410] = 0000000000000000
!	%l6 = 00000000f6000000, Mem[0000000010101410] = ff000000ffffffff
	stxa	%l6,[%i4+%o5]0x88	! Mem[0000000010101410] = 00000000f6000000
!	Mem[000000001008143c] = 00000000, %l7 = ff00ff00, %l3 = f6000000
	add	%i2,0x3c,%g1
	casa	[%g1]0x80,%l7,%l3	! %l3 = 0000000000000000
!	Mem[00000000100c1424] = 0000ff62, %l0 = 0000000000000000
	ldstub	[%i3+0x024],%l0		! %l0 = 0000000000000000
!	%l4 = 00000000, %l5 = 00000046, Mem[0000000010141410] = 00000000 00000000
	stda	%l4,[%i5+%o5]0x88	! Mem[0000000010141410] = 00000000 00000046

p0_label_284:
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = ffffff38, %l5 = 0000000000000046
	lduba	[%i2+%o4]0x89,%l5	! %l5 = 0000000000000038
!	Mem[0000000010181400] = ff0000002a8cc541, %f22 = 00000000 ffffff7f
	ldda	[%i6+%g0]0x80,%f22	! %f22 = ff000000 2a8cc541
!	Mem[0000000010081410] = ffffffff, %l2 = 00000000b68c27a8
	lduha	[%i2+%o5]0x80,%l2	! %l2 = 000000000000ffff
!	Mem[0000000010141420] = 39ff0000000003c4, %f24 = ffffffff 000000ff, %asi = 80
	ldda	[%i5+0x020]%asi,%f24	! %f24 = 39ff0000 000003c4
!	Mem[0000000030081410] = ff00ff00, %l1 = 0000000000000000
	ldswa	[%i2+%o5]0x81,%l1	! %l1 = ffffffffff00ff00
!	Mem[0000000030081410] = ff00ff00, %f10 = ff00780d
	lda	[%i2+%o5]0x81,%f10	! %f10 = ff00ff00
!	Mem[0000000021800100] = ff399830, %l4 = 0000000000000000
	lduh	[%o3+0x100],%l4		! %l4 = 000000000000ff39
!	Mem[0000000030181410] = 00000000, %l0 = 0000000000000000
	lduba	[%i6+%o5]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000010081400] = 000000ff 00000000 ff000000 c4576869
!	Mem[0000000010081410] = ffffffff 6968571c 2a039126 000050d7
!	Mem[0000000010081420] = fffcc3ff 1c576869 000003c4 7569f2ff
!	Mem[0000000010081430] = 2e43aea4 00006400 cb62e463 00000000
	ldda	[%i2+%g0]ASI_BLK_AIUP,%f16	! Block Load from 0000000010081400
!	Mem[0000000030141400] = 00000000, %l3 = 0000000000000000
	lduha	[%i5+%g0]0x81,%l3	! %l3 = 0000000000000000

p0_label_285:
!	Starting 10 instruction Store Burst
!	%f18 = ff000000, Mem[0000000010101418] = 7fffff03
	sta	%f18,[%i4+0x018]%asi	! Mem[0000000010101418] = ff000000
!	Mem[0000000010181410] = ffff0000, %l4 = 000000000000ff39
	swapa	[%i6+%o5]0x80,%l4	! %l4 = 00000000ffff0000
!	Mem[0000000030101410] = 00000000, %l6 = 00000000f6000000
	swapa	[%i4+%o5]0x89,%l6	! %l6 = 0000000000000000
!	%l5 = 0000000000000038, Mem[0000000020800000] = ff002ce0, %asi = 80
	stba	%l5,[%o1+0x000]%asi	! Mem[0000000020800000] = 38002ce0
!	%l2 = 000000000000ffff, Mem[0000000010141400] = 00000000
	stha	%l2,[%i5+%g0]0x80	! Mem[0000000010141400] = ffff0000
!	%l0 = 00000000, %l1 = ff00ff00, Mem[0000000010141400] = ffff0000 000000ff
	stda	%l0,[%i5+%g0]0x80	! Mem[0000000010141400] = 00000000 ff00ff00
!	Mem[0000000010041400] = 000000ff eb9ab308 000000ff 03ffffff
!	%f16 = 000000ff 00000000 ff000000 c4576869
!	%f20 = ffffffff 6968571c 2a039126 000050d7
!	%f24 = fffcc3ff 1c576869 000003c4 7569f2ff
!	%f28 = 2e43aea4 00006400 cb62e463 00000000
	stda	%f16,[%i1+%g0]ASI_BLK_AIUP	! Block Store to 0000000010041400
!	%f12 = 25a83dc4 07a95c45, Mem[00000000100c1410] = 00000000 ffffffff
	stda	%f12,[%i3+%o5]0x88	! Mem[00000000100c1410] = 25a83dc4 07a95c45
!	%f25 = 1c576869, Mem[0000000010041410] = ffffffff
	sta	%f25,[%i1+%o5]0x80	! Mem[0000000010041410] = 1c576869
	membar	#Sync			! Added by membar checker (56)
!	%l7 = 00000000ff00ff00, Mem[0000000010081408] = 000000ff
	stba	%l7,[%i2+%o4]0x88	! Mem[0000000010081408] = 00000000

p0_label_286:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = 455ca907, %l3 = 0000000000000000
	lduwa	[%i3+%o5]0x80,%l3	! %l3 = 00000000455ca907
!	Mem[0000000030081400] = 00000000, %l1 = ffffffffff00ff00
	ldsha	[%i2+%g0]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000010141414] = 46000000, %l7 = 00000000ff00ff00
	ldub	[%i5+0x014],%l7		! %l7 = 0000000000000046
!	Mem[00000000100c1400] = 7fffffff, %l3 = 00000000455ca907
	ldsha	[%i3+%g0]0x88,%l3	! %l3 = ffffffffffffffff
!	%f31 = 00000000, %f22 = 2a039126
	fcmpes	%fcc1,%f31,%f22		! %fcc1 = 1
!	Mem[0000000030141408] = ffffff00, %f2  = 00ffff7f
	lda	[%i5+%o4]0x89,%f2 	! %f2 = ffffff00
!	Mem[0000000010081410] = ffffffff6968571c, %l7 = 0000000000000046
	ldxa	[%i2+%o5]0x80,%l7	! %l7 = ffffffff6968571c
!	Mem[0000000030001408] = ff000000, %l1 = 0000000000000000
	lduwa	[%i0+%o4]0x81,%l1	! %l1 = 00000000ff000000
!	Mem[0000000010081400] = 000000ff 00000000, %l0 = 00000000, %l1 = ff000000
	ldda	[%i2+%g0]0x80,%l0	! %l0 = 00000000000000ff 0000000000000000
!	Mem[00000000100c1430] = 00000000, %l2 = 000000000000ffff
	ldub	[%i3+0x030],%l2		! %l2 = 0000000000000000

p0_label_287:
!	Starting 10 instruction Store Burst
!	%l4 = 00000000ffff0000, Mem[0000000010081408] = 00000000
	stwa	%l4,[%i2+%o4]0x80	! Mem[0000000010081408] = ffff0000
!	Mem[0000000010181408] = 00000000, %l2 = 0000000000000000
	ldstuba	[%i6+%o4]0x80,%l2	! %l2 = 0000000000000000
!	%l7 = ffffffff6968571c, Mem[00000000300c1410] = 0000ffff00000000
	stxa	%l7,[%i3+%o5]0x89	! Mem[00000000300c1410] = ffffffff6968571c
!	%f20 = ffffffff, Mem[00000000300c1410] = 6968571c
	sta	%f20,[%i3+%o5]0x89	! Mem[00000000300c1410] = ffffffff
!	Mem[0000000010141410] = 00000000, %l1 = 0000000000000000
	swapa	[%i5+%o5]0x88,%l1	! %l1 = 0000000000000000
!	%f13 = 07a95c45, Mem[0000000030141400] = 00000000
	sta	%f13,[%i5+%g0]0x89	! Mem[0000000030141400] = 07a95c45
!	%l7 = ffffffff6968571c, Mem[0000000010181410] = 39ff0000
	stha	%l7,[%i6+%o5]0x88	! Mem[0000000010181410] = 39ff571c
!	%f8  = 29b68648 7bd47808, Mem[0000000030101400] = 465c0000 00000000
	stda	%f8 ,[%i4+%g0]0x89	! Mem[0000000030101400] = 29b68648 7bd47808
!	Mem[0000000010081428] = 000003c4, %l6 = 0000000000000000, %asi = 80
	swapa	[%i2+0x028]%asi,%l6	! %l6 = 00000000000003c4
!	%l1 = 0000000000000000, Mem[0000000010001408] = ffffffff
	stba	%l1,[%i0+%o4]0x80	! Mem[0000000010001408] = 00ffffff

p0_label_288:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = 0000000000000000, %f18 = ff000000 c4576869
	ldda	[%i5+%o4]0x88,%f18	! %f18 = 00000000 00000000
!	Mem[00000000300c1410] = ffffffff, %l7 = ffffffff6968571c
	lduha	[%i3+%o5]0x81,%l7	! %l7 = 000000000000ffff
!	Mem[0000000010141400] = 00000000, %l3 = ffffffffffffffff
	ldsba	[%i5+%g0]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000030101408] = ff0000c4, %l6 = 00000000000003c4
	ldsba	[%i4+%o4]0x89,%l6	! %l6 = ffffffffffffffc4
!	Mem[0000000010181410] = 1c57ff39, %l6 = ffffffffffffffc4
	lduba	[%i6+%o5]0x80,%l6	! %l6 = 000000000000001c
!	Mem[0000000010081410] = ffffffff, %l6 = 000000000000001c
	ldswa	[%i2+%o5]0x88,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000030141408] = 00ffffff, %l7 = 000000000000ffff
	ldsha	[%i5+%o4]0x81,%l7	! %l7 = 00000000000000ff
!	Mem[0000000020800040] = ffff7f10, %l3 = 0000000000000000, %asi = 80
	lduba	[%o1+0x040]%asi,%l3	! %l3 = 00000000000000ff
!	%l2 = 00000000, %l3 = 000000ff, Mem[0000000030141410] = 46000000 c40000ff
	stda	%l2,[%i5+%o5]0x89	! Mem[0000000030141410] = 00000000 000000ff
!	Mem[0000000010001408] = ff000000ffffff00, %l3 = 00000000000000ff
	ldxa	[%i0+%o4]0x88,%l3	! %l3 = ff000000ffffff00

p0_label_289:
!	Starting 10 instruction Store Burst
!	Mem[000000001008141d] = 000050d7, %l2 = 0000000000000000
	ldstub	[%i2+0x01d],%l2		! %l2 = 0000000000000000
!	Mem[0000000010041410] = 1c576869, %l6 = 00000000ffffffff
	swapa	[%i1+%o5]0x80,%l6	! %l6 = 000000001c576869
!	%l0 = 00000000000000ff, Mem[0000000010141400] = 00000000ff00ff00
	stxa	%l0,[%i5+%g0]0x80	! Mem[0000000010141400] = 00000000000000ff
!	%f20 = ffffffff 6968571c, %l5 = 0000000000000038
!	Mem[0000000030181410] = 0000000000000000
	add	%i6,0x010,%g1
	stda	%f20,[%g1+%l5]ASI_PST8_S ! Mem[0000000030181410] = 0000ffff69000000
!	%l4 = 00000000ffff0000, Mem[0000000010081408] = ffff0000c4576869
	stxa	%l4,[%i2+%o4]0x80	! Mem[0000000010081408] = 00000000ffff0000
!	Mem[0000000010081437] = 00006400, %l1 = 0000000000000000
	ldstuba	[%i2+0x037]%asi,%l1	! %l1 = 0000000000000000
!	%l0 = 000000ff, %l1 = 00000000, Mem[0000000010101410] = f6000000 00000000
	stda	%l0,[%i4+%o5]0x88	! Mem[0000000010101410] = 000000ff 00000000
!	%l2 = 0000000000000000, Mem[0000000021800101] = ff399830, %asi = 80
	stba	%l2,[%o3+0x101]%asi	! Mem[0000000021800100] = ff009830
!	Mem[00000000201c0001] = 00ff56b0, %l3 = ff000000ffffff00
	ldstub	[%o0+0x001],%l3		! %l3 = 00000000000000ff
!	%l4 = 00000000ffff0000, Mem[00000000300c1408] = 25a83dc4
	stwa	%l4,[%i3+%o4]0x81	! Mem[00000000300c1408] = ffff0000

p0_label_290:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = 25a83dc407a95c45, %f2  = ffffff00 000000ff
	ldda	[%i3+%o5]0x88,%f2 	! %f2  = 25a83dc4 07a95c45
!	%l4 = 00000000ffff0000, immd = 00000000000007f9, %l5  = 0000000000000038
	mulx	%l4,0x7f9,%l5		! %l5 = 000007f8f8070000
!	Mem[0000000030081410] = 000001ff00ff00ff, %l4 = 00000000ffff0000
	ldxa	[%i2+%o5]0x89,%l4	! %l4 = 000001ff00ff00ff
!	Mem[0000000030141400] = 455ca907, %l0 = 00000000000000ff
	lduba	[%i5+%g0]0x81,%l0	! %l0 = 0000000000000045
!	Mem[000000001008143e] = 00000000, %l2 = 0000000000000000
	ldsh	[%i2+0x03e],%l2		! %l2 = 0000000000000000
!	Mem[0000000030001400] = 00005c46, %f9  = 7bd47808
	lda	[%i0+%g0]0x89,%f9 	! %f9 = 00005c46
!	Mem[0000000010181410] = 39ff571c, %l5 = 000007f8f8070000
	lduha	[%i6+%o5]0x88,%l5	! %l5 = 000000000000571c
!	Mem[0000000010101410] = ff000000, %l1 = 0000000000000000
	ldsba	[%i4+%o5]0x80,%l1	! %l1 = ffffffffffffffff
!	Mem[00000000100c1400] = 000000007fffffff, %l0 = 0000000000000045
	ldxa	[%i3+%g0]0x88,%l0	! %l0 = 000000007fffffff
!	Mem[0000000010101400] = 00000000 00000000, %l2 = 00000000, %l3 = 000000ff
	ldda	[%i4+%g0]0x88,%l2	! %l2 = 0000000000000000 0000000000000000

p0_label_291:
!	Starting 10 instruction Store Burst
!	Mem[0000000030041408] = 00000000, %l3 = 0000000000000000
	ldstuba	[%i1+%o4]0x89,%l3	! %l3 = 0000000000000000
!	%l0 = 7fffffff, %l1 = ffffffff, Mem[0000000010041408] = ff000000 c4576869, %asi = 80
	stda	%l0,[%i1+0x008]%asi	! Mem[0000000010041408] = 7fffffff ffffffff
!	%f8  = 29b68648 00005c46, Mem[0000000030041408] = ff000000 00000000
	stda	%f8 ,[%i1+%o4]0x81	! Mem[0000000030041408] = 29b68648 00005c46
!	Mem[0000000010081410] = ffffffff, %l5 = 000000000000571c
	swapa	[%i2+%o5]0x80,%l5	! %l5 = 00000000ffffffff
!	%l5 = 00000000ffffffff, Mem[0000000010081434] = 000064ff
	stw	%l5,[%i2+0x034]		! Mem[0000000010081434] = ffffffff
!	%f15 = 3cb98a40, Mem[0000000010101410] = 000000ff
	sta	%f15,[%i4+%o5]0x88	! Mem[0000000010101410] = 3cb98a40
!	Mem[0000000030041400] = 00000050, %l3 = 0000000000000000
	ldstuba	[%i1+%g0]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000010041408] = ffffff7f, %l7 = 00000000000000ff
	ldstuba	[%i1+%o4]0x88,%l7	! %l7 = 000000000000007f
!	%l7 = 000000000000007f, Mem[00000000300c1400] = 0000000000000000
	stxa	%l7,[%i3+%g0]0x89	! Mem[00000000300c1400] = 000000000000007f
!	Mem[0000000010101410] = 408ab93c, %l0 = 000000007fffffff
	swapa	[%i4+%o5]0x80,%l0	! %l0 = 00000000408ab93c

p0_label_292:
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = ffffffffffffff38, %l1 = ffffffffffffffff
	ldxa	[%i2+%o4]0x89,%l1	! %l1 = ffffffffffffff38
!	Mem[000000001018141e] = 6f3e780d, %l5 = 00000000ffffffff
	ldsb	[%i6+0x01e],%l5		! %l5 = 0000000000000078
!	Mem[0000000030181400] = ff0000ff, %f23 = 000050d7
	lda	[%i6+%g0]0x89,%f23	! %f23 = ff0000ff
!	Mem[0000000010041422] = fffcc3ff, %l6 = 000000001c576869
	ldsh	[%i1+0x022],%l6		! %l6 = ffffffffffffc3ff
!	Mem[0000000010141408] = 00000000, %f19 = 00000000
	lda	[%i5+%o4]0x80,%f19	! %f19 = 00000000
!	Mem[000000001008142c] = 7569f2ff, %l6 = ffffffffffffc3ff, %asi = 80
	lduwa	[%i2+0x02c]%asi,%l6	! %l6 = 000000007569f2ff
!	Mem[0000000010101400] = 00000000, %l1 = ffffffffffffff38
	lduha	[%i4+%g0]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000030041408] = 4886b629, %l2 = 0000000000000000
	ldswa	[%i1+%o4]0x89,%l2	! %l2 = 000000004886b629
!	Mem[0000000010141410] = 00000000, %l5 = 0000000000000078
	lduba	[%i5+%o5]0x88,%l5	! %l5 = 0000000000000000
!	Mem[00000000100c1410] = 25a83dc407a95c45, %l6 = 000000007569f2ff
	ldxa	[%i3+%o5]0x88,%l6	! %l6 = 25a83dc407a95c45

p0_label_293:
!	Starting 10 instruction Store Burst
!	%f2  = 25a83dc4 07a95c45, Mem[0000000010041410] = ffffffff 1c576869
	stda	%f2 ,[%i1+%o5]0x88	! Mem[0000000010041410] = 25a83dc4 07a95c45
!	Mem[0000000010041408] = ffffffff, %l3 = 0000000000000000
	ldstuba	[%i1+%o4]0x80,%l3	! %l3 = 00000000000000ff
!	Mem[00000000300c1410] = ffffffff, %l6 = 25a83dc407a95c45
	ldstuba	[%i3+%o5]0x81,%l6	! %l6 = 00000000000000ff
!	%l2 = 000000004886b629, Mem[00000000211c0000] = ff894d40, %asi = 80
	stba	%l2,[%o2+0x000]%asi	! Mem[00000000211c0000] = 29894d40
!	%f30 = cb62e463, %f7  = eac6fb48
	fcmps	%fcc3,%f30,%f7 		! %fcc3 = 2
!	Code Fragment 3, seed = 925645
p0_fragment_35:
!	%l0 = 00000000408ab93c
	setx	0xedc470eab710d6be,%g7,%l0 ! %l0 = edc470eab710d6be
!	%l1 = 0000000000000000
	setx	0x301bfc86fc0ea769,%g7,%l1 ! %l1 = 301bfc86fc0ea769
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = edc470eab710d6be
	setx	0x627b1e9261713424,%g7,%l0 ! %l0 = 627b1e9261713424
!	%l1 = 301bfc86fc0ea769
	setx	0xcee212b665d8ffef,%g7,%l1 ! %l1 = cee212b665d8ffef
p0_fragment_35_end:
!	%l6 = 00000000000000ff, Mem[00000000300c1408] = ffff0000
	stha	%l6,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00ff0000
!	%f12 = 25a83dc4, Mem[0000000010181408] = ff000000
	sta	%f12,[%i6+%o4]0x80	! Mem[0000000010181408] = 25a83dc4
!	%l5 = 0000000000000000, Mem[0000000030101408] = c40000ff
	stba	%l5,[%i4+%o4]0x81	! Mem[0000000030101408] = 000000ff
!	%f18 = 00000000 00000000, %l0 = 627b1e9261713424
!	Mem[0000000030141418] = 00000000000000ff
	add	%i5,0x018,%g1
	stda	%f18,[%g1+%l0]ASI_PST8_S ! Mem[0000000030141418] = 00000000000000ff

p0_label_294:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001428] = 000000f67569f2af, %f4  = ff000000 ffff0000, %asi = 80
	ldda	[%i0+0x028]%asi,%f4 	! %f4  = 000000f6 7569f2af
!	Mem[0000000010181424] = 00000000, %l6 = 00000000000000ff, %asi = 80
	lduwa	[%i6+0x024]%asi,%l6	! %l6 = 0000000000000000
!	Mem[0000000030101408] = ff000000 ff000000, %l4 = 00ff00ff, %l5 = 00000000
	ldda	[%i4+%o4]0x89,%l4	! %l4 = 00000000ff000000 00000000ff000000
!	Mem[00000000100c1438] = 2200000100000000, %l0 = 627b1e9261713424, %asi = 80
	ldxa	[%i3+0x038]%asi,%l0	! %l0 = 2200000100000000
!	%f31 = 00000000, %f5  = 7569f2af, %f24 = fffcc3ff
	fsubs	%f31,%f5 ,%f24		! %f24 = f569f2af
!	Mem[00000000300c1400] = 0000007f, %l7 = 000000000000007f
	ldsha	[%i3+%g0]0x89,%l7	! %l7 = 000000000000007f
!	Mem[0000000030101408] = ff000000, %f30 = cb62e463
	lda	[%i4+%o4]0x89,%f30	! %f30 = ff000000
!	Mem[00000000201c0000] = 00ff56b0, %l3 = 00000000000000ff
	lduh	[%o0+%g0],%l3		! %l3 = 00000000000000ff
!	Mem[0000000030041400] = 00000000500000ff, %f14 = 8b7a2f3c 3cb98a40
	ldda	[%i1+%g0]0x89,%f14	! %f14 = 00000000 500000ff
!	Mem[0000000020800000] = 38002ce0, %l4 = 00000000ff000000
	ldsb	[%o1+%g0],%l4		! %l4 = 0000000000000038

p0_label_295:
!	Starting 10 instruction Store Burst
!	Mem[000000001008141c] = 00ff50d7, %l1 = 65d8ffef, %l3 = 000000ff
	add	%i2,0x1c,%g1
	casa	[%g1]0x80,%l1,%l3	! %l3 = 0000000000ff50d7
!	Mem[0000000030181408] = 89000000, %l4 = 0000000000000038
	swapa	[%i6+%o4]0x81,%l4	! %l4 = 0000000089000000
!	%l4 = 0000000089000000, Mem[0000000010181400] = 41c58c2a000000ff
	stxa	%l4,[%i6+%g0]0x88	! Mem[0000000010181400] = 0000000089000000
!	Mem[0000000030101410] = 000000f6, %f1  = 00000000
	lda	[%i4+%o5]0x81,%f1 	! %f1 = 000000f6
!	%l1 = cee212b665d8ffef, %l1 = cee212b665d8ffef, %l2 = 000000004886b629
	andn	%l1,%l1,%l2		! %l2 = 0000000000000000
!	Mem[0000000030101408] = 000000ff, %l4 = 0000000089000000
	swapa	[%i4+%o4]0x81,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010141400] = 00000000, %l7 = 000000000000007f
	swapa	[%i5+%g0]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000010181400] = 00000089, %l1 = 0000000065d8ffef
	swapa	[%i6+%g0]0x80,%l1	! %l1 = 0000000000000089
!	%l4 = 00000000000000ff, Mem[0000000030001410] = ff000000
	stwa	%l4,[%i0+%o5]0x81	! Mem[0000000030001410] = 000000ff
!	Mem[00000000100c1408] = ffffff46, %l3 = 0000000000ff50d7
	ldsba	[%i3+%o4]0x88,%l3	! %l3 = 0000000000000046

p0_label_296:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = 00000000, %l3 = 0000000000000046
	lduwa	[%i2+%o4]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000010041408] = ffffffff ffffffff, %l2 = 00000000, %l3 = 00000000
	ldda	[%i1+%o4]0x80,%l2	! %l2 = 00000000ffffffff 00000000ffffffff
!	Mem[0000000030141410] = 000000ff 00000000, %l4 = 000000ff, %l5 = ff000000
	ldda	[%i5+%o5]0x89,%l4	! %l4 = 0000000000000000 00000000000000ff
!	Mem[0000000030141408] = 00ffffffffffffff, %f8  = 29b68648 00005c46
	ldda	[%i5+%o4]0x81,%f8 	! %f8  = 00ffffff ffffffff
!	Mem[0000000010001400] = 00000046, %l3 = 00000000ffffffff
	ldsba	[%i0+%g0]0x88,%l3	! %l3 = 0000000000000046
!	Mem[0000000030101400] = 7bd47808, %l4 = 0000000000000000
	lduwa	[%i4+%g0]0x89,%l4	! %l4 = 000000007bd47808
!	Mem[0000000010181400] = 65d8ffef, %l2 = 00000000ffffffff
	lduwa	[%i6+%g0]0x80,%l2	! %l2 = 0000000065d8ffef
!	Mem[00000000100c1400] = ffffff7f, %l0 = 2200000100000000
	ldsha	[%i3+%g0]0x80,%l0	! %l0 = ffffffffffffffff
!	Mem[00000000100c1410] = 07a95c45, %l3 = 0000000000000046
	lduha	[%i3+%o5]0x88,%l3	! %l3 = 0000000000005c45
!	Mem[0000000010001400] = 46000000 00000000, %l4 = 7bd47808, %l5 = 000000ff
	ldd	[%i0+%g0],%l4		! %l4 = 0000000046000000 0000000000000000

p0_label_297:
!	Starting 10 instruction Store Burst
!	Mem[0000000030101400] = 0878d47b, %l0 = 00000000ffffffff
	swapa	[%i4+%g0]0x81,%l0	! %l0 = 000000000878d47b
!	%l1 = 0000000000000089, imm = ffffffffffffffe2, %l1 = 0000000000000089
	xnor	%l1,-0x01e,%l1		! %l1 = 0000000000000094
!	%l7 = 0000000000000000, Mem[0000000010081418] = 2a039126, %asi = 80
	stwa	%l7,[%i2+0x018]%asi	! Mem[0000000010081418] = 00000000
!	%l7 = 0000000000000000, Mem[00000000100c1410] = 455ca907
	stha	%l7,[%i3+%o5]0x80	! Mem[00000000100c1410] = 0000a907
!	%l2 = 0000000065d8ffef, %l1 = 0000000000000094, %l1 = 0000000000000094
	xnor	%l2,%l1,%l1		! %l1 = ffffffff9a270084
!	Mem[0000000010181408] = 25a83dc400000000, %l0 = 000000000878d47b, %l2 = 0000000065d8ffef
	add	%i6,0x08,%g1
	casxa	[%g1]0x80,%l0,%l2	! %l2 = 25a83dc400000000
!	%f1  = 000000f6, Mem[00000000300c1400] = 0000007f
	sta	%f1 ,[%i3+%g0]0x89	! Mem[00000000300c1400] = 000000f6
!	%l0 = 000000000878d47b, Mem[0000000030041400] = 500000ff
	stwa	%l0,[%i1+%g0]0x89	! Mem[0000000030041400] = 0878d47b
!	Mem[0000000030181400] = ff0000ff eb9ab308 00000038 7fffff00
!	%f16 = 000000ff 00000000 00000000 00000000
!	%f20 = ffffffff 6968571c 2a039126 ff0000ff
!	%f24 = f569f2af 1c576869 000003c4 7569f2ff
!	%f28 = 2e43aea4 00006400 ff000000 00000000
	stda	%f16,[%i6+%g0]ASI_BLK_AIUSL	! Block Store to 0000000030181400
!	%l5 = 0000000000000000, immd = 0000020f, %y  = 00000000
	sdiv	%l5,0x20f,%l1		! %l1 = 0000000000000000
	mov	%l0,%y			! %y = 0878d47b

p0_label_298:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = ffffffffffffffff, %l7 = 0000000000000000
	ldxa	[%i1+%o4]0x80,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000030001400] = 00005c46, %l0 = 000000000878d47b
	ldsha	[%i0+%g0]0x89,%l0	! %l0 = 0000000000005c46
	membar	#Sync			! Added by membar checker (57)
!	Mem[0000000010181400] = 65d8ffef, %l5 = 0000000000000000
	ldsba	[%i6+%g0]0x80,%l5	! %l5 = 0000000000000065
!	Mem[0000000030041400] = 7bd47808 00000000 29b68648 00005c46
!	Mem[0000000030041410] = 38ffffff ff000000 53915c46 000039e7
!	Mem[0000000030041420] = 1c576869 00ff0000 7fffff00 7fffff00
!	Mem[0000000030041430] = 0000032a 1c576869 39e71470 023c9854
	ldda	[%i1+%g0]ASI_BLK_SL,%f0 	! Block Load from 0000000030041400
!	Mem[0000000030141410] = 000000ff 00000000, %l4 = 46000000, %l5 = 00000065
	ldda	[%i5+%o5]0x89,%l4	! %l4 = 0000000000000000 00000000000000ff
!	Mem[0000000030041400] = 000000000878d47b, %f16 = 000000ff 00000000
	ldda	[%i1+%g0]0x89,%f16	! %f16 = 00000000 0878d47b
!	Mem[0000000030141400] = 455ca907, %l6 = 0000000000000000
	ldsha	[%i5+%g0]0x81,%l6	! %l6 = 000000000000455c
!	Mem[00000000100c141c] = 00001019, %f30 = ff000000
	ld	[%i3+0x01c],%f30	! %f30 = 00001019
!	Mem[0000000010101400] = 0000000000000000, %f20 = ffffffff 6968571c
	ldda	[%i4+%g0]0x80,%f20	! %f20 = 00000000 00000000
!	Mem[0000000030181408] = 00000000, %l5 = 00000000000000ff
	ldswa	[%i6+%o4]0x81,%l5	! %l5 = 0000000000000000

p0_label_299:
!	Starting 10 instruction Store Burst
!	Mem[0000000030001400] = 00005c46, %l0 = 0000000000005c46
	swapa	[%i0+%g0]0x89,%l0	! %l0 = 0000000000005c46
!	%l3 = 0000000000005c45, Mem[00000000100c1408] = 46ffffff
	stha	%l3,[%i3+%o4]0x80	! Mem[00000000100c1408] = 5c45ffff
!	Mem[0000000021800180] = 00ff8090, %l2 = 25a83dc400000000
	ldstub	[%o3+0x180],%l2		! %l2 = 0000000000000000
!	%f25 = 1c576869, Mem[00000000100c142c] = 00000000
	sta	%f25,[%i3+0x02c]%asi	! Mem[00000000100c142c] = 1c576869
!	%l1 = 0000000000000000, Mem[0000000021800100] = ff009830, %asi = 80
	stha	%l1,[%o3+0x100]%asi	! Mem[0000000021800100] = 00009830
!	%l3 = 0000000000005c45, Mem[000000001018141a] = 53915c46, %asi = 80
	stha	%l3,[%i6+0x01a]%asi	! Mem[0000000010181418] = 53915c45
!	%l0 = 00005c46, %l1 = 00000000, Mem[0000000010101400] = 00000000 00000000
	std	%l0,[%i4+%g0]		! Mem[0000000010101400] = 00005c46 00000000
!	%l0 = 0000000000005c46, Mem[0000000020800000] = 38002ce0, %asi = 80
	stha	%l0,[%o1+0x000]%asi	! Mem[0000000020800000] = 5c462ce0
!	%l3 = 0000000000005c45, Mem[0000000030181410] = 6968571c
	stha	%l3,[%i6+%o5]0x89	! Mem[0000000030181410] = 69685c45
!	Mem[00000000211c0000] = 29894d40, %l4 = 0000000000000000
	ldstuba	[%o2+0x000]%asi,%l4	! %l4 = 0000000000000029

p0_label_300:
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = 000000f6, %l7 = ffffffffffffffff
	lduba	[%i3+%g0]0x89,%l7	! %l7 = 00000000000000f6
!	Mem[00000000100c1400] = 7fffffff, %l4 = 0000000000000029
	ldswa	[%i3+%g0]0x88,%l4	! %l4 = 000000007fffffff
!	Mem[0000000010001408] = 00ffffff 000000ff, %l4 = 7fffffff, %l5 = 00000000
	ldda	[%i0+%o4]0x80,%l4	! %l4 = 0000000000ffffff 00000000000000ff
!	%l6 = 000000000000455c, %l0 = 0000000000005c46, %l0 = 0000000000005c46
	sdivx	%l6,%l0,%l0		! %l0 = 0000000000000000
!	Mem[0000000010081400] = ff000000, %l6 = 000000000000455c
	ldsba	[%i2+%g0]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000010101410] = 7fffffff00000000, %f22 = 2a039126 ff0000ff
	ldda	[%i4+%o5]0x80,%f22	! %f22 = 7fffffff 00000000
!	Mem[0000000030181410] = 455c6869, %l3 = 0000000000005c45
	lduba	[%i6+%o5]0x81,%l3	! %l3 = 0000000000000045
!	Mem[0000000010001420] = 00000000, %f24 = f569f2af
	ld	[%i0+0x020],%f24	! %f24 = 00000000
!	Mem[00000000300c1410] = ffffffff, %l5 = 00000000000000ff
	lduha	[%i3+%o5]0x81,%l5	! %l5 = 000000000000ffff
!	Mem[0000000010041404] = 00000000, %l5 = 000000000000ffff, %asi = 80
	lduha	[%i1+0x004]%asi,%l5	! %l5 = 0000000000000000

!	End of Random Code for Thread 0

1:	membar	#Sync			! Force all stores to complete


!	Check Registers

p0_check_registers:
	set	p0_expected_registers,%g1
	ldx	[%g1+0x000],%g2
	cmp	%l0,%g2			! %l0 should be 0000000000000000
	bne	%xcc,p0_reg_l0_fail
	mov	%l0,%g3
	ldx	[%g1+0x008],%g2
	cmp	%l1,%g2			! %l1 should be 0000000000000000
	bne	%xcc,p0_reg_l1_fail
	mov	%l1,%g3
	ldx	[%g1+0x010],%g2
	cmp	%l2,%g2			! %l2 should be 0000000000000000
	bne	%xcc,p0_reg_l2_fail
	mov	%l2,%g3
	ldx	[%g1+0x018],%g2
	cmp	%l3,%g2			! %l3 should be 0000000000000045
	bne	%xcc,p0_reg_l3_fail
	mov	%l3,%g3
	ldx	[%g1+0x020],%g2
	cmp	%l4,%g2			! %l4 should be 0000000000ffffff
	bne	%xcc,p0_reg_l4_fail
	mov	%l4,%g3
	ldx	[%g1+0x028],%g2
	cmp	%l5,%g2			! %l5 should be 0000000000000000
	bne	%xcc,p0_reg_l5_fail
	mov	%l5,%g3
	ldx	[%g1+0x030],%g2
	cmp	%l6,%g2			! %l6 should be 0000000000000000
	bne	%xcc,p0_reg_l6_fail
	mov	%l6,%g3
	ldx	[%g1+0x038],%g2
	cmp	%l7,%g2			! %l7 should be 00000000000000f6
	bne	%xcc,p0_reg_l7_fail
	mov	%l7,%g3

!	Check %y register

	set	0x0878d47b,%g2
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
	cmp	%l0,%l1			! %f0  should be 00000000 0878d47b
	bne	%xcc,p0_freg_fail
	std	%f2,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x08],%l0
	cmp	%l0,%l1			! %f2  should be 465c0000 4886b629
	bne	%xcc,p0_freg_fail
	std	%f4,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x10],%l0
	cmp	%l0,%l1			! %f4  should be 000000ff ffffff38
	bne	%xcc,p0_freg_fail
	std	%f6,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x18],%l0
	cmp	%l0,%l1			! %f6  should be e7390000 465c9153
	bne	%xcc,p0_freg_fail
	std	%f8,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x20],%l0
	cmp	%l0,%l1			! %f8  should be 0000ff00 6968571c
	bne	%xcc,p0_freg_fail
	std	%f10,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x28],%l0
	cmp	%l0,%l1			! %f10 should be 00ffff7f 00ffff7f
	bne	%xcc,p0_freg_fail
	std	%f12,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x30],%l0
	cmp	%l0,%l1			! %f12 should be 6968571c 2a030000
	bne	%xcc,p0_freg_fail
	std	%f14,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x38],%l0
	cmp	%l0,%l1			! %f14 should be 54983c02 7014e739
	bne	%xcc,p0_freg_fail
	std	%f16,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x40],%l0
	cmp	%l0,%l1			! %f16 should be 00000000 0878d47b
	bne	%xcc,p0_freg_fail
	std	%f18,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x48],%l0
	cmp	%l0,%l1			! %f18 should be 00000000 00000000
	bne	%xcc,p0_freg_fail
	std	%f20,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x50],%l0
	cmp	%l0,%l1			! %f20 should be 00000000 00000000
	bne	%xcc,p0_freg_fail
	std	%f22,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x58],%l0
	cmp	%l0,%l1			! %f22 should be 7fffffff 00000000
	bne	%xcc,p0_freg_fail
	std	%f24,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x60],%l0
	cmp	%l0,%l1			! %f24 should be 00000000 1c576869
	bne	%xcc,p0_freg_fail
	std	%f26,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x68],%l0
	cmp	%l0,%l1			! %f26 should be 000003c4 7569f2ff
	bne	%xcc,p0_freg_fail
	std	%f28,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x70],%l0
	cmp	%l0,%l1			! %f28 should be 2e43aea4 00006400
	bne	%xcc,p0_freg_fail
	std	%f30,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x78],%l0
	cmp	%l0,%l1			! %f30 should be 00001019 00000000
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
	ldx	[%g1+0x000],%l0		! %l0 = b38c9c1985e4f4be
	ldx	[%g1+0x008],%l1		! %l1 = cf2f03c43b806569
	ldx	[%g1+0x010],%l2		! %l2 = 971e39d5b78e9224
	ldx	[%g1+0x018],%l3		! %l3 = f4ae0dea334ffdef
	ldx	[%g1+0x020],%l4		! %l4 = f8d69c521099bbca
	ldx	[%g1+0x028],%l5		! %l5 = 5a87e1747cf06eb5
	ldx	[%g1+0x030],%l6		! %l6 = dab69ec305b349b0
	ldx	[%g1+0x038],%l7		! %l7 = 186de40c90570fbb

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
	add	%l2,%l3,%l3
	fdivs	%f9 ,%f0 ,%f13
	fsubs	%f4 ,%f1 ,%f3 
	jmpl	%o7,%g0
	sdivx	%l2,0x53e,%l4
p0_near_0_he:
	fitos	%f19,%f17
	jmpl	%o7,%g0
	xor	%l2,%l2,%l7
p0_near_0_lo:
	add	%l2,%l3,%l3
	fdivs	%f9 ,%f0 ,%f13
	fsubs	%f4 ,%f1 ,%f3 
	jmpl	%o7,%g0
	sdivx	%l2,0x53e,%l4
p0_near_0_ho:
	fitos	%f19,%f17
	jmpl	%o7,%g0
	xor	%l2,%l2,%l7
near0_b2b_h:
	xnor	%l5,-0xbc0,%l6
	and	%l0,0x37e,%l1
	xnor	%l4,0x5bc,%l3
	sub	%l4,%l7,%l3
	sdivx	%l6,%l1,%l6
	jmpl	%o7,%g0
	fsqrts	%f30,%f30
near0_b2b_l:
	and	%l1,-0xb92,%l5
	orn	%l6,-0xb27,%l3
	addc	%l3,%l4,%l5
	smul	%l3,%l0,%l4
	sdivx	%l6,0xcf3,%l1
	jmpl	%o7,%g0
	xor	%l2,%l7,%l3
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
	ld	[%i1+0x034],%f13	! Mem[0000000010041434]
	jmpl	%o7,%g0
	subc	%l3,%l2,%l6
p0_near_1_he:
	sdivx	%l2,0xfcc,%l6
	addc	%l4,%l2,%l1
	xnor	%l3,0x3f1,%l5
	jmpl	%o7,%g0
	swap	[%i3+0x008],%l7		! Mem[00000000100c1408]
p0_near_1_lo:
	ld	[%o1+0x034],%f13	! Mem[0000000010041434]
	jmpl	%o7,%g0
	subc	%l3,%l2,%l6
p0_near_1_ho:
	sdivx	%l2,0xfcc,%l6
	addc	%l4,%l2,%l1
	xnor	%l3,0x3f1,%l5
	jmpl	%o7,%g0
	swap	[%o3+0x008],%l7		! Mem[00000000100c1408]
near1_b2b_h:
	umul	%l0,-0x403,%l4
	udivx	%l5,0x1f6,%l1
	smul	%l6,%l5,%l6
	and	%l5,-0xdd4,%l6
	jmpl	%o7,%g0
	andn	%l2,0x00d,%l7
near1_b2b_l:
	andn	%l5,%l4,%l3
	orn	%l7,0xdc8,%l1
	sub	%l2,%l7,%l4
	udivx	%l2,0x2cd,%l1
	jmpl	%o7,%g0
	and	%l7,%l1,%l5
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
	add	%l0,-0xf20,%l3
	sdivx	%l2,%l2,%l7
	ldx	[%i5+0x000],%l7		! Mem[0000000010141400]
	fcmps	%fcc2,%f2 ,%f3 
	ldsb	[%o3+0x040],%l2		! Mem[0000000021800040]
	fstod	%f2 ,%f12
	jmpl	%o7,%g0
	xnor	%l2,%l6,%l7
p0_near_2_he:
	add	%l7,-0x3d8,%l0
	jmpl	%o7,%g0
	xnor	%l3,0x792,%l4
p0_near_2_lo:
	add	%l0,-0xf20,%l3
	sdivx	%l2,%l2,%l7
	ldx	[%o5+0x000],%l7		! Mem[0000000010141400]
	fcmps	%fcc2,%f2 ,%f3 
	ldsb	[%i3+0x040],%l2		! Mem[0000000021800040]
	fstod	%f2 ,%f12
	jmpl	%o7,%g0
	xnor	%l2,%l6,%l7
p0_near_2_ho:
	add	%l7,-0x3d8,%l0
	jmpl	%o7,%g0
	xnor	%l3,0x792,%l4
near2_b2b_h:
	fmuls	%f30,%f19,%f18
	or	%l0,0x25a,%l7
	subc	%l2,-0x08c,%l2
	subc	%l1,%l6,%l0
	jmpl	%o7,%g0
	sdivx	%l4,%l7,%l3
near2_b2b_l:
	mulx	%l1,-0x61b,%l0
	orn	%l3,%l0,%l3
	subc	%l1,%l4,%l1
	fadds	%f9 ,%f8 ,%f1 
	jmpl	%o7,%g0
	orn	%l0,%l0,%l2
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
	mulx	%l2,%l6,%l0
	jmpl	%o7,%g0
	lduh	[%o2+0x000],%l0		! Mem[00000000211c0000]
p0_near_3_he:
	fdivs	%f31,%f19,%f21
	orn	%l7,-0x951,%l4
	addc	%l7,-0x90e,%l0
	sdivx	%l7,0xa63,%l7
	smul	%l7,0x485,%l3
	fsubs	%f25,%f21,%f25
	sdivx	%l1,%l6,%l0
	jmpl	%o7,%g0
	sdivx	%l2,0x98e,%l7
p0_near_3_lo:
	mulx	%l2,%l6,%l0
	jmpl	%o7,%g0
	lduh	[%i2+0x000],%l0		! Mem[00000000211c0000]
p0_near_3_ho:
	fdivs	%f31,%f19,%f21
	orn	%l7,-0x951,%l4
	addc	%l7,-0x90e,%l0
	sdivx	%l7,0xa63,%l7
	smul	%l7,0x485,%l3
	fsubs	%f25,%f21,%f25
	sdivx	%l1,%l6,%l0
	jmpl	%o7,%g0
	sdivx	%l2,0x98e,%l7
near3_b2b_h:
	and	%l7,0xc43,%l0
	fsubs	%f28,%f19,%f18
	jmpl	%o7,%g0
	fdivs	%f18,%f23,%f18
near3_b2b_l:
	xnor	%l7,%l3,%l3
	udivx	%l0,0xdf0,%l1
	jmpl	%o7,%g0
	smul	%l5,0x20b,%l0
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
	fadds	%f13,%f14,%f6 
	fcmps	%fcc3,%f5 ,%f10
	jmpl	%o7,%g0
	andn	%l6,-0xe52,%l2
p0_far_0_he:
	jmpl	%o7,%g0
	fdivs	%f19,%f27,%f30
	jmpl	%o7,%g0
	nop
p0_far_0_lo:
	fadds	%f13,%f14,%f6 
	fcmps	%fcc3,%f5 ,%f10
	jmpl	%o7,%g0
	andn	%l6,-0xe52,%l2
p0_far_0_ho:
	jmpl	%o7,%g0
	fdivs	%f19,%f27,%f30
	jmpl	%o7,%g0
	nop
	jmpl	%o7,%g0
	nop
far0_b2b_h:
	sub	%l0,%l0,%l3
	and	%l0,%l6,%l5
	fsqrts	%f29,%f26
	xor	%l5,%l0,%l6
	xor	%l0,%l1,%l6
	smul	%l1,%l5,%l4
	jmpl	%o7,%g0
	sdivx	%l1,%l6,%l6
far0_b2b_l:
	fadds	%f9 ,%f8 ,%f12
	fdivs	%f11,%f8 ,%f9 
	addc	%l6,%l0,%l6
	sub	%l0,%l2,%l6
	smul	%l3,-0x1a3,%l6
	or	%l7,%l7,%l1
	jmpl	%o7,%g0
	fdivs	%f3 ,%f6 ,%f8 
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
	fsubs	%f3 ,%f11,%f1 
	xnor	%l7,%l4,%l5
	fsubs	%f5 ,%f15,%f9 
	fadds	%f2 ,%f3 ,%f4 
	jmpl	%o7,%g0
	xor	%l6,%l5,%l7
p0_far_1_he:
	sub	%l0,%l2,%l2
	fmuls	%f21,%f20,%f30
	xnor	%l3,%l6,%l4
	fstod	%f30,%f22
	jmpl	%o7,%g0
	subc	%l2,%l5,%l4
p0_far_1_lo:
	fsubs	%f3 ,%f11,%f1 
	xnor	%l7,%l4,%l5
	fsubs	%f5 ,%f15,%f9 
	fadds	%f2 ,%f3 ,%f4 
	jmpl	%o7,%g0
	xor	%l6,%l5,%l7
p0_far_1_ho:
	sub	%l0,%l2,%l2
	fmuls	%f21,%f20,%f30
	xnor	%l3,%l6,%l4
	fstod	%f30,%f22
	jmpl	%o7,%g0
	subc	%l2,%l5,%l4
far1_b2b_h:
	jmpl	%o7,%g0
	addc	%l6,-0xd90,%l1
	jmpl	%o7,%g0
	nop
far1_b2b_l:
	jmpl	%o7,%g0
	xnor	%l6,%l2,%l4
	jmpl	%o7,%g0
	nop
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
	xor	%l4,%l3,%l5
	jmpl	%o7,%g0
	nop
p0_far_2_he:
	fadds	%f24,%f26,%f17
	mulx	%l1,%l5,%l6
	fdivs	%f24,%f20,%f16
	smul	%l7,%l2,%l4
	fsubs	%f26,%f16,%f23
	jmpl	%o7,%g0
	fcmps	%fcc0,%f18,%f29
p0_far_2_lo:
	jmpl	%o7,%g0
	xor	%l4,%l3,%l5
	jmpl	%o7,%g0
	nop
	jmpl	%o7,%g0
	nop
p0_far_2_ho:
	fadds	%f24,%f26,%f17
	mulx	%l1,%l5,%l6
	fdivs	%f24,%f20,%f16
	smul	%l7,%l2,%l4
	fsubs	%f26,%f16,%f23
	jmpl	%o7,%g0
	fcmps	%fcc0,%f18,%f29
far2_b2b_h:
	umul	%l0,0x9e9,%l0
	fsubs	%f30,%f17,%f29
	jmpl	%o7,%g0
	sdivx	%l0,%l5,%l0
far2_b2b_l:
	udivx	%l6,0x4df,%l5
	xor	%l0,%l6,%l5
	jmpl	%o7,%g0
	andn	%l7,-0x320,%l7
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
	fsqrts	%f15,%f3 
	fcmps	%fcc1,%f0 ,%f9 
	sdivx	%l3,0x29b,%l0
	and	%l0,-0xbed,%l6
	smul	%l0,0x724,%l3
	jmpl	%o7,%g0
	fdivs	%f12,%f1 ,%f12
p0_far_3_he:
	fmuls	%f23,%f29,%f22
	and	%l6,-0xfc3,%l4
	fsubs	%f17,%f26,%f21
	mulx	%l6,0x78d,%l7
	fcmps	%fcc0,%f29,%f18
	jmpl	%o7,%g0
	subc	%l6,0x809,%l2
p0_far_3_lo:
	fsqrts	%f15,%f3 
	fcmps	%fcc1,%f0 ,%f9 
	sdivx	%l3,0x29b,%l0
	and	%l0,-0xbed,%l6
	smul	%l0,0x724,%l3
	jmpl	%o7,%g0
	fdivs	%f12,%f1 ,%f12
p0_far_3_ho:
	fmuls	%f23,%f29,%f22
	and	%l6,-0xfc3,%l4
	fsubs	%f17,%f26,%f21
	mulx	%l6,0x78d,%l7
	fcmps	%fcc0,%f29,%f18
	jmpl	%o7,%g0
	subc	%l6,0x809,%l2
far3_b2b_h:
	addc	%l1,%l2,%l5
	fmuls	%f20,%f28,%f24
	fadds	%f21,%f25,%f21
	sub	%l0,%l2,%l7
	sdivx	%l7,0xdd8,%l1
	fsqrts	%f18,%f31
	jmpl	%o7,%g0
	orn	%l2,%l5,%l7
far3_b2b_l:
	fdivs	%f2 ,%f15,%f14
	fdivs	%f0 ,%f11,%f11
	mulx	%l7,-0x152,%l7
	xnor	%l2,%l4,%l1
	smul	%l4,%l3,%l7
	fsqrts	%f7 ,%f3 
	jmpl	%o7,%g0
	sdivx	%l3,%l6,%l1
user_far3_end:
	.seg	"text"
	.align	0x2000
user_jump0_start:
	.skip	16
p0_jmpl_0_le:
	or	%l3,-0x20e,%l3
	fdivs	%f0 ,%f13,%f9 
	addc	%l3,0xf90,%l1
	jmpl	%g6+8,%g0
	subc	%l1,-0x43c,%l6
p0_call_0_le:
	swap	[%i3+0x014],%l2		! Mem[00000000100c1414]
	fadds	%f0 ,%f9 ,%f3 
	udivx	%l4,%l5,%l2
	retl
	udivx	%l1,0xee1,%l6
p0_jmpl_0_lo:
	or	%l3,-0x20e,%l3
	fdivs	%f0 ,%f13,%f9 
	addc	%l3,0xf90,%l1
	jmpl	%g6+8,%g0
	subc	%l1,-0x43c,%l6
p0_call_0_lo:
	swap	[%o3+0x014],%l2		! Mem[00000000100c1414]
	fadds	%f0 ,%f9 ,%f3 
	udivx	%l4,%l5,%l2
	retl
	udivx	%l1,0xee1,%l6
p0_jmpl_0_he:
	orn	%l4,-0x9aa,%l4
	udivx	%l7,%l5,%l0
	orn	%l7,%l5,%l7
	jmpl	%g6+8,%g0
	lduw	[%i1+0x000],%l0		! Mem[0000000010041400]
p0_call_0_he:
	fsubs	%f24,%f22,%f21
	umul	%l6,-0xe83,%l1
	fadds	%f19,%f17,%f19
	fmuls	%f29,%f23,%f30
	xnor	%l2,%l3,%l2
	fsqrts	%f24,%f19
	retl
	fsqrts	%f22,%f23
p0_jmpl_0_ho:
	orn	%l4,-0x9aa,%l4
	udivx	%l7,%l5,%l0
	orn	%l7,%l5,%l7
	jmpl	%g6+8,%g0
	lduw	[%o1+0x000],%l0		! Mem[0000000010041400]
p0_call_0_ho:
	fsubs	%f24,%f22,%f21
	umul	%l6,-0xe83,%l1
	fadds	%f19,%f17,%f19
	fmuls	%f29,%f23,%f30
	xnor	%l2,%l3,%l2
	fsqrts	%f24,%f19
	retl
	fsqrts	%f22,%f23
user_jump0_end:
	.seg	"text"
	.align	0x2000
user_jump1_start:
	.skip	32
p0_jmpl_1_le:
	fdivs	%f15,%f1 ,%f15
	or	%l5,%l1,%l0
	subc	%l1,%l7,%l7
	fadds	%f10,%f7 ,%f8 
	fadds	%f7 ,%f5 ,%f7 
	udivx	%l1,0xf4e,%l0
	mulx	%l5,%l6,%l3
	jmpl	%g6+8,%g0
	smul	%l5,%l6,%l7
p0_call_1_le:
	fmuls	%f3 ,%f6 ,%f5 
	sub	%l4,-0xdd0,%l4
	orn	%l6,%l5,%l7
	or	%l0,-0xcc2,%l1
	subc	%l3,%l0,%l7
	fsubs	%f15,%f1 ,%f2 
	retl
	xor	%l7,%l0,%l5
p0_jmpl_1_lo:
	fdivs	%f15,%f1 ,%f15
	or	%l5,%l1,%l0
	subc	%l1,%l7,%l7
	fadds	%f10,%f7 ,%f8 
	fadds	%f7 ,%f5 ,%f7 
	udivx	%l1,0xf4e,%l0
	mulx	%l5,%l6,%l3
	jmpl	%g6+8,%g0
	smul	%l5,%l6,%l7
p0_call_1_lo:
	fmuls	%f3 ,%f6 ,%f5 
	sub	%l4,-0xdd0,%l4
	orn	%l6,%l5,%l7
	or	%l0,-0xcc2,%l1
	subc	%l3,%l0,%l7
	fsubs	%f15,%f1 ,%f2 
	retl
	xor	%l7,%l0,%l5
p0_jmpl_1_he:
	fmuls	%f16,%f27,%f28
	fsqrts	%f27,%f28
	mulx	%l5,-0x5e3,%l5
	addc	%l4,0x0cf,%l6
	jmpl	%g6+8,%g0
	orn	%l1,-0x072,%l3
p0_call_1_he:
	addc	%l3,-0x59a,%l5
	retl
	xor	%l2,-0xb46,%l7
p0_jmpl_1_ho:
	fmuls	%f16,%f27,%f28
	fsqrts	%f27,%f28
	mulx	%l5,-0x5e3,%l5
	addc	%l4,0x0cf,%l6
	jmpl	%g6+8,%g0
	orn	%l1,-0x072,%l3
p0_call_1_ho:
	addc	%l3,-0x59a,%l5
	retl
	xor	%l2,-0xb46,%l7
user_jump1_end:
	.seg	"text"
	.align	0x2000
user_jump2_start:
	.skip	48
p0_jmpl_2_le:
	xor	%l4,%l0,%l0
	subc	%l7,%l7,%l5
	fmuls	%f7 ,%f11,%f4 
	xnor	%l6,%l7,%l5
	fmuls	%f6 ,%f9 ,%f4 
	orn	%l7,%l1,%l5
	jmpl	%g6+8,%g0
	umul	%l1,%l6,%l2
p0_call_2_le:
	xnor	%l3,%l5,%l2
	fstoi	%f10,%f10
	fsubs	%f6 ,%f5 ,%f13
	mulx	%l0,-0x2fb,%l0
	retl
	fcmps	%fcc2,%f6 ,%f11
p0_jmpl_2_lo:
	xor	%l4,%l0,%l0
	subc	%l7,%l7,%l5
	fmuls	%f7 ,%f11,%f4 
	xnor	%l6,%l7,%l5
	fmuls	%f6 ,%f9 ,%f4 
	orn	%l7,%l1,%l5
	jmpl	%g6+8,%g0
	umul	%l1,%l6,%l2
p0_call_2_lo:
	xnor	%l3,%l5,%l2
	fstoi	%f10,%f10
	fsubs	%f6 ,%f5 ,%f13
	mulx	%l0,-0x2fb,%l0
	retl
	fcmps	%fcc2,%f6 ,%f11
p0_jmpl_2_he:
	fsubs	%f28,%f24,%f20
	add	%l7,-0xa2f,%l4
	fadds	%f28,%f20,%f18
	sub	%l2,%l2,%l0
	sub	%l6,-0x1e7,%l4
	orn	%l6,%l6,%l5
	jmpl	%g6+8,%g0
	sdivx	%l1,0xc72,%l0
p0_call_2_he:
	addc	%l3,%l4,%l5
	add	%l2,0xa9e,%l5
	retl
	add	%l1,-0x066,%l3
p0_jmpl_2_ho:
	fsubs	%f28,%f24,%f20
	add	%l7,-0xa2f,%l4
	fadds	%f28,%f20,%f18
	sub	%l2,%l2,%l0
	sub	%l6,-0x1e7,%l4
	orn	%l6,%l6,%l5
	jmpl	%g6+8,%g0
	sdivx	%l1,0xc72,%l0
p0_call_2_ho:
	addc	%l3,%l4,%l5
	add	%l2,0xa9e,%l5
	retl
	add	%l1,-0x066,%l3
user_jump2_end:
	.seg	"text"
	.align	0x2000
user_jump3_start:
	.skip	64
p0_jmpl_3_le:
	xnor	%l3,0x9e5,%l0
	jmpl	%g6+8,%g0
	udivx	%l2,0x1b3,%l1
p0_call_3_le:
	umul	%l6,%l4,%l6
	fsqrts	%f12,%f10
	fdivs	%f6 ,%f6 ,%f5 
	umul	%l1,%l7,%l6
	retl
	sub	%l6,%l5,%l4
p0_jmpl_3_lo:
	xnor	%l3,0x9e5,%l0
	jmpl	%g6+8,%g0
	udivx	%l2,0x1b3,%l1
p0_call_3_lo:
	umul	%l6,%l4,%l6
	fsqrts	%f12,%f10
	fdivs	%f6 ,%f6 ,%f5 
	umul	%l1,%l7,%l6
	retl
	sub	%l6,%l5,%l4
p0_jmpl_3_he:
	xor	%l4,%l6,%l6
	fdivs	%f31,%f26,%f30
	fdivs	%f22,%f23,%f22
	sdivx	%l4,0x0f8,%l4
	fdivs	%f27,%f29,%f31
	jmpl	%g6+8,%g0
	or	%l3,-0x368,%l3
p0_call_3_he:
	udivx	%l7,%l5,%l2
	andn	%l0,%l1,%l1
	retl
	fsubs	%f28,%f30,%f17
p0_jmpl_3_ho:
	xor	%l4,%l6,%l6
	fdivs	%f31,%f26,%f30
	fdivs	%f22,%f23,%f22
	sdivx	%l4,0x0f8,%l4
	fdivs	%f27,%f29,%f31
	jmpl	%g6+8,%g0
	or	%l3,-0x368,%l3
p0_call_3_ho:
	udivx	%l7,%l5,%l2
	andn	%l0,%l1,%l1
	retl
	fsubs	%f28,%f30,%f17
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
	.word	0xb38c9c19,0x85e4f4be		! Init value for %l0
	.word	0xcf2f03c4,0x3b806569		! Init value for %l1
	.word	0x971e39d5,0xb78e9224		! Init value for %l2
	.word	0xf4ae0dea,0x334ffdef		! Init value for %l3
	.word	0xf8d69c52,0x1099bbca		! Init value for %l4
	.word	0x5a87e174,0x7cf06eb5		! Init value for %l5
	.word	0xdab69ec3,0x05b349b0		! Init value for %l6
	.word	0x186de40c,0x90570fbb		! Init value for %l7
	.align	64
p0_init_freg:
	.word	0x70371b50,0x2fdadc21		! Init value for %f0 
	.word	0x3809630e,0x74331627		! Init value for %f2 
	.word	0x7397b93c,0x5fb35edd		! Init value for %f4 
	.word	0x28acf55a,0x300e7fc3		! Init value for %f6 
	.word	0x54a4cae8,0x3a0b2e59		! Init value for %f8 
	.word	0x283ba966,0x02a86c1f		! Init value for %f10
	.word	0x69e59c54,0x244ce695		! Init value for %f12
	.word	0x71242b32,0x3d99573b		! Init value for %f14
	.word	0x23133980,0x2e35e391		! Init value for %f16
	.word	0x0c24e6be,0x72b27d17		! Init value for %f18
	.word	0x14c46e6c,0x3352414d		! Init value for %f20
	.word	0x4e58080a,0x4259d9b3		! Init value for %f22
	.word	0x63d9c718,0x0538dbc9		! Init value for %f24
	.word	0x44ff7b16,0x48a6290f		! Init value for %f26
	.word	0x1ca98f84,0x7a874f05		! Init value for %f28
	.word	0x7b10ebe2,0x653ae72b		! Init value for %f30
	.word	0x41ebd3b0,0x7e9df701		! Init value for %f32
	.word	0x4481c66e,0x59e45007		! Init value for %f34
	.word	0x1f665f9c,0x7e1befbd		! Init value for %f36
	.word	0x7b5336ba,0x7bf35fa3		! Init value for %f38
	.word	0x2c58bf48,0x4c1b1539		! Init value for %f40
	.word	0x5a5e28c6,0x7459d1ff		! Init value for %f42
	.word	0x09a83eb4,0x5c2c0375		! Init value for %f44
	.word	0x61df4892,0x4a86231b		! Init value for %f46
	.word	0x67cbe9e0,0x6d121671
	.word	0x71c3021e,0x35ff8ef7
	.word	0x60788ccc,0x003f6a2d
	.word	0x05b1816a,0x72c21193
	.word	0x100cb378,0x3a10daa9
	.word	0x3edab276,0x145a66ef
	.word	0x7abca9e4,0x06ca03e5
	.word	0x27824142,0x13c20b0b
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
	.word	0x00000000,0x00000000		! %l0
	.word	0x00000000,0x00000000		! %l1
	.word	0x00000000,0x00000000		! %l2
	.word	0x00000000,0x00000045		! %l3
	.word	0x00000000,0x00ffffff		! %l4
	.word	0x00000000,0x00000000		! %l5
	.word	0x00000000,0x00000000		! %l6
	.word	0x00000000,0x000000f6		! %l7
p0_expected_fp_regs:
	.word	0x00000000,0x0878d47b		! %f0
	.word	0x465c0000,0x4886b629		! %f2
	.word	0x000000ff,0xffffff38		! %f4
	.word	0xe7390000,0x465c9153		! %f6
	.word	0x0000ff00,0x6968571c		! %f8
	.word	0x00ffff7f,0x00ffff7f		! %f10
	.word	0x6968571c,0x2a030000		! %f12
	.word	0x54983c02,0x7014e739		! %f14
	.word	0x00000000,0x0878d47b		! %f16
	.word	0x00000000,0x00000000		! %f18
	.word	0x00000000,0x00000000		! %f20
	.word	0x7fffffff,0x00000000		! %f22
	.word	0x00000000,0x1c576869		! %f24
	.word	0x000003c4,0x7569f2ff		! %f26
	.word	0x2e43aea4,0x00006400		! %f28
	.word	0x00001019,0x00000000		! %f30
	.word	0x00000029,0x00000fe0		! %fsr
p0_local0_expect:
	.word	0x46000000,0x00000000,0x00ffffff,0x000000ff ! PA = 0000000010001400
	.word	0xb3080000,0xffffff38,0x00000000,0xffffff7f ! PA = 0000000010001410
	.word	0x00000000,0x000003c4,0x000000f6,0x7569f2af ! PA = 0000000010001420
	.word	0x000000ff,0x000000ff,0x0000ff00,0x000000ff ! PA = 0000000010001430
p0_local0_sec_expect:
	.word	0x465c0000,0xff0000ff,0xff000000,0x69000000 ! PA = 0000000030001400
	.word	0x000000ff,0x89ff5cff,0x0da36aca,0x2f5af973 ! PA = 0000000030001410
	.word	0x757fa85b,0x2618b889,0xc1bcece7,0x7569f2af ! PA = 0000000030001420
	.word	0x02c30000,0x55ecbcc1,0x11d206a2,0x02e7deeb ! PA = 0000000030001430
!	Scratch Area for Non-Transactional Memory Stores
	.word	0x4a1ac11e,0x6657ed2f,0x0adeadc2,0xb03f889b
	.word	0x09121086,0xa4109267,0x95ff626a,0x2f3dd593
	.word	0xe03d246e,0x6651351f,0x0e601f92,0xf95a6c0b
	.word	0x3a4fa4d6,0xf303cd57,0x0ecbcd3a,0xfcfd0403
p0_local1_expect:
	.word	0x000000ff,0x00000000,0xffffffff,0xffffffff ! PA = 0000000010041400
	.word	0x455ca907,0xc43da825,0x2a039126,0x000050d7 ! PA = 0000000010041410
	.word	0xfffcc3ff,0x1c576869,0x000003c4,0x7569f2ff ! PA = 0000000010041420
	.word	0x2e43aea4,0x00006400,0xcb62e463,0x00000000 ! PA = 0000000010041430
p0_local1_sec_expect:
	.word	0x7bd47808,0x00000000,0x29b68648,0x00005c46 ! PA = 0000000030041400
	.word	0x38ffffff,0xff000000,0x53915c46,0x000039e7 ! PA = 0000000030041410
	.word	0x1c576869,0x00ff0000,0x7fffff00,0x7fffff00 ! PA = 0000000030041420
	.word	0x0000032a,0x1c576869,0x39e71470,0x023c9854 ! PA = 0000000030041430
p0_local2_expect:
	.word	0x000000ff,0x00000000,0x00000000,0xffff0000 ! PA = 0000000010081400
	.word	0x0000571c,0x6968571c,0x00000000,0x00ff50d7 ! PA = 0000000010081410
	.word	0xfffcc3ff,0x1c576869,0x00000000,0x7569f2ff ! PA = 0000000010081420
	.word	0x2e43aea4,0xffffffff,0xcb62e463,0x00000000 ! PA = 0000000010081430
p0_local2_sec_expect:
	.word	0x00000000,0xc4576869,0x38ffffff,0xffffffff ! PA = 0000000030081400
	.word	0xff00ff00,0xff010000,0xffffffff,0x2691032a ! PA = 0000000030081410
	.word	0x6968571c,0x7569f2af,0xaff26975,0xe7ecbcc1 ! PA = 0000000030081420
	.word	0x00000000,0xa4ae432e,0x39000000,0x000003ff ! PA = 0000000030081430
p0_local3_expect:
	.word	0xffffff7f,0x00000000,0x5c45ffff,0x00000000 ! PA = 00000000100c1400
	.word	0x0000a907,0xc43da825,0x00000000,0x00001019 ! PA = 00000000100c1410
	.word	0x00000000,0xff00ff62,0x00000000,0x1c576869 ! PA = 00000000100c1420
	.word	0x00000000,0x0000ffc1,0x22000001,0x00000000 ! PA = 00000000100c1430
p0_local3_sec_expect:
	.word	0xf6000000,0x00000000,0x00ff0000,0x000000ff ! PA = 00000000300c1400
	.word	0xffffffff,0xffffffff,0x13d17938,0xeac6fb48 ! PA = 00000000300c1410
	.word	0x29b68648,0x7bd47808,0xff00780d,0x00ef007d ! PA = 00000000300c1420
	.word	0x25a83dc4,0x07a95c45,0x8b7a2f3c,0x3cb98a40 ! PA = 00000000300c1430
p0_local4_expect:
	.word	0x00005c46,0x00000000,0x00000000,0x000003ff ! PA = 0000000010101400
	.word	0x7fffffff,0x00000000,0xff000000,0x00000000 ! PA = 0000000010101410
	.word	0xc4030000,0x00000000,0xaff2ff75,0xf6000000 ! PA = 0000000010101420
	.word	0x00000000,0xc4576869,0x00000000,0x000000ff ! PA = 0000000010101430
p0_local4_sec_expect:
	.word	0xffffffff,0x4886b629,0x89000000,0x000000ff ! PA = 0000000030101400
	.word	0x000000f6,0x000000ff,0x00000000,0x000000ff ! PA = 0000000030101410
	.word	0xfffcc3ff,0x1c576869,0x41737136,0x7569f2af ! PA = 0000000030101420
	.word	0xffffffff,0xffff83ef,0x00ff0000,0x63e462cb ! PA = 0000000030101430
p0_local5_expect:
	.word	0x7f000000,0x000000ff,0x00000000,0x00000000 ! PA = 0000000010141400
	.word	0x00000000,0x46000000,0x00000000,0xffffff7f ! PA = 0000000010141410
	.word	0x39ff0000,0x000003c4,0x53915c46,0x3900d900 ! PA = 0000000010141420
	.word	0x696857c4,0x00000000,0x00000000,0xf6000000 ! PA = 0000000010141430
p0_local5_sec_expect:
	.word	0x455ca907,0x00000000,0x00ffffff,0xffffffff ! PA = 0000000030141400
	.word	0x00000000,0xff000000,0x00000000,0x000000ff ! PA = 0000000030141410
	.word	0xfffcc3ff,0x1c576869,0x41737136,0x7569f2af ! PA = 0000000030141420
	.word	0x00000000,0x00000000,0x54983c02,0x63e462cb ! PA = 0000000030141430
p0_local6_expect:
	.word	0x65d8ffef,0x00000000,0x25a83dc4,0x00000000 ! PA = 0000000010181400
	.word	0x1c57ff39,0x00000000,0x53915c45,0x6f3e780d ! PA = 0000000010181410
	.word	0x00000050,0x00000000,0x53915c46,0x3900d900 ! PA = 0000000010181420
	.word	0x38ffffff,0x00000000,0xcb62e463,0x00000000 ! PA = 0000000010181430
p0_local6_sec_expect:
	.word	0x00000000,0xff000000,0x00000000,0x00000000 ! PA = 0000000030181400
	.word	0x455c6869,0xffffffff,0xff0000ff,0x2691032a ! PA = 0000000030181410
	.word	0x6968571c,0xaff269f5,0xfff26975,0xc4030000 ! PA = 0000000030181420
	.word	0x00640000,0xa4ae432e,0x00000000,0x000000ff ! PA = 0000000030181430
share0_expect:
	.word	0x00ff56b0,0x17dd8e01,0x7798a16e,0x521adf07 ! PA = 00000000201c0000
	.word	0x6add529c,0x7e4336bd,0x5d2501ba,0x6e631ea3 ! PA = 00000000201c0010
	.word	0x6ba62248,0x4ff90c39,0x471de3c6,0x1089c0ff ! PA = 00000000201c0020
	.word	0x4dd711b4,0x0dbfaa75,0x102ff392,0x6aad421b ! PA = 00000000201c0030
share1_expect:
	.word	0x5c462ce0,0x4a8a6d71,0x3db79d1e,0x1e04ddf7 ! PA = 0000000020800000
	.word	0x0c4b3fcc,0x52fb712d,0x2bcd0c6a,0x3f3c9093 ! PA = 0000000020800010
	.word	0x5b81d678,0x3d9f91a9,0x07102d76,0x599115ef ! PA = 0000000020800020
	.word	0x509f3ce4,0x3fea6ae5,0x0034ac42,0x2cabea0b ! PA = 0000000020800030
	.word	0xffff7f10,0x63f258e1,0x654df4ce,0x213f48e7 ! PA = 0000000020800040
	.word	0x709468fc,0x7aec779d,0x0cdb331a,0x30622e83 ! PA = 0000000020800050
	.word	0x62ed86a8,0x6868a319,0x3e935326,0x39ac56df ! PA = 0000000020800060
	.word	0x06c82414,0x224d7755,0x05f100f2,0x04123dfb ! PA = 0000000020800070
share2_expect:
	.word	0xff894d40,0x01945051,0x1a7ea87e,0x65811fd7 ! PA = 00000000211c0000
	.word	0x7c33ce2c,0x3fc54a0d,0x49e275ca,0x4d3af873 ! PA = 00000000211c0010
	.word	0x135432d8,0x3d334089,0x0faa54d6,0x2cf283cf ! PA = 00000000211c0020
	.word	0x01acc744,0x6bf7cfc5,0x46d7f1a2,0x7ca73deb ! PA = 00000000211c0030
share3_expect:
	.word	0xf6ff9770,0x7baf53c1,0x212cb82e,0x554162c7 ! PA = 0000000021800000
	.word	0x79646f5c,0x21f4e87d,0x5035d47a,0x5dedee63 ! PA = 0000000021800010
	.word	0x4fe0db08,0x1b9e69f9,0x0c183286,0x083a9cbf ! PA = 0000000021800020
	.word	0x50682674,0x42b87435,0x641c7e52,0x56f1e9db ! PA = 0000000021800030
	.word	0x00ff5da0,0x55426331,0x04fb23de,0x2bb711b7 ! PA = 0000000021800040
	.word	0x48214c8c,0x48aa52ed,0x60e84f2a,0x57621053 ! PA = 0000000021800050
	.word	0x7d7e7f38,0x46091f69,0x655fec36,0x691ba1af ! PA = 0000000021800060
	.word	0x2fd541a4,0x2b1e64a5,0x2ab1a702,0x783941cb ! PA = 0000000021800070
	.word	0xa8259fd0,0x2c0c7ea1,0x494ceb8e,0x64d92ca7 ! PA = 0000000021800080
	.word	0x0e2565bc,0x71d4895d,0x40cce5da,0x4b3e5e43 ! PA = 0000000021800090
	.word	0x32d81f68,0x519260d9,0x1cc481e6,0x25ec929f ! PA = 00000000218000a0
	.word	0x3a8f18d4,0x7878a115,0x434a6bb2,0x5a8445bb ! PA = 00000000218000b0
	.word	0x00005e00,0x288ca611,0x19450f3e,0x2d5eb397 ! PA = 00000000218000c0
	.word	0x66ebbaec,0x62228bcd,0x6876988a,0x57e9d833 ! PA = 00000000218000d0
	.word	0x6858bb98,0x16192e49,0x3348f396,0x3dc46f8f ! PA = 00000000218000e0
	.word	0x18f0ac04,0x3cd62985,0x6259cc62,0x7c99f5ab ! PA = 00000000218000f0
	.word	0x00009830,0x6e01d981,0x77c68eee,0x52bea687 ! PA = 0000000021800100
	.word	0x13af4c1c,0x55035a3d,0x3438673a,0x188b7e23 ! PA = 0000000021800110
	.word	0x282b53c8,0x1e3c87b9,0x59b04146,0x487a387f ! PA = 0000000021800120
	.word	0x3114fb34,0x3905fdf5,0x7812c912,0x5201519b ! PA = 0000000021800130
	.word	0xffff4e60,0x0a6b18f1,0x6f746a9e,0x33300577 ! PA = 0000000021800140
	.word	0x2b6b194c,0x6ca5f4ad,0x142551ea,0x150a5013 ! PA = 0000000021800150
	.word	0x3e3ae7f8,0x175b6d29,0x207d6af6,0x66a4ed6f ! PA = 0000000021800160
	.word	0x56d70664,0x4c971e65,0x606861c2,0x3301598b ! PA = 0000000021800170
	.word	0xffff8090,0x66876461,0x42b1a24e,0x2da9d067 ! PA = 0000000021800180
	.word	0x4ada227c,0x21f95b1d,0x3c10589a,0x320d4e03 ! PA = 0000000021800190
	.word	0x68327828,0x4194de99,0x27f370a6,0x319b8e5f ! PA = 00000000218001a0
	.word	0x7bd1cd94,0x65d88ad5,0x130d9672,0x4ca10d7b ! PA = 00000000218001b0
	.word	0x48ff2ec0,0x35d5bbd1,0x1ba135fe,0x11e30757 ! PA = 00000000218001c0
	.word	0x447767ac,0x34ac8d8d,0x538c7b4a,0x20fb77f3 ! PA = 00000000218001d0
	.word	0x057d0458,0x5fc7dc09,0x50155256,0x2b751b4f ! PA = 00000000218001e0
	.word	0x5f6050c4,0x71d94345,0x53756722,0x10a76d6b ! PA = 00000000218001f0
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
	.word	0x097e7c10,0x205141e1,0x5c4b99ce,0x13fb39e7	! PA = 0000000010001400
	.word	0x2ab5f5fc,0x50abb09d,0x0745e81a,0x196cef83	! PA = 0000000010001410
	.word	0x62a0a3a8,0x0d392c19,0x58b81826,0x2ffee7df	! PA = 0000000010001420
	.word	0x5781d114,0x46b05055,0x69acd5f2,0x3bf59efb	! PA = 0000000010001430
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
	.word	0x258e8a40,0x09da7951,0x343e8d7e,0x718e50d7	! PA = 0000000030001400
	.word	0x06999b2c,0x4d0fc30d,0x0da36aca,0x2f5af973	! PA = 0000000030001410
	.word	0x197f8fd8,0x06730989,0x4df959d6,0x375e54cf	! PA = 0000000030001420
	.word	0x5552b444,0x66ede8c5,0x11d206a2,0x02e7deeb	! PA = 0000000030001430
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
	.word	0x74471470,0x55ecbcc1,0x417edd2e,0x2d2fd3c7	! PA = 0000000010041400
	.word	0x625e7c5c,0x09daa17d,0x4a1d097a,0x30b32f63	! PA = 0000000010041410
	.word	0x7bd47808,0x595d72f9,0x34617786,0x734fadbf	! PA = 0000000010041420
	.word	0x274a5374,0x2151cd35,0x0524d352,0x5d1fcadb	! PA = 0000000010041430
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
	.word	0x17b31aa0,0x5b870c31,0x13af88de,0x7616c2b7	! PA = 0000000030041400
	.word	0x41ff998c,0x423b4bed,0x41c5c42a,0x465c9153	! PA = 0000000030041410
	.word	0x528a5c38,0x1c576869,0x41737136,0x7569f2af	! PA = 0000000030041420
	.word	0x2e43aea4,0x0e6afda5,0x54983c02,0x63e462cb	! PA = 0000000030041430
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
	.word	0x4b9d9cd0,0x0c6867a1,0x3233908e,0x3c3a1da7	! PA = 0000000010081400
	.word	0x6f37f2bc,0x4820c25d,0x7d709ada,0x35fe1f43	! PA = 0000000010081410
	.word	0x184c3c68,0x387fe9d9,0x7a7246e6,0x0804239f	! PA = 0000000010081420
	.word	0x28d9c5d4,0x15887a15,0x6cdf40b2,0x453ca6bb	! PA = 0000000010081430
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
	.word	0x15919b00,0x650fcf11,0x4c2df43e,0x2050e497	! PA = 0000000030081400
	.word	0x298287ec,0x743a04cd,0x39b08d8a,0x51fed933	! PA = 0000000030081410
	.word	0x29851898,0x59b5f749,0x6460f896,0x1e35408f	! PA = 0000000030081420
	.word	0x63679904,0x5cb94285,0x466ce162,0x33ef96ab	! PA = 0000000030081430
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
	.word	0x74da1530,0x5cbc4281,0x6881b3ee,0x63d21787	! PA = 00000000100c1400
	.word	0x561a591c,0x15f6133d,0x16d89c3a,0x6985bf23	! PA = 00000000100c1410
	.word	0x745ff0c8,0x5e9890b9,0x34028646,0x43d4497f	! PA = 00000000100c1420
	.word	0x68082834,0x38cc56f5,0x15741e12,0x5784329b	! PA = 00000000100c1430
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
	.word	0x12820b60,0x556cc1f1,0x15d1cf9e,0x58f4b677	! PA = 00000000300c1400
	.word	0x2ffa664c,0x6383edad,0x48fbc6ea,0x3879d113	! PA = 00000000300c1410
	.word	0x28c7c4f8,0x4886b629,0x7dd9eff6,0x0d783e6f	! PA = 00000000300c1420
	.word	0x2e967364,0x1d50b765,0x79e7f6c2,0x3c417a8b	! PA = 00000000300c1430
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
	.word	0x71547d90,0x0be04d61,0x1a81474e,0x52afc167	! PA = 0000000010101400
	.word	0x77ddaf7c,0x69d2941d,0x47ed0d9a,0x57820f03	! PA = 0000000010101410
	.word	0x68679528,0x2b9f6799,0x662a35a6,0x08781f5f	! PA = 0000000010101420
	.word	0x4cad7a94,0x0c9563d5,0x2f7b6b72,0x432e6e7b	! PA = 0000000010101430
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
	.word	0x1ddc6bc0,0x0795e4d1,0x24b31afe,0x14ba3857	! PA = 0000000030101400
	.word	0x243f34ac,0x7c91068d,0x7f3f704a,0x2c0578f3	! PA = 0000000030101410
	.word	0x76aa6158,0x1ec1a509,0x50f65756,0x2aeaec4f	! PA = 0000000030101420
	.word	0x25a83dc4,0x07a95c45,0x3da17c22,0x12120e6b	! PA = 0000000030101430
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
	.word	0x5e64d5f0,0x0acc8841,0x7a4a4aae,0x438b1b47	! PA = 0000000010141400
	.word	0x1159f5dc,0x262e44fd,0x7e45eefa,0x582b0ee3	! PA = 0000000010141410
	.word	0x68bb2988,0x2b8c6e79,0x12015506,0x43a7a53f	! PA = 0000000010141420
	.word	0x1aa1bcf4,0x7e5ba0b5,0x278d28d2,0x03735a5b	! PA = 0000000010141430
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
	.word	0x62f8bc20,0x028337b1,0x28e9d65e,0x54596a37	! PA = 0000000030141400
	.word	0x3128f30c,0x17d94f6d,0x281389aa,0x2ad9d0d3	! PA = 0000000030141410
	.word	0x5584edb8,0x3e5ec3e9,0x1cce2eb6,0x6a454a2f	! PA = 0000000030141420
	.word	0x3a74f824,0x3f3b3125,0x1c317182,0x1699524b	! PA = 0000000030141430
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
	.word	0x75631e50,0x7678f321,0x35f4be0e,0x7d1c2527	! PA = 0000000010181400
	.word	0x3b672c3c,0x198125dd,0x637b405a,0x0fb8bec3	! PA = 0000000010181410
	.word	0x05b2ade8,0x1657a559,0x349fe466,0x6f1adb1f	! PA = 0000000010181420
	.word	0x71bcef54,0x67970d95,0x26415632,0x5f8af63b	! PA = 0000000010181430
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
	.word	0x292efc80,0x792cba91,0x4e8e01be,0x248a4c17	! PA = 0000000030181400
	.word	0x5d8fa16c,0x79d4c84d,0x4b10130a,0x7f2ed8b3	! PA = 0000000030181410
	.word	0x23af6a18,0x355612c9,0x1c797616,0x4b3f580f	! PA = 0000000030181420
	.word	0x3ad4a284,0x537e3605,0x5c2fd6e2,0x770f462b	! PA = 0000000030181430
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
	.word	0x0ba756b0,0x17dd8e01,0x7798a16e,0x521adf07	! PA = 00000000201c0000
	.word	0x6add529c,0x7e4336bd,0x5d2501ba,0x6e631ea3	! PA = 00000000201c0010
	.word	0x6ba62248,0x4ff90c39,0x471de3c6,0x1089c0ff	! PA = 00000000201c0020
	.word	0x4dd711b4,0x0dbfaa75,0x102ff392,0x6aad421b	! PA = 00000000201c0030
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
	.word	0x53d72ce0,0x4a8a6d71,0x3db79d1e,0x1e04ddf7	! PA = 0000000020800000
	.word	0x0c4b3fcc,0x52fb712d,0x2bcd0c6a,0x3f3c9093	! PA = 0000000020800010
	.word	0x5b81d678,0x3d9f91a9,0x07102d76,0x599115ef	! PA = 0000000020800020
	.word	0x509f3ce4,0x3fea6ae5,0x0034ac42,0x2cabea0b	! PA = 0000000020800030
	.word	0x12897f10,0x63f258e1,0x654df4ce,0x213f48e7	! PA = 0000000020800040
	.word	0x709468fc,0x7aec779d,0x0cdb331a,0x30622e83	! PA = 0000000020800050
	.word	0x62ed86a8,0x6868a319,0x3e935326,0x39ac56df	! PA = 0000000020800060
	.word	0x06c82414,0x224d7755,0x05f100f2,0x04123dfb	! PA = 0000000020800070
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
	.word	0x62494d40,0x01945051,0x1a7ea87e,0x65811fd7	! PA = 00000000211c0000
	.word	0x7c33ce2c,0x3fc54a0d,0x49e275ca,0x4d3af873	! PA = 00000000211c0010
	.word	0x135432d8,0x3d334089,0x0faa54d6,0x2cf283cf	! PA = 00000000211c0020
	.word	0x01acc744,0x6bf7cfc5,0x46d7f1a2,0x7ca73deb	! PA = 00000000211c0030
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
	.word	0x17619770,0x7baf53c1,0x212cb82e,0x554162c7	! PA = 0000000021800000
	.word	0x79646f5c,0x21f4e87d,0x5035d47a,0x5dedee63	! PA = 0000000021800010
	.word	0x4fe0db08,0x1b9e69f9,0x0c183286,0x083a9cbf	! PA = 0000000021800020
	.word	0x50682674,0x42b87435,0x641c7e52,0x56f1e9db	! PA = 0000000021800030
	.word	0x6fdd5da0,0x55426331,0x04fb23de,0x2bb711b7	! PA = 0000000021800040
	.word	0x48214c8c,0x48aa52ed,0x60e84f2a,0x57621053	! PA = 0000000021800050
	.word	0x7d7e7f38,0x46091f69,0x655fec36,0x691ba1af	! PA = 0000000021800060
	.word	0x2fd541a4,0x2b1e64a5,0x2ab1a702,0x783941cb	! PA = 0000000021800070
	.word	0x43879fd0,0x2c0c7ea1,0x494ceb8e,0x64d92ca7	! PA = 0000000021800080
	.word	0x0e2565bc,0x71d4895d,0x40cce5da,0x4b3e5e43	! PA = 0000000021800090
	.word	0x32d81f68,0x519260d9,0x1cc481e6,0x25ec929f	! PA = 00000000218000a0
	.word	0x3a8f18d4,0x7878a115,0x434a6bb2,0x5a8445bb	! PA = 00000000218000b0
	.word	0x33eb5e00,0x288ca611,0x19450f3e,0x2d5eb397	! PA = 00000000218000c0
	.word	0x66ebbaec,0x62228bcd,0x6876988a,0x57e9d833	! PA = 00000000218000d0
	.word	0x6858bb98,0x16192e49,0x3348f396,0x3dc46f8f	! PA = 00000000218000e0
	.word	0x18f0ac04,0x3cd62985,0x6259cc62,0x7c99f5ab	! PA = 00000000218000f0
	.word	0x5c539830,0x6e01d981,0x77c68eee,0x52bea687	! PA = 0000000021800100
	.word	0x13af4c1c,0x55035a3d,0x3438673a,0x188b7e23	! PA = 0000000021800110
	.word	0x282b53c8,0x1e3c87b9,0x59b04146,0x487a387f	! PA = 0000000021800120
	.word	0x3114fb34,0x3905fdf5,0x7812c912,0x5201519b	! PA = 0000000021800130
	.word	0x01cb4e60,0x0a6b18f1,0x6f746a9e,0x33300577	! PA = 0000000021800140
	.word	0x2b6b194c,0x6ca5f4ad,0x142551ea,0x150a5013	! PA = 0000000021800150
	.word	0x3e3ae7f8,0x175b6d29,0x207d6af6,0x66a4ed6f	! PA = 0000000021800160
	.word	0x56d70664,0x4c971e65,0x606861c2,0x3301598b	! PA = 0000000021800170
	.word	0x431d8090,0x66876461,0x42b1a24e,0x2da9d067	! PA = 0000000021800180
	.word	0x4ada227c,0x21f95b1d,0x3c10589a,0x320d4e03	! PA = 0000000021800190
	.word	0x68327828,0x4194de99,0x27f370a6,0x319b8e5f	! PA = 00000000218001a0
	.word	0x7bd1cd94,0x65d88ad5,0x130d9672,0x4ca10d7b	! PA = 00000000218001b0
	.word	0x48d52ec0,0x35d5bbd1,0x1ba135fe,0x11e30757	! PA = 00000000218001c0
	.word	0x447767ac,0x34ac8d8d,0x538c7b4a,0x20fb77f3	! PA = 00000000218001d0
	.word	0x057d0458,0x5fc7dc09,0x50155256,0x2b751b4f	! PA = 00000000218001e0
	.word	0x5f6050c4,0x71d94345,0x53756722,0x10a76d6b	! PA = 00000000218001f0
share3_end:
