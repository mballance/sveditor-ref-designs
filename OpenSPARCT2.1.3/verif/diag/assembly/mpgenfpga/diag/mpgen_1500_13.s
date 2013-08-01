/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: mpgen_1500_13.s
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
!	Seed = 327144531
!	Riesling can be on
!	1 Thread, 1500 lines
!	mpgen   created on Dec 20, 2005 (16:35:03)
!	mpgen_1500_13.s created on Mar 27, 2009 (14:45:31)
!	RC file : random.rc
!	cmd = /import/n2-tools/release/tools/mpgen/mpgen,1.051220 -rc random.rc -o mpgen_1500_13 -p 1 -l 1500

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
!	%f0  = bb39f194 50da037b 4ca345a9 0ce5a2fe
!	%f4  = deb58b8c c0731d1f 194fb118 3d26d9f2
!	%f8  = 8e91a4b5 ab0475bb 9ed29eb3 5645af12
!	%f12 = b5eb03d4 9b090905 7a906651 0aad7812
	ldda	[%g1]ASI_BLK_P,%f0
	add	%g1,64,%g1
!	%f16 = 65af5b19 f975d25e b8a4f35c e6689720
!	%f20 = aeceb108 c3d97b6f 4a6d6276 77cebcc5
!	%f24 = a226b52a 6bcc8e3c 5ddf2b10 fe453ffd
!	%f28 = 29b8bca0 3895a976 fe120093 73a028f7
	ldda	[%g1]ASI_BLK_P,%f16
	add	%g1,64,%g1
!	%f32 = f4126596 1e574e0f a1e72352 4492779a
!	%f36 = 15f979ce f445ee5b 847db64b 0377978f
!	%f40 = 3ccc1f01 56157e93 324010da 3b7fc135
!	%f44 = 389c30f2 d4e18a2c 9c11db14 c65b74b2
	ldda	[%g1]ASI_BLK_P,%f32

!	Set up the Graphics Status Register

	setx	0x6a7cc0f00000006b,%g7,%g1 ! GSR scale = 13, align = 3
	wr	%g1,%g0,%gsr		! GSR = 6a7cc0f00000006b
	wr	%g0,%y			! Clear Y register
	xorcc	%g0,%g0,%g3		! init %g3 and set flags
	membar	#Sync			! Force the block loads to complete

!	Start of Random Code for processor 0

p0_label_1:
!	Mem[0000000030041400] = c2a22bd2, %f21 = c3d97b6f
	lda	[%i1+%g0]0x81,%f21	! %f21 = c2a22bd2
!	%l4 = c2b0875a, %l5 = d0e01693, Mem[0000000010001410] = a1239e75 0d694ce8
	stda	%l4,[%i0+%o5]0x80	! Mem[0000000010001410] = c2b0875a d0e01693
!	Mem[000000001014143c] = 0bd2cbf6, %l3 = 31ba4d3224eb33d0
	swap	[%i5+0x03c],%l3		! %l3 = 000000000bd2cbf6
!	%l6 = 2581d259, %l7 = 2b0214d4, Mem[0000000010081400] = 8f794dbb f70e364d
	stda	%l6,[%i2+%g0]0x80	! Mem[0000000010081400] = 2581d259 2b0214d4
!	%f2  = 4ca345a9, %f18 = b8a4f35c
	fsqrts	%f2 ,%f18		! %f18 = 46109074
!	Mem[0000000010041408] = a6419a09, %f8  = 8e91a4b5
	lda	[%i1+%o4]0x88,%f8 	! %f8 = a6419a09
!	%l6 = 2581d259, %l7 = 2b0214d4, Mem[0000000010081408] = 7d8a61c8 81c6ebca
	stda	%l6,[%i2+%o4]0x80	! Mem[0000000010081408] = 2581d259 2b0214d4
!	Mem[0000000010081410] = bb1019c7, %l6 = 3f5bdda62581d259
	lduha	[%i2+%o5]0x80,%l6	! %l6 = 000000000000bb10
!	Mem[0000000010181428] = fd86d76b, %l4 = 6258d2dfc2b0875a
	lduba	[%i6+0x02a]%asi,%l4	! %l4 = 00000000000000d7
!	Starting 10 instruction Store Burst
!	Mem[0000000030041400] = c2a22bd2, %l1 = 41c81128d0dccfb8
	swapa	[%i1+%g0]0x81,%l1	! %l1 = 00000000c2a22bd2

p0_label_2:
!	Mem[0000000010181434] = d053f9be, %l2 = 119eb776, %l5 = d0e01693
	add	%i6,0x34,%g1
	casa	[%g1]0x80,%l2,%l5	! %l5 = 00000000d053f9be
!	%l2 = 1e74cc60119eb776, Mem[0000000030101410] = 9b000e66
	stwa	%l2,[%i4+%o5]0x81	! Mem[0000000030101410] = 119eb776
!	%l6 = 000000000000bb10, Mem[0000000030141410] = bad94550
	stwa	%l6,[%i5+%o5]0x81	! Mem[0000000030141410] = 0000bb10
!	%f8  = a6419a09, Mem[00000000300c1400] = 33e0e3e6
	sta	%f8 ,[%i3+%g0]0x81	! Mem[00000000300c1400] = a6419a09
!	%f28 = 29b8bca0 3895a976, %l2 = 1e74cc60119eb776
!	Mem[0000000010181428] = fd86d76b798bf8f0
	add	%i6,0x028,%g1
	stda	%f28,[%g1+%l2]ASI_PST16_PL ! Mem[0000000010181428] = fd869538a0bcf8f0
!	Mem[00000000218000c1] = 34511f7c, %l4 = 00000000000000d7
	ldstuba	[%o3+0x0c1]%asi,%l4	! %l4 = 00000051000000ff
!	%l0 = ea2ec714381f37a2, Mem[0000000010041408] = a6419a09
	stba	%l0,[%i1+%o4]0x88	! Mem[0000000010041408] = a6419aa2
!	Mem[0000000010081408] = 2581d259, %l0 = ea2ec714381f37a2
	lduwa	[%i2+%o4]0x80,%l0	! %l0 = 000000002581d259
!	Mem[0000000010001410] = c2b0875ad0e01693, %l2 = 1e74cc60119eb776, %l3 = 000000000bd2cbf6
	add	%i0,0x10,%g1
	casxa	[%g1]0x80,%l2,%l3	! %l3 = c2b0875ad0e01693
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = 3799ca51, %f14 = 7a906651
	lda	[%i2+%o4]0x89,%f14	! %f14 = 3799ca51

p0_label_3:
	membar	#Sync			! Added by membar checker (1)
!	Mem[0000000010041400] = e48b080d 27241cd9 a29a41a6 f6caade5
!	Mem[0000000010041410] = c54a54ee bc3dd5c9 adb67a0b 9b0b3082
!	Mem[0000000010041420] = dcfd5948 fc8adb11 043cd029 7d7a88ba
!	Mem[0000000010041430] = 8cf6b2b0 fdcbd7c0 7f13c6bb 454f66d7
	ldda	[%i1]ASI_BLK_AIUP,%f0	! Block Load from 0000000010041400
!	Mem[0000000030081400] = e1a9c4e1, %l6 = 000000000000bb10
	ldswa	[%i2+%g0]0x81,%l6	! %l6 = ffffffffe1a9c4e1
!	Mem[0000000030181410] = 21e99f37, %l6 = ffffffffe1a9c4e1
	lduha	[%i6+%o5]0x81,%l6	! %l6 = 00000000000021e9
!	Mem[0000000030141410] = 0000bb10, %l2 = 1e74cc60119eb776
	lduba	[%i5+%o5]0x81,%l2	! %l2 = 0000000000000000
!	%l7 = 3306d4122b0214d4, Mem[0000000010141410] = 78ff62a3
	stba	%l7,[%i5+%o5]0x80	! Mem[0000000010141410] = d4ff62a3
!	Mem[0000000030041408] = 67e15ba0, %l1 = 00000000c2a22bd2
	ldsba	[%i1+%o4]0x81,%l1	! %l1 = 0000000000000067
!	Mem[0000000010081400] = 59d28125, %l2 = 0000000000000000
	lduba	[%i2+%g0]0x88,%l2	! %l2 = 0000000000000025
!	Mem[0000000010081410] = bb1019c7, %f16 = 65af5b19
	lda	[%i2+%o5]0x80,%f16	! %f16 = bb1019c7
!	Mem[00000000300c1400] = ee3bf804099a41a6, %f28 = 29b8bca0 3895a976
	ldda	[%i3+%g0]0x89,%f28	! %f28 = ee3bf804 099a41a6
!	Starting 10 instruction Store Burst
!	%f16 = bb1019c7 f975d25e, Mem[0000000030101408] = 065677d3 822af476
	stda	%f16,[%i4+%o4]0x89	! Mem[0000000030101408] = bb1019c7 f975d25e

p0_label_4:
!	%f30 = fe120093 73a028f7, Mem[0000000030101410] = 119eb776 0249d304
	stda	%f30,[%i4+%o5]0x81	! Mem[0000000030101410] = fe120093 73a028f7
!	%l6 = 00000000000021e9, Mem[0000000010141400] = 34570b61f770809b
	stxa	%l6,[%i5+%g0]0x80	! Mem[0000000010141400] = 00000000000021e9
!	%l7 = 3306d4122b0214d4, Mem[0000000030101410] = 930012fe
	stba	%l7,[%i4+%o5]0x89	! Mem[0000000030101410] = 930012d4
!	%l2 = 0000000000000025, %l7 = 3306d4122b0214d4, %l6 = 00000000000021e9
	xor	%l2,%l7,%l6		! %l6 = 3306d4122b0214f1
!	Mem[0000000010101408] = 2b9cbb0ceb7e47ce, %l0 = 000000002581d259, %l5 = 00000000d053f9be
	add	%i4,0x08,%g1
	casxa	[%g1]0x80,%l0,%l5	! %l5 = 2b9cbb0ceb7e47ce
!	Mem[0000000010001410] = c2b0875a, %l1 = 0000000000000067
	ldstuba	[%i0+%o5]0x80,%l1	! %l1 = 000000c2000000ff
!	%l3 = c2b0875ad0e01693, immd = ffffffffffffff01, %l6  = 3306d4122b0214f1
	mulx	%l3,-0x0ff,%l6		! %l6 = 12292c89f0c98393
!	%l3 = c2b0875ad0e01693, imm = fffffffffffffedf, %l5 = 2b9cbb0ceb7e47ce
	xnor	%l3,-0x121,%l5		! %l5 = c2b0875ad0e017b3
!	Mem[0000000010081408] = 59d28125, %l3 = c2b0875ad0e01693
	swapa	[%i2+%o4]0x88,%l3	! %l3 = 0000000059d28125
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = 9316e0d0, %l1 = 00000000000000c2
	ldsba	[%i2+%o4]0x80,%l1	! %l1 = ffffffffffffff93

p0_label_5:
!	Mem[0000000010001434] = 891e9a2e, %l3 = 0000000059d28125
	ldub	[%i0+0x037],%l3		! %l3 = 000000000000002e
!	Mem[0000000030101400] = 97a58b47, %l6 = 12292c89f0c98393
	ldsha	[%i4+%g0]0x81,%l6	! %l6 = ffffffffffff97a5
!	Mem[0000000010101438] = 8065adb4, %l3 = 000000000000002e
	ldsw	[%i4+0x038],%l3		! %l3 = ffffffff8065adb4
!	Mem[0000000030001400] = 7324127f, %l5 = c2b0875ad0e017b3
	lduwa	[%i0+%g0]0x89,%l5	! %l5 = 000000007324127f
!	Mem[0000000030001408] = 4af80201bfa24376, %l3 = ffffffff8065adb4
	ldxa	[%i0+%o4]0x81,%l3	! %l3 = 4af80201bfa24376
!	Mem[000000001004141c] = 9b0b3082, %l6 = ffffffffffff97a5
	ldsb	[%i1+0x01e],%l6		! %l6 = 0000000000000030
!	Mem[0000000010081408] = 9316e0d02b0214d4, %l6 = 0000000000000030
	ldxa	[%i2+%o4]0x80,%l6	! %l6 = 9316e0d02b0214d4
!	Mem[0000000010181418] = 8cfee654, %l0 = 000000002581d259
	ldsb	[%i6+0x019],%l0		! %l0 = fffffffffffffffe
!	Mem[000000001014141c] = 35112447, %f16 = bb1019c7
	lda	[%i5+0x01c]%asi,%f16	! %f16 = 35112447
!	Starting 10 instruction Store Burst
!	Mem[00000000211c0001] = ca052346, %l4 = 0000000000000051
	ldstub	[%o2+0x001],%l4		! %l4 = 00000005000000ff

p0_label_6:
!	Mem[0000000020800000] = 1d39d48e, %l1 = ffffffffffffff93
	ldstuba	[%o1+0x000]%asi,%l1	! %l1 = 0000001d000000ff
!	%f20 = aeceb108 c2a22bd2, Mem[0000000010181408] = 126700e3 84e5a5f8
	stda	%f20,[%i6+%o4]0x80	! Mem[0000000010181408] = aeceb108 c2a22bd2
!	%l6 = 2b0214d4, %l7 = 2b0214d4, Mem[00000000300c1408] = d37475d9 c8396a95
	stda	%l6,[%i3+%o4]0x89	! Mem[00000000300c1408] = 2b0214d4 2b0214d4
!	Mem[0000000010081413] = bb1019c7, %l7 = 3306d4122b0214d4
	ldstub	[%i2+0x013],%l7		! %l7 = 000000c7000000ff
!	%f16 = 35112447 f975d25e 46109074 e6689720
!	%f20 = aeceb108 c2a22bd2 4a6d6276 77cebcc5
!	%f24 = a226b52a 6bcc8e3c 5ddf2b10 fe453ffd
!	%f28 = ee3bf804 099a41a6 fe120093 73a028f7
	stda	%f16,[%i4]ASI_BLK_S	! Block Store to 0000000030101400
!	%l5 = 000000007324127f, immed = fffff697, %y  = 00000000
	sdiv	%l5,-0x969,%l0		! %l0 = fffffffffff3c3a2
	mov	%l0,%y			! %y = fff3c3a2
!	%l4 = 0000000000000005, Mem[0000000010181408] = 08b1ceae
	stwa	%l4,[%i6+%o4]0x88	! Mem[0000000010181408] = 00000005
	membar	#Sync			! Added by membar checker (2)
!	%l6 = 9316e0d02b0214d4, Mem[0000000010041408] = a29a41a6
	stha	%l6,[%i1+%o4]0x80	! Mem[0000000010041408] = 14d441a6
!	Mem[0000000030001408] = 0102f84a, %l6 = 9316e0d02b0214d4
	ldstuba	[%i0+%o4]0x89,%l6	! %l6 = 0000004a000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = f4e206e3, %l1 = 000000000000001d
	ldswa	[%i3+%o5]0x81,%l1	! %l1 = fffffffff4e206e3

p0_label_7:
!	Mem[0000000010081438] = ca434b01, %l4 = 0000000000000005
	lduw	[%i2+0x038],%l4		! %l4 = 00000000ca434b01
!	Mem[0000000030181400] = 39fea61a, %l3 = 4af80201bfa24376
	lduba	[%i6+%g0]0x81,%l3	! %l3 = 0000000000000039
!	%f2  = a29a41a6, %f14 = 7f13c6bb, %f2  = a29a41a6
	fdivs	%f2 ,%f14,%f2 		! %f2  = 80000000
!	%l7 = 00000000000000c7, imm = fffffffffffffdc8, %l6 = 000000000000004a
	addc	%l7,-0x238,%l6		! %l6 = fffffffffffffe8f
!	Mem[0000000010041400] = d91c24270d088be4, %l3 = 0000000000000039
	ldxa	[%i1+%g0]0x88,%l3	! %l3 = d91c24270d088be4
!	Mem[0000000030041408] = 67e15ba0, %l7 = 00000000000000c7
	lduba	[%i1+%o4]0x81,%l7	! %l7 = 0000000000000067
!	Mem[0000000010001410] = ffb0875a, %l0 = fffffffffff3c3a2
	ldsba	[%i0+%o5]0x80,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000030001408] = fff80201, %l5 = 000000007324127f
	ldsha	[%i0+%o4]0x81,%l5	! %l5 = fffffffffffffff8
!	Mem[0000000030001400] = 7f122473, %l1 = fffffffff4e206e3
	lduwa	[%i0+%g0]0x81,%l1	! %l1 = 000000007f122473
!	Starting 10 instruction Store Burst
!	Mem[0000000010101410] = e974a7ec, %l6 = fffffffffffffe8f
	swapa	[%i4+%o5]0x88,%l6	! %l6 = 00000000e974a7ec

p0_label_8:
!	%f3  = f6caade5, Mem[0000000010181410] = bf98331b
	sta	%f3 ,[%i6+%o5]0x88	! Mem[0000000010181410] = f6caade5
!	%f16 = 35112447, %f18 = 46109074, %f26 = 5ddf2b10
	fmuls	%f16,%f18,%f26		! %f26 = 3ba3ec9c
!	%l5 = fffffffffffffff8, Mem[0000000030101410] = aeceb108
	stwa	%l5,[%i4+%o5]0x81	! Mem[0000000030101410] = fffffff8
!	Mem[0000000010081408] = d0e01693, %l0 = ffffffffffffffff
	swapa	[%i2+%o4]0x88,%l0	! %l0 = 00000000d0e01693
!	%f5  = bc3dd5c9, Mem[0000000010181420] = 96824f21
	sta	%f5 ,[%i6+0x020]%asi	! Mem[0000000010181420] = bc3dd5c9
!	%l7 = 0000000000000067, Mem[0000000030041410] = a204cc3f
	stha	%l7,[%i1+%o5]0x81	! Mem[0000000030041410] = 0067cc3f
!	%l4 = ca434b01, %l5 = fffffff8, Mem[00000000100c1400] = 868a0078 f83a33c5
	stda	%l4,[%i3+%g0]0x88	! Mem[00000000100c1400] = ca434b01 fffffff8
!	%l4 = 00000000ca434b01, Mem[0000000030041400] = d0dccfb8
	stwa	%l4,[%i1+%g0]0x81	! Mem[0000000030041400] = ca434b01
!	Mem[0000000010041418] = adb67a0b9b0b3082, %l5 = fffffffffffffff8, %l4 = 00000000ca434b01
	add	%i1,0x18,%g1
	casxa	[%g1]0x80,%l5,%l4	! %l4 = adb67a0b9b0b3082
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = bb5fd27d, %l7 = 0000000000000067
	lduba	[%o0+0x000]%asi,%l7	! %l7 = 00000000000000bb

p0_label_9:
!	Mem[0000000010001410] = ffb0875a d0e01693, %l4 = 9b0b3082, %l5 = fffffff8
	ldda	[%i0+%o5]0x80,%l4	! %l4 = 00000000ffb0875a 00000000d0e01693
!	Mem[0000000010001408] = e4f50d697500cd4c, %f0  = e48b080d 27241cd9
	ldda	[%i0+%o4]0x80,%f0 	! %f0  = e4f50d69 7500cd4c
!	Mem[0000000010001400] = 5a12d404, %l4 = 00000000ffb0875a
	ldswa	[%i0+%g0]0x80,%l4	! %l4 = 000000005a12d404
!	Mem[0000000030001408] = 0102f8ff, %f29 = 099a41a6
	lda	[%i0+%o4]0x89,%f29	! %f29 = 0102f8ff
!	Mem[0000000010001410] = ffb0875a, %l7 = 00000000000000bb
	lduha	[%i0+%o5]0x80,%l7	! %l7 = 000000000000ffb0
!	Mem[00000000300c1400] = 099a41a6, %l4 = 000000005a12d404
	lduwa	[%i3+%g0]0x89,%l4	! %l4 = 00000000099a41a6
!	Mem[0000000030081400] = e1c4a9e1, %l0 = 00000000d0e01693
	ldswa	[%i2+%g0]0x89,%l0	! %l0 = ffffffffe1c4a9e1
!	Mem[0000000030181410] = 379fe921, %f17 = f975d25e
	lda	[%i6+%o5]0x89,%f17	! %f17 = 379fe921
!	Mem[0000000030101400] = 35112447f975d25e, %l2 = 0000000000000025
	ldxa	[%i4+%g0]0x81,%l2	! %l2 = 35112447f975d25e
!	Starting 10 instruction Store Burst
!	%l3 = d91c24270d088be4, Mem[0000000030101400] = 35112447
	stwa	%l3,[%i4+%g0]0x81	! Mem[0000000030101400] = 0d088be4

p0_label_10:
!	Mem[00000000201c0001] = bb5fd27d, %l0 = ffffffffe1c4a9e1
	ldstub	[%o0+0x001],%l0		! %l0 = 0000005f000000ff
!	%f17 = 379fe921, Mem[0000000010081424] = ab84e8d7
	st	%f17,[%i2+0x024]	! Mem[0000000010081424] = 379fe921
!	%l7 = 000000000000ffb0, Mem[0000000030181400] = 39fea61a
	stha	%l7,[%i6+%g0]0x81	! Mem[0000000030181400] = ffb0a61a
!	%l0 = 000000000000005f, Mem[0000000010001430] = 82e0d056
	stw	%l0,[%i0+0x030]		! Mem[0000000010001430] = 0000005f
!	%l5 = 00000000d0e01693, %l0 = 000000000000005f, %l1 = 000000007f122473
	xnor	%l5,%l0,%l1		! %l1 = ffffffff2f1fe933
!	%l1 = ffffffff2f1fe933, immd = 000000000000037f, %l5 = 00000000d0e01693
	sdivx	%l1,0x37f,%l5		! %l5 = ffffffffffc44131
!	%f6  = adb67a0b 9b0b3082, %l5 = ffffffffffc44131
!	Mem[0000000010001418] = 941700112a74994a
	add	%i0,0x018,%g1
	stda	%f6,[%g1+%l5]ASI_PST32_P ! Mem[0000000010001418] = 941700119b0b3082
!	Mem[0000000010101430] = 098556d2f1abf392, %l3 = d91c24270d088be4, %l4 = 00000000099a41a6
	add	%i4,0x30,%g1
	casxa	[%g1]0x80,%l3,%l4	! %l4 = 098556d2f1abf392
!	%f30 = fe120093 73a028f7, %l2 = 35112447f975d25e
!	Mem[00000000100c1410] = cc45b0c9496d45a4
	add	%i3,0x010,%g1
	stda	%f30,[%g1+%l2]ASI_PST16_P ! Mem[00000000100c1410] = fe12009373a045a4
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = 46109074e6689720, %l7 = 000000000000ffb0
	ldxa	[%i4+%o4]0x81,%l7	! %l7 = 46109074e6689720

p0_label_11:
!	Mem[0000000010081400] = 2581d2592b0214d4, %f18 = 46109074 e6689720
	ldd	[%i2+%g0],%f18		! %f18 = 2581d259 2b0214d4
!	Mem[00000000100c1420] = 22544310, %l6 = 00000000e974a7ec
	ldub	[%i3+0x021],%l6		! %l6 = 0000000000000054
!	Mem[00000000100c1400] = 014b43ca, %f27 = fe453ffd
	lda	[%i3+%g0]0x80,%f27	! %f27 = 014b43ca
!	Mem[0000000030041410] = 0067cc3f, %l7 = 46109074e6689720
	ldsha	[%i1+%o5]0x81,%l7	! %l7 = 0000000000000067
!	Mem[0000000010101408] = 0cbb9c2b, %l7 = 0000000000000067
	ldswa	[%i4+%o4]0x88,%l7	! %l7 = 000000000cbb9c2b
!	%f0  = e4f50d69 7500cd4c, %f24 = a226b52a
	fxtos	%f0 ,%f24		! %f24 = ddd85795
!	Mem[0000000010141410] = a362ffd4, %l7 = 000000000cbb9c2b
	ldswa	[%i5+%o5]0x88,%l7	! %l7 = ffffffffa362ffd4
!	%f17 = 379fe921, %f7  = 9b0b3082
	fsqrts	%f17,%f7 		! %f7  = 3b8f1182
!	Mem[0000000030001410] = 33de88d9 6aecb8fd, %l0 = 0000005f, %l1 = 2f1fe933
	ldda	[%i0+%o5]0x81,%l0	! %l0 = 0000000033de88d9 000000006aecb8fd
!	Starting 10 instruction Store Burst
!	%f6  = adb67a0b 3b8f1182, %l4 = 098556d2f1abf392
!	Mem[0000000010101428] = fe837a55e323a0e2
	add	%i4,0x028,%g1
	stda	%f6,[%g1+%l4]ASI_PST8_PL ! Mem[0000000010101428] = fe117a550b23a0ad

p0_label_12:
!	%l3 = d91c24270d088be4, %l5 = ffffffffffc44131, %l0 = 0000000033de88d9
	sub	%l3,%l5,%l0		! %l0 = d91c24270d444ab3
!	%l7 = ffffffffa362ffd4, imm = fffffffffffff595, %l7 = ffffffffa362ffd4
	xnor	%l7,-0xa6b,%l7		! %l7 = ffffffffa362f5be
!	Mem[0000000010181410] = f6caade5, %l0 = d91c24270d444ab3
	swapa	[%i6+%o5]0x88,%l0	! %l0 = 00000000f6caade5
!	%l3 = d91c24270d088be4, Mem[0000000010101408] = 2b9cbb0c
	stba	%l3,[%i4+%o4]0x80	! Mem[0000000010101408] = e49cbb0c
!	%l2 = 35112447f975d25e, immed = fffff12f, %y  = fff3c3a2
	sdiv	%l2,-0xed1,%l1		! %l1 = 000000007fffffff
	mov	%l0,%y			! %y = f6caade5
!	%f12 = 8cf6b2b0 fdcbd7c0, %l0 = 00000000f6caade5
!	Mem[0000000010141428] = b2057fb4a2393d1c
	add	%i5,0x028,%g1
	stda	%f12,[%g1+%l0]ASI_PST16_P ! Mem[0000000010141428] = b205b2b0a239d7c0
!	%f11 = 7d7a88ba, Mem[0000000010141420] = 647c79a8
	sta	%f11,[%i5+0x020]%asi	! Mem[0000000010141420] = 7d7a88ba
!	Mem[00000000218001c1] = 2d5b63d1, %l7 = ffffffffa362f5be
	ldstub	[%o3+0x1c1],%l7		! %l7 = 0000005b000000ff
!	%l4 = f1abf392, %l5 = ffc44131, Mem[0000000010041420] = dcfd5948 fc8adb11
	stda	%l4,[%i1+0x020]%asi	! Mem[0000000010041420] = f1abf392 ffc44131
!	Starting 10 instruction Load Burst
!	Mem[0000000030101410] = f8ffffff, %l6 = 0000000000000054
	ldsba	[%i4+%o5]0x89,%l6	! %l6 = ffffffffffffffff

p0_label_13:
!	Mem[0000000010101408] = 0cbb9ce4, %l7 = 000000000000005b
	lduwa	[%i4+%o4]0x88,%l7	! %l7 = 000000000cbb9ce4
!	Mem[0000000021800080] = 7134bafb, %l1 = 000000007fffffff
	ldsh	[%o3+0x080],%l1		! %l1 = 0000000000007134
!	Mem[0000000010041410] = c54a54ee, %l2 = 35112447f975d25e
	ldsha	[%i1+%o5]0x80,%l2	! %l2 = ffffffffffffc54a
!	%l5 = ffffffffffc44131, imm = 0000000000000769, %l4 = 098556d2f1abf392
	sub	%l5,0x769,%l4		! %l4 = ffffffffffc439c8
!	Mem[0000000010001410] = ffb0875ad0e01693, %f4  = c54a54ee bc3dd5c9
	ldda	[%i0+%o5]0x80,%f4 	! %f4  = ffb0875a d0e01693
!	Mem[0000000010181400] = d20ab5f5 1947d4fb, %l6 = ffffffff, %l7 = 0cbb9ce4
	ldda	[%i6+%g0]0x80,%l6	! %l6 = 00000000d20ab5f5 000000001947d4fb
!	Mem[00000000100c1438] = a3bea7c9, %l5 = ffffffffffc44131
	lduw	[%i3+0x038],%l5		! %l5 = 00000000a3bea7c9
!	Mem[0000000010081410] = bb1019ff 241c4fd1, %l0 = f6caade5, %l1 = 00007134
	ldda	[%i2+%o5]0x80,%l0	! %l0 = 00000000bb1019ff 00000000241c4fd1
!	Mem[0000000010041424] = ffc44131, %l3 = d91c24270d088be4
	lduha	[%i1+0x024]%asi,%l3	! %l3 = 000000000000ffc4
!	Starting 10 instruction Store Burst
!	%f28 = ee3bf804 0102f8ff, Mem[0000000030181410] = 379fe921 78ab7d1e
	stda	%f28,[%i6+%o5]0x89	! Mem[0000000030181410] = ee3bf804 0102f8ff

p0_label_14:
!	Mem[0000000030041400] = 014b43ca, %l1 = 00000000241c4fd1
	swapa	[%i1+%g0]0x89,%l1	! %l1 = 00000000014b43ca
!	Mem[0000000021800001] = 0b18d806, %l3 = 000000000000ffc4
	ldstuba	[%o3+0x001]%asi,%l3	! %l3 = 00000018000000ff
!	%f22 = 4a6d6276 77cebcc5, Mem[0000000010181410] = b34a440d 72566df3
	stda	%f22,[%i6+%o5]0x80	! Mem[0000000010181410] = 4a6d6276 77cebcc5
!	%f10 = 043cd029 7d7a88ba, Mem[0000000010141400] = 00000000 000021e9
	stda	%f10,[%i5+%g0]0x80	! Mem[0000000010141400] = 043cd029 7d7a88ba
!	%f0  = e4f50d69 7500cd4c, Mem[0000000010181410] = 4a6d6276 77cebcc5
	stda	%f0 ,[%i6+%o5]0x80	! Mem[0000000010181410] = e4f50d69 7500cd4c
!	Mem[0000000010001400] = 5a12d404, %l3 = 0000000000000018
	ldstuba	[%i0+%g0]0x80,%l3	! %l3 = 0000005a000000ff
!	Mem[0000000030081410] = 6dd09ed9, %l3 = 000000000000005a
	ldstuba	[%i2+%o5]0x89,%l3	! %l3 = 000000d9000000ff
!	%l1 = 00000000014b43ca, Mem[0000000030041410] = 0067cc3f
	stwa	%l1,[%i1+%o5]0x81	! Mem[0000000030041410] = 014b43ca
!	Mem[0000000010001419] = 94170011, %l6 = 00000000d20ab5f5
	ldstuba	[%i0+0x019]%asi,%l6	! %l6 = 00000017000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = 09243570, %l2 = ffffffffffffc54a
	ldsha	[%i5+%o4]0x81,%l2	! %l2 = 0000000000000924

p0_label_15:
!	Mem[0000000030041400] = 241c4fd1, %f30 = fe120093
	lda	[%i1+%g0]0x89,%f30	! %f30 = 241c4fd1
!	Mem[0000000010081410] = ff1910bb, %l4 = ffffffffffc439c8
	ldsha	[%i2+%o5]0x88,%l4	! %l4 = 00000000000010bb
!	Mem[0000000020800040] = 08e52a9b, %l5 = 00000000a3bea7c9
	ldsba	[%o1+0x040]%asi,%l5	! %l5 = 0000000000000008
!	Mem[0000000030181400] = ffb0a61a, %l2 = 0000000000000924
	ldswa	[%i6+%g0]0x81,%l2	! %l2 = ffffffffffb0a61a
!	Mem[0000000010181430] = dc70e383, %l4 = 00000000000010bb
	ldswa	[%i6+0x030]%asi,%l4	! %l4 = ffffffffdc70e383
!	Mem[00000000300c1400] = a6419a09, %l7 = 000000001947d4fb
	lduba	[%i3+%g0]0x81,%l7	! %l7 = 00000000000000a6
!	Mem[0000000020800040] = 08e52a9b, %l5 = 0000000000000008
	ldub	[%o1+0x041],%l5		! %l5 = 00000000000000e5
	membar	#Sync			! Added by membar checker (3)
!	Mem[0000000030041400] = d14f1c24 39f7b0d6 67e15ba0 fb191258
!	Mem[0000000030041410] = 014b43ca 4c8cc301 949a1396 8efa15af
!	Mem[0000000030041420] = 901acbd0 73a3db94 579dfb69 56c2070a
!	Mem[0000000030041430] = c472f652 45be3a33 466c4463 e28fa055
	ldda	[%i1]ASI_BLK_S,%f0	! Block Load from 0000000030041400
!	Mem[0000000030081410] = 1ce9b0686dd09eff, %f20 = aeceb108 c2a22bd2
	ldda	[%i2+%o5]0x89,%f20	! %f20 = 1ce9b068 6dd09eff
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (4)
!	%l6 = 0000000000000017, Mem[0000000030041408] = a05be167
	stha	%l6,[%i1+%o4]0x89	! Mem[0000000030041408] = a05b0017

p0_label_16:
!	Mem[00000000300c1410] = f4e206e3, %l2 = ffffffffffb0a61a
	swapa	[%i3+%o5]0x81,%l2	! %l2 = 00000000f4e206e3
!	%l2 = 00000000f4e206e3, Mem[0000000010081408] = ffffffff
	stba	%l2,[%i2+%o4]0x80	! Mem[0000000010081408] = e3ffffff
!	%l2 = f4e206e3, %l3 = 000000d9, Mem[00000000300c1408] = d414022b d414022b
	stda	%l2,[%i3+%o4]0x81	! Mem[00000000300c1408] = f4e206e3 000000d9
!	Mem[0000000030101410] = f8ffffff, %l1 = 00000000014b43ca
	ldstuba	[%i4+%o5]0x89,%l1	! %l1 = 000000ff000000ff
!	Mem[0000000010081410] = bb1019ff, %l0 = 00000000bb1019ff
	swapa	[%i2+%o5]0x80,%l0	! %l0 = 00000000bb1019ff
!	Mem[00000000100c1408] = b53a84ba, %l2 = 00000000f4e206e3
	ldstuba	[%i3+%o4]0x80,%l2	! %l2 = 000000b5000000ff
!	%l4 = ffffffffdc70e383, Mem[0000000010181410] = 690df5e4
	stba	%l4,[%i6+%o5]0x88	! Mem[0000000010181410] = 690df583
!	%f26 = 3ba3ec9c 014b43ca, Mem[0000000030081410] = 6dd09eff 1ce9b068
	stda	%f26,[%i2+%o5]0x89	! Mem[0000000030081410] = 3ba3ec9c 014b43ca
!	%l4 = ffffffffdc70e383, Mem[00000000300c1400] = 099a41a6
	stba	%l4,[%i3+%g0]0x89	! Mem[00000000300c1400] = 099a4183
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = 46109074, %f7  = 8efa15af
	lda	[%i4+%o4]0x81,%f7 	! %f7 = 46109074

p0_label_17:
!	Mem[00000000201c0000] = bbffd27d, %l0 = 00000000bb1019ff
	ldsh	[%o0+%g0],%l0		! %l0 = ffffffffffffbbff
!	Mem[000000001014141c] = 35112447, %l2 = 00000000000000b5
	lduh	[%i5+0x01c],%l2		! %l2 = 0000000000003511
!	Mem[0000000030041400] = d14f1c24, %f18 = 2581d259
	lda	[%i1+%g0]0x81,%f18	! %f18 = d14f1c24
!	Mem[00000000300c1410] = 1aa6b0ff, %l5 = 00000000000000e5
	lduha	[%i3+%o5]0x89,%l5	! %l5 = 000000000000b0ff
!	Mem[0000000030081400] = e1a9c4e1, %l7 = 00000000000000a6
	lduwa	[%i2+%g0]0x81,%l7	! %l7 = 00000000e1a9c4e1
!	Mem[0000000030181400] = 1aa6b0ff, %f30 = 241c4fd1
	lda	[%i6+%g0]0x89,%f30	! %f30 = 1aa6b0ff
!	Mem[0000000030081400] = e1a9c4e114bfcbf7, %f30 = 1aa6b0ff 73a028f7
	ldda	[%i2+%g0]0x81,%f30	! %f30 = e1a9c4e1 14bfcbf7
!	Mem[0000000030101410] = fffffff8, %l6 = 0000000000000017
	ldswa	[%i4+%o5]0x81,%l6	! %l6 = fffffffffffffff8
!	Mem[0000000030101410] = fffffff8, %l1 = 00000000000000ff
	lduwa	[%i4+%o5]0x81,%l1	! %l1 = 00000000fffffff8
!	Starting 10 instruction Store Burst
!	%f18 = d14f1c24 2b0214d4, %l7 = 00000000e1a9c4e1
!	Mem[0000000010041408] = 14d441a6f6caade5
	add	%i1,0x008,%g1
	stda	%f18,[%g1+%l7]ASI_PST16_PL ! Mem[0000000010041408] = d41441a6f6caade5

p0_label_18:
!	%l1 = 00000000fffffff8, Mem[0000000010181422] = bc3dd5c9, %asi = 80
	stha	%l1,[%i6+0x022]%asi	! Mem[0000000010181420] = bc3dfff8
!	Mem[00000000201c0001] = bbffd27d, %l5 = 000000000000b0ff
	ldstub	[%o0+0x001],%l5		! %l5 = 000000ff000000ff
!	Mem[000000001010141c] = 9d770e70, %l6 = fffffffffffffff8, %asi = 80
	swapa	[%i4+0x01c]%asi,%l6	! %l6 = 000000009d770e70
!	%f14 = 466c4463 e28fa055, %l3 = 00000000000000d9
!	Mem[0000000010081430] = 7447560cf504ec9f
	add	%i2,0x030,%g1
	stda	%f14,[%g1+%l3]ASI_PST16_P ! Mem[0000000010081430] = 466c560cf504a055
!	%f2  = 67e15ba0, %f23 = 77cebcc5, %f11 = 56c2070a
	fdivs	%f2 ,%f23,%f11		! %f11 = 2f8b875d
!	Mem[0000000030001410] = 33de88d9, %l4 = ffffffffdc70e383
	ldstuba	[%i0+%o5]0x81,%l4	! %l4 = 00000033000000ff
!	%f26 = 3ba3ec9c, Mem[0000000010041408] = d41441a6
	sta	%f26,[%i1+%o4]0x80	! Mem[0000000010041408] = 3ba3ec9c
!	%f10 = 579dfb69 2f8b875d, Mem[00000000100c1410] = fe120093 73a045a4
	stda	%f10,[%i3+%o5]0x80	! Mem[00000000100c1410] = 579dfb69 2f8b875d
!	Mem[0000000010081438] = ca434b01, %l5 = 00000000000000ff, %asi = 80
	swapa	[%i2+0x038]%asi,%l5	! %l5 = 00000000ca434b01
!	Starting 10 instruction Load Burst
!	%l1 = 00000000fffffff8, Mem[0000000030081410] = ca434b01
	stwa	%l1,[%i2+%o5]0x81	! Mem[0000000030081410] = fffffff8

p0_label_19:
!	%l1 = 00000000fffffff8, %l3 = 00000000000000d9, %l6 = 000000009d770e70
	or	%l1,%l3,%l6		! %l6 = 00000000fffffff9
!	Mem[0000000010141408] = e89fff14, %f12 = c472f652
	lda	[%i5+0x008]%asi,%f12	! %f12 = e89fff14
!	Mem[00000000100c1410] = 69fb9d57, %f27 = 014b43ca
	lda	[%i3+%o5]0x88,%f27	! %f27 = 69fb9d57
!	Mem[0000000030181408] = 11b6f438, %l1 = 00000000fffffff8
	lduwa	[%i6+%o4]0x81,%l1	! %l1 = 0000000011b6f438
!	Mem[0000000010001418] = 94ff0011 9b0b3082, %l4 = 00000033, %l5 = ca434b01
	ldd	[%i0+0x018],%l4		! %l4 = 0000000094ff0011 000000009b0b3082
!	Mem[0000000010041410] = ee544ac5, %l5 = 000000009b0b3082
	lduha	[%i1+%o5]0x88,%l5	! %l5 = 0000000000004ac5
!	Mem[0000000030141400] = 61f8f8ff, %l7 = 00000000e1a9c4e1
	lduba	[%i5+%g0]0x81,%l7	! %l7 = 0000000000000061
!	Mem[0000000030141408] = 70352409, %l0 = ffffffffffffbbff
	lduha	[%i5+%o4]0x89,%l0	! %l0 = 0000000000002409
!	Mem[0000000010081430] = 466c560c, %l4 = 0000000094ff0011
	ldsba	[%i2+0x033]%asi,%l4	! %l4 = 000000000000000c
!	Starting 10 instruction Store Burst
!	Mem[0000000010001428] = a3d688d2, %f28 = ee3bf804
	lda	[%i0+0x028]%asi,%f28	! %f28 = a3d688d2

p0_label_20:
!	Mem[0000000010141400] = 043cd0297d7a88ba, %l2 = 0000000000003511, %l2 = 0000000000003511
	casxa	[%i5]0x80,%l2,%l2	! %l2 = 043cd0297d7a88ba
!	Mem[0000000010001408] = e4f50d69, %l3 = 00000000000000d9
	swapa	[%i0+%o4]0x80,%l3	! %l3 = 00000000e4f50d69
!	Mem[0000000010181400] = d20ab5f5, %l0 = 0000000000002409
	swapa	[%i6+%g0]0x80,%l0	! %l0 = 00000000d20ab5f5
!	Mem[00000000100c1424] = b6a3f8c1, %l3 = e4f50d69, %l5 = 00004ac5
	add	%i3,0x24,%g1
	casa	[%g1]0x80,%l3,%l5	! %l5 = 00000000b6a3f8c1
!	%f0  = d14f1c24 39f7b0d6, %l2 = 043cd0297d7a88ba
!	Mem[0000000030041400] = d14f1c2439f7b0d6
	stda	%f0,[%i1+%l2]ASI_PST8_SL ! Mem[0000000030041400] = d1b01c39241cb0d1
!	Mem[0000000010001428] = a3d688d2, %l1 = 0000000011b6f438
	ldstuba	[%i0+0x028]%asi,%l1	! %l1 = 000000a3000000ff
!	Mem[0000000010081410] = bb1019ff, %l6 = 00000000fffffff9
	swapa	[%i2+%o5]0x80,%l6	! %l6 = 00000000bb1019ff
!	Mem[00000000100c1420] = 22544310, %l5 = 00000000b6a3f8c1, %asi = 80
	swapa	[%i3+0x020]%asi,%l5	! %l5 = 0000000022544310
!	%l3 = 00000000e4f50d69, Mem[0000000010181408] = 05000000
	stba	%l3,[%i6+%o4]0x80	! Mem[0000000010181408] = 69000000
!	Starting 10 instruction Load Burst
!	Mem[0000000020800040] = 08e52a9b, %l5 = 0000000022544310
	ldsba	[%o1+0x041]%asi,%l5	! %l5 = ffffffffffffffe5

p0_label_21:
!	Mem[0000000010001408] = 000000d9, %l5 = ffffffffffffffe5
	lduwa	[%i0+%o4]0x80,%l5	! %l5 = 00000000000000d9
!	Mem[00000000100c1408] = bca18d70ba843aff, %f30 = e1a9c4e1 14bfcbf7
	ldda	[%i3+%o4]0x88,%f30	! %f30 = bca18d70 ba843aff
!	Mem[0000000010041408] = 3ba3ec9c, %l7 = 0000000000000061
	lduba	[%i1+%o4]0x80,%l7	! %l7 = 000000000000003b
!	Mem[00000000300c1408] = e306e2f4, %l4 = 000000000000000c
	lduwa	[%i3+%o4]0x89,%l4	! %l4 = 00000000e306e2f4
!	Mem[0000000010081410] = f9ffffff, %l0 = 00000000d20ab5f5
	ldsha	[%i2+%o5]0x88,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000030101408] = 46109074, %l3 = 00000000e4f50d69
	lduwa	[%i4+%o4]0x81,%l3	! %l3 = 0000000046109074
!	Mem[0000000010101400] = 7d8add5a, %l6 = 00000000bb1019ff
	lduha	[%i4+%g0]0x88,%l6	! %l6 = 000000000000dd5a
!	Mem[0000000030081408] = 51ca9937 df9f46d0, %l0 = ffffffff, %l1 = 000000a3
	ldda	[%i2+%o4]0x81,%l0	! %l0 = 0000000051ca9937 00000000df9f46d0
!	Mem[0000000010001410] = 9316e0d05a87b0ff, %l5 = 00000000000000d9
	ldxa	[%i0+%o5]0x88,%l5	! %l5 = 9316e0d05a87b0ff
!	Starting 10 instruction Store Burst
!	%l6 = 000000000000dd5a, Mem[0000000030181408] = 11b6f438
	stha	%l6,[%i6+%o4]0x81	! Mem[0000000030181408] = dd5af438

p0_label_22:
!	%l0 = 0000000051ca9937, Mem[0000000020800000] = ff39d48e
	sth	%l0,[%o1+%g0]		! Mem[0000000020800000] = 9937d48e
!	Mem[0000000020800001] = 9937d48e, %l0 = 0000000051ca9937
	ldstuba	[%o1+0x001]%asi,%l0	! %l0 = 00000037000000ff
!	Mem[000000001014141a] = f04475ee, %l3 = 0000000046109074
	ldstuba	[%i5+0x01a]%asi,%l3	! %l3 = 00000075000000ff
!	Mem[00000000100c1408] = ff3a84ba, %l4 = 00000000e306e2f4
	ldstuba	[%i3+%o4]0x80,%l4	! %l4 = 000000ff000000ff
!	%l0 = 00000037, %l1 = df9f46d0, Mem[0000000030081410] = fffffff8 9ceca33b
	stda	%l0,[%i2+%o5]0x81	! Mem[0000000030081410] = 00000037 df9f46d0
!	%f28 = a3d688d2 0102f8ff, Mem[0000000030041400] = 391cb0d1 d1b01c24
	stda	%f28,[%i1+%g0]0x89	! Mem[0000000030041400] = a3d688d2 0102f8ff
!	Mem[0000000020800040] = 08e52a9b, %l1 = 00000000df9f46d0
	ldstuba	[%o1+0x040]%asi,%l1	! %l1 = 00000008000000ff
!	%l6 = 000000000000dd5a, Mem[0000000010101400] = 7d8add5a
	stwa	%l6,[%i4+%g0]0x88	! Mem[0000000010101400] = 0000dd5a
!	%l5 = 9316e0d05a87b0ff, Mem[0000000010081410] = f9ffffff
	stwa	%l5,[%i2+%o5]0x88	! Mem[0000000010081410] = 5a87b0ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030001400] = 7324127f, %f29 = 0102f8ff
	lda	[%i0+%g0]0x89,%f29	! %f29 = 7324127f

p0_label_23:
!	Mem[00000000300c1408] = f4e206e3, %l1 = 0000000000000008
	lduwa	[%i3+%o4]0x81,%l1	! %l1 = 00000000f4e206e3
!	Mem[0000000030001408] = fff80201, %l3 = 0000000000000075
	ldsha	[%i0+%o4]0x81,%l3	! %l3 = fffffffffffffff8
!	Mem[0000000010001400] = 04d412ff, %l1 = 00000000f4e206e3
	ldswa	[%i0+%g0]0x88,%l1	! %l1 = 0000000004d412ff
!	Mem[0000000030141410] = 0000bb10 2d4650ca, %l0 = 00000037, %l1 = 04d412ff
	ldda	[%i5+%o5]0x81,%l0	! %l0 = 000000000000bb10 000000002d4650ca
!	Mem[0000000010181408] = 00000069, %l7 = 000000000000003b
	ldswa	[%i6+%o4]0x88,%l7	! %l7 = 0000000000000069
!	Mem[0000000010101408] = e49cbb0c, %l6 = 000000000000dd5a
	ldsba	[%i4+%o4]0x80,%l6	! %l6 = ffffffffffffffe4
!	Mem[0000000010001400] = 04d412ff, %f29 = 7324127f
	lda	[%i0+%g0]0x88,%f29	! %f29 = 04d412ff
!	Mem[0000000030001400] = 7f122473 c4fe0ea1, %l0 = 0000bb10, %l1 = 2d4650ca
	ldda	[%i0+%g0]0x81,%l0	! %l0 = 000000007f122473 00000000c4fe0ea1
!	Mem[0000000030041410] = 014b43ca4c8cc301, %f26 = 3ba3ec9c 69fb9d57
	ldda	[%i1+%o5]0x81,%f26	! %f26 = 014b43ca 4c8cc301
!	Starting 10 instruction Store Burst
!	%l4 = 000000ff, %l5 = 5a87b0ff, Mem[0000000010101410] = fffffe8f 02115417
	stda	%l4,[%i4+%o5]0x88	! Mem[0000000010101410] = 000000ff 5a87b0ff

p0_label_24:
!	%l2 = 043cd0297d7a88ba, Mem[0000000030181400] = ffb0a61a
	stha	%l2,[%i6+%g0]0x81	! Mem[0000000030181400] = 88baa61a
!	%l0 = 7f122473, %l1 = c4fe0ea1, Mem[0000000030081400] = e1a9c4e1 14bfcbf7
	stda	%l0,[%i2+%g0]0x81	! Mem[0000000030081400] = 7f122473 c4fe0ea1
!	%f28 = a3d688d2, Mem[0000000030181400] = 1aa6ba88
	sta	%f28,[%i6+%g0]0x89	! Mem[0000000030181400] = a3d688d2
!	Mem[0000000021800180] = a3e3dde9, %l5 = 9316e0d05a87b0ff
	ldstub	[%o3+0x180],%l5		! %l5 = 000000a3000000ff
!	%f0  = d14f1c24, %f22 = 4a6d6276, %f6  = 949a1396
	fsubs	%f0 ,%f22,%f6 		! %f6  = d14f1fda
!	%f16 = 35112447 379fe921, %l3 = fffffffffffffff8
!	Mem[0000000030141400] = 61f8f8ff06b9895f
	stda	%f16,[%i5+%l3]ASI_PST32_SL ! Mem[0000000030141400] = 61f8f8ff06b9895f
!	%l1 = 00000000c4fe0ea1, Mem[00000000100c1410] = 5d878b2f69fb9d57
	stxa	%l1,[%i3+%o5]0x88	! Mem[00000000100c1410] = 00000000c4fe0ea1
!	Mem[0000000020800040] = ffe52a9b, %l5 = 00000000000000a3
	ldsha	[%o1+0x040]%asi,%l5	! %l5 = ffffffffffffffe5
!	%l7 = 0000000000000069, Mem[0000000010141400] = 043cd029
	stba	%l7,[%i5+%g0]0x80	! Mem[0000000010141400] = 693cd029
!	Starting 10 instruction Load Burst
!	Mem[000000001008142c] = 005c0a63, %l2 = 043cd0297d7a88ba
	ldsw	[%i2+0x02c],%l2		! %l2 = 00000000005c0a63

p0_label_25:
!	Mem[0000000030181400] = a3d688d2, %l0 = 000000007f122473
	lduha	[%i6+%g0]0x89,%l0	! %l0 = 00000000000088d2
!	Mem[00000000100c1400] = 014b43ca, %f17 = 379fe921
	lda	[%i3+%g0]0x80,%f17	! %f17 = 014b43ca
!	Mem[00000000100c1408] = ff3a84ba 708da1bc, %l0 = 000088d2, %l1 = c4fe0ea1
	ldda	[%i3+0x008]%asi,%l0	! %l0 = 00000000ff3a84ba 00000000708da1bc
!	%f3  = fb191258, %f18 = d14f1c24, %f28 = a3d688d2
	fsubs	%f3 ,%f18,%f28		! %f28 = fb191258
!	Mem[00000000201c0000] = bbffd27d, %l6 = ffffffffffffffe4
	lduba	[%o0+0x001]%asi,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030081410] = 00000037, %l5 = ffffffffffffffe5
	lduwa	[%i2+%o5]0x81,%l5	! %l5 = 0000000000000037
!	%f31 = ba843aff, %f15 = e28fa055, %f1  = 39f7b0d6
	fadds	%f31,%f15,%f1 		! %f1  = e28fa055
!	Mem[00000000300c1400] = 83419a09, %l1 = 00000000708da1bc
	lduwa	[%i3+%g0]0x81,%l1	! %l1 = 0000000083419a09
!	%f26 = 014b43ca, %f4  = 014b43ca, %f18 = d14f1c24 2b0214d4
	fsmuld	%f26,%f4 ,%f18		! %f18 = 30642c92 89eb6c80
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1410] = ffb0a61a, %l0 = 00000000ff3a84ba
	ldstuba	[%i3+%o5]0x81,%l0	! %l0 = 000000ff000000ff

p0_label_26:
!	Mem[0000000010041400] = e48b080d, %l1 = 0000000083419a09
	ldstuba	[%i1+%g0]0x80,%l1	! %l1 = 000000e4000000ff
!	%l0 = 00000000000000ff, Mem[0000000010181400] = 00002409
	stha	%l0,[%i6+%g0]0x80	! Mem[0000000010181400] = 00ff2409
!	%l3 = fffffffffffffff8, Mem[0000000030141400] = fff8f861
	stha	%l3,[%i5+%g0]0x89	! Mem[0000000030141400] = fff8fff8
!	%l1 = 00000000000000e4, Mem[0000000030041400] = 0102f8ff
	stha	%l1,[%i1+%g0]0x89	! Mem[0000000030041400] = 010200e4
!	%l6 = 00000000000000ff, Mem[0000000010001402] = ff12d404
	sth	%l6,[%i0+0x002]		! Mem[0000000010001400] = ff1200ff
!	%l7 = 0000000000000069, Mem[0000000010101410] = ff000000
	stba	%l7,[%i4+%o5]0x80	! Mem[0000000010101410] = 69000000
!	%l4 = 000000ff, %l5 = 00000037, Mem[0000000010101410] = 69000000 ffb0875a
	stda	%l4,[%i4+%o5]0x80	! Mem[0000000010101410] = 000000ff 00000037
!	Mem[0000000010141424] = a094dd2b, %l4 = 000000ff, %l3 = fffffff8
	add	%i5,0x24,%g1
	casa	[%g1]0x80,%l4,%l3	! %l3 = 00000000a094dd2b
!	%f0  = d14f1c24 e28fa055 67e15ba0 fb191258
!	%f4  = 014b43ca 4c8cc301 d14f1fda 46109074
!	%f8  = 901acbd0 73a3db94 579dfb69 2f8b875d
!	%f12 = e89fff14 45be3a33 466c4463 e28fa055
	stda	%f0,[%i1]ASI_COMMIT_S	! Block Store to 0000000030041400
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = e3ffffff, %l7 = 0000000000000069
	lduha	[%i2+%o4]0x80,%l7	! %l7 = 000000000000e3ff

p0_label_27:
!	Mem[00000000100c1408] = ba843aff, %l4 = 00000000000000ff
	lduwa	[%i3+%o4]0x88,%l4	! %l4 = 00000000ba843aff
!	Mem[0000000010181408] = 00000069, %l7 = 000000000000e3ff
	ldsba	[%i6+%o4]0x88,%l7	! %l7 = 0000000000000069
!	Mem[00000000201c0000] = bbffd27d, %l0 = 00000000000000ff
	lduha	[%o0+0x000]%asi,%l0	! %l0 = 000000000000bbff
!	Mem[00000000211c0000] = caff2346, %l3 = 00000000a094dd2b
	lduba	[%o2+0x000]%asi,%l3	! %l3 = 00000000000000ca
!	Mem[0000000010081408] = e3ffffff, %l4 = 00000000ba843aff
	lduha	[%i2+%o4]0x80,%l4	! %l4 = 000000000000e3ff
!	Mem[0000000030001400] = a10efec47324127f, %l1 = 00000000000000e4
	ldxa	[%i0+%g0]0x89,%l1	! %l1 = a10efec47324127f
!	Mem[0000000030141410] = 0000bb10, %l7 = 0000000000000069
	lduwa	[%i5+%o5]0x81,%l7	! %l7 = 000000000000bb10
!	Mem[00000000300c1408] = f4e206e3, %l3 = 00000000000000ca
	ldswa	[%i3+%o4]0x81,%l3	! %l3 = fffffffff4e206e3
!	Mem[0000000010181408] = 69000000, %f19 = 89eb6c80
	lda	[%i6+%o4]0x80,%f19	! %f19 = 69000000
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (5)
!	%l1 = a10efec47324127f, Mem[0000000030041400] = 241c4fd1
	stha	%l1,[%i1+%g0]0x89	! Mem[0000000030041400] = 241c127f

p0_label_28:
!	%l0 = 000000000000bbff, Mem[0000000010081410] = 5a87b0ff
	stha	%l0,[%i2+%o5]0x88	! Mem[0000000010081410] = 5a87bbff
!	%l6 = 00000000000000ff, Mem[0000000010001400] = 071f48d4ff0012ff
	stxa	%l6,[%i0+%g0]0x88	! Mem[0000000010001400] = 00000000000000ff
!	%l5 = 0000000000000037, Mem[0000000010101400] = 7421de0e0000dd5a
	stxa	%l5,[%i4+%g0]0x88	! Mem[0000000010101400] = 0000000000000037
!	Mem[0000000030041410] = 014b43ca, %l7 = 000000000000bb10
	ldstuba	[%i1+%o5]0x81,%l7	! %l7 = 00000001000000ff
!	Mem[0000000030101400] = e48b080d, %l5 = 0000000000000037
	ldstuba	[%i4+%g0]0x89,%l5	! %l5 = 0000000d000000ff
!	Mem[0000000030141410] = 10bb0000, %l1 = a10efec47324127f
	swapa	[%i5+%o5]0x89,%l1	! %l1 = 0000000010bb0000
!	%f24 = ddd85795 6bcc8e3c, Mem[00000000300c1410] = ffb0a61a 3a2107a7
	stda	%f24,[%i3+%o5]0x81	! Mem[00000000300c1410] = ddd85795 6bcc8e3c
!	%l4 = 0000e3ff, %l5 = 0000000d, Mem[0000000030101400] = ff088be4 f975d25e
	stda	%l4,[%i4+%g0]0x81	! Mem[0000000030101400] = 0000e3ff 0000000d
!	%l4 = 0000e3ff, %l5 = 0000000d, Mem[0000000010081400] = 2581d259 2b0214d4
	stda	%l4,[%i2+%g0]0x80	! Mem[0000000010081400] = 0000e3ff 0000000d
!	Starting 10 instruction Load Burst
!	Mem[000000001010140c] = eb7e47ce, %l7 = 0000000000000001
	ldsba	[%i4+0x00f]%asi,%l7	! %l7 = ffffffffffffffce

p0_label_29:
!	Mem[0000000030001410] = d988deff, %l4 = 000000000000e3ff
	lduha	[%i0+%o5]0x89,%l4	! %l4 = 000000000000deff
!	%f21 = 6dd09eff, %f3  = fb191258, %f16 = 35112447 014b43ca
	fsmuld	%f21,%f3 ,%f16		! %f16 = cd2f2f7e 52e56a00
!	Mem[0000000010041408] = 3ba3ec9cf6caade5, %l2 = 00000000005c0a63
	ldx	[%i1+%o4],%l2		! %l2 = 3ba3ec9cf6caade5
!	Mem[00000000300c1408] = f4e206e3, %l2 = 3ba3ec9cf6caade5
	ldsba	[%i3+%o4]0x81,%l2	! %l2 = fffffffffffffff4
!	Mem[0000000021800000] = 0bffd806, %l6 = 00000000000000ff
	ldub	[%o3+0x001],%l6		! %l6 = 00000000000000ff
!	Mem[0000000030101408] = 74901046, %l0 = 000000000000bbff
	lduha	[%i4+%o4]0x89,%l0	! %l0 = 0000000000001046
!	Mem[0000000030081408] = 3799ca51, %l5 = 000000000000000d
	lduha	[%i2+%o4]0x89,%l5	! %l5 = 000000000000ca51
!	Mem[0000000030181410] = 0102f8ff, %l2 = fffffffffffffff4
	lduba	[%i6+%o5]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010141408] = f69f7cff 14ff9fe8, %l2 = 000000ff, %l3 = f4e206e3
	ldda	[%i5+%o4]0x88,%l2	! %l2 = 0000000014ff9fe8 00000000f69f7cff
!	Starting 10 instruction Store Burst
!	%f14 = 466c4463 e28fa055, Mem[0000000030141410] = 7f122473 2d4650ca
	stda	%f14,[%i5+%o5]0x81	! Mem[0000000030141410] = 466c4463 e28fa055

p0_label_30:
!	Mem[00000000300c1400] = 83419a09, %l5 = 000000000000ca51
	ldstuba	[%i3+%g0]0x81,%l5	! %l5 = 00000083000000ff
!	%f31 = ba843aff, Mem[0000000010081414] = 241c4fd1
	st	%f31,[%i2+0x014]	! Mem[0000000010081414] = ba843aff
!	Mem[0000000030041408] = a05be167, %l2 = 0000000014ff9fe8
	swapa	[%i1+%o4]0x89,%l2	! %l2 = 00000000a05be167
!	%l3 = 00000000f69f7cff, Mem[0000000010041410] = ee544ac5
	stwa	%l3,[%i1+%o5]0x88	! Mem[0000000010041410] = f69f7cff
!	Mem[0000000030141400] = fff8fff8, %l1 = 0000000010bb0000
	swapa	[%i5+%g0]0x89,%l1	! %l1 = 00000000fff8fff8
!	Mem[00000000100c1410] = c4fe0ea1, %l6 = 00000000000000ff
	swapa	[%i3+%o5]0x88,%l6	! %l6 = 00000000c4fe0ea1
!	%f0  = d14f1c24 e28fa055, Mem[0000000010101428] = fe117a55 0b23a0ad
	std	%f0 ,[%i4+0x028]	! Mem[0000000010101428] = d14f1c24 e28fa055
!	Mem[0000000030101408] = 46109074, %l7 = ffffffffffffffce
	swapa	[%i4+%o4]0x81,%l7	! %l7 = 0000000046109074
!	%f10 = 579dfb69 2f8b875d, Mem[0000000010181438] = fc223141 7d0320f4
	std	%f10,[%i6+0x038]	! Mem[0000000010181438] = 579dfb69 2f8b875d
!	Starting 10 instruction Load Burst
!	Mem[0000000010141430] = 524b7e2e06e3359c, %f14 = 466c4463 e28fa055
	ldd	[%i5+0x030],%f14	! %f14 = 524b7e2e 06e3359c

p0_label_31:
!	Mem[0000000010141410] = d4ff62a3, %l0 = 0000000000001046
	lduwa	[%i5+%o5]0x80,%l0	! %l0 = 00000000d4ff62a3
!	%f3  = fb191258, %f25 = 6bcc8e3c, %f8  = 901acbd0 73a3db94
	fsmuld	%f3 ,%f25,%f8 		! %f8  = ccee93ea 8b472800
!	Mem[0000000030041408] = 14ff9fe8, %l2 = 00000000a05be167
	swapa	[%i1+%o4]0x89,%l2	! %l2 = 0000000014ff9fe8
!	Mem[0000000030001400] = 7f122473, %l7 = 0000000046109074
	ldsha	[%i0+%g0]0x81,%l7	! %l7 = 0000000000007f12
!	Mem[00000000300c1400] = ff419a0904f83bee, %f16 = cd2f2f7e 52e56a00
	ldda	[%i3+%g0]0x81,%f16	! %f16 = ff419a09 04f83bee
!	Mem[0000000030041408] = a05be167, %l4 = 000000000000deff
	ldsba	[%i1+%o4]0x89,%l4	! %l4 = 0000000000000067
!	Mem[0000000010001400] = ff000000, %l4 = 0000000000000067
	ldsha	[%i0+%g0]0x80,%l4	! %l4 = ffffffffffffff00
!	Mem[0000000030001400] = a10efec47324127f, %l7 = 0000000000007f12
	ldxa	[%i0+%g0]0x89,%l7	! %l7 = a10efec47324127f
!	Mem[0000000010101408] = e49cbb0c, %l3 = 00000000f69f7cff
	lduba	[%i4+%o4]0x80,%l3	! %l3 = 00000000000000e4
!	Starting 10 instruction Store Burst
!	%l5 = 0000000000000083, imm = 0000000000000d00, %l5 = 0000000000000083
	addc	%l5,0xd00,%l5		! %l5 = 0000000000000d83

p0_label_32:
!	%f30 = bca18d70 ba843aff, Mem[0000000030081400] = 7324127f a10efec4
	stda	%f30,[%i2+%g0]0x89	! Mem[0000000030081400] = bca18d70 ba843aff
!	Mem[00000000100c1410] = ff000000, %l5 = 0000000000000d83
	swapa	[%i3+%o5]0x80,%l5	! %l5 = 00000000ff000000
!	%l3 = 00000000000000e4, Mem[0000000010081400] = ffe30000
	stwa	%l3,[%i2+%g0]0x88	! Mem[0000000010081400] = 000000e4
!	%l4 = ffffff00, %l5 = ff000000, Mem[00000000300c1400] = ff419a09 04f83bee
	stda	%l4,[%i3+%g0]0x81	! Mem[00000000300c1400] = ffffff00 ff000000
!	%l3 = 00000000000000e4, Mem[0000000030081408] = d0469fdf3799ca51
	stxa	%l3,[%i2+%o4]0x89	! Mem[0000000030081408] = 00000000000000e4
!	Mem[0000000010001400] = 000000ff, %l6 = 00000000c4fe0ea1
	lduwa	[%i0+%g0]0x88,%l6	! %l6 = 00000000000000ff
!	%l3 = 00000000000000e4, Mem[0000000030081408] = e4000000
	stwa	%l3,[%i2+%o4]0x81	! Mem[0000000030081408] = 000000e4
!	Mem[0000000030001400] = 7324127f, %l0 = 00000000d4ff62a3
	ldstuba	[%i0+%g0]0x89,%l0	! %l0 = 0000007f000000ff
!	%l1 = 00000000fff8fff8, Mem[0000000010001410] = ffb0875a, %asi = 80
	stwa	%l1,[%i0+0x010]%asi	! Mem[0000000010001410] = fff8fff8
!	Starting 10 instruction Load Burst
!	Mem[0000000021800040] = 0645a70e, %l7 = a10efec47324127f
	lduha	[%o3+0x040]%asi,%l7	! %l7 = 0000000000000645

p0_label_33:
!	Mem[0000000010081408] = d414022b ffffffe3, %l2 = 14ff9fe8, %l3 = 000000e4
	ldda	[%i2+%o4]0x88,%l2	! %l2 = 00000000ffffffe3 00000000d414022b
!	Mem[0000000010101428] = d14f1c24e28fa055, %f24 = ddd85795 6bcc8e3c
	ldd	[%i4+0x028],%f24	! %f24 = d14f1c24 e28fa055
!	Mem[0000000030041400] = 7f121c24, %l4 = ffffffffffffff00
	ldsha	[%i1+%g0]0x81,%l4	! %l4 = 0000000000007f12
!	Mem[0000000010141410] = d4ff62a3, %l7 = 0000000000000645
	ldsha	[%i5+%o5]0x80,%l7	! %l7 = ffffffffffffd4ff
!	Mem[0000000010001408] = 000000d9, %l3 = 00000000d414022b
	lduha	[%i0+%o4]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000010141408] = e89fff14ff7c9ff6, %f24 = d14f1c24 e28fa055
	ldd	[%i5+%o4],%f24		! %f24 = e89fff14 ff7c9ff6
!	Mem[0000000010101408] = 0cbb9ce4, %l0 = 000000000000007f
	lduwa	[%i4+%o4]0x88,%l0	! %l0 = 000000000cbb9ce4
!	Mem[00000000100c1408] = ff3a84ba 708da1bc, %l0 = 0cbb9ce4, %l1 = fff8fff8
	ldd	[%i3+%o4],%l0		! %l0 = 00000000ff3a84ba 00000000708da1bc
!	Mem[0000000010041400] = ff8b080d, %l6 = 00000000000000ff
	ldsha	[%i1+%g0]0x80,%l6	! %l6 = ffffffffffffff8b
!	Starting 10 instruction Store Burst
!	%l1 = 00000000708da1bc, Mem[0000000010141400] = 29d03c69
	stwa	%l1,[%i5+%g0]0x88	! Mem[0000000010141400] = 708da1bc

p0_label_34:
!	Mem[0000000010001408] = d9000000, %l2 = 00000000ffffffe3
	swapa	[%i0+%o4]0x88,%l2	! %l2 = 00000000d9000000
!	%l1 = 00000000708da1bc, Mem[00000000201c0000] = bbffd27d
	sth	%l1,[%o0+%g0]		! Mem[00000000201c0000] = a1bcd27d
!	%f26 = 014b43ca, Mem[0000000010101434] = f1abf392
	st	%f26,[%i4+0x034]	! Mem[0000000010101434] = 014b43ca
!	%f16 = ff419a09 04f83bee 30642c92 69000000
!	%f20 = 1ce9b068 6dd09eff 4a6d6276 77cebcc5
!	%f24 = e89fff14 ff7c9ff6 014b43ca 4c8cc301
!	%f28 = fb191258 04d412ff bca18d70 ba843aff
	stda	%f16,[%i3]ASI_BLK_SL	! Block Store to 00000000300c1400
!	%f10 = 579dfb69 2f8b875d, %l2 = 00000000d9000000
!	Mem[0000000010141420] = 7d7a88baa094dd2b
	add	%i5,0x020,%g1
	stda	%f10,[%g1+%l2]ASI_PST8_PL ! Mem[0000000010141420] = 7d7a88baa094dd2b
!	%l2 = 00000000d9000000, Mem[0000000020800041] = ffe52a9b, %asi = 80
	stba	%l2,[%o1+0x041]%asi	! Mem[0000000020800040] = ff002a9b
!	%f12 = e89fff14 45be3a33, %l5 = 00000000ff000000
!	Mem[00000000100c1410] = 00000d8300000000
	add	%i3,0x010,%g1
	stda	%f12,[%g1+%l5]ASI_PST8_PL ! Mem[00000000100c1410] = 00000d8300000000
!	%l7 = ffffffffffffd4ff, Mem[0000000030101400] = 0000e3ff
	stba	%l7,[%i4+%g0]0x81	! Mem[0000000030101400] = ff00e3ff
!	Mem[0000000030001410] = fdb8ec6ad988deff, %f14 = 524b7e2e 06e3359c
	ldda	[%i0+%o5]0x89,%f14	! %f14 = fdb8ec6a d988deff
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = 9ceca33b, %l7 = ffffffffffffd4ff
	lduwa	[%i1+%o4]0x88,%l7	! %l7 = 000000009ceca33b

p0_label_35:
!	Mem[0000000010181408] = 00000069, %f1  = e28fa055
	lda	[%i6+%o4]0x88,%f1 	! %f1 = 00000069
!	Mem[0000000010081400] = e40000000000000d, %f0  = d14f1c24 00000069
	ldda	[%i2+0x000]%asi,%f0 	! %f0  = e4000000 0000000d
!	Mem[0000000030181410] = 0102f8ff, %l7 = 000000009ceca33b
	ldsha	[%i6+%o5]0x89,%l7	! %l7 = fffffffffffff8ff
!	Mem[0000000010181400] = 00ff2409, %l4 = 0000000000007f12
	lduha	[%i6+%g0]0x80,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010141400] = 708da1bc, %l5 = 00000000ff000000
	ldswa	[%i5+%g0]0x88,%l5	! %l5 = 00000000708da1bc
!	Randomly selected nop
	nop
!	Mem[0000000030141410] = 466c4463, %l6 = ffffffffffffff8b
	ldsha	[%i5+%o5]0x81,%l6	! %l6 = 000000000000466c
	membar	#Sync			! Added by membar checker (6)
!	Mem[00000000300c1408] = 00000069, %l2 = 00000000d9000000
	lduha	[%i3+%o4]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000030001400] = ff122473 c4fe0ea1, %l0 = ff3a84ba, %l1 = 708da1bc
	ldda	[%i0+%g0]0x81,%l0	! %l0 = 00000000ff122473 00000000c4fe0ea1
!	Starting 10 instruction Store Burst
!	%f16 = ff419a09 04f83bee 30642c92 69000000
!	%f20 = 1ce9b068 6dd09eff 4a6d6276 77cebcc5
!	%f24 = e89fff14 ff7c9ff6 014b43ca 4c8cc301
!	%f28 = fb191258 04d412ff bca18d70 ba843aff
	stda	%f16,[%i1]ASI_COMMIT_P	! Block Store to 0000000010041400

p0_label_36:
!	%f2  = 67e15ba0 fb191258, Mem[0000000010001410] = fff8fff8 d0e01693
	stda	%f2 ,[%i0+%o5]0x80	! Mem[0000000010001410] = 67e15ba0 fb191258
!	Mem[0000000030101408] = ffffffce, %l5 = 00000000708da1bc
	ldstuba	[%i4+%o4]0x81,%l5	! %l5 = 000000ff000000ff
!	%f11 = 2f8b875d, Mem[0000000030041408] = a05be167
	sta	%f11,[%i1+%o4]0x89	! Mem[0000000030041408] = 2f8b875d
!	Mem[0000000030141410] = 63446c46, %l0 = 00000000ff122473
	swapa	[%i5+%o5]0x89,%l0	! %l0 = 0000000063446c46
!	%l6 = 0000466c, %l7 = fffff8ff, Mem[0000000030001410] = ffde88d9 6aecb8fd
	stda	%l6,[%i0+%o5]0x81	! Mem[0000000030001410] = 0000466c fffff8ff
!	%f14 = fdb8ec6a, %f2  = 67e15ba0
	fcmpes	%fcc3,%f14,%f2 		! %fcc3 = 1
!	%f12 = e89fff14 45be3a33, Mem[0000000010181400] = 00ff2409 1947d4fb
	stda	%f12,[%i6+%g0]0x80	! Mem[0000000010181400] = e89fff14 45be3a33
!	Mem[0000000010101400] = 37000000, %l0 = 0000000063446c46
	ldstuba	[%i4+%g0]0x80,%l0	! %l0 = 00000037000000ff
!	%l2 = 0000000000000000, Mem[0000000030101400] = ffe300ff
	stha	%l2,[%i4+%g0]0x89	! Mem[0000000030101400] = ffe30000
!	Starting 10 instruction Load Burst
!	Mem[0000000010081438] = 000000ff, %l3 = 0000000000000000
	lduba	[%i2+0x03a]%asi,%l3	! %l3 = 0000000000000000

p0_label_37:
!	Mem[0000000021800000] = 0bffd806, %l6 = 000000000000466c
	ldsha	[%o3+0x000]%asi,%l6	! %l6 = 0000000000000bff
!	Mem[00000000211c0000] = caff2346, %l3 = 0000000000000000
	ldsb	[%o2+0x001],%l3		! %l3 = ffffffffffffffff
!	Mem[0000000030001400] = ff122473, %l1 = 00000000c4fe0ea1
	ldsha	[%i0+%g0]0x81,%l1	! %l1 = ffffffffffffff12
!	Mem[0000000030001400] = ff122473, %l6 = 0000000000000bff
	ldsba	[%i0+%g0]0x81,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010081400] = 000000e4, %l7 = fffffffffffff8ff
	ldswa	[%i2+%g0]0x88,%l7	! %l7 = 00000000000000e4
!	Mem[0000000010181408] = 00000069, %f8  = ccee93ea
	lda	[%i6+%o4]0x88,%f8 	! %f8 = 00000069
!	Mem[0000000030041400] = 241c127f, %l4 = 00000000000000ff
	ldsba	[%i1+%g0]0x89,%l4	! %l4 = 000000000000007f
!	Mem[0000000030141410] = 732412ff, %l6 = ffffffffffffffff
	lduwa	[%i5+%o5]0x81,%l6	! %l6 = 00000000732412ff
!	Mem[0000000020800040] = ff002a9b, %l3 = ffffffffffffffff
	lduh	[%o1+0x040],%l3		! %l3 = 000000000000ff00
!	Starting 10 instruction Store Burst
!	Mem[0000000010181408] = 00000069, %l2 = 0000000000000000
	ldstuba	[%i6+%o4]0x88,%l2	! %l2 = 00000069000000ff

p0_label_38:
!	%l2 = 0000000000000069, Mem[0000000010101408] = ce477eeb0cbb9ce4
	stxa	%l2,[%i4+%o4]0x88	! Mem[0000000010101408] = 0000000000000069
!	Mem[00000000100c140d] = 708da1bc, %l5 = 00000000000000ff
	ldstub	[%i3+0x00d],%l5		! %l5 = 0000008d000000ff
!	%f8  = 00000069, %f14 = fdb8ec6a, %f6  = d14f1fda
	fsubs	%f8 ,%f14,%f6 		! %l0 = 0000000000000059, Unfinished, %fsr = 1000000000
!	Mem[0000000030041408] = 5d878b2f, %l1 = ffffffffffffff12
	swapa	[%i1+%o4]0x81,%l1	! %l1 = 000000005d878b2f
!	Mem[0000000010101408] = 69000000, %l6 = 00000000732412ff
	ldstuba	[%i4+%o4]0x80,%l6	! %l6 = 00000069000000ff
	membar	#Sync			! Added by membar checker (7)
!	%l3 = 000000000000ff00, Mem[000000001004142c] = 4c8cc301, %asi = 80
	stwa	%l3,[%i1+0x02c]%asi	! Mem[000000001004142c] = 0000ff00
!	Mem[0000000030001410] = 6c460000, %l6 = 0000000000000069
	swapa	[%i0+%o5]0x89,%l6	! %l6 = 000000006c460000
!	%l2 = 0000000000000069, Mem[0000000010181408] = ff000000
	sth	%l2,[%i6+%o4]		! Mem[0000000010181408] = 00690000
!	Mem[0000000010181408] = 00006900, %l6 = 000000006c460000
	ldstuba	[%i6+%o4]0x88,%l6	! %l6 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = ba843aff, %l5 = 000000000000008d
	ldsba	[%i2+%g0]0x89,%l5	! %l5 = ffffffffffffffff

p0_label_39:
!	Mem[0000000010081400] = e4000000, %l2 = 0000000000000069
	lduwa	[%i2+%g0]0x80,%l2	! %l2 = 00000000e4000000
!	Mem[00000000100c1400] = 014b43ca, %l0 = 0000000000000059
	ldsba	[%i3+%g0]0x80,%l0	! %l0 = 0000000000000001
!	Mem[0000000010081410] = ffbb875a ba843aff, %l0 = 00000001, %l1 = 5d878b2f
	ldda	[%i2+%o5]0x80,%l0	! %l0 = 00000000ffbb875a 00000000ba843aff
!	Mem[00000000201c0000] = a1bcd27d, %l5 = ffffffffffffffff
	lduh	[%o0+%g0],%l5		! %l5 = 000000000000a1bc
!	Mem[0000000010181400] = 333abe45 14ff9fe8, %l6 = 00000000, %l7 = 000000e4
	ldda	[%i6+%g0]0x88,%l6	! %l6 = 0000000014ff9fe8 00000000333abe45
!	Mem[0000000030101408] = ffffffcee6689720, %f30 = bca18d70 ba843aff
	ldda	[%i4+%o4]0x81,%f30	! %f30 = ffffffce e6689720
!	Mem[0000000030081400] = ba843aff, %l1 = 00000000ba843aff
	ldswa	[%i2+%g0]0x89,%l1	! %l1 = ffffffffba843aff
!	Mem[0000000030081400] = ff3a84ba, %l2 = 00000000e4000000
	lduba	[%i2+%g0]0x81,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030101410] = f8ffffff, %l2 = 00000000000000ff
	lduha	[%i4+%o5]0x89,%l2	! %l2 = 000000000000ffff
!	Starting 10 instruction Store Burst
!	%f0  = e4000000 0000000d 67e15ba0 fb191258
!	%f4  = 014b43ca 4c8cc301 d14f1fda 46109074
!	%f8  = 00000069 8b472800 579dfb69 2f8b875d
!	%f12 = e89fff14 45be3a33 fdb8ec6a d988deff
	stda	%f0,[%i3]ASI_BLK_P	! Block Store to 00000000100c1400

p0_label_40:
!	%l0 = 00000000ffbb875a, Mem[0000000010141408] = 14ff9fe8
	stwa	%l0,[%i5+%o4]0x88	! Mem[0000000010141408] = ffbb875a
!	%f30 = ffffffce e6689720, Mem[00000000300c1410] = 6dd09eff 1ce9b068
	stda	%f30,[%i3+%o5]0x89	! Mem[00000000300c1410] = ffffffce e6689720
!	Mem[0000000010041436] = 04d412ff, %l7 = 00000000333abe45
	ldstuba	[%i1+0x036]%asi,%l7	! %l7 = 00000012000000ff
!	%l0 = 00000000ffbb875a, Mem[00000000100c140c] = fb191258
	stb	%l0,[%i3+0x00c]		! Mem[00000000100c140c] = 5a191258
!	Mem[00000000300c1400] = ee3bf804, %l2 = 000000000000ffff
	swapa	[%i3+%g0]0x81,%l2	! %l2 = 00000000ee3bf804
!	Mem[0000000021800001] = 0bffd806, %l0 = 00000000ffbb875a
	ldstuba	[%o3+0x001]%asi,%l0	! %l0 = 000000ff000000ff
!	%l6 = 14ff9fe8, %l7 = 00000012, Mem[0000000010141410] = a362ffd4 4925645c
	stda	%l6,[%i5+%o5]0x88	! Mem[0000000010141410] = 14ff9fe8 00000012
!	%l2 = 00000000ee3bf804, Mem[0000000010141410] = 14ff9fe8
	stba	%l2,[%i5+%o5]0x88	! Mem[0000000010141410] = 14ff9f04
!	%l4 = 000000000000007f, Mem[00000000300c1410] = e6689720
	stha	%l4,[%i3+%o5]0x89	! Mem[00000000300c1410] = e668007f
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = 241c127f, %l5 = 000000000000a1bc
	lduha	[%i1+%g0]0x89,%l5	! %l5 = 000000000000127f

p0_label_41:
!	Mem[00000000300c1400] = 0000ffff, %l3 = 000000000000ff00
	lduha	[%i3+%g0]0x81,%l3	! %l3 = 0000000000000000
	membar	#Sync			! Added by membar checker (8)
!	Mem[00000000100c1430] = e89fff14, %l6 = 0000000014ff9fe8
	ldswa	[%i3+0x030]%asi,%l6	! %l6 = ffffffffe89fff14
!	Mem[00000000300c1400] = 0000ffff099a41ff, %l3 = 0000000000000000
	ldxa	[%i3+%g0]0x81,%l3	! %l3 = 0000ffff099a41ff
!	Mem[0000000010001410] = 67e15ba0, %f18 = 30642c92
	lda	[%i0+%o5]0x80,%f18	! %f18 = 67e15ba0
!	Mem[00000000300c1410] = 7f0068e6, %l1 = ffffffffba843aff
	ldsha	[%i3+%o5]0x81,%l1	! %l1 = 0000000000007f00
!	Mem[0000000030041408] = 12ffffff, %l7 = 0000000000000012
	lduwa	[%i1+%o4]0x89,%l7	! %l7 = 0000000012ffffff
!	%l5 = 000000000000127f, %l3 = 0000ffff099a41ff, %l5 = 000000000000127f
	or	%l5,%l3,%l5		! %l5 = 0000ffff099a53ff
!	Mem[0000000030041408] = 12ffffff, %f25 = ff7c9ff6
	lda	[%i1+%o4]0x89,%f25	! %f25 = 12ffffff
!	Mem[0000000020800000] = 99ffd48e, %l5 = 0000ffff099a53ff
	ldsba	[%o1+0x000]%asi,%l5	! %l5 = ffffffffffffff99
!	Starting 10 instruction Store Burst
!	Mem[0000000010181400] = 14ff9fe8, %l6 = ffffffffe89fff14
	ldstuba	[%i6+%g0]0x88,%l6	! %l6 = 000000e8000000ff

p0_label_42:
!	%l4 = 000000000000007f, Mem[0000000010041408] = 30642c92
	stba	%l4,[%i1+%o4]0x80	! Mem[0000000010041408] = 7f642c92
!	%l0 = 000000ff, %l1 = 00007f00, Mem[0000000010081410] = ffbb875a ba843aff
	stda	%l0,[%i2+0x010]%asi	! Mem[0000000010081410] = 000000ff 00007f00
!	Mem[0000000010041404] = 04f83bee, %l6 = 00000000000000e8
	swap	[%i1+0x004],%l6		! %l6 = 0000000004f83bee
!	%f4  = 014b43ca 4c8cc301, Mem[0000000010081408] = e3ffffff 2b0214d4
	stda	%f4 ,[%i2+%o4]0x80	! Mem[0000000010081408] = 014b43ca 4c8cc301
!	Mem[0000000030181400] = d288d6a3, %l5 = ffffffffffffff99
	swapa	[%i6+%g0]0x81,%l5	! %l5 = 00000000d288d6a3
!	%l0 = 00000000000000ff, Mem[0000000010101410] = ff000000
	stha	%l0,[%i4+%o5]0x88	! Mem[0000000010101410] = ff0000ff
!	Mem[0000000030041408] = ffffff12, %l2 = 00000000ee3bf804
	ldstuba	[%i1+%o4]0x81,%l2	! %l2 = 000000ff000000ff
!	Mem[0000000030081410] = 00000037, %l6 = 0000000004f83bee
	swapa	[%i2+%o5]0x81,%l6	! %l6 = 0000000000000037
!	%l4 = 000000000000007f, Mem[0000000010041408] = 922c647f
	stwa	%l4,[%i1+%o4]0x88	! Mem[0000000010041408] = 0000007f
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = 14ff9fff, %l5 = 00000000d288d6a3
	lduba	[%i6+%g0]0x88,%l5	! %l5 = 00000000000000ff

p0_label_43:
!	Mem[00000000201c0000] = a1bcd27d, %l0 = 00000000000000ff
	lduh	[%o0+%g0],%l0		! %l0 = 000000000000a1bc
!	Mem[0000000010001410] = 581219fba05be167, %f0  = e4000000 0000000d
	ldda	[%i0+%o5]0x88,%f0 	! %f0  = 581219fb a05be167
!	Mem[0000000010141410] = 14ff9f04, %l7 = 0000000012ffffff
	ldswa	[%i5+%o5]0x88,%l7	! %l7 = 0000000014ff9f04
!	Mem[0000000030081408] = e4000000, %l7 = 0000000014ff9f04
	ldsha	[%i2+%o4]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000010041410] = 68b0e91c, %f24 = e89fff14
	lda	[%i1+%o5]0x88,%f24	! %f24 = 68b0e91c
!	Mem[0000000030101400] = 0000e3ff 0000000d ffffffce e6689720
!	Mem[0000000030101410] = fffffff8 c2a22bd2 4a6d6276 77cebcc5
!	Mem[0000000030101420] = a226b52a 6bcc8e3c 5ddf2b10 fe453ffd
!	Mem[0000000030101430] = ee3bf804 099a41a6 fe120093 73a028f7
	ldda	[%i4]ASI_BLK_S,%f16	! Block Load from 0000000030101400
!	Mem[00000000100c1420] = 000000698b472800, %f14 = fdb8ec6a d988deff
	ldd	[%i3+0x020],%f14	! %f14 = 00000069 8b472800
!	Mem[0000000030081408] = e4000000, %l5 = 00000000000000ff
	ldsha	[%i2+%o4]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000010081408] = ca434b01, %l5 = 0000000000000000
	lduwa	[%i2+%o4]0x88,%l5	! %l5 = 00000000ca434b01
!	Starting 10 instruction Store Burst
!	%f12 = e89fff14 45be3a33, %l6 = 0000000000000037
!	Mem[0000000010081400] = e40000000000000d
	stda	%f12,[%i2+%l6]ASI_PST16_P ! Mem[0000000010081400] = e400ff1445be3a33

p0_label_44:
!	%l6 = 0000000000000037, Mem[00000000300c1410] = e668007f
	stha	%l6,[%i3+%o5]0x89	! Mem[00000000300c1410] = e6680037
!	%f6  = d14f1fda 46109074, Mem[00000000100c1438] = fdb8ec6a d988deff
	std	%f6 ,[%i3+0x038]	! Mem[00000000100c1438] = d14f1fda 46109074
!	Code Fragment 3
p0_fragment_1:
!	%l0 = 000000000000a1bc
	setx	0xa82c682fd7a7c407,%g7,%l0 ! %l0 = a82c682fd7a7c407
!	%l1 = 0000000000007f00
	setx	0xdead44f7e6c2cd70,%g7,%l1 ! %l1 = dead44f7e6c2cd70
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = a82c682fd7a7c407
	setx	0x62bd64a855b4f41e,%g7,%l0 ! %l0 = 62bd64a855b4f41e
!	%l1 = dead44f7e6c2cd70
	setx	0x7acc53e80dde22fd,%g7,%l1 ! %l1 = 7acc53e80dde22fd
!	Mem[0000000030001400] = 732412ff, %l5 = 00000000ca434b01
	ldstuba	[%i0+%g0]0x89,%l5	! %l5 = 000000ff000000ff
!	%l6 = 0000000000000037, imm = 0000000000000015, %l2 = 00000000000000ff
	add	%l6,0x015,%l2		! %l2 = 000000000000004c
!	%f10 = 579dfb69 2f8b875d, Mem[0000000010081400] = 14ff00e4 333abe45
	stda	%f10,[%i2+%g0]0x88	! Mem[0000000010081400] = 579dfb69 2f8b875d
	membar	#Sync			! Added by membar checker (9)
!	%f10 = 579dfb69 2f8b875d, Mem[0000000030101410] = fffffff8 c2a22bd2
	stda	%f10,[%i4+%o5]0x81	! Mem[0000000030101410] = 579dfb69 2f8b875d
!	%l5 = 00000000000000ff, Mem[0000000010081410] = 000000ff
	stwa	%l5,[%i2+%o5]0x80	! Mem[0000000010081410] = 000000ff
!	Mem[0000000030001410] = 69000000, %l6 = 0000000000000037
	swapa	[%i0+%o5]0x81,%l6	! %l6 = 0000000069000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = 00000000 e4000000, %l0 = 55b4f41e, %l1 = 0dde22fd
	ldda	[%i2+%o4]0x89,%l0	! %l0 = 00000000e4000000 0000000000000000

p0_label_45:
!	Mem[00000000211c0000] = caff2346, %l0 = 00000000e4000000
	ldsba	[%o2+0x001]%asi,%l0	! %l0 = ffffffffffffffff
!	Mem[00000000300c1400] = ffff0000, %l6 = 0000000069000000
	lduba	[%i3+%g0]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000010001400] = 000000ff, %l2 = 000000000000004c
	lduba	[%i0+%g0]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010141404] = 7d7a88ba, %l2 = 00000000000000ff
	ldsb	[%i5+0x007],%l2		! %l2 = ffffffffffffffba
!	Mem[0000000010001404] = 00000000, %l6 = 0000000000000000
	ldswa	[%i0+0x004]%asi,%l6	! %l6 = 0000000000000000
!	Mem[0000000010141400] = bca18d70, %l0 = ffffffffffffffff
	ldsba	[%i5+%g0]0x80,%l0	! %l0 = ffffffffffffffbc
!	Mem[0000000010001408] = 4ccd0075 ffffffe3, %l4 = 0000007f, %l5 = 000000ff
	ldda	[%i0+%o4]0x88,%l4	! %l4 = 00000000ffffffe3 000000004ccd0075
!	Mem[0000000030081400] = ba843aff, %l4 = 00000000ffffffe3
	lduba	[%i2+%g0]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030141400] = 10bb0000, %l6 = 0000000000000000
	ldsba	[%i5+%g0]0x89,%l6	! %l6 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l0 = ffffffbc, %l1 = 00000000, Mem[0000000030081400] = ba843aff bca18d70
	stda	%l0,[%i2+%g0]0x89	! Mem[0000000030081400] = ffffffbc 00000000

p0_label_46:
!	%l6 = 0000000000000000, Mem[0000000021800140] = b53d6ae1
	sth	%l6,[%o3+0x140]		! Mem[0000000021800140] = 00006ae1
!	%l0 = ffffffffffffffbc, Mem[0000000010041400] = ff419a09
	stwa	%l0,[%i1+%g0]0x80	! Mem[0000000010041400] = ffffffbc
!	%f26 = 5ddf2b10 fe453ffd, Mem[0000000010141408] = ffbb875a f69f7cff
	stda	%f26,[%i5+%o4]0x88	! Mem[0000000010141408] = 5ddf2b10 fe453ffd
!	%f20 = fffffff8 c2a22bd2, Mem[0000000010181408] = ff690000 c2a22bd2
	stda	%f20,[%i6+%o4]0x80	! Mem[0000000010181408] = fffffff8 c2a22bd2
!	Mem[00000000211c0001] = caff2346, %l4 = 00000000000000ff
	ldstuba	[%o2+0x001]%asi,%l4	! %l4 = 000000ff000000ff
!	%l2 = ffffffffffffffba, Mem[0000000010041410] = 1ce9b0686dd09eff
	stxa	%l2,[%i1+%o5]0x80	! Mem[0000000010041410] = ffffffffffffffba
!	Mem[0000000010001410] = 67e15ba0, %l2 = ffffffffffffffba
	ldstuba	[%i0+%o5]0x80,%l2	! %l2 = 00000067000000ff
!	Mem[000000001008141c] = b059f4bc, %l4 = 000000ff, %l0 = ffffffbc
	add	%i2,0x1c,%g1
	casa	[%g1]0x80,%l4,%l0	! %l0 = 00000000b059f4bc
!	Mem[0000000030181408] = 38f45add, %l6 = 0000000000000000
	ldstuba	[%i6+%o4]0x89,%l6	! %l6 = 000000dd000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = e8000000bcffffff, %f22 = 4a6d6276 77cebcc5
	ldda	[%i1+%g0]0x88,%f22	! %f22 = e8000000 bcffffff

p0_label_47:
!	Mem[00000000100c1410] = 014b43ca, %l5 = 000000004ccd0075
	lduba	[%i3+%o5]0x80,%l5	! %l5 = 0000000000000001
!	Mem[0000000030181400] = 99ffffff, %l4 = 00000000000000ff
	lduwa	[%i6+%g0]0x89,%l4	! %l4 = 0000000099ffffff
!	Mem[00000000100c1414] = 4c8cc301, %l1 = 0000000000000000
	lduh	[%i3+0x014],%l1		! %l1 = 0000000000004c8c
!	Mem[00000000211c0000] = caff2346, %l0 = 00000000b059f4bc
	lduha	[%o2+0x000]%asi,%l0	! %l0 = 000000000000caff
!	%l4 = 0000000099ffffff, imm = fffffffffffff63d, %l7 = 0000000000000000
	xor	%l4,-0x9c3,%l7		! %l7 = ffffffff660009c2
!	Mem[0000000030001408] = fff80201, %f10 = 579dfb69
	lda	[%i0+%o4]0x81,%f10	! %f10 = fff80201
!	Mem[0000000010101400] = ff000000, %l6 = 00000000000000dd
	lduha	[%i4+%g0]0x80,%l6	! %l6 = 000000000000ff00
!	Mem[0000000030101410] = 69fb9d57, %l1 = 0000000000004c8c
	lduha	[%i4+%o5]0x89,%l1	! %l1 = 0000000000009d57
!	%l4 = 0000000099ffffff, immed = fffff8cd, %y  = f6caade5
	sdiv	%l4,-0x733,%l6		! %l6 = 000000007fffffff
	mov	%l0,%y			! %y = 0000caff
!	Starting 10 instruction Store Burst
!	Mem[0000000010141438] = c0e9c43724eb33d0, %l3 = 0000ffff099a41ff, %l3 = 0000ffff099a41ff
	add	%i5,0x38,%g1
	casxa	[%g1]0x80,%l3,%l3	! %l3 = c0e9c43724eb33d0

p0_label_48:
!	%f19 = e6689720, Mem[0000000010101408] = ff000000
	sta	%f19,[%i4+%o4]0x80	! Mem[0000000010101408] = e6689720
!	%l5 = 0000000000000001, Mem[00000000211c0000] = caff2346
	sth	%l5,[%o2+%g0]		! Mem[00000000211c0000] = 00012346
!	%l3 = c0e9c43724eb33d0, Mem[0000000030101408] = ffffffce
	stba	%l3,[%i4+%o4]0x81	! Mem[0000000030101408] = d0ffffce
!	%f29 = 099a41a6, Mem[0000000030181410] = 0102f8ff
	sta	%f29,[%i6+%o5]0x89	! Mem[0000000030181410] = 099a41a6
!	%f22 = e8000000 bcffffff, Mem[0000000010141408] = fe453ffd 5ddf2b10
	stda	%f22,[%i5+%o4]0x88	! Mem[0000000010141408] = e8000000 bcffffff
!	%f6  = d14f1fda, Mem[0000000010141408] = ffffffbc
	sta	%f6 ,[%i5+%o4]0x80	! Mem[0000000010141408] = d14f1fda
!	%l5 = 0000000000000001, Mem[0000000010141408] = da1f4fd1
	stwa	%l5,[%i5+%o4]0x88	! Mem[0000000010141408] = 00000001
!	%l6 = 7fffffff, %l7 = 660009c2, Mem[0000000010181410] = 83f50d69 7500cd4c
	stda	%l6,[%i6+%o5]0x80	! Mem[0000000010181410] = 7fffffff 660009c2
!	%l2 = 0000000000000067, Mem[0000000030041408] = ffffff12
	stba	%l2,[%i1+%o4]0x81	! Mem[0000000030041408] = 67ffff12
!	Starting 10 instruction Load Burst
!	Mem[00000000100c141c] = 46109074, %l2 = 0000000000000067
	lduha	[%i3+0x01e]%asi,%l2	! %l2 = 0000000000009074

p0_label_49:
!	Mem[0000000030141410] = 55a08fe2ff122473, %l6 = 000000007fffffff
	ldxa	[%i5+%o5]0x89,%l6	! %l6 = 55a08fe2ff122473
!	Mem[0000000010101400] = 000000ff, %l4 = 0000000099ffffff
	ldswa	[%i4+%g0]0x88,%l4	! %l4 = 00000000000000ff
!	%l0 = 000000000000caff, %l0 = 000000000000caff, %l2 = 0000000000009074
	sdivx	%l0,%l0,%l2		! %l2 = 0000000000000001
!	Mem[0000000030141408] = 09243570 6f0a8dad, %l0 = 0000caff, %l1 = 00009d57
	ldda	[%i5+%o4]0x81,%l0	! %l0 = 0000000009243570 000000006f0a8dad
!	Mem[0000000021800100] = a830d196, %l7 = ffffffff660009c2
	ldsha	[%o3+0x100]%asi,%l7	! %l7 = ffffffffffffa830
!	Mem[0000000030101410] = 579dfb69, %l2 = 0000000000000001
	lduba	[%i4+%o5]0x81,%l2	! %l2 = 0000000000000057
!	Mem[00000000300c1400] = ffff0000, %f10 = fff80201
	lda	[%i3+%g0]0x89,%f10	! %f10 = ffff0000
!	Mem[0000000030081410] = 04f83bee, %l6 = 55a08fe2ff122473
	lduwa	[%i2+%o5]0x81,%l6	! %l6 = 0000000004f83bee
!	Mem[0000000030081410] = 04f83bee, %l4 = 00000000000000ff
	ldsha	[%i2+%o5]0x81,%l4	! %l4 = 00000000000004f8
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1400] = 000000e4, %l6 = 0000000004f83bee
	swapa	[%i3+%g0]0x88,%l6	! %l6 = 00000000000000e4

p0_label_50:
!	%f22 = e8000000 bcffffff, Mem[0000000010081410] = 000000ff 00007f00
	stda	%f22,[%i2+0x010]%asi	! Mem[0000000010081410] = e8000000 bcffffff
!	%l0 = 09243570, %l1 = 6f0a8dad, Mem[0000000030181408] = 38f45aff 11bacda1
	stda	%l0,[%i6+%o4]0x89	! Mem[0000000030181408] = 09243570 6f0a8dad
!	Mem[0000000010081408] = ca434b01, %l6 = 00000000000000e4
	swapa	[%i2+%o4]0x88,%l6	! %l6 = 00000000ca434b01
!	%f0  = 581219fb a05be167 67e15ba0 fb191258
!	%f4  = 014b43ca 4c8cc301 d14f1fda 46109074
!	%f8  = 00000069 8b472800 ffff0000 2f8b875d
!	%f12 = e89fff14 45be3a33 00000069 8b472800
	stda	%f0,[%i0]ASI_COMMIT_P	! Block Store to 0000000010001400
!	%l0 = 0000000009243570, Mem[0000000030141400] = 10bb0000
	stba	%l0,[%i5+%g0]0x89	! Mem[0000000030141400] = 10bb0070
!	%l2 = 0000000000000057, imm = 0000000000000842, %l6 = 00000000ca434b01
	or	%l2,0x842,%l6		! %l6 = 0000000000000857
!	%f26 = 5ddf2b10 fe453ffd, Mem[0000000030101410] = 579dfb69 2f8b875d
	stda	%f26,[%i4+%o5]0x81	! Mem[0000000030101410] = 5ddf2b10 fe453ffd
!	%f24 = a226b52a 6bcc8e3c, %l2 = 0000000000000057
!	Mem[0000000030101430] = ee3bf804099a41a6
	add	%i4,0x030,%g1
	stda	%f24,[%g1+%l2]ASI_PST8_S ! Mem[0000000030101430] = ee26f82a09cc8e3c
!	%l4 = 00000000000004f8, Mem[0000000030041410] = ff4b43ca
	stwa	%l4,[%i1+%o5]0x81	! Mem[0000000030041410] = 000004f8
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = ff000000, %f25 = 6bcc8e3c
	lda	[%i4+%g0]0x80,%f25	! %f25 = ff000000

p0_label_51:
!	Mem[00000000300c1408] = 00000069, %l7 = ffffffffffffa830
	lduwa	[%i3+%o4]0x81,%l7	! %l7 = 0000000000000069
!	Mem[0000000030041400] = 7f121c24 e28fa055, %l2 = 00000057, %l3 = 24eb33d0
	ldda	[%i1+%g0]0x81,%l2	! %l2 = 000000007f121c24 00000000e28fa055
!	Mem[0000000021800080] = 7134bafb, %l0 = 0000000009243570
	lduh	[%o3+0x080],%l0		! %l0 = 0000000000007134
!	Mem[0000000010181428] = fd869538, %l7 = 0000000000000069
	ldsha	[%i6+0x028]%asi,%l7	! %l7 = fffffffffffffd86
!	Mem[0000000010141414] = 12000000, %l3 = 00000000e28fa055
	ldsw	[%i5+0x014],%l3		! %l3 = 0000000012000000
!	%l3 = 0000000012000000, %l5 = 0000000000000001, %l3 = 0000000012000000
	xor	%l3,%l5,%l3		! %l3 = 0000000012000001
!	Mem[0000000010041420] = e89fff14ff7c9ff6, %l4 = 00000000000004f8
	ldxa	[%i1+0x020]%asi,%l4	! %l4 = e89fff14ff7c9ff6
!	Mem[0000000010181420] = bc3dfff8, %l3 = 0000000012000001
	lduwa	[%i6+0x020]%asi,%l3	! %l3 = 00000000bc3dfff8
!	Mem[0000000020800000] = 99ffd48e, %l1 = 000000006f0a8dad
	lduh	[%o1+%g0],%l1		! %l1 = 00000000000099ff
!	Starting 10 instruction Store Burst
!	%f22 = e8000000, Mem[0000000030101410] = 102bdf5d
	sta	%f22,[%i4+%o5]0x89	! Mem[0000000030101410] = e8000000

p0_label_52:
!	%l7 = fffffffffffffd86, Mem[0000000010041410] = ffffffff
	stwa	%l7,[%i1+%o5]0x88	! Mem[0000000010041410] = fffffd86
	membar	#Sync			! Added by membar checker (10)
!	Mem[0000000010001418] = d14f1fda, %l7 = fffffffffffffd86
	swap	[%i0+0x018],%l7		! %l7 = 00000000d14f1fda
!	%l7 = 00000000d14f1fda, Mem[0000000030041400] = 241c127f
	stwa	%l7,[%i1+%g0]0x89	! Mem[0000000030041400] = d14f1fda
!	Mem[0000000010081410] = 000000e8, %l6 = 0000000000000857
	swapa	[%i2+%o5]0x88,%l6	! %l6 = 00000000000000e8
!	%f4  = 014b43ca, Mem[00000000300c1408] = 69000000
	sta	%f4 ,[%i3+%o4]0x89	! Mem[00000000300c1408] = 014b43ca
!	%l6 = 000000e8, %l7 = d14f1fda, Mem[0000000030101408] = d0ffffce e6689720
	stda	%l6,[%i4+%o4]0x81	! Mem[0000000030101408] = 000000e8 d14f1fda
!	%l1 = 00000000000099ff, %l2 = 000000007f121c24, %y  = 0000caff
	umul	%l1,%l2,%l2		! %l2 = 00004c7065db8bdc, %y = 00004c70
!	%l3 = 00000000bc3dfff8, Mem[0000000030001400] = 732412ff
	stba	%l3,[%i0+%g0]0x89	! Mem[0000000030001400] = 732412f8
!	Mem[0000000010041410] = 86fdffff, %l4 = e89fff14ff7c9ff6
	swapa	[%i1+%o5]0x80,%l4	! %l4 = 0000000086fdffff
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = 70352409, %l6 = 00000000000000e8
	ldswa	[%i5+%o4]0x89,%l6	! %l6 = 0000000070352409

p0_label_53:
!	Mem[0000000010181410] = ffffff7f, %l3 = 00000000bc3dfff8
	ldsha	[%i6+%o5]0x88,%l3	! %l3 = ffffffffffffff7f
!	Mem[0000000010001408] = 67e15ba0fb191258, %f10 = ffff0000 2f8b875d
	ldda	[%i0+%o4]0x80,%f10	! %f10 = 67e15ba0 fb191258
!	Mem[0000000030101410] = 000000e8, %l6 = 0000000070352409
	ldsba	[%i4+%o5]0x81,%l6	! %l6 = 0000000000000000
!	Mem[00000000201c0000] = a1bcd27d, %l4 = 0000000086fdffff
	lduba	[%o0+0x000]%asi,%l4	! %l4 = 00000000000000a1
!	%f18 = ffffffce, %f12 = e89fff14, %f4  = 014b43ca
	fmuls	%f18,%f12,%f4 		! %f4  = ffffffce
!	%f16 = 0000e3ff 0000000d ffffffce e6689720
!	%f20 = fffffff8 c2a22bd2 e8000000 bcffffff
!	%f24 = a226b52a ff000000 5ddf2b10 fe453ffd
!	%f28 = ee3bf804 099a41a6 fe120093 73a028f7
	stda	%f16,[%i6]ASI_BLK_AIUP	! Block Store to 0000000010181400
!	Mem[0000000010001410] = ca434b01, %l4 = 00000000000000a1
	lduba	[%i0+%o5]0x88,%l4	! %l4 = 0000000000000001
!	Mem[0000000030001410] = 00000037, %l0 = 0000000000007134
	lduha	[%i0+%o5]0x81,%l0	! %l0 = 0000000000000000
!	%f4  = ffffffce 4c8cc301, Mem[0000000010181410] = fffffff8 c2a22bd2
	stda	%f4 ,[%i6+%o5]0x80	! Mem[0000000010181410] = ffffffce 4c8cc301
!	Starting 10 instruction Store Burst
!	%f12 = e89fff14 45be3a33, Mem[0000000030181408] = 09243570 6f0a8dad
	stda	%f12,[%i6+%o4]0x89	! Mem[0000000030181408] = e89fff14 45be3a33

p0_label_54:
!	%l3 = ffffffffffffff7f, Mem[0000000010001410] = ca434b01
	stba	%l3,[%i0+%o5]0x88	! Mem[0000000010001410] = ca434b7f
!	%l4 = 0000000000000001, Mem[0000000010181410] = ffffffce
	stwa	%l4,[%i6+%o5]0x80	! Mem[0000000010181410] = 00000001
!	%l0 = 0000000000000000, Mem[0000000030041400] = da1f4fd1e28fa055
	stxa	%l0,[%i1+%g0]0x81	! Mem[0000000030041400] = 0000000000000000
!	%l2 = 65db8bdc, %l3 = ffffff7f, Mem[0000000030181408] = 45be3a33 e89fff14
	stda	%l2,[%i6+%o4]0x89	! Mem[0000000030181408] = 65db8bdc ffffff7f
!	Mem[0000000010141410] = 14ff9f04, %l2 = 00004c7065db8bdc
	ldstuba	[%i5+%o5]0x88,%l2	! %l2 = 00000004000000ff
!	Mem[000000001004143a] = bca18d70, %l7 = 00000000d14f1fda
	ldstuba	[%i1+0x03a]%asi,%l7	! %l7 = 0000008d000000ff
!	Mem[0000000010081408] = e4000000, %l2 = 0000000000000004
	swapa	[%i2+%o4]0x80,%l2	! %l2 = 00000000e4000000
!	Mem[0000000030081410] = 04f83bee, %l4 = 0000000000000001
	swapa	[%i2+%o5]0x81,%l4	! %l4 = 0000000004f83bee
	membar	#Sync			! Added by membar checker (11)
!	Mem[0000000010181410] = 00000001, %l0 = 0000000000000000
	swapa	[%i6+%o5]0x80,%l0	! %l0 = 0000000000000001
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = dc8bdb657fffffff, %f0  = 581219fb a05be167
	ldda	[%i6+%o4]0x81,%f0 	! %f0  = dc8bdb65 7fffffff

p0_label_55:
!	Mem[0000000010081400] = 2f8b875d, %l5 = 0000000000000001
	lduha	[%i2+%g0]0x88,%l5	! %l5 = 000000000000875d
!	Mem[00000000100c1410] = 014b43ca, %f6  = d14f1fda
	ld	[%i3+%o5],%f6 	! %f6 = 014b43ca
!	%l0 = 0000000000000001, immed = 00000ab0, %y  = 00004c70
	udiv	%l0,0xab0,%l4		! %l4 = 00000000ffffffff
	mov	%l0,%y			! %y = 00000001
!	Mem[0000000010101410] = ff0000ff00000037, %l7 = 000000000000008d
	ldxa	[%i4+%o5]0x80,%l7	! %l7 = ff0000ff00000037
!	Mem[00000000100c1424] = 8b472800, %l7 = ff0000ff00000037
	ldsba	[%i3+0x024]%asi,%l7	! %l7 = ffffffffffffff8b
!	Mem[0000000030141400] = 5f89b906 10bb0070, %l6 = 00000000, %l7 = ffffff8b
	ldda	[%i5+%g0]0x89,%l6	! %l6 = 0000000010bb0070 000000005f89b906
!	Mem[00000000100c142c] = 2f8b875d, %l1 = 00000000000099ff
	lduw	[%i3+0x02c],%l1		! %l1 = 000000002f8b875d
!	Mem[0000000030181408] = 65db8bdc, %l6 = 0000000010bb0070
	ldsha	[%i6+%o4]0x89,%l6	! %l6 = ffffffffffff8bdc
!	Mem[0000000010041408] = 000000690000007f, %l4 = 00000000ffffffff
	ldxa	[%i1+%o4]0x88,%l4	! %l4 = 000000690000007f
!	Starting 10 instruction Store Burst
!	Mem[0000000030041408] = 12ffff67, %l3 = ffffffffffffff7f
	ldstuba	[%i1+%o4]0x89,%l3	! %l3 = 00000067000000ff

p0_label_56:
!	%l2 = e4000000, %l3 = 00000067, Mem[00000000300c1410] = e6680037 ffffffce
	stda	%l2,[%i3+%o5]0x89	! Mem[00000000300c1410] = e4000000 00000067
!	Mem[0000000010081400] = 5d878b2f, %l1 = 000000002f8b875d
	ldstuba	[%i2+%g0]0x80,%l1	! %l1 = 0000005d000000ff
!	%f26 = 5ddf2b10 fe453ffd, Mem[0000000010141410] = ff9fff14 12000000
	stda	%f26,[%i5+%o5]0x80	! Mem[0000000010141410] = 5ddf2b10 fe453ffd
!	Mem[0000000010101400] = 000000ff, %l0 = 0000000000000001
	swapa	[%i4+%g0]0x88,%l0	! %l0 = 00000000000000ff
!	%f30 = fe120093, Mem[0000000030181400] = 99ffffff
	sta	%f30,[%i6+%g0]0x89	! Mem[0000000030181400] = fe120093
!	%f17 = 0000000d, Mem[0000000010181408] = ffffffce
	sta	%f17,[%i6+%o4]0x80	! Mem[0000000010181408] = 0000000d
!	%l3 = 0000000000000067, Mem[0000000010001408] = 581219fba05be167
	stxa	%l3,[%i0+%o4]0x88	! Mem[0000000010001408] = 0000000000000067
!	%f8  = 00000069 8b472800, Mem[0000000030081408] = 000000e4 00000000
	stda	%f8 ,[%i2+%o4]0x81	! Mem[0000000030081408] = 00000069 8b472800
!	%l3 = 0000000000000067, Mem[0000000010141410] = 5ddf2b10
	stba	%l3,[%i5+%o5]0x80	! Mem[0000000010141410] = 67df2b10
!	Starting 10 instruction Load Burst
!	%l6 = ffffffffffff8bdc, immed = 0000045b, %y  = 00000001
	smul	%l6,0x45b,%l3		! %l3 = fffffffffe062734, %y = ffffffff

p0_label_57:
!	Mem[0000000030081408] = 00000069, %l3 = fffffffffe062734
	lduba	[%i2+%o4]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000010001400] = 581219fb, %l2 = 00000000e4000000
	lduwa	[%i0+%g0]0x80,%l2	! %l2 = 00000000581219fb
!	Mem[0000000010181400] = ffe30000, %l2 = 00000000581219fb
	lduwa	[%i6+%g0]0x88,%l2	! %l2 = 00000000ffe30000
!	Mem[0000000020800000] = 99ffd48e, %l2 = 00000000ffe30000
	lduha	[%o1+0x000]%asi,%l2	! %l2 = 00000000000099ff
!	Mem[00000000100c1400] = ee3bf8040000000d, %f8  = 00000069 8b472800
	ldda	[%i3+%g0]0x80,%f8 	! %f8  = ee3bf804 0000000d
!	Mem[0000000030141408] = 09243570, %l1 = 000000000000005d
	lduha	[%i5+%o4]0x81,%l1	! %l1 = 0000000000000924
!	Mem[0000000010001400] = fb191258, %l6 = ffffffffffff8bdc
	lduba	[%i0+%g0]0x88,%l6	! %l6 = 0000000000000058
!	Mem[0000000010081438] = 000000ff, %f20 = fffffff8
	lda	[%i2+0x038]%asi,%f20	! %f20 = 000000ff
!	Mem[0000000030141408] = 70352409, %l4 = 000000690000007f
	lduwa	[%i5+%o4]0x89,%l4	! %l4 = 0000000070352409
!	Starting 10 instruction Store Burst
!	%f4  = ffffffce 4c8cc301, Mem[0000000030141408] = 09243570 6f0a8dad
	stda	%f4 ,[%i5+%o4]0x81	! Mem[0000000030141408] = ffffffce 4c8cc301

p0_label_58:
!	Mem[00000000201c0000] = a1bcd27d, %l5 = 000000000000875d
	ldstuba	[%o0+0x000]%asi,%l5	! %l5 = 000000a1000000ff
!	%f24 = a226b52a, %f11 = fb191258, %f24 = a226b52a
	fadds	%f24,%f11,%f24		! %f24 = fb191258
!	Mem[0000000021800140] = 00006ae1, %l5 = 00000000000000a1
	ldstub	[%o3+0x140],%l5		! %l5 = 00000000000000ff
!	%l0 = 00000000000000ff, Mem[0000000021800140] = ff006ae1, %asi = 80
	stha	%l0,[%o3+0x140]%asi	! Mem[0000000021800140] = 00ff6ae1
!	%l4 = 0000000070352409, Mem[00000000300c1410] = 000000e467000000
	stxa	%l4,[%i3+%o5]0x81	! Mem[00000000300c1410] = 0000000070352409
!	%l3 = 0000000000000000, Mem[0000000010041408] = 7f000000
	stwa	%l3,[%i1+%o4]0x80	! Mem[0000000010041408] = 00000000
!	Mem[0000000030141410] = ff122473, %l4 = 0000000070352409
	swapa	[%i5+%o5]0x89,%l4	! %l4 = 00000000ff122473
!	%f0  = dc8bdb65 7fffffff 67e15ba0 fb191258
!	%f4  = ffffffce 4c8cc301 014b43ca 46109074
!	%f8  = ee3bf804 0000000d 67e15ba0 fb191258
!	%f12 = e89fff14 45be3a33 00000069 8b472800
	stda	%f0,[%i0]ASI_BLK_AIUPL	! Block Store to 0000000010001400
!	%l6 = 0000000000000058, Mem[0000000030041408] = ffffff12
	stba	%l6,[%i1+%o4]0x81	! Mem[0000000030041408] = 58ffff12
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = 0102f8ff, %l2 = 00000000000099ff
	lduwa	[%i0+%o4]0x89,%l2	! %l2 = 000000000102f8ff

p0_label_59:
!	Mem[0000000030141408] = ffffffce, %l3 = 0000000000000000
	lduha	[%i5+%o4]0x81,%l3	! %l3 = 000000000000ffff
!	Mem[0000000030001408] = 0102f8ff, %f29 = 099a41a6
	lda	[%i0+%o4]0x89,%f29	! %f29 = 0102f8ff
!	Mem[0000000010041408] = 0000000069000000, %l4 = 00000000ff122473
	ldxa	[%i1+%o4]0x80,%l4	! %l4 = 0000000069000000
	membar	#Sync			! Added by membar checker (12)
!	Mem[0000000010001400] = ffffff7f65db8bdc, %l1 = 0000000000000924
	ldxa	[%i0+%g0]0x80,%l1	! %l1 = ffffff7f65db8bdc
!	Mem[0000000030041400] = 00000000, %l7 = 000000005f89b906
	lduwa	[%i1+%g0]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000030041400] = 00000000 00000000 58ffff12 fb191258
!	Mem[0000000030041410] = 000004f8 4c8cc301 d14f1fda 46109074
!	Mem[0000000030041420] = 901acbd0 73a3db94 579dfb69 2f8b875d
!	Mem[0000000030041430] = e89fff14 45be3a33 466c4463 e28fa055
	ldda	[%i1]ASI_BLK_AIUSL,%f16	! Block Load from 0000000030041400
!	Mem[0000000030041400] = 00000000, %l7 = 0000000000000000
	ldsha	[%i1+%g0]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000030041410] = 01c38c4cf8040000, %l3 = 000000000000ffff
	ldxa	[%i1+%o5]0x89,%l3	! %l3 = 01c38c4cf8040000
!	Mem[0000000030181408] = 65db8bdc, %l1 = ffffff7f65db8bdc
	lduwa	[%i6+%o4]0x89,%l1	! %l1 = 0000000065db8bdc
!	Starting 10 instruction Store Burst
!	Mem[0000000030041410] = f8040000, %l0 = 00000000000000ff
	ldstuba	[%i1+%o5]0x89,%l0	! %l0 = 00000000000000ff

p0_label_60:
!	Mem[0000000010001430] = 333abe4514ff9fe8, %l5 = 0000000000000000, %l5 = 0000000000000000
	add	%i0,0x30,%g1
	casxa	[%g1]0x80,%l5,%l5	! %l5 = 333abe4514ff9fe8
!	%l4 = 0000000069000000, Mem[0000000010181400] = 0000e3ff
	stba	%l4,[%i6+%g0]0x80	! Mem[0000000010181400] = 0000e3ff
!	%l5 = 333abe4514ff9fe8, Mem[0000000010181408] = 0000000d
	stwa	%l5,[%i6+%o4]0x80	! Mem[0000000010181408] = 14ff9fe8
!	%l4 = 0000000069000000, Mem[00000000300c1400] = ffff0000
	stba	%l4,[%i3+%g0]0x89	! Mem[00000000300c1400] = ffff0000
!	%l5 = 333abe4514ff9fe8, Mem[0000000010081408] = 000000044c8cc301
	stxa	%l5,[%i2+%o4]0x80	! Mem[0000000010081408] = 333abe4514ff9fe8
!	Mem[0000000010141400] = 708da1bc, %l6 = 0000000000000058
	swapa	[%i5+%g0]0x88,%l6	! %l6 = 00000000708da1bc
!	%f4  = ffffffce 4c8cc301, Mem[0000000010001420] = 0d000000 04f83bee
	std	%f4 ,[%i0+0x020]	! Mem[0000000010001420] = ffffffce 4c8cc301
!	Mem[0000000010081410] = 57080000bcffffff, %l4 = 0000000069000000, %l7 = 0000000000000000
	add	%i2,0x10,%g1
	casxa	[%g1]0x80,%l4,%l7	! %l7 = 57080000bcffffff
!	%l4 = 0000000069000000, Mem[0000000010141408] = 01000000
	stba	%l4,[%i5+%o4]0x80	! Mem[0000000010141408] = 00000000
!	Starting 10 instruction Load Burst
!	%f1  = 7fffffff, %f1  = 7fffffff
	fcmpes	%fcc1,%f1 ,%f1 		! %fcc1 = 3

p0_label_61:
!	Mem[0000000010101410] = ff0000ff, %l5 = 333abe4514ff9fe8
	ldsba	[%i4+%o5]0x80,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000030041400] = 00000000, %l7 = 57080000bcffffff
	lduwa	[%i1+%g0]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000010181408] = 14ff9fe8, %l2 = 000000000102f8ff
	lduba	[%i6+%o4]0x80,%l2	! %l2 = 0000000000000014
!	Mem[0000000010141434] = 06e3359c, %f11 = fb191258
	ld	[%i5+0x034],%f11	! %f11 = 06e3359c
!	Mem[0000000010141408] = 00000000, %l7 = 0000000000000000
	swapa	[%i5+%o4]0x88,%l7	! %l7 = 0000000000000000
!	Mem[00000000300c1410] = 00000000, %l6 = 00000000708da1bc
	ldsha	[%i3+%o5]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000030041410] = ff0004f8 4c8cc301, %l6 = 00000000, %l7 = 00000000
	ldda	[%i1+%o5]0x81,%l6	! %l6 = 00000000ff0004f8 000000004c8cc301
!	Mem[0000000010181404] = 0000000d, %l7 = 000000004c8cc301
	lduwa	[%i6+0x004]%asi,%l7	! %l7 = 000000000000000d
!	Mem[0000000010041408] = 00000000, %l3 = 01c38c4cf8040000
	ldsba	[%i1+%o4]0x80,%l3	! %l3 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[00000000211c0000] = 00012346, %l3 = 0000000000000000
	ldstub	[%o2+%g0],%l3		! %l3 = 00000000000000ff

p0_label_62:
!	%l2 = 0000000000000014, Mem[0000000010101410] = ff0000ff
	stha	%l2,[%i4+%o5]0x88	! Mem[0000000010101410] = ff000014
!	Mem[0000000030101408] = e8000000, %l3 = 0000000000000000
	swapa	[%i4+%o4]0x89,%l3	! %l3 = 00000000e8000000
!	Mem[0000000030141410] = 09243570, %l3 = 00000000e8000000
	ldstuba	[%i5+%o5]0x81,%l3	! %l3 = 00000009000000ff
!	Mem[0000000030041410] = f80400ff, %l4 = 0000000069000000
	ldstuba	[%i1+%o5]0x89,%l4	! %l4 = 000000ff000000ff
!	%f5  = 4c8cc301, Mem[0000000010041428] = 014b43ca
	st	%f5 ,[%i1+0x028]	! Mem[0000000010041428] = 4c8cc301
!	%l6 = 00000000ff0004f8, Mem[0000000010101422] = 5c70165c, %asi = 80
	stha	%l6,[%i4+0x022]%asi	! Mem[0000000010101420] = 5c7004f8
!	Mem[00000000300c1410] = 00000000, %l2 = 0000000000000014
	swapa	[%i3+%o5]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000010081400] = 2f8b87ff, %l1 = 0000000065db8bdc
	ldstuba	[%i2+%g0]0x88,%l1	! %l1 = 000000ff000000ff
!	Mem[0000000010141428] = b205b2b0, %l0 = 0000000000000000
	swap	[%i5+0x028],%l0		! %l0 = 00000000b205b2b0
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = ff012346, %l2 = 0000000000000000
	ldsb	[%o2+0x001],%l2		! %l2 = 0000000000000001

p0_label_63:
!	Mem[0000000010141410] = 67df2b10, %l1 = 00000000000000ff
	ldsha	[%i5+%o5]0x80,%l1	! %l1 = 00000000000067df
!	Mem[0000000030041408] = 12ffff58, %l6 = 00000000ff0004f8
	ldsba	[%i1+%o4]0x89,%l6	! %l6 = 0000000000000058
!	Mem[0000000030001408] = 7643a2bf0102f8ff, %l6 = 0000000000000058
	ldxa	[%i0+%o4]0x89,%l6	! %l6 = 7643a2bf0102f8ff
!	Mem[0000000030001408] = fff80201, %l5 = ffffffffffffffff
	lduwa	[%i0+%o4]0x81,%l5	! %l5 = 00000000fff80201
!	Mem[0000000030081400] = bcffffff, %l4 = 00000000000000ff
	ldswa	[%i2+%g0]0x81,%l4	! %l4 = ffffffffbcffffff
!	Mem[0000000010001408] = 581219fb, %l6 = 7643a2bf0102f8ff
	lduba	[%i0+%o4]0x80,%l6	! %l6 = 0000000000000058
	membar	#Sync			! Added by membar checker (13)
!	Mem[0000000030041400] = 00000000 00000000 58ffff12 fb191258
!	Mem[0000000030041410] = ff0004f8 4c8cc301 d14f1fda 46109074
!	Mem[0000000030041420] = 901acbd0 73a3db94 579dfb69 2f8b875d
!	Mem[0000000030041430] = e89fff14 45be3a33 466c4463 e28fa055
	ldda	[%i1]ASI_BLK_SL,%f16	! Block Load from 0000000030041400
!	Mem[0000000010081408] = 45be3a33, %l4 = ffffffffbcffffff
	lduba	[%i2+%o4]0x88,%l4	! %l4 = 0000000000000033
!	Mem[00000000201c0000] = ffbcd27d, %l1 = 00000000000067df
	ldub	[%o0+%g0],%l1		! %l1 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%f4  = ffffffce 4c8cc301, Mem[0000000010081410] = 57080000 bcffffff
	stda	%f4 ,[%i2+%o5]0x80	! Mem[0000000010081410] = ffffffce 4c8cc301

p0_label_64:
!	%l3 = 0000000000000009, Mem[0000000010181400] = ffe30000
	stwa	%l3,[%i6+%g0]0x88	! Mem[0000000010181400] = 00000009
!	%f8  = ee3bf804, Mem[0000000030101408] = 00000000
	sta	%f8 ,[%i4+%o4]0x81	! Mem[0000000030101408] = ee3bf804
!	Mem[00000000100c1408] = 67e15ba0, %l5 = 00000000fff80201
	ldstuba	[%i3+%o4]0x80,%l5	! %l5 = 00000067000000ff
!	%f0  = dc8bdb65 7fffffff 67e15ba0 fb191258
!	%f4  = ffffffce 4c8cc301 014b43ca 46109074
!	%f8  = ee3bf804 0000000d 67e15ba0 06e3359c
!	%f12 = e89fff14 45be3a33 00000069 8b472800
	stda	%f0,[%i3]ASI_BLK_S	! Block Store to 00000000300c1400
!	%l5 = 0000000000000067, Mem[0000000010181400] = 00000009
	stwa	%l5,[%i6+%g0]0x88	! Mem[0000000010181400] = 00000067
!	%l7 = 000000000000000d, Mem[00000000100c1404] = 0000000d, %asi = 80
	stwa	%l7,[%i3+0x004]%asi	! Mem[00000000100c1404] = 0000000d
!	%l0 = b205b2b0, %l1 = 000000ff, Mem[0000000010081400] = ff878b2f 69fb9d57
	stda	%l0,[%i2+%g0]0x80	! Mem[0000000010081400] = b205b2b0 000000ff
!	Mem[0000000010041404] = 000000e8, %l5 = 0000000000000067
	swap	[%i1+0x004],%l5		! %l5 = 00000000000000e8
!	Mem[0000000030041410] = ff0004f8, %l1 = 00000000000000ff
	ldstuba	[%i1+%o5]0x81,%l1	! %l1 = 000000ff000000ff
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (14)
!	Mem[00000000100c1408] = a05be1ff, %l2 = 0000000000000001
	lduwa	[%i3+%o4]0x88,%l2	! %l2 = 00000000a05be1ff

p0_label_65:
!	Mem[00000000211c0000] = ff012346, %l6 = 0000000000000058
	ldsh	[%o2+%g0],%l6		! %l6 = ffffffffffffff01
!	Mem[0000000010001410] = 4c8cc301, %l6 = ffffffffffffff01
	lduwa	[%i0+%o5]0x88,%l6	! %l6 = 000000004c8cc301
!	Mem[00000000300c1408] = 67e15ba0, %l4 = 0000000000000033
	lduha	[%i3+%o4]0x81,%l4	! %l4 = 00000000000067e1
!	Mem[0000000010141438] = c0e9c437, %l1 = 00000000000000ff
	lduw	[%i5+0x038],%l1		! %l1 = 00000000c0e9c437
!	Mem[00000000300c1410] = ceffffff, %l0 = 00000000b205b2b0
	ldsha	[%i3+%o5]0x89,%l0	! %l0 = ffffffffffffffff
!	Mem[00000000100c1410] = 014b43ca, %l0 = ffffffffffffffff
	lduba	[%i3+%o5]0x80,%l0	! %l0 = 0000000000000001
!	Mem[0000000010141430] = 524b7e2e06e3359c, %l1 = 00000000c0e9c437
	ldxa	[%i5+0x030]%asi,%l1	! %l1 = 524b7e2e06e3359c
!	Mem[0000000030101410] = 000000e8, %l7 = 000000000000000d
	ldsha	[%i4+%o5]0x81,%l7	! %l7 = 0000000000000000
!	%f19 = 12ffff58, %f5  = 4c8cc301, %f7  = 46109074
	fmuls	%f19,%f5 ,%f7 		! %f7  = 200cc2a5
!	Starting 10 instruction Store Burst
!	Mem[0000000010181406] = 0000000d, %l6 = 000000004c8cc301
	ldstub	[%i6+0x006],%l6		! %l6 = 00000000000000ff

p0_label_66:
!	%l5 = 00000000000000e8, Mem[00000000300c1408] = 67e15ba0
	stha	%l5,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00e85ba0
!	Mem[0000000010141404] = 7d7a88ba, %f25 = d0cb1a90
	lda	[%i5+0x004]%asi,%f25	! %f25 = 7d7a88ba
!	%l5 = 00000000000000e8, Mem[00000000201c0000] = ffbcd27d
	sth	%l5,[%o0+%g0]		! Mem[00000000201c0000] = 00e8d27d
!	Mem[0000000030101408] = 04f83bee, %l3 = 0000000000000009
	swapa	[%i4+%o4]0x89,%l3	! %l3 = 0000000004f83bee
!	%l0 = 0000000000000001, Mem[0000000010141400] = ba887a7d00000058
	stxa	%l0,[%i5+%g0]0x88	! Mem[0000000010141400] = 0000000000000001
!	%l0 = 0000000000000001, Mem[00000000100c1408] = ffe15ba05a191258, %asi = 80
	stxa	%l0,[%i3+0x008]%asi	! Mem[00000000100c1408] = 0000000000000001
!	%l7 = 0000000000000000, Mem[0000000030081408] = 00000069
	stba	%l7,[%i2+%o4]0x81	! Mem[0000000030081408] = 00000069
!	Mem[0000000010181418] = e8000000, %l5 = 00000000000000e8, %asi = 80
	swapa	[%i6+0x018]%asi,%l5	! %l5 = 00000000e8000000
!	%l4 = 00000000000067e1, Mem[0000000020800040] = ff002a9b, %asi = 80
	stha	%l4,[%o1+0x040]%asi	! Mem[0000000020800040] = 67e12a9b
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = e6689720, %l1 = 524b7e2e06e3359c
	ldsba	[%i4+%o4]0x80,%l1	! %l1 = ffffffffffffffe6

p0_label_67:
!	Mem[0000000020800000] = 99ffd48e, %l5 = 00000000e8000000
	lduh	[%o1+%g0],%l5		! %l5 = 00000000000099ff
!	Mem[0000000010181408] = e89fff14, %f8  = ee3bf804
	lda	[%i6+%o4]0x88,%f8 	! %f8 = e89fff14
!	Mem[0000000030181410] = a6419a09, %l3 = 0000000004f83bee
	lduba	[%i6+%o5]0x81,%l3	! %l3 = 00000000000000a6
!	Mem[0000000010181428] = 5ddf2b10fe453ffd, %l5 = 00000000000099ff
	ldx	[%i6+0x028],%l5		! %l5 = 5ddf2b10fe453ffd
!	Mem[0000000030001410] = fff8ffff 37000000, %l0 = 00000001, %l1 = ffffffe6
	ldda	[%i0+%o5]0x89,%l0	! %l0 = 0000000037000000 00000000fff8ffff
!	Mem[0000000010141414] = fe453ffd, %l7 = 0000000000000000
	ldsw	[%i5+0x014],%l7		! %l7 = fffffffffe453ffd
!	Mem[0000000030101408] = 09000000d14f1fda, %l6 = 0000000000000000
	ldxa	[%i4+%o4]0x81,%l6	! %l6 = 09000000d14f1fda
!	Mem[0000000010181404] = 0000ff0d, %l6 = 09000000d14f1fda
	ldsh	[%i6+0x006],%l6		! %l6 = ffffffffffffff0d
!	Mem[00000000100c1408] = 0100000000000000, %l2 = 00000000a05be1ff
	ldxa	[%i3+%o4]0x88,%l2	! %l2 = 0100000000000000
!	Starting 10 instruction Store Burst
!	%l4 = 00000000000067e1, Mem[0000000010001408] = 581219fba05be167
	stxa	%l4,[%i0+%o4]0x80	! Mem[0000000010001408] = 00000000000067e1

p0_label_68:
!	%f18 = 581219fb, %f7  = 200cc2a5
	fsqrts	%f18,%f7 		! %f7  = 4bc1655b
!	%l3 = 00000000000000a6, Mem[00000000100c1404] = 0000000d, %asi = 80
	stha	%l3,[%i3+0x004]%asi	! Mem[00000000100c1404] = 00a6000d
!	Mem[00000000201c0000] = 00e8d27d, %l4 = 00000000000067e1
	ldsba	[%o0+0x000]%asi,%l4	! %l4 = 0000000000000000
!	%l6 = ffffff0d, %l7 = fe453ffd, Mem[0000000010101410] = 140000ff 00000037
	stda	%l6,[%i4+0x010]%asi	! Mem[0000000010101410] = ffffff0d fe453ffd
!	%l2 = 0100000000000000, Mem[00000000201c0000] = 00e8d27d, %asi = 80
	stha	%l2,[%o0+0x000]%asi	! Mem[00000000201c0000] = 0000d27d
!	%l6 = ffffffffffffff0d, Mem[00000000300c1408] = 00e85ba0fb191258
	stxa	%l6,[%i3+%o4]0x81	! Mem[00000000300c1408] = ffffffffffffff0d
!	%l6 = ffffffffffffff0d, Mem[0000000010141420] = 7d7a88baa094dd2b
	stx	%l6,[%i5+0x020]		! Mem[0000000010141420] = ffffffffffffff0d
!	%l0 = 0000000037000000, Mem[0000000030181400] = 930012fe
	stwa	%l0,[%i6+%g0]0x81	! Mem[0000000030181400] = 37000000
!	%l6 = ffffffffffffff0d, Mem[00000000201c0000] = 0000d27d
	stb	%l6,[%o0+%g0]		! Mem[00000000201c0000] = 0d00d27d
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = b205b2b0, %l3 = 00000000000000a6
	lduba	[%i2+%g0]0x80,%l3	! %l3 = 00000000000000b2

p0_label_69:
!	Mem[00000000100c1410] = 014b43ca4c8cc301, %l7 = fffffffffe453ffd
	ldxa	[%i3+0x010]%asi,%l7	! %l7 = 014b43ca4c8cc301
!	Mem[00000000300c1400] = ffffff7f 65db8bdc, %l2 = 00000000, %l3 = 000000b2
	ldda	[%i3+%g0]0x89,%l2	! %l2 = 0000000065db8bdc 00000000ffffff7f
!	Mem[0000000030041408] = 581219fb 12ffff58, %l6 = ffffff0d, %l7 = 4c8cc301
	ldda	[%i1+%o4]0x89,%l6	! %l6 = 0000000012ffff58 00000000581219fb
!	Mem[0000000010001438] = 0028478b, %l4 = 0000000000000000
	ldub	[%i0+0x03b],%l4		! %l4 = 000000000000008b
!	Mem[0000000010081408] = 333abe45, %l6 = 0000000012ffff58
	ldswa	[%i2+%o4]0x80,%l6	! %l6 = 00000000333abe45
!	Mem[0000000030081400] = bcffffff, %l5 = 5ddf2b10fe453ffd
	lduwa	[%i2+%g0]0x81,%l5	! %l5 = 00000000bcffffff
!	Mem[00000000300c1410] = ffffffce, %l2 = 0000000065db8bdc
	lduba	[%i3+%o5]0x81,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010101400] = 01000000, %l3 = 00000000ffffff7f
	lduba	[%i4+%g0]0x80,%l3	! %l3 = 0000000000000001
!	Mem[000000001000141c] = ca434b01, %l6 = 00000000333abe45
	ldsw	[%i0+0x01c],%l6		! %l6 = ffffffffca434b01
!	Starting 10 instruction Store Burst
!	%f26 = 5d878b2f 69fb9d57, Mem[0000000010001408] = 00000000 e1670000
	stda	%f26,[%i0+%o4]0x88	! Mem[0000000010001408] = 5d878b2f 69fb9d57

p0_label_70:
!	%l1 = 00000000fff8ffff, Mem[000000001014141c] = 35112447
	stw	%l1,[%i5+0x01c]		! Mem[000000001014141c] = fff8ffff
!	%f18 = 581219fb 12ffff58, Mem[0000000010041418] = 4a6d6276 77cebcc5
	stda	%f18,[%i1+0x018]%asi	! Mem[0000000010041418] = 581219fb 12ffff58
!	%f13 = 45be3a33, %f1  = 7fffffff, %f12 = e89fff14
	fsubs	%f13,%f1 ,%f12		! %f12 = 7fffffff
!	%l7 = 00000000581219fb, %l6 = ffffffffca434b01, %l6 = ffffffffca434b01
	subc	%l7,%l6,%l6		! %l6 = 000000008dcecefa
!	%f3  = fb191258, Mem[0000000030081410] = 01000000
	sta	%f3 ,[%i2+%o5]0x89	! Mem[0000000030081410] = fb191258
!	%l0 = 0000000037000000, Mem[0000000010181400] = 67000000
	stba	%l0,[%i6+%g0]0x80	! Mem[0000000010181400] = 00000000
!	%l3 = 0000000000000001, Mem[000000001004143d] = ba843aff, %asi = 80
	stba	%l3,[%i1+0x03d]%asi	! Mem[000000001004143c] = ba013aff
!	%l2 = 00000000000000ff, Mem[0000000030001400] = f8122473c4fe0ea1
	stxa	%l2,[%i0+%g0]0x81	! Mem[0000000030001400] = 00000000000000ff
!	Mem[0000000030001408] = 0102f8ff, %l3 = 0000000000000001
	swapa	[%i0+%o4]0x89,%l3	! %l3 = 000000000102f8ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = 58ffff12, %l1 = 00000000fff8ffff
	ldsha	[%i1+%o4]0x81,%l1	! %l1 = 00000000000058ff

p0_label_71:
!	Mem[0000000010141408] = 00000000, %l7 = 00000000581219fb
	ldsba	[%i5+%o4]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000010001410] = ffffffce 4c8cc301, %l6 = 8dcecefa, %l7 = 00000000
	ldda	[%i0+%o5]0x88,%l6	! %l6 = 000000004c8cc301 00000000ffffffce
!	Mem[0000000020800040] = 67e12a9b, %l6 = 000000004c8cc301
	ldub	[%o1+0x040],%l6		! %l6 = 0000000000000067
!	Mem[00000000100c140c] = 00000001, %l7 = 00000000ffffffce
	lduba	[%i3+0x00f]%asi,%l7	! %l7 = 0000000000000001
!	Mem[0000000010101400] = 01000000 00000000, %l0 = 37000000, %l1 = 000058ff
	ldd	[%i4+%g0],%l0		! %l0 = 0000000001000000 0000000000000000
!	Mem[0000000021800040] = 0645a70e, %l5 = 00000000bcffffff
	ldsh	[%o3+0x040],%l5		! %l5 = 0000000000000645
!	Mem[0000000010001420] = ffffffce, %l1 = 0000000000000000
	lduw	[%i0+0x020],%l1		! %l1 = 00000000ffffffce
!	Mem[0000000010181404] = 0000ff0d, %l1 = 00000000ffffffce
	ldswa	[%i6+0x004]%asi,%l1	! %l1 = 000000000000ff0d
!	Mem[0000000030181400] = 37000000, %f17 = 00000000
	lda	[%i6+%g0]0x81,%f17	! %f17 = 37000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010181414] = 4c8cc301, %f27 = 69fb9d57
	ld	[%i6+0x014],%f27	! %f27 = 4c8cc301

p0_label_72:
!	%l7 = 0000000000000001, Mem[0000000010141408] = 00000000
	stha	%l7,[%i5+%o4]0x80	! Mem[0000000010141408] = 00010000
!	Mem[0000000030141408] = ceffffff, %l4 = 000000000000008b
	swapa	[%i5+%o4]0x89,%l4	! %l4 = 00000000ceffffff
!	%l0 = 01000000, %l1 = 0000ff0d, Mem[0000000010001420] = ffffffce 4c8cc301
	std	%l0,[%i0+0x020]		! Mem[0000000010001420] = 01000000 0000ff0d
!	%l4 = ceffffff, %l5 = 00000645, Mem[0000000010141410] = 102bdf67 fd3f45fe
	stda	%l4,[%i5+%o5]0x88	! Mem[0000000010141410] = ceffffff 00000645
!	%f12 = 7fffffff 45be3a33, %l3 = 000000000102f8ff
!	Mem[0000000010001418] = 74901046ca434b01
	add	%i0,0x018,%g1
	stda	%f12,[%g1+%l3]ASI_PST16_PL ! Mem[0000000010001418] = 333abe45ffffff7f
!	%f10 = 67e15ba0 06e3359c, Mem[0000000010081438] = 000000ff cd4a1404
	std	%f10,[%i2+0x038]	! Mem[0000000010081438] = 67e15ba0 06e3359c
!	Mem[0000000030081410] = 581219fb, %l6 = 0000000000000067
	swapa	[%i2+%o5]0x81,%l6	! %l6 = 00000000581219fb
!	%f12 = 7fffffff, %f3  = fb191258
	fstoi	%f12,%f3 		! %f3  = 7fffffff
!	Mem[00000000201c0001] = 0d00d27d, %l1 = 000000000000ff0d
	ldstub	[%o0+0x001],%l1		! %l1 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010141420] = ffffffffffffff0d, %f8  = e89fff14 0000000d
	ldda	[%i5+0x020]%asi,%f8 	! %f8  = ffffffff ffffff0d

p0_label_73:
!	Mem[00000000211c0000] = ff012346, %l7 = 0000000000000001
	lduha	[%o2+0x000]%asi,%l7	! %l7 = 000000000000ff01
!	Mem[0000000030141400] = 5f89b90610bb0070, %l2 = 00000000000000ff
	ldxa	[%i5+%g0]0x89,%l2	! %l2 = 5f89b90610bb0070
!	Mem[0000000010081430] = 466c560cf504a055, %l6 = 00000000581219fb
	ldx	[%i2+0x030],%l6		! %l6 = 466c560cf504a055
!	Mem[0000000010101408] = 209768e6, %l5 = 0000000000000645
	lduba	[%i4+%o4]0x88,%l5	! %l5 = 00000000000000e6
!	Mem[0000000020800040] = 67e12a9b, %l2 = 5f89b90610bb0070
	ldsha	[%o1+0x040]%asi,%l2	! %l2 = 00000000000067e1
!	Mem[0000000010081434] = f504a055, %l6 = 466c560cf504a055
	ldsha	[%i2+0x034]%asi,%l6	! %l6 = fffffffffffff504
!	Mem[00000000218000c0] = 34ff1f7c, %l3 = 000000000102f8ff
	ldsba	[%o3+0x0c0]%asi,%l3	! %l3 = 0000000000000034
!	Mem[0000000030101400] = ffe30000, %l2 = 00000000000067e1
	ldswa	[%i4+%g0]0x89,%l2	! %l2 = ffffffffffe30000
!	Mem[0000000010001410] = 01c38c4cceffffff, %f0  = dc8bdb65 7fffffff
	ldd	[%i0+%o5],%f0 		! %f0  = 01c38c4c ceffffff
!	Starting 10 instruction Store Burst
!	Mem[0000000020800001] = 99ffd48e, %l1 = 0000000000000000
	ldstuba	[%o1+0x001]%asi,%l1	! %l1 = 000000ff000000ff

p0_label_74:
!	Mem[00000000201c0000] = 0dffd27d, %l6 = fffffffffffff504
	ldstuba	[%o0+0x000]%asi,%l6	! %l6 = 0000000d000000ff
!	%l6 = 0000000d, %l7 = 0000ff01, Mem[0000000030181400] = 00000037 5c747df1
	stda	%l6,[%i6+%g0]0x89	! Mem[0000000030181400] = 0000000d 0000ff01
!	%l7 = 000000000000ff01, Mem[0000000010081400] = b0b205b2
	stba	%l7,[%i2+%g0]0x88	! Mem[0000000010081400] = b0b20501
!	%l5 = 00000000000000e6, Mem[0000000030041400] = 0000000000000000
	stxa	%l5,[%i1+%g0]0x89	! Mem[0000000030041400] = 00000000000000e6
!	Mem[0000000010041400] = bcffffff, %l2 = ffffffffffe30000
	ldstuba	[%i1+%g0]0x88,%l2	! %l2 = 000000ff000000ff
!	Mem[0000000010141410] = ceffffff, %l0 = 0000000001000000
	ldstuba	[%i5+%o5]0x88,%l0	! %l0 = 000000ff000000ff
!	%f18 = 581219fb 12ffff58, Mem[0000000010181420] = a226b52a ff000000
	std	%f18,[%i6+0x020]	! Mem[0000000010181420] = 581219fb 12ffff58
!	%f11 = 06e3359c, Mem[0000000010181434] = 099a41a6
	st	%f11,[%i6+0x034]	! Mem[0000000010181434] = 06e3359c
!	Mem[0000000010101400] = 00000001, %l3 = 0000000000000034
	swapa	[%i4+%g0]0x88,%l3	! %l3 = 0000000000000001
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (15)
!	Mem[0000000010101400] = 34000000 00000000 e6689720 00000000
!	Mem[0000000010101410] = ffffff0d fe453ffd dedca988 fffffff8
!	Mem[0000000010101420] = 5c7004f8 d5319f1e d14f1c24 e28fa055
!	Mem[0000000010101430] = 098556d2 014b43ca 8065adb4 564ce1f4
	ldda	[%i4]ASI_BLK_AIUPL,%f16	! Block Load from 0000000010101400

p0_label_75:
!	Mem[0000000030181408] = dc8bdb65, %l6 = 000000000000000d
	lduwa	[%i6+%o4]0x81,%l6	! %l6 = 00000000dc8bdb65
!	Mem[0000000010181410] = 000000004c8cc301, %f8  = ffffffff ffffff0d
	ldda	[%i6+%o5]0x80,%f8 	! %f8  = 00000000 4c8cc301
!	Mem[00000000211c0000] = ff012346, %l2 = 00000000000000ff
	ldsba	[%o2+0x001]%asi,%l2	! %l2 = 0000000000000001
!	Mem[00000000100c1410] = 014b43ca4c8cc301, %l7 = 000000000000ff01
	ldxa	[%i3+%o5]0x80,%l7	! %l7 = 014b43ca4c8cc301
!	Mem[0000000010101410] = fd3f45fe0dffffff, %l1 = 00000000000000ff
	ldxa	[%i4+%o5]0x88,%l1	! %l1 = fd3f45fe0dffffff
!	Mem[0000000030041400] = e6000000, %f10 = 67e15ba0
	lda	[%i1+%g0]0x81,%f10	! %f10 = e6000000
!	Mem[00000000100c1408] = 00000000, %l3 = 0000000000000001
	lduha	[%i3+%o4]0x80,%l3	! %l3 = 0000000000000000
!	Mem[00000000100c1400] = ee3bf804, %l1 = fd3f45fe0dffffff
	ldsha	[%i3+%g0]0x80,%l1	! %l1 = ffffffffffffee3b
!	Mem[000000001010140c] = 00000000, %l0 = 00000000000000ff
	lduha	[%i4+0x00c]%asi,%l0	! %l0 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030001400] = 00000000, %l7 = 014b43ca4c8cc301
	ldstuba	[%i0+%g0]0x89,%l7	! %l7 = 00000000000000ff

p0_label_76:
!	%l0 = 00000000, %l1 = ffffee3b, Mem[0000000010001410] = 01c38c4c ceffffff
	stda	%l0,[%i0+%o5]0x80	! Mem[0000000010001410] = 00000000 ffffee3b
!	%l7 = 0000000000000000, Mem[0000000030041410] = ff0004f8
	stba	%l7,[%i1+%o5]0x81	! Mem[0000000030041410] = 000004f8
!	Mem[0000000030141400] = 7000bb10, %l3 = 0000000000000000
	ldstuba	[%i5+%g0]0x81,%l3	! %l3 = 00000070000000ff
!	Mem[0000000010141410] = ceffffff, %l5 = 00000000000000e6
	ldstuba	[%i5+%o5]0x88,%l5	! %l5 = 000000ff000000ff
!	Mem[0000000030181408] = 65db8bdc, %l5 = 00000000000000ff
	swapa	[%i6+%o4]0x89,%l5	! %l5 = 0000000065db8bdc
!	%l6 = 00000000dc8bdb65, Mem[0000000010001400] = 7fffffff
	stba	%l6,[%i0+%g0]0x88	! Mem[0000000010001400] = 7fffff65
!	%f14 = 00000069 8b472800, Mem[0000000010141438] = c0e9c437 24eb33d0
	stda	%f14,[%i5+0x038]%asi	! Mem[0000000010141438] = 00000069 8b472800
!	Mem[00000000100c140f] = 00000001, %l7 = 0000000000000000
	ldstub	[%i3+0x00f],%l7		! %l7 = 00000001000000ff
!	%l2 = 0000000000000001, Mem[00000000300c1408] = ffffffff
	stwa	%l2,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00000001
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = 00000001, %l1 = ffffffffffffee3b
	ldsha	[%i5+%g0]0x88,%l1	! %l1 = 0000000000000001

p0_label_77:
!	Mem[0000000030001408] = 00000001, %l3 = 0000000000000070
	lduha	[%i0+%o4]0x89,%l3	! %l3 = 0000000000000001
!	Mem[0000000030101400] = 0000e3ff0000000d, %f12 = 7fffffff 45be3a33
	ldda	[%i4+%g0]0x81,%f12	! %f12 = 0000e3ff 0000000d
!	Mem[00000000100c1410] = ca434b01, %l0 = 0000000000000000
	ldsba	[%i3+%o5]0x88,%l0	! %l0 = 0000000000000001
!	Mem[0000000010001400] = 7fffff65, %l4 = 00000000ceffffff
	lduwa	[%i0+%g0]0x88,%l4	! %l4 = 000000007fffff65
!	Mem[0000000030141410] = ff243570e28fa055, %l7 = 0000000000000001
	ldxa	[%i5+%o5]0x81,%l7	! %l7 = ff243570e28fa055
!	Mem[0000000010141400] = 01000000 00000000, %l4 = 7fffff65, %l5 = 65db8bdc
	ldda	[%i5+0x000]%asi,%l4	! %l4 = 0000000001000000 0000000000000000
!	Mem[0000000010181408] = 14ff9fe8, %l2 = 0000000000000001
	lduha	[%i6+%o4]0x80,%l2	! %l2 = 00000000000014ff
!	Mem[0000000010101400] = 00000034, %l6 = 00000000dc8bdb65
	ldswa	[%i4+%g0]0x88,%l6	! %l6 = 0000000000000034
!	Mem[0000000010101400] = 34000000, %l1 = 0000000000000001
	lduha	[%i4+%g0]0x80,%l1	! %l1 = 0000000000003400
!	Starting 10 instruction Store Burst
!	%f4  = ffffffce 4c8cc301, %l2 = 00000000000014ff
!	Mem[0000000030181428] = 00b3a88902a8aa22
	add	%i6,0x028,%g1
	stda	%f4,[%g1+%l2]ASI_PST16_SL ! Mem[0000000030181428] = 01c38c4cceffffff

p0_label_78:
!	Mem[0000000010001408] = 69fb9d57, %l5 = 0000000000000000
	swapa	[%i0+%o4]0x88,%l5	! %l5 = 0000000069fb9d57
!	Mem[0000000010141408] = 00000100, %l0 = 0000000000000001
	ldstuba	[%i5+%o4]0x88,%l0	! %l0 = 00000000000000ff
!	%l4 = 0000000001000000, Mem[0000000010141400] = 01000000
	stha	%l4,[%i5+%g0]0x80	! Mem[0000000010141400] = 00000000
!	%f6  = 014b43ca 4bc1655b, %l6 = 0000000000000034
!	Mem[00000000300c1410] = ffffffce4c8cc301
	add	%i3,0x010,%g1
	stda	%f6,[%g1+%l6]ASI_PST8_SL ! Mem[00000000300c1410] = ffffc1ceca43c301
!	%l0 = 0000000000000000, Mem[0000000010081410] = ffffffce
	stba	%l0,[%i2+%o5]0x80	! Mem[0000000010081410] = 00ffffce
!	Mem[0000000030181408] = 000000ff, %l3 = 0000000000000001
	swapa	[%i6+%o4]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010041418] = 581219fb, %l5 = 0000000069fb9d57, %asi = 80
	swapa	[%i1+0x018]%asi,%l5	! %l5 = 00000000581219fb
!	Mem[0000000010041410] = ff7c9ff6, %l0 = 0000000000000000
	swapa	[%i1+%o5]0x80,%l0	! %l0 = 00000000ff7c9ff6
!	Mem[0000000030141408] = 0000008b, %l5 = 00000000581219fb
	ldstuba	[%i5+%o4]0x89,%l5	! %l5 = 0000008b000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = 00000000 209768e6, %l2 = 000014ff, %l3 = 000000ff
	ldda	[%i4+%o4]0x88,%l2	! %l2 = 00000000209768e6 0000000000000000

p0_label_79:
!	Mem[0000000010041408] = 00000000, %f17 = 00000034
	lda	[%i1+%o4]0x88,%f17	! %f17 = 00000000
!	Mem[0000000030181410] = 099a41a6, %l7 = ff243570e28fa055
	ldstuba	[%i6+%o5]0x89,%l7	! %l7 = 000000a6000000ff
!	Mem[0000000010001428] = 581219fba05be167, %f10 = e6000000 06e3359c
	ldd	[%i0+0x028],%f10	! %f10 = 581219fb a05be167
!	Mem[0000000030101410] = e8000000, %l6 = 0000000000000034
	lduwa	[%i4+%o5]0x89,%l6	! %l6 = 00000000e8000000
!	Mem[0000000030181400] = 0d00000001ff0000, %f4  = ffffffce 4c8cc301
	ldda	[%i6+%g0]0x81,%f4 	! %f4  = 0d000000 01ff0000
!	%l5 = 000000000000008b, %l0 = 00000000ff7c9ff6, %y  = ffffffff
	umul	%l5,%l0,%l1		! %l1 = 0000008ab8aada92, %y = 0000008a
!	Mem[00000000201c0000] = ffffd27d, %l6 = 00000000e8000000
	lduba	[%o0+0x000]%asi,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010081400] = 0105b2b0, %l7 = 00000000000000a6
	lduba	[%i2+%g0]0x80,%l7	! %l7 = 0000000000000001
!	Mem[0000000010001418] = 333abe45, %l1 = 0000008ab8aada92
	ldub	[%i0+0x018],%l1		! %l1 = 0000000000000033
!	Starting 10 instruction Store Burst
!	%l2 = 00000000209768e6, Mem[00000000100c1410] = 014b43ca4c8cc301
	stxa	%l2,[%i3+%o5]0x80	! Mem[00000000100c1410] = 00000000209768e6

p0_label_80:
!	%l5 = 000000000000008b, imm = fffffffffffffbba, %l2 = 00000000209768e6
	xnor	%l5,-0x446,%l2		! %l2 = 00000000000004ce
!	%l2 = 00000000000004ce, Mem[00000000211c0000] = ff012346
	sth	%l2,[%o2+%g0]		! Mem[00000000211c0000] = 04ce2346
!	Mem[00000000211c0000] = 04ce2346, %l3 = 0000000000000000
	ldstub	[%o2+%g0],%l3		! %l3 = 00000004000000ff
!	%l5 = 000000000000008b, Mem[0000000010181400] = 00000000
	stwa	%l5,[%i6+%g0]0x80	! Mem[0000000010181400] = 0000008b
!	%l0 = 00000000ff7c9ff6, Mem[0000000030181410] = ee3bf804099a41ff
	stxa	%l0,[%i6+%o5]0x89	! Mem[0000000030181410] = 00000000ff7c9ff6
!	%f24 = 1e9f31d5 f804705c, %l4 = 0000000001000000
!	Mem[0000000030181430] = 7566dc8a981f2e79
	add	%i6,0x030,%g1
	stda	%f24,[%g1+%l4]ASI_PST32_S ! Mem[0000000030181430] = 7566dc8a981f2e79
!	%l4 = 0000000001000000, Mem[0000000030081410] = 00000067df9f46d0
	stxa	%l4,[%i2+%o5]0x81	! Mem[0000000030081410] = 0000000001000000
!	%l2 = 00000000000004ce, Mem[0000000010141400] = 00000000
	stha	%l2,[%i5+%g0]0x80	! Mem[0000000010141400] = 04ce0000
!	%l0 = 00000000ff7c9ff6, Mem[0000000010041400] = ffffffbc00000067, %asi = 80
	stxa	%l0,[%i1+0x000]%asi	! Mem[0000000010041400] = 00000000ff7c9ff6
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = 000004f8, %l7 = 0000000000000001
	lduba	[%i1+%o5]0x81,%l7	! %l7 = 0000000000000000

p0_label_81:
!	Mem[0000000010181400] = 0dff00008b000000, %f0  = 01c38c4c ceffffff
	ldda	[%i6+%g0]0x88,%f0 	! %f0  = 0dff0000 8b000000
!	Mem[0000000010041410] = baffffff 00000000, %l0 = ff7c9ff6, %l1 = 00000033
	ldda	[%i1+%o5]0x88,%l0	! %l0 = 0000000000000000 00000000baffffff
!	Mem[0000000030001400] = ff000000000000ff, %l3 = 0000000000000004
	ldxa	[%i0+%g0]0x89,%l3	! %l3 = ff000000000000ff
!	Mem[0000000030101410] = 000000e8, %l1 = 00000000baffffff
	ldsha	[%i4+%o5]0x81,%l1	! %l1 = 0000000000000000
!	Mem[00000000100c1400] = ee3bf804, %l2 = 00000000000004ce
	ldswa	[%i3+%g0]0x80,%l2	! %l2 = ffffffffee3bf804
!	Mem[0000000030181408] = 010000007fffffff, %l0 = 0000000000000000
	ldxa	[%i6+%o4]0x81,%l0	! %l0 = 010000007fffffff
!	Mem[0000000010001408] = 000000002f8b875d, %l3 = ff000000000000ff
	ldxa	[%i0+%o4]0x80,%l3	! %l3 = 000000002f8b875d
!	Mem[0000000030081400] = ffffffbc, %l5 = 000000000000008b
	lduba	[%i2+%g0]0x89,%l5	! %l5 = 00000000000000bc
!	Mem[00000000100c140c] = 000000ff, %l1 = 0000000000000000
	ldub	[%i3+0x00c],%l1		! %l1 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l2 = ffffffffee3bf804, Mem[0000000030101408] = 09000000
	stba	%l2,[%i4+%o4]0x81	! Mem[0000000030101408] = 04000000

p0_label_82:
!	%l3 = 000000002f8b875d, Mem[00000000211c0001] = ffce2346
	stb	%l3,[%o2+0x001]		! Mem[00000000211c0000] = ff5d2346
!	Mem[0000000010001438] = 0028478b, %l7 = 0000000000000000
	swap	[%i0+0x038],%l7		! %l7 = 000000000028478b
!	%f10 = 581219fb, Mem[00000000100c1428] = 579dfb69
	st	%f10,[%i3+0x028]	! Mem[00000000100c1428] = 581219fb
!	Code Fragment 3
p0_fragment_2:
!	%l0 = 010000007fffffff
	setx	0x9b02236fb41c2909,%g7,%l0 ! %l0 = 9b02236fb41c2909
!	%l1 = 0000000000000000
	setx	0x657dda2076827774,%g7,%l1 ! %l1 = 657dda2076827774
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 9b02236fb41c2909
	setx	0x2712ea400e4e7d63,%g7,%l0 ! %l0 = 2712ea400e4e7d63
!	%l1 = 657dda2076827774
	setx	0x65af56685b43fc68,%g7,%l1 ! %l1 = 65af56685b43fc68
!	%f20 = fd3f45fe 0dffffff, Mem[00000000100c1418] = d14f1fda 46109074
	std	%f20,[%i3+0x018]	! Mem[00000000100c1418] = fd3f45fe 0dffffff
!	%f4  = 0d000000, %f22 = f8ffffff, %f11 = a05be167
	fdivs	%f4 ,%f22,%f11		! %f11 = 80000000
!	Mem[0000000010181410] = 00000000, %l2 = ffffffffee3bf804
	ldstuba	[%i6+%o5]0x88,%l2	! %l2 = 00000000000000ff
	membar	#Sync			! Added by membar checker (16)
!	%l1 = 65af56685b43fc68, Mem[0000000010101400] = 34000000
	stwa	%l1,[%i4+%g0]0x80	! Mem[0000000010101400] = 5b43fc68
!	%l6 = 00000000000000ff, Mem[0000000030181408] = 00000001
	stwa	%l6,[%i6+%o4]0x89	! Mem[0000000030181408] = 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = fd3f45fe 0dffffff, %l4 = 01000000, %l5 = 000000bc
	ldda	[%i4+%o5]0x88,%l4	! %l4 = 000000000dffffff 00000000fd3f45fe

p0_label_83:
!	Mem[0000000010101410] = 0dffffff, %l1 = 65af56685b43fc68
	lduba	[%i4+%o5]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030141410] = ff243570, %l7 = 000000000028478b
	ldsha	[%i5+%o5]0x81,%l7	! %l7 = ffffffffffffff24
!	Mem[0000000010041418] = 69fb9d57, %l0 = 2712ea400e4e7d63
	lduw	[%i1+0x018],%l0		! %l0 = 0000000069fb9d57
!	Mem[0000000010001408] = 00000000, %l0 = 0000000069fb9d57
	lduwa	[%i0+%o4]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000010001400] = 7fffff65, %l6 = 00000000000000ff
	ldsha	[%i0+%g0]0x88,%l6	! %l6 = ffffffffffffff65
!	Mem[0000000030181408] = ffffff7f 000000ff, %l4 = 0dffffff, %l5 = fd3f45fe
	ldda	[%i6+%o4]0x89,%l4	! %l4 = 00000000000000ff 00000000ffffff7f
!	Mem[0000000010101408] = 209768e6, %l0 = 0000000000000000
	lduha	[%i4+%o4]0x88,%l0	! %l0 = 00000000000068e6
!	Mem[0000000030041410] = 01c38c4c f8040000, %l2 = 00000000, %l3 = 2f8b875d
	ldda	[%i1+%o5]0x89,%l2	! %l2 = 00000000f8040000 0000000001c38c4c
!	Mem[0000000030081408] = 00000069, %f27 = 241c4fd1
	lda	[%i2+%o4]0x81,%f27	! %f27 = 00000069
!	Starting 10 instruction Store Burst
!	%f18 = 00000000 209768e6, Mem[0000000010101400] = 68fc435b 00000000
	stda	%f18,[%i4+%g0]0x88	! Mem[0000000010101400] = 00000000 209768e6

p0_label_84:
!	%l2 = 00000000f8040000, Mem[0000000010181408] = e89fff14
	stwa	%l2,[%i6+%o4]0x88	! Mem[0000000010181408] = f8040000
!	%l4 = 00000000000000ff, Mem[0000000010041403] = 00000000
	stb	%l4,[%i1+0x003]		! Mem[0000000010041400] = 000000ff
!	%f16 = 00000000 00000000, %l1 = 00000000000000ff
!	Mem[0000000010001428] = 581219fba05be167
	add	%i0,0x028,%g1
	stda	%f16,[%g1+%l1]ASI_PST16_PL ! Mem[0000000010001428] = 0000000000000000
!	%f8  = 00000000 4c8cc301, %l6 = ffffffffffffff65
!	Mem[0000000010041428] = 4c8cc3010000ff00
	add	%i1,0x028,%g1
	stda	%f8,[%g1+%l6]ASI_PST16_PL ! Mem[0000000010041428] = 01c3c3010000ff00
!	%l7 = ffffffffffffff24, Mem[0000000030181410] = ff7c9ff6
	stba	%l7,[%i6+%o5]0x89	! Mem[0000000030181410] = ff7c9f24
!	Mem[0000000010141428] = 00000000, %l2 = 00000000f8040000
	swap	[%i5+0x028],%l2		! %l2 = 0000000000000000
!	%f3  = 7fffffff, Mem[0000000010001414] = ffffee3b
	st	%f3 ,[%i0+0x014]	! Mem[0000000010001414] = 7fffffff
!	%l3 = 0000000001c38c4c, Mem[0000000010141400] = 04ce0000
	stha	%l3,[%i5+%g0]0x80	! Mem[0000000010141400] = 8c4c0000
!	%l4 = 00000000000000ff, imm = 0000000000000ebc, %l6 = ffffffffffffff65
	addc	%l4,0xebc,%l6		! %l6 = 0000000000000fbb
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = 00000001, %l6 = 0000000000000fbb
	lduwa	[%i3+%o4]0x81,%l6	! %l6 = 0000000000000001

p0_label_85:
!	Mem[0000000010081408] = 45be3a33, %l1 = 00000000000000ff
	ldsha	[%i2+%o4]0x88,%l1	! %l1 = 0000000000003a33
!	Mem[0000000030001408] = 7643a2bf00000001, %f14 = 00000069 8b472800
	ldda	[%i0+%o4]0x89,%f14	! %f14 = 7643a2bf 00000001
!	%l4 = 00000000000000ff, %l4 = 00000000000000ff, %y  = 0000008a
	smul	%l4,%l4,%l5		! %l5 = 000000000000fe01, %y = 00000000
!	Mem[0000000010001408] = 00000000 2f8b875d, %l4 = 000000ff, %l5 = 0000fe01
	ldda	[%i0+%o4]0x80,%l4	! %l4 = 0000000000000000 000000002f8b875d
!	Mem[0000000030001410] = fff8ffff37000000, %f18 = 00000000 209768e6
	ldda	[%i0+%o5]0x89,%f18	! %f18 = fff8ffff 37000000
!	Mem[00000000300c1410] = 01c343cacec1ffff, %l2 = 0000000000000000
	ldxa	[%i3+%o5]0x89,%l2	! %l2 = 01c343cacec1ffff
!	Mem[00000000201c0000] = ffffd27d, %l4 = 0000000000000000
	ldub	[%o0+0x001],%l4		! %l4 = 00000000000000ff
!	Mem[0000000030001408] = 00000001, %l4 = 00000000000000ff
	ldsba	[%i0+%o4]0x89,%l4	! %l4 = 0000000000000001
!	Code Fragment 3
p0_fragment_3:
!	%l0 = 00000000000068e6
	setx	0x255a040008935db0,%g7,%l0 ! %l0 = 255a040008935db0
!	%l1 = 0000000000003a33
	setx	0x670f22307ed62d59,%g7,%l1 ! %l1 = 670f22307ed62d59
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 255a040008935db0
	setx	0x6f9ec85057872a1d,%g7,%l0 ! %l0 = 6f9ec85057872a1d
!	%l1 = 670f22307ed62d59
	setx	0xa37e2017cb63c269,%g7,%l1 ! %l1 = a37e2017cb63c269
!	Starting 10 instruction Store Burst
!	%l0 = 6f9ec85057872a1d, %l5 = 000000002f8b875d, %l3 = 0000000001c38c4c
	addc	%l0,%l5,%l3		! %l3 = 6f9ec8508712b17a

p0_label_86:
!	Mem[0000000010001408] = 00000000, %l3 = 6f9ec8508712b17a
	ldstuba	[%i0+%o4]0x80,%l3	! %l3 = 00000000000000ff
!	%l7 = ffffffffffffff24, Mem[000000001008143e] = 06e3359c
	stb	%l7,[%i2+0x03e]		! Mem[000000001008143c] = 06e3249c
!	%l6 = 0000000000000001, Mem[0000000010041408] = 0000000069000000
	stxa	%l6,[%i1+%o4]0x80	! Mem[0000000010041408] = 0000000000000001
!	Mem[0000000010001428] = 00000000, %l0 = 6f9ec85057872a1d, %asi = 80
	swapa	[%i0+0x028]%asi,%l0	! %l0 = 0000000000000000
!	Mem[00000000100c1408] = 00000000, %l6 = 0000000000000001
	ldstuba	[%i3+%o4]0x88,%l6	! %l6 = 00000000000000ff
!	%l0 = 0000000000000000, Mem[0000000010081400] = b0b20501
	stwa	%l0,[%i2+%g0]0x88	! Mem[0000000010081400] = 00000000
!	%l3 = 0000000000000000, Mem[0000000030041410] = f8040000
	stwa	%l3,[%i1+%o5]0x89	! Mem[0000000030041410] = 00000000
!	%l5 = 000000002f8b875d, Mem[0000000010041408] = 00000000
	stwa	%l5,[%i1+%o4]0x88	! Mem[0000000010041408] = 2f8b875d
!	%f4  = 0d000000, Mem[0000000030101410] = e8000000
	sta	%f4 ,[%i4+%o5]0x89	! Mem[0000000030101410] = 0d000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = fd3f45fe 0dffffff, %l6 = 00000000, %l7 = ffffff24
	ldda	[%i4+%o5]0x88,%l6	! %l6 = 000000000dffffff 00000000fd3f45fe

p0_label_87:
!	Mem[0000000010181410] = ff000000 4c8cc301, %l6 = 0dffffff, %l7 = fd3f45fe
	ldda	[%i6+0x010]%asi,%l6	! %l6 = 00000000ff000000 000000004c8cc301
!	Mem[000000001008140c] = 14ff9fe8, %l2 = 01c343cacec1ffff
	lduwa	[%i2+0x00c]%asi,%l2	! %l2 = 0000000014ff9fe8
!	Mem[0000000010001408] = 000000ff, %l1 = a37e2017cb63c269
	ldsba	[%i0+%o4]0x88,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010001408] = 000000ff, %l0 = 0000000000000000
	lduha	[%i0+%o4]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[0000000021800000] = 0bffd806, %l0 = 00000000000000ff
	lduh	[%o3+%g0],%l0		! %l0 = 0000000000000bff
!	Mem[0000000010001428] = 57872a1d, %l5 = 000000002f8b875d
	ldsha	[%i0+0x028]%asi,%l5	! %l5 = 0000000000005787
!	Mem[00000000300c1410] = ffffc1ce, %l0 = 0000000000000bff
	lduha	[%i3+%o5]0x81,%l0	! %l0 = 000000000000ffff
!	Mem[0000000010141410] = ceffffff, %l3 = 0000000000000000
	lduwa	[%i5+%o5]0x88,%l3	! %l3 = 00000000ceffffff
!	Mem[0000000010001400] = 65ffff7f, %l7 = 000000004c8cc301
	ldsha	[%i0+%g0]0x80,%l7	! %l7 = 00000000000065ff
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1400] = ee3bf804, %l0 = 000000000000ffff
	ldstuba	[%i3+%g0]0x80,%l0	! %l0 = 000000ee000000ff

p0_label_88:
!	%l4 = 00000001, %l5 = 00005787, Mem[0000000030141400] = ff00bb10 06b9895f
	stda	%l4,[%i5+%g0]0x81	! Mem[0000000030141400] = 00000001 00005787
!	%l4 = 00000001, %l5 = 00005787, Mem[0000000010141410] = ffffffce 45060000
	stda	%l4,[%i5+0x010]%asi	! Mem[0000000010141410] = 00000001 00005787
!	%l4 = 00000001, %l5 = 00005787, Mem[0000000010181410] = ff000000 4c8cc301
	stda	%l4,[%i6+%o5]0x80	! Mem[0000000010181410] = 00000001 00005787
!	%l3 = 00000000ceffffff, Mem[0000000010001410] = 000000007fffffff
	stxa	%l3,[%i0+%o5]0x80	! Mem[0000000010001410] = 00000000ceffffff
!	Mem[00000000300c1400] = dc8bdb65, %l3 = 00000000ceffffff
	ldstuba	[%i3+%g0]0x81,%l3	! %l3 = 000000dc000000ff
!	%f13 = 0000000d, Mem[0000000010101400] = e6689720
	sta	%f13,[%i4+%g0]0x80	! Mem[0000000010101400] = 0000000d
!	%l7 = 00000000000065ff, Mem[0000000030041400] = e6000000
	stba	%l7,[%i1+%g0]0x81	! Mem[0000000030041400] = ff000000
!	%f0  = 0dff0000 8b000000, Mem[0000000010041408] = 5d878b2f 00000001
	std	%f0 ,[%i1+%o4]	! Mem[0000000010041408] = 0dff0000 8b000000
!	Mem[0000000010041413] = 00000000, %l6 = 00000000ff000000
	ldstuba	[%i1+0x013]%asi,%l6	! %l6 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000021800100] = a830d196, %l3 = 00000000000000dc
	lduha	[%o3+0x100]%asi,%l3	! %l3 = 000000000000a830

p0_label_89:
!	Mem[0000000030001408] = 00000001, %l4 = 0000000000000001
	ldswa	[%i0+%o4]0x89,%l4	! %l4 = 0000000000000001
!	%l2 = 0000000014ff9fe8, %l5 = 0000000000005787, %l3 = 000000000000a830
	sdivx	%l2,%l5,%l3		! %l3 = 0000000000003d6a
!	Mem[00000000100c142c] = 2f8b875d, %l1 = ffffffffffffffff
	lduwa	[%i3+0x02c]%asi,%l1	! %l1 = 000000002f8b875d
!	Mem[0000000010181414] = 00005787, %l0 = 00000000000000ee
	lduh	[%i6+0x014],%l0		! %l0 = 0000000000000000
!	Mem[00000000300c1410] = ffffc1ce, %l3 = 0000000000003d6a
	lduwa	[%i3+%o5]0x81,%l3	! %l3 = 00000000ffffc1ce
	membar	#Sync			! Added by membar checker (17)
!	Mem[0000000030101400] = 0000e3ff 0000000d 04000000 d14f1fda
!	Mem[0000000030101410] = 0000000d fe453ffd 4a6d6276 77cebcc5
!	Mem[0000000030101420] = a226b52a 6bcc8e3c 5ddf2b10 fe453ffd
!	Mem[0000000030101430] = ee26f82a 09cc8e3c fe120093 73a028f7
	ldda	[%i4]ASI_BLK_S,%f16	! Block Load from 0000000030101400
!	Mem[0000000010101404] = 00000000, %l4 = 0000000000000001
	lduw	[%i4+0x004],%l4		! %l4 = 0000000000000000
!	Mem[00000000300c1408] = 01000000, %l1 = 000000002f8b875d
	lduha	[%i3+%o4]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000010181408] = 000004f8, %l6 = 0000000000000000
	ldsha	[%i6+%o4]0x80,%l6	! %l6 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l0 = 0000000000000000, Mem[000000001014142e] = a239d7c0, %asi = 80
	stha	%l0,[%i5+0x02e]%asi	! Mem[000000001014142c] = a2390000

p0_label_90:
!	%f12 = 0000e3ff 0000000d, Mem[0000000030041410] = 00000000 4c8cc301
	stda	%f12,[%i1+%o5]0x81	! Mem[0000000030041410] = 0000e3ff 0000000d
!	Mem[0000000010041438] = bca1ff70ba013aff, %l6 = 0000000000000000, %l7 = 00000000000065ff
	add	%i1,0x38,%g1
	casxa	[%g1]0x80,%l6,%l7	! %l7 = bca1ff70ba013aff
!	%l6 = 0000000000000000, Mem[0000000010141410] = 00000001
	stha	%l6,[%i5+%o5]0x80	! Mem[0000000010141410] = 00000001
!	%l2 = 14ff9fe8, %l3 = ffffc1ce, Mem[0000000010041408] = 0dff0000 8b000000
	std	%l2,[%i1+%o4]		! Mem[0000000010041408] = 14ff9fe8 ffffc1ce
!	%l2 = 0000000014ff9fe8, Mem[0000000021800101] = a830d196, %asi = 80
	stba	%l2,[%o3+0x101]%asi	! Mem[0000000021800100] = a8e8d196
!	%l0 = 00000000, %l1 = 00000000, Mem[0000000010001428] = 57872a1d 00000000
	stda	%l0,[%i0+0x028]%asi	! Mem[0000000010001428] = 00000000 00000000
!	%f10 = 581219fb 80000000, %l6 = 0000000000000000
!	Mem[0000000030141428] = e120791021091a31
	add	%i5,0x028,%g1
	stda	%f10,[%g1+%l6]ASI_PST32_SL ! Mem[0000000030141428] = e120791021091a31
!	%f11 = 80000000, Mem[0000000030141400] = 00000001
	sta	%f11,[%i5+%g0]0x81	! Mem[0000000030141400] = 80000000
!	%f7  = 4bc1655b, Mem[0000000010181420] = 581219fb
	st	%f7 ,[%i6+0x020]	! Mem[0000000010181420] = 4bc1655b
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = ff000000, %l0 = 0000000000000000
	lduwa	[%i0+%o4]0x80,%l0	! %l0 = 00000000ff000000

p0_label_91:
!	Mem[0000000010001408] = 000000ff, %l0 = 00000000ff000000
	ldsha	[%i0+%o4]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[0000000021800180] = ffe3dde9, %l0 = 00000000000000ff
	lduh	[%o3+0x180],%l0		! %l0 = 000000000000ffe3
!	Mem[00000000201c0000] = ffffd27d, %l0 = 000000000000ffe3
	lduha	[%o0+0x000]%asi,%l0	! %l0 = 000000000000ffff
!	Mem[0000000010041400] = 000000ff, %l4 = 0000000000000000
	lduw	[%i1+%g0],%l4		! %l4 = 00000000000000ff
!	Mem[0000000010081408] = 333abe45, %l1 = 0000000000000000
	lduwa	[%i2+%o4]0x80,%l1	! %l1 = 00000000333abe45
!	Mem[0000000010141430] = 524b7e2e 06e3359c, %l4 = 000000ff, %l5 = 00005787
	ldd	[%i5+0x030],%l4		! %l4 = 00000000524b7e2e 0000000006e3359c
!	Mem[0000000010001410] = 00000000, %f14 = 7643a2bf
	ld	[%i0+%o5],%f14	! %f14 = 00000000
!	Mem[0000000010101400] = 0000000d, %l6 = 0000000000000000
	lduwa	[%i4+%g0]0x80,%l6	! %l6 = 000000000000000d
!	Mem[0000000010181400] = 8b000000, %l2 = 0000000014ff9fe8
	lduwa	[%i6+%g0]0x88,%l2	! %l2 = 000000008b000000
!	Starting 10 instruction Store Burst
!	%f4  = 0d000000 01ff0000, %l7 = bca1ff70ba013aff
!	Mem[0000000030001408] = 01000000bfa24376
	add	%i0,0x008,%g1
	stda	%f4,[%g1+%l7]ASI_PST16_S ! Mem[0000000030001408] = 0d00000001ff0000

p0_label_92:
!	%l3 = 00000000ffffc1ce, Mem[00000000100c1420] = 000000698b472800
	stx	%l3,[%i3+0x020]		! Mem[00000000100c1420] = 00000000ffffc1ce
!	%f2  = 67e15ba0 7fffffff, %l5 = 0000000006e3359c
!	Mem[0000000030001418] = 5ea1092394bf88ab
	add	%i0,0x018,%g1
	stda	%f2,[%g1+%l5]ASI_PST16_S ! Mem[0000000030001418] = 67e15ba094bf88ab
!	%f0  = 0dff0000 8b000000 67e15ba0 7fffffff
!	%f4  = 0d000000 01ff0000 014b43ca 4bc1655b
!	%f8  = 00000000 4c8cc301 581219fb 80000000
!	%f12 = 0000e3ff 0000000d 00000000 00000001
	stda	%f0,[%i5]ASI_BLK_S	! Block Store to 0000000030141400
!	%f19 = d14f1fda, Mem[0000000030001400] = 000000ff
	sta	%f19,[%i0+%g0]0x89	! Mem[0000000030001400] = d14f1fda
!	%f28 = ee26f82a, Mem[0000000030001400] = d14f1fda
	sta	%f28,[%i0+%g0]0x89	! Mem[0000000030001400] = ee26f82a
!	%l4 = 524b7e2e, %l5 = 06e3359c, Mem[0000000010041408] = e89fff14 cec1ffff
	stda	%l4,[%i1+%o4]0x88	! Mem[0000000010041408] = 524b7e2e 06e3359c
!	%l7 = bca1ff70ba013aff, Mem[0000000010041410] = ff000000
	stha	%l7,[%i1+%o5]0x88	! Mem[0000000010041410] = ff003aff
!	%l4 = 524b7e2e, %l5 = 06e3359c, Mem[0000000030181408] = ff000000 7fffffff
	stda	%l4,[%i6+%o4]0x81	! Mem[0000000030181408] = 524b7e2e 06e3359c
!	%f28 = ee26f82a 09cc8e3c, %l6 = 000000000000000d
!	Mem[0000000010001408] = ff0000002f8b875d
	add	%i0,0x008,%g1
	stda	%f28,[%g1+%l6]ASI_PST32_PL ! Mem[0000000010001408] = 3c8ecc092f8b875d
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = ffffff0d, %l6 = 000000000000000d
	ldswa	[%i4+%o5]0x80,%l6	! %l6 = ffffffffffffff0d

p0_label_93:
	membar	#Sync			! Added by membar checker (18)
!	Mem[0000000030041400] = ff000000 00000000 58ffff12 fb191258
!	Mem[0000000030041410] = 0000e3ff 0000000d d14f1fda 46109074
!	Mem[0000000030041420] = 901acbd0 73a3db94 579dfb69 2f8b875d
!	Mem[0000000030041430] = e89fff14 45be3a33 466c4463 e28fa055
	ldda	[%i1]ASI_BLK_AIUS,%f0	! Block Load from 0000000030041400
!	Mem[00000000300c1400] = 65db8bff, %l0 = 000000000000ffff
	ldsha	[%i3+%g0]0x89,%l0	! %l0 = ffffffffffff8bff
!	Mem[0000000030101400] = ffe30000, %l1 = 00000000333abe45
	lduba	[%i4+%g0]0x89,%l1	! %l1 = 0000000000000000
!	Mem[00000000300c1408] = 01000000, %l5 = 0000000006e3359c
	lduwa	[%i3+%o4]0x89,%l5	! %l5 = 0000000001000000
!	Mem[0000000030141410] = 0000000d, %l0 = ffffffffffff8bff
	lduha	[%i5+%o5]0x89,%l0	! %l0 = 000000000000000d
!	Mem[0000000021800140] = 00ff6ae1, %l7 = bca1ff70ba013aff
	ldub	[%o3+0x141],%l7		! %l7 = 00000000000000ff
!	%l4 = 00000000524b7e2e, %l0 = 000000000000000d, %l7 = 00000000000000ff
	add	%l4,%l0,%l7		! %l7 = 00000000524b7e3b
!	%l1 = 0000000000000000, %l0 = 000000000000000d, %l7 = 00000000524b7e3b
	orn	%l1,%l0,%l7		! %l7 = fffffffffffffff2
!	Mem[0000000030041408] = 58ffff12, %l1 = 0000000000000000
	lduba	[%i1+%o4]0x81,%l1	! %l1 = 0000000000000058
!	Starting 10 instruction Store Burst
!	%l7 = fffffffffffffff2, Mem[0000000030001408] = 0d000000
	stha	%l7,[%i0+%o4]0x81	! Mem[0000000030001408] = fff20000

p0_label_94:
!	%f0  = ff000000 00000000 58ffff12 fb191258
!	%f4  = 0000e3ff 0000000d d14f1fda 46109074
!	%f8  = 901acbd0 73a3db94 579dfb69 2f8b875d
!	%f12 = e89fff14 45be3a33 466c4463 e28fa055
	stda	%f0,[%i3]ASI_BLK_AIUP	! Block Store to 00000000100c1400
!	%f26 = 5ddf2b10, Mem[0000000010141408] = 000001ff
	sta	%f26,[%i5+%o4]0x88	! Mem[0000000010141408] = 5ddf2b10
!	%l7 = fffffffffffffff2, Mem[0000000030001410] = 00000037
	stba	%l7,[%i0+%o5]0x81	! Mem[0000000030001410] = f2000037
!	%l6 = ffffffffffffff0d, Mem[0000000030101400] = ffe30000
	stha	%l6,[%i4+%g0]0x89	! Mem[0000000030101400] = ffe3ff0d
!	%l2 = 8b000000, %l3 = ffffc1ce, Mem[0000000010081410] = ceffff00 01c38c4c
	stda	%l2,[%i2+%o5]0x88	! Mem[0000000010081410] = 8b000000 ffffc1ce
!	%l3 = 00000000ffffc1ce, Mem[0000000010081400] = 00000000
	stba	%l3,[%i2+%g0]0x80	! Mem[0000000010081400] = ce000000
!	%l3 = 00000000ffffc1ce, Mem[0000000010101410] = fd3f45fe0dffffff
	stxa	%l3,[%i4+%o5]0x88	! Mem[0000000010101410] = 00000000ffffc1ce
!	%l3 = 00000000ffffc1ce, Mem[0000000030081400] = ffffffbc
	stba	%l3,[%i2+%g0]0x89	! Mem[0000000030081400] = ffffffce
!	%l0 = 0000000d, %l1 = 00000058, Mem[0000000010041400] = ff000000 f69f7cff
	stda	%l0,[%i1+%g0]0x88	! Mem[0000000010041400] = 0000000d 00000058
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = 102bdf5d, %l6 = ffffffffffffff0d
	ldsha	[%i5+%o4]0x80,%l6	! %l6 = 000000000000102b

p0_label_95:
!	Mem[0000000030001410] = f2000037, %l3 = 00000000ffffc1ce
	ldswa	[%i0+%o5]0x81,%l3	! %l3 = fffffffff2000037
!	Mem[00000000300c1408] = 01000000, %l1 = 0000000000000058
	lduha	[%i3+%o4]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000010081408] = 333abe45, %l0 = 000000000000000d
	ldswa	[%i2+%o4]0x80,%l0	! %l0 = 00000000333abe45
!	Mem[0000000010141400] = 8c4c0000, %l3 = fffffffff2000037
	ldsba	[%i5+0x001]%asi,%l3	! %l3 = 000000000000004c
!	Mem[0000000010141410] = 00000001, %l7 = fffffffffffffff2
	ldsb	[%i5+0x012],%l7		! %l7 = 0000000000000000
!	Mem[0000000030041410] = ffe30000, %l3 = 000000000000004c
	lduha	[%i1+%o5]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000030041408] = 12ffff58, %l6 = 000000000000102b
	lduba	[%i1+%o4]0x89,%l6	! %l6 = 0000000000000058
!	Mem[0000000010181400] = 0000008b, %l2 = 000000008b000000
	ldsb	[%i6+%g0],%l2		! %l2 = 0000000000000000
!	Mem[0000000030101410] = 0000000dfe453ffd, %l5 = 0000000001000000
	ldxa	[%i4+%o5]0x81,%l5	! %l5 = 0000000dfe453ffd
!	Starting 10 instruction Store Burst
!	Mem[0000000010041408] = 2e7e4b52, %l6 = 0000000000000058
	swapa	[%i1+%o4]0x80,%l6	! %l6 = 000000002e7e4b52

p0_label_96:
!	%l3 = 0000000000000000, Mem[0000000010181438] = fe12009373a028f7
	stx	%l3,[%i6+0x038]		! Mem[0000000010181438] = 0000000000000000
	membar	#Sync			! Added by membar checker (19)
!	Mem[00000000100c1424] = 73a3db94, %l6 = 2e7e4b52, %l6 = 2e7e4b52
	add	%i3,0x24,%g1
	casa	[%g1]0x80,%l6,%l6	! %l6 = 0000000073a3db94
!	%l7 = 0000000000000000, Mem[00000000100c141c] = 46109074
	stb	%l7,[%i3+0x01c]		! Mem[00000000100c141c] = 00109074
!	%l7 = 0000000000000000, Mem[0000000010041400] = 000000580000000d
	stxa	%l7,[%i1+%g0]0x88	! Mem[0000000010041400] = 0000000000000000
!	Mem[00000000300c1400] = ff8bdb65, %l6 = 0000000073a3db94
	ldstuba	[%i3+%g0]0x81,%l6	! %l6 = 000000ff000000ff
!	Mem[0000000030181400] = 0d000000, %l1 = 0000000000000000
	ldstuba	[%i6+%g0]0x81,%l1	! %l1 = 0000000d000000ff
!	%l6 = 00000000000000ff, Mem[0000000010041430] = fb191258
	stw	%l6,[%i1+0x030]		! Mem[0000000010041430] = 000000ff
!	%l2 = 00000000, %l3 = 00000000, Mem[00000000100c1410] = 0000e3ff 0000000d
	std	%l2,[%i3+%o5]		! Mem[00000000100c1410] = 00000000 00000000
!	%l0 = 333abe45, %l1 = 0000000d, Mem[00000000100c1408] = 58ffff12 fb191258
	std	%l0,[%i3+%o4]		! Mem[00000000100c1408] = 333abe45 0000000d
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = 04000000, %l3 = 0000000000000000
	ldsha	[%i4+%o4]0x81,%l3	! %l3 = 0000000000000400

p0_label_97:
!	Mem[00000000211c0000] = ff5d2346, %l0 = 00000000333abe45
	ldsb	[%o2+%g0],%l0		! %l0 = ffffffffffffffff
!	Mem[0000000030181410] = 00000000 ff7c9f24, %l4 = 524b7e2e, %l5 = fe453ffd
	ldda	[%i6+%o5]0x89,%l4	! %l4 = 00000000ff7c9f24 0000000000000000
!	Mem[00000000300c1400] = ff8bdb65, %l5 = 0000000000000000
	lduwa	[%i3+%g0]0x81,%l5	! %l5 = 00000000ff8bdb65
!	Mem[00000000300c1400] = ff8bdb65, %l3 = 0000000000000400
	lduwa	[%i3+%g0]0x81,%l3	! %l3 = 00000000ff8bdb65
!	Mem[00000000300c1400] = 65db8bff, %l1 = 000000000000000d
	lduba	[%i3+%g0]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030101400] = ffe3ff0d, %f13 = 45be3a33
	lda	[%i4+%g0]0x89,%f13	! %f13 = ffe3ff0d
!	Code Fragment 4
p0_fragment_4:
!	%l0 = ffffffffffffffff
	setx	0xf66019784c18fbee,%g7,%l0 ! %l0 = f66019784c18fbee
!	%l1 = 00000000000000ff
	setx	0x590de6d7aae7d3e3,%g7,%l1 ! %l1 = 590de6d7aae7d3e3
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = f66019784c18fbee
	setx	0x48f72457e7d77dc5,%g7,%l0 ! %l0 = 48f72457e7d77dc5
!	%l1 = 590de6d7aae7d3e3
	setx	0xfc5c5db79972e8af,%g7,%l1 ! %l1 = fc5c5db79972e8af
!	Mem[0000000021800140] = 00ff6ae1, %l7 = 0000000000000000
	lduba	[%o3+0x141]%asi,%l7	! %l7 = 00000000000000ff
	membar	#Sync			! Added by membar checker (20)
!	Mem[00000000100c1400] = ff000000 00000000 333abe45 0000000d
!	Mem[00000000100c1410] = 00000000 00000000 d14f1fda 00109074
!	Mem[00000000100c1420] = 901acbd0 73a3db94 579dfb69 2f8b875d
!	Mem[00000000100c1430] = e89fff14 45be3a33 466c4463 e28fa055
	ldda	[%i3]ASI_BLK_P,%f16	! Block Load from 00000000100c1400
!	Starting 10 instruction Store Burst
!	Mem[0000000010141408] = 102bdf5d, %l2 = 0000000000000000
	swapa	[%i5+%o4]0x80,%l2	! %l2 = 00000000102bdf5d

p0_label_98:
!	%l3 = 00000000ff8bdb65, Mem[0000000030041410] = 0d000000ffe30000
	stxa	%l3,[%i1+%o5]0x89	! Mem[0000000030041410] = 00000000ff8bdb65
!	Mem[0000000030181410] = ff7c9f24, %l1 = fc5c5db79972e8af
	swapa	[%i6+%o5]0x89,%l1	! %l1 = 00000000ff7c9f24
!	%l7 = 00000000000000ff, Mem[0000000030081400] = ceffffff
	stwa	%l7,[%i2+%g0]0x81	! Mem[0000000030081400] = 000000ff
!	Mem[0000000010001410] = 00000000, %l2 = 00000000102bdf5d
	ldstuba	[%i0+%o5]0x88,%l2	! %l2 = 00000000000000ff
!	%l6 = 00000000000000ff, Mem[0000000030181410] = 000000009972e8af
	stxa	%l6,[%i6+%o5]0x89	! Mem[0000000030181410] = 00000000000000ff
!	%f1  = 00000000, Mem[00000000300c1408] = 00000001
	sta	%f1 ,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00000000
!	%f0  = ff000000 00000000 58ffff12 fb191258
!	%f4  = 0000e3ff 0000000d d14f1fda 46109074
!	%f8  = 901acbd0 73a3db94 579dfb69 2f8b875d
!	%f12 = e89fff14 ffe3ff0d 466c4463 e28fa055
	stda	%f0,[%i2]ASI_BLK_AIUSL	! Block Store to 0000000030081400
!	%l4 = ff7c9f24, %l5 = ff8bdb65, Mem[0000000010141410] = 01000000 87570000
	stda	%l4,[%i5+%o5]0x88	! Mem[0000000010141410] = ff7c9f24 ff8bdb65
	membar	#Sync			! Added by membar checker (21)
!	Mem[0000000010081400] = 000000ce, %l5 = 00000000ff8bdb65
	ldstuba	[%i2+%g0]0x88,%l5	! %l5 = 000000ce000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = ff5d2346, %l6 = 00000000000000ff
	lduha	[%o2+0x000]%asi,%l6	! %l6 = 000000000000ff5d

p0_label_99:
!	Mem[0000000010101400] = 0000000d, %l3 = 00000000ff8bdb65
	lduwa	[%i4+%g0]0x80,%l3	! %l3 = 000000000000000d
!	Mem[0000000010001400] = 65ffff7f 65db8bdc, %l2 = 00000000, %l3 = 0000000d
	ldda	[%i0+%g0]0x80,%l2	! %l2 = 0000000065ffff7f 0000000065db8bdc
!	%l6 = 000000000000ff5d, %l6 = 000000000000ff5d, %l3 = 0000000065db8bdc
	andn	%l6,%l6,%l3		! %l3 = 0000000000000000
!	Mem[00000000300c1410] = ffffc1ceca43c301, %l6 = 000000000000ff5d
	ldxa	[%i3+%o5]0x81,%l6	! %l6 = ffffc1ceca43c301
!	Mem[00000000100c1400] = 00000000000000ff, %f20 = 00000000 00000000
	ldda	[%i3+%g0]0x88,%f20	! %f20 = 00000000 000000ff
!	Mem[0000000010001400] = 65ffff7f, %l5 = 00000000000000ce
	lduba	[%i0+%g0]0x80,%l5	! %l5 = 0000000000000065
!	Mem[00000000100c1420] = 901acbd0, %l1 = 00000000ff7c9f24
	ldub	[%i3+0x020],%l1		! %l1 = 0000000000000090
!	Mem[0000000010101410] = 00000000ffffc1ce, %l2 = 0000000065ffff7f
	ldxa	[%i4+%o5]0x88,%l2	! %l2 = 00000000ffffc1ce
!	Mem[00000000300c1410] = ffffc1ce, %l1 = 0000000000000090
	ldswa	[%i3+%o5]0x81,%l1	! %l1 = ffffffffffffc1ce
!	Starting 10 instruction Store Burst
!	%l2 = 00000000ffffc1ce, Mem[000000001010142e] = e28fa055
	stb	%l2,[%i4+0x02e]		! Mem[000000001010142c] = e28fce55

p0_label_100:
!	Mem[0000000030041410] = 65db8bff, %l7 = 00000000000000ff
	ldstuba	[%i1+%o5]0x81,%l7	! %l7 = 00000065000000ff
!	%l1 = ffffffffffffc1ce, Mem[00000000300c1410] = cec1ffff
	stwa	%l1,[%i3+%o5]0x89	! Mem[00000000300c1410] = ffffc1ce
!	Mem[0000000010041400] = 00000000, %l0 = 48f72457e7d77dc5
	swapa	[%i1+%g0]0x88,%l0	! %l0 = 0000000000000000
!	%f0  = ff000000 00000000, %l2 = 00000000ffffc1ce
!	Mem[0000000010041420] = e89fff14ff7c9ff6
	add	%i1,0x020,%g1
	stda	%f0,[%g1+%l2]ASI_PST8_PL ! Mem[0000000010041420] = e8000000ff7c00ff
!	%l0 = 0000000000000000, imm = 000000000000099c, %l5 = 0000000000000065
	addc	%l0,0x99c,%l5		! %l5 = 000000000000099c
!	Mem[0000000010141400] = 00004c8c, %l3 = 0000000000000000
	swapa	[%i5+%g0]0x88,%l3	! %l3 = 0000000000004c8c
!	Mem[00000000100c1408] = 45be3a33, %l5 = 000000000000099c
	swapa	[%i3+%o4]0x88,%l5	! %l5 = 0000000045be3a33
!	%l4 = ff7c9f24, %l5 = 45be3a33, Mem[0000000010141438] = 00000069 8b472800
	std	%l4,[%i5+0x038]		! Mem[0000000010141438] = ff7c9f24 45be3a33
!	Mem[0000000010041424] = ff7c00ff, %l7 = 0000000000000065
	ldstub	[%i1+0x024],%l7		! %l7 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = 0000000100005787, %l7 = 00000000000000ff
	ldxa	[%i6+%o5]0x80,%l7	! %l7 = 0000000100005787

p0_label_101:
!	Mem[0000000010181408] = 000004f8, %l7 = 0000000100005787
	lduba	[%i6+%o4]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000010001400] = 65ffff7f, %l2 = 00000000ffffc1ce
	lduba	[%i0+%g0]0x80,%l2	! %l2 = 0000000000000065
!	%l0 = 0000000000000000, %l5 = 0000000045be3a33, %l7 = 0000000000000000
	sub	%l0,%l5,%l7		! %l7 = ffffffffba41c5cd
!	Mem[00000000300c1410] = cec1ffff ca43c301, %l4 = ff7c9f24, %l5 = 45be3a33
	ldda	[%i3+%o5]0x81,%l4	! %l4 = 00000000cec1ffff 00000000ca43c301
!	Mem[0000000030001400] = 2af826ee, %l1 = ffffffffffffc1ce
	lduha	[%i0+%g0]0x81,%l1	! %l1 = 0000000000002af8
!	Mem[00000000201c0000] = ffffd27d, %l4 = 00000000cec1ffff
	lduh	[%o0+%g0],%l4		! %l4 = 000000000000ffff
!	Mem[0000000030181410] = 000000ff, %l5 = 00000000ca43c301
	ldsba	[%i6+%o5]0x89,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000030181400] = ff000000, %f26 = 579dfb69
	lda	[%i6+%g0]0x81,%f26	! %f26 = ff000000
!	Mem[0000000030081408] = 581219fb 12ffff58, %l4 = 0000ffff, %l5 = ffffffff
	ldda	[%i2+%o4]0x81,%l4	! %l4 = 00000000581219fb 0000000012ffff58
!	Starting 10 instruction Store Burst
!	%f22 = d14f1fda 00109074, %l3 = 0000000000004c8c
!	Mem[0000000010001410] = ff000000ceffffff
	add	%i0,0x010,%g1
	stda	%f22,[%g1+%l3]ASI_PST16_PL ! Mem[0000000010001410] = ff000000da1f4fd1

p0_label_102:
!	%l4 = 00000000581219fb, Mem[0000000010001410] = 000000ff
	stwa	%l4,[%i0+%o5]0x88	! Mem[0000000010001410] = 581219fb
!	%f20 = 00000000 000000ff, Mem[0000000010041408] = 00000058 9c35e306
	stda	%f20,[%i1+%o4]0x80	! Mem[0000000010041408] = 00000000 000000ff
!	Mem[0000000010101400] = 0d000000, %l2 = 0000000000000065
	swapa	[%i4+%g0]0x88,%l2	! %l2 = 000000000d000000
!	%f0  = ff000000 00000000 58ffff12 fb191258
!	%f4  = 0000e3ff 0000000d d14f1fda 46109074
!	%f8  = 901acbd0 73a3db94 579dfb69 2f8b875d
!	%f12 = e89fff14 ffe3ff0d 466c4463 e28fa055
	stda	%f0,[%i0]ASI_BLK_P	! Block Store to 0000000010001400
!	%l5 = 0000000012ffff58, Mem[0000000010001400] = ff000000
	stwa	%l5,[%i0+%g0]0x80	! Mem[0000000010001400] = 12ffff58
!	%l1 = 0000000000002af8, Mem[0000000010141410] = ff7c9f24
	stba	%l1,[%i5+%o5]0x88	! Mem[0000000010141410] = ff7c9ff8
!	%f26 = ff000000 2f8b875d, %l0 = 0000000000000000
!	Mem[0000000030101420] = a226b52a6bcc8e3c
	add	%i4,0x020,%g1
	stda	%f26,[%g1+%l0]ASI_PST32_SL ! Mem[0000000030101420] = a226b52a6bcc8e3c
!	%l0 = 00000000, %l1 = 00002af8, Mem[0000000030001400] = 2af826ee 000000ff
	stda	%l0,[%i0+%g0]0x81	! Mem[0000000030001400] = 00000000 00002af8
!	%l5 = 0000000012ffff58, Mem[0000000010181408] = f8040000
	stwa	%l5,[%i6+%o4]0x88	! Mem[0000000010181408] = 12ffff58
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = ff000000, %l5 = 0000000012ffff58
	ldsba	[%i2+%g0]0x80,%l5	! %l5 = ffffffffffffffff

p0_label_103:
!	Mem[0000000030181408] = 524b7e2e 06e3359c, %l0 = 00000000, %l1 = 00002af8
	ldda	[%i6+%o4]0x81,%l0	! %l0 = 00000000524b7e2e 0000000006e3359c
!	Mem[0000000030081400] = 00000000, %l2 = 000000000d000000
	ldsba	[%i2+%g0]0x89,%l2	! %l2 = 0000000000000000
!	Mem[00000000300c1410] = cec1ffff, %l1 = 0000000006e3359c
	lduha	[%i3+%o5]0x81,%l1	! %l1 = 000000000000cec1
!	Mem[0000000010101408] = 209768e6, %l2 = 0000000000000000
	ldsha	[%i4+%o4]0x88,%l2	! %l2 = 00000000000068e6
!	Mem[0000000030081408] = 581219fb, %l1 = 000000000000cec1
	ldswa	[%i2+%o4]0x81,%l1	! %l1 = 00000000581219fb
!	Mem[0000000010081408] = 333abe45 14ff9fe8, %l6 = ca43c301, %l7 = ba41c5cd
	ldda	[%i2+%o4]0x80,%l6	! %l6 = 00000000333abe45 0000000014ff9fe8
!	Mem[0000000010081410] = 0000008b, %l6 = 00000000333abe45
	lduha	[%i2+%o5]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000010101400] = 0000000000000065, %l3 = 0000000000004c8c
	ldxa	[%i4+%g0]0x88,%l3	! %l3 = 0000000000000065
!	Mem[0000000030041408] = 12ffff58, %l5 = ffffffffffffffff
	ldsba	[%i1+%o4]0x89,%l5	! %l5 = 0000000000000058
!	Starting 10 instruction Store Burst
!	%l4 = 00000000581219fb, Mem[0000000010141408] = 00000000000000e8
	stxa	%l4,[%i5+%o4]0x80	! Mem[0000000010141408] = 00000000581219fb

p0_label_104:
!	%f0  = ff000000 00000000 58ffff12 fb191258
!	%f4  = 0000e3ff 0000000d d14f1fda 46109074
!	%f8  = 901acbd0 73a3db94 579dfb69 2f8b875d
!	%f12 = e89fff14 ffe3ff0d 466c4463 e28fa055
	stda	%f0,[%i1]ASI_BLK_AIUSL	! Block Store to 0000000030041400
!	%l2 = 000068e6, %l3 = 00000065, Mem[0000000010101410] = cec1ffff 00000000
	stda	%l2,[%i4+%o5]0x80	! Mem[0000000010101410] = 000068e6 00000065
	membar	#Sync			! Added by membar checker (22)
!	Mem[0000000010001430] = e89fff14, %l6 = 0000000000000000
	ldstuba	[%i0+0x030]%asi,%l6	! %l6 = 000000e8000000ff
!	Mem[0000000030041400] = 00000000, %l1 = 00000000581219fb
	swapa	[%i1+%g0]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000010181411] = 00000001, %l1 = 0000000000000000
	ldstub	[%i6+0x011],%l1		! %l1 = 00000000000000ff
!	Mem[0000000030181400] = ff000000, %l2 = 00000000000068e6
	swapa	[%i6+%g0]0x81,%l2	! %l2 = 00000000ff000000
!	%l5 = 0000000000000058, Mem[0000000021800100] = a8e8d196, %asi = 80
	stba	%l5,[%o3+0x100]%asi	! Mem[0000000021800100] = 58e8d196
!	%f26 = ff000000 2f8b875d, Mem[00000000100c1418] = d14f1fda 00109074
	std	%f26,[%i3+0x018]	! Mem[00000000100c1418] = ff000000 2f8b875d
!	%l4 = 00000000581219fb, Mem[0000000030181400] = e6680000
	stwa	%l4,[%i6+%g0]0x89	! Mem[0000000030181400] = 581219fb
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = 04000000, %l5 = 0000000000000058
	ldsha	[%i4+%o4]0x81,%l5	! %l5 = 0000000000000400

p0_label_105:
!	%l0 = 00000000524b7e2e, %l6 = 00000000000000e8, %y  = 00000000
	udiv	%l0,%l6,%l2		! %l2 = 00000000005acee3
	mov	%l0,%y			! %y = 524b7e2e
!	Mem[00000000211c0000] = ff5d2346, %l3 = 0000000000000065
	ldsba	[%o2+0x000]%asi,%l3	! %l3 = ffffffffffffffff
!	Mem[00000000300c1410] = cec1ffff, %l2 = 00000000005acee3
	lduba	[%i3+%o5]0x81,%l2	! %l2 = 00000000000000ce
!	Mem[0000000010181400] = 0000008b, %l0 = 00000000524b7e2e
	lduwa	[%i6+%g0]0x80,%l0	! %l0 = 000000000000008b
!	Mem[00000000300c1410] = ffffc1ce, %l0 = 000000000000008b
	ldsba	[%i3+%o5]0x89,%l0	! %l0 = ffffffffffffffce
!	Mem[0000000010081410] = ffffc1ce 8b000000, %l6 = 000000e8, %l7 = 14ff9fe8
	ldda	[%i2+%o5]0x88,%l6	! %l6 = 000000008b000000 00000000ffffc1ce
!	Mem[00000000211c0000] = ff5d2346, %l7 = 00000000ffffc1ce
	ldsh	[%o2+%g0],%l7		! %l7 = ffffffffffffff5d
!	Mem[0000000010041400] = c57dd7e7, %l2 = 00000000000000ce
	lduba	[%i1+%g0]0x80,%l2	! %l2 = 00000000000000c5
!	Mem[0000000030081408] = 58ffff12fb191258, %f16 = ff000000 00000000
	ldda	[%i2+%o4]0x89,%f16	! %f16 = 58ffff12 fb191258
!	Starting 10 instruction Store Burst
!	%l2 = 00000000000000c5, Mem[0000000010101400] = 65000000
	stwa	%l2,[%i4+%g0]0x80	! Mem[0000000010101400] = 000000c5

p0_label_106:
!	Mem[0000000030141400] = 0000ff0d, %l6 = 000000008b000000
	ldstuba	[%i5+%g0]0x89,%l6	! %l6 = 0000000d000000ff
!	Mem[0000000020800040] = 67e12a9b, %l6 = 000000000000000d
	ldstub	[%o1+0x040],%l6		! %l6 = 00000067000000ff
!	Mem[000000001004143e] = ba013aff, %l1 = 0000000000000000
	ldstub	[%i1+0x03e],%l1		! %l1 = 0000003a000000ff
!	%l6 = 0000000000000067, Mem[0000000010181408] = 58ffff12e6689720, %asi = 80
	stxa	%l6,[%i6+0x008]%asi	! Mem[0000000010181408] = 0000000000000067
!	%l1 = 000000000000003a, Mem[0000000010101434] = 014b43ca
	stw	%l1,[%i4+0x034]		! Mem[0000000010101434] = 0000003a
!	%f24 = 901acbd0 73a3db94, Mem[0000000030001400] = 00000000 00002af8
	stda	%f24,[%i0+%g0]0x81	! Mem[0000000030001400] = 901acbd0 73a3db94
!	%l0 = ffffffce, %l1 = 0000003a, Mem[0000000010081410] = 0000008b cec1ffff
	stda	%l0,[%i2+%o5]0x80	! Mem[0000000010081410] = ffffffce 0000003a
!	Mem[0000000010041400] = c57dd7e7, %l2 = 00000000000000c5
	ldstuba	[%i1+%g0]0x80,%l2	! %l2 = 000000c5000000ff
!	%l1 = 000000000000003a, Mem[0000000010181410] = 00ff000100005787
	stxa	%l1,[%i6+%o5]0x80	! Mem[0000000010181410] = 000000000000003a
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = cec1ffffca43c301, %f8  = 901acbd0 73a3db94
	ldda	[%i3+%o5]0x81,%f8 	! %f8  = cec1ffff ca43c301

p0_label_107:
!	Mem[00000000100c1408] = 9c090000, %l1 = 000000000000003a
	ldsba	[%i3+%o4]0x80,%l1	! %l1 = ffffffffffffff9c
!	Mem[0000000030141400] = 0000ffff, %l5 = 0000000000000400
	ldswa	[%i5+%g0]0x89,%l5	! %l5 = 000000000000ffff
!	Mem[00000000300c1408] = 0dffffff00000000, %f16 = 58ffff12 fb191258
	ldda	[%i3+%o4]0x89,%f16	! %f16 = 0dffffff 00000000
!	Mem[0000000010101424] = d5319f1e, %f4  = 0000e3ff
	lda	[%i4+0x024]%asi,%f4 	! %f4 = d5319f1e
!	Mem[0000000010141420] = ffffffffffffff0d, %f20 = 00000000 000000ff
	ldda	[%i5+0x020]%asi,%f20	! %f20 = ffffffff ffffff0d
!	Mem[00000000100c1408] = 0000099c, %f12 = e89fff14
	lda	[%i3+%o4]0x88,%f12	! %f12 = 0000099c
!	Mem[0000000030081410] = 0d000000ffe30000, %f26 = ff000000 2f8b875d
	ldda	[%i2+%o5]0x81,%f26	! %f26 = 0d000000 ffe30000
!	Mem[0000000030141400] = ffff00008b000000, %l2 = 00000000000000c5
	ldxa	[%i5+%g0]0x81,%l2	! %l2 = ffff00008b000000
!	Mem[0000000010001400] = 58ffff12, %l7 = ffffffffffffff5d
	lduha	[%i0+%g0]0x88,%l7	! %l7 = 000000000000ff12
!	Starting 10 instruction Store Burst
!	%l1 = ffffffffffffff9c, Mem[000000001014140c] = 581219fb
	stb	%l1,[%i5+0x00c]		! Mem[000000001014140c] = 9c1219fb

p0_label_108:
!	%f1  = 00000000, %f30 = 466c4463 e28fa055
	fstod	%f1 ,%f30		! %f30 = 00000000 00000000
!	%l1 = ffffffffffffff9c, %l7 = 000000000000ff12, %l6 = 0000000000000067
	add	%l1,%l7,%l6		! %l6 = 000000000000feae
!	%f20 = ffffffff, Mem[0000000010041400] = e7d77dff
	sta	%f20,[%i1+%g0]0x88	! Mem[0000000010041400] = ffffffff
!	Mem[0000000030001408] = fff20000, %l3 = ffffffffffffffff
	swapa	[%i0+%o4]0x81,%l3	! %l3 = 00000000fff20000
!	Mem[0000000010101410] = 000068e6, %l5 = 000000000000ffff
	ldstuba	[%i4+%o5]0x80,%l5	! %l5 = 00000000000000ff
!	%f4  = d5319f1e 0000000d, Mem[0000000010041410] = ff3a00ff ffffffba
	stda	%f4 ,[%i1+%o5]0x80	! Mem[0000000010041410] = d5319f1e 0000000d
!	%l0 = ffffffce, %l1 = ffffff9c, Mem[0000000030081408] = 581219fb 12ffff58
	stda	%l0,[%i2+%o4]0x81	! Mem[0000000030081408] = ffffffce ffffff9c
!	Mem[0000000010041400] = ffffffff, %l7 = 000000000000ff12
	swapa	[%i1+%g0]0x88,%l7	! %l7 = 00000000ffffffff
!	Code Fragment 4
p0_fragment_5:
!	%l0 = ffffffffffffffce
	setx	0x62bb24e807f1e2e5,%g7,%l0 ! %l0 = 62bb24e807f1e2e5
!	%l1 = ffffffffffffff9c
	setx	0xc1dc9087a58a5d5a,%g7,%l1 ! %l1 = c1dc9087a58a5d5a
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 62bb24e807f1e2e5
	setx	0x4426a090688cdfb8,%g7,%l0 ! %l0 = 4426a090688cdfb8
!	%l1 = c1dc9087a58a5d5a
	setx	0x0830fc7fb736746b,%g7,%l1 ! %l1 = 0830fc7fb736746b
!	Starting 10 instruction Load Burst
!	Code Fragment 4
p0_fragment_6:
!	%l0 = 4426a090688cdfb8
	setx	0xa852fbd06692b69c,%g7,%l0 ! %l0 = a852fbd06692b69c
!	%l1 = 0830fc7fb736746b
	setx	0x83e116c01d6731a6,%g7,%l1 ! %l1 = 83e116c01d6731a6
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = a852fbd06692b69c
	setx	0x35d46a178a53c621,%g7,%l0 ! %l0 = 35d46a178a53c621
!	%l1 = 83e116c01d6731a6
	setx	0x7cfcaa5fb01fd617,%g7,%l1 ! %l1 = 7cfcaa5fb01fd617

p0_label_109:
!	Mem[00000000218000c0] = 34ff1f7c, %l0 = 35d46a178a53c621
	lduh	[%o3+0x0c0],%l0		! %l0 = 00000000000034ff
!	Mem[0000000010181408] = 00000000, %l1 = 7cfcaa5fb01fd617
	lduba	[%i6+%o4]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000030041408] = 581219fb, %l4 = 00000000581219fb
	lduwa	[%i1+%o4]0x81,%l4	! %l4 = 00000000581219fb
!	Mem[0000000030041410] = 0d000000, %l7 = 00000000ffffffff
	ldsba	[%i1+%o5]0x81,%l7	! %l7 = 000000000000000d
!	Mem[0000000010101408] = e6689720, %l4 = 00000000581219fb
	ldsha	[%i4+%o4]0x80,%l4	! %l4 = ffffffffffffe668
!	Mem[00000000300c1408] = 00000000, %l0 = 00000000000034ff
	lduha	[%i3+%o4]0x89,%l0	! %l0 = 0000000000000000
!	Mem[00000000100c1408] = 9c090000, %l2 = ffff00008b000000
	ldsha	[%i3+%o4]0x80,%l2	! %l2 = ffffffffffff9c09
!	Mem[0000000010101438] = 8065adb4564ce1f4, %f30 = 00000000 00000000
	ldda	[%i4+0x038]%asi,%f30	! %f30 = 8065adb4 564ce1f4
!	Mem[00000000100c1410] = 00000000, %f23 = 00109074
	lda	[%i3+%o5]0x88,%f23	! %f23 = 00000000
!	Starting 10 instruction Store Burst
!	%l3 = 00000000fff20000, Mem[0000000030001408] = ffffffff
	stha	%l3,[%i0+%o4]0x89	! Mem[0000000030001408] = ffff0000

p0_label_110:
!	%f2  = 58ffff12 fb191258, %l7 = 000000000000000d
!	Mem[00000000300c1428] = 67e15ba006e3359c
	add	%i3,0x028,%g1
	stda	%f2,[%g1+%l7]ASI_PST32_SL ! Mem[00000000300c1428] = 581219fb06e3359c
!	Mem[0000000010181400] = 0000008b, %l5 = 0000000000000000
	ldstuba	[%i6+%g0]0x80,%l5	! %l5 = 00000000000000ff
!	%l6 = 0000feae, %l7 = 0000000d, Mem[0000000030101400] = ffe3ff0d 0d000000
	stda	%l6,[%i4+%g0]0x89	! Mem[0000000030101400] = 0000feae 0000000d
!	%l3 = 00000000fff20000, immd = fffffffffffff0b0, %l2 = ffffffffffff9c09
	sdivx	%l3,-0xf50,%l2		! %l2 = ffffffffffef4904
!	Mem[000000001010143c] = 564ce1f4, %l1 = 0000000000000000, %asi = 80
	swapa	[%i4+0x03c]%asi,%l1	! %l1 = 00000000564ce1f4
!	%f23 = 00000000, %f14 = 466c4463
	fcmps	%fcc1,%f23,%f14		! %fcc1 = 1
!	%l1 = 00000000564ce1f4, Mem[00000000100c1410] = 0000000000000000
	stxa	%l1,[%i3+%o5]0x80	! Mem[00000000100c1410] = 00000000564ce1f4
!	%l1 = 00000000564ce1f4, Mem[00000000100c1400] = ff000000
	stwa	%l1,[%i3+%g0]0x80	! Mem[00000000100c1400] = 564ce1f4
!	%l3 = 00000000fff20000, Mem[0000000010081408] = 45be3a33
	stwa	%l3,[%i2+%o4]0x88	! Mem[0000000010081408] = fff20000
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = 00000004, %l1 = 00000000564ce1f4
	lduwa	[%i4+%o4]0x89,%l1	! %l1 = 0000000000000004

p0_label_111:
!	Mem[0000000021800180] = ffe3dde9, %l4 = ffffffffffffe668
	lduha	[%o3+0x180]%asi,%l4	! %l4 = 000000000000ffe3
!	Mem[0000000030001410] = 370000f2, %l4 = 000000000000ffe3
	ldsha	[%i0+%o5]0x89,%l4	! %l4 = 00000000000000f2
!	Mem[0000000010041408] = 00000000, %l7 = 000000000000000d
	ldsha	[%i1+%o4]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000010081410] = ffffffce, %l5 = 0000000000000000
	lduba	[%i2+%o5]0x80,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010101400] = 000000c5 00000000, %l0 = 00000000, %l1 = 00000004
	ldda	[%i4+%g0]0x80,%l0	! %l0 = 00000000000000c5 0000000000000000
!	Mem[0000000030101400] = 0000feae, %l1 = 0000000000000000
	lduba	[%i4+%g0]0x89,%l1	! %l1 = 00000000000000ae
!	Mem[0000000021800040] = 0645a70e, %l7 = 0000000000000000
	lduba	[%o3+0x040]%asi,%l7	! %l7 = 0000000000000006
!	Mem[00000000300c1410] = 01c343caffffc1ce, %f4  = d5319f1e 0000000d
	ldda	[%i3+%o5]0x89,%f4 	! %f4  = 01c343ca ffffc1ce
!	Mem[0000000010141404] = 00000000, %f29 = 45be3a33
	lda	[%i5+0x004]%asi,%f29	! %f29 = 00000000
!	Starting 10 instruction Store Burst
!	Mem[00000000201c0001] = ffffd27d, %l1 = 00000000000000ae
	ldstub	[%o0+0x001],%l1		! %l1 = 000000ff000000ff

p0_label_112:
!	Mem[00000000100c141c] = 2f8b875d, %l7 = 0000000000000006
	ldstub	[%i3+0x01c],%l7		! %l7 = 0000002f000000ff
!	Mem[0000000010041410] = 1e9f31d5, %l7 = 000000000000002f
	swapa	[%i1+%o5]0x88,%l7	! %l7 = 000000001e9f31d5
!	%f18 = 333abe45 0000000d, %l3 = 00000000fff20000
!	Mem[00000000100c1400] = 564ce1f400000000
	stda	%f18,[%i3+%l3]ASI_PST16_P ! Mem[00000000100c1400] = 564ce1f400000000
!	%f28 = e89fff14 00000000, %l4 = 00000000000000f2
!	Mem[0000000010181428] = 5ddf2b10fe453ffd
	add	%i6,0x028,%g1
	stda	%f28,[%g1+%l4]ASI_PST32_P ! Mem[0000000010181428] = e89fff14fe453ffd
!	%f28 = e89fff14 00000000, %l1 = 00000000000000ff
!	Mem[00000000100c1428] = 579dfb692f8b875d
	add	%i3,0x028,%g1
	stda	%f28,[%g1+%l1]ASI_PST16_PL ! Mem[00000000100c1428] = 0000000014ff9fe8
!	%f2  = 58ffff12 fb191258, Mem[0000000030141400] = 0000ffff 0000008b
	stda	%f2 ,[%i5+%g0]0x89	! Mem[0000000030141400] = 58ffff12 fb191258
!	%l3 = 00000000fff20000, Mem[0000000010101436] = 0000003a, %asi = 80
	stha	%l3,[%i4+0x036]%asi	! Mem[0000000010101434] = 00000000
!	%l1 = 00000000000000ff, Mem[0000000030181400] = fb19125801ff0000
	stxa	%l1,[%i6+%g0]0x81	! Mem[0000000030181400] = 00000000000000ff
!	%f28 = e89fff14 00000000, %l0 = 00000000000000c5
!	Mem[0000000030041410] = 0d000000ffe30000
	add	%i1,0x010,%g1
	stda	%f28,[%g1+%l0]ASI_PST16_SL ! Mem[0000000030041410] = 0000000014ff0000
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = ffffd27d, %l2 = ffffffffffef4904
	ldub	[%o0+0x001],%l2		! %l2 = 00000000000000ff

p0_label_113:
!	Mem[0000000030181408] = 524b7e2e, %l0 = 00000000000000c5
	lduba	[%i6+%o4]0x81,%l0	! %l0 = 0000000000000052
!	Mem[0000000010001408] = 58ffff12, %f14 = 466c4463
	lda	[%i0+%o4]0x80,%f14	! %f14 = 58ffff12
!	Mem[0000000010181410] = 00000000, %f3  = fb191258
	lda	[%i6+%o5]0x88,%f3 	! %f3 = 00000000
!	Mem[0000000010081400] = ff000000 000000ff, %l0 = 00000052, %l1 = 000000ff
	ldda	[%i2+%g0]0x88,%l0	! %l0 = 00000000000000ff 00000000ff000000
!	Mem[0000000010181400] = 8b0000ff, %l2 = 00000000000000ff
	lduba	[%i6+%g0]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010081408] = e89fff14 fff20000, %l6 = 0000feae, %l7 = 1e9f31d5
	ldda	[%i2+%o4]0x88,%l6	! %l6 = 00000000fff20000 00000000e89fff14
!	Code Fragment 4
p0_fragment_7:
!	%l0 = 00000000000000ff
	setx	0xc290f32fb3f95164,%g7,%l0 ! %l0 = c290f32fb3f95164
!	%l1 = 00000000ff000000
	setx	0xe71cf9b840f52f32,%g7,%l1 ! %l1 = e71cf9b840f52f32
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = c290f32fb3f95164
	setx	0xf3507450421f6c6b,%g7,%l0 ! %l0 = f3507450421f6c6b
!	%l1 = e71cf9b840f52f32
	setx	0x36fa1ee047eaf930,%g7,%l1 ! %l1 = 36fa1ee047eaf930
!	Mem[0000000010001438] = 466c4463, %l2 = 00000000000000ff
	ldsba	[%i0+0x03a]%asi,%l2	! %l2 = 0000000000000044
!	Mem[0000000010141430] = 524b7e2e, %l3 = 00000000fff20000
	ldsw	[%i5+0x030],%l3		! %l3 = 00000000524b7e2e
!	Starting 10 instruction Store Burst
!	Mem[0000000010181400] = 8b0000ff, %l1 = 36fa1ee047eaf930
	ldstuba	[%i6+%g0]0x88,%l1	! %l1 = 000000ff000000ff

p0_label_114:
!	Mem[00000000100c1410] = 00000000, %l1 = 00000000000000ff
	ldstuba	[%i3+%o5]0x80,%l1	! %l1 = 00000000000000ff
!	%f16 = 0dffffff 00000000, Mem[00000000100c1408] = 9c090000 0000000d
	stda	%f16,[%i3+%o4]0x80	! Mem[00000000100c1408] = 0dffffff 00000000
!	%l5 = 00000000000000ff, Mem[0000000010101408] = e668972000000000
	stx	%l5,[%i4+%o4]		! Mem[0000000010101408] = 00000000000000ff
!	%l7 = 00000000e89fff14, Mem[0000000030001410] = f2000037fffff8ff
	stxa	%l7,[%i0+%o5]0x81	! Mem[0000000030001410] = 00000000e89fff14
!	Mem[0000000030041400] = 581219fb, %l6 = 00000000fff20000
	ldstuba	[%i1+%g0]0x81,%l6	! %l6 = 00000058000000ff
!	%l2 = 0000000000000044, Mem[0000000010181400] = 8b0000ff
	stba	%l2,[%i6+%g0]0x88	! Mem[0000000010181400] = 8b000044
!	%l1 = 0000000000000000, Mem[000000001008142a] = aea8c45f, %asi = 80
	stha	%l1,[%i2+0x02a]%asi	! Mem[0000000010081428] = aea80000
!	%f16 = 0dffffff 00000000, Mem[0000000010101400] = c5000000 00000000
	stda	%f16,[%i4+%g0]0x88	! Mem[0000000010101400] = 0dffffff 00000000
!	%l7 = 00000000e89fff14, Mem[00000000211c0001] = ff5d2346
	stb	%l7,[%o2+0x001]		! Mem[00000000211c0000] = ff142346
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = 00000000, %l2 = 0000000000000044
	lduwa	[%i6+%o5]0x88,%l2	! %l2 = 0000000000000000

p0_label_115:
!	%l4 = 00000000000000f2, immed = 00000b82, %y  = 524b7e2e
	smul	%l4,0xb82,%l5		! %l5 = 00000000000ae0e4, %y = 00000000
!	Mem[0000000010001400] = 12ffff58 00000000, %l0 = 421f6c6b, %l1 = 00000000
	ldda	[%i0+%g0]0x80,%l0	! %l0 = 0000000012ffff58 0000000000000000
!	Mem[0000000030141408] = 67e15ba0 7fffffff, %l2 = 00000000, %l3 = 524b7e2e
	ldda	[%i5+%o4]0x81,%l2	! %l2 = 0000000067e15ba0 000000007fffffff
!	Mem[0000000010041410] = 0d0000000000002f, %l4 = 00000000000000f2
	ldxa	[%i1+%o5]0x88,%l4	! %l4 = 0d0000000000002f
!	Mem[0000000020800040] = ffe12a9b, %l1 = 0000000000000000
	ldub	[%o1+0x040],%l1		! %l1 = 00000000000000ff
!	%l3 = 000000007fffffff, immd = 0000000000000f62, %l2 = 0000000067e15ba0
	sdivx	%l3,0xf62,%l2		! %l2 = 000000000008522b
!	Mem[0000000010001410] = 0000e3ff0000000d, %f16 = 0dffffff 00000000
	ldda	[%i0+%o5]0x80,%f16	! %f16 = 0000e3ff 0000000d
!	Mem[00000000300c1410] = 01c343caffffc1ce, %l3 = 000000007fffffff
	ldxa	[%i3+%o5]0x89,%l3	! %l3 = 01c343caffffc1ce
!	Mem[0000000030101410] = 0d000000, %l5 = 00000000000ae0e4
	ldsba	[%i4+%o5]0x89,%l5	! %l5 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l5 = 0000000000000000, Mem[0000000030001410] = 00000000
	stba	%l5,[%i0+%o5]0x89	! Mem[0000000030001410] = 00000000

p0_label_116:
!	Mem[0000000010041400] = 0000ff12, %l0 = 0000000012ffff58
	swapa	[%i1+%g0]0x88,%l0	! %l0 = 000000000000ff12
!	%l5 = 0000000000000000, Mem[0000000010181408] = 00000000
	stha	%l5,[%i6+%o4]0x88	! Mem[0000000010181408] = 00000000
!	%f4  = 01c343ca ffffc1ce, %l3 = 01c343caffffc1ce
!	Mem[0000000010181410] = 000000000000003a
	add	%i6,0x010,%g1
	stda	%f4,[%g1+%l3]ASI_PST32_PL ! Mem[0000000010181410] = 00000000ca43c301
!	Mem[0000000030041408] = fb191258, %l7 = 00000000e89fff14
	swapa	[%i1+%o4]0x89,%l7	! %l7 = 00000000fb191258
!	Mem[0000000010101400] = 00000000, %l2 = 000000000008522b
	swapa	[%i4+%g0]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000010181408] = 00000000, %l5 = 0000000000000000
	swapa	[%i6+%o4]0x88,%l5	! %l5 = 0000000000000000
!	%l4 = 0d0000000000002f, %l5 = 0000000000000000, %l3 = 01c343caffffc1ce
	sub	%l4,%l5,%l3		! %l3 = 0d0000000000002f
!	%f21 = ffffff0d, %f21 = ffffff0d, %f31 = 564ce1f4
	fsubs	%f21,%f21,%f31		! %f31 = ffffff0d
!	%l2 = 00000000, %l3 = 0000002f, Mem[0000000010141400] = 00000000 00000000
	stda	%l2,[%i5+%g0]0x80	! Mem[0000000010141400] = 00000000 0000002f
!	Starting 10 instruction Load Burst
!	Mem[0000000021800140] = 00ff6ae1, %l3 = 0d0000000000002f
	ldub	[%o3+0x140],%l3		! %l3 = 0000000000000000

p0_label_117:
!	Mem[0000000010041408] = 00000000, %l1 = 00000000000000ff
	ldsha	[%i1+%o4]0x88,%l1	! %l1 = 0000000000000000
!	Mem[00000000201c0000] = ffffd27d, %l2 = 0000000000000000
	ldsha	[%o0+0x000]%asi,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000010181410] = 00000000, %l5 = 0000000000000000
	ldsha	[%i6+%o5]0x80,%l5	! %l5 = 0000000000000000
!	Mem[00000000100c1408] = ffffff0d, %f29 = 00000000
	lda	[%i3+%o4]0x88,%f29	! %f29 = ffffff0d
	membar	#Sync			! Added by membar checker (23)
!	Mem[0000000010041400] = 58ffff12 00000000 00000000 000000ff
!	Mem[0000000010041410] = 2f000000 0000000d 69fb9d57 12ffff58
!	Mem[0000000010041420] = e8000000 ff7c00ff 01c3c301 0000ff00
!	Mem[0000000010041430] = 000000ff 04d4ffff bca1ff70 ba01ffff
	ldda	[%i1]ASI_BLK_PL,%f0	! Block Load from 0000000010041400
!	Mem[0000000010041400] = 58ffff12, %f24 = 901acbd0
	lda	[%i1+0x000]%asi,%f24	! %f24 = 58ffff12
!	Mem[0000000010081410] = ceffffff, %l1 = 0000000000000000
	lduha	[%i2+%o5]0x88,%l1	! %l1 = 000000000000ffff
!	Mem[0000000021800100] = 58e8d196, %l6 = 0000000000000058
	lduha	[%o3+0x100]%asi,%l6	! %l6 = 00000000000058e8
!	Mem[00000000100c1400] = 00000000f4e14c56, %f24 = 58ffff12 73a3db94
	ldda	[%i3+%g0]0x88,%f24	! %f24 = 00000000 f4e14c56
!	Starting 10 instruction Store Burst
!	%l3 = 0000000000000000, Mem[0000000030041400] = fb1912ff
	stha	%l3,[%i1+%g0]0x89	! Mem[0000000030041400] = fb190000

p0_label_118:
!	Mem[0000000010181410] = 00000000, %l2 = ffffffffffffffff
	swapa	[%i6+%o5]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000030141408] = a05be167, %l7 = 00000000fb191258
	swapa	[%i5+%o4]0x89,%l7	! %l7 = 00000000a05be167
!	%l2 = 0000000000000000, Mem[00000000211c0000] = ff142346, %asi = 80
	stba	%l2,[%o2+0x000]%asi	! Mem[00000000211c0000] = 00142346
!	%l2 = 0000000000000000, Mem[0000000030141408] = ffffff7ffb191258
	stxa	%l2,[%i5+%o4]0x89	! Mem[0000000030141408] = 0000000000000000
!	Mem[000000001004141d] = 12ffff58, %l5 = 0000000000000000
	ldstub	[%i1+0x01d],%l5		! %l5 = 000000ff000000ff
!	%l1 = 000000000000ffff, immed = fffffc9d, %y  = 00000000
	udiv	%l1,-0x363,%l7		! %l7 = 0000000000000000
	mov	%l0,%y			! %y = 0000ff12
!	%f29 = ffffff0d, Mem[0000000010141410] = f89f7cff
	sta	%f29,[%i5+%o5]0x80	! Mem[0000000010141410] = ffffff0d
!	%l4 = 0d0000000000002f, Mem[0000000010181408] = 00000000
	stwa	%l4,[%i6+%o4]0x88	! Mem[0000000010181408] = 0000002f
!	%l6 = 00000000000058e8, Mem[00000000201c0000] = ffffd27d
	stb	%l6,[%o0+%g0]		! Mem[00000000201c0000] = e8ffd27d
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = ff0068e6, %l5 = 00000000000000ff
	ldswa	[%i4+%o5]0x80,%l5	! %l5 = ffffffffff0068e6

p0_label_119:
!	Mem[00000000201c0000] = e8ffd27d, %l5 = ffffffffff0068e6
	lduh	[%o0+%g0],%l5		! %l5 = 000000000000e8ff
!	Mem[00000000100c1410] = 000000ff, %l7 = 0000000000000000
	lduba	[%i3+%o5]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010041434] = 04d4ffff, %l0 = 000000000000ff12
	ldsba	[%i1+0x035]%asi,%l0	! %l0 = ffffffffffffffd4
!	Mem[0000000010141414] = 65db8bff, %l3 = 0000000000000000
	ldsw	[%i5+0x014],%l3		! %l3 = 0000000065db8bff
!	%f18 = 333abe45, %f18 = 333abe45
	fsqrts	%f18,%f18		! %f18 = 395aa57e
!	Mem[0000000010081408] = fff20000, %l2 = 0000000000000000
	lduwa	[%i2+%o4]0x88,%l2	! %l2 = 00000000fff20000
!	%l6 = 00000000000058e8, imm = fffffffffffff848, %l0 = ffffffffffffffd4
	xnor	%l6,-0x7b8,%l0		! %l0 = 0000000000005f5f
!	Mem[0000000030101400] = 0000feae, %l5 = 000000000000e8ff
	ldswa	[%i4+%g0]0x89,%l5	! %l5 = 000000000000feae
!	Mem[0000000010081410] = ceffffff, %l5 = 000000000000feae
	ldsba	[%i2+%o5]0x88,%l5	! %l5 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	Mem[00000000201c0000] = e8ffd27d, %l7 = 00000000000000ff
	ldstuba	[%o0+0x000]%asi,%l7	! %l7 = 000000e8000000ff

p0_label_120:
!	Mem[000000001014142a] = f8040000, %l3 = 0000000065db8bff
	ldstub	[%i5+0x02a],%l3		! %l3 = 00000000000000ff
!	%l1 = 000000000000ffff, Mem[0000000010001402] = 12ffff58
	sth	%l1,[%i0+0x002]		! Mem[0000000010001400] = 12ffffff
	membar	#Sync			! Added by membar checker (24)
!	%l1 = 000000000000ffff, Mem[0000000010041410] = 2f000000
	stha	%l1,[%i1+%o5]0x80	! Mem[0000000010041410] = ffff0000
!	%l2 = 00000000fff20000, imm = fffffffffffff0ca, %l3 = 0000000000000000
	subc	%l2,-0xf36,%l3		! %l3 = 00000000fff20f36
!	%l4 = 0d0000000000002f, Mem[0000000010101400] = 2b520800
	stha	%l4,[%i4+%g0]0x80	! Mem[0000000010101400] = 002f0800
!	%l4 = 0000002f, %l5 = ffffffff, Mem[0000000010181408] = 0000002f 67000000
	stda	%l4,[%i6+%o4]0x88	! Mem[0000000010181408] = 0000002f ffffffff
!	Mem[0000000010081410] = ceffffff, %l2 = 00000000fff20000
	ldstuba	[%i2+%o5]0x88,%l2	! %l2 = 000000ff000000ff
!	%l0 = 0000000000005f5f, Mem[0000000030181408] = 524b7e2e
	stwa	%l0,[%i6+%o4]0x81	! Mem[0000000030181408] = 00005f5f
!	%l3 = 00000000fff20f36, Mem[00000000100c1414] = 564ce1f4, %asi = 80
	stha	%l3,[%i3+0x014]%asi	! Mem[00000000100c1414] = 0f36e1f4
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = 0000f2ff, %l2 = 00000000000000ff
	lduba	[%i2+%o4]0x80,%l2	! %l2 = 0000000000000000

p0_label_121:
!	Mem[0000000010141410] = 0dffffff, %l1 = 000000000000ffff
	ldswa	[%i5+%o5]0x88,%l1	! %l1 = 000000000dffffff
!	Mem[00000000100c1400] = 564ce1f4, %l3 = 00000000fff20f36
	ldswa	[%i3+%g0]0x80,%l3	! %l3 = 00000000564ce1f4
!	Mem[0000000030181408] = 00005f5f, %l5 = ffffffffffffffff
	ldsha	[%i6+%o4]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000030141408] = 00000000, %f14 = ffff01ba
	lda	[%i5+%o4]0x89,%f14	! %f14 = 00000000
!	%f8  = ff007cff, %f2  = ff000000, %f31 = ffffff0d
	fadds	%f8 ,%f2 ,%f31		! %f31 = ff800000
!	Mem[0000000020800040] = ffe12a9b, %l6 = 00000000000058e8
	ldsh	[%o1+0x040],%l6		! %l6 = ffffffffffffffe1
!	Mem[0000000010141400] = 00000000, %l5 = 0000000000000000
	ldsba	[%i5+%g0]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000030001408] = 0000ffff, %l6 = ffffffffffffffe1
	ldswa	[%i0+%o4]0x81,%l6	! %l6 = 000000000000ffff
!	Mem[0000000010001404] = 00000000, %l5 = 0000000000000000
	ldsh	[%i0+0x006],%l5		! %l5 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l0 = 00005f5f, %l1 = 0dffffff, Mem[00000000100c1408] = ffffff0d 00000000
	stda	%l0,[%i3+%o4]0x88	! Mem[00000000100c1408] = 00005f5f 0dffffff

p0_label_122:
!	%l4 = 0000002f, %l5 = 00000000, Mem[0000000010081408] = 0000f2ff 14ff9fe8
	stda	%l4,[%i2+%o4]0x80	! Mem[0000000010081408] = 0000002f 00000000
!	%f4  = 0d000000, %f12 = ffffd404, %f17 = 0000000d
	fsubs	%f4 ,%f12,%f17		! %f17 = ffffd404
!	Mem[0000000030001400] = d0cb1a90, %l0 = 0000000000005f5f
	swapa	[%i0+%g0]0x89,%l0	! %l0 = 00000000d0cb1a90
!	Mem[0000000010141400] = 00000000, %l1 = 000000000dffffff, %asi = 80
	swapa	[%i5+0x000]%asi,%l1	! %l1 = 0000000000000000
!	%l4 = 0d0000000000002f, %l7 = 00000000000000e8, %l0 = 00000000d0cb1a90
	andn	%l4,%l7,%l0		! %l0 = 0d00000000000007
!	Mem[0000000030101408] = 04000000, %l0 = 0d00000000000007
	ldstuba	[%i4+%o4]0x81,%l0	! %l0 = 00000004000000ff
!	Mem[0000000010181430] = ee3bf804, %l6 = 0000ffff, %l2 = 00000000
	add	%i6,0x30,%g1
	casa	[%g1]0x80,%l6,%l2	! %l2 = 00000000ee3bf804
!	%f22 = d14f1fda, Mem[000000001000143c] = e28fa055
	st	%f22,[%i0+0x03c]	! Mem[000000001000143c] = d14f1fda
!	%l2 = 00000000ee3bf804, Mem[00000000100c1438] = 466c4463, %asi = 80
	stwa	%l2,[%i3+0x038]%asi	! Mem[00000000100c1438] = ee3bf804
!	Starting 10 instruction Load Burst
!	%f23 = 00000000, %f28 = e89fff14, %f6  = 58ffff12 579dfb69
	fsmuld	%f23,%f28,%f6 		! %f6  = 80000000 00000000

p0_label_123:
!	Mem[0000000030101400] = aefe0000, %l3 = 00000000564ce1f4
	lduba	[%i4+%g0]0x81,%l3	! %l3 = 00000000000000ae
!	Mem[0000000010141428] = f804ff00, %l1 = 0000000000000000
	ldsba	[%i5+0x028]%asi,%l1	! %l1 = fffffffffffffff8
!	Mem[0000000010141434] = 06e3359c, %l0 = 0000000000000004
	ldswa	[%i5+0x034]%asi,%l0	! %l0 = 0000000006e3359c
!	Mem[0000000010181428] = e89fff14fe453ffd, %l3 = 00000000000000ae
	ldxa	[%i6+0x028]%asi,%l3	! %l3 = e89fff14fe453ffd
!	Mem[0000000010101438] = 8065adb4, %l4 = 0d0000000000002f
	ldub	[%i4+0x03b],%l4		! %l4 = 00000000000000b4
!	Mem[0000000010141430] = 524b7e2e, %l1 = fffffffffffffff8
	ldsh	[%i5+0x030],%l1		! %l1 = 000000000000524b
!	Mem[0000000010141420] = ffffffff, %l3 = e89fff14fe453ffd
	lduha	[%i5+0x022]%asi,%l3	! %l3 = 000000000000ffff
!	Mem[00000000100c1408] = 5f5f0000, %l4 = 00000000000000b4
	ldsha	[%i3+%o4]0x80,%l4	! %l4 = 0000000000005f5f
!	Mem[0000000010081438] = 67e15ba0 06e3249c, %l2 = ee3bf804, %l3 = 0000ffff
	ldd	[%i2+0x038],%l2		! %l2 = 0000000067e15ba0 0000000006e3249c
!	Starting 10 instruction Store Burst
!	%f10 = 00ff0000, Mem[0000000030001408] = 0000ffff
	sta	%f10,[%i0+%o4]0x81	! Mem[0000000030001408] = 00ff0000

p0_label_124:
!	%l3 = 0000000006e3249c, Mem[00000000100c1408] = 5f5f0000
	stba	%l3,[%i3+%o4]0x80	! Mem[00000000100c1408] = 9c5f0000
!	%f21 = ffffff0d, %f6  = 80000000, %f3  = 00000000
	fdivs	%f21,%f6 ,%f3 		! %f3  = ffffff0d
!	%f5  = 0000002f, Mem[0000000030181410] = 000000ff
	sta	%f5 ,[%i6+%o5]0x89	! Mem[0000000030181410] = 0000002f
!	%l0 = 0000000006e3359c, Mem[000000001018142e] = fe453ffd, %asi = 80
	stba	%l0,[%i6+0x02e]%asi	! Mem[000000001018142c] = fe459cfd
!	%l7 = 00000000000000e8, %l3 = 0000000006e3249c, %l3 = 0000000006e3249c
	addc	%l7,%l3,%l3		! %l3 = 0000000006e32584
!	%l6 = 000000000000ffff, Mem[0000000010101406] = ffffff0d, %asi = 80
	stha	%l6,[%i4+0x006]%asi	! Mem[0000000010101404] = ffffffff
!	%f19 = 0000000d, Mem[0000000010081420] = e417e6c0
	sta	%f19,[%i2+0x020]%asi	! Mem[0000000010081420] = 0000000d
!	%l3 = 0000000006e32584, Mem[000000001018141a] = 000000e8
	stb	%l3,[%i6+0x01a]		! Mem[0000000010181418] = 000084e8
!	%f10 = 00ff0000 01c3c301, Mem[0000000010081400] = ff000000 000000ff
	stda	%f10,[%i2+%g0]0x80	! Mem[0000000010081400] = 00ff0000 01c3c301
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = ffffff12, %f13 = ff000000
	lda	[%i0+%g0]0x88,%f13	! %f13 = ffffff12

p0_label_125:
!	Mem[00000000211c0000] = 00142346, %l6 = 000000000000ffff
	ldsba	[%o2+0x001]%asi,%l6	! %l6 = 0000000000000014
!	Mem[0000000010141410] = ffffff0d, %l2 = 0000000067e15ba0
	ldsha	[%i5+%o5]0x80,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000010081420] = 0000000d, %l4 = 0000000000005f5f
	lduh	[%i2+0x022],%l4		! %l4 = 000000000000000d
!	Mem[0000000030141408] = 00000000, %l2 = ffffffffffffffff
	ldswa	[%i5+%o4]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000021800040] = 0645a70e, %l5 = 0000000000000000
	lduba	[%o3+0x041]%asi,%l5	! %l5 = 0000000000000045
!	Mem[0000000030041400] = fb190000, %l5 = 0000000000000045
	ldsha	[%i1+%g0]0x89,%l5	! %l5 = 0000000000000000
!	Mem[00000000100c1410] = 000000ff, %f29 = ffffff0d
	lda	[%i3+%o5]0x88,%f29	! %f29 = 000000ff
!	Mem[00000000100c1400] = 564ce1f4, %l7 = 00000000000000e8
	ldsba	[%i3+%g0]0x80,%l7	! %l7 = 0000000000000056
!	Mem[0000000010181410] = ffffffffca43c301, %f10 = 00ff0000 01c3c301
	ldda	[%i6+%o5]0x80,%f10	! %f10 = ffffffff ca43c301
!	Starting 10 instruction Store Burst
!	Mem[0000000010141400] = ffffff0d, %l6 = 0000000000000014
	swapa	[%i5+%g0]0x88,%l6	! %l6 = 00000000ffffff0d

p0_label_126:
!	%l4 = 000000000000000d, Mem[0000000010141400] = 2f00000000000014
	stxa	%l4,[%i5+%g0]0x88	! Mem[0000000010141400] = 000000000000000d
!	Mem[0000000010081400] = 00ff000001c3c301, %l1 = 000000000000524b, %l1 = 000000000000524b
	casxa	[%i2]0x80,%l1,%l1	! %l1 = 00ff000001c3c301
!	%f16 = 0000e3ff ffffd404 395aa57e 0000000d
!	%f20 = ffffffff ffffff0d d14f1fda 00000000
!	%f24 = 00000000 f4e14c56 0d000000 ffe30000
!	%f28 = e89fff14 000000ff 8065adb4 ff800000
	stda	%f16,[%i4]ASI_BLK_S	! Block Store to 0000000030101400
!	%l7 = 0000000000000056, Mem[0000000030141410] = 0d000000
	stha	%l7,[%i5+%o5]0x81	! Mem[0000000030141410] = 00560000
	membar	#Sync			! Added by membar checker (25)
!	Mem[0000000010101400] = 002f0800, %l3 = 0000000006e32584
	ldstuba	[%i4+%g0]0x80,%l3	! %l3 = 00000000000000ff
!	%f18 = 395aa57e 0000000d, Mem[00000000100c1400] = f4e14c56 00000000
	stda	%f18,[%i3+%g0]0x88	! Mem[00000000100c1400] = 395aa57e 0000000d
!	%f26 = 0d000000 ffe30000, %l7 = 0000000000000056
!	Mem[0000000010001420] = 901acbd073a3db94
	add	%i0,0x020,%g1
	stda	%f26,[%g1+%l7]ASI_PST16_PL ! Mem[0000000010001420] = 901ae3ff0000db94
!	%l7 = 0000000000000056, Mem[00000000300c1408] = 00000000ffffff0d
	stxa	%l7,[%i3+%o4]0x81	! Mem[00000000300c1408] = 0000000000000056
!	%f24 = 00000000 f4e14c56, %l0 = 0000000006e3359c
!	Mem[0000000030081418] = 74901046da1f4fd1
	add	%i2,0x018,%g1
	stda	%f24,[%g1+%l0]ASI_PST8_SL ! Mem[0000000030081418] = 7490e1f4001f4f00
!	Starting 10 instruction Load Burst
!	%l5 = 0000000000000000, Mem[0000000030001400] = 5f5f0000
	stha	%l5,[%i0+%g0]0x81	! Mem[0000000030001400] = 00000000

p0_label_127:
!	%l7 = 0000000000000056, imm = fffffffffffff871, %l6 = 00000000ffffff0d
	addc	%l7,-0x78f,%l6		! %l6 = fffffffffffff8c7
!	Mem[0000000030001408] = 0000ff00, %l7 = 0000000000000056
	ldsha	[%i0+%o4]0x89,%l7	! %l7 = ffffffffffffff00
!	Mem[000000001010140c] = 000000ff, %l7 = ffffffffffffff00
	ldsba	[%i4+0x00e]%asi,%l7	! %l7 = 0000000000000000
!	Mem[000000001008142c] = 005c0a63, %l3 = 0000000000000000
	ldsh	[%i2+0x02c],%l3		! %l3 = 000000000000005c
!	Mem[0000000030141410] = 0056000001ff0000, %l0 = 0000000006e3359c
	ldxa	[%i5+%o5]0x81,%l0	! %l0 = 0056000001ff0000
!	Mem[0000000010081410] = ceffffff, %l2 = 0000000000000000
	ldsba	[%i2+%o5]0x88,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000010141408] = 00000000, %l1 = 00ff000001c3c301
	ldsba	[%i5+%o4]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000030101400] = 0000e3ff, %l1 = 0000000000000000
	lduba	[%i4+%g0]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000010141400] = 0d000000, %l3 = 000000000000005c
	ldsha	[%i5+%g0]0x80,%l3	! %l3 = 0000000000000d00
!	Starting 10 instruction Store Burst
!	Mem[0000000030001408] = 0000ff00, %l0 = 0056000001ff0000
	swapa	[%i0+%o4]0x89,%l0	! %l0 = 000000000000ff00

p0_label_128:
!	%l6 = fffff8c7, %l7 = 00000000, Mem[0000000030101400] = 0000e3ff ffffd404
	stda	%l6,[%i4+%g0]0x81	! Mem[0000000030101400] = fffff8c7 00000000
!	%l3 = 0000000000000d00, Mem[0000000010041412] = ffff0000
	stb	%l3,[%i1+0x012]		! Mem[0000000010041410] = ffff0000
!	%l0 = 000000000000ff00, Mem[0000000020800001] = 99ffd48e, %asi = 80
	stba	%l0,[%o1+0x001]%asi	! Mem[0000000020800000] = 9900d48e
!	Mem[00000000218001c1] = 2dff63d1, %l0 = 000000000000ff00
	ldstub	[%o3+0x1c1],%l0		! %l0 = 000000ff000000ff
!	%f16 = 0000e3ff ffffd404 395aa57e 0000000d
!	%f20 = ffffffff ffffff0d d14f1fda 00000000
!	%f24 = 00000000 f4e14c56 0d000000 ffe30000
!	%f28 = e89fff14 000000ff 8065adb4 ff800000
	stda	%f16,[%i4]ASI_BLK_P	! Block Store to 0000000010101400
!	Mem[0000000030141410] = 00560000, %l3 = 0000000000000d00
	swapa	[%i5+%o5]0x81,%l3	! %l3 = 0000000000560000
!	Mem[0000000010041424] = ff7c00ff, %l7 = 0000000000000000
	swap	[%i1+0x024],%l7		! %l7 = 00000000ff7c00ff
!	Mem[000000001000141a] = d14f1fda, %l0 = 00000000000000ff
	ldstuba	[%i0+0x01a]%asi,%l0	! %l0 = 0000001f000000ff
!	%f10 = ffffffff, Mem[0000000010081400] = 00ff0000
	sta	%f10,[%i2+%g0]0x80	! Mem[0000000010081400] = ffffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = 01ff0000, %l0 = 000000000000001f
	ldswa	[%i0+%o4]0x89,%l0	! %l0 = 0000000001ff0000

p0_label_129:
	membar	#Sync			! Added by membar checker (26)
!	Mem[0000000030101400] = fffff8c7 00000000 395aa57e 0000000d
!	Mem[0000000030101410] = ffffffff ffffff0d d14f1fda 00000000
!	Mem[0000000030101420] = 00000000 f4e14c56 0d000000 ffe30000
!	Mem[0000000030101430] = e89fff14 000000ff 8065adb4 ff800000
	ldda	[%i4]ASI_BLK_SL,%f0	! Block Load from 0000000030101400
!	Mem[0000000010181400] = 4400008b0000ff0d, %f22 = d14f1fda 00000000
	ldda	[%i6+%g0]0x80,%f22	! %f22 = 4400008b 0000ff0d
!	Mem[0000000010141410] = ffffff0d65db8bff, %f20 = ffffffff ffffff0d
	ldda	[%i5+%o5]0x80,%f20	! %f20 = ffffff0d 65db8bff
!	Mem[0000000010001400] = 12ffffff, %l1 = 0000000000000000
	ldsha	[%i0+0x002]%asi,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000030181400] = 00000000, %l2 = ffffffffffffffff
	ldsha	[%i6+%g0]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000030101408] = 395aa57e, %l1 = ffffffffffffffff
	lduwa	[%i4+%o4]0x81,%l1	! %l1 = 00000000395aa57e
!	Mem[0000000010001408] = 58ffff12fb191258, %l1 = 00000000395aa57e
	ldxa	[%i0+%o4]0x80,%l1	! %l1 = 58ffff12fb191258
!	Mem[00000000100c1410] = ff0000000f36e1f4, %l1 = 58ffff12fb191258
	ldxa	[%i3+%o5]0x80,%l1	! %l1 = ff0000000f36e1f4
!	Mem[0000000010101438] = 8065adb4, %l7 = 00000000ff7c00ff
	lduha	[%i4+0x03a]%asi,%l7	! %l7 = 000000000000adb4
!	Starting 10 instruction Store Burst
!	Mem[0000000010081408] = 2f000000, %l5 = 0000000000000000
	ldstuba	[%i2+%o4]0x88,%l5	! %l5 = 00000000000000ff

p0_label_130:
!	Mem[0000000010101408] = 7ea55a39, %l4 = 000000000000000d
	swapa	[%i4+%o4]0x88,%l4	! %l4 = 000000007ea55a39
!	%l2 = 00000000, %l3 = 00560000, Mem[0000000010141408] = 00000000 fb19129c
	stda	%l2,[%i5+%o4]0x88	! Mem[0000000010141408] = 00000000 00560000
!	Mem[000000001000141c] = 46109074, %l2 = 00000000, %l3 = 00560000
	add	%i0,0x1c,%g1
	casa	[%g1]0x80,%l2,%l3	! %l3 = 0000000046109074
!	Mem[00000000211c0001] = 00142346, %l0 = 0000000001ff0000
	ldstub	[%o2+0x001],%l0		! %l0 = 00000014000000ff
!	%l0 = 0000000000000014, Mem[0000000010141410] = 0dffffff
	stha	%l0,[%i5+%o5]0x88	! Mem[0000000010141410] = 0dff0014
!	%l0 = 00000014, %l1 = 0f36e1f4, Mem[0000000030041410] = 00000000 0000ff14
	stda	%l0,[%i1+%o5]0x89	! Mem[0000000030041410] = 00000014 0f36e1f4
!	%l7 = 000000000000adb4, Mem[00000000100c1408] = 9c5f0000
	stha	%l7,[%i3+%o4]0x80	! Mem[00000000100c1408] = adb40000
!	Mem[0000000010081400] = ffffffff, %l1 = ff0000000f36e1f4
	swapa	[%i2+%g0]0x80,%l1	! %l1 = 00000000ffffffff
!	Mem[0000000030081400] = 00000000, %l3 = 0000000046109074
	ldstuba	[%i2+%g0]0x89,%l3	! %l3 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081438] = 67e15ba006e3249c, %l5 = 0000000000000000
	ldxa	[%i2+0x038]%asi,%l5	! %l5 = 67e15ba006e3249c

p0_label_131:
!	Mem[0000000010001400] = 12ffffff, %l0 = 0000000000000014
	ldsba	[%i0+%g0]0x80,%l0	! %l0 = 0000000000000012
!	Mem[0000000010101408] = 0d0000000000000d, %l5 = 67e15ba006e3249c
	ldxa	[%i4+0x008]%asi,%l5	! %l5 = 0d0000000000000d
!	Mem[0000000030141408] = 00000000, %l5 = 0d0000000000000d
	lduba	[%i5+%o4]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000030041400] = 000019fb, %f16 = 0000e3ff
	lda	[%i1+%g0]0x81,%f16	! %f16 = 000019fb
!	Mem[0000000010001408] = 581219fb12ffff58, %l1 = 00000000ffffffff
	ldxa	[%i0+%o4]0x88,%l1	! %l1 = 581219fb12ffff58
!	Mem[0000000010081400] = f4e1360f, %l5 = 0000000000000000
	ldsba	[%i2+%g0]0x88,%l5	! %l5 = 000000000000000f
!	%l7 = 000000000000adb4, imm = fffffffffffff214, %l2 = 0000000000000000
	add	%l7,-0xdec,%l2		! %l2 = 0000000000009fc8
!	Mem[000000001018140c] = ffffffff, %l3 = 0000000000000000
	lduba	[%i6+0x00f]%asi,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010041400] = 58ffff12, %f29 = 000000ff
	lda	[%i1+%g0]0x80,%f29	! %f29 = 58ffff12
!	Starting 10 instruction Store Burst
!	%l2 = 0000000000009fc8, immd = fffffffffffff567, %l3 = 00000000000000ff
	sdivx	%l2,-0xa99,%l3		! %l3 = fffffffffffffff1

p0_label_132:
!	%l2 = 0000000000009fc8, Mem[00000000211c0001] = 00ff2346, %asi = 80
	stba	%l2,[%o2+0x001]%asi	! Mem[00000000211c0000] = 00c82346
!	%l2 = 0000000000009fc8, %l5 = 000000000000000f, %l3 = fffffffffffffff1
	addc	%l2,%l5,%l3		! %l3 = 0000000000009fd7
!	%l5 = 000000000000000f, Mem[0000000010141400] = 0d000000
	stha	%l5,[%i5+%g0]0x80	! Mem[0000000010141400] = 000f0000
!	Mem[0000000030101410] = ffffffff, %l2 = 0000000000009fc8
	ldstuba	[%i4+%o5]0x81,%l2	! %l2 = 000000ff000000ff
!	Mem[0000000010181402] = 4400008b, %l1 = 581219fb12ffff58
	ldstuba	[%i6+0x002]%asi,%l1	! %l1 = 00000000000000ff
!	%l0 = 00000012, %l1 = 00000000, Mem[0000000010101410] = ffffffff 0dffffff
	stda	%l0,[%i4+%o5]0x88	! Mem[0000000010101410] = 00000012 00000000
!	Mem[0000000030001400] = 00000000, %l4 = 000000007ea55a39
	swapa	[%i0+%g0]0x89,%l4	! %l4 = 0000000000000000
!	%f0  = 00000000 c7f8ffff, Mem[0000000010001400] = 12ffffff 00000000
	stda	%f0 ,[%i0+%g0]0x80	! Mem[0000000010001400] = 00000000 c7f8ffff
!	%l5 = 000000000000000f, Mem[0000000010001400] = 00000000c7f8ffff, %asi = 80
	stxa	%l5,[%i0+0x000]%asi	! Mem[0000000010001400] = 000000000000000f
!	Starting 10 instruction Load Burst
!	Mem[0000000010081418] = ffe1e06e, %l4 = 0000000000000000
	lduba	[%i2+0x01a]%asi,%l4	! %l4 = 00000000000000e0

p0_label_133:
!	Mem[00000000100c1410] = ff000000, %l6 = fffffffffffff8c7
	ldsha	[%i3+%o5]0x80,%l6	! %l6 = ffffffffffffff00
!	Mem[00000000100c1408] = 0000b4ad, %l6 = ffffffffffffff00
	lduba	[%i3+%o4]0x88,%l6	! %l6 = 00000000000000ad
!	Mem[0000000030041410] = 00000014, %l3 = 0000000000009fd7
	ldswa	[%i1+%o5]0x89,%l3	! %l3 = 0000000000000014
!	Mem[0000000010141424] = ffffff0d, %l6 = 00000000000000ad
	lduw	[%i5+0x024],%l6		! %l6 = 00000000ffffff0d
!	Mem[00000000211c0000] = 00c82346, %l0 = 0000000000000012
	ldsb	[%o2+%g0],%l0		! %l0 = 0000000000000000
!	Mem[0000000021800000] = 0bffd806, %l7 = 000000000000adb4
	lduha	[%o3+0x000]%asi,%l7	! %l7 = 0000000000000bff
!	Mem[0000000010101400] = 0000e3ffffffd404, %f28 = e89fff14 58ffff12
	ldd	[%i4+%g0],%f28		! %f28 = 0000e3ff ffffd404
!	Mem[00000000211c0000] = 00c82346, %l5 = 000000000000000f
	ldsba	[%o2+0x000]%asi,%l5	! %l5 = 0000000000000000
!	Mem[00000000100c1408] = 0000b4ad, %l0 = 0000000000000000
	ldsha	[%i3+%o4]0x88,%l0	! %l0 = ffffffffffffb4ad
!	Starting 10 instruction Store Burst
!	Mem[0000000030141408] = 00000000, %l5 = 0000000000000000
	swapa	[%i5+%o4]0x81,%l5	! %l5 = 0000000000000000

p0_label_134:
!	%l3 = 0000000000000014, Mem[0000000030041410] = 0f36e1f400000014
	stxa	%l3,[%i1+%o5]0x89	! Mem[0000000030041410] = 0000000000000014
!	Mem[0000000010001408] = 12ffff58, %l7 = 0000000000000bff
	ldstuba	[%i0+%o4]0x88,%l7	! %l7 = 00000058000000ff
!	Mem[0000000030141400] = fb191258, %l6 = 00000000ffffff0d
	swapa	[%i5+%g0]0x89,%l6	! %l6 = 00000000fb191258
!	%f0  = 00000000 c7f8ffff, Mem[0000000030081410] = 0d000000 ffe30000
	stda	%f0 ,[%i2+%o5]0x81	! Mem[0000000030081410] = 00000000 c7f8ffff
!	%l2 = 00000000000000ff, Mem[0000000010141400] = 0000000000000f00
	stxa	%l2,[%i5+%g0]0x88	! Mem[0000000010141400] = 00000000000000ff
!	%l5 = 0000000000000000, Mem[0000000020800000] = 9900d48e
	sth	%l5,[%o1+%g0]		! Mem[0000000020800000] = 0000d48e
!	%l4 = 00000000000000e0, Mem[00000000100c1408] = adb40000ffffff0d
	stx	%l4,[%i3+%o4]		! Mem[00000000100c1408] = 00000000000000e0
!	%l2 = 000000ff, %l3 = 00000014, Mem[0000000010141400] = ff000000 00000000
	stda	%l2,[%i5+%g0]0x80	! Mem[0000000010141400] = 000000ff 00000014
!	%l7 = 0000000000000058, Mem[00000000201c0000] = ffffd27d, %asi = 80
	stha	%l7,[%o0+0x000]%asi	! Mem[00000000201c0000] = 0058d27d
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = 00000000, %l6 = 00000000fb191258
	lduwa	[%i0+%o5]0x81,%l6	! %l6 = 0000000000000000

p0_label_135:
!	Mem[0000000030141408] = 00000000, %f9  = 00000000
	lda	[%i5+%o4]0x81,%f9 	! %f9 = 00000000
!	Mem[0000000010101430] = e89fff14, %l1 = 0000000000000000
	lduw	[%i4+0x030],%l1		! %l1 = 00000000e89fff14
!	Mem[000000001010143c] = ff800000, %l4 = 00000000000000e0
	ldsw	[%i4+0x03c],%l4		! %l4 = ffffffffff800000
!	Mem[0000000010101408] = 0d0000000000000d, %l5 = 0000000000000000
	ldx	[%i4+%o4],%l5		! %l5 = 0d0000000000000d
!	Mem[0000000010181400] = 4400ff8b 0000ff0d, %l6 = 00000000, %l7 = 00000058
	ldda	[%i6+%g0]0x80,%l6	! %l6 = 000000004400ff8b 000000000000ff0d
!	Mem[0000000010081408] = 00000000 2f0000ff, %l2 = 000000ff, %l3 = 00000014
	ldda	[%i2+%o4]0x88,%l2	! %l2 = 000000002f0000ff 0000000000000000
!	Mem[0000000010041408] = 00000000, %l2 = 000000002f0000ff
	ldsba	[%i1+%o4]0x88,%l2	! %l2 = 0000000000000000
!	%l4 = ffffffffff800000, immd = fffffffffffff6be, %l2 = 0000000000000000
	sdivx	%l4,-0x942,%l2		! %l2 = 0000000000000dd3
!	Mem[0000000030141410] = 00000d00, %l6 = 000000004400ff8b
	ldsha	[%i5+%o5]0x81,%l6	! %l6 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l3 = 0000000000000000, Mem[0000000010141400] = 000000ff
	stba	%l3,[%i5+%g0]0x80	! Mem[0000000010141400] = 000000ff

p0_label_136:
!	%l7 = 000000000000ff0d, Mem[0000000030181410] = 2f000000
	stwa	%l7,[%i6+%o5]0x81	! Mem[0000000030181410] = 0000ff0d
!	%l2 = 0000000000000dd3, Mem[000000001018141c] = bcffffff, %asi = 80
	stba	%l2,[%i6+0x01c]%asi	! Mem[000000001018141c] = d3ffffff
!	%f6  = 00000000 da1f4fd1, Mem[0000000010101410] = 00000012 00000000
	stda	%f6 ,[%i4+%o5]0x88	! Mem[0000000010101410] = 00000000 da1f4fd1
!	%l5 = 0d0000000000000d, Mem[0000000030041400] = fb190000
	stha	%l5,[%i1+%g0]0x89	! Mem[0000000030041400] = fb19000d
!	%l2 = 0000000000000dd3, Mem[000000001008141a] = ffe1e06e, %asi = 80
	stha	%l2,[%i2+0x01a]%asi	! Mem[0000000010081418] = ffe10dd3
!	%l7 = 000000000000ff0d, Mem[0000000030181410] = 0dff0000
	stha	%l7,[%i6+%o5]0x89	! Mem[0000000030181410] = 0dffff0d
!	%l1 = 00000000e89fff14, Mem[0000000030001408] = 0000ff01
	stwa	%l1,[%i0+%o4]0x81	! Mem[0000000030001408] = e89fff14
!	%l5 = 0d0000000000000d, Mem[0000000010001410] = 0000e3ff
	stba	%l5,[%i0+%o5]0x80	! Mem[0000000010001410] = 0d00e3ff
!	%l5 = 0d0000000000000d, Mem[00000000201c0001] = 0058d27d
	stb	%l5,[%o0+0x001]		! Mem[00000000201c0000] = 000dd27d
!	Starting 10 instruction Load Burst
!	Mem[0000000030101410] = ffffffff, %l2 = 0000000000000dd3
	ldsha	[%i4+%o5]0x89,%l2	! %l2 = ffffffffffffffff

p0_label_137:
!	Mem[0000000030101408] = 7ea55a39, %l3 = 0000000000000000
	ldsha	[%i4+%o4]0x89,%l3	! %l3 = 0000000000005a39
!	Mem[0000000030001400] = 94dba3737ea55a39, %f2  = 0d000000 7ea55a39
	ldda	[%i0+%g0]0x89,%f2 	! %f2  = 94dba373 7ea55a39
!	Mem[0000000020800000] = 0000d48e, %l7 = 000000000000ff0d
	ldub	[%o1+%g0],%l7		! %l7 = 0000000000000000
!	Mem[0000000010101408] = 0d000000, %l3 = 0000000000005a39
	ldswa	[%i4+%o4]0x80,%l3	! %l3 = 000000000d000000
!	Mem[0000000010081408] = ff00002f, %l2 = ffffffffffffffff
	lduha	[%i2+%o4]0x80,%l2	! %l2 = 000000000000ff00
!	Mem[00000000201c0000] = 000dd27d, %l2 = 000000000000ff00
	lduba	[%o0+0x000]%asi,%l2	! %l2 = 0000000000000000
	membar	#Sync			! Added by membar checker (27)
!	Mem[0000000010001400] = 00000000 0000000f ffffff12 fb191258
!	Mem[0000000010001410] = 0d00e3ff 0000000d d14fffda 46109074
!	Mem[0000000010001420] = 901ae3ff 0000db94 579dfb69 2f8b875d
!	Mem[0000000010001430] = ff9fff14 ffe3ff0d 466c4463 d14f1fda
	ldda	[%i0]ASI_BLK_P,%f16	! Block Load from 0000000010001400
!	Mem[000000001018143c] = 00000000, %f6  = 00000000
	ld	[%i6+0x03c],%f6 	! %f6 = 00000000
!	Mem[0000000030101408] = 0d0000007ea55a39, %f14 = 000080ff b4ad6580
	ldda	[%i4+%o4]0x89,%f14	! %f14 = 0d000000 7ea55a39
!	Starting 10 instruction Store Burst
!	Mem[0000000010141408] = 00000000, %l6 = 0000000000000000
	ldstuba	[%i5+%o4]0x80,%l6	! %l6 = 00000000000000ff

p0_label_138:
!	Mem[0000000010041400] = 12ffff58, %l2 = 0000000000000000
	swapa	[%i1+%g0]0x88,%l2	! %l2 = 0000000012ffff58
!	%l0 = ffffffffffffb4ad, Mem[0000000010041408] = 00000000
	stha	%l0,[%i1+%o4]0x88	! Mem[0000000010041408] = 0000b4ad
!	%l6 = 0000000000000000, Mem[0000000010101400] = 0000e3ff
	stha	%l6,[%i4+%g0]0x80	! Mem[0000000010101400] = 0000e3ff
!	%f8  = 564ce1f4 00000000, Mem[0000000010181400] = 8bff0044 0dff0000
	stda	%f8 ,[%i6+%g0]0x88	! Mem[0000000010181400] = 564ce1f4 00000000
!	Mem[0000000010141410] = 1400ff0d, %l6 = 0000000000000000
	swapa	[%i5+%o5]0x80,%l6	! %l6 = 000000001400ff0d
!	Mem[0000000030141408] = 00000000, %l1 = 00000000e89fff14
	ldstuba	[%i5+%o4]0x81,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010181408] = 2f000000, %l2 = 0000000012ffff58
	swapa	[%i6+%o4]0x80,%l2	! %l2 = 000000002f000000
!	%f8  = 564ce1f4, Mem[00000000100c1400] = 0000000d
	sta	%f8 ,[%i3+%g0]0x88	! Mem[00000000100c1400] = 564ce1f4
!	Mem[0000000010041410] = ffff0000, %l2 = 000000002f000000
	swapa	[%i1+%o5]0x80,%l2	! %l2 = 00000000ffff0000
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = ceffffff, %l1 = 0000000000000000
	ldsha	[%i2+%o4]0x89,%l1	! %l1 = ffffffffffffffff

p0_label_139:
!	Mem[0000000010041408] = adb40000000000ff, %l3 = 000000000d000000
	ldxa	[%i1+%o4]0x80,%l3	! %l3 = adb40000000000ff
!	Mem[0000000010081410] = ffffffce, %l4 = ffffffffff800000
	lduha	[%i2+%o5]0x80,%l4	! %l4 = 000000000000ffff
!	%f10 = 0000e3ff, %f6  = 00000000, %f7  = da1f4fd1
	fadds	%f10,%f6 ,%f7 		! %l0 = ffffffffffffb4cf, Unfinished, %fsr = 1100000000
!	Mem[0000000010181400] = 00000000f4e14c56, %l4 = 000000000000ffff
	ldxa	[%i6+0x000]%asi,%l4	! %l4 = 00000000f4e14c56
!	Mem[0000000030001408] = e89fff14, %l4 = 00000000f4e14c56
	lduba	[%i0+%o4]0x81,%l4	! %l4 = 00000000000000e8
!	Mem[0000000010101400] = 04d4ffffffe30000, %f6  = 00000000 da1f4fd1
	ldda	[%i4+%g0]0x88,%f6 	! %f6  = 04d4ffff ffe30000
!	Mem[00000000211c0000] = 00c82346, %l3 = adb40000000000ff
	lduh	[%o2+%g0],%l3		! %l3 = 00000000000000c8
!	Mem[0000000020800040] = ffe12a9b, %l2 = 00000000ffff0000
	lduba	[%o1+0x041]%asi,%l2	! %l2 = 00000000000000e1
!	Mem[0000000030181400] = 00000000, %l0 = ffffffffffffb4cf
	ldswa	[%i6+%g0]0x81,%l0	! %l0 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l4 = 000000e8, %l5 = 0000000d, Mem[0000000030141410] = 000d0000 0000ff01
	stda	%l4,[%i5+%o5]0x89	! Mem[0000000030141410] = 000000e8 0000000d

p0_label_140:
	membar	#Sync			! Added by membar checker (28)
!	%f10 = 0000e3ff 0000000d, Mem[0000000010001400] = 00000000 0f000000
	stda	%f10,[%i0+%g0]0x88	! Mem[0000000010001400] = 0000e3ff 0000000d
!	Mem[0000000030181400] = 00000000, %l1 = ffffffffffffffff
	swapa	[%i6+%g0]0x81,%l1	! %l1 = 0000000000000000
!	%f16 = 00000000 0000000f ffffff12 fb191258
!	%f20 = 0d00e3ff 0000000d d14fffda 46109074
!	%f24 = 901ae3ff 0000db94 579dfb69 2f8b875d
!	%f28 = ff9fff14 ffe3ff0d 466c4463 d14f1fda
	stda	%f16,[%i2]ASI_BLK_AIUP	! Block Store to 0000000010081400
!	%f14 = 0d000000 7ea55a39, %l3 = 00000000000000c8
!	Mem[0000000010141400] = 000000ff00000014
	stda	%f14,[%i5+%l3]ASI_PST16_P ! Mem[0000000010141400] = 0d0000ff00000014
!	Mem[0000000010041410] = 2f000000, %l6 = 000000001400ff0d
	ldstuba	[%i1+%o5]0x80,%l6	! %l6 = 0000002f000000ff
!	Mem[0000000030041408] = e89fff14, %l1 = 0000000000000000
	ldstuba	[%i1+%o4]0x89,%l1	! %l1 = 00000014000000ff
!	%l6 = 0000002f, %l7 = 00000000, Mem[00000000300c1410] = cec1ffff ca43c301
	stda	%l6,[%i3+%o5]0x81	! Mem[00000000300c1410] = 0000002f 00000000
!	Mem[0000000021800001] = 0bffd806, %l7 = 0000000000000000
	ldstuba	[%o3+0x001]%asi,%l7	! %l7 = 000000ff000000ff
!	%l7 = 00000000000000ff, Mem[0000000010081410] = 0d000000ffe3000d
	stxa	%l7,[%i2+%o5]0x88	! Mem[0000000010081410] = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = 5f5f0000, %l6 = 000000000000002f
	ldsba	[%i6+%o4]0x89,%l6	! %l6 = 0000000000000000

p0_label_141:
!	Mem[0000000030101408] = 7ea55a39, %l1 = 0000000000000014
	ldsba	[%i4+%o4]0x89,%l1	! %l1 = 0000000000000039
!	%f6  = 04d4ffff, %f7  = ffe30000, %f12 = ff000000
	fadds	%f6 ,%f7 ,%f12		! %f12 = ffe30000
!	Mem[000000001014141c] = fff8ffff, %f9  = 00000000
	lda	[%i5+0x01c]%asi,%f9 	! %f9 = fff8ffff
!	Mem[00000000201c0000] = 000dd27d, %l2 = 00000000000000e1
	lduha	[%o0+0x000]%asi,%l2	! %l2 = 000000000000000d
!	Mem[0000000030001400] = 7ea55a39, %l0 = 0000000000000000
	lduha	[%i0+%g0]0x89,%l0	! %l0 = 0000000000005a39
!	Mem[0000000010001408] = 12ffffff, %l6 = 0000000000000000
	lduha	[%i0+%o4]0x88,%l6	! %l6 = 000000000000ffff
!	Mem[0000000010101400] = 0000e3ff, %l1 = 0000000000000039
	ldub	[%i4+0x001],%l1		! %l1 = 0000000000000000
!	Mem[000000001010143c] = ff800000, %l1 = 0000000000000000
	ldsba	[%i4+0x03d]%asi,%l1	! %l1 = ffffffffffffff80
!	Mem[0000000010001400] = 0000e3ff 0000000d, %l2 = 0000000d, %l3 = 000000c8
	ldda	[%i0+%g0]0x88,%l2	! %l2 = 000000000000000d 000000000000e3ff
!	Starting 10 instruction Store Burst
!	Mem[0000000010101410] = d14f1fda, %l6 = 000000000000ffff
	ldstuba	[%i4+%o5]0x80,%l6	! %l6 = 000000d1000000ff

p0_label_142:
!	%f12 = ffe30000, Mem[0000000030101410] = ffffffff
	sta	%f12,[%i4+%o5]0x81	! Mem[0000000030101410] = ffe30000
!	%f4  = 0dffffff ffffffff, %l0 = 0000000000005a39
!	Mem[00000000100c1430] = e89fff1445be3a33
	add	%i3,0x030,%g1
	stda	%f4,[%g1+%l0]ASI_PST8_PL ! Mem[00000000100c1430] = ff9fffffffff3a33
!	%f1  = c7f8ffff, Mem[0000000030181408] = 00005f5f
	sta	%f1 ,[%i6+%o4]0x81	! Mem[0000000030181408] = c7f8ffff
!	Mem[00000000300c1410] = 0000002f, %l7 = 00000000000000ff
	ldstuba	[%i3+%o5]0x81,%l7	! %l7 = 00000000000000ff
!	%l5 = 0d0000000000000d, Mem[0000000010141408] = ff000000
	stha	%l5,[%i5+%o4]0x80	! Mem[0000000010141408] = 000d0000
!	%l0 = 0000000000005a39, imm = 000000000000049d, %l5 = 0d0000000000000d
	sub	%l0,0x49d,%l5		! %l5 = 000000000000559c
!	%l6 = 00000000000000d1, Mem[0000000010181408] = 58ffff12
	stba	%l6,[%i6+%o4]0x88	! Mem[0000000010181408] = 58ffffd1
!	%l5 = 000000000000559c, Mem[00000000100c1408] = 00000000000000e0
	stxa	%l5,[%i3+%o4]0x80	! Mem[00000000100c1408] = 000000000000559c
!	%f0  = 00000000 c7f8ffff, Mem[00000000100c1438] = ee3bf804 e28fa055
	std	%f0 ,[%i3+0x038]	! Mem[00000000100c1438] = 00000000 c7f8ffff
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = 00000014, %l6 = 00000000000000d1
	ldsba	[%i1+%o5]0x89,%l6	! %l6 = 0000000000000014

p0_label_143:
!	Mem[0000000020800040] = ffe12a9b, %l4 = 00000000000000e8
	ldsh	[%o1+0x040],%l4		! %l4 = ffffffffffffffe1
	membar	#Sync			! Added by membar checker (29)
!	Mem[0000000010101400] = 0000e3ff ffffd404 0d000000 0000000d
!	Mem[0000000010101410] = ff4f1fda 00000000 d14f1fda 00000000
!	Mem[0000000010101420] = 00000000 f4e14c56 0d000000 ffe30000
!	Mem[0000000010101430] = e89fff14 000000ff 8065adb4 ff800000
	ldda	[%i4]ASI_BLK_P,%f16	! Block Load from 0000000010101400
!	Mem[0000000010141408] = 000d0000, %f12 = ffe30000
	lda	[%i5+%o4]0x80,%f12	! %f12 = 000d0000
!	Mem[0000000030041410] = 14000000, %l6 = 0000000000000014
	ldswa	[%i1+%o5]0x81,%l6	! %l6 = 0000000014000000
!	Mem[0000000010141408] = 000d0000, %l7 = 0000000000000000
	lduha	[%i5+%o4]0x80,%l7	! %l7 = 000000000000000d
!	Mem[0000000010101400] = 0000e3ff ffffd404 0d000000 0000000d
!	Mem[0000000010101410] = ff4f1fda 00000000 d14f1fda 00000000
!	Mem[0000000010101420] = 00000000 f4e14c56 0d000000 ffe30000
!	Mem[0000000010101430] = e89fff14 000000ff 8065adb4 ff800000
	ldda	[%i4]ASI_BLK_P,%f16	! Block Load from 0000000010101400
!	Mem[00000000100c1400] = 395aa57e564ce1f4, %l0 = 0000000000005a39
	ldxa	[%i3+%g0]0x88,%l0	! %l0 = 395aa57e564ce1f4
!	Mem[0000000010041410] = ff000000, %l0 = 395aa57e564ce1f4
	lduwa	[%i1+%o5]0x80,%l0	! %l0 = 00000000ff000000
!	Mem[0000000010081400] = 00000000, %l4 = ffffffffffffffe1
	lduha	[%i2+%g0]0x80,%l4	! %l4 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l6 = 14000000, %l7 = 0000000d, Mem[00000000100c1408] = 00000000 9c550000
	stda	%l6,[%i3+%o4]0x88	! Mem[00000000100c1408] = 14000000 0000000d

p0_label_144:
!	%l0 = ff000000, %l1 = ffffff80, Mem[0000000010041420] = e8000000 00000000
	stda	%l0,[%i1+0x020]%asi	! Mem[0000000010041420] = ff000000 ffffff80
!	%l3 = 000000000000e3ff, Mem[0000000030041400] = fb19000d
	stha	%l3,[%i1+%g0]0x89	! Mem[0000000030041400] = fb19e3ff
!	Mem[0000000010181410] = ffffffff, %l6 = 0000000014000000
	ldstuba	[%i6+%o5]0x88,%l6	! %l6 = 000000ff000000ff
!	%f11 = 0000000d, Mem[00000000300c1408] = 00000000
	sta	%f11,[%i3+%o4]0x89	! Mem[00000000300c1408] = 0000000d
!	%l2 = 0000000d, %l3 = 0000e3ff, Mem[0000000010041408] = 0000b4ad ff000000
	stda	%l2,[%i1+%o4]0x88	! Mem[0000000010041408] = 0000000d 0000e3ff
!	%f6  = 04d4ffff ffe30000, Mem[0000000030181400] = ffffffff ff000000
	stda	%f6 ,[%i6+%g0]0x89	! Mem[0000000030181400] = 04d4ffff ffe30000
!	Mem[0000000010101400] = 0000e3ff, %l2 = 000000000000000d
	swapa	[%i4+%g0]0x80,%l2	! %l2 = 000000000000e3ff
!	%l2 = 000000000000e3ff, Mem[00000000100c1410] = 000000ff
	stwa	%l2,[%i3+%o5]0x88	! Mem[00000000100c1410] = 0000e3ff
!	%l0 = 00000000ff000000, Mem[00000000300c1408] = 0000000d
	stwa	%l0,[%i3+%o4]0x89	! Mem[00000000300c1408] = ff000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010081418] = d14fffda, %l5 = 000000000000559c
	ldswa	[%i2+0x018]%asi,%l5	! %l5 = ffffffffd14fffda

p0_label_145:
!	Mem[0000000010181410] = ffffffff, %l1 = ffffffffffffff80
	lduba	[%i6+0x011]%asi,%l1	! %l1 = 00000000000000ff
!	%f1  = c7f8ffff, %f4  = 0dffffff, %f12 = 000d0000
	fsubs	%f1 ,%f4 ,%f12		! %f12 = c7f8ffff
!	Mem[0000000010141408] = 00000d00, %l5 = ffffffffd14fffda
	lduha	[%i5+%o4]0x88,%l5	! %l5 = 0000000000000d00
!	Mem[0000000030181410] = 0dffff0d, %l1 = 00000000000000ff
	ldsba	[%i6+%o5]0x89,%l1	! %l1 = 000000000000000d
!	Mem[0000000030041408] = e89fffff, %l5 = 0000000000000d00
	lduba	[%i1+%o4]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030141408] = ff000000, %f0  = 00000000
	lda	[%i5+%o4]0x81,%f0 	! %f0 = ff000000
!	Mem[0000000030181400] = ffe30000, %l7 = 000000000000000d
	lduba	[%i6+%g0]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000030101400] = fffff8c700000000, %l1 = 000000000000000d
	ldxa	[%i4+%g0]0x81,%l1	! %l1 = fffff8c700000000
!	Mem[00000000300c1408] = 000000ff, %l2 = 000000000000e3ff
	ldsba	[%i3+%o4]0x81,%l2	! %l2 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1408] = 000000ff, %l5 = 00000000000000ff
	ldstuba	[%i3+%o4]0x81,%l5	! %l5 = 00000000000000ff

p0_label_146:
!	Mem[0000000030001400] = 7ea55a39, %l0 = 00000000ff000000
	swapa	[%i0+%g0]0x89,%l0	! %l0 = 000000007ea55a39
!	%l6 = 000000ff, %l7 = 00000000, Mem[0000000010001410] = ffe3000d 0d000000
	stda	%l6,[%i0+%o5]0x88	! Mem[0000000010001410] = 000000ff 00000000
!	%l7 = 0000000000000000, Mem[0000000030181400] = ffe30000
	stwa	%l7,[%i6+%g0]0x89	! Mem[0000000030181400] = 00000000
!	%l3 = 000000000000e3ff, Mem[0000000030101408] = 395aa57e
	stba	%l3,[%i4+%o4]0x81	! Mem[0000000030101408] = ff5aa57e
!	%l5 = 0000000000000000, imm = fffffffffffff23b, %l5 = 0000000000000000
	sub	%l5,-0xdc5,%l5		! %l5 = 0000000000000dc5
!	%l7 = 0000000000000000, Mem[00000000100c1400] = 564ce1f4
	stwa	%l7,[%i3+%g0]0x88	! Mem[00000000100c1400] = 00000000
!	%l1 = fffff8c700000000, Mem[0000000030101400] = 00000000c7f8ffff
	stxa	%l1,[%i4+%g0]0x89	! Mem[0000000030101400] = fffff8c700000000
!	%l5 = 0000000000000dc5, Mem[00000000211c0001] = 00c82346, %asi = 80
	stba	%l5,[%o2+0x001]%asi	! Mem[00000000211c0000] = 00c52346
!	Mem[00000000100c1400] = 00000000, %l2 = 0000000000000000
	swapa	[%i3+%g0]0x80,%l2	! %l2 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = ff5aa57e, %f15 = 7ea55a39
	lda	[%i4+%o4]0x81,%f15	! %f15 = ff5aa57e

p0_label_147:
!	Mem[0000000010141400] = 14000000ff00000d, %l1 = fffff8c700000000
	ldxa	[%i5+%g0]0x88,%l1	! %l1 = 14000000ff00000d
!	Mem[0000000030181410] = 0dffff0d, %l0 = 000000007ea55a39
	ldsba	[%i6+%o5]0x89,%l0	! %l0 = 000000000000000d
!	Mem[0000000010041410] = ff000000, %l4 = 0000000000000000
	lduha	[%i1+%o5]0x80,%l4	! %l4 = 000000000000ff00
!	Mem[00000000100c1410] = ffe30000, %l1 = 14000000ff00000d
	ldsha	[%i3+%o5]0x80,%l1	! %l1 = ffffffffffffffe3
!	Mem[0000000010141434] = 06e3359c, %l6 = 00000000000000ff
	ldstuba	[%i5+0x034]%asi,%l6	! %l6 = 00000006000000ff
!	Mem[0000000010101410] = ff4f1fda, %l5 = 0000000000000dc5
	ldswa	[%i4+%o5]0x80,%l5	! %l5 = ffffffffff4f1fda
!	Mem[00000000201c0000] = 000dd27d, %l6 = 0000000000000006
	lduba	[%o0+0x001]%asi,%l6	! %l6 = 000000000000000d
!	Mem[0000000010081428] = 579dfb69, %f23 = 00000000
	lda	[%i2+0x028]%asi,%f23	! %f23 = 579dfb69
!	%l4 = 000000000000ff00, %l5 = ffffffffff4f1fda, %l6 = 000000000000000d
	xor	%l4,%l5,%l6		! %l6 = ffffffffff4fe0da
!	Starting 10 instruction Store Burst
!	%l0 = 0000000d, %l1 = ffffffe3, Mem[00000000300c1408] = ff0000ff 00000056
	stda	%l0,[%i3+%o4]0x81	! Mem[00000000300c1408] = 0000000d ffffffe3

p0_label_148:
!	%l0 = 000000000000000d, Mem[00000000300c1408] = 0000000d
	stba	%l0,[%i3+%o4]0x81	! Mem[00000000300c1408] = 0d00000d
!	%l4 = 000000000000ff00, imm = 0000000000000534, %l1 = ffffffffffffffe3
	or	%l4,0x534,%l1		! %l1 = 000000000000ff34
!	%f30 = 8065adb4 ff800000, %l3 = 000000000000e3ff
!	Mem[0000000030101410] = ffe30000ffffff0d
	add	%i4,0x010,%g1
	stda	%f30,[%g1+%l3]ASI_PST32_S ! Mem[0000000030101410] = 8065adb4ff800000
!	Mem[0000000030181400] = 00000000, %l0 = 000000000000000d
	ldstuba	[%i6+%g0]0x81,%l0	! %l0 = 00000000000000ff
!	%f8  = 564ce1f4 fff8ffff, %l6 = ffffffffff4fe0da
!	Mem[00000000300c1420] = ee3bf8040000000d
	add	%i3,0x020,%g1
	stda	%f8,[%g1+%l6]ASI_PST8_SL ! Mem[00000000300c1420] = eefff8fff4004c56
!	%l0 = 0000000000000000, Mem[00000000100c1408] = 14000000
	stba	%l0,[%i3+%o4]0x88	! Mem[00000000100c1408] = 14000000
!	%l5 = ffffffffff4f1fda, Mem[0000000030181408] = fffff8c7
	stba	%l5,[%i6+%o4]0x89	! Mem[0000000030181408] = fffff8da
!	%f15 = ff5aa57e, Mem[0000000030141400] = 0dffffff
	sta	%f15,[%i5+%g0]0x81	! Mem[0000000030141400] = ff5aa57e
!	Mem[0000000030001400] = ff000000, %l6 = ffffffffff4fe0da
	swapa	[%i0+%g0]0x89,%l6	! %l6 = 00000000ff000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = 0000000d, %l4 = 000000000000ff00
	ldsha	[%i4+%g0]0x80,%l4	! %l4 = 0000000000000000

p0_label_149:
!	Mem[0000000010141400] = ff00000d, %f21 = 00000000
	lda	[%i5+%g0]0x88,%f21	! %f21 = ff00000d
!	Mem[0000000010041400] = 00000000, %l5 = ffffffffff4f1fda
	ldsba	[%i1+%g0]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000010141400] = 14000000 ff00000d, %l0 = 00000000, %l1 = 0000ff34
	ldda	[%i5+%g0]0x88,%l0	! %l0 = 00000000ff00000d 0000000014000000
!	Mem[0000000030181400] = 04d4ffff 000000ff, %l6 = ff000000, %l7 = 00000000
	ldda	[%i6+%g0]0x89,%l6	! %l6 = 00000000000000ff 0000000004d4ffff
!	Mem[0000000030181408] = daf8ffff, %l0 = 00000000ff00000d
	lduha	[%i6+%o4]0x81,%l0	! %l0 = 000000000000daf8
!	Mem[0000000010001428] = 579dfb692f8b875d, %f30 = 8065adb4 ff800000
	ldda	[%i0+0x028]%asi,%f30	! %f30 = 579dfb69 2f8b875d
!	Mem[00000000100c1408] = 00000014, %f0  = ff000000
	lda	[%i3+0x008]%asi,%f0 	! %f0 = 00000014
!	Mem[0000000010041410] = ff000000, %l4 = 0000000000000000
	ldswa	[%i1+%o5]0x80,%l4	! %l4 = ffffffffff000000
!	Mem[00000000300c1400] = ff8bdb657fffffff, %l3 = 000000000000e3ff
	ldxa	[%i3+%g0]0x81,%l3	! %l3 = ff8bdb657fffffff
!	Starting 10 instruction Store Burst
!	%l4 = ff000000, %l5 = 00000000, Mem[00000000100c1430] = ff9fffff ffff3a33
	stda	%l4,[%i3+0x030]%asi	! Mem[00000000100c1430] = ff000000 00000000

p0_label_150:
!	%l2 = 00000000, %l3 = 7fffffff, Mem[0000000010081410] = ff000000 00000000
	stda	%l2,[%i2+%o5]0x80	! Mem[0000000010081410] = 00000000 7fffffff
!	Mem[0000000030081400] = ff000000, %l2 = 0000000000000000
	swapa	[%i2+%g0]0x81,%l2	! %l2 = 00000000ff000000
!	%l4 = ff000000, %l5 = 00000000, Mem[0000000010141408] = 00000d00 00560000
	stda	%l4,[%i5+%o4]0x88	! Mem[0000000010141408] = ff000000 00000000
!	%l3 = ff8bdb657fffffff, Mem[0000000010181410] = 01c343caffffffff
	stxa	%l3,[%i6+%o5]0x88	! Mem[0000000010181410] = ff8bdb657fffffff
!	Mem[0000000030181400] = 000000ff, %l5 = 0000000000000000
	ldstuba	[%i6+%g0]0x89,%l5	! %l5 = 000000ff000000ff
!	%l3 = ff8bdb657fffffff, immed = fffff6d1, %y  = 0000ff12
	umul	%l3,-0x92f,%l6		! %l6 = 7ffffb678000092f, %y = 7ffffb67
!	%l6 = 7ffffb678000092f, Mem[0000000010081426] = 0000db94, %asi = 80
	stha	%l6,[%i2+0x026]%asi	! Mem[0000000010081424] = 0000092f
!	%l3 = ff8bdb657fffffff, Mem[0000000030141408] = ff000000
	stba	%l3,[%i5+%o4]0x81	! Mem[0000000030141408] = ff000000
!	%l1 = 0000000014000000, Mem[0000000010041410] = 0d000000000000ff
	stxa	%l1,[%i1+%o5]0x88	! Mem[0000000010041410] = 0000000014000000
!	Starting 10 instruction Load Burst
!	%f8  = 564ce1f4, Mem[0000000030041410] = 00000014
	sta	%f8 ,[%i1+%o5]0x89	! Mem[0000000030041410] = 564ce1f4

	ba,a	p0_not_taken_0_end
p0_not_taken_0:
!	The following code should not be executed
	nop
	fadds	%f20,%f29,%f14
	nop
	fdivs	%f28,%f11,%f20
	nop
	sdiv	%l0,0xdab,%l0
	ba,a	p0_branch_failed
p0_not_taken_0_end:


!	End of Random Code for Thread 0

1:	membar	#Sync			! Force all stores to complete


!	Check Registers

p0_check_registers:
	set	p0_expected_registers,%g1
	ldx	[%g1+0x000],%g2
	cmp	%l0,%g2			! %l0 should be 000000000000daf8
	bne,a,pn %xcc,p0_reg_l0_fail
	mov	%l0,%g3
	ldx	[%g1+0x008],%g2
	cmp	%l1,%g2			! %l1 should be 0000000014000000
	bne,a,pn %xcc,p0_reg_l1_fail
	mov	%l1,%g3
	ldx	[%g1+0x010],%g2
	cmp	%l2,%g2			! %l2 should be 00000000ff000000
	bne,a,pn %xcc,p0_reg_l2_fail
	mov	%l2,%g3
	ldx	[%g1+0x018],%g2
	cmp	%l3,%g2			! %l3 should be ff8bdb657fffffff
	bne,a,pn %xcc,p0_reg_l3_fail
	mov	%l3,%g3
	ldx	[%g1+0x020],%g2
	cmp	%l4,%g2			! %l4 should be ffffffffff000000
	bne,a,pn %xcc,p0_reg_l4_fail
	mov	%l4,%g3
	ldx	[%g1+0x028],%g2
	cmp	%l5,%g2			! %l5 should be 00000000000000ff
	bne,a,pn %xcc,p0_reg_l5_fail
	mov	%l5,%g3
	ldx	[%g1+0x030],%g2
	cmp	%l6,%g2			! %l6 should be 7ffffb678000092f
	bne,a,pn %xcc,p0_reg_l6_fail
	mov	%l6,%g3
	ldx	[%g1+0x038],%g2
	cmp	%l7,%g2			! %l7 should be 0000000004d4ffff
	bne,a,pn %xcc,p0_reg_l7_fail
	mov	%l7,%g3

!	Check %y register

	set	0x7ffffb67,%g2
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
	cmp	%l0,%l1			! %f0  should be 00000014 c7f8ffff
	bne	%xcc,p0_f0_fail
	std	%f2,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x08],%l0
	cmp	%l0,%l1			! %f2  should be 94dba373 7ea55a39
	bne	%xcc,p0_f2_fail
	std	%f4,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x10],%l0
	cmp	%l0,%l1			! %f4  should be 0dffffff ffffffff
	bne	%xcc,p0_f4_fail
	std	%f6,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x18],%l0
	cmp	%l0,%l1			! %f6  should be 04d4ffff ffe30000
	bne	%xcc,p0_f6_fail
	std	%f8,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x20],%l0
	cmp	%l0,%l1			! %f8  should be 564ce1f4 fff8ffff
	bne	%xcc,p0_f8_fail
	std	%f10,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x28],%l0
	cmp	%l0,%l1			! %f10 should be 0000e3ff 0000000d
	bne	%xcc,p0_f10_fail
	std	%f12,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x30],%l0
	cmp	%l0,%l1			! %f12 should be c7f8ffff 14ff9fe8
	bne	%xcc,p0_f12_fail
	std	%f14,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x38],%l0
	cmp	%l0,%l1			! %f14 should be 0d000000 ff5aa57e
	bne	%xcc,p0_f14_fail
	std	%f16,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x40],%l0
	cmp	%l0,%l1			! %f16 should be 0000e3ff ffffd404
	bne	%xcc,p0_f16_fail
	std	%f18,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x48],%l0
	cmp	%l0,%l1			! %f18 should be 0d000000 0000000d
	bne	%xcc,p0_f18_fail
	std	%f20,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x50],%l0
	cmp	%l0,%l1			! %f20 should be ff4f1fda ff00000d
	bne	%xcc,p0_f20_fail
	std	%f22,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x58],%l0
	cmp	%l0,%l1			! %f22 should be d14f1fda 579dfb69
	bne	%xcc,p0_f22_fail
	std	%f24,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x60],%l0
	cmp	%l0,%l1			! %f24 should be 00000000 f4e14c56
	bne	%xcc,p0_f24_fail
	std	%f26,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x68],%l0
	cmp	%l0,%l1			! %f26 should be 0d000000 ffe30000
	bne	%xcc,p0_f26_fail
	std	%f28,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x70],%l0
	cmp	%l0,%l1			! %f28 should be e89fff14 000000ff
	bne	%xcc,p0_f28_fail
	std	%f30,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x78],%l0
	cmp	%l0,%l1			! %f30 should be 579dfb69 2f8b875d
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
	udivx	%l6,0x970,%l0
	andn	%l5,-0x96d,%l0
	xor	%l1,%l0,%l1
	or	%l5,%l6,%l6
	ldstuba	[%i5+%o5]ASI_AS_IF_USER_PRIMARY,%l7	! Mem[0000000010141410]
	done

p0_trap1o:
	udivx	%l6,0x970,%l0
	andn	%l5,-0x96d,%l0
	xor	%l1,%l0,%l1
	or	%l5,%l6,%l6
	ldstuba	[%o5+%i5]ASI_AS_IF_USER_PRIMARY,%l7	! Mem[0000000010141410]
	done


p0_trap2e:
	addc	%l6,%l6,%l0
	andn	%l4,%l2,%l4
	or	%l2,0x62e,%l7
	addc	%l3,0x12e,%l5
	sub	%l5,-0x355,%l3
	fdivs	%f4 ,%f12,%f0 
	done

p0_trap2o:
	addc	%l6,%l6,%l0
	andn	%l4,%l2,%l4
	or	%l2,0x62e,%l7
	addc	%l3,0x12e,%l5
	sub	%l5,-0x355,%l3
	fdivs	%f4 ,%f12,%f0 
	done


p0_trap3e:
	addc	%l6,%l1,%l7
	andn	%l3,%l5,%l4
	or	%l2,0xeeb,%l1
	addc	%l0,0xfd2,%l0
	or	%l5,%l1,%l7
	andn	%l1,-0x94c,%l5
	or	%l2,0xd1f,%l2
	done

p0_trap3o:
	addc	%l6,%l1,%l7
	andn	%l3,%l5,%l4
	or	%l2,0xeeb,%l1
	addc	%l0,0xfd2,%l0
	or	%l5,%l1,%l7
	andn	%l1,-0x94c,%l5
	or	%l2,0xd1f,%l2
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
	ldx	[%g1+0x000],%l0		! %l0 = ea2ec714381f37a2
	ldx	[%g1+0x008],%l1		! %l1 = 41c81128d0dccfb8
	ldx	[%g1+0x010],%l2		! %l2 = 1e74cc60119eb776
	ldx	[%g1+0x018],%l3		! %l3 = 31ba4d3224eb33d0
	ldx	[%g1+0x020],%l4		! %l4 = 6258d2dfc2b0875a
	ldx	[%g1+0x028],%l5		! %l5 = 8a349979d0e01693
	ldx	[%g1+0x030],%l6		! %l6 = 3f5bdda62581d259
	ldx	[%g1+0x038],%l7		! %l7 = 3306d4122b0214d4

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
	st	%f7 ,[%i5+0x014]	! Mem[0000000010141414]
	sub	%l3,0x9a0,%l2
	jmpl	%o7,%g0
	fdivs	%f0 ,%f14,%f13
p0_near_0_he:
	xnor	%l6,%l3,%l1
	fsubs	%f28,%f22,%f21
	fitos	%f18,%f31
	xor	%l3,-0x935,%l4
	jmpl	%o7,%g0
	fdivs	%f17,%f27,%f19
near0_b2b_h:
	orn	%l2,0x74c,%l3
	jmpl	%o7,%g0
	sdivx	%l2,0x198,%l0
near0_b2b_l:
	and	%l3,-0x015,%l2
	jmpl	%o7,%g0
	sub	%l0,%l3,%l3
user_near0_end:
	.seg	"text"
	.align	0x2000
user_near1_start:
p0_near_1_le:
	smul	%l3,%l3,%l0
	jmpl	%o7,%g0
	and	%l7,%l1,%l2
p0_near_1_he:
	fadds	%f16,%f21,%f19
	fcmps	%fcc2,%f26,%f24
	jmpl	%o7,%g0
	fmuls	%f16,%f30,%f31
near1_b2b_h:
	subc	%l7,%l3,%l5
	xor	%l3,-0x2d6,%l6
	sdivx	%l3,-0x9f4,%l6
	fsubs	%f16,%f17,%f29
	orn	%l0,0xbcb,%l6
	fsqrts	%f31,%f30
	jmpl	%o7,%g0
	addc	%l0,0x06a,%l7
near1_b2b_l:
	fdivs	%f10,%f14,%f2 
	smul	%l1,%l0,%l6
	or	%l1,%l7,%l7
	fadds	%f4 ,%f11,%f2 
	and	%l7,0xb59,%l3
	mulx	%l1,%l7,%l3
	jmpl	%o7,%g0
	andn	%l3,-0x0a4,%l5
user_near1_end:
	.seg	"text"
	.align	0x2000
user_near2_start:
p0_near_2_le:
	fsqrts	%f1 ,%f4 
	smul	%l1,%l5,%l5
	mulx	%l1,0x6a4,%l4
	ldub	[%i4+0x010],%l5		! Mem[0000000010101410]
	jmpl	%o7,%g0
	mulx	%l3,%l1,%l7
p0_near_2_he:
	jmpl	%o7,%g0
	fsqrts	%f17,%f19
	jmpl	%o7,%g0
	nop
near2_b2b_h:
	mulx	%l7,0x530,%l6
	andn	%l5,%l2,%l3
	addc	%l3,%l3,%l1
	xor	%l6,-0x0f6,%l3
	jmpl	%o7,%g0
	addc	%l7,-0xfd6,%l0
near2_b2b_l:
	orn	%l3,0x414,%l1
	orn	%l1,%l1,%l4
	fcmps	%fcc2,%f5 ,%f10
	fdivs	%f10,%f11,%f2 
	jmpl	%o7,%g0
	fdivs	%f3 ,%f13,%f9 
user_near2_end:
	.seg	"text"
	.align	0x2000
user_near3_start:
p0_near_3_le:
	jmpl	%o7,%g0
	add	%l2,-0xb79,%l6
	jmpl	%o7,%g0
	nop
p0_near_3_he:
	xor	%l0,%l4,%l5
	stb	%l5,[%i5+0x00f]		! Mem[000000001014140f]
	xnor	%l5,-0x920,%l3
	jmpl	%o7,%g0
	subc	%l4,-0x064,%l4
near3_b2b_h:
	smul	%l4,%l5,%l5
	mulx	%l1,%l0,%l2
	andn	%l1,%l1,%l6
	fsubs	%f28,%f24,%f25
	smul	%l7,-0xa73,%l6
	fmuls	%f20,%f27,%f24
	sdivx	%l3,%l6,%l2
	jmpl	%o7,%g0
	smul	%l1,-0xa1e,%l2
near3_b2b_l:
	fadds	%f11,%f0 ,%f1 
	sub	%l5,%l4,%l5
	xor	%l7,%l2,%l2
	or	%l3,-0xb2b,%l3
	fsubs	%f5 ,%f8 ,%f12
	xor	%l4,0x388,%l4
	sub	%l6,0xd8b,%l1
	jmpl	%o7,%g0
	smul	%l6,0x59b,%l1
user_near3_end:
	.seg	"text"
	.text
	.align	0x2000
user_far0_start:
p0_far_0_le:
	fsubs	%f14,%f7 ,%f4 
	jmpl	%o7,%g0
	fdivs	%f4 ,%f13,%f13
p0_far_0_lem:
	fsubs	%f14,%f7 ,%f4 
	jmpl	%o7,%g0
	fdivs	%f4 ,%f13,%f13
p0_far_0_he:
	andn	%l7,%l4,%l2
	fsubs	%f31,%f25,%f25
	fsubs	%f21,%f20,%f17
	addc	%l0,-0x974,%l7
	xor	%l0,-0xcd6,%l1
	fcmps	%fcc3,%f19,%f29
	jmpl	%o7,%g0
	xor	%l3,0x041,%l5
p0_far_0_hem:
	andn	%l7,%l4,%l2
	fsubs	%f31,%f25,%f25
	fsubs	%f21,%f20,%f17
	addc	%l0,-0x974,%l7
	xor	%l0,-0xcd6,%l1
	fcmps	%fcc3,%f19,%f29
	jmpl	%o7,%g0
	xor	%l3,0x041,%l5
p0_loop_branch_0:
	jmpl	%o7+12,%g0
	add	%l0,1,%l0
far0_b2b_h:
	and	%l6,-0xd1c,%l3
	udivx	%l7,0x8ad,%l1
	fadds	%f17,%f17,%f22
	addc	%l2,-0xccf,%l7
	or	%l6,-0x53d,%l5
	jmpl	%o7,%g0
	or	%l0,-0xfe4,%l7
far0_b2b_l:
	smul	%l6,%l6,%l4
	and	%l5,%l6,%l3
	sdivx	%l0,0x290,%l0
	xor	%l5,%l3,%l1
	fdivs	%f2 ,%f11,%f9 
	jmpl	%o7,%g0
	umul	%l6,-0x546,%l6
user_far0_end:
	.seg	"text"
	.text
	.align	0x2000
user_far1_start:
p0_far_1_le:
	umul	%l0,-0xd52,%l6
	and	%l1,0xf14,%l2
	jmpl	%o7,%g0
	fdtos	%f6 ,%f4 
p0_far_1_lem:
	umul	%l0,-0xd52,%l6
	and	%l1,0xf14,%l2
	jmpl	%o7,%g0
	fdtos	%f6 ,%f4 
p0_far_1_he:
	mulx	%l3,%l6,%l7
	fdivs	%f28,%f22,%f28
	sdivx	%l5,%l4,%l1
	fsqrts	%f16,%f25
	add	%l3,%l2,%l7
	add	%l0,-0x921,%l5
	mulx	%l5,-0x931,%l1
	jmpl	%o7,%g0
	orn	%l5,%l4,%l2
p0_far_1_hem:
	mulx	%l3,%l6,%l7
	fdivs	%f28,%f22,%f28
	sdivx	%l5,%l4,%l1
	fsqrts	%f16,%f25
	add	%l3,%l2,%l7
	add	%l0,-0x921,%l5
	mulx	%l5,-0x931,%l1
	jmpl	%o7,%g0
	orn	%l5,%l4,%l2
p0_loop_branch_1:
	jmpl	%o7+12,%g0
	add	%l0,2,%l0
far1_b2b_h:
	fadds	%f22,%f20,%f31
	andn	%l7,%l3,%l7
	jmpl	%o7,%g0
	andn	%l0,0xb4b,%l2
far1_b2b_l:
	addc	%l4,-0x4ba,%l2
	fmuls	%f0 ,%f5 ,%f2 
	jmpl	%o7,%g0
	mulx	%l0,%l6,%l3
user_far1_end:
	.seg	"text"
	.text
	.align	0x2000
user_far2_start:
p0_far_2_le:
	fcmps	%fcc1,%f7 ,%f0 
	ldsh	[%i1+0x01a],%l7		! Mem[000000001004141a]
	fcmps	%fcc1,%f12,%f7 
	fdivs	%f12,%f7 ,%f5 
	and	%l2,%l4,%l7
	xnor	%l6,%l5,%l4
	jmpl	%o7,%g0
	fdivs	%f15,%f5 ,%f3 
p0_far_2_lem:
	fcmps	%fcc1,%f7 ,%f0 
	membar	#Sync
	ldsh	[%i1+0x01a],%l7		! Mem[000000001004141a]
	fcmps	%fcc1,%f12,%f7 
	fdivs	%f12,%f7 ,%f5 
	and	%l2,%l4,%l7
	xnor	%l6,%l5,%l4
	jmpl	%o7,%g0
	fdivs	%f15,%f5 ,%f3 
p0_far_2_he:
	orn	%l2,%l5,%l3
	mulx	%l6,0xf09,%l6
	xor	%l6,-0x896,%l0
	fdivs	%f24,%f23,%f19
	jmpl	%o7,%g0
	xor	%l5,%l6,%l5
p0_far_2_hem:
	orn	%l2,%l5,%l3
	mulx	%l6,0xf09,%l6
	xor	%l6,-0x896,%l0
	fdivs	%f24,%f23,%f19
	jmpl	%o7,%g0
	xor	%l5,%l6,%l5
p0_loop_branch_2:
	jmpl	%o7+12,%g0
	add	%l0,3,%l0
far2_b2b_h:
	fcmps	%fcc2,%f25,%f21
	sub	%l2,0x2a0,%l4
	xnor	%l5,-0xcae,%l5
	fmuls	%f25,%f22,%f29
	jmpl	%o7,%g0
	xnor	%l2,%l1,%l5
far2_b2b_l:
	xor	%l0,%l5,%l4
	fmuls	%f0 ,%f1 ,%f12
	addc	%l7,0x4aa,%l2
	fsubs	%f14,%f2 ,%f0 
	jmpl	%o7,%g0
	smul	%l0,-0xedf,%l3
user_far2_end:
	.seg	"text"
	.text
	.align	0x2000
user_far3_start:
p0_far_3_le:
	orn	%l1,-0xa1d,%l1
	jmpl	%o7,%g0
	sdivx	%l7,-0xa2d,%l6
p0_far_3_lem:
	orn	%l1,-0xa1d,%l1
	jmpl	%o7,%g0
	sdivx	%l7,-0xa2d,%l6
p0_far_3_he:
	sdivx	%l2,%l6,%l2
	fsqrts	%f25,%f26
	or	%l4,%l0,%l3
	swap	[%i4+0x004],%l0		! Mem[0000000010101404]
	jmpl	%o7,%g0
	fsubs	%f28,%f25,%f21
p0_far_3_hem:
	sdivx	%l2,%l6,%l2
	fsqrts	%f25,%f26
	or	%l4,%l0,%l3
	membar	#Sync
	swap	[%i4+0x004],%l0		! Mem[0000000010101404]
	jmpl	%o7,%g0
	fsubs	%f28,%f25,%f21
p0_loop_branch_3:
	jmpl	%o7+12,%g0
	add	%l0,4,%l0
far3_b2b_h:
	sub	%l2,%l3,%l6
	fdivs	%f23,%f28,%f18
	fsubs	%f29,%f31,%f19
	xnor	%l4,-0xfcd,%l7
	orn	%l3,0x724,%l4
	orn	%l5,%l3,%l6
	jmpl	%o7,%g0
	fcmps	%fcc1,%f19,%f28
far3_b2b_l:
	sub	%l7,-0xe60,%l2
	subc	%l0,%l1,%l2
	add	%l6,%l0,%l7
	fadds	%f0 ,%f13,%f9 
	sdivx	%l2,-0x200,%l1
	andn	%l0,-0x608,%l0
	jmpl	%o7,%g0
	and	%l3,0xf2d,%l4
user_far3_end:
	.seg	"text"
	.align	0x2000
user_jump0_start:
	INIT_MEM(0, 0x0010, 1, +, 0, +, 0)
p0_jmpl_0_le:
	orn	%l4,%l0,%l5
	fsubs	%f6 ,%f9 ,%f6 
	jmpl	%g6+8,%g0
	addc	%l2,0xfee,%l1
p0_call_0_le:
	fmuls	%f1 ,%f3 ,%f9 
	xnor	%l2,%l2,%l7
	fdivs	%f3 ,%f1 ,%f10
	ldstub	[%i4+0x01b],%l4		! Mem[000000001010141b]
	udivx	%l3,%l3,%l2
	or	%l5,0x030,%l2
	retl
	fdivs	%f15,%f2 ,%f0 
p0_jmpl_0_lo:
	orn	%l4,%l0,%l5
	fsubs	%f6 ,%f9 ,%f6 
	jmpl	%g6+8,%g0
	addc	%l2,0xfee,%l1
p0_call_0_lo:
	fmuls	%f1 ,%f3 ,%f9 
	xnor	%l2,%l2,%l7
	fdivs	%f3 ,%f1 ,%f10
	ldstub	[%o4+0x01b],%l4		! Mem[000000001010141b]
	udivx	%l3,%l3,%l2
	or	%l5,0x030,%l2
	retl
	fdivs	%f15,%f2 ,%f0 
p0_jmpl_0_he:
	subc	%l1,-0x60a,%l6
	fadds	%f22,%f23,%f19
	smul	%l7,%l7,%l6
	jmpl	%g6+8,%g0
	fsubs	%f25,%f26,%f27
p0_call_0_he:
	fadds	%f23,%f26,%f20
	udivx	%l4,0xce2,%l2
	udivx	%l0,%l6,%l5
	udivx	%l7,-0x49b,%l3
	mulx	%l2,%l0,%l0
	udivx	%l0,%l4,%l7
	umul	%l0,%l6,%l2
	retl
	smul	%l7,%l1,%l3
p0_jmpl_0_ho:
	subc	%l1,-0x60a,%l6
	fadds	%f22,%f23,%f19
	smul	%l7,%l7,%l6
	jmpl	%g6+8,%g0
	fsubs	%f25,%f26,%f27
p0_call_0_ho:
	fadds	%f23,%f26,%f20
	udivx	%l4,0xce2,%l2
	udivx	%l0,%l6,%l5
	udivx	%l7,-0x49b,%l3
	mulx	%l2,%l0,%l0
	udivx	%l0,%l4,%l7
	umul	%l0,%l6,%l2
	retl
	smul	%l7,%l1,%l3
user_jump0_end:
	.seg	"text"
	.align	0x2000
user_jump1_start:
	INIT_MEM(0, 0x0020, 1, +, 0, +, 0)
p0_jmpl_1_le:
	fdivs	%f9 ,%f0 ,%f3 
	ldsh	[%i5+0x02a],%l7		! Mem[000000001014142a]
	fsqrts	%f11,%f10
	jmpl	%g6+8,%g0
	andn	%l7,-0x395,%l2
p0_call_1_le:
	sub	%l0,-0x7e9,%l0
	fmuls	%f4 ,%f8 ,%f1 
	retl
	addc	%l6,0xdbd,%l4
p0_jmpl_1_lo:
	fdivs	%f9 ,%f0 ,%f3 
	ldsh	[%o5+0x02a],%l7		! Mem[000000001014142a]
	fsqrts	%f11,%f10
	jmpl	%g6+8,%g0
	andn	%l7,-0x395,%l2
p0_call_1_lo:
	sub	%l0,-0x7e9,%l0
	fmuls	%f4 ,%f8 ,%f1 
	retl
	addc	%l6,0xdbd,%l4
p0_jmpl_1_he:
	fsubs	%f26,%f23,%f24
	jmpl	%g6+8,%g0
	udivx	%l5,%l5,%l5
p0_call_1_he:
	fadds	%f27,%f19,%f17
	retl
	addc	%l0,-0xe10,%l5
p0_jmpl_1_ho:
	fsubs	%f26,%f23,%f24
	jmpl	%g6+8,%g0
	udivx	%l5,%l5,%l5
p0_call_1_ho:
	fadds	%f27,%f19,%f17
	retl
	addc	%l0,-0xe10,%l5
user_jump1_end:
	.seg	"text"
	.align	0x2000
user_jump2_start:
	INIT_MEM(0, 0x0030, 1, +, 0, +, 0)
p0_jmpl_2_le:
	sdivx	%l3,-0x1e9,%l5
	fsqrts	%f2 ,%f14
	sdivx	%l1,0xbc2,%l3
	jmpl	%g6+8,%g0
	fsubs	%f12,%f3 ,%f1 
p0_call_2_le:
	ldd	[%i6+0x038],%f0 	! Mem[0000000010181438]
	retl
	add	%l4,%l7,%l5
p0_jmpl_2_lo:
	sdivx	%l3,-0x1e9,%l5
	fsqrts	%f2 ,%f14
	sdivx	%l1,0xbc2,%l3
	jmpl	%g6+8,%g0
	fsubs	%f12,%f3 ,%f1 
p0_call_2_lo:
	ldd	[%o6+0x038],%f0 	! Mem[0000000010181438]
	retl
	add	%l4,%l7,%l5
p0_jmpl_2_he:
	fsubs	%f23,%f28,%f20
	fsubs	%f26,%f23,%f28
	orn	%l6,%l4,%l0
	jmpl	%g6+8,%g0
	fmuls	%f25,%f24,%f26
p0_call_2_he:
	stw	%l4,[%i4+0x004]		! Mem[0000000010101404]
	retl
	fmuls	%f28,%f21,%f28
p0_jmpl_2_ho:
	fsubs	%f23,%f28,%f20
	fsubs	%f26,%f23,%f28
	orn	%l6,%l4,%l0
	jmpl	%g6+8,%g0
	fmuls	%f25,%f24,%f26
p0_call_2_ho:
	stw	%l4,[%o4+0x004]		! Mem[0000000010101404]
	retl
	fmuls	%f28,%f21,%f28
user_jump2_end:
	.seg	"text"
	.align	0x2000
user_jump3_start:
	INIT_MEM(0, 0x0040, 1, +, 0, +, 0)
p0_jmpl_3_le:
	fdivs	%f0 ,%f8 ,%f9 
	mulx	%l4,%l1,%l1
	and	%l2,%l2,%l0
	orn	%l5,-0x191,%l0
	jmpl	%g6+8,%g0
	mulx	%l4,%l0,%l3
p0_call_3_le:
	smul	%l2,0xd0c,%l1
	retl
	smul	%l2,-0x984,%l5
p0_jmpl_3_lo:
	fdivs	%f0 ,%f8 ,%f9 
	mulx	%l4,%l1,%l1
	and	%l2,%l2,%l0
	orn	%l5,-0x191,%l0
	jmpl	%g6+8,%g0
	mulx	%l4,%l0,%l3
p0_call_3_lo:
	smul	%l2,0xd0c,%l1
	retl
	smul	%l2,-0x984,%l5
p0_jmpl_3_he:
	st	%f28,[%i3+0x034]	! Mem[00000000100c1434]
	xnor	%l7,%l7,%l2
	jmpl	%g6+8,%g0
	subc	%l0,-0x02a,%l6
p0_call_3_he:
	xnor	%l7,0xed8,%l6
	fsqrts	%f17,%f18
	umul	%l6,%l5,%l6
	umul	%l1,-0x1a7,%l5
	ldub	[%i4+0x036],%l6		! Mem[0000000010101436]
	retl
	mulx	%l5,-0x27a,%l5
p0_jmpl_3_ho:
	st	%f28,[%o3+0x034]	! Mem[00000000100c1434]
	xnor	%l7,%l7,%l2
	jmpl	%g6+8,%g0
	subc	%l0,-0x02a,%l6
p0_call_3_ho:
	xnor	%l7,0xed8,%l6
	fsqrts	%f17,%f18
	umul	%l6,%l5,%l6
	umul	%l1,-0x1a7,%l5
	ldub	[%o4+0x036],%l6		! Mem[0000000010101436]
	retl
	mulx	%l5,-0x27a,%l5
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
	.word	0xea2ec714,0x381f37a2		! Init value for %l0
	.word	0x41c81128,0xd0dccfb8		! Init value for %l1
	.word	0x1e74cc60,0x119eb776		! Init value for %l2
	.word	0x31ba4d32,0x24eb33d0		! Init value for %l3
	.word	0x6258d2df,0xc2b0875a		! Init value for %l4
	.word	0x8a349979,0xd0e01693		! Init value for %l5
	.word	0x3f5bdda6,0x2581d259		! Init value for %l6
	.word	0x3306d412,0x2b0214d4		! Init value for %l7
	.align	64
p0_init_freg:
	.word	0xbb39f194,0x50da037b		! Init value for %f0 
	.word	0x4ca345a9,0x0ce5a2fe		! Init value for %f2 
	.word	0xdeb58b8c,0xc0731d1f		! Init value for %f4 
	.word	0x194fb118,0x3d26d9f2		! Init value for %f6 
	.word	0x8e91a4b5,0xab0475bb		! Init value for %f8 
	.word	0x9ed29eb3,0x5645af12		! Init value for %f10
	.word	0xb5eb03d4,0x9b090905		! Init value for %f12
	.word	0x7a906651,0x0aad7812		! Init value for %f14
	.word	0x65af5b19,0xf975d25e		! Init value for %f16
	.word	0xb8a4f35c,0xe6689720		! Init value for %f18
	.word	0xaeceb108,0xc3d97b6f		! Init value for %f20
	.word	0x4a6d6276,0x77cebcc5		! Init value for %f22
	.word	0xa226b52a,0x6bcc8e3c		! Init value for %f24
	.word	0x5ddf2b10,0xfe453ffd		! Init value for %f26
	.word	0x29b8bca0,0x3895a976		! Init value for %f28
	.word	0xfe120093,0x73a028f7		! Init value for %f30
	.word	0xf4126596,0x1e574e0f		! Init value for %f32
	.word	0xa1e72352,0x4492779a		! Init value for %f34
	.word	0x15f979ce,0xf445ee5b		! Init value for %f36
	.word	0x847db64b,0x0377978f		! Init value for %f38
	.word	0x3ccc1f01,0x56157e93		! Init value for %f40
	.word	0x324010da,0x3b7fc135		! Init value for %f42
	.word	0x389c30f2,0xd4e18a2c		! Init value for %f44
	.word	0x9c11db14,0xc65b74b2		! Init value for %f46
	.word	0x6b112798,0xeca7933d
	.word	0x481b2b90,0x47ff0e25
	.word	0x2ed41742,0xabe18a63
	.word	0x52d04de0,0x987df0e3
	.word	0xe8c8579e,0xb06502f2
	.word	0xae19afa6,0x5d712d33
	.word	0x75a3f8d3,0x8d02855e
	.word	0xba5462a2,0xc3f2b9b2
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
	.word	0x00000000,0x0000daf8
	.word	0x00000000,0x14000000
	.word	0x00000000,0xff000000
	.word	0xff8bdb65,0x7fffffff
	.word	0xffffffff,0xff000000
	.word	0x00000000,0x000000ff
	.word	0x7ffffb67,0x8000092f
	.word	0x00000000,0x04d4ffff
p0_expected_fp_regs:
	.word	0x00000014,0xc7f8ffff
	.word	0x94dba373,0x7ea55a39
	.word	0x0dffffff,0xffffffff
	.word	0x04d4ffff,0xffe30000
	.word	0x564ce1f4,0xfff8ffff
	.word	0x0000e3ff,0x0000000d
	.word	0xc7f8ffff,0x14ff9fe8
	.word	0x0d000000,0xff5aa57e
	.word	0x0000e3ff,0xffffd404
	.word	0x0d000000,0x0000000d
	.word	0xff4f1fda,0xff00000d
	.word	0xd14f1fda,0x579dfb69
	.word	0x00000000,0xf4e14c56
	.word	0x0d000000,0xffe30000
	.word	0xe89fff14,0x000000ff
	.word	0x579dfb69,0x2f8b875d
	.word	0x00000011,0x00000000		! %fsr = 0000001100000000
p0_local0_expect:
	.word	0x0d000000,0xffe30000
	.word	0xffffff12,0xfb191258
	.word	0xff000000,0x00000000
	.word	0xd14fffda,0x46109074
	.word	0x901ae3ff,0x0000db94
	.word	0x579dfb69,0x2f8b875d
	.word	0xff9fff14,0xffe3ff0d
	.word	0x466c4463,0xd14f1fda
p0_local0_sec_expect:
	.word	0xdae04fff,0x73a3db94
	.word	0xe89fff14,0x01ff0000
	.word	0x00000000,0xe89fff14
	.word	0x67e15ba0,0x94bf88ab
	.word	0x776a8d5a,0xf2efa6cb
	.word	0x0034f96e,0x7d78e298
	.word	0xb5966988,0x3aae2669
	.word	0xbb8ddbca,0xcde67178
p0_local1_expect:
	.word	0x00000000,0x00000000
	.word	0x0d000000,0xffe30000
	.word	0x00000014,0x00000000
	.word	0x69fb9d57,0x12ffff58
	.word	0xff000000,0xffffff80
	.word	0x01c3c301,0x0000ff00
	.word	0x000000ff,0x04d4ffff
	.word	0xbca1ff70,0xba01ffff
p0_local1_sec_expect:
	.word	0xffe319fb,0x000000ff
	.word	0xffff9fe8,0x12ffff58
	.word	0xf4e14c56,0x00000000
	.word	0x74901046,0xda1f4fd1
	.word	0x94dba373,0xd0cb1a90
	.word	0x5d878b2f,0x69fb9d57
	.word	0x0dffe3ff,0x14ff9fe8
	.word	0x55a08fe2,0x63446c46
p0_local2_expect:
	.word	0x00000000,0x0000000f
	.word	0xffffff12,0xfb191258
	.word	0x00000000,0x7fffffff
	.word	0xd14fffda,0x46109074
	.word	0x901ae3ff,0x0000092f
	.word	0x579dfb69,0x2f8b875d
	.word	0xff9fff14,0xffe3ff0d
	.word	0x466c4463,0xd14f1fda
p0_local2_sec_expect:
	.word	0x00000000,0x000000ff
	.word	0xffffffce,0xffffff9c
	.word	0x00000000,0xc7f8ffff
	.word	0x7490e1f4,0x001f4f00
	.word	0x94dba373,0xd0cb1a90
	.word	0x5d878b2f,0x69fb9d57
	.word	0x0dffe3ff,0x14ff9fe8
	.word	0x55a08fe2,0x63446c46
p0_local3_expect:
	.word	0x00000000,0x7ea55a39
	.word	0x00000014,0x0d000000
	.word	0xffe30000,0x0f36e1f4
	.word	0xff000000,0xff8b875d
	.word	0x901acbd0,0x73a3db94
	.word	0x00000000,0x14ff9fe8
	.word	0xff000000,0x00000000
	.word	0x00000000,0xc7f8ffff
p0_local3_sec_expect:
	.word	0xff8bdb65,0x7fffffff
	.word	0x0d00000d,0xffffffe3
	.word	0xff00002f,0x00000000
	.word	0x014b43ca,0x46109074
	.word	0xeefff8ff,0xf4004c56
	.word	0x581219fb,0x06e3359c
	.word	0xe89fff14,0x45be3a33
	.word	0x00000069,0x8b472800
p0_local4_expect:
	.word	0x0000000d,0xffffd404
	.word	0x0d000000,0x0000000d
	.word	0xff4f1fda,0x00000000
	.word	0xd14f1fda,0x00000000
	.word	0x00000000,0xf4e14c56
	.word	0x0d000000,0xffe30000
	.word	0xe89fff14,0x000000ff
	.word	0x8065adb4,0xff800000
p0_local4_sec_expect:
	.word	0x00000000,0xc7f8ffff
	.word	0xff5aa57e,0x0000000d
	.word	0x8065adb4,0xff800000
	.word	0xd14f1fda,0x00000000
	.word	0x00000000,0xf4e14c56
	.word	0x0d000000,0xffe30000
	.word	0xe89fff14,0x000000ff
	.word	0x8065adb4,0xff800000
p0_local5_expect:
	.word	0x0d0000ff,0x00000014
	.word	0x000000ff,0x00000000
	.word	0x00000000,0x65db8bff
	.word	0xf044ffee,0xfff8ffff
	.word	0xffffffff,0xffffff0d
	.word	0xf804ff00,0xa2390000
	.word	0x524b7e2e,0xffe3359c
	.word	0xff7c9f24,0x45be3a33
p0_local5_sec_expect:
	.word	0xff5aa57e,0x12ffff58
	.word	0xff000000,0x00000000
	.word	0xe8000000,0x0d000000
	.word	0x014b43ca,0x4bc1655b
	.word	0x00000000,0x4c8cc301
	.word	0x581219fb,0x80000000
	.word	0x0000e3ff,0x0000000d
	.word	0x00000000,0x00000001
p0_local6_expect:
	.word	0x00000000,0xf4e14c56
	.word	0xd1ffff58,0xffffffff
	.word	0xffffff7f,0x65db8bff
	.word	0x000084e8,0xd3ffffff
	.word	0x4bc1655b,0x12ffff58
	.word	0xe89fff14,0xfe459cfd
	.word	0xee3bf804,0x06e3359c
	.word	0x00000000,0x00000000
p0_local6_sec_expect:
	.word	0xff000000,0xffffd404
	.word	0xdaf8ffff,0x06e3359c
	.word	0x0dffff0d,0x00000000
	.word	0x5bbf9ce9,0x790ab56d
	.word	0xdc03f0ee,0x43f227dc
	.word	0x01c38c4c,0xceffffff
	.word	0x7566dc8a,0x981f2e79
	.word	0x37fca4ed,0x7b5df662
share0_expect:
	.word	0x000dd27d,0x4c491045
	.word	0x3cb4eeb2,0x93a846cd
	.word	0xa5e8237b,0x9c5396b4
	.word	0x6191a967,0x5b5aa88e
	.word	0x3ee33615,0x17eaaf0f
	.word	0xaadf99b8,0x2fd21c8b
	.word	0xc1fbffd2,0x91f44d2e
	.word	0x5a7f90d3,0x1fc16987
share1_expect:
	.word	0x0000d48e,0x8bf42826
	.word	0x6e816723,0x52d986ea
	.word	0xf4991a78,0xc76fdaa2
	.word	0x65a51600,0xd69d8934
	.word	0x4225461b,0xc8d65694
	.word	0xcb79c5f5,0xbefc7d36
	.word	0x864f2644,0x1f78d8c7
	.word	0x87295774,0xc9efb308
	.word	0xffe12a9b,0xe7dbc702
	.word	0x4c0f9d81,0x36975afc
	.word	0xb58ab2cb,0xc5e6f858
	.word	0x8b697e6f,0x3e2207e1
	.word	0xdc8c7930,0xe2ffe85e
	.word	0x02584654,0x075a69ac
	.word	0xc6f47d18,0xfd796f90
	.word	0xb06532c3,0x499104ee
share2_expect:
	.word	0x00c52346,0x46200a1d
	.word	0xfef3011d,0xc1d529e0
	.word	0x2c543178,0xce0f90b3
	.word	0x7b7601c5,0xa079add1
	.word	0xdd0ec9c9,0x2d01dc7a
	.word	0x9d730fe3,0xe2185337
	.word	0xbec5db5a,0x94343ac7
	.word	0x728776a0,0x732c173c
share3_expect:
	.word	0x0bffd806,0x77b24b6e
	.word	0x7fa31932,0x16a40b6b
	.word	0x4a6e2c27,0x11e32a91
	.word	0x2784d1f3,0x712d6c41
	.word	0x37fef972,0x6f43095a
	.word	0xf8761441,0x33fc1f51
	.word	0x7d2a00b9,0xa63d9119
	.word	0xb24f0e8e,0x622b931f
	.word	0x0645a70e,0x9148f497
	.word	0x4bde613c,0xe570c4eb
	.word	0xb4003621,0x3445e6af
	.word	0x7ad53c20,0xc0094490
	.word	0xf900ecab,0x2e6c2dc8
	.word	0xa964877c,0xa3931f68
	.word	0x7e30c713,0x00d83e2e
	.word	0x31e81a17,0x23a1f816
	.word	0x7134bafb,0x948aeb07
	.word	0xf7ce3810,0x03fd3b9a
	.word	0x9b09fb6f,0xc2bfc2c5
	.word	0x5ed281f9,0x61e47b22
	.word	0x239f43c0,0x0f197531
	.word	0x2c383fe4,0xe7dac352
	.word	0x6072f41b,0x6a4c5979
	.word	0xbb30b96f,0xc29cc519
	.word	0x34ff1f7c,0x6d7714a2
	.word	0x86f9cb72,0x8ffd0ddd
	.word	0x78fa5526,0xfdecdc71
	.word	0xce88cb58,0x349f02e4
	.word	0xc141ccde,0x37b6c895
	.word	0x4834f5ce,0xc281731a
	.word	0xc66778c9,0xaf9313dd
	.word	0x17b93da2,0x1cb2bf22
	.word	0x58e8d196,0x7a1d3e8b
	.word	0x57dc5401,0x58ab088a
	.word	0xb05ede4b,0x30fe8466
	.word	0x810c8f0f,0x99dc721b
	.word	0x639ca4ff,0x3e6c7150
	.word	0xc926a1f9,0x1543ca38
	.word	0xb2eaacbd,0x1904c8fa
	.word	0x88a0e40b,0x43c8affd
	.word	0x00ff6ae1,0x74b8ca89
	.word	0xeda43eb1,0x667fd8a9
	.word	0xb06f8950,0x39d3111f
	.word	0x55de519a,0x0f40becd
	.word	0x34585ecb,0x4b44bd67
	.word	0x8219a607,0xc11bc006
	.word	0xcfcee7f4,0x94fcf323
	.word	0x7b64a59d,0xd3a1e5a0
	.word	0xffe3dde9,0xffdab440
	.word	0xe356ed7e,0x24b27f96
	.word	0xe5c598f8,0x4ea7d1ed
	.word	0x850bca4f,0xaab5a8cc
	.word	0x8f8aeab7,0xfd66ce7f
	.word	0x9f537f53,0x21c92f22
	.word	0xfe0982a6,0xa3d05bc7
	.word	0x779ad6c6,0x424262e1
	.word	0x2dff63d1,0xa11ee9c9
	.word	0x883cd3ca,0xb6d0429d
	.word	0x51837c34,0xa153fe75
	.word	0xc7dd59c5,0xab197a7e
	.word	0x77119f55,0xd2262c1b
	.word	0x8a568f84,0xd6bf864f
	.word	0x5fbbe783,0x8c7e0f4e
	.word	0xc34c54de,0x6be9e7d8
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
	.word	0xf2c3a178,0x7c582021
	.word	0x00000000,0x00000002
	.word	0xe23ffd18,0x7b0201a3
	.word	0x00000000,0x00000003
	.word	0x37ea1447,0xce6bcf35
	.word	0x00000000,0x00000004
	.word	0xc996cb08,0x4120168e
	.word	0x00000000,0x00000005
	.word	0xc25c1598,0x3e33028d
	.word	0x00000000,0x00000006
	.word	0xdcb08480,0x3dc0cc82
	.word	0x00000000,0x00000007
	.word	0x982c6360,0x56374742
	.word	0x00000000,0x00000008
	.word	0x7c8555e8,0x090ee5a7
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
	.word	0x5a12d404,0xd4481f07,0xe4f50d69,0x7500cd4c
	.word	0xa1239e75,0x0d694ce8,0x94170011,0x2a74994a
	.word	0xec82d66c,0xeb22e6a7,0xa3d688d2,0xc6cf0c11
	.word	0x82e0d056,0x891e9a2e,0xca810e26,0x73f78f6e
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
	.word	0x7f122473,0xc4fe0ea1,0x4af80201,0xbfa24376
	.word	0x33de88d9,0x6aecb8fd,0x5ea10923,0x94bf88ab
	.word	0x776a8d5a,0xf2efa6cb,0x0034f96e,0x7d78e298
	.word	0xb5966988,0x3aae2669,0xbb8ddbca,0xcde67178
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
	.word	0xe48b080d,0x27241cd9,0x099a41a6,0xf6caade5
	.word	0xc54a54ee,0xbc3dd5c9,0xadb67a0b,0x9b0b3082
	.word	0xdcfd5948,0xfc8adb11,0x043cd029,0x7d7a88ba
	.word	0x8cf6b2b0,0xfdcbd7c0,0x7f13c6bb,0x454f66d7
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
	.word	0xc2a22bd2,0x39f7b0d6,0x67e15ba0,0xfb191258
	.word	0xa204cc3f,0x4c8cc301,0x949a1396,0x8efa15af
	.word	0x901acbd0,0x73a3db94,0x579dfb69,0x56c2070a
	.word	0xc472f652,0x45be3a33,0x466c4463,0xe28fa055
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
	.word	0x8f794dbb,0xf70e364d,0x7d8a61c8,0x81c6ebca
	.word	0xbb1019c7,0x241c4fd1,0xffe1e06e,0xb059f4bc
	.word	0xe417e6c0,0xab84e8d7,0xaea8c45f,0x005c0a63
	.word	0x7447560c,0xf504ec9f,0xca434b01,0xcd4a1404
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
	.word	0xe1a9c4e1,0x14bfcbf7,0x51ca9937,0xdf9f46d0
	.word	0xd99ed06d,0x68b0e91c,0x7cd93241,0x3f652c5a
	.word	0x0abe0e68,0x8470fa4a,0x0e5482f4,0x7edddb1a
	.word	0x464683c4,0xad9e9570,0xd962302e,0xcd969e21
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
	.word	0x78008a86,0xc5333af8,0xb53a84ba,0x708da1bc
	.word	0xcc45b0c9,0x496d45a4,0x510d66b0,0x08bb918b
	.word	0x22544310,0xb6a3f8c1,0xf1b35c03,0xb5d59305
	.word	0x823ac534,0x4b632c4c,0xa3bea7c9,0x108263f2
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
	.word	0x33e0e3e6,0x04f83bee,0xd97574d3,0x956a39c8
	.word	0xf4e206e3,0x3a2107a7,0x32e37f4b,0x240d550c
	.word	0xf34151a9,0x734f7020,0xd0f6b7a8,0x57bb8b34
	.word	0x2e7a633a,0x9aec0e60,0x9ef0266e,0x8f627d13
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
	.word	0x5add8a7d,0x0ede2174,0x2b9cbb0c,0xeb7e47ce
	.word	0xeca774e9,0x17541102,0xdedca988,0x9d770e70
	.word	0x5c70165c,0xd5319f1e,0xfe837a55,0xe323a0e2
	.word	0x098556d2,0xf1abf392,0x8065adb4,0x564ce1f4
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
	.word	0x97a58b47,0xbe3c99a3,0xd3775606,0x76f42a82
	.word	0x9b000e66,0x0249d304,0x2c89c6b4,0x8e489ae0
	.word	0xa867e244,0xac25e1b5,0x4402c910,0x7f23b028
	.word	0x484d3679,0x460f79e3,0x63b1dc00,0x825be180
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
	.word	0x34570b61,0xf770809b,0xe89fff14,0xff7c9ff6
	.word	0x78ff62a3,0x5c642549,0xf04475ee,0x35112447
	.word	0x647c79a8,0xa094dd2b,0xb2057fb4,0xa2393d1c
	.word	0x524b7e2e,0x06e3359c,0xc0e9c437,0x0bd2cbf6
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
	.word	0x61f8f8ff,0x06b9895f,0x09243570,0x6f0a8dad
	.word	0xbad94550,0x2d4650ca,0x3b395801,0xd2ff7fb1
	.word	0x0540e78e,0x48c17642,0xe1207910,0x21091a31
	.word	0x468864be,0xa4e582ad,0x200597c9,0x5a1375ae
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
	.word	0xd20ab5f5,0x1947d4fb,0x126700e3,0x84e5a5f8
	.word	0x1b3398bf,0x72566df3,0x8cfee654,0xbb27216a
	.word	0x96824f21,0x142165c5,0xfd86d76b,0x798bf8f0
	.word	0xdc70e383,0xd053f9be,0xfc223141,0x7d0320f4
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
	.word	0x39fea61a,0xf17d745c,0x11b6f438,0xa1cdba11
	.word	0x21e99f37,0x1e7dab78,0x5bbf9ce9,0x790ab56d
	.word	0xdc03f0ee,0x43f227dc,0x00b3a889,0x02a8aa22
	.word	0x7566dc8a,0x981f2e79,0x37fca4ed,0x7b5df662
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
	.word	0xbb5fd27d,0x4c491045,0x3cb4eeb2,0x93a846cd
	.word	0xa5e8237b,0x9c5396b4,0x6191a967,0x5b5aa88e
	.word	0x3ee33615,0x17eaaf0f,0xaadf99b8,0x2fd21c8b
	.word	0xc1fbffd2,0x91f44d2e,0x5a7f90d3,0x1fc16987
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
	.word	0x1d39d48e,0x8bf42826,0x6e816723,0x52d986ea
	.word	0xf4991a78,0xc76fdaa2,0x65a51600,0xd69d8934
	.word	0x4225461b,0xc8d65694,0xcb79c5f5,0xbefc7d36
	.word	0x864f2644,0x1f78d8c7,0x87295774,0xc9efb308
	.word	0x08e52a9b,0xe7dbc702,0x4c0f9d81,0x36975afc
	.word	0xb58ab2cb,0xc5e6f858,0x8b697e6f,0x3e2207e1
	.word	0xdc8c7930,0xe2ffe85e,0x02584654,0x075a69ac
	.word	0xc6f47d18,0xfd796f90,0xb06532c3,0x499104ee
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
	.word	0xca052346,0x46200a1d,0xfef3011d,0xc1d529e0
	.word	0x2c543178,0xce0f90b3,0x7b7601c5,0xa079add1
	.word	0xdd0ec9c9,0x2d01dc7a,0x9d730fe3,0xe2185337
	.word	0xbec5db5a,0x94343ac7,0x728776a0,0x732c173c
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
	.word	0x0b18d806,0x77b24b6e,0x7fa31932,0x16a40b6b
	.word	0x4a6e2c27,0x11e32a91,0x2784d1f3,0x712d6c41
	.word	0x37fef972,0x6f43095a,0xf8761441,0x33fc1f51
	.word	0x7d2a00b9,0xa63d9119,0xb24f0e8e,0x622b931f
	.word	0x0645a70e,0x9148f497,0x4bde613c,0xe570c4eb
	.word	0xb4003621,0x3445e6af,0x7ad53c20,0xc0094490
	.word	0xf900ecab,0x2e6c2dc8,0xa964877c,0xa3931f68
	.word	0x7e30c713,0x00d83e2e,0x31e81a17,0x23a1f816
	.word	0x7134bafb,0x948aeb07,0xf7ce3810,0x03fd3b9a
	.word	0x9b09fb6f,0xc2bfc2c5,0x5ed281f9,0x61e47b22
	.word	0x239f43c0,0x0f197531,0x2c383fe4,0xe7dac352
	.word	0x6072f41b,0x6a4c5979,0xbb30b96f,0xc29cc519
	.word	0x34511f7c,0x6d7714a2,0x86f9cb72,0x8ffd0ddd
	.word	0x78fa5526,0xfdecdc71,0xce88cb58,0x349f02e4
	.word	0xc141ccde,0x37b6c895,0x4834f5ce,0xc281731a
	.word	0xc66778c9,0xaf9313dd,0x17b93da2,0x1cb2bf22
	.word	0xa830d196,0x7a1d3e8b,0x57dc5401,0x58ab088a
	.word	0xb05ede4b,0x30fe8466,0x810c8f0f,0x99dc721b
	.word	0x639ca4ff,0x3e6c7150,0xc926a1f9,0x1543ca38
	.word	0xb2eaacbd,0x1904c8fa,0x88a0e40b,0x43c8affd
	.word	0xb53d6ae1,0x74b8ca89,0xeda43eb1,0x667fd8a9
	.word	0xb06f8950,0x39d3111f,0x55de519a,0x0f40becd
	.word	0x34585ecb,0x4b44bd67,0x8219a607,0xc11bc006
	.word	0xcfcee7f4,0x94fcf323,0x7b64a59d,0xd3a1e5a0
	.word	0xa3e3dde9,0xffdab440,0xe356ed7e,0x24b27f96
	.word	0xe5c598f8,0x4ea7d1ed,0x850bca4f,0xaab5a8cc
	.word	0x8f8aeab7,0xfd66ce7f,0x9f537f53,0x21c92f22
	.word	0xfe0982a6,0xa3d05bc7,0x779ad6c6,0x424262e1
	.word	0x2d5b63d1,0xa11ee9c9,0x883cd3ca,0xb6d0429d
	.word	0x51837c34,0xa153fe75,0xc7dd59c5,0xab197a7e
	.word	0x77119f55,0xd2262c1b,0x8a568f84,0xd6bf864f
	.word	0x5fbbe783,0x8c7e0f4e,0xc34c54de,0x6be9e7d8
share3_end:
