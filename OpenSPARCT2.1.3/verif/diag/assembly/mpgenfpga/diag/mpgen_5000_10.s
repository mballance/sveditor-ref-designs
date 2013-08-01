/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: mpgen_5000_10.s
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
!	Seed = 626172907
!	Riesling can be on
!	1 Thread, 5000 lines
!	mpgen   created on May 4, 2009 (15:17:56), Version 2.81
!	mpgen_5000l_12.s created on Jun 26, 2009 (17:29:07)
!	RC file : random.rc
!	cmd = /import/n2-tools/release/tools/mpgen/mpgen,1.090504 -rc random.rc -o mpgen_5000l_12 -p 1 -l 5000

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
!	%f0  = 34b16520 765b9cb1 3d5d875e 137bb737
!	%f4  = 406dec0c 171ac46d 6d620aaa 7869add3
!	%f8  = 1fc736b8 361648e9 3fb07fb6 7877b72f
!	%f12 = 43f59124 0605c625 52b09282 69b34f4b
	ldda	[%g1]ASI_BLK_P,%f0
	add	%g1,64,%g1
!	%f16 = 42330750 41839821 4069af0e 4872b227
!	%f20 = 1867653c 0188dadd 5d8f015a 22b0dbc3
!	%f24 = 219436e8 2ca96a59 364b7566 3229881f
!	%f28 = 4600c854 5b0fe295 34cdb732 6135333b
	ldda	[%g1]ASI_BLK_P,%f16
	add	%g1,64,%g1
!	%f32 = 33262580 4b399f91 1d9432be 36651917
!	%f36 = 275b1a6c 4372bd4d 4d79140a 62df35b3
!	%f40 = 1d403318 7c1217c9 657e4716 6f7a450f
!	%f44 = 62ebbb84 6e754b05 505977e2 4499c32b
	ldda	[%g1]ASI_BLK_P,%f32

!	Set up the Graphics Status Register

	setx	0x4a20e3340000002c,%g7,%g1 ! %gsr scale =  5, align = 4
	wr	%g1,%g0,%gsr		! %gsr = 4a20e3340000002c

	wr	%g0,%y			! Clear %y register
	xorcc	%g0,%g0,%g3		! %g3 = 0, %ccr = 44
	membar	#Sync			! Force the block loads to complete

!	Start of Random Code for processor 0

p0_label_1:
!	Starting 10 instruction Store Burst
!	%l5 = 00ee1ab36bffacc5, Mem[000000001018143c] = 10622e4b, %asi = 80
	stwa	%l5,[%i6+0x03c]%asi	! Mem[000000001018143c] = 6bffacc5
!	Mem[0000000010001400] = 6e4cd5e0, %l0 = 00000000dd8133ce
	swapa	[%i0+%g0]0x80,%l0	! %l0 = 000000006e4cd5e0
!	Mem[0000000030141408] = ae96bc1f, %l0 = 000000006e4cd5e0
	ldstuba	[%i5+%o4]0x89,%l0	! %l0 = 000000000000001f
!	%l3 = 056723a239b525ff, Mem[0000000030001410] = fca12103
	stba	%l3,[%i0+%o5]0x89	! Mem[0000000030001410] = fca121ff
!	Mem[0000000030001408] = 6167e5ce, %l6 = 5bafb1c767036ac0
	ldstuba	[%i0+%o4]0x81,%l6	! %l6 = 0000000000000061
!	%l0 = 000000000000001f, Mem[0000000030181400] = 42cf0a50
	stba	%l0,[%i6+%g0]0x81	! Mem[0000000030181400] = 1fcf0a50
!	Mem[00000000300c1400] = 30017c4d, %l4 = 724029d70f23a6da
	ldstuba	[%i3+%g0]0x89,%l4	! %l4 = 000000000000004d
!	%l3 = 056723a239b525ff, Mem[0000000030141400] = f0c1e261
	stba	%l3,[%i5+%g0]0x89	! Mem[0000000030141400] = f0c1e2ff
!	%f21 = 0188dadd, Mem[0000000030001400] = 10685628
	sta	%f21,[%i0+%g0]0x89	! Mem[0000000030001400] = 0188dadd
!	Mem[0000000030041408] = 3d79292e, %l7 = 0bda28798c0ea3cb
	ldstuba	[%i1+%o4]0x81,%l7	! %l7 = 000000000000003d

p0_label_2:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = b1f3402220a80d4f, %f8  = 1fc736b8 361648e9
	ldda	[%i6+%g0]0x88,%f8 	! %f8  = b1f34022 20a80d4f
!	Mem[0000000030041400] = 2e0d0070, %l2 = cd0f6c042ee48734
	ldsha	[%i1+%g0]0x81,%l2	! %l2 = 0000000000002e0d
!	Mem[0000000010141400] = 418357c0 1d5da0d1 015666fe 6650d457
!	Mem[0000000010141410] = 0ea9e0ac 10b5828d 1fd47c4a 6faed4f3
!	Mem[0000000010141420] = 0024cd58 08dee109 3d292356 0e23084f
!	Mem[0000000010141430] = 283e69c4 021b5845 1cde0822 0b14ea6b
	ldda	[%i5+%g0]ASI_BLK_PL,%f0 	! Block Load from 0000000010141400
!	%f5  = ace0a90e, %f10 = 4f08230e, %f23 = 22b0dbc3
	fsubs	%f5 ,%f10,%f23		! %f23 = cf08230e
!	Mem[0000000010001408] = 51904e1e7bd82af7, %l0 = 000000000000001f
	ldxa	[%i0+%o4]0x80,%l0	! %l0 = 51904e1e7bd82af7
!	Mem[0000000010181410] = 6dcbd35f 0c9f6177, %l0 = 7bd82af7, %l1 = 64a1b779
	ldda	[%i6+%o5]0x88,%l0	! %l0 = 000000000c9f6177 000000006dcbd35f
!	%o3 = deadbeefdeadbeef
	set	share3_start,%o3	! set %o3[0] to VA
!	Mem[0000000021800081] = 5baa49a0, %l6 = 0000000000000061, %asi = 80
	lduba	[%o3+0x081]%asi,%l6	! %l6 = 00000000000000aa
!	Mem[00000000100c1410] = 555133ec, %l6 = 00000000000000aa
	ldsha	[%i3+%o5]0x80,%l6	! %l6 = 0000000000005551
!	Mem[0000000030101410] = 1b815b7c, %l7 = 000000000000003d
	lduba	[%i4+%o5]0x81,%l7	! %l7 = 000000000000001b
!	Mem[00000000100c1400] = 118beb4b 00875c51, %l6 = 00005551, %l7 = 0000001b
	ldda	[%i3+%g0]0x88,%l6	! %l6 = 0000000000875c51 00000000118beb4b

p0_label_3:
!	Starting 10 instruction Store Burst
!	%l6 = 0000000000875c51, Mem[0000000010041400] = 057d7640
	stha	%l6,[%i1+%g0]0x80	! Mem[0000000010041400] = 5c517640
!	%l5 = 00ee1ab36bffacc5, Mem[0000000030041410] = 5c281871
	stwa	%l5,[%i1+%o5]0x89	! Mem[0000000030041410] = 6bffacc5
!	%l1 = 000000006dcbd35f, Mem[0000000010001400] = dd8133ce
	stba	%l1,[%i0+%g0]0x80	! Mem[0000000010001400] = 5f8133ce
!	Mem[0000000030181400] = 1fcf0a50 2fd1af21 39450a0e 4a8bc127
!	%f16 = 42330750 41839821 4069af0e 4872b227
!	%f20 = 1867653c 0188dadd 5d8f015a cf08230e
!	%f24 = 219436e8 2ca96a59 364b7566 3229881f
!	%f28 = 4600c854 5b0fe295 34cdb732 6135333b
	stda	%f16,[%i6+%g0]ASI_COMMIT_S	! Block Store to 0000000030181400
!	%l6 = 00875c51, %l7 = 118beb4b, Mem[0000000010101408] = 9e1b177d 7752657d
	stda	%l6,[%i4+%o4]0x88	! Mem[0000000010101408] = 00875c51 118beb4b
	membar	#Sync			! Added by membar checker (1)
!	Mem[0000000010181410] = 77619f0c, %l4 = 000000000000004d
	swapa	[%i6+%o5]0x80,%l4	! %l4 = 0000000077619f0c
!	Mem[0000000030001410] = ff21a1fc, %l1 = 000000006dcbd35f
	swapa	[%i0+%o5]0x81,%l1	! %l1 = 00000000ff21a1fc
!	%l0 = 000000000c9f6177, Mem[0000000030001410] = 9d2c2d665fd3cb6d
	stxa	%l0,[%i0+%o5]0x89	! Mem[0000000030001410] = 000000000c9f6177
!	%l1 = 00000000ff21a1fc, %l4 = 0000000077619f0c, %y  = 00000000
	umul	%l1,%l4,%l1		! %l1 = 76f9ec8c5dab1bd0, %y = 76f9ec8c
!	Mem[0000000030001400] = 0188dadd, %l2 = 0000000000002e0d
	swapa	[%i0+%g0]0x89,%l2	! %l2 = 000000000188dadd

p0_label_4:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = 418357c0, %l3 = 056723a239b525ff
	lduha	[%i5+%g0]0x80,%l3	! %l3 = 0000000000004183
!	Mem[00000000100c1408] = 7915403e, %l6 = 0000000000875c51
	ldsba	[%i3+%o4]0x80,%l6	! %l6 = 0000000000000079
!	Mem[0000000030041410] = c5acff6b, %l1 = 76f9ec8c5dab1bd0
	lduba	[%i1+%o5]0x81,%l1	! %l1 = 00000000000000c5
!	Mem[0000000010141410] = 0ea9e0ac, %l2 = 000000000188dadd
	lduba	[%i5+%o5]0x80,%l2	! %l2 = 000000000000000e
!	%o0 = deadbeefdeadbeef
	set	share0_start,%o0	! set %o0[0] to VA
!	Mem[00000000201c0000] = 40b1e880, %l1 = 00000000000000c5
	ldsh	[%o0+%g0],%l1		! %l1 = 00000000000040b1
!	Mem[00000000100c1408] = 3e401579, %l6 = 0000000000000079
	lduha	[%i3+%o4]0x88,%l6	! %l6 = 0000000000001579
!	Mem[0000000010181410] = 0000004d, %l2 = 000000000000000e
	ldsha	[%i6+%o5]0x80,%l2	! %l2 = 0000000000000000
!	%o1 = deadbeefdeadbeef
	set	share1_start,%o1	! set %o1[0] to VA
!	Mem[0000000020800040] = 79c818e0, %l3 = 0000000000004183
	lduh	[%o1+0x040],%l3		! %l3 = 00000000000079c8
!	Mem[00000000300c1408] = eeff3743, %l0 = 000000000c9f6177
	ldsba	[%i3+%o4]0x89,%l0	! %l0 = 0000000000000043
!	Mem[00000000100c1410] = 555133ec, %l0 = 0000000000000043
	ldswa	[%i3+%o5]0x80,%l0	! %l0 = 00000000555133ec

p0_label_5:
!	Starting 10 instruction Store Burst
!	%l6 = 0000000000001579, %l4 = 0000000077619f0c, %l5 = 00ee1ab36bffacc5
	udivx	%l6,%l4,%l5		! %l5 = 0000000000000000
!	Mem[0000000010001408] = 51904e1e, %l5 = 0000000000000000
	swapa	[%i0+%o4]0x80,%l5	! %l5 = 0000000051904e1e
!	%l3 = 00000000000079c8, Mem[0000000030101408] = 4e93155d
	stwa	%l3,[%i4+%o4]0x89	! Mem[0000000030101408] = 000079c8
!	%l6 = 0000000000001579, Mem[0000000030001408] = cee567ff
	stba	%l6,[%i0+%o4]0x89	! Mem[0000000030001408] = cee56779
!	%l0 = 00000000555133ec, Mem[0000000010081408] = ded43841
	stwa	%l0,[%i2+%o4]0x88	! Mem[0000000010081408] = 555133ec
!	%l6 = 00001579, %l7 = 118beb4b, Mem[00000000300c1408] = 4337ffee 534fb387
	stda	%l6,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00001579 118beb4b
!	%l0 = 00000000555133ec, Mem[0000000030001408] = cee56779
	stha	%l0,[%i0+%o4]0x89	! Mem[0000000030001408] = cee533ec
!	Mem[0000000010181400] = 4f0da820, %l4 = 0000000077619f0c, %asi = 80
	swapa	[%i6+0x000]%asi,%l4	! %l4 = 000000004f0da820
!	Mem[0000000030001400] = 0d2e0000, %l3 = 00000000000079c8
	swapa	[%i0+%g0]0x81,%l3	! %l3 = 000000000d2e0000
!	%f20 = 1867653c, Mem[00000000300c1410] = 0a70051c
	sta	%f20,[%i3+%o5]0x81	! Mem[00000000300c1410] = 1867653c

p0_label_6:
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = ae96bcff, %l4 = 000000004f0da820
	ldswa	[%i5+%o4]0x89,%l4	! %l4 = ffffffffae96bcff
!	Mem[0000000021800040] = 14978370, %l6 = 0000000000001579
	ldub	[%o3+0x040],%l6		! %l6 = 0000000000000014
!	Mem[0000000010001420] = 04a11f782aa016a9, %l0 = 00000000555133ec
	ldx	[%i0+0x020],%l0		! %l0 = 04a11f782aa016a9
!	Mem[0000000010041408] = 1d69d97e, %l7 = 00000000118beb4b
	lduba	[%i1+%o4]0x80,%l7	! %l7 = 000000000000001d
!	Mem[00000000100c1410] = ec335155, %l3 = 000000000d2e0000
	lduha	[%i3+%o5]0x88,%l3	! %l3 = 0000000000005155
!	Mem[0000000010141410] = 0ea9e0ac, %l5 = 0000000051904e1e
	ldswa	[%i5+%o5]0x80,%l5	! %l5 = 000000000ea9e0ac
!	Mem[0000000010141410] = 8d82b510 ace0a90e, %l2 = 00000000, %l3 = 00005155
	ldda	[%i5+%o5]0x88,%l2	! %l2 = 00000000ace0a90e 000000008d82b510
!	Mem[0000000030141408] = ffbc96ae, %l7 = 000000000000001d
	lduba	[%i5+%o4]0x81,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030001410] = 77619f0c, %l6 = 0000000000000014
	lduwa	[%i0+%o5]0x81,%l6	! %l6 = 0000000077619f0c
!	Mem[000000001008143d] = 54953ecb, %l7 = 00000000000000ff, %asi = 80
	ldsba	[%i2+0x03d]%asi,%l7	! %l7 = ffffffffffffff95

p0_label_7:
!	Starting 10 instruction Store Burst
!	%f5  = ace0a90e, Mem[00000000300c1410] = 1867653c
	sta	%f5 ,[%i3+%o5]0x81	! Mem[00000000300c1410] = ace0a90e
!	Mem[000000001008140c] = 0d3b5eb7, %l0 = 000000002aa016a9, %asi = 80
	swapa	[%i2+0x00c]%asi,%l0	! %l0 = 000000000d3b5eb7
!	%l6 = 77619f0c, %l7 = ffffff95, Mem[0000000010041420] = 0c41fbd8 47b84589
	std	%l6,[%i1+0x020]		! Mem[0000000010041420] = 77619f0c ffffff95
!	%l4 = ffffffffae96bcff, Mem[0000000010181410] = 4d000000
	stwa	%l4,[%i6+%o5]0x88	! Mem[0000000010181410] = ae96bcff
!	Mem[0000000030101400] = 9069e44d, %l1 = 00000000000040b1
	swapa	[%i4+%g0]0x89,%l1	! %l1 = 000000009069e44d
!	Mem[00000000100c1432] = 05e1c504, %l3 = 000000008d82b510
	ldstuba	[%i3+0x032]%asi,%l3	! %l3 = 00000000000000c5
!	Mem[0000000030141408] = ae96bcff, %l4 = ffffffffae96bcff
	ldstuba	[%i5+%o4]0x89,%l4	! %l4 = 00000000000000ff
!	%l5 = 000000000ea9e0ac, Mem[0000000030041400] = 2e0d007049f778c1
	stxa	%l5,[%i1+%g0]0x81	! Mem[0000000030041400] = 000000000ea9e0ac
!	Mem[0000000030141408] = ffbc96ae, %l6 = 0000000077619f0c
	ldstuba	[%i5+%o4]0x81,%l6	! %l6 = 00000000000000ff
!	%f20 = 1867653c 0188dadd, Mem[0000000030141410] = 374ba1dc 275dc0fd
	stda	%f20,[%i5+%o5]0x81	! Mem[0000000030141410] = 1867653c 0188dadd

p0_label_8:
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = 50073342, %l3 = 00000000000000c5
	lduwa	[%i6+%g0]0x89,%l3	! %l3 = 0000000050073342
!	Mem[00000000100c1408] = 7915403e, %l1 = 000000009069e44d
	lduba	[%i3+%o4]0x80,%l1	! %l1 = 0000000000000079
!	Mem[000000001010143b] = 66a682c2, %l1 = 0000000000000079, %asi = 80
	ldsba	[%i4+0x03b]%asi,%l1	! %l1 = ffffffffffffffc2
!	Mem[0000000010141408] = 015666fe6650d457, %l1 = ffffffffffffffc2
	ldxa	[%i5+%o4]0x80,%l1	! %l1 = 015666fe6650d457
!	Mem[0000000010181400] = 0c9f6177, %l0 = 000000000d3b5eb7
	lduwa	[%i6+%g0]0x88,%l0	! %l0 = 000000000c9f6177
!	Mem[0000000010081410] = 8c45000b, %l3 = 0000000050073342
	ldsba	[%i2+%o5]0x88,%l3	! %l3 = 000000000000000b
!	Mem[0000000030001410] = 77619f0c, %l1 = 015666fe6650d457
	lduha	[%i0+%o5]0x81,%l1	! %l1 = 0000000000007761
!	Mem[0000000030181400] = 42330750, %l5 = 000000000ea9e0ac
	ldsba	[%i6+%g0]0x81,%l5	! %l5 = 0000000000000042
!	Mem[0000000030041410] = c5acff6b, %l6 = 00000000000000ff
	ldsha	[%i1+%o5]0x81,%l6	! %l6 = ffffffffffffc5ac
!	Mem[0000000010041410] = 3fcc472c, %l5 = 0000000000000042
	ldswa	[%i1+%o5]0x80,%l5	! %l5 = 000000003fcc472c

p0_label_9:
!	Starting 10 instruction Store Burst
!	Mem[0000000010041410] = 3fcc472c, %l6 = 00000000ffffc5ac
	swapa	[%i1+%o5]0x80,%l6	! %l6 = 000000003fcc472c
!	Mem[0000000010141400] = 418357c0, %l2 = 00000000ace0a90e
	ldstuba	[%i5+%g0]0x80,%l2	! %l2 = 0000000000000041
!	Mem[00000000100c140c] = 069b8097, %l7 = ffffff95, %l5 = 3fcc472c
	add	%i3,0x0c,%g1
	casa	[%g1]0x80,%l7,%l5	! %l5 = 00000000069b8097
!	Mem[0000000010001410] = 5cdd38cc, %l7 = ffffffffffffff95
	ldstuba	[%i0+%o5]0x80,%l7	! %l7 = 000000000000005c
!	%l0 = 000000000c9f6177, Mem[0000000010181400] = 77619f0c
	stwa	%l0,[%i6+%g0]0x80	! Mem[0000000010181400] = 0c9f6177
!	%l4 = 000000ff, %l5 = 069b8097, Mem[0000000010181400] = 0c9f6177 2240f3b1
	std	%l4,[%i6+%g0]		! Mem[0000000010181400] = 000000ff 069b8097
!	Mem[0000000030081410] = 473f9ebc, %l7 = 000000000000005c
	swapa	[%i2+%o5]0x81,%l7	! %l7 = 00000000473f9ebc
!	%l3 = 000000000000000b, %l1 = 0000000000007761, %l4 = 00000000000000ff
	orn	%l3,%l1,%l4		! %l4 = ffffffffffff889f
!	Mem[00000000100c1410] = 555133ec, %l7 = 00000000473f9ebc
	ldstuba	[%i3+%o5]0x80,%l7	! %l7 = 0000000000000055
!	%f14 = 6bea140b, Mem[0000000010081408] = 555133ec
	sta	%f14,[%i2+%o4]0x88	! Mem[0000000010081408] = 6bea140b

p0_label_10:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = ace0a90e, %l1 = 0000000000007761
	lduba	[%i5+%o5]0x88,%l1	! %l1 = 000000000000000e
!	Mem[0000000010081410] = 8c45000b, %l2 = 0000000000000041
	lduwa	[%i2+%o5]0x88,%l2	! %l2 = 000000008c45000b
!	Code Fragment 3, seed = 64913
p0_fragment_1:
!	%l0 = 000000000c9f6177
	setx	0x253a43501516ec9e,%g7,%l0 ! %l0 = 253a43501516ec9e
!	%l1 = 000000000000000e
	setx	0x5fe533cb05565749,%g7,%l1 ! %l1 = 5fe533cb05565749
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 253a43501516ec9e
	setx	0x29c30a4785cf5e04,%g7,%l0 ! %l0 = 29c30a4785cf5e04
!	%l1 = 5fe533cb05565749
	setx	0x82d83280568c83cf,%g7,%l1 ! %l1 = 82d83280568c83cf
p0_fragment_1_end:
!	Mem[0000000030181408] = 27b272480eaf6940, %f6  = f3d4ae6f 4a7cd41f
	ldda	[%i6+%o4]0x89,%f6 	! %f6  = 27b27248 0eaf6940
!	Mem[00000000300c1408] = 79150000, %l3 = 000000000000000b
	ldswa	[%i3+%o4]0x89,%l3	! %l3 = 0000000079150000
!	Mem[00000000201c0000] = 40b1e880, %l6 = 000000003fcc472c
	lduh	[%o0+%g0],%l6		! %l6 = 00000000000040b1
!	Mem[0000000030001408] = ec33e5ce, %l5 = 00000000069b8097
	ldsha	[%i0+%o4]0x81,%l5	! %l5 = ffffffffffffec33
!	Mem[0000000010041410] = ffffc5ac17dc3f0d, %f14 = 6bea140b 2208de1c
	ldda	[%i1+%o5]0x80,%f14	! %f14 = ffffc5ac 17dc3f0d
!	Mem[0000000010081410] = 0b00458c, %l7 = 0000000000000055
	lduba	[%i2+%o5]0x80,%l7	! %l7 = 000000000000000b
!	Mem[0000000020800000] = 460142b0, %l7 = 000000000000000b, %asi = 80
	ldsha	[%o1+0x000]%asi,%l7	! %l7 = 0000000000004601

p0_label_11:
!	Starting 10 instruction Store Burst
!	Mem[0000000030001408] = cee533ec, %l2 = 000000008c45000b
	swapa	[%i0+%o4]0x89,%l2	! %l2 = 00000000cee533ec
!	%f24 = 219436e8 2ca96a59, %l6 = 00000000000040b1
!	Mem[0000000030141438] = 3c28b4d274f9365b
	add	%i5,0x038,%g1
	stda	%f24,[%g1+%l6]ASI_PST32_S ! Mem[0000000030141438] = 3c28b4d22ca96a59
!	Mem[0000000010181400] = 000000ff069b8097, %l2 = 00000000cee533ec, %l7 = 0000000000004601
	casxa	[%i6]0x80,%l2,%l7	! %l7 = 000000ff069b8097
!	%f5  = ace0a90e, Mem[0000000030101408] = 000079c8
	sta	%f5 ,[%i4+%o4]0x89	! Mem[0000000030101408] = ace0a90e
!	%f31 = 6135333b, Mem[0000000030001410] = 77619f0c
	sta	%f31,[%i0+%o5]0x81	! Mem[0000000030001410] = 6135333b
!	%f10 = 4f08230e, Mem[0000000010001400] = 5f8133ce
	st	%f10,[%i0+%g0]		! Mem[0000000010001400] = 4f08230e
!	Mem[0000000010081410] = 0b00458c, %l6 = 00000000000040b1
	swapa	[%i2+%o5]0x80,%l6	! %l6 = 000000000b00458c
!	%f22 = 5d8f015a, Mem[0000000010141424] = 08dee109
	sta	%f22,[%i5+0x024]%asi	! Mem[0000000010141424] = 5d8f015a
!	%l0 = 85cf5e04, %l1 = 568c83cf, Mem[0000000010001408] = 00000000 7bd82af7
	stda	%l0,[%i0+%o4]0x80	! Mem[0000000010001408] = 85cf5e04 568c83cf
!	%f26 = 364b7566 3229881f, %l4 = ffffffffffff889f
!	Mem[00000000300c1418] = 35f0a83a43c61b23
	add	%i3,0x018,%g1
	stda	%f26,[%g1+%l4]ASI_PST32_SL ! Mem[00000000300c1418] = 1f88293266754b36

p0_label_12:
!	Starting 10 instruction Load Burst
!	Mem[0000000030001400] = c8790000, %l0 = 29c30a4785cf5e04
	lduba	[%i0+%g0]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000030041408] = ff79292e, %f26 = 364b7566
	lda	[%i1+%o4]0x81,%f26	! %f26 = ff79292e
!	Mem[0000000010141410] = 0ea9e0ac, %l0 = 0000000000000000
	ldsba	[%i5+%o5]0x80,%l0	! %l0 = 000000000000000e
!	Mem[0000000030181408] = 0eaf6940, %l6 = 000000000b00458c
	ldsba	[%i6+%o4]0x89,%l6	! %l6 = 0000000000000040
!	Mem[0000000030041410] = c5acff6b, %l0 = 000000000000000e
	ldswa	[%i1+%o5]0x81,%l0	! %l0 = ffffffffc5acff6b
!	Mem[0000000010141408] = 015666fe6650d457, %f6  = 27b27248 0eaf6940
	ldda	[%i5+%o4]0x80,%f6 	! %f6  = 015666fe 6650d457
!	Mem[0000000030041410] = c5acff6b, %l1 = 82d83280568c83cf
	ldsha	[%i1+%o5]0x81,%l1	! %l1 = ffffffffffffc5ac
!	%l5 = ffffffffffffec33, imm = fffffffffffffbc3, %l3 = 0000000079150000
	sub	%l5,-0x43d,%l3		! %l3 = fffffffffffff070
!	Mem[0000000010101410] = 1197124c, %l5 = ffffffffffffec33
	ldswa	[%i4+%o5]0x80,%l5	! %l5 = 000000001197124c
!	Mem[0000000010101408] = 00875c51, %l2 = 00000000cee533ec
	ldsba	[%i4+%o4]0x88,%l2	! %l2 = 0000000000000051

p0_label_13:
!	Starting 10 instruction Store Burst
!	%l7 = 000000ff069b8097, Mem[0000000010181400] = 000000ff
	stwa	%l7,[%i6+%g0]0x80	! Mem[0000000010181400] = 069b8097
!	Mem[0000000030101400] = b1400000, %l3 = fffffffffffff070
	ldstuba	[%i4+%g0]0x81,%l3	! %l3 = 00000000000000b1
!	Mem[0000000010181408] = 35eb225e, %l6 = 0000000000000040
	ldstuba	[%i6+%o4]0x80,%l6	! %l6 = 0000000000000035
!	Mem[0000000010141410] = 0ea9e0ac, %l5 = 000000001197124c
	ldstuba	[%i5+%o5]0x80,%l5	! %l5 = 000000000000000e
!	Mem[0000000010001410] = ffdd38cc, %l1 = ffffffffffffc5ac
	ldstuba	[%i0+%o5]0x80,%l1	! %l1 = 00000000000000ff
!	%l5 = 000000000000000e, Mem[00000000300c1408] = 79150000
	stwa	%l5,[%i3+%o4]0x89	! Mem[00000000300c1408] = 0000000e
!	%l6 = 0000000000000035, Mem[0000000010001410] = ffdd38cc
	stwa	%l6,[%i0+%o5]0x80	! Mem[0000000010001410] = 00000035
!	%l5 = 000000000000000e, Mem[0000000030081408] = 8edc0b20
	stha	%l5,[%i2+%o4]0x89	! Mem[0000000030081408] = 8edc000e
!	Mem[0000000010181400] = 97809b06, %l7 = 00000000069b8097
	swapa	[%i6+%g0]0x88,%l7	! %l7 = 0000000097809b06
!	Mem[00000000300c1408] = 0000000e, %l7 = 0000000097809b06
	ldstuba	[%i3+%o4]0x89,%l7	! %l7 = 000000000000000e

p0_label_14:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = 7915403e069b8097, %l6 = 0000000000000035
	ldxa	[%i3+%o4]0x80,%l6	! %l6 = 7915403e069b8097
!	Mem[0000000010081408] = 0b14ea6b, %l1 = 00000000000000ff
	ldsha	[%i2+%o4]0x80,%l1	! %l1 = 0000000000000b14
!	Mem[0000000030181410] = 1867653c, %l4 = ffffffffffff889f
	ldswa	[%i6+%o5]0x81,%l4	! %l4 = 000000001867653c
!	%f2  = 57d45066, %f29 = 5b0fe295
	fcmps	%fcc2,%f2 ,%f29		! %fcc2 = 1
!	Mem[0000000010101400] = 50baf760583e7df1, %l2 = 0000000000000051
	ldxa	[%i4+%g0]0x80,%l2	! %l2 = 50baf760583e7df1
!	%f30 = 34cdb732, %f27 = 3229881f
	fsqrts	%f30,%f27		! %f27 = 3a224528
!	%l3 = 00000000000000b1, %l5 = 000000000000000e, %y  = 76f9ec8c
	udiv	%l3,%l5,%l3		! %l3 = 00000000ffffffff
	mov	%l0,%y			! %y = c5acff6b
!	Mem[0000000030101410] = 1b815b7c, %l5 = 000000000000000e
	lduwa	[%i4+%o5]0x81,%l5	! %l5 = 000000001b815b7c
!	Mem[0000000030101408] = ace0a90e, %l2 = 50baf760583e7df1
	ldswa	[%i4+%o4]0x89,%l2	! %l2 = fffffffface0a90e
!	%f30 = 34cdb732, %f21 = 0188dadd, %f13 = c4693e28
	fdivs	%f30,%f21,%f13		! %f13 = 72c067ba

p0_label_15:
!	Starting 10 instruction Store Burst
!	Mem[0000000030181410] = 3c656718, %l7 = 000000000000000e
	swapa	[%i6+%o5]0x89,%l7	! %l7 = 000000003c656718
!	%f2  = 57d45066, Mem[0000000010001408] = 85cf5e04
	sta	%f2 ,[%i0+%o4]0x80	! Mem[0000000010001408] = 57d45066
!	Mem[0000000030081400] = 435188d0, %l4 = 000000001867653c
	swapa	[%i2+%g0]0x81,%l4	! %l4 = 00000000435188d0
!	%l6 = 069b8097, %l7 = 3c656718, Mem[00000000100c1410] = ff5133ec 15b280cd
	stda	%l6,[%i3+%o5]0x80	! Mem[00000000100c1410] = 069b8097 3c656718
!	%l1 = 0000000000000b14, Mem[0000000010001428] = 68777e76551482ef
	stx	%l1,[%i0+0x028]		! Mem[0000000010001428] = 0000000000000b14
!	%l6 = 069b8097, %l7 = 3c656718, Mem[0000000010041408] = 1d69d97e 288cecd7
	stda	%l6,[%i1+%o4]0x80	! Mem[0000000010041408] = 069b8097 3c656718
!	%l6 = 7915403e069b8097, Mem[000000001008140a] = 0b14ea6b, %asi = 80
	stba	%l6,[%i2+0x00a]%asi	! Mem[0000000010081408] = 0b14976b
!	%l2 = fffffffface0a90e, Mem[0000000030041408] = 2e2979ff
	stha	%l2,[%i1+%o4]0x89	! Mem[0000000030041408] = 2e29a90e
!	Code Fragment 3, seed = 558048
p0_fragment_2:
!	%l0 = ffffffffc5acff6b
	setx	0xdfd6e4ccf2dd3926,%g7,%l0 ! %l0 = dfd6e4ccf2dd3926
!	%l1 = 0000000000000b14
	setx	0xcd9b8459afab9d51,%g7,%l1 ! %l1 = cd9b8459afab9d51
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = dfd6e4ccf2dd3926
	setx	0x245e9aa4be20658c,%g7,%l0 ! %l0 = 245e9aa4be20658c
!	%l1 = cd9b8459afab9d51
	setx	0x4e2c06fb384b94d7,%g7,%l1 ! %l1 = 4e2c06fb384b94d7
p0_fragment_2_end:
!	%l7 = 000000003c656718, Mem[0000000010181418] = 4f6695aa, %asi = 80
	stwa	%l7,[%i6+0x018]%asi	! Mem[0000000010181418] = 3c656718

p0_label_16:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = 57d45066fe665601, %f20 = 1867653c 0188dadd
	ldda	[%i5+%o4]0x88,%f20	! %f20 = 57d45066 fe665601
!	Mem[00000000300c1408] = ff000000118beb4b, %f4  = 8d82b510 ace0a90e
	ldda	[%i3+%o4]0x81,%f4 	! %f4  = ff000000 118beb4b
!	Mem[0000000030001408] = e7d5864c 8c45000b, %l4 = 435188d0, %l5 = 1b815b7c
	ldda	[%i0+%o4]0x89,%l4	! %l4 = 000000008c45000b 00000000e7d5864c
!	Mem[0000000030141408] = 47b7546dae96bcff, %f30 = 34cdb732 6135333b
	ldda	[%i5+%o4]0x89,%f30	! %f30 = 47b7546d ae96bcff
!	Mem[0000000010101410] = ad69d26a4c129711, %l5 = 00000000e7d5864c
	ldxa	[%i4+%o5]0x88,%l5	! %l5 = ad69d26a4c129711
!	Mem[0000000030001410] = 3b333561, %l4 = 000000008c45000b
	ldswa	[%i0+%o5]0x89,%l4	! %l4 = 000000003b333561
!	Mem[0000000010101418] = 0dd2d2ea, %l5 = ad69d26a4c129711, %asi = 80
	lduwa	[%i4+0x018]%asi,%l5	! %l5 = 000000000dd2d2ea
!	Mem[0000000030041400] = 00000000, %l7 = 000000003c656718
	lduwa	[%i1+%g0]0x81,%l7	! %l7 = 0000000000000000
!	Mem[00000000300c1408] = ff000000, %l5 = 000000000dd2d2ea
	ldsba	[%i3+%o4]0x81,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000010081408] = 6b97140b, %f27 = 3a224528
	lda	[%i2+%o4]0x88,%f27	! %f27 = 6b97140b

p0_label_17:
!	Starting 10 instruction Store Burst
!	%f0  = d1a05d1d c0578341, Mem[0000000030141408] = ae96bcff 47b7546d
	stda	%f0 ,[%i5+%o4]0x89	! Mem[0000000030141408] = d1a05d1d c0578341
!	Mem[0000000030181410] = 0000000e, %l7 = 0000000000000000
	swapa	[%i6+%o5]0x89,%l7	! %l7 = 000000000000000e
!	%f28 = 4600c854 5b0fe295, %l3 = 00000000ffffffff
!	Mem[00000000300c1408] = ff000000118beb4b
	add	%i3,0x008,%g1
	stda	%f28,[%g1+%l3]ASI_PST16_SL ! Mem[00000000300c1408] = 95e20f5b54c80046
!	%l4 = 000000003b333561, Mem[0000000010081410] = 000040b1
	stha	%l4,[%i2+%o5]0x80	! Mem[0000000010081410] = 356140b1
!	Mem[0000000010101418] = 0dd2d2ea7e1d2d13, %l3 = 00000000ffffffff, %l5 = ffffffffffffffff
	add	%i4,0x18,%g1
	casxa	[%g1]0x80,%l3,%l5	! %l5 = 0dd2d2ea7e1d2d13
!	Mem[0000000010001400] = 4f08230e, %l4 = 000000003b333561, %asi = 80
	swapa	[%i0+0x000]%asi,%l4	! %l4 = 000000004f08230e
!	%l4 = 4f08230e, %l5 = 7e1d2d13, Mem[0000000010101408] = 515c8700 4beb8b11, %asi = 80
	stda	%l4,[%i4+0x008]%asi	! Mem[0000000010101408] = 4f08230e 7e1d2d13
!	%f24 = 219436e8, Mem[0000000030081410] = 0000005c
	sta	%f24,[%i2+%o5]0x81	! Mem[0000000030081410] = 219436e8
!	%l6 = 7915403e069b8097, Mem[00000000100c1424] = 41673349, %asi = 80
	stha	%l6,[%i3+0x024]%asi	! Mem[00000000100c1424] = 80973349
!	%l5 = 0dd2d2ea7e1d2d13, Mem[00000000100c1410] = 069b8097
	stw	%l5,[%i3+%o5]		! Mem[00000000100c1410] = 7e1d2d13

p0_label_18:
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = 000040ff, %l5 = 0dd2d2ea7e1d2d13
	lduba	[%i4+%g0]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030001410] = 00000000 3b333561, %l0 = be20658c, %l1 = 384b94d7
	ldda	[%i0+%o5]0x89,%l0	! %l0 = 000000003b333561 0000000000000000
!	Mem[0000000010141418] = 1fd47c4a, %l5 = 00000000000000ff, %asi = 80
	lduha	[%i5+0x018]%asi,%l5	! %l5 = 0000000000001fd4
!	Mem[0000000030141410] = 3c656718, %l2 = fffffffface0a90e
	ldsba	[%i5+%o5]0x89,%l2	! %l2 = 0000000000000018
!	Mem[00000000300c1410] = 0ea9e0ac, %l0 = 000000003b333561
	ldsha	[%i3+%o5]0x89,%l0	! %l0 = ffffffffffffe0ac
!	Mem[0000000010081408] = 6b97140b, %f21 = fe665601
	lda	[%i2+%o4]0x88,%f21	! %f21 = 6b97140b
!	Mem[00000000300c1408] = 5b0fe295, %l0 = ffffffffffffe0ac
	ldsba	[%i3+%o4]0x89,%l0	! %l0 = ffffffffffffff95
!	Mem[0000000010101410] = 1197124c, %l2 = 0000000000000018
	ldsha	[%i4+%o5]0x80,%l2	! %l2 = 0000000000001197
!	%f20 = 57d45066, %f23 = cf08230e, %f28 = 4600c854
	fmuls	%f20,%f23,%f28		! %f28 = e761cf92
!	Mem[0000000010081408] = 6b97140b, %l5 = 0000000000001fd4
	lduha	[%i2+%o4]0x88,%l5	! %l5 = 000000000000140b

p0_label_19:
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (2)
!	Mem[00000000100c1400] = 515c8700 4beb8b11 7915403e 069b8097
!	Mem[00000000100c1410] = 7e1d2d13 3c656718 4dc9998a 389c3533
!	Mem[00000000100c1420] = 61a38498 80973349 4b57c496 06a15c8f
!	Mem[00000000100c1430] = 05e1ff04 38ff3e85 4bad6d62 286672ab
	ldda	[%i3+%g0]ASI_BLK_P,%f0 	! Block Load from 00000000100c1400
!	%f18 = 4069af0e 4872b227, %l2 = 0000000000001197
!	Mem[0000000030101400] = ff400000514d0961
	stda	%f18,[%i4+%l2]ASI_PST16_S ! Mem[0000000030101400] = ff40af0e4872b227
!	Mem[00000000300c1408] = 5b0fe295, %l5 = 000000000000140b
	ldstuba	[%i3+%o4]0x89,%l5	! %l5 = 0000000000000095
!	%l3 = 00000000ffffffff, Mem[0000000030001410] = 6135333b
	stha	%l3,[%i0+%o5]0x81	! Mem[0000000030001410] = ffff333b
!	Mem[0000000010181400] = 069b8097, %l4 = 000000004f08230e
	swapa	[%i6+%g0]0x88,%l4	! %l4 = 00000000069b8097
!	%l2 = 0000000000001197, Mem[0000000030181410] = 00000000
	stwa	%l2,[%i6+%o5]0x81	! Mem[0000000030181410] = 00001197
	membar	#Sync			! Added by membar checker (3)
!	%f8  = 61a38498 80973349, Mem[00000000100c1428] = 4b57c496 06a15c8f
	std	%f8 ,[%i3+0x028]	! Mem[00000000100c1428] = 61a38498 80973349
!	Mem[000000001010141c] = 7e1d2d13, %l7 = 000000000000000e
	ldstuba	[%i4+0x01c]%asi,%l7	! %l7 = 000000000000007e
!	Mem[0000000010141400] = ff8357c0 1d5da0d1 015666fe 6650d457
!	%f16 = 42330750 41839821 4069af0e 4872b227
!	%f20 = 57d45066 6b97140b 5d8f015a cf08230e
!	%f24 = 219436e8 2ca96a59 ff79292e 6b97140b
!	%f28 = e761cf92 5b0fe295 47b7546d ae96bcff
	stda	%f16,[%i5+%g0]ASI_COMMIT_P	! Block Store to 0000000010141400
	membar	#Sync			! Added by membar checker (4)
!	%f9  = 80973349, Mem[0000000010141410] = 6650d457
	sta	%f9 ,[%i5+%o5]0x88	! Mem[0000000010141410] = 80973349

p0_label_20:
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = 3c656718, %l5 = 0000000000000095
	ldswa	[%i2+%g0]0x89,%l5	! %l5 = 000000003c656718
!	Mem[0000000030041408] = 0ea9292e, %f21 = 6b97140b
	lda	[%i1+%o4]0x81,%f21	! %f21 = 0ea9292e
!	Mem[00000000300c1408] = ffe20f5b54c80046, %f30 = 47b7546d ae96bcff
	ldda	[%i3+%o4]0x81,%f30	! %f30 = ffe20f5b 54c80046
!	Mem[0000000010141410] = 0b14976b 80973349, %l2 = 00001197, %l3 = ffffffff
	ldda	[%i5+%o5]0x88,%l2	! %l2 = 0000000080973349 000000000b14976b
!	Mem[0000000030101410] = 1b815b7c, %l3 = 000000000b14976b
	lduba	[%i4+%o5]0x81,%l3	! %l3 = 000000000000001b
!	Mem[0000000010001420] = 04a11f78 2aa016a9, %l4 = 069b8097, %l5 = 3c656718, %asi = 80
	ldda	[%i0+0x020]%asi,%l4	! %l4 = 0000000004a11f78 000000002aa016a9
!	Mem[0000000010081418] = 5020d02a6cf3ed53, %l0 = ffffffffffffff95
	ldx	[%i2+0x018],%l0		! %l0 = 5020d02a6cf3ed53
!	Mem[0000000010041400] = 4076515c, %l5 = 000000002aa016a9
	ldsba	[%i1+%g0]0x88,%l5	! %l5 = 000000000000005c
!	Mem[0000000010081408] = 0b14976b 2aa016a9, %l2 = 80973349, %l3 = 0000001b
	ldda	[%i2+%o4]0x80,%l2	! %l2 = 000000000b14976b 000000002aa016a9
!	Mem[0000000010181408] = 37061642 5e22ebff, %l6 = 069b8097, %l7 = 0000007e
	ldda	[%i6+%o4]0x88,%l6	! %l6 = 000000005e22ebff 0000000037061642

p0_label_21:
!	Starting 10 instruction Store Burst
!	Mem[0000000010041434] = 4107e4c5, %l0 = 000000006cf3ed53, %asi = 80
	swapa	[%i1+0x034]%asi,%l0	! %l0 = 000000004107e4c5
!	%f22 = 5d8f015a cf08230e, Mem[0000000010141410] = 80973349 0b14976b
	stda	%f22,[%i5+%o5]0x88	! Mem[0000000010141410] = 5d8f015a cf08230e
!	%f21 = 0ea9292e, %f27 = 6b97140b
	fcmpes	%fcc3,%f21,%f27		! %fcc3 = 1
!	%f2  = 7915403e 069b8097, Mem[0000000010141408] = 0eaf6940 27b27248
	stda	%f2 ,[%i5+%o4]0x88	! Mem[0000000010141408] = 7915403e 069b8097
!	%l2 = 0b14976b, %l3 = 2aa016a9, Mem[0000000010041408] = 97809b06 1867653c
	stda	%l2,[%i1+%o4]0x88	! Mem[0000000010041408] = 0b14976b 2aa016a9
!	%f25 = 2ca96a59, Mem[0000000030181400] = 50073342
	sta	%f25,[%i6+%g0]0x89	! Mem[0000000030181400] = 2ca96a59
!	Mem[0000000010081400] = a0061034, %l0 = 000000004107e4c5
	swapa	[%i2+%g0]0x88,%l0	! %l0 = 00000000a0061034
!	%f19 = 4872b227, Mem[0000000010141410] = 0e2308cf
	sta	%f19,[%i5+%o5]0x80	! Mem[0000000010141410] = 4872b227
!	%l2 = 000000000b14976b, Mem[0000000010041408] = 6b97140b
	stha	%l2,[%i1+%o4]0x80	! Mem[0000000010041408] = 976b140b
!	%l2 = 0b14976b, %l3 = 2aa016a9, Mem[0000000010141400] = 42330750 41839821
	stda	%l2,[%i5+%g0]0x80	! Mem[0000000010141400] = 0b14976b 2aa016a9

p0_label_22:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = 4f08230e7e1d2d13, %l5 = 000000000000005c, %asi = 80
	ldxa	[%i4+0x008]%asi,%l5	! %l5 = 4f08230e7e1d2d13
!	Mem[0000000010141408] = 97809b063e401579, %f28 = e761cf92 5b0fe295
	ldda	[%i5+%o4]0x80,%f28	! %f28 = 97809b06 3e401579
!	Mem[0000000030001400] = 000079c8, %l1 = 0000000000000000
	lduwa	[%i0+%g0]0x81,%l1	! %l1 = 00000000000079c8
!	%l7 = 0000000037061642, %l1 = 00000000000079c8, %l0 = 00000000a0061034
	and	%l7,%l1,%l0		! %l0 = 0000000000001040
!	Mem[0000000010001420] = 04a11f78, %l0 = 0000000000001040, %asi = 80
	ldswa	[%i0+0x020]%asi,%l0	! %l0 = 0000000004a11f78
!	Mem[0000000010101408] = 0e23084f, %l5 = 4f08230e7e1d2d13
	lduha	[%i4+%o4]0x88,%l5	! %l5 = 000000000000084f
!	Mem[0000000020800040] = 79c818e0, %l1 = 00000000000079c8
	ldsb	[%o1+0x040],%l1		! %l1 = 0000000000000079
!	%o2 = deadbeefdeadbeef
	set	share2_start,%o2	! set %o2[0] to VA
!	Mem[00000000211c0000] = 5cd16b10, %l0 = 0000000004a11f78
	lduh	[%o2+%g0],%l0		! %l0 = 0000000000005cd1
!	Mem[0000000010101400] = 60f7ba50, %l7 = 0000000037061642
	ldsha	[%i4+%g0]0x88,%l7	! %l7 = ffffffffffffba50
!	Mem[0000000010141400] = 0b14976b2aa016a9, %l3 = 000000002aa016a9, %asi = 80
	ldxa	[%i5+0x000]%asi,%l3	! %l3 = 0b14976b2aa016a9

p0_label_23:
!	Starting 10 instruction Store Burst
!	%f25 = 2ca96a59, Mem[0000000010001410] = 00000035
	sta	%f25,[%i0+0x010]%asi	! Mem[0000000010001410] = 2ca96a59
!	%l5 = 000000000000084f, Mem[0000000010181400] = 0e23084f
	stba	%l5,[%i6+%g0]0x80	! Mem[0000000010181400] = 4f23084f
!	%f23 = cf08230e, Mem[00000000300c1400] = ff7c0130
	sta	%f23,[%i3+%g0]0x81	! Mem[00000000300c1400] = cf08230e
!	%f10 = 4b57c496, Mem[000000001018142c] = 4163662f
	sta	%f10,[%i6+0x02c]%asi	! Mem[000000001018142c] = 4b57c496
!	Mem[0000000010141410] = 4872b227, %l0 = 0000000000005cd1
	swap	[%i5+%o5],%l0		! %l0 = 000000004872b227
!	%l6 = 000000005e22ebff, Mem[0000000010041408] = 2aa016a90b146b97
	stxa	%l6,[%i1+%o4]0x88	! Mem[0000000010041408] = 000000005e22ebff
!	%l7 = ffffffffffffba50, Mem[0000000010001430] = 0b8cd5e4, %asi = 80
	stba	%l7,[%i0+0x030]%asi	! Mem[0000000010001430] = 508cd5e4
!	Mem[0000000010101400] = 60f7ba50, %l0 = 000000004872b227
	swapa	[%i4+%g0]0x88,%l0	! %l0 = 0000000060f7ba50
!	Mem[0000000010081408] = 0b14976b, %l6 = 000000005e22ebff
	swapa	[%i2+%o4]0x80,%l6	! %l6 = 000000000b14976b
!	%f18 = 4069af0e, Mem[00000000100c1410] = 132d1d7e
	sta	%f18,[%i3+%o5]0x88	! Mem[00000000100c1410] = 4069af0e

p0_label_24:
!	Starting 10 instruction Load Burst
!	%l6 = 000000000b14976b, %l7 = ffffffffffffba50, %y  = c5acff6b
	smul	%l6,%l7,%l6		! %l6 = fffffcfbd5080f70, %y = fffffcfb
!	Mem[00000000100c1400] = 515c8700, %l1 = 0000000000000079
	lduha	[%i3+%g0]0x80,%l1	! %l1 = 000000000000515c
!	Mem[0000000030041400] = ace0a90e 00000000, %l4 = 04a11f78, %l5 = 0000084f
	ldda	[%i1+%g0]0x89,%l4	! %l4 = 0000000000000000 00000000ace0a90e
!	Mem[0000000030041410] = 7d1db2336bffacc5, %f6  = 4dc9998a 389c3533
	ldda	[%i1+%o5]0x89,%f6 	! %f6  = 7d1db233 6bffacc5
!	Mem[0000000030101410] = 1b815b7c, %l7 = ffffffffffffba50
	ldsha	[%i4+%o5]0x81,%l7	! %l7 = 0000000000001b81
!	Mem[0000000010001410] = 2de6355a596aa92c, %f2  = 7915403e 069b8097
	ldda	[%i0+%o5]0x88,%f2 	! %f2  = 2de6355a 596aa92c
!	Mem[0000000010141408] = 97809b06 3e401579, %l0 = 60f7ba50, %l1 = 0000515c
	ldda	[%i5+%o4]0x80,%l0	! %l0 = 0000000097809b06 000000003e401579
!	Mem[0000000010141410] = 00005cd15a018f5d, %l1 = 000000003e401579
	ldxa	[%i5+%o5]0x80,%l1	! %l1 = 00005cd15a018f5d
!	Mem[0000000010101435] = 452cb365, %l5 = 00000000ace0a90e, %asi = 80
	ldsba	[%i4+0x035]%asi,%l5	! %l5 = 000000000000002c
!	Mem[0000000010081400] = 31c86c1d4107e4c5, %l7 = 0000000000001b81
	ldxa	[%i2+%g0]0x88,%l7	! %l7 = 31c86c1d4107e4c5

p0_label_25:
!	Starting 10 instruction Store Burst
!	%l0 = 0000000097809b06, Mem[0000000030141408] = c0578341
	stwa	%l0,[%i5+%o4]0x89	! Mem[0000000030141408] = 97809b06
!	Mem[0000000010181424] = 2c31ffe9, %f8  = 61a38498
	ld	[%i6+0x024],%f8 	! %f8 = 2c31ffe9
!	Mem[0000000010041420] = 77619f0cffffff95, %l4 = 0000000000000000, %l3 = 0b14976b2aa016a9
	add	%i1,0x20,%g1
	casxa	[%g1]0x80,%l4,%l3	! %l3 = 77619f0cffffff95
!	Mem[000000001000140e] = 568c83cf, %l1 = 00005cd15a018f5d
	ldstub	[%i0+0x00e],%l1		! %l1 = 0000000000000083
!	Code Fragment 4, seed = 353178
p0_fragment_3:
!	%l0 = 0000000097809b06
	setx	0xa9d450aba9451556,%g7,%l0 ! %l0 = a9d450aba9451556
!	%l1 = 0000000000000083
	setx	0x547199089be48281,%g7,%l1 ! %l1 = 547199089be48281
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = a9d450aba9451556
	setx	0x3c796bbf12d003bc,%g7,%l0 ! %l0 = 3c796bbf12d003bc
!	%l1 = 547199089be48281
	setx	0x2077db26dce89c07,%g7,%l1 ! %l1 = 2077db26dce89c07
p0_fragment_3_end:
!	%l1 = 2077db26dce89c07, Mem[0000000010081410] = 356140b1
	stba	%l1,[%i2+%o5]0x80	! Mem[0000000010081410] = 076140b1
!	%l2 = 000000000b14976b, Mem[0000000030001410] = ffff333b
	stwa	%l2,[%i0+%o5]0x81	! Mem[0000000030001410] = 0b14976b
!	%l1 = 2077db26dce89c07, Mem[0000000010081421] = 067ac838, %asi = 80
	stba	%l1,[%i2+0x021]%asi	! Mem[0000000010081420] = 0607c838
!	%l2 = 0b14976b, %l3 = ffffff95, Mem[0000000010001400] = 3b333561 4a0bd271
	stda	%l2,[%i0+%g0]0x80	! Mem[0000000010001400] = 0b14976b ffffff95
!	%l0 = 12d003bc, %l1 = dce89c07, Mem[0000000010001408] = 6650d457 cfff8c56
	stda	%l0,[%i0+%o4]0x88	! Mem[0000000010001408] = 12d003bc dce89c07

p0_label_26:
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = cf08230e, %l0 = 3c796bbf12d003bc
	ldsba	[%i3+%g0]0x81,%l0	! %l0 = ffffffffffffffcf
!	Mem[0000000010181420] = 2c2d59b82c31ffe9, %l7 = 31c86c1d4107e4c5
	ldx	[%i6+0x020],%l7		! %l7 = 2c2d59b82c31ffe9
!	Mem[0000000010001408] = bc03d012, %f21 = 0ea9292e
	lda	[%i0+%o4]0x80,%f21	! %f21 = bc03d012
!	Mem[0000000010041410] = ffffc5ac, %l6 = fffffcfbd5080f70
	ldswa	[%i1+%o5]0x80,%l6	! %l6 = ffffffffffffc5ac
!	Mem[0000000030001400] = 000079c8, %l4 = 0000000000000000
	lduba	[%i0+%g0]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000010181408] = 5e22ebff, %l7 = 2c2d59b82c31ffe9
	lduha	[%i6+%o4]0x88,%l7	! %l7 = 000000000000ebff
!	Mem[0000000030181410] = 00001197, %l4 = 0000000000000000
	lduwa	[%i6+%o5]0x81,%l4	! %l4 = 0000000000001197
!	%f9  = 80973349, %f20 = 57d45066
	fcmps	%fcc3,%f9 ,%f20		! %fcc3 = 1
!	Code Fragment 4, seed = 58089
p0_fragment_4:
!	%l0 = ffffffffffffffcf
	setx	0xc84eda8779b499de,%g7,%l0 ! %l0 = c84eda8779b499de
!	%l1 = 2077db26dce89c07
	setx	0xa41004b7dafd8089,%g7,%l1 ! %l1 = a41004b7dafd8089
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = c84eda8779b499de
	setx	0xaaf9288ad8f74344,%g7,%l0 ! %l0 = aaf9288ad8f74344
!	%l1 = a41004b7dafd8089
	setx	0x0f43be404b08650f,%g7,%l1 ! %l1 = 0f43be404b08650f
p0_fragment_4_end:
!	Mem[0000000010081410] = 076140b1, %l0 = aaf9288ad8f74344
	ldsba	[%i2+%o5]0x80,%l0	! %l0 = 0000000000000007

p0_label_27:
!	Starting 10 instruction Store Burst
!	%l7 = 000000000000ebff, Mem[0000000010001410] = 596aa92c
	stha	%l7,[%i0+%o5]0x88	! Mem[0000000010001410] = 596aebff
!	%l6 = ffffc5ac, %l7 = 0000ebff, Mem[0000000010081410] = 076140b1 24ddc7ed
	stda	%l6,[%i2+%o5]0x80	! Mem[0000000010081410] = ffffc5ac 0000ebff
!	%l6 = ffffffffffffc5ac, Mem[00000000201c0000] = 40b1e880, %asi = 80
	stha	%l6,[%o0+0x000]%asi	! Mem[00000000201c0000] = c5ace880
!	Mem[0000000021800040] = 14978370, %l0 = 0000000000000007
	ldstub	[%o3+0x040],%l0		! %l0 = 0000000000000014
!	Mem[0000000010141400] = 6b97140b, %l3 = 77619f0cffffff95
	ldstuba	[%i5+%g0]0x88,%l3	! %l3 = 000000000000000b
!	Mem[000000001008140b] = 5e22ebff, %l4 = 0000000000001197
	ldstuba	[%i2+0x00b]%asi,%l4	! %l4 = 00000000000000ff
!	%l2 = 0b14976b, %l3 = 0000000b, Mem[0000000030181408] = 4069af0e 4872b227
	stda	%l2,[%i6+%o4]0x81	! Mem[0000000030181408] = 0b14976b 0000000b
!	%l6 = ffffffffffffc5ac, %l7 = 000000000000ebff, %y  = fffffcfb
	udiv	%l6,%l7,%l5		! %l5 = 00000000ffffffff
	mov	%l0,%y			! %y = 00000014
!	Mem[0000000030141408] = 97809b06, %l3 = 000000000000000b
	ldstuba	[%i5+%o4]0x89,%l3	! %l3 = 0000000000000006
!	Mem[0000000021800101] = 57264a00, %l6 = ffffffffffffc5ac
	ldstuba	[%o3+0x101]%asi,%l6	! %l6 = 0000000000000026

p0_label_28:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = 00000000 5e22ebff, %l2 = 0b14976b, %l3 = 00000006
	ldda	[%i1+%o4]0x88,%l2	! %l2 = 000000005e22ebff 0000000000000000
!	Mem[00000000100c1400] = 515c8700, %l7 = 000000000000ebff
	ldswa	[%i3+%g0]0x80,%l7	! %l7 = 00000000515c8700
!	Mem[0000000020800001] = 460142b0, %l4 = 00000000000000ff, %asi = 80
	lduba	[%o1+0x001]%asi,%l4	! %l4 = 0000000000000001
!	Mem[00000000300c1408] = 5b0fe2ff, %l5 = 00000000ffffffff
	lduha	[%i3+%o4]0x89,%l5	! %l5 = 000000000000e2ff
!	Mem[0000000030101410] = 7c5b811b, %l5 = 000000000000e2ff
	lduwa	[%i4+%o5]0x89,%l5	! %l5 = 000000007c5b811b
!	Mem[0000000010181408] = 5e22ebff, %f27 = 6b97140b
	lda	[%i6+%o4]0x88,%f27	! %f27 = 5e22ebff
!	Mem[0000000010001400] = 95ffffff6b97140b, %f18 = 4069af0e 4872b227
	ldda	[%i0+%g0]0x88,%f18	! %f18 = 95ffffff 6b97140b
!	Mem[0000000010001410] = ffeb6a59 5a35e62d, %l0 = 00000014, %l1 = 4b08650f, %asi = 80
	ldda	[%i0+0x010]%asi,%l0	! %l0 = 00000000ffeb6a59 000000005a35e62d
!	Mem[00000000100c1400] = 515c8700, %l6 = 0000000000000026
	ldsha	[%i3+%g0]0x80,%l6	! %l6 = 000000000000515c
!	Mem[0000000010141400] = ff14976b, %l1 = 000000005a35e62d
	ldswa	[%i5+%g0]0x80,%l1	! %l1 = ffffffffff14976b

p0_label_29:
!	Starting 10 instruction Store Burst
!	%f12 = 05e1ff04 38ff3e85, %l7 = 00000000515c8700
!	Mem[0000000030181430] = 4600c8545b0fe295
	add	%i6,0x030,%g1
	stda	%f12,[%g1+%l7]ASI_PST8_SL ! Mem[0000000030181430] = 4600c8545b0fe295
!	%l0 = 00000000ffeb6a59, Mem[0000000030081410] = 219436e8
	stwa	%l0,[%i2+%o5]0x81	! Mem[0000000030081410] = ffeb6a59
!	%f4  = 7e1d2d13 3c656718, %l6 = 000000000000515c
!	Mem[0000000030181420] = 219436e82ca96a59
	add	%i6,0x020,%g1
	stda	%f4,[%g1+%l6]ASI_PST16_SL ! Mem[0000000030181420] = 219436e8132d1d7e
!	Mem[0000000030001410] = 6b97140b, %l0 = 00000000ffeb6a59
	ldstuba	[%i0+%o5]0x89,%l0	! %l0 = 000000000000000b
!	Mem[0000000030181400] = 2ca96a59, %l2 = 000000005e22ebff
	swapa	[%i6+%g0]0x89,%l2	! %l2 = 000000002ca96a59
!	Mem[0000000010041408] = 5e22ebff, %l4 = 0000000000000001
	ldstuba	[%i1+%o4]0x88,%l4	! %l4 = 00000000000000ff
!	%l7 = 00000000515c8700, Mem[0000000010041400] = 4076515c
	stha	%l7,[%i1+%g0]0x88	! Mem[0000000010041400] = 40768700
!	Mem[0000000010141422] = 219436e8, %l7 = 00000000515c8700
	ldstuba	[%i5+0x022]%asi,%l7	! %l7 = 0000000000000036
!	%f27 = 5e22ebff, %f24 = 219436e8, %f3  = 596aa92c
	fdivs	%f27,%f24,%f3 		! %f3  = 7c0cb395
!	%l2 = 000000002ca96a59, Mem[0000000010041434] = 6cf3ed53, %asi = 80
	stwa	%l2,[%i1+0x034]%asi	! Mem[0000000010041434] = 2ca96a59

p0_label_30:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = 0eaf6940, %l1 = ffffffffff14976b
	ldsba	[%i3+%o5]0x80,%l1	! %l1 = 000000000000000e
!	Mem[0000000010081410] = ffffc5ac0000ebff, %l0 = 000000000000000b
	ldx	[%i2+%o5],%l0		! %l0 = ffffc5ac0000ebff
!	Mem[0000000010181400] = 4f23084f, %l5 = 000000007c5b811b
	lduba	[%i6+%g0]0x80,%l5	! %l5 = 000000000000004f
!	Mem[0000000030001408] = e7d5864c8c45000b, %l6 = 000000000000515c
	ldxa	[%i0+%o4]0x89,%l6	! %l6 = e7d5864c8c45000b
!	Mem[0000000010181410] = ae96bcff, %f16 = 42330750
	lda	[%i6+%o5]0x88,%f16	! %f16 = ae96bcff
!	Mem[0000000010141430] = e761cf925b0fe295, %l7 = 0000000000000036, %asi = 80
	ldxa	[%i5+0x030]%asi,%l7	! %l7 = e761cf925b0fe295
!	Mem[00000000201c0000] = c5ace880, %l6 = e7d5864c8c45000b
	lduh	[%o0+%g0],%l6		! %l6 = 000000000000c5ac
!	Mem[00000000100c1408] = 7915403e069b8097, %l4 = 00000000000000ff
	ldxa	[%i3+%o4]0x80,%l4	! %l4 = 7915403e069b8097
!	Mem[00000000100c1430] = 05e1ff04, %l0 = ffffc5ac0000ebff, %asi = 80
	lduwa	[%i3+0x030]%asi,%l0	! %l0 = 0000000005e1ff04
!	Mem[0000000030041408] = 0ea9292e, %l0 = 0000000005e1ff04
	ldswa	[%i1+%o4]0x81,%l0	! %l0 = 000000000ea9292e

p0_label_31:
!	Starting 10 instruction Store Burst
!	Mem[0000000010181410] = ffbc96ae, %l4 = 7915403e069b8097
	ldstuba	[%i6+%o5]0x80,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010181400] = 4f23084f 069b8097 ffeb225e 42160637
!	%f0  = 515c8700 4beb8b11 2de6355a 7c0cb395
!	%f4  = 7e1d2d13 3c656718 7d1db233 6bffacc5
!	%f8  = 2c31ffe9 80973349 4b57c496 06a15c8f
!	%f12 = 05e1ff04 38ff3e85 4bad6d62 286672ab
	stda	%f0 ,[%i6+%g0]ASI_BLK_AIUP	! Block Store to 0000000010181400
!	Mem[0000000030041408] = 2e29a90e, %l1 = 000000000000000e
	ldstuba	[%i1+%o4]0x89,%l1	! %l1 = 000000000000000e
!	%l4 = 00000000000000ff, Mem[0000000030181400] = 5e22ebff
	stba	%l4,[%i6+%g0]0x89	! Mem[0000000030181400] = 5e22ebff
!	%l1 = 000000000000000e, Mem[0000000010101400] = 4872b227
	stba	%l1,[%i4+%g0]0x88	! Mem[0000000010101400] = 4872b20e
!	%f0  = 515c8700 4beb8b11, %l6 = 000000000000c5ac
!	Mem[0000000010181430] = 05e1ff0438ff3e85
	add	%i6,0x030,%g1
	stda	%f0,[%g1+%l6]ASI_PST32_PL ! Mem[0000000010181430] = 05e1ff0438ff3e85
!	%l5 = 000000000000004f, Mem[0000000030181410] = 000011970188dadd
	stxa	%l5,[%i6+%o5]0x81	! Mem[0000000030181410] = 000000000000004f
!	Mem[0000000010041408] = 5e22ebff, %l0 = 000000000ea9292e
	swapa	[%i1+%o4]0x88,%l0	! %l0 = 000000005e22ebff
!	%f28 = 97809b06 3e401579, Mem[0000000010101410] = 4c129711 ad69d26a
	stda	%f28,[%i4+%o5]0x88	! Mem[0000000010101410] = 97809b06 3e401579
!	%l2 = 000000002ca96a59, Mem[0000000030081410] = 596aebff
	stwa	%l2,[%i2+%o5]0x89	! Mem[0000000030081410] = 2ca96a59

p0_label_32:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = 12d003bc, %l6 = 000000000000c5ac
	lduba	[%i0+%o4]0x88,%l6	! %l6 = 00000000000000bc
!	Mem[0000000030081410] = 2ca96a59, %l5 = 000000000000004f
	lduha	[%i2+%o5]0x89,%l5	! %l5 = 0000000000006a59
	membar	#Sync			! Added by membar checker (5)
!	Mem[0000000010181400] = 00875c51, %l6 = 00000000000000bc
	ldsba	[%i6+%g0]0x88,%l6	! %l6 = 0000000000000051
!	Mem[00000000300c1408] = ffe20f5b, %l1 = 000000000000000e
	ldsba	[%i3+%o4]0x81,%l1	! %l1 = ffffffffffffffff
!	Mem[000000001000142c] = 00000b14, %l3 = 0000000000000000, %asi = 80
	ldswa	[%i0+0x02c]%asi,%l3	! %l3 = 0000000000000b14
!	Mem[0000000010001420] = 04a11f78, %l7 = e761cf925b0fe295
	ldsw	[%i0+0x020],%l7		! %l7 = 0000000004a11f78
!	Mem[0000000010101408] = 132d1d7e0e23084f, %f16 = ae96bcff 41839821
	ldda	[%i4+%o4]0x88,%f16	! %f16 = 132d1d7e 0e23084f
!	Mem[00000000100c1408] = 97809b063e401579, %f4  = 7e1d2d13 3c656718
	ldda	[%i3+%o4]0x88,%f4 	! %f4  = 97809b06 3e401579
!	Mem[0000000010181429] = 4b57c496, %l2 = 000000002ca96a59, %asi = 80
	lduba	[%i6+0x029]%asi,%l2	! %l2 = 0000000000000057
!	Mem[0000000010101408] = 132d1d7e0e23084f, %f14 = 4bad6d62 286672ab
	ldda	[%i4+%o4]0x88,%f14	! %f14 = 132d1d7e 0e23084f

p0_label_33:
!	Starting 10 instruction Store Burst
!	%l2 = 0000000000000057, Mem[0000000010041408] = 2e29a90e
	stha	%l2,[%i1+%o4]0x80	! Mem[0000000010041408] = 0057a90e
!	Mem[0000000030081400] = 3c656718, %l5 = 0000000000006a59
	swapa	[%i2+%g0]0x89,%l5	! %l5 = 000000003c656718
!	%l7 = 0000000004a11f78, Mem[0000000020800040] = 79c818e0, %asi = 80
	stha	%l7,[%o1+0x040]%asi	! Mem[0000000020800040] = 1f7818e0
!	Code Fragment 3, seed = 921915
p0_fragment_5:
!	%l0 = 000000005e22ebff
	setx	0x432a6934f724194e,%g7,%l0 ! %l0 = 432a6934f724194e
!	%l1 = ffffffffffffffff
	setx	0xfa3dffcd32dda4f9,%g7,%l1 ! %l1 = fa3dffcd32dda4f9
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 432a6934f724194e
	setx	0x3db3e466490afcb4,%g7,%l0 ! %l0 = 3db3e466490afcb4
!	%l1 = fa3dffcd32dda4f9
	setx	0xc8936c11145fa37f,%g7,%l1 ! %l1 = c8936c11145fa37f
p0_fragment_5_end:
!	%l7 = 0000000004a11f78, Mem[0000000010141420] = 2194ffe8, %asi = 80
	stha	%l7,[%i5+0x020]%asi	! Mem[0000000010141420] = 1f78ffe8
!	%f7  = 6bffacc5, Mem[00000000300c1400] = cf08230e
	sta	%f7 ,[%i3+%g0]0x81	! Mem[00000000300c1400] = 6bffacc5
!	%l0 = 490afcb4, %l1 = 145fa37f, Mem[0000000030041410] = 6bffacc5 7d1db233
	stda	%l0,[%i1+%o5]0x89	! Mem[0000000030041410] = 490afcb4 145fa37f
!	Mem[0000000010001400] = 0b14976b ffffff95 bc03d012 079ce8dc
!	%f0  = 515c8700 4beb8b11 2de6355a 7c0cb395
!	%f4  = 97809b06 3e401579 7d1db233 6bffacc5
!	%f8  = 2c31ffe9 80973349 4b57c496 06a15c8f
!	%f12 = 05e1ff04 38ff3e85 132d1d7e 0e23084f
	stda	%f0 ,[%i0+%g0]ASI_BLK_PL	! Block Store to 0000000010001400
!	%f10 = 4b57c496 06a15c8f, %l3 = 0000000000000b14
!	Mem[00000000300c1428] = 4a2852465553657f
	add	%i3,0x028,%g1
	stda	%f10,[%g1+%l3]ASI_PST8_SL ! Mem[00000000300c1428] = 4a28a1469653657f
!	Mem[0000000030101400] = 0eaf40ff, %l1 = 00000000145fa37f
	swapa	[%i4+%g0]0x89,%l1	! %l1 = 000000000eaf40ff

p0_label_34:
!	Starting 10 instruction Load Burst
!	Mem[0000000021800081] = 5baa49a0, %l7 = 0000000004a11f78
	ldsb	[%o3+0x081],%l7		! %l7 = ffffffffffffffaa
!	Mem[0000000030181410] = 4f00000000000000, %f24 = 219436e8 2ca96a59
	ldda	[%i6+%o5]0x89,%f24	! %f24 = 4f000000 00000000
!	Mem[0000000030141410] = 1867653c, %l7 = ffffffffffffffaa
	ldsba	[%i5+%o5]0x81,%l7	! %l7 = 0000000000000018
!	Mem[0000000030181410] = 4f000000 00000000, %l0 = 490afcb4, %l1 = 0eaf40ff
	ldda	[%i6+%o5]0x89,%l0	! %l0 = 0000000000000000 000000004f000000
!	Mem[0000000010101410] = 97809b063e401579, %l0 = 0000000000000000
	ldxa	[%i4+%o5]0x88,%l0	! %l0 = 97809b063e401579
!	Mem[0000000030001410] = ff14976b, %l3 = 0000000000000b14
	lduba	[%i0+%o5]0x81,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030001400] = c8790000, %l0 = 97809b063e401579
	ldsha	[%i0+%g0]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000030141400] = ffe2c1f0 2eaf4441, %l6 = 00000051, %l7 = 00000018
	ldda	[%i5+%g0]0x81,%l6	! %l6 = 00000000ffe2c1f0 000000002eaf4441
!	Mem[0000000010041408] = 0057a90e 00000000, %l6 = ffe2c1f0, %l7 = 2eaf4441
	ldd	[%i1+%o4],%l6		! %l6 = 000000000057a90e 0000000000000000
!	Mem[0000000010141400] = ff14976b, %l1 = 000000004f000000
	lduba	[%i5+%g0]0x80,%l1	! %l1 = 00000000000000ff

p0_label_35:
!	Starting 10 instruction Store Burst
!	%f26 = ff79292e 5e22ebff, Mem[0000000010101428] = 59eebbf6 4bca5a6f
	std	%f26,[%i4+0x028]	! Mem[0000000010101428] = ff79292e 5e22ebff
!	%f6  = 7d1db233, Mem[0000000030041400] = 00000000
	sta	%f6 ,[%i1+%g0]0x81	! Mem[0000000030041400] = 7d1db233
!	%l4 = 00000000000000ff, Mem[0000000030141408] = 97809bff
	stba	%l4,[%i5+%o4]0x89	! Mem[0000000030141408] = 97809bff
!	%l7 = 0000000000000000, Mem[0000000030181400] = 5e22ebff
	stba	%l7,[%i6+%g0]0x89	! Mem[0000000030181400] = 5e22eb00
!	%l3 = 00000000000000ff, Mem[00000000300c1408] = 5b0fe2ff
	stha	%l3,[%i3+%o4]0x89	! Mem[00000000300c1408] = 5b0f00ff
!	Mem[0000000010141400] = 6b9714ff, %l3 = 00000000000000ff
	swapa	[%i5+%g0]0x88,%l3	! %l3 = 000000006b9714ff
!	Mem[00000000300c1410] = 0ea9e0ac, %l0 = 0000000000000000
	swapa	[%i3+%o5]0x89,%l0	! %l0 = 000000000ea9e0ac
!	%f4  = 97809b06 3e401579, Mem[00000000300c1410] = 00000000 1d798f3d
	stda	%f4 ,[%i3+%o5]0x81	! Mem[00000000300c1410] = 97809b06 3e401579
!	%f30 = ffe20f5b 54c80046, Mem[0000000010081408] = ffeb225e a916a02a
	stda	%f30,[%i2+%o4]0x88	! Mem[0000000010081408] = ffe20f5b 54c80046
!	Mem[00000000100c1400] = 00875c51, %l4 = 00000000000000ff
	swapa	[%i3+%g0]0x88,%l4	! %l4 = 0000000000875c51

p0_label_36:
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = 5cd16b10, %l1 = 00000000000000ff, %asi = 80
	ldsha	[%o2+0x000]%asi,%l1	! %l1 = 0000000000005cd1
!	%l6 = 000000000057a90e, %l7 = 0000000000000000, %l2 = 0000000000000057
	xor	%l6,%l7,%l2		! %l2 = 000000000057a90e
!	Mem[0000000030181400] = 00eb225e41839821, %f30 = ffe20f5b 54c80046
	ldda	[%i6+%g0]0x81,%f30	! %f30 = 00eb225e 41839821
!	Mem[0000000030001408] = 8c45000b, %l2 = 000000000057a90e
	lduba	[%i0+%o4]0x89,%l2	! %l2 = 000000000000000b
!	Mem[0000000010141400] = ff000000, %f18 = 95ffffff
	lda	[%i5+%g0]0x80,%f18	! %f18 = ff000000
!	Mem[00000000211c0000] = 5cd16b10, %l1 = 0000000000005cd1
	ldsb	[%o2+%g0],%l1		! %l1 = 000000000000005c
!	Mem[00000000211c0000] = 5cd16b10, %l6 = 000000000057a90e
	lduh	[%o2+%g0],%l6		! %l6 = 0000000000005cd1
!	Mem[0000000030081408] = 0e00dc8e1511b9a7, %l3 = 000000006b9714ff
	ldxa	[%i2+%o4]0x81,%l3	! %l3 = 0e00dc8e1511b9a7
!	%l4 = 0000000000875c51, %l4 = 0000000000875c51, %y  = 00000014
	udiv	%l4,%l4,%l5		! %l5 = 00000000000025d4
	mov	%l0,%y			! %y = 0ea9e0ac
!	Mem[0000000030181410] = 00000000, %l2 = 000000000000000b
	lduba	[%i6+%o5]0x89,%l2	! %l2 = 0000000000000000

p0_label_37:
!	Starting 10 instruction Store Burst
!	%l5 = 00000000000025d4, Mem[0000000010081408] = 54c80046
	stwa	%l5,[%i2+%o4]0x88	! Mem[0000000010081408] = 000025d4
!	Mem[0000000010141400] = 000000ff, %l4 = 0000000000875c51
	ldstuba	[%i5+%g0]0x88,%l4	! %l4 = 00000000000000ff
	membar	#Sync			! Added by membar checker (6)
!	Mem[0000000010001400] = 118beb4b, %l5 = 00000000000025d4
	swapa	[%i0+%g0]0x80,%l5	! %l5 = 00000000118beb4b
!	%f27 = 5e22ebff, Mem[0000000010141428] = ff79292e
	st	%f27,[%i5+0x028]	! Mem[0000000010141428] = 5e22ebff
!	Mem[000000001004141d] = 34ec5573, %l1 = 000000000000005c
	ldstub	[%i1+0x01d],%l1		! %l1 = 00000000000000ec
!	%l1 = 00000000000000ec, Mem[00000000300c1400] = 6bffacc5
	stwa	%l1,[%i3+%g0]0x81	! Mem[00000000300c1400] = 000000ec
!	Mem[00000000100c1419] = 4dc9998a, %l0 = 000000000ea9e0ac
	ldstuba	[%i3+0x019]%asi,%l0	! %l0 = 00000000000000c9
!	%l0 = 000000c9, %l1 = 000000ec, Mem[0000000030001410] = 6b9714ff 00000000
	stda	%l0,[%i0+%o5]0x89	! Mem[0000000030001410] = 000000c9 000000ec
!	%l2 = 0000000000000000, Mem[0000000030181408] = 6b97140b
	stha	%l2,[%i6+%o4]0x89	! Mem[0000000030181408] = 6b970000
!	Mem[0000000010081408] = d4250000, %l5 = 00000000118beb4b
	ldstuba	[%i2+%o4]0x80,%l5	! %l5 = 00000000000000d4

p0_label_38:
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = 97809bff, %l4 = 00000000000000ff
	lduha	[%i5+%o4]0x89,%l4	! %l4 = 0000000000009bff
!	Mem[0000000030041400] = 7d1db233 0ea9e0ac ffa9292e 1e616fc7
!	Mem[0000000030041410] = b4fc0a49 7fa35f14 7db9157a 2ae78b63
!	Mem[0000000030041420] = 4ecde408 6b9daef9 364b4386 1702c9bf
!	Mem[0000000030041430] = 5f8f7f74 2156c935 3bc85f52 038da6db
	ldda	[%i1+%g0]ASI_BLK_S,%f0 	! Block Load from 0000000030041400
!	Mem[00000000100c1432] = 05e1ff04, %l1 = 00000000000000ec, %asi = 80
	lduha	[%i3+0x032]%asi,%l1	! %l1 = 000000000000ff04
!	Mem[00000000211c0000] = 5cd16b10, %l5 = 00000000000000d4, %asi = 80
	lduha	[%o2+0x000]%asi,%l5	! %l5 = 0000000000005cd1
!	Mem[00000000300c1408] = ff000f5b54c80046, %f30 = 00eb225e 41839821
	ldda	[%i3+%o4]0x81,%f30	! %f30 = ff000f5b 54c80046
!	Mem[0000000010141408] = 7915403e 069b8097, %l6 = 00005cd1, %l7 = 00000000
	ldda	[%i5+%o4]0x88,%l6	! %l6 = 00000000069b8097 000000007915403e
!	Mem[00000000300c1408] = ff000f5b, %l3 = 0e00dc8e1511b9a7
	lduba	[%i3+%o4]0x81,%l3	! %l3 = 00000000000000ff
!	%f16 = 132d1d7e, %f26 = ff79292e, %f22 = 5d8f015a
	fsubs	%f16,%f26,%f22		! %f22 = 7f79292e
!	Mem[0000000010001410] = 3e401579, %l6 = 00000000069b8097
	lduha	[%i0+%o5]0x88,%l6	! %l6 = 0000000000001579
!	Mem[0000000010041400] = 00877640, %l5 = 0000000000005cd1
	lduwa	[%i1+%g0]0x80,%l5	! %l5 = 0000000000877640

p0_label_39:
!	Starting 10 instruction Store Burst
!	%f15 = 038da6db, Mem[0000000010081410] = acc5ffff
	sta	%f15,[%i2+%o5]0x88	! Mem[0000000010081410] = 038da6db
!	%l6 = 0000000000001579, Mem[00000000100c143c] = 286672ab
	sth	%l6,[%i3+0x03c]		! Mem[00000000100c143c] = 157972ab
!	%l6 = 0000000000001579, Mem[0000000030141410] = 1867653c0188dadd
	stxa	%l6,[%i5+%o5]0x81	! Mem[0000000030141410] = 0000000000001579
!	%l3 = 00000000000000ff, Mem[0000000010041407] = 1dca3551
	stb	%l3,[%i1+0x007]		! Mem[0000000010041404] = 1dca35ff
!	Mem[0000000010001408] = 95b30c7c, %l2 = 0000000000000000
	ldstuba	[%i0+%o4]0x80,%l2	! %l2 = 0000000000000095
!	%f24 = 4f000000 00000000, Mem[0000000030001400] = c8790000 e1fde511
	stda	%f24,[%i0+%g0]0x89	! Mem[0000000030001400] = 4f000000 00000000
!	Mem[000000001000141b] = c5acff6b, %l6 = 0000000000001579
	ldstuba	[%i0+0x01b]%asi,%l6	! %l6 = 000000000000006b
!	%f14 = 3bc85f52 038da6db, Mem[0000000010041408] = 0057a90e 00000000
	stda	%f14,[%i1+%o4]0x80	! Mem[0000000010041408] = 3bc85f52 038da6db
!	%l6 = 0000006b, %l7 = 7915403e, Mem[0000000010001400] = d4250000 515c8700
	stda	%l6,[%i0+%g0]0x88	! Mem[0000000010001400] = 0000006b 7915403e
!	%l1 = 000000000000ff04, Mem[0000000010041408] = 3bc85f52038da6db
	stxa	%l1,[%i1+%o4]0x80	! Mem[0000000010041408] = 000000000000ff04

p0_label_40:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081402] = c5e40741, %l2 = 0000000000000095, %asi = 80
	ldsba	[%i2+0x002]%asi,%l2	! %l2 = 0000000000000007
!	Mem[0000000021800000] = 79a83940, %l5 = 0000000000877640
	ldub	[%o3+%g0],%l5		! %l5 = 0000000000000079
!	Mem[00000000201c0000] = c5ace880, %l2 = 0000000000000007
	lduh	[%o0+%g0],%l2		! %l2 = 000000000000c5ac
!	Mem[00000000300c1410] = 7915403e 069b8097, %l6 = 0000006b, %l7 = 7915403e
	ldda	[%i3+%o5]0x89,%l6	! %l6 = 00000000069b8097 000000007915403e
!	Mem[0000000030181410] = 00000000, %f21 = bc03d012
	lda	[%i6+%o5]0x81,%f21	! %f21 = 00000000
!	Mem[0000000030041400] = ace0a90e33b21d7d, %l7 = 000000007915403e
	ldxa	[%i1+%g0]0x89,%l7	! %l7 = ace0a90e33b21d7d
!	Mem[0000000030181410] = 00000000, %l0 = 00000000000000c9
	ldsha	[%i6+%o5]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000010141410] = 00005cd15a018f5d, %f24 = 4f000000 00000000
	ldda	[%i5+%o5]0x80,%f24	! %f24 = 00005cd1 5a018f5d
!	Mem[00000000300c1408] = 4600c854 5b0f00ff, %l2 = 0000c5ac, %l3 = 000000ff
	ldda	[%i3+%o4]0x89,%l2	! %l2 = 000000005b0f00ff 000000004600c854
!	Mem[0000000030101410] = 1b815b7c 3aac101d, %l0 = 00000000, %l1 = 0000ff04
	ldda	[%i4+%o5]0x81,%l0	! %l0 = 000000001b815b7c 000000003aac101d

p0_label_41:
!	Starting 10 instruction Store Burst
!	%l0 = 000000001b815b7c, Mem[0000000010041414] = 17dc3f0d
	sth	%l0,[%i1+0x014]		! Mem[0000000010041414] = 5b7c3f0d
!	%f22 = 7f79292e cf08230e, Mem[00000000300c1410] = 97809b06 3e401579
	stda	%f22,[%i3+%o5]0x81	! Mem[00000000300c1410] = 7f79292e cf08230e
!	%l7 = ace0a90e33b21d7d, Mem[00000000201c0000] = c5ace880
	sth	%l7,[%o0+%g0]		! Mem[00000000201c0000] = 1d7de880
!	%f12 = 5f8f7f74 2156c935, Mem[0000000030181410] = 00000000 0000004f
	stda	%f12,[%i6+%o5]0x81	! Mem[0000000030181410] = 5f8f7f74 2156c935
!	%f10 = 364b4386, Mem[0000000010001400] = 6b000000
	sta	%f10,[%i0+%g0]0x80	! Mem[0000000010001400] = 364b4386
!	%l2 = 000000005b0f00ff, Mem[0000000030001410] = 000000ec000000c9
	stxa	%l2,[%i0+%o5]0x89	! Mem[0000000030001410] = 000000005b0f00ff
!	Mem[0000000030001400] = 00000000 0000004f 0b00458c 4c86d5e7
!	%f16 = 132d1d7e 0e23084f ff000000 6b97140b
!	%f20 = 57d45066 00000000 7f79292e cf08230e
!	%f24 = 00005cd1 5a018f5d ff79292e 5e22ebff
!	%f28 = 97809b06 3e401579 ff000f5b 54c80046
	stda	%f16,[%i0+%g0]ASI_BLK_AIUS	! Block Store to 0000000030001400
	membar	#Sync			! Added by membar checker (7)
!	Mem[0000000030001400] = 132d1d7e, %l6 = 00000000069b8097
	ldstuba	[%i0+%g0]0x81,%l6	! %l6 = 0000000000000013
!	Mem[0000000010041410] = ffffc5ac, %l0 = 000000001b815b7c
	ldstuba	[%i1+%o5]0x80,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010081408] = ff250000, %l2 = 000000005b0f00ff
	swap	[%i2+%o4],%l2		! %l2 = 00000000ff250000

p0_label_42:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081418] = 5020d02a 6cf3ed53, %l4 = 00009bff, %l5 = 00000079
	ldd	[%i2+0x018],%l4		! %l4 = 000000005020d02a 000000006cf3ed53
!	Mem[00000000300c1400] = 000000ec, %l2 = 00000000ff250000
	ldsha	[%i3+%g0]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000010081410] = dba68d03, %l1 = 000000003aac101d
	lduwa	[%i2+%o5]0x80,%l1	! %l1 = 00000000dba68d03
!	Mem[0000000010141400] = ff0000002aa016a9, %f24 = 00005cd1 5a018f5d
	ldda	[%i5+%g0]0x80,%f24	! %f24 = ff000000 2aa016a9
!	Mem[0000000030141410] = 79150000 00000000, %l6 = 00000013, %l7 = 33b21d7d
	ldda	[%i5+%o5]0x89,%l6	! %l6 = 0000000000000000 0000000079150000
!	Mem[00000000300c1408] = 4600c8545b0f00ff, %f12 = 5f8f7f74 2156c935
	ldda	[%i3+%o4]0x89,%f12	! %f12 = 4600c854 5b0f00ff
!	Mem[0000000030001410] = 000000006650d457, %l2 = 0000000000000000
	ldxa	[%i0+%o5]0x89,%l2	! %l2 = 000000006650d457
!	Mem[0000000030041408] = ffa9292e, %l0 = 00000000000000ff
	lduha	[%i1+%o4]0x81,%l0	! %l0 = 000000000000ffa9
!	Mem[0000000021800140] = 28658430, %l4 = 000000005020d02a
	ldsh	[%o3+0x140],%l4		! %l4 = 0000000000002865
!	Mem[0000000010181428] = 4b57c49606a15c8f, %f26 = ff79292e 5e22ebff, %asi = 80
	ldda	[%i6+0x028]%asi,%f26	! %f26 = 4b57c496 06a15c8f

p0_label_43:
!	Starting 10 instruction Store Burst
!	Mem[0000000010141438] = 47b7546dae96bcff, %l4 = 0000000000002865, %l2 = 000000006650d457
	add	%i5,0x38,%g1
	casxa	[%g1]0x80,%l4,%l2	! %l2 = 47b7546dae96bcff
!	%f19 = 6b97140b, Mem[0000000010101400] = 0eb27248
	sta	%f19,[%i4+%g0]0x80	! Mem[0000000010101400] = 6b97140b
!	Mem[0000000010081408] = 5b0f00ff, %l2 = 00000000ae96bcff
	swapa	[%i2+%o4]0x80,%l2	! %l2 = 000000005b0f00ff
!	%l3 = 000000004600c854, %l4 = 0000000000002865, %l2 = 000000005b0f00ff
	udivx	%l3,%l4,%l2		! %l2 = 000000000001bba4
!	Mem[0000000030101400] = 7fa35f14 4872b227, %l0 = 0000ffa9, %l1 = dba68d03
	ldda	[%i4+%g0]0x81,%l0	! %l0 = 000000007fa35f14 000000004872b227
!	Mem[00000000100c1408] = 7915403e, %l4 = 0000000000002865
	ldstuba	[%i3+%o4]0x80,%l4	! %l4 = 0000000000000079
!	Mem[0000000030101410] = 1b815b7c, %l0 = 000000007fa35f14
	ldstuba	[%i4+%o5]0x81,%l0	! %l0 = 000000000000001b
!	Mem[0000000010181410] = 7e1d2d13, %l4 = 0000000000000079
	ldstuba	[%i6+%o5]0x80,%l4	! %l4 = 000000000000007e
!	Mem[0000000030041408] = 2e29a9ff, %l1 = 000000004872b227
	ldstuba	[%i1+%o4]0x89,%l1	! %l1 = 00000000000000ff
!	%l2 = 000000000001bba4, Mem[00000000100c1410] = 4069af0e
	stha	%l2,[%i3+%o5]0x88	! Mem[00000000100c1410] = 4069bba4

p0_label_44:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = 3e401579, %l3 = 000000004600c854
	ldswa	[%i4+%o5]0x88,%l3	! %l3 = 000000003e401579
!	Mem[0000000010141408] = 7915403e 069b8097, %l0 = 0000001b, %l1 = 000000ff
	ldda	[%i5+%o4]0x88,%l0	! %l0 = 00000000069b8097 000000007915403e
!	Mem[00000000100c1400] = 000000ff, %l3 = 000000003e401579
	ldsba	[%i3+%g0]0x88,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000030101410] = 1d10ac3a 7c5b81ff, %l2 = 0001bba4, %l3 = ffffffff
	ldda	[%i4+%o5]0x89,%l2	! %l2 = 000000007c5b81ff 000000001d10ac3a
!	Mem[0000000030141400] = ffe2c1f0 2eaf4441 ff9b8097 1d5da0d1
!	Mem[0000000030141410] = 00000000 00001579 34d9fafa 0e776ae3
!	Mem[0000000030141420] = 186c9588 54a4aa79 28632106 7ef2c13f
!	Mem[0000000030141430] = 6d1ee8f4 6cb89cb5 3c28b4d2 2ca96a59
	ldda	[%i5+%g0]ASI_BLK_S,%f0 	! Block Load from 0000000030141400
!	Mem[0000000030001410] = 6650d457, %l5 = 000000006cf3ed53
	ldstuba	[%i0+%o5]0x89,%l5	! %l5 = 0000000000000057
!	Mem[0000000030041410] = 145fa37f490afcb4, %l6 = 0000000000000000
	ldxa	[%i1+%o5]0x89,%l6	! %l6 = 145fa37f490afcb4
!	Mem[0000000010041410] = ffffc5ac, %l6 = 145fa37f490afcb4
	ldsha	[%i1+%o5]0x80,%l6	! %l6 = ffffffffffffffff
!	Mem[00000000300c1408] = ff000f5b54c80046, %f22 = 7f79292e cf08230e
	ldda	[%i3+%o4]0x81,%f22	! %f22 = ff000f5b 54c80046
!	Mem[0000000030141400] = f0c1e2ff, %l6 = ffffffffffffffff
	lduba	[%i5+%g0]0x89,%l6	! %l6 = 00000000000000ff

p0_label_45:
!	Starting 10 instruction Store Burst
!	Mem[0000000030081408] = 8edc000e, %l3 = 000000001d10ac3a
	swapa	[%i2+%o4]0x89,%l3	! %l3 = 000000008edc000e
!	%l0 = 069b8097, %l1 = 7915403e, Mem[0000000010001408] = ffb30c7c 5a35e62d
	stda	%l0,[%i0+%o4]0x80	! Mem[0000000010001408] = 069b8097 7915403e
!	%l4 = 000000000000007e, Mem[0000000010001438] = 4f08230e7e1d2d13, %asi = 80
	stxa	%l4,[%i0+0x038]%asi	! Mem[0000000010001438] = 000000000000007e
!	%f20 = 57d45066 00000000, %l4 = 000000000000007e
!	Mem[0000000030001438] = ff000f5b54c80046
	add	%i0,0x038,%g1
	stda	%f20,[%g1+%l4]ASI_PST32_SL ! Mem[0000000030001438] = ff000f5b6650d457
!	%l7 = 0000000079150000, Mem[00000000300c1410] = 2e29797f
	stha	%l7,[%i3+%o5]0x89	! Mem[00000000300c1410] = 2e290000
!	%f11 = 7ef2c13f, %f19 = 6b97140b
	fcmpes	%fcc2,%f11,%f19		! %fcc2 = 2
!	%l5 = 0000000000000057, Mem[0000000010101408] = 0e23084f
	stba	%l5,[%i4+%o4]0x88	! Mem[0000000010101408] = 0e230857
!	Mem[00000000300c1400] = 000000ec, %l2 = 000000007c5b81ff
	swapa	[%i3+%g0]0x81,%l2	! %l2 = 00000000000000ec
!	%f30 = ff000f5b 54c80046, %f20 = 57d45066
	fdtos	%f30,%f20		! %f20 = ff800000
!	%f20 = ff800000 00000000, Mem[0000000030101400] = 145fa37f 27b27248
	stda	%f20,[%i4+%g0]0x89	! Mem[0000000030101400] = ff800000 00000000

p0_label_46:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = 2de6355a, %f20 = ff800000
	lda	[%i6+%o4]0x80,%f20	! %f20 = 2de6355a
!	Mem[0000000010001408] = 069b8097, %l0 = 00000000069b8097
	lduwa	[%i0+%o4]0x80,%l0	! %l0 = 00000000069b8097
!	Mem[0000000030081410] = 596aa92c, %l4 = 000000000000007e
	lduwa	[%i2+%o5]0x81,%l4	! %l4 = 00000000596aa92c
!	Mem[00000000201c0000] = 1d7de880, %l1 = 000000007915403e
	ldsh	[%o0+%g0],%l1		! %l1 = 0000000000001d7d
!	Mem[0000000030141408] = 97809bff, %l1 = 0000000000001d7d
	lduba	[%i5+%o4]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030141400] = 4144af2ef0c1e2ff, %f28 = 97809b06 3e401579
	ldda	[%i5+%g0]0x89,%f28	! %f28 = 4144af2e f0c1e2ff
!	Mem[0000000030141400] = 4144af2ef0c1e2ff, %f18 = ff000000 6b97140b
	ldda	[%i5+%g0]0x89,%f18	! %f18 = 4144af2e f0c1e2ff
	membar	#Sync			! Added by membar checker (8)
!	Mem[0000000010101400] = 6b97140b 583e7df1 5708230e 7e1d2d13
!	Mem[0000000010101410] = 7915403e 069b8097 0dd2d2ea ff1d2d13
!	Mem[0000000010101420] = 281430f8 05edf229 ff79292e 5e22ebff
!	Mem[0000000010101430] = 679e9f64 452cb365 66a682c2 337e568b
	ldda	[%i4+%g0]ASI_BLK_AIUPL,%f16	! Block Load from 0000000010101400
!	Mem[0000000010181400] = 515c87004beb8b11, %l3 = 000000008edc000e
	ldx	[%i6+%g0],%l3		! %l3 = 515c87004beb8b11
!	%l6 = 00000000000000ff, imm = fffffffffffff6bc, %l1 = 00000000000000ff
	subc	%l6,-0x944,%l1		! %l1 = 0000000000000a43

p0_label_47:
!	Starting 10 instruction Store Burst
!	%l7 = 0000000079150000, Mem[00000000100c142b] = 61a38498, %asi = 80
	stba	%l7,[%i3+0x02b]%asi	! Mem[00000000100c1428] = 61a38400
!	%l6 = 00000000000000ff, Mem[0000000010181400] = 00875c51
	stba	%l6,[%i6+%g0]0x88	! Mem[0000000010181400] = 00875cff
!	%l4 = 596aa92c, %l5 = 00000057, Mem[00000000300c1408] = ff000f5b 54c80046
	stda	%l4,[%i3+%o4]0x81	! Mem[00000000300c1408] = 596aa92c 00000057
!	Mem[0000000020800041] = 1f7818e0, %l3 = 515c87004beb8b11
	ldstuba	[%o1+0x041]%asi,%l3	! %l3 = 0000000000000078
!	%l7 = 0000000079150000, Mem[0000000030001410] = 6650d4ff
	stba	%l7,[%i0+%o5]0x89	! Mem[0000000030001410] = 6650d400
!	%l4 = 00000000596aa92c, Mem[0000000010141428] = 5e22ebff6b97140b
	stx	%l4,[%i5+0x028]		! Mem[0000000010141428] = 00000000596aa92c
!	Mem[0000000010181410] = 132d1dff, %l4 = 00000000596aa92c
	swapa	[%i6+%o5]0x88,%l4	! %l4 = 00000000132d1dff
!	Mem[0000000010001410] = 3e401579, %l6 = 00000000000000ff
	swapa	[%i0+%o5]0x88,%l6	! %l6 = 000000003e401579
!	%l0 = 069b8097, %l1 = 00000a43, Mem[0000000010181408] = 2de6355a 7c0cb395
	stda	%l0,[%i6+%o4]0x80	! Mem[0000000010181408] = 069b8097 00000a43
!	Mem[0000000010081408] = ae96bcff, %l2 = 00000000000000ec
	swap	[%i2+%o4],%l2		! %l2 = 00000000ae96bcff

p0_label_48:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = 596aa92c, %l4 = 00000000132d1dff
	ldsha	[%i6+%o5]0x88,%l4	! %l4 = ffffffffffffa92c
!	Mem[0000000021800040] = ff978370, %l2 = 00000000ae96bcff
	ldsh	[%o3+0x040],%l2		! %l2 = ffffffffffffff97
!	Mem[0000000030001400] = 7e1d2dff, %f11 = 7ef2c13f
	lda	[%i0+%g0]0x89,%f11	! %f11 = 7e1d2dff
!	Mem[0000000010181408] = 430a0000 97809b06, %l2 = ffffff97, %l3 = 00000078
	ldda	[%i6+%o4]0x88,%l2	! %l2 = 0000000097809b06 00000000430a0000
!	Mem[0000000030141408] = ff9b8097 1d5da0d1, %l0 = 069b8097, %l1 = 00000a43
	ldda	[%i5+%o4]0x81,%l0	! %l0 = 00000000ff9b8097 000000001d5da0d1
!	Mem[0000000010001410] = ff000000, %l4 = ffffffffffffa92c
	ldsha	[%i0+%o5]0x80,%l4	! %l4 = ffffffffffffff00
!	Mem[0000000030081400] = 596a000039e923a1, %f0  = ffe2c1f0 2eaf4441
	ldda	[%i2+%g0]0x81,%f0 	! %f0  = 596a0000 39e923a1
!	Mem[00000000300c1408] = 2ca96a59, %l6 = 000000003e401579
	lduwa	[%i3+%o4]0x89,%l6	! %l6 = 000000002ca96a59
!	Mem[0000000010181400] = 00875cff, %l6 = 000000002ca96a59
	ldswa	[%i6+%g0]0x88,%l6	! %l6 = 0000000000875cff
!	Mem[0000000021800081] = 5baa49a0, %l2 = 0000000097809b06
	ldub	[%o3+0x081],%l2		! %l2 = 00000000000000aa

p0_label_49:
!	Starting 10 instruction Store Burst
!	%f12 = 6d1ee8f4 6cb89cb5, Mem[0000000030001408] = 000000ff 0b14976b
	stda	%f12,[%i0+%o4]0x89	! Mem[0000000030001408] = 6d1ee8f4 6cb89cb5
!	Mem[0000000021800100] = 57ff4a00, %l2 = 00000000000000aa
	ldstub	[%o3+0x100],%l2		! %l2 = 0000000000000057
!	Mem[0000000030101400] = 00000000, %l0 = 00000000ff9b8097
	swapa	[%i4+%g0]0x89,%l0	! %l0 = 0000000000000000
!	%f6  = 34d9fafa 0e776ae3, %l5 = 0000000000000057
!	Mem[0000000030041408] = ffa9292e1e616fc7
	add	%i1,0x008,%g1
	stda	%f6,[%g1+%l5]ASI_PST32_SL ! Mem[0000000030041408] = e36a770efafad934
!	%l6 = 0000000000875cff, Mem[00000000100c1408] = ff15403e
	stha	%l6,[%i3+%o4]0x80	! Mem[00000000100c1408] = 5cff403e
!	%f10 = 28632106 7e1d2dff, Mem[0000000030041410] = 490afcb4 145fa37f
	stda	%f10,[%i1+%o5]0x89	! Mem[0000000030041410] = 28632106 7e1d2dff
!	%l2 = 0000000000000057, Mem[0000000010041410] = ffffc5ac
	stwa	%l2,[%i1+%o5]0x80	! Mem[0000000010041410] = 00000057
!	%f12 = 6d1ee8f4, Mem[00000000100c1410] = a4bb6940
	sta	%f12,[%i3+%o5]0x80	! Mem[00000000100c1410] = 6d1ee8f4
!	%f18 = 132d1d7e, Mem[00000000100c1410] = f4e81e6d
	sta	%f18,[%i3+%o5]0x88	! Mem[00000000100c1410] = 132d1d7e
!	%l4 = ffffffffffffff00, Mem[0000000030101408] = 0ea9e0ac07d35d67
	stxa	%l4,[%i4+%o4]0x81	! Mem[0000000030101408] = ffffffffffffff00

p0_label_50:
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = ffffffffffffff00, %f6  = 34d9fafa 0e776ae3
	ldda	[%i4+%o4]0x81,%f6 	! %f6  = ffffffff ffffff00
!	Mem[0000000030001410] = 00d45066, %l3 = 00000000430a0000
	ldswa	[%i0+%o5]0x81,%l3	! %l3 = 0000000000d45066
!	Mem[0000000010101408] = 5708230e, %l5 = 0000000000000057
	ldsha	[%i4+%o4]0x80,%l5	! %l5 = 0000000000005708
!	Mem[0000000010001408] = 97809b06, %l1 = 000000001d5da0d1
	lduwa	[%i0+%o4]0x88,%l1	! %l1 = 0000000097809b06
!	%l3 = 0000000000d45066, Mem[0000000010041400] = 40768700
	stwa	%l3,[%i1+%g0]0x88	! Mem[0000000010041400] = 00d45066
!	Mem[0000000010141408] = 069b8097, %l5 = 0000000000005708
	ldswa	[%i5+%o4]0x88,%l5	! %l5 = 00000000069b8097
!	Mem[0000000030101410] = 1d10ac3a 7c5b81ff, %l6 = 00875cff, %l7 = 79150000
	ldda	[%i4+%o5]0x89,%l6	! %l6 = 000000007c5b81ff 000000001d10ac3a
!	Mem[0000000030081410] = 596aa92c6d4e3e5d, %l2 = 0000000000000057
	ldxa	[%i2+%o5]0x81,%l2	! %l2 = 596aa92c6d4e3e5d
!	Mem[0000000030101408] = ffffffff ffffff00, %l4 = ffffff00, %l5 = 069b8097
	ldda	[%i4+%o4]0x81,%l4	! %l4 = 00000000ffffffff 00000000ffffff00
!	Mem[000000001010143c] = 337e568b, %l3 = 0000000000d45066, %asi = 80
	ldswa	[%i4+0x03c]%asi,%l3	! %l3 = 00000000337e568b

p0_label_51:
!	Starting 10 instruction Store Burst
!	%l2 = 6d4e3e5d, %l3 = 337e568b, Mem[0000000010041410] = 00000057 5b7c3f0d
	std	%l2,[%i1+%o5]		! Mem[0000000010041410] = 6d4e3e5d 337e568b
!	%f24 = 29f2ed05, Mem[0000000030101408] = ffffffff
	sta	%f24,[%i4+%o4]0x89	! Mem[0000000030101408] = 29f2ed05
!	%l5 = 00000000ffffff00, Mem[0000000030001408] = b59cb86cf4e81e6d
	stxa	%l5,[%i0+%o4]0x81	! Mem[0000000030001408] = 00000000ffffff00
!	%l7 = 000000001d10ac3a, %l5 = 00000000ffffff00, %l0 = 0000000000000000
	udivx	%l7,%l5,%l0		! %l0 = 0000000000000000
!	%l4 = 00000000ffffffff, Mem[000000001000142c] = 96c4574b
	stw	%l4,[%i0+0x02c]		! Mem[000000001000142c] = ffffffff
!	Mem[00000000100c143c] = 157972ab, %l7 = 000000001d10ac3a, %asi = 80
	swapa	[%i3+0x03c]%asi,%l7	! %l7 = 00000000157972ab
!	Code Fragment 4, seed = 283253
p0_fragment_6:
!	%l0 = 0000000000000000
	setx	0xe026fed19c5a697e,%g7,%l0 ! %l0 = e026fed19c5a697e
!	%l1 = 0000000097809b06
	setx	0x327c5b99ccaabe29,%g7,%l1 ! %l1 = 327c5b99ccaabe29
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = e026fed19c5a697e
	setx	0xa5a8e5ed92288ee4,%g7,%l0 ! %l0 = a5a8e5ed92288ee4
!	%l1 = 327c5b99ccaabe29
	setx	0x93bcbf8290185eaf,%g7,%l1 ! %l1 = 93bcbf8290185eaf
p0_fragment_6_end:
!	%l1 = 93bcbf8290185eaf, Mem[0000000030141408] = ff9b80971d5da0d1
	stxa	%l1,[%i5+%o4]0x81	! Mem[0000000030141408] = 93bcbf8290185eaf
!	%l5 = 00000000ffffff00, Mem[0000000010041400] = 00d45066
	stwa	%l5,[%i1+%g0]0x88	! Mem[0000000010041400] = ffffff00
!	%f5  = 00001579, Mem[00000000100c1410] = 7e1d2d13
	sta	%f5 ,[%i3+%o5]0x80	! Mem[00000000100c1410] = 00001579

p0_label_52:
!	Starting 10 instruction Load Burst
!	%l6 = 000000007c5b81ff, %l3 = 00000000337e568b, %l3 = 00000000337e568b
	sdivx	%l6,%l3,%l3		! %l3 = 0000000000000002
!	Mem[00000000300c1400] = ff815b7c, %l0 = a5a8e5ed92288ee4
	lduba	[%i3+%g0]0x89,%l0	! %l0 = 000000000000007c
!	Mem[00000000218000c0] = 16ab8bd0, %l6 = 000000007c5b81ff, %asi = 80
	lduba	[%o3+0x0c0]%asi,%l6	! %l6 = 0000000000000016
!	Mem[0000000010101404] = 583e7df1, %l7 = 00000000157972ab
	ldsb	[%i4+0x004],%l7		! %l7 = 0000000000000058
!	Mem[00000000300c1408] = 570000002ca96a59, %l6 = 0000000000000016
	ldxa	[%i3+%o4]0x89,%l6	! %l6 = 570000002ca96a59
!	Mem[00000000300c1410] = 0e2308cf2e290000, %f14 = 3c28b4d2 2ca96a59
	ldda	[%i3+%o5]0x89,%f14	! %f14 = 0e2308cf 2e290000
!	Mem[0000000010101438] = 66a682c2 337e568b, %l2 = 6d4e3e5d, %l3 = 00000002, %asi = 80
	ldda	[%i4+0x038]%asi,%l2	! %l2 = 0000000066a682c2 00000000337e568b
!	Mem[0000000010141408] = 97809b06, %f28 = 65b32c45
	ld	[%i5+%o4],%f28		! %f28 = 97809b06
!	Mem[0000000010101408] = 0e230857, %l0 = 000000000000007c
	lduwa	[%i4+%o4]0x88,%l0	! %l0 = 000000000e230857
!	Mem[000000001014142e] = 596aa92c, %l3 = 00000000337e568b, %asi = 80
	ldsha	[%i5+0x02e]%asi,%l3	! %l3 = ffffffffffffa92c

p0_label_53:
!	Starting 10 instruction Store Burst
!	%f23 = ead2d20d, Mem[0000000010081408] = ec000000
	sta	%f23,[%i2+%o4]0x88	! Mem[0000000010081408] = ead2d20d
!	Mem[0000000010041410] = 6d4e3e5d, %l0 = 000000000e230857
	ldstuba	[%i1+%o5]0x80,%l0	! %l0 = 000000000000006d
!	Mem[0000000010081408] = 0dd2d2ea, %l4 = 00000000ffffffff
	ldstuba	[%i2+%o4]0x80,%l4	! %l4 = 000000000000000d
	membar	#Sync			! Added by membar checker (9)
!	%l3 = ffffffffffffa92c, Mem[0000000010101400] = 0b14976b
	stba	%l3,[%i4+%g0]0x88	! Mem[0000000010101400] = 0b14972c
!	%l6 = 570000002ca96a59, Mem[0000000010141408] = 97809b06
	stha	%l6,[%i5+%o4]0x80	! Mem[0000000010141408] = 6a599b06
!	Mem[0000000010141424] = 2ca96a59, %l1 = 0000000090185eaf
	swap	[%i5+0x024],%l1		! %l1 = 000000002ca96a59
!	Mem[0000000010001400] = 86434b36, %l5 = 00000000ffffff00
	ldstuba	[%i0+%g0]0x88,%l5	! %l5 = 0000000000000036
!	%l3 = ffffffffffffa92c, Mem[0000000010141410] = 00005cd15a018f5d
	stxa	%l3,[%i5+%o5]0x80	! Mem[0000000010141410] = ffffffffffffa92c
!	Mem[00000000211c0000] = 5cd16b10, %l6 = 570000002ca96a59
	ldstub	[%o2+%g0],%l6		! %l6 = 000000000000005c
!	Mem[0000000030101400] = 97809bff 000080ff 05edf229 ffffff00
!	%f16 = f17d3e58 0b14976b 132d1d7e 0e230857
!	%f20 = 97809b06 3e401579 132d1dff ead2d20d
!	%f24 = 29f2ed05 f8301428 ffeb225e 2e2979ff
!	%f28 = 97809b06 649f9e67 8b567e33 c282a666
	stda	%f16,[%i4+%g0]ASI_BLK_AIUS	! Block Store to 0000000030101400

p0_label_54:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = ead2d2ff, %l4 = 000000000000000d
	lduba	[%i2+%o4]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010081410] = ffeb0000038da6db, %f0  = 596a0000 39e923a1
	ldda	[%i2+%o5]0x88,%f0 	! %f0  = ffeb0000 038da6db
!	Mem[0000000010081408] = ffd2d2ea 5b0fe2ff, %l2 = 66a682c2, %l3 = ffffa92c
	ldda	[%i2+%o4]0x80,%l2	! %l2 = 00000000ffd2d2ea 000000005b0fe2ff
!	Mem[0000000030141408] = af5e189082bfbc93, %f14 = 0e2308cf 2e290000
	ldda	[%i5+%o4]0x89,%f14	! %f14 = af5e1890 82bfbc93
!	Mem[0000000030081408] = 3aac101d, %l7 = 0000000000000058
	lduba	[%i2+%o4]0x81,%l7	! %l7 = 000000000000003a
	membar	#Sync			! Added by membar checker (10)
!	Mem[0000000010101408] = 5708230e 7e1d2d13, %l4 = 000000ff, %l5 = 00000036
	ldda	[%i4+%o4]0x80,%l4	! %l4 = 000000005708230e 000000007e1d2d13
!	Mem[0000000020800041] = 1fff18e0, %l7 = 000000000000003a
	ldsb	[%o1+0x041],%l7		! %l7 = ffffffffffffffff
!	Mem[00000000100c1418] = 4dff998a 389c3533, %l6 = 0000005c, %l7 = ffffffff
	ldd	[%i3+0x018],%l6		! %l6 = 000000004dff998a 00000000389c3533
!	Mem[0000000030141400] = f0c1e2ff, %l1 = 000000002ca96a59
	ldsha	[%i5+%g0]0x89,%l1	! %l1 = ffffffffffffe2ff
!	Mem[0000000030081408] = 1d10ac3a, %l4 = 000000005708230e
	lduwa	[%i2+%o4]0x89,%l4	! %l4 = 000000001d10ac3a

p0_label_55:
!	Starting 10 instruction Store Burst
!	%l5 = 000000007e1d2d13, Mem[0000000030101410] = 7915403e069b8097
	stxa	%l5,[%i4+%o5]0x89	! Mem[0000000030101410] = 000000007e1d2d13
!	Mem[0000000030181400] = 00eb225e 41839821 0000976b 0000000b
!	%f0  = ffeb0000 038da6db ff9b8097 1d5da0d1
!	%f4  = 00000000 00001579 ffffffff ffffff00
!	%f8  = 186c9588 54a4aa79 28632106 7e1d2dff
!	%f12 = 6d1ee8f4 6cb89cb5 af5e1890 82bfbc93
	stda	%f0 ,[%i6+%g0]ASI_COMMIT_S	! Block Store to 0000000030181400
!	Mem[00000000300c1408] = 2ca96a59, %l5 = 000000007e1d2d13
	swapa	[%i3+%o4]0x89,%l5	! %l5 = 000000002ca96a59
!	%f25 = f8301428, Mem[0000000030001400] = 7e1d2dff
	sta	%f25,[%i0+%g0]0x89	! Mem[0000000030001400] = f8301428
!	Mem[0000000010101413] = 7915403e, %l7 = 00000000389c3533
	ldstuba	[%i4+0x013]%asi,%l7	! %l7 = 000000000000003e
!	Mem[0000000010081428] = 4e4c3d3656f00eaf, %l7 = 000000000000003e, %l6 = 000000004dff998a
	add	%i2,0x28,%g1
	casxa	[%g1]0x80,%l7,%l6	! %l6 = 4e4c3d3656f00eaf
!	%l6 = 56f00eaf, %l7 = 0000003e, Mem[0000000030101408] = 132d1d7e 0e230857
	stda	%l6,[%i4+%o4]0x81	! Mem[0000000030101408] = 56f00eaf 0000003e
	membar	#Sync			! Added by membar checker (11)
!	%l0 = 000000000000006d, Mem[0000000010181408] = 97809b06
	stba	%l0,[%i6+%o4]0x88	! Mem[0000000010181408] = 97809b6d
!	%f23 = ead2d20d, %f14 = af5e1890, %f0  = ffeb0000
	fdivs	%f23,%f14,%f0 		! %f0  = 7af300d9
!	%l6 = 4e4c3d3656f00eaf, Mem[0000000030181400] = 0000ebff
	stha	%l6,[%i6+%g0]0x89	! Mem[0000000030181400] = 00000eaf

p0_label_56:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = ff4e3e5d, %l6 = 4e4c3d3656f00eaf
	ldsba	[%i1+%o5]0x80,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010041400] = 00ffffff, %l5 = 000000002ca96a59
	lduba	[%i1+%g0]0x80,%l5	! %l5 = 0000000000000000
!	%l6 = ffffffffffffffff, immd = 000008a7, %y  = 0ea9e0ac
	smul	%l6,0x8a7,%l1		! %l1 = fffffffffffff759, %y = ffffffff
!	Mem[0000000030141400] = f0c1e2ff, %l7 = 000000000000003e
	lduha	[%i5+%g0]0x89,%l7	! %l7 = 000000000000e2ff
!	Mem[0000000030041400] = 33b21d7d, %l3 = 000000005b0fe2ff
	lduwa	[%i1+%g0]0x89,%l3	! %l3 = 0000000033b21d7d
!	Mem[00000000300c1408] = 132d1d7e, %l2 = 00000000ffd2d2ea
	ldsha	[%i3+%o4]0x81,%l2	! %l2 = 000000000000132d
!	Mem[0000000030041400] = 7d1db233, %l2 = 000000000000132d
	lduha	[%i1+%g0]0x81,%l2	! %l2 = 0000000000007d1d
!	%l2 = 0000000000007d1d, %l1 = fffffffffffff759, %l4 = 000000001d10ac3a
	andn	%l2,%l1,%l4		! %l4 = 0000000000000804
!	%f30 = 8b567e33, %f6  = ffffffff
	fcmpes	%fcc2,%f30,%f6 		! %fcc2 = 3
!	Mem[00000000100c1436] = 38ff3e85, %l5 = 0000000000000000, %asi = 80
	ldsha	[%i3+0x036]%asi,%l5	! %l5 = 0000000000003e85

p0_label_57:
!	Starting 10 instruction Store Burst
!	Mem[0000000010081400] = 4107e4c5, %l5 = 0000000000003e85
	ldstuba	[%i2+%g0]0x88,%l5	! %l5 = 00000000000000c5
!	Mem[0000000030101400] = 583e7df1, %l1 = 00000000fffff759
	swapa	[%i4+%g0]0x89,%l1	! %l1 = 00000000583e7df1
!	%f29 = 649f9e67, %f12 = 6d1ee8f4 6cb89cb5
	fstod	%f29,%f12		! %f12 = 4493f3cc e0000000
!	%f28 = 97809b06 649f9e67, %l6 = ffffffffffffffff
!	Mem[0000000010141410] = ffffffffffffa92c
	add	%i5,0x010,%g1
	stda	%f28,[%g1+%l6]ASI_PST8_PL ! Mem[0000000010141410] = 679e9f64069b8097
!	%l6 = ffffffff, %l7 = 0000e2ff, Mem[0000000030081400] = 596a0000 39e923a1
	stda	%l6,[%i2+%g0]0x81	! Mem[0000000030081400] = ffffffff 0000e2ff
!	%l7 = 000000000000e2ff, Mem[0000000030181410] = 7915000000000000
	stxa	%l7,[%i6+%o5]0x89	! Mem[0000000030181410] = 000000000000e2ff
!	%f20 = 97809b06, Mem[0000000010181400] = ff5c8700
	sta	%f20,[%i6+%g0]0x80	! Mem[0000000010181400] = 97809b06
!	Mem[0000000010041438] = 691692a26ed2baeb, %l6 = ffffffffffffffff, %l6 = ffffffffffffffff
	add	%i1,0x38,%g1
	casxa	[%g1]0x80,%l6,%l6	! %l6 = 691692a26ed2baeb
!	%f18 = 132d1d7e 0e230857, Mem[0000000010141428] = 00000000 596aa92c
	std	%f18,[%i5+0x028]	! Mem[0000000010141428] = 132d1d7e 0e230857
!	%f23 = ead2d20d, %f31 = c282a666
	fcmpes	%fcc3,%f23,%f31		! %fcc3 = 1

p0_label_58:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = 0e230857, %f15 = 82bfbc93
	lda	[%i4+%o4]0x88,%f15	! %f15 = 0e230857
!	Mem[0000000030101408] = 56f00eaf, %l6 = 691692a26ed2baeb
	lduba	[%i4+%o4]0x81,%l6	! %l6 = 0000000000000056
!	Mem[0000000030001408] = 00000000, %l7 = 000000000000e2ff
	ldsha	[%i0+%o4]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000010181408] = 6d9b8097, %l3 = 0000000033b21d7d
	lduba	[%i6+%o4]0x80,%l3	! %l3 = 000000000000006d
!	Mem[00000000300c1400] = 7c5b81ff7ab2fe81, %l6 = 0000000000000056
	ldxa	[%i3+%g0]0x81,%l6	! %l6 = 7c5b81ff7ab2fe81
!	Mem[0000000030181410] = 0000e2ff, %l3 = 000000000000006d
	lduba	[%i6+%o5]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000021800041] = ff978370, %l2 = 0000000000007d1d
	ldsb	[%o3+0x041],%l2		! %l2 = ffffffffffffff97
!	Mem[0000000030041400] = 7d1db2330ea9e0ac, %l3 = 00000000000000ff
	ldxa	[%i1+%g0]0x81,%l3	! %l3 = 7d1db2330ea9e0ac
!	Mem[0000000010041400] = 00ffffff, %l5 = 00000000000000c5
	lduha	[%i1+%g0]0x80,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010081408] = ead2d2ff, %l4 = 0000000000000804
	ldsba	[%i2+%o4]0x88,%l4	! %l4 = ffffffffffffffff

p0_label_59:
!	Starting 10 instruction Store Burst
!	Mem[0000000030101400] = 59f7ffff, %l5 = 00000000000000ff
	swapa	[%i4+%g0]0x81,%l5	! %l5 = 0000000059f7ffff
!	Mem[0000000010101408] = 5708230e, %l5 = 0000000059f7ffff, %asi = 80
	swapa	[%i4+0x008]%asi,%l5	! %l5 = 000000005708230e
!	%l6 = 7c5b81ff7ab2fe81, Mem[0000000030141408] = af5e189082bfbc93
	stxa	%l6,[%i5+%o4]0x89	! Mem[0000000030141408] = 7c5b81ff7ab2fe81
!	%l6 = 7c5b81ff7ab2fe81, Mem[0000000030101408] = af0ef056
	stwa	%l6,[%i4+%o4]0x89	! Mem[0000000030101408] = 7ab2fe81
!	%f5  = 00001579, Mem[0000000010041408] = 00000000
	sta	%f5 ,[%i1+%o4]0x80	! Mem[0000000010041408] = 00001579
!	%l4 = ffffffffffffffff, immd = fffffffffffff95e, %l1  = 00000000583e7df1
	mulx	%l4,-0x6a2,%l1		! %l1 = 00000000000006a2
!	Mem[00000000201c0001] = 1d7de880, %l7 = 0000000000000000
	ldstuba	[%o0+0x001]%asi,%l7	! %l7 = 000000000000007d
!	Mem[0000000030181408] = ff9b8097, %l6 = 7c5b81ff7ab2fe81
	ldstuba	[%i6+%o4]0x81,%l6	! %l6 = 00000000000000ff
!	Mem[0000000021800001] = 79a83940, %l7 = 000000000000007d
	ldstub	[%o3+0x001],%l7		! %l7 = 00000000000000a8
!	Mem[0000000030101410] = 7e1d2d13, %l5 = 000000005708230e
	swapa	[%i4+%o5]0x89,%l5	! %l5 = 000000007e1d2d13

p0_label_60:
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = ffffffff, %l3 = 7d1db2330ea9e0ac
	lduha	[%i2+%g0]0x89,%l3	! %l3 = 000000000000ffff
!	%l3 = 000000000000ffff, immd = 0000000000000384, %l108 = 0000000000000005
	udivx	%l3,0x384,%l5		! %l5 = 0000000000000048
!	Mem[0000000030081410] = 596aa92c 6d4e3e5d, %l6 = 000000ff, %l7 = 000000a8
	ldda	[%i2+%o5]0x81,%l6	! %l6 = 00000000596aa92c 000000006d4e3e5d
!	Mem[0000000030081410] = 596aa92c, %l5 = 0000000000000048
	ldsba	[%i2+%o5]0x81,%l5	! %l5 = 0000000000000059
!	Mem[0000000010081400] = 31c86c1d 4107e4ff, %l2 = ffffff97, %l3 = 0000ffff
	ldda	[%i2+%g0]0x88,%l2	! %l2 = 000000004107e4ff 0000000031c86c1d
!	Mem[0000000030001410] = 000000006650d400, %l3 = 0000000031c86c1d
	ldxa	[%i0+%o5]0x89,%l3	! %l3 = 000000006650d400
!	Mem[0000000030101400] = 000000ff 0b14976b, %l6 = 596aa92c, %l7 = 6d4e3e5d
	ldda	[%i4+%g0]0x81,%l6	! %l6 = 00000000000000ff 000000000b14976b
!	Mem[000000001000140a] = 069b8097, %l2 = 000000004107e4ff
	ldsh	[%i0+0x00a],%l2		! %l2 = ffffffffffff8097
!	Mem[0000000010001422] = 49339780, %l0 = 000000000000006d, %asi = 80
	lduha	[%i0+0x022]%asi,%l0	! %l0 = 0000000000009780
!	Mem[0000000030181400] = af0e0000 038da6db, %l2 = ffff8097, %l3 = 6650d400
	ldda	[%i6+%g0]0x81,%l2	! %l2 = 00000000af0e0000 00000000038da6db

p0_label_61:
!	Starting 10 instruction Store Burst
!	Mem[0000000010001428] = 8f5ca106, %l0 = 0000000000009780
	swap	[%i0+0x028],%l0		! %l0 = 000000008f5ca106
!	Mem[0000000010001408] = 069b8097, %f0  = 7af300d9
	lda	[%i0+%o4]0x80,%f0 	! %f0 = 069b8097
!	%f20 = 97809b06, Mem[0000000010141410] = 679e9f64
	sta	%f20,[%i5+%o5]0x80	! Mem[0000000010141410] = 97809b06
!	%f12 = 4493f3cc, Mem[00000000300c1408] = 132d1d7e
	sta	%f12,[%i3+%o4]0x81	! Mem[00000000300c1408] = 4493f3cc
!	Mem[0000000030001400] = 281430f8, %l6 = 00000000000000ff
	ldstuba	[%i0+%g0]0x81,%l6	! %l6 = 0000000000000028
!	%f6  = ffffffff ffffff00, Mem[0000000010141410] = 97809b06 069b8097
	stda	%f6 ,[%i5+%o5]0x80	! Mem[0000000010141410] = ffffffff ffffff00
!	%l0 = 000000008f5ca106, Mem[0000000010181410] = 1867653c596aa92c
	stxa	%l0,[%i6+%o5]0x88	! Mem[0000000010181410] = 000000008f5ca106
!	Mem[0000000030001408] = 00000000, %l3 = 00000000038da6db
	swapa	[%i0+%o4]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000010141404] = 2aa016a9, %l3 = 0000000000000000
	ldstuba	[%i5+0x004]%asi,%l3	! %l3 = 000000000000002a
!	%f1  = 038da6db, Mem[0000000030101400] = 000000ff
	sta	%f1 ,[%i4+%g0]0x81	! Mem[0000000030101400] = 038da6db

p0_label_62:
!	Starting 10 instruction Load Burst
!	Mem[0000000021800000] = 79ff3940, %l5 = 0000000000000059
	ldsh	[%o3+%g0],%l5		! %l5 = 00000000000079ff
!	Mem[0000000030041410] = ff2d1d7e06216328, %l4 = ffffffffffffffff
	ldxa	[%i1+%o5]0x81,%l4	! %l4 = ff2d1d7e06216328
!	%l4 = ff2d1d7e06216328, %l3 = 000000000000002a, %l1 = 00000000000006a2
	subc	%l4,%l3,%l1		! %l1 = ff2d1d7e062162fe
!	Mem[0000000030141408] = 7c5b81ff7ab2fe81, %f12 = 4493f3cc e0000000
	ldda	[%i5+%o4]0x89,%f12	! %f12 = 7c5b81ff 7ab2fe81
!	Mem[000000001014143c] = ae96bcff, %l5 = 00000000000079ff, %asi = 80
	lduwa	[%i5+0x03c]%asi,%l5	! %l5 = 00000000ae96bcff
!	Mem[0000000010141408] = 6a599b06, %l1 = ff2d1d7e062162fe
	ldsba	[%i5+%o4]0x80,%l1	! %l1 = 000000000000006a
!	Mem[00000000100c1410] = 79150000, %l6 = 0000000000000028
	ldsha	[%i3+%o5]0x88,%l6	! %l6 = 0000000000000000
!	%l2 = 00000000af0e0000, %l7 = 000000000b14976b, %l0 = 000000008f5ca106
	xor	%l2,%l7,%l0		! %l0 = 00000000a41a976b
!	Mem[000000001004142c] = 60fe70cf, %l5 = 00000000ae96bcff
	ldsw	[%i1+0x02c],%l5		! %l5 = 0000000060fe70cf
!	Mem[0000000030001408] = 038da6db, %l6 = 0000000000000000
	lduba	[%i0+%o4]0x81,%l6	! %l6 = 0000000000000003

p0_label_63:
!	Starting 10 instruction Store Burst
!	%l1 = 000000000000006a, Mem[0000000030041400] = 33b21d7d
	stwa	%l1,[%i1+%g0]0x89	! Mem[0000000030041400] = 0000006a
!	Mem[0000000010041408] = 00001579, %l6 = 0000000000000003
	swapa	[%i1+%o4]0x80,%l6	! %l6 = 0000000000001579
!	%f4  = 00000000 00001579, %l5 = 0000000060fe70cf
!	Mem[0000000010081400] = ffe407411d6cc831
	stda	%f4,[%i2+%l5]ASI_PST32_P ! Mem[0000000010081400] = 0000000000001579
!	%f26 = ffeb225e, Mem[00000000100c1410] = 79150000
	sta	%f26,[%i3+%o5]0x88	! Mem[00000000100c1410] = ffeb225e
!	Mem[0000000010001400] = 86434bff, %l2 = 00000000af0e0000
	swapa	[%i0+%g0]0x88,%l2	! %l2 = 0000000086434bff
!	%l3 = 000000000000002a, Mem[00000000218001c0] = 2b1d6c90
	stb	%l3,[%o3+0x1c0]		! Mem[00000000218001c0] = 2a1d6c90
!	Mem[0000000010081420] = 0607c838, %l3 = 0000002a, %l1 = 0000006a
	add	%i2,0x20,%g1
	casa	[%g1]0x80,%l3,%l1	! %l1 = 000000000607c838
!	%f20 = 97809b06 3e401579, %l3 = 000000000000002a
!	Mem[00000000100c1400] = ff0000004beb8b11
	stda	%f20,[%i3+%l3]ASI_PST32_P ! Mem[00000000100c1400] = 97809b064beb8b11
!	%l5 = 0000000060fe70cf, Mem[0000000010181432] = 05e1ff04, %asi = 80
	stha	%l5,[%i6+0x032]%asi	! Mem[0000000010181430] = 05e170cf
!	%f22 = 132d1dff, Mem[0000000010041410] = 5d3e4eff
	sta	%f22,[%i1+%o5]0x88	! Mem[0000000010041410] = 132d1dff

p0_label_64:
!	Starting 10 instruction Load Burst
!	%f4  = 00000000, %f8  = 186c9588
	fsqrts	%f4 ,%f8 		! %f8  = 00000000
!	Mem[0000000010101408] = 132d1d7efffff759, %f30 = 8b567e33 c282a666
	ldda	[%i4+%o4]0x88,%f30	! %f30 = 132d1d7e fffff759
!	Mem[0000000010101410] = ff401579, %l1 = 000000000607c838
	ldswa	[%i4+%o5]0x88,%l1	! %l1 = ffffffffff401579
	membar	#Sync			! Added by membar checker (12)
!	Mem[0000000030181400] = af0e0000 038da6db ff9b8097 1d5da0d1
!	Mem[0000000030181410] = ffe20000 00000000 ffffffff ffffff00
!	Mem[0000000030181420] = 186c9588 54a4aa79 28632106 7e1d2dff
!	Mem[0000000030181430] = 6d1ee8f4 6cb89cb5 af5e1890 82bfbc93
	ldda	[%i6+%g0]ASI_BLK_S,%f0 	! Block Load from 0000000030181400
!	Mem[0000000010101410] = ff401579, %l2 = 0000000086434bff
	ldsha	[%i4+%o5]0x88,%l2	! %l2 = 0000000000001579
!	Mem[0000000010141400] = 000000ff, %l0 = 00000000a41a976b
	lduwa	[%i5+%g0]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[0000000021800080] = 5baa49a0, %l1 = ffffffffff401579
	ldsb	[%o3+0x080],%l1		! %l1 = 000000000000005b
!	Mem[0000000010041400] = 00ffffff, %f25 = f8301428
	lda	[%i1+%g0]0x80,%f25	! %f25 = 00ffffff
!	Mem[00000000300c1400] = 7c5b81ff, %l4 = ff2d1d7e06216328
	ldsha	[%i3+%g0]0x81,%l4	! %l4 = 0000000000007c5b
!	Mem[00000000100c1400] = 069b8097, %l4 = 0000000000007c5b
	ldswa	[%i3+%g0]0x88,%l4	! %l4 = 00000000069b8097

p0_label_65:
!	Starting 10 instruction Store Burst
!	%l4 = 069b8097, %l5 = 60fe70cf, Mem[0000000010001418] = c5acffff 33b21d7d, %asi = 80
	stda	%l4,[%i0+0x018]%asi	! Mem[0000000010001418] = 069b8097 60fe70cf
!	%f16 = f17d3e58 0b14976b, Mem[0000000010101410] = 791540ff 069b8097
	stda	%f16,[%i4+%o5]0x80	! Mem[0000000010101410] = f17d3e58 0b14976b
!	Mem[0000000010041408] = 03000000, %l5 = 0000000060fe70cf
	swapa	[%i1+%o4]0x88,%l5	! %l5 = 0000000003000000
!	Mem[0000000010181438] = 4bad6d62, %l5 = 0000000003000000
	swap	[%i6+0x038],%l5		! %l5 = 000000004bad6d62
!	Mem[0000000030001410] = 6650d400, %l2 = 0000000000001579
	swapa	[%i0+%o5]0x89,%l2	! %l2 = 000000006650d400
!	%f4  = ffe20000, Mem[0000000030101408] = 81feb27a
	sta	%f4 ,[%i4+%o4]0x81	! Mem[0000000030101408] = ffe20000
!	Mem[0000000010001408] = 069b8097, %l7 = 000000000b14976b
	swapa	[%i0+%o4]0x80,%l7	! %l7 = 00000000069b8097
!	%l5 = 000000004bad6d62, Mem[0000000010141400] = 000000ff
	stba	%l5,[%i5+%g0]0x88	! Mem[0000000010141400] = 00000062
!	Mem[0000000010001404] = 3e401579, %l4 = 00000000069b8097
	swap	[%i0+0x004],%l4		! %l4 = 000000003e401579
!	Mem[0000000010081410] = dba68d03, %l2 = 000000006650d400
	swapa	[%i2+%o5]0x80,%l2	! %l2 = 00000000dba68d03

p0_label_66:
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = ffe20000, %l7 = 00000000069b8097
	ldswa	[%i4+%o4]0x81,%l7	! %l7 = ffffffffffe20000
!	Mem[0000000010041408] = 04ff000060fe70cf, %l7 = ffffffffffe20000
	ldxa	[%i1+%o4]0x88,%l7	! %l7 = 04ff000060fe70cf
!	%l3 = 000000000000002a, %l3 = 000000000000002a, %l1 = 000000000000005b
	orn	%l3,%l3,%l1		! %l1 = ffffffffffffffff
!	Mem[0000000010041408] = cf70fe600000ff04, %l5 = 000000004bad6d62
	ldx	[%i1+%o4],%l5		! %l5 = cf70fe600000ff04
!	Mem[0000000010141400] = a916a0ff00000062, %l1 = ffffffffffffffff
	ldxa	[%i5+%g0]0x88,%l1	! %l1 = a916a0ff00000062
!	%l4 = 000000003e401579, imm = ffffffffffffffb9, %l4 = 000000003e401579
	xnor	%l4,-0x047,%l4		! %l4 = 000000003e40153f
!	Mem[0000000010041422] = 77619f0c, %l7 = 04ff000060fe70cf
	lduh	[%i1+0x022],%l7		! %l7 = 0000000000009f0c
!	Mem[00000000100c1430] = 05e1ff0438ff3e85, %f24 = 29f2ed05 00ffffff, %asi = 80
	ldda	[%i3+0x030]%asi,%f24	! %f24 = 05e1ff04 38ff3e85
!	Mem[0000000030041410] = ff2d1d7e, %f19 = 0e230857
	lda	[%i1+%o5]0x81,%f19	! %f19 = ff2d1d7e
!	Mem[00000000201c0000] = 1dffe880, %l0 = 00000000000000ff
	lduh	[%o0+%g0],%l0		! %l0 = 0000000000001dff

p0_label_67:
!	Starting 10 instruction Store Burst
!	Mem[0000000010141400] = 00000062, %l7 = 0000000000009f0c
	ldstuba	[%i5+%g0]0x88,%l7	! %l7 = 0000000000000062
!	Mem[0000000021800041] = ff978370, %l7 = 0000000000000062
	ldstub	[%o3+0x041],%l7		! %l7 = 0000000000000097
!	%l6 = 0000000000001579, %l3 = 000000000000002a, %l7 = 0000000000000097
	sub	%l6,%l3,%l7		! %l7 = 000000000000154f
!	Mem[000000001018140d] = 00000a43, %l4 = 000000003e40153f
	ldstub	[%i6+0x00d],%l4		! %l4 = 0000000000000000
!	%f22 = 132d1dff, Mem[0000000010141408] = 069b596a
	sta	%f22,[%i5+%o4]0x88	! Mem[0000000010141408] = 132d1dff
	membar	#Sync			! Added by membar checker (13)
!	%l1 = a916a0ff00000062, Mem[0000000030181410] = 0000e2ff
	stha	%l1,[%i6+%o5]0x89	! Mem[0000000030181410] = 00000062
!	%l2 = 00000000dba68d03, Mem[0000000010181400] = 118beb4b069b8097
	stxa	%l2,[%i6+%g0]0x88	! Mem[0000000010181400] = 00000000dba68d03
!	%l5 = cf70fe600000ff04, Mem[0000000010101400] = 2c97140b
	stha	%l5,[%i4+%g0]0x80	! Mem[0000000010101400] = ff04140b
!	%f19 = ff2d1d7e, Mem[0000000030001410] = 79150000
	sta	%f19,[%i0+%o5]0x81	! Mem[0000000030001410] = ff2d1d7e
!	%f12 = 6d1ee8f4, Mem[0000000030001410] = ff2d1d7e
	sta	%f12,[%i0+%o5]0x81	! Mem[0000000030001410] = 6d1ee8f4

p0_label_68:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c140d] = 069b8097, %l4 = 0000000000000000, %asi = 80
	lduba	[%i3+0x00d]%asi,%l4	! %l4 = 000000000000009b
!	Mem[0000000010181410] = 06a15c8f00000000, %f4  = ffe20000 00000000
	ldda	[%i6+%o5]0x80,%f4 	! %f4  = 06a15c8f 00000000
!	Mem[0000000010141404] = ffa016a9, %l3 = 000000000000002a, %asi = 80
	ldswa	[%i5+0x004]%asi,%l3	! %l3 = ffffffffffa016a9
!	Mem[0000000010041400] = 00ffffff, %l4 = 000000000000009b
	ldswa	[%i1+%g0]0x80,%l4	! %l4 = 0000000000ffffff
!	Mem[0000000030101400] = 6b97140bdba68d03, %l7 = 000000000000154f
	ldxa	[%i4+%g0]0x89,%l7	! %l7 = 6b97140bdba68d03
!	Mem[0000000030101400] = 038da6db, %l0 = 0000000000001dff
	ldswa	[%i4+%g0]0x81,%l0	! %l0 = 00000000038da6db
!	Mem[0000000030181400] = 00000eaf, %l4 = 0000000000ffffff
	ldsha	[%i6+%g0]0x89,%l4	! %l4 = 0000000000000eaf
!	Mem[0000000010001408] = 6b97140b, %l3 = ffffffffffa016a9
	ldsba	[%i0+%o4]0x88,%l3	! %l3 = 000000000000000b
!	Mem[0000000020800000] = 460142b0, %l5 = cf70fe600000ff04, %asi = 80
	lduha	[%o1+0x000]%asi,%l5	! %l5 = 0000000000004601
!	Mem[0000000010081408] = ead2d2ff, %l7 = 6b97140bdba68d03
	ldsha	[%i2+%o4]0x88,%l7	! %l7 = ffffffffffffd2ff

p0_label_69:
!	Starting 10 instruction Store Burst
!	%l6 = 0000000000001579, Mem[0000000010181400] = 00000000dba68d03
	stxa	%l6,[%i6+%g0]0x88	! Mem[0000000010181400] = 0000000000001579
!	%f28 = 97809b06, Mem[0000000030101400] = dba68d03
	sta	%f28,[%i4+%g0]0x89	! Mem[0000000030101400] = 97809b06
!	Mem[0000000010101410] = f17d3e58, %l5 = 0000000000004601
	ldsba	[%i4+%o5]0x80,%l5	! %l5 = fffffffffffffff1
!	Mem[000000001004140f] = 0000ff04, %l2 = 00000000dba68d03
	ldstuba	[%i1+0x00f]%asi,%l2	! %l2 = 0000000000000004
!	%f20 = 97809b06 3e401579, Mem[0000000010041410] = ff1d2d13 337e568b
	stda	%f20,[%i1+%o5]0x80	! Mem[0000000010041410] = 97809b06 3e401579
!	Mem[0000000010041408] = cf70fe60, %l7 = 00000000ffffd2ff
	swapa	[%i1+%o4]0x80,%l7	! %l7 = 00000000cf70fe60
!	Mem[0000000030141410] = 00000000, %l5 = 00000000fffffff1
	swapa	[%i5+%o5]0x81,%l5	! %l5 = 0000000000000000
!	%l6 = 00001579, %l7 = cf70fe60, Mem[00000000100c1408] = 5cff403e 069b8097
	stda	%l6,[%i3+%o4]0x80	! Mem[00000000100c1408] = 00001579 cf70fe60
!	Mem[0000000010081430] = 6d2fdaa4261af9a5, %l1 = a916a0ff00000062, %l0 = 00000000038da6db
	add	%i2,0x30,%g1
	casxa	[%g1]0x80,%l1,%l0	! %l0 = 6d2fdaa4261af9a5
!	%l5 = 0000000000000000, Mem[0000000030141410] = f1ffffff
	stba	%l5,[%i5+%o5]0x89	! Mem[0000000030141410] = f1ffff00

p0_label_70:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081437] = 261af9a5, %l7 = 00000000cf70fe60, %asi = 80
	lduba	[%i2+0x037]%asi,%l7	! %l7 = 00000000000000a5
!	Mem[0000000010181410] = 06a15c8f, %l2 = 0000000000000004
	ldsha	[%i6+%o5]0x80,%l2	! %l2 = 00000000000006a1
!	Mem[00000000211c0000] = ffd16b10, %l6 = 0000000000001579, %asi = 80
	lduba	[%o2+0x000]%asi,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010041420] = 77619f0c, %l7 = 00000000000000a5, %asi = 80
	lduwa	[%i1+0x020]%asi,%l7	! %l7 = 0000000077619f0c
!	Mem[0000000010181400] = 7915000000000000, %f0  = af0e0000 038da6db
	ldda	[%i6+%g0]0x80,%f0 	! %f0  = 79150000 00000000
!	Mem[00000000300c1408] = ccf39344, %l4 = 0000000000000eaf
	lduha	[%i3+%o4]0x89,%l4	! %l4 = 0000000000009344
!	Mem[0000000010001400] = 00000eaf 069b8097, %l2 = 000006a1, %l3 = 0000000b
	ldda	[%i0+%g0]0x80,%l2	! %l2 = 0000000000000eaf 00000000069b8097
!	Mem[0000000030001400] = 4f08230ef83014ff, %f16 = f17d3e58 0b14976b
	ldda	[%i0+%g0]0x89,%f16	! %f16 = 4f08230e f83014ff
!	Mem[0000000010101420] = 281430f805edf229, %f12 = 6d1ee8f4 6cb89cb5
	ldd	[%i4+0x020],%f12	! %f12 = 281430f8 05edf229
!	Mem[0000000010181408] = 97809b6d, %l5 = 0000000000000000
	ldswa	[%i6+%o4]0x88,%l5	! %l5 = ffffffff97809b6d

p0_label_71:
!	Starting 10 instruction Store Burst
!	%l0 = 6d2fdaa4261af9a5, imm = fffffffffffffde7, %l0 = 6d2fdaa4261af9a5
	and	%l0,-0x219,%l0		! %l0 = 6d2fdaa4261af9a5
!	%l6 = 00000000000000ff, Mem[0000000010101428] = ff79292e
	stb	%l6,[%i4+0x028]		! Mem[0000000010101428] = ff79292e
!	%l2 = 0000000000000eaf, Mem[0000000030081400] = ffffffff
	stha	%l2,[%i2+%g0]0x81	! Mem[0000000030081400] = 0eafffff
!	Mem[0000000010181433] = 05e170cf, %l2 = 0000000000000eaf
	ldstub	[%i6+0x033],%l2		! %l2 = 00000000000000cf
!	Mem[0000000010081408] = ffd2d2ea, %l4 = 0000000000009344
	swapa	[%i2+%o4]0x80,%l4	! %l4 = 00000000ffd2d2ea
!	%f14 = af5e1890 82bfbc93, Mem[0000000010041400] = ffffff00 ff35ca1d
	stda	%f14,[%i1+%g0]0x88	! Mem[0000000010041400] = af5e1890 82bfbc93
!	%l0 = 261af9a5, %l1 = 00000062, Mem[0000000030081400] = ffffaf0e ffe20000
	stda	%l0,[%i2+%g0]0x89	! Mem[0000000030081400] = 261af9a5 00000062
!	%l6 = 00000000000000ff, Mem[0000000030141400] = f0c1e2ff
	stha	%l6,[%i5+%g0]0x89	! Mem[0000000030141400] = f0c100ff
!	%l6 = 00000000000000ff, %l6 = 00000000000000ff, %y  = ffffffff
	sdiv	%l6,%l6,%l3		! %l3 = fffffffffefeff00
	mov	%l0,%y			! %y = 261af9a5
!	%f30 = 132d1d7e fffff759, Mem[0000000010181400] = 00001579 00000000
	stda	%f30,[%i6+%g0]0x88	! Mem[0000000010181400] = 132d1d7e fffff759

p0_label_72:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = 000000ff, %l2 = 00000000000000cf
	ldsha	[%i5+%g0]0x88,%l2	! %l2 = 00000000000000ff
!	%l4 = 00000000ffd2d2ea, %l0 = 6d2fdaa4261af9a5, %l5 = ffffffff97809b6d
	xor	%l4,%l0,%l5		! %l5 = 6d2fdaa4d9c82b4f
!	Mem[0000000030081410] = 596aa92c, %l5 = 6d2fdaa4d9c82b4f
	lduba	[%i2+%o5]0x81,%l5	! %l5 = 0000000000000059
!	Mem[0000000030001400] = ff1430f80e23084f, %l2 = 00000000000000ff
	ldxa	[%i0+%g0]0x81,%l2	! %l2 = ff1430f80e23084f
!	Mem[0000000021800140] = 28658430, %l4 = 00000000ffd2d2ea
	ldsh	[%o3+0x140],%l4		! %l4 = 0000000000002865
!	Mem[00000000201c0001] = 1dffe880, %l6 = 00000000000000ff
	ldsb	[%o0+0x001],%l6		! %l6 = ffffffffffffffff
	membar	#Sync			! Added by membar checker (14)
!	Mem[00000000100c1400] = 97809b06 4beb8b11 00001579 cf70fe60
!	Mem[00000000100c1410] = 5e22ebff 3c656718 4dff998a 389c3533
!	Mem[00000000100c1420] = 61a38498 80973349 61a38400 80973349
!	Mem[00000000100c1430] = 05e1ff04 38ff3e85 4bad6d62 1d10ac3a
	ldda	[%i3+%g0]ASI_BLK_PL,%f16	! Block Load from 00000000100c1400
!	Mem[00000000100c1400] = 97809b06 4beb8b11 00001579 cf70fe60
!	Mem[00000000100c1410] = 5e22ebff 3c656718 4dff998a 389c3533
!	Mem[00000000100c1420] = 61a38498 80973349 61a38400 80973349
!	Mem[00000000100c1430] = 05e1ff04 38ff3e85 4bad6d62 1d10ac3a
	ldda	[%i3+%g0]ASI_BLK_P,%f16	! Block Load from 00000000100c1400
!	Mem[0000000010141408] = ff1d2d133e401579, %l0 = 6d2fdaa4261af9a5
	ldxa	[%i5+%o4]0x80,%l0	! %l0 = ff1d2d133e401579
!	Mem[0000000030181410] = 00000062, %l2 = ff1430f80e23084f
	ldsba	[%i6+%o5]0x89,%l2	! %l2 = 0000000000000062

p0_label_73:
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000002865, Mem[0000000021800180] = 3f743a60, %asi = 80
	stba	%l4,[%o3+0x180]%asi	! Mem[0000000021800180] = 65743a60
!	%l6 = ffffffffffffffff, Mem[0000000010101400] = ff04140b
	stwa	%l6,[%i4+%g0]0x80	! Mem[0000000010101400] = ffffffff
!	Mem[0000000030181408] = 97809bff, %l4 = 0000000000002865
	swapa	[%i6+%o4]0x89,%l4	! %l4 = 0000000097809bff
!	Mem[0000000030081408] = 3aac101d, %l3 = fffffffffefeff00
	ldstuba	[%i2+%o4]0x81,%l3	! %l3 = 000000000000003a
!	%l1 = a916a0ff00000062, immd = fffffd9c, %y  = 261af9a5
	udiv	%l1,-0x264,%l0		! %l0 = 00000000261afa00
	mov	%l0,%y			! %y = 261afa00
!	Mem[0000000010181410] = 8f5ca106, %l1 = 0000000000000062
	swapa	[%i6+%o5]0x88,%l1	! %l1 = 000000008f5ca106
!	%l3 = 000000000000003a, Mem[0000000030141400] = ff00c1f0
	stwa	%l3,[%i5+%g0]0x81	! Mem[0000000030141400] = 0000003a
!	%l4 = 0000000097809bff, Mem[0000000020800000] = 460142b0
	sth	%l4,[%o1+%g0]		! Mem[0000000020800000] = 9bff42b0
!	%l0 = 00000000261afa00, Mem[0000000010181422] = 2c31ffe9
	sth	%l0,[%i6+0x022]		! Mem[0000000010181420] = 2c31fa00
!	%l0 = 00000000261afa00, Mem[0000000030141410] = f1ffff00
	stwa	%l0,[%i5+%o5]0x89	! Mem[0000000030141410] = 261afa00

p0_label_74:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = 069b8097, %l5 = 0000000000000059
	lduha	[%i1+%o5]0x88,%l5	! %l5 = 0000000000008097
!	Mem[00000000211c0001] = ffd16b10, %l7 = 0000000077619f0c
	ldsb	[%o2+0x001],%l7		! %l7 = ffffffffffffffd1
!	Mem[0000000010181410] = 00000062, %l1 = 000000008f5ca106
	lduwa	[%i6+%o5]0x88,%l1	! %l1 = 0000000000000062
!	Mem[0000000010141408] = 132d1dff, %l1 = 0000000000000062
	ldsba	[%i5+%o4]0x88,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010101410] = f17d3e58, %l4 = 0000000097809bff
	ldsha	[%i4+%o5]0x80,%l4	! %l4 = fffffffffffff17d
!	Mem[0000000030101410] = 0e230857 00000000, %l6 = ffffffff, %l7 = ffffffd1
	ldda	[%i4+%o5]0x81,%l6	! %l6 = 000000000e230857 0000000000000000
!	Mem[0000000020800000] = 9bff42b0, %l7 = 0000000000000000
	ldsb	[%o1+%g0],%l7		! %l7 = ffffffffffffff9b
!	Mem[00000000100c1410] = 5e22ebff, %l4 = fffffffffffff17d
	ldswa	[%i3+%o5]0x80,%l4	! %l4 = 000000005e22ebff
!	Mem[0000000010041410] = 069b8097, %l6 = 000000000e230857
	ldswa	[%i1+%o5]0x88,%l6	! %l6 = 00000000069b8097
!	Mem[0000000010001408] = 0b14976b, %l3 = 000000000000003a
	lduba	[%i0+%o4]0x80,%l3	! %l3 = 000000000000000b

p0_label_75:
!	Starting 10 instruction Store Burst
!	Mem[0000000010101410] = 583e7df1, %l6 = 00000000069b8097
	swapa	[%i4+%o5]0x88,%l6	! %l6 = 00000000583e7df1
!	Mem[0000000020800040] = 1fff18e0, %l6 = 00000000583e7df1
	ldstub	[%o1+0x040],%l6		! %l6 = 000000000000001f
!	%l3 = 000000000000000b, Mem[0000000010001408] = 0b14976b7915403e
	stxa	%l3,[%i0+%o4]0x80	! Mem[0000000010001408] = 000000000000000b
!	%f6  = ffffffff, %f3  = 1d5da0d1, %f11 = 7e1d2dff
	fdivs	%f6 ,%f3 ,%f11		! %f11 = ffffffff
!	%l2 = 00000062, %l3 = 0000000b, Mem[0000000030141410] = 261afa00 79150000
	stda	%l2,[%i5+%o5]0x89	! Mem[0000000030141410] = 00000062 0000000b
!	Mem[0000000010141408] = ff1d2d13, %l7 = ffffffffffffff9b
	ldstuba	[%i5+%o4]0x80,%l7	! %l7 = 00000000000000ff
!	%l7 = 00000000000000ff, Mem[0000000010141400] = ff000000
	stha	%l7,[%i5+%g0]0x80	! Mem[0000000010141400] = 00ff0000
!	Mem[0000000010081408] = 44930000, %l5 = 0000000000008097
	ldstuba	[%i2+%o4]0x88,%l5	! %l5 = 0000000000000000
!	Mem[00000000100c1400] = 069b8097, %l6 = 000000000000001f
	ldstuba	[%i3+%g0]0x88,%l6	! %l6 = 0000000000000097
!	%l5 = 0000000000000000, Mem[0000000010001408] = 00000000
	stwa	%l5,[%i0+%o4]0x88	! Mem[0000000010001408] = 00000000

p0_label_76:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001420] = 49339780, %f2  = ff9b8097
	ld	[%i0+0x020],%f2 	! %f2 = 49339780
!	Randomly selected nop
	nop
!	Mem[0000000010081408] = ffe20f5b 449300ff, %l6 = 00000097, %l7 = 000000ff
	ldda	[%i2+%o4]0x88,%l6	! %l6 = 00000000449300ff 00000000ffe20f5b
!	Mem[0000000021800140] = 28658430, %l7 = 00000000ffe20f5b, %asi = 80
	ldsha	[%o3+0x140]%asi,%l7	! %l7 = 0000000000002865
!	Mem[0000000010181420] = 2c31fa00, %l1 = ffffffffffffffff, %asi = 80
	ldswa	[%i6+0x020]%asi,%l1	! %l1 = 000000002c31fa00
!	Mem[00000000100c1400] = ff809b06, %l7 = 0000000000002865
	lduha	[%i3+%g0]0x80,%l7	! %l7 = 000000000000ff80
!	Mem[0000000030101410] = 0e230857, %l0 = 00000000261afa00
	lduba	[%i4+%o5]0x81,%l0	! %l0 = 000000000000000e
!	Mem[00000000300c1408] = 4493f3cc00000057, %l3 = 000000000000000b
	ldxa	[%i3+%o4]0x81,%l3	! %l3 = 4493f3cc00000057
!	Mem[0000000010001400] = 00000eaf, %f27 = 80973349
	lda	[%i0+%g0]0x80,%f27	! %f27 = 00000eaf
!	Mem[0000000010141408] = 7915403e132d1dff, %f26 = 61a38400 00000eaf
	ldda	[%i5+%o4]0x88,%f26	! %f26 = 7915403e 132d1dff

p0_label_77:
!	Starting 10 instruction Store Burst
!	%l2 = 0000000000000062, imm = fffffffffffff842, %l0 = 000000000000000e
	xnor	%l2,-0x7be,%l0		! %l0 = 00000000000007df
!	Mem[0000000030001408] = dba68d03, %l6 = 00000000449300ff
	swapa	[%i0+%o4]0x89,%l6	! %l6 = 00000000dba68d03
!	%l0 = 00000000000007df, Mem[0000000020800000] = 9bff42b0
	sth	%l0,[%o1+%g0]		! Mem[0000000020800000] = 07df42b0
!	%l2 = 0000000000000062, Mem[0000000030081400] = 00000062261af9a5
	stxa	%l2,[%i2+%g0]0x89	! Mem[0000000030081400] = 0000000000000062
!	%l5 = 0000000000000000, Mem[00000000201c0000] = 1dffe880, %asi = 80
	stha	%l5,[%o0+0x000]%asi	! Mem[00000000201c0000] = 0000e880
!	%l0 = 00000000000007df, %l6 = 00000000dba68d03, %l2 = 0000000000000062
	sub	%l0,%l6,%l2		! %l2 = ffffffff24597adc
!	Mem[0000000010081430] = 6d2fdaa4261af9a5, %l4 = 000000005e22ebff, %l3 = 4493f3cc00000057
	add	%i2,0x30,%g1
	casxa	[%g1]0x80,%l4,%l3	! %l3 = 6d2fdaa4261af9a5
!	Mem[0000000010001430] = 853eff38, %l5 = 0000000000000000
	swap	[%i0+0x030],%l5		! %l5 = 00000000853eff38
!	%f30 = 4bad6d62, %f5  = 00000000, %f22 = 4dff998a
	fadds	%f30,%f5 ,%f22		! %f22 = 4bad6d62
!	%l1 = 000000002c31fa00, Mem[0000000030081410] = 2ca96a59
	stwa	%l1,[%i2+%o5]0x89	! Mem[0000000030081410] = 2c31fa00

p0_label_78:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = 6d9b8097, %f27 = 132d1dff
	lda	[%i6+%o4]0x80,%f27	! %f27 = 6d9b8097
!	Mem[0000000030001400] = ff1430f80e23084f, %f28 = 05e1ff04 38ff3e85
	ldda	[%i0+%g0]0x81,%f28	! %f28 = ff1430f8 0e23084f
!	%f19 = cf70fe60, %f31 = 1d10ac3a
	fcmpes	%fcc1,%f19,%f31		! %fcc1 = 1
!	Mem[0000000010041400] = 93bcbf82 90185eaf ffffd2ff 0000ffff
!	Mem[0000000010041410] = 97809b06 3e401579 414076ca 34ff5573
!	Mem[0000000010041420] = 77619f0c ffffff95 1bb425d6 60fe70cf
!	Mem[0000000010041430] = 63b0e044 2ca96a59 691692a2 6ed2baeb
	ldda	[%i1+%g0]ASI_BLK_P,%f0 	! Block Load from 0000000010041400
!	Mem[0000000030141410] = 00000062, %l7 = 000000000000ff80
	ldsba	[%i5+%o5]0x89,%l7	! %l7 = 0000000000000062
!	Mem[0000000030041400] = 0000006a, %l3 = 6d2fdaa4261af9a5
	ldsha	[%i1+%g0]0x89,%l3	! %l3 = 000000000000006a
!	%f6  = 414076ca 34ff5573, Mem[0000000030081400] = 62000000 00000000
	stda	%f6 ,[%i2+%g0]0x81	! Mem[0000000030081400] = 414076ca 34ff5573
!	Mem[000000001000142a] = 00009780, %l4 = 000000005e22ebff
	ldsb	[%i0+0x02a],%l4		! %l4 = ffffffffffffff97
!	Mem[0000000030041408] = e36a770e, %l1 = 000000002c31fa00
	ldsha	[%i1+%o4]0x81,%l1	! %l1 = ffffffffffffe36a
!	Mem[0000000010141410] = ffffffff, %l2 = ffffffff24597adc
	lduwa	[%i5+%o5]0x88,%l2	! %l2 = 00000000ffffffff

p0_label_79:
!	Starting 10 instruction Store Burst
!	Mem[0000000010041408] = ffffd2ff, %l4 = 00000000ffffff97, %asi = 80
	swapa	[%i1+0x008]%asi,%l4	! %l4 = 00000000ffffd2ff
!	%l0 = 000007df, %l1 = ffffe36a, Mem[0000000030041400] = 0000006a ace0a90e
	stda	%l0,[%i1+%g0]0x89	! Mem[0000000030041400] = 000007df ffffe36a
!	Mem[0000000010181408] = 97809b6d, %l6 = 00000000dba68d03
	swapa	[%i6+%o4]0x88,%l6	! %l6 = 0000000097809b6d
!	Mem[0000000010101400] = ffffffff, %l6 = 0000000097809b6d
	ldstuba	[%i4+%g0]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[000000001008142c] = 56f00eaf, %l7 = 0000000000000062, %asi = 80
	swapa	[%i2+0x02c]%asi,%l7	! %l7 = 0000000056f00eaf
!	%f8  = 77619f0c ffffff95, Mem[0000000010141420] = 1f78ffe8 90185eaf, %asi = 80
	stda	%f8 ,[%i5+0x020]%asi	! Mem[0000000010141420] = 77619f0c ffffff95
	membar	#Sync			! Added by membar checker (15)
!	%l0 = 000007df, %l1 = ffffe36a, Mem[00000000100c1408] = 79150000 60fe70cf
	stda	%l0,[%i3+%o4]0x88	! Mem[00000000100c1408] = 000007df ffffe36a
!	%l6 = 000000ff, %l7 = 56f00eaf, Mem[0000000030041410] = 7e1d2dff 28632106
	stda	%l6,[%i1+%o5]0x89	! Mem[0000000030041410] = 000000ff 56f00eaf
!	Mem[0000000030141408] = 81feb27a, %l3 = 000000000000006a
	ldstuba	[%i5+%o4]0x81,%l3	! %l3 = 0000000000000081
!	%l6 = 00000000000000ff, Mem[0000000030041410] = 000000ff
	stha	%l6,[%i1+%o5]0x89	! Mem[0000000030041410] = 000000ff

p0_label_80:
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = 7ab2feff, %l2 = 00000000ffffffff
	ldsba	[%i5+%o4]0x89,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000030001408] = ff009344, %l5 = 00000000853eff38
	ldsha	[%i0+%o4]0x81,%l5	! %l5 = ffffffffffffff00
!	Mem[0000000030101400] = 069b80970b14976b, %l1 = ffffffffffffe36a
	ldxa	[%i4+%g0]0x81,%l1	! %l1 = 069b80970b14976b
!	Mem[0000000030081400] = 414076ca 34ff5573 ffac101d 1511b9a7
!	Mem[0000000030081410] = 00fa312c 6d4e3e5d 314aa6da 70b87b43
!	Mem[0000000030081420] = 1df3a868 2df625d9 58fa12e6 1b1d3f9f
!	Mem[0000000030081430] = 3b2cf1d4 66a37615 0a80ccb2 3ff082bb
	ldda	[%i2+%g0]ASI_BLK_S,%f0 	! Block Load from 0000000030081400
!	Mem[0000000020800000] = 07df42b0, %l4 = 00000000ffffd2ff
	ldsb	[%o1+%g0],%l4		! %l4 = 0000000000000007
!	Mem[0000000010001400] = 00000eaf, %l1 = 069b80970b14976b
	ldswa	[%i0+%g0]0x80,%l1	! %l1 = 0000000000000eaf
!	Mem[0000000030101408] = 0000e2ff, %l4 = 0000000000000007
	ldsha	[%i4+%o4]0x89,%l4	! %l4 = ffffffffffffe2ff
!	Mem[0000000030141410] = 62000000, %l6 = 00000000000000ff
	lduwa	[%i5+%o5]0x81,%l6	! %l6 = 0000000062000000
!	%l4 = ffffffffffffe2ff, %l4 = ffffffffffffe2ff, %l7 = 0000000056f00eaf
	addc	%l4,%l4,%l7		! %l7 = ffffffffffffc5fe
!	Mem[0000000010101410] = 6b97140b069b8097, %l4 = ffffffffffffe2ff
	ldxa	[%i4+%o5]0x88,%l4	! %l4 = 6b97140b069b8097

p0_label_81:
!	Starting 10 instruction Store Burst
!	%l4 = 069b8097, %l5 = ffffff00, Mem[0000000030101410] = 5708230e 00000000
	stda	%l4,[%i4+%o5]0x89	! Mem[0000000030101410] = 069b8097 ffffff00
	membar	#Sync			! Added by membar checker (16)
!	%l6 = 0000000062000000, Mem[0000000030081408] = ffac101d1511b9a7
	stxa	%l6,[%i2+%o4]0x81	! Mem[0000000030081408] = 0000000062000000
!	%l0 = 00000000000007df, %l2 = ffffffffffffffff, %l1 = 0000000000000eaf
	sub	%l0,%l2,%l1		! %l1 = 00000000000007e0
!	%f24 = 61a38498 80973349, %l1 = 00000000000007e0
!	Mem[00000000300c1418] = 1f88293266754b36
	add	%i3,0x018,%g1
	stda	%f24,[%g1+%l1]ASI_PST32_S ! Mem[00000000300c1418] = 1f88293266754b36
!	Mem[0000000030141410] = 00000062, %l2 = ffffffffffffffff
	ldstuba	[%i5+%o5]0x89,%l2	! %l2 = 0000000000000062
!	Mem[0000000030141400] = 3a000000, %l5 = 00000000ffffff00
	swapa	[%i5+%g0]0x89,%l5	! %l5 = 000000003a000000
!	%l6 = 0000000062000000, Mem[0000000030141408] = 7c5b81ff7ab2feff
	stxa	%l6,[%i5+%o4]0x89	! Mem[0000000030141408] = 0000000062000000
!	%l0 = 000007df, %l1 = 000007e0, Mem[0000000010181438] = 03000000 286672ab, %asi = 80
	stda	%l0,[%i6+0x038]%asi	! Mem[0000000010181438] = 000007df 000007e0
!	%l1 = 00000000000007e0, Mem[0000000010041408] = ffffff97
	stba	%l1,[%i1+%o4]0x80	! Mem[0000000010041408] = e0ffff97
!	%l6 = 0000000062000000, Mem[00000000211c0001] = ffd16b10
	stb	%l6,[%o2+0x001]		! Mem[00000000211c0000] = ff006b10

p0_label_82:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141418] = 5d8f015acf08230e, %l4 = 6b97140b069b8097, %asi = 80
	ldxa	[%i5+0x018]%asi,%l4	! %l4 = 5d8f015acf08230e
!	Mem[00000000300c1410] = 2e290000, %l5 = 000000003a000000
	ldswa	[%i3+%o5]0x89,%l5	! %l5 = 000000002e290000
!	%f19 = cf70fe60, %f28 = ff1430f8, %f12 = 3b2cf1d4 66a37615
	fsmuld	%f19,%f28,%f12		! %f12 = 49e17025 150da000
!	Mem[0000000010001410] = 000000ff, %l3 = 0000000000000081
	ldswa	[%i0+%o5]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030101400] = 069b80970b14976b, %f12 = 49e17025 150da000
	ldda	[%i4+%g0]0x81,%f12	! %f12 = 069b8097 0b14976b
!	%l7 = ffffffffffffc5fe, imm = 0000000000000085, %l4 = 5d8f015acf08230e
	xnor	%l7,0x085,%l4		! %l4 = 0000000000003a84
!	Mem[0000000010141408] = ff1d2d133e401579, %l2 = 0000000000000062, %asi = 80
	ldxa	[%i5+0x008]%asi,%l2	! %l2 = ff1d2d133e401579
!	Mem[0000000010041410] = 069b8097, %l5 = 000000002e290000
	ldsha	[%i1+%o5]0x88,%l5	! %l5 = ffffffffffff8097
!	Mem[0000000030081410] = 00fa312c, %l7 = ffffffffffffc5fe
	ldsba	[%i2+%o5]0x81,%l7	! %l7 = 0000000000000000
!	Mem[00000000100c1408] = df070000, %l1 = 00000000000007e0
	lduba	[%i3+%o4]0x80,%l1	! %l1 = 00000000000000df

p0_label_83:
!	Starting 10 instruction Store Burst
!	%f14 = 0a80ccb2 3ff082bb, %l4 = 0000000000003a84
!	Mem[0000000010041420] = 77619f0cffffff95
	add	%i1,0x020,%g1
	stda	%f14,[%g1+%l4]ASI_PST8_P ! Mem[0000000010041420] = 0a619f0cfff0ff95
!	%f23 = 389c3533, Mem[00000000100c1400] = 069b80ff
	sta	%f23,[%i3+%g0]0x88	! Mem[00000000100c1400] = 389c3533
!	Mem[0000000010081400] = 00000000 00001579 ff009344 5b0fe2ff
!	%f0  = 414076ca 34ff5573 ffac101d 1511b9a7
!	%f4  = 00fa312c 6d4e3e5d 314aa6da 70b87b43
!	%f8  = 1df3a868 2df625d9 58fa12e6 1b1d3f9f
!	%f12 = 069b8097 0b14976b 0a80ccb2 3ff082bb
	stda	%f0 ,[%i2+%g0]ASI_COMMIT_P	! Block Store to 0000000010081400
!	%l5 = ffffffffffff8097, Mem[00000000211c0001] = ff006b10, %asi = 80
	stba	%l5,[%o2+0x001]%asi	! Mem[00000000211c0000] = ff976b10
!	%l4 = 0000000000003a84, Mem[0000000020800000] = 07df42b0, %asi = 80
	stha	%l4,[%o1+0x000]%asi	! Mem[0000000020800000] = 3a8442b0
!	%l3 = 00000000000000ff, %l7 = 0000000000000000, %l4 = 0000000000003a84
	xor	%l3,%l7,%l4		! %l4 = 00000000000000ff
!	%l6 = 62000000, %l7 = 00000000, Mem[00000000100c1408] = df070000 6ae3ffff, %asi = 80
	stda	%l6,[%i3+0x008]%asi	! Mem[00000000100c1408] = 62000000 00000000
!	%l2 = ff1d2d133e401579, Mem[00000000100c1408] = 00000062
	stwa	%l2,[%i3+%o4]0x88	! Mem[00000000100c1408] = 3e401579
!	%l4 = 00000000000000ff, Mem[0000000030141410] = ff0000000b000000
	stxa	%l4,[%i5+%o5]0x81	! Mem[0000000030141410] = 00000000000000ff
!	%l5 = ffffffffffff8097, Mem[0000000010001408] = 000000000000000b
	stxa	%l5,[%i0+%o4]0x80	! Mem[0000000010001408] = ffffffffffff8097

p0_label_84:
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = ff009344, %f24 = 61a38498
	lda	[%i0+%o4]0x81,%f24	! %f24 = ff009344
!	Mem[0000000010101410] = 6b97140b069b8097, %l1 = 00000000000000df
	ldxa	[%i4+%o5]0x88,%l1	! %l1 = 6b97140b069b8097
!	Mem[00000000100c1410] = 5e22ebff, %l1 = 6b97140b069b8097
	lduba	[%i3+%o5]0x80,%l1	! %l1 = 000000000000005e
!	Mem[0000000010001410] = 000000ff, %l4 = 00000000000000ff
	ldswa	[%i0+%o5]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[00000000211c0000] = ff976b10, %l6 = 0000000062000000, %asi = 80
	lduba	[%o2+0x000]%asi,%l6	! %l6 = 00000000000000ff
	membar	#Sync			! Added by membar checker (17)
!	Mem[0000000010081400] = 414076ca, %l5 = ffffffffffff8097, %asi = 80
	ldswa	[%i2+0x000]%asi,%l5	! %l5 = 00000000414076ca
!	Mem[00000000100c1400] = 389c3533, %l5 = 00000000414076ca
	ldswa	[%i3+%g0]0x88,%l5	! %l5 = 00000000389c3533
!	Mem[0000000030101410] = 97809b06, %f5  = 6d4e3e5d
	lda	[%i4+%o5]0x81,%f5 	! %f5 = 97809b06
!	Mem[0000000010181410] = 6200000000000000, %f2  = ffac101d 1511b9a7
	ldda	[%i6+%o5]0x80,%f2 	! %f2  = 62000000 00000000
!	Mem[0000000030041410] = 000000ff, %l6 = 00000000000000ff
	lduha	[%i1+%o5]0x89,%l6	! %l6 = 00000000000000ff

p0_label_85:
!	Starting 10 instruction Store Burst
!	%f16 = 97809b06 4beb8b11, Mem[0000000030001400] = f83014ff 4f08230e
	stda	%f16,[%i0+%g0]0x89	! Mem[0000000030001400] = 97809b06 4beb8b11
!	%l4 = 000000ff, %l5 = 389c3533, Mem[0000000010141410] = ffffffff 00ffffff
	stda	%l4,[%i5+%o5]0x88	! Mem[0000000010141410] = 000000ff 389c3533
!	%l5 = 00000000389c3533, %l5 = 00000000389c3533, %l4 = 00000000000000ff
	xnor	%l5,%l5,%l4		! %l4 = ffffffffffffffff
!	%l5 = 00000000389c3533, Mem[0000000030081410] = 00fa312c
	stha	%l5,[%i2+%o5]0x81	! Mem[0000000030081410] = 3533312c
!	Mem[0000000030101410] = 97809b06, %l6 = 00000000000000ff
	swapa	[%i4+%o5]0x81,%l6	! %l6 = 0000000097809b06
!	Mem[00000000100c1408] = 3e401579, %l7 = 0000000000000000
	lduha	[%i3+%o4]0x88,%l7	! %l7 = 0000000000001579
!	%l5 = 00000000389c3533, %l7 = 0000000000001579, %y  = 261afa00
	sdiv	%l5,%l7,%l2		! %l2 = 000000007fffffff
	mov	%l0,%y			! %y = 000007df
!	%f20 = 5e22ebff, Mem[0000000010141408] = ff1d2d13
	sta	%f20,[%i5+%o4]0x80	! Mem[0000000010141408] = 5e22ebff
!	%l1 = 000000000000005e, Mem[0000000030001400] = 118beb4b
	stwa	%l1,[%i0+%g0]0x81	! Mem[0000000030001400] = 0000005e
!	Mem[00000000100c1420] = 61a38498, %l5 = 00000000389c3533
	swap	[%i3+0x020],%l5		! %l5 = 0000000061a38498

p0_label_86:
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = ff000000, %f20 = 5e22ebff
	lda	[%i1+%o5]0x81,%f20	! %f20 = ff000000
!	Mem[000000001010141c] = ff1d2d13, %l0 = 00000000000007df, %asi = 80
	ldswa	[%i4+0x01c]%asi,%l0	! %l0 = ffffffffff1d2d13
!	Mem[0000000030081408] = 00000000, %l4 = ffffffffffffffff
	lduwa	[%i2+%o4]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000010041420] = 0a619f0cfff0ff95, %l3 = 00000000000000ff
	ldx	[%i1+0x020],%l3		! %l3 = 0a619f0cfff0ff95
!	Mem[0000000030101408] = ffe200000000003e, %f0  = 414076ca 34ff5573
	ldda	[%i4+%o4]0x81,%f0 	! %f0  = ffe20000 0000003e
!	Mem[0000000030041400] = ffffe36a000007df, %f26 = 7915403e 6d9b8097
	ldda	[%i1+%g0]0x89,%f26	! %f26 = ffffe36a 000007df
!	Mem[0000000010141408] = 5e22ebff 3e401579, %l2 = 7fffffff, %l3 = fff0ff95
	ldda	[%i5+%o4]0x80,%l2	! %l2 = 000000005e22ebff 000000003e401579
!	Mem[00000000300c1408] = 4493f3cc, %l7 = 0000000000001579
	lduba	[%i3+%o4]0x81,%l7	! %l7 = 0000000000000044
!	Mem[0000000030001408] = ff009344, %l3 = 000000003e401579
	lduba	[%i0+%o4]0x81,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030081410] = 2c313335, %l4 = 0000000000000000
	ldsba	[%i2+%o5]0x89,%l4	! %l4 = 0000000000000035

p0_label_87:
!	Starting 10 instruction Store Burst
!	%l2 = 000000005e22ebff, Mem[00000000300c1408] = ccf39344
	stba	%l2,[%i3+%o4]0x89	! Mem[00000000300c1408] = ccf393ff
!	%l3 = 00000000000000ff, Mem[000000001018143c] = 000007e0, %asi = 80
	stha	%l3,[%i6+0x03c]%asi	! Mem[000000001018143c] = 00ff07e0
!	Mem[0000000010181414] = 00000000, %l1 = 000000000000005e, %asi = 80
	swapa	[%i6+0x014]%asi,%l1	! %l1 = 0000000000000000
!	Mem[0000000030001400] = 0000005e 069b8097 ff009344 ffffff00
!	%f0  = ffe20000 0000003e 62000000 00000000
!	%f4  = 00fa312c 97809b06 314aa6da 70b87b43
!	%f8  = 1df3a868 2df625d9 58fa12e6 1b1d3f9f
!	%f12 = 069b8097 0b14976b 0a80ccb2 3ff082bb
	stda	%f0 ,[%i0+%g0]ASI_BLK_AIUS	! Block Store to 0000000030001400
!	%l4 = 0000000000000035, Mem[0000000010041400] = 93bcbf82
	stba	%l4,[%i1+%g0]0x80	! Mem[0000000010041400] = 35bcbf82
!	Mem[0000000030081400] = 414076ca 34ff5573 00000000 62000000
!	%f0  = ffe20000 0000003e 62000000 00000000
!	%f4  = 00fa312c 97809b06 314aa6da 70b87b43
!	%f8  = 1df3a868 2df625d9 58fa12e6 1b1d3f9f
!	%f12 = 069b8097 0b14976b 0a80ccb2 3ff082bb
	stda	%f0 ,[%i2+%g0]ASI_COMMIT_S	! Block Store to 0000000030081400
!	%f10 = 58fa12e6 1b1d3f9f, Mem[0000000010141420] = 77619f0c ffffff95
	std	%f10,[%i5+0x020]	! Mem[0000000010141420] = 58fa12e6 1b1d3f9f
!	%f24 = ff009344, Mem[0000000030101408] = 0000e2ff
	sta	%f24,[%i4+%o4]0x89	! Mem[0000000030101408] = ff009344
!	Mem[0000000030141410] = 00000000, %l0 = ffffffffff1d2d13
	ldstuba	[%i5+%o5]0x81,%l0	! %l0 = 0000000000000000
!	%l1 = 0000000000000000, Mem[0000000010101408] = 59f7ffff7e1d2d13
	stxa	%l1,[%i4+%o4]0x80	! Mem[0000000010101408] = 0000000000000000

p0_label_88:
!	Starting 10 instruction Load Burst
!	Mem[0000000030181410] = 62000000, %l3 = 00000000000000ff
	ldsba	[%i6+%o5]0x81,%l3	! %l3 = 0000000000000062
!	Mem[00000000300c1408] = ff93f3cc, %f28 = ff1430f8
	lda	[%i3+%o4]0x81,%f28	! %f28 = ff93f3cc
!	Mem[0000000010041408] = 97ffffe0, %l6 = 0000000097809b06
	ldswa	[%i1+%o4]0x88,%l6	! %l6 = ffffffff97ffffe0
!	Mem[0000000010141400] = 00ff0000, %l2 = 000000005e22ebff
	lduba	[%i5+%g0]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000030141410] = 000000ff, %l4 = 0000000000000035
	lduha	[%i5+%o5]0x89,%l4	! %l4 = 00000000000000ff
	membar	#Sync			! Added by membar checker (18)
!	Mem[0000000030001408] = 00000062, %l5 = 0000000061a38498
	lduwa	[%i0+%o4]0x89,%l5	! %l5 = 0000000000000062
!	Mem[0000000010041400] = af5e1890 82bfbc35, %l0 = 00000000, %l1 = 00000000
	ldda	[%i1+%g0]0x88,%l0	! %l0 = 0000000082bfbc35 00000000af5e1890
!	Mem[0000000030041410] = ff000000af0ef056, %l1 = 00000000af5e1890
	ldxa	[%i1+%o5]0x81,%l1	! %l1 = ff000000af0ef056
!	Mem[0000000030041400] = 000007df, %f4  = 00fa312c
	lda	[%i1+%g0]0x89,%f4 	! %f4 = 000007df
!	Mem[0000000010001400] = 00000eaf069b8097, %f24 = ff009344 80973349
	ldda	[%i0+%g0]0x80,%f24	! %f24 = 00000eaf 069b8097

p0_label_89:
!	Starting 10 instruction Store Burst
!	Mem[0000000030081408] = 62000000, %l5 = 0000000000000062
	swapa	[%i2+%o4]0x81,%l5	! %l5 = 0000000062000000
!	%l1 = ff000000af0ef056, Mem[0000000030101408] = ff009344
	stha	%l1,[%i4+%o4]0x89	! Mem[0000000030101408] = ff00f056
!	%l1 = ff000000af0ef056, %l7 = 0000000000000044, %y  = 000007df
	umul	%l1,%l7,%l5		! %l5 = 0000002e7ff7d6d8, %y = 0000002e
!	%f25 = 069b8097, %f25 = 069b8097, %f0  = ffe20000 0000003e
	fsmuld	%f25,%f25,%f0 		! %f0  = 31b79d3d dc564440
!	%l7 = 0000000000000044, Mem[000000001008141e] = 70b87b43, %asi = 80
	stha	%l7,[%i2+0x01e]%asi	! Mem[000000001008141c] = 70b80044
!	%l1 = ff000000af0ef056, Mem[0000000010081408] = ffac101d1511b9a7
	stxa	%l1,[%i2+%o4]0x80	! Mem[0000000010081408] = ff000000af0ef056
!	%f17 = 4beb8b11, %f5  = 97809b06, %f17 = 4beb8b11
	fmuls	%f17,%f5 ,%f17		! %f17 = a3eca856
!	%f22 = 4bad6d62 389c3533, %l3 = 0000000000000062
!	Mem[0000000010041430] = 63b0e0442ca96a59
	add	%i1,0x030,%g1
	stda	%f22,[%g1+%l3]ASI_PST8_P ! Mem[0000000010041430] = 63ad6d442ca93559
!	Mem[0000000030001408] = 00000062, %l0 = 0000000082bfbc35
	ldstuba	[%i0+%o4]0x89,%l0	! %l0 = 0000000000000062
!	%l5 = 0000002e7ff7d6d8, %l3 = 0000000000000062, %l1 = ff000000af0ef056
	subc	%l5,%l3,%l1		! %l1 = 0000002e7ff7d676

p0_label_90:
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = df070000, %l4 = 00000000000000ff
	ldsha	[%i1+%g0]0x81,%l4	! %l4 = ffffffffffffdf07
!	Mem[0000000030181410] = 62000000, %l3 = 0000000000000062
	lduba	[%i6+%o5]0x81,%l3	! %l3 = 0000000000000062
!	Mem[0000000010041405] = 90185eaf, %l4 = ffffffffffffdf07
	ldub	[%i1+0x005],%l4		! %l4 = 0000000000000018
!	Mem[00000000100c1438] = 4bad6d62, %l6 = ffffffff97ffffe0, %asi = 80
	ldswa	[%i3+0x038]%asi,%l6	! %l6 = 000000004bad6d62
!	Mem[0000000010081400] = 414076ca 34ff5573, %l4 = 00000018, %l5 = 7ff7d6d8
	ldda	[%i2+%g0]0x80,%l4	! %l4 = 00000000414076ca 0000000034ff5573
!	Mem[0000000010081408] = 56f00eaf000000ff, %l5 = 0000000034ff5573
	ldxa	[%i2+%o4]0x88,%l5	! %l5 = 56f00eaf000000ff
!	Mem[0000000010041400] = 82bfbc35, %l1 = 0000002e7ff7d676
	lduha	[%i1+%g0]0x88,%l1	! %l1 = 000000000000bc35
!	%f5  = 97809b06, %f15 = 3ff082bb, %f21 = 3c656718
	fsubs	%f5 ,%f15,%f21		! %f21 = bff082bb
!	Mem[00000000201c0000] = 0000e880, %l7 = 0000000000000044, %asi = 80
	lduha	[%o0+0x000]%asi,%l7	! %l7 = 0000000000000000
!	%l1 = 000000000000bc35, Mem[0000000030141408] = 00000062
	stha	%l1,[%i5+%o4]0x81	! Mem[0000000030141408] = bc350062

p0_label_91:
!	Starting 10 instruction Store Burst
!	%f8  = 1df3a868 2df625d9, %l7 = 0000000000000000
!	Mem[0000000030101438] = 8b567e33c282a666
	add	%i4,0x038,%g1
	stda	%f8,[%g1+%l7]ASI_PST32_S ! Mem[0000000030101438] = 8b567e33c282a666
!	%l2 = 00000000, %l3 = 00000062, Mem[0000000010001430] = 00000000 04ffe105
	std	%l2,[%i0+0x030]		! Mem[0000000010001430] = 00000000 00000062
!	%l4 = 00000000414076ca, Mem[00000000100c1410] = 5e22ebff3c656718
	stxa	%l4,[%i3+%o5]0x80	! Mem[00000000100c1410] = 00000000414076ca
!	%f4  = 000007df 97809b06, Mem[0000000030101408] = 56f000ff 0000003e
	stda	%f4 ,[%i4+%o4]0x81	! Mem[0000000030101408] = 000007df 97809b06
!	Mem[00000000100c1400] = 33359c38, %l7 = 0000000000000000
	swapa	[%i3+%g0]0x80,%l7	! %l7 = 0000000033359c38
!	%l4 = 00000000414076ca, Mem[0000000010101400] = ffffffff
	stha	%l4,[%i4+%g0]0x88	! Mem[0000000010101400] = ffff76ca
!	%f16 = 97809b06, Mem[00000000100c1408] = 7915403e
	sta	%f16,[%i3+%o4]0x80	! Mem[00000000100c1408] = 97809b06
!	%l1 = 000000000000bc35, imm = fffffffffffffef2, %l3 = 0000000000000062
	xor	%l1,-0x10e,%l3		! %l3 = ffffffffffff42c7
!	%l4 = 00000000414076ca, Mem[0000000030081400] = ffe20000
	stwa	%l4,[%i2+%g0]0x81	! Mem[0000000030081400] = 414076ca
!	%l7 = 0000000033359c38, Mem[00000000100c1410] = 00000000
	stba	%l7,[%i3+%o5]0x88	! Mem[00000000100c1410] = 00000038

p0_label_92:
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = ccf393ff, %l7 = 0000000033359c38
	lduba	[%i3+%o4]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030141408] = bc350062, %l0 = 0000000000000062
	ldsba	[%i5+%o4]0x81,%l0	! %l0 = ffffffffffffffbc
!	Mem[0000000021800140] = 28658430, %l5 = 56f00eaf000000ff
	lduh	[%o3+0x140],%l5		! %l5 = 0000000000002865
!	Mem[0000000010141400] = 00ff0000 ffa016a9 5e22ebff 3e401579
!	Mem[0000000010141410] = ff000000 33359c38 5d8f015a cf08230e
!	Mem[0000000010141420] = 58fa12e6 1b1d3f9f 132d1d7e 0e230857
!	Mem[0000000010141430] = e761cf92 5b0fe295 47b7546d ae96bcff
	ldda	[%i5+%g0]ASI_BLK_P,%f0 	! Block Load from 0000000010141400
!	Mem[0000000030101408] = 000007df, %l2 = 0000000000000000
	ldswa	[%i4+%o4]0x81,%l2	! %l2 = 00000000000007df
!	Mem[0000000030041400] = ffffe36a000007df, %f24 = 00000eaf 069b8097
	ldda	[%i1+%g0]0x89,%f24	! %f24 = ffffe36a 000007df
!	Mem[0000000010041430] = 63ad6d442ca93559, %l4 = 00000000414076ca, %asi = 80
	ldxa	[%i1+0x030]%asi,%l4	! %l4 = 63ad6d442ca93559
!	%f28 = ff93f3cc, %f15 = ae96bcff, %f26 = ffffe36a
	fdivs	%f28,%f15,%f26		! %f26 = ffd3f3cc
!	Mem[0000000010101414] = 0b14976b, %l5 = 0000000000002865
	lduh	[%i4+0x014],%l5		! %l5 = 0000000000000b14
!	Mem[0000000010081408] = 000000ff, %l0 = ffffffffffffffbc
	lduha	[%i2+%o4]0x88,%l0	! %l0 = 00000000000000ff

p0_label_93:
!	Starting 10 instruction Store Burst
!	%f28 = ff93f3cc 0e23084f, Mem[00000000100c1418] = 4dff998a 389c3533, %asi = 80
	stda	%f28,[%i3+0x018]%asi	! Mem[00000000100c1418] = ff93f3cc 0e23084f
!	%l0 = 000000ff, %l1 = 0000bc35, Mem[0000000030101400] = 069b8097 0b14976b
	stda	%l0,[%i4+%g0]0x81	! Mem[0000000030101400] = 000000ff 0000bc35
!	Mem[00000000300c1400] = 7c5b81ff, %l7 = 00000000000000ff
	ldstuba	[%i3+%g0]0x81,%l7	! %l7 = 000000000000007c
!	%l6 = 000000004bad6d62, Mem[0000000010041410] = 97809b06
	stwa	%l6,[%i1+%o5]0x80	! Mem[0000000010041410] = 4bad6d62
!	%f0  = 00ff0000 ffa016a9, %l7 = 000000000000007c
!	Mem[0000000030101428] = ffeb225e2e2979ff
	add	%i4,0x028,%g1
	stda	%f0,[%g1+%l7]ASI_PST32_SL ! Mem[0000000030101428] = ffeb225e2e2979ff
!	%l3 = ffffffffffff42c7, %l4 = 63ad6d442ca93559, %y  = 0000002e
	sdiv	%l3,%l4,%l5		! %l5 = 000000000000010d
	mov	%l0,%y			! %y = 000000ff
!	%f20 = ff000000, Mem[0000000010001400] = af0e0000
	sta	%f20,[%i0+%g0]0x88	! Mem[0000000010001400] = ff000000
!	Mem[00000000100c1400] = 00000000, %l2 = 000007df, %l0 = 000000ff
	casa	[%i3]0x80,%l2,%l0	! %l0 = 0000000000000000
	membar	#Sync			! Added by membar checker (19)
!	%l0 = 00000000, %l1 = 0000bc35, Mem[0000000010141410] = ff000000 33359c38
	stda	%l0,[%i5+%o5]0x80	! Mem[0000000010141410] = 00000000 0000bc35
!	Mem[0000000030041400] = df070000 6ae3ffff e36a770e fafad934
!	%f16 = 97809b06 a3eca856 00001579 cf70fe60
!	%f20 = ff000000 bff082bb 4bad6d62 389c3533
!	%f24 = ffffe36a 000007df ffd3f3cc 000007df
!	%f28 = ff93f3cc 0e23084f 4bad6d62 1d10ac3a
	stda	%f16,[%i1+%g0]ASI_BLK_S	! Block Store to 0000000030041400

p0_label_94:
!	Starting 10 instruction Load Burst
!	%l5 = 000000000000010d, %l7 = 000000000000007c, %y  = 000000ff
	udiv	%l5,%l7,%l6		! %l6 = 00000000ffffffff
	mov	%l0,%y			! %y = 00000000
!	Mem[0000000030081408] = 62000000, %l5 = 000000000000010d
	ldsba	[%i2+%o4]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000010141408] = 5e22ebff, %l4 = 63ad6d442ca93559
	lduha	[%i5+%o4]0x80,%l4	! %l4 = 0000000000005e22
!	Mem[00000000300c1410] = 2e290000, %l5 = 0000000000000000
	lduba	[%i3+%o5]0x89,%l5	! %l5 = 0000000000000000
	membar	#Sync			! Added by membar checker (20)
!	Mem[0000000010041408] = 97ffffe0, %f3  = 3e401579
	lda	[%i1+%o4]0x88,%f3 	! %f3 = 97ffffe0
!	Mem[0000000010181408] = 038da6db00ff0a43, %l2 = 00000000000007df
	ldxa	[%i6+%o4]0x80,%l2	! %l2 = 038da6db00ff0a43
!	Mem[0000000010181438] = 000007df00ff07e0, %f24 = ffffe36a 000007df
	ldd	[%i6+0x038],%f24	! %f24 = 000007df 00ff07e0
!	Mem[0000000010041400] = 35bcbf82 90185eaf, %l0 = 00000000, %l1 = 0000bc35
	ldda	[%i1+%g0]0x80,%l0	! %l0 = 0000000035bcbf82 0000000090185eaf
!	%l1 = 0000000090185eaf, imm = 000000000000043b, %l2 = 038da6db00ff0a43
	and	%l1,0x43b,%l2		! %l2 = 000000000000042b
!	Mem[0000000010081410] = 5d3e4e6d2c31fa00, %f28 = ff93f3cc 0e23084f
	ldda	[%i2+%o5]0x88,%f28	! %f28 = 5d3e4e6d 2c31fa00

p0_label_95:
!	Starting 10 instruction Store Burst
!	Mem[0000000020800001] = 3a8442b0, %l5 = 0000000000000000
	ldstub	[%o1+0x001],%l5		! %l5 = 0000000000000084
!	%l3 = ffffffffffff42c7, %l5 = 0000000000000084, %y  = 00000000
	umul	%l3,%l5,%l3		! %l3 = 00000083ff9e6e9c, %y = 00000083
!	Mem[0000000010141430] = e761cf92, %l4 = 0000000000005e22
	ldstuba	[%i5+0x030]%asi,%l4	! %l4 = 00000000000000e7
!	%f6  = 5d8f015a cf08230e, Mem[0000000010181420] = 2c31fa00 80973349
	std	%f6 ,[%i6+0x020]	! Mem[0000000010181420] = 5d8f015a cf08230e
!	%l2 = 000000000000042b, Mem[0000000010141410] = 00000000
	stwa	%l2,[%i5+%o5]0x80	! Mem[0000000010141410] = 0000042b
!	%l5 = 0000000000000084, Mem[0000000030141400] = 00ffffff
	stba	%l5,[%i5+%g0]0x81	! Mem[0000000030141400] = 84ffffff
!	%f22 = 4bad6d62 389c3533, Mem[0000000010041420] = 0a619f0c fff0ff95, %asi = 80
	stda	%f22,[%i1+0x020]%asi	! Mem[0000000010041420] = 4bad6d62 389c3533
!	%l4 = 00000000000000e7, Mem[0000000030101408] = 069b8097df070000
	stxa	%l4,[%i4+%o4]0x89	! Mem[0000000030101408] = 00000000000000e7
!	Mem[0000000010141410] = 0000042b, %l7 = 000000000000007c
	swapa	[%i5+%o5]0x80,%l7	! %l7 = 000000000000042b
!	Mem[0000000010041416] = 3e401579, %l2 = 000000000000042b
	ldstuba	[%i1+0x016]%asi,%l2	! %l2 = 0000000000000015

p0_label_96:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = ffff76ca, %l1 = 0000000090185eaf
	ldsha	[%i4+%g0]0x88,%l1	! %l1 = 00000000000076ca
	membar	#Sync			! Added by membar checker (21)
!	Mem[0000000010181400] = 59f7ffff 7e1d2d13 038da6db 00ff0a43
!	Mem[0000000010181410] = 62000000 0000005e 7d1db233 6bffacc5
!	Mem[0000000010181420] = 5d8f015a cf08230e 4b57c496 06a15c8f
!	Mem[0000000010181430] = 05e170ff 38ff3e85 000007df 00ff07e0
	ldda	[%i6+%g0]ASI_BLK_AIUPL,%f16	! Block Load from 0000000010181400
!	Mem[0000000030001400] = ffe200000000003e, %l1 = 00000000000076ca
	ldxa	[%i0+%g0]0x81,%l1	! %l1 = ffe200000000003e
!	Mem[0000000010181400] = 59f7ffff, %l1 = ffe200000000003e
	ldsba	[%i6+%g0]0x80,%l1	! %l1 = 0000000000000059
!	Mem[0000000010181410] = 62000000, %l0 = 0000000035bcbf82
	lduha	[%i6+%o5]0x80,%l0	! %l0 = 0000000000006200
!	Mem[0000000010141400] = 0000ff00, %l0 = 0000000000006200
	lduwa	[%i5+%g0]0x88,%l0	! %l0 = 000000000000ff00
!	Mem[00000000211c0000] = ff976b10, %l0 = 000000000000ff00
	ldsb	[%o2+%g0],%l0		! %l0 = ffffffffffffffff
!	Mem[00000000300c1400] = 81feb27aff815bff, %l7 = 000000000000042b
	ldxa	[%i3+%g0]0x89,%l7	! %l7 = 81feb27aff815bff
!	%l2 = 0000000000000015, immd = fffff823, %y  = 00000083
	smul	%l2,-0x7dd,%l2		! %l2 = ffffffffffff5adf, %y = ffffffff
!	Mem[00000000100c1408] = 97809b06 00000000, %l0 = ffffffff, %l1 = 00000059
	ldda	[%i3+%o4]0x80,%l0	! %l0 = 0000000097809b06 0000000000000000

p0_label_97:
!	Starting 10 instruction Store Burst
!	%l4 = 000000e7, %l5 = 00000084, Mem[0000000010081408] = ff000000 af0ef056
	std	%l4,[%i2+%o4]		! Mem[0000000010081408] = 000000e7 00000084
!	%l6 = 00000000ffffffff, Mem[0000000010101408] = 00000000
	stha	%l6,[%i4+%o4]0x80	! Mem[0000000010101408] = ffff0000
!	%l4 = 000000e7, %l5 = 00000084, Mem[00000000100c1400] = 00000000 4beb8b11
	stda	%l4,[%i3+%g0]0x80	! Mem[00000000100c1400] = 000000e7 00000084
!	%f18 = 430aff00 dba68d03, %l1 = 0000000000000000
!	Mem[0000000030141420] = 186c958854a4aa79
	add	%i5,0x020,%g1
	stda	%f18,[%g1+%l1]ASI_PST32_S ! Mem[0000000030141420] = 186c958854a4aa79
!	%l2 = ffffffffffff5adf, Mem[00000000300c1410] = 0000292e
	stba	%l2,[%i3+%o5]0x81	! Mem[00000000300c1410] = df00292e
!	%f6  = 5d8f015a cf08230e, %l6 = 00000000ffffffff
!	Mem[0000000030001438] = 0a80ccb23ff082bb
	add	%i0,0x038,%g1
	stda	%f6,[%g1+%l6]ASI_PST8_SL ! Mem[0000000030001438] = 0e2308cf5a018f5d
!	%l3 = 00000083ff9e6e9c, Mem[0000000030181400] = af0e0000
	stha	%l3,[%i6+%g0]0x81	! Mem[0000000030181400] = 6e9c0000
!	Mem[0000000030101410] = 000000ff, %l7 = 00000000ff815bff
	swapa	[%i4+%o5]0x81,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010041400] = 35bcbf82, %l1 = 0000000000000000
	swapa	[%i1+%g0]0x80,%l1	! %l1 = 0000000035bcbf82
!	%f18 = 430aff00 dba68d03, Mem[0000000030141400] = ffffff84 4144af2e
	stda	%f18,[%i5+%g0]0x89	! Mem[0000000030141400] = 430aff00 dba68d03

p0_label_98:
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = 65280000, %l3 = 00000083ff9e6e9c
	ldswa	[%i6+%o4]0x81,%l3	! %l3 = 0000000065280000
!	Mem[0000000030101400] = 000000ff, %l0 = 0000000097809b06
	lduba	[%i4+%g0]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000030141410] = 000000ff, %l0 = 0000000000000000
	ldsba	[%i5+%o5]0x89,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010001410] = 97809b06000000ff, %f10 = 132d1d7e 0e230857
	ldda	[%i0+%o5]0x88,%f10	! %f10 = 97809b06 000000ff
!	Mem[0000000030181400] = 00009c6e, %f0  = 00ff0000
	lda	[%i6+%g0]0x89,%f0 	! %f0 = 00009c6e
!	Mem[0000000010081422] = 1df3a868, %l6 = 00000000ffffffff, %asi = 80
	lduha	[%i2+0x022]%asi,%l6	! %l6 = 000000000000a868
!	Mem[0000000010181400] = fffff759, %f9  = 1b1d3f9f
	lda	[%i6+%g0]0x88,%f9 	! %f9 = fffff759
!	Mem[0000000010041424] = 389c3533, %l3 = 0000000065280000, %asi = 80
	ldswa	[%i1+0x024]%asi,%l3	! %l3 = 00000000389c3533
!	Mem[0000000010041408] = e0ffff97, %l6 = 000000000000a868
	lduba	[%i1+%o4]0x80,%l6	! %l6 = 00000000000000e0
!	Mem[00000000100c1408] = 069b8097, %l5 = 0000000000000084
	ldsha	[%i3+%o4]0x88,%l5	! %l5 = ffffffffffff8097

p0_label_99:
!	Starting 10 instruction Store Burst
!	%l4 = 00000000000000e7, Mem[00000000211c0001] = ff976b10
	stb	%l4,[%o2+0x001]		! Mem[00000000211c0000] = ffe76b10
	membar	#Sync			! Added by membar checker (22)
!	%l4 = 00000000000000e7, Mem[0000000010181408] = 038da6db
	stwa	%l4,[%i6+%o4]0x80	! Mem[0000000010181408] = 000000e7
!	%l4 = 00000000000000e7, Mem[0000000030181408] = 00002865
	stha	%l4,[%i6+%o4]0x89	! Mem[0000000030181408] = 000000e7
!	%l3 = 00000000389c3533, Mem[00000000211c0001] = ffe76b10, %asi = 80
	stba	%l3,[%o2+0x001]%asi	! Mem[00000000211c0000] = ff336b10
!	Mem[0000000010001427] = e9ff312c, %l0 = ffffffffffffffff
	ldstub	[%i0+0x027],%l0		! %l0 = 000000000000002c
!	%f22 = c5acff6b 33b21d7d, Mem[0000000010181400] = 59f7ffff 7e1d2d13
	stda	%f22,[%i6+%g0]0x80	! Mem[0000000010181400] = c5acff6b 33b21d7d
!	%f31 = df070000, %f19 = dba68d03
	fcmpes	%fcc2,%f31,%f19		! %fcc2 = 1
!	Mem[0000000010081400] = ca764041, %l0 = 000000000000002c
	swapa	[%i2+%g0]0x88,%l0	! %l0 = 00000000ca764041
!	Mem[0000000030141400] = 038da6db 00ff0a43 bc350062 00000000
!	%f0  = 00009c6e ffa016a9 5e22ebff 97ffffe0
!	%f4  = ff000000 33359c38 5d8f015a cf08230e
!	%f8  = 58fa12e6 fffff759 97809b06 000000ff
!	%f12 = e761cf92 5b0fe295 47b7546d ae96bcff
	stda	%f0 ,[%i5+%g0]ASI_COMMIT_S	! Block Store to 0000000030141400
!	Mem[0000000010081400] = 0000002c, %l1 = 0000000035bcbf82
	swapa	[%i2+%g0]0x88,%l1	! %l1 = 000000000000002c

p0_label_100:
!	Starting 10 instruction Load Burst
!	%l5 = ffffffffffff8097, %l4 = 00000000000000e7, %l3 = 00000000389c3533
	sub	%l5,%l4,%l3		! %l3 = ffffffffffff7fb0
!	Mem[0000000010181424] = cf08230e, %l3 = ffffffffffff7fb0, %asi = 80
	lduwa	[%i6+0x024]%asi,%l3	! %l3 = 00000000cf08230e
	membar	#Sync			! Added by membar checker (23)
!	Mem[0000000010141410] = 35bc00007c000000, %f26 = 8f5ca106 96c4574b
	ldda	[%i5+%o5]0x88,%f26	! %f26 = 35bc0000 7c000000
!	Mem[0000000010141408] = 7915403effeb225e, %l1 = 000000000000002c
	ldxa	[%i5+%o4]0x88,%l1	! %l1 = 7915403effeb225e
!	Mem[0000000010001400] = ff000000, %l1 = 7915403effeb225e
	lduba	[%i0+%g0]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010001400] = 000000ff 069b8097 ffffffff ffff8097
!	Mem[0000000010001410] = ff000000 069b8097 069b8097 60fe70cf
!	Mem[0000000010001420] = 49339780 e9ff31ff 00009780 ffffffff
!	Mem[0000000010001430] = 00000000 00000062 00000000 0000007e
	ldda	[%i0+%g0]ASI_BLK_PL,%f0 	! Block Load from 0000000010001400
!	Mem[0000000010001400] = 000000ff, %f16 = 132d1d7e
	lda	[%i0+%g0]0x80,%f16	! %f16 = 000000ff
!	Mem[00000000100c141c] = 0e23084f, %l4 = 00000000000000e7
	ldsb	[%i3+0x01c],%l4		! %l4 = 000000000000000e
!	Mem[0000000010101408] = ffff0000, %f22 = c5acff6b
	lda	[%i4+%o4]0x80,%f22	! %f22 = ffff0000
!	Mem[0000000010101410] = 6b97140b 069b8097, %l0 = ca764041, %l1 = 00000000
	ldda	[%i4+%o5]0x88,%l0	! %l0 = 00000000069b8097 000000006b97140b

p0_label_101:
!	Starting 10 instruction Store Burst
!	%l5 = ffffffffffff8097, Mem[00000000300c1410] = 2e2900df
	stha	%l5,[%i3+%o5]0x89	! Mem[00000000300c1410] = 2e298097
!	Mem[00000000100c1410] = 00000038, %l4 = 000000000000000e
	ldstuba	[%i3+%o5]0x88,%l4	! %l4 = 0000000000000038
!	%f28 = 853eff38 ff70e105, Mem[0000000030141408] = ffeb225e e0ffff97
	stda	%f28,[%i5+%o4]0x89	! Mem[0000000030141408] = 853eff38 ff70e105
!	%l3 = 00000000cf08230e, Mem[00000000201c0000] = 0000e880
	sth	%l3,[%o0+%g0]		! Mem[00000000201c0000] = 230ee880
	membar	#Sync			! Added by membar checker (24)
!	%f6  = cf70fe60 97809b06, Mem[0000000010001410] = 000000ff 97809b06
	stda	%f6 ,[%i0+%o5]0x88	! Mem[0000000010001410] = cf70fe60 97809b06
!	%l3 = 00000000cf08230e, Mem[00000000100c141c] = 0e23084f, %asi = 80
	stwa	%l3,[%i3+0x01c]%asi	! Mem[00000000100c141c] = cf08230e
!	%l6 = 000000e0, %l7 = 000000ff, Mem[0000000030081408] = 62000000 00000000
	stda	%l6,[%i2+%o4]0x89	! Mem[0000000030081408] = 000000e0 000000ff
!	%l2 = ffffffffffff5adf, Mem[0000000030001410] = 00fa312c
	stwa	%l2,[%i0+%o5]0x81	! Mem[0000000030001410] = ffff5adf
!	%l7 = 00000000000000ff, Mem[00000000100c143d] = 1d10ac3a
	stb	%l7,[%i3+0x03d]		! Mem[00000000100c143c] = 1dffac3a
!	%l6 = 000000e0, %l7 = 000000ff, Mem[0000000010041428] = 1bb425d6 60fe70cf
	std	%l6,[%i1+0x028]		! Mem[0000000010041428] = 000000e0 000000ff

p0_label_102:
!	Starting 10 instruction Load Burst
!	Mem[000000001018140e] = 00ff0a43, %l0 = 00000000069b8097, %asi = 80
	ldsha	[%i6+0x00e]%asi,%l0	! %l0 = 0000000000000a43
!	Mem[0000000010001408] = ffffffff, %l6 = 00000000000000e0
	ldsba	[%i0+%o4]0x80,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000030141408] = 05e170ff 38ff3e85, %l6 = ffffffff, %l7 = 000000ff
	ldda	[%i5+%o4]0x81,%l6	! %l6 = 0000000005e170ff 0000000038ff3e85
!	Mem[0000000010001419] = 069b8097, %l3 = 00000000cf08230e
	ldsb	[%i0+0x019],%l3		! %l3 = ffffffffffffff9b
!	Mem[0000000021800180] = 65743a60, %l2 = ffffffffffff5adf, %asi = 80
	lduha	[%o3+0x180]%asi,%l2	! %l2 = 0000000000006574
!	Mem[0000000010181424] = cf08230e, %l2 = 0000000000006574, %asi = 80
	ldsha	[%i6+0x024]%asi,%l2	! %l2 = ffffffffffffcf08
!	Mem[0000000010001408] = 9780ffffffffffff, %f26 = 35bc0000 7c000000
	ldda	[%i0+%o4]0x88,%f26	! %f26 = 9780ffff ffffffff
!	Mem[0000000010101408] = 0000ffff, %l6 = 0000000005e170ff
	ldswa	[%i4+%o4]0x88,%l6	! %l6 = 000000000000ffff
!	Mem[00000000300c1408] = ff93f3cc00000057, %l1 = 000000006b97140b
	ldxa	[%i3+%o4]0x81,%l1	! %l1 = ff93f3cc00000057
!	Mem[0000000010181410] = 62000000, %l6 = 000000000000ffff
	lduba	[%i6+%o5]0x80,%l6	! %l6 = 0000000000000062

p0_label_103:
!	Starting 10 instruction Store Burst
!	%l3 = ffffffffffffff9b, Mem[0000000030041408] = 00001579cf70fe60
	stxa	%l3,[%i1+%o4]0x81	! Mem[0000000030041408] = ffffffffffffff9b
!	%f4  = 97809b06 000000ff, %l4 = 0000000000000038
!	Mem[0000000010081410] = 00fa312c6d4e3e5d
	add	%i2,0x010,%g1
	stda	%f4,[%g1+%l4]ASI_PST8_PL ! Mem[0000000010081410] = 00fa3100069b3e5d
!	%l1 = ff93f3cc00000057, Mem[0000000010081428] = 58fa12e6
	stw	%l1,[%i2+0x028]		! Mem[0000000010081428] = 00000057
!	Mem[0000000030081410] = 00fa312c, %l1 = ff93f3cc00000057
	ldstuba	[%i2+%o5]0x81,%l1	! %l1 = 0000000000000000
!	%l0 = 00000a43, %l1 = 00000000, Mem[0000000030141410] = ff000000 33359c38
	stda	%l0,[%i5+%o5]0x81	! Mem[0000000030141410] = 00000a43 00000000
!	%l4 = 00000038, %l5 = ffff8097, Mem[0000000010001420] = 49339780 e9ff31ff
	std	%l4,[%i0+0x020]		! Mem[0000000010001420] = 00000038 ffff8097
!	%l4 = 0000000000000038, Mem[0000000030141400] = 00009c6effa016a9
	stxa	%l4,[%i5+%g0]0x81	! Mem[0000000030141400] = 0000000000000038
!	%l4 = 00000038, %l5 = ffff8097, Mem[0000000010181400] = 6bffacc5 7d1db233
	stda	%l4,[%i6+%g0]0x88	! Mem[0000000010181400] = 00000038 ffff8097
!	Mem[0000000030181408] = e7000000, %l7 = 0000000038ff3e85
	swapa	[%i6+%o4]0x81,%l7	! %l7 = 00000000e7000000
!	%f20 = 5e000000 00000062, Mem[0000000010181438] = 000007df 00ff07e0
	std	%f20,[%i6+0x038]	! Mem[0000000010181438] = 5e000000 00000062

p0_label_104:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = 069b8097, %f19 = dba68d03
	lda	[%i0+%o5]0x80,%f19	! %f19 = 069b8097
!	Mem[0000000010001400] = ff000000, %l5 = ffffffffffff8097
	lduwa	[%i0+%g0]0x88,%l5	! %l5 = 00000000ff000000
!	Mem[00000000100c140a] = 97809b06, %l4 = 0000000000000038
	ldsb	[%i3+0x00a],%l4		! %l4 = ffffffffffffff9b
!	Code Fragment 4, seed = 797694
p0_fragment_7:
!	%l0 = 0000000000000a43
	setx	0x222244f25fb87636,%g7,%l0 ! %l0 = 222244f25fb87636
!	%l1 = 0000000000000000
	setx	0xe9a7e9a914338d61,%g7,%l1 ! %l1 = e9a7e9a914338d61
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 222244f25fb87636
	setx	0xc6a3be178ef2989c,%g7,%l0 ! %l0 = c6a3be178ef2989c
!	%l1 = e9a7e9a914338d61
	setx	0x9ec2e4e342d09ae7,%g7,%l1 ! %l1 = 9ec2e4e342d09ae7
p0_fragment_7_end:
!	Mem[0000000010001408] = ffffffff, %l6 = 0000000000000062
	lduwa	[%i0+%o4]0x80,%l6	! %l6 = 00000000ffffffff
!	Mem[0000000010081410] = 00fa3100, %l5 = 00000000ff000000
	ldsha	[%i2+%o5]0x80,%l5	! %l5 = 00000000000000fa
!	Mem[0000000030101410] = ffffff00 ff5b81ff, %l4 = ffffff9b, %l5 = 000000fa
	ldda	[%i4+%o5]0x89,%l4	! %l4 = 00000000ff5b81ff 00000000ffffff00
!	Mem[0000000030001410] = ffff5adf97809b06, %f4  = 97809b06 000000ff
	ldda	[%i0+%o5]0x81,%f4 	! %f4  = ffff5adf 97809b06
!	Mem[0000000010001427] = ffff8097, %l7 = 00000000e7000000
	ldsb	[%i0+0x027],%l7		! %l7 = ffffffffffffff97
!	Mem[000000001014143c] = ae96bcff, %l2 = ffffffffffffcf08
	ldsb	[%i5+0x03c],%l2		! %l2 = ffffffffffffffae

p0_label_105:
!	Starting 10 instruction Store Burst
!	%l2 = ffffffffffffffae, Mem[0000000010181408] = e7000000
	stba	%l2,[%i6+%o4]0x88	! Mem[0000000010181408] = e70000ae
!	Mem[0000000010041408] = 97ffffe0, %l3 = 00000000ffffff9b
	swapa	[%i1+%o4]0x88,%l3	! %l3 = 0000000097ffffe0
!	Mem[0000000010041408] = 9bffffff, %l3 = 0000000097ffffe0
	ldstuba	[%i1+%o4]0x80,%l3	! %l3 = 000000000000009b
!	%l1 = 9ec2e4e342d09ae7, immd = fffff5e8, %y  = ffffffff
	smul	%l1,-0xa18,%l7		! %l7 = fffffd5d96647458, %y = fffffd5d
!	Mem[0000000010001410] = 97809b06, %l1 = 0000000042d09ae7
	swapa	[%i0+%o5]0x88,%l1	! %l1 = 0000000097809b06
!	%l4 = 00000000ff5b81ff, Mem[0000000010041400] = 00000000
	sth	%l4,[%i1+%g0]		! Mem[0000000010041400] = 81ff0000
!	Mem[0000000030041410] = 000000ff, %l3 = 000000000000009b
	swapa	[%i1+%o5]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030081400] = 414076ca, %l1 = 0000000097809b06
	swapa	[%i2+%g0]0x81,%l1	! %l1 = 00000000414076ca
!	%l7 = fffffd5d96647458, Mem[0000000010081410] = 0031fa00
	stwa	%l7,[%i2+%o5]0x88	! Mem[0000000010081410] = 96647458
!	%f26 = 9780ffff ffffffff, Mem[0000000010141408] = 5e22ebff 3e401579, %asi = 80
	stda	%f26,[%i5+0x008]%asi	! Mem[0000000010141408] = 9780ffff ffffffff

p0_label_106:
!	Starting 10 instruction Load Burst
!	Mem[0000000020800000] = 3aff42b0, %l0 = c6a3be178ef2989c, %asi = 80
	lduha	[%o1+0x000]%asi,%l0	! %l0 = 0000000000003aff
!	Mem[0000000010001400] = 000000ff, %l4 = 00000000ff5b81ff
	ldswa	[%i0+%g0]0x80,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030101410] = ff815bff, %l4 = 00000000000000ff
	lduha	[%i4+%o5]0x81,%l4	! %l4 = 000000000000ff81
!	Mem[0000000010141400] = 0000ff00, %l2 = ffffffffffffffae
	ldsha	[%i5+%g0]0x88,%l2	! %l2 = ffffffffffffff00
!	Mem[0000000010141409] = 9780ffff, %l5 = 00000000ffffff00
	ldsb	[%i5+0x009],%l5		! %l5 = ffffffffffffff80
!	Mem[0000000010101413] = 97809b06, %l0 = 0000000000003aff
	ldub	[%i4+0x013],%l0		! %l0 = 0000000000000006
!	Mem[00000000100c1408] = 97809b0600000000, %f12 = 62000000 00000000
	ldda	[%i3+%o4]0x80,%f12	! %f12 = 97809b06 00000000
!	%l3 = 00000000000000ff, %l7 = fffffd5d96647458, %l1 = 00000000414076ca
	sub	%l3,%l7,%l1		! %l1 = 000002a2699b8ca7
!	Mem[00000000300c1400] = ff5b81ff7ab2fe81, %f18 = 430aff00 069b8097
	ldda	[%i3+%g0]0x81,%f18	! %f18 = ff5b81ff 7ab2fe81
!	Mem[0000000010181428] = 4b57c496 06a15c8f, %l4 = 0000ff81, %l5 = ffffff80, %asi = 80
	ldda	[%i6+0x028]%asi,%l4	! %l4 = 000000004b57c496 0000000006a15c8f

p0_label_107:
!	Starting 10 instruction Store Burst
!	Mem[0000000030141408] = ff70e105, %l2 = 00000000ffffff00
	swapa	[%i5+%o4]0x89,%l2	! %l2 = 00000000ff70e105
!	Mem[00000000100c141c] = cf08230e, %l2 = ff70e105, %l7 = 96647458
	add	%i3,0x1c,%g1
	casa	[%g1]0x80,%l2,%l7	! %l7 = 00000000cf08230e
!	%l6 = 00000000ffffffff, Mem[0000000030141400] = 0000000000000038
	stxa	%l6,[%i5+%g0]0x81	! Mem[0000000030141400] = 00000000ffffffff
!	%l1 = 000002a2699b8ca7, Mem[0000000010001408] = ffffffff
	stwa	%l1,[%i0+%o4]0x88	! Mem[0000000010001408] = 699b8ca7
!	%l4 = 000000004b57c496, Mem[0000000010181410] = 00000062
	stba	%l4,[%i6+%o5]0x88	! Mem[0000000010181410] = 00000096
!	%l1 = 000002a2699b8ca7, Mem[00000000211c0001] = ff336b10, %asi = 80
	stba	%l1,[%o2+0x001]%asi	! Mem[00000000211c0000] = ffa76b10
!	Mem[0000000030141410] = 430a0000, %l6 = 00000000ffffffff
	ldstuba	[%i5+%o5]0x89,%l6	! %l6 = 0000000000000000
!	%l0 = 00000006, %l1 = 699b8ca7, Mem[0000000010181408] = ae0000e7 00ff0a43
	stda	%l0,[%i6+%o4]0x80	! Mem[0000000010181408] = 00000006 699b8ca7
!	Mem[0000000030081408] = 000000e0, %l2 = 00000000ff70e105
	swapa	[%i2+%o4]0x89,%l2	! %l2 = 00000000000000e0
!	%l2 = 00000000000000e0, Mem[00000000100c1400] = 84000000e7000000
	stxa	%l2,[%i3+%g0]0x88	! Mem[00000000100c1400] = 00000000000000e0

p0_label_108:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = 96000000, %l6 = 0000000000000000
	ldswa	[%i6+%o5]0x80,%l6	! %l6 = ffffffff96000000
!	Mem[0000000030101410] = ff815bff, %l0 = 0000000000000006
	lduwa	[%i4+%o5]0x81,%l0	! %l0 = 00000000ff815bff
!	Mem[0000000010141408] = ffff8097, %l1 = 000002a2699b8ca7
	lduwa	[%i5+%o4]0x88,%l1	! %l1 = 00000000ffff8097
!	%f31 = df070000, %f23 = 33b21d7d, %f20 = 5e000000
	fsubs	%f31,%f23,%f20		! %f20 = df070000
!	Mem[00000000300c1400] = ff815bff, %l0 = 00000000ff815bff
	ldsha	[%i3+%g0]0x89,%l0	! %l0 = 0000000000005bff
!	Mem[0000000030141400] = 00000000ffffffff, %f0  = 97809b06 ff000000
	ldda	[%i5+%g0]0x81,%f0 	! %f0  = 00000000 ffffffff
!	Mem[0000000030141410] = ff000a43, %l6 = ffffffff96000000
	ldsba	[%i5+%o5]0x81,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010001400] = 000000ff, %l4 = 000000004b57c496
	ldsba	[%i0+%g0]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000010141410] = 7c000000, %l4 = 0000000000000000
	ldsha	[%i5+%o5]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000010081410] = 96647458, %l6 = ffffffffffffffff
	lduwa	[%i2+%o5]0x88,%l6	! %l6 = 0000000096647458

p0_label_109:
!	Starting 10 instruction Store Burst
!	%l5 = 0000000006a15c8f, Mem[0000000030041408] = 9bffffffffffffff
	stxa	%l5,[%i1+%o4]0x89	! Mem[0000000030041408] = 0000000006a15c8f
!	Mem[0000000010101400] = ca76ffff 583e7df1 ffff0000 00000000
!	%f0  = 00000000 ffffffff 9780ffff ffffffff
!	%f4  = ffff5adf 97809b06 cf70fe60 97809b06
!	%f8  = ff31ffe9 80973349 ffffffff 80970000
!	%f12 = 97809b06 00000000 7e000000 00000000
	stda	%f0 ,[%i4+%g0]ASI_BLK_PL	! Block Store to 0000000010101400
!	%l6 = 0000000096647458, Mem[0000000030141400] = ffffffff00000000
	stxa	%l6,[%i5+%g0]0x89	! Mem[0000000030141400] = 0000000096647458
!	%f2  = 9780ffff ffffffff, Mem[0000000030101408] = 000000e7 00000000
	stda	%f2 ,[%i4+%o4]0x89	! Mem[0000000030101408] = 9780ffff ffffffff
!	Mem[0000000030141408] = ffffff00, %l3 = 00000000000000ff
	swapa	[%i5+%o4]0x89,%l3	! %l3 = 00000000ffffff00
!	Mem[0000000010041400] = 81ff0000, %l6 = 0000000096647458
	swapa	[%i1+%g0]0x80,%l6	! %l6 = 0000000081ff0000
!	%l2 = 00000000000000e0, Mem[00000000100c1410] = ff000000414076ca
	stxa	%l2,[%i3+%o5]0x80	! Mem[00000000100c1410] = 00000000000000e0
!	Mem[0000000010181400] = 38000000, %l4 = 0000000000000000
	ldstuba	[%i6+%g0]0x80,%l4	! %l4 = 0000000000000038
!	%l4 = 00000038, %l5 = 06a15c8f, Mem[0000000030041410] = 0000009b bb82f0bf
	stda	%l4,[%i1+%o5]0x89	! Mem[0000000030041410] = 00000038 06a15c8f
!	%l3 = 00000000ffffff00, Mem[00000000211c0000] = ffa76b10, %asi = 80
	stha	%l3,[%o2+0x000]%asi	! Mem[00000000211c0000] = ff006b10

p0_label_110:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = 35bc0000 7c000000, %l0 = 00005bff, %l1 = ffff8097
	ldda	[%i5+%o5]0x88,%l0	! %l0 = 000000007c000000 0000000035bc0000
!	Mem[0000000010181410] = 960000000000005e, %l7 = 00000000cf08230e
	ldxa	[%i6+%o5]0x80,%l7	! %l7 = 960000000000005e
!	Mem[0000000030081400] = 3e000000069b8097, %l0 = 000000007c000000
	ldxa	[%i2+%g0]0x89,%l0	! %l0 = 3e000000069b8097
!	Mem[0000000010081410] = 58746496 069b3e5d, %l6 = 81ff0000, %l7 = 0000005e
	ldd	[%i2+%o5],%l6		! %l6 = 0000000058746496 00000000069b3e5d
!	Mem[0000000010001410] = e79ad042, %l7 = 00000000069b3e5d
	lduha	[%i0+%o5]0x80,%l7	! %l7 = 000000000000e79a
!	Mem[0000000010001408] = a78c9b69, %l6 = 0000000058746496
	ldsha	[%i0+%o4]0x80,%l6	! %l6 = ffffffffffffa78c
!	Mem[0000000010181410] = 960000000000005e, %l0 = 3e000000069b8097, %asi = 80
	ldxa	[%i6+0x010]%asi,%l0	! %l0 = 960000000000005e
!	Mem[0000000021800141] = 28658430, %l2 = 00000000000000e0, %asi = 80
	ldsba	[%o3+0x141]%asi,%l2	! %l2 = 0000000000000065
!	Mem[0000000010041400] = 9664745890185eaf, %f26 = 9780ffff ffffffff
	ldda	[%i1+%g0]0x80,%f26	! %f26 = 96647458 90185eaf
!	Mem[0000000010041408] = ffffffff, %l1 = 0000000035bc0000
	ldsha	[%i1+%o4]0x88,%l1	! %l1 = ffffffffffffffff

p0_label_111:
!	Starting 10 instruction Store Burst
!	%l5 = 0000000006a15c8f, Mem[0000000030081400] = 069b8097
	stwa	%l5,[%i2+%g0]0x89	! Mem[0000000030081400] = 06a15c8f
!	%l7 = 000000000000e79a, Mem[0000000030101410] = ff815bff
	stha	%l7,[%i4+%o5]0x81	! Mem[0000000030101410] = e79a5bff
!	%l6 = ffffffffffffa78c, Mem[0000000030181408] = 38ff3e85
	stha	%l6,[%i6+%o4]0x81	! Mem[0000000030181408] = a78c3e85
!	%l4 = 0000000000000038, Mem[0000000010181400] = ffff8097000000ff
	stxa	%l4,[%i6+%g0]0x88	! Mem[0000000010181400] = 0000000000000038
!	%l7 = 000000000000e79a, imm = ffffffffffffffd3, %l0 = 960000000000005e
	andn	%l7,-0x02d,%l0		! %l0 = 0000000000000008
!	Mem[0000000030001400] = ffe20000, %l4 = 0000000000000038
	swapa	[%i0+%g0]0x81,%l4	! %l4 = 00000000ffe20000
!	Mem[0000000010081410] = 58746496, %l0 = 0000000000000008
	swapa	[%i2+%o5]0x80,%l0	! %l0 = 0000000058746496
!	%l3 = 00000000ffffff00, Mem[0000000030181410] = 00000062
	stha	%l3,[%i6+%o5]0x89	! Mem[0000000030181410] = 0000ff00
!	Mem[0000000030081400] = 06a15c8f, %l7 = 000000000000e79a
	ldstuba	[%i2+%g0]0x89,%l7	! %l7 = 000000000000008f
!	%l4 = ffe20000, %l5 = 06a15c8f, Mem[0000000010141400] = 0000ff00 a916a0ff
	stda	%l4,[%i5+%g0]0x88	! Mem[0000000010141400] = ffe20000 06a15c8f

p0_label_112:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = 5e000000 00000096, %l2 = 00000065, %l3 = ffffff00
	ldda	[%i6+%o5]0x88,%l2	! %l2 = 0000000000000096 000000005e000000
!	Mem[0000000010081410] = 00000008, %l4 = 00000000ffe20000
	lduwa	[%i2+%o5]0x80,%l4	! %l4 = 0000000000000008
!	Mem[0000000020800040] = ffff18e0, %l7 = 000000000000008f, %asi = 80
	ldsha	[%o1+0x040]%asi,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010141410] = 7c000000, %l3 = 000000005e000000
	ldsha	[%i5+%o5]0x88,%l3	! %l3 = 0000000000000000
!	Mem[00000000300c1408] = ccf393ff, %l3 = 0000000000000000
	ldsba	[%i3+%o4]0x89,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000030081410] = 2c31faff, %l3 = ffffffffffffffff
	lduwa	[%i2+%o5]0x89,%l3	! %l3 = 000000002c31faff
!	Mem[0000000010081400] = 35bcbf82, %l6 = ffffffffffffa78c
	lduha	[%i2+%g0]0x88,%l6	! %l6 = 000000000000bf82
!	Mem[0000000010141410] = 0000007c0000bc35, %f24 = 0e2308cf 5a018f5d
	ldda	[%i5+%o5]0x80,%f24	! %f24 = 0000007c 0000bc35
!	Mem[0000000010041400] = 58746496, %f3  = ffffffff
	lda	[%i1+%g0]0x88,%f3 	! %f3 = 58746496
!	Mem[0000000030181400] = dba68d0300009c6e, %f8  = ff31ffe9 80973349
	ldda	[%i6+%g0]0x89,%f8 	! %f8  = dba68d03 00009c6e

p0_label_113:
!	Starting 10 instruction Store Burst
!	%f14 = 7e000000 00000000, Mem[0000000010141408] = 9780ffff ffffffff
	stda	%f14,[%i5+%o4]0x80	! Mem[0000000010141408] = 7e000000 00000000
!	Mem[0000000010181408] = 00000006, %l7 = 00000000ffffffff
	swapa	[%i6+%o4]0x80,%l7	! %l7 = 0000000000000006
!	Mem[0000000030041400] = 97809b06, %l5 = 0000000006a15c8f
	swapa	[%i1+%g0]0x81,%l5	! %l5 = 0000000097809b06
!	Mem[0000000030081400] = 06a15cff, %l1 = ffffffffffffffff
	ldstuba	[%i2+%g0]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010141400] = ffe20000, %l6 = 000000000000bf82
	swapa	[%i5+%g0]0x88,%l6	! %l6 = 00000000ffe20000
!	%l6 = 00000000ffe20000, Mem[0000000010101410] = 97809b06
	stwa	%l6,[%i4+%o5]0x88	! Mem[0000000010101410] = ffe20000
	membar	#Sync			! Added by membar checker (25)
!	Mem[0000000010101408] = ffffffff, %l7 = 0000000000000006
	ldstuba	[%i4+%o4]0x80,%l7	! %l7 = 00000000000000ff
!	%l6 = 00000000ffe20000, Mem[0000000010101410] = 0000e2ff
	stwa	%l6,[%i4+%o5]0x80	! Mem[0000000010101410] = ffe20000
!	%l7 = 00000000000000ff, Mem[0000000030181410] = 0000ff00
	stha	%l7,[%i6+%o5]0x89	! Mem[0000000030181410] = 000000ff
!	Mem[0000000030001400] = 38000000, %l5 = 0000000097809b06
	ldstuba	[%i0+%g0]0x89,%l5	! %l5 = 0000000000000000

p0_label_114:
!	Starting 10 instruction Load Burst
!	Mem[0000000020800040] = ffff18e0, %l0 = 0000000058746496
	ldsh	[%o1+0x040],%l0		! %l0 = ffffffffffffffff
!	Mem[0000000010001400] = 000000ff 069b8097 a78c9b69 ffff8097
!	Mem[0000000010001410] = e79ad042 60fe70cf 069b8097 60fe70cf
!	Mem[0000000010001420] = 00000038 ffff8097 00009780 ffffffff
!	Mem[0000000010001430] = 00000000 00000062 00000000 0000007e
	ldda	[%i0+%g0]ASI_BLK_P,%f16	! Block Load from 0000000010001400
!	Mem[0000000021800180] = 65743a60, %l1 = 00000000000000ff
	lduh	[%o3+0x180],%l1		! %l1 = 0000000000006574
!	Mem[00000000100c1408] = 97809b06, %l5 = 0000000000000000
	ldsha	[%i3+%o4]0x80,%l5	! %l5 = ffffffffffff9780
!	Mem[0000000010041400] = 58746496, %f15 = 00000000
	lda	[%i1+%g0]0x88,%f15	! %f15 = 58746496
!	Mem[0000000030041408] = 8f5ca106, %l5 = ffffffffffff9780
	lduha	[%i1+%o4]0x81,%l5	! %l5 = 0000000000008f5c
!	Mem[0000000010101400] = 00000000 ffffffff, %l6 = ffe20000, %l7 = 000000ff
	ldda	[%i4+%g0]0x88,%l6	! %l6 = 00000000ffffffff 0000000000000000
!	Mem[0000000010181410] = 5e00000000000096, %l6 = 00000000ffffffff
	ldxa	[%i6+%o5]0x88,%l6	! %l6 = 5e00000000000096
!	Mem[0000000030141400] = 58746496, %l7 = 0000000000000000
	lduba	[%i5+%g0]0x81,%l7	! %l7 = 0000000000000058
!	Mem[0000000010081400] = 82bfbc3534ff5573, %l0 = ffffffffffffffff
	ldxa	[%i2+%g0]0x80,%l0	! %l0 = 82bfbc3534ff5573

p0_label_115:
!	Starting 10 instruction Store Burst
!	Mem[00000000201c0001] = 230ee880, %l3 = 000000002c31faff
	ldstub	[%o0+0x001],%l3		! %l3 = 000000000000000e
!	Mem[00000000300c1408] = ff93f3cc, %l3 = 000000000000000e
	ldstuba	[%i3+%o4]0x81,%l3	! %l3 = 00000000000000ff
!	Mem[000000001004140e] = 0000ffff, %l4 = 0000000000000008
	ldstub	[%i1+0x00e],%l4		! %l4 = 00000000000000ff
!	%f12 = 97809b06 00000000, Mem[0000000030001400] = 380000ff 3e000000
	stda	%f12,[%i0+%g0]0x89	! Mem[0000000030001400] = 97809b06 00000000
!	%f27 = ffffffff, Mem[0000000010141410] = 0000007c
	sta	%f27,[%i5+%o5]0x80	! Mem[0000000010141410] = ffffffff
!	%f18 = a78c9b69, Mem[0000000010081400] = 35bcbf82
	sta	%f18,[%i2+%g0]0x88	! Mem[0000000010081400] = a78c9b69
!	%f8  = dba68d03 00009c6e, Mem[00000000100c1408] = 069b8097 00000000
	stda	%f8 ,[%i3+%o4]0x88	! Mem[00000000100c1408] = dba68d03 00009c6e
!	%l0 = 34ff5573, %l1 = 00006574, Mem[0000000010181400] = 00000038 00000000
	stda	%l0,[%i6+%g0]0x88	! Mem[0000000010181400] = 34ff5573 00006574
!	Mem[0000000030001410] = ffff5adf, %l5 = 0000000000008f5c
	ldstuba	[%i0+%o5]0x81,%l5	! %l5 = 00000000000000ff
!	Mem[00000000100c1410] = 00000000, %l5 = 00000000000000ff
	ldstuba	[%i3+%o5]0x80,%l5	! %l5 = 0000000000000000

p0_label_116:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = ffffffff, %l2 = 0000000000000096
	ldsha	[%i4+%o4]0x88,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000030041400] = 06a15c8fa3eca856, %l0 = 82bfbc3534ff5573
	ldxa	[%i1+%g0]0x81,%l0	! %l0 = 06a15c8fa3eca856
!	Mem[0000000030141408] = 000000ff, %l0 = 06a15c8fa3eca856
	lduha	[%i5+%o4]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010001410] = e79ad04260fe70cf, %f2  = 9780ffff 58746496
	ldda	[%i0+%o5]0x80,%f2 	! %f2  = e79ad042 60fe70cf
!	Mem[0000000010001410] = e79ad042, %l2 = ffffffffffffffff
	ldsba	[%i0+%o5]0x80,%l2	! %l2 = ffffffffffffffe7
!	Mem[0000000010001408] = 9780ffff699b8ca7, %f6  = cf70fe60 97809b06
	ldda	[%i0+%o4]0x88,%f6 	! %f6  = 9780ffff 699b8ca7
!	Mem[0000000010041430] = 63ad6d442ca93559, %f10 = ffffffff 80970000
	ldd	[%i1+0x030],%f10	! %f10 = 63ad6d44 2ca93559
!	Mem[0000000010181400] = 7355ff3474650000, %l6 = 5e00000000000096
	ldxa	[%i6+%g0]0x80,%l6	! %l6 = 7355ff3474650000
!	Mem[0000000010141408] = 7e000000, %l7 = 0000000000000058
	lduha	[%i5+%o4]0x80,%l7	! %l7 = 0000000000007e00
!	Mem[0000000030081400] = ff5ca106, %l7 = 0000000000007e00
	ldsba	[%i2+%g0]0x81,%l7	! %l7 = ffffffffffffffff

p0_label_117:
!	Starting 10 instruction Store Burst
!	%l6 = 7355ff3474650000, Mem[0000000030181400] = 6e9c0000
	stwa	%l6,[%i6+%g0]0x81	! Mem[0000000030181400] = 74650000
!	%l7 = ffffffffffffffff, Mem[0000000010041408] = ffffffff
	stba	%l7,[%i1+%o4]0x88	! Mem[0000000010041408] = ffffffff
!	%f24 = 00000038 ffff8097, Mem[00000000300c1408] = ccf393ff 57000000
	stda	%f24,[%i3+%o4]0x89	! Mem[00000000300c1408] = 00000038 ffff8097
!	%f26 = 00009780 ffffffff, Mem[0000000030141400] = 96647458 00000000
	stda	%f26,[%i5+%g0]0x89	! Mem[0000000030141400] = 00009780 ffffffff
!	Mem[00000000201c0001] = 23ffe880, %l1 = 0000000000006574
	ldstub	[%o0+0x001],%l1		! %l1 = 00000000000000ff
!	%l4 = 00000000000000ff, %l6 = 7355ff3474650000, %l0 = 00000000000000ff
	xnor	%l4,%l6,%l0		! %l0 = 8caa00cb8b9aff00
!	%l4 = 00000000000000ff, %l3 = 00000000000000ff, %y  = fffffd5d
	sdiv	%l4,%l3,%l0		! %l0 = ffffffff80000000
	mov	%l0,%y			! %y = 80000000
	membar	#Sync			! Added by membar checker (26)
!	%l1 = 00000000000000ff, Mem[0000000010001408] = a78c9b69
	stha	%l1,[%i0+%o4]0x80	! Mem[0000000010001408] = 00ff9b69
!	%l7 = ffffffffffffffff, Mem[0000000030081408] = 000000ffff70e105
	stxa	%l7,[%i2+%o4]0x89	! Mem[0000000030081408] = ffffffffffffffff
!	Mem[0000000010101438] = 00000000, %l5 = 00000000, %l6 = 74650000
	add	%i4,0x38,%g1
	casa	[%g1]0x80,%l5,%l6	! %l6 = 0000000000000000

p0_label_118:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = 7355ff34 74650000, %l6 = 00000000, %l7 = ffffffff
	ldda	[%i6+%g0]0x80,%l6	! %l6 = 000000007355ff34 0000000074650000
!	Mem[0000000030001408] = 00000000 000000ff, %l0 = 80000000, %l1 = 000000ff
	ldda	[%i0+%o4]0x89,%l0	! %l0 = 00000000000000ff 0000000000000000
!	%l6 = 000000007355ff34, %l3 = 00000000000000ff, %l4 = 00000000000000ff
	udivx	%l6,%l3,%l4		! %l4 = 000000000073c9c8
!	Mem[000000001000143e] = 0000007e, %l5 = 0000000000000000, %asi = 80
	ldsha	[%i0+0x03e]%asi,%l5	! %l5 = 000000000000007e
!	Mem[0000000030101400] = 000000ff 0000bc35 ffffffff ffff8097
!	Mem[0000000030101410] = e79a5bff 00ffffff 132d1dff ead2d20d
!	Mem[0000000030101420] = 29f2ed05 f8301428 ffeb225e 2e2979ff
!	Mem[0000000030101430] = 97809b06 649f9e67 8b567e33 c282a666
	ldda	[%i4+%g0]ASI_BLK_S,%f16	! Block Load from 0000000030101400
!	Mem[00000000100c1410] = ff000000, %l0 = 00000000000000ff
	ldsha	[%i3+%o5]0x80,%l0	! %l0 = ffffffffffffff00
!	Mem[000000001014141c] = cf08230e, %l7 = 0000000074650000, %asi = 80
	ldswa	[%i5+0x01c]%asi,%l7	! %l7 = ffffffffcf08230e
!	Mem[0000000010081408] = e7000000, %l7 = ffffffffcf08230e
	lduha	[%i2+%o4]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000030101400] = 000000ff0000bc35, %f4  = ffff5adf 97809b06
	ldda	[%i4+%g0]0x81,%f4 	! %f4  = 000000ff 0000bc35
!	Mem[0000000010141408] = 7e00000000000000, %f8  = dba68d03 00009c6e
	ldda	[%i5+%o4]0x80,%f8 	! %f8  = 7e000000 00000000

p0_label_119:
!	Starting 10 instruction Store Burst
!	%f11 = 2ca93559, %f17 = 0000bc35
	fcmpes	%fcc3,%f11,%f17		! %fcc3 = 2
!	Mem[0000000010001400] = 000000ff 069b8097 00ff9b69 ffff8097
!	%f0  = 00000000 ffffffff e79ad042 60fe70cf
!	%f4  = 000000ff 0000bc35 9780ffff 699b8ca7
!	%f8  = 7e000000 00000000 63ad6d44 2ca93559
!	%f12 = 97809b06 00000000 7e000000 58746496
	stda	%f0 ,[%i0+%g0]ASI_BLK_PL	! Block Store to 0000000010001400
!	Mem[0000000030141400] = ffffffff, %l2 = ffffffffffffffe7
	ldstuba	[%i5+%g0]0x81,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010181410] = 96000000, %l1 = 0000000000000000
	ldstuba	[%i6+%o5]0x80,%l1	! %l1 = 0000000000000096
!	%l2 = 000000ff, %l3 = 000000ff, Mem[0000000010041408] = ffffffff 0000ffff
	stda	%l2,[%i1+%o4]0x80	! Mem[0000000010041408] = 000000ff 000000ff
!	%l6 = 000000007355ff34, immd = fffff160, %y  = 80000000
	umul	%l6,-0xea0,%l6		! %l6 = 7355f89d364ba780, %y = 7355f89d
	membar	#Sync			! Added by membar checker (27)
!	%l5 = 000000000000007e, Mem[0000000030101400] = 000000ff
	stba	%l5,[%i4+%g0]0x81	! Mem[0000000030101400] = 7e0000ff
!	Mem[00000000300c1400] = ff815bff, %l4 = 000000000073c9c8
	ldstuba	[%i3+%g0]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010081410] = 00000008, %l6 = 00000000364ba780
	swapa	[%i2+%o5]0x80,%l6	! %l6 = 0000000000000008
!	Mem[00000000211c0001] = ff006b10, %l4 = 00000000000000ff
	ldstuba	[%o2+0x001]%asi,%l4	! %l4 = 0000000000000000

p0_label_120:
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = ffffffff, %l2 = 00000000000000ff
	ldswa	[%i5+%g0]0x81,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000030081408] = ffffffff, %l2 = ffffffffffffffff
	lduba	[%i2+%o4]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030141400] = ffffffff 80970000, %l0 = ffffff00, %l1 = 00000096
	ldda	[%i5+%g0]0x81,%l0	! %l0 = 00000000ffffffff 0000000080970000
!	Mem[0000000010041400] = 58746496, %l7 = 0000000000000000
	ldsha	[%i1+%g0]0x88,%l7	! %l7 = 0000000000006496
!	Mem[0000000030041400] = 06a15c8f, %l5 = 000000000000007e
	ldswa	[%i1+%g0]0x81,%l5	! %l5 = 0000000006a15c8f
!	%f10 = 63ad6d44, %f21 = 00ffffff
	fcmpes	%fcc3,%f10,%f21		! %fcc3 = 2
!	Mem[0000000030181400] = 74650000, %l7 = 0000000000006496
	swapa	[%i6+%g0]0x81,%l7	! %l7 = 0000000074650000
!	Mem[0000000030141408] = 000000ff, %f25 = f8301428
	lda	[%i5+%o4]0x89,%f25	! %f25 = 000000ff
!	Mem[0000000010081408] = 000000e7 00000084, %l6 = 00000008, %l7 = 74650000
	ldda	[%i2+%o4]0x80,%l6	! %l6 = 00000000000000e7 0000000000000084
!	Mem[0000000010081400] = a78c9b69, %l5 = 0000000006a15c8f
	ldswa	[%i2+%g0]0x88,%l5	! %l5 = ffffffffa78c9b69

p0_label_121:
!	Starting 10 instruction Store Burst
!	%l1 = 0000000080970000, Mem[0000000030181408] = a78c3e851d5da0d1
	stxa	%l1,[%i6+%o4]0x81	! Mem[0000000030181408] = 0000000080970000
!	Mem[0000000010181400] = 34ff5573, %l0 = 00000000ffffffff
	swapa	[%i6+%g0]0x88,%l0	! %l0 = 0000000034ff5573
!	Mem[0000000030141400] = ffffffff, %l2 = 00000000000000ff
	swapa	[%i5+%g0]0x81,%l2	! %l2 = 00000000ffffffff
!	%l2 = 00000000ffffffff, Mem[0000000030001410] = ffff5adf
	stba	%l2,[%i0+%o5]0x81	! Mem[0000000030001410] = ffff5adf
!	Mem[0000000030041410] = 38000000, %l5 = ffffffffa78c9b69
	ldstuba	[%i1+%o5]0x81,%l5	! %l5 = 0000000000000038
!	Mem[0000000030081400] = ff5ca106, %l7 = 0000000000000084
	swapa	[%i2+%g0]0x81,%l7	! %l7 = 00000000ff5ca106
!	%f30 = 8b567e33 c282a666, %l4 = 0000000000000000
!	Mem[0000000030001400] = 00000000069b8097
	stda	%f30,[%i0+%l4]ASI_PST8_S ! Mem[0000000030001400] = 00000000069b8097
!	Mem[0000000010181410] = ff000000, %l6 = 00000000000000e7
	swapa	[%i6+%o5]0x80,%l6	! %l6 = 00000000ff000000
!	%l0 = 34ff5573, %l1 = 80970000, Mem[00000000100c1400] = e0000000 00000000, %asi = 80
	stda	%l0,[%i3+0x000]%asi	! Mem[00000000100c1400] = 34ff5573 80970000
!	%l6 = ff000000, %l7 = ff5ca106, Mem[0000000030081400] = 84000000 3e000000
	stda	%l6,[%i2+%g0]0x89	! Mem[0000000030081400] = ff000000 ff5ca106

p0_label_122:
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = 9780ffff38000000, %l6 = 00000000ff000000
	ldxa	[%i3+%o4]0x81,%l6	! %l6 = 9780ffff38000000
!	Mem[0000000030181410] = 000000ff, %l1 = 0000000080970000
	lduwa	[%i6+%o5]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010181408] = a78c9b69ffffffff, %f26 = ffeb225e 2e2979ff
	ldda	[%i6+%o4]0x88,%f26	! %f26 = a78c9b69 ffffffff
!	Mem[0000000030001400] = 00000000, %l6 = 9780ffff38000000
	lduha	[%i0+%g0]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000030101400] = 35bc0000ff00007e, %l0 = 0000000034ff5573
	ldxa	[%i4+%g0]0x89,%l0	! %l0 = 35bc0000ff00007e
!	Mem[0000000030181410] = ff000000, %f1  = ffffffff
	lda	[%i6+%o5]0x81,%f1 	! %f1 = ff000000
!	Mem[0000000010101430] = 00000000 069b8097, %l2 = ffffffff, %l3 = 000000ff
	ldd	[%i4+0x030],%l2		! %l2 = 0000000000000000 00000000069b8097
!	Mem[0000000010181400] = 00006574ffffffff, %l7 = 00000000ff5ca106
	ldxa	[%i6+%g0]0x88,%l7	! %l7 = 00006574ffffffff
!	Mem[0000000030101400] = ff00007e, %f30 = 8b567e33
	lda	[%i4+%g0]0x89,%f30	! %f30 = ff00007e
!	Mem[0000000021800080] = 5baa49a0, %l1 = 00000000000000ff, %asi = 80
	lduba	[%o3+0x080]%asi,%l1	! %l1 = 000000000000005b

p0_label_123:
!	Starting 10 instruction Store Burst
!	Mem[0000000030081400] = ff000000, %l6 = 0000000000000000
	swapa	[%i2+%g0]0x89,%l6	! %l6 = 00000000ff000000
!	%l1 = 000000000000005b, Mem[0000000010041410] = 626dad4b
	stba	%l1,[%i1+%o5]0x88	! Mem[0000000010041410] = 626dad5b
!	Mem[0000000030141408] = 000000ff, %l5 = 0000000000000038
	ldstuba	[%i5+%o4]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010041400] = 96647458 90185eaf 000000ff 000000ff
!	%f0  = 00000000 ff000000 e79ad042 60fe70cf
!	%f4  = 000000ff 0000bc35 9780ffff 699b8ca7
!	%f8  = 7e000000 00000000 63ad6d44 2ca93559
!	%f12 = 97809b06 00000000 7e000000 58746496
	stda	%f0 ,[%i1+%g0]ASI_BLK_P	! Block Store to 0000000010041400
!	%l1 = 000000000000005b, Mem[00000000300c1400] = ff5b81ff
	stba	%l1,[%i3+%g0]0x81	! Mem[00000000300c1400] = 5b5b81ff
!	%f22 = 132d1dff ead2d20d, %l1 = 000000000000005b
!	Mem[00000000300c1418] = 1f88293266754b36
	add	%i3,0x018,%g1
	stda	%f22,[%g1+%l1]ASI_PST8_SL ! Mem[00000000300c1418] = 0dd229eaff752d36
!	Mem[0000000010141404] = 8f5ca106, %l3 = 00000000069b8097
	ldstuba	[%i5+0x004]%asi,%l3	! %l3 = 000000000000008f
!	%l3 = 000000000000008f, Mem[0000000010181408] = ffffffff699b8ca7
	stxa	%l3,[%i6+%o4]0x80	! Mem[0000000010181408] = 000000000000008f
!	%l0 = 35bc0000ff00007e, Mem[00000000300c1400] = 5b5b81ff7ab2fe81
	stxa	%l0,[%i3+%g0]0x81	! Mem[00000000300c1400] = 35bc0000ff00007e
!	%l6 = ff000000, %l7 = ffffffff, Mem[0000000010041410] = 000000ff 0000bc35, %asi = 80
	stda	%l6,[%i1+0x010]%asi	! Mem[0000000010041410] = ff000000 ffffffff

p0_label_124:
!	Starting 10 instruction Load Burst
!	%f15 = 58746496, %f25 = 000000ff
	fcmps	%fcc0,%f15,%f25		! %fcc0 = 2
!	%f6  = 9780ffff, %f12 = 97809b06
	fcmps	%fcc1,%f6 ,%f12		! %fcc1 = 1
!	Mem[0000000010101410] = ffe20000, %l2 = 0000000000000000
	lduha	[%i4+%o5]0x80,%l2	! %l2 = 000000000000ffe2
!	Mem[0000000010001408] = e79ad04260fe70cf, %l3 = 000000000000008f
	ldxa	[%i0+%o4]0x88,%l3	! %l3 = e79ad04260fe70cf
!	Mem[00000000300c1410] = 9780292ecf08230e, %f16 = 000000ff 0000bc35
	ldda	[%i3+%o5]0x81,%f16	! %f16 = 9780292e cf08230e
	membar	#Sync			! Added by membar checker (28)
!	Mem[0000000010081400] = 699b8ca7 34ff5573 000000e7 00000084
!	Mem[0000000010081410] = 364ba780 069b3e5d 314aa6da 70b80044
!	Mem[0000000010081420] = 1df3a868 2df625d9 00000057 1b1d3f9f
!	Mem[0000000010081430] = 069b8097 0b14976b 0a80ccb2 3ff082bb
	ldda	[%i2+%g0]ASI_BLK_P,%f16	! Block Load from 0000000010081400
!	Mem[0000000030141408] = 000000ff, %l5 = 00000000000000ff
	ldswa	[%i5+%o4]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010181400] = ffffffff, %l4 = 0000000000000000
	ldswa	[%i6+%g0]0x88,%l4	! %l4 = ffffffffffffffff
!	%f22 = 314aa6da 70b80044, Mem[0000000030001410] = ffff5adf 97809b06
	stda	%f22,[%i0+%o5]0x81	! Mem[0000000030001410] = 314aa6da 70b80044
!	Mem[0000000030041400] = 8f5ca106, %l4 = ffffffffffffffff
	lduwa	[%i1+%g0]0x89,%l4	! %l4 = 000000008f5ca106

p0_label_125:
!	Starting 10 instruction Store Burst
!	%f24 = 1df3a868 2df625d9, Mem[0000000030001408] = ff000000 00000000
	stda	%f24,[%i0+%o4]0x81	! Mem[0000000030001408] = 1df3a868 2df625d9
!	Mem[000000001014143c] = ae96bcff, %l3 = 0000000060fe70cf, %asi = 80
	swapa	[%i5+0x03c]%asi,%l3	! %l3 = 00000000ae96bcff
!	Mem[0000000010041426] = 00000000, %l4 = 000000008f5ca106
	ldstub	[%i1+0x026],%l4		! %l4 = 0000000000000000
!	%l0 = 35bc0000ff00007e, Mem[0000000030041400] = 06a15c8f
	stba	%l0,[%i1+%g0]0x81	! Mem[0000000030041400] = 7ea15c8f
!	Mem[000000001014143c] = 60fe70cf, %l1 = 000000000000005b
	swap	[%i5+0x03c],%l1		! %l1 = 0000000060fe70cf
!	Mem[00000000100c1400] = 34ff5573, %l5 = 00000000000000ff
	ldstuba	[%i3+%g0]0x80,%l5	! %l5 = 0000000000000034
!	%l7 = 00006574ffffffff, Mem[00000000300c1410] = 2e298097
	stwa	%l7,[%i3+%o5]0x89	! Mem[00000000300c1410] = ffffffff
!	%l1 = 0000000060fe70cf, Mem[0000000030141410] = ff000a43
	stha	%l1,[%i5+%o5]0x81	! Mem[0000000030141410] = 70cf0a43
!	Mem[0000000030101400] = 7e0000ff, %l2 = 000000000000ffe2
	ldstuba	[%i4+%g0]0x81,%l2	! %l2 = 000000000000007e
!	%f8  = 7e000000, Mem[0000000010041410] = ff000000
	sta	%f8 ,[%i1+%o5]0x80	! Mem[0000000010041410] = 7e000000

p0_label_126:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = ffff5573, %l0 = 35bc0000ff00007e
	lduba	[%i3+%g0]0x80,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030081410] = 2c31faff, %l3 = 00000000ae96bcff
	lduha	[%i2+%o5]0x89,%l3	! %l3 = 000000000000faff
!	Mem[0000000010181400] = ffffffff, %l1 = 0000000060fe70cf
	lduwa	[%i6+%g0]0x88,%l1	! %l1 = 00000000ffffffff
!	Mem[0000000010141408] = 0000007e, %l4 = 0000000000000000
	lduwa	[%i5+%o4]0x88,%l4	! %l4 = 000000000000007e
!	Mem[00000000100c1410] = 000000ff, %l4 = 000000000000007e
	lduwa	[%i3+%o5]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030141410] = 00000000 430acf70, %l6 = ff000000, %l7 = ffffffff
	ldda	[%i5+%o5]0x89,%l6	! %l6 = 00000000430acf70 0000000000000000
!	Mem[0000000030081410] = 2c31faff, %l6 = 00000000430acf70
	ldswa	[%i2+%o5]0x89,%l6	! %l6 = 000000002c31faff
!	Mem[00000000100c143a] = 4bad6d62, %l0 = 00000000000000ff, %asi = 80
	lduba	[%i3+0x03a]%asi,%l0	! %l0 = 000000000000006d
!	Mem[0000000010041410] = 7e000000ffffffff, %l6 = 000000002c31faff
	ldxa	[%i1+%o5]0x80,%l6	! %l6 = 7e000000ffffffff
!	Mem[0000000010181400] = ffffffff, %l4 = 00000000000000ff
	ldswa	[%i6+%g0]0x80,%l4	! %l4 = ffffffffffffffff

p0_label_127:
!	Starting 10 instruction Store Burst
!	%l2 = 000000000000007e, Mem[0000000030141408] = ff000000
	stwa	%l2,[%i5+%o4]0x81	! Mem[0000000030141408] = 0000007e
!	%l6 = ffffffff, %l7 = 00000000, Mem[00000000100c1410] = ff000000 000000e0
	stda	%l6,[%i3+%o5]0x80	! Mem[00000000100c1410] = ffffffff 00000000
!	%f25 = 2df625d9, Mem[0000000010001408] = cf70fe60
	st	%f25,[%i0+%o4]		! Mem[0000000010001408] = 2df625d9
	membar	#Sync			! Added by membar checker (29)
!	%f22 = 314aa6da, Mem[0000000010081410] = 80a74b36
	sta	%f22,[%i2+%o5]0x88	! Mem[0000000010081410] = 314aa6da
!	%l0 = 0000006d, %l1 = ffffffff, Mem[0000000030081408] = ffffffff ffffffff
	stda	%l0,[%i2+%o4]0x81	! Mem[0000000030081408] = 0000006d ffffffff
!	%l3 = 000000000000faff, Mem[0000000010141438] = 47b7546d0000005b, %asi = 80
	stxa	%l3,[%i5+0x038]%asi	! Mem[0000000010141438] = 000000000000faff
!	Mem[0000000010001419] = a78c9b69, %l0 = 000000000000006d
	ldstub	[%i0+0x019],%l0		! %l0 = 000000000000008c
!	%l4 = ffffffffffffffff, Mem[00000000100c1400] = ffff5573
	stba	%l4,[%i3+%g0]0x80	! Mem[00000000100c1400] = ffff5573
!	%l0 = 0000008c, %l1 = ffffffff, Mem[0000000010001428] = 5935a92c 446dad63
	std	%l0,[%i0+0x028]		! Mem[0000000010001428] = 0000008c ffffffff
!	Mem[0000000010181410] = 000000e7, %l0 = 000000000000008c
	ldstuba	[%i6+%o5]0x80,%l0	! %l0 = 0000000000000000

p0_label_128:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = 7e000000ffffffff, %l5 = 0000000000000034
	ldxa	[%i1+%o5]0x80,%l5	! %l5 = 7e000000ffffffff
!	Mem[0000000030081400] = 00000000, %l4 = ffffffffffffffff
	lduha	[%i2+%g0]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000010081404] = 34ff5573, %l0 = 0000000000000000, %asi = 80
	lduwa	[%i2+0x004]%asi,%l0	! %l0 = 0000000034ff5573
!	Mem[0000000010141430] = ff61cf92, %l6 = 7e000000ffffffff
	ldsw	[%i5+0x030],%l6		! %l6 = ffffffffff61cf92
!	Mem[0000000030081408] = 0000006d, %l0 = 0000000034ff5573
	ldsha	[%i2+%o4]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000030001410] = 314aa6da70b80044, %f10 = 63ad6d44 2ca93559
	ldda	[%i0+%o5]0x81,%f10	! %f10 = 314aa6da 70b80044
!	Mem[0000000010001408] = d925f62d, %l3 = 000000000000faff
	lduha	[%i0+%o4]0x88,%l3	! %l3 = 000000000000f62d
!	Mem[0000000030001410] = 4400b870daa64a31, %l4 = 0000000000000000
	ldxa	[%i0+%o5]0x89,%l4	! %l4 = 4400b870daa64a31
!	Mem[0000000010181400] = ffffffff, %f25 = 2df625d9
	lda	[%i6+%g0]0x88,%f25	! %f25 = ffffffff
!	Mem[0000000010101408] = 9780ffffffffffff, %l5 = 7e000000ffffffff
	ldxa	[%i4+%o4]0x88,%l5	! %l5 = 9780ffffffffffff

p0_label_129:
!	Starting 10 instruction Store Burst
!	%f4  = 000000ff, Mem[0000000030081400] = 00000000
	sta	%f4 ,[%i2+%g0]0x81	! Mem[0000000030081400] = 000000ff
!	Mem[000000001004143f] = 58746496, %l4 = 4400b870daa64a31
	ldstub	[%i1+0x03f],%l4		! %l4 = 0000000000000096
!	Mem[0000000020800040] = ffff18e0, %l4 = 0000000000000096
	ldstub	[%o1+0x040],%l4		! %l4 = 00000000000000ff
!	%f20 = 364ba780 069b3e5d, Mem[00000000100c1408] = 00009c6e dba68d03
	stda	%f20,[%i3+%o4]0x88	! Mem[00000000100c1408] = 364ba780 069b3e5d
!	Mem[0000000030181408] = 00000000, %l2 = 000000000000007e
	ldstuba	[%i6+%o4]0x81,%l2	! %l2 = 0000000000000000
!	Mem[00000000300c1410] = ffffffff, %l5 = 00000000ffffffff
	swapa	[%i3+%o5]0x89,%l5	! %l5 = 00000000ffffffff
!	Mem[0000000010081400] = 699b8ca7, %l7 = 0000000000000000
	ldstuba	[%i2+%g0]0x80,%l7	! %l7 = 0000000000000069
!	Mem[0000000010141400] = 82bf0000, %l1 = 00000000ffffffff
	ldstuba	[%i5+%g0]0x80,%l1	! %l1 = 0000000000000082
!	%l4 = 00000000000000ff, Mem[0000000030101400] = ff0000ff
	stba	%l4,[%i4+%g0]0x81	! Mem[0000000030101400] = ff0000ff
!	Mem[0000000010181400] = ffffffff, %l1 = 0000000000000082
	ldstuba	[%i6+%g0]0x88,%l1	! %l1 = 00000000000000ff

p0_label_130:
!	Starting 10 instruction Load Burst
!	Mem[0000000020800040] = ffff18e0, %l6 = ffffffffff61cf92
	lduh	[%o1+0x040],%l6		! %l6 = 000000000000ffff
!	Code Fragment 4, seed = 509719
p0_fragment_8:
!	%l0 = 0000000000000000
	setx	0xe52074c758bf066e,%g7,%l0 ! %l0 = e52074c758bf066e
!	%l1 = 00000000000000ff
	setx	0xbbeb6fa62de38819,%g7,%l1 ! %l1 = bbeb6fa62de38819
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = e52074c758bf066e
	setx	0xf085fccf3541f5d4,%g7,%l0 ! %l0 = f085fccf3541f5d4
!	%l1 = bbeb6fa62de38819
	setx	0xff00fbc3d133d29f,%g7,%l1 ! %l1 = ff00fbc3d133d29f
p0_fragment_8_end:
!	Mem[0000000010081410] = 314aa6da, %l5 = 00000000ffffffff
	lduba	[%i2+%o5]0x88,%l5	! %l5 = 00000000000000da
!	Mem[0000000010001408] = 2df625d942d09ae7, %l0 = f085fccf3541f5d4
	ldxa	[%i0+%o4]0x80,%l0	! %l0 = 2df625d942d09ae7
!	Mem[0000000030081408] = 0000006d, %l0 = 2df625d942d09ae7
	ldsha	[%i2+%o4]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000030141400] = 000000ff80970000, %l3 = 000000000000f62d
	ldxa	[%i5+%g0]0x81,%l3	! %l3 = 000000ff80970000
!	Mem[0000000010181400] = 00006574ffffffff, %l1 = ff00fbc3d133d29f
	ldxa	[%i6+%g0]0x88,%l1	! %l1 = 00006574ffffffff
!	Mem[0000000010081408] = e7000000, %l1 = 00006574ffffffff
	lduha	[%i2+%o4]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010101414] = df5affff, %f7  = 699b8ca7
	ld	[%i4+0x014],%f7 	! %f7 = df5affff
!	%l3 = 000000ff80970000, imm = fffffffffffff08e, %l3 = 000000ff80970000
	addc	%l3,-0xf72,%l3		! %l3 = 000000ff8096f08e

p0_label_131:
!	Starting 10 instruction Store Burst
!	%f25 = ffffffff, Mem[0000000030141400] = ff000000
	sta	%f25,[%i5+%g0]0x89	! Mem[0000000030141400] = ffffffff
!	%l7 = 0000000000000069, Mem[0000000030081410] = fffa312c
	stha	%l7,[%i2+%o5]0x81	! Mem[0000000030081410] = 0069312c
!	%l0 = 0000000000000000, Mem[00000000300c1408] = 00000038ffff8097
	stxa	%l0,[%i3+%o4]0x89	! Mem[00000000300c1408] = 0000000000000000
!	%l6 = 000000000000ffff, Mem[0000000010001400] = ffffffff
	stwa	%l6,[%i0+%g0]0x88	! Mem[0000000010001400] = 0000ffff
!	%f10 = 314aa6da 70b80044, Mem[0000000010141438] = 00000000 0000faff
	std	%f10,[%i5+0x038]	! Mem[0000000010141438] = 314aa6da 70b80044
!	Mem[0000000010081400] = ff9b8ca7 34ff5573 000000e7 00000084
!	%f0  = 00000000 ff000000 e79ad042 60fe70cf
!	%f4  = 000000ff 0000bc35 9780ffff df5affff
!	%f8  = 7e000000 00000000 314aa6da 70b80044
!	%f12 = 97809b06 00000000 7e000000 58746496
	stda	%f0 ,[%i2+%g0]ASI_BLK_PL	! Block Store to 0000000010081400
!	Mem[0000000010001400] = 0000ffff, %l0 = 0000000000000000
	ldstuba	[%i0+%g0]0x88,%l0	! %l0 = 00000000000000ff
!	%l4 = 000000ff, %l5 = 000000da, Mem[0000000010081428] = 4400b870 daa64a31
	std	%l4,[%i2+0x028]		! Mem[0000000010081428] = 000000ff 000000da
!	Mem[0000000020800040] = ffff18e0, %l7 = 0000000000000069
	ldstub	[%o1+0x040],%l7		! %l7 = 00000000000000ff
!	%l1 = 0000000000000000, %l2 = 0000000000000000, %l1 = 0000000000000000
	andn	%l1,%l2,%l1		! %l1 = 0000000000000000

p0_label_132:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = 00000000 ff000000, %l0 = 000000ff, %l1 = 00000000
	ldda	[%i1+%g0]0x80,%l0	! %l0 = 0000000000000000 00000000ff000000
!	Mem[0000000030081400] = ff5ca106 ff000000, %l6 = 0000ffff, %l7 = 000000ff
	ldda	[%i2+%g0]0x89,%l6	! %l6 = 00000000ff000000 00000000ff5ca106
!	Mem[0000000010141416] = 0000bc35, %l0 = 0000000000000000, %asi = 80
	ldsha	[%i5+0x016]%asi,%l0	! %l0 = ffffffffffffbc35
!	Mem[00000000218000c0] = 16ab8bd0, %l6 = 00000000ff000000, %asi = 80
	lduha	[%o3+0x0c0]%asi,%l6	! %l6 = 00000000000016ab
!	Mem[0000000030081410] = 0069312c, %l5 = 00000000000000da
	ldsba	[%i2+%o5]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000030041400] = 8f5ca17e, %l6 = 00000000000016ab
	ldswa	[%i1+%g0]0x89,%l6	! %l6 = ffffffff8f5ca17e
!	Mem[0000000030001410] = daa64a31, %l7 = 00000000ff5ca106
	lduha	[%i0+%o5]0x89,%l7	! %l7 = 0000000000004a31
!	Mem[0000000010181410] = ff0000e7, %l4 = 00000000000000ff
	ldsba	[%i6+%o5]0x80,%l4	! %l4 = ffffffffffffffff
!	Mem[00000000211c0000] = ffff6b10, %l0 = ffffffffffffbc35, %asi = 80
	ldsha	[%o2+0x000]%asi,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010181410] = ff0000e7, %l6 = ffffffff8f5ca17e
	ldswa	[%i6+%o5]0x80,%l6	! %l6 = ffffffffff0000e7

p0_label_133:
!	Starting 10 instruction Store Burst
!	%l0 = ffffffff, %l1 = ff000000, Mem[00000000100c1438] = 4bad6d62 1dffac3a
	std	%l0,[%i3+0x038]		! Mem[00000000100c1438] = ffffffff ff000000
!	%f6  = 9780ffff df5affff, %l0 = ffffffffffffffff
!	Mem[0000000030181408] = ff00000080970000
	add	%i6,0x008,%g1
	stda	%f6,[%g1+%l0]ASI_PST16_SL ! Mem[0000000030181408] = ffff5adfffff8097
!	Mem[0000000030041410] = 000000ff, %l2 = 0000000000000000
	ldstuba	[%i1+%o5]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030001410] = 314aa6da, %l2 = 00000000000000ff
	ldswa	[%i0+%o5]0x81,%l2	! %l2 = 00000000314aa6da
!	%l6 = ffffffffff0000e7, Mem[0000000030041408] = 06a15c8f
	stwa	%l6,[%i1+%o4]0x89	! Mem[0000000030041408] = ff0000e7
!	%l1 = 00000000ff000000, Mem[0000000030141400] = ffffffff
	stba	%l1,[%i5+%g0]0x81	! Mem[0000000030141400] = 00ffffff
!	%l2 = 00000000314aa6da, Mem[0000000010081410] = 35bc0000
	stha	%l2,[%i2+%o5]0x80	! Mem[0000000010081410] = a6da0000
!	%l6 = ffffffffff0000e7, Mem[0000000010081424] = 0000007e, %asi = 80
	stwa	%l6,[%i2+0x024]%asi	! Mem[0000000010081424] = ff0000e7
!	Mem[00000000211c0001] = ffff6b10, %l7 = 0000000000004a31
	ldstuba	[%o2+0x001]%asi,%l7	! %l7 = 00000000000000ff
!	%l0 = ffffffffffffffff, immd = ffffffdd, %y  = 7355f89d
	smul	%l0,-0x023,%l4		! %l4 = 0000000000000023, %y = 00000000

p0_label_134:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = 00000000, %l3 = 000000ff8096f08e
	ldsba	[%i6+%o4]0x80,%l3	! %l3 = 0000000000000000
	membar	#Sync			! Added by membar checker (30)
!	Mem[0000000010081400] = 000000ff00000000, %l1 = 00000000ff000000
	ldx	[%i2+%g0],%l1		! %l1 = 000000ff00000000
!	Mem[0000000010041408] = e79ad04260fe70cf, %f28 = 069b8097 0b14976b
	ldd	[%i1+%o4],%f28		! %f28 = e79ad042 60fe70cf
!	%f25 = ffffffff, %f22 = 314aa6da, %f2  = e79ad042
	fadds	%f25,%f22,%f2 		! %f2  = ffffffff
!	Mem[0000000010181418] = 7d1db2336bffacc5, %f18 = 000000e7 00000084, %asi = 80
	ldda	[%i6+0x018]%asi,%f18	! %f18 = 7d1db233 6bffacc5
!	Mem[0000000010181428] = 4b57c49606a15c8f, %l6 = ffffffffff0000e7, %asi = 80
	ldxa	[%i6+0x028]%asi,%l6	! %l6 = 4b57c49606a15c8f
!	Mem[0000000010141410] = ffffffff, %f2  = ffffffff
	lda	[%i5+%o5]0x80,%f2 	! %f2 = ffffffff
!	Mem[00000000100c1436] = 38ff3e85, %l3 = 0000000000000000
	lduh	[%i3+0x036],%l3		! %l3 = 0000000000003e85
!	Mem[0000000010181408] = 00000000, %l7 = 00000000000000ff
	lduha	[%i6+%o4]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000030081400] = ff000000, %l6 = 4b57c49606a15c8f
	lduwa	[%i2+%g0]0x89,%l6	! %l6 = 00000000ff000000

p0_label_135:
!	Starting 10 instruction Store Burst
!	%l5 = 0000000000000000, Mem[0000000010041415] = ffffffff
	stb	%l5,[%i1+0x015]		! Mem[0000000010041414] = ff00ffff
!	%l4 = 0000000000000023, Mem[0000000010041400] = 00000000
	stwa	%l4,[%i1+%g0]0x80	! Mem[0000000010041400] = 00000023
!	Mem[0000000010041427] = 0000ff00, %l6 = 00000000ff000000
	ldstuba	[%i1+0x027]%asi,%l6	! %l6 = 0000000000000000
!	%l0 = ffffffffffffffff, Mem[00000000100c1408] = 069b3e5d
	stba	%l0,[%i3+%o4]0x88	! Mem[00000000100c1408] = 069b3eff
!	Mem[000000001000141a] = a7ff9b69, %l1 = 000000ff00000000
	ldstub	[%i0+0x01a],%l1		! %l1 = 000000000000009b
!	%l3 = 0000000000003e85, Mem[00000000201c0000] = 23ffe880
	sth	%l3,[%o0+%g0]		! Mem[00000000201c0000] = 3e85e880
!	Mem[0000000010081408] = cf70fe60, %l4 = 0000000000000023
	ldstuba	[%i2+%o4]0x80,%l4	! %l4 = 00000000000000cf
!	%l5 = 0000000000000000, %l7 = 0000000000000000, %y  = 00000000
	sdiv	%l5,%l7,%l3		! Div by zero, %l0 = 0000000000000027
!	%f20 = 364ba780, Mem[0000000010141410] = ffffffff
	sta	%f20,[%i5+%o5]0x88	! Mem[0000000010141410] = 364ba780
!	Mem[0000000020800041] = ffff18e0, %l2 = 00000000314aa6da
	ldstuba	[%o1+0x041]%asi,%l2	! %l2 = 00000000000000ff

p0_label_136:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = ff000000, %l2 = 00000000000000ff
	lduha	[%i2+%g0]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000030181410] = ff000000, %l5 = 0000000000000000
	lduwa	[%i6+%o5]0x81,%l5	! %l5 = 00000000ff000000
!	Mem[0000000010041410] = 0000007e, %l3 = 0000000000003e85
	lduba	[%i1+%o5]0x88,%l3	! %l3 = 000000000000007e
!	Mem[0000000010081404] = 00000000, %l0 = 0000000000000027, %asi = 80
	lduwa	[%i2+0x004]%asi,%l0	! %l0 = 0000000000000000
!	Mem[00000000100c1408] = ff3e9b06, %l5 = 00000000ff000000
	ldswa	[%i3+%o4]0x80,%l5	! %l5 = ffffffffff3e9b06
!	Mem[0000000010181400] = ffffffff, %l7 = 0000000000000000
	lduwa	[%i6+%g0]0x88,%l7	! %l7 = 00000000ffffffff
!	Mem[00000000218001c0] = 2a1d6c90, %l3 = 000000000000007e, %asi = 80
	lduba	[%o3+0x1c0]%asi,%l3	! %l3 = 000000000000002a
!	Mem[0000000010081408] = ff70fe6042d09ae7, %l7 = 00000000ffffffff
	ldxa	[%i2+%o4]0x80,%l7	! %l7 = ff70fe6042d09ae7
!	Mem[0000000010181402] = ffffffff, %l7 = ff70fe6042d09ae7
	lduh	[%i6+0x002],%l7		! %l7 = 000000000000ffff
!	Mem[0000000010081410] = a6da0000, %l3 = 000000000000002a
	lduba	[%i2+%o5]0x80,%l3	! %l3 = 00000000000000a6

p0_label_137:
!	Starting 10 instruction Store Burst
!	Mem[0000000010081438] = 96647458, %l2 = 0000000000000000
	swap	[%i2+0x038],%l2		! %l2 = 0000000096647458
!	%l1 = 000000000000009b, Mem[0000000030181400] = 96640000
	stha	%l1,[%i6+%g0]0x89	! Mem[0000000030181400] = 9664009b
!	Mem[0000000010081418] = ffff5adf, %l7 = 0000ffff, %l4 = 000000cf
	add	%i2,0x18,%g1
	casa	[%g1]0x80,%l7,%l4	! %l4 = 00000000ffff5adf
!	%l3 = 00000000000000a6, Mem[00000000100c1400] = 7355ffff
	stwa	%l3,[%i3+%g0]0x88	! Mem[00000000100c1400] = 000000a6
!	%l5 = ffffffffff3e9b06, Mem[0000000010081412] = a6da0000, %asi = 80
	stha	%l5,[%i2+0x012]%asi	! Mem[0000000010081410] = a6da9b06
!	%f28 = e79ad042 60fe70cf, Mem[0000000030141400] = 00ffffff 80970000
	stda	%f28,[%i5+%g0]0x81	! Mem[0000000030141400] = e79ad042 60fe70cf
!	Mem[000000001000140c] = 42d09ae7, %l4 = ffff5adf, %l3 = 000000a6
	add	%i0,0x0c,%g1
	casa	[%g1]0x80,%l4,%l3	! %l3 = 0000000042d09ae7
!	Mem[0000000030001408] = 68a8f31d, %l5 = ffffffffff3e9b06
	ldstuba	[%i0+%o4]0x89,%l5	! %l5 = 000000000000001d
!	Mem[00000000100c1400] = a6000000 80970000 ff3e9b06 80a74b36
!	%f16 = 699b8ca7 34ff5573 7d1db233 6bffacc5
!	%f20 = 364ba780 069b3e5d 314aa6da 70b80044
!	%f24 = 1df3a868 ffffffff 00000057 1b1d3f9f
!	%f28 = e79ad042 60fe70cf 0a80ccb2 3ff082bb
	stda	%f16,[%i3+%g0]ASI_BLK_P	! Block Store to 00000000100c1400
!	Mem[0000000030101410] = ff5b9ae7, %l3 = 0000000042d09ae7
	swapa	[%i4+%o5]0x89,%l3	! %l3 = 00000000ff5b9ae7

p0_label_138:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = ffffffff, %l5 = 000000000000001d
	ldswa	[%i4+%o4]0x88,%l5	! %l5 = ffffffffffffffff
!	Mem[00000000211c0001] = ffff6b10, %l3 = 00000000ff5b9ae7
	ldsb	[%o2+0x001],%l3		! %l3 = ffffffffffffffff
!	Mem[0000000010101400] = ffffffff, %l5 = ffffffffffffffff
	lduwa	[%i4+%g0]0x88,%l5	! %l5 = 00000000ffffffff
!	Mem[0000000020800041] = ffff18e0, %l0 = 0000000000000000
	ldub	[%o1+0x041],%l0		! %l0 = 00000000000000ff
	membar	#Sync			! Added by membar checker (31)
!	Mem[00000000100c1400] = a78c9b69, %l0 = 00000000000000ff
	lduha	[%i3+%g0]0x88,%l0	! %l0 = 0000000000009b69
!	Mem[00000000201c0000] = 3e85e880, %l1 = 000000000000009b, %asi = 80
	ldsha	[%o0+0x000]%asi,%l1	! %l1 = 0000000000003e85
!	Mem[0000000010181400] = ffffffff, %f2  = ffffffff
	lda	[%i6+%g0]0x80,%f2 	! %f2 = ffffffff
!	Mem[0000000010081410] = a6da9b06 ff000000, %l4 = ffff5adf, %l5 = ffffffff
	ldd	[%i2+%o5],%l4		! %l4 = 00000000a6da9b06 00000000ff000000
!	Mem[0000000010101412] = ffe20000, %l6 = 0000000000000000, %asi = 80
	ldsha	[%i4+0x012]%asi,%l6	! %l6 = 0000000000000000
!	Mem[0000000030181408] = ffff5adf, %l1 = 0000000000003e85
	ldsha	[%i6+%o4]0x81,%l1	! %l1 = ffffffffffffffff

p0_label_139:
!	Starting 10 instruction Store Burst
!	%l4 = 00000000a6da9b06, Mem[0000000030001410] = 314aa6da70b80044
	stxa	%l4,[%i0+%o5]0x81	! Mem[0000000030001410] = 00000000a6da9b06
!	%f28 = e79ad042 60fe70cf, %l4 = 00000000a6da9b06
!	Mem[0000000010081418] = ffff5adfffff8097
	add	%i2,0x018,%g1
	stda	%f28,[%g1+%l4]ASI_PST32_P ! Mem[0000000010081418] = e79ad042ffff8097
!	%l5 = 00000000ff000000, Mem[00000000100c1408] = 33b21d7d
	stwa	%l5,[%i3+%o4]0x88	! Mem[00000000100c1408] = ff000000
!	%l4 = 00000000a6da9b06, Mem[0000000010181410] = ff0000e70000005e
	stxa	%l4,[%i6+%o5]0x80	! Mem[0000000010181410] = 00000000a6da9b06
!	Mem[0000000030041400] = 8f5ca17e, %l1 = 00000000ffffffff
	swapa	[%i1+%g0]0x89,%l1	! %l1 = 000000008f5ca17e
!	%f24 = 1df3a868 ffffffff, Mem[0000000030081408] = 6d000000 ffffffff
	stda	%f24,[%i2+%o4]0x89	! Mem[0000000030081408] = 1df3a868 ffffffff
!	%l5 = 00000000ff000000, Mem[00000000211c0000] = ffff6b10
	sth	%l5,[%o2+%g0]		! Mem[00000000211c0000] = 00006b10
!	%f16 = 699b8ca7 34ff5573, %l1 = 000000008f5ca17e
!	Mem[0000000030101410] = e79ad04200ffffff
	add	%i4,0x010,%g1
	stda	%f16,[%g1+%l1]ASI_PST8_S ! Mem[0000000030101410] = e79b8ca734ff55ff
!	Mem[0000000030181410] = ff000000, %l0 = 0000000000009b69
	ldstuba	[%i6+%o5]0x81,%l0	! %l0 = 00000000000000ff
!	%f14 = 7e000000, Mem[0000000030081400] = ff000000
	sta	%f14,[%i2+%g0]0x89	! Mem[0000000030081400] = 7e000000

p0_label_140:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041418] = 9780ffff, %f1  = ff000000
	ld	[%i1+0x018],%f1 	! %f1 = 9780ffff
!	Mem[0000000010081408] = ff70fe6042d09ae7, %f18 = 7d1db233 6bffacc5
	ldda	[%i2+%o4]0x80,%f18	! %f18 = ff70fe60 42d09ae7
!	Mem[00000000100c1410] = 80a74b36, %l2 = 0000000096647458
	ldsba	[%i3+%o5]0x88,%l2	! %l2 = 0000000000000036
!	Mem[0000000030141410] = 70cf0a43, %l4 = 00000000a6da9b06
	lduba	[%i5+%o5]0x81,%l4	! %l4 = 0000000000000070
!	Mem[0000000030181400] = dba68d039664009b, %f2  = ffffffff 60fe70cf
	ldda	[%i6+%g0]0x89,%f2 	! %f2  = dba68d03 9664009b
!	Mem[00000000211c0000] = 00006b10, %l1 = 000000008f5ca17e
	lduh	[%o2+%g0],%l1		! %l1 = 0000000000000000
!	Mem[0000000010081410] = a6da9b06ff000000, %l3 = ffffffffffffffff
	ldxa	[%i2+%o5]0x80,%l3	! %l3 = a6da9b06ff000000
!	Mem[00000000211c0001] = 00006b10, %l4 = 0000000000000070
	ldsb	[%o2+0x001],%l4		! %l4 = 0000000000000000
!	Mem[0000000010141400] = ffbf0000, %l4 = 0000000000000000
	lduha	[%i5+%g0]0x80,%l4	! %l4 = 000000000000ffbf
!	Mem[0000000010101408] = ffffffff, %l3 = a6da9b06ff000000
	lduba	[%i4+%o4]0x88,%l3	! %l3 = 00000000000000ff

p0_label_141:
!	Starting 10 instruction Store Burst
!	%f2  = dba68d03 9664009b, Mem[0000000030081400] = 0000007e 06a15cff
	stda	%f2 ,[%i2+%g0]0x81	! Mem[0000000030081400] = dba68d03 9664009b
!	Mem[0000000010181400] = ffffffff 74650000 00000000 0000008f
!	%f0  = 00000000 9780ffff dba68d03 9664009b
!	%f4  = 000000ff 0000bc35 9780ffff df5affff
!	%f8  = 7e000000 00000000 314aa6da 70b80044
!	%f12 = 97809b06 00000000 7e000000 58746496
	stda	%f0 ,[%i6+%g0]ASI_BLK_AIUPL	! Block Store to 0000000010181400
!	%l5 = 00000000ff000000, Mem[0000000010081412] = a6da9b06
	sth	%l5,[%i2+0x012]		! Mem[0000000010081410] = a6da0000
!	%l0 = 000000ff, %l1 = 00000000, Mem[0000000010081408] = ff70fe60 42d09ae7
	stda	%l0,[%i2+%o4]0x80	! Mem[0000000010081408] = 000000ff 00000000
!	Mem[00000000100c1400] = a78c9b69, %l7 = 000000000000ffff
	ldstuba	[%i3+%g0]0x88,%l7	! %l7 = 0000000000000069
!	%f1  = 9780ffff, Mem[0000000030141400] = 42d09ae7
	sta	%f1 ,[%i5+%g0]0x89	! Mem[0000000030141400] = 9780ffff
!	%l6 = 0000000000000000, Mem[00000000201c0000] = 3e85e880
	sth	%l6,[%o0+%g0]		! Mem[00000000201c0000] = 0000e880
!	Mem[0000000030001400] = 00000000, %l4 = 000000000000ffbf
	ldstuba	[%i0+%g0]0x81,%l4	! %l4 = 0000000000000000
!	%l2 = 0000000000000036, Mem[0000000010081410] = 0000daa6
	stba	%l2,[%i2+%o5]0x88	! Mem[0000000010081410] = 0000da36
!	%l5 = 00000000ff000000, Mem[0000000030101400] = ff0000ff
	stwa	%l5,[%i4+%g0]0x89	! Mem[0000000030101400] = ff000000

p0_label_142:
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = ffffffff, %f30 = 0a80ccb2
	lda	[%i3+%o5]0x81,%f30	! %f30 = ffffffff
!	Mem[0000000010001400] = ffff0000, %l2 = 0000000000000036
	lduba	[%i0+%g0]0x80,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010141408] = 7e000000, %l2 = 00000000000000ff
	lduha	[%i5+%o4]0x80,%l2	! %l2 = 0000000000007e00
!	Mem[0000000010001400] = ffff0000, %l2 = 0000000000007e00
	lduwa	[%i0+%g0]0x80,%l2	! %l2 = 00000000ffff0000
!	Mem[0000000010141402] = ffbf0000, %l3 = 00000000000000ff
	ldsb	[%i5+0x002],%l3		! %l3 = 0000000000000000
!	Mem[00000000100c1408] = 000000ff6bffacc5, %f30 = ffffffff 3ff082bb
	ldda	[%i3+%o4]0x80,%f30	! %f30 = 000000ff 6bffacc5
!	Mem[0000000010101404] = 00000000, %f18 = ff70fe60
	ld	[%i4+0x004],%f18	! %f18 = 00000000
!	Mem[0000000010001424] = 0000007e, %f19 = 42d09ae7
	lda	[%i0+0x024]%asi,%f19	! %f19 = 0000007e
	membar	#Sync			! Added by membar checker (32)
!	Mem[0000000010181408] = 9b006496038da6db, %f30 = 000000ff 6bffacc5
	ldda	[%i6+%o4]0x80,%f30	! %f30 = 9b006496 038da6db
!	%f11 = 70b80044, %f10 = 314aa6da, %f16 = 699b8ca7 34ff5573
	fsmuld	%f11,%f10,%f16		! %f16 = 44523504 508a3d00

p0_label_143:
!	Starting 10 instruction Store Burst
!	Mem[0000000030101410] = a78c9be7, %l3 = 0000000000000000
	ldstuba	[%i4+%o5]0x89,%l3	! %l3 = 00000000000000e7
!	%f6  = 9780ffff, Mem[0000000010081418] = e79ad042
	st	%f6 ,[%i2+0x018]	! Mem[0000000010081418] = 9780ffff
!	Mem[0000000010141408] = 0000007e, %l7 = 0000000000000069
	swapa	[%i5+%o4]0x88,%l7	! %l7 = 000000000000007e
!	%l4 = 0000000000000000, Mem[0000000030181400] = 9b006496
	stwa	%l4,[%i6+%g0]0x81	! Mem[0000000030181400] = 00000000
!	Mem[0000000010081400] = ff000000, %l4 = 0000000000000000
	ldstuba	[%i2+%g0]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000030141400] = ffff8097, %l3 = 00000000000000e7
	lduba	[%i5+%g0]0x81,%l3	! %l3 = 00000000000000ff
!	Mem[00000000211c0001] = 00006b10, %l6 = 0000000000000000
	ldstuba	[%o2+0x001]%asi,%l6	! %l6 = 0000000000000000
!	Mem[0000000030001408] = fff3a868, %l4 = 0000000000000000
	ldstuba	[%i0+%o4]0x81,%l4	! %l4 = 00000000000000ff
!	%l2 = 00000000ffff0000, Mem[0000000010041410] = 7e000000
	stba	%l2,[%i1+%o5]0x80	! Mem[0000000010041410] = 00000000
!	%l6 = 0000000000000000, Mem[0000000030181400] = 00000000
	stwa	%l6,[%i6+%g0]0x81	! Mem[0000000030181400] = 00000000

p0_label_144:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = e79ad04260fe70cf, %l6 = 0000000000000000, %asi = 80
	ldxa	[%i1+0x008]%asi,%l6	! %l6 = e79ad04260fe70cf
!	Mem[00000000100c1410] = 5d3e9b0680a74b36, %l3 = 00000000000000ff
	ldxa	[%i3+%o5]0x88,%l3	! %l3 = 5d3e9b0680a74b36
!	Mem[0000000030041410] = ff0000008f5ca106, %l0 = 00000000000000ff
	ldxa	[%i1+%o5]0x81,%l0	! %l0 = ff0000008f5ca106
!	Mem[0000000030001410] = 069bdaa600000000, %l7 = 000000000000007e
	ldxa	[%i0+%o5]0x89,%l7	! %l7 = 069bdaa600000000
!	Mem[0000000030081400] = 9b006496038da6db, %f28 = e79ad042 60fe70cf
	ldda	[%i2+%g0]0x89,%f28	! %f28 = 9b006496 038da6db
!	Mem[0000000010101408] = ffffffff, %f18 = 00000000
	lda	[%i4+%o4]0x88,%f18	! %f18 = ffffffff
!	Code Fragment 4, seed = 71500
p0_fragment_9:
!	%l0 = ff0000008f5ca106
	setx	0x576218848ba3c9c6,%g7,%l0 ! %l0 = 576218848ba3c9c6
!	%l1 = 0000000000000000
	setx	0xf61475025d71cbf1,%g7,%l1 ! %l1 = f61475025d71cbf1
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 576218848ba3c9c6
	setx	0x0ad05ad61fabd22c,%g7,%l0 ! %l0 = 0ad05ad61fabd22c
!	%l1 = f61475025d71cbf1
	setx	0x9d1ab53659efdf77,%g7,%l1 ! %l1 = 9d1ab53659efdf77
p0_fragment_9_end:
!	Mem[0000000010181400] = ffff8097, %l0 = 0ad05ad61fabd22c
	lduwa	[%i6+%g0]0x80,%l0	! %l0 = 00000000ffff8097
!	Mem[00000000300c1400] = 35bc0000, %f21 = 069b3e5d
	lda	[%i3+%g0]0x81,%f21	! %f21 = 35bc0000
!	Mem[00000000201c0000] = 0000e880, %l6 = e79ad04260fe70cf, %asi = 80
	lduha	[%o0+0x000]%asi,%l6	! %l6 = 0000000000000000

p0_label_145:
!	Starting 10 instruction Store Burst
!	%l3 = 5d3e9b0680a74b36, Mem[0000000010181428] = 4400b870
	stw	%l3,[%i6+0x028]		! Mem[0000000010181428] = 80a74b36
!	%l0 = 00000000ffff8097, Mem[0000000030101408] = ffffffff
	stha	%l0,[%i4+%o4]0x81	! Mem[0000000030101408] = 8097ffff
!	Mem[0000000010141400] = 0000bfff, %l6 = 0000000000000000
	lduha	[%i5+%g0]0x88,%l6	! %l6 = 000000000000bfff
!	%f11 = 70b80044, Mem[0000000010041410] = 00000000
	sta	%f11,[%i1+%o5]0x80	! Mem[0000000010041410] = 70b80044
!	%f16 = 44523504, Mem[00000000100c1408] = 000000ff
	sta	%f16,[%i3+0x008]%asi	! Mem[00000000100c1408] = 44523504
!	%f0  = 00000000, Mem[0000000030081408] = ffffffff
	sta	%f0 ,[%i2+%o4]0x81	! Mem[0000000030081408] = 00000000
!	%f22 = 314aa6da 70b80044, Mem[0000000030041408] = e70000ff 00000000
	stda	%f22,[%i1+%o4]0x81	! Mem[0000000030041408] = 314aa6da 70b80044
!	Mem[0000000030001410] = 00000000, %l7 = 069bdaa600000000
	ldstuba	[%i0+%o5]0x89,%l7	! %l7 = 0000000000000000
!	%f24 = 1df3a868, Mem[0000000010041408] = e79ad042
	sta	%f24,[%i1+%o4]0x80	! Mem[0000000010041408] = 1df3a868
!	%l7 = 0000000000000000, Mem[00000000100c1416] = 069b3e5d
	sth	%l7,[%i3+0x016]		! Mem[00000000100c1414] = 069b0000

p0_label_146:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = ffffffff, %l1 = 9d1ab53659efdf77
	ldsba	[%i4+%g0]0x88,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000021800180] = 65743a60, %l5 = 00000000ff000000, %asi = 80
	ldsha	[%o3+0x180]%asi,%l5	! %l5 = 0000000000006574
!	Mem[0000000030081408] = 00000000, %f27 = 1b1d3f9f
	lda	[%i2+%o4]0x89,%f27	! %f27 = 00000000
!	Mem[0000000030101410] = a78c9bff, %l4 = 00000000000000ff
	ldswa	[%i4+%o5]0x89,%l4	! %l4 = ffffffffa78c9bff
!	Mem[0000000030181410] = ff00000000000000, %f4  = 000000ff 0000bc35
	ldda	[%i6+%o5]0x81,%f4 	! %f4  = ff000000 00000000
!	Mem[00000000300c1400] = 0000bc35, %l5 = 0000000000006574
	ldsba	[%i3+%g0]0x89,%l5	! %l5 = 0000000000000035
!	Mem[00000000300c1410] = ffffffff, %l2 = 00000000ffff0000
	ldsha	[%i3+%o5]0x89,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000010001410] = 35bc0000 ff000000, %l0 = ffff8097, %l1 = ffffffff, %asi = 80
	ldda	[%i0+0x010]%asi,%l0	! %l0 = 0000000035bc0000 00000000ff000000
!	Mem[0000000010001400] = ffff000000000000, %l7 = 0000000000000000
	ldxa	[%i0+%g0]0x80,%l7	! %l7 = ffff000000000000
!	Mem[0000000010101408] = ffffffff, %l0 = 0000000035bc0000
	lduba	[%i4+%o4]0x80,%l0	! %l0 = 00000000000000ff

p0_label_147:
!	Starting 10 instruction Store Burst
!	Mem[0000000010041408] = 1df3a868, %l3 = 5d3e9b0680a74b36
	ldstuba	[%i1+%o4]0x80,%l3	! %l3 = 000000000000001d
!	Mem[0000000020800041] = ffff18e0, %l2 = ffffffffffffffff
	ldstub	[%o1+0x041],%l2		! %l2 = 00000000000000ff
!	%l7 = ffff000000000000, Mem[0000000010001439] = 96647458
	stb	%l7,[%i0+0x039]		! Mem[0000000010001438] = 96007458
!	%l4 = ffffffffa78c9bff, Mem[00000000300c1410] = ffffffff
	stha	%l4,[%i3+%o5]0x89	! Mem[00000000300c1410] = ffff9bff
!	Mem[0000000030181410] = 000000ff, %l6 = 000000000000bfff
	ldstuba	[%i6+%o5]0x89,%l6	! %l6 = 00000000000000ff
!	%l7 = ffff000000000000, Mem[0000000030101408] = 8097ffffffff8097
	stxa	%l7,[%i4+%o4]0x81	! Mem[0000000030101408] = ffff000000000000
!	%l5 = 0000000000000035, %l4 = ffffffffa78c9bff, %y  = 00000000
	udiv	%l5,%l4,%l3		! %l3 = 0000000000000000
	mov	%l0,%y			! %y = 000000ff
!	%l3 = 0000000000000000, Mem[00000000300c1400] = 0000bc35
	stwa	%l3,[%i3+%g0]0x89	! Mem[00000000300c1400] = 00000000
!	%l0 = 00000000000000ff, Mem[0000000030081410] = 0069312c
	stwa	%l0,[%i2+%o5]0x81	! Mem[0000000030081410] = 000000ff
!	Mem[0000000030181408] = ffff5adf, %l1 = 00000000ff000000
	swapa	[%i6+%o4]0x81,%l1	! %l1 = 00000000ffff5adf

p0_label_148:
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = 314aa6da70b80044, %l5 = 0000000000000035
	ldxa	[%i1+%o4]0x81,%l5	! %l5 = 314aa6da70b80044
!	Mem[00000000100c1400] = ff9b8ca7, %l4 = ffffffffa78c9bff
	lduba	[%i3+%g0]0x80,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030001400] = ff000000 069b8097, %l4 = 000000ff, %l5 = 70b80044
	ldda	[%i0+%g0]0x81,%l4	! %l4 = 00000000ff000000 00000000069b8097
!	Mem[000000001014143a] = 314aa6da, %l5 = 00000000069b8097
	ldsh	[%i5+0x03a],%l5		! %l5 = ffffffffffffa6da
!	Mem[0000000010141414] = 0000bc35, %l1 = 00000000ffff5adf
	lduw	[%i5+0x014],%l1		! %l1 = 000000000000bc35
!	Mem[0000000010141430] = ff61cf92, %l3 = 0000000000000000
	lduh	[%i5+0x030],%l3		! %l3 = 000000000000ff61
!	Mem[0000000010041400] = 23000000, %l2 = 00000000000000ff
	ldsba	[%i1+%g0]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000030001410] = 000000ff, %l5 = ffffffffffffa6da
	ldsba	[%i0+%o5]0x89,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000030101410] = ff9b8ca7, %f20 = 364ba780
	lda	[%i4+%o5]0x81,%f20	! %f20 = ff9b8ca7
!	Mem[0000000020800040] = ffff18e0, %l5 = ffffffffffffffff, %asi = 80
	lduba	[%o1+0x040]%asi,%l5	! %l5 = 00000000000000ff

p0_label_149:
!	Starting 10 instruction Store Burst
!	%l3 = 000000000000ff61, %l5 = 00000000000000ff, %l5 = 00000000000000ff
	xor	%l3,%l5,%l5		! %l5 = 000000000000ff9e
!	%l5 = 000000000000ff9e, immd = 00000ea6, %y  = 000000ff
	umul	%l5,0xea6,%l1		! %l1 = 000000000ea06474, %y = 00000000
!	%l0 = 00000000000000ff, Mem[000000001014141c] = cf08230e, %asi = 80
	stha	%l0,[%i5+0x01c]%asi	! Mem[000000001014141c] = 00ff230e
!	Mem[0000000010101423] = 49339780, %l4 = 00000000ff000000
	ldstuba	[%i4+0x023]%asi,%l4	! %l4 = 0000000000000080
!	Mem[0000000030081410] = ff000000, %l0 = 00000000000000ff
	swapa	[%i2+%o5]0x89,%l0	! %l0 = 00000000ff000000
!	%f17 = 508a3d00, Mem[00000000300c1408] = 00000000
	sta	%f17,[%i3+%o4]0x81	! Mem[00000000300c1408] = 508a3d00
!	%l1 = 000000000ea06474, Mem[00000000211c0000] = 00ff6b10
	stb	%l1,[%o2+%g0]		! Mem[00000000211c0000] = 74ff6b10
!	%f26 = 00000057 00000000, Mem[0000000010181400] = ffff8097 00000000, %asi = 80
	stda	%f26,[%i6+0x000]%asi	! Mem[0000000010181400] = 00000057 00000000
!	%f26 = 00000057 00000000, Mem[0000000010081410] = 0000da36 000000ff
	stda	%f26,[%i2+%o5]0x88	! Mem[0000000010081410] = 00000057 00000000
!	Mem[000000001018142c] = daa64a31, %l1 = 000000000ea06474, %asi = 80
	swapa	[%i6+0x02c]%asi,%l1	! %l1 = 00000000daa64a31

p0_label_150:
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = fff3a8682df625d9, %f8  = 7e000000 00000000
	ldda	[%i0+%o4]0x81,%f8 	! %f8  = fff3a868 2df625d9
!	%f1  = 9780ffff, %f14 = 7e000000
	fcmps	%fcc2,%f1 ,%f14		! %fcc2 = 1
!	Mem[0000000021800081] = 5baa49a0, %l7 = ffff000000000000, %asi = 80
	lduba	[%o3+0x081]%asi,%l7	! %l7 = 00000000000000aa
!	Mem[00000000201c0000] = 0000e880, %l2 = 0000000000000000, %asi = 80
	ldsha	[%o0+0x000]%asi,%l2	! %l2 = 0000000000000000
!	Mem[0000000030001408] = 68a8f3ff, %l4 = 0000000000000080
	lduba	[%i0+%o4]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010041400] = 23000000, %l3 = 000000000000ff61
	ldswa	[%i1+%g0]0x88,%l3	! %l3 = 0000000023000000
!	Mem[0000000020800040] = ffff18e0, %l3 = 0000000023000000, %asi = 80
	lduba	[%o1+0x040]%asi,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010041425] = 0000ffff, %l3 = 00000000000000ff
	ldub	[%i1+0x025],%l3		! %l3 = 0000000000000000
!	Mem[0000000010141400] = ffbf0000, %l2 = 0000000000000000
	lduha	[%i5+%g0]0x80,%l2	! %l2 = 000000000000ffbf
!	Mem[0000000010041438] = 7e000000, %l7 = 00000000000000aa
	lduh	[%i1+0x038],%l7		! %l7 = 0000000000007e00

p0_label_151:
!	Starting 10 instruction Store Burst
!	%l5 = 000000000000ff9e, imm = 0000000000000feb, %l3 = 0000000000000000
	or	%l5,0xfeb,%l3		! %l3 = 000000000000ffff
!	%l4 = 00000000000000ff, Mem[00000000300c1400] = 00000000
	stha	%l4,[%i3+%g0]0x81	! Mem[00000000300c1400] = 00ff0000
!	Mem[0000000030081410] = 000000ff, %l6 = 00000000000000ff
	ldstuba	[%i2+%o5]0x89,%l6	! %l6 = 00000000000000ff
!	%l0 = 00000000ff000000, %l6 = 00000000000000ff, %l6 = 00000000000000ff
	subc	%l0,%l6,%l6		! %l6 = 00000000feffff01
!	%f8  = fff3a868, Mem[0000000030101408] = ffff0000
	sta	%f8 ,[%i4+%o4]0x81	! Mem[0000000030101408] = fff3a868
!	%f7  = df5affff, Mem[0000000010001410] = 0000bc35
	sta	%f7 ,[%i0+%o5]0x88	! Mem[0000000010001410] = df5affff
!	%f20 = ff9b8ca7 35bc0000, %l6 = 00000000feffff01
!	Mem[00000000100c1430] = e79ad04260fe70cf
	add	%i3,0x030,%g1
	stda	%f20,[%g1+%l6]ASI_PST32_PL ! Mem[00000000100c1430] = 0000bc3560fe70cf
!	%l7 = 0000000000007e00, Mem[0000000030081408] = 00000000
	stha	%l7,[%i2+%o4]0x89	! Mem[0000000030081408] = 00007e00
!	%f18 = ffffffff, Mem[0000000010101414] = df5affff
	sta	%f18,[%i4+0x014]%asi	! Mem[0000000010101414] = ffffffff
!	Mem[0000000010181414] = ff000000, %l2 = 0000ffbf, %l5 = 0000ff9e
	add	%i6,0x14,%g1
	casa	[%g1]0x80,%l2,%l5	! %l5 = 00000000ff000000

p0_label_152:
!	Starting 10 instruction Load Burst
!	Mem[0000000030101410] = a78c9bff, %l3 = 000000000000ffff
	lduwa	[%i4+%o5]0x89,%l3	! %l3 = 00000000a78c9bff
!	Mem[0000000030041400] = ffffffff, %l7 = 0000000000007e00
	ldsba	[%i1+%g0]0x89,%l7	! %l7 = ffffffffffffffff
!	Mem[00000000211c0000] = 74ff6b10, %l5 = 00000000ff000000, %asi = 80
	lduha	[%o2+0x000]%asi,%l5	! %l5 = 00000000000074ff
!	Mem[0000000010041400] = 000000ff23000000, %f26 = 00000057 00000000
	ldda	[%i1+%g0]0x88,%f26	! %f26 = 000000ff 23000000
!	%f16 = 44523504, %f31 = 038da6db, %f14 = 7e000000
	fdivs	%f16,%f31,%f14		! %f14 = 7f800000
!	Mem[0000000010101408] = ffffffff ffff8097, %l0 = ff000000, %l1 = daa64a31
	ldda	[%i4+%o4]0x80,%l0	! %l0 = 00000000ffffffff 00000000ffff8097
!	Mem[0000000010081408] = ff000000, %l1 = 00000000ffff8097
	lduwa	[%i2+%o4]0x88,%l1	! %l1 = 00000000ff000000
!	Mem[00000000211c0000] = 74ff6b10, %l5 = 00000000000074ff
	ldsh	[%o2+%g0],%l5		! %l5 = 00000000000074ff
!	Mem[00000000100c1400] = ff9b8ca7 34ff5573, %l2 = 0000ffbf, %l3 = a78c9bff
	ldda	[%i3+%g0]0x80,%l2	! %l2 = 00000000ff9b8ca7 0000000034ff5573
!	Mem[0000000010001428] = 0000008c ffffffff, %l0 = ffffffff, %l1 = ff000000, %asi = 80
	ldda	[%i0+0x028]%asi,%l0	! %l0 = 000000000000008c 00000000ffffffff

p0_label_153:
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1410] = 80a74b36, %l3 = 0000000034ff5573
	ldstuba	[%i3+%o5]0x88,%l3	! %l3 = 0000000000000036
!	%l7 = ffffffffffffffff, imm = fffffffffffff954, %l7 = ffffffffffffffff
	add	%l7,-0x6ac,%l7		! %l7 = fffffffffffff953
!	Mem[0000000010081408] = 000000ff, %l2 = 00000000ff9b8ca7
	ldstuba	[%i2+%o4]0x80,%l2	! %l2 = 0000000000000000
!	%l6 = feffff01, %l7 = fffff953, Mem[0000000010141410] = 80a74b36 0000bc35, %asi = 80
	stda	%l6,[%i5+0x010]%asi	! Mem[0000000010141410] = feffff01 fffff953
!	%l1 = 00000000ffffffff, %l0 = 000000000000008c, %l0 = 000000000000008c
	andn	%l1,%l0,%l0		! %l0 = 00000000ffffff73
!	Mem[0000000010141400] = ffbf0000 ff5ca106 69000000 00000000
!	%f16 = 44523504 508a3d00 ffffffff 0000007e
!	%f20 = ff9b8ca7 35bc0000 314aa6da 70b80044
!	%f24 = 1df3a868 ffffffff 000000ff 23000000
!	%f28 = 9b006496 038da6db 9b006496 038da6db
	stda	%f16,[%i5+%g0]ASI_BLK_P	! Block Store to 0000000010141400
!	%f14 = 7f800000 58746496, Mem[0000000010001400] = ffff0000 00000000
	stda	%f14,[%i0+%g0]0x80	! Mem[0000000010001400] = 7f800000 58746496
!	%l6 = 00000000feffff01, immd = ffffff49, %y  = 00000000
	sdiv	%l6,-0x0b7,%l0		! %l0 = fffffffffe9b475a
	mov	%l0,%y			! %y = fe9b475a
!	%l0 = fffffffffe9b475a, Mem[00000000100c1408] = 04355244
	stba	%l0,[%i3+%o4]0x88	! Mem[00000000100c1408] = 0435525a
!	%f28 = 9b006496 038da6db, %l0 = fffffffffe9b475a
!	Mem[0000000030041428] = ffd3f3cc000007df
	add	%i1,0x028,%g1
	stda	%f28,[%g1+%l0]ASI_PST32_SL ! Mem[0000000030041428] = ffd3f3cc9664009b

p0_label_154:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = fff3a868, %l2 = 0000000000000000
	lduha	[%i1+%o4]0x80,%l2	! %l2 = 000000000000fff3
!	Mem[00000000300c1408] = 003d8a50, %l6 = 00000000feffff01
	ldsba	[%i3+%o4]0x89,%l6	! %l6 = 0000000000000050
!	Mem[0000000010101400] = ffffffff, %l5 = 00000000000074ff
	lduha	[%i4+%g0]0x88,%l5	! %l5 = 000000000000ffff
!	Mem[00000000300c1410] = ff9bffff, %l5 = 000000000000ffff
	ldswa	[%i3+%o5]0x81,%l5	! %l5 = ffffffffff9bffff
!	Mem[0000000010001408] = 2df625d9, %l1 = 00000000ffffffff
	lduwa	[%i0+%o4]0x80,%l1	! %l1 = 000000002df625d9
!	Mem[0000000030001400] = ff000000, %l6 = 0000000000000050
	lduba	[%i0+%g0]0x81,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030101408] = 00000000 68a8f3ff, %l6 = 000000ff, %l7 = fffff953
	ldda	[%i4+%o4]0x89,%l6	! %l6 = 0000000068a8f3ff 0000000000000000
	membar	#Sync			! Added by membar checker (33)
!	Mem[0000000010141434] = 038da6db, %l3 = 0000000000000036, %asi = 80
	ldsba	[%i5+0x034]%asi,%l3	! %l3 = 0000000000000003
!	Mem[0000000010001400] = 7f800000, %l0 = fffffffffe9b475a
	ldsba	[%i0+%g0]0x80,%l0	! %l0 = 000000000000007f
!	Mem[0000000010141410] = ff9b8ca7 35bc0000, %l2 = 0000fff3, %l3 = 00000003
	ldd	[%i5+%o5],%l2		! %l2 = 00000000ff9b8ca7 0000000035bc0000

p0_label_155:
!	Starting 10 instruction Store Burst
!	%l4 = 000000ff, %l5 = ff9bffff, Mem[0000000010181410] = 35bc0000 ff000000, %asi = 80
	stda	%l4,[%i6+0x010]%asi	! Mem[0000000010181410] = 000000ff ff9bffff
!	Mem[00000000100c1410] = ff4ba780, %l6 = 0000000068a8f3ff
	ldstuba	[%i3+%o5]0x80,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030141408] = 7e000000, %l0 = 000000000000007f
	ldstuba	[%i5+%o4]0x89,%l0	! %l0 = 0000000000000000
!	%l6 = 00000000000000ff, Mem[0000000010101410] = 0000e2ff
	stha	%l6,[%i4+%o5]0x88	! Mem[0000000010101410] = 000000ff
!	%l2 = 00000000ff9b8ca7, Mem[0000000030041400] = ffffffff
	stwa	%l2,[%i1+%g0]0x89	! Mem[0000000030041400] = ff9b8ca7
!	Mem[0000000030181400] = 00000000, %l3 = 0000000035bc0000
	swapa	[%i6+%g0]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000010081400] = ff0000ff, %l1 = 000000002df625d9
	swapa	[%i2+%g0]0x80,%l1	! %l1 = 00000000ff0000ff
!	%l6 = 00000000000000ff, Mem[0000000030081410] = ff000000
	stwa	%l6,[%i2+%o5]0x81	! Mem[0000000030081410] = 000000ff
!	%l6 = 000000ff, %l7 = 00000000, Mem[0000000030181400] = 35bc0000 038da6db
	stda	%l6,[%i6+%g0]0x81	! Mem[0000000030181400] = 000000ff 00000000
!	Code Fragment 3, seed = 155549
p0_fragment_10:
!	%l0 = 0000000000000000
	setx	0x38ec8bd904c7a83e,%g7,%l0 ! %l0 = 38ec8bd904c7a83e
!	%l1 = 00000000ff0000ff
	setx	0xc9167c7f418ac0e9,%g7,%l1 ! %l1 = c9167c7f418ac0e9
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 38ec8bd904c7a83e
	setx	0x1c6736a2735015a4,%g7,%l0 ! %l0 = 1c6736a2735015a4
!	%l1 = c9167c7f418ac0e9
	setx	0xe8fffc966440296f,%g7,%l1 ! %l1 = e8fffc966440296f
p0_fragment_10_end:

p0_label_156:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = 7f800000, %l4 = 00000000000000ff
	lduha	[%i0+%g0]0x80,%l4	! %l4 = 0000000000007f80
!	Mem[000000001014141c] = 70b80044, %l3 = 0000000000000000
	ldsb	[%i5+0x01c],%l3		! %l3 = 0000000000000070
!	Mem[0000000030041408] = daa64a31, %l3 = 0000000000000070
	lduba	[%i1+%o4]0x89,%l3	! %l3 = 0000000000000031
!	Mem[0000000030181408] = 000000ff, %l5 = ffffffffff9bffff
	lduwa	[%i6+%o4]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010001410] = 000000ff df5affff, %l0 = 735015a4, %l1 = 6440296f
	ldda	[%i0+%o5]0x88,%l0	! %l0 = 00000000df5affff 00000000000000ff
!	Mem[0000000030101410] = a78c9bff, %l5 = 00000000000000ff
	ldswa	[%i4+%o5]0x89,%l5	! %l5 = ffffffffa78c9bff
!	Mem[0000000030081410] = 000000ff, %l5 = ffffffffa78c9bff
	lduba	[%i2+%o5]0x81,%l5	! %l5 = 0000000000000000
!	Mem[00000000300c1410] = ffff9bff, %l7 = 0000000000000000
	ldsba	[%i3+%o5]0x89,%l7	! %l7 = ffffffffffffffff
!	Mem[00000000300c1408] = 00000000003d8a50, %f2  = dba68d03 9664009b
	ldda	[%i3+%o4]0x89,%f2 	! %f2  = 00000000 003d8a50
!	Mem[00000000300c1410] = ffff9bff, %l0 = 00000000df5affff
	ldsba	[%i3+%o5]0x89,%l0	! %l0 = ffffffffffffffff

p0_label_157:
!	Starting 10 instruction Store Burst
!	Mem[0000000030081400] = dba68d03, %l4 = 0000000000007f80
	ldstuba	[%i2+%g0]0x81,%l4	! %l4 = 00000000000000db
!	%l0 = ffffffffffffffff, Mem[0000000030001408] = fff3a868
	stha	%l0,[%i0+%o4]0x81	! Mem[0000000030001408] = ffffa868
!	Mem[0000000010181420] = 00000000, %l6 = 00000000000000ff, %asi = 80
	swapa	[%i6+0x020]%asi,%l6	! %l6 = 0000000000000000
!	%l2 = 00000000ff9b8ca7, Mem[0000000010101410] = ff000000ffffffff, %asi = 80
	stxa	%l2,[%i4+0x010]%asi	! Mem[0000000010101410] = 00000000ff9b8ca7
!	%l4 = 000000db, %l5 = 00000000, Mem[0000000010001428] = 0000008c ffffffff, %asi = 80
	stda	%l4,[%i0+0x028]%asi	! Mem[0000000010001428] = 000000db 00000000
!	%f5  = 00000000, %f21 = 35bc0000, %f8  = fff3a868
	fdivs	%f5 ,%f21,%f8 		! %f8  = 00000000
!	Mem[0000000010101408] = ffffffff, %l2 = 00000000ff9b8ca7
	swapa	[%i4+%o4]0x80,%l2	! %l2 = 00000000ffffffff
!	Mem[0000000030081400] = 038da6ff, %l0 = ffffffffffffffff
	ldstuba	[%i2+%g0]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010001404] = 58746496, %l1 = 00000000000000ff, %asi = 80
	swapa	[%i0+0x004]%asi,%l1	! %l1 = 0000000058746496
!	Mem[0000000010081431] = 00000000, %l0 = 00000000000000ff
	ldstuba	[%i2+0x031]%asi,%l0	! %l0 = 0000000000000000

p0_label_158:
!	Starting 10 instruction Load Burst
!	Mem[000000001018143c] = 0000007e, %l1 = 0000000058746496
	ldsw	[%i6+0x03c],%l1		! %l1 = 000000000000007e
!	Mem[00000000201c0001] = 0000e880, %l4 = 00000000000000db, %asi = 80
	ldsba	[%o0+0x001]%asi,%l4	! %l4 = 0000000000000000
!	Code Fragment 4, seed = 908050
p0_fragment_11:
!	%l0 = 0000000000000000
	setx	0x01b98047d16a5196,%g7,%l0 ! %l0 = 01b98047d16a5196
!	%l1 = 000000000000007e
	setx	0xf2bd072b20ea0ac1,%g7,%l1 ! %l1 = f2bd072b20ea0ac1
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 01b98047d16a5196
	setx	0x001e16831db417fc,%g7,%l0 ! %l0 = 001e16831db417fc
!	%l1 = f2bd072b20ea0ac1
	setx	0xf066e3b1d3557c47,%g7,%l1 ! %l1 = f066e3b1d3557c47
p0_fragment_11_end:
!	Mem[0000000030081400] = ffa68d03, %f28 = 9b006496
	lda	[%i2+%g0]0x81,%f28	! %f28 = ffa68d03
!	Mem[00000000300c1410] = ffff9bff, %l0 = 001e16831db417fc
	lduba	[%i3+%o5]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030041400] = a78c9bff, %l2 = 00000000ffffffff
	lduwa	[%i1+%g0]0x81,%l2	! %l2 = 00000000a78c9bff
!	Mem[0000000010101410] = 00000000, %l3 = 0000000000000031
	ldswa	[%i4+%o5]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000010181410] = 000000ff, %l0 = 00000000000000ff
	lduba	[%i6+%o5]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000030181410] = ff000000 00000000, %l4 = 00000000, %l5 = 00000000
	ldda	[%i6+%o5]0x81,%l4	! %l4 = 00000000ff000000 0000000000000000
!	Mem[0000000030041408] = daa64a31, %l6 = 0000000000000000
	lduwa	[%i1+%o4]0x89,%l6	! %l6 = 00000000daa64a31

p0_label_159:
!	Starting 10 instruction Store Burst
!	%l4 = ff000000, %l5 = 00000000, Mem[0000000010041420] = 7e000000 0000ffff
	std	%l4,[%i1+0x020]		! Mem[0000000010041420] = ff000000 00000000
!	%l3 = 0000000000000000, Mem[0000000030141410] = 70cf0a43
	stha	%l3,[%i5+%o5]0x81	! Mem[0000000030141410] = 00000a43
!	Mem[0000000030101400] = 000000ff, %l7 = ffffffffffffffff
	ldstuba	[%i4+%g0]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000010141410] = ff9b8ca7, %l0 = 0000000000000000
	ldstuba	[%i5+%o5]0x80,%l0	! %l0 = 00000000000000ff
!	%f28 = ffa68d03, %f21 = 35bc0000
	fcmpes	%fcc3,%f28,%f21		! %fcc3 = 3
!	%f6  = 9780ffff df5affff, Mem[0000000010081410] = 00000000 00000057
	stda	%f6 ,[%i2+%o5]0x88	! Mem[0000000010081410] = 9780ffff df5affff
!	Mem[0000000010181400] = 57000000, %l0 = 00000000000000ff
	swapa	[%i6+%g0]0x88,%l0	! %l0 = 0000000057000000
!	%f24 = 1df3a868, Mem[0000000030001408] = ffffa868
	sta	%f24,[%i0+%o4]0x81	! Mem[0000000030001408] = 1df3a868
!	Mem[0000000030001410] = ff000000, %l0 = 0000000057000000
	swapa	[%i0+%o5]0x81,%l0	! %l0 = 00000000ff000000
!	%l0 = 00000000ff000000, Mem[0000000010081424] = ff0000e7, %asi = 80
	stwa	%l0,[%i2+0x024]%asi	! Mem[0000000010081424] = ff000000

p0_label_160:
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0001] = 74ff6b10, %l4 = 00000000ff000000, %asi = 80
	ldsba	[%o2+0x001]%asi,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000030001408] = 68a8f31d, %f22 = 314aa6da
	lda	[%i0+%o4]0x89,%f22	! %f22 = 68a8f31d
!	Mem[00000000100c1418] = 314aa6da, %l2 = 00000000a78c9bff
	ldsw	[%i3+0x018],%l2		! %l2 = 00000000314aa6da
!	Mem[0000000010081408] = ff0000ff, %f3  = 003d8a50
	lda	[%i2+%o4]0x80,%f3 	! %f3 = ff0000ff
!	%l6 = 00000000daa64a31, immd = fffffbbb, %y  = fe9b475a
	udiv	%l6,-0x445,%l6		! %l6 = 00000000fe9b4b99
	mov	%l0,%y			! %y = ff000000
	membar	#Sync			! Added by membar checker (34)
!	Mem[0000000030141400] = ffff8097 60fe70cf ff00007e 38ff3e85
!	Mem[0000000030141410] = 00000a43 00000000 5d8f015a cf08230e
!	Mem[0000000030141420] = 58fa12e6 fffff759 97809b06 000000ff
!	Mem[0000000030141430] = e761cf92 5b0fe295 47b7546d ae96bcff
	ldda	[%i5+%g0]ASI_BLK_S,%f16	! Block Load from 0000000030141400
!	%f3  = ff0000ff, %f20 = 00000a43, %f4  = ff000000
	fadds	%f3 ,%f20,%f4 		! tt=0x22, %l0 = 00000000ff000022
!	Mem[0000000030001410] = 57000000, %l4 = ffffffffffffffff
	ldsha	[%i0+%o5]0x81,%l4	! %l4 = 0000000000005700
!	Mem[0000000030181410] = ff000000, %l3 = 0000000000000000
	ldsba	[%i6+%o5]0x81,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010001408] = 2df625d9, %f5  = 00000000
	lda	[%i0+%o4]0x80,%f5 	! %f5 = 2df625d9

p0_label_161:
!	Starting 10 instruction Store Burst
!	Mem[0000000010101425] = e9ff31ff, %l3 = ffffffffffffffff
	ldstub	[%i4+0x025],%l3		! %l3 = 00000000000000ff
!	Mem[0000000010141421] = 1df3a868, %l1 = f066e3b1d3557c47
	ldstub	[%i5+0x021],%l1		! %l1 = 00000000000000f3
!	%l5 = 0000000000000000, Mem[0000000010041420] = ff000000
	stw	%l5,[%i1+0x020]		! Mem[0000000010041420] = 00000000
!	Mem[0000000030101408] = fff3a868, %l2 = 00000000314aa6da
	ldstuba	[%i4+%o4]0x81,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010181400] = ff000000 00000000 9b006496 038da6db
!	%f0  = 00000000 9780ffff 00000000 ff0000ff
!	%f4  = ff000000 2df625d9 9780ffff df5affff
!	%f8  = 00000000 2df625d9 314aa6da 70b80044
!	%f12 = 97809b06 00000000 7f800000 58746496
	stda	%f0 ,[%i6+%g0]ASI_COMMIT_P	! Block Store to 0000000010181400
!	%f4  = ff000000 2df625d9, Mem[0000000010101408] = a78c9bff 9780ffff
	stda	%f4 ,[%i4+%o4]0x88	! Mem[0000000010101408] = ff000000 2df625d9
!	%l5 = 0000000000000000, Mem[0000000010141421] = 1dffa868
	stb	%l5,[%i5+0x021]		! Mem[0000000010141420] = 1d00a868
!	%l0 = 00000000ff000022, Mem[0000000010041408] = 68a8f3ff
	stha	%l0,[%i1+%o4]0x88	! Mem[0000000010041408] = 68a80022
!	%l2 = 000000ff, %l3 = 000000ff, Mem[0000000030001400] = ff000000 069b8097
	stda	%l2,[%i0+%g0]0x81	! Mem[0000000030001400] = 000000ff 000000ff
!	%l6 = 00000000fe9b4b99, Mem[0000000010141410] = ff9b8ca735bc0000, %asi = 80
	stxa	%l6,[%i5+0x010]%asi	! Mem[0000000010141410] = 00000000fe9b4b99

p0_label_162:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = df5affff, %l2 = 00000000000000ff
	lduha	[%i0+%o5]0x88,%l2	! %l2 = 000000000000ffff
!	Mem[00000000300c1408] = 003d8a50, %l3 = 00000000000000ff
	ldswa	[%i3+%o4]0x89,%l3	! %l3 = 00000000003d8a50
!	%l4 = 0000000000005700, immd = 000008fb, %y  = ff000000
	umul	%l4,0x8fb,%l2		! %l2 = 00000000030d4d00, %y = 00000000
!	Mem[0000000030181410] = ff000000, %l2 = 00000000030d4d00
	lduwa	[%i6+%o5]0x81,%l2	! %l2 = 00000000ff000000
	membar	#Sync			! Added by membar checker (35)
!	Mem[0000000010181410] = 000000ff, %l5 = 0000000000000000
	ldswa	[%i6+%o5]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010001400] = ff000000 0000807f, %l2 = ff000000, %l3 = 003d8a50
	ldda	[%i0+%g0]0x88,%l2	! %l2 = 000000000000807f 00000000ff000000
!	Mem[0000000010141400] = 44523504 508a3d00 ffffffff 0000007e
!	Mem[0000000010141410] = 00000000 fe9b4b99 314aa6da 70b80044
!	Mem[0000000010141420] = 1d00a868 ffffffff 000000ff 23000000
!	Mem[0000000010141430] = 9b006496 038da6db 9b006496 038da6db
	ldda	[%i5+%g0]ASI_BLK_P,%f0 	! Block Load from 0000000010141400
!	Mem[0000000030041410] = 06a15c8f000000ff, %f16 = ffff8097 60fe70cf
	ldda	[%i1+%o5]0x89,%f16	! %f16 = 06a15c8f 000000ff
!	Mem[0000000030141400] = cf70fe609780ffff, %f18 = ff00007e 38ff3e85
	ldda	[%i5+%g0]0x89,%f18	! %f18 = cf70fe60 9780ffff
!	Mem[00000000218000c1] = 16ab8bd0, %l4 = 0000000000005700
	ldub	[%o3+0x0c1],%l4		! %l4 = 00000000000000ab

p0_label_163:
!	Starting 10 instruction Store Burst
!	%l5 = 00000000000000ff, Mem[00000000211c0000] = 74ff6b10
	sth	%l5,[%o2+%g0]		! Mem[00000000211c0000] = 00ff6b10
!	%f5  = fe9b4b99, Mem[0000000010101400] = ffffffff
	sta	%f5 ,[%i4+%g0]0x88	! Mem[0000000010101400] = fe9b4b99
!	%l3 = 00000000ff000000, Mem[0000000010181420] = 000000002df625d9, %asi = 80
	stxa	%l3,[%i6+0x020]%asi	! Mem[0000000010181420] = 00000000ff000000
!	%l5 = 00000000000000ff, Mem[0000000010081424] = ff000000
	stb	%l5,[%i2+0x024]		! Mem[0000000010081424] = ff000000
!	Mem[00000000211c0000] = 00ff6b10, %l7 = 0000000000000000, %asi = 80
	lduha	[%o2+0x000]%asi,%l7	! %l7 = 00000000000000ff
!	%l6 = 00000000fe9b4b99, Mem[0000000030081408] = 007e000068a8f31d
	stxa	%l6,[%i2+%o4]0x81	! Mem[0000000030081408] = 00000000fe9b4b99
!	Mem[00000000211c0001] = 00ff6b10, %l1 = 00000000000000f3
	ldstub	[%o2+0x001],%l1		! %l1 = 00000000000000ff
!	Mem[00000000201c0001] = 0000e880, %l5 = 00000000000000ff
	ldstub	[%o0+0x001],%l5		! %l5 = 0000000000000000
!	%l5 = 0000000000000000, Mem[0000000030141410] = 430a0000
	stba	%l5,[%i5+%o5]0x89	! Mem[0000000030141410] = 430a0000
!	%l1 = 00000000000000ff, Mem[00000000300c1408] = 003d8a50
	stha	%l1,[%i3+%o4]0x89	! Mem[00000000300c1408] = 003d00ff

p0_label_164:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = cf70fe60 68a80022, %l4 = 000000ab, %l5 = 00000000
	ldda	[%i1+%o4]0x88,%l4	! %l4 = 0000000068a80022 00000000cf70fe60
!	Mem[00000000100c1400] = a78c9bff, %l3 = 00000000ff000000
	lduha	[%i3+%g0]0x88,%l3	! %l3 = 0000000000009bff
!	Mem[0000000010141408] = ffffffff0000007e, %l0 = 00000000ff000022
	ldxa	[%i5+%o4]0x80,%l0	! %l0 = ffffffff0000007e
!	Mem[0000000030101400] = ff0000ff, %l1 = 00000000000000ff
	ldsba	[%i4+%g0]0x89,%l1	! %l1 = ffffffffffffffff
!	Mem[00000000100c142d] = 1b1d3f9f, %l6 = 00000000fe9b4b99, %asi = 80
	lduba	[%i3+0x02d]%asi,%l6	! %l6 = 000000000000001d
!	Mem[0000000030041410] = ff000000, %l0 = ffffffff0000007e
	lduba	[%i1+%o5]0x81,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030181400] = ff000000, %l0 = 00000000000000ff
	ldsba	[%i6+%g0]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000030181410] = ff000000, %f22 = 5d8f015a
	lda	[%i6+%o5]0x81,%f22	! %f22 = ff000000
!	Mem[0000000030181410] = 000000ff, %f18 = cf70fe60
	lda	[%i6+%o5]0x89,%f18	! %f18 = 000000ff
!	Mem[0000000020800000] = 3aff42b0, %l4 = 0000000068a80022, %asi = 80
	lduha	[%o1+0x000]%asi,%l4	! %l4 = 0000000000003aff

p0_label_165:
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000003aff, Mem[0000000030001408] = 1df3a868
	stwa	%l4,[%i0+%o4]0x81	! Mem[0000000030001408] = 00003aff
!	%f24 = 58fa12e6 fffff759, %l5 = 00000000cf70fe60
!	Mem[0000000030101428] = ffeb225e2e2979ff
	add	%i4,0x028,%g1
	stda	%f24,[%g1+%l5]ASI_PST32_S ! Mem[0000000030101428] = ffeb225e2e2979ff
!	Mem[0000000010181408] = 00000000, %l3 = 0000000000009bff
	ldstuba	[%i6+%o4]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000010041420] = 00000000, %l6 = 000000000000001d, %asi = 80
	swapa	[%i1+0x020]%asi,%l6	! %l6 = 0000000000000000
!	%l5 = 00000000cf70fe60, Mem[0000000030001410] = 00000057
	stha	%l5,[%i0+%o5]0x89	! Mem[0000000030001410] = 0000fe60
!	%l4 = 0000000000003aff, Mem[0000000030081408] = 00000000
	stwa	%l4,[%i2+%o4]0x89	! Mem[0000000030081408] = 00003aff
!	Mem[0000000010181410] = 000000ff, %l7 = 00000000000000ff
	swapa	[%i6+%o5]0x88,%l7	! %l7 = 00000000000000ff
!	%l4 = 0000000000003aff, Mem[0000000030001408] = 00003aff
	stba	%l4,[%i0+%o4]0x81	! Mem[0000000030001408] = ff003aff
!	%l6 = 0000000000000000, Mem[0000000030001408] = ff003aff2df625d9
	stxa	%l6,[%i0+%o4]0x81	! Mem[0000000030001408] = 0000000000000000
!	Mem[0000000010001408] = d925f62d, %l7 = 00000000000000ff
	swapa	[%i0+%o4]0x88,%l7	! %l7 = 00000000d925f62d

p0_label_166:
!	Starting 10 instruction Load Burst
!	%f1  = 508a3d00, %f7  = 70b80044, %f27 = 000000ff
	fmuls	%f1 ,%f7 ,%f27		! %f27 = 7f800000
!	Mem[0000000030181408] = ff000000, %l0 = 0000000000000000
	lduha	[%i6+%o4]0x81,%l0	! %l0 = 000000000000ff00
!	Mem[0000000030081410] = ff000000, %l3 = 0000000000000000
	ldsba	[%i2+%o5]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000030041408] = 314aa6da, %l5 = 00000000cf70fe60
	lduha	[%i1+%o4]0x81,%l5	! %l5 = 000000000000314a
!	Mem[0000000010001413] = ffff5adf, %l6 = 0000000000000000
	ldsb	[%i0+0x013],%l6		! %l6 = ffffffffffffffdf
!	Mem[0000000010181408] = ff000000, %l7 = 00000000d925f62d
	ldsha	[%i6+%o4]0x80,%l7	! %l7 = ffffffffffffff00
!	Mem[0000000030101408] = 0000000068a8f3ff, %f22 = ff000000 cf08230e
	ldda	[%i4+%o4]0x89,%f22	! %f22 = 00000000 68a8f3ff
!	Mem[0000000010001418] = a7ffff69, %l5 = 000000000000314a, %asi = 80
	ldswa	[%i0+0x018]%asi,%l5	! %l5 = ffffffffa7ffff69
!	Mem[0000000010101426] = e9ff31ff, %l2 = 000000000000807f, %asi = 80
	lduha	[%i4+0x026]%asi,%l2	! %l2 = 00000000000031ff
!	Mem[0000000030041400] = a78c9bffa3eca856, %l3 = 0000000000000000
	ldxa	[%i1+%g0]0x81,%l3	! %l3 = a78c9bffa3eca856

p0_label_167:
!	Starting 10 instruction Store Burst
!	%l1 = ffffffffffffffff, %l2 = 00000000000031ff, %l0 = 000000000000ff00
	sdivx	%l1,%l2,%l0		! %l0 = 0000000000000000
!	Mem[0000000010001410] = ffff5adf, %l4 = 0000000000003aff
	ldstuba	[%i0+%o5]0x80,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010081400] = 2df625d9, %l1 = 00000000ffffffff
	swapa	[%i2+%g0]0x80,%l1	! %l1 = 000000002df625d9
!	Mem[0000000030101400] = ff0000ff, %l3 = a78c9bffa3eca856
	ldstuba	[%i4+%g0]0x81,%l3	! %l3 = 00000000000000ff
!	Mem[00000000201c0000] = 00ffe880, %l7 = ffffffffffffff00
	ldstuba	[%o0+0x000]%asi,%l7	! %l7 = 0000000000000000
!	%l3 = 00000000000000ff, Mem[00000000300c1400] = 7e0000ff0000ff00
	stxa	%l3,[%i3+%g0]0x89	! Mem[00000000300c1400] = 00000000000000ff
!	Mem[00000000201c0000] = ffffe880, %l2 = 00000000000031ff
	ldstuba	[%o0+0x000]%asi,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030181400] = ff000000, %l6 = 00000000ffffffdf
	swapa	[%i6+%g0]0x89,%l6	! %l6 = 00000000ff000000
!	Mem[0000000010081400] = ffffffff, %l6 = 00000000ff000000
	swapa	[%i2+%g0]0x80,%l6	! %l6 = 00000000ffffffff
!	%l6 = 00000000ffffffff, Mem[0000000030181400] = dfffffff00000000
	stxa	%l6,[%i6+%g0]0x81	! Mem[0000000030181400] = 00000000ffffffff

p0_label_168:
!	Starting 10 instruction Load Burst
!	%l4 = 00000000000000ff, %l6 = 00000000ffffffff, %l1 = 000000002df625d9
	sub	%l4,%l6,%l1		! %l1 = ffffffff00000100
!	Mem[0000000010041410] = 4400b870, %l3 = 00000000000000ff
	ldsha	[%i1+%o5]0x88,%l3	! %l3 = ffffffffffffb870
!	Mem[0000000030141408] = 7e0000ff, %f14 = 9b006496
	lda	[%i5+%o4]0x89,%f14	! %f14 = 7e0000ff
!	Mem[0000000030141410] = 00000a4300000000, %f16 = 06a15c8f 000000ff
	ldda	[%i5+%o5]0x81,%f16	! %f16 = 00000a43 00000000
!	Mem[0000000010081408] = ff0000ff, %l4 = 00000000000000ff
	lduha	[%i2+%o4]0x80,%l4	! %l4 = 000000000000ff00
!	Mem[0000000010041408] = 68a80022, %l4 = 000000000000ff00
	lduba	[%i1+%o4]0x88,%l4	! %l4 = 0000000000000022
!	Mem[000000001008142b] = 000000ff, %l7 = 0000000000000000, %asi = 80
	ldsba	[%i2+0x02b]%asi,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000020800000] = 3aff42b0, %l1 = ffffffff00000100
	ldsh	[%o1+%g0],%l1		! %l1 = 0000000000003aff
!	Mem[0000000030141408] = 7e0000ff, %l6 = 00000000ffffffff
	ldsba	[%i5+%o4]0x89,%l6	! %l6 = ffffffffffffffff
!	Mem[00000000100c142c] = 1b1d3f9f, %f12 = 9b006496
	ld	[%i3+0x02c],%f12	! %f12 = 1b1d3f9f

p0_label_169:
!	Starting 10 instruction Store Burst
!	%l5 = ffffffffa7ffff69, Mem[0000000030141400] = 9780ffff
	stwa	%l5,[%i5+%g0]0x89	! Mem[0000000030141400] = a7ffff69
!	%l6 = ffffffff, %l7 = ffffffff, Mem[0000000010041418] = 9780ffff 699b8ca7, %asi = 80
	stda	%l6,[%i1+0x018]%asi	! Mem[0000000010041418] = ffffffff ffffffff
!	Mem[0000000010081410] = ffff5adf, %l5 = a7ffff69, %l3 = ffffb870
	add	%i2,0x10,%g1
	casa	[%g1]0x80,%l5,%l3	! %l3 = 00000000ffff5adf
!	%l3 = 00000000ffff5adf, Mem[000000001004142b] = 63ad6d44, %asi = 80
	stba	%l3,[%i1+0x02b]%asi	! Mem[0000000010041428] = 63ad6ddf
!	Mem[0000000010001424] = 0000007e, %l3 = 00000000ffff5adf
	swap	[%i0+0x024],%l3		! %l3 = 000000000000007e
!	Mem[0000000010081400] = ff000000, %l4 = 0000000000000022
	ldstuba	[%i2+%g0]0x80,%l4	! %l4 = 00000000000000ff
!	%f22 = 00000000 68a8f3ff, %l6 = ffffffffffffffff
!	Mem[0000000010181410] = ff0000002df625d9
	add	%i6,0x010,%g1
	stda	%f22,[%g1+%l6]ASI_PST32_PL ! Mem[0000000010181410] = fff3a86800000000
!	%l0 = 0000000000000000, Mem[0000000020800000] = 3aff42b0
	stb	%l0,[%o1+%g0]		! Mem[0000000020800000] = 00ff42b0
!	Mem[0000000030081408] = ff3a0000, %l6 = ffffffffffffffff
	ldstuba	[%i2+%o4]0x81,%l6	! %l6 = 00000000000000ff
!	%l1 = 0000000000003aff, Mem[00000000100c142c] = 1b1d3f9f
	stb	%l1,[%i3+0x02c]		! Mem[00000000100c142c] = ff1d3f9f

p0_label_170:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = ff0000ff, %l5 = ffffffffa7ffff69
	ldswa	[%i2+%o4]0x88,%l5	! %l5 = ffffffffff0000ff
!	Mem[0000000010101408] = d925f62d, %l2 = 00000000000000ff
	ldsha	[%i4+%o4]0x80,%l2	! %l2 = ffffffffffffd925
!	Mem[00000000201c0001] = ffffe880, %l2 = ffffffffffffd925, %asi = 80
	lduba	[%o0+0x001]%asi,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030141408] = ff00007e, %f20 = 00000a43
	lda	[%i5+%o4]0x81,%f20	! %f20 = ff00007e
!	Mem[0000000030081400] = ffa68d03, %l4 = 00000000000000ff
	ldswa	[%i2+%g0]0x81,%l4	! %l4 = ffffffffffa68d03
!	Mem[0000000030101400] = ff0000ff, %l4 = ffffffffffa68d03
	lduha	[%i4+%g0]0x81,%l4	! %l4 = 000000000000ff00
!	Mem[00000000100c1410] = ff4ba780069b0000, %l2 = 00000000000000ff, %asi = 80
	ldxa	[%i3+0x010]%asi,%l2	! %l2 = ff4ba780069b0000
!	Mem[0000000010141410] = 00000000fe9b4b99, %f10 = 000000ff 23000000
	ldda	[%i5+%o5]0x80,%f10	! %f10 = 00000000 fe9b4b99
!	Mem[0000000010141408] = 7e000000ffffffff, %l2 = ff4ba780069b0000
	ldxa	[%i5+%o4]0x88,%l2	! %l2 = 7e000000ffffffff
!	Mem[0000000010181404] = 9780ffff, %l6 = 00000000000000ff, %asi = 80
	ldsha	[%i6+0x004]%asi,%l6	! %l6 = ffffffffffff9780

p0_label_171:
!	Starting 10 instruction Store Burst
!	Mem[0000000010081430] = 00ff0000, %l1 = 0000000000003aff, %asi = 80
	lduwa	[%i2+0x030]%asi,%l1	! %l1 = 0000000000ff0000
!	Mem[0000000010001408] = 000000ff, %l0 = 0000000000000000
	swapa	[%i0+%o4]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030081410] = 000000ff, %l3 = 000000000000007e
	swapa	[%i2+%o5]0x81,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010001410] = ffff5adf, %l7 = ffffffffffffffff
	ldstuba	[%i0+%o5]0x80,%l7	! %l7 = 00000000000000ff
!	%l4 = 000000000000ff00, Mem[0000000010101410] = 00000000ff9b8ca7
	stxa	%l4,[%i4+%o5]0x80	! Mem[0000000010101410] = 000000000000ff00
!	%l3 = 00000000000000ff, Mem[0000000010041408] = 68a80022
	stwa	%l3,[%i1+%o4]0x88	! Mem[0000000010041408] = 000000ff
!	Mem[00000000300c1400] = ff000000, %l4 = 000000000000ff00
	ldstuba	[%i3+%g0]0x81,%l4	! %l4 = 00000000000000ff
!	%f26 = 97809b06, Mem[0000000030181408] = ff000000
	sta	%f26,[%i6+%o4]0x81	! Mem[0000000030181408] = 97809b06
!	Mem[0000000010141410] = 00000000, %l7 = 00000000000000ff
	swapa	[%i5+%o5]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000030081408] = 00003aff, %l7 = 0000000000000000
	ldstuba	[%i2+%o4]0x89,%l7	! %l7 = 00000000000000ff

p0_label_172:
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = ff9b8ca7, %f6  = 314aa6da
	lda	[%i1+%g0]0x89,%f6 	! %f6 = ff9b8ca7
!	Mem[00000000201c0001] = ffffe880, %l5 = ffffffffff0000ff, %asi = 80
	ldsba	[%o0+0x001]%asi,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000010101410] = 000000000000ff00, %l2 = 7e000000ffffffff
	ldx	[%i4+%o5],%l2		! %l2 = 000000000000ff00
!	Mem[0000000030041408] = 314aa6da, %l2 = 000000000000ff00
	ldsha	[%i1+%o4]0x81,%l2	! %l2 = 000000000000314a
!	Mem[0000000030001410] = 60fe0000a6da9b06, %f16 = 00000a43 00000000
	ldda	[%i0+%o5]0x81,%f16	! %f16 = 60fe0000 a6da9b06
!	Mem[0000000010081430] = 00ff0000069b8097, %l0 = 00000000000000ff, %asi = 80
	ldxa	[%i2+0x030]%asi,%l0	! %l0 = 00ff0000069b8097
!	%f23 = 68a8f3ff, %f22 = 00000000
	fcmpes	%fcc2,%f23,%f22		! %fcc2 = 2
!	Mem[00000000100c1410] = ff4ba780, %l0 = 00ff0000069b8097
	ldsha	[%i3+%o5]0x80,%l0	! %l0 = ffffffffffffff4b
!	Mem[0000000010181408] = ff000000ff0000ff, %l2 = 000000000000314a
	ldxa	[%i6+%o4]0x80,%l2	! %l2 = ff000000ff0000ff
!	Mem[00000000300c1408] = ff003d0000000000, %f6  = ff9b8ca7 70b80044
	ldda	[%i3+%o4]0x81,%f6 	! %f6  = ff003d00 00000000

p0_label_173:
!	Starting 10 instruction Store Burst
!	%l5 = ffffffffffffffff, Mem[0000000030101410] = ff9b8ca7
	stha	%l5,[%i4+%o5]0x81	! Mem[0000000030101410] = ffff8ca7
!	%l4 = 00000000000000ff, Mem[0000000010081408] = ff0000ff
	stha	%l4,[%i2+%o4]0x80	! Mem[0000000010081408] = 00ff00ff
!	%f14 = 7e0000ff 038da6db, %l4 = 00000000000000ff
!	Mem[0000000030001400] = 000000ff000000ff
	stda	%f14,[%i0+%l4]ASI_PST32_SL ! Mem[0000000030001400] = dba68d03ff00007e
!	Mem[0000000010101408] = d925f62d, %l0 = ffffffffffffff4b
	ldstuba	[%i4+%o4]0x80,%l0	! %l0 = 00000000000000d9
!	%l3 = 00000000000000ff, Mem[0000000010041410] = ffff00ff4400b870
	stxa	%l3,[%i1+%o5]0x88	! Mem[0000000010041410] = 00000000000000ff
!	Mem[0000000021800101] = ffff4a00, %l0 = 00000000000000d9
	ldstub	[%o3+0x101],%l0		! %l0 = 00000000000000ff
!	Mem[0000000010001408] = 00000000, %l3 = 00000000000000ff
	swapa	[%i0+%o4]0x80,%l3	! %l3 = 0000000000000000
!	Code Fragment 4, seed = 164742
p0_fragment_12:
!	%l0 = 00000000000000ff
	setx	0xfdb75e869a9bc1f6,%g7,%l0 ! %l0 = fdb75e869a9bc1f6
!	%l1 = 0000000000ff0000
	setx	0x6a608fcc94700d21,%g7,%l1 ! %l1 = 6a608fcc94700d21
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = fdb75e869a9bc1f6
	setx	0x5390f11534520c5c,%g7,%l0 ! %l0 = 5390f11534520c5c
!	%l1 = 6a608fcc94700d21
	setx	0x0663b462f5f0c2a7,%g7,%l1 ! %l1 = 0663b462f5f0c2a7
p0_fragment_12_end:
!	%l2 = ff000000ff0000ff, Mem[0000000010041408] = ff00000060fe70cf
	stxa	%l2,[%i1+%o4]0x80	! Mem[0000000010041408] = ff000000ff0000ff
!	Mem[000000001014142f] = 23000000, %l1 = 0663b462f5f0c2a7
	ldstuba	[%i5+0x02f]%asi,%l1	! %l1 = 0000000000000000

p0_label_174:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = 00000000, %l7 = 00000000000000ff
	lduwa	[%i4+%o5]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000030041400] = a78c9bff, %l3 = 0000000000000000
	lduha	[%i1+%g0]0x81,%l3	! %l3 = 000000000000a78c
!	Mem[0000000010081400] = 000000ff, %l6 = ffffffffffff9780
	lduwa	[%i2+%g0]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[00000000100c1400] = a78c9bff, %l4 = 00000000000000ff
	ldsba	[%i3+%g0]0x88,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010041400] = 23000000, %f15 = 038da6db
	lda	[%i1+%g0]0x88,%f15	! %f15 = 23000000
!	Mem[0000000010041400] = 00000023 ff000000, %l6 = 000000ff, %l7 = 00000000, %asi = 80
	ldda	[%i1+0x000]%asi,%l6	! %l6 = 0000000000000023 00000000ff000000
!	Mem[000000001008140e] = 00000000, %l6 = 0000000000000023
	lduh	[%i2+0x00e],%l6		! %l6 = 0000000000000000
!	Mem[0000000030181408] = 069b8097, %l2 = ff000000ff0000ff
	lduba	[%i6+%o4]0x89,%l2	! %l2 = 0000000000000097
!	Mem[0000000030001400] = 038da6db, %l2 = 0000000000000097
	lduha	[%i0+%g0]0x89,%l2	! %l2 = 000000000000a6db
!	Mem[0000000010081410] = ffff5adf ffff8097, %l4 = ffffffff, %l5 = ffffffff
	ldd	[%i2+%o5],%l4		! %l4 = 00000000ffff5adf 00000000ffff8097

p0_label_175:
!	Starting 10 instruction Store Burst
!	%f8  = 1d00a868 ffffffff, Mem[0000000030181400] = 00000000 ffffffff
	stda	%f8 ,[%i6+%g0]0x81	! Mem[0000000030181400] = 1d00a868 ffffffff
!	%l6 = 00000000, %l7 = ff000000, Mem[0000000030141400] = 69ffffa7 60fe70cf
	stda	%l6,[%i5+%g0]0x81	! Mem[0000000030141400] = 00000000 ff000000
!	Mem[0000000010001400] = 7f800000, %l4 = 00000000ffff5adf
	ldstuba	[%i0+%g0]0x80,%l4	! %l4 = 000000000000007f
!	Mem[0000000030141410] = 430a0000, %l3 = 000000000000a78c
	swapa	[%i5+%o5]0x89,%l3	! %l3 = 00000000430a0000
!	%l7 = 00000000ff000000, Mem[0000000010101438] = 746500000000007e
	stx	%l7,[%i4+0x038]		! Mem[0000000010101438] = 00000000ff000000
!	%l2 = 000000000000a6db, %l7 = 00000000ff000000, %y  = 00000000
	umul	%l2,%l7,%l1		! %l1 = 0000a63425000000, %y = 0000a634
!	Mem[0000000010041410] = 000000ff, %l2 = 000000000000a6db
	ldstuba	[%i1+%o5]0x88,%l2	! %l2 = 00000000000000ff
!	%l6 = 0000000000000000, Mem[0000000030081408] = 00003aff
	stha	%l6,[%i2+%o4]0x89	! Mem[0000000030081408] = 00000000
!	%f4  = 00000000, Mem[00000000300c1410] = ffff9bff
	sta	%f4 ,[%i3+%o5]0x89	! Mem[00000000300c1410] = 00000000
!	Mem[0000000010001400] = ff800000, %l5 = 00000000ffff8097
	swapa	[%i0+%g0]0x80,%l5	! %l5 = 00000000ff800000

p0_label_176:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = ff000000ff0000ff, %f20 = ff00007e 00000000
	ldda	[%i1+%o4]0x80,%f20	! %f20 = ff000000 ff0000ff
!	Mem[000000001008140e] = 00000000, %l6 = 0000000000000000
	ldsb	[%i2+0x00e],%l6		! %l6 = 0000000000000000
!	Mem[0000000030141410] = 8ca70000 00000000, %l0 = 34520c5c, %l1 = 25000000
	ldda	[%i5+%o5]0x81,%l0	! %l0 = 000000008ca70000 0000000000000000
!	Mem[0000000030041410] = ff000000, %l2 = 00000000000000ff
	ldsha	[%i1+%o5]0x81,%l2	! %l2 = ffffffffffffff00
!	Mem[0000000030001400] = dba68d03, %l6 = 0000000000000000
	lduha	[%i0+%g0]0x81,%l6	! %l6 = 000000000000dba6
!	Mem[0000000020800041] = ffff18e0, %l4 = 000000000000007f
	ldub	[%o1+0x041],%l4		! %l4 = 00000000000000ff
!	Mem[000000001014141d] = 70b80044, %l0 = 000000008ca70000, %asi = 80
	lduba	[%i5+0x01d]%asi,%l0	! %l0 = 00000000000000b8
!	Mem[0000000010081400] = 000000ff, %l4 = 00000000000000ff
	lduba	[%i2+%g0]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010041428] = 63ad6ddf2ca93559, %f30 = 47b7546d ae96bcff, %asi = 80
	ldda	[%i1+0x028]%asi,%f30	! %f30 = 63ad6ddf 2ca93559
!	%l3 = 00000000430a0000, %l0 = 00000000000000b8, %l1 = 0000000000000000
	xor	%l3,%l0,%l1		! %l1 = 00000000430a00b8

p0_label_177:
!	Starting 10 instruction Store Burst
!	%l7 = 00000000ff000000, Mem[0000000030041400] = a78c9bffa3eca856
	stxa	%l7,[%i1+%g0]0x81	! Mem[0000000030041400] = 00000000ff000000
!	%f27 = 7f800000, Mem[0000000030181408] = 97809b06
	sta	%f27,[%i6+%o4]0x81	! Mem[0000000030181408] = 7f800000
!	%f4  = 00000000 fe9b4b99, %l4 = 00000000000000ff
!	Mem[0000000010041400] = 00000023ff000000
	stda	%f4,[%i1+%l4]ASI_PST32_P ! Mem[0000000010041400] = 00000000fe9b4b99
!	%l6 = 0000dba6, %l7 = ff000000, Mem[00000000100c1428] = 00000057 ff1d3f9f, %asi = 80
	stda	%l6,[%i3+0x028]%asi	! Mem[00000000100c1428] = 0000dba6 ff000000
!	%f16 = 60fe0000 a6da9b06, Mem[00000000300c1408] = 003d00ff 00000000
	stda	%f16,[%i3+%o4]0x89	! Mem[00000000300c1408] = 60fe0000 a6da9b06
!	%f29 = 5b0fe295, Mem[0000000010081400] = ff000000
	sta	%f29,[%i2+%g0]0x80	! Mem[0000000010081400] = 5b0fe295
!	%l5 = 00000000ff800000, Mem[0000000010101410] = 00ff000000000000
	stxa	%l5,[%i4+%o5]0x88	! Mem[0000000010101410] = 00000000ff800000
!	Mem[0000000010041408] = ff000000, %l2 = 00000000ffffff00
	swapa	[%i1+%o4]0x80,%l2	! %l2 = 00000000ff000000
!	%l5 = 00000000ff800000, Mem[0000000010181410] = fff3a86800000000, %asi = 80
	stxa	%l5,[%i6+0x010]%asi	! Mem[0000000010181410] = 00000000ff800000
!	%l7 = 00000000ff000000, Mem[00000000300c1400] = 00000000000000ff
	stxa	%l7,[%i3+%g0]0x89	! Mem[00000000300c1400] = 00000000ff000000

p0_label_178:
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = 06a15c8f000000ff, %l5 = 00000000ff800000
	ldxa	[%i1+%o5]0x89,%l5	! %l5 = 06a15c8f000000ff
!	Mem[0000000010101400] = 994b9bfe, %l2 = 00000000ff000000
	lduha	[%i4+%g0]0x80,%l2	! %l2 = 000000000000994b
!	Mem[0000000010081408] = ff00ff00, %l3 = 00000000430a0000
	ldsba	[%i2+%o4]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000010181410] = 00000000, %l2 = 000000000000994b
	lduwa	[%i6+%o5]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000030081408] = 00000000fe9b4b99, %f0  = 44523504 508a3d00
	ldda	[%i2+%o4]0x81,%f0 	! %f0  = 00000000 fe9b4b99
!	Mem[0000000010101408] = ff25f62d000000ff, %l6 = 000000000000dba6
	ldxa	[%i4+%o4]0x80,%l6	! %l6 = ff25f62d000000ff
!	Mem[0000000020800040] = ffff18e0, %l3 = 0000000000000000
	lduh	[%o1+0x040],%l3		! %l3 = 000000000000ffff
!	Mem[0000000010101408] = ff25f62d, %l7 = 00000000ff000000
	ldswa	[%i4+%o4]0x80,%l7	! %l7 = ffffffffff25f62d
!	Mem[00000000100c1400] = ff9b8ca7, %l4 = 00000000000000ff
	lduba	[%i3+%g0]0x80,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010041400] = 00000000, %l1 = 00000000430a00b8
	ldsha	[%i1+%g0]0x88,%l1	! %l1 = 0000000000000000

p0_label_179:
!	Starting 10 instruction Store Burst
!	Mem[0000000010141410] = 000000ff, %l7 = ffffffffff25f62d
	ldstuba	[%i5+%o5]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010181400] = 00000000 9780ffff ff000000 ff0000ff
!	%f0  = 00000000 fe9b4b99 ffffffff 0000007e
!	%f4  = 00000000 fe9b4b99 ff003d00 00000000
!	%f8  = 1d00a868 ffffffff 00000000 fe9b4b99
!	%f12 = 1b1d3f9f 038da6db 7e0000ff 23000000
	stda	%f0 ,[%i6+%g0]ASI_BLK_P	! Block Store to 0000000010181400
!	Mem[0000000010001400] = 9780ffff, %l4 = 00000000000000ff
	swapa	[%i0+%g0]0x88,%l4	! %l4 = 000000009780ffff
	membar	#Sync			! Added by membar checker (36)
!	%f28 = e761cf92, Mem[0000000010141400] = 44523504
	sta	%f28,[%i5+%g0]0x80	! Mem[0000000010141400] = e761cf92
!	Mem[0000000010141408] = ffffffff, %l5 = 06a15c8f000000ff
	ldstuba	[%i5+%o4]0x88,%l5	! %l5 = 00000000000000ff
!	%l5 = 00000000000000ff, Mem[0000000030101410] = ffff8ca7
	stwa	%l5,[%i4+%o5]0x81	! Mem[0000000030101410] = 000000ff
!	%l7 = 00000000000000ff, %l7 = 00000000000000ff, %l0 = 00000000000000b8
	udivx	%l7,%l7,%l0		! %l0 = 0000000000000001
!	Mem[00000000100c1400] = ff9b8ca734ff5573, %l7 = 00000000000000ff, %l4 = 000000009780ffff
	casxa	[%i3]0x80,%l7,%l4	! %l4 = ff9b8ca734ff5573
!	%l3 = 000000000000ffff, Mem[0000000020800040] = ffff18e0
	sth	%l3,[%o1+0x040]		! Mem[0000000020800040] = ffff18e0
!	%f21 = ff0000ff, %f23 = 68a8f3ff
	fcmps	%fcc3,%f21,%f23		! %fcc3 = 1

p0_label_180:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = ff800000, %l0 = 0000000000000001
	lduha	[%i4+%o5]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000010181400] = 00000000, %l0 = 0000000000000000
	lduwa	[%i6+%g0]0x80,%l0	! %l0 = 0000000000000000
!	%l3 = 000000000000ffff, imm = 0000000000000b1d, %l7 = 00000000000000ff
	xor	%l3,0xb1d,%l7		! %l7 = 000000000000f4e2
!	Mem[0000000010041408] = 00ffffff, %l7 = 000000000000f4e2
	lduha	[%i1+%o4]0x88,%l7	! %l7 = 000000000000ffff
!	Mem[0000000010081404] = 00000000, %f1  = fe9b4b99
	ld	[%i2+0x004],%f1 	! %f1 = 00000000
!	Mem[0000000030101400] = ff0000ff, %l5 = 00000000000000ff
	lduha	[%i4+%g0]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010081438] = 00000000, %l3 = 000000000000ffff
	ldsw	[%i2+0x038],%l3		! %l3 = 0000000000000000
!	Mem[00000000201c0000] = ffffe880, %l7 = 000000000000ffff
	ldsh	[%o0+%g0],%l7		! %l7 = ffffffffffffffff
!	Mem[0000000010101400] = 994b9bfe, %l7 = ffffffffffffffff
	lduwa	[%i4+%g0]0x80,%l7	! %l7 = 00000000994b9bfe
!	Mem[00000000300c1400] = 000000ff 00000000 069bdaa6 0000fe60
!	Mem[00000000300c1410] = 00000000 cf08230e 0dd229ea ff752d36
!	Mem[00000000300c1420] = 2fb55cc8 4e44ccb9 4a28a146 9653657f
!	Mem[00000000300c1430] = 47695434 21fd52f5 6513aa12 657e0e9b
	ldda	[%i3+%g0]ASI_BLK_AIUS,%f0 	! Block Load from 00000000300c1400

p0_label_181:
!	Starting 10 instruction Store Burst
!	Mem[0000000030081400] = ffa68d03, %l2 = 0000000000000000
	ldstuba	[%i2+%g0]0x81,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030041400] = 00000000, %l6 = ff25f62d000000ff
	ldstuba	[%i1+%g0]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000030041400] = ff000000, %l3 = 0000000000000000
	swapa	[%i1+%g0]0x81,%l3	! %l3 = 00000000ff000000
!	Mem[0000000030101408] = fff3a868, %l5 = 00000000000000ff
	ldstuba	[%i4+%o4]0x81,%l5	! %l5 = 00000000000000ff
!	%l4 = 34ff5573, %l5 = 000000ff, Mem[0000000010141418] = 314aa6da 70b80044
	std	%l4,[%i5+0x018]		! Mem[0000000010141418] = 34ff5573 000000ff
!	Mem[0000000010081434] = 069b8097, %l0 = 0000000000000000
	swap	[%i2+0x034],%l0		! %l0 = 00000000069b8097
!	%f19 = 9780ffff, Mem[0000000030081408] = 00000000
	sta	%f19,[%i2+%o4]0x89	! Mem[0000000030081408] = 9780ffff
	membar	#Sync			! Added by membar checker (37)
!	%l4 = 34ff5573, %l5 = 000000ff, Mem[00000000300c1408] = 069bdaa6 0000fe60
	stda	%l4,[%i3+%o4]0x81	! Mem[00000000300c1408] = 34ff5573 000000ff
!	%f29 = 5b0fe295, %f27 = 7f800000, %f0  = 000000ff
	fdivs	%f29,%f27,%f0 		! %f0  = 00000000
!	%l4 = ff9b8ca734ff5573, Mem[0000000010081438] = 00000000, %asi = 80
	stwa	%l4,[%i2+0x038]%asi	! Mem[0000000010081438] = 34ff5573

p0_label_182:
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = 00ff6b10, %l2 = 00000000000000ff, %asi = 80
	lduha	[%o2+0x000]%asi,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010141404] = 508a3d00, %l4 = ff9b8ca734ff5573
	ldub	[%i5+0x004],%l4		! %l4 = 0000000000000050
!	Mem[0000000020800000] = 00ff42b0, %l2 = 00000000000000ff
	ldsb	[%o1+%g0],%l2		! %l2 = 0000000000000000
!	Mem[0000000010001400] = ff000000 000000ff, %l0 = 069b8097, %l1 = 00000000
	ldda	[%i0+%g0]0x80,%l0	! %l0 = 00000000ff000000 00000000000000ff
!	Mem[00000000300c1410] = 00000000, %l0 = 00000000ff000000
	lduha	[%i3+%o5]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000030001400] = dba68d03ff00007e, %l3 = 00000000ff000000
	ldxa	[%i0+%g0]0x81,%l3	! %l3 = dba68d03ff00007e
!	Mem[0000000030141408] = ff00007e, %l3 = dba68d03ff00007e
	ldsba	[%i5+%o4]0x81,%l3	! %l3 = ffffffffffffffff
!	Mem[00000000100c1401] = ff9b8ca7, %l6 = 0000000000000000
	ldub	[%i3+0x001],%l6		! %l6 = 000000000000009b
!	Mem[0000000030181410] = 000000ff, %l5 = 00000000000000ff
	lduba	[%i6+%o5]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[0000000020800041] = ffff18e0, %l5 = 00000000000000ff
	ldub	[%o1+0x041],%l5		! %l5 = 00000000000000ff

p0_label_183:
!	Starting 10 instruction Store Burst
!	%l3 = ffffffffffffffff, Mem[0000000010081418] = 9780ffff
	stw	%l3,[%i2+0x018]		! Mem[0000000010081418] = ffffffff
!	Mem[0000000030141400] = 00000000, %l7 = 00000000994b9bfe
	ldstuba	[%i5+%g0]0x81,%l7	! %l7 = 0000000000000000
!	%f14 = 6513aa12 657e0e9b, Mem[0000000010141418] = 34ff5573 000000ff, %asi = 80
	stda	%f14,[%i5+0x018]%asi	! Mem[0000000010141418] = 6513aa12 657e0e9b
!	%l5 = 00000000000000ff, Mem[0000000010041410] = ff00000000000000
	stxa	%l5,[%i1+%o5]0x80	! Mem[0000000010041410] = 00000000000000ff
!	%l1 = 00000000000000ff, Mem[0000000010081408] = 00ff00ff00000000
	stxa	%l1,[%i2+%o4]0x80	! Mem[0000000010081408] = 00000000000000ff
!	%l0 = 0000000000000000, Mem[0000000030141410] = 8ca70000
	stwa	%l0,[%i5+%o5]0x81	! Mem[0000000030141410] = 00000000
!	Code Fragment 3, seed = 523977
p0_fragment_13:
!	%l0 = 0000000000000000
	setx	0xcaf5625d7abd9ade,%g7,%l0 ! %l0 = caf5625d7abd9ade
!	%l1 = 00000000000000ff
	setx	0x0e6d3d89828ab189,%g7,%l1 ! %l1 = 0e6d3d89828ab189
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = caf5625d7abd9ade
	setx	0x39dea76cd791a444,%g7,%l0 ! %l0 = 39dea76cd791a444
!	%l1 = 0e6d3d89828ab189
	setx	0x76442e59dee8f60f,%g7,%l1 ! %l1 = 76442e59dee8f60f
p0_fragment_13_end:
!	Mem[00000000201c0000] = ffffe880, %l1 = 76442e59dee8f60f
	ldstub	[%o0+%g0],%l1		! %l1 = 00000000000000ff
!	%l4 = 0000000000000050, Mem[0000000010101410] = ff800000
	stha	%l4,[%i4+%o5]0x88	! Mem[0000000010101410] = ff800050
!	%l0 = 39dea76cd791a444, Mem[00000000100c141c] = 70b80044, %asi = 80
	stwa	%l0,[%i3+0x01c]%asi	! Mem[00000000100c141c] = d791a444

p0_label_184:
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (38)
!	Mem[00000000100c1400] = ff9b8ca7 34ff5573 5a523504 6bffacc5
!	Mem[00000000100c1410] = ff4ba780 069b0000 314aa6da d791a444
!	Mem[00000000100c1420] = 1df3a868 ffffffff 0000dba6 ff000000
!	Mem[00000000100c1430] = 0000bc35 60fe70cf 0a80ccb2 3ff082bb
	ldda	[%i3+%g0]ASI_BLK_PL,%f0 	! Block Load from 00000000100c1400
!	Mem[0000000010041400] = 00000000, %f24 = 58fa12e6
	lda	[%i1+%g0]0x80,%f24	! %f24 = 00000000
!	Mem[0000000020800001] = 00ff42b0, %l1 = 00000000000000ff, %asi = 80
	ldsba	[%o1+0x001]%asi,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000030181408] = 7f800000ffff8097, %l1 = ffffffffffffffff
	ldxa	[%i6+%o4]0x81,%l1	! %l1 = 7f800000ffff8097
!	Mem[000000001004140c] = ff0000ff, %f28 = e761cf92
	lda	[%i1+0x00c]%asi,%f28	! %f28 = ff0000ff
!	Mem[0000000030081400] = ffa68d03, %l0 = 39dea76cd791a444
	lduwa	[%i2+%g0]0x81,%l0	! %l0 = 00000000ffa68d03
!	Mem[0000000010041400] = 994b9bfe00000000, %l3 = ffffffffffffffff
	ldxa	[%i1+%g0]0x88,%l3	! %l3 = 994b9bfe00000000
!	Mem[0000000010081408] = 00000000000000ff, %l0 = 00000000ffa68d03
	ldxa	[%i2+%o4]0x80,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010081400] = 0000000095e20f5b, %f20 = ff000000 ff0000ff
	ldda	[%i2+%g0]0x88,%f20	! %f20 = 00000000 95e20f5b
!	Mem[0000000030141400] = 000000ff000000ff, %f22 = 00000000 68a8f3ff
	ldda	[%i5+%g0]0x89,%f22	! %f22 = 000000ff 000000ff

p0_label_185:
!	Starting 10 instruction Store Burst
!	Mem[0000000010101410] = ff800050, %l6 = 000000000000009b
	swapa	[%i4+%o5]0x88,%l6	! %l6 = 00000000ff800050
!	%l1 = 7f800000ffff8097, Mem[0000000030181410] = 000000ff
	stha	%l1,[%i6+%o5]0x89	! Mem[0000000030181410] = 00008097
!	Mem[000000001004142f] = 2ca93559, %l0 = 00000000000000ff
	ldstub	[%i1+0x02f],%l0		! %l0 = 0000000000000059
!	Mem[0000000030081410] = 7e000000, %l6 = 00000000ff800050
	ldstuba	[%i2+%o5]0x89,%l6	! %l6 = 0000000000000000
!	Mem[00000000100c1410] = 80a74bff, %l1 = 00000000ffff8097
	swapa	[%i3+%o5]0x88,%l1	! %l1 = 0000000080a74bff
!	Mem[00000000211c0000] = 00ff6b10, %l2 = 0000000000000000
	ldstub	[%o2+%g0],%l2		! %l2 = 0000000000000000
!	Mem[0000000030101400] = ff0000ff 0000bc35 fff3a868 00000000
!	%f16 = 60fe0000 a6da9b06 000000ff 9780ffff
!	%f20 = 00000000 95e20f5b 000000ff 000000ff
!	%f24 = 00000000 fffff759 97809b06 7f800000
!	%f28 = ff0000ff 5b0fe295 63ad6ddf 2ca93559
	stda	%f16,[%i4+%g0]ASI_BLK_AIUSL	! Block Store to 0000000030101400
!	%l6 = 00000000, %l7 = 00000000, Mem[0000000010041428] = 63ad6ddf 2ca935ff
	std	%l6,[%i1+0x028]		! Mem[0000000010041428] = 00000000 00000000
	membar	#Sync			! Added by membar checker (39)
!	%l5 = 00000000000000ff, Mem[00000000100c1408] = c5acff6b0435525a
	stxa	%l5,[%i3+%o4]0x88	! Mem[00000000100c1408] = 00000000000000ff
!	%l2 = 0000000000000000, Mem[0000000030041400] = 00000000
	stba	%l2,[%i1+%g0]0x89	! Mem[0000000030041400] = 00000000

p0_label_186:
!	Starting 10 instruction Load Burst
!	Mem[0000000030181410] = 00008097, %l7 = 0000000000000000
	lduwa	[%i6+%o5]0x89,%l7	! %l7 = 0000000000008097
!	Mem[0000000010041408] = 00ffffff, %l7 = 0000000000008097
	ldsba	[%i1+%o4]0x88,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000030081410] = 7e0000ff, %l0 = 0000000000000059
	ldsba	[%i2+%o5]0x89,%l0	! %l0 = ffffffffffffffff
!	%f20 = 00000000, %f20 = 00000000
	fcmpes	%fcc2,%f20,%f20		! %fcc2 = 0
!	Mem[0000000010001408] = ff000000, %l1 = 0000000080a74bff
	ldsha	[%i0+%o4]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010181410] = 00000000, %f25 = fffff759
	lda	[%i6+%o5]0x88,%f25	! %f25 = 00000000
!	Mem[00000000100c1410] = 9780ffff, %l4 = 0000000000000050
	lduha	[%i3+%o5]0x80,%l4	! %l4 = 0000000000009780
!	Mem[0000000030001408] = 00000000, %f20 = 00000000
	lda	[%i0+%o4]0x89,%f20	! %f20 = 00000000
!	Mem[0000000010001400] = ff000000, %f15 = b2cc800a
	lda	[%i0+0x000]%asi,%f15	! %f15 = ff000000
!	Mem[0000000010081400] = 5b0fe295, %l0 = ffffffffffffffff
	lduwa	[%i2+%g0]0x80,%l0	! %l0 = 000000005b0fe295

p0_label_187:
!	Starting 10 instruction Store Burst
!	%l2 = 0000000000000000, Mem[0000000010181400] = 00000000fe9b4b99
	stxa	%l2,[%i6+%g0]0x80	! Mem[0000000010181400] = 0000000000000000
!	Mem[0000000010001400] = 000000ff, %l7 = ffffffffffffffff
	ldstuba	[%i0+%g0]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030001408] = 00000000, %l2 = 0000000000000000
	ldstuba	[%i0+%o4]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000030041408] = 314aa6da70b80044, %f8  = ffffffff 68a8f31d
	ldda	[%i1+%o4]0x81,%f8 	! %f8  = 314aa6da 70b80044
!	Mem[00000000100c1410] = 9780ffff, %l6 = 0000000000000000
	swapa	[%i3+%o5]0x80,%l6	! %l6 = 000000009780ffff
!	%l7 = 00000000000000ff, Mem[0000000010081405] = 00000000
	stb	%l7,[%i2+0x005]		! Mem[0000000010081404] = 00ff0000
!	Code Fragment 4, seed = 939149
p0_fragment_14:
!	%l0 = 000000005b0fe295
	setx	0x301e1f939d1ff0be,%g7,%l0 ! %l0 = 301e1f939d1ff0be
!	%l1 = 0000000000000000
	setx	0x27ea495f867aa169,%g7,%l1 ! %l1 = 27ea495f867aa169
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 301e1f939d1ff0be
	setx	0xa89b26a64b240e24,%g7,%l0 ! %l0 = a89b26a64b240e24
!	%l1 = 27ea495f867aa169
	setx	0xc1b41c0e3d9cb9ef,%g7,%l1 ! %l1 = c1b41c0e3d9cb9ef
p0_fragment_14_end:
!	Mem[0000000010141405] = 508a3d00, %l3 = 994b9bfe00000000
	ldstuba	[%i5+0x005]%asi,%l3	! %l3 = 000000000000008a
!	Mem[0000000030001410] = 60fe0000, %l6 = 000000009780ffff
	swapa	[%i0+%o5]0x81,%l6	! %l6 = 0000000060fe0000
!	Mem[0000000020800000] = 00ff42b0, %l2 = 0000000000000000
	ldstub	[%o1+%g0],%l2		! %l2 = 0000000000000000

p0_label_188:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = 000000ff42d09ae7, %f4  = 00009b06 80a74bff
	ldda	[%i0+%o4]0x80,%f4 	! %f4  = 000000ff 42d09ae7
!	Mem[0000000030181410] = 00008097, %l0 = a89b26a64b240e24
	ldswa	[%i6+%o5]0x89,%l0	! %l0 = 0000000000008097
!	Mem[0000000010181430] = 1b1d3f9f038da6db, %f8  = 314aa6da 70b80044, %asi = 80
	ldda	[%i6+0x030]%asi,%f8 	! %f8  = 1b1d3f9f 038da6db
!	Mem[0000000010081408] = 00000000, %l0 = 0000000000008097
	ldsba	[%i2+%o4]0x88,%l0	! %l0 = 0000000000000000
!	Mem[00000000100c1410] = 00000000, %l0 = 0000000000000000
	lduwa	[%i3+%o5]0x88,%l0	! %l0 = 0000000000000000
!	Mem[00000000300c1400] = 00000000ff000000, %l4 = 0000000000009780
	ldxa	[%i3+%g0]0x89,%l4	! %l4 = 00000000ff000000
!	Mem[0000000010181410] = 994b9bfe 00000000, %l4 = ff000000, %l5 = 000000ff
	ldda	[%i6+%o5]0x88,%l4	! %l4 = 0000000000000000 00000000994b9bfe
!	Mem[0000000030001400] = dba68d03, %l1 = c1b41c0e3d9cb9ef
	ldsha	[%i0+%g0]0x81,%l1	! %l1 = ffffffffffffdba6
!	Mem[0000000010041400] = 994b9bfe00000000, %l1 = ffffffffffffdba6
	ldxa	[%i1+%g0]0x88,%l1	! %l1 = 994b9bfe00000000
!	Mem[0000000010181410] = 00000000, %l4 = 0000000000000000
	lduba	[%i6+%o5]0x80,%l4	! %l4 = 0000000000000000

p0_label_189:
!	Starting 10 instruction Store Burst
!	%l2 = 0000000000000000, %l2 = 0000000000000000, %l1 = 994b9bfe00000000
	andn	%l2,%l2,%l1		! %l1 = 0000000000000000
!	Mem[000000001008141c] = ffff8097, %l3 = 000000000000008a
	swap	[%i2+0x01c],%l3		! %l3 = 00000000ffff8097
!	Mem[0000000010041410] = 00000000, %l4 = 0000000000000000
	ldstuba	[%i1+%o5]0x80,%l4	! %l4 = 0000000000000000
!	%f14 = bb82f03f ff000000, Mem[0000000030081408] = ffff8097 fe9b4b99
	stda	%f14,[%i2+%o4]0x81	! Mem[0000000030081408] = bb82f03f ff000000
!	%l7 = 00000000000000ff, Mem[0000000010081418] = ffffffff
	stw	%l7,[%i2+0x018]		! Mem[0000000010081418] = 000000ff
!	%f15 = ff000000, Mem[0000000010041408] = 00ffffff
	sta	%f15,[%i1+%o4]0x88	! Mem[0000000010041408] = ff000000
!	%f11 = a6db0000, %f5  = 42d09ae7
	fsqrts	%f11,%f5 		! %f5  = 7fffffff
!	%l1 = 0000000000000000, Mem[0000000010081420] = 00000000, %asi = 80
	stba	%l1,[%i2+0x020]%asi	! Mem[0000000010081420] = 00000000
!	Mem[0000000030101400] = a6da9b06, %l3 = 00000000ffff8097
	swapa	[%i4+%g0]0x89,%l3	! %l3 = 00000000a6da9b06
!	Mem[0000000010041400] = 00000000, %l6 = 0000000060fe0000, %asi = 80
	swapa	[%i1+0x000]%asi,%l6	! %l6 = 0000000000000000

p0_label_190:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = 994b9bfe0000fe60, %l4 = 0000000000000000
	ldxa	[%i1+%g0]0x88,%l4	! %l4 = 994b9bfe0000fe60
!	%l6 = 0000000000000000, %l5 = 00000000994b9bfe, %y  = 0000a634
	smul	%l6,%l5,%l4		! %l4 = 0000000000000000, %y = 00000000
!	Mem[0000000010101428] = 00009780ffffffff, %f26 = 97809b06 7f800000, %asi = 80
	ldda	[%i4+0x028]%asi,%f26	! %f26 = 00009780 ffffffff
!	Mem[0000000021800181] = 65743a60, %l0 = 0000000000000000, %asi = 80
	ldsba	[%o3+0x181]%asi,%l0	! %l0 = 0000000000000074
!	Mem[0000000010181408] = ffffffff0000007e, %f16 = 60fe0000 a6da9b06
	ldda	[%i6+%o4]0x80,%f16	! %f16 = ffffffff 0000007e
!	Mem[0000000010041408] = 000000ff, %l3 = 00000000a6da9b06
	ldsba	[%i1+%o4]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000010081400] = 5b0fe295, %l3 = 0000000000000000
	lduha	[%i2+%g0]0x80,%l3	! %l3 = 0000000000005b0f
!	Mem[00000000100c1400] = ff9b8ca7 34ff5573, %l0 = 00000074, %l1 = 00000000
	ldda	[%i3+%g0]0x80,%l0	! %l0 = 00000000ff9b8ca7 0000000034ff5573
!	Mem[0000000030081400] = ffa68d03, %l4 = 0000000000000000
	lduha	[%i2+%g0]0x81,%l4	! %l4 = 000000000000ffa6
!	Mem[0000000030101410] = 95e20f5b, %f8  = 1b1d3f9f
	lda	[%i4+%o5]0x89,%f8 	! %f8 = 95e20f5b

p0_label_191:
!	Starting 10 instruction Store Burst
!	Mem[0000000030101408] = ffff8097, %l2 = 0000000000000000
	swapa	[%i4+%o4]0x81,%l2	! %l2 = 00000000ffff8097
!	Mem[0000000010181410] = 00000000, %l3 = 0000000000005b0f
	ldstuba	[%i6+%o5]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000010041428] = 00000000, %l0 = 00000000ff9b8ca7, %asi = 80
	swapa	[%i1+0x028]%asi,%l0	! %l0 = 0000000000000000
!	%l6 = 0000000000000000, Mem[0000000010141400] = 003dff5092cf61e7
	stxa	%l6,[%i5+%g0]0x88	! Mem[0000000010141400] = 0000000000000000
!	%l2 = 00000000ffff8097, Mem[0000000030101400] = ffff8097
	stwa	%l2,[%i4+%g0]0x89	! Mem[0000000030101400] = ffff8097
!	%l5 = 00000000994b9bfe, Mem[00000000100c1410] = 00000000
	stba	%l5,[%i3+%o5]0x80	! Mem[00000000100c1410] = fe000000
!	Mem[0000000010001415] = ff000000, %l2 = 00000000ffff8097
	ldstuba	[%i0+0x015]%asi,%l2	! %l2 = 0000000000000000
!	%l0 = 0000000000000000, Mem[0000000010141408] = ffffffff0000007e
	stxa	%l0,[%i5+%o4]0x80	! Mem[0000000010141408] = 0000000000000000
!	%f4  = 000000ff 7fffffff, Mem[0000000010081400] = 5b0fe295 00ff0000
	stda	%f4 ,[%i2+%g0]0x80	! Mem[0000000010081400] = 000000ff 7fffffff
!	%l1 = 0000000034ff5573, Mem[0000000030141408] = 7e0000ff
	stba	%l1,[%i5+%o4]0x89	! Mem[0000000030141408] = 7e000073

p0_label_192:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = a78c9bff, %l2 = 0000000000000000
	ldsba	[%i3+%g0]0x88,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000010081400] = 000000ff7fffffff, %l5 = 00000000994b9bfe
	ldxa	[%i2+%g0]0x80,%l5	! %l5 = 000000ff7fffffff
!	Mem[0000000010101400] = fe9b4b99, %l6 = 0000000000000000
	ldsha	[%i4+%g0]0x88,%l6	! %l6 = 0000000000004b99
!	Mem[0000000010081404] = 7fffffff, %f18 = 000000ff
	lda	[%i2+0x004]%asi,%f18	! %f18 = 7fffffff
!	Mem[0000000010101428] = 00009780, %f23 = 000000ff
	ld	[%i4+0x028],%f23	! %f23 = 00009780
!	Mem[0000000030041410] = 000000ff, %f0  = 7355ff34
	lda	[%i1+%o5]0x89,%f0 	! %f0 = 000000ff
!	Mem[0000000020800001] = ffff42b0, %l4 = 000000000000ffa6, %asi = 80
	lduba	[%o1+0x001]%asi,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030041400] = 00000000, %l5 = 000000ff7fffffff
	ldsha	[%i1+%g0]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000020800040] = ffff18e0, %l6 = 0000000000004b99, %asi = 80
	lduha	[%o1+0x040]%asi,%l6	! %l6 = 000000000000ffff
!	Mem[0000000030141410] = 00000000, %l4 = 00000000000000ff
	ldsha	[%i5+%o5]0x89,%l4	! %l4 = 0000000000000000

p0_label_193:
!	Starting 10 instruction Store Burst
!	Mem[0000000010101408] = ff25f62d, %l1 = 0000000034ff5573
	ldstuba	[%i4+%o4]0x80,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030001410] = 9780ffff, %l7 = 00000000000000ff
	ldstuba	[%i0+%o5]0x81,%l7	! %l7 = 0000000000000097
!	Mem[0000000030141408] = 7e000073, %l6 = 000000000000ffff
	lduba	[%i5+%o4]0x89,%l6	! %l6 = 0000000000000073
!	%l6 = 0000000000000073, Mem[0000000010041428] = ff9b8ca700000000
	stx	%l6,[%i1+0x028]		! Mem[0000000010041428] = 0000000000000073
!	%f30 = 63ad6ddf, Mem[0000000010181438] = 7e0000ff
	sta	%f30,[%i6+0x038]%asi	! Mem[0000000010181438] = 63ad6ddf
!	%f8  = 95e20f5b 038da6db, %l2 = ffffffffffffffff
!	Mem[00000000300c1408] = 34ff5573000000ff
	add	%i3,0x008,%g1
	stda	%f8,[%g1+%l2]ASI_PST16_SL ! Mem[00000000300c1408] = dba68d035b0fe295
!	Mem[0000000030181410] = 00008097, %l2 = 00000000ffffffff
	swapa	[%i6+%o5]0x89,%l2	! %l2 = 0000000000008097
!	%f8  = 95e20f5b, %f21 = 95e20f5b
	fsqrts	%f8 ,%f21		! %f21 = 7fffffff
!	%l0 = 0000000000000000, Mem[0000000030141410] = 0000000000000000
	stxa	%l0,[%i5+%o5]0x81	! Mem[0000000030141410] = 0000000000000000
!	Mem[0000000010101405] = 00000000, %l4 = 0000000000000000
	ldstub	[%i4+0x005],%l4		! %l4 = 0000000000000000

p0_label_194:
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = 000000ff, %l0 = 0000000000000000
	lduba	[%i3+%g0]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000010041412] = ff000000, %l6 = 0000000000000073
	ldub	[%i1+0x012],%l6		! %l6 = 0000000000000000
!	Mem[0000000010081408] = 00000000, %f0  = 000000ff
	lda	[%i2+%o4]0x80,%f0 	! %f0 = 00000000
!	Mem[0000000010081408] = 00000000 000000ff, %l2 = 00008097, %l3 = 00000000
	ldda	[%i2+%o4]0x80,%l2	! %l2 = 0000000000000000 00000000000000ff
!	Mem[0000000010101426] = e9ff31ff, %l7 = 0000000000000097
	lduh	[%i4+0x026],%l7		! %l7 = 00000000000031ff
!	Mem[0000000010101408] = ff0000002df625ff, %l4 = 0000000000000000
	ldxa	[%i4+%o4]0x88,%l4	! %l4 = ff0000002df625ff
!	Mem[0000000010041408] = 000000ff, %l3 = 00000000000000ff
	lduha	[%i1+%o4]0x80,%l3	! %l3 = 0000000000000000
!	Mem[00000000300c1408] = 038da6db, %l2 = 0000000000000000
	lduba	[%i3+%o4]0x89,%l2	! %l2 = 00000000000000db
!	Mem[0000000030081408] = bb82f03f, %l6 = 0000000000000000
	ldsha	[%i2+%o4]0x81,%l6	! %l6 = ffffffffffffbb82
!	Mem[0000000010181410] = ff000000, %l1 = 00000000000000ff
	ldsba	[%i6+%o5]0x80,%l1	! %l1 = ffffffffffffffff

p0_label_195:
!	Starting 10 instruction Store Burst
!	Mem[0000000010181400] = 00000000, %l3 = 0000000000000000
	ldstuba	[%i6+%g0]0x88,%l3	! %l3 = 0000000000000000
!	Mem[00000000300c1400] = 000000ff, %l0 = 0000000000000000
	swapa	[%i3+%g0]0x81,%l0	! %l0 = 00000000000000ff
!	%l6 = ffffffffffffbb82, Mem[0000000021800000] = 79ff3940
	sth	%l6,[%o3+%g0]		! Mem[0000000021800000] = bb823940
!	%f15 = ff000000, Mem[0000000010081400] = 000000ff
	sta	%f15,[%i2+%g0]0x80	! Mem[0000000010081400] = ff000000
!	%l0 = 00000000000000ff, Mem[0000000010001420] = 00000000
	stw	%l0,[%i0+0x020]		! Mem[0000000010001420] = 000000ff
!	Mem[0000000020800040] = ffff18e0, %l7 = 00000000000031ff
	ldstuba	[%o1+0x040]%asi,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030081408] = 3ff082bb, %l2 = 00000000000000db
	swapa	[%i2+%o4]0x89,%l2	! %l2 = 000000003ff082bb
!	Mem[0000000010181410] = ff000000, %l0 = 00000000000000ff
	ldstuba	[%i6+%o5]0x80,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010101411] = 9b000000, %l7 = 00000000000000ff
	ldstub	[%i4+0x011],%l7		! %l7 = 0000000000000000
!	Mem[0000000030041400] = 00000000, %l0 = 00000000000000ff
	swapa	[%i1+%g0]0x81,%l0	! %l0 = 0000000000000000

p0_label_196:
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = 00000000000000ff, %l2 = 000000003ff082bb
	ldxa	[%i0+%o4]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030001400] = 038da6db, %l3 = 0000000000000000
	ldswa	[%i0+%g0]0x89,%l3	! %l3 = 00000000038da6db
!	Mem[0000000010141408] = 00000000, %l7 = 0000000000000000
	ldsba	[%i5+%o4]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000030181410] = ffffffff, %l2 = 00000000000000ff
	lduha	[%i6+%o5]0x89,%l2	! %l2 = 000000000000ffff
!	Mem[0000000010001400] = ff000000, %l3 = 00000000038da6db, %asi = 80
	ldswa	[%i0+0x000]%asi,%l3	! %l3 = ffffffffff000000
!	Mem[00000000100c1400] = ff9b8ca7 34ff5573, %l4 = 2df625ff, %l5 = 00000000
	ldda	[%i3+%g0]0x80,%l4	! %l4 = 00000000ff9b8ca7 0000000034ff5573
!	%l1 = ffffffffffffffff, %l2 = 000000000000ffff, %l3 = ffffffffff000000
	udivx	%l1,%l2,%l3		! %l3 = 0001000100010001
!	Mem[00000000100c143b] = 0a80ccb2, %l6 = ffffffffffffbb82
	ldub	[%i3+0x03b],%l6		! %l6 = 00000000000000b2
!	Mem[00000000100c1400] = ff9b8ca7, %l0 = 0000000000000000
	lduha	[%i3+%g0]0x80,%l0	! %l0 = 000000000000ff9b
!	Mem[0000000030001408] = 00000000000000ff, %l1 = ffffffffffffffff
	ldxa	[%i0+%o4]0x89,%l1	! %l1 = 00000000000000ff

p0_label_197:
!	Starting 10 instruction Store Burst
!	Mem[0000000010141427] = ffffffff, %l1 = 00000000000000ff
	ldstub	[%i5+0x027],%l1		! %l1 = 00000000000000ff
!	Mem[0000000030081410] = 7e0000ff, %l2 = 000000000000ffff
	ldstuba	[%i2+%o5]0x89,%l2	! %l2 = 00000000000000ff
!	%f8  = 95e20f5b, Mem[00000000100c1408] = ff000000
	sta	%f8 ,[%i3+%o4]0x80	! Mem[00000000100c1408] = 95e20f5b
!	Mem[00000000100c1408] = 5b0fe295, %l1 = 00000000000000ff
	swapa	[%i3+%o4]0x88,%l1	! %l1 = 000000005b0fe295
!	%f27 = ffffffff, Mem[0000000010001410] = df5affff
	sta	%f27,[%i0+%o5]0x88	! Mem[0000000010001410] = ffffffff
!	%l5 = 0000000034ff5573, Mem[0000000030041410] = 000000ff
	stba	%l5,[%i1+%o5]0x89	! Mem[0000000030041410] = 00000073
!	%l2 = 00000000000000ff, Mem[0000000030181408] = 0000807f
	stwa	%l2,[%i6+%o4]0x89	! Mem[0000000030181408] = 000000ff
!	%f3  = 0435525a, Mem[0000000010041408] = ff000000
	sta	%f3 ,[%i1+%o4]0x88	! Mem[0000000010041408] = 0435525a
!	Mem[0000000030101400] = 9780ffff 0000fe60 00000000 ff000000
!	%f16 = ffffffff 0000007e 7fffffff 9780ffff
!	%f20 = 00000000 7fffffff 000000ff 00009780
!	%f24 = 00000000 00000000 00009780 ffffffff
!	%f28 = ff0000ff 5b0fe295 63ad6ddf 2ca93559
	stda	%f16,[%i4+%g0]ASI_BLK_AIUS	! Block Store to 0000000030101400
!	%l1 = 000000005b0fe295, Mem[0000000010181424] = ffffffff
	stw	%l1,[%i6+0x024]		! Mem[0000000010181424] = 5b0fe295

p0_label_198:
!	Starting 10 instruction Load Burst
!	%l5 = 0000000034ff5573, imm = 00000000000003f9, %l5 = 0000000034ff5573
	orn	%l5,0x3f9,%l5		! %l5 = fffffffffffffd77
!	Mem[0000000020800000] = ffff42b0, %l6 = 00000000000000b2, %asi = 80
	lduba	[%o1+0x000]%asi,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010041408] = ff0000ff 0435525a, %l4 = ff9b8ca7, %l5 = fffffd77
	ldda	[%i1+%o4]0x88,%l4	! %l4 = 000000000435525a 00000000ff0000ff
	membar	#Sync			! Added by membar checker (40)
!	Mem[0000000010101410] = 9bff0000 00000000, %l4 = 0435525a, %l5 = ff0000ff
	ldda	[%i4+%o5]0x80,%l4	! %l4 = 000000009bff0000 0000000000000000
!	Mem[0000000030141400] = 000000ff 000000ff, %l4 = 9bff0000, %l5 = 00000000
	ldda	[%i5+%g0]0x89,%l4	! %l4 = 00000000000000ff 00000000000000ff
!	%f16 = ffffffff, %f27 = ffffffff
	fcmpes	%fcc2,%f16,%f27		! %fcc2 = 3
!	Mem[0000000010041439] = 7e000000, %l6 = 00000000000000ff
	ldsb	[%i1+0x039],%l6		! %l6 = 0000000000000000
!	%f7  = daa64a31, %f0  = 00000000
	fsqrts	%f7 ,%f0 		! %f0  = 7fffffff
!	Mem[0000000030181400] = 1d00a868, %l5 = 00000000000000ff
	lduba	[%i6+%g0]0x81,%l5	! %l5 = 000000000000001d
!	Mem[000000001008140c] = 000000ff, %l5 = 000000000000001d, %asi = 80
	lduha	[%i2+0x00c]%asi,%l5	! %l5 = 0000000000000000

p0_label_199:
!	Starting 10 instruction Store Burst
!	%l4 = 00000000000000ff, Mem[00000000100c1400] = ff9b8ca7
	stwa	%l4,[%i3+%g0]0x80	! Mem[00000000100c1400] = 000000ff
!	%f19 = 9780ffff, Mem[0000000010081400] = ff000000
	sta	%f19,[%i2+%g0]0x80	! Mem[0000000010081400] = 9780ffff
!	%l5 = 0000000000000000, Mem[000000001008141c] = 0000008a, %asi = 80
	stwa	%l5,[%i2+0x01c]%asi	! Mem[000000001008141c] = 00000000
!	Mem[0000000010041400] = 0000fe60, %l1 = 000000005b0fe295
	swapa	[%i1+%g0]0x88,%l1	! %l1 = 000000000000fe60
!	Mem[0000000010041410] = 000000ff, %l1 = 000000000000fe60
	ldstuba	[%i1+%o5]0x88,%l1	! %l1 = 00000000000000ff
!	%l5 = 0000000000000000, Mem[00000000100c1410] = fe000000
	stba	%l5,[%i3+%o5]0x80	! Mem[00000000100c1410] = 00000000
!	%l5 = 0000000000000000, Mem[0000000010141408] = 00000000
	stba	%l5,[%i5+%o4]0x80	! Mem[0000000010141408] = 00000000
!	%f0  = 7fffffff a78c9bff, Mem[0000000010141408] = 00000000 00000000
	stda	%f0 ,[%i5+%o4]0x80	! Mem[0000000010141408] = 7fffffff a78c9bff
!	Mem[0000000030181400] = 1d00a868, %l5 = 0000000000000000
	ldstuba	[%i6+%g0]0x81,%l5	! %l5 = 000000000000001d
!	Mem[0000000030041408] = daa64a31, %l1 = 00000000000000ff
	swapa	[%i1+%o4]0x89,%l1	! %l1 = 00000000daa64a31

p0_label_200:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = ffffffff, %f28 = ff0000ff
	lda	[%i0+%o5]0x88,%f28	! %f28 = ffffffff
!	Mem[000000001004143d] = 587464ff, %l6 = 0000000000000000
	ldsb	[%i1+0x03d],%l6		! %l6 = 0000000000000074
!	Mem[00000000100c1410] = 00000000, %l4 = 00000000000000ff
	ldswa	[%i3+%o5]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000010141400] = 00000000, %l1 = 00000000daa64a31
	lduwa	[%i5+%g0]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010081408] = 00000000, %l7 = 0000000000000000
	lduha	[%i2+%o4]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000010081428] = 000000ff000000da, %f10 = 000000ff a6db0000
	ldd	[%i2+0x028],%f10	! %f10 = 000000ff 000000da
!	Mem[00000000100c1408] = 000000ff, %l4 = 0000000000000000
	ldswa	[%i3+%o4]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010101400] = 994b9bfe, %l2 = 00000000000000ff
	ldswa	[%i4+%g0]0x80,%l2	! %l2 = ffffffff994b9bfe
!	Mem[0000000030101410] = 00000000, %l2 = ffffffff994b9bfe
	lduwa	[%i4+%o5]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000010081438] = 34ff5573 0000007e, %l4 = 000000ff, %l5 = 0000001d, %asi = 80
	ldda	[%i2+0x038]%asi,%l4	! %l4 = 0000000034ff5573 000000000000007e

p0_label_201:
!	Starting 10 instruction Store Burst
!	%l6 = 00000074, %l7 = 00000000, Mem[0000000030041400] = ff000000 000000ff
	stda	%l6,[%i1+%g0]0x89	! Mem[0000000030041400] = 00000074 00000000
!	%l1 = 0000000000000000, Mem[0000000010181430] = 1b1d3f9f038da6db
	stx	%l1,[%i6+0x030]		! Mem[0000000010181430] = 0000000000000000
!	%f21 = 7fffffff, Mem[0000000010181400] = 000000ff
	sta	%f21,[%i6+%g0]0x88	! Mem[0000000010181400] = 7fffffff
!	%f16 = ffffffff 0000007e, Mem[0000000030101408] = 7fffffff 9780ffff
	stda	%f16,[%i4+%o4]0x81	! Mem[0000000030101408] = ffffffff 0000007e
!	Mem[00000000100c1410] = 00000000, %l4 = 0000000034ff5573
	ldstuba	[%i3+%o5]0x80,%l4	! %l4 = 0000000000000000
!	%l6 = 00000074, %l7 = 00000000, Mem[0000000010141408] = ffffff7f ff9b8ca7
	stda	%l6,[%i5+%o4]0x88	! Mem[0000000010141408] = 00000074 00000000
!	%l2 = 0000000000000000, Mem[0000000021800000] = bb823940
	sth	%l2,[%o3+%g0]		! Mem[0000000021800000] = 00003940
!	%l2 = 0000000000000000, Mem[0000000030041400] = 74000000
	stha	%l2,[%i1+%g0]0x81	! Mem[0000000030041400] = 00000000
!	Mem[0000000030081400] = 038da6ff, %l7 = 0000000000000000
	ldstuba	[%i2+%g0]0x89,%l7	! %l7 = 00000000000000ff
!	%l7 = 00000000000000ff, Mem[0000000010181422] = 1d00a868, %asi = 80
	stha	%l7,[%i6+0x022]%asi	! Mem[0000000010181420] = 1d0000ff

p0_label_202:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = df5affff, %l4 = 0000000000000000
	ldsba	[%i2+%o5]0x88,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010181408] = ffffffff, %l3 = 0001000100010001
	lduba	[%i6+%o4]0x80,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030181408] = ff000000ffff8097, %l5 = 000000000000007e
	ldxa	[%i6+%o4]0x81,%l5	! %l5 = ff000000ffff8097
!	Mem[0000000020800000] = ffff42b0, %l5 = ff000000ffff8097, %asi = 80
	ldsba	[%o1+0x000]%asi,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000030001408] = ff000000, %l3 = 00000000000000ff
	lduha	[%i0+%o4]0x81,%l3	! %l3 = 000000000000ff00
!	Mem[0000000010001410] = ffffffff, %l7 = 00000000000000ff
	lduha	[%i0+%o5]0x88,%l7	! %l7 = 000000000000ffff
!	Mem[0000000030001410] = ff80ffff, %f20 = 00000000
	lda	[%i0+%o5]0x81,%f20	! %f20 = ff80ffff
!	%f31 = 2ca93559, %f31 = 2ca93559
	fcmpes	%fcc1,%f31,%f31		! %fcc1 = 0
!	Mem[0000000030141400] = ff000000 ff000000, %l4 = ffffffff, %l5 = ffffffff
	ldda	[%i5+%g0]0x81,%l4	! %l4 = 00000000ff000000 00000000ff000000
!	Mem[0000000030141400] = 000000ff, %l2 = 0000000000000000
	lduha	[%i5+%g0]0x89,%l2	! %l2 = 00000000000000ff

p0_label_203:
!	Starting 10 instruction Store Burst
!	%f10 = 000000ff, Mem[0000000030141408] = 7e000073
	sta	%f10,[%i5+%o4]0x89	! Mem[0000000030141408] = 000000ff
!	%l5 = 00000000ff000000, Mem[0000000021800041] = ffff8370, %asi = 80
	stba	%l5,[%o3+0x041]%asi	! Mem[0000000021800040] = ff008370
!	Mem[00000000100c1410] = ff000000, %l3 = 000000000000ff00
	ldstuba	[%i3+%o5]0x80,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010101408] = ff25f62d, %l5 = 00000000ff000000
	ldstuba	[%i4+%o4]0x80,%l5	! %l5 = 00000000000000ff
!	%l1 = 0000000000000000, Mem[0000000010001410] = ffffffff
	stha	%l1,[%i0+%o5]0x80	! Mem[0000000010001410] = 0000ffff
!	%l5 = 00000000000000ff, %l6 = 0000000000000074, %y  = 00000000
	smul	%l5,%l6,%l3		! %l3 = 000000000000738c, %y = 00000000
!	Mem[0000000030081408] = db000000, %l4 = 00000000ff000000
	swapa	[%i2+%o4]0x81,%l4	! %l4 = 00000000db000000
!	%f6  = 44a491d7 daa64a31, Mem[0000000030041400] = 00000000 00000000
	stda	%f6 ,[%i1+%g0]0x89	! Mem[0000000030041400] = 44a491d7 daa64a31
!	%f27 = ffffffff, Mem[0000000030181408] = 000000ff
	sta	%f27,[%i6+%o4]0x89	! Mem[0000000030181408] = ffffffff
!	%l4 = 00000000db000000, Mem[0000000030001408] = ff000000
	stwa	%l4,[%i0+%o4]0x81	! Mem[0000000030001408] = db000000

p0_label_204:
!	Starting 10 instruction Load Burst
!	Mem[0000000030001400] = dba68d03ff00007e, %l1 = 0000000000000000
	ldxa	[%i0+%g0]0x81,%l1	! %l1 = dba68d03ff00007e
!	Mem[0000000010081408] = 00000000, %l1 = dba68d03ff00007e
	ldsba	[%i2+%o4]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000010141408] = 00000074, %l3 = 000000000000738c
	ldsha	[%i5+%o4]0x88,%l3	! %l3 = 0000000000000074
!	Mem[00000000218000c0] = 16ab8bd0, %l3 = 0000000000000074
	lduh	[%o3+0x0c0],%l3		! %l3 = 00000000000016ab
!	Mem[0000000010001408] = 000000ff, %l1 = 0000000000000000
	lduba	[%i0+%o4]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000010081408] = 00000000, %l5 = 00000000000000ff
	lduwa	[%i2+%o4]0x80,%l5	! %l5 = 0000000000000000
!	Mem[00000000218000c0] = 16ab8bd0, %l3 = 00000000000016ab, %asi = 80
	ldsha	[%o3+0x0c0]%asi,%l3	! %l3 = 00000000000016ab
!	Mem[0000000010001400] = ff000000, %l4 = 00000000db000000
	lduba	[%i0+%g0]0x80,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010181428] = 00000000, %l1 = 0000000000000000, %asi = 80
	ldswa	[%i6+0x028]%asi,%l1	! %l1 = 0000000000000000
!	Mem[0000000030001410] = 069bdaa6ffff80ff, %l0 = 000000000000ff9b
	ldxa	[%i0+%o5]0x89,%l0	! %l0 = 069bdaa6ffff80ff

p0_label_205:
!	Starting 10 instruction Store Burst
!	%l2 = 000000ff, %l3 = 000016ab, Mem[0000000010081410] = ffff5adf ffff8097
	stda	%l2,[%i2+%o5]0x80	! Mem[0000000010081410] = 000000ff 000016ab
!	Mem[0000000010041408] = 0435525a, %l4 = 00000000000000ff
	ldstuba	[%i1+%o4]0x88,%l4	! %l4 = 000000000000005a
!	Mem[0000000010101408] = ff25f62d, %l4 = 000000000000005a
	ldstuba	[%i4+%o4]0x80,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010141400] = 00000000 00000000 74000000 00000000
!	%f0  = 7fffffff a78c9bff c5acff6b 0435525a
!	%f4  = 000000ff 7fffffff 44a491d7 daa64a31
!	%f8  = 95e20f5b 038da6db 000000ff 000000da
!	%f12 = cf70fe60 35bc0000 bb82f03f ff000000
	stda	%f0 ,[%i5+%g0]ASI_BLK_AIUP	! Block Store to 0000000010141400
!	%l5 = 0000000000000000, Mem[0000000030001410] = ffff80ff
	stwa	%l5,[%i0+%o5]0x89	! Mem[0000000030001410] = 00000000
!	Mem[0000000010081410] = 000000ff, %l7 = 000000000000ffff
	swapa	[%i2+%o5]0x80,%l7	! %l7 = 00000000000000ff
!	Mem[00000000100c1410] = 000000ff, %l3 = 00000000000016ab
	swapa	[%i3+%o5]0x88,%l3	! %l3 = 00000000000000ff
!	%l6 = 0000000000000074, Mem[00000000300c1410] = 00000000
	stba	%l6,[%i3+%o5]0x81	! Mem[00000000300c1410] = 74000000
!	%l2 = 000000ff, %l3 = 000000ff, Mem[0000000030141410] = 00000000 00000000
	stda	%l2,[%i5+%o5]0x89	! Mem[0000000030141410] = 000000ff 000000ff
!	%f28 = ffffffff 5b0fe295, Mem[0000000010141430] = cf70fe60 35bc0000, %asi = 80
	stda	%f28,[%i5+0x030]%asi	! Mem[0000000010141430] = ffffffff 5b0fe295

p0_label_206:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081420] = 00000000, %l2 = 00000000000000ff, %asi = 80
	ldswa	[%i2+0x020]%asi,%l2	! %l2 = 0000000000000000
!	Mem[0000000030081410] = ff00007e, %l7 = 00000000000000ff
	ldsha	[%i2+%o5]0x81,%l7	! %l7 = ffffffffffffff00
!	Mem[0000000010181400] = 7fffffff, %l2 = 0000000000000000
	ldswa	[%i6+%g0]0x88,%l2	! %l2 = 000000007fffffff
	membar	#Sync			! Added by membar checker (41)
!	Mem[0000000010141400] = ffffff7f, %l1 = 0000000000000000
	ldswa	[%i5+%g0]0x88,%l1	! %l1 = ffffffffffffff7f
!	Mem[00000000100c1408] = 000000ff, %l2 = 000000007fffffff
	ldsha	[%i3+%o4]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[00000000201c0000] = ffffe880, %l5 = 0000000000000000, %asi = 80
	lduha	[%o0+0x000]%asi,%l5	! %l5 = 000000000000ffff
!	Mem[0000000020800000] = ffff42b0, %l5 = 000000000000ffff, %asi = 80
	ldsha	[%o1+0x000]%asi,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000010141400] = ffffff7f, %l3 = 00000000000000ff
	ldswa	[%i5+%g0]0x88,%l3	! %l3 = ffffffffffffff7f
!	Mem[0000000021800140] = 28658430, %l7 = ffffffffffffff00, %asi = 80
	ldsha	[%o3+0x140]%asi,%l7	! %l7 = 0000000000002865
!	Mem[0000000010081430] = 00ff0000 00000000, %l0 = ffff80ff, %l1 = ffffff7f, %asi = 80
	ldda	[%i2+0x030]%asi,%l0	! %l0 = 0000000000ff0000 0000000000000000

p0_label_207:
!	Starting 10 instruction Store Burst
!	%l0 = 0000000000ff0000, Mem[0000000010041408] = 043552ff
	stha	%l0,[%i1+%o4]0x88	! Mem[0000000010041408] = 04350000
!	Mem[0000000030101400] = ffffffff, %l0 = 0000000000ff0000
	ldstuba	[%i4+%g0]0x89,%l0	! %l0 = 00000000000000ff
!	%f22 = 000000ff 00009780, %l5 = ffffffffffffffff
!	Mem[0000000030041408] = ff00000070b80044
	add	%i1,0x008,%g1
	stda	%f22,[%g1+%l5]ASI_PST16_SL ! Mem[0000000030041408] = 80970000ff000000
!	%l2 = 00000000000000ff, Mem[0000000010041400] = 994b9bfe5b0fe295
	stxa	%l2,[%i1+%g0]0x88	! Mem[0000000010041400] = 00000000000000ff
!	Mem[0000000010181400] = ffffff7f, %l0 = 00000000000000ff
	ldstuba	[%i6+%g0]0x80,%l0	! %l0 = 00000000000000ff
!	%f26 = 00009780, Mem[00000000100c1430] = 0000bc35
	st	%f26,[%i3+0x030]	! Mem[00000000100c1430] = 00009780
!	%l2 = 00000000000000ff, Mem[0000000030141400] = ff000000
	stha	%l2,[%i5+%g0]0x81	! Mem[0000000030141400] = 00ff0000
!	%l6 = 00000074, %l7 = 00002865, Mem[0000000010101400] = 994b9bfe 00ff0000
	stda	%l6,[%i4+%g0]0x80	! Mem[0000000010101400] = 00000074 00002865
!	%l3 = ffffffffffffff7f, Mem[0000000010081408] = 00000000000000ff
	stxa	%l3,[%i2+%o4]0x80	! Mem[0000000010081408] = ffffffffffffff7f
!	%l0 = 00000000000000ff, Mem[0000000010081410] = 0000ffff
	stwa	%l0,[%i2+%o5]0x80	! Mem[0000000010081410] = 000000ff

p0_label_208:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = 000000ff, %l6 = 0000000000000074
	lduha	[%i1+%g0]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010181400] = ffffff7f, %l3 = ffffffffffffff7f
	lduwa	[%i6+%g0]0x80,%l3	! %l3 = 00000000ffffff7f
!	Mem[0000000010141400] = 7fffffff, %l1 = 0000000000000000
	ldsba	[%i5+%g0]0x80,%l1	! %l1 = 000000000000007f
!	Mem[0000000020800040] = ffff18e0, %l6 = 00000000000000ff
	lduh	[%o1+0x040],%l6		! %l6 = 000000000000ffff
!	Mem[00000000100c1408] = 000000ff, %l1 = 000000000000007f
	ldswa	[%i3+%o4]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[00000000300c1410] = 00000074, %l5 = ffffffffffffffff
	lduha	[%i3+%o5]0x89,%l5	! %l5 = 0000000000000074
!	Mem[0000000010041402] = ff000000, %l1 = 00000000000000ff, %asi = 80
	ldsha	[%i1+0x002]%asi,%l1	! %l1 = 0000000000000000
!	Mem[0000000010041408] = 04350000, %l2 = 00000000000000ff
	lduha	[%i1+%o4]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000030101408] = 7e000000 ffffffff, %l0 = 000000ff, %l1 = 00000000
	ldda	[%i4+%o4]0x89,%l0	! %l0 = 00000000ffffffff 000000007e000000
!	Mem[0000000010101410] = 9bff0000, %l6 = 000000000000ffff
	lduh	[%i4+%o5],%l6		! %l6 = 0000000000009bff

p0_label_209:
!	Starting 10 instruction Store Burst
!	%f26 = 00009780, Mem[0000000030101400] = ffffffff
	sta	%f26,[%i4+%g0]0x81	! Mem[0000000030101400] = 00009780
!	%l2 = 0000000000000000, Mem[0000000010181432] = 00000000
	sth	%l2,[%i6+0x032]		! Mem[0000000010181430] = 00000000
!	Mem[00000000100c1408] = ff000000, %l6 = 0000000000009bff, %asi = 80
	swapa	[%i3+0x008]%asi,%l6	! %l6 = 00000000ff000000
!	Mem[0000000021800041] = ff008370, %l1 = 000000007e000000
	ldstub	[%o3+0x041],%l1		! %l1 = 0000000000000000
!	%f17 = 0000007e, Mem[0000000010041400] = ff000000
	sta	%f17,[%i1+%g0]0x80	! Mem[0000000010041400] = 0000007e
!	Mem[0000000010101438] = 00000000ff000000, %l3 = 00000000ffffff7f, %l7 = 0000000000002865
	add	%i4,0x38,%g1
	casxa	[%g1]0x80,%l3,%l7	! %l7 = 00000000ff000000
!	%l7 = 00000000ff000000, Mem[0000000010081400] = ffff8097
	stwa	%l7,[%i2+%g0]0x88	! Mem[0000000010081400] = ff000000
!	%l3 = 00000000ffffff7f, Mem[0000000010001410] = 0000ffff
	stha	%l3,[%i0+%o5]0x80	! Mem[0000000010001410] = ff7fffff
!	%l6 = ff000000, %l7 = ff000000, Mem[0000000030081400] = 038da6ff 9b006496
	stda	%l6,[%i2+%g0]0x89	! Mem[0000000030081400] = ff000000 ff000000
!	Mem[00000000201c0000] = ffffe880, %l0 = 00000000ffffffff
	ldstuba	[%o0+0x000]%asi,%l0	! %l0 = 00000000000000ff

p0_label_210:
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = ffffffff, %l7 = 00000000ff000000
	ldsha	[%i6+%o4]0x81,%l7	! %l7 = ffffffffffffffff
!	Mem[00000000300c1410] = 74000000, %l0 = 00000000000000ff
	lduwa	[%i3+%o5]0x81,%l0	! %l0 = 0000000074000000
!	Mem[000000001010141c] = 60fe70cf, %l2 = 0000000000000000
	lduh	[%i4+0x01c],%l2		! %l2 = 00000000000060fe
!	Mem[0000000030181410] = ffffffff 00000000, %l4 = 000000ff, %l5 = 00000074
	ldda	[%i6+%o5]0x81,%l4	! %l4 = 00000000ffffffff 0000000000000000
!	Mem[0000000010141408] = c5acff6b, %l2 = 00000000000060fe
	lduba	[%i5+%o4]0x80,%l2	! %l2 = 00000000000000c5
!	Mem[0000000010101400] = 74000000, %l1 = 0000000000000000
	ldswa	[%i4+%g0]0x88,%l1	! %l1 = 0000000074000000
!	Mem[0000000030101410] = 00000000, %l1 = 0000000074000000
	lduha	[%i4+%o5]0x81,%l1	! %l1 = 0000000000000000
!	Mem[00000000100c1410] = 00009b06 000016ab, %l6 = ff000000, %l7 = ffffffff
	ldda	[%i3+%o5]0x88,%l6	! %l6 = 00000000000016ab 0000000000009b06
!	Mem[0000000010041410] = ff000000, %l0 = 0000000074000000
	ldsha	[%i1+%o5]0x80,%l0	! %l0 = ffffffffffffff00
!	Mem[0000000030181408] = ffffffffffff8097, %l4 = 00000000ffffffff
	ldxa	[%i6+%o4]0x81,%l4	! %l4 = ffffffffffff8097

p0_label_211:
!	Starting 10 instruction Store Burst
!	%l0 = ffffffffffffff00, %l0 = ffffffffffffff00, %l0 = ffffffffffffff00
	andn	%l0,%l0,%l0		! %l0 = 0000000000000000
!	Mem[0000000030141400] = 00ff0000 ff000000 ff000000 38ff3e85
!	%f0  = 7fffffff a78c9bff c5acff6b 0435525a
!	%f4  = 000000ff 7fffffff 44a491d7 daa64a31
!	%f8  = 95e20f5b 038da6db 000000ff 000000da
!	%f12 = cf70fe60 35bc0000 bb82f03f ff000000
	stda	%f0 ,[%i5+%g0]ASI_BLK_AIUS	! Block Store to 0000000030141400
!	Mem[000000001010140c] = 000000ff, %l3 = ffffff7f, %l7 = 00009b06
	add	%i4,0x0c,%g1
	casa	[%g1]0x80,%l3,%l7	! %l7 = 00000000000000ff
!	%l4 = ffffffffffff8097, Mem[0000000010081404] = 7fffffff, %asi = 80
	stwa	%l4,[%i2+0x004]%asi	! Mem[0000000010081404] = ffff8097
!	Mem[00000000300c1400] = 00000000, %l0 = 0000000000000000
	ldstuba	[%i3+%g0]0x81,%l0	! %l0 = 0000000000000000
!	%l3 = 00000000ffffff7f, Mem[0000000010041408] = 04350000
	stba	%l3,[%i1+%o4]0x88	! Mem[0000000010041408] = 0435007f
!	Mem[0000000020800041] = ffff18e0, %l2 = 00000000000000c5
	ldstub	[%o1+0x041],%l2		! %l2 = 00000000000000ff
!	%f8  = 95e20f5b 038da6db, Mem[0000000030101410] = 00000000 ffffff7f
	stda	%f8 ,[%i4+%o5]0x89	! Mem[0000000030101410] = 95e20f5b 038da6db
!	Mem[0000000010001400] = ff000000, %l6 = 00000000000016ab
	swapa	[%i0+%g0]0x80,%l6	! %l6 = 00000000ff000000
!	Mem[00000000100c1430] = 00009780, %l6 = 00000000ff000000, %asi = 80
	swapa	[%i3+0x030]%asi,%l6	! %l6 = 0000000000009780

p0_label_212:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = ffffffff, %l6 = 0000000000009780
	lduwa	[%i6+%o4]0x88,%l6	! %l6 = 00000000ffffffff
!	%l4 = ffffffffffff8097, immd = 0000000000000e47, %l108 = 0000000000000007
	udivx	%l4,0xe47,%l7		! %l7 = 0011ee35a6c488f7
!	Mem[00000000300c1400] = ff000000, %l3 = 00000000ffffff7f
	lduba	[%i3+%g0]0x81,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030001408] = 000000db, %l6 = 00000000ffffffff
	lduba	[%i0+%o4]0x89,%l6	! %l6 = 00000000000000db
	membar	#Sync			! Added by membar checker (42)
!	Mem[0000000010141408] = c5acff6b, %l0 = 0000000000000000
	lduwa	[%i5+%o4]0x80,%l0	! %l0 = 00000000c5acff6b
!	Mem[0000000010001410] = ff7fffffffff0000, %l7 = 0011ee35a6c488f7
	ldx	[%i0+%o5],%l7		! %l7 = ff7fffffffff0000
!	Mem[0000000030101400] = 80970000, %l4 = ffffffffffff8097
	ldsha	[%i4+%g0]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000030141408] = c5acff6b, %f16 = ffffffff
	lda	[%i5+%o4]0x81,%f16	! %f16 = c5acff6b
!	Mem[00000000100c1410] = 000016ab, %l1 = 0000000000000000
	ldsha	[%i3+%o5]0x88,%l1	! %l1 = 00000000000016ab
!	Mem[0000000030141400] = ffffff7f, %l4 = 0000000000000000
	ldsba	[%i5+%g0]0x89,%l4	! %l4 = 000000000000007f

p0_label_213:
!	Starting 10 instruction Store Burst
!	Mem[0000000030101400] = 80970000, %l6 = 00000000000000db
	ldstuba	[%i4+%g0]0x89,%l6	! %l6 = 0000000000000000
!	%l6 = 0000000000000000, Mem[0000000030041400] = 44a491d7daa64a31
	stxa	%l6,[%i1+%g0]0x89	! Mem[0000000030041400] = 0000000000000000
!	%f2  = c5acff6b 0435525a, Mem[00000000300c1410] = 00000074 0e2308cf
	stda	%f2 ,[%i3+%o5]0x89	! Mem[00000000300c1410] = c5acff6b 0435525a
!	Mem[0000000030141408] = 6bffacc5, %l0 = 00000000c5acff6b
	swapa	[%i5+%o4]0x89,%l0	! %l0 = 000000006bffacc5
!	%l3 = 00000000000000ff, Mem[0000000030101400] = 7e000000809700ff
	stxa	%l3,[%i4+%g0]0x89	! Mem[0000000030101400] = 00000000000000ff
!	Mem[0000000030181400] = ff00a868 ffffffff ffffffff ffff8097
!	%f16 = c5acff6b 0000007e 7fffffff 9780ffff
!	%f20 = ff80ffff 7fffffff 000000ff 00009780
!	%f24 = 00000000 00000000 00009780 ffffffff
!	%f28 = ffffffff 5b0fe295 63ad6ddf 2ca93559
	stda	%f16,[%i6+%g0]ASI_BLK_S	! Block Store to 0000000030181400
	membar	#Sync			! Added by membar checker (43)
!	Mem[0000000010181408] = ffffffff, %l0 = 000000006bffacc5
	swapa	[%i6+%o4]0x88,%l0	! %l0 = 00000000ffffffff
!	%l7 = ff7fffffffff0000, Mem[00000000218001c0] = 2a1d6c90
	sth	%l7,[%o3+0x1c0]		! Mem[00000000218001c0] = 00006c90
!	%l3 = 00000000000000ff, Mem[0000000010141414] = 7fffffff, %asi = 80
	stwa	%l3,[%i5+0x014]%asi	! Mem[0000000010141414] = 000000ff
!	%f0  = 7fffffff, Mem[0000000010141408] = c5acff6b
	sta	%f0 ,[%i5+%o4]0x80	! Mem[0000000010141408] = 7fffffff

p0_label_214:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = 000000ff34ff5573, %f6  = 44a491d7 daa64a31
	ldda	[%i3+%g0]0x80,%f6 	! %f6  = 000000ff 34ff5573
!	Mem[0000000010001410] = ff7fffffffff0000, %f30 = 63ad6ddf 2ca93559
	ldda	[%i0+%o5]0x80,%f30	! %f30 = ff7fffff ffff0000
!	Mem[0000000030081410] = 7e0000ff, %l6 = 0000000000000000
	ldsba	[%i2+%o5]0x89,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010081410] = ff000000, %l6 = ffffffffffffffff
	lduha	[%i2+%o5]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000010181400] = ffffff7f, %l7 = ff7fffffffff0000, %asi = 80
	ldswa	[%i6+0x000]%asi,%l7	! %l7 = ffffffffffffff7f
!	Mem[0000000010101410] = 000000000000ff9b, %f12 = cf70fe60 35bc0000
	ldda	[%i4+%o5]0x88,%f12	! %f12 = 00000000 0000ff9b
!	Mem[0000000010041410] = 000000ff, %l2 = 00000000000000ff
	lduwa	[%i1+%o5]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030041400] = 0000000000000000, %f24 = 00000000 00000000
	ldda	[%i1+%g0]0x81,%f24	! %f24 = 00000000 00000000
!	Mem[0000000010141408] = 7fffffff, %l6 = 0000000000000000
	lduha	[%i5+%o4]0x80,%l6	! %l6 = 0000000000007fff
!	Mem[00000000211c0001] = ffff6b10, %l3 = 00000000000000ff
	ldsb	[%o2+0x001],%l3		! %l3 = ffffffffffffffff

p0_label_215:
!	Starting 10 instruction Store Burst
!	Code Fragment 4, seed = 814174
p0_fragment_15:
!	%l0 = 00000000ffffffff
	setx	0xbbb98b02c9c4d336,%g7,%l0 ! %l0 = bbb98b02c9c4d336
!	%l1 = 00000000000016ab
	setx	0x95a1ea9f9d955a61,%g7,%l1 ! %l1 = 95a1ea9f9d955a61
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = bbb98b02c9c4d336
	setx	0xba4a170cd86ed59c,%g7,%l0 ! %l0 = ba4a170cd86ed59c
!	%l1 = 95a1ea9f9d955a61
	setx	0x03450cb1361c47e7,%g7,%l1 ! %l1 = 03450cb1361c47e7
p0_fragment_15_end:
!	Mem[0000000010001400] = 000016ab, %l5 = 0000000000000000, %asi = 80
	swapa	[%i0+0x000]%asi,%l5	! %l5 = 00000000000016ab
!	Mem[0000000030001400] = 038da6db, %l0 = 00000000d86ed59c
	swapa	[%i0+%g0]0x89,%l0	! %l0 = 00000000038da6db
!	%l5 = 00000000000016ab, Mem[00000000211c0000] = ffff6b10
	stb	%l5,[%o2+%g0]		! Mem[00000000211c0000] = abff6b10
!	Mem[0000000010001410] = ffff7fff, %l3 = ffffffffffffffff
	ldstuba	[%i0+%o5]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030081400] = 000000ff, %l2 = 00000000000000ff
	ldstuba	[%i2+%g0]0x81,%l2	! %l2 = 0000000000000000
!	%f20 = ff80ffff 7fffffff, %l5 = 00000000000016ab
!	Mem[0000000010081418] = 000000ff00000000
	add	%i2,0x018,%g1
	stda	%f20,[%g1+%l5]ASI_PST8_PL ! Mem[0000000010081418] = ffff007f00ff00ff
!	%l2 = 0000000000000000, Mem[0000000030041408] = 00009780
	stwa	%l2,[%i1+%o4]0x89	! Mem[0000000030041408] = 00000000
!	Mem[0000000010101408] = ff25f62d, %l0 = 00000000038da6db
	swapa	[%i4+%o4]0x80,%l0	! %l0 = 00000000ff25f62d
!	%l4 = 000000000000007f, Mem[00000000100c1408] = 00009bff00000000
	stxa	%l4,[%i3+%o4]0x80	! Mem[00000000100c1408] = 000000000000007f

p0_label_216:
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = ff0000ff, %l6 = 0000000000007fff
	ldsha	[%i2+%g0]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000021800140] = 28658430, %l5 = 00000000000016ab
	ldub	[%o3+0x140],%l5		! %l5 = 0000000000000028
!	Mem[000000001010142c] = ffffffff, %l1 = 03450cb1361c47e7
	lduw	[%i4+0x02c],%l1		! %l1 = 00000000ffffffff
!	Mem[0000000030041410] = 73000000, %f24 = 00000000
	lda	[%i1+%o5]0x81,%f24	! %f24 = 73000000
!	Mem[0000000010181410] = ff000000, %l6 = 00000000000000ff
	lduba	[%i6+%o5]0x80,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030041408] = 00000000, %l5 = 0000000000000028
	lduha	[%i1+%o4]0x89,%l5	! %l5 = 0000000000000000
!	%f14 = bb82f03f, %f12 = 00000000 0000ff9b
	fstox	%f14,%f12		! %f12 = 00000000 00000000
!	Mem[0000000030141400] = ffffff7f, %l1 = 00000000ffffffff
	lduha	[%i5+%g0]0x89,%l1	! %l1 = 000000000000ff7f
!	Mem[0000000030141400] = ffffff7f, %l4 = 000000000000007f
	lduwa	[%i5+%g0]0x89,%l4	! %l4 = 00000000ffffff7f
!	Mem[0000000030041410] = 73000000, %f0  = 7fffffff
	lda	[%i1+%o5]0x81,%f0 	! %f0 = 73000000

p0_label_217:
!	Starting 10 instruction Store Burst
!	%l4 = 00000000ffffff7f, Mem[0000000010101400] = 0000007400002865
	stxa	%l4,[%i4+%g0]0x80	! Mem[0000000010101400] = 00000000ffffff7f
!	%f16 = c5acff6b, Mem[0000000010181424] = 5b0fe295
	st	%f16,[%i6+0x024]	! Mem[0000000010181424] = c5acff6b
!	%l2 = 0000000000000000, Mem[00000000300c1400] = 00000000000000ff
	stxa	%l2,[%i3+%g0]0x89	! Mem[00000000300c1400] = 0000000000000000
!	%l0 = 00000000ff25f62d, Mem[0000000010081410] = ff000000
	stha	%l0,[%i2+%o5]0x88	! Mem[0000000010081410] = ff00f62d
!	%f24 = 73000000, Mem[0000000030181408] = 7fffffff
	sta	%f24,[%i6+%o4]0x81	! Mem[0000000030181408] = 73000000
!	%l0 = 00000000ff25f62d, Mem[00000000201c0001] = ffffe880
	stb	%l0,[%o0+0x001]		! Mem[00000000201c0000] = ff2de880
!	%l4 = 00000000ffffff7f, %l2 = 0000000000000000, %l6 = 00000000000000ff
	xnor	%l4,%l2,%l6		! %l6 = ffffffff00000080
!	%f10 = 000000ff, Mem[00000000100c1404] = 34ff5573
	st	%f10,[%i3+0x004]	! Mem[00000000100c1404] = 000000ff
!	%f4  = 000000ff, %f19 = 9780ffff, %f30 = ff7fffff
	fdivs	%f4 ,%f19,%f30		! tt=0x22, %l0 = 00000000ff25f64f
!	%f0  = 73000000 a78c9bff, %l3 = 00000000000000ff
!	Mem[0000000030041430] = ff93f3cc0e23084f
	add	%i1,0x030,%g1
	stda	%f0,[%g1+%l3]ASI_PST16_S ! Mem[0000000030041430] = 73000000a78c9bff

p0_label_218:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101430] = 00000000069b8097, %l0 = 00000000ff25f64f, %asi = 80
	ldxa	[%i4+0x030]%asi,%l0	! %l0 = 00000000069b8097
!	Mem[0000000030081400] = ff0000ff, %l3 = 00000000000000ff
	ldsha	[%i2+%g0]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010041400] = 0000007e, %l2 = 0000000000000000
	ldsba	[%i1+%g0]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000010141410] = ff000000, %l4 = 00000000ffffff7f
	lduwa	[%i5+%o5]0x88,%l4	! %l4 = 00000000ff000000
!	Mem[0000000020800040] = ffff18e0, %l5 = 0000000000000000, %asi = 80
	lduba	[%o1+0x040]%asi,%l5	! %l5 = 00000000000000ff
!	Mem[00000000100c1410] = ab160000, %l3 = 00000000000000ff
	lduba	[%i3+%o5]0x80,%l3	! %l3 = 00000000000000ab
!	Mem[0000000030041408] = 00000000, %l5 = 00000000000000ff
	lduba	[%i1+%o4]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000010181410] = 000000ff, %l4 = 00000000ff000000
	ldswa	[%i6+%o5]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[0000000020800040] = ffff18e0, %l4 = 00000000000000ff, %asi = 80
	lduba	[%o1+0x040]%asi,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010041410] = ff000000, %l5 = 0000000000000000
	lduwa	[%i1+%o5]0x80,%l5	! %l5 = 00000000ff000000

p0_label_219:
!	Starting 10 instruction Store Burst
!	%l5 = 00000000ff000000, Mem[0000000030001400] = d86ed59c
	stba	%l5,[%i0+%g0]0x89	! Mem[0000000030001400] = d86ed500
!	%f0  = 73000000 a78c9bff, Mem[0000000010181400] = ffffff7f 00000000
	stda	%f0 ,[%i6+%g0]0x80	! Mem[0000000010181400] = 73000000 a78c9bff
!	%l3 = 00000000000000ab, Mem[0000000010001408] = 000000ff42d09ae7
	stx	%l3,[%i0+%o4]		! Mem[0000000010001408] = 00000000000000ab
!	Mem[0000000010101410] = 9bff0000, %l5 = 00000000ff000000
	swapa	[%i4+%o5]0x80,%l5	! %l5 = 000000009bff0000
!	%l2 = 00000000, %l3 = 000000ab, Mem[0000000030001400] = 00d56ed8 ff00007e
	stda	%l2,[%i0+%g0]0x81	! Mem[0000000030001400] = 00000000 000000ab
!	Mem[0000000030001410] = 00000000, %l3 = 00000000000000ab
	ldstuba	[%i0+%o5]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000020800041] = ffff18e0, %l7 = ffffffffffffff7f
	ldstub	[%o1+0x041],%l7		! %l7 = 00000000000000ff
!	Mem[0000000030041400] = 00000000, %l5 = 000000009bff0000
	ldstuba	[%i1+%g0]0x89,%l5	! %l5 = 0000000000000000
!	Mem[00000000100c1410] = 000016ab, %l1 = 000000000000ff7f
	swapa	[%i3+%o5]0x88,%l1	! %l1 = 00000000000016ab
!	Mem[0000000010181400] = 00000073, %l5 = 0000000000000000
	ldstuba	[%i6+%g0]0x88,%l5	! %l5 = 0000000000000073

p0_label_220:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = 000000ff, %f27 = ffffffff
	lda	[%i4+%o5]0x88,%f27	! %f27 = 000000ff
!	%f28 = ffffffff, %f4  = 000000ff, %f19 = 9780ffff
	fdivs	%f28,%f4 ,%f19		! %f19 = ffffffff
!	Mem[00000000100c1408] = 00000000, %l4 = 00000000000000ff
	ldsha	[%i3+%o4]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000030081408] = 000000ff, %l7 = 00000000000000ff
	ldsha	[%i2+%o4]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[00000000201c0000] = ff2de880, %l4 = 0000000000000000
	ldsb	[%o0+%g0],%l4		! %l4 = ffffffffffffffff
!	Mem[0000000021800080] = 5baa49a0, %l5 = 0000000000000073, %asi = 80
	ldsha	[%o3+0x080]%asi,%l5	! %l5 = 0000000000005baa
!	Mem[00000000100c1404] = 000000ff, %l7 = 00000000000000ff, %asi = 80
	ldswa	[%i3+0x004]%asi,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010181434] = 00000000, %l6 = ffffffff00000080
	lduw	[%i6+0x034],%l6		! %l6 = 0000000000000000
!	Mem[0000000030141408] = 6bffacc5, %f24 = 73000000
	lda	[%i5+%o4]0x81,%f24	! %f24 = 6bffacc5
!	Mem[0000000030181408] = 730000009780ffff, %f24 = 6bffacc5 00000000
	ldda	[%i6+%o4]0x81,%f24	! %f24 = 73000000 9780ffff

p0_label_221:
!	Starting 10 instruction Store Burst
!	%f7  = 34ff5573, Mem[0000000030041400] = 000000ff
	sta	%f7 ,[%i1+%g0]0x89	! Mem[0000000030041400] = 34ff5573
!	%l0 = 00000000069b8097, Mem[0000000030181400] = c5acff6b0000007e
	stxa	%l0,[%i6+%g0]0x81	! Mem[0000000030181400] = 00000000069b8097
!	%l6 = 0000000000000000, Mem[00000000100c1410] = 7fff0000069b0000
	stxa	%l6,[%i3+%o5]0x80	! Mem[00000000100c1410] = 0000000000000000
!	Mem[0000000030141400] = 7fffffff, %l2 = 0000000000000000
	swapa	[%i5+%g0]0x81,%l2	! %l2 = 000000007fffffff
!	%f16 = c5acff6b 0000007e, Mem[0000000010181408] = 6bffacc5 7e000000
	stda	%f16,[%i6+%o4]0x88	! Mem[0000000010181408] = c5acff6b 0000007e
!	%l2 = 000000007fffffff, imm = 0000000000000a5e, %l0 = 00000000069b8097
	or	%l2,0xa5e,%l0		! %l0 = 000000007fffffff
!	%l5 = 0000000000005baa, Mem[0000000010181410] = 000000ff
	stba	%l5,[%i6+%o5]0x88	! Mem[0000000010181410] = 000000aa
!	Code Fragment 4, seed = 218768
p0_fragment_16:
!	%l0 = 000000007fffffff
	setx	0x50e10d34cdc853a6,%g7,%l0 ! %l0 = 50e10d34cdc853a6
!	%l1 = 00000000000016ab
	setx	0xda034185489dafd1,%g7,%l1 ! %l1 = da034185489dafd1
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 50e10d34cdc853a6
	setx	0x6ce1eaa57bc7f00c,%g7,%l0 ! %l0 = 6ce1eaa57bc7f00c
!	%l1 = da034185489dafd1
	setx	0xed8ef42e440f1757,%g7,%l1 ! %l1 = ed8ef42e440f1757
p0_fragment_16_end:
!	%l1 = ed8ef42e440f1757, Mem[0000000010101410] = ff000000
	stwa	%l1,[%i4+%o5]0x80	! Mem[0000000010101410] = 440f1757
!	Mem[0000000010081424] = ff000000, %l6 = 00000000, %l7 = 000000ff
	add	%i2,0x24,%g1
	casa	[%g1]0x80,%l6,%l7	! %l7 = 00000000ff000000

p0_label_222:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = 00000000, %f16 = c5acff6b
	ld	[%i0+%g0],%f16		! %f16 = 00000000
!	Mem[0000000010101400] = 00000000, %f29 = 5b0fe295
	lda	[%i4+%g0]0x80,%f29	! %f29 = 00000000
!	Mem[0000000030141400] = 00000000, %l4 = ffffffffffffffff
	ldsha	[%i5+%g0]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000030041408] = 00000000, %l4 = 0000000000000000
	ldsba	[%i1+%o4]0x81,%l4	! %l4 = 0000000000000000
!	%f17 = 0000007e, %f16 = 00000000, %f6  = 000000ff 34ff5573
	fsmuld	%f17,%f16,%f6 		! %f6  = 00000000 00000000
!	Mem[0000000030081400] = ff0000ff, %l5 = 0000000000005baa
	ldsba	[%i2+%g0]0x81,%l5	! %l5 = ffffffffffffffff
!	Mem[00000000201c0000] = ff2de880, %l6 = 0000000000000000, %asi = 80
	ldsba	[%o0+0x000]%asi,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010001410] = ffff7fff, %l7 = 00000000ff000000
	lduba	[%i0+%o5]0x88,%l7	! %l7 = 00000000000000ff
!	%l1 = ed8ef42e440f1757, imm = 000000000000095b, %l5 = ffffffffffffffff
	andn	%l1,0x95b,%l5		! %l5 = ed8ef42e440f1604
!	Mem[000000001018141c] = 00000000, %f8  = 95e20f5b
	lda	[%i6+0x01c]%asi,%f8 	! %f8 = 00000000

p0_label_223:
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1400] = 000000ff, %l3 = 0000000000000000
	ldstuba	[%i3+%g0]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000030141408] = 6bffacc5, %l4 = 0000000000000000
	ldstuba	[%i5+%o4]0x81,%l4	! %l4 = 000000000000006b
!	Mem[0000000010001408] = 00000000, %l3 = 0000000000000000
	swapa	[%i0+%o4]0x80,%l3	! %l3 = 0000000000000000
!	%l4 = 000000000000006b, Mem[0000000010041410] = ff000000
	stha	%l4,[%i1+%o5]0x80	! Mem[0000000010041410] = 006b0000
!	Mem[0000000021800000] = 00003940, %l2 = 000000007fffffff
	ldstuba	[%o3+0x000]%asi,%l2	! %l2 = 0000000000000000
!	Mem[0000000010101400] = 00000000 ffffff7f 038da6db 000000ff
!	%f0  = 73000000 a78c9bff c5acff6b 0435525a
!	%f4  = 000000ff 7fffffff 00000000 00000000
!	%f8  = 00000000 038da6db 000000ff 000000da
!	%f12 = 00000000 00000000 bb82f03f ff000000
	stda	%f0 ,[%i4+%g0]ASI_BLK_P	! Block Store to 0000000010101400
!	Mem[000000001014141c] = daa64a31, %l4 = 000000000000006b
	ldstub	[%i5+0x01c],%l4		! %l4 = 00000000000000da
!	%l5 = ed8ef42e440f1604, Mem[0000000010081400] = ff000000
	stba	%l5,[%i2+%g0]0x88	! Mem[0000000010081400] = ff000004
!	%l4 = 00000000000000da, Mem[0000000030081400] = ff0000ff000000ff
	stxa	%l4,[%i2+%g0]0x81	! Mem[0000000030081400] = 00000000000000da
!	Mem[00000000300c1408] = 038da6db, %l2 = 0000000000000000
	swapa	[%i3+%o4]0x89,%l2	! %l2 = 00000000038da6db

p0_label_224:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = ffffffff, %f19 = ffffffff
	lda	[%i2+%o4]0x88,%f19	! %f19 = ffffffff
!	Mem[0000000030181408] = 730000009780ffff, %l1 = ed8ef42e440f1757
	ldxa	[%i6+%o4]0x81,%l1	! %l1 = 730000009780ffff
!	Mem[00000000300c1400] = 00000000, %l3 = 0000000000000000
	lduba	[%i3+%g0]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000010081404] = ffff8097, %l0 = 6ce1eaa57bc7f00c, %asi = 80
	lduha	[%i2+0x004]%asi,%l0	! %l0 = 000000000000ffff
!	Mem[0000000010141424] = 038da6db, %l4 = 00000000000000da
	ldub	[%i5+0x024],%l4		! %l4 = 0000000000000003
	membar	#Sync			! Added by membar checker (44)
!	Mem[0000000010101400] = 00000073, %l4 = 0000000000000003
	ldsba	[%i4+%g0]0x88,%l4	! %l4 = 0000000000000073
!	Mem[0000000030141400] = 00000000, %l1 = 730000009780ffff
	lduba	[%i5+%g0]0x81,%l1	! %l1 = 0000000000000000
!	%f21 = 7fffffff, %f14 = bb82f03f, %f9  = 038da6db
	fdivs	%f21,%f14,%f9 		! %f9  = 7fffffff
!	Mem[0000000030101410] = dba68d03, %l5 = ed8ef42e440f1604
	ldsha	[%i4+%o5]0x81,%l5	! %l5 = ffffffffffffdba6
!	Mem[0000000010081436] = 00000000, %l7 = 00000000000000ff
	ldsh	[%i2+0x036],%l7		! %l7 = 0000000000000000

p0_label_225:
!	Starting 10 instruction Store Burst
!	%f26 = 00009780, %f29 = 00000000
	fsqrts	%f26,%f29		! tt=0x22, %l0 = 0000000000010021
!	%l0 = 00010021, %l1 = 00000000, Mem[0000000010101400] = 00000073 ff9b8ca7
	stda	%l0,[%i4+%g0]0x88	! Mem[0000000010101400] = 00010021 00000000
!	%f22 = 000000ff 00009780, %l4 = 0000000000000073
!	Mem[0000000030001428] = 58fa12e61b1d3f9f
	add	%i0,0x028,%g1
	stda	%f22,[%g1+%l4]ASI_PST32_SL ! Mem[0000000030001428] = 80970000ff000000
!	%f10 = 000000ff 000000da, %l4 = 0000000000000073
!	Mem[0000000030181400] = 00000000069b8097
	stda	%f10,[%i6+%l4]ASI_PST8_S ! Mem[0000000030181400] = 000000ff069b00da
!	Mem[0000000010041418] = ffffffff, %l0 = 0000000000010021
	swap	[%i1+0x018],%l0		! %l0 = 00000000ffffffff
!	%l4 = 0000000000000073, Mem[0000000010001408] = 00000000
	stha	%l4,[%i0+%o4]0x80	! Mem[0000000010001408] = 00730000
!	%l7 = 0000000000000000, %l1 = 0000000000000000, %l1 = 0000000000000000
	andn	%l7,%l1,%l1		! %l1 = 0000000000000000
!	%l5 = ffffffffffffdba6, Mem[0000000030001410] = ff000000
	stha	%l5,[%i0+%o5]0x81	! Mem[0000000030001410] = dba60000
!	Mem[0000000030041410] = 73000000, %l5 = 00000000ffffdba6
	swapa	[%i1+%o5]0x81,%l5	! %l5 = 0000000073000000
!	%l2 = 00000000038da6db, Mem[0000000030101400] = 00000000000000ff
	stxa	%l2,[%i4+%g0]0x89	! Mem[0000000030101400] = 00000000038da6db

p0_label_226:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = 006b0000, %l4 = 0000000000000073
	lduwa	[%i1+%o5]0x80,%l4	! %l4 = 00000000006b0000
!	Mem[0000000030101410] = dba68d03, %l7 = 0000000000000000
	lduwa	[%i4+%o5]0x81,%l7	! %l7 = 00000000dba68d03
!	Mem[00000000100c1430] = ff000000 60fe70cf, %l6 = ffffffff, %l7 = dba68d03
	ldd	[%i3+0x030],%l6		! %l6 = 00000000ff000000 0000000060fe70cf
!	Mem[0000000010101408] = c5acff6b 0435525a, %l2 = 038da6db, %l3 = 00000000
	ldda	[%i4+%o4]0x80,%l2	! %l2 = 00000000c5acff6b 000000000435525a
!	Mem[00000000100c1408] = 00000000, %l7 = 0000000060fe70cf
	ldsha	[%i3+%o4]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000030101400] = 038da6db, %l3 = 000000000435525a
	ldsba	[%i4+%g0]0x89,%l3	! %l3 = ffffffffffffffdb
!	Mem[00000000300c1408] = 00000000, %l6 = 00000000ff000000
	ldsba	[%i3+%o4]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000010181408] = 0000007e, %l6 = 0000000000000000
	lduha	[%i6+%o4]0x88,%l6	! %l6 = 000000000000007e
!	Mem[000000001004140a] = 7f003504, %l4 = 00000000006b0000
	lduh	[%i1+0x00a],%l4		! %l4 = 0000000000003504
!	Mem[000000001010141d] = 00000000, %l5 = 0000000073000000, %asi = 80
	lduba	[%i4+0x01d]%asi,%l5	! %l5 = 0000000000000000

p0_label_227:
!	Starting 10 instruction Store Burst
!	%l3 = ffffffffffffffdb, Mem[0000000010181400] = ff000000
	stba	%l3,[%i6+%g0]0x80	! Mem[0000000010181400] = db000000
!	Mem[000000001010140b] = c5acff6b, %l2 = 00000000c5acff6b
	ldstuba	[%i4+0x00b]%asi,%l2	! %l2 = 000000000000006b
!	%l6 = 0000007e, %l7 = 00000000, Mem[0000000010141410] = 000000ff 000000ff
	std	%l6,[%i5+%o5]		! Mem[0000000010141410] = 0000007e 00000000
!	%f2  = c5acff6b 0435525a, %l1 = 0000000000000000
!	Mem[0000000010181400] = db000000a78c9bff
	stda	%f2,[%i6+%l1]ASI_PST32_P ! Mem[0000000010181400] = db000000a78c9bff
!	Mem[00000000100c1400] = ff0000ff, %l1 = 0000000000000000
	ldstuba	[%i3+%g0]0x88,%l1	! %l1 = 00000000000000ff
!	%l1 = 00000000000000ff, Mem[000000001004140d] = ff0000ff
	stb	%l1,[%i1+0x00d]		! Mem[000000001004140c] = ffff00ff
!	Mem[0000000010141408] = 7fffffff, %l2 = 000000000000006b
	swapa	[%i5+%o4]0x80,%l2	! %l2 = 000000007fffffff
!	%f3  = 0435525a, %f9  = 7fffffff, %f24 = 73000000
	fadds	%f3 ,%f9 ,%f24		! %f24 = 7fffffff
!	Mem[0000000010041408] = 7f003504, %l4 = 00003504, %l5 = 00000000
	add	%i1,0x08,%g1
	casa	[%g1]0x80,%l4,%l5	! %l5 = 000000007f003504
!	%l2 = 7fffffff, %l3 = ffffffdb, Mem[00000000100c1408] = 00000000 0000007f
	stda	%l2,[%i3+%o4]0x80	! Mem[00000000100c1408] = 7fffffff ffffffdb

p0_label_228:
!	Starting 10 instruction Load Burst
!	Mem[0000000030101410] = dba68d03, %l1 = 00000000000000ff
	ldsba	[%i4+%o5]0x81,%l1	! %l1 = ffffffffffffffdb
!	Mem[0000000010101410] = ff000000, %l0 = 00000000ffffffff
	lduwa	[%i4+%o5]0x88,%l0	! %l0 = 00000000ff000000
!	Mem[0000000010041408] = 7f003504ffff00ff, %l2 = 000000007fffffff
	ldxa	[%i1+%o4]0x80,%l2	! %l2 = 7f003504ffff00ff
!	Mem[0000000030141408] = ffffacc50435525a, %f28 = ffffffff 00000000
	ldda	[%i5+%o4]0x81,%f28	! %f28 = ffffacc5 0435525a
!	Code Fragment 4, seed = 601842
p0_fragment_17:
!	%l0 = 00000000ff000000
	setx	0xc8415bf314899296,%g7,%l0 ! %l0 = c8415bf314899296
!	%l1 = ffffffffffffffdb
	setx	0x74a7e688dbb97bc1,%g7,%l1 ! %l1 = 74a7e688dbb97bc1
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = c8415bf314899296
	setx	0x5f0c7627a8fcb8fc,%g7,%l0 ! %l0 = 5f0c7627a8fcb8fc
!	%l1 = 74a7e688dbb97bc1
	setx	0x833b7588a1904d47,%g7,%l1 ! %l1 = 833b7588a1904d47
p0_fragment_17_end:
!	Mem[0000000020800040] = ffff18e0, %l6 = 000000000000007e
	lduh	[%o1+0x040],%l6		! %l6 = 000000000000ffff
!	Mem[0000000030081410] = ff00007e 97809b06, %l4 = 00003504, %l5 = 7f003504
	ldda	[%i2+%o5]0x81,%l4	! %l4 = 00000000ff00007e 0000000097809b06
!	Mem[0000000030181408] = ffff809700000073, %l7 = 0000000000000000
	ldxa	[%i6+%o4]0x89,%l7	! %l7 = ffff809700000073
!	Mem[0000000030001408] = db00000000000000, %f0  = 73000000 a78c9bff
	ldda	[%i0+%o4]0x81,%f0 	! %f0  = db000000 00000000
!	Mem[0000000010041438] = 7e000000, %l6 = 000000000000ffff, %asi = 80
	ldsba	[%i1+0x038]%asi,%l6	! %l6 = 000000000000007e

p0_label_229:
!	Starting 10 instruction Store Burst
!	%l0 = a8fcb8fc, %l1 = a1904d47, Mem[0000000010001400] = 00000000 000000ff
	std	%l0,[%i0+%g0]		! Mem[0000000010001400] = a8fcb8fc a1904d47
!	Mem[00000000300c1400] = 00000000, %l4 = 00000000ff00007e
	swapa	[%i3+%g0]0x81,%l4	! %l4 = 0000000000000000
!	Mem[00000000211c0001] = abff6b10, %l2 = 7f003504ffff00ff
	ldstuba	[%o2+0x001]%asi,%l2	! %l2 = 00000000000000ff
!	%l3 = ffffffffffffffdb, imm = 0000000000000bac, %l3 = ffffffffffffffdb
	add	%l3,0xbac,%l3		! %l3 = 0000000000000b87
!	%f2  = c5acff6b 0435525a, Mem[0000000030041408] = 00000000 000000ff
	stda	%f2 ,[%i1+%o4]0x89	! Mem[0000000030041408] = c5acff6b 0435525a
!	Mem[0000000010141410] = 0000007e, %l5 = 0000000097809b06
	swapa	[%i5+%o5]0x80,%l5	! %l5 = 000000000000007e
!	%l4 = 0000000000000000, immd = 0000000000000974, %l108 = 0000000000000004
	udivx	%l4,0x974,%l4		! %l4 = 0000000000000000
!	%f26 = 00009780 000000ff, Mem[00000000300c1410] = 5a523504 6bffacc5
	stda	%f26,[%i3+%o5]0x81	! Mem[00000000300c1410] = 00009780 000000ff
!	%l4 = 0000000000000000, Mem[0000000020800000] = ffff42b0, %asi = 80
	stba	%l4,[%o1+0x000]%asi	! Mem[0000000020800000] = 00ff42b0
!	Mem[0000000010081408] = ffffffff, %l4 = 0000000000000000
	ldstuba	[%i2+%o4]0x80,%l4	! %l4 = 00000000000000ff

p0_label_230:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = c5acffff, %l5 = 000000000000007e
	ldsha	[%i4+%o4]0x80,%l5	! %l5 = ffffffffffffc5ac
!	%f23 = 00009780, %f18 = 7fffffff, %f1  = 00000000
	fsubs	%f23,%f18,%f1 		! %f1  = 7fffffff
!	Mem[0000000030081410] = ff00007e97809b06, %l2 = 00000000000000ff
	ldxa	[%i2+%o5]0x81,%l2	! %l2 = ff00007e97809b06
!	Mem[00000000100c1408] = ffffff7f, %l2 = ff00007e97809b06
	ldsba	[%i3+%o4]0x88,%l2	! %l2 = 000000000000007f
!	Mem[00000000300c1408] = 00000000, %l7 = ffff809700000073
	lduba	[%i3+%o4]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000030001400] = ab00000000000000, %l7 = 0000000000000000
	ldxa	[%i0+%g0]0x89,%l7	! %l7 = ab00000000000000
!	Mem[0000000030001408] = 000000db, %l5 = ffffffffffffc5ac
	ldsha	[%i0+%o4]0x89,%l5	! %l5 = 00000000000000db
!	Mem[0000000010041408] = 0435007f, %l1 = 833b7588a1904d47
	ldsha	[%i1+%o4]0x88,%l1	! %l1 = 000000000000007f
!	Mem[0000000010101410] = 000000ff, %l5 = 00000000000000db
	lduwa	[%i4+%o5]0x80,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030181408] = 00000073, %l0 = 5f0c7627a8fcb8fc
	ldswa	[%i6+%o4]0x89,%l0	! %l0 = 0000000000000073

p0_label_231:
!	Starting 10 instruction Store Burst
!	%f19 = ffffffff, Mem[0000000030081408] = ff000000
	sta	%f19,[%i2+%o4]0x81	! Mem[0000000030081408] = ffffffff
!	%l6 = 0000007e, %l7 = 00000000, Mem[0000000030081408] = ffffffff 000000ff
	stda	%l6,[%i2+%o4]0x89	! Mem[0000000030081408] = 0000007e 00000000
!	Mem[0000000010001408] = 00007300, %l2 = 000000000000007f
	ldstuba	[%i0+%o4]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000010001400] = a8fcb8fc, %l7 = ab00000000000000
	ldstuba	[%i0+%g0]0x80,%l7	! %l7 = 00000000000000a8
!	%l3 = 0000000000000b87, Mem[0000000030181408] = 00000073
	stba	%l3,[%i6+%o4]0x89	! Mem[0000000030181408] = 00000087
!	%l1 = 000000000000007f, immd = 000008cc, %y  = 00000000
	umul	%l1,0x8cc,%l1		! %l1 = 0000000000045d34, %y = 00000000
!	Mem[0000000030141408] = c5acffff, %l2 = 0000000000000000
	swapa	[%i5+%o4]0x89,%l2	! %l2 = 00000000c5acffff
!	Mem[00000000300c1408] = 00000000, %l3 = 0000000000000b87
	ldstuba	[%i3+%o4]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000010041400] = 0000007e, %l5 = 00000000000000ff
	swapa	[%i1+%g0]0x80,%l5	! %l5 = 000000000000007e
!	Mem[0000000010041400] = 000000ff, %l0 = 0000000000000073
	ldstuba	[%i1+%g0]0x80,%l0	! %l0 = 0000000000000000

p0_label_232:
!	Starting 10 instruction Load Burst
!	Mem[0000000030181410] = ff80ffff, %l2 = 00000000c5acffff
	lduwa	[%i6+%o5]0x81,%l2	! %l2 = 00000000ff80ffff
!	Mem[0000000030001400] = 00000000, %l4 = 00000000000000ff
	ldsha	[%i0+%g0]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000010001400] = fffcb8fc a1904d47, %l2 = ff80ffff, %l3 = 00000000
	ldda	[%i0+%g0]0x80,%l2	! %l2 = 00000000fffcb8fc 00000000a1904d47
!	Mem[000000001000140b] = ff730000, %l2 = 00000000fffcb8fc
	ldub	[%i0+0x00b],%l2		! %l2 = 0000000000000000
!	Mem[0000000010001428] = 000000db00000000, %l7 = 00000000000000a8
	ldx	[%i0+0x028],%l7		! %l7 = 000000db00000000
!	Mem[0000000030141408] = 000000000435525a, %f10 = 000000ff 000000da
	ldda	[%i5+%o4]0x81,%f10	! %f10 = 00000000 0435525a
!	Mem[0000000030001408] = db000000, %l4 = 0000000000000000
	lduwa	[%i0+%o4]0x81,%l4	! %l4 = 00000000db000000
!	Mem[0000000010041410] = 006b0000, %f26 = 00009780
	lda	[%i1+%o5]0x80,%f26	! %f26 = 006b0000
!	Mem[0000000010141428] = 000000ff000000da, %f4  = 000000ff 7fffffff, %asi = 80
	ldda	[%i5+0x028]%asi,%f4 	! %f4  = 000000ff 000000da
!	Mem[0000000010001404] = a1904d47, %l2 = 0000000000000000
	ldub	[%i0+0x004],%l2		! %l2 = 00000000000000a1

p0_label_233:
!	Starting 10 instruction Store Burst
!	%l7 = 000000db00000000, Mem[0000000030041410] = ffffdba68f5ca106
	stxa	%l7,[%i1+%o5]0x81	! Mem[0000000030041410] = 000000db00000000
!	Mem[0000000030041408] = 5a523504, %l7 = 000000db00000000
	ldstuba	[%i1+%o4]0x81,%l7	! %l7 = 000000000000005a
!	%l5 = 000000000000007e, Mem[0000000030041410] = 000000db00000000
	stxa	%l5,[%i1+%o5]0x81	! Mem[0000000030041410] = 000000000000007e
!	Mem[000000001004140c] = ffff00ff, %l0 = 0000000000000000, %asi = 80
	swapa	[%i1+0x00c]%asi,%l0	! %l0 = 00000000ffff00ff
!	%l2 = 000000a1, %l3 = a1904d47, Mem[0000000030081408] = 0000007e 00000000
	stda	%l2,[%i2+%o4]0x89	! Mem[0000000030081408] = 000000a1 a1904d47
!	%l7 = 000000000000005a, Mem[0000000010101400] = 0000000000010021
	stxa	%l7,[%i4+%g0]0x88	! Mem[0000000010101400] = 000000000000005a
!	Mem[000000001018142b] = 00000000, %l6 = 000000000000007e
	ldstuba	[%i6+0x02b]%asi,%l6	! %l6 = 0000000000000000
!	%f26 = 006b0000 000000ff, %l2 = 00000000000000a1
!	Mem[0000000010041428] = 0000000000000073
	add	%i1,0x028,%g1
	stda	%f26,[%g1+%l2]ASI_PST8_P ! Mem[0000000010041428] = 00000000000000ff
!	Mem[00000000211c0001] = abff6b10, %l5 = 000000000000007e
	ldstub	[%o2+0x001],%l5		! %l5 = 00000000000000ff
!	Mem[0000000010101408] = ffffacc5, %l3 = 00000000a1904d47
	ldstuba	[%i4+%o4]0x88,%l3	! %l3 = 00000000000000c5

p0_label_234:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = ff9b8ca7000000db, %f6  = 00000000 00000000
	ldda	[%i6+%g0]0x88,%f6 	! %f6  = ff9b8ca7 000000db
!	Mem[000000001014141d] = ffa64a31, %l6 = 0000000000000000, %asi = 80
	ldsba	[%i5+0x01d]%asi,%l6	! %l6 = ffffffffffffffa6
!	Mem[0000000010041400] = ff0000ff, %l2 = 00000000000000a1
	lduha	[%i1+%g0]0x80,%l2	! %l2 = 000000000000ff00
!	Mem[0000000010081410] = 2df600ff 000016ab, %l2 = 0000ff00, %l3 = 000000c5
	ldda	[%i2+%o5]0x80,%l2	! %l2 = 000000002df600ff 00000000000016ab
!	Mem[0000000030081408] = 000000a1, %l3 = 00000000000016ab
	ldsha	[%i2+%o4]0x89,%l3	! %l3 = 00000000000000a1
!	Mem[00000000100c1410] = 00000000, %l6 = ffffffffffffffa6
	ldswa	[%i3+%o5]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000010101408] = ffacffff, %l6 = 0000000000000000
	ldsha	[%i4+%o4]0x80,%l6	! %l6 = ffffffffffffffac
!	Code Fragment 4, seed = 58342
p0_fragment_18:
!	%l0 = 00000000ffff00ff
	setx	0xc5b8d34dfcd71ef6,%g7,%l0 ! %l0 = c5b8d34dfcd71ef6
!	%l1 = 0000000000045d34
	setx	0xe75d074f8ad0da21,%g7,%l1 ! %l1 = e75d074f8ad0da21
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = c5b8d34dfcd71ef6
	setx	0x52dc452e869d495c,%g7,%l0 ! %l0 = 52dc452e869d495c
!	%l1 = e75d074f8ad0da21
	setx	0x4573c56204db6fa7,%g7,%l1 ! %l1 = 4573c56204db6fa7
p0_fragment_18_end:
!	Mem[0000000010041400] = ff0000ff, %l7 = 000000000000005a, %asi = 80
	lduha	[%i1+0x000]%asi,%l7	! %l7 = 000000000000ff00
!	%l3 = 00000000000000a1, %l3 = 00000000000000a1, %l3 = 00000000000000a1
	andn	%l3,%l3,%l3		! %l3 = 0000000000000000

p0_label_235:
!	Starting 10 instruction Store Burst
!	Mem[00000000201c0001] = ff2de880, %l2 = 000000002df600ff
	ldstuba	[%o0+0x001]%asi,%l2	! %l2 = 000000000000002d
!	%l5 = 00000000000000ff, Mem[0000000010041408] = 7f003504
	stba	%l5,[%i1+%o4]0x80	! Mem[0000000010041408] = ff003504
!	%f29 = 0435525a, Mem[0000000030041410] = 00000000
	sta	%f29,[%i1+%o5]0x89	! Mem[0000000030041410] = 0435525a
!	%l4 = db000000, %l5 = 000000ff, Mem[0000000010181410] = 000000aa 994b9bfe
	stda	%l4,[%i6+%o5]0x88	! Mem[0000000010181410] = db000000 000000ff
!	Mem[0000000030181408] = 87000000, %l6 = 00000000ffffffac
	swapa	[%i6+%o4]0x81,%l6	! %l6 = 0000000087000000
!	%f30 = ff7fffff, Mem[0000000010001410] = ffff7fff
	sta	%f30,[%i0+%o5]0x88	! Mem[0000000010001410] = ff7fffff
!	Mem[0000000010081400] = 040000ff ffff8097 ffffffff ffffff7f
!	%f16 = 00000000 0000007e 7fffffff ffffffff
!	%f20 = ff80ffff 7fffffff 000000ff 00009780
!	%f24 = 7fffffff 9780ffff 006b0000 000000ff
!	%f28 = ffffacc5 0435525a ff7fffff ffff0000
	stda	%f16,[%i2+%g0]ASI_BLK_PL	! Block Store to 0000000010081400
!	%l4 = 00000000db000000, Mem[0000000010041400] = ff0000ff00000000
	stx	%l4,[%i1+%g0]		! Mem[0000000010041400] = 00000000db000000
!	Mem[0000000030101408] = ffffffff, %l6 = 0000000087000000
	ldstuba	[%i4+%o4]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010141434] = 5b0fe295, %l7 = 0000ff00, %l4 = db000000
	add	%i5,0x34,%g1
	casa	[%g1]0x80,%l7,%l4	! %l4 = 000000005b0fe295

p0_label_236:
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = 000000db, %l2 = 000000000000002d
	lduwa	[%i0+%o4]0x89,%l2	! %l2 = 00000000000000db
!	Mem[0000000030041408] = ff523504, %l7 = 000000000000ff00
	lduha	[%i1+%o4]0x81,%l7	! %l7 = 000000000000ff52
!	Mem[0000000030181410] = ffffff7f ffff80ff, %l2 = 000000db, %l3 = 00000000
	ldda	[%i6+%o5]0x89,%l2	! %l2 = 00000000ffff80ff 00000000ffffff7f
!	%l2 = 00000000ffff80ff, imm = 0000000000000a59, %l0 = 52dc452e869d495c
	xor	%l2,0xa59,%l0		! %l0 = 00000000ffff8aa6
!	Mem[00000000300c1410] = 80970000, %l4 = 000000005b0fe295
	ldsba	[%i3+%o5]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000030181400] = ff000000, %l2 = 00000000ffff80ff
	lduba	[%i6+%g0]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000010141410] = 069b8097, %l7 = 000000000000ff52
	lduba	[%i5+%o5]0x88,%l7	! %l7 = 0000000000000097
!	Mem[0000000010041438] = 7e000000 587464ff, %l4 = 00000000, %l5 = 000000ff
	ldd	[%i1+0x038],%l4		! %l4 = 000000007e000000 00000000587464ff
!	Mem[000000001000142c] = 00000000, %l7 = 0000000000000097, %asi = 80
	lduba	[%i0+0x02c]%asi,%l7	! %l7 = 0000000000000000
!	Mem[0000000030041410] = 5a523504, %l4 = 000000007e000000
	lduha	[%i1+%o5]0x81,%l4	! %l4 = 0000000000005a52

p0_label_237:
!	Starting 10 instruction Store Burst
!	%l0 = 00000000ffff8aa6, Mem[0000000030101408] = 7e000000ffffffff
	stxa	%l0,[%i4+%o4]0x89	! Mem[0000000030101408] = 00000000ffff8aa6
!	%f30 = ff7fffff ffff0000, Mem[0000000030181410] = ffff80ff ffffff7f
	stda	%f30,[%i6+%o5]0x89	! Mem[0000000030181410] = ff7fffff ffff0000
!	%l7 = 0000000000000000, Mem[0000000030101410] = dba68d03
	stwa	%l7,[%i4+%o5]0x81	! Mem[0000000030101410] = 00000000
!	%l5 = 00000000587464ff, Mem[00000000100c1408] = 7fffffff
	sth	%l5,[%i3+%o4]		! Mem[00000000100c1408] = 64ffffff
!	Mem[00000000100c1410] = 00000000, %l3 = 00000000ffffff7f
	swapa	[%i3+%o5]0x80,%l3	! %l3 = 0000000000000000
	membar	#Sync			! Added by membar checker (45)
!	Mem[0000000010081410] = ffffff7f, %l2 = 0000000000000000
	ldstuba	[%i2+%o5]0x80,%l2	! %l2 = 00000000000000ff
!	Mem[00000000201c0000] = ffffe880, %l5 = 00000000587464ff
	ldstuba	[%o0+0x000]%asi,%l5	! %l5 = 00000000000000ff
!	%f26 = 006b0000 000000ff, Mem[0000000030001408] = 000000db 00000000
	stda	%f26,[%i0+%o4]0x89	! Mem[0000000030001408] = 006b0000 000000ff
!	Code Fragment 3, seed = 849281
p0_fragment_19:
!	%l0 = 00000000ffff8aa6
	setx	0xda2d21085be21d1e,%g7,%l0 ! %l0 = da2d21085be21d1e
!	%l1 = 4573c56204db6fa7
	setx	0x21fe3eb0d6649fc9,%g7,%l1 ! %l1 = 21fe3eb0d6649fc9
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = da2d21085be21d1e
	setx	0x0d9471645d953e84,%g7,%l0 ! %l0 = 0d9471645d953e84
!	%l1 = 21fe3eb0d6649fc9
	setx	0x8750d1b581567c4f,%g7,%l1 ! %l1 = 8750d1b581567c4f
p0_fragment_19_end:
!	%f6  = ff9b8ca7 000000db, Mem[0000000030041400] = 34ff5573 00000000
	stda	%f6 ,[%i1+%g0]0x89	! Mem[0000000030041400] = ff9b8ca7 000000db

p0_label_238:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = 0000ffff ff7fffff, %l6 = 000000ff, %l7 = 00000000
	ldda	[%i0+%o5]0x88,%l6	! %l6 = 00000000ff7fffff 000000000000ffff
!	Mem[0000000010081410] = ffffff7f, %l5 = 00000000000000ff
	lduha	[%i2+%o5]0x80,%l5	! %l5 = 000000000000ffff
!	Mem[00000000100c141c] = d791a444, %f23 = 00009780
	ld	[%i3+0x01c],%f23	! %f23 = d791a444
!	Mem[0000000030101408] = a68affff00000000, %f18 = 7fffffff ffffffff
	ldda	[%i4+%o4]0x81,%f18	! %f18 = a68affff 00000000
!	Mem[0000000010141404] = a78c9bff, %l3 = 0000000000000000
	lduw	[%i5+0x004],%l3		! %l3 = 00000000a78c9bff
!	%f3  = 0435525a, %f7  = 000000db, %f12 = 00000000
	fdivs	%f3 ,%f7 ,%f12		! tt=0x22, %l0 = 0d9471645d953ea6
!	Mem[0000000020800000] = 00ff42b0, %l5 = 000000000000ffff
	lduh	[%o1+%g0],%l5		! %l5 = 00000000000000ff
!	Mem[0000000010081408] = ffffffff, %l1 = 8750d1b581567c4f
	lduba	[%i2+%o4]0x80,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030181408] = ffffffac, %l3 = 00000000a78c9bff
	lduha	[%i6+%o4]0x81,%l3	! %l3 = 000000000000ffff
!	Mem[00000000100c1408] = ffffff64, %l6 = 00000000ff7fffff
	lduha	[%i3+%o4]0x88,%l6	! %l6 = 000000000000ff64

p0_label_239:
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000005a52, Mem[00000000201c0000] = ffffe880, %asi = 80
	stba	%l4,[%o0+0x000]%asi	! Mem[00000000201c0000] = 52ffe880
!	Mem[0000000030081410] = 7e0000ff, %l5 = 00000000000000ff
	swapa	[%i2+%o5]0x89,%l5	! %l5 = 000000007e0000ff
!	%l2 = 00000000000000ff, Mem[00000000211c0001] = abff6b10
	stb	%l2,[%o2+0x001]		! Mem[00000000211c0000] = abff6b10
!	%l6 = 000000000000ff64, Mem[0000000010141410] = 069b8097
	stha	%l6,[%i5+%o5]0x88	! Mem[0000000010141410] = 069bff64
!	%l3 = 000000000000ffff, Mem[0000000030181408] = ffff8097acffffff
	stxa	%l3,[%i6+%o4]0x89	! Mem[0000000030181408] = 000000000000ffff
!	%l7 = 000000000000ffff, Mem[0000000030001400] = 00000000
	stha	%l7,[%i0+%g0]0x81	! Mem[0000000030001400] = ffff0000
!	%f24 = 7fffffff, Mem[0000000010141414] = 00000000
	sta	%f24,[%i5+0x014]%asi	! Mem[0000000010141414] = 7fffffff
!	Mem[00000000300c1410] = 80970000, %l0 = 000000005d953ea6
	swapa	[%i3+%o5]0x89,%l0	! %l0 = 0000000080970000
!	%l0 = 80970000, %l1 = 000000ff, Mem[0000000010081400] = 0000007e 00000000
	stda	%l0,[%i2+%g0]0x88	! Mem[0000000010081400] = 80970000 000000ff
!	Mem[0000000010141414] = 7fffffff, %l7 = 000000000000ffff, %asi = 80
	swapa	[%i5+0x014]%asi,%l7	! %l7 = 000000007fffffff

p0_label_240:
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = ff523504, %l0 = 0000000080970000
	ldsba	[%i1+%o4]0x81,%l0	! %l0 = ffffffffffffffff
!	Mem[00000000201c0000] = 52ffe880, %l2 = 00000000000000ff
	ldub	[%o0+%g0],%l2		! %l2 = 0000000000000052
!	Mem[00000000100c1410] = ffffff7f 00000000, %l6 = 0000ff64, %l7 = 7fffffff, %asi = 80
	ldda	[%i3+0x010]%asi,%l6	! %l6 = 00000000ffffff7f 0000000000000000
!	Mem[0000000010041400] = 00000000, %l4 = 0000000000005a52
	lduba	[%i1+%g0]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000010101410] = ff000000, %l0 = ffffffffffffffff
	lduba	[%i4+%o5]0x88,%l0	! %l0 = 0000000000000000
!	Mem[000000001010141c] = 00000000, %l1 = 00000000000000ff
	lduw	[%i4+0x01c],%l1		! %l1 = 0000000000000000
!	Mem[0000000010001430] = 00000000, %l2 = 0000000000000052, %asi = 80
	ldsha	[%i0+0x030]%asi,%l2	! %l2 = 0000000000000000
!	Mem[0000000010101428] = 000000ff, %l1 = 0000000000000000, %asi = 80
	lduwa	[%i4+0x028]%asi,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010141400] = 7fffffffa78c9bff, %f30 = ff7fffff ffff0000
	ldda	[%i5+%g0]0x80,%f30	! %f30 = 7fffffff a78c9bff
!	Mem[0000000010101410] = 000000ff, %l6 = 00000000ffffff7f
	lduha	[%i4+%o5]0x80,%l6	! %l6 = 0000000000000000

p0_label_241:
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000000000, Mem[0000000030081400] = 00000000
	stwa	%l4,[%i2+%g0]0x81	! Mem[0000000030081400] = 00000000
!	%l1 = 00000000000000ff, Mem[0000000010081408] = ffffffff
	stba	%l1,[%i2+%o4]0x80	! Mem[0000000010081408] = ffffffff
!	%l5 = 000000007e0000ff, Mem[00000000100c1408] = ffffff64
	stha	%l5,[%i3+%o4]0x88	! Mem[00000000100c1408] = ffff00ff
!	%f10 = 00000000 0435525a, Mem[0000000010181400] = db000000 a78c9bff
	stda	%f10,[%i6+%g0]0x80	! Mem[0000000010181400] = 00000000 0435525a
!	%f30 = 7fffffff, Mem[0000000010181400] = 00000000
	sta	%f30,[%i6+%g0]0x80	! Mem[0000000010181400] = 7fffffff
!	%l6 = 0000000000000000, imm = 00000000000009ae, %l1 = 00000000000000ff
	xor	%l6,0x9ae,%l1		! %l1 = 00000000000009ae
!	%l4 = 00000000, %l5 = 7e0000ff, Mem[00000000300c1410] = 5d953ea6 ff000000
	stda	%l4,[%i3+%o5]0x89	! Mem[00000000300c1410] = 00000000 7e0000ff
!	%l0 = 00000000, %l1 = 000009ae, Mem[0000000010081408] = ffffffff ffffff7f
	stda	%l0,[%i2+%o4]0x80	! Mem[0000000010081408] = 00000000 000009ae
!	%l1 = 00000000000009ae, Mem[0000000030001408] = 006b0000000000ff
	stxa	%l1,[%i0+%o4]0x89	! Mem[0000000030001408] = 00000000000009ae
!	Mem[0000000030101400] = dba68d03, %l3 = 000000000000ffff
	swapa	[%i4+%g0]0x81,%l3	! %l3 = 00000000dba68d03

p0_label_242:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = ffffff7fffff80ff, %l1 = 00000000000009ae
	ldx	[%i2+%o5],%l1		! %l1 = ffffff7fffff80ff
!	Mem[0000000030081408] = a1000000474d90a1, %l3 = 00000000dba68d03
	ldxa	[%i2+%o4]0x81,%l3	! %l3 = a1000000474d90a1
!	Mem[000000001004140a] = ff003504, %l1 = ffffff7fffff80ff, %asi = 80
	lduba	[%i1+0x00a]%asi,%l1	! %l1 = 0000000000000035
!	Mem[0000000030041400] = db000000, %l5 = 000000007e0000ff
	ldsha	[%i1+%g0]0x81,%l5	! %l5 = ffffffffffffdb00
!	Mem[0000000030081400] = da000000 00000000, %l2 = 00000000, %l3 = 474d90a1
	ldda	[%i2+%g0]0x89,%l2	! %l2 = 0000000000000000 00000000da000000
!	%l1 = 0000000000000035, imm = fffffffffffffc47, %l1 = 0000000000000035
	xor	%l1,-0x3b9,%l1		! %l1 = fffffffffffffc72
!	Mem[0000000010101420] = 00000000 038da6db, %l4 = 00000000, %l5 = ffffdb00, %asi = 80
	ldda	[%i4+0x020]%asi,%l4	! %l4 = 0000000000000000 00000000038da6db
!	Mem[0000000030181408] = 000000000000ffff, %f18 = a68affff 00000000
	ldda	[%i6+%o4]0x89,%f18	! %f18 = 00000000 0000ffff
!	Mem[0000000030181410] = 0000ffff, %l6 = 0000000000000000
	ldsba	[%i6+%o5]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000010001400] = 474d90a1 fcb8fcff, %l6 = 00000000, %l7 = 00000000
	ldda	[%i0+%g0]0x88,%l6	! %l6 = 00000000fcb8fcff 00000000474d90a1

p0_label_243:
!	Starting 10 instruction Store Burst
!	%l7 = 00000000474d90a1, Mem[00000000201c0000] = 52ffe880
	sth	%l7,[%o0+%g0]		! Mem[00000000201c0000] = 90a1e880
!	Mem[0000000010081410] = 7fffffff, %l4 = 0000000000000000
	ldstuba	[%i2+%o5]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[0000000020800000] = 00ff42b0, %l4 = 00000000000000ff
	ldstuba	[%o1+0x000]%asi,%l4	! %l4 = 0000000000000000
!	Mem[0000000010041400] = 00000000, %l0 = 0000000000000000
	swapa	[%i1+%g0]0x80,%l0	! %l0 = 0000000000000000
!	%f6  = ff9b8ca7 000000db, Mem[0000000030001410] = dba60000 a6da9b06
	stda	%f6 ,[%i0+%o5]0x81	! Mem[0000000030001410] = ff9b8ca7 000000db
!	%l4 = 0000000000000000, Mem[00000000100c1408] = ffff00ff
	stwa	%l4,[%i3+%o4]0x88	! Mem[00000000100c1408] = 00000000
!	%l4 = 0000000000000000, imm = fffffffffffff34b, %l0 = 0000000000000000
	subc	%l4,-0xcb5,%l0		! %l0 = 0000000000000cb5
!	%l2 = 0000000000000000, Mem[00000000211c0000] = abff6b10
	sth	%l2,[%o2+%g0]		! Mem[00000000211c0000] = 00006b10
!	%l4 = 00000000, %l5 = 038da6db, Mem[0000000010041408] = 043500ff 00000000
	stda	%l4,[%i1+%o4]0x88	! Mem[0000000010041408] = 00000000 038da6db
!	%f16 = 00000000, Mem[0000000030041400] = 000000db
	sta	%f16,[%i1+%g0]0x89	! Mem[0000000030041400] = 00000000

p0_label_244:
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = 90a1e880, %l3 = 00000000da000000
	lduh	[%o0+%g0],%l3		! %l3 = 00000000000090a1
!	Mem[0000000010141410] = 64ff9b06, %l3 = 00000000000090a1
	ldswa	[%i5+%o5]0x80,%l3	! %l3 = 0000000064ff9b06
!	%l3 = 0000000064ff9b06, %l7 = 00000000474d90a1, %y  = 00000000
	sdiv	%l3,%l7,%l3		! %l3 = 0000000000000001
	mov	%l0,%y			! %y = 00000cb5
!	Mem[000000001008143a] = 0000ffff, %l1 = fffffffffffffc72
	ldsb	[%i2+0x03a],%l1		! %l1 = ffffffffffffffff
!	Mem[0000000010081428] = ff00000000006b00, %f24 = 7fffffff 9780ffff, %asi = 80
	ldda	[%i2+0x028]%asi,%f24	! %f24 = ff000000 00006b00
	membar	#Sync			! Added by membar checker (46)
!	Mem[0000000010081400] = 00009780 ff000000 00000000 000009ae
!	Mem[0000000010081410] = ffffff7f ffff80ff 80970000 ff000000
!	Mem[0000000010081420] = ffff8097 ffffff7f ff000000 00006b00
!	Mem[0000000010081430] = 5a523504 c5acffff 0000ffff ffff7fff
	ldda	[%i2+%g0]ASI_BLK_AIUPL,%f0 	! Block Load from 0000000010081400
!	Mem[0000000010081410] = ffffff7f, %l4 = 0000000000000000
	ldsba	[%i2+%o5]0x80,%l4	! %l4 = ffffffffffffffff
!	Mem[00000000100c1400] = ff0000ff000000ff, %f26 = 006b0000 000000ff
	ldda	[%i3+%g0]0x80,%f26	! %f26 = ff0000ff 000000ff
!	Mem[0000000030041408] = c5acff6b043552ff, %f22 = 000000ff d791a444
	ldda	[%i1+%o4]0x89,%f22	! %f22 = c5acff6b 043552ff
!	Mem[0000000010141400] = 7fffffff, %l1 = ffffffffffffffff
	ldswa	[%i5+%g0]0x80,%l1	! %l1 = 000000007fffffff

p0_label_245:
!	Starting 10 instruction Store Burst
!	%l2 = 0000000000000000, Mem[0000000010041410] = 00006b00
	stha	%l2,[%i1+%o5]0x88	! Mem[0000000010041410] = 00000000
!	%l5 = 00000000038da6db, imm = fffffffffffff976, %l6 = 00000000fcb8fcff
	xor	%l5,-0x68a,%l6		! %l6 = fffffffffc725fad
!	Mem[0000000030181400] = ff000000, %l0 = 0000000000000cb5
	swapa	[%i6+%g0]0x89,%l0	! %l0 = 00000000ff000000
!	%f9  = 9780ffff, Mem[0000000010141434] = 5b0fe295
	sta	%f9 ,[%i5+0x034]%asi	! Mem[0000000010141434] = 9780ffff
	membar	#Sync			! Added by membar checker (47)
!	%f18 = 00000000 0000ffff, %l5 = 00000000038da6db
!	Mem[0000000010081430] = 5a523504c5acffff
	add	%i2,0x030,%g1
	stda	%f18,[%g1+%l5]ASI_PST8_P ! Mem[0000000010081430] = 0000350000acffff
!	Mem[0000000010141408] = 6b000000, %l6 = 00000000fc725fad
	swapa	[%i5+%o4]0x88,%l6	! %l6 = 000000006b000000
!	%l1 = 000000007fffffff, Mem[0000000010101408] = ffacffff
	stha	%l1,[%i4+%o4]0x80	! Mem[0000000010101408] = ffffffff
!	%l2 = 00000000, %l3 = 00000001, Mem[00000000300c1408] = 000000ff 95e20f5b
	stda	%l2,[%i3+%o4]0x89	! Mem[00000000300c1408] = 00000000 00000001
!	%l2 = 0000000000000000, Mem[0000000010141408] = ad5f72fc
	stba	%l2,[%i5+%o4]0x80	! Mem[0000000010141408] = 005f72fc
!	Mem[0000000010001410] = ffff7fff, %l2 = 0000000000000000
	ldstuba	[%i0+%o5]0x80,%l2	! %l2 = 00000000000000ff

p0_label_246:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = ff7fffff, %l6 = 000000006b000000
	ldsha	[%i0+%o5]0x88,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010081423] = ffff8097, %l3 = 0000000000000001
	ldub	[%i2+0x023],%l3		! %l3 = 0000000000000097
!	Mem[0000000010141408] = fc725f00, %f20 = ff80ffff
	lda	[%i5+%o4]0x88,%f20	! %f20 = fc725f00
!	Mem[0000000010081408] = 00000000, %l2 = 00000000000000ff
	ldsba	[%i2+%o4]0x88,%l2	! %l2 = 0000000000000000
!	%l4 = ffffffffffffffff, immd = ffffffd8, %y  = 00000cb5
	udiv	%l4,-0x028,%l0		! %l0 = 0000000000000cb6
	mov	%l0,%y			! %y = 00000cb6
!	Mem[0000000020800000] = ffff42b0, %l2 = 0000000000000000, %asi = 80
	lduha	[%o1+0x000]%asi,%l2	! %l2 = 000000000000ffff
!	Mem[00000000100c1400] = ff0000ff, %l4 = ffffffffffffffff
	ldsha	[%i3+%g0]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[000000001008143a] = 0000ffff, %l7 = 00000000474d90a1
	lduh	[%i2+0x03a],%l7		! %l7 = 000000000000ffff
!	Mem[0000000030181410] = 0000ffff, %l5 = 00000000038da6db
	ldsba	[%i6+%o5]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000021800140] = 28658430, %l3 = 0000000000000097
	ldub	[%o3+0x140],%l3		! %l3 = 0000000000000028

p0_label_247:
!	Starting 10 instruction Store Burst
!	%f19 = 0000ffff, Mem[0000000010001408] = 000073ff
	sta	%f19,[%i0+%o4]0x88	! Mem[0000000010001408] = 0000ffff
!	%l0 = 0000000000000cb6, Mem[0000000010081408] = 00000000
	stha	%l0,[%i2+%o4]0x80	! Mem[0000000010081408] = 0cb60000
!	Mem[0000000010001410] = ff7fffff, %l6 = ffffffffffffffff
	ldstuba	[%i0+%o5]0x88,%l6	! %l6 = 00000000000000ff
!	%l0 = 00000cb6, %l1 = 7fffffff, Mem[0000000030141408] = 00000000 5a523504
	stda	%l0,[%i5+%o4]0x89	! Mem[0000000030141408] = 00000cb6 7fffffff
!	Mem[00000000300c1400] = ff00007e, %l5 = 0000000000000000
	ldstuba	[%i3+%g0]0x81,%l5	! %l5 = 00000000000000ff
!	%f19 = 0000ffff, Mem[00000000300c1408] = 00000000
	sta	%f19,[%i3+%o4]0x89	! Mem[00000000300c1408] = 0000ffff
!	%f30 = 7fffffff a78c9bff, Mem[00000000300c1400] = ff00007e 00000000
	stda	%f30,[%i3+%g0]0x81	! Mem[00000000300c1400] = 7fffffff a78c9bff
!	%f3  = 00000000, Mem[00000000300c1408] = ffff0000
	sta	%f3 ,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00000000
!	%l6 = 00000000000000ff, Mem[00000000100c1408] = 00000000
	stba	%l6,[%i3+%o4]0x88	! Mem[00000000100c1408] = 000000ff
!	Mem[0000000030101408] = ffff8aa6, %l5 = 00000000000000ff
	swapa	[%i4+%o4]0x89,%l5	! %l5 = 00000000ffff8aa6

p0_label_248:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181434] = 00000000, %l7 = 000000000000ffff, %asi = 80
	lduwa	[%i6+0x034]%asi,%l7	! %l7 = 0000000000000000
!	Mem[0000000010141400] = 7fffffff, %l3 = 0000000000000028
	lduha	[%i5+%g0]0x80,%l3	! %l3 = 0000000000007fff
!	Mem[0000000030141400] = 00000000, %l1 = 000000007fffffff
	ldsba	[%i5+%g0]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000030081400] = 00000000, %l6 = 00000000000000ff
	lduwa	[%i2+%g0]0x89,%l6	! %l6 = 0000000000000000
!	Mem[00000000201c0000] = 90a1e880, %l1 = 0000000000000000, %asi = 80
	ldsba	[%o0+0x000]%asi,%l1	! %l1 = ffffffffffffff90
!	Mem[00000000201c0000] = 90a1e880, %l6 = 0000000000000000
	ldsh	[%o0+%g0],%l6		! %l6 = ffffffffffff90a1
!	%l1 = ffffffffffffff90, %l5 = 00000000ffff8aa6, %l7 = 0000000000000000
	xor	%l1,%l5,%l7		! %l7 = ffffffff00007536
!	Mem[0000000030081410] = 069b8097000000ff, %l6 = ffffffffffff90a1
	ldxa	[%i2+%o5]0x89,%l6	! %l6 = 069b8097000000ff
!	Mem[0000000010081400] = 00009780, %l4 = 00000000000000ff
	ldsba	[%i2+%g0]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000010041400] = 00000000, %l5 = 00000000ffff8aa6
	ldsba	[%i1+%g0]0x88,%l5	! %l5 = 0000000000000000

p0_label_249:
!	Starting 10 instruction Store Burst
!	%f22 = c5acff6b 043552ff, %l4 = 0000000000000000
!	Mem[00000000100c1438] = 0a80ccb23ff082bb
	add	%i3,0x038,%g1
	stda	%f22,[%g1+%l4]ASI_PST32_PL ! Mem[00000000100c1438] = 0a80ccb23ff082bb
!	Mem[0000000010001408] = ffff0000, %l1 = ffffffffffffff90
	ldstuba	[%i0+%o4]0x80,%l1	! %l1 = 00000000000000ff
!	%l2 = 000000000000ffff, Mem[0000000010081410] = ff80ffff7fffffff
	stxa	%l2,[%i2+%o5]0x88	! Mem[0000000010081410] = 000000000000ffff
!	%f24 = ff000000, Mem[0000000030001410] = a78c9bff
	sta	%f24,[%i0+%o5]0x89	! Mem[0000000030001410] = ff000000
!	%f0  = 000000ff, Mem[000000001000143c] = 0000007e
	st	%f0 ,[%i0+0x03c]	! Mem[000000001000143c] = 000000ff
!	%f16 = 00000000 0000007e, Mem[0000000010101408] = ffffffff 5a523504
	stda	%f16,[%i4+%o4]0x88	! Mem[0000000010101408] = 00000000 0000007e
!	%l2 = 000000000000ffff, Mem[00000000201c0000] = 90a1e880, %asi = 80
	stha	%l2,[%o0+0x000]%asi	! Mem[00000000201c0000] = ffffe880
!	Mem[0000000010081408] = 0000b60c, %l5 = 0000000000000000
	swapa	[%i2+%o4]0x88,%l5	! %l5 = 000000000000b60c
!	%l1 = 00000000000000ff, Mem[0000000010081428] = ff00000000006b00
	stx	%l1,[%i2+0x028]		! Mem[0000000010081428] = 00000000000000ff
!	%l5 = 000000000000b60c, Mem[0000000030141410] = ff000000
	stwa	%l5,[%i5+%o5]0x89	! Mem[0000000030141410] = 0000b60c

p0_label_250:
!	Starting 10 instruction Load Burst
!	Mem[0000000021800101] = ffff4a00, %l1 = 00000000000000ff, %asi = 80
	lduba	[%o3+0x101]%asi,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030001400] = ffff0000, %f1  = 80970000
	lda	[%i0+%g0]0x81,%f1 	! %f1 = ffff0000
!	Mem[0000000030041408] = ff523504, %l3 = 0000000000007fff
	ldswa	[%i1+%o4]0x81,%l3	! %l3 = ffffffffff523504
!	Mem[0000000010041410] = 00000000, %l7 = ffffffff00007536
	lduwa	[%i1+%o5]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000010041400] = 00000000, %l2 = 000000000000ffff
	lduha	[%i1+%g0]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000010101410] = 000000ff, %l0 = 0000000000000cb6
	ldswa	[%i4+%o5]0x80,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030081400] = 00000000 000000da, %l2 = 00000000, %l3 = ff523504
	ldda	[%i2+%g0]0x81,%l2	! %l2 = 0000000000000000 00000000000000da
!	Mem[00000000300c1408] = 0000000001000000, %l2 = 0000000000000000
	ldxa	[%i3+%o4]0x81,%l2	! %l2 = 0000000001000000
!	Mem[000000001004142c] = 000000ff, %l1 = 00000000000000ff
	ldsw	[%i1+0x02c],%l1		! %l1 = 00000000000000ff
!	Mem[0000000021800100] = ffff4a00, %l4 = 0000000000000000
	ldub	[%o3+0x100],%l4		! %l4 = 00000000000000ff

p0_label_251:
!	Starting 10 instruction Store Burst
!	%l1 = 00000000000000ff, Mem[0000000010041418] = 00010021ffffffff
	stx	%l1,[%i1+0x018]		! Mem[0000000010041418] = 00000000000000ff
!	%f13 = 0435525a, Mem[00000000300c1410] = 00000000
	sta	%f13,[%i3+%o5]0x81	! Mem[00000000300c1410] = 0435525a
!	Mem[000000001008143f] = ffff7fff, %l5 = 000000000000b60c
	ldstuba	[%i2+0x03f]%asi,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010181400] = 7fffffff, %l5 = 00000000000000ff
	ldstuba	[%i6+%g0]0x80,%l5	! %l5 = 000000000000007f
!	%l5 = 000000000000007f, Mem[00000000100c1416] = 00000000, %asi = 80
	stha	%l5,[%i3+0x016]%asi	! Mem[00000000100c1414] = 0000007f
!	Mem[0000000030141410] = 0000b60c, %l3 = 00000000000000da
	swapa	[%i5+%o5]0x89,%l3	! %l3 = 000000000000b60c
!	%f21 = 7fffffff, Mem[0000000030101400] = ffff0000
	sta	%f21,[%i4+%g0]0x89	! Mem[0000000030101400] = 7fffffff
!	%f26 = ff0000ff 000000ff, %l3 = 000000000000b60c
!	Mem[0000000010101420] = 00000000038da6db
	add	%i4,0x020,%g1
	stda	%f26,[%g1+%l3]ASI_PST8_P ! Mem[0000000010101420] = 000000000000a6db
!	%l2 = 0000000001000000, Mem[0000000030001400] = 0000ffff
	stba	%l2,[%i0+%g0]0x89	! Mem[0000000030001400] = 0000ff00
!	Mem[0000000010081400] = 00009780, %l3 = 000000000000b60c
	ldstuba	[%i2+%g0]0x80,%l3	! %l3 = 0000000000000000

p0_label_252:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = ff0000ff, %l5 = 000000000000007f
	lduba	[%i3+%g0]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[00000000300c1408] = 00000000, %l7 = 0000000000000000
	lduba	[%i3+%o4]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000030141410] = da000000, %l0 = 00000000000000ff
	ldswa	[%i5+%o5]0x81,%l0	! %l0 = ffffffffda000000
!	Mem[00000000100c1410] = ffffff7f, %l3 = 0000000000000000
	ldsba	[%i3+%o5]0x80,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010041410] = 00000000 000000ff, %l0 = da000000, %l1 = 000000ff
	ldda	[%i1+%o5]0x80,%l0	! %l0 = 0000000000000000 00000000000000ff
!	Mem[0000000010001410] = 0000ffff ff7fffff, %l4 = 000000ff, %l5 = 000000ff
	ldda	[%i0+%o5]0x88,%l4	! %l4 = 00000000ff7fffff 000000000000ffff
!	Mem[0000000010041410] = 00000000, %l4 = 00000000ff7fffff
	lduha	[%i1+%o5]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000030081400] = 00000000000000da, %l7 = 0000000000000000
	ldxa	[%i2+%g0]0x81,%l7	! %l7 = 00000000000000da
!	Mem[00000000100c1408] = 000000ff, %l2 = 0000000001000000
	lduwa	[%i3+%o4]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010001419] = a7ffff69, %l5 = 000000000000ffff
	ldsb	[%i0+0x019],%l5		! %l5 = ffffffffffffffff

p0_label_253:
!	Starting 10 instruction Store Burst
!	%l4 = 00000000, %l5 = ffffffff, Mem[0000000010101400] = 5a000000 00000000
	stda	%l4,[%i4+%g0]0x80	! Mem[0000000010101400] = 00000000 ffffffff
!	%l0 = 0000000000000000, Mem[0000000010141400] = ffffff7f
	stba	%l0,[%i5+%g0]0x88	! Mem[0000000010141400] = ffffff00
!	%f16 = 00000000, Mem[0000000030081408] = 000000a1
	sta	%f16,[%i2+%o4]0x89	! Mem[0000000030081408] = 00000000
!	%f24 = ff000000 00006b00, Mem[0000000030141400] = 00000000 a78c9bff
	stda	%f24,[%i5+%g0]0x81	! Mem[0000000030141400] = ff000000 00006b00
!	%l7 = 00000000000000da, Mem[0000000030141400] = 000000ff
	stba	%l7,[%i5+%g0]0x89	! Mem[0000000030141400] = 000000da
!	Mem[0000000030101400] = 7fffffff, %l7 = 00000000000000da
	swapa	[%i4+%g0]0x89,%l7	! %l7 = 000000007fffffff
!	%f18 = 00000000, Mem[00000000100c1410] = 7fffffff
	sta	%f18,[%i3+%o5]0x88	! Mem[00000000100c1410] = 00000000
!	%l7 = 000000007fffffff, Mem[0000000010081410] = 0000ffff
	stwa	%l7,[%i2+%o5]0x88	! Mem[0000000010081410] = 7fffffff
!	%f28 = ffffacc5, %f11 = 000000ff, %f25 = 00006b00
	fadds	%f28,%f11,%f25		! %f25 = ffffacc5
!	Mem[0000000010001410] = ffff7fff, %l3 = ffffffffffffffff
	ldstuba	[%i0+%o5]0x80,%l3	! %l3 = 00000000000000ff

p0_label_254:
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = 000000ff, %l6 = 069b8097000000ff
	ldsba	[%i0+%o5]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000010001408] = ab000000 0000ffff, %l6 = 00000000, %l7 = 7fffffff
	ldda	[%i0+%o4]0x88,%l6	! %l6 = 000000000000ffff 00000000ab000000
!	Mem[0000000010181410] = db000000, %l0 = 0000000000000000
	lduha	[%i6+%o5]0x88,%l0	! %l0 = 0000000000000000
!	Mem[00000000100c1408] = ff000000ffffffdb, %l7 = 00000000ab000000
	ldxa	[%i3+%o4]0x80,%l7	! %l7 = ff000000ffffffdb
!	Mem[0000000030101410] = 00000000, %l1 = 00000000000000ff
	lduwa	[%i4+%o5]0x89,%l1	! %l1 = 0000000000000000
!	Mem[00000000100c1428] = 0000dba6, %l2 = 00000000000000ff, %asi = 80
	ldswa	[%i3+0x028]%asi,%l2	! %l2 = 000000000000dba6
!	Mem[0000000010081400] = ff009780 ff000000, %l0 = 00000000, %l1 = 00000000
	ldda	[%i2+%g0]0x80,%l0	! %l0 = 00000000ff009780 00000000ff000000
!	Mem[0000000010181410] = 000000ff db000000, %l6 = 0000ffff, %l7 = ffffffdb
	ldda	[%i6+%o5]0x88,%l6	! %l6 = 00000000db000000 00000000000000ff
!	Mem[0000000010141428] = 000000ff, %f24 = ff000000
	lda	[%i5+0x028]%asi,%f24	! %f24 = 000000ff
!	Mem[00000000100c1408] = ff000000ffffffdb, %f20 = fc725f00 7fffffff, %asi = 80
	ldda	[%i3+0x008]%asi,%f20	! %f20 = ff000000 ffffffdb

p0_label_255:
!	Starting 10 instruction Store Burst
!	Mem[0000000030141410] = da000000, %l6 = 00000000db000000
	ldstuba	[%i5+%o5]0x81,%l6	! %l6 = 00000000000000da
!	Mem[000000001014140f] = 0435525a, %l2 = 000000000000dba6
	ldstub	[%i5+0x00f],%l2		! %l2 = 000000000000005a
!	Mem[0000000030001410] = 000000ff, %l7 = 00000000000000ff
	swapa	[%i0+%o5]0x81,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030041408] = ff523504, %l4 = 0000000000000000
	ldstuba	[%i1+%o4]0x81,%l4	! %l4 = 00000000000000ff
!	Mem[000000001004143c] = 587464ff, %l6 = 000000da, %l7 = 000000ff
	add	%i1,0x3c,%g1
	casa	[%g1]0x80,%l6,%l7	! %l7 = 00000000587464ff
!	%l4 = 00000000000000ff, Mem[0000000010101400] = 00000000
	stwa	%l4,[%i4+%g0]0x88	! Mem[0000000010101400] = 000000ff
!	Mem[0000000030041400] = 00000000, %l7 = 00000000587464ff
	ldstuba	[%i1+%g0]0x89,%l7	! %l7 = 0000000000000000
!	%l0 = ff009780, %l1 = ff000000, Mem[0000000030181408] = ffff0000 00000000
	stda	%l0,[%i6+%o4]0x81	! Mem[0000000030181408] = ff009780 ff000000
!	Mem[0000000010081414] = 00000000, %l1 = 00000000ff000000
	swap	[%i2+0x014],%l1		! %l1 = 0000000000000000
!	%f28 = ffffacc5, Mem[00000000300c1410] = 0435525a
	sta	%f28,[%i3+%o5]0x81	! Mem[00000000300c1410] = ffffacc5

p0_label_256:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181401] = ffffffff, %l4 = 00000000000000ff
	ldub	[%i6+0x001],%l4		! %l4 = 00000000000000ff
!	%f10 = 006b0000, %f19 = 0000ffff, %f15 = ffff0000
	fdivs	%f10,%f19,%f15		! tt=0x22, %l0 = 00000000ff0097a2
!	Mem[0000000021800101] = ffff4a00, %l2 = 000000000000005a
	ldsb	[%o3+0x101],%l2		! %l2 = ffffffffffffffff
!	Mem[00000000100c1410] = 00000000, %l2 = ffffffffffffffff
	lduba	[%i3+%o5]0x88,%l2	! %l2 = 0000000000000000
!	%f0  = 000000ff, %f8  = 7fffffff, %f5  = 7fffffff
	fmuls	%f0 ,%f8 ,%f5 		! %f5  = 7fffffff
!	Mem[0000000030001400] = 00ff0000, %l6 = 00000000000000da
	lduha	[%i0+%g0]0x81,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030141410] = ff000000, %l4 = 00000000000000ff
	lduha	[%i5+%o5]0x81,%l4	! %l4 = 000000000000ff00
!	Mem[0000000010041428] = 00000000, %l5 = ffffffffffffffff, %asi = 80
	ldswa	[%i1+0x028]%asi,%l5	! %l5 = 0000000000000000
!	Mem[0000000030081400] = 00000000, %l1 = 0000000000000000
	lduba	[%i2+%g0]0x89,%l1	! %l1 = 0000000000000000
!	Code Fragment 3, seed = 292627
p0_fragment_20:
!	%l0 = 00000000ff0097a2
	setx	0x167e6a328cf6428e,%g7,%l0 ! %l0 = 167e6a328cf6428e
!	%l1 = 0000000000000000
	setx	0xfe243068ea408a39,%g7,%l1 ! %l1 = fe243068ea408a39
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 167e6a328cf6428e
	setx	0x9d04261248d1ddf4,%g7,%l0 ! %l0 = 9d04261248d1ddf4
!	%l1 = fe243068ea408a39
	setx	0x7d526dcdbbf9c0bf,%g7,%l1 ! %l1 = 7d526dcdbbf9c0bf
p0_fragment_20_end:

p0_label_257:
!	Starting 10 instruction Store Burst
!	%l1 = 7d526dcdbbf9c0bf, Mem[00000000300c1408] = 0000000001000000
	stxa	%l1,[%i3+%o4]0x81	! Mem[00000000300c1408] = 7d526dcdbbf9c0bf
!	%l4 = 000000000000ff00, Mem[0000000030081410] = 000000ff
	stwa	%l4,[%i2+%o5]0x89	! Mem[0000000030081410] = 0000ff00
!	Mem[0000000030181400] = 00000cb5, %l6 = 00000000000000ff
	ldstuba	[%i6+%g0]0x89,%l6	! %l6 = 00000000000000b5
!	%f6  = 000000ff, Mem[0000000010181410] = 000000db
	sta	%f6 ,[%i6+%o5]0x80	! Mem[0000000010181410] = 000000ff
!	%l2 = 00000000, %l3 = 000000ff, Mem[0000000010001400] = fcb8fcff 474d90a1
	stda	%l2,[%i0+%g0]0x88	! Mem[0000000010001400] = 00000000 000000ff
!	Mem[0000000010041408] = 00000000, %l5 = 0000000000000000
	swapa	[%i1+%o4]0x88,%l5	! %l5 = 0000000000000000
!	%l0 = 9d04261248d1ddf4, Mem[0000000010101408] = 7e000000
	stw	%l0,[%i4+%o4]		! Mem[0000000010101408] = 48d1ddf4
!	Mem[0000000010101408] = 48d1ddf4, %l6 = 00000000000000b5
	ldstuba	[%i4+%o4]0x80,%l6	! %l6 = 0000000000000048
!	%l4 = 000000000000ff00, Mem[0000000030101408] = ff000000
	stwa	%l4,[%i4+%o4]0x81	! Mem[0000000030101408] = 0000ff00
!	%l4 = 000000000000ff00, Mem[0000000030041410] = 5a5235040000007e
	stxa	%l4,[%i1+%o5]0x81	! Mem[0000000030041410] = 000000000000ff00

p0_label_258:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1404] = 000000ff, %f18 = 00000000
	ld	[%i3+0x004],%f18	! %f18 = 000000ff
!	Mem[0000000010001400] = 00000000, %f19 = 0000ffff
	lda	[%i0+%g0]0x88,%f19	! %f19 = 00000000
!	Mem[0000000010041408] = 00000000 dba68d03, %l0 = 48d1ddf4, %l1 = bbf9c0bf
	ldd	[%i1+%o4],%l0		! %l0 = 0000000000000000 00000000dba68d03
!	Code Fragment 4, seed = 664085
p0_fragment_21:
!	%l0 = 0000000000000000
	setx	0xb07caa3e652d8c7e,%g7,%l0 ! %l0 = b07caa3e652d8c7e
!	%l1 = 00000000dba68d03
	setx	0x04d841bb16107129,%g7,%l1 ! %l1 = 04d841bb16107129
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = b07caa3e652d8c7e
	setx	0x03d38314d6dbd1e4,%g7,%l0 ! %l0 = 03d38314d6dbd1e4
!	%l1 = 04d841bb16107129
	setx	0xe40958eb29e431af,%g7,%l1 ! %l1 = e40958eb29e431af
p0_fragment_21_end:
!	Mem[0000000030141410] = 000000ff, %l3 = 00000000000000ff
	lduwa	[%i5+%o5]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030001400] = 00ff0000, %l2 = 0000000000000000
	ldsba	[%i0+%g0]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000030101400] = 000000da, %l4 = 000000000000ff00
	ldsba	[%i4+%g0]0x89,%l4	! %l4 = ffffffffffffffda
!	Mem[00000000300c1408] = bfc0f9bb cd6d527d, %l4 = ffffffda, %l5 = 00000000
	ldda	[%i3+%o4]0x89,%l4	! %l4 = 00000000cd6d527d 00000000bfc0f9bb
!	Mem[0000000030181400] = ff0c0000, %l3 = 00000000000000ff
	ldsba	[%i6+%g0]0x81,%l3	! %l3 = ffffffffffffffff
!	Mem[000000001010142a] = 000000ff, %l1 = e40958eb29e431af, %asi = 80
	lduha	[%i4+0x02a]%asi,%l1	! %l1 = 00000000000000ff

p0_label_259:
!	Starting 10 instruction Store Burst
!	%f20 = ff000000 ffffffdb, Mem[0000000030081408] = 00000000 a1904d47
	stda	%f20,[%i2+%o4]0x89	! Mem[0000000030081408] = ff000000 ffffffdb
!	%l5 = 00000000bfc0f9bb, Mem[0000000010081428] = 00000000000000ff
	stx	%l5,[%i2+0x028]		! Mem[0000000010081428] = 00000000bfc0f9bb
!	Mem[0000000030181400] = ff0c0000, %l7 = 0000000000000000
	ldstuba	[%i6+%g0]0x81,%l7	! %l7 = 00000000000000ff
!	%l5 = 00000000bfc0f9bb, immd = fffff610, %y  = 00000cb6
	udiv	%l5,-0x9f0,%l3		! %l3 = 0000000000000cb6
	mov	%l0,%y			! %y = d6dbd1e4
!	Mem[0000000010141400] = 00ffffff, %l7 = 00000000000000ff
	ldstuba	[%i5+%g0]0x80,%l7	! %l7 = 0000000000000000
!	%l5 = 00000000bfc0f9bb, Mem[0000000030081400] = 00000000
	stha	%l5,[%i2+%g0]0x89	! Mem[0000000030081400] = 0000f9bb
!	%l4 = 00000000cd6d527d, Mem[00000000300c1408] = 7d526dcd
	stha	%l4,[%i3+%o4]0x81	! Mem[00000000300c1408] = 527d6dcd
!	Mem[0000000030181400] = ff0c0000, %l2 = 0000000000000000
	ldstuba	[%i6+%g0]0x81,%l2	! %l2 = 00000000000000ff
!	%f31 = a78c9bff, Mem[00000000300c1410] = c5acffff
	sta	%f31,[%i3+%o5]0x89	! Mem[00000000300c1410] = a78c9bff
!	Mem[0000000021800080] = 5baa49a0, %l1 = 00000000000000ff
	ldstuba	[%o3+0x080]%asi,%l1	! %l1 = 000000000000005b

p0_label_260:
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (48)
!	Mem[0000000010081400] = ff009780 ff000000 00000000 000009ae
!	Mem[0000000010081410] = ffffff7f ff000000 80970000 ff000000
!	Mem[0000000010081420] = ffff8097 ffffff7f 00000000 bfc0f9bb
!	Mem[0000000010081430] = 00003500 00acffff 0000ffff ffff7fff
	ldda	[%i2+%g0]ASI_BLK_PL,%f16	! Block Load from 0000000010081400
!	Mem[00000000100c1424] = ffffffff, %l7 = 0000000000000000
	lduw	[%i3+0x024],%l7		! %l7 = 00000000ffffffff
!	Mem[00000000300c1410] = ff9b8ca7, %f12 = ffffacc5
	lda	[%i3+%o5]0x81,%f12	! %f12 = ff9b8ca7
!	%l6 = 0000000000000048, %l5 = 00000000bfc0f9bb, %l6 = 0000000000000048
	xor	%l6,%l5,%l6		! %l6 = 00000000bfc0f9f3
!	Mem[0000000010041400] = 00000000, %l2 = 00000000000000ff
	ldsha	[%i1+%g0]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000030101408] = 00ff0000, %l2 = 0000000000000000
	lduba	[%i4+%o4]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000010081408] = 00000000, %l1 = 000000000000005b
	ldswa	[%i2+%o4]0x80,%l1	! %l1 = 0000000000000000
!	%f5  = 7fffffff, %f14 = ff7fffff, %f1  = ffff0000
	fmuls	%f5 ,%f14,%f1 		! %f1  = 7fffffff
!	Mem[0000000020800040] = ffff18e0, %l5 = 00000000bfc0f9bb, %asi = 80
	ldsha	[%o1+0x040]%asi,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000020800041] = ffff18e0, %l5 = ffffffffffffffff, %asi = 80
	ldsba	[%o1+0x041]%asi,%l5	! %l5 = ffffffffffffffff

p0_label_261:
!	Starting 10 instruction Store Burst
!	%l1 = 0000000000000000, Mem[0000000010141428] = 000000ff
	stb	%l1,[%i5+0x028]		! Mem[0000000010141428] = 000000ff
!	Mem[0000000030001400] = 00ff0000, %l7 = 00000000ffffffff
	ldstuba	[%i0+%g0]0x81,%l7	! %l7 = 0000000000000000
!	%l2 = 00000000, %l3 = 00000cb6, Mem[0000000010001408] = ffff0000 000000ab
	stda	%l2,[%i0+%o4]0x80	! Mem[0000000010001408] = 00000000 00000cb6
!	Mem[00000000100c1400] = ff0000ff, %l6 = 00000000bfc0f9f3
	swapa	[%i3+%g0]0x88,%l6	! %l6 = 00000000ff0000ff
!	Mem[00000000211c0001] = 00006b10, %l0 = 03d38314d6dbd1e4
	ldstub	[%o2+0x001],%l0		! %l0 = 0000000000000000
!	%l4 = 00000000cd6d527d, Mem[0000000010141408] = ff523504fc725f00
	stxa	%l4,[%i5+%o4]0x88	! Mem[0000000010141408] = 00000000cd6d527d
!	Mem[0000000010001408] = 00000000, %l0 = 0000000000000000
	swapa	[%i0+%o4]0x88,%l0	! %l0 = 0000000000000000
!	%f22 = 000000ff 00009780, Mem[0000000010101418] = 00000000 00000000
	std	%f22,[%i4+0x018]	! Mem[0000000010101418] = 000000ff 00009780
!	%f19 = 00000000, Mem[0000000030001408] = 000009ae
	sta	%f19,[%i0+%o4]0x89	! Mem[0000000030001408] = 00000000
!	Mem[0000000030001410] = 000000ff, %l1 = 0000000000000000
	swapa	[%i0+%o5]0x81,%l1	! %l1 = 00000000000000ff

p0_label_262:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1430] = ff000000, %f6  = 000000ff
	lda	[%i3+0x030]%asi,%f6 	! %f6 = ff000000
!	Mem[00000000201c0001] = ffffe880, %l0 = 0000000000000000
	ldsb	[%o0+0x001],%l0		! %l0 = ffffffffffffffff
!	Mem[000000001008141e] = ff000000, %l2 = 0000000000000000
	ldsb	[%i2+0x01e],%l2		! %l2 = 0000000000000000
!	Mem[0000000030181408] = 809700ff, %l5 = ffffffffffffffff
	ldsba	[%i6+%o4]0x89,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000010041410] = ff00000000000000, %l6 = 00000000ff0000ff
	ldxa	[%i1+%o5]0x88,%l6	! %l6 = ff00000000000000
!	Mem[0000000010101408] = ffd1ddf4, %l2 = 0000000000000000
	ldswa	[%i4+%o4]0x80,%l2	! %l2 = ffffffffffd1ddf4
!	Mem[0000000010101410] = 000000ff, %l4 = 00000000cd6d527d
	ldsba	[%i4+%o5]0x80,%l4	! %l4 = 0000000000000000
!	%l3 = 0000000000000cb6, imm = fffffffffffffe09, %l5 = ffffffffffffffff
	orn	%l3,-0x1f7,%l5		! %l5 = 0000000000000df6
!	%l3 = 0000000000000cb6, %l1 = 00000000000000ff, %l3 = 0000000000000cb6
	addc	%l3,%l1,%l3		! %l3 = 0000000000000db5
!	Mem[0000000010101420] = 000000000000a6db, %f4  = ff80ffff 7fffffff
	ldd	[%i4+0x020],%f4 	! %f4  = 00000000 0000a6db

p0_label_263:
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (49)
!	%l1 = 00000000000000ff, Mem[000000001008140c] = 000009ae, %asi = 80
	stwa	%l1,[%i2+0x00c]%asi	! Mem[000000001008140c] = 000000ff
!	Mem[00000000100c1410] = 00000000, %l0 = 00000000ffffffff
	swapa	[%i3+%o5]0x88,%l0	! %l0 = 0000000000000000
!	%l2 = ffd1ddf4, %l3 = 00000db5, Mem[0000000030001410] = 00000000 db000000
	stda	%l2,[%i0+%o5]0x89	! Mem[0000000030001410] = ffd1ddf4 00000db5
!	Mem[0000000010041408] = 00000000, %l5 = 0000000000000df6
	swapa	[%i1+%o4]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000010101410] = 000000ff, %l3 = 0000000000000db5
	swap	[%i4+%o5],%l3		! %l3 = 00000000000000ff
!	%f24 = 7fffffff, Mem[00000000100c142c] = ff000000
	st	%f24,[%i3+0x02c]	! Mem[00000000100c142c] = 7fffffff
!	%l0 = 0000000000000000, Mem[0000000020800040] = ffff18e0, %asi = 80
	stba	%l0,[%o1+0x040]%asi	! Mem[0000000020800040] = 00ff18e0
!	Mem[0000000010141408] = cd6d527d, %l1 = 00000000000000ff
	swapa	[%i5+%o4]0x88,%l1	! %l1 = 00000000cd6d527d
!	Mem[0000000030001400] = ffff0000, %l5 = 0000000000000000
	swapa	[%i0+%g0]0x81,%l5	! %l5 = 00000000ffff0000
!	Mem[0000000010001410] = ff7fffff, %l6 = 0000000000000000
	swapa	[%i0+%o5]0x88,%l6	! %l6 = 00000000ff7fffff

p0_label_264:
!	Starting 10 instruction Load Burst
!	Mem[0000000020800040] = 00ff18e0, %l7 = 0000000000000000, %asi = 80
	ldsha	[%o1+0x040]%asi,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030041408] = 043552ff, %l3 = 00000000000000ff
	ldsba	[%i1+%o4]0x89,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000030041410] = 00000000, %l1 = 00000000cd6d527d
	ldsba	[%i1+%o5]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000010101408] = 00000000f4ddd1ff, %f8  = 7fffffff 9780ffff
	ldda	[%i4+%o4]0x88,%f8 	! %f8  = 00000000 f4ddd1ff
!	Mem[0000000030101408] = 0000ff00 00000000, %l0 = 00000000, %l1 = 00000000
	ldda	[%i4+%o4]0x81,%l0	! %l0 = 000000000000ff00 0000000000000000
!	Mem[00000000201c0000] = ffffe880, %l3 = ffffffffffffffff, %asi = 80
	lduha	[%o0+0x000]%asi,%l3	! %l3 = 000000000000ffff
!	Mem[00000000100c1410] = ffffffff, %l5 = 00000000ffff0000
	ldsba	[%i3+%o5]0x80,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000010001404] = ff000000, %l7 = 00000000000000ff, %asi = 80
	ldswa	[%i0+0x004]%asi,%l7	! %l7 = ffffffffff000000
!	Mem[0000000030141400] = da000000, %l1 = 0000000000000000
	ldsha	[%i5+%g0]0x81,%l1	! %l1 = ffffffffffffda00
!	Mem[0000000010081418] = 80970000ff000000, %l5 = ffffffffffffffff
	ldx	[%i2+0x018],%l5		! %l5 = 80970000ff000000

p0_label_265:
!	Starting 10 instruction Store Burst
!	%f6  = ff000000 00009780, Mem[0000000030001410] = f4ddd1ff b50d0000
	stda	%f6 ,[%i0+%o5]0x81	! Mem[0000000030001410] = ff000000 00009780
!	%l5 = 80970000ff000000, Mem[0000000010141408] = ff00000000000000, %asi = 80
	stxa	%l5,[%i5+0x008]%asi	! Mem[0000000010141408] = 80970000ff000000
!	Mem[0000000010181408] = 0000007e, %l5 = 80970000ff000000
	ldstuba	[%i6+%o4]0x88,%l5	! %l5 = 000000000000007e
!	%f26 = bbf9c0bf 00000000, %l4 = 0000000000000000
!	Mem[0000000030141420] = 95e20f5b038da6db
	add	%i5,0x020,%g1
	stda	%f26,[%g1+%l4]ASI_PST16_SL ! Mem[0000000030141420] = 95e20f5b038da6db
!	%l4 = 0000000000000000, Mem[0000000010041408] = f60d0000
	stba	%l4,[%i1+%o4]0x80	! Mem[0000000010041408] = 000d0000
!	Mem[00000000300c1408] = cd6d7d52, %l3 = 000000000000ffff
	ldstuba	[%i3+%o4]0x89,%l3	! %l3 = 0000000000000052
!	Mem[0000000010081400] = 809700ff, %l2 = ffffffffffd1ddf4
	ldstuba	[%i2+%g0]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010001403] = 00000000, %l5 = 000000000000007e
	ldstub	[%i0+0x003],%l5		! %l5 = 0000000000000000
!	%f6  = ff000000, Mem[0000000030181408] = ff009780
	sta	%f6 ,[%i6+%o4]0x81	! Mem[0000000030181408] = ff000000
!	Mem[0000000030181408] = 000000ff, %l4 = 0000000000000000
	swapa	[%i6+%o4]0x89,%l4	! %l4 = 00000000000000ff

p0_label_266:
!	Starting 10 instruction Load Burst
!	Mem[0000000030181410] = 0000ffff, %l3 = 0000000000000052
	lduha	[%i6+%o5]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000030041408] = ff523504, %l4 = 00000000000000ff
	ldsba	[%i1+%o4]0x81,%l4	! %l4 = ffffffffffffffff
!	Mem[00000000201c0000] = ffffe880, %l0 = 000000000000ff00
	ldub	[%o0+%g0],%l0		! %l0 = 00000000000000ff
!	Mem[0000000010101408] = 00000000f4ddd1ff, %f18 = ae090000 00000000
	ldda	[%i4+%o4]0x88,%f18	! %f18 = 00000000 f4ddd1ff
!	Mem[0000000010081400] = ff009780, %l2 = 00000000000000ff
	ldsha	[%i2+%g0]0x80,%l2	! %l2 = ffffffffffffff00
!	Mem[0000000010081408] = ff00000000000000, %l1 = ffffffffffffda00
	ldxa	[%i2+%o4]0x88,%l1	! %l1 = ff00000000000000
!	Code Fragment 4, seed = 420159
p0_fragment_22:
!	%l0 = 00000000000000ff
	setx	0xc190d582eecc9d2e,%g7,%l0 ! %l0 = c190d582eecc9d2e
!	%l1 = ff00000000000000
	setx	0xfd894bd1275462d9,%g7,%l1 ! %l1 = fd894bd1275462d9
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = c190d582eecc9d2e
	setx	0x3a10b79a6902d494,%g7,%l0 ! %l0 = 3a10b79a6902d494
!	%l1 = fd894bd1275462d9
	setx	0xf53f03847195755f,%g7,%l1 ! %l1 = f53f03847195755f
p0_fragment_22_end:
!	Mem[00000000100c1408] = ff000000 ffffffdb, %l2 = ffffff00, %l3 = 00000000
	ldda	[%i3+%o4]0x80,%l2	! %l2 = 00000000ff000000 00000000ffffffdb
!	Mem[00000000100c1435] = 60fe70cf, %l2 = 00000000ff000000, %asi = 80
	ldsba	[%i3+0x035]%asi,%l2	! %l2 = fffffffffffffffe
!	Mem[0000000010081438] = 0000ffff, %f13 = 0435525a
	lda	[%i2+0x038]%asi,%f13	! %f13 = 0000ffff

p0_label_267:
!	Starting 10 instruction Store Burst
!	%f10 = 006b0000 000000ff, Mem[0000000030141410] = 000000ff ffffff7f
	stda	%f10,[%i5+%o5]0x89	! Mem[0000000030141410] = 006b0000 000000ff
!	%f29 = 00350000, Mem[0000000030081408] = dbffffff
	sta	%f29,[%i2+%o4]0x81	! Mem[0000000030081408] = 00350000
!	Mem[000000001018141f] = 00000000, %l5 = 0000000000000000
	ldstub	[%i6+0x01f],%l5		! %l5 = 0000000000000000
!	%f11 = 000000ff, Mem[00000000300c1400] = 7fffffff
	sta	%f11,[%i3+%g0]0x81	! Mem[00000000300c1400] = 000000ff
!	%f28 = ffffac00 00350000, Mem[00000000300c1400] = ff000000 ff9b8ca7
	stda	%f28,[%i3+%g0]0x89	! Mem[00000000300c1400] = ffffac00 00350000
!	Mem[0000000030041400] = ff000000, %l2 = fffffffffffffffe
	ldstuba	[%i1+%g0]0x81,%l2	! %l2 = 00000000000000ff
!	%l0 = 3a10b79a6902d494, imm = fffffffffffffc58, %l1 = f53f03847195755f
	subc	%l0,-0x3a8,%l1		! %l1 = 3a10b79a6902d83c
!	%f11 = 000000ff, Mem[0000000030001400] = 00000000
	sta	%f11,[%i0+%g0]0x89	! Mem[0000000030001400] = 000000ff
!	%l3 = 00000000ffffffdb, Mem[0000000030101410] = 00000000
	stwa	%l3,[%i4+%o5]0x89	! Mem[0000000030101410] = ffffffdb
!	Mem[0000000010101400] = ff000000, %l7 = 00000000ff000000
	swapa	[%i4+%g0]0x80,%l7	! %l7 = 00000000ff000000

p0_label_268:
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = 00000000, %l6 = 00000000ff7fffff
	ldsba	[%i6+%o4]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000030001408] = 00000000, %l4 = ffffffffffffffff
	lduwa	[%i0+%o4]0x81,%l4	! %l4 = 0000000000000000
	membar	#Sync			! Added by membar checker (50)
!	Mem[0000000010041400] = 00000000 db000000 000d0000 dba68d03
!	Mem[0000000010041410] = 00000000 000000ff 00000000 000000ff
!	Mem[0000000010041420] = 0000001d 00000000 00000000 000000ff
!	Mem[0000000010041430] = 97809b06 00000000 7e000000 587464ff
	ldda	[%i1+%g0]ASI_BLK_AIUPL,%f0 	! Block Load from 0000000010041400
!	Mem[0000000020800040] = 00ff18e0, %l3 = 00000000ffffffdb
	ldsb	[%o1+0x040],%l3		! %l3 = 0000000000000000
!	Mem[00000000201c0000] = ffffe880, %l7 = 00000000ff000000, %asi = 80
	ldsha	[%o0+0x000]%asi,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010041410] = 00000000, %l4 = 0000000000000000
	ldswa	[%i1+%o5]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000010101408] = f4ddd1ff, %l2 = 00000000000000ff
	ldsha	[%i4+%o4]0x88,%l2	! %l2 = ffffffffffffd1ff
!	Code Fragment 4, seed = 962275
p0_fragment_23:
!	%l0 = 3a10b79a6902d494
	setx	0x517686fda975540e,%g7,%l0 ! %l0 = 517686fda975540e
!	%l1 = 3a10b79a6902d83c
	setx	0xbf79e6e29910e3b9,%g7,%l1 ! %l1 = bf79e6e29910e3b9
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 517686fda975540e
	setx	0x9988d82148d0ff74,%g7,%l0 ! %l0 = 9988d82148d0ff74
!	%l1 = bf79e6e29910e3b9
	setx	0xb62ceeac038d2a3f,%g7,%l1 ! %l1 = b62ceeac038d2a3f
p0_fragment_23_end:
!	Mem[0000000010101428] = 000000ff, %l7 = ffffffffffffffff, %asi = 80
	lduwa	[%i4+0x028]%asi,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030141410] = 000000ff, %l4 = 0000000000000000
	lduha	[%i5+%o5]0x89,%l4	! %l4 = 00000000000000ff

p0_label_269:
!	Starting 10 instruction Store Burst
!	Mem[0000000010141400] = ffffffff, %l5 = 0000000000000000
	swapa	[%i5+%g0]0x80,%l5	! %l5 = 00000000ffffffff
!	Mem[0000000020800001] = ffff42b0, %l3 = 0000000000000000
	ldstub	[%o1+0x001],%l3		! %l3 = 00000000000000ff
!	Mem[0000000030141410] = 000000ff, %l6 = 0000000000000000
	ldstuba	[%i5+%o5]0x89,%l6	! %l6 = 00000000000000ff
!	%l0 = 48d0ff74, %l1 = 038d2a3f, Mem[0000000030141410] = 000000ff 006b0000
	stda	%l0,[%i5+%o5]0x89	! Mem[0000000030141410] = 48d0ff74 038d2a3f
!	%l3 = 00000000000000ff, Mem[00000000100c1400] = ff000000bfc0f9f3
	stxa	%l3,[%i3+%g0]0x88	! Mem[00000000100c1400] = 00000000000000ff
	membar	#Sync			! Added by membar checker (51)
!	%f8  = 00000000 1d000000, Mem[0000000010041418] = 00000000 000000ff, %asi = 80
	stda	%f8 ,[%i1+0x018]%asi	! Mem[0000000010041418] = 00000000 1d000000
!	%l6 = 00000000000000ff, Mem[0000000020800000] = ffff42b0
	sth	%l6,[%o1+%g0]		! Mem[0000000020800000] = 00ff42b0
!	Mem[0000000010141420] = 95e20f5b038da6db, %l7 = 00000000000000ff, %l4 = 00000000000000ff
	add	%i5,0x20,%g1
	casxa	[%g1]0x80,%l7,%l4	! %l4 = 95e20f5b038da6db
!	%f30 = ff7fffff ffff0000, %l7 = 00000000000000ff
!	Mem[0000000030181420] = 0000000000000000
	add	%i6,0x020,%g1
	stda	%f30,[%g1+%l7]ASI_PST16_S ! Mem[0000000030181420] = ff7fffffffff0000
!	%l5 = 00000000ffffffff, Mem[0000000010141410] = 069bff64
	stha	%l5,[%i5+%o5]0x88	! Mem[0000000010141410] = 069bffff

p0_label_270:
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = 0000f9bb, %l0 = 9988d82148d0ff74
	lduwa	[%i2+%g0]0x89,%l0	! %l0 = 000000000000f9bb
!	Mem[0000000010081410] = ffffff7fff000000, %l5 = 00000000ffffffff
	ldxa	[%i2+%o5]0x80,%l5	! %l5 = ffffff7fff000000
!	Mem[0000000030101400] = 00000000000000da, %l4 = 95e20f5b038da6db
	ldxa	[%i4+%g0]0x89,%l4	! %l4 = 00000000000000da
!	Mem[0000000030181408] = 00000000, %l2 = ffffffffffffd1ff
	lduha	[%i6+%o4]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000030001400] = ff000000 000000ab 00000000 00000000
!	Mem[0000000030001410] = ff000000 00009780 314aa6da 70b87b43
!	Mem[0000000030001420] = 1df3a868 2df625d9 80970000 ff000000
!	Mem[0000000030001430] = 069b8097 0b14976b 0e2308cf 5a018f5d
	ldda	[%i0+%g0]ASI_BLK_AIUSL,%f16	! Block Load from 0000000030001400
!	Mem[0000000010181410] = ff000000, %l4 = 00000000000000da
	ldsha	[%i6+%o5]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000010181408] = ff000000 6bffacc5, %l6 = 000000ff, %l7 = 000000ff
	ldda	[%i6+%o4]0x80,%l6	! %l6 = 00000000ff000000 000000006bffacc5
!	Mem[00000000300c1408] = ff7d6dcd, %l4 = 0000000000000000
	lduba	[%i3+%o4]0x81,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030081400] = 0000f9bb, %l6 = 00000000ff000000
	ldswa	[%i2+%g0]0x89,%l6	! %l6 = 000000000000f9bb
!	Mem[00000000100c1408] = dbffffff000000ff, %f10 = ff000000 00000000
	ldda	[%i3+%o4]0x88,%f10	! %f10 = dbffffff 000000ff

p0_label_271:
!	Starting 10 instruction Store Burst
!	Mem[0000000030181400] = ff0c0000, %l5 = ffffff7fff000000
	ldstuba	[%i6+%g0]0x81,%l5	! %l5 = 00000000000000ff
!	%f14 = ff647458 0000007e, Mem[0000000030101400] = 000000da 00000000
	stda	%f14,[%i4+%g0]0x89	! Mem[0000000030101400] = ff647458 0000007e
!	Mem[0000000030081400] = 0000f9bb, %l4 = 00000000000000ff
	ldstuba	[%i2+%g0]0x89,%l4	! %l4 = 00000000000000bb
!	%l7 = 000000006bffacc5, Mem[0000000010001410] = 00000000, %asi = 80
	stwa	%l7,[%i0+0x010]%asi	! Mem[0000000010001410] = 6bffacc5
!	%l2 = 00000000, %l3 = 000000ff, Mem[0000000010181410] = 000000ff ff000000
	stda	%l2,[%i6+%o5]0x80	! Mem[0000000010181410] = 00000000 000000ff
!	%l6 = 0000f9bb, %l7 = 6bffacc5, Mem[0000000010001400] = 000000ff ff000000, %asi = 80
	stda	%l6,[%i0+0x000]%asi	! Mem[0000000010001400] = 0000f9bb 6bffacc5
!	%l1 = b62ceeac038d2a3f, Mem[0000000030101408] = 00ff0000
	stha	%l1,[%i4+%o4]0x89	! Mem[0000000030101408] = 00ff2a3f
!	%f16 = ab000000 000000ff, %l2 = 0000000000000000
!	Mem[0000000030141410] = 74ffd0483f2a8d03
	add	%i5,0x010,%g1
	stda	%f16,[%g1+%l2]ASI_PST32_S ! Mem[0000000030141410] = 74ffd0483f2a8d03
!	%f17 = 000000ff, Mem[0000000010141400] = 00000000
	sta	%f17,[%i5+%g0]0x88	! Mem[0000000010141400] = 000000ff
!	Mem[0000000030141408] = 00000cb6, %l7 = 000000006bffacc5
	swapa	[%i5+%o4]0x89,%l7	! %l7 = 0000000000000cb6

p0_label_272:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = 000000ff, %l2 = 0000000000000000
	ldsha	[%i4+%g0]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010081400] = ff009780, %l3 = 00000000000000ff
	ldswa	[%i2+%g0]0x80,%l3	! %l3 = ffffffffff009780
!	Mem[0000000010041410] = 00000000, %l6 = 000000000000f9bb
	ldsha	[%i1+%o5]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000010001400] = 0000f9bb6bffacc5, %l4 = 00000000000000bb, %asi = 80
	ldxa	[%i0+0x000]%asi,%l4	! %l4 = 0000f9bb6bffacc5
!	Mem[0000000010041438] = 7e000000 587464ff, %l2 = 000000ff, %l3 = ff009780, %asi = 80
	ldda	[%i1+0x038]%asi,%l2	! %l2 = 000000007e000000 00000000587464ff
!	Mem[00000000100c143a] = 0a80ccb2, %l4 = 0000f9bb6bffacc5, %asi = 80
	ldsha	[%i3+0x03a]%asi,%l4	! %l4 = ffffffffffffccb2
!	Mem[0000000030081410] = 00ff0000, %l0 = 000000000000f9bb
	lduwa	[%i2+%o5]0x81,%l0	! %l0 = 0000000000ff0000
!	Mem[0000000030041410] = 00000000, %l7 = 0000000000000cb6
	ldswa	[%i1+%o5]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000010141410] = ffff9b06, %l5 = 00000000000000ff
	ldub	[%i5+%o5],%l5		! %l5 = 00000000000000ff
!	Mem[0000000030041410] = 00000000, %l4 = ffffffffffffccb2
	lduba	[%i1+%o5]0x89,%l4	! %l4 = 0000000000000000

p0_label_273:
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000000000, Mem[0000000030041400] = 000000ff
	stba	%l4,[%i1+%g0]0x89	! Mem[0000000030041400] = 00000000
	membar	#Sync			! Added by membar checker (52)
!	%l6 = 00000000, %l7 = 00000000, Mem[0000000030001408] = 00000000 00000000
	stda	%l6,[%i0+%o4]0x81	! Mem[0000000030001408] = 00000000 00000000
!	Mem[000000001000142b] = 000000db, %l1 = b62ceeac038d2a3f
	ldstuba	[%i0+0x02b]%asi,%l1	! %l1 = 00000000000000db
!	%l2 = 000000007e000000, Mem[0000000010101410] = b50d0000
	stba	%l2,[%i4+%o5]0x88	! Mem[0000000010101410] = b50d0000
!	Mem[0000000010041410] = 00000000, %l6 = 0000000000000000
	ldstuba	[%i1+%o5]0x88,%l6	! %l6 = 0000000000000000
!	%l3 = 00000000587464ff, Mem[0000000030081410] = 00ff0000
	stha	%l3,[%i2+%o5]0x81	! Mem[0000000030081410] = 64ff0000
!	%f22 = 437bb870 daa64a31, %l0 = 0000000000ff0000
!	Mem[0000000030141430] = cf70fe6035bc0000
	add	%i5,0x030,%g1
	stda	%f22,[%g1+%l0]ASI_PST32_S ! Mem[0000000030141430] = cf70fe6035bc0000
!	%l1 = 00000000000000db, Mem[0000000010181418] = ff003d00, %asi = 80
	stwa	%l1,[%i6+0x018]%asi	! Mem[0000000010181418] = 000000db
!	%f14 = ff647458 0000007e, Mem[0000000030141400] = da000000 00006b00
	stda	%f14,[%i5+%g0]0x81	! Mem[0000000030141400] = ff647458 0000007e
!	%l0 = 00ff0000, %l1 = 000000db, Mem[0000000010101438] = bb82f03f ff000000, %asi = 80
	stda	%l0,[%i4+0x038]%asi	! Mem[0000000010101438] = 00ff0000 000000db

p0_label_274:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = 7fffffff, %l0 = 0000000000ff0000
	lduba	[%i2+%o5]0x88,%l0	! %l0 = 00000000000000ff
!	%l7 = 0000000000000000, %l6 = 0000000000000000, %l1 = 00000000000000db
	or	%l7,%l6,%l1		! %l1 = 0000000000000000
!	Mem[0000000010081400] = ff009780, %l6 = 0000000000000000
	ldsha	[%i2+%g0]0x80,%l6	! %l6 = ffffffffffffff00
!	Mem[0000000030081400] = 0000f9ff, %l7 = 0000000000000000
	lduha	[%i2+%g0]0x89,%l7	! %l7 = 000000000000f9ff
!	Mem[0000000010001400] = 0000f9bb, %l1 = 0000000000000000
	lduha	[%i0+%g0]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000010181400] = ffffffff, %l0 = 00000000000000ff
	lduh	[%i6+%g0],%l0		! %l0 = 000000000000ffff
!	Mem[0000000030081410] = 069b8097 0000ff64, %l0 = 0000ffff, %l1 = 00000000
	ldda	[%i2+%o5]0x89,%l0	! %l0 = 000000000000ff64 00000000069b8097
!	Mem[0000000010041408] = 000d0000dba68d03, %f16 = ab000000 000000ff
	ldda	[%i1+%o4]0x80,%f16	! %f16 = 000d0000 dba68d03
!	Mem[0000000010041408] = 00000d00, %l4 = 0000000000000000
	ldsba	[%i1+%o4]0x88,%l4	! %l4 = 0000000000000000
!	Mem[000000001010141c] = 00009780, %l0 = 000000000000ff64, %asi = 80
	lduwa	[%i4+0x01c]%asi,%l0	! %l0 = 0000000000009780

p0_label_275:
!	Starting 10 instruction Store Burst
!	%f14 = ff647458 0000007e, %l6 = ffffffffffffff00
!	Mem[00000000300c1400] = 0000350000acffff
	stda	%f14,[%i3+%l6]ASI_PST16_S ! Mem[00000000300c1400] = 0000350000acffff
!	Code Fragment 4, seed = 870243
p0_fragment_24:
!	%l0 = 0000000000009780
	setx	0xb95a84fad601100e,%g7,%l0 ! %l0 = b95a84fad601100e
!	%l1 = 00000000069b8097
	setx	0x70732d3bd77fdfb9,%g7,%l1 ! %l1 = 70732d3bd77fdfb9
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = b95a84fad601100e
	setx	0xe78136ea24bf3b74,%g7,%l0 ! %l0 = e78136ea24bf3b74
!	%l1 = 70732d3bd77fdfb9
	setx	0x5135693f65d6a63f,%g7,%l1 ! %l1 = 5135693f65d6a63f
p0_fragment_24_end:
!	Mem[00000000211c0000] = 00ff6b10, %l4 = 0000000000000000
	ldstub	[%o2+%g0],%l4		! %l4 = 0000000000000000
!	%f4  = ff000000 00000000, Mem[0000000010001400] = bbf90000 c5acff6b
	stda	%f4 ,[%i0+%g0]0x88	! Mem[0000000010001400] = ff000000 00000000
!	Mem[0000000010141400] = ff000000, %l4 = 0000000000000000
	ldstuba	[%i5+%g0]0x80,%l4	! %l4 = 00000000000000ff
!	%f4  = ff000000 00000000, %l5 = 00000000000000ff
!	Mem[0000000030041430] = 73000000a78c9bff
	add	%i1,0x030,%g1
	stda	%f4,[%g1+%l5]ASI_PST32_SL ! Mem[0000000030041430] = 00000000000000ff
!	Mem[0000000010101410] = b50d0000, %l4 = 00000000000000ff
	swapa	[%i4+%o5]0x88,%l4	! %l4 = 00000000b50d0000
!	Mem[0000000030141400] = ff647458, %l6 = 00000000ffffff00
	swapa	[%i5+%g0]0x81,%l6	! %l6 = 00000000ff647458
!	Mem[0000000010001408] = 00000000, %l4 = 00000000b50d0000
	ldstuba	[%i0+%o4]0x88,%l4	! %l4 = 0000000000000000
!	Mem[00000000100c1410] = ffffffff, %l6 = 00000000ff647458
	swapa	[%i3+%o5]0x80,%l6	! %l6 = 00000000ffffffff

p0_label_276:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = 069bffff, %l2 = 000000007e000000
	ldswa	[%i5+%o5]0x88,%l2	! %l2 = 00000000069bffff
!	Mem[00000000100c1408] = ff000000ffffffdb, %l4 = 0000000000000000
	ldxa	[%i3+%o4]0x80,%l4	! %l4 = ff000000ffffffdb
!	Code Fragment 4, seed = 828401
p0_fragment_25:
!	%l0 = e78136ea24bf3b74
	setx	0x306273f5a50e199e,%g7,%l0 ! %l0 = 306273f5a50e199e
!	%l1 = 5135693f65d6a63f
	setx	0xcadf9eb444e9f449,%g7,%l1 ! %l1 = cadf9eb444e9f449
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 306273f5a50e199e
	setx	0x043aa992ef146b04,%g7,%l0 ! %l0 = 043aa992ef146b04
!	%l1 = cadf9eb444e9f449
	setx	0x63a8231cab8800cf,%g7,%l1 ! %l1 = 63a8231cab8800cf
p0_fragment_25_end:
!	Mem[0000000030081408] = 00350000, %l5 = 00000000000000ff
	ldsba	[%i2+%o4]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000030041410] = 00000000, %l5 = 0000000000000000
	lduwa	[%i1+%o5]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000030001408] = 00000000, %l2 = 00000000069bffff
	ldswa	[%i0+%o4]0x89,%l2	! %l2 = 0000000000000000
	membar	#Sync			! Added by membar checker (53)
!	Mem[0000000030001400] = ff000000 000000ab 00000000 00000000
!	Mem[0000000030001410] = ff000000 00009780 314aa6da 70b87b43
!	Mem[0000000030001420] = 1df3a868 2df625d9 80970000 ff000000
!	Mem[0000000030001430] = 069b8097 0b14976b 0e2308cf 5a018f5d
	ldda	[%i0+%g0]ASI_BLK_SL,%f0 	! Block Load from 0000000030001400
!	Mem[0000000010141400] = ff000000a78c9bff, %f30 = 5d8f015a cf08230e
	ldda	[%i5+%g0]0x80,%f30	! %f30 = ff000000 a78c9bff
!	Mem[0000000030181410] = ffff0000, %l0 = 043aa992ef146b04
	ldsha	[%i6+%o5]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000010141400] = 000000ff, %l5 = 0000000000000000
	lduba	[%i5+%g0]0x88,%l5	! %l5 = 00000000000000ff

p0_label_277:
!	Starting 10 instruction Store Burst
!	Mem[0000000030001408] = 00000000, %l5 = 00000000000000ff
	ldstuba	[%i0+%o4]0x89,%l5	! %l5 = 0000000000000000
!	%f10 = 000000ff, Mem[0000000010081410] = ffffff7f
	sta	%f10,[%i2+%o5]0x80	! Mem[0000000010081410] = 000000ff
!	Mem[0000000010101408] = ffd1ddf4, %l0 = 0000000000000000
	ldstuba	[%i4+%o4]0x80,%l0	! %l0 = 00000000000000ff
!	%l5 = 0000000000000000, Mem[00000000100c1400] = 000000ff
	stba	%l5,[%i3+%g0]0x88	! Mem[00000000100c1400] = 00000000
!	%l5 = 0000000000000000, Mem[0000000030101408] = 00ff2a3f
	stwa	%l5,[%i4+%o4]0x89	! Mem[0000000030101408] = 00000000
!	Mem[0000000030001410] = 000000ff, %l6 = 00000000ffffffff
	ldstuba	[%i0+%o5]0x89,%l6	! %l6 = 00000000000000ff
!	%l6 = 00000000000000ff, Mem[0000000030081400] = fff90000
	stwa	%l6,[%i2+%g0]0x81	! Mem[0000000030081400] = 000000ff
!	%l1 = 63a8231cab8800cf, Mem[00000000211c0000] = ffff6b10
	sth	%l1,[%o2+%g0]		! Mem[00000000211c0000] = 00cf6b10
!	Mem[00000000218000c1] = 16ab8bd0, %l6 = 00000000000000ff
	ldstub	[%o3+0x0c1],%l6		! %l6 = 00000000000000ab
!	%l3 = 00000000587464ff, Mem[0000000010181408] = ff000000
	stwa	%l3,[%i6+%o4]0x80	! Mem[0000000010181408] = 587464ff

p0_label_278:
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (54)
!	Mem[0000000030101400] = 7e000000 587464ff 00000000 00000000
!	Mem[0000000030101410] = dbffffff 5b0fe295 000000ff 00009780
!	Mem[0000000030101420] = 00000000 00000000 00009780 ffffffff
!	Mem[0000000030101430] = ff0000ff 5b0fe295 63ad6ddf 2ca93559
	ldda	[%i4+%g0]ASI_BLK_AIUSL,%f0 	! Block Load from 0000000030101400
!	Mem[00000000100c143c] = 3ff082bb, %l0 = 00000000000000ff, %asi = 80
	lduha	[%i3+0x03c]%asi,%l0	! %l0 = 0000000000003ff0
!	Mem[0000000010101408] = 00000000f4ddd1ff, %f22 = 437bb870 daa64a31
	ldda	[%i4+%o4]0x88,%f22	! %f22 = 00000000 f4ddd1ff
!	Mem[0000000030041408] = c5acff6b043552ff, %f22 = 00000000 f4ddd1ff
	ldda	[%i1+%o4]0x89,%f22	! %f22 = c5acff6b 043552ff
!	Mem[0000000030101410] = dbffffff, %l2 = 0000000000000000
	lduwa	[%i4+%o5]0x81,%l2	! %l2 = 00000000dbffffff
!	Mem[0000000010141432] = ffffffff, %l7 = 000000000000f9ff
	ldsb	[%i5+0x032],%l7		! %l7 = ffffffffffffffff
!	Mem[0000000010041408] = 000d0000, %l0 = 0000000000003ff0
	ldswa	[%i1+%o4]0x80,%l0	! %l0 = 00000000000d0000
!	Mem[0000000010001400] = 00000000 000000ff, %l6 = 000000ab, %l7 = ffffffff
	ldda	[%i0+%g0]0x80,%l6	! %l6 = 0000000000000000 00000000000000ff
!	Mem[0000000010141408] = 80970000ff000000, %f20 = 80970000 000000ff
	ldda	[%i5+%o4]0x80,%f20	! %f20 = 80970000 ff000000
!	Mem[0000000030141408] = 6bffacc5, %l0 = 00000000000d0000
	ldsba	[%i5+%o4]0x89,%l0	! %l0 = ffffffffffffffc5

p0_label_279:
!	Starting 10 instruction Store Burst
!	%l7 = 00000000000000ff, Mem[00000000100c1408] = 000000ff
	stwa	%l7,[%i3+%o4]0x88	! Mem[00000000100c1408] = 000000ff
!	%l7 = 00000000000000ff, Mem[0000000030181400] = ff0c0000
	stba	%l7,[%i6+%g0]0x81	! Mem[0000000030181400] = ff0c0000
!	%f28 = 6b97140b 97809b06, Mem[0000000010141430] = ffffffff 9780ffff, %asi = 80
	stda	%f28,[%i5+0x030]%asi	! Mem[0000000010141430] = 6b97140b 97809b06
!	%l7 = 00000000000000ff, Mem[00000000300c1400] = 00350000
	stha	%l7,[%i3+%g0]0x89	! Mem[00000000300c1400] = 003500ff
!	%f0  = ff647458 0000007e, %l2 = 00000000dbffffff
!	Mem[00000000300c1438] = 6513aa12657e0e9b
	add	%i3,0x038,%g1
	stda	%f0,[%g1+%l2]ASI_PST8_SL ! Mem[00000000300c1438] = 7e000000587464ff
!	Mem[0000000030141400] = ffffff00 0000007e c5acff6b ffffff7f
!	%f16 = 000d0000 dba68d03 00000000 00000000
!	%f20 = 80970000 ff000000 c5acff6b 043552ff
!	%f24 = d925f62d 68a8f31d 000000ff 00009780
!	%f28 = 6b97140b 97809b06 ff000000 a78c9bff
	stda	%f16,[%i5+%g0]ASI_BLK_S	! Block Store to 0000000030141400
!	Mem[00000000201c0000] = ffffe880, %l6 = 0000000000000000
	ldstub	[%o0+%g0],%l6		! %l6 = 00000000000000ff
!	Code Fragment 3, seed = 395482
p0_fragment_26:
!	%l0 = ffffffffffffffc5
	setx	0xd64f094b9d292b56,%g7,%l0 ! %l0 = d64f094b9d292b56
!	%l1 = 63a8231cab8800cf
	setx	0x78d3659f2cc4b881,%g7,%l1 ! %l1 = 78d3659f2cc4b881
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = d64f094b9d292b56
	setx	0x309e448a7a7259bc,%g7,%l0 ! %l0 = 309e448a7a7259bc
!	%l1 = 78d3659f2cc4b881
	setx	0x5f0dcbe822331207,%g7,%l1 ! %l1 = 5f0dcbe822331207
p0_fragment_26_end:
!	%l6 = 000000ff, %l7 = 000000ff, Mem[0000000010081408] = 00000000 000000ff, %asi = 80
	stda	%l6,[%i2+0x008]%asi	! Mem[0000000010081408] = 000000ff 000000ff
!	%l6 = 000000ff, %l7 = 000000ff, Mem[00000000100c1408] = 000000ff dbffffff
	stda	%l6,[%i3+%o4]0x88	! Mem[00000000100c1408] = 000000ff 000000ff

p0_label_280:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101419] = 000000ff, %l4 = ff000000ffffffdb
	ldsb	[%i4+0x019],%l4		! %l4 = 0000000000000000
!	Mem[0000000030001400] = ff000000, %l7 = 00000000000000ff
	ldsha	[%i0+%g0]0x81,%l7	! %l7 = ffffffffffffff00
!	Mem[0000000010041420] = 0000001d 00000000, %l4 = 00000000, %l5 = 00000000
	ldd	[%i1+0x020],%l4		! %l4 = 000000000000001d 0000000000000000
!	Mem[00000000100c1408] = 000000ff 000000ff, %l6 = 000000ff, %l7 = ffffff00
	ldda	[%i3+%o4]0x88,%l6	! %l6 = 00000000000000ff 00000000000000ff
!	Mem[0000000010081408] = ff000000, %l4 = 000000000000001d
	ldswa	[%i2+%o4]0x88,%l4	! %l4 = ffffffffff000000
!	Mem[00000000100c143e] = 3ff082bb, %l3 = 00000000587464ff
	ldsh	[%i3+0x03e],%l3		! %l3 = ffffffffffff82bb
!	Mem[0000000030181400] = 00000cff, %l4 = ffffffffff000000
	ldsba	[%i6+%g0]0x89,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010001434] = 069b8097, %l1 = 5f0dcbe822331207
	lduw	[%i0+0x034],%l1		! %l1 = 00000000069b8097
!	Mem[0000000010101408] = 00000000f4ddd1ff, %f4  = 95e20f5b ffffffdb
	ldda	[%i4+%o4]0x88,%f4 	! %f4  = 00000000 f4ddd1ff
!	Mem[0000000010101410] = ff000000, %l0 = 309e448a7a7259bc
	lduba	[%i4+%o5]0x80,%l0	! %l0 = 00000000000000ff

p0_label_281:
!	Starting 10 instruction Store Burst
!	%l4 = ffffffffffffffff, Mem[00000000100c1408] = 000000ff
	stha	%l4,[%i3+%o4]0x88	! Mem[00000000100c1408] = 0000ffff
!	Mem[0000000030101408] = 00000000, %l2 = 00000000dbffffff
	ldstuba	[%i4+%o4]0x81,%l2	! %l2 = 0000000000000000
!	%l0 = 000000ff, %l1 = 069b8097, Mem[0000000030041400] = 00000000 ff9b8ca7
	stda	%l0,[%i1+%g0]0x89	! Mem[0000000030041400] = 000000ff 069b8097
!	Mem[0000000030041410] = 00000000, %l1 = 00000000069b8097
	ldstuba	[%i1+%o5]0x81,%l1	! %l1 = 0000000000000000
	membar	#Sync			! Added by membar checker (55)
!	Mem[0000000030141400] = 00000d00, %l2 = 0000000000000000
	ldstuba	[%i5+%g0]0x89,%l2	! %l2 = 0000000000000000
!	%l5 = 0000000000000000, Mem[0000000030141410] = 80970000
	stba	%l5,[%i5+%o5]0x81	! Mem[0000000030141410] = 00970000
!	%l6 = 00000000000000ff, Mem[0000000010001400] = 00000000000000ff, %asi = 80
	stxa	%l6,[%i0+0x000]%asi	! Mem[0000000010001400] = 00000000000000ff
!	%f16 = 000d0000 dba68d03, Mem[00000000300c1408] = ff7d6dcd bbf9c0bf
	stda	%f16,[%i3+%o4]0x81	! Mem[00000000300c1408] = 000d0000 dba68d03
!	%f3  = 00000000, %f12 = 95e20f5b, %f21 = ff000000
	fsubs	%f3 ,%f12,%f21		! %f21 = 15e20f5b
!	%l7 = 00000000000000ff, Mem[0000000020800001] = 00ff42b0
	stb	%l7,[%o1+0x001]		! Mem[0000000020800000] = 00ff42b0

p0_label_282:
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = ffffe880, %l7 = 00000000000000ff, %asi = 80
	lduha	[%o0+0x000]%asi,%l7	! %l7 = 000000000000ffff
!	Mem[0000000010001410] = 6bffacc5, %f4  = 00000000
	lda	[%i0+%o5]0x80,%f4 	! %f4 = 6bffacc5
!	Mem[0000000030001410] = ff000000, %l3 = ffffffffffff82bb
	lduwa	[%i0+%o5]0x81,%l3	! %l3 = 00000000ff000000
!	%f3  = 00000000, %f7  = ff000000
	fcmpes	%fcc3,%f3 ,%f7 		! %fcc3 = 2
!	Mem[0000000030181400] = ff0c0000 069b00da, %l2 = 00000000, %l3 = ff000000
	ldda	[%i6+%g0]0x81,%l2	! %l2 = 00000000ff0c0000 00000000069b00da
!	Mem[00000000211c0000] = 00cf6b10, %l6 = 00000000000000ff
	ldub	[%o2+%g0],%l6		! %l6 = 0000000000000000
!	Mem[00000000300c1400] = ffffac00 003500ff, %l4 = ffffffff, %l5 = 00000000
	ldda	[%i3+%g0]0x89,%l4	! %l4 = 00000000003500ff 00000000ffffac00
!	Mem[0000000010181410] = 00000000 000000ff, %l2 = ff0c0000, %l3 = 069b00da, %asi = 80
	ldda	[%i6+0x010]%asi,%l2	! %l2 = 0000000000000000 00000000000000ff
!	Mem[0000000010041400] = 00000000, %l7 = 000000000000ffff
	ldsba	[%i1+%g0]0x88,%l7	! %l7 = 0000000000000000
!	Mem[00000000100c1400] = 00000000, %l1 = 0000000000000000
	ldswa	[%i3+%g0]0x80,%l1	! %l1 = 0000000000000000

p0_label_283:
!	Starting 10 instruction Store Burst
!	%l2 = 0000000000000000, Mem[0000000020800040] = 00ff18e0, %asi = 80
	stha	%l2,[%o1+0x040]%asi	! Mem[0000000020800040] = 000018e0
!	%f16 = 000d0000 dba68d03, Mem[00000000300c1410] = a78c9bff 7e0000ff
	stda	%f16,[%i3+%o5]0x89	! Mem[00000000300c1410] = 000d0000 dba68d03
!	Mem[00000000201c0001] = ffffe880, %l2 = 0000000000000000
	ldstub	[%o0+0x001],%l2		! %l2 = 00000000000000ff
!	Mem[00000000300c1408] = 00000d00, %l5 = 00000000ffffac00
	ldstuba	[%i3+%o4]0x89,%l5	! %l5 = 0000000000000000
!	%f0  = ff647458 0000007e, Mem[0000000030181408] = 00000000 000000ff
	stda	%f0 ,[%i6+%o4]0x89	! Mem[0000000030181408] = ff647458 0000007e
!	%l4 = 00000000003500ff, Mem[00000000100c1408] = ffff0000
	stba	%l4,[%i3+%o4]0x80	! Mem[00000000100c1408] = ffff0000
!	%l3 = 00000000000000ff, Mem[0000000010141438] = bb82f03fff000000
	stx	%l3,[%i5+0x038]		! Mem[0000000010141438] = 00000000000000ff
!	%f28 = 6b97140b, %f27 = 00009780, %f9  = 00000000
	fsubs	%f28,%f27,%f9 		! tt=0x22, %l0 = 0000000000000121
!	%l2 = 000000ff, %l3 = 000000ff, Mem[0000000030101400] = 0000007e ff647458
	stda	%l2,[%i4+%g0]0x89	! Mem[0000000030101400] = 000000ff 000000ff
!	Mem[0000000010181408] = ff647458, %l6 = 0000000000000000
	ldstuba	[%i6+%o4]0x88,%l6	! %l6 = 0000000000000058

p0_label_284:
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = 0000007e, %l2 = 00000000000000ff
	lduha	[%i6+%o4]0x89,%l2	! %l2 = 000000000000007e
!	%l1 = 0000000000000000, imm = 0000000000000fa7, %l2 = 000000000000007e
	subc	%l1,0xfa7,%l2		! %l2 = fffffffffffff059
!	Mem[0000000010041410] = ff000000, %l1 = 0000000000000000
	lduba	[%i1+%o5]0x80,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030101408] = ff000000, %l7 = 0000000000000000
	lduha	[%i4+%o4]0x81,%l7	! %l7 = 000000000000ff00
!	%l1 = 00000000000000ff, imm = 000000000000090b, %l1 = 00000000000000ff
	andn	%l1,0x90b,%l1		! %l1 = 00000000000000f4
!	Mem[0000000030181408] = 7e000000587464ff, %f16 = 000d0000 dba68d03
	ldda	[%i6+%o4]0x81,%f16	! %f16 = 7e000000 587464ff
!	Mem[0000000030001400] = ff000000, %l3 = 00000000000000ff
	lduha	[%i0+%g0]0x81,%l3	! %l3 = 000000000000ff00
!	Mem[0000000010141408] = 00009780, %l3 = 000000000000ff00
	ldsba	[%i5+%o4]0x88,%l3	! %l3 = ffffffffffffff80
!	Mem[0000000010001410] = 6bffacc5, %l7 = 000000000000ff00
	lduba	[%i0+%o5]0x80,%l7	! %l7 = 000000000000006b
!	Mem[00000000300c1408] = 038da6db00000dff, %l6 = 0000000000000058
	ldxa	[%i3+%o4]0x89,%l6	! %l6 = 038da6db00000dff

p0_label_285:
!	Starting 10 instruction Store Burst
!	%l2 = fffffffffffff059, Mem[00000000100c1406] = 00000000, %asi = 80
	stha	%l2,[%i3+0x006]%asi	! Mem[00000000100c1404] = 0000f059
!	Mem[0000000030081410] = 64ff0000, %l0 = 0000000000000121
	ldstuba	[%i2+%o5]0x81,%l0	! %l0 = 0000000000000064
!	%l0 = 0000000000000064, Mem[0000000010101400] = ff000000
	stha	%l0,[%i4+%g0]0x80	! Mem[0000000010101400] = 00640000
!	%l2 = fffffffffffff059, Mem[0000000010081400] = ff009780
	stwa	%l2,[%i2+%g0]0x80	! Mem[0000000010081400] = fffff059
!	Mem[0000000010181408] = ff7464ff6bffacc5, %l0 = 0000000000000064, %l3 = ffffffffffffff80
	add	%i6,0x08,%g1
	casxa	[%g1]0x80,%l0,%l3	! %l3 = ff7464ff6bffacc5
!	%l3 = ff7464ff6bffacc5, Mem[0000000030141400] = ff0d0000dba68d03
	stxa	%l3,[%i5+%g0]0x81	! Mem[0000000030141400] = ff7464ff6bffacc5
!	%l7 = 000000000000006b, Mem[00000000300c1410] = 000d0000dba68d03
	stxa	%l7,[%i3+%o5]0x89	! Mem[00000000300c1410] = 000000000000006b
!	Mem[00000000300c1408] = 00000dff, %l6 = 038da6db00000dff
	ldstuba	[%i3+%o4]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[00000000211c0001] = 00cf6b10, %l2 = fffffffffffff059
	ldstuba	[%o2+0x001]%asi,%l2	! %l2 = 00000000000000cf
!	Mem[0000000010181408] = ff7464ff, %l7 = 000000000000006b
	swapa	[%i6+%o4]0x80,%l7	! %l7 = 00000000ff7464ff

p0_label_286:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = ff000000, %l6 = 00000000000000ff
	ldswa	[%i1+%o5]0x80,%l6	! %l6 = ffffffffff000000
!	Mem[0000000030141410] = 00009700, %f31 = a78c9bff
	lda	[%i5+%o5]0x89,%f31	! %f31 = 00009700
!	Mem[0000000030041410] = ff000000, %l6 = ffffffffff000000
	ldsba	[%i1+%o5]0x81,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000021800141] = 28658430, %l1 = 00000000000000f4
	ldsb	[%o3+0x141],%l1		! %l1 = 0000000000000065
	membar	#Sync			! Added by membar checker (56)
!	Mem[0000000010181400] = ffffffff 0435525a 0000006b 6bffacc5
!	Mem[0000000010181410] = 00000000 000000ff 000000db 000000ff
!	Mem[0000000010181420] = 1d0000ff c5acff6b 000000ff fe9b4b99
!	Mem[0000000010181430] = 00000000 00000000 63ad6ddf 23000000
	ldda	[%i6+%g0]ASI_BLK_P,%f0 	! Block Load from 0000000010181400
!	Mem[0000000010041400] = 00000000, %l3 = ff7464ff6bffacc5
	ldswa	[%i1+%g0]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000010001438] = 96007458, %l3 = 0000000000000000, %asi = 80
	lduwa	[%i0+0x038]%asi,%l3	! %l3 = 0000000096007458
!	Mem[0000000010081410] = 000000ff, %l1 = 0000000000000065
	ldsha	[%i2+%o5]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000030041400] = 000000ff, %l3 = 0000000096007458
	lduwa	[%i1+%g0]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010181408] = 0000006b, %l7 = 00000000ff7464ff
	lduwa	[%i6+%o4]0x80,%l7	! %l7 = 000000000000006b

p0_label_287:
!	Starting 10 instruction Store Burst
!	Mem[0000000010101408] = ffd1ddf4, %l4 = 00000000003500ff
	ldstuba	[%i4+%o4]0x80,%l4	! %l4 = 00000000000000ff
!	%f14 = 63ad6ddf, %f9  = c5acff6b, %f16 = 7e000000
	fdivs	%f14,%f9 ,%f16		! %f16 = dd8051b9
!	Mem[0000000030001400] = ff000000, %l1 = 0000000000000000
	ldstuba	[%i0+%g0]0x81,%l1	! %l1 = 00000000000000ff
!	%l1 = 00000000000000ff, %l6 = ffffffffffffffff, %y  = d6dbd1e4
	umul	%l1,%l6,%l5		! %l5 = 000000feffffff01, %y = 000000fe
!	Mem[0000000030041408] = ff523504, %l3 = 00000000000000ff
	ldstuba	[%i1+%o4]0x81,%l3	! %l3 = 00000000000000ff
!	%l2 = 00000000000000cf, Mem[0000000020800040] = 000018e0
	sth	%l2,[%o1+0x040]		! Mem[0000000020800040] = 00cf18e0
!	Mem[0000000030001408] = ff000000, %l4 = 00000000000000ff
	swapa	[%i0+%o4]0x81,%l4	! %l4 = 00000000ff000000
!	Mem[00000000100c1408] = ffff0000, %l4 = 00000000ff000000
	ldsha	[%i3+%o4]0x80,%l4	! %l4 = ffffffffffffffff
!	%f24 = d925f62d 68a8f31d, Mem[0000000010041420] = 0000001d 00000000
	std	%f24,[%i1+0x020]	! Mem[0000000010041420] = d925f62d 68a8f31d
!	%f26 = 000000ff, Mem[0000000010081408] = 000000ff
	sta	%f26,[%i2+0x008]%asi	! Mem[0000000010081408] = 000000ff

p0_label_288:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = 000000ff ff000000, %l2 = 000000cf, %l3 = 000000ff
	ldda	[%i2+%o5]0x88,%l2	! %l2 = 00000000ff000000 00000000000000ff
!	Mem[0000000010181408] = 6b000000, %l0 = 0000000000000064
	ldsba	[%i6+%o4]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000030101400] = 000000ff, %f27 = 00009780
	lda	[%i4+%g0]0x89,%f27	! %f27 = 000000ff
!	Mem[0000000010001400] = 00000000, %l3 = 00000000000000ff
	lduwa	[%i0+%g0]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000030081410] = 069b80970000ffff, %f20 = 80970000 15e20f5b
	ldda	[%i2+%o5]0x89,%f20	! %f20 = 069b8097 0000ffff
!	Mem[0000000030081410] = ffff0000 97809b06, %l6 = ffffffff, %l7 = 0000006b
	ldda	[%i2+%o5]0x81,%l6	! %l6 = 00000000ffff0000 0000000097809b06
!	Mem[00000000201c0000] = ffffe880, %l1 = 00000000000000ff, %asi = 80
	lduha	[%o0+0x000]%asi,%l1	! %l1 = 000000000000ffff
!	Mem[0000000030101400] = 000000ff, %l7 = 0000000097809b06
	lduba	[%i4+%g0]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[00000000100c1400] = 00000000, %l0 = 0000000000000000
	ldsba	[%i3+%g0]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000010181404] = 0435525a, %l0 = 0000000000000000, %asi = 80
	lduba	[%i6+0x004]%asi,%l0	! %l0 = 0000000000000004

p0_label_289:
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (57)
!	%f30 = ff000000 00009700, Mem[0000000010181400] = ffffffff 5a523504
	stda	%f30,[%i6+%g0]0x88	! Mem[0000000010181400] = ff000000 00009700
!	Mem[0000000030081410] = ffff0000, %l5 = 000000feffffff01
	ldstuba	[%i2+%o5]0x81,%l5	! %l5 = 00000000000000ff
!	%l6 = ffff0000, %l7 = 000000ff, Mem[0000000030101408] = 000000ff 00000000
	stda	%l6,[%i4+%o4]0x89	! Mem[0000000030101408] = ffff0000 000000ff
!	Mem[0000000010101410] = ff000000, %l6 = 00000000ffff0000
	ldstuba	[%i4+%o5]0x80,%l6	! %l6 = 00000000000000ff
!	Mem[00000000100c1414] = 0000007f, %l2 = 00000000ff000000
	swap	[%i3+0x014],%l2		! %l2 = 000000000000007f
!	%f0  = ffffffff, Mem[000000001008141c] = ff000000
	sta	%f0 ,[%i2+0x01c]%asi	! Mem[000000001008141c] = ffffffff
!	%f4  = 00000000 000000ff, Mem[0000000010001410] = c5acff6b 0000ffff
	stda	%f4 ,[%i0+%o5]0x88	! Mem[0000000010001410] = 00000000 000000ff
!	Code Fragment 3, seed = 151144
p0_fragment_27:
!	%l0 = 0000000000000004
	setx	0xd3f679706a87ece6,%g7,%l0 ! %l0 = d3f679706a87ece6
!	%l1 = 000000000000ffff
	setx	0xaebe56bcf4330511,%g7,%l1 ! %l1 = aebe56bcf4330511
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = d3f679706a87ece6
	setx	0x12431464fdf6414c,%g7,%l0 ! %l0 = 12431464fdf6414c
!	%l1 = aebe56bcf4330511
	setx	0x0bba89a48a35a497,%g7,%l1 ! %l1 = 0bba89a48a35a497
p0_fragment_27_end:
!	Mem[0000000010141414] = 0000ffff, %l7 = 00000000000000ff
	swap	[%i5+0x014],%l7		! %l7 = 000000000000ffff
!	%l6 = 00000000000000ff, Mem[0000000030041410] = ff000000
	stha	%l6,[%i1+%o5]0x81	! Mem[0000000030041410] = 00ff0000

p0_label_290:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041430] = 97809b06, %f30 = ff000000
	ld	[%i1+0x030],%f30	! %f30 = 97809b06
!	Mem[0000000010181428] = 000000fffe9b4b99, %l3 = 0000000000000000, %asi = 80
	ldxa	[%i6+0x028]%asi,%l3	! %l3 = 000000fffe9b4b99
!	Mem[00000000100c1408] = ffff0000, %l2 = 000000000000007f
	lduba	[%i3+%o4]0x80,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010041408] = 000d0000, %l2 = 00000000000000ff
	lduba	[%i1+%o4]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000010001400] = 00000000, %f23 = 043552ff
	lda	[%i0+%g0]0x88,%f23	! %f23 = 00000000
!	Mem[0000000030081410] = ffff0000 97809b06, %l6 = 000000ff, %l7 = 0000ffff
	ldda	[%i2+%o5]0x81,%l6	! %l6 = 00000000ffff0000 0000000097809b06
!	Mem[0000000030001408] = ff000000, %l1 = 0bba89a48a35a497
	lduba	[%i0+%o4]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000030141400] = ff7464ff, %f8  = 1d0000ff
	lda	[%i5+%g0]0x81,%f8 	! %f8 = ff7464ff
!	Mem[000000001008143c] = ffff7fff, %f26 = 000000ff
	lda	[%i2+0x03c]%asi,%f26	! %f26 = ffff7fff
!	Mem[0000000010041410] = 000000ff, %l5 = 00000000000000ff
	lduba	[%i1+%o5]0x88,%l5	! %l5 = 00000000000000ff

p0_label_291:
!	Starting 10 instruction Store Burst
!	%l4 = ffffffffffffffff, Mem[0000000030101408] = 0000ffff
	stba	%l4,[%i4+%o4]0x81	! Mem[0000000030101408] = ff00ffff
!	Mem[000000001008140c] = 000000ff, %l3 = 00000000fe9b4b99, %asi = 80
	swapa	[%i2+0x00c]%asi,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030081400] = 000000ff, %l0 = 12431464fdf6414c
	ldstuba	[%i2+%g0]0x81,%l0	! %l0 = 0000000000000000
!	%l7 = 0000000097809b06, Mem[00000000300c1408] = 038da6db00000dff
	stxa	%l7,[%i3+%o4]0x89	! Mem[00000000300c1408] = 0000000097809b06
!	%l4 = ffffffff, %l5 = 000000ff, Mem[0000000010101408] = ffd1ddf4 00000000
	stda	%l4,[%i4+%o4]0x80	! Mem[0000000010101408] = ffffffff 000000ff
!	%l0 = 0000000000000000, Mem[0000000030101408] = ff00ffffff000000
	stxa	%l0,[%i4+%o4]0x81	! Mem[0000000030101408] = 0000000000000000
!	%l5 = 00000000000000ff, Mem[0000000030041410] = 00ff0000
	stba	%l5,[%i1+%o5]0x81	! Mem[0000000030041410] = ffff0000
!	Mem[0000000030001400] = 000000ff, %l1 = 0000000000000000
	swapa	[%i0+%g0]0x89,%l1	! %l1 = 00000000000000ff
!	%l0 = 0000000000000000, Mem[000000001014140c] = ff000000, %asi = 80
	stba	%l0,[%i5+0x00c]%asi	! Mem[000000001014140c] = 00000000
!	Mem[0000000021800080] = ffaa49a0, %l4 = ffffffffffffffff
	ldstub	[%o3+0x080],%l4		! %l4 = 00000000000000ff

p0_label_292:
!	Starting 10 instruction Load Burst
!	Mem[0000000021800001] = ff003940, %l5 = 00000000000000ff, %asi = 80
	lduba	[%o3+0x001]%asi,%l5	! %l5 = 0000000000000000
!	Mem[000000001018143b] = 63ad6ddf, %l1 = 00000000000000ff
	ldsb	[%i6+0x03b],%l1		! %l1 = ffffffffffffffdf
!	Mem[00000000201c0000] = ffffe880, %l2 = 0000000000000000, %asi = 80
	ldsba	[%o0+0x000]%asi,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000030001410] = ff000000, %l6 = 00000000ffff0000
	ldsba	[%i0+%o5]0x81,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010181410] = 00000000 000000ff, %l0 = 00000000, %l1 = ffffffdf
	ldda	[%i6+%o5]0x80,%l0	! %l0 = 0000000000000000 00000000000000ff
!	Mem[0000000010101410] = ff0000007fffffff, %l5 = 0000000000000000
	ldxa	[%i4+%o5]0x80,%l5	! %l5 = ff0000007fffffff
!	Mem[0000000010101410] = ff0000007fffffff, %f30 = 97809b06 00009700
	ldda	[%i4+%o5]0x80,%f30	! %f30 = ff000000 7fffffff
!	Mem[0000000010101410] = 000000ff, %l6 = ffffffffffffffff
	ldswa	[%i4+%o5]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[00000000100c1400] = 000000000000f059, %l6 = 00000000000000ff
	ldxa	[%i3+%g0]0x80,%l6	! %l6 = 000000000000f059
!	Mem[00000000100c1408] = ffff0000, %l6 = 000000000000f059
	lduh	[%i3+%o4],%l6		! %l6 = 000000000000ffff

p0_label_293:
!	Starting 10 instruction Store Burst
!	%f16 = dd8051b9 587464ff, Mem[0000000010081410] = 000000ff ff000000, %asi = 80
	stda	%f16,[%i2+0x010]%asi	! Mem[0000000010081410] = dd8051b9 587464ff
!	Mem[000000001008143d] = ffff7fff, %l7 = 0000000097809b06
	ldstuba	[%i2+0x03d]%asi,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030141410] = 00009700, %l2 = 00000000ffffffff
	swapa	[%i5+%o5]0x89,%l2	! %l2 = 0000000000009700
!	Mem[0000000021800081] = ffaa49a0, %l2 = 0000000000009700
	ldstub	[%o3+0x081],%l2		! %l2 = 00000000000000aa
!	%l4 = 00000000000000ff, Mem[0000000030181410] = ffff0000
	stha	%l4,[%i6+%o5]0x89	! Mem[0000000030181410] = ffff00ff
!	%l6 = 000000000000ffff, Mem[0000000010041400] = 00000000
	stha	%l6,[%i1+%g0]0x80	! Mem[0000000010041400] = ffff0000
!	%l6 = 000000000000ffff, Mem[0000000030101400] = 000000ff
	stba	%l6,[%i4+%g0]0x89	! Mem[0000000030101400] = 000000ff
!	%f18 = 00000000 00000000, Mem[0000000030081408] = 00003500 ff000000
	stda	%f18,[%i2+%o4]0x89	! Mem[0000000030081408] = 00000000 00000000
!	%l2 = 00000000000000aa, Mem[00000000201c0000] = ffffe880
	stb	%l2,[%o0+%g0]		! Mem[00000000201c0000] = aaffe880
!	Mem[0000000010081400] = fffff059 ff000000 000000ff fe9b4b99
!	%f16 = dd8051b9 587464ff 00000000 00000000
!	%f20 = 069b8097 0000ffff c5acff6b 00000000
!	%f24 = d925f62d 68a8f31d ffff7fff 000000ff
!	%f28 = 6b97140b 97809b06 ff000000 7fffffff
	stda	%f16,[%i2+%g0]ASI_BLK_AIUPL	! Block Store to 0000000010081400

p0_label_294:
!	Starting 10 instruction Load Burst
!	Mem[0000000021800180] = 65743a60, %l7 = 00000000000000ff, %asi = 80
	lduha	[%o3+0x180]%asi,%l7	! %l7 = 0000000000006574
	membar	#Sync			! Added by membar checker (58)
!	Mem[000000001008142c] = ff7fffff, %f8  = ff7464ff
	lda	[%i2+0x02c]%asi,%f8 	! %f8 = ff7fffff
!	Mem[00000000300c1410] = 0000006b, %l2 = 00000000000000aa
	lduha	[%i3+%o5]0x89,%l2	! %l2 = 000000000000006b
!	Mem[0000000030181408] = 7e000000, %l1 = 00000000000000ff
	ldsha	[%i6+%o4]0x81,%l1	! %l1 = 0000000000007e00
!	%l7 = 0000000000006574, immd = fffffa9d, %y  = 000000fe
	smul	%l7,-0x563,%l5		! %l5 = fffffffffddd8024, %y = ffffffff
!	Mem[0000000010181400] = 00970000, %f26 = ffff7fff
	ld	[%i6+%g0],%f26		! %f26 = 00970000
!	Mem[0000000010181400] = 00970000, %f2  = 0000006b
	lda	[%i6+%g0]0x80,%f2 	! %f2 = 00970000
!	Mem[0000000030181408] = 7e000000587464ff, %f0  = ffffffff 0435525a
	ldda	[%i6+%o4]0x81,%f0 	! %f0  = 7e000000 587464ff
!	Mem[0000000030101408] = 00000000, %l4 = 00000000000000ff
	ldsha	[%i4+%o4]0x89,%l4	! %l4 = 0000000000000000
!	Mem[00000000100c1410] = 587464ff, %l4 = 0000000000000000
	lduba	[%i3+%o5]0x88,%l4	! %l4 = 00000000000000ff

p0_label_295:
!	Starting 10 instruction Store Burst
!	%l4 = 00000000000000ff, Mem[0000000020800000] = 00ff42b0
	sth	%l4,[%o1+%g0]		! Mem[0000000020800000] = 00ff42b0
!	%f14 = 63ad6ddf 23000000, Mem[0000000030181400] = ff0c0000 069b00da
	stda	%f14,[%i6+%g0]0x81	! Mem[0000000030181400] = 63ad6ddf 23000000
!	%l1 = 0000000000007e00, Mem[0000000010101410] = 000000ff
	stha	%l1,[%i4+%o5]0x88	! Mem[0000000010101410] = 00007e00
!	Mem[00000000201c0000] = aaffe880, %l3 = 00000000000000ff
	ldstuba	[%o0+0x000]%asi,%l3	! %l3 = 00000000000000aa
!	%f16 = dd8051b9, Mem[0000000010081400] = ff647458
	sta	%f16,[%i2+%g0]0x80	! Mem[0000000010081400] = dd8051b9
!	%l3 = 00000000000000aa, Mem[0000000010141428] = 000000ff
	stw	%l3,[%i5+0x028]		! Mem[0000000010141428] = 000000aa
!	Mem[0000000030001400] = 00000000, %l4 = 00000000000000ff
	swapa	[%i0+%g0]0x89,%l4	! %l4 = 0000000000000000
!	%l7 = 0000000000006574, Mem[0000000030101408] = 00000000
	stwa	%l7,[%i4+%o4]0x89	! Mem[0000000030101408] = 00006574
!	Mem[0000000010081400] = dd8051b9, %l2 = 000000000000006b
	ldstuba	[%i2+%g0]0x80,%l2	! %l2 = 00000000000000dd
!	Mem[0000000030181410] = ff00ffff, %l5 = 00000000fddd8024
	swapa	[%i6+%o5]0x81,%l5	! %l5 = 00000000ff00ffff

p0_label_296:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041428] = 00000000000000ff, %l2 = 00000000000000dd
	ldx	[%i1+0x028],%l2		! %l2 = 00000000000000ff
!	Mem[0000000010101410] = 00007e00, %l5 = 00000000ff00ffff
	lduha	[%i4+%o5]0x88,%l5	! %l5 = 0000000000007e00
!	Mem[0000000010141410] = ffff9b06, %l6 = 000000000000ffff
	lduwa	[%i5+%o5]0x80,%l6	! %l6 = 00000000ffff9b06
!	Mem[0000000030141400] = ff6474ff, %l3 = 00000000000000aa
	ldsha	[%i5+%g0]0x89,%l3	! %l3 = 00000000000074ff
!	Mem[0000000010081408] = 00000000, %l7 = 0000000000006574
	ldsba	[%i2+%o4]0x80,%l7	! %l7 = 0000000000000000
!	Mem[00000000300c1410] = 0000006b, %l1 = 0000000000007e00
	ldsba	[%i3+%o5]0x89,%l1	! %l1 = 000000000000006b
!	Mem[00000000300c1400] = ff003500, %f18 = 00000000
	lda	[%i3+%g0]0x81,%f18	! %f18 = ff003500
!	Mem[00000000211c0000] = 00ff6b10, %l6 = 00000000ffff9b06
	ldsh	[%o2+%g0],%l6		! %l6 = 00000000000000ff
!	Mem[0000000010001410] = 000000ff, %l2 = 00000000000000ff
	ldsba	[%i0+%o5]0x88,%l2	! %l2 = ffffffffffffffff
!	Mem[00000000300c1400] = ff003500, %l7 = 0000000000000000
	lduha	[%i3+%g0]0x81,%l7	! %l7 = 000000000000ff00

p0_label_297:
!	Starting 10 instruction Store Burst
!	%f2  = 00970000 6bffacc5, Mem[0000000030141400] = ff7464ff 6bffacc5
	stda	%f2 ,[%i5+%g0]0x81	! Mem[0000000030141400] = 00970000 6bffacc5
!	Mem[00000000300c1400] = ff003500, %l6 = 00000000000000ff
	swapa	[%i3+%g0]0x81,%l6	! %l6 = 00000000ff003500
!	%l6 = 00000000ff003500, %l6 = 00000000ff003500, %l2 = ffffffffffffffff
	andn	%l6,%l6,%l2		! %l2 = 0000000000000000
!	%l0 = 0000000000000000, Mem[00000000300c1400] = 000000ff00acffff
	stxa	%l0,[%i3+%g0]0x81	! Mem[00000000300c1400] = 0000000000000000
!	%l1 = 000000000000006b, Mem[0000000030041400] = ff000000
	stha	%l1,[%i1+%g0]0x81	! Mem[0000000030041400] = 006b0000
!	%f12 = 00000000 00000000, Mem[00000000100c1418] = 314aa6da d791a444, %asi = 80
	stda	%f12,[%i3+0x018]%asi	! Mem[00000000100c1418] = 00000000 00000000
!	Mem[0000000010001406] = 000000ff, %l4 = 0000000000000000
	ldstuba	[%i0+0x006]%asi,%l4	! %l4 = 0000000000000000
!	%l4 = 0000000000000000, Mem[0000000010041408] = 00000d00
	stwa	%l4,[%i1+%o4]0x88	! Mem[0000000010041408] = 00000000
!	%l7 = 000000000000ff00, Mem[00000000201c0000] = ffffe880, %asi = 80
	stha	%l7,[%o0+0x000]%asi	! Mem[00000000201c0000] = ff00e880
!	%l4 = 0000000000000000, Mem[0000000030041410] = 00ff00000000ffff
	stxa	%l4,[%i1+%o5]0x89	! Mem[0000000030041410] = 0000000000000000

p0_label_298:
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = 00000000 00000000, %l6 = ff003500, %l7 = 0000ff00
	ldda	[%i3+%g0]0x81,%l6	! %l6 = 0000000000000000 0000000000000000
!	%f31 = 7fffffff, %f18 = ff003500, %f22 = c5acff6b
	fadds	%f31,%f18,%f22		! %f22 = 7fffffff
!	Mem[0000000030181410] = 2480ddfd, %l4 = 0000000000000000
	ldsha	[%i6+%o5]0x89,%l4	! %l4 = ffffffffffffddfd
!	Mem[0000000010001438] = 96007458, %l6 = 0000000000000000
	ldsh	[%i0+0x038],%l6		! %l6 = ffffffffffff9600
!	Mem[0000000010001400] = ffff000000000000, %f10 = 000000ff fe9b4b99
	ldda	[%i0+%g0]0x88,%f10	! %f10 = ffff0000 00000000
!	Mem[0000000030101400] = ff000000, %l4 = ffffffffffffddfd
	ldswa	[%i4+%g0]0x81,%l4	! %l4 = ffffffffff000000
!	Mem[00000000100c1410] = ff647458 ff000000, %l0 = 00000000, %l1 = 0000006b
	ldda	[%i3+%o5]0x80,%l0	! %l0 = 00000000ff647458 00000000ff000000
!	Mem[0000000010101420] = 00000000, %l7 = 0000000000000000, %asi = 80
	ldsha	[%i4+0x020]%asi,%l7	! %l7 = 0000000000000000
!	Mem[0000000010041410] = ff000000 000000ff, %l0 = ff647458, %l1 = ff000000
	ldda	[%i1+%o5]0x88,%l0	! %l0 = 00000000000000ff 00000000ff000000
!	Mem[0000000010141434] = 97809b06, %l2 = 0000000000000000
	lduw	[%i5+0x034],%l2		! %l2 = 0000000097809b06

p0_label_299:
!	Starting 10 instruction Store Burst
!	%l1 = 00000000ff000000, Mem[0000000010101418] = 000000ff, %asi = 80
	stha	%l1,[%i4+0x018]%asi	! Mem[0000000010101418] = 000000ff
!	%f0  = 7e000000, %f29 = 97809b06, %f13 = 00000000
	fmuls	%f0 ,%f29,%f13		! %f13 = d6009b06
!	%l1 = 00000000ff000000, Mem[0000000030081410] = 069b80970000ffff
	stxa	%l1,[%i2+%o5]0x89	! Mem[0000000030081410] = 00000000ff000000
!	%l2 = 0000000097809b06, Mem[000000001000141d] = ffff8097, %asi = 80
	stba	%l2,[%i0+0x01d]%asi	! Mem[000000001000141c] = ff068097
!	Mem[0000000010141410] = 069bffff, %l2 = 0000000097809b06
	swapa	[%i5+%o5]0x88,%l2	! %l2 = 00000000069bffff
!	%l1 = 00000000ff000000, Mem[0000000010041408] = 038da6db00000000
	stxa	%l1,[%i1+%o4]0x88	! Mem[0000000010041408] = 00000000ff000000
!	%f28 = 6b97140b, Mem[0000000010081400] = ff8051b9
	sta	%f28,[%i2+%g0]0x80	! Mem[0000000010081400] = 6b97140b
!	%l7 = 0000000000000000, Mem[0000000030041400] = 006b0000
	stha	%l7,[%i1+%g0]0x81	! Mem[0000000030041400] = 00000000
!	Mem[0000000010141408] = 00009780, %l3 = 00000000000074ff
	ldstuba	[%i5+%o4]0x88,%l3	! %l3 = 0000000000000080
!	Mem[0000000010141400] = 000000ff, %l5 = 0000000000007e00
	ldstuba	[%i5+%g0]0x88,%l5	! %l5 = 00000000000000ff

p0_label_300:
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = 00000000, %l2 = 00000000069bffff
	lduwa	[%i1+%g0]0x89,%l2	! %l2 = 0000000000000000
	membar	#Sync			! Added by membar checker (59)
!	Mem[0000000010081400] = 6b97140b b95180dd 00000000 00000000
!	Mem[0000000010081410] = ffff0000 97809b06 00000000 6bffacc5
!	Mem[0000000010081420] = 1df3a868 2df625d9 ff000000 ff7fffff
!	Mem[0000000010081430] = 069b8097 0b14976b ffffff7f 000000ff
	ldda	[%i2+%g0]ASI_BLK_AIUPL,%f0 	! Block Load from 0000000010081400
!	Mem[00000000100c1400] = 59f0000000000000, %l6 = ffffffffffff9600
	ldxa	[%i3+%g0]0x88,%l6	! %l6 = 59f0000000000000
!	Mem[0000000030081400] = ff0000ff, %l2 = 0000000000000000
	ldsba	[%i2+%g0]0x81,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000030141400] = 00970000, %l7 = 0000000000000000
	lduwa	[%i5+%g0]0x81,%l7	! %l7 = 0000000000970000
!	Mem[0000000030081400] = da000000 ff0000ff, %l0 = 000000ff, %l1 = ff000000
	ldda	[%i2+%g0]0x89,%l0	! %l0 = 00000000ff0000ff 00000000da000000
!	Code Fragment 4, seed = 527123
p0_fragment_28:
!	%l0 = 00000000ff0000ff
	setx	0x15dbd8ac48ada28e,%g7,%l0 ! %l0 = 15dbd8ac48ada28e
!	%l1 = 00000000da000000
	setx	0x3e832529b3d9ea39,%g7,%l1 ! %l1 = 3e832529b3d9ea39
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 15dbd8ac48ada28e
	setx	0x91e0a5ebe2ad3df4,%g7,%l0 ! %l0 = 91e0a5ebe2ad3df4
!	%l1 = 3e832529b3d9ea39
	setx	0xf56719ddda7720bf,%g7,%l1 ! %l1 = f56719ddda7720bf
p0_fragment_28_end:
!	Mem[0000000030181408] = 0000007e, %l1 = f56719ddda7720bf
	ldswa	[%i6+%o4]0x89,%l1	! %l1 = 000000000000007e
!	%l4 = ffffffffff000000, immd = 0000000000000f34, %l108 = 0000000000000001
	udivx	%l4,0xf34,%l1		! %l1 = 0010d6b154fb7622
!	Mem[0000000030081400] = ff0000ff 000000da, %l6 = 00000000, %l7 = 00970000
	ldda	[%i2+%g0]0x81,%l6	! %l6 = 00000000ff0000ff 00000000000000da

p0_label_301:
!	Starting 10 instruction Store Burst
!	%l2 = ffffffff, %l3 = 00000080, Mem[00000000300c1408] = 069b8097 00000000
	stda	%l2,[%i3+%o4]0x81	! Mem[00000000300c1408] = ffffffff 00000080
!	Mem[0000000010041408] = 000000ff, %l2 = ffffffffffffffff
	ldstuba	[%i1+%o4]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000010181408] = 6b000000, %l6 = 00000000ff0000ff
	ldstuba	[%i6+%o4]0x88,%l6	! %l6 = 0000000000000000
!	%l0 = e2ad3df4, %l1 = 54fb7622, Mem[00000000100c1400] = 00000000 59f00000
	stda	%l0,[%i3+%g0]0x88	! Mem[00000000100c1400] = e2ad3df4 54fb7622
	membar	#Sync			! Added by membar checker (60)
!	%f4  = 069b8097 0000ffff, %l7 = 00000000000000da
!	Mem[0000000010081410] = ffff000097809b06
	add	%i2,0x010,%g1
	stda	%f4,[%g1+%l7]ASI_PST32_PL ! Mem[0000000010081410] = ffff000097809b06
!	%f24 = d925f62d 68a8f31d, Mem[0000000010081420] = 1df3a868 2df625d9
	std	%f24,[%i2+0x020]	! Mem[0000000010081420] = d925f62d 68a8f31d
!	Mem[0000000030041400] = 00000000, %l1 = 0000000054fb7622
	swapa	[%i1+%g0]0x89,%l1	! %l1 = 0000000000000000
!	Mem[00000000300c1408] = ffffffff, %l2 = 0000000000000000
	ldstuba	[%i3+%o4]0x81,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010041408] = ff0000ff, %l5 = 00000000000000ff
	ldstuba	[%i1+%o4]0x80,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010141410] = 069b8097, %l7 = 00000000000000da
	swapa	[%i5+%o5]0x80,%l7	! %l7 = 00000000069b8097

p0_label_302:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = ff970000, %l7 = 00000000069b8097
	lduha	[%i5+%o4]0x80,%l7	! %l7 = 000000000000ff97
!	Mem[0000000010001410] = 00000000000000ff, %l5 = 00000000000000ff
	ldxa	[%i0+%o5]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010181408] = c5acff6b6b0000ff, %f8  = d925f62d 68a8f31d
	ldda	[%i6+%o4]0x88,%f8 	! %f8  = c5acff6b 6b0000ff
	membar	#Sync			! Added by membar checker (61)
!	Mem[0000000030041400] = 2276fb54 97809b06 ff523504 6bffacc5
!	Mem[0000000030041410] = 00000000 00000000 4bad6d62 389c3533
!	Mem[0000000030041420] = ffffe36a 000007df ffd3f3cc 9664009b
!	Mem[0000000030041430] = 00000000 000000ff 4bad6d62 1d10ac3a
	ldda	[%i1+%g0]ASI_BLK_SL,%f16	! Block Load from 0000000030041400
!	Mem[0000000020800000] = 00ff42b0, %l1 = 0000000000000000
	ldsh	[%o1+%g0],%l1		! %l1 = 00000000000000ff
!	Mem[0000000030181410] = fddd8024, %l4 = ffffffffff000000
	lduwa	[%i6+%o5]0x81,%l4	! %l4 = 00000000fddd8024
!	Code Fragment 4, seed = 996526
p0_fragment_29:
!	%l0 = 91e0a5ebe2ad3df4
	setx	0xf3e2aafe0677e0b6,%g7,%l0 ! %l0 = f3e2aafe0677e0b6
!	%l1 = 00000000000000ff
	setx	0x63fd17fa8308efe1,%g7,%l1 ! %l1 = 63fd17fa8308efe1
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = f3e2aafe0677e0b6
	setx	0xbb4d0b767b5c731c,%g7,%l0 ! %l0 = bb4d0b767b5c731c
!	%l1 = 63fd17fa8308efe1
	setx	0xa73d4fd62c056d67,%g7,%l1 ! %l1 = a73d4fd62c056d67
p0_fragment_29_end:
!	Mem[0000000030001408] = 000000ff00000000, %f6  = c5acff6b 00000000
	ldda	[%i0+%o4]0x81,%f6 	! %f6  = 000000ff 00000000
!	Mem[0000000030141408] = 00000000, %f0  = dd8051b9
	lda	[%i5+%o4]0x89,%f0 	! %f0 = 00000000
!	Mem[0000000010141420] = 95e20f5b, %l7 = 0000ff97, %l5 = 000000ff
	add	%i5,0x20,%g1
	casa	[%g1]0x80,%l7,%l5	! %l5 = 0000000095e20f5b

p0_label_303:
!	Starting 10 instruction Store Burst
!	%l1 = a73d4fd62c056d67, Mem[0000000030141408] = 00000000
	stba	%l1,[%i5+%o4]0x81	! Mem[0000000030141408] = 67000000
!	%l2 = 000000ff, %l3 = 00000080, Mem[0000000010001400] = 00000000 ffff0000
	stda	%l2,[%i0+%g0]0x88	! Mem[0000000010001400] = 000000ff 00000080
!	Mem[0000000030041400] = 54fb7622, %l5 = 0000000095e20f5b
	ldstuba	[%i1+%g0]0x89,%l5	! %l5 = 0000000000000022
!	Mem[0000000010181400] = 00970000000000ff, %l6 = 0000000000000000, %l6 = 0000000000000000
	casxa	[%i6]0x80,%l6,%l6	! %l6 = 00970000000000ff
!	Mem[00000000201c0001] = ff00e880, %l3 = 0000000000000080
	ldstub	[%o0+0x001],%l3		! %l3 = 0000000000000000
!	%l1 = a73d4fd62c056d67, Mem[0000000010181400] = 00970000000000ff
	stxa	%l1,[%i6+%g0]0x80	! Mem[0000000010181400] = a73d4fd62c056d67
!	Mem[0000000030081408] = 00000000, %l7 = 000000000000ff97
	swapa	[%i2+%o4]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000010101410] = 00007e00, %l0 = 000000007b5c731c
	swapa	[%i4+%o5]0x88,%l0	! %l0 = 0000000000007e00
!	Mem[00000000300c1408] = ffffffff, %l1 = a73d4fd62c056d67
	ldstuba	[%i3+%o4]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010141400] = ff000000, %l7 = 0000000000000000
	ldstuba	[%i5+%g0]0x80,%l7	! %l7 = 00000000000000ff

p0_label_304:
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = 00009700, %l2 = 00000000000000ff
	lduwa	[%i5+%g0]0x89,%l2	! %l2 = 0000000000009700
!	%l5 = 0000000000000022, %l5 = 0000000000000022, %y  = ffffffff
	sdiv	%l5,%l5,%l0		! %l0 = fffffffff878787a
	mov	%l0,%y			! %y = f878787a
!	Mem[0000000030081400] = ff0000ff, %l0 = fffffffff878787a
	lduwa	[%i2+%g0]0x89,%l0	! %l0 = 00000000ff0000ff
!	Mem[0000000020800000] = 00ff42b0, %l6 = 00970000000000ff
	ldsh	[%o1+%g0],%l6		! %l6 = 00000000000000ff
!	Mem[0000000030001410] = 80970000000000ff, %f18 = c5acff6b 043552ff
	ldda	[%i0+%o5]0x89,%f18	! %f18 = 80970000 000000ff
!	Mem[0000000010181400] = a73d4fd62c056d67, %f14 = ff000000 7fffffff, %asi = 80
	ldda	[%i6+0x000]%asi,%f14	! %f14 = a73d4fd6 2c056d67
!	Mem[0000000030181400] = 63ad6ddf, %l2 = 0000000000009700
	ldsba	[%i6+%g0]0x81,%l2	! %l2 = 0000000000000063
!	Mem[0000000010081400] = 6b97140bb95180dd, %l5 = 0000000000000022
	ldx	[%i2+%g0],%l5		! %l5 = 6b97140bb95180dd
!	Mem[00000000300c1400] = 0000000000000000, %f2  = 00000000 00000000
	ldda	[%i3+%g0]0x89,%f2 	! %f2  = 00000000 00000000
!	Mem[0000000010001410] = ff000000 00000000, %l4 = fddd8024, %l5 = b95180dd
	ldda	[%i0+%o5]0x80,%l4	! %l4 = 00000000ff000000 0000000000000000

p0_label_305:
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (62)
!	%l1 = 00000000000000ff, Mem[0000000030041408] = ff523504
	stha	%l1,[%i1+%o4]0x81	! Mem[0000000030041408] = 00ff3504
!	%l7 = 00000000000000ff, Mem[000000001014143a] = 00000000, %asi = 80
	stba	%l7,[%i5+0x03a]%asi	! Mem[0000000010141438] = 0000ff00
!	%f16 = 069b8097 54fb7622, %l1 = 00000000000000ff
!	Mem[0000000030141400] = 009700006bffacc5
	stda	%f16,[%i5+%l1]ASI_PST8_SL ! Mem[0000000030141400] = 2276fb5497809b06
!	Mem[0000000030001400] = 000000ff, %l4 = 00000000ff000000
	swapa	[%i0+%g0]0x89,%l4	! %l4 = 00000000000000ff
!	%f2  = 00000000 00000000, Mem[0000000010001418] = a7ffff69 ff068097, %asi = 80
	stda	%f2 ,[%i0+0x018]%asi	! Mem[0000000010001418] = 00000000 00000000
!	%f5  = 0000ffff, %f12 = 6b97140b, %f12 = 6b97140b
	fdivs	%f5 ,%f12,%f12		! %f12 = 00000000
!	%l2 = 0000000000000063, Mem[00000000100c1410] = 587464ff
	stwa	%l2,[%i3+%o5]0x88	! Mem[00000000100c1410] = 00000063
!	Mem[0000000010181410] = 00000000, %l0 = 00000000ff0000ff
	swapa	[%i6+%o5]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000030041408] = 0435ff00, %l4 = 00000000000000ff
	ldstuba	[%i1+%o4]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000030041410] = 00000000, %l0 = 0000000000000000
	swapa	[%i1+%o5]0x81,%l0	! %l0 = 0000000000000000

p0_label_306:
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = 00000000 ff000000, %l0 = 00000000, %l1 = 000000ff
	ldda	[%i0+%o4]0x89,%l0	! %l0 = 00000000ff000000 0000000000000000
!	Mem[0000000030101400] = ff000000 ff000000 74650000 00000000
!	Mem[0000000030101410] = dbffffff 5b0fe295 000000ff 00009780
!	Mem[0000000030101420] = 00000000 00000000 00009780 ffffffff
!	Mem[0000000030101430] = ff0000ff 5b0fe295 63ad6ddf 2ca93559
	ldda	[%i4+%g0]ASI_BLK_S,%f16	! Block Load from 0000000030101400
!	Mem[0000000030041410] = 00000000, %l7 = 00000000000000ff
	ldsha	[%i1+%o5]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000030181408] = 0000007e, %l4 = 0000000000000000
	ldswa	[%i6+%o4]0x89,%l4	! %l4 = 000000000000007e
!	Mem[00000000300c1408] = ffffffff, %l7 = 0000000000000000
	ldsha	[%i3+%o4]0x81,%l7	! %l7 = ffffffffffffffff
!	Mem[00000000300c1410] = 6b000000, %f2  = 00000000
	lda	[%i3+%o5]0x81,%f2 	! %f2 = 6b000000
!	Mem[0000000030181400] = 63ad6ddf, %l5 = 0000000000000000
	ldswa	[%i6+%g0]0x81,%l5	! %l5 = 0000000063ad6ddf
!	Mem[0000000010181400] = a73d4fd6, %f11 = 000000ff
	lda	[%i6+%g0]0x80,%f11	! %f11 = a73d4fd6
!	Mem[0000000020800040] = 00cf18e0, %l3 = 0000000000000000
	ldstuba	[%o1+0x040]%asi,%l3	! %l3 = 0000000000000000
!	Mem[0000000010081408] = 00000000, %l6 = 00000000000000ff
	ldsba	[%i2+%o4]0x88,%l6	! %l6 = 0000000000000000

p0_label_307:
!	Starting 10 instruction Store Burst
!	Mem[0000000010081410] = 0000ffff, %l2 = 0000000000000063
	ldstuba	[%i2+%o5]0x88,%l2	! %l2 = 00000000000000ff
!	%l3 = 0000000000000000, Mem[0000000010041408] = ff0000ff
	stha	%l3,[%i1+%o4]0x88	! Mem[0000000010041408] = ff000000
!	%l7 = ffffffffffffffff, Mem[000000001004140d] = 00000000, %asi = 80
	stba	%l7,[%i1+0x00d]%asi	! Mem[000000001004140c] = 00ff0000
!	%l2 = 000000ff, %l3 = 00000000, Mem[0000000010041400] = 0000ffff 000000db
	stda	%l2,[%i1+%g0]0x88	! Mem[0000000010041400] = 000000ff 00000000
!	%l2 = 00000000000000ff, Mem[00000000100c1408] = ffff0000ff000000
	stxa	%l2,[%i3+%o4]0x80	! Mem[00000000100c1408] = 00000000000000ff
!	Mem[0000000010001400] = ff000000, %l2 = 00000000000000ff
	ldstuba	[%i0+%g0]0x80,%l2	! %l2 = 00000000000000ff
!	%f25 = 00000000, %f14 = a73d4fd6
	fsqrts	%f25,%f14		! %f14 = 00000000
!	%l3 = 0000000000000000, Mem[0000000010101410] = 7b5c731c
	stba	%l3,[%i4+%o5]0x88	! Mem[0000000010101410] = 7b5c7300
!	%l7 = ffffffffffffffff, Mem[0000000030181400] = df6dad63
	stwa	%l7,[%i6+%g0]0x89	! Mem[0000000030181400] = ffffffff
!	Mem[0000000010041408] = 000000ff00ff0000, %l6 = 0000000000000000, %l0 = 00000000ff000000
	add	%i1,0x08,%g1
	casxa	[%g1]0x80,%l6,%l0	! %l0 = 000000ff00ff0000

p0_label_308:
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = 0000007e, %l1 = 0000000000000000
	lduha	[%i6+%o4]0x89,%l1	! %l1 = 000000000000007e
!	Mem[0000000010141408] = ff970000, %l7 = ffffffffffffffff
	lduba	[%i5+%o4]0x80,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030001410] = 000000ff, %l2 = 00000000000000ff
	lduwa	[%i0+%o5]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[0000000020800040] = ffcf18e0, %l7 = 00000000000000ff, %asi = 80
	lduba	[%o1+0x040]%asi,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030081408] = 0000ff97, %l3 = 0000000000000000
	ldswa	[%i2+%o4]0x81,%l3	! %l3 = 000000000000ff97
!	Mem[0000000010101410] = 00735c7b, %l3 = 000000000000ff97
	ldsba	[%i4+%o5]0x80,%l3	! %l3 = 0000000000000000
!	Mem[000000001000143d] = 000000ff, %l1 = 000000000000007e, %asi = 80
	lduba	[%i0+0x03d]%asi,%l1	! %l1 = 0000000000000000
!	%f8  = c5acff6b, %f23 = 00009780
	fcmps	%fcc3,%f8 ,%f23		! %fcc3 = 1
!	Mem[0000000030081410] = 000000ff, %l2 = 00000000000000ff
	lduba	[%i2+%o5]0x81,%l2	! %l2 = 0000000000000000
!	Mem[00000000100c1410] = 63000000ff000000, %f4  = 069b8097 0000ffff
	ldda	[%i3+%o5]0x80,%f4 	! %f4  = 63000000 ff000000

p0_label_309:
!	Starting 10 instruction Store Burst
!	%l2 = 0000000000000000, Mem[0000000030001408] = ff000000
	stba	%l2,[%i0+%o4]0x89	! Mem[0000000030001408] = ff000000
!	%f6  = 000000ff 00000000, Mem[0000000010001410] = 000000ff 00000000
	stda	%f6 ,[%i0+%o5]0x88	! Mem[0000000010001410] = 000000ff 00000000
!	%l3 = 0000000000000000, Mem[0000000010041408] = ff000000
	stwa	%l3,[%i1+%o4]0x88	! Mem[0000000010041408] = 00000000
!	Mem[0000000010101410] = 00735c7b, %l1 = 0000000000000000
	ldstuba	[%i4+%o5]0x80,%l1	! %l1 = 0000000000000000
!	%l4 = 000000000000007e, Mem[00000000100c1418] = 0000000000000000
	stx	%l4,[%i3+0x018]		! Mem[00000000100c1418] = 000000000000007e
!	%l0 = 000000ff00ff0000, Mem[0000000010141436] = 97809b06
	sth	%l0,[%i5+0x036]		! Mem[0000000010141434] = 97800000
!	Mem[0000000010141410] = da000000, %l2 = 0000000000000000
	ldstuba	[%i5+%o5]0x88,%l2	! %l2 = 0000000000000000
!	Mem[00000000100c1410] = 63000000, %l3 = 0000000000000000
	swapa	[%i3+%o5]0x80,%l3	! %l3 = 0000000063000000
!	Mem[0000000010101400] = 00640000, %l5 = 0000000063ad6ddf
	ldstuba	[%i4+%g0]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000010101410] = 7b5c73ff, %l5 = 0000000000000000
	ldstuba	[%i4+%o5]0x88,%l5	! %l5 = 00000000000000ff

p0_label_310:
!	Starting 10 instruction Load Burst
!	Code Fragment 4, seed = 685460
p0_fragment_30:
!	%l0 = 000000ff00ff0000
	setx	0xd7378f1211719f86,%g7,%l0 ! %l0 = d7378f1211719f86
!	%l1 = 0000000000000000
	setx	0x341d58e76edab5b1,%g7,%l1 ! %l1 = 341d58e76edab5b1
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = d7378f1211719f86
	setx	0x473dac1956538fec,%g7,%l0 ! %l0 = 473dac1956538fec
!	%l1 = 341d58e76edab5b1
	setx	0xb552ec56b92e3137,%g7,%l1 ! %l1 = b552ec56b92e3137
p0_fragment_30_end:
!	Mem[0000000030181410] = fddd8024, %f6  = 000000ff
	lda	[%i6+%o5]0x81,%f6 	! %f6 = fddd8024
!	Mem[0000000030041408] = 0435ffff, %l0 = 473dac1956538fec
	ldsba	[%i1+%o4]0x89,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000030001400] = ff000000, %l2 = 0000000000000000
	lduha	[%i0+%g0]0x89,%l2	! %l2 = 0000000000000000
!	%l6 = 0000000000000000, imm = fffffffffffff31f, %l4 = 000000000000007e
	addc	%l6,-0xce1,%l4		! %l4 = fffffffffffff31f
!	Mem[00000000300c1400] = 0000000000000000, %l5 = 00000000000000ff
	ldxa	[%i3+%g0]0x89,%l5	! %l5 = 0000000000000000
!	%f27 = ffffffff, %f3  = 00000000, %f5  = ff000000
	fadds	%f27,%f3 ,%f5 		! %f5  = ffffffff
!	Mem[0000000030041410] = 00000000, %l3 = 0000000063000000
	ldswa	[%i1+%o5]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000010101400] = ff640000, %l4 = fffffffffffff31f
	ldsba	[%i4+%g0]0x80,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000030141408] = 00000067, %l4 = ffffffffffffffff
	ldswa	[%i5+%o4]0x89,%l4	! %l4 = 0000000000000067

p0_label_311:
!	Starting 10 instruction Store Burst
!	%f24 = 00000000 00000000, %l2 = 0000000000000000
!	Mem[00000000100c1400] = f43dade22276fb54
	stda	%f24,[%i3+%l2]ASI_PST32_P ! Mem[00000000100c1400] = f43dade22276fb54
!	%l4 = 0000000000000067, Mem[000000001014140e] = 00000000
	sth	%l4,[%i5+0x00e]		! Mem[000000001014140c] = 00000067
!	%l1 = b552ec56b92e3137, Mem[0000000010081400] = 6b97140bb95180dd
	stx	%l1,[%i2+%g0]		! Mem[0000000010081400] = b552ec56b92e3137
!	Mem[0000000030001400] = ff000000, %l1 = b552ec56b92e3137
	ldstuba	[%i0+%g0]0x89,%l1	! %l1 = 0000000000000000
!	%l5 = 0000000000000000, Mem[0000000010001410] = 000000ff00000000
	stxa	%l5,[%i0+%o5]0x88	! Mem[0000000010001410] = 0000000000000000
!	Mem[0000000030181400] = ffffffff 23000000 7e000000 587464ff
!	%f16 = ff000000 ff000000 74650000 00000000
!	%f20 = dbffffff 5b0fe295 000000ff 00009780
!	%f24 = 00000000 00000000 00009780 ffffffff
!	%f28 = ff0000ff 5b0fe295 63ad6ddf 2ca93559
	stda	%f16,[%i6+%g0]ASI_BLK_AIUS	! Block Store to 0000000030181400
!	Mem[0000000010141424] = 038da6db, %l5 = 0000000000000000
	ldstub	[%i5+0x024],%l5		! %l5 = 0000000000000003
!	Mem[0000000010101400] = 000064ff, %l0 = ffffffffffffffff
	ldstuba	[%i4+%g0]0x88,%l0	! %l0 = 00000000000000ff
!	%f16 = ff000000 ff000000, %l7 = 00000000000000ff
!	Mem[0000000010041400] = ff00000000000000
	stda	%f16,[%i1+%l7]ASI_PST16_P ! Mem[0000000010041400] = ff000000ff000000
!	%l6 = 0000000000000000, Mem[0000000010101400] = ff640000ffffffff
	stx	%l6,[%i4+%g0]		! Mem[0000000010101400] = 0000000000000000

p0_label_312:
!	Starting 10 instruction Load Burst
!	%f6  = fddd8024, Mem[000000001018143c] = 23000000
	st	%f6 ,[%i6+0x03c]	! Mem[000000001018143c] = fddd8024
!	Mem[0000000010141418] = 44a491d7 ffa64a31, %l2 = 00000000, %l3 = 00000000, %asi = 80
	ldda	[%i5+0x018]%asi,%l2	! %l2 = 0000000044a491d7 00000000ffa64a31
!	Mem[0000000030141408] = 6700000000000000, %l1 = 0000000000000000
	ldxa	[%i5+%o4]0x81,%l1	! %l1 = 6700000000000000
!	%l0 = 00000000000000ff, %l7 = 00000000000000ff, %l3 = 00000000ffa64a31
	add	%l0,%l7,%l3		! %l3 = 00000000000001fe
!	Mem[0000000030041410] = 00000000, %l5 = 0000000000000003
	lduha	[%i1+%o5]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000030081408] = 0000ff97, %l4 = 0000000000000067
	ldsha	[%i2+%o4]0x81,%l4	! %l4 = 0000000000000000
	membar	#Sync			! Added by membar checker (63)
!	Mem[0000000010181438] = 63ad6ddf fddd8024, %l4 = 00000000, %l5 = 00000000
	ldd	[%i6+0x038],%l4		! %l4 = 0000000063ad6ddf 00000000fddd8024
!	Mem[0000000020800001] = 00ff42b0, %l3 = 00000000000001fe
	ldsb	[%o1+0x001],%l3		! %l3 = ffffffffffffffff
!	Mem[0000000010041410] = ff000000000000ff, %l3 = ffffffffffffffff
	ldxa	[%i1+%o5]0x88,%l3	! %l3 = ff000000000000ff
!	%f28 = ff0000ff, %f19 = 00000000, %f31 = 2ca93559
	fdivs	%f28,%f19,%f31		! %f31 = ff800000

p0_label_313:
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1400] = f43dade2 2276fb54 00000000 000000ff
!	%f16 = ff000000 ff000000 74650000 00000000
!	%f20 = dbffffff 5b0fe295 000000ff 00009780
!	%f24 = 00000000 00000000 00009780 ffffffff
!	%f28 = ff0000ff 5b0fe295 63ad6ddf ff800000
	stda	%f16,[%i3+%g0]ASI_BLK_P	! Block Store to 00000000100c1400
!	Mem[0000000030181408] = 00006574, %l4 = 0000000063ad6ddf
	swapa	[%i6+%o4]0x89,%l4	! %l4 = 0000000000006574
!	%f1  = 0b14976b, Mem[0000000030141400] = 2276fb54
	sta	%f1 ,[%i5+%g0]0x81	! Mem[0000000030141400] = 0b14976b
!	%l1 = 6700000000000000, %l0 = 00000000000000ff, %l1 = 6700000000000000
	and	%l1,%l0,%l1		! %l1 = 0000000000000000
!	%f24 = 00000000 00000000, %l3 = ff000000000000ff
!	Mem[00000000300c1430] = 4769543421fd52f5
	add	%i3,0x030,%g1
	stda	%f24,[%g1+%l3]ASI_PST32_SL ! Mem[00000000300c1430] = 0000000000000000
!	Mem[0000000010041410] = 000000ff, %l4 = 0000000000006574
	swapa	[%i1+%o5]0x88,%l4	! %l4 = 00000000000000ff
!	%f29 = 5b0fe295, Mem[0000000010181404] = 2c056d67
	sta	%f29,[%i6+0x004]%asi	! Mem[0000000010181404] = 5b0fe295
!	%f14 = 00000000 2c056d67, %l6 = 0000000000000000
!	Mem[0000000010001420] = 000000ffffff5adf
	add	%i0,0x020,%g1
	stda	%f14,[%g1+%l6]ASI_PST16_PL ! Mem[0000000010001420] = 000000ffffff5adf
!	%l7 = 00000000000000ff, Mem[0000000010181408] = ff00006b
	stwa	%l7,[%i6+%o4]0x80	! Mem[0000000010181408] = 000000ff
!	%l0 = 00000000000000ff, Mem[0000000030041400] = ff76fb54
	stba	%l0,[%i1+%g0]0x81	! Mem[0000000030041400] = ff76fb54

p0_label_314:
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = 6700000000000000, %l1 = 0000000000000000
	ldxa	[%i5+%o4]0x81,%l1	! %l1 = 6700000000000000
!	Mem[0000000030041408] = ffff3504, %l1 = 6700000000000000
	ldsha	[%i1+%o4]0x81,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000030001400] = ff0000ff 000000ab, %l0 = 000000ff, %l1 = ffffffff
	ldda	[%i0+%g0]0x81,%l0	! %l0 = 00000000ff0000ff 00000000000000ab
!	Mem[0000000030001400] = ff0000ff 000000ab 000000ff 00000000
!	Mem[0000000030001410] = ff000000 00009780 314aa6da 70b87b43
!	Mem[0000000030001420] = 1df3a868 2df625d9 80970000 ff000000
!	Mem[0000000030001430] = 069b8097 0b14976b 0e2308cf 5a018f5d
	ldda	[%i0+%g0]ASI_BLK_S,%f0 	! Block Load from 0000000030001400
!	Mem[0000000020800001] = 00ff42b0, %l1 = 00000000000000ab, %asi = 80
	ldsba	[%o1+0x001]%asi,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000030001408] = ff000000, %f29 = 5b0fe295
	lda	[%i0+%o4]0x89,%f29	! %f29 = ff000000
!	Mem[00000000300c1410] = 6b000000, %l0 = 00000000ff0000ff
	ldswa	[%i3+%o5]0x81,%l0	! %l0 = 000000006b000000
!	Mem[0000000030041400] = ff76fb5497809b06, %l5 = 00000000fddd8024
	ldxa	[%i1+%g0]0x81,%l5	! %l5 = ff76fb5497809b06
!	Mem[0000000010081400] = 56ec52b5, %l1 = ffffffffffffffff
	ldsba	[%i2+%g0]0x88,%l1	! %l1 = ffffffffffffffb5
!	Mem[00000000201c0000] = ffffe880, %l3 = ff000000000000ff, %asi = 80
	ldsha	[%o0+0x000]%asi,%l3	! %l3 = ffffffffffffffff

p0_label_315:
!	Starting 10 instruction Store Burst
!	Mem[0000000010141408] = ff970000, %l2 = 44a491d7, %l7 = 000000ff
	add	%i5,0x08,%g1
	casa	[%g1]0x80,%l2,%l7	! %l7 = 00000000ff970000
!	Mem[0000000010001410] = 00000000, %l0 = 000000006b000000
	ldstuba	[%i0+%o5]0x88,%l0	! %l0 = 0000000000000000
!	%f7  = 70b87b43, %f11 = ff000000, %f25 = 00000000
	fmuls	%f7 ,%f11,%f25		! %f25 = ff800000
!	%l4 = 00000000000000ff, Mem[00000000100c1410] = ffffffdb
	stba	%l4,[%i3+%o5]0x88	! Mem[00000000100c1410] = ffffffff
!	Mem[0000000010081408] = 00000000, %l2 = 0000000044a491d7
	ldstuba	[%i2+%o4]0x80,%l2	! %l2 = 0000000000000000
!	%f8  = 1df3a868, Mem[0000000010181408] = ff000000
	sta	%f8 ,[%i6+%o4]0x88	! Mem[0000000010181408] = 1df3a868
!	%f2  = 000000ff 00000000, %l1 = ffffffffffffffb5
!	Mem[0000000030101408] = 7465000000000000
	add	%i4,0x008,%g1
	stda	%f2,[%g1+%l1]ASI_PST8_S ! Mem[0000000030101408] = 006500ff00000000
!	%f8  = 1df3a868, Mem[0000000030041400] = 54fb76ff
	sta	%f8 ,[%i1+%g0]0x89	! Mem[0000000030041400] = 1df3a868
!	%l2 = 0000000000000000, Mem[0000000030141408] = 00000067
	stwa	%l2,[%i5+%o4]0x89	! Mem[0000000030141408] = 00000000
	membar	#Sync			! Added by membar checker (64)
!	%l5 = ff76fb5497809b06, Mem[0000000030001400] = ff0000ff000000ab
	stxa	%l5,[%i0+%g0]0x81	! Mem[0000000030001400] = ff76fb5497809b06

p0_label_316:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = 000000ff, %l3 = ffffffffffffffff
	lduba	[%i3+%g0]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[00000000201c0000] = ffffe880, %l7 = 00000000ff970000, %asi = 80
	ldsha	[%o0+0x000]%asi,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000030141408] = 00000000, %f10 = 80970000
	lda	[%i5+%o4]0x81,%f10	! %f10 = 00000000
!	Mem[0000000010181434] = 00000000, %l5 = ff76fb5497809b06
	lduw	[%i6+0x034],%l5		! %l5 = 0000000000000000
!	Mem[0000000010101418] = 000000ff 00009780, %l4 = 000000ff, %l5 = 00000000
	ldd	[%i4+0x018],%l4		! %l4 = 00000000000000ff 0000000000009780
!	Mem[0000000010181408] = 1df3a868, %l2 = 0000000000000000
	ldswa	[%i6+%o4]0x88,%l2	! %l2 = 000000001df3a868
!	%f29 = ff000000, %f5  = 00009780, %f9  = 2df625d9
	fdivs	%f29,%f5 ,%f9 		! %f9  = ff800000
!	Mem[0000000010041410] = 00006574, %l0 = 0000000000000000
	ldswa	[%i1+%o5]0x88,%l0	! %l0 = 0000000000006574
!	Mem[0000000010181410] = ff0000ff, %l7 = ffffffffffffffff
	lduha	[%i6+%o5]0x88,%l7	! %l7 = 00000000000000ff
!	Code Fragment 4, seed = 276948
p0_fragment_31:
!	%l0 = 0000000000006574
	setx	0x1415fe4603dbbd86,%g7,%l0 ! %l0 = 1415fe4603dbbd86
!	%l1 = ffffffffffffffb5
	setx	0x0ec7a698b60273b1,%g7,%l1 ! %l1 = 0ec7a698b60273b1
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 1415fe4603dbbd86
	setx	0x2a2d59f4de46edec,%g7,%l0 ! %l0 = 2a2d59f4de46edec
!	%l1 = 0ec7a698b60273b1
	setx	0xa12cfff1489b2f37,%g7,%l1 ! %l1 = a12cfff1489b2f37
p0_fragment_31_end:

p0_label_317:
!	Starting 10 instruction Store Burst
!	%l5 = 0000000000009780, Mem[0000000030141400] = 0b14976b
	stha	%l5,[%i5+%g0]0x81	! Mem[0000000030141400] = 9780976b
!	%l5 = 0000000000009780, Mem[00000000300c1400] = 00000000
	stwa	%l5,[%i3+%g0]0x81	! Mem[00000000300c1400] = 00009780
!	%l2 = 000000001df3a868, Mem[00000000218000c1] = 16ff8bd0, %asi = 80
	stba	%l2,[%o3+0x0c1]%asi	! Mem[00000000218000c0] = 16688bd0
!	%f8  = 1df3a868, %f24 = 00000000
	fcmpes	%fcc0,%f8 ,%f24		! %fcc0 = 2
!	Mem[00000000211c0001] = 00ff6b10, %l4 = 00000000000000ff
	ldstub	[%o2+0x001],%l4		! %l4 = 00000000000000ff
!	Mem[0000000030141408] = 00000000, %l3 = 00000000000000ff
	ldstuba	[%i5+%o4]0x81,%l3	! %l3 = 0000000000000000
!	Mem[00000000300c1408] = ffffffff, %l4 = 00000000000000ff
	ldstuba	[%i3+%o4]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010141400] = ff000000a78c9bff, %f16 = ff000000 ff000000
	ldda	[%i5+%g0]0x80,%f16	! %f16 = ff000000 a78c9bff
!	Mem[00000000300c1400] = 00009780, %l7 = 00000000000000ff
	ldstuba	[%i3+%g0]0x81,%l7	! %l7 = 0000000000000000
!	%l5 = 0000000000009780, %l0 = 2a2d59f4de46edec, %l0 = 2a2d59f4de46edec
	subc	%l5,%l0,%l0		! %l0 = d5d2a60b21b9a994

p0_label_318:
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = ff000000ff000000, %l6 = 0000000000000000
	ldxa	[%i6+%g0]0x81,%l6	! %l6 = ff000000ff000000
!	Mem[00000000100c1408] = 7465000000000000, %l7 = 0000000000000000
	ldxa	[%i3+%o4]0x80,%l7	! %l7 = 7465000000000000
!	Mem[0000000010141408] = ff97000000000067, %l7 = 7465000000000000, %asi = 80
	ldxa	[%i5+0x008]%asi,%l7	! %l7 = ff97000000000067
!	Mem[0000000030001408] = ff000000, %f17 = a78c9bff
	lda	[%i0+%o4]0x89,%f17	! %f17 = ff000000
!	Mem[00000000100c1408] = 00006574, %l6 = ff000000ff000000
	ldsha	[%i3+%o4]0x88,%l6	! %l6 = 0000000000006574
!	Mem[0000000010001400] = ff000000, %l3 = 0000000000000000
	lduwa	[%i0+%g0]0x80,%l3	! %l3 = 00000000ff000000
!	Mem[0000000010001408] = b60c0000 000000ff, %l6 = 00006574, %l7 = 00000067
	ldda	[%i0+%o4]0x88,%l6	! %l6 = 00000000000000ff 00000000b60c0000
!	Mem[0000000010181400] = a73d4fd6 5b0fe295, %l4 = 000000ff, %l5 = 00009780
	ldda	[%i6+%g0]0x80,%l4	! %l4 = 00000000a73d4fd6 000000005b0fe295
!	Mem[00000000100c1400] = 000000ff000000ff, %f24 = 00000000 ff800000
	ldda	[%i3+%g0]0x88,%f24	! %f24 = 000000ff 000000ff
!	Mem[0000000010041400] = ff000000, %l7 = 00000000b60c0000
	ldsba	[%i1+%g0]0x80,%l7	! %l7 = ffffffffffffffff

p0_label_319:
!	Starting 10 instruction Store Burst
!	%l6 = 00000000000000ff, Mem[0000000010101400] = 0000000000000000
	stx	%l6,[%i4+%g0]		! Mem[0000000010101400] = 00000000000000ff
!	%f24 = 000000ff, Mem[0000000010041400] = ff000000
	sta	%f24,[%i1+%g0]0x80	! Mem[0000000010041400] = 000000ff
!	%l0 = d5d2a60b21b9a994, Mem[0000000010001410] = 000000ff
	stwa	%l0,[%i0+%o5]0x88	! Mem[0000000010001410] = 21b9a994
!	%l1 = a12cfff1489b2f37, Mem[0000000030041408] = 0435ffff
	stha	%l1,[%i1+%o4]0x89	! Mem[0000000030041408] = 04352f37
!	%l2 = 000000001df3a868, Mem[00000000100c1410] = ffffffff
	stba	%l2,[%i3+%o5]0x80	! Mem[00000000100c1410] = 68ffffff
!	Mem[0000000030001408] = ff000000, %l1 = a12cfff1489b2f37
	ldstuba	[%i0+%o4]0x89,%l1	! %l1 = 0000000000000000
!	Mem[00000000100c1400] = 000000ff, %l4 = 00000000a73d4fd6
	swapa	[%i3+%g0]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030041408] = 04352f37, %l4 = 00000000000000ff
	ldstuba	[%i1+%o4]0x89,%l4	! %l4 = 0000000000000037
!	%l2 = 1df3a868, %l3 = ff000000, Mem[0000000010181408] = 68a8f31d 6bffacc5
	std	%l2,[%i6+%o4]		! Mem[0000000010181408] = 1df3a868 ff000000
!	Mem[0000000010181406] = 5b0fe295, %l2 = 000000001df3a868
	ldstuba	[%i6+0x006]%asi,%l2	! %l2 = 00000000000000e2

p0_label_320:
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = ff006500, %l0 = d5d2a60b21b9a994
	lduwa	[%i4+%o4]0x89,%l0	! %l0 = 00000000ff006500
!	Mem[0000000010001428] = 000000ff00000000, %f18 = 74650000 00000000, %asi = 80
	ldda	[%i0+0x028]%asi,%f18	! %f18 = 000000ff 00000000
!	Mem[00000000100c1400] = a73d4fd6, %l2 = 00000000000000e2
	lduha	[%i3+%g0]0x88,%l2	! %l2 = 0000000000004fd6
!	Mem[0000000010081410] = ffff0000, %f17 = ff000000
	lda	[%i2+%o5]0x80,%f17	! %f17 = ffff0000
!	Mem[0000000010141400] = 000000ff, %l5 = 000000005b0fe295
	ldsha	[%i5+%g0]0x88,%l5	! %l5 = 00000000000000ff
!	Code Fragment 4, seed = 901319
p0_fragment_32:
!	%l0 = 00000000ff006500
	setx	0x07f5b98c0a27e8ee,%g7,%l0 ! %l0 = 07f5b98c0a27e8ee
!	%l1 = 0000000000000000
	setx	0x03b07c36fe88e299,%g7,%l1 ! %l1 = 03b07c36fe88e299
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 07f5b98c0a27e8ee
	setx	0xdba5515013da4854,%g7,%l0 ! %l0 = dba5515013da4854
!	%l1 = 03b07c36fe88e299
	setx	0xf1fae0c490ad9d1f,%g7,%l1 ! %l1 = f1fae0c490ad9d1f
p0_fragment_32_end:
!	Mem[0000000010001400] = 000000ff, %l0 = dba5515013da4854
	ldsha	[%i0+%g0]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010001408] = ff000000, %f25 = 000000ff
	lda	[%i0+%o4]0x80,%f25	! %f25 = ff000000
!	Mem[00000000100c1410] = ffffff68, %l5 = 00000000000000ff
	lduwa	[%i3+%o5]0x88,%l5	! %l5 = 00000000ffffff68
!	Mem[0000000030141410] = ffffffff, %l5 = 00000000ffffff68
	lduba	[%i5+%o5]0x81,%l5	! %l5 = 00000000000000ff

p0_label_321:
!	Starting 10 instruction Store Burst
!	%l4 = 00000037, %l5 = 000000ff, Mem[0000000010101410] = ff735c7b 7fffffff
	stda	%l4,[%i4+%o5]0x80	! Mem[0000000010101410] = 00000037 000000ff
!	%f26 = 00009780, Mem[0000000010001418] = 00000000
	st	%f26,[%i0+0x018]	! Mem[0000000010001418] = 00009780
!	%f24 = 000000ff, %f28 = ff0000ff
	fitos	%f24,%f28		! %f28 = 437f0000
!	Mem[0000000030001400] = ff76fb54, %l7 = ffffffffffffffff
	ldstuba	[%i0+%g0]0x81,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010181433] = 00000000, %l4 = 0000000000000037
	ldstuba	[%i6+0x033]%asi,%l4	! %l4 = 0000000000000000
!	%l0 = 00000000000000ff, Mem[0000000010141408] = ff970000
	stwa	%l0,[%i5+%o4]0x80	! Mem[0000000010141408] = 000000ff
!	%l7 = 00000000000000ff, immd = 000004e9, %y  = f878787a
	umul	%l7,0x4e9,%l4		! %l4 = 000000000004e417, %y = 00000000
!	Mem[0000000030141400] = 6b978097, %l0 = 00000000000000ff
	ldstuba	[%i5+%g0]0x89,%l0	! %l0 = 0000000000000097
!	%f28 = 437f0000 ff000000, %l0 = 0000000000000097
!	Mem[0000000030101420] = 0000000000000000
	add	%i4,0x020,%g1
	stda	%f28,[%g1+%l0]ASI_PST16_S ! Mem[0000000030101420] = 00000000ff000000
!	%l3 = 00000000ff000000, Mem[0000000010101400] = 00000000
	stha	%l3,[%i4+%g0]0x80	! Mem[0000000010101400] = 00000000

p0_label_322:
!	Starting 10 instruction Load Burst
!	Mem[000000001018142c] = fe9b4b99, %l0 = 0000000000000097, %asi = 80
	lduha	[%i6+0x02c]%asi,%l0	! %l0 = 000000000000fe9b
!	Mem[0000000030001410] = ff000000, %l1 = f1fae0c490ad9d1f
	lduwa	[%i0+%o5]0x81,%l1	! %l1 = 00000000ff000000
!	Mem[0000000010081410] = 0000ffff, %f12 = 069b8097
	lda	[%i2+%o5]0x88,%f12	! %f12 = 0000ffff
!	Mem[0000000010101410] = ff000000 37000000, %l4 = 0004e417, %l5 = 000000ff
	ldda	[%i4+%o5]0x88,%l4	! %l4 = 0000000037000000 00000000ff000000
!	Mem[0000000010181400] = a73d4fd6, %l2 = 0000000000004fd6
	ldswa	[%i6+%g0]0x80,%l2	! %l2 = ffffffffa73d4fd6
!	Mem[0000000030181400] = ff000000, %f23 = 00009780
	lda	[%i6+%g0]0x81,%f23	! %f23 = ff000000
!	%f5  = 00009780, %f6  = 314aa6da
	fsqrts	%f5 ,%f6 		! tt=0x22, %l0 = 000000000000febd
!	Mem[0000000010041400] = 000000ff, %l2 = ffffffffa73d4fd6
	ldsba	[%i1+%g0]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000010041408] = 00000000, %l7 = 00000000000000ff
	ldsha	[%i1+%o4]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000010001408] = 000000ff, %l5 = 00000000ff000000
	ldsba	[%i0+%o4]0x88,%l5	! %l5 = ffffffffffffffff

p0_label_323:
!	Starting 10 instruction Store Burst
!	Mem[00000000100c140c] = 00000000, %l2 = 0000000000000000
	swap	[%i3+0x00c],%l2		! %l2 = 0000000000000000
!	%l0 = 0000febd, %l1 = ff000000, Mem[0000000010041408] = 00000000 0000ff00
	stda	%l0,[%i1+%o4]0x88	! Mem[0000000010041408] = 0000febd ff000000
!	Mem[0000000030001408] = ff0000ff, %l4 = 0000000037000000
	ldstuba	[%i0+%o4]0x89,%l4	! %l4 = 00000000000000ff
!	%l4 = 00000000000000ff, Mem[0000000010081400] = 56ec52b5
	stwa	%l4,[%i2+%g0]0x88	! Mem[0000000010081400] = 000000ff
!	%f16 = ff000000, Mem[0000000010181408] = 1df3a868
	sta	%f16,[%i6+0x008]%asi	! Mem[0000000010181408] = ff000000
!	Mem[0000000010041400] = ff000000, %l0 = 000000000000febd
	ldstuba	[%i1+%g0]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000010001400] = ff000000, %l2 = 0000000000000000
	ldstuba	[%i0+%g0]0x80,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030041410] = 00000000, %l3 = 00000000ff000000
	swapa	[%i1+%o5]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000010101419] = 000000ff, %l7 = 0000000000000000
	ldstub	[%i4+0x019],%l7		! %l7 = 0000000000000000
!	%f0  = ff0000ff 000000ab, Mem[0000000030001410] = ff000000 00009780
	stda	%f0 ,[%i0+%o5]0x81	! Mem[0000000030001410] = ff0000ff 000000ab

p0_label_324:
!	Starting 10 instruction Load Burst
!	Mem[0000000020800040] = ffcf18e0, %l3 = 0000000000000000, %asi = 80
	ldsba	[%o1+0x040]%asi,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010101400] = 00000000, %l7 = 0000000000000000
	ldsba	[%i4+%g0]0x80,%l7	! %l7 = 0000000000000000
!	Mem[00000000300c1400] = 809700ff, %f28 = 437f0000
	lda	[%i3+%g0]0x89,%f28	! %f28 = 809700ff
!	Mem[0000000010181410] = ff0000ff, %l5 = ffffffffffffffff
	ldsba	[%i6+%o5]0x88,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000010141410] = da0000ff, %l7 = 0000000000000000
	ldsha	[%i5+%o5]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010141410] = da0000ff, %l2 = 00000000000000ff
	ldsba	[%i5+%o5]0x88,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000010181408] = 000000ff000000ff, %f0  = ff0000ff 000000ab
	ldda	[%i6+%o4]0x88,%f0 	! %f0  = 000000ff 000000ff
!	%l5 = ffffffffffffffff, imm = 0000000000000521, %l5 = ffffffffffffffff
	add	%l5,0x521,%l5		! %l5 = 0000000000000520
!	Mem[0000000010181410] = ff0000ff, %f21 = 5b0fe295
	lda	[%i6+%o5]0x80,%f21	! %f21 = ff0000ff
!	Mem[0000000010101418] = 00ff00ff 00009780, %l4 = 000000ff, %l5 = 00000520
	ldd	[%i4+0x018],%l4		! %l4 = 0000000000ff00ff 0000000000009780

p0_label_325:
!	Starting 10 instruction Store Burst
!	%f28 = 809700ff ff000000, %l0 = 0000000000000000
!	Mem[0000000010001438] = 96007458000000ff
	add	%i0,0x038,%g1
	stda	%f28,[%g1+%l0]ASI_PST32_PL ! Mem[0000000010001438] = 96007458000000ff
!	%l2 = ffffffffffffffff, Mem[0000000030001408] = ff0000ff
	stba	%l2,[%i0+%o4]0x89	! Mem[0000000030001408] = ff0000ff
!	%l4 = 0000000000ff00ff, Mem[0000000020800040] = ffcf18e0
	sth	%l4,[%o1+0x040]		! Mem[0000000020800040] = 00ff18e0
!	%l0 = 0000000000000000, %l6 = 00000000000000ff, %l6 = 00000000000000ff
	andn	%l0,%l6,%l6		! %l6 = 0000000000000000
!	%l6 = 0000000000000000, Mem[0000000010181402] = a73d4fd6
	sth	%l6,[%i6+0x002]		! Mem[0000000010181400] = a73d0000
!	%l5 = 0000000000009780, Mem[0000000030181400] = ff000000
	stha	%l5,[%i6+%g0]0x81	! Mem[0000000030181400] = 97800000
!	Mem[0000000030001408] = ff0000ff, %l3 = ffffffffffffffff
	ldstuba	[%i0+%o4]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010081400] = ff000000 b92e3137 ff000000 00000000
!	%f0  = 000000ff 000000ff 000000ff 00000000
!	%f4  = ff000000 00009780 314aa6da 70b87b43
!	%f8  = 1df3a868 ff800000 00000000 ff000000
!	%f12 = 0000ffff 0b14976b 0e2308cf 5a018f5d
	stda	%f0 ,[%i2+%g0]ASI_BLK_AIUPL	! Block Store to 0000000010081400
!	%l1 = 00000000ff000000, Mem[0000000010041410] = 74650000
	stwa	%l1,[%i1+%o5]0x80	! Mem[0000000010041410] = ff000000
!	Mem[0000000030081410] = ff000000, %l5 = 0000000000009780
	swapa	[%i2+%o5]0x89,%l5	! %l5 = 00000000ff000000

p0_label_326:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001418] = 0000978000000000, %l7 = 00000000000000ff, %asi = 80
	ldxa	[%i0+0x018]%asi,%l7	! %l7 = 0000978000000000
!	Mem[0000000030041408] = 04352fff, %l0 = 0000000000000000
	lduwa	[%i1+%o4]0x89,%l0	! %l0 = 0000000004352fff
!	Mem[0000000010101410] = 00000037, %l0 = 0000000004352fff
	lduba	[%i4+%o5]0x80,%l0	! %l0 = 0000000000000000
!	Mem[00000000211c0000] = 00ff6b10, %l7 = 0000978000000000, %asi = 80
	ldsba	[%o2+0x000]%asi,%l7	! %l7 = 0000000000000000
!	Mem[0000000030001400] = 54fb76ff, %f30 = 63ad6ddf
	lda	[%i0+%g0]0x89,%f30	! %f30 = 54fb76ff
	membar	#Sync			! Added by membar checker (65)
!	Mem[0000000030081400] = ff0000ff 000000da 0000ff97 00000000
!	Mem[0000000030081410] = 80970000 00000000 314aa6da 70b87b43
!	Mem[0000000030081420] = 1df3a868 2df625d9 58fa12e6 1b1d3f9f
!	Mem[0000000030081430] = 069b8097 0b14976b 0a80ccb2 3ff082bb
	ldda	[%i2+%g0]ASI_BLK_SL,%f0 	! Block Load from 0000000030081400
!	Mem[0000000030081410] = 80970000 00000000, %l6 = 00000000, %l7 = 00000000
	ldda	[%i2+%o5]0x81,%l6	! %l6 = 0000000080970000 0000000000000000
!	%l2 = ffffffff, %l3 = 000000ff, Mem[0000000010101408] = ffffffff 000000ff
	stda	%l2,[%i4+%o4]0x80	! Mem[0000000010101408] = ffffffff 000000ff
!	Mem[0000000010101400] = ff000000 00000000, %l2 = ffffffff, %l3 = 000000ff
	ldda	[%i4+%g0]0x88,%l2	! %l2 = 0000000000000000 00000000ff000000
!	Mem[000000001008140c] = ff000000, %l3 = 00000000ff000000, %asi = 80
	lduwa	[%i2+0x00c]%asi,%l3	! %l3 = 00000000ff000000

p0_label_327:
!	Starting 10 instruction Store Burst
!	%f8  = d925f62d, Mem[0000000030041408] = 04352fff
	sta	%f8 ,[%i1+%o4]0x89	! Mem[0000000030041408] = d925f62d
!	%f12 = 6b97140b, %f22 = 000000ff
	fcmpes	%fcc1,%f12,%f22		! %fcc1 = 2
!	%l3 = 00000000ff000000, Mem[0000000020800001] = 00ff42b0, %asi = 80
	stba	%l3,[%o1+0x001]%asi	! Mem[0000000020800000] = 000042b0
!	Mem[0000000010101410] = 00000037, %l1 = 00000000ff000000
	ldstuba	[%i4+%o5]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000010001400] = ff000000 80000000 ff000000 00000cb6
!	%f0  = da000000 ff0000ff 00000000 97ff0000
!	%f4  = 00000000 00009780 437bb870 daa64a31
!	%f8  = d925f62d 68a8f31d 9f3f1d1b e612fa58
!	%f12 = 6b97140b 97809b06 bb82f03f b2cc800a
	stda	%f0 ,[%i0+%g0]ASI_BLK_PL	! Block Store to 0000000010001400
!	%f4  = 00000000 00009780, Mem[0000000030001410] = ff0000ff 000000ab
	stda	%f4 ,[%i0+%o5]0x81	! Mem[0000000030001410] = 00000000 00009780
!	Mem[0000000010181400] = a73d0000, %l4 = 0000000000ff00ff
	swapa	[%i6+%g0]0x80,%l4	! %l4 = 00000000a73d0000
!	%l4 = a73d0000, %l5 = ff000000, Mem[0000000030041400] = 68a8f31d 97809b06
	stda	%l4,[%i1+%g0]0x81	! Mem[0000000030041400] = a73d0000 ff000000
!	Mem[00000000100c1410] = ffffff68, %l5 = 00000000ff000000
	swapa	[%i3+%o5]0x88,%l5	! %l5 = 00000000ffffff68
!	%l7 = 0000000000000000, Mem[0000000021800141] = 28658430, %asi = 80
	stba	%l7,[%o3+0x141]%asi	! Mem[0000000021800140] = 28008430

p0_label_328:
!	Starting 10 instruction Load Burst
!	Mem[0000000030181410] = dbffffff, %l0 = 0000000000000000
	ldsba	[%i6+%o5]0x81,%l0	! %l0 = ffffffffffffffdb
!	Mem[00000000100c1408] = 74650000, %l1 = 0000000000000000
	ldswa	[%i3+%o4]0x80,%l1	! %l1 = 0000000074650000
!	Mem[0000000010081400] = ff000000, %f30 = 54fb76ff
	ld	[%i2+%g0],%f30		! %f30 = ff000000
!	Mem[0000000030081400] = ff0000ff, %l6 = 0000000080970000
	lduwa	[%i2+%g0]0x89,%l6	! %l6 = 00000000ff0000ff
!	Mem[0000000010141416] = 000000ff, %l1 = 0000000074650000
	ldsh	[%i5+0x016],%l1		! %l1 = 00000000000000ff
!	Mem[00000000300c1408] = ffffffff, %l1 = 00000000000000ff
	lduba	[%i3+%o4]0x89,%l1	! %l1 = 00000000000000ff
!	%l3 = 00000000ff000000, imm = 000000000000075f, %l7 = 0000000000000000
	add	%l3,0x75f,%l7		! %l7 = 00000000ff00075f
!	Mem[0000000010041408] = 0000febd, %l0 = ffffffffffffffdb
	ldswa	[%i1+%o4]0x88,%l0	! %l0 = 000000000000febd
!	Mem[00000000300c1410] = 6b000000, %l1 = 00000000000000ff
	ldsha	[%i3+%o5]0x81,%l1	! %l1 = 0000000000006b00
!	Mem[00000000100c1408] = 74650000, %l0 = 000000000000febd
	ldsba	[%i3+%o4]0x80,%l0	! %l0 = 0000000000000074

p0_label_329:
!	Starting 10 instruction Store Burst
!	Mem[0000000010181428] = 000000fffe9b4b99, %l1 = 0000000000006b00, %l1 = 0000000000006b00
	add	%i6,0x28,%g1
	casxa	[%g1]0x80,%l1,%l1	! %l1 = 000000fffe9b4b99
!	%l2 = 0000000000000000, %l3 = 00000000ff000000, %l3 = 00000000ff000000
	xor	%l2,%l3,%l3		! %l3 = 00000000ff000000
!	%f4  = 00000000, Mem[0000000030181408] = df6dad63
	sta	%f4 ,[%i6+%o4]0x81	! Mem[0000000030181408] = 00000000
!	%f20 = dbffffff ff0000ff, %l1 = 000000fffe9b4b99
!	Mem[0000000010141400] = ff000000a78c9bff
	stda	%f20,[%i5+%l1]ASI_PST16_PL ! Mem[0000000010141400] = ff000000a78cffdb
!	%f20 = dbffffff, Mem[0000000010041420] = d925f62d
	st	%f20,[%i1+0x020]	! Mem[0000000010041420] = dbffffff
!	Mem[0000000030081410] = 00009780, %l0 = 0000000000000074
	swapa	[%i2+%o5]0x89,%l0	! %l0 = 0000000000009780
!	%f4  = 00000000 00009780, Mem[0000000030141410] = ffffffff 000000ff
	stda	%f4 ,[%i5+%o5]0x89	! Mem[0000000030141410] = 00000000 00009780
!	Mem[0000000010181408] = ff000000, %l6 = 00000000ff0000ff
	ldstuba	[%i6+%o4]0x80,%l6	! %l6 = 00000000000000ff
!	%l1 = 000000fffe9b4b99, %l7 = 00000000ff00075f, %l7 = 00000000ff00075f
	orn	%l1,%l7,%l7		! %l7 = fffffffffefffbb9
!	Mem[0000000020800040] = 00ff18e0, %l4 = 00000000a73d0000
	ldstub	[%o1+0x040],%l4		! %l4 = 0000000000000000

p0_label_330:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = 000000ff, %l2 = 0000000000000000
	lduha	[%i6+%o4]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030041400] = a73d0000 ff000000, %l6 = 000000ff, %l7 = fefffbb9
	ldda	[%i1+%g0]0x81,%l6	! %l6 = 00000000a73d0000 00000000ff000000
!	Mem[0000000010141418] = 44a491d7ffa64a31, %f20 = dbffffff ff0000ff
	ldd	[%i5+0x018],%f20	! %f20 = 44a491d7 ffa64a31
!	Mem[0000000010141400] = ff000000, %l4 = 0000000000000000
	ldswa	[%i5+%g0]0x80,%l4	! %l4 = ffffffffff000000
!	Mem[0000000021800080] = ffff49a0, %l7 = 00000000ff000000
	lduh	[%o3+0x080],%l7		! %l7 = 000000000000ffff
!	Mem[00000000211c0000] = 00ff6b10, %l5 = 00000000ffffff68, %asi = 80
	ldsha	[%o2+0x000]%asi,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010101420] = 00000000 0000a6db, %l4 = ff000000, %l5 = 000000ff, %asi = 80
	ldda	[%i4+0x020]%asi,%l4	! %l4 = 0000000000000000 000000000000a6db
!	%l4 = 0000000000000000, imm = 0000000000000ad4, %l5 = 000000000000a6db
	and	%l4,0xad4,%l5		! %l5 = 0000000000000000
!	Mem[00000000100c1414] = 5b0fe295, %l5 = 0000000000000000
	lduh	[%i3+0x014],%l5		! %l5 = 0000000000005b0f
!	Mem[00000000300c1410] = 6b000000, %f4  = 00000000
	lda	[%i3+%o5]0x81,%f4 	! %f4 = 6b000000

p0_label_331:
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1408] = 00006574, %l4 = 0000000000000000
	swapa	[%i3+%o4]0x88,%l4	! %l4 = 0000000000006574
!	Mem[00000000300c1410] = 0000006b, %l4 = 0000000000006574
	swapa	[%i3+%o5]0x89,%l4	! %l4 = 000000000000006b
	membar	#Sync			! Added by membar checker (66)
!	%l5 = 0000000000005b0f, Mem[0000000030081400] = ff0000ff
	stha	%l5,[%i2+%g0]0x81	! Mem[0000000030081400] = 5b0f00ff
!	%f16 = ff000000 ffff0000, Mem[0000000030141400] = 6b9780ff 069b8097
	stda	%f16,[%i5+%g0]0x89	! Mem[0000000030141400] = ff000000 ffff0000
!	%f12 = 6b97140b 97809b06, Mem[0000000010101400] = 00000000 000000ff
	std	%f12,[%i4+%g0]		! Mem[0000000010101400] = 6b97140b 97809b06
!	Mem[0000000010001414] = 00000000, %l5 = 0000000000005b0f
	swap	[%i0+0x014],%l5		! %l5 = 0000000000000000
!	Mem[0000000030081410] = 74000000, %l0 = 0000000000009780
	swapa	[%i2+%o5]0x81,%l0	! %l0 = 0000000074000000
!	Mem[0000000030081400] = 5b0f00ff, %l5 = 0000000000000000
	ldstuba	[%i2+%g0]0x81,%l5	! %l5 = 000000000000005b
!	Mem[0000000010181404] = 5b0fff95, %l2 = 00000000000000ff
	swap	[%i6+0x004],%l2		! %l2 = 000000005b0fff95
!	%f11 = e612fa58, Mem[0000000030101410] = ffffffdb
	sta	%f11,[%i4+%o5]0x89	! Mem[0000000030101410] = e612fa58

p0_label_332:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = ff0000ff, %l6 = 00000000a73d0000
	ldsba	[%i6+%o5]0x80,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000030001400] = ff76fb54, %f30 = ff000000
	lda	[%i0+%g0]0x81,%f30	! %f30 = ff76fb54
!	Mem[0000000010001400] = ff0000ff, %l1 = 000000fffe9b4b99
	ldsha	[%i0+%g0]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010041400] = ff0000ff ff000000, %l4 = 0000006b, %l5 = 0000005b
	ldd	[%i1+%g0],%l4		! %l4 = 00000000ff0000ff 00000000ff000000
!	Mem[00000000211c0000] = 00ff6b10, %l1 = 00000000000000ff, %asi = 80
	ldsha	[%o2+0x000]%asi,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010141432] = 6b97140b, %l6 = ffffffffffffffff
	ldsh	[%i5+0x032],%l6		! %l6 = 000000000000140b
!	Mem[0000000030141408] = 00000000 000000ff, %l2 = 5b0fff95, %l3 = ff000000
	ldda	[%i5+%o4]0x89,%l2	! %l2 = 00000000000000ff 0000000000000000
!	Mem[0000000030101410] = 95e20f5be612fa58, %f16 = ff000000 ffff0000
	ldda	[%i4+%o5]0x89,%f16	! %f16 = 95e20f5b e612fa58
	membar	#Sync			! Added by membar checker (67)
!	Mem[0000000010001400] = ff0000ff 000000da 0000ff97 00000000
!	Mem[0000000010001410] = 80970000 00005b0f 314aa6da 70b87b43
!	Mem[0000000010001420] = 1df3a868 2df625d9 58fa12e6 1b1d3f9f
!	Mem[0000000010001430] = 069b8097 0b14976b 0a80ccb2 3ff082bb
	ldda	[%i0+%g0]ASI_BLK_P,%f16	! Block Load from 0000000010001400
!	Mem[0000000010081408] = 00000000, %f13 = 97809b06
	lda	[%i2+%o4]0x88,%f13	! %f13 = 00000000

p0_label_333:
!	Starting 10 instruction Store Burst
!	%l1 = 00000000000000ff, Mem[0000000030001410] = 00000000
	stba	%l1,[%i0+%o5]0x81	! Mem[0000000030001410] = ff000000
!	%f20 = 80970000 00005b0f, %l5 = 00000000ff000000
!	Mem[0000000030081400] = ff0f00ff000000da
	stda	%f20,[%i2+%l5]ASI_PST32_S ! Mem[0000000030081400] = ff0f00ff000000da
!	Mem[0000000010101408] = ffffffff, %l2 = 00000000000000ff
	ldstuba	[%i4+%o4]0x80,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030101408] = ff006500, %l1 = 00000000000000ff
	swapa	[%i4+%o4]0x89,%l1	! %l1 = 00000000ff006500
!	Mem[0000000010181400] = 00ff00ff, %l2 = 00000000000000ff
	swapa	[%i6+%g0]0x80,%l2	! %l2 = 0000000000ff00ff
!	%f14 = bb82f03f b2cc800a, Mem[0000000010181408] = 000000ff 000000ff
	stda	%f14,[%i6+%o4]0x88	! Mem[0000000010181408] = bb82f03f b2cc800a
!	Mem[0000000010001410] = 80970000, %l7 = 000000000000ffff
	swapa	[%i0+%o5]0x80,%l7	! %l7 = 0000000080970000
!	%l6 = 0000140b, %l7 = 80970000, Mem[0000000010101410] = 370000ff ff000000
	stda	%l6,[%i4+%o5]0x88	! Mem[0000000010101410] = 0000140b 80970000
!	Mem[00000000100c1408] = 00000000, %l2 = 0000000000ff00ff
	swapa	[%i3+%o4]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000030141408] = ff000000, %l4 = 00000000ff0000ff
	swapa	[%i5+%o4]0x81,%l4	! %l4 = 00000000ff000000

p0_label_334:
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = ff0000ff, %f1  = ff0000ff
	lda	[%i5+%o4]0x89,%f1 	! %f1 = ff0000ff
!	Mem[0000000010101400] = 069b8097 0b14976b, %l2 = 00000000, %l3 = 00000000
	ldda	[%i4+%g0]0x88,%l2	! %l2 = 000000000b14976b 00000000069b8097
!	%f26 = 58fa12e6, %f10 = 9f3f1d1b e612fa58
	fitod	%f26,%f10		! %f10 = 41d63e84 b9800000
!	Mem[0000000030181410] = ffffffdb, %l0 = 0000000074000000
	lduba	[%i6+%o5]0x89,%l0	! %l0 = 00000000000000db
!	Mem[0000000010141438] = 0000ff00000000ff, %f10 = 41d63e84 b9800000
	ldd	[%i5+0x038],%f10	! %f10 = 0000ff00 000000ff
!	%l5 = 00000000ff000000, immd = fffffc7a, %y  = 00000000
	smul	%l5,-0x386,%l2		! %l2 = 0000000386000000, %y = 00000003
!	Mem[0000000030081408] = 0000ff9700000000, %l3 = 00000000069b8097
	ldxa	[%i2+%o4]0x81,%l3	! %l3 = 0000ff9700000000
!	Mem[0000000020800000] = 000042b0, %l7 = 0000000080970000, %asi = 80
	lduha	[%o1+0x000]%asi,%l7	! %l7 = 0000000000000000
!	Mem[0000000010101408] = ff000000ffffffff, %l5 = 00000000ff000000
	ldxa	[%i4+%o4]0x88,%l5	! %l5 = ff000000ffffffff
!	%f2  = 00000000, %f13 = 00000000, %f11 = 000000ff
	fadds	%f2 ,%f13,%f11		! %f11 = 00000000

p0_label_335:
!	Starting 10 instruction Store Burst
!	%l7 = 0000000000000000, Mem[0000000030141400] = ffff0000
	stba	%l7,[%i5+%g0]0x89	! Mem[0000000030141400] = ffff0000
!	%f6  = 437bb870, %f5  = 00009780, %f3  = 97ff0000
	fadds	%f6 ,%f5 ,%f3 		! tt=0x22, %l0 = 00000000000000fd
!	%l1 = 00000000ff006500, Mem[0000000030001408] = ff0000ff
	stba	%l1,[%i0+%o4]0x89	! Mem[0000000030001408] = ff000000
!	Mem[0000000030101410] = e612fa58, %l0 = 00000000000000fd
	swapa	[%i4+%o5]0x89,%l0	! %l0 = 00000000e612fa58
!	%f12 = 6b97140b, Mem[000000001018142c] = fe9b4b99
	sta	%f12,[%i6+0x02c]%asi	! Mem[000000001018142c] = 6b97140b
!	%f26 = 58fa12e6, Mem[0000000010181400] = ff000000
	sta	%f26,[%i6+%g0]0x88	! Mem[0000000010181400] = 58fa12e6
!	Mem[0000000030081400] = ff000fff, %l3 = 0000ff9700000000
	ldstuba	[%i2+%g0]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030041408] = d925f62d, %l7 = 0000000000000000
	ldstuba	[%i1+%o4]0x89,%l7	! %l7 = 000000000000002d
!	%f10 = 0000ff00, %f23 = 70b87b43, %f3  = 97ff0000
	fdivs	%f10,%f23,%f3 		! %f3  = 00000000
!	%l2 = 0000000386000000, Mem[0000000010141408] = 000000ff
	stha	%l2,[%i5+%o4]0x80	! Mem[0000000010141408] = 000000ff

p0_label_336:
!	Starting 10 instruction Load Burst
!	Mem[0000000021800080] = ffff49a0, %l3 = 00000000000000ff, %asi = 80
	lduha	[%o3+0x080]%asi,%l3	! %l3 = 000000000000ffff
!	Mem[0000000030141410] = 8097000000000000, %f0  = da000000 ff0000ff
	ldda	[%i5+%o5]0x81,%f0 	! %f0  = 80970000 00000000
!	%l6 = 000000000000140b, immd = 00000b41, %y  = 00000003
	smul	%l6,0xb41,%l5		! %l5 = 0000000000e18fcb, %y = 00000000
	membar	#Sync			! Added by membar checker (68)
!	Mem[0000000010101400] = 6b97140b 97809b06 ffffffff 000000ff
!	Mem[0000000010101410] = 0b140000 00009780 00ff00ff 00009780
!	Mem[0000000010101420] = 00000000 0000a6db 000000ff 000000da
!	Mem[0000000010101430] = 00000000 00000000 00ff0000 000000db
	ldda	[%i4+%g0]ASI_BLK_AIUP,%f0 	! Block Load from 0000000010101400
!	Mem[0000000010081404] = ff000000, %l3 = 000000000000ffff, %asi = 80
	ldsha	[%i2+0x004]%asi,%l3	! %l3 = ffffffffffffff00
!	%f23 = 70b87b43, %f18 = 0000ff97, %f27 = 1b1d3f9f
	fadds	%f23,%f18,%f27		! tt=0x22, %l0 = 00000000e612fa7a
!	Mem[0000000030181408] = 00000000 00000000, %l2 = 86000000, %l3 = ffffff00
	ldda	[%i6+%o4]0x81,%l2	! %l2 = 0000000000000000 0000000000000000
!	Mem[0000000010081410] = 80970000, %l7 = 000000000000002d
	ldsba	[%i2+%o5]0x80,%l7	! %l7 = ffffffffffffff80
!	Mem[00000000100c1412] = 000000ff, %l6 = 000000000000140b, %asi = 80
	ldsba	[%i3+0x012]%asi,%l6	! %l6 = 0000000000000000
!	Mem[0000000030001400] = ff76fb54 97809b06, %l6 = 00000000, %l7 = ffffff80
	ldda	[%i0+%g0]0x81,%l6	! %l6 = 00000000ff76fb54 0000000097809b06

p0_label_337:
!	Starting 10 instruction Store Burst
!	%f10 = 000000ff 000000da, Mem[0000000010181408] = b2cc800a bb82f03f
	stda	%f10,[%i6+%o4]0x88	! Mem[0000000010181408] = 000000ff 000000da
!	%f5  = 00009780, Mem[0000000010041400] = ff0000ff
	sta	%f5 ,[%i1+%g0]0x80	! Mem[0000000010041400] = 00009780
!	Mem[00000000100c142c] = ffffffff, %l2 = 00000000, %l2 = 00000000
	add	%i3,0x2c,%g1
	casa	[%g1]0x80,%l2,%l2	! %l2 = 00000000ffffffff
!	Mem[0000000010101400] = 6b97140b 97809b06 ffffffff 000000ff
!	%f0  = 6b97140b 97809b06 ffffffff 000000ff
!	%f4  = 0b140000 00009780 00ff00ff 00009780
!	%f8  = 00000000 0000a6db 000000ff 000000da
!	%f12 = 00000000 00000000 00ff0000 000000db
	stda	%f0 ,[%i4+%g0]ASI_BLK_AIUP	! Block Store to 0000000010101400
!	Mem[0000000030081410] = 00009780, %l7 = 0000000097809b06
	ldstuba	[%i2+%o5]0x81,%l7	! %l7 = 0000000000000000
!	%f12 = 00000000, Mem[0000000010081408] = 00000000
	sta	%f12,[%i2+%o4]0x88	! Mem[0000000010081408] = 00000000
!	Mem[0000000010041408] = 0000febd, %l1 = 00000000ff006500
	ldstuba	[%i1+%o4]0x88,%l1	! %l1 = 00000000000000bd
!	%l6 = 00000000ff76fb54, Mem[0000000010081410] = 00009780
	stba	%l6,[%i2+%o5]0x88	! Mem[0000000010081410] = 00009754
!	%f20 = 80970000, Mem[0000000030141408] = ff0000ff
	sta	%f20,[%i5+%o4]0x81	! Mem[0000000030141408] = 80970000
!	%l4 = 00000000ff000000, Mem[0000000010141408] = 67000000ff000000
	stxa	%l4,[%i5+%o4]0x88	! Mem[0000000010141408] = 00000000ff000000

p0_label_338:
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = 000000ff00008097, %f18 = 0000ff97 00000000
	ldda	[%i6+%g0]0x89,%f18	! %f18 = 000000ff 00008097
!	Mem[0000000010081408] = 00000000, %l0 = 00000000e612fa7a
	lduha	[%i2+%o4]0x80,%l0	! %l0 = 0000000000000000
!	Mem[000000001004142c] = 000000ff, %l3 = 0000000000000000, %asi = 80
	ldswa	[%i1+0x02c]%asi,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030181408] = 00000000, %l7 = 0000000000000000
	ldsha	[%i6+%o4]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000020800001] = 000042b0, %l2 = 00000000ffffffff, %asi = 80
	ldsba	[%o1+0x001]%asi,%l2	! %l2 = 0000000000000000
!	Mem[00000000300c1400] = ff009780, %l1 = 00000000000000bd
	ldswa	[%i3+%g0]0x81,%l1	! %l1 = ffffffffff009780
!	Mem[0000000010181420] = 1d0000ffc5acff6b, %l4 = 00000000ff000000
	ldx	[%i6+0x020],%l4		! %l4 = 1d0000ffc5acff6b
!	Mem[0000000010041424] = 68a8f31d, %f17 = 000000da
	lda	[%i1+0x024]%asi,%f17	! %f17 = 68a8f31d
!	Mem[0000000030001410] = 000000ff, %l1 = ffffffffff009780
	lduba	[%i0+%o5]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030041408] = d925f6ff, %l7 = 0000000000000000
	lduwa	[%i1+%o4]0x89,%l7	! %l7 = 00000000d925f6ff

p0_label_339:
!	Starting 10 instruction Store Burst
!	%l6 = 00000000ff76fb54, Mem[0000000030101400] = 000000ff
	stwa	%l6,[%i4+%g0]0x89	! Mem[0000000030101400] = ff76fb54
!	%l6 = 00000000ff76fb54, Mem[0000000030001410] = ff000000
	stba	%l6,[%i0+%o5]0x81	! Mem[0000000030001410] = 54000000
!	%f12 = 00000000 00000000, Mem[0000000010081438] = 5d8f015a cf08230e, %asi = 80
	stda	%f12,[%i2+0x038]%asi	! Mem[0000000010081438] = 00000000 00000000
!	%l2 = 0000000000000000, Mem[00000000300c1400] = ff009780
	stba	%l2,[%i3+%g0]0x81	! Mem[00000000300c1400] = 00009780
!	Code Fragment 3, seed = 272551
p0_fragment_33:
!	%l0 = 0000000000000000
	setx	0xf063b72718c289ee,%g7,%l0 ! %l0 = f063b72718c289ee
!	%l1 = 00000000000000ff
	setx	0x96c26efcd775b399,%g7,%l1 ! %l1 = 96c26efcd775b399
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = f063b72718c289ee
	setx	0xdf20a0d2b6424954,%g7,%l0 ! %l0 = df20a0d2b6424954
!	%l1 = 96c26efcd775b399
	setx	0xba6d4743c769ce1f,%g7,%l1 ! %l1 = ba6d4743c769ce1f
p0_fragment_33_end:
!	%f29 = 0b14976b, %f29 = 0b14976b
	fcmps	%fcc2,%f29,%f29		! %fcc2 = 0
!	Mem[0000000010041424] = 68a8f31d, %l4 = 00000000c5acff6b
	swap	[%i1+0x024],%l4		! %l4 = 0000000068a8f31d
!	%f10 = 000000ff 000000da, Mem[00000000100c1410] = ff000000 95e20f5b
	stda	%f10,[%i3+%o5]0x88	! Mem[00000000100c1410] = 000000ff 000000da
!	Mem[0000000010081408] = 00000000, %l4 = 0000000068a8f31d
	ldstuba	[%i2+%o4]0x88,%l4	! %l4 = 0000000000000000
!	%l2 = 00000000, %l3 = 000000ff, Mem[0000000010041418] = 00000000 1d000000, %asi = 80
	stda	%l2,[%i1+0x018]%asi	! Mem[0000000010041418] = 00000000 000000ff

p0_label_340:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = 000000ff, %l5 = 0000000000e18fcb
	lduwa	[%i2+%g0]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[00000000300c1410] = 74650000, %l6 = 00000000ff76fb54
	ldsha	[%i3+%o5]0x81,%l6	! %l6 = 0000000000007465
!	Mem[0000000010181410] = ff0000ff, %l4 = 0000000000000000
	lduha	[%i6+%o5]0x80,%l4	! %l4 = 000000000000ff00
!	Mem[00000000100c143c] = ff800000, %f14 = 00ff0000
	lda	[%i3+0x03c]%asi,%f14	! %f14 = ff800000
!	Mem[00000000300c1408] = ffffffff, %l6 = 0000000000007465
	ldsha	[%i3+%o4]0x89,%l6	! %l6 = ffffffffffffffff
!	Mem[00000000300c1408] = 80000000ffffffff, %l4 = 000000000000ff00
	ldxa	[%i3+%o4]0x89,%l4	! %l4 = 80000000ffffffff
!	Mem[0000000010181427] = c5acff6b, %l0 = df20a0d2b6424954, %asi = 80
	ldsba	[%i6+0x027]%asi,%l0	! %l0 = 000000000000006b
!	Mem[00000000100c1438] = 63ad6ddf, %l6 = ffffffffffffffff, %asi = 80
	lduwa	[%i3+0x038]%asi,%l6	! %l6 = 0000000063ad6ddf
!	Mem[0000000010181420] = 1d0000ff, %l3 = 00000000000000ff
	ldub	[%i6+0x020],%l3		! %l3 = 000000000000001d
!	Mem[0000000030181400] = 00008097, %l1 = ba6d4743c769ce1f
	lduba	[%i6+%g0]0x89,%l1	! %l1 = 0000000000000097

p0_label_341:
!	Starting 10 instruction Store Burst
!	%l2 = 0000000000000000, Mem[0000000010041408] = 0000feff
	stwa	%l2,[%i1+%o4]0x88	! Mem[0000000010041408] = 00000000
!	%f8  = 00000000 0000a6db, %l3 = 000000000000001d
!	Mem[0000000030101428] = 00009780ffffffff
	add	%i4,0x028,%g1
	stda	%f8,[%g1+%l3]ASI_PST32_SL ! Mem[0000000030101428] = dba60000ffffffff
!	Mem[0000000010001408] = 0000ff97, %l3 = 000000000000001d
	ldstuba	[%i0+%o4]0x80,%l3	! %l3 = 0000000000000000
!	%l0 = 000000000000006b, Mem[0000000030081408] = 0000ff97
	stha	%l0,[%i2+%o4]0x81	! Mem[0000000030081408] = 006bff97
!	Mem[0000000030181400] = 97800000, %l5 = 00000000000000ff
	ldstuba	[%i6+%g0]0x81,%l5	! %l5 = 0000000000000097
!	%l5 = 0000000000000097, Mem[0000000010081400] = 000000ff000000ff
	stxa	%l5,[%i2+%g0]0x88	! Mem[0000000010081400] = 0000000000000097
!	%l0 = 000000000000006b, imm = 0000000000000e6e, %l6 = 0000000063ad6ddf
	subc	%l0,0xe6e,%l6		! %l6 = fffffffffffff1fd
!	Mem[00000000300c1400] = 00009780, %l0 = 000000000000006b
	ldstuba	[%i3+%g0]0x81,%l0	! %l0 = 0000000000000000
!	%l0 = 00000000, %l1 = 00000097, Mem[0000000010141400] = ff000000 a78cffdb
	stda	%l0,[%i5+%g0]0x80	! Mem[0000000010141400] = 00000000 00000097
!	%f27 = 1b1d3f9f, %f12 = 00000000, %f21 = 00005b0f
	fadds	%f27,%f12,%f21		! %f21 = 1b1d3f9f

p0_label_342:
!	Starting 10 instruction Load Burst
!	Mem[0000000030081410] = ff009780, %l1 = 0000000000000097
	lduwa	[%i2+%o5]0x81,%l1	! %l1 = 00000000ff009780
!	Mem[0000000010001410] = 0f5b0000 ffff0000, %l2 = 00000000, %l3 = 00000000
	ldda	[%i0+%o5]0x88,%l2	! %l2 = 00000000ffff0000 000000000f5b0000
!	Mem[0000000030141400] = ffff0000, %l4 = 80000000ffffffff
	ldsba	[%i5+%g0]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000010001410] = 0f5b0000ffff0000, %l2 = 00000000ffff0000
	ldxa	[%i0+%o5]0x88,%l2	! %l2 = 0f5b0000ffff0000
!	Mem[00000000300c1410] = 74650000, %l0 = 0000000000000000
	ldsha	[%i3+%o5]0x81,%l0	! %l0 = 0000000000007465
	membar	#Sync			! Added by membar checker (69)
!	Mem[0000000010101410] = 0000140b, %l1 = 00000000ff009780
	ldsha	[%i4+%o5]0x88,%l1	! %l1 = 000000000000140b
!	Mem[0000000010101400] = 6b97140b, %l4 = 0000000000000000
	lduha	[%i4+%g0]0x80,%l4	! %l4 = 0000000000006b97
!	%f10 = 000000ff, %f23 = 70b87b43
	fcmpes	%fcc0,%f10,%f23		! %fcc0 = 1
!	Mem[0000000030141400] = 0000ffff, %l3 = 000000000f5b0000
	ldsba	[%i5+%g0]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000010141410] = da0000ff, %l6 = fffffffffffff1fd
	ldsha	[%i5+%o5]0x88,%l6	! %l6 = 00000000000000ff

p0_label_343:
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000006b97, Mem[0000000030041408] = fff625d96bffacc5
	stxa	%l4,[%i1+%o4]0x81	! Mem[0000000030041408] = 0000000000006b97
!	%l2 = ffff0000, %l3 = 00000000, Mem[00000000100c1408] = ff00ff00 00000000
	stda	%l2,[%i3+%o4]0x80	! Mem[00000000100c1408] = ffff0000 00000000
!	%l4 = 0000000000006b97, Mem[0000000030141400] = ffff0000
	stba	%l4,[%i5+%g0]0x89	! Mem[0000000030141400] = ffff0097
!	Code Fragment 3, seed = 978841
p0_fragment_34:
!	%l0 = 0000000000007465
	setx	0x41126992ae5fe45e,%g7,%l0 ! %l0 = 41126992ae5fe45e
!	%l1 = 000000000000140b
	setx	0xb3f3ad7ac978c309,%g7,%l1 ! %l1 = b3f3ad7ac978c309
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 41126992ae5fe45e
	setx	0x3d4de35891a0fdc4,%g7,%l0 ! %l0 = 3d4de35891a0fdc4
!	%l1 = b3f3ad7ac978c309
	setx	0x3c2ddc8d31f7178f,%g7,%l1 ! %l1 = 3c2ddc8d31f7178f
p0_fragment_34_end:
!	%l7 = 00000000d925f6ff, Mem[0000000030181400] = ff800000
	stba	%l7,[%i6+%g0]0x81	! Mem[0000000030181400] = ff800000
!	%f18 = 000000ff 00008097, %l6 = 00000000000000ff
!	Mem[0000000030001400] = ff76fb5497809b06
	stda	%f18,[%i0+%l6]ASI_PST8_SL ! Mem[0000000030001400] = 97800000ff000000
!	Mem[0000000010141410] = ff0000da, %l4 = 0000000000006b97
	ldstuba	[%i5+%o5]0x80,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030041408] = 00000000, %l2 = 0f5b0000ffff0000
	ldstuba	[%i1+%o4]0x81,%l2	! %l2 = 0000000000000000
!	%l2 = 0000000000000000, Mem[0000000030101410] = 95e20f5b000000fd
	stxa	%l2,[%i4+%o5]0x89	! Mem[0000000030101410] = 0000000000000000
!	Mem[0000000010141400] = 00000000, %l0 = 0000000091a0fdc4
	swapa	[%i5+%g0]0x88,%l0	! %l0 = 0000000000000000

p0_label_344:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c143e] = ff800000, %l2 = 0000000000000000
	ldub	[%i3+0x03e],%l2		! %l2 = 0000000000000000
!	Mem[00000000100c1400] = 000000ffa73d4fd6, %l0 = 0000000000000000
	ldxa	[%i3+%g0]0x88,%l0	! %l0 = 000000ffa73d4fd6
!	Mem[00000000100c1410] = 000000da, %l7 = 00000000d925f6ff
	ldsba	[%i3+%o5]0x88,%l7	! %l7 = ffffffffffffffda
!	Mem[0000000010001410] = 0000ffff, %l5 = 0000000000000097, %asi = 80
	ldswa	[%i0+0x010]%asi,%l5	! %l5 = 000000000000ffff
!	Mem[0000000010081408] = 000000ff 000000ff, %l4 = 000000ff, %l5 = 0000ffff
	ldda	[%i2+%o4]0x88,%l4	! %l4 = 00000000000000ff 00000000000000ff
!	Mem[00000000100c1400] = a73d4fd6, %l5 = 00000000000000ff
	ldswa	[%i3+%g0]0x88,%l5	! %l5 = ffffffffa73d4fd6
!	Mem[0000000010041400] = 000000ff 80970000, %l0 = a73d4fd6, %l1 = 31f7178f
	ldda	[%i1+%g0]0x88,%l0	! %l0 = 0000000080970000 00000000000000ff
!	Mem[0000000010101400] = 069b8097 0b14976b, %l6 = 000000ff, %l7 = ffffffda
	ldda	[%i4+%g0]0x88,%l6	! %l6 = 000000000b14976b 00000000069b8097
!	Mem[0000000030001400] = 00008097, %f17 = 68a8f31d
	lda	[%i0+%g0]0x89,%f17	! %f17 = 00008097
!	Mem[0000000010181408] = 000000da, %f17 = 00008097
	lda	[%i6+%o4]0x88,%f17	! %f17 = 000000da

p0_label_345:
!	Starting 10 instruction Store Burst
!	%l6 = 000000000b14976b, Mem[0000000030141400] = 9700ffff
	stha	%l6,[%i5+%g0]0x81	! Mem[0000000030141400] = 976bffff
!	Mem[0000000010001410] = 0000ffff00005b0f, %l4 = 00000000000000ff, %l7 = 00000000069b8097
	add	%i0,0x10,%g1
	casxa	[%g1]0x80,%l4,%l7	! %l7 = 0000ffff00005b0f
!	%l5 = ffffffffa73d4fd6, Mem[0000000010001410] = 0000ffff00005b0f
	stxa	%l5,[%i0+%o5]0x80	! Mem[0000000010001410] = ffffffffa73d4fd6
!	%l2 = 0000000000000000, Mem[0000000010001410] = d64f3da7ffffffff
	stxa	%l2,[%i0+%o5]0x88	! Mem[0000000010001410] = 0000000000000000
!	%f11 = 000000da, Mem[0000000010081414] = 000000ff
	sta	%f11,[%i2+0x014]%asi	! Mem[0000000010081414] = 000000da
!	%l6 = 0b14976b, %l7 = 00005b0f, Mem[0000000010041418] = 00000000 000000ff, %asi = 80
	stda	%l6,[%i1+0x018]%asi	! Mem[0000000010041418] = 0b14976b 00005b0f
!	%f4  = 0b140000 00009780, %l6 = 000000000b14976b
!	Mem[0000000030001400] = 97800000ff000000
	stda	%f4,[%i0+%l6]ASI_PST16_S ! Mem[0000000030001400] = 0b14000000009780
!	Mem[0000000010141413] = ff0000da, %l4 = 00000000000000ff
	ldstub	[%i5+0x013],%l4		! %l4 = 00000000000000da
!	%f6  = 00ff00ff 00009780, Mem[00000000100c1418] = 000000ff 00009780
	std	%f6 ,[%i3+0x018]	! Mem[00000000100c1418] = 00ff00ff 00009780
!	%l0 = 0000000080970000, Mem[0000000030081410] = ff009780
	stba	%l0,[%i2+%o5]0x81	! Mem[0000000030081410] = 00009780

p0_label_346:
!	Starting 10 instruction Load Burst
!	Mem[0000000030101410] = 00000000, %l6 = 000000000b14976b
	lduba	[%i4+%o5]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000010141410] = ff000000ff0000ff, %f14 = ff800000 000000db
	ldda	[%i5+%o5]0x88,%f14	! %f14 = ff000000 ff0000ff
!	Mem[0000000010181400] = 58fa12e6, %l2 = 0000000000000000
	lduwa	[%i6+%g0]0x88,%l2	! %l2 = 0000000058fa12e6
!	Mem[0000000030041410] = ff000000, %l4 = 00000000000000da
	ldswa	[%i1+%o5]0x89,%l4	! %l4 = ffffffffff000000
!	Mem[0000000010141410] = ff0000ff000000ff, %l1 = 00000000000000ff
	ldxa	[%i5+%o5]0x80,%l1	! %l1 = ff0000ff000000ff
	membar	#Sync			! Added by membar checker (70)
!	Mem[0000000010001400] = ff0000ff 000000da ff00ff97 00000000
!	Mem[0000000010001410] = 00000000 00000000 314aa6da 70b87b43
!	Mem[0000000010001420] = 1df3a868 2df625d9 58fa12e6 1b1d3f9f
!	Mem[0000000010001430] = 069b8097 0b14976b 0a80ccb2 3ff082bb
	ldda	[%i0+%g0]ASI_BLK_P,%f0 	! Block Load from 0000000010001400
!	Mem[0000000010081400] = 9700000000000000, %f30 = 0a80ccb2 3ff082bb
	ldd	[%i2+%g0],%f30		! %f30 = 97000000 00000000
!	Mem[0000000010001410] = 0000000000000000, %l3 = 0000000000000000, %asi = 80
	ldxa	[%i0+0x010]%asi,%l3	! %l3 = 0000000000000000
!	Mem[0000000030101410] = 00000000 00000000, %l4 = ff000000, %l5 = a73d4fd6
	ldda	[%i4+%o5]0x89,%l4	! %l4 = 0000000000000000 0000000000000000
!	Mem[0000000010141400] = 91a0fdc4, %l1 = ff0000ff000000ff
	ldsha	[%i5+%g0]0x88,%l1	! %l1 = fffffffffffffdc4

p0_label_347:
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1400] = a73d4fd6, %l0 = 0000000080970000
	ldstuba	[%i3+%g0]0x88,%l0	! %l0 = 00000000000000d6
!	%l3 = 0000000000000000, Mem[0000000010081408] = ff000000ff000000
	stxa	%l3,[%i2+%o4]0x80	! Mem[0000000010081408] = 0000000000000000
!	%l0 = 00000000000000d6, Mem[00000000100c1400] = ff4f3da7
	stba	%l0,[%i3+%g0]0x80	! Mem[00000000100c1400] = d64f3da7
!	Mem[00000000211c0000] = 00ff6b10, %l5 = 0000000000000000
	ldstuba	[%o2+0x000]%asi,%l5	! %l5 = 0000000000000000
!	%l7 = 0000ffff00005b0f, Mem[0000000010181410] = ff0000ff
	stwa	%l7,[%i6+%o5]0x88	! Mem[0000000010181410] = 00005b0f
!	%f22 = 314aa6da 70b87b43, %l4 = 0000000000000000
!	Mem[0000000010041400] = 00009780ff000000
	stda	%f22,[%i1+%l4]ASI_PST8_P ! Mem[0000000010041400] = 00009780ff000000
!	%l6 = 0000000000000000, Mem[00000000300c1400] = 00000000809700ff
	stxa	%l6,[%i3+%g0]0x89	! Mem[00000000300c1400] = 0000000000000000
!	Mem[00000000100c1400] = d64f3da7, %l5 = 0000000000000000
	swapa	[%i3+%g0]0x80,%l5	! %l5 = 00000000d64f3da7
!	%f8  = 1df3a868 2df625d9, %l2 = 0000000058fa12e6
!	Mem[0000000030041430] = 00000000000000ff
	add	%i1,0x030,%g1
	stda	%f8,[%g1+%l2]ASI_PST8_SL ! Mem[0000000030041430] = 0025f60000a8f31d
!	%f7  = 70b87b43, %f18 = 000000ff
	fsqrts	%f7 ,%f18		! %f18 = 5819aad2

p0_label_348:
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = 000000ff, %l0 = 00000000000000d6
	ldsha	[%i4+%o4]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010141400] = c4fda091, %l7 = 0000ffff00005b0f
	lduba	[%i5+%g0]0x80,%l7	! %l7 = 00000000000000c4
!	Mem[0000000030101408] = ff000000, %l1 = fffffffffffffdc4
	lduba	[%i4+%o4]0x81,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010041410] = 000000ff, %l3 = 0000000000000000
	ldswa	[%i1+%o5]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010181410] = 0f5b0000, %l2 = 0000000058fa12e6
	lduba	[%i6+%o5]0x80,%l2	! %l2 = 000000000000000f
!	Mem[00000000201c0000] = ffffe880, %l0 = 00000000000000ff, %asi = 80
	lduha	[%o0+0x000]%asi,%l0	! %l0 = 000000000000ffff
!	Mem[0000000030181400] = ff800000, %l5 = 00000000d64f3da7
	lduwa	[%i6+%g0]0x81,%l5	! %l5 = 00000000ff800000
!	Mem[0000000010081408] = 00000000 00000000, %l0 = 0000ffff, %l1 = 000000ff
	ldda	[%i2+%o4]0x88,%l0	! %l0 = 0000000000000000 0000000000000000
!	Mem[0000000010181408] = 000000da, %l3 = 00000000000000ff
	ldsha	[%i6+%o4]0x88,%l3	! %l3 = 00000000000000da
!	Mem[0000000010181400] = e612fa58, %l2 = 000000000000000f
	ldsha	[%i6+%g0]0x80,%l2	! %l2 = ffffffffffffe612

p0_label_349:
!	Starting 10 instruction Store Burst
!	%f14 = 0a80ccb2 3ff082bb, %l4 = 0000000000000000
!	Mem[00000000300c1428] = 4a28a1469653657f
	add	%i3,0x028,%g1
	stda	%f14,[%g1+%l4]ASI_PST32_S ! Mem[00000000300c1428] = 4a28a1469653657f
!	%f0  = ff0000ff, Mem[0000000030181400] = ff800000
	sta	%f0 ,[%i6+%g0]0x81	! Mem[0000000030181400] = ff0000ff
!	Mem[0000000030141408] = 00009780, %l6 = 0000000000000000
	ldstuba	[%i5+%o4]0x89,%l6	! %l6 = 0000000000000080
!	%l3 = 00000000000000da, Mem[00000000300c1410] = 74650000
	stwa	%l3,[%i3+%o5]0x81	! Mem[00000000300c1410] = 000000da
!	Mem[00000000300c1410] = da000000, %l7 = 00000000000000c4
	ldstuba	[%i3+%o5]0x89,%l7	! %l7 = 0000000000000000
!	%l3 = 00000000000000da, Mem[000000001004140e] = 000000ff, %asi = 80
	stha	%l3,[%i1+0x00e]%asi	! Mem[000000001004140c] = 000000da
!	%l4 = 0000000000000000, Mem[0000000030181410] = ffffffdb
	stha	%l4,[%i6+%o5]0x89	! Mem[0000000030181410] = ffff0000
!	Mem[0000000030181408] = 00000000, %l7 = 0000000000000000
	swapa	[%i6+%o4]0x81,%l7	! %l7 = 0000000000000000
!	%l7 = 0000000000000000, Mem[0000000010081408] = 00000000
	stwa	%l7,[%i2+%o4]0x88	! Mem[0000000010081408] = 00000000
!	%l4 = 0000000000000000, Mem[0000000030081400] = ff0f00ff
	stha	%l4,[%i2+%g0]0x81	! Mem[0000000030081400] = 000000ff

p0_label_350:
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = 00000000ff000000, %f20 = 80970000 1b1d3f9f
	ldda	[%i1+%o5]0x89,%f20	! %f20 = 00000000 ff000000
!	Mem[0000000030001408] = 000000ff, %l2 = ffffffffffffe612
	lduwa	[%i0+%o4]0x81,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030081408] = 00000000 97ff6b00, %l2 = 000000ff, %l3 = 000000da
	ldda	[%i2+%o4]0x89,%l2	! %l2 = 0000000097ff6b00 0000000000000000
!	Mem[0000000010041408] = 00000000, %l6 = 0000000000000080
	ldswa	[%i1+%o4]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000030101400] = ff76fb54, %l1 = 0000000000000000
	lduba	[%i4+%g0]0x89,%l1	! %l1 = 0000000000000054
!	Mem[0000000030041400] = a73d0000, %l4 = 0000000000000000
	lduha	[%i1+%g0]0x81,%l4	! %l4 = 000000000000a73d
!	Mem[000000001008140b] = 00000000, %l6 = 0000000000000000
	ldub	[%i2+0x00b],%l6		! %l6 = 0000000000000000
!	Mem[0000000010041410] = ff000000, %f2  = ff00ff97
	lda	[%i1+%o5]0x80,%f2 	! %f2 = ff000000
!	Mem[0000000010101408] = ff000000ffffffff, %f20 = 00000000 ff000000
	ldda	[%i4+%o4]0x88,%f20	! %f20 = ff000000 ffffffff
!	Mem[0000000030181408] = 00000000, %f21 = ffffffff
	lda	[%i6+%o4]0x81,%f21	! %f21 = 00000000

p0_label_351:
!	Starting 10 instruction Store Burst
!	Mem[0000000010181410] = 0f5b0000, %l1 = 0000000000000054
	swapa	[%i6+%o5]0x80,%l1	! %l1 = 000000000f5b0000
!	%l6 = 0000000000000000, Mem[00000000100c1400] = 00000000
	stwa	%l6,[%i3+%g0]0x88	! Mem[00000000100c1400] = 00000000
!	Mem[00000000300c1410] = da0000ff, %l2 = 0000000097ff6b00
	swapa	[%i3+%o5]0x89,%l2	! %l2 = 00000000da0000ff
!	%l7 = 0000000000000000, Mem[0000000010081429] = 000000ff, %asi = 80
	stba	%l7,[%i2+0x029]%asi	! Mem[0000000010081428] = 000000ff
!	Mem[0000000030181408] = 00000000, %l2 = 00000000da0000ff
	ldstuba	[%i6+%o4]0x89,%l2	! %l2 = 0000000000000000
!	%f6  = 314aa6da 70b87b43, Mem[0000000010101408] = ffffffff 000000ff
	std	%f6 ,[%i4+%o4]		! Mem[0000000010101408] = 314aa6da 70b87b43
!	%f6  = 314aa6da 70b87b43, Mem[0000000010041408] = 00000000 000000da
	stda	%f6 ,[%i1+%o4]0x80	! Mem[0000000010041408] = 314aa6da 70b87b43
!	%l0 = 00000000, %l1 = 0f5b0000, Mem[0000000010041400] = 80970000 000000ff
	stda	%l0,[%i1+%g0]0x88	! Mem[0000000010041400] = 00000000 0f5b0000
!	%l5 = 00000000ff800000, Mem[0000000030081400] = 000000ff
	stwa	%l5,[%i2+%g0]0x81	! Mem[0000000030081400] = ff800000
!	Mem[000000001000140c] = 00000000, %l2 = 00000000, %l0 = 00000000
	add	%i0,0x0c,%g1
	casa	[%g1]0x80,%l2,%l0	! %l0 = 0000000000000000

p0_label_352:
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = a73d0000, %l1 = 000000000f5b0000
	ldsha	[%i1+%g0]0x81,%l1	! %l1 = ffffffffffffa73d
!	Mem[0000000030141400] = 976bffff000000ff, %f18 = 5819aad2 00008097
	ldda	[%i5+%g0]0x81,%f18	! %f18 = 976bffff 000000ff
!	Mem[0000000030081408] = 006bff97 00000000, %l2 = 00000000, %l3 = 00000000
	ldda	[%i2+%o4]0x81,%l2	! %l2 = 00000000006bff97 0000000000000000
!	Mem[0000000030001408] = 00000000ff000000, %l7 = 0000000000000000
	ldxa	[%i0+%o4]0x89,%l7	! %l7 = 00000000ff000000
!	Mem[0000000030081400] = da000000000080ff, %l6 = 0000000000000000
	ldxa	[%i2+%g0]0x89,%l6	! %l6 = da000000000080ff
!	Mem[0000000030141410] = 8097000000000000, %l7 = 00000000ff000000
	ldxa	[%i5+%o5]0x81,%l7	! %l7 = 8097000000000000
!	%l2 = 00000000006bff97, %l3 = 0000000000000000, %l1 = ffffffffffffa73d
	udivx	%l2,%l3,%l1		! Div by zero, %l0 = 0000000000000028
!	Mem[0000000010001408] = ff00ff97, %l0 = 0000000000000028
	ldsba	[%i0+%o4]0x80,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010081434] = ffff0000, %l2 = 00000000006bff97
	ldsw	[%i2+0x034],%l2		! %l2 = ffffffffffff0000
!	Mem[0000000010181410] = 00000054 000000ff, %l6 = 000080ff, %l7 = 00000000
	ldda	[%i6+%o5]0x80,%l6	! %l6 = 0000000000000054 00000000000000ff

p0_label_353:
!	Starting 10 instruction Store Burst
!	%f4  = 00000000 00000000, Mem[0000000010181408] = 000000da 000000ff
	stda	%f4 ,[%i6+%o4]0x88	! Mem[0000000010181408] = 00000000 00000000
!	%f12 = 069b8097, Mem[0000000030041410] = ff000000
	sta	%f12,[%i1+%o5]0x89	! Mem[0000000030041410] = 069b8097
!	%f4  = 00000000, Mem[0000000010101420] = 00000000
	sta	%f4 ,[%i4+0x020]%asi	! Mem[0000000010101420] = 00000000
!	%f6  = 314aa6da 70b87b43, Mem[0000000010041410] = 000000ff ff000000
	stda	%f6 ,[%i1+%o5]0x88	! Mem[0000000010041410] = 314aa6da 70b87b43
!	%l7 = 00000000000000ff, %l3 = 0000000000000000, %l7 = 00000000000000ff
	and	%l7,%l3,%l7		! %l7 = 0000000000000000
!	Mem[0000000010181410] = 54000000, %l6 = 0000000000000054
	ldstuba	[%i6+%o5]0x88,%l6	! %l6 = 0000000000000000
!	%l1 = ffffffffffffa73d, Mem[0000000010141400] = c4fda091
	stha	%l1,[%i5+%g0]0x80	! Mem[0000000010141400] = a73da091
!	%l1 = ffffffffffffa73d, immd = fffffa5c, %y  = 00000000
	sdiv	%l1,-0x5a4,%l4		! %l4 = ffffffffffd29d7e
	mov	%l0,%y			! %y = ffffffff
!	Mem[0000000030081400] = 000080ff, %l5 = 00000000ff800000
	swapa	[%i2+%g0]0x89,%l5	! %l5 = 00000000000080ff
!	%l0 = ffffffffffffffff, Mem[0000000030101410] = 00000000
	stha	%l0,[%i4+%o5]0x81	! Mem[0000000030101410] = ffff0000

p0_label_354:
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = 000000ff, %l6 = 0000000000000000
	ldsha	[%i0+%o4]0x81,%l6	! %l6 = 0000000000000000
!	%l5 = 00000000000080ff, immd = fffffc76, %y  = ffffffff
	udiv	%l5,-0x38a,%l0		! %l0 = 00000000ffffffff
	mov	%l0,%y			! %y = ffffffff
!	Mem[0000000010181408] = 00000000, %l1 = ffffffffffffa73d
	lduwa	[%i6+%o4]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010041418] = 0b14976b00005b0f, %f26 = 58fa12e6 1b1d3f9f, %asi = 80
	ldda	[%i1+0x018]%asi,%f26	! %f26 = 0b14976b 00005b0f
!	Mem[0000000020800000] = 000042b0, %l5 = 00000000000080ff, %asi = 80
	ldsha	[%o1+0x000]%asi,%l5	! %l5 = 0000000000000000
!	Mem[0000000010101400] = 0b14976b, %l4 = ffffffffffd29d7e
	lduwa	[%i4+%g0]0x88,%l4	! %l4 = 000000000b14976b
!	Mem[0000000030041408] = ff000000 00006b97, %l6 = 00000000, %l7 = 00000000
	ldda	[%i1+%o4]0x81,%l6	! %l6 = 00000000ff000000 0000000000006b97
!	Mem[0000000010101408] = 314aa6da, %l3 = 0000000000000000
	ldsba	[%i4+%o4]0x80,%l3	! %l3 = 0000000000000031
!	%l3 = 0000000000000031, immd = 00000474, %y  = ffffffff
	sdiv	%l3,0x474,%l7		! %l7 = ffffffffffc68325
	mov	%l0,%y			! %y = ffffffff
!	Mem[0000000010181400] = e612fa58, %l5 = 0000000000000000, %asi = 80
	lduha	[%i6+0x000]%asi,%l5	! %l5 = 000000000000e612

p0_label_355:
!	Starting 10 instruction Store Burst
!	%f14 = 0a80ccb2 3ff082bb, %l7 = ffffffffffc68325
!	Mem[0000000030081438] = 0a80ccb23ff082bb
	add	%i2,0x038,%g1
	stda	%f14,[%g1+%l7]ASI_PST16_S ! Mem[0000000030081438] = 0a80ccb23ff082bb
	membar	#Sync			! Added by membar checker (71)
!	%f24 = 1df3a868 2df625d9, Mem[0000000010001408] = 97ff00ff 00000000
	stda	%f24,[%i0+%o4]0x88	! Mem[0000000010001408] = 1df3a868 2df625d9
!	%l4 = 0b14976b, %l5 = 0000e612, Mem[0000000010041400] = 00000000 0f5b0000
	stda	%l4,[%i1+%g0]0x88	! Mem[0000000010041400] = 0b14976b 0000e612
!	Mem[0000000010101410] = 0b140000, %l7 = ffffffffffc68325
	ldstuba	[%i4+%o5]0x80,%l7	! %l7 = 000000000000000b
!	%l4 = 000000000b14976b, Mem[00000000211c0000] = ffff6b10, %asi = 80
	stha	%l4,[%o2+0x000]%asi	! Mem[00000000211c0000] = 976b6b10
!	Mem[00000000300c1410] = 006bff97, %l2 = 00000000ffff0000
	swapa	[%i3+%o5]0x81,%l2	! %l2 = 00000000006bff97
!	Mem[0000000010141400] = 91a03da7, %l4 = 000000000b14976b
	ldstuba	[%i5+%g0]0x88,%l4	! %l4 = 00000000000000a7
!	Mem[0000000010181410] = ff000054, %l0 = 00000000ffffffff
	swapa	[%i6+%o5]0x80,%l0	! %l0 = 00000000ff000054
!	Mem[0000000010081400] = 97000000, %l7 = 000000000000000b
	ldstuba	[%i2+%g0]0x80,%l7	! %l7 = 0000000000000097
!	%l5 = 000000000000e612, Mem[0000000021800000] = ff003940, %asi = 80
	stba	%l5,[%o3+0x000]%asi	! Mem[0000000021800000] = 12003940

p0_label_356:
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = 976b6b10, %l6 = 00000000ff000000
	ldsh	[%o2+%g0],%l6		! %l6 = ffffffffffff976b
!	%f8  = 1df3a868, %f16 = ff0000ff
	fcmps	%fcc0,%f8 ,%f16		! %fcc0 = 2
!	Mem[0000000030141400] = ffff6b97, %l5 = 000000000000e612
	lduha	[%i5+%g0]0x89,%l5	! %l5 = 0000000000006b97
!	Mem[0000000030081408] = 97ff6b00, %l0 = 00000000ff000054
	lduwa	[%i2+%o4]0x89,%l0	! %l0 = 0000000097ff6b00
!	Mem[000000001010141d] = 00009780, %l2 = 00000000006bff97, %asi = 80
	ldsba	[%i4+0x01d]%asi,%l2	! %l2 = 0000000000000000
!	Mem[0000000010001410] = 00000000, %l4 = 00000000000000a7
	lduwa	[%i0+%o5]0x80,%l4	! %l4 = 0000000000000000
!	Mem[00000000300c1408] = 80000000ffffffff, %l1 = 0000000000000000
	ldxa	[%i3+%o4]0x89,%l1	! %l1 = 80000000ffffffff
!	Mem[0000000030041400] = a73d0000, %f29 = 0b14976b
	lda	[%i1+%g0]0x81,%f29	! %f29 = a73d0000
!	Mem[0000000010001410] = 00000000 00000000, %l0 = 97ff6b00, %l1 = ffffffff
	ldda	[%i0+%o5]0x88,%l0	! %l0 = 0000000000000000 0000000000000000
!	Mem[0000000030101400] = ff76fb54, %l7 = 0000000000000097
	lduha	[%i4+%g0]0x89,%l7	! %l7 = 000000000000fb54

p0_label_357:
!	Starting 10 instruction Store Burst
!	Mem[0000000020800040] = ffff18e0, %l0 = 0000000000000000
	ldstuba	[%o1+0x040]%asi,%l0	! %l0 = 00000000000000ff
!	%l3 = 0000000000000031, imm = fffffffffffff5b4, %l2 = 0000000000000000
	addc	%l3,-0xa4c,%l2		! %l2 = fffffffffffff5e5
!	Mem[0000000010101408] = 314aa6da, %l2 = fffffffffffff5e5
	ldstuba	[%i4+%o4]0x80,%l2	! %l2 = 0000000000000031
!	Mem[0000000030081408] = 006bff97, %l4 = 0000000000000000
	swapa	[%i2+%o4]0x81,%l4	! %l4 = 00000000006bff97
!	%f24 = 1df3a868, Mem[0000000010101408] = ff4aa6da
	sta	%f24,[%i4+%o4]0x80	! Mem[0000000010101408] = 1df3a868
!	%l7 = 000000000000fb54, Mem[0000000010101408] = 68a8f31d
	stwa	%l7,[%i4+%o4]0x88	! Mem[0000000010101408] = 0000fb54
!	Mem[0000000010041400] = 6b97140b, %l6 = 00000000ffff976b
	swapa	[%i1+%g0]0x80,%l6	! %l6 = 000000006b97140b
!	%l4 = 00000000006bff97, Mem[00000000201c0000] = ffffe880
	sth	%l4,[%o0+%g0]		! Mem[00000000201c0000] = ff97e880
!	Mem[0000000010101400] = 6b97140b, %l3 = 0000000000000031
	swapa	[%i4+%g0]0x80,%l3	! %l3 = 000000006b97140b
!	Mem[00000000300c1408] = ffffffff, %l2 = 0000000000000031
	swapa	[%i3+%o4]0x81,%l2	! %l2 = 00000000ffffffff

p0_label_358:
!	Starting 10 instruction Load Burst
!	Mem[0000000020800040] = ffff18e0, %l0 = 00000000000000ff
	ldsh	[%o1+0x040],%l0		! %l0 = ffffffffffffffff
!	Mem[00000000300c1400] = 00000000, %l1 = 0000000000000000
	ldsba	[%i3+%g0]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000010141410] = ff0000ff, %l5 = 0000000000006b97
	lduwa	[%i5+%o5]0x80,%l5	! %l5 = 00000000ff0000ff
!	Mem[0000000010041400] = 0000e6126b97ffff, %f10 = 58fa12e6 1b1d3f9f
	ldda	[%i1+%g0]0x88,%f10	! %f10 = 0000e612 6b97ffff
!	Mem[0000000010001400] = ff0000ff000000da, %l2 = 00000000ffffffff, %asi = 80
	ldxa	[%i0+0x000]%asi,%l2	! %l2 = ff0000ff000000da
!	Mem[0000000010001400] = ff0000ff, %l6 = 000000006b97140b
	ldswa	[%i0+%g0]0x88,%l6	! %l6 = ffffffffff0000ff
!	Mem[00000000300c1408] = 8000000031000000, %l3 = 000000006b97140b
	ldxa	[%i3+%o4]0x89,%l3	! %l3 = 8000000031000000
!	Mem[0000000010101408] = 54fb0000 70b87b43, %l6 = ff0000ff, %l7 = 0000fb54
	ldda	[%i4+%o4]0x80,%l6	! %l6 = 0000000054fb0000 0000000070b87b43
!	Mem[0000000010181410] = ffffffff000000ff, %l1 = 0000000000000000
	ldxa	[%i6+%o5]0x80,%l1	! %l1 = ffffffff000000ff
!	Mem[000000001014142c] = 000000da, %f0  = ff0000ff
	lda	[%i5+0x02c]%asi,%f0 	! %f0 = 000000da

p0_label_359:
!	Starting 10 instruction Store Burst
!	Mem[0000000010181400] = 58fa12e6, %l2 = 00000000000000da
	swapa	[%i6+%g0]0x88,%l2	! %l2 = 0000000058fa12e6
!	Mem[0000000010081430] = 6b97140b, %l2 = 0000000058fa12e6, %asi = 80
	swapa	[%i2+0x030]%asi,%l2	! %l2 = 000000006b97140b
!	%l6 = 0000000054fb0000, Mem[0000000010081408] = 0000000000000000, %asi = 80
	stxa	%l6,[%i2+0x008]%asi	! Mem[0000000010081408] = 0000000054fb0000
!	%l3 = 8000000031000000, Mem[0000000010001408] = d925f62d
	stba	%l3,[%i0+%o4]0x80	! Mem[0000000010001408] = 0025f62d
!	%f6  = 314aa6da, Mem[0000000030041410] = 069b8097
	sta	%f6 ,[%i1+%o5]0x89	! Mem[0000000030041410] = 314aa6da
!	%f30 = 97000000 00000000, Mem[0000000030001400] = 0000140b 80970000
	stda	%f30,[%i0+%g0]0x89	! Mem[0000000030001400] = 97000000 00000000
!	Mem[0000000010041410] = 70b87b43, %l4 = 00000000006bff97
	swapa	[%i1+%o5]0x88,%l4	! %l4 = 0000000070b87b43
!	Mem[0000000010001430] = 069b80970b14976b, %l1 = ffffffff000000ff, %l2 = 000000006b97140b
	add	%i0,0x30,%g1
	casxa	[%g1]0x80,%l1,%l2	! %l2 = 069b80970b14976b
!	Mem[0000000021800000] = 12003940, %l5 = 00000000ff0000ff
	ldstuba	[%o3+0x000]%asi,%l5	! %l5 = 0000000000000012
!	%l7 = 0000000070b87b43, imm = 00000000000002c6, %l3 = 8000000031000000
	or	%l7,0x2c6,%l3		! %l3 = 0000000070b87bc7

p0_label_360:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = ff00000000000000, %f12 = 069b8097 0b14976b
	ldd	[%i2+%g0],%f12		! %f12 = ff000000 00000000
!	Code Fragment 3, seed = 648313
p0_fragment_35:
!	%l0 = ffffffffffffffff
	setx	0xfacdcda607f31d5e,%g7,%l0 ! %l0 = facdcda607f31d5e
!	%l1 = ffffffff000000ff
	setx	0x6fb1db5cd9daac09,%g7,%l1 ! %l1 = 6fb1db5cd9daac09
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = facdcda607f31d5e
	setx	0xaab3e12ec95296c4,%g7,%l0 ! %l0 = aab3e12ec95296c4
!	%l1 = 6fb1db5cd9daac09
	setx	0xa2e8d8aceda9608f,%g7,%l1 ! %l1 = a2e8d8aceda9608f
p0_fragment_35_end:
!	Mem[0000000030181408] = 00000000000000ff, %l3 = 0000000070b87bc7
	ldxa	[%i6+%o4]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010101400] = 069b809731000000, %l0 = aab3e12ec95296c4
	ldxa	[%i4+%g0]0x88,%l0	! %l0 = 069b809731000000
!	Mem[0000000010141410] = ff0000ff 000000ff, %l0 = 31000000, %l1 = eda9608f
	ldda	[%i5+%o5]0x80,%l0	! %l0 = 00000000ff0000ff 00000000000000ff
!	Mem[0000000030101400] = 54fb76ff ff000000 ff000000 00000000
!	Mem[0000000030101410] = ffff0000 00000000 000000ff 00009780
!	Mem[0000000030101420] = 00000000 ff000000 dba60000 ffffffff
!	Mem[0000000030101430] = ff0000ff 5b0fe295 63ad6ddf 2ca93559
	ldda	[%i4+%g0]ASI_BLK_S,%f0 	! Block Load from 0000000030101400
!	Mem[0000000030141400] = ffff6b97, %l6 = 0000000054fb0000
	ldswa	[%i5+%g0]0x89,%l6	! %l6 = ffffffffffff6b97
!	Mem[00000000300c1410] = 0000ffff, %f26 = 0b14976b
	lda	[%i3+%o5]0x89,%f26	! %f26 = 0000ffff
!	Mem[0000000010001400] = ff0000ff, %l7 = 0000000070b87b43
	lduwa	[%i0+%g0]0x80,%l7	! %l7 = 00000000ff0000ff
!	Mem[00000000211c0000] = 976b6b10, %l0 = 00000000ff0000ff
	ldub	[%o2+%g0],%l0		! %l0 = 0000000000000097

p0_label_361:
!	Starting 10 instruction Store Burst
!	%l4 = 0000000070b87b43, Mem[0000000010081400] = ff00000000000000
	stxa	%l4,[%i2+%g0]0x80	! Mem[0000000010081400] = 0000000070b87b43
!	%l1 = 00000000000000ff, Mem[0000000010041429] = 00000000, %asi = 80
	stba	%l1,[%i1+0x029]%asi	! Mem[0000000010041428] = 00ff0000
!	%f22 = 314aa6da 70b87b43, %l5 = 0000000000000012
!	Mem[0000000030141410] = 8097000000000000
	add	%i5,0x010,%g1
	stda	%f22,[%g1+%l5]ASI_PST8_S ! Mem[0000000030141410] = 809700da00007b00
!	%l7 = 00000000ff0000ff, Mem[00000000300c1400] = 00000000
	stwa	%l7,[%i3+%g0]0x89	! Mem[00000000300c1400] = ff0000ff
!	%l1 = 00000000000000ff, Mem[00000000100c1408] = 0000ffff
	stha	%l1,[%i3+%o4]0x88	! Mem[00000000100c1408] = 000000ff
!	Mem[00000000100c1408] = ff000000, %l7 = 00000000ff0000ff
	swapa	[%i3+%o4]0x80,%l7	! %l7 = 00000000ff000000
!	%l2 = 069b80970b14976b, Mem[0000000030041400] = 00003da7
	stwa	%l2,[%i1+%g0]0x89	! Mem[0000000030041400] = 0b14976b
!	%l3 = 00000000000000ff, Mem[0000000030181408] = ff000000
	stwa	%l3,[%i6+%o4]0x81	! Mem[0000000030181408] = 000000ff
!	Mem[0000000010141434] = 97800000, %l6 = ffff6b97, %l0 = 00000097
	add	%i5,0x34,%g1
	casa	[%g1]0x80,%l6,%l0	! %l0 = 0000000097800000
!	Mem[0000000010181432] = 000000ff, %l5 = 0000000000000012
	ldsh	[%i6+0x032],%l5		! %l5 = 00000000000000ff

p0_label_362:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = 54fb0000, %l0 = 0000000097800000
	ldsba	[%i4+%o4]0x80,%l0	! %l0 = 0000000000000054
!	Mem[0000000030081408] = 00000000, %l0 = 0000000000000054
	ldsba	[%i2+%o4]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000030181400] = ff0000ff, %l2 = 069b80970b14976b
	lduba	[%i6+%g0]0x81,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030001410] = 00000054, %l3 = 00000000000000ff
	ldsha	[%i0+%o5]0x89,%l3	! %l3 = 0000000000000054
!	Mem[0000000010101408] = 0000fb54, %l0 = 0000000000000000
	ldsha	[%i4+%o4]0x88,%l0	! %l0 = fffffffffffffb54
!	Mem[00000000300c1400] = ff0000ff, %l1 = 00000000000000ff
	lduba	[%i3+%g0]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010181408] = 0000000000000000, %f20 = ff000000 00000000
	ldda	[%i6+%o4]0x88,%f20	! %f20 = 00000000 00000000
!	Code Fragment 3, seed = 928715
p0_fragment_36:
!	%l0 = fffffffffffffb54
	setx	0xdc4a70208512d4ce,%g7,%l0 ! %l0 = dc4a70208512d4ce
!	%l1 = 00000000000000ff
	setx	0xcf1a646d10d58879,%g7,%l1 ! %l1 = cf1a646d10d58879
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = dc4a70208512d4ce
	setx	0x7f378ad10de38834,%g7,%l0 ! %l0 = 7f378ad10de38834
!	%l1 = cf1a646d10d58879
	setx	0x5896b184155856ff,%g7,%l1 ! %l1 = 5896b184155856ff
p0_fragment_36_end:
!	Code Fragment 4, seed = 62457
p0_fragment_37:
!	%l0 = 7f378ad10de38834
	setx	0x3335772509e2215e,%g7,%l0 ! %l0 = 3335772509e2215e
!	%l1 = 5896b184155856ff
	setx	0x13e67a4627ea7009,%g7,%l1 ! %l1 = 13e67a4627ea7009
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 3335772509e2215e
	setx	0xac5f807bc8a71ac4,%g7,%l0 ! %l0 = ac5f807bc8a71ac4
!	%l1 = 13e67a4627ea7009
	setx	0x14ae19dbca26a48f,%g7,%l1 ! %l1 = 14ae19dbca26a48f
p0_fragment_37_end:
!	Mem[0000000010081400] = 00000000, %l1 = 14ae19dbca26a48f
	lduha	[%i2+%g0]0x80,%l1	! %l1 = 0000000000000000

p0_label_363:
!	Starting 10 instruction Store Burst
!	%l5 = 00000000000000ff, Mem[0000000020800040] = ffff18e0
	stb	%l5,[%o1+0x040]		! Mem[0000000020800040] = ffff18e0
!	%f4  = ffff0000, Mem[0000000010181408] = 00000000
	sta	%f4 ,[%i6+%o4]0x88	! Mem[0000000010181408] = ffff0000
!	%l2 = 000000ff, %l3 = 00000054, Mem[0000000030081410] = 00009780 00000000
	stda	%l2,[%i2+%o5]0x81	! Mem[0000000030081410] = 000000ff 00000054
!	Mem[000000001004141c] = 00005b0f, %l4 = 0000000070b87b43
	swap	[%i1+0x01c],%l4		! %l4 = 0000000000005b0f
!	Mem[0000000010181410] = ffffffff, %l2 = 00000000000000ff
	swapa	[%i6+%o5]0x80,%l2	! %l2 = 00000000ffffffff
!	%f4  = ffff0000 00000000, Mem[0000000030141408] = 000097ff 00000000
	stda	%f4 ,[%i5+%o4]0x89	! Mem[0000000030141408] = ffff0000 00000000
!	%l5 = 00000000000000ff, %l7 = 00000000ff000000, %l2 = 00000000ffffffff
	or	%l5,%l7,%l2		! %l2 = 00000000ff0000ff
!	Mem[00000000100c1400] = 00000000, %l1 = 0000000000000000
	swapa	[%i3+%g0]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000010141428] = 000000aa, %l3 = 00000054, %l1 = 00000000
	add	%i5,0x28,%g1
	casa	[%g1]0x80,%l3,%l1	! %l1 = 00000000000000aa
!	%l4 = 00005b0f, %l5 = 000000ff, Mem[0000000030041400] = 0b14976b 000000ff
	stda	%l4,[%i1+%g0]0x89	! Mem[0000000030041400] = 00005b0f 000000ff

p0_label_364:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141425] = ff8da6db, %l5 = 00000000000000ff, %asi = 80
	lduba	[%i5+0x025]%asi,%l5	! %l5 = 000000000000008d
!	Mem[0000000010041408] = 314aa6da, %f8  = 00000000
	ld	[%i1+%o4],%f8 		! %f8 = 314aa6da
!	Mem[0000000030081408] = 00000000 00000000, %l2 = ff0000ff, %l3 = 00000054
	ldda	[%i2+%o4]0x89,%l2	! %l2 = 0000000000000000 0000000000000000
!	Mem[0000000030141410] = 809700da, %l4 = 0000000000005b0f
	lduha	[%i5+%o5]0x81,%l4	! %l4 = 0000000000008097
!	Mem[0000000010101400] = 069b809731000000, %f6  = 000000ff 00009780
	ldda	[%i4+%g0]0x88,%f6 	! %f6  = 069b8097 31000000
!	Mem[0000000030041410] = daa64a31, %l0 = ac5f807bc8a71ac4
	ldsba	[%i1+%o5]0x81,%l0	! %l0 = ffffffffffffffda
!	Mem[0000000010041410] = 97ff6b00 daa64a31, %l2 = 00000000, %l3 = 00000000
	ldda	[%i1+%o5]0x80,%l2	! %l2 = 0000000097ff6b00 00000000daa64a31
!	Mem[0000000010141404] = 00000097, %l0 = ffffffffffffffda
	ldsw	[%i5+0x004],%l0		! %l0 = 0000000000000097
!	Mem[0000000030081408] = 0000000000000000, %f10 = dba60000 ffffffff
	ldda	[%i2+%o4]0x89,%f10	! %f10 = 00000000 00000000
!	Mem[0000000010041410] = 97ff6b00 daa64a31, %l2 = 97ff6b00, %l3 = daa64a31
	ldda	[%i1+%o5]0x80,%l2	! %l2 = 0000000097ff6b00 00000000daa64a31

p0_label_365:
!	Starting 10 instruction Store Burst
!	Mem[0000000030041408] = 000000ff, %l3 = 00000000daa64a31
	ldstuba	[%i1+%o4]0x89,%l3	! %l3 = 00000000000000ff
!	%f27 = 00005b0f, Mem[000000001000140c] = 68a8f31d
	st	%f27,[%i0+0x00c]	! Mem[000000001000140c] = 00005b0f
!	%f20 = 00000000 00000000, Mem[0000000030081408] = 00000000 00000000
	stda	%f20,[%i2+%o4]0x89	! Mem[0000000030081408] = 00000000 00000000
!	Mem[00000000211c0000] = 976b6b10, %l4 = 0000000000008097
	ldstuba	[%o2+0x000]%asi,%l4	! %l4 = 0000000000000097
!	%l0 = 0000000000000097, immd = 000004f7, %y  = ffffffff
	sdiv	%l0,0x4f7,%l3		! %l3 = ffffffffffcc6ffd
	mov	%l0,%y			! %y = 00000097
!	%l5 = 000000000000008d, Mem[0000000010101428] = 000000ff000000da, %asi = 80
	stxa	%l5,[%i4+0x028]%asi	! Mem[0000000010101428] = 000000000000008d
	membar	#Sync			! Added by membar checker (72)
!	%l1 = 00000000000000aa, Mem[0000000030101410] = 0000ffff
	stwa	%l1,[%i4+%o5]0x89	! Mem[0000000030101410] = 000000aa
!	%l0 = 0000000000000097, Mem[0000000010101400] = 069b809731000000
	stxa	%l0,[%i4+%g0]0x88	! Mem[0000000010101400] = 0000000000000097
!	Mem[0000000021800181] = 65743a60, %l6 = ffffffffffff6b97
	ldstub	[%o3+0x181],%l6		! %l6 = 0000000000000074
!	Mem[0000000030101410] = 000000aa, %l4 = 0000000000000097
	ldstuba	[%i4+%o5]0x89,%l4	! %l4 = 00000000000000aa

p0_label_366:
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = 00000000 00000000, %l0 = 00000097, %l1 = 000000aa
	ldda	[%i2+%o4]0x89,%l0	! %l0 = 0000000000000000 0000000000000000
!	Mem[0000000030081400] = 000080ff, %l0 = 0000000000000000
	lduba	[%i2+%g0]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000010081400] = 00000000, %l4 = 00000000000000aa
	lduwa	[%i2+%g0]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000010041428] = 00ff0000, %l5 = 000000000000008d, %asi = 80
	lduwa	[%i1+0x028]%asi,%l5	! %l5 = 0000000000ff0000
!	Mem[000000001000140c] = 00005b0f, %l4 = 0000000000000000, %asi = 80
	ldswa	[%i0+0x00c]%asi,%l4	! %l4 = 0000000000005b0f
!	Mem[0000000021800100] = ffff4a00, %l1 = 0000000000000000
	lduh	[%o3+0x100],%l1		! %l1 = 000000000000ffff
!	Mem[0000000010181400] = da000000 000000ff 0000ffff 00000000
!	Mem[0000000010181410] = 000000ff 000000ff 000000db 000000ff
!	Mem[0000000010181420] = 1d0000ff c5acff6b 000000ff 6b97140b
!	Mem[0000000010181430] = 000000ff 00000000 63ad6ddf fddd8024
	ldda	[%i6+%g0]ASI_BLK_P,%f16	! Block Load from 0000000010181400
!	Mem[00000000100c1410] = 000000da, %l5 = 0000000000ff0000
	lduha	[%i3+%o5]0x88,%l5	! %l5 = 00000000000000da
!	Mem[0000000030181410] = 95e20f5bffff0000, %l3 = ffffffffffcc6ffd
	ldxa	[%i6+%o5]0x89,%l3	! %l3 = 95e20f5bffff0000
!	Mem[00000000100c1408] = ff0000ff00000000, %f10 = 00000000 00000000
	ldda	[%i3+%o4]0x80,%f10	! %f10 = ff0000ff 00000000

p0_label_367:
!	Starting 10 instruction Store Burst
!	%l4 = 00005b0f, %l5 = 000000da, Mem[0000000010001410] = 00000000 00000000
	stda	%l4,[%i0+%o5]0x88	! Mem[0000000010001410] = 00005b0f 000000da
!	Mem[0000000010181400] = da000000, %l4 = 0000000000005b0f
	swapa	[%i6+%g0]0x80,%l4	! %l4 = 00000000da000000
!	Mem[0000000030041400] = 0f5b0000, %l4 = 00000000da000000
	ldstuba	[%i1+%g0]0x81,%l4	! %l4 = 000000000000000f
!	%f0  = 54fb76ff ff000000, %l7 = 00000000ff000000
!	Mem[0000000010081408] = 0000000054fb0000
	add	%i2,0x008,%g1
	stda	%f0,[%g1+%l7]ASI_PST16_PL ! Mem[0000000010081408] = 0000000054fb0000
!	Mem[0000000010041438] = 7e000000, %l1 = 000000000000ffff, %asi = 80
	swapa	[%i1+0x038]%asi,%l1	! %l1 = 000000007e000000
!	Mem[00000000211c0001] = ff6b6b10, %l0 = 0000000000000000
	ldstub	[%o2+0x001],%l0		! %l0 = 000000000000006b
!	%l7 = 00000000ff000000, Mem[0000000030041400] = 000000ff00005bff
	stxa	%l7,[%i1+%g0]0x89	! Mem[0000000030041400] = 00000000ff000000
!	Mem[0000000010081408] = 0000000054fb0000, %l5 = 00000000000000da, %l2 = 0000000097ff6b00
	add	%i2,0x08,%g1
	casxa	[%g1]0x80,%l5,%l2	! %l2 = 0000000054fb0000
!	Mem[0000000010141410] = ff0000ff000000ff, %l2 = 0000000054fb0000, %l5 = 00000000000000da
	add	%i5,0x10,%g1
	casxa	[%g1]0x80,%l2,%l5	! %l5 = ff0000ff000000ff
!	%l1 = 000000007e000000, Mem[0000000010041400] = ffff976b
	stwa	%l1,[%i1+%g0]0x80	! Mem[0000000010041400] = 7e000000

p0_label_368:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181418] = 000000db, %l6 = 0000000000000074, %asi = 80
	ldsba	[%i6+0x018]%asi,%l6	! %l6 = 0000000000000000
!	Mem[0000000010181410] = ff000000, %f13 = 5b0fe295
	lda	[%i6+%o5]0x88,%f13	! %f13 = ff000000
!	Mem[0000000010001424] = 2df625d9, %l5 = ff0000ff000000ff, %asi = 80
	ldswa	[%i0+0x024]%asi,%l5	! %l5 = 000000002df625d9
!	Mem[0000000010181410] = ff000000, %f7  = 31000000
	lda	[%i6+%o5]0x88,%f7 	! %f7 = ff000000
!	Mem[0000000010041420] = dbffffff, %f14 = 63ad6ddf
	ld	[%i1+0x020],%f14	! %f14 = dbffffff
!	Mem[0000000010101410] = 000014ff, %l4 = 000000000000000f
	lduwa	[%i4+%o5]0x88,%l4	! %l4 = 00000000000014ff
!	Mem[0000000030041400] = ff000000, %l6 = 0000000000000000
	ldswa	[%i1+%g0]0x89,%l6	! %l6 = ffffffffff000000
!	Mem[0000000010001410] = 00005b0f, %l2 = 0000000054fb0000
	lduha	[%i0+%o5]0x88,%l2	! %l2 = 0000000000005b0f
!	Mem[0000000010141410] = ff0000ff, %l0 = 000000000000006b
	lduwa	[%i5+%o5]0x80,%l0	! %l0 = 00000000ff0000ff
!	Mem[0000000010001410] = 000000da00005b0f, %f2  = ff000000 00000000
	ldda	[%i0+%o5]0x88,%f2 	! %f2  = 000000da 00005b0f

p0_label_369:
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1410] = 000000da, %l1 = 000000007e000000
	swapa	[%i3+%o5]0x88,%l1	! %l1 = 00000000000000da
!	%l1 = 00000000000000da, immd = fffff17b, %y  = 00000097
	sdiv	%l1,-0xe85,%l6		! %l6 = fffffffff599a7b5
	mov	%l0,%y			! %y = ff0000ff
!	Mem[00000000300c1408] = 00000031, %l2 = 0000000000005b0f
	swapa	[%i3+%o4]0x81,%l2	! %l2 = 0000000000000031
!	Mem[0000000030101408] = ff000000, %l3 = 95e20f5bffff0000
	ldstuba	[%i4+%o4]0x81,%l3	! %l3 = 00000000000000ff
!	%l6 = fffffffff599a7b5, Mem[000000001014140c] = 00000000
	stw	%l6,[%i5+0x00c]		! Mem[000000001014140c] = f599a7b5
!	%l7 = 00000000ff000000, Mem[00000000201c0001] = ff97e880
	stb	%l7,[%o0+0x001]		! Mem[00000000201c0000] = ff00e880
!	%l4 = 00000000000014ff, Mem[0000000010081408] = 00000000
	stha	%l4,[%i2+%o4]0x88	! Mem[0000000010081408] = 000014ff
!	%l2 = 0000000000000031, Mem[0000000010101420] = 00000000
	stw	%l2,[%i4+0x020]		! Mem[0000000010101420] = 00000031
!	%f24 = 1d0000ff c5acff6b, Mem[0000000030041408] = ff000000 00006b97
	stda	%f24,[%i1+%o4]0x81	! Mem[0000000030041408] = 1d0000ff c5acff6b
!	%l2 = 0000000000000031, Mem[0000000030101410] = 000000ff
	stba	%l2,[%i4+%o5]0x89	! Mem[0000000030101410] = 00000031

p0_label_370:
!	Starting 10 instruction Load Burst
!	Code Fragment 4, seed = 217080
p0_fragment_38:
!	%l0 = 00000000ff0000ff
	setx	0x1c9d8b0771067066,%g7,%l0 ! %l0 = 1c9d8b0771067066
!	%l1 = 00000000000000da
	setx	0xf149c605f7503091,%g7,%l1 ! %l1 = f149c605f7503091
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 1c9d8b0771067066
	setx	0x471bd7f2be9194cc,%g7,%l0 ! %l0 = 471bd7f2be9194cc
!	%l1 = f149c605f7503091
	setx	0xab295b470916a017,%g7,%l1 ! %l1 = ab295b470916a017
p0_fragment_38_end:
!	Mem[00000000100c1418] = 00ff00ff 00009780, %l6 = f599a7b5, %l7 = ff000000, %asi = 80
	ldda	[%i3+0x018]%asi,%l6	! %l6 = 0000000000ff00ff 0000000000009780
!	Mem[0000000010041408] = 314aa6da, %l3 = 00000000000000ff
	lduba	[%i1+%o4]0x80,%l3	! %l3 = 0000000000000031
!	Mem[0000000010181408] = 00000000ffff0000, %l4 = 00000000000014ff
	ldxa	[%i6+%o4]0x88,%l4	! %l4 = 00000000ffff0000
!	Mem[0000000010001400] = da000000 ff0000ff, %l0 = be9194cc, %l1 = 0916a017
	ldda	[%i0+%g0]0x88,%l0	! %l0 = 00000000ff0000ff 00000000da000000
!	Mem[0000000010041400] = 7e000000, %l4 = 00000000ffff0000
	ldsba	[%i1+%g0]0x80,%l4	! %l4 = 000000000000007e
!	Mem[0000000030101400] = ff76fb54, %l4 = 000000000000007e
	lduwa	[%i4+%g0]0x89,%l4	! %l4 = 00000000ff76fb54
!	Mem[00000000300c1400] = ff0000ff, %l3 = 0000000000000031
	lduba	[%i3+%g0]0x81,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030001408] = 000000ff, %l1 = 00000000da000000
	ldsba	[%i0+%o4]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000030101400] = 000000ff ff76fb54, %l0 = ff0000ff, %l1 = 00000000
	ldda	[%i4+%g0]0x89,%l0	! %l0 = 00000000ff76fb54 00000000000000ff

p0_label_371:
!	Starting 10 instruction Store Burst
!	Mem[000000001014143c] = 000000ff, %l3 = 00000000000000ff
	swap	[%i5+0x03c],%l3		! %l3 = 00000000000000ff
!	%l5 = 000000002df625d9, Mem[0000000010141412] = ff0000ff
	sth	%l5,[%i5+0x012]		! Mem[0000000010141410] = ff0025d9
!	%l2 = 0000000000000031, Mem[0000000030041400] = 000000ff00000000
	stxa	%l2,[%i1+%g0]0x81	! Mem[0000000030041400] = 0000000000000031
!	%f2  = 000000da 00005b0f, Mem[0000000030181400] = ff0000ff 000000ff
	stda	%f2 ,[%i6+%g0]0x89	! Mem[0000000030181400] = 000000da 00005b0f
!	%l4 = ff76fb54, %l5 = 2df625d9, Mem[0000000030181408] = 000000ff 00000000
	stda	%l4,[%i6+%o4]0x81	! Mem[0000000030181408] = ff76fb54 2df625d9
!	%l2 = 0000000000000031, Mem[0000000030181400] = 00005b0f
	stha	%l2,[%i6+%g0]0x89	! Mem[0000000030181400] = 00000031
!	Mem[0000000010081416] = 000000da, %l4 = 00000000ff76fb54
	ldstuba	[%i2+0x016]%asi,%l4	! %l4 = 0000000000000000
!	%l2 = 0000000000000031, Mem[0000000010081408] = ff140000
	stha	%l2,[%i2+%o4]0x80	! Mem[0000000010081408] = 00310000
!	%f12 = ff0000ff ff000000, Mem[0000000030001400] = 00000000 00000097
	stda	%f12,[%i0+%g0]0x81	! Mem[0000000030001400] = ff0000ff ff000000
!	Mem[0000000030001408] = 000000ff, %l6 = 0000000000ff00ff
	ldstuba	[%i0+%o4]0x81,%l6	! %l6 = 0000000000000000

p0_label_372:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = 00003100, %f0  = 54fb76ff
	lda	[%i2+%o4]0x88,%f0 	! %f0 = 00003100
!	Mem[0000000010181408] = 00000000ffff0000, %f0  = 00003100 ff000000
	ldda	[%i6+%o4]0x88,%f0 	! %f0  = 00000000 ffff0000
!	Mem[0000000030181400] = 00000031, %f11 = 00000000
	lda	[%i6+%g0]0x89,%f11	! %f11 = 00000031
!	%f16 = da000000, %f21 = 000000ff
	fcmpes	%fcc3,%f16,%f21		! %fcc3 = 1
!	Mem[000000001018143b] = 63ad6ddf, %l6 = 0000000000000000
	ldub	[%i6+0x03b],%l6		! %l6 = 00000000000000df
!	Mem[0000000010181430] = 000000ff, %l0 = 00000000ff76fb54
	lduh	[%i6+0x030],%l0		! %l0 = 0000000000000000
!	Mem[0000000010101408] = 437bb8700000fb54, %f30 = 63ad6ddf fddd8024
	ldda	[%i4+%o4]0x88,%f30	! %f30 = 437bb870 0000fb54
	membar	#Sync			! Added by membar checker (73)
!	Mem[0000000010041400] = 7e000000 12e60000 314aa6da 70b87b43
!	Mem[0000000010041410] = 97ff6b00 daa64a31 0b14976b 70b87b43
!	Mem[0000000010041420] = dbffffff c5acff6b 00ff0000 000000ff
!	Mem[0000000010041430] = 97809b06 00000000 0000ffff 587464ff
	ldda	[%i1+%g0]ASI_BLK_P,%f16	! Block Load from 0000000010041400
!	Mem[00000000300c1400] = ff0000ff00000000, %l7 = 0000000000009780
	ldxa	[%i3+%g0]0x81,%l7	! %l7 = ff0000ff00000000
!	Mem[0000000010081400] = 00000000, %f8  = 314aa6da
	lda	[%i2+%g0]0x80,%f8 	! %f8 = 00000000

p0_label_373:
!	Starting 10 instruction Store Burst
!	%f8  = 00000000, Mem[00000000100c1408] = ff0000ff
	sta	%f8 ,[%i3+%o4]0x88	! Mem[00000000100c1408] = 00000000
!	%l3 = 00000000000000ff, Mem[00000000211c0000] = ffff6b10
	sth	%l3,[%o2+%g0]		! Mem[00000000211c0000] = 00ff6b10
!	Mem[0000000010081404] = 70b87b43, %l0 = 0000000000000000, %asi = 80
	swapa	[%i2+0x004]%asi,%l0	! %l0 = 0000000070b87b43
!	%f14 = dbffffff 2ca93559, Mem[0000000010001408] = 2df62500 0f5b0000
	stda	%f14,[%i0+%o4]0x88	! Mem[0000000010001408] = dbffffff 2ca93559
!	Mem[0000000010081428] = 000000ff00000000, %l4 = 0000000000000000, %l3 = 00000000000000ff
	add	%i2,0x28,%g1
	casxa	[%g1]0x80,%l4,%l3	! %l3 = 000000ff00000000
	membar	#Sync			! Added by membar checker (74)
!	%f18 = 314aa6da 70b87b43, %l7 = ff0000ff00000000
!	Mem[0000000010041408] = 314aa6da70b87b43
	add	%i1,0x008,%g1
	stda	%f18,[%g1+%l7]ASI_PST8_P ! Mem[0000000010041408] = 314aa6da70b87b43
!	Mem[0000000030181410] = 0000ffff, %l0 = 0000000070b87b43
	swapa	[%i6+%o5]0x81,%l0	! %l0 = 000000000000ffff
!	Mem[0000000010001410] = 0f5b0000, %l2 = 0000000000000031
	swapa	[%i0+%o5]0x80,%l2	! %l2 = 000000000f5b0000
!	Mem[0000000010101421] = 00000031, %l3 = 000000ff00000000
	ldstub	[%i4+0x021],%l3		! %l3 = 0000000000000000
!	%l4 = 0000000000000000, Mem[0000000010141402] = ff3da091
	sth	%l4,[%i5+0x002]		! Mem[0000000010141400] = ff3d0000

p0_label_374:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = 006bff97, %l1 = 00000000000000ff
	lduwa	[%i1+%o5]0x88,%l1	! %l1 = 00000000006bff97
!	Mem[00000000300c1410] = 0000ffff, %l4 = 0000000000000000
	ldsba	[%i3+%o5]0x89,%l4	! %l4 = ffffffffffffffff
!	Mem[00000000300c1400] = 00000000 ff0000ff, %l6 = 000000df, %l7 = 00000000
	ldda	[%i3+%g0]0x89,%l6	! %l6 = 00000000ff0000ff 0000000000000000
!	Mem[0000000010101410] = ff140000, %l7 = 0000000000000000
	lduba	[%i4+%o5]0x80,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010081408] = 0000fb54 00003100, %l2 = 0f5b0000, %l3 = 00000000
	ldda	[%i2+%o4]0x88,%l2	! %l2 = 0000000000003100 000000000000fb54
!	Mem[00000000100c1410] = 0000007e ff000000, %l6 = ff0000ff, %l7 = 000000ff
	ldda	[%i3+%o5]0x80,%l6	! %l6 = 000000000000007e 00000000ff000000
!	Mem[0000000010181408] = 00000000ffff0000, %f8  = 00000000 ff000000
	ldda	[%i6+%o4]0x88,%f8 	! %f8  = 00000000 ffff0000
!	Mem[00000000100c1400] = 00000000, %l2 = 0000000000003100
	ldswa	[%i3+%g0]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000010001400] = ff0000ff, %l0 = 000000000000ffff
	ldub	[%i0+%g0],%l0		! %l0 = 00000000000000ff
!	Mem[0000000030081410] = 54000000ff000000, %l0 = 00000000000000ff
	ldxa	[%i2+%o5]0x89,%l0	! %l0 = 54000000ff000000

p0_label_375:
!	Starting 10 instruction Store Burst
!	Mem[0000000030141408] = 00000000, %l4 = ffffffffffffffff
	ldstuba	[%i5+%o4]0x89,%l4	! %l4 = 0000000000000000
!	%f26 = 00ff0000 000000ff, %l0 = 54000000ff000000
!	Mem[0000000030181408] = ff76fb542df625d9
	add	%i6,0x008,%g1
	stda	%f26,[%g1+%l0]ASI_PST8_SL ! Mem[0000000030181408] = ff76fb542df625d9
!	%f23 = 70b87b43, %f5  = 00000000, %f7  = ff000000
	fadds	%f23,%f5 ,%f7 		! %f7  = 70b87b43
!	%l6 = 000000000000007e, Mem[0000000010101410] = 000014ff
	stwa	%l6,[%i4+%o5]0x88	! Mem[0000000010101410] = 0000007e
!	%f26 = 00ff0000 000000ff, Mem[0000000030081408] = 00000000 00000000
	stda	%f26,[%i2+%o4]0x81	! Mem[0000000030081408] = 00ff0000 000000ff
!	%f12 = ff0000ff ff000000, Mem[0000000030081408] = 00ff0000 000000ff
	stda	%f12,[%i2+%o4]0x81	! Mem[0000000030081408] = ff0000ff ff000000
!	Mem[0000000010181400] = 00005b0f 000000ff 0000ffff 00000000
!	%f0  = 00000000 ffff0000 000000da 00005b0f
!	%f4  = ffff0000 00000000 069b8097 70b87b43
!	%f8  = 00000000 ffff0000 ff0000ff 00000031
!	%f12 = ff0000ff ff000000 dbffffff 2ca93559
	stda	%f0 ,[%i6+%g0]ASI_BLK_AIUP	! Block Store to 0000000010181400
!	Mem[0000000020800041] = ffff18e0, %l5 = 000000002df625d9
	ldstuba	[%o1+0x041]%asi,%l5	! %l5 = 00000000000000ff
!	%l0 = ff000000, %l1 = 006bff97, Mem[0000000010081410] = 00009754 daff0000
	stda	%l0,[%i2+%o5]0x88	! Mem[0000000010081410] = ff000000 006bff97
!	Mem[0000000030001408] = ff0000ff, %l5 = 00000000000000ff
	ldstuba	[%i0+%o4]0x81,%l5	! %l5 = 00000000000000ff

p0_label_376:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = 31000000, %l3 = 000000000000fb54
	lduha	[%i0+%o5]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000030041400] = 00000000 00000031 1d0000ff c5acff6b
!	Mem[0000000030041410] = daa64a31 00000000 4bad6d62 389c3533
!	Mem[0000000030041420] = ffffe36a 000007df ffd3f3cc 9664009b
!	Mem[0000000030041430] = 0025f600 00a8f31d 4bad6d62 1d10ac3a
	ldda	[%i1+%g0]ASI_BLK_S,%f0 	! Block Load from 0000000030041400
!	Mem[0000000030001400] = ff0000ffff000000, %l1 = 00000000006bff97
	ldxa	[%i0+%g0]0x81,%l1	! %l1 = ff0000ffff000000
	membar	#Sync			! Added by membar checker (75)
!	Mem[0000000010141400] = ff3d0000 00000097 000000ff f599a7b5
!	Mem[0000000010141410] = ff0025d9 000000ff 44a491d7 ffa64a31
!	Mem[0000000010141420] = 95e20f5b ff8da6db 000000aa 000000da
!	Mem[0000000010141430] = 6b97140b 97800000 0000ff00 000000ff
	ldda	[%i5+%g0]ASI_BLK_P,%f0 	! Block Load from 0000000010141400
!	Mem[0000000030181408] = 54fb76ff, %l5 = 00000000000000ff
	ldsba	[%i6+%o4]0x89,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000030081408] = ff0000ff, %l1 = ff0000ffff000000
	ldswa	[%i2+%o4]0x89,%l1	! %l1 = ffffffffff0000ff
!	Mem[0000000010141410] = d92500ff, %f30 = 0000ffff
	lda	[%i5+%o5]0x88,%f30	! %f30 = d92500ff
!	Mem[0000000021800141] = 28008430, %l2 = 0000000000000000
	ldub	[%o3+0x141],%l2		! %l2 = 0000000000000000
!	Mem[00000000211c0001] = 00ff6b10, %l2 = 0000000000000000
	ldsb	[%o2+0x001],%l2		! %l2 = ffffffffffffffff
!	Mem[0000000010141408] = 000000ff, %l4 = 0000000000000000
	lduba	[%i5+%o4]0x80,%l4	! %l4 = 0000000000000000

p0_label_377:
!	Starting 10 instruction Store Burst
!	%l5 = ffffffffffffffff, Mem[00000000300c1400] = ff0000ff
	stwa	%l5,[%i3+%g0]0x81	! Mem[00000000300c1400] = ffffffff
!	Mem[0000000010081400] = 00000000, %l6 = 000000000000007e
	ldstuba	[%i2+%g0]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000010101434] = 00000000, %l6 = 0000000000000000
	swap	[%i4+0x034],%l6		! %l6 = 0000000000000000
	membar	#Sync			! Added by membar checker (76)
!	%f4  = ff0025d9, Mem[0000000010141400] = ff3d0000
	sta	%f4 ,[%i5+%g0]0x80	! Mem[0000000010141400] = ff0025d9
!	Mem[00000000100c1424] = 00000000, %l7 = ff000000, %l4 = 00000000
	add	%i3,0x24,%g1
	casa	[%g1]0x80,%l7,%l4	! %l4 = 0000000000000000
!	%l0 = 54000000ff000000, Mem[0000000010181408] = 000000da00005b0f
	stxa	%l0,[%i6+%o4]0x80	! Mem[0000000010181408] = 54000000ff000000
!	%l2 = ffffffffffffffff, Mem[0000000010141438] = 0000ff00000000ff
	stx	%l2,[%i5+0x038]		! Mem[0000000010141438] = ffffffffffffffff
!	Mem[0000000010101408] = 0000fb54, %l4 = 0000000000000000
	ldstuba	[%i4+%o4]0x88,%l4	! %l4 = 0000000000000054
!	Mem[0000000010141410] = ff0025d9, %l4 = 0000000000000054
	swapa	[%i5+%o5]0x80,%l4	! %l4 = 00000000ff0025d9
!	Mem[0000000030041410] = daa64a31, %l7 = 00000000ff000000
	swapa	[%i1+%o5]0x81,%l7	! %l7 = 00000000daa64a31

p0_label_378:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = 00000000, %l2 = ffffffffffffffff
	lduba	[%i3+%o4]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000030001410] = 54000000, %l4 = 00000000ff0025d9
	ldswa	[%i0+%o5]0x81,%l4	! %l4 = 0000000054000000
!	Mem[0000000020800000] = 000042b0, %l3 = 0000000000000000
	ldsh	[%o1+%g0],%l3		! %l3 = 0000000000000000
!	Mem[0000000010101400] = 97000000, %l2 = 0000000000000000
	lduha	[%i4+%g0]0x80,%l2	! %l2 = 0000000000009700
!	Mem[0000000010041408] = 314aa6da, %l3 = 0000000000000000
	lduba	[%i1+%o4]0x80,%l3	! %l3 = 0000000000000031
!	Mem[0000000010081408] = 00310000, %l7 = 00000000daa64a31
	lduba	[%i2+%o4]0x80,%l7	! %l7 = 0000000000000000
!	Mem[00000000100c1400] = 00000000, %f9  = ff8da6db
	lda	[%i3+%g0]0x80,%f9 	! %f9 = 00000000
!	Mem[0000000010101410] = 7e000000 00009780, %l6 = 00000000, %l7 = 00000000
	ldda	[%i4+%o5]0x80,%l6	! %l6 = 000000007e000000 0000000000009780
!	Mem[00000000201c0000] = ff00e880, %l3 = 0000000000000031
	ldsh	[%o0+%g0],%l3		! %l3 = ffffffffffffff00
!	Mem[00000000300c1410] = 000000000000ffff, %l1 = ffffffffff0000ff
	ldxa	[%i3+%o5]0x89,%l1	! %l1 = 000000000000ffff

p0_label_379:
!	Starting 10 instruction Store Burst
!	%l5 = ffffffffffffffff, Mem[00000000300c1400] = ffffffff
	stba	%l5,[%i3+%g0]0x81	! Mem[00000000300c1400] = ffffffff
!	Mem[00000000218000c1] = 16688bd0, %l6 = 000000007e000000
	ldstuba	[%o3+0x0c1]%asi,%l6	! %l6 = 0000000000000068
!	Mem[00000000100c1410] = 0000007e, %l6 = 0000000000000068
	ldstuba	[%i3+%o5]0x80,%l6	! %l6 = 0000000000000000
!	%l0 = 54000000ff000000, Mem[0000000010081408] = 00310000
	stha	%l0,[%i2+%o4]0x80	! Mem[0000000010081408] = 00000000
!	Mem[00000000201c0001] = ff00e880, %l6 = 0000000000000000
	ldstuba	[%o0+0x001]%asi,%l6	! %l6 = 0000000000000000
!	Mem[0000000010181400] = 00000000, %l7 = 0000000000009780
	ldstuba	[%i6+%g0]0x80,%l7	! %l7 = 0000000000000000
!	%l5 = ffffffffffffffff, Mem[0000000010181438] = dbffffff2ca93559, %asi = 80
	stxa	%l5,[%i6+0x038]%asi	! Mem[0000000010181438] = ffffffffffffffff
!	%l0 = 54000000ff000000, Mem[00000000100c1408] = 0000000000000000
	stxa	%l0,[%i3+%o4]0x88	! Mem[00000000100c1408] = 54000000ff000000
!	Mem[0000000030001400] = ff0000ff, %l0 = 00000000ff000000
	swapa	[%i0+%g0]0x81,%l0	! %l0 = 00000000ff0000ff
!	%l4 = 0000000054000000, Mem[00000000201c0001] = ffffe880
	stb	%l4,[%o0+0x001]		! Mem[00000000201c0000] = ff00e880

p0_label_380:
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = 00000000, %l6 = 0000000000000000
	lduba	[%i1+%g0]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000010041408] = 314aa6da, %l2 = 0000000000009700
	ldsba	[%i1+%o4]0x80,%l2	! %l2 = 0000000000000031
!	Mem[0000000030001410] = 8097000000000054, %f4  = ff0025d9 000000ff
	ldda	[%i0+%o5]0x89,%f4 	! %f4  = 80970000 00000054
!	Mem[0000000010141400] = d92500ff, %l4 = 0000000054000000
	lduba	[%i5+%g0]0x88,%l4	! %l4 = 00000000000000ff
!	%f26 = 00ff0000, %f26 = 00ff0000, %f5  = 00000054
	fdivs	%f26,%f26,%f5 		! %f5  = 3f800000
!	Mem[0000000030141410] = da009780, %l6 = 0000000000000000
	ldswa	[%i5+%o5]0x89,%l6	! %l6 = ffffffffda009780
!	Mem[0000000030041408] = ff00001d, %l5 = ffffffffffffffff
	ldsha	[%i1+%o4]0x89,%l5	! %l5 = 000000000000001d
!	Mem[0000000010101408] = 0000fbff, %l0 = 00000000ff0000ff
	ldswa	[%i4+%o4]0x88,%l0	! %l0 = 000000000000fbff
!	Mem[00000000211c0001] = 00ff6b10, %l4 = 00000000000000ff
	ldub	[%o2+0x001],%l4		! %l4 = 00000000000000ff
!	%f12 = 6b97140b, %f25 = c5acff6b, %f26 = 00ff0000
	fsubs	%f12,%f25,%f26		! %f26 = 6b97140b

p0_label_381:
!	Starting 10 instruction Store Burst
!	%l7 = 0000000000000000, Mem[0000000010001410] = 31000000
	stba	%l7,[%i0+%o5]0x88	! Mem[0000000010001410] = 31000000
!	Mem[0000000010101410] = 0000007e, %l3 = 00000000ffffff00
	swapa	[%i4+%o5]0x88,%l3	! %l3 = 000000000000007e
!	%l2 = 0000000000000031, Mem[00000000201c0000] = ff00e880
	sth	%l2,[%o0+%g0]		! Mem[00000000201c0000] = 0031e880
!	%l0 = 0000fbff, %l1 = 0000ffff, Mem[0000000010041400] = 7e000000 12e60000
	stda	%l0,[%i1+%g0]0x80	! Mem[0000000010041400] = 0000fbff 0000ffff
!	%l6 = ffffffffda009780, Mem[0000000030081410] = ff000000
	stba	%l6,[%i2+%o5]0x89	! Mem[0000000030081410] = ff000080
!	%f13 = 97800000, Mem[0000000010141400] = ff0025d9
	sta	%f13,[%i5+%g0]0x80	! Mem[0000000010141400] = 97800000
!	%l3 = 000000000000007e, Mem[00000000100c1418] = 00ff00ff00009780
	stx	%l3,[%i3+0x018]		! Mem[00000000100c1418] = 000000000000007e
!	%l2 = 00000031, %l3 = 0000007e, Mem[0000000010101400] = 97000000 00000000
	stda	%l2,[%i4+%g0]0x80	! Mem[0000000010101400] = 00000031 0000007e
!	%f6  = 44a491d7 ffa64a31, Mem[00000000300c1410] = ffff0000 00000000
	stda	%f6 ,[%i3+%o5]0x81	! Mem[00000000300c1410] = 44a491d7 ffa64a31
!	%l0 = 000000000000fbff, Mem[0000000030041410] = 000000ff
	stha	%l0,[%i1+%o5]0x89	! Mem[0000000030041410] = 0000fbff

p0_label_382:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = 0000fbff0000ffff, %f14 = 0000ff00 000000ff
	ldda	[%i1+%g0]0x80,%f14	! %f14 = 0000fbff 0000ffff
!	%l5 = 000000000000001d, %l7 = 0000000000000000, %l0 = 000000000000fbff
	add	%l5,%l7,%l0		! %l0 = 000000000000001d
!	Mem[00000000100c142f] = ffffffff, %l7 = 0000000000000000, %asi = 80
	ldsba	[%i3+0x02f]%asi,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000030041400] = 00000000 00000031, %l0 = 0000001d, %l1 = 0000ffff
	ldda	[%i1+%g0]0x81,%l0	! %l0 = 0000000000000000 0000000000000031
!	%f26 = 6b97140b 000000ff, Mem[0000000030001408] = ff0000ff 00000000
	stda	%f26,[%i0+%o4]0x81	! Mem[0000000030001408] = 6b97140b 000000ff
!	Mem[0000000010081410] = ff000000, %l6 = ffffffffda009780
	lduha	[%i2+%o5]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000010041408] = 314aa6da, %l0 = 0000000000000000
	lduwa	[%i1+%o4]0x80,%l0	! %l0 = 00000000314aa6da
!	Mem[00000000201c0000] = 0031e880, %l0 = 00000000314aa6da, %asi = 80
	ldsha	[%o0+0x000]%asi,%l0	! %l0 = 0000000000000031
!	Mem[00000000100c1400] = 00000000, %l2 = 0000000000000031
	lduha	[%i3+%g0]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000020800000] = 000042b0, %l3 = 000000000000007e
	lduh	[%o1+%g0],%l3		! %l3 = 0000000000000000

p0_label_383:
!	Starting 10 instruction Store Burst
!	%f10 = 000000aa, Mem[0000000010001400] = ff0000ff
	sta	%f10,[%i0+%g0]0x80	! Mem[0000000010001400] = 000000aa
!	%l6 = 00000000, %l7 = ffffffff, Mem[0000000010001408] = 2ca93559 dbffffff
	stda	%l6,[%i0+%o4]0x88	! Mem[0000000010001408] = 00000000 ffffffff
!	%f17 = 12e60000, Mem[0000000010141400] = 00008097
	sta	%f17,[%i5+%g0]0x88	! Mem[0000000010141400] = 12e60000
!	%l2 = 0000000000000000, Mem[00000000201c0000] = 0031e880
	sth	%l2,[%o0+%g0]		! Mem[00000000201c0000] = 0000e880
!	Mem[0000000010141400] = 12e60000, %l7 = ffffffffffffffff
	ldstuba	[%i5+%g0]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000010041408] = daa64a31, %l4 = 00000000000000ff
	swapa	[%i1+%o4]0x88,%l4	! %l4 = 00000000daa64a31
!	%l4 = 00000000daa64a31, Mem[00000000100c1408] = 000000ff
	stha	%l4,[%i3+%o4]0x80	! Mem[00000000100c1408] = 4a3100ff
!	Mem[00000000100c140b] = 4a3100ff, %l6 = 0000000000000000
	ldstub	[%i3+0x00b],%l6		! %l6 = 00000000000000ff
!	%l4 = 00000000daa64a31, Mem[0000000010041400] = fffb0000
	stwa	%l4,[%i1+%g0]0x88	! Mem[0000000010041400] = daa64a31
!	%l3 = 0000000000000000, Mem[0000000010081400] = ff000000
	stba	%l3,[%i2+%g0]0x80	! Mem[0000000010081400] = 00000000

p0_label_384:
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = 000000ff, %l2 = 0000000000000000
	ldswa	[%i5+%o4]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[000000001008142c] = 00000000, %l4 = 00000000daa64a31, %asi = 80
	lduwa	[%i2+0x02c]%asi,%l4	! %l4 = 0000000000000000
!	Mem[0000000010101410] = 00ffffff, %l7 = 0000000000000000
	ldsba	[%i4+%o5]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000010181408] = 00000054, %l1 = 0000000000000031
	ldswa	[%i6+%o4]0x88,%l1	! %l1 = 0000000000000054
!	Mem[000000001014143c] = ffffffff, %f17 = 12e60000
	ld	[%i5+0x03c],%f17	! %f17 = ffffffff
!	Mem[0000000030081410] = 800000ff, %f20 = 97ff6b00
	lda	[%i2+%o5]0x81,%f20	! %f20 = 800000ff
!	Mem[0000000030001400] = ff000000, %l4 = 0000000000000000
	ldsba	[%i0+%g0]0x81,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010001418] = 314aa6da, %l4 = ffffffffffffffff
	ldub	[%i0+0x018],%l4		! %l4 = 0000000000000031
!	Mem[0000000030101400] = 54fb76ff, %l4 = 0000000000000031
	ldsba	[%i4+%g0]0x81,%l4	! %l4 = 0000000000000054
!	Mem[0000000030141410] = da009780, %l3 = 0000000000000000
	lduha	[%i5+%o5]0x89,%l3	! %l3 = 0000000000009780

p0_label_385:
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1400] = ffffffff, %l2 = 00000000000000ff
	ldstuba	[%i3+%g0]0x89,%l2	! %l2 = 00000000000000ff
!	%l2 = 00000000000000ff, Mem[0000000030141400] = ff000000ffff6b97
	stxa	%l2,[%i5+%g0]0x89	! Mem[0000000030141400] = 00000000000000ff
!	Mem[0000000010141400] = 12e600ff, %l0 = 0000000000000031
	swapa	[%i5+%g0]0x88,%l0	! %l0 = 0000000012e600ff
!	%f22 = 0b14976b 70b87b43, Mem[0000000010041408] = 000000ff 437bb870
	stda	%f22,[%i1+%o4]0x88	! Mem[0000000010041408] = 0b14976b 70b87b43
!	%l4 = 0000000000000054, Mem[0000000010041410] = 006bff97
	stba	%l4,[%i1+%o5]0x88	! Mem[0000000010041410] = 006bff54
!	%f16 = 7e000000 ffffffff, %l5 = 000000000000001d
!	Mem[0000000030141428] = 000000ff00009780
	add	%i5,0x028,%g1
	stda	%f16,[%g1+%l5]ASI_PST32_S ! Mem[0000000030141428] = 000000ffffffffff
!	%l7 = 0000000000000000, Mem[0000000030041410] = fffb0000
	stba	%l7,[%i1+%o5]0x81	! Mem[0000000030041410] = 00fb0000
!	Mem[0000000010041400] = 314aa6da 0000ffff 437bb870 6b97140b
!	%f16 = 7e000000 ffffffff 314aa6da 70b87b43
!	%f20 = 800000ff daa64a31 0b14976b 70b87b43
!	%f24 = dbffffff c5acff6b 6b97140b 000000ff
!	%f28 = 97809b06 00000000 d92500ff 587464ff
	stda	%f16,[%i1+%g0]ASI_BLK_P	! Block Store to 0000000010041400
!	%f23 = 70b87b43, Mem[00000000300c1400] = ffffffff
	sta	%f23,[%i3+%g0]0x89	! Mem[00000000300c1400] = 70b87b43
!	Mem[00000000211c0001] = 00ff6b10, %l3 = 0000000000009780
	ldstuba	[%o2+0x001]%asi,%l3	! %l3 = 00000000000000ff

p0_label_386:
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = 1d0000ff, %l1 = 0000000000000054
	ldsha	[%i1+%o4]0x81,%l1	! %l1 = 0000000000001d00
!	Mem[0000000010141410] = ff000000 54000000, %l6 = 000000ff, %l7 = 00000000
	ldda	[%i5+%o5]0x88,%l6	! %l6 = 0000000054000000 00000000ff000000
!	Mem[0000000010141434] = 97800000, %l3 = 00000000000000ff
	ldsh	[%i5+0x034],%l3		! %l3 = ffffffffffff9780
!	Mem[0000000010101408] = fffb0000, %l1 = 0000000000001d00
	ldsba	[%i4+%o4]0x80,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010141410] = ff000000 54000000, %l0 = 12e600ff, %l1 = ffffffff
	ldda	[%i5+%o5]0x88,%l0	! %l0 = 0000000054000000 00000000ff000000
!	Mem[00000000300c1408] = 00005b0f00000080, %f10 = 000000aa 000000da
	ldda	[%i3+%o4]0x81,%f10	! %f10 = 00005b0f 00000080
!	Mem[0000000020800041] = ffff18e0, %l3 = ffffffffffff9780, %asi = 80
	ldsba	[%o1+0x041]%asi,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010141400] = 9700000000000031, %f14 = 0000fbff 0000ffff
	ldda	[%i5+%g0]0x88,%f14	! %f14 = 97000000 00000031
!	Mem[00000000100c1400] = 000000ff00000000, %l3 = ffffffffffffffff
	ldxa	[%i3+%g0]0x88,%l3	! %l3 = 000000ff00000000
!	Mem[00000000100c1400] = 00000000, %l4 = 0000000000000054
	ldsw	[%i3+%g0],%l4		! %l4 = 0000000000000000

p0_label_387:
!	Starting 10 instruction Store Burst
!	%f0  = ff3d0000 00000097, Mem[0000000010041408] = daa64a31 437bb870
	stda	%f0 ,[%i1+%o4]0x88	! Mem[0000000010041408] = ff3d0000 00000097
!	%f30 = d92500ff 587464ff, %l1 = 00000000ff000000
!	Mem[0000000030081408] = ff0000ffff000000
	add	%i2,0x008,%g1
	stda	%f30,[%g1+%l1]ASI_PST16_S ! Mem[0000000030081408] = ff0000ffff000000
!	%f2  = 000000ff f599a7b5, Mem[0000000010001408] = 00000000 ffffffff
	stda	%f2 ,[%i0+%o4]0x88	! Mem[0000000010001408] = 000000ff f599a7b5
!	%f20 = 800000ff daa64a31, Mem[0000000030181410] = 70b87b43 5b0fe295
	stda	%f20,[%i6+%o5]0x81	! Mem[0000000030181410] = 800000ff daa64a31
!	%l7 = 00000000ff000000, Mem[0000000030101408] = 000000ff
	stwa	%l7,[%i4+%o4]0x89	! Mem[0000000030101408] = ff000000
!	%l0 = 0000000054000000, Mem[0000000010101400] = 00000031
	stba	%l0,[%i4+%g0]0x80	! Mem[0000000010101400] = 00000031
!	%f4  = 80970000 3f800000, Mem[0000000030001410] = 54000000 00009780
	stda	%f4 ,[%i0+%o5]0x81	! Mem[0000000030001410] = 80970000 3f800000
!	Mem[0000000030081400] = ff800000, %l5 = 000000000000001d
	ldstuba	[%i2+%g0]0x89,%l5	! %l5 = 0000000000000000
!	%l3 = 000000ff00000000, Mem[0000000010181436] = ff000000, %asi = 80
	stba	%l3,[%i6+0x036]%asi	! Mem[0000000010181434] = ff000000
!	%f0  = ff3d0000 00000097, Mem[0000000030101400] = ff76fb54 000000ff
	stda	%f0 ,[%i4+%g0]0x89	! Mem[0000000030101400] = ff3d0000 00000097

p0_label_388:
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = 31000000da000000, %f6  = 44a491d7 ffa64a31
	ldda	[%i6+%g0]0x81,%f6 	! %f6  = 31000000 da000000
!	Mem[0000000010081400] = 00000000, %l3 = 000000ff00000000
	ldsba	[%i2+%g0]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000010001410] = 00000031da000000, %l3 = 0000000000000000
	ldxa	[%i0+%o5]0x80,%l3	! %l3 = 00000031da000000
!	Mem[0000000030181410] = 314aa6da ff000080, %l6 = 54000000, %l7 = ff000000
	ldda	[%i6+%o5]0x89,%l6	! %l6 = 00000000ff000080 00000000314aa6da
!	Mem[0000000010141406] = 00000097, %l1 = 00000000ff000000, %asi = 80
	ldsha	[%i5+0x006]%asi,%l1	! %l1 = 0000000000000097
!	Mem[00000000300c1400] = 437bb870 00000000, %l6 = ff000080, %l7 = 314aa6da
	ldda	[%i3+%g0]0x81,%l6	! %l6 = 00000000437bb870 0000000000000000
!	Mem[0000000030101410] = 3100000000000000, %l0 = 0000000054000000
	ldxa	[%i4+%o5]0x81,%l0	! %l0 = 3100000000000000
!	Mem[0000000030181408] = 54fb76ff, %l1 = 0000000000000097
	lduba	[%i6+%o4]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030081408] = 000000ff ff0000ff, %l0 = 00000000, %l1 = 000000ff
	ldda	[%i2+%o4]0x89,%l0	! %l0 = 00000000ff0000ff 00000000000000ff
!	%l7 = 0000000000000000, %l0 = 00000000ff0000ff, %l3 = 00000031da000000
	subc	%l7,%l0,%l3		! %l3 = ffffffff00ffff01

p0_label_389:
!	Starting 10 instruction Store Burst
!	%l0 = 00000000ff0000ff, Mem[0000000010141408] = 000000fff599a7b5
	stxa	%l0,[%i5+%o4]0x80	! Mem[0000000010141408] = 00000000ff0000ff
!	%f4  = 80970000, Mem[0000000030141410] = da009780
	sta	%f4 ,[%i5+%o5]0x89	! Mem[0000000030141410] = 80970000
!	%f21 = daa64a31, Mem[0000000030101408] = 000000ff
	sta	%f21,[%i4+%o4]0x81	! Mem[0000000030101408] = daa64a31
!	%l6 = 00000000437bb870, Mem[0000000010001400] = aa000000
	stha	%l6,[%i0+%g0]0x88	! Mem[0000000010001400] = aa00b870
!	Mem[0000000010101428] = 00000000, %l2 = 00000000000000ff
	swap	[%i4+0x028],%l2		! %l2 = 0000000000000000
!	%f10 = 00005b0f 00000080, %l7 = 0000000000000000
!	Mem[0000000030101428] = dba60000ffffffff
	add	%i4,0x028,%g1
	stda	%f10,[%g1+%l7]ASI_PST16_S ! Mem[0000000030101428] = dba60000ffffffff
!	%l0 = 00000000ff0000ff, imm = 000000000000064f, %l5 = 0000000000000000
	add	%l0,0x64f,%l5		! %l5 = 00000000ff00074e
!	Mem[0000000010101408] = fffb0000, %l0 = 00000000ff0000ff
	swapa	[%i4+%o4]0x80,%l0	! %l0 = 00000000fffb0000
!	%f20 = 800000ff daa64a31, Mem[0000000030001408] = 0b14976b ff000000
	stda	%f20,[%i0+%o4]0x89	! Mem[0000000030001408] = 800000ff daa64a31
!	%f12 = 6b97140b, Mem[00000000100c141c] = 0000007e
	st	%f12,[%i3+0x01c]	! Mem[00000000100c141c] = 6b97140b

p0_label_390:
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (77)
!	Mem[0000000010041408] = 97000000, %l4 = 0000000000000000, %asi = 80
	ldsha	[%i1+0x008]%asi,%l4	! %l4 = ffffffffffff9700
!	Mem[0000000010081408] = 0000fb5400000000, %f30 = d92500ff 587464ff
	ldda	[%i2+%o4]0x88,%f30	! %f30 = 0000fb54 00000000
!	Mem[0000000010101412] = 00ffffff, %l5 = 00000000ff00074e
	lduh	[%i4+0x012],%l5		! %l5 = 000000000000ffff
!	Mem[0000000010041408] = 97000000, %f29 = 00000000
	lda	[%i1+%o4]0x80,%f29	! %f29 = 97000000
!	Mem[0000000030081400] = da000000ff8000ff, %f26 = 6b97140b 000000ff
	ldda	[%i2+%g0]0x89,%f26	! %f26 = da000000 ff8000ff
!	Mem[0000000030141400] = 000000ff, %f10 = 00005b0f
	lda	[%i5+%g0]0x89,%f10	! %f10 = 000000ff
!	%l1 = 00000000000000ff, %l1 = 00000000000000ff, %l4 = ffffffffffff9700
	sdivx	%l1,%l1,%l4		! %l4 = 0000000000000001
!	Mem[0000000030041410] = 00fb000000000000, %f22 = 0b14976b 70b87b43
	ldda	[%i1+%o5]0x81,%f22	! %f22 = 00fb0000 00000000
!	Mem[0000000010041408] = 97000000 00003dff, %l6 = 437bb870, %l7 = 00000000
	ldda	[%i1+%o4]0x80,%l6	! %l6 = 0000000097000000 0000000000003dff
!	Mem[0000000010001432] = 069b8097, %l6 = 0000000097000000, %asi = 80
	lduha	[%i0+0x032]%asi,%l6	! %l6 = 0000000000008097

p0_label_391:
!	Starting 10 instruction Store Burst
!	%l7 = 0000000000003dff, Mem[0000000010001430] = 069b8097
	stw	%l7,[%i0+0x030]		! Mem[0000000010001430] = 00003dff
!	Mem[0000000030181410] = 800000ff, %l3 = ffffffff00ffff01
	ldstuba	[%i6+%o5]0x81,%l3	! %l3 = 0000000000000080
!	%f9  = 00000000, Mem[00000000100c1400] = 00000000
	sta	%f9 ,[%i3+%g0]0x80	! Mem[00000000100c1400] = 00000000
!	%l2 = 0000000000000000, Mem[0000000030041408] = ff00001d
	stha	%l2,[%i1+%o4]0x89	! Mem[0000000030041408] = ff000000
!	%l6 = 0000000000008097, Mem[0000000010041438] = d92500ff587464ff, %asi = 80
	stxa	%l6,[%i1+0x038]%asi	! Mem[0000000010041438] = 0000000000008097
!	%l4 = 0000000000000001, immd = fffffffffffffdf1, %l1  = 00000000000000ff
	mulx	%l4,-0x20f,%l1		! %l1 = fffffffffffffdf1
!	%l4 = 0000000000000001, %l2 = 0000000000000000, %l2 = 0000000000000000
	sdivx	%l4,%l2,%l2		! Div by zero, %l0 = 00000000fffb0028
!	Mem[0000000010081434] = ffff0000, %l1 = fffffdf1, %l3 = 00000080
	add	%i2,0x34,%g1
	casa	[%g1]0x80,%l1,%l3	! %l3 = 00000000ffff0000
!	%l4 = 0000000000000001, Mem[0000000010181408] = 00000054
	stwa	%l4,[%i6+%o4]0x88	! Mem[0000000010181408] = 00000001
!	Mem[0000000010181405] = ffff0000, %l2 = 0000000000000000
	ldstub	[%i6+0x005],%l2		! %l2 = 00000000000000ff

p0_label_392:
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = ff0000ff, %l5 = 000000000000ffff
	lduba	[%i2+%o4]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010081408] = 0000000054fb0000, %f6  = 31000000 da000000
	ldda	[%i2+%o4]0x80,%f6 	! %f6  = 00000000 54fb0000
!	Mem[0000000010041410] = ff000080, %l7 = 0000000000003dff
	lduwa	[%i1+%o5]0x88,%l7	! %l7 = 00000000ff000080
!	Mem[0000000010181410] = 00000000 0000ffff, %l6 = 00008097, %l7 = ff000080
	ldda	[%i6+%o5]0x88,%l6	! %l6 = 000000000000ffff 0000000000000000
!	Mem[00000000100c1408] = 4a3100ff, %l5 = 00000000000000ff
	lduwa	[%i3+%o4]0x80,%l5	! %l5 = 000000004a3100ff
!	Mem[00000000300c1400] = 00000000 70b87b43, %l2 = 000000ff, %l3 = ffff0000
	ldda	[%i3+%g0]0x89,%l2	! %l2 = 0000000070b87b43 0000000000000000
!	Mem[00000000300c1408] = 00005b0f, %f17 = ffffffff
	lda	[%i3+%o4]0x81,%f17	! %f17 = 00005b0f
!	Mem[0000000010101400] = 00000031, %l7 = 0000000000000000
	lduba	[%i4+%g0]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000030181400] = 31000000, %l1 = fffffffffffffdf1
	lduha	[%i6+%g0]0x81,%l1	! %l1 = 0000000000003100
!	Mem[0000000030001410] = 809700003f800000, %l2 = 0000000070b87b43
	ldxa	[%i0+%o5]0x81,%l2	! %l2 = 809700003f800000

p0_label_393:
!	Starting 10 instruction Store Burst
!	%l6 = 000000000000ffff, Mem[0000000030001410] = 80970000
	stba	%l6,[%i0+%o5]0x81	! Mem[0000000030001410] = ff970000
!	%f0  = ff3d0000, Mem[0000000030181410] = ff0000ff
	sta	%f0 ,[%i6+%o5]0x81	! Mem[0000000030181410] = ff3d0000
!	%l7 = 0000000000000000, Mem[0000000010041400] = 7e000000
	stwa	%l7,[%i1+%g0]0x80	! Mem[0000000010041400] = 00000000
!	%l7 = 0000000000000000, Mem[0000000010001408] = b5a799f5ff000000
	stxa	%l7,[%i0+%o4]0x80	! Mem[0000000010001408] = 0000000000000000
!	%f7  = 54fb0000, Mem[00000000100c1430] = ff0000ff
	st	%f7 ,[%i3+0x030]	! Mem[00000000100c1430] = 54fb0000
!	%l1 = 0000000000003100, Mem[0000000010141410] = 00000054
	stba	%l1,[%i5+%o5]0x80	! Mem[0000000010141410] = 00000054
!	%l1 = 0000000000003100, Mem[0000000010181410] = ffff0000
	stha	%l1,[%i6+%o5]0x80	! Mem[0000000010181410] = 31000000
!	%l7 = 0000000000000000, Mem[00000000201c0000] = 0000e880, %asi = 80
	stha	%l7,[%o0+0x000]%asi	! Mem[00000000201c0000] = 0000e880
!	%l4 = 0000000000000001, Mem[0000000030001400] = 000000ff
	stba	%l4,[%i0+%g0]0x89	! Mem[0000000030001400] = 00000001
!	%l7 = 0000000000000000, Mem[00000000211c0001] = 00ff6b10, %asi = 80
	stba	%l7,[%o2+0x001]%asi	! Mem[00000000211c0000] = 00006b10

p0_label_394:
!	Starting 10 instruction Load Burst
!	Mem[000000001004140c] = 00003dff, %f12 = 6b97140b
	lda	[%i1+0x00c]%asi,%f12	! %f12 = 00003dff
!	Mem[0000000010101428] = 000000ff0000008d, %f6  = 00000000 54fb0000, %asi = 80
	ldda	[%i4+0x028]%asi,%f6 	! %f6  = 000000ff 0000008d
!	%f22 = 00fb0000, %f1  = 00000097, %f7  = 0000008d
	fdivs	%f22,%f1 ,%f7 		! tt=0x22, %l0 = 00000000fffb004a
!	%l6 = 000000000000ffff, imm = fffffffffffff978, %l0 = 00000000fffb004a
	or	%l6,-0x688,%l0		! %l0 = ffffffffffffffff
!	Mem[00000000100c1408] = 4a3100ff, %l1 = 0000000000003100
	ldsba	[%i3+%o4]0x80,%l1	! %l1 = 000000000000004a
!	Mem[0000000010101410] = 00ffffff, %l6 = 000000000000ffff, %asi = 80
	lduwa	[%i4+0x010]%asi,%l6	! %l6 = 0000000000ffffff
!	Mem[0000000010101408] = ff0000ff, %l4 = 0000000000000001
	ldswa	[%i4+%o4]0x80,%l4	! %l4 = ffffffffff0000ff
!	Mem[0000000010081434] = ffff0000, %f12 = 00003dff
	ld	[%i2+0x034],%f12	! %f12 = ffff0000
!	Mem[0000000010141408] = 00000000, %l4 = ffffffffff0000ff
	lduwa	[%i5+%o4]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000030101400] = 97000000, %f23 = 00000000
	lda	[%i4+%g0]0x81,%f23	! %f23 = 97000000

p0_label_395:
!	Starting 10 instruction Store Burst
!	%l5 = 000000004a3100ff, Mem[0000000010101410] = 00ffffff
	sth	%l5,[%i4+%o5]		! Mem[0000000010101410] = 00ffffff
!	%l6 = 0000000000ffffff, Mem[0000000021800100] = ffff4a00
	sth	%l6,[%o3+0x100]		! Mem[0000000021800100] = ffff4a00
!	%f20 = 800000ff, Mem[00000000100c1400] = 00000000
	sta	%f20,[%i3+0x000]%asi	! Mem[00000000100c1400] = 800000ff
!	%f7  = 0000008d, Mem[0000000030141400] = ff000000
	sta	%f7 ,[%i5+%g0]0x81	! Mem[0000000030141400] = 0000008d
!	Mem[0000000010101438] = 00ff0000000000db, %f30 = 0000fb54 00000000, %asi = 80
	ldda	[%i4+0x038]%asi,%f30	! %f30 = 00ff0000 000000db
!	Mem[0000000010001400] = 70b800aa, %l0 = 00000000ffffffff
	swapa	[%i0+%g0]0x80,%l0	! %l0 = 0000000070b800aa
!	%f16 = 7e000000 00005b0f, Mem[0000000030181410] = 00003dff 314aa6da
	stda	%f16,[%i6+%o5]0x89	! Mem[0000000030181410] = 7e000000 00005b0f
!	%l0 = 0000000070b800aa, Mem[00000000100c1420] = 0000000000000000, %asi = 80
	stxa	%l0,[%i3+0x020]%asi	! Mem[00000000100c1420] = 0000000070b800aa
!	%f4  = 80970000 3f800000, %l4 = 0000000000000000
!	Mem[0000000010101438] = 00ff0000000000db
	add	%i4,0x038,%g1
	stda	%f4,[%g1+%l4]ASI_PST32_PL ! Mem[0000000010101438] = 00ff0000000000db
!	%l6 = 0000000000ffffff, Mem[0000000010181400] = ff000000
	stha	%l6,[%i6+%g0]0x80	! Mem[0000000010181400] = ffff0000

p0_label_396:
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = ff970000, %l5 = 000000004a3100ff
	lduba	[%i0+%o5]0x81,%l5	! %l5 = 00000000000000ff
!	Mem[00000000300c1400] = 437bb870, %l6 = 0000000000ffffff
	lduba	[%i3+%g0]0x81,%l6	! %l6 = 0000000000000043
!	Mem[0000000030101408] = 314aa6da, %l0 = 0000000070b800aa
	ldswa	[%i4+%o4]0x89,%l0	! %l0 = 00000000314aa6da
!	%l7 = 0000000000000000, Mem[0000000030141400] = 000000008d000000
	stxa	%l7,[%i5+%g0]0x89	! Mem[0000000030141400] = 0000000000000000
!	%l6 = 0000000000000043, %l7 = 0000000000000000, %l7 = 0000000000000000
	or	%l6,%l7,%l7		! %l7 = 0000000000000043
!	Mem[0000000030181410] = 0f5b00000000007e, %l5 = 00000000000000ff
	ldxa	[%i6+%o5]0x81,%l5	! %l5 = 0f5b00000000007e
!	Mem[000000001010141b] = 00ff00ff, %l2 = 809700003f800000, %asi = 80
	lduba	[%i4+0x01b]%asi,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030001400] = 01000000 ff000000, %l0 = 314aa6da, %l1 = 0000004a
	ldda	[%i0+%g0]0x81,%l0	! %l0 = 0000000001000000 00000000ff000000
!	Mem[0000000020800000] = 000042b0, %l0 = 0000000001000000
	ldub	[%o1+%g0],%l0		! %l0 = 0000000000000000
!	%f10 = 000000ff, %f22 = 00fb0000, %f17 = 00005b0f
	fdivs	%f10,%f22,%f17		! tt=0x22, %l0 = 0000000000000022

p0_label_397:
!	Starting 10 instruction Store Burst
!	Mem[0000000010101408] = ff0000ff, %l2 = 00000000000000ff, %asi = 80
	swapa	[%i4+0x008]%asi,%l2	! %l2 = 00000000ff0000ff
!	%f26 = da000000 ff8000ff, Mem[0000000030001408] = 314aa6da ff000080
	stda	%f26,[%i0+%o4]0x81	! Mem[0000000030001408] = da000000 ff8000ff
!	%f22 = 00fb0000 97000000, Mem[0000000010001438] = 0a80ccb2 3ff082bb
	std	%f22,[%i0+0x038]	! Mem[0000000010001438] = 00fb0000 97000000
!	%l0 = 0000000000000022, Mem[0000000010001408] = 0000000000000000
	stxa	%l0,[%i0+%o4]0x88	! Mem[0000000010001408] = 0000000000000022
!	Mem[0000000010041400] = 00000000, %l0 = 0000000000000022
	ldstuba	[%i1+%g0]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000010101410] = 00ffffff, %l7 = 0000000000000043
	swapa	[%i4+%o5]0x80,%l7	! %l7 = 0000000000ffffff
!	Mem[0000000030001410] = 000097ff, %l4 = 0000000000000000
	ldstuba	[%i0+%o5]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010181400] = ffff0000, %l4 = 00000000000000ff
	ldstuba	[%i6+%g0]0x80,%l4	! %l4 = 00000000000000ff
!	%l7 = 0000000000ffffff, %l2 = 00000000ff0000ff, %y  = ff0000ff
	umul	%l7,%l2,%l1		! %l1 = 00feffffffffff01, %y = 00feffff
!	%l7 = 0000000000ffffff, Mem[00000000211c0000] = 00006b10, %asi = 80
	stha	%l7,[%o2+0x000]%asi	! Mem[00000000211c0000] = ffff6b10

p0_label_398:
!	Starting 10 instruction Load Burst
!	Mem[000000001014140a] = 00000000, %l4 = 00000000000000ff, %asi = 80
	lduha	[%i5+0x00a]%asi,%l4	! %l4 = 0000000000000000
!	Mem[0000000010181408] = 01000000, %l2 = 00000000ff0000ff
	ldsha	[%i6+%o4]0x80,%l2	! %l2 = 0000000000000100
!	Mem[0000000010101430] = 0000000000000000, %f18 = 314aa6da 70b87b43, %asi = 80
	ldda	[%i4+0x030]%asi,%f18	! %f18 = 00000000 00000000
!	Mem[0000000030081400] = ff8000ff, %l5 = 0f5b00000000007e
	ldsha	[%i2+%g0]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010101400] = 00000031, %l0 = 0000000000000000
	lduwa	[%i4+%g0]0x80,%l0	! %l0 = 0000000000000031
!	Mem[0000000010001410] = 00000031, %l6 = 0000000000000043
	lduba	[%i0+%o5]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000010141400] = 31000000 00000097, %l4 = 00000000, %l5 = 000000ff
	ldda	[%i5+%g0]0x80,%l4	! %l4 = 0000000031000000 0000000000000097
!	Mem[00000000300c1408] = 0f5b0000, %l3 = 0000000000000000
	ldswa	[%i3+%o4]0x89,%l3	! %l3 = 000000000f5b0000
!	Mem[0000000030001410] = ff970000, %l4 = 0000000031000000
	lduwa	[%i0+%o5]0x81,%l4	! %l4 = 00000000ff970000
!	Mem[0000000010101408] = 437bb870ff000000, %f16 = 7e000000 00005b0f
	ldda	[%i4+%o4]0x88,%f16	! %f16 = 437bb870 ff000000

p0_label_399:
!	Starting 10 instruction Store Burst
!	%f0  = ff3d0000, %f1  = 00000097
	fsqrts	%f0 ,%f1 		! %f1  = 7fffffff
!	%f27 = ff8000ff, %f6  = 000000ff, %f0  = ff3d0000
	fsubs	%f27,%f6 ,%f0 		! %f0  = ffc000ff
!	%l2 = 0000000000000100, %l4 = 00000000ff970000, %l3 = 000000000f5b0000
	addc	%l2,%l4,%l3		! %l3 = 00000000ff970100
!	%l5 = 0000000000000097, Mem[0000000030101400] = 97000000
	stha	%l5,[%i4+%g0]0x81	! Mem[0000000030101400] = 00970000
!	%f3  = f599a7b5, Mem[0000000010181430] = ff0000ff
	st	%f3 ,[%i6+0x030]	! Mem[0000000010181430] = f599a7b5
!	%l4 = 00000000ff970000, Mem[0000000030081410] = 800000ff
	stwa	%l4,[%i2+%o5]0x81	! Mem[0000000030081410] = ff970000
!	Mem[00000000100c1410] = ff00007e, %l3 = 00000000ff970100
	ldstuba	[%i3+%o5]0x80,%l3	! %l3 = 00000000000000ff
!	%l3 = 00000000000000ff, Mem[00000000100c1438] = 63ad6ddf
	stb	%l3,[%i3+0x038]		! Mem[00000000100c1438] = ffad6ddf
!	%l6 = 0000000000000000, Mem[00000000218001c0] = 00006c90
	sth	%l6,[%o3+0x1c0]		! Mem[00000000218001c0] = 00006c90
!	%f25 = c5acff6b, Mem[0000000010041400] = ff000000
	sta	%f25,[%i1+%g0]0x80	! Mem[0000000010041400] = c5acff6b

p0_label_400:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181430] = f599a7b5 ff000000, %l6 = 00000000, %l7 = 00ffffff
	ldd	[%i6+0x030],%l6		! %l6 = 00000000f599a7b5 00000000ff000000
!	Mem[0000000010181400] = 0000ffff, %l3 = 00000000000000ff
	ldsba	[%i6+%g0]0x88,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010101430] = 00000000, %f5  = 3f800000
	ld	[%i4+0x030],%f5 	! %f5 = 00000000
!	Mem[0000000020800040] = ffff18e0, %l3 = ffffffffffffffff
	lduh	[%o1+0x040],%l3		! %l3 = 000000000000ffff
!	Mem[0000000010101400] = 31000000, %l6 = 00000000f599a7b5
	lduwa	[%i4+%g0]0x88,%l6	! %l6 = 0000000031000000
!	Mem[00000000100c1410] = 000000ff7e0000ff, %f10 = 000000ff 00000080
	ldda	[%i3+%o5]0x88,%f10	! %f10 = 000000ff 7e0000ff
!	Mem[0000000030101410] = 0000000000000031, %l6 = 0000000031000000
	ldxa	[%i4+%o5]0x89,%l6	! %l6 = 0000000000000031
!	Mem[0000000010141408] = 00000000, %l4 = 00000000ff970000
	ldsha	[%i5+%o4]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000030041400] = 00000000, %f9  = 00000000
	lda	[%i1+%g0]0x81,%f9 	! %f9 = 00000000
!	Mem[0000000010001438] = 00fb0000, %l3 = 000000000000ffff, %asi = 80
	lduwa	[%i0+0x038]%asi,%l3	! %l3 = 0000000000fb0000

p0_label_401:
!	Starting 10 instruction Store Burst
!	Mem[0000000010141400] = 00000031, %l1 = 00feffffffffff01
	ldstuba	[%i5+%g0]0x88,%l1	! %l1 = 0000000000000031
!	%l2 = 0000000000000100, Mem[000000001008140c] = 54fb0000, %asi = 80
	stwa	%l2,[%i2+0x00c]%asi	! Mem[000000001008140c] = 00000100
!	Mem[0000000010141408] = 00000000, %l3 = 0000000000fb0000
	swapa	[%i5+%o4]0x88,%l3	! %l3 = 0000000000000000
!	Mem[00000000100c1410] = ff00007eff000000, %l6 = 0000000000000031, %l4 = 0000000000000000
	add	%i3,0x10,%g1
	casxa	[%g1]0x80,%l6,%l4	! %l4 = ff00007eff000000
!	%f20 = 800000ff daa64a31, Mem[0000000010041410] = ff000080 314aa6da
	stda	%f20,[%i1+%o5]0x88	! Mem[0000000010041410] = 800000ff daa64a31
!	%l1 = 0000000000000031, Mem[0000000030081410] = 54000000000097ff
	stxa	%l1,[%i2+%o5]0x89	! Mem[0000000030081410] = 0000000000000031
!	%l0 = 00000031, %l1 = 00000031, Mem[0000000030181410] = 00005b0f 7e000000
	stda	%l0,[%i6+%o5]0x89	! Mem[0000000030181410] = 00000031 00000031
!	%l1 = 0000000000000031, Mem[0000000010081410] = 000000ff
	stha	%l1,[%i2+%o5]0x80	! Mem[0000000010081410] = 003100ff
!	Mem[0000000010041413] = 314aa6da, %l2 = 0000000000000100
	ldstuba	[%i1+0x013]%asi,%l2	! %l2 = 00000000000000da
!	Mem[0000000030181400] = 31000000, %l5 = 0000000000000097
	ldstuba	[%i6+%g0]0x81,%l5	! %l5 = 0000000000000031

p0_label_402:
!	Starting 10 instruction Load Burst
!	Mem[000000001014140c] = ff0000ff, %l5 = 0000000000000031
	ldsh	[%i5+0x00c],%l5		! %l5 = ffffffffffffff00
!	Code Fragment 4, seed = 810430
p0_fragment_39:
!	%l0 = 0000000000000031
	setx	0xf6d9783c9754a836,%g7,%l0 ! %l0 = f6d9783c9754a836
!	%l1 = 0000000000000031
	setx	0x573230eb12811f61,%g7,%l1 ! %l1 = 573230eb12811f61
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = f6d9783c9754a836
	setx	0x411e085178b38a9c,%g7,%l0 ! %l0 = 411e085178b38a9c
!	%l1 = 573230eb12811f61
	setx	0x55a30f8cc926ece7,%g7,%l1 ! %l1 = 55a30f8cc926ece7
p0_fragment_39_end:
!	Mem[0000000010001408] = 2200000000000000, %l2 = 00000000000000da
	ldx	[%i0+%o4],%l2		! %l2 = 2200000000000000
!	Mem[0000000010081410] = 003100ff97ff6b00, %l7 = 00000000ff000000
	ldxa	[%i2+%o5]0x80,%l7	! %l7 = 003100ff97ff6b00
!	Mem[0000000010041410] = ffa64a31, %l3 = 0000000000000000
	ldswa	[%i1+%o5]0x88,%l3	! %l3 = ffffffffffa64a31
!	Mem[00000000300c1400] = 0000000070b87b43, %l3 = ffffffffffa64a31
	ldxa	[%i3+%g0]0x89,%l3	! %l3 = 0000000070b87b43
!	Mem[0000000010041400] = 6bffacc5, %l5 = ffffffffffffff00
	lduwa	[%i1+%g0]0x88,%l5	! %l5 = 000000006bffacc5
!	Mem[0000000010041400] = 6bffacc5, %l7 = 003100ff97ff6b00
	ldsha	[%i1+%g0]0x88,%l7	! %l7 = ffffffffffffacc5
!	Mem[0000000010041408] = 97000000, %l5 = 000000006bffacc5
	lduwa	[%i1+%o4]0x80,%l5	! %l5 = 0000000097000000
!	Mem[0000000010041410] = 314aa6ff, %l3 = 0000000070b87b43
	lduwa	[%i1+%o5]0x80,%l3	! %l3 = 00000000314aa6ff

p0_label_403:
!	Starting 10 instruction Store Burst
!	%f10 = 000000ff, Mem[0000000010081408] = 00000000
	sta	%f10,[%i2+%o4]0x80	! Mem[0000000010081408] = 000000ff
!	Mem[0000000030081400] = ff8000ff, %l4 = 00000000ff000000
	swapa	[%i2+%g0]0x89,%l4	! %l4 = 00000000ff8000ff
!	Mem[0000000010101410] = 00000043, %l2 = 0000000000000000
	swapa	[%i4+%o5]0x80,%l2	! %l2 = 0000000000000043
!	Mem[0000000010081418] = 437bb870daa64a31, %l5 = 0000000097000000, %l7 = ffffffffffffacc5
	add	%i2,0x18,%g1
	casxa	[%g1]0x80,%l5,%l7	! %l7 = 437bb870daa64a31
!	Mem[000000001018140d] = ff000000, %l2 = 0000000000000043
	ldstub	[%i6+0x00d],%l2		! %l2 = 0000000000000000
!	Mem[0000000010001408] = 22000000, %l7 = 437bb870daa64a31
	ldstuba	[%i0+%o4]0x80,%l7	! %l7 = 0000000000000022
!	Mem[0000000010041430] = 97809b06, %l3 = 00000000314aa6ff
	swap	[%i1+0x030],%l3		! %l3 = 0000000097809b06
!	%l6 = 00000031, %l7 = 00000022, Mem[0000000010081410] = ff003100 006bff97
	stda	%l6,[%i2+%o5]0x88	! Mem[0000000010081410] = 00000031 00000022
!	Code Fragment 3, seed = 628799
p0_fragment_40:
!	%l0 = 411e085178b38a9c
	setx	0x389f38696412252e,%g7,%l0 ! %l0 = 389f38696412252e
!	%l1 = 55a30f8cc926ece7
	setx	0xb131130b2e436ad9,%g7,%l1 ! %l1 = b131130b2e436ad9
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 389f38696412252e
	setx	0x8e29e773af635c94,%g7,%l0 ! %l0 = 8e29e773af635c94
!	%l1 = b131130b2e436ad9
	setx	0xe9b11a62daaf7d5f,%g7,%l1 ! %l1 = e9b11a62daaf7d5f
p0_fragment_40_end:
!	%l7 = 0000000000000022, Mem[0000000010081424] = 68a8f31d, %asi = 80
	stwa	%l7,[%i2+0x024]%asi	! Mem[0000000010081424] = 00000022

p0_label_404:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = 6bffacc5, %l7 = 0000000000000022
	lduba	[%i1+%g0]0x88,%l7	! %l7 = 00000000000000c5
!	Mem[0000000020800041] = ffff18e0, %l3 = 0000000097809b06, %asi = 80
	lduba	[%o1+0x041]%asi,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010141408] = 0000fb00 ff0000ff, %l6 = 00000031, %l7 = 000000c5
	ldd	[%i5+%o4],%l6		! %l6 = 000000000000fb00 00000000ff0000ff
!	Code Fragment 4, seed = 888928
p0_fragment_41:
!	%l0 = 8e29e773af635c94
	setx	0xafce29f2b3e95526,%g7,%l0 ! %l0 = afce29f2b3e95526
!	%l1 = e9b11a62daaf7d5f
	setx	0x61330471aa2cf951,%g7,%l1 ! %l1 = 61330471aa2cf951
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = afce29f2b3e95526
	setx	0xda71faaed113018c,%g7,%l0 ! %l0 = da71faaed113018c
!	%l1 = 61330471aa2cf951
	setx	0x3369c099c1eb70d7,%g7,%l1 ! %l1 = 3369c099c1eb70d7
p0_fragment_41_end:
!	Mem[00000000300c1400] = 70b87b43, %l5 = 0000000097000000
	ldswa	[%i3+%g0]0x89,%l5	! %l5 = 0000000070b87b43
!	Mem[00000000201c0000] = 0000e880, %l1 = 3369c099c1eb70d7, %asi = 80
	ldsha	[%o0+0x000]%asi,%l1	! %l1 = 0000000000000000
!	Mem[0000000010041430] = 314aa6ff00000000, %l6 = 000000000000fb00, %asi = 80
	ldxa	[%i1+0x030]%asi,%l6	! %l6 = 314aa6ff00000000
!	Mem[0000000010181400] = ffff0000 ffff0000, %l0 = d113018c, %l1 = 00000000
	ldd	[%i6+%g0],%l0		! %l0 = 00000000ffff0000 00000000ffff0000
!	Mem[00000000100c1408] = ff00314a, %f15 = 00000031
	lda	[%i3+%o4]0x88,%f15	! %f15 = ff00314a
!	Mem[0000000030101400] = 00009700, %l1 = 00000000ffff0000
	lduba	[%i4+%g0]0x89,%l1	! %l1 = 0000000000000000

p0_label_405:
!	Starting 10 instruction Store Burst
!	%f20 = 800000ff daa64a31, Mem[0000000030081400] = ff000000 da000000
	stda	%f20,[%i2+%g0]0x89	! Mem[0000000030081400] = 800000ff daa64a31
!	Mem[00000000100c1438] = ffad6ddfff800000, %l5 = 0000000070b87b43, %l0 = 00000000ffff0000
	add	%i3,0x38,%g1
	casxa	[%g1]0x80,%l5,%l0	! %l0 = ffad6ddfff800000
!	Code Fragment 3, seed = 503415
p0_fragment_42:
!	%l0 = ffad6ddfff800000
	setx	0x4d3039fd36252b6e,%g7,%l0 ! %l0 = 4d3039fd36252b6e
!	%l1 = 0000000000000000
	setx	0xb640ca4e25149d19,%g7,%l1 ! %l1 = b640ca4e25149d19
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 4d3039fd36252b6e
	setx	0x89ef6faa2b0afad4,%g7,%l0 ! %l0 = 89ef6faa2b0afad4
!	%l1 = b640ca4e25149d19
	setx	0xaf4d4b3754d1c79f,%g7,%l1 ! %l1 = af4d4b3754d1c79f
p0_fragment_42_end:
!	%f0  = ffc000ff, %f7  = 0000008d, %f2  = 000000ff f599a7b5
	fsmuld	%f0 ,%f7 ,%f2 		! %f2  = fff8001f e0000000
!	%l5 = 0000000070b87b43, Mem[0000000010081408] = ff000000
	stwa	%l5,[%i2+%o4]0x88	! Mem[0000000010081408] = 70b87b43
!	%l1 = af4d4b3754d1c79f, Mem[0000000010141408] = 0000fb00ff0000ff
	stxa	%l1,[%i5+%o4]0x80	! Mem[0000000010141408] = af4d4b3754d1c79f
!	Mem[0000000020800001] = 000042b0, %l4 = 00000000ff8000ff
	ldstub	[%o1+0x001],%l4		! %l4 = 0000000000000000
!	Mem[0000000021800181] = 65ff3a60, %l1 = af4d4b3754d1c79f
	ldstuba	[%o3+0x181]%asi,%l1	! %l1 = 00000000000000ff
!	%f11 = 7e0000ff, Mem[0000000010081420] = 000080ff
	sta	%f11,[%i2+0x020]%asi	! Mem[0000000010081420] = 7e0000ff
!	Mem[0000000020800000] = 00ff42b0, %l6 = 314aa6ff00000000
	ldstub	[%o1+%g0],%l6		! %l6 = 0000000000000000

p0_label_406:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = 00000054 000000ff, %l6 = 00000000, %l7 = ff0000ff, %asi = 80
	ldda	[%i5+0x010]%asi,%l6	! %l6 = 0000000000000054 00000000000000ff
!	Mem[00000000100c1408] = 54000000ff00314a, %l5 = 0000000070b87b43
	ldxa	[%i3+%o4]0x88,%l5	! %l5 = 54000000ff00314a
!	Mem[0000000010001408] = ff000000, %f26 = da000000
	lda	[%i0+%o4]0x80,%f26	! %f26 = ff000000
!	Mem[0000000030041410] = 00fb0000, %l6 = 0000000000000054
	lduba	[%i1+%o5]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000030101400] = 00009700, %l4 = 0000000000000000
	lduha	[%i4+%g0]0x89,%l4	! %l4 = 0000000000009700
!	Mem[0000000020800040] = ffff18e0, %l4 = 0000000000009700, %asi = 80
	lduba	[%o1+0x040]%asi,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010101400] = 31000000, %l2 = 0000000000000000
	ldswa	[%i4+%g0]0x88,%l2	! %l2 = 0000000031000000
!	Mem[00000000300c1400] = 437bb87000000000, %f6  = 000000ff 0000008d
	ldda	[%i3+%g0]0x81,%f6 	! %f6  = 437bb870 00000000
!	Mem[00000000211c0000] = ffff6b10, %l3 = 00000000000000ff, %asi = 80
	ldsha	[%o2+0x000]%asi,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000030041408] = 6bffacc5ff000000, %f20 = 800000ff daa64a31
	ldda	[%i1+%o4]0x89,%f20	! %f20 = 6bffacc5 ff000000

p0_label_407:
!	Starting 10 instruction Store Burst
!	%l4 = 000000ff, %l5 = ff00314a, Mem[0000000030101408] = daa64a31 00000000
	stda	%l4,[%i4+%o4]0x81	! Mem[0000000030101408] = 000000ff ff00314a
!	%l5 = 54000000ff00314a, Mem[00000000201c0001] = 0000e880, %asi = 80
	stba	%l5,[%o0+0x001]%asi	! Mem[00000000201c0000] = 004ae880
!	%l7 = 00000000000000ff, immd = 00000222, %y  = 00feffff
	udiv	%l7,0x222,%l3		! %l3 = 00000000ffffffff
	mov	%l0,%y			! %y = 2b0afad4
!	%l1 = 00000000000000ff, Mem[0000000020800001] = ffff42b0
	stb	%l1,[%o1+0x001]		! Mem[0000000020800000] = ffff42b0
!	Mem[0000000010101408] = ff000000, %l4 = 00000000000000ff
	ldstuba	[%i4+%o4]0x88,%l4	! %l4 = 0000000000000000
!	Mem[00000000100c142c] = ffffffff, %l1 = 00000000000000ff
	ldstub	[%i3+0x02c],%l1		! %l1 = 00000000000000ff
!	Mem[00000000201c0001] = 004ae880, %l4 = 0000000000000000
	ldstub	[%o0+0x001],%l4		! %l4 = 000000000000004a
!	%l3 = 00000000ffffffff, Mem[0000000030101408] = 000000ffff00314a
	stxa	%l3,[%i4+%o4]0x81	! Mem[0000000030101408] = 00000000ffffffff
!	%l0 = 2b0afad4, %l1 = 000000ff, Mem[0000000010101408] = ff0000ff 70b87b43
	stda	%l0,[%i4+%o4]0x80	! Mem[0000000010101408] = 2b0afad4 000000ff
!	Mem[000000001018141c] = 70b87b43, %l6 = 00000000, %l7 = 000000ff
	add	%i6,0x1c,%g1
	casa	[%g1]0x80,%l6,%l7	! %l7 = 0000000070b87b43

p0_label_408:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = 6bffacc5, %f18 = 00000000
	lda	[%i1+%g0]0x88,%f18	! %f18 = 6bffacc5
!	Mem[0000000030041410] = 00000000 0000fb00, %l6 = 00000000, %l7 = 70b87b43
	ldda	[%i1+%o5]0x89,%l6	! %l6 = 000000000000fb00 0000000000000000
!	Mem[0000000010141400] = 97000000000000ff, %f18 = 6bffacc5 00000000
	ldda	[%i5+%g0]0x88,%f18	! %f18 = 97000000 000000ff
!	%l7 = 0000000000000000, immd = 000000000000016d, %l5  = 54000000ff00314a
	mulx	%l7,0x16d,%l5		! %l5 = 0000000000000000
!	Mem[0000000010101408] = 2b0afad4, %l0 = 89ef6faa2b0afad4
	lduba	[%i4+%o4]0x80,%l0	! %l0 = 000000000000002b
!	Mem[0000000030081408] = ff0000ff ff000000, %l2 = 31000000, %l3 = ffffffff
	ldda	[%i2+%o4]0x81,%l2	! %l2 = 00000000ff0000ff 00000000ff000000
!	Mem[0000000030041400] = 00000000, %f0  = ffc000ff
	lda	[%i1+%g0]0x89,%f0 	! %f0 = 00000000
!	%l6 = 000000000000fb00, %l6 = 000000000000fb00, %y  = 2b0afad4
	udiv	%l6,%l6,%l7		! %l7 = 00000000ffffffff
	mov	%l0,%y			! %y = 0000002b
!	Mem[0000000010041400] = 6bffacc5, %l7 = 00000000ffffffff
	ldswa	[%i1+%g0]0x88,%l7	! %l7 = 000000006bffacc5
!	Mem[00000000100c1410] = 000000ff7e0000ff, %f18 = 97000000 000000ff
	ldda	[%i3+%o5]0x88,%f18	! %f18 = 000000ff 7e0000ff

p0_label_409:
!	Starting 10 instruction Store Burst
!	%l1 = 00000000000000ff, Mem[0000000030081410] = 00000031
	stba	%l1,[%i2+%o5]0x89	! Mem[0000000030081410] = 000000ff
!	%l4 = 000000000000004a, Mem[0000000030181410] = 31000000
	stwa	%l4,[%i6+%o5]0x81	! Mem[0000000030181410] = 0000004a
!	%f4  = 80970000 00000000, Mem[0000000030141408] = 000000ff ffff0000
	stda	%f4 ,[%i5+%o4]0x89	! Mem[0000000030141408] = 80970000 00000000
!	%f0  = 00000000 7fffffff, Mem[0000000030101408] = 00000000 ffffffff
	stda	%f0 ,[%i4+%o4]0x89	! Mem[0000000030101408] = 00000000 7fffffff
!	%l2 = 00000000ff0000ff, Mem[0000000030001400] = 00000001
	stha	%l2,[%i0+%g0]0x89	! Mem[0000000030001400] = 000000ff
!	Mem[0000000030081400] = daa64a31, %l7 = 000000006bffacc5
	swapa	[%i2+%g0]0x89,%l7	! %l7 = 00000000daa64a31
!	%l4 = 000000000000004a, Mem[0000000030181400] = ff000000
	stwa	%l4,[%i6+%g0]0x81	! Mem[0000000030181400] = 0000004a
!	Mem[0000000010041410] = 314aa6ff, %l4 = 000000000000004a
	swapa	[%i1+%o5]0x80,%l4	! %l4 = 00000000314aa6ff
!	Mem[0000000010081400] = 0000000000000000, %l4 = 00000000314aa6ff, %l5 = 0000000000000000
	casxa	[%i2]0x80,%l4,%l5	! %l5 = 0000000000000000
!	%f10 = 000000ff 7e0000ff, %l0 = 000000000000002b
!	Mem[0000000010101420] = 00ff00310000a6db
	add	%i4,0x020,%g1
	stda	%f10,[%g1+%l0]ASI_PST16_P ! Mem[0000000010101420] = 000000317e0000ff

p0_label_410:
!	Starting 10 instruction Load Burst
!	%l5 = 0000000000000000, imm = fffffffffffffa0a, %l4 = 00000000314aa6ff
	and	%l5,-0x5f6,%l4		! %l4 = 0000000000000000
!	Mem[00000000300c1400] = 437bb870 00000000 00005b0f 00000080
!	Mem[00000000300c1410] = 44a491d7 ffa64a31 0dd229ea ff752d36
!	Mem[00000000300c1420] = 2fb55cc8 4e44ccb9 4a28a146 9653657f
!	Mem[00000000300c1430] = 00000000 00000000 7e000000 587464ff
	ldda	[%i3+%g0]ASI_BLK_AIUS,%f16	! Block Load from 00000000300c1400
!	Mem[0000000030101410] = 00000031, %l1 = 00000000000000ff
	ldsha	[%i4+%o5]0x89,%l1	! %l1 = 0000000000000031
!	Mem[00000000201c0000] = 00ffe880, %l6 = 000000000000fb00
	ldsh	[%o0+%g0],%l6		! %l6 = 00000000000000ff
!	Mem[0000000021800040] = ffff8370, %l1 = 0000000000000031, %asi = 80
	lduba	[%o3+0x040]%asi,%l1	! %l1 = 00000000000000ff
!	Mem[00000000100c1428] = 00009780 ffffffff, %l2 = ff0000ff, %l3 = ff000000
	ldd	[%i3+0x028],%l2		! %l2 = 0000000000009780 00000000ffffffff
!	%l3 = 00000000ffffffff, imm = ffffffffffffff53, %l1 = 00000000000000ff
	xor	%l3,-0x0ad,%l1		! %l1 = ffffffff000000ac
!	Mem[00000000300c1408] = 0f5b0000, %l3 = 00000000ffffffff
	ldswa	[%i3+%o4]0x89,%l3	! %l3 = 000000000f5b0000
!	Mem[00000000300c1400] = 437bb870, %l2 = 0000000000009780
	ldswa	[%i3+%g0]0x81,%l2	! %l2 = 00000000437bb870
!	Mem[00000000100c1408] = 4a3100ff, %f8  = 95e20f5b
	lda	[%i3+%o4]0x80,%f8 	! %f8 = 4a3100ff

p0_label_411:
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1410] = 44a491d7, %l7 = 00000000daa64a31
	swapa	[%i3+%o5]0x81,%l7	! %l7 = 0000000044a491d7
	membar	#Sync			! Added by membar checker (78)
!	%f0  = 00000000 7fffffff, %l6 = 00000000000000ff
!	Mem[00000000300c1408] = 00005b0f00000080
	add	%i3,0x008,%g1
	stda	%f0,[%g1+%l6]ASI_PST32_SL ! Mem[00000000300c1408] = ffffff7f00000000
!	%f26 = 4a28a146 9653657f, %l3 = 000000000f5b0000
!	Mem[0000000010001410] = 00000031da000000
	add	%i0,0x010,%g1
	stda	%f26,[%g1+%l3]ASI_PST32_PL ! Mem[0000000010001410] = 00000031da000000
!	%l1 = ffffffff000000ac, imm = fffffffffffffc99, %l4 = 0000000000000000
	subc	%l1,-0x367,%l4		! %l4 = ffffffff00000413
!	Mem[0000000030081410] = ff000000, %l1 = ffffffff000000ac
	ldstuba	[%i2+%o5]0x81,%l1	! %l1 = 00000000000000ff
!	%f28 = 00000000 00000000, %l5 = 0000000000000000
!	Mem[0000000010141408] = af4d4b3754d1c79f
	add	%i5,0x008,%g1
	stda	%f28,[%g1+%l5]ASI_PST32_P ! Mem[0000000010141408] = af4d4b3754d1c79f
!	%l2 = 00000000437bb870, Mem[0000000010041400] = c5acff6bffffffff
	stxa	%l2,[%i1+%g0]0x80	! Mem[0000000010041400] = 00000000437bb870
!	Mem[0000000010041410] = 0000004a, %l3 = 000000000f5b0000
	ldstuba	[%i1+%o5]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000010141408] = af4d4b37, %l1 = 00000000000000ff
	swapa	[%i5+%o4]0x80,%l1	! %l1 = 00000000af4d4b37
!	%l3 = 0000000000000000, imm = 0000000000000024, %l0 = 000000000000002b
	subc	%l3,0x024,%l0		! %l0 = ffffffffffffffdc

p0_label_412:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = 9fc7d154ff000000, %f20 = 44a491d7 ffa64a31
	ldda	[%i5+%o4]0x88,%f20	! %f20 = 9fc7d154 ff000000
!	Mem[0000000010141408] = ff000000, %l2 = 00000000437bb870
	lduha	[%i5+%o4]0x88,%l2	! %l2 = 0000000000000000
!	%l0 = ffffffffffffffdc, %l0 = ffffffffffffffdc, %l0 = ffffffffffffffdc
	andn	%l0,%l0,%l0		! %l0 = 0000000000000000
!	Mem[0000000030141410] = 80970000, %f28 = 00000000
	lda	[%i5+%o5]0x89,%f28	! %f28 = 80970000
!	Mem[0000000030041400] = 0000000000000031, %f4  = 80970000 00000000
	ldda	[%i1+%g0]0x81,%f4 	! %f4  = 00000000 00000031
!	Mem[0000000010001410] = 000000da31000000, %l3 = 0000000000000000
	ldxa	[%i0+%o5]0x88,%l3	! %l3 = 000000da31000000
!	Mem[0000000010081400] = 00000000, %l2 = 0000000000000000
	ldsw	[%i2+%g0],%l2		! %l2 = 0000000000000000
!	Mem[0000000010101438] = 00ff0000, %l0 = 0000000000000000
	ldsw	[%i4+0x038],%l0		! %l0 = 0000000000ff0000
!	Mem[0000000010181400] = ffff0000, %l5 = 0000000000000000
	lduwa	[%i6+%g0]0x80,%l5	! %l5 = 00000000ffff0000
!	Mem[0000000010001408] = 000000ff, %l2 = 0000000000000000
	lduwa	[%i0+%o4]0x88,%l2	! %l2 = 00000000000000ff

p0_label_413:
!	Starting 10 instruction Store Burst
!	%l3 = 000000da31000000, Mem[0000000010141408] = 000000ff
	stha	%l3,[%i5+%o4]0x80	! Mem[0000000010141408] = 000000ff
!	%l0 = 00ff0000, %l1 = af4d4b37, Mem[00000000300c1410] = daa64a31 ffa64a31
	stda	%l0,[%i3+%o5]0x81	! Mem[00000000300c1410] = 00ff0000 af4d4b37
!	Mem[0000000010041400] = 00000000, %l7 = 0000000044a491d7
	ldstuba	[%i1+%g0]0x88,%l7	! %l7 = 0000000000000000
!	%l3 = 000000da31000000, Mem[0000000010181408] = 01000000
	stwa	%l3,[%i6+%o4]0x80	! Mem[0000000010181408] = 31000000
!	%f10 = 000000ff 7e0000ff, %l1 = 00000000af4d4b37
!	Mem[0000000010101438] = 00ff0000000000db
	add	%i4,0x038,%g1
	stda	%f10,[%g1+%l1]ASI_PST32_PL ! Mem[0000000010101438] = ff00007eff000000
!	Mem[0000000010001410] = 00000031, %l4 = 0000000000000413
	swapa	[%i0+%o5]0x80,%l4	! %l4 = 0000000000000031
!	%l3 = 000000da31000000, Mem[00000000100c1438] = ffad6ddfff800000, %asi = 80
	stxa	%l3,[%i3+0x038]%asi	! Mem[00000000100c1438] = 000000da31000000
!	Mem[0000000010081425] = 00000022, %l5 = 00000000ffff0000
	ldstuba	[%i2+0x025]%asi,%l5	! %l5 = 0000000000000000
!	%l6 = 00000000000000ff, Mem[00000000300c1410] = 00ff0000
	stwa	%l6,[%i3+%o5]0x81	! Mem[00000000300c1410] = 000000ff
!	%f0  = 00000000 7fffffff, Mem[0000000010001410] = 00000413 da000000
	stda	%f0 ,[%i0+%o5]0x80	! Mem[0000000010001410] = 00000000 7fffffff

p0_label_414:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = 000000ff ff000080, %l6 = 000000ff, %l7 = 00000000
	ldda	[%i3+%g0]0x88,%l6	! %l6 = 00000000ff000080 00000000000000ff
!	Mem[0000000010101410] = 00000000, %l5 = 0000000000000000
	lduba	[%i4+%o5]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000010001428] = 58fa12e6, %l1 = 00000000af4d4b37
	ldsh	[%i0+0x028],%l1		! %l1 = 00000000000058fa
!	Mem[0000000010141400] = ff000000, %l4 = 0000000000000031
	lduh	[%i5+%g0],%l4		! %l4 = 000000000000ff00
!	Mem[0000000030181408] = 54fb76ff, %l6 = 00000000ff000080
	ldsha	[%i6+%o4]0x89,%l6	! %l6 = 00000000000076ff
!	Mem[0000000030081410] = ff000000, %l4 = 000000000000ff00
	lduha	[%i2+%o5]0x81,%l4	! %l4 = 000000000000ff00
!	Mem[0000000030101410] = 00000031, %f25 = 4e44ccb9
	lda	[%i4+%o5]0x89,%f25	! %f25 = 00000031
!	Mem[0000000010101410] = 8097000000000000, %f12 = ffff0000 97800000
	ldda	[%i4+%o5]0x88,%f12	! %f12 = 80970000 00000000
!	Mem[0000000030101408] = ffffff7f, %f16 = 437bb870
	lda	[%i4+%o4]0x81,%f16	! %f16 = ffffff7f
!	Mem[0000000030181408] = 54fb76ff, %l5 = 0000000000000000
	lduba	[%i6+%o4]0x89,%l5	! %l5 = 00000000000000ff

p0_label_415:
!	Starting 10 instruction Store Burst
!	%l6 = 00000000000076ff, Mem[00000000100c1400] = ff000080
	stwa	%l6,[%i3+%g0]0x88	! Mem[00000000100c1400] = 000076ff
!	%f16 = ffffff7f 00000000, Mem[0000000030001410] = ff970000 3f800000
	stda	%f16,[%i0+%o5]0x81	! Mem[0000000030001410] = ffffff7f 00000000
!	%l0 = 0000000000ff0000, Mem[0000000030141400] = 00000000
	stha	%l0,[%i5+%g0]0x81	! Mem[0000000030141400] = 00000000
!	%l4 = 000000000000ff00, Mem[0000000030001408] = da000000
	stba	%l4,[%i0+%o4]0x81	! Mem[0000000030001408] = 00000000
!	Mem[0000000010101400] = 31000000, %l7 = 00000000000000ff
	ldstuba	[%i4+%g0]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000030141400] = 00000000, %l1 = 00000000000058fa
	ldstuba	[%i5+%g0]0x81,%l1	! %l1 = 0000000000000000
!	%f8  = 4a3100ff, Mem[0000000010141420] = 95e20f5b
	st	%f8 ,[%i5+0x020]	! Mem[0000000010141420] = 4a3100ff
!	Mem[00000000300c1408] = 7fffffff, %l3 = 0000000031000000
	swapa	[%i3+%o4]0x89,%l3	! %l3 = 000000007fffffff
!	%l2 = 000000ff, %l3 = 7fffffff, Mem[0000000030181410] = 4a000000 00000031
	stda	%l2,[%i6+%o5]0x89	! Mem[0000000030181410] = 000000ff 7fffffff
!	Mem[0000000010081400] = 00000000, %l4 = 000000000000ff00
	swapa	[%i2+%g0]0x80,%l4	! %l4 = 0000000000000000

p0_label_416:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = ff000000, %l1 = 0000000000000000
	lduha	[%i5+%g0]0x80,%l1	! %l1 = 000000000000ff00
!	Mem[00000000300c1410] = 000000ff, %l4 = 0000000000000000
	lduba	[%i3+%o5]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000030101410] = 31000000, %l2 = 00000000000000ff
	ldsha	[%i4+%o5]0x81,%l2	! %l2 = 0000000000003100
!	Mem[0000000030101400] = 0097000000003dff, %l7 = 0000000000000000
	ldxa	[%i4+%g0]0x81,%l7	! %l7 = 0097000000003dff
!	Mem[0000000021800081] = ffff49a0, %l1 = 000000000000ff00, %asi = 80
	ldsba	[%o3+0x081]%asi,%l1	! %l1 = ffffffffffffffff
!	Mem[00000000100c1408] = 54000000ff00314a, %l4 = 0000000000000000
	ldxa	[%i3+%o4]0x88,%l4	! %l4 = 54000000ff00314a
	membar	#Sync			! Added by membar checker (79)
!	Mem[0000000010081400] = 0000ff00 00000000 437bb870 00000100
!	Mem[0000000010081410] = 31000000 22000000 437bb870 daa64a31
!	Mem[0000000010081420] = 7e0000ff 00ff0022 000000ff 00000000
!	Mem[0000000010081430] = 58fa12e6 ffff0000 00000000 00000000
	ldda	[%i2+%g0]ASI_BLK_P,%f0 	! Block Load from 0000000010081400
!	Mem[0000000010141410] = 54000000, %f26 = 4a28a146
	lda	[%i5+%o5]0x88,%f26	! %f26 = 54000000
!	Mem[0000000030001400] = 000000ff 000000ff, %l4 = ff00314a, %l5 = 000000ff
	ldda	[%i0+%g0]0x89,%l4	! %l4 = 00000000000000ff 00000000000000ff
!	Mem[00000000100c1400] = ff760000ff000000, %f24 = 2fb55cc8 00000031
	ldda	[%i3+%g0]0x80,%f24	! %f24 = ff760000 ff000000

p0_label_417:
!	Starting 10 instruction Store Burst
!	%f11 = 00000000, Mem[0000000030081410] = 000000ff
	sta	%f11,[%i2+%o5]0x89	! Mem[0000000030081410] = 00000000
!	Mem[0000000010141404] = 00000097, %l5 = 00000000000000ff
	swap	[%i5+0x004],%l5		! %l5 = 0000000000000097
!	Mem[0000000030101408] = 7fffffff, %l3 = 000000007fffffff
	ldstuba	[%i4+%o4]0x89,%l3	! %l3 = 00000000000000ff
!	%l2 = 0000000000003100, Mem[0000000010101410] = 0000000000009780
	stxa	%l2,[%i4+%o5]0x80	! Mem[0000000010101410] = 0000000000003100
!	%l2 = 00003100, %l3 = 000000ff, Mem[0000000030001400] = ff000000 ff000000
	stda	%l2,[%i0+%g0]0x81	! Mem[0000000030001400] = 00003100 000000ff
!	%l7 = 0097000000003dff, Mem[0000000010141408] = 9fc7d154ff000000
	stxa	%l7,[%i5+%o4]0x88	! Mem[0000000010141408] = 0097000000003dff
!	%l3 = 00000000000000ff, Mem[00000000201c0000] = 00ffe880, %asi = 80
	stha	%l3,[%o0+0x000]%asi	! Mem[00000000201c0000] = 00ffe880
!	%f6  = 437bb870 daa64a31, Mem[0000000010001410] = 00000000 7fffffff
	stda	%f6 ,[%i0+%o5]0x80	! Mem[0000000010001410] = 437bb870 daa64a31
!	%l2 = 0000000000003100, %l1 = ffffffffffffffff, %l3 = 00000000000000ff
	udivx	%l2,%l1,%l3		! %l3 = 0000000000000000
!	%l6 = 00000000000076ff, Mem[0000000010041428] = 6b97140b000000ff
	stx	%l6,[%i1+0x028]		! Mem[0000000010041428] = 00000000000076ff

p0_label_418:
!	Starting 10 instruction Load Burst
!	Mem[000000001010142e] = 0000008d, %l6 = 00000000000076ff, %asi = 80
	ldsba	[%i4+0x02e]%asi,%l6	! %l6 = 0000000000000000
!	Mem[00000000300c1410] = 000000ff, %l0 = 0000000000ff0000
	ldswa	[%i3+%o5]0x81,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010101400] = ff0000310000007e, %f20 = 9fc7d154 ff000000
	ldda	[%i4+%g0]0x80,%f20	! %f20 = ff000031 0000007e
!	Mem[0000000030141400] = ff00000000000000, %f30 = 7e000000 587464ff
	ldda	[%i5+%g0]0x81,%f30	! %f30 = ff000000 00000000
!	Mem[000000001008141c] = daa64a31, %l7 = 0097000000003dff
	lduw	[%i2+0x01c],%l7		! %l7 = 00000000daa64a31
!	%f25 = ff000000, %f27 = 9653657f, %f28 = 80970000
	fadds	%f25,%f27,%f28		! %f28 = ff000000
!	Mem[0000000030101408] = ffffff7f00000000, %l3 = 0000000000000000
	ldxa	[%i4+%o4]0x81,%l3	! %l3 = ffffff7f00000000
!	Mem[0000000030041410] = 00fb0000, %l0 = 00000000000000ff
	ldsba	[%i1+%o5]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000030141408] = 00000000, %l5 = 0000000000000097
	lduwa	[%i5+%o4]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000030081410] = 00000000, %l0 = 0000000000000000
	ldsba	[%i2+%o5]0x89,%l0	! %l0 = 0000000000000000

p0_label_419:
!	Starting 10 instruction Store Burst
!	%l4 = 000000ff, %l5 = 00000000, Mem[0000000010101408] = d4fa0a2b ff000000
	stda	%l4,[%i4+%o4]0x88	! Mem[0000000010101408] = 000000ff 00000000
!	Mem[0000000030141408] = 00000000, %l2 = 0000000000003100
	ldstuba	[%i5+%o4]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000010001410] = 437bb870daa64a31, %l0 = 0000000000000000, %l2 = 0000000000000000
	add	%i0,0x10,%g1
	casxa	[%g1]0x80,%l0,%l2	! %l2 = 437bb870daa64a31
!	Mem[00000000100c1400] = ff760000, %l7 = 00000000daa64a31
	swapa	[%i3+%g0]0x80,%l7	! %l7 = 00000000ff760000
!	%f14 = 00000000 00000000, Mem[0000000010141410] = 00000054 000000ff
	std	%f14,[%i5+%o5]		! Mem[0000000010141410] = 00000000 00000000
!	%l0 = 0000000000000000, Mem[0000000010141410] = 0000000000000000
	stxa	%l0,[%i5+%o5]0x80	! Mem[0000000010141410] = 0000000000000000
!	%l0 = 00000000, %l1 = ffffffff, Mem[0000000010101400] = 310000ff 7e000000
	stda	%l0,[%i4+%g0]0x88	! Mem[0000000010101400] = 00000000 ffffffff
!	%l3 = ffffff7f00000000, Mem[0000000030141400] = 000000ff
	stba	%l3,[%i5+%g0]0x89	! Mem[0000000030141400] = 00000000
!	%f14 = 00000000 00000000, Mem[0000000010181408] = 31000000 ffff0000, %asi = 80
	stda	%f14,[%i6+0x008]%asi	! Mem[0000000010181408] = 00000000 00000000
!	%l0 = 0000000000000000, Mem[0000000010101410] = 00000000
	stba	%l0,[%i4+%o5]0x80	! Mem[0000000010101410] = 00000000

p0_label_420:
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = 00009700, %l1 = ffffffffffffffff
	ldsba	[%i4+%g0]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000030041408] = 000000ff, %l0 = 0000000000000000
	ldsha	[%i1+%o4]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000010141400] = ff000000 000000ff, %l0 = 00000000, %l1 = 00000000
	ldda	[%i5+%g0]0x88,%l0	! %l0 = 00000000000000ff 00000000ff000000
!	Mem[0000000010001408] = ff000000, %f7  = daa64a31
	ld	[%i0+%o4],%f7 		! %f7 = ff000000
!	%l4 = 00000000000000ff, imm = 0000000000000d3f, %l1 = 00000000ff000000
	subc	%l4,0xd3f,%l1		! %l1 = fffffffffffff3c0
!	Mem[0000000010001427] = 2df625d9, %l7 = 00000000ff760000
	ldsb	[%i0+0x027],%l7		! %l7 = ffffffffffffffd9
!	Mem[0000000010181410] = 00000031, %l4 = 00000000000000ff
	ldsba	[%i6+%o5]0x88,%l4	! %l4 = 0000000000000031
!	Mem[00000000100c1400] = daa64a31, %l5 = 0000000000000000
	ldsba	[%i3+%g0]0x80,%l5	! %l5 = ffffffffffffffda
!	Mem[000000001018143c] = ffffffff, %l2 = 437bb870daa64a31, %asi = 80
	lduha	[%i6+0x03c]%asi,%l2	! %l2 = 000000000000ffff
!	Mem[0000000030001400] = ff00000000310000, %l4 = 0000000000000031
	ldxa	[%i0+%g0]0x89,%l4	! %l4 = ff00000000310000

p0_label_421:
!	Starting 10 instruction Store Burst
!	%f24 = ff760000 ff000000, Mem[0000000010181408] = 00000000 00000000
	stda	%f24,[%i6+%o4]0x88	! Mem[0000000010181408] = ff760000 ff000000
!	%l0 = 00000000000000ff, Mem[0000000010001400] = ffffffff
	stha	%l0,[%i0+%g0]0x88	! Mem[0000000010001400] = ffff00ff
!	%l1 = fffffffffffff3c0, Mem[0000000030141408] = ff000000
	stba	%l1,[%i5+%o4]0x81	! Mem[0000000030141408] = c0000000
!	%l6 = 00000000, %l7 = ffffffd9, Mem[0000000030181408] = 54fb76ff d925f62d
	stda	%l6,[%i6+%o4]0x89	! Mem[0000000030181408] = 00000000 ffffffd9
	membar	#Sync			! Added by membar checker (80)
!	%f4  = 31000000 22000000, Mem[0000000010081410] = 31000000 22000000
	std	%f4 ,[%i2+%o5]		! Mem[0000000010081410] = 31000000 22000000
!	%f10 = 000000ff 00000000, %l1 = fffffffffffff3c0
!	Mem[00000000100c1428] = 00009780ffffffff
	add	%i3,0x028,%g1
	stda	%f10,[%g1+%l1]ASI_PST16_P ! Mem[00000000100c1428] = 00009780ffffffff
!	Mem[0000000010101400] = 00000000, %l4 = ff00000000310000
	ldstuba	[%i4+%g0]0x88,%l4	! %l4 = 0000000000000000
!	%l1 = fffffffffffff3c0, immd = 0000054e, %y  = 0000002b
	udiv	%l1,0x54e,%l5		! %l5 = 00000000084b67ac
	mov	%l0,%y			! %y = 000000ff
!	%l6 = 0000000000000000, Mem[0000000030041408] = 000000ffc5acff6b
	stxa	%l6,[%i1+%o4]0x81	! Mem[0000000030041408] = 0000000000000000
!	%l4 = 0000000000000000, Mem[0000000010041400] = ff000000437bb870
	stxa	%l4,[%i1+%g0]0x80	! Mem[0000000010041400] = 0000000000000000

p0_label_422:
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = ff0000ffff000000, %f8  = 7e0000ff 00ff0022
	ldda	[%i2+%o4]0x81,%f8 	! %f8  = ff0000ff ff000000
!	Mem[00000000300c1408] = 31000000, %l4 = 0000000000000000
	lduba	[%i3+%o4]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000030081410] = 00000000, %l5 = 00000000084b67ac
	ldsha	[%i2+%o5]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000010001403] = ff00ffff, %l7 = ffffffffffffffd9
	ldsb	[%i0+0x003],%l7		! %l7 = ffffffffffffffff
!	Mem[0000000030181410] = ff000000 ffffff7f, %l4 = 00000000, %l5 = 00000000
	ldda	[%i6+%o5]0x81,%l4	! %l4 = 00000000ff000000 00000000ffffff7f
!	%l3 = ffffff7f00000000, imm = 000000000000054d, %l5 = 00000000ffffff7f
	add	%l3,0x54d,%l5		! %l5 = ffffff7f0000054d
!	Mem[0000000030141400] = 00000000, %l2 = 000000000000ffff
	ldswa	[%i5+%g0]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000010001408] = ff000000, %l3 = ffffff7f00000000
	ldsba	[%i0+%o4]0x80,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000030081400] = c5acff6b, %l5 = ffffff7f0000054d
	ldsba	[%i2+%g0]0x81,%l5	! %l5 = ffffffffffffffc5
!	%f4  = 31000000, %f25 = ff000000, %f31 = 00000000
	fdivs	%f4 ,%f25,%f31		! %f31 = 80000000

p0_label_423:
!	Starting 10 instruction Store Burst
!	Mem[0000000010001408] = ff000000, %l0 = 00000000000000ff
	swapa	[%i0+%o4]0x80,%l0	! %l0 = 00000000ff000000
!	%l2 = 00000000, %l3 = ffffffff, Mem[0000000010041410] = ff00004a ff000080
	stda	%l2,[%i1+%o5]0x80	! Mem[0000000010041410] = 00000000 ffffffff
!	%l4 = ff000000, %l5 = ffffffc5, Mem[0000000030141408] = 000000c0 80970000
	stda	%l4,[%i5+%o4]0x89	! Mem[0000000030141408] = ff000000 ffffffc5
!	%l0 = 00000000ff000000, immd = fffff4e4, %y  = 000000ff
	umul	%l0,-0xb1c,%l3		! %l3 = fefff4ef1c000000, %y = fefff4ef
!	%f17 = 00000000, Mem[0000000010041408] = 00000097
	sta	%f17,[%i1+%o4]0x88	! Mem[0000000010041408] = 00000000
!	Mem[0000000010001410] = 70b87b43, %l7 = 00000000ffffffff
	swapa	[%i0+%o5]0x88,%l7	! %l7 = 0000000070b87b43
!	%f22 = 0dd229ea ff752d36, Mem[0000000010181418] = 069b8097 70b87b43, %asi = 80
	stda	%f22,[%i6+0x018]%asi	! Mem[0000000010181418] = 0dd229ea ff752d36
!	Mem[0000000010001408] = 000000ff, %l2 = 0000000000000000
	ldstuba	[%i0+%o4]0x80,%l2	! %l2 = 0000000000000000
!	%l3 = fefff4ef1c000000, Mem[0000000030081400] = 6bffacc5
	stwa	%l3,[%i2+%g0]0x89	! Mem[0000000030081400] = 1c000000
!	%l7 = 0000000070b87b43, Mem[000000001014140c] = 00009700
	stw	%l7,[%i5+0x00c]		! Mem[000000001014140c] = 70b87b43

p0_label_424:
!	Starting 10 instruction Load Burst
!	Mem[000000001004142a] = 00000000, %l6 = 0000000000000000, %asi = 80
	lduha	[%i1+0x02a]%asi,%l6	! %l6 = 0000000000000000
!	Mem[0000000010181410] = 00000031, %l7 = 0000000070b87b43
	lduha	[%i6+%o5]0x88,%l7	! %l7 = 0000000000000031
!	Mem[0000000010041410] = 00000000, %l0 = 00000000ff000000
	lduba	[%i1+%o5]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000030081400] = 1c000000, %l1 = fffffffffffff3c0
	lduha	[%i2+%g0]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000010081434] = ffff0000, %l6 = 0000000000000000
	lduw	[%i2+0x034],%l6		! %l6 = 00000000ffff0000
!	Mem[00000000300c1410] = ff000000, %l1 = 0000000000000000
	lduba	[%i3+%o5]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000030181410] = ff000000ffffff7f, %f16 = ffffff7f 00000000
	ldda	[%i6+%o5]0x81,%f16	! %f16 = ff000000 ffffff7f
!	Mem[0000000010081400] = 0000ff00, %f4  = 31000000
	lda	[%i2+%g0]0x80,%f4 	! %f4 = 0000ff00
!	Mem[0000000010101400] = 000000ff, %l6 = 00000000ffff0000
	lduwa	[%i4+%g0]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010081410] = 31000000, %l4 = 00000000ff000000
	ldsha	[%i2+%o5]0x80,%l4	! %l4 = 0000000000003100

p0_label_425:
!	Starting 10 instruction Store Burst
!	%l6 = 00000000000000ff, Mem[0000000030001408] = 00000000
	stha	%l6,[%i0+%o4]0x81	! Mem[0000000030001408] = 00ff0000
!	Mem[0000000030101410] = 00000031, %l4 = 0000000000003100
	swapa	[%i4+%o5]0x89,%l4	! %l4 = 0000000000000031
!	%f18 = 00005b0f, Mem[0000000010181418] = 0dd229ea
	st	%f18,[%i6+0x018]	! Mem[0000000010181418] = 00005b0f
!	Mem[0000000010081408] = 70b87b43, %l3 = fefff4ef1c000000
	ldstuba	[%i2+%o4]0x88,%l3	! %l3 = 0000000000000043
!	Mem[0000000030081408] = ff0000ff, %l1 = 0000000000000000
	swapa	[%i2+%o4]0x81,%l1	! %l1 = 00000000ff0000ff
!	%f0  = 0000ff00 00000000, Mem[0000000010141408] = ff3d0000 70b87b43
	stda	%f0 ,[%i5+%o4]0x80	! Mem[0000000010141408] = 0000ff00 00000000
!	%l7 = 0000000000000031, Mem[0000000030001408] = 00ff0000ff8000ff
	stxa	%l7,[%i0+%o4]0x81	! Mem[0000000030001408] = 0000000000000031
!	%f31 = 80000000, %f15 = 00000000, %f19 = 00000080
	fdivs	%f31,%f15,%f19		! %f19 = 7fffffff
!	%l0 = 0000000000000000, Mem[0000000030041400] = 00000000
	stba	%l0,[%i1+%g0]0x81	! Mem[0000000030041400] = 00000000
!	Mem[0000000010101420] = 00000031, %l3 = 00000043, %l7 = 00000031
	add	%i4,0x20,%g1
	casa	[%g1]0x80,%l3,%l7	! %l7 = 0000000000000031

p0_label_426:
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = 00000000, %l2 = 0000000000000000
	lduha	[%i2+%o4]0x89,%l2	! %l2 = 0000000000000000
!	Mem[00000000211c0000] = ffff6b10, %l1 = 00000000ff0000ff
	lduh	[%o2+%g0],%l1		! %l1 = 000000000000ffff
!	Mem[0000000010081408] = ff7bb87000000100, %f6  = 437bb870 ff000000
	ldda	[%i2+%o4]0x80,%f6 	! %f6  = ff7bb870 00000100
!	Mem[0000000010081400] = 00ff0000, %l4 = 0000000000000031
	lduba	[%i2+%g0]0x88,%l4	! %l4 = 0000000000000000
!	Mem[00000000300c1400] = 0000000070b87b43, %f14 = 00000000 00000000
	ldda	[%i3+%g0]0x89,%f14	! %f14 = 00000000 70b87b43
!	Mem[0000000010001408] = ff0000ff00000000, %f16 = ff000000 ffffff7f
	ldda	[%i0+%o4]0x80,%f16	! %f16 = ff0000ff 00000000
!	Mem[0000000010141400] = ff000000, %l7 = 0000000000000031
	ldsh	[%i5+%g0],%l7		! %l7 = ffffffffffffff00
!	Mem[0000000030181410] = ff000000, %l7 = ffffffffffffff00
	ldsha	[%i6+%o5]0x81,%l7	! %l7 = ffffffffffffff00
!	Mem[0000000030141410] = 80970000, %l4 = 0000000000000000
	lduba	[%i5+%o5]0x89,%l4	! %l4 = 0000000000000000
!	Mem[00000000201c0000] = 00ffe880, %l6 = 00000000000000ff, %asi = 80
	ldsba	[%o0+0x000]%asi,%l6	! %l6 = 0000000000000000

p0_label_427:
!	Starting 10 instruction Store Burst
!	Mem[0000000030181410] = ff000000, %l4 = 0000000000000000
	swapa	[%i6+%o5]0x81,%l4	! %l4 = 00000000ff000000
!	Mem[0000000010001408] = ff0000ff, %l2 = 0000000000000000
	ldstuba	[%i0+%o4]0x88,%l2	! %l2 = 00000000000000ff
!	%f12 = 58fa12e6, Mem[0000000010081408] = 70b87bff
	sta	%f12,[%i2+%o4]0x88	! Mem[0000000010081408] = 58fa12e6
!	Mem[00000000100c1410] = 7e0000ff, %l2 = 00000000000000ff
	ldstuba	[%i3+%o5]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010101408] = ff00000000000000, %l4 = 00000000ff000000, %l3 = 0000000000000043
	add	%i4,0x08,%g1
	casxa	[%g1]0x80,%l4,%l3	! %l3 = ff00000000000000
!	%l3 = ff00000000000000, Mem[0000000030041410] = 000000000000fb00
	stxa	%l3,[%i1+%o5]0x89	! Mem[0000000030041410] = ff00000000000000
!	%l3 = ff00000000000000, imm = fffffffffffffc4a, %l7 = ffffffffffffff00
	orn	%l3,-0x3b6,%l7		! %l7 = ff000000000003b5
!	%l3 = ff00000000000000, Mem[0000000030181400] = 4a000000
	stwa	%l3,[%i6+%g0]0x89	! Mem[0000000030181400] = 00000000
!	Mem[0000000010101408] = ff000000, %l6 = 0000000000000000
	ldstuba	[%i4+%o4]0x80,%l6	! %l6 = 00000000000000ff
!	%l1 = 000000000000ffff, Mem[0000000010041408] = 00000000
	stba	%l1,[%i1+%o4]0x88	! Mem[0000000010041408] = 000000ff

p0_label_428:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = 00000031, %l0 = 0000000000000000
	lduwa	[%i2+%o5]0x88,%l0	! %l0 = 0000000000000031
!	Mem[0000000010181408] = ff000000, %l3 = ff00000000000000
	ldsha	[%i6+%o4]0x88,%l3	! %l3 = 0000000000000000
!	Mem[00000000300c1400] = 437bb87000000000, %l2 = 00000000000000ff
	ldxa	[%i3+%g0]0x81,%l2	! %l2 = 437bb87000000000
!	Mem[0000000030141408] = 000000ff, %l4 = 00000000ff000000
	ldswa	[%i5+%o4]0x81,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010081400] = 0000ff00, %l7 = ff000000000003b5
	ldsha	[%i2+%g0]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000030101408] = 7fffffff, %l1 = 000000000000ffff
	lduha	[%i4+%o4]0x89,%l1	! %l1 = 000000000000ffff
!	Mem[00000000218001c1] = 00006c90, %l0 = 0000000000000031, %asi = 80
	ldsba	[%o3+0x1c1]%asi,%l0	! %l0 = 0000000000000000
!	Mem[0000000010141410] = 0000000000000000, %f12 = 58fa12e6 ffff0000
	ldda	[%i5+%o5]0x80,%f12	! %f12 = 00000000 00000000
!	Mem[0000000030041400] = 00000000, %l5 = ffffffffffffffc5
	ldsba	[%i1+%g0]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000030041408] = 00000000, %l7 = 0000000000000000
	lduha	[%i1+%o4]0x89,%l7	! %l7 = 0000000000000000

p0_label_429:
!	Starting 10 instruction Store Burst
!	Mem[0000000030001400] = 00310000, %l5 = 0000000000000000
	swapa	[%i0+%g0]0x89,%l5	! %l5 = 0000000000310000
!	%l1 = 000000000000ffff, Mem[0000000030081408] = 00000000
	stwa	%l1,[%i2+%o4]0x89	! Mem[0000000030081408] = 0000ffff
!	Mem[0000000010041400] = 00000000, %l3 = 0000000000000000
	ldstuba	[%i1+%g0]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000030001400] = 00000000 000000ff 00000000 00000031
!	%f0  = 0000ff00 00000000 437bb870 00000100
!	%f4  = 0000ff00 22000000 ff7bb870 00000100
!	%f8  = ff0000ff ff000000 000000ff 00000000
!	%f12 = 00000000 00000000 00000000 70b87b43
	stda	%f0 ,[%i0+%g0]ASI_BLK_S	! Block Store to 0000000030001400
!	%f11 = 00000000, Mem[0000000030041408] = 00000000
	sta	%f11,[%i1+%o4]0x89	! Mem[0000000030041408] = 00000000
!	Mem[0000000010141410] = 00000000, %l3 = 0000000000000000
	ldstuba	[%i5+%o5]0x80,%l3	! %l3 = 0000000000000000
!	Mem[00000000211c0001] = ffff6b10, %l7 = 0000000000000000
	ldstub	[%o2+0x001],%l7		! %l7 = 00000000000000ff
!	%f6  = ff7bb870 00000100, %l0 = 0000000000000000
!	Mem[0000000030001408] = 437bb87000000100
	add	%i0,0x008,%g1
	stda	%f6,[%g1+%l0]ASI_PST32_SL ! Mem[0000000030001408] = 437bb87000000100
!	%l6 = 00000000000000ff, Mem[00000000100c1400] = daa64a31
	stwa	%l6,[%i3+%g0]0x80	! Mem[00000000100c1400] = 000000ff
!	Mem[0000000010181400] = 0000ffff, %l6 = 00000000000000ff
	swapa	[%i6+%g0]0x88,%l6	! %l6 = 000000000000ffff

p0_label_430:
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = 00000031, %l6 = 000000000000ffff
	ldswa	[%i3+%o4]0x81,%l6	! %l6 = 0000000000000031
	membar	#Sync			! Added by membar checker (81)
!	Mem[0000000010001412] = ffffffff, %l7 = 00000000000000ff, %asi = 80
	ldsba	[%i0+0x012]%asi,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000030101410] = 00003100, %f13 = 00000000
	lda	[%i4+%o5]0x89,%f13	! %f13 = 00003100
!	Mem[00000000300c1400] = 437bb870 00000000 00000031 00000000
!	Mem[00000000300c1410] = 000000ff af4d4b37 0dd229ea ff752d36
!	Mem[00000000300c1420] = 2fb55cc8 4e44ccb9 4a28a146 9653657f
!	Mem[00000000300c1430] = 00000000 00000000 7e000000 587464ff
	ldda	[%i3+%g0]ASI_BLK_AIUSL,%f0 	! Block Load from 00000000300c1400
!	Mem[000000001014143c] = ffffffff, %l7 = ffffffffffffffff, %asi = 80
	lduwa	[%i5+0x03c]%asi,%l7	! %l7 = 00000000ffffffff
!	Mem[0000000030081410] = 0000000000000000, %l1 = 000000000000ffff
	ldxa	[%i2+%o5]0x89,%l1	! %l1 = 0000000000000000
!	Code Fragment 3, seed = 126690
p0_fragment_43:
!	%l0 = 0000000000000000
	setx	0xf93235bccb368316,%g7,%l0 ! %l0 = f93235bccb368316
!	%l1 = 0000000000000000
	setx	0x471ca16c09fd8441,%g7,%l1 ! %l1 = 471ca16c09fd8441
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = f93235bccb368316
	setx	0x52285df3db0c597c,%g7,%l0 ! %l0 = 52285df3db0c597c
!	%l1 = 471ca16c09fd8441
	setx	0x2787ed13277805c7,%g7,%l1 ! %l1 = 2787ed13277805c7
p0_fragment_43_end:
!	Mem[0000000030141408] = ffffffc5ff000000, %l3 = 0000000000000000
	ldxa	[%i5+%o4]0x89,%l3	! %l3 = ffffffc5ff000000
!	Mem[0000000010101420] = 00000031 7e0000ff, %l2 = 00000000, %l3 = ff000000, %asi = 80
	ldda	[%i4+0x020]%asi,%l2	! %l2 = 0000000000000031 000000007e0000ff
!	Mem[0000000010101408] = ff000000, %l7 = 00000000ffffffff
	lduba	[%i4+%o4]0x80,%l7	! %l7 = 00000000000000ff

p0_label_431:
!	Starting 10 instruction Store Burst
!	%f0  = 00000000 70b87b43, %l4 = 00000000000000ff
!	Mem[0000000030081420] = 1df3a8682df625d9
	add	%i2,0x020,%g1
	stda	%f0,[%g1+%l4]ASI_PST16_SL ! Mem[0000000030081420] = 437bb87000000000
!	%l6 = 0000000000000031, immd = 00000838, %y  = fefff4ef
	umul	%l6,0x838,%l2		! %l2 = 00000000000192b8, %y = 00000000
!	%f24 = ff760000 ff000000, Mem[0000000010041410] = 00000000 ffffffff
	stda	%f24,[%i1+%o5]0x80	! Mem[0000000010041410] = ff760000 ff000000
!	Mem[0000000020800001] = ffff42b0, %l0 = 52285df3db0c597c
	ldstub	[%o1+0x001],%l0		! %l0 = 00000000000000ff
!	Mem[0000000010101408] = 000000ff, %l4 = 00000000000000ff
	ldstuba	[%i4+%o4]0x88,%l4	! %l4 = 00000000000000ff
!	%f18 = 00005b0f 7fffffff, %l4 = 00000000000000ff
!	Mem[0000000030141418] = c5acff6b043552ff
	add	%i5,0x018,%g1
	stda	%f18,[%g1+%l4]ASI_PST16_SL ! Mem[0000000030141418] = ffffff7f0f5b0000
!	%l1 = 2787ed13277805c7, Mem[0000000030081400] = 800000ff1c000000
	stxa	%l1,[%i2+%g0]0x89	! Mem[0000000030081400] = 2787ed13277805c7
!	Mem[0000000030181408] = 00000000, %l7 = 00000000000000ff
	ldstuba	[%i6+%o4]0x81,%l7	! %l7 = 0000000000000000
!	%l5 = 0000000000310000, Mem[00000000100c1428] = 00009780ffffffff, %asi = 80
	stxa	%l5,[%i3+0x028]%asi	! Mem[00000000100c1428] = 0000000000310000
!	%l0 = 00000000000000ff, Mem[0000000030141410] = 00009780
	stwa	%l0,[%i5+%o5]0x81	! Mem[0000000030141410] = 000000ff

p0_label_432:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = ff000000, %l6 = 0000000000000031
	ldswa	[%i4+%o4]0x80,%l6	! %l6 = ffffffffff000000
!	Mem[0000000010001408] = ff0000ff00000000, %l1 = 2787ed13277805c7
	ldxa	[%i0+%o4]0x80,%l1	! %l1 = ff0000ff00000000
!	Mem[0000000010101408] = ff000000, %l7 = 0000000000000000
	ldsw	[%i4+%o4],%l7		! %l7 = ffffffffff000000
!	Mem[0000000030141400] = 00000000, %f19 = 7fffffff
	lda	[%i5+%g0]0x81,%f19	! %f19 = 00000000
!	Mem[0000000010101410] = 00000000, %f29 = 00000000
	lda	[%i4+%o5]0x80,%f29	! %f29 = 00000000
!	Mem[0000000030081410] = 00000000, %f23 = ff752d36
	lda	[%i2+%o5]0x89,%f23	! %f23 = 00000000
!	Mem[00000000211c0000] = ffff6b10, %l3 = 000000007e0000ff, %asi = 80
	ldsha	[%o2+0x000]%asi,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010141400] = 000000ff, %l5 = 0000000000310000
	lduba	[%i5+%g0]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030081408] = 0000ffff, %l2 = 00000000000192b8
	ldsba	[%i2+%o4]0x89,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000010081400] = 0000ff0000000000, %l2 = ffffffffffffffff, %asi = 80
	ldxa	[%i2+0x000]%asi,%l2	! %l2 = 0000ff0000000000

p0_label_433:
!	Starting 10 instruction Store Burst
!	Mem[0000000010181420] = 00000000, %l0 = 00000000000000ff, %asi = 80
	swapa	[%i6+0x020]%asi,%l0	! %l0 = 0000000000000000
!	%l4 = 000000ff, %l5 = 000000ff, Mem[0000000010081438] = 00000000 00000000, %asi = 80
	stda	%l4,[%i2+0x038]%asi	! Mem[0000000010081438] = 000000ff 000000ff
!	%l0 = 0000000000000000, Mem[00000000100c1410] = 7e0000ff
	stba	%l0,[%i3+%o5]0x88	! Mem[00000000100c1410] = 7e000000
!	Mem[0000000010041409] = ff000000, %l2 = 0000ff0000000000
	ldstub	[%i1+0x009],%l2		! %l2 = 0000000000000000
!	%l4 = 000000ff, %l5 = 000000ff, Mem[0000000030101408] = ffffff7f 00000000
	stda	%l4,[%i4+%o4]0x81	! Mem[0000000030101408] = 000000ff 000000ff
!	Mem[0000000010041408] = 0000ffff, %l6 = 00000000ff000000
	swapa	[%i1+%o4]0x88,%l6	! %l6 = 000000000000ffff
!	%l6 = 000000000000ffff, Mem[0000000030101410] = 00310000
	stwa	%l6,[%i4+%o5]0x81	! Mem[0000000030101410] = 0000ffff
!	%l7 = ffffffffff000000, Mem[0000000010081400] = 00ff0000
	stwa	%l7,[%i2+%g0]0x88	! Mem[0000000010081400] = ff000000
!	Mem[0000000010181408] = ff000000, %l0 = 0000000000000000
	swapa	[%i6+%o4]0x88,%l0	! %l0 = 00000000ff000000
!	Mem[00000000100c1412] = 0000007e, %l4 = 00000000000000ff
	ldstub	[%i3+0x012],%l4		! %l4 = 0000000000000000

p0_label_434:
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = 374b4daf ff000000, %l6 = 0000ffff, %l7 = ff000000
	ldda	[%i3+%o5]0x89,%l6	! %l6 = 00000000ff000000 00000000374b4daf
!	Mem[0000000010081410] = 31000000, %l3 = ffffffffffffffff
	ldsha	[%i2+%o5]0x80,%l3	! %l3 = 0000000000003100
!	Mem[0000000010181400] = ff000000, %f9  = c85cb52f
	lda	[%i6+%g0]0x80,%f9 	! %f9 = ff000000
!	Mem[0000000030181408] = ff000000d9ffffff, %l0 = 00000000ff000000
	ldxa	[%i6+%o4]0x81,%l0	! %l0 = ff000000d9ffffff
!	%l3 = 0000000000003100, imm = fffffffffffffb33, %l7 = 00000000374b4daf
	addc	%l3,-0x4cd,%l7		! %l7 = 0000000000002c33
!	Mem[0000000010101430] = 00000000 00000000, %l4 = 00000000, %l5 = 000000ff, %asi = 80
	ldda	[%i4+0x030]%asi,%l4	! %l4 = 0000000000000000 0000000000000000
!	Mem[000000001008140c] = 00000100, %f11 = 46a1284a
	ld	[%i2+0x00c],%f11	! %f11 = 00000100
!	Mem[00000000300c1410] = ff000000, %l1 = ff0000ff00000000
	ldswa	[%i3+%o5]0x89,%l1	! %l1 = ffffffffff000000
!	Mem[0000000021800181] = 65ff3a60, %l2 = 0000000000000000, %asi = 80
	lduba	[%o3+0x181]%asi,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030041410] = 00000000, %l0 = ff000000d9ffffff
	ldswa	[%i1+%o5]0x81,%l0	! %l0 = 0000000000000000

p0_label_435:
!	Starting 10 instruction Store Burst
!	%l6 = 00000000ff000000, Mem[00000000100c1428] = 00000000
	stw	%l6,[%i3+0x028]		! Mem[00000000100c1428] = ff000000
!	Mem[00000000211c0000] = ffff6b10, %l0 = 0000000000000000
	ldstub	[%o2+%g0],%l0		! %l0 = 00000000000000ff
!	%f14 = ff647458 0000007e, %l3 = 0000000000003100
!	Mem[0000000010101408] = ff00000000000000
	add	%i4,0x008,%g1
	stda	%f14,[%g1+%l3]ASI_PST16_P ! Mem[0000000010101408] = ff00000000000000
!	%l6 = 00000000ff000000, Mem[0000000030141408] = 000000ff
	stwa	%l6,[%i5+%o4]0x81	! Mem[0000000030141408] = ff000000
!	%f20 = ff000031 0000007e, Mem[0000000010081410] = 00000031 00000022
	stda	%f20,[%i2+%o5]0x88	! Mem[0000000010081410] = ff000031 0000007e
!	%l2 = 00000000000000ff, Mem[0000000030041408] = 0000000000000000
	stxa	%l2,[%i1+%o4]0x81	! Mem[0000000030041408] = 00000000000000ff
!	Mem[0000000010001418] = 314aa6da, %l3 = 00003100, %l5 = 00000000
	add	%i0,0x18,%g1
	casa	[%g1]0x80,%l3,%l5	! %l5 = 00000000314aa6da
	membar	#Sync			! Added by membar checker (82)
!	%l6 = 00000000ff000000, Mem[00000000300c1410] = ff000000
	stwa	%l6,[%i3+%o5]0x89	! Mem[00000000300c1410] = ff000000
!	%f30 = ff000000 80000000, Mem[0000000010101408] = 000000ff 00000000
	stda	%f30,[%i4+%o4]0x88	! Mem[0000000010101408] = ff000000 80000000
!	Mem[0000000010181418] = 00005b0f, %l2 = 00000000000000ff
	swap	[%i6+0x018],%l2		! %l2 = 0000000000005b0f

p0_label_436:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101418] = 00ff00ff 00009780, %l2 = 00005b0f, %l3 = 00003100, %asi = 80
	ldda	[%i4+0x018]%asi,%l2	! %l2 = 0000000000ff00ff 0000000000009780
!	Mem[00000000100c1408] = 4a3100ff 00000054, %l2 = 00ff00ff, %l3 = 00009780
	ldda	[%i3+%o4]0x80,%l2	! %l2 = 000000004a3100ff 0000000000000054
!	Mem[0000000010001400] = ff00ffff 000000da, %l6 = ff000000, %l7 = 00002c33, %asi = 80
	ldda	[%i0+0x000]%asi,%l6	! %l6 = 00000000ff00ffff 00000000000000da
!	Mem[0000000030001410] = 00000022 00ff0000, %l0 = 000000ff, %l1 = ff000000
	ldda	[%i0+%o5]0x89,%l0	! %l0 = 0000000000ff0000 0000000000000022
!	Mem[00000000300c1400] = 437bb870, %l5 = 00000000314aa6da
	ldsba	[%i3+%g0]0x81,%l5	! %l5 = 0000000000000043
!	Mem[0000000030181400] = 00000000, %l7 = 00000000000000da
	lduha	[%i6+%g0]0x81,%l7	! %l7 = 0000000000000000
!	Mem[00000000100c1418] = 00000000, %l0 = 0000000000ff0000
	ldub	[%i3+0x018],%l0		! %l0 = 0000000000000000
!	Mem[0000000010001410] = 314aa6daffffffff, %l4 = 0000000000000000
	ldxa	[%i0+%o5]0x88,%l4	! %l4 = 314aa6daffffffff
!	Mem[00000000201c0000] = 00ffe880, %l1 = 0000000000000022, %asi = 80
	ldsha	[%o0+0x000]%asi,%l1	! %l1 = 00000000000000ff
!	%l7 = 0000000000000000, %l0 = 0000000000000000, %l4 = 314aa6daffffffff
	sub	%l7,%l0,%l4		! %l4 = 0000000000000000

p0_label_437:
!	Starting 10 instruction Store Burst
!	Mem[0000000020800000] = ffff42b0, %l2 = 000000004a3100ff
	ldstub	[%o1+%g0],%l2		! %l2 = 00000000000000ff
!	%l3 = 0000000000000054, Mem[0000000020800000] = ffff42b0, %asi = 80
	stha	%l3,[%o1+0x000]%asi	! Mem[0000000020800000] = 005442b0
!	Mem[0000000010001435] = 0b14976b, %l6 = 00000000ff00ffff
	ldstub	[%i0+0x035],%l6		! %l6 = 0000000000000014
!	Mem[00000000100c1410] = 0000ff7e, %l3 = 0000000000000054
	ldstuba	[%i3+%o5]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000030141410] = 000000ff, %l2 = 00000000000000ff
	swapa	[%i5+%o5]0x81,%l2	! %l2 = 00000000000000ff
!	%f12 = 00000000, Mem[0000000030181400] = 00000000
	sta	%f12,[%i6+%g0]0x81	! Mem[0000000030181400] = 00000000
!	%f20 = ff000031 0000007e, %l7 = 0000000000000000
!	Mem[0000000030001418] = ff7bb87000000100
	add	%i0,0x018,%g1
	stda	%f20,[%g1+%l7]ASI_PST8_SL ! Mem[0000000030001418] = ff7bb87000000100
!	%l5 = 0000000000000043, Mem[0000000010081400] = 000000ff00000000
	stxa	%l5,[%i2+%g0]0x80	! Mem[0000000010081400] = 0000000000000043
!	%l2 = 00000000000000ff, Mem[0000000030141410] = ff000000
	stha	%l2,[%i5+%o5]0x89	! Mem[0000000030141410] = ff0000ff
!	%f26 = 54000000 9653657f, Mem[0000000030081410] = 00000000 00000000
	stda	%f26,[%i2+%o5]0x89	! Mem[0000000030081410] = 54000000 9653657f

p0_label_438:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = 0000ff00, %l7 = 0000000000000000
	lduwa	[%i5+%o4]0x80,%l7	! %l7 = 000000000000ff00
!	Mem[0000000010081408] = 00010000 58fa12e6, %l4 = 00000000, %l5 = 00000043
	ldda	[%i2+%o4]0x88,%l4	! %l4 = 0000000058fa12e6 0000000000010000
!	Mem[0000000030081408] = 000000ff 0000ffff, %l0 = 00000000, %l1 = 000000ff
	ldda	[%i2+%o4]0x89,%l0	! %l0 = 000000000000ffff 00000000000000ff
!	Mem[0000000010181400] = ff000000ffff0000, %l7 = 000000000000ff00
	ldxa	[%i6+%g0]0x80,%l7	! %l7 = ff000000ffff0000
!	Mem[00000000100c1400] = ff000000, %l3 = 0000000000000000
	lduba	[%i3+%g0]0x88,%l3	! %l3 = 0000000000000000
!	%l6 = 0000000000000014, %l6 = 0000000000000014, %l5 = 0000000000010000
	andn	%l6,%l6,%l5		! %l5 = 0000000000000000
!	Mem[0000000010041434] = 00000000, %f18 = 00005b0f
	lda	[%i1+0x034]%asi,%f18	! %f18 = 00000000
!	Mem[0000000030001400] = 00000000 00ff0000, %l4 = 58fa12e6, %l5 = 00000000
	ldda	[%i0+%g0]0x89,%l4	! %l4 = 0000000000ff0000 0000000000000000
!	Mem[0000000030041400] = 00000000 00000031 00000000 000000ff
!	Mem[0000000030041410] = 00000000 000000ff 4bad6d62 389c3533
!	Mem[0000000030041420] = ffffe36a 000007df ffd3f3cc 9664009b
!	Mem[0000000030041430] = 0025f600 00a8f31d 4bad6d62 1d10ac3a
	ldda	[%i1+%g0]ASI_BLK_SL,%f0 	! Block Load from 0000000030041400
!	Mem[0000000010081410] = 0000007e, %f27 = 9653657f
	lda	[%i2+%o5]0x88,%f27	! %f27 = 0000007e

p0_label_439:
!	Starting 10 instruction Store Burst
!	%l6 = 0000000000000014, Mem[00000000211c0000] = ffff6b10
	stb	%l6,[%o2+%g0]		! Mem[00000000211c0000] = 14ff6b10
!	%l5 = 0000000000000000, Mem[00000000300c1400] = 437bb87000000000
	stxa	%l5,[%i3+%g0]0x81	! Mem[00000000300c1400] = 0000000000000000
!	Mem[0000000010181400] = 000000ff, %l7 = 00000000ffff0000
	swapa	[%i6+%g0]0x88,%l7	! %l7 = 00000000000000ff
!	%l3 = 0000000000000000, Mem[0000000030001410] = 0000ff00
	stha	%l3,[%i0+%o5]0x81	! Mem[0000000030001410] = 0000ff00
!	Mem[0000000010181400] = 0000ffff ffff0000 00000000 000076ff
!	%f0  = 31000000 00000000 ff000000 00000000
!	%f4  = ff000000 00000000 33359c38 626dad4b
!	%f8  = df070000 6ae3ffff 9b006496 ccf3d3ff
!	%f12 = 1df3a800 00f62500 3aac101d 626dad4b
	stda	%f0 ,[%i6+%g0]ASI_BLK_PL	! Block Store to 0000000010181400
!	Mem[00000000300c1400] = 00000000, %l7 = 00000000000000ff
	ldstuba	[%i3+%g0]0x89,%l7	! %l7 = 0000000000000000
!	%l6 = 0000000000000014, Mem[0000000010181420] = ffffe36a000007df
	stx	%l6,[%i6+0x020]		! Mem[0000000010181420] = 0000000000000014
!	Mem[0000000020800000] = 005442b0, %l3 = 0000000000000000
	ldstub	[%o1+%g0],%l3		! %l3 = 0000000000000000
!	Mem[0000000030081410] = 9653657f, %l4 = 0000000000ff0000
	ldstuba	[%i2+%o5]0x89,%l4	! %l4 = 000000000000007f
!	Mem[0000000030141408] = ff000000, %l2 = 00000000000000ff
	ldstuba	[%i5+%o4]0x81,%l2	! %l2 = 00000000000000ff

p0_label_440:
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = 00970000, %l3 = 0000000000000000
	ldswa	[%i4+%g0]0x81,%l3	! %l3 = 0000000000970000
!	Mem[00000000100c1400] = ff000000, %l0 = 000000000000ffff
	ldsha	[%i3+%g0]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000030041400] = 0000000000000031, %l2 = 00000000000000ff
	ldxa	[%i1+%g0]0x81,%l2	! %l2 = 0000000000000031
	membar	#Sync			! Added by membar checker (83)
!	Mem[0000000030001400] = 0000ff00 00000000 437bb870 00000100
!	Mem[0000000030001410] = 0000ff00 22000000 ff7bb870 00000100
!	Mem[0000000030001420] = ff0000ff ff000000 000000ff 00000000
!	Mem[0000000030001430] = 00000000 00000000 00000000 70b87b43
	ldda	[%i0+%g0]ASI_BLK_AIUSL,%f0 	! Block Load from 0000000030001400
!	Mem[0000000010101420] = 00000031, %l0 = 0000000000000000
	ldsw	[%i4+0x020],%l0		! %l0 = 0000000000000031
!	%f0  = 00000000 00ff0000, %f21 = 0000007e
	fdtoi	%f0 ,%f21		! tt=0x22, %l0 = 0000000000000053
!	Mem[0000000030181408] = ff000000 d9ffffff, %l4 = 0000007f, %l5 = 00000000
	ldda	[%i6+%o4]0x81,%l4	! %l4 = 00000000ff000000 00000000d9ffffff
!	Mem[0000000010081430] = 58fa12e6, %f28 = ff000000
	ld	[%i2+0x030],%f28	! %f28 = 58fa12e6
!	Mem[0000000010101438] = ff00007e, %f24 = ff760000
	ld	[%i4+0x038],%f24	! %f24 = ff00007e
!	Mem[0000000030001408] = 437bb870, %f17 = 00000000
	lda	[%i0+%o4]0x81,%f17	! %f17 = 437bb870

p0_label_441:
!	Starting 10 instruction Store Burst
!	%f25 = ff000000, %f10 = 00000000, %f20 = ff000031 0000007e
	fsmuld	%f25,%f10,%f20		! %f20 = 80000000 00000000
!	%l7 = 0000000000000000, Mem[0000000030101400] = 00970000
	stwa	%l7,[%i4+%g0]0x81	! Mem[0000000030101400] = 00000000
!	Mem[0000000010101400] = 000000ff, %l4 = 00000000ff000000
	ldstuba	[%i4+%g0]0x88,%l4	! %l4 = 00000000000000ff
!	%l0 = 0000000000000053, Mem[0000000030081408] = ffff0000ff000000
	stxa	%l0,[%i2+%o4]0x81	! Mem[0000000030081408] = 0000000000000053
!	%f15 = 00000000, Mem[00000000300c1410] = ff000000
	sta	%f15,[%i3+%o5]0x89	! Mem[00000000300c1410] = 00000000
!	%l6 = 00000014, %l7 = 00000000, Mem[0000000010181408] = 00000000 000000ff
	stda	%l6,[%i6+%o4]0x80	! Mem[0000000010181408] = 00000014 00000000
!	Mem[0000000010141420] = 4a3100ff, %l0 = 00000053, %l1 = 000000ff
	add	%i5,0x20,%g1
	casa	[%g1]0x80,%l0,%l1	! %l1 = 000000004a3100ff
!	%l3 = 0000000000970000, Mem[0000000010101428] = 000000ff, %asi = 80
	stwa	%l3,[%i4+0x028]%asi	! Mem[0000000010101428] = 00970000
!	%l2 = 0000000000000031, Mem[0000000030141408] = 000000ff
	stba	%l2,[%i5+%o4]0x89	! Mem[0000000030141408] = 00000031
!	Mem[0000000010001410] = ffffffff, %l0 = 0000000000000053
	ldstuba	[%i0+%o5]0x88,%l0	! %l0 = 00000000000000ff

p0_label_442:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = 00000014 00000000, %l2 = 00000031, %l3 = 00970000
	ldda	[%i6+%o4]0x80,%l2	! %l2 = 0000000000000014 0000000000000000
	membar	#Sync			! Added by membar checker (84)
!	Mem[0000000010001400] = ff00ffff 000000da ff0000ff 00000000
!	Mem[0000000010001410] = ffffffff daa64a31 314aa6da 70b87b43
!	Mem[0000000010001420] = 1df3a868 2df625d9 58fa12e6 1b1d3f9f
!	Mem[0000000010001430] = 00003dff 0bff976b 00fb0000 97000000
	ldda	[%i0+%g0]ASI_BLK_PL,%f16	! Block Load from 0000000010001400
!	Mem[00000000211c0000] = 14ff6b10, %l4 = 00000000000000ff, %asi = 80
	ldsha	[%o2+0x000]%asi,%l4	! %l4 = 00000000000014ff
!	Mem[0000000030141408] = 00000031, %f5  = 00ff0000
	lda	[%i5+%o4]0x89,%f5 	! %f5 = 00000031
!	Mem[0000000030141400] = 00000000, %f4  = 00000022
	lda	[%i5+%g0]0x89,%f4 	! %f4 = 00000000
!	Mem[0000000010141410] = ff00000000000000, %f4  = 00000000 00000031, %asi = 80
	ldda	[%i5+0x010]%asi,%f4 	! %f4  = ff000000 00000000
!	Mem[0000000030041410] = ff00000000000000, %l0 = 00000000000000ff
	ldxa	[%i1+%o5]0x89,%l0	! %l0 = ff00000000000000
!	Mem[0000000030101410] = ffff0000, %l7 = 0000000000000000
	lduwa	[%i4+%o5]0x89,%l7	! %l7 = 00000000ffff0000
!	Mem[0000000010101408] = 00000080000000ff, %f2  = 00010000 70b87b43
	ldda	[%i4+%o4]0x80,%f2 	! %f2  = 00000080 000000ff
!	Mem[0000000010041418] = 0b14976b 70b87b43, %l0 = 00000000, %l1 = 4a3100ff, %asi = 80
	ldda	[%i1+0x018]%asi,%l0	! %l0 = 000000000b14976b 0000000070b87b43

p0_label_443:
!	Starting 10 instruction Store Burst
!	%l0 = 000000000b14976b, Mem[00000000100c1408] = 4a3100ff00000054
	stxa	%l0,[%i3+%o4]0x80	! Mem[00000000100c1408] = 000000000b14976b
!	%f2  = 00000080 000000ff, %l4 = 00000000000014ff
!	Mem[0000000030101428] = dba60000ffffffff
	add	%i4,0x028,%g1
	stda	%f2,[%g1+%l4]ASI_PST8_S ! Mem[0000000030101428] = 00000080000000ff
!	%f24 = d925f62d 68a8f31d, %l0 = 000000000b14976b
!	Mem[0000000010081410] = 7e000000310000ff
	add	%i2,0x010,%g1
	stda	%f24,[%g1+%l0]ASI_PST32_PL ! Mem[0000000010081410] = 1df3a8682df625d9
!	%l2 = 0000000000000014, Mem[0000000010181400] = 0000000000000031
	stxa	%l2,[%i6+%g0]0x80	! Mem[0000000010181400] = 0000000000000014
!	%f30 = 00000097 0000fb00, %l5 = 00000000d9ffffff
!	Mem[0000000030001430] = 0000000000000000
	add	%i0,0x030,%g1
	stda	%f30,[%g1+%l5]ASI_PST32_SL ! Mem[0000000030001430] = 00fb000097000000
!	Mem[0000000030141408] = 00000031, %l7 = 00000000ffff0000
	swapa	[%i5+%o4]0x89,%l7	! %l7 = 0000000000000031
!	%l1 = 0000000070b87b43, Mem[0000000030041408] = 00000000
	stba	%l1,[%i1+%o4]0x89	! Mem[0000000030041408] = 00000043
!	%f8  = 000000ff ff0000ff, Mem[00000000300c1410] = 00000000 374b4daf
	stda	%f8 ,[%i3+%o5]0x89	! Mem[00000000300c1410] = 000000ff ff0000ff
!	%l1 = 0000000070b87b43, Mem[00000000300c1400] = ff00000000000000
	stxa	%l1,[%i3+%g0]0x81	! Mem[00000000300c1400] = 0000000070b87b43
!	%l2 = 00000014, %l3 = 00000000, Mem[0000000010141410] = ff000000 00000000
	stda	%l2,[%i5+%o5]0x80	! Mem[0000000010141410] = 00000014 00000000

p0_label_444:
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = 000000ffff0000ff, %l2 = 0000000000000014
	ldxa	[%i3+%o5]0x89,%l2	! %l2 = 000000ffff0000ff
!	Mem[0000000010141438] = ffffffff ffffffff, %l4 = 000014ff, %l5 = d9ffffff, %asi = 80
	ldda	[%i5+0x038]%asi,%l4	! %l4 = 00000000ffffffff 00000000ffffffff
!	Mem[0000000030081410] = ff655396, %f12 = 00000000
	lda	[%i2+%o5]0x81,%f12	! %f12 = ff655396
!	Mem[00000000218000c0] = 16ff8bd0, %l5 = 00000000ffffffff, %asi = 80
	ldsha	[%o3+0x0c0]%asi,%l5	! %l5 = 00000000000016ff
!	Mem[0000000030041400] = 00000000, %l0 = 000000000b14976b
	ldsha	[%i1+%g0]0x89,%l0	! %l0 = 0000000000000000
!	%l7 = 0000000000000031, %l3 = 0000000000000000, %y  = 00000000
	umul	%l7,%l3,%l2		! %l2 = 0000000000000000, %y = 00000000
!	Mem[00000000300c1400] = 00000000, %f2  = 00000080
	lda	[%i3+%g0]0x81,%f2 	! %f2 = 00000000
!	Mem[0000000030041408] = 43000000, %l7 = 0000000000000031
	lduba	[%i1+%o4]0x81,%l7	! %l7 = 0000000000000043
!	Mem[00000000300c1410] = ff0000ff, %l3 = 0000000000000000
	lduba	[%i3+%o5]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010001410] = 314aa6da ffffffff, %l2 = 00000000, %l3 = 000000ff
	ldda	[%i0+%o5]0x88,%l2	! %l2 = 00000000ffffffff 00000000314aa6da

p0_label_445:
!	Starting 10 instruction Store Burst
!	Mem[0000000010001408] = ff0000ff, %l4 = 00000000ffffffff
	ldstuba	[%i0+%o4]0x88,%l4	! %l4 = 00000000000000ff
!	%f4  = ff000000 00000000, Mem[0000000030081400] = c7057827 13ed8727
	stda	%f4 ,[%i2+%g0]0x81	! Mem[0000000030081400] = ff000000 00000000
!	%l7 = 0000000000000043, %l1 = 0000000070b87b43, %y  = 00000000
	umul	%l7,%l1,%l0		! %l0 = 0000001d80484289, %y = 0000001d
!	Mem[0000000010081410] = 68a8f31d, %l5 = 00000000000016ff
	ldstuba	[%i2+%o5]0x88,%l5	! %l5 = 000000000000001d
!	Mem[0000000010141420] = 4a3100ff, %l4 = 00000000000000ff, %asi = 80
	swapa	[%i5+0x020]%asi,%l4	! %l4 = 000000004a3100ff
!	Mem[0000000030001400] = 00ff0000, %l0 = 0000001d80484289
	ldstuba	[%i0+%g0]0x89,%l0	! %l0 = 0000000000000000
!	%l2 = 00000000ffffffff, %l5 = 000000000000001d, %l7 = 0000000000000043
	andn	%l2,%l5,%l7		! %l7 = 00000000ffffffe2
!	%f14 = 437bb870 00000000, %l5 = 000000000000001d
!	Mem[0000000010101408] = 00000080000000ff
	add	%i4,0x008,%g1
	stda	%f14,[%g1+%l5]ASI_PST8_PL ! Mem[0000000010101408] = 00000000700000ff
!	%l7 = 00000000ffffffe2, imm = fffffffffffff933, %l1 = 0000000070b87b43
	addc	%l7,-0x6cd,%l1		! %l1 = 00000000fffff915
!	Mem[0000000030081400] = 000000ff, %l2 = 00000000ffffffff
	ldstuba	[%i2+%g0]0x89,%l2	! %l2 = 00000000000000ff

p0_label_446:
!	Starting 10 instruction Load Burst
!	%l3 = 00000000314aa6da, %l3 = 00000000314aa6da, %y  = 0000001d
	smul	%l3,%l3,%l2		! %l2 = 097da9a456c771a4, %y = 097da9a4
!	Mem[0000000030181410] = 00000000, %f17 = ffff00ff
	lda	[%i6+%o5]0x89,%f17	! %f17 = 00000000
!	Mem[0000000030001400] = ff00ff00 00000000, %l0 = 00000000, %l1 = fffff915
	ldda	[%i0+%g0]0x81,%l0	! %l0 = 00000000ff00ff00 0000000000000000
!	Mem[00000000100c1418] = 000000006b97140b, %f12 = ff655396 00000000
	ldd	[%i3+0x018],%f12	! %f12 = 00000000 6b97140b
!	Mem[0000000030101400] = 00000000 00003dff, %l6 = 00000014, %l7 = ffffffe2
	ldda	[%i4+%g0]0x81,%l6	! %l6 = 0000000000000000 0000000000003dff
!	Mem[0000000030081400] = 000000ff, %l0 = 00000000ff00ff00
	ldswa	[%i2+%g0]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030141408] = ffff0000, %f2  = 00000000
	lda	[%i5+%o4]0x89,%f2 	! %f2 = ffff0000
!	Mem[0000000030181410] = 00000000, %l5 = 000000000000001d
	ldsba	[%i6+%o5]0x89,%l5	! %l5 = 0000000000000000
!	Mem[000000001010140a] = 00000000, %l6 = 0000000000000000
	lduh	[%i4+0x00a],%l6		! %l6 = 0000000000000000
!	Mem[0000000010001408] = ff0000ff, %l5 = 0000000000000000
	lduba	[%i0+%o4]0x80,%l5	! %l5 = 00000000000000ff

p0_label_447:
!	Starting 10 instruction Store Burst
!	%l6 = 00000000, %l7 = 00003dff, Mem[0000000010081438] = 000000ff 000000ff
	std	%l6,[%i2+0x038]		! Mem[0000000010081438] = 00000000 00003dff
!	Mem[0000000030081408] = 00000000, %l1 = 0000000000000000
	ldstuba	[%i2+%o4]0x89,%l1	! %l1 = 0000000000000000
!	%l0 = 00000000000000ff, Mem[00000000100c1410] = ff00ff7e
	stba	%l0,[%i3+%o5]0x80	! Mem[00000000100c1410] = ff00ff7e
!	Mem[0000000030041410] = 00000000, %l0 = 00000000000000ff
	ldstuba	[%i1+%o5]0x81,%l0	! %l0 = 0000000000000000
!	%l0 = 00000000, %l1 = 00000000, Mem[0000000030001410] = 0000ff00 22000000
	stda	%l0,[%i0+%o5]0x81	! Mem[0000000030001410] = 00000000 00000000
!	Mem[00000000300c1400] = 00000000, %l6 = 0000000000000000
	swapa	[%i3+%g0]0x81,%l6	! %l6 = 0000000000000000
!	%f24 = d925f62d, Mem[0000000030081408] = 000000ff
	sta	%f24,[%i2+%o4]0x89	! Mem[0000000030081408] = d925f62d
	membar	#Sync			! Added by membar checker (85)
!	%l0 = 0000000000000000, Mem[0000000010001400] = ff00ffff
	stba	%l0,[%i0+%g0]0x80	! Mem[0000000010001400] = 0000ffff
!	%f24 = d925f62d 68a8f31d, Mem[0000000030181408] = ff000000 d9ffffff
	stda	%f24,[%i6+%o4]0x81	! Mem[0000000030181408] = d925f62d 68a8f31d
!	%f4  = ff000000, %f10 = 00000000, %f2  = ffff0000
	fdivs	%f4 ,%f10,%f2 		! %f2  = ff800000

p0_label_448:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = 000000ff7eff00ff, %f20 = 314aa6da ffffffff
	ldda	[%i3+%o5]0x88,%f20	! %f20 = 000000ff 7eff00ff
!	Mem[0000000010141408] = 0000ff00, %l2 = 097da9a456c771a4
	lduwa	[%i5+%o4]0x80,%l2	! %l2 = 000000000000ff00
!	Mem[0000000010181400] = 1400000000000000, %f16 = da000000 00000000
	ldda	[%i6+%g0]0x88,%f16	! %f16 = 14000000 00000000
!	%f26 = 9f3f1d1b, %f22 = 437bb870, %f23 = daa64a31
	fdivs	%f26,%f22,%f23		! %f23 = 9b425ce4
!	Mem[00000000211c0000] = 14ff6b10, %l0 = 0000000000000000
	ldsh	[%o2+%g0],%l0		! %l0 = 00000000000014ff
!	Mem[0000000020800000] = ff5442b0, %l6 = 0000000000000000, %asi = 80
	lduha	[%o1+0x000]%asi,%l6	! %l6 = 000000000000ff54
!	Mem[0000000010181410] = 00000000, %l0 = 00000000000014ff
	lduba	[%i6+%o5]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000030101400] = 00000000 00003dff 000000ff 000000ff
!	Mem[0000000030101410] = 0000ffff 00000000 000000ff 00009780
!	Mem[0000000030101420] = 00000000 ff000000 00000080 000000ff
!	Mem[0000000030101430] = ff0000ff 5b0fe295 63ad6ddf 2ca93559
	ldda	[%i4+%g0]ASI_BLK_S,%f0 	! Block Load from 0000000030101400
!	Mem[000000001000143f] = 97000000, %l0 = 0000000000000000, %asi = 80
	lduba	[%i0+0x03f]%asi,%l0	! %l0 = 0000000000000000
!	Mem[0000000010041428] = 00000000000076ff, %l4 = 000000004a3100ff, %asi = 80
	ldxa	[%i1+0x028]%asi,%l4	! %l4 = 00000000000076ff

p0_label_449:
!	Starting 10 instruction Store Burst
!	%l4 = 00000000000076ff, Mem[0000000010001400] = ffff0000
	stwa	%l4,[%i0+%g0]0x88	! Mem[0000000010001400] = 000076ff
	membar	#Sync			! Added by membar checker (86)
!	%l2 = 000000000000ff00, Mem[0000000030101408] = 000000ff
	stha	%l2,[%i4+%o4]0x81	! Mem[0000000030101408] = ff0000ff
!	%l4 = 000076ff, %l5 = 000000ff, Mem[00000000100c1408] = 00000000 0b14976b
	stda	%l4,[%i3+%o4]0x80	! Mem[00000000100c1408] = 000076ff 000000ff
!	%f17 = 00000000, Mem[0000000030081408] = 2df625d9
	sta	%f17,[%i2+%o4]0x81	! Mem[0000000030081408] = 00000000
!	%l4 = 00000000000076ff, Mem[0000000030141400] = 00000000
	stba	%l4,[%i5+%g0]0x81	! Mem[0000000030141400] = ff000000
!	%l0 = 0000000000000000, Mem[0000000010001410] = ffffffff
	stwa	%l0,[%i0+%o5]0x80	! Mem[0000000010001410] = 00000000
!	%l5 = 00000000000000ff, Mem[0000000010081400] = 00000000
	stha	%l5,[%i2+%g0]0x88	! Mem[0000000010081400] = 000000ff
!	%l2 = 000000000000ff00, Mem[0000000010141400] = ff000000000000ff
	stxa	%l2,[%i5+%g0]0x88	! Mem[0000000010141400] = 000000000000ff00
!	Mem[0000000010101400] = ff000000 ffffffff 00000000 700000ff
!	%f16 = 14000000 00000000 00000000 ff0000ff
!	%f20 = 000000ff 7eff00ff 437bb870 9b425ce4
!	%f24 = d925f62d 68a8f31d 9f3f1d1b e612fa58
!	%f28 = 6b97ff0b ff3d0000 00000097 0000fb00
	stda	%f16,[%i4+%g0]ASI_BLK_AIUP	! Block Store to 0000000010101400
!	%l6 = 000000000000ff54, %l7 = 0000000000003dff, %l5 = 00000000000000ff
	udivx	%l6,%l7,%l5		! %l5 = 0000000000000004

p0_label_450:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = ff0000ff00000000, %l0 = 0000000000000000, %asi = 80
	ldxa	[%i0+0x008]%asi,%l0	! %l0 = ff0000ff00000000
!	Mem[0000000010041400] = ff000000 00000000 000000ff 00003dff
!	Mem[0000000010041410] = ff760000 ff000000 0b14976b 70b87b43
!	Mem[0000000010041420] = dbffffff c5acff6b 00000000 000076ff
!	Mem[0000000010041430] = 314aa6ff 00000000 00000000 00008097
	ldda	[%i1+%g0]ASI_BLK_AIUPL,%f16	! Block Load from 0000000010041400
!	Mem[000000001018140d] = 00000000, %l5 = 0000000000000004, %asi = 80
	ldsba	[%i6+0x00d]%asi,%l5	! %l5 = 0000000000000000
!	Mem[0000000010001430] = 00003dff0bff976b, %l7 = 0000000000003dff
	ldx	[%i0+0x030],%l7		! %l7 = 00003dff0bff976b
!	Mem[0000000030101400] = 0000000000003dff, %f2  = 000000ff 000000ff
	ldda	[%i4+%g0]0x81,%f2 	! %f2  = 00000000 00003dff
!	Mem[0000000030181408] = d925f62d, %l5 = 0000000000000000
	lduwa	[%i6+%o4]0x81,%l5	! %l5 = 00000000d925f62d
	membar	#Sync			! Added by membar checker (87)
!	Mem[0000000010101434] = ff3d0000, %l0 = ff0000ff00000000
	lduw	[%i4+0x034],%l0		! %l0 = 00000000ff3d0000
!	Mem[0000000030081408] = 00000000, %l3 = 00000000314aa6da
	lduwa	[%i2+%o4]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000010181400] = 00000000, %l3 = 0000000000000000
	ldsha	[%i6+%g0]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000010181400] = 14000000 00000000, %l2 = 0000ff00, %l3 = 00000000
	ldda	[%i6+%g0]0x88,%l2	! %l2 = 0000000000000000 0000000014000000

p0_label_451:
!	Starting 10 instruction Store Burst
!	Mem[0000000030141410] = ff0000ff, %l6 = 000000000000ff54
	ldstuba	[%i5+%o5]0x89,%l6	! %l6 = 00000000000000ff
!	%l0 = 00000000ff3d0000, Mem[0000000030081410] = 965365ff
	stba	%l0,[%i2+%o5]0x89	! Mem[0000000030081410] = 96536500
!	%f18 = ff3d0000 ff000000, %l0 = 00000000ff3d0000
!	Mem[00000000300c1420] = 2fb55cc84e44ccb9
	add	%i3,0x020,%g1
	stda	%f18,[%g1+%l0]ASI_PST32_S ! Mem[00000000300c1420] = 2fb55cc84e44ccb9
!	%f22 = 437bb870 6b97140b, Mem[0000000030001410] = 00000000 00000000
	stda	%f22,[%i0+%o5]0x89	! Mem[0000000030001410] = 437bb870 6b97140b
!	%f20 = 000000ff 000076ff, Mem[0000000030141408] = ffff0000 ffffffc5
	stda	%f20,[%i5+%o4]0x89	! Mem[0000000030141408] = 000000ff 000076ff
!	Mem[0000000030041410] = ff000000, %l0 = 00000000ff3d0000
	swapa	[%i1+%o5]0x81,%l0	! %l0 = 00000000ff000000
!	%l4 = 00000000000076ff, Mem[000000001014140c] = 00000000
	stw	%l4,[%i5+0x00c]		! Mem[000000001014140c] = 000076ff
!	Code Fragment 3, seed = 509991
p0_fragment_44:
!	%l0 = 00000000ff000000
	setx	0x519324049bdd0dee,%g7,%l0 ! %l0 = 519324049bdd0dee
!	%l1 = 0000000000000000
	setx	0x76fdb5f4e4d8f799,%g7,%l1 ! %l1 = 76fdb5f4e4d8f799
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 519324049bdd0dee
	setx	0xe13ea1637a924d54,%g7,%l0 ! %l0 = e13ea1637a924d54
!	%l1 = 76fdb5f4e4d8f799
	setx	0xfaa3458b9e0a921f,%g7,%l1 ! %l1 = faa3458b9e0a921f
p0_fragment_44_end:
!	Mem[0000000010001408] = ff0000ff, %l6 = 00000000000000ff
	ldstuba	[%i0+%o4]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030141410] = ff0000ff, %l2 = 0000000000000000
	swapa	[%i5+%o5]0x81,%l2	! %l2 = 00000000ff0000ff

p0_label_452:
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (88)
!	Mem[0000000030041400] = 00000000 00000031 43000000 000000ff
!	Mem[0000000030041410] = ff3d0000 000000ff 4bad6d62 389c3533
!	Mem[0000000030041420] = ffffe36a 000007df ffd3f3cc 9664009b
!	Mem[0000000030041430] = 0025f600 00a8f31d 4bad6d62 1d10ac3a
	ldda	[%i1+%g0]ASI_BLK_AIUS,%f16	! Block Load from 0000000030041400
!	Mem[0000000010141410] = 0000000014000000, %l7 = 00003dff0bff976b
	ldxa	[%i5+%o5]0x88,%l7	! %l7 = 0000000014000000
!	Mem[00000000201c0000] = 00ffe880, %l5 = 00000000d925f62d
	ldub	[%o0+%g0],%l5		! %l5 = 0000000000000000
!	Mem[0000000030041400] = 00000000, %l1 = faa3458b9e0a921f
	ldswa	[%i1+%g0]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000030141410] = 00000000, %l2 = 00000000ff0000ff
	lduwa	[%i5+%o5]0x81,%l2	! %l2 = 0000000000000000
!	Mem[00000000201c0001] = 00ffe880, %l3 = 0000000014000000, %asi = 80
	ldsba	[%o0+0x001]%asi,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010101422] = d925f62d, %l3 = ffffffffffffffff
	ldsh	[%i4+0x022],%l3		! %l3 = fffffffffffff62d
!	Mem[0000000010001408] = ff0000ff, %l1 = 0000000000000000
	lduba	[%i0+%o4]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010181417] = 000000ff, %l0 = e13ea1637a924d54, %asi = 80
	lduba	[%i6+0x017]%asi,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030101408] = ff0000ff, %l6 = 00000000000000ff
	ldsha	[%i4+%o4]0x89,%l6	! %l6 = 00000000000000ff

p0_label_453:
!	Starting 10 instruction Store Burst
!	%l1 = 00000000000000ff, Mem[0000000030101400] = 00000000
	stba	%l1,[%i4+%g0]0x89	! Mem[0000000030101400] = 000000ff
!	%l2 = 00000000, %l3 = fffff62d, Mem[00000000100c1400] = ff000000 000000ff
	stda	%l2,[%i3+%g0]0x88	! Mem[00000000100c1400] = 00000000 fffff62d
!	%f15 = 2ca93559, Mem[0000000010141408] = 00ff0000
	sta	%f15,[%i5+%o4]0x88	! Mem[0000000010141408] = 2ca93559
!	%l0 = 000000ff, %l1 = 000000ff, Mem[00000000300c1408] = 31000000 00000000
	stda	%l0,[%i3+%o4]0x89	! Mem[00000000300c1408] = 000000ff 000000ff
!	%l6 = 00000000000000ff, Mem[0000000010141400] = 00ff0000
	stwa	%l6,[%i5+%g0]0x80	! Mem[0000000010141400] = 000000ff
!	%l3 = fffffffffffff62d, Mem[0000000010101435] = ff3d0000
	stb	%l3,[%i4+0x035]		! Mem[0000000010101434] = ff2d0000
!	%l5 = 0000000000000000, Mem[0000000030101408] = ff0000ff
	stba	%l5,[%i4+%o4]0x81	! Mem[0000000030101408] = 000000ff
!	Mem[00000000300c1400] = 00000000, %l3 = 00000000fffff62d
	swapa	[%i3+%g0]0x89,%l3	! %l3 = 0000000000000000
!	Mem[00000000211c0000] = 14ff6b10, %l3 = 0000000000000000
	ldstuba	[%o2+0x000]%asi,%l3	! %l3 = 0000000000000014
!	%l4 = 000076ff, %l5 = 00000000, Mem[0000000030101400] = 000000ff ff3d0000
	stda	%l4,[%i4+%g0]0x89	! Mem[0000000030101400] = 000076ff 00000000

p0_label_454:
!	Starting 10 instruction Load Burst
!	Mem[000000001004143d] = 00008097, %l7 = 0000000014000000
	ldsb	[%i1+0x03d],%l7		! %l7 = 0000000000000000
!	Mem[00000000300c1410] = ff0000ff, %l6 = 00000000000000ff
	ldsba	[%i3+%o5]0x89,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010141400] = 000000ff00000000, %l1 = 00000000000000ff
	ldxa	[%i5+%g0]0x80,%l1	! %l1 = 000000ff00000000
!	Mem[0000000010101410] = 000000ff7eff00ff, %f12 = ff0000ff 5b0fe295
	ldda	[%i4+%o5]0x80,%f12	! %f12 = 000000ff 7eff00ff
!	Mem[0000000030081400] = ff000000, %l7 = 0000000000000000
	ldsba	[%i2+%g0]0x81,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000030141400] = ff000000 00000000 ff760000 ff000000
!	Mem[0000000030141410] = 00000000 00007b00 ffffff7f 0f5b0000
!	Mem[0000000030141420] = d925f62d 68a8f31d 000000ff ffffffff
!	Mem[0000000030141430] = 6b97140b 97809b06 ff000000 a78c9bff
	ldda	[%i5+%g0]ASI_BLK_AIUSL,%f16	! Block Load from 0000000030141400
!	Mem[0000000030041410] = 00003dff, %l6 = ffffffffffffffff
	ldsba	[%i1+%o5]0x89,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010001410] = 00000000, %f14 = 63ad6ddf
	lda	[%i0+0x010]%asi,%f14	! %f14 = 00000000
!	Mem[0000000010081400] = 43000000000000ff, %l4 = 00000000000076ff
	ldxa	[%i2+%g0]0x88,%l4	! %l4 = 43000000000000ff
!	Mem[0000000010041418] = 0b14976b70b87b43, %l0 = 00000000000000ff, %asi = 80
	ldxa	[%i1+0x018]%asi,%l0	! %l0 = 0b14976b70b87b43

p0_label_455:
!	Starting 10 instruction Store Burst
!	Mem[0000000030041408] = 00000043, %l7 = 00000000ffffffff
	swapa	[%i1+%o4]0x89,%l7	! %l7 = 0000000000000043
!	%f14 = 00000000 2ca93559, Mem[0000000010181430] = 0025f600 00a8f31d
	std	%f14,[%i6+0x030]	! Mem[0000000010181430] = 00000000 2ca93559
!	%l4 = 000000ff, %l5 = 00000000, Mem[0000000030181400] = 00000000 da000000
	stda	%l4,[%i6+%g0]0x81	! Mem[0000000030181400] = 000000ff 00000000
!	%f27 = ff000000, Mem[0000000010041410] = 000076ff
	sta	%f27,[%i1+%o5]0x88	! Mem[0000000010041410] = ff000000
!	%l5 = 0000000000000000, Mem[0000000030181408] = d925f62d68a8f31d
	stxa	%l5,[%i6+%o4]0x81	! Mem[0000000030181408] = 0000000000000000
!	%f18 = 000000ff 000076ff, %l1 = 000000ff00000000
!	Mem[0000000010181438] = 4bad6d621d10ac3a
	add	%i6,0x038,%g1
	stda	%f18,[%g1+%l1]ASI_PST32_PL ! Mem[0000000010181438] = 4bad6d621d10ac3a
!	%l1 = 000000ff00000000, Mem[0000000020800040] = ffff18e0, %asi = 80
	stha	%l1,[%o1+0x040]%asi	! Mem[0000000020800040] = 000018e0
!	%f20 = 007b0000 00000000, Mem[00000000300c1408] = 000000ff 000000ff
	stda	%f20,[%i3+%o4]0x89	! Mem[00000000300c1408] = 007b0000 00000000
!	Mem[0000000010141410] = 00000014, %l5 = 0000000000000000
	swapa	[%i5+%o5]0x80,%l5	! %l5 = 0000000000000014
!	%f25 = 2df625d9, %f14 = 00000000, %f0  = 00000000
	fdivs	%f25,%f14,%f0 		! %f0  = 7f800000

p0_label_456:
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = 00000000, %l5 = 0000000000000014
	ldsba	[%i2+%o4]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000010101410] = 000000ff 7eff00ff, %l4 = 000000ff, %l5 = 00000000
	ldda	[%i4+%o5]0x80,%l4	! %l4 = 00000000000000ff 000000007eff00ff
!	Mem[0000000010101408] = 00000000, %f0  = 7f800000
	lda	[%i4+%o4]0x88,%f0 	! %f0 = 00000000
!	Mem[0000000010141410] = 0000000000000000, %l5 = 000000007eff00ff
	ldxa	[%i5+%o5]0x88,%l5	! %l5 = 0000000000000000
	membar	#Sync			! Added by membar checker (89)
!	Mem[0000000010101400] = 14000000 00000000 00000000 ff0000ff
!	Mem[0000000010101410] = 000000ff 7eff00ff 437bb870 9b425ce4
!	Mem[0000000010101420] = d925f62d 68a8f31d 9f3f1d1b e612fa58
!	Mem[0000000010101430] = 6b97ff0b ff2d0000 00000097 0000fb00
	ldda	[%i4+%g0]ASI_BLK_AIUP,%f0 	! Block Load from 0000000010101400
!	Mem[0000000010101408] = 00000000ff0000ff, %l2 = 0000000000000000
	ldxa	[%i4+%o4]0x80,%l2	! %l2 = 00000000ff0000ff
!	Mem[0000000010081434] = ffff0000, %f21 = 00000000
	ld	[%i2+0x034],%f21	! %f21 = ffff0000
!	Mem[0000000010081400] = 000000ff, %l5 = 0000000000000000
	ldsba	[%i2+%g0]0x88,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000030081410] = 00655396, %l1 = 000000ff00000000
	lduba	[%i2+%o5]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000010041410] = 000000ff ff000000, %l6 = ffffffff, %l7 = 00000043, %asi = 80
	ldda	[%i1+0x010]%asi,%l6	! %l6 = 00000000000000ff 00000000ff000000

p0_label_457:
!	Starting 10 instruction Store Burst
!	%f12 = 6b97ff0b ff2d0000, Mem[0000000010081400] = 000000ff 43000000
	stda	%f12,[%i2+%g0]0x88	! Mem[0000000010081400] = 6b97ff0b ff2d0000
!	%l4 = 000000ff, %l5 = ffffffff, Mem[0000000010041410] = ff000000 000000ff
	stda	%l4,[%i1+%o5]0x88	! Mem[0000000010041410] = 000000ff ffffffff
!	Mem[0000000010001408] = ff0000ff, %l3 = 0000000000000014
	swapa	[%i0+%o4]0x80,%l3	! %l3 = 00000000ff0000ff
!	Mem[00000000100c1410] = ff00ff7e, %l4 = 00000000000000ff
	swapa	[%i3+%o5]0x80,%l4	! %l4 = 00000000ff00ff7e
!	%l1 = 0000000000000000, Mem[0000000010081410] = 68a8f3ff
	stba	%l1,[%i2+%o5]0x88	! Mem[0000000010081410] = 68a8f300
	membar	#Sync			! Added by membar checker (90)
!	%l1 = 0000000000000000, Mem[0000000010101410] = 000000ff7eff00ff
	stxa	%l1,[%i4+%o5]0x80	! Mem[0000000010101410] = 0000000000000000
!	%f3  = ff0000ff, Mem[00000000100c1400] = 00000000
	sta	%f3 ,[%i3+%g0]0x80	! Mem[00000000100c1400] = ff0000ff
!	Mem[0000000030001410] = 0b14976b, %l2 = 00000000ff0000ff
	ldstuba	[%i0+%o5]0x81,%l2	! %l2 = 000000000000000b
!	Mem[00000000100c1410] = 000000ff, %l0 = 0b14976b70b87b43
	ldstuba	[%i3+%o5]0x80,%l0	! %l0 = 0000000000000000
!	%l6 = 00000000000000ff, Mem[0000000010141410] = 00000000
	stha	%l6,[%i5+%o5]0x88	! Mem[0000000010141410] = 000000ff

p0_label_458:
!	Starting 10 instruction Load Burst
!	%f2  = 00000000, %f7  = 9b425ce4, %f17 = 000000ff
	fdivs	%f2 ,%f7 ,%f17		! %f17 = 80000000
!	Mem[0000000010001408] = 00000014 00000000, %l0 = 00000000, %l1 = 00000000
	ldda	[%i0+%o4]0x80,%l0	! %l0 = 0000000000000014 0000000000000000
!	Mem[0000000030101410] = 0000ffff, %l1 = 0000000000000000
	ldswa	[%i4+%o5]0x81,%l1	! %l1 = 000000000000ffff
!	Mem[0000000030141408] = ff760000, %l7 = 00000000ff000000
	lduba	[%i5+%o4]0x81,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010101410] = 00000000, %l7 = 00000000000000ff
	ldswa	[%i4+%o5]0x80,%l7	! %l7 = 0000000000000000
!	Mem[00000000100c1400] = fffff62d ff0000ff, %l0 = 00000014, %l1 = 0000ffff
	ldda	[%i3+%g0]0x88,%l0	! %l0 = 00000000ff0000ff 00000000fffff62d
!	Mem[0000000010101408] = 00000000, %l0 = 00000000ff0000ff
	lduha	[%i4+%o4]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000010081439] = 00000000, %l0 = 0000000000000000, %asi = 80
	ldsba	[%i2+0x039]%asi,%l0	! %l0 = 0000000000000000
!	Mem[0000000020800000] = ff5442b0, %l3 = 00000000ff0000ff, %asi = 80
	lduha	[%o1+0x000]%asi,%l3	! %l3 = 000000000000ff54
!	%f9  = 68a8f31d, %f10 = 9f3f1d1b, %f21 = ffff0000
	fsubs	%f9 ,%f10,%f21		! %f21 = 68a8f31d

p0_label_459:
!	Starting 10 instruction Store Burst
!	Mem[0000000010141413] = ff000000, %l3 = 000000000000ff54
	ldstub	[%i5+0x013],%l3		! %l3 = 0000000000000000
!	Mem[0000000010001428] = 58fa12e6, %l2 = 000000000000000b
	swap	[%i0+0x028],%l2		! %l2 = 0000000058fa12e6
!	%l6 = 00000000000000ff, Mem[0000000010001400] = ff760000
	stwa	%l6,[%i0+%g0]0x80	! Mem[0000000010001400] = 000000ff
!	Code Fragment 4, seed = 911456
p0_fragment_45:
!	%l0 = 0000000000000000
	setx	0x572cf4e55bbe9526,%g7,%l0 ! %l0 = 572cf4e55bbe9526
!	%l1 = 00000000fffff62d
	setx	0xea68cfe062fe3951,%g7,%l1 ! %l1 = ea68cfe062fe3951
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 572cf4e55bbe9526
	setx	0xaa359bed7a20418c,%g7,%l0 ! %l0 = aa359bed7a20418c
!	%l1 = ea68cfe062fe3951
	setx	0xf96381971674b0d7,%g7,%l1 ! %l1 = f96381971674b0d7
p0_fragment_45_end:
!	%l0 = 7a20418c, %l1 = 1674b0d7, Mem[0000000010181420] = 00000000 00000014, %asi = 80
	stda	%l0,[%i6+0x020]%asi	! Mem[0000000010181420] = 7a20418c 1674b0d7
!	Mem[0000000030181410] = 00000000, %l7 = 0000000000000000
	swapa	[%i6+%o5]0x89,%l7	! %l7 = 0000000000000000
!	%l1 = f96381971674b0d7, Mem[0000000030041410] = ff3d0000
	stha	%l1,[%i1+%o5]0x81	! Mem[0000000030041410] = b0d70000
!	Mem[0000000030081410] = 00655396, %l3 = 0000000000000000
	swapa	[%i2+%o5]0x81,%l3	! %l3 = 0000000000655396
!	%l4 = 00000000ff00ff7e, Mem[0000000010141436] = 97800000
	sth	%l4,[%i5+0x036]		! Mem[0000000010141434] = 9780ff7e
!	Mem[0000000030041400] = 00000000 00000031 ffffffff 000000ff
!	%f16 = 00000000 80000000 000000ff 000076ff
!	%f20 = 007b0000 68a8f31d 00005b0f 7fffffff
!	%f24 = 1df3a868 2df625d9 ffffffff ff000000
!	%f28 = 069b8097 0b14976b ff9b8ca7 000000ff
	stda	%f16,[%i1+%g0]ASI_BLK_AIUSL	! Block Store to 0000000030041400

p0_label_460:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = ff2d0000, %l5 = ffffffffffffffff
	ldsba	[%i2+%g0]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000010081410] = 00f3a868, %l6 = 00000000000000ff
	lduha	[%i2+%o5]0x80,%l6	! %l6 = 00000000000000f3
!	Mem[0000000030001400] = ff00ff00, %l6 = 00000000000000f3
	ldswa	[%i0+%g0]0x81,%l6	! %l6 = ffffffffff00ff00
!	Mem[00000000300c1408] = 00000000, %l2 = 0000000058fa12e6
	ldsha	[%i3+%o4]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000010001420] = 1df3a868, %f15 = 0000fb00
	lda	[%i0+0x020]%asi,%f15	! %f15 = 1df3a868
!	Mem[0000000010181400] = 00000000, %l5 = 0000000000000000
	lduha	[%i6+%g0]0x88,%l5	! %l5 = 0000000000000000
	membar	#Sync			! Added by membar checker (91)
!	Mem[0000000010041400] = 000000ff, %f2  = 00000000
	lda	[%i1+%g0]0x88,%f2 	! %f2 = 000000ff
!	Mem[0000000030001400] = ff00ff00, %l5 = 0000000000000000
	ldswa	[%i0+%g0]0x81,%l5	! %l5 = ffffffffff00ff00
!	%f31 = 000000ff, %f7  = 9b425ce4
	fcmps	%fcc0,%f31,%f7 		! %fcc0 = 2
!	Mem[00000000100c142e] = 00310000, %l3 = 0000000000655396, %asi = 80
	lduha	[%i3+0x02e]%asi,%l3	! %l3 = 0000000000000000

p0_label_461:
!	Starting 10 instruction Store Burst
!	Mem[0000000010101438] = 00000097, %l3 = 0000000000000000
	swap	[%i4+0x038],%l3		! %l3 = 0000000000000097
!	%l0 = aa359bed7a20418c, Mem[0000000010001420] = 1df3a8682df625d9, %asi = 80
	stxa	%l0,[%i0+0x020]%asi	! Mem[0000000010001420] = aa359bed7a20418c
!	%l5 = ffffffffff00ff00, Mem[0000000010041404] = 00000000
	sth	%l5,[%i1+0x004]		! Mem[0000000010041404] = ff000000
!	%f10 = 9f3f1d1b e612fa58, Mem[0000000010001408] = 14000000 00000000
	stda	%f10,[%i0+%o4]0x88	! Mem[0000000010001408] = 9f3f1d1b e612fa58
!	%l1 = f96381971674b0d7, Mem[0000000030081410] = 5400000000000000
	stxa	%l1,[%i2+%o5]0x89	! Mem[0000000030081410] = f96381971674b0d7
!	%l2 = 0000000000000000, Mem[0000000010101414] = 00000000
	stw	%l2,[%i4+0x014]		! Mem[0000000010101414] = 00000000
!	Mem[0000000021800100] = ffff4a00, %l5 = ffffffffff00ff00
	ldstub	[%o3+0x100],%l5		! %l5 = 00000000000000ff
!	Mem[00000000100c143c] = 31000000, %l4 = 00000000ff00ff7e
	ldstuba	[%i3+0x03c]%asi,%l4	! %l4 = 0000000000000031
!	Mem[0000000010001405] = 000000da, %l1 = f96381971674b0d7
	ldstuba	[%i0+0x005]%asi,%l1	! %l1 = 0000000000000000
!	Mem[0000000010081400] = ff2d0000, %l4 = 0000000000000031
	ldstuba	[%i2+%g0]0x88,%l4	! %l4 = 0000000000000000

p0_label_462:
!	Starting 10 instruction Load Burst
!	Mem[0000000021800000] = ff003940, %l5 = 00000000000000ff, %asi = 80
	ldsba	[%o3+0x000]%asi,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000010041410] = ff000000, %l1 = 0000000000000000
	ldswa	[%i1+%o5]0x80,%l1	! %l1 = ffffffffff000000
!	Mem[0000000010141426] = ff8da6db, %l7 = 0000000000000000, %asi = 80
	ldsha	[%i5+0x026]%asi,%l7	! %l7 = ffffffffffffa6db
!	Mem[0000000030081400] = ff000000, %l4 = 0000000000000000
	ldswa	[%i2+%g0]0x81,%l4	! %l4 = ffffffffff000000
!	Mem[0000000030181408] = 00000000, %l4 = ffffffffff000000
	lduha	[%i6+%o4]0x81,%l4	! %l4 = 0000000000000000
!	Mem[00000000100c1424] = 70b800aa, %l4 = 0000000000000000, %asi = 80
	lduwa	[%i3+0x024]%asi,%l4	! %l4 = 0000000070b800aa
!	Mem[0000000010041430] = 314aa6ff, %l4 = 0000000070b800aa
	ldsh	[%i1+0x030],%l4		! %l4 = 000000000000314a
!	Mem[00000000100c1408] = ff000000 ff760000, %l0 = 7a20418c, %l1 = ff000000
	ldda	[%i3+%o4]0x88,%l0	! %l0 = 00000000ff760000 00000000ff000000
!	Mem[0000000030041408] = ff760000, %l6 = ffffffffff00ff00
	ldsba	[%i1+%o4]0x81,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010001408] = 58fa12e6, %f0  = 14000000
	lda	[%i0+%o4]0x80,%f0 	! %f0 = 58fa12e6

p0_label_463:
!	Starting 10 instruction Store Burst
!	%l5 = ffffffffffffffff, Mem[0000000010041400] = 000000ff
	stha	%l5,[%i1+%g0]0x88	! Mem[0000000010041400] = 0000ffff
!	%f2  = 000000ff ff0000ff, Mem[0000000010001410] = 00000000 daa64a31
	stda	%f2 ,[%i0+%o5]0x80	! Mem[0000000010001410] = 000000ff ff0000ff
!	%l2 = 0000000000000000, Mem[0000000010041410] = ff000000ffffffff
	stxa	%l2,[%i1+%o5]0x80	! Mem[0000000010041410] = 0000000000000000
!	%l6 = ffffffffffffffff, Mem[0000000030181410] = 00000000
	stha	%l6,[%i6+%o5]0x89	! Mem[0000000030181410] = 0000ffff
!	%l0 = 00000000ff760000, Mem[0000000010101400] = 14000000
	stwa	%l0,[%i4+%g0]0x80	! Mem[0000000010101400] = ff760000
!	%l5 = ffffffffffffffff, Mem[0000000030001408] = 70b87b43
	stba	%l5,[%i0+%o4]0x89	! Mem[0000000030001408] = 70b87bff
!	%l6 = ffffffff, %l7 = ffffa6db, Mem[0000000010181418] = 4bad6d62 389c3533
	std	%l6,[%i6+0x018]		! Mem[0000000010181418] = ffffffff ffffa6db
!	Mem[0000000010181400] = 00000000, %l1 = 00000000ff000000
	ldstuba	[%i6+%g0]0x88,%l1	! %l1 = 0000000000000000
!	%f7  = 9b425ce4, Mem[0000000010181410] = 00000000
	sta	%f7 ,[%i6+%o5]0x80	! Mem[0000000010181410] = 9b425ce4
!	%l7 = ffffffffffffa6db, Mem[0000000010041400] = 0000ffff
	stha	%l7,[%i1+%g0]0x88	! Mem[0000000010041400] = 0000a6db

p0_label_464:
!	Starting 10 instruction Load Burst
!	Mem[0000000030181410] = ffff0000ffffff7f, %l5 = ffffffffffffffff
	ldxa	[%i6+%o5]0x81,%l5	! %l5 = ffff0000ffffff7f
!	Mem[0000000010041400] = 0000a6db, %l2 = 0000000000000000
	lduwa	[%i1+%g0]0x88,%l2	! %l2 = 000000000000a6db
!	Mem[0000000030101400] = ff760000, %l7 = ffffffffffffa6db
	ldsha	[%i4+%g0]0x81,%l7	! %l7 = ffffffffffffff76
!	Code Fragment 3, seed = 299327
p0_fragment_46:
!	%l0 = 00000000ff760000
	setx	0xef34faea0d835d2e,%g7,%l0 ! %l0 = ef34faea0d835d2e
!	%l1 = 0000000000000000
	setx	0xa8edd9fd5f4f22d9,%g7,%l1 ! %l1 = a8edd9fd5f4f22d9
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = ef34faea0d835d2e
	setx	0x4e0c8c6cc7019494,%g7,%l0 ! %l0 = 4e0c8c6cc7019494
!	%l1 = a8edd9fd5f4f22d9
	setx	0x54b0f59f6658355f,%g7,%l1 ! %l1 = 54b0f59f6658355f
p0_fragment_46_end:
!	Mem[0000000020800000] = ff5442b0, %l2 = 000000000000a6db
	ldsh	[%o1+%g0],%l2		! %l2 = ffffffffffffff54
!	Mem[0000000010181410] = e45c429b, %l4 = 000000000000314a
	lduwa	[%i6+%o5]0x88,%l4	! %l4 = 00000000e45c429b
!	Mem[0000000010001400] = 000000ff, %l3 = 0000000000000097
	ldswa	[%i0+%g0]0x80,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030081410] = d7b07416, %l1 = 54b0f59f6658355f
	ldsba	[%i2+%o5]0x81,%l1	! %l1 = ffffffffffffffd7
!	Mem[0000000010141408] = 2ca93559, %l3 = 00000000000000ff
	ldswa	[%i5+%o4]0x88,%l3	! %l3 = 000000002ca93559
!	Code Fragment 3, seed = 541240
p0_fragment_47:
!	%l0 = 4e0c8c6cc7019494
	setx	0x2095f49e7ba51e66,%g7,%l0 ! %l0 = 2095f49e7ba51e66
!	%l1 = ffffffffffffffd7
	setx	0x6b4710ba67c77e91,%g7,%l1 ! %l1 = 6b4710ba67c77e91
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 2095f49e7ba51e66
	setx	0x6274919f11ff82cc,%g7,%l0 ! %l0 = 6274919f11ff82cc
!	%l1 = 6b4710ba67c77e91
	setx	0x60e79a5a0a392e17,%g7,%l1 ! %l1 = 60e79a5a0a392e17
p0_fragment_47_end:

p0_label_465:
!	Starting 10 instruction Store Burst
!	%f14 = 00000097 1df3a868, %l5 = ffff0000ffffff7f
!	Mem[0000000010001400] = 000000ff00ff00da
	stda	%f14,[%i0+%l5]ASI_PST32_PL ! Mem[0000000010001400] = 68a8f31d97000000
!	%l2 = ffffffffffffff54, Mem[0000000010141410] = ff0000ff
	sth	%l2,[%i5+%o5]		! Mem[0000000010141410] = ff5400ff
!	Mem[0000000010081401] = ff002dff, %l3 = 000000002ca93559
	ldstuba	[%i2+0x001]%asi,%l3	! %l3 = 0000000000000000
!	%l2 = ffffffffffffff54, Mem[0000000010101408] = 00000000
	stha	%l2,[%i4+%o4]0x80	! Mem[0000000010101408] = ff540000
!	Mem[0000000010141408] = 5935a92c, %l3 = 0000000000000000
	swapa	[%i5+%o4]0x80,%l3	! %l3 = 000000005935a92c
!	%l4 = 00000000e45c429b, %l0 = 6274919f11ff82cc, %l2 = ffffffffffffff54
	sdivx	%l4,%l0,%l2		! %l2 = 0000000000000000
!	Mem[0000000030001410] = ff14976b, %l0 = 6274919f11ff82cc
	ldstuba	[%i0+%o5]0x81,%l0	! %l0 = 00000000000000ff
!	%l5 = ffff0000ffffff7f, Mem[0000000010041418] = 0b14976b70b87b43, %asi = 80
	stxa	%l5,[%i1+0x018]%asi	! Mem[0000000010041418] = ffff0000ffffff7f
!	%f24 = 1df3a868 2df625d9, Mem[0000000030141410] = 00000000 007b0000
	stda	%f24,[%i5+%o5]0x89	! Mem[0000000030141410] = 1df3a868 2df625d9
!	%l3 = 000000005935a92c, Mem[0000000030041400] = 80000000
	stba	%l3,[%i1+%g0]0x89	! Mem[0000000030041400] = 8000002c

p0_label_466:
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = 00000000 000000ff, %l6 = ffffffff, %l7 = ffffff76
	ldda	[%i5+%g0]0x89,%l6	! %l6 = 00000000000000ff 0000000000000000
!	Mem[0000000010041400] = dba60000, %l3 = 000000005935a92c
	lduwa	[%i1+%g0]0x80,%l3	! %l3 = 00000000dba60000
	membar	#Sync			! Added by membar checker (92)
!	Mem[0000000030041400] = 2c000080 00000000 ff760000 ff000000
!	Mem[0000000030041410] = 1df3a868 00007b00 ffffff7f 0f5b0000
!	Mem[0000000030041420] = d925f62d 68a8f31d 000000ff ffffffff
!	Mem[0000000030041430] = 6b97140b 97809b06 ff000000 a78c9bff
	ldda	[%i1+%g0]ASI_BLK_S,%f16	! Block Load from 0000000030041400
!	Mem[0000000030041410] = 1df3a868, %l5 = ffff0000ffffff7f
	lduwa	[%i1+%o5]0x81,%l5	! %l5 = 000000001df3a868
!	Mem[0000000010041408] = ff000000, %l5 = 000000001df3a868
	lduwa	[%i1+%o4]0x88,%l5	! %l5 = 00000000ff000000
!	Mem[0000000010101410] = 00000000, %l2 = 0000000000000000
	lduwa	[%i4+%o5]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000030081400] = 000000ff, %l6 = 00000000000000ff
	lduwa	[%i2+%g0]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010001408] = 58fa12e6 1b1d3f9f, %l0 = 000000ff, %l1 = 0a392e17
	ldda	[%i0+%o4]0x80,%l0	! %l0 = 0000000058fa12e6 000000001b1d3f9f
!	%l7 = 0000000000000000, %l0 = 0000000058fa12e6, %l5 = 00000000ff000000
	sub	%l7,%l0,%l5		! %l5 = ffffffffa705ed1a
!	Mem[00000000201c0001] = 00ffe880, %l5 = ffffffffa705ed1a
	ldsb	[%o0+0x001],%l5		! %l5 = ffffffffffffffff

p0_label_467:
!	Starting 10 instruction Store Burst
!	%l6 = 00000000000000ff, Mem[0000000010081408] = 0001000058fa12e6
	stxa	%l6,[%i2+%o4]0x88	! Mem[0000000010081408] = 00000000000000ff
!	%f4  = 000000ff 7eff00ff, Mem[0000000010181400] = ff000000 00000014
	stda	%f4 ,[%i6+%g0]0x80	! Mem[0000000010181400] = 000000ff 7eff00ff
!	Mem[00000000100c1408] = ff760000, %l2 = 0000000000000000
	swapa	[%i3+%o4]0x88,%l2	! %l2 = 00000000ff760000
!	Mem[000000001018143c] = 1d10ac3a, %l5 = 00000000ffffffff
	swap	[%i6+0x03c],%l5		! %l5 = 000000001d10ac3a
!	%f18 = ff760000 ff000000, Mem[0000000030141400] = ff000000 00000000
	stda	%f18,[%i5+%g0]0x81	! Mem[0000000030141400] = ff760000 ff000000
!	%l7 = 0000000000000000, Mem[0000000010141408] = 00000000
	stwa	%l7,[%i5+%o4]0x88	! Mem[0000000010141408] = 00000000
!	%l6 = 000000ff, %l7 = 00000000, Mem[0000000010141438] = ffffffff ffffffff, %asi = 80
	stda	%l6,[%i5+0x038]%asi	! Mem[0000000010141438] = 000000ff 00000000
!	%f10 = 9f3f1d1b e612fa58, %l6 = 00000000000000ff
!	Mem[00000000100c1418] = 000000006b97140b
	add	%i3,0x018,%g1
	stda	%f10,[%g1+%l6]ASI_PST8_PL ! Mem[00000000100c1418] = 58fa12e61b1d3f9f
!	%l6 = 00000000000000ff, Mem[0000000010141400] = 00000000ff000000
	stxa	%l6,[%i5+%g0]0x88	! Mem[0000000010141400] = 00000000000000ff
!	%l0 = 0000000058fa12e6, Mem[00000000201c0001] = 00ffe880
	stb	%l0,[%o0+0x001]		! Mem[00000000201c0000] = 00e6e880

p0_label_468:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = ff2dffff, %l2 = 00000000ff760000
	ldswa	[%i2+%g0]0x88,%l2	! %l2 = ffffffffff2dffff
!	Mem[0000000010081404] = 0bff976b, %l2 = ffffffffff2dffff, %asi = 80
	lduwa	[%i2+0x004]%asi,%l2	! %l2 = 000000000bff976b
!	Mem[0000000010001414] = ff0000ff, %l5 = 000000001d10ac3a, %asi = 80
	lduwa	[%i0+0x014]%asi,%l5	! %l5 = 00000000ff0000ff
!	Mem[0000000010081410] = 68a8f300, %l4 = 00000000e45c429b
	ldsha	[%i2+%o5]0x88,%l4	! %l4 = fffffffffffff300
!	Mem[0000000021800080] = ffff49a0, %l3 = 00000000dba60000, %asi = 80
	lduha	[%o3+0x080]%asi,%l3	! %l3 = 000000000000ffff
!	Mem[0000000010001410] = ff0000ffff000000, %l6 = 00000000000000ff
	ldxa	[%i0+%o5]0x88,%l6	! %l6 = ff0000ffff000000
!	Mem[0000000030181408] = 0000000000000000, %l4 = fffffffffffff300
	ldxa	[%i6+%o4]0x81,%l4	! %l4 = 0000000000000000
!	%l1 = 000000001b1d3f9f, %l1 = 000000001b1d3f9f, %l7 = 0000000000000000
	subc	%l1,%l1,%l7		! %l7 = 0000000000000000
!	Mem[0000000010101430] = 6b97ff0bff2d0000, %f4  = 000000ff 7eff00ff, %asi = 80
	ldda	[%i4+0x030]%asi,%f4 	! %f4  = 6b97ff0b ff2d0000
!	Mem[0000000010001408] = 58fa12e6, %l4 = 0000000000000000
	ldswa	[%i0+%o4]0x80,%l4	! %l4 = 0000000058fa12e6

p0_label_469:
!	Starting 10 instruction Store Burst
!	%l4 = 58fa12e6, %l5 = ff0000ff, Mem[0000000030001408] = 70b87bff 00010000
	stda	%l4,[%i0+%o4]0x89	! Mem[0000000030001408] = 58fa12e6 ff0000ff
!	%f26 = 000000ff ffffffff, Mem[0000000010181418] = ffffffff ffffa6db
	std	%f26,[%i6+0x018]	! Mem[0000000010181418] = 000000ff ffffffff
	membar	#Sync			! Added by membar checker (93)
!	%l6 = ff000000, %l7 = 00000000, Mem[0000000030041410] = 68a8f31d 007b0000
	stda	%l6,[%i1+%o5]0x89	! Mem[0000000030041410] = ff000000 00000000
!	%l0 = 0000000058fa12e6, Mem[0000000010041410] = 0000000000000000
	stxa	%l0,[%i1+%o5]0x88	! Mem[0000000010041410] = 0000000058fa12e6
!	Mem[0000000010041430] = 314aa6ff, %l6 = 00000000ff000000, %asi = 80
	swapa	[%i1+0x030]%asi,%l6	! %l6 = 00000000314aa6ff
!	Mem[0000000030001410] = ff14976b, %l1 = 000000001b1d3f9f
	swapa	[%i0+%o5]0x81,%l1	! %l1 = 00000000ff14976b
!	Mem[0000000021800001] = ff003940, %l6 = 00000000314aa6ff
	ldstuba	[%o3+0x001]%asi,%l6	! %l6 = 0000000000000000
!	Mem[0000000010181400] = ff000000, %l0 = 0000000058fa12e6
	swapa	[%i6+%g0]0x88,%l0	! %l0 = 00000000ff000000
!	%l7 = 0000000000000000, Mem[0000000030101400] = ff760000
	stha	%l7,[%i4+%g0]0x81	! Mem[0000000030101400] = 00000000
!	Mem[0000000010001400] = 68a8f31d, %l2 = 000000000bff976b
	ldstuba	[%i0+%g0]0x80,%l2	! %l2 = 0000000000000068

p0_label_470:
!	Starting 10 instruction Load Burst
!	%l1 = 00000000ff14976b, imm = fffffffffffffc72, %l3 = 000000000000ffff
	addc	%l1,-0x38e,%l3		! %l3 = 00000000ff1493dd
!	Mem[0000000021800100] = ffff4a00, %l7 = 0000000000000000, %asi = 80
	ldsba	[%o3+0x100]%asi,%l7	! %l7 = ffffffffffffffff
!	Mem[00000000211c0000] = ffff6b10, %l3 = 00000000ff1493dd, %asi = 80
	lduha	[%o2+0x000]%asi,%l3	! %l3 = 000000000000ffff
!	Mem[0000000030141408] = ff760000, %l7 = ffffffffffffffff
	ldsha	[%i5+%o4]0x81,%l7	! %l7 = ffffffffffffff76
!	Mem[000000001014140c] = 000076ff, %l5 = 00000000ff0000ff, %asi = 80
	lduha	[%i5+0x00c]%asi,%l5	! %l5 = 0000000000000000
!	Mem[0000000010001420] = aa359bed, %l1 = 00000000ff14976b
	ldsw	[%i0+0x020],%l1		! %l1 = ffffffffaa359bed
!	Mem[00000000300c1400] = 2df6ffff70b87b43, %f2  = 000000ff ff0000ff
	ldda	[%i3+%g0]0x81,%f2 	! %f2  = 2df6ffff 70b87b43
	membar	#Sync			! Added by membar checker (94)
!	Mem[0000000010181400] = e612fa58 7eff00ff 00000014 00000000
!	Mem[0000000010181410] = 9b425ce4 000000ff 000000ff ffffffff
!	Mem[0000000010181420] = 7a20418c 1674b0d7 ffd3f3cc 9664009b
!	Mem[0000000010181430] = 00000000 2ca93559 4bad6d62 ffffffff
	ldda	[%i6+%g0]ASI_BLK_PL,%f16	! Block Load from 0000000010181400
!	Mem[0000000010181410] = 9b425ce4, %l3 = 000000000000ffff
	lduwa	[%i6+%o5]0x80,%l3	! %l3 = 000000009b425ce4
!	Mem[0000000010141400] = ff000000 00000000, %l6 = 00000000, %l7 = ffffff76
	ldda	[%i5+%g0]0x80,%l6	! %l6 = 00000000ff000000 0000000000000000

p0_label_471:
!	Starting 10 instruction Store Burst
!	%l5 = 0000000000000000, Mem[0000000010001410] = 000000ff
	stwa	%l5,[%i0+%o5]0x80	! Mem[0000000010001410] = 00000000
!	%l7 = 0000000000000000, Mem[0000000030001408] = e612fa58
	stwa	%l7,[%i0+%o4]0x81	! Mem[0000000030001408] = 00000000
!	Mem[0000000010101410] = 00000000, %l3 = 000000009b425ce4
	ldstuba	[%i4+%o5]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000010101408] = ff540000, %l3 = 0000000000000000
	swapa	[%i4+%o4]0x80,%l3	! %l3 = 00000000ff540000
!	%l1 = ffffffffaa359bed, Mem[0000000010081434] = ffff0000, %asi = 80
	stwa	%l1,[%i2+0x034]%asi	! Mem[0000000010081434] = aa359bed
!	Mem[00000000100c1432] = 54fb0000, %l6 = 00000000ff000000
	ldstuba	[%i3+0x032]%asi,%l6	! %l6 = 0000000000000000
!	%l5 = 0000000000000000, Mem[00000000211c0000] = ffff6b10, %asi = 80
	stha	%l5,[%o2+0x000]%asi	! Mem[00000000211c0000] = 00006b10
!	Mem[0000000030101408] = 000000ff, %l0 = 00000000ff000000
	ldstuba	[%i4+%o4]0x81,%l0	! %l0 = 0000000000000000
	membar	#Sync			! Added by membar checker (95)
!	%l4 = 0000000058fa12e6, Mem[0000000010181410] = 9b425ce4
	stwa	%l4,[%i6+%o5]0x80	! Mem[0000000010181410] = 58fa12e6
!	Mem[0000000021800080] = ffff49a0, %l0 = 0000000000000000
	ldstub	[%o3+0x080],%l0		! %l0 = 00000000000000ff

p0_label_472:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1438] = 000000daff000000, %l3 = 00000000ff540000
	ldx	[%i3+0x038],%l3		! %l3 = 000000daff000000
!	Mem[0000000010001410] = 00000000, %l1 = ffffffffaa359bed
	lduba	[%i0+%o5]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000021800141] = 28008430, %l3 = 000000daff000000, %asi = 80
	ldsba	[%o3+0x141]%asi,%l3	! %l3 = 0000000000000000
!	Mem[0000000030041410] = 000000ff, %l2 = 0000000000000068
	lduha	[%i1+%o5]0x81,%l2	! %l2 = 0000000000000000
!	Mem[000000001010140a] = 00000000, %l7 = 0000000000000000
	ldub	[%i4+0x00a],%l7		! %l7 = 0000000000000000
!	Mem[0000000010041408] = 000000ff, %l0 = 00000000000000ff
	lduha	[%i1+%o4]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000010181400] = e612fa58 7eff00ff, %l2 = 00000000, %l3 = 00000000
	ldda	[%i6+%g0]0x80,%l2	! %l2 = 00000000e612fa58 000000007eff00ff
!	Mem[000000001004140c] = 00003dff, %l6 = 0000000000000000, %asi = 80
	ldswa	[%i1+0x00c]%asi,%l6	! %l6 = 0000000000003dff
!	Mem[00000000201c0000] = 00e6e880, %l6 = 0000000000003dff
	lduh	[%o0+%g0],%l6		! %l6 = 00000000000000e6
!	Mem[0000000030081400] = ff00000000000000, %l3 = 000000007eff00ff
	ldxa	[%i2+%g0]0x81,%l3	! %l3 = ff00000000000000

p0_label_473:
!	Starting 10 instruction Store Burst
!	%l4 = 58fa12e6, %l5 = 00000000, Mem[0000000010001400] = 1df3a8ff 00000097
	stda	%l4,[%i0+%g0]0x88	! Mem[0000000010001400] = 58fa12e6 00000000
!	Mem[0000000030101400] = 00000000, %l7 = 0000000000000000
	swapa	[%i4+%g0]0x81,%l7	! %l7 = 0000000000000000
!	Mem[000000001008143a] = 00000000, %l4 = 0000000058fa12e6
	ldstuba	[%i2+0x03a]%asi,%l4	! %l4 = 0000000000000000
!	Mem[00000000100c1410] = ff0000ff, %l1 = 0000000000000000
	ldstuba	[%i3+%o5]0x80,%l1	! %l1 = 00000000000000ff
!	%f21 = e45c429b, Mem[00000000100c1400] = ff0000ff
	sta	%f21,[%i3+%g0]0x80	! Mem[00000000100c1400] = e45c429b
!	%f12 = 6b97ff0b ff2d0000, Mem[0000000010181410] = e612fa58 ff000000
	stda	%f12,[%i6+%o5]0x88	! Mem[0000000010181410] = 6b97ff0b ff2d0000
!	Mem[0000000010001424] = 7a20418c, %l7 = 00000000, %l1 = 000000ff
	add	%i0,0x24,%g1
	casa	[%g1]0x80,%l7,%l1	! %l1 = 000000007a20418c
!	%l7 = 0000000000000000, Mem[0000000010101430] = 6b97ff0b, %asi = 80
	stwa	%l7,[%i4+0x030]%asi	! Mem[0000000010101430] = 00000000
!	%l7 = 0000000000000000, Mem[00000000100c1428] = ff000000, %asi = 80
	stha	%l7,[%i3+0x028]%asi	! Mem[00000000100c1428] = 00000000
!	Mem[0000000010141404] = 00000000, %l0 = 00000000, %l0 = 00000000
	add	%i5,0x04,%g1
	casa	[%g1]0x80,%l0,%l0	! %l0 = 0000000000000000

p0_label_474:
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (96)
!	Mem[0000000010181400] = e612fa58 7eff00ff 00000014 00000000
!	Mem[0000000010181410] = 00002dff 0bff976b 000000ff ffffffff
!	Mem[0000000010181420] = 7a20418c 1674b0d7 ffd3f3cc 9664009b
!	Mem[0000000010181430] = 00000000 2ca93559 4bad6d62 ffffffff
	ldda	[%i6+%g0]ASI_BLK_P,%f16	! Block Load from 0000000010181400
!	Mem[0000000010141410] = ff0054ff, %l3 = ff00000000000000
	lduha	[%i5+%o5]0x88,%l3	! %l3 = 00000000000054ff
!	Mem[0000000030141410] = 2df625d9, %l0 = 0000000000000000
	lduha	[%i5+%o5]0x89,%l0	! %l0 = 00000000000025d9
!	Mem[0000000010081408] = ff000000, %f3  = 70b87b43
	ld	[%i2+%o4],%f3 		! %f3 = ff000000
!	Mem[00000000100c1410] = ff0000ff, %f10 = 9f3f1d1b
	lda	[%i3+%o5]0x88,%f10	! %f10 = ff0000ff
!	Mem[0000000030181400] = ff000000, %l0 = 00000000000025d9
	ldswa	[%i6+%g0]0x89,%l0	! %l0 = ffffffffff000000
!	Mem[00000000100c1434] = 5b0fe295, %l6 = 00000000000000e6
	lduw	[%i3+0x034],%l6		! %l6 = 000000005b0fe295
!	Mem[0000000030081410] = f9638197 1674b0d7, %l0 = ff000000, %l1 = 7a20418c
	ldda	[%i2+%o5]0x89,%l0	! %l0 = 000000001674b0d7 00000000f9638197
!	Mem[0000000010141400] = ff000000 00000000 00000000 000076ff
!	Mem[0000000010141410] = ff5400ff 00000000 44a491d7 ffa64a31
!	Mem[0000000010141420] = 000000ff ff8da6db 000000aa 000000da
!	Mem[0000000010141430] = 6b97140b 9780ff7e 000000ff 00000000
	ldda	[%i5+%g0]ASI_BLK_P,%f16	! Block Load from 0000000010141400
!	Mem[0000000010041408] = ff000000, %l2 = 00000000e612fa58
	ldswa	[%i1+%o4]0x88,%l2	! %l2 = ffffffffff000000

p0_label_475:
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (97)
!	%f28 = 6b97140b 9780ff7e, Mem[0000000010181410] = 00002dff 0bff976b, %asi = 80
	stda	%f28,[%i6+0x010]%asi	! Mem[0000000010181410] = 6b97140b 9780ff7e
!	%l7 = 0000000000000000, Mem[00000000100c1410] = ff0000ff
	stba	%l7,[%i3+%o5]0x88	! Mem[00000000100c1410] = ff000000
!	Mem[0000000030101408] = ff0000ff, %l4 = 0000000000000000
	ldstuba	[%i4+%o4]0x81,%l4	! %l4 = 00000000000000ff
!	Mem[000000001004141c] = ffffff7f, %l7 = 0000000000000000, %asi = 80
	swapa	[%i1+0x01c]%asi,%l7	! %l7 = 00000000ffffff7f
!	Mem[0000000010081430] = 58fa12e6, %l0 = 000000001674b0d7
	ldstub	[%i2+0x030],%l0		! %l0 = 0000000000000058
!	%l7 = 00000000ffffff7f, Mem[00000000300c1410] = ff0000ff
	stwa	%l7,[%i3+%o5]0x81	! Mem[00000000300c1410] = ffffff7f
!	%f12 = 6b97ff0b ff2d0000, Mem[0000000010041400] = dba60000 ff000000
	stda	%f12,[%i1+%g0]0x80	! Mem[0000000010041400] = 6b97ff0b ff2d0000
!	%l0 = 0000000000000058, Mem[0000000010041408] = ff000000
	stba	%l0,[%i1+%o4]0x88	! Mem[0000000010041408] = ff000058
!	%l4 = 00000000000000ff, Mem[00000000201c0001] = 00e6e880
	stb	%l4,[%o0+0x001]		! Mem[00000000201c0000] = 00ffe880
!	%l5 = 0000000000000000, Mem[0000000010181408] = 00000014
	stha	%l5,[%i6+%o4]0x80	! Mem[0000000010181408] = 00000014

p0_label_476:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = e612fa58, %l3 = 00000000000054ff
	ldsb	[%i6+%g0],%l3		! %l3 = ffffffffffffffe6
!	Code Fragment 4, seed = 786440
p0_fragment_48:
!	%l0 = 0000000000000058
	setx	0xc81704e4a6bdffe6,%g7,%l0 ! %l0 = c81704e4a6bdffe6
!	%l1 = 00000000f9638197
	setx	0x5c7549d94248a811,%g7,%l1 ! %l1 = 5c7549d94248a811
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = c81704e4a6bdffe6
	setx	0xd39b0d79db16744c,%g7,%l0 ! %l0 = d39b0d79db16744c
!	%l1 = 5c7549d94248a811
	setx	0xe7d67dc1879b6797,%g7,%l1 ! %l1 = e7d67dc1879b6797
p0_fragment_48_end:
!	Mem[00000000211c0000] = 00006b10, %l0 = d39b0d79db16744c
	lduh	[%o2+%g0],%l0		! %l0 = 0000000000000000
!	Mem[0000000010181408] = 00000014 00000000, %l2 = ff000000, %l3 = ffffffe6
	ldda	[%i6+%o4]0x80,%l2	! %l2 = 0000000000000014 0000000000000000
!	Mem[0000000010181418] = 000000ffffffffff, %f16 = ff000000 00000000, %asi = 80
	ldda	[%i6+0x018]%asi,%f16	! %f16 = 000000ff ffffffff
!	Mem[0000000030181410] = ffff0000, %l0 = 0000000000000000
	ldswa	[%i6+%o5]0x81,%l0	! %l0 = ffffffffffff0000
!	%f3  = ff000000, %f9  = 68a8f31d
	fcmpes	%fcc0,%f3 ,%f9 		! %fcc0 = 1
!	Mem[00000000211c0000] = 00006b10, %l0 = ffffffffffff0000, %asi = 80
	ldsba	[%o2+0x000]%asi,%l0	! %l0 = 0000000000000000
!	Mem[00000000100c142a] = 00000000, %l0 = 0000000000000000
	ldsb	[%i3+0x02a],%l0		! %l0 = 0000000000000000
!	Mem[0000000030041400] = 2c000080, %f12 = 6b97ff0b
	lda	[%i1+%g0]0x81,%f12	! %f12 = 2c000080

p0_label_477:
!	Starting 10 instruction Store Burst
!	%f26 = 000000aa 000000da, Mem[0000000010041410] = e612fa58 00000000, %asi = 80
	stda	%f26,[%i1+0x010]%asi	! Mem[0000000010041410] = 000000aa 000000da
!	%l3 = 0000000000000000, %l5 = 0000000000000000, %y  = 097da9a4
	umul	%l3,%l5,%l2		! %l2 = 0000000000000000, %y = 00000000
!	Mem[0000000030141408] = ff760000, %l4 = 00000000000000ff
	ldstuba	[%i5+%o4]0x81,%l4	! %l4 = 00000000000000ff
!	%l0 = 0000000000000000, Mem[0000000030141410] = 1df3a8682df625d9
	stxa	%l0,[%i5+%o5]0x89	! Mem[0000000030141410] = 0000000000000000
!	%l6 = 000000005b0fe295, imm = fffffffffffffdb5, %l5 = 0000000000000000
	orn	%l6,-0x24b,%l5		! %l5 = 000000005b0fe2df
!	%f20 = ff5400ff 00000000, Mem[00000000100c1400] = e45c429b 2df6ffff
	stda	%f20,[%i3+%g0]0x80	! Mem[00000000100c1400] = ff5400ff 00000000
!	Mem[000000001010142c] = e612fa58, %l6 = 5b0fe295, %l7 = ffffff7f
	add	%i4,0x2c,%g1
	casa	[%g1]0x80,%l6,%l7	! %l7 = 00000000e612fa58
!	%f6  = 437bb870 9b425ce4, Mem[0000000010101400] = ff760000 00000000
	stda	%f6 ,[%i4+%g0]0x80	! Mem[0000000010101400] = 437bb870 9b425ce4
!	%l4 = 00000000000000ff, Mem[0000000030181400] = 000000ff
	stwa	%l4,[%i6+%g0]0x81	! Mem[0000000030181400] = 000000ff
!	%l4 = 00000000000000ff, %l5 = 000000005b0fe2df, %y  = 00000000
	sdiv	%l4,%l5,%l6		! %l6 = 0000000000000000
	mov	%l0,%y			! %y = 00000000

p0_label_478:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = 00000000, %l6 = 0000000000000000
	ldsba	[%i3+%o4]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000010101400] = e45c429b70b87b43, %f6  = 437bb870 9b425ce4
	ldda	[%i4+%g0]0x88,%f6 	! %f6  = e45c429b 70b87b43
!	Mem[0000000010001400] = e612fa58, %l3 = 0000000000000000
	lduba	[%i0+%g0]0x80,%l3	! %l3 = 00000000000000e6
!	Mem[0000000030041400] = 2c000080, %l5 = 000000005b0fe2df
	lduha	[%i1+%g0]0x81,%l5	! %l5 = 0000000000002c00
!	%l7 = 00000000e612fa58, immd = 0000000000000f39, %l108 = 0000000000000004
	sdivx	%l7,0xf39,%l4		! %l4 = 00000000000f1d2a
!	Mem[0000000030181410] = ffff0000ffffff7f, %l2 = 0000000000000000
	ldxa	[%i6+%o5]0x81,%l2	! %l2 = ffff0000ffffff7f
!	Mem[0000000030001400] = ff00ff00, %l4 = 00000000000f1d2a
	ldsha	[%i0+%g0]0x81,%l4	! %l4 = ffffffffffffff00
!	Mem[0000000010041400] = 6b97ff0bff2d0000, %f30 = 000000ff 00000000, %asi = 80
	ldda	[%i1+0x000]%asi,%f30	! %f30 = 6b97ff0b ff2d0000
!	Mem[0000000010101438] = 00000000, %l3 = 00000000000000e6, %asi = 80
	lduwa	[%i4+0x038]%asi,%l3	! %l3 = 0000000000000000
!	Mem[00000000300c1408] = 00000000, %l5 = 0000000000002c00
	ldsha	[%i3+%o4]0x89,%l5	! %l5 = 0000000000000000

p0_label_479:
!	Starting 10 instruction Store Burst
!	%f6  = e45c429b 70b87b43, Mem[0000000030141410] = 00000000 00000000
	stda	%f6 ,[%i5+%o5]0x89	! Mem[0000000030141410] = e45c429b 70b87b43
!	Mem[0000000010081400] = ff2dffff, %l4 = ffffffffffffff00
	ldstuba	[%i2+%g0]0x88,%l4	! %l4 = 00000000000000ff
!	%l6 = 0000000000000000, Mem[0000000010001410] = 00000000
	stha	%l6,[%i0+%o5]0x80	! Mem[0000000010001410] = 00000000
!	Mem[0000000010181410] = 6b97140b, %l1 = e7d67dc1879b6797
	ldstuba	[%i6+%o5]0x80,%l1	! %l1 = 000000000000006b
!	Mem[00000000300c1408] = 00000000, %l0 = 0000000000000000
	ldstuba	[%i3+%o4]0x81,%l0	! %l0 = 0000000000000000
!	%l1 = 000000000000006b, Mem[00000000201c0000] = 00ffe880
	stb	%l1,[%o0+%g0]		! Mem[00000000201c0000] = 6bffe880
!	Mem[0000000010081400] = ffff2dff, %l1 = 000000000000006b
	ldstuba	[%i2+%g0]0x80,%l1	! %l1 = 00000000000000ff
!	%l5 = 0000000000000000, Mem[000000001010141a] = 437bb870
	sth	%l5,[%i4+0x01a]		! Mem[0000000010101418] = 437b0000
!	%l1 = 00000000000000ff, Mem[0000000010141408] = 00000000
	stwa	%l1,[%i5+%o4]0x88	! Mem[0000000010141408] = 000000ff
!	Mem[00000000201c0001] = 6bffe880, %l2 = ffff0000ffffff7f
	ldstub	[%o0+0x001],%l2		! %l2 = 00000000000000ff

p0_label_480:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = ff000000, %f2  = 2df6ffff
	lda	[%i3+%o5]0x88,%f2 	! %f2 = ff000000
!	Mem[0000000010181410] = 0b1497ff, %l6 = 0000000000000000
	ldswa	[%i6+%o5]0x88,%l6	! %l6 = 000000000b1497ff
!	Mem[0000000010001438] = 00fb0000, %l3 = 0000000000000000, %asi = 80
	ldsba	[%i0+0x038]%asi,%l3	! %l3 = 0000000000000000
!	Mem[0000000010081410] = 00f3a868, %l0 = 0000000000000000
	lduba	[%i2+%o5]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000010001410] = 00000000, %l3 = 0000000000000000
	ldsba	[%i0+%o5]0x80,%l3	! %l3 = 0000000000000000
!	%l6 = 000000000b1497ff, %l1 = 00000000000000ff, %l4 = 00000000000000ff
	andn	%l6,%l1,%l4		! %l4 = 000000000b149700
!	Mem[0000000010181400] = 58fa12e6, %l7 = 00000000e612fa58
	lduha	[%i6+%g0]0x88,%l7	! %l7 = 00000000000012e6
!	Mem[0000000010041408] = 580000ff, %l2 = 00000000000000ff
	lduwa	[%i1+%o4]0x80,%l2	! %l2 = 00000000580000ff
!	Mem[0000000030001400] = ff00ff00, %l3 = 0000000000000000
	lduwa	[%i0+%g0]0x81,%l3	! %l3 = 00000000ff00ff00
!	Mem[0000000030101410] = ffff0000, %l5 = 0000000000000000
	lduba	[%i4+%o5]0x89,%l5	! %l5 = 0000000000000000

p0_label_481:
!	Starting 10 instruction Store Burst
!	Mem[00000000201c0001] = 6bffe880, %l4 = 000000000b149700
	ldstub	[%o0+0x001],%l4		! %l4 = 00000000000000ff
!	%l7 = 00000000000012e6, Mem[0000000010181408] = 0000000014000000
	stxa	%l7,[%i6+%o4]0x88	! Mem[0000000010181408] = 00000000000012e6
!	%l3 = 00000000ff00ff00, Mem[0000000030041410] = ff000000
	stba	%l3,[%i1+%o5]0x89	! Mem[0000000030041410] = ff000000
!	%l7 = 00000000000012e6, Mem[0000000030181400] = ff000000
	stwa	%l7,[%i6+%g0]0x89	! Mem[0000000030181400] = 000012e6
!	Mem[0000000010141400] = ff000000, %l4 = 00000000000000ff
	swapa	[%i5+%g0]0x80,%l4	! %l4 = 00000000ff000000
!	Mem[0000000010181400] = e612fa58 7eff00ff e6120000 00000000
!	%f16 = 000000ff ffffffff 00000000 000076ff
!	%f20 = ff5400ff 00000000 44a491d7 ffa64a31
!	%f24 = 000000ff ff8da6db 000000aa 000000da
!	%f28 = 6b97140b 9780ff7e 6b97ff0b ff2d0000
	stda	%f16,[%i6+%g0]ASI_COMMIT_P	! Block Store to 0000000010181400
!	Mem[00000000100c1408] = 00000000, %l5 = 0000000000000000
	ldstuba	[%i3+%o4]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000010181400] = 000000ff ffffffff 00000000 000076ff
!	%f16 = 000000ff ffffffff 00000000 000076ff
!	%f20 = ff5400ff 00000000 44a491d7 ffa64a31
!	%f24 = 000000ff ff8da6db 000000aa 000000da
!	%f28 = 6b97140b 9780ff7e 6b97ff0b ff2d0000
	stda	%f16,[%i6+%g0]ASI_COMMIT_P	! Block Store to 0000000010181400
!	%l1 = 00000000000000ff, Mem[0000000010001408] = 58fa12e6
	stba	%l1,[%i0+%o4]0x80	! Mem[0000000010001408] = fffa12e6
!	%f6  = e45c429b 70b87b43, %l6 = 000000000b1497ff
!	Mem[0000000030101430] = ff0000ff5b0fe295
	add	%i4,0x030,%g1
	stda	%f6,[%g1+%l6]ASI_PST16_S ! Mem[0000000030101430] = e45c429b70b87b43

p0_label_482:
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (98)
!	Mem[00000000100c1400] = ff5400ff 00000000 ff000000 000000ff
!	Mem[00000000100c1410] = 000000ff ff000000 58fa12e6 1b1d3f9f
!	Mem[00000000100c1420] = 00000000 70b800aa 00000000 00310000
!	Mem[00000000100c1430] = 54fbff00 5b0fe295 000000da ff000000
	ldda	[%i3+%g0]ASI_BLK_P,%f16	! Block Load from 00000000100c1400
!	Mem[0000000010081410] = d925f62d68a8f300, %l3 = 00000000ff00ff00
	ldxa	[%i2+%o5]0x88,%l3	! %l3 = d925f62d68a8f300
!	Mem[0000000030001400] = ff00ff00 00000000 00000000 ff0000ff
!	Mem[0000000030001410] = 1b1d3f9f 70b87b43 ff7bb870 00000100
!	Mem[0000000030001420] = ff0000ff ff000000 000000ff 00000000
!	Mem[0000000030001430] = 00fb0000 97000000 00000000 70b87b43
	ldda	[%i0+%g0]ASI_BLK_SL,%f0 	! Block Load from 0000000030001400
!	Mem[00000000100c1410] = 000000ffff000000, %f18 = ff000000 000000ff
	ldda	[%i3+%o5]0x88,%f18	! %f18 = 000000ff ff000000
!	Mem[0000000010041400] = 00002dff0bff976b, %f30 = 000000da ff000000
	ldda	[%i1+%g0]0x88,%f30	! %f30 = 00002dff 0bff976b
!	Mem[0000000010001400] = 58fa12e6, %l1 = 00000000000000ff
	lduba	[%i0+%g0]0x88,%l1	! %l1 = 00000000000000e6
!	Mem[0000000030001400] = 00ff00ff, %l6 = 000000000b1497ff
	lduwa	[%i0+%g0]0x89,%l6	! %l6 = 0000000000ff00ff
!	Mem[0000000010101410] = 000000ff, %l7 = 00000000000012e6
	lduba	[%i4+%o5]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[000000001010140a] = 00000000, %l5 = 0000000000000000, %asi = 80
	ldsba	[%i4+0x00a]%asi,%l5	! %l5 = 0000000000000000
!	Mem[00000000211c0001] = 00006b10, %l0 = 0000000000000000, %asi = 80
	lduba	[%o2+0x001]%asi,%l0	! %l0 = 0000000000000000

p0_label_483:
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (99)
!	%l2 = 00000000580000ff, Mem[00000000100c1400] = ff5400ff
	stha	%l2,[%i3+%g0]0x80	! Mem[00000000100c1400] = 00ff00ff
!	Mem[00000000100c1422] = 00000000, %l5 = 0000000000000000
	ldstuba	[%i3+0x022]%asi,%l5	! %l5 = 0000000000000000
!	%l4 = 00000000ff000000, Mem[00000000100c1410] = 000000ff
	stha	%l4,[%i3+%o5]0x80	! Mem[00000000100c1410] = 000000ff
!	%f14 = 437bb870 00000000, Mem[0000000010181410] = ff0054ff 00000000
	stda	%f14,[%i6+%o5]0x88	! Mem[0000000010181410] = 437bb870 00000000
!	%l7 = 00000000000000ff, Mem[0000000010081410] = 00f3a868
	stba	%l7,[%i2+%o5]0x80	! Mem[0000000010081410] = fff3a868
!	%l3 = d925f62d68a8f300, Mem[0000000010141418] = 44a491d7
	sth	%l3,[%i5+0x018]		! Mem[0000000010141418] = f30091d7
!	Mem[0000000010101410] = 000000ff, %l3 = d925f62d68a8f300
	ldstuba	[%i4+%o5]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030041410] = 000000ff, %l3 = 00000000000000ff
	ldstuba	[%i1+%o5]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000010041408] = 580000ff, %l4 = 00000000ff000000
	swapa	[%i1+%o4]0x80,%l4	! %l4 = 00000000580000ff
!	Mem[0000000010081400] = ffff2dff, %l3 = 0000000000000000
	ldstuba	[%i2+%g0]0x80,%l3	! %l3 = 00000000000000ff

p0_label_484:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = 58fa12e6, %f4  = 437bb870
	lda	[%i0+%g0]0x88,%f4 	! %f4 = 58fa12e6
!	Mem[0000000010101408] = 00000000, %l5 = 0000000000000000
	lduba	[%i4+%o4]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000030001410] = 9f3f1d1b, %f27 = 00310000
	lda	[%i0+%o5]0x89,%f27	! %f27 = 9f3f1d1b
!	Mem[0000000010041400] = 0bff976b, %l6 = 0000000000ff00ff
	lduwa	[%i1+%g0]0x88,%l6	! %l6 = 000000000bff976b
!	Mem[0000000030181408] = 00000000, %l4 = 00000000580000ff
	lduwa	[%i6+%o4]0x89,%l4	! %l4 = 0000000000000000
!	Mem[00000000100c1410] = 000000ff, %l2 = 00000000580000ff
	lduba	[%i3+%o5]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000010181410] = 00000000, %l6 = 000000000bff976b
	ldsba	[%i6+%o5]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000030001400] = 00ff00ff, %l0 = 0000000000000000
	ldsha	[%i0+%g0]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010141430] = 6b97140b, %l1 = 00000000000000e6
	ldsw	[%i5+0x030],%l1		! %l1 = 000000006b97140b
!	Mem[00000000300c1400] = fffff62d, %l2 = 0000000000000000
	ldsha	[%i3+%g0]0x89,%l2	! %l2 = fffffffffffff62d

p0_label_485:
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1410] = ff000000, %l1 = 000000006b97140b
	swapa	[%i3+%o5]0x88,%l1	! %l1 = 00000000ff000000
!	Mem[0000000010081400] = ff2dffff, %l2 = fffffffffffff62d
	ldstuba	[%i2+%g0]0x88,%l2	! %l2 = 00000000000000ff
!	%l4 = 0000000000000000, Mem[0000000030181410] = 7fffffff0000ffff
	stxa	%l4,[%i6+%o5]0x89	! Mem[0000000030181410] = 0000000000000000
!	Mem[00000000100c1433] = 54fbff00, %l2 = 00000000000000ff
	ldstuba	[%i3+0x033]%asi,%l2	! %l2 = 0000000000000000
!	%l4 = 0000000000000000, Mem[0000000010001410] = 00000000
	stba	%l4,[%i0+%o5]0x88	! Mem[0000000010001410] = 00000000
!	Mem[0000000010181408] = 00000000, %l2 = 0000000000000000
	ldstuba	[%i6+%o4]0x88,%l2	! %l2 = 0000000000000000
!	%l7 = 00000000000000ff, imm = fffffffffffffabc, %l2 = 0000000000000000
	xnor	%l7,-0x544,%l2		! %l2 = 00000000000005bc
!	%l7 = 00000000000000ff, Mem[0000000010041400] = 0bff976b
	stwa	%l7,[%i1+%g0]0x88	! Mem[0000000010041400] = 000000ff
!	%l2 = 00000000000005bc, Mem[0000000030101410] = 00000000ffff0000
	stxa	%l2,[%i4+%o5]0x89	! Mem[0000000030101410] = 00000000000005bc
!	%l0 = 00000000000000ff, Mem[0000000030181408] = 00000000
	stba	%l0,[%i6+%o4]0x81	! Mem[0000000030181408] = ff000000

p0_label_486:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = 00000000ff0000ff, %f20 = 000000ff ff000000
	ldda	[%i4+%o4]0x80,%f20	! %f20 = 00000000 ff0000ff
!	Mem[0000000030101408] = ff0000ff, %l1 = 00000000ff000000
	ldswa	[%i4+%o4]0x81,%l1	! %l1 = ffffffffff0000ff
!	Mem[0000000021800081] = ffff49a0, %l5 = 0000000000000000
	ldsb	[%o3+0x081],%l5		! %l5 = ffffffffffffffff
!	Mem[0000000030041410] = ff0000ff, %l6 = 0000000000000000
	lduwa	[%i1+%o5]0x81,%l6	! %l6 = 00000000ff0000ff
!	Mem[0000000010141400] = ff000000, %l4 = 0000000000000000
	ldsba	[%i5+%g0]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000010141400] = ff000000, %l4 = 0000000000000000
	lduba	[%i5+%g0]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000020800000] = ff5442b0, %l4 = 0000000000000000
	ldsh	[%o1+%g0],%l4		! %l4 = ffffffffffffff54
!	Mem[0000000020800040] = 000018e0, %l5 = ffffffffffffffff
	ldub	[%o1+0x040],%l5		! %l5 = 0000000000000000
!	Mem[0000000010141408] = ff000000000076ff, %l1 = ffffffffff0000ff
	ldxa	[%i5+%o4]0x80,%l1	! %l1 = ff000000000076ff
!	%l0 = 00000000000000ff, %l6 = 00000000ff0000ff, %y  = 00000000
	umul	%l0,%l6,%l2		! %l2 = 000000fe0100fe01, %y = 000000fe

p0_label_487:
!	Starting 10 instruction Store Burst
!	Mem[0000000010141438] = 000000ff, %l6 = ff0000ff, %l4 = ffffff54
	add	%i5,0x38,%g1
	casa	[%g1]0x80,%l6,%l4	! %l4 = 00000000000000ff
!	%l4 = 00000000000000ff, Mem[00000000201c0001] = 6bffe880
	stb	%l4,[%o0+0x001]		! Mem[00000000201c0000] = 6bffe880
!	%l3 = 00000000000000ff, Mem[0000000010081408] = 00000000000000ff
	stxa	%l3,[%i2+%o4]0x88	! Mem[0000000010081408] = 00000000000000ff
!	Mem[0000000010141438] = 000000ff, %l0 = 000000ff, %l6 = ff0000ff
	add	%i5,0x38,%g1
	casa	[%g1]0x80,%l0,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030081400] = ff000000, %l2 = 000000fe0100fe01
	ldstuba	[%i2+%g0]0x81,%l2	! %l2 = 00000000000000ff
!	%l5 = 0000000000000000, Mem[0000000010101410] = 000000ff
	stwa	%l5,[%i4+%o5]0x88	! Mem[0000000010101410] = 00000000
!	%l1 = ff000000000076ff, Mem[0000000030041410] = ff0000ff00000000
	stxa	%l1,[%i1+%o5]0x81	! Mem[0000000030041410] = ff000000000076ff
!	Mem[0000000010081400] = ffff2dff, %l4 = 00000000000000ff
	ldstuba	[%i2+%g0]0x80,%l4	! %l4 = 00000000000000ff
!	%l7 = 00000000000000ff, Mem[00000000201c0000] = 6bffe880, %asi = 80
	stba	%l7,[%o0+0x000]%asi	! Mem[00000000201c0000] = ffffe880
!	%f16 = ff5400ff, Mem[0000000010181400] = 000000ff
	st	%f16,[%i6+%g0]		! Mem[0000000010181400] = ff5400ff

p0_label_488:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = e612fa58 00000000, %l0 = 000000ff, %l1 = 000076ff
	ldda	[%i0+%g0]0x80,%l0	! %l0 = 00000000e612fa58 0000000000000000
!	Mem[0000000020800040] = 000018e0, %l0 = 00000000e612fa58, %asi = 80
	lduha	[%o1+0x040]%asi,%l0	! %l0 = 0000000000000000
!	Mem[0000000030181408] = 000000ff, %l6 = 00000000000000ff
	lduwa	[%i6+%o4]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010101408] = ff0000ff00000000, %f28 = 54fbff00 5b0fe295
	ldda	[%i4+%o4]0x88,%f28	! %f28 = ff0000ff 00000000
!	Mem[0000000010101400] = 70b87b43, %l3 = 00000000000000ff
	lduwa	[%i4+%g0]0x88,%l3	! %l3 = 0000000070b87b43
!	Mem[0000000010081408] = ff000000, %l1 = 0000000000000000
	ldsba	[%i2+%o4]0x80,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000030001400] = ff00ff00 00000000, %l4 = 000000ff, %l5 = 00000000
	ldda	[%i0+%g0]0x81,%l4	! %l4 = 00000000ff00ff00 0000000000000000
!	Mem[0000000010141408] = ff000000000076ff, %l5 = 0000000000000000
	ldxa	[%i5+%o4]0x80,%l5	! %l5 = ff000000000076ff
!	Mem[0000000030041410] = ff000000, %l4 = 00000000ff00ff00
	lduwa	[%i1+%o5]0x81,%l4	! %l4 = 00000000ff000000
!	Mem[00000000100c1408] = ff000000000000ff, %l6 = 00000000000000ff
	ldxa	[%i3+%o4]0x80,%l6	! %l6 = ff000000000000ff

p0_label_489:
!	Starting 10 instruction Store Burst
!	Mem[0000000030001400] = ff00ff00, %l1 = 00000000ffffffff
	swapa	[%i0+%g0]0x81,%l1	! %l1 = 00000000ff00ff00
!	%f6  = 00010000, Mem[0000000030141408] = ff760000
	sta	%f6 ,[%i5+%o4]0x81	! Mem[0000000030141408] = 00010000
!	Mem[00000000100c1400] = 00ff00ff 00000000 ff000000 000000ff
!	%f0  = 00000000 00ff00ff ff0000ff 00000000
!	%f4  = 58fa12e6 9f3f1d1b 00010000 70b87bff
!	%f8  = 000000ff ff0000ff 00000000 ff000000
!	%f12 = 00000097 0000fb00 437bb870 00000000
	stda	%f0 ,[%i3+%g0]ASI_BLK_PL	! Block Store to 00000000100c1400
!	%l2 = 000000ff, %l3 = 70b87b43, Mem[0000000030181410] = 00000000 00000000
	stda	%l2,[%i6+%o5]0x81	! Mem[0000000030181410] = 000000ff 70b87b43
!	%f16 = ff5400ff 00000000, Mem[0000000010081410] = fff3a868 2df625d9
	stda	%f16,[%i2+%o5]0x80	! Mem[0000000010081410] = ff5400ff 00000000
!	%f31 = 0bff976b, %f13 = 0000fb00
	fcmps	%fcc1,%f31,%f13		! %fcc1 = 2
!	Mem[0000000010101400] = 437bb870, %l3 = 0000000070b87b43
	ldstuba	[%i4+%g0]0x80,%l3	! %l3 = 0000000000000043
!	Mem[0000000030041400] = 8000002c, %l4 = 00000000ff000000
	swapa	[%i1+%g0]0x89,%l4	! %l4 = 000000008000002c
!	%f12 = 00000097 0000fb00, %l4 = 000000008000002c
!	Mem[0000000030081438] = 0a80ccb23ff082bb
	add	%i2,0x038,%g1
	stda	%f12,[%g1+%l4]ASI_PST32_SL ! Mem[0000000030081438] = 0a80ccb23ff082bb
!	Mem[0000000020800041] = 000018e0, %l3 = 0000000000000043
	ldstub	[%o1+0x041],%l3		! %l3 = 0000000000000000

p0_label_490:
!	Starting 10 instruction Load Burst
!	%l1 = 00000000ff00ff00, %l4 = 000000008000002c, %l6 = ff000000000000ff
	or	%l1,%l4,%l6		! %l6 = 00000000ff00ff2c
!	Mem[0000000010141408] = ff760000000000ff, %f18 = 000000ff ff000000
	ldda	[%i5+%o4]0x88,%f18	! %f18 = ff760000 000000ff
!	Mem[0000000010101400] = ff7bb8709b425ce4, %l7 = 00000000000000ff
	ldx	[%i4+%g0],%l7		! %l7 = ff7bb8709b425ce4
!	Mem[0000000030081410] = 1674b0d7, %l7 = ff7bb8709b425ce4
	lduha	[%i2+%o5]0x89,%l7	! %l7 = 000000000000b0d7
	membar	#Sync			! Added by membar checker (100)
!	Mem[0000000030181400] = e6120000 00000000 ff000000 00000000
!	Mem[0000000030181410] = 000000ff 70b87b43 000000ff 00009780
!	Mem[0000000030181420] = 00000000 00000000 00009780 ffffffff
!	Mem[0000000030181430] = ff0000ff 5b0fe295 63ad6ddf 2ca93559
	ldda	[%i6+%g0]ASI_BLK_AIUSL,%f16	! Block Load from 0000000030181400
!	Mem[0000000030181400] = e6120000, %l5 = ff000000000076ff
	lduha	[%i6+%g0]0x81,%l5	! %l5 = 000000000000e612
!	Mem[0000000030001400] = ffffffff, %l3 = 0000000000000000
	lduba	[%i0+%g0]0x81,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030001408] = 00000000, %l1 = 00000000ff00ff00
	ldsba	[%i0+%o4]0x81,%l1	! %l1 = 0000000000000000
!	Mem[00000000100c1434] = 97000000, %l2 = 00000000000000ff
	ldsw	[%i3+0x034],%l2		! %l2 = ffffffff97000000
!	Mem[0000000030001400] = ffffffff, %l4 = 000000008000002c
	ldsba	[%i0+%g0]0x81,%l4	! %l4 = ffffffffffffffff

p0_label_491:
!	Starting 10 instruction Store Burst
!	%l0 = 0000000000000000, Mem[0000000010181400] = ff0054ff
	stha	%l0,[%i6+%g0]0x88	! Mem[0000000010181400] = ff000000
!	%l5 = 000000000000e612, Mem[0000000030041408] = ff760000
	stba	%l5,[%i1+%o4]0x81	! Mem[0000000030041408] = 12760000
!	Mem[00000000300c1408] = 000000ff, %l4 = ffffffffffffffff
	ldstuba	[%i3+%o4]0x89,%l4	! %l4 = 00000000000000ff
!	%l7 = 000000000000b0d7, %l3 = 00000000000000ff, %l5 = 000000000000e612
	xnor	%l7,%l3,%l5		! %l5 = ffffffffffff4fd7
!	%f0  = 00000000, Mem[0000000010141408] = ff000000
	sta	%f0 ,[%i5+%o4]0x80	! Mem[0000000010141408] = 00000000
!	%l4 = 00000000000000ff, Mem[00000000100c1408] = 00000000
	stwa	%l4,[%i3+%o4]0x80	! Mem[00000000100c1408] = 000000ff
!	%l2 = ffffffff97000000, Mem[0000000010141408] = 00000000
	stw	%l2,[%i5+%o4]		! Mem[0000000010141408] = 97000000
!	%l0 = 00000000, %l1 = 00000000, Mem[0000000030141408] = 00010000 ff000000
	stda	%l0,[%i5+%o4]0x81	! Mem[0000000030141408] = 00000000 00000000
!	Mem[0000000010081418] = 437bb870, %l0 = 0000000000000000
	ldstuba	[%i2+0x018]%asi,%l0	! %l0 = 0000000000000043
!	%f14 = 437bb870 00000000, %l6 = 00000000ff00ff2c
!	Mem[0000000010001418] = 314aa6da70b87b43
	add	%i0,0x018,%g1
	stda	%f14,[%g1+%l6]ASI_PST8_P ! Mem[0000000010001418] = 314ab8da00007b43

p0_label_492:
!	Starting 10 instruction Load Burst
!	Mem[00000000218001c1] = 00006c90, %l6 = 00000000ff00ff2c, %asi = 80
	ldsba	[%o3+0x1c1]%asi,%l6	! %l6 = 0000000000000000
!	Mem[0000000010081438] = 0000ff00, %l1 = 0000000000000000
	ldsw	[%i2+0x038],%l1		! %l1 = 000000000000ff00
!	Mem[0000000030181400] = e612000000000000, %f0  = 00000000 00ff00ff
	ldda	[%i6+%g0]0x81,%f0 	! %f0  = e6120000 00000000
!	Code Fragment 4, seed = 824920
p0_fragment_49:
!	%l0 = 0000000000000043
	setx	0xb2af4e0090b09d66,%g7,%l0 ! %l0 = b2af4e0090b09d66
!	%l1 = 000000000000ff00
	setx	0x602665edf426cd91,%g7,%l1 ! %l1 = 602665edf426cd91
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = b2af4e0090b09d66
	setx	0x33c290bbdda9a1cc,%g7,%l0 ! %l0 = 33c290bbdda9a1cc
!	%l1 = 602665edf426cd91
	setx	0x08194785e7751d17,%g7,%l1 ! %l1 = 08194785e7751d17
p0_fragment_49_end:
!	Code Fragment 3, seed = 185477
p0_fragment_50:
!	%l0 = 33c290bbdda9a1cc
	setx	0xabc554508ad568fe,%g7,%l0 ! %l0 = abc554508ad568fe
!	%l1 = 08194785e7751d17
	setx	0x4a97d6634dcba5a9,%g7,%l1 ! %l1 = 4a97d6634dcba5a9
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = abc554508ad568fe
	setx	0x049a456e892ade64,%g7,%l0 ! %l0 = 049a456e892ade64
!	%l1 = 4a97d6634dcba5a9
	setx	0xa306d3bfc15f962f,%g7,%l1 ! %l1 = a306d3bfc15f962f
p0_fragment_50_end:
!	Mem[00000000211c0000] = 00006b10, %l2 = ffffffff97000000
	ldsb	[%o2+%g0],%l2		! %l2 = 0000000000000000
!	Mem[000000001014142d] = 000000da, %l1 = a306d3bfc15f962f
	ldub	[%i5+0x02d],%l1		! %l1 = 0000000000000000
!	Mem[0000000030141408] = 0000000000000000, %l2 = 0000000000000000
	ldxa	[%i5+%o4]0x81,%l2	! %l2 = 0000000000000000
!	%f28 = 95e20f5b, %f10 = 00000000, %f20 = 437bb870
	fsubs	%f28,%f10,%f20		! %f20 = 95e20f5b
!	Mem[00000000218001c0] = 00006c90, %l2 = 0000000000000000
	lduh	[%o3+0x1c0],%l2		! %l2 = 0000000000000000

p0_label_493:
!	Starting 10 instruction Store Burst
!	%l6 = 0000000000000000, Mem[0000000010001408] = fffa12e6, %asi = 80
	stha	%l6,[%i0+0x008]%asi	! Mem[0000000010001408] = 000012e6
!	Mem[0000000030001410] = 9f3f1d1b, %l0 = 00000000892ade64
	swapa	[%i0+%o5]0x89,%l0	! %l0 = 000000009f3f1d1b
!	%l2 = 0000000000000000, Mem[0000000010181408] = ff000000
	stba	%l2,[%i6+%o4]0x80	! Mem[0000000010181408] = 00000000
!	Mem[00000000211c0000] = 00006b10, %l1 = 0000000000000000
	ldstub	[%o2+%g0],%l1		! %l1 = 0000000000000000
!	%l2 = 00000000, %l3 = 000000ff, Mem[0000000010041408] = ff000000 00003dff
	stda	%l2,[%i1+%o4]0x80	! Mem[0000000010041408] = 00000000 000000ff
!	Mem[0000000010041410] = 000000aa, %l4 = 00000000000000ff
	swapa	[%i1+%o5]0x80,%l4	! %l4 = 00000000000000aa
!	%l6 = 00000000, %l7 = 0000b0d7, Mem[0000000010181418] = 44a491d7 ffa64a31, %asi = 80
	stda	%l6,[%i6+0x018]%asi	! Mem[0000000010181418] = 00000000 0000b0d7
!	Mem[00000000300c1410] = ffffff7f, %l3 = 00000000000000ff
	swapa	[%i3+%o5]0x81,%l3	! %l3 = 00000000ffffff7f
	membar	#Sync			! Added by membar checker (101)
!	%f23 = ff000000, Mem[0000000030181410] = 000000ff
	sta	%f23,[%i6+%o5]0x81	! Mem[0000000030181410] = ff000000
!	Mem[0000000030101410] = bc050000, %l2 = 0000000000000000
	ldstuba	[%i4+%o5]0x81,%l2	! %l2 = 00000000000000bc

p0_label_494:
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = 00000000, %l4 = 00000000000000aa
	lduwa	[%i4+%g0]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000030081400] = ff000000, %l6 = 0000000000000000
	lduwa	[%i2+%g0]0x81,%l6	! %l6 = 00000000ff000000
!	%f23 = ff000000, %f28 = 95e20f5b
	fcmps	%fcc2,%f23,%f28		! %fcc2 = 1
!	Mem[0000000030181410] = ff000000, %l3 = 00000000ffffff7f
	lduba	[%i6+%o5]0x81,%l3	! %l3 = 00000000000000ff
!	Mem[00000000300c1400] = fffff62d, %f29 = ff0000ff
	lda	[%i3+%g0]0x89,%f29	! %f29 = fffff62d
!	Mem[0000000010041410] = 000000ff, %l1 = 0000000000000000
	ldsba	[%i1+%o5]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000010101408] = ff0000ff 00000000, %l4 = 00000000, %l5 = ffff4fd7
	ldda	[%i4+%o4]0x88,%l4	! %l4 = 0000000000000000 00000000ff0000ff
!	Mem[0000000010101400] = ff7bb870, %l7 = 000000000000b0d7
	ldub	[%i4+%g0],%l7		! %l7 = 00000000000000ff
!	Mem[0000000010001400] = 58fa12e6, %l7 = 00000000000000ff
	lduha	[%i0+%g0]0x88,%l7	! %l7 = 00000000000012e6
!	Mem[0000000010001401] = e612fa58, %l5 = 00000000ff0000ff, %asi = 80
	ldsba	[%i0+0x001]%asi,%l5	! %l5 = 0000000000000012

p0_label_495:
!	Starting 10 instruction Store Burst
!	Mem[0000000010041400] = ff000000, %l6 = 00000000ff000000
	swapa	[%i1+%g0]0x80,%l6	! %l6 = 00000000ff000000
!	%l6 = ff000000, %l7 = 000012e6, Mem[0000000030101408] = ff0000ff 000000ff
	stda	%l6,[%i4+%o4]0x81	! Mem[0000000030101408] = ff000000 000012e6
!	Mem[00000000300c1408] = 000000ff, %l0 = 000000009f3f1d1b
	ldstuba	[%i3+%o4]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030001408] = 00000000, %l6 = 00000000ff000000
	swapa	[%i0+%o4]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000010181400] = ff000000, %l0 = 00000000000000ff
	ldstuba	[%i6+%g0]0x88,%l0	! %l0 = 0000000000000000
!	%f22 = 80970000, Mem[0000000030101410] = 000005ff
	sta	%f22,[%i4+%o5]0x89	! Mem[0000000030101410] = 80970000
!	%l4 = 0000000000000000, Mem[0000000010001408] = 000012e6
	stwa	%l4,[%i0+%o4]0x80	! Mem[0000000010001408] = 00000000
!	%l2 = 00000000000000bc, Mem[0000000030141400] = ff760000
	stwa	%l2,[%i5+%g0]0x81	! Mem[0000000030141400] = 000000bc
!	%f4  = 58fa12e6, Mem[0000000030101410] = 00009780
	sta	%f4 ,[%i4+%o5]0x81	! Mem[0000000030101410] = 58fa12e6
!	%l4 = 00000000, %l5 = 00000012, Mem[00000000100c1410] = 1b1d3f9f e612fa58
	stda	%l4,[%i3+%o5]0x80	! Mem[00000000100c1410] = 00000000 00000012

p0_label_496:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = ff0054ff, %l1 = 0000000000000000
	lduha	[%i5+%o5]0x88,%l1	! %l1 = 00000000000054ff
!	Mem[0000000010101424] = 68a8f31d, %l5 = 0000000000000012, %asi = 80
	lduwa	[%i4+0x024]%asi,%l5	! %l5 = 0000000068a8f31d
!	Mem[0000000010141400] = ff000000, %l4 = 0000000000000000
	lduwa	[%i5+%g0]0x88,%l4	! %l4 = 00000000ff000000
!	Mem[0000000010181408] = 00000000, %l4 = 00000000ff000000
	ldsba	[%i6+%o4]0x80,%l4	! %l4 = 0000000000000000
!	Mem[00000000211c0000] = ff006b10, %l1 = 00000000000054ff, %asi = 80
	ldsba	[%o2+0x000]%asi,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000030081410] = 1674b0d7, %l4 = 0000000000000000
	lduba	[%i2+%o5]0x89,%l4	! %l4 = 00000000000000d7
!	Mem[00000000211c0001] = ff006b10, %l1 = ffffffffffffffff
	ldsb	[%o2+0x001],%l1		! %l1 = 0000000000000000
!	Mem[0000000030141410] = e45c429b70b87b43, %l0 = 0000000000000000
	ldxa	[%i5+%o5]0x89,%l0	! %l0 = e45c429b70b87b43
!	Mem[0000000030081410] = d7b07416, %f30 = 5935a92c
	lda	[%i2+%o5]0x81,%f30	! %f30 = d7b07416
!	Mem[0000000030001408] = ff000000, %l6 = 0000000000000000
	lduha	[%i0+%o4]0x89,%l6	! %l6 = 0000000000000000

p0_label_497:
!	Starting 10 instruction Store Burst
!	%l3 = 00000000000000ff, Mem[0000000010181400] = ff0000ff
	stwa	%l3,[%i6+%g0]0x80	! Mem[0000000010181400] = 000000ff
!	%f30 = d7b07416, Mem[0000000030101400] = 00000000
	sta	%f30,[%i4+%g0]0x89	! Mem[0000000030101400] = d7b07416
!	%l4 = 00000000000000d7, Mem[0000000021800140] = 28008430
	sth	%l4,[%o3+0x140]		! Mem[0000000021800140] = 00d78430
!	%f18 = 00000000 000000ff, Mem[00000000100c1428] = 000000ff 00000000
	std	%f18,[%i3+0x028]	! Mem[00000000100c1428] = 00000000 000000ff
!	Mem[00000000300c1410] = ff000000, %l4 = 00000000000000d7
	ldstuba	[%i3+%o5]0x89,%l4	! %l4 = 0000000000000000
!	%l3 = 00000000000000ff, Mem[000000001000142a] = 0000000b, %asi = 80
	stba	%l3,[%i0+0x02a]%asi	! Mem[0000000010001428] = 0000ff0b
!	Mem[0000000010081400] = ff2dffff, %l7 = 00000000000012e6
	swapa	[%i2+%g0]0x88,%l7	! %l7 = 00000000ff2dffff
!	%l6 = 0000000000000000, Mem[0000000030101410] = e612fa58
	stha	%l6,[%i4+%o5]0x89	! Mem[0000000030101410] = e6120000
!	%l3 = 00000000000000ff, Mem[0000000010101400] = 70b87bff
	stba	%l3,[%i4+%g0]0x88	! Mem[0000000010101400] = 70b87bff
!	Mem[0000000010101408] = 00000000, %l2 = 00000000000000bc
	swap	[%i4+%o4],%l2		! %l2 = 0000000000000000

p0_label_498:
!	Starting 10 instruction Load Burst
!	%l6 = 0000000000000000, %l2 = 0000000000000000, %l2 = 0000000000000000
	sdivx	%l6,%l2,%l2		! Div by zero, %l0 = e45c429b70b87b6b
!	Mem[0000000030081408] = 0000000000000053, %f8  = 000000ff ff0000ff
	ldda	[%i2+%o4]0x81,%f8 	! %f8  = 00000000 00000053
!	Mem[00000000100c1400] = 0000000000ff00ff, %f30 = d7b07416 df6dad63
	ldda	[%i3+%g0]0x88,%f30	! %f30 = 00000000 00ff00ff
!	Mem[00000000100c1414] = 00000012, %l5 = 0000000068a8f31d
	lduh	[%i3+0x014],%l5		! %l5 = 0000000000000000
!	Mem[0000000030101410] = 000012e600000000, %f26 = ffffffff 80970000
	ldda	[%i4+%o5]0x81,%f26	! %f26 = 000012e6 00000000
!	Mem[0000000030181408] = 00000000 000000ff, %l0 = 70b87b6b, %l1 = 00000000
	ldda	[%i6+%o4]0x89,%l0	! %l0 = 00000000000000ff 0000000000000000
!	Mem[0000000030181410] = ff000000 70b87b43, %l4 = 00000000, %l5 = 00000000
	ldda	[%i6+%o5]0x81,%l4	! %l4 = 00000000ff000000 0000000070b87b43
!	Mem[0000000010001408] = 00000000, %l2 = 0000000000000000
	lduha	[%i0+%o4]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000020800000] = ff5442b0, %l6 = 0000000000000000, %asi = 80
	lduba	[%o1+0x000]%asi,%l6	! %l6 = 00000000000000ff
!	Mem[00000000100c143c] = 70b87b43, %f29 = fffff62d
	lda	[%i3+0x03c]%asi,%f29	! %f29 = 70b87b43

p0_label_499:
!	Starting 10 instruction Store Burst
!	%l6 = 00000000000000ff, %l2 = 0000000000000000, %l4 = 00000000ff000000
	orn	%l6,%l2,%l4		! %l4 = ffffffffffffffff
!	%l3 = 00000000000000ff, immd = 0000000000000159, %l108 = 0000000000000002
	udivx	%l3,0x159,%l2		! %l2 = 0000000000000000
!	%f20 = 95e20f5b ff000000, %l7 = 00000000ff2dffff
!	Mem[00000000100c1428] = 00000000000000ff
	add	%i3,0x028,%g1
	stda	%f20,[%g1+%l7]ASI_PST8_PL ! Mem[00000000100c1428] = 000000ff5b0fe295
!	Mem[0000000030181400] = e6120000, %l1 = 0000000000000000
	swapa	[%i6+%g0]0x81,%l1	! %l1 = 00000000e6120000
!	%f20 = 95e20f5b ff000000, Mem[0000000010181400] = ff000000 ffffffff
	stda	%f20,[%i6+%g0]0x88	! Mem[0000000010181400] = 95e20f5b ff000000
!	Mem[0000000010001408] = 00000000, %l6 = 00000000000000ff
	ldstuba	[%i0+%o4]0x88,%l6	! %l6 = 0000000000000000
!	%l0 = 00000000000000ff, Mem[0000000030081410] = d7b07416
	stha	%l0,[%i2+%o5]0x81	! Mem[0000000030081410] = 00ff7416
!	%f14 = 437bb870 00000000, Mem[0000000010081400] = e6120000 0bff976b
	stda	%f14,[%i2+%g0]0x80	! Mem[0000000010081400] = 437bb870 00000000
!	%l0 = 00000000000000ff, Mem[0000000010001410] = 00000000
	stba	%l0,[%i0+%o5]0x88	! Mem[0000000010001410] = 000000ff
!	Mem[0000000010001428] = 0000ff0b, %l4 = ffffffffffffffff
	ldstub	[%i0+0x028],%l4		! %l4 = 0000000000000000

p0_label_500:
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = 70b87b43, %f27 = 00000000
	lda	[%i5+%o5]0x89,%f27	! %f27 = 70b87b43
!	Mem[0000000010141400] = 000000ff, %f11 = ff000000
	lda	[%i5+%g0]0x80,%f11	! %f11 = 000000ff
!	Code Fragment 4, seed = 498864
p0_fragment_51:
!	%l0 = 00000000000000ff
	setx	0xb85caa8a5f6642a6,%g7,%l0 ! %l0 = b85caa8a5f6642a6
!	%l1 = 00000000e6120000
	setx	0x06f73b7cf1c46ed1,%g7,%l1 ! %l1 = 06f73b7cf1c46ed1
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = b85caa8a5f6642a6
	setx	0x1295db20f25e7f0c,%g7,%l0 ! %l0 = 1295db20f25e7f0c
!	%l1 = 06f73b7cf1c46ed1
	setx	0xa8263a04a54c7657,%g7,%l1 ! %l1 = a8263a04a54c7657
p0_fragment_51_end:
!	Mem[0000000030141400] = 000000bc, %l7 = 00000000ff2dffff
	lduwa	[%i5+%g0]0x81,%l7	! %l7 = 00000000000000bc
!	Mem[0000000010001400] = e612fa58, %l2 = 0000000000000000
	lduba	[%i0+%g0]0x80,%l2	! %l2 = 00000000000000e6
!	Mem[0000000010001410] = ff0000ff000000ff, %l5 = 0000000070b87b43
	ldxa	[%i0+%o5]0x88,%l5	! %l5 = ff0000ff000000ff
!	Mem[0000000030041408] = 00007612, %l4 = 0000000000000000
	ldsba	[%i1+%o4]0x89,%l4	! %l4 = 0000000000000012
!	Mem[0000000010081400] = 0000000070b87b43, %l3 = 00000000000000ff
	ldxa	[%i2+%g0]0x88,%l3	! %l3 = 0000000070b87b43
!	%f9  = 00000053, %f29 = 70b87b43
	fcmps	%fcc1,%f9 ,%f29		! %fcc1 = 1
!	%l4 = 0000000000000012, immd = 00000a13, %y  = 000000fe
	udiv	%l4,0xa13,%l6		! %l6 = 0000000019367edb
	mov	%l0,%y			! %y = f25e7f0c

!	End of Random Code for Thread 0


!	Check Registers

p0_check_registers:
	set	p0_expected_registers,%g1
	ldx	[%g1+0x000],%g2
	cmp	%l0,%g2			! %l0 should be 1295db20f25e7f0c
	bne	%xcc,p0_reg_l0_fail
	mov	%l0,%g3
	ldx	[%g1+0x008],%g2
	cmp	%l1,%g2			! %l1 should be a8263a04a54c7657
	bne	%xcc,p0_reg_l1_fail
	mov	%l1,%g3
	ldx	[%g1+0x010],%g2
	cmp	%l2,%g2			! %l2 should be 00000000000000e6
	bne	%xcc,p0_reg_l2_fail
	mov	%l2,%g3
	ldx	[%g1+0x018],%g2
	cmp	%l3,%g2			! %l3 should be 0000000070b87b43
	bne	%xcc,p0_reg_l3_fail
	mov	%l3,%g3
	ldx	[%g1+0x020],%g2
	cmp	%l4,%g2			! %l4 should be 0000000000000012
	bne	%xcc,p0_reg_l4_fail
	mov	%l4,%g3
	ldx	[%g1+0x028],%g2
	cmp	%l5,%g2			! %l5 should be ff0000ff000000ff
	bne	%xcc,p0_reg_l5_fail
	mov	%l5,%g3
	ldx	[%g1+0x030],%g2
	cmp	%l6,%g2			! %l6 should be 0000000019367edb
	bne	%xcc,p0_reg_l6_fail
	mov	%l6,%g3
	ldx	[%g1+0x038],%g2
	cmp	%l7,%g2			! %l7 should be 00000000000000bc
	bne	%xcc,p0_reg_l7_fail
	mov	%l7,%g3

!	Check %y register

	set	0xf25e7f0c,%g2
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
	cmp	%l0,%l1			! %f0  should be e6120000 00000000
	bne	%xcc,p0_freg_fail
	std	%f2,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x08],%l0
	cmp	%l0,%l1			! %f2  should be ff0000ff 00000000
	bne	%xcc,p0_freg_fail
	std	%f4,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x10],%l0
	cmp	%l0,%l1			! %f4  should be 58fa12e6 9f3f1d1b
	bne	%xcc,p0_freg_fail
	std	%f6,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x18],%l0
	cmp	%l0,%l1			! %f6  should be 00010000 70b87bff
	bne	%xcc,p0_freg_fail
	std	%f8,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x20],%l0
	cmp	%l0,%l1			! %f8  should be 00000000 00000053
	bne	%xcc,p0_freg_fail
	std	%f10,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x28],%l0
	cmp	%l0,%l1			! %f10 should be 00000000 000000ff
	bne	%xcc,p0_freg_fail
	std	%f12,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x30],%l0
	cmp	%l0,%l1			! %f12 should be 00000097 0000fb00
	bne	%xcc,p0_freg_fail
	std	%f14,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x38],%l0
	cmp	%l0,%l1			! %f14 should be 437bb870 00000000
	bne	%xcc,p0_freg_fail
	std	%f16,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x40],%l0
	cmp	%l0,%l1			! %f16 should be 00000000 000012e6
	bne	%xcc,p0_freg_fail
	std	%f18,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x48],%l0
	cmp	%l0,%l1			! %f18 should be 00000000 000000ff
	bne	%xcc,p0_freg_fail
	std	%f20,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x50],%l0
	cmp	%l0,%l1			! %f20 should be 95e20f5b ff000000
	bne	%xcc,p0_freg_fail
	std	%f22,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x58],%l0
	cmp	%l0,%l1			! %f22 should be 80970000 ff000000
	bne	%xcc,p0_freg_fail
	std	%f24,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x60],%l0
	cmp	%l0,%l1			! %f24 should be 00000000 00000000
	bne	%xcc,p0_freg_fail
	std	%f26,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x68],%l0
	cmp	%l0,%l1			! %f26 should be 000012e6 70b87b43
	bne	%xcc,p0_freg_fail
	std	%f28,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x70],%l0
	cmp	%l0,%l1			! %f28 should be 95e20f5b 70b87b43
	bne	%xcc,p0_freg_fail
	std	%f30,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x78],%l0
	cmp	%l0,%l1			! %f30 should be 00000000 00ff00ff
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
	ldx	[%g1+0x000],%l0		! %l0 = 55df7792dd8133ce
	ldx	[%g1+0x008],%l1		! %l1 = 7ecb828b64a1b779
	ldx	[%g1+0x010],%l2		! %l2 = cd0f6c042ee48734
	ldx	[%g1+0x018],%l3		! %l3 = 056723a239b525ff
	ldx	[%g1+0x020],%l4		! %l4 = 724029d70f23a6da
	ldx	[%g1+0x028],%l5		! %l5 = 00ee1ab36bffacc5
	ldx	[%g1+0x030],%l6		! %l6 = 5bafb1c767036ac0
	ldx	[%g1+0x038],%l7		! %l7 = 0bda28798c0ea3cb

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
	umul	%l5,%l0,%l4
	udivx	%l6,0xd25,%l6
	fdivs	%f7 ,%f11,%f5 
	andn	%l4,%l5,%l5
	sub	%l0,%l1,%l5
	sub	%l0,%l7,%l3
	jmpl	%o7,%g0
	smul	%l0,%l0,%l6
p0_near_0_he:
	fcmps	%fcc1,%f26,%f28
	fdivs	%f31,%f16,%f26
	jmpl	%o7,%g0
	or	%l3,%l1,%l0
p0_near_0_lo:
	umul	%l5,%l0,%l4
	udivx	%l6,0xd25,%l6
	fdivs	%f7 ,%f11,%f5 
	andn	%l4,%l5,%l5
	sub	%l0,%l1,%l5
	sub	%l0,%l7,%l3
	jmpl	%o7,%g0
	smul	%l0,%l0,%l6
p0_near_0_ho:
	fcmps	%fcc1,%f26,%f28
	fdivs	%f31,%f16,%f26
	jmpl	%o7,%g0
	or	%l3,%l1,%l0
near0_b2b_h:
	umul	%l5,%l3,%l2
	jmpl	%o7,%g0
	fdtos	%f24,%f28
near0_b2b_l:
	fmuls	%f11,%f13,%f0 
	jmpl	%o7,%g0
	andn	%l1,-0xcf1,%l6
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
	udivx	%l6,0x09f,%l6
	sub	%l1,%l3,%l4
	mulx	%l3,%l7,%l0
	fmuls	%f3 ,%f6 ,%f2 
	jmpl	%o7,%g0
	smul	%l6,%l0,%l4
p0_near_1_he:
	umul	%l6,%l4,%l5
	udivx	%l4,%l5,%l0
	orn	%l4,-0x5ed,%l6
	jmpl	%o7,%g0
	andn	%l3,0xbbc,%l1
p0_near_1_lo:
	udivx	%l6,0x09f,%l6
	sub	%l1,%l3,%l4
	mulx	%l3,%l7,%l0
	fmuls	%f3 ,%f6 ,%f2 
	jmpl	%o7,%g0
	smul	%l6,%l0,%l4
p0_near_1_ho:
	umul	%l6,%l4,%l5
	udivx	%l4,%l5,%l0
	orn	%l4,-0x5ed,%l6
	jmpl	%o7,%g0
	andn	%l3,0xbbc,%l1
near1_b2b_h:
	subc	%l5,-0xdd3,%l3
	smul	%l0,0xd81,%l1
	xnor	%l6,%l3,%l2
	andn	%l3,-0x563,%l3
	xnor	%l6,0xa00,%l4
	fsubs	%f26,%f26,%f25
	xnor	%l4,-0xe80,%l4
	jmpl	%o7,%g0
	andn	%l2,%l2,%l2
near1_b2b_l:
	fcmps	%fcc0,%f9 ,%f11
	sdivx	%l2,0xe76,%l7
	or	%l5,0x111,%l6
	fmuls	%f8 ,%f7 ,%f2 
	sub	%l6,%l0,%l7
	fcmps	%fcc0,%f9 ,%f6 
	xnor	%l5,-0xb5d,%l0
	jmpl	%o7,%g0
	or	%l3,-0x235,%l4
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
	add	%l4,-0x576,%l4
	jmpl	%o7,%g0
	smul	%l0,-0x465,%l1
p0_near_2_he:
	smul	%l1,-0xce7,%l1
	jmpl	%o7,%g0
	udivx	%l1,0x656,%l3
p0_near_2_lo:
	add	%l4,-0x576,%l4
	jmpl	%o7,%g0
	smul	%l0,-0x465,%l1
p0_near_2_ho:
	smul	%l1,-0xce7,%l1
	jmpl	%o7,%g0
	udivx	%l1,0x656,%l3
near2_b2b_h:
	sdivx	%l7,%l5,%l6
	fsubs	%f24,%f21,%f17
	xor	%l1,%l1,%l6
	xor	%l5,%l1,%l7
	smul	%l7,%l7,%l4
	jmpl	%o7,%g0
	subc	%l7,-0x602,%l6
near2_b2b_l:
	fmuls	%f8 ,%f12,%f15
	sdivx	%l0,0x2ab,%l6
	orn	%l4,-0xab8,%l4
	xnor	%l3,%l1,%l2
	or	%l5,%l4,%l1
	jmpl	%o7,%g0
	fadds	%f5 ,%f15,%f15
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
	add	%l1,%l4,%l0
	xor	%l1,%l3,%l0
	addc	%l5,%l2,%l3
	sdivx	%l2,%l4,%l0
	jmpl	%o7,%g0
	xor	%l1,-0x6c8,%l0
p0_near_3_he:
	xor	%l1,%l3,%l6
	xnor	%l2,%l5,%l5
	jmpl	%o7,%g0
	ldx	[%i3+0x030],%l2		! Mem[00000000100c1430]
p0_near_3_lo:
	add	%l1,%l4,%l0
	xor	%l1,%l3,%l0
	addc	%l5,%l2,%l3
	sdivx	%l2,%l4,%l0
	jmpl	%o7,%g0
	xor	%l1,-0x6c8,%l0
p0_near_3_ho:
	xor	%l1,%l3,%l6
	xnor	%l2,%l5,%l5
	jmpl	%o7,%g0
	ldx	[%o3+0x030],%l2		! Mem[00000000100c1430]
near3_b2b_h:
	orn	%l5,%l0,%l5
	sdivx	%l7,0x98d,%l1
	xnor	%l4,-0x96a,%l3
	xnor	%l6,0xb08,%l5
	sub	%l7,0x3f1,%l0
	jmpl	%o7,%g0
	sub	%l5,0x46c,%l0
near3_b2b_l:
	fdivs	%f5 ,%f6 ,%f6 
	and	%l1,0xe48,%l3
	subc	%l0,%l7,%l6
	udivx	%l5,0x581,%l5
	smul	%l6,-0x2b5,%l5
	jmpl	%o7,%g0
	andn	%l1,-0x0a2,%l0
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
	fadds	%f7 ,%f8 ,%f7 
	fdivs	%f5 ,%f11,%f12
	swap	[%i1+0x020],%l6		! Mem[0000000010041420]
	sdivx	%l3,0x265,%l3
	sdivx	%l2,%l2,%l0
	jmpl	%o7,%g0
	subc	%l3,0xdbb,%l2
p0_far_0_he:
	fsubs	%f17,%f24,%f28
	sub	%l3,%l5,%l4
	orn	%l5,0x9d5,%l4
	fcmps	%fcc2,%f25,%f27
	umul	%l3,%l6,%l0
	jmpl	%o7,%g0
	orn	%l2,%l2,%l4
p0_far_0_lo:
	fadds	%f7 ,%f8 ,%f7 
	fdivs	%f5 ,%f11,%f12
	swap	[%o1+0x020],%l6		! Mem[0000000010041420]
	sdivx	%l3,0x265,%l3
	sdivx	%l2,%l2,%l0
	jmpl	%o7,%g0
	subc	%l3,0xdbb,%l2
p0_far_0_ho:
	fsubs	%f17,%f24,%f28
	sub	%l3,%l5,%l4
	orn	%l5,0x9d5,%l4
	fcmps	%fcc2,%f25,%f27
	umul	%l3,%l6,%l0
	jmpl	%o7,%g0
	orn	%l2,%l2,%l4
far0_b2b_h:
	fdivs	%f30,%f30,%f29
	fstoi	%f29,%f21
	jmpl	%o7,%g0
	addc	%l1,%l2,%l6
far0_b2b_l:
	orn	%l0,%l6,%l2
	fadds	%f9 ,%f2 ,%f13
	jmpl	%o7,%g0
	fdivs	%f6 ,%f13,%f15
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
	addc	%l6,%l6,%l1
	sub	%l5,-0x52f,%l7
	fmuls	%f15,%f12,%f12
	swap	[%i6+0x02c],%l0		! Mem[000000001018142c]
	smul	%l2,-0xa06,%l6
	ldd	[%i6+0x008],%l4		! Mem[0000000010181408]
	xnor	%l6,-0x141,%l2
	jmpl	%o7,%g0
	subc	%l7,%l7,%l4
p0_far_1_he:
	jmpl	%o7,%g0
	xor	%l0,%l1,%l5
	jmpl	%o7,%g0
	nop
p0_far_1_lo:
	addc	%l6,%l6,%l1
	sub	%l5,-0x52f,%l7
	fmuls	%f15,%f12,%f12
	swap	[%o6+0x02c],%l0		! Mem[000000001018142c]
	smul	%l2,-0xa06,%l6
	ldd	[%o6+0x008],%l4		! Mem[0000000010181408]
	xnor	%l6,-0x141,%l2
	jmpl	%o7,%g0
	subc	%l7,%l7,%l4
p0_far_1_ho:
	jmpl	%o7,%g0
	xor	%l0,%l1,%l5
	jmpl	%o7,%g0
	nop
	jmpl	%o7,%g0
	nop
far1_b2b_h:
	smul	%l4,-0x324,%l1
	xnor	%l2,0xb36,%l6
	mulx	%l1,%l6,%l1
	jmpl	%o7,%g0
	and	%l0,%l6,%l0
far1_b2b_l:
	andn	%l7,%l6,%l2
	fsqrts	%f12,%f3 
	fsubs	%f12,%f6 ,%f14
	jmpl	%o7,%g0
	and	%l2,-0xb75,%l6
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
	fdivs	%f4 ,%f0 ,%f2 
	subc	%l7,-0xe63,%l6
	jmpl	%o7,%g0
	sub	%l0,0x056,%l4
p0_far_2_he:
	swap	[%i5+0x02c],%l3		! Mem[000000001014142c]
	andn	%l2,%l6,%l6
	udivx	%l4,%l0,%l6
	sub	%l4,%l2,%l5
	udivx	%l5,0xddf,%l6
	sdivx	%l5,%l1,%l7
	jmpl	%o7,%g0
	addc	%l2,%l7,%l7
p0_far_2_lo:
	fdivs	%f4 ,%f0 ,%f2 
	subc	%l7,-0xe63,%l6
	jmpl	%o7,%g0
	sub	%l0,0x056,%l4
p0_far_2_ho:
	swap	[%o5+0x02c],%l3		! Mem[000000001014142c]
	andn	%l2,%l6,%l6
	udivx	%l4,%l0,%l6
	sub	%l4,%l2,%l5
	udivx	%l5,0xddf,%l6
	sdivx	%l5,%l1,%l7
	jmpl	%o7,%g0
	addc	%l2,%l7,%l7
far2_b2b_h:
	and	%l7,%l0,%l5
	umul	%l1,-0xbfa,%l7
	addc	%l2,-0xf65,%l3
	mulx	%l0,%l3,%l7
	add	%l4,%l4,%l0
	mulx	%l7,0xd06,%l3
	subc	%l3,%l0,%l5
	jmpl	%o7,%g0
	fadds	%f20,%f20,%f21
far2_b2b_l:
	subc	%l6,%l7,%l3
	andn	%l5,0xfa8,%l7
	subc	%l2,%l5,%l7
	umul	%l3,%l7,%l1
	fsqrts	%f1 ,%f10
	fsqrts	%f12,%f1 
	xnor	%l6,%l0,%l6
	jmpl	%o7,%g0
	fcmps	%fcc2,%f9 ,%f13
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
	addc	%l1,0xe67,%l5
	smul	%l7,%l2,%l2
	ldstub	[%o0+0x001],%l4		! Mem[00000000201c0001]
	xor	%l3,%l6,%l7
	xnor	%l7,-0xb8c,%l2
	fmuls	%f2 ,%f4 ,%f6 
	jmpl	%o7,%g0
	mulx	%l1,0x7ea,%l7
p0_far_3_he:
	addc	%l4,-0xaa7,%l1
	addc	%l5,%l4,%l2
	jmpl	%o7,%g0
	orn	%l6,0xdda,%l5
p0_far_3_lo:
	addc	%l1,0xe67,%l5
	smul	%l7,%l2,%l2
	ldstub	[%i0+0x001],%l4		! Mem[00000000201c0001]
	xor	%l3,%l6,%l7
	xnor	%l7,-0xb8c,%l2
	fmuls	%f2 ,%f4 ,%f6 
	jmpl	%o7,%g0
	mulx	%l1,0x7ea,%l7
p0_far_3_ho:
	addc	%l4,-0xaa7,%l1
	addc	%l5,%l4,%l2
	jmpl	%o7,%g0
	orn	%l6,0xdda,%l5
far3_b2b_h:
	mulx	%l0,%l5,%l5
	orn	%l7,%l2,%l3
	sdivx	%l2,%l7,%l3
	xor	%l2,-0x136,%l2
	udivx	%l6,%l0,%l6
	mulx	%l4,-0x7dc,%l7
	jmpl	%o7,%g0
	fsqrts	%f31,%f21
far3_b2b_l:
	or	%l4,%l5,%l5
	or	%l6,%l2,%l0
	nop
	fcmps	%fcc1,%f11,%f11
	add	%l2,-0x954,%l6
	sub	%l0,%l5,%l5
	jmpl	%o7,%g0
	fadds	%f3 ,%f10,%f2 
user_far3_end:
	.seg	"text"
	.align	0x2000
user_jump0_start:
	.skip	16
p0_jmpl_0_le:
	mulx	%l4,%l4,%l5
	xnor	%l2,-0x686,%l5
	nop
	andn	%l5,%l7,%l4
	sdivx	%l5,%l0,%l1
	mulx	%l5,%l2,%l2
	jmpl	%g6+8,%g0
	lduw	[%i4+0x030],%l0		! Mem[0000000010101430]
p0_call_0_le:
	fadds	%f3 ,%f8 ,%f6 
	umul	%l2,-0x6c8,%l4
	mulx	%l4,%l1,%l2
	retl
	fdivs	%f14,%f3 ,%f2 
p0_jmpl_0_lo:
	mulx	%l4,%l4,%l5
	xnor	%l2,-0x686,%l5
	nop
	andn	%l5,%l7,%l4
	sdivx	%l5,%l0,%l1
	mulx	%l5,%l2,%l2
	jmpl	%g6+8,%g0
	lduw	[%o4+0x030],%l0		! Mem[0000000010101430]
p0_call_0_lo:
	fadds	%f3 ,%f8 ,%f6 
	umul	%l2,-0x6c8,%l4
	mulx	%l4,%l1,%l2
	retl
	fdivs	%f14,%f3 ,%f2 
p0_jmpl_0_he:
	mulx	%l2,%l0,%l3
	subc	%l3,%l6,%l1
	smul	%l0,%l4,%l0
	sub	%l3,-0x563,%l5
	smul	%l7,%l1,%l0
	subc	%l6,%l4,%l5
	jmpl	%g6+8,%g0
	mulx	%l0,0xac9,%l2
p0_call_0_he:
	xnor	%l2,-0x474,%l7
	udivx	%l3,%l5,%l4
	orn	%l1,0x82f,%l7
	fcmps	%fcc1,%f30,%f22
	umul	%l6,%l7,%l2
	fadds	%f26,%f20,%f26
	udivx	%l5,%l3,%l7
	retl
	add	%l3,0x5ee,%l5
p0_jmpl_0_ho:
	mulx	%l2,%l0,%l3
	subc	%l3,%l6,%l1
	smul	%l0,%l4,%l0
	sub	%l3,-0x563,%l5
	smul	%l7,%l1,%l0
	subc	%l6,%l4,%l5
	jmpl	%g6+8,%g0
	mulx	%l0,0xac9,%l2
p0_call_0_ho:
	xnor	%l2,-0x474,%l7
	udivx	%l3,%l5,%l4
	orn	%l1,0x82f,%l7
	fcmps	%fcc1,%f30,%f22
	umul	%l6,%l7,%l2
	fadds	%f26,%f20,%f26
	udivx	%l5,%l3,%l7
	retl
	add	%l3,0x5ee,%l5
user_jump0_end:
	.seg	"text"
	.align	0x2000
user_jump1_start:
	.skip	32
p0_jmpl_1_le:
	fsubs	%f5 ,%f2 ,%f8 
	and	%l0,%l6,%l6
	jmpl	%g6+8,%g0
	fdtos	%f0 ,%f10
p0_call_1_le:
	nop
	stw	%l1,[%i4+0x034]		! Mem[0000000010101434]
	fdivs	%f15,%f10,%f4 
	and	%l7,%l1,%l3
	umul	%l1,-0x208,%l0
	retl
	addc	%l5,%l4,%l5
p0_jmpl_1_lo:
	fsubs	%f5 ,%f2 ,%f8 
	and	%l0,%l6,%l6
	jmpl	%g6+8,%g0
	fdtos	%f0 ,%f10
p0_call_1_lo:
	nop
	stw	%l1,[%o4+0x034]		! Mem[0000000010101434]
	fdivs	%f15,%f10,%f4 
	and	%l7,%l1,%l3
	umul	%l1,-0x208,%l0
	retl
	addc	%l5,%l4,%l5
p0_jmpl_1_he:
	fcmps	%fcc1,%f20,%f16
	fcmps	%fcc1,%f30,%f27
	subc	%l7,-0x2f7,%l7
	subc	%l0,%l3,%l1
	sub	%l0,%l3,%l3
	addc	%l3,%l6,%l3
	jmpl	%g6+8,%g0
	mulx	%l3,%l6,%l4
p0_call_1_he:
	andn	%l0,-0x233,%l1
	and	%l3,%l5,%l2
	fsubs	%f30,%f23,%f21
	fadds	%f28,%f18,%f29
	smul	%l0,%l5,%l3
	and	%l7,0x2b5,%l0
	retl
	umul	%l0,0x595,%l6
p0_jmpl_1_ho:
	fcmps	%fcc1,%f20,%f16
	fcmps	%fcc1,%f30,%f27
	subc	%l7,-0x2f7,%l7
	subc	%l0,%l3,%l1
	sub	%l0,%l3,%l3
	addc	%l3,%l6,%l3
	jmpl	%g6+8,%g0
	mulx	%l3,%l6,%l4
p0_call_1_ho:
	andn	%l0,-0x233,%l1
	and	%l3,%l5,%l2
	fsubs	%f30,%f23,%f21
	fadds	%f28,%f18,%f29
	smul	%l0,%l5,%l3
	and	%l7,0x2b5,%l0
	retl
	umul	%l0,0x595,%l6
user_jump1_end:
	.seg	"text"
	.align	0x2000
user_jump2_start:
	.skip	48
p0_jmpl_2_le:
	orn	%l2,%l7,%l5
	udivx	%l5,%l5,%l6
	or	%l4,%l1,%l7
	jmpl	%g6+8,%g0
	addc	%l4,0xaa4,%l5
p0_call_2_le:
	fcmps	%fcc0,%f5 ,%f13
	xnor	%l3,%l3,%l5
	ldx	[%i5+0x028],%l3		! Mem[0000000010141428]
	fmuls	%f5 ,%f10,%f13
	retl
	andn	%l3,%l1,%l3
p0_jmpl_2_lo:
	orn	%l2,%l7,%l5
	udivx	%l5,%l5,%l6
	or	%l4,%l1,%l7
	jmpl	%g6+8,%g0
	addc	%l4,0xaa4,%l5
p0_call_2_lo:
	fcmps	%fcc0,%f5 ,%f13
	xnor	%l3,%l3,%l5
	ldx	[%o5+0x028],%l3		! Mem[0000000010141428]
	fmuls	%f5 ,%f10,%f13
	retl
	andn	%l3,%l1,%l3
p0_jmpl_2_he:
	fdivs	%f19,%f18,%f17
	xor	%l1,0xeec,%l7
	stb	%l2,[%o3+0x0c1]		! Mem[00000000218000c1]
	jmpl	%g6+8,%g0
	fsqrts	%f19,%f16
p0_call_2_he:
	retl
	udivx	%l3,%l0,%l6
p0_jmpl_2_ho:
	fdivs	%f19,%f18,%f17
	xor	%l1,0xeec,%l7
	stb	%l2,[%i3+0x0c1]		! Mem[00000000218000c1]
	jmpl	%g6+8,%g0
	fsqrts	%f19,%f16
p0_call_2_ho:
	retl
	udivx	%l3,%l0,%l6
user_jump2_end:
	.seg	"text"
	.align	0x2000
user_jump3_start:
	.skip	64
p0_jmpl_3_le:
	fsqrts	%f5 ,%f15
	xnor	%l7,-0xf37,%l0
	fdivs	%f11,%f2 ,%f12
	xor	%l3,%l7,%l5
	jmpl	%g6+8,%g0
	or	%l7,-0xd88,%l0
p0_call_3_le:
	retl
	addc	%l3,0x8d5,%l2
p0_jmpl_3_lo:
	fsqrts	%f5 ,%f15
	xnor	%l7,-0xf37,%l0
	fdivs	%f11,%f2 ,%f12
	xor	%l3,%l7,%l5
	jmpl	%g6+8,%g0
	or	%l7,-0xd88,%l0
p0_call_3_lo:
	retl
	addc	%l3,0x8d5,%l2
p0_jmpl_3_he:
	stx	%l5,[%i1+0x028]		! Mem[0000000010041428]
	fmuls	%f26,%f22,%f29
	orn	%l0,%l2,%l3
	orn	%l6,%l0,%l5
	udivx	%l2,%l7,%l1
	fsubs	%f20,%f20,%f20
	fitos	%f19,%f18
	jmpl	%g6+8,%g0
	smul	%l7,0x5f9,%l6
p0_call_3_he:
	andn	%l4,0xebd,%l0
	fcmps	%fcc3,%f16,%f19
	orn	%l4,%l3,%l4
	st	%f31,[%i3+0x004]	! Mem[00000000100c1404]
	fmuls	%f24,%f21,%f23
	xor	%l6,%l6,%l5
	fadds	%f24,%f29,%f17
	retl
	and	%l4,-0x8da,%l1
p0_jmpl_3_ho:
	stx	%l5,[%o1+0x028]		! Mem[0000000010041428]
	fmuls	%f26,%f22,%f29
	orn	%l0,%l2,%l3
	orn	%l6,%l0,%l5
	udivx	%l2,%l7,%l1
	fsubs	%f20,%f20,%f20
	fitos	%f19,%f18
	jmpl	%g6+8,%g0
	smul	%l7,0x5f9,%l6
p0_call_3_ho:
	andn	%l4,0xebd,%l0
	fcmps	%fcc3,%f16,%f19
	orn	%l4,%l3,%l4
	st	%f31,[%o3+0x004]	! Mem[00000000100c1404]
	fmuls	%f24,%f21,%f23
	xor	%l6,%l6,%l5
	fadds	%f24,%f29,%f17
	retl
	and	%l4,-0x8da,%l1
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
	.word	0x55df7792,0xdd8133ce		! Init value for %l0
	.word	0x7ecb828b,0x64a1b779		! Init value for %l1
	.word	0xcd0f6c04,0x2ee48734		! Init value for %l2
	.word	0x056723a2,0x39b525ff		! Init value for %l3
	.word	0x724029d7,0x0f23a6da		! Init value for %l4
	.word	0x00ee1ab3,0x6bffacc5		! Init value for %l5
	.word	0x5bafb1c7,0x67036ac0		! Init value for %l6
	.word	0x0bda2879,0x8c0ea3cb		! Init value for %l7
	.align	64
p0_init_freg:
	.word	0x34b16520,0x765b9cb1		! Init value for %f0 
	.word	0x3d5d875e,0x137bb737		! Init value for %f2 
	.word	0x406dec0c,0x171ac46d		! Init value for %f4 
	.word	0x6d620aaa,0x7869add3		! Init value for %f6 
	.word	0x1fc736b8,0x361648e9		! Init value for %f8 
	.word	0x3fb07fb6,0x7877b72f		! Init value for %f10
	.word	0x43f59124,0x0605c625		! Init value for %f12
	.word	0x52b09282,0x69b34f4b		! Init value for %f14
	.word	0x42330750,0x41839821		! Init value for %f16
	.word	0x4069af0e,0x4872b227		! Init value for %f18
	.word	0x1867653c,0x0188dadd		! Init value for %f20
	.word	0x5d8f015a,0x22b0dbc3		! Init value for %f22
	.word	0x219436e8,0x2ca96a59		! Init value for %f24
	.word	0x364b7566,0x3229881f		! Init value for %f26
	.word	0x4600c854,0x5b0fe295		! Init value for %f28
	.word	0x34cdb732,0x6135333b		! Init value for %f30
	.word	0x33262580,0x4b399f91		! Init value for %f32
	.word	0x1d9432be,0x36651917		! Init value for %f34
	.word	0x275b1a6c,0x4372bd4d		! Init value for %f36
	.word	0x4d79140a,0x62df35b3		! Init value for %f38
	.word	0x1d403318,0x7c1217c9		! Init value for %f40
	.word	0x657e4716,0x6f7a450f		! Init value for %f42
	.word	0x62ebbb84,0x6e754b05		! Init value for %f44
	.word	0x505977e2,0x4499c32b		! Init value for %f46
	.word	0x68d5bfb0,0x24bcb301
	.word	0x4dc0126e,0x08c9ec07
	.word	0x54840b9c,0x66476bbd
	.word	0x6f7342ba,0x121bbba3
	.word	0x22f62b48,0x5cef5139
	.word	0x340bf4c6,0x6640edff
	.word	0x66d16ab4,0x0f04ff75
	.word	0x2b86d492,0x0567ff1b
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
	.word	0x1295db20,0xf25e7f0c		! %l0
	.word	0xa8263a04,0xa54c7657		! %l1
	.word	0x00000000,0x000000e6		! %l2
	.word	0x00000000,0x70b87b43		! %l3
	.word	0x00000000,0x00000012		! %l4
	.word	0xff0000ff,0x000000ff		! %l5
	.word	0x00000000,0x19367edb		! %l6
	.word	0x00000000,0x000000bc		! %l7
p0_expected_fp_regs:
	.word	0xe6120000,0x00000000		! %f0
	.word	0xff0000ff,0x00000000		! %f2
	.word	0x58fa12e6,0x9f3f1d1b		! %f4
	.word	0x00010000,0x70b87bff		! %f6
	.word	0x00000000,0x00000053		! %f8
	.word	0x00000000,0x000000ff		! %f10
	.word	0x00000097,0x0000fb00		! %f12
	.word	0x437bb870,0x00000000		! %f14
	.word	0x00000000,0x000012e6		! %f16
	.word	0x00000000,0x000000ff		! %f18
	.word	0x95e20f5b,0xff000000		! %f20
	.word	0x80970000,0xff000000		! %f22
	.word	0x00000000,0x00000000		! %f24
	.word	0x000012e6,0x70b87b43		! %f26
	.word	0x95e20f5b,0x70b87b43		! %f28
	.word	0x00000000,0x00ff00ff		! %f30
	.word	0x00000015,0x000007e0		! %fsr
p0_local0_expect:
	.word	0xe612fa58,0x00000000,0xff000000,0x1b1d3f9f ! PA = 0000000010001400
	.word	0xff000000,0xff0000ff,0x314ab8da,0x00007b43 ! PA = 0000000010001410
	.word	0xaa359bed,0x7a20418c,0xff00ff0b,0x1b1d3f9f ! PA = 0000000010001420
	.word	0x00003dff,0x0bff976b,0x00fb0000,0x97000000 ! PA = 0000000010001430
p0_local0_sec_expect:
	.word	0xffffffff,0x00000000,0x000000ff,0xff0000ff ! PA = 0000000030001400
	.word	0x64de2a89,0x70b87b43,0xff7bb870,0x00000100 ! PA = 0000000030001410
	.word	0xff0000ff,0xff000000,0x000000ff,0x00000000 ! PA = 0000000030001420
	.word	0x00fb0000,0x97000000,0x00000000,0x70b87b43 ! PA = 0000000030001430
!	Scratch Area for Non-Transactional Memory Stores
	.word	0x26c1db4e,0xf7f32dbf,0xc2290572,0xe32491ab
	.word	0xb1bff1b6,0x2a24c7f7,0x6f5e791a,0x4752bba3
	.word	0x1bab7c9e,0xcbcd6faf,0x43a72542,0x756abf1b
	.word	0x03972406,0x4d941ce7,0xdee4f1ea,0x0db95413
p0_local1_expect:
	.word	0xff000000,0xff2d0000,0x00000000,0x000000ff ! PA = 0000000010041400
	.word	0x000000ff,0x000000da,0xffff0000,0x00000000 ! PA = 0000000010041410
	.word	0xdbffffff,0xc5acff6b,0x00000000,0x000076ff ! PA = 0000000010041420
	.word	0xff000000,0x00000000,0x00000000,0x00008097 ! PA = 0000000010041430
p0_local1_sec_expect:
	.word	0x000000ff,0x00000000,0x12760000,0xff000000 ! PA = 0000000030041400
	.word	0xff000000,0x000076ff,0xffffff7f,0x0f5b0000 ! PA = 0000000030041410
	.word	0xd925f62d,0x68a8f31d,0x000000ff,0xffffffff ! PA = 0000000030041420
	.word	0x6b97140b,0x97809b06,0xff000000,0xa78c9bff ! PA = 0000000030041430
p0_local2_expect:
	.word	0x437bb870,0x00000000,0xff000000,0x00000000 ! PA = 0000000010081400
	.word	0xff5400ff,0x00000000,0xff7bb870,0xdaa64a31 ! PA = 0000000010081410
	.word	0x7e0000ff,0x00ff0022,0x000000ff,0x00000000 ! PA = 0000000010081420
	.word	0xfffa12e6,0xaa359bed,0x0000ff00,0x00003dff ! PA = 0000000010081430
p0_local2_sec_expect:
	.word	0xff000000,0x00000000,0x00000000,0x00000053 ! PA = 0000000030081400
	.word	0x00ff7416,0x978163f9,0x314aa6da,0x70b87b43 ! PA = 0000000030081410
	.word	0x437bb870,0x00000000,0x58fa12e6,0x1b1d3f9f ! PA = 0000000030081420
	.word	0x069b8097,0x0b14976b,0x0a80ccb2,0x3ff082bb ! PA = 0000000030081430
p0_local3_expect:
	.word	0xff00ff00,0x00000000,0x000000ff,0xff0000ff ! PA = 00000000100c1400
	.word	0x00000000,0x00000012,0xff7bb870,0x00000100 ! PA = 00000000100c1410
	.word	0xff0000ff,0xff000000,0x000000ff,0x5b0fe295 ! PA = 00000000100c1420
	.word	0x00fb0000,0x97000000,0x00000000,0x70b87b43 ! PA = 00000000100c1430
p0_local3_sec_expect:
	.word	0x2df6ffff,0x70b87b43,0xff000000,0x00007b00 ! PA = 00000000300c1400
	.word	0xff0000ff,0xff000000,0x0dd229ea,0xff752d36 ! PA = 00000000300c1410
	.word	0x2fb55cc8,0x4e44ccb9,0x4a28a146,0x9653657f ! PA = 00000000300c1420
	.word	0x00000000,0x00000000,0x7e000000,0x587464ff ! PA = 00000000300c1430
p0_local4_expect:
	.word	0xff7bb870,0x9b425ce4,0x000000bc,0xff0000ff ! PA = 0000000010101400
	.word	0x00000000,0x00000000,0x437b0000,0x9b425ce4 ! PA = 0000000010101410
	.word	0xd925f62d,0x68a8f31d,0x9f3f1d1b,0xe612fa58 ! PA = 0000000010101420
	.word	0x00000000,0xff2d0000,0x00000000,0x0000fb00 ! PA = 0000000010101430
p0_local4_sec_expect:
	.word	0x1674b0d7,0x00000000,0xff000000,0x000012e6 ! PA = 0000000030101400
	.word	0x000012e6,0x00000000,0x000000ff,0x00009780 ! PA = 0000000030101410
	.word	0x00000000,0xff000000,0x00000080,0x000000ff ! PA = 0000000030101420
	.word	0xe45c429b,0x70b87b43,0x63ad6ddf,0x2ca93559 ! PA = 0000000030101430
p0_local5_expect:
	.word	0x000000ff,0x00000000,0x97000000,0x000076ff ! PA = 0000000010141400
	.word	0xff5400ff,0x00000000,0xf30091d7,0xffa64a31 ! PA = 0000000010141410
	.word	0x000000ff,0xff8da6db,0x000000aa,0x000000da ! PA = 0000000010141420
	.word	0x6b97140b,0x9780ff7e,0xff0000ff,0x00000000 ! PA = 0000000010141430
p0_local5_sec_expect:
	.word	0x000000bc,0xff000000,0x00000000,0x00000000 ! PA = 0000000030141400
	.word	0x437bb870,0x9b425ce4,0xffffff7f,0x0f5b0000 ! PA = 0000000030141410
	.word	0xd925f62d,0x68a8f31d,0x000000ff,0xffffffff ! PA = 0000000030141420
	.word	0x6b97140b,0x97809b06,0xff000000,0xa78c9bff ! PA = 0000000030141430
p0_local6_expect:
	.word	0x000000ff,0x5b0fe295,0x00000000,0x000076ff ! PA = 0000000010181400
	.word	0x00000000,0x70b87b43,0x00000000,0x0000b0d7 ! PA = 0000000010181410
	.word	0x000000ff,0xff8da6db,0x000000aa,0x000000da ! PA = 0000000010181420
	.word	0x6b97140b,0x9780ff7e,0x6b97ff0b,0xff2d0000 ! PA = 0000000010181430
p0_local6_sec_expect:
	.word	0x00000000,0x00000000,0xff000000,0x00000000 ! PA = 0000000030181400
	.word	0xff000000,0x70b87b43,0x000000ff,0x00009780 ! PA = 0000000030181410
	.word	0x00000000,0x00000000,0x00009780,0xffffffff ! PA = 0000000030181420
	.word	0xff0000ff,0x5b0fe295,0x63ad6ddf,0x2ca93559 ! PA = 0000000030181430
share0_expect:
	.word	0xffffe880,0x19e07691,0x46ed4dbe,0x1d6ce817 ! PA = 00000000201c0000
	.word	0x52964d6c,0x1ca5444d,0x24211f0a,0x1be434b3 ! PA = 00000000201c0010
	.word	0x0a85d618,0x7ddf4ec9,0x79e84216,0x6543740f ! PA = 00000000201c0020
	.word	0x6986ce84,0x081c3205,0x416862e2,0x709e222b ! PA = 00000000201c0030
share1_expect:
	.word	0xff5442b0,0x1dac4a01,0x53c6ed6e,0x72307b07 ! PA = 0000000020800000
	.word	0x4e6afe9c,0x151eb2bd,0x57350dba,0x7cbb7aa3 ! PA = 0000000020800010
	.word	0x1bb38e48,0x0e7d4839,0x49bbafc6,0x31a0dcff ! PA = 0000000020800020
	.word	0x5f703db4,0x1d48a675,0x15c77f92,0x3bbf1e1b ! PA = 0000000020800030
	.word	0x00ff18e0,0x63342971,0x5c74e91e,0x110d79f7 ! PA = 0000000020800040
	.word	0x031febcc,0x77a1ed2d,0x619c186a,0x36f7ec93 ! PA = 0000000020800050
	.word	0x15864278,0x37decda9,0x459cf976,0x057b31ef ! PA = 0000000020800060
	.word	0x61df68e4,0x5c1e66e5,0x78eb3842,0x2500c60b ! PA = 0000000020800070
share2_expect:
	.word	0xff006b10,0x6d3714e1,0x155a40ce,0x42fae4e7 ! PA = 00000000211c0000
	.word	0x0f7014fc,0x771df39d,0x09293f1a,0x39408a83 ! PA = 00000000211c0010
	.word	0x57a8f2a8,0x1422df19,0x3fcf1f26,0x242972df ! PA = 00000000211c0020
	.word	0x246f5014,0x2cec7355,0x34868cf2,0x236a19fb ! PA = 00000000211c0030
share3_expect:
	.word	0xffff3940,0x09340c51,0x1a99f47e,0x41afbbd7 ! PA = 0000000021800000
	.word	0x47d67a2c,0x0d41c60d,0x076f81ca,0x3efc5473 ! PA = 0000000021800010
	.word	0x63869ed8,0x40287c89,0x4a5520d6,0x39c29fcf ! PA = 0000000021800020
	.word	0x287af344,0x76c1cbc5,0x5e0c7da2,0x72c219eb ! PA = 0000000021800030
	.word	0xffff8370,0x3f6a0fc1,0x2017042e,0x27a2fec7 ! PA = 0000000021800040
	.word	0x668e1b5c,0x6a7c647d,0x39c1e07a,0x40524a63 ! PA = 0000000021800050
	.word	0x0c4a4708,0x4b8ea5f9,0x66f1fe86,0x4b1db8bf ! PA = 0000000021800060
	.word	0x6d1d5274,0x0f6d7035,0x06b00a52,0x038fc5db ! PA = 0000000021800070
	.word	0xffff49a0,0x42d81f31,0x21746fde,0x600badb7 ! PA = 0000000021800080
	.word	0x3b91f88c,0x65fcceed,0x51335b2a,0x62296c53 ! PA = 0000000021800090
	.word	0x26deeb38,0x28b45b69,0x3728b836,0x25d1bdaf ! PA = 00000000218000a0
	.word	0x1f316da4,0x2b7e60a5,0x6b643302,0x6b1a1dcb ! PA = 00000000218000b0
	.word	0x16ff8bd0,0x613d3aa1,0x1215378e,0x16e0c8a7 ! PA = 00000000218000c0
	.word	0x5c9d11bc,0x6db2055d,0x0296f1da,0x6628ba43 ! PA = 00000000218000d0
	.word	0x39ef8b68,0x1cb89cd9,0x2c3c4de6,0x5035ae9f ! PA = 00000000218000e0
	.word	0x495244d4,0x4e439d15,0x24dbf7b2,0x536821bb ! PA = 00000000218000f0
	.word	0xffff4a00,0x73186211,0x0d1c5b3e,0x28d94f97 ! PA = 0000000021800100
	.word	0x552a66ec,0x764b07cd,0x367fa48a,0x1ab73433 ! PA = 0000000021800110
	.word	0x2de72798,0x2f7a6a49,0x372fbf96,0x79608b8f ! PA = 0000000021800120
	.word	0x03dad804,0x39cc2585,0x578a5862,0x6b40d1ab ! PA = 0000000021800130
	.word	0x00d78430,0x4ba89581,0x056cdaee,0x136c4287 ! PA = 0000000021800140
	.word	0x5674f81c,0x6b36d63d,0x3940733a,0x4afbda23 ! PA = 0000000021800150
	.word	0x7cf0bfc8,0x1b98c3b9,0x78c60d46,0x6929547f ! PA = 0000000021800160
	.word	0x24e62734,0x5ee6f9f5,0x63a25512,0x562b2d9b ! PA = 0000000021800170
	.word	0x65ff3a60,0x28ecd4f1,0x75a9b69e,0x64d0a177 ! PA = 0000000021800180
	.word	0x6777c54c,0x1ea470ad,0x6aec5dea,0x2eddac13 ! PA = 0000000021800190
	.word	0x62f753f8,0x3e72a929,0x718236f6,0x7027096f ! PA = 00000000218001a0
	.word	0x704f3264,0x4d231a65,0x1516edc2,0x1c6e358b ! PA = 00000000218001b0
	.word	0x00006c90,0x23a42061,0x1035ee4e,0x2bfd6c67 ! PA = 00000000218001c0
	.word	0x14edce7c,0x3982d71d,0x6f56649a,0x5b03aa03 ! PA = 00000000218001d0
	.word	0x0da5e428,0x08271a99,0x31a73ca6,0x57b0aa5f ! PA = 00000000218001e0
	.word	0x47b0f994,0x22cf86d5,0x539b2272,0x1b10e97b ! PA = 00000000218001f0
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
	.word	0x6e4cd5e0,0x4a0bd271,0x51904e1e,0x7bd82af7	! PA = 0000000010001400
	.word	0x5cdd38cc,0x5a35e62d,0x09908d6a,0x764d6d93	! PA = 0000000010001410
	.word	0x04a11f78,0x2aa016a9,0x68777e76,0x551482ef	! PA = 0000000010001420
	.word	0x0b8cd5e4,0x2a4dffe5,0x3848cd42,0x79e6e70b	! PA = 0000000010001430
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
	.word	0x28566810,0x11e5fde1,0x6167e5ce,0x4c86d5e7	! PA = 0000000030001400
	.word	0x0321a1fc,0x662d2c9d,0x25a3f41a,0x321b4b83	! PA = 0000000030001410
	.word	0x05ec0fa8,0x53436819,0x5903e426,0x734c03df	! PA = 0000000030001420
	.word	0x28b8fd14,0x3c9f4c55,0x045261f2,0x4d1d7afb	! PA = 0000000030001430
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
	.word	0x057d7640,0x1dca3551,0x1d69d97e,0x288cecd7	! PA = 0000000010041400
	.word	0x3fcc472c,0x17dc3f0d,0x414076ca,0x34ec5573	! PA = 0000000010041410
	.word	0x0c41fbd8,0x47b84589,0x1bb425d6,0x60fe70cf	! PA = 0000000010041420
	.word	0x63b0e044,0x4107e4c5,0x691692a2,0x6ed2baeb	! PA = 0000000010041430
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
	.word	0x2e0d0070,0x49f778c1,0x3d79292e,0x1e616fc7	! PA = 0000000030041400
	.word	0x7118285c,0x33b21d7d,0x7db9157a,0x2ae78b63	! PA = 0000000030041410
	.word	0x4ecde408,0x6b9daef9,0x364b4386,0x1702c9bf	! PA = 0000000030041420
	.word	0x5f8f7f74,0x2156c935,0x3bc85f52,0x038da6db	! PA = 0000000030041430
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
	.word	0x341006a0,0x1d6cc831,0x4138d4de,0x0d3b5eb7	! PA = 0000000010081400
	.word	0x0b00458c,0x24ddc7ed,0x5020d02a,0x6cf3ed53	! PA = 0000000010081410
	.word	0x067ac838,0x0552a469,0x4e4c3d36,0x56f00eaf	! PA = 0000000010081420
	.word	0x6d2fdaa4,0x261af9a5,0x7d5ac802,0x54953ecb	! PA = 0000000010081430
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
	.word	0x435188d0,0x39e923a1,0x200bdc8e,0x1511b9a7	! PA = 0000000030081400
	.word	0x473f9ebc,0x6d4e3e5d,0x314aa6da,0x70b87b43	! PA = 0000000030081410
	.word	0x1df3a868,0x2df625d9,0x58fa12e6,0x1b1d3f9f	! PA = 0000000030081420
	.word	0x3b2cf1d4,0x66a37615,0x0a80ccb2,0x3ff082bb	! PA = 0000000030081430
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
	.word	0x515c8700,0x4beb8b11,0x7915403e,0x069b8097	! PA = 00000000100c1400
	.word	0x555133ec,0x15b280cd,0x4dc9998a,0x389c3533	! PA = 00000000100c1410
	.word	0x61a38498,0x41673349,0x4b57c496,0x06a15c8f	! PA = 00000000100c1420
	.word	0x05e1c504,0x38ff3e85,0x4bad6d62,0x286672ab	! PA = 00000000100c1430
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
	.word	0x4d7c0130,0x7ab2fe81,0x4337ffee,0x534fb387	! PA = 00000000300c1400
	.word	0x0a70051c,0x1d798f3d,0x35f0a83a,0x43c61b23	! PA = 00000000300c1410
	.word	0x2fb55cc8,0x4e44ccb9,0x4a285246,0x5553657f	! PA = 00000000300c1420
	.word	0x47695434,0x21fd52f5,0x6513aa12,0x657e0e9b	! PA = 00000000300c1430
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
	.word	0x50baf760,0x583e7df1,0x7d171b9e,0x7d655277	! PA = 0000000010101400
	.word	0x1197124c,0x6ad269ad,0x0dd2d2ea,0x7e1d2d13	! PA = 0000000010101410
	.word	0x281430f8,0x05edf229,0x59eebbf6,0x4bca5a6f	! PA = 0000000010101420
	.word	0x679e9f64,0x452cb365,0x66a682c2,0x337e568b	! PA = 0000000010101430
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
	.word	0x4de46990,0x514d0961,0x5d15934e,0x07d35d67	! PA = 0000000030101400
	.word	0x1b815b7c,0x3aac101d,0x3d43199a,0x30486b03	! PA = 0000000030101410
	.word	0x5c6b0128,0x2c81a399,0x0eee01a6,0x275d3b5f	! PA = 0000000030101420
	.word	0x6c1ca694,0x54dc5fd5,0x7c18f772,0x236e4a7b	! PA = 0000000030101430
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
	.word	0x418357c0,0x1d5da0d1,0x015666fe,0x6650d457	! PA = 0000000010141400
	.word	0x0ea9e0ac,0x10b5828d,0x1fd47c4a,0x6faed4f3	! PA = 0000000010141410
	.word	0x0024cd58,0x08dee109,0x3d292356,0x0e23084f	! PA = 0000000010141420
	.word	0x283e69c4,0x021b5845,0x1cde0822,0x0b14ea6b	! PA = 0000000010141430
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
	.word	0x61e2c1f0,0x2eaf4441,0x1fbc96ae,0x6d54b747	! PA = 0000000030141400
	.word	0x374ba1dc,0x275dc0fd,0x34d9fafa,0x0e776ae3	! PA = 0000000030141410
	.word	0x186c9588,0x54a4aa79,0x28632106,0x7ef2c13f	! PA = 0000000030141420
	.word	0x6d1ee8f4,0x6cb89cb5,0x3c28b4d2,0x74f9365b	! PA = 0000000030141430
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
	.word	0x4f0da820,0x2240f3b1,0x35eb225e,0x42160637	! PA = 0000000010181400
	.word	0x77619f0c,0x5fd3cb6d,0x4f6695aa,0x0b892cd3	! PA = 0000000010181410
	.word	0x2c2d59b8,0x2c31ffe9,0x341efab6,0x4163662f	! PA = 0000000010181420
	.word	0x39992424,0x13432d25,0x78ebfd82,0x10622e4b	! PA = 0000000010181430
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
	.word	0x42cf0a50,0x2fd1af21,0x39450a0e,0x4a8bc127	! PA = 0000000030181400
	.word	0x76a6d83c,0x3206a1dd,0x464d4c5a,0x028b1ac3	! PA = 0000000030181410
	.word	0x741219e8,0x7ea5e159,0x139fb066,0x55cbf71f	! PA = 0000000030181420
	.word	0x6a481b54,0x430a0995,0x4ddae232,0x2156d23b	! PA = 0000000030181430
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
	.word	0x40b1e880,0x19e07691,0x46ed4dbe,0x1d6ce817	! PA = 00000000201c0000
	.word	0x52964d6c,0x1ca5444d,0x24211f0a,0x1be434b3	! PA = 00000000201c0010
	.word	0x0a85d618,0x7ddf4ec9,0x79e84216,0x6543740f	! PA = 00000000201c0020
	.word	0x6986ce84,0x081c3205,0x416862e2,0x709e222b	! PA = 00000000201c0030
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
	.word	0x460142b0,0x1dac4a01,0x53c6ed6e,0x72307b07	! PA = 0000000020800000
	.word	0x4e6afe9c,0x151eb2bd,0x57350dba,0x7cbb7aa3	! PA = 0000000020800010
	.word	0x1bb38e48,0x0e7d4839,0x49bbafc6,0x31a0dcff	! PA = 0000000020800020
	.word	0x5f703db4,0x1d48a675,0x15c77f92,0x3bbf1e1b	! PA = 0000000020800030
	.word	0x79c818e0,0x63342971,0x5c74e91e,0x110d79f7	! PA = 0000000020800040
	.word	0x031febcc,0x77a1ed2d,0x619c186a,0x36f7ec93	! PA = 0000000020800050
	.word	0x15864278,0x37decda9,0x459cf976,0x057b31ef	! PA = 0000000020800060
	.word	0x61df68e4,0x5c1e66e5,0x78eb3842,0x2500c60b	! PA = 0000000020800070
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
	.word	0x5cd16b10,0x6d3714e1,0x155a40ce,0x42fae4e7	! PA = 00000000211c0000
	.word	0x0f7014fc,0x771df39d,0x09293f1a,0x39408a83	! PA = 00000000211c0010
	.word	0x57a8f2a8,0x1422df19,0x3fcf1f26,0x242972df	! PA = 00000000211c0020
	.word	0x246f5014,0x2cec7355,0x34868cf2,0x236a19fb	! PA = 00000000211c0030
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
	.word	0x79a83940,0x09340c51,0x1a99f47e,0x41afbbd7	! PA = 0000000021800000
	.word	0x47d67a2c,0x0d41c60d,0x076f81ca,0x3efc5473	! PA = 0000000021800010
	.word	0x63869ed8,0x40287c89,0x4a5520d6,0x39c29fcf	! PA = 0000000021800020
	.word	0x287af344,0x76c1cbc5,0x5e0c7da2,0x72c219eb	! PA = 0000000021800030
	.word	0x14978370,0x3f6a0fc1,0x2017042e,0x27a2fec7	! PA = 0000000021800040
	.word	0x668e1b5c,0x6a7c647d,0x39c1e07a,0x40524a63	! PA = 0000000021800050
	.word	0x0c4a4708,0x4b8ea5f9,0x66f1fe86,0x4b1db8bf	! PA = 0000000021800060
	.word	0x6d1d5274,0x0f6d7035,0x06b00a52,0x038fc5db	! PA = 0000000021800070
	.word	0x5baa49a0,0x42d81f31,0x21746fde,0x600badb7	! PA = 0000000021800080
	.word	0x3b91f88c,0x65fcceed,0x51335b2a,0x62296c53	! PA = 0000000021800090
	.word	0x26deeb38,0x28b45b69,0x3728b836,0x25d1bdaf	! PA = 00000000218000a0
	.word	0x1f316da4,0x2b7e60a5,0x6b643302,0x6b1a1dcb	! PA = 00000000218000b0
	.word	0x16ab8bd0,0x613d3aa1,0x1215378e,0x16e0c8a7	! PA = 00000000218000c0
	.word	0x5c9d11bc,0x6db2055d,0x0296f1da,0x6628ba43	! PA = 00000000218000d0
	.word	0x39ef8b68,0x1cb89cd9,0x2c3c4de6,0x5035ae9f	! PA = 00000000218000e0
	.word	0x495244d4,0x4e439d15,0x24dbf7b2,0x536821bb	! PA = 00000000218000f0
	.word	0x57264a00,0x73186211,0x0d1c5b3e,0x28d94f97	! PA = 0000000021800100
	.word	0x552a66ec,0x764b07cd,0x367fa48a,0x1ab73433	! PA = 0000000021800110
	.word	0x2de72798,0x2f7a6a49,0x372fbf96,0x79608b8f	! PA = 0000000021800120
	.word	0x03dad804,0x39cc2585,0x578a5862,0x6b40d1ab	! PA = 0000000021800130
	.word	0x28658430,0x4ba89581,0x056cdaee,0x136c4287	! PA = 0000000021800140
	.word	0x5674f81c,0x6b36d63d,0x3940733a,0x4afbda23	! PA = 0000000021800150
	.word	0x7cf0bfc8,0x1b98c3b9,0x78c60d46,0x6929547f	! PA = 0000000021800160
	.word	0x24e62734,0x5ee6f9f5,0x63a25512,0x562b2d9b	! PA = 0000000021800170
	.word	0x3f743a60,0x28ecd4f1,0x75a9b69e,0x64d0a177	! PA = 0000000021800180
	.word	0x6777c54c,0x1ea470ad,0x6aec5dea,0x2eddac13	! PA = 0000000021800190
	.word	0x62f753f8,0x3e72a929,0x718236f6,0x7027096f	! PA = 00000000218001a0
	.word	0x704f3264,0x4d231a65,0x1516edc2,0x1c6e358b	! PA = 00000000218001b0
	.word	0x2b1d6c90,0x23a42061,0x1035ee4e,0x2bfd6c67	! PA = 00000000218001c0
	.word	0x14edce7c,0x3982d71d,0x6f56649a,0x5b03aa03	! PA = 00000000218001d0
	.word	0x0da5e428,0x08271a99,0x31a73ca6,0x57b0aa5f	! PA = 00000000218001e0
	.word	0x47b0f994,0x22cf86d5,0x539b2272,0x1b10e97b	! PA = 00000000218001f0
share3_end:
