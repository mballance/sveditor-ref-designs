/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: mpgen_1500_8.s
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
!	Seed = 327144524
!	Riesling can be on
!	1 Thread, 1500 lines
!	mpgen   created on Dec 20, 2005 (16:35:03)
!	mpgen_1500_8.s created on Mar 27, 2009 (14:45:24)
!	RC file : random.rc
!	cmd = /import/n2-tools/release/tools/mpgen/mpgen,1.051220 -rc random.rc -o mpgen_1500_8 -p 1 -l 1500

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
!	%f0  = 412621cf 11c15bea 6db76f85 68f1e32f
!	%f4  = 4b58f5db 2cf2ca8f ed8fbb52 6bad3bc5
!	%f8  = 3546da2c 7b6ee7ab 7ca4432c e2b3ff02
!	%f12 = 474d2f52 e361fd4e 106038a6 9c55a580
	ldda	[%g1]ASI_BLK_P,%f0
	add	%g1,64,%g1
!	%f16 = 2b1b3d1d f6152b8c 7cd94d89 860f3107
!	%f20 = 6bd2c2b1 14e9f165 122065a5 a36197df
!	%f24 = 31b9e96c e22cf59f b3100ec3 f4b4c85e
!	%f28 = 6c02c89e c47f799d 5dbd5252 152b3a1b
	ldda	[%g1]ASI_BLK_P,%f16
	add	%g1,64,%g1
!	%f32 = 728b5689 66514f11 effc5ae2 9f1d0b76
!	%f36 = f323376e a9a68b16 b55fb385 4ea93745
!	%f40 = 96901360 0165224a 258623a6 11fdf559
!	%f44 = 4866e635 6ee77e29 6d852d15 c3e058f6
	ldda	[%g1]ASI_BLK_P,%f32

!	Set up the Graphics Status Register

	setx	0x93d8a55700000016,%g7,%g1 ! GSR scale =  2, align = 6
	wr	%g1,%g0,%gsr		! GSR = 93d8a55700000016
	wr	%g0,%y			! Clear Y register
	xorcc	%g0,%g0,%g3		! init %g3 and set flags
	membar	#Sync			! Force the block loads to complete

!	Start of Random Code for processor 0

p0_label_1:
!	Mem[00000000201c0000] = f1a76bf6, %l4 = 2a82b89ddc1c9b87
	ldub	[%o0+%g0],%l4		! %l4 = 00000000000000f1
!	Mem[0000000010081408] = c3db571c, %l3 = 79867b9bda9632ea
	swapa	[%i2+%o4]0x88,%l3	! %l3 = 00000000c3db571c
!	%f7  = 6bad3bc5, %f29 = c47f799d, %f2  = 6db76f85
	fmuls	%f7 ,%f29,%f2 		! %f2  = f0ace0d5
!	Mem[0000000030001400] = bae6f2ac, %l2 = dc766f1aac7211e2
	ldsha	[%i0+%g0]0x81,%l2	! %l2 = ffffffffffffbae6
!	%f23 = a36197df, Mem[0000000010001408] = 91abc5b1
	sta	%f23,[%i0+%o4]0x80	! Mem[0000000010001408] = a36197df
!	Mem[0000000010041407] = 39e4d0f9, %l3 = 00000000c3db571c
	ldstuba	[%i1+0x007]%asi,%l3	! %l3 = 000000f9000000ff
!	Mem[0000000010081400] = c99bdc5d, %l6 = ca0dbeaff3637d09
	lduba	[%i2+%g0]0x88,%l6	! %l6 = 000000000000005d
!	Mem[0000000030101400] = f915a154, %f23 = a36197df
	lda	[%i4+%g0]0x81,%f23	! %f23 = f915a154
!	Mem[00000000300c1408] = 768648df, %l1 = 519e92de91105983
	ldstuba	[%i3+%o4]0x89,%l1	! %l1 = 000000df000000ff
!	Starting 10 instruction Store Burst
!	%f4  = 4b58f5db 2cf2ca8f, Mem[0000000030081400] = 681af6f3 3645a870
	stda	%f4 ,[%i2+%g0]0x89	! Mem[0000000030081400] = 4b58f5db 2cf2ca8f

p0_label_2:
!	%f2  = f0ace0d5, Mem[0000000030101410] = b3b05de8
	sta	%f2 ,[%i4+%o5]0x89	! Mem[0000000030101410] = f0ace0d5
!	%f0  = 412621cf, Mem[0000000030081400] = 8fcaf22c
	sta	%f0 ,[%i2+%g0]0x81	! Mem[0000000030081400] = 412621cf
!	Mem[0000000010181410] = 991e3751, %l3 = 00000000000000f9
	ldstuba	[%i6+%o5]0x88,%l3	! %l3 = 00000051000000ff
!	Mem[0000000010141424] = 69474cbc, %l6 = 000000000000005d
	swap	[%i5+0x024],%l6		! %l6 = 0000000069474cbc
!	%f30 = 5dbd5252 152b3a1b, Mem[0000000030101400] = f915a154 fb573cf4
	stda	%f30,[%i4+%g0]0x81	! Mem[0000000030101400] = 5dbd5252 152b3a1b
!	Mem[0000000010081408] = da9632ea, %l5 = bd0789888dd09997
	swapa	[%i2+%o4]0x88,%l5	! %l5 = 00000000da9632ea
!	%l4 = 000000f1, %l5 = da9632ea, Mem[00000000100c1400] = 21a55455 cf79c82a
	stda	%l4,[%i3+0x000]%asi	! Mem[00000000100c1400] = 000000f1 da9632ea
!	%f12 = 474d2f52 e361fd4e, %l4 = 00000000000000f1
!	Mem[0000000030041400] = 7e0306433d86de82
	stda	%f12,[%i1+%l4]ASI_PST8_S ! Mem[0000000030041400] = 474d2f523d86de4e
!	%l5 = 00000000da9632ea, Mem[0000000010181400] = 9616bb679b3d9348
	stxa	%l5,[%i6+%g0]0x80	! Mem[0000000010181400] = 00000000da9632ea
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = ad6a3b63, %l7 = 7cd54f9ae0a5126c
	lduha	[%i5+%o4]0x81,%l7	! %l7 = 000000000000ad6a

p0_label_3:
!	Mem[00000000100c1408] = 0469043f5141851b, %f20 = 6bd2c2b1 14e9f165
	ldda	[%i3+%o4]0x80,%f20	! %f20 = 0469043f 5141851b
!	Mem[0000000010081410] = ded9a71b, %l4 = 00000000000000f1
	ldswa	[%i2+0x010]%asi,%l4	! %l4 = ffffffffded9a71b
!	Mem[0000000030101400] = 5252bd5d, %l5 = 00000000da9632ea
	lduha	[%i4+%g0]0x89,%l5	! %l5 = 000000000000bd5d
!	Mem[0000000010141408] = 7a92476f, %l7 = 000000000000ad6a
	lduwa	[%i5+%o4]0x80,%l7	! %l7 = 000000007a92476f
!	Mem[0000000030101400] = 5252bd5d, %l1 = 00000000000000df
	ldsha	[%i4+%g0]0x89,%l1	! %l1 = ffffffffffffbd5d
!	Mem[0000000030141408] = ad6a3b63, %f25 = e22cf59f
	lda	[%i5+%o4]0x81,%f25	! %f25 = ad6a3b63
!	Mem[0000000030041410] = cfa63dd5, %l6 = 0000000069474cbc
	ldsha	[%i1+%o5]0x81,%l6	! %l6 = ffffffffffffcfa6
!	Mem[0000000030001408] = c5ea08a4, %l6 = ffffffffffffcfa6
	ldsha	[%i0+%o4]0x89,%l6	! %l6 = 00000000000008a4
!	Mem[00000000100c1400] = ea3296daf1000000, %f2  = f0ace0d5 68f1e32f
	ldda	[%i3+%g0]0x88,%f2 	! %f2  = ea3296da f1000000
!	Starting 10 instruction Store Burst
!	%f5  = 2cf2ca8f, Mem[0000000010041400] = 02e494eb
	sta	%f5 ,[%i1+%g0]0x80	! Mem[0000000010041400] = 2cf2ca8f

p0_label_4:
!	Mem[0000000010081410] = 1ba7d9de, %l0 = a05085f1fd9de7be
	swapa	[%i2+%o5]0x88,%l0	! %l0 = 000000001ba7d9de
!	%l4 = ded9a71b, %l5 = 0000bd5d, Mem[0000000030181400] = 5c3a9475 4c7136f1
	stda	%l4,[%i6+%g0]0x81	! Mem[0000000030181400] = ded9a71b 0000bd5d
!	%f6  = ed8fbb52 6bad3bc5, Mem[0000000030081408] = 15a93c90 c3dae970
	stda	%f6 ,[%i2+%o4]0x89	! Mem[0000000030081408] = ed8fbb52 6bad3bc5
!	%l2 = ffffbae6, %l3 = 00000051, Mem[0000000010181408] = f420aa0a 62d41205
	stda	%l2,[%i6+%o4]0x88	! Mem[0000000010181408] = ffffbae6 00000051
!	Mem[0000000010101400] = ca706a57, %l7 = 000000007a92476f, %asi = 80
	swapa	[%i4+0x000]%asi,%l7	! %l7 = 00000000ca706a57
!	%l2 = ffffffffffffbae6, Mem[0000000010141408] = 7a92476f
	sth	%l2,[%i5+%o4]		! Mem[0000000010141408] = bae6476f
!	Mem[0000000030001400] = bae6f2ac, %l1 = ffffffffffffbd5d
	ldstuba	[%i0+%g0]0x81,%l1	! %l1 = 000000ba000000ff
!	%l2 = ffffbae6, %l3 = 00000051, Mem[0000000030041410] = cfa63dd5 e0753291
	stda	%l2,[%i1+%o5]0x81	! Mem[0000000030041410] = ffffbae6 00000051
!	%l6 = 000008a4, %l7 = ca706a57, Mem[0000000010041400] = 2cf2ca8f 39e4d0ff
	stda	%l6,[%i1+%g0]0x80	! Mem[0000000010041400] = 000008a4 ca706a57
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = 3f046904, %l1 = 00000000000000ba
	lduba	[%i3+%o4]0x88,%l1	! %l1 = 0000000000000004

p0_label_5:
!	Mem[0000000030181400] = 5dbd00001ba7d9de, %f14 = 106038a6 9c55a580
	ldda	[%i6+%g0]0x89,%f14	! %f14 = 5dbd0000 1ba7d9de
!	Mem[0000000010081408] = 06be61478dd09997, %f22 = 122065a5 f915a154
	ldda	[%i2+%o4]0x88,%f22	! %f22 = 06be6147 8dd09997
!	Mem[0000000010141400] = 4e0cafcb, %l4 = ffffffffded9a71b
	ldswa	[%i5+%g0]0x88,%l4	! %l4 = 000000004e0cafcb
!	Mem[00000000100c1400] = f1000000, %f22 = 06be6147
	lda	[%i3+%g0]0x88,%f22	! %f22 = f1000000
!	Mem[0000000010001410] = 0e1f1262, %l5 = 000000000000bd5d
	lduha	[%i0+%o5]0x88,%l5	! %l5 = 0000000000001262
!	Code Fragment 3
p0_fragment_1:
!	%l0 = 000000001ba7d9de
	setx	0xe79930201f789897,%g7,%l0 ! %l0 = e79930201f789897
!	%l1 = 0000000000000004
	setx	0xeb629d67ada6d724,%g7,%l1 ! %l1 = eb629d67ada6d724
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = e79930201f789897
	setx	0x7cc4a8e87e16baa9,%g7,%l0 ! %l0 = 7cc4a8e87e16baa9
!	%l1 = eb629d67ada6d724
	setx	0x0747f5581ba13fb7,%g7,%l1 ! %l1 = 0747f5581ba13fb7
!	Mem[0000000030041400] = 474d2f52, %f5  = 2cf2ca8f
	lda	[%i1+%g0]0x81,%f5 	! %f5 = 474d2f52
!	Mem[0000000010181400] = 00000000, %l1 = 0747f5581ba13fb7
	lduba	[%i6+%g0]0x88,%l1	! %l1 = 0000000000000000
!	Mem[00000000211c0000] = 102fc666, %l4 = 000000004e0cafcb
	ldsha	[%o2+0x000]%asi,%l4	! %l4 = 000000000000102f
!	Starting 10 instruction Store Burst
!	Mem[0000000010041410] = 5120908c, %l5 = 0000000000001262
	swapa	[%i1+%o5]0x80,%l5	! %l5 = 000000005120908c

p0_label_6:
!	Code Fragment 3
p0_fragment_2:
!	%l0 = 7cc4a8e87e16baa9
	setx	0x8580d6d7fdfffd0c,%g7,%l0 ! %l0 = 8580d6d7fdfffd0c
!	%l1 = 0000000000000000
	setx	0x5e4fe13f99739cb8,%g7,%l1 ! %l1 = 5e4fe13f99739cb8
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 8580d6d7fdfffd0c
	setx	0xe82b2a807f938a05,%g7,%l0 ! %l0 = e82b2a807f938a05
!	%l1 = 5e4fe13f99739cb8
	setx	0x19653feffd866a71,%g7,%l1 ! %l1 = 19653feffd866a71
!	%l5 = 000000005120908c, Mem[0000000020800040] = d204359e
	sth	%l5,[%o1+0x040]		! Mem[0000000020800040] = 908c359e
!	Mem[0000000030101400] = 5dbd5252, %l4 = 000000000000102f
	ldstuba	[%i4+%g0]0x81,%l4	! %l4 = 0000005d000000ff
!	%l0 = e82b2a807f938a05, Mem[00000000300c1400] = 5d6c916c
	stba	%l0,[%i3+%g0]0x89	! Mem[00000000300c1400] = 5d6c9105
!	%f18 = 7cd94d89, Mem[0000000010101400] = 7a92476f
	sta	%f18,[%i4+%g0]0x80	! Mem[0000000010101400] = 7cd94d89
!	Mem[0000000030141410] = 972b8da2, %l6 = 00000000000008a4
	swapa	[%i5+%o5]0x81,%l6	! %l6 = 00000000972b8da2
!	%l4 = 0000005d, %l5 = 5120908c, Mem[0000000010181408] = e6baffff 51000000
	stda	%l4,[%i6+0x008]%asi	! Mem[0000000010181408] = 0000005d 5120908c
!	%l7 = 00000000ca706a57, Mem[0000000010041410] = 0114fe9362120000
	stxa	%l7,[%i1+%o5]0x88	! Mem[0000000010041410] = 00000000ca706a57
!	%l6 = 00000000972b8da2, Mem[0000000010081408] = 9799d08d
	stwa	%l6,[%i2+%o4]0x80	! Mem[0000000010081408] = 972b8da2
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = f4d95553, %l2 = ffffffffffffbae6
	ldswa	[%i5+%o5]0x88,%l2	! %l2 = fffffffff4d95553

p0_label_7:
!	Mem[0000000030101400] = ffbd5252, %l5 = 000000005120908c
	lduba	[%i4+%g0]0x81,%l5	! %l5 = 00000000000000ff
!	Mem[0000000021800180] = ca4c59fe, %l5 = 00000000000000ff
	lduba	[%o3+0x181]%asi,%l5	! %l5 = 000000000000004c
!	Mem[00000000100c1408] = 0469043f5141851b, %l5 = 000000000000004c
	ldxa	[%i3+0x008]%asi,%l5	! %l5 = 0469043f5141851b
!	Mem[0000000030181408] = 7c57a131, %l2 = fffffffff4d95553
	ldswa	[%i6+%o4]0x81,%l2	! %l2 = 000000007c57a131
!	Mem[00000000100c1438] = 00080cdd, %l1 = 19653feffd866a71
	ldsba	[%i3+0x03a]%asi,%l1	! %l1 = 000000000000000c
!	Mem[00000000100c1418] = b8014883a217791d, %f12 = 474d2f52 e361fd4e
	ldda	[%i3+0x018]%asi,%f12	! %f12 = b8014883 a217791d
!	Mem[0000000030041408] = 9bc658e8, %l3 = 0000000000000051
	ldsha	[%i1+%o4]0x81,%l3	! %l3 = ffffffffffff9bc6
!	Mem[0000000010001400] = 643cd6ce, %l0 = e82b2a807f938a05
	ldsha	[%i0+%g0]0x80,%l0	! %l0 = 000000000000643c
!	Mem[0000000010001400] = ced63c64, %l0 = 000000000000643c
	ldsha	[%i0+%g0]0x88,%l0	! %l0 = 0000000000003c64
!	Starting 10 instruction Store Burst
!	%f15 = 1ba7d9de, Mem[0000000010041408] = dd5b4d91
	sta	%f15,[%i1+%o4]0x88	! Mem[0000000010041408] = 1ba7d9de

p0_label_8:
!	Mem[0000000030081410] = b4460cc1, %l3 = ffffffffffff9bc6
	ldstuba	[%i2+%o5]0x89,%l3	! %l3 = 000000c1000000ff
!	Mem[0000000010181410] = ff371e99, %l7 = 00000000ca706a57
	swapa	[%i6+%o5]0x80,%l7	! %l7 = 00000000ff371e99
!	%f28 = 6c02c89e c47f799d, %l2 = 000000007c57a131
!	Mem[0000000030081418] = 60fdd230f31df000
	add	%i2,0x018,%g1
	stda	%f28,[%g1+%l2]ASI_PST32_S ! Mem[0000000030081418] = 60fdd230c47f799d
!	Mem[0000000010041410] = ca706a57, %f0  = 412621cf
	lda	[%i1+%o5]0x88,%f0 	! %f0 = ca706a57
!	%l4 = 000000000000005d, Mem[0000000010081410] = bee79dfd
	stwa	%l4,[%i2+%o5]0x80	! Mem[0000000010081410] = 0000005d
!	%l3 = 00000000000000c1, Mem[0000000030181410] = 0ee20c9d3fd7489e
	stxa	%l3,[%i6+%o5]0x89	! Mem[0000000030181410] = 00000000000000c1
!	%f16 = 2b1b3d1d f6152b8c, Mem[0000000010181400] = 00000000 da9632ea
	stda	%f16,[%i6+%g0]0x80	! Mem[0000000010181400] = 2b1b3d1d f6152b8c
!	%l4 = 0000005d, %l5 = 5141851b, Mem[0000000030041410] = ffffbae6 00000051
	stda	%l4,[%i1+%o5]0x81	! Mem[0000000030041410] = 0000005d 5141851b
!	%l0 = 00003c64, %l1 = 0000000c, Mem[0000000030081400] = cf212641 4b58f5db
	stda	%l0,[%i2+%g0]0x89	! Mem[0000000030081400] = 00003c64 0000000c
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = 06be6147a28d2b97, %f20 = 0469043f 5141851b
	ldda	[%i2+%o4]0x88,%f20	! %f20 = 06be6147 a28d2b97

p0_label_9:
!	%l4 = 000000000000005d, %l4 = 000000000000005d, %l2 = 000000007c57a131
	or	%l4,%l4,%l2		! %l2 = 000000000000005d
!	Mem[00000000201c0000] = f1a76bf6, %l4 = 000000000000005d
	ldsh	[%o0+%g0],%l4		! %l4 = fffffffffffff1a7
!	Mem[0000000010101438] = 049f032f97340d73, %f22 = f1000000 8dd09997
	ldd	[%i4+0x038],%f22	! %f22 = 049f032f 97340d73
!	%f9  = 7b6ee7ab, %f13 = a217791d, %f27 = f4b4c85e
	fadds	%f9 ,%f13,%f27		! %f27 = 7b6ee7ab
!	Mem[0000000010141400] = 95c7dedf 4e0cafcb, %l2 = 0000005d, %l3 = 000000c1
	ldda	[%i5+%g0]0x88,%l2	! %l2 = 000000004e0cafcb 0000000095c7dedf
!	Mem[0000000030001410] = 8a0af69c08a1b209, %l0 = 0000000000003c64
	ldxa	[%i0+%o5]0x89,%l0	! %l0 = 8a0af69c08a1b209
!	%f6  = ed8fbb52, %f26 = b3100ec3, %f16 = 2b1b3d1d
	fmuls	%f6 ,%f26,%f16		! %f16 = 6121c350
!	Mem[0000000010081410] = 0000005d 9bf9a82b, %l0 = 08a1b209, %l1 = 0000000c
	ldda	[%i2+%o5]0x80,%l0	! %l0 = 000000000000005d 000000009bf9a82b
!	Mem[0000000010001420] = 60710609709e833d, %l6 = 00000000972b8da2
	ldxa	[%i0+0x020]%asi,%l6	! %l6 = 60710609709e833d
!	Starting 10 instruction Store Burst
!	Mem[0000000030041400] = 522f4d47, %l6 = 60710609709e833d
	swapa	[%i1+%g0]0x89,%l6	! %l6 = 00000000522f4d47

p0_label_10:
!	Mem[0000000030181400] = ded9a71b, %l7 = 00000000ff371e99
	swapa	[%i6+%g0]0x81,%l7	! %l7 = 00000000ded9a71b
!	Mem[000000001018141c] = 2a01cd44, %l2 = 000000004e0cafcb, %asi = 80
	swapa	[%i6+0x01c]%asi,%l2	! %l2 = 000000002a01cd44
!	Mem[00000000201c0000] = f1a76bf6, %l3 = 0000000095c7dedf
	ldstub	[%o0+%g0],%l3		! %l3 = 000000f1000000ff
!	Mem[0000000010081428] = 30feeba5, %l6 = 522f4d47, %l2 = 2a01cd44
	add	%i2,0x28,%g1
	casa	[%g1]0x80,%l6,%l2	! %l2 = 0000000030feeba5
!	%f18 = 7cd94d89 860f3107, Mem[00000000300c1408] = ff488676 a335fab1
	stda	%f18,[%i3+%o4]0x81	! Mem[00000000300c1408] = 7cd94d89 860f3107
!	Mem[000000001010140f] = 2a13f6c0, %l0 = 000000000000005d
	ldstuba	[%i4+0x00f]%asi,%l0	! %l0 = 000000c0000000ff
!	%f2  = ea3296da f1000000, Mem[0000000030041410] = 5d000000 1b854151
	stda	%f2 ,[%i1+%o5]0x89	! Mem[0000000030041410] = ea3296da f1000000
!	%f22 = 049f032f 97340d73, Mem[0000000010001420] = 60710609 709e833d
	std	%f22,[%i0+0x020]	! Mem[0000000010001420] = 049f032f 97340d73
!	%l5 = 0469043f5141851b, Mem[0000000010141422] = 9475d354, %asi = 80
	stha	%l5,[%i5+0x022]%asi	! Mem[0000000010141420] = 9475851b
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = c5ea08a4, %l6 = 00000000522f4d47
	lduha	[%i0+%o4]0x89,%l6	! %l6 = 00000000000008a4

p0_label_11:
!	Mem[0000000030081400] = 0000000c00003c64, %f8  = 3546da2c 7b6ee7ab
	ldda	[%i2+%g0]0x89,%f8 	! %f8  = 0000000c 00003c64
!	Mem[0000000030101408] = 2aa51fdd, %l6 = 00000000000008a4
	ldsba	[%i4+%o4]0x81,%l6	! %l6 = 000000000000002a
!	Mem[0000000010141400] = cbaf0c4e, %f16 = 6121c350
	lda	[%i5+%g0]0x80,%f16	! %f16 = cbaf0c4e
!	Mem[0000000010101410] = 87f246b1, %l1 = 000000009bf9a82b
	lduha	[%i4+%o5]0x88,%l1	! %l1 = 00000000000046b1
!	Mem[00000000211c0000] = 102fc666, %l6 = 000000000000002a
	lduba	[%o2+0x001]%asi,%l6	! %l6 = 000000000000002f
!	%f7  = 6bad3bc5, %f19 = 860f3107
	fcmpes	%fcc2,%f7 ,%f19		! %fcc2 = 2
!	Mem[0000000010041410] = 576a70ca 00000000, %l4 = fffff1a7, %l5 = 5141851b
	ldda	[%i1+%o5]0x80,%l4	! %l4 = 00000000576a70ca 0000000000000000
!	Mem[0000000030101400] = 5252bdff, %l6 = 000000000000002f
	ldsha	[%i4+%g0]0x89,%l6	! %l6 = ffffffffffffbdff
!	Mem[0000000010101410] = b146f2879a156aaf, %l3 = 00000000000000f1
	ldxa	[%i4+%o5]0x80,%l3	! %l3 = b146f2879a156aaf
!	Starting 10 instruction Store Burst
!	%l6 = ffffffffffffbdff, Mem[00000000100c1410] = 7c2f9399
	stba	%l6,[%i3+%o5]0x88	! Mem[00000000100c1410] = 7c2f93ff

p0_label_12:
!	%f20 = 06be6147 a28d2b97, Mem[0000000010181400] = 2b1b3d1d f6152b8c
	stda	%f20,[%i6+%g0]0x80	! Mem[0000000010181400] = 06be6147 a28d2b97
!	%l7 = 00000000ded9a71b, Mem[0000000030101408] = 388dc1cfdd1fa52a
	stxa	%l7,[%i4+%o4]0x89	! Mem[0000000030101408] = 00000000ded9a71b
!	Mem[0000000030001408] = c5ea08a4, %l6 = ffffffffffffbdff
	swapa	[%i0+%o4]0x89,%l6	! %l6 = 00000000c5ea08a4
!	Mem[0000000010001402] = 643cd6ce, %l3 = b146f2879a156aaf
	ldstuba	[%i0+0x002]%asi,%l3	! %l3 = 000000d6000000ff
!	%l4 = 00000000576a70ca, Mem[00000000100c140a] = 0469043f, %asi = 80
	stha	%l4,[%i3+0x00a]%asi	! Mem[00000000100c1408] = 046970ca
!	%l3 = 00000000000000d6, Mem[0000000010101400] = 894dd97c
	stba	%l3,[%i4+%g0]0x88	! Mem[0000000010101400] = 894dd9d6
!	%l2 = 0000000030feeba5, Mem[00000000100c1410] = ff932f7c
	stha	%l2,[%i3+%o5]0x80	! Mem[00000000100c1410] = eba52f7c
!	Mem[0000000010001400] = 643cffce, %l7 = 00000000ded9a71b
	swapa	[%i0+%g0]0x80,%l7	! %l7 = 00000000643cffce
!	%l7 = 00000000643cffce, Mem[0000000030041408] = e858c69b
	stwa	%l7,[%i1+%o4]0x89	! Mem[0000000030041408] = 643cffce
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = 05916c5d, %f25 = ad6a3b63
	lda	[%i3+%g0]0x81,%f25	! %f25 = 05916c5d

p0_label_13:
!	Mem[0000000010041400] = a4080000, %l1 = 00000000000046b1
	ldswa	[%i1+%g0]0x88,%l1	! %l1 = ffffffffa4080000
!	Mem[0000000010041408] = ded9a71b, %l0 = 00000000000000c0
	ldsba	[%i1+%o4]0x80,%l0	! %l0 = ffffffffffffffde
!	Mem[0000000030101408] = ded9a71b, %l4 = 00000000576a70ca
	ldswa	[%i4+%o4]0x89,%l4	! %l4 = ffffffffded9a71b
!	Mem[0000000030081410] = ff0c46b4 65b7835d, %l2 = 30feeba5, %l3 = 000000d6
	ldda	[%i2+%o5]0x81,%l2	! %l2 = 00000000ff0c46b4 0000000065b7835d
!	Mem[0000000030041400] = 3d839e703d86de4e, %l0 = ffffffffffffffde
	ldxa	[%i1+%g0]0x81,%l0	! %l0 = 3d839e703d86de4e
!	Mem[0000000030001400] = ffe6f2ac397ae14f, %l4 = ffffffffded9a71b
	ldxa	[%i0+%g0]0x81,%l4	! %l4 = ffe6f2ac397ae14f
!	Mem[0000000010141410] = 5355d9f4, %l0 = 3d839e703d86de4e
	ldsba	[%i5+%o5]0x80,%l0	! %l0 = 0000000000000053
!	Mem[0000000010001404] = b9d66c2b, %l1 = ffffffffa4080000
	lduha	[%i0+0x004]%asi,%l1	! %l1 = 000000000000b9d6
!	Mem[0000000010181400] = 06be6147a28d2b97, %l7 = 00000000643cffce
	ldxa	[%i6+%g0]0x80,%l7	! %l7 = 06be6147a28d2b97
!	Starting 10 instruction Store Burst
!	%l7 = 06be6147a28d2b97, Mem[0000000030001410] = 09b2a1089cf60a8a
	stxa	%l7,[%i0+%o5]0x81	! Mem[0000000030001410] = 06be6147a28d2b97

p0_label_14:
!	%f26 = b3100ec3, Mem[0000000030141410] = a4080000
	sta	%f26,[%i5+%o5]0x89	! Mem[0000000030141410] = b3100ec3
!	%l3 = 0000000065b7835d, Mem[0000000010101408] = 25cacb09
	stwa	%l3,[%i4+%o4]0x80	! Mem[0000000010101408] = 65b7835d
!	%l3 = 0000000065b7835d, Mem[00000000211c0000] = 102fc666, %asi = 80
	stha	%l3,[%o2+0x000]%asi	! Mem[00000000211c0000] = 835dc666
!	%l6 = 00000000c5ea08a4, Mem[0000000020800000] = cdec98bf
	sth	%l6,[%o1+%g0]		! Mem[0000000020800000] = 08a498bf
!	%l3 = 0000000065b7835d, immed = fffff90d, %y  = 00000000
	udiv	%l3,-0x6f3,%l7		! %l7 = 0000000000000000
	mov	%l0,%y			! %y = 00000053
!	%l2 = 00000000ff0c46b4, Mem[0000000010101400] = d6d94d89
	stwa	%l2,[%i4+%g0]0x80	! Mem[0000000010101400] = ff0c46b4
!	%l1 = 000000000000b9d6, Mem[00000000201c0000] = ffa76bf6
	sth	%l1,[%o0+%g0]		! Mem[00000000201c0000] = b9d66bf6
!	Mem[0000000010141408] = d07c1cc26f47e6ba, %l7 = 0000000000000000
	ldxa	[%i5+%o4]0x88,%l7	! %l7 = d07c1cc26f47e6ba
!	%f16 = cbaf0c4e f6152b8c 7cd94d89 860f3107
!	%f20 = 06be6147 a28d2b97 049f032f 97340d73
!	%f24 = 31b9e96c 05916c5d b3100ec3 7b6ee7ab
!	%f28 = 6c02c89e c47f799d 5dbd5252 152b3a1b
	stda	%f16,[%i6]ASI_BLK_SL	! Block Store to 0000000030181400
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = cbaf0c4e, %l6 = 00000000c5ea08a4
	ldsha	[%i5+0x000]%asi,%l6	! %l6 = ffffffffffffcbaf

p0_label_15:
!	Mem[0000000010041400] = 576a70ca a4080000, %l6 = ffffcbaf, %l7 = 6f47e6ba
	ldda	[%i1+%g0]0x88,%l6	! %l6 = 00000000a4080000 00000000576a70ca
!	Mem[0000000030081408] = 6bad3bc5, %f7  = 6bad3bc5
	lda	[%i2+%o4]0x89,%f7 	! %f7 = 6bad3bc5
!	%l4 = ffe6f2ac397ae14f, %l0 = 0000000000000053, %l4  = ffe6f2ac397ae14f
	mulx	%l4,%l0,%l4		! %l4 = f7e0add6a2d70c9d
!	Mem[0000000010041420] = 7074f390ad075847, %l4 = f7e0add6a2d70c9d
	ldxa	[%i1+0x020]%asi,%l4	! %l4 = 7074f390ad075847
!	Mem[0000000010141408] = d07c1cc2 6f47e6ba, %l6 = a4080000, %l7 = 576a70ca
	ldda	[%i5+%o4]0x88,%l6	! %l6 = 000000006f47e6ba 00000000d07c1cc2
	membar	#Sync			! Added by membar checker (1)
!	Mem[0000000010181410] = ca706a57, %l0 = 0000000000000053
	ldswa	[%i6+%o5]0x80,%l0	! %l0 = ffffffffca706a57
!	Mem[0000000030181408] = 07310f86 894dd97c, %l2 = ff0c46b4, %l3 = 65b7835d
	ldda	[%i6+%o4]0x81,%l2	! %l2 = 0000000007310f86 00000000894dd97c
!	Mem[0000000010141410] = 5355d9f4, %l5 = 0000000000000000
	ldsba	[%i5+%o5]0x80,%l5	! %l5 = 0000000000000053
!	%l1 = 000000000000b9d6, imm = ffffffffffffff01, %l6 = 000000006f47e6ba
	add	%l1,-0x0ff,%l6		! %l6 = 000000000000b8d7
!	Starting 10 instruction Store Burst
!	%l2 = 0000000007310f86, Mem[0000000010001408] = a36197df
	stwa	%l2,[%i0+%o4]0x80	! Mem[0000000010001408] = 07310f86

p0_label_16:
!	Mem[0000000010081400] = c99bdc5d, %l1 = 000000000000b9d6
	swapa	[%i2+%g0]0x88,%l1	! %l1 = 00000000c99bdc5d
!	Code Fragment 4
p0_fragment_3:
!	%l0 = ffffffffca706a57
	setx	0xfc3d4a8855980524,%g7,%l0 ! %l0 = fc3d4a8855980524
!	%l1 = 00000000c99bdc5d
	setx	0xb09b52b85d56ad4d,%g7,%l1 ! %l1 = b09b52b85d56ad4d
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = fc3d4a8855980524
	setx	0xec9f75d78043cd04,%g7,%l0 ! %l0 = ec9f75d78043cd04
!	%l1 = b09b52b85d56ad4d
	setx	0x92fcf457846509b0,%g7,%l1 ! %l1 = 92fcf457846509b0
!	Mem[0000000030081400] = 00003c64, %l3 = 00000000894dd97c
	swapa	[%i2+%g0]0x89,%l3	! %l3 = 0000000000003c64
!	%l0 = ec9f75d78043cd04, Mem[0000000010181410] = 576a70ca
	stba	%l0,[%i6+%o5]0x88	! Mem[0000000010181410] = 576a7004
!	%l4 = 7074f390ad075847, Mem[0000000010181400] = 4761be06
	stwa	%l4,[%i6+%g0]0x88	! Mem[0000000010181400] = ad075847
!	%l2 = 0000000007310f86, Mem[00000000211c0001] = 835dc666, %asi = 80
	stba	%l2,[%o2+0x001]%asi	! Mem[00000000211c0000] = 8386c666
!	%f28 = 6c02c89e c47f799d, %l4 = 7074f390ad075847
!	Mem[0000000010001400] = ded9a71bb9d66c2b
	stda	%f28,[%i0+%l4]ASI_PST32_PL ! Mem[0000000010001400] = 9d797fc49ec8026c
!	%l6 = 000000000000b8d7, imm = fffffffffffffadf, %l5 = 0000000000000053
	sub	%l6,-0x521,%l5		! %l5 = 000000000000bdf8
!	%l4 = ad075847, %l5 = 0000bdf8, Mem[0000000010001400] = c47f799d 6c02c89e
	stda	%l4,[%i0+%g0]0x88	! Mem[0000000010001400] = ad075847 0000bdf8
!	Starting 10 instruction Load Burst
!	%l4 = 7074f390ad075847, imm = fffffffffffffb97, %l0 = ec9f75d78043cd04
	or	%l4,-0x469,%l0		! %l0 = fffffffffffffbd7

p0_label_17:
!	Code Fragment 4
p0_fragment_4:
!	%l0 = fffffffffffffbd7
	setx	0x4cf759d7c5a63cad,%g7,%l0 ! %l0 = 4cf759d7c5a63cad
!	%l1 = 92fcf457846509b0
	setx	0x471aadcfd60e9b37,%g7,%l1 ! %l1 = 471aadcfd60e9b37
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 4cf759d7c5a63cad
	setx	0x770227586dc18af9,%g7,%l0 ! %l0 = 770227586dc18af9
!	%l1 = 471aadcfd60e9b37
	setx	0x59ab990f86b7565e,%g7,%l1 ! %l1 = 59ab990f86b7565e
!	Mem[0000000010181400] = ad075847, %f26 = b3100ec3
	lda	[%i6+%g0]0x88,%f26	! %f26 = ad075847
!	Mem[00000000100c1418] = b8014883, %l0 = 770227586dc18af9
	lduba	[%i3+0x019]%asi,%l0	! %l0 = 0000000000000001
!	Mem[0000000010181410] = 04706a57, %l0 = 0000000000000001
	lduha	[%i6+%o5]0x80,%l0	! %l0 = 0000000000000470
!	Mem[0000000010001410] = 0e1f1262, %l5 = 000000000000bdf8
	lduha	[%i0+%o5]0x88,%l5	! %l5 = 0000000000001262
!	Mem[0000000030101400] = 1b3a2b155252bdff, %f2  = ea3296da f1000000
	ldda	[%i4+%g0]0x89,%f2 	! %f2  = 1b3a2b15 5252bdff
!	Mem[0000000030041400] = 3d839e70, %l2 = 0000000007310f86
	lduha	[%i1+%g0]0x81,%l2	! %l2 = 0000000000003d83
!	%f30 = 5dbd5252, Mem[0000000030181408] = 07310f86
	sta	%f30,[%i6+%o4]0x81	! Mem[0000000030181408] = 5dbd5252
!	Mem[0000000030081400] = 0000000c894dd97c, %f30 = 5dbd5252 152b3a1b
	ldda	[%i2+%g0]0x89,%f30	! %f30 = 0000000c 894dd97c
!	Starting 10 instruction Store Burst
!	%l5 = 0000000000001262, Mem[00000000211c0000] = 8386c666
	sth	%l5,[%o2+%g0]		! Mem[00000000211c0000] = 1262c666

p0_label_18:
!	%l4 = ad075847, %l5 = 00001262, Mem[0000000030141410] = c30e10b3 38235dc9
	stda	%l4,[%i5+%o5]0x81	! Mem[0000000030141410] = ad075847 00001262
!	Mem[0000000010181420] = c1e6ac7d0b419631, %l7 = 00000000d07c1cc2, %l6 = 000000000000b8d7
	add	%i6,0x20,%g1
	casxa	[%g1]0x80,%l7,%l6	! %l6 = c1e6ac7d0b419631
!	%f2  = 1b3a2b15 5252bdff, %l0 = 0000000000000470
!	Mem[0000000030041400] = 3d839e703d86de4e
	stda	%f2,[%i1+%l0]ASI_PST8_SL ! Mem[0000000030041400] = 3d839e70152b3a4e
!	Mem[0000000010001408] = 07310f86, %l1 = 59ab990f86b7565e
	ldstuba	[%i0+%o4]0x80,%l1	! %l1 = 00000007000000ff
!	%f22 = 049f032f 97340d73, Mem[0000000010141410] = f4d95553 91669715
	stda	%f22,[%i5+%o5]0x88	! Mem[0000000010141410] = 049f032f 97340d73
!	%f8  = 0000000c, %f28 = 6c02c89e, %f12 = b8014883 a217791d
	fsmuld	%f8 ,%f28,%f12		! %l0 = 0000000000000492, Unfinished, %fsr = 0800000000
!	%l2 = 0000000000003d83, Mem[00000000100c1410] = eba52f7c06a1f929
	stxa	%l2,[%i3+%o5]0x80	! Mem[00000000100c1410] = 0000000000003d83
!	%f19 = 860f3107, Mem[00000000100c1428] = d4e50e16
	sta	%f19,[%i3+0x028]%asi	! Mem[00000000100c1428] = 860f3107
!	%l7 = 00000000d07c1cc2, Mem[0000000010041410] = 576a70ca
	sth	%l7,[%i1+%o5]		! Mem[0000000010041410] = 1cc270ca
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = ceff3c64, %l5 = 0000000000001262
	lduha	[%i1+%o4]0x81,%l5	! %l5 = 000000000000ceff

p0_label_19:
!	Mem[0000000030141400] = eeb23463, %l6 = c1e6ac7d0b419631
	ldsba	[%i5+%g0]0x89,%l6	! %l6 = 0000000000000063
!	Mem[0000000030141408] = ad6a3b63, %l2 = 0000000000003d83
	ldsba	[%i5+%o4]0x81,%l2	! %l2 = ffffffffffffffad
!	Mem[00000000100c1408] = 046970ca, %l5 = 000000000000ceff
	ldsb	[%i3+%o4],%l5		! %l5 = 0000000000000004
!	Mem[00000000201c0000] = b9d66bf6, %l7 = 00000000d07c1cc2
	ldsh	[%o0+%g0],%l7		! %l7 = ffffffffffffb9d6
!	Mem[0000000010141410] = 049f032f97340d73, %l2 = ffffffffffffffad
	ldxa	[%i5+%o5]0x88,%l2	! %l2 = 049f032f97340d73
!	Mem[0000000030141410] = ad07584700001262, %f30 = 0000000c 894dd97c
	ldda	[%i5+%o5]0x81,%f30	! %f30 = ad075847 00001262
!	Mem[00000000100c1408] = 1b854151 ca706904, %l6 = 00000063, %l7 = ffffb9d6
	ldda	[%i3+%o4]0x88,%l6	! %l6 = 00000000ca706904 000000001b854151
!	Mem[0000000010181400] = 475807ad, %l6 = 00000000ca706904
	lduba	[%i6+%g0]0x80,%l6	! %l6 = 0000000000000047
!	Mem[0000000010001410] = 0e1f1262, %l4 = 7074f390ad075847
	lduwa	[%i0+%o5]0x88,%l4	! %l4 = 000000000e1f1262
!	Starting 10 instruction Store Burst
!	%l7 = 000000001b854151, Mem[0000000010081400] = d6b90000
	stba	%l7,[%i2+%g0]0x80	! Mem[0000000010081400] = 51b90000

p0_label_20:
!	Mem[0000000010081410] = 0000005d, %l5 = 0000000000000004
	ldstuba	[%i2+%o5]0x80,%l5	! %l5 = 00000000000000ff
!	%l6 = 0000000000000047, Mem[00000000100c1439] = 00080cdd, %asi = 80
	stba	%l6,[%i3+0x039]%asi	! Mem[00000000100c1438] = 00470cdd
!	Mem[0000000030081400] = 0000000c894dd97c, %l7 = 000000001b854151
	ldxa	[%i2+%g0]0x89,%l7	! %l7 = 0000000c894dd97c
!	Mem[0000000010181408] = 0000005d, %l6 = 0000000000000047
	swapa	[%i6+%o4]0x80,%l6	! %l6 = 000000000000005d
!	Mem[0000000010181400] = 475807ad, %l4 = 000000000e1f1262
	ldstuba	[%i6+%g0]0x80,%l4	! %l4 = 00000047000000ff
!	%l1 = 0000000000000007, Mem[0000000030081408] = 6bad3bc5
	stba	%l1,[%i2+%o4]0x89	! Mem[0000000030081408] = 6bad3b07
!	Mem[0000000010101414] = 9a156aaf, %l4 = 0000000000000047
	ldstub	[%i4+0x014],%l4		! %l4 = 0000009a000000ff
!	%f24 = 31b9e96c 05916c5d, Mem[0000000010001418] = 1da65e34 aa7d2e23
	stda	%f24,[%i0+0x018]%asi	! Mem[0000000010001418] = 31b9e96c 05916c5d
!	%l0 = 0000000000000492, immed = 00000bcd, %y  = 00000053
	umul	%l0,0xbcd,%l3		! %l3 = 000000000035eeea, %y = 00000000
!	Starting 10 instruction Load Burst
!	%f16 = cbaf0c4e f6152b8c, %f5  = 474d2f52
	fdtos	%f16,%f5 		! %f5  = ff800000

p0_label_21:
	membar	#Sync			! Added by membar checker (2)
!	Mem[0000000010181400] = ff5807ad a28d2b97 00000047 5120908c
!	Mem[0000000010181410] = 04706a57 2dc5892e 2697a53f 4e0cafcb
!	Mem[0000000010181420] = c1e6ac7d 0b419631 bb47b886 92e6fbc0
!	Mem[0000000010181430] = 6a19e93a b58e6063 6f32787f 6a315fc1
	ldda	[%i6]ASI_BLK_AIUP,%f16	! Block Load from 0000000010181400
!	Mem[00000000100c1410] = 00000000, %l1 = 0000000000000007
	lduwa	[%i3+%o5]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000030041410] = f1000000, %l0 = 0000000000000492
	lduba	[%i1+%o5]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000010001408] = ff310f86, %l4 = 000000000000009a
	ldsha	[%i0+%o4]0x80,%l4	! %l4 = ffffffffffffff31
!	Mem[0000000010101428] = 43a2396f159ad392, %l1 = 0000000000000000
	ldxa	[%i4+0x028]%asi,%l1	! %l1 = 43a2396f159ad392
!	Mem[00000000100c1404] = da9632ea, %l5 = 0000000000000000
	lduh	[%i3+0x006],%l5		! %l5 = 00000000000032ea
!	Mem[0000000020800040] = 908c359e, %l3 = 000000000035eeea
	lduha	[%o1+0x040]%asi,%l3	! %l3 = 000000000000908c
!	Mem[0000000010041400] = 000008a4 ca706a57 ded9a71b 38bbe9e4
!	Mem[0000000010041410] = 1cc270ca 00000000 85b7a95d 0a7a7b57
!	Mem[0000000010041420] = 7074f390 ad075847 0475329a c46788cf
!	Mem[0000000010041430] = 4377bb05 e3857c59 bad76926 e10ece31
	ldda	[%i1]ASI_BLK_P,%f0	! Block Load from 0000000010041400
!	Mem[0000000010141410] = 97340d73, %l3 = 000000000000908c
	lduba	[%i5+%o5]0x88,%l3	! %l3 = 0000000000000073
!	Starting 10 instruction Store Burst
!	%f31 = 6a315fc1, Mem[00000000100c1410] = 00000000
	sta	%f31,[%i3+%o5]0x80	! Mem[00000000100c1410] = 6a315fc1

p0_label_22:
!	%f30 = 6f32787f, %f17 = a28d2b97, %f22 = 2697a53f
	fsubs	%f30,%f17,%f22		! %f22 = 6f32787f
!	%l6 = 000000000000005d, Mem[0000000030101408] = 1ba7d9de00000000
	stxa	%l6,[%i4+%o4]0x81	! Mem[0000000030101408] = 000000000000005d
!	%f23 = 4e0cafcb, Mem[0000000030181408] = 5dbd5252
	sta	%f23,[%i6+%o4]0x81	! Mem[0000000030181408] = 4e0cafcb
!	%l1 = 43a2396f159ad392, Mem[0000000010101410] = b146f287, %asi = 80
	stha	%l1,[%i4+0x010]%asi	! Mem[0000000010101410] = d392f287
!	Mem[0000000010041404] = ca706a57, %l5 = 00000000000032ea
	swap	[%i1+0x004],%l5		! %l5 = 00000000ca706a57
!	%l0 = 00000000, %l1 = 159ad392, Mem[0000000030041400] = 3d839e70 152b3a4e
	stda	%l0,[%i1+%g0]0x81	! Mem[0000000030041400] = 00000000 159ad392
!	%f24 = c1e6ac7d 0b419631, Mem[0000000010141410] = 97340d73 049f032f
	stda	%f24,[%i5+%o5]0x88	! Mem[0000000010141410] = c1e6ac7d 0b419631
!	%l3 = 0000000000000073, %l7 = 0000000c894dd97c, %l1 = 43a2396f159ad392
	orn	%l3,%l7,%l1		! %l1 = fffffff376b226f3
!	Mem[00000000100c1405] = da9632ea, %l1 = fffffff376b226f3
	ldstuba	[%i3+0x005]%asi,%l1	! %l1 = 00000096000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = 000008a4, %l7 = 0000000c894dd97c
	lduha	[%i1+%g0]0x80,%l7	! %l7 = 0000000000000000

p0_label_23:
!	Mem[00000000100c1408] = 046970ca5141851b, %l1 = 0000000000000096
	ldxa	[%i3+0x008]%asi,%l1	! %l1 = 046970ca5141851b
!	Mem[0000000030041400] = 00000000159ad392, %f30 = 6f32787f 6a315fc1
	ldda	[%i1+%g0]0x81,%f30	! %f30 = 00000000 159ad392
!	Mem[00000000300c1400] = 05916c5d 5392059d 7cd94d89 860f3107
!	Mem[00000000300c1410] = d4a07e91 4079611f bacb85e3 ae339ae5
!	Mem[00000000300c1420] = c78dcd1f 82dea6cf ac259486 4da2c09a
!	Mem[00000000300c1430] = 789302e3 0978858f c41d1ee2 4bdac1b2
	ldda	[%i3]ASI_BLK_SL,%f0	! Block Load from 00000000300c1400
!	Mem[0000000021800040] = b2ac0f03, %l0 = 0000000000000000
	ldsha	[%o3+0x040]%asi,%l0	! %l0 = ffffffffffffb2ac
!	Mem[0000000010181414] = 2dc5892e, %l1 = 046970ca5141851b
	ldsha	[%i6+0x014]%asi,%l1	! %l1 = 0000000000002dc5
!	Mem[0000000010181428] = bb47b886 92e6fbc0, %l2 = 97340d73, %l3 = 00000073
	ldda	[%i6+0x028]%asi,%l2	! %l2 = 00000000bb47b886 0000000092e6fbc0
!	Mem[0000000030181408] = 4e0cafcb894dd97c, %f26 = bb47b886 92e6fbc0
	ldda	[%i6+%o4]0x81,%f26	! %f26 = 4e0cafcb 894dd97c
!	Mem[00000000201c0000] = b9d66bf6, %l5 = 00000000ca706a57
	ldub	[%o0+0x001],%l5		! %l5 = 00000000000000d6
!	Mem[00000000218000c0] = e8e8e4de, %l2 = 00000000bb47b886
	ldub	[%o3+0x0c1],%l2		! %l2 = 00000000000000e8
!	Starting 10 instruction Store Burst
!	Mem[0000000010101400] = b4460cff, %l6 = 000000000000005d
	swapa	[%i4+%g0]0x88,%l6	! %l6 = 00000000b4460cff

p0_label_24:
!	%l1 = 0000000000002dc5, Mem[0000000010141428] = 91e10fb8d8f3310f, %asi = 80
	stxa	%l1,[%i5+0x028]%asi	! Mem[0000000010141428] = 0000000000002dc5
!	%f20 = 04706a57, Mem[0000000030101410] = f0ace0d5
	sta	%f20,[%i4+%o5]0x89	! Mem[0000000030101410] = 04706a57
!	%f21 = 2dc5892e, Mem[0000000010081400] = 51b90000
	sta	%f21,[%i2+%g0]0x80	! Mem[0000000010081400] = 2dc5892e
!	Mem[0000000030141410] = 475807ad, %l7 = 0000000000000000
	ldstuba	[%i5+%o5]0x89,%l7	! %l7 = 000000ad000000ff
!	%f26 = 4e0cafcb 894dd97c, Mem[0000000030081400] = 894dd97c 0000000c
	stda	%f26,[%i2+%g0]0x89	! Mem[0000000030081400] = 4e0cafcb 894dd97c
	membar	#Sync			! Added by membar checker (3)
!	%l1 = 0000000000002dc5, Mem[0000000010041408] = 1ba7d9de
	stwa	%l1,[%i1+%o4]0x88	! Mem[0000000010041408] = 00002dc5
!	Mem[0000000010001410] = 0e1f1262, %l7 = 00000000000000ad
	ldstuba	[%i0+%o5]0x88,%l7	! %l7 = 00000062000000ff
!	Code Fragment 3
p0_fragment_5:
!	%l0 = ffffffffffffb2ac
	setx	0x159f45cffeee20dc,%g7,%l0 ! %l0 = 159f45cffeee20dc
!	%l1 = 0000000000002dc5
	setx	0x900203a0500050c4,%g7,%l1 ! %l1 = 900203a0500050c4
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 159f45cffeee20dc
	setx	0x12feb7b7a53153c3,%g7,%l0 ! %l0 = 12feb7b7a53153c3
!	%l1 = 900203a0500050c4
	setx	0xc5ca8a5804c75bc0,%g7,%l1 ! %l1 = c5ca8a5804c75bc0
!	Mem[0000000010181408] = 00000047, %l2 = 00000000000000e8
	swapa	[%i6+%o4]0x80,%l2	! %l2 = 0000000000000047
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = 894dd97c, %l0 = 12feb7b7a53153c3
	ldswa	[%i3+%o4]0x89,%l0	! %l0 = ffffffff894dd97c

p0_label_25:
!	Mem[00000000100c1408] = 1b854151ca706904, %f12 = 8f857809 e3029378
	ldda	[%i3+%o4]0x88,%f12	! %f12 = 1b854151 ca706904
!	%l1 = c5ca8a5804c75bc0, %l5 = 00000000000000d6, %y  = 00000000
	smul	%l1,%l5,%l6		! %l6 = 00000003fea6b280, %y = 00000003
!	Mem[0000000010001410] = ff121f0e, %l7 = 0000000000000062
	lduwa	[%i0+%o5]0x80,%l7	! %l7 = 00000000ff121f0e
!	Mem[00000000300c1400] = 05916c5d5392059d, %f4  = 1f617940 917ea0d4
	ldda	[%i3+%g0]0x81,%f4 	! %f4  = 05916c5d 5392059d
!	Mem[0000000030001408] = ffbdffff, %l5 = 00000000000000d6
	lduha	[%i0+%o4]0x81,%l5	! %l5 = 000000000000ffbd
!	Mem[0000000030101400] = ffbd5252, %f11 = 869425ac
	lda	[%i4+%g0]0x81,%f11	! %f11 = ffbd5252
!	Mem[00000000100c1430] = b968b3a9f6cda1ad, %f14 = b2c1da4b e21e1dc4
	ldd	[%i3+0x030],%f14	! %f14 = b968b3a9 f6cda1ad
!	Mem[0000000010101408] = 65b7835d2a13f6ff, %l2 = 0000000000000047
	ldxa	[%i4+%o4]0x80,%l2	! %l2 = 65b7835d2a13f6ff
!	Mem[0000000010041400] = a4080000, %f20 = 04706a57
	lda	[%i1+%g0]0x88,%f20	! %f20 = a4080000
!	Starting 10 instruction Store Burst
!	%f0  = 9d059253 5d6c9105, Mem[0000000010101400] = 5d000000 9334c67c
	stda	%f0 ,[%i4+0x000]%asi	! Mem[0000000010101400] = 9d059253 5d6c9105

p0_label_26:
!	Mem[0000000010001410] = ff121f0e, %l1 = c5ca8a5804c75bc0
	swap	[%i0+%o5],%l1		! %l1 = 00000000ff121f0e
!	Mem[00000000201c0000] = b9d66bf6, %l5 = 000000000000ffbd
	ldstub	[%o0+%g0],%l5		! %l5 = 000000b9000000ff
!	%l5 = 00000000000000b9, Mem[0000000030181410] = a28d2b97
	stba	%l5,[%i6+%o5]0x89	! Mem[0000000030181410] = a28d2bb9
!	%f0  = 9d059253 5d6c9105 07310f86 894dd97c
!	%f4  = 05916c5d 5392059d e59a33ae e385cbba
!	%f8  = cfa6de82 1fcd8dc7 9ac0a24d ffbd5252
!	%f12 = 1b854151 ca706904 b968b3a9 f6cda1ad
	stda	%f0,[%i3]ASI_BLK_P	! Block Store to 00000000100c1400
!	%l5 = 00000000000000b9, Mem[0000000010081418] = 0120a6e07026434e
	stx	%l5,[%i2+0x018]		! Mem[0000000010081418] = 00000000000000b9
!	Mem[0000000030081408] = 073bad6b, %l6 = 00000003fea6b280
	ldstuba	[%i2+%o4]0x81,%l6	! %l6 = 00000007000000ff
!	%l5 = 00000000000000b9, Mem[0000000010041420] = 7074f390ad075847
	stx	%l5,[%i1+0x020]		! Mem[0000000010041420] = 00000000000000b9
!	Mem[00000000300c1400] = 5d6c9105, %l4 = ffffffffffffff31
	ldstuba	[%i3+%g0]0x89,%l4	! %l4 = 00000005000000ff
!	%l6 = 0000000000000007, Mem[0000000010141408] = bae6476f
	stb	%l6,[%i5+%o4]		! Mem[0000000010141408] = 07e6476f
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = 8c902051 e8000000, %l0 = 894dd97c, %l1 = ff121f0e
	ldda	[%i6+%o4]0x88,%l0	! %l0 = 00000000e8000000 000000008c902051

p0_label_27:
!	Mem[0000000030001410] = 06be6147, %l7 = 00000000ff121f0e
	lduba	[%i0+%o5]0x81,%l7	! %l7 = 0000000000000006
!	Mem[0000000030081400] = 4e0cafcb894dd97c, %l3 = 0000000092e6fbc0
	ldxa	[%i2+%g0]0x89,%l3	! %l3 = 4e0cafcb894dd97c
!	Mem[0000000010101400] = 5392059d, %l0 = 00000000e8000000
	ldsba	[%i4+%g0]0x88,%l0	! %l0 = ffffffffffffff9d
!	Mem[0000000010181414] = 2dc5892e, %l0 = ffffffffffffff9d
	lduh	[%i6+0x014],%l0		! %l0 = 0000000000002dc5
!	Mem[0000000010141408] = 6f47e607, %l5 = 00000000000000b9
	ldsba	[%i5+%o4]0x88,%l5	! %l5 = 0000000000000007
!	Mem[0000000010001408] = 860f31ff, %l3 = 4e0cafcb894dd97c
	lduba	[%i0+%o4]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030041400] = 00000000, %l5 = 0000000000000007
	lduba	[%i1+%g0]0x81,%l5	! %l5 = 0000000000000000
!	%l7 = 0000000000000006, imm = fffffffffffffaa6, %l7 = 0000000000000006
	or	%l7,-0x55a,%l7		! %l7 = fffffffffffffaa6
!	Mem[0000000030181408] = 4e0cafcb, %l2 = 65b7835d2a13f6ff
	ldswa	[%i6+%o4]0x81,%l2	! %l2 = 000000004e0cafcb
!	Starting 10 instruction Store Burst
!	%f28 = 6a19e93a, Mem[0000000010081408] = 972b8da2
	sta	%f28,[%i2+%o4]0x80	! Mem[0000000010081408] = 6a19e93a

p0_label_28:
!	%f31 = 159ad392, Mem[0000000010001410] = 04c75bc0
	sta	%f31,[%i0+%o5]0x80	! Mem[0000000010001410] = 159ad392
!	%f18 = 00000047, Mem[00000000100c1408] = 07310f86
	sta	%f18,[%i3+%o4]0x80	! Mem[00000000100c1408] = 00000047
!	Mem[0000000010181408] = 000000e8, %l3 = 00000000000000ff
	ldstuba	[%i6+%o4]0x80,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010141408] = 6f47e607, %l3 = 0000000000000000
	swapa	[%i5+%o4]0x88,%l3	! %l3 = 000000006f47e607
!	%f28 = 6a19e93a b58e6063, %l6 = 0000000000000007
!	Mem[00000000300c1430] = 789302e30978858f
	add	%i3,0x030,%g1
	stda	%f28,[%g1+%l6]ASI_PST16_S ! Mem[00000000300c1430] = 7893e93ab58e6063
!	%l2 = 000000004e0cafcb, Mem[0000000020800000] = 08a498bf
	sth	%l2,[%o1+%g0]		! Mem[0000000020800000] = afcb98bf
!	%l5 = 0000000000000000, %l4 = 0000000000000005, %l5 = 0000000000000000
	addc	%l5,%l4,%l5		! %l5 = 0000000000000005
!	%l3 = 000000006f47e607, Mem[00000000218001c0] = f50813ce
	stb	%l3,[%o3+0x1c0]		! Mem[00000000218001c0] = 070813ce
!	%l3 = 000000006f47e607, immd = 0000000000000b33, %l5 = 0000000000000005
	sdivx	%l3,0xb33,%l5		! %l5 = 000000000009efbd
!	Starting 10 instruction Load Burst
!	%l2 = 000000004e0cafcb, immd = 00000000000007b8, %l6 = 0000000000000007
	udivx	%l2,0x7b8,%l6		! %l6 = 00000000000a1c97

p0_label_29:
!	Mem[0000000030181408] = 4e0cafcb, %l5 = 000000000009efbd
	lduba	[%i6+%o4]0x81,%l5	! %l5 = 000000000000004e
!	Mem[0000000030101400] = ffbd5252152b3a1b, %f20 = a4080000 2dc5892e
	ldda	[%i4+%g0]0x81,%f20	! %f20 = ffbd5252 152b3a1b
!	Mem[0000000010141400] = cbaf0c4e, %l1 = 000000008c902051
	ldsba	[%i5+%g0]0x80,%l1	! %l1 = ffffffffffffffcb
!	Mem[0000000030181400] = 8c2b15f64e0cafcb, %f28 = 6a19e93a b58e6063
	ldda	[%i6+%g0]0x81,%f28	! %f28 = 8c2b15f6 4e0cafcb
!	Mem[00000000300c1400] = 5d6c91ff, %l5 = 000000000000004e
	ldswa	[%i3+%g0]0x89,%l5	! %l5 = 000000005d6c91ff
!	Mem[0000000030001410] = 4761be06, %l1 = ffffffffffffffcb
	lduwa	[%i0+%o5]0x89,%l1	! %l1 = 000000004761be06
!	Mem[0000000010101430] = b0a7bc5275cdefd2, %f0  = 9d059253 5d6c9105
	ldd	[%i4+0x030],%f0 	! %f0  = b0a7bc52 75cdefd2
!	Mem[0000000030041400] = 00000000159ad392, %f24 = c1e6ac7d 0b419631
	ldda	[%i1+%g0]0x81,%f24	! %f24 = 00000000 159ad392
!	Mem[0000000010141410] = 3196410b, %f0  = b0a7bc52
	lda	[%i5+%o5]0x80,%f0 	! %f0 = 3196410b
!	Starting 10 instruction Store Burst
!	Mem[0000000030181410] = b92b8da2, %l2 = 000000004e0cafcb
	swapa	[%i6+%o5]0x81,%l2	! %l2 = 00000000b92b8da2

p0_label_30:
!	%f0  = 3196410b, Mem[0000000010041408] = c52d0000
	sta	%f0 ,[%i1+%o4]0x80	! Mem[0000000010041408] = 3196410b
!	Mem[0000000030101410] = 576a7004, %l5 = 000000005d6c91ff
	swapa	[%i4+%o5]0x81,%l5	! %l5 = 00000000576a7004
!	%f24 = 00000000, Mem[0000000010001408] = 860f31ff
	sta	%f24,[%i0+%o4]0x88	! Mem[0000000010001408] = 00000000
!	%l4 = 0000000000000005, %l7 = fffffffffffffaa6, %y  = 00000003
	udiv	%l4,%l7,%l0		! %l0 = 0000000000000003
	mov	%l0,%y			! %y = 00000003
!	Mem[0000000010081400] = 2dc5892e, %l4 = 0000000000000005
	swapa	[%i2+%g0]0x80,%l4	! %l4 = 000000002dc5892e
!	%f14 = b968b3a9 f6cda1ad, Mem[0000000010141410] = 0b419631 c1e6ac7d
	stda	%f14,[%i5+%o5]0x88	! Mem[0000000010141410] = b968b3a9 f6cda1ad
!	%l3 = 000000006f47e607, Mem[0000000010101410] = d392f287
	stwa	%l3,[%i4+%o5]0x80	! Mem[0000000010101410] = 6f47e607
!	%f16 = ff5807ad a28d2b97 00000047 5120908c
!	%f20 = ffbd5252 152b3a1b 6f32787f 4e0cafcb
!	%f24 = 00000000 159ad392 4e0cafcb 894dd97c
!	%f28 = 8c2b15f6 4e0cafcb 00000000 159ad392
	stda	%f16,[%i2]ASI_BLK_PL	! Block Store to 0000000010081400
!	%l1 = 000000004761be06, imm = 0000000000000ae9, %l4 = 000000002dc5892e
	and	%l1,0xae9,%l4		! %l4 = 0000000000000a00
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = ffbdffff 89984b24, %l4 = 00000a00, %l5 = 576a7004
	ldda	[%i0+%o4]0x81,%l4	! %l4 = 00000000ffbdffff 0000000089984b24

p0_label_31:
!	Mem[0000000021800080] = 0a252e32, %l1 = 000000004761be06
	lduha	[%o3+0x080]%asi,%l1	! %l1 = 0000000000000a25
!	Mem[0000000030041400] = 92d39a1500000000, %f6  = e59a33ae e385cbba
	ldda	[%i1+%g0]0x89,%f6 	! %f6  = 92d39a15 00000000
!	Mem[0000000030081408] = ff3bad6b, %l7 = fffffffffffffaa6
	lduba	[%i2+%o4]0x81,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010001408] = 00000000, %l5 = 0000000089984b24
	lduha	[%i0+0x00a]%asi,%l5	! %l5 = 0000000000000000
	membar	#Sync			! Added by membar checker (4)
!	Mem[0000000010081434] = f6152b8c, %l0 = 0000000000000003
	ldsh	[%i2+0x036],%l0		! %l0 = 0000000000002b8c
!	Mem[0000000010181408] = ff0000e85120908c, %l4 = 00000000ffbdffff
	ldxa	[%i6+%o4]0x80,%l4	! %l4 = ff0000e85120908c
!	Mem[0000000010101400] = 9d059253 5d6c9105, %l2 = b92b8da2, %l3 = 6f47e607
	ldda	[%i4+%g0]0x80,%l2	! %l2 = 000000009d059253 000000005d6c9105
!	Mem[0000000030081410] = ff0c46b4, %l0 = 0000000000002b8c
	lduwa	[%i2+%o5]0x81,%l0	! %l0 = 00000000ff0c46b4
!	Mem[0000000030041410] = f1000000, %l4 = ff0000e85120908c
	lduwa	[%i1+%o5]0x89,%l4	! %l4 = 00000000f1000000
!	Starting 10 instruction Store Burst
!	%f18 = 00000047, %f9  = 1fcd8dc7
	fcmpes	%fcc2,%f18,%f9 		! %fcc2 = 1

p0_label_32:
!	%l7 = 00000000000000ff, Mem[000000001010142e] = 159ad392
	sth	%l7,[%i4+0x02e]		! Mem[000000001010142c] = 159a00ff
!	%f22 = 6f32787f 4e0cafcb, Mem[0000000030181400] = f6152b8c cbaf0c4e
	stda	%f22,[%i6+%g0]0x89	! Mem[0000000030181400] = 6f32787f 4e0cafcb
!	%l3 = 000000005d6c9105, Mem[0000000010141400] = cbaf0c4edfdec795
	stxa	%l3,[%i5+%g0]0x80	! Mem[0000000010141400] = 000000005d6c9105
!	%l7 = 00000000000000ff, Mem[0000000021800080] = 0a252e32, %asi = 80
	stha	%l7,[%o3+0x080]%asi	! Mem[0000000021800080] = 00ff2e32
!	Mem[0000000010001408] = 00000000, %l3 = 000000005d6c9105
	swapa	[%i0+%o4]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000010041408] = 3196410b, %l3 = 0000000000000000
	swap	[%i1+%o4],%l3		! %l3 = 000000003196410b
!	%l6 = 00000000000a1c97, Mem[0000000030081410] = ff0c46b4
	stha	%l6,[%i2+%o5]0x81	! Mem[0000000030081410] = 1c9746b4
!	%l1 = 0000000000000a25, immd = fffffffffffff753, %l4 = 00000000f1000000
	udivx	%l1,-0x8ad,%l4		! %l4 = 0000000000000000
!	%l4 = 00000000, %l5 = 00000000, Mem[0000000010081400] = 972b8da2 ad0758ff
	stda	%l4,[%i2+%g0]0x80	! Mem[0000000010081400] = 00000000 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = 65b7835d2a13f6ff, %f6  = 92d39a15 00000000
	ldda	[%i4+%o4]0x80,%f6 	! %f6  = 65b7835d 2a13f6ff

p0_label_33:
!	Mem[00000000100c1414] = 5392059d, %l4 = 0000000000000000
	ldsw	[%i3+0x014],%l4		! %l4 = 000000005392059d
!	Mem[0000000030141410] = ff075847, %f18 = 00000047
	lda	[%i5+%o5]0x81,%f18	! %f18 = ff075847
!	Mem[00000000300c1400] = ff916c5d5392059d, %f14 = b968b3a9 f6cda1ad
	ldda	[%i3+%g0]0x81,%f14	! %f14 = ff916c5d 5392059d
!	%l5 = 0000000000000000, immd = 00000000000001f6, %l2  = 000000009d059253
	mulx	%l5,0x1f6,%l2		! %l2 = 0000000000000000
!	Mem[0000000010101400] = 9d059253, %l1 = 0000000000000a25
	lduha	[%i4+%g0]0x80,%l1	! %l1 = 0000000000009d05
!	Mem[00000000211c0000] = 1262c666, %l6 = 00000000000a1c97
	ldsb	[%o2+0x001],%l6		! %l6 = 0000000000000062
!	Mem[0000000010141410] = f6cda1ad, %l6 = 0000000000000062
	ldswa	[%i5+%o5]0x88,%l6	! %l6 = fffffffff6cda1ad
!	Mem[0000000030041408] = 643cffce, %l2 = 0000000000000000
	ldswa	[%i1+%o4]0x89,%l2	! %l2 = 00000000643cffce
!	Mem[0000000030041400] = 00000000, %l5 = 0000000000000000
	lduha	[%i1+%g0]0x89,%l5	! %l5 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l2 = 643cffce, %l3 = 3196410b, Mem[0000000010141430] = 96d78607 fcecd6eb
	stda	%l2,[%i5+0x030]%asi	! Mem[0000000010141430] = 643cffce 3196410b

p0_label_34:
!	Mem[0000000010101410] = 07e6476f, %l7 = 00000000000000ff
	ldstuba	[%i4+%o5]0x88,%l7	! %l7 = 0000006f000000ff
!	%l1 = 0000000000009d05, Mem[000000001000140c] = e3056f81
	sth	%l1,[%i0+0x00c]		! Mem[000000001000140c] = 9d056f81
!	%l4 = 000000005392059d, Mem[0000000010181408] = ff0000e85120908c
	stxa	%l4,[%i6+%o4]0x80	! Mem[0000000010181408] = 000000005392059d
!	%f20 = ffbd5252 152b3a1b, Mem[0000000030081408] = 6bad3bff ed8fbb52
	stda	%f20,[%i2+%o4]0x89	! Mem[0000000030081408] = ffbd5252 152b3a1b
!	Mem[0000000010081418] = cbaf0c4e, %l5 = 00000000, %l1 = 00009d05
	add	%i2,0x18,%g1
	casa	[%g1]0x80,%l5,%l1	! %l1 = 00000000cbaf0c4e
!	%f8  = cfa6de82, Mem[0000000010081418] = cbaf0c4e
	sta	%f8 ,[%i2+0x018]%asi	! Mem[0000000010081418] = cfa6de82
!	Code Fragment 3
p0_fragment_6:
!	%l0 = 00000000ff0c46b4
	setx	0xf8c37b3030dc587d,%g7,%l0 ! %l0 = f8c37b3030dc587d
!	%l1 = 00000000cbaf0c4e
	setx	0x07bc2f786e574b5a,%g7,%l1 ! %l1 = 07bc2f786e574b5a
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = f8c37b3030dc587d
	setx	0x8dcb10e00fb57dcc,%g7,%l0 ! %l0 = 8dcb10e00fb57dcc
!	%l1 = 07bc2f786e574b5a
	setx	0x71051768679babfd,%g7,%l1 ! %l1 = 71051768679babfd
!	%f14 = ff916c5d, Mem[0000000030081400] = 7cd94d89
	sta	%f14,[%i2+%g0]0x81	! Mem[0000000030081400] = ff916c5d
!	Mem[0000000030001410] = 06be6147, %l7 = 000000000000006f
	swapa	[%i0+%o5]0x81,%l7	! %l7 = 0000000006be6147
!	Starting 10 instruction Load Burst
!	Mem[00000000100c142c] = ffbd5252, %l4 = 000000005392059d
	lduwa	[%i3+0x02c]%asi,%l4	! %l4 = 00000000ffbd5252

p0_label_35:
!	Mem[0000000030141410] = 475807ff, %l7 = 0000000006be6147
	lduba	[%i5+%o5]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010001400] = 0000bdf8ad075847, %l7 = 00000000000000ff
	ldxa	[%i0+%g0]0x88,%l7	! %l7 = 0000bdf8ad075847
!	%l0 = 8dcb10e00fb57dcc, %l7 = 0000bdf8ad075847, %l7 = 0000bdf8ad075847
	sdivx	%l0,%l7,%l7		! %l7 = ffffffffffff661a
!	Mem[00000000300c1400] = 9d0592535d6c91ff, %l5 = 0000000000000000
	ldxa	[%i3+%g0]0x89,%l5	! %l5 = 9d0592535d6c91ff
!	Mem[0000000030081410] = 1c9746b4, %l1 = 71051768679babfd
	lduha	[%i2+%o5]0x81,%l1	! %l1 = 0000000000001c97
!	Mem[0000000030041408] = ceff3c64d716db66, %l3 = 000000003196410b
	ldxa	[%i1+%o4]0x81,%l3	! %l3 = ceff3c64d716db66
!	Mem[0000000030181408] = 4e0cafcb894dd97c, %f20 = ffbd5252 152b3a1b
	ldda	[%i6+%o4]0x81,%f20	! %f20 = 4e0cafcb 894dd97c
	membar	#Sync			! Added by membar checker (5)
!	Mem[0000000010141400] = 00000000 5d6c9105 00000000 c21c7cd0
!	Mem[0000000010141410] = ada1cdf6 a9b368b9 ea8bb376 ef4c33cb
!	Mem[0000000010141420] = 9475851b 0000005d 00000000 00002dc5
!	Mem[0000000010141430] = 643cffce 3196410b 459e43d8 616cdd61
	ldda	[%i5]ASI_BLK_P,%f16	! Block Load from 0000000010141400
!	Mem[0000000010001408] = 05916c5d, %l0 = 8dcb10e00fb57dcc
	ldsba	[%i0+%o4]0x88,%l0	! %l0 = 000000000000005d
!	Starting 10 instruction Store Burst
!	Mem[00000000201c0001] = ffd66bf6, %l1 = 0000000000001c97
	ldstuba	[%o0+0x001]%asi,%l1	! %l1 = 000000d6000000ff

p0_label_36:
!	%l6 = fffffffff6cda1ad, %l2 = 00000000643cffce, %l6  = fffffffff6cda1ad
	mulx	%l6,%l2,%l6		! %l6 = fc662228e60f6c36
!	%l4 = ffbd5252, %l5 = 5d6c91ff, Mem[00000000100c1408] = 47000000 7cd94d89
	stda	%l4,[%i3+%o4]0x88	! Mem[00000000100c1408] = ffbd5252 5d6c91ff
!	%l5 = 9d0592535d6c91ff, %l5 = 9d0592535d6c91ff, %y  = 00000003
	sdiv	%l5,%l5,%l7		! %l7 = 0000000000000009
	mov	%l0,%y			! %y = 0000005d
!	%l1 = 00000000000000d6, Mem[00000000211c0000] = 1262c666, %asi = 80
	stha	%l1,[%o2+0x000]%asi	! Mem[00000000211c0000] = 00d6c666
!	Mem[0000000010101400] = 9d059253, %l4 = 00000000ffbd5252
	ldstuba	[%i4+%g0]0x80,%l4	! %l4 = 0000009d000000ff
!	%l4 = 000000000000009d, immd = 00000000000004c9, %l7  = 0000000000000009
	mulx	%l4,0x4c9,%l7		! %l7 = 000000000002ef45
!	Mem[0000000010081400] = 00000000, %l1 = 00000000000000d6
	swapa	[%i2+%g0]0x88,%l1	! %l1 = 0000000000000000
!	%f16 = 00000000 5d6c9105 00000000 c21c7cd0
!	%f20 = ada1cdf6 a9b368b9 ea8bb376 ef4c33cb
!	%f24 = 9475851b 0000005d 00000000 00002dc5
!	%f28 = 643cffce 3196410b 459e43d8 616cdd61
	stda	%f16,[%i5]ASI_COMMIT_P	! Block Store to 0000000010141400
	membar	#Sync			! Added by membar checker (6)
!	%l4 = 0000009d, %l5 = 5d6c91ff, Mem[0000000010141408] = 00000000 c21c7cd0
	stda	%l4,[%i5+%o4]0x80	! Mem[0000000010141408] = 0000009d 5d6c91ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030081410] = 1c9746b4, %l1 = 0000000000000000
	lduba	[%i2+%o5]0x81,%l1	! %l1 = 000000000000001c

p0_label_37:
!	Mem[0000000020800000] = afcb98bf, %l1 = 000000000000001c
	ldsba	[%o1+0x000]%asi,%l1	! %l1 = ffffffffffffffaf
!	Mem[00000000300c1408] = 894dd97c, %l1 = ffffffffffffffaf
	lduha	[%i3+%o4]0x89,%l1	! %l1 = 000000000000d97c
!	Mem[0000000010081418] = cfa6de82 7f78326f, %l6 = e60f6c36, %l7 = 0002ef45
	ldda	[%i2+0x018]%asi,%l6	! %l6 = 00000000cfa6de82 000000007f78326f
!	Mem[0000000010181434] = b58e6063, %l0 = 000000000000005d
	ldsh	[%i6+0x034],%l0		! %l0 = ffffffffffffb58e
!	Mem[0000000030041400] = 00000000, %l3 = ceff3c64d716db66
	ldswa	[%i1+%g0]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000030141400] = 6334b2ee, %l4 = 000000000000009d
	lduwa	[%i5+%g0]0x81,%l4	! %l4 = 000000006334b2ee
!	Mem[0000000030041400] = 00000000, %f11 = ffbd5252
	lda	[%i1+%g0]0x81,%f11	! %f11 = 00000000
!	%f1  = 75cdefd2, %f11 = 00000000, %f26 = 00000000
	fadds	%f1 ,%f11,%f26		! %f26 = 75cdefd2
!	Mem[0000000010181400] = ff5807ad, %l5 = 9d0592535d6c91ff
	ldswa	[%i6+%g0]0x80,%l5	! %l5 = ffffffffff5807ad
!	Starting 10 instruction Store Burst
!	%l2 = 00000000643cffce, Mem[0000000010041413] = 1cc270ca
	stb	%l2,[%i1+0x013]		! Mem[0000000010041410] = 1cc270ce

p0_label_38:
!	Mem[0000000020800000] = afcb98bf, %l4 = 000000006334b2ee
	ldstuba	[%o1+0x000]%asi,%l4	! %l4 = 000000af000000ff
!	%l4 = 00000000000000af, %l5 = ffffffffff5807ad, %l6 = 00000000cfa6de82
	subc	%l4,%l5,%l6		! %l6 = 0000000000a7f902
!	%l0 = ffffffffffffb58e, Mem[00000000300c1408] = 894dd97c
	stba	%l0,[%i3+%o4]0x89	! Mem[00000000300c1408] = 894dd98e
!	%l0 = ffffffffffffb58e, Mem[0000000030141410] = 475807ff
	stwa	%l0,[%i5+%o5]0x89	! Mem[0000000030141410] = ffffb58e
!	%l2 = 00000000643cffce, Mem[00000000300c1410] = 917ea0d4
	stha	%l2,[%i3+%o5]0x89	! Mem[00000000300c1410] = 917effce
!	%l4 = 00000000000000af, Mem[0000000010141400] = 00000000
	stba	%l4,[%i5+%g0]0x88	! Mem[0000000010141400] = 000000af
!	Mem[0000000010001400] = 475807ad, %l7 = 7f78326f, %l2 = 643cffce
	casa	[%i0]0x80,%l7,%l2	! %l2 = 00000000475807ad
!	Mem[0000000030101400] = ffbd5252, %l2 = 00000000475807ad
	swapa	[%i4+%g0]0x81,%l2	! %l2 = 00000000ffbd5252
!	Mem[0000000010181408] = 00000000, %l7 = 000000007f78326f
	swapa	[%i6+%o4]0x88,%l7	! %l7 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = 00000000159ad392, %l3 = 0000000000000000
	ldxa	[%i1+%g0]0x81,%l3	! %l3 = 00000000159ad392

p0_label_39:
!	Mem[0000000010041400] = ea320000a4080000, %f18 = 00000000 c21c7cd0
	ldda	[%i1+%g0]0x88,%f18	! %f18 = ea320000 a4080000
!	%l7 = 0000000000000000, %l7 = 0000000000000000, %l4 = 00000000000000af
	sub	%l7,%l7,%l4		! %l4 = 0000000000000000
!	Mem[0000000010001400] = 475807ad, %l4 = 0000000000000000
	ldsh	[%i0+%g0],%l4		! %l4 = 0000000000004758
!	Mem[0000000010181420] = c1e6ac7d0b419631, %l3 = 00000000159ad392
	ldx	[%i6+0x020],%l3		! %l3 = c1e6ac7d0b419631
!	Mem[0000000010101408] = fff6132a5d83b765, %l6 = 0000000000a7f902
	ldxa	[%i4+%o4]0x88,%l6	! %l6 = fff6132a5d83b765
!	Mem[0000000010081400] = d6000000, %l4 = 0000000000004758
	ldswa	[%i2+%g0]0x80,%l4	! %l4 = ffffffffd6000000
!	Mem[0000000010101408] = 65b7835d2a13f6ff, %f12 = 1b854151 ca706904
	ldda	[%i4+%o4]0x80,%f12	! %f12 = 65b7835d 2a13f6ff
!	Mem[0000000010181410] = 04706a57, %l0 = ffffffffffffb58e
	ldsba	[%i6+%o5]0x80,%l0	! %l0 = 0000000000000004
!	Mem[00000000100c1408] = 5252bdffff916c5d, %l5 = ffffffffff5807ad
	ldxa	[%i3+%o4]0x80,%l5	! %l5 = 5252bdffff916c5d
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1408] = 8ed94d89, %l0 = 0000000000000004
	swapa	[%i3+%o4]0x81,%l0	! %l0 = 000000008ed94d89

p0_label_40:
!	%l5 = 5252bdffff916c5d, Mem[0000000010081404] = 00000000, %asi = 80
	stha	%l5,[%i2+0x004]%asi	! Mem[0000000010081404] = 6c5d0000
!	Mem[0000000010101410] = 07e647ff, %l6 = fff6132a5d83b765
	ldstuba	[%i4+%o5]0x88,%l6	! %l6 = 000000ff000000ff
!	%f10 = 9ac0a24d, Mem[0000000010041400] = 000008a4
	sta	%f10,[%i1+%g0]0x80	! Mem[0000000010041400] = 9ac0a24d
!	Mem[0000000010101408] = 65b7835d, %l7 = 0000000000000000, %asi = 80
	swapa	[%i4+0x008]%asi,%l7	! %l7 = 0000000065b7835d
!	Mem[0000000030141408] = 20eaedab 633b6aad, %l0 = 8ed94d89, %l1 = 0000d97c
	ldda	[%i5+%o4]0x89,%l0	! %l0 = 00000000633b6aad 0000000020eaedab
!	Mem[0000000010181408] = 7f78326f, %l0 = 00000000633b6aad
	ldstuba	[%i6+%o4]0x88,%l0	! %l0 = 0000006f000000ff
!	%l1 = 0000000020eaedab, Mem[0000000030001400] = acf2e6ff
	stwa	%l1,[%i0+%g0]0x89	! Mem[0000000030001400] = 20eaedab
!	%l5 = 5252bdffff916c5d, Mem[0000000010041408] = 00000000
	stwa	%l5,[%i1+%o4]0x88	! Mem[0000000010041408] = ff916c5d
!	%l0 = 000000000000006f, Mem[0000000030081408] = 1b3a2b155252bdff
	stxa	%l0,[%i2+%o4]0x81	! Mem[0000000030081408] = 000000000000006f
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = ff059253 5d6c9105, %l4 = d6000000, %l5 = ff916c5d
	ldda	[%i4+0x000]%asi,%l4	! %l4 = 00000000ff059253 000000005d6c9105

p0_label_41:
!	Mem[0000000030081408] = 00000000, %l0 = 000000000000006f
	ldsha	[%i2+%o4]0x89,%l0	! %l0 = 0000000000000000
!	%l5 = 000000005d6c9105, Mem[0000000021800000] = 48091cea
	stb	%l5,[%o3+%g0]		! Mem[0000000021800000] = 05091cea
!	Mem[0000000030181408] = 4e0cafcb, %l7 = 0000000065b7835d
	lduha	[%i6+%o4]0x81,%l7	! %l7 = 0000000000004e0c
!	Mem[0000000010081400] = 00005d6c000000d6, %l3 = c1e6ac7d0b419631
	ldxa	[%i2+%g0]0x88,%l3	! %l3 = 00005d6c000000d6
!	Mem[00000000300c1410] = ceff7e91, %l4 = 00000000ff059253
	lduha	[%i3+%o5]0x81,%l4	! %l4 = 000000000000ceff
!	Mem[0000000030141410] = 8eb5ffff 00001262, %l6 = 000000ff, %l7 = 00004e0c
	ldda	[%i5+%o5]0x81,%l6	! %l6 = 000000008eb5ffff 0000000000001262
!	Mem[0000000030001410] = 6f000000, %l5 = 000000005d6c9105
	lduha	[%i0+%o5]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000021800000] = 05091cea, %l7 = 0000000000001262
	lduba	[%o3+0x000]%asi,%l7	! %l7 = 0000000000000005
!	Mem[0000000030101400] = 475807ad, %l4 = 000000000000ceff
	ldsba	[%i4+%g0]0x81,%l4	! %l4 = 0000000000000047
!	Starting 10 instruction Store Burst
!	Mem[0000000010181414] = 2dc5892e, %l7 = 0000000000000005
	swap	[%i6+0x014],%l7		! %l7 = 000000002dc5892e

p0_label_42:
!	Mem[0000000010101438] = 049f032f97340d73, %l5 = 0000000000000000, %l3 = 00005d6c000000d6
	add	%i4,0x38,%g1
	casxa	[%g1]0x80,%l5,%l3	! %l3 = 049f032f97340d73
!	%l6 = 000000008eb5ffff, Mem[00000000300c1408] = 00000004
	stwa	%l6,[%i3+%o4]0x81	! Mem[00000000300c1408] = 8eb5ffff
!	%l6 = 000000008eb5ffff, Mem[0000000030101408] = 00000000
	stwa	%l6,[%i4+%o4]0x81	! Mem[0000000030101408] = 8eb5ffff
!	%l0 = 0000000000000000, Mem[0000000030001408] = ffffbdff
	stba	%l0,[%i0+%o4]0x89	! Mem[0000000030001408] = ffffbd00
!	%f22 = ea8bb376 ef4c33cb, %l1 = 0000000020eaedab
!	Mem[0000000030081400] = ff916c5dcbaf0c4e
	stda	%f22,[%i2+%l1]ASI_PST8_SL ! Mem[0000000030081400] = cb336cefcbb30cea
!	Mem[0000000010001400] = 475807ad, %l7 = 000000002dc5892e
	ldstuba	[%i0+0x000]%asi,%l7	! %l7 = 00000047000000ff
!	Mem[0000000010101400] = 539205ff, %l6 = 000000008eb5ffff
	ldstuba	[%i4+%g0]0x88,%l6	! %l6 = 000000ff000000ff
!	Mem[0000000030101400] = ad075847, %l0 = 0000000000000000
	swapa	[%i4+%g0]0x89,%l0	! %l0 = 00000000ad075847
!	%f2  = 07310f86 894dd97c, Mem[00000000300c1408] = 8eb5ffff 860f3107
	stda	%f2 ,[%i3+%o4]0x81	! Mem[00000000300c1408] = 07310f86 894dd97c
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = 07310f86 894dd97c, %l0 = ad075847, %l1 = 20eaedab
	ldda	[%i3+%o4]0x81,%l0	! %l0 = 0000000007310f86 00000000894dd97c

p0_label_43:
!	Mem[0000000030081410] = 1c9746b4, %l0 = 0000000007310f86
	ldsba	[%i2+%o5]0x81,%l0	! %l0 = 000000000000001c
!	Mem[0000000010141410] = f6cda1ad, %l1 = 00000000894dd97c
	ldsha	[%i5+%o5]0x88,%l1	! %l1 = ffffffffffffa1ad
!	Mem[0000000030101410] = af33fafa ff916c5d, %l0 = 0000001c, %l1 = ffffa1ad
	ldda	[%i4+%o5]0x89,%l0	! %l0 = 00000000ff916c5d 00000000af33fafa
!	Mem[0000000010041438] = bad76926, %l1 = 00000000af33fafa
	ldsba	[%i1+0x039]%asi,%l1	! %l1 = ffffffffffffffd7
	membar	#Sync			! Added by membar checker (7)
!	Mem[0000000030101400] = 00000000 152b3a1b 8eb5ffff 0000005d
!	Mem[0000000030101410] = 5d6c91ff fafa33af d792467c ef4709a9
!	Mem[0000000030101420] = 037702eb 0be2dfdd 21de0004 d42070cc
!	Mem[0000000030101430] = 8907f971 0ed1e18a ec217703 4e0f0307
	ldda	[%i4]ASI_BLK_SL,%f16	! Block Load from 0000000030101400
!	Mem[0000000030181410] = cbaf0c4e, %f7  = 2a13f6ff
	lda	[%i6+%o5]0x89,%f7 	! %f7 = cbaf0c4e
!	Mem[0000000030081410] = 1c9746b4, %f2  = 07310f86
	lda	[%i2+%o5]0x81,%f2 	! %f2 = 1c9746b4
!	Mem[0000000010081408] = 8c902051, %l0 = 00000000ff916c5d
	lduwa	[%i2+%o4]0x80,%l0	! %l0 = 000000008c902051
!	Mem[0000000010181438] = 6f32787f6a315fc1, %f12 = 65b7835d 2a13f6ff
	ldd	[%i6+0x038],%f12	! %f12 = 6f32787f 6a315fc1
!	Starting 10 instruction Store Burst
!	%f10 = 9ac0a24d 00000000, %l1 = ffffffffffffffd7
!	Mem[0000000010001428] = 5a92fb9b49d22fad
	add	%i0,0x028,%g1
	stda	%f10,[%g1+%l1]ASI_PST32_PL ! Mem[0000000010001428] = 000000004da2c09a

p0_label_44:
!	%l6 = 00000000000000ff, Mem[0000000010141400] = af000000
	stha	%l6,[%i5+%g0]0x80	! Mem[0000000010141400] = 00ff0000
!	%f12 = 6f32787f 6a315fc1, Mem[0000000030081400] = cb336cef cbb30cea
	stda	%f12,[%i2+%g0]0x81	! Mem[0000000030081400] = 6f32787f 6a315fc1
!	%f0  = 3196410b 75cdefd2, Mem[0000000010101410] = 07e647ff af6a15ff
	stda	%f0 ,[%i4+%o5]0x88	! Mem[0000000010101410] = 3196410b 75cdefd2
!	Mem[0000000030181400] = cbaf0c4e, %l3 = 049f032f97340d73
	swapa	[%i6+%g0]0x81,%l3	! %l3 = 00000000cbaf0c4e
!	Mem[00000000300c1400] = 5d6c91ff, %l7 = 0000000000000047
	ldstuba	[%i3+%g0]0x89,%l7	! %l7 = 000000ff000000ff
!	Mem[00000000211c0000] = 00d6c666, %l2 = 00000000ffbd5252
	ldstub	[%o2+%g0],%l2		! %l2 = 00000000000000ff
!	Mem[00000000300c1408] = 860f3107, %l3 = 00000000cbaf0c4e
	swapa	[%i3+%o4]0x89,%l3	! %l3 = 00000000860f3107
!	%f10 = 9ac0a24d 00000000, %f14 = ff916c5d 5392059d
	fdtox	%f10,%f14		! %f14 = 00000000 00000000
!	%l2 = 0000000000000000, Mem[00000000300c1400] = ff916c5d
	stwa	%l2,[%i3+%g0]0x81	! Mem[00000000300c1400] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = 00000000, %l3 = 00000000860f3107
	lduwa	[%i3+%g0]0x89,%l3	! %l3 = 0000000000000000

p0_label_45:
!	Mem[0000000030101410] = 5d6c91ff, %l5 = 0000000000000000
	lduwa	[%i4+%o5]0x81,%l5	! %l5 = 000000005d6c91ff
!	Mem[0000000030101410] = af33fafaff916c5d, %l4 = 0000000000000047
	ldxa	[%i4+%o5]0x89,%l4	! %l4 = af33fafaff916c5d
!	Mem[0000000030181408] = 7cd94d89cbaf0c4e, %l1 = ffffffffffffffd7
	ldxa	[%i6+%o4]0x89,%l1	! %l1 = 7cd94d89cbaf0c4e
!	Mem[0000000010181408] = ff32787f, %l6 = 00000000000000ff
	lduba	[%i6+0x008]%asi,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010101400] = ff059253, %l7 = 00000000000000ff
	ldsh	[%i4+%g0],%l7		! %l7 = ffffffffffffff05
!	Mem[00000000100c1438] = b968b3a9f6cda1ad, %l5 = 000000005d6c91ff
	ldx	[%i3+0x038],%l5		! %l5 = b968b3a9f6cda1ad
!	Mem[0000000010101410] = 3196410b75cdefd2, %f14 = 00000000 00000000
	ldda	[%i4+%o5]0x88,%f14	! %f14 = 3196410b 75cdefd2
!	Mem[0000000030001410] = 972b8da26f000000, %f14 = 3196410b 75cdefd2
	ldda	[%i0+%o5]0x89,%f14	! %f14 = 972b8da2 6f000000
!	Mem[0000000021800080] = 00ff2e32, %l4 = af33fafaff916c5d
	ldsha	[%o3+0x080]%asi,%l4	! %l4 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l0 = 000000008c902051, Mem[0000000010041408] = ff916c5d
	stha	%l0,[%i1+%o4]0x88	! Mem[0000000010041408] = ff912051

p0_label_46:
!	Mem[00000000100c1410] = 05916c5d, %l3 = 0000000000000000
	ldstuba	[%i3+%o5]0x80,%l3	! %l3 = 00000005000000ff
!	%l6 = 000000ff, %l7 = ffffff05, Mem[00000000100c1410] = 5d6c91ff 9d059253
	stda	%l6,[%i3+%o5]0x88	! Mem[00000000100c1410] = 000000ff ffffff05
!	%f9  = 1fcd8dc7, Mem[0000000030001410] = 6f000000
	sta	%f9 ,[%i0+%o5]0x89	! Mem[0000000030001410] = 1fcd8dc7
!	Mem[0000000010001412] = 159ad392, %l1 = 7cd94d89cbaf0c4e
	ldstuba	[%i0+0x012]%asi,%l1	! %l1 = 000000d3000000ff
!	Mem[0000000030041410] = f1000000, %l0 = 000000008c902051
	ldstuba	[%i1+%o5]0x89,%l0	! %l0 = 00000000000000ff
!	%l0 = 00000000, %l1 = 000000d3, Mem[0000000030181410] = cbaf0c4e 06be6147
	stda	%l0,[%i6+%o5]0x89	! Mem[0000000030181410] = 00000000 000000d3
!	%l4 = 00000000000000ff, Mem[0000000030081408] = 000000000000006f
	stxa	%l4,[%i2+%o4]0x81	! Mem[0000000030081408] = 00000000000000ff
!	Mem[0000000030001410] = 1fcd8dc7, %l0 = 0000000000000000
	ldstuba	[%i0+%o5]0x89,%l0	! %l0 = 000000c7000000ff
!	%l7 = ffffffffffffff05, Mem[0000000021800101] = 4991ee79, %asi = 80
	stba	%l7,[%o3+0x101]%asi	! Mem[0000000021800100] = 4905ee79
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = 04706a57, %l5 = b968b3a9f6cda1ad
	ldswa	[%i6+%o5]0x80,%l5	! %l5 = 0000000004706a57

p0_label_47:
!	Mem[0000000010101428] = 43a2396f 159a00ff, %l0 = 000000c7, %l1 = 000000d3
	ldd	[%i4+0x028],%l0		! %l0 = 0000000043a2396f 00000000159a00ff
!	Mem[0000000010101408] = 00000000, %l1 = 00000000159a00ff
	ldswa	[%i4+%o4]0x88,%l1	! %l1 = 0000000000000000
!	Mem[00000000100c1400] = 9d059253, %l2 = 0000000000000000
	ldsba	[%i3+%g0]0x80,%l2	! %l2 = ffffffffffffff9d
!	Mem[0000000030141408] = ad6a3b63abedea20, %l0 = 0000000043a2396f
	ldxa	[%i5+%o4]0x81,%l0	! %l0 = ad6a3b63abedea20
!	Mem[0000000010001408] = 5d6c9105, %l2 = ffffffffffffff9d
	lduha	[%i0+%o4]0x80,%l2	! %l2 = 0000000000005d6c
!	Mem[0000000030141410] = 62120000ffffb58e, %l1 = 0000000000000000
	ldxa	[%i5+%o5]0x89,%l1	! %l1 = 62120000ffffb58e
!	Mem[0000000030101400] = 00000000 152b3a1b 8eb5ffff 0000005d
!	Mem[0000000030101410] = 5d6c91ff fafa33af d792467c ef4709a9
!	Mem[0000000030101420] = 037702eb 0be2dfdd 21de0004 d42070cc
!	Mem[0000000030101430] = 8907f971 0ed1e18a ec217703 4e0f0307
	ldda	[%i4]ASI_BLK_S,%f16	! Block Load from 0000000030101400
!	Mem[0000000030141410] = ffffb58e, %l7 = ffffffffffffff05
	lduba	[%i5+%o5]0x89,%l7	! %l7 = 000000000000008e
!	Mem[0000000010101410] = 3196410b75cdefd2, %f6  = 65b7835d cbaf0c4e
	ldda	[%i4+%o5]0x88,%f6 	! %f6  = 3196410b 75cdefd2
!	Starting 10 instruction Store Burst
!	%l0 = ad6a3b63abedea20, Mem[0000000030181410] = 00000000
	stha	%l0,[%i6+%o5]0x81	! Mem[0000000030181410] = ea200000

p0_label_48:
!	%f8  = cfa6de82, Mem[0000000010001410] = 159aff92
	sta	%f8 ,[%i0+0x010]%asi	! Mem[0000000010001410] = cfa6de82
!	%f1  = 75cdefd2, Mem[00000000100c1408] = 5252bdff
	sta	%f1 ,[%i3+%o4]0x80	! Mem[00000000100c1408] = 75cdefd2
!	%f8  = cfa6de82, %f2  = 1c9746b4, %f1  = 75cdefd2
	fadds	%f8 ,%f2 ,%f1 		! %f1  = cfa6de82
!	Mem[0000000030081400] = 7f78326f, %l6 = 00000000000000ff
	swapa	[%i2+%g0]0x89,%l6	! %l6 = 000000007f78326f
!	%l0 = ad6a3b63abedea20, immed = fffff2ee, %y  = 0000005d
	umul	%l0,-0xd12,%l0		! %l0 = abede158d461e9c0, %y = abede158
!	%l5 = 0000000004706a57, Mem[000000001018140c] = 5392059d
	stw	%l5,[%i6+0x00c]		! Mem[000000001018140c] = 04706a57
!	%l4 = 00000000000000ff, Mem[00000000300c1408] = cbaf0c4e
	stba	%l4,[%i3+%o4]0x89	! Mem[00000000300c1408] = cbaf0cff
!	Mem[0000000030141400] = 6334b2ee, %l5 = 0000000004706a57
	ldstuba	[%i5+%g0]0x81,%l5	! %l5 = 00000063000000ff
!	Mem[0000000010181438] = 6f32787f, %l3 = 0000000000000005
	swap	[%i6+0x038],%l3		! %l3 = 000000006f32787f
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = 730d3497, %l2 = 0000000000005d6c
	lduba	[%i6+%g0]0x89,%l2	! %l2 = 0000000000000097

p0_label_49:
!	Mem[0000000030041410] = f10000ff, %f7  = 75cdefd2
	lda	[%i1+%o5]0x89,%f7 	! %f7 = f10000ff
	membar	#Sync			! Added by membar checker (8)
!	Mem[0000000030001400] = abedea20 397ae14f 00bdffff 89984b24
!	Mem[0000000030001410] = ff8dcd1f a28d2b97 3fd4f6b1 6bac2748
!	Mem[0000000030001420] = 5e1274e7 a4e0e78b 189119a2 0ffe00ee
!	Mem[0000000030001430] = d19d02da d35f234f 04089650 a7ce975d
	ldda	[%i0]ASI_BLK_SL,%f0	! Block Load from 0000000030001400
!	Mem[0000000010141408] = 0000009d, %f27 = d42070cc
	lda	[%i5+%o4]0x80,%f27	! %f27 = 0000009d
!	Mem[0000000030101408] = 5d000000ffffb58e, %f26 = 21de0004 0000009d
	ldda	[%i4+%o4]0x89,%f26	! %f26 = 5d000000 ffffb58e
!	Mem[0000000010001408] = 5d6c9105, %l1 = 62120000ffffb58e
	lduha	[%i0+%o4]0x80,%l1	! %l1 = 0000000000005d6c
!	Mem[0000000010181400] = ff5807ada28d2b97, %l1 = 0000000000005d6c
	ldxa	[%i6+%g0]0x80,%l1	! %l1 = ff5807ada28d2b97
!	Mem[0000000010181404] = a28d2b97, %l7 = 000000000000008e
	ldsw	[%i6+0x004],%l7		! %l7 = ffffffffa28d2b97
!	Mem[0000000010101400] = ff059253, %l0 = abede158d461e9c0
	lduba	[%i4+%g0]0x80,%l0	! %l0 = 00000000000000ff
!	Mem[00000000100c1410] = ff00000005ffffff, %l2 = 0000000000000097
	ldxa	[%i3+%o5]0x80,%l2	! %l2 = ff00000005ffffff
!	Starting 10 instruction Store Burst
!	%f22 = d792467c ef4709a9, %l4 = 00000000000000ff
!	Mem[00000000300c1438] = c41d1ee24bdac1b2
	add	%i3,0x038,%g1
	stda	%f22,[%g1+%l4]ASI_PST16_S ! Mem[00000000300c1438] = d792467cef4709a9

p0_label_50:
!	Mem[00000000100c1408] = 75cdefd2 ff916c5d, %l6 = 7f78326f, %l7 = a28d2b97
	ldda	[%i3+%o4]0x80,%l6	! %l6 = 0000000075cdefd2 00000000ff916c5d
!	Mem[0000000010141408] = 0000009d, %l5 = 00000063, %l4 = 000000ff
	add	%i5,0x08,%g1
	casa	[%g1]0x80,%l5,%l4	! %l4 = 000000000000009d
!	%f16 = 00000000 152b3a1b, Mem[0000000010181400] = ff5807ad a28d2b97
	stda	%f16,[%i6+%g0]0x80	! Mem[0000000010181400] = 00000000 152b3a1b
!	Code Fragment 4
p0_fragment_7:
!	%l0 = 00000000000000ff
	setx	0x5d76dad825c0e2da,%g7,%l0 ! %l0 = 5d76dad825c0e2da
!	%l1 = ff5807ada28d2b97
	setx	0xf1b88370438c0343,%g7,%l1 ! %l1 = f1b88370438c0343
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 5d76dad825c0e2da
	setx	0x4843c1b875046c58,%g7,%l0 ! %l0 = 4843c1b875046c58
!	%l1 = f1b88370438c0343
	setx	0x632db8dfcf5756dd,%g7,%l1 ! %l1 = 632db8dfcf5756dd
	membar	#Sync			! Added by membar checker (9)
!	%l6 = 75cdefd2, %l7 = ff916c5d, Mem[0000000030001408] = 00bdffff 89984b24
	stda	%l6,[%i0+%o4]0x81	! Mem[0000000030001408] = 75cdefd2 ff916c5d
!	%f26 = 5d000000 ffffb58e, Mem[0000000010041408] = 512091ff 38bbe9e4
	stda	%f26,[%i1+%o4]0x80	! Mem[0000000010041408] = 5d000000 ffffb58e
!	Mem[0000000010141410] = ada1cdf6, %l4 = 000000000000009d
	swapa	[%i5+%o5]0x80,%l4	! %l4 = 00000000ada1cdf6
!	Mem[00000000300c1408] = cbaf0cff, %l0 = 4843c1b875046c58
	ldstuba	[%i3+%o4]0x89,%l0	! %l0 = 000000ff000000ff
!	%f22 = d792467c ef4709a9, %l2 = ff00000005ffffff
!	Mem[00000000300c1400] = 000000005392059d
	stda	%f22,[%i3+%l2]ASI_PST32_S ! Mem[00000000300c1400] = d792467cef4709a9
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = 62120000ffffb58e, %f0  = 4fe17a39 20eaedab
	ldda	[%i5+%o5]0x89,%f0 	! %f0  = 62120000 ffffb58e

p0_label_51:
!	Mem[0000000010001408] = 5d6c91059d056f81, %l3 = 000000006f32787f
	ldxa	[%i0+%o4]0x80,%l3	! %l3 = 5d6c91059d056f81
!	Mem[00000000300c1410] = ceff7e91, %l6 = 0000000075cdefd2
	ldsha	[%i3+%o5]0x81,%l6	! %l6 = ffffffffffffceff
!	Mem[00000000100c1410] = ff000000, %l4 = 00000000ada1cdf6
	lduba	[%i3+%o5]0x80,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030001400] = abedea20397ae14f, %l0 = 00000000000000ff
	ldxa	[%i0+%g0]0x81,%l0	! %l0 = abedea20397ae14f
!	%l0 = 397ae14f, %l1 = cf5756dd, Mem[0000000010041410] = ce70c21c 00000000
	stda	%l0,[%i1+%o5]0x88	! Mem[0000000010041410] = 397ae14f cf5756dd
!	Mem[0000000010101410] = d2efcd75, %l0 = abedea20397ae14f
	ldsw	[%i4+%o5],%l0		! %l0 = ffffffffd2efcd75
!	Mem[0000000010141410] = 0000009d, %l4 = 00000000000000ff
	ldswa	[%i5+0x010]%asi,%l4	! %l4 = 000000000000009d
!	Mem[0000000021800100] = 4905ee79, %l6 = ffffffffffffceff
	ldsb	[%o3+0x100],%l6		! %l6 = 0000000000000049
!	Mem[00000000300c1410] = ceff7e914079611f, %l7 = 00000000ff916c5d
	ldxa	[%i3+%o5]0x81,%l7	! %l7 = ceff7e914079611f
!	Starting 10 instruction Store Burst
!	%f0  = 62120000 ffffb58e, %l7 = ceff7e914079611f
!	Mem[0000000010141438] = 459e43d8616cdd61
	add	%i5,0x038,%g1
	stda	%f0,[%g1+%l7]ASI_PST16_P ! Mem[0000000010141438] = 62120000ffffb58e

p0_label_52:
!	%l1 = 632db8dfcf5756dd, immed = fffffc51, %y  = abede158
	sdiv	%l1,-0x3af,%l2		! %l2 = 000000007fffffff
	mov	%l0,%y			! %y = d2efcd75
!	%l0 = ffffffffd2efcd75, Mem[0000000030101408] = ffffb58e
	stba	%l0,[%i4+%o4]0x89	! Mem[0000000030101408] = ffffb575
!	%l7 = ceff7e914079611f, Mem[0000000010041402] = 9ac0a24d
	sth	%l7,[%i1+0x002]		! Mem[0000000010041400] = 9ac0611f
!	%f26 = 5d000000 ffffb58e, Mem[0000000010101408] = 00000000 2a13f6ff
	stda	%f26,[%i4+%o4]0x80	! Mem[0000000010101408] = 5d000000 ffffb58e
!	Mem[00000000300c1408] = ff0cafcb, %l2 = 000000007fffffff
	ldstuba	[%i3+%o4]0x81,%l2	! %l2 = 000000ff000000ff
!	%l7 = ceff7e914079611f, Mem[0000000030101400] = 00000000
	stha	%l7,[%i4+%g0]0x89	! Mem[0000000030101400] = 0000611f
!	%f30 = ec217703 4e0f0307, %l5 = 0000000000000063
!	Mem[0000000030001408] = 75cdefd2ff916c5d
	add	%i0,0x008,%g1
	stda	%f30,[%g1+%l5]ASI_PST32_S ! Mem[0000000030001408] = ec2177034e0f0307
!	%l4 = 0000009d, %l5 = 00000063, Mem[0000000030001400] = 20eaedab 4fe17a39
	stda	%l4,[%i0+%g0]0x89	! Mem[0000000030001400] = 0000009d 00000063
!	Mem[0000000030041400] = 00000000, %l7 = ceff7e914079611f
	swapa	[%i1+%g0]0x81,%l7	! %l7 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = 1f617940, %l2 = 00000000000000ff
	lduha	[%i1+%g0]0x89,%l2	! %l2 = 0000000000007940

p0_label_53:
!	Mem[0000000010141410] = 0000009d, %l3 = 5d6c91059d056f81
	lduh	[%i5+0x012],%l3		! %l3 = 000000000000009d
!	Mem[0000000010041408] = 5d000000ffffb58e, %f22 = d792467c ef4709a9
	ldda	[%i1+0x008]%asi,%f22	! %f22 = 5d000000 ffffb58e
!	Mem[0000000030081408] = ff00000000000000, %f6  = 4827ac6b b1f6d43f
	ldda	[%i2+%o4]0x89,%f6 	! %f6  = ff000000 00000000
!	Mem[0000000030041410] = ff0000f1, %f22 = 5d000000
	lda	[%i1+%o5]0x81,%f22	! %f22 = ff0000f1
!	Mem[0000000010101408] = 5d000000ffffb58e, %f0  = 62120000 ffffb58e
	ldda	[%i4+%o4]0x80,%f0 	! %f0  = 5d000000 ffffb58e
!	Mem[0000000010001408] = 5d6c9105, %f7  = 00000000
	lda	[%i0+%o4]0x80,%f7 	! %f7 = 5d6c9105
!	Mem[0000000010181400] = 00000000, %l4 = 000000000000009d
	ldsha	[%i6+%g0]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000010101410] = d2efcd75, %l3 = 000000000000009d
	lduha	[%i4+%o5]0x80,%l3	! %l3 = 000000000000d2ef
!	Mem[0000000030041410] = f10000ff, %l4 = 0000000000000000
	ldswa	[%i1+%o5]0x89,%l4	! %l4 = fffffffff10000ff
!	Starting 10 instruction Store Burst
!	%l1 = 632db8dfcf5756dd, Mem[0000000030101410] = ff916c5d
	stba	%l1,[%i4+%o5]0x89	! Mem[0000000030101410] = ff916cdd

p0_label_54:
!	Mem[0000000030101410] = ff916cdd, %l0 = ffffffffd2efcd75
	swapa	[%i4+%o5]0x89,%l0	! %l0 = 00000000ff916cdd
!	Mem[0000000030141408] = 633b6aad, %l0 = 00000000ff916cdd
	swapa	[%i5+%o4]0x89,%l0	! %l0 = 00000000633b6aad
!	Mem[0000000030001410] = ff8dcd1f, %l2 = 0000000000007940
	swapa	[%i0+%o5]0x81,%l2	! %l2 = 00000000ff8dcd1f
!	Mem[000000001000141c] = 05916c5d, %l7 = 0000000000000000, %asi = 80
	swapa	[%i0+0x01c]%asi,%l7	! %l7 = 0000000005916c5d
!	Mem[0000000030181410] = ea200000, %l6 = 0000000000000049
	ldstuba	[%i6+%o5]0x81,%l6	! %l6 = 000000ea000000ff
!	Mem[00000000100c1408] = d2efcd75, %l2 = 00000000ff8dcd1f
	ldstuba	[%i3+%o4]0x88,%l2	! %l2 = 00000075000000ff
!	%l5 = 0000000000000063, Mem[0000000010041427] = 000000b9, %asi = 80
	stba	%l5,[%i1+0x027]%asi	! Mem[0000000010041424] = 00000063
!	Mem[0000000030101400] = 1f610000, %l3 = 000000000000d2ef
	ldstuba	[%i4+%g0]0x81,%l3	! %l3 = 0000001f000000ff
!	%l2 = 0000000000000075, Mem[0000000030041408] = 643cffce
	stha	%l2,[%i1+%o4]0x89	! Mem[0000000030041408] = 643c0075
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = 8c902051, %l1 = 632db8dfcf5756dd
	lduba	[%i2+%o4]0x80,%l1	! %l1 = 000000000000008c

p0_label_55:
!	Mem[0000000030001400] = 0000009d, %l5 = 0000000000000063
	ldswa	[%i0+%g0]0x89,%l5	! %l5 = 000000000000009d
!	Mem[00000000300c1410] = ceff7e91, %l5 = 000000000000009d
	ldsba	[%i3+%o5]0x81,%l5	! %l5 = ffffffffffffffce
!	Mem[0000000030001410] = 00007940 a28d2b97, %l0 = 633b6aad, %l1 = 0000008c
	ldda	[%i0+%o5]0x81,%l0	! %l0 = 0000000000007940 00000000a28d2b97
!	Mem[0000000030181408] = 4e0cafcb, %l5 = ffffffffffffffce
	lduha	[%i6+%o4]0x81,%l5	! %l5 = 0000000000004e0c
!	Mem[0000000010101400] = 539205ff, %l6 = 00000000000000ea
	ldsha	[%i4+%g0]0x88,%l6	! %l6 = 00000000000005ff
!	Mem[000000001008141c] = 7f78326f, %l2 = 0000000000000075
	ldsha	[%i2+0x01c]%asi,%l2	! %l2 = 0000000000007f78
!	Mem[0000000010101410] = d2efcd75, %l6 = 00000000000005ff
	ldsha	[%i4+%o5]0x80,%l6	! %l6 = ffffffffffffd2ef
!	%f25 = 0be2dfdd, %f22 = ff0000f1, %f0  = 5d000000 ffffb58e
	fsmuld	%f25,%f22,%f0 		! %f0  = c16c5c31 052fc340
!	Mem[0000000030181408] = 7cd94d89cbaf0c4e, %f4  = 972b8da2 1fcd8dff
	ldda	[%i6+%o4]0x89,%f4 	! %f4  = 7cd94d89 cbaf0c4e
!	Starting 10 instruction Store Burst
!	%l1 = 00000000a28d2b97, Mem[0000000010041400] = ea3200001f61c09a
	stxa	%l1,[%i1+%g0]0x88	! Mem[0000000010041400] = 00000000a28d2b97

p0_label_56:
!	Mem[000000001008142c] = cbaf0c4e, %l4 = fffffffff10000ff, %asi = 80
	swapa	[%i2+0x02c]%asi,%l4	! %l4 = 00000000cbaf0c4e
!	%l3 = 000000000000001f, Mem[0000000030041400] = 4079611f
	stha	%l3,[%i1+%g0]0x81	! Mem[0000000030041400] = 001f611f
!	%f30 = ec217703, %f6  = ff000000, %f29 = 0ed1e18a
	fsubs	%f30,%f6 ,%f29		! %f29 = 7f000000
!	%f31 = 4e0f0307, Mem[0000000030001408] = 037721ec
	sta	%f31,[%i0+%o4]0x89	! Mem[0000000030001408] = 4e0f0307
!	%l6 = ffffd2ef, %l7 = 05916c5d, Mem[00000000100c1410] = ff000000 05ffffff
	stda	%l6,[%i3+0x010]%asi	! Mem[00000000100c1410] = ffffd2ef 05916c5d
!	%l4 = 00000000cbaf0c4e, %l5 = 0000000000004e0c, %y  = d2efcd75
	umul	%l4,%l5,%l6		! %l6 = 00003e18e1f457a8, %y = 00003e18
!	%l7 = 0000000005916c5d, Mem[0000000010001400] = ad0758ff
	stwa	%l7,[%i0+%g0]0x88	! Mem[0000000010001400] = 05916c5d
!	Mem[0000000010001420] = 049f032f, %l6 = e1f457a8, %l1 = a28d2b97
	add	%i0,0x20,%g1
	casa	[%g1]0x80,%l6,%l1	! %l1 = 00000000049f032f
!	%l6 = e1f457a8, %l7 = 05916c5d, Mem[0000000010101408] = 5d000000 ffffb58e
	stda	%l6,[%i4+%o4]0x80	! Mem[0000000010101408] = e1f457a8 05916c5d
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = 397ae14f, %l2 = 0000000000007f78
	ldsba	[%i1+%o5]0x88,%l2	! %l2 = 000000000000004f

p0_label_57:
!	Mem[000000001008141c] = 7f78326f, %l4 = 00000000cbaf0c4e
	ldswa	[%i2+0x01c]%asi,%l4	! %l4 = 000000007f78326f
!	Mem[00000000100c1410] = 5d6c9105 efd2ffff, %l4 = 7f78326f, %l5 = 00004e0c
	ldda	[%i3+%o5]0x88,%l4	! %l4 = 00000000efd2ffff 000000005d6c9105
!	Mem[00000000100c1410] = efd2ffff, %l1 = 00000000049f032f
	lduha	[%i3+%o5]0x88,%l1	! %l1 = 000000000000ffff
!	Mem[0000000010001400] = 05916c5d, %l3 = 000000000000001f
	lduwa	[%i0+%g0]0x88,%l3	! %l3 = 0000000005916c5d
!	Mem[0000000030101400] = 000061ff, %l1 = 000000000000ffff
	lduba	[%i4+%g0]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010181418] = 2697a53f 4e0cafcb, %l4 = efd2ffff, %l5 = 5d6c9105
	ldda	[%i6+0x018]%asi,%l4	! %l4 = 000000002697a53f 000000004e0cafcb
!	%f7  = 5d6c9105, %f24 = 037702eb
	fcmpes	%fcc1,%f7 ,%f24		! %fcc1 = 2
!	Mem[0000000030181400] = 6f32787f730d3497, %f8  = 8be7e0a4 e774125e
	ldda	[%i6+%g0]0x89,%f8 	! %f8  = 6f32787f 730d3497
!	Mem[0000000010041400] = 972b8da2, %l4 = 000000002697a53f
	lduba	[%i1+%g0]0x80,%l4	! %l4 = 0000000000000097
!	Starting 10 instruction Store Burst
!	Mem[0000000010181408] = ff32787f, %l4 = 0000000000000097
	swapa	[%i6+%o4]0x80,%l4	! %l4 = 00000000ff32787f

p0_label_58:
!	Mem[0000000030181400] = 730d3497, %l3 = 0000000005916c5d
	ldstuba	[%i6+%g0]0x89,%l3	! %l3 = 00000097000000ff
!	Mem[0000000010101404] = 5d6c9105, %l7 = 0000000005916c5d
	swap	[%i4+0x004],%l7		! %l7 = 000000005d6c9105
!	Mem[0000000010081410] = 1b3a2b155252bdff, %l5 = 000000004e0cafcb, %l2 = 000000000000004f
	add	%i2,0x10,%g1
	casxa	[%g1]0x80,%l5,%l2	! %l2 = 1b3a2b155252bdff
!	Mem[0000000010101408] = e1f457a8, %l0 = 0000000000007940
	swapa	[%i4+%o4]0x80,%l0	! %l0 = 00000000e1f457a8
!	%f0  = c16c5c31 052fc340, Mem[00000000100c1420] = cfa6de82 1fcd8dc7
	std	%f0 ,[%i3+0x020]	! Mem[00000000100c1420] = c16c5c31 052fc340
!	%l6 = e1f457a8, %l7 = 5d6c9105, Mem[00000000300c1400] = d792467c ef4709a9
	stda	%l6,[%i3+%g0]0x81	! Mem[00000000300c1400] = e1f457a8 5d6c9105
!	Mem[0000000010001408] = 5d6c9105, %l6 = 00003e18e1f457a8
	swapa	[%i0+%o4]0x80,%l6	! %l6 = 000000005d6c9105
!	%f19 = 0000005d, Mem[0000000030141410] = 8eb5ffff
	sta	%f19,[%i5+%o5]0x81	! Mem[0000000030141410] = 0000005d
!	Mem[0000000010181430] = 6a19e93a, %l7 = 000000005d6c9105
	swap	[%i6+0x030],%l7		! %l7 = 000000006a19e93a
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = ffff6bf6, %l7 = 000000006a19e93a
	lduba	[%o0+0x000]%asi,%l7	! %l7 = 00000000000000ff

p0_label_59:
!	Mem[0000000010081400] = 00005d6c000000d6, %f14 = 5d97cea7 50960804
	ldda	[%i2+%g0]0x88,%f14	! %f14 = 00005d6c 000000d6
!	Mem[00000000100c1410] = ffffd2ef, %l5 = 000000004e0cafcb
	ldswa	[%i3+%o5]0x80,%l5	! %l5 = ffffffffffffd2ef
!	Mem[0000000010101408] = 0000794005916c5d, %l2 = 1b3a2b155252bdff
	ldxa	[%i4+%o4]0x80,%l2	! %l2 = 0000794005916c5d
!	Mem[0000000010081410] = 1b3a2b155252bdff, %f24 = 037702eb 0be2dfdd
	ldda	[%i2+%o5]0x80,%f24	! %f24 = 1b3a2b15 5252bdff
!	Mem[0000000030101410] = 75cdefd2, %l0 = 00000000e1f457a8
	lduwa	[%i4+%o5]0x81,%l0	! %l0 = 0000000075cdefd2
!	Mem[0000000030041410] = ff0000f1da9632ea, %l7 = 00000000000000ff
	ldxa	[%i1+%o5]0x81,%l7	! %l7 = ff0000f1da9632ea
!	Mem[0000000010101424] = 4022dcb0, %l1 = 00000000000000ff
	lduha	[%i4+0x026]%asi,%l1	! %l1 = 000000000000dcb0
!	Mem[0000000010001410] = cfa6de823a149649, %l3 = 0000000000000097
	ldxa	[%i0+%o5]0x80,%l3	! %l3 = cfa6de823a149649
!	Mem[00000000201c0000] = ffff6bf6, %l3 = cfa6de823a149649
	ldub	[%o0+0x001],%l3		! %l3 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%f31 = 4e0f0307, Mem[0000000010141400] = 00ff0000
	sta	%f31,[%i5+%g0]0x80	! Mem[0000000010141400] = 4e0f0307

p0_label_60:
!	%l6 = 000000005d6c9105, Mem[0000000010141410] = 0000009d
	stba	%l6,[%i5+%o5]0x80	! Mem[0000000010141410] = 0500009d
!	%f12 = 4f235fd3 da029dd1, Mem[0000000030041408] = 75003c64 d716db66
	stda	%f12,[%i1+%o4]0x81	! Mem[0000000030041408] = 4f235fd3 da029dd1
!	%f24 = 1b3a2b15 5252bdff, %f12 = 4f235fd3 da029dd1
	fdtox	%f24,%f12		! %f12 = 00000000 00000000
!	%l6 = 5d6c9105, %l7 = da9632ea, Mem[0000000010081408] = 8c902051 47000000
	stda	%l6,[%i2+%o4]0x80	! Mem[0000000010081408] = 5d6c9105 da9632ea
!	%l1 = 000000000000dcb0, imm = fffffffffffff633, %l0 = 0000000075cdefd2
	andn	%l1,-0x9cd,%l0		! %l0 = 0000000000000880
!	Mem[0000000010001434] = e8d0dd81, %l2 = 05916c5d, %l2 = 05916c5d
	add	%i0,0x34,%g1
	casa	[%g1]0x80,%l2,%l2	! %l2 = 00000000e8d0dd81
!	%l6 = 000000005d6c9105, Mem[0000000020800000] = ffcb98bf, %asi = 80
	stha	%l6,[%o1+0x000]%asi	! Mem[0000000020800000] = 910598bf
!	Mem[0000000020800000] = 910598bf, %l7 = ff0000f1da9632ea
	ldstub	[%o1+%g0],%l7		! %l7 = 00000091000000ff
!	%f7  = 5d6c9105, Mem[0000000010081410] = 1b3a2b15
	sta	%f7 ,[%i2+%o5]0x80	! Mem[0000000010081410] = 5d6c9105
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = 20eaedabff916cdd, %l6 = 000000005d6c9105
	ldxa	[%i5+%o4]0x89,%l6	! %l6 = 20eaedabff916cdd

p0_label_61:
!	Mem[0000000010041428] = 0475329a, %l7 = 0000000000000091
	ldsw	[%i1+0x028],%l7		! %l7 = 000000000475329a
!	Mem[0000000030141408] = dd6c91ff, %l4 = 00000000ff32787f
	lduba	[%i5+%o4]0x81,%l4	! %l4 = 00000000000000dd
!	Mem[0000000030041400] = 001f611f, %l1 = 000000000000dcb0
	ldsba	[%i1+%g0]0x81,%l1	! %l1 = 0000000000000000
!	Mem[00000000100c1408] = d2efcdff, %l4 = 00000000000000dd
	lduwa	[%i3+%o4]0x88,%l4	! %l4 = 00000000d2efcdff
!	Mem[000000001000142c] = 4da2c09a, %l6 = 20eaedabff916cdd
	lduha	[%i0+0x02e]%asi,%l6	! %l6 = 000000000000c09a
!	Mem[0000000010001400] = 5d6c9105, %l4 = 00000000d2efcdff
	ldswa	[%i0+%g0]0x80,%l4	! %l4 = 000000005d6c9105
!	Mem[0000000030001408] = 07030f4e, %l0 = 0000000000000880
	ldswa	[%i0+%o4]0x81,%l0	! %l0 = 0000000007030f4e
!	Mem[0000000010081408] = 5d6c9105da9632ea, %l6 = 000000000000c09a
	ldxa	[%i2+%o4]0x80,%l6	! %l6 = 5d6c9105da9632ea
!	Mem[0000000030181410] = 000020ff, %l6 = 5d6c9105da9632ea
	ldsha	[%i6+%o5]0x89,%l6	! %l6 = 00000000000020ff
!	Starting 10 instruction Store Burst
!	%f2  = 244b9889 ffffbd00, Mem[0000000030101408] = 75b5ffff 0000005d
	stda	%f2 ,[%i4+%o4]0x81	! Mem[0000000030101408] = 244b9889 ffffbd00

p0_label_62:
!	Mem[00000000300c1400] = a857f4e1, %l5 = ffffffffffffd2ef
	swapa	[%i3+%g0]0x89,%l5	! %l5 = 00000000a857f4e1
!	%l6 = 00000000000020ff, Mem[0000000030141410] = 0000005d
	stha	%l6,[%i5+%o5]0x81	! Mem[0000000030141410] = 20ff005d
!	%l0 = 0000000007030f4e, Mem[0000000010001418] = 31b9e96c
	stw	%l0,[%i0+0x018]		! Mem[0000000010001418] = 07030f4e
!	%f30 = ec217703 4e0f0307, Mem[0000000010001408] = a857f4e1 816f059d
	stda	%f30,[%i0+%o4]0x88	! Mem[0000000010001408] = ec217703 4e0f0307
!	%l6 = 00000000000020ff, Mem[0000000030101408] = 244b9889
	stba	%l6,[%i4+%o4]0x81	! Mem[0000000030101408] = ff4b9889
!	%f20 = 5d6c91ff fafa33af, %l1 = 0000000000000000
!	Mem[0000000030181430] = 9d797fc49ec8026c
	add	%i6,0x030,%g1
	stda	%f20,[%g1+%l1]ASI_PST32_S ! Mem[0000000030181430] = 9d797fc49ec8026c
!	%l5 = 00000000a857f4e1, Mem[0000000010081408] = 5d6c9105
	stha	%l5,[%i2+%o4]0x80	! Mem[0000000010081408] = f4e19105
!	Mem[0000000010181418] = 2697a53f4e0cafcb, %l3 = 00000000000000ff, %l0 = 0000000007030f4e
	add	%i6,0x18,%g1
	casxa	[%g1]0x80,%l3,%l0	! %l0 = 2697a53f4e0cafcb
!	Mem[0000000010001400] = 5d6c9105, %l4 = 000000005d6c9105
	ldstuba	[%i0+%g0]0x80,%l4	! %l4 = 0000005d000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = dd6c91ff, %l3 = 00000000000000ff
	lduba	[%i5+%o4]0x81,%l3	! %l3 = 00000000000000dd

p0_label_63:
!	Mem[0000000030041410] = ff0000f1, %l7 = 000000000475329a
	ldsha	[%i1+%o5]0x81,%l7	! %l7 = ffffffffffffff00
!	Mem[0000000010181408] = 97000000, %l4 = 000000000000005d
	ldswa	[%i6+%o4]0x88,%l4	! %l4 = ffffffff97000000
	membar	#Sync			! Added by membar checker (10)
!	Mem[00000000300c1400] = efd2ffff 5d6c9105 ff0cafcb 894dd97c
!	Mem[00000000300c1410] = ceff7e91 4079611f bacb85e3 ae339ae5
!	Mem[00000000300c1420] = c78dcd1f 82dea6cf ac259486 4da2c09a
!	Mem[00000000300c1430] = 7893e93a b58e6063 d792467c ef4709a9
	ldda	[%i3]ASI_BLK_AIUS,%f0	! Block Load from 00000000300c1400
!	Mem[0000000010081410] = 5d6c9105, %l1 = 0000000000000000
	ldsha	[%i2+%o5]0x80,%l1	! %l1 = 0000000000005d6c
!	Mem[00000000100c1408] = d2efcdff, %l4 = ffffffff97000000
	ldsba	[%i3+%o4]0x88,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010181404] = 152b3a1b, %l5 = 00000000a857f4e1
	lduw	[%i6+0x004],%l5		! %l5 = 00000000152b3a1b
!	Mem[00000000100c142c] = ffbd5252, %l5 = 00000000152b3a1b
	lduha	[%i3+0x02e]%asi,%l5	! %l5 = 0000000000005252
!	Mem[0000000030081400] = ff0000006a315fc1, %f26 = 5d000000 ffffb58e
	ldda	[%i2+%g0]0x81,%f26	! %f26 = ff000000 6a315fc1
!	Mem[0000000030181400] = ff340d737f78326f, %f18 = 8eb5ffff 0000005d
	ldda	[%i6+%g0]0x81,%f18	! %f18 = ff340d73 7f78326f
!	Starting 10 instruction Store Burst
!	%f22 = ff0000f1, Mem[0000000010041410] = 397ae14f
	sta	%f22,[%i1+%o5]0x88	! Mem[0000000010041410] = ff0000f1

p0_label_64:
!	Mem[00000000100c1400] = 5392059d, %l5 = 0000000000005252
	swapa	[%i3+%g0]0x88,%l5	! %l5 = 000000005392059d
!	%l5 = 000000005392059d, Mem[0000000010081400] = 000000d6
	stwa	%l5,[%i2+%g0]0x88	! Mem[0000000010081400] = 5392059d
!	%f30 = ec217703 4e0f0307, Mem[0000000030101400] = 000061ff 1b3a2b15
	stda	%f30,[%i4+%g0]0x89	! Mem[0000000030101400] = ec217703 4e0f0307
!	Mem[00000000211c0000] = ffd6c666, %l2 = 00000000e8d0dd81
	ldstuba	[%o2+0x000]%asi,%l2	! %l2 = 000000ff000000ff
!	%l5 = 000000005392059d, Mem[000000001008142c] = f10000ff, %asi = 80
	stwa	%l5,[%i2+0x02c]%asi	! Mem[000000001008142c] = 5392059d
!	%l4 = ffffffffffffffff, Mem[0000000030181400] = ff340d73
	stba	%l4,[%i6+%g0]0x81	! Mem[0000000030181400] = ff340d73
!	Mem[00000000201c0000] = ffff6bf6, %l1 = 0000000000005d6c
	ldstuba	[%o0+0x000]%asi,%l1	! %l1 = 000000ff000000ff
!	%l5 = 000000005392059d, Mem[0000000030081408] = 00000000
	stba	%l5,[%i2+%o4]0x89	! Mem[0000000030081408] = 0000009d
!	Mem[0000000010081428] = 7cd94d89, %l3 = 00000000000000dd
	swap	[%i2+0x028],%l3		! %l3 = 000000007cd94d89
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = a28d2b97, %f20 = 5d6c91ff
	lda	[%i1+%g0]0x88,%f20	! %f20 = a28d2b97

p0_label_65:
!	Mem[0000000010181434] = b58e6063, %l3 = 000000007cd94d89
	ldsb	[%i6+0x035],%l3		! %l3 = ffffffffffffff8e
!	%f26 = ff000000, %f22 = ff0000f1, %f24 = 1b3a2b15 5252bdff
	fsmuld	%f26,%f22,%f24		! %f24 = 4fd0001e 20000000
!	Mem[00000000100c141c] = e385cbba, %f25 = 20000000
	lda	[%i3+0x01c]%asi,%f25	! %f25 = e385cbba
!	Mem[0000000030101410] = 75cdefd2, %f17 = 152b3a1b
	lda	[%i4+%o5]0x81,%f17	! %f17 = 75cdefd2
!	Mem[0000000030081410] = 5d83b765b446971c, %l2 = 00000000000000ff
	ldxa	[%i2+%o5]0x89,%l2	! %l2 = 5d83b765b446971c
!	Mem[0000000010001410] = cfa6de82, %f23 = ffffb58e
	lda	[%i0+%o5]0x80,%f23	! %f23 = cfa6de82
!	Mem[0000000030081408] = 0000009d, %l1 = 00000000000000ff
	ldsba	[%i2+%o4]0x89,%l1	! %l1 = ffffffffffffff9d
!	Mem[0000000010081400] = 9d0592536c5d0000, %f16 = 00000000 75cdefd2
	ldda	[%i2+%g0]0x80,%f16	! %f16 = 9d059253 6c5d0000
!	Mem[00000000300c1400] = 05916c5dffffd2ef, %l1 = ffffffffffffff9d
	ldxa	[%i3+%g0]0x89,%l1	! %l1 = 05916c5dffffd2ef
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (11)
!	%l1 = 05916c5dffffd2ef, Mem[00000000300c1400] = ffffd2ef
	stba	%l1,[%i3+%g0]0x89	! Mem[00000000300c1400] = ffffd2ef

p0_label_66:
!	Mem[0000000010081410] = 05916c5d, %l4 = ffffffffffffffff
	ldstuba	[%i2+%o5]0x88,%l4	! %l4 = 0000005d000000ff
!	%l0 = 2697a53f4e0cafcb, Mem[0000000010101410] = 75cdefd2
	stha	%l0,[%i4+%o5]0x88	! Mem[0000000010101410] = 75cdafcb
!	Mem[0000000010041408] = 5d000000, %l6 = 00000000000020ff
	ldstuba	[%i1+%o4]0x80,%l6	! %l6 = 0000005d000000ff
!	%f0  = efd2ffff 5d6c9105, Mem[0000000030001408] = 4e0f0307 07030f4e
	stda	%f0 ,[%i0+%o4]0x89	! Mem[0000000030001408] = efd2ffff 5d6c9105
!	%f26 = ff000000, Mem[0000000030101410] = d2efcd75
	sta	%f26,[%i4+%o5]0x89	! Mem[0000000030101410] = ff000000
!	%l4 = 0000005d, %l5 = 5392059d, Mem[0000000030181410] = 000020ff 000000d3
	stda	%l4,[%i6+%o5]0x89	! Mem[0000000030181410] = 0000005d 5392059d
!	Mem[0000000010181400] = 00000000, %l2 = 5d83b765b446971c
	swapa	[%i6+%g0]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000030001400] = 9d000000, %l7 = ffffffffffffff00
	swapa	[%i0+%g0]0x81,%l7	! %l7 = 000000009d000000
!	Mem[0000000010081410] = ff6c9105, %l6 = 000000000000005d
	ldstuba	[%i2+%o5]0x80,%l6	! %l6 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	%f23 = cfa6de82, %f21 = fafa33af
	fsqrts	%f23,%f21		! %f21 = 7fffffff

p0_label_67:
!	Mem[0000000010101400] = 5d6c9105539205ff, %l0 = 2697a53f4e0cafcb
	ldxa	[%i4+%g0]0x88,%l0	! %l0 = 5d6c9105539205ff
!	Mem[0000000020800040] = 908c359e, %l3 = ffffffffffffff8e
	ldsh	[%o1+0x040],%l3		! %l3 = ffffffffffff908c
!	Mem[0000000010041408] = 000000ff, %l7 = 000000009d000000
	ldsha	[%i1+%o4]0x88,%l7	! %l7 = 00000000000000ff
!	%f24 = 4fd0001e, %f18 = ff340d73, %f9  = 82dea6cf
	fdivs	%f24,%f18,%f9 		! %f9  = 9013de48
!	Mem[0000000030141410] = 20ff005d, %l6 = 00000000000000ff
	lduba	[%i5+%o5]0x81,%l6	! %l6 = 0000000000000020
!	Mem[00000000100c1410] = ffffd2ef, %l6 = 0000000000000020
	lduha	[%i3+%o5]0x80,%l6	! %l6 = 000000000000ffff
!	Mem[0000000010081408] = f4e19105da9632ea, %f0  = efd2ffff 5d6c9105
	ldda	[%i2+%o4]0x80,%f0 	! %f0  = f4e19105 da9632ea
!	%l7 = 00000000000000ff, %l7 = 00000000000000ff, %l3 = ffffffffffff908c
	and	%l7,%l7,%l3		! %l3 = 00000000000000ff
!	Mem[0000000010181408] = 576a700497000000, %f10 = ac259486 4da2c09a
	ldda	[%i6+%o4]0x88,%f10	! %f10 = 576a7004 97000000
!	Starting 10 instruction Store Burst
!	%l2 = 0000000000000000, Mem[0000000021800080] = 00ff2e32, %asi = 80
	stha	%l2,[%o3+0x080]%asi	! Mem[0000000021800080] = 00002e32

p0_label_68:
!	Mem[0000000030141408] = ff916cdd, %l0 = 5d6c9105539205ff
	swapa	[%i5+%o4]0x89,%l0	! %l0 = 00000000ff916cdd
!	Mem[00000000211c0001] = ffd6c666, %l0 = 00000000ff916cdd
	ldstub	[%o2+0x001],%l0		! %l0 = 000000d6000000ff
!	%l3 = 00000000000000ff, Mem[0000000030101400] = 07030f4e
	stwa	%l3,[%i4+%g0]0x81	! Mem[0000000030101400] = 000000ff
!	%l3 = 00000000000000ff, Mem[0000000010101420] = 239c083d4022dcb0
	stx	%l3,[%i4+0x020]		! Mem[0000000010101420] = 00000000000000ff
!	%l2 = 0000000000000000, Mem[0000000030141410] = 20ff005d
	stwa	%l2,[%i5+%o5]0x81	! Mem[0000000030141410] = 00000000
!	%l7 = 00000000000000ff, Mem[0000000030081410] = 1c9746b4
	stwa	%l7,[%i2+%o5]0x81	! Mem[0000000030081410] = 000000ff
!	%f12 = 7893e93a b58e6063, %l3 = 00000000000000ff
!	Mem[0000000030081430] = 32516ecefbe3fbbf
	add	%i2,0x030,%g1
	stda	%f12,[%g1+%l3]ASI_PST16_S ! Mem[0000000030081430] = 7893e93ab58e6063
!	%l3 = 00000000000000ff, Mem[00000000100c1408] = ffcdefd2
	stha	%l3,[%i3+%o4]0x80	! Mem[00000000100c1408] = 00ffefd2
!	%f22 = ff0000f1 cfa6de82, %l5 = 000000005392059d
!	Mem[0000000030101410] = 000000fffafa33af
	add	%i4,0x010,%g1
	stda	%f22,[%g1+%l5]ASI_PST8_S ! Mem[0000000030101410] = ff0000f1cfa63382
!	Starting 10 instruction Load Burst
!	Mem[0000000030081410] = 5d83b765 ff000000, %l2 = 00000000, %l3 = 000000ff
	ldda	[%i2+%o5]0x89,%l2	! %l2 = 00000000ff000000 000000005d83b765

p0_label_69:
!	Mem[0000000030141400] = b1ded3c8eeb234ff, %f10 = 576a7004 97000000
	ldda	[%i5+%g0]0x89,%f10	! %f10 = b1ded3c8 eeb234ff
!	Mem[0000000030181408] = 7cd94d89cbaf0c4e, %l6 = 000000000000ffff
	ldxa	[%i6+%o4]0x89,%l6	! %l6 = 7cd94d89cbaf0c4e
!	Mem[000000001000140c] = 037721ec, %l1 = 05916c5dffffd2ef
	lduba	[%i0+0x00d]%asi,%l1	! %l1 = 0000000000000077
!	Mem[0000000030001408] = efd2ffff5d6c9105, %f4  = ceff7e91 4079611f
	ldda	[%i0+%o4]0x89,%f4 	! %f4  = efd2ffff 5d6c9105
!	Mem[0000000020800040] = 908c359e, %l0 = 00000000000000d6
	lduh	[%o1+0x040],%l0		! %l0 = 000000000000908c
!	Code Fragment 3
p0_fragment_8:
!	%l0 = 000000000000908c
	setx	0x2fa7b2403e6b20a8,%g7,%l0 ! %l0 = 2fa7b2403e6b20a8
!	%l1 = 0000000000000077
	setx	0x161f6bdf96f006a7,%g7,%l1 ! %l1 = 161f6bdf96f006a7
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 2fa7b2403e6b20a8
	setx	0xad5198a851e129e0,%g7,%l0 ! %l0 = ad5198a851e129e0
!	%l1 = 161f6bdf96f006a7
	setx	0x1f14d398558d82bf,%g7,%l1 ! %l1 = 1f14d398558d82bf
!	Mem[0000000010101408] = 00007940, %l6 = 7cd94d89cbaf0c4e
	ldsha	[%i4+%o4]0x80,%l6	! %l6 = 0000000000000000
!	Mem[00000000100c1408] = 00ffefd2, %l7 = 00000000000000ff
	lduha	[%i3+%o4]0x80,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030001408] = 5d6c9105, %f2  = ff0cafcb
	lda	[%i0+%o4]0x89,%f2 	! %f2 = 5d6c9105
!	Starting 10 instruction Store Burst
!	%l5 = 000000005392059d, Mem[0000000021800080] = 00002e32, %asi = 80
	stha	%l5,[%o3+0x080]%asi	! Mem[0000000021800080] = 059d2e32

p0_label_70:
!	%l3 = 000000005d83b765, Mem[00000000201c0000] = ffff6bf6
	stb	%l3,[%o0+%g0]		! Mem[00000000201c0000] = 65ff6bf6
!	Mem[000000001018141d] = 4e0cafcb, %l2 = 00000000ff000000
	ldstuba	[%i6+0x01d]%asi,%l2	! %l2 = 0000000c000000ff
!	Mem[0000000010081424] = 00000000, %l6 = 00000000, %l3 = 5d83b765
	add	%i2,0x24,%g1
	casa	[%g1]0x80,%l6,%l3	! %l3 = 0000000000000000
!	%l4 = 000000000000005d, Mem[0000000010001400] = ff6c9105
	stwa	%l4,[%i0+%g0]0x80	! Mem[0000000010001400] = 0000005d
!	%l0 = ad5198a851e129e0, Mem[0000000030101408] = 89984bff
	stba	%l0,[%i4+%o4]0x89	! Mem[0000000030101408] = 89984be0
!	%f26 = ff000000, Mem[00000000100c1438] = b968b3a9
	sta	%f26,[%i3+0x038]%asi	! Mem[00000000100c1438] = ff000000
!	%l4 = 000000000000005d, Mem[0000000030181410] = 0000005d
	stba	%l4,[%i6+%o5]0x89	! Mem[0000000030181410] = 0000005d
!	Mem[00000000300c1410] = ceff7e91, %l0 = ad5198a851e129e0
	ldstuba	[%i3+%o5]0x81,%l0	! %l0 = 000000ce000000ff
!	Mem[0000000010181400] = 1c9746b4, %l0 = 000000ce, %l7 = 000000ff
	casa	[%i6]0x80,%l0,%l7	! %l7 = 000000001c9746b4
!	Starting 10 instruction Load Burst
!	Mem[0000000030001400] = 0000006300ffffff, %f16 = 9d059253 6c5d0000
	ldda	[%i0+%g0]0x89,%f16	! %f16 = 00000063 00ffffff

p0_label_71:
!	Mem[000000001010143c] = 97340d73, %l4 = 000000000000005d
	ldsb	[%i4+0x03e],%l4		! %l4 = 000000000000000d
!	Mem[0000000010081408] = ea3296da0591e1f4, %l0 = 00000000000000ce
	ldxa	[%i2+%o4]0x88,%l0	! %l0 = ea3296da0591e1f4
!	Mem[00000000100c1400] = 52520000, %f27 = 6a315fc1
	lda	[%i3+%g0]0x80,%f27	! %f27 = 52520000
!	Mem[00000000300c1400] = efd2ffff5d6c9105, %l0 = ea3296da0591e1f4
	ldxa	[%i3+%g0]0x81,%l0	! %l0 = efd2ffff5d6c9105
!	Mem[0000000010001410] = 4996143a82dea6cf, %l5 = 000000005392059d
	ldxa	[%i0+%o5]0x88,%l5	! %l5 = 4996143a82dea6cf
!	Mem[0000000030181400] = 730d34ff, %f20 = a28d2b97
	lda	[%i6+%g0]0x89,%f20	! %f20 = 730d34ff
!	Mem[0000000030101408] = 89984be0, %l2 = 000000000000000c
	lduha	[%i4+%o4]0x89,%l2	! %l2 = 0000000000004be0
!	Mem[0000000010001408] = 07030f4e, %l4 = 000000000000000d
	lduba	[%i0+%o4]0x80,%l4	! %l4 = 0000000000000007
!	Mem[0000000010141410] = b968b3a9 9d000005, %l6 = 00000000, %l7 = 1c9746b4
	ldda	[%i5+%o5]0x88,%l6	! %l6 = 000000009d000005 00000000b968b3a9
!	Starting 10 instruction Store Burst
!	%l3 = 0000000000000000, Mem[0000000010141400] = 4e0f03075d6c9105
	stxa	%l3,[%i5+%g0]0x80	! Mem[0000000010141400] = 0000000000000000

p0_label_72:
!	%f26 = ff000000 52520000, Mem[0000000030101400] = ff000000 ec217703
	stda	%f26,[%i4+%g0]0x89	! Mem[0000000030101400] = ff000000 52520000
!	%f22 = ff0000f1 cfa6de82, Mem[00000000300c1400] = efd2ffff 5d6c9105
	stda	%f22,[%i3+%g0]0x81	! Mem[00000000300c1400] = ff0000f1 cfa6de82
!	%f1  = da9632ea, Mem[0000000010081408] = 0591e1f4
	sta	%f1 ,[%i2+%o4]0x88	! Mem[0000000010081408] = da9632ea
!	%l1 = 1f14d398558d82bf, Mem[00000000100c1431] = 1b854151
	stb	%l1,[%i3+0x031]		! Mem[00000000100c1430] = 1bbf4151
!	%f2  = 5d6c9105 894dd97c, Mem[0000000010141400] = 00000000 00000000
	stda	%f2 ,[%i5+0x000]%asi	! Mem[0000000010141400] = 5d6c9105 894dd97c
!	Mem[0000000030001410] = 40790000, %l0 = efd2ffff5d6c9105
	swapa	[%i0+%o5]0x89,%l0	! %l0 = 0000000040790000
!	%f12 = 7893e93a b58e6063, %l0 = 0000000040790000
!	Mem[0000000030101420] = 037702eb0be2dfdd
	add	%i4,0x020,%g1
	stda	%f12,[%g1+%l0]ASI_PST32_SL ! Mem[0000000030101420] = 037702eb0be2dfdd
!	%f2  = 5d6c9105 894dd97c, Mem[0000000010181430] = 5d6c9105 b58e6063
	std	%f2 ,[%i6+0x030]	! Mem[0000000010181430] = 5d6c9105 894dd97c
!	%f10 = b1ded3c8 eeb234ff, Mem[00000000300c1408] = ff0cafcb 894dd97c
	stda	%f10,[%i3+%o4]0x81	! Mem[00000000300c1408] = b1ded3c8 eeb234ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = 00007940, %l1 = 1f14d398558d82bf
	ldsha	[%i4+%o4]0x80,%l1	! %l1 = 0000000000000000

p0_label_73:
!	Mem[0000000010081400] = 5392059d, %l6 = 000000009d000005
	lduwa	[%i2+%g0]0x88,%l6	! %l6 = 000000005392059d
!	Mem[0000000010041408] = ff000000, %l1 = 0000000000000000
	lduha	[%i1+0x00a]%asi,%l1	! %l1 = 0000000000000000
!	Mem[0000000010141410] = b968b3a99d000005, %l7 = 00000000b968b3a9
	ldxa	[%i5+%o5]0x88,%l7	! %l7 = b968b3a99d000005
!	Mem[00000000100c1410] = efd2ffff, %l2 = 0000000000004be0
	lduha	[%i3+%o5]0x88,%l2	! %l2 = 000000000000ffff
!	Mem[0000000010141418] = ea8bb376ef4c33cb, %l1 = 0000000000000000
	ldx	[%i5+0x018],%l1		! %l1 = ea8bb376ef4c33cb
!	Mem[00000000100c1410] = ffffd2ef05916c5d, %f24 = 4fd0001e e385cbba
	ldda	[%i3+%o5]0x80,%f24	! %f24 = ffffd2ef 05916c5d
!	Mem[0000000030141400] = ff34b2ee c8d3deb1, %l4 = 00000007, %l5 = 82dea6cf
	ldda	[%i5+%g0]0x81,%l4	! %l4 = 00000000ff34b2ee 00000000c8d3deb1
!	Mem[0000000030001400] = 00ffffff, %l7 = b968b3a99d000005
	lduba	[%i0+%g0]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030001400] = 00ffffff, %f11 = eeb234ff
	lda	[%i0+%g0]0x89,%f11	! %f11 = 00ffffff
!	Starting 10 instruction Store Burst
!	%f30 = ec217703 4e0f0307, Mem[0000000030181408] = 4e0cafcb 894dd97c
	stda	%f30,[%i6+%o4]0x81	! Mem[0000000030181408] = ec217703 4e0f0307

p0_label_74:
!	Mem[0000000030081408] = 9d000000, %l4 = 00000000ff34b2ee
	ldstuba	[%i2+%o4]0x81,%l4	! %l4 = 0000009d000000ff
!	%l0 = 40790000, %l1 = ef4c33cb, Mem[0000000010141410] = 0500009d a9b368b9
	stda	%l0,[%i5+%o5]0x80	! Mem[0000000010141410] = 40790000 ef4c33cb
!	Mem[00000000100c1404] = 5d6c9105, %l4 = 000000000000009d, %asi = 80
	swapa	[%i3+0x004]%asi,%l4	! %l4 = 000000005d6c9105
!	%l1 = ea8bb376ef4c33cb, Mem[0000000010041410] = ff0000f1
	stha	%l1,[%i1+%o5]0x88	! Mem[0000000010041410] = ff0033cb
!	%l2 = 0000ffff, %l3 = 00000000, Mem[0000000010041410] = cb3300ff dd5657cf
	stda	%l2,[%i1+0x010]%asi	! Mem[0000000010041410] = 0000ffff 00000000
!	%f0  = f4e19105 da9632ea, Mem[0000000010001400] = 5d000000 0000bdf8
	stda	%f0 ,[%i0+%g0]0x88	! Mem[0000000010001400] = f4e19105 da9632ea
!	Mem[0000000010041400] = 972b8da200000000, %l4 = 000000005d6c9105, %l0 = 0000000040790000
	casxa	[%i1]0x80,%l4,%l0	! %l0 = 972b8da200000000
!	%f25 = 05916c5d, Mem[0000000010141410] = 40790000
	sta	%f25,[%i5+%o5]0x80	! Mem[0000000010141410] = 05916c5d
!	Mem[0000000010041400] = a28d2b97, %l2 = 000000000000ffff
	swapa	[%i1+%g0]0x88,%l2	! %l2 = 00000000a28d2b97
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = 00bdffff 89984be0, %l4 = 5d6c9105, %l5 = c8d3deb1
	ldda	[%i4+%o4]0x89,%l4	! %l4 = 0000000089984be0 0000000000bdffff

p0_label_75:
!	Mem[0000000030141410] = 00000000, %l3 = 0000000000000000
	lduha	[%i5+%o5]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000010181400] = 1c9746b4, %l1 = ea8bb376ef4c33cb
	ldsba	[%i6+%g0]0x80,%l1	! %l1 = 000000000000001c
!	Mem[0000000010141408] = 0000009d, %l3 = 0000000000000000
	ldsba	[%i5+0x00a]%asi,%l3	! %l3 = 0000000000000000
!	Mem[0000000030181410] = 5d000000, %l2 = 00000000a28d2b97
	lduwa	[%i6+%o5]0x81,%l2	! %l2 = 000000005d000000
!	Mem[00000000211c0000] = ffffc666, %l1 = 000000000000001c
	lduba	[%o2+0x000]%asi,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030001410] = 05916c5d, %l7 = 00000000000000ff
	lduba	[%i0+%o5]0x81,%l7	! %l7 = 0000000000000005
!	%l7 = 0000000000000005, %l3 = 0000000000000000, %l4 = 0000000089984be0
	xor	%l7,%l3,%l4		! %l4 = 0000000000000005
!	Mem[0000000010181428] = bb47b886 92e6fbc0, %l6 = 5392059d, %l7 = 00000005
	ldd	[%i6+0x028],%l6		! %l6 = 00000000bb47b886 0000000092e6fbc0
!	Mem[0000000020800000] = ff0598bf, %l3 = 0000000000000000
	ldsba	[%o1+0x001]%asi,%l3	! %l3 = 0000000000000005
!	Starting 10 instruction Store Burst
!	%f12 = 7893e93a b58e6063, Mem[0000000030081410] = 000000ff 65b7835d
	stda	%f12,[%i2+%o5]0x81	! Mem[0000000030081410] = 7893e93a b58e6063

p0_label_76:
!	Mem[0000000010101408] = 40790000, %l0 = 972b8da200000000
	ldstuba	[%i4+%o4]0x88,%l0	! %l0 = 00000000000000ff
!	%l6 = 00000000bb47b886, Mem[0000000010141408] = 9d000000
	stba	%l6,[%i5+%o4]0x88	! Mem[0000000010141408] = 9d000086
!	%l7 = 0000000092e6fbc0, Mem[0000000030041410] = ff0000f1
	stba	%l7,[%i1+%o5]0x81	! Mem[0000000030041410] = c00000f1
!	Mem[0000000030181400] = ff340d73, %l0 = 0000000000000000
	swapa	[%i6+%g0]0x81,%l0	! %l0 = 00000000ff340d73
!	%l6 = 00000000bb47b886, Mem[0000000010081418] = cfa6de827f78326f
	stx	%l6,[%i2+0x018]		! Mem[0000000010081418] = 00000000bb47b886
!	%l2 = 000000005d000000, Mem[00000000300c1400] = ff0000f1
	stwa	%l2,[%i3+%g0]0x81	! Mem[00000000300c1400] = 5d000000
!	%l0 = 00000000ff340d73, Mem[0000000030001408] = 05916c5d
	stwa	%l0,[%i0+%o4]0x81	! Mem[0000000030001408] = ff340d73
!	%f26 = ff000000 52520000, %l7 = 0000000092e6fbc0
!	Mem[0000000010181420] = c1e6ac7d0b419631
	add	%i6,0x020,%g1
	stda	%f26,[%g1+%l7]ASI_PST16_PL ! Mem[0000000010181420] = c1e6ac7d0b419631
!	%f20 = 730d34ff 7fffffff, Mem[0000000010041400] = ffff0000 00000000
	stda	%f20,[%i1+%g0]0x80	! Mem[0000000010041400] = 730d34ff 7fffffff
!	Starting 10 instruction Load Burst
!	%l4 = 0000000000000005, %l4 = 0000000000000005, %y  = 00003e18
	smul	%l4,%l4,%l4		! %l4 = 0000000000000019, %y = 00000000

p0_label_77:
!	Mem[00000000300c1408] = b1ded3c8 eeb234ff, %l6 = bb47b886, %l7 = 92e6fbc0
	ldda	[%i3+%o4]0x81,%l6	! %l6 = 00000000b1ded3c8 00000000eeb234ff
!	Mem[00000000300c1410] = ffff7e91, %l3 = 0000000000000005
	lduha	[%i3+%o5]0x81,%l3	! %l3 = 000000000000ffff
!	Mem[0000000010141430] = 643cffce3196410b, %f26 = ff000000 52520000
	ldd	[%i5+0x030],%f26	! %f26 = 643cffce 3196410b
!	Mem[0000000030101400] = 00005252000000ff, %l4 = 0000000000000019
	ldxa	[%i4+%g0]0x81,%l4	! %l4 = 00005252000000ff
!	Mem[0000000010041410] = 0000ffff00000000, %f20 = 730d34ff 7fffffff
	ldda	[%i1+0x010]%asi,%f20	! %f20 = 0000ffff 00000000
!	Mem[0000000030001410] = 5d6c9105, %f17 = 00ffffff
	lda	[%i0+%o5]0x89,%f17	! %f17 = 5d6c9105
!	Mem[00000000100c1410] = ffffd2ef, %l1 = 00000000000000ff
	ldsha	[%i3+%o5]0x80,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010081408] = da9632ea, %l3 = 000000000000ffff
	lduha	[%i2+%o4]0x88,%l3	! %l3 = 00000000000032ea
!	Mem[0000000030101408] = e04b9889, %l6 = 00000000b1ded3c8
	lduha	[%i4+%o4]0x81,%l6	! %l6 = 000000000000e04b
!	Starting 10 instruction Store Burst
!	%l7 = 00000000eeb234ff, Mem[00000000211c0000] = ffffc666, %asi = 80
	stha	%l7,[%o2+0x000]%asi	! Mem[00000000211c0000] = 34ffc666

p0_label_78:
!	%l0 = 00000000ff340d73, Mem[0000000010181400] = b446971c
	stwa	%l0,[%i6+%g0]0x88	! Mem[0000000010181400] = ff340d73
!	Mem[0000000010141408] = 8600009d, %l7 = 00000000eeb234ff
	ldstuba	[%i5+%o4]0x80,%l7	! %l7 = 00000086000000ff
!	%f2  = 5d6c9105 894dd97c, Mem[0000000030081410] = 3ae99378 63608eb5
	stda	%f2 ,[%i2+%o5]0x89	! Mem[0000000030081410] = 5d6c9105 894dd97c
!	%f20 = 0000ffff, Mem[0000000030041410] = f10000c0
	sta	%f20,[%i1+%o5]0x89	! Mem[0000000030041410] = 0000ffff
!	%l1 = ffffffffffffffff, Mem[0000000020800040] = 908c359e
	sth	%l1,[%o1+0x040]		! Mem[0000000020800040] = ffff359e
!	%l3 = 00000000000032ea, Mem[00000000100c1408] = 00ffefd2
	stwa	%l3,[%i3+%o4]0x80	! Mem[00000000100c1408] = 000032ea
!	%l7 = 0000000000000086, Mem[000000001010140c] = 05916c5d, %asi = 80
	stwa	%l7,[%i4+0x00c]%asi	! Mem[000000001010140c] = 00000086
!	%l6 = 0000e04b, %l7 = 00000086, Mem[0000000010181410] = 576a7004 05000000
	stda	%l6,[%i6+%o5]0x88	! Mem[0000000010181410] = 0000e04b 00000086
!	Mem[000000001010141c] = a5a2dbe6, %l6 = 0000e04b, %l1 = ffffffff
	add	%i4,0x1c,%g1
	casa	[%g1]0x80,%l6,%l1	! %l1 = 00000000a5a2dbe6
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = ff00009d5d6c91ff, %f0  = f4e19105 da9632ea
	ldda	[%i5+%o4]0x80,%f0 	! %f0  = ff00009d 5d6c91ff

p0_label_79:
!	Code Fragment 3
p0_fragment_9:
!	%l0 = 00000000ff340d73
	setx	0x8b467127ad81aa3d,%g7,%l0 ! %l0 = 8b467127ad81aa3d
!	%l1 = 00000000a5a2dbe6
	setx	0xd043b338369c90f1,%g7,%l1 ! %l1 = d043b338369c90f1
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 8b467127ad81aa3d
	setx	0xb8391fc84ce927b6,%g7,%l0 ! %l0 = b8391fc84ce927b6
!	%l1 = d043b338369c90f1
	setx	0x60140cffb0ab5814,%g7,%l1 ! %l1 = 60140cffb0ab5814
!	Mem[000000001018143c] = 6a315fc1, %l7 = 0000000000000086
	ldsba	[%i6+0x03c]%asi,%l7	! %l7 = 000000000000006a
!	Mem[0000000030081408] = ff000000, %l0 = b8391fc84ce927b6
	ldswa	[%i2+%o4]0x81,%l0	! %l0 = ffffffffff000000
!	Mem[0000000010041404] = 7fffffff, %f30 = ec217703
	ld	[%i1+0x004],%f30	! %f30 = 7fffffff
!	Mem[0000000010181400] = 730d34ff, %l1 = 60140cffb0ab5814
	lduha	[%i6+%g0]0x80,%l1	! %l1 = 000000000000730d
!	Mem[0000000030141410] = 00000000, %f18 = ff340d73
	lda	[%i5+%o5]0x81,%f18	! %f18 = 00000000
!	Mem[0000000010001400] = ea3296da0591e1f4, %l4 = 00005252000000ff
	ldxa	[%i0+%g0]0x80,%l4	! %l4 = ea3296da0591e1f4
!	Mem[0000000021800100] = 4905ee79, %l4 = ea3296da0591e1f4
	ldsba	[%o3+0x100]%asi,%l4	! %l4 = 0000000000000049
!	Mem[0000000010101410] = cbafcd750b419631, %l7 = 000000000000006a
	ldxa	[%i4+%o5]0x80,%l7	! %l7 = cbafcd750b419631
!	Starting 10 instruction Store Burst
!	Mem[0000000010041408] = ff000000, %l2 = 5d000000, %l5 = 00bdffff
	add	%i1,0x08,%g1
	casa	[%g1]0x80,%l2,%l5	! %l5 = 00000000ff000000

p0_label_80:
!	%f16 = 00000063, %f25 = 05916c5d, %f31 = 4e0f0307
	fdivs	%f16,%f25,%f31		! %l0 = ffffffffff000022, Unfinished, %fsr = 0600000000
!	Mem[00000000300c1408] = c8d3deb1, %l0 = ffffffffff000022
	ldstuba	[%i3+%o4]0x89,%l0	! %l0 = 000000b1000000ff
!	%f15 = ef4709a9, Mem[0000000010041410] = 0000ffff
	sta	%f15,[%i1+%o5]0x80	! Mem[0000000010041410] = ef4709a9
!	Mem[0000000010001408] = 4e0f0307, %l4 = 0000000000000049
	swapa	[%i0+%o4]0x88,%l4	! %l4 = 000000004e0f0307
!	%l1 = 000000000000730d, Mem[0000000010181400] = 730d34ff152b3a1b
	stxa	%l1,[%i6+%g0]0x80	! Mem[0000000010181400] = 000000000000730d
!	%f18 = 00000000 7f78326f, %l7 = cbafcd750b419631
!	Mem[0000000030141438] = 89b251dce9dc1960
	add	%i5,0x038,%g1
	stda	%f18,[%g1+%l7]ASI_PST8_SL ! Mem[0000000030141438] = 6fb251dc00001960
!	%l4 = 000000004e0f0307, Mem[0000000010141408] = ff916c5d9d0000ff
	stxa	%l4,[%i5+%o4]0x88	! Mem[0000000010141408] = 000000004e0f0307
!	%f30 = 7fffffff, Mem[0000000030001400] = ffffff00
	sta	%f30,[%i0+%g0]0x81	! Mem[0000000030001400] = 7fffffff
!	Mem[00000000211c0000] = 34ffc666, %l7 = cbafcd750b419631
	ldstuba	[%o2+0x000]%asi,%l7	! %l7 = 00000034000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001438] = 0e0671aa, %f13 = b58e6063
	ld	[%i0+0x038],%f13	! %f13 = 0e0671aa

p0_label_81:
!	%l7 = 0000000000000034, immed = 000004f2, %y  = 00000000
	umul	%l7,0x4f2,%l2		! %l2 = 0000000000010128, %y = 00000000
!	Mem[0000000030081400] = ff000000, %l6 = 000000000000e04b
	ldswa	[%i2+%g0]0x81,%l6	! %l6 = ffffffffff000000
!	Mem[0000000010001408] = ec217703 00000049, %l2 = 00010128, %l3 = 000032ea
	ldda	[%i0+%o4]0x88,%l2	! %l2 = 0000000000000049 00000000ec217703
!	Mem[0000000010141400] = 05916c5d, %l6 = ffffffffff000000
	ldsha	[%i5+%g0]0x88,%l6	! %l6 = 0000000000006c5d
!	Mem[000000001004142c] = c46788cf, %l4 = 000000004e0f0307
	lduba	[%i1+0x02f]%asi,%l4	! %l4 = 00000000000000cf
!	Mem[0000000010141410] = 5d6c9105, %l1 = 000000000000730d
	lduwa	[%i5+%o5]0x88,%l1	! %l1 = 000000005d6c9105
!	%l7 = 0000000000000034, Mem[00000000100c1400] = 9d00000000005252
	stxa	%l7,[%i3+%g0]0x88	! Mem[00000000100c1400] = 0000000000000034
!	Mem[00000000100c1420] = c16c5c31, %l3 = 00000000ec217703
	lduba	[%i3+0x023]%asi,%l3	! %l3 = 0000000000000031
!	Mem[0000000030081400] = ff0000006a315fc1, %l7 = 0000000000000034
	ldxa	[%i2+%g0]0x81,%l7	! %l7 = ff0000006a315fc1
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1414] = 05916c5d, %l2 = 00000049, %l1 = 5d6c9105
	add	%i3,0x14,%g1
	casa	[%g1]0x80,%l2,%l1	! %l1 = 0000000005916c5d

p0_label_82:
!	%f19 = 7f78326f, Mem[0000000030041410] = 0000ffff
	sta	%f19,[%i1+%o5]0x89	! Mem[0000000030041410] = 7f78326f
!	Mem[0000000010101410] = cbafcd75, %l5 = 00000000ff000000
	swapa	[%i4+%o5]0x80,%l5	! %l5 = 00000000cbafcd75
!	Mem[0000000010081438] = 92d39a15, %l0 = 00000000000000b1
	swap	[%i2+0x038],%l0		! %l0 = 0000000092d39a15
!	%f20 = 0000ffff 00000000, %l0 = 0000000092d39a15
!	Mem[00000000300c1438] = d792467cef4709a9
	add	%i3,0x038,%g1
	stda	%f20,[%g1+%l0]ASI_PST16_SL ! Mem[00000000300c1438] = 0000467cffff09a9
!	%f8  = c78dcd1f, Mem[0000000030101410] = f10000ff
	sta	%f8 ,[%i4+%o5]0x89	! Mem[0000000030101410] = c78dcd1f
!	%f7  = ae339ae5, Mem[0000000030141408] = ff059253
	sta	%f7 ,[%i5+%o4]0x81	! Mem[0000000030141408] = ae339ae5
!	Mem[0000000010001410] = 82dea6cf, %l5 = 00000000cbafcd75
	ldstuba	[%i0+%o5]0x88,%l5	! %l5 = 000000cf000000ff
!	%l2 = 0000000000000049, Mem[0000000010181400] = 00000000
	stha	%l2,[%i6+%g0]0x80	! Mem[0000000010181400] = 00490000
!	Mem[0000000010181400] = 00490000, %l3 = 0000000000000031
	swapa	[%i6+%g0]0x80,%l3	! %l3 = 0000000000490000
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = 00000097, %f26 = 643cffce
	lda	[%i6+%o4]0x80,%f26	! %f26 = 00000097

p0_label_83:
!	Mem[0000000010101434] = 75cdefd2, %l0 = 0000000092d39a15
	lduwa	[%i4+0x034]%asi,%l0	! %l0 = 0000000075cdefd2
!	Mem[0000000010101438] = 049f032f, %l2 = 0000000000000049
	ldsh	[%i4+0x03a],%l2		! %l2 = 000000000000032f
!	Mem[0000000030081410] = 7cd94d8905916c5d, %l6 = 0000000000006c5d
	ldxa	[%i2+%o5]0x81,%l6	! %l6 = 7cd94d8905916c5d
!	Mem[0000000030101410] = 1fcd8dc7, %l0 = 0000000075cdefd2
	lduwa	[%i4+%o5]0x81,%l0	! %l0 = 000000001fcd8dc7
!	Mem[0000000030101410] = c78dcd1f, %l0 = 000000001fcd8dc7
	ldsha	[%i4+%o5]0x89,%l0	! %l0 = ffffffffffffcd1f
!	Mem[0000000010001408] = 49000000 037721ec, %l6 = 05916c5d, %l7 = 6a315fc1
	ldda	[%i0+%o4]0x80,%l6	! %l6 = 0000000049000000 00000000037721ec
!	Mem[00000000100c142c] = ffbd5252, %l6 = 0000000049000000
	ldsh	[%i3+0x02e],%l6		! %l6 = 0000000000005252
!	Mem[0000000010081400] = 5392059d, %l4 = 00000000000000cf
	ldsha	[%i2+%g0]0x88,%l4	! %l4 = 000000000000059d
!	Mem[0000000030101410] = 8233a6cfc78dcd1f, %f12 = 7893e93a 0e0671aa
	ldda	[%i4+%o5]0x89,%f12	! %f12 = 8233a6cf c78dcd1f
!	Starting 10 instruction Store Burst
!	Mem[0000000030041400] = 001f611f, %l5 = 00000000000000cf
	ldstuba	[%i1+%g0]0x81,%l5	! %l5 = 00000000000000ff

p0_label_84:
!	Mem[0000000030081400] = 000000ff, %l5 = 0000000000000000
	swapa	[%i2+%g0]0x89,%l5	! %l5 = 00000000000000ff
!	%f2  = 5d6c9105 894dd97c, Mem[00000000300c1408] = c8d3deff ff34b2ee
	stda	%f2 ,[%i3+%o4]0x89	! Mem[00000000300c1408] = 5d6c9105 894dd97c
!	%f20 = 0000ffff 00000000, Mem[0000000010041420] = 00000000 00000063
	stda	%f20,[%i1+0x020]%asi	! Mem[0000000010041420] = 0000ffff 00000000
!	%f8  = c78dcd1f, Mem[0000000010181408] = 97000000
	sta	%f8 ,[%i6+%o4]0x88	! Mem[0000000010181408] = c78dcd1f
!	Mem[0000000010141410] = 5d6c9105, %l2 = 000000000000032f
	swapa	[%i5+%o5]0x88,%l2	! %l2 = 000000005d6c9105
!	Mem[0000000010041418] = 85b7a95d, %l7 = 00000000037721ec
	swap	[%i1+0x018],%l7		! %l7 = 0000000085b7a95d
!	%f16 = 00000063 5d6c9105, %l4 = 000000000000059d
!	Mem[0000000010081420] = 92d39a155d83b765
	add	%i2,0x020,%g1
	stda	%f16,[%g1+%l4]ASI_PST32_PL ! Mem[0000000010081420] = 05916c5d5d83b765
!	%l6 = 00005252, %l7 = 85b7a95d, Mem[0000000030141408] = e59a33ae 20eaedab
	stda	%l6,[%i5+%o4]0x89	! Mem[0000000030141408] = 00005252 85b7a95d
!	%l5 = 00000000000000ff, Mem[0000000010101410] = ff000000
	stha	%l5,[%i4+%o5]0x80	! Mem[0000000010101410] = 00ff0000
!	Starting 10 instruction Load Burst
!	Mem[0000000020800000] = ff0598bf, %l2 = 000000005d6c9105
	ldsba	[%o1+0x000]%asi,%l2	! %l2 = ffffffffffffffff

p0_label_85:
!	Mem[0000000010101410] = 3196410b0000ff00, %l5 = 00000000000000ff
	ldxa	[%i4+%o5]0x88,%l5	! %l5 = 3196410b0000ff00
!	Mem[0000000010181408] = 1fcd8dc7, %l4 = 000000000000059d
	lduba	[%i6+%o4]0x80,%l4	! %l4 = 000000000000001f
!	Mem[0000000010001400] = ea3296da, %l2 = ffffffffffffffff
	lduha	[%i0+%g0]0x80,%l2	! %l2 = 000000000000ea32
!	Mem[0000000010081410] = 05916cff, %l5 = 3196410b0000ff00
	ldswa	[%i2+%o5]0x88,%l5	! %l5 = 0000000005916cff
!	Mem[0000000010181400] = 0d730000 31000000, %l4 = 0000001f, %l5 = 05916cff
	ldda	[%i6+%g0]0x88,%l4	! %l4 = 0000000031000000 000000000d730000
!	Mem[0000000010141408] = 07030f4e00000000, %f28 = 8907f971 7f000000
	ldda	[%i5+0x008]%asi,%f28	! %f28 = 07030f4e 00000000
!	Mem[00000000100c1410] = ffffd2ef, %l3 = 0000000000490000
	lduba	[%i3+%o5]0x80,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030081410] = 894dd97c, %l1 = 0000000005916c5d
	lduba	[%i2+%o5]0x89,%l1	! %l1 = 000000000000007c
!	%f28 = 07030f4e, %f7  = ae339ae5, %f15 = ef4709a9
	fadds	%f28,%f7 ,%f15		! %f15 = ae339ae5
!	Starting 10 instruction Store Burst
!	Mem[0000000010001420] = 049f032f97340d73, %l0 = ffffffffffffcd1f, %l3 = 00000000000000ff
	add	%i0,0x20,%g1
	casxa	[%g1]0x80,%l0,%l3	! %l3 = 049f032f97340d73

p0_label_86:
!	%l6 = 0000000000005252, Mem[0000000020800040] = ffff359e, %asi = 80
	stba	%l6,[%o1+0x040]%asi	! Mem[0000000020800040] = 52ff359e
!	%l1 = 000000000000007c, Mem[0000000010041408] = ff000000
	stha	%l1,[%i1+%o4]0x80	! Mem[0000000010041408] = 007c0000
!	%f14 = d792467c ae339ae5, %l6 = 0000000000005252
!	Mem[0000000030081438] = 24e335d73569186d
	add	%i2,0x038,%g1
	stda	%f14,[%g1+%l6]ASI_PST16_S ! Mem[0000000030081438] = 24e335d7ae33186d
!	%f2  = 5d6c9105 894dd97c, Mem[0000000030101408] = e04b9889 ffffbd00
	stda	%f2 ,[%i4+%o4]0x81	! Mem[0000000030101408] = 5d6c9105 894dd97c
!	Mem[0000000030141400] = eeb234ff, %l0 = ffffffffffffcd1f
	ldstuba	[%i5+%g0]0x89,%l0	! %l0 = 000000ff000000ff
!	%f2  = 5d6c9105 894dd97c, %l7 = 0000000085b7a95d
!	Mem[0000000030141400] = ff34b2eec8d3deb1
	stda	%f2,[%i5+%l7]ASI_PST8_S ! Mem[0000000030141400] = ff6cb205894dde7c
!	%f0  = ff00009d 5d6c91ff, %l1 = 000000000000007c
!	Mem[0000000010081430] = cbaf0c4ef6152b8c
	add	%i2,0x030,%g1
	stda	%f0,[%g1+%l1]ASI_PST8_PL ! Mem[0000000010081430] = cbaf6c5d9d00008c
!	Mem[0000000030141400] = 05b26cff, %l4 = 0000000031000000
	swapa	[%i5+%g0]0x89,%l4	! %l4 = 0000000005b26cff
!	%l4 = 0000000005b26cff, %l4 = 0000000005b26cff, %l7 = 0000000085b7a95d
	andn	%l4,%l4,%l7		! %l7 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = a90947ef, %l4 = 0000000005b26cff
	ldsha	[%i1+%o5]0x88,%l4	! %l4 = 00000000000047ef

p0_label_87:
!	Mem[0000000030181400] = 00000000, %f23 = cfa6de82
	lda	[%i6+%g0]0x81,%f23	! %f23 = 00000000
!	Mem[0000000010081408] = da9632ea, %l0 = 00000000000000ff
	swapa	[%i2+%o4]0x88,%l0	! %l0 = 00000000da9632ea
!	Mem[0000000030081410] = 7cd94d8905916c5d, %l1 = 000000000000007c
	ldxa	[%i2+%o5]0x81,%l1	! %l1 = 7cd94d8905916c5d
!	Mem[0000000010041438] = bad76926, %l5 = 000000000d730000
	ldsh	[%i1+0x038],%l5		! %l5 = ffffffffffffbad7
!	Mem[0000000010181400] = 31000000, %f23 = 00000000
	lda	[%i6+%g0]0x88,%f23	! %f23 = 31000000
!	Mem[0000000010041438] = bad76926e10ece31, %f4  = efd2ffff 5d6c9105
	ldd	[%i1+0x038],%f4 	! %f4  = bad76926 e10ece31
!	Mem[0000000030001408] = 730d34ff, %l1 = 7cd94d8905916c5d
	lduha	[%i0+%o4]0x89,%l1	! %l1 = 00000000000034ff
!	Mem[00000000100c1400] = 00000034, %l0 = 00000000da9632ea
	ldswa	[%i3+%g0]0x88,%l0	! %l0 = 0000000000000034
!	Mem[0000000030181410] = 0000005d, %l5 = ffffffffffffbad7
	lduwa	[%i6+%o5]0x89,%l5	! %l5 = 000000000000005d
!	Starting 10 instruction Store Burst
!	%f12 = 8233a6cf, Mem[0000000030141408] = 52520000
	sta	%f12,[%i5+%o4]0x81	! Mem[0000000030141408] = 8233a6cf

p0_label_88:
!	%l2 = 0000ea32, %l3 = 97340d73, Mem[00000000300c1400] = 5d000000 cfa6de82
	stda	%l2,[%i3+%g0]0x81	! Mem[00000000300c1400] = 0000ea32 97340d73
!	%f26 = 00000097 3196410b, %l1 = 00000000000034ff
!	Mem[00000000300c1428] = ac2594864da2c09a
	add	%i3,0x028,%g1
	stda	%f26,[%g1+%l1]ASI_PST16_S ! Mem[00000000300c1428] = 000000973196410b
!	Mem[00000000300c1400] = 32ea0000, %l6 = 0000000000005252
	ldstuba	[%i3+%g0]0x89,%l6	! %l6 = 00000000000000ff
!	%f21 = 00000000, Mem[0000000030001400] = ffffff7f
	sta	%f21,[%i0+%g0]0x89	! Mem[0000000030001400] = 00000000
!	Mem[0000000010101408] = 407900ff, %l3 = 049f032f97340d73
	swapa	[%i4+%o4]0x88,%l3	! %l3 = 00000000407900ff
!	%l0 = 0000000000000034, Mem[0000000010001414] = 3a149649
	stw	%l0,[%i0+0x014]		! Mem[0000000010001414] = 00000034
!	%l2 = 000000000000ea32, Mem[0000000010081410] = ff6c9105
	stba	%l2,[%i2+%o5]0x80	! Mem[0000000010081410] = 326c9105
!	%f0  = ff00009d 5d6c91ff 5d6c9105 894dd97c
!	%f4  = bad76926 e10ece31 bacb85e3 ae339ae5
!	%f8  = c78dcd1f 9013de48 b1ded3c8 00ffffff
!	%f12 = 8233a6cf c78dcd1f d792467c ae339ae5
	stda	%f0,[%i2]ASI_BLK_AIUP	! Block Store to 0000000010081400
!	Mem[0000000010181410] = 4be00000, %l7 = 0000000000000000
	swapa	[%i6+%o5]0x80,%l7	! %l7 = 000000004be00000
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = 07030f4e 00000000, %l4 = 000047ef, %l5 = 0000005d
	ldda	[%i5+0x008]%asi,%l4	! %l4 = 0000000007030f4e 0000000000000000

p0_label_89:
!	Mem[0000000010141410] = 2f030000, %l0 = 0000000000000034
	ldsba	[%i5+%o5]0x80,%l0	! %l0 = 000000000000002f
!	Mem[0000000010041408] = 007c0000, %f31 = 4e0f0307
	lda	[%i1+%o4]0x80,%f31	! %f31 = 007c0000
!	Mem[00000000100c1410] = efd2ffff, %l5 = 0000000000000000
	lduba	[%i3+%o5]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[00000000300c1400] = 32ea00ff, %f23 = 31000000
	lda	[%i3+%g0]0x89,%f23	! %f23 = 32ea00ff
!	Mem[0000000030181400] = 00000000, %l1 = 00000000000034ff
	lduha	[%i6+%g0]0x81,%l1	! %l1 = 0000000000000000
!	Mem[00000000100c1410] = efd2ffff, %l0 = 000000000000002f
	ldswa	[%i3+%o5]0x88,%l0	! %l0 = ffffffffefd2ffff
!	Mem[0000000010181410] = 00000000, %l0 = ffffffffefd2ffff
	ldswa	[%i6+%o5]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000010041420] = 0000ffff, %l7 = 000000004be00000
	ldub	[%i1+0x021],%l7		! %l7 = 0000000000000000
!	Mem[0000000010101408] = 730d3497 00000086, %l0 = 00000000, %l1 = 00000000
	ldda	[%i4+%o4]0x80,%l0	! %l0 = 00000000730d3497 0000000000000086
!	Starting 10 instruction Store Burst
!	%f18 = 00000000 7f78326f, %l7 = 0000000000000000
!	Mem[0000000030141418] = efb191ebd52b5079
	add	%i5,0x018,%g1
	stda	%f18,[%g1+%l7]ASI_PST32_SL ! Mem[0000000030141418] = efb191ebd52b5079

p0_label_90:
!	Mem[0000000030101410] = 1fcd8dc7, %l2 = 000000000000ea32
	ldstuba	[%i4+%o5]0x81,%l2	! %l2 = 0000001f000000ff
!	%l5 = 00000000000000ff, Mem[00000000201c0000] = 65ff6bf6
	sth	%l5,[%o0+%g0]		! Mem[00000000201c0000] = 00ff6bf6
!	%l0 = 730d3497, %l1 = 00000086, Mem[0000000010101408] = 730d3497 00000086
	stda	%l0,[%i4+%o4]0x80	! Mem[0000000010101408] = 730d3497 00000086
!	%l3 = 00000000407900ff, Mem[0000000030141400] = 31000000
	stwa	%l3,[%i5+%g0]0x89	! Mem[0000000030141400] = 407900ff
!	%l7 = 0000000000000000, Mem[0000000010141410] = 0000032f
	stba	%l7,[%i5+%o5]0x88	! Mem[0000000010141410] = 00000300
!	Mem[0000000010041424] = 00000000, %l6 = 00000000, %l6 = 00000000
	add	%i1,0x24,%g1
	casa	[%g1]0x80,%l6,%l6	! %l6 = 0000000000000000
!	%l3 = 00000000407900ff, Mem[00000000211c0000] = ffffc666, %asi = 80
	stha	%l3,[%o2+0x000]%asi	! Mem[00000000211c0000] = 00ffc666
!	Mem[00000000100c1400] = 00000034, %l5 = 00000000000000ff
	ldstuba	[%i3+%g0]0x88,%l5	! %l5 = 00000034000000ff
!	Mem[0000000030001400] = 00000000, %l7 = 0000000000000000
	ldstuba	[%i0+%g0]0x89,%l7	! %l7 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = 00ffc666, %l3 = 00000000407900ff
	lduba	[%o2+0x000]%asi,%l3	! %l3 = 0000000000000000

p0_label_91:
!	Mem[0000000030141408] = cfa63382, %f20 = 0000ffff
	lda	[%i5+%o4]0x89,%f20	! %f20 = cfa63382
!	Mem[00000000100c1430] = 1bbf4151 ca706904, %l6 = 00000000, %l7 = 00000000
	ldd	[%i3+0x030],%l6		! %l6 = 000000001bbf4151 00000000ca706904
	membar	#Sync			! Added by membar checker (12)
!	Mem[000000001008140c] = 894dd97c, %f21 = 00000000
	ld	[%i2+0x00c],%f21	! %f21 = 894dd97c
!	Mem[0000000010041400] = 730d34ff 7fffffff 007c0000 ffffb58e
!	Mem[0000000010041410] = ef4709a9 00000000 037721ec 0a7a7b57
!	Mem[0000000010041420] = 0000ffff 00000000 0475329a c46788cf
!	Mem[0000000010041430] = 4377bb05 e3857c59 bad76926 e10ece31
	ldda	[%i1]ASI_BLK_AIUPL,%f16	! Block Load from 0000000010041400
!	Mem[00000000211c0000] = 00ffc666, %l2 = 000000000000001f
	lduh	[%o2+%g0],%l2		! %l2 = 00000000000000ff
!	Mem[0000000010081400] = ff00009d5d6c91ff, %f14 = d792467c ae339ae5
	ldda	[%i2+%g0]0x80,%f14	! %f14 = ff00009d 5d6c91ff
!	%l0 = 00000000730d3497, immed = fffff84c, %y  = 00000000
	umul	%l0,-0x7b4,%l1		! %l1 = 730d3120be46e4d4, %y = 730d3120
!	Mem[00000000218000c0] = e8e8e4de, %l6 = 000000001bbf4151
	lduha	[%o3+0x0c0]%asi,%l6	! %l6 = 000000000000e8e8
!	Mem[0000000010181410] = 00000000, %l2 = 00000000000000ff
	lduba	[%i6+%o5]0x80,%l2	! %l2 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f8  = c78dcd1f 9013de48, %l3 = 0000000000000000
!	Mem[0000000030101400] = 00005252000000ff
	stda	%f8,[%i4+%l3]ASI_PST16_SL ! Mem[0000000030101400] = 00005252000000ff

p0_label_92:
!	%f9  = 9013de48, Mem[0000000010001418] = 07030f4e
	st	%f9 ,[%i0+0x018]	! Mem[0000000010001418] = 9013de48
!	%l1 = 730d3120be46e4d4, Mem[0000000010181408] = 576a7004c78dcd1f
	stxa	%l1,[%i6+%o4]0x88	! Mem[0000000010181408] = 730d3120be46e4d4
!	%f12 = 8233a6cf c78dcd1f, %l0 = 00000000730d3497
!	Mem[0000000010141408] = 07030f4e00000000
	add	%i5,0x008,%g1
	stda	%f12,[%g1+%l0]ASI_PST16_P ! Mem[0000000010141408] = 0703a6cfc78dcd1f
!	%l2 = 0000000000000000, Mem[0000000030101410] = c78dcdff
	stwa	%l2,[%i4+%o5]0x89	! Mem[0000000030101410] = 00000000
!	%l1 = 730d3120be46e4d4, Mem[0000000010101400] = ff059253
	stha	%l1,[%i4+%g0]0x80	! Mem[0000000010101400] = e4d49253
!	Mem[0000000030041408] = 4f235fd3, %l7 = 00000000ca706904
	swapa	[%i1+%o4]0x81,%l7	! %l7 = 000000004f235fd3
!	Mem[000000001010142b] = 43a2396f, %l1 = 730d3120be46e4d4
	ldstub	[%i4+0x02b],%l1		! %l1 = 0000006f000000ff
!	%l7 = 000000004f235fd3, Mem[0000000010001400] = da9632ea
	stha	%l7,[%i0+%g0]0x88	! Mem[0000000010001400] = da965fd3
!	Mem[0000000010081408] = 5d6c9105, %l7 = 000000004f235fd3
	swapa	[%i2+%o4]0x80,%l7	! %l7 = 000000005d6c9105
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = 7f78326f, %l4 = 0000000007030f4e
	lduwa	[%i1+%o5]0x89,%l4	! %l4 = 000000007f78326f

p0_label_93:
!	Mem[0000000010041408] = 8eb5ffff00007c00, %l5 = 0000000000000034
	ldxa	[%i1+%o4]0x88,%l5	! %l5 = 8eb5ffff00007c00
!	Mem[0000000030181408] = ec217703, %l1 = 000000000000006f
	ldsba	[%i6+%o4]0x81,%l1	! %l1 = ffffffffffffffec
!	Mem[0000000010101408] = 8600000097340d73, %f8  = c78dcd1f 9013de48
	ldda	[%i4+%o4]0x88,%f8 	! %f8  = 86000000 97340d73
!	Mem[0000000010001408] = 00000049, %l7 = 000000005d6c9105
	lduwa	[%i0+%o4]0x88,%l7	! %l7 = 0000000000000049
!	Mem[0000000030141410] = 00000000, %l5 = 8eb5ffff00007c00
	ldsba	[%i5+%o5]0x89,%l5	! %l5 = 0000000000000000
!	%f1  = 5d6c91ff, %f4  = bad76926, %f12 = 8233a6cf
	fadds	%f1 ,%f4 ,%f12		! %f12 = 5d6c91ff
!	Mem[0000000030041410] = ea3296da7f78326f, %f10 = b1ded3c8 00ffffff
	ldda	[%i1+%o5]0x89,%f10	! %f10 = ea3296da 7f78326f
!	Mem[00000000100c1408] = 5d6c91ff ea320000, %l2 = 00000000, %l3 = 00000000
	ldda	[%i3+%o4]0x88,%l2	! %l2 = 00000000ea320000 000000005d6c91ff
!	Mem[0000000030001410] = 5d6c9105, %l7 = 0000000000000049
	lduba	[%i0+%o5]0x89,%l7	! %l7 = 0000000000000005
!	Starting 10 instruction Store Burst
!	%l6 = 0000e8e8, %l7 = 00000005, Mem[0000000030141410] = 00000000 00001262
	stda	%l6,[%i5+%o5]0x81	! Mem[0000000030141410] = 0000e8e8 00000005

p0_label_94:
!	Mem[0000000030041400] = 1f611fff, %l5 = 0000000000000000
	swapa	[%i1+%g0]0x89,%l5	! %l5 = 000000001f611fff
!	Mem[0000000030001408] = ff340d73, %l4 = 000000007f78326f
	swapa	[%i0+%o4]0x81,%l4	! %l4 = 00000000ff340d73
!	Mem[0000000021800141] = 2d62cd46, %l0 = 00000000730d3497
	ldstub	[%o3+0x141],%l0		! %l0 = 00000062000000ff
!	Mem[00000000100c1400] = 000000ff, %l3 = 000000005d6c91ff
	ldstuba	[%i3+%g0]0x88,%l3	! %l3 = 000000ff000000ff
!	%l2 = 00000000ea320000, immd = fffffffffffff838, %l7 = 0000000000000005
	sdivx	%l2,-0x7c8,%l7		! %l7 = ffffffffffe1e712
!	Mem[0000000030141410] = e8e80000, %l5 = 000000001f611fff
	ldstuba	[%i5+%o5]0x89,%l5	! %l5 = 00000000000000ff
!	%f8  = 86000000, Mem[0000000030081410] = 7cd94d89
	sta	%f8 ,[%i2+%o5]0x81	! Mem[0000000030081410] = 86000000
!	%l4 = 00000000ff340d73, Mem[0000000010141408] = cfa60307
	stwa	%l4,[%i5+%o4]0x88	! Mem[0000000010141408] = ff340d73
!	%f17 = ff340d73, %f14 = ff00009d, %f12 = 5d6c91ff
	fsubs	%f17,%f14,%f12		! %f12 = fe503358
!	Starting 10 instruction Load Burst
!	Mem[0000000010141414] = ef4c33cb, %l3 = 00000000000000ff
	ldsb	[%i5+0x016],%l3		! %l3 = 0000000000000033

p0_label_95:
!	Mem[0000000010141408] = 730d34ff, %l2 = 00000000ea320000
	lduwa	[%i5+%o4]0x80,%l2	! %l2 = 00000000730d34ff
!	Mem[00000000300c1400] = ff00ea32 97340d73, %l4 = ff340d73, %l5 = 00000000
	ldda	[%i3+%g0]0x81,%l4	! %l4 = 00000000ff00ea32 0000000097340d73
!	Mem[0000000010041408] = 007c0000, %l6 = 000000000000e8e8
	ldsha	[%i1+%o4]0x80,%l6	! %l6 = 000000000000007c
!	Mem[000000001008143c] = ae339ae5, %l4 = 00000000ff00ea32
	lduw	[%i2+0x03c],%l4		! %l4 = 00000000ae339ae5
!	Mem[0000000030141410] = 05000000 e8e800ff, %l4 = ae339ae5, %l5 = 97340d73
	ldda	[%i5+%o5]0x89,%l4	! %l4 = 00000000e8e800ff 0000000005000000
!	Mem[0000000010141418] = ea8bb376ef4c33cb, %l2 = 00000000730d34ff
	ldx	[%i5+0x018],%l2		! %l2 = ea8bb376ef4c33cb
!	Mem[0000000010001430] = 6bae32ba, %l3 = 0000000000000033
	ldswa	[%i0+0x030]%asi,%l3	! %l3 = 000000006bae32ba
!	Mem[00000000201c0000] = 00ff6bf6, %l2 = ea8bb376ef4c33cb
	lduha	[%o0+0x000]%asi,%l2	! %l2 = 00000000000000ff
!	Mem[000000001004142c] = c46788cf, %l5 = 0000000005000000
	ldub	[%i1+0x02d],%l5		! %l5 = 0000000000000067
!	Starting 10 instruction Store Burst
!	%l3 = 000000006bae32ba, Mem[0000000010181408] = d4e446be
	stha	%l3,[%i6+%o4]0x80	! Mem[0000000010181408] = 32ba46be

p0_label_96:
!	%l7 = ffffffffffe1e712, Mem[00000000100c1430] = 1bbf4151ca706904
	stx	%l7,[%i3+0x030]		! Mem[00000000100c1430] = ffffffffffe1e712
!	Mem[000000001010141f] = a5a2dbe6, %l2 = 00000000000000ff
	ldstuba	[%i4+0x01f]%asi,%l2	! %l2 = 000000e6000000ff
!	Mem[0000000010081400] = ff00009d, %l1 = ffffffffffffffec
	ldstuba	[%i2+%g0]0x80,%l1	! %l1 = 000000ff000000ff
!	Mem[0000000030101400] = 52520000, %l4 = 00000000e8e800ff
	ldstuba	[%i4+%g0]0x89,%l4	! %l4 = 00000000000000ff
!	%l4 = 0000000000000000, Mem[0000000010101410] = 00ff00000b419631
	stxa	%l4,[%i4+%o5]0x80	! Mem[0000000010101410] = 0000000000000000
!	Mem[0000000010141410] = 00030000, %l5 = 0000000000000067
	ldstuba	[%i5+%o5]0x80,%l5	! %l5 = 00000000000000ff
!	%f8  = 86000000 97340d73, Mem[0000000010101408] = 730d3497 00000086
	stda	%f8 ,[%i4+%o4]0x80	! Mem[0000000010101408] = 86000000 97340d73
!	%l2 = 00000000000000e6, Mem[0000000030041408] = ca706904da029dd1
	stxa	%l2,[%i1+%o4]0x81	! Mem[0000000030041408] = 00000000000000e6
!	Mem[00000000100c1410] = ffffd2ef, %l1 = 00000000000000ff
	swapa	[%i3+%o5]0x80,%l1	! %l1 = 00000000ffffd2ef
!	Starting 10 instruction Load Burst
!	Code Fragment 4
p0_fragment_10:
!	%l0 = 0000000000000062
	setx	0x03e3e4d788d8320b,%g7,%l0 ! %l0 = 03e3e4d788d8320b
!	%l1 = 00000000ffffd2ef
	setx	0x76b21fb07d81c08e,%g7,%l1 ! %l1 = 76b21fb07d81c08e
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 03e3e4d788d8320b
	setx	0x51c13fdfa5c1ee66,%g7,%l0 ! %l0 = 51c13fdfa5c1ee66
!	%l1 = 76b21fb07d81c08e
	setx	0x3fddd367b20de369,%g7,%l1 ! %l1 = 3fddd367b20de369

p0_label_97:
!	Mem[00000000201c0000] = 00ff6bf6, %l0 = 51c13fdfa5c1ee66
	ldub	[%o0+%g0],%l0		! %l0 = 0000000000000000
!	Mem[0000000030041410] = 7f78326f, %l5 = 0000000000000000
	ldswa	[%i1+%o5]0x89,%l5	! %l5 = 000000007f78326f
!	Mem[0000000010141400] = 5d6c9105894dd97c, %l6 = 000000000000007c
	ldxa	[%i5+0x000]%asi,%l6	! %l6 = 5d6c9105894dd97c
!	Mem[0000000010081400] = ff00009d, %f3  = 894dd97c
	lda	[%i2+%g0]0x80,%f3 	! %f3 = ff00009d
!	Mem[0000000030101408] = 5d6c9105 894dd97c, %l2 = 000000e6, %l3 = 6bae32ba
	ldda	[%i4+%o4]0x81,%l2	! %l2 = 000000005d6c9105 00000000894dd97c
!	Mem[0000000030101400] = 525200ff, %l4 = 0000000000000000
	lduba	[%i4+%g0]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010181410] = 00000000, %l3 = 00000000894dd97c
	ldswa	[%i6+%o5]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000010101408] = 86000000, %l4 = 00000000000000ff
	ldsb	[%i4+0x00a],%l4		! %l4 = 0000000000000000
!	Mem[0000000010001410] = ffa6de82, %f26 = cf8867c4
	lda	[%i0+%o5]0x80,%f26	! %f26 = ffa6de82
!	Starting 10 instruction Store Burst
!	Mem[00000000211c0000] = 00ffc666, %l0 = 0000000000000000
	ldstuba	[%o2+0x000]%asi,%l0	! %l0 = 00000000000000ff

p0_label_98:
!	%l4 = 00000000, %l5 = 7f78326f, Mem[0000000010181408] = 32ba46be 20310d73
	stda	%l4,[%i6+%o4]0x80	! Mem[0000000010181408] = 00000000 7f78326f
!	Mem[0000000010141410] = ff030000, %l5 = 7f78326f, %l5 = 7f78326f
	add	%i5,0x10,%g1
	casa	[%g1]0x80,%l5,%l5	! %l5 = 00000000ff030000
!	Mem[00000000201c0000] = 00ff6bf6, %l5 = 00000000ff030000
	ldstuba	[%o0+0x000]%asi,%l5	! %l5 = 00000000000000ff
!	%f17 = ff340d73, Mem[0000000010141414] = ef4c33cb
	sta	%f17,[%i5+0x014]%asi	! Mem[0000000010141414] = ff340d73
!	%l5 = 0000000000000000, Mem[0000000010141400] = 5d6c9105
	stba	%l5,[%i5+%g0]0x80	! Mem[0000000010141400] = 006c9105
!	Mem[0000000010041408] = 00007c00, %l7 = ffffffffffe1e712
	ldstuba	[%i1+%o4]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[000000001008141c] = ae339ae5, %l5 = 00000000, %l4 = 00000000
	add	%i2,0x1c,%g1
	casa	[%g1]0x80,%l5,%l4	! %l4 = 00000000ae339ae5
!	Mem[0000000020800001] = ff0598bf, %l4 = 00000000ae339ae5
	ldstub	[%o1+0x001],%l4		! %l4 = 00000005000000ff
!	%l4 = 00000005, %l5 = 00000000, Mem[0000000030101408] = 5d6c9105 894dd97c
	stda	%l4,[%i4+%o4]0x81	! Mem[0000000030101408] = 00000005 00000000
!	Starting 10 instruction Load Burst
!	Code Fragment 3
p0_fragment_11:
!	%l0 = 0000000000000000
	setx	0x293471e879cf9b0e,%g7,%l0 ! %l0 = 293471e879cf9b0e
!	%l1 = 3fddd367b20de369
	setx	0x379c7f079d364f7a,%g7,%l1 ! %l1 = 379c7f079d364f7a
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 293471e879cf9b0e
	setx	0x164c1c4ff6816576,%g7,%l0 ! %l0 = 164c1c4ff6816576
!	%l1 = 379c7f079d364f7a
	setx	0x79210717c57864d5,%g7,%l1 ! %l1 = 79210717c57864d5

p0_label_99:
!	Mem[00000000300c1408] = 894dd97c, %l6 = 5d6c9105894dd97c
	ldsba	[%i3+%o4]0x89,%l6	! %l6 = 000000000000007c
!	Mem[00000000201c0000] = ffff6bf6, %l1 = 79210717c57864d5
	lduha	[%o0+0x000]%asi,%l1	! %l1 = 000000000000ffff
!	Mem[00000000100c142c] = ffbd5252, %f22 = 577b7a0a
	lda	[%i3+0x02c]%asi,%f22	! %f22 = ffbd5252
!	Mem[00000000100c1418] = e59a33ae, %l3 = 0000000000000000
	ldsh	[%i3+0x01a],%l3		! %l3 = 00000000000033ae
!	Mem[0000000010141430] = 643cffce, %l5 = 0000000000000000
	ldsha	[%i5+0x030]%asi,%l5	! %l5 = 000000000000643c
!	Mem[0000000010001410] = 82dea6ff, %l2 = 000000005d6c9105
	ldsha	[%i0+%o5]0x88,%l2	! %l2 = ffffffffffffa6ff
!	Mem[0000000030001400] = 000000ff, %l1 = 000000000000ffff
	lduwa	[%i0+%g0]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030141400] = ff007940894dde7c, %l0 = 164c1c4ff6816576
	ldxa	[%i5+%g0]0x81,%l0	! %l0 = ff007940894dde7c
!	Mem[0000000030181408] = 037721ec, %l1 = 00000000000000ff
	ldsha	[%i6+%o4]0x89,%l1	! %l1 = 00000000000021ec
!	Starting 10 instruction Store Burst
!	%f17 = ff340d73, Mem[00000000100c1400] = ff000000
	sta	%f17,[%i3+%g0]0x80	! Mem[00000000100c1400] = ff340d73

p0_label_100:
!	%l0 = ff007940894dde7c, Mem[0000000010001400] = d35f96da
	stwa	%l0,[%i0+%g0]0x80	! Mem[0000000010001400] = 894dde7c
!	%l2 = ffffffffffffa6ff, Mem[0000000020800040] = 52ff359e, %asi = 80
	stba	%l2,[%o1+0x040]%asi	! Mem[0000000020800040] = ffff359e
!	%f0  = ff00009d 5d6c91ff, Mem[00000000300c1408] = 7cd94d89 05916c5d
	stda	%f0 ,[%i3+%o4]0x81	! Mem[00000000300c1408] = ff00009d 5d6c91ff
	membar	#Sync			! Added by membar checker (13)
!	%f13 = c78dcd1f, Mem[0000000010041430] = 4377bb05
	sta	%f13,[%i1+0x030]%asi	! Mem[0000000010041430] = c78dcd1f
!	Mem[0000000010001410] = 82dea6ff, %l3 = 00000000000033ae
	ldstuba	[%i0+%o5]0x88,%l3	! %l3 = 000000ff000000ff
!	%l1 = 00000000000021ec, Mem[0000000030181410] = 5d0000009d059253
	stxa	%l1,[%i6+%o5]0x81	! Mem[0000000030181410] = 00000000000021ec
!	%l2 = ffffa6ff, %l3 = 000000ff, Mem[0000000030081400] = 00000000 6a315fc1
	stda	%l2,[%i2+%g0]0x81	! Mem[0000000030081400] = ffffa6ff 000000ff
!	Mem[00000000218001c0] = 070813ce, %l2 = ffffffffffffa6ff
	ldstub	[%o3+0x1c0],%l2		! %l2 = 00000007000000ff
!	%l1 = 00000000000021ec, imm = fffffffffffff81d, %l6 = 000000000000007c
	addc	%l1,-0x7e3,%l6		! %l6 = 0000000000001a09
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = ffffc666, %l7 = 0000000000000000
	lduh	[%o2+%g0],%l7		! %l7 = 000000000000ffff

p0_label_101:
!	Mem[0000000030141400] = ff007940894dde7c, %l3 = 00000000000000ff
	ldxa	[%i5+%g0]0x81,%l3	! %l3 = ff007940894dde7c
!	Mem[00000000211c0000] = ffffc666, %l6 = 0000000000001a09
	lduh	[%o2+%g0],%l6		! %l6 = 000000000000ffff
!	Mem[0000000010081410] = 2669d7ba, %l1 = 00000000000021ec
	lduwa	[%i2+%o5]0x88,%l1	! %l1 = 000000002669d7ba
!	Mem[0000000030041408] = e600000000000000, %f22 = ffbd5252 ec217703
	ldda	[%i1+%o4]0x89,%f22	! %f22 = e6000000 00000000
!	Mem[0000000030001408] = 6f32787f, %l4 = 0000000000000005
	ldsba	[%i0+%o4]0x89,%l4	! %l4 = 000000000000007f
!	Mem[00000000100c1414] = 05916c5d, %l3 = ff007940894dde7c
	ldsw	[%i3+0x014],%l3		! %l3 = 0000000005916c5d
!	Mem[00000000300c1410] = 1f617940 917effff, %l0 = 894dde7c, %l1 = 2669d7ba
	ldda	[%i3+%o5]0x89,%l0	! %l0 = 00000000917effff 000000001f617940
!	%f25 = ffff0000, %f6  = bacb85e3, %f4  = bad76926 e10ece31
	fsmuld	%f25,%f6 ,%f4 		! %f4  = ffffe000 00000000
!	Mem[0000000030001410] = 05916c5da28d2b97, %l5 = 000000000000643c
	ldxa	[%i0+%o5]0x81,%l5	! %l5 = 05916c5da28d2b97
!	Starting 10 instruction Store Burst
!	%f23 = 00000000, Mem[0000000010181420] = c1e6ac7d
	sta	%f23,[%i6+0x020]%asi	! Mem[0000000010181420] = 00000000

p0_label_102:
!	%l4 = 000000000000007f, Mem[00000000300c1410] = 1f617940917effff
	stxa	%l4,[%i3+%o5]0x89	! Mem[00000000300c1410] = 000000000000007f
!	Mem[0000000030181400] = 00000000, %l0 = 00000000917effff
	ldstuba	[%i6+%g0]0x81,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010101417] = 00000000, %l7 = 000000000000ffff
	ldstuba	[%i4+0x017]%asi,%l7	! %l7 = 00000000000000ff
!	%l4 = 000000000000007f, Mem[0000000020800000] = ffff98bf
	stb	%l4,[%o1+%g0]		! Mem[0000000020800000] = 7fff98bf
!	%f15 = 5d6c91ff, Mem[0000000010141400] = 05916c00
	sta	%f15,[%i5+%g0]0x88	! Mem[0000000010141400] = 5d6c91ff
!	Mem[0000000010181420] = 000000000b419631, %l6 = 000000000000ffff, %l2 = 0000000000000007
	add	%i6,0x20,%g1
	casxa	[%g1]0x80,%l6,%l2	! %l2 = 000000000b419631
!	%l3 = 0000000005916c5d, Mem[0000000021800040] = b2ac0f03, %asi = 80
	stba	%l3,[%o3+0x040]%asi	! Mem[0000000021800040] = 5dac0f03
!	%f20 = 00000000 a90947ef, Mem[0000000010101400] = 5392d4e4 5d6c9105
	stda	%f20,[%i4+%g0]0x88	! Mem[0000000010101400] = 00000000 a90947ef
!	%l4 = 000000000000007f, Mem[0000000030041410] = 6f32787f
	stha	%l4,[%i1+%o5]0x81	! Mem[0000000030041410] = 007f787f
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = 00000000, %l7 = 0000000000000000
	lduha	[%i1+%g0]0x81,%l7	! %l7 = 0000000000000000

p0_label_103:
!	Mem[0000000030141410] = ff00e8e8, %l3 = 0000000005916c5d
	lduba	[%i5+%o5]0x81,%l3	! %l3 = 00000000000000ff
!	%f5  = 00000000, %f13 = c78dcd1f
	fcmpes	%fcc1,%f5 ,%f13		! %fcc1 = 2
!	Mem[0000000030001400] = ff000000 63000000 7f78326f ffffd2ef
!	Mem[0000000030001410] = 05916c5d a28d2b97 3fd4f6b1 6bac2748
!	Mem[0000000030001420] = 5e1274e7 a4e0e78b 189119a2 0ffe00ee
!	Mem[0000000030001430] = d19d02da d35f234f 04089650 a7ce975d
	ldda	[%i0]ASI_BLK_SL,%f0	! Block Load from 0000000030001400
!	Mem[0000000030081410] = 86000000, %l5 = 05916c5da28d2b97
	lduwa	[%i2+%o5]0x81,%l5	! %l5 = 0000000086000000
!	Mem[0000000010001410] = ffa6de82, %l7 = 00000000, %l2 = 0b419631
	add	%i0,0x10,%g1
	casa	[%g1]0x80,%l7,%l2	! %l2 = 00000000ffa6de82
!	Mem[0000000030141408] = cfa63382, %l1 = 000000001f617940
	ldswa	[%i5+%o4]0x89,%l1	! %l1 = ffffffffcfa63382
!	%f25 = ffff0000, %f16 = ffffff7f ff340d73
	fstox	%f25,%f16		! %f16 = 80000000 00000000
!	%l6 = 000000000000ffff, imm = fffffffffffff6de, %l5 = 0000000086000000
	or	%l6,-0x922,%l5		! %l5 = ffffffffffffffff
!	Mem[0000000010181400] = 31000000, %f26 = ffa6de82
	lda	[%i6+%g0]0x88,%f26	! %f26 = 31000000
!	Starting 10 instruction Store Burst
!	%f18 = 8eb5ffff, Mem[000000001010140c] = 97340d73
	st	%f18,[%i4+0x00c]	! Mem[000000001010140c] = 8eb5ffff

p0_label_104:
!	%l2 = 00000000ffa6de82, Mem[0000000030081408] = 000000ff
	stha	%l2,[%i2+%o4]0x89	! Mem[0000000030081408] = 0000de82
!	Mem[0000000010101410] = 00000000, %l0 = 0000000000000000
	ldstuba	[%i4+%o5]0x80,%l0	! %l0 = 00000000000000ff
!	%l6 = 000000000000ffff, Mem[00000000201c0000] = ffff6bf6
	sth	%l6,[%o0+%g0]		! Mem[00000000201c0000] = ffff6bf6
!	Mem[0000000020800041] = ffff359e, %l5 = ffffffffffffffff
	ldstuba	[%o1+0x041]%asi,%l5	! %l5 = 000000ff000000ff
!	%l3 = 00000000000000ff, Mem[0000000030181400] = 6f32787f000000ff
	stxa	%l3,[%i6+%g0]0x89	! Mem[0000000030181400] = 00000000000000ff
!	Code Fragment 4
p0_fragment_12:
!	%l0 = 0000000000000000
	setx	0x1e79af37871886ec,%g7,%l0 ! %l0 = 1e79af37871886ec
!	%l1 = ffffffffcfa63382
	setx	0x05c365f808f47b47,%g7,%l1 ! %l1 = 05c365f808f47b47
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 1e79af37871886ec
	setx	0xa6442c0fad79177e,%g7,%l0 ! %l0 = a6442c0fad79177e
!	%l1 = 05c365f808f47b47
	setx	0x4704aca85470daff,%g7,%l1 ! %l1 = 4704aca85470daff
!	%f30 = 31ce0ee1 2669d7ba, Mem[0000000010181400] = 00000031 0000730d
	stda	%f30,[%i6+%g0]0x80	! Mem[0000000010181400] = 31ce0ee1 2669d7ba
!	Mem[0000000010001400] = 894dde7c, %l2 = 00000000ffa6de82
	swapa	[%i0+%g0]0x80,%l2	! %l2 = 00000000894dde7c
!	Mem[0000000010101400] = a90947ef, %l3 = 00000000000000ff
	swapa	[%i4+%g0]0x88,%l3	! %l3 = 00000000a90947ef
!	Starting 10 instruction Load Burst
!	Mem[0000000010181414] = 86000000, %l2 = 00000000894dde7c
	ldsw	[%i6+0x014],%l2		! %l2 = ffffffff86000000

p0_label_105:
!	Mem[0000000010141430] = 643cffce3196410b, %l1 = 4704aca85470daff
	ldxa	[%i5+0x030]%asi,%l1	! %l1 = 643cffce3196410b
!	Mem[0000000010081400] = ff00009d5d6c91ff, %l2 = ffffffff86000000
	ldxa	[%i2+%g0]0x80,%l2	! %l2 = ff00009d5d6c91ff
!	Mem[0000000010041408] = ff7c0000ffffb58e, %f26 = 31000000 9a327504
	ldda	[%i1+%o4]0x80,%f26	! %f26 = ff7c0000 ffffb58e
!	Mem[0000000030001408] = 7f78326f, %f30 = 31ce0ee1
	lda	[%i0+%o4]0x81,%f30	! %f30 = 7f78326f
!	Mem[0000000020800040] = ffff359e, %l0 = a6442c0fad79177e
	ldsha	[%o1+0x040]%asi,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010181404] = 2669d7ba, %l7 = 0000000000000000
	ldsb	[%i6+0x006],%l7		! %l7 = ffffffffffffffd7
!	Mem[0000000030081408] = 0000de82, %l1 = 643cffce3196410b
	lduwa	[%i2+%o4]0x89,%l1	! %l1 = 000000000000de82
!	Mem[0000000030141410] = 05000000e8e800ff, %l3 = 00000000a90947ef
	ldxa	[%i5+%o5]0x89,%l3	! %l3 = 05000000e8e800ff
!	Mem[0000000010141410] = ff030000, %l0 = ffffffffffffffff
	lduba	[%i5+0x010]%asi,%l0	! %l0 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000010141410] = 000003ff, %l2 = ff00009d5d6c91ff
	ldstuba	[%i5+%o5]0x88,%l2	! %l2 = 000000ff000000ff

p0_label_106:
!	Mem[0000000010081414] = e10ece31, %l2 = 00000000000000ff, %asi = 80
	swapa	[%i2+0x014]%asi,%l2	! %l2 = 00000000e10ece31
!	Mem[000000001014143e] = ffffb58e, %l4 = 000000000000007f
	ldstub	[%i5+0x03e],%l4		! %l4 = 000000b5000000ff
!	%l4 = 00000000000000b5, Mem[0000000030101408] = 05000000
	stwa	%l4,[%i4+%o4]0x89	! Mem[0000000030101408] = 000000b5
!	Mem[0000000030041410] = 007f787f, %l7 = ffffffffffffffd7
	swapa	[%i1+%o5]0x81,%l7	! %l7 = 00000000007f787f
!	Mem[0000000021800001] = 05091cea, %l0 = 00000000000000ff
	ldstub	[%o3+0x001],%l0		! %l0 = 00000009000000ff
!	%l6 = 0000ffff, %l7 = 007f787f, Mem[0000000030081408] = 0000de82 ff000000
	stda	%l6,[%i2+%o4]0x89	! Mem[0000000030081408] = 0000ffff 007f787f
!	Mem[0000000010001404] = 0591e1f4, %l4 = 00000000000000b5
	swap	[%i0+0x004],%l4		! %l4 = 000000000591e1f4
!	%f4  = 972b8da2 5d6c9105, Mem[0000000010101420] = 00000000 000000ff
	std	%f4 ,[%i4+0x020]	! Mem[0000000010101420] = 972b8da2 5d6c9105
!	Mem[0000000010041408] = ff7c0000, %l7 = 00000000007f787f
	swapa	[%i1+%o4]0x80,%l7	! %l7 = 00000000ff7c0000
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = ff000000000000ff, %l7 = 00000000ff7c0000
	ldxa	[%i4+0x010]%asi,%l7	! %l7 = ff000000000000ff

p0_label_107:
!	Mem[0000000030141410] = ff00e8e8, %l5 = 00000000000000ff
	ldswa	[%i5+%o5]0x81,%l5	! %l5 = ffffffffff00e8e8
!	Mem[0000000010081400] = ff00009d5d6c91ff, %f22 = e6000000 00000000
	ldda	[%i2+%g0]0x80,%f22	! %f22 = ff00009d 5d6c91ff
!	Mem[00000000100c1408] = ea320000, %l7 = ff000000000000ff
	lduha	[%i3+%o4]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000010141410] = 730d34ff000003ff, %l2 = 00000000e10ece31
	ldxa	[%i5+%o5]0x88,%l2	! %l2 = 730d34ff000003ff
!	Mem[0000000030101400] = 525200ff, %l0 = 0000000000000009
	ldswa	[%i4+%g0]0x89,%l0	! %l0 = 00000000525200ff
!	Mem[0000000010041408] = 007f787f, %f31 = 2669d7ba
	lda	[%i1+%o4]0x80,%f31	! %f31 = 007f787f
!	Mem[0000000010101408] = 00000086, %l0 = 00000000525200ff
	ldswa	[%i4+%o4]0x88,%l0	! %l0 = 0000000000000086
!	%l5 = ffffffffff00e8e8, Mem[00000000300c1410] = 7f000000
	stba	%l5,[%i3+%o5]0x81	! Mem[00000000300c1410] = e8000000
!	Mem[00000000100c1410] = 000000ff, %l0 = 0000000000000086
	ldswa	[%i3+%o5]0x80,%l0	! %l0 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l7 = 0000000000000000, Mem[0000000010141400] = ff916c5d894dd97c
	stxa	%l7,[%i5+%g0]0x80	! Mem[0000000010141400] = 0000000000000000

p0_label_108:
!	Mem[0000000030181408] = 037721ec, %l6 = 000000000000ffff
	ldstuba	[%i6+%o4]0x89,%l6	! %l6 = 000000ec000000ff
!	%l0 = 00000000000000ff, Mem[0000000010041400] = ff340d73
	stwa	%l0,[%i1+%g0]0x88	! Mem[0000000010041400] = 000000ff
!	%l0 = 00000000000000ff, Mem[0000000030181410] = 00000000
	stha	%l0,[%i6+%o5]0x81	! Mem[0000000030181410] = 00ff0000
!	%f24 = 00000000 ffff0000, %l1 = 000000000000de82
!	Mem[0000000030181400] = ff00000000000000
	stda	%f24,[%i6+%l1]ASI_PST16_SL ! Mem[0000000030181400] = ff00ffff00000000
!	%f23 = 5d6c91ff, Mem[0000000010141410] = 000003ff
	sta	%f23,[%i5+%o5]0x88	! Mem[0000000010141410] = 5d6c91ff
!	%f6  = 4827ac6b, Mem[0000000010181400] = 31ce0ee1
	sta	%f6 ,[%i6+%g0]0x80	! Mem[0000000010181400] = 4827ac6b
!	Mem[0000000030081400] = ffa6ffff, %l3 = 05000000e8e800ff
	ldstuba	[%i2+%g0]0x89,%l3	! %l3 = 000000ff000000ff
!	%l6 = 00000000000000ec, Mem[0000000030081408] = 0000ffff
	stha	%l6,[%i2+%o4]0x89	! Mem[0000000030081408] = 000000ec
!	%l5 = ffffffffff00e8e8, Mem[0000000030181410] = 0000ff00
	stha	%l5,[%i6+%o5]0x89	! Mem[0000000030181410] = 0000e8e8
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = 000032ea ff916c5d, %l2 = 000003ff, %l3 = 000000ff
	ldda	[%i3+0x008]%asi,%l2	! %l2 = 00000000000032ea 00000000ff916c5d

p0_label_109:
!	Mem[00000000300c1400] = 32ea00ff, %l5 = ffffffffff00e8e8
	lduha	[%i3+%g0]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010101408] = 86000000, %l6 = 00000000000000ec
	ldsha	[%i4+%o4]0x80,%l6	! %l6 = ffffffffffff8600
!	Mem[0000000030041410] = ea3296da d7ffffff, %l0 = 000000ff, %l1 = 0000de82
	ldda	[%i1+%o5]0x89,%l0	! %l0 = 00000000d7ffffff 00000000ea3296da
!	Mem[0000000030081410] = 86000000, %l2 = 00000000000032ea
	lduha	[%i2+%o5]0x81,%l2	! %l2 = 0000000000008600
!	Mem[00000000300c1400] = 32ea00ff, %f26 = ff7c0000
	lda	[%i3+%g0]0x89,%f26	! %f26 = 32ea00ff
!	Mem[0000000010081400] = ff00009d5d6c91ff, %l0 = 00000000d7ffffff
	ldxa	[%i2+%g0]0x80,%l0	! %l0 = ff00009d5d6c91ff
!	Mem[0000000010001400] = ffa6de82, %l3 = 00000000ff916c5d
	lduw	[%i0+%g0],%l3		! %l3 = 00000000ffa6de82
!	Code Fragment 4
p0_fragment_13:
!	%l0 = ff00009d5d6c91ff
	setx	0x8b638057a84975bb,%g7,%l0 ! %l0 = 8b638057a84975bb
!	%l1 = 00000000ea3296da
	setx	0x5730b927a78b6367,%g7,%l1 ! %l1 = 5730b927a78b6367
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 8b638057a84975bb
	setx	0xa5ec64a069872c9a,%g7,%l0 ! %l0 = a5ec64a069872c9a
!	%l1 = 5730b927a78b6367
	setx	0x2c0de3e86c06396c,%g7,%l1 ! %l1 = 2c0de3e86c06396c
	membar	#Sync			! Added by membar checker (14)
!	Mem[0000000010181400] = 4827ac6b 2669d7ba 00000000 7f78326f
!	Mem[0000000010181410] = 00000000 86000000 2697a53f 4effafcb
!	Mem[0000000010181420] = 00000000 0b419631 bb47b886 92e6fbc0
!	Mem[0000000010181430] = 5d6c9105 894dd97c 00000005 6a315fc1
	ldda	[%i6]ASI_BLK_AIUP,%f0	! Block Load from 0000000010181400
!	Starting 10 instruction Store Burst
!	Mem[0000000010041408] = 7f787f00, %l3 = 00000000ffa6de82
	ldstuba	[%i1+%o4]0x88,%l3	! %l3 = 00000000000000ff

p0_label_110:
	membar	#Sync			! Added by membar checker (15)
!	%l6 = ffff8600, %l7 = 00000000, Mem[0000000010181400] = 6bac2748 bad76926
	stda	%l6,[%i6+%g0]0x88	! Mem[0000000010181400] = ffff8600 00000000
!	%f28 = 597c85e3 05bb7743, %l2 = 0000000000008600
!	Mem[00000000100c1438] = ff000000f6cda1ad
	add	%i3,0x038,%g1
	stda	%f28,[%g1+%l2]ASI_PST32_PL ! Mem[00000000100c1438] = ff000000f6cda1ad
!	%l6 = ffffffffffff8600, Mem[0000000010141408] = 730d34ff
	stwa	%l6,[%i5+%o4]0x80	! Mem[0000000010141408] = ffff8600
!	%l6 = ffff8600, %l7 = 00000000, Mem[0000000010041400] = 000000ff ffffff7f
	stda	%l6,[%i1+%g0]0x88	! Mem[0000000010041400] = ffff8600 00000000
!	Mem[0000000030001408] = 7f78326f, %l6 = ffffffffffff8600
	ldstuba	[%i0+%o4]0x81,%l6	! %l6 = 0000007f000000ff
!	Mem[0000000010181400] = 0086ffff, %l1 = 2c0de3e86c06396c
	ldstuba	[%i6+%g0]0x80,%l1	! %l1 = 00000000000000ff
!	%l4 = 000000000591e1f4, Mem[0000000030181408] = ff217703
	stwa	%l4,[%i6+%o4]0x81	! Mem[0000000030181408] = 0591e1f4
!	%f14 = 00000005 6a315fc1, %l2 = 0000000000008600
!	Mem[0000000010141418] = ea8bb376ef4c33cb
	add	%i5,0x018,%g1
	stda	%f14,[%g1+%l2]ASI_PST8_PL ! Mem[0000000010141418] = ea8bb376ef4c33cb
!	%f18 = 8eb5ffff 00007c00, %l6 = 000000000000007f
!	Mem[0000000030081408] = ec0000007f787f00
	add	%i2,0x008,%g1
	stda	%f18,[%g1+%l6]ASI_PST16_SL ! Mem[0000000030081408] = 007c0000ffffb58e
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = 4f235fd3, %l6 = 000000000000007f
	lduba	[%i2+%o4]0x80,%l6	! %l6 = 000000000000004f

p0_label_111:
!	Mem[0000000010041400] = ffff8600, %l6 = 000000000000004f
	ldsha	[%i1+%g0]0x88,%l6	! %l6 = ffffffffffff8600
!	Mem[00000000300c1410] = e800000000000000, %l7 = 0000000000000000
	ldxa	[%i3+%o5]0x81,%l7	! %l7 = e800000000000000
!	Mem[0000000010141410] = 5d6c91ff, %l1 = 0000000000000000
	lduba	[%i5+%o5]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[00000000100c1400] = ff340d73, %l7 = e800000000000000
	lduha	[%i3+%g0]0x80,%l7	! %l7 = 000000000000ff34
!	Mem[0000000030041410] = d7ffffff, %l7 = 000000000000ff34
	lduha	[%i1+%o5]0x89,%l7	! %l7 = 000000000000ffff
!	Mem[0000000030141410] = e8e800ff, %f17 = 00000000
	lda	[%i5+%o5]0x89,%f17	! %f17 = e8e800ff
!	Mem[00000000300c1410] = 000000e8, %l1 = 00000000000000ff
	ldswa	[%i3+%o5]0x89,%l1	! %l1 = 00000000000000e8
!	Mem[00000000100c1408] = 000032ea, %l6 = ffffffffffff8600
	ldsha	[%i3+%o4]0x80,%l6	! %l6 = 0000000000000000
!	Mem[00000000300c1408] = 9d0000ff, %l4 = 000000000591e1f4
	lduwa	[%i3+%o4]0x89,%l4	! %l4 = 000000009d0000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000030101410] = 00000000, %l3 = 0000000000000000
	swapa	[%i4+%o5]0x81,%l3	! %l3 = 0000000000000000

p0_label_112:
!	%l0 = 69872c9a, %l1 = 000000e8, Mem[0000000010001400] = ffa6de82 000000b5
	stda	%l0,[%i0+%g0]0x80	! Mem[0000000010001400] = 69872c9a 000000e8
!	%f6  = 2697a53f 4effafcb, Mem[0000000010041408] = ff7f787f ffffb58e
	stda	%f6 ,[%i1+%o4]0x80	! Mem[0000000010041408] = 2697a53f 4effafcb
!	%l6 = 0000000000000000, %l2 = 0000000000008600, %l1 = 00000000000000e8
	xor	%l6,%l2,%l1		! %l1 = 0000000000008600
!	Mem[0000000030001408] = ff78326f, %l4 = 000000009d0000ff
	ldstuba	[%i0+%o4]0x81,%l4	! %l4 = 000000ff000000ff
!	Mem[0000000010141410] = ff916c5dff340d73, %l3 = 0000000000000000, %l0 = a5ec64a069872c9a
	add	%i5,0x10,%g1
	casxa	[%g1]0x80,%l3,%l0	! %l0 = ff916c5dff340d73
!	%f18 = 8eb5ffff, Mem[0000000010081400] = ff00009d
	sta	%f18,[%i2+%g0]0x80	! Mem[0000000010081400] = 8eb5ffff
!	%l6 = 0000000000000000, Mem[00000000100c1410] = ff000000
	stha	%l6,[%i3+%o5]0x88	! Mem[00000000100c1410] = ff000000
!	%f7  = 4effafcb, Mem[00000000300c1400] = ff00ea32
	sta	%f7 ,[%i3+%g0]0x81	! Mem[00000000300c1400] = 4effafcb
!	%l2 = 0000000000008600, Mem[0000000030081410] = 8600000005916c5d
	stxa	%l2,[%i2+%o5]0x81	! Mem[0000000030081410] = 0000000000008600
!	Starting 10 instruction Load Burst
!	Mem[0000000030181410] = 0000e8e8, %l6 = 0000000000000000
	lduba	[%i6+%o5]0x89,%l6	! %l6 = 00000000000000e8

p0_label_113:
!	Mem[0000000010041408] = 2697a53f, %l4 = 00000000000000ff
	ldswa	[%i1+%o4]0x80,%l4	! %l4 = 000000002697a53f
!	Mem[0000000030141400] = ff007940, %l1 = 0000000000008600
	ldsha	[%i5+%g0]0x81,%l1	! %l1 = ffffffffffffff00
	membar	#Sync			! Added by membar checker (16)
!	Mem[0000000010041400] = 0086ffff 00000000 2697a53f 4effafcb
!	Mem[0000000010041410] = ef4709a9 00000000 037721ec 0a7a7b57
!	Mem[0000000010041420] = 0000ffff 00000000 0475329a c46788cf
!	Mem[0000000010041430] = c78dcd1f e3857c59 bad76926 e10ece31
	ldda	[%i1]ASI_BLK_P,%f16	! Block Load from 0000000010041400
!	%l5 = 00000000000000ff, imm = fffffffffffff03a, %l6 = 00000000000000e8
	or	%l5,-0xfc6,%l6		! %l6 = fffffffffffff0ff
!	Mem[0000000010041400] = 0086ffff, %l5 = 00000000000000ff
	ldswa	[%i1+%g0]0x80,%l5	! %l5 = 000000000086ffff
!	Mem[0000000010101410] = ff000000000000ff, %f14 = 00000005 6a315fc1
	ldda	[%i4+%o5]0x88,%f14	! %f14 = ff000000 000000ff
!	Mem[0000000010081400] = 8eb5ffff 5d6c91ff 4f235fd3 894dd97c
!	Mem[0000000010081410] = bad76926 000000ff bacb85e3 ae339ae5
!	Mem[0000000010081420] = c78dcd1f 9013de48 b1ded3c8 00ffffff
!	Mem[0000000010081430] = 8233a6cf c78dcd1f d792467c ae339ae5
	ldda	[%i2]ASI_BLK_P,%f16	! Block Load from 0000000010081400
!	Mem[0000000010181408] = 000000007f78326f, %l6 = fffffffffffff0ff
	ldxa	[%i6+%o4]0x80,%l6	! %l6 = 000000007f78326f
!	Mem[0000000030101410] = 00000000, %l0 = ff916c5dff340d73
	lduba	[%i4+%o5]0x89,%l0	! %l0 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l2 = 00008600, %l3 = 00000000, Mem[00000000300c1408] = 9d0000ff ff916c5d
	stda	%l2,[%i3+%o4]0x89	! Mem[00000000300c1408] = 00008600 00000000

p0_label_114:
!	Mem[0000000010141408] = 0086ffff, %l3 = 0000000000000000
	ldstuba	[%i5+%o4]0x88,%l3	! %l3 = 000000ff000000ff
!	Mem[0000000010001408] = 00000049, %l6 = 000000007f78326f
	swapa	[%i0+%o4]0x88,%l6	! %l6 = 0000000000000049
!	Mem[0000000010141400] = 00000000, %l6 = 0000000000000049
	swapa	[%i5+%g0]0x88,%l6	! %l6 = 0000000000000000
!	Mem[00000000211c0000] = ffffc666, %l1 = ffffffffffffff00
	ldstub	[%o2+%g0],%l1		! %l1 = 000000ff000000ff
!	Mem[0000000020800000] = 7fff98bf, %l1 = 00000000000000ff
	ldstub	[%o1+%g0],%l1		! %l1 = 0000007f000000ff
!	%l4 = 000000002697a53f, Mem[00000000100c1410] = ff000000
	stba	%l4,[%i3+%o5]0x88	! Mem[00000000100c1410] = ff00003f
!	Mem[0000000010081408] = d35f234f, %l5 = 000000000086ffff
	swapa	[%i2+%o4]0x88,%l5	! %l5 = 00000000d35f234f
!	%f8  = 00000000 0b419631, Mem[0000000010001430] = 6bae32ba e8d0dd81
	std	%f8 ,[%i0+0x030]	! Mem[0000000010001430] = 00000000 0b419631
!	Mem[0000000010141400] = 00000049, %l3 = 00000000000000ff
	swapa	[%i5+%g0]0x88,%l3	! %l3 = 0000000000000049
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = 000032ea ff916c5d, %l6 = 00000000, %l7 = 0000ffff
	ldda	[%i3+0x008]%asi,%l6	! %l6 = 00000000000032ea 00000000ff916c5d

p0_label_115:
!	Mem[00000000218000c0] = e8e8e4de, %l4 = 000000002697a53f
	ldub	[%o3+0x0c0],%l4		! %l4 = 00000000000000e8
!	Mem[0000000010101430] = b0a7bc52, %l5 = 00000000d35f234f
	ldsba	[%i4+0x030]%asi,%l5	! %l5 = ffffffffffffffb0
!	Mem[0000000010081408] = 7cd94d890086ffff, %l4 = 00000000000000e8
	ldxa	[%i2+%o4]0x88,%l4	! %l4 = 7cd94d890086ffff
!	Mem[0000000030141408] = 85b7a95dcfa63382, %l7 = 00000000ff916c5d
	ldxa	[%i5+%o4]0x89,%l7	! %l7 = 85b7a95dcfa63382
!	Mem[00000000100c1400] = ff340d7300000000, %l0 = 0000000000000000
	ldxa	[%i3+0x000]%asi,%l0	! %l0 = ff340d7300000000
!	Mem[00000000300c1400] = 730d3497cbafff4e, %l2 = 0000000000008600
	ldxa	[%i3+%g0]0x89,%l2	! %l2 = 730d3497cbafff4e
!	Code Fragment 4
p0_fragment_14:
!	%l0 = ff340d7300000000
	setx	0x7edd58b062a1c583,%g7,%l0 ! %l0 = 7edd58b062a1c583
!	%l1 = 000000000000007f
	setx	0x88f0d590340c0647,%g7,%l1 ! %l1 = 88f0d590340c0647
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 7edd58b062a1c583
	setx	0x959ba387aab8fe14,%g7,%l0 ! %l0 = 959ba387aab8fe14
!	%l1 = 88f0d590340c0647
	setx	0xa618bfa81019db20,%g7,%l1 ! %l1 = a618bfa81019db20
!	Mem[00000000100c1410] = 5d6c9105ff00003f, %f18 = 4f235fd3 894dd97c
	ldda	[%i3+%o5]0x88,%f18	! %f18 = 5d6c9105 ff00003f
!	Mem[0000000010181410] = 00000000, %l1 = a618bfa81019db20
	lduba	[%i6+%o5]0x80,%l1	! %l1 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l5 = ffffffffffffffb0, Mem[0000000030141400] = ff007940
	stwa	%l5,[%i5+%g0]0x81	! Mem[0000000030141400] = ffffffb0

p0_label_116:
	membar	#Sync			! Added by membar checker (17)
!	%f4  = 00000000 86000000, Mem[0000000010041400] = 0086ffff 00000000
	stda	%f4 ,[%i1+%g0]0x80	! Mem[0000000010041400] = 00000000 86000000
!	%l1 = 0000000000000000, %l3 = 0000000000000049, %l6 = 00000000000032ea
	xnor	%l1,%l3,%l6		! %l6 = ffffffffffffffb6
!	%l4 = 0086ffff, %l5 = ffffffb0, Mem[0000000030101410] = 00000000 cfa63382
	stda	%l4,[%i4+%o5]0x81	! Mem[0000000030101410] = 0086ffff ffffffb0
!	%l0 = 959ba387aab8fe14, Mem[0000000030141410] = ff00e8e8
	stwa	%l0,[%i5+%o5]0x81	! Mem[0000000030141410] = aab8fe14
!	Mem[0000000010101436] = 75cdefd2, %l6 = ffffffffffffffb6
	ldstub	[%i4+0x036],%l6		! %l6 = 000000ef000000ff
!	%l2 = 730d3497cbafff4e, Mem[0000000010001400] = 69872c9a000000e8
	stxa	%l2,[%i0+%g0]0x80	! Mem[0000000010001400] = 730d3497cbafff4e
!	Mem[0000000030141408] = 8233a6cf, %l7 = 85b7a95dcfa63382
	swapa	[%i5+%o4]0x81,%l7	! %l7 = 000000008233a6cf
!	Mem[000000001008140c] = 894dd97c, %l0 = 959ba387aab8fe14
	swap	[%i2+0x00c],%l0		! %l0 = 00000000894dd97c
!	%l4 = 7cd94d890086ffff, %l5 = ffffffffffffffb0, %l3 = 0000000000000049
	xnor	%l4,%l5,%l3		! %l3 = 7cd94d890086ffb0
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = 00000000, %l5 = ffffffffffffffb0
	ldsha	[%i6+%o5]0x88,%l5	! %l5 = 0000000000000000

p0_label_117:
!	Mem[0000000010081410] = 2669d7ba, %l2 = 730d3497cbafff4e
	ldsba	[%i2+%o5]0x88,%l2	! %l2 = ffffffffffffffba
!	Mem[0000000030001410] = 05916c5d, %l0 = 00000000894dd97c
	ldswa	[%i0+%o5]0x81,%l0	! %l0 = 0000000005916c5d
!	Mem[0000000010141428] = 00000000 00002dc5, %l2 = ffffffba, %l3 = 0086ffb0
	ldd	[%i5+0x028],%l2		! %l2 = 0000000000000000 0000000000002dc5
!	Mem[00000000211c0000] = ffffc666, %l1 = 0000000000000000
	ldsba	[%o2+0x001]%asi,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010001408] = 7f78326f, %l4 = 7cd94d890086ffff
	lduwa	[%i0+%o4]0x88,%l4	! %l4 = 000000007f78326f
!	Mem[0000000010101410] = 000000ff, %l2 = 0000000000000000
	lduwa	[%i4+%o5]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030081408] = 00007c00, %l3 = 0000000000002dc5
	ldsba	[%i2+%o4]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000010001414] = 00000034, %f8  = 00000000
	lda	[%i0+0x014]%asi,%f8 	! %f8 = 00000034
!	Mem[0000000010081400] = 8eb5ffff, %l2 = 00000000000000ff
	lduwa	[%i2+%g0]0x80,%l2	! %l2 = 000000008eb5ffff
!	Starting 10 instruction Store Burst
!	%f11 = 92e6fbc0, Mem[0000000030101410] = ffff8600
	sta	%f11,[%i4+%o5]0x89	! Mem[0000000030101410] = 92e6fbc0

p0_label_118:
!	%f0  = 4827ac6b 2669d7ba, Mem[0000000030081400] = ffa6ffff ff000000
	stda	%f0 ,[%i2+%g0]0x89	! Mem[0000000030081400] = 4827ac6b 2669d7ba
!	%l1 = ffffffffffffffff, Mem[00000000211c0001] = ffffc666, %asi = 80
	stba	%l1,[%o2+0x001]%asi	! Mem[00000000211c0000] = ffffc666
!	%l4 = 7f78326f, %l5 = 00000000, Mem[0000000010181400] = ffff86ff 00000000
	stda	%l4,[%i6+%g0]0x88	! Mem[0000000010181400] = 7f78326f 00000000
!	%f24 = c78dcd1f 9013de48, Mem[0000000010181408] = 00000000 6f32787f
	stda	%f24,[%i6+%o4]0x88	! Mem[0000000010181408] = c78dcd1f 9013de48
!	Mem[0000000010101400] = 000000ff, %l7 = 000000008233a6cf
	swapa	[%i4+%g0]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030181410] = e8e80000, %l2 = 000000008eb5ffff
	swapa	[%i6+%o5]0x81,%l2	! %l2 = 00000000e8e80000
!	%f3  = 7f78326f, Mem[0000000030001400] = ff000000
	sta	%f3 ,[%i0+%g0]0x81	! Mem[0000000030001400] = 7f78326f
!	Mem[0000000020800041] = ffff359e, %l6 = 00000000000000ef
	ldstuba	[%o1+0x041]%asi,%l6	! %l6 = 000000ff000000ff
!	%l6 = 00000000000000ff, Mem[00000000100c1408] = 000032ea
	stha	%l6,[%i3+%o4]0x80	! Mem[00000000100c1408] = 00ff32ea
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = c78dcd1f9013de48, %l6 = 00000000000000ff
	ldxa	[%i6+%o4]0x88,%l6	! %l6 = c78dcd1f9013de48

p0_label_119:
!	Mem[0000000010101408] = 00000086, %f20 = bad76926
	lda	[%i4+%o4]0x88,%f20	! %f20 = 00000086
!	Mem[00000000100c1400] = ff340d73, %l7 = 00000000000000ff
	ldsba	[%i3+%g0]0x80,%l7	! %l7 = ffffffffffffffff
!	Code Fragment 4
p0_fragment_15:
!	%l0 = 0000000005916c5d
	setx	0x590ed36016b811d0,%g7,%l0 ! %l0 = 590ed36016b811d0
!	%l1 = ffffffffffffffff
	setx	0x1b70341038900911,%g7,%l1 ! %l1 = 1b70341038900911
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 590ed36016b811d0
	setx	0x3946ced062dc7a58,%g7,%l0 ! %l0 = 3946ced062dc7a58
!	%l1 = 1b70341038900911
	setx	0xe4cf7b379b82abf0,%g7,%l1 ! %l1 = e4cf7b379b82abf0
!	Mem[00000000211c0000] = ffffc666, %l2 = 00000000e8e80000
	ldsh	[%o2+%g0],%l2		! %l2 = ffffffffffffffff
!	Mem[0000000030001400] = 7f78326f63000000, %f12 = 5d6c9105 894dd97c
	ldda	[%i0+%g0]0x81,%f12	! %f12 = 7f78326f 63000000
!	Mem[00000000300c1408] = 00860000, %f0  = 4827ac6b
	lda	[%i3+%o4]0x81,%f0 	! %f0 = 00860000
!	Mem[0000000030081410] = 00000000, %l6 = c78dcd1f9013de48
	lduha	[%i2+%o5]0x81,%l6	! %l6 = 0000000000000000
	membar	#Sync			! Added by membar checker (18)
!	Mem[0000000010041400] = 00000000 86000000 2697a53f 4effafcb
!	Mem[0000000010041410] = ef4709a9 00000000 037721ec 0a7a7b57
!	Mem[0000000010041420] = 0000ffff 00000000 0475329a c46788cf
!	Mem[0000000010041430] = c78dcd1f e3857c59 bad76926 e10ece31
	ldda	[%i1]ASI_BLK_P,%f16	! Block Load from 0000000010041400
!	Mem[0000000030081408] = 00007c00, %f7  = 4effafcb
	lda	[%i2+%o4]0x89,%f7 	! %f7 = 00007c00
!	Starting 10 instruction Store Burst
!	%l2 = ffffffffffffffff, Mem[0000000030141400] = ffffffb0
	stwa	%l2,[%i5+%g0]0x81	! Mem[0000000030141400] = ffffffff

p0_label_120:
!	%l7 = ffffffffffffffff, Mem[00000000211c0000] = ffffc666, %asi = 80
	stha	%l7,[%o2+0x000]%asi	! Mem[00000000211c0000] = ffffc666
!	%l2 = ffffffffffffffff, Mem[0000000030041400] = 00000000
	stha	%l2,[%i1+%g0]0x81	! Mem[0000000030041400] = ffff0000
!	%l1 = e4cf7b379b82abf0, Mem[0000000010101408] = 00000086
	stba	%l1,[%i4+%o4]0x88	! Mem[0000000010101408] = 000000f0
!	%l6 = 0000000000000000, %l2 = ffffffffffffffff, %l3 = 0000000000000000
	andn	%l6,%l2,%l3		! %l3 = 0000000000000000
!	%l0 = 62dc7a58, %l1 = 9b82abf0, Mem[0000000030001400] = 6f32787f 00000063
	stda	%l0,[%i0+%g0]0x89	! Mem[0000000030001400] = 62dc7a58 9b82abf0
!	Mem[0000000030181400] = ffff00ff, %l1 = e4cf7b379b82abf0
	swapa	[%i6+%g0]0x89,%l1	! %l1 = 00000000ffff00ff
!	Mem[00000000100c1420] = c16c5c31, %l4 = 000000007f78326f
	swap	[%i3+0x020],%l4		! %l4 = 00000000c16c5c31
!	Mem[0000000010041410] = ef4709a900000000, %l4 = 00000000c16c5c31, %l2 = ffffffffffffffff
	add	%i1,0x10,%g1
	casxa	[%g1]0x80,%l4,%l2	! %l2 = ef4709a900000000
!	%l1 = 00000000ffff00ff, Mem[0000000030041410] = ea3296dad7ffffff
	stxa	%l1,[%i1+%o5]0x89	! Mem[0000000030041410] = 00000000ffff00ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = b5000000, %l2 = ef4709a900000000
	lduba	[%i4+%o4]0x81,%l2	! %l2 = 00000000000000b5

p0_label_121:
!	Mem[0000000010041410] = ef4709a9, %l2 = 00000000000000b5
	ldsba	[%i1+%o5]0x80,%l2	! %l2 = ffffffffffffffef
!	Mem[0000000010101420] = 972b8da2, %f6  = 2697a53f
	lda	[%i4+0x020]%asi,%f6 	! %f6 = 972b8da2
!	Mem[0000000010081408] = 0086ffff, %l5 = 0000000000000000
	lduha	[%i2+%o4]0x88,%l5	! %l5 = 000000000000ffff
!	Mem[0000000010181400] = 6f32787f, %l4 = 00000000c16c5c31
	lduwa	[%i6+%g0]0x80,%l4	! %l4 = 000000006f32787f
!	Mem[0000000010001410] = ffa6de8200000034, %f12 = 7f78326f 63000000
	ldda	[%i0+%o5]0x80,%f12	! %f12 = ffa6de82 00000034
!	%l0 = 3946ced062dc7a58, imm = 0000000000000bc1, %l1 = 00000000ffff00ff
	xnor	%l0,0xbc1,%l1		! %l1 = c6b9312f9d238e66
!	Mem[0000000030141408] = 8233a6cf, %l0 = 3946ced062dc7a58
	lduha	[%i5+%o4]0x89,%l0	! %l0 = 000000000000a6cf
!	Mem[0000000010141410] = ff916c5d, %l2 = ffffffffffffffef
	lduha	[%i5+%o5]0x80,%l2	! %l2 = 000000000000ff91
!	Mem[000000001014142c] = 00002dc5, %f1  = 2669d7ba
	lda	[%i5+0x02c]%asi,%f1 	! %f1 = 00002dc5
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1408] = 00008600, %l3 = 0000000000000000
	swapa	[%i3+%o4]0x89,%l3	! %l3 = 0000000000008600

p0_label_122:
!	%f10 = bb47b886 92e6fbc0, Mem[00000000100c1408] = 00ff32ea ff916c5d
	stda	%f10,[%i3+%o4]0x80	! Mem[00000000100c1408] = bb47b886 92e6fbc0
!	%l2 = 000000000000ff91, Mem[0000000030181400] = 9b82abf0
	stba	%l2,[%i6+%g0]0x89	! Mem[0000000030181400] = 9b82ab91
!	Mem[0000000010081400] = 8eb5ffff, %l6 = 0000000000000000
	swapa	[%i2+%g0]0x80,%l6	! %l6 = 000000008eb5ffff
!	Mem[0000000030081410] = 00000000, %l6 = 000000008eb5ffff
	swapa	[%i2+%o5]0x81,%l6	! %l6 = 0000000000000000
!	%l4 = 6f32787f, %l5 = 0000ffff, Mem[00000000100c1408] = bb47b886 92e6fbc0
	stda	%l4,[%i3+%o4]0x80	! Mem[00000000100c1408] = 6f32787f 0000ffff
!	Mem[0000000010141414] = ff340d73, %l7 = ffffffffffffffff, %asi = 80
	swapa	[%i5+0x014]%asi,%l7	! %l7 = 00000000ff340d73
!	%l7 = 00000000ff340d73, Mem[0000000010141408] = ffff8600c78dcd1f
	stx	%l7,[%i5+%o4]		! Mem[0000000010141408] = 00000000ff340d73
!	%f7  = 00007c00, Mem[0000000010081408] = ffff8600
	sta	%f7 ,[%i2+%o4]0x80	! Mem[0000000010081408] = 00007c00
!	%l2 = 0000ff91, %l3 = 00008600, Mem[0000000010001428] = 00000000 4da2c09a
	std	%l2,[%i0+0x028]		! Mem[0000000010001428] = 0000ff91 00008600
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = ffff6bf6, %l1 = c6b9312f9d238e66
	ldsba	[%o0+0x000]%asi,%l1	! %l1 = ffffffffffffffff

p0_label_123:
!	Mem[0000000030001408] = 6f3278ff, %l6 = 0000000000000000
	ldsba	[%i0+%o4]0x89,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010041408] = 2697a53f, %l2 = 000000000000ff91
	lduba	[%i1+0x00b]%asi,%l2	! %l2 = 000000000000003f
!	Mem[0000000030181410] = 8eb5ffff, %l6 = ffffffffffffffff
	ldsba	[%i6+%o5]0x81,%l6	! %l6 = ffffffffffffff8e
!	Mem[0000000010001400] = 730d3497, %l2 = 000000000000003f
	ldsha	[%i0+%g0]0x80,%l2	! %l2 = 000000000000730d
!	Mem[0000000030181410] = ffffb58e, %l2 = 000000000000730d
	lduwa	[%i6+%o5]0x89,%l2	! %l2 = 00000000ffffb58e
!	Mem[0000000030141400] = ffffffff, %l4 = 000000006f32787f
	lduba	[%i5+%g0]0x81,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030181410] = ffffb58e, %f14 = ff000000
	lda	[%i6+%o5]0x89,%f14	! %f14 = ffffb58e
!	Mem[0000000010181408] = 9013de48, %l5 = 000000000000ffff
	ldsha	[%i6+%o4]0x88,%l5	! %l5 = ffffffffffffde48
!	Mem[0000000030001400] = 587adc62f0ab829b, %f18 = 2697a53f 4effafcb
	ldda	[%i0+%g0]0x81,%f18	! %f18 = 587adc62 f0ab829b
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (19)
!	%f8  = 00000034, Mem[0000000010041408] = 2697a53f
	sta	%f8 ,[%i1+%o4]0x80	! Mem[0000000010041408] = 00000034

p0_label_124:
!	%f4  = 00000000, Mem[0000000030141400] = ffffffff
	sta	%f4 ,[%i5+%g0]0x89	! Mem[0000000030141400] = 00000000
!	%l4 = 00000000000000ff, Mem[0000000010141410] = ffffffff5d6c91ff
	stxa	%l4,[%i5+%o5]0x88	! Mem[0000000010141410] = 00000000000000ff
!	Mem[00000000201c0000] = ffff6bf6, %l6 = ffffffffffffff8e
	ldstuba	[%o0+0x000]%asi,%l6	! %l6 = 000000ff000000ff
!	%l4 = 00000000000000ff, Mem[0000000030081410] = ffffb58e
	stha	%l4,[%i2+%o5]0x89	! Mem[0000000030081410] = ffff00ff
!	Mem[0000000010001410] = 82dea6ff, %l7 = 00000000ff340d73
	ldstuba	[%i0+%o5]0x88,%l7	! %l7 = 000000ff000000ff
!	Mem[0000000010081408] = 007c0000, %l1 = ffffffffffffffff
	ldstuba	[%i2+%o4]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[00000000211c0000] = ffffc666, %l3 = 0000000000008600
	ldstuba	[%o2+0x000]%asi,%l3	! %l3 = 000000ff000000ff
!	%l2 = ffffb58e, %l3 = 000000ff, Mem[0000000010101408] = 000000f0 ffffb58e
	stda	%l2,[%i4+%o4]0x88	! Mem[0000000010101408] = ffffb58e 000000ff
!	Mem[0000000010041410] = a90947ef, %l5 = ffffffffffffde48
	ldstuba	[%i1+%o5]0x88,%l5	! %l5 = 000000ef000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = 8233a6cf, %l4 = 00000000000000ff
	lduha	[%i4+%g0]0x88,%l4	! %l4 = 000000000000a6cf

p0_label_125:
!	Mem[0000000030181400] = 91ab829b, %l3 = 00000000000000ff
	ldsha	[%i6+%g0]0x81,%l3	! %l3 = ffffffffffff91ab
!	Mem[0000000030081410] = ff00ffff, %f10 = bb47b886
	lda	[%i2+%o5]0x81,%f10	! %f10 = ff00ffff
!	Mem[0000000010141400] = 000000ff, %l2 = 00000000ffffb58e
	lduha	[%i5+%g0]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010101408] = 8eb5ffff ff000000, %l0 = 0000a6cf, %l1 = 00000000
	ldd	[%i4+%o4],%l0		! %l0 = 000000008eb5ffff 00000000ff000000
!	Mem[0000000030101410] = 92e6fbc0, %f11 = 92e6fbc0
	lda	[%i4+%o5]0x89,%f11	! %f11 = 92e6fbc0
!	Mem[0000000010001400] = 730d3497, %l0 = 000000008eb5ffff
	ldswa	[%i0+%g0]0x80,%l0	! %l0 = 00000000730d3497
!	Mem[0000000010181400] = 6f32787f, %f24 = 0000ffff
	ld	[%i6+%g0],%f24	! %f24 = 6f32787f
!	Mem[0000000030041408] = e600000000000000, %l4 = 000000000000a6cf
	ldxa	[%i1+%o4]0x89,%l4	! %l4 = e600000000000000
!	Mem[0000000030141408] = 8233a6cf, %l1 = 00000000ff000000
	lduba	[%i5+%o4]0x89,%l1	! %l1 = 00000000000000cf
!	Starting 10 instruction Store Burst
!	%l1 = 00000000000000cf, Mem[0000000010141410] = 000000ff
	stba	%l1,[%i5+%o5]0x88	! Mem[0000000010141410] = 000000cf

p0_label_126:
!	%f20 = ef4709a9 00000000, %l1 = 00000000000000cf
!	Mem[0000000010181418] = 2697a53f4effafcb
	add	%i6,0x018,%g1
	stda	%f20,[%g1+%l1]ASI_PST8_PL ! Mem[0000000010181418] = 000000004eff47ef
!	%l7 = 00000000000000ff, Mem[0000000030141408] = 8233a6cf
	stba	%l7,[%i5+%o4]0x89	! Mem[0000000030141408] = 8233a6ff
!	%f31 = e10ece31, Mem[0000000010141408] = 00000000
	sta	%f31,[%i5+%o4]0x88	! Mem[0000000010141408] = e10ece31
!	Mem[0000000030141400] = 00000000, %l1 = 00000000000000cf
	swapa	[%i5+%g0]0x81,%l1	! %l1 = 0000000000000000
!	Mem[000000001008143c] = ae339ae5, %l7 = 00000000000000ff
	swap	[%i2+0x03c],%l7		! %l7 = 00000000ae339ae5
!	Mem[000000001008142c] = 00ffffff, %l1 = 0000000000000000, %asi = 80
	swapa	[%i2+0x02c]%asi,%l1	! %l1 = 0000000000ffffff
!	%l2 = 00000000000000ff, Mem[0000000021800000] = 05ff1cea, %asi = 80
	stha	%l2,[%o3+0x000]%asi	! Mem[0000000021800000] = 00ff1cea
!	%f4  = 00000000, Mem[0000000010041430] = c78dcd1f
	sta	%f4 ,[%i1+0x030]%asi	! Mem[0000000010041430] = 00000000
!	%l7 = 00000000ae339ae5, imm = 000000000000026d, %l5 = 00000000000000ef
	andn	%l7,0x26d,%l5		! %l5 = 00000000ae339880
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = 007c0000, %l4 = e600000000000000
	lduba	[%i2+%o4]0x81,%l4	! %l4 = 0000000000000000

p0_label_127:
!	%l3 = ffffffffffff91ab, %l5 = 00000000ae339880, %l5 = 00000000ae339880
	or	%l3,%l5,%l5		! %l5 = ffffffffffff99ab
!	Mem[0000000010101400] = 8233a6cf, %l6 = 00000000000000ff
	lduwa	[%i4+%g0]0x88,%l6	! %l6 = 000000008233a6cf
!	Mem[0000000030041400] = 0000ffff, %f19 = f0ab829b
	lda	[%i1+%g0]0x89,%f19	! %f19 = 0000ffff
!	Mem[00000000100c1430] = ffffffff ffe1e712, %l0 = 730d3497, %l1 = 00ffffff
	ldda	[%i3+0x030]%asi,%l0	! %l0 = 00000000ffffffff 00000000ffe1e712
!	Mem[0000000010181420] = 000000000b419631, %f6  = 972b8da2 00007c00
	ldda	[%i6+0x020]%asi,%f6 	! %f6  = 00000000 0b419631
!	Mem[0000000010101410] = ff000000, %f30 = bad76926
	lda	[%i4+%o5]0x80,%f30	! %f30 = ff000000
!	Mem[0000000030101410] = c0fbe692ffffffb0, %l5 = ffffffffffff99ab
	ldxa	[%i4+%o5]0x81,%l5	! %l5 = c0fbe692ffffffb0
!	Mem[0000000030001408] = ff78326f, %l1 = 00000000ffe1e712
	ldsha	[%i0+%o4]0x81,%l1	! %l1 = ffffffffffffff78
!	Mem[0000000030001400] = 587adc62, %f6  = 00000000
	lda	[%i0+%g0]0x81,%f6 	! %f6 = 587adc62
!	Starting 10 instruction Store Burst
!	%l1 = ffffffffffffff78, immd = 0000000000000536, %l4  = 0000000000000000
	mulx	%l1,0x536,%l4		! %l4 = fffffffffffd3b50

p0_label_128:
!	%l5 = c0fbe692ffffffb0, Mem[0000000030041410] = ff00ffff
	stha	%l5,[%i1+%o5]0x81	! Mem[0000000030041410] = ffb0ffff
!	Mem[0000000030001408] = 6f3278ff, %l5 = c0fbe692ffffffb0
	ldstuba	[%i0+%o4]0x89,%l5	! %l5 = 000000ff000000ff
!	%l6 = 000000008233a6cf, %l0 = 00000000ffffffff, %l7 = 00000000ae339ae5
	xnor	%l6,%l0,%l7		! %l7 = ffffffff8233a6cf
!	%f5  = 86000000, Mem[0000000010101408] = 8eb5ffff
	sta	%f5 ,[%i4+0x008]%asi	! Mem[0000000010101408] = 86000000
!	%f2  = 00000000 7f78326f, Mem[0000000010081408] = ff007c00 aab8fe14
	std	%f2 ,[%i2+%o4]	! Mem[0000000010081408] = 00000000 7f78326f
!	%l5 = 00000000000000ff, Mem[0000000030041408] = 00000000
	stha	%l5,[%i1+%o4]0x81	! Mem[0000000030041408] = 00ff0000
!	%f18 = 587adc62, Mem[0000000010081410] = 2669d7ba
	sta	%f18,[%i2+%o5]0x88	! Mem[0000000010081410] = 587adc62
!	%l2 = 000000ff, %l3 = ffff91ab, Mem[0000000010081400] = 00000000 5d6c91ff
	stda	%l2,[%i2+%g0]0x80	! Mem[0000000010081400] = 000000ff ffff91ab
!	Mem[0000000030001410] = 5d6c9105, %l2 = 00000000000000ff
	swapa	[%i0+%o5]0x89,%l2	! %l2 = 000000005d6c9105
!	Starting 10 instruction Load Burst
!	Mem[0000000010041420] = 0000ffff00000000, %l4 = fffffffffffd3b50
	ldx	[%i1+0x020],%l4		! %l4 = 0000ffff00000000

p0_label_129:
!	Mem[00000000300c1400] = 4effafcb97340d73, %f2  = 00000000 7f78326f
	ldda	[%i3+%g0]0x81,%f2 	! %f2  = 4effafcb 97340d73
!	Mem[0000000030141410] = 14feb8aa, %l0 = 00000000ffffffff
	lduwa	[%i5+%o5]0x89,%l0	! %l0 = 0000000014feb8aa
!	Mem[0000000010081404] = ffff91ab, %l4 = 0000ffff00000000
	ldsba	[%i2+0x005]%asi,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010181408] = 48de1390, %l7 = ffffffff8233a6cf
	ldsha	[%i6+%o4]0x80,%l7	! %l7 = 00000000000048de
!	Mem[0000000010041410] = ff4709a9 00000000, %l0 = 14feb8aa, %l1 = ffffff78
	ldda	[%i1+%o5]0x80,%l0	! %l0 = 00000000ff4709a9 0000000000000000
!	Mem[0000000021800080] = 059d2e32, %l3 = ffffffffffff91ab
	ldub	[%o3+0x080],%l3		! %l3 = 0000000000000005
!	Mem[00000000100c1408] = ffff00007f78326f, %l3 = 0000000000000005
	ldxa	[%i3+%o4]0x88,%l3	! %l3 = ffff00007f78326f
!	Mem[0000000010041410] = a90947ff, %l0 = 00000000ff4709a9
	ldswa	[%i1+%o5]0x88,%l0	! %l0 = ffffffffa90947ff
!	Mem[0000000010101410] = ff000000000000ff, %f26 = 0475329a c46788cf
	ldda	[%i4+%o5]0x88,%f26	! %f26 = ff000000 000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000030001410] = 000000ff, %l1 = 0000000000000000
	ldstuba	[%i0+%o5]0x89,%l1	! %l1 = 000000ff000000ff

p0_label_130:
!	Mem[0000000010101400] = 8233a6cf, %l0 = ffffffffa90947ff
	ldstuba	[%i4+%g0]0x88,%l0	! %l0 = 000000cf000000ff
!	%l7 = 00000000000048de, Mem[0000000010081410] = 587adc62
	stha	%l7,[%i2+%o5]0x88	! Mem[0000000010081410] = 587a48de
!	Mem[0000000010001414] = 00000034, %l7 = 000048de, %l7 = 000048de
	add	%i0,0x14,%g1
	casa	[%g1]0x80,%l7,%l7	! %l7 = 0000000000000034
!	%l1 = 00000000000000ff, Mem[0000000030001400] = 587adc62
	stwa	%l1,[%i0+%g0]0x81	! Mem[0000000030001400] = 000000ff
!	Mem[0000000010041410] = ff4709a9, %l4 = ffffffffffffffff
	ldstuba	[%i1+%o5]0x80,%l4	! %l4 = 000000ff000000ff
!	%l2 = 000000005d6c9105, Mem[0000000030141408] = 8233a6ff
	stwa	%l2,[%i5+%o4]0x89	! Mem[0000000030141408] = 5d6c9105
!	%l0 = 00000000000000cf, Mem[0000000010101408] = 000000ff00000086
	stxa	%l0,[%i4+%o4]0x88	! Mem[0000000010101408] = 00000000000000cf
!	Mem[0000000020800040] = ffff359e, %l5 = 00000000000000ff
	ldstub	[%o1+0x040],%l5		! %l5 = 000000ff000000ff
!	Mem[00000000100c1410] = 3f0000ff, %l4 = 00000000000000ff
	swapa	[%i3+%o5]0x80,%l4	! %l4 = 000000003f0000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = ff005252, %l7 = 0000000000000034
	ldswa	[%i4+%g0]0x81,%l7	! %l7 = ffffffffff005252

p0_label_131:
!	Mem[0000000030001400] = 9b82abf0ff000000, %f26 = ff000000 000000ff
	ldda	[%i0+%g0]0x89,%f26	! %f26 = 9b82abf0 ff000000
!	Mem[00000000300c1408] = 00000000, %l6 = 000000008233a6cf
	ldsba	[%i3+%o4]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000010141430] = 643cffce 3196410b, %l6 = 00000000, %l7 = ff005252
	ldd	[%i5+0x030],%l6		! %l6 = 00000000643cffce 000000003196410b
!	%l7 = 000000003196410b, immd = 0000000000000329, %l0 = 00000000000000cf
	sdivx	%l7,0x329,%l0		! %l0 = 00000000000fb0f8
!	Mem[0000000010141408] = 31ce0ee1, %l6 = 00000000643cffce
	ldsha	[%i5+%o4]0x80,%l6	! %l6 = 00000000000031ce
!	Mem[0000000030081408] = 00007c00, %f11 = 92e6fbc0
	lda	[%i2+%o4]0x89,%f11	! %f11 = 00007c00
!	Mem[0000000030141410] = aab8fe14 00000005, %l2 = 5d6c9105, %l3 = 7f78326f
	ldda	[%i5+%o5]0x81,%l2	! %l2 = 00000000aab8fe14 0000000000000005
!	Mem[00000000100c1410] = 000000ff, %f28 = c78dcd1f
	lda	[%i3+%o5]0x80,%f28	! %f28 = 000000ff
!	Mem[00000000100c1410] = 000000ff, %f20 = ef4709a9
	lda	[%i3+%o5]0x80,%f20	! %f20 = 000000ff
!	Starting 10 instruction Store Burst
!	%l0 = 00000000000fb0f8, %l2 = 00000000aab8fe14, %l2 = 00000000aab8fe14
	subc	%l0,%l2,%l2		! %l2 = ffffffff5556b2e4

p0_label_132:
!	Mem[00000000100c1414] = 05916c5d, %l3 = 00000005, %l2 = 5556b2e4
	add	%i3,0x14,%g1
	casa	[%g1]0x80,%l3,%l2	! %l2 = 0000000005916c5d
!	%l7 = 000000003196410b, Mem[0000000030101400] = ff000000525200ff
	stxa	%l7,[%i4+%g0]0x89	! Mem[0000000030101400] = 000000003196410b
!	%f10 = ff00ffff, %f15 = 000000ff
	fsqrts	%f10,%f15		! %f15 = 7fffffff
!	%l2 = 05916c5d, %l3 = 00000005, Mem[0000000010141410] = cf000000 00000000
	stda	%l2,[%i5+0x010]%asi	! Mem[0000000010141410] = 05916c5d 00000005
!	%f2  = 4effafcb 97340d73, Mem[0000000010101408] = cf000000 00000000
	stda	%f2 ,[%i4+%o4]0x80	! Mem[0000000010101408] = 4effafcb 97340d73
!	Mem[0000000030001400] = 000000ff, %l6 = 00000000000031ce
	swapa	[%i0+%g0]0x81,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010141424] = 0000005d, %l2 = 05916c5d, %l4 = 3f0000ff
	add	%i5,0x24,%g1
	casa	[%g1]0x80,%l2,%l4	! %l4 = 000000000000005d
!	Mem[000000001000140c] = 037721ec, %l4 = 000000000000005d
	swap	[%i0+0x00c],%l4		! %l4 = 00000000037721ec
!	%l7 = 000000003196410b, Mem[0000000030101400] = 0b419631
	stwa	%l7,[%i4+%g0]0x81	! Mem[0000000030101400] = 3196410b
!	Starting 10 instruction Load Burst
!	%f19 = 0000ffff, %f24 = 6f32787f, %f3  = 97340d73
	fmuls	%f19,%f24,%f3 		! %l0 = 00000000000fb11a, Unfinished, %fsr = 0600000000

p0_label_133:
!	Mem[0000000030081410] = ff00ffff, %l6 = 00000000000000ff
	lduba	[%i2+%o5]0x81,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010041418] = 037721ec, %l0 = 00000000000fb11a
	ldswa	[%i1+0x018]%asi,%l0	! %l0 = 00000000037721ec
!	Mem[0000000010001418] = 9013de48, %l4 = 00000000037721ec
	ldsh	[%i0+0x01a],%l4		! %l4 = ffffffffffffde48
!	Mem[0000000010001410] = 82dea6ff, %l5 = 00000000000000ff
	lduwa	[%i0+%o5]0x88,%l5	! %l5 = 0000000082dea6ff
!	Mem[0000000030081408] = 007c0000, %l5 = 0000000082dea6ff
	ldsha	[%i2+%o4]0x81,%l5	! %l5 = 000000000000007c
!	Mem[0000000030041400] = 0000ffff, %l6 = 00000000000000ff
	lduba	[%i1+%g0]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010041400] = 00000000, %l3 = 0000000000000005
	lduha	[%i1+%g0]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000030081410] = ff00ffff00008600, %l0 = 00000000037721ec
	ldxa	[%i2+%o5]0x81,%l0	! %l0 = ff00ffff00008600
!	Mem[00000000300c1400] = 730d3497cbafff4e, %l3 = 0000000000000000
	ldxa	[%i3+%g0]0x89,%l3	! %l3 = 730d3497cbafff4e
!	Starting 10 instruction Store Burst
!	%l7 = 000000003196410b, Mem[00000000211c0000] = ffffc666
	sth	%l7,[%o2+%g0]		! Mem[00000000211c0000] = 410bc666

p0_label_134:
!	%l7 = 000000003196410b, Mem[00000000201c0000] = ffff6bf6
	sth	%l7,[%o0+%g0]		! Mem[00000000201c0000] = 410b6bf6
!	Mem[0000000010041408] = 34000000, %l1 = 00000000000000ff
	swapa	[%i1+%o4]0x88,%l1	! %l1 = 0000000034000000
!	%f2  = 4effafcb 97340d73, Mem[0000000010181400] = 7f78326f 00000000
	stda	%f2 ,[%i6+%g0]0x88	! Mem[0000000010181400] = 4effafcb 97340d73
!	Mem[0000000030101400] = 0b419631, %l1 = 0000000034000000
	ldstuba	[%i4+%g0]0x89,%l1	! %l1 = 00000031000000ff
!	%f17 = 86000000, Mem[00000000100c1414] = 05916c5d
	st	%f17,[%i3+0x014]	! Mem[00000000100c1414] = 86000000
!	%l0 = ff00ffff00008600, Mem[0000000021800080] = 059d2e32
	stb	%l0,[%o3+0x080]		! Mem[0000000021800080] = 009d2e32
!	%l1 = 0000000000000031, Mem[0000000010181410] = 0000000086000000
	stxa	%l1,[%i6+%o5]0x80	! Mem[0000000010181410] = 0000000000000031
!	%f10 = ff00ffff 00007c00, %l3 = 730d3497cbafff4e
!	Mem[0000000010081410] = de487a58000000ff
	add	%i2,0x010,%g1
	stda	%f10,[%g1+%l3]ASI_PST32_P ! Mem[0000000010081410] = ff00ffff000000ff
!	%l4 = ffffffffffffde48, Mem[0000000010181410] = 00000000
	stba	%l4,[%i6+%o5]0x88	! Mem[0000000010181410] = 00000048
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = ffff0000159ad392, %f12 = ffa6de82 00000034
	ldda	[%i1+%g0]0x81,%f12	! %f12 = ffff0000 159ad392

p0_label_135:
!	Mem[0000000010041400] = 00000086 00000000, %l6 = 000000ff, %l7 = 3196410b
	ldda	[%i1+%g0]0x88,%l6	! %l6 = 0000000000000000 0000000000000086
!	Mem[0000000010041410] = ff4709a900000000, %f12 = ffff0000 159ad392
	ldd	[%i1+%o5],%f12		! %f12 = ff4709a9 00000000
!	Mem[0000000030001410] = ff000000, %f13 = 00000000
	lda	[%i0+%o5]0x81,%f13	! %f13 = ff000000
!	Mem[0000000021800000] = 00ff1cea, %l4 = ffffffffffffde48
	ldsh	[%o3+%g0],%l4		! %l4 = 00000000000000ff
!	Mem[00000000100c1408] = 7f78326f, %f31 = e10ece31
	lda	[%i3+%o4]0x88,%f31	! %f31 = 7f78326f
!	Mem[0000000030141400] = cf000000, %f31 = 7f78326f
	lda	[%i5+%g0]0x89,%f31	! %f31 = cf000000
!	Mem[00000000300c1408] = 00000000, %l6 = 0000000000000000
	lduwa	[%i3+%o4]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000010041424] = 00000000, %l6 = 0000000000000000
	ldub	[%i1+0x024],%l6		! %l6 = 0000000000000000
!	Mem[0000000010001410] = 3400000082dea6ff, %f26 = 9b82abf0 ff000000
	ldda	[%i0+%o5]0x88,%f26	! %f26 = 34000000 82dea6ff
!	Starting 10 instruction Store Burst
!	%l1 = 0000000000000031, Mem[0000000020800000] = ffff98bf, %asi = 80
	stha	%l1,[%o1+0x000]%asi	! Mem[0000000020800000] = 003198bf

p0_label_136:
!	%l6 = 0000000000000000, Mem[0000000010041408] = 000000ff
	stba	%l6,[%i1+%o4]0x88	! Mem[0000000010041408] = 00000000
!	%l7 = 0000000000000086, Mem[0000000030141410] = aab8fe14
	stha	%l7,[%i5+%o5]0x81	! Mem[0000000030141410] = 0086fe14
!	%l2 = 0000000005916c5d, Mem[00000000100c1410] = 000000ff
	stha	%l2,[%i3+%o5]0x80	! Mem[00000000100c1410] = 6c5d00ff
!	%l1 = 0000000000000031, Mem[00000000201c0000] = 410b6bf6, %asi = 80
	stba	%l1,[%o0+0x000]%asi	! Mem[00000000201c0000] = 310b6bf6
!	Code Fragment 3
p0_fragment_16:
!	%l0 = ff00ffff00008600
	setx	0x251dd217944abdc5,%g7,%l0 ! %l0 = 251dd217944abdc5
!	%l1 = 0000000000000031
	setx	0x67fbf6786804f7f5,%g7,%l1 ! %l1 = 67fbf6786804f7f5
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 251dd217944abdc5
	setx	0xd92e3ac857462833,%g7,%l0 ! %l0 = d92e3ac857462833
!	%l1 = 67fbf6786804f7f5
	setx	0x831d3ff856f603eb,%g7,%l1 ! %l1 = 831d3ff856f603eb
!	%f14 = ffffb58e, Mem[0000000030181408] = 0591e1f4
	sta	%f14,[%i6+%o4]0x81	! Mem[0000000030181408] = ffffb58e
!	Mem[0000000030141400] = 000000cf, %l3 = 730d3497cbafff4e
	ldstuba	[%i5+%g0]0x81,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010081413] = ff00ffff, %l7 = 0000000000000086
	ldstub	[%i2+0x013],%l7		! %l7 = 000000ff000000ff
!	%l5 = 000000000000007c, imm = 0000000000000e9c, %l2 = 0000000005916c5d
	sub	%l5,0xe9c,%l2		! %l2 = fffffffffffff1e0
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = 00000000, %l3 = 0000000000000000
	ldsha	[%i1+%g0]0x88,%l3	! %l3 = 0000000000000000

p0_label_137:
!	Mem[00000000201c0000] = 310b6bf6, %l3 = 0000000000000000
	ldub	[%o0+0x001],%l3		! %l3 = 000000000000000b
!	Mem[0000000030181410] = 8eb5ffff, %l7 = 00000000000000ff
	lduwa	[%i6+%o5]0x81,%l7	! %l7 = 000000008eb5ffff
!	Mem[0000000010101410] = ff000000, %f23 = 0a7a7b57
	lda	[%i4+%o5]0x80,%f23	! %f23 = ff000000
!	Mem[0000000010101400] = ffa6338200000000, %l4 = 00000000000000ff
	ldxa	[%i4+%g0]0x80,%l4	! %l4 = ffa6338200000000
!	Mem[0000000010141418] = ea8bb376ef4c33cb, %l3 = 000000000000000b
	ldxa	[%i5+0x018]%asi,%l3	! %l3 = ea8bb376ef4c33cb
!	Mem[0000000010041400] = 00000000, %l7 = 000000008eb5ffff
	ldsha	[%i1+%g0]0x88,%l7	! %l7 = 0000000000000000
!	%l2 = fffffffffffff1e0, %l7 = 0000000000000000, %l7 = 0000000000000000
	or	%l2,%l7,%l7		! %l7 = fffffffffffff1e0
!	Mem[0000000010141410] = 5d6c9105, %l3 = ea8bb376ef4c33cb
	ldsha	[%i5+%o5]0x88,%l3	! %l3 = ffffffffffff9105
	membar	#Sync			! Added by membar checker (20)
!	Mem[0000000030141400] = ff0000cf 894dde7c 05916c5d 5da9b785
!	Mem[0000000030141410] = 0086fe14 00000005 efb191eb d52b5079
!	Mem[0000000030141420] = 633d819c 34bb3bb9 cfea979e 1956777f
!	Mem[0000000030141430] = 05ebb322 711fcfaf 6fb251dc 00001960
	ldda	[%i5]ASI_BLK_S,%f16	! Block Load from 0000000030141400
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1408] = 6f32787f, %l2 = fffffffffffff1e0
	swapa	[%i3+%o4]0x80,%l2	! %l2 = 000000006f32787f

p0_label_138:
!	%f12 = ff4709a9 ff000000, Mem[0000000010041400] = 00000000 86000000
	stda	%f12,[%i1+%g0]0x80	! Mem[0000000010041400] = ff4709a9 ff000000
!	%f14 = ffffb58e, %f6  = 587adc62
	fcmps	%fcc1,%f14,%f6 		! %fcc1 = 3
!	%l7 = fffffffffffff1e0, imm = 000000000000080e, %l2 = 000000006f32787f
	and	%l7,0x80e,%l2		! %l2 = 0000000000000000
!	%l2 = 0000000000000000, Mem[00000000218001c0] = ff0813ce
	stb	%l2,[%o3+0x1c0]		! Mem[00000000218001c0] = 000813ce
!	Mem[0000000010081424] = 9013de48, %l0 = d92e3ac857462833
	swap	[%i2+0x024],%l0		! %l0 = 000000009013de48
!	Mem[0000000010041434] = e3857c59, %l2 = 0000000000000000
	ldstuba	[%i1+0x034]%asi,%l2	! %l2 = 000000e3000000ff
!	%l0 = 000000009013de48, %l3 = ffffffffffff9105, %l4  = ffa6338200000000
	mulx	%l0,%l3,%l4		! %l4 = ffffc18a33021f68
!	%l6 = 0000000000000000, Mem[0000000030081408] = 00007c00
	stba	%l6,[%i2+%o4]0x89	! Mem[0000000030081408] = 00007c00
!	%l7 = fffffffffffff1e0, Mem[0000000030001410] = ff000000
	stwa	%l7,[%i0+%o5]0x81	! Mem[0000000030001410] = fffff1e0
!	Starting 10 instruction Load Burst
!	%l3 = ffffffffffff9105, imm = 0000000000000cbe, %l3 = ffffffffffff9105
	and	%l3,0xcbe,%l3		! %l3 = 0000000000000004

p0_label_139:
!	Mem[0000000030041400] = 0000ffff, %f7  = 0b419631
	lda	[%i1+%g0]0x89,%f7 	! %f7 = 0000ffff
!	Mem[0000000010101410] = 000000ff, %l4 = ffffc18a33021f68
	ldsha	[%i4+%o5]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010181400] = 97340d73, %l3 = 0000000000000004
	ldsha	[%i6+%g0]0x88,%l3	! %l3 = 0000000000000d73
!	Mem[0000000010001410] = 82dea6ff, %l4 = 00000000000000ff
	lduha	[%i0+%o5]0x88,%l4	! %l4 = 000000000000a6ff
!	Mem[0000000020800040] = ffff359e, %l6 = 0000000000000000
	ldsba	[%o1+0x040]%asi,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000030101410] = 92e6fbc0, %l1 = 831d3ff856f603eb
	ldsba	[%i4+%o5]0x89,%l1	! %l1 = ffffffffffffffc0
!	Code Fragment 3
p0_fragment_17:
!	%l0 = 000000009013de48
	setx	0x273c04c7c019d0d7,%g7,%l0 ! %l0 = 273c04c7c019d0d7
!	%l1 = ffffffffffffffc0
	setx	0x196c2b2842c84ff1,%g7,%l1 ! %l1 = 196c2b2842c84ff1
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 273c04c7c019d0d7
	setx	0x75b40de072cd26a0,%g7,%l0 ! %l0 = 75b40de072cd26a0
!	%l1 = 196c2b2842c84ff1
	setx	0xd376bd9fd9841d3f,%g7,%l1 ! %l1 = d376bd9fd9841d3f
!	Mem[0000000010181408] = 48de13901fcd8dc7, %l6 = ffffffffffffffff
	ldxa	[%i6+%o4]0x80,%l6	! %l6 = 48de13901fcd8dc7
!	Mem[0000000021800180] = ca4c59fe, %l0 = 75b40de072cd26a0
	lduba	[%o3+0x181]%asi,%l0	! %l0 = 000000000000004c
!	Starting 10 instruction Store Burst
!	%f0  = 00860000 00002dc5, Mem[00000000100c1410] = ff005d6c 00000086
	stda	%f0 ,[%i3+%o5]0x88	! Mem[00000000100c1410] = 00860000 00002dc5

p0_label_140:
!	%f10 = ff00ffff 00007c00, Mem[0000000010001400] = 730d3497 cbafff4e
	std	%f10,[%i0+%g0]	! Mem[0000000010001400] = ff00ffff 00007c00
	membar	#Sync			! Added by membar checker (21)
!	%f6  = 587adc62 0000ffff, Mem[0000000030141400] = cf0000ff 7cde4d89
	stda	%f6 ,[%i5+%g0]0x89	! Mem[0000000030141400] = 587adc62 0000ffff
!	%l0 = 0000004c, %l1 = d9841d3f, Mem[0000000010141408] = e10ece31 730d34ff
	stda	%l0,[%i5+%o4]0x88	! Mem[0000000010141408] = 0000004c d9841d3f
!	Mem[0000000030101410] = c0fbe692, %l5 = 000000000000007c
	swapa	[%i4+%o5]0x81,%l5	! %l5 = 00000000c0fbe692
!	Mem[0000000010181433] = 5d6c9105, %l3 = 0000000000000d73
	ldstub	[%i6+0x033],%l3		! %l3 = 00000005000000ff
!	Mem[0000000010001400] = ffff00ff, %l3 = 0000000000000005
	ldstuba	[%i0+%g0]0x88,%l3	! %l3 = 000000ff000000ff
!	Mem[0000000010041410] = ff4709a9, %l6 = 48de13901fcd8dc7
	ldstuba	[%i1+%o5]0x80,%l6	! %l6 = 000000ff000000ff
!	Mem[0000000030001408] = 6f3278ff, %l6 = 00000000000000ff
	swapa	[%i0+%o4]0x89,%l6	! %l6 = 000000006f3278ff
!	Mem[0000000010141410] = 5d6c9105, %l1 = d376bd9fd9841d3f
	ldstuba	[%i5+%o5]0x88,%l1	! %l1 = 00000005000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = 4effafcb, %l5 = 00000000c0fbe692
	ldsba	[%i3+%g0]0x81,%l5	! %l5 = 000000000000004e

p0_label_141:
!	%f0  = 00860000, %f2  = 4effafcb, %f5  = 86000000
	fdivs	%f0 ,%f2 ,%f5 		! %f5  = 00000000
!	Mem[0000000010181438] = 00000005, %l0 = 000000000000004c
	lduha	[%i6+0x03a]%asi,%l0	! %l0 = 0000000000000005
!	Mem[0000000010001410] = ffa6de82, %l5 = 000000000000004e
	ldswa	[%i0+%o5]0x80,%l5	! %l5 = ffffffffffa6de82
!	%l3 = 00000000000000ff, %l4 = 000000000000a6ff, %y  = 730d3120
	smul	%l3,%l4,%l6		! %l6 = 0000000000a65801, %y = 00000000
	membar	#Sync			! Added by membar checker (22)
!	Mem[0000000010041400] = ff4709a9 ff000000 00000000 4effafcb
!	Mem[0000000010041410] = ff4709a9 00000000 037721ec 0a7a7b57
!	Mem[0000000010041420] = 0000ffff 00000000 0475329a c46788cf
!	Mem[0000000010041430] = 00000000 ff857c59 bad76926 e10ece31
	ldda	[%i1]ASI_BLK_P,%f16	! Block Load from 0000000010041400
!	Mem[0000000010041430] = 00000000, %l6 = 0000000000a65801
	ldswa	[%i1+0x030]%asi,%l6	! %l6 = 0000000000000000
!	Code Fragment 4
p0_fragment_18:
!	%l0 = 0000000000000005
	setx	0xf3c49697de92e2c9,%g7,%l0 ! %l0 = f3c49697de92e2c9
!	%l1 = 0000000000000005
	setx	0x528038c7abb01971,%g7,%l1 ! %l1 = 528038c7abb01971
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = f3c49697de92e2c9
	setx	0xaba20a07cd2f89b9,%g7,%l0 ! %l0 = aba20a07cd2f89b9
!	%l1 = 528038c7abb01971
	setx	0x1984de68788db281,%g7,%l1 ! %l1 = 1984de68788db281
!	Mem[000000001014143c] = ffffff8e, %l6 = 0000000000000000
	ldsb	[%i5+0x03e],%l6		! %l6 = ffffffffffffffff
!	Mem[0000000030181410] = ffffb58e, %l4 = 000000000000a6ff
	ldsba	[%i6+%o5]0x89,%l4	! %l4 = ffffffffffffff8e
!	Starting 10 instruction Store Burst
!	%l1 = 1984de68788db281, Mem[0000000030101408] = 00000000000000b5
	stxa	%l1,[%i4+%o4]0x89	! Mem[0000000030101408] = 1984de68788db281

p0_label_142:
!	%f6  = 587adc62 0000ffff, Mem[0000000010001400] = ffff00ff 007c0000
	stda	%f6 ,[%i0+%g0]0x88	! Mem[0000000010001400] = 587adc62 0000ffff
!	%l4 = ffffffffffffff8e, Mem[0000000030041400] = ffff0000
	stha	%l4,[%i1+%g0]0x81	! Mem[0000000030041400] = ff8e0000
!	%l3 = 00000000000000ff, Mem[0000000010001404] = 62dc7a58, %asi = 80
	stwa	%l3,[%i0+0x004]%asi	! Mem[0000000010001404] = 000000ff
!	%l1 = 1984de68788db281, Mem[0000000021800000] = 00ff1cea
	stb	%l1,[%o3+%g0]		! Mem[0000000021800000] = 81ff1cea
!	Mem[0000000010081410] = ff00ffff, %l7 = fffffffffffff1e0
	ldstuba	[%i2+%o5]0x80,%l7	! %l7 = 000000ff000000ff
!	%f0  = 00860000 00002dc5, Mem[0000000010181410] = 48000000 00000031
	stda	%f0 ,[%i6+%o5]0x80	! Mem[0000000010181410] = 00860000 00002dc5
!	Mem[00000000300c1410] = 000000e8, %l0 = aba20a07cd2f89b9
	swapa	[%i3+%o5]0x89,%l0	! %l0 = 00000000000000e8
!	Mem[0000000030041408] = 0000ff00, %l4 = ffffffffffffff8e
	swapa	[%i1+%o4]0x89,%l4	! %l4 = 000000000000ff00
!	Mem[00000000100c1410] = 00002dc5, %l7 = 00000000000000ff
	swapa	[%i3+%o5]0x88,%l7	! %l7 = 0000000000002dc5
!	Starting 10 instruction Load Burst
!	Mem[0000000020800000] = 003198bf, %l4 = 000000000000ff00
	ldsha	[%o1+0x000]%asi,%l4	! %l4 = 0000000000000031

p0_label_143:
!	Mem[0000000030001410] = 972b8da2 e0f1ffff, %l0 = 000000e8, %l1 = 788db281
	ldda	[%i0+%o5]0x89,%l0	! %l0 = 00000000e0f1ffff 00000000972b8da2
!	Mem[00000000100c1400] = 730d34ff, %l6 = ffffffffffffffff
	ldsba	[%i3+%g0]0x88,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010041410] = ff4709a9, %l1 = 00000000972b8da2
	lduwa	[%i1+%o5]0x80,%l1	! %l1 = 00000000ff4709a9
!	Mem[0000000010041424] = 00000000, %l4 = 0000000000000031
	ldsba	[%i1+0x026]%asi,%l4	! %l4 = 0000000000000000
!	Mem[00000000300c1410] = b9892fcd, %l7 = 0000000000002dc5
	ldsba	[%i3+%o5]0x81,%l7	! %l7 = ffffffffffffffb9
!	Mem[00000000201c0000] = 310b6bf6, %l1 = 00000000ff4709a9
	lduba	[%o0+0x000]%asi,%l1	! %l1 = 0000000000000031
!	Mem[0000000010001400] = 0000ffff, %l3 = 00000000000000ff
	ldsba	[%i0+%g0]0x88,%l3	! %l3 = ffffffffffffffff
!	Mem[00000000100c1400] = 730d34ff, %l4 = 0000000000000000
	ldsba	[%i3+%g0]0x88,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010181410] = 00860000, %l5 = ffffffffffa6de82
	ldub	[%i6+0x013],%l5		! %l5 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030141410] = 0086fe14, %l1 = 0000000000000031
	ldstuba	[%i5+%o5]0x81,%l1	! %l1 = 00000000000000ff

p0_label_144:
!	%l5 = 0000000000000000, Mem[0000000030101400] = ff96410b
	stba	%l5,[%i4+%g0]0x81	! Mem[0000000030101400] = 0096410b
!	%l2 = 00000000000000e3, Mem[0000000010081408] = 00000000
	stba	%l2,[%i2+%o4]0x80	! Mem[0000000010081408] = e3000000
!	Mem[0000000010181408] = 9013de48, %l2 = 00000000000000e3
	ldstuba	[%i6+%o4]0x88,%l2	! %l2 = 00000048000000ff
!	%l1 = 0000000000000000, Mem[00000000300c1408] = 00000000
	stba	%l1,[%i3+%o4]0x89	! Mem[00000000300c1408] = 00000000
!	%l5 = 0000000000000000, Mem[0000000010141430] = 643cffce3196410b, %asi = 80
	stxa	%l5,[%i5+0x030]%asi	! Mem[0000000010141430] = 0000000000000000
!	Mem[00000000100c1408] = e0f1ffff, %l0 = 00000000e0f1ffff
	swapa	[%i3+%o4]0x88,%l0	! %l0 = 00000000e0f1ffff
!	%f10 = ff00ffff 00007c00, Mem[00000000100c1408] = e0f1ffff ffff0000
	stda	%f10,[%i3+%o4]0x88	! Mem[00000000100c1408] = ff00ffff 00007c00
!	Mem[00000000201c0001] = 310b6bf6, %l6 = ffffffffffffffff
	ldstub	[%o0+0x001],%l6		! %l6 = 0000000b000000ff
!	Mem[0000000010181400] = 730d3497, %l3 = ffffffff, %l2 = 00000048
	casa	[%i6]0x80,%l3,%l2	! %l2 = 00000000730d3497
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = 0096410b 00000000, %l2 = 730d3497, %l3 = ffffffff
	ldda	[%i4+%g0]0x81,%l2	! %l2 = 000000000096410b 0000000000000000

p0_label_145:
!	Mem[0000000010181420] = 000000000b419631, %f26 = 0475329a c46788cf
	ldda	[%i6+0x020]%asi,%f26	! %f26 = 00000000 0b419631
!	Mem[0000000030081410] = 00860000 ffff00ff, %l0 = e0f1ffff, %l1 = 00000000
	ldda	[%i2+%o5]0x89,%l0	! %l0 = 00000000ffff00ff 0000000000860000
!	Mem[0000000010081434] = c78dcd1f, %l1 = 0000000000860000
	lduwa	[%i2+0x034]%asi,%l1	! %l1 = 00000000c78dcd1f
!	Mem[00000000201c0000] = 31ff6bf6, %l0 = 00000000ffff00ff
	lduba	[%o0+0x000]%asi,%l0	! %l0 = 0000000000000031
!	Mem[0000000010181414] = 00002dc5, %l6 = 000000000000000b
	lduw	[%i6+0x014],%l6		! %l6 = 0000000000002dc5
!	Mem[0000000010141408] = d9841d3f 0000004c, %l4 = ffffffff, %l5 = 00000000
	ldda	[%i5+%o4]0x88,%l4	! %l4 = 000000000000004c 00000000d9841d3f
!	Mem[0000000030181408] = 8eb5ffff, %l5 = 00000000d9841d3f
	ldsba	[%i6+%o4]0x89,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000010041408] = 00000000, %l2 = 000000000096410b
	ldsba	[%i1+%o4]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000010041400] = ff4709a9, %l0 = 0000000000000031
	lduwa	[%i1+%g0]0x80,%l0	! %l0 = 00000000ff4709a9
!	Starting 10 instruction Store Burst
!	%f22 = 037721ec 0a7a7b57, Mem[0000000010181420] = 00000000 0b419631
	stda	%f22,[%i6+0x020]%asi	! Mem[0000000010181420] = 037721ec 0a7a7b57

p0_label_146:
	membar	#Sync			! Added by membar checker (23)
!	%l4 = 000000000000004c, Mem[0000000010041410] = a90947ff
	stha	%l4,[%i1+%o5]0x88	! Mem[0000000010041410] = a909004c
!	%l0 = ff4709a9, %l1 = c78dcd1f, Mem[0000000030041408] = 8effffff 000000e6
	stda	%l0,[%i1+%o4]0x81	! Mem[0000000030041408] = ff4709a9 c78dcd1f
!	%f2  = 4effafcb 97340d73, %l6 = 0000000000002dc5
!	Mem[0000000010041430] = 00000000ff857c59
	add	%i1,0x030,%g1
	stda	%f2,[%g1+%l6]ASI_PST16_PL ! Mem[0000000010041430] = 730d0000cbaf7c59
!	%f14 = ffffb58e 7fffffff, Mem[0000000010041408] = 00000000 4effafcb
	std	%f14,[%i1+%o4]	! Mem[0000000010041408] = ffffb58e 7fffffff
!	%l6 = 00002dc5, %l7 = ffffffb9, Mem[0000000010081410] = ff00ffff 000000ff
	stda	%l6,[%i2+%o5]0x80	! Mem[0000000010081410] = 00002dc5 ffffffb9
!	%l4 = 000000000000004c, Mem[0000000030141408] = 5d6c9105
	stwa	%l4,[%i5+%o4]0x89	! Mem[0000000030141408] = 0000004c
!	%l2 = 0000000000000000, Mem[0000000030101408] = 81b28d78
	stha	%l2,[%i4+%o4]0x81	! Mem[0000000030101408] = 00008d78
!	Mem[0000000030001410] = e0f1ffff, %l0 = 00000000ff4709a9
	ldstuba	[%i0+%o5]0x89,%l0	! %l0 = 000000ff000000ff
!	%l6 = 0000000000002dc5, Mem[0000000010081410] = 00002dc5
	stha	%l6,[%i2+%o5]0x80	! Mem[0000000010081410] = 2dc52dc5
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = 00000000730d34ff, %f22 = 037721ec 0a7a7b57
	ldda	[%i3+%g0]0x88,%f22	! %f22 = 00000000 730d34ff

p0_label_147:
!	Mem[0000000030081410] = ffff00ff, %l3 = 0000000000000000
	ldswa	[%i2+%o5]0x89,%l3	! %l3 = ffffffffffff00ff
!	Mem[0000000010081408] = e3000000, %l7 = ffffffffffffffb9
	lduha	[%i2+%o4]0x80,%l7	! %l7 = 000000000000e300
!	Mem[0000000030001408] = ff000000, %l3 = ffffffffffff00ff
	lduwa	[%i0+%o4]0x81,%l3	! %l3 = 00000000ff000000
!	%l6 = 0000000000002dc5, immd = fffffffffffff5ad, %l1 = 00000000c78dcd1f
	sdivx	%l6,-0xa53,%l1		! %l1 = fffffffffffffffc
!	Mem[0000000010141408] = 4c000000, %l3 = 00000000ff000000
	ldsba	[%i5+%o4]0x80,%l3	! %l3 = 000000000000004c
!	Mem[0000000030181408] = 07030f4e8eb5ffff, %l5 = ffffffffffffffff
	ldxa	[%i6+%o4]0x89,%l5	! %l5 = 07030f4e8eb5ffff
!	Mem[00000000211c0000] = 410bc666, %l5 = 07030f4e8eb5ffff
	lduh	[%o2+%g0],%l5		! %l5 = 000000000000410b
!	Mem[00000000300c1410] = b9892fcd, %l6 = 0000000000002dc5
	ldswa	[%i3+%o5]0x81,%l6	! %l6 = ffffffffb9892fcd
!	Mem[0000000030141408] = 4c000000, %l1 = fffffffffffffffc
	ldsha	[%i5+%o4]0x81,%l1	! %l1 = 0000000000004c00
!	Starting 10 instruction Store Burst
!	%l2 = 0000000000000000, Mem[0000000010141400] = 000000ff
	stwa	%l2,[%i5+%g0]0x88	! Mem[0000000010141400] = 00000000

p0_label_148:
!	Mem[0000000010081400] = 000000ff, %l4 = 000000000000004c
	ldstuba	[%i2+%g0]0x80,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010001414] = 00000034, %l1 = 0000000000004c00
	ldstub	[%i0+0x014],%l1		! %l1 = 00000000000000ff
!	Mem[00000000100c1404] = 00000000, %l1 = 00000000, %l0 = 000000ff
	add	%i3,0x04,%g1
	casa	[%g1]0x80,%l1,%l0	! %l0 = 0000000000000000
!	%l2 = 0000000000000000, Mem[0000000030181400] = 000000009b82ab91
	stxa	%l2,[%i6+%g0]0x89	! Mem[0000000030181400] = 0000000000000000
!	%f30 = bad76926 e10ece31, Mem[0000000010101408] = cbafff4e 730d3497
	stda	%f30,[%i4+%o4]0x88	! Mem[0000000010101408] = bad76926 e10ece31
!	%f4  = 00000000 00000000, Mem[0000000030081400] = bad76926 6bac2748
	stda	%f4 ,[%i2+%g0]0x81	! Mem[0000000030081400] = 00000000 00000000
!	%f27 = 0b419631, %f16 = ff4709a9, %f4  = 00000000
	fmuls	%f27,%f16,%f4 		! %f4  = cb16830e
!	Mem[0000000030081400] = 00000000, %l5 = 000000000000410b
	swapa	[%i2+%g0]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000010081424] = 57462833, %l5 = 0000000000000000
	swap	[%i2+0x024],%l5		! %l5 = 0000000057462833
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = c78dcd1f9013deff, %l7 = 000000000000e300
	ldxa	[%i6+%o4]0x88,%l7	! %l7 = c78dcd1f9013deff

p0_label_149:
!	Mem[00000000300c1408] = 00000000, %l7 = c78dcd1f9013deff
	lduba	[%i3+%o4]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000010081410] = 2dc52dc5, %f4  = cb16830e
	lda	[%i2+%o5]0x80,%f4 	! %f4 = 2dc52dc5
!	Mem[0000000010181400] = 97340d73, %l1 = 0000000000000000
	lduwa	[%i6+%g0]0x88,%l1	! %l1 = 0000000097340d73
!	Mem[0000000030181410] = 8eb5ffff, %l4 = 0000000000000000
	ldswa	[%i6+%o5]0x81,%l4	! %l4 = ffffffff8eb5ffff
!	Mem[0000000030041408] = a90947ff, %l1 = 0000000097340d73
	ldswa	[%i1+%o4]0x89,%l1	! %l1 = ffffffffa90947ff
!	Mem[0000000030101400] = 0b419600, %l2 = 0000000000000000
	lduba	[%i4+%g0]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000030001410] = e0f1ffff, %l5 = 0000000057462833
	lduwa	[%i0+%o5]0x89,%l5	! %l5 = 00000000e0f1ffff
!	%l6 = ffffffffb9892fcd, imm = 0000000000000cf2, %l6 = ffffffffb9892fcd
	xnor	%l6,0xcf2,%l6		! %l6 = 000000004676dcc0
!	Mem[0000000010101400] = ffa63382, %l7 = 0000000000000000
	ldswa	[%i4+%g0]0x80,%l7	! %l7 = ffffffffffa63382
!	Starting 10 instruction Store Burst
!	Mem[000000001004142c] = c46788cf, %l5 = e0f1ffff, %l7 = ffa63382
	add	%i1,0x2c,%g1
	casa	[%g1]0x80,%l5,%l7	! %l7 = 00000000c46788cf

p0_label_150:
!	%f28 = 00000000 ff857c59, %l2 = 0000000000000000
!	Mem[0000000010081420] = c78dcd1f00000000
	add	%i2,0x020,%g1
	stda	%f28,[%g1+%l2]ASI_PST16_P ! Mem[0000000010081420] = c78dcd1f00000000
!	Mem[0000000030041408] = a90947ff, %l2 = 0000000000000000
	ldstuba	[%i1+%o4]0x89,%l2	! %l2 = 000000ff000000ff
!	Mem[0000000010141434] = 00000000, %l2 = 00000000000000ff
	swap	[%i5+0x034],%l2		! %l2 = 0000000000000000
!	Mem[0000000010081430] = 8233a6cf, %l3 = 000000000000004c
	ldstuba	[%i2+0x030]%asi,%l3	! %l3 = 00000082000000ff
!	%l7 = 00000000c46788cf, Mem[0000000030181408] = 8eb5ffff
	stwa	%l7,[%i6+%o4]0x89	! Mem[0000000030181408] = c46788cf
!	Mem[0000000030141410] = ff86fe14, %l4 = ffffffff8eb5ffff
	ldstuba	[%i5+%o5]0x81,%l4	! %l4 = 000000ff000000ff
!	Mem[0000000020800040] = ffff359e, %l5 = 00000000e0f1ffff
	ldstub	[%o1+0x040],%l5		! %l5 = 000000ff000000ff
!	%l0 = 0000000000000000, Mem[00000000100c1422] = 7f78326f, %asi = 80
	stba	%l0,[%i3+0x022]%asi	! Mem[00000000100c1420] = 7f78006f
!	%l2 = 0000000000000000, Mem[0000000030141410] = ff86fe14
	stba	%l2,[%i5+%o5]0x81	! Mem[0000000030141410] = 0086fe14
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = 4effafcb97340d73, %f12 = ff4709a9 ff000000
	ldda	[%i6+%g0]0x88,%f12	! %f12 = 4effafcb 97340d73

	ba,a	p0_not_taken_0_end
p0_not_taken_0:
!	The following code should not be executed
	ldsb	[%i6+0x03b],%l7
	sdiv	%l6,%l1,%l2
	ldsba	[%i0+0x022]%asi,%l2
	umul	%l1,%l5,%l6
	nop
	subc	%l6,%l4,%l5
	ba,a	p0_branch_failed
p0_not_taken_0_end:


!	End of Random Code for Thread 0


!	Check Registers

p0_check_registers:
	set	p0_expected_registers,%g1
	ldx	[%g1+0x000],%g2
	cmp	%l0,%g2			! %l0 should be 0000000000000000
	bne,a,pn %xcc,p0_reg_l0_fail
	mov	%l0,%g3
	ldx	[%g1+0x008],%g2
	cmp	%l1,%g2			! %l1 should be ffffffffa90947ff
	bne,a,pn %xcc,p0_reg_l1_fail
	mov	%l1,%g3
	ldx	[%g1+0x010],%g2
	cmp	%l2,%g2			! %l2 should be 0000000000000000
	bne,a,pn %xcc,p0_reg_l2_fail
	mov	%l2,%g3
	ldx	[%g1+0x018],%g2
	cmp	%l3,%g2			! %l3 should be 0000000000000082
	bne,a,pn %xcc,p0_reg_l3_fail
	mov	%l3,%g3
	ldx	[%g1+0x020],%g2
	cmp	%l4,%g2			! %l4 should be 00000000000000ff
	bne,a,pn %xcc,p0_reg_l4_fail
	mov	%l4,%g3
	ldx	[%g1+0x028],%g2
	cmp	%l5,%g2			! %l5 should be 00000000000000ff
	bne,a,pn %xcc,p0_reg_l5_fail
	mov	%l5,%g3
	ldx	[%g1+0x030],%g2
	cmp	%l6,%g2			! %l6 should be 000000004676dcc0
	bne,a,pn %xcc,p0_reg_l6_fail
	mov	%l6,%g3
	ldx	[%g1+0x038],%g2
	cmp	%l7,%g2			! %l7 should be 00000000c46788cf
	bne,a,pn %xcc,p0_reg_l7_fail
	mov	%l7,%g3

!	Check Floating Point Registers

p0_check_fp_registers:
	set	p0_expected_fp_regs,%g3
	std	%f0,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x00],%l0
	cmp	%l0,%l1			! %f0  should be 00860000 00002dc5
	bne	%xcc,p0_f0_fail
	std	%f2,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x08],%l0
	cmp	%l0,%l1			! %f2  should be 4effafcb 97340d73
	bne	%xcc,p0_f2_fail
	std	%f4,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x10],%l0
	cmp	%l0,%l1			! %f4  should be 2dc52dc5 00000000
	bne	%xcc,p0_f4_fail
	std	%f6,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x18],%l0
	cmp	%l0,%l1			! %f6  should be 587adc62 0000ffff
	bne	%xcc,p0_f6_fail
	std	%f8,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x20],%l0
	cmp	%l0,%l1			! %f8  should be 00000034 0b419631
	bne	%xcc,p0_f8_fail
	std	%f10,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x28],%l0
	cmp	%l0,%l1			! %f10 should be ff00ffff 00007c00
	bne	%xcc,p0_f10_fail
	std	%f12,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x30],%l0
	cmp	%l0,%l1			! %f12 should be 4effafcb 97340d73
	bne	%xcc,p0_f12_fail
	std	%f14,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x38],%l0
	cmp	%l0,%l1			! %f14 should be ffffb58e 7fffffff
	bne	%xcc,p0_f14_fail
	std	%f16,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x40],%l0
	cmp	%l0,%l1			! %f16 should be ff4709a9 ff000000
	bne	%xcc,p0_f16_fail
	std	%f18,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x48],%l0
	cmp	%l0,%l1			! %f18 should be 00000000 4effafcb
	bne	%xcc,p0_f18_fail
	std	%f20,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x50],%l0
	cmp	%l0,%l1			! %f20 should be ff4709a9 00000000
	bne	%xcc,p0_f20_fail
	std	%f22,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x58],%l0
	cmp	%l0,%l1			! %f22 should be 00000000 730d34ff
	bne	%xcc,p0_f22_fail
	std	%f24,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x60],%l0
	cmp	%l0,%l1			! %f24 should be 0000ffff 00000000
	bne	%xcc,p0_f24_fail
	std	%f26,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x68],%l0
	cmp	%l0,%l1			! %f26 should be 00000000 0b419631
	bne	%xcc,p0_f26_fail
	std	%f28,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x70],%l0
	cmp	%l0,%l1			! %f28 should be 00000000 ff857c59
	bne	%xcc,p0_f28_fail
	std	%f30,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x78],%l0
	cmp	%l0,%l1			! %f30 should be bad76926 e10ece31
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
	udivx	%l0,-0x873,%l3
	fsubs	%f14,%f3 ,%f10
	done

p0_trap1o:
	udivx	%l0,-0x873,%l3
	fsubs	%f14,%f3 ,%f10
	done


p0_trap2e:
	xor	%l4,%l7,%l7
	fitos	%f9 ,%f13
	fmuls	%f12,%f3 ,%f1 
	sdivx	%l6,%l3,%l6
	done

p0_trap2o:
	xor	%l4,%l7,%l7
	fitos	%f9 ,%f13
	fmuls	%f12,%f3 ,%f1 
	sdivx	%l6,%l3,%l6
	done


p0_trap3e:
	xor	%l3,0x5c9,%l0
	orn	%l3,%l4,%l6
	sub	%l0,-0x98d,%l7
	orn	%l3,%l6,%l1
	add	%l1,%l4,%l5
	done

p0_trap3o:
	xor	%l3,0x5c9,%l0
	orn	%l3,%l4,%l6
	sub	%l0,-0x98d,%l7
	orn	%l3,%l6,%l1
	add	%l1,%l4,%l5
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
	ldx	[%g1+0x000],%l0		! %l0 = a05085f1fd9de7be
	ldx	[%g1+0x008],%l1		! %l1 = 519e92de91105983
	ldx	[%g1+0x010],%l2		! %l2 = dc766f1aac7211e2
	ldx	[%g1+0x018],%l3		! %l3 = 79867b9bda9632ea
	ldx	[%g1+0x020],%l4		! %l4 = 2a82b89ddc1c9b87
	ldx	[%g1+0x028],%l5		! %l5 = bd0789888dd09997
	ldx	[%g1+0x030],%l6		! %l6 = ca0dbeaff3637d09
	ldx	[%g1+0x038],%l7		! %l7 = 7cd54f9ae0a5126c

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
	udivx	%l0,-0x873,%l3
	jmpl	%o7,%g0
	fsubs	%f14,%f3 ,%f10
p0_near_0_he:
	xor	%l4,%l7,%l7
	fitos	%f25,%f29
	fmuls	%f28,%f19,%f17
	sdivx	%l6,%l3,%l6
	xor	%l4,%l3,%l7
	fadds	%f28,%f20,%f25
	smul	%l3,%l5,%l5
	jmpl	%o7,%g0
	mulx	%l2,%l5,%l0
near0_b2b_h:
	smul	%l7,-0xf16,%l0
	jmpl	%o7,%g0
	mulx	%l1,-0x8f7,%l2
near0_b2b_l:
	subc	%l0,0xf4b,%l4
	jmpl	%o7,%g0
	fdivs	%f0 ,%f15,%f7 
user_near0_end:
	.seg	"text"
	.align	0x2000
user_near1_start:
p0_near_1_le:
	mulx	%l7,0xd83,%l5
	xnor	%l1,%l2,%l5
	orn	%l3,-0x340,%l1
	and	%l5,%l3,%l5
	swap	[%i5+0x034],%l7		! Mem[0000000010141434]
	jmpl	%o7,%g0
	and	%l4,%l3,%l6
p0_near_1_he:
	jmpl	%o7,%g0
	orn	%l3,-0x63b,%l1
	jmpl	%o7,%g0
	nop
near1_b2b_h:
	udivx	%l7,0xc4b,%l2
	mulx	%l5,-0x0fe,%l0
	fdivs	%f25,%f31,%f23
	xnor	%l6,%l3,%l7
	orn	%l1,%l6,%l6
	jmpl	%o7,%g0
	smul	%l2,%l1,%l1
near1_b2b_l:
	fadds	%f5 ,%f1 ,%f8 
	fcmps	%fcc1,%f5 ,%f15
	xor	%l3,0x6a9,%l0
	smul	%l0,0xcce,%l3
	smul	%l0,0xf56,%l2
	jmpl	%o7,%g0
	subc	%l2,-0xbaa,%l2
user_near1_end:
	.seg	"text"
	.align	0x2000
user_near2_start:
p0_near_2_le:
	fdivs	%f6 ,%f14,%f1 
	and	%l7,%l4,%l1
	smul	%l3,0x532,%l4
	jmpl	%o7,%g0
	and	%l4,%l6,%l2
p0_near_2_he:
	sdivx	%l4,%l7,%l0
	smul	%l6,%l6,%l4
	sdivx	%l0,%l1,%l1
	fsubs	%f21,%f24,%f24
	jmpl	%o7,%g0
	sdivx	%l5,%l7,%l2
near2_b2b_h:
	smul	%l5,%l3,%l1
	jmpl	%o7,%g0
	sdivx	%l0,-0xd11,%l0
near2_b2b_l:
	orn	%l6,%l3,%l5
	jmpl	%o7,%g0
	fsubs	%f7 ,%f15,%f5 
user_near2_end:
	.seg	"text"
	.align	0x2000
user_near3_start:
p0_near_3_le:
	udivx	%l6,%l3,%l4
	udivx	%l6,-0x1c6,%l6
	fsubs	%f15,%f0 ,%f5 
	xnor	%l3,%l6,%l2
	subc	%l6,%l7,%l5
	fdivs	%f8 ,%f6 ,%f12
	jmpl	%o7,%g0
	fdtos	%f14,%f3 
p0_near_3_he:
	fdivs	%f19,%f18,%f27
	smul	%l6,%l3,%l5
	sub	%l6,0x0bb,%l7
	orn	%l4,-0xa99,%l1
	jmpl	%o7,%g0
	or	%l2,%l1,%l2
near3_b2b_h:
	jmpl	%o7,%g0
	xnor	%l2,-0xc1d,%l1
	jmpl	%o7,%g0
	nop
near3_b2b_l:
	jmpl	%o7,%g0
	subc	%l7,-0x7bd,%l4
	jmpl	%o7,%g0
	nop
user_near3_end:
	.seg	"text"
	.text
	.align	0x2000
user_far0_start:
p0_far_0_le:
	addc	%l2,0xd2f,%l3
	fcmps	%fcc1,%f13,%f4 
	umul	%l5,-0xaeb,%l3
	smul	%l4,-0x55c,%l0
	fcmps	%fcc0,%f14,%f11
	fsubs	%f12,%f2 ,%f10
	udivx	%l6,0x5e5,%l6
	jmpl	%o7,%g0
	fdtoi	%f10,%f14
p0_far_0_lem:
	addc	%l2,0xd2f,%l3
	fcmps	%fcc1,%f13,%f4 
	umul	%l5,-0xaeb,%l3
	smul	%l4,-0x55c,%l0
	fcmps	%fcc0,%f14,%f11
	fsubs	%f12,%f2 ,%f10
	udivx	%l6,0x5e5,%l6
	jmpl	%o7,%g0
	fdtoi	%f10,%f14
p0_far_0_he:
	subc	%l6,-0x03d,%l7
	sub	%l2,-0x1e9,%l3
	fsubs	%f18,%f17,%f21
	fsubs	%f24,%f19,%f30
	xor	%l4,0x415,%l3
	fsqrts	%f21,%f23
	jmpl	%o7,%g0
	sdivx	%l4,0x9c2,%l6
p0_far_0_hem:
	subc	%l6,-0x03d,%l7
	sub	%l2,-0x1e9,%l3
	fsubs	%f18,%f17,%f21
	fsubs	%f24,%f19,%f30
	xor	%l4,0x415,%l3
	fsqrts	%f21,%f23
	jmpl	%o7,%g0
	sdivx	%l4,0x9c2,%l6
p0_loop_branch_0:
	jmpl	%o7+12,%g0
	add	%l0,1,%l0
far0_b2b_h:
	sdivx	%l7,-0x4ba,%l3
	mulx	%l5,%l3,%l2
	sub	%l7,%l7,%l3
	fcmps	%fcc2,%f21,%f26
	andn	%l3,0x459,%l0
	sdivx	%l1,-0xd09,%l5
	mulx	%l7,0xf04,%l0
	jmpl	%o7,%g0
	subc	%l4,%l0,%l4
far0_b2b_l:
	fmuls	%f10,%f3 ,%f9 
	fsubs	%f2 ,%f2 ,%f15
	andn	%l2,%l1,%l6
	fadds	%f6 ,%f14,%f7 
	mulx	%l0,%l7,%l1
	fsubs	%f0 ,%f9 ,%f3 
	orn	%l2,%l5,%l5
	jmpl	%o7,%g0
	xor	%l5,0xec4,%l4
user_far0_end:
	.seg	"text"
	.text
	.align	0x2000
user_far1_start:
p0_far_1_le:
	orn	%l6,0x4a6,%l7
	xor	%l5,0x9a5,%l7
	jmpl	%o7,%g0
	fsubs	%f14,%f10,%f6 
p0_far_1_lem:
	orn	%l6,0x4a6,%l7
	xor	%l5,0x9a5,%l7
	jmpl	%o7,%g0
	fsubs	%f14,%f10,%f6 
p0_far_1_he:
	jmpl	%o7,%g0
	mulx	%l2,%l4,%l6
	jmpl	%o7,%g0
	nop
p0_far_1_hem:
	jmpl	%o7,%g0
	mulx	%l2,%l4,%l6
	jmpl	%o7,%g0
	nop
p0_loop_branch_1:
	jmpl	%o7+12,%g0
	add	%l0,2,%l0
far1_b2b_h:
	umul	%l4,%l5,%l6
	add	%l0,0x833,%l0
	smul	%l1,%l5,%l0
	smul	%l4,0xe1b,%l1
	umul	%l0,-0x9e2,%l2
	jmpl	%o7,%g0
	fsubs	%f16,%f19,%f19
far1_b2b_l:
	umul	%l2,%l2,%l5
	udivx	%l5,%l2,%l4
	orn	%l4,%l3,%l7
	subc	%l4,%l6,%l2
	umul	%l7,%l4,%l5
	jmpl	%o7,%g0
	xnor	%l1,%l4,%l2
user_far1_end:
	.seg	"text"
	.text
	.align	0x2000
user_far2_start:
p0_far_2_le:
	fcmps	%fcc1,%f0 ,%f3 
	xor	%l3,0xfe7,%l7
	xnor	%l2,-0x02a,%l1
	fmuls	%f2 ,%f2 ,%f1 
	xor	%l2,%l4,%l6
	jmpl	%o7,%g0
	lduw	[%i2+0x024],%l2		! Mem[0000000010081424]
p0_far_2_lem:
	fcmps	%fcc1,%f0 ,%f3 
	xor	%l3,0xfe7,%l7
	xnor	%l2,-0x02a,%l1
	fmuls	%f2 ,%f2 ,%f1 
	xor	%l2,%l4,%l6
	membar	#Sync
	jmpl	%o7,%g0
	lduw	[%i2+0x024],%l2		! Mem[0000000010081424]
p0_far_2_he:
	fsubs	%f18,%f31,%f30
	udivx	%l6,%l2,%l0
	jmpl	%o7,%g0
	fsqrts	%f19,%f29
p0_far_2_hem:
	fsubs	%f18,%f31,%f30
	udivx	%l6,%l2,%l0
	jmpl	%o7,%g0
	fsqrts	%f19,%f29
p0_loop_branch_2:
	jmpl	%o7+12,%g0
	add	%l0,3,%l0
far2_b2b_h:
	and	%l5,0x08e,%l0
	add	%l2,%l5,%l5
	sdivx	%l2,%l3,%l1
	fmuls	%f29,%f31,%f19
	xnor	%l7,0x551,%l3
	jmpl	%o7,%g0
	fdivs	%f30,%f19,%f28
far2_b2b_l:
	umul	%l4,%l0,%l2
	fdivs	%f9 ,%f3 ,%f9 
	mulx	%l0,%l3,%l1
	subc	%l0,-0x76b,%l0
	fstoi	%f13,%f0 
	jmpl	%o7,%g0
	andn	%l3,%l7,%l4
user_far2_end:
	.seg	"text"
	.text
	.align	0x2000
user_far3_start:
p0_far_3_le:
	mulx	%l5,%l4,%l2
	or	%l5,%l5,%l1
	udivx	%l7,0x4ef,%l7
	jmpl	%o7,%g0
	fdivs	%f10,%f15,%f10
p0_far_3_lem:
	mulx	%l5,%l4,%l2
	or	%l5,%l5,%l1
	udivx	%l7,0x4ef,%l7
	jmpl	%o7,%g0
	fdivs	%f10,%f15,%f10
p0_far_3_he:
	jmpl	%o7,%g0
	andn	%l4,%l4,%l1
	jmpl	%o7,%g0
	nop
p0_far_3_hem:
	jmpl	%o7,%g0
	andn	%l4,%l4,%l1
	jmpl	%o7,%g0
	nop
p0_loop_branch_3:
	jmpl	%o7+12,%g0
	add	%l0,4,%l0
far3_b2b_h:
	fsqrts	%f27,%f24
	xor	%l7,%l6,%l2
	orn	%l0,0xef6,%l0
	or	%l1,%l3,%l5
	mulx	%l4,-0x444,%l6
	fsubs	%f27,%f24,%f23
	jmpl	%o7,%g0
	and	%l3,%l0,%l1
far3_b2b_l:
	andn	%l2,0x267,%l5
	fsqrts	%f3 ,%f11
	smul	%l1,0x89e,%l4
	xnor	%l4,-0x667,%l4
	udivx	%l1,-0xee1,%l3
	or	%l7,%l2,%l7
	jmpl	%o7,%g0
	andn	%l5,-0xde1,%l7
user_far3_end:
	.seg	"text"
	.align	0x2000
user_jump0_start:
	INIT_MEM(0, 0x0010, 1, +, 0, +, 0)
p0_jmpl_0_le:
	andn	%l3,%l4,%l5
	jmpl	%g6+8,%g0
	xor	%l3,%l7,%l2
p0_call_0_le:
	swap	[%i0+0x008],%l4		! Mem[0000000010001408]
	fcmps	%fcc0,%f3 ,%f12
	mulx	%l0,0x3e2,%l5
	sdivx	%l4,0x0d4,%l5
	ldub	[%i0+0x00c],%l4		! Mem[000000001000140c]
	retl
	fadds	%f11,%f13,%f8 
p0_jmpl_0_lo:
	andn	%l3,%l4,%l5
	jmpl	%g6+8,%g0
	xor	%l3,%l7,%l2
p0_call_0_lo:
	swap	[%o0+0x008],%l4		! Mem[0000000010001408]
	fcmps	%fcc0,%f3 ,%f12
	mulx	%l0,0x3e2,%l5
	sdivx	%l4,0x0d4,%l5
	ldub	[%o0+0x00c],%l4		! Mem[000000001000140c]
	retl
	fadds	%f11,%f13,%f8 
p0_jmpl_0_he:
	fsubs	%f18,%f22,%f18
	fsqrts	%f23,%f22
	mulx	%l5,0xf5c,%l3
	jmpl	%g6+8,%g0
	sdivx	%l7,-0xc7f,%l4
p0_call_0_he:
	fmuls	%f21,%f26,%f31
	subc	%l2,0xe98,%l7
	xnor	%l5,%l2,%l5
	stb	%l1,[%i5+0x037]		! Mem[0000000010141437]
	and	%l6,%l6,%l3
	fdivs	%f19,%f21,%f21
	retl
	andn	%l4,%l3,%l2
p0_jmpl_0_ho:
	fsubs	%f18,%f22,%f18
	fsqrts	%f23,%f22
	mulx	%l5,0xf5c,%l3
	jmpl	%g6+8,%g0
	sdivx	%l7,-0xc7f,%l4
p0_call_0_ho:
	fmuls	%f21,%f26,%f31
	subc	%l2,0xe98,%l7
	xnor	%l5,%l2,%l5
	stb	%l1,[%o5+0x037]		! Mem[0000000010141437]
	and	%l6,%l6,%l3
	fdivs	%f19,%f21,%f21
	retl
	andn	%l4,%l3,%l2
user_jump0_end:
	.seg	"text"
	.align	0x2000
user_jump1_start:
	INIT_MEM(0, 0x0020, 1, +, 0, +, 0)
p0_jmpl_1_le:
	ldstub	[%o1+0x041],%l0		! Mem[0000000020800041]
	stx	%l1,[%i4+0x038]		! Mem[0000000010101438]
	fmuls	%f7 ,%f6 ,%f8 
	orn	%l1,-0x586,%l2
	fcmps	%fcc2,%f1 ,%f12
	udivx	%l1,-0xf8a,%l5
	jmpl	%g6+8,%g0
	mulx	%l1,0x0a1,%l7
p0_call_1_le:
	fcmps	%fcc0,%f1 ,%f2 
	addc	%l2,0x7a4,%l6
	udivx	%l7,0x7cf,%l3
	fdivs	%f0 ,%f0 ,%f15
	retl
	fdivs	%f6 ,%f10,%f14
p0_jmpl_1_lo:
	ldstub	[%i1+0x041],%l0		! Mem[0000000020800041]
	stx	%l1,[%o4+0x038]		! Mem[0000000010101438]
	fmuls	%f7 ,%f6 ,%f8 
	orn	%l1,-0x586,%l2
	fcmps	%fcc2,%f1 ,%f12
	udivx	%l1,-0xf8a,%l5
	jmpl	%g6+8,%g0
	mulx	%l1,0x0a1,%l7
p0_call_1_lo:
	fcmps	%fcc0,%f1 ,%f2 
	addc	%l2,0x7a4,%l6
	udivx	%l7,0x7cf,%l3
	fdivs	%f0 ,%f0 ,%f15
	retl
	fdivs	%f6 ,%f10,%f14
p0_jmpl_1_he:
	fcmps	%fcc2,%f31,%f21
	xor	%l6,-0xf25,%l4
	ldsh	[%i4+0x002],%l3		! Mem[0000000010101402]
	fdivs	%f22,%f24,%f23
	jmpl	%g6+8,%g0
	smul	%l1,-0x618,%l3
p0_call_1_he:
	retl
	fmuls	%f30,%f26,%f26
p0_jmpl_1_ho:
	fcmps	%fcc2,%f31,%f21
	xor	%l6,-0xf25,%l4
	ldsh	[%o4+0x002],%l3		! Mem[0000000010101402]
	fdivs	%f22,%f24,%f23
	jmpl	%g6+8,%g0
	smul	%l1,-0x618,%l3
p0_call_1_ho:
	retl
	fmuls	%f30,%f26,%f26
user_jump1_end:
	.seg	"text"
	.align	0x2000
user_jump2_start:
	INIT_MEM(0, 0x0030, 1, +, 0, +, 0)
p0_jmpl_2_le:
	ldstub	[%o1+0x000],%l1		! Mem[0000000020800000]
	jmpl	%g6+8,%g0
	fdivs	%f2 ,%f12,%f10
p0_call_2_le:
	fcmps	%fcc3,%f12,%f11
	xnor	%l2,%l6,%l2
	fsubs	%f6 ,%f6 ,%f3 
	sdivx	%l6,0x272,%l0
	umul	%l0,%l0,%l2
	retl
	fcmps	%fcc0,%f2 ,%f8 
p0_jmpl_2_lo:
	ldstub	[%i1+0x000],%l1		! Mem[0000000020800000]
	jmpl	%g6+8,%g0
	fdivs	%f2 ,%f12,%f10
p0_call_2_lo:
	fcmps	%fcc3,%f12,%f11
	xnor	%l2,%l6,%l2
	fsubs	%f6 ,%f6 ,%f3 
	sdivx	%l6,0x272,%l0
	umul	%l0,%l0,%l2
	retl
	fcmps	%fcc0,%f2 ,%f8 
p0_jmpl_2_he:
	fstod	%f31,%f24
	andn	%l4,-0xc25,%l1
	ldd	[%i1+0x038],%l6		! Mem[0000000010041438]
	std	%l2,[%i5+0x030]		! Mem[0000000010141430]
	subc	%l4,0xff9,%l6
	jmpl	%g6+8,%g0
	andn	%l3,-0x394,%l0
p0_call_2_he:
	or	%l5,0xad9,%l2
	retl
	andn	%l5,0x03a,%l7
p0_jmpl_2_ho:
	fstod	%f31,%f24
	andn	%l4,-0xc25,%l1
	ldd	[%o1+0x038],%l6		! Mem[0000000010041438]
	std	%l2,[%o5+0x030]		! Mem[0000000010141430]
	subc	%l4,0xff9,%l6
	jmpl	%g6+8,%g0
	andn	%l3,-0x394,%l0
p0_call_2_ho:
	or	%l5,0xad9,%l2
	retl
	andn	%l5,0x03a,%l7
user_jump2_end:
	.seg	"text"
	.align	0x2000
user_jump3_start:
	INIT_MEM(0, 0x0040, 1, +, 0, +, 0)
p0_jmpl_3_le:
	xor	%l7,%l1,%l4
	addc	%l3,-0x11a,%l1
	sdivx	%l7,%l3,%l5
	orn	%l2,%l2,%l2
	smul	%l4,%l3,%l1
	fsqrts	%f5 ,%f7 
	jmpl	%g6+8,%g0
	andn	%l3,%l1,%l2
p0_call_3_le:
	fmuls	%f5 ,%f8 ,%f1 
	udivx	%l4,-0x27c,%l5
	fsubs	%f7 ,%f1 ,%f12
	or	%l2,%l7,%l5
	retl
	andn	%l5,%l1,%l6
p0_jmpl_3_lo:
	xor	%l7,%l1,%l4
	addc	%l3,-0x11a,%l1
	sdivx	%l7,%l3,%l5
	orn	%l2,%l2,%l2
	smul	%l4,%l3,%l1
	fsqrts	%f5 ,%f7 
	jmpl	%g6+8,%g0
	andn	%l3,%l1,%l2
p0_call_3_lo:
	fmuls	%f5 ,%f8 ,%f1 
	udivx	%l4,-0x27c,%l5
	fsubs	%f7 ,%f1 ,%f12
	or	%l2,%l7,%l5
	retl
	andn	%l5,%l1,%l6
p0_jmpl_3_he:
	fsubs	%f20,%f30,%f19
	smul	%l2,%l2,%l0
	fdivs	%f31,%f20,%f27
	jmpl	%g6+8,%g0
	xor	%l6,-0xf94,%l6
p0_call_3_he:
	addc	%l0,%l3,%l6
	addc	%l3,%l5,%l5
	fdivs	%f29,%f31,%f16
	fmuls	%f18,%f25,%f31
	xnor	%l1,%l3,%l6
	retl
	orn	%l7,%l6,%l3
p0_jmpl_3_ho:
	fsubs	%f20,%f30,%f19
	smul	%l2,%l2,%l0
	fdivs	%f31,%f20,%f27
	jmpl	%g6+8,%g0
	xor	%l6,-0xf94,%l6
p0_call_3_ho:
	addc	%l0,%l3,%l6
	addc	%l3,%l5,%l5
	fdivs	%f29,%f31,%f16
	fmuls	%f18,%f25,%f31
	xnor	%l1,%l3,%l6
	retl
	orn	%l7,%l6,%l3
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
	.word	0xa05085f1,0xfd9de7be		! Init value for %l0
	.word	0x519e92de,0x91105983		! Init value for %l1
	.word	0xdc766f1a,0xac7211e2		! Init value for %l2
	.word	0x79867b9b,0xda9632ea		! Init value for %l3
	.word	0x2a82b89d,0xdc1c9b87		! Init value for %l4
	.word	0xbd078988,0x8dd09997		! Init value for %l5
	.word	0xca0dbeaf,0xf3637d09		! Init value for %l6
	.word	0x7cd54f9a,0xe0a5126c		! Init value for %l7
	.align	64
p0_init_freg:
	.word	0x412621cf,0x11c15bea		! Init value for %f0 
	.word	0x6db76f85,0x68f1e32f		! Init value for %f2 
	.word	0x4b58f5db,0x2cf2ca8f		! Init value for %f4 
	.word	0xed8fbb52,0x6bad3bc5		! Init value for %f6 
	.word	0x3546da2c,0x7b6ee7ab		! Init value for %f8 
	.word	0x7ca4432c,0xe2b3ff02		! Init value for %f10
	.word	0x474d2f52,0xe361fd4e		! Init value for %f12
	.word	0x106038a6,0x9c55a580		! Init value for %f14
	.word	0x2b1b3d1d,0xf6152b8c		! Init value for %f16
	.word	0x7cd94d89,0x860f3107		! Init value for %f18
	.word	0x6bd2c2b1,0x14e9f165		! Init value for %f20
	.word	0x122065a5,0xa36197df		! Init value for %f22
	.word	0x31b9e96c,0xe22cf59f		! Init value for %f24
	.word	0xb3100ec3,0xf4b4c85e		! Init value for %f26
	.word	0x6c02c89e,0xc47f799d		! Init value for %f28
	.word	0x5dbd5252,0x152b3a1b		! Init value for %f30
	.word	0x728b5689,0x66514f11		! Init value for %f32
	.word	0xeffc5ae2,0x9f1d0b76		! Init value for %f34
	.word	0xf323376e,0xa9a68b16		! Init value for %f36
	.word	0xb55fb385,0x4ea93745		! Init value for %f38
	.word	0x96901360,0x0165224a		! Init value for %f40
	.word	0x258623a6,0x11fdf559		! Init value for %f42
	.word	0x4866e635,0x6ee77e29		! Init value for %f44
	.word	0x6d852d15,0xc3e058f6		! Init value for %f46
	.word	0x521a50ab,0x75aaae70
	.word	0x8b91071f,0x7c0cfe20
	.word	0xcaa73281,0xad1ed841
	.word	0x47fffeac,0x6dd43ad8
	.word	0xddbc7acb,0x4863e6f0
	.word	0xd81eea0a,0xbcfa1815
	.word	0x74c61ba0,0x1212eb67
	.word	0x7eddd603,0x02d69533
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
	.word	0xffffffff,0xa90947ff
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000082
	.word	0x00000000,0x000000ff
	.word	0x00000000,0x000000ff
	.word	0x00000000,0x4676dcc0
	.word	0x00000000,0xc46788cf
p0_expected_fp_regs:
	.word	0x00860000,0x00002dc5
	.word	0x4effafcb,0x97340d73
	.word	0x2dc52dc5,0x00000000
	.word	0x587adc62,0x0000ffff
	.word	0x00000034,0x0b419631
	.word	0xff00ffff,0x00007c00
	.word	0x4effafcb,0x97340d73
	.word	0xffffb58e,0x7fffffff
	.word	0xff4709a9,0xff000000
	.word	0x00000000,0x4effafcb
	.word	0xff4709a9,0x00000000
	.word	0x00000000,0x730d34ff
	.word	0x0000ffff,0x00000000
	.word	0x00000000,0x0b419631
	.word	0x00000000,0xff857c59
	.word	0xbad76926,0xe10ece31
	.word	0x00000007,0x00000000		! %fsr = 0000000700000000
p0_local0_expect:
	.word	0xffff0000,0x000000ff
	.word	0x6f32787f,0x0000005d
	.word	0xffa6de82,0xff000034
	.word	0x9013de48,0x00000000
	.word	0x049f032f,0x97340d73
	.word	0x0000ff91,0x00008600
	.word	0x00000000,0x0b419631
	.word	0x0e0671aa,0x191c67b8
p0_local0_sec_expect:
	.word	0x000031ce,0xf0ab829b
	.word	0xff000000,0xffffd2ef
	.word	0xfffff1e0,0xa28d2b97
	.word	0x3fd4f6b1,0x6bac2748
	.word	0x5e1274e7,0xa4e0e78b
	.word	0x189119a2,0x0ffe00ee
	.word	0xd19d02da,0xd35f234f
	.word	0x04089650,0xa7ce975d
p0_local1_expect:
	.word	0xff4709a9,0xff000000
	.word	0xffffb58e,0x7fffffff
	.word	0x4c0009a9,0x00000000
	.word	0x037721ec,0x0a7a7b57
	.word	0x0000ffff,0x00000000
	.word	0x0475329a,0xc46788cf
	.word	0x730d0000,0xcbaf7c59
	.word	0xbad76926,0xe10ece31
p0_local1_sec_expect:
	.word	0xff8e0000,0x159ad392
	.word	0xff4709a9,0xc78dcd1f
	.word	0xffb0ffff,0x00000000
	.word	0x3b22bbb1,0xb9f319f7
	.word	0x107f01ca,0x36186a14
	.word	0xc95bb854,0x1a0a2d7a
	.word	0xbc042a42,0xc774656e
	.word	0x82cb5d6a,0x1e9d9c3a
p0_local2_expect:
	.word	0xff0000ff,0xffff91ab
	.word	0xe3000000,0x7f78326f
	.word	0x2dc52dc5,0xffffffb9
	.word	0xbacb85e3,0xae339ae5
	.word	0xc78dcd1f,0x00000000
	.word	0xb1ded3c8,0x00000000
	.word	0xff33a6cf,0xc78dcd1f
	.word	0xd792467c,0x000000ff
p0_local2_sec_expect:
	.word	0x0000410b,0x00000000
	.word	0x007c0000,0xffffb58e
	.word	0xff00ffff,0x00008600
	.word	0x60fdd230,0xc47f799d
	.word	0x1f91a4ad,0x49180dc5
	.word	0x81b0e4da,0xf1d8505a
	.word	0x7893e93a,0xb58e6063
	.word	0x24e335d7,0xae33186d
p0_local3_expect:
	.word	0xff340d73,0x000000ff
	.word	0x007c0000,0xffff00ff
	.word	0xff000000,0x00008600
	.word	0xe59a33ae,0xe385cbba
	.word	0x7f78006f,0x052fc340
	.word	0x9ac0a24d,0xffbd5252
	.word	0xffffffff,0xffe1e712
	.word	0xff000000,0xf6cda1ad
p0_local3_sec_expect:
	.word	0x4effafcb,0x97340d73
	.word	0x00000000,0x00000000
	.word	0xb9892fcd,0x00000000
	.word	0xbacb85e3,0xae339ae5
	.word	0xc78dcd1f,0x82dea6cf
	.word	0x00000097,0x3196410b
	.word	0x7893e93a,0xb58e6063
	.word	0x0000467c,0xffff09a9
p0_local4_expect:
	.word	0xffa63382,0x00000000
	.word	0x31ce0ee1,0x2669d7ba
	.word	0xff000000,0x000000ff
	.word	0xbd764d1b,0xa5a2dbff
	.word	0x972b8da2,0x5d6c9105
	.word	0x43a239ff,0x159a00ff
	.word	0xb0a7bc52,0x75cdffd2
	.word	0x049f032f,0x97340d73
p0_local4_sec_expect:
	.word	0x0096410b,0x00000000
	.word	0x00008d78,0x68de8419
	.word	0x0000007c,0xffffffb0
	.word	0xd792467c,0xef4709a9
	.word	0x037702eb,0x0be2dfdd
	.word	0x21de0004,0xd42070cc
	.word	0x8907f971,0x0ed1e18a
	.word	0xec217703,0x4e0f0307
p0_local5_expect:
	.word	0x00000000,0x00000000
	.word	0x4c000000,0x3f1d84d9
	.word	0xff916c5d,0x00000005
	.word	0xea8bb376,0xef4c33cb
	.word	0x9475851b,0x0000005d
	.word	0x00000000,0x00002dc5
	.word	0x00000000,0x000000ff
	.word	0x62120000,0xffffff8e
p0_local5_sec_expect:
	.word	0xffff0000,0x62dc7a58
	.word	0x4c000000,0x5da9b785
	.word	0x0086fe14,0x00000005
	.word	0xefb191eb,0xd52b5079
	.word	0x633d819c,0x34bb3bb9
	.word	0xcfea979e,0x1956777f
	.word	0x05ebb322,0x711fcfaf
	.word	0x6fb251dc,0x00001960
p0_local6_expect:
	.word	0x730d3497,0xcbafff4e
	.word	0xffde1390,0x1fcd8dc7
	.word	0x00860000,0x00002dc5
	.word	0x00000000,0x4eff47ef
	.word	0x037721ec,0x0a7a7b57
	.word	0xbb47b886,0x92e6fbc0
	.word	0x5d6c91ff,0x894dd97c
	.word	0x00000005,0x6a315fc1
p0_local6_sec_expect:
	.word	0x00000000,0x00000000
	.word	0xcf8867c4,0x4e0f0307
	.word	0x8eb5ffff,0x000021ec
	.word	0x730d3497,0x2f039f04
	.word	0x5d6c9105,0x6ce9b931
	.word	0xabe76e7b,0xc30e10b3
	.word	0x9d797fc4,0x9ec8026c
	.word	0x1b3a2b15,0x5252bd5d
share0_expect:
	.word	0x31ff6bf6,0xece91a84
	.word	0x2b81fa46,0xd65fe591
	.word	0x81cbc611,0x3b8fe684
	.word	0x32079ed2,0x6077e898
	.word	0x21aafe4a,0x85878ab9
	.word	0x7fc8ec92,0x0c44dfdb
	.word	0x7d26cf9a,0xc0218a0a
	.word	0xbcd91914,0x73d1cf1b
share1_expect:
	.word	0x003198bf,0xb2a9bdb1
	.word	0x8a0c1b83,0xfa79098b
	.word	0x16a2c281,0x572b5f3b
	.word	0xd5b44aad,0x4cceb6d7
	.word	0xea723bf9,0x33cf57bd
	.word	0x8976d269,0xc4d1a47a
	.word	0xd1bde7df,0xff3efae3
	.word	0x73195890,0x488c91bd
	.word	0xffff359e,0xb3c21455
	.word	0xc480b010,0x65524576
	.word	0xe2e1c0af,0x28c278c5
	.word	0xa2bbc106,0x28e54694
	.word	0x9bc1daad,0x89afa2cb
	.word	0x0ade67a9,0x780727b9
	.word	0xafdeb3ca,0xb078065b
	.word	0x7794c1bb,0x865f45aa
share2_expect:
	.word	0x410bc666,0xfaa8d11b
	.word	0x0446655f,0x7fc5a3e7
	.word	0xa5cf2103,0xb343654b
	.word	0xe8b3ea09,0xc5ca3d09
	.word	0x9144ce10,0xb848ab2c
	.word	0xb75eab1a,0xce9c57a1
	.word	0xcca43fa3,0xaab6f740
	.word	0xa140c614,0x6d8a9878
share3_expect:
	.word	0x81ff1cea,0xca109af0
	.word	0x9dbb2584,0xa6aa2b98
	.word	0xf56547a4,0x1da6e0d1
	.word	0xd0c6e1a2,0x2f386904
	.word	0x93fd8d2f,0x9415e54b
	.word	0xb2e49c37,0x12dcc32e
	.word	0xb88dc368,0x9c01f038
	.word	0x3b222159,0x35678f16
	.word	0x5dac0f03,0xa3665d0c
	.word	0x1f084efd,0x421b35f0
	.word	0x3b624de7,0x3db06c50
	.word	0xb325f89c,0x1b755dbb
	.word	0x58088bc5,0x5a532814
	.word	0xf9f0c2f2,0xd3e7afb6
	.word	0x15edbdb1,0x2a998a76
	.word	0x4d57a9bf,0x861959cd
	.word	0x009d2e32,0x4572df2b
	.word	0x23024b5e,0x96d51792
	.word	0x5ccb633c,0x428b214f
	.word	0xe5edaf16,0x9c7d2b83
	.word	0x2c3ce971,0xcbbb2978
	.word	0x2205bbbb,0xeccaa01e
	.word	0x380a799e,0x8b854157
	.word	0x229619e1,0x010eb500
	.word	0xe8e8e4de,0xd8c8f384
	.word	0x4affa466,0x428fe803
	.word	0x2863a958,0x5a4eef3b
	.word	0xa3cd91dd,0xa6a6bbea
	.word	0xf8cfb9f7,0x7d7abb13
	.word	0x7a692692,0xa0007b5e
	.word	0x2d2d6d06,0xb9f978ad
	.word	0x8f2620ba,0xd475781c
	.word	0x4905ee79,0x297d6fd5
	.word	0xadb0fc96,0x309dca03
	.word	0xa82d93ab,0x453040dc
	.word	0x9978b7dd,0xbb793d77
	.word	0x43c6132a,0xa4fa6f06
	.word	0x2c5055fc,0x95025bcc
	.word	0xf02edd7a,0x070495ea
	.word	0xe7335387,0x828163cd
	.word	0x2dffcd46,0x116f6781
	.word	0x929946fb,0x32620f4a
	.word	0x467d7f82,0x870e5a8e
	.word	0xd6e8220e,0x146829d4
	.word	0xd2d5d210,0xe18f2554
	.word	0x7d136aa0,0xd868790f
	.word	0xc0ff6059,0x1a66046f
	.word	0x0bbbc8a0,0xc6d5b922
	.word	0xca4c59fe,0x647d1783
	.word	0xef165407,0x4137f73f
	.word	0x461f57b4,0x85a55149
	.word	0x9eed7d54,0x6d6f079a
	.word	0x197e5479,0xc4779c71
	.word	0x8f50770e,0x950b6c73
	.word	0x723bcb99,0x11a62f29
	.word	0xf96dc93e,0x3dbe1860
	.word	0x000813ce,0xa64cf276
	.word	0x812eda30,0x9dc0173e
	.word	0x2d6f9d64,0x22f812c7
	.word	0x0fe75726,0xea5974bc
	.word	0xaa53d950,0x52091c98
	.word	0x3ad1828d,0x19f57b47
	.word	0x6209b18e,0xa525d920
	.word	0x64bd9e1b,0xaa7f6ee9
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
	.word	0x5278bfb7,0x91825900
	.word	0x00000000,0x00000002
	.word	0x305dbd97,0xcd512b70
	.word	0x00000000,0x00000003
	.word	0x74659a67,0xf071a325
	.word	0x00000000,0x00000004
	.word	0x056ece78,0x0d8d9b28
	.word	0x00000000,0x00000005
	.word	0x3ec048cf,0xb603e8cb
	.word	0x00000000,0x00000006
	.word	0xa0cf4ddf,0x93ca1a04
	.word	0x00000000,0x00000007
	.word	0x0083e9df,0xe78110c4
	.word	0x00000000,0x00000008
	.word	0x84090b57,0xb781ba30
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
	.word	0x643cd6ce,0xb9d66c2b,0x91abc5b1,0xe3056f81
	.word	0x62121f0e,0x3a149649,0x1da65e34,0xaa7d2e23
	.word	0x60710609,0x709e833d,0x5a92fb9b,0x49d22fad
	.word	0x6bae32ba,0xe8d0dd81,0x0e0671aa,0x191c67b8
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
	.word	0xbae6f2ac,0x397ae14f,0xa408eac5,0x89984b24
	.word	0x09b2a108,0x9cf60a8a,0x3fd4f6b1,0x6bac2748
	.word	0x5e1274e7,0xa4e0e78b,0x189119a2,0x0ffe00ee
	.word	0xd19d02da,0xd35f234f,0x04089650,0xa7ce975d
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
	.word	0x02e494eb,0x39e4d0f9,0x914d5bdd,0x38bbe9e4
	.word	0x5120908c,0x93fe1401,0x85b7a95d,0x0a7a7b57
	.word	0x7074f390,0xad075847,0x0475329a,0xc46788cf
	.word	0x4377bb05,0xe3857c59,0xbad76926,0xe10ece31
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
	.word	0x7e030643,0x3d86de82,0x9bc658e8,0xd716db66
	.word	0xcfa63dd5,0xe0753291,0x3b22bbb1,0xb9f319f7
	.word	0x107f01ca,0x36186a14,0xc95bb854,0x1a0a2d7a
	.word	0xbc042a42,0xc774656e,0x82cb5d6a,0x1e9d9c3a
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
	.word	0x5ddc9bc9,0x0393c16d,0x1c57dbc3,0x4761be06
	.word	0xded9a71b,0x9bf9a82b,0x0120a6e0,0x7026434e
	.word	0xa9bfd040,0x232bc850,0x30feeba5,0x98fe89ed
	.word	0xb4642cfd,0x67e0f411,0x6252835a,0xfc2ebf94
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
	.word	0xf3f61a68,0x70a84536,0x903ca915,0x70e9dac3
	.word	0xc10c46b4,0x65b7835d,0x60fdd230,0xf31df000
	.word	0x1f91a4ad,0x49180dc5,0x81b0e4da,0xf1d8505a
	.word	0x32516ece,0xfbe3fbbf,0x24e335d7,0x3569186d
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
	.word	0x21a55455,0xcf79c82a,0x0469043f,0x5141851b
	.word	0x99932f7c,0x06a1f929,0xb8014883,0xa217791d
	.word	0x49e102f9,0x25a8e723,0xd4e50e16,0xe82cbb8a
	.word	0xb968b3a9,0xf6cda1ad,0x00080cdd,0x0030c4bf
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
	.word	0x6c916c5d,0x5392059d,0xdf488676,0xa335fab1
	.word	0xd4a07e91,0x4079611f,0xbacb85e3,0xae339ae5
	.word	0xc78dcd1f,0x82dea6cf,0xac259486,0x4da2c09a
	.word	0x789302e3,0x0978858f,0xc41d1ee2,0x4bdac1b2
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
	.word	0xca706a57,0x9334c67c,0x25cacb09,0x2a13f6c0
	.word	0xb146f287,0x9a156aaf,0xbd764d1b,0xa5a2dbe6
	.word	0x239c083d,0x4022dcb0,0x43a2396f,0x159ad392
	.word	0xb0a7bc52,0x75cdefd2,0x049f032f,0x97340d73
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
	.word	0xf915a154,0xfb573cf4,0x2aa51fdd,0xcfc18d38
	.word	0xe85db0b3,0xfafa33af,0xd792467c,0xef4709a9
	.word	0x037702eb,0x0be2dfdd,0x21de0004,0xd42070cc
	.word	0x8907f971,0x0ed1e18a,0xec217703,0x4e0f0307
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
	.word	0xcbaf0c4e,0xdfdec795,0x7a92476f,0xc21c7cd0
	.word	0x5355d9f4,0x15976691,0xea8bb376,0xef4c33cb
	.word	0x9475d354,0x69474cbc,0x91e10fb8,0xd8f3310f
	.word	0x96d78607,0xfcecd6eb,0x459e43d8,0x616cdd61
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
	.word	0x6334b2ee,0xc8d3deb1,0xad6a3b63,0xabedea20
	.word	0x972b8da2,0x38235dc9,0xefb191eb,0xd52b5079
	.word	0x633d819c,0x34bb3bb9,0xcfea979e,0x1956777f
	.word	0x05ebb322,0x711fcfaf,0x89b251dc,0xe9dc1960
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
	.word	0x9616bb67,0x9b3d9348,0x0aaa20f4,0x0512d462
	.word	0x51371e99,0x2dc5892e,0x2697a53f,0x2a01cd44
	.word	0xc1e6ac7d,0x0b419631,0xbb47b886,0x92e6fbc0
	.word	0x6a19e93a,0xb58e6063,0x6f32787f,0x6a315fc1
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
	.word	0x5c3a9475,0x4c7136f1,0x7c57a131,0x207d60df
	.word	0x9e48d73f,0x9d0ce20e,0xbfb96195,0xc25769fa
	.word	0x0d9bb650,0x9bc6e2ed,0x466ae7fb,0xce1776ff
	.word	0x1fb2ab5c,0x3eda280c,0x8e4032a5,0xd70b9002
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
	.word	0xf1a76bf6,0xece91a84,0x2b81fa46,0xd65fe591
	.word	0x81cbc611,0x3b8fe684,0x32079ed2,0x6077e898
	.word	0x21aafe4a,0x85878ab9,0x7fc8ec92,0x0c44dfdb
	.word	0x7d26cf9a,0xc0218a0a,0xbcd91914,0x73d1cf1b
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
	.word	0xcdec98bf,0xb2a9bdb1,0x8a0c1b83,0xfa79098b
	.word	0x16a2c281,0x572b5f3b,0xd5b44aad,0x4cceb6d7
	.word	0xea723bf9,0x33cf57bd,0x8976d269,0xc4d1a47a
	.word	0xd1bde7df,0xff3efae3,0x73195890,0x488c91bd
	.word	0xd204359e,0xb3c21455,0xc480b010,0x65524576
	.word	0xe2e1c0af,0x28c278c5,0xa2bbc106,0x28e54694
	.word	0x9bc1daad,0x89afa2cb,0x0ade67a9,0x780727b9
	.word	0xafdeb3ca,0xb078065b,0x7794c1bb,0x865f45aa
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
	.word	0x102fc666,0xfaa8d11b,0x0446655f,0x7fc5a3e7
	.word	0xa5cf2103,0xb343654b,0xe8b3ea09,0xc5ca3d09
	.word	0x9144ce10,0xb848ab2c,0xb75eab1a,0xce9c57a1
	.word	0xcca43fa3,0xaab6f740,0xa140c614,0x6d8a9878
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
	.word	0x48091cea,0xca109af0,0x9dbb2584,0xa6aa2b98
	.word	0xf56547a4,0x1da6e0d1,0xd0c6e1a2,0x2f386904
	.word	0x93fd8d2f,0x9415e54b,0xb2e49c37,0x12dcc32e
	.word	0xb88dc368,0x9c01f038,0x3b222159,0x35678f16
	.word	0xb2ac0f03,0xa3665d0c,0x1f084efd,0x421b35f0
	.word	0x3b624de7,0x3db06c50,0xb325f89c,0x1b755dbb
	.word	0x58088bc5,0x5a532814,0xf9f0c2f2,0xd3e7afb6
	.word	0x15edbdb1,0x2a998a76,0x4d57a9bf,0x861959cd
	.word	0x0a252e32,0x4572df2b,0x23024b5e,0x96d51792
	.word	0x5ccb633c,0x428b214f,0xe5edaf16,0x9c7d2b83
	.word	0x2c3ce971,0xcbbb2978,0x2205bbbb,0xeccaa01e
	.word	0x380a799e,0x8b854157,0x229619e1,0x010eb500
	.word	0xe8e8e4de,0xd8c8f384,0x4affa466,0x428fe803
	.word	0x2863a958,0x5a4eef3b,0xa3cd91dd,0xa6a6bbea
	.word	0xf8cfb9f7,0x7d7abb13,0x7a692692,0xa0007b5e
	.word	0x2d2d6d06,0xb9f978ad,0x8f2620ba,0xd475781c
	.word	0x4991ee79,0x297d6fd5,0xadb0fc96,0x309dca03
	.word	0xa82d93ab,0x453040dc,0x9978b7dd,0xbb793d77
	.word	0x43c6132a,0xa4fa6f06,0x2c5055fc,0x95025bcc
	.word	0xf02edd7a,0x070495ea,0xe7335387,0x828163cd
	.word	0x2d62cd46,0x116f6781,0x929946fb,0x32620f4a
	.word	0x467d7f82,0x870e5a8e,0xd6e8220e,0x146829d4
	.word	0xd2d5d210,0xe18f2554,0x7d136aa0,0xd868790f
	.word	0xc0ff6059,0x1a66046f,0x0bbbc8a0,0xc6d5b922
	.word	0xca4c59fe,0x647d1783,0xef165407,0x4137f73f
	.word	0x461f57b4,0x85a55149,0x9eed7d54,0x6d6f079a
	.word	0x197e5479,0xc4779c71,0x8f50770e,0x950b6c73
	.word	0x723bcb99,0x11a62f29,0xf96dc93e,0x3dbe1860
	.word	0xf50813ce,0xa64cf276,0x812eda30,0x9dc0173e
	.word	0x2d6f9d64,0x22f812c7,0x0fe75726,0xea5974bc
	.word	0xaa53d950,0x52091c98,0x3ad1828d,0x19f57b47
	.word	0x6209b18e,0xa525d920,0x64bd9e1b,0xaa7f6ee9
share3_end:
