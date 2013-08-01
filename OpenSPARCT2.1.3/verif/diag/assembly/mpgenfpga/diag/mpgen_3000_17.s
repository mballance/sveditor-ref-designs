/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: mpgen_3000_17.s
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
!	Seed = 327144538
!	Riesling can be on
!	1 Thread, 3000 lines
!	mpgen   created on Dec 20, 2005 (16:35:03)
!	mpgen_3000_17.s created on Mar 27, 2009 (14:45:38)
!	RC file : random.rc
!	cmd = /import/n2-tools/release/tools/mpgen/mpgen,1.051220 -rc random.rc -o mpgen_3000_17 -p 1 -l 3000

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
!	%f0  = f99504d9 738ac30b 426f1c4e a28a6a6d
!	%f4  = 0cf4cc1d a5f460b0 ae0f39bd 6f134f9e
!	%f8  = 2863b31d 5cba080a 38ffe43a 93ef4102
!	%f12 = a28527f5 93f3477c aec7c47b 70be3ce4
	ldda	[%g1]ASI_BLK_P,%f0
	add	%g1,64,%g1
!	%f16 = 907b8135 fc52cf11 ca0e600f 5721c519
!	%f20 = a9fc6c60 095ce85a 3e49b886 8b9f6c2c
!	%f24 = 54937de8 9dd4e159 eeae27dc e1ce609b
!	%f28 = e2f253a2 778aed2f df4bb1b5 ae27d753
	ldda	[%g1]ASI_BLK_P,%f16
	add	%g1,64,%g1
!	%f32 = 7a630184 9afccded f00aabe2 16f174bf
!	%f36 = 4f8fa44f 80f82a9f 5b5ca511 c5844459
!	%f40 = d8f86922 e5cb0f5c 493e41ee def950f0
!	%f44 = e95e86af 54eba9ce 84e47134 dab5610e
	ldda	[%g1]ASI_BLK_P,%f32

!	Set up the Graphics Status Register

	setx	0x972dd8bf00000040,%g7,%g1 ! GSR scale =  8, align = 0
	wr	%g1,%g0,%gsr		! GSR = 972dd8bf00000040
	wr	%g0,%y			! Clear Y register
	xorcc	%g0,%g0,%g3		! init %g3 and set flags
	membar	#Sync			! Force the block loads to complete

!	Start of Random Code for processor 0

p0_label_1:
!	%l2 = 76cb5d0b, %l3 = ef3034b5, Mem[0000000010001400] = e3be3372 ff1ea306
	std	%l2,[%i0+%g0]		! Mem[0000000010001400] = 76cb5d0b ef3034b5
!	%f24 = 54937de8, Mem[0000000010101420] = 9735361c
	st	%f24,[%i4+0x020]	! Mem[0000000010101420] = 54937de8
!	%f2  = 426f1c4e a28a6a6d, Mem[0000000010081400] = 948a4d02 f57e14c7
	stda	%f2 ,[%i2+%g0]0x80	! Mem[0000000010081400] = 426f1c4e a28a6a6d
!	Mem[0000000010181418] = 7019af47 8cb0466d, %l6 = d7b027a8, %l7 = f55f173c
	ldda	[%i6+0x018]%asi,%l6	! %l6 = 000000007019af47 000000008cb0466d
!	Mem[0000000010041400] = 6bfb568f ca591030 6432845f 57663e30
!	Mem[0000000010041410] = ffcb868d 4c6334a3 3ca1c359 d01edd19
!	Mem[0000000010041420] = 7fe245f6 d8275aa4 e0250a6d 0f0be2a9
!	Mem[0000000010041430] = e9f291be 410fd903 445c2c9f 9f22251e
	ldda	[%i1]ASI_BLK_P,%f0	! Block Load from 0000000010041400
!	Mem[0000000010001408] = c9621194, %l7 = 000000008cb0466d
	swapa	[%i0+%o4]0x80,%l7	! %l7 = 00000000c9621194
!	%l4 = 9a2eed202944732c, Mem[0000000010181410] = c9c8f650
	stwa	%l4,[%i6+%o5]0x80	! Mem[0000000010181410] = 2944732c
!	%f16 = 907b8135 fc52cf11 ca0e600f 5721c519
!	%f20 = a9fc6c60 095ce85a 3e49b886 8b9f6c2c
!	%f24 = 54937de8 9dd4e159 eeae27dc e1ce609b
!	%f28 = e2f253a2 778aed2f df4bb1b5 ae27d753
	stda	%f16,[%i3]ASI_BLK_PL	! Block Store to 00000000100c1400
!	Mem[0000000010081408] = 56ee13e7, %l7 = 00000000c9621194
	ldsba	[%i2+%o4]0x88,%l7	! %l7 = ffffffffffffffe7
!	Starting 10 instruction Store Burst
!	%l1 = 31f18f7190a945ec, Mem[0000000030081408] = 815e951c
	stha	%l1,[%i2+%o4]0x89	! Mem[0000000030081408] = 815e45ec

p0_label_2:
!	Mem[0000000010081410] = cf8c9400, %l1 = 31f18f7190a945ec
	ldstuba	[%i2+%o5]0x80,%l1	! %l1 = 000000cf000000ff
!	Mem[0000000030181400] = 972b75c3, %l1 = 00000000000000cf
	swapa	[%i6+%g0]0x81,%l1	! %l1 = 00000000972b75c3
	membar	#Sync			! Added by membar checker (1)
!	%l4 = 2944732c, %l5 = 13ff938e, Mem[0000000010041400] = 8f56fb6b 301059ca
	stda	%l4,[%i1+%g0]0x88	! Mem[0000000010041400] = 2944732c 13ff938e
!	%f4  = ffcb868d 4c6334a3, Mem[0000000030181400] = 000000cf b9283712
	stda	%f4 ,[%i6+%g0]0x81	! Mem[0000000030181400] = ffcb868d 4c6334a3
!	Mem[0000000010081400] = 4e1c6f42, %l3 = e9ee1ec5ef3034b5
	swapa	[%i2+%g0]0x88,%l3	! %l3 = 000000004e1c6f42
!	%f22 = 3e49b886, %f3  = 57663e30, %f4  = ffcb868d
	fdivs	%f22,%f3 ,%f4 		! %f4  = 26604981
!	%l4 = 9a2eed202944732c, Mem[00000000218001c0] = 12bcc752, %asi = 80
	stha	%l4,[%o3+0x1c0]%asi	! Mem[00000000218001c0] = 732cc752
!	%f14 = 445c2c9f 9f22251e, Mem[0000000010141438] = 9129fb24 a1532bb8
	stda	%f14,[%i5+0x038]%asi	! Mem[0000000010141438] = 445c2c9f 9f22251e
!	%f20 = a9fc6c60 095ce85a, %l5 = 5761a96c13ff938e
!	Mem[0000000030001418] = 9c56136f0e505f4b
	add	%i0,0x018,%g1
	stda	%f20,[%g1+%l5]ASI_PST32_SL ! Mem[0000000030001418] = 9c56136f606cfca9
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = bbe3c832, %l5 = 5761a96c13ff938e
	ldswa	[%i5+%o5]0x88,%l5	! %l5 = ffffffffbbe3c832

p0_label_3:
!	Mem[0000000010141418] = a69be755, %l0 = 340d083872a08787
	ldsha	[%i5+0x01a]%asi,%l0	! %l0 = ffffffffffffe755
!	Mem[0000000010001400] = b53430ef 0b5dcb76, %l2 = 76cb5d0b, %l3 = 4e1c6f42
	ldda	[%i0+%g0]0x88,%l2	! %l2 = 000000000b5dcb76 00000000b53430ef
!	%f5  = 4c6334a3, %f22 = 3e49b886, %f31 = ae27d753
	fadds	%f5 ,%f22,%f31		! %f31 = 4c6334a3
!	Mem[0000000010001410] = 56baa042, %l2 = 000000000b5dcb76
	lduwa	[%i0+%o5]0x88,%l2	! %l2 = 0000000056baa042
!	Mem[0000000010141410] = 32c8e3bb, %l7 = ffffffffffffffe7
	lduha	[%i5+%o5]0x80,%l7	! %l7 = 00000000000032c8
!	Mem[0000000010001410] = b85db12b56baa042, %l4 = 9a2eed202944732c
	ldxa	[%i0+%o5]0x88,%l4	! %l4 = b85db12b56baa042
!	Mem[0000000010181438] = b24621fd 94ad7d4c, %l2 = 56baa042, %l3 = b53430ef
	ldda	[%i6+0x038]%asi,%l2	! %l2 = 00000000b24621fd 0000000094ad7d4c
	membar	#Sync			! Added by membar checker (2)
!	Mem[0000000010141400] = 60b136e4 088d03d2 84f172db 2ad5b81b
!	Mem[0000000010141410] = 32c8e3bb 3469aa70 a69be755 349b34e1
!	Mem[0000000010141420] = ae9a2bfc 16973ac7 a6667f18 fd2281c3
!	Mem[0000000010141430] = cb0c4acb 9ad31662 445c2c9f 9f22251e
	ldda	[%i5]ASI_BLK_PL,%f16	! Block Load from 0000000010141400
!	Mem[00000000100c1408] = 19c521570f600eca, %l6 = 000000007019af47
	ldx	[%i3+%o4],%l6		! %l6 = 19c521570f600eca
!	Starting 10 instruction Store Burst
!	%l4 = 56baa042, %l5 = bbe3c832, Mem[0000000010001430] = 043f6f43 64eb5228
	stda	%l4,[%i0+0x030]%asi	! Mem[0000000010001430] = 56baa042 bbe3c832

p0_label_4:
!	Mem[0000000030041400] = bbdef45c, %l7 = 00000000000032c8
	ldstuba	[%i1+%g0]0x81,%l7	! %l7 = 000000bb000000ff
!	%l0 = ffffffffffffe755, Mem[0000000021800001] = 9be918df, %asi = 80
	stba	%l0,[%o3+0x001]%asi	! Mem[0000000021800000] = 9b5518df
!	%l2 = b24621fd, %l3 = 94ad7d4c, Mem[0000000030001410] = 461d7330 54f3c7d1
	stda	%l2,[%i0+%o5]0x81	! Mem[0000000030001410] = b24621fd 94ad7d4c
!	%l0 = ffffffffffffe755, Mem[0000000010081418] = d0c624426f11316e
	stx	%l0,[%i2+0x018]		! Mem[0000000010081418] = ffffffffffffe755
!	Mem[0000000020800000] = 95ebe062, %l5 = ffffffffbbe3c832
	ldstub	[%o1+%g0],%l5		! %l5 = 00000095000000ff
!	%f7  = d01edd19, Mem[00000000300c1408] = 1c353fd5
	sta	%f7 ,[%i3+%o4]0x89	! Mem[00000000300c1408] = d01edd19
!	Mem[0000000030141408] = 6a599db0, %l2 = 00000000b24621fd
	swapa	[%i5+%o4]0x81,%l2	! %l2 = 000000006a599db0
!	Mem[0000000010101408] = 9595b79e, %l4 = b85db12b56baa042
	swapa	[%i4+%o4]0x80,%l4	! %l4 = 000000009595b79e
!	Mem[0000000030141400] = ed768f42, %l1 = 00000000972b75c3
	swapa	[%i5+%g0]0x81,%l1	! %l1 = 00000000ed768f42
!	Starting 10 instruction Load Burst
!	%l6 = 19c521570f600eca, %l5 = 0000000000000095, %l4 = 000000009595b79e
	xor	%l6,%l5,%l4		! %l4 = 19c521570f600e5f

p0_label_5:
!	Mem[00000000100c1408] = 19c52157, %l4 = 19c521570f600e5f
	ldswa	[%i3+%o4]0x80,%l4	! %l4 = 0000000019c52157
!	Mem[0000000010181408] = 487278b2, %l4 = 0000000019c52157
	lduha	[%i6+%o4]0x88,%l4	! %l4 = 00000000000078b2
!	Mem[0000000030081408] = ec455e81, %l5 = 0000000000000095
	ldswa	[%i2+%o4]0x81,%l5	! %l5 = ffffffffec455e81
!	Mem[0000000010041408] = 6432845f, %l2 = 000000006a599db0
	lduha	[%i1+%o4]0x80,%l2	! %l2 = 0000000000006432
!	Mem[0000000030081408] = 815e45ec, %f14 = 445c2c9f
	lda	[%i2+%o4]0x89,%f14	! %f14 = 815e45ec
!	%f4  = 26604981 4c6334a3, Mem[0000000030101400] = 3e329c54 37f6b80a
	stda	%f4 ,[%i4+%g0]0x89	! Mem[0000000030101400] = 26604981 4c6334a3
!	Mem[0000000010001408] = 8cb0466d, %l3 = 0000000094ad7d4c
	ldsba	[%i0+%o4]0x80,%l3	! %l3 = ffffffffffffff8c
!	Mem[00000000300c1410] = e292aff8 13ce7c52, %l2 = 00006432, %l3 = ffffff8c
	ldda	[%i3+%o5]0x81,%l2	! %l2 = 00000000e292aff8 0000000013ce7c52
!	Mem[0000000010101410] = d037766426b50d03, %l6 = 19c521570f600eca
	ldxa	[%i4+%o5]0x80,%l6	! %l6 = d037766426b50d03
!	Starting 10 instruction Store Burst
!	Randomly selected nop
	nop

p0_label_6:
!	%l3 = 0000000013ce7c52, Mem[0000000010041410] = ffcb868d4c6334a3
	stxa	%l3,[%i1+%o5]0x80	! Mem[0000000010041410] = 0000000013ce7c52
!	Mem[0000000010081410] = 00948cff, %l7 = 00000000000000bb
	swapa	[%i2+%o5]0x88,%l7	! %l7 = 0000000000948cff
!	%l5 = ffffffffec455e81, Mem[0000000010041408] = 6432845f
	stwa	%l5,[%i1+%o4]0x80	! Mem[0000000010041408] = ec455e81
!	Code Fragment 4
p0_fragment_1:
!	%l0 = ffffffffffffe755
	setx	0xd6e308880cc5288e,%g7,%l0 ! %l0 = d6e308880cc5288e
!	%l1 = 00000000ed768f42
	setx	0x71f53cb8547d15ed,%g7,%l1 ! %l1 = 71f53cb8547d15ed
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = d6e308880cc5288e
	setx	0x421d041fd56c914a,%g7,%l0 ! %l0 = 421d041fd56c914a
!	%l1 = 71f53cb8547d15ed
	setx	0x8b63c388751dcc6d,%g7,%l1 ! %l1 = 8b63c388751dcc6d
!	Mem[0000000010001410] = 56baa042, %l7 = 0000000000948cff
	swapa	[%i0+%o5]0x88,%l7	! %l7 = 0000000056baa042
!	%f16 = d2038d08 e436b160 1bb8d52a db72f184
!	%f20 = 70aa6934 bbe3c832 e1349b34 55e79ba6
!	%f24 = c73a9716 fc2b9aae c38122fd 187f66a6
!	%f28 = 6216d39a cb4a0ccb 1e25229f 9f2c5c44
	stda	%f16,[%i0]ASI_COMMIT_P	! Block Store to 0000000010001400
!	%l3 = 0000000013ce7c52, Mem[00000000201c0000] = db6701ce
	sth	%l3,[%o0+%g0]		! Mem[00000000201c0000] = 7c5201ce
!	Mem[0000000030181410] = 2bb6f3b1, %l2 = 00000000e292aff8
	swapa	[%i6+%o5]0x89,%l2	! %l2 = 000000002bb6f3b1
!	%f14 = 815e45ec 9f22251e, Mem[00000000100c1400] = 11cf52fc 35817b90
	stda	%f14,[%i3+%g0]0x80	! Mem[00000000100c1400] = 815e45ec 9f22251e
!	Starting 10 instruction Load Burst
!	Mem[0000000010141420] = ae9a2bfc 16973ac7, %l6 = 26b50d03, %l7 = 56baa042
	ldd	[%i5+0x020],%l6		! %l6 = 00000000ae9a2bfc 0000000016973ac7

p0_label_7:
!	Mem[00000000201c0000] = 7c5201ce, %l2 = 000000002bb6f3b1
	ldsba	[%o0+0x001]%asi,%l2	! %l2 = 0000000000000052
	membar	#Sync			! Added by membar checker (3)
!	Mem[0000000010001408] = 2ad5b81b, %l3 = 0000000013ce7c52
	lduha	[%i0+%o4]0x88,%l3	! %l3 = 000000000000b81b
!	%l3 = 000000000000b81b, immed = fffff982, %y  = 00000000
	sdiv	%l3,-0x67e,%l0		! %l0 = ffffffffffffffe4
	mov	%l0,%y			! %y = ffffffe4
!	Mem[0000000010141408] = 84f172db 2ad5b81b, %l2 = 00000052, %l3 = 0000b81b
	ldda	[%i5+%o4]0x80,%l2	! %l2 = 0000000084f172db 000000002ad5b81b
!	Mem[0000000030181408] = 10f04417, %l0 = ffffffffffffffe4
	ldsha	[%i6+%o4]0x89,%l0	! %l0 = 0000000000004417
!	Mem[0000000010001438] = 1e25229f 9f2c5c44, %l2 = 84f172db, %l3 = 2ad5b81b
	ldd	[%i0+0x038],%l2		! %l2 = 000000001e25229f 000000009f2c5c44
!	Mem[0000000030181410] = f8af92e2, %l4 = 00000000000078b2
	ldswa	[%i6+%o5]0x81,%l4	! %l4 = fffffffff8af92e2
!	Mem[00000000100c1400] = 815e45ec, %l1 = 8b63c388751dcc6d
	ldsba	[%i3+%g0]0x80,%l1	! %l1 = ffffffffffffff81
!	Mem[00000000100c1408] = 19c521570f600eca, %f28 = 6216d39a cb4a0ccb
	ldda	[%i3+0x008]%asi,%f28	! %f28 = 19c52157 0f600eca
!	Starting 10 instruction Store Burst
!	Mem[0000000010081410] = 000000bb, %l6 = 00000000ae9a2bfc
	swapa	[%i2+%o5]0x88,%l6	! %l6 = 00000000000000bb

p0_label_8:
!	%l0 = 0000000000004417, Mem[0000000030041400] = ffdef45c5584b512
	stxa	%l0,[%i1+%g0]0x81	! Mem[0000000030041400] = 0000000000004417
!	%l7 = 0000000016973ac7, Mem[0000000030001408] = 55159ea7
	stwa	%l7,[%i0+%o4]0x89	! Mem[0000000030001408] = 16973ac7
!	%f16 = d2038d08 e436b160, Mem[0000000030081400] = efcf4072 887e3ba9
	stda	%f16,[%i2+%g0]0x81	! Mem[0000000030081400] = d2038d08 e436b160
!	Mem[0000000010141410] = 32c8e3bb, %l1 = ffffffffffffff81
	swapa	[%i5+%o5]0x80,%l1	! %l1 = 0000000032c8e3bb
!	%f26 = c38122fd 187f66a6, Mem[0000000010141410] = ffffff81 3469aa70
	std	%f26,[%i5+%o5]	! Mem[0000000010141410] = c38122fd 187f66a6
!	%l3 = 000000009f2c5c44, Mem[00000000100c1410] = 095ce85a
	stwa	%l3,[%i3+%o5]0x88	! Mem[00000000100c1410] = 9f2c5c44
!	%l5 = ffffffffec455e81, Mem[0000000010001438] = 1e25229f9f2c5c44
	stx	%l5,[%i0+0x038]		! Mem[0000000010001438] = ffffffffec455e81
!	%f30 = 1e25229f 9f2c5c44, Mem[0000000030181408] = 1744f010 6ce214e9
	stda	%f30,[%i6+%o4]0x81	! Mem[0000000030181408] = 1e25229f 9f2c5c44
!	%f12 = e9f291be, Mem[0000000010081410] = fc2b9aae
	sta	%f12,[%i2+%o5]0x80	! Mem[0000000010081410] = e9f291be
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = d2038d08 e436b160, %l4 = f8af92e2, %l5 = ec455e81
	ldda	[%i0+%g0]0x80,%l4	! %l4 = 00000000d2038d08 00000000e436b160

p0_label_9:
!	Mem[0000000010081410] = e9f291be c68c78d8, %l4 = d2038d08, %l5 = e436b160
	ldda	[%i2+%o5]0x80,%l4	! %l4 = 00000000e9f291be 00000000c68c78d8
!	Mem[0000000010001420] = c73a9716, %l0 = 0000000000004417
	lduwa	[%i0+0x020]%asi,%l0	! %l0 = 00000000c73a9716
!	Mem[0000000030041410] = e4d37b59, %l0 = 00000000c73a9716
	lduwa	[%i1+%o5]0x89,%l0	! %l0 = 00000000e4d37b59
!	Mem[0000000010181400] = f3ee4792, %l7 = 0000000016973ac7
	ldsha	[%i6+%g0]0x80,%l7	! %l7 = fffffffffffff3ee
!	%f11 = 0f0be2a9, %f2  = 6432845f
	fsqrts	%f11,%f2 		! %f2  = 273d3caf
!	Mem[0000000010081410] = be91f2e9, %l0 = 00000000e4d37b59
	lduha	[%i2+%o5]0x88,%l0	! %l0 = 000000000000f2e9
!	Mem[0000000010181420] = a21033db726f2f17, %l7 = fffffffffffff3ee
	ldxa	[%i6+0x020]%asi,%l7	! %l7 = a21033db726f2f17
!	Mem[00000000100c1408] = 19c52157 0f600eca, %l2 = 1e25229f, %l3 = 9f2c5c44
	ldda	[%i3+%o4]0x80,%l2	! %l2 = 0000000019c52157 000000000f600eca
!	Mem[0000000030081400] = 60b136e4088d03d2, %f26 = c38122fd 187f66a6
	ldda	[%i2+%g0]0x89,%f26	! %f26 = 60b136e4 088d03d2
!	Starting 10 instruction Store Burst
!	%l6 = 00000000000000bb, Mem[0000000020800000] = ffebe062, %asi = 80
	stha	%l6,[%o1+0x000]%asi	! Mem[0000000020800000] = 00bbe062

p0_label_10:
!	%f14 = 815e45ec 9f22251e, Mem[0000000010101428] = ad14c10a 9b0c725c
	std	%f14,[%i4+0x028]	! Mem[0000000010101428] = 815e45ec 9f22251e
!	%l6 = 00000000000000bb, Mem[00000000300c1410] = 527cce13f8af92e2
	stxa	%l6,[%i3+%o5]0x89	! Mem[00000000300c1410] = 00000000000000bb
!	%l2 = 0000000019c52157, Mem[0000000030101400] = 4c6334a3
	stha	%l2,[%i4+%g0]0x89	! Mem[0000000030101400] = 4c632157
!	%f4  = 26604981 4c6334a3, Mem[0000000010141410] = c38122fd 187f66a6
	stda	%f4 ,[%i5+%o5]0x80	! Mem[0000000010141410] = 26604981 4c6334a3
!	%f17 = e436b160, %f10 = e0250a6d, %f3  = 57663e30
	fadds	%f17,%f10,%f3 		! %f3  = e437566a
!	%l2 = 0000000019c52157, Mem[0000000010001403] = d2038d08, %asi = 80
	stba	%l2,[%i0+0x003]%asi	! Mem[0000000010001400] = d2038d57
!	%f13 = 410fd903, Mem[0000000030041400] = 00000000
	sta	%f13,[%i1+%g0]0x89	! Mem[0000000030041400] = 410fd903
!	Mem[0000000010141410] = 81496026, %l2 = 0000000019c52157
	ldstuba	[%i5+%o5]0x88,%l2	! %l2 = 00000026000000ff
!	%l4 = 00000000e9f291be, Mem[00000000100c1401] = 815e45ec
	stb	%l4,[%i3+0x001]		! Mem[00000000100c1400] = 81be45ec
!	Starting 10 instruction Load Burst
!	Mem[0000000021800140] = 0a6099db, %l2 = 0000000000000026
	ldsh	[%o3+0x140],%l2		! %l2 = 0000000000000a60

p0_label_11:
!	Mem[0000000010181418] = 7019af47, %l4 = 00000000e9f291be
	lduha	[%i6+0x018]%asi,%l4	! %l4 = 0000000000007019
!	Mem[00000000300c1408] = e8476df6 d01edd19, %l2 = 00000a60, %l3 = 0f600eca
	ldda	[%i3+%o4]0x89,%l2	! %l2 = 00000000d01edd19 00000000e8476df6
!	Mem[0000000030141408] = b24621fd, %f8  = 7fe245f6
	lda	[%i5+%o4]0x81,%f8 	! %f8 = b24621fd
!	Mem[00000000300c1410] = 000000bb, %l5 = 00000000c68c78d8
	ldswa	[%i3+%o5]0x89,%l5	! %l5 = 00000000000000bb
!	%l7 = a21033db726f2f17, %l0 = 000000000000f2e9, %y  = ffffffe4
	smul	%l7,%l0,%l2		! %l2 = 00006c9541b599ef, %y = 00006c95
!	Mem[0000000010081400] = ef3034b5, %l2 = 00006c9541b599ef
	ldsha	[%i2+%g0]0x88,%l2	! %l2 = 00000000000034b5
!	Mem[0000000010141410] = ff6049814c6334a3, %f12 = e9f291be 410fd903
	ldda	[%i5+%o5]0x80,%f12	! %f12 = ff604981 4c6334a3
!	Mem[0000000010041408] = ec455e81, %l5 = 00000000000000bb
	ldsba	[%i1+%o4]0x80,%l5	! %l5 = ffffffffffffffec
!	Mem[0000000010081414] = c68c78d8, %l5 = ffffffffffffffec
	ldsw	[%i2+0x014],%l5		! %l5 = ffffffffc68c78d8
!	Starting 10 instruction Store Burst
!	Mem[000000001008143c] = 75164fc8, %l2 = 000034b5, %l3 = e8476df6
	add	%i2,0x3c,%g1
	casa	[%g1]0x80,%l2,%l3	! %l3 = 0000000075164fc8

p0_label_12:
!	%l5 = ffffffffc68c78d8, Mem[0000000010141400] = 60b136e4088d03d2
	stxa	%l5,[%i5+%g0]0x80	! Mem[0000000010141400] = ffffffffc68c78d8
!	Mem[0000000010081408] = e713ee56, %l6 = 00000000000000bb
	ldstuba	[%i2+%o4]0x80,%l6	! %l6 = 000000e7000000ff
!	%l7 = a21033db726f2f17, Mem[0000000010101407] = 01f35123
	stb	%l7,[%i4+0x007]		! Mem[0000000010101404] = 01f35117
!	%l0 = 000000000000f2e9, Mem[0000000010041400] = 2944732c
	stwa	%l0,[%i1+%g0]0x88	! Mem[0000000010041400] = 0000f2e9
!	%f9  = d8275aa4, Mem[0000000030141400] = c3752b97
	sta	%f9 ,[%i5+%g0]0x89	! Mem[0000000030141400] = d8275aa4
!	Mem[0000000021800140] = 0a6099db, %l4 = 0000000000007019
	ldstub	[%o3+0x140],%l4		! %l4 = 0000000a000000ff
!	%l0 = 0000f2e9, %l1 = 32c8e3bb, Mem[00000000300c1410] = 000000bb 00000000
	stda	%l0,[%i3+%o5]0x89	! Mem[00000000300c1410] = 0000f2e9 32c8e3bb
!	Mem[0000000010181400] = f3ee4792, %l6 = 00000000000000e7
	swapa	[%i6+%g0]0x80,%l6	! %l6 = 00000000f3ee4792
!	%f20 = 70aa6934, Mem[0000000010101408] = 42a0ba56
	sta	%f20,[%i4+%o4]0x88	! Mem[0000000010101408] = 70aa6934
!	Starting 10 instruction Load Burst
!	Mem[0000000020800040] = 659bf99a, %l2 = 00000000000034b5
	ldsba	[%o1+0x040]%asi,%l2	! %l2 = 0000000000000065

p0_label_13:
!	Mem[00000000211c0000] = 22dce5a1, %l1 = 0000000032c8e3bb
	lduh	[%o2+%g0],%l1		! %l1 = 00000000000022dc
!	Mem[00000000201c0000] = 7c5201ce, %l1 = 00000000000022dc
	lduha	[%o0+0x000]%asi,%l1	! %l1 = 0000000000007c52
!	Mem[0000000030081408] = ec455e81, %l4 = 000000000000000a
	ldsba	[%i2+%o4]0x81,%l4	! %l4 = ffffffffffffffec
!	Mem[0000000010101410] = d0377664, %l5 = ffffffffc68c78d8
	lduha	[%i4+%o5]0x80,%l5	! %l5 = 000000000000d037
!	Mem[0000000030181410] = f8af92e2, %l2 = 0000000000000065
	lduwa	[%i6+%o5]0x81,%l2	! %l2 = 00000000f8af92e2
!	Mem[0000000030181400] = ffcb868d4c6334a3, %l6 = 00000000f3ee4792
	ldxa	[%i6+%g0]0x81,%l6	! %l6 = ffcb868d4c6334a3
!	Mem[00000000211c0000] = 22dce5a1, %l3 = 0000000075164fc8
	lduha	[%o2+0x000]%asi,%l3	! %l3 = 00000000000022dc
!	Mem[0000000030141408] = fd2146b2, %l4 = ffffffffffffffec
	ldsba	[%i5+%o4]0x89,%l4	! %l4 = ffffffffffffffb2
!	Mem[0000000030181400] = ffcb868d, %l1 = 0000000000007c52
	lduba	[%i6+%g0]0x81,%l1	! %l1 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l1 = 00000000000000ff, imm = fffffffffffff319, %l1 = 00000000000000ff
	sub	%l1,-0xce7,%l1		! %l1 = 0000000000000de6

p0_label_14:
!	%f10 = e0250a6d 0f0be2a9, Mem[0000000010141410] = ff604981 4c6334a3
	stda	%f10,[%i5+0x010]%asi	! Mem[0000000010141410] = e0250a6d 0f0be2a9
!	Mem[0000000010001410] = 3469aa70, %l4 = ffffffffffffffb2
	ldsha	[%i0+%o5]0x88,%l4	! %l4 = ffffffffffffaa70
!	Mem[00000000100c1424] = e87d9354, %l1 = 0000000000000de6
	swap	[%i3+0x024],%l1		! %l1 = 00000000e87d9354
!	%l4 = ffffffffffffaa70, Mem[00000000300c1400] = c6488bfe29df180e
	stxa	%l4,[%i3+%g0]0x89	! Mem[00000000300c1400] = ffffffffffffaa70
!	%l2 = 00000000f8af92e2, Mem[0000000010101410] = 030db526647637d0
	stxa	%l2,[%i4+%o5]0x88	! Mem[0000000010101410] = 00000000f8af92e2
!	%l6 = 4c6334a3, %l7 = 726f2f17, Mem[0000000030101410] = bb0ccc3a 586b0b8b
	stda	%l6,[%i4+%o5]0x89	! Mem[0000000030101410] = 4c6334a3 726f2f17
!	%l0 = 000000000000f2e9, Mem[0000000010141404] = c68c78d8
	stb	%l0,[%i5+0x004]		! Mem[0000000010141404] = e98c78d8
!	Mem[00000000100c1410] = 9f2c5c44, %l1 = 00000000e87d9354
	ldstuba	[%i3+%o5]0x88,%l1	! %l1 = 00000044000000ff
!	%l1 = 0000000000000044, Mem[0000000020800000] = 00bbe062, %asi = 80
	stba	%l1,[%o1+0x000]%asi	! Mem[0000000020800000] = 44bbe062
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = 70aa6934, %l1 = 0000000000000044
	lduba	[%i4+%o4]0x88,%l1	! %l1 = 0000000000000034

p0_label_15:
!	Mem[0000000030181408] = 9f22251e, %l7 = a21033db726f2f17
	ldsba	[%i6+%o4]0x89,%l7	! %l7 = 000000000000001e
!	Mem[0000000030001410] = fd2146b2, %f6  = 3ca1c359
	lda	[%i0+%o5]0x89,%f6 	! %f6 = fd2146b2
!	Mem[00000000100c1410] = a9fc6c609f2c5cff, %l1 = 0000000000000034
	ldxa	[%i3+%o5]0x88,%l1	! %l1 = a9fc6c609f2c5cff
!	Mem[0000000010001410] = 3469aa70, %l3 = 00000000000022dc
	lduba	[%i0+%o5]0x88,%l3	! %l3 = 0000000000000070
!	Mem[0000000010001408] = 1bb8d52a, %l0 = 000000000000f2e9
	lduwa	[%i0+%o4]0x80,%l0	! %l0 = 000000001bb8d52a
!	Mem[0000000010101408] = 70aa6934, %l2 = 00000000f8af92e2
	ldsba	[%i4+%o4]0x88,%l2	! %l2 = 0000000000000034
!	Mem[0000000010001408] = 1bb8d52a, %l0 = 000000001bb8d52a
	lduwa	[%i0+%o4]0x80,%l0	! %l0 = 000000001bb8d52a
!	Mem[0000000030041408] = 6bfea0d3b1cd62b5, %l4 = ffffffffffffaa70
	ldxa	[%i1+%o4]0x89,%l4	! %l4 = 6bfea0d3b1cd62b5
!	Mem[00000000300c1410] = 32c8e3bb0000f2e9, %f10 = e0250a6d 0f0be2a9
	ldda	[%i3+%o5]0x89,%f10	! %f10 = 32c8e3bb 0000f2e9
!	Starting 10 instruction Store Burst
!	Mem[0000000010081408] = 56ee13ff, %l3 = 0000000000000070
	ldstuba	[%i2+%o4]0x88,%l3	! %l3 = 000000ff000000ff

p0_label_16:
!	%l6 = ffcb868d4c6334a3, Mem[0000000010141408] = 84f172db
	stha	%l6,[%i5+%o4]0x80	! Mem[0000000010141408] = 34a372db
!	%l2 = 0000000000000034, Mem[0000000010181408] = b2787248
	stba	%l2,[%i6+%o4]0x80	! Mem[0000000010181408] = 34787248
!	%f2  = 273d3caf e437566a, Mem[0000000010041408] = ec455e81 57663e30
	stda	%f2 ,[%i1+%o4]0x80	! Mem[0000000010041408] = 273d3caf e437566a
!	Mem[0000000010041408] = af3c3d27, %l4 = 6bfea0d3b1cd62b5
	ldstuba	[%i1+%o4]0x88,%l4	! %l4 = 00000027000000ff
!	Mem[0000000020800040] = 659bf99a, %l6 = ffcb868d4c6334a3
	ldstuba	[%o1+0x040]%asi,%l6	! %l6 = 00000065000000ff
!	Mem[0000000030001408] = c73a9716, %l2 = 0000000000000034
	swapa	[%i0+%o4]0x81,%l2	! %l2 = 00000000c73a9716
!	%f16 = d2038d08 e436b160 1bb8d52a db72f184
!	%f20 = 70aa6934 bbe3c832 e1349b34 55e79ba6
!	%f24 = c73a9716 fc2b9aae 60b136e4 088d03d2
!	%f28 = 19c52157 0f600eca 1e25229f 9f2c5c44
	stda	%f16,[%i5]ASI_COMMIT_S	! Block Store to 0000000030141400
!	Mem[00000000300c1410] = 0000f2e9, %l6 = 0000000000000065
	swapa	[%i3+%o5]0x89,%l6	! %l6 = 000000000000f2e9
!	%l4 = 0000000000000027, Mem[0000000010001408] = 1bb8d52a
	stha	%l4,[%i0+%o4]0x80	! Mem[0000000010001408] = 0027d52a
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = d2038d08, %l1 = a9fc6c609f2c5cff
	ldsba	[%i2+%g0]0x81,%l1	! %l1 = ffffffffffffffd2

p0_label_17:
!	Mem[0000000010041408] = af3c3dff, %l3 = 00000000000000ff
	lduha	[%i1+%o4]0x88,%l3	! %l3 = 0000000000003dff
!	Mem[00000000211c0000] = 22dce5a1, %l7 = 000000000000001e
	lduba	[%o2+0x000]%asi,%l7	! %l7 = 0000000000000022
!	Mem[0000000010101400] = 0addd1cc 01f35117, %l6 = 0000f2e9, %l7 = 00000022
	ldda	[%i4+%g0]0x80,%l6	! %l6 = 000000000addd1cc 0000000001f35117
!	Mem[0000000030041408] = b562cdb1, %l7 = 0000000001f35117
	ldsha	[%i1+%o4]0x81,%l7	! %l7 = ffffffffffffb562
	membar	#Sync			! Added by membar checker (4)
!	Mem[0000000030141400] = 60b136e4088d03d2, %f8  = b24621fd d8275aa4
	ldda	[%i5+%g0]0x89,%f8 	! %f8  = 60b136e4 088d03d2
!	Mem[0000000010081408] = ff13ee56, %l0 = 000000001bb8d52a
	ldswa	[%i2+0x008]%asi,%l0	! %l0 = ffffffffff13ee56
!	Mem[0000000021800000] = 9b5518df, %l7 = ffffffffffffb562
	ldsb	[%o3+0x001],%l7		! %l7 = 0000000000000055
!	%l4 = 00000027, %l5 = 0000d037, Mem[0000000030001408] = 00000034 8a53b032
	stda	%l4,[%i0+%o4]0x81	! Mem[0000000030001408] = 00000027 0000d037
!	Mem[0000000010041400] = e9f20000, %l1 = ffffffffffffffd2
	ldsba	[%i1+%g0]0x80,%l1	! %l1 = ffffffffffffffe9
!	Starting 10 instruction Store Burst
!	%l2 = 00000000c73a9716, Mem[00000000100c1410] = ff5c2c9f
	stwa	%l2,[%i3+%o5]0x80	! Mem[00000000100c1410] = c73a9716

p0_label_18:
!	Mem[00000000100c1410] = 16973ac7, %l2 = 00000000c73a9716
	ldstuba	[%i3+%o5]0x88,%l2	! %l2 = 000000c7000000ff
!	%l0 = ff13ee56, %l1 = ffffffe9, Mem[0000000010101430] = 7ef25af5 3aed2469
	std	%l0,[%i4+0x030]		! Mem[0000000010101430] = ff13ee56 ffffffe9
!	Mem[0000000010181400] = 000000e7, %l2 = 00000000000000c7
	ldstuba	[%i6+0x000]%asi,%l2	! %l2 = 00000000000000ff
!	%l3 = 0000000000003dff, Mem[0000000030001410] = fd2146b2
	stwa	%l3,[%i0+%o5]0x89	! Mem[0000000030001410] = 00003dff
!	%l7 = 0000000000000055, Mem[0000000010181428] = e4202773442eeae8
	stx	%l7,[%i6+0x028]		! Mem[0000000010181428] = 0000000000000055
!	%l3 = 0000000000003dff, Mem[0000000010041410] = 00000000
	stwa	%l3,[%i1+%o5]0x88	! Mem[0000000010041410] = 00003dff
!	Mem[0000000030041410] = 597bd3e4, %l1 = ffffffffffffffe9
	ldstuba	[%i1+%o5]0x81,%l1	! %l1 = 00000059000000ff
!	%l1 = 0000000000000059, Mem[00000000100c1410] = ff3a9716
	stba	%l1,[%i3+%o5]0x80	! Mem[00000000100c1410] = 593a9716
!	Mem[00000000201c0000] = 7c5201ce, %l2 = 0000000000000000
	ldsb	[%o0+%g0],%l2		! %l2 = 000000000000007c
!	Starting 10 instruction Load Burst
!	%f26 = 60b136e4, %f11 = 0000f2e9
	fstoi	%f26,%f11		! %f11 = 7fffffff

p0_label_19:
!	%l7 = 0000000000000055, %l1 = 0000000000000059, %l1 = 0000000000000059
	and	%l7,%l1,%l1		! %l1 = 0000000000000051
!	Mem[0000000010181408] = 34787248, %l0 = ffffffffff13ee56
	lduha	[%i6+%o4]0x80,%l0	! %l0 = 0000000000003478
!	Mem[0000000021800040] = 287028b2, %l5 = 000000000000d037
	ldsba	[%o3+0x040]%asi,%l5	! %l5 = 0000000000000028
!	Mem[0000000030101410] = 726f2f17 4c6334a3, %l2 = 0000007c, %l3 = 00003dff
	ldda	[%i4+%o5]0x89,%l2	! %l2 = 000000004c6334a3 00000000726f2f17
!	Mem[0000000030141410] = 70aa6934, %l7 = 0000000000000055
	ldswa	[%i5+%o5]0x81,%l7	! %l7 = 0000000070aa6934
!	Mem[0000000030101408] = 339112d4 796694bc, %l4 = 00000027, %l5 = 00000028
	ldda	[%i4+%o4]0x89,%l4	! %l4 = 00000000796694bc 00000000339112d4
!	%l7 = 0000000070aa6934, immed = fffff922, %y  = 00006c95
	sdiv	%l7,-0x6de,%l5		! %l5 = ffffffff80000000
	mov	%l0,%y			! %y = 00003478
!	Mem[00000000100c1408] = 19c52157, %l0 = 0000000000003478
	lduba	[%i3+%o4]0x80,%l0	! %l0 = 0000000000000019
!	Mem[0000000030141408] = 1bb8d52a, %l0 = 0000000000000019
	ldsha	[%i5+%o4]0x81,%l0	! %l0 = 0000000000001bb8
!	Starting 10 instruction Store Burst
!	%f0  = 6bfb568f, Mem[0000000030141408] = 2ad5b81b
	sta	%f0 ,[%i5+%o4]0x89	! Mem[0000000030141408] = 6bfb568f

p0_label_20:
!	%l7 = 0000000070aa6934, Mem[0000000030001400] = e6964508
	stba	%l7,[%i0+%g0]0x81	! Mem[0000000030001400] = 34964508
!	%l0 = 00001bb8, %l1 = 00000051, Mem[0000000010181410] = 2c734429 898546e4
	stda	%l0,[%i6+%o5]0x88	! Mem[0000000010181410] = 00001bb8 00000051
!	%l5 = ffffffff80000000, Mem[0000000010081400] = ef3034b5
	stwa	%l5,[%i2+%g0]0x88	! Mem[0000000010081400] = 80000000
!	%f2  = 273d3caf e437566a, %l4 = 00000000796694bc
!	Mem[0000000030001400] = 34964508d0559d06
	stda	%f2,[%i0+%l4]ASI_PST16_SL ! Mem[0000000030001400] = 34964508af3c3d27
!	%l4 = 796694bc, %l5 = 80000000, Mem[0000000030181400] = 8d86cbff a334634c
	stda	%l4,[%i6+%g0]0x89	! Mem[0000000030181400] = 796694bc 80000000
!	%f28 = 19c52157 0f600eca, Mem[0000000030181400] = bc946679 00000080
	stda	%f28,[%i6+%g0]0x81	! Mem[0000000030181400] = 19c52157 0f600eca
!	Mem[0000000010081400] = 00000080, %l7 = 0000000070aa6934
	swapa	[%i2+%g0]0x80,%l7	! %l7 = 0000000000000080
!	%l2 = 000000004c6334a3, Mem[0000000021800100] = 650a4e79
	sth	%l2,[%o3+0x100]		! Mem[0000000021800100] = 34a34e79
!	Mem[0000000010081424] = f539bdcc, %l4 = 796694bc, %l5 = 80000000
	add	%i2,0x24,%g1
	casa	[%g1]0x80,%l4,%l5	! %l5 = 00000000f539bdcc
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = 0027d52a, %f25 = fc2b9aae
	lda	[%i0+%o4]0x80,%f25	! %f25 = 0027d52a

p0_label_21:
!	Mem[0000000030041408] = b1cd62b5, %l0 = 0000000000001bb8
	lduha	[%i1+%o4]0x89,%l0	! %l0 = 00000000000062b5
!	Mem[0000000010181400] = e70000ff, %f7  = d01edd19
	lda	[%i6+%g0]0x88,%f7 	! %f7 = e70000ff
!	Mem[0000000030101408] = 796694bc, %f12 = ff604981
	lda	[%i4+%o4]0x89,%f12	! %f12 = 796694bc
!	Mem[0000000010001428] = c38122fd 187f66a6, %l2 = 4c6334a3, %l3 = 726f2f17
	ldd	[%i0+0x028],%l2		! %l2 = 00000000c38122fd 00000000187f66a6
!	Mem[0000000030041400] = 03d90f4100004417, %l0 = 00000000000062b5
	ldxa	[%i1+%g0]0x81,%l0	! %l0 = 03d90f4100004417
!	Mem[0000000030101408] = 796694bc, %l3 = 00000000187f66a6
	lduha	[%i4+%o4]0x89,%l3	! %l3 = 00000000000094bc
!	Mem[0000000030181408] = 9f22251e, %f14 = 815e45ec
	lda	[%i6+%o4]0x89,%f14	! %f14 = 9f22251e
!	Mem[0000000010001418] = e1349b3455e79ba6, %f2  = 273d3caf e437566a
	ldd	[%i0+0x018],%f2 	! %f2  = e1349b34 55e79ba6
!	Mem[0000000010181410] = 00000051 00001bb8, %l4 = 796694bc, %l5 = f539bdcc
	ldda	[%i6+%o5]0x88,%l4	! %l4 = 0000000000001bb8 0000000000000051
!	Starting 10 instruction Store Burst
!	%l1 = 0000000000000051, imm = fffffffffffffe30, %l6 = 000000000addd1cc
	subc	%l1,-0x1d0,%l6		! %l6 = 0000000000000221

p0_label_22:
!	%l0 = 00004417, %l1 = 00000051, Mem[0000000030081408] = ec455e81 fa93b0a2
	stda	%l0,[%i2+%o4]0x81	! Mem[0000000030081408] = 00004417 00000051
!	%f24 = c73a9716 0027d52a, %l6 = 0000000000000221
!	Mem[00000000100c1400] = 81be45ec9f22251e
	stda	%f24,[%i3+%l6]ASI_PST32_PL ! Mem[00000000100c1400] = 2ad527009f22251e
!	Mem[0000000010181410] = b81b0000, %l2 = 00000000c38122fd
	ldstuba	[%i6+%o5]0x80,%l2	! %l2 = 000000b8000000ff
!	%l3 = 00000000000094bc, Mem[0000000010181400] = ff0000e7641035b8
	stxa	%l3,[%i6+%g0]0x80	! Mem[0000000010181400] = 00000000000094bc
!	%f2  = e1349b34 55e79ba6, Mem[0000000030041400] = 03d90f41 00004417
	stda	%f2 ,[%i1+%g0]0x81	! Mem[0000000030041400] = e1349b34 55e79ba6
!	%l3 = 00000000000094bc, Mem[0000000030041400] = a69be755349b34e1
	stxa	%l3,[%i1+%g0]0x89	! Mem[0000000030041400] = 00000000000094bc
!	Mem[00000000201c0000] = 7c5201ce, %l1 = 0000000000000051
	ldstuba	[%o0+0x000]%asi,%l1	! %l1 = 0000007c000000ff
!	%l1 = 000000000000007c, Mem[0000000010101410] = e292aff8
	stba	%l1,[%i4+%o5]0x80	! Mem[0000000010101410] = 7c92aff8
!	%l4 = 0000000000001bb8, Mem[0000000030141408] = 84f172db6bfb568f
	stxa	%l4,[%i5+%o4]0x89	! Mem[0000000030141408] = 0000000000001bb8
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = 60b136e4088d03d2, %f10 = 32c8e3bb 7fffffff
	ldda	[%i2+%g0]0x89,%f10	! %f10 = 60b136e4 088d03d2

p0_label_23:
!	Mem[0000000030041410] = ff7bd3e4, %l1 = 000000000000007c
	ldsha	[%i1+%o5]0x81,%l1	! %l1 = ffffffffffffff7b
!	Mem[000000001004143c] = 9f22251e, %l7 = 0000000000000080
	ldsb	[%i1+0x03f],%l7		! %l7 = 000000000000001e
!	Mem[0000000010181418] = 7019af47 8cb0466d, %l2 = 000000b8, %l3 = 000094bc
	ldd	[%i6+0x018],%l2		! %l2 = 000000007019af47 000000008cb0466d
!	Mem[00000000100c1410] = 593a9716, %l0 = 03d90f4100004417
	ldswa	[%i3+%o5]0x80,%l0	! %l0 = 00000000593a9716
!	Mem[0000000030041408] = b1cd62b5, %l4 = 0000000000001bb8
	ldsba	[%i1+%o4]0x89,%l4	! %l4 = ffffffffffffffb5
!	Mem[0000000030101410] = a334634c 172f6f72, %l2 = 7019af47, %l3 = 8cb0466d
	ldda	[%i4+%o5]0x81,%l2	! %l2 = 00000000a334634c 00000000172f6f72
!	Mem[0000000030181400] = 19c52157, %l6 = 0000000000000221
	lduha	[%i6+%g0]0x81,%l6	! %l6 = 00000000000019c5
!	Mem[0000000010101400] = 0addd1cc, %l2 = 00000000a334634c
	lduba	[%i4+%g0]0x80,%l2	! %l2 = 000000000000000a
!	Mem[000000001008142c] = b252fd4b, %l1 = ffffffffffffff7b
	lduw	[%i2+0x02c],%l1		! %l1 = 00000000b252fd4b
!	Starting 10 instruction Store Burst
!	%f14 = 9f22251e 9f22251e, %l5 = 0000000000000051
!	Mem[0000000030181400] = 19c521570f600eca
	stda	%f14,[%i6+%l5]ASI_PST8_S ! Mem[0000000030181400] = 1922211e0f600e1e

p0_label_24:
!	%f12 = 796694bc 4c6334a3, Mem[0000000010041400] = e9f20000 8e93ff13
	stda	%f12,[%i1+0x000]%asi	! Mem[0000000010041400] = 796694bc 4c6334a3
!	%f16 = d2038d08 e436b160, Mem[0000000010081400] = 70aa6934 a28a6a6d
	stda	%f16,[%i2+%g0]0x80	! Mem[0000000010081400] = d2038d08 e436b160
!	%f10 = 60b136e4, Mem[000000001018141c] = 8cb0466d
	sta	%f10,[%i6+0x01c]%asi	! Mem[000000001018141c] = 60b136e4
!	%l1 = 00000000b252fd4b, Mem[0000000020800000] = 44bbe062
	sth	%l1,[%o1+%g0]		! Mem[0000000020800000] = fd4be062
!	%f12 = 796694bc 4c6334a3, Mem[0000000030001410] = 00003dff 4c7dad94
	stda	%f12,[%i0+%o5]0x89	! Mem[0000000030001410] = 796694bc 4c6334a3
!	Mem[0000000021800000] = 9b5518df, %l5 = 0000000000000051
	ldstub	[%o3+%g0],%l5		! %l5 = 0000009b000000ff
!	%l6 = 00000000000019c5, Mem[00000000218000c0] = 90d5d5a0
	sth	%l6,[%o3+0x0c0]		! Mem[00000000218000c0] = 19c5d5a0
!	%f26 = 60b136e4, Mem[0000000010001400] = 578d03d2
	sta	%f26,[%i0+%g0]0x88	! Mem[0000000010001400] = 60b136e4
!	Mem[00000000100c1400] = 2ad52700, %l5 = 000000000000009b
	swapa	[%i3+%g0]0x80,%l5	! %l5 = 000000002ad52700
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = 796694bc, %l7 = 000000000000001e
	ldswa	[%i4+%o4]0x89,%l7	! %l7 = 00000000796694bc

p0_label_25:
!	Mem[0000000010081408] = 56ee13ff, %l2 = 000000000000000a
	ldsba	[%i2+%o4]0x88,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000010081404] = e436b160, %l5 = 000000002ad52700
	ldsw	[%i2+0x004],%l5		! %l5 = ffffffffe436b160
!	Mem[0000000010081400] = d2038d08, %l4 = ffffffffffffffb5
	ldsha	[%i2+%g0]0x80,%l4	! %l4 = ffffffffffffd203
!	%l5 = ffffffffe436b160, %l2 = ffffffffffffffff, %l7  = 00000000796694bc
	mulx	%l5,%l2,%l7		! %l7 = 000000001bc94ea0
!	Mem[0000000030141400] = d2038d08e436b160, %l3 = 00000000172f6f72
	ldxa	[%i5+%g0]0x81,%l3	! %l3 = d2038d08e436b160
!	Mem[0000000030081400] = 60b136e4 088d03d2, %l2 = ffffffff, %l3 = e436b160
	ldda	[%i2+%g0]0x89,%l2	! %l2 = 00000000088d03d2 0000000060b136e4
!	%f22 = e1349b34, %f25 = 0027d52a, %f20 = 70aa6934
	fsubs	%f22,%f25,%f20		! %l0 = 00000000593a9738, Unfinished, %fsr = 0000000000
!	Mem[00000000100c1408] = ca0e600f 5721c519, %l6 = 000019c5, %l7 = 1bc94ea0
	ldda	[%i3+%o4]0x88,%l6	! %l6 = 000000005721c519 00000000ca0e600f
!	Mem[00000000100c1410] = 593a9716606cfca9, %l5 = ffffffffe436b160
	ldxa	[%i3+%o5]0x80,%l5	! %l5 = 593a9716606cfca9
!	Starting 10 instruction Store Burst
!	%l7 = 00000000ca0e600f, Mem[000000001008141b] = ffffffff, %asi = 80
	stba	%l7,[%i2+0x01b]%asi	! Mem[0000000010081418] = ffffff0f

p0_label_26:
!	%f30 = 1e25229f 9f2c5c44, Mem[0000000030181400] = 1e212219 1e0e600f
	stda	%f30,[%i6+%g0]0x89	! Mem[0000000030181400] = 1e25229f 9f2c5c44
!	%l4 = ffffffffffffd203, Mem[0000000030001410] = 4c6334a3
	stba	%l4,[%i0+%o5]0x89	! Mem[0000000030001410] = 4c633403
!	%f23 = 55e79ba6, Mem[0000000030081400] = d2038d08
	sta	%f23,[%i2+%g0]0x81	! Mem[0000000030081400] = 55e79ba6
!	%l2 = 088d03d2, %l3 = 60b136e4, Mem[0000000010101400] = 0addd1cc 01f35117
	stda	%l2,[%i4+%g0]0x80	! Mem[0000000010101400] = 088d03d2 60b136e4
!	%f18 = 1bb8d52a db72f184, %l6 = 000000005721c519
!	Mem[0000000030141418] = e1349b3455e79ba6
	add	%i5,0x018,%g1
	stda	%f18,[%g1+%l6]ASI_PST16_SL ! Mem[0000000030141418] = 84f19b3455e7b81b
!	Mem[00000000100c1408] = 19c52157, %l0 = 00000000593a9738
	ldstuba	[%i3+%o4]0x80,%l0	! %l0 = 00000019000000ff
!	%l0 = 0000000000000019, Mem[0000000010081408] = ff13ee56
	stwa	%l0,[%i2+%o4]0x80	! Mem[0000000010081408] = 00000019
!	%l6 = 000000005721c519, Mem[0000000030141410] = 70aa6934
	stha	%l6,[%i5+%o5]0x81	! Mem[0000000030141410] = c5196934
!	Mem[00000000100c1410] = 593a9716, %l3 = 0000000060b136e4
	swapa	[%i3+%o5]0x80,%l3	! %l3 = 00000000593a9716
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = 9f22251e, %l5 = 593a9716606cfca9
	lduwa	[%i6+%o4]0x89,%l5	! %l5 = 000000009f22251e

p0_label_27:
!	Mem[0000000030041400] = 000094bc, %l7 = 00000000ca0e600f
	ldsba	[%i1+%g0]0x89,%l7	! %l7 = ffffffffffffffbc
!	Mem[00000000100c1408] = ffc52157, %l4 = ffffffffffffd203
	lduha	[%i3+%o4]0x80,%l4	! %l4 = 000000000000ffc5
!	Mem[0000000030101400] = 5721634c, %l2 = 00000000088d03d2
	lduwa	[%i4+%g0]0x81,%l2	! %l2 = 000000005721634c
!	Mem[0000000010001408] = 0027d52a, %f15 = 9f22251e
	lda	[%i0+%o4]0x80,%f15	! %f15 = 0027d52a
!	Mem[0000000030181400] = 445c2c9f9f22251e, %l3 = 00000000593a9716
	ldxa	[%i6+%g0]0x81,%l3	! %l3 = 445c2c9f9f22251e
!	Mem[00000000100c1408] = ffc521570f600eca, %l3 = 445c2c9f9f22251e
	ldxa	[%i3+%o4]0x80,%l3	! %l3 = ffc521570f600eca
!	Mem[0000000010141410] = e0250a6d0f0be2a9, %l4 = 000000000000ffc5
	ldxa	[%i5+0x010]%asi,%l4	! %l4 = e0250a6d0f0be2a9
!	Mem[0000000030001400] = 34964508, %l2 = 000000005721634c
	ldsba	[%i0+%g0]0x81,%l2	! %l2 = 0000000000000034
!	Mem[0000000010041408] = af3c3dff, %l5 = 000000009f22251e
	lduha	[%i1+%o4]0x88,%l5	! %l5 = 0000000000003dff
!	Starting 10 instruction Store Burst
!	Mem[0000000010141438] = 445c2c9f9f22251e, %l0 = 0000000000000019, %l4 = e0250a6d0f0be2a9
	add	%i5,0x38,%g1
	casxa	[%g1]0x80,%l0,%l4	! %l4 = 445c2c9f9f22251e

p0_label_28:
!	%f16 = d2038d08, Mem[000000001008143c] = 75164fc8
	sta	%f16,[%i2+0x03c]%asi	! Mem[000000001008143c] = d2038d08
!	%f6  = fd2146b2 e70000ff, %l5 = 0000000000003dff
!	Mem[0000000010181410] = ff1b000051000000
	add	%i6,0x010,%g1
	stda	%f6,[%g1+%l5]ASI_PST32_PL ! Mem[0000000010181410] = ff0000e7b24621fd
!	Mem[0000000010041438] = 445c2c9f, %l0 = 00000019, %l5 = 00003dff
	add	%i1,0x38,%g1
	casa	[%g1]0x80,%l0,%l5	! %l5 = 00000000445c2c9f
!	%l0 = 0000000000000019, Mem[0000000010101408] = 3469aa70
	stba	%l0,[%i4+%o4]0x80	! Mem[0000000010101408] = 1969aa70
!	Mem[0000000010101408] = 1969aa70, %l5 = 00000000445c2c9f
	ldstuba	[%i4+%o4]0x80,%l5	! %l5 = 00000019000000ff
!	%l4 = 445c2c9f9f22251e, Mem[00000000211c0000] = 22dce5a1, %asi = 80
	stha	%l4,[%o2+0x000]%asi	! Mem[00000000211c0000] = 251ee5a1
!	%f15 = 0027d52a, Mem[00000000100c1410] = e436b160
	sta	%f15,[%i3+%o5]0x88	! Mem[00000000100c1410] = 0027d52a
!	%f10 = 60b136e4 088d03d2, %l5 = 0000000000000019
!	Mem[0000000030001430] = f73659a641a1a601
	add	%i0,0x030,%g1
	stda	%f10,[%g1+%l5]ASI_PST16_SL ! Mem[0000000030001430] = d20359a641a1b160
!	%f16 = d2038d08 e436b160 1bb8d52a db72f184
!	%f20 = 70aa6934 bbe3c832 e1349b34 55e79ba6
!	%f24 = c73a9716 0027d52a 60b136e4 088d03d2
!	%f28 = 19c52157 0f600eca 1e25229f 9f2c5c44
	stda	%f16,[%i5]ASI_BLK_SL	! Block Store to 0000000030141400
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (5)
!	Mem[0000000030141408] = 84f172db 2ad5b81b, %l4 = 9f22251e, %l5 = 00000019
	ldda	[%i5+%o4]0x81,%l4	! %l4 = 0000000084f172db 000000002ad5b81b

p0_label_29:
!	%l5 = 000000002ad5b81b, %l7 = ffffffffffffffbc, %l7 = ffffffffffffffbc
	xnor	%l5,%l7,%l7		! %l7 = 000000002ad5b858
!	Mem[0000000030181410] = f8af92e2, %l3 = ffc521570f600eca
	lduwa	[%i6+%o5]0x81,%l3	! %l3 = 00000000f8af92e2
!	%l1 = 00000000b252fd4b, %l6 = 000000005721c519, %l6 = 000000005721c519
	or	%l1,%l6,%l6		! %l6 = 00000000f773fd5b
!	Mem[0000000010001420] = c73a9716 fc2b9aae, %l4 = 84f172db, %l5 = 2ad5b81b
	ldd	[%i0+0x020],%l4		! %l4 = 00000000c73a9716 00000000fc2b9aae
!	Mem[0000000030141408] = 1bb8d52adb72f184, %f30 = 1e25229f 9f2c5c44
	ldda	[%i5+%o4]0x89,%f30	! %f30 = 1bb8d52a db72f184
!	Mem[0000000030141400] = 60b136e4, %l4 = 00000000c73a9716
	ldswa	[%i5+%g0]0x81,%l4	! %l4 = 0000000060b136e4
!	Mem[0000000010081428] = 94121178, %l7 = 000000002ad5b858
	ldsha	[%i2+0x028]%asi,%l7	! %l7 = ffffffffffff9412
!	Mem[00000000300c1400] = ffffffff ffffaa70, %l2 = 00000034, %l3 = f8af92e2
	ldda	[%i3+%g0]0x89,%l2	! %l2 = 00000000ffffaa70 00000000ffffffff
!	Mem[0000000021800140] = ff6099db, %l3 = 00000000ffffffff
	ldsb	[%o3+0x141],%l3		! %l3 = 0000000000000060
!	Starting 10 instruction Store Burst
!	%f0  = 6bfb568f ca591030, %l1 = 00000000b252fd4b
!	Mem[0000000010181418] = 7019af4760b136e4
	add	%i6,0x018,%g1
	stda	%f0,[%g1+%l1]ASI_PST8_PL ! Mem[0000000010181418] = 3010afca60b1fbe4

p0_label_30:
!	Mem[0000000010041410] = 00003dff, %l0 = 0000000000000019
	swapa	[%i1+%o5]0x88,%l0	! %l0 = 0000000000003dff
!	Mem[00000000100c1407] = 9f22251e, %l5 = 00000000fc2b9aae
	ldstuba	[%i3+0x007]%asi,%l5	! %l5 = 0000001e000000ff
!	%l4 = 0000000060b136e4, Mem[0000000010081400] = 088d03d2
	stwa	%l4,[%i2+%g0]0x88	! Mem[0000000010081400] = 60b136e4
!	%l7 = ffffffffffff9412, Mem[00000000100c1410] = 0027d52a
	stha	%l7,[%i3+%o5]0x88	! Mem[00000000100c1410] = 00279412
!	%l4 = 0000000060b136e4, Mem[0000000010041408] = ff3d3caf
	stha	%l4,[%i1+%o4]0x80	! Mem[0000000010041408] = 36e43caf
!	%l7 = ffffffffffff9412, Mem[0000000030181400] = 1e25229f9f2c5c44
	stxa	%l7,[%i6+%g0]0x89	! Mem[0000000030181400] = ffffffffffff9412
!	%l6 = 00000000f773fd5b, Mem[0000000030001400] = 34964508
	stwa	%l6,[%i0+%g0]0x81	! Mem[0000000030001400] = f773fd5b
!	Mem[0000000030181408] = 9f22251e, %l6 = 00000000f773fd5b
	ldstuba	[%i6+%o4]0x89,%l6	! %l6 = 0000001e000000ff
!	%l1 = 00000000b252fd4b, Mem[00000000100c1410] = 12942700
	stba	%l1,[%i3+%o5]0x80	! Mem[00000000100c1410] = 4b942700
!	Starting 10 instruction Load Burst
!	Mem[0000000010181424] = 726f2f17, %l7 = ffffffffffff9412
	lduh	[%i6+0x026],%l7		! %l7 = 0000000000002f17

p0_label_31:
!	Mem[0000000010101400] = d2038d08, %l7 = 0000000000002f17
	ldsba	[%i4+%g0]0x88,%l7	! %l7 = 0000000000000008
!	Mem[00000000201c0000] = ff5201ce, %l1 = 00000000b252fd4b
	ldub	[%o0+%g0],%l1		! %l1 = 00000000000000ff
!	Mem[000000001014143c] = 9f22251e, %l1 = 00000000000000ff
	ldsha	[%i5+0x03e]%asi,%l1	! %l1 = 000000000000251e
!	Mem[0000000010001410] = 70aa6934 bbe3c832, %l6 = 0000001e, %l7 = 00000008
	ldd	[%i0+%o5],%l6		! %l6 = 0000000070aa6934 00000000bbe3c832
!	Mem[0000000030101410] = a334634c172f6f72, %l5 = 000000000000001e
	ldxa	[%i4+%o5]0x81,%l5	! %l5 = a334634c172f6f72
!	Mem[0000000010101410] = 7c92aff8, %l4 = 0000000060b136e4
	ldswa	[%i4+%o5]0x80,%l4	! %l4 = 000000007c92aff8
!	Mem[000000001000143c] = ec455e81, %l2 = 00000000ffffaa70
	lduba	[%i0+0x03e]%asi,%l2	! %l2 = 000000000000005e
!	Mem[0000000010181400] = 00000000, %f24 = c73a9716
	lda	[%i6+%g0]0x88,%f24	! %f24 = 00000000
!	Mem[0000000030141408] = 84f172db, %l5 = a334634c172f6f72
	lduwa	[%i5+%o4]0x81,%l5	! %l5 = 0000000084f172db
!	Starting 10 instruction Store Burst
!	%l2 = 0000005e, %l3 = 00000060, Mem[0000000030001400] = f773fd5b af3c3d27
	stda	%l2,[%i0+%g0]0x81	! Mem[0000000030001400] = 0000005e 00000060

p0_label_32:
!	%l0 = 0000000000003dff, Mem[0000000010101400] = 088d03d2
	stha	%l0,[%i4+%g0]0x80	! Mem[0000000010101400] = 3dff03d2
!	Mem[0000000010101400] = 3dff03d2, %l6 = 0000000070aa6934
	swapa	[%i4+%g0]0x80,%l6	! %l6 = 000000003dff03d2
!	Mem[00000000100c1408] = 5721c5ff, %l7 = 00000000bbe3c832
	swapa	[%i3+%o4]0x88,%l7	! %l7 = 000000005721c5ff
!	%l4 = 000000007c92aff8, Mem[0000000030001408] = 27000000
	stwa	%l4,[%i0+%o4]0x89	! Mem[0000000030001408] = 7c92aff8
!	%f26 = 60b136e4 088d03d2, %l4 = 000000007c92aff8
!	Mem[0000000010081400] = e436b160e436b160
	stda	%f26,[%i2+%l4]ASI_PST32_PL ! Mem[0000000010081400] = e436b160e436b160
!	%f8  = 60b136e4, Mem[0000000010181418] = 3010afca
	sta	%f8 ,[%i6+0x018]%asi	! Mem[0000000010181418] = 60b136e4
!	Mem[0000000010141408] = db72a334, %l6 = 000000003dff03d2
	ldstuba	[%i5+%o4]0x88,%l6	! %l6 = 00000034000000ff
!	%l6 = 00000034, %l7 = 5721c5ff, Mem[0000000030181408] = ff25229f 9f2c5c44
	stda	%l6,[%i6+%o4]0x81	! Mem[0000000030181408] = 00000034 5721c5ff
!	Mem[0000000010141410] = e0250a6d, %l0 = 0000000000003dff
	ldsha	[%i5+%o5]0x80,%l0	! %l0 = ffffffffffffe025
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = 527cce13 00000019, %l0 = ffffe025, %l1 = 0000251e
	ldda	[%i1+%o5]0x88,%l0	! %l0 = 0000000000000019 00000000527cce13

p0_label_33:
!	Mem[00000000100c1408] = 32c8e3bb 0f600eca, %l4 = 7c92aff8, %l5 = 84f172db
	ldda	[%i3+%o4]0x80,%l4	! %l4 = 0000000032c8e3bb 000000000f600eca
!	Mem[0000000010141428] = a6667f18fd2281c3, %l2 = 000000000000005e
	ldx	[%i5+0x028],%l2		! %l2 = a6667f18fd2281c3
!	Mem[0000000030081400] = 55e79ba6, %l0 = 0000000000000019
	lduwa	[%i2+%g0]0x81,%l0	! %l0 = 0000000055e79ba6
!	Mem[0000000010181410] = ff0000e7, %f23 = 55e79ba6
	lda	[%i6+%o5]0x80,%f23	! %f23 = ff0000e7
!	Mem[00000000100c1418] = 2c6c9f8b, %l3 = 0000000000000060
	lduha	[%i3+0x018]%asi,%l3	! %l3 = 0000000000002c6c
!	Mem[0000000010081400] = 60b136e4, %l0 = 0000000055e79ba6
	ldsba	[%i2+%g0]0x88,%l0	! %l0 = ffffffffffffffe4
!	Mem[0000000030001408] = 7c92aff8, %l1 = 00000000527cce13
	lduwa	[%i0+%o4]0x89,%l1	! %l1 = 000000007c92aff8
!	Mem[0000000010181400] = 00000000, %l2 = a6667f18fd2281c3
	swapa	[%i6+%g0]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000010141410] = e0250a6d, %f4  = 26604981
	lda	[%i5+%o5]0x80,%f4 	! %f4 = e0250a6d
!	Starting 10 instruction Store Burst
!	Mem[0000000030101410] = a334634c, %l2 = 0000000000000000
	swapa	[%i4+%o5]0x81,%l2	! %l2 = 00000000a334634c

p0_label_34:
!	%l6 = 0000000000000034, Mem[0000000010181408] = 34787248
	stba	%l6,[%i6+%o4]0x80	! Mem[0000000010181408] = 34787248
!	Mem[0000000010181400] = c38122fd, %l4 = 0000000032c8e3bb
	ldstuba	[%i6+%g0]0x88,%l4	! %l4 = 000000fd000000ff
!	Mem[0000000010001410] = 3469aa70, %l4 = 00000000000000fd
	ldstuba	[%i0+%o5]0x88,%l4	! %l4 = 00000070000000ff
!	%l7 = 000000005721c5ff, Mem[0000000010141400] = ffffffff
	stwa	%l7,[%i5+%g0]0x88	! Mem[0000000010141400] = 5721c5ff
!	%f3  = 55e79ba6, %f2  = e1349b34
	fsqrts	%f3 ,%f2 		! %f2  = 4aac2dfc
!	%f0  = 6bfb568f ca591030 4aac2dfc 55e79ba6
!	%f4  = e0250a6d 4c6334a3 fd2146b2 e70000ff
!	%f8  = 60b136e4 088d03d2 60b136e4 088d03d2
!	%f12 = 796694bc 4c6334a3 9f22251e 0027d52a
	stda	%f0,[%i0]ASI_BLK_AIUPL	! Block Store to 0000000010001400
!	%f30 = 1bb8d52a db72f184, Mem[0000000030041410] = ff7bd3e4 d1e92f7b
	stda	%f30,[%i1+%o5]0x81	! Mem[0000000030041410] = 1bb8d52a db72f184
!	%l2 = 00000000a334634c, Mem[0000000030181410] = f8af92e2
	stwa	%l2,[%i6+%o5]0x81	! Mem[0000000030181410] = a334634c
!	Mem[0000000030081410] = cab3b22b, %l5 = 000000000f600eca
	ldstuba	[%i2+%o5]0x89,%l5	! %l5 = 0000002b000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = ff69aa70, %l5 = 000000000000002b
	ldswa	[%i4+%o4]0x80,%l5	! %l5 = ffffffffff69aa70

p0_label_35:
!	Mem[00000000100c1400] = 0000009b9f2225ff, %f24 = 00000000 0027d52a
	ldda	[%i3+%g0]0x80,%f24	! %f24 = 0000009b 9f2225ff
!	Mem[00000000100c1418] = 2c6c9f8b86b8493e, %f26 = 60b136e4 088d03d2
	ldd	[%i3+0x018],%f26	! %f26 = 2c6c9f8b 86b8493e
!	Mem[00000000100c1410] = 4b942700, %l1 = 000000007c92aff8
	ldsha	[%i3+%o5]0x80,%l1	! %l1 = 0000000000004b94
!	Mem[0000000010101410] = f8af927c, %l1 = 0000000000004b94
	lduba	[%i4+%o5]0x88,%l1	! %l1 = 000000000000007c
!	Mem[0000000030041408] = b562cdb1, %l0 = ffffffffffffffe4
	lduha	[%i1+%o4]0x81,%l0	! %l0 = 000000000000b562
!	Mem[0000000010141408] = ffa372db, %l2 = 00000000a334634c
	lduha	[%i5+%o4]0x80,%l2	! %l2 = 000000000000ffa3
!	Mem[0000000030141410] = bbe3c832, %l7 = 000000005721c5ff
	lduba	[%i5+%o5]0x89,%l7	! %l7 = 0000000000000032
!	Mem[0000000030141400] = 60b136e4, %l0 = 000000000000b562
	lduwa	[%i5+%g0]0x81,%l0	! %l0 = 0000000060b136e4
!	Mem[00000000100c1404] = 9f2225ff, %f27 = 86b8493e
	lda	[%i3+0x004]%asi,%f27	! %f27 = 9f2225ff
!	Starting 10 instruction Store Burst
!	%f16 = d2038d08 e436b160, %l3 = 0000000000002c6c
!	Mem[0000000010041400] = 796694bc4c6334a3
	stda	%f16,[%i1+%l3]ASI_PST16_PL ! Mem[0000000010041400] = 796694bc088d03d2

p0_label_36:
!	%f18 = 1bb8d52a, Mem[0000000010041400] = bc946679
	sta	%f18,[%i1+%g0]0x88	! Mem[0000000010041400] = 1bb8d52a
!	%l6 = 0000000000000034, Mem[0000000030001408] = 7c92aff8
	stwa	%l6,[%i0+%o4]0x89	! Mem[0000000030001408] = 00000034
	membar	#Sync			! Added by membar checker (6)
!	Mem[0000000010001400] = ca591030, %l5 = ffffffffff69aa70
	swapa	[%i0+%g0]0x88,%l5	! %l5 = 00000000ca591030
!	%f16 = d2038d08, Mem[0000000010001414] = 6d0a25e0
	st	%f16,[%i0+0x014]	! Mem[0000000010001414] = d2038d08
!	%l4 = 00000070, %l5 = ca591030, Mem[0000000010001400] = ff69aa70 6bfb568f
	stda	%l4,[%i0+%g0]0x88	! Mem[0000000010001400] = 00000070 ca591030
!	%l1 = 000000000000007c, Mem[0000000021800000] = ff5518df, %asi = 80
	stha	%l1,[%o3+0x000]%asi	! Mem[0000000021800000] = 007c18df
!	%l7 = 0000000000000032, Mem[0000000030181408] = 34000000
	stba	%l7,[%i6+%o4]0x89	! Mem[0000000030181408] = 34000032
!	%l5 = 00000000ca591030, Mem[0000000010001438] = 2ad52700
	sth	%l5,[%i0+0x038]		! Mem[0000000010001438] = 10302700
!	%l2 = 000000000000ffa3, Mem[000000001004141e] = d01edd19, %asi = 80
	stha	%l2,[%i1+0x01e]%asi	! Mem[000000001004141c] = d01effa3
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = 36e43caf e437566a, %l0 = 60b136e4, %l1 = 0000007c
	ldda	[%i1+%o4]0x80,%l0	! %l0 = 0000000036e43caf 00000000e437566a

p0_label_37:
!	Mem[00000000211c0000] = 251ee5a1, %l7 = 0000000000000032
	lduba	[%o2+0x000]%asi,%l7	! %l7 = 0000000000000025
!	Mem[0000000030001408] = 00000034, %l3 = 0000000000002c6c
	ldsha	[%i0+%o4]0x89,%l3	! %l3 = 0000000000000034
!	Mem[0000000030141408] = 1bb8d52adb72f184, %l6 = 0000000000000034
	ldxa	[%i5+%o4]0x89,%l6	! %l6 = 1bb8d52adb72f184
!	Mem[0000000010101410] = 7c92aff8, %l2 = 000000000000ffa3
	ldsha	[%i4+%o5]0x80,%l2	! %l2 = 0000000000007c92
!	Mem[0000000030041400] = bc940000, %l5 = 00000000ca591030
	lduwa	[%i1+%g0]0x81,%l5	! %l5 = 00000000bc940000
!	Mem[0000000010081408] = 3253810319000000, %f0  = 6bfb568f ca591030
	ldda	[%i2+%o4]0x88,%f0 	! %f0  = 32538103 19000000
!	Mem[0000000010101400] = 70aa693460b136e4, %f6  = fd2146b2 e70000ff
	ldda	[%i4+%g0]0x80,%f6 	! %f6  = 70aa6934 60b136e4
!	Mem[0000000010081410] = d8788cc6 be91f2e9, %l4 = 00000070, %l5 = bc940000
	ldda	[%i2+%o5]0x88,%l4	! %l4 = 00000000be91f2e9 00000000d8788cc6
!	Mem[00000000100c1400] = 0000009b, %f8  = 60b136e4
	ld	[%i3+%g0],%f8 	! %f8 = 0000009b
!	Starting 10 instruction Store Burst
!	Mem[0000000010001408] = a69be755, %l5 = 00000000d8788cc6
	swapa	[%i0+%o4]0x80,%l5	! %l5 = 00000000a69be755

p0_label_38:
!	Mem[0000000030001408] = 00000034, %l7 = 0000000000000025
	swapa	[%i0+%o4]0x89,%l7	! %l7 = 0000000000000034
!	Mem[0000000010141400] = ffc52157, %l2 = 0000000000007c92
	swapa	[%i5+%g0]0x80,%l2	! %l2 = 00000000ffc52157
!	%l6 = 1bb8d52adb72f184, Mem[0000000030101410] = 00000000
	stha	%l6,[%i4+%o5]0x89	! Mem[0000000030101410] = 0000f184
!	%l4 = 00000000be91f2e9, Mem[00000000100c1410] = 4b942700606cfca9
	stxa	%l4,[%i3+%o5]0x80	! Mem[00000000100c1410] = 00000000be91f2e9
!	%l0 = 36e43caf, %l1 = e437566a, Mem[0000000010101408] = ff69aa70 1d8080b9
	std	%l0,[%i4+%o4]		! Mem[0000000010101408] = 36e43caf e437566a
!	%f18 = 1bb8d52a db72f184, %l1 = 00000000e437566a
!	Mem[0000000010141430] = cb0c4acb9ad31662
	add	%i5,0x030,%g1
	stda	%f18,[%g1+%l1]ASI_PST8_PL ! Mem[0000000010141430] = cbf14adb9ad5b862
!	Mem[000000001004141f] = d01effa3, %l6 = 1bb8d52adb72f184
	ldstuba	[%i1+0x01f]%asi,%l6	! %l6 = 000000a3000000ff
!	%f6  = 70aa6934, Mem[0000000010041424] = d8275aa4
	sta	%f6 ,[%i1+0x024]%asi	! Mem[0000000010041424] = 70aa6934
!	%l4 = be91f2e9, %l5 = a69be755, Mem[0000000010181408] = 48727834 eef7dfbf
	stda	%l4,[%i6+%o4]0x88	! Mem[0000000010181408] = be91f2e9 a69be755
!	Starting 10 instruction Load Burst
!	Mem[000000001018141c] = 60b1fbe4, %l6 = 00000000000000a3
	ldsba	[%i6+0x01c]%asi,%l6	! %l6 = 0000000000000060

p0_label_39:
!	Mem[0000000010101400] = 70aa6934, %l3 = 0000000000000034
	ldsba	[%i4+%g0]0x80,%l3	! %l3 = 0000000000000070
!	Mem[0000000030041410] = 1bb8d52a, %l7 = 0000000000000034
	lduba	[%i1+%o5]0x81,%l7	! %l7 = 000000000000001b
!	Mem[0000000010001408] = c68c78d8, %l3 = 0000000000000070
	lduwa	[%i0+%o4]0x88,%l3	! %l3 = 00000000c68c78d8
!	Mem[0000000030001408] = 25000000, %l6 = 0000000000000060
	ldsha	[%i0+%o4]0x81,%l6	! %l6 = 0000000000002500
!	Mem[0000000010081408] = 19000000, %l3 = 00000000c68c78d8
	ldsha	[%i2+%o4]0x88,%l3	! %l3 = 0000000000000000
!	Mem[00000000300c1400] = ffffaa70, %l3 = 0000000000000000
	lduba	[%i3+%g0]0x89,%l3	! %l3 = 0000000000000070
!	Mem[0000000030181400] = 1294ffff, %f24 = 0000009b
	lda	[%i6+%g0]0x81,%f24	! %f24 = 1294ffff
!	Mem[0000000030081400] = 55e79ba6, %f27 = 9f2225ff
	lda	[%i2+%g0]0x81,%f27	! %f27 = 55e79ba6
!	%l7 = 000000000000001b, immed = 000005c7, %y  = 00003478
	smul	%l7,0x5c7,%l7		! %l7 = 0000000000009bfd, %y = 00000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010181418] = 60b136e460b1fbe4, %l4 = 00000000be91f2e9, %l7 = 0000000000009bfd
	add	%i6,0x18,%g1
	casxa	[%g1]0x80,%l4,%l7	! %l7 = 60b136e460b1fbe4

p0_label_40:
!	Mem[00000000100c1408] = bbe3c832, %l2 = 00000000ffc52157
	swapa	[%i3+%o4]0x88,%l2	! %l2 = 00000000bbe3c832
!	Mem[0000000010181408] = e9f291be, %l7 = 60b136e460b1fbe4
	swapa	[%i6+%o4]0x80,%l7	! %l7 = 00000000e9f291be
!	%f9  = 088d03d2, Mem[0000000010041408] = af3ce436
	sta	%f9 ,[%i1+%o4]0x88	! Mem[0000000010041408] = 088d03d2
!	%f4  = e0250a6d 4c6334a3, %l4 = 00000000be91f2e9
!	Mem[0000000010181420] = a21033db726f2f17
	add	%i6,0x020,%g1
	stda	%f4,[%g1+%l4]ASI_PST32_PL ! Mem[0000000010181420] = a334634c726f2f17
!	%f9  = 088d03d2, Mem[0000000010041410] = 00000019
	sta	%f9 ,[%i1+%o5]0x88	! Mem[0000000010041410] = 088d03d2
!	%l0 = 0000000036e43caf, Mem[0000000010101400] = 70aa6934
	stwa	%l0,[%i4+%g0]0x80	! Mem[0000000010101400] = 36e43caf
!	%f12 = 796694bc 4c6334a3, Mem[0000000030181400] = ffff9412 ffffffff
	stda	%f12,[%i6+%g0]0x89	! Mem[0000000030181400] = 796694bc 4c6334a3
!	Mem[0000000020800001] = fd4be062, %l3 = 0000000000000070
	ldstub	[%o1+0x001],%l3		! %l3 = 0000004b000000ff
!	%f3  = 55e79ba6, %f15 = 0027d52a, %f28 = 19c52157
	fsubs	%f3 ,%f15,%f28		! %l0 = 0000000036e43cd1, Unfinished, %fsr = 0000000000
!	Starting 10 instruction Load Burst
!	Mem[00000000218001c0] = 732cc752, %l4 = 00000000be91f2e9
	ldsha	[%o3+0x1c0]%asi,%l4	! %l4 = 000000000000732c

p0_label_41:
!	Mem[00000000300c1408] = 19dd1ed0, %l4 = 000000000000732c
	lduha	[%i3+%o4]0x81,%l4	! %l4 = 00000000000019dd
!	Mem[0000000020800000] = fdffe062, %l3 = 000000000000004b
	lduha	[%o1+0x000]%asi,%l3	! %l3 = 000000000000fdff
!	Mem[0000000030141410] = 70aa6934bbe3c832, %l4 = 00000000000019dd
	ldxa	[%i5+%o5]0x89,%l4	! %l4 = 70aa6934bbe3c832
!	Mem[0000000010001410] = a334634c, %l4 = 70aa6934bbe3c832
	ldsw	[%i0+%o5],%l4		! %l4 = ffffffffa334634c
!	Mem[0000000030041408] = b562cdb1, %l5 = 00000000a69be755
	ldswa	[%i1+%o4]0x81,%l5	! %l5 = ffffffffb562cdb1
!	Mem[0000000030181408] = ffc5215734000032, %f18 = 1bb8d52a db72f184
	ldda	[%i6+%o4]0x89,%f18	! %f18 = ffc52157 34000032
!	Mem[0000000010081400] = e436b160, %l4 = ffffffffa334634c
	lduwa	[%i2+0x000]%asi,%l4	! %l4 = 00000000e436b160
!	Mem[0000000030101408] = 796694bc, %l3 = 000000000000fdff
	ldsba	[%i4+%o4]0x89,%l3	! %l3 = ffffffffffffffbc
!	Mem[0000000010101400] = e436b160 af3ce436, %l4 = e436b160, %l5 = b562cdb1
	ldda	[%i4+%g0]0x88,%l4	! %l4 = 00000000af3ce436 00000000e436b160
!	Starting 10 instruction Store Burst
!	%l1 = 00000000e437566a, immd = fffffffffffff78a, %l0  = 0000000036e43cd1
	mulx	%l1,-0x876,%l0		! %l0 = fffff87513cadb24

p0_label_42:
!	Mem[0000000010101432] = ff13ee56, %l6 = 0000000000002500
	ldstuba	[%i4+0x032]%asi,%l6	! %l6 = 000000ee000000ff
!	Mem[0000000030001400] = 0000005e, %l4 = 00000000af3ce436
	swapa	[%i0+%g0]0x81,%l4	! %l4 = 000000000000005e
!	%l0 = fffff87513cadb24, Mem[0000000030101410] = 726f2f170000f184
	stxa	%l0,[%i4+%o5]0x89	! Mem[0000000030101410] = fffff87513cadb24
!	Mem[0000000010101410] = 7c92aff8, %l2 = 00000000bbe3c832
	ldstuba	[%i4+%o5]0x80,%l2	! %l2 = 0000007c000000ff
!	Mem[0000000010081408] = 00000019, %l7 = 00000000e9f291be
	swapa	[%i2+%o4]0x80,%l7	! %l7 = 0000000000000019
!	Mem[0000000021800001] = 007c18df, %l3 = ffffffffffffffbc
	ldstub	[%o3+0x001],%l3		! %l3 = 0000007c000000ff
!	Mem[00000000201c0001] = ff5201ce, %l1 = 00000000e437566a
	ldstuba	[%o0+0x001]%asi,%l1	! %l1 = 00000052000000ff
!	%f6  = 70aa6934 60b136e4, Mem[0000000010181408] = 60b1fbe4 55e79ba6
	stda	%f6 ,[%i6+%o4]0x80	! Mem[0000000010181408] = 70aa6934 60b136e4
!	%l2 = 000000000000007c, Mem[00000000100c1400] = ff25229f9b000000
	stxa	%l2,[%i3+%g0]0x88	! Mem[00000000100c1400] = 000000000000007c
!	Starting 10 instruction Load Burst
!	Mem[0000000010181418] = 60b136e460b1fbe4, %f22 = e1349b34 ff0000e7
	ldda	[%i6+0x018]%asi,%f22	! %f22 = 60b136e4 60b1fbe4

p0_label_43:
!	Mem[0000000010081430] = 128b7cee7928f15e, %f26 = 2c6c9f8b 55e79ba6
	ldda	[%i2+0x030]%asi,%f26	! %f26 = 128b7cee 7928f15e
!	Mem[0000000030141400] = d2038d08 e436b160, %l0 = 13cadb24, %l1 = 00000052
	ldda	[%i5+%g0]0x89,%l0	! %l0 = 00000000e436b160 00000000d2038d08
!	Mem[0000000030041408] = b562cdb1, %l1 = 00000000d2038d08
	ldswa	[%i1+%o4]0x81,%l1	! %l1 = ffffffffb562cdb1
!	Mem[0000000010001410] = a334634c, %l3 = 000000000000007c
	lduwa	[%i0+%o5]0x80,%l3	! %l3 = 00000000a334634c
!	Mem[00000000201c0000] = ffff01ce, %l5 = 00000000e436b160
	ldsha	[%o0+0x000]%asi,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000030181410] = a334634c, %f10 = 60b136e4
	lda	[%i6+%o5]0x81,%f10	! %f10 = a334634c
!	%f5  = 4c6334a3, %f17 = e436b160, %f31 = db72f184
	fadds	%f5 ,%f17,%f31		! %f31 = e436b160
!	Mem[00000000100c1408] = 5721c5ff 0f600eca, %l4 = 0000005e, %l5 = ffffffff
	ldda	[%i3+%o4]0x80,%l4	! %l4 = 000000005721c5ff 000000000f600eca
!	Mem[00000000100c1408] = ca0e600f ffc52157, %l2 = 0000007c, %l3 = a334634c
	ldda	[%i3+%o4]0x88,%l2	! %l2 = 00000000ffc52157 00000000ca0e600f
!	Starting 10 instruction Store Burst
!	Mem[00000000201c0000] = ffff01ce, %l4 = 000000005721c5ff
	ldstub	[%o0+%g0],%l4		! %l4 = 000000ff000000ff

p0_label_44:
!	Mem[00000000100c1403] = 7c000000, %l1 = ffffffffb562cdb1
	ldstub	[%i3+0x003],%l1		! %l1 = 00000000000000ff
!	%f18 = ffc52157 34000032, %l4 = 00000000000000ff
!	Mem[0000000030081420] = dc24471b8906acbf
	add	%i2,0x020,%g1
	stda	%f18,[%g1+%l4]ASI_PST16_S ! Mem[0000000030081420] = ffc5215734000032
!	%f20 = 70aa6934 bbe3c832, Mem[0000000010081400] = e436b160 e436b160
	stda	%f20,[%i2+0x000]%asi	! Mem[0000000010081400] = 70aa6934 bbe3c832
!	Mem[0000000020800000] = fdffe062, %l3 = 00000000ca0e600f
	ldstub	[%o1+%g0],%l3		! %l3 = 000000fd000000ff
!	Mem[000000001010142c] = 9f22251e, %l6 = 00000000000000ee, %asi = 80
	swapa	[%i4+0x02c]%asi,%l6	! %l6 = 000000009f22251e
!	%l3 = 00000000000000fd, Mem[0000000030101410] = 24dbca13
	stwa	%l3,[%i4+%o5]0x81	! Mem[0000000030101410] = 000000fd
!	%l4 = 00000000000000ff, Mem[0000000030001400] = af3ce43600000060
	stxa	%l4,[%i0+%g0]0x81	! Mem[0000000030001400] = 00000000000000ff
!	%l2 = ffc52157, %l3 = 000000fd, Mem[0000000030001400] = 00000000 000000ff
	stda	%l2,[%i0+%g0]0x81	! Mem[0000000030001400] = ffc52157 000000fd
!	%f26 = 128b7cee 7928f15e, Mem[0000000010181438] = b24621fd 94ad7d4c
	std	%f26,[%i6+0x038]	! Mem[0000000010181438] = 128b7cee 7928f15e
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = 60b136e4, %l0 = 00000000e436b160
	lduha	[%i5+%g0]0x81,%l0	! %l0 = 00000000000060b1

p0_label_45:
!	Mem[0000000010101410] = ff92aff8, %l0 = 00000000000060b1
	ldsha	[%i4+%o5]0x80,%l0	! %l0 = ffffffffffffff92
!	Mem[0000000030041408] = b562cdb1, %l1 = 0000000000000000
	ldswa	[%i1+%o4]0x81,%l1	! %l1 = ffffffffb562cdb1
!	%l6 = 000000009f22251e, immed = 00000312, %y  = 00000000
	smul	%l6,0x312,%l6		! %l6 = fffffed696d5f61c, %y = fffffed6
!	Mem[0000000030181400] = a334634c, %l0 = ffffffffffffff92
	lduwa	[%i6+%g0]0x81,%l0	! %l0 = 00000000a334634c
!	Mem[0000000020800040] = ff9bf99a, %l1 = ffffffffb562cdb1
	ldsh	[%o1+0x040],%l1		! %l1 = ffffffffffffff9b
!	Mem[0000000010001410] = 088d03d24c6334a3, %l7 = 0000000000000019
	ldxa	[%i0+%o5]0x88,%l7	! %l7 = 088d03d24c6334a3
!	Mem[0000000030141408] = 84f172db, %f14 = 9f22251e
	lda	[%i5+%o4]0x81,%f14	! %f14 = 84f172db
!	Mem[0000000010181408] = 70aa6934, %l2 = 00000000ffc52157
	lduwa	[%i6+%o4]0x80,%l2	! %l2 = 0000000070aa6934
!	Mem[000000001014142c] = fd2281c3, %l3 = 00000000000000fd
	ldsha	[%i5+0x02e]%asi,%l3	! %l3 = ffffffffffff81c3
!	Starting 10 instruction Store Burst
!	Mem[0000000010081410] = be91f2e9, %l1 = ffffffffffffff9b
	swapa	[%i2+%o5]0x88,%l1	! %l1 = 00000000be91f2e9

p0_label_46:
!	%l0 = a334634c, %l1 = be91f2e9, Mem[0000000030101408] = 796694bc 339112d4
	stda	%l0,[%i4+%o4]0x89	! Mem[0000000030101408] = a334634c be91f2e9
!	Mem[0000000010081423] = 49840312, %l0 = 00000000a334634c
	ldstub	[%i2+0x023],%l0		! %l0 = 00000012000000ff
!	%l1 = 00000000be91f2e9, Mem[0000000010081424] = f539bdcc
	stw	%l1,[%i2+0x024]		! Mem[0000000010081424] = be91f2e9
!	%f10 = a334634c 088d03d2, %l1 = 00000000be91f2e9
!	Mem[0000000010001418] = ff0000e7b24621fd
	add	%i0,0x018,%g1
	stda	%f10,[%g1+%l1]ASI_PST16_PL ! Mem[0000000010001418] = d20300e7b24634a3
!	Mem[0000000010141426] = 16973ac7, %l5 = 000000000f600eca
	ldstuba	[%i5+0x026]%asi,%l5	! %l5 = 0000003a000000ff
!	%l2 = 70aa6934, %l3 = ffff81c3, Mem[0000000010081410] = 9bffffff c68c78d8
	stda	%l2,[%i2+%o5]0x80	! Mem[0000000010081410] = 70aa6934 ffff81c3
!	%l6 = 96d5f61c, %l7 = 4c6334a3, Mem[0000000030081408] = 17440000 51000000
	stda	%l6,[%i2+%o4]0x89	! Mem[0000000030081408] = 96d5f61c 4c6334a3
!	%l4 = 000000ff, %l5 = 0000003a, Mem[0000000030181400] = a334634c bc946679
	stda	%l4,[%i6+%g0]0x81	! Mem[0000000030181400] = 000000ff 0000003a
!	Mem[0000000010001410] = 4c6334a3, %l3 = ffffffffffff81c3
	ldstuba	[%i0+%o5]0x88,%l3	! %l3 = 000000a3000000ff
!	Starting 10 instruction Load Burst
!	%l5 = 000000000000003a, %l4 = 00000000000000ff, %l3 = 00000000000000a3
	or	%l5,%l4,%l3		! %l3 = 00000000000000ff

p0_label_47:
!	Mem[00000000300c1410] = 00000065, %l3 = 00000000000000ff
	lduba	[%i3+%o5]0x89,%l3	! %l3 = 0000000000000065
!	Mem[0000000010081408] = be91f2e9, %l0 = 0000000000000012
	lduba	[%i2+%o4]0x88,%l0	! %l0 = 00000000000000e9
!	Mem[0000000030041400] = 000094bc, %l3 = 0000000000000065
	lduba	[%i1+%g0]0x89,%l3	! %l3 = 00000000000000bc
!	Mem[0000000010081428] = 94121178, %l3 = 00000000000000bc
	ldsha	[%i2+0x028]%asi,%l3	! %l3 = ffffffffffff9412
!	Mem[0000000030101400] = 4c632157, %l2 = 0000000070aa6934
	ldsha	[%i4+%g0]0x89,%l2	! %l2 = 0000000000002157
!	Mem[0000000030101400] = 5721634c, %l1 = 00000000be91f2e9
	ldsba	[%i4+%g0]0x81,%l1	! %l1 = 0000000000000057
!	Mem[0000000030081408] = 96d5f61c, %f11 = 088d03d2
	lda	[%i2+%o4]0x89,%f11	! %f11 = 96d5f61c
!	Mem[0000000030141408] = 84f172db, %l0 = 00000000000000e9
	ldswa	[%i5+%o4]0x81,%l0	! %l0 = ffffffff84f172db
!	Mem[0000000030141410] = 32c8e3bb, %l6 = fffffed696d5f61c
	ldsha	[%i5+%o5]0x81,%l6	! %l6 = 00000000000032c8
!	Starting 10 instruction Store Burst
!	Mem[0000000030041400] = 000094bc, %l3 = ffffffffffff9412
	swapa	[%i1+%g0]0x89,%l3	! %l3 = 00000000000094bc

p0_label_48:
!	%l7 = 088d03d24c6334a3, Mem[0000000030041400] = 1294ffff00000000
	stxa	%l7,[%i1+%g0]0x81	! Mem[0000000030041400] = 088d03d24c6334a3
!	%l2 = 0000000000002157, imm = ffffffffffffffb4, %l1 = 0000000000000057
	xor	%l2,-0x04c,%l1		! %l1 = ffffffffffffdee3
!	Mem[0000000030101408] = 4c6334a3e9f291be, %f10 = a334634c 96d5f61c
	ldda	[%i4+%o4]0x81,%f10	! %f10 = 4c6334a3 e9f291be
!	%l2 = 00002157, %l3 = 000094bc, Mem[0000000030141410] = bbe3c832 70aa6934
	stda	%l2,[%i5+%o5]0x89	! Mem[0000000030141410] = 00002157 000094bc
!	%l4 = 00000000000000ff, Mem[0000000030041408] = b562cdb1
	stba	%l4,[%i1+%o4]0x81	! Mem[0000000030041408] = ff62cdb1
!	%l4 = 00000000000000ff, Mem[0000000030001400] = 5721c5ff
	stwa	%l4,[%i0+%g0]0x89	! Mem[0000000030001400] = 000000ff
!	%f20 = 70aa6934 bbe3c832, Mem[0000000030081400] = 55e79ba6 e436b160
	stda	%f20,[%i2+%g0]0x81	! Mem[0000000030081400] = 70aa6934 bbe3c832
!	%l1 = ffffffffffffdee3, Mem[0000000010141400] = 927c0000
	stha	%l1,[%i5+%g0]0x88	! Mem[0000000010141400] = 927cdee3
!	Mem[0000000010041400] = 2ad5b81b, %l0 = ffffffff84f172db
	ldstuba	[%i1+%g0]0x80,%l0	! %l0 = 0000002a000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = 1bb8d5ff, %l7 = 088d03d24c6334a3
	lduba	[%i1+%g0]0x88,%l7	! %l7 = 00000000000000ff

p0_label_49:
!	Mem[0000000021800140] = ff6099db, %l6 = 00000000000032c8
	ldsh	[%o3+0x140],%l6		! %l6 = ffffffffffffff60
!	Mem[0000000010181408] = 70aa6934, %l2 = 0000000000002157
	lduwa	[%i6+%o4]0x80,%l2	! %l2 = 0000000070aa6934
!	Mem[0000000030101410] = 000000fd, %l5 = 000000000000003a
	ldsba	[%i4+%o5]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000030001400] = 000000ff, %l2 = 0000000070aa6934
	lduwa	[%i0+%g0]0x89,%l2	! %l2 = 00000000000000ff
!	%f25 = 9f2225ff, %f4  = e0250a6d
	fcmpes	%fcc0,%f25,%f4 		! %fcc0 = 2
!	Mem[00000000100c1400] = 7c0000ff, %l0 = 000000000000002a
	ldswa	[%i3+%g0]0x80,%l0	! %l0 = 000000007c0000ff
!	Mem[0000000010041410] = d2038d08, %l7 = 00000000000000ff
	lduwa	[%i1+%o5]0x80,%l7	! %l7 = 00000000d2038d08
!	Mem[0000000010101400] = 36e43caf 60b136e4, %l4 = 000000ff, %l5 = 00000000
	ldda	[%i4+0x000]%asi,%l4	! %l4 = 0000000036e43caf 0000000060b136e4
!	Mem[0000000030141408] = 84f172db, %l5 = 0000000060b136e4
	lduwa	[%i5+%o4]0x81,%l5	! %l5 = 0000000084f172db
!	Starting 10 instruction Store Burst
!	Code Fragment 3
p0_fragment_2:
!	%l0 = 000000007c0000ff
	setx	0x99beef68531af365,%g7,%l0 ! %l0 = 99beef68531af365
!	%l1 = ffffffffffffdee3
	setx	0x797691a80cfc824a,%g7,%l1 ! %l1 = 797691a80cfc824a
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 99beef68531af365
	setx	0x1a917537c261f640,%g7,%l0 ! %l0 = 1a917537c261f640
!	%l1 = 797691a80cfc824a
	setx	0x667c06180d4b38ee,%g7,%l1 ! %l1 = 667c06180d4b38ee

p0_label_50:
!	%l3 = 00000000000094bc, Mem[0000000030041410] = 1bb8d52a
	stha	%l3,[%i1+%o5]0x81	! Mem[0000000030041410] = 94bcd52a
!	%l6 = ffffff60, %l7 = d2038d08, Mem[0000000030141408] = db72f184 1bb8d52a
	stda	%l6,[%i5+%o4]0x89	! Mem[0000000030141408] = ffffff60 d2038d08
!	%l3 = 00000000000094bc, Mem[0000000030141408] = ffffff60
	stba	%l3,[%i5+%o4]0x89	! Mem[0000000030141408] = ffffffbc
!	Mem[00000000100c1408] = ffc52157, %l0 = 1a917537c261f640
	ldstuba	[%i3+%o4]0x88,%l0	! %l0 = 00000057000000ff
!	%l3 = 00000000000094bc, Mem[0000000010081410] = 70aa6934ffff81c3
	stxa	%l3,[%i2+%o5]0x80	! Mem[0000000010081410] = 00000000000094bc
!	%f27 = 7928f15e, Mem[0000000030081408] = 96d5f61c
	sta	%f27,[%i2+%o4]0x89	! Mem[0000000030081408] = 7928f15e
!	%l5 = 0000000084f172db, Mem[0000000030081408] = 7928f15e
	stwa	%l5,[%i2+%o4]0x89	! Mem[0000000030081408] = 84f172db
!	%l4 = 0000000036e43caf, Mem[00000000100c1408] = ff21c5ff0f600eca
	stxa	%l4,[%i3+%o4]0x80	! Mem[00000000100c1408] = 0000000036e43caf
!	%l6 = ffffff60, %l7 = d2038d08, Mem[0000000010081408] = be91f2e9 32538103
	stda	%l6,[%i2+%o4]0x88	! Mem[0000000010081408] = ffffff60 d2038d08
!	Starting 10 instruction Load Burst
!	%f18 = ffc52157, %f8  = 0000009b, %f16 = d2038d08 e436b160
	fsmuld	%f18,%f8 ,%f16		! %f16 = fff8a42a e0000000

p0_label_51:
!	Mem[0000000010001404] = 301059ca, %l7 = 00000000d2038d08
	ldswa	[%i0+0x004]%asi,%l7	! %l7 = 00000000301059ca
!	Mem[0000000010041428] = e0250a6d, %f29 = 0f600eca
	ld	[%i1+0x028],%f29	! %f29 = e0250a6d
!	Mem[0000000010141400] = 927cdee3, %l4 = 0000000036e43caf
	lduha	[%i5+%g0]0x88,%l4	! %l4 = 000000000000dee3
!	Mem[0000000030141408] = bcffffff, %l4 = 000000000000dee3
	lduwa	[%i5+%o4]0x81,%l4	! %l4 = 00000000bcffffff
!	%l2 = 00000000000000ff, immd = 0000000000000aa9, %l4 = 00000000bcffffff
	udivx	%l2,0xaa9,%l4		! %l4 = 0000000000000000
!	Mem[0000000030001410] = 4c633403, %f1  = 19000000
	lda	[%i0+%o5]0x89,%f1 	! %f1 = 4c633403
!	Mem[0000000010181408] = 70aa6934, %l4 = 0000000000000000
	lduba	[%i6+%o4]0x80,%l4	! %l4 = 0000000000000070
!	Mem[00000000300c1400] = 70aaffff ffffffff 19dd1ed0 f66d47e8
!	Mem[00000000300c1410] = 65000000 bbe3c832 dd6fe3d7 bbf532db
!	Mem[00000000300c1420] = b430a514 74e53ae9 423742c0 2b0994b6
!	Mem[00000000300c1430] = 9476aad5 6d0498fd e00c2ff6 60bb2927
	ldda	[%i3]ASI_BLK_SL,%f16	! Block Load from 00000000300c1400
!	Mem[0000000030081408] = db72f184, %l2 = 00000000000000ff
	ldsba	[%i2+%o4]0x81,%l2	! %l2 = ffffffffffffffdb
!	Starting 10 instruction Store Burst
!	Mem[0000000010141410] = e0250a6d, %l2 = ffffffffffffffdb
	swap	[%i5+%o5],%l2		! %l2 = 00000000e0250a6d

p0_label_52:
!	%l5 = 0000000084f172db, Mem[0000000010081410] = 00000000
	stha	%l5,[%i2+%o5]0x80	! Mem[0000000010081410] = 72db0000
!	%l5 = 0000000084f172db, Mem[0000000030181400] = ff000000
	stha	%l5,[%i6+%g0]0x89	! Mem[0000000030181400] = ff0072db
!	%l1 = 667c06180d4b38ee, Mem[0000000030081400] = 32c8e3bb3469aa70
	stxa	%l1,[%i2+%g0]0x89	! Mem[0000000030081400] = 667c06180d4b38ee
!	%l0 = 0000000000000057, Mem[0000000030001408] = 00000025
	stwa	%l0,[%i0+%o4]0x89	! Mem[0000000030001408] = 00000057
!	%l6 = ffffffffffffff60, %l1 = 667c06180d4b38ee, %l4 = 0000000000000070
	andn	%l6,%l1,%l4		! %l4 = 9983f9e7f2b4c700
!	Mem[0000000030101408] = 4c6334a3, %l7 = 00000000301059ca
	ldstuba	[%i4+%o4]0x81,%l7	! %l7 = 0000004c000000ff
!	Mem[0000000010041400] = ffd5b81b, %l5 = 0000000084f172db
	swapa	[%i1+%g0]0x80,%l5	! %l5 = 00000000ffd5b81b
!	%l2 = e0250a6d, %l3 = 000094bc, Mem[0000000030081400] = ee384b0d 18067c66
	stda	%l2,[%i2+%g0]0x81	! Mem[0000000030081400] = e0250a6d 000094bc
!	%l3 = 00000000000094bc, Mem[0000000030141400] = e436b160
	stwa	%l3,[%i5+%g0]0x89	! Mem[0000000030141400] = 000094bc
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = 251ee5a1, %l6 = ffffffffffffff60
	ldsb	[%o2+0x001],%l6		! %l6 = 000000000000001e

p0_label_53:
!	%l3 = 00000000000094bc, %l5 = 00000000ffd5b81b, %l0 = 0000000000000057
	udivx	%l3,%l5,%l0		! %l0 = 0000000000000000
!	Mem[0000000010101400] = e436b160 af3ce436, %l6 = 0000001e, %l7 = 0000004c
	ldda	[%i4+%g0]0x88,%l6	! %l6 = 00000000af3ce436 00000000e436b160
!	Mem[0000000030181408] = 32000034, %f14 = 84f172db
	lda	[%i6+%o4]0x81,%f14	! %f14 = 32000034
!	Mem[00000000300c1400] = ffffaa70, %l0 = 0000000000000000
	ldswa	[%i3+%g0]0x89,%l0	! %l0 = ffffffffffffaa70
!	Mem[0000000010081428] = 94121178, %l0 = ffffffffffffaa70
	lduh	[%i2+0x02a],%l0		! %l0 = 0000000000001178
!	Mem[0000000010081408] = ffffff60, %f0  = 32538103
	lda	[%i2+%o4]0x88,%f0 	! %f0 = ffffff60
!	Mem[000000001014141c] = 349b34e1, %l6 = 00000000af3ce436
	ldsh	[%i5+0x01e],%l6		! %l6 = 00000000000034e1
!	Mem[00000000100c143c] = b5b14bdf, %f8  = 0000009b
	lda	[%i3+0x03c]%asi,%f8 	! %f8 = b5b14bdf
!	Mem[0000000030181408] = 32000034 5721c5ff, %l6 = 000034e1, %l7 = e436b160
	ldda	[%i6+%o4]0x81,%l6	! %l6 = 0000000032000034 000000005721c5ff
!	Starting 10 instruction Store Burst
!	%l7 = 000000005721c5ff, Mem[0000000030141400] = 000094bc
	stwa	%l7,[%i5+%g0]0x89	! Mem[0000000030141400] = 5721c5ff

p0_label_54:
!	Mem[0000000010101400] = 36e43caf, %l3 = 00000000000094bc
	swapa	[%i4+%g0]0x80,%l3	! %l3 = 0000000036e43caf
!	%l2 = 00000000e0250a6d, Mem[0000000030181408] = ffc5215734000032
	stxa	%l2,[%i6+%o4]0x89	! Mem[0000000030181408] = 00000000e0250a6d
!	Mem[0000000030001400] = ff000000, %l4 = 9983f9e7f2b4c700
	ldstuba	[%i0+%g0]0x81,%l4	! %l4 = 000000ff000000ff
!	%l3 = 0000000036e43caf, Mem[00000000100c1400] = ff00007c
	stba	%l3,[%i3+%g0]0x88	! Mem[00000000100c1400] = ff0000af
!	%l6 = 0000000032000034, Mem[0000000030181400] = db7200ff
	stba	%l6,[%i6+%g0]0x81	! Mem[0000000030181400] = 347200ff
	membar	#Sync			! Added by membar checker (7)
!	%l6 = 0000000032000034, Mem[00000000300c1400] = ffffaa70
	stha	%l6,[%i3+%g0]0x89	! Mem[00000000300c1400] = ffff0034
!	Mem[00000000201c0000] = ffff01ce, %l4 = 00000000000000ff
	ldstuba	[%o0+0x000]%asi,%l4	! %l4 = 000000ff000000ff
!	Mem[0000000010041400] = 84f172db, %l2 = 00000000e0250a6d
	ldstuba	[%i1+%g0]0x80,%l2	! %l2 = 00000084000000ff
!	Mem[0000000010101400] = 000094bc, %l5 = 00000000ffd5b81b
	swapa	[%i4+%g0]0x80,%l5	! %l5 = 00000000000094bc
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = 4c632157, %l7 = 000000005721c5ff
	ldswa	[%i4+%g0]0x89,%l7	! %l7 = 000000004c632157

p0_label_55:
!	Mem[0000000010141400] = e3de7c92e98c78d8, %l2 = 0000000000000084
	ldxa	[%i5+%g0]0x80,%l2	! %l2 = e3de7c92e98c78d8
!	Mem[0000000010141400] = e3de7c92, %l5 = 00000000000094bc
	ldswa	[%i5+%g0]0x80,%l5	! %l5 = ffffffffe3de7c92
!	Mem[0000000010101410] = ff92aff8, %l3 = 0000000036e43caf
	lduha	[%i4+%o5]0x80,%l3	! %l3 = 000000000000ff92
!	Mem[00000000100c1400] = ff0000af, %f15 = 0027d52a
	lda	[%i3+%g0]0x88,%f15	! %f15 = ff0000af
!	Mem[0000000010041400] = fff172db, %l3 = 000000000000ff92
	ldsba	[%i1+%g0]0x80,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000030141410] = 57210000, %l3 = ffffffffffffffff
	lduba	[%i5+%o5]0x81,%l3	! %l3 = 0000000000000057
!	Mem[0000000010101408] = af3ce436, %l1 = 667c06180d4b38ee
	lduha	[%i4+%o4]0x88,%l1	! %l1 = 000000000000e436
!	Mem[0000000030141410] = 00002157, %l6 = 0000000032000034
	lduba	[%i5+%o5]0x89,%l6	! %l6 = 0000000000000057
!	Mem[00000000100c1400] = af0000ff, %l0 = 0000000000001178
	lduha	[%i3+%g0]0x80,%l0	! %l0 = 000000000000af00
!	Starting 10 instruction Store Burst
!	Mem[0000000030101408] = ff6334a3, %l1 = 000000000000e436
	swapa	[%i4+%o4]0x81,%l1	! %l1 = 00000000ff6334a3

p0_label_56:
!	Mem[0000000020800041] = ff9bf99a, %l3 = 0000000000000057
	ldstuba	[%o1+0x041]%asi,%l3	! %l3 = 0000009b000000ff
!	%l4 = 00000000000000ff, Mem[0000000030081410] = cab3b2ff
	stha	%l4,[%i2+%o5]0x89	! Mem[0000000030081410] = cab300ff
!	%l2 = e3de7c92e98c78d8, Mem[0000000010141408] = ffa372db
	stba	%l2,[%i5+%o4]0x80	! Mem[0000000010141408] = d8a372db
!	Mem[0000000010141400] = e3de7c92, %l6 = 0000000000000057
	swapa	[%i5+%g0]0x80,%l6	! %l6 = 00000000e3de7c92
!	Mem[0000000030101410] = fd000000, %l0 = 000000000000af00
	ldstuba	[%i4+%o5]0x89,%l0	! %l0 = 00000000000000ff
!	%f5  = 4c6334a3, Mem[0000000010141400] = 57000000
	sta	%f5 ,[%i5+%g0]0x88	! Mem[0000000010141400] = 4c6334a3
!	Mem[0000000030181400] = ff007234, %l7 = 000000004c632157
	ldstuba	[%i6+%g0]0x89,%l7	! %l7 = 00000034000000ff
!	%f14 = 32000034 ff0000af, Mem[00000000300c1400] = 3400ffff ffffffff
	stda	%f14,[%i3+%g0]0x81	! Mem[00000000300c1400] = 32000034 ff0000af
!	%l2 = e3de7c92e98c78d8, Mem[0000000010041400] = fff172db088d03d2, %asi = 80
	stxa	%l2,[%i1+0x000]%asi	! Mem[0000000010041400] = e3de7c92e98c78d8
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = 94bcd52adb72f184, %l2 = e3de7c92e98c78d8
	ldxa	[%i1+%o5]0x81,%l2	! %l2 = 94bcd52adb72f184

p0_label_57:
!	Mem[0000000030141410] = 00002157, %l1 = 00000000ff6334a3
	ldsba	[%i5+%o5]0x89,%l1	! %l1 = 0000000000000057
!	Mem[000000001004142c] = 0f0be2a9, %l4 = 00000000000000ff
	ldsba	[%i1+0x02e]%asi,%l4	! %l4 = ffffffffffffffe2
!	%l0 = 0000000000000000, %l1 = 0000000000000057, %l7 = 0000000000000034
	addc	%l0,%l1,%l7		! %l7 = 0000000000000057
!	%l7 = 0000000000000057, Mem[0000000010001430] = a334634c, %asi = 80
	stwa	%l7,[%i0+0x030]%asi	! Mem[0000000010001430] = 00000057
!	Mem[0000000010041400] = 927cdee3, %l3 = 000000000000009b
	ldswa	[%i1+%g0]0x88,%l3	! %l3 = ffffffff927cdee3
!	Mem[0000000010141408] = db72a3d8, %l3 = ffffffff927cdee3
	lduwa	[%i5+%o4]0x88,%l3	! %l3 = 00000000db72a3d8
!	Mem[0000000030001400] = ff000000 000000fd 57000000 0000d037
!	Mem[0000000030001410] = 0334634c bc946679 9c56136f 606cfca9
!	Mem[0000000030001420] = a52e7e04 02c076f0 99507837 e2a2ea29
!	Mem[0000000030001430] = d20359a6 41a1b160 4ca6fc6b 654a7d29
	ldda	[%i0]ASI_BLK_AIUSL,%f16	! Block Load from 0000000030001400
!	Mem[0000000010101408] = 36e43caf, %l4 = ffffffffffffffe2
	ldub	[%i4+%o4],%l4		! %l4 = 0000000000000036
!	Mem[0000000010101428] = 815e45ec000000ee, %f2  = 4aac2dfc 55e79ba6
	ldd	[%i4+0x028],%f2 	! %f2  = 815e45ec 000000ee
!	Starting 10 instruction Store Burst
!	Mem[0000000030041408] = b1cd62ff, %l5 = ffffffffe3de7c92
	swapa	[%i1+%o4]0x89,%l5	! %l5 = 00000000b1cd62ff

p0_label_58:
!	%l2 = 94bcd52adb72f184, Mem[0000000010041408] = d2038d08e437566a
	stxa	%l2,[%i1+%o4]0x80	! Mem[0000000010041408] = 94bcd52adb72f184
!	Mem[0000000020800040] = fffff99a, %l1 = 0000000000000057
	ldstuba	[%o1+0x040]%asi,%l1	! %l1 = 000000ff000000ff
!	%l6 = 00000000e3de7c92, %l2 = 94bcd52adb72f184, %l4 = 0000000000000036
	orn	%l6,%l2,%l4		! %l4 = 6b432ad5e7df7efb
!	%l0 = 0000000000000000, Mem[0000000030181410] = 4c6334a3
	stba	%l0,[%i6+%o5]0x89	! Mem[0000000030181410] = 4c633400
!	%f0  = ffffff60 4c633403, %l2 = 94bcd52adb72f184
!	Mem[0000000010001400] = 70000000301059ca
	stda	%f0,[%i0+%l2]ASI_PST8_P ! Mem[0000000010001400] = ff000000306359ca
!	Mem[000000001018140c] = 60b136e4, %l0 = 00000000, %l4 = e7df7efb
	add	%i6,0x0c,%g1
	casa	[%g1]0x80,%l0,%l4	! %l4 = 0000000060b136e4
!	Mem[00000000100c1420] = 59e1d49d, %l4 = 60b136e4, %l6 = e3de7c92
	add	%i3,0x20,%g1
	casa	[%g1]0x80,%l4,%l6	! %l6 = 0000000059e1d49d
!	%l4 = 0000000060b136e4, Mem[0000000030141400] = d2038d085721c5ff
	stxa	%l4,[%i5+%g0]0x89	! Mem[0000000030141400] = 0000000060b136e4
!	Mem[00000000218001c0] = 732cc752, %l0 = 0000000000000000
	ldstuba	[%o3+0x1c0]%asi,%l0	! %l0 = 00000073000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = bc9400006d0a25e0, %f10 = 4c6334a3 e9f291be
	ldda	[%i2+%g0]0x89,%f10	! %f10 = bc940000 6d0a25e0

p0_label_59:
!	Mem[0000000010041438] = 445c2c9f, %l3 = 00000000db72a3d8
	lduba	[%i1+0x039]%asi,%l3	! %l3 = 000000000000005c
!	Mem[0000000010101410] = ff92aff8, %l7 = 0000000000000057
	ldsba	[%i4+%o5]0x80,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000030001408] = 570000000000d037, %f0  = ffffff60 4c633403
	ldda	[%i0+%o4]0x81,%f0 	! %f0  = 57000000 0000d037
!	Mem[0000000030081400] = e0250a6d000094bc, %f14 = 32000034 ff0000af
	ldda	[%i2+%g0]0x81,%f14	! %f14 = e0250a6d 000094bc
!	Mem[0000000010101404] = 60b136e4, %l7 = ffffffffffffffff
	ldsw	[%i4+0x004],%l7		! %l7 = 0000000060b136e4
!	Mem[0000000010101400] = ffd5b81b60b136e4, %l6 = 0000000059e1d49d
	ldxa	[%i4+%g0]0x80,%l6	! %l6 = ffd5b81b60b136e4
!	Mem[0000000010101418] = 1560aefe a156caa9, %l4 = 60b136e4, %l5 = b1cd62ff
	ldda	[%i4+0x018]%asi,%l4	! %l4 = 000000001560aefe 00000000a156caa9
!	Mem[0000000030081410] = cab300ff, %f10 = bc940000
	lda	[%i2+%o5]0x89,%f10	! %f10 = cab300ff
!	Mem[00000000211c0000] = 251ee5a1, %l1 = 00000000000000ff
	ldsba	[%o2+0x000]%asi,%l1	! %l1 = 0000000000000025
!	Starting 10 instruction Store Burst
!	%l6 = ffd5b81b60b136e4, Mem[0000000010141408] = d8a372db
	stha	%l6,[%i5+%o4]0x80	! Mem[0000000010141408] = 36e472db

p0_label_60:
!	%f12 = 796694bc 4c6334a3, %l6 = ffd5b81b60b136e4
!	Mem[0000000010041428] = e0250a6d0f0be2a9
	add	%i1,0x028,%g1
	stda	%f12,[%g1+%l6]ASI_PST32_PL ! Mem[0000000010041428] = e0250a6d0f0be2a9
!	%l1 = 0000000000000025, Mem[0000000010001408] = c68c78d8
	stha	%l1,[%i0+%o4]0x88	! Mem[0000000010001408] = c68c0025
!	%l0 = 0000000000000073, Mem[0000000010181408] = 70aa6934, %asi = 80
	stha	%l0,[%i6+0x008]%asi	! Mem[0000000010181408] = 00736934
!	%l2 = 94bcd52adb72f184, Mem[0000000010081415] = 000094bc
	stb	%l2,[%i2+0x015]		! Mem[0000000010081414] = 008494bc
!	Mem[000000001004140c] = db72f184, %l7 = 0000000060b136e4, %asi = 80
	swapa	[%i1+0x00c]%asi,%l7	! %l7 = 00000000db72f184
!	%l2 = db72f184, %l3 = 0000005c, Mem[0000000030101408] = 36e40000 be91f2e9
	stda	%l2,[%i4+%o4]0x89	! Mem[0000000030101408] = db72f184 0000005c
!	%f11 = 6d0a25e0, Mem[0000000030081400] = 6d0a25e0
	sta	%f11,[%i2+%g0]0x89	! Mem[0000000030081400] = 6d0a25e0
!	%l2 = 94bcd52adb72f184, Mem[0000000010141400] = a334634c
	stwa	%l2,[%i5+%g0]0x80	! Mem[0000000010141400] = db72f184
!	%f16 = fd000000 000000ff 37d00000 00000057
!	%f20 = 796694bc 4c633403 a9fc6c60 6f13569c
!	%f24 = f076c002 047e2ea5 29eaa2e2 37785099
!	%f28 = 60b1a141 a65903d2 297d4a65 6bfca64c
	stda	%f16,[%i3]ASI_BLK_AIUPL	! Block Store to 00000000100c1400
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = e3de7c92e98c78d8, %f10 = cab300ff 6d0a25e0
	ldd	[%i1+%g0],%f10		! %f10 = e3de7c92 e98c78d8

p0_label_61:
!	Mem[0000000030041400] = d2038d08, %l1 = 0000000000000025
	ldswa	[%i1+%g0]0x89,%l1	! %l1 = ffffffffd2038d08
!	Mem[0000000030081410] = cab300ff, %l6 = ffd5b81b60b136e4
	ldsba	[%i2+%o5]0x89,%l6	! %l6 = ffffffffffffffff
!	%l4 = 000000001560aefe, %l3 = 000000000000005c, %l6 = ffffffffffffffff
	and	%l4,%l3,%l6		! %l6 = 000000000000005c
!	Mem[00000000211c0000] = 251ee5a1, %l3 = 000000000000005c
	ldsb	[%o2+0x001],%l3		! %l3 = 000000000000001e
!	Mem[0000000030101408] = db72f184, %l7 = 00000000db72f184
	ldsba	[%i4+%o4]0x89,%l7	! %l7 = ffffffffffffff84
!	Mem[0000000030181410] = 4c633400, %l6 = 000000000000005c
	ldsba	[%i6+%o5]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000030181410] = 0034634c, %l0 = 0000000000000073
	ldsba	[%i6+%o5]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000010141400] = d8788ce984f172db, %l0 = 0000000000000000
	ldxa	[%i5+%g0]0x88,%l0	! %l0 = d8788ce984f172db
!	%f10 = e3de7c92, %f14 = e0250a6d, %f8  = b5b14bdf
	fsubs	%f10,%f14,%f8 		! %f8  = e3dd327d
!	Starting 10 instruction Store Burst
!	Mem[0000000010181400] = ff2281c3, %l1 = d2038d08, %l6 = 00000000
	casa	[%i6]0x80,%l1,%l6	! %l6 = 00000000ff2281c3

p0_label_62:
!	Mem[0000000030101408] = db72f184, %l7 = ffffffffffffff84
	swapa	[%i4+%o4]0x89,%l7	! %l7 = 00000000db72f184
!	Mem[0000000010141434] = 9ad5b862, %l4 = 000000001560aefe
	swap	[%i5+0x034],%l4		! %l4 = 000000009ad5b862
!	Mem[0000000030181410] = 4c633400, %l7 = 00000000db72f184
	swapa	[%i6+%o5]0x89,%l7	! %l7 = 000000004c633400
!	%l6 = 00000000ff2281c3, Mem[0000000030101408] = ffffff84
	stha	%l6,[%i4+%o4]0x89	! Mem[0000000030101408] = ffff81c3
	membar	#Sync			! Added by membar checker (8)
!	Mem[00000000100c1400] = ff000000, %l0 = d8788ce984f172db
	swapa	[%i3+%g0]0x80,%l0	! %l0 = 00000000ff000000
!	Mem[0000000010141404] = e98c78d8, %l5 = a156caa9, %l5 = a156caa9
	add	%i5,0x04,%g1
	casa	[%g1]0x80,%l5,%l5	! %l5 = 00000000e98c78d8
!	%l4 = 9ad5b862, %l5 = e98c78d8, Mem[0000000030081400] = e0250a6d 000094bc
	stda	%l4,[%i2+%g0]0x81	! Mem[0000000030081400] = 9ad5b862 e98c78d8
!	%l3 = 000000000000001e, Mem[0000000020800040] = fffff99a
	sth	%l3,[%o1+0x040]		! Mem[0000000020800040] = 001ef99a
!	%f20 = 796694bc 4c633403, Mem[00000000300c1410] = 00000065 32c8e3bb
	stda	%f20,[%i3+%o5]0x89	! Mem[00000000300c1410] = 796694bc 4c633403
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = 36e472db2ad5b81b, %f8  = e3dd327d 088d03d2
	ldda	[%i5+%o4]0x80,%f8 	! %f8  = 36e472db 2ad5b81b

p0_label_63:
!	Mem[0000000010041410] = 088d03d2, %l6 = 00000000ff2281c3
	ldswa	[%i1+%o5]0x88,%l6	! %l6 = 00000000088d03d2
!	Mem[0000000030041408] = e3de7c92, %l4 = 000000009ad5b862
	ldswa	[%i1+%o4]0x89,%l4	! %l4 = ffffffffe3de7c92
!	Mem[0000000010101400] = e436b1601bb8d5ff, %f30 = 297d4a65 6bfca64c
	ldda	[%i4+%g0]0x88,%f30	! %f30 = e436b160 1bb8d5ff
!	Mem[0000000010141408] = 36e472db, %l4 = ffffffffe3de7c92
	ldswa	[%i5+%o4]0x80,%l4	! %l4 = 0000000036e472db
!	Mem[0000000030001410] = 4c633403, %l4 = 0000000036e472db
	ldswa	[%i0+%o5]0x89,%l4	! %l4 = 000000004c633403
!	Mem[0000000030101408] = 0000005c ffff81c3, %l0 = ff000000, %l1 = d2038d08
	ldda	[%i4+%o4]0x89,%l0	! %l0 = 00000000ffff81c3 000000000000005c
!	Mem[0000000010141410] = dbffffff, %l4 = 000000004c633403
	lduba	[%i5+%o5]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[00000000100c1408] = 00000057, %l6 = 00000000088d03d2
	ldsha	[%i3+%o4]0x88,%l6	! %l6 = 0000000000000057
!	Mem[00000000100c1408] = 57000000, %l1 = 000000000000005c
	lduba	[%i3+%o4]0x80,%l1	! %l1 = 0000000000000057
!	Starting 10 instruction Store Burst
!	%f29 = a65903d2, Mem[0000000030081408] = 84f172db
	sta	%f29,[%i2+%o4]0x89	! Mem[0000000030081408] = a65903d2

p0_label_64:
!	Mem[0000000010041418] = 3ca1c359, %l0 = ffff81c3, %l4 = 000000ff
	add	%i1,0x18,%g1
	casa	[%g1]0x80,%l0,%l4	! %l4 = 000000003ca1c359
!	%l0 = 00000000ffff81c3, Mem[0000000030041400] = d2038d08
	stba	%l0,[%i1+%g0]0x89	! Mem[0000000030041400] = d2038dc3
!	%l4 = 3ca1c359, %l5 = e98c78d8, Mem[0000000010101410] = f8af92ff 00000000
	stda	%l4,[%i4+%o5]0x88	! Mem[0000000010101410] = 3ca1c359 e98c78d8
!	Mem[0000000030001408] = 57000000, %l3 = 000000000000001e
	ldstuba	[%i0+%o4]0x81,%l3	! %l3 = 00000057000000ff
!	Mem[0000000010001418] = d20300e7, %l3 = 0000000000000057
	swap	[%i0+0x018],%l3		! %l3 = 00000000d20300e7
!	Mem[0000000010101420] = 54937de894a86dd3, %l0 = 00000000ffff81c3, %l0 = 00000000ffff81c3
	add	%i4,0x20,%g1
	casxa	[%g1]0x80,%l0,%l0	! %l0 = 54937de894a86dd3
!	Mem[0000000010081400] = 70aa6934, %l7 = 000000004c633400
	ldstuba	[%i2+%g0]0x80,%l7	! %l7 = 00000070000000ff
!	Mem[0000000010041410] = d2038d08, %l0 = 94a86dd3, %l6 = 00000057
	add	%i1,0x10,%g1
	casa	[%g1]0x80,%l0,%l6	! %l6 = 00000000d2038d08
!	%l1 = 0000000000000057, Mem[00000000100c1428] = 99507837, %asi = 80
	stba	%l1,[%i3+0x028]%asi	! Mem[00000000100c1428] = 57507837
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = 59c3a13cd8788ce9, %l1 = 0000000000000057
	ldxa	[%i4+%o5]0x80,%l1	! %l1 = 59c3a13cd8788ce9

p0_label_65:
!	Mem[0000000010141400] = 84f172db, %l2 = 94bcd52adb72f184
	ldsba	[%i5+%g0]0x88,%l2	! %l2 = ffffffffffffffdb
!	Mem[0000000010101414] = d8788ce9, %l6 = 00000000d2038d08
	ldsha	[%i4+0x016]%asi,%l6	! %l6 = ffffffffffff8ce9
!	Mem[0000000010001400] = ff000000, %l7 = 0000000000000070
	ldsha	[%i0+0x002]%asi,%l7	! %l7 = 0000000000000000
!	Mem[000000001010142c] = 000000ee, %l0 = 54937de894a86dd3
	ldsba	[%i4+0x02d]%asi,%l0	! %l0 = 0000000000000000
!	%f26 = 29eaa2e2, %f16 = fd000000 000000ff
	fstod	%f26,%f16		! %f16 = 3d3d545c 40000000
!	Mem[00000000100c1408] = 00000057, %l5 = 00000000e98c78d8
	ldswa	[%i3+%o4]0x88,%l5	! %l5 = 0000000000000057
!	Mem[0000000010181408] = 00736934, %l2 = ffffffffffffffdb
	lduwa	[%i6+0x008]%asi,%l2	! %l2 = 0000000000736934
!	Code Fragment 4
p0_fragment_3:
!	%l0 = 0000000000000000
	setx	0x91187a684907a5d5,%g7,%l0 ! %l0 = 91187a684907a5d5
!	%l1 = 59c3a13cd8788ce9
	setx	0x0d58b9e7a1ad5081,%g7,%l1 ! %l1 = 0d58b9e7a1ad5081
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 91187a684907a5d5
	setx	0xc8f6a79826b58f7b,%g7,%l0 ! %l0 = c8f6a79826b58f7b
!	%l1 = 0d58b9e7a1ad5081
	setx	0x1d3ff828284de1f7,%g7,%l1 ! %l1 = 1d3ff828284de1f7
!	Mem[0000000010101400] = e436b1601bb8d5ff, %l7 = 0000000000000000
	ldxa	[%i4+%g0]0x88,%l7	! %l7 = e436b1601bb8d5ff
!	Starting 10 instruction Store Burst
!	Mem[0000000010181400] = ff2281c3, %l5 = 0000000000000057
	swapa	[%i6+%g0]0x80,%l5	! %l5 = 00000000ff2281c3

p0_label_66:
!	Code Fragment 4
p0_fragment_4:
!	%l0 = c8f6a79826b58f7b
	setx	0xcc373147ea3d1539,%g7,%l0 ! %l0 = cc373147ea3d1539
!	%l1 = 1d3ff828284de1f7
	setx	0x4b06d390442ad826,%g7,%l1 ! %l1 = 4b06d390442ad826
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = cc373147ea3d1539
	setx	0xfe9bdeb7aa8228a0,%g7,%l0 ! %l0 = fe9bdeb7aa8228a0
!	%l1 = 4b06d390442ad826
	setx	0x602421c071185646,%g7,%l1 ! %l1 = 602421c071185646
!	%l7 = e436b1601bb8d5ff, Mem[0000000030181400] = 3a000000ff0072ff
	stxa	%l7,[%i6+%g0]0x89	! Mem[0000000030181400] = e436b1601bb8d5ff
!	%l2 = 0000000000736934, Mem[0000000030041400] = c38d03d2
	stha	%l2,[%i1+%g0]0x81	! Mem[0000000030041400] = 693403d2
!	%l1 = 602421c071185646, Mem[00000000100c1405] = 000000fd
	stb	%l1,[%i3+0x005]		! Mem[00000000100c1404] = 004600fd
!	%l5 = 00000000ff2281c3, Mem[000000001004142a] = e0250a6d, %asi = 80
	stha	%l5,[%i1+0x02a]%asi	! Mem[0000000010041428] = e02581c3
!	%f4  = e0250a6d 4c6334a3, Mem[00000000300c1400] = 32000034 ff0000af
	stda	%f4 ,[%i3+%g0]0x81	! Mem[00000000300c1400] = e0250a6d 4c6334a3
!	%f14 = e0250a6d 000094bc, Mem[0000000030181408] = 6d0a25e0 00000000
	stda	%f14,[%i6+%o4]0x81	! Mem[0000000030181408] = e0250a6d 000094bc
!	%f5  = 4c6334a3, Mem[0000000030181408] = e0250a6d
	sta	%f5 ,[%i6+%o4]0x81	! Mem[0000000030181408] = 4c6334a3
!	%l4 = 3ca1c359, %l5 = ff2281c3, Mem[0000000010001408] = c68c0025 4aac2dfc
	stda	%l4,[%i0+%o4]0x88	! Mem[0000000010001408] = 3ca1c359 ff2281c3
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = ffd5b81b, %l6 = ffffffffffff8ce9
	lduwa	[%i4+0x000]%asi,%l6	! %l6 = 00000000ffd5b81b

p0_label_67:
!	Mem[0000000010181400] = 00000057, %f30 = e436b160
	lda	[%i6+%g0]0x80,%f30	! %f30 = 00000057
!	Mem[0000000020800000] = ffffe062, %l4 = 000000003ca1c359
	lduba	[%o1+0x001]%asi,%l4	! %l4 = 00000000000000ff
!	Mem[00000000100c1408] = 570000000000d037, %l2 = 0000000000736934
	ldxa	[%i3+%o4]0x80,%l2	! %l2 = 570000000000d037
!	Mem[00000000300c1408] = e8476df6d01edd19, %l1 = 602421c071185646
	ldxa	[%i3+%o4]0x89,%l1	! %l1 = e8476df6d01edd19
!	Mem[0000000010001410] = ff34634cd2038d08, %l7 = e436b1601bb8d5ff
	ldx	[%i0+%o5],%l7		! %l7 = ff34634cd2038d08
!	Mem[00000000100c143c] = 654a7d29, %l7 = ff34634cd2038d08
	ldswa	[%i3+0x03c]%asi,%l7	! %l7 = 00000000654a7d29
!	Mem[0000000010101408] = 36e43cafe437566a, %f16 = 3d3d545c 40000000
	ldda	[%i4+%o4]0x80,%f16	! %f16 = 36e43caf e437566a
!	Mem[00000000300c1400] = e0250a6d4c6334a3, %l7 = 00000000654a7d29
	ldxa	[%i3+%g0]0x81,%l7	! %l7 = e0250a6d4c6334a3
!	%l7 = e0250a6d4c6334a3, %l0 = fe9bdeb7aa8228a0, %l0 = fe9bdeb7aa8228a0
	sdivx	%l7,%l0,%l0		! %l0 = 0000000000000016
!	Starting 10 instruction Store Burst
!	%l4 = 00000000000000ff, Mem[0000000030181400] = ffd5b81b
	stwa	%l4,[%i6+%g0]0x81	! Mem[0000000030181400] = 000000ff

p0_label_68:
!	Mem[0000000010041400] = e3de7c92, %l4 = 00000000000000ff
	ldstuba	[%i1+%g0]0x80,%l4	! %l4 = 000000e3000000ff
!	%l1 = e8476df6d01edd19, Mem[00000000100c1430] = d20359a641a1b160, %asi = 80
	stxa	%l1,[%i3+0x030]%asi	! Mem[00000000100c1430] = e8476df6d01edd19
!	Mem[00000000100c1410] = 0334634c, %l0 = 0000000000000016
	ldstuba	[%i3+%o5]0x80,%l0	! %l0 = 00000003000000ff
!	%l6 = 00000000ffd5b81b, Mem[0000000030001408] = ff000000
	stwa	%l6,[%i0+%o4]0x81	! Mem[0000000030001408] = ffd5b81b
!	Mem[0000000010181418] = 60b136e460b1fbe4, %l6 = 00000000ffd5b81b, %l3 = 00000000d20300e7
	add	%i6,0x18,%g1
	casxa	[%g1]0x80,%l6,%l3	! %l3 = 60b136e460b1fbe4
!	Mem[0000000020800001] = ffffe062, %l5 = 00000000ff2281c3
	ldstub	[%o1+0x001],%l5		! %l5 = 000000ff000000ff
!	%f24 = f076c002 047e2ea5, Mem[00000000100c1410] = ff34634c bc946679
	stda	%f24,[%i3+%o5]0x80	! Mem[00000000100c1410] = f076c002 047e2ea5
!	%l2 = 570000000000d037, Mem[0000000010001408] = 3ca1c359
	stba	%l2,[%i0+%o4]0x88	! Mem[0000000010001408] = 3ca1c337
!	Mem[0000000010001410] = 4c6334ff, %l3 = 60b136e460b1fbe4
	swapa	[%i0+%o5]0x88,%l3	! %l3 = 000000004c6334ff
!	Starting 10 instruction Load Burst
!	Code Fragment 3
p0_fragment_5:
!	%l0 = 0000000000000003
	setx	0x69432447ea6f7def,%g7,%l0 ! %l0 = 69432447ea6f7def
!	%l1 = e8476df6d01edd19
	setx	0xfad7738ffd16ef66,%g7,%l1 ! %l1 = fad7738ffd16ef66
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 69432447ea6f7def
	setx	0xfd458f97c211cc00,%g7,%l0 ! %l0 = fd458f97c211cc00
!	%l1 = fad7738ffd16ef66
	setx	0x6139339826b66a50,%g7,%l1 ! %l1 = 6139339826b66a50

p0_label_69:
!	%f7  = 60b136e4, %f27 = 37785099, %f18 = 37d00000 00000057
	fsmuld	%f7 ,%f27,%f18		! %f18 = 43157c9e fe21c880
!	Mem[0000000030081408] = a65903d2, %l7 = e0250a6d4c6334a3
	lduwa	[%i2+%o4]0x89,%l7	! %l7 = 00000000a65903d2
!	Mem[0000000020800040] = 001ef99a, %l5 = 00000000000000ff
	ldub	[%o1+0x041],%l5		! %l5 = 000000000000001e
!	Mem[0000000030001400] = fd000000 000000ff, %l0 = c211cc00, %l1 = 26b66a50
	ldda	[%i0+%g0]0x89,%l0	! %l0 = 00000000000000ff 00000000fd000000
!	%f18 = 43157c9e, %f6  = 70aa6934
	fcmpes	%fcc1,%f18,%f6 		! %fcc1 = 1
!	%l3 = 000000004c6334ff, imm = fffffffffffff8a8, %l2 = 570000000000d037
	xnor	%l3,-0x758,%l2		! %l2 = 000000004c6333a8
!	Mem[0000000030041400] = 693403d2, %l1 = 00000000fd000000
	ldsba	[%i1+%g0]0x81,%l1	! %l1 = 0000000000000069
!	%l3 = 000000004c6334ff, %l2 = 000000004c6333a8, %y  = fffffed6
	sdiv	%l3,%l2,%l1		! %l1 = fffffffffffffc1b
	mov	%l0,%y			! %y = 000000ff
!	Mem[0000000030081410] = ff00b3ca, %l6 = 00000000ffd5b81b
	ldsha	[%i2+%o5]0x81,%l6	! %l6 = ffffffffffffff00
!	Starting 10 instruction Store Burst
!	Mem[00000000211c0001] = 251ee5a1, %l6 = ffffffffffffff00
	ldstub	[%o2+0x001],%l6		! %l6 = 0000001e000000ff

p0_label_70:
!	%l5 = 000000000000001e, Mem[0000000010081410] = 0000db72
	stba	%l5,[%i2+%o5]0x88	! Mem[0000000010081410] = 0000db1e
!	%f0  = 57000000 0000d037 815e45ec 000000ee
!	%f4  = e0250a6d 4c6334a3 70aa6934 60b136e4
!	%f8  = 36e472db 2ad5b81b e3de7c92 e98c78d8
!	%f12 = 796694bc 4c6334a3 e0250a6d 000094bc
	stda	%f0,[%i2]ASI_BLK_P	! Block Store to 0000000010081400
!	%f30 = 00000057 1bb8d5ff, %l0 = 00000000000000ff
!	Mem[0000000030081430] = 7b398aab0fbfdfcf
	add	%i2,0x030,%g1
	stda	%f30,[%g1+%l0]ASI_PST8_S ! Mem[0000000030081430] = 000000571bb8d5ff
!	%l0 = 00000000000000ff, Mem[0000000010101422] = 54937de8, %asi = 80
	stha	%l0,[%i4+0x022]%asi	! Mem[0000000010101420] = 549300ff
!	%l5 = 000000000000001e, Mem[0000000030001408] = 1bb8d5ff
	stba	%l5,[%i0+%o4]0x89	! Mem[0000000030001408] = 1bb8d51e
!	%l0 = 00000000000000ff, Mem[00000000201c0001] = ffff01ce
	stb	%l0,[%o0+0x001]		! Mem[00000000201c0000] = ffff01ce
!	%l1 = fffffffffffffc1b, Mem[0000000010101400] = ffd5b81b
	stb	%l1,[%i4+%g0]		! Mem[0000000010101400] = 1bd5b81b
!	Mem[00000000100c1400] = 84f172db, %l4 = 00000000000000e3
	swapa	[%i3+%g0]0x80,%l4	! %l4 = 0000000084f172db
!	Mem[000000001000143c] = 1e25229f, %l7 = a65903d2, %l7 = a65903d2
	add	%i0,0x3c,%g1
	casa	[%g1]0x80,%l7,%l7	! %l7 = 000000001e25229f
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (9)
!	Mem[0000000010081408] = 815e45ec, %l1 = fffffffffffffc1b
	ldsba	[%i2+%o4]0x80,%l1	! %l1 = ffffffffffffff81

p0_label_71:
!	Mem[00000000300c1400] = e0250a6d, %l3 = 000000004c6334ff
	lduba	[%i3+%g0]0x81,%l3	! %l3 = 00000000000000e0
!	Mem[0000000010041410] = 527cce13088d03d2, %f4  = e0250a6d 4c6334a3
	ldda	[%i1+%o5]0x88,%f4 	! %f4  = 527cce13 088d03d2
!	Mem[000000001000142c] = e436b160, %l6 = 000000000000001e
	ldsha	[%i0+0x02c]%asi,%l6	! %l6 = ffffffffffffe436
!	Mem[0000000030001400] = ff000000, %l7 = 000000001e25229f
	ldsba	[%i0+%g0]0x81,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010081408] = ee000000 ec455e81, %l0 = 000000ff, %l1 = ffffff81
	ldda	[%i2+%o4]0x88,%l0	! %l0 = 00000000ec455e81 00000000ee000000
!	Mem[0000000010001438] = 10302700, %l6 = ffffffffffffe436
	lduwa	[%i0+0x038]%asi,%l6	! %l6 = 0000000010302700
!	Mem[0000000010181408] = 00736934, %f24 = f076c002
	lda	[%i6+%o4]0x80,%f24	! %f24 = 00736934
!	Mem[0000000010141408] = 1bb8d52a db72e436, %l0 = ec455e81, %l1 = ee000000
	ldda	[%i5+%o4]0x88,%l0	! %l0 = 00000000db72e436 000000001bb8d52a
!	Mem[0000000020800000] = ffffe062, %l5 = 000000000000001e
	lduh	[%o1+%g0],%l5		! %l5 = 000000000000ffff
!	Starting 10 instruction Store Burst
!	Mem[00000000211c0001] = 25ffe5a1, %l0 = 00000000db72e436
	ldstuba	[%o2+0x001]%asi,%l0	! %l0 = 000000ff000000ff

p0_label_72:
!	Mem[0000000010181400] = 57000000, %l4 = 0000000084f172db
	swapa	[%i6+%g0]0x88,%l4	! %l4 = 0000000057000000
!	%l2 = 000000004c6333a8, Mem[00000000211c0001] = 25ffe5a1, %asi = 80
	stba	%l2,[%o2+0x001]%asi	! Mem[00000000211c0000] = 25a8e5a1
!	%f13 = 4c6334a3, Mem[0000000010001400] = ff000000
	st	%f13,[%i0+%g0]		! Mem[0000000010001400] = 4c6334a3
!	Mem[0000000020800040] = 001ef99a, %l0 = 00000000000000ff
	ldstuba	[%o1+0x040]%asi,%l0	! %l0 = 00000000000000ff
!	Mem[000000001008142c] = e98c78d8, %l3 = 000000e0, %l5 = 0000ffff
	add	%i2,0x2c,%g1
	casa	[%g1]0x80,%l3,%l5	! %l5 = 00000000e98c78d8
!	Mem[0000000010101428] = 815e45ec, %l6 = 0000000010302700
	swap	[%i4+0x028],%l6		! %l6 = 00000000815e45ec
!	%l1 = 000000001bb8d52a, Mem[0000000020800040] = ff1ef99a, %asi = 80
	stba	%l1,[%o1+0x040]%asi	! Mem[0000000020800040] = 2a1ef99a
!	Mem[0000000010041404] = e98c78d8, %l0 = 0000000000000000, %asi = 80
	swapa	[%i1+0x004]%asi,%l0	! %l0 = 00000000e98c78d8
!	%f4  = 527cce13 088d03d2, Mem[0000000030101408] = ffff81c3 0000005c
	stda	%f4 ,[%i4+%o4]0x89	! Mem[0000000030101408] = 527cce13 088d03d2
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1418] = 9c56136f606cfca9, %l5 = 00000000e98c78d8
	ldx	[%i3+0x018],%l5		! %l5 = 9c56136f606cfca9

p0_label_73:
!	Mem[0000000030141400] = 00000000 60b136e4, %l4 = 57000000, %l5 = 606cfca9
	ldda	[%i5+%g0]0x89,%l4	! %l4 = 0000000060b136e4 0000000000000000
!	Mem[0000000030041410] = 84f172db2ad5bc94, %l0 = 00000000e98c78d8
	ldxa	[%i1+%o5]0x89,%l0	! %l0 = 84f172db2ad5bc94
!	Mem[0000000010101418] = 1560aefe, %l7 = ffffffffffffffff
	lduha	[%i4+0x01a]%asi,%l7	! %l7 = 000000000000aefe
!	Mem[0000000030041408] = 927cdee3, %l6 = 00000000815e45ec
	ldsha	[%i1+%o4]0x81,%l6	! %l6 = ffffffffffff927c
!	Mem[0000000030141410] = 00002157, %f12 = 796694bc
	lda	[%i5+%o5]0x89,%f12	! %f12 = 00002157
!	Mem[00000000100c1400] = 000000e3, %l1 = 000000001bb8d52a
	ldsw	[%i3+%g0],%l1		! %l1 = 00000000000000e3
!	%f20 = 796694bc, %f6  = 70aa6934
	fcmpes	%fcc3,%f20,%f6 		! %fcc3 = 2
!	%l1 = 00000000000000e3, %l5 = 0000000000000000, %l2 = 000000004c6333a8
	subc	%l1,%l5,%l2		! %l2 = 00000000000000e3
!	Mem[0000000010081408] = ec455e81, %l2 = 00000000000000e3
	lduba	[%i2+%o4]0x88,%l2	! %l2 = 0000000000000081
!	Starting 10 instruction Store Burst
!	%l7 = 000000000000aefe, Mem[0000000030141408] = d2038d08ffffffbc
	stxa	%l7,[%i5+%o4]0x89	! Mem[0000000030141408] = 000000000000aefe

p0_label_74:
!	Mem[0000000030101400] = 4c632157, %l6 = ffffffffffff927c
	swapa	[%i4+%g0]0x89,%l6	! %l6 = 000000004c632157
!	%f19 = fe21c880, Mem[00000000100c1410] = f076c002
	sta	%f19,[%i3+%o5]0x80	! Mem[00000000100c1410] = fe21c880
!	%l7 = 000000000000aefe, Mem[0000000030141408] = 0000aefe
	stwa	%l7,[%i5+%o4]0x89	! Mem[0000000030141408] = 0000aefe
!	%f16 = 36e43caf e437566a 43157c9e fe21c880
!	%f20 = 796694bc 4c633403 a9fc6c60 6f13569c
!	%f24 = 00736934 047e2ea5 29eaa2e2 37785099
!	%f28 = 60b1a141 a65903d2 00000057 1bb8d5ff
	stda	%f16,[%i2]ASI_BLK_PL	! Block Store to 0000000010081400
!	%f6  = 70aa6934 60b136e4, Mem[0000000010081400] = e437566a 36e43caf
	stda	%f6 ,[%i2+%g0]0x88	! Mem[0000000010081400] = 70aa6934 60b136e4
!	Mem[0000000010001410] = 60b1fbe4, %l1 = 00000000000000e3
	swapa	[%i0+%o5]0x88,%l1	! %l1 = 0000000060b1fbe4
!	%f1  = 0000d037, Mem[0000000030001410] = 0334634c
	sta	%f1 ,[%i0+%o5]0x81	! Mem[0000000030001410] = 0000d037
!	Mem[0000000030001400] = ff000000, %l5 = 0000000000000000
	swapa	[%i0+%g0]0x81,%l5	! %l5 = 00000000ff000000
!	%f14 = e0250a6d 000094bc, Mem[0000000030001410] = 0000d037 bc946679
	stda	%f14,[%i0+%o5]0x81	! Mem[0000000030001410] = e0250a6d 000094bc
!	Starting 10 instruction Load Burst
!	Mem[0000000010181438] = 128b7cee, %l5 = 00000000ff000000
	lduha	[%i6+0x038]%asi,%l5	! %l5 = 000000000000128b

p0_label_75:
!	Mem[0000000020800000] = ffffe062, %l1 = 0000000060b1fbe4
	ldsba	[%o1+0x001]%asi,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010181410] = e70000ff, %l1 = ffffffffffffffff
	ldsba	[%i6+%o5]0x88,%l1	! %l1 = ffffffffffffffff
	membar	#Sync			! Added by membar checker (10)
!	Mem[0000000010081438] = ffd5b81b, %l4 = 0000000060b136e4
	lduh	[%i2+0x038],%l4		! %l4 = 000000000000ffd5
!	Mem[0000000010181420] = a334634c726f2f17, %f4  = 527cce13 088d03d2
	ldda	[%i6+0x020]%asi,%f4 	! %f4  = a334634c 726f2f17
!	Mem[00000000300c1400] = e0250a6d, %l3 = 00000000000000e0
	lduha	[%i3+%g0]0x81,%l3	! %l3 = 000000000000e025
!	Mem[0000000010181420] = a334634c, %l7 = 000000000000aefe
	ldsha	[%i6+0x022]%asi,%l7	! %l7 = 000000000000634c
!	Mem[0000000010001400] = 4c6334a3, %l5 = 000000000000128b
	lduwa	[%i0+%g0]0x80,%l5	! %l5 = 000000004c6334a3
!	Mem[0000000010141400] = 84f172db, %l2 = 0000000000000081
	lduba	[%i5+%g0]0x88,%l2	! %l2 = 00000000000000db
!	Mem[00000000300c1400] = 6d0a25e0, %l1 = ffffffffffffffff
	lduwa	[%i3+%g0]0x89,%l1	! %l1 = 000000006d0a25e0
!	Starting 10 instruction Store Burst
!	Mem[0000000030081410] = cab300ff, %l5 = 000000004c6334a3
	swapa	[%i2+%o5]0x89,%l5	! %l5 = 00000000cab300ff

p0_label_76:
!	Mem[0000000030141410] = 00002157, %l0 = 84f172db2ad5bc94
	swapa	[%i5+%o5]0x89,%l0	! %l0 = 0000000000002157
!	%f20 = 796694bc 4c633403, Mem[0000000010141418] = a69be755 349b34e1
	std	%f20,[%i5+0x018]	! Mem[0000000010141418] = 796694bc 4c633403
!	Mem[0000000010081430] = d20359a6, %l7 = 000000000000634c
	swap	[%i2+0x030],%l7		! %l7 = 00000000d20359a6
!	%f27 = 37785099, Mem[0000000030001400] = 00000000
	sta	%f27,[%i0+%g0]0x81	! Mem[0000000030001400] = 37785099
!	%l0 = 0000000000002157, Mem[0000000030141400] = e436b16000000000
	stxa	%l0,[%i5+%g0]0x81	! Mem[0000000030141400] = 0000000000002157
!	%f24 = 00736934 047e2ea5, Mem[0000000010181438] = 128b7cee 7928f15e
	stda	%f24,[%i6+0x038]%asi	! Mem[0000000010181438] = 00736934 047e2ea5
!	%f22 = a9fc6c60 6f13569c, %l6 = 000000004c632157
!	Mem[0000000010141400] = db72f184e98c78d8
	stda	%f22,[%i5+%l6]ASI_PST16_P ! Mem[0000000010141400] = db726c606f13569c
!	%l7 = 00000000d20359a6, Mem[0000000030041408] = 927cdee3d3a0fe6b
	stxa	%l7,[%i1+%o4]0x81	! Mem[0000000030041408] = 00000000d20359a6
!	Code Fragment 3
p0_fragment_6:
!	%l0 = 0000000000002157
	setx	0xe09a4f2837d69480,%g7,%l0 ! %l0 = e09a4f2837d69480
!	%l1 = 000000006d0a25e0
	setx	0xd88579878783e35c,%g7,%l1 ! %l1 = d88579878783e35c
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = e09a4f2837d69480
	setx	0x7a85917832c2c960,%g7,%l0 ! %l0 = 7a85917832c2c960
!	%l1 = d88579878783e35c
	setx	0xb951dc8002769b31,%g7,%l1 ! %l1 = b951dc8002769b31
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = 80c821fe, %l5 = 00000000cab300ff
	ldsha	[%i2+%o4]0x80,%l5	! %l5 = ffffffffffff80c8

p0_label_77:
!	Mem[0000000010041400] = 00000000 927cdeff, %l2 = 000000db, %l3 = 0000e025
	ldda	[%i1+%g0]0x88,%l2	! %l2 = 00000000927cdeff 0000000000000000
!	Mem[0000000021800180] = a1b7423e, %l5 = ffffffffffff80c8
	ldsba	[%o3+0x180]%asi,%l5	! %l5 = ffffffffffffffa1
!	Mem[0000000010001408] = 37c3a13c, %l6 = 000000004c632157
	ldswa	[%i0+%o4]0x80,%l6	! %l6 = 0000000037c3a13c
!	Mem[00000000211c0000] = 25a8e5a1, %l7 = 00000000d20359a6
	ldsha	[%o2+0x000]%asi,%l7	! %l7 = 00000000000025a8
!	Mem[0000000010141408] = 36e472db2ad5b81b, %l5 = ffffffffffffffa1
	ldxa	[%i5+%o4]0x80,%l5	! %l5 = 36e472db2ad5b81b
!	Mem[0000000010081408] = fe21c880, %l0 = 7a85917832c2c960
	ldsha	[%i2+%o4]0x88,%l0	! %l0 = ffffffffffffc880
!	Mem[0000000021800080] = 18f59b02, %l1 = b951dc8002769b31
	lduha	[%o3+0x080]%asi,%l1	! %l1 = 00000000000018f5
!	Mem[0000000010001410] = 000000e3, %l0 = ffffffffffffc880
	lduha	[%i0+%o5]0x88,%l0	! %l0 = 00000000000000e3
!	Mem[00000000211c0000] = 25a8e5a1, %l6 = 0000000037c3a13c
	ldub	[%o2+0x001],%l6		! %l6 = 00000000000000a8
!	Starting 10 instruction Store Burst
!	%l1 = 00000000000018f5, Mem[0000000030001410] = 6d0a25e0
	stba	%l1,[%i0+%o5]0x89	! Mem[0000000030001410] = 6d0a25f5

p0_label_78:
!	%f7  = 60b136e4, Mem[00000000100c1400] = 000000e3
	st	%f7 ,[%i3+%g0]		! Mem[00000000100c1400] = 60b136e4
!	Mem[0000000010081408] = 80c821fe, %l6 = 00000000000000a8
	ldstuba	[%i2+%o4]0x80,%l6	! %l6 = 00000080000000ff
!	%f30 = 00000057 1bb8d5ff, Mem[00000000100c1400] = 60b136e4 004600fd
	stda	%f30,[%i3+%g0]0x80	! Mem[00000000100c1400] = 00000057 1bb8d5ff
!	Mem[0000000030141408] = feae0000, %l2 = 00000000927cdeff
	ldstuba	[%i5+%o4]0x81,%l2	! %l2 = 000000fe000000ff
!	%l0 = 00000000000000e3, Mem[0000000030001410] = bc9400006d0a25f5
	stxa	%l0,[%i0+%o5]0x89	! Mem[0000000030001410] = 00000000000000e3
!	%l1 = 00000000000018f5, Mem[00000000100c1410] = 80c821fe
	stwa	%l1,[%i3+%o5]0x88	! Mem[00000000100c1410] = 000018f5
!	%l7 = 00000000000025a8, imm = fffffffffffff00e, %l1 = 00000000000018f5
	subc	%l7,-0xff2,%l1		! %l1 = 000000000000359a
!	%f0  = 57000000 0000d037, %l4 = 000000000000ffd5
!	Mem[0000000030041400] = 693403d24c6334a3
	stda	%f0,[%i1+%l4]ASI_PST16_S ! Mem[0000000030041400] = 693400004c63d037
!	%l4 = 0000ffd5, %l5 = 2ad5b81b, Mem[0000000030181410] = db72f184 7093cc4a
	stda	%l4,[%i6+%o5]0x89	! Mem[0000000030181410] = 0000ffd5 2ad5b81b
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = 00003469, %l7 = 00000000000025a8
	lduba	[%i1+%g0]0x89,%l7	! %l7 = 0000000000000069

p0_label_79:
!	Code Fragment 3
p0_fragment_7:
!	%l0 = 00000000000000e3
	setx	0xe01154d7a8e160bf,%g7,%l0 ! %l0 = e01154d7a8e160bf
!	%l1 = 000000000000359a
	setx	0x77d99bd803807532,%g7,%l1 ! %l1 = 77d99bd803807532
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = e01154d7a8e160bf
	setx	0x25b4fbb830d86fba,%g7,%l0 ! %l0 = 25b4fbb830d86fba
!	%l1 = 77d99bd803807532
	setx	0xbacb3f38267f1a0b,%g7,%l1 ! %l1 = bacb3f38267f1a0b
!	Mem[0000000010141428] = a6667f18, %l4 = 000000000000ffd5
	lduwa	[%i5+0x028]%asi,%l4	! %l4 = 00000000a6667f18
!	Mem[0000000010181434] = 47ee08bd, %f1  = 0000d037
	lda	[%i6+0x034]%asi,%f1 	! %f1 = 47ee08bd
!	Mem[0000000030001400] = 37785099, %l2 = 00000000000000fe
	lduha	[%i0+%g0]0x81,%l2	! %l2 = 0000000000003778
!	Mem[00000000300c1408] = d01edd19, %f16 = 36e43caf
	lda	[%i3+%o4]0x89,%f16	! %f16 = d01edd19
!	Mem[0000000030001408] = 1ed5b81b, %f31 = 1bb8d5ff
	lda	[%i0+%o4]0x81,%f31	! %f31 = 1ed5b81b
!	Mem[00000000300c1410] = 0334634cbc946679, %f0  = 57000000 47ee08bd
	ldda	[%i3+%o5]0x81,%f0 	! %f0  = 0334634c bc946679
!	Mem[0000000030081408] = a65903d2, %l4 = 00000000a6667f18
	lduha	[%i2+%o4]0x89,%l4	! %l4 = 00000000000003d2
!	Mem[0000000030001410] = e3000000, %l3 = 0000000000000000
	ldsba	[%i0+%o5]0x81,%l3	! %l3 = ffffffffffffffe3
!	Starting 10 instruction Store Burst
!	%l6 = 00000080, %l7 = 00000069, Mem[0000000030141408] = ffae0000 00000000
	stda	%l6,[%i5+%o4]0x81	! Mem[0000000030141408] = 00000080 00000069

p0_label_80:
!	Mem[0000000010041400] = 927cdeff, %l1 = bacb3f38267f1a0b
	swapa	[%i1+%g0]0x88,%l1	! %l1 = 00000000927cdeff
!	Mem[0000000010101410] = 3ca1c359, %l0 = 25b4fbb830d86fba
	swapa	[%i4+%o5]0x88,%l0	! %l0 = 000000003ca1c359
!	%l7 = 0000000000000069, Mem[0000000010001400] = 4c6334a3
	stba	%l7,[%i0+%g0]0x80	! Mem[0000000010001400] = 696334a3
!	Mem[0000000030141410] = 94bcd52a, %l3 = ffffffffffffffe3
	ldstuba	[%i5+%o5]0x81,%l3	! %l3 = 00000094000000ff
!	Mem[0000000030141408] = 00000080, %l2 = 0000000000003778
	ldstuba	[%i5+%o4]0x81,%l2	! %l2 = 00000000000000ff
!	%l4 = 00000000000003d2, Mem[0000000010181438] = 00736934
	stw	%l4,[%i6+0x038]		! Mem[0000000010181438] = 000003d2
!	%l0 = 000000003ca1c359, Mem[0000000010141438] = 445c2c9f, %asi = 80
	stha	%l0,[%i5+0x038]%asi	! Mem[0000000010141438] = c3592c9f
!	Mem[0000000030181400] = ff000000, %l6 = 0000000000000080
	ldstuba	[%i6+%g0]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010141408] = 36e472db, %l4 = 00000000000003d2
	swapa	[%i5+%o4]0x80,%l4	! %l4 = 0000000036e472db
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = 25a8e5a1, %l0 = 000000003ca1c359
	ldsb	[%o2+0x001],%l0		! %l0 = ffffffffffffffa8

p0_label_81:
!	Mem[0000000010181400] = 84f172db, %f2  = 815e45ec
	lda	[%i6+%g0]0x88,%f2 	! %f2 = 84f172db
!	Mem[0000000010001400] = a3346369, %l7 = 0000000000000069
	lduba	[%i0+%g0]0x88,%l7	! %l7 = 0000000000000069
!	Mem[0000000010101438] = e22787a2, %l3 = 0000000000000094
	lduh	[%i4+0x03a],%l3		! %l3 = 00000000000087a2
!	%l0 = ffffffffffffffa8, %l1 = 00000000927cdeff, %l4 = 0000000036e472db
	udivx	%l0,%l1,%l4		! %l4 = 00000001bf61cd03
!	Mem[0000000010041408] = 94bcd52a60b136e4, %f28 = 60b1a141 a65903d2
	ldda	[%i1+0x008]%asi,%f28	! %f28 = 94bcd52a 60b136e4
!	Mem[0000000010181400] = 84f172db, %l6 = 0000000000000000
	lduha	[%i6+%g0]0x88,%l6	! %l6 = 00000000000072db
!	Mem[0000000010041400] = 0b1a7f26, %l0 = ffffffffffffffa8
	ldsha	[%i1+%g0]0x80,%l0	! %l0 = 0000000000000b1a
!	Mem[0000000030101400] = 7c92ffff, %l3 = 00000000000087a2
	lduba	[%i4+%g0]0x81,%l3	! %l3 = 000000000000007c
!	Mem[0000000010181400] = db72f184, %l4 = 00000001bf61cd03
	lduha	[%i6+%g0]0x80,%l4	! %l4 = 000000000000db72
!	Starting 10 instruction Store Burst
!	%l4 = 0000db72, %l5 = 2ad5b81b, Mem[0000000030041400] = 69340000 4c63d037
	stda	%l4,[%i1+%g0]0x81	! Mem[0000000030041400] = 0000db72 2ad5b81b

p0_label_82:
!	%f26 = 29eaa2e2 37785099, %l5 = 36e472db2ad5b81b
!	Mem[0000000030141418] = a69be755349b34e1
	add	%i5,0x018,%g1
	stda	%f26,[%g1+%l5]ASI_PST32_S ! Mem[0000000030141418] = 29eaa2e237785099
!	%l6 = 00000000000072db, Mem[0000000010041420] = 7fe245f6
	sth	%l6,[%i1+0x020]		! Mem[0000000010041420] = 72db45f6
!	%l5 = 36e472db2ad5b81b, Mem[0000000030001410] = e300000000000000
	stxa	%l5,[%i0+%o5]0x81	! Mem[0000000030001410] = 36e472db2ad5b81b
!	%f16 = d01edd19 e437566a, Mem[0000000010081408] = fe21c8ff 43157c9e
	stda	%f16,[%i2+%o4]0x88	! Mem[0000000010081408] = d01edd19 e437566a
!	Mem[0000000010181400] = 84f172db, %l6 = 00000000000072db
	swapa	[%i6+%g0]0x88,%l6	! %l6 = 0000000084f172db
!	Mem[0000000030101400] = ffff927c, %l2 = 0000000000000000
	ldstuba	[%i4+%g0]0x89,%l2	! %l2 = 0000007c000000ff
!	%l5 = 36e472db2ad5b81b, Mem[0000000010041400] = 00000000267f1a0b
	stxa	%l5,[%i1+%g0]0x88	! Mem[0000000010041400] = 36e472db2ad5b81b
!	%l3 = 000000000000007c, Mem[00000000211c0001] = 25a8e5a1, %asi = 80
	stba	%l3,[%o2+0x001]%asi	! Mem[00000000211c0000] = 257ce5a1
!	Mem[0000000030001410] = 36e472db, %l4 = 000000000000db72
	swapa	[%i0+%o5]0x81,%l4	! %l4 = 0000000036e472db
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = 57000000 0000d037, %l2 = 0000007c, %l3 = 0000007c
	ldda	[%i3+%o4]0x80,%l2	! %l2 = 0000000057000000 000000000000d037

p0_label_83:
!	Mem[0000000010141408] = 000003d2, %l0 = 0000000000000b1a
	lduha	[%i5+%o4]0x80,%l0	! %l0 = 0000000000000000
!	Mem[00000000100c1410] = f5180000047e2ea5, %l3 = 000000000000d037
	ldxa	[%i3+0x010]%asi,%l3	! %l3 = f5180000047e2ea5
!	Mem[0000000030041408] = 00000000d20359a6, %l3 = f5180000047e2ea5
	ldxa	[%i1+%o4]0x81,%l3	! %l3 = 00000000d20359a6
!	Mem[0000000030001408] = 1bb8d51e, %l5 = 36e472db2ad5b81b
	lduha	[%i0+%o4]0x89,%l5	! %l5 = 000000000000d51e
!	Mem[00000000300c1400] = 6d0a25e0, %l7 = 0000000000000069
	lduwa	[%i3+%g0]0x89,%l7	! %l7 = 000000006d0a25e0
	membar	#Sync			! Added by membar checker (11)
!	Mem[0000000030081400] = 9ad5b862 e98c78d8 d20359a6 a334634c
!	Mem[0000000030081410] = a334634c 70b4b1fd 646d910d 7abbfe4d
!	Mem[0000000030081420] = ffc52157 34000032 95d0a0c4 6bd091ff
!	Mem[0000000030081430] = 00000057 1bb8d5ff 21d0705d f28b69b5
	ldda	[%i2]ASI_BLK_AIUS,%f0	! Block Load from 0000000030081400
!	Mem[00000000211c0000] = 257ce5a1, %l5 = 000000000000d51e
	lduba	[%o2+0x000]%asi,%l5	! %l5 = 0000000000000025
!	Mem[0000000010141410] = ffffffdb, %l3 = 00000000d20359a6
	lduwa	[%i5+%o5]0x80,%l3	! %l3 = 00000000ffffffdb
!	Mem[0000000010041420] = 72db45f6 70aa6934, %l4 = 36e472db, %l5 = 00000025
	ldd	[%i1+0x020],%l4		! %l4 = 0000000072db45f6 0000000070aa6934
!	Starting 10 instruction Store Burst
!	%l3 = 00000000ffffffdb, Mem[00000000100c1408] = 57000000
	stba	%l3,[%i3+%o4]0x80	! Mem[00000000100c1408] = db000000

p0_label_84:
!	Mem[0000000030001410] = 0000db72, %l3 = 00000000ffffffdb
	ldstuba	[%i0+%o5]0x81,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030181410] = d5ff0000, %l4 = 0000000072db45f6
	swapa	[%i6+%o5]0x81,%l4	! %l4 = 00000000d5ff0000
!	Mem[0000000010141410] = ffffffdb, %l1 = 00000000927cdeff
	swapa	[%i5+%o5]0x80,%l1	! %l1 = 00000000ffffffdb
!	Mem[0000000030081410] = 4c6334a3, %l6 = 0000000084f172db
	swapa	[%i2+%o5]0x89,%l6	! %l6 = 000000004c6334a3
!	Mem[0000000030081408] = d20359a6, %l6 = 000000004c6334a3
	ldstuba	[%i2+%o4]0x81,%l6	! %l6 = 000000d2000000ff
!	%l7 = 000000006d0a25e0, Mem[00000000100c1408] = 000000db
	stha	%l7,[%i3+%o4]0x88	! Mem[00000000100c1408] = 000025e0
!	%l0 = 0000000000000000, Mem[0000000010081418] = 9c56136f606cfca9
	stx	%l0,[%i2+0x018]		! Mem[0000000010081418] = 0000000000000000
!	Mem[00000000100c1408] = 37d00000000025e0, %f28 = 94bcd52a 60b136e4
	ldda	[%i3+%o4]0x88,%f28	! %f28 = 37d00000 000025e0
!	Mem[00000000100c1410] = f5180000, %l1 = ffffffdb, %l0 = 00000000
	add	%i3,0x10,%g1
	casa	[%g1]0x80,%l1,%l0	! %l0 = 00000000f5180000
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = 37d00000 000025e0, %l4 = d5ff0000, %l5 = 70aa6934
	ldda	[%i3+%o4]0x88,%l4	! %l4 = 00000000000025e0 0000000037d00000

p0_label_85:
!	Mem[0000000010001410] = 088d03d2000000e3, %f28 = 37d00000 000025e0
	ldda	[%i0+%o5]0x88,%f28	! %f28 = 088d03d2 000000e3
!	Mem[0000000030001410] = 72db00ff, %l0 = 00000000f5180000
	lduwa	[%i0+%o5]0x89,%l0	! %l0 = 0000000072db00ff
!	Mem[0000000020800000] = ffffe062, %l0 = 0000000072db00ff
	lduh	[%o1+%g0],%l0		! %l0 = 000000000000ffff
!	Mem[0000000030081408] = ff0359a6, %l4 = 00000000000025e0
	ldsha	[%i2+%o4]0x81,%l4	! %l4 = ffffffffffffff03
!	Mem[0000000030181410] = f645db72, %f17 = e437566a
	lda	[%i6+%o5]0x89,%f17	! %f17 = f645db72
!	Mem[0000000010041438] = 445c2c9f 9f22251e, %l6 = 000000d2, %l7 = 6d0a25e0
	ldda	[%i1+0x038]%asi,%l6	! %l6 = 00000000445c2c9f 000000009f22251e
!	Mem[0000000030141410] = 2ad5bcff, %l2 = 0000000057000000
	ldswa	[%i5+%o5]0x89,%l2	! %l2 = 000000002ad5bcff
!	Mem[0000000010181410] = ff0000e7, %l5 = 0000000037d00000
	lduha	[%i6+%o5]0x80,%l5	! %l5 = 000000000000ff00
!	Mem[0000000030001400] = 99507837, %l3 = 0000000000000000
	ldswa	[%i0+%g0]0x89,%l3	! %l3 = ffffffff99507837
!	Starting 10 instruction Store Burst
!	Mem[0000000030041410] = 94bcd52a, %l1 = 00000000ffffffdb
	swapa	[%i1+%o5]0x81,%l1	! %l1 = 0000000094bcd52a

p0_label_86:
!	Mem[00000000211c0000] = 257ce5a1, %l1 = 0000000094bcd52a
	ldstub	[%o2+%g0],%l1		! %l1 = 00000025000000ff
!	%l5 = 000000000000ff00, Mem[00000000300c1400] = e0250a6d
	stba	%l5,[%i3+%g0]0x81	! Mem[00000000300c1400] = 00250a6d
!	%l7 = 000000009f22251e, Mem[0000000010001410] = e3000000d2038d08
	stxa	%l7,[%i0+%o5]0x80	! Mem[0000000010001410] = 000000009f22251e
!	Mem[00000000100c1438] = 4ca6fc6b, %l7 = 9f22251e, %l3 = 99507837
	add	%i3,0x38,%g1
	casa	[%g1]0x80,%l7,%l3	! %l3 = 000000004ca6fc6b
!	%l6 = 445c2c9f, %l7 = 9f22251e, Mem[0000000030001408] = 1ed5b81b 0000d037
	stda	%l6,[%i0+%o4]0x81	! Mem[0000000030001408] = 445c2c9f 9f22251e
!	%l7 = 000000009f22251e, Mem[0000000030041408] = 00000000d20359a6
	stxa	%l7,[%i1+%o4]0x81	! Mem[0000000030041408] = 000000009f22251e
!	Mem[00000000100c1429] = 57507837, %l5 = 000000000000ff00
	ldstuba	[%i3+0x029]%asi,%l5	! %l5 = 00000050000000ff
!	%f26 = 29eaa2e2 37785099, Mem[00000000100c1400] = 57000000 ffd5b81b
	stda	%f26,[%i3+%g0]0x88	! Mem[00000000100c1400] = 29eaa2e2 37785099
!	Mem[0000000030101400] = ffff92ff, %l4 = ffffffffffffff03
	ldstuba	[%i4+%g0]0x89,%l4	! %l4 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = ff00db72, %l4 = 00000000000000ff
	lduha	[%i0+%o5]0x81,%l4	! %l4 = 000000000000ff00

p0_label_87:
!	Mem[0000000010101434] = ffffffe9, %f5  = 70b4b1fd
	lda	[%i4+0x034]%asi,%f5 	! %f5 = ffffffe9
!	Mem[0000000010081408] = 6a5637e4, %l3 = 000000004ca6fc6b
	ldsba	[%i2+%o4]0x80,%l3	! %l3 = 000000000000006a
!	Mem[0000000010081400] = 60b136e4, %l7 = 000000009f22251e
	ldswa	[%i2+%g0]0x88,%l7	! %l7 = 0000000060b136e4
!	%f20 = 796694bc, %f24 = 00736934, %f10 = 95d0a0c4
	fadds	%f20,%f24,%f10		! %l0 = 0000000000010021, Unfinished, %fsr = 2100000800
!	Mem[0000000010141410] = 927cdeff, %l0 = 0000000000010021
	ldsba	[%i5+%o5]0x80,%l0	! %l0 = ffffffffffffff92
!	Mem[00000000100c1410] = f5180000, %l3 = 000000000000006a
	lduba	[%i3+%o5]0x80,%l3	! %l3 = 00000000000000f5
!	Mem[0000000030181400] = ff0000ff 60b136e4, %l2 = 2ad5bcff, %l3 = 000000f5
	ldda	[%i6+%g0]0x81,%l2	! %l2 = 00000000ff0000ff 0000000060b136e4
!	Mem[0000000010141428] = a6667f18, %f13 = 1bb8d5ff
	lda	[%i5+0x028]%asi,%f13	! %f13 = a6667f18
!	Mem[0000000010181434] = 47ee08bd, %l7 = 0000000060b136e4
	lduwa	[%i6+0x034]%asi,%l7	! %l7 = 0000000047ee08bd
!	Starting 10 instruction Store Burst
!	%f9  = 34000032, Mem[0000000030041408] = 00000000
	sta	%f9 ,[%i1+%o4]0x89	! Mem[0000000030041408] = 34000032

p0_label_88:
!	%l1 = 0000000000000025, Mem[0000000010041430] = e9f291be, %asi = 80
	stha	%l1,[%i1+0x030]%asi	! Mem[0000000010041430] = 002591be
!	%l1 = 0000000000000025, Mem[0000000010041410] = d2038d08
	stwa	%l1,[%i1+%o5]0x80	! Mem[0000000010041410] = 00000025
!	Mem[0000000010041408] = 2ad5bc94, %l3 = 0000000060b136e4
	swapa	[%i1+%o4]0x88,%l3	! %l3 = 000000002ad5bc94
!	Mem[0000000010041410] = 00000025, %l5 = 0000000000000050
	ldstuba	[%i1+%o5]0x80,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010141418] = 796694bc, %l5 = 0000000000000000, %asi = 80
	swapa	[%i5+0x018]%asi,%l5	! %l5 = 00000000796694bc
!	%l1 = 0000000000000025, Mem[0000000030141400] = 00000000
	stha	%l1,[%i5+%g0]0x81	! Mem[0000000030141400] = 00250000
!	%f16 = d01edd19 f645db72, Mem[0000000010041410] = ff000025 13ce7c52
	stda	%f16,[%i1+%o5]0x80	! Mem[0000000010041410] = d01edd19 f645db72
!	Mem[0000000030101410] = fd0000ff, %l7 = 0000000047ee08bd
	swapa	[%i4+%o5]0x89,%l7	! %l7 = 00000000fd0000ff
!	Mem[0000000010041400] = 1bb8d52a, %l1 = 0000000000000025
	ldstuba	[%i1+%g0]0x80,%l1	! %l1 = 0000001b000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = 37c3a13c, %l2 = 00000000ff0000ff
	ldswa	[%i0+0x008]%asi,%l2	! %l2 = 0000000037c3a13c

p0_label_89:
!	Mem[0000000030101408] = 088d03d2, %l5 = 00000000796694bc
	lduba	[%i4+%o4]0x89,%l5	! %l5 = 00000000000000d2
!	Mem[0000000010001410] = 00000000, %l6 = 00000000445c2c9f
	lduba	[%i0+%o5]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000030081408] = ff0359a6 a334634c, %l4 = 0000ff00, %l5 = 000000d2
	ldda	[%i2+%o4]0x81,%l4	! %l4 = 00000000ff0359a6 00000000a334634c
!	Mem[0000000010141410] = 927cdeff, %l0 = ffffffffffffff92
	ldsba	[%i5+%o5]0x80,%l0	! %l0 = ffffffffffffff92
!	Mem[0000000010041410] = 72db45f619dd1ed0, %f2  = d20359a6 a334634c
	ldda	[%i1+%o5]0x88,%f2 	! %f2  = 72db45f6 19dd1ed0
!	Mem[0000000010101400] = 1bb8d51b, %l5 = 00000000a334634c
	lduha	[%i4+%g0]0x88,%l5	! %l5 = 000000000000d51b
!	Mem[0000000010081408] = d01edd19e437566a, %l4 = 00000000ff0359a6
	ldxa	[%i2+%o4]0x88,%l4	! %l4 = d01edd19e437566a
!	Mem[0000000010041408] = e436b16060b136e4, %l6 = 0000000000000000
	ldxa	[%i1+%o4]0x88,%l6	! %l6 = e436b16060b136e4
!	Mem[00000000300c1408] = 19dd1ed0, %f5  = ffffffe9
	lda	[%i3+%o4]0x81,%f5 	! %f5 = 19dd1ed0
!	Starting 10 instruction Store Burst
!	Mem[0000000010141408] = d2030000, %l2 = 0000000037c3a13c
	swapa	[%i5+%o4]0x88,%l2	! %l2 = 00000000d2030000

p0_label_90:
!	%f26 = 29eaa2e2 37785099, Mem[0000000030101408] = 088d03d2 527cce13
	stda	%f26,[%i4+%o4]0x89	! Mem[0000000030101408] = 29eaa2e2 37785099
!	Mem[0000000030141400] = 00002500, %l2 = 00000000d2030000
	swapa	[%i5+%g0]0x89,%l2	! %l2 = 0000000000002500
!	%l1 = 000000000000001b, Mem[0000000010141400] = db726c60
	stwa	%l1,[%i5+%g0]0x80	! Mem[0000000010141400] = 0000001b
!	%f20 = 796694bc, Mem[0000000010141410] = 927cdeff
	sta	%f20,[%i5+%o5]0x80	! Mem[0000000010141410] = 796694bc
!	%f30 = 00000057 1ed5b81b, Mem[0000000030001400] = 99507837 fd000000
	stda	%f30,[%i0+%g0]0x89	! Mem[0000000030001400] = 00000057 1ed5b81b
!	Mem[0000000030081408] = a65903ff, %l3 = 000000002ad5bc94
	swapa	[%i2+%o4]0x89,%l3	! %l3 = 00000000a65903ff
!	%f27 = 37785099, Mem[00000000100c1400] = 37785099
	sta	%f27,[%i3+%g0]0x88	! Mem[00000000100c1400] = 37785099
!	%l1 = 000000000000001b, Mem[0000000030141408] = 800000ff
	stba	%l1,[%i5+%o4]0x89	! Mem[0000000030141408] = 8000001b
!	%f2  = 72db45f6 19dd1ed0, Mem[0000000030181408] = a334634c bc940000
	stda	%f2 ,[%i6+%o4]0x89	! Mem[0000000030181408] = 72db45f6 19dd1ed0
!	Starting 10 instruction Load Burst
!	Mem[000000001014141c] = 4c633403, %l6 = e436b16060b136e4
	ldub	[%i5+0x01e],%l6		! %l6 = 0000000000000034

p0_label_91:
!	Mem[0000000010001408] = 37c3a13cc38122ff, %f0  = 9ad5b862 e98c78d8
	ldda	[%i0+%o4]0x80,%f0 	! %f0  = 37c3a13c c38122ff
!	Mem[0000000010081410] = 0334634c, %l0 = ffffffffffffff92
	lduha	[%i2+%o5]0x80,%l0	! %l0 = 0000000000000334
!	Mem[0000000010101410] = e98c78d830d86fba, %l1 = 000000000000001b
	ldxa	[%i4+%o5]0x88,%l1	! %l1 = e98c78d830d86fba
!	Mem[00000000300c1410] = 0334634c, %l1 = e98c78d830d86fba
	lduha	[%i3+%o5]0x81,%l1	! %l1 = 0000000000000334
!	Mem[0000000010081400] = e436b160, %l1 = 0000000000000334
	ldsba	[%i2+%g0]0x80,%l1	! %l1 = ffffffffffffffe4
!	Mem[0000000010141400] = 1b000000, %l6 = 0000000000000034
	ldsba	[%i5+%g0]0x88,%l6	! %l6 = 0000000000000000
!	Mem[00000000100c1400] = 99507837, %l3 = 00000000a65903ff
	ldsha	[%i3+%g0]0x80,%l3	! %l3 = ffffffffffff9950
!	Mem[0000000010141408] = 3ca1c337, %l2 = 0000000000002500
	lduh	[%i5+%o4],%l2		! %l2 = 0000000000003ca1
!	Mem[0000000030041410] = ffffffdbdb72f184, %l1 = ffffffffffffffe4
	ldxa	[%i1+%o5]0x81,%l1	! %l1 = ffffffdbdb72f184
!	Starting 10 instruction Store Burst
!	Mem[0000000010141417] = 0f0be2a9, %l2 = 0000000000003ca1
	ldstub	[%i5+0x017],%l2		! %l2 = 000000a9000000ff

p0_label_92:
!	Mem[0000000010001400] = a3346369, %l2 = 00000000000000a9
	ldstuba	[%i0+%g0]0x88,%l2	! %l2 = 00000069000000ff
!	Mem[0000000030001410] = 72db00ff, %l7 = 00000000fd0000ff
	swapa	[%i0+%o5]0x89,%l7	! %l7 = 0000000072db00ff
!	Mem[00000000300c1410] = 4c633403, %l6 = 0000000000000000
	swapa	[%i3+%o5]0x89,%l6	! %l6 = 000000004c633403
!	%l0 = 00000334, %l1 = db72f184, Mem[0000000010001418] = 00000057 b24634a3
	stda	%l0,[%i0+0x018]%asi	! Mem[0000000010001418] = 00000334 db72f184
!	%l0 = 00000334, %l1 = db72f184, Mem[0000000030101408] = 99507837 e2a2ea29
	stda	%l0,[%i4+%o4]0x81	! Mem[0000000030101408] = 00000334 db72f184
!	%l0 = 00000334, %l1 = db72f184, Mem[0000000010181400] = db720000 000094bc
	stda	%l0,[%i6+%g0]0x80	! Mem[0000000010181400] = 00000334 db72f184
!	%l7 = 0000000072db00ff, Mem[0000000030141410] = 2ad5bcff
	stha	%l7,[%i5+%o5]0x89	! Mem[0000000030141410] = 2ad500ff
!	%l0 = 0000000000000334, Mem[00000000300c1408] = d01edd19
	stha	%l0,[%i3+%o4]0x89	! Mem[00000000300c1408] = d01e0334
!	Mem[00000000211c0000] = ff7ce5a1, %l4 = d01edd19e437566a
	ldstuba	[%o2+0x000]%asi,%l4	! %l4 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = ffb8d52a, %l7 = 0000000072db00ff
	lduwa	[%i1+%g0]0x80,%l7	! %l7 = 00000000ffb8d52a

p0_label_93:
!	Mem[0000000010041400] = ffb8d52a, %l3 = ffffffffffff9950
	lduba	[%i1+%g0]0x80,%l3	! %l3 = 00000000000000ff
!	Mem[00000000300c1400] = 00250a6d4c6334a3, %f2  = 72db45f6 19dd1ed0
	ldda	[%i3+%g0]0x81,%f2 	! %f2  = 00250a6d 4c6334a3
!	Mem[0000000010181410] = fd2146b2e70000ff, %f14 = 21d0705d f28b69b5
	ldda	[%i6+%o5]0x88,%f14	! %f14 = fd2146b2 e70000ff
!	%l3 = 00000000000000ff, %l1 = ffffffdbdb72f184, %l0 = 0000000000000334
	xor	%l3,%l1,%l0		! %l0 = ffffffdbdb72f17b
!	Mem[0000000010141400] = 9c56136f 1b000000, %l2 = 00000069, %l3 = 000000ff
	ldda	[%i5+%g0]0x88,%l2	! %l2 = 000000001b000000 000000009c56136f
!	Mem[0000000030141400] = 000003d200002157, %l0 = ffffffdbdb72f17b
	ldxa	[%i5+%g0]0x81,%l0	! %l0 = 000003d200002157
!	Mem[0000000030141410] = 2ad500ff, %l6 = 000000004c633403
	ldsha	[%i5+%o5]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010141410] = 796694bc0f0be2ff, %f30 = 00000057 1ed5b81b
	ldda	[%i5+%o5]0x80,%f30	! %f30 = 796694bc 0f0be2ff
!	Mem[0000000010001420] = d2038d08, %l7 = 00000000ffb8d52a
	ldsha	[%i0+0x020]%asi,%l7	! %l7 = ffffffffffffd203
!	Starting 10 instruction Store Burst
!	%l1 = ffffffdbdb72f184, Mem[0000000030001410] = ff0000fd
	stha	%l1,[%i0+%o5]0x81	! Mem[0000000030001410] = f18400fd

p0_label_94:
!	%l6 = 00000000000000ff, Mem[0000000010141408] = 3ca1c337
	stwa	%l6,[%i5+%o4]0x80	! Mem[0000000010141408] = 000000ff
!	%l6 = 00000000000000ff, Mem[00000000201c0000] = ffff01ce
	sth	%l6,[%o0+%g0]		! Mem[00000000201c0000] = 00ff01ce
!	%f0  = 37c3a13c c38122ff 00250a6d 4c6334a3
!	%f4  = a334634c 19dd1ed0 646d910d 7abbfe4d
!	%f8  = ffc52157 34000032 95d0a0c4 6bd091ff
!	%f12 = 00000057 a6667f18 fd2146b2 e70000ff
	stda	%f0,[%i0]ASI_COMMIT_S	! Block Store to 0000000030001400
!	%l4 = 00000000000000ff, Mem[0000000030041400] = 0000db722ad5b81b
	stxa	%l4,[%i1+%g0]0x81	! Mem[0000000030041400] = 00000000000000ff
!	%l0 = 000003d200002157, Mem[00000000100c1408] = 000025e0
	stba	%l0,[%i3+%o4]0x88	! Mem[00000000100c1408] = 00002557
!	%f0  = 37c3a13c c38122ff 00250a6d 4c6334a3
!	%f4  = a334634c 19dd1ed0 646d910d 7abbfe4d
!	%f8  = ffc52157 34000032 95d0a0c4 6bd091ff
!	%f12 = 00000057 a6667f18 fd2146b2 e70000ff
	stda	%f0,[%i1]ASI_BLK_AIUPL	! Block Store to 0000000010041400
	membar	#Sync			! Added by membar checker (12)
!	%l0 = 000003d200002157, Mem[0000000030001400] = 37c3a13c
	stwa	%l0,[%i0+%g0]0x81	! Mem[0000000030001400] = 00002157
!	Mem[00000000201c0001] = 00ff01ce, %l2 = 000000001b000000
	ldstub	[%o0+0x001],%l2		! %l2 = 000000ff000000ff
!	%l2 = 000000ff, %l3 = 9c56136f, Mem[0000000010041400] = ff2281c3 3ca1c337
	std	%l2,[%i1+%g0]		! Mem[0000000010041400] = 000000ff 9c56136f
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = d01edd194c6334a3, %f16 = d01edd19 f645db72
	ldda	[%i1+%o5]0x80,%f16	! %f16 = d01edd19 4c6334a3

p0_label_95:
!	Mem[0000000010141434] = 1560aefe, %l2 = 00000000000000ff
	ldsw	[%i5+0x034],%l2		! %l2 = 000000001560aefe
!	Mem[0000000030081408] = 2ad5bc94, %l5 = 000000000000d51b
	ldsha	[%i2+%o4]0x89,%l5	! %l5 = ffffffffffffbc94
!	Mem[0000000030081408] = 2ad5bc94, %l3 = 000000009c56136f
	lduha	[%i2+%o4]0x89,%l3	! %l3 = 000000000000bc94
!	Mem[0000000010141400] = 1b000000, %l6 = 00000000000000ff
	ldsba	[%i5+%g0]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000030101408] = 84f172db34030000, %f12 = 00000057 a6667f18
	ldda	[%i4+%o4]0x89,%f12	! %f12 = 84f172db 34030000
!	Mem[00000000100c1408] = 00002557, %l5 = ffffffffffffbc94
	lduha	[%i3+%o4]0x88,%l5	! %l5 = 0000000000002557
!	Mem[0000000030081408] = 94bcd52a, %f20 = 796694bc
	lda	[%i2+%o4]0x81,%f20	! %f20 = 94bcd52a
!	Mem[00000000201c0000] = 00ff01ce, %l0 = 000003d200002157
	ldsh	[%o0+%g0],%l0		! %l0 = 00000000000000ff
!	%f29 = 000000e3, %f9  = 34000032, %f23 = 6f13569c
	fmuls	%f29,%f9 ,%f23		! %l0 = 0000000000000121, Unfinished, %fsr = 2100000800
!	Starting 10 instruction Store Burst
!	%f20 = 94bcd52a 4c633403, %l4 = 00000000000000ff
!	Mem[0000000030141430] = ca0e600f5721c519
	add	%i5,0x030,%g1
	stda	%f20,[%g1+%l4]ASI_PST16_S ! Mem[0000000030141430] = 94bcd52a4c633403

p0_label_96:
!	Mem[0000000010141410] = 796694bc, %l4 = 00000000000000ff
	swapa	[%i5+%o5]0x80,%l4	! %l4 = 00000000796694bc
!	Mem[0000000010101408] = af3ce436, %l2 = 000000001560aefe
	swapa	[%i4+%o4]0x88,%l2	! %l2 = 00000000af3ce436
!	%l7 = ffffffffffffd203, Mem[0000000030101408] = 84f172db34030000
	stxa	%l7,[%i4+%o4]0x89	! Mem[0000000030101408] = ffffffffffffd203
!	%l1 = ffffffdbdb72f184, Mem[000000001008142d] = e2a2ea29, %asi = 80
	stba	%l1,[%i2+0x02d]%asi	! Mem[000000001008142c] = e284ea29
!	Mem[000000001014141c] = 4c633403, %l1 = ffffffdbdb72f184
	ldstub	[%i5+0x01c],%l1		! %l1 = 0000004c000000ff
!	Code Fragment 4
p0_fragment_8:
!	%l0 = 0000000000000121
	setx	0x33bf3bdf9627cd82,%g7,%l0 ! %l0 = 33bf3bdf9627cd82
!	%l1 = 000000000000004c
	setx	0x5493f24f9b2540a3,%g7,%l1 ! %l1 = 5493f24f9b2540a3
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 33bf3bdf9627cd82
	setx	0x78ccfcbfb3ea07fd,%g7,%l0 ! %l0 = 78ccfcbfb3ea07fd
!	%l1 = 5493f24f9b2540a3
	setx	0x9e0c4258249e9f35,%g7,%l1 ! %l1 = 9e0c4258249e9f35
!	Mem[0000000010141408] = 000000ff, %l5 = 0000000000002557
	ldstuba	[%i5+%o4]0x80,%l5	! %l5 = 00000000000000ff
!	%l6 = 0000000000000000, Mem[0000000010141410] = 000000ff0f0be2ff
	stxa	%l6,[%i5+%o5]0x80	! Mem[0000000010141410] = 0000000000000000
!	%f20 = 94bcd52a 4c633403, Mem[0000000010141408] = ff0000ff 1bb8d52a
	stda	%f20,[%i5+%o4]0x88	! Mem[0000000010141408] = 94bcd52a 4c633403
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = 00000000, %l6 = 0000000000000000
	lduba	[%i1+%g0]0x81,%l6	! %l6 = 0000000000000000

p0_label_97:
!	Mem[0000000010101408] = 1560aefe, %l4 = 00000000796694bc
	ldsha	[%i4+%o4]0x88,%l4	! %l4 = ffffffffffffaefe
!	Mem[000000001018141c] = 60b1fbe4, %f6  = 646d910d
	lda	[%i6+0x01c]%asi,%f6 	! %f6 = 60b1fbe4
!	Mem[0000000010081410] = 4c633403, %l3 = 000000000000bc94
	lduha	[%i2+%o5]0x88,%l3	! %l3 = 0000000000003403
!	Mem[0000000010081408] = d01edd19 e437566a, %l6 = 00000000, %l7 = ffffd203
	ldda	[%i2+%o4]0x88,%l6	! %l6 = 00000000e437566a 00000000d01edd19
!	Mem[0000000010101438] = e22787a2, %l1 = 9e0c4258249e9f35
	ldsha	[%i4+0x03a]%asi,%l1	! %l1 = ffffffffffff87a2
!	Mem[0000000030081410] = db72f184, %l6 = 00000000e437566a
	lduwa	[%i2+%o5]0x81,%l6	! %l6 = 00000000db72f184
!	Mem[0000000030101410] = bd08ee4775f8ffff, %f4  = a334634c 19dd1ed0
	ldda	[%i4+%o5]0x81,%f4 	! %f4  = bd08ee47 75f8ffff
!	Mem[0000000010181410] = ff0000e7, %l2 = 00000000af3ce436
	ldswa	[%i6+%o5]0x80,%l2	! %l2 = ffffffffff0000e7
!	Mem[0000000010001410] = 00000000, %f16 = d01edd19
	lda	[%i0+%o5]0x80,%f16	! %f16 = 00000000
!	Starting 10 instruction Store Burst
!	%l4 = ffffffffffffaefe, Mem[0000000010001408] = 37c3a13c
	stba	%l4,[%i0+%o4]0x80	! Mem[0000000010001408] = fec3a13c

p0_label_98:
!	Mem[0000000010041410] = d01edd19, %l2 = ffffffffff0000e7
	ldstuba	[%i1+%o5]0x80,%l2	! %l2 = 000000d0000000ff
!	%f8  = ffc52157 34000032, Mem[0000000030141410] = 2ad500ff 000094bc
	stda	%f8 ,[%i5+%o5]0x89	! Mem[0000000030141410] = ffc52157 34000032
!	Mem[0000000030141400] = 000003d2, %l4 = ffffffffffffaefe
	swapa	[%i5+%g0]0x81,%l4	! %l4 = 00000000000003d2
!	Mem[0000000010081428] = 99507837e284ea29, %l6 = 00000000db72f184, %l0 = 78ccfcbfb3ea07fd
	add	%i2,0x28,%g1
	casxa	[%g1]0x80,%l6,%l0	! %l0 = 99507837e284ea29
!	%f22 = a9fc6c60 6f13569c, Mem[0000000010141400] = 1b000000 9c56136f
	stda	%f22,[%i5+%g0]0x88	! Mem[0000000010141400] = a9fc6c60 6f13569c
!	%l6 = 00000000db72f184, Mem[0000000010001408] = 3ca1c3fe
	stha	%l6,[%i0+%o4]0x88	! Mem[0000000010001408] = 3ca1f184
!	%l0 = 99507837e284ea29, Mem[0000000030141410] = 32000034
	stba	%l0,[%i5+%o5]0x81	! Mem[0000000030141410] = 29000034
!	%f14 = fd2146b2 e70000ff, Mem[0000000010181410] = ff0000e7 b24621fd
	stda	%f14,[%i6+%o5]0x80	! Mem[0000000010181410] = fd2146b2 e70000ff
!	%l3 = 0000000000003403, Mem[0000000030001400] = 00002157
	stba	%l3,[%i0+%g0]0x81	! Mem[0000000030001400] = 03002157
!	Starting 10 instruction Load Burst
!	Mem[00000000100c142c] = e2a2ea29, %l4 = 00000000000003d2
	ldsha	[%i3+0x02e]%asi,%l4	! %l4 = ffffffffffffea29

p0_label_99:
!	Mem[0000000010081410] = 0334634c bc946679, %l6 = db72f184, %l7 = d01edd19
	ldda	[%i2+%o5]0x80,%l6	! %l6 = 000000000334634c 00000000bc946679
!	Mem[0000000030081400] = 9ad5b862 e98c78d8, %l4 = ffffea29, %l5 = 00000000
	ldda	[%i2+%g0]0x81,%l4	! %l4 = 000000009ad5b862 00000000e98c78d8
!	Mem[0000000030101410] = bd08ee47, %l3 = 0000000000003403
	ldsba	[%i4+%o5]0x81,%l3	! %l3 = ffffffffffffffbd
!	Mem[0000000030001400] = 03002157 c38122ff, %l2 = 000000d0, %l3 = ffffffbd
	ldda	[%i0+%g0]0x81,%l2	! %l2 = 0000000003002157 00000000c38122ff
!	Mem[0000000030081408] = 2ad5bc94, %f6  = 60b1fbe4
	lda	[%i2+%o4]0x89,%f6 	! %f6 = 2ad5bc94
!	Mem[0000000010041428] = ff91d06b, %l2 = 0000000003002157
	ldsh	[%i1+0x028],%l2		! %l2 = ffffffffffffff91
!	Mem[0000000010101410] = 30d86fba, %l5 = 00000000e98c78d8
	ldswa	[%i4+%o5]0x88,%l5	! %l5 = 0000000030d86fba
!	Mem[0000000010141408] = 4c633403, %l6 = 000000000334634c
	lduwa	[%i5+%o4]0x88,%l6	! %l6 = 000000004c633403
!	Mem[0000000010041410] = ff1edd19, %l3 = 00000000c38122ff
	lduwa	[%i1+%o5]0x80,%l3	! %l3 = 00000000ff1edd19
!	Starting 10 instruction Store Burst
!	%l4 = 000000009ad5b862, Mem[0000000010181410] = fd2146b2
	stba	%l4,[%i6+%o5]0x80	! Mem[0000000010181410] = 622146b2

p0_label_100:
!	%l5 = 0000000030d86fba, Mem[0000000030041410] = ffffffdb
	stha	%l5,[%i1+%o5]0x81	! Mem[0000000030041410] = 6fbaffdb
!	%l0 = e284ea29, %l1 = ffff87a2, Mem[0000000010081410] = 4c633403 796694bc
	stda	%l0,[%i2+%o5]0x88	! Mem[0000000010081410] = e284ea29 ffff87a2
!	Mem[0000000030181408] = 19dd1ed0, %l4 = 000000009ad5b862
	ldstuba	[%i6+%o4]0x89,%l4	! %l4 = 000000d0000000ff
!	Mem[0000000030081408] = 2ad5bc94, %l2 = ffffffffffffff91
	swapa	[%i2+%o4]0x89,%l2	! %l2 = 000000002ad5bc94
!	Mem[0000000030041408] = 34000032, %l6 = 000000004c633403
	swapa	[%i1+%o4]0x89,%l6	! %l6 = 0000000034000032
!	Mem[00000000100c1408] = 00002557, %l2 = 000000002ad5bc94
	ldstuba	[%i3+%o4]0x88,%l2	! %l2 = 00000057000000ff
!	Mem[00000000211c0001] = ff7ce5a1, %l7 = 00000000bc946679
	ldstuba	[%o2+0x001]%asi,%l7	! %l7 = 0000007c000000ff
!	%l2 = 00000057, %l3 = ff1edd19, Mem[0000000030141408] = 1b000080 00000069
	stda	%l2,[%i5+%o4]0x81	! Mem[0000000030141408] = 00000057 ff1edd19
!	%l3 = 00000000ff1edd19, Mem[0000000010141410] = 00000000
	stha	%l3,[%i5+%o5]0x88	! Mem[0000000010141410] = 0000dd19
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = 57000000, %l4 = 00000000000000d0
	ldsba	[%i5+%o4]0x89,%l4	! %l4 = 0000000000000000

p0_label_101:
!	Mem[0000000030081400] = d8788ce9 62b8d59a, %l0 = e284ea29, %l1 = ffff87a2
	ldda	[%i2+%g0]0x89,%l0	! %l0 = 0000000062b8d59a 00000000d8788ce9
!	Mem[0000000010041400] = 000000ff9c56136f, %f30 = 796694bc 0f0be2ff
	ldd	[%i1+%g0],%f30		! %f30 = 000000ff 9c56136f
!	Mem[0000000030041408] = 4c633403, %l6 = 0000000034000032
	lduha	[%i1+%o4]0x89,%l6	! %l6 = 0000000000003403
!	Mem[0000000030141410] = 34000029, %l7 = 000000000000007c
	lduha	[%i5+%o5]0x89,%l7	! %l7 = 0000000000000029
!	Mem[00000000211c0000] = ffffe5a1, %l2 = 0000000000000057
	lduh	[%o2+%g0],%l2		! %l2 = 000000000000ffff
!	Mem[0000000030001408] = 00250a6d 4c6334a3, %l0 = 62b8d59a, %l1 = d8788ce9
	ldda	[%i0+%o4]0x81,%l0	! %l0 = 0000000000250a6d 000000004c6334a3
!	Mem[0000000010181400] = 84f172db34030000, %l7 = 0000000000000029
	ldxa	[%i6+%g0]0x88,%l7	! %l7 = 84f172db34030000
!	Mem[00000000300c1410] = 00000000, %l3 = 00000000ff1edd19
	ldswa	[%i3+%o5]0x81,%l3	! %l3 = 0000000000000000
!	Mem[00000000100c1410] = 000018f5, %f14 = fd2146b2
	lda	[%i3+%o5]0x88,%f14	! %f14 = 000018f5
!	Starting 10 instruction Store Burst
!	%l2 = 000000000000ffff, Mem[0000000010041410] = ff1edd19
	stw	%l2,[%i1+%o5]		! Mem[0000000010041410] = 0000ffff

p0_label_102:
!	%l3 = 0000000000000000, Mem[0000000030041400] = 00000000
	stwa	%l3,[%i1+%g0]0x89	! Mem[0000000030041400] = 00000000
!	%f3  = 4c6334a3, Mem[0000000010041420] = 32000034
	st	%f3 ,[%i1+0x020]	! Mem[0000000010041420] = 4c6334a3
!	%l3 = 0000000000000000, Mem[0000000030041410] = 6fbaffdb
	stba	%l3,[%i1+%o5]0x81	! Mem[0000000030041410] = 00baffdb
!	%f17 = 4c6334a3, Mem[0000000030041400] = 00000000
	sta	%f17,[%i1+%g0]0x89	! Mem[0000000030041400] = 4c6334a3
!	Mem[00000000300c1408] = 34031ed0, %l0 = 0000000000250a6d
	ldstuba	[%i3+%o4]0x81,%l0	! %l0 = 00000034000000ff
!	Mem[00000000100c1428] = 57ff7837, %l3 = 0000000000000000, %asi = 80
	swapa	[%i3+0x028]%asi,%l3	! %l3 = 0000000057ff7837
!	%l7 = 84f172db34030000, Mem[0000000021800140] = ff6099db, %asi = 80
	stba	%l7,[%o3+0x140]%asi	! Mem[0000000021800140] = 006099db
!	Mem[0000000010101400] = 1bb8d51b, %l3 = 0000000057ff7837
	swapa	[%i4+%g0]0x88,%l3	! %l3 = 000000001bb8d51b
!	Mem[0000000010001410] = 00000000, %l7 = 84f172db34030000
	ldstuba	[%i0+%o5]0x80,%l7	! %l7 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = 00250a6d, %l1 = 000000004c6334a3
	lduha	[%i0+%o4]0x81,%l1	! %l1 = 0000000000000025

p0_label_103:
!	Mem[0000000010141410] = 19dd0000, %l7 = 0000000000000000
	lduwa	[%i5+%o5]0x80,%l7	! %l7 = 0000000019dd0000
!	Mem[000000001010143c] = 4373d92b, %l0 = 0000000000000034
	ldsha	[%i4+0x03c]%asi,%l0	! %l0 = 0000000000004373
!	Mem[000000001018143c] = 047e2ea5, %f27 = 37785099
	lda	[%i6+0x03c]%asi,%f27	! %f27 = 047e2ea5
!	%l5 = 0000000030d86fba, %l4 = 0000000000000000, %l0 = 0000000000004373
	addc	%l5,%l4,%l0		! %l0 = 0000000030d86fba
!	Mem[0000000020800040] = 2a1ef99a, %l3 = 000000001bb8d51b
	lduha	[%o1+0x040]%asi,%l3	! %l3 = 0000000000002a1e
!	Mem[0000000021800140] = 006099db, %l1 = 0000000000000025
	ldub	[%o3+0x140],%l1		! %l1 = 0000000000000000
!	Mem[0000000010141400] = 6f13569c, %l1 = 0000000000000000
	lduha	[%i5+%g0]0x88,%l1	! %l1 = 000000000000569c
!	Mem[00000000201c0000] = 00ff01ce, %l7 = 0000000019dd0000
	ldub	[%o0+%g0],%l7		! %l7 = 0000000000000000
!	Mem[00000000100c1408] = 000025ff, %l2 = 000000000000ffff
	ldswa	[%i3+%o4]0x88,%l2	! %l2 = 00000000000025ff
!	Starting 10 instruction Store Burst
!	%l5 = 0000000030d86fba, Mem[0000000010041400] = 6f13569cff000000
	stxa	%l5,[%i1+%g0]0x88	! Mem[0000000010041400] = 0000000030d86fba

p0_label_104:
!	%l4 = 0000000000000000, Mem[0000000030081410] = 84f172db
	stha	%l4,[%i2+%o5]0x89	! Mem[0000000030081410] = 84f10000
!	%f29 = 000000e3, Mem[0000000010001408] = 84f1a13c
	sta	%f29,[%i0+%o4]0x80	! Mem[0000000010001408] = 000000e3
!	%l7 = 0000000000000000, Mem[0000000030141408] = 00000057
	stha	%l7,[%i5+%o4]0x81	! Mem[0000000030141408] = 00000057
!	%l3 = 0000000000002a1e, Mem[0000000030101408] = ffffd203
	stha	%l3,[%i4+%o4]0x89	! Mem[0000000030101408] = ffff2a1e
!	%f20 = 94bcd52a 4c633403, Mem[0000000010041408] = a334634c 6d0a2500
	stda	%f20,[%i1+%o4]0x80	! Mem[0000000010041408] = 94bcd52a 4c633403
!	Mem[0000000030101408] = ffff2a1e, %l3 = 0000000000002a1e
	swapa	[%i4+%o4]0x89,%l3	! %l3 = 00000000ffff2a1e
!	%f16 = 00000000, %f2  = 00250a6d, %f17 = 4c6334a3
	fmuls	%f16,%f2 ,%f17		! %f17 = 00000000
!	%f16 = 00000000 00000000 43157c9e fe21c880
!	%f20 = 94bcd52a 4c633403 a9fc6c60 6f13569c
!	%f24 = 00736934 047e2ea5 29eaa2e2 047e2ea5
!	%f28 = 088d03d2 000000e3 000000ff 9c56136f
	stda	%f16,[%i6]ASI_BLK_SL	! Block Store to 0000000030181400
!	%l6 = 00003403, %l7 = 00000000, Mem[0000000030001410] = 4c6334a3 d01edd19
	stda	%l6,[%i0+%o5]0x89	! Mem[0000000030001410] = 00003403 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = ff92ffff, %l0 = 0000000030d86fba
	ldsha	[%i4+%g0]0x81,%l0	! %l0 = ffffffffffffff92

p0_label_105:
!	Mem[00000000100c1410] = f5180000, %l3 = 00000000ffff2a1e
	lduha	[%i3+0x012]%asi,%l3	! %l3 = 0000000000000000
!	Mem[0000000010001400] = ff6334a3 306359ca, %l4 = 00000000, %l5 = 30d86fba
	ldd	[%i0+%g0],%l4		! %l4 = 00000000ff6334a3 00000000306359ca
	membar	#Sync			! Added by membar checker (13)
!	Mem[0000000010181400] = 34030000, %l7 = 0000000000000000
	ldsba	[%i6+%g0]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000010101400] = 3778ff57, %f21 = 4c633403
	lda	[%i4+%g0]0x80,%f21	! %f21 = 3778ff57
!	Mem[00000000201c0000] = 00ff01ce, %l5 = 00000000306359ca
	lduh	[%o0+%g0],%l5		! %l5 = 00000000000000ff
!	Mem[0000000010001400] = ff6334a3 306359ca, %l2 = 000025ff, %l3 = 00000000
	ldd	[%i0+%g0],%l2		! %l2 = 00000000ff6334a3 00000000306359ca
!	Mem[0000000020800040] = 2a1ef99a, %l3 = 00000000306359ca
	lduba	[%o1+0x041]%asi,%l3	! %l3 = 000000000000001e
!	Mem[0000000030041400] = 4c6334a3, %f31 = 9c56136f
	lda	[%i1+%g0]0x89,%f31	! %f31 = 4c6334a3
!	Mem[0000000010181410] = 622146b2e70000ff, %l5 = 00000000000000ff
	ldx	[%i6+%o5],%l5		! %l5 = 622146b2e70000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000010001408] = e3000000, %l5 = 622146b2e70000ff
	ldstuba	[%i0+%o4]0x88,%l5	! %l5 = 00000000000000ff

p0_label_106:
!	%l3 = 000000000000001e, Mem[0000000030101408] = ffffffff00002a1e
	stxa	%l3,[%i4+%o4]0x89	! Mem[0000000030101408] = 000000000000001e
!	%l1 = 000000000000569c, Mem[0000000030081400] = 9ad5b862
	stha	%l1,[%i2+%g0]0x81	! Mem[0000000030081400] = 569cb862
!	Mem[0000000010181400] = 00000334, %l6 = 0000000000003403
	swapa	[%i6+%g0]0x80,%l6	! %l6 = 0000000000000334
!	Mem[0000000021800180] = a1b7423e, %l1 = 000000000000569c
	ldstub	[%o3+0x180],%l1		! %l1 = 000000a1000000ff
!	%l4 = 00000000ff6334a3, Mem[0000000010001408] = ff0000e3
	stba	%l4,[%i0+%o4]0x80	! Mem[0000000010001408] = a30000e3
!	Mem[0000000030181408] = 80c821fe, %l0 = ffffffffffffff92
	swapa	[%i6+%o4]0x81,%l0	! %l0 = 0000000080c821fe
!	Mem[0000000030181408] = 92ffffff, %l0 = 0000000080c821fe
	ldstuba	[%i6+%o4]0x89,%l0	! %l0 = 000000ff000000ff
!	%l6 = 00000334, %l7 = 00000000, Mem[0000000010141410] = 19dd0000 00000000
	stda	%l6,[%i5+%o5]0x80	! Mem[0000000010141410] = 00000334 00000000
!	Mem[00000000211c0001] = ffffe5a1, %l1 = 00000000000000a1
	ldstub	[%o2+0x001],%l1		! %l1 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = 000000000000001e, %f18 = 43157c9e fe21c880
	ldda	[%i4+%o4]0x89,%f18	! %f18 = 00000000 0000001e

p0_label_107:
!	Mem[0000000010141410] = 34030000, %l6 = 0000000000000334
	lduha	[%i5+%o5]0x88,%l6	! %l6 = 0000000000000000
!	Mem[00000000300c1410] = 796694bc00000000, %l7 = 0000000000000000
	ldxa	[%i3+%o5]0x89,%l7	! %l7 = 796694bc00000000
!	Mem[0000000030081400] = 62b89c56, %l6 = 0000000000000000
	lduha	[%i2+%g0]0x89,%l6	! %l6 = 0000000000009c56
!	Mem[0000000030101408] = 1e00000000000000, %l0 = 00000000000000ff
	ldxa	[%i4+%o4]0x81,%l0	! %l0 = 1e00000000000000
!	Mem[0000000030181410] = 0334634c, %l4 = 00000000ff6334a3
	lduha	[%i6+%o5]0x81,%l4	! %l4 = 0000000000000334
!	Mem[0000000030041410] = 00baffdb db72f184, %l2 = ff6334a3, %l3 = 0000001e
	ldda	[%i1+%o5]0x81,%l2	! %l2 = 0000000000baffdb 00000000db72f184
!	Mem[0000000030081400] = 62b89c56, %f31 = 4c6334a3
	lda	[%i2+%g0]0x89,%f31	! %f31 = 62b89c56
!	Mem[0000000030181400] = 00000000 00000000, %l0 = 00000000, %l1 = 000000ff
	ldda	[%i6+%g0]0x81,%l0	! %l0 = 0000000000000000 0000000000000000
!	Mem[00000000300c1408] = d01e03ff, %l1 = 0000000000000000
	lduha	[%i3+%o4]0x89,%l1	! %l1 = 00000000000003ff
!	Starting 10 instruction Store Burst
!	%f20 = 94bcd52a 3778ff57, Mem[0000000010141410] = 34030000 00000000
	stda	%f20,[%i5+%o5]0x88	! Mem[0000000010141410] = 94bcd52a 3778ff57

p0_label_108:
!	%l0 = 00000000, %l1 = 000003ff, Mem[0000000010101418] = 1560aefe a156caa9
	stda	%l0,[%i4+0x018]%asi	! Mem[0000000010101418] = 00000000 000003ff
!	Mem[0000000010141410] = 57ff7837, %l7 = 796694bc00000000
	swapa	[%i5+%o5]0x80,%l7	! %l7 = 0000000057ff7837
!	%l0 = 0000000000000000, Mem[00000000300c1408] = d01e03ff
	stwa	%l0,[%i3+%o4]0x89	! Mem[00000000300c1408] = 00000000
!	%l1 = 00000000000003ff, Mem[0000000010001414] = 9f22251e
	stb	%l1,[%i0+0x014]		! Mem[0000000010001414] = ff22251e
!	%l4 = 0000000000000334, Mem[0000000030001410] = 03340000
	stwa	%l4,[%i0+%o5]0x81	! Mem[0000000030001410] = 00000334
!	%l5 = 0000000000000000, Mem[0000000010041416] = 4c6334a3, %asi = 80
	stha	%l5,[%i1+0x016]%asi	! Mem[0000000010041414] = 4c630000
!	Mem[0000000010101404] = 60b136e4, %l4 = 0000000000000334, %asi = 80
	swapa	[%i4+0x004]%asi,%l4	! %l4 = 0000000060b136e4
!	Mem[0000000030101408] = 1e000000, %l5 = 0000000000000000
	swapa	[%i4+%o4]0x81,%l5	! %l5 = 000000001e000000
!	%l3 = 00000000db72f184, Mem[0000000030181408] = ffffff92
	stwa	%l3,[%i6+%o4]0x81	! Mem[0000000030181408] = db72f184
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = 84f172db 03340000, %l4 = 60b136e4, %l5 = 1e000000
	ldda	[%i6+%g0]0x88,%l4	! %l4 = 0000000003340000 0000000084f172db

p0_label_109:
!	Mem[0000000010081408] = e437566a, %l0 = 0000000000000000
	ldsba	[%i2+%o4]0x88,%l0	! %l0 = 000000000000006a
!	Mem[0000000010101408] = 6a5637e4 1560aefe, %l4 = 03340000, %l5 = 84f172db
	ldda	[%i4+%o4]0x88,%l4	! %l4 = 000000001560aefe 000000006a5637e4
!	Mem[0000000010081400] = e436b160, %f13 = 34030000
	lda	[%i2+%g0]0x80,%f13	! %f13 = e436b160
!	Mem[0000000010141410] = 00000000, %l3 = 00000000db72f184
	ldswa	[%i5+%o5]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000030001408] = 00250a6d, %l1 = 00000000000003ff
	ldswa	[%i0+%o4]0x81,%l1	! %l1 = 0000000000250a6d
!	Mem[0000000010181400] = 03340000, %l7 = 0000000057ff7837
	lduha	[%i6+%g0]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000010081400] = 70aa6934 60b136e4, %l0 = 0000006a, %l1 = 00250a6d
	ldda	[%i2+%g0]0x88,%l0	! %l0 = 0000000060b136e4 0000000070aa6934
!	Mem[0000000010041430] = 187f66a6, %l3 = 0000000000000000
	ldsha	[%i1+0x030]%asi,%l3	! %l3 = 000000000000187f
!	Mem[0000000030001410] = 0000033400000000, %l5 = 000000006a5637e4
	ldxa	[%i0+%o5]0x81,%l5	! %l5 = 0000033400000000
!	Starting 10 instruction Store Burst
!	%f30 = 000000ff 62b89c56, Mem[0000000010001408] = a30000e3 c38122ff
	std	%f30,[%i0+%o4]	! Mem[0000000010001408] = 000000ff 62b89c56

p0_label_110:
!	%l2 = 00baffdb, %l3 = 0000187f, Mem[0000000030181410] = 0334634c 2ad5bc94
	stda	%l2,[%i6+%o5]0x81	! Mem[0000000030181410] = 00baffdb 0000187f
!	%f20 = 94bcd52a 3778ff57, %l7 = 0000000000000000
!	Mem[0000000030001420] = ffc5215734000032
	add	%i0,0x020,%g1
	stda	%f20,[%g1+%l7]ASI_PST8_S ! Mem[0000000030001420] = ffc5215734000032
!	%l1 = 0000000070aa6934, Mem[00000000100c1410] = f5180000047e2ea5
	stxa	%l1,[%i3+%o5]0x80	! Mem[00000000100c1410] = 0000000070aa6934
!	Mem[0000000030081410] = 0000f184, %l2 = 0000000000baffdb
	ldstuba	[%i2+%o5]0x81,%l2	! %l2 = 00000000000000ff
!	%l7 = 0000000000000000, Mem[0000000030141410] = 29000034
	stha	%l7,[%i5+%o5]0x81	! Mem[0000000030141410] = 00000034
!	%l3 = 000000000000187f, Mem[00000000100c1400] = 99507837
	stba	%l3,[%i3+%g0]0x80	! Mem[00000000100c1400] = 7f507837
!	%l7 = 0000000000000000, Mem[0000000010101410] = 30d86fba
	stwa	%l7,[%i4+%o5]0x88	! Mem[0000000010101410] = 00000000
!	%l7 = 0000000000000000, Mem[0000000010081430] = 0000634c
	stw	%l7,[%i2+0x030]		! Mem[0000000010081430] = 00000000
!	%f20 = 94bcd52a, Mem[0000000010181428] = 00000000
	sta	%f20,[%i6+0x028]%asi	! Mem[0000000010181428] = 94bcd52a
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = 6f13569c, %l0 = 0000000060b136e4
	ldsba	[%i5+%g0]0x88,%l0	! %l0 = ffffffffffffff9c

p0_label_111:
!	Mem[0000000030181408] = db72f1849e7c1543, %f20 = 94bcd52a 3778ff57
	ldda	[%i6+%o4]0x81,%f20	! %f20 = db72f184 9e7c1543
!	Mem[00000000300c1410] = 796694bc00000000, %l1 = 0000000070aa6934
	ldxa	[%i3+%o5]0x89,%l1	! %l1 = 796694bc00000000
!	Mem[0000000021800080] = 18f59b02, %l4 = 000000001560aefe
	ldub	[%o3+0x080],%l4		! %l4 = 0000000000000018
!	Mem[0000000030101410] = 47ee08bd, %l5 = 0000033400000000
	ldsha	[%i4+%o5]0x89,%l5	! %l5 = 00000000000008bd
!	Mem[0000000030041410] = 00baffdb, %l4 = 0000000000000018
	lduwa	[%i1+%o5]0x81,%l4	! %l4 = 0000000000baffdb
!	Mem[0000000010081408] = 6a5637e419dd1ed0, %l5 = 00000000000008bd
	ldxa	[%i2+%o4]0x80,%l5	! %l5 = 6a5637e419dd1ed0
!	Mem[0000000030001400] = 03002157c38122ff, %f18 = 00000000 0000001e
	ldda	[%i0+%g0]0x81,%f18	! %f18 = 03002157 c38122ff
!	Mem[00000000300c1410] = 00000000, %l0 = ffffffffffffff9c
	ldswa	[%i3+%o5]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000030101408] = 00000000, %l7 = 0000000000000000
	swapa	[%i4+%o4]0x89,%l7	! %l7 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[000000001014143c] = 9f22251e, %l5 = 6a5637e419dd1ed0
	swap	[%i5+0x03c],%l5		! %l5 = 000000009f22251e

p0_label_112:
!	%l4 = 0000000000baffdb, Mem[0000000030101410] = bd08ee47
	stba	%l4,[%i4+%o5]0x81	! Mem[0000000030101410] = db08ee47
!	%f12 = 84f172db e436b160, %l7 = 0000000000000000
!	Mem[0000000030101400] = ff92ffff81496026
	stda	%f12,[%i4+%l7]ASI_PST16_SL ! Mem[0000000030101400] = ff92ffff81496026
!	%l5 = 000000009f22251e, Mem[0000000030101410] = 47ee08db
	stha	%l5,[%i4+%o5]0x89	! Mem[0000000030101410] = 47ee251e
!	%l0 = 0000000000000000, Mem[0000000010081408] = 6a5637e4
	stw	%l0,[%i2+%o4]		! Mem[0000000010081408] = 00000000
!	%l1 = 796694bc00000000, Mem[0000000030141410] = 000000345721c5ff
	stxa	%l1,[%i5+%o5]0x81	! Mem[0000000030141410] = 796694bc00000000
!	%l2 = 00000000, %l3 = 0000187f, Mem[0000000030001408] = 6d0a2500 a334634c
	stda	%l2,[%i0+%o4]0x89	! Mem[0000000030001408] = 00000000 0000187f
!	%l2 = 0000000000000000, Mem[0000000030081408] = 91ffffff
	stwa	%l2,[%i2+%o4]0x81	! Mem[0000000030081408] = 00000000
!	%f16 = 00000000 00000000, Mem[0000000030101408] = 00000000 00000000
	stda	%f16,[%i4+%o4]0x89	! Mem[0000000030101408] = 00000000 00000000
!	%l3 = 000000000000187f, Mem[0000000010001408] = ff000000
	stba	%l3,[%i0+%o4]0x88	! Mem[0000000010001408] = ff00007f
!	Starting 10 instruction Load Burst
!	Mem[00000000100c140c] = 0000d037, %l4 = 0000000000baffdb
	ldsh	[%i3+0x00e],%l4		! %l4 = ffffffffffffd037

p0_label_113:
!	Mem[0000000030181400] = 0000000000000000, %f30 = 000000ff 62b89c56
	ldda	[%i6+%g0]0x81,%f30	! %f30 = 00000000 00000000
!	Mem[0000000010001410] = ff000000 ff22251e, %l0 = 00000000, %l1 = 00000000
	ldda	[%i0+%o5]0x80,%l0	! %l0 = 00000000ff000000 00000000ff22251e
!	Mem[0000000030001408] = 000000007f180000, %f14 = 000018f5 e70000ff
	ldda	[%i0+%o4]0x81,%f14	! %f14 = 00000000 7f180000
!	Mem[00000000300c1408] = 00000000f66d47e8, %l2 = 0000000000000000
	ldxa	[%i3+%o4]0x81,%l2	! %l2 = 00000000f66d47e8
!	Mem[0000000010141410] = 00000000, %l1 = 00000000ff22251e
	lduha	[%i5+%o5]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010081430] = 00000000, %l3 = 000000000000187f
	ldsh	[%i2+0x032],%l3		! %l3 = 0000000000000000
!	Mem[0000000030001408] = 00000000, %l4 = ffffffffffffd037
	lduba	[%i0+%o4]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000010041400] = ba6fd830, %l2 = 00000000f66d47e8
	lduha	[%i1+%g0]0x80,%l2	! %l2 = 000000000000ba6f
!	Mem[0000000010041408] = 2ad5bc94, %l6 = 0000000000009c56
	ldsha	[%i1+%o4]0x88,%l6	! %l6 = ffffffffffffbc94
!	Starting 10 instruction Store Burst
!	Mem[0000000010141400] = 9c56136f, %l4 = 0000000000000000
	ldstuba	[%i5+%g0]0x80,%l4	! %l4 = 0000009c000000ff

p0_label_114:
!	%l2 = 000000000000ba6f, Mem[0000000010141410] = 000000002ad5bc94
	stxa	%l2,[%i5+%o5]0x80	! Mem[0000000010141410] = 000000000000ba6f
!	Mem[00000000100c140c] = 0000d037, %l5 = 000000009f22251e
	ldstub	[%i3+0x00c],%l5		! %l5 = 00000000000000ff
!	Mem[0000000030041408] = 4c633403, %l0 = 00000000ff000000
	ldstuba	[%i1+%o4]0x89,%l0	! %l0 = 00000003000000ff
!	%l0 = 0000000000000003, imm = 0000000000000047, %l3 = 0000000000000000
	xor	%l0,0x047,%l3		! %l3 = 0000000000000044
!	Mem[0000000030141408] = 57000000, %l1 = 0000000000000000
	ldstuba	[%i5+%o4]0x89,%l1	! %l1 = 00000000000000ff
!	%f0  = 37c3a13c c38122ff, %l2 = 000000000000ba6f
!	Mem[0000000010081420] = a52e7e0434697300
	add	%i2,0x020,%g1
	stda	%f0,[%g1+%l2]ASI_PST8_PL ! Mem[0000000010081420] = ff2281c334a1c300
!	%f16 = 00000000 00000000, Mem[0000000010101420] = 549300ff 94a86dd3
	std	%f16,[%i4+0x020]	! Mem[0000000010101420] = 00000000 00000000
!	Mem[0000000010101410] = 00000000, %l4 = 000000000000009c
	ldstuba	[%i4+%o5]0x80,%l4	! %l4 = 00000000000000ff
!	%f6  = 2ad5bc94 7abbfe4d, %l4 = 0000000000000000
!	Mem[0000000010081420] = ff2281c334a1c300
	add	%i2,0x020,%g1
	stda	%f6,[%g1+%l4]ASI_PST8_P ! Mem[0000000010081420] = ff2281c334a1c300
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = 00003403 db72f184, %l6 = ffffbc94, %l7 = 00000000
	ldda	[%i6+%g0]0x80,%l6	! %l6 = 0000000000003403 00000000db72f184

p0_label_115:
!	Mem[0000000010181408] = 00736934, %l3 = 0000000000000044
	ldsha	[%i6+%o4]0x80,%l3	! %l3 = 0000000000000073
!	Mem[0000000010041400] = 30d86fba, %l6 = 0000000000003403
	ldsha	[%i1+%g0]0x88,%l6	! %l6 = 0000000000006fba
!	Mem[0000000010041410] = 0000ffff4c630000, %l3 = 0000000000000073
	ldxa	[%i1+%o5]0x80,%l3	! %l3 = 0000ffff4c630000
!	Mem[0000000030101408] = 00000000, %l1 = 0000000000000000
	ldsha	[%i4+%o4]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000030001408] = 0000187f00000000, %l3 = 0000ffff4c630000
	ldxa	[%i0+%o4]0x89,%l3	! %l3 = 0000187f00000000
!	Mem[0000000030141408] = ff000057, %l2 = 000000000000ba6f
	lduwa	[%i5+%o4]0x81,%l2	! %l2 = 00000000ff000057
!	Mem[0000000030001410] = 34030000, %l0 = 0000000000000003
	ldswa	[%i0+%o5]0x89,%l0	! %l0 = 0000000034030000
!	Mem[0000000030141400] = ffffaefe, %l5 = 0000000000000000
	lduba	[%i5+%g0]0x81,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010141410] = 00000000, %l4 = 0000000000000000
	lduha	[%i5+%o5]0x80,%l4	! %l4 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f12 = 84f172db e436b160, %l1 = 0000000000000000
!	Mem[0000000010101420] = 0000000000000000
	add	%i4,0x020,%g1
	stda	%f12,[%g1+%l1]ASI_PST32_PL ! Mem[0000000010101420] = 0000000000000000

p0_label_116:
!	%l1 = 0000000000000000, Mem[00000000100c1410] = 0000000070aa6934
	stxa	%l1,[%i3+%o5]0x80	! Mem[00000000100c1410] = 0000000000000000
!	%l0 = 0000000034030000, Mem[00000000100c1420] = a52e7e0402c076f0
	stx	%l0,[%i3+0x020]		! Mem[00000000100c1420] = 0000000034030000
!	%l0 = 0000000034030000, Mem[0000000010141408] = 0334634c
	stwa	%l0,[%i5+%o4]0x80	! Mem[0000000010141408] = 34030000
!	%l0 = 0000000034030000, Mem[0000000010181408] = 0073693460b136e4
	stxa	%l0,[%i6+%o4]0x80	! Mem[0000000010181408] = 0000000034030000
!	Mem[0000000030081400] = 62b89c56, %l1 = 0000000000000000
	ldstuba	[%i2+%g0]0x89,%l1	! %l1 = 00000056000000ff
!	%l6 = 0000000000006fba, Mem[0000000010101400] = 3778ff57
	stwa	%l6,[%i4+%g0]0x80	! Mem[0000000010101400] = 00006fba
!	%l0 = 0000000034030000, Mem[0000000010001430] = 00000057
	stw	%l0,[%i0+0x030]		! Mem[0000000010001430] = 34030000
!	%l6 = 00006fba, %l7 = db72f184, Mem[0000000010101408] = feae6015 e437566a
	std	%l6,[%i4+%o4]		! Mem[0000000010101408] = 00006fba db72f184
!	Mem[0000000010141404] = 606cfca9, %l1 = 00000056, %l1 = 00000056
	add	%i5,0x04,%g1
	casa	[%g1]0x80,%l1,%l1	! %l1 = 00000000606cfca9
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = 00ff01ce, %l6 = 0000000000006fba
	ldsb	[%o0+0x001],%l6		! %l6 = ffffffffffffffff

p0_label_117:
!	Mem[0000000010001410] = ff000000, %l2 = 00000000ff000057
	lduha	[%i0+%o5]0x80,%l2	! %l2 = 000000000000ff00
!	Mem[0000000030001400] = 57210003, %l0 = 0000000034030000
	lduha	[%i0+%g0]0x89,%l0	! %l0 = 0000000000000003
!	Mem[0000000030001408] = 00000000, %l5 = 00000000000000ff
	ldsba	[%i0+%o4]0x81,%l5	! %l5 = 0000000000000000
!	Mem[00000000100c1414] = 00000000, %l2 = 000000000000ff00
	lduha	[%i3+0x016]%asi,%l2	! %l2 = 0000000000000000
!	Code Fragment 4
p0_fragment_9:
!	%l0 = 0000000000000003
	setx	0xba83afb03c0399a0,%g7,%l0 ! %l0 = ba83afb03c0399a0
!	%l1 = 00000000606cfca9
	setx	0x03fd6b90149604b4,%g7,%l1 ! %l1 = 03fd6b90149604b4
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = ba83afb03c0399a0
	setx	0x0bac92fff9707b6f,%g7,%l0 ! %l0 = 0bac92fff9707b6f
!	%l1 = 03fd6b90149604b4
	setx	0x94da8d4fa1813dba,%g7,%l1 ! %l1 = 94da8d4fa1813dba
!	Mem[0000000030081408] = 4c6334a3 00000000, %l4 = 00000000, %l5 = 00000000
	ldda	[%i2+%o4]0x89,%l4	! %l4 = 0000000000000000 000000004c6334a3
!	Mem[000000001004141c] = 0d916d64, %l2 = 0000000000000000
	lduha	[%i1+0x01c]%asi,%l2	! %l2 = 0000000000000d91
!	Mem[0000000030081410] = ff00f184 70b4b1fd, %l4 = 00000000, %l5 = 4c6334a3
	ldda	[%i2+%o5]0x81,%l4	! %l4 = 00000000ff00f184 0000000070b4b1fd
!	Mem[0000000030041410] = dbffba00, %l4 = 00000000ff00f184
	lduba	[%i1+%o5]0x89,%l4	! %l4 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l5 = 0000000070b4b1fd, Mem[00000000300c1400] = a334634c6d0a2500
	stxa	%l5,[%i3+%g0]0x89	! Mem[00000000300c1400] = 0000000070b4b1fd

p0_label_118:
!	%f24 = 00736934 047e2ea5, Mem[0000000010041400] = 30d86fba 00000000
	stda	%f24,[%i1+%g0]0x88	! Mem[0000000010041400] = 00736934 047e2ea5
!	Mem[0000000010081400] = 60b136e4, %l1 = 94da8d4fa1813dba
	swapa	[%i2+%g0]0x88,%l1	! %l1 = 0000000060b136e4
!	%l0 = 0bac92fff9707b6f, imm = fffffffffffff14b, %l6 = ffffffffffffffff
	or	%l0,-0xeb5,%l6		! %l6 = fffffffffffffb6f
!	Mem[0000000010041414] = 4c630000, %l3 = 0000187f00000000, %asi = 80
	swapa	[%i1+0x014]%asi,%l3	! %l3 = 000000004c630000
!	%l7 = 00000000db72f184, Mem[00000000211c0000] = ffffe5a1, %asi = 80
	stha	%l7,[%o2+0x000]%asi	! Mem[00000000211c0000] = f184e5a1
!	Mem[00000000211c0000] = f184e5a1, %l6 = fffffffffffffb6f
	ldsha	[%o2+0x000]%asi,%l6	! %l6 = fffffffffffff184
!	Mem[0000000010001400] = a33463ff, %l6 = fffffffffffff184
	ldstuba	[%i0+%g0]0x88,%l6	! %l6 = 000000ff000000ff
!	%f16 = 00000000 00000000 03002157 c38122ff
!	%f20 = db72f184 9e7c1543 a9fc6c60 6f13569c
!	%f24 = 00736934 047e2ea5 29eaa2e2 047e2ea5
!	%f28 = 088d03d2 000000e3 00000000 00000000
	stda	%f16,[%i4]ASI_BLK_AIUP	! Block Store to 0000000010101400
!	Mem[0000000010041408] = 2ad5bc94, %l4 = 0000000000000000
	ldstuba	[%i1+%o4]0x88,%l4	! %l4 = 00000094000000ff
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (14)
!	Mem[0000000010101410] = 84f172db, %l2 = 0000000000000d91
	ldsha	[%i4+%o5]0x88,%l2	! %l2 = 00000000000072db

p0_label_119:
!	Mem[0000000010141410] = 00000000 0000ba6f, %l4 = 00000094, %l5 = 70b4b1fd
	ldda	[%i5+0x010]%asi,%l4	! %l4 = 0000000000000000 000000000000ba6f
!	Mem[0000000010141408] = 34030000, %l2 = 00000000000072db
	lduba	[%i5+%o4]0x80,%l2	! %l2 = 0000000000000034
!	Mem[0000000030041408] = 4c6334ff, %l2 = 0000000000000034
	lduba	[%i1+%o4]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010141410] = 6fba0000 00000000, %l0 = f9707b6f, %l1 = 60b136e4
	ldda	[%i5+%o5]0x88,%l0	! %l0 = 0000000000000000 000000006fba0000
!	%l6 = 00000000000000ff, Mem[0000000010181408] = 00000000
	stha	%l6,[%i6+%o4]0x80	! Mem[0000000010181408] = 00ff0000
!	Mem[0000000010181410] = b2462162, %l0 = 0000000000000000
	lduba	[%i6+%o5]0x88,%l0	! %l0 = 0000000000000062
!	Mem[0000000020800000] = ffffe062, %l7 = 00000000db72f184
	ldsba	[%o1+0x001]%asi,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010001410] = ff000000ff22251e, %l6 = 00000000000000ff
	ldxa	[%i0+%o5]0x80,%l6	! %l6 = ff000000ff22251e
!	Mem[000000001018143c] = 047e2ea5, %l6 = ff000000ff22251e
	ldsha	[%i6+0x03c]%asi,%l6	! %l6 = 000000000000047e
!	Starting 10 instruction Store Burst
!	%l6 = 000000000000047e, Mem[0000000030101400] = ffff92ff
	stha	%l6,[%i4+%g0]0x89	! Mem[0000000030101400] = ffff047e

p0_label_120:
!	%l1 = 000000006fba0000, %l7 = ffffffffffffffff, %l3 = 000000004c630000
	or	%l1,%l7,%l3		! %l3 = ffffffffffffffff
!	%l1 = 000000006fba0000, Mem[0000000010101408] = 03002157
	stwa	%l1,[%i4+%o4]0x80	! Mem[0000000010101408] = 6fba0000
!	%l6 = 000000000000047e, Mem[0000000030001408] = 00000000
	stba	%l6,[%i0+%o4]0x81	! Mem[0000000030001408] = 7e000000
!	%l0 = 00000062, %l1 = 6fba0000, Mem[0000000010001400] = a33463ff ca596330
	stda	%l0,[%i0+%g0]0x88	! Mem[0000000010001400] = 00000062 6fba0000
!	%l4 = 0000000000000000, Mem[0000000010001430] = 34030000bc946679
	stx	%l4,[%i0+0x030]		! Mem[0000000010001430] = 0000000000000000
!	Mem[0000000030181410] = 00baffdb, %l3 = ffffffffffffffff
	swapa	[%i6+%o5]0x81,%l3	! %l3 = 0000000000baffdb
!	Mem[0000000030041408] = 4c6334ff, %l0 = 0000000000000062
	ldstuba	[%i1+%o4]0x89,%l0	! %l0 = 000000ff000000ff
!	Mem[00000000100c1410] = 00000000, %l4 = 0000000000000000
	swapa	[%i3+%o5]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000010181410] = 622146b2, %l3 = 0000000000baffdb
	swapa	[%i6+%o5]0x80,%l3	! %l3 = 00000000622146b2
!	Starting 10 instruction Load Burst
!	Mem[0000000010081424] = 34a1c300, %l2 = 00000000000000ff
	lduha	[%i2+0x024]%asi,%l2	! %l2 = 00000000000034a1

p0_label_121:
!	Mem[0000000010181410] = dbffba00, %l2 = 00000000000034a1
	lduba	[%i6+%o5]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000010101408] = 0000ba6f, %l4 = 0000000000000000
	lduba	[%i4+%o4]0x88,%l4	! %l4 = 000000000000006f
!	Mem[0000000010041410] = 0000ffff 00000000, %l6 = 0000047e, %l7 = ffffffff
	ldda	[%i1+%o5]0x80,%l6	! %l6 = 000000000000ffff 0000000000000000
!	Mem[0000000010001410] = 000000ff, %l7 = 0000000000000000
	lduwa	[%i0+%o5]0x88,%l7	! %l7 = 00000000000000ff
!	%l7 = 00000000000000ff, %l2 = 0000000000000000, %y  = 000000ff
	smul	%l7,%l2,%l5		! %l5 = 0000000000000000, %y = 00000000
!	%l4 = 000000000000006f, immed = fffff728, %y  = 00000000
	sdiv	%l4,-0x8d8,%l5		! %l5 = 0000000000000000
	mov	%l0,%y			! %y = 000000ff
!	Code Fragment 3
p0_fragment_10:
!	%l0 = 00000000000000ff
	setx	0x9e5ece0783f58266,%g7,%l0 ! %l0 = 9e5ece0783f58266
!	%l1 = 000000006fba0000
	setx	0x103bddbfc86511b8,%g7,%l1 ! %l1 = 103bddbfc86511b8
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 9e5ece0783f58266
	setx	0xfbcfc1df951dd4bf,%g7,%l0 ! %l0 = fbcfc1df951dd4bf
!	%l1 = 103bddbfc86511b8
	setx	0x5cb295906dab71bf,%g7,%l1 ! %l1 = 5cb295906dab71bf
!	Mem[00000000100c1410] = 00000000, %f24 = 00736934
	lda	[%i3+%o5]0x80,%f24	! %f24 = 00000000
!	Mem[0000000010001430] = 0000000000000000, %f8  = ffc52157 34000032
	ldd	[%i0+0x030],%f8 	! %f8  = 00000000 00000000
!	Starting 10 instruction Store Burst
!	%f2  = 00250a6d, Mem[0000000010181410] = 00baffdb
	sta	%f2 ,[%i6+%o5]0x80	! Mem[0000000010181410] = 00250a6d

p0_label_122:
!	%l4 = 000000000000006f, Mem[0000000010001403] = 62000000
	stb	%l4,[%i0+0x003]		! Mem[0000000010001400] = 6200006f
!	%l2 = 0000000000000000, Mem[0000000030041410] = dbffba00
	stha	%l2,[%i1+%o5]0x89	! Mem[0000000030041410] = dbff0000
!	Mem[0000000010001420] = d2038d08, %l5 = 0000000000000000
	swap	[%i0+0x020],%l5		! %l5 = 00000000d2038d08
!	%l4 = 000000000000006f, Mem[0000000030001410] = 34030000
	stha	%l4,[%i0+%o5]0x89	! Mem[0000000030001410] = 3403006f
!	Code Fragment 3
p0_fragment_11:
!	%l0 = fbcfc1df951dd4bf
	setx	0x835a30b07c19a802,%g7,%l0 ! %l0 = 835a30b07c19a802
!	%l1 = 5cb295906dab71bf
	setx	0x9c8697a7b08ddb65,%g7,%l1 ! %l1 = 9c8697a7b08ddb65
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 835a30b07c19a802
	setx	0x6b9e22781f00c5ab,%g7,%l0 ! %l0 = 6b9e22781f00c5ab
!	%l1 = 9c8697a7b08ddb65
	setx	0x2a9bf16790593258,%g7,%l1 ! %l1 = 2a9bf16790593258
!	%l1 = 2a9bf16790593258, Mem[000000001004142e] = c4a0d095, %asi = 80
	stba	%l1,[%i1+0x02e]%asi	! Mem[000000001004142c] = c4a05895
!	%l7 = 00000000000000ff, Mem[0000000010181408] = 00ff000034030000
	stxa	%l7,[%i6+%o4]0x80	! Mem[0000000010181408] = 00000000000000ff
!	%l0 = 6b9e22781f00c5ab, Mem[0000000030081408] = 00000000
	stwa	%l0,[%i2+%o4]0x81	! Mem[0000000030081408] = 1f00c5ab
!	Mem[0000000030001400] = 03002157, %l7 = 00000000000000ff
	swapa	[%i0+%g0]0x81,%l7	! %l7 = 0000000003002157
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = 00ff01ce, %l3 = 00000000622146b2
	ldsh	[%o0+%g0],%l3		! %l3 = 00000000000000ff

p0_label_123:
!	Mem[0000000010141400] = a9fc6c606f1356ff, %f20 = db72f184 9e7c1543
	ldda	[%i5+%g0]0x88,%f20	! %f20 = a9fc6c60 6f1356ff
!	%l4 = 000000000000006f, %l0 = 6b9e22781f00c5ab, %l3 = 00000000000000ff
	and	%l4,%l0,%l3		! %l3 = 000000000000002b
!	Mem[0000000010141424] = 1697ffc7, %l0 = 6b9e22781f00c5ab
	lduha	[%i5+0x026]%asi,%l0	! %l0 = 000000000000ffc7
!	Mem[0000000010081420] = ff2281c334a1c300, %l5 = 00000000d2038d08
	ldx	[%i2+0x020],%l5		! %l5 = ff2281c334a1c300
!	Mem[0000000030041410] = dbff0000, %l3 = 000000000000002b
	lduba	[%i1+%o5]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000010141408] = 34030000 2ad5bc94, %l2 = 00000000, %l3 = 00000000
	ldda	[%i5+%o4]0x80,%l2	! %l2 = 0000000034030000 000000002ad5bc94
!	Mem[0000000010001420] = 00000000, %l7 = 0000000003002157
	lduwa	[%i0+0x020]%asi,%l7	! %l7 = 0000000000000000
!	Mem[0000000010181400] = 00003403, %l3 = 000000002ad5bc94
	ldsha	[%i6+0x000]%asi,%l3	! %l3 = 0000000000000000
!	Mem[0000000020800040] = 2a1ef99a, %l5 = ff2281c334a1c300
	lduh	[%o1+0x040],%l5		! %l5 = 0000000000002a1e
!	Starting 10 instruction Store Burst
!	Mem[0000000010081428] = 99507837e284ea29, %l2 = 0000000034030000, %l4 = 000000000000006f
	add	%i2,0x28,%g1
	casxa	[%g1]0x80,%l2,%l4	! %l4 = 99507837e284ea29

p0_label_124:
!	%f6  = 2ad5bc94 7abbfe4d, %l6 = 000000000000ffff
!	Mem[0000000010081428] = 99507837e284ea29
	add	%i2,0x028,%g1
	stda	%f6,[%g1+%l6]ASI_PST16_PL ! Mem[0000000010081428] = 4dfebb7a94bcd52a
!	Mem[0000000030041408] = ff34634c, %l0 = 000000000000ffc7
	swapa	[%i1+%o4]0x81,%l0	! %l0 = 00000000ff34634c
!	Mem[0000000030181410] = ffffffff, %l0 = 00000000ff34634c
	swapa	[%i6+%o5]0x89,%l0	! %l0 = 00000000ffffffff
!	%l0 = 00000000ffffffff, Mem[0000000030141410] = 796694bc
	stwa	%l0,[%i5+%o5]0x81	! Mem[0000000030141410] = ffffffff
!	%f18 = 03002157 c38122ff, Mem[0000000010141400] = 6f1356ff a9fc6c60
	stda	%f18,[%i5+%g0]0x88	! Mem[0000000010141400] = 03002157 c38122ff
!	Mem[0000000010101426] = 047e2ea5, %l4 = 99507837e284ea29
	ldstuba	[%i4+0x026]%asi,%l4	! %l4 = 0000002e000000ff
!	Mem[0000000010141408] = 34030000, %l4 = 000000000000002e
	swap	[%i5+%o4],%l4		! %l4 = 0000000034030000
!	%f30 = 00000000 00000000, %l4 = 0000000034030000
!	Mem[0000000010141430] = cbf14adb1560aefe
	add	%i5,0x030,%g1
	stda	%f30,[%g1+%l4]ASI_PST16_P ! Mem[0000000010141430] = cbf14adb1560aefe
!	%f6  = 2ad5bc94, Mem[0000000030081400] = 62b89cff
	sta	%f6 ,[%i2+%g0]0x89	! Mem[0000000030081400] = 2ad5bc94
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = 43157c9e84f172db, %f4  = bd08ee47 75f8ffff
	ldda	[%i6+%o4]0x89,%f4 	! %f4  = 43157c9e 84f172db

p0_label_125:
!	%l4 = 0000000034030000, imm = fffffffffffff4e4, %l3 = 0000000000000000
	subc	%l4,-0xb1c,%l3		! %l3 = 0000000034030b1c
!	%f21 = 6f1356ff, %f12 = 84f172db
	fcmps	%fcc0,%f21,%f12		! %fcc0 = 2
!	Mem[0000000030181408] = db72f184, %f23 = 6f13569c
	lda	[%i6+%o4]0x81,%f23	! %f23 = db72f184
!	Mem[0000000010141410] = 00000000, %l1 = 2a9bf16790593258
	lduba	[%i5+%o5]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000030181408] = 84f172db, %l5 = 0000000000002a1e
	ldsba	[%i6+%o4]0x89,%l5	! %l5 = ffffffffffffffdb
!	Mem[0000000030141400] = feaeffff, %l6 = 000000000000ffff
	lduha	[%i5+%g0]0x89,%l6	! %l6 = 000000000000ffff
!	Mem[0000000010041408] = ffbcd52a, %l0 = 00000000ffffffff
	ldsh	[%i1+%o4],%l0		! %l0 = ffffffffffffffbc
!	Mem[0000000010001408] = ff00007f, %l6 = 000000000000ffff
	lduwa	[%i0+%o4]0x88,%l6	! %l6 = 00000000ff00007f
!	%l5 = ffffffffffffffdb, immed = fffffa73, %y  = 000000ff
	umul	%l5,-0x58d,%l2		! %l2 = fffffa4e0000cd61, %y = fffffa4e
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1430] = e8476df6d01edd19, %l5 = ffffffffffffffdb, %l1 = 0000000000000000
	add	%i3,0x30,%g1
	casxa	[%g1]0x80,%l5,%l1	! %l1 = e8476df6d01edd19

p0_label_126:
!	Mem[0000000030041410] = dbff0000, %l6 = 00000000ff00007f
	ldstuba	[%i1+%o5]0x89,%l6	! %l6 = 00000000000000ff
!	%l4 = 34030000, %l5 = ffffffdb, Mem[0000000010141400] = c38122ff 03002157
	stda	%l4,[%i5+%g0]0x88	! Mem[0000000010141400] = 34030000 ffffffdb
!	%l1 = e8476df6d01edd19, Mem[00000000201c0001] = 00ff01ce, %asi = 80
	stba	%l1,[%o0+0x001]%asi	! Mem[00000000201c0000] = 001901ce
!	%l1 = e8476df6d01edd19, Mem[0000000010041400] = 047e2ea5
	stha	%l1,[%i1+%g0]0x88	! Mem[0000000010041400] = 047edd19
!	%f17 = 00000000, Mem[0000000010041424] = 5721c5ff
	sta	%f17,[%i1+0x024]%asi	! Mem[0000000010041424] = 00000000
!	%l0 = ffffffffffffffbc, Mem[0000000021800101] = 34a34e79
	stb	%l0,[%o3+0x101]		! Mem[0000000021800100] = 34bc4e79
!	%l3 = 0000000034030b1c, Mem[00000000218001c1] = ff2cc752
	stb	%l3,[%o3+0x1c1]		! Mem[00000000218001c0] = ff1cc752
!	Mem[0000000010001418] = 00000334, %l7 = 0000000000000000, %asi = 80
	swapa	[%i0+0x018]%asi,%l7	! %l7 = 0000000000000334
!	%f0  = 37c3a13c c38122ff, %l1 = e8476df6d01edd19
!	Mem[0000000030181408] = db72f1849e7c1543
	add	%i6,0x008,%g1
	stda	%f0,[%g1+%l1]ASI_PST32_SL ! Mem[0000000030181408] = ff2281c39e7c1543
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = 00003403, %l1 = e8476df6d01edd19
	ldsha	[%i6+%g0]0x80,%l1	! %l1 = 0000000000000000

p0_label_127:
!	%l6 = 0000000000000000, %l2 = fffffa4e0000cd61, %l5 = ffffffffffffffdb
	xor	%l6,%l2,%l5		! %l5 = fffffa4e0000cd61
!	Mem[0000000010081410] = 29ea84e2, %l7 = 0000000000000334
	lduba	[%i2+%o5]0x80,%l7	! %l7 = 0000000000000029
!	Mem[0000000010081408] = 00000000, %l4 = 0000000034030000
	lduha	[%i2+0x008]%asi,%l4	! %l4 = 0000000000000000
	membar	#Sync			! Added by membar checker (15)
!	Mem[0000000010041400] = 19dd7e04 34697300 ffbcd52a 4c633403
!	Mem[0000000010041410] = 0000ffff 00000000 4dfebb7a 0d916d64
!	Mem[0000000010041420] = 4c6334a3 00000000 ff91d06b c4a05895
!	Mem[0000000010041430] = 187f66a6 57000000 ff0000e7 b24621fd
	ldda	[%i1]ASI_BLK_PL,%f16	! Block Load from 0000000010041400
!	Mem[00000000100c1408] = 37d000ff000025ff, %l4 = 0000000000000000
	ldxa	[%i3+%o4]0x88,%l4	! %l4 = 37d000ff000025ff
!	Mem[00000000300c1400] = 70b4b1fd, %l6 = 0000000000000000
	lduba	[%i3+%g0]0x89,%l6	! %l6 = 00000000000000fd
!	Mem[0000000030141410] = ffffffff00000000, %f4  = 43157c9e 84f172db
	ldda	[%i5+%o5]0x81,%f4 	! %f4  = ffffffff 00000000
!	Mem[0000000030141410] = ffffffff, %l1 = 0000000000000000
	lduwa	[%i5+%o5]0x89,%l1	! %l1 = 00000000ffffffff
!	Mem[0000000010101438] = 0000000000000000, %f6  = 2ad5bc94 7abbfe4d
	ldda	[%i4+0x038]%asi,%f6 	! %f6  = 00000000 00000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010141410] = 00000000, %l3 = 0000000034030b1c
	swapa	[%i5+%o5]0x88,%l3	! %l3 = 0000000000000000

p0_label_128:
!	%l7 = 0000000000000029, Mem[0000000010081408] = 0000000019dd1ed0
	stxa	%l7,[%i2+%o4]0x80	! Mem[0000000010081408] = 0000000000000029
!	%l0 = ffffffffffffffbc, Mem[0000000010001410] = 1e2522ff000000ff
	stxa	%l0,[%i0+%o5]0x88	! Mem[0000000010001410] = ffffffffffffffbc
!	%l4 = 37d000ff000025ff, Mem[0000000030101400] = ffff047e
	stha	%l4,[%i4+%g0]0x89	! Mem[0000000030101400] = ffff25ff
!	%f12 = 84f172db e436b160, Mem[0000000030181400] = 00000000 00000000
	stda	%f12,[%i6+%g0]0x81	! Mem[0000000030181400] = 84f172db e436b160
!	%l4 = 37d000ff000025ff, Mem[0000000030141400] = ffffaefe
	stha	%l4,[%i5+%g0]0x81	! Mem[0000000030141400] = 25ffaefe
!	Mem[0000000010001408] = 7f0000ff, %l6 = 00000000000000fd
	ldstuba	[%i0+%o4]0x80,%l6	! %l6 = 0000007f000000ff
!	%l7 = 0000000000000029, Mem[0000000030041410] = 84f172dbdbff00ff
	stxa	%l7,[%i1+%o5]0x89	! Mem[0000000030041410] = 0000000000000029
!	Mem[0000000010081408] = 00000000, %l1 = ffffffff, %l4 = 000025ff
	add	%i2,0x08,%g1
	casa	[%g1]0x80,%l1,%l4	! %l4 = 0000000000000000
!	%l3 = 0000000000000000, Mem[00000000300c1400] = 70b4b1fd
	stba	%l3,[%i3+%g0]0x89	! Mem[00000000300c1400] = 70b4b100
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = ff00000000000000, %f2  = 00250a6d 4c6334a3
	ldda	[%i6+%o4]0x88,%f2 	! %f2  = ff000000 00000000

p0_label_129:
!	Mem[0000000030041400] = a334634c, %l0 = ffffffffffffffbc
	ldswa	[%i1+%g0]0x81,%l0	! %l0 = ffffffffa334634c
!	Mem[0000000010141420] = ae9a2bfc, %l7 = 0000000000000029
	ldub	[%i5+0x022],%l7		! %l7 = 000000000000002b
!	Mem[0000000010041410] = 00000000ffff0000, %l0 = ffffffffa334634c
	ldxa	[%i1+%o5]0x88,%l0	! %l0 = 00000000ffff0000
!	Mem[0000000030141410] = ffffffff, %l2 = fffffa4e0000cd61
	lduha	[%i5+%o5]0x81,%l2	! %l2 = 000000000000ffff
!	Mem[0000000030001400] = ff2281c3ff000000, %f4  = ffffffff 00000000
	ldda	[%i0+%g0]0x89,%f4 	! %f4  = ff2281c3 ff000000
!	Mem[000000001008142c] = 94bcd52a, %l0 = 00000000ffff0000
	lduba	[%i2+0x02c]%asi,%l0	! %l0 = 0000000000000094
!	Code Fragment 4
p0_fragment_12:
!	%l0 = 0000000000000094
	setx	0x9fc667efecf204cf,%g7,%l0 ! %l0 = 9fc667efecf204cf
!	%l1 = 00000000ffffffff
	setx	0xe2aa657879c59a35,%g7,%l1 ! %l1 = e2aa657879c59a35
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 9fc667efecf204cf
	setx	0x7f3a7e37b1d39cb1,%g7,%l0 ! %l0 = 7f3a7e37b1d39cb1
!	%l1 = e2aa657879c59a35
	setx	0x64fe2b37ff6c720b,%g7,%l1 ! %l1 = 64fe2b37ff6c720b
!	%l6 = 000000000000007f, %l4 = 0000000000000000, %l7 = 000000000000002b
	xnor	%l6,%l4,%l7		! %l7 = ffffffffffffff80
!	Mem[0000000010181408] = 00000000, %l6 = 000000000000007f
	lduha	[%i6+%o4]0x80,%l6	! %l6 = 0000000000000000
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (16)
!	%l1 = 64fe2b37ff6c720b, Mem[0000000010041400] = 047edd19
	stwa	%l1,[%i1+%g0]0x88	! Mem[0000000010041400] = ff6c720b

p0_label_130:
!	Mem[0000000030181400] = db72f184, %l0 = 7f3a7e37b1d39cb1
	swapa	[%i6+%g0]0x89,%l0	! %l0 = 00000000db72f184
!	%l0 = 00000000db72f184, Mem[0000000010181414] = e70000ff
	stw	%l0,[%i6+0x014]		! Mem[0000000010181414] = db72f184
!	%f12 = 84f172db e436b160, %l3 = 0000000000000000
!	Mem[0000000030081408] = 1f00c5aba334634c
	add	%i2,0x008,%g1
	stda	%f12,[%g1+%l3]ASI_PST8_S ! Mem[0000000030081408] = 1f00c5aba334634c
!	%l4 = 00000000, %l5 = 0000cd61, Mem[0000000010081408] = 00000000 29000000
	stda	%l4,[%i2+%o4]0x88	! Mem[0000000010081408] = 00000000 0000cd61
!	%l6 = 0000000000000000, Mem[0000000030081408] = 1f00c5ab
	stba	%l6,[%i2+%o4]0x81	! Mem[0000000030081408] = 0000c5ab
!	Mem[00000000201c0000] = 001901ce, %l3 = 0000000000000000
	ldstub	[%o0+%g0],%l3		! %l3 = 00000000000000ff
!	%l2 = 000000000000ffff, Mem[0000000010141400] = 00000334
	stba	%l2,[%i5+%g0]0x80	! Mem[0000000010141400] = ff000334
!	Mem[0000000010081410] = e284ea29, %l2 = 000000000000ffff
	swapa	[%i2+%o5]0x88,%l2	! %l2 = 00000000e284ea29
!	%l2 = 00000000e284ea29, Mem[0000000030041410] = 00000029
	stwa	%l2,[%i1+%o5]0x89	! Mem[0000000030041410] = e284ea29
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = 6f000334, %l3 = 0000000000000000
	ldsha	[%i0+%o5]0x81,%l3	! %l3 = 0000000000006f00

p0_label_131:
!	Mem[0000000030041400] = a334634c, %f4  = ff2281c3
	lda	[%i1+%g0]0x81,%f4 	! %f4 = a334634c
!	Mem[00000000100c1400] = 3778507f, %l5 = fffffa4e0000cd61
	ldswa	[%i3+%g0]0x88,%l5	! %l5 = 000000003778507f
!	Mem[00000000100c1400] = 7f507837e2a2ea29, %f28 = 00000057 a6667f18
	ldda	[%i3+%g0]0x80,%f28	! %f28 = 7f507837 e2a2ea29
!	Mem[0000000030001410] = 6f00033400000000, %f18 = 0334634c 2ad5bcff
	ldda	[%i0+%o5]0x81,%f18	! %f18 = 6f000334 00000000
!	Mem[0000000010101430] = 088d03d2000000e3, %f10 = 95d0a0c4 6bd091ff
	ldd	[%i4+0x030],%f10	! %f10 = 088d03d2 000000e3
!	Mem[0000000030141410] = ffffffff, %l3 = 0000000000006f00
	ldswa	[%i5+%o5]0x81,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010081400] = a1813dba, %l3 = ffffffffffffffff
	lduba	[%i2+%g0]0x88,%l3	! %l3 = 00000000000000ba
!	Mem[0000000020800040] = 2a1ef99a, %l3 = 00000000000000ba
	ldsh	[%o1+0x040],%l3		! %l3 = 0000000000002a1e
!	Mem[0000000030001408] = 0000007e, %l7 = ffffffffffffff80
	lduwa	[%i0+%o4]0x89,%l7	! %l7 = 000000000000007e
!	Starting 10 instruction Store Burst
!	Mem[000000001018143c] = 047e2ea5, %l2 = e284ea29, %l5 = 3778507f
	add	%i6,0x3c,%g1
	casa	[%g1]0x80,%l2,%l5	! %l5 = 00000000047e2ea5

p0_label_132:
!	%l5 = 00000000047e2ea5, Mem[0000000010101410] = db72f184
	stwa	%l5,[%i4+%o5]0x80	! Mem[0000000010101410] = 047e2ea5
!	Mem[0000000010001438] = 10302700, %l2 = e284ea29, %l4 = 00000000
	add	%i0,0x38,%g1
	casa	[%g1]0x80,%l2,%l4	! %l4 = 0000000010302700
!	%l6 = 0000000000000000, Mem[0000000010081410] = ffff0000
	stwa	%l6,[%i2+%o5]0x80	! Mem[0000000010081410] = 00000000
!	%l3 = 0000000000002a1e, Mem[0000000030041410] = 29ea84e2
	stwa	%l3,[%i1+%o5]0x81	! Mem[0000000030041410] = 00002a1e
!	%f26 = 9558a0c4, Mem[0000000010041400] = 0b726cff
	sta	%f26,[%i1+%g0]0x80	! Mem[0000000010041400] = 9558a0c4
!	%l6 = 0000000000000000, Mem[00000000100c1400] = 29eaa2e23778507f
	stxa	%l6,[%i3+%g0]0x88	! Mem[00000000100c1400] = 0000000000000000
!	%l4 = 10302700, %l5 = 047e2ea5, Mem[0000000030141400] = feaeff25 57210000
	stda	%l4,[%i5+%g0]0x89	! Mem[0000000030141400] = 10302700 047e2ea5
!	Mem[00000000201c0000] = ff1901ce, %l5 = 00000000047e2ea5
	ldstuba	[%o0+0x000]%asi,%l5	! %l5 = 000000ff000000ff
!	Mem[00000000300c1410] = 00000000, %l0 = 00000000db72f184
	ldstuba	[%i3+%o5]0x81,%l0	! %l0 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = ff250000 ff00d037, %l6 = 00000000, %l7 = 0000007e
	ldda	[%i3+%o4]0x80,%l6	! %l6 = 00000000ff250000 00000000ff00d037

p0_label_133:
	membar	#Sync			! Added by membar checker (17)
!	Mem[0000000030141400] = 00273010 a52e7e04 ff000057 ff1edd19
!	Mem[0000000030141410] = ffffffff 00000000 29eaa2e2 37785099
!	Mem[0000000030141420] = 2ad52700 16973ac7 d2038d08 e436b160
!	Mem[0000000030141430] = 94bcd52a 4c633403 445c2c9f 9f22251e
	ldda	[%i5]ASI_BLK_S,%f16	! Block Load from 0000000030141400
!	Mem[0000000020800040] = 2a1ef99a, %l5 = 00000000000000ff
	ldub	[%o1+0x041],%l5		! %l5 = 000000000000001e
!	%l5 = 000000000000001e, %l0 = 0000000000000000, %l1  = 64fe2b37ff6c720b
	mulx	%l5,%l0,%l1		! %l1 = 0000000000000000
!	Mem[00000000300c1410] = 796694bc000000ff, %l7 = 00000000ff00d037
	ldxa	[%i3+%o5]0x89,%l7	! %l7 = 796694bc000000ff
!	Mem[00000000300c1408] = 00000000, %f15 = 7f180000
	lda	[%i3+%o4]0x89,%f15	! %f15 = 00000000
!	Mem[0000000010081408] = 00000000, %l6 = 00000000ff250000
	lduba	[%i2+%o4]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000010181400] = 00003403, %l1 = 0000000000000000
	ldsba	[%i6+%g0]0x80,%l1	! %l1 = 0000000000000000
!	%l6 = 0000000000000000, %l4 = 0000000010302700, %y  = fffffa4e
	umul	%l6,%l4,%l0		! %l0 = 0000000000000000, %y = 00000000
!	Mem[0000000030101408] = 00000000, %l5 = 000000000000001e
	ldsba	[%i4+%o4]0x81,%l5	! %l5 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l6 = 0000000000000000, Mem[0000000010101408] = 6fba0000
	stwa	%l6,[%i4+%o4]0x80	! Mem[0000000010101408] = 00000000

p0_label_134:
!	%l6 = 0000000000000000, Mem[00000000201c0000] = ff1901ce, %asi = 80
	stha	%l6,[%o0+0x000]%asi	! Mem[00000000201c0000] = 000001ce
!	%l0 = 00000000, %l1 = 00000000, Mem[0000000030181400] = b19cd3b1 e436b160
	stda	%l0,[%i6+%g0]0x81	! Mem[0000000030181400] = 00000000 00000000
!	%f12 = 84f172db e436b160, Mem[0000000010081400] = ba3d81a1 3469aa70
	stda	%f12,[%i2+%g0]0x80	! Mem[0000000010081400] = 84f172db e436b160
!	Mem[00000000100c142f] = e2a2ea29, %l2 = 00000000e284ea29
	ldstuba	[%i3+0x02f]%asi,%l2	! %l2 = 00000029000000ff
!	Mem[0000000010101404] = 00000000, %l0 = 00000000, %l4 = 10302700
	add	%i4,0x04,%g1
	casa	[%g1]0x80,%l0,%l4	! %l4 = 0000000000000000
!	%l6 = 0000000000000000, Mem[0000000010141408] = 0000002e
	stba	%l6,[%i5+%o4]0x80	! Mem[0000000010141408] = 0000002e
!	%l7 = 796694bc000000ff, Mem[0000000030101408] = 00000000
	stba	%l7,[%i4+%o4]0x81	! Mem[0000000030101408] = ff000000
!	Mem[0000000010101408] = 00000000, %l5 = 0000000000000000
	ldstuba	[%i4+%o4]0x88,%l5	! %l5 = 00000000000000ff
!	%l4 = 00000000, %l5 = 00000000, Mem[0000000030081408] = abc50000 4c6334a3
	stda	%l4,[%i2+%o4]0x89	! Mem[0000000030081408] = 00000000 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = ff2281c3, %l1 = 0000000000000000
	lduba	[%i6+%o4]0x81,%l1	! %l1 = 00000000000000ff

p0_label_135:
!	Mem[0000000030101410] = 1e25ee47, %l2 = 0000000000000029
	ldsba	[%i4+%o5]0x81,%l2	! %l2 = 000000000000001e
!	Mem[0000000010041434] = 57000000, %f14 = 00000000
	ld	[%i1+0x034],%f14	! %f14 = 57000000
!	Mem[0000000030141410] = ffffffff, %l4 = 0000000000000000
	ldswa	[%i5+%o5]0x81,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010141408] = 2e000000, %l5 = 0000000000000000
	ldsha	[%i5+%o4]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000010041400] = 9558a0c4, %l5 = 0000000000000000
	lduha	[%i1+%g0]0x80,%l5	! %l5 = 0000000000009558
!	Mem[0000000010181408] = 00000000000000ff, %f4  = a334634c ff000000
	ldda	[%i6+%o4]0x80,%f4 	! %f4  = 00000000 000000ff
!	Mem[0000000030181410] = ff34634c, %l1 = 00000000000000ff
	ldswa	[%i6+%o5]0x89,%l1	! %l1 = ffffffffff34634c
!	Mem[0000000030141400] = 10302700, %f2  = ff000000
	lda	[%i5+%g0]0x89,%f2 	! %f2 = 10302700
!	Mem[00000000100c1410] = 00000000, %l6 = 0000000000000000
	ldswa	[%i3+%o5]0x88,%l6	! %l6 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f12 = 84f172db e436b160, Mem[0000000010041410] = ffff0000 00000000
	stda	%f12,[%i1+%o5]0x88	! Mem[0000000010041410] = 84f172db e436b160

p0_label_136:
!	%l4 = ffffffffffffffff, Mem[00000000201c0000] = 000001ce, %asi = 80
	stha	%l4,[%o0+0x000]%asi	! Mem[00000000201c0000] = ffff01ce
!	%l4 = ffffffff, %l5 = 00009558, Mem[0000000030181410] = ff34634c 7f180000
	stda	%l4,[%i6+%o5]0x89	! Mem[0000000030181410] = ffffffff 00009558
!	Mem[0000000010141400] = ff000334, %l4 = ffffffffffffffff
	ldstuba	[%i5+%g0]0x80,%l4	! %l4 = 000000ff000000ff
	membar	#Sync			! Added by membar checker (18)
!	%l3 = 0000000000002a1e, Mem[0000000030141400] = 00273010
	stha	%l3,[%i5+%g0]0x81	! Mem[0000000030141400] = 2a1e3010
!	Mem[00000000300c1400] = 00b1b470, %l3 = 0000000000002a1e
	ldstuba	[%i3+%g0]0x81,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010001404] = 0000ba6f, %l6 = 0000000000000000
	swap	[%i0+0x004],%l6		! %l6 = 000000000000ba6f
!	%l5 = 0000000000009558, Mem[0000000010041400] = 9558a0c4
	stw	%l5,[%i1+%g0]		! Mem[0000000010041400] = 00009558
!	%f20 = ffffffff 00000000, Mem[0000000030101400] = ffff25ff 26604981
	stda	%f20,[%i4+%g0]0x89	! Mem[0000000030101400] = ffffffff 00000000
!	%f13 = e436b160, Mem[0000000010001430] = 00000000
	st	%f13,[%i0+0x030]	! Mem[0000000010001430] = e436b160
!	Starting 10 instruction Load Burst
!	Code Fragment 4
p0_fragment_13:
!	%l0 = 0000000000000000
	setx	0x4aee83dfd8690631,%g7,%l0 ! %l0 = 4aee83dfd8690631
!	%l1 = ffffffffff34634c
	setx	0xd88b046f846782bb,%g7,%l1 ! %l1 = d88b046f846782bb
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 4aee83dfd8690631
	setx	0xbb5b7e7791ba03c2,%g7,%l0 ! %l0 = bb5b7e7791ba03c2
!	%l1 = d88b046f846782bb
	setx	0x18a4ed7fa95857d3,%g7,%l1 ! %l1 = 18a4ed7fa95857d3

p0_label_137:
!	Mem[0000000010041410] = 60b136e4, %l5 = 0000000000009558
	lduha	[%i1+%o5]0x80,%l5	! %l5 = 00000000000060b1
!	Mem[0000000010041410] = 84f172dbe436b160, %f28 = 94bcd52a 4c633403
	ldda	[%i1+%o5]0x88,%f28	! %f28 = 84f172db e436b160
!	Mem[0000000010081408] = 00000000, %l3 = 0000000000000000
	lduwa	[%i2+%o4]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000030181400] = 00000000, %l6 = 000000000000ba6f
	ldsba	[%i6+%g0]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000030101408] = ff000000, %l0 = bb5b7e7791ba03c2
	lduba	[%i4+%o4]0x81,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030141408] = 19dd1eff 570000ff, %l2 = 0000001e, %l3 = 00000000
	ldda	[%i5+%o4]0x89,%l2	! %l2 = 00000000570000ff 0000000019dd1eff
!	Mem[0000000030181408] = ff2281c3, %l1 = 18a4ed7fa95857d3
	ldsha	[%i6+%o4]0x81,%l1	! %l1 = ffffffffffffff22
!	Mem[00000000218001c0] = ff1cc752, %l0 = 00000000000000ff
	ldsba	[%o3+0x1c0]%asi,%l0	! %l0 = ffffffffffffffff
!	%f6  = 00000000, %f27 = e436b160
	fsqrts	%f6 ,%f27		! %f27 = 00000000
!	Starting 10 instruction Store Burst
!	%l3 = 0000000019dd1eff, Mem[0000000010141410] = 1c0b0334
	stba	%l3,[%i5+%o5]0x80	! Mem[0000000010141410] = ff0b0334

p0_label_138:
!	%f17 = a52e7e04, Mem[0000000030141408] = ff000057
	sta	%f17,[%i5+%o4]0x81	! Mem[0000000030141408] = a52e7e04
!	%l6 = 00000000, %l7 = 000000ff, Mem[0000000010101410] = 047e2ea5 9e7c1543
	stda	%l6,[%i4+%o5]0x80	! Mem[0000000010101410] = 00000000 000000ff
!	%f12 = 84f172db e436b160, Mem[00000000100c1408] = 000025ff 37d000ff
	stda	%f12,[%i3+%o4]0x88	! Mem[00000000100c1408] = 84f172db e436b160
!	%l4 = 00000000000000ff, Mem[00000000300c1408] = e8476df600000000
	stxa	%l4,[%i3+%o4]0x89	! Mem[00000000300c1408] = 00000000000000ff
!	Mem[0000000010141410] = 34030bff, %l0 = ffffffffffffffff
	swapa	[%i5+%o5]0x88,%l0	! %l0 = 0000000034030bff
!	%l0 = 0000000034030bff, Mem[00000000300c1408] = 000000ff
	stwa	%l0,[%i3+%o4]0x89	! Mem[00000000300c1408] = 34030bff
!	Mem[00000000100c1400] = 00000000, %l0 = 0000000034030bff
	swapa	[%i3+%g0]0x80,%l0	! %l0 = 0000000000000000
!	%f18 = ff000057, Mem[0000000030001410] = 6f000334
	sta	%f18,[%i0+%o5]0x81	! Mem[0000000030001410] = ff000057
!	%l1 = ffffffffffffff22, Mem[0000000010181400] = 03340000
	stba	%l1,[%i6+%g0]0x88	! Mem[0000000010181400] = 03340022
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = ff0000004c6334a3, %l1 = ffffffffffffff22
	ldxa	[%i1+%g0]0x89,%l1	! %l1 = ff0000004c6334a3

p0_label_139:
!	Mem[0000000030081408] = 0000000000000000, %f8  = 00000000 00000000
	ldda	[%i2+%o4]0x89,%f8 	! %f8  = 00000000 00000000
!	Mem[0000000010081400] = 60b136e4db72f184, %l1 = ff0000004c6334a3
	ldxa	[%i2+%g0]0x88,%l1	! %l1 = 60b136e4db72f184
!	Mem[0000000030101408] = ff000000, %l2 = 00000000570000ff
	lduba	[%i4+%o4]0x81,%l2	! %l2 = 00000000000000ff
!	Mem[00000000300c1408] = 34030bff, %l5 = 00000000000060b1
	lduwa	[%i3+%o4]0x89,%l5	! %l5 = 0000000034030bff
!	Mem[0000000010141410] = ffffffff, %l0 = 0000000000000000
	lduba	[%i5+%o5]0x80,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010081410] = 00000000, %l7 = 796694bc000000ff
	ldsha	[%i2+%o5]0x88,%l7	! %l7 = 0000000000000000
!	Mem[00000000100c1414] = 00000000, %l7 = 0000000000000000
	ldsba	[%i3+0x014]%asi,%l7	! %l7 = 0000000000000000
!	Mem[0000000030181408] = ff2281c39e7c1543, %f24 = 2ad52700 16973ac7
	ldda	[%i6+%o4]0x81,%f24	! %f24 = ff2281c3 9e7c1543
!	Mem[0000000030141400] = 047e2ea5 10301e2a, %l0 = 000000ff, %l1 = db72f184
	ldda	[%i5+%g0]0x89,%l0	! %l0 = 0000000010301e2a 00000000047e2ea5
!	Starting 10 instruction Store Burst
!	%f12 = 84f172db e436b160, Mem[0000000010041420] = 4c6334a3 00000000
	std	%f12,[%i1+0x020]	! Mem[0000000010041420] = 84f172db e436b160

p0_label_140:
!	%l0 = 10301e2a, %l1 = 047e2ea5, Mem[0000000010001408] = ff0000ff 569cb862
	stda	%l0,[%i0+%o4]0x88	! Mem[0000000010001408] = 10301e2a 047e2ea5
!	%l4 = 00000000000000ff, Mem[0000000010041400] = 58950000
	stha	%l4,[%i1+%g0]0x88	! Mem[0000000010041400] = 589500ff
!	%f4  = 00000000 000000ff, Mem[00000000100c1400] = ff0b0334 00000000
	stda	%f4 ,[%i3+%g0]0x88	! Mem[00000000100c1400] = 00000000 000000ff
!	%l3 = 0000000019dd1eff, Mem[0000000010141438] = c3592c9f
	stb	%l3,[%i5+0x038]		! Mem[0000000010141438] = ff592c9f
!	%l7 = 0000000000000000, Mem[0000000010041410] = e436b160
	stha	%l7,[%i1+%o5]0x88	! Mem[0000000010041410] = e4360000
!	%f16 = 00273010, Mem[0000000010181408] = 00000000
	sta	%f16,[%i6+%o4]0x88	! Mem[0000000010181408] = 00273010
!	Mem[0000000030041400] = 4c6334a3, %l1 = 00000000047e2ea5
	swapa	[%i1+%g0]0x89,%l1	! %l1 = 000000004c6334a3
!	%l1 = 000000004c6334a3, Mem[0000000010041408] = 2ad5bcff
	stha	%l1,[%i1+%o4]0x88	! Mem[0000000010041408] = 2ad534a3
!	%l7 = 0000000000000000, Mem[0000000010041410] = 000036e4db72f184
	stxa	%l7,[%i1+%o5]0x80	! Mem[0000000010041410] = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = ff000000, %l4 = 00000000000000ff
	lduwa	[%i4+%o4]0x81,%l4	! %l4 = 00000000ff000000

p0_label_141:
!	Mem[0000000010041410] = 00000000 00000000, %l6 = 00000000, %l7 = 00000000
	ldda	[%i1+%o5]0x80,%l6	! %l6 = 0000000000000000 0000000000000000
!	%f5  = 000000ff, %f5  = 000000ff
	fcmpes	%fcc2,%f5 ,%f5 		! %fcc2 = 0
!	Mem[0000000030181410] = ffffffff, %l6 = 0000000000000000
	lduha	[%i6+%o5]0x81,%l6	! %l6 = 000000000000ffff
!	Mem[0000000010081408] = 00000000, %f18 = ff000057
	lda	[%i2+%o4]0x88,%f18	! %f18 = 00000000
!	Mem[0000000030001408] = 0000187f0000007e, %l2 = 00000000000000ff
	ldxa	[%i0+%o4]0x89,%l2	! %l2 = 0000187f0000007e
!	Mem[0000000010001400] = 6200006f00000000, %l2 = 0000187f0000007e
	ldxa	[%i0+%g0]0x80,%l2	! %l2 = 6200006f00000000
!	Mem[00000000100c1410] = 00000000, %l6 = 000000000000ffff
	lduha	[%i3+%o5]0x88,%l6	! %l6 = 0000000000000000
!	Mem[000000001010143c] = 00000000, %f28 = 84f172db
	lda	[%i4+0x03c]%asi,%f28	! %f28 = 00000000
!	Mem[0000000010081408] = 00000000, %l6 = 0000000000000000
	lduba	[%i2+%o4]0x88,%l6	! %l6 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l0 = 0000000010301e2a, Mem[0000000020800040] = 2a1ef99a
	sth	%l0,[%o1+0x040]		! Mem[0000000020800040] = 1e2af99a

p0_label_142:
!	Mem[0000000010141410] = ffffffff, %l2 = 6200006f00000000
	swapa	[%i5+%o5]0x88,%l2	! %l2 = 00000000ffffffff
!	%l7 = 0000000000000000, Mem[0000000030181410] = ffffffff58950000
	stxa	%l7,[%i6+%o5]0x81	! Mem[0000000030181410] = 0000000000000000
!	%l4 = 00000000ff000000, Mem[0000000030101400] = 00000000
	stba	%l4,[%i4+%g0]0x81	! Mem[0000000030101400] = 00000000
!	Mem[000000001000143c] = 1e25229f, %l4 = 00000000ff000000
	ldub	[%i0+0x03f],%l4		! %l4 = 000000000000009f
!	Mem[0000000010081430] = 00000000, %l4 = 000000000000009f, %asi = 80
	swapa	[%i2+0x030]%asi,%l4	! %l4 = 0000000000000000
!	%l5 = 0000000034030bff, Mem[0000000010081410] = 00000000
	stha	%l5,[%i2+%o5]0x80	! Mem[0000000010081410] = 0bff0000
!	Code Fragment 3
p0_fragment_14:
!	%l0 = 0000000010301e2a
	setx	0x807a317fbd5749ff,%g7,%l0 ! %l0 = 807a317fbd5749ff
!	%l1 = 000000004c6334a3
	setx	0x239455d033e54d26,%g7,%l1 ! %l1 = 239455d033e54d26
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 807a317fbd5749ff
	setx	0x5b458fbfd5ff4b3c,%g7,%l0 ! %l0 = 5b458fbfd5ff4b3c
!	%l1 = 239455d033e54d26
	setx	0x2abcd837b0626797,%g7,%l1 ! %l1 = 2abcd837b0626797
!	Mem[0000000020800000] = ffffe062, %l1 = 2abcd837b0626797
	ldstub	[%o1+%g0],%l1		! %l1 = 000000ff000000ff
!	%l5 = 0000000034030bff, Mem[0000000010101410] = ff00000000000000
	stxa	%l5,[%i4+%o5]0x88	! Mem[0000000010101410] = 0000000034030bff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = 00250a6ddb72f184, %f22 = 29eaa2e2 37785099
	ldda	[%i6+%o5]0x80,%f22	! %f22 = 00250a6d db72f184

p0_label_143:
!	Mem[0000000010141408] = 2e000000, %f21 = 00000000
	lda	[%i5+%o4]0x88,%f21	! %f21 = 2e000000
!	Mem[00000000211c0000] = f184e5a1, %l5 = 0000000034030bff
	lduba	[%o2+0x001]%asi,%l5	! %l5 = 0000000000000084
!	Mem[0000000010001400] = 6200006f, %l2 = 00000000ffffffff
	lduw	[%i0+%g0],%l2		! %l2 = 000000006200006f
!	Mem[00000000201c0000] = ffff01ce, %l4 = 0000000000000000
	lduha	[%o0+0x000]%asi,%l4	! %l4 = 000000000000ffff
!	Mem[00000000100c1408] = e436b160, %l6 = 0000000000000000
	ldsha	[%i3+%o4]0x88,%l6	! %l6 = ffffffffffffb160
!	Mem[0000000010141400] = ffffffdb340300ff, %f22 = 00250a6d db72f184
	ldda	[%i5+%g0]0x88,%f22	! %f22 = ffffffdb 340300ff
!	Mem[0000000030101400] = 00000000, %l6 = ffffffffffffb160
	lduha	[%i4+%g0]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000010001410] = bcffffff, %l3 = 0000000019dd1eff
	lduba	[%i0+%o5]0x80,%l3	! %l3 = 00000000000000bc
!	Mem[0000000030081408] = 00000000, %l1 = 00000000000000ff
	ldsba	[%i2+%o4]0x81,%l1	! %l1 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l0 = d5ff4b3c, %l1 = 00000000, Mem[0000000010181410] = 00250a6d db72f184
	stda	%l0,[%i6+%o5]0x80	! Mem[0000000010181410] = d5ff4b3c 00000000

p0_label_144:
!	Mem[00000000201c0001] = ffff01ce, %l3 = 00000000000000bc
	ldstub	[%o0+0x001],%l3		! %l3 = 000000ff000000ff
!	%l0 = d5ff4b3c, %l1 = 00000000, Mem[0000000030101410] = 1e25ee47 75f8ffff
	stda	%l0,[%i4+%o5]0x81	! Mem[0000000030101410] = d5ff4b3c 00000000
!	%l4 = 000000000000ffff, Mem[0000000030081410] = ff00f184
	stha	%l4,[%i2+%o5]0x81	! Mem[0000000030081410] = fffff184
!	%l2 = 6200006f, %l3 = 000000ff, Mem[0000000010001410] = bcffffff ffffffff
	std	%l2,[%i0+%o5]		! Mem[0000000010001410] = 6200006f 000000ff
!	Mem[0000000030101408] = 000000ff, %l6 = 0000000000000000
	ldstuba	[%i4+%o4]0x89,%l6	! %l6 = 000000ff000000ff
!	%l6 = 00000000000000ff, Mem[0000000010141410] = 00000000
	stba	%l6,[%i5+%o5]0x80	! Mem[0000000010141410] = ff000000
!	%l0 = 5b458fbfd5ff4b3c, Mem[0000000010001400] = 6f000062
	stwa	%l0,[%i0+%g0]0x88	! Mem[0000000010001400] = d5ff4b3c
!	Mem[0000000010181408] = 00273010, %l5 = 0000000000000084
	swapa	[%i6+%o4]0x88,%l5	! %l5 = 0000000000273010
!	%f12 = 84f172db e436b160, Mem[0000000010041408] = a334d52a 4c633403
	stda	%f12,[%i1+%o4]0x80	! Mem[0000000010041408] = 84f172db e436b160
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = 00002a1e, %l2 = 000000006200006f
	lduba	[%i1+%o5]0x81,%l2	! %l2 = 0000000000000000

p0_label_145:
!	Mem[0000000030081408] = 00000000, %f18 = 00000000
	lda	[%i2+%o4]0x89,%f18	! %f18 = 00000000
!	Mem[0000000010181410] = 3c4bffd5, %l0 = 5b458fbfd5ff4b3c
	ldsha	[%i6+%o5]0x88,%l0	! %l0 = ffffffffffffffd5
!	Mem[0000000030101410] = d5ff4b3c 00000000, %l4 = 0000ffff, %l5 = 00273010
	ldda	[%i4+%o5]0x81,%l4	! %l4 = 00000000d5ff4b3c 0000000000000000
!	Mem[0000000010181408] = 84000000, %l4 = 00000000d5ff4b3c
	lduha	[%i6+%o4]0x80,%l4	! %l4 = 0000000000008400
!	%l5 = 0000000000000000, %l1 = 0000000000000000, %l7 = 0000000000000000
	udivx	%l5,%l1,%l7		! Div by zero, %l0 = 0000000000000025
!	%l7 = 0000000000000000, %l7 = 0000000000000000, %l2  = 0000000000000000
	mulx	%l7,%l7,%l2		! %l2 = 0000000000000000
!	Mem[0000000010041400] = ff009558, %l4 = 0000000000008400
	lduh	[%i1+%g0],%l4		! %l4 = 000000000000ff00
!	Mem[0000000030081410] = fffff184, %l0 = fffffffffffffffd
	ldswa	[%i2+%o5]0x81,%l0	! %l0 = fffffffffffff184
!	Mem[0000000030081408] = 00000000, %l4 = 000000000000ff00
	lduha	[%i2+%o4]0x81,%l4	! %l4 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l1 = 0000000000000000, %l5 = 0000000000000000, %l4 = 0000000000000000
	xor	%l1,%l5,%l4		! %l4 = 0000000000000000

p0_label_146:
!	%f3  = 00000000, Mem[0000000010001408] = 2a1e3010
	sta	%f3 ,[%i0+%o4]0x80	! Mem[0000000010001408] = 00000000
!	Mem[00000000300c1410] = ff000000, %l5 = 0000000000000000
	ldstuba	[%i3+%o5]0x81,%l5	! %l5 = 000000ff000000ff
!	Mem[0000000030001408] = 0000007e, %l6 = 00000000000000ff
	swapa	[%i0+%o4]0x89,%l6	! %l6 = 000000000000007e
!	Mem[0000000010001400] = 3c4bffd5, %l4 = 0000000000000000
	swapa	[%i0+%g0]0x80,%l4	! %l4 = 000000003c4bffd5
!	%f26 = d2038d08 00000000, %f30 = 445c2c9f 9f22251e
	fxtod	%f26,%f30		! %f30 = c3c6fe39 7c000000
!	Mem[0000000010041410] = 00000000, %l2 = 0000000000000000
	ldstuba	[%i1+%o5]0x80,%l2	! %l2 = 00000000000000ff
!	%l7 = 0000000000000000, Mem[0000000010041408] = 84f172db
	stw	%l7,[%i1+%o4]		! Mem[0000000010041408] = 00000000
!	%f28 = 00000000, Mem[0000000010101424] = 047effa5
	st	%f28,[%i4+0x024]	! Mem[0000000010101424] = 00000000
!	%l4 = 000000003c4bffd5, Mem[0000000030101400] = 00000000
	stha	%l4,[%i4+%g0]0x89	! Mem[0000000030101400] = 0000ffd5
!	Starting 10 instruction Load Burst
!	Mem[0000000020800040] = 1e2af99a, %l6 = 000000000000007e
	lduha	[%o1+0x040]%asi,%l6	! %l6 = 0000000000001e2a

p0_label_147:
!	Mem[0000000010001414] = 000000ff, %l5 = 00000000000000ff
	lduw	[%i0+0x014],%l5		! %l5 = 00000000000000ff
!	Mem[0000000010141408] = 0000002e, %l1 = 0000000000000000
	ldsw	[%i5+%o4],%l1		! %l1 = 000000000000002e
!	Mem[0000000010081410] = ffff87a20000ff0b, %l7 = 0000000000000000
	ldxa	[%i2+%o5]0x88,%l7	! %l7 = ffff87a20000ff0b
!	Mem[0000000030141408] = 047e2ea5, %l7 = ffff87a20000ff0b
	ldsba	[%i5+%o4]0x89,%l7	! %l7 = ffffffffffffffa5
!	Mem[0000000010081410] = ffff87a20000ff0b, %f20 = ffffffff 2e000000
	ldda	[%i2+%o5]0x88,%f20	! %f20 = ffff87a2 0000ff0b
!	%f11 = 000000e3, %f6  = 00000000, %f23 = 340300ff
	fdivs	%f11,%f6 ,%f23		! %f23 = 7f800000
!	Mem[0000000010141400] = 340300ff, %l2 = 0000000000000000
	ldswa	[%i5+%g0]0x88,%l2	! %l2 = 00000000340300ff
!	Mem[0000000010181408] = 84000000, %l6 = 0000000000001e2a
	ldsha	[%i6+0x008]%asi,%l6	! %l6 = ffffffffffff8400
!	Mem[0000000030141410] = ffffffff, %l5 = 00000000000000ff
	lduwa	[%i5+%o5]0x81,%l5	! %l5 = 00000000ffffffff
!	Starting 10 instruction Store Burst
!	Mem[0000000010001434] = 00000000, %l1 = 0000002e, %l2 = 340300ff
	add	%i0,0x34,%g1
	casa	[%g1]0x80,%l1,%l2	! %l2 = 0000000000000000

p0_label_148:
!	%f1  = c38122ff, %f9  = 00000000, %f7  = 00000000
	fdivs	%f1 ,%f9 ,%f7 		! %f7  = ff800000
!	Mem[0000000010081408] = 00000000, %l4 = 000000003c4bffd5, %asi = 80
	swapa	[%i2+0x008]%asi,%l4	! %l4 = 0000000000000000
!	Mem[0000000010001420] = 00000000, %l6 = ffffffffffff8400
	ldstuba	[%i0+0x020]%asi,%l6	! %l6 = 00000000000000ff
!	Mem[00000000100c1410] = 00000000, %l3 = 00000000000000ff
	swapa	[%i3+%o5]0x80,%l3	! %l3 = 0000000000000000
!	%f0  = 37c3a13c c38122ff, %l6 = 0000000000000000
!	Mem[00000000100c1428] = 00000000e2a2eaff
	add	%i3,0x028,%g1
	stda	%f0,[%g1+%l6]ASI_PST16_P ! Mem[00000000100c1428] = 00000000e2a2eaff
!	%f30 = c3c6fe39 7c000000, Mem[00000000300c1408] = 34030bff 00000000
	stda	%f30,[%i3+%o4]0x89	! Mem[00000000300c1408] = c3c6fe39 7c000000
!	Mem[0000000010101410] = 34030bff, %l6 = 0000000000000000
	ldstuba	[%i4+%o5]0x88,%l6	! %l6 = 000000ff000000ff
!	Mem[0000000010081400] = db72f184, %l6 = 00000000000000ff
	swapa	[%i2+%g0]0x88,%l6	! %l6 = 00000000db72f184
!	%l5 = 00000000ffffffff, Mem[0000000030181410] = 00000000
	stba	%l5,[%i6+%o5]0x89	! Mem[0000000030181410] = 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000021800100] = 34bc4e79, %l1 = 000000000000002e
	lduh	[%o3+0x100],%l1		! %l1 = 00000000000034bc

p0_label_149:
!	Mem[0000000030001408] = ff000000, %l4 = 0000000000000000
	ldsba	[%i0+%o4]0x81,%l4	! %l4 = ffffffffffffffff
!	%l2 = 0000000000000000, %l0 = fffffffffffff184, %l6 = 00000000db72f184
	sdivx	%l2,%l0,%l6		! %l6 = 0000000000000000
!	Mem[0000000030081408] = 0000000000000000, %l0 = fffffffffffff184
	ldxa	[%i2+%o4]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000010081430] = 0000009f41a1b160, %l5 = 00000000ffffffff
	ldx	[%i2+0x030],%l5		! %l5 = 0000009f41a1b160
!	Mem[000000001018140c] = 000000ff, %l7 = ffffffffffffffa5
	ldsba	[%i6+0x00c]%asi,%l7	! %l7 = 0000000000000000
!	Mem[0000000010001410] = 6200006f, %l6 = 0000000000000000
	lduba	[%i0+%o5]0x80,%l6	! %l6 = 0000000000000062
!	Mem[0000000010181438] = 000003d2047e2ea5, %f22 = ffffffdb 7f800000
	ldd	[%i6+0x038],%f22	! %f22 = 000003d2 047e2ea5
!	Mem[0000000010141408] = 94bcd52a 2e000000, %l4 = ffffffff, %l5 = 41a1b160
	ldda	[%i5+%o4]0x88,%l4	! %l4 = 000000002e000000 0000000094bcd52a
!	Mem[0000000030141408] = a52e7e04ff1edd19, %f6  = 00000000 ff800000
	ldda	[%i5+%o4]0x81,%f6 	! %f6  = a52e7e04 ff1edd19
!	Starting 10 instruction Store Burst
!	%l3 = 0000000000000000, imm = 0000000000000a71, %l7 = 0000000000000000
	subc	%l3,0xa71,%l7		! %l7 = fffffffffffff58f

p0_label_150:
!	%l1 = 00000000000034bc, Mem[00000000211c0000] = f184e5a1, %asi = 80
	stba	%l1,[%o2+0x000]%asi	! Mem[00000000211c0000] = bc84e5a1
!	%f0  = 37c3a13c c38122ff 10302700 00000000
!	%f4  = 00000000 000000ff a52e7e04 ff1edd19
!	%f8  = 00000000 00000000 088d03d2 000000e3
!	%f12 = 84f172db e436b160 57000000 00000000
	stda	%f0,[%i5]ASI_BLK_SL	! Block Store to 0000000030141400
!	%l2 = 0000000000000000, Mem[0000000030081410] = fdb1b47084f1ffff
	stxa	%l2,[%i2+%o5]0x89	! Mem[0000000030081410] = 0000000000000000
!	Mem[0000000010181400] = 22003403, %l0 = 0000000000000000
	swapa	[%i6+%g0]0x80,%l0	! %l0 = 0000000022003403
!	%f28 = 00000000 e436b160, %l2 = 0000000000000000
!	Mem[0000000030181428] = a52e7e04e2a2ea29
	add	%i6,0x028,%g1
	stda	%f28,[%g1+%l2]ASI_PST8_SL ! Mem[0000000030181428] = a52e7e04e2a2ea29
!	%l1 = 00000000000034bc, Mem[0000000030041410] = 00002a1e00000000
	stxa	%l1,[%i1+%o5]0x81	! Mem[0000000030041410] = 00000000000034bc
!	%f21 = 0000ff0b, Mem[0000000030041410] = 00000000
	sta	%f21,[%i1+%o5]0x89	! Mem[0000000030041410] = 0000ff0b
!	%l4 = 000000002e000000, %l3 = 0000000000000000, %l7 = fffffffffffff58f
	sub	%l4,%l3,%l7		! %l7 = 000000002e000000
!	%l6 = 0000000000000062, Mem[000000001014140e] = 2ad5bc94, %asi = 80
	stha	%l6,[%i5+0x00e]%asi	! Mem[000000001014140c] = 2ad50062
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = ff000057, %f26 = d2038d08
	lda	[%i0+%o5]0x81,%f26	! %f26 = ff000057

p0_label_151:
!	Mem[0000000030181408] = ff2281c39e7c1543, %f22 = 000003d2 047e2ea5
	ldda	[%i6+%o4]0x81,%f22	! %f22 = ff2281c3 9e7c1543
!	Mem[0000000030101400] = d5ff0000 ffffffff, %l2 = 00000000, %l3 = 00000000
	ldda	[%i4+%g0]0x81,%l2	! %l2 = 00000000d5ff0000 00000000ffffffff
!	Mem[0000000020800000] = ffffe062, %l0 = 0000000022003403
	ldub	[%o1+%g0],%l0		! %l0 = 00000000000000ff
!	Mem[0000000010041410] = ff000000 00000000, %l0 = 000000ff, %l1 = 000034bc
	ldd	[%i1+%o5],%l0		! %l0 = 00000000ff000000 0000000000000000
!	Mem[0000000030081408] = 00000000, %l6 = 0000000000000062
	lduha	[%i2+%o4]0x81,%l6	! %l6 = 0000000000000000
!	Mem[00000000201c0000] = ffff01ce, %l6 = 0000000000000000
	lduh	[%o0+%g0],%l6		! %l6 = 000000000000ffff
	membar	#Sync			! Added by membar checker (19)
!	Mem[0000000030141410] = 000000ff, %l3 = 00000000ffffffff
	lduha	[%i5+%o5]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010141410] = 000000ff, %f22 = ff2281c3
	lda	[%i5+%o5]0x88,%f22	! %f22 = 000000ff
!	%l3 = 00000000000000ff, %l5 = 0000000094bcd52a, %l1 = 0000000000000000
	xor	%l3,%l5,%l1		! %l1 = 0000000094bcd5d5
!	Starting 10 instruction Store Burst
!	%l4 = 2e000000, %l5 = 94bcd52a, Mem[0000000030081410] = 00000000 00000000
	stda	%l4,[%i2+%o5]0x89	! Mem[0000000030081410] = 2e000000 94bcd52a

p0_label_152:
!	%l2 = 00000000d5ff0000, %l3 = 00000000000000ff, %l6 = 000000000000ffff
	sdivx	%l2,%l3,%l6		! %l6 = 0000000000d6d5d5
!	Mem[0000000030141408] = 00000000, %l6 = 0000000000d6d5d5
	ldstuba	[%i5+%o4]0x81,%l6	! %l6 = 00000000000000ff
!	%l0 = 00000000ff000000, %l5 = 0000000094bcd52a, %l2 = 00000000d5ff0000
	and	%l0,%l5,%l2		! %l2 = 0000000094000000
!	Mem[0000000010141410] = 000000ff, %l6 = 0000000000000000
	swapa	[%i5+%o5]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010101408] = 000000ff, %l7 = 000000002e000000
	ldstuba	[%i4+%o4]0x88,%l7	! %l7 = 000000ff000000ff
!	%f22 = 000000ff 9e7c1543, Mem[0000000010141410] = 00000000 0000ba6f
	stda	%f22,[%i5+%o5]0x80	! Mem[0000000010141410] = 000000ff 9e7c1543
!	%f11 = 000000e3, Mem[0000000030101410] = d5ff4b3c
	sta	%f11,[%i4+%o5]0x81	! Mem[0000000030101410] = 000000e3
!	Mem[0000000030181400] = 00000000, %l4 = 000000002e000000
	ldstuba	[%i6+%g0]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[000000001008141c] = 00000000, %l6 = 00000000000000ff
	swap	[%i2+0x01c],%l6		! %l6 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = 0000000000000000, %l3 = 00000000000000ff
	ldxa	[%i2+%o4]0x89,%l3	! %l3 = 0000000000000000

p0_label_153:
!	Mem[0000000010001400] = 00000000, %f20 = ffff87a2
	lda	[%i0+%g0]0x88,%f20	! %f20 = 00000000
!	Mem[0000000030041408] = c7ff0000, %l4 = 0000000000000000
	ldsba	[%i1+%o4]0x89,%l4	! %l4 = 0000000000000000
!	Mem[00000000201c0000] = ffff01ce, %l7 = 00000000000000ff
	ldsb	[%o0+0x001],%l7		! %l7 = ffffffffffffffff
!	Mem[0000000010081410] = 0000ff0b, %l2 = 0000000094000000
	ldsha	[%i2+%o5]0x88,%l2	! %l2 = ffffffffffffff0b
!	Mem[0000000010081408] = 3c4bffd5, %l3 = 0000000000000000
	ldsha	[%i2+%o4]0x80,%l3	! %l3 = 0000000000003c4b
!	Mem[00000000201c0000] = ffff01ce, %l4 = 0000000000000000
	ldsh	[%o0+%g0],%l4		! %l4 = ffffffffffffffff
!	Mem[0000000010141408] = 6200d52a 2e000000, %l0 = ff000000, %l1 = 94bcd5d5
	ldda	[%i5+%o4]0x88,%l0	! %l0 = 000000002e000000 000000006200d52a
!	Mem[0000000010001408] = 00000000 a52e7e04, %l0 = 2e000000, %l1 = 6200d52a
	ldda	[%i0+%o4]0x80,%l0	! %l0 = 0000000000000000 00000000a52e7e04
!	Mem[0000000010101408] = ff2281c3000000ff, %f12 = 84f172db e436b160
	ldda	[%i4+%o4]0x88,%f12	! %f12 = ff2281c3 000000ff
!	Starting 10 instruction Store Burst
!	%l1 = 00000000a52e7e04, Mem[0000000030001410] = ff000057
	stwa	%l1,[%i0+%o5]0x81	! Mem[0000000030001410] = a52e7e04

p0_label_154:
!	Mem[0000000010101410] = ff0b0334, %l1 = 00000000a52e7e04
	ldstuba	[%i4+%o5]0x80,%l1	! %l1 = 000000ff000000ff
!	%f0  = 37c3a13c, Mem[0000000030001400] = 000000ff
	sta	%f0 ,[%i0+%g0]0x81	! Mem[0000000030001400] = 37c3a13c
!	%l5 = 0000000094bcd52a, Mem[0000000010181400] = 00000000db72f184
	stx	%l5,[%i6+%g0]		! Mem[0000000010181400] = 0000000094bcd52a
!	%l2 = ffffff0b, %l3 = 00003c4b, Mem[00000000300c1410] = 000000ff 796694bc
	stda	%l2,[%i3+%o5]0x89	! Mem[00000000300c1410] = ffffff0b 00003c4b
!	Mem[0000000030181410] = ff000000, %l6 = 0000000000000000
	swapa	[%i6+%o5]0x81,%l6	! %l6 = 00000000ff000000
!	%f2  = 10302700 00000000, Mem[0000000030141400] = ff2281c3 3ca1c337
	stda	%f2 ,[%i5+%g0]0x81	! Mem[0000000030141400] = 10302700 00000000
!	%f10 = 088d03d2 000000e3, Mem[0000000030041400] = 047e2ea5 ff000000
	stda	%f10,[%i1+%g0]0x89	! Mem[0000000030041400] = 088d03d2 000000e3
!	%l6 = ff000000, %l7 = ffffffff, Mem[0000000010141410] = ff000000 43157c9e
	stda	%l6,[%i5+%o5]0x88	! Mem[0000000010141410] = ff000000 ffffffff
!	%l6 = ff000000, %l7 = ffffffff, Mem[0000000030101408] = ff000000 00000000
	stda	%l6,[%i4+%o4]0x81	! Mem[0000000030101408] = ff000000 ffffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181430] = 0aeb4c39 47ee08bd, %l6 = ff000000, %l7 = ffffffff
	ldda	[%i6+0x030]%asi,%l6	! %l6 = 000000000aeb4c39 0000000047ee08bd

p0_label_155:
!	Code Fragment 4
p0_fragment_15:
!	%l0 = 0000000000000000
	setx	0x7ad0c2904c0e4d1a,%g7,%l0 ! %l0 = 7ad0c2904c0e4d1a
!	%l1 = 00000000000000ff
	setx	0x26a442d7f0ad64d7,%g7,%l1 ! %l1 = 26a442d7f0ad64d7
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 7ad0c2904c0e4d1a
	setx	0xfc3aecb032de6c22,%g7,%l0 ! %l0 = fc3aecb032de6c22
!	%l1 = 26a442d7f0ad64d7
	setx	0xc70ebb8002aad8ec,%g7,%l1 ! %l1 = c70ebb8002aad8ec
!	Mem[00000000100c1408] = 84f172db e436b160, %l6 = 0aeb4c39, %l7 = 47ee08bd
	ldda	[%i3+%o4]0x88,%l6	! %l6 = 00000000e436b160 0000000084f172db
!	Mem[0000000010141408] = 2e000000, %l5 = 0000000094bcd52a
	lduba	[%i5+%o4]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000030081408] = 00000000, %l5 = 0000000000000000
	ldsha	[%i2+%o4]0x89,%l5	! %l5 = 0000000000000000
!	%f22 = 000000ff, %f28 = 00000000, %f6  = a52e7e04 ff1edd19
	fsmuld	%f22,%f28,%f6 		! %f6  = 00000000 00000000
!	%l3 = 0000000000003c4b, %l1 = c70ebb8002aad8ec, %l6 = 00000000e436b160
	add	%l3,%l1,%l6		! %l6 = c70ebb8002ab1537
!	Mem[0000000030081408] = 0000000000000000, %l3 = 0000000000003c4b
	ldxa	[%i2+%o4]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000030081410] = 2e000000, %l1 = c70ebb8002aad8ec
	ldsha	[%i2+%o5]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000010141420] = ae9a2bfc, %l5 = 0000000000000000
	ldsba	[%i5+0x020]%asi,%l5	! %l5 = ffffffffffffffae
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1410] = ffffff0b, %l5 = ffffffffffffffae
	ldstuba	[%i3+%o5]0x89,%l5	! %l5 = 0000000b000000ff

p0_label_156:
!	%l3 = 0000000000000000, imm = fffffffffffff914, %l3 = 0000000000000000
	or	%l3,-0x6ec,%l3		! %l3 = fffffffffffff914
!	%l4 = ffffffff, %l5 = 0000000b, Mem[0000000010141410] = 000000ff ffffffff
	stda	%l4,[%i5+%o5]0x80	! Mem[0000000010141410] = ffffffff 0000000b
!	%l0 = fc3aecb032de6c22, %l4 = ffffffffffffffff, %l3 = fffffffffffff914
	add	%l0,%l4,%l3		! %l3 = fc3aecb032de6c21
!	%f14 = 57000000, %f23 = 9e7c1543, %f14 = 57000000
	fadds	%f14,%f23,%f14		! %f14 = 57000000
!	Mem[0000000010181400] = 00000000, %l2 = ffffffffffffff0b
	swapa	[%i6+%g0]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000010181408] = 00000084, %l5 = 000000000000000b
	ldstuba	[%i6+%o4]0x88,%l5	! %l5 = 00000084000000ff
!	%f2  = 10302700 00000000, %l7 = 0000000084f172db
!	Mem[0000000030081410] = 0000002e2ad5bc94
	add	%i2,0x010,%g1
	stda	%f2,[%g1+%l7]ASI_PST32_SL ! Mem[0000000030081410] = 0000000000273010
!	%l5 = 0000000000000084, Mem[0000000030001408] = 000000ff
	stba	%l5,[%i0+%o4]0x89	! Mem[0000000030001408] = 00000084
!	Mem[0000000030181410] = 00000000, %l5 = 0000000000000084
	ldstuba	[%i6+%o5]0x81,%l5	! %l5 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = ff000000, %l2 = 0000000000000000
	lduba	[%i5+%o4]0x81,%l2	! %l2 = 00000000000000ff

p0_label_157:
!	Mem[00000000211c0000] = bc84e5a1, %l7 = 0000000084f172db
	ldsba	[%o2+0x000]%asi,%l7	! %l7 = ffffffffffffffbc
!	Mem[0000000010001400] = 00000000, %l4 = ffffffffffffffff
	lduha	[%i0+%g0]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000010081410] = 0000ff0b, %l0 = fc3aecb032de6c22
	ldsba	[%i2+%o5]0x88,%l0	! %l0 = 000000000000000b
!	Mem[0000000030181408] = c38122ff, %l0 = 000000000000000b
	ldswa	[%i6+%o4]0x89,%l0	! %l0 = ffffffffc38122ff
!	Mem[0000000010101400] = 00000000, %l5 = 0000000000000000
	ldsba	[%i4+%g0]0x80,%l5	! %l5 = 0000000000000000
!	Mem[00000000100c1400] = 00000000 000000ff, %l4 = 00000000, %l5 = 00000000
	ldda	[%i3+%g0]0x88,%l4	! %l4 = 00000000000000ff 0000000000000000
!	Mem[00000000100c140c] = db72f184, %l7 = ffffffffffffffbc
	lduba	[%i3+0x00c]%asi,%l7	! %l7 = 00000000000000db
!	Mem[0000000010141408] = 0000002e, %l7 = 00000000000000db
	lduba	[%i5+%o4]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000010041408] = 00000000 e436b160, %l2 = 000000ff, %l3 = 32de6c21
	ldda	[%i1+0x008]%asi,%l2	! %l2 = 0000000000000000 00000000e436b160
!	Starting 10 instruction Store Burst
!	%f26 = ff000057, %f29 = e436b160, %f24 = ff2281c3
	fadds	%f26,%f29,%f24		! %f24 = ff000057

p0_label_158:
!	%l7 = 0000000000000000, Mem[0000000010141400] = ff000334dbffffff
	stxa	%l7,[%i5+%g0]0x80	! Mem[0000000010141400] = 0000000000000000
!	%f6  = 00000000 00000000, Mem[0000000030081400] = 94bcd52a e98c78d8
	stda	%f6 ,[%i2+%g0]0x81	! Mem[0000000030081400] = 00000000 00000000
!	%l3 = 00000000e436b160, Mem[0000000010101408] = 000000ff
	stwa	%l3,[%i4+%o4]0x88	! Mem[0000000010101408] = e436b160
!	%l6 = c70ebb8002ab1537, Mem[0000000010041400] = ff009558
	stba	%l6,[%i1+%g0]0x80	! Mem[0000000010041400] = 37009558
!	Mem[0000000030141408] = 000000ff, %l6 = c70ebb8002ab1537
	ldstuba	[%i5+%o4]0x89,%l6	! %l6 = 000000ff000000ff
!	Mem[00000000211c0000] = bc84e5a1, %l4 = 00000000000000ff
	ldstuba	[%o2+0x000]%asi,%l4	! %l4 = 000000bc000000ff
!	Mem[0000000030141408] = 000000ff, %l7 = 0000000000000000
	lduwa	[%i5+%o4]0x89,%l7	! %l7 = 00000000000000ff
!	%l7 = 00000000000000ff, Mem[0000000010041400] = 37009558
	stw	%l7,[%i1+%g0]		! Mem[0000000010041400] = 000000ff
!	%l4 = 00000000000000bc, Mem[0000000010101408] = ff2281c3e436b160
	stxa	%l4,[%i4+%o4]0x88	! Mem[0000000010101408] = 00000000000000bc
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = 000000ff, %l7 = 00000000000000ff
	ldsba	[%i2+%g0]0x88,%l7	! %l7 = ffffffffffffffff

p0_label_159:
!	Mem[0000000010101408] = bc000000, %l2 = 0000000000000000
	lduwa	[%i4+%o4]0x80,%l2	! %l2 = 00000000bc000000
!	Mem[0000000010041400] = 000000ff, %l6 = 00000000000000ff
	lduba	[%i1+0x001]%asi,%l6	! %l6 = 0000000000000000
!	Mem[0000000010101410] = ff0b0334, %l0 = ffffffffc38122ff
	ldswa	[%i4+%o5]0x80,%l0	! %l0 = ffffffffff0b0334
!	Mem[0000000030081408] = 00000000 00000000, %l0 = ff0b0334, %l1 = 00000000
	ldda	[%i2+%o4]0x89,%l0	! %l0 = 0000000000000000 0000000000000000
!	Mem[00000000211c0000] = ff84e5a1, %l7 = ffffffffffffffff
	lduh	[%o2+%g0],%l7		! %l7 = 000000000000ff84
!	Mem[0000000010001410] = ff000000 6f000062, %l6 = 00000000, %l7 = 0000ff84
	ldda	[%i0+%o5]0x88,%l6	! %l6 = 000000006f000062 00000000ff000000
!	Mem[0000000030041408] = c7ff0000, %l3 = 00000000e436b160
	ldswa	[%i1+%o4]0x89,%l3	! %l3 = ffffffffc7ff0000
!	Mem[0000000010081408] = 3c4bffd5, %l6 = 000000006f000062
	ldub	[%i2+0x009],%l6		! %l6 = 000000000000004b
!	Mem[0000000030101410] = 00000000 e3000000, %l0 = 00000000, %l1 = 00000000
	ldda	[%i4+%o5]0x89,%l0	! %l0 = 00000000e3000000 0000000000000000
!	Starting 10 instruction Store Burst
!	%l7 = 00000000ff000000, Mem[0000000010081400] = ff000000
	stha	%l7,[%i2+%g0]0x80	! Mem[0000000010081400] = 00000000

p0_label_160:
!	%f22 = 000000ff 9e7c1543, Mem[0000000010081400] = 00000000 e436b160
	stda	%f22,[%i2+%g0]0x80	! Mem[0000000010081400] = 000000ff 9e7c1543
!	%l0 = 00000000e3000000, Mem[0000000030101400] = 0000ffd5
	stwa	%l0,[%i4+%g0]0x89	! Mem[0000000030101400] = e3000000
!	%f7  = 00000000, Mem[0000000010041408] = 00000000
	sta	%f7 ,[%i1+%o4]0x88	! Mem[0000000010041408] = 00000000
!	%l5 = 0000000000000000, immd = fffffffffffff813, %l6 = 000000000000004b
	sdivx	%l5,-0x7ed,%l6		! %l6 = 0000000000000000
!	%l0 = 00000000e3000000, Mem[0000000030141408] = ff000000
	stwa	%l0,[%i5+%o4]0x81	! Mem[0000000030141408] = e3000000
!	%l2 = 00000000bc000000, Mem[0000000010041408] = 00000000e436b160
	stxa	%l2,[%i1+%o4]0x80	! Mem[0000000010041408] = 00000000bc000000
!	%l4 = 00000000000000bc, Mem[0000000010001420] = ff000000e436b160, %asi = 80
	stxa	%l4,[%i0+0x020]%asi	! Mem[0000000010001420] = 00000000000000bc
!	Mem[0000000010141439] = ff592c9f, %l6 = 0000000000000000
	ldstuba	[%i5+0x039]%asi,%l6	! %l6 = 00000059000000ff
!	%f0  = 37c3a13c c38122ff, Mem[0000000030181400] = ff000000 00000000
	stda	%f0 ,[%i6+%g0]0x81	! Mem[0000000030181400] = 37c3a13c c38122ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = 2e000000, %l3 = ffffffffc7ff0000
	lduwa	[%i5+%o4]0x88,%l3	! %l3 = 000000002e000000

p0_label_161:
!	%l6 = 0000000000000059, imm = 00000000000006d6, %l2 = 00000000bc000000
	addc	%l6,0x6d6,%l2		! %l2 = 000000000000072f
!	Mem[0000000030041410] = bc3400000000ff0b, %f6  = 00000000 00000000
	ldda	[%i1+%o5]0x89,%f6 	! %f6  = bc340000 0000ff0b
!	Mem[00000000100c1400] = 000000ff, %f4  = 00000000
	lda	[%i3+%g0]0x88,%f4 	! %f4 = 000000ff
!	Mem[0000000010181438] = 000003d2, %f15 = 00000000
	ld	[%i6+0x038],%f15	! %f15 = 000003d2
!	Mem[00000000211c0000] = ff84e5a1, %l7 = 00000000ff000000
	lduba	[%o2+0x000]%asi,%l7	! %l7 = 00000000000000ff
!	Mem[000000001018142c] = 00000055, %f16 = 00273010
	ld	[%i6+0x02c],%f16	! %f16 = 00000055
!	Mem[0000000010041400] = 000000ff34697300, %l2 = 000000000000072f
	ldxa	[%i1+0x000]%asi,%l2	! %l2 = 000000ff34697300
!	Mem[0000000030141400] = 10302700, %l7 = 00000000000000ff
	lduba	[%i5+%g0]0x81,%l7	! %l7 = 0000000000000010
!	Mem[0000000010101408] = bc00000000000000, %l6 = 0000000000000059
	ldx	[%i4+%o4],%l6		! %l6 = bc00000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000020800041] = 1e2af99a, %l0 = 00000000e3000000
	ldstub	[%o1+0x041],%l0		! %l0 = 0000002a000000ff

p0_label_162:
!	Mem[0000000030081408] = 00000000, %l5 = 0000000000000000
	ldstuba	[%i2+%o4]0x89,%l5	! %l5 = 00000000000000ff
!	%l4 = 00000000000000bc, Mem[00000000100c1410] = 000000ff
	stha	%l4,[%i3+%o5]0x80	! Mem[00000000100c1410] = 00bc00ff
!	%l0 = 000000000000002a, Mem[0000000010141400] = 00000000
	stha	%l0,[%i5+%g0]0x88	! Mem[0000000010141400] = 0000002a
!	%l5 = 0000000000000000, Mem[0000000030141400] = 10302700
	stha	%l5,[%i5+%g0]0x81	! Mem[0000000030141400] = 00002700
!	%l5 = 0000000000000000, Mem[0000000010081438] = ffd5b81b57000000
	stx	%l5,[%i2+0x038]		! Mem[0000000010081438] = 0000000000000000
!	%l2 = 000000ff34697300, Mem[0000000010141400] = 2a000000
	stha	%l2,[%i5+%g0]0x80	! Mem[0000000010141400] = 73000000
!	%f21 = 0000ff0b, %f13 = 000000ff, %f24 = ff000057
	fsubs	%f21,%f13,%f24		! %l0 = 000000000000004c, Unfinished, %fsr = 2100000800
!	Mem[0000000010141410] = ffffffff, %l4 = 00000000000000bc
	swapa	[%i5+%o5]0x88,%l4	! %l4 = 00000000ffffffff
!	%l6 = bc00000000000000, Mem[0000000010141400] = 73000000
	stba	%l6,[%i5+%g0]0x80	! Mem[0000000010141400] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = ffffffff4b3c0000, %f20 = 00000000 0000ff0b
	ldda	[%i3+%o5]0x81,%f20	! %f20 = ffffffff 4b3c0000

p0_label_163:
!	%l0 = 000000000000004c, imm = fffffffffffff518, %l1 = 0000000000000000
	orn	%l0,-0xae8,%l1		! %l1 = 0000000000000aef
!	Mem[0000000030001408] = 00000084, %l1 = 0000000000000aef
	lduwa	[%i0+%o4]0x89,%l1	! %l1 = 0000000000000084
!	Mem[0000000030181408] = ff2281c39e7c1543, %f16 = 00000055 a52e7e04
	ldda	[%i6+%o4]0x81,%f16	! %f16 = ff2281c3 9e7c1543
!	Mem[0000000010001408] = 00000000a52e7e04, %l3 = 000000002e000000
	ldxa	[%i0+%o4]0x80,%l3	! %l3 = 00000000a52e7e04
!	Mem[0000000030001400] = 37c3a13c, %l2 = 000000ff34697300
	lduwa	[%i0+%g0]0x81,%l2	! %l2 = 0000000037c3a13c
!	%l1 = 0000000000000084, %l3 = 00000000a52e7e04, %l2 = 0000000037c3a13c
	and	%l1,%l3,%l2		! %l2 = 0000000000000004
!	Mem[0000000010101400] = 00000000, %l3 = 00000000a52e7e04
	ldswa	[%i4+%g0]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000010101410] = 34030bff, %l1 = 0000000000000084
	lduwa	[%i4+%o5]0x88,%l1	! %l1 = 0000000034030bff
!	Mem[0000000010041410] = ff000000, %l4 = 00000000ffffffff
	lduw	[%i1+%o5],%l4		! %l4 = 00000000ff000000
!	Starting 10 instruction Store Burst
!	%l2 = 0000000000000004, Mem[0000000030141400] = 0000000000270000
	stxa	%l2,[%i5+%g0]0x89	! Mem[0000000030141400] = 0000000000000004

p0_label_164:
!	Mem[0000000030081408] = 000000ff, %l7 = 0000000000000010
	swapa	[%i2+%o4]0x89,%l7	! %l7 = 00000000000000ff
!	%f8  = 00000000 00000000, Mem[0000000030181400] = 3ca1c337 ff2281c3
	stda	%f8 ,[%i6+%g0]0x89	! Mem[0000000030181400] = 00000000 00000000
!	%l5 = 0000000000000000, immed = 00000623, %y  = 00000000
	sdiv	%l5,0x623,%l1		! %l1 = 0000000000000000
	mov	%l0,%y			! %y = 0000004c
!	%l4 = 00000000ff000000, immed = fffff829, %y  = 0000004c
	smul	%l4,-0x7d7,%l6		! %l6 = 00000007d7000000, %y = 00000007
!	Mem[00000000100c1408] = e436b160, %l6 = 00000007d7000000
	swapa	[%i3+%o4]0x88,%l6	! %l6 = 00000000e436b160
!	Mem[0000000030081408] = 10000000, %l3 = 0000000000000000
	ldstuba	[%i2+%o4]0x81,%l3	! %l3 = 00000010000000ff
!	%l6 = 00000000e436b160, Mem[0000000030181410] = 000000ff
	stba	%l6,[%i6+%o5]0x89	! Mem[0000000030181410] = 00000060
!	%f27 = 00000000, Mem[0000000010101410] = 34030bff
	sta	%f27,[%i4+%o5]0x88	! Mem[0000000010101410] = 00000000
!	Code Fragment 4
p0_fragment_16:
!	%l0 = 000000000000004c
	setx	0xc6ab44104a20627c,%g7,%l0 ! %l0 = c6ab44104a20627c
!	%l1 = 0000000000000000
	setx	0x7f31808fe816b8e3,%g7,%l1 ! %l1 = 7f31808fe816b8e3
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = c6ab44104a20627c
	setx	0x5127a88874a27503,%g7,%l0 ! %l0 = 5127a88874a27503
!	%l1 = 7f31808fe816b8e3
	setx	0xdaf85b4fe0adcb29,%g7,%l1 ! %l1 = daf85b4fe0adcb29
!	Starting 10 instruction Load Burst
!	Mem[0000000020800000] = ffffe062, %l3 = 0000000000000010
	ldub	[%o1+%g0],%l3		! %l3 = 00000000000000ff

p0_label_165:
!	Mem[0000000010081430] = 0000009f, %l7 = 00000000000000ff
	ldswa	[%i2+0x030]%asi,%l7	! %l7 = 000000000000009f
!	Mem[0000000010001408] = 00000000, %l0 = 5127a88874a27503
	lduba	[%i0+%o4]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000010181400] = ffffff0b, %l4 = 00000000ff000000
	ldswa	[%i6+%g0]0x80,%l4	! %l4 = ffffffffffffff0b
!	Mem[0000000030081410] = 00000000, %l4 = ffffffffffffff0b
	ldsha	[%i2+%o5]0x89,%l4	! %l4 = 0000000000000000
!	Mem[00000000201c0000] = ffff01ce, %l4 = 0000000000000000
	ldsba	[%o0+0x000]%asi,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000030101408] = 000000ff, %l6 = 00000000e436b160
	lduha	[%i4+%o4]0x89,%l6	! %l6 = 00000000000000ff
!	%f10 = 088d03d2 000000e3, %f0  = 37c3a13c c38122ff
	fdtox	%f10,%f0 		! %f0  = 00000000 00000000
!	Mem[0000000030081410] = 00000000, %f14 = 57000000
	lda	[%i2+%o5]0x89,%f14	! %f14 = 00000000
	membar	#Sync			! Added by membar checker (20)
!	Mem[0000000010101400] = 00000000 10302700 bc000000 00000000
!	Mem[0000000010101410] = 00000000 00000000 a9fc6c60 6f13569c
!	Mem[0000000010101420] = 00736934 00000000 29eaa2e2 047e2ea5
!	Mem[0000000010101430] = 088d03d2 000000e3 00000000 00000000
	ldda	[%i4]ASI_BLK_AIUPL,%f0	! Block Load from 0000000010101400
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (21)
!	%l7 = 000000000000009f, Mem[0000000010101410] = 00000000
	stha	%l7,[%i4+%o5]0x88	! Mem[0000000010101410] = 0000009f

p0_label_166:
!	%f8  = 00000000 34697300, %l6 = 00000000000000ff
!	Mem[0000000030101418] = 7222bb94da7c4b0c
	add	%i4,0x018,%g1
	stda	%f8,[%g1+%l6]ASI_PST32_SL ! Mem[0000000030101418] = 0073693400000000
!	%l1 = daf85b4fe0adcb29, Mem[0000000010181410] = d5ff4b3c
	stba	%l1,[%i6+%o5]0x80	! Mem[0000000010181410] = 29ff4b3c
!	%l7 = 000000000000009f, Mem[0000000030101410] = 000000e3
	stba	%l7,[%i4+%o5]0x81	! Mem[0000000030101410] = 9f0000e3
!	%f4  = 00000000 00000000, %l5 = 0000000000000000
!	Mem[0000000010141438] = ffff2c9f19dd1ed0
	add	%i5,0x038,%g1
	stda	%f4,[%g1+%l5]ASI_PST32_PL ! Mem[0000000010141438] = ffff2c9f19dd1ed0
!	Mem[0000000030181408] = c38122ff, %l1 = daf85b4fe0adcb29
	swapa	[%i6+%o4]0x89,%l1	! %l1 = 00000000c38122ff
!	%f16 = ff2281c3 9e7c1543, Mem[0000000010001400] = 00000000 00000000
	stda	%f16,[%i0+%g0]0x80	! Mem[0000000010001400] = ff2281c3 9e7c1543
!	%l7 = 000000000000009f, Mem[0000000010101408] = bc000000
	stba	%l7,[%i4+%o4]0x80	! Mem[0000000010101408] = 9f000000
!	%l7 = 000000000000009f, Mem[00000000201c0000] = ffff01ce, %asi = 80
	stha	%l7,[%o0+0x000]%asi	! Mem[00000000201c0000] = 009f01ce
!	%l7 = 000000000000009f, Mem[0000000030181400] = 00000000
	stba	%l7,[%i6+%g0]0x89	! Mem[0000000030181400] = 0000009f
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = 0000ffc7, %f21 = 4b3c0000
	lda	[%i1+%o4]0x81,%f21	! %f21 = 0000ffc7

p0_label_167:
!	Mem[0000000030141400] = 04000000 00000000 e3000000 00273010
!	Mem[0000000030141410] = ff000000 00000000 19dd1eff 047e2ea5
!	Mem[0000000030141420] = 00000000 00000000 e3000000 d2038d08
!	Mem[0000000030141430] = 60b136e4 db72f184 00000000 00000057
	ldda	[%i5]ASI_BLK_AIUSL,%f16	! Block Load from 0000000030141400
!	Mem[0000000030181410] = 00000060, %l4 = ffffffffffffffff
	lduha	[%i6+%o5]0x89,%l4	! %l4 = 0000000000000060
!	Mem[0000000010181400] = ffffff0b, %l5 = 0000000000000000
	ldsba	[%i6+%g0]0x80,%l5	! %l5 = ffffffffffffffff
!	Mem[00000000100c1410] = ff00bc00, %l4 = 0000000000000060
	ldsba	[%i3+%o5]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000010081410] = 0bff0000, %l2 = 0000000000000004
	ldsba	[%i2+%o5]0x80,%l2	! %l2 = 000000000000000b
!	Mem[0000000010181410] = 29ff4b3c, %l7 = 000000000000009f
	ldsha	[%i6+%o5]0x80,%l7	! %l7 = 00000000000029ff
!	%f0  = 00273010, %f14 = 00000000, %f7  = 606cfca9
	fsubs	%f0 ,%f14,%f7 		! %l0 = 0000000000000022, Unfinished, %fsr = 2100000800
!	Mem[0000000010041410] = ff000000, %l6 = 00000000000000ff
	ldsba	[%i1+%o5]0x80,%l6	! %l6 = ffffffffffffffff
!	Mem[00000000100c1414] = 00000000, %l3 = 00000000000000ff
	ldsh	[%i3+0x014],%l3		! %l3 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f2  = 00000000 000000bc, Mem[0000000010081438] = 00000000 00000000
	std	%f2 ,[%i2+0x038]	! Mem[0000000010081438] = 00000000 000000bc

p0_label_168:
!	%l3 = 0000000000000000, Mem[00000000211c0001] = ff84e5a1, %asi = 80
	stba	%l3,[%o2+0x001]%asi	! Mem[00000000211c0000] = ff00e5a1
!	Mem[0000000010001408] = 00000000, %l6 = ffffffffffffffff
	ldstuba	[%i0+%o4]0x80,%l6	! %l6 = 00000000000000ff
!	%l3 = 0000000000000000, %l7 = 00000000000029ff, %y  = 00000007
	smul	%l3,%l7,%l7		! %l7 = 0000000000000000, %y = 00000000
!	%l0 = 0000000000000022, Mem[00000000211c0000] = ff00e5a1
	sth	%l0,[%o2+%g0]		! Mem[00000000211c0000] = 0022e5a1
!	Mem[0000000010041400] = 000000ff, %l6 = 0000000000000000
	ldstuba	[%i1+%g0]0x80,%l6	! %l6 = 00000000000000ff
!	%l4 = 0000000000000000, Mem[0000000010101408] = 0000009f
	stba	%l4,[%i4+%o4]0x88	! Mem[0000000010101408] = 00000000
!	Mem[0000000010001400] = ff2281c3, %l5 = ffffffffffffffff
	swapa	[%i0+%g0]0x80,%l5	! %l5 = 00000000ff2281c3
!	%l7 = 0000000000000000, Mem[0000000030181400] = 0000009f
	stwa	%l7,[%i6+%g0]0x89	! Mem[0000000030181400] = 00000000
!	Mem[00000000100c141c] = 606cfca9, %l4 = 0000000000000000
	swap	[%i3+0x01c],%l4		! %l4 = 00000000606cfca9
!	Starting 10 instruction Load Burst
!	Mem[0000000020800000] = ffffe062, %l3 = 0000000000000000
	ldub	[%o1+0x001],%l3		! %l3 = 00000000000000ff

p0_label_169:
!	Mem[0000000010181410] = 29ff4b3c, %l1 = 00000000c38122ff
	lduwa	[%i6+%o5]0x80,%l1	! %l1 = 0000000029ff4b3c
!	Mem[00000000201c0000] = 009f01ce, %l2 = 000000000000000b
	ldsh	[%o0+%g0],%l2		! %l2 = 000000000000009f
!	Mem[0000000030141410] = ff000000 00000000, %l0 = 00000022, %l1 = 29ff4b3c
	ldda	[%i5+%o5]0x81,%l0	! %l0 = 00000000ff000000 0000000000000000
!	Mem[0000000021800080] = 18f59b02, %l3 = 00000000000000ff
	ldub	[%o3+0x080],%l3		! %l3 = 0000000000000018
!	Mem[0000000010141408] = 0000002e2ad50062, %l3 = 0000000000000018
	ldxa	[%i5+%o4]0x80,%l3	! %l3 = 0000002e2ad50062
!	Mem[00000000100c1410] = 00000000ff00bc00, %f6  = 9c56136f 606cfca9
	ldda	[%i3+%o5]0x88,%f6 	! %f6  = 00000000 ff00bc00
!	Mem[0000000010081400] = 43157c9e ff000000, %l4 = 606cfca9, %l5 = ff2281c3
	ldda	[%i2+%g0]0x88,%l4	! %l4 = 00000000ff000000 0000000043157c9e
!	Mem[0000000010101410] = 9f000000 00000000, %l4 = ff000000, %l5 = 43157c9e
	ldda	[%i4+%o5]0x80,%l4	! %l4 = 000000009f000000 0000000000000000
!	Mem[0000000010101400] = 00000000, %l0 = 00000000ff000000
	lduha	[%i4+%g0]0x80,%l0	! %l0 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030101400] = 000000e3, %l7 = 0000000000000000
	ldstuba	[%i4+%g0]0x81,%l7	! %l7 = 00000000000000ff

p0_label_170:
!	Mem[0000000030101408] = ff000000, %l4 = 000000009f000000
	swapa	[%i4+%o4]0x81,%l4	! %l4 = 00000000ff000000
!	Mem[0000000010001400] = ffffffff, %l6 = 0000000000000000
	ldstuba	[%i0+%g0]0x80,%l6	! %l6 = 000000ff000000ff
!	%f10 = a52e7e04, Mem[0000000010141404] = 00000000
	st	%f10,[%i5+0x004]	! Mem[0000000010141404] = a52e7e04
	membar	#Sync			! Added by membar checker (22)
!	%f14 = 00000000 00000000, Mem[0000000030141408] = 000000e3 10302700
	stda	%f14,[%i5+%o4]0x89	! Mem[0000000030141408] = 00000000 00000000
!	Mem[0000000030041400] = 000000e3, %l6 = 00000000000000ff
	ldstuba	[%i1+%g0]0x89,%l6	! %l6 = 000000e3000000ff
!	Mem[0000000010001410] = 6f000062, %l7 = 0000000000000000
	ldstuba	[%i0+%o5]0x88,%l7	! %l7 = 00000062000000ff
!	%f6  = 00000000 ff00bc00, Mem[0000000010181408] = ff000000 000000ff
	stda	%f6 ,[%i6+%o4]0x80	! Mem[0000000010181408] = 00000000 ff00bc00
!	%l3 = 0000002e2ad50062, Mem[0000000010181408] = 00000000
	stwa	%l3,[%i6+%o4]0x80	! Mem[0000000010181408] = 2ad50062
!	Mem[00000000201c0000] = 009f01ce, %l7 = 0000000000000062
	ldstuba	[%o0+0x000]%asi,%l7	! %l7 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = 84000000, %l0 = 0000000000000000
	lduba	[%i0+%o4]0x81,%l0	! %l0 = 0000000000000084

p0_label_171:
!	Mem[0000000010081400] = 000000ff, %l1 = 0000000000000000
	lduba	[%i2+%g0]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000010081410] = 0bff0000, %l1 = 0000000000000000
	lduba	[%i2+%o5]0x80,%l1	! %l1 = 000000000000000b
!	Mem[0000000010041410] = 000000ff, %l2 = 000000000000009f
	lduha	[%i1+%o5]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010141438] = ffff2c9f, %l2 = 00000000000000ff
	ldswa	[%i5+0x038]%asi,%l2	! %l2 = ffffffffffff2c9f
!	Mem[0000000010001400] = ffffffff, %l4 = 00000000ff000000
	lduha	[%i0+%g0]0x80,%l4	! %l4 = 000000000000ffff
!	Mem[0000000010141430] = cbf14adb1560aefe, %f0  = 00273010 00000000
	ldd	[%i5+0x030],%f0 	! %f0  = cbf14adb 1560aefe
!	Mem[0000000030181410] = 6000000000000000, %f6  = 00000000 ff00bc00
	ldda	[%i6+%o5]0x81,%f6 	! %f6  = 60000000 00000000
!	Mem[00000000100c1400] = 000000ff, %l1 = 000000000000000b
	ldstuba	[%i3+%g0]0x88,%l1	! %l1 = 000000ff000000ff
!	Mem[0000000010101410] = 9f00000000000000, %l6 = 00000000000000e3
	ldxa	[%i4+%o5]0x80,%l6	! %l6 = 9f00000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010041413] = ff000000, %l5 = 0000000000000000
	ldstuba	[%i1+0x013]%asi,%l5	! %l5 = 00000000000000ff

p0_label_172:
!	Mem[0000000030001408] = 00000084, %l5 = 0000000000000000
	swapa	[%i0+%o4]0x89,%l5	! %l5 = 0000000000000084
!	Mem[0000000030101400] = ff0000e3, %l1 = 00000000000000ff
	swapa	[%i4+%g0]0x81,%l1	! %l1 = 00000000ff0000e3
!	%l6 = 9f00000000000000, Mem[0000000010101408] = 0000000000000000
	stxa	%l6,[%i4+%o4]0x88	! Mem[0000000010101408] = 9f00000000000000
!	%l7 = 0000000000000000, Mem[0000000030041408] = 1e25229fc7ff0000
	stxa	%l7,[%i1+%o4]0x89	! Mem[0000000030041408] = 0000000000000000
!	%f0  = cbf14adb 1560aefe 00000000 000000bc
!	%f4  = 00000000 00000000 60000000 00000000
!	%f8  = 00000000 34697300 a52e7e04 e2a2ea29
!	%f12 = e3000000 d2038d08 00000000 00000000
	stda	%f0,[%i1]ASI_BLK_PL	! Block Store to 0000000010041400
!	%l5 = 0000000000000084, Mem[0000000020800000] = ffffe062, %asi = 80
	stha	%l5,[%o1+0x000]%asi	! Mem[0000000020800000] = 0084e062
!	%l4 = 000000000000ffff, Mem[0000000020800000] = 0084e062
	sth	%l4,[%o1+%g0]		! Mem[0000000020800000] = ffffe062
!	%f26 = 088d03d2 000000e3, Mem[0000000030001408] = 00000000 7f180000
	stda	%f26,[%i0+%o4]0x81	! Mem[0000000030001408] = 088d03d2 000000e3
!	%l1 = 00000000ff0000e3, Mem[00000000300c1408] = c3c6fe397c000000
	stxa	%l1,[%i3+%o4]0x89	! Mem[00000000300c1408] = 00000000ff0000e3
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = ffffff0b, %l5 = 0000000000000084
	lduwa	[%i6+%g0]0x80,%l5	! %l5 = 00000000ffffff0b

p0_label_173:
!	Mem[0000000010101410] = 9f000000, %l6 = 9f00000000000000
	ldswa	[%i4+0x010]%asi,%l6	! %l6 = ffffffff9f000000
!	Mem[0000000030041410] = 0000ff0b, %l2 = ffffffffffff2c9f
	ldsba	[%i1+%o5]0x89,%l2	! %l2 = 000000000000000b
!	Mem[0000000030101400] = 000000ffffffffff, %l2 = 000000000000000b
	ldxa	[%i4+%g0]0x81,%l2	! %l2 = 000000ffffffffff
!	Mem[0000000030141410] = 000000ff, %l7 = 0000000000000000
	lduwa	[%i5+%o5]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010001400] = ffffffff, %l2 = 000000ffffffffff
	lduwa	[%i0+%g0]0x80,%l2	! %l2 = 00000000ffffffff
!	Mem[00000000100c1400] = 000000ff, %l2 = 00000000ffffffff
	ldsba	[%i3+%g0]0x88,%l2	! %l2 = ffffffffffffffff
!	Code Fragment 3
p0_fragment_17:
!	%l0 = 0000000000000084
	setx	0x90bc69c7a1377522,%g7,%l0 ! %l0 = 90bc69c7a1377522
!	%l1 = 00000000ff0000e3
	setx	0xcd4ef497d00285a7,%g7,%l1 ! %l1 = cd4ef497d00285a7
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 90bc69c7a1377522
	setx	0xbaed6f0814c77d62,%g7,%l0 ! %l0 = baed6f0814c77d62
!	%l1 = cd4ef497d00285a7
	setx	0x65a7398079efae30,%g7,%l1 ! %l1 = 65a7398079efae30
!	Mem[0000000030041408] = 00000000, %l6 = ffffffff9f000000
	ldsha	[%i1+%o4]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000010181414] = 00000000, %l1 = 65a7398079efae30
	ldsw	[%i6+0x014],%l1		! %l1 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030141408] = 00000000, %l1 = 0000000000000000
	ldstuba	[%i5+%o4]0x81,%l1	! %l1 = 00000000000000ff

p0_label_174:
!	Mem[0000000010081410] = 0bff0000, %l1 = 0000000000000000
	swapa	[%i2+%o5]0x80,%l1	! %l1 = 000000000bff0000
!	%f26 = 088d03d2, Mem[00000000100c1404] = 00000000
	sta	%f26,[%i3+0x004]%asi	! Mem[00000000100c1404] = 088d03d2
!	Mem[0000000030181408] = e0adcb29, %l0 = baed6f0814c77d62
	ldstuba	[%i6+%o4]0x89,%l0	! %l0 = 00000029000000ff
!	%f28 = 84f172db, Mem[0000000010081414] = a287ffff
	st	%f28,[%i2+0x014]	! Mem[0000000010081414] = 84f172db
!	%l4 = 000000000000ffff, Mem[0000000010101410] = 0000009f
	stba	%l4,[%i4+%o5]0x88	! Mem[0000000010101410] = 000000ff
!	Mem[00000000211c0001] = 0022e5a1, %l3 = 0000002e2ad50062
	ldstuba	[%o2+0x001]%asi,%l3	! %l3 = 00000022000000ff
!	%f0  = cbf14adb 1560aefe, Mem[00000000300c1400] = 70b4b1ff 00000000
	stda	%f0 ,[%i3+%g0]0x89	! Mem[00000000300c1400] = cbf14adb 1560aefe
!	Mem[0000000021800000] = 00ff18df, %l3 = 0000000000000022
	ldstub	[%o3+%g0],%l3		! %l3 = 00000000000000ff
!	%f27 = 000000e3, %f23 = ff1edd19, %f24 = 00000000
	fadds	%f27,%f23,%f24		! %l0 = 000000000000004b, Unfinished, %fsr = 2100000800
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = 43157c9e e0adcbff, %l2 = ffffffff, %l3 = 00000000
	ldda	[%i6+%o4]0x89,%l2	! %l2 = 00000000e0adcbff 0000000043157c9e

p0_label_175:
!	Mem[0000000010081410] = 00000000, %l6 = 0000000000000000
	ldswa	[%i2+0x010]%asi,%l6	! %l6 = 0000000000000000
!	Mem[0000000010141400] = 00000000 a52e7e04, %l2 = e0adcbff, %l3 = 43157c9e
	ldda	[%i5+%g0]0x80,%l2	! %l2 = 0000000000000000 00000000a52e7e04
!	Mem[0000000010141410] = 000000bc, %l6 = 0000000000000000
	ldsba	[%i5+%o5]0x88,%l6	! %l6 = ffffffffffffffbc
!	Mem[0000000010081400] = 000000ff, %l2 = 0000000000000000
	lduba	[%i2+%g0]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000030141400] = 0400000000000000, %l6 = ffffffffffffffbc
	ldxa	[%i5+%g0]0x81,%l6	! %l6 = 0400000000000000
!	Mem[0000000010101410] = 00000000000000ff, %f28 = 84f172db e436b160
	ldda	[%i4+%o5]0x88,%f28	! %f28 = 00000000 000000ff
!	Mem[0000000030101410] = 00000000 e300009f, %l4 = 0000ffff, %l5 = ffffff0b
	ldda	[%i4+%o5]0x89,%l4	! %l4 = 00000000e300009f 0000000000000000
!	Mem[0000000010101408] = 00000000, %l4 = 00000000e300009f
	lduwa	[%i4+%o4]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000030181408] = e0adcbff, %l2 = 0000000000000000
	ldswa	[%i6+%o4]0x89,%l2	! %l2 = ffffffffe0adcbff
!	Starting 10 instruction Store Burst
!	%f24 = 00000000 00000000, Mem[0000000010181428] = 94bcd52a 00000055
	stda	%f24,[%i6+0x028]%asi	! Mem[0000000010181428] = 00000000 00000000

p0_label_176:
!	%f8  = 00000000 34697300, %l0 = 000000000000004b
!	Mem[00000000300c1438] = e00c2ff660bb2927
	add	%i3,0x038,%g1
	stda	%f8,[%g1+%l0]ASI_PST32_S ! Mem[00000000300c1438] = 0000000034697300
!	%l0 = 000000000000004b, Mem[0000000010001400] = ffffffff
	stba	%l0,[%i0+%g0]0x88	! Mem[0000000010001400] = ffffff4b
!	%f12 = e3000000 d2038d08, Mem[0000000030041410] = 0bff0000 000034bc
	stda	%f12,[%i1+%o5]0x81	! Mem[0000000030041410] = e3000000 d2038d08
!	Mem[0000000010141408] = 0000002e, %l7 = 00000000000000ff
	swapa	[%i5+%o4]0x80,%l7	! %l7 = 000000000000002e
!	Mem[0000000030081410] = 00000000, %l2 = ffffffffe0adcbff
	swapa	[%i2+%o5]0x81,%l2	! %l2 = 0000000000000000
!	%l5 = 0000000000000000, Mem[00000000100c1408] = d7000000
	stwa	%l5,[%i3+%o4]0x88	! Mem[00000000100c1408] = 00000000
!	%l3 = 00000000a52e7e04, Mem[00000000300c1410] = 00003c4bffffffff
	stxa	%l3,[%i3+%o5]0x89	! Mem[00000000300c1410] = 00000000a52e7e04
!	Mem[0000000030181408] = e0adcbff, %l7 = 000000000000002e
	swapa	[%i6+%o4]0x89,%l7	! %l7 = 00000000e0adcbff
!	%l2 = 0000000000000000, Mem[0000000030001408] = d2038d08
	stwa	%l2,[%i0+%o4]0x89	! Mem[0000000030001408] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = ff9f01ce, %l0 = 000000000000004b
	lduha	[%o0+0x000]%asi,%l0	! %l0 = 000000000000ff9f

p0_label_177:
!	%l1 = 000000000bff0000, %l6 = 0400000000000000, %l5 = 0000000000000000
	xnor	%l1,%l6,%l5		! %l5 = fbfffffff400ffff
!	Mem[0000000010001410] = ff00006f, %l7 = 00000000e0adcbff
	lduha	[%i0+%o5]0x80,%l7	! %l7 = 000000000000ff00
!	Mem[0000000010081430] = 0000009f, %l7 = 000000000000ff00
	ldsb	[%i2+0x031],%l7		! %l7 = 0000000000000000
!	Mem[0000000010101408] = 9f00000000000000, %l4 = 0000000000000000
	ldxa	[%i4+%o4]0x88,%l4	! %l4 = 9f00000000000000
!	Mem[0000000030081410] = 10302700ffcbade0, %f18 = 10302700 000000e3
	ldda	[%i2+%o5]0x89,%f18	! %f18 = 10302700 ffcbade0
!	Mem[0000000030001408] = e300000000000000, %l0 = 000000000000ff9f
	ldxa	[%i0+%o4]0x89,%l0	! %l0 = e300000000000000
!	Mem[0000000010101410] = 000000ff, %l2 = 0000000000000000
	ldsha	[%i4+%o5]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010001400] = ffffff4b, %f17 = 00000004
	lda	[%i0+%g0]0x88,%f17	! %f17 = ffffff4b
!	Mem[00000000100c1408] = 00000000db72f184, %f30 = 57000000 00000000
	ldda	[%i3+%o4]0x80,%f30	! %f30 = 00000000 db72f184
!	Starting 10 instruction Store Burst
!	%l3 = 00000000a52e7e04, Mem[000000001008143c] = 000000bc
	stw	%l3,[%i2+0x03c]		! Mem[000000001008143c] = a52e7e04

p0_label_178:
!	Mem[0000000010181408] = 2ad50062, %l0 = e300000000000000
	ldstuba	[%i6+%o4]0x80,%l0	! %l0 = 0000002a000000ff
	membar	#Sync			! Added by membar checker (23)
!	Mem[0000000010041404] = db4af1cb, %l3 = 00000000a52e7e04
	swap	[%i1+0x004],%l3		! %l3 = 00000000db4af1cb
!	%f18 = 10302700, %f16 = 00000000
	fcmpes	%fcc3,%f18,%f16		! %fcc3 = 2
!	%f30 = 00000000 db72f184, Mem[0000000010001430] = e436b160 00000000
	stda	%f30,[%i0+0x030]%asi	! Mem[0000000010001430] = 00000000 db72f184
!	%f18 = 10302700 ffcbade0, %l3 = 00000000db4af1cb
!	Mem[0000000030101410] = 9f0000e300000000
	add	%i4,0x010,%g1
	stda	%f18,[%g1+%l3]ASI_PST8_SL ! Mem[0000000030101410] = e0ad00ff00003010
!	%l4 = 9f00000000000000, Mem[00000000300c1408] = e30000ff00000000
	stxa	%l4,[%i3+%o4]0x81	! Mem[00000000300c1408] = 9f00000000000000
!	%f28 = 00000000 000000ff, %l4 = 9f00000000000000
!	Mem[00000000300c1428] = 423742c02b0994b6
	add	%i3,0x028,%g1
	stda	%f28,[%g1+%l4]ASI_PST16_SL ! Mem[00000000300c1428] = 423742c02b0994b6
!	%f6  = 60000000 00000000, %l7 = 0000000000000000
!	Mem[0000000010141430] = cbf14adb1560aefe
	add	%i5,0x030,%g1
	stda	%f6,[%g1+%l7]ASI_PST16_PL ! Mem[0000000010141430] = cbf14adb1560aefe
!	%l1 = 000000000bff0000, Mem[0000000010081410] = 00000000
	stha	%l1,[%i2+%o5]0x80	! Mem[0000000010081410] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = 000000ff, %l1 = 000000000bff0000
	lduwa	[%i2+%o4]0x89,%l1	! %l1 = 00000000000000ff

p0_label_179:
!	Mem[0000000010041410] = 00000000, %l3 = 00000000db4af1cb
	ldsha	[%i1+%o5]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000010001410] = ff00006f, %l3 = 0000000000000000
	lduwa	[%i0+%o5]0x80,%l3	! %l3 = 00000000ff00006f
!	Mem[0000000030041408] = 00000000, %l5 = fbfffffff400ffff
	lduwa	[%i1+%o4]0x81,%l5	! %l5 = 0000000000000000
!	%f19 = ffcbade0, %f9  = 34697300
	fcmpes	%fcc2,%f19,%f9 		! %fcc2 = 3
!	Mem[0000000010181410] = 29ff4b3c, %l0 = 000000000000002a
	ldswa	[%i6+%o5]0x80,%l0	! %l0 = 0000000029ff4b3c
!	Mem[0000000030181400] = 00000000, %l5 = 0000000000000000
	lduba	[%i6+%g0]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000010081438] = 00000000 a52e7e04, %l2 = 000000ff, %l3 = ff00006f
	ldd	[%i2+0x038],%l2		! %l2 = 0000000000000000 00000000a52e7e04
!	Mem[00000000100c1408] = 00000000, %l1 = 00000000000000ff
	ldsha	[%i3+%o4]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000030001408] = 00000000, %l6 = 0400000000000000
	lduba	[%i0+%o4]0x89,%l6	! %l6 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l2 = 00000000, %l3 = a52e7e04, Mem[0000000030101400] = 000000ff ffffffff
	stda	%l2,[%i4+%g0]0x81	! Mem[0000000030101400] = 00000000 a52e7e04

p0_label_180:
!	%f2  = 00000000, Mem[000000001014141c] = ff633403
	st	%f2 ,[%i5+0x01c]	! Mem[000000001014141c] = 00000000
!	%f22 = a52e7e04 ff1edd19, %l1 = 0000000000000000
!	Mem[0000000010101420] = 0073693400000000
	add	%i4,0x020,%g1
	stda	%f22,[%g1+%l1]ASI_PST16_P ! Mem[0000000010101420] = 0073693400000000
!	%l4 = 9f00000000000000, Mem[00000000100c1400] = ff000000088d03d2
	stxa	%l4,[%i3+%g0]0x80	! Mem[00000000100c1400] = 9f00000000000000
!	%f26 = 088d03d2 000000e3, %l3 = 00000000a52e7e04
!	Mem[0000000030101400] = 00000000a52e7e04
	stda	%f26,[%i4+%l3]ASI_PST32_S ! Mem[0000000030101400] = 00000000a52e7e04
!	%l2 = 0000000000000000, Mem[00000000100c1408] = 00000000
	stba	%l2,[%i3+%o4]0x88	! Mem[00000000100c1408] = 00000000
!	Mem[0000000010101400] = 00000000, %l6 = 0000000000000000
	swapa	[%i4+%g0]0x80,%l6	! %l6 = 0000000000000000
!	%l7 = 0000000000000000, Mem[0000000030181400] = 00000000
	stwa	%l7,[%i6+%g0]0x89	! Mem[0000000030181400] = 00000000
!	%l0 = 29ff4b3c, %l1 = 00000000, Mem[0000000030141400] = 04000000 00000000
	stda	%l0,[%i5+%g0]0x81	! Mem[0000000030141400] = 29ff4b3c 00000000
!	%f26 = 088d03d2 000000e3, Mem[00000000100c1408] = 00000000 db72f184
	stda	%f26,[%i3+%o4]0x80	! Mem[00000000100c1408] = 088d03d2 000000e3
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = 00000000000000ff, %f18 = 10302700 ffcbade0
	ldda	[%i4+%o5]0x88,%f18	! %f18 = 00000000 000000ff

p0_label_181:
!	%f11 = e2a2ea29, %f6  = 60000000, %f0  = cbf14adb 1560aefe
	fsmuld	%f11,%f6 ,%f0 		! %f0  = c8645d45 20000000
!	Mem[0000000010001408] = 000000ff, %l5 = 0000000000000000
	lduwa	[%i0+%o4]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010041408] = bc000000 00000000, %l4 = 00000000, %l5 = 000000ff
	ldda	[%i1+%o4]0x80,%l4	! %l4 = 00000000bc000000 0000000000000000
!	Mem[0000000010041420] = 00736934, %l5 = 0000000000000000
	lduha	[%i1+0x022]%asi,%l5	! %l5 = 0000000000006934
!	%l1 = 0000000000000000, imm = fffffffffffff50a, %l4 = 00000000bc000000
	xor	%l1,-0xaf6,%l4		! %l4 = fffffffffffff50a
!	Mem[0000000010041408] = bc000000, %l3 = 00000000a52e7e04
	ldswa	[%i1+%o4]0x80,%l3	! %l3 = ffffffffbc000000
!	%f14 = 00000000, %f1  = 20000000, %f8  = 00000000
	fmuls	%f14,%f1 ,%f8 		! %f8  = 00000000
!	Mem[00000000100c1408] = 088d03d2, %l5 = 0000000000006934
	lduha	[%i3+%o4]0x80,%l5	! %l5 = 000000000000088d
!	Mem[0000000010041408] = bc000000 00000000, %l2 = 00000000, %l3 = bc000000
	ldda	[%i1+%o4]0x80,%l2	! %l2 = 00000000bc000000 0000000000000000
!	Starting 10 instruction Store Burst
!	%l0 = 0000000029ff4b3c, imm = fffffffffffff62f, %l6 = 0000000000000000
	subc	%l0,-0x9d1,%l6		! %l6 = 0000000029ff550d

p0_label_182:
!	%l1 = 0000000000000000, Mem[0000000030181400] = 00000000
	stwa	%l1,[%i6+%g0]0x81	! Mem[0000000030181400] = 00000000
!	%l5 = 000000000000088d, Mem[00000000100c1428] = 00000000
	stw	%l5,[%i3+0x028]		! Mem[00000000100c1428] = 0000088d
!	%l6 = 0000000029ff550d, Mem[000000001004141c] = 00000060
	sth	%l6,[%i1+0x01c]		! Mem[000000001004141c] = 550d0060
!	%f2  = 00000000, Mem[0000000010041428] = 29eaa2e2
	sta	%f2 ,[%i1+0x028]%asi	! Mem[0000000010041428] = 00000000
!	%f18 = 00000000 000000ff, %l5 = 000000000000088d
!	Mem[0000000030001420] = ffc5215734000032
	add	%i0,0x020,%g1
	stda	%f18,[%g1+%l5]ASI_PST16_S ! Mem[0000000030001420] = 00000000340000ff
!	Mem[0000000030081410] = ffcbade0, %l5 = 000000000000088d
	swapa	[%i2+%o5]0x89,%l5	! %l5 = 00000000ffcbade0
!	Mem[0000000010041410] = 00000000, %l4 = fffffffffffff50a
	swapa	[%i1+%o5]0x88,%l4	! %l4 = 0000000000000000
!	%l2 = 00000000bc000000, Mem[0000000010181408] = ffd50062
	stba	%l2,[%i6+%o4]0x80	! Mem[0000000010181408] = 00d50062
!	%f21 = 000000ff, Mem[00000000300c1408] = 0000009f
	sta	%f21,[%i3+%o4]0x89	! Mem[00000000300c1408] = 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = 00000000, %l2 = 00000000bc000000
	lduwa	[%i4+%g0]0x88,%l2	! %l2 = 0000000000000000

p0_label_183:
!	Mem[0000000010101408] = 9f00000000000000, %l4 = 0000000000000000
	ldxa	[%i4+%o4]0x88,%l4	! %l4 = 9f00000000000000
!	%f0  = c8645d45, %f30 = 00000000, %f0  = c8645d45
	fsubs	%f0 ,%f30,%f0 		! %f0  = c8645d45
!	Mem[0000000010001438] = 103027001e25229f, %l1 = 0000000000000000
	ldx	[%i0+0x038],%l1		! %l1 = 103027001e25229f
!	Mem[0000000030001400] = 37c3a13c, %l4 = 9f00000000000000
	lduba	[%i0+%g0]0x81,%l4	! %l4 = 0000000000000037
!	Mem[0000000010101400] = 00000000, %l2 = 0000000000000000
	ldsha	[%i4+%g0]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000010141400] = 00000000, %f18 = 00000000
	lda	[%i5+%g0]0x80,%f18	! %f18 = 00000000
!	Mem[0000000010141430] = cbf14adb, %l0 = 0000000029ff4b3c
	lduwa	[%i5+0x030]%asi,%l0	! %l0 = 00000000cbf14adb
!	Mem[00000000100c1438] = 4ca6fc6b654a7d29, %f0  = c8645d45 20000000
	ldd	[%i3+0x038],%f0 	! %f0  = 4ca6fc6b 654a7d29
!	Mem[0000000030041410] = 000000e3, %l6 = 0000000029ff550d
	ldsha	[%i1+%o5]0x89,%l6	! %l6 = 00000000000000e3
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000000037, Mem[0000000030081408] = ff00000000000000
	stxa	%l4,[%i2+%o4]0x81	! Mem[0000000030081408] = 0000000000000037

p0_label_184:
!	Mem[0000000020800041] = 1efff99a, %l4 = 0000000000000037
	ldstub	[%o1+0x041],%l4		! %l4 = 000000ff000000ff
!	Mem[0000000010101400] = 00000000, %l3 = 0000000000000000
	ldstuba	[%i4+%g0]0x80,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010141414] = 0000000b, %l5 = 00000000ffcbade0, %asi = 80
	swapa	[%i5+0x014]%asi,%l5	! %l5 = 000000000000000b
!	%f27 = 000000e3, Mem[0000000010181408] = 00d50062
	sta	%f27,[%i6+%o4]0x80	! Mem[0000000010181408] = 000000e3
!	%f25 = 00000000, Mem[0000000010101408] = 00000000
	sta	%f25,[%i4+%o4]0x80	! Mem[0000000010101408] = 00000000
!	Mem[0000000010101410] = ff000000, %l1 = 103027001e25229f
	swap	[%i4+%o5],%l1		! %l1 = 00000000ff000000
!	Mem[0000000030081410] = 8d080000, %l2 = 0000000000000000
	ldstuba	[%i2+%o5]0x81,%l2	! %l2 = 0000008d000000ff
!	%f0  = 4ca6fc6b 654a7d29 00000000 000000bc
!	%f4  = 00000000 00000000 60000000 00000000
!	%f8  = 00000000 34697300 a52e7e04 e2a2ea29
!	%f12 = e3000000 d2038d08 00000000 00000000
	stda	%f0,[%i3]ASI_COMMIT_S	! Block Store to 00000000300c1400
!	%l5 = 000000000000000b, Mem[0000000030081400] = 0000000000000000
	stxa	%l5,[%i2+%g0]0x89	! Mem[0000000030081400] = 000000000000000b
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = ff000000, %l2 = 000000000000008d
	ldsha	[%i0+%o4]0x80,%l2	! %l2 = ffffffffffffff00

p0_label_185:
!	Mem[0000000020800000] = ffffe062, %l5 = 000000000000000b
	lduha	[%o1+0x000]%asi,%l5	! %l5 = 000000000000ffff
!	Mem[0000000030001408] = 00000000, %l0 = 00000000cbf14adb
	lduba	[%i0+%o4]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000010001408] = 047e2ea5000000ff, %l0 = 0000000000000000
	ldxa	[%i0+%o4]0x88,%l0	! %l0 = 047e2ea5000000ff
!	Mem[0000000010101408] = 00000000, %l2 = ffffffffffffff00
	ldsba	[%i4+%o4]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000030081410] = ff08000000273010, %f16 = 00000000 ffffff4b
	ldda	[%i2+%o5]0x81,%f16	! %f16 = ff080000 00273010
!	Mem[0000000010141408] = 000000ff 2ad50062, %l2 = 00000000, %l3 = 00000000
	ldd	[%i5+%o4],%l2		! %l2 = 00000000000000ff 000000002ad50062
!	Mem[0000000030141408] = ff000000, %l7 = 0000000000000000
	ldsha	[%i5+%o4]0x81,%l7	! %l7 = ffffffffffffff00
	membar	#Sync			! Added by membar checker (24)
!	Mem[00000000300c1400] = 297d4a656bfca64c, %l0 = 047e2ea5000000ff
	ldxa	[%i3+%g0]0x89,%l0	! %l0 = 297d4a656bfca64c
!	Mem[00000000300c1408] = 00000000, %l4 = 00000000000000ff
	ldsha	[%i3+%o4]0x89,%l4	! %l4 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l3 = 000000002ad50062, Mem[0000000030181408] = 0000002e
	stwa	%l3,[%i6+%o4]0x89	! Mem[0000000030181408] = 2ad50062

p0_label_186:
!	Mem[0000000010181410] = 3c4bff29, %l2 = 00000000000000ff
	ldstuba	[%i6+%o5]0x88,%l2	! %l2 = 00000029000000ff
!	%l7 = ffffffffffffff00, Mem[0000000030081408] = 00000000
	stwa	%l7,[%i2+%o4]0x89	! Mem[0000000030081408] = ffffff00
!	%f21 = 000000ff, Mem[0000000030081400] = 0b000000
	sta	%f21,[%i2+%g0]0x81	! Mem[0000000030081400] = 000000ff
!	Mem[00000000211c0001] = 00ffe5a1, %l0 = 297d4a656bfca64c
	ldstub	[%o2+0x001],%l0		! %l0 = 000000ff000000ff
!	%l5 = 000000000000ffff, Mem[000000001014140e] = 2ad50062
	stb	%l5,[%i5+0x00e]		! Mem[000000001014140c] = 2ad5ff62
!	Mem[0000000010181410] = 3c4bffff, %l6 = 00000000000000e3
	ldstuba	[%i6+%o5]0x88,%l6	! %l6 = 000000ff000000ff
!	Mem[0000000030041410] = e3000000, %l2 = 0000000000000029
	swapa	[%i1+%o5]0x81,%l2	! %l2 = 00000000e3000000
!	%l7 = ffffffffffffff00, Mem[0000000010001410] = 6f0000ff
	stha	%l7,[%i0+%o5]0x88	! Mem[0000000010001410] = 6f00ff00
!	%f26 = 088d03d2 000000e3, Mem[00000000300c1408] = 00000000 000000bc
	stda	%f26,[%i3+%o4]0x81	! Mem[00000000300c1408] = 088d03d2 000000e3
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = feae6015, %l7 = ffffffffffffff00
	ldswa	[%i1+%g0]0x80,%l7	! %l7 = fffffffffeae6015

p0_label_187:
!	Mem[0000000030141410] = 000000ff, %l1 = 00000000ff000000
	ldsha	[%i5+%o5]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030081400] = ff000000, %l7 = fffffffffeae6015
	lduwa	[%i2+%g0]0x89,%l7	! %l7 = 00000000ff000000
!	Mem[0000000010101410] = 9f22251e, %l6 = 00000000000000ff
	lduwa	[%i4+%o5]0x88,%l6	! %l6 = 000000009f22251e
!	Mem[00000000300c1408] = 088d03d2, %l3 = 000000002ad50062
	lduha	[%i3+%o4]0x81,%l3	! %l3 = 000000000000088d
!	Mem[0000000010041404] = a52e7e04, %l7 = 00000000ff000000
	ldub	[%i1+0x007],%l7		! %l7 = 0000000000000004
!	Mem[00000000300c1400] = 4ca6fc6b, %l2 = 00000000e3000000
	lduba	[%i3+%g0]0x81,%l2	! %l2 = 000000000000004c
!	Mem[0000000010141410] = 000000bc, %l5 = 000000000000ffff
	lduba	[%i5+%o5]0x88,%l5	! %l5 = 00000000000000bc
!	Mem[000000001004140c] = 00000000, %l4 = 0000000000000000
	lduba	[%i1+0x00d]%asi,%l4	! %l4 = 0000000000000000
!	Mem[000000001018143c] = 047e2ea5, %f27 = 000000e3
	lda	[%i6+0x03c]%asi,%f27	! %f27 = 047e2ea5
!	Starting 10 instruction Store Burst
!	Mem[0000000030141408] = 000000ff, %l5 = 00000000000000bc
	swapa	[%i5+%o4]0x89,%l5	! %l5 = 00000000000000ff

p0_label_188:
!	%l4 = 00000000, %l5 = 000000ff, Mem[0000000010041400] = 1560aefe 047e2ea5
	stda	%l4,[%i1+%g0]0x88	! Mem[0000000010041400] = 00000000 000000ff
!	%l2 = 000000000000004c, Mem[0000000010181400] = 0bffffff
	stba	%l2,[%i6+%g0]0x88	! Mem[0000000010181400] = 0bffff4c
!	%f20 = 00000000, %f7  = 00000000, %f28 = 00000000
	fsubs	%f20,%f7 ,%f28		! %f28 = 00000000
!	%l2 = 0000004c, %l3 = 0000088d, Mem[0000000010181410] = ffff4b3c 00000000
	stda	%l2,[%i6+%o5]0x80	! Mem[0000000010181410] = 0000004c 0000088d
!	Mem[0000000021800040] = 287028b2, %l6 = 000000009f22251e
	ldstub	[%o3+0x040],%l6		! %l6 = 00000028000000ff
!	%f9  = 34697300, Mem[0000000030001400] = 3ca1c337
	sta	%f9 ,[%i0+%g0]0x89	! Mem[0000000030001400] = 34697300
!	%l0 = 00000000000000ff, Mem[0000000010001400] = 4bffffff
	stba	%l0,[%i0+%g0]0x80	! Mem[0000000010001400] = ffffffff
!	%l4 = 0000000000000000, Mem[0000000030101410] = e0ad00ff
	stba	%l4,[%i4+%o5]0x81	! Mem[0000000030101410] = 00ad00ff
!	Mem[0000000020800040] = 1efff99a, %l2 = 000000000000004c
	ldstub	[%o1+0x040],%l2		! %l2 = 0000001e000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = e3000000, %l7 = 0000000000000004
	lduwa	[%i6+%o4]0x88,%l7	! %l7 = 00000000e3000000

p0_label_189:
!	Mem[0000000010141410] = e0adcbff000000bc, %l7 = 00000000e3000000
	ldxa	[%i5+%o5]0x88,%l7	! %l7 = e0adcbff000000bc
!	Mem[0000000030041408] = 0000000000000000, %f4  = 00000000 00000000
	ldda	[%i1+%o4]0x81,%f4 	! %f4  = 00000000 00000000
!	Mem[0000000010081408] = d5ff4b3c, %l7 = e0adcbff000000bc
	lduwa	[%i2+%o4]0x88,%l7	! %l7 = 00000000d5ff4b3c
!	Mem[0000000010081408] = 3c4bffd5, %l5 = 00000000000000ff
	lduwa	[%i2+%o4]0x80,%l5	! %l5 = 000000003c4bffd5
!	%l1 = 00000000000000ff, imm = 00000000000004f7, %l6 = 0000000000000028
	xor	%l1,0x4f7,%l6		! %l6 = 0000000000000408
!	Mem[0000000010141400] = 00000000, %l1 = 00000000000000ff
	lduwa	[%i5+%g0]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000010001414] = 000000ff, %l6 = 0000000000000408
	ldsba	[%i0+0x017]%asi,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010041410] = 00000000fffff50a, %l3 = 000000000000088d
	ldxa	[%i1+%o5]0x88,%l3	! %l3 = 00000000fffff50a
!	Mem[00000000201c0000] = ff9f01ce, %l3 = 00000000fffff50a
	ldub	[%o0+%g0],%l3		! %l3 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l0 = 000000ff, %l1 = 00000000, Mem[0000000010001410] = 6f00ff00 ff000000
	stda	%l0,[%i0+%o5]0x88	! Mem[0000000010001410] = 000000ff 00000000

p0_label_190:
!	Mem[0000000030041410] = 29000000, %l0 = 00000000000000ff
	swapa	[%i1+%o5]0x89,%l0	! %l0 = 0000000029000000
!	%l7 = 00000000d5ff4b3c, Mem[0000000030081410] = ff080000
	stba	%l7,[%i2+%o5]0x81	! Mem[0000000030081410] = 3c080000
!	%l0 = 0000000029000000, Mem[0000000030001408] = 00000000
	stwa	%l0,[%i0+%o4]0x81	! Mem[0000000030001408] = 29000000
!	%f0  = 4ca6fc6b, Mem[0000000030101400] = 00000000
	sta	%f0 ,[%i4+%g0]0x89	! Mem[0000000030101400] = 4ca6fc6b
!	%l2 = 0000001e, %l3 = 000000ff, Mem[0000000010041408] = 000000bc 00000000
	stda	%l2,[%i1+%o4]0x88	! Mem[0000000010041408] = 0000001e 000000ff
!	%l1 = 0000000000000000, %l4 = 0000000000000000, %l5 = 000000003c4bffd5
	orn	%l1,%l4,%l5		! %l5 = ffffffffffffffff
!	%l0 = 0000000029000000, Mem[0000000010141408] = ff000000
	stba	%l0,[%i5+%o4]0x88	! Mem[0000000010141408] = ff000000
!	Mem[0000000010081408] = d5ff4b3c, %l3 = 00000000000000ff
	swapa	[%i2+%o4]0x88,%l3	! %l3 = 00000000d5ff4b3c
!	%l2 = 0000001e, %l3 = d5ff4b3c, Mem[0000000030001410] = a52e7e04 00000000
	stda	%l2,[%i0+%o5]0x81	! Mem[0000000030001410] = 0000001e d5ff4b3c
!	Starting 10 instruction Load Burst
!	Mem[0000000010181434] = 47ee08bd, %l6 = ffffffffffffffff
	lduw	[%i6+0x034],%l6		! %l6 = 0000000047ee08bd

p0_label_191:
!	Mem[0000000030181410] = 60000000, %l5 = ffffffffffffffff
	ldsba	[%i6+%o5]0x81,%l5	! %l5 = 0000000000000060
!	Mem[0000000030001408] = 00000029, %l0 = 0000000029000000
	ldsba	[%i0+%o4]0x89,%l0	! %l0 = 0000000000000029
!	Mem[00000000100c1430] = e8476df6, %f26 = 088d03d2
	lda	[%i3+0x030]%asi,%f26	! %f26 = e8476df6
!	Mem[0000000030101400] = 4ca6fc6b, %f25 = 00000000
	lda	[%i4+%g0]0x89,%f25	! %f25 = 4ca6fc6b
!	%f8  = 00000000, %f15 = 00000000
	fcmps	%fcc3,%f8 ,%f15		! %fcc3 = 0
!	Mem[0000000010141428] = a6667f18 fd2281c3, %l4 = 00000000, %l5 = 00000060
	ldda	[%i5+0x028]%asi,%l4	! %l4 = 00000000a6667f18 00000000fd2281c3
!	Mem[0000000010001410] = ff00000000000000, %l7 = 00000000d5ff4b3c
	ldxa	[%i0+%o5]0x80,%l7	! %l7 = ff00000000000000
!	Mem[000000001008143c] = a52e7e04, %f29 = 000000ff
	lda	[%i2+0x03c]%asi,%f29	! %f29 = a52e7e04
!	Mem[0000000030141408] = 000000bc, %l2 = 000000000000001e
	ldswa	[%i5+%o4]0x89,%l2	! %l2 = 00000000000000bc
!	Starting 10 instruction Store Burst
!	%l4 = a6667f18, %l5 = fd2281c3, Mem[0000000010041408] = 1e000000 ff000000
	stda	%l4,[%i1+%o4]0x80	! Mem[0000000010041408] = a6667f18 fd2281c3

p0_label_192:
!	Mem[0000000010101408] = 00000000, %l0 = 0000000000000029
	swapa	[%i4+%o4]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000020800041] = fffff99a, %l4 = 00000000a6667f18
	ldstub	[%o1+0x041],%l4		! %l4 = 000000ff000000ff
!	%l4 = 00000000000000ff, Mem[00000000218001c0] = ff1cc752
	sth	%l4,[%o3+0x1c0]		! Mem[00000000218001c0] = 00ffc752
!	Mem[0000000030081400] = 000000ff, %l4 = 00000000000000ff
	swapa	[%i2+%g0]0x81,%l4	! %l4 = 00000000000000ff
!	%l2 = 00000000000000bc, Mem[0000000010081438] = 00000000
	sth	%l2,[%i2+0x038]		! Mem[0000000010081438] = 00bc0000
!	%f6  = 60000000 00000000, Mem[0000000010181400] = 4cffff0b 94bcd52a
	stda	%f6 ,[%i6+%g0]0x80	! Mem[0000000010181400] = 60000000 00000000
!	Mem[0000000010001438] = 10302700, %l2 = 00000000000000bc
	ldstuba	[%i0+0x038]%asi,%l2	! %l2 = 00000010000000ff
!	%l1 = 0000000000000000, Mem[0000000020800040] = fffff99a
	sth	%l1,[%o1+0x040]		! Mem[0000000020800040] = 0000f99a
!	%l3 = 00000000d5ff4b3c, Mem[0000000030001400] = 34697300
	stba	%l3,[%i0+%g0]0x89	! Mem[0000000030001400] = 3469733c
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = 000000ff, %l1 = 0000000000000000
	lduha	[%i5+%o4]0x80,%l1	! %l1 = 0000000000000000

p0_label_193:
!	Mem[0000000010081410] = 00000000, %l0 = 0000000000000000
	ldswa	[%i2+%o5]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000010081434] = 41a1b160, %l6 = 0000000047ee08bd
	lduh	[%i2+0x036],%l6		! %l6 = 000000000000b160
!	Mem[0000000010041400] = 000000ff 00000000, %l2 = 00000010, %l3 = d5ff4b3c
	ldda	[%i1+%g0]0x88,%l2	! %l2 = 0000000000000000 00000000000000ff
!	Mem[0000000010101408] = 000000290000009f, %l5 = 00000000fd2281c3
	ldxa	[%i4+%o4]0x80,%l5	! %l5 = 000000290000009f
!	Mem[00000000100c1408] = d2038d08, %l2 = 0000000000000000
	ldsba	[%i3+%o4]0x88,%l2	! %l2 = 0000000000000008
!	Mem[0000000030101408] = 0000009f, %l1 = 0000000000000000
	ldswa	[%i4+%o4]0x89,%l1	! %l1 = 000000000000009f
!	Mem[0000000030181410] = 00000060, %l0 = 0000000000000000
	lduba	[%i6+%o5]0x89,%l0	! %l0 = 0000000000000060
!	Mem[0000000030101410] = 00ad00ff, %l4 = 00000000000000ff
	ldswa	[%i4+%o5]0x81,%l4	! %l4 = 0000000000ad00ff
!	Mem[00000000100c1400] = 9f00000000000000, %f30 = 00000000 db72f184
	ldda	[%i3+%g0]0x80,%f30	! %f30 = 9f000000 00000000
!	Starting 10 instruction Store Burst
!	%f10 = a52e7e04 e2a2ea29, %l7 = ff00000000000000
!	Mem[0000000030181408] = 6200d52a9e7c1543
	add	%i6,0x008,%g1
	stda	%f10,[%g1+%l7]ASI_PST16_SL ! Mem[0000000030181408] = 6200d52a9e7c1543

p0_label_194:
!	Mem[0000000030141400] = 29ff4b3c, %l5 = 000000290000009f
	swapa	[%i5+%g0]0x81,%l5	! %l5 = 0000000029ff4b3c
!	%l6 = 000000000000b160, Mem[0000000010181430] = 0aeb4c39
	stw	%l6,[%i6+0x030]		! Mem[0000000010181430] = 0000b160
!	%f22 = a52e7e04, %f18 = 00000000, %f20 = 00000000
	fsubs	%f22,%f18,%f20		! %f20 = a52e7e04
!	%f11 = e2a2ea29, Mem[0000000010141418] = 00000000
	st	%f11,[%i5+0x018]	! Mem[0000000010141418] = e2a2ea29
!	%f26 = e8476df6 047e2ea5, %l4 = 0000000000ad00ff
!	Mem[0000000010001430] = 00000000db72f184
	add	%i0,0x030,%g1
	stda	%f26,[%g1+%l4]ASI_PST8_PL ! Mem[0000000010001430] = a52e7e04f66d47e8
!	Mem[0000000030101410] = 00ad00ff, %l4 = 0000000000ad00ff
	ldstuba	[%i4+%o5]0x81,%l4	! %l4 = 00000000000000ff
!	%l0 = 00000060, %l1 = 0000009f, Mem[0000000010101400] = ff000000 10302700
	std	%l0,[%i4+%g0]		! Mem[0000000010101400] = 00000060 0000009f
!	%f20 = a52e7e04 000000ff, Mem[0000000010141438] = ffff2c9f 19dd1ed0
	stda	%f20,[%i5+0x038]%asi	! Mem[0000000010141438] = a52e7e04 000000ff
!	%l0 = 0000000000000060, Mem[0000000010141408] = 000000ff2ad5ff62
	stxa	%l0,[%i5+%o4]0x80	! Mem[0000000010141408] = 0000000000000060
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (25)
!	Mem[0000000030001400] = 3c736934 c38122ff 29000000 000000e3
!	Mem[0000000030001410] = 0000001e d5ff4b3c 646d910d 7abbfe4d
!	Mem[0000000030001420] = 00000000 340000ff 95d0a0c4 6bd091ff
!	Mem[0000000030001430] = 00000057 a6667f18 fd2146b2 e70000ff
	ldda	[%i0]ASI_BLK_AIUSL,%f0	! Block Load from 0000000030001400

p0_label_195:
!	Mem[0000000030181410] = 00000060, %l3 = 00000000000000ff
	ldsba	[%i6+%o5]0x89,%l3	! %l3 = 0000000000000060
!	Mem[00000000300c1410] = 00000000, %l7 = ff00000000000000
	lduwa	[%i3+%o5]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000030081410] = 0000083c, %l0 = 0000000000000060
	ldswa	[%i2+%o5]0x89,%l0	! %l0 = 000000000000083c
!	Mem[0000000030041400] = ff000000d2038d08, %f24 = 00000000 4ca6fc6b
	ldda	[%i1+%g0]0x81,%f24	! %f24 = ff000000 d2038d08
!	Mem[0000000030041408] = 0000000000000000, %f18 = 00000000 000000ff
	ldda	[%i1+%o4]0x81,%f18	! %f18 = 00000000 00000000
!	Mem[00000000300c1410] = 00000000, %l7 = 0000000000000000
	lduwa	[%i3+%o5]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000030101410] = ffad00ff, %l2 = 0000000000000008
	ldsha	[%i4+%o5]0x81,%l2	! %l2 = ffffffffffffffad
!	Mem[0000000010041408] = 187f66a6, %l4 = 0000000000000000
	ldsha	[%i1+%o4]0x88,%l4	! %l4 = 00000000000066a6
!	Mem[0000000010001408] = 000000ff, %l5 = 0000000029ff4b3c
	ldsha	[%i0+%o4]0x88,%l5	! %l5 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000010141404] = a52e7e04, %l0 = 000000000000083c
	swap	[%i5+0x004],%l0		! %l0 = 00000000a52e7e04

p0_label_196:
!	%l5 = 00000000000000ff, Mem[0000000021800000] = ffff18df
	stb	%l5,[%o3+%g0]		! Mem[0000000021800000] = ffff18df
!	%f24 = ff000000, %f17 = 00273010
	fitos	%f24,%f17		! %f17 = cb800000
!	%l4 = 00000000000066a6, Mem[00000000100c1400] = 000000000000009f
	stxa	%l4,[%i3+%g0]0x88	! Mem[00000000100c1400] = 00000000000066a6
!	Mem[0000000010181400] = 60000000, %l7 = 0000000000000000
	ldstuba	[%i6+%g0]0x80,%l7	! %l7 = 00000060000000ff
!	%f16 = ff080000 cb800000, Mem[00000000100c1400] = a6660000 00000000
	stda	%f16,[%i3+%g0]0x80	! Mem[00000000100c1400] = ff080000 cb800000
!	%l7 = 0000000000000060, Mem[0000000030041400] = ff000000d2038d08
	stxa	%l7,[%i1+%g0]0x81	! Mem[0000000030041400] = 0000000000000060
!	Mem[0000000010141410] = 000000bc, %l5 = 00000000000000ff
	swapa	[%i5+%o5]0x88,%l5	! %l5 = 00000000000000bc
!	%f20 = a52e7e04, Mem[0000000030041410] = ff000000
	sta	%f20,[%i1+%o5]0x81	! Mem[0000000030041410] = a52e7e04
!	%l7 = 0000000000000060, Mem[0000000021800040] = ff7028b2
	stb	%l7,[%o3+0x040]		! Mem[0000000021800040] = 607028b2
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = 00ffe5a1, %l7 = 0000000000000060
	lduha	[%o2+0x000]%asi,%l7	! %l7 = 00000000000000ff

p0_label_197:
!	Mem[0000000010041400] = 00000000ff000000, %l7 = 00000000000000ff
	ldxa	[%i1+0x000]%asi,%l7	! %l7 = 00000000ff000000
!	Mem[0000000010181408] = 00bc00ffe3000000, %f28 = 00000000 a52e7e04
	ldda	[%i6+%o4]0x88,%f28	! %f28 = 00bc00ff e3000000
!	Mem[0000000030141408] = 000000bc, %f18 = 00000000
	lda	[%i5+%o4]0x89,%f18	! %f18 = 000000bc
!	Mem[0000000010101400] = 60000000, %l3 = 0000000000000060
	lduba	[%i4+%g0]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000010001410] = ff00000000000000, %l1 = 000000000000009f
	ldxa	[%i0+%o5]0x80,%l1	! %l1 = ff00000000000000
!	Mem[00000000218000c0] = 19c5d5a0, %l7 = 00000000ff000000
	ldub	[%o3+0x0c1],%l7		! %l7 = 00000000000000c5
!	Code Fragment 3
p0_fragment_18:
!	%l0 = 00000000a52e7e04
	setx	0xb1e9c61ffca309c1,%g7,%l0 ! %l0 = b1e9c61ffca309c1
!	%l1 = ff00000000000000
	setx	0x6f2c4fc84ac99564,%g7,%l1 ! %l1 = 6f2c4fc84ac99564
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = b1e9c61ffca309c1
	setx	0x8b70d857f3959a2d,%g7,%l0 ! %l0 = 8b70d857f3959a2d
!	%l1 = 6f2c4fc84ac99564
	setx	0xcaf01a3fdfccde62,%g7,%l1 ! %l1 = caf01a3fdfccde62
!	Mem[0000000010181408] = 000000e3ff00bc00, %l6 = 000000000000b160
	ldxa	[%i6+%o4]0x80,%l6	! %l6 = 000000e3ff00bc00
!	Mem[0000000010041408] = 187f66a6, %f23 = ff1edd19
	lda	[%i1+%o4]0x88,%f23	! %f23 = 187f66a6
!	Starting 10 instruction Store Burst
!	%l6 = 000000e3ff00bc00, Mem[0000000030081408] = ffffff00
	stba	%l6,[%i2+%o4]0x89	! Mem[0000000030081408] = ffffff00

p0_label_198:
!	Mem[0000000030081408] = 00ffffff, %l0 = 8b70d857f3959a2d
	ldstuba	[%i2+%o4]0x81,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010081408] = ff000000, %l5 = 00000000000000bc
	ldstuba	[%i2+%o4]0x80,%l5	! %l5 = 000000ff000000ff
	membar	#Sync			! Added by membar checker (26)
!	%l1 = caf01a3fdfccde62, Mem[0000000030001410] = 1e000000
	stwa	%l1,[%i0+%o5]0x89	! Mem[0000000030001410] = dfccde62
!	%l5 = 00000000000000ff, Mem[0000000030041400] = 00000000
	stha	%l5,[%i1+%g0]0x81	! Mem[0000000030041400] = 00ff0000
!	%l2 = ffffffffffffffad, Mem[0000000010041400] = 000000ff00000000
	stxa	%l2,[%i1+%g0]0x88	! Mem[0000000010041400] = ffffffffffffffad
!	%l0 = 0000000000000000, Mem[00000000100c1422] = 00000000, %asi = 80
	stba	%l0,[%i3+0x022]%asi	! Mem[00000000100c1420] = 00000000
!	Mem[0000000030181408] = 2ad50062, %l0 = 0000000000000000
	ldstuba	[%i6+%o4]0x89,%l0	! %l0 = 00000062000000ff
!	Mem[00000000300c1408] = d2038d08, %l5 = 00000000000000ff
	ldstuba	[%i3+%o4]0x89,%l5	! %l5 = 00000008000000ff
!	%l0 = 0000000000000062, imm = 000000000000084e, %l3 = 0000000000000000
	sub	%l0,0x84e,%l3		! %l3 = fffffffffffff814
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = 000000ff 00000000 ffffffff 00000037
!	Mem[0000000030081410] = 3c080000 00273010 646d910d 7abbfe4d
!	Mem[0000000030081420] = ffc52157 34000032 95d0a0c4 6bd091ff
!	Mem[0000000030081430] = 00000057 1bb8d5ff 21d0705d f28b69b5
	ldda	[%i2]ASI_BLK_S,%f16	! Block Load from 0000000030081400

p0_label_199:
!	Mem[00000000300c1410] = 00000000, %l5 = 0000000000000008
	ldsha	[%i3+%o5]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000010081400] = 000000ff 9e7c1543, %l0 = 00000062, %l1 = dfccde62
	ldda	[%i2+%g0]0x80,%l0	! %l0 = 00000000000000ff 000000009e7c1543
!	Mem[0000000010101400] = 000000600000009f, %l4 = 00000000000066a6
	ldxa	[%i4+%g0]0x80,%l4	! %l4 = 000000600000009f
!	Mem[0000000010081408] = ff000000, %l2 = ffffffffffffffad
	ldsh	[%i2+%o4],%l2		! %l2 = ffffffffffffff00
!	Mem[0000000010141408] = 00000000 00000060, %l0 = 000000ff, %l1 = 9e7c1543
	ldda	[%i5+%o4]0x80,%l0	! %l0 = 0000000000000000 0000000000000060
!	Mem[0000000030101410] = ffad00ff00003010, %l4 = 000000600000009f
	ldxa	[%i4+%o5]0x81,%l4	! %l4 = ffad00ff00003010
!	%f10 = ff91d06b c4a0d095, %l6 = 000000e3ff00bc00
!	Mem[0000000030001428] = 95d0a0c46bd091ff
	add	%i0,0x028,%g1
	stda	%f10,[%g1+%l6]ASI_PST32_SL ! Mem[0000000030001428] = 95d0a0c46bd091ff
!	Mem[0000000010001408] = 000000ff, %l5 = 0000000000000000
	ldswa	[%i0+%o4]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[00000000100c1400] = ff080000, %l7 = 00000000000000c5
	lduwa	[%i3+%g0]0x80,%l7	! %l7 = 00000000ff080000
!	Starting 10 instruction Store Burst
!	%l4 = 00003010, %l5 = 000000ff, Mem[0000000010101420] = 00736934 00000000
	std	%l4,[%i4+0x020]		! Mem[0000000010101420] = 00003010 000000ff

p0_label_200:
!	%l1 = 0000000000000060, Mem[0000000010101400] = 9f00000060000000
	stxa	%l1,[%i4+%g0]0x88	! Mem[0000000010101400] = 0000000000000060
!	%f2  = e3000000 00000029, Mem[0000000010101400] = 60000000 00000000
	stda	%f2 ,[%i4+%g0]0x80	! Mem[0000000010101400] = e3000000 00000029
!	Mem[0000000030181400] = 00000000, %l4 = ffad00ff00003010
	ldstuba	[%i6+%g0]0x81,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030101410] = ff00adff, %l3 = fffffffffffff814
	swapa	[%i4+%o5]0x89,%l3	! %l3 = 00000000ff00adff
!	%l0 = 00000000, %l1 = 00000060, Mem[0000000010141400] = 00000000 0000083c
	stda	%l0,[%i5+0x000]%asi	! Mem[0000000010141400] = 00000000 00000060
!	%l5 = 00000000000000ff, %l5 = 00000000000000ff, %y  = 00000000
	smul	%l5,%l5,%l2		! %l2 = 000000000000fe01, %y = 00000000
!	%l1 = 0000000000000060, Mem[0000000010001408] = ff000000
	stwa	%l1,[%i0+%o4]0x80	! Mem[0000000010001408] = 00000060
!	%f4  = 3c4bffd5 1e000000, %l2 = 000000000000fe01
!	Mem[0000000010081438] = 00bc0000a52e7e04
	add	%i2,0x038,%g1
	stda	%f4,[%g1+%l2]ASI_PST8_PL ! Mem[0000000010081438] = 00bc0000a52e7e04
!	%f8  = ff000034 00000000, %l6 = 000000e3ff00bc00
!	Mem[0000000010141430] = cbf14adb1560aefe
	add	%i5,0x030,%g1
	stda	%f8,[%g1+%l6]ASI_PST16_PL ! Mem[0000000010141430] = cbf14adb1560aefe
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = 4c000000, %l6 = 000000e3ff00bc00
	ldsha	[%i6+%o5]0x88,%l6	! %l6 = 0000000000000000

p0_label_201:
!	Mem[0000000010001400] = ffffffff, %l7 = 00000000ff080000
	ldsba	[%i0+%g0]0x88,%l7	! %l7 = ffffffffffffffff
!	Mem[00000000100c1408] = 088d03d2, %l6 = 0000000000000000
	lduba	[%i3+%o4]0x80,%l6	! %l6 = 0000000000000008
!	Mem[0000000030101400] = 4ca6fc6b, %f1  = 3469733c
	lda	[%i4+%g0]0x89,%f1 	! %f1 = 4ca6fc6b
!	%l3 = 00000000ff00adff, imm = 00000000000009ca, %l2 = 000000000000fe01
	orn	%l3,0x9ca,%l2		! %l2 = ffffffffffffffff
!	Mem[0000000010081420] = ff2281c3, %l3 = 00000000ff00adff
	ldsba	[%i2+0x023]%asi,%l3	! %l3 = ffffffffffffffc3
!	Mem[0000000020800000] = ffffe062, %l0 = 0000000000000000
	lduh	[%o1+%g0],%l0		! %l0 = 000000000000ffff
!	Mem[0000000010001410] = 000000ff, %f9  = 00000000
	lda	[%i0+%o5]0x88,%f9 	! %f9 = 000000ff
	membar	#Sync			! Added by membar checker (27)
!	Mem[0000000010081400] = 000000ff 9e7c1543 ff000000 61cd0000
!	Mem[0000000010081410] = 00000000 84f172db 00000000 000000ff
!	Mem[0000000010081420] = ff2281c3 34a1c300 4dfebb7a 94bcd52a
!	Mem[0000000010081430] = 0000009f 41a1b160 00bc0000 a52e7e04
	ldda	[%i2]ASI_BLK_P,%f0	! Block Load from 0000000010081400
!	%l4 = 0000000000000000, %l7 = ffffffffffffffff, %l1 = 0000000000000060
	xnor	%l4,%l7,%l1		! %l1 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030101400] = 6bfca64c, %l4 = 0000000000000000
	ldstuba	[%i4+%g0]0x81,%l4	! %l4 = 0000006b000000ff

p0_label_202:
!	%l7 = ffffffffffffffff, %l5 = 00000000000000ff, %y  = 00000000
	smul	%l7,%l5,%l6		! %l6 = ffffffffffffff01, %y = ffffffff
!	%f26 = 95d0a0c4, Mem[0000000010001400] = ffffffff
	sta	%f26,[%i0+%g0]0x88	! Mem[0000000010001400] = 95d0a0c4
!	%l6 = ffffffffffffff01, Mem[0000000010041408] = a6667f18fd2281c3
	stxa	%l6,[%i1+%o4]0x80	! Mem[0000000010041408] = ffffffffffffff01
!	Mem[0000000020800000] = ffffe062, %l2 = ffffffffffffffff
	ldstuba	[%o1+0x000]%asi,%l2	! %l2 = 000000ff000000ff
!	%l0 = 000000000000ffff, Mem[0000000030001410] = 62deccdfd5ff4b3c
	stxa	%l0,[%i0+%o5]0x81	! Mem[0000000030001410] = 000000000000ffff
!	Mem[0000000030081400] = 000000ff, %l7 = ffffffffffffffff
	ldstuba	[%i2+%g0]0x81,%l7	! %l7 = 00000000000000ff
!	%f24 = ffc52157 34000032, Mem[0000000010181408] = 000000e3 ff00bc00
	stda	%f24,[%i6+%o4]0x80	! Mem[0000000010181408] = ffc52157 34000032
!	%l4 = 000000000000006b, Mem[0000000030081408] = ffffffff
	stha	%l4,[%i2+%o4]0x89	! Mem[0000000030081408] = ffff006b
!	%l6 = ffffff01, %l7 = 00000000, Mem[00000000300c1408] = d2038dff e3000000
	stda	%l6,[%i3+%o4]0x89	! Mem[00000000300c1408] = ffffff01 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = 0000ff00, %l2 = 00000000000000ff
	ldsha	[%i1+%g0]0x89,%l2	! %l2 = ffffffffffffff00

p0_label_203:
!	Mem[0000000030041400] = 0000ff00, %l7 = 0000000000000000
	lduha	[%i1+%g0]0x89,%l7	! %l7 = 000000000000ff00
!	Mem[0000000010181410] = 4c000000, %l3 = ffffffffffffffc3
	lduba	[%i6+%o5]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000010001400] = c4a0d095, %l3 = 0000000000000000
	ldsba	[%i0+%g0]0x80,%l3	! %l3 = ffffffffffffffc4
!	Mem[0000000010141400] = 00000000, %l3 = ffffffffffffffc4
	ldswa	[%i5+%g0]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000010101410] = 1e25229f, %l4 = 000000000000006b
	lduba	[%i4+%o5]0x80,%l4	! %l4 = 000000000000001e
!	Mem[0000000010081400] = ff000000, %l1 = 0000000000000000
	lduha	[%i2+%g0]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000030001400] = 3c736934, %l6 = ffffffffffffff01
	ldswa	[%i0+%g0]0x81,%l6	! %l6 = 000000003c736934
!	Mem[0000000010181410] = 4c000000, %l0 = 000000000000ffff
	lduwa	[%i6+%o5]0x88,%l0	! %l0 = 000000004c000000
!	Mem[0000000030181400] = 000000ff, %l6 = 000000003c736934
	lduha	[%i6+%g0]0x89,%l6	! %l6 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1408] = d2038d08, %l5 = 00000000000000ff
	swapa	[%i3+%o4]0x88,%l5	! %l5 = 00000000d2038d08

p0_label_204:
!	%l4 = 000000000000001e, Mem[00000000100c1410] = ff00bc00
	stha	%l4,[%i3+%o5]0x88	! Mem[00000000100c1410] = ff00001e
!	%l6 = 00000000000000ff, Mem[0000000010101400] = 000000e3
	stwa	%l6,[%i4+%g0]0x88	! Mem[0000000010101400] = 000000ff
!	Mem[000000001004140c] = ffffff01, %l6 = 00000000000000ff
	swap	[%i1+0x00c],%l6		! %l6 = 00000000ffffff01
!	Mem[0000000030001408] = 29000000, %l3 = 0000000000000000
	swapa	[%i0+%o4]0x81,%l3	! %l3 = 0000000029000000
!	%l7 = 000000000000ff00, Mem[0000000010181414] = 0000088d
	sth	%l7,[%i6+0x014]		! Mem[0000000010181414] = ff00088d
!	Mem[0000000030081410] = 0000083c, %l5 = 00000000d2038d08
	ldstuba	[%i2+%o5]0x89,%l5	! %l5 = 0000003c000000ff
!	%l5 = 000000000000003c, Mem[0000000010141430] = cbf14adb, %asi = 80
	stha	%l5,[%i5+0x030]%asi	! Mem[0000000010141430] = 003c4adb
!	%f0  = 000000ff 9e7c1543 ff000000 61cd0000
!	%f4  = 00000000 84f172db 00000000 000000ff
!	%f8  = ff2281c3 34a1c300 4dfebb7a 94bcd52a
!	%f12 = 0000009f 41a1b160 00bc0000 a52e7e04
	stda	%f0,[%i2]ASI_BLK_AIUP	! Block Store to 0000000010081400
!	Code Fragment 3
p0_fragment_19:
!	%l0 = 000000004c000000
	setx	0x92f759a031b8db59,%g7,%l0 ! %l0 = 92f759a031b8db59
!	%l1 = 0000000000000000
	setx	0xa2f19c97a22afb22,%g7,%l1 ! %l1 = a2f19c97a22afb22
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 92f759a031b8db59
	setx	0xbd297350091689bb,%g7,%l0 ! %l0 = bd297350091689bb
!	%l1 = a2f19c97a22afb22
	setx	0xe5918dcff532b0ee,%g7,%l1 ! %l1 = e5918dcff532b0ee
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (28)
!	Mem[0000000010081410] = 00000000, %l2 = ffffffffffffff00
	lduha	[%i2+%o5]0x88,%l2	! %l2 = 0000000000000000

p0_label_205:
!	Mem[0000000010041408] = ffffffff, %l1 = e5918dcff532b0ee
	lduha	[%i1+%o4]0x88,%l1	! %l1 = 000000000000ffff
!	Mem[0000000010181424] = 726f2f17, %l1 = 000000000000ffff
	ldsba	[%i6+0x026]%asi,%l1	! %l1 = 000000000000002f
!	Mem[00000000100c142c] = e2a2eaff, %l1 = 000000000000002f
	lduwa	[%i3+0x02c]%asi,%l1	! %l1 = 00000000e2a2eaff
!	Mem[0000000010101410] = 9f22251e, %l0 = bd297350091689bb
	lduwa	[%i4+%o5]0x88,%l0	! %l0 = 000000009f22251e
!	Mem[00000000201c0000] = ff9f01ce, %l2 = 0000000000000000
	lduh	[%o0+%g0],%l2		! %l2 = 000000000000ff9f
!	Mem[0000000010041410] = 0af5ffff, %l6 = 00000000ffffff01
	ldswa	[%i1+%o5]0x80,%l6	! %l6 = 000000000af5ffff
!	Mem[0000000010101400] = ff000000 00000029, %l6 = 0af5ffff, %l7 = 0000ff00
	ldda	[%i4+%g0]0x80,%l6	! %l6 = 00000000ff000000 0000000000000029
!	Code Fragment 4
p0_fragment_20:
!	%l0 = 000000009f22251e
	setx	0x9ceca010148b58a1,%g7,%l0 ! %l0 = 9ceca010148b58a1
!	%l1 = 00000000e2a2eaff
	setx	0xbe0f53e85efd6284,%g7,%l1 ! %l1 = be0f53e85efd6284
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 9ceca010148b58a1
	setx	0xc2d4e1507b734dcb,%g7,%l0 ! %l0 = c2d4e1507b734dcb
!	%l1 = be0f53e85efd6284
	setx	0xbac71d68452b965b,%g7,%l1 ! %l1 = bac71d68452b965b
!	Mem[0000000010081410] = 00000000, %l5 = 000000000000003c
	lduha	[%i2+%o5]0x88,%l5	! %l5 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f16 = 000000ff 00000000, %l7 = 0000000000000029
!	Mem[0000000030001430] = 00000057a6667f18
	add	%i0,0x030,%g1
	stda	%f16,[%g1+%l7]ASI_PST8_SL ! Mem[0000000030001430] = 00000000a6007f18

p0_label_206:
!	%l3 = 0000000029000000, Mem[0000000030101410] = 14f8ffff00003010
	stxa	%l3,[%i4+%o5]0x81	! Mem[0000000030101410] = 0000000029000000
!	Mem[00000000201c0000] = ff9f01ce, %l6 = 00000000ff000000
	ldsba	[%o0+0x000]%asi,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000030081400] = ff0000ff, %l2 = 000000000000ff9f
	swapa	[%i2+%g0]0x89,%l2	! %l2 = 00000000ff0000ff
!	Code Fragment 4
p0_fragment_21:
!	%l0 = c2d4e1507b734dcb
	setx	0x3986e11faa1afb66,%g7,%l0 ! %l0 = 3986e11faa1afb66
!	%l1 = bac71d68452b965b
	setx	0x04b51ad7e6c009f3,%g7,%l1 ! %l1 = 04b51ad7e6c009f3
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 3986e11faa1afb66
	setx	0x65dc27d02ab04fb3,%g7,%l0 ! %l0 = 65dc27d02ab04fb3
!	%l1 = 04b51ad7e6c009f3
	setx	0xd38cc4e855112a57,%g7,%l1 ! %l1 = d38cc4e855112a57
!	Mem[00000000100c1424] = 34030000, %l1 = d38cc4e855112a57
	lduha	[%i3+0x026]%asi,%l1	! %l1 = 0000000000000000
!	%l4 = 000000000000001e, Mem[00000000300c1408] = 01ffffff
	stwa	%l4,[%i3+%o4]0x81	! Mem[00000000300c1408] = 0000001e
!	%l1 = 0000000000000000, Mem[00000000211c0000] = 00ffe5a1
	sth	%l1,[%o2+%g0]		! Mem[00000000211c0000] = 0000e5a1
!	%l6 = ffffffffffffffff, Mem[0000000010141408] = 00000000
	stwa	%l6,[%i5+%o4]0x88	! Mem[0000000010141408] = ffffffff
!	%l3 = 0000000029000000, Mem[000000001000142c] = e436b160, %asi = 80
	stwa	%l3,[%i0+0x02c]%asi	! Mem[000000001000142c] = 29000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = 00000000, %l4 = 000000000000001e
	lduwa	[%i2+%o5]0x88,%l4	! %l4 = 0000000000000000

p0_label_207:
!	Mem[0000000020800040] = 0000f99a, %l2 = 00000000ff0000ff
	ldsh	[%o1+0x040],%l2		! %l2 = 0000000000000000
!	Mem[0000000030181410] = 60000000, %f19 = 00000037
	lda	[%i6+%o5]0x81,%f19	! %f19 = 60000000
!	Mem[000000001008141c] = 000000ff, %f27 = 6bd091ff
	ld	[%i2+0x01c],%f27	! %f27 = 000000ff
!	Mem[00000000300c1410] = 00000000, %l4 = 0000000000000000
	ldsba	[%i3+%o5]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000030001400] = 3c736934, %l6 = ffffffffffffffff
	lduha	[%i0+%g0]0x81,%l6	! %l6 = 0000000000003c73
!	Mem[00000000201c0000] = ff9f01ce, %l3 = 0000000029000000
	ldsha	[%o0+0x000]%asi,%l3	! %l3 = ffffffffffffff9f
!	Mem[0000000030081410] = ff080000, %l4 = 0000000000000000
	lduwa	[%i2+%o5]0x81,%l4	! %l4 = 00000000ff080000
	membar	#Sync			! Added by membar checker (29)
!	Mem[0000000030001400] = 3c736934 c38122ff 00000000 000000e3
!	Mem[0000000030001410] = 00000000 0000ffff 646d910d 7abbfe4d
!	Mem[0000000030001420] = 00000000 340000ff 95d0a0c4 6bd091ff
!	Mem[0000000030001430] = 00000000 a6007f18 fd2146b2 e70000ff
	ldda	[%i0]ASI_BLK_S,%f0	! Block Load from 0000000030001400
!	Mem[0000000010181428] = 00000000, %f23 = 7abbfe4d
	lda	[%i6+0x028]%asi,%f23	! %f23 = 00000000
!	Starting 10 instruction Store Burst
!	%l0 = 65dc27d02ab04fb3, Mem[00000000201c0000] = ff9f01ce
	stb	%l0,[%o0+%g0]		! Mem[00000000201c0000] = b39f01ce

p0_label_208:
!	Mem[000000001004141c] = 550d0060, %l7 = 0000000000000029
	ldstub	[%i1+0x01c],%l7		! %l7 = 00000055000000ff
!	Mem[0000000010181412] = 0000004c, %l7 = 0000000000000055
	ldstub	[%i6+0x012],%l7		! %l7 = 00000000000000ff
!	%l4 = 00000000ff080000, Mem[0000000010041410] = 00000000fffff50a
	stxa	%l4,[%i1+%o5]0x88	! Mem[0000000010041410] = 00000000ff080000
!	Mem[0000000030041410] = a52e7e04, %l7 = 0000000000000000
	ldstuba	[%i1+%o5]0x81,%l7	! %l7 = 000000a5000000ff
!	%f0  = 3c736934 c38122ff 00000000 000000e3
!	%f4  = 00000000 0000ffff 646d910d 7abbfe4d
!	%f8  = 00000000 340000ff 95d0a0c4 6bd091ff
!	%f12 = 00000000 a6007f18 fd2146b2 e70000ff
	stda	%f0,[%i1]ASI_BLK_S	! Block Store to 0000000030041400
!	%l0 = 65dc27d02ab04fb3, Mem[00000000100c141e] = 00000000, %asi = 80
	stba	%l0,[%i3+0x01e]%asi	! Mem[00000000100c141c] = 0000b300
!	Mem[0000000030001408] = 00000000, %l3 = ffffffffffffff9f
	swapa	[%i0+%o4]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000010081428] = 4dfebb7a94bcd52a, %l5 = 0000000000000000, %l3 = 0000000000000000
	add	%i2,0x28,%g1
	casxa	[%g1]0x80,%l5,%l3	! %l3 = 4dfebb7a94bcd52a
!	Code Fragment 4
p0_fragment_22:
!	%l0 = 65dc27d02ab04fb3
	setx	0x9f3d14a854d30e76,%g7,%l0 ! %l0 = 9f3d14a854d30e76
!	%l1 = 0000000000000000
	setx	0x491c100f9eaff4a1,%g7,%l1 ! %l1 = 491c100f9eaff4a1
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 9f3d14a854d30e76
	setx	0xcebf13d7e91a59be,%g7,%l0 ! %l0 = cebf13d7e91a59be
!	%l1 = 491c100f9eaff4a1
	setx	0xca5fc520780b4c83,%g7,%l1 ! %l1 = ca5fc520780b4c83
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = 9fff0000, %l5 = 0000000000000000
	ldsha	[%i2+%g0]0x81,%l5	! %l5 = ffffffffffff9fff

p0_label_209:
!	Mem[0000000010141424] = 1697ffc7, %l6 = 0000000000003c73
	ldsh	[%i5+0x026],%l6		! %l6 = ffffffffffffffc7
!	Mem[0000000030001400] = 3469733c, %l7 = 00000000000000a5
	ldswa	[%i0+%g0]0x89,%l7	! %l7 = 000000003469733c
!	Mem[00000000300c1410] = 00000000, %l3 = 4dfebb7a94bcd52a
	ldsha	[%i3+%o5]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000030101400] = 4ca6fcff, %l4 = 00000000ff080000
	ldsba	[%i4+%g0]0x89,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000030141408] = bc00000000000000, %l2 = 0000000000000000
	ldxa	[%i5+%o4]0x81,%l2	! %l2 = bc00000000000000
!	Mem[0000000030181400] = 000000ff, %f30 = 21d0705d
	lda	[%i6+%g0]0x89,%f30	! %f30 = 000000ff
!	Mem[0000000030101410] = 00000000, %l1 = ca5fc520780b4c83
	ldsha	[%i4+%o5]0x89,%l1	! %l1 = 0000000000000000
	membar	#Sync			! Added by membar checker (30)
!	Mem[0000000030041410] = 00000000, %l0 = cebf13d7e91a59be
	lduwa	[%i1+%o5]0x81,%l0	! %l0 = 0000000000000000
!	%f22 = 646d910d, Mem[0000000010141408] = ffffffff
	sta	%f22,[%i5+%o4]0x88	! Mem[0000000010141408] = 646d910d
!	Starting 10 instruction Store Burst
!	Mem[0000000030001400] = 3469733c, %l1 = 0000000000000000
	swapa	[%i0+%g0]0x89,%l1	! %l1 = 000000003469733c

p0_label_210:
!	%l3 = 0000000000000000, %l5 = ffffffffffff9fff, %l7 = 000000003469733c
	xor	%l3,%l5,%l7		! %l7 = ffffffffffff9fff
!	%l4 = ffffffffffffffff, Mem[0000000010181410] = 4cff0000
	stwa	%l4,[%i6+%o5]0x88	! Mem[0000000010181410] = ffffffff
!	%f29 = 1bb8d5ff, Mem[0000000010141408] = 646d910d
	sta	%f29,[%i5+%o4]0x88	! Mem[0000000010141408] = 1bb8d5ff
!	Mem[00000000100c140c] = 000000e3, %l3 = 0000000000000000, %asi = 80
	swapa	[%i3+0x00c]%asi,%l3	! %l3 = 00000000000000e3
!	%l3 = 00000000000000e3, Mem[00000000100c1428] = 0000088d
	stw	%l3,[%i3+0x028]		! Mem[00000000100c1428] = 000000e3
!	%l5 = ffffffffffff9fff, Mem[0000000030001400] = 00000000
	stwa	%l5,[%i0+%g0]0x81	! Mem[0000000030001400] = ffff9fff
!	Mem[00000000300c1400] = 4ca6fc6b, %l7 = ffffffffffff9fff
	swapa	[%i3+%g0]0x81,%l7	! %l7 = 000000004ca6fc6b
!	%l2 = bc00000000000000, immd = fffffffffffffb9c, %l1 = 000000003469733c
	udivx	%l2,-0x464,%l1		! %l1 = 0000000000000000
!	Mem[0000000010101409] = 00000029, %l4 = ffffffffffffffff
	ldstuba	[%i4+0x009]%asi,%l4	! %l4 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030001400] = ffff9fffc38122ff, %l3 = 00000000000000e3
	ldxa	[%i0+%g0]0x81,%l3	! %l3 = ffff9fffc38122ff

p0_label_211:
!	Mem[0000000030081408] = ffff006b, %l5 = ffffffffffff9fff
	swapa	[%i2+%o4]0x89,%l5	! %l5 = 00000000ffff006b
!	%l1 = 0000000000000000, %l4 = 0000000000000000, %y  = ffffffff
	smul	%l1,%l4,%l0		! %l0 = 0000000000000000, %y = 00000000
!	Code Fragment 4
p0_fragment_23:
!	%l0 = 0000000000000000
	setx	0x59475447b80db229,%g7,%l0 ! %l0 = 59475447b80db229
!	%l1 = 0000000000000000
	setx	0x2a7a0d3fa57b5882,%g7,%l1 ! %l1 = 2a7a0d3fa57b5882
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 59475447b80db229
	setx	0xdd72305fc8e92678,%g7,%l0 ! %l0 = dd72305fc8e92678
!	%l1 = 2a7a0d3fa57b5882
	setx	0x74426c4800d20773,%g7,%l1 ! %l1 = 74426c4800d20773
!	Mem[0000000030041410] = ffff000000000000, %l4 = 0000000000000000
	ldxa	[%i1+%o5]0x89,%l4	! %l4 = ffff000000000000
!	Mem[0000000010181408] = 5721c5ff, %l7 = 000000004ca6fc6b
	ldsba	[%i6+%o4]0x88,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000030041410] = 00000000 0000ffff, %l4 = 00000000, %l5 = ffff006b
	ldda	[%i1+%o5]0x81,%l4	! %l4 = 0000000000000000 000000000000ffff
!	Code Fragment 3
p0_fragment_24:
!	%l0 = dd72305fc8e92678
	setx	0x8f081bffa6ff9017,%g7,%l0 ! %l0 = 8f081bffa6ff9017
!	%l1 = 74426c4800d20773
	setx	0x9de5754831cd2e23,%g7,%l1 ! %l1 = 9de5754831cd2e23
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 8f081bffa6ff9017
	setx	0xcc4039602f4cb759,%g7,%l0 ! %l0 = cc4039602f4cb759
!	%l1 = 9de5754831cd2e23
	setx	0x577692dffd2058d8,%g7,%l1 ! %l1 = 577692dffd2058d8
!	Mem[0000000010041418] = 00000000 ff0d0060, %l2 = 00000000, %l3 = c38122ff
	ldda	[%i1+0x018]%asi,%l2	! %l2 = 0000000000000000 00000000ff0d0060
!	Mem[0000000010081410] = 00000000, %f17 = 00000000
	lda	[%i2+%o5]0x80,%f17	! %f17 = 00000000
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000000000, Mem[0000000010101400] = 000000ff
	stba	%l4,[%i4+%g0]0x88	! Mem[0000000010101400] = 00000000

p0_label_212:
!	%l7 = ffffffffffffffff, Mem[0000000010001400] = c4a0d0959e7c1543
	stxa	%l7,[%i0+%g0]0x80	! Mem[0000000010001400] = ffffffffffffffff
!	%l1 = 577692dffd2058d8, Mem[0000000030141410] = 00000000000000ff
	stxa	%l1,[%i5+%o5]0x89	! Mem[0000000030141410] = 577692dffd2058d8
!	%f14 = fd2146b2 e70000ff, %l5 = 000000000000ffff
!	Mem[0000000010141438] = a52e7e04000000ff
	add	%i5,0x038,%g1
	stda	%f14,[%g1+%l5]ASI_PST8_PL ! Mem[0000000010141438] = ff0000e7b24621fd
!	%f24 = ffc52157 34000032, Mem[0000000010041408] = ffffffff ff000000
	stda	%f24,[%i1+%o4]0x88	! Mem[0000000010041408] = ffc52157 34000032
!	%l0 = 2f4cb759, %l1 = fd2058d8, Mem[0000000010001408] = 60000000 047e2ea5
	stda	%l0,[%i0+%o4]0x88	! Mem[0000000010001408] = 2f4cb759 fd2058d8
!	Mem[0000000030081400] = 9fff0000, %l0 = cc4039602f4cb759
	swapa	[%i2+%g0]0x81,%l0	! %l0 = 000000009fff0000
!	Code Fragment 4
p0_fragment_25:
!	%l0 = 000000009fff0000
	setx	0xc529bdc01c6f3a8c,%g7,%l0 ! %l0 = c529bdc01c6f3a8c
!	%l1 = 577692dffd2058d8
	setx	0xb6d084406711cc89,%g7,%l1 ! %l1 = b6d084406711cc89
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = c529bdc01c6f3a8c
	setx	0xf2ac31afd599e97c,%g7,%l0 ! %l0 = f2ac31afd599e97c
!	%l1 = b6d084406711cc89
	setx	0x200f4c9ff7ce7144,%g7,%l1 ! %l1 = 200f4c9ff7ce7144
!	%f12 = 00000000 a6007f18, %l5 = 000000000000ffff
!	Mem[00000000100c1418] = 9c56136f0000b300
	add	%i3,0x018,%g1
	stda	%f12,[%g1+%l5]ASI_PST16_P ! Mem[00000000100c1418] = 00000000a6007f18
!	%l2 = 0000000000000000, imm = fffffffffffff89d, %l7 = ffffffffffffffff
	xnor	%l2,-0x763,%l7		! %l7 = 0000000000000762
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = ff9fffff, %f20 = 3c080000
	lda	[%i3+%g0]0x89,%f20	! %f20 = ff9fffff

p0_label_213:
!	Mem[00000000100c1410] = 1e0000ff00000000, %l7 = 0000000000000762
	ldxa	[%i3+%o5]0x80,%l7	! %l7 = 1e0000ff00000000
!	Mem[000000001014141c] = 00000000, %l5 = 000000000000ffff
	ldsh	[%i5+0x01e],%l5		! %l5 = 0000000000000000
!	Mem[0000000010101408] = 00ff0029, %l7 = 1e0000ff00000000
	ldsba	[%i4+%o4]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000010001410] = 00000000 000000ff, %l6 = ffffffc7, %l7 = 00000000
	ldda	[%i0+%o5]0x88,%l6	! %l6 = 00000000000000ff 0000000000000000
!	Mem[0000000010081408] = ff000000, %l5 = 0000000000000000
	lduba	[%i2+%o4]0x80,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030001400] = ffff9fff, %l3 = 00000000ff0d0060
	lduba	[%i0+%g0]0x81,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030001400] = ffff9fff, %l2 = 0000000000000000
	ldsha	[%i0+%g0]0x81,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000010101410] = 9f22251e, %l1 = 200f4c9ff7ce7144
	lduwa	[%i4+%o5]0x88,%l1	! %l1 = 000000009f22251e
!	Mem[0000000030041410] = 00000000 0000ffff, %l6 = 000000ff, %l7 = 00000000
	ldda	[%i1+%o5]0x81,%l6	! %l6 = 0000000000000000 000000000000ffff
!	Starting 10 instruction Store Burst
!	Mem[0000000010081400] = 000000ff, %l2 = ffffffffffffffff
	swapa	[%i2+%g0]0x80,%l2	! %l2 = 00000000000000ff

p0_label_214:
!	Mem[0000000010141408] = 1bb8d5ff, %l4 = 0000000000000000
	swapa	[%i5+%o4]0x88,%l4	! %l4 = 000000001bb8d5ff
!	%f26 = 95d0a0c4 000000ff, Mem[0000000030041410] = 00000000 ffff0000
	stda	%f26,[%i1+%o5]0x89	! Mem[0000000030041410] = 95d0a0c4 000000ff
!	%f3  = 000000e3, Mem[0000000030141408] = bc000000
	sta	%f3 ,[%i5+%o4]0x81	! Mem[0000000030141408] = 000000e3
!	Mem[000000001000140c] = d85820fd, %l7 = 000000000000ffff
	swap	[%i0+0x00c],%l7		! %l7 = 00000000d85820fd
!	%l2 = 000000ff, %l3 = 000000ff, Mem[0000000010001408] = 2f4cb759 ffff0000
	stda	%l2,[%i0+%o4]0x88	! Mem[0000000010001408] = 000000ff 000000ff
!	Mem[0000000010101420] = 00003010, %l3 = 00000000000000ff
	ldstub	[%i4+0x020],%l3		! %l3 = 00000000000000ff
!	Mem[0000000010001428] = d2038d0829000000, %l7 = 00000000d85820fd, %l0 = f2ac31afd599e97c
	add	%i0,0x28,%g1
	casxa	[%g1]0x80,%l7,%l0	! %l0 = d2038d0829000000
!	%l1 = 000000009f22251e, Mem[0000000030041410] = ff000000c4a0d095
	stxa	%l1,[%i1+%o5]0x81	! Mem[0000000030041410] = 000000009f22251e
!	%l0 = 29000000, %l1 = 9f22251e, Mem[0000000010141408] = 00000000 60000000
	stda	%l0,[%i5+%o4]0x88	! Mem[0000000010141408] = 29000000 9f22251e
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = ff080000cb800000, %f18 = ffffffff 60000000
	ldda	[%i3+%g0]0x80,%f18	! %f18 = ff080000 cb800000

p0_label_215:
!	Mem[0000000030001410] = 00000000, %f21 = 00273010
	lda	[%i0+%o5]0x81,%f21	! %f21 = 00000000
!	Mem[0000000020800000] = ffffe062, %l1 = 000000009f22251e
	lduha	[%o1+0x000]%asi,%l1	! %l1 = 000000000000ffff
!	Mem[0000000030041400] = ff2281c33469733c, %f4  = 00000000 0000ffff
	ldda	[%i1+%g0]0x89,%f4 	! %f4  = ff2281c3 3469733c
!	Mem[0000000030041410] = 00000000, %l0 = d2038d0829000000
	ldsba	[%i1+%o5]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000021800180] = ffb7423e, %l7 = 00000000d85820fd
	ldsha	[%o3+0x180]%asi,%l7	! %l7 = ffffffffffffffb7
!	Mem[0000000030101408] = 0000009f, %l0 = 0000000000000000
	lduwa	[%i4+%o4]0x89,%l0	! %l0 = 000000000000009f
!	Mem[0000000030041400] = 3c736934, %l6 = 0000000000000000
	lduba	[%i1+%g0]0x81,%l6	! %l6 = 000000000000003c
!	Mem[0000000010141400] = 00000000, %l2 = 00000000000000ff
	lduba	[%i5+%g0]0x80,%l2	! %l2 = 0000000000000000
!	Mem[00000000100c1408] = ff00000000000000, %f0  = 3c736934 c38122ff
	ldda	[%i3+%o4]0x80,%f0 	! %f0  = ff000000 00000000
!	Starting 10 instruction Store Burst
!	%f15 = e70000ff, Mem[00000000100c1408] = 000000ff
	sta	%f15,[%i3+%o4]0x88	! Mem[00000000100c1408] = e70000ff

p0_label_216:
!	Mem[0000000010081400] = ffffffff, %l3 = 0000000000000000
	swapa	[%i2+%g0]0x80,%l3	! %l3 = 00000000ffffffff
!	%f16 = 000000ff 00000000, Mem[0000000030041400] = 3c736934 c38122ff
	stda	%f16,[%i1+%g0]0x81	! Mem[0000000030041400] = 000000ff 00000000
!	Mem[0000000010141400] = 00000000, %l5 = 00000000000000ff
	ldstuba	[%i5+%g0]0x80,%l5	! %l5 = 00000000000000ff
!	%l2 = 00000000, %l3 = ffffffff, Mem[0000000030141400] = 0000009f 00000000
	stda	%l2,[%i5+%g0]0x81	! Mem[0000000030141400] = 00000000 ffffffff
!	Mem[0000000030141408] = e3000000, %l0 = 000000000000009f
	swapa	[%i5+%o4]0x89,%l0	! %l0 = 00000000e3000000
!	%l0 = 00000000e3000000, Mem[00000000300c1408] = 000000001e000000
	stxa	%l0,[%i3+%o4]0x89	! Mem[00000000300c1408] = 00000000e3000000
!	Mem[0000000010001400] = ffffffff, %l4 = 000000001bb8d5ff
	swapa	[%i0+%g0]0x80,%l4	! %l4 = 00000000ffffffff
!	Mem[0000000030041408] = 00000000, %l7 = ffffffffffffffb7
	swapa	[%i1+%o4]0x81,%l7	! %l7 = 0000000000000000
!	%l0 = e3000000, %l1 = 0000ffff, Mem[0000000030181410] = 60000000 00000000
	stda	%l0,[%i6+%o5]0x81	! Mem[0000000030181410] = e3000000 0000ffff
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = ff000000, %l6 = 000000000000003c
	lduha	[%i5+%o5]0x80,%l6	! %l6 = 000000000000ff00

p0_label_217:
!	Mem[0000000030001408] = e3000000ffffff9f, %f6  = 646d910d 7abbfe4d
	ldda	[%i0+%o4]0x89,%f6 	! %f6  = e3000000 ffffff9f
!	Mem[0000000021800180] = ffb7423e, %l2 = 0000000000000000
	lduha	[%o3+0x180]%asi,%l2	! %l2 = 000000000000ffb7
!	Mem[0000000010181400] = ff000000, %l4 = 00000000ffffffff
	ldswa	[%i6+%g0]0x80,%l4	! %l4 = ffffffffff000000
!	Mem[00000000100c1428] = 000000e3e2a2eaff, %f12 = 00000000 a6007f18
	ldd	[%i3+0x028],%f12	! %f12 = 000000e3 e2a2eaff
!	Mem[0000000010181438] = 000003d2, %l5 = 0000000000000000
	ldsh	[%i6+0x03a],%l5		! %l5 = 00000000000003d2
!	Mem[0000000010101410] = 9f22251e, %l6 = 000000000000ff00
	lduha	[%i4+%o5]0x88,%l6	! %l6 = 000000000000251e
!	Mem[0000000030001400] = ff9fffff, %l0 = 00000000e3000000
	lduha	[%i0+%g0]0x89,%l0	! %l0 = 000000000000ffff
!	%l5 = 00000000000003d2, immd = fffffffffffff522, %l6  = 000000000000251e
	mulx	%l5,-0xade,%l6		! %l6 = ffffffffffd67be4
!	Mem[0000000010041414] = 00000000, %l6 = ffffffffffd67be4
	lduw	[%i1+0x014],%l6		! %l6 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010181437] = 47ee08bd, %l7 = 0000000000000000
	ldstuba	[%i6+0x037]%asi,%l7	! %l7 = 000000bd000000ff

p0_label_218:
!	%l6 = 0000000000000000, Mem[00000000201c0000] = b39f01ce, %asi = 80
	stha	%l6,[%o0+0x000]%asi	! Mem[00000000201c0000] = 000001ce
!	%f8  = 00000000 340000ff, %l0 = 000000000000ffff
!	Mem[0000000030181418] = 9c56136f606cfca9
	add	%i6,0x018,%g1
	stda	%f8,[%g1+%l0]ASI_PST8_SL ! Mem[0000000030181418] = ff00003400000000
!	%f16 = 000000ff 00000000, %l2 = 000000000000ffb7
!	Mem[0000000010181418] = 60b136e460b1fbe4
	add	%i6,0x018,%g1
	stda	%f16,[%g1+%l2]ASI_PST8_PL ! Mem[0000000010181418] = 000000e4ff00fb00
!	%f2  = 00000000, %f16 = 000000ff, %f0  = ff000000
	fadds	%f2 ,%f16,%f0 		! %l0 = 0000000000010021, Unfinished, %fsr = 0d00000800
!	%l3 = 00000000ffffffff, Mem[0000000030181400] = ff000000
	stba	%l3,[%i6+%g0]0x81	! Mem[0000000030181400] = ff000000
!	%l5 = 00000000000003d2, Mem[0000000010041410] = 000008ff
	stwa	%l5,[%i1+%o5]0x80	! Mem[0000000010041410] = 000003d2
!	%l5 = 00000000000003d2, Mem[0000000030081400] = 59b74c2f
	stha	%l5,[%i2+%g0]0x89	! Mem[0000000030081400] = 59b703d2
!	%l2 = 000000000000ffb7, Mem[0000000030001410] = 00000000
	stba	%l2,[%i0+%o5]0x81	! Mem[0000000030001410] = b7000000
!	%l2 = 000000000000ffb7, Mem[0000000010181410] = ffffffff
	stba	%l2,[%i6+%o5]0x88	! Mem[0000000010181410] = ffffffb7
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = 29000000, %l3 = 00000000ffffffff
	ldsba	[%i5+%o4]0x88,%l3	! %l3 = 0000000000000000

p0_label_219:
!	Mem[0000000010181408] = ffc52157, %l4 = ffffffffff000000
	ldswa	[%i6+%o4]0x80,%l4	! %l4 = ffffffffffc52157
!	Mem[0000000030141408] = 9f00000000000000, %l0 = 0000000000010021
	ldxa	[%i5+%o4]0x81,%l0	! %l0 = 9f00000000000000
!	Mem[0000000010181428] = 0000000000000000, %f26 = 95d0a0c4 000000ff
	ldd	[%i6+0x028],%f26	! %f26 = 00000000 00000000
!	Mem[00000000211c0000] = 0000e5a1, %l0 = 9f00000000000000
	lduba	[%o2+0x001]%asi,%l0	! %l0 = 0000000000000000
!	Mem[0000000030101400] = fffca64ca52e7e04, %f4  = ff2281c3 3469733c
	ldda	[%i4+%g0]0x81,%f4 	! %f4  = fffca64c a52e7e04
!	%f30 = 000000ff f28b69b5, %f10 = 95d0a0c4
	fxtos	%f30,%f10		! %f10 = 537ff28b
!	Mem[00000000300c1410] = 00000000, %l5 = 00000000000003d2
	lduha	[%i3+%o5]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000010141400] = ff00000000000060, %l0 = 0000000000000000
	ldxa	[%i5+%g0]0x80,%l0	! %l0 = ff00000000000060
!	%l5 = 0000000000000000, %l3 = 0000000000000000, %l6 = 0000000000000000
	and	%l5,%l3,%l6		! %l6 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l4 = ffffffffffc52157, Mem[0000000030041410] = 00000000
	stba	%l4,[%i1+%o5]0x89	! Mem[0000000030041410] = 00000057

p0_label_220:
!	%l3 = 0000000000000000, Mem[0000000010041431] = 088d03d2
	stb	%l3,[%i1+0x031]		! Mem[0000000010041430] = 080003d2
!	%f22 = 646d910d 00000000, Mem[00000000300c1408] = e3000000 00000000
	stda	%f22,[%i3+%o4]0x89	! Mem[00000000300c1408] = 646d910d 00000000
!	%l4 = ffffffffffc52157, Mem[0000000030041410] = 57000000
	stha	%l4,[%i1+%o5]0x81	! Mem[0000000030041410] = 21570000
!	%l0 = 00000060, %l1 = 0000ffff, Mem[0000000010141410] = 000000ff e0adcbff
	stda	%l0,[%i5+%o5]0x88	! Mem[0000000010141410] = 00000060 0000ffff
!	Mem[0000000030141410] = fd2058d8, %l3 = 0000000000000000
	swapa	[%i5+%o5]0x89,%l3	! %l3 = 00000000fd2058d8
!	%f16 = 000000ff 00000000 ff080000 cb800000
!	%f20 = ff9fffff 00000000 646d910d 00000000
!	%f24 = ffc52157 34000032 00000000 00000000
!	%f28 = 00000057 1bb8d5ff 000000ff f28b69b5
	stda	%f16,[%i2]ASI_BLK_AIUS	! Block Store to 0000000030081400
!	%l5 = 0000000000000000, Mem[0000000010001410] = ff000000
	stwa	%l5,[%i0+%o5]0x80	! Mem[0000000010001410] = 00000000
!	Mem[0000000030001400] = ffff9fff, %l5 = 0000000000000000
	swapa	[%i0+%g0]0x81,%l5	! %l5 = 00000000ffff9fff
!	%l4 = ffffffffffc52157, Mem[0000000010001410] = 00000000
	stwa	%l4,[%i0+%o5]0x88	! Mem[0000000010001410] = ffc52157
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = 000000ff, %l4 = ffffffffffc52157
	lduwa	[%i6+%g0]0x88,%l4	! %l4 = 00000000000000ff

p0_label_221:
!	Mem[0000000030141410] = 00000000, %l5 = 00000000ffff9fff
	lduba	[%i5+%o5]0x89,%l5	! %l5 = 0000000000000000
!	Mem[00000000201c0000] = 000001ce, %l4 = 00000000000000ff
	lduba	[%o0+0x001]%asi,%l4	! %l4 = 0000000000000000
!	Mem[0000000010001400] = ffffffffffd5b81b, %f0  = ff000000 00000000
	ldda	[%i0+%g0]0x88,%f0 	! %f0  = ffffffff ffd5b81b
!	Mem[0000000030001408] = 9fffffff, %l0 = ff00000000000060
	ldswa	[%i0+%o4]0x81,%l0	! %l0 = ffffffff9fffffff
!	Mem[0000000030101408] = 9f000000, %l4 = 0000000000000000
	lduha	[%i4+%o4]0x81,%l4	! %l4 = 0000000000009f00
!	Mem[0000000010141400] = 60000000 000000ff, %l0 = 9fffffff, %l1 = 0000ffff
	ldda	[%i5+%g0]0x88,%l0	! %l0 = 00000000000000ff 0000000060000000
!	Mem[0000000030141410] = 00000000, %l6 = 0000000000000000
	lduha	[%i5+%o5]0x81,%l6	! %l6 = 0000000000000000
	membar	#Sync			! Added by membar checker (31)
!	Mem[0000000010081418] = 00000000000000ff, %f4  = fffca64c a52e7e04
	ldd	[%i2+0x018],%f4 	! %f4  = 00000000 000000ff
!	Mem[00000000211c0000] = 0000e5a1, %l6 = 0000000000000000
	ldsba	[%o2+0x000]%asi,%l6	! %l6 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010101400] = 00000000, %l5 = 0000000000000000
	swapa	[%i4+%g0]0x80,%l5	! %l5 = 0000000000000000

p0_label_222:
!	%l3 = 00000000fd2058d8, Mem[00000000211c0001] = 0000e5a1
	stb	%l3,[%o2+0x001]		! Mem[00000000211c0000] = 00d8e5a1
!	Code Fragment 4
p0_fragment_26:
!	%l0 = 00000000000000ff
	setx	0xb019de28705926b5,%g7,%l0 ! %l0 = b019de28705926b5
!	%l1 = 0000000060000000
	setx	0xf471a7a07f29db79,%g7,%l1 ! %l1 = f471a7a07f29db79
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = b019de28705926b5
	setx	0x960c702fc5e7caf7,%g7,%l0 ! %l0 = 960c702fc5e7caf7
!	%l1 = f471a7a07f29db79
	setx	0x06d96e485ebc4efa,%g7,%l1 ! %l1 = 06d96e485ebc4efa
!	%l3 = 00000000fd2058d8, Mem[0000000030041400] = 000000ff
	stwa	%l3,[%i1+%g0]0x81	! Mem[0000000030041400] = fd2058d8
!	Mem[00000000300c1400] = ff9fffff, %l7 = 00000000000000bd
	ldstuba	[%i3+%g0]0x89,%l7	! %l7 = 000000ff000000ff
!	%l2 = 000000000000ffb7, Mem[0000000010001408] = ff000000
	stha	%l2,[%i0+%o4]0x80	! Mem[0000000010001408] = ffb70000
!	%l2 = 000000000000ffb7, Mem[0000000030041410] = 21570000
	stba	%l2,[%i1+%o5]0x81	! Mem[0000000030041410] = b7570000
!	Mem[0000000010141414] = ffff0000, %l3 = 00000000fd2058d8
	swap	[%i5+0x014],%l3		! %l3 = 00000000ffff0000
!	%l0 = 960c702fc5e7caf7, Mem[0000000010141410] = 60000000
	stba	%l0,[%i5+%o5]0x80	! Mem[0000000010141410] = f7000000
!	%l4 = 00009f00, %l5 = 00000000, Mem[0000000010001400] = 1bb8d5ff ffffffff
	stda	%l4,[%i0+%g0]0x80	! Mem[0000000010001400] = 00009f00 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = 9f000000 ffffffff, %l2 = 0000ffb7, %l3 = ffff0000
	ldda	[%i4+%o4]0x81,%l2	! %l2 = 000000009f000000 00000000ffffffff

p0_label_223:
!	%f19 = cb800000, %f1  = ffd5b81b, %f22 = 646d910d 00000000
	fsmuld	%f19,%f1 ,%f22		! %f22 = fffab703 60000000
!	Mem[00000000300c1400] = ff9fffff, %l3 = 00000000ffffffff
	ldsba	[%i3+%g0]0x89,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000030141410] = 00000000, %l3 = ffffffffffffffff
	swapa	[%i5+%o5]0x89,%l3	! %l3 = 0000000000000000
	membar	#Sync			! Added by membar checker (32)
!	Mem[00000000300c1400] = ffff9fff 654a7d29 00000000 0d916d64
!	Mem[00000000300c1410] = 00000000 00000000 60000000 00000000
!	Mem[00000000300c1420] = 00000000 34697300 a52e7e04 e2a2ea29
!	Mem[00000000300c1430] = e3000000 d2038d08 00000000 00000000
	ldda	[%i3]ASI_BLK_S,%f16	! Block Load from 00000000300c1400
!	Mem[000000001010142c] = 047e2ea5, %l0 = 960c702fc5e7caf7
	ldsh	[%i4+0x02c],%l0		! %l0 = 000000000000047e
!	Mem[0000000010181410] = ffffffb7, %l2 = 000000009f000000
	lduha	[%i6+%o5]0x88,%l2	! %l2 = 000000000000ffb7
!	Mem[00000000300c1400] = ff9fffff, %l3 = 0000000000000000
	lduha	[%i3+%g0]0x89,%l3	! %l3 = 000000000000ffff
!	Mem[0000000010141430] = 003c4adb1560aefe, %l2 = 000000000000ffb7
	ldxa	[%i5+0x030]%asi,%l2	! %l2 = 003c4adb1560aefe
!	Mem[0000000010181410] = ffffffb7, %f7  = ffffff9f
	lda	[%i6+%o5]0x88,%f7 	! %f7 = ffffffb7
!	Starting 10 instruction Store Burst
!	%f0  = ffffffff ffd5b81b, Mem[0000000030081410] = ffff9fff 00000000
	stda	%f0 ,[%i2+%o5]0x89	! Mem[0000000030081410] = ffffffff ffd5b81b

p0_label_224:
!	Mem[00000000218000c1] = 19c5d5a0, %l5 = 0000000000000000
	ldstub	[%o3+0x0c1],%l5		! %l5 = 000000c5000000ff
!	%f6  = e3000000 ffffffb7, Mem[0000000010041420] = 00736934 00000000
	std	%f6 ,[%i1+0x020]	! Mem[0000000010041420] = e3000000 ffffffb7
!	Mem[00000000300c1400] = ff9fffff, %l4 = 0000000000009f00
	ldstuba	[%i3+%g0]0x89,%l4	! %l4 = 000000ff000000ff
!	%l5 = 00000000000000c5, Mem[0000000030101400] = 4ca6fcff
	stwa	%l5,[%i4+%g0]0x89	! Mem[0000000030101400] = 000000c5
!	%f12 = 000000e3 e2a2eaff, Mem[00000000100c1410] = 1e0000ff 00000000
	std	%f12,[%i3+%o5]	! Mem[00000000100c1410] = 000000e3 e2a2eaff
!	Mem[00000000100c1410] = e3000000, %l2 = 003c4adb1560aefe
	swapa	[%i3+%o5]0x88,%l2	! %l2 = 00000000e3000000
!	%f4  = 00000000, Mem[0000000030141410] = ffffffff
	sta	%f4 ,[%i5+%o5]0x81	! Mem[0000000030141410] = 00000000
!	%l2 = e3000000, %l3 = 0000ffff, Mem[0000000030181410] = 000000e3 ffff0000
	stda	%l2,[%i6+%o5]0x89	! Mem[0000000030181410] = e3000000 0000ffff
!	Mem[0000000030001410] = b7000000, %l2 = 00000000e3000000
	swapa	[%i0+%o5]0x81,%l2	! %l2 = 00000000b7000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010101430] = 088d03d2, %l0 = 000000000000047e
	lduba	[%i4+0x032]%asi,%l0	! %l0 = 0000000000000003

p0_label_225:
!	Mem[0000000030141410] = 00000000, %l2 = 00000000b7000000
	ldswa	[%i5+%o5]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000010181420] = a334634c, %l1 = 06d96e485ebc4efa
	ldsw	[%i6+0x020],%l1		! %l1 = ffffffffa334634c
!	Mem[0000000030081400] = 000000ff, %l2 = 0000000000000000
	lduha	[%i2+%g0]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000030041408] = b7ffffff, %f3  = 000000e3
	lda	[%i1+%o4]0x89,%f3 	! %f3 = b7ffffff
!	Mem[00000000100c1410] = 1560aefe, %l3 = 000000000000ffff
	ldswa	[%i3+%o5]0x88,%l3	! %l3 = 000000001560aefe
!	Mem[0000000030181400] = 000000ff, %l0 = 0000000000000003
	lduha	[%i6+%g0]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030141408] = 9f000000 00000000, %l4 = 000000ff, %l5 = 000000c5
	ldda	[%i5+%o4]0x81,%l4	! %l4 = 000000009f000000 0000000000000000
!	%l6 = 0000000000000000, immed = 0000029d, %y  = 00000000
	udiv	%l6,0x29d,%l3		! %l3 = 0000000000000000
	mov	%l0,%y			! %y = 000000ff
!	%l6 = 0000000000000000, immd = fffffffffffff847, %l2 = 0000000000000000
	udivx	%l6,-0x7b9,%l2		! %l2 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l0 = 00000000000000ff, Mem[0000000020800040] = 0000f99a
	sth	%l0,[%o1+0x040]		! Mem[0000000020800040] = 00fff99a

p0_label_226:
!	%l0 = 00000000000000ff, Mem[00000000218001c1] = 00ffc752
	stb	%l0,[%o3+0x1c1]		! Mem[00000000218001c0] = 00ffc752
!	%l4 = 000000009f000000, Mem[000000001010142e] = 047e2ea5, %asi = 80
	stba	%l4,[%i4+0x02e]%asi	! Mem[000000001010142c] = 047e00a5
!	Mem[0000000010181408] = 5721c5ff, %l1 = ffffffffa334634c
	swapa	[%i6+%o4]0x88,%l1	! %l1 = 000000005721c5ff
!	Mem[0000000030001400] = 00000000, %l3 = 0000000000000000
	swapa	[%i0+%g0]0x81,%l3	! %l3 = 0000000000000000
	membar	#Sync			! Added by membar checker (33)
!	%l0 = 00000000000000ff, Mem[00000000300c1408] = 00000000
	stba	%l0,[%i3+%o4]0x89	! Mem[00000000300c1408] = 000000ff
!	Mem[0000000010041410] = 000003d2, %l3 = 0000000000000000
	ldstuba	[%i1+%o5]0x80,%l3	! %l3 = 00000000000000ff
!	%f16 = ffff9fff 654a7d29 00000000 0d916d64
!	%f20 = 00000000 00000000 60000000 00000000
!	%f24 = 00000000 34697300 a52e7e04 e2a2ea29
!	%f28 = e3000000 d2038d08 00000000 00000000
	stda	%f16,[%i5]ASI_BLK_AIUPL	! Block Store to 0000000010141400
!	Mem[0000000010001418] = 00000000, %l6 = 0000000000000000
	swap	[%i0+0x018],%l6		! %l6 = 0000000000000000
!	%f15 = e70000ff, %f5  = 000000ff
	fcmpes	%fcc1,%f15,%f5 		! %fcc1 = 1
!	Starting 10 instruction Load Burst
!	Mem[0000000010041418] = 00000000, %f11 = 6bd091ff
	lda	[%i1+0x018]%asi,%f11	! %f11 = 00000000

p0_label_227:
!	Mem[00000000211c0000] = 00d8e5a1, %l3 = 0000000000000000
	ldsb	[%o2+%g0],%l3		! %l3 = 0000000000000000
!	Mem[0000000010081410] = 00000000, %f8  = 00000000
	lda	[%i2+%o5]0x80,%f8 	! %f8 = 00000000
!	Mem[00000000100c1418] = 00000000a6007f18, %l3 = 0000000000000000
	ldxa	[%i3+0x018]%asi,%l3	! %l3 = 00000000a6007f18
!	Mem[0000000010081438] = 00bc0000, %l0 = 00000000000000ff
	ldsha	[%i2+0x038]%asi,%l0	! %l0 = 00000000000000bc
!	Mem[00000000300c1408] = ff000000, %l6 = 0000000000000000
	ldsha	[%i3+%o4]0x81,%l6	! %l6 = ffffffffffffff00
!	Mem[0000000010041400] = ffffffad, %l6 = ffffffffffffff00
	lduha	[%i1+%g0]0x88,%l6	! %l6 = 000000000000ffad
!	%l4 = 9f000000, %l5 = 00000000, Mem[0000000010101438] = 00000000 00000000
	stda	%l4,[%i4+0x038]%asi	! Mem[0000000010101438] = 9f000000 00000000
!	Mem[0000000030101400] = c5000000, %l4 = 000000009f000000
	ldswa	[%i4+%g0]0x81,%l4	! %l4 = ffffffffc5000000
!	Mem[00000000100c1410] = 1560aefe, %l6 = 000000000000ffad
	ldswa	[%i3+%o5]0x88,%l6	! %l6 = 000000001560aefe
!	Starting 10 instruction Store Burst
!	%f4  = 00000000, Mem[0000000030081400] = 000000ff
	sta	%f4 ,[%i2+%g0]0x81	! Mem[0000000030081400] = 00000000

p0_label_228:
!	%l3 = 00000000a6007f18, Mem[0000000030101410] = 00000000
	stha	%l3,[%i4+%o5]0x81	! Mem[0000000030101410] = 7f180000
!	%f2  = 00000000 b7ffffff, Mem[0000000010181400] = 000000ff 00000000
	stda	%f2 ,[%i6+%g0]0x88	! Mem[0000000010181400] = 00000000 b7ffffff
!	%l0 = 000000bc, %l1 = 5721c5ff, Mem[0000000030041408] = ffffffb7 000000e3
	stda	%l0,[%i1+%o4]0x81	! Mem[0000000030041408] = 000000bc 5721c5ff
!	%f16 = ffff9fff 654a7d29 00000000 0d916d64
!	%f20 = 00000000 00000000 60000000 00000000
!	%f24 = 00000000 34697300 a52e7e04 e2a2ea29
!	%f28 = e3000000 d2038d08 00000000 00000000
	stda	%f16,[%i5]ASI_COMMIT_S	! Block Store to 0000000030141400
	membar	#Sync			! Added by membar checker (34)
!	Mem[0000000010141400] = 297d4a65, %l3 = a6007f18, %l5 = 00000000
	casa	[%i5]0x80,%l3,%l5	! %l5 = 00000000297d4a65
!	Mem[0000000010181400] = b7ffffff, %l1 = 000000005721c5ff
	swapa	[%i6+%g0]0x88,%l1	! %l1 = 00000000b7ffffff
!	Mem[0000000010041410] = ff0003d2, %l1 = 00000000b7ffffff
	ldstuba	[%i1+%o5]0x80,%l1	! %l1 = 000000ff000000ff
!	%f28 = e3000000, Mem[0000000030001410] = e3000000
	sta	%f28,[%i0+%o5]0x81	! Mem[0000000030001410] = e3000000
!	%f24 = 00000000 34697300, %l0 = 00000000000000bc
!	Mem[0000000030181410] = 000000e3ffff0000
	add	%i6,0x010,%g1
	stda	%f24,[%g1+%l0]ASI_PST16_SL ! Mem[0000000030181410] = 000000e300000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = 5721c5ff, %l1 = 00000000000000ff
	lduha	[%i6+%g0]0x88,%l1	! %l1 = 000000000000c5ff

p0_label_229:
!	Mem[0000000030181400] = 000000ff, %l1 = 000000000000c5ff
	lduba	[%i6+%g0]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[00000000100c1408] = ff0000e7, %f17 = 654a7d29
	ld	[%i3+%o4],%f17	! %f17 = ff0000e7
!	Mem[0000000010001400] = 009f0000, %l3 = 00000000a6007f18
	ldswa	[%i0+%g0]0x88,%l3	! %l3 = 00000000009f0000
!	Mem[0000000010141410] = 00000000, %l1 = 00000000000000ff
	lduha	[%i5+%o5]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010001400] = 00000000009f0000, %l2 = 0000000000000000
	ldxa	[%i0+%g0]0x88,%l2	! %l2 = 00000000009f0000
!	Mem[0000000010001400] = 00009f0000000000, %l4 = ffffffffc5000000
	ldxa	[%i0+0x000]%asi,%l4	! %l4 = 00009f0000000000
!	Mem[000000001014143c] = 00000000, %l0 = 00000000000000bc
	lduwa	[%i5+0x03c]%asi,%l0	! %l0 = 0000000000000000
!	%l1 = 0000000000000000, imm = 000000000000042b, %l1 = 0000000000000000
	subc	%l1,0x42b,%l1		! %l1 = fffffffffffffbd5
!	Mem[0000000021800000] = ffff18df, %l4 = 00009f0000000000
	ldsh	[%o3+%g0],%l4		! %l4 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%f22 = 60000000 00000000, Mem[0000000010101410] = 9f22251e 00000000
	stda	%f22,[%i4+%o5]0x88	! Mem[0000000010101410] = 60000000 00000000

p0_label_230:
!	%l0 = 0000000000000000, immd = 0000000000000bfd, %l1 = fffffffffffffbd5
	sdivx	%l0,0xbfd,%l1		! %l1 = 0000000000000000
!	%l0 = 00000000, %l1 = 00000000, Mem[0000000010001408] = 0000b7ff 000000ff
	stda	%l0,[%i0+%o4]0x88	! Mem[0000000010001408] = 00000000 00000000
!	Mem[000000001004142c] = 047e2ea5, %l1 = 0000000000000000
	swap	[%i1+0x02c],%l1		! %l1 = 00000000047e2ea5
!	Mem[0000000030141400] = ffff9fff, %l1 = 00000000047e2ea5
	swapa	[%i5+%g0]0x81,%l1	! %l1 = 00000000ffff9fff
!	%f26 = a52e7e04, Mem[0000000010041408] = 34000032
	sta	%f26,[%i1+%o4]0x88	! Mem[0000000010041408] = a52e7e04
!	%l0 = 0000000000000000, Mem[0000000010001400] = 00009f00
	stba	%l0,[%i0+%g0]0x80	! Mem[0000000010001400] = 00009f00
!	%f14 = fd2146b2 e70000ff, Mem[0000000010101408] = 00ff0029 0000009f
	stda	%f14,[%i4+%o4]0x80	! Mem[0000000010101408] = fd2146b2 e70000ff
!	%f20 = 00000000 00000000, %l0 = 0000000000000000
!	Mem[0000000030181430] = e3000000d2038d08
	add	%i6,0x030,%g1
	stda	%f20,[%g1+%l0]ASI_PST32_SL ! Mem[0000000030181430] = e3000000d2038d08
!	%l6 = 000000001560aefe, Mem[0000000010181408] = a334634c
	stha	%l6,[%i6+%o4]0x88	! Mem[0000000010181408] = a334aefe
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = 9f000000, %l5 = 00000000297d4a65
	swapa	[%i4+%o4]0x81,%l5	! %l5 = 000000009f000000

p0_label_231:
!	Mem[00000000300c1408] = 646d910d000000ff, %f26 = a52e7e04 e2a2ea29
	ldda	[%i3+%o4]0x89,%f26	! %f26 = 646d910d 000000ff
!	Mem[00000000300c1410] = 00000000 00000000, %l2 = 009f0000, %l3 = 009f0000
	ldda	[%i3+%o5]0x89,%l2	! %l2 = 0000000000000000 0000000000000000
!	Mem[0000000030001408] = 9fffffff, %l7 = 00000000000000ff
	lduba	[%i0+%o4]0x81,%l7	! %l7 = 000000000000009f
!	Mem[00000000300c1400] = ffff9fff 654a7d29, %l6 = 1560aefe, %l7 = 0000009f
	ldda	[%i3+%g0]0x81,%l6	! %l6 = 00000000ffff9fff 00000000654a7d29
!	Mem[0000000010141400] = 654a7d29, %l1 = 00000000ffff9fff
	ldswa	[%i5+%g0]0x88,%l1	! %l1 = 00000000654a7d29
!	Mem[0000000030141400] = a52e7e04, %l1 = 00000000654a7d29
	ldswa	[%i5+%g0]0x89,%l1	! %l1 = ffffffffa52e7e04
!	%f29 = d2038d08, %f11 = 00000000, %f8  = 00000000
	fsubs	%f29,%f11,%f8 		! %f8  = d2038d08
!	Mem[00000000100c1408] = ff0000e7 00000000, %l6 = ffff9fff, %l7 = 654a7d29
	ldda	[%i3+%o4]0x80,%l6	! %l6 = 00000000ff0000e7 0000000000000000
!	Mem[0000000010141424] = 00000000, %l3 = 0000000000000000
	lduw	[%i5+0x024],%l3		! %l3 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1418] = 00000000, %l7 = 0000000000000000
	swap	[%i3+0x018],%l7		! %l7 = 0000000000000000

p0_label_232:
!	%l0 = 0000000000000000, Mem[00000000100c1407] = cb800000
	stb	%l0,[%i3+0x007]		! Mem[00000000100c1404] = cb800000
!	Mem[000000001010142c] = 047e00a5, %l2 = 0000000000000000, %asi = 80
	swapa	[%i4+0x02c]%asi,%l2	! %l2 = 00000000047e00a5
!	Mem[0000000030181410] = 000000e3, %l3 = 0000000000000000
	ldstuba	[%i6+%o5]0x81,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030181410] = ff0000e3, %l4 = ffffffffffffffff
	ldstuba	[%i6+%o5]0x81,%l4	! %l4 = 000000ff000000ff
!	%l5 = 000000009f000000, Mem[0000000030081408] = ff080000
	stba	%l5,[%i2+%o4]0x81	! Mem[0000000030081408] = 00080000
!	%l4 = 00000000000000ff, Mem[0000000010041410] = d20300ff
	stha	%l4,[%i1+%o5]0x88	! Mem[0000000010041410] = d20300ff
!	Mem[0000000010181410] = ffffffb7, %l7 = 0000000000000000
	ldstuba	[%i6+%o5]0x88,%l7	! %l7 = 000000b7000000ff
!	%l2 = 047e00a5, %l3 = 00000000, Mem[0000000030041408] = 000000bc 5721c5ff
	stda	%l2,[%i1+%o4]0x81	! Mem[0000000030041408] = 047e00a5 00000000
!	%f22 = 60000000, Mem[00000000300c1408] = 000000ff
	sta	%f22,[%i3+%o4]0x89	! Mem[00000000300c1408] = 60000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = 654a7d29, %l0 = 0000000000000000
	ldsba	[%i4+%o4]0x89,%l0	! %l0 = 0000000000000029

p0_label_233:
!	Mem[0000000030101410] = 000000290000187f, %f20 = 00000000 00000000
	ldda	[%i4+%o5]0x89,%f20	! %f20 = 00000029 0000187f
!	Mem[0000000010081400] = 00000000, %f14 = fd2146b2
	lda	[%i2+%g0]0x88,%f14	! %f14 = 00000000
!	Mem[0000000010141410] = 00000000, %f17 = ff0000e7
	lda	[%i5+%o5]0x80,%f17	! %f17 = 00000000
!	Mem[0000000030141410] = 0000000000000000, %l7 = 00000000000000b7
	ldxa	[%i5+%o5]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000010081400] = 00000000, %l6 = 00000000ff0000e7
	ldsba	[%i2+%g0]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000030141408] = 00000000, %l6 = 0000000000000000
	ldsba	[%i5+%o4]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000010141418] = 0000000000000060, %l6 = 0000000000000000
	ldxa	[%i5+0x018]%asi,%l6	! %l6 = 0000000000000060
!	Mem[00000000211c0000] = 00d8e5a1, %l5 = 000000009f000000
	ldsba	[%o2+0x001]%asi,%l5	! %l5 = ffffffffffffffd8
!	Mem[0000000010101430] = 088d03d2, %l7 = 0000000000000000
	ldsh	[%i4+0x032],%l7		! %l7 = 00000000000003d2
!	Starting 10 instruction Store Burst
!	Mem[0000000021800001] = ffff18df, %l0 = 0000000000000029
	ldstub	[%o3+0x001],%l0		! %l0 = 000000ff000000ff

p0_label_234:
!	%l1 = ffffffffa52e7e04, Mem[0000000030141410] = 00000000
	stba	%l1,[%i5+%o5]0x89	! Mem[0000000030141410] = 00000004
!	%l4 = 00000000000000ff, Mem[0000000030181400] = ff000000
	stwa	%l4,[%i6+%g0]0x81	! Mem[0000000030181400] = 000000ff
!	Mem[0000000010001410] = 5721c5ff, %l6 = 0000000000000060
	swapa	[%i0+%o5]0x80,%l6	! %l6 = 000000005721c5ff
!	Mem[0000000030081400] = 00000000, %l3 = 0000000000000000
	ldstuba	[%i2+%g0]0x89,%l3	! %l3 = 00000000000000ff
!	%l6 = 000000005721c5ff, Mem[0000000030001408] = ffffff9f
	stha	%l6,[%i0+%o4]0x89	! Mem[0000000030001408] = ffffc5ff
!	%l0 = 00000000000000ff, Mem[0000000010101439] = 9f000000, %asi = 80
	stba	%l0,[%i4+0x039]%asi	! Mem[0000000010101438] = 9fff0000
!	Mem[0000000010081424] = 34a1c300, %l3 = 0000000000000000
	swap	[%i2+0x024],%l3		! %l3 = 0000000034a1c300
!	%f0  = ffffffff ffd5b81b, Mem[0000000010101400] = 00000000 29000000
	stda	%f0 ,[%i4+%g0]0x88	! Mem[0000000010101400] = ffffffff ffd5b81b
!	%l7 = 00000000000003d2, Mem[0000000010101414] = 00000060
	stw	%l7,[%i4+0x014]		! Mem[0000000010101414] = 000003d2
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = 00009f0000000000, %l0 = 00000000000000ff
	ldxa	[%i0+%g0]0x80,%l0	! %l0 = 00009f0000000000

p0_label_235:
!	Mem[0000000030101400] = 000000c5, %l3 = 0000000034a1c300
	ldsba	[%i4+%g0]0x89,%l3	! %l3 = ffffffffffffffc5
!	Mem[0000000010181410] = ffffffff, %f29 = d2038d08
	lda	[%i6+%o5]0x88,%f29	! %f29 = ffffffff
!	%f10 = 537ff28b 00000000, Mem[00000000300c1410] = 00000000 00000000
	stda	%f10,[%i3+%o5]0x89	! Mem[00000000300c1410] = 537ff28b 00000000
!	Mem[00000000100c1400] = ff080000cb800000, %f20 = 00000029 0000187f
	ldda	[%i3+%g0]0x80,%f20	! %f20 = ff080000 cb800000
!	Mem[0000000030181408] = ff00d52a, %l5 = ffffffffffffffd8
	lduwa	[%i6+%o4]0x81,%l5	! %l5 = 00000000ff00d52a
!	Mem[00000000100c1400] = ff080000, %f3  = b7ffffff
	lda	[%i3+%g0]0x80,%f3 	! %f3 = ff080000
!	Mem[0000000010141414] = 00000000, %l3 = ffffffffffffffc5
	ldswa	[%i5+0x014]%asi,%l3	! %l3 = 0000000000000000
!	Mem[0000000010141408] = 0d916d64, %f23 = 00000000
	lda	[%i5+%o4]0x88,%f23	! %f23 = 0d916d64
!	Mem[00000000100c1400] = 000080cb000008ff, %f12 = 000000e3 e2a2eaff
	ldda	[%i3+%g0]0x88,%f12	! %f12 = 000080cb 000008ff
!	Starting 10 instruction Store Burst
!	%f24 = 00000000 34697300, %l1 = ffffffffa52e7e04
!	Mem[00000000100c1410] = feae6015e2a2eaff
	add	%i3,0x010,%g1
	stda	%f24,[%g1+%l1]ASI_PST16_PL ! Mem[00000000100c1410] = feae60150000eaff

p0_label_236:
!	%f22 = 60000000 0d916d64, Mem[00000000100c1408] = e70000ff 00000000
	stda	%f22,[%i3+%o4]0x88	! Mem[00000000100c1408] = 60000000 0d916d64
!	%l5 = 00000000ff00d52a, Mem[000000001008143c] = a52e7e04
	sth	%l5,[%i2+0x03c]		! Mem[000000001008143c] = d52a7e04
!	%l6 = 000000005721c5ff, Mem[0000000010141400] = 297d4a65
	stha	%l6,[%i5+%g0]0x80	! Mem[0000000010141400] = c5ff4a65
!	Mem[0000000030141408] = 00000000, %l4 = 00000000000000ff
	swapa	[%i5+%o4]0x81,%l4	! %l4 = 0000000000000000
!	%f11 = 00000000, %f26 = 646d910d, %f8  = d2038d08
	fmuls	%f11,%f26,%f8 		! %f8  = 00000000
!	%l6 = 5721c5ff, %l7 = 000003d2, Mem[0000000010001410] = 60000000 00000000
	stda	%l6,[%i0+%o5]0x88	! Mem[0000000010001410] = 5721c5ff 000003d2
!	Mem[00000000211c0000] = 00d8e5a1, %l6 = 000000005721c5ff
	ldstuba	[%o2+0x000]%asi,%l6	! %l6 = 00000000000000ff
!	Mem[00000000300c1400] = ffff9fff, %l1 = ffffffffa52e7e04
	ldstuba	[%i3+%g0]0x81,%l1	! %l1 = 000000ff000000ff
!	%l5 = 00000000ff00d52a, Mem[0000000010001410] = 5721c5ff
	stba	%l5,[%i0+%o5]0x88	! Mem[0000000010001410] = 5721c52a
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = a52e7e04, %l2 = 00000000047e00a5
	swapa	[%i1+%o4]0x88,%l2	! %l2 = 00000000a52e7e04

p0_label_237:
!	Mem[0000000030041400] = 00000000d85820fd, %f22 = 60000000 0d916d64
	ldda	[%i1+%g0]0x89,%f22	! %f22 = 00000000 d85820fd
!	Mem[0000000010081400] = 00000000, %l1 = 00000000000000ff
	ldsw	[%i2+%g0],%l1		! %l1 = 0000000000000000
!	Mem[0000000030101400] = c5000000, %l3 = 0000000000000000
	lduba	[%i4+%g0]0x81,%l3	! %l3 = 00000000000000c5
	membar	#Sync			! Added by membar checker (35)
!	Mem[00000000300c1400] = ffff9fff 654a7d29 00000060 0d916d64
!	Mem[00000000300c1410] = 00000000 8bf27f53 60000000 00000000
!	Mem[00000000300c1420] = 00000000 34697300 a52e7e04 e2a2ea29
!	Mem[00000000300c1430] = e3000000 d2038d08 00000000 00000000
	ldda	[%i3]ASI_BLK_AIUSL,%f16	! Block Load from 00000000300c1400
!	Mem[0000000010001408] = 00000000, %l4 = 0000000000000000
	lduha	[%i0+%o4]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000020800000] = ffffe062, %l4 = 0000000000000000
	lduh	[%o1+%g0],%l4		! %l4 = 000000000000ffff
!	Mem[0000000030181410] = e30000ff, %l7 = 00000000000003d2
	lduha	[%i6+%o5]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030101408] = 654a7d29, %f8  = 00000000
	lda	[%i4+%o4]0x89,%f8 	! %f8 = 654a7d29
!	Mem[0000000030001400] = 00000000, %l0 = 00009f0000000000
	lduwa	[%i0+%g0]0x81,%l0	! %l0 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l0 = 00000000, %l1 = 00000000, Mem[0000000010001410] = 5721c52a 000003d2
	stda	%l0,[%i0+%o5]0x88	! Mem[0000000010001410] = 00000000 00000000

p0_label_238:
!	%l1 = 0000000000000000, Mem[0000000010181408] = feae34a3
	stha	%l1,[%i6+%o4]0x80	! Mem[0000000010181408] = 000034a3
!	%l0 = 0000000000000000, Mem[0000000010001408] = 0000000000000000
	stxa	%l0,[%i0+%o4]0x88	! Mem[0000000010001408] = 0000000000000000
	membar	#Sync			! Added by membar checker (36)
!	%l4 = 000000000000ffff, Mem[00000000300c1408] = 00000060
	stha	%l4,[%i3+%o4]0x81	! Mem[00000000300c1408] = ffff0060
!	%l0 = 0000000000000000, Mem[0000000030081410] = 1bb8d5ff
	stwa	%l0,[%i2+%o5]0x81	! Mem[0000000030081410] = 00000000
!	Mem[0000000030081410] = 00000000, %l0 = 0000000000000000
	swapa	[%i2+%o5]0x81,%l0	! %l0 = 0000000000000000
!	%f0  = ffffffff ffd5b81b, Mem[0000000010101410] = 00000000 000003d2
	stda	%f0 ,[%i4+%o5]0x80	! Mem[0000000010101410] = ffffffff ffd5b81b
!	%l6 = 0000000000000000, Mem[00000000300c1408] = 6000ffff
	stba	%l6,[%i3+%o4]0x89	! Mem[00000000300c1408] = 6000ff00
!	%l6 = 00000000, %l7 = 000000ff, Mem[0000000010141410] = 00000000 00000000
	stda	%l6,[%i5+%o5]0x88	! Mem[0000000010141410] = 00000000 000000ff
!	%l6 = 00000000, %l7 = 000000ff, Mem[0000000010041410] = ff0003d2 00000000
	stda	%l6,[%i1+%o5]0x80	! Mem[0000000010041410] = 00000000 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = 00000000, %l1 = 0000000000000000
	lduha	[%i1+%o5]0x80,%l1	! %l1 = 0000000000000000

p0_label_239:
!	Mem[000000001014142c] = 047e2ea5, %l5 = 00000000ff00d52a
	lduwa	[%i5+0x02c]%asi,%l5	! %l5 = 00000000047e2ea5
!	Mem[0000000030141400] = 047e2ea5654a7d29, %f12 = 000080cb 000008ff
	ldda	[%i5+%g0]0x81,%f12	! %f12 = 047e2ea5 654a7d29
!	%l2 = 00000000a52e7e04, imm = 0000000000000309, %l7 = 00000000000000ff
	xnor	%l2,0x309,%l7		! %l7 = ffffffff5ad182f2
!	Mem[0000000030181410] = 00000000e30000ff, %l5 = 00000000047e2ea5
	ldxa	[%i6+%o5]0x89,%l5	! %l5 = 00000000e30000ff
!	Mem[00000000218001c0] = 00ffc752, %l5 = 00000000e30000ff
	ldsh	[%o3+0x1c0],%l5		! %l5 = 00000000000000ff
!	Mem[00000000201c0000] = 000001ce, %l4 = 000000000000ffff
	ldsba	[%o0+0x000]%asi,%l4	! %l4 = 0000000000000000
!	Mem[0000000030041400] = d85820fd, %l7 = ffffffff5ad182f2
	lduha	[%i1+%g0]0x89,%l7	! %l7 = 00000000000020fd
!	Mem[0000000010181408] = 000034a3, %l2 = 00000000a52e7e04
	ldswa	[%i6+%o4]0x80,%l2	! %l2 = 00000000000034a3
!	Mem[0000000010101410] = 1bb8d5ff ffffffff, %l4 = 00000000, %l5 = 000000ff
	ldda	[%i4+%o5]0x88,%l4	! %l4 = 00000000ffffffff 000000001bb8d5ff
!	Starting 10 instruction Store Burst
!	Mem[0000000010081410] = 00000000, %l3 = 00000000000000c5
	swapa	[%i2+%o5]0x80,%l3	! %l3 = 0000000000000000

p0_label_240:
!	%l4 = 00000000ffffffff, Mem[00000000100c1416] = 0000eaff, %asi = 80
	stha	%l4,[%i3+0x016]%asi	! Mem[00000000100c1414] = 0000ffff
!	%f14 = 00000000 e70000ff, %l1 = 0000000000000000
!	Mem[0000000030101418] = 0073693400000000
	add	%i4,0x018,%g1
	stda	%f14,[%g1+%l1]ASI_PST8_SL ! Mem[0000000030101418] = 0073693400000000
!	Mem[0000000030181408] = ff00d52a, %l0 = 0000000000000000
	swapa	[%i6+%o4]0x81,%l0	! %l0 = 00000000ff00d52a
!	%l2 = 00000000000034a3, %l6 = 0000000000000000, %l3 = 0000000000000000
	xnor	%l2,%l6,%l3		! %l3 = ffffffffffffcb5c
!	Mem[0000000010141404] = ff9fffff, %l4 = ffffffff, %l5 = 1bb8d5ff
	add	%i5,0x04,%g1
	casa	[%g1]0x80,%l4,%l5	! %l5 = 00000000ff9fffff
!	%l7 = 00000000000020fd, Mem[0000000030041410] = 000057b7
	stba	%l7,[%i1+%o5]0x89	! Mem[0000000030041410] = 000057fd
!	Mem[0000000010101410] = ffffffff, %l0 = 00000000ff00d52a
	ldstuba	[%i4+%o5]0x88,%l0	! %l0 = 000000ff000000ff
!	Mem[0000000030041408] = a5007e04, %l5 = 00000000ff9fffff
	ldstuba	[%i1+%o4]0x89,%l5	! %l5 = 00000004000000ff
!	%f12 = 047e2ea5 654a7d29, Mem[0000000030001408] = ffc5ffff 000000e3
	stda	%f12,[%i0+%o4]0x81	! Mem[0000000030001408] = 047e2ea5 654a7d29
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = 000001ce, %l3 = ffffffffffffcb5c
	lduha	[%o0+0x000]%asi,%l3	! %l3 = 0000000000000000

p0_label_241:
!	Mem[0000000010041408] = a5007e045721c5ff, %f12 = 047e2ea5 654a7d29
	ldda	[%i1+%o4]0x80,%f12	! %f12 = a5007e04 5721c5ff
!	Mem[0000000020800000] = ffffe062, %l7 = 00000000000020fd
	lduha	[%o1+0x000]%asi,%l7	! %l7 = 000000000000ffff
!	Mem[0000000030001408] = 047e2ea5 654a7d29, %l0 = 000000ff, %l1 = 00000000
	ldda	[%i0+%o4]0x81,%l0	! %l0 = 00000000047e2ea5 00000000654a7d29
!	Mem[00000000100c1400] = ff080000 cb800000, %l2 = 000034a3, %l3 = 00000000
	ldda	[%i3+%g0]0x80,%l2	! %l2 = 00000000ff080000 00000000cb800000
!	Mem[0000000010041408] = a5007e045721c5ff, %f2  = 00000000 ff080000
	ldda	[%i1+0x008]%asi,%f2 	! %f2  = a5007e04 5721c5ff
!	Mem[0000000010101418] = a9fc6c60 6f13569c, %l2 = ff080000, %l3 = cb800000
	ldd	[%i4+0x018],%l2		! %l2 = 00000000a9fc6c60 000000006f13569c
	membar	#Sync			! Added by membar checker (37)
!	Mem[00000000300c1400] = ffff9fff 654a7d29 00ff0060 0d916d64
!	Mem[00000000300c1410] = 00000000 8bf27f53 60000000 00000000
!	Mem[00000000300c1420] = 00000000 34697300 a52e7e04 e2a2ea29
!	Mem[00000000300c1430] = e3000000 d2038d08 00000000 00000000
	ldda	[%i3]ASI_BLK_SL,%f0	! Block Load from 00000000300c1400
!	Mem[0000000030081410] = 00000000, %l0 = 00000000047e2ea5
	ldsba	[%i2+%o5]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000030181408] = 00000000, %l1 = 00000000654a7d29
	lduha	[%i6+%o4]0x89,%l1	! %l1 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010081438] = 00bc0000, %l1 = 00000000, %l5 = 00000004
	add	%i2,0x38,%g1
	casa	[%g1]0x80,%l1,%l5	! %l5 = 0000000000bc0000

p0_label_242:
!	Mem[0000000010141430] = 088d03d2000000e3, %l4 = 00000000ffffffff, %l6 = 0000000000000000
	add	%i5,0x30,%g1
	casxa	[%g1]0x80,%l4,%l6	! %l6 = 088d03d2000000e3
!	%f28 = 088d03d2, %f29 = 000000e3, %f22 = 00000000
	fsubs	%f28,%f29,%f22		! %l0 = 0000000000000022, Unfinished, %fsr = 0d00000800
!	Mem[0000000010081407] = 9e7c1543, %l2 = 00000000a9fc6c60
	ldstub	[%i2+0x007],%l2		! %l2 = 00000043000000ff
!	%f20 = 537ff28b, Mem[0000000030141400] = 047e2ea5
	sta	%f20,[%i5+%g0]0x81	! Mem[0000000030141400] = 537ff28b
!	Mem[0000000030181400] = ff000000, %l1 = 0000000000000000
	swapa	[%i6+%g0]0x89,%l1	! %l1 = 00000000ff000000
!	%f20 = 537ff28b, %f26 = 29eaa2e2, %f25 = 00000000
	fmuls	%f20,%f26,%f25		! %f25 = 3dea968c
!	Mem[0000000010101424] = 000000ff, %l7 = 000000000000ffff, %asi = 80
	swapa	[%i4+0x024]%asi,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010181400] = ffc52157, %l1 = 00000000ff000000
	lduha	[%i6+%g0]0x80,%l1	! %l1 = 000000000000ffc5
!	%l1 = 000000000000ffc5, Mem[0000000010041400] = ffffffad
	stba	%l1,[%i1+%g0]0x88	! Mem[0000000010041400] = ffffffc5
!	Starting 10 instruction Load Burst
!	Mem[0000000030101410] = 0000187f, %l5 = 0000000000bc0000
	ldsha	[%i4+%o5]0x89,%l5	! %l5 = 000000000000187f

p0_label_243:
!	Code Fragment 3
p0_fragment_27:
!	%l0 = 0000000000000022
	setx	0x92242e6042ff7048,%g7,%l0 ! %l0 = 92242e6042ff7048
!	%l1 = 000000000000ffc5
	setx	0xdd7c5807d6d8ab02,%g7,%l1 ! %l1 = dd7c5807d6d8ab02
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 92242e6042ff7048
	setx	0xe10ba2c036c8027d,%g7,%l0 ! %l0 = e10ba2c036c8027d
!	%l1 = dd7c5807d6d8ab02
	setx	0x14e26f97fe4c6c80,%g7,%l1 ! %l1 = 14e26f97fe4c6c80
!	Mem[0000000030141400] = 8bf27f53, %l1 = 14e26f97fe4c6c80
	lduwa	[%i5+%g0]0x89,%l1	! %l1 = 000000008bf27f53
!	Mem[0000000010141424] = 00000000, %l3 = 000000006f13569c
	ldsb	[%i5+0x027],%l3		! %l3 = 0000000000000000
!	Mem[0000000030081400] = ff000000 00000000, %l2 = 00000043, %l3 = 00000000
	ldda	[%i2+%g0]0x81,%l2	! %l2 = 00000000ff000000 0000000000000000
!	%l1 = 000000008bf27f53, imm = fffffffffffff31d, %l1 = 000000008bf27f53
	andn	%l1,-0xce3,%l1		! %l1 = 0000000000000c42
!	Mem[0000000010101408] = b24621fd, %l1 = 0000000000000c42
	ldsba	[%i4+%o4]0x88,%l1	! %l1 = fffffffffffffffd
!	Mem[0000000021800080] = 18f59b02, %l5 = 000000000000187f
	lduh	[%o3+0x080],%l5		! %l5 = 00000000000018f5
!	Mem[00000000300c1400] = ffff9fff, %f18 = 646d910d
	lda	[%i3+%g0]0x81,%f18	! %f18 = ffff9fff
!	Mem[0000000030101408] = ffffffff654a7d29, %l2 = 00000000ff000000
	ldxa	[%i4+%o4]0x89,%l2	! %l2 = ffffffff654a7d29
!	Starting 10 instruction Store Burst
!	Mem[0000000010041400] = ffffffc5, %l7 = 00000000000000ff
	swapa	[%i1+%g0]0x88,%l7	! %l7 = 00000000ffffffc5

p0_label_244:
!	%f16 = 297d4a65 ff9fffff, Mem[0000000030101408] = 297d4a65 ffffffff
	stda	%f16,[%i4+%o4]0x81	! Mem[0000000030101408] = 297d4a65 ff9fffff
!	Mem[0000000030181408] = 00000000, %l0 = e10ba2c036c8027d
	ldstuba	[%i6+%o4]0x81,%l0	! %l0 = 00000000000000ff
!	Mem[000000001004142c] = 00000000, %l3 = 00000000, %l6 = 000000e3
	add	%i1,0x2c,%g1
	casa	[%g1]0x80,%l3,%l6	! %l6 = 0000000000000000
!	%l7 = 00000000ffffffc5, %l0 = 0000000000000000, %l7 = 00000000ffffffc5
	or	%l7,%l0,%l7		! %l7 = 00000000ffffffc5
!	%l4 = 00000000ffffffff, Mem[0000000010181408] = 32000034a3340000
	stxa	%l4,[%i6+%o4]0x88	! Mem[0000000010181408] = 00000000ffffffff
!	Mem[00000000100c1408] = 646d910d, %l0 = 0000000000000000
	swapa	[%i3+%o4]0x80,%l0	! %l0 = 00000000646d910d
!	Mem[00000000100c1418] = 00000000a6007f18, %l6 = 0000000000000000, %l2 = ffffffff654a7d29
	add	%i3,0x18,%g1
	casxa	[%g1]0x80,%l6,%l2	! %l2 = 00000000a6007f18
!	%f0  = 297d4a65 ff9fffff 646d910d 6000ff00
!	%f4  = 537ff28b 00000000 00000000 00000060
!	%f8  = 00736934 00000000 29eaa2e2 047e2ea5
!	%f12 = 088d03d2 000000e3 00000000 00000000
	stda	%f0,[%i3]ASI_BLK_AIUSL	! Block Store to 00000000300c1400
!	Mem[0000000010141410] = 00000000, %l7 = 00000000ffffffc5
	ldstuba	[%i5+%o5]0x88,%l7	! %l7 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = ff000000 00000000, %l4 = ffffffff, %l5 = 000018f5
	ldda	[%i1+%o5]0x88,%l4	! %l4 = 0000000000000000 00000000ff000000

p0_label_245:
!	Mem[0000000010081410] = db72f184 c5000000, %l2 = a6007f18, %l3 = 00000000
	ldda	[%i2+%o5]0x88,%l2	! %l2 = 00000000c5000000 00000000db72f184
!	Mem[0000000010001424] = 000000bc, %l3 = 00000000db72f184
	lduw	[%i0+0x024],%l3		! %l3 = 00000000000000bc
!	%l3 = 00000000000000bc, imm = fffffffffffff2d3, %l5 = 00000000ff000000
	andn	%l3,-0xd2d,%l5		! %l5 = 000000000000002c
!	Mem[0000000010141410] = 000000ff, %l4 = 0000000000000000
	lduba	[%i5+%o5]0x88,%l4	! %l4 = 00000000000000ff
	membar	#Sync			! Added by membar checker (38)
!	Mem[00000000100c1410] = feae6015, %l2 = 00000000c5000000
	ldsha	[%i3+%o5]0x80,%l2	! %l2 = fffffffffffffeae
!	Mem[0000000010041400] = ffffffff 000000ff, %l6 = 00000000, %l7 = 00000000
	ldda	[%i1+%g0]0x88,%l6	! %l6 = 00000000000000ff 00000000ffffffff
!	Mem[0000000030081400] = 00000000 000000ff, %l0 = 646d910d, %l1 = fffffffd
	ldda	[%i2+%g0]0x89,%l0	! %l0 = 00000000000000ff 0000000000000000
!	Mem[0000000010181408] = ffffffff, %l3 = 00000000000000bc
	ldsba	[%i6+%o4]0x80,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000030081410] = 00000000, %l5 = 000000000000002c
	lduwa	[%i2+%o5]0x81,%l5	! %l5 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[00000000100c140c] = 00000060, %l5 = 0000000000000000
	ldstuba	[%i3+0x00c]%asi,%l5	! %l5 = 00000000000000ff

p0_label_246:
!	%l4 = 00000000000000ff, Mem[0000000010081408] = ff000000
	stba	%l4,[%i2+%o4]0x80	! Mem[0000000010081408] = ff000000
!	%l2 = fffffffffffffeae, Mem[0000000010141410] = ff000000
	stwa	%l2,[%i5+%o5]0x80	! Mem[0000000010141410] = fffffeae
!	Mem[0000000010081400] = 00000000, %l5 = 0000000000000000
	ldstuba	[%i2+%g0]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[00000000100c1438] = 4ca6fc6b654a7d29, %l2 = fffffffffffffeae, %l0 = 00000000000000ff
	add	%i3,0x38,%g1
	casxa	[%g1]0x80,%l2,%l0	! %l0 = 4ca6fc6b654a7d29
!	%f24 = 00736934 3dea968c, Mem[0000000010081410] = c5000000 db72f184
	stda	%f24,[%i2+%o5]0x88	! Mem[0000000010081410] = 00736934 3dea968c
!	Mem[0000000030041410] = fd570000, %l6 = 00000000000000ff
	swapa	[%i1+%o5]0x81,%l6	! %l6 = 00000000fd570000
!	Mem[00000000100c140c] = ff000060, %l6 = fd570000, %l4 = 000000ff
	add	%i3,0x0c,%g1
	casa	[%g1]0x80,%l6,%l4	! %l4 = 00000000ff000060
!	Mem[0000000030081400] = 000000ff, %l6 = 00000000fd570000
	swapa	[%i2+%g0]0x89,%l6	! %l6 = 00000000000000ff
!	%l3 = ffffffffffffffff, Mem[00000000100c1400] = 000080cb000008ff
	stxa	%l3,[%i3+%g0]0x88	! Mem[00000000100c1400] = ffffffffffffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081420] = ff2281c3, %l1 = 0000000000000000
	ldsh	[%i2+0x022],%l1		! %l1 = ffffffffffff81c3

p0_label_247:
!	Mem[000000001010140c] = e70000ff, %l2 = fffffffffffffeae
	lduw	[%i4+0x00c],%l2		! %l2 = 00000000e70000ff
!	Mem[0000000030141400] = 8bf27f53, %f16 = 297d4a65
	lda	[%i5+%g0]0x89,%f16	! %f16 = 8bf27f53
!	Mem[0000000010101400] = 1bb8d5ff, %l6 = 00000000000000ff
	ldsba	[%i4+%g0]0x80,%l6	! %l6 = 000000000000001b
!	Mem[00000000100c1408] = 00000000ff000060, %l1 = ffffffffffff81c3
	ldxa	[%i3+%o4]0x80,%l1	! %l1 = 00000000ff000060
!	%l2 = 00000000e70000ff, %l5 = 0000000000000000, %l4 = 00000000ff000060
	subc	%l2,%l5,%l4		! %l4 = 00000000e70000ff
!	Mem[0000000010001408] = 00000000, %l2 = 00000000e70000ff
	ldsha	[%i0+%o4]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000030001410] = ffff0000000000e3, %f30 = 00000000 00000000
	ldda	[%i0+%o5]0x89,%f30	! %f30 = ffff0000 000000e3
!	Mem[0000000030141410] = 00000004, %l1 = 00000000ff000060
	ldsha	[%i5+%o5]0x89,%l1	! %l1 = 0000000000000004
!	Mem[0000000010081410] = 8c96ea3d, %l0 = 4ca6fc6b654a7d29
	ldsba	[%i2+%o5]0x80,%l0	! %l0 = ffffffffffffff8c
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1400] = ff9fffff, %l2 = 0000000000000000
	swapa	[%i3+%g0]0x89,%l2	! %l2 = 00000000ff9fffff

p0_label_248:
!	%l7 = 00000000ffffffff, Mem[00000000201c0000] = 000001ce, %asi = 80
	stba	%l7,[%o0+0x000]%asi	! Mem[00000000201c0000] = ff0001ce
!	%f4  = 537ff28b 00000000, Mem[0000000010181400] = ffc52157 00000000
	stda	%f4 ,[%i6+%g0]0x80	! Mem[0000000010181400] = 537ff28b 00000000
!	%l5 = 0000000000000000, Mem[00000000201c0001] = ff0001ce
	stb	%l5,[%o0+0x001]		! Mem[00000000201c0000] = ff0001ce
!	Mem[0000000010141410] = fffffeae, %l2 = 00000000ff9fffff
	swapa	[%i5+%o5]0x80,%l2	! %l2 = 00000000fffffeae
!	Mem[0000000030041400] = fd2058d8, %l3 = ffffffffffffffff
	ldstuba	[%i1+%g0]0x81,%l3	! %l3 = 000000fd000000ff
!	Mem[00000000100c1414] = 0000ffff, %l2 = fffffeae, %l2 = fffffeae
	add	%i3,0x14,%g1
	casa	[%g1]0x80,%l2,%l2	! %l2 = 000000000000ffff
!	%l2 = 000000000000ffff, Mem[0000000030001400] = 00000000
	stha	%l2,[%i0+%g0]0x81	! Mem[0000000030001400] = ffff0000
!	%l1 = 0000000000000004, Mem[0000000010101408] = ff0000e7b24621fd
	stxa	%l1,[%i4+%o4]0x88	! Mem[0000000010101408] = 0000000000000004
!	%l0 = ffffffffffffff8c, Mem[00000000201c0000] = ff0001ce
	sth	%l0,[%o0+%g0]		! Mem[00000000201c0000] = ff8c01ce
!	Starting 10 instruction Load Burst
!	Mem[00000000100c140c] = ff000060, %l0 = ffffffffffffff8c
	ldub	[%i3+0x00e],%l0		! %l0 = 0000000000000000

p0_label_249:
!	Mem[0000000030101410] = 00000029 0000187f, %l0 = 00000000, %l1 = 00000004
	ldda	[%i4+%o5]0x89,%l0	! %l0 = 000000000000187f 0000000000000029
!	Mem[0000000010181430] = 0000b160, %l1 = 0000000000000029
	lduw	[%i6+0x030],%l1		! %l1 = 000000000000b160
!	Mem[0000000030181410] = e30000ff, %l6 = 000000000000001b
	ldsha	[%i6+%o5]0x89,%l6	! %l6 = 00000000000000ff
!	%f29 = 000000e3, %f10 = 29eaa2e2
	fcmpes	%fcc3,%f29,%f10		! %fcc3 = 1
!	Mem[0000000030101408] = ffff9fff654a7d29, %l2 = 000000000000ffff
	ldxa	[%i4+%o4]0x89,%l2	! %l2 = ffff9fff654a7d29
!	Mem[0000000030101400] = c5000000, %l1 = 000000000000b160
	ldswa	[%i4+%g0]0x81,%l1	! %l1 = ffffffffc5000000
!	Mem[0000000010041410] = 00000000, %l5 = 0000000000000000
	lduba	[%i1+%o5]0x88,%l5	! %l5 = 0000000000000000
!	Mem[00000000100c1410] = feae6015, %l3 = 00000000000000fd
	lduha	[%i3+%o5]0x80,%l3	! %l3 = 000000000000feae
!	Mem[0000000010041400] = 000000ff, %l6 = 00000000000000ff
	ldswa	[%i1+%g0]0x88,%l6	! %l6 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l0 = 000000000000187f, Mem[0000000010081400] = ff000000
	stha	%l0,[%i2+%g0]0x80	! Mem[0000000010081400] = 187f0000

p0_label_250:
!	%l3 = 000000000000feae, Mem[00000000100c1400] = ffffffffffffffff
	stxa	%l3,[%i3+%g0]0x88	! Mem[00000000100c1400] = 000000000000feae
!	Mem[0000000030141408] = 000000ff, %l6 = 00000000000000ff
	swapa	[%i5+%o4]0x81,%l6	! %l6 = 00000000000000ff
!	Mem[00000000100c1404] = 00000000, %l7 = 00000000ffffffff, %asi = 80
	swapa	[%i3+0x004]%asi,%l7	! %l7 = 0000000000000000
!	%f6  = 00000000, Mem[00000000300c1400] = 00000000
	sta	%f6 ,[%i3+%g0]0x89	! Mem[00000000300c1400] = 00000000
!	%l5 = 0000000000000000, immd = 0000000000000ba7, %l0 = 000000000000187f
	sdivx	%l5,0xba7,%l0		! %l0 = 0000000000000000
!	%l4 = 00000000e70000ff, Mem[0000000030101408] = 654a7d29
	stha	%l4,[%i4+%o4]0x89	! Mem[0000000030101408] = 654a00ff
!	Mem[00000000300c1410] = 00000000, %l7 = 0000000000000000
	ldstuba	[%i3+%o5]0x89,%l7	! %l7 = 00000000000000ff
!	%l6 = 000000ff, %l7 = 00000000, Mem[0000000010081410] = 3dea968c 00736934
	stda	%l6,[%i2+%o5]0x88	! Mem[0000000010081410] = 000000ff 00000000
!	Mem[0000000010001400] = 009f0000, %l2 = ffff9fff654a7d29
	swapa	[%i0+%g0]0x88,%l2	! %l2 = 00000000009f0000
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = 00000000, %l6 = 00000000000000ff
	ldswa	[%i3+%g0]0x81,%l6	! %l6 = 0000000000000000

p0_label_251:
!	Mem[0000000010001400] = 00000000 654a7d29, %l2 = 009f0000, %l3 = 0000feae
	ldda	[%i0+%g0]0x88,%l2	! %l2 = 00000000654a7d29 0000000000000000
	membar	#Sync			! Added by membar checker (39)
!	Mem[00000000100c1400] = aefe0000 ffffffff 00000000 ff000060
!	Mem[00000000100c1410] = feae6015 0000ffff 00000000 a6007f18
!	Mem[00000000100c1420] = 00000000 34030000 000000e3 e2a2eaff
!	Mem[00000000100c1430] = e8476df6 d01edd19 4ca6fc6b 654a7d29
	ldda	[%i3]ASI_BLK_P,%f16	! Block Load from 00000000100c1400
!	Mem[0000000030001408] = 297d4a65 a52e7e04, %l6 = 00000000, %l7 = 00000000
	ldda	[%i0+%o4]0x89,%l6	! %l6 = 00000000a52e7e04 00000000297d4a65
!	Mem[0000000030001410] = 000000e3, %l3 = 0000000000000000
	lduwa	[%i0+%o5]0x89,%l3	! %l3 = 00000000000000e3
!	Mem[0000000010181408] = ffffffff00000000, %l2 = 00000000654a7d29
	ldx	[%i6+%o4],%l2		! %l2 = ffffffff00000000
!	Mem[0000000030001408] = a52e7e04, %l3 = 00000000000000e3
	lduwa	[%i0+%o4]0x89,%l3	! %l3 = 00000000a52e7e04
!	Mem[0000000030101410] = 0000187f, %f2  = 646d910d
	lda	[%i4+%o5]0x89,%f2 	! %f2 = 0000187f
!	Mem[0000000010181410] = ffffffff, %l4 = 00000000e70000ff
	lduwa	[%i6+%o5]0x80,%l4	! %l4 = 00000000ffffffff
!	Mem[0000000010001400] = 297d4a65 00000000 00000000 00000000
!	Mem[0000000010001410] = 00000000 00000000 00000000 db72f184
!	Mem[0000000010001420] = 00000000 000000bc d2038d08 29000000
!	Mem[0000000010001430] = a52e7e04 f66d47e8 ff302700 1e25229f
	ldda	[%i0]ASI_BLK_P,%f0	! Block Load from 0000000010001400
!	Starting 10 instruction Store Burst
!	%f29 = d01edd19, Mem[0000000010041400] = ff000000
	sta	%f29,[%i1+%g0]0x80	! Mem[0000000010041400] = d01edd19

p0_label_252:
!	Mem[0000000010181410] = ffffffff, %l2 = ffffffff00000000
	swapa	[%i6+%o5]0x88,%l2	! %l2 = 00000000ffffffff
	membar	#Sync			! Added by membar checker (40)
!	%f21 = 0000ffff, Mem[00000000100c1408] = 00000000
	sta	%f21,[%i3+%o4]0x80	! Mem[00000000100c1408] = 0000ffff
!	%l5 = 0000000000000000, Mem[0000000030181400] = 00000000
	stha	%l5,[%i6+%g0]0x81	! Mem[0000000030181400] = 00000000
!	Mem[0000000010141420] = 00736934, %l3 = a52e7e04, %l6 = a52e7e04
	add	%i5,0x20,%g1
	casa	[%g1]0x80,%l3,%l6	! %l6 = 0000000000736934
!	%l2 = ffffffff, %l3 = a52e7e04, Mem[0000000010101410] = ffffffff 1bb8d5ff
	stda	%l2,[%i4+%o5]0x88	! Mem[0000000010101410] = ffffffff a52e7e04
!	Mem[0000000030181408] = 000000ff, %l0 = 0000000000000000
	ldstuba	[%i6+%o4]0x89,%l0	! %l0 = 000000ff000000ff
!	Mem[0000000010141410] = ff9fffff, %l1 = ffffffffc5000000, %asi = 80
	swapa	[%i5+0x010]%asi,%l1	! %l1 = 00000000ff9fffff
!	%l6 = 0000000000736934, Mem[0000000010081421] = ff2281c3
	stb	%l6,[%i2+0x021]		! Mem[0000000010081420] = ff3481c3
!	%f26 = 000000e3, Mem[00000000100c1408] = ffff0000
	sta	%f26,[%i3+%o4]0x88	! Mem[00000000100c1408] = 000000e3
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = 00000000, %l2 = 00000000ffffffff
	lduha	[%i3+%g0]0x89,%l2	! %l2 = 0000000000000000

p0_label_253:
!	Mem[0000000030001400] = ffff0000 c38122ff 047e2ea5 654a7d29
!	Mem[0000000030001410] = e3000000 0000ffff 646d910d 7abbfe4d
!	Mem[0000000030001420] = 00000000 340000ff 95d0a0c4 6bd091ff
!	Mem[0000000030001430] = 00000000 a6007f18 fd2146b2 e70000ff
	ldda	[%i0]ASI_BLK_S,%f16	! Block Load from 0000000030001400
!	Mem[0000000030001400] = 0000ffff, %l6 = 0000000000736934
	lduwa	[%i0+%g0]0x89,%l6	! %l6 = 000000000000ffff
!	Mem[0000000010101400] = 1bb8d5ff, %f11 = 29000000
	lda	[%i4+%g0]0x80,%f11	! %f11 = 1bb8d5ff
!	%l2 = 0000000000000000, Mem[0000000030081408] = 00080000
	stba	%l2,[%i2+%o4]0x81	! Mem[0000000030081408] = 00080000
!	Mem[00000000300c1410] = 000000ff, %l6 = 000000000000ffff
	ldswa	[%i3+%o5]0x89,%l6	! %l6 = 00000000000000ff
!	%l4 = 00000000ffffffff, %l7 = 00000000297d4a65, %y  = 000000ff
	umul	%l4,%l7,%l2		! %l2 = 297d4a64d682b59b, %y = 297d4a64
!	Mem[00000000211c0000] = ffd8e5a1, %l1 = 00000000ff9fffff
	ldsh	[%o2+%g0],%l1		! %l1 = ffffffffffffffd8
!	Mem[0000000030041400] = 00000000d85820ff, %l7 = 00000000297d4a65
	ldxa	[%i1+%g0]0x89,%l7	! %l7 = 00000000d85820ff
!	Mem[0000000030041400] = d85820ff, %l2 = 297d4a64d682b59b
	ldswa	[%i1+%g0]0x89,%l2	! %l2 = ffffffffd85820ff
!	Starting 10 instruction Store Burst
!	%f12 = a52e7e04 f66d47e8, Mem[0000000010101400] = ffd5b81b ffffffff
	stda	%f12,[%i4+%g0]0x88	! Mem[0000000010101400] = a52e7e04 f66d47e8

p0_label_254:
!	Mem[0000000030181410] = e30000ff, %l7 = 00000000d85820ff
	ldstuba	[%i6+%o5]0x89,%l7	! %l7 = 000000ff000000ff
!	%l6 = 000000ff, %l7 = 000000ff, Mem[0000000010101420] = ff003010 0000ffff
	std	%l6,[%i4+0x020]		! Mem[0000000010101420] = 000000ff 000000ff
!	Mem[0000000030081400] = 000057fd, %l7 = 00000000000000ff
	ldstuba	[%i2+%g0]0x81,%l7	! %l7 = 00000000000000ff
!	%f0  = 297d4a65 00000000, %l5 = 0000000000000000
!	Mem[0000000010101410] = ffffffff047e2ea5
	add	%i4,0x010,%g1
	stda	%f0,[%g1+%l5]ASI_PST16_PL ! Mem[0000000010101410] = ffffffff047e2ea5
!	%l7 = 0000000000000000, Mem[00000000100c1410] = feae6015
	stba	%l7,[%i3+%o5]0x80	! Mem[00000000100c1410] = 00ae6015
!	%l6 = 00000000000000ff, Mem[0000000010081410] = 000000ff
	stwa	%l6,[%i2+%o5]0x88	! Mem[0000000010081410] = 000000ff
!	Mem[0000000010181400] = 537ff28b, %l6 = 00000000000000ff
	swapa	[%i6+%g0]0x80,%l6	! %l6 = 00000000537ff28b
!	Mem[0000000010101400] = e8476df6, %l2 = ffffffffd85820ff
	swapa	[%i4+%g0]0x80,%l2	! %l2 = 00000000e8476df6
!	%l2 = 00000000e8476df6, Mem[0000000010041408] = ffc52157047e00a5
	stxa	%l2,[%i1+%o4]0x88	! Mem[0000000010041408] = 00000000e8476df6
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = d01edd19ffffffff, %f10 = d2038d08 1bb8d5ff
	ldd	[%i1+%g0],%f10		! %f10 = d01edd19 ffffffff

p0_label_255:
!	Mem[00000000201c0000] = ff8c01ce, %l0 = 00000000000000ff
	ldub	[%o0+%g0],%l0		! %l0 = 00000000000000ff
!	Mem[0000000010141408] = 646d910d, %l1 = ffffffffffffffd8
	lduwa	[%i5+%o4]0x80,%l1	! %l1 = 00000000646d910d
!	Mem[0000000010081400] = 187f0000, %l4 = 00000000ffffffff
	lduha	[%i2+%g0]0x80,%l4	! %l4 = 000000000000187f
!	%l1 = 00000000646d910d, imm = fffffffffffff122, %l6 = 00000000537ff28b
	or	%l1,-0xede,%l6		! %l6 = fffffffffffff12f
!	Mem[0000000010141420] = 00736934, %l0 = 00000000000000ff
	ldub	[%i5+0x020],%l0		! %l0 = 0000000000000000
!	Mem[0000000010041408] = f66d47e8 00000000, %l6 = fffff12f, %l7 = 00000000
	ldd	[%i1+%o4],%l6		! %l6 = 00000000f66d47e8 0000000000000000
!	Mem[00000000300c1400] = 00000000, %l6 = 00000000f66d47e8
	ldsha	[%i3+%g0]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000030081400] = ff0057fd, %f7  = db72f184
	lda	[%i2+%g0]0x81,%f7 	! %f7 = ff0057fd
!	Mem[0000000010081408] = 000000ff, %l2 = 00000000e8476df6
	ldswa	[%i2+%o4]0x88,%l2	! %l2 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%f10 = d01edd19, Mem[0000000010041428] = 00000000
	sta	%f10,[%i1+0x028]%asi	! Mem[0000000010041428] = d01edd19

p0_label_256:
!	%l3 = 00000000a52e7e04, Mem[0000000010041416] = 000000ff
	sth	%l3,[%i1+0x016]		! Mem[0000000010041414] = 00007e04
!	%l4 = 000000000000187f, Mem[0000000010081400] = 00007f18
	stba	%l4,[%i2+%g0]0x88	! Mem[0000000010081400] = 00007f7f
!	%l7 = 0000000000000000, Mem[0000000030101408] = ff004a65
	stha	%l7,[%i4+%o4]0x81	! Mem[0000000030101408] = 00004a65
!	%l0 = 00000000, %l1 = 646d910d, Mem[0000000010001408] = 00000000 00000000
	stda	%l0,[%i0+%o4]0x80	! Mem[0000000010001408] = 00000000 646d910d
!	%f1  = 00000000, %f11 = ffffffff, %f17 = c38122ff
	fmuls	%f1 ,%f11,%f17		! %f17 = ffffffff
!	%f7  = ff0057fd, Mem[0000000010181420] = a334634c
	sta	%f7 ,[%i6+0x020]%asi	! Mem[0000000010181420] = ff0057fd
!	%l5 = 0000000000000000, Mem[0000000030101408] = 00004a65
	stba	%l5,[%i4+%o4]0x81	! Mem[0000000030101408] = 00004a65
!	Mem[0000000030041400] = ff2058d8, %l1 = 00000000646d910d
	swapa	[%i1+%g0]0x81,%l1	! %l1 = 00000000ff2058d8
!	%l1 = 00000000ff2058d8, Mem[00000000211c0000] = ffd8e5a1, %asi = 80
	stba	%l1,[%o2+0x000]%asi	! Mem[00000000211c0000] = d8d8e5a1
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = d85820ff047e2ea5, %f6  = 00000000 ff0057fd
	ldda	[%i4+%g0]0x80,%f6 	! %f6  = d85820ff 047e2ea5

p0_label_257:
!	Mem[0000000010001400] = 297d4a6500000000, %l2 = 00000000000000ff
	ldxa	[%i0+0x000]%asi,%l2	! %l2 = 297d4a6500000000
!	Mem[0000000010141400] = c5ff4a65ff9fffff, %f28 = 00000000 a6007f18
	ldda	[%i5+%g0]0x80,%f28	! %f28 = c5ff4a65 ff9fffff
!	Mem[0000000010101410] = ffffffff 047e2ea5, %l4 = 0000187f, %l5 = 00000000
	ldda	[%i4+%o5]0x80,%l4	! %l4 = 00000000ffffffff 00000000047e2ea5
!	Mem[0000000030041408] = ff7e00a5, %l5 = 00000000047e2ea5
	ldsha	[%i1+%o4]0x81,%l5	! %l5 = ffffffffffffff7e
!	Mem[0000000010081400] = 00007f7f, %l6 = 0000000000000000
	lduwa	[%i2+%g0]0x88,%l6	! %l6 = 0000000000007f7f
!	Mem[0000000010081410] = 00000000000000ff, %f4  = 00000000 00000000
	ldda	[%i2+%o5]0x88,%f4 	! %f4  = 00000000 000000ff
!	Mem[0000000030001410] = ffff0000 000000e3, %l0 = 00000000, %l1 = ff2058d8
	ldda	[%i0+%o5]0x89,%l0	! %l0 = 00000000000000e3 00000000ffff0000
!	Mem[0000000010041438] = 00000000 00000000, %l6 = 00007f7f, %l7 = 00000000
	ldd	[%i1+0x038],%l6		! %l6 = 0000000000000000 0000000000000000
!	Mem[0000000030081410] = 00000000, %f30 = fd2146b2
	lda	[%i2+%o5]0x81,%f30	! %f30 = 00000000
!	Starting 10 instruction Store Burst
!	%l0 = 00000000000000e3, Mem[000000001018141c] = ff00fb00
	stb	%l0,[%i6+0x01c]		! Mem[000000001018141c] = e300fb00

p0_label_258:
!	Mem[00000000300c1400] = 00000000, %l3 = 00000000a52e7e04
	swapa	[%i3+%g0]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000030101408] = 654a0000, %l1 = 00000000ffff0000
	ldstuba	[%i4+%o4]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010041414] = 00007e04, %l1 = 0000000000000000
	swap	[%i1+0x014],%l1		! %l1 = 0000000000007e04
!	Mem[0000000030081410] = 00000000, %l6 = 0000000000000000
	ldstuba	[%i2+%o5]0x81,%l6	! %l6 = 00000000000000ff
!	%l0 = 00000000000000e3, Mem[0000000010181410] = 00000000
	stha	%l0,[%i6+%o5]0x88	! Mem[0000000010181410] = 000000e3
!	%f20 = e3000000 0000ffff, Mem[0000000010141418] = 00000000 00000060
	std	%f20,[%i5+0x018]	! Mem[0000000010141418] = e3000000 0000ffff
!	Mem[000000001004141c] = ff0d0060, %l0 = 00000000000000e3
	ldstuba	[%i1+0x01c]%asi,%l0	! %l0 = 000000ff000000ff
!	%l6 = 00000000, %l7 = 00000000, Mem[0000000030181400] = 00000000 00000000
	stda	%l6,[%i6+%g0]0x81	! Mem[0000000030181400] = 00000000 00000000
!	%l2 = 297d4a6500000000, Mem[0000000010141408] = 0d916d64
	stwa	%l2,[%i5+%o4]0x88	! Mem[0000000010141408] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030081410] = 000000ff, %l7 = 0000000000000000
	lduha	[%i2+%o5]0x89,%l7	! %l7 = 00000000000000ff

p0_label_259:
!	%f8  = 00000000, %f14 = ff302700
	fcmpes	%fcc3,%f8 ,%f14		! %fcc3 = 2
!	Mem[0000000010041408] = 00000000e8476df6, %f24 = 00000000 340000ff
	ldda	[%i1+%o4]0x88,%f24	! %f24 = 00000000 e8476df6
!	Mem[00000000100c1414] = 0000ffff, %l2 = 297d4a6500000000
	ldsba	[%i3+0x015]%asi,%l2	! %l2 = 0000000000000000
!	Mem[0000000010041400] = ffffffff 19dd1ed0, %l2 = 00000000, %l3 = 00000000
	ldda	[%i1+%g0]0x88,%l2	! %l2 = 0000000019dd1ed0 00000000ffffffff
!	Mem[0000000010081420] = ff3481c3, %l5 = ffffffffffffff7e
	lduw	[%i2+0x020],%l5		! %l5 = 00000000ff3481c3
!	Mem[00000000300c1400] = 047e2ea5, %f17 = ffffffff
	lda	[%i3+%g0]0x89,%f17	! %f17 = 047e2ea5
!	Mem[00000000201c0000] = ff8c01ce, %l7 = 00000000000000ff
	ldsha	[%o0+0x000]%asi,%l7	! %l7 = ffffffffffffff8c
!	Mem[0000000010081408] = 0000cd61000000ff, %f28 = c5ff4a65 ff9fffff
	ldda	[%i2+%o4]0x88,%f28	! %f28 = 0000cd61 000000ff
!	Mem[000000001004142c] = 000000e3, %l1 = 0000000000007e04
	ldsw	[%i1+0x02c],%l1		! %l1 = 00000000000000e3
!	Starting 10 instruction Store Burst
!	%l3 = 00000000ffffffff, Mem[0000000010001402] = 297d4a65
	sth	%l3,[%i0+0x002]		! Mem[0000000010001400] = 297dffff

p0_label_260:
!	%f24 = 00000000, Mem[0000000010101408] = 04000000
	sta	%f24,[%i4+%o4]0x80	! Mem[0000000010101408] = 00000000
!	%l2 = 0000000019dd1ed0, Mem[0000000010181400] = 00000000ff000000
	stxa	%l2,[%i6+%g0]0x88	! Mem[0000000010181400] = 0000000019dd1ed0
!	Mem[0000000010081414] = 00000000, %l5 = 00000000ff3481c3
	swap	[%i2+0x014],%l5		! %l5 = 0000000000000000
!	%f20 = e3000000 0000ffff, %l7 = ffffffffffffff8c
!	Mem[0000000030141408] = 000000ff0d916d64
	add	%i5,0x008,%g1
	stda	%f20,[%g1+%l7]ASI_PST16_SL ! Mem[0000000030141408] = 000000ff000000e3
!	%f17 = 047e2ea5, Mem[0000000010041410] = 00000000
	sta	%f17,[%i1+%o5]0x88	! Mem[0000000010041410] = 047e2ea5
!	%f4  = 00000000 000000ff, Mem[0000000010101400] = d85820ff 047e2ea5
	std	%f4 ,[%i4+%g0]	! Mem[0000000010101400] = 00000000 000000ff
!	%l2 = 19dd1ed0, %l3 = ffffffff, Mem[0000000010101410] = ffffffff 047e2ea5
	std	%l2,[%i4+%o5]		! Mem[0000000010101410] = 19dd1ed0 ffffffff
!	Mem[0000000010001410] = 00000000, %l2 = 0000000019dd1ed0
	ldstuba	[%i0+%o5]0x80,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010081410] = ff000000, %l7 = ffffffffffffff8c
	ldstuba	[%i2+%o5]0x80,%l7	! %l7 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = ff000000ff3481c3, %f14 = ff302700 1e25229f
	ldda	[%i2+%o5]0x80,%f14	! %f14 = ff000000 ff3481c3

p0_label_261:
!	Mem[0000000010041400] = d01edd19, %l7 = 00000000000000ff
	lduba	[%i1+%g0]0x80,%l7	! %l7 = 00000000000000d0
!	Mem[0000000020800040] = 00fff99a, %l0 = 00000000000000ff
	lduha	[%o1+0x040]%asi,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010101400] = 00000000, %l7 = 00000000000000d0
	ldswa	[%i4+%g0]0x80,%l7	! %l7 = 0000000000000000
!	Mem[00000000211c0000] = d8d8e5a1, %l5 = 0000000000000000
	ldsh	[%o2+%g0],%l5		! %l5 = ffffffffffffd8d8
!	Mem[0000000010101408] = 00000000 00000000, %l4 = ffffffff, %l5 = ffffd8d8
	ldda	[%i4+0x008]%asi,%l4	! %l4 = 0000000000000000 0000000000000000
!	Mem[00000000211c0000] = d8d8e5a1, %l1 = 00000000000000e3
	ldsha	[%o2+0x000]%asi,%l1	! %l1 = ffffffffffffd8d8
!	Mem[0000000030081400] = fd5700ff, %l0 = 00000000000000ff
	lduba	[%i2+%g0]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030041408] = a5007eff, %l3 = 00000000ffffffff
	lduha	[%i1+%o4]0x89,%l3	! %l3 = 0000000000007eff
!	Mem[0000000010001400] = 297dffff00000000, %l4 = 0000000000000000
	ldx	[%i0+%g0],%l4		! %l4 = 297dffff00000000
!	Starting 10 instruction Store Burst
!	%l6 = 00000000, %l7 = 00000000, Mem[0000000010081410] = 000000ff c38134ff
	stda	%l6,[%i2+%o5]0x88	! Mem[0000000010081410] = 00000000 00000000

p0_label_262:
!	%f6  = d85820ff 047e2ea5, Mem[0000000010041428] = d01edd19 000000e3
	stda	%f6 ,[%i1+0x028]%asi	! Mem[0000000010041428] = d85820ff 047e2ea5
!	Mem[0000000010041410] = 047e2ea5, %l6 = 0000000000000000
	swapa	[%i1+%o5]0x88,%l6	! %l6 = 00000000047e2ea5
!	Mem[0000000030081400] = ff0057fd, %l6 = 00000000047e2ea5
	ldstuba	[%i2+%g0]0x81,%l6	! %l6 = 000000ff000000ff
!	%l4 = 297dffff00000000, Mem[0000000030141400] = 8bf27f53
	stba	%l4,[%i5+%g0]0x89	! Mem[0000000030141400] = 8bf27f00
!	%l0 = 00000000000000ff, %l4 = 297dffff00000000, %l4 = 297dffff00000000
	subc	%l0,%l4,%l4		! %l4 = d6820001000000ff
!	%f20 = e3000000 0000ffff, %l7 = 0000000000000000
!	Mem[0000000010041428] = d85820ff047e2ea5
	add	%i1,0x028,%g1
	stda	%f20,[%g1+%l7]ASI_PST16_P ! Mem[0000000010041428] = d85820ff047e2ea5
!	%l6 = 000000ff, %l7 = 00000000, Mem[0000000030081410] = ff000000 ffffffff
	stda	%l6,[%i2+%o5]0x81	! Mem[0000000030081410] = 000000ff 00000000
!	%l3 = 0000000000007eff, Mem[0000000010081400] = 7f7f0000
	stha	%l3,[%i2+%g0]0x80	! Mem[0000000010081400] = 7eff0000
!	Mem[0000000010041409] = f66d47e8, %l2 = 0000000000000000
	ldstuba	[%i1+0x009]%asi,%l2	! %l2 = 0000006d000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = 000000ff, %l1 = ffffffffffffd8d8
	ldsha	[%i0+%o5]0x88,%l1	! %l1 = 00000000000000ff

p0_label_263:
	membar	#Sync			! Added by membar checker (41)
!	Mem[0000000010181400] = d01edd19 00000000 ffffffff 00000000
!	Mem[0000000010181410] = e3000000 ff00088d 000000e4 e300fb00
!	Mem[0000000010181420] = ff0057fd 726f2f17 00000000 00000000
!	Mem[0000000010181430] = 0000b160 47ee08ff 000003d2 047e2ea5
	ldda	[%i6]ASI_BLK_AIUPL,%f0	! Block Load from 0000000010181400
!	Mem[0000000010181410] = 000000e3, %f28 = 0000cd61
	lda	[%i6+%o5]0x88,%f28	! %f28 = 000000e3
!	Mem[0000000010081410] = 00000000, %f29 = 000000ff
	lda	[%i2+%o5]0x80,%f29	! %f29 = 00000000
!	Mem[0000000010081438] = 00bc0000d52a7e04, %l2 = 000000000000006d
	ldx	[%i2+0x038],%l2		! %l2 = 00bc0000d52a7e04
!	Mem[0000000020800000] = ffffe062, %l5 = 0000000000000000
	lduh	[%o1+%g0],%l5		! %l5 = 000000000000ffff
!	Mem[00000000300c1410] = ff000000, %l4 = d6820001000000ff
	ldswa	[%i3+%o5]0x81,%l4	! %l4 = ffffffffff000000
!	Mem[0000000010081418] = 00000000, %l3 = 0000000000007eff
	ldsw	[%i2+0x018],%l3		! %l3 = 0000000000000000
!	Mem[0000000020800000] = ffffe062, %l2 = 00bc0000d52a7e04
	ldsha	[%o1+0x000]%asi,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000010041408] = f6ff47e8, %l3 = 0000000000000000
	ldsh	[%i1+0x00a],%l3		! %l3 = 00000000000047e8
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (42)
!	%f26 = 95d0a0c4 6bd091ff, Mem[0000000010181408] = ffffffff 00000000
	stda	%f26,[%i6+%o4]0x88	! Mem[0000000010181408] = 95d0a0c4 6bd091ff

p0_label_264:
!	%l3 = 00000000000047e8, Mem[000000001000143f] = 1e25229f, %asi = 80
	stba	%l3,[%i0+0x03f]%asi	! Mem[000000001000143c] = 1e2522e8
!	%l3 = 00000000000047e8, Mem[0000000030141400] = 007ff28b654a7d29
	stxa	%l3,[%i5+%g0]0x81	! Mem[0000000030141400] = 00000000000047e8
!	%f26 = 95d0a0c4, Mem[0000000030181400] = 00000000
	sta	%f26,[%i6+%g0]0x89	! Mem[0000000030181400] = 95d0a0c4
!	%l5 = 000000000000ffff, Mem[00000000211c0001] = d8d8e5a1, %asi = 80
	stba	%l5,[%o2+0x001]%asi	! Mem[00000000211c0000] = d8ffe5a1
!	%f2  = 00000000, Mem[0000000010141438] = 00000000
	sta	%f2 ,[%i5+0x038]%asi	! Mem[0000000010141438] = 00000000
!	Code Fragment 4
p0_fragment_28:
!	%l0 = 00000000000000ff
	setx	0x5f387107d6542c3f,%g7,%l0 ! %l0 = 5f387107d6542c3f
!	%l1 = 00000000000000ff
	setx	0x3433fa2fdd664e03,%g7,%l1 ! %l1 = 3433fa2fdd664e03
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 5f387107d6542c3f
	setx	0x81fd35887f5ead7d,%g7,%l0 ! %l0 = 81fd35887f5ead7d
!	%l1 = 3433fa2fdd664e03
	setx	0xf63d321fbac2602a,%g7,%l1 ! %l1 = f63d321fbac2602a
!	Mem[00000000300c1410] = ff000000, %l2 = ffffffffffffffff
	ldstuba	[%i3+%o5]0x81,%l2	! %l2 = 000000ff000000ff
!	%l0 = 81fd35887f5ead7d, Mem[000000001010142a] = 29eaa2e2
	sth	%l0,[%i4+0x02a]		! Mem[0000000010101428] = 29eaad7d
!	Mem[0000000030141400] = 00000000, %l6 = 00000000000000ff
	swapa	[%i5+%g0]0x81,%l6	! %l6 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030181410] = ff0000e3, %l1 = f63d321fbac2602a
	ldsba	[%i6+%o5]0x81,%l1	! %l1 = ffffffffffffffff

p0_label_265:
!	Mem[00000000100c1408] = 600000ff000000e3, %f8  = 172f6f72 fd5700ff
	ldda	[%i3+%o4]0x88,%f8 	! %f8  = 600000ff 000000e3
!	Mem[0000000030141408] = 000000ff000000e3, %f4  = 8d0800ff 000000e3
	ldda	[%i5+%o4]0x81,%f4 	! %f4  = 000000ff 000000e3
!	Mem[0000000010141420] = 00736934, %l7 = 0000000000000000
	lduw	[%i5+0x020],%l7		! %l7 = 0000000000736934
!	Mem[00000000100c1438] = 4ca6fc6b 654a7d29, %l2 = 000000ff, %l3 = 000047e8
	ldda	[%i3+0x038]%asi,%l2	! %l2 = 000000004ca6fc6b 00000000654a7d29
!	%l4 = ffffffffff000000, immd = fffffffffffff18b, %l2 = 000000004ca6fc6b
	udivx	%l4,-0xe75,%l2		! %l2 = 0000000000000000
	membar	#Sync			! Added by membar checker (43)
!	Mem[0000000010001400] = 297dffff 00000000 00000000 646d910d
!	Mem[0000000010001410] = ff000000 00000000 00000000 db72f184
!	Mem[0000000010001420] = 00000000 000000bc d2038d08 29000000
!	Mem[0000000010001430] = a52e7e04 f66d47e8 ff302700 1e2522e8
	ldda	[%i0]ASI_BLK_P,%f16	! Block Load from 0000000010001400
!	Mem[0000000030181410] = 00000000e30000ff, %f6  = 00fb00e3 e4000000
	ldda	[%i6+%o5]0x89,%f6 	! %f6  = 00000000 e30000ff
!	Mem[000000001010141c] = 6f13569c, %l5 = 000000000000ffff
	ldsba	[%i4+0x01c]%asi,%l5	! %l5 = 000000000000006f
!	Mem[0000000010101410] = 19dd1ed0, %l5 = 000000000000006f
	lduha	[%i4+%o5]0x80,%l5	! %l5 = 00000000000019dd
!	Starting 10 instruction Store Burst
!	Mem[00000000211c0001] = d8ffe5a1, %l3 = 00000000654a7d29
	ldstuba	[%o2+0x001]%asi,%l3	! %l3 = 000000ff000000ff

p0_label_266:
!	Mem[00000000300c1400] = a52e7e04, %l0 = 81fd35887f5ead7d
	ldstuba	[%i3+%g0]0x81,%l0	! %l0 = 000000a5000000ff
!	Mem[0000000010141408] = 00000000, %l2 = 0000000000000000
	ldstuba	[%i5+%o4]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030001410] = 000000e3, %l3 = 00000000000000ff
	swapa	[%i0+%o5]0x89,%l3	! %l3 = 00000000000000e3
!	Mem[0000000030041410] = 000000ff, %l7 = 0000000000736934
	ldstuba	[%i1+%o5]0x81,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030141408] = 000000ff, %l1 = ffffffffffffffff
	swapa	[%i5+%o4]0x81,%l1	! %l1 = 00000000000000ff
!	%f12 = ff08ee47 60b10000, %l4 = ffffffffff000000
!	Mem[0000000010141428] = 29eaa2e2047e2ea5
	add	%i5,0x028,%g1
	stda	%f12,[%g1+%l4]ASI_PST16_PL ! Mem[0000000010141428] = 29eaa2e2047e2ea5
!	%l0 = 000000a5, %l1 = 000000ff, Mem[0000000030001410] = ff000000 0000ffff
	stda	%l0,[%i0+%o5]0x81	! Mem[0000000030001410] = 000000a5 000000ff
!	%f6  = 00000000, Mem[00000000300c1400] = 047e2eff
	sta	%f6 ,[%i3+%g0]0x89	! Mem[00000000300c1400] = 00000000
	membar	#Sync			! Added by membar checker (44)
!	%l6 = 0000000000000000, Mem[0000000010001408] = 0d916d6400000000
	stxa	%l6,[%i0+%o4]0x88	! Mem[0000000010001408] = 0000000000000000
!	Starting 10 instruction Load Burst
!	%l3 = 00000000000000e3, immed = 00000343, %y  = 297d4a64
	udiv	%l3,0x343,%l3		! %l3 = 00000000ffffffff
	mov	%l0,%y			! %y = 000000a5

p0_label_267:
!	Mem[0000000030181410] = e30000ff, %f7  = e30000ff
	lda	[%i6+%o5]0x89,%f7 	! %f7 = e30000ff
!	Mem[0000000010081400] = 0000ff7e, %l6 = 0000000000000000
	lduba	[%i2+%g0]0x88,%l6	! %l6 = 000000000000007e
!	Mem[0000000010181408] = ff91d06b, %l6 = 000000000000007e
	ldsha	[%i6+%o4]0x80,%l6	! %l6 = ffffffffffffff91
!	Mem[00000000100c1400] = 0000feae, %l6 = ffffffffffffff91
	ldsba	[%i3+%g0]0x88,%l6	! %l6 = ffffffffffffffae
!	Mem[0000000030001408] = 047e2ea5, %l7 = 0000000000000000
	ldsha	[%i0+%o4]0x81,%l7	! %l7 = 000000000000047e
!	Mem[0000000010101410] = d01edd19, %l5 = 00000000000019dd
	lduwa	[%i4+%o5]0x88,%l5	! %l5 = 00000000d01edd19
!	Mem[0000000030001408] = 047e2ea5, %l3 = 00000000ffffffff
	ldsba	[%i0+%o4]0x81,%l3	! %l3 = 0000000000000004
!	Mem[0000000030141400] = 000000ff 000047e8 ffffffff 000000e3
!	Mem[0000000030141410] = 04000000 00000000 60000000 00000000
!	Mem[0000000030141420] = 00000000 34697300 a52e7e04 e2a2ea29
!	Mem[0000000030141430] = e3000000 d2038d08 00000000 00000000
	ldda	[%i5]ASI_BLK_AIUSL,%f0	! Block Load from 0000000030141400
!	Mem[0000000010141410] = c5000000 ff000000, %l4 = ff000000, %l5 = d01edd19
	ldda	[%i5+0x010]%asi,%l4	! %l4 = 00000000c5000000 00000000ff000000
!	Starting 10 instruction Store Burst
!	%f28 = a52e7e04, Mem[0000000010081408] = 000000ff
	sta	%f28,[%i2+%o4]0x88	! Mem[0000000010081408] = a52e7e04

p0_label_268:
!	%l1 = 00000000000000ff, Mem[00000000100c1400] = 0000feae
	stha	%l1,[%i3+%g0]0x88	! Mem[00000000100c1400] = 000000ff
!	%l0 = 00000000000000a5, Mem[0000000010141410] = 000000ff000000c5
	stxa	%l0,[%i5+%o5]0x88	! Mem[0000000010141410] = 00000000000000a5
!	Mem[0000000030101408] = ff004a65, %l6 = ffffffffffffffae
	swapa	[%i4+%o4]0x81,%l6	! %l6 = 00000000ff004a65
!	%f18 = 00000000 646d910d, %l0 = 00000000000000a5
!	Mem[0000000030081428] = 0000000000000000
	add	%i2,0x028,%g1
	stda	%f18,[%g1+%l0]ASI_PST32_SL ! Mem[0000000030081428] = 0d916d6400000000
!	%f28 = a52e7e04 f66d47e8, %l4 = 00000000c5000000
!	Mem[0000000010101418] = a9fc6c606f13569c
	add	%i4,0x018,%g1
	stda	%f28,[%g1+%l4]ASI_PST16_P ! Mem[0000000010101418] = a9fc6c606f13569c
!	%f28 = a52e7e04 f66d47e8, %l4 = 00000000c5000000
!	Mem[0000000010101408] = 0000000000000000
	add	%i4,0x008,%g1
	stda	%f28,[%g1+%l4]ASI_PST32_P ! Mem[0000000010101408] = 0000000000000000
!	%l1 = 00000000000000ff, Mem[0000000010181434] = 47ee08ff, %asi = 80
	stwa	%l1,[%i6+0x034]%asi	! Mem[0000000010181434] = 000000ff
!	%l2 = 0000000000000000, Mem[0000000030181408] = 000000ff
	stba	%l2,[%i6+%o4]0x89	! Mem[0000000030181408] = 00000000
!	Code Fragment 4
p0_fragment_29:
!	%l0 = 00000000000000a5
	setx	0x264684ef8400566a,%g7,%l0 ! %l0 = 264684ef8400566a
!	%l1 = 00000000000000ff
	setx	0x6cabc7978fb4d3c2,%g7,%l1 ! %l1 = 6cabc7978fb4d3c2
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 264684ef8400566a
	setx	0xae97ce978e03d982,%g7,%l0 ! %l0 = ae97ce978e03d982
!	%l1 = 6cabc7978fb4d3c2
	setx	0x5e724fd7b1ec54da,%g7,%l1 ! %l1 = 5e724fd7b1ec54da
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = ff0057fd, %l7 = 000000000000047e
	lduba	[%i2+%g0]0x81,%l7	! %l7 = 00000000000000ff

p0_label_269:
!	Mem[0000000010181410] = e3000000ff00088d, %f26 = d2038d08 29000000
	ldda	[%i6+%o5]0x80,%f26	! %f26 = e3000000 ff00088d
!	Mem[0000000030041408] = ff7e00a5, %l3 = 0000000000000004
	lduba	[%i1+%o4]0x81,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030141400] = 000000ff, %l0 = ae97ce978e03d982
	ldsba	[%i5+%g0]0x81,%l0	! %l0 = 0000000000000000
!	Mem[00000000201c0000] = ff8c01ce, %l4 = 00000000c5000000
	ldsha	[%o0+0x000]%asi,%l4	! %l4 = ffffffffffffff8c
!	Mem[00000000211c0000] = d8ffe5a1, %l4 = ffffffffffffff8c
	lduba	[%o2+0x001]%asi,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030101408] = ffff9fffaeffffff, %l7 = 00000000000000ff
	ldxa	[%i4+%o4]0x89,%l7	! %l7 = ffff9fffaeffffff
!	Mem[0000000030181400] = c4a0d095, %l7 = ffff9fffaeffffff
	ldsha	[%i6+%g0]0x81,%l7	! %l7 = ffffffffffffc4a0
!	Mem[0000000030141410] = 04000000, %l3 = 00000000000000ff
	lduwa	[%i5+%o5]0x81,%l3	! %l3 = 0000000004000000
!	Mem[0000000030181410] = 00000000e30000ff, %f16 = 297dffff 00000000
	ldda	[%i6+%o5]0x89,%f16	! %f16 = 00000000 e30000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000010041410] = 00000000, %l7 = ffffffffffffc4a0
	swapa	[%i1+%o5]0x88,%l7	! %l7 = 0000000000000000

p0_label_270:
!	%f16 = 00000000 e30000ff, Mem[0000000030041410] = ff0000ff 9f22251e
	stda	%f16,[%i1+%o5]0x81	! Mem[0000000030041410] = 00000000 e30000ff
!	Mem[0000000010081400] = 0000ff7e, %l4 = 00000000000000ff
	swapa	[%i2+%g0]0x88,%l4	! %l4 = 000000000000ff7e
!	%l1 = 5e724fd7b1ec54da, Mem[0000000010101400] = 00000000
	stwa	%l1,[%i4+%g0]0x80	! Mem[0000000010101400] = b1ec54da
!	%l4 = 000000000000ff7e, Mem[0000000020800040] = 00fff99a
	sth	%l4,[%o1+0x040]		! Mem[0000000020800040] = ff7ef99a
!	%l6 = ff004a65, %l7 = 00000000, Mem[0000000010181410] = e3000000 ff00088d
	stda	%l6,[%i6+%o5]0x80	! Mem[0000000010181410] = ff004a65 00000000
!	%l0 = 00000000, %l1 = b1ec54da, Mem[0000000010101408] = 00000000 00000000
	stda	%l0,[%i4+%o4]0x80	! Mem[0000000010101408] = 00000000 b1ec54da
!	%l1 = 5e724fd7b1ec54da, Mem[0000000020800040] = ff7ef99a
	sth	%l1,[%o1+0x040]		! Mem[0000000020800040] = 54daf99a
!	Mem[00000000218001c1] = 00ffc752, %l3 = 0000000004000000
	ldstub	[%o3+0x1c1],%l3		! %l3 = 000000ff000000ff
!	%f26 = e3000000 ff00088d, Mem[0000000030001408] = 047e2ea5 654a7d29
	stda	%f26,[%i0+%o4]0x81	! Mem[0000000030001408] = e3000000 ff00088d
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = ff000000 00000000, %l4 = 0000ff7e, %l5 = ff000000
	ldda	[%i5+%o4]0x80,%l4	! %l4 = 00000000ff000000 0000000000000000

p0_label_271:
!	Mem[000000001008141c] = 000000ff, %l3 = 00000000000000ff
	ldsw	[%i2+0x01c],%l3		! %l3 = 00000000000000ff
!	Mem[0000000021800180] = ffb7423e, %l5 = 0000000000000000
	ldsh	[%o3+0x180],%l5		! %l5 = ffffffffffffffb7
!	Mem[0000000010001408] = 00000000, %l2 = 0000000000000000
	lduba	[%i0+%o4]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000010081410] = 0000000000000000, %f22 = 00000000 db72f184
	ldda	[%i2+%o5]0x88,%f22	! %f22 = 00000000 00000000
!	Mem[0000000020800040] = 54daf99a, %l5 = ffffffffffffffb7
	ldsba	[%o1+0x041]%asi,%l5	! %l5 = ffffffffffffffda
!	Mem[0000000030101408] = aeffffff, %f2  = e3000000
	lda	[%i4+%o4]0x89,%f2 	! %f2 = aeffffff
!	%l1 = 5e724fd7b1ec54da, immed = 00000635, %y  = 000000a5
	umul	%l1,0x635,%l0		! %l0 = 000004505feaad22, %y = 00000450
!	Mem[0000000010141418] = e3000000 0000ffff, %l4 = ff000000, %l5 = ffffffda
	ldda	[%i5+0x018]%asi,%l4	! %l4 = 00000000e3000000 000000000000ffff
	membar	#Sync			! Added by membar checker (45)
!	Mem[0000000030001400] = ffff0000 c38122ff e3000000 ff00088d
!	Mem[0000000030001410] = 000000a5 000000ff 646d910d 7abbfe4d
!	Mem[0000000030001420] = 00000000 340000ff 95d0a0c4 6bd091ff
!	Mem[0000000030001430] = 00000000 a6007f18 fd2146b2 e70000ff
	ldda	[%i0]ASI_BLK_AIUS,%f0	! Block Load from 0000000030001400
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1410] = ff000000, %l3 = 00000000000000ff
	ldstuba	[%i3+%o5]0x81,%l3	! %l3 = 000000ff000000ff

p0_label_272:
!	Mem[0000000010041420] = e3000000, %l3 = 00000000000000ff
	ldstuba	[%i1+0x020]%asi,%l3	! %l3 = 000000e3000000ff
!	Mem[0000000020800001] = ffffe062, %l5 = 000000000000ffff
	ldstuba	[%o1+0x001]%asi,%l5	! %l5 = 000000ff000000ff
!	Mem[0000000010001401] = 297dffff, %l6 = 00000000ff004a65
	ldstub	[%i0+0x001],%l6		! %l6 = 0000007d000000ff
!	%l5 = 00000000000000ff, Mem[0000000030181408] = 43157c9e00000000
	stxa	%l5,[%i6+%o4]0x89	! Mem[0000000030181408] = 00000000000000ff
!	Mem[0000000010081428] = 4dfebb7a94bcd52a, %l3 = 00000000000000e3, %l0 = 000004505feaad22
	add	%i2,0x28,%g1
	casxa	[%g1]0x80,%l3,%l0	! %l0 = 4dfebb7a94bcd52a
!	%l3 = 00000000000000e3, Mem[0000000010041420] = ff000000ffffffb7, %asi = 80
	stxa	%l3,[%i1+0x020]%asi	! Mem[0000000010041420] = 00000000000000e3
!	%l5 = 00000000000000ff, Mem[0000000030141400] = ff000000
	stba	%l5,[%i5+%g0]0x89	! Mem[0000000030141400] = ff0000ff
!	Mem[00000000218000c0] = 19ffd5a0, %l0 = 4dfebb7a94bcd52a
	ldstuba	[%o3+0x0c0]%asi,%l0	! %l0 = 00000019000000ff
!	%l4 = 00000000e3000000, Mem[0000000010081400] = ff000000
	stwa	%l4,[%i2+%g0]0x80	! Mem[0000000010081400] = e3000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = 29ffffff, %l0 = 0000000000000019
	ldsba	[%i0+%g0]0x80,%l0	! %l0 = 0000000000000029

p0_label_273:
!	Mem[0000000010141400] = 654affc5, %l0 = 0000000000000029
	lduwa	[%i5+%g0]0x88,%l0	! %l0 = 00000000654affc5
!	Mem[0000000030181410] = e30000ff, %l3 = 00000000000000e3
	ldsba	[%i6+%o5]0x89,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010041430] = 080003d2 000000e3, %l6 = 0000007d, %l7 = 00000000
	ldda	[%i1+0x030]%asi,%l6	! %l6 = 00000000080003d2 00000000000000e3
!	Mem[0000000030081410] = 000000ff, %l4 = 00000000e3000000
	ldsba	[%i2+%o5]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000030041400] = 0d916d64, %f29 = f66d47e8
	lda	[%i1+%g0]0x89,%f29	! %f29 = 0d916d64
!	Mem[0000000010041428] = d85820ff 047e2ea5, %l6 = 080003d2, %l7 = 000000e3
	ldda	[%i1+0x028]%asi,%l6	! %l6 = 00000000d85820ff 00000000047e2ea5
!	Mem[0000000010001418] = 00000000, %l7 = 00000000047e2ea5
	lduh	[%i0+0x018],%l7		! %l7 = 0000000000000000
!	Mem[0000000030001408] = 000000e3, %l3 = ffffffffffffffff
	ldstuba	[%i0+%o4]0x89,%l3	! %l3 = 000000e3000000ff
!	%l6 = 00000000d85820ff, imm = fffffffffffffa26, %l7 = 0000000000000000
	sub	%l6,-0x5da,%l7		! %l7 = 00000000d85826d9
!	Starting 10 instruction Store Burst
!	%l4 = 00000000, %l5 = 000000ff, Mem[0000000030101408] = ffffffae ff9fffff
	stda	%l4,[%i4+%o4]0x81	! Mem[0000000030101408] = 00000000 000000ff

p0_label_274:
!	Mem[0000000021800081] = 18f59b02, %l3 = 00000000000000e3
	ldstub	[%o3+0x081],%l3		! %l3 = 000000f5000000ff
!	%f22 = 00000000 00000000, Mem[0000000010141410] = 000000a5 00000000
	stda	%f22,[%i5+%o5]0x88	! Mem[0000000010141410] = 00000000 00000000
!	%l4 = 0000000000000000, Mem[00000000300c1408] = 6000ff00
	stha	%l4,[%i3+%o4]0x89	! Mem[00000000300c1408] = 60000000
!	%f25 = 000000bc, Mem[0000000030141408] = ffffffff
	sta	%f25,[%i5+%o4]0x89	! Mem[0000000030141408] = 000000bc
!	%l2 = 00000000, %l3 = 000000f5, Mem[0000000030141400] = ff0000ff e8470000
	stda	%l2,[%i5+%g0]0x89	! Mem[0000000030141400] = 00000000 000000f5
	membar	#Sync			! Added by membar checker (46)
!	%l5 = 00000000000000ff, Mem[0000000030001400] = ffff0000
	stha	%l5,[%i0+%g0]0x81	! Mem[0000000030001400] = 00ff0000
!	Mem[0000000030181408] = 000000ff, %l6 = 00000000d85820ff
	ldstuba	[%i6+%o4]0x89,%l6	! %l6 = 000000ff000000ff
!	%f18 = 00000000 646d910d, %l1 = 5e724fd7b1ec54da
!	Mem[0000000030141408] = bc000000000000e3
	add	%i5,0x008,%g1
	stda	%f18,[%g1+%l1]ASI_PST32_SL ! Mem[0000000030141408] = bc00000000000000
!	%f8  = 00000000 340000ff, Mem[0000000030141410] = 04000000 00000000
	stda	%f8 ,[%i5+%o5]0x81	! Mem[0000000030141410] = 00000000 340000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = 00000800, %l6 = 00000000000000ff
	ldsba	[%i2+%o4]0x89,%l6	! %l6 = 0000000000000000

p0_label_275:
!	Mem[0000000030181408] = ff00000000000000, %f24 = 00000000 000000bc
	ldda	[%i6+%o4]0x81,%f24	! %f24 = ff000000 00000000
!	Mem[0000000030081408] = 000080cb00000800, %l3 = 00000000000000f5
	ldxa	[%i2+%o4]0x89,%l3	! %l3 = 000080cb00000800
!	Mem[0000000010001410] = 000000ff, %l5 = 00000000000000ff
	lduba	[%i0+%o5]0x88,%l5	! %l5 = 00000000000000ff
!	%f16 = 00000000, %f17 = e30000ff
	fcmpes	%fcc1,%f16,%f17		! %fcc1 = 2
!	Mem[00000000201c0000] = ff8c01ce, %l0 = 00000000654affc5
	ldsha	[%o0+0x000]%asi,%l0	! %l0 = ffffffffffffff8c
!	Mem[0000000010001400] = 29ffffff, %f10 = 95d0a0c4
	ld	[%i0+%g0],%f10	! %f10 = 29ffffff
!	Mem[0000000030181410] = ff0000e3, %l2 = 0000000000000000
	ldsba	[%i6+%o5]0x81,%l2	! %l2 = ffffffffffffffff
!	Mem[00000000211c0000] = d8ffe5a1, %l0 = ffffffffffffff8c
	ldub	[%o2+0x001],%l0		! %l0 = 00000000000000ff
!	Code Fragment 3
p0_fragment_30:
!	%l0 = 00000000000000ff
	setx	0xa770a2204f7c00cf,%g7,%l0 ! %l0 = a770a2204f7c00cf
!	%l1 = 5e724fd7b1ec54da
	setx	0x74a1ee181bbb3368,%g7,%l1 ! %l1 = 74a1ee181bbb3368
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = a770a2204f7c00cf
	setx	0x4502493044a35ba2,%g7,%l0 ! %l0 = 4502493044a35ba2
!	%l1 = 74a1ee181bbb3368
	setx	0xb4484e401286992d,%g7,%l1 ! %l1 = b4484e401286992d
!	Starting 10 instruction Store Burst
!	%l0 = 4502493044a35ba2, Mem[0000000010001400] = 29ffffff
	stwa	%l0,[%i0+%g0]0x80	! Mem[0000000010001400] = 44a35ba2

p0_label_276:
!	%f18 = 00000000 646d910d, Mem[0000000010141400] = c5ff4a65 ff9fffff
	stda	%f18,[%i5+%g0]0x80	! Mem[0000000010141400] = 00000000 646d910d
!	Mem[0000000010081410] = 00000000, %l6 = 0000000000000000
	swapa	[%i2+%o5]0x88,%l6	! %l6 = 0000000000000000
!	Mem[00000000300c1400] = 00000000, %l1 = b4484e401286992d
	ldstuba	[%i3+%g0]0x89,%l1	! %l1 = 00000000000000ff
!	%f8  = 00000000 340000ff, %l2 = ffffffffffffffff
!	Mem[0000000030181400] = c4a0d09500000000
	stda	%f8,[%i6+%l2]ASI_PST32_S ! Mem[0000000030181400] = 00000000340000ff
!	%l6 = 0000000000000000, Mem[0000000030081410] = 000000ff
	stwa	%l6,[%i2+%o5]0x81	! Mem[0000000030081410] = 00000000
!	Mem[0000000030081408] = 00080000, %l3 = 000080cb00000800
	swapa	[%i2+%o4]0x81,%l3	! %l3 = 0000000000080000
!	%l7 = 00000000d85826d9, Mem[0000000010081410] = 0000000000000000
	stxa	%l7,[%i2+%o5]0x80	! Mem[0000000010081410] = 00000000d85826d9
!	%f0  = ffff0000 c38122ff, Mem[0000000010081408] = 047e2ea5 61cd0000
	stda	%f0 ,[%i2+%o4]0x80	! Mem[0000000010081408] = ffff0000 c38122ff
!	%l1 = 0000000000000000, Mem[0000000010101408] = 00000000
	stba	%l1,[%i4+%o4]0x80	! Mem[0000000010101408] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = e3000000ff000060, %l2 = ffffffffffffffff
	ldxa	[%i3+%o4]0x80,%l2	! %l2 = e3000000ff000060

p0_label_277:
!	Mem[0000000010001408] = 00000000, %l1 = 0000000000000000
	ldswa	[%i0+%o4]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000030141400] = 00000000, %l2 = e3000000ff000060
	ldsha	[%i5+%g0]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000030081408] = 00080000, %l2 = 0000000000000000
	lduba	[%i2+%o4]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000010101410] = 19dd1ed0ffffffff, %l7 = 00000000d85826d9
	ldxa	[%i4+%o5]0x80,%l7	! %l7 = 19dd1ed0ffffffff
!	Mem[0000000030041408] = 00000000a5007eff, %f6  = 646d910d 7abbfe4d
	ldda	[%i1+%o4]0x89,%f6 	! %f6  = 00000000 a5007eff
!	Mem[00000000100c1410] = 1560ae00, %l3 = 0000000000080000
	ldsha	[%i3+%o5]0x88,%l3	! %l3 = ffffffffffffae00
!	Mem[0000000010081400] = e30000009e7c15ff, %f26 = e3000000 ff00088d
	ldda	[%i2+%g0]0x80,%f26	! %f26 = e3000000 9e7c15ff
!	Mem[0000000010041400] = d01edd19, %f26 = e3000000
	lda	[%i1+%g0]0x80,%f26	! %f26 = d01edd19
!	Mem[0000000030181410] = 00000000 e30000ff, %l0 = 44a35ba2, %l1 = 00000000
	ldda	[%i6+%o5]0x89,%l0	! %l0 = 00000000e30000ff 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010101408] = 00000000, %l4 = 0000000000000000
	swapa	[%i4+%o4]0x88,%l4	! %l4 = 0000000000000000

p0_label_278:
!	%l2 = 00000000, %l3 = ffffae00, Mem[0000000010041408] = e847fff6 00000000
	stda	%l2,[%i1+%o4]0x88	! Mem[0000000010041408] = 00000000 ffffae00
!	%l4 = 0000000000000000, Mem[0000000010041410] = a0c4ffff
	stwa	%l4,[%i1+%o5]0x80	! Mem[0000000010041410] = 00000000
!	%l4 = 0000000000000000, Mem[0000000010141410] = 0000000000000000
	stxa	%l4,[%i5+%o5]0x80	! Mem[0000000010141410] = 0000000000000000
!	%l6 = 00000000, %l7 = ffffffff, Mem[0000000010181410] = ff004a65 00000000
	std	%l6,[%i6+%o5]		! Mem[0000000010181410] = 00000000 ffffffff
!	Mem[0000000030101408] = 00000000, %l4 = 0000000000000000
	ldstuba	[%i4+%o4]0x81,%l4	! %l4 = 00000000000000ff
!	Mem[00000000300c1400] = 000000ff, %l6 = 0000000000000000
	swapa	[%i3+%g0]0x89,%l6	! %l6 = 00000000000000ff
!	%f24 = ff000000 00000000, Mem[0000000010141410] = 00000000 00000000
	stda	%f24,[%i5+%o5]0x80	! Mem[0000000010141410] = ff000000 00000000
!	%l5 = 00000000000000ff, Mem[0000000010181408] = ff91d06bc4a0d095
	stxa	%l5,[%i6+%o4]0x80	! Mem[0000000010181408] = 00000000000000ff
!	%f28 = a52e7e04 0d916d64, %l4 = 0000000000000000
!	Mem[0000000010141420] = 0073693400000000
	add	%i5,0x020,%g1
	stda	%f28,[%g1+%l4]ASI_PST16_PL ! Mem[0000000010141420] = 0073693400000000
!	Starting 10 instruction Load Burst
!	Mem[000000001004142c] = 047e2ea5, %l7 = 19dd1ed0ffffffff
	lduh	[%i1+0x02e],%l7		! %l7 = 0000000000002ea5

p0_label_279:
!	Mem[0000000030101410] = 7f180000, %f9  = 340000ff
	lda	[%i4+%o5]0x81,%f9 	! %f9 = 7f180000
!	Mem[0000000030081408] = 000080cb 00080000, %l2 = 00000000, %l3 = ffffae00
	ldda	[%i2+%o4]0x89,%l2	! %l2 = 0000000000080000 00000000000080cb
!	Mem[0000000010181400] = d01edd19, %f16 = 00000000
	lda	[%i6+%g0]0x80,%f16	! %f16 = d01edd19
!	Mem[0000000010001400] = 44a35ba2, %l0 = 00000000e30000ff
	ldsha	[%i0+%g0]0x80,%l0	! %l0 = 00000000000044a3
!	Mem[0000000030181400] = 00000000, %l4 = 0000000000000000
	lduha	[%i6+%g0]0x89,%l4	! %l4 = 0000000000000000
!	Mem[00000000300c1410] = ff000000, %l7 = 0000000000002ea5
	lduba	[%i3+%o5]0x81,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030041400] = 000000000d916d64, %l6 = 00000000000000ff
	ldxa	[%i1+%g0]0x89,%l6	! %l6 = 000000000d916d64
!	Mem[0000000021800040] = 607028b2, %l6 = 000000000d916d64
	ldsb	[%o3+0x040],%l6		! %l6 = 0000000000000060
!	%l5 = 00000000000000ff, %l3 = 00000000000080cb, %l5 = 00000000000000ff
	addc	%l5,%l3,%l5		! %l5 = 00000000000081ca
!	Starting 10 instruction Store Burst
!	%l6 = 0000000000000060, Mem[00000000300c1400] = 00000000
	stha	%l6,[%i3+%g0]0x89	! Mem[00000000300c1400] = 00000060

p0_label_280:
!	Mem[00000000100c1400] = ff000000, %l1 = 0000000000000000
	swapa	[%i3+%g0]0x80,%l1	! %l1 = 00000000ff000000
!	%l1 = 00000000ff000000, Mem[0000000010181410] = 00000000
	stwa	%l1,[%i6+%o5]0x80	! Mem[0000000010181410] = ff000000
!	Mem[000000001004140a] = 00000000, %l7 = 00000000000000ff
	ldstub	[%i1+0x00a],%l7		! %l7 = 00000000000000ff
!	%l4 = 0000000000000000, Mem[0000000030181410] = ff0000e300000000
	stxa	%l4,[%i6+%o5]0x81	! Mem[0000000030181410] = 0000000000000000
!	Mem[0000000010101400] = b1ec54da, %l0 = 00000000000044a3
	swapa	[%i4+%g0]0x80,%l0	! %l0 = 00000000b1ec54da
!	Mem[00000000300c1400] = 60000000, %l4 = 0000000000000000
	swapa	[%i3+%g0]0x81,%l4	! %l4 = 0000000060000000
!	%f28 = a52e7e04, Mem[0000000030141410] = 00000000
	sta	%f28,[%i5+%o5]0x81	! Mem[0000000030141410] = a52e7e04
!	%l0 = 00000000b1ec54da, Mem[0000000030141410] = 047e2ea5
	stwa	%l0,[%i5+%o5]0x89	! Mem[0000000030141410] = b1ec54da
!	%l7 = 0000000000000000, Mem[00000000100c1400] = 00000000
	stha	%l7,[%i3+%g0]0x80	! Mem[00000000100c1400] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = ff000000, %l5 = 00000000000081ca
	ldsha	[%i6+%o5]0x80,%l5	! %l5 = ffffffffffffff00

p0_label_281:
!	Mem[0000000010001418] = 00000000, %l5 = ffffffffffffff00
	lduwa	[%i0+0x018]%asi,%l5	! %l5 = 0000000000000000
!	Mem[00000000100c1410] = 00ae6015, %l6 = 0000000000000060
	ldsha	[%i3+%o5]0x80,%l6	! %l6 = 00000000000000ae
!	Mem[0000000010101408] = da54ecb1 00000000, %l0 = b1ec54da, %l1 = ff000000
	ldda	[%i4+%o4]0x88,%l0	! %l0 = 0000000000000000 00000000da54ecb1
!	%l4 = 0000000060000000, immed = fffff118, %y  = 00000450
	umul	%l4,-0xee8,%l4		! %l4 = 5ffffa6900000000, %y = 5ffffa69
!	Mem[00000000201c0000] = ff8c01ce, %l6 = 00000000000000ae
	ldsba	[%o0+0x001]%asi,%l6	! %l6 = ffffffffffffff8c
!	Mem[0000000030101410] = 7f180000, %l0 = 0000000000000000
	ldswa	[%i4+%o5]0x81,%l0	! %l0 = 000000007f180000
!	Mem[00000000300c1408] = 60000000, %l5 = 0000000000000000
	ldsba	[%i3+%o4]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000010181408] = 00000000, %l2 = 0000000000080000
	ldsba	[%i6+%o4]0x88,%l2	! %l2 = 0000000000000000
!	Mem[00000000300c1410] = ff0000008bf27f53, %l5 = 0000000000000000
	ldxa	[%i3+%o5]0x81,%l5	! %l5 = ff0000008bf27f53
!	Starting 10 instruction Store Burst
!	Mem[0000000030081410] = 00000000, %l0 = 000000007f180000
	ldstuba	[%i2+%o5]0x81,%l0	! %l0 = 00000000000000ff

p0_label_282:
!	%f14 = fd2146b2, Mem[0000000030101410] = 0000187f
	sta	%f14,[%i4+%o5]0x89	! Mem[0000000030101410] = fd2146b2
!	Mem[0000000010041410] = 0000000000000000, %l3 = 00000000000080cb, %l5 = ff0000008bf27f53
	add	%i1,0x10,%g1
	casxa	[%g1]0x80,%l3,%l5	! %l5 = 0000000000000000
!	Mem[0000000030101408] = 000000ff, %l4 = 5ffffa6900000000
	swapa	[%i4+%o4]0x89,%l4	! %l4 = 00000000000000ff
!	%l6 = ffffffffffffff8c, Mem[00000000100c1420] = 0000000034030000, %asi = 80
	stxa	%l6,[%i3+0x020]%asi	! Mem[00000000100c1420] = ffffffffffffff8c
!	%f20 = ff000000 00000000, Mem[0000000010141408] = 000000ff 00000000
	stda	%f20,[%i5+%o4]0x88	! Mem[0000000010141408] = ff000000 00000000
!	Mem[0000000030181408] = ff000000, %l4 = 00000000000000ff
	ldstuba	[%i6+%o4]0x81,%l4	! %l4 = 000000ff000000ff
!	Mem[0000000030081400] = ff0057fd, %l6 = ffffffffffffff8c
	swapa	[%i2+%g0]0x81,%l6	! %l6 = 00000000ff0057fd
!	%f28 = a52e7e04 0d916d64, %l3 = 00000000000080cb
!	Mem[0000000010141438] = 0000000000000000
	add	%i5,0x038,%g1
	stda	%f28,[%g1+%l3]ASI_PST8_PL ! Mem[0000000010141438] = 646d000d00002ea5
!	Mem[0000000010001410] = ff000000, %l6 = 00000000ff0057fd
	ldstuba	[%i0+%o5]0x80,%l6	! %l6 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = ff000000 8bf27f53, %l2 = 00000000, %l3 = 000080cb
	ldda	[%i3+%o5]0x81,%l2	! %l2 = 00000000ff000000 000000008bf27f53

p0_label_283:
!	Mem[0000000010041408] = 00ff0000, %l2 = 00000000ff000000
	lduwa	[%i1+%o4]0x88,%l2	! %l2 = 0000000000ff0000
!	Mem[0000000010081400] = e3000000, %l1 = 00000000da54ecb1
	lduwa	[%i2+%g0]0x80,%l1	! %l1 = 00000000e3000000
!	Mem[0000000030081410] = 000000ff, %l4 = 00000000000000ff
	ldswa	[%i2+%o5]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[00000000218001c0] = 00ffc752, %l5 = 0000000000000000
	ldsh	[%o3+0x1c0],%l5		! %l5 = 00000000000000ff
!	Mem[0000000030181410] = 00000000, %f20 = ff000000
	lda	[%i6+%o5]0x81,%f20	! %f20 = 00000000
!	Mem[00000000100c1410] = 00ae60150000ffff, %f14 = fd2146b2 e70000ff
	ldda	[%i3+%o5]0x80,%f14	! %f14 = 00ae6015 0000ffff
!	Mem[00000000201c0000] = ff8c01ce, %l0 = 0000000000000000
	ldsh	[%o0+%g0],%l0		! %l0 = ffffffffffffff8c
!	Mem[00000000300c1410] = 000000ff, %f7  = a5007eff
	lda	[%i3+%o5]0x89,%f7 	! %f7 = 000000ff
!	Mem[0000000030181408] = ff000000, %l4 = 00000000000000ff
	lduha	[%i6+%o4]0x81,%l4	! %l4 = 000000000000ff00
!	Starting 10 instruction Store Burst
!	%l6 = 00000000000000ff, Mem[0000000030081410] = 00000000000000ff
	stxa	%l6,[%i2+%o5]0x89	! Mem[0000000030081410] = 00000000000000ff

p0_label_284:
!	%l4 = 000000000000ff00, Mem[0000000010041410] = 00000000
	stba	%l4,[%i1+%o5]0x80	! Mem[0000000010041410] = 00000000
!	%f6  = 00000000 000000ff, Mem[00000000100c1408] = e3000000 ff000060
	stda	%f6 ,[%i3+%o4]0x80	! Mem[00000000100c1408] = 00000000 000000ff
!	Mem[0000000010081408] = 0000ffff, %l1 = 00000000e3000000
	ldstuba	[%i2+%o4]0x88,%l1	! %l1 = 000000ff000000ff
!	Mem[00000000100c1400] = 00000000, %l3 = 000000008bf27f53
	swapa	[%i3+%g0]0x80,%l3	! %l3 = 0000000000000000
!	%l4 = 000000000000ff00, %l7 = 0000000000000000, %l6 = 00000000000000ff
	sub	%l4,%l7,%l6		! %l6 = 000000000000ff00
!	Mem[0000000010041410] = 00000000, %l4 = 000000000000ff00
	ldstuba	[%i1+%o5]0x88,%l4	! %l4 = 00000000000000ff
!	%l6 = 000000000000ff00, Mem[0000000010081420] = ff3481c3
	sth	%l6,[%i2+0x020]		! Mem[0000000010081420] = ff0081c3
!	Mem[00000000201c0000] = ff8c01ce, %l5 = 00000000000000ff
	ldstub	[%o0+%g0],%l5		! %l5 = 000000ff000000ff
!	%l0 = ffffffffffffff8c, Mem[0000000010081428] = 4dfebb7a94bcd52a
	stx	%l0,[%i2+0x028]		! Mem[0000000010081428] = ffffffffffffff8c
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = 00000000000000ff, %f24 = ff000000 00000000
	ldda	[%i1+%o5]0x88,%f24	! %f24 = 00000000 000000ff

p0_label_285:
	membar	#Sync			! Added by membar checker (47)
!	Mem[00000000300c1400] = 00000000 654a7d29 00000060 0d916d64
!	Mem[00000000300c1410] = ff000000 8bf27f53 60000000 00000000
!	Mem[00000000300c1420] = 00000000 34697300 a52e7e04 e2a2ea29
!	Mem[00000000300c1430] = e3000000 d2038d08 00000000 00000000
	ldda	[%i3]ASI_BLK_SL,%f0	! Block Load from 00000000300c1400
!	Mem[0000000010081410] = 00000000, %l2 = 0000000000ff0000
	lduwa	[%i2+%o5]0x80,%l2	! %l2 = 0000000000000000
!	Code Fragment 4
p0_fragment_31:
!	%l0 = ffffffffffffff8c
	setx	0xd566d2b039aaa31f,%g7,%l0 ! %l0 = d566d2b039aaa31f
!	%l1 = 00000000000000ff
	setx	0xf0d9a587e66cac67,%g7,%l1 ! %l1 = f0d9a587e66cac67
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = d566d2b039aaa31f
	setx	0x260e48706c518d1f,%g7,%l0 ! %l0 = 260e48706c518d1f
!	%l1 = f0d9a587e66cac67
	setx	0x116da6286904ba1b,%g7,%l1 ! %l1 = 116da6286904ba1b
!	Mem[0000000030041400] = 646d910d, %l5 = 00000000000000ff
	lduba	[%i1+%g0]0x81,%l5	! %l5 = 0000000000000064
!	Mem[0000000010081438] = 00bc0000 d52a7e04, %l6 = 0000ff00, %l7 = 00000000
	ldda	[%i2+0x038]%asi,%l6	! %l6 = 0000000000bc0000 00000000d52a7e04
!	Mem[00000000300c1410] = 000000ff, %l7 = 00000000d52a7e04
	lduba	[%i3+%o5]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010101420] = 000000ff000000ff, %l0 = 260e48706c518d1f
	ldx	[%i4+0x020],%l0		! %l0 = 000000ff000000ff
!	Mem[00000000100c1400] = 8bf27f53, %f23 = 00000000
	lda	[%i3+%g0]0x80,%f23	! %f23 = 8bf27f53
!	Mem[0000000030081400] = 8cffffff, %l1 = 116da6286904ba1b
	ldsha	[%i2+%g0]0x89,%l1	! %l1 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	Mem[0000000030101408] = 00000000, %l6 = 0000000000bc0000
	ldstuba	[%i4+%o4]0x81,%l6	! %l6 = 00000000000000ff

p0_label_286:
!	%f17 = e30000ff, Mem[0000000010181400] = 19dd1ed0
	sta	%f17,[%i6+%g0]0x88	! Mem[0000000010181400] = e30000ff
!	%l0 = 000000ff000000ff, Mem[0000000010101438] = 9fff000000000000, %asi = 80
	stxa	%l0,[%i4+0x038]%asi	! Mem[0000000010101438] = 000000ff000000ff
!	%l7 = 00000000000000ff, Mem[0000000030001410] = a5000000
	stwa	%l7,[%i0+%o5]0x89	! Mem[0000000030001410] = 000000ff
!	Mem[0000000030001410] = 000000ff, %l2 = 0000000000000000
	ldstuba	[%i0+%o5]0x89,%l2	! %l2 = 000000ff000000ff
!	Code Fragment 4
p0_fragment_32:
!	%l0 = 000000ff000000ff
	setx	0x223590886fa4f8c1,%g7,%l0 ! %l0 = 223590886fa4f8c1
!	%l1 = ffffffffffffffff
	setx	0x01bddff7c0c9b99f,%g7,%l1 ! %l1 = 01bddff7c0c9b99f
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 223590886fa4f8c1
	setx	0xa6a853183c90d74c,%g7,%l0 ! %l0 = a6a853183c90d74c
!	%l1 = 01bddff7c0c9b99f
	setx	0x4e6ad597b6ec4d5a,%g7,%l1 ! %l1 = 4e6ad597b6ec4d5a
!	%l1 = 4e6ad597b6ec4d5a, Mem[00000000100c1410] = 00ae6015, %asi = 80
	stwa	%l1,[%i3+0x010]%asi	! Mem[00000000100c1410] = b6ec4d5a
	membar	#Sync			! Added by membar checker (48)
!	%f12 = 088d03d2, Mem[00000000300c1408] = 00000060
	sta	%f12,[%i3+%o4]0x81	! Mem[00000000300c1408] = 088d03d2
!	%l2 = 00000000000000ff, Mem[0000000030181410] = 00000000
	stwa	%l2,[%i6+%o5]0x81	! Mem[0000000030181410] = 000000ff
!	%l0 = 3c90d74c, %l1 = b6ec4d5a, Mem[0000000030001400] = 00ff0000 c38122ff
	stda	%l0,[%i0+%g0]0x81	! Mem[0000000030001400] = 3c90d74c b6ec4d5a
!	Starting 10 instruction Load Burst
!	Mem[0000000030181410] = 000000ff, %l6 = 0000000000000000
	lduba	[%i6+%o5]0x81,%l6	! %l6 = 0000000000000000

p0_label_287:
!	Mem[0000000010141400] = 00000000, %l7 = 00000000000000ff
	ldsha	[%i5+%g0]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000030181408] = ff000000, %f17 = e30000ff
	lda	[%i6+%o4]0x81,%f17	! %f17 = ff000000
!	Mem[0000000030181410] = ff000000, %l6 = 0000000000000000
	lduba	[%i6+%o5]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000010041410] = 000000ff, %l3 = 0000000000000000
	lduba	[%i1+%o5]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010081438] = 00bc0000, %l4 = 0000000000000000
	ldsb	[%i2+0x03b],%l4		! %l4 = 0000000000000000
!	Mem[00000000218000c0] = ffffd5a0, %l4 = 0000000000000000
	lduh	[%o3+0x0c0],%l4		! %l4 = 000000000000ffff
!	Mem[0000000030041408] = ff7e00a5, %l5 = 0000000000000064
	lduba	[%i1+%o4]0x81,%l5	! %l5 = 00000000000000ff
!	%l3 = 00000000000000ff, %l0 = a6a853183c90d74c, %l0 = a6a853183c90d74c
	xnor	%l3,%l0,%l0		! %l0 = 5957ace7c36f284c
!	Mem[0000000020800040] = 54daf99a, %l6 = 0000000000000000
	ldsba	[%o1+0x040]%asi,%l6	! %l6 = 0000000000000054
!	Starting 10 instruction Store Burst
!	Mem[0000000030081410] = 000000ff, %l7 = 0000000000000000
	ldstuba	[%i2+%o5]0x89,%l7	! %l7 = 000000ff000000ff

p0_label_288:
!	%l2 = 00000000000000ff, Mem[0000000030041410] = 00000000
	stba	%l2,[%i1+%o5]0x89	! Mem[0000000030041410] = 000000ff
!	%l0 = c36f284c, %l1 = b6ec4d5a, Mem[0000000010001408] = 00000000 00000000
	stda	%l0,[%i0+%o4]0x80	! Mem[0000000010001408] = c36f284c b6ec4d5a
!	%f8  = 00736934 00000000, Mem[0000000010041400] = d01edd19 ffffffff
	stda	%f8 ,[%i1+%g0]0x80	! Mem[0000000010041400] = 00736934 00000000
!	%l3 = 00000000000000ff, Mem[0000000010141400] = 0d916d6400000000
	stxa	%l3,[%i5+%g0]0x88	! Mem[0000000010141400] = 00000000000000ff
!	%f21 = 00000000, Mem[0000000030181410] = ff000000
	sta	%f21,[%i6+%o5]0x89	! Mem[0000000030181410] = 00000000
!	%l1 = 4e6ad597b6ec4d5a, Mem[0000000010041408] = 00ff0000
	stwa	%l1,[%i1+%o4]0x88	! Mem[0000000010041408] = b6ec4d5a
!	%f8  = 00736934, %f28 = a52e7e04, %f5  = 000000ff
	fsubs	%f8 ,%f28,%f5 		! %l0 = 5957ace7c36f286e, Unfinished, %fsr = 2e00000800
!	Mem[0000000010041400] = 00736934, %l2 = 00000000000000ff
	swapa	[%i1+%g0]0x80,%l2	! %l2 = 0000000000736934
!	Mem[0000000030081408] = 00000800, %l7 = 00000000000000ff
	ldstuba	[%i2+%o4]0x81,%l7	! %l7 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = 000000ff, %l2 = 0000000000736934
	lduwa	[%i1+%g0]0x80,%l2	! %l2 = 00000000000000ff

p0_label_289:
!	Mem[0000000030181408] = ff000000, %l0 = 5957ace7c36f286e
	ldsha	[%i6+%o4]0x81,%l0	! %l0 = ffffffffffffff00
!	Mem[0000000010181410] = ffffffff000000ff, %f4  = 537ff28b 000000ff
	ldda	[%i6+%o5]0x88,%f4 	! %f4  = ffffffff 000000ff
!	Mem[0000000010081400] = e3000000, %l0 = ffffffffffffff00
	lduha	[%i2+%g0]0x80,%l0	! %l0 = 000000000000e300
!	Mem[0000000010101414] = ffffffff, %l2 = 00000000000000ff
	ldswa	[%i4+0x014]%asi,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000030001410] = ff000000 000000ff, %l6 = 00000054, %l7 = 00000000
	ldda	[%i0+%o5]0x81,%l6	! %l6 = 00000000ff000000 00000000000000ff
!	Mem[0000000030101400] = c5000000, %l0 = 000000000000e300
	lduba	[%i4+%g0]0x81,%l0	! %l0 = 00000000000000c5
!	Mem[0000000030001410] = 000000ff, %f13 = 000000e3
	lda	[%i0+%o5]0x89,%f13	! %f13 = 000000ff
!	Mem[0000000010001410] = 00000000000000ff, %f12 = 088d03d2 000000ff
	ldda	[%i0+%o5]0x88,%f12	! %f12 = 00000000 000000ff
!	Mem[0000000021800180] = ffb7423e, %l1 = 4e6ad597b6ec4d5a
	ldsb	[%o3+0x181],%l1		! %l1 = ffffffffffffffb7
!	Starting 10 instruction Store Burst
!	%l6 = 00000000ff000000, Mem[0000000010081412] = 00000000
	stb	%l6,[%i2+0x012]		! Mem[0000000010081410] = 00000000

p0_label_290:
!	Mem[0000000010081400] = e30000009e7c15ff, %l1 = ffffffffffffffb7, %l0 = 00000000000000c5
	casxa	[%i2]0x80,%l1,%l0	! %l0 = e30000009e7c15ff
!	%l6 = ff000000, %l7 = 000000ff, Mem[0000000030081400] = ffffff8c 00000000
	stda	%l6,[%i2+%g0]0x81	! Mem[0000000030081400] = ff000000 000000ff
!	%l1 = ffffffffffffffb7, Mem[0000000010001408] = c36f284c
	stha	%l1,[%i0+%o4]0x80	! Mem[0000000010001408] = ffb7284c
!	Mem[0000000010001439] = ff302700, %l0 = e30000009e7c15ff
	ldstub	[%i0+0x039],%l0		! %l0 = 00000030000000ff
!	Mem[00000000100c1408] = 00000000, %l0 = 0000000000000030
	ldstuba	[%i3+%o4]0x88,%l0	! %l0 = 00000000000000ff
!	%f16 = d01edd19, %f16 = d01edd19, %f24 = 00000000
	fadds	%f16,%f16,%f24		! %f24 = d09edd19
!	Mem[00000000300c1400] = 00000000, %l7 = 00000000000000ff
	ldstuba	[%i3+%g0]0x89,%l7	! %l7 = 00000000000000ff
!	%f19 = 646d910d, Mem[0000000010081410] = 00000000
	sta	%f19,[%i2+%o5]0x88	! Mem[0000000010081410] = 646d910d
!	%l1 = ffffffffffffffb7, Mem[0000000030101410] = fd2146b2
	stba	%l1,[%i4+%o5]0x89	! Mem[0000000030101410] = fd2146b7
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = 19dd1ed0, %l1 = ffffffffffffffb7
	ldswa	[%i4+%o5]0x80,%l1	! %l1 = 0000000019dd1ed0

p0_label_291:
!	Mem[000000001000140c] = b6ec4d5a, %f24 = d09edd19
	lda	[%i0+0x00c]%asi,%f24	! %f24 = b6ec4d5a
!	Mem[00000000100c1408] = ff000000, %l0 = 0000000000000000
	lduba	[%i3+%o4]0x80,%l0	! %l0 = 00000000000000ff
!	%l4 = 000000000000ffff, immed = fffff230, %y  = 5ffffa69
	udiv	%l4,-0xdd0,%l2		! %l2 = 000000005fffff96
	mov	%l0,%y			! %y = 000000ff
!	Mem[00000000100c1408] = ff000000, %l6 = 00000000ff000000
	ldsha	[%i3+%o4]0x80,%l6	! %l6 = ffffffffffffff00
!	Mem[0000000030041400] = 0d916d64, %f21 = 00000000
	lda	[%i1+%g0]0x89,%f21	! %f21 = 0d916d64
!	Mem[0000000030081408] = 000800ff, %l4 = 000000000000ffff
	ldsha	[%i2+%o4]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030141410] = da54ecb1, %l0 = 00000000000000ff
	lduba	[%i5+%o5]0x81,%l0	! %l0 = 00000000000000da
!	Mem[0000000030141410] = b1ec54da, %l1 = 0000000019dd1ed0
	lduba	[%i5+%o5]0x89,%l1	! %l1 = 00000000000000da
!	Mem[0000000030001408] = 8d0800ff 000000ff, %l6 = ffffff00, %l7 = 00000000
	ldda	[%i0+%o4]0x89,%l6	! %l6 = 00000000000000ff 000000008d0800ff
!	Starting 10 instruction Store Burst
!	Mem[0000000030141410] = b1ec54da, %l0 = 00000000000000da
	ldstuba	[%i5+%o5]0x89,%l0	! %l0 = 000000da000000ff

p0_label_292:
!	%l2 = 000000005fffff96, Mem[0000000010141400] = 000000ff
	stba	%l2,[%i5+%g0]0x88	! Mem[0000000010141400] = 00000096
!	%l1 = 00000000000000da, Mem[00000000218000c0] = ffffd5a0
	stb	%l1,[%o3+0x0c0]		! Mem[00000000218000c0] = daffd5a0
!	Mem[0000000010001430] = a52e7e04, %l1 = 000000da, %l4 = 000000ff
	add	%i0,0x30,%g1
	casa	[%g1]0x80,%l1,%l4	! %l4 = 00000000a52e7e04
!	Mem[0000000030001410] = 000000ff, %l7 = 000000008d0800ff
	swapa	[%i0+%o5]0x89,%l7	! %l7 = 00000000000000ff
!	%l0 = 000000da, %l1 = 000000da, Mem[0000000010141400] = 00000096 00000000
	stda	%l0,[%i5+%g0]0x88	! Mem[0000000010141400] = 000000da 000000da
!	%f15 = 00000000, Mem[0000000030101410] = fd2146b7
	sta	%f15,[%i4+%o5]0x89	! Mem[0000000030101410] = 00000000
!	Mem[00000000211c0000] = d8ffe5a1, %l0 = 00000000000000da
	ldstub	[%o2+%g0],%l0		! %l0 = 000000d8000000ff
!	%l2 = 000000005fffff96, imm = ffffffffffffffdc, %l0 = 00000000000000d8
	andn	%l2,-0x024,%l0		! %l0 = 0000000000000002
!	Mem[0000000010101400] = 000044a3, %l0 = 0000000000000002
	ldstuba	[%i4+%g0]0x80,%l0	! %l0 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Code Fragment 3
p0_fragment_33:
!	%l0 = 0000000000000000
	setx	0x8e22d7b811c0e04f,%g7,%l0 ! %l0 = 8e22d7b811c0e04f
!	%l1 = 00000000000000da
	setx	0xa52fb797c801d674,%g7,%l1 ! %l1 = a52fb797c801d674
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 8e22d7b811c0e04f
	setx	0xc5f1fccfbd16ca78,%g7,%l0 ! %l0 = c5f1fccfbd16ca78
!	%l1 = a52fb797c801d674
	setx	0x76de070053d35647,%g7,%l1 ! %l1 = 76de070053d35647

p0_label_293:
!	Mem[0000000010001408] = ffb7284c b6ec4d5a, %l2 = 5fffff96, %l3 = 000000ff
	ldda	[%i0+%o4]0x80,%l2	! %l2 = 00000000ffb7284c 00000000b6ec4d5a
!	Mem[0000000030001408] = ff000000ff00088d, %l7 = 00000000000000ff
	ldxa	[%i0+%o4]0x81,%l7	! %l7 = ff000000ff00088d
!	Mem[0000000030041410] = ff0000e3000000ff, %l5 = 00000000000000ff
	ldxa	[%i1+%o5]0x89,%l5	! %l5 = ff0000e3000000ff
!	Mem[0000000030081408] = 000800ff, %l5 = ff0000e3000000ff
	ldswa	[%i2+%o4]0x89,%l5	! %l5 = 00000000000800ff
!	Mem[0000000030001410] = ff00088d, %l0 = c5f1fccfbd16ca78
	lduba	[%i0+%o5]0x81,%l0	! %l0 = 00000000000000ff
!	Mem[00000000100c1418] = 00000000, %f8  = 00736934
	ld	[%i3+0x018],%f8 	! %f8 = 00000000
!	Mem[0000000030041408] = ff7e00a5 00000000, %l2 = ffb7284c, %l3 = b6ec4d5a
	ldda	[%i1+%o4]0x81,%l2	! %l2 = 00000000ff7e00a5 0000000000000000
!	Mem[00000000300c1400] = 297d4a65000000ff, %l2 = 00000000ff7e00a5
	ldxa	[%i3+%g0]0x89,%l2	! %l2 = 297d4a65000000ff
!	Mem[0000000010041408] = 5a4decb600aeffff, %f6  = 00000000 00000060
	ldda	[%i1+0x008]%asi,%f6 	! %f6  = 5a4decb6 00aeffff
!	Starting 10 instruction Store Burst
!	%l2 = 000000ff, %l3 = 00000000, Mem[0000000030001408] = 000000ff 8d0800ff
	stda	%l2,[%i0+%o4]0x89	! Mem[0000000030001408] = 000000ff 00000000

p0_label_294:
!	Mem[0000000010101407] = 000000ff, %l4 = 00000000a52e7e04
	ldstuba	[%i4+0x007]%asi,%l4	! %l4 = 000000ff000000ff
!	Mem[0000000010001408] = 4c28b7ff, %l7 = ff000000ff00088d
	swapa	[%i0+%o4]0x88,%l7	! %l7 = 000000004c28b7ff
!	%l2 = 297d4a65000000ff, Mem[00000000201c0000] = ff8c01ce
	sth	%l2,[%o0+%g0]		! Mem[00000000201c0000] = 00ff01ce
!	Mem[0000000010181400] = ff0000e3, %l4 = 00000000000000ff
	swapa	[%i6+%g0]0x80,%l4	! %l4 = 00000000ff0000e3
!	%l1 = 76de070053d35647, Mem[0000000030041400] = 646d910d
	stha	%l1,[%i1+%g0]0x81	! Mem[0000000030041400] = 5647910d
!	%f6  = 5a4decb6, %f0  = 297d4a65, %f22 = 00000000 8bf27f53
	fsmuld	%f6 ,%f0 ,%f22		! %f22 = 408977d8 f11ff9c0
!	%l4 = ff0000e3, %l5 = 000800ff, Mem[0000000010141410] = 000000ff 00000000
	stda	%l4,[%i5+%o5]0x88	! Mem[0000000010141410] = ff0000e3 000800ff
!	Mem[0000000030081410] = 000000ff, %l5 = 00000000000800ff
	swapa	[%i2+%o5]0x89,%l5	! %l5 = 00000000000000ff
!	%f21 = 0d916d64, Mem[0000000030181408] = ff000000
	sta	%f21,[%i6+%o4]0x81	! Mem[0000000030181408] = 0d916d64
!	Starting 10 instruction Load Burst
!	Mem[0000000030001400] = 3c90d74c, %l2 = 297d4a65000000ff
	lduha	[%i0+%g0]0x81,%l2	! %l2 = 0000000000003c90

p0_label_295:
!	Mem[0000000010141410] = ff0000e3, %l7 = 000000004c28b7ff
	lduba	[%i5+%o5]0x88,%l7	! %l7 = 00000000000000e3
!	Mem[0000000030141410] = ff54ecb1, %l2 = 0000000000003c90
	ldsha	[%i5+%o5]0x81,%l2	! %l2 = ffffffffffffff54
!	Mem[0000000010001408] = 8d0800ff, %l1 = 76de070053d35647
	lduba	[%i0+%o4]0x80,%l1	! %l1 = 000000000000008d
!	Mem[000000001008142c] = ffffff8c, %l0 = 00000000000000ff
	lduw	[%i2+0x02c],%l0		! %l0 = 00000000ffffff8c
!	Mem[0000000010101420] = 000000ff000000ff, %f16 = d01edd19 ff000000
	ldda	[%i4+0x020]%asi,%f16	! %f16 = 000000ff 000000ff
!	Mem[0000000010001410] = 00000000000000ff, %f18 = 00000000 646d910d
	ldda	[%i0+%o5]0x88,%f18	! %f18 = 00000000 000000ff
!	Mem[0000000010001408] = 8d0800ff, %l2 = ffffffffffffff54
	lduha	[%i0+%o4]0x80,%l2	! %l2 = 0000000000008d08
!	Mem[00000000201c0000] = 00ff01ce, %l1 = 000000000000008d
	ldsh	[%o0+%g0],%l1		! %l1 = 00000000000000ff
!	Mem[00000000100c1408] = ff000000, %l7 = 00000000000000e3
	lduwa	[%i3+%o4]0x80,%l7	! %l7 = 00000000ff000000
!	Starting 10 instruction Store Burst
!	%l7 = 00000000ff000000, Mem[0000000030141410] = ff54ecb1340000ff
	stxa	%l7,[%i5+%o5]0x81	! Mem[0000000030141410] = 00000000ff000000

p0_label_296:
!	%f12 = 00000000 000000ff, %l5 = 00000000000000ff
!	Mem[0000000010001430] = a52e7e04f66d47e8
	add	%i0,0x030,%g1
	stda	%f12,[%g1+%l5]ASI_PST8_PL ! Mem[0000000010001430] = ff00000000000000
!	Mem[0000000010101400] = ff0044a3, %l4 = 00000000ff0000e3
	ldstuba	[%i4+%g0]0x80,%l4	! %l4 = 000000ff000000ff
!	%l4 = 00000000000000ff, Mem[0000000030141400] = 00000000
	stha	%l4,[%i5+%g0]0x81	! Mem[0000000030141400] = 00ff0000
!	%l0 = 00000000ffffff8c, Mem[0000000030181408] = 00000000646d910d
	stxa	%l0,[%i6+%o4]0x89	! Mem[0000000030181408] = 00000000ffffff8c
!	%l2 = 00008d08, %l3 = 00000000, Mem[00000000100c1408] = 000000ff ff000000
	stda	%l2,[%i3+%o4]0x88	! Mem[00000000100c1408] = 00008d08 00000000
!	%f23 = f11ff9c0, Mem[0000000030181400] = 00000000
	sta	%f23,[%i6+%g0]0x81	! Mem[0000000030181400] = f11ff9c0
!	%f30 = ff302700 1e2522e8, %l2 = 0000000000008d08
!	Mem[00000000300c1428] = a52e7e04e2a2ea29
	add	%i3,0x028,%g1
	stda	%f30,[%g1+%l2]ASI_PST32_SL ! Mem[00000000300c1428] = a52e7e04e2a2ea29
!	Mem[0000000010041410] = 000000ff, %l4 = 00000000000000ff
	ldstuba	[%i1+%o5]0x88,%l4	! %l4 = 000000ff000000ff
!	%l6 = 00000000000000ff, Mem[0000000030041408] = ff7e00a500000000
	stxa	%l6,[%i1+%o4]0x81	! Mem[0000000030041408] = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = 000000ff, %l1 = 00000000000000ff
	lduha	[%i2+%g0]0x89,%l1	! %l1 = 00000000000000ff

p0_label_297:
!	Mem[00000000100c1408] = 088d0000, %l6 = 00000000000000ff
	ldsba	[%i3+%o4]0x80,%l6	! %l6 = 0000000000000008
!	Mem[0000000030041410] = 000000ff, %l0 = 00000000ffffff8c
	ldsba	[%i1+%o5]0x89,%l0	! %l0 = ffffffffffffffff
!	%f26 = d01edd19, %f7  = 00aeffff, %f14 = 00000000
	fsubs	%f26,%f7 ,%f14		! %f14 = d01edd19
!	%l1 = 00000000000000ff, %l2 = 0000000000008d08, %l3 = 0000000000000000
	add	%l1,%l2,%l3		! %l3 = 0000000000008e07
!	Mem[0000000030101408] = 000000ff, %l7 = 00000000ff000000
	lduwa	[%i4+%o4]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010041410] = 000000ff, %l6 = 0000000000000008
	ldsba	[%i1+%o5]0x88,%l6	! %l6 = ffffffffffffffff
!	%l4 = 00000000000000ff, %l3 = 0000000000008e07, %l6 = ffffffffffffffff
	xor	%l4,%l3,%l6		! %l6 = 0000000000008ef8
!	Mem[00000000300c1408] = d2038d08, %l4 = 00000000000000ff
	lduba	[%i3+%o4]0x89,%l4	! %l4 = 0000000000000008
!	Mem[00000000100c1410] = 5a4decb6, %f22 = 408977d8
	lda	[%i3+%o5]0x88,%f22	! %f22 = 5a4decb6
!	Starting 10 instruction Store Burst
!	%l0 = ffffffffffffffff, Mem[0000000030141410] = 00000000
	stba	%l0,[%i5+%o5]0x81	! Mem[0000000030141410] = ff000000

p0_label_298:
!	%l1 = 00000000000000ff, Mem[0000000030101410] = 00000000
	stwa	%l1,[%i4+%o5]0x81	! Mem[0000000030101410] = 000000ff
!	Mem[0000000020800000] = ffffe062, %l1 = 00000000000000ff
	ldstub	[%o1+%g0],%l1		! %l1 = 000000ff000000ff
!	%l5 = 00000000000000ff, Mem[0000000010041408] = 5a4decb600aeffff, %asi = 80
	stxa	%l5,[%i1+0x008]%asi	! Mem[0000000010041408] = 00000000000000ff
!	%f8  = 00000000, Mem[00000000300c1410] = ff000000
	sta	%f8 ,[%i3+%o5]0x81	! Mem[00000000300c1410] = 00000000
!	%l5 = 00000000000000ff, Mem[0000000020800000] = ffffe062, %asi = 80
	stha	%l5,[%o1+0x000]%asi	! Mem[0000000020800000] = 00ffe062
!	%f2  = 646d910d, Mem[0000000030101400] = c5000000
	sta	%f2 ,[%i4+%g0]0x81	! Mem[0000000030101400] = 646d910d
!	Mem[0000000030081410] = 000800ff, %l4 = 0000000000000008
	swapa	[%i2+%o5]0x89,%l4	! %l4 = 00000000000800ff
!	%l3 = 0000000000008e07, immed = 00000bef, %y  = 000000ff
	smul	%l3,0xbef,%l3		! %l3 = 00000000069ee589, %y = 00000000
!	Mem[00000000300c1408] = 088d03d2, %l6 = 0000000000008ef8
	swapa	[%i3+%o4]0x81,%l6	! %l6 = 00000000088d03d2
!	Starting 10 instruction Load Burst
!	%l6 = 00000000088d03d2, imm = 0000000000000fe5, %l1 = 00000000000000ff
	addc	%l6,0xfe5,%l1		! %l1 = 00000000088d13b7

p0_label_299:
!	Mem[0000000030141400] = 0000ff00, %l4 = 00000000000800ff
	ldswa	[%i5+%g0]0x89,%l4	! %l4 = 000000000000ff00
!	Mem[0000000030081410] = 00000008, %l2 = 0000000000008d08
	lduba	[%i2+%o5]0x89,%l2	! %l2 = 0000000000000008
!	Mem[0000000010041438] = 0000000000000000, %f18 = 00000000 000000ff
	ldd	[%i1+0x038],%f18	! %f18 = 00000000 00000000
!	Mem[0000000010001410] = ff00000000000000, %f24 = b6ec4d5a 000000ff
	ldda	[%i0+%o5]0x80,%f24	! %f24 = ff000000 00000000
!	Mem[0000000030181410] = 00000000, %l4 = 000000000000ff00
	ldswa	[%i6+%o5]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000010081410] = 0d916d64d85826d9, %f22 = 5a4decb6 f11ff9c0
	ldda	[%i2+%o5]0x80,%f22	! %f22 = 0d916d64 d85826d9
!	%f1  = 00000000, %f15 = 00000000, %f12 = 00000000
	fsubs	%f1 ,%f15,%f12		! %f12 = 00000000
!	Mem[0000000020800000] = 00ffe062, %l5 = 00000000000000ff
	ldsh	[%o1+%g0],%l5		! %l5 = 00000000000000ff
!	Mem[0000000010141400] = da000000 da000000, %l0 = ffffffff, %l1 = 088d13b7
	ldda	[%i5+%g0]0x80,%l0	! %l0 = 00000000da000000 00000000da000000
!	Starting 10 instruction Store Burst
!	%f18 = 00000000, Mem[0000000010101410] = 19dd1ed0
	sta	%f18,[%i4+%o5]0x80	! Mem[0000000010101410] = 00000000

p0_label_300:
!	Mem[0000000010081410] = 0d916d64, %l0 = 00000000da000000
	ldstuba	[%i2+%o5]0x80,%l0	! %l0 = 0000000d000000ff
!	Mem[0000000010101425] = 000000ff, %l7 = 00000000000000ff
	ldstuba	[%i4+0x025]%asi,%l7	! %l7 = 00000000000000ff
!	%l3 = 00000000069ee589, Mem[000000001008140c] = c38122ff, %asi = 80
	stha	%l3,[%i2+0x00c]%asi	! Mem[000000001008140c] = e58922ff
!	Mem[0000000010141408] = 00000000000000ff, %l5 = 00000000000000ff, %l2 = 0000000000000008
	add	%i5,0x08,%g1
	casxa	[%g1]0x80,%l5,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030081400] = 000000ff, %l5 = 00000000000000ff
	swapa	[%i2+%g0]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[000000001018140c] = 000000ff, %l3 = 00000000069ee589
	swap	[%i6+0x00c],%l3		! %l3 = 00000000000000ff
!	%l3 = 00000000000000ff, Mem[00000000300c1408] = 00008ef8
	stba	%l3,[%i3+%o4]0x81	! Mem[00000000300c1408] = ff008ef8
!	%f2  = 646d910d, Mem[0000000010181400] = 000000ff
	sta	%f2 ,[%i6+%g0]0x80	! Mem[0000000010181400] = 646d910d
!	Mem[0000000030101400] = 0d916d64, %l7 = 0000000000000000
	swapa	[%i4+%g0]0x89,%l7	! %l7 = 000000000d916d64
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = 5647910d, %l0 = 000000000000000d
	ldsha	[%i1+%g0]0x81,%l0	! %l0 = 0000000000005647

	ba,a	p0_not_taken_0_end
p0_not_taken_0:
!	The following code should not be executed
	smul	%l6,%l3,%l1
	nop
	stda	%l6,[%i3+0x000]%asi
	lduba	[%i2+0x03e]%asi,%l4
	nop
	fsubs	%f5,%f25,%f8
	udivx	%l1,%l2,%l6
	stda	%l4,[%i3+0x010]%asi
	ba,a	p0_branch_failed
p0_not_taken_0_end:


!	End of Random Code for Thread 0


!	Check Registers

p0_check_registers:
	set	p0_expected_registers,%g1
	ldx	[%g1+0x000],%g2
	cmp	%l0,%g2			! %l0 should be 0000000000005647
	bne,a,pn %xcc,p0_reg_l0_fail
	mov	%l0,%g3
	ldx	[%g1+0x008],%g2
	cmp	%l1,%g2			! %l1 should be 00000000da000000
	bne,a,pn %xcc,p0_reg_l1_fail
	mov	%l1,%g3
	ldx	[%g1+0x010],%g2
	cmp	%l2,%g2			! %l2 should be 00000000000000ff
	bne,a,pn %xcc,p0_reg_l2_fail
	mov	%l2,%g3
	ldx	[%g1+0x018],%g2
	cmp	%l3,%g2			! %l3 should be 00000000000000ff
	bne,a,pn %xcc,p0_reg_l3_fail
	mov	%l3,%g3
	ldx	[%g1+0x020],%g2
	cmp	%l4,%g2			! %l4 should be 0000000000000000
	bne,a,pn %xcc,p0_reg_l4_fail
	mov	%l4,%g3
	ldx	[%g1+0x028],%g2
	cmp	%l5,%g2			! %l5 should be 00000000000000ff
	bne,a,pn %xcc,p0_reg_l5_fail
	mov	%l5,%g3
	ldx	[%g1+0x030],%g2
	cmp	%l6,%g2			! %l6 should be 00000000088d03d2
	bne,a,pn %xcc,p0_reg_l6_fail
	mov	%l6,%g3
	ldx	[%g1+0x038],%g2
	cmp	%l7,%g2			! %l7 should be 000000000d916d64
	bne,a,pn %xcc,p0_reg_l7_fail
	mov	%l7,%g3

!	Check Floating Point Registers

p0_check_fp_registers:
	set	p0_expected_fp_regs,%g3
	std	%f0,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x00],%l0
	cmp	%l0,%l1			! %f0  should be 297d4a65 00000000
	bne	%xcc,p0_f0_fail
	std	%f2,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x08],%l0
	cmp	%l0,%l1			! %f2  should be 646d910d 60000000
	bne	%xcc,p0_f2_fail
	std	%f4,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x10],%l0
	cmp	%l0,%l1			! %f4  should be ffffffff 000000ff
	bne	%xcc,p0_f4_fail
	std	%f6,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x18],%l0
	cmp	%l0,%l1			! %f6  should be 5a4decb6 00aeffff
	bne	%xcc,p0_f6_fail
	std	%f8,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x20],%l0
	cmp	%l0,%l1			! %f8  should be 00000000 00000000
	bne	%xcc,p0_f8_fail
	std	%f10,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x28],%l0
	cmp	%l0,%l1			! %f10 should be 29eaa2e2 047e2ea5
	bne	%xcc,p0_f10_fail
	std	%f12,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x30],%l0
	cmp	%l0,%l1			! %f12 should be 00000000 000000ff
	bne	%xcc,p0_f12_fail
	std	%f14,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x38],%l0
	cmp	%l0,%l1			! %f14 should be d01edd19 00000000
	bne	%xcc,p0_f14_fail
	std	%f16,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x40],%l0
	cmp	%l0,%l1			! %f16 should be 000000ff 000000ff
	bne	%xcc,p0_f16_fail
	std	%f18,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x48],%l0
	cmp	%l0,%l1			! %f18 should be 00000000 00000000
	bne	%xcc,p0_f18_fail
	std	%f20,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x50],%l0
	cmp	%l0,%l1			! %f20 should be 00000000 0d916d64
	bne	%xcc,p0_f20_fail
	std	%f22,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x58],%l0
	cmp	%l0,%l1			! %f22 should be 0d916d64 d85826d9
	bne	%xcc,p0_f22_fail
	std	%f24,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x60],%l0
	cmp	%l0,%l1			! %f24 should be ff000000 00000000
	bne	%xcc,p0_f24_fail
	std	%f26,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x68],%l0
	cmp	%l0,%l1			! %f26 should be d01edd19 9e7c15ff
	bne	%xcc,p0_f26_fail
	std	%f28,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x70],%l0
	cmp	%l0,%l1			! %f28 should be a52e7e04 0d916d64
	bne	%xcc,p0_f28_fail
	std	%f30,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x78],%l0
	cmp	%l0,%l1			! %f30 should be ff302700 1e2522e8
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
	orn	%l1,%l4,%l2
	smul	%l0,-0x970,%l5
	fsubs	%f14,%f13,%f11
	umul	%l3,%l5,%l0
	or	%l4,%l2,%l0
	sub	%l0,-0xe99,%l3
	fsqrts	%f8 ,%f0 
	done

p0_trap1o:
	orn	%l1,%l4,%l2
	smul	%l0,-0x970,%l5
	fsubs	%f14,%f13,%f11
	umul	%l3,%l5,%l0
	or	%l4,%l2,%l0
	sub	%l0,-0xe99,%l3
	fsqrts	%f8 ,%f0 
	done


p0_trap2e:
	sub	%l4,%l5,%l4
	stxa	%l2,[%i2+%g0]ASI_AS_IF_USER_PRIMARY	! Mem[0000000010081400]
	sub	%l5,-0x21f,%l5
	fmuls	%f13,%f4 ,%f6 
	smul	%l0,%l6,%l0
	stba	%l0,[%i2+%g0]ASI_AS_IF_USER_PRIMARY	! Mem[0000000010081400]
	done

p0_trap2o:
	sub	%l4,%l5,%l4
	stxa	%l2,[%o2+%g0]ASI_AS_IF_USER_PRIMARY	! Mem[0000000010081400]
	sub	%l5,-0x21f,%l5
	fmuls	%f13,%f4 ,%f6 
	smul	%l0,%l6,%l0
	stba	%l0,[%o2+%g0]ASI_AS_IF_USER_PRIMARY	! Mem[0000000010081400]
	done


p0_trap3e:
	sub	%l3,%l5,%l3
	andn	%l2,%l4,%l1
	sub	%l4,%l1,%l1
	and	%l2,0x8cb,%l0
	or	%l0,%l5,%l0
	done

p0_trap3o:
	sub	%l3,%l5,%l3
	andn	%l2,%l4,%l1
	sub	%l4,%l1,%l1
	and	%l2,0x8cb,%l0
	or	%l0,%l5,%l0
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
	ldx	[%g1+0x000],%l0		! %l0 = 340d083872a08787
	ldx	[%g1+0x008],%l1		! %l1 = 31f18f7190a945ec
	ldx	[%g1+0x010],%l2		! %l2 = 607329a676cb5d0b
	ldx	[%g1+0x018],%l3		! %l3 = e9ee1ec5ef3034b5
	ldx	[%g1+0x020],%l4		! %l4 = 9a2eed202944732c
	ldx	[%g1+0x028],%l5		! %l5 = 5761a96c13ff938e
	ldx	[%g1+0x030],%l6		! %l6 = b4a9fc99d7b027a8
	ldx	[%g1+0x038],%l7		! %l7 = e9385889f55f173c

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
	orn	%l1,%l4,%l2
	smul	%l0,-0x970,%l5
	fsubs	%f14,%f13,%f11
	umul	%l5,%l7,%l7
	jmpl	%o7,%g0
	mulx	%l7,-0xa89,%l5
p0_near_0_he:
	fdivs	%f19,%f17,%f24
	udivx	%l3,%l5,%l3
	xnor	%l4,0x4e8,%l3
	andn	%l7,%l0,%l1
	jmpl	%o7,%g0
	lduh	[%i3+0x00c],%l6		! Mem[00000000100c140c]
near0_b2b_h:
	mulx	%l1,%l0,%l6
	fdivs	%f25,%f18,%f28
	fdivs	%f24,%f31,%f27
	sdivx	%l3,%l6,%l0
	fsubs	%f30,%f22,%f17
	jmpl	%o7,%g0
	smul	%l7,0x391,%l5
near0_b2b_l:
	xnor	%l3,%l1,%l7
	fsqrts	%f10,%f6 
	or	%l4,%l7,%l1
	andn	%l3,%l3,%l2
	andn	%l3,%l4,%l2
	jmpl	%o7,%g0
	fmuls	%f4 ,%f7 ,%f14
user_near0_end:
	.seg	"text"
	.align	0x2000
user_near1_start:
p0_near_1_le:
	fsubs	%f8 ,%f14,%f8 
	fdivs	%f12,%f4 ,%f6 
	xnor	%l7,-0x684,%l1
	fadds	%f14,%f11,%f10
	jmpl	%o7,%g0
	andn	%l0,%l3,%l0
p0_near_1_he:
	fdivs	%f29,%f27,%f21
	mulx	%l5,%l6,%l3
	andn	%l4,%l6,%l7
	smul	%l7,0x418,%l1
	jmpl	%o7,%g0
	mulx	%l2,0x546,%l6
near1_b2b_h:
	fsqrts	%f16,%f22
	xnor	%l6,%l5,%l0
	addc	%l3,%l2,%l5
	mulx	%l3,0xfca,%l4
	jmpl	%o7,%g0
	fcmps	%fcc0,%f18,%f29
near1_b2b_l:
	xor	%l7,-0xc8f,%l6
	add	%l2,%l4,%l4
	fmuls	%f15,%f14,%f9 
	sub	%l3,0x911,%l5
	jmpl	%o7,%g0
	fcmps	%fcc3,%f6 ,%f3 
user_near1_end:
	.seg	"text"
	.align	0x2000
user_near2_start:
p0_near_2_le:
	udivx	%l3,-0xd8f,%l0
	fmuls	%f2 ,%f10,%f7 
	jmpl	%o7,%g0
	fmuls	%f11,%f8 ,%f11
p0_near_2_he:
	add	%l7,%l0,%l2
	smul	%l0,%l6,%l3
	umul	%l6,%l2,%l7
	mulx	%l5,-0xf39,%l3
	udivx	%l5,-0x863,%l7
	jmpl	%o7,%g0
	addc	%l4,-0x360,%l7
near2_b2b_h:
	mulx	%l4,%l2,%l4
	sdivx	%l6,%l6,%l0
	fmuls	%f24,%f25,%f28
	andn	%l5,%l6,%l2
	fsubs	%f18,%f28,%f28
	add	%l3,%l0,%l2
	jmpl	%o7,%g0
	fcmps	%fcc3,%f19,%f18
near2_b2b_l:
	fmuls	%f0 ,%f4 ,%f9 
	umul	%l5,-0xb89,%l6
	smul	%l0,-0x2e1,%l4
	sdivx	%l4,0x099,%l5
	fsqrts	%f4 ,%f4 
	andn	%l3,-0x44b,%l6
	jmpl	%o7,%g0
	xnor	%l4,-0xb59,%l3
user_near2_end:
	.seg	"text"
	.align	0x2000
user_near3_start:
p0_near_3_le:
	fadds	%f15,%f12,%f14
	udivx	%l6,%l0,%l0
	st	%f8 ,[%i0+0x018]	! Mem[0000000010001418]
	fsubs	%f9 ,%f5 ,%f6 
	fdivs	%f2 ,%f6 ,%f7 
	addc	%l1,0xb05,%l4
	jmpl	%o7,%g0
	orn	%l2,0xa6d,%l0
p0_near_3_he:
	fcmps	%fcc2,%f17,%f22
	and	%l0,-0x69b,%l4
	orn	%l3,-0x861,%l6
	sub	%l2,%l1,%l0
	jmpl	%o7,%g0
	xnor	%l2,%l2,%l2
near3_b2b_h:
	add	%l7,%l0,%l4
	xnor	%l3,0xe0e,%l1
	andn	%l4,%l3,%l3
	fadds	%f24,%f24,%f16
	fsqrts	%f22,%f21
	jmpl	%o7,%g0
	andn	%l2,%l7,%l3
near3_b2b_l:
	fdivs	%f9 ,%f1 ,%f0 
	fdivs	%f12,%f8 ,%f6 
	fmuls	%f4 ,%f15,%f3 
	subc	%l3,%l5,%l4
	udivx	%l1,%l2,%l2
	jmpl	%o7,%g0
	udivx	%l1,0x93f,%l3
user_near3_end:
	.seg	"text"
	.text
	.align	0x2000
user_far0_start:
p0_far_0_le:
	subc	%l4,%l0,%l5
	xnor	%l6,%l6,%l1
	jmpl	%o7,%g0
	fdivs	%f10,%f13,%f8 
p0_far_0_lem:
	subc	%l4,%l0,%l5
	xnor	%l6,%l6,%l1
	jmpl	%o7,%g0
	fdivs	%f10,%f13,%f8 
p0_far_0_he:
	lduw	[%i0+0x038],%l4		! Mem[0000000010001438]
	mulx	%l6,%l0,%l6
	xnor	%l2,%l0,%l1
	jmpl	%o7,%g0
	sdivx	%l7,0xeae,%l0
p0_far_0_hem:
	membar	#Sync
	lduw	[%i0+0x038],%l4		! Mem[0000000010001438]
	mulx	%l6,%l0,%l6
	xnor	%l2,%l0,%l1
	jmpl	%o7,%g0
	sdivx	%l7,0xeae,%l0
p0_loop_branch_0:
	jmpl	%o7+12,%g0
	add	%l0,1,%l0
far0_b2b_h:
	jmpl	%o7,%g0
	smul	%l4,%l6,%l0
	jmpl	%o7,%g0
	nop
far0_b2b_l:
	jmpl	%o7,%g0
	and	%l1,0xc04,%l4
	jmpl	%o7,%g0
	nop
user_far0_end:
	.seg	"text"
	.text
	.align	0x2000
user_far1_start:
p0_far_1_le:
	mulx	%l7,-0xda9,%l2
	xnor	%l2,%l6,%l6
	jmpl	%o7,%g0
	and	%l6,-0x426,%l3
p0_far_1_lem:
	mulx	%l7,-0xda9,%l2
	xnor	%l2,%l6,%l6
	jmpl	%o7,%g0
	and	%l6,-0x426,%l3
p0_far_1_he:
	mulx	%l2,-0xc96,%l2
	sub	%l3,%l6,%l3
	jmpl	%o7,%g0
	mulx	%l6,-0x66c,%l4
p0_far_1_hem:
	mulx	%l2,-0xc96,%l2
	sub	%l3,%l6,%l3
	jmpl	%o7,%g0
	mulx	%l6,-0x66c,%l4
p0_loop_branch_1:
	jmpl	%o7+12,%g0
	add	%l0,2,%l0
far1_b2b_h:
	orn	%l6,%l3,%l5
	jmpl	%o7,%g0
	xor	%l6,0x312,%l1
far1_b2b_l:
	xnor	%l1,%l1,%l1
	jmpl	%o7,%g0
	fcmps	%fcc2,%f3 ,%f6 
user_far1_end:
	.seg	"text"
	.text
	.align	0x2000
user_far2_start:
p0_far_2_le:
	fcmps	%fcc3,%f12,%f15
	umul	%l0,0x763,%l7
	fcmps	%fcc2,%f3 ,%f4 
	fsubs	%f8 ,%f5 ,%f0 
	xor	%l6,%l4,%l3
	or	%l3,%l3,%l5
	fmuls	%f6 ,%f14,%f12
	jmpl	%o7,%g0
	or	%l0,%l7,%l2
p0_far_2_lem:
	fcmps	%fcc3,%f12,%f15
	umul	%l0,0x763,%l7
	fcmps	%fcc2,%f3 ,%f4 
	fsubs	%f8 ,%f5 ,%f0 
	xor	%l6,%l4,%l3
	or	%l3,%l3,%l5
	fmuls	%f6 ,%f14,%f12
	jmpl	%o7,%g0
	or	%l0,%l7,%l2
p0_far_2_he:
	jmpl	%o7,%g0
	fsqrts	%f24,%f31
	jmpl	%o7,%g0
	nop
p0_far_2_hem:
	jmpl	%o7,%g0
	fsqrts	%f24,%f31
	jmpl	%o7,%g0
	nop
p0_loop_branch_2:
	jmpl	%o7+12,%g0
	add	%l0,3,%l0
far2_b2b_h:
	fsqrts	%f20,%f19
	fsubs	%f31,%f31,%f23
	fsqrts	%f21,%f28
	jmpl	%o7,%g0
	orn	%l7,%l7,%l0
far2_b2b_l:
	umul	%l7,%l6,%l3
	fmuls	%f14,%f11,%f3 
	mulx	%l2,-0x3ca,%l6
	jmpl	%o7,%g0
	addc	%l2,%l0,%l4
user_far2_end:
	.seg	"text"
	.text
	.align	0x2000
user_far3_start:
p0_far_3_le:
	andn	%l4,%l7,%l5
	ldub	[%i3+0x00f],%l0		! Mem[00000000100c140f]
	jmpl	%o7,%g0
	subc	%l0,-0xb8b,%l5
p0_far_3_lem:
	andn	%l4,%l7,%l5
	membar	#Sync
	ldub	[%i3+0x00f],%l0		! Mem[00000000100c140f]
	jmpl	%o7,%g0
	subc	%l0,-0xb8b,%l5
p0_far_3_he:
	andn	%l2,0xfd6,%l3
	jmpl	%o7,%g0
	mulx	%l0,%l5,%l2
p0_far_3_hem:
	andn	%l2,0xfd6,%l3
	jmpl	%o7,%g0
	mulx	%l0,%l5,%l2
p0_loop_branch_3:
	jmpl	%o7+12,%g0
	add	%l0,4,%l0
far3_b2b_h:
	fsqrts	%f27,%f21
	xor	%l0,%l4,%l3
	orn	%l4,%l1,%l7
	fdivs	%f27,%f20,%f25
	xor	%l3,0xc42,%l2
	andn	%l0,%l4,%l5
	xor	%l1,%l1,%l1
	jmpl	%o7,%g0
	orn	%l2,%l2,%l3
far3_b2b_l:
	add	%l4,%l5,%l7
	andn	%l0,%l6,%l3
	fsqrts	%f6 ,%f1 
	sub	%l7,%l3,%l1
	orn	%l7,0xb59,%l5
	fsqrts	%f5 ,%f13
	mulx	%l7,%l5,%l0
	jmpl	%o7,%g0
	xor	%l5,%l5,%l7
user_far3_end:
	.seg	"text"
	.align	0x2000
user_jump0_start:
	INIT_MEM(0, 0x0010, 1, +, 0, +, 0)
p0_jmpl_0_le:
	smul	%l1,%l4,%l2
	fsubs	%f11,%f3 ,%f8 
	fdivs	%f15,%f12,%f6 
	sub	%l5,0x5f8,%l3
	jmpl	%g6+8,%g0
	mulx	%l3,-0x71b,%l0
p0_call_0_le:
	fmuls	%f0 ,%f10,%f8 
	fdivs	%f3 ,%f7 ,%f1 
	fadds	%f0 ,%f5 ,%f14
	xnor	%l4,0x82c,%l5
	ldsh	[%i5+0x012],%l4		! Mem[0000000010141412]
	smul	%l4,%l1,%l1
	stb	%l0,[%i0+0x009]		! Mem[0000000010001409]
	retl
	umul	%l5,-0x652,%l5
p0_jmpl_0_lo:
	smul	%l1,%l4,%l2
	fsubs	%f11,%f3 ,%f8 
	fdivs	%f15,%f12,%f6 
	sub	%l5,0x5f8,%l3
	jmpl	%g6+8,%g0
	mulx	%l3,-0x71b,%l0
p0_call_0_lo:
	fmuls	%f0 ,%f10,%f8 
	fdivs	%f3 ,%f7 ,%f1 
	fadds	%f0 ,%f5 ,%f14
	xnor	%l4,0x82c,%l5
	ldsh	[%o5+0x012],%l4		! Mem[0000000010141412]
	smul	%l4,%l1,%l1
	stb	%l0,[%o0+0x009]		! Mem[0000000010001409]
	retl
	umul	%l5,-0x652,%l5
p0_jmpl_0_he:
	addc	%l2,0xf52,%l4
	fsqrts	%f27,%f23
	xor	%l3,0x2f7,%l4
	sdivx	%l0,0xa2f,%l5
	udivx	%l4,0x646,%l2
	xnor	%l0,%l5,%l6
	st	%f31,[%i2+0x018]	! Mem[0000000010081418]
	jmpl	%g6+8,%g0
	fmuls	%f28,%f31,%f31
p0_call_0_he:
	fadds	%f30,%f27,%f28
	fdivs	%f31,%f20,%f26
	or	%l3,-0xa8c,%l0
	orn	%l5,-0x7db,%l6
	retl
	fdivs	%f29,%f26,%f17
p0_jmpl_0_ho:
	addc	%l2,0xf52,%l4
	fsqrts	%f27,%f23
	xor	%l3,0x2f7,%l4
	sdivx	%l0,0xa2f,%l5
	udivx	%l4,0x646,%l2
	xnor	%l0,%l5,%l6
	st	%f31,[%o2+0x018]	! Mem[0000000010081418]
	jmpl	%g6+8,%g0
	fmuls	%f28,%f31,%f31
p0_call_0_ho:
	fadds	%f30,%f27,%f28
	fdivs	%f31,%f20,%f26
	or	%l3,-0xa8c,%l0
	orn	%l5,-0x7db,%l6
	retl
	fdivs	%f29,%f26,%f17
user_jump0_end:
	.seg	"text"
	.align	0x2000
user_jump1_start:
	INIT_MEM(0, 0x0020, 1, +, 0, +, 0)
p0_jmpl_1_le:
	jmpl	%g6+8,%g0
	orn	%l0,%l3,%l7
p0_call_1_le:
	udivx	%l3,-0xa8d,%l1
	or	%l3,0x6f6,%l1
	subc	%l0,-0xe59,%l7
	fdivs	%f2 ,%f5 ,%f15
	xor	%l6,%l3,%l1
	subc	%l2,0x143,%l0
	retl
	fadds	%f13,%f0 ,%f13
p0_jmpl_1_lo:
	jmpl	%g6+8,%g0
	orn	%l0,%l3,%l7
p0_call_1_lo:
	udivx	%l3,-0xa8d,%l1
	or	%l3,0x6f6,%l1
	subc	%l0,-0xe59,%l7
	fdivs	%f2 ,%f5 ,%f15
	xor	%l6,%l3,%l1
	subc	%l2,0x143,%l0
	retl
	fadds	%f13,%f0 ,%f13
p0_jmpl_1_he:
	udivx	%l0,0x89f,%l3
	and	%l7,%l5,%l3
	fadds	%f22,%f27,%f25
	jmpl	%g6+8,%g0
	xnor	%l1,%l5,%l7
p0_call_1_he:
	sdivx	%l5,%l6,%l3
	xnor	%l2,%l4,%l6
	or	%l7,-0xa5a,%l0
	fdtoi	%f18,%f31
	retl
	umul	%l1,0xaa2,%l6
p0_jmpl_1_ho:
	udivx	%l0,0x89f,%l3
	and	%l7,%l5,%l3
	fadds	%f22,%f27,%f25
	jmpl	%g6+8,%g0
	xnor	%l1,%l5,%l7
p0_call_1_ho:
	sdivx	%l5,%l6,%l3
	xnor	%l2,%l4,%l6
	or	%l7,-0xa5a,%l0
	fdtoi	%f18,%f31
	retl
	umul	%l1,0xaa2,%l6
user_jump1_end:
	.seg	"text"
	.align	0x2000
user_jump2_start:
	INIT_MEM(0, 0x0030, 1, +, 0, +, 0)
p0_jmpl_2_le:
	addc	%l1,-0xa35,%l0
	fsubs	%f8 ,%f3 ,%f10
	udivx	%l6,-0x6db,%l2
	fsqrts	%f3 ,%f4 
	orn	%l4,%l2,%l6
	subc	%l4,%l2,%l4
	jmpl	%g6+8,%g0
	sub	%l2,%l2,%l6
p0_call_2_le:
	retl
	fdivs	%f8 ,%f15,%f9 
p0_jmpl_2_lo:
	addc	%l1,-0xa35,%l0
	fsubs	%f8 ,%f3 ,%f10
	udivx	%l6,-0x6db,%l2
	fsqrts	%f3 ,%f4 
	orn	%l4,%l2,%l6
	subc	%l4,%l2,%l4
	jmpl	%g6+8,%g0
	sub	%l2,%l2,%l6
p0_call_2_lo:
	retl
	fdivs	%f8 ,%f15,%f9 
p0_jmpl_2_he:
	mulx	%l7,%l5,%l4
	jmpl	%g6+8,%g0
	stw	%l4,[%i4+0x02c]		! Mem[000000001010142c]
p0_call_2_he:
	orn	%l5,0x5f3,%l3
	smul	%l7,%l7,%l6
	addc	%l7,0x777,%l3
	xnor	%l2,-0x13a,%l3
	sdivx	%l4,-0xb14,%l3
	and	%l0,-0x3ff,%l7
	fadds	%f23,%f31,%f23
	retl
	add	%l5,%l4,%l2
p0_jmpl_2_ho:
	mulx	%l7,%l5,%l4
	jmpl	%g6+8,%g0
	stw	%l4,[%o4+0x02c]		! Mem[000000001010142c]
p0_call_2_ho:
	orn	%l5,0x5f3,%l3
	smul	%l7,%l7,%l6
	addc	%l7,0x777,%l3
	xnor	%l2,-0x13a,%l3
	sdivx	%l4,-0xb14,%l3
	and	%l0,-0x3ff,%l7
	fadds	%f23,%f31,%f23
	retl
	add	%l5,%l4,%l2
user_jump2_end:
	.seg	"text"
	.align	0x2000
user_jump3_start:
	INIT_MEM(0, 0x0040, 1, +, 0, +, 0)
p0_jmpl_3_le:
	addc	%l7,-0x527,%l1
	xnor	%l0,%l5,%l1
	add	%l1,%l4,%l6
	orn	%l4,-0xe55,%l7
	sdivx	%l2,%l5,%l1
	smul	%l5,%l1,%l3
	sdivx	%l2,%l4,%l6
	jmpl	%g6+8,%g0
	and	%l6,-0x37e,%l0
p0_call_3_le:
	ldd	[%i6+0x020],%l6		! Mem[0000000010181420]
	retl
	xnor	%l4,%l1,%l7
p0_jmpl_3_lo:
	addc	%l7,-0x527,%l1
	xnor	%l0,%l5,%l1
	add	%l1,%l4,%l6
	orn	%l4,-0xe55,%l7
	sdivx	%l2,%l5,%l1
	smul	%l5,%l1,%l3
	sdivx	%l2,%l4,%l6
	jmpl	%g6+8,%g0
	and	%l6,-0x37e,%l0
p0_call_3_lo:
	ldd	[%o6+0x020],%l6		! Mem[0000000010181420]
	retl
	xnor	%l4,%l1,%l7
p0_jmpl_3_he:
	addc	%l7,%l1,%l7
	jmpl	%g6+8,%g0
	fmuls	%f30,%f19,%f27
p0_call_3_he:
	fdtoi	%f16,%f22
	add	%l3,-0x4ad,%l0
	sdivx	%l4,0x81f,%l3
	and	%l7,%l2,%l7
	subc	%l4,0x230,%l5
	fsqrts	%f19,%f17
	and	%l3,0x166,%l7
	retl
	xor	%l6,%l4,%l6
p0_jmpl_3_ho:
	addc	%l7,%l1,%l7
	jmpl	%g6+8,%g0
	fmuls	%f30,%f19,%f27
p0_call_3_ho:
	fdtoi	%f16,%f22
	add	%l3,-0x4ad,%l0
	sdivx	%l4,0x81f,%l3
	and	%l7,%l2,%l7
	subc	%l4,0x230,%l5
	fsqrts	%f19,%f17
	and	%l3,0x166,%l7
	retl
	xor	%l6,%l4,%l6
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
	.word	0x340d0838,0x72a08787		! Init value for %l0
	.word	0x31f18f71,0x90a945ec		! Init value for %l1
	.word	0x607329a6,0x76cb5d0b		! Init value for %l2
	.word	0xe9ee1ec5,0xef3034b5		! Init value for %l3
	.word	0x9a2eed20,0x2944732c		! Init value for %l4
	.word	0x5761a96c,0x13ff938e		! Init value for %l5
	.word	0xb4a9fc99,0xd7b027a8		! Init value for %l6
	.word	0xe9385889,0xf55f173c		! Init value for %l7
	.align	64
p0_init_freg:
	.word	0xf99504d9,0x738ac30b		! Init value for %f0 
	.word	0x426f1c4e,0xa28a6a6d		! Init value for %f2 
	.word	0x0cf4cc1d,0xa5f460b0		! Init value for %f4 
	.word	0xae0f39bd,0x6f134f9e		! Init value for %f6 
	.word	0x2863b31d,0x5cba080a		! Init value for %f8 
	.word	0x38ffe43a,0x93ef4102		! Init value for %f10
	.word	0xa28527f5,0x93f3477c		! Init value for %f12
	.word	0xaec7c47b,0x70be3ce4		! Init value for %f14
	.word	0x907b8135,0xfc52cf11		! Init value for %f16
	.word	0xca0e600f,0x5721c519		! Init value for %f18
	.word	0xa9fc6c60,0x095ce85a		! Init value for %f20
	.word	0x3e49b886,0x8b9f6c2c		! Init value for %f22
	.word	0x54937de8,0x9dd4e159		! Init value for %f24
	.word	0xeeae27dc,0xe1ce609b		! Init value for %f26
	.word	0xe2f253a2,0x778aed2f		! Init value for %f28
	.word	0xdf4bb1b5,0xae27d753		! Init value for %f30
	.word	0x7a630184,0x9afccded		! Init value for %f32
	.word	0xf00aabe2,0x16f174bf		! Init value for %f34
	.word	0x4f8fa44f,0x80f82a9f		! Init value for %f36
	.word	0x5b5ca511,0xc5844459		! Init value for %f38
	.word	0xd8f86922,0xe5cb0f5c		! Init value for %f40
	.word	0x493e41ee,0xdef950f0		! Init value for %f42
	.word	0xe95e86af,0x54eba9ce		! Init value for %f44
	.word	0x84e47134,0xdab5610e		! Init value for %f46
	.word	0x3c04f585,0x527cf0cb
	.word	0x84d94e01,0xef09de29
	.word	0x0cd2f023,0xe5fbf706
	.word	0x6134d894,0x2d2d190e
	.word	0x6c5fcaf2,0xb8691cf5
	.word	0x84692521,0xffec72d0
	.word	0x0e3c1a25,0x0c3d7f15
	.word	0xf7eef0c0,0x00efc8b1
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
	.word	0x00000000,0x00005647
	.word	0x00000000,0xda000000
	.word	0x00000000,0x000000ff
	.word	0x00000000,0x000000ff
	.word	0x00000000,0x00000000
	.word	0x00000000,0x000000ff
	.word	0x00000000,0x088d03d2
	.word	0x00000000,0x0d916d64
p0_expected_fp_regs:
	.word	0x297d4a65,0x00000000
	.word	0x646d910d,0x60000000
	.word	0xffffffff,0x000000ff
	.word	0x5a4decb6,0x00aeffff
	.word	0x00000000,0x00000000
	.word	0x29eaa2e2,0x047e2ea5
	.word	0x00000000,0x000000ff
	.word	0xd01edd19,0x00000000
	.word	0x000000ff,0x000000ff
	.word	0x00000000,0x00000000
	.word	0x00000000,0x0d916d64
	.word	0x0d916d64,0xd85826d9
	.word	0xff000000,0x00000000
	.word	0xd01edd19,0x9e7c15ff
	.word	0xa52e7e04,0x0d916d64
	.word	0xff302700,0x1e2522e8
	.word	0x0000002e,0x00000800		! %fsr = 0000002e00000800
p0_local0_expect:
	.word	0x44a35ba2,0x00000000
	.word	0x8d0800ff,0xb6ec4d5a
	.word	0xff000000,0x00000000
	.word	0x00000000,0xdb72f184
	.word	0x00000000,0x000000bc
	.word	0xd2038d08,0x29000000
	.word	0xff000000,0x00000000
	.word	0xffff2700,0x1e2522e8
p0_local0_sec_expect:
	.word	0x3c90d74c,0xb6ec4d5a
	.word	0xff000000,0x00000000
	.word	0xff00088d,0x000000ff
	.word	0x646d910d,0x7abbfe4d
	.word	0x00000000,0x340000ff
	.word	0x95d0a0c4,0x6bd091ff
	.word	0x00000000,0xa6007f18
	.word	0xfd2146b2,0xe70000ff
p0_local1_expect:
	.word	0x000000ff,0x00000000
	.word	0x00000000,0x000000ff
	.word	0xff000000,0x00000000
	.word	0x00000000,0xff0d0060
	.word	0x00000000,0x000000e3
	.word	0xd85820ff,0x047e2ea5
	.word	0x080003d2,0x000000e3
	.word	0x00000000,0x00000000
p0_local1_sec_expect:
	.word	0x5647910d,0x00000000
	.word	0x00000000,0x000000ff
	.word	0xff000000,0xe30000ff
	.word	0x646d910d,0x7abbfe4d
	.word	0x00000000,0x340000ff
	.word	0x95d0a0c4,0x6bd091ff
	.word	0x00000000,0xa6007f18
	.word	0xfd2146b2,0xe70000ff
p0_local2_expect:
	.word	0xe3000000,0x9e7c15ff
	.word	0xffff0000,0xe58922ff
	.word	0xff916d64,0xd85826d9
	.word	0x00000000,0x000000ff
	.word	0xff0081c3,0x00000000
	.word	0xffffffff,0xffffff8c
	.word	0x0000009f,0x41a1b160
	.word	0x00bc0000,0xd52a7e04
p0_local2_sec_expect:
	.word	0xff000000,0x000000ff
	.word	0xff000800,0xcb800000
	.word	0x08000000,0x00000000
	.word	0x646d910d,0x00000000
	.word	0xffc52157,0x34000032
	.word	0x0d916d64,0x00000000
	.word	0x00000057,0x1bb8d5ff
	.word	0x000000ff,0xf28b69b5
p0_local3_expect:
	.word	0x8bf27f53,0xffffffff
	.word	0x088d0000,0x00000000
	.word	0xb6ec4d5a,0x0000ffff
	.word	0x00000000,0xa6007f18
	.word	0xffffffff,0xffffff8c
	.word	0x000000e3,0xe2a2eaff
	.word	0xe8476df6,0xd01edd19
	.word	0x4ca6fc6b,0x654a7d29
p0_local3_sec_expect:
	.word	0xff000000,0x654a7d29
	.word	0xff008ef8,0x0d916d64
	.word	0x00000000,0x8bf27f53
	.word	0x60000000,0x00000000
	.word	0x00000000,0x34697300
	.word	0xa52e7e04,0xe2a2ea29
	.word	0xe3000000,0xd2038d08
	.word	0x00000000,0x00000000
p0_local4_expect:
	.word	0xff0044a3,0x000000ff
	.word	0x00000000,0xb1ec54da
	.word	0x00000000,0xffffffff
	.word	0xa9fc6c60,0x6f13569c
	.word	0x000000ff,0x00ff00ff
	.word	0x29eaad7d,0x00000000
	.word	0x088d03d2,0x000000e3
	.word	0x000000ff,0x000000ff
p0_local4_sec_expect:
	.word	0x00000000,0xa52e7e04
	.word	0xff000000,0x000000ff
	.word	0x000000ff,0x29000000
	.word	0x00736934,0x00000000
	.word	0x9c071bb4,0x462cd38d
	.word	0xd8c31769,0x5610d03d
	.word	0xdf201723,0x65a5914a
	.word	0x27e2d0d7,0x9eaf4194
p0_local5_expect:
	.word	0xda000000,0xda000000
	.word	0x00000000,0x00000008
	.word	0xe30000ff,0xff000800
	.word	0xe3000000,0x0000ffff
	.word	0x00736934,0x00000000
	.word	0x29eaa2e2,0x047e2ea5
	.word	0x088d03d2,0x000000e3
	.word	0x646d000d,0x00002ea5
p0_local5_sec_expect:
	.word	0x00ff0000,0xf5000000
	.word	0xbc000000,0x00000000
	.word	0xff000000,0xff000000
	.word	0x60000000,0x00000000
	.word	0x00000000,0x34697300
	.word	0xa52e7e04,0xe2a2ea29
	.word	0xe3000000,0xd2038d08
	.word	0x00000000,0x00000000
p0_local6_expect:
	.word	0x646d910d,0x00000000
	.word	0x00000000,0x069ee589
	.word	0xff000000,0xffffffff
	.word	0x000000e4,0xe300fb00
	.word	0xff0057fd,0x726f2f17
	.word	0x00000000,0x00000000
	.word	0x0000b160,0x000000ff
	.word	0x000003d2,0x047e2ea5
p0_local6_sec_expect:
	.word	0xf11ff9c0,0x340000ff
	.word	0x8cffffff,0x00000000
	.word	0x00000000,0x00000000
	.word	0xff000034,0x00000000
	.word	0xa52e7e04,0x34697300
	.word	0xa52e7e04,0xe2a2ea29
	.word	0xe3000000,0xd2038d08
	.word	0x6f13569c,0xff000000
share0_expect:
	.word	0x00ff01ce,0xa778056e
	.word	0xc5e19306,0x276fd4fe
	.word	0x22fa564a,0x91ecefa3
	.word	0x7a37c54c,0x2a0ddc27
	.word	0x88e5e385,0xf3d483d7
	.word	0xfc9e30ff,0xc1223505
	.word	0x1f97f561,0x15df3d69
	.word	0x34665a6d,0x6e37e345
share1_expect:
	.word	0x00ffe062,0x17104579
	.word	0xd1460c6b,0xa388f059
	.word	0x190e8626,0xcde55610
	.word	0x06293b66,0x108ea68a
	.word	0xcebc6246,0x359fe2e4
	.word	0x9c7981ff,0xe53f88ca
	.word	0xda932e6d,0xc4a44ee1
	.word	0x7f9115b1,0x365c8c76
	.word	0x54daf99a,0x718f4b9c
	.word	0xcc6161a7,0x62733d9a
	.word	0x625754d2,0x3ff7997f
	.word	0x4145aca1,0x4bc00164
	.word	0xf9552bab,0x18e020cc
	.word	0xa0e7f132,0x25b6b10a
	.word	0x72ae75ea,0x0fb6eefb
	.word	0x3937ee12,0x0ffdc4af
share2_expect:
	.word	0xffffe5a1,0xffa9f3b1
	.word	0x472f2da0,0xd38cdfd6
	.word	0x1850e495,0x90b49e4b
	.word	0x30a9455f,0x539b28bd
	.word	0xb0cf4298,0x56f8bab4
	.word	0x82a0533f,0xb98bd8ea
	.word	0x26473eca,0x31bd6985
	.word	0x2f38b097,0x19239ce8
share3_expect:
	.word	0xffff18df,0x36862b41
	.word	0x31a38344,0x79ac1553
	.word	0x51d3092e,0xc10b9f0f
	.word	0x9c853e0e,0x79ccb518
	.word	0x989c9995,0x3b092a50
	.word	0xd132f10b,0x116b175e
	.word	0x9eb16360,0x8d334091
	.word	0xd6d263f8,0x3596e730
	.word	0x607028b2,0x51548f78
	.word	0x0b118149,0xf73f444f
	.word	0xb4001c69,0xb556ac85
	.word	0x20baaaca,0xd3c69e1d
	.word	0x1ea97be9,0xbf402893
	.word	0x9f420a09,0x523cace9
	.word	0xbe9093d6,0xed557c61
	.word	0xcf8f60f3,0x88daab26
	.word	0x18ff9b02,0xc04f141b
	.word	0x2c42a389,0x0dc5b583
	.word	0x61791568,0xd7c62fca
	.word	0xf7544da5,0xc96fd9b1
	.word	0x003bd7f6,0x1af01f23
	.word	0x490d9077,0x70115948
	.word	0x83a9d947,0xcef4f3bb
	.word	0x95fe585a,0xb972f740
	.word	0xdaffd5a0,0x28a5d189
	.word	0xf8def2a6,0x5470111d
	.word	0x2d6f9b35,0xd84f82c1
	.word	0xfa0f5caf,0x118e28c9
	.word	0xca485878,0xba491d04
	.word	0x3279ddba,0x3f1f4b5c
	.word	0xb77f95b6,0xf051f1bc
	.word	0xf9b5b719,0x3179b00e
	.word	0x34bc4e79,0x47b0b9a4
	.word	0xfdef8763,0xf427642e
	.word	0x1e37a448,0x5a171813
	.word	0xeed6da03,0xe9cb06bd
	.word	0x203c9989,0x0ad98e0a
	.word	0x6628370f,0xc3e16445
	.word	0x1e253a7d,0x8b3309f6
	.word	0xc59b54de,0x4b4bb3d1
	.word	0x006099db,0x3ac34e37
	.word	0x22ca1d96,0x348e13b7
	.word	0x7d3a8d15,0xf86cb1b6
	.word	0x2ecfcee7,0x80230b33
	.word	0xda0e8a16,0x7bf033b4
	.word	0xaeaedde3,0xd8b41faa
	.word	0xb7acac5a,0xf6ef5c18
	.word	0x2f61a4c5,0x68950f10
	.word	0xffb7423e,0xe18ade00
	.word	0x1f355ded,0x796674b2
	.word	0x71e33b62,0x0c8b6b3b
	.word	0xd3cc245d,0x0332f819
	.word	0x37067dac,0xe3f338b8
	.word	0x8e90c766,0x3bf3f170
	.word	0xc8aa7423,0x74d7a0ba
	.word	0xf9a595d1,0x3e468e4a
	.word	0x00ffc752,0x4a9c22e3
	.word	0xfded4401,0x14c4bea1
	.word	0x11dda95f,0x94c9eb8c
	.word	0x8dfb85cb,0x6d2ed88f
	.word	0x349b3133,0x6b6233c6
	.word	0x30ed3049,0x1fef63bb
	.word	0x9570581f,0x0cf2f456
	.word	0x6171d4df,0x6387f1c0
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
	.word	0x97154d88,0x4119d164
	.word	0x00000000,0x00000002
	.word	0x3a5f2b8f,0xac0b2b21
	.word	0x00000000,0x00000003
	.word	0xeae86b58,0x7e1ede39
	.word	0x00000000,0x00000004
	.word	0x5857a3ff,0xb695c3b5
	.word	0x00000000,0x00000005
	.word	0x0e0f2160,0x5dc1597d
	.word	0x00000000,0x00000006
	.word	0x44972b98,0x5ed114c5
	.word	0x00000000,0x00000007
	.word	0xedbe9287,0xf1f58019
	.word	0x00000000,0x00000008
	.word	0x1495a128,0x3b876d64
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
	.word	0xe3be3372,0xff1ea306,0xc9621194,0xa872efa8
	.word	0x42a0ba56,0x2bb15db8,0x63faf6e3,0x702c0de6
	.word	0x107c11ad,0xa12193dd,0x63907922,0xdd8dfb13
	.word	0x043f6f43,0x64eb5228,0xf2a90fc8,0x4e8609d4
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
	.word	0xe6964508,0xd0559d06,0xa79e1555,0x8a53b032
	.word	0x461d7330,0x54f3c7d1,0x9c56136f,0x0e505f4b
	.word	0xa52e7e04,0x02c076f0,0x99507837,0xe2a2ea29
	.word	0xf73659a6,0x41a1a601,0x4ca6fc6b,0x654a7d29
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
	.word	0x6bfb568f,0xca591030,0x6432845f,0x57663e30
	.word	0xffcb868d,0x4c6334a3,0x3ca1c359,0xd01edd19
	.word	0x7fe245f6,0xd8275aa4,0xe0250a6d,0x0f0be2a9
	.word	0xe9f291be,0x410fd903,0x445c2c9f,0x9f22251e
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
	.word	0xbbdef45c,0x5584b512,0xb562cdb1,0xd3a0fe6b
	.word	0x597bd3e4,0xd1e92f7b,0xce72171c,0x22b6d1bb
	.word	0xce7ac61e,0x023e51a0,0x9022e18d,0x1c5e0f5f
	.word	0xdf50dd13,0x2ca9bcb5,0x02ed80cf,0xb55fc220
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
	.word	0x948a4d02,0xf57e14c7,0xe713ee56,0x03815332
	.word	0xcf8c9400,0xc68c78d8,0xd0c62442,0x6f11316e
	.word	0x49840312,0xf539bdcc,0x94121178,0xb252fd4b
	.word	0x128b7cee,0x7928f15e,0x4f9cb114,0x75164fc8
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
	.word	0xefcf4072,0x887e3ba9,0x1c955e81,0xfa93b0a2
	.word	0x2bb2b3ca,0x70b4b1fd,0x646d910d,0x7abbfe4d
	.word	0xdc24471b,0x8906acbf,0x95d0a0c4,0x6bd091ff
	.word	0x7b398aab,0x0fbfdfcf,0x21d0705d,0xf28b69b5
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
	.word	0x790f06e7,0x8f0a4e97,0xfc5da99a,0xd169ea6a
	.word	0x416f4834,0xb5c8ad51,0x5b60a5f4,0x5fac2f21
	.word	0x8a204df7,0x20e9f282,0x701f2b2b,0xe50c768e
	.word	0x8eb3af40,0xe1c48775,0x5d15e8b5,0x6b6cc2ec
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
	.word	0x0e18df29,0xfe8b48c6,0xd53f351c,0xf66d47e8
	.word	0xe292aff8,0x13ce7c52,0xdd6fe3d7,0xbbf532db
	.word	0xb430a514,0x74e53ae9,0x423742c0,0x2b0994b6
	.word	0x9476aad5,0x6d0498fd,0xe00c2ff6,0x60bb2927
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
	.word	0x0addd1cc,0x01f35123,0x9595b79e,0x1d8080b9
	.word	0xd0377664,0x26b50d03,0x1560aefe,0xa156caa9
	.word	0x9735361c,0x94a86dd3,0xad14c10a,0x9b0c725c
	.word	0x7ef25af5,0x3aed2469,0xe22787a2,0x4373d92b
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
	.word	0x549c323e,0x0ab8f637,0xbc946679,0xd4129133
	.word	0x3acc0cbb,0x8b0b6b58,0x7222bb94,0xda7c4b0c
	.word	0x9c071bb4,0x462cd38d,0xd8c31769,0x5610d03d
	.word	0xdf201723,0x65a5914a,0x27e2d0d7,0x9eaf4194
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
	.word	0x60b136e4,0x088d03d2,0x84f172db,0x2ad5b81b
	.word	0x32c8e3bb,0x3469aa70,0xa69be755,0x349b34e1
	.word	0xae9a2bfc,0x16973ac7,0xa6667f18,0xfd2281c3
	.word	0xcb0c4acb,0x9ad31662,0x9129fb24,0xa1532bb8
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
	.word	0xed768f42,0x8c71f0c6,0x6a599db0,0x4440f3d4
	.word	0xf8b5e936,0xeb0efd3c,0x4917edc0,0x09a13b55
	.word	0xde758f6b,0x3baf5081,0x379ed801,0xcb08a9e0
	.word	0x4d316293,0x7978b36e,0xbf1c5d38,0x5710a91f
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
	.word	0xf3ee4792,0x641035b8,0xb2787248,0xbfdff7ee
	.word	0xc9c8f650,0xe4468589,0x7019af47,0x8cb0466d
	.word	0xa21033db,0x726f2f17,0xe4202773,0x442eeae8
	.word	0x0aeb4c39,0x47ee08bd,0xb24621fd,0x94ad7d4c
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
	.word	0x972b75c3,0xb9283712,0x1744f010,0x6ce214e9
	.word	0xb1f3b62b,0x4acc9370,0x55b60131,0xce4ed205
	.word	0x8ccd920c,0x415d28e8,0xe0f02f73,0xb9a63a86
	.word	0xf23a9726,0x407eae3e,0xaa59bf00,0x475f8a73
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
	.word	0xdb6701ce,0xa778056e,0xc5e19306,0x276fd4fe
	.word	0x22fa564a,0x91ecefa3,0x7a37c54c,0x2a0ddc27
	.word	0x88e5e385,0xf3d483d7,0xfc9e30ff,0xc1223505
	.word	0x1f97f561,0x15df3d69,0x34665a6d,0x6e37e345
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
	.word	0x95ebe062,0x17104579,0xd1460c6b,0xa388f059
	.word	0x190e8626,0xcde55610,0x06293b66,0x108ea68a
	.word	0xcebc6246,0x359fe2e4,0x9c7981ff,0xe53f88ca
	.word	0xda932e6d,0xc4a44ee1,0x7f9115b1,0x365c8c76
	.word	0x659bf99a,0x718f4b9c,0xcc6161a7,0x62733d9a
	.word	0x625754d2,0x3ff7997f,0x4145aca1,0x4bc00164
	.word	0xf9552bab,0x18e020cc,0xa0e7f132,0x25b6b10a
	.word	0x72ae75ea,0x0fb6eefb,0x3937ee12,0x0ffdc4af
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
	.word	0x22dce5a1,0xffa9f3b1,0x472f2da0,0xd38cdfd6
	.word	0x1850e495,0x90b49e4b,0x30a9455f,0x539b28bd
	.word	0xb0cf4298,0x56f8bab4,0x82a0533f,0xb98bd8ea
	.word	0x26473eca,0x31bd6985,0x2f38b097,0x19239ce8
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
	.word	0x9be918df,0x36862b41,0x31a38344,0x79ac1553
	.word	0x51d3092e,0xc10b9f0f,0x9c853e0e,0x79ccb518
	.word	0x989c9995,0x3b092a50,0xd132f10b,0x116b175e
	.word	0x9eb16360,0x8d334091,0xd6d263f8,0x3596e730
	.word	0x287028b2,0x51548f78,0x0b118149,0xf73f444f
	.word	0xb4001c69,0xb556ac85,0x20baaaca,0xd3c69e1d
	.word	0x1ea97be9,0xbf402893,0x9f420a09,0x523cace9
	.word	0xbe9093d6,0xed557c61,0xcf8f60f3,0x88daab26
	.word	0x18f59b02,0xc04f141b,0x2c42a389,0x0dc5b583
	.word	0x61791568,0xd7c62fca,0xf7544da5,0xc96fd9b1
	.word	0x003bd7f6,0x1af01f23,0x490d9077,0x70115948
	.word	0x83a9d947,0xcef4f3bb,0x95fe585a,0xb972f740
	.word	0x90d5d5a0,0x28a5d189,0xf8def2a6,0x5470111d
	.word	0x2d6f9b35,0xd84f82c1,0xfa0f5caf,0x118e28c9
	.word	0xca485878,0xba491d04,0x3279ddba,0x3f1f4b5c
	.word	0xb77f95b6,0xf051f1bc,0xf9b5b719,0x3179b00e
	.word	0x650a4e79,0x47b0b9a4,0xfdef8763,0xf427642e
	.word	0x1e37a448,0x5a171813,0xeed6da03,0xe9cb06bd
	.word	0x203c9989,0x0ad98e0a,0x6628370f,0xc3e16445
	.word	0x1e253a7d,0x8b3309f6,0xc59b54de,0x4b4bb3d1
	.word	0x0a6099db,0x3ac34e37,0x22ca1d96,0x348e13b7
	.word	0x7d3a8d15,0xf86cb1b6,0x2ecfcee7,0x80230b33
	.word	0xda0e8a16,0x7bf033b4,0xaeaedde3,0xd8b41faa
	.word	0xb7acac5a,0xf6ef5c18,0x2f61a4c5,0x68950f10
	.word	0xa1b7423e,0xe18ade00,0x1f355ded,0x796674b2
	.word	0x71e33b62,0x0c8b6b3b,0xd3cc245d,0x0332f819
	.word	0x37067dac,0xe3f338b8,0x8e90c766,0x3bf3f170
	.word	0xc8aa7423,0x74d7a0ba,0xf9a595d1,0x3e468e4a
	.word	0x12bcc752,0x4a9c22e3,0xfded4401,0x14c4bea1
	.word	0x11dda95f,0x94c9eb8c,0x8dfb85cb,0x6d2ed88f
	.word	0x349b3133,0x6b6233c6,0x30ed3049,0x1fef63bb
	.word	0x9570581f,0x0cf2f456,0x6171d4df,0x6387f1c0
share3_end:
