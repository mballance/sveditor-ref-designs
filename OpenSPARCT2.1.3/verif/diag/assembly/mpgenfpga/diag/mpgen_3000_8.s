/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: mpgen_3000_8.s
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
!	1 Thread, 3000 lines
!	mpgen   created on Dec 20, 2005 (16:35:03)
!	mpgen_3000_8.s created on Mar 27, 2009 (14:45:24)
!	RC file : random.rc
!	cmd = /import/n2-tools/release/tools/mpgen/mpgen,1.051220 -rc random.rc -o mpgen_3000_8 -p 1 -l 3000

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

p0_label_151:
!	Code Fragment 3
p0_fragment_19:
!	%l0 = 0000000000000000
	setx	0x3e898a7f9c0bbe9c,%g7,%l0 ! %l0 = 3e898a7f9c0bbe9c
!	%l1 = ffffffffa90947ff
	setx	0x20d56987de300c8a,%g7,%l1 ! %l1 = 20d56987de300c8a
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 3e898a7f9c0bbe9c
	setx	0x2f72c4600f7bcf53,%g7,%l0 ! %l0 = 2f72c4600f7bcf53
!	%l1 = 20d56987de300c8a
	setx	0x0f5d3d9fc7ebe8b0,%g7,%l1 ! %l1 = 0f5d3d9fc7ebe8b0
!	Mem[0000000030041410] = ffb0ffff, %l4 = 00000000000000ff
	lduwa	[%i1+%o5]0x81,%l4	! %l4 = 00000000ffb0ffff
!	Mem[0000000010081400] = ff0000ffffff91ab, %f26 = 00000000 0b419631
	ldda	[%i2+%g0]0x80,%f26	! %f26 = ff0000ff ffff91ab
!	Mem[0000000030101410] = 0000007c, %l7 = 00000000c46788cf
	ldswa	[%i4+%o5]0x81,%l7	! %l7 = 000000000000007c
!	Mem[0000000030081408] = 007c0000 ffffb58e, %l0 = 0f7bcf53, %l1 = c7ebe8b0
	ldda	[%i2+%o4]0x81,%l0	! %l0 = 00000000007c0000 00000000ffffb58e
!	Mem[0000000020800040] = ffff359e, %l6 = 000000004676dcc0
	ldsh	[%o1+0x040],%l6		! %l6 = ffffffffffffffff
!	Mem[00000000211c0000] = 410bc666, %l2 = 0000000000000000
	lduba	[%o2+0x000]%asi,%l2	! %l2 = 0000000000000041
!	Mem[0000000030101408] = 00008d78, %l0 = 00000000007c0000
	lduwa	[%i4+%o4]0x81,%l0	! %l0 = 0000000000008d78
!	Mem[00000000100c1408] = 007c0000 ffff00ff, %l6 = ffffffff, %l7 = 0000007c
	ldda	[%i3+%o4]0x80,%l6	! %l6 = 00000000007c0000 00000000ffff00ff
!	Starting 10 instruction Store Burst
!	%l0 = 0000000000008d78, Mem[0000000010141408] = 4c0000003f1d84d9
	stx	%l0,[%i5+%o4]		! Mem[0000000010141408] = 0000000000008d78

p0_label_152:
!	%f30 = bad76926 e10ece31, Mem[0000000030141400] = ffff0000 62dc7a58
	stda	%f30,[%i5+%g0]0x81	! Mem[0000000030141400] = bad76926 e10ece31
!	%f16 = ff4709a9 ff000000, %l5 = 00000000000000ff
!	Mem[0000000030001428] = 189119a20ffe00ee
	add	%i0,0x028,%g1
	stda	%f16,[%g1+%l5]ASI_PST32_SL ! Mem[0000000030001428] = 000000ffa90947ff
!	%l2 = 0000000000000041, Mem[000000001000140b] = 6f32787f, %asi = 80
	stba	%l2,[%i0+0x00b]%asi	! Mem[0000000010001408] = 6f327841
!	Mem[0000000030101400] = 0096410b, %l2 = 0000000000000041
	ldstuba	[%i4+%g0]0x81,%l2	! %l2 = 00000000000000ff
!	%l7 = 00000000ffff00ff, Mem[0000000020800001] = 003198bf
	stb	%l7,[%o1+0x001]		! Mem[0000000020800000] = 00ff98bf
!	Mem[00000000201c0000] = 31ff6bf6, %l6 = 00000000007c0000
	ldstub	[%o0+%g0],%l6		! %l6 = 00000031000000ff
!	%f18 = 00000000 4effafcb, %l0 = 0000000000008d78
!	Mem[0000000010101408] = 31ce0ee12669d7ba
	add	%i4,0x008,%g1
	stda	%f18,[%g1+%l0]ASI_PST32_PL ! Mem[0000000010101408] = 31ce0ee12669d7ba
!	%f8  = 00000034 0b419631, Mem[0000000010101400] = ffa63382 00000000
	stda	%f8 ,[%i4+%g0]0x80	! Mem[0000000010101400] = 00000034 0b419631
!	%l6 = 0000000000000031, Mem[0000000030101400] = 0b4196ff
	stwa	%l6,[%i4+%g0]0x89	! Mem[0000000030101400] = 00000031
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = a90947ff, %l2 = 0000000000000000
	lduha	[%i1+%g0]0x88,%l2	! %l2 = 00000000000047ff

p0_label_153:
	membar	#Sync			! Added by membar checker (24)
!	Mem[0000000010041400] = ff4709a9 ff000000 ffffb58e 7fffffff
!	Mem[0000000010041410] = 4c0009a9 00000000 037721ec 0a7a7b57
!	Mem[0000000010041420] = 0000ffff 00000000 0475329a c46788cf
!	Mem[0000000010041430] = 730d0000 cbaf7c59 bad76926 e10ece31
	ldda	[%i1]ASI_BLK_P,%f16	! Block Load from 0000000010041400
!	Mem[0000000030081410] = ffff00ff, %l7 = 00000000ffff00ff
	ldsba	[%i2+%o5]0x89,%l7	! %l7 = ffffffffffffffff
!	Mem[00000000100c1400] = 730d34ff, %l2 = 00000000000047ff
	ldsba	[%i3+%g0]0x88,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000010141400] = 00000000, %l7 = ffffffffffffffff
	lduha	[%i5+%g0]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000030181400] = 0000000000000000, %l7 = 0000000000000000
	ldxa	[%i6+%g0]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000010181408] = ffde1390, %l2 = ffffffffffffffff
	lduba	[%i6+%o4]0x80,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030041408] = ff4709a9, %l4 = 00000000ffb0ffff
	ldsba	[%i1+%o4]0x81,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010141424] = 0000005d, %f12 = 4effafcb
	ld	[%i5+0x024],%f12	! %f12 = 0000005d
!	Mem[0000000030001400] = 9b82abf0ce310000, %l4 = ffffffffffffffff
	ldxa	[%i0+%g0]0x89,%l4	! %l4 = 9b82abf0ce310000
!	Starting 10 instruction Store Burst
!	%l0 = 00008d78, %l1 = ffffb58e, Mem[0000000010101438] = 049f032f 97340d73
	std	%l0,[%i4+0x038]		! Mem[0000000010101438] = 00008d78 ffffb58e

p0_label_154:
!	%f12 = 0000005d 97340d73, Mem[0000000010141410] = 5d6c91ff 05000000
	stda	%f12,[%i5+%o5]0x88	! Mem[0000000010141410] = 0000005d 97340d73
!	Mem[00000000100c1402] = ff340d73, %l7 = 0000000000000000
	ldstub	[%i3+0x002],%l7		! %l7 = 0000000d000000ff
	membar	#Sync			! Added by membar checker (25)
!	%f8  = 00000034 0b419631, Mem[0000000010041400] = ff4709a9 ff000000
	stda	%f8 ,[%i1+%g0]0x80	! Mem[0000000010041400] = 00000034 0b419631
!	%l6 = 0000000000000031, %l5 = 00000000000000ff, %l4 = 9b82abf0ce310000
	xnor	%l6,%l5,%l4		! %l4 = ffffffffffffff31
!	Mem[0000000010041400] = 34000000, %l4 = ffffffffffffff31
	ldstuba	[%i1+%g0]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030081410] = ffff00ff, %l6 = 0000000000000031
	swapa	[%i2+%o5]0x89,%l6	! %l6 = 00000000ffff00ff
!	Mem[0000000010101408] = 31ce0ee1, %l7 = 000000000000000d
	ldstuba	[%i4+%o4]0x80,%l7	! %l7 = 00000031000000ff
!	Mem[0000000010081428] = b1ded3c800000000, %l4 = 0000000000000000, %l3 = 0000000000000082
	add	%i2,0x28,%g1
	casxa	[%g1]0x80,%l4,%l3	! %l3 = b1ded3c800000000
!	%l0 = 0000000000008d78, Mem[0000000020800040] = ffff359e, %asi = 80
	stha	%l0,[%o1+0x040]%asi	! Mem[0000000020800040] = 8d78359e
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = ffff6bf6, %l6 = 00000000ffff00ff
	lduha	[%o0+0x000]%asi,%l6	! %l6 = 000000000000ffff

p0_label_155:
!	Mem[0000000010041408] = ffffff7f 8eb5ffff, %l6 = 0000ffff, %l7 = 00000031
	ldda	[%i1+%o4]0x88,%l6	! %l6 = 000000008eb5ffff 00000000ffffff7f
!	%l5 = 00000000000000ff, %l4 = 0000000000000000, %l0 = 0000000000008d78
	or	%l5,%l4,%l0		! %l0 = 00000000000000ff
!	Mem[0000000010041410] = a909004c, %l6 = 000000008eb5ffff
	lduba	[%i1+%o5]0x88,%l6	! %l6 = 000000000000004c
!	Mem[0000000020800000] = 00ff98bf, %l6 = 000000000000004c
	ldsba	[%o1+0x000]%asi,%l6	! %l6 = 0000000000000000
!	Mem[0000000010041404] = 0b419631, %l1 = 00000000ffffb58e
	lduh	[%i1+0x004],%l1		! %l1 = 0000000000000b41
!	Mem[00000000100c1410] = 000000ff, %l2 = 00000000000000ff
	lduha	[%i3+%o5]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010101410] = 000000ff, %l3 = b1ded3c800000000
	lduha	[%i4+%o5]0x88,%l3	! %l3 = 00000000000000ff
!	%l4 = 0000000000000000, %l3 = 00000000000000ff, %l6 = 0000000000000000
	sdivx	%l4,%l3,%l6		! %l6 = 0000000000000000
!	Mem[0000000010141424] = 0000005d, %l3 = 00000000000000ff
	lduwa	[%i5+0x024]%asi,%l3	! %l3 = 000000000000005d
!	Starting 10 instruction Store Burst
!	Mem[0000000010141410] = 730d3497 5d000000, %l6 = 00000000, %l7 = ffffff7f
	ldd	[%i5+%o5],%l6		! %l6 = 00000000730d3497 000000005d000000

p0_label_156:
!	Mem[0000000010181410] = 00008600, %l1 = 0000000000000b41
	swapa	[%i6+%o5]0x88,%l1	! %l1 = 0000000000008600
!	Mem[00000000100c1408] = 007c0000, %l4 = 0000000000000000
	ldstuba	[%i3+%o4]0x80,%l4	! %l4 = 00000000000000ff
!	%l4 = 0000000000000000, imm = 0000000000000ed0, %l1 = 0000000000008600
	sub	%l4,0xed0,%l1		! %l1 = fffffffffffff130
!	Mem[0000000010081410] = 2dc52dc5, %l4 = 0000000000000000
	ldstuba	[%i2+%o5]0x80,%l4	! %l4 = 0000002d000000ff
!	Mem[00000000100c142d] = ffbd5252, %l0 = 00000000000000ff
	ldstub	[%i3+0x02d],%l0		! %l0 = 000000bd000000ff
!	%l4 = 0000002d, %l5 = 000000ff, Mem[00000000300c1400] = 4effafcb 97340d73
	stda	%l4,[%i3+%g0]0x81	! Mem[00000000300c1400] = 0000002d 000000ff
!	%f12 = 0000005d, Mem[0000000030181408] = c46788cf
	sta	%f12,[%i6+%o4]0x89	! Mem[0000000030181408] = 0000005d
!	Mem[000000001004143d] = e10ece31, %l4 = 000000000000002d
	ldstub	[%i1+0x03d],%l4		! %l4 = 0000000e000000ff
!	%l6 = 00000000730d3497, Mem[0000000010181408] = c78dcd1f9013deff
	stxa	%l6,[%i6+%o4]0x88	! Mem[0000000010181408] = 00000000730d3497
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = 0b410000, %l7 = 000000005d000000
	lduba	[%i2+%g0]0x89,%l7	! %l7 = 0000000000000000

p0_label_157:
!	Code Fragment 3
p0_fragment_20:
!	%l0 = 00000000000000bd
	setx	0x2e370800123d8f68,%g7,%l0 ! %l0 = 2e370800123d8f68
!	%l1 = fffffffffffff130
	setx	0xdeeafd7832a650ef,%g7,%l1 ! %l1 = deeafd7832a650ef
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 2e370800123d8f68
	setx	0x64f90a201193aa90,%g7,%l0 ! %l0 = 64f90a201193aa90
!	%l1 = deeafd7832a650ef
	setx	0xd31efb6fe817d21c,%g7,%l1 ! %l1 = d31efb6fe817d21c
!	Mem[0000000030181410] = 8eb5ffff000021ec, %f26 = 0475329a c46788cf
	ldda	[%i6+%o5]0x81,%f26	! %f26 = 8eb5ffff 000021ec
!	Mem[00000000211c0000] = 410bc666, %l2 = 00000000000000ff
	lduha	[%o2+0x000]%asi,%l2	! %l2 = 000000000000410b
!	Mem[0000000010001430] = 000000000b419631, %f10 = ff00ffff 00007c00
	ldd	[%i0+0x030],%f10	! %f10 = 00000000 0b419631
!	Mem[0000000030141408] = 0000004c, %l3 = 000000000000005d
	lduha	[%i5+%o4]0x89,%l3	! %l3 = 000000000000004c
!	Mem[00000000100c1418] = e59a33ae, %l0 = 64f90a201193aa90
	lduha	[%i3+0x01a]%asi,%l0	! %l0 = 00000000000033ae
!	%l6 = 00000000730d3497, imm = fffffffffffff630, %l6 = 00000000730d3497
	xnor	%l6,-0x9d0,%l6		! %l6 = 00000000730d3d58
!	Mem[0000000010181400] = 730d3497, %l1 = d31efb6fe817d21c
	ldsha	[%i6+0x002]%asi,%l1	! %l1 = 0000000000003497
!	Mem[0000000010101410] = 000000ff, %l0 = 00000000000033ae
	ldsba	[%i4+%o5]0x88,%l0	! %l0 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	Mem[0000000010001404] = 000000ff, %l5 = 000000ff, %l2 = 0000410b
	add	%i0,0x04,%g1
	casa	[%g1]0x80,%l5,%l2	! %l2 = 00000000000000ff

p0_label_158:
!	Code Fragment 3
p0_fragment_21:
!	%l0 = ffffffffffffffff
	setx	0x268749d04c0dbb60,%g7,%l0 ! %l0 = 268749d04c0dbb60
!	%l1 = 0000000000003497
	setx	0x38eda090485ef822,%g7,%l1 ! %l1 = 38eda090485ef822
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 268749d04c0dbb60
	setx	0x607b203fdd95ee52,%g7,%l0 ! %l0 = 607b203fdd95ee52
!	%l1 = 38eda090485ef822
	setx	0x9815f0d02235cfc8,%g7,%l1 ! %l1 = 9815f0d02235cfc8
!	%l1 = 9815f0d02235cfc8, imm = fffffffffffffc7f, %l1 = 9815f0d02235cfc8
	addc	%l1,-0x381,%l1		! %l1 = 9815f0d02235cc47
!	Mem[0000000010181408] = 97340d7300000000, %l4 = 000000000000000e, %l3 = 000000000000004c
	add	%i6,0x08,%g1
	casxa	[%g1]0x80,%l4,%l3	! %l3 = 97340d7300000000
!	Mem[0000000010181410] = 410b0000, %l4 = 000000000000000e, %asi = 80
	swapa	[%i6+0x010]%asi,%l4	! %l4 = 00000000410b0000
!	Mem[000000001018142c] = 92e6fbc0, %l3 = 00000000, %l2 = 000000ff
	add	%i6,0x2c,%g1
	casa	[%g1]0x80,%l3,%l2	! %l2 = 0000000092e6fbc0
!	%l7 = 0000000000000000, Mem[0000000010041410] = 4c0009a900000000
	stxa	%l7,[%i1+%o5]0x80	! Mem[0000000010041410] = 0000000000000000
!	%l0 = 607b203fdd95ee52, Mem[0000000030041400] = 00008eff
	stwa	%l0,[%i1+%g0]0x89	! Mem[0000000030041400] = dd95ee52
!	Mem[000000001010143c] = ffffb58e, %l1 = 9815f0d02235cc47
	swap	[%i4+0x03c],%l1		! %l1 = 00000000ffffb58e
!	Mem[0000000010181410] = 0e000000, %l4 = 00000000410b0000
	swapa	[%i6+%o5]0x88,%l4	! %l4 = 000000000e000000
!	Starting 10 instruction Load Burst
!	%l0 = 607b203fdd95ee52, Mem[0000000010101408] = e10eceff
	stwa	%l0,[%i4+%o4]0x88	! Mem[0000000010101408] = dd95ee52

p0_label_159:
!	Mem[0000000010001408] = 6f327841 0000005d, %l0 = dd95ee52, %l1 = ffffb58e
	ldda	[%i0+%o4]0x80,%l0	! %l0 = 000000006f327841 000000000000005d
!	%l4 = 000000000e000000, immd = fffffffffffff9dc, %l0 = 000000006f327841
	sdivx	%l4,-0x624,%l0		! %l0 = fffffffffffdb859
!	Mem[00000000100c1408] = ff7c0000, %l1 = 000000000000005d
	ldsha	[%i3+0x008]%asi,%l1	! %l1 = ffffffffffffff7c
!	Mem[0000000010001400] = 0b4100000000ffff, %f2  = 4effafcb 97340d73
	ldda	[%i0+%g0]0x88,%f2 	! %f2  = 0b410000 0000ffff
!	Mem[0000000030181408] = 0000005d, %l4 = 000000000e000000
	ldsba	[%i6+%o4]0x89,%l4	! %l4 = 000000000000005d
!	Mem[0000000010041408] = ffffb58e, %l1 = ffffffffffffff7c
	ldswa	[%i1+%o4]0x80,%l1	! %l1 = ffffffffffffb58e
!	Mem[0000000020800000] = 00ff98bf, %l0 = fffffffffffdb859
	lduh	[%o1+%g0],%l0		! %l0 = 00000000000000ff
!	Mem[0000000010081410] = b9ffffff c52dc5ff, %l0 = 000000ff, %l1 = ffffb58e
	ldda	[%i2+%o5]0x88,%l0	! %l0 = 00000000c52dc5ff 00000000b9ffffff
!	Mem[0000000030181408] = 5d000000, %l4 = 000000000000005d
	lduba	[%i6+%o4]0x81,%l4	! %l4 = 000000000000005d
!	Starting 10 instruction Store Burst
!	%l1 = 00000000b9ffffff, Mem[00000000201c0000] = ffff6bf6
	sth	%l1,[%o0+%g0]		! Mem[00000000201c0000] = ffff6bf6

p0_label_160:
!	Mem[00000000201c0001] = ffff6bf6, %l5 = 00000000000000ff
	ldstub	[%o0+0x001],%l5		! %l5 = 000000ff000000ff
!	%l6 = 00000000730d3d58, Mem[00000000100c1408] = ff7c0000
	stba	%l6,[%i3+%o4]0x80	! Mem[00000000100c1408] = 587c0000
!	%l4 = 000000000000005d, Mem[0000000030041408] = a90947ff
	stha	%l4,[%i1+%o4]0x89	! Mem[0000000030041408] = a909005d
!	%l0 = 00000000c52dc5ff, Mem[0000000030041400] = dd95ee52
	stha	%l0,[%i1+%g0]0x89	! Mem[0000000030041400] = dd95c5ff
!	%l2 = 0000000092e6fbc0, %l5 = 00000000000000ff, %l6 = 00000000730d3d58
	sub	%l2,%l5,%l6		! %l6 = 0000000092e6fac1
!	%f14 = ffffb58e 7fffffff, %l2 = 0000000092e6fbc0
!	Mem[0000000030141408] = 4c0000005da9b785
	add	%i5,0x008,%g1
	stda	%f14,[%g1+%l2]ASI_PST8_SL ! Mem[0000000030141408] = 4c0000005da9ffff
!	Mem[00000000100c1408] = 587c0000, %l2 = 0000000092e6fbc0
	ldstuba	[%i3+%o4]0x80,%l2	! %l2 = 00000058000000ff
!	%f30 = bad76926, Mem[0000000010041410] = 00000000
	sta	%f30,[%i1+%o5]0x88	! Mem[0000000010041410] = bad76926
!	Mem[0000000010181410] = 00000b41, %l3 = 97340d7300000000
	swapa	[%i6+%o5]0x80,%l3	! %l3 = 0000000000000b41
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = 000000ff, %l6 = 0000000092e6fac1
	lduwa	[%i3+%o5]0x88,%l6	! %l6 = 00000000000000ff

p0_label_161:
!	Mem[0000000030081408] = 007c0000, %l7 = 0000000000000000
	ldsha	[%i2+%o4]0x81,%l7	! %l7 = 000000000000007c
!	Code Fragment 3
p0_fragment_22:
!	%l0 = 00000000c52dc5ff
	setx	0x3f2c35e0787fc434,%g7,%l0 ! %l0 = 3f2c35e0787fc434
!	%l1 = 00000000b9ffffff
	setx	0xa729556f86b120ba,%g7,%l1 ! %l1 = a729556f86b120ba
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 3f2c35e0787fc434
	setx	0x534525a7dc543a7b,%g7,%l0 ! %l0 = 534525a7dc543a7b
!	%l1 = a729556f86b120ba
	setx	0xf8f445f7c6e4852a,%g7,%l1 ! %l1 = f8f445f7c6e4852a
!	Mem[0000000030141410] = 0086fe14, %l1 = f8f445f7c6e4852a
	lduba	[%i5+%o5]0x81,%l1	! %l1 = 0000000000000000
!	Mem[00000000100c1410] = 000000ff, %l4 = 000000000000005d
	lduba	[%i3+%o5]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010101400] = 00000034, %l0 = 534525a7dc543a7b
	lduwa	[%i4+%g0]0x80,%l0	! %l0 = 0000000000000034
!	Mem[0000000010101408] = 52ee95dd2669d7ba, %f14 = ffffb58e 7fffffff
	ldda	[%i4+%o4]0x80,%f14	! %f14 = 52ee95dd 2669d7ba
!	Mem[0000000030101400] = 0000000000000031, %l4 = 00000000000000ff
	ldxa	[%i4+%g0]0x89,%l4	! %l4 = 0000000000000031
!	Mem[00000000211c0000] = 410bc666, %l2 = 0000000000000058
	ldsh	[%o2+%g0],%l2		! %l2 = 000000000000410b
!	Mem[0000000010101408] = 52ee95dd, %l0 = 0000000000000034
	lduha	[%i4+%o4]0x80,%l0	! %l0 = 00000000000052ee
!	Starting 10 instruction Store Burst
!	%l7 = 000000000000007c, Mem[0000000010041410] = 00000000bad76926
	stxa	%l7,[%i1+%o5]0x88	! Mem[0000000010041410] = 000000000000007c

p0_label_162:
!	Mem[0000000010141435] = 000000ff, %l4 = 0000000000000031
	ldstub	[%i5+0x035],%l4		! %l4 = 00000000000000ff
!	%f16 = ff4709a9 ff000000 ffffb58e 7fffffff
!	%f20 = 4c0009a9 00000000 037721ec 0a7a7b57
!	%f24 = 0000ffff 00000000 8eb5ffff 000021ec
!	%f28 = 730d0000 cbaf7c59 bad76926 e10ece31
	stda	%f16,[%i5]ASI_BLK_AIUP	! Block Store to 0000000010141400
!	%l4 = 0000000000000000, %l7 = 000000000000007c, %l7 = 000000000000007c
	sub	%l4,%l7,%l7		! %l7 = ffffffffffffff84
!	%l6 = 00000000000000ff, Mem[00000000100c1400] = ff34ff73000000ff
	stxa	%l6,[%i3+%g0]0x80	! Mem[00000000100c1400] = 00000000000000ff
!	%l2 = 000000000000410b, Mem[0000000030081400] = 0b410000
	stwa	%l2,[%i2+%g0]0x89	! Mem[0000000030081400] = 0000410b
!	%f7  = 0000ffff, %f1  = 00002dc5
	fcmpes	%fcc0,%f7 ,%f1 		! %fcc0 = 2
!	Mem[0000000030101408] = 00008d78, %l1 = 0000000000000000
	ldstuba	[%i4+%o4]0x81,%l1	! %l1 = 00000000000000ff
!	%l5 = 00000000000000ff, Mem[0000000010081410] = c52dc5ff
	stba	%l5,[%i2+%o5]0x88	! Mem[0000000010081410] = c52dc5ff
!	%l1 = 0000000000000000, Mem[0000000010101400] = 00000034
	stha	%l1,[%i4+%g0]0x80	! Mem[0000000010101400] = 00000034
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = ffffa95d0000004c, %l0 = 00000000000052ee
	ldxa	[%i5+%o4]0x89,%l0	! %l0 = ffffa95d0000004c

p0_label_163:
!	Mem[0000000030001400] = 9b82abf0ce310000, %l4 = 0000000000000000
	ldxa	[%i0+%g0]0x89,%l4	! %l4 = 9b82abf0ce310000
!	Mem[0000000030101410] = 7c000000, %l6 = 00000000000000ff
	ldswa	[%i4+%o5]0x89,%l6	! %l6 = 000000007c000000
!	%l7 = ffffffffffffff84, %l5 = 00000000000000ff, %l3 = 0000000000000b41
	udivx	%l7,%l5,%l3		! %l3 = 0101010101010100
!	Mem[00000000100c1410] = 000000ff, %l7 = ffffffffffffff84
	lduha	[%i3+%o5]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010101428] = 43a239ff159a00ff, %l7 = 00000000000000ff, %l1 = 0000000000000000
	add	%i4,0x28,%g1
	casxa	[%g1]0x80,%l7,%l1	! %l1 = 43a239ff159a00ff
!	Mem[0000000010001420] = 049f032f, %l0 = ffffa95d0000004c
	lduw	[%i0+0x020],%l0		! %l0 = 00000000049f032f
	membar	#Sync			! Added by membar checker (26)
!	Mem[0000000010141408] = ffffb58e, %l7 = 00000000000000ff
	ldsba	[%i5+%o4]0x80,%l7	! %l7 = ffffffffffffffff
!	Mem[00000000300c1410] = b9892fcd, %f31 = e10ece31
	lda	[%i3+%o5]0x81,%f31	! %f31 = b9892fcd
!	Mem[0000000010081410] = c52dc5ff, %l3 = 0101010101010100
	lduha	[%i2+%o5]0x88,%l3	! %l3 = 000000000000c5ff
!	Starting 10 instruction Store Burst
!	%f16 = ff4709a9, Mem[00000000300c1410] = cd2f89b9
	sta	%f16,[%i3+%o5]0x89	! Mem[00000000300c1410] = ff4709a9

p0_label_164:
!	Mem[00000000100c1416] = 00008600, %l7 = ffffffffffffffff
	ldstuba	[%i3+0x016]%asi,%l7	! %l7 = 00000086000000ff
!	%l6 = 000000007c000000, Mem[0000000030001400] = ce310000
	stha	%l6,[%i0+%g0]0x89	! Mem[0000000030001400] = ce310000
!	%f0  = 00860000 00002dc5 0b410000 0000ffff
!	%f4  = 2dc52dc5 00000000 587adc62 0000ffff
!	%f8  = 00000034 0b419631 00000000 0b419631
!	%f12 = 0000005d 97340d73 52ee95dd 2669d7ba
	stda	%f0,[%i2]ASI_BLK_AIUSL	! Block Store to 0000000030081400
!	%f28 = 730d0000 cbaf7c59, %l3 = 000000000000c5ff
!	Mem[00000000300c1420] = c78dcd1f82dea6cf
	add	%i3,0x020,%g1
	stda	%f28,[%g1+%l3]ASI_PST8_S ! Mem[00000000300c1420] = 730d0000cbaf7c59
!	%l6 = 000000007c000000, Mem[0000000030181400] = 0000000000000000
	stxa	%l6,[%i6+%g0]0x81	! Mem[0000000030181400] = 000000007c000000
!	%l1 = 43a239ff159a00ff, Mem[0000000010181424] = 0a7a7b57, %asi = 80
	stwa	%l1,[%i6+0x024]%asi	! Mem[0000000010181424] = 159a00ff
!	%f22 = 037721ec, Mem[0000000030101400] = 31000000
	sta	%f22,[%i4+%g0]0x81	! Mem[0000000030101400] = 037721ec
!	Mem[000000001018143a] = 00000005, %l3 = 000000000000c5ff
	ldstub	[%i6+0x03a],%l3		! %l3 = 00000000000000ff
!	Mem[0000000010101400] = 00000034, %l7 = 0000000000000086
	ldstuba	[%i4+%g0]0x80,%l7	! %l7 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = 0000002d, %l2 = 000000000000410b
	lduwa	[%i3+%g0]0x81,%l2	! %l2 = 000000000000002d

p0_label_165:
!	Mem[0000000030181408] = 0000005d, %l7 = 0000000000000000
	ldswa	[%i6+%o4]0x89,%l7	! %l7 = 000000000000005d
!	Mem[0000000030001400] = 000031cef0ab829b, %l1 = 43a239ff159a00ff
	ldxa	[%i0+%g0]0x81,%l1	! %l1 = 000031cef0ab829b
!	Mem[0000000010141428] = 8eb5ffff000021ec, %f30 = bad76926 b9892fcd
	ldda	[%i5+0x028]%asi,%f30	! %f30 = 8eb5ffff 000021ec
!	%l4 = 9b82abf0ce310000, Mem[0000000010081400] = ff0000ff
	stha	%l4,[%i2+%g0]0x88	! Mem[0000000010081400] = ff000000
!	Mem[0000000010001408] = 4178326f, %f19 = 7fffffff
	lda	[%i0+%o4]0x88,%f19	! %f19 = 4178326f
!	Mem[00000000100c1410] = ff000000, %l6 = 000000007c000000
	ldsba	[%i3+%o5]0x80,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010141400] = ff4709a9ff000000, %l0 = 00000000049f032f
	ldxa	[%i5+0x000]%asi,%l0	! %l0 = ff4709a9ff000000
!	Mem[0000000010101400] = ff000034, %l6 = ffffffffffffffff
	lduha	[%i4+%g0]0x80,%l6	! %l6 = 000000000000ff00
!	Mem[0000000010141428] = 8eb5ffff000021ec, %l4 = 9b82abf0ce310000
	ldx	[%i5+0x028],%l4		! %l4 = 8eb5ffff000021ec
!	Starting 10 instruction Store Burst
!	Mem[0000000010101434] = 75cdffd2, %l1 = f0ab829b, %l1 = f0ab829b
	add	%i4,0x34,%g1
	casa	[%g1]0x80,%l1,%l1	! %l1 = 0000000075cdffd2

p0_label_166:
!	%l5 = 00000000000000ff, Mem[0000000020800000] = 00ff98bf, %asi = 80
	stha	%l5,[%o1+0x000]%asi	! Mem[0000000020800000] = 00ff98bf
!	%l6 = 000000000000ff00, Mem[0000000030181400] = 00000000
	stba	%l6,[%i6+%g0]0x81	! Mem[0000000030181400] = 00000000
!	%l5 = 00000000000000ff, Mem[0000000030001410] = e0f1ffff
	stwa	%l5,[%i0+%o5]0x89	! Mem[0000000030001410] = 000000ff
!	%l2 = 000000000000002d, Mem[0000000010101400] = 3196410b340000ff
	stxa	%l2,[%i4+%g0]0x88	! Mem[0000000010101400] = 000000000000002d
!	Mem[0000000010101410] = ff000000, %l1 = 0000000075cdffd2
	ldstuba	[%i4+%o5]0x80,%l1	! %l1 = 000000ff000000ff
!	%f18 = ffffb58e, Mem[0000000030001410] = ff000000
	sta	%f18,[%i0+%o5]0x81	! Mem[0000000030001410] = ffffb58e
!	Mem[00000000211c0000] = 410bc666, %l3 = 0000000000000000
	ldstub	[%o2+%g0],%l3		! %l3 = 00000041000000ff
!	%l4 = 8eb5ffff000021ec, Mem[0000000030001400] = ce310000
	stha	%l4,[%i0+%g0]0x89	! Mem[0000000030001400] = ce3121ec
!	%l5 = 00000000000000ff, Mem[0000000010081408] = e3000000
	stha	%l5,[%i2+%o4]0x80	! Mem[0000000010081408] = 00ff0000
!	Starting 10 instruction Load Burst
!	Mem[00000000218001c0] = 000813ce, %l4 = 8eb5ffff000021ec
	ldub	[%o3+0x1c1],%l4		! %l4 = 0000000000000008

p0_label_167:
	membar	#Sync			! Added by membar checker (27)
!	Mem[0000000030081400] = c52d0000, %f29 = cbaf7c59
	lda	[%i2+%g0]0x81,%f29	! %f29 = c52d0000
!	Mem[0000000030041400] = ffc595dd 159ad392, %l2 = 0000002d, %l3 = 00000041
	ldda	[%i1+%g0]0x81,%l2	! %l2 = 00000000ffc595dd 00000000159ad392
!	Mem[00000000211c0000] = ff0bc666, %l4 = 0000000000000008
	ldsh	[%o2+%g0],%l4		! %l4 = ffffffffffffff0b
!	Mem[0000000010101430] = b0a7bc52, %l2 = 00000000ffc595dd
	ldsh	[%i4+0x032],%l2		! %l2 = ffffffffffffbc52
!	Mem[0000000010141410] = 00000000 a909004c, %l6 = 0000ff00, %l7 = 0000005d
	ldda	[%i5+%o5]0x88,%l6	! %l6 = 00000000a909004c 0000000000000000
!	Mem[0000000030101408] = 788d00ff, %l2 = ffffffffffffbc52
	lduba	[%i4+%o4]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030041410] = ffffb0ff, %l7 = 0000000000000000
	lduba	[%i1+%o5]0x89,%l7	! %l7 = 00000000000000ff
!	%l0 = ff4709a9ff000000, imm = 000000000000016e, %l4 = ffffffffffffff0b
	andn	%l0,0x16e,%l4		! %l4 = ff4709a9ff000000
!	Mem[0000000030041408] = 5d0009a9, %l6 = 00000000a909004c
	ldsha	[%i1+%o4]0x81,%l6	! %l6 = 0000000000005d00
!	Starting 10 instruction Store Burst
!	Mem[0000000030141400] = 2669d7ba, %l3 = 00000000159ad392
	swapa	[%i5+%g0]0x89,%l3	! %l3 = 000000002669d7ba

p0_label_168:
!	%l4 = ff000000, %l5 = 000000ff, Mem[0000000010181438] = 0000ff05 6a315fc1
	stda	%l4,[%i6+0x038]%asi	! Mem[0000000010181438] = ff000000 000000ff
!	Code Fragment 3
p0_fragment_23:
!	%l0 = ff4709a9ff000000
	setx	0x44e641679d80cdc7,%g7,%l0 ! %l0 = 44e641679d80cdc7
!	%l1 = 00000000000000ff
	setx	0xd016be6fb2a16dba,%g7,%l1 ! %l1 = d016be6fb2a16dba
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 44e641679d80cdc7
	setx	0x869d89f7ae2b5b8b,%g7,%l0 ! %l0 = 869d89f7ae2b5b8b
!	%l1 = d016be6fb2a16dba
	setx	0xdec476afc3c43cf9,%g7,%l1 ! %l1 = dec476afc3c43cf9
!	%l1 = dec476afc3c43cf9, Mem[0000000030001408] = ff000000
	stha	%l1,[%i0+%o4]0x81	! Mem[0000000030001408] = 3cf90000
!	%l0 = 869d89f7ae2b5b8b, Mem[00000000100c1400] = 00000000
	stba	%l0,[%i3+%g0]0x80	! Mem[00000000100c1400] = 8b000000
!	%l7 = 00000000000000ff, Mem[0000000010041410] = 0000007c
	stha	%l7,[%i1+%o5]0x88	! Mem[0000000010041410] = 000000ff
!	Mem[0000000010181408] = 730d3497, %l7 = 00000000000000ff
	ldstuba	[%i6+%o4]0x88,%l7	! %l7 = 00000097000000ff
!	%l0 = 869d89f7ae2b5b8b, Mem[0000000030141410] = 0500000014fe8600
	stxa	%l0,[%i5+%o5]0x89	! Mem[0000000030141410] = 869d89f7ae2b5b8b
!	Mem[000000001000140b] = 6f327841, %l1 = dec476afc3c43cf9
	ldstuba	[%i0+0x00b]%asi,%l1	! %l1 = 00000041000000ff
!	%l6 = 00005d00, %l7 = 00000097, Mem[00000000300c1408] = 00000000 00000000
	stda	%l6,[%i3+%o4]0x89	! Mem[00000000300c1408] = 00005d00 00000097
!	Starting 10 instruction Load Burst
!	%f14 = 52ee95dd, %f18 = ffffb58e, %f17 = ff000000
	fsubs	%f14,%f18,%f17		! %f17 = ffffb58e

p0_label_169:
!	Mem[00000000300c1410] = a90947ff, %l1 = 0000000000000041
	ldswa	[%i3+%o5]0x81,%l1	! %l1 = ffffffffa90947ff
!	Mem[0000000020800040] = 8d78359e, %l0 = 869d89f7ae2b5b8b
	ldsba	[%o1+0x041]%asi,%l0	! %l0 = 0000000000000078
!	Mem[0000000030101410] = 0000007c, %l5 = 00000000000000ff
	lduha	[%i4+%o5]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000030101410] = 0000007c, %l2 = 00000000000000ff
	lduba	[%i4+%o5]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000010181408] = ff340d7300000000, %l4 = ff4709a9ff000000
	ldxa	[%i6+%o4]0x80,%l4	! %l4 = ff340d7300000000
!	Mem[0000000021800140] = 2dffcd46, %l4 = ff340d7300000000
	lduba	[%o3+0x140]%asi,%l4	! %l4 = 000000000000002d
!	Mem[0000000010181400] = 97340d73, %l6 = 0000000000005d00
	lduba	[%i6+%g0]0x88,%l6	! %l6 = 0000000000000073
!	Mem[0000000030041400] = dd95c5ff, %l0 = 0000000000000078
	lduha	[%i1+%g0]0x89,%l0	! %l0 = 000000000000c5ff
!	Mem[0000000010181420] = 037721ec, %l1 = ffffffffa90947ff
	lduwa	[%i6+0x020]%asi,%l1	! %l1 = 00000000037721ec
!	Starting 10 instruction Store Burst
!	%l2 = 00000000, %l3 = 2669d7ba, Mem[00000000100c1418] = e59a33ae e385cbba
	stda	%l2,[%i3+0x018]%asi	! Mem[00000000100c1418] = 00000000 2669d7ba

p0_label_170:
!	Mem[0000000010181414] = 00002dc5, %l7 = 00000097, %l7 = 00000097
	add	%i6,0x14,%g1
	casa	[%g1]0x80,%l7,%l7	! %l7 = 0000000000002dc5
!	%f8  = 00000034 0b419631, Mem[0000000010081418] = bacb85e3 ae339ae5
	stda	%f8 ,[%i2+0x018]%asi	! Mem[0000000010081418] = 00000034 0b419631
!	%l2 = 00000000, %l3 = 2669d7ba, Mem[0000000010141400] = ff4709a9 ff000000
	stda	%l2,[%i5+%g0]0x80	! Mem[0000000010141400] = 00000000 2669d7ba
!	Mem[0000000030041408] = a909005d, %l1 = 00000000037721ec
	swapa	[%i1+%o4]0x89,%l1	! %l1 = 00000000a909005d
!	%l4 = 0000002d, %l5 = 00000000, Mem[0000000010041420] = 0000ffff 00000000
	stda	%l4,[%i1+0x020]%asi	! Mem[0000000010041420] = 0000002d 00000000
!	Mem[0000000010001408] = 6f3278ff, %l5 = 0000000000000000
	swap	[%i0+%o4],%l5		! %l5 = 000000006f3278ff
!	%l0 = 000000000000c5ff, Mem[0000000021800140] = 2dffcd46, %asi = 80
	stba	%l0,[%o3+0x140]%asi	! Mem[0000000021800140] = ffffcd46
!	Mem[0000000010141415] = 00000000, %l3 = 000000002669d7ba
	ldstub	[%i5+0x015],%l3		! %l3 = 00000000000000ff
!	Mem[0000000010181428] = bb47b886, %l7 = 00002dc5, %l1 = a909005d
	add	%i6,0x28,%g1
	casa	[%g1]0x80,%l7,%l1	! %l1 = 00000000bb47b886
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = 000000ff, %l0 = 000000000000c5ff
	lduba	[%i4+%o5]0x88,%l0	! %l0 = 00000000000000ff

p0_label_171:
!	Mem[0000000030141410] = 8b5b2bae, %l7 = 0000000000002dc5
	lduha	[%i5+%o5]0x81,%l7	! %l7 = 0000000000008b5b
!	Mem[0000000010141428] = 8eb5ffff000021ec, %l4 = 000000000000002d
	ldxa	[%i5+0x028]%asi,%l4	! %l4 = 8eb5ffff000021ec
!	Mem[0000000010001408] = 00000000, %l0 = 00000000000000ff
	lduwa	[%i0+%o4]0x88,%l0	! %l0 = 0000000000000000
!	Mem[00000000300c1400] = 0000002d, %l5 = 000000006f3278ff
	lduwa	[%i3+%g0]0x81,%l5	! %l5 = 000000000000002d
!	Mem[00000000100c1410] = ff000000, %l2 = 0000000000000000
	ldswa	[%i3+%o5]0x80,%l2	! %l2 = ffffffffff000000
!	Mem[0000000030141408] = 0000004c, %l6 = 0000000000000073
	lduba	[%i5+%o4]0x89,%l6	! %l6 = 000000000000004c
!	Mem[0000000010101400] = 2d000000, %l2 = ffffffffff000000
	lduha	[%i4+%g0]0x80,%l2	! %l2 = 0000000000002d00
!	Mem[0000000010001408] = 5d00000000000000, %l4 = 8eb5ffff000021ec
	ldxa	[%i0+%o4]0x88,%l4	! %l4 = 5d00000000000000
!	Mem[0000000010041400] = ff000034, %l3 = 0000000000000000
	ldsha	[%i1+%g0]0x80,%l3	! %l3 = ffffffffffffff00
!	Starting 10 instruction Store Burst
!	%l0 = 0000000000000000, Mem[0000000010141400] = 000000002669d7ba, %asi = 80
	stxa	%l0,[%i5+0x000]%asi	! Mem[0000000010141400] = 0000000000000000

p0_label_172:
!	Mem[0000000030001408] = 3cf90000, %l6 = 000000000000004c
	swapa	[%i0+%o4]0x81,%l6	! %l6 = 000000003cf90000
!	%f16 = ff4709a9 ffffb58e ffffb58e 4178326f
!	%f20 = 4c0009a9 00000000 037721ec 0a7a7b57
!	%f24 = 0000ffff 00000000 8eb5ffff 000021ec
!	%f28 = 730d0000 c52d0000 8eb5ffff 000021ec
	stda	%f16,[%i4]ASI_BLK_AIUPL	! Block Store to 0000000010101400
!	%l5 = 000000000000002d, Mem[0000000030001400] = 9b82abf0ce3121ec
	stxa	%l5,[%i0+%g0]0x89	! Mem[0000000030001400] = 000000000000002d
!	%l0 = 0000000000000000, Mem[000000001014142a] = 8eb5ffff, %asi = 80
	stha	%l0,[%i5+0x02a]%asi	! Mem[0000000010141428] = 8eb50000
!	%l5 = 000000000000002d, Mem[0000000010001408] = 00000000
	stba	%l5,[%i0+%o4]0x80	! Mem[0000000010001408] = 2d000000
!	%l0 = 0000000000000000, Mem[0000000010141400] = 00000000
	stba	%l0,[%i5+%g0]0x88	! Mem[0000000010141400] = 00000000
!	Mem[0000000010041418] = 037721ec, %l4 = 5d00000000000000, %asi = 80
	swapa	[%i1+0x018]%asi,%l4	! %l4 = 00000000037721ec
!	%l4 = 00000000037721ec, Mem[0000000010001410] = 82dea6ff
	stha	%l4,[%i0+%o5]0x88	! Mem[0000000010001410] = 82de21ec
!	Mem[0000000010141410] = a909004c, %l4 = 00000000037721ec
	swapa	[%i5+%o5]0x88,%l4	! %l4 = 00000000a909004c
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = 00000000, %l5 = 000000000000002d
	ldsba	[%i5+0x000]%asi,%l5	! %l5 = 0000000000000000

p0_label_173:
!	Mem[00000000300c1410] = ff4709a9, %l2 = 0000000000002d00
	lduha	[%i3+%o5]0x89,%l2	! %l2 = 00000000000009a9
!	Mem[0000000010041410] = 00000000000000ff, %f12 = 0000005d 97340d73
	ldda	[%i1+%o5]0x88,%f12	! %f12 = 00000000 000000ff
!	Mem[0000000010181400] = 4effafcb97340d73, %l2 = 00000000000009a9
	ldxa	[%i6+%g0]0x88,%l2	! %l2 = 4effafcb97340d73
!	Mem[0000000030001410] = 972b8da28eb5ffff, %l6 = 000000003cf90000
	ldxa	[%i0+%o5]0x89,%l6	! %l6 = 972b8da28eb5ffff
!	Mem[0000000010081408] = 00ff0000 7f78326f, %l0 = 00000000, %l1 = bb47b886
	ldda	[%i2+%o4]0x80,%l0	! %l0 = 0000000000ff0000 000000007f78326f
!	Mem[0000000030081408] = ffff0000, %l2 = 4effafcb97340d73
	lduha	[%i2+%o4]0x81,%l2	! %l2 = 000000000000ffff
!	Mem[0000000010141400] = 0000000000000000, %l2 = 000000000000ffff
	ldxa	[%i5+%g0]0x88,%l2	! %l2 = 0000000000000000
!	Mem[00000000100c1408] = ff7c0000ffff00ff, %f14 = 52ee95dd 2669d7ba
	ldda	[%i3+%o4]0x80,%f14	! %f14 = ff7c0000 ffff00ff
!	Mem[00000000300c1408] = 00005d00, %l5 = 0000000000000000
	lduwa	[%i3+%o4]0x89,%l5	! %l5 = 0000000000005d00
!	Starting 10 instruction Store Burst
!	%f3  = 0000ffff, Mem[0000000010041410] = ff000000
	sta	%f3 ,[%i1+%o5]0x80	! Mem[0000000010041410] = 0000ffff

p0_label_174:
!	%f8  = 00000034 0b419631, %l5 = 0000000000005d00
!	Mem[00000000300c1408] = 005d000097000000
	add	%i3,0x008,%g1
	stda	%f8,[%g1+%l5]ASI_PST16_SL ! Mem[00000000300c1408] = 005d000097000000
!	Mem[00000000100c140b] = ff7c0000, %l5 = 0000000000005d00
	ldstub	[%i3+0x00b],%l5		! %l5 = 00000000000000ff
!	%f9  = 0b419631, %f1  = 00002dc5, %f5  = 00000000
	fadds	%f9 ,%f1 ,%f5 		! %l0 = 0000000000ff0022, Unfinished, %fsr = 0700000800
!	Mem[0000000030041410] = ffb0ffff, %l2 = 0000000000000000
	swapa	[%i1+%o5]0x81,%l2	! %l2 = 00000000ffb0ffff
!	%f8  = 00000034, Mem[0000000030001410] = 8eb5ffff
	sta	%f8 ,[%i0+%o5]0x89	! Mem[0000000030001410] = 00000034
!	%f2  = 0b410000 0000ffff, %l2 = 00000000ffb0ffff
!	Mem[0000000030181420] = 5d6c91056ce9b931
	add	%i6,0x020,%g1
	stda	%f2,[%g1+%l2]ASI_PST8_SL ! Mem[0000000030181420] = ffff00000000410b
!	Mem[0000000010141420] = 0000ffff, %l0 = 00ff0022, %l2 = ffb0ffff
	add	%i5,0x20,%g1
	casa	[%g1]0x80,%l0,%l2	! %l2 = 000000000000ffff
!	%l7 = 0000000000008b5b, Mem[000000001000141d] = 00000000
	stb	%l7,[%i0+0x01d]		! Mem[000000001000141c] = 005b0000
!	%f2  = 0b410000, Mem[0000000010081408] = 0000ff00
	sta	%f2 ,[%i2+%o4]0x88	! Mem[0000000010081408] = 0b410000
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = ff000000, %f12 = 00000000
	ld	[%i3+%o5],%f12	! %f12 = ff000000

p0_label_175:
!	%l4 = 00000000a909004c, %l2 = 000000000000ffff, %l6 = 972b8da28eb5ffff
	xnor	%l4,%l2,%l6		! %l6 = ffffffff56f6004c
!	Mem[0000000010081400] = 000000ff ffff91ab, %l6 = 56f6004c, %l7 = 00008b5b
	ldda	[%i2+%g0]0x80,%l6	! %l6 = 00000000000000ff 00000000ffff91ab
!	Mem[0000000030081400] = c52d0000, %l6 = 00000000000000ff
	ldswa	[%i2+%g0]0x81,%l6	! %l6 = ffffffffc52d0000
!	Mem[0000000010041420] = 0000002d, %l3 = ffffffffffffff00
	lduh	[%i1+0x022],%l3		! %l3 = 000000000000002d
!	Mem[0000000030101408] = 788d00ff, %l3 = 000000000000002d
	lduwa	[%i4+%o4]0x89,%l3	! %l3 = 00000000788d00ff
!	Mem[00000000300c1410] = a90947ff, %l2 = 000000000000ffff
	ldsba	[%i3+%o5]0x81,%l2	! %l2 = ffffffffffffffa9
!	Mem[0000000010001408] = 2d000000, %l1 = 000000007f78326f
	ldsba	[%i0+%o4]0x80,%l1	! %l1 = 000000000000002d
!	Mem[00000000211c0000] = ff0bc666, %l0 = 0000000000ff0022
	lduba	[%o2+0x001]%asi,%l0	! %l0 = 000000000000000b
!	Mem[0000000030001410] = 34000000, %f14 = ff7c0000
	lda	[%i0+%o5]0x81,%f14	! %f14 = 34000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010001419] = 9013de48, %l4 = 00000000a909004c
	ldstub	[%i0+0x019],%l4		! %l4 = 00000013000000ff

p0_label_176:
!	Mem[0000000020800041] = 8d78359e, %l7 = 00000000ffff91ab
	ldstuba	[%o1+0x041]%asi,%l7	! %l7 = 00000078000000ff
!	Mem[0000000020800040] = 8dff359e, %l3 = 00000000788d00ff
	ldsba	[%o1+0x041]%asi,%l3	! %l3 = ffffffffffffffff
!	%f8  = 00000034 0b419631, %l5 = 0000000000000000
!	Mem[0000000030101418] = d792467cef4709a9
	add	%i4,0x018,%g1
	stda	%f8,[%g1+%l5]ASI_PST32_S ! Mem[0000000030101418] = d792467cef4709a9
!	%l6 = ffffffffc52d0000, Mem[0000000010041400] = ff000034
	stha	%l6,[%i1+%g0]0x80	! Mem[0000000010041400] = 00000034
!	%l1 = 000000000000002d, imm = fffffffffffff8a4, %l5 = 0000000000000000
	xor	%l1,-0x75c,%l5		! %l5 = fffffffffffff889
!	%l1 = 000000000000002d, Mem[0000000030101410] = 0000007c
	stha	%l1,[%i4+%o5]0x81	! Mem[0000000030101410] = 002d007c
!	Mem[0000000030041408] = ec217703, %l1 = 000000000000002d
	swapa	[%i1+%o4]0x81,%l1	! %l1 = 00000000ec217703
!	Mem[0000000010081400] = 000000ff, %l5 = fffffffffffff889
	ldstuba	[%i2+0x000]%asi,%l5	! %l5 = 00000000000000ff
!	%l6 = c52d0000, %l7 = 00000078, Mem[0000000030141400] = 92d39a15 e10ece31
	stda	%l6,[%i5+%g0]0x81	! Mem[0000000030141400] = c52d0000 00000078
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = 1984de68 788d00ff, %l2 = ffffffa9, %l3 = ffffffff
	ldda	[%i4+%o4]0x89,%l2	! %l2 = 00000000788d00ff 000000001984de68

p0_label_177:
!	Mem[0000000030101410] = b0ffffff 7c002d00, %l2 = 788d00ff, %l3 = 1984de68
	ldda	[%i4+%o5]0x89,%l2	! %l2 = 000000007c002d00 00000000b0ffffff
!	Mem[0000000010041424] = 00000000, %l6 = ffffffffc52d0000
	ldsh	[%i1+0x024],%l6		! %l6 = 0000000000000000
!	Mem[0000000020800040] = 8dff359e, %l4 = 0000000000000013
	ldsh	[%o1+0x040],%l4		! %l4 = ffffffffffff8dff
!	Mem[0000000010001408] = 0000002d, %l2 = 000000007c002d00
	lduwa	[%i0+%o4]0x88,%l2	! %l2 = 000000000000002d
!	Mem[0000000020800040] = 8dff359e, %l6 = 0000000000000000
	ldsha	[%o1+0x040]%asi,%l6	! %l6 = ffffffffffff8dff
!	Mem[0000000030001400] = 0000002d, %l5 = 0000000000000000
	lduha	[%i0+%g0]0x89,%l5	! %l5 = 000000000000002d
!	Mem[0000000030101400] = 037721ec, %l0 = 000000000000000b
	ldswa	[%i4+%g0]0x81,%l0	! %l0 = 00000000037721ec
!	Mem[0000000010141400] = 00000000, %l0 = 00000000037721ec
	ldswa	[%i5+%g0]0x80,%l0	! %l0 = 0000000000000000
!	Mem[00000000201c0000] = ffff6bf6, %l1 = 00000000ec217703
	lduha	[%o0+0x000]%asi,%l1	! %l1 = 000000000000ffff
!	Starting 10 instruction Store Burst
!	%f24 = 0000ffff 00000000, %l1 = 000000000000ffff
!	Mem[00000000300c1408] = 005d000097000000
	add	%i3,0x008,%g1
	stda	%f24,[%g1+%l1]ASI_PST8_SL ! Mem[00000000300c1408] = 00000000ffff0000

p0_label_178:
!	%l5 = 000000000000002d, Mem[00000000300c1400] = 2d000000
	stha	%l5,[%i3+%g0]0x89	! Mem[00000000300c1400] = 2d00002d
!	%l0 = 00000000, %l1 = 0000ffff, Mem[0000000030001410] = 00000034 972b8da2
	stda	%l0,[%i0+%o5]0x89	! Mem[0000000030001410] = 00000000 0000ffff
!	Mem[0000000021800041] = 5dac0f03, %l0 = 0000000000000000
	ldstuba	[%o3+0x041]%asi,%l0	! %l0 = 000000ac000000ff
!	Mem[0000000030001400] = 0000002d, %l7 = 0000000000000078
	swapa	[%i0+%g0]0x89,%l7	! %l7 = 000000000000002d
!	%l6 = ffffffffffff8dff, Mem[00000000100c1400] = 0000008b
	stba	%l6,[%i3+%g0]0x88	! Mem[00000000100c1400] = 000000ff
!	%l5 = 000000000000002d, Mem[000000001000140a] = 2d000000
	sth	%l5,[%i0+0x00a]		! Mem[0000000010001408] = 2d00002d
!	%l4 = ffffffffffff8dff, Mem[0000000030001408] = efd2ffff4c000000
	stxa	%l4,[%i0+%o4]0x89	! Mem[0000000030001408] = ffffffffffff8dff
!	%f30 = 8eb5ffff, %f17 = ffffb58e
	fsqrts	%f30,%f17		! %f17 = 7fffffff
!	%l3 = 00000000b0ffffff, Mem[0000000010181410] = 00000000
	stha	%l3,[%i6+%o5]0x88	! Mem[0000000010181410] = 0000ffff
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = ffc595dd 159ad392, %l4 = ffff8dff, %l5 = 0000002d
	ldda	[%i1+%g0]0x81,%l4	! %l4 = 00000000ffc595dd 00000000159ad392

p0_label_179:
!	Mem[00000000201c0000] = ffff6bf6, %l0 = 00000000000000ac
	lduh	[%o0+%g0],%l0		! %l0 = 000000000000ffff
!	Mem[0000000030081408] = 0000ffff, %l7 = 000000000000002d
	ldsba	[%i2+%o4]0x89,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000030181408] = 5d000000, %f6  = 587adc62
	lda	[%i6+%o4]0x81,%f6 	! %f6 = 5d000000
!	Mem[0000000030081400] = c52d0000, %l5 = 00000000159ad392
	ldsha	[%i2+%g0]0x81,%l5	! %l5 = ffffffffffffc52d
!	Mem[0000000010141408] = ffffb58e, %l0 = 000000000000ffff
	lduba	[%i5+%o4]0x80,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010081400] = ff0000ff ffff91ab, %l0 = 000000ff, %l1 = 0000ffff
	ldd	[%i2+%g0],%l0		! %l0 = 00000000ff0000ff 00000000ffff91ab
!	Mem[0000000020800000] = 00ff98bf, %l1 = 00000000ffff91ab
	ldsha	[%o1+0x000]%asi,%l1	! %l1 = 00000000000000ff
	membar	#Sync			! Added by membar checker (28)
!	Mem[0000000010101420] = 00000000, %l7 = ffffffffffffffff
	ldsba	[%i4+0x023]%asi,%l7	! %l7 = 0000000000000000
!	Mem[0000000010001400] = 0b4100000000ffff, %f26 = 8eb5ffff 000021ec
	ldda	[%i0+%g0]0x88,%f26	! %f26 = 0b410000 0000ffff
!	Starting 10 instruction Store Burst
!	Mem[0000000010181414] = 00002dc5, %l0 = 00000000ff0000ff, %asi = 80
	swapa	[%i6+0x014]%asi,%l0	! %l0 = 0000000000002dc5

p0_label_180:
!	Mem[0000000030041408] = 0000002d, %l6 = ffffffffffff8dff
	swapa	[%i1+%o4]0x81,%l6	! %l6 = 000000000000002d
!	%f0  = 00860000 00002dc5, Mem[0000000030101408] = ff008d78 68de8419
	stda	%f0 ,[%i4+%o4]0x81	! Mem[0000000030101408] = 00860000 00002dc5
!	%l4 = 00000000ffc595dd, Mem[0000000030101408] = 00008600
	stba	%l4,[%i4+%o4]0x89	! Mem[0000000030101408] = 000086dd
!	%l2 = 000000000000002d, Mem[0000000030181400] = 0000007c00000000
	stxa	%l2,[%i6+%g0]0x89	! Mem[0000000030181400] = 000000000000002d
!	Mem[0000000010181400] = 730d3497, %l2 = 000000000000002d
	ldstuba	[%i6+%g0]0x80,%l2	! %l2 = 00000073000000ff
!	%f28 = 730d0000, %f20 = 4c0009a9, %f22 = 037721ec 0a7a7b57
	fsmuld	%f28,%f20,%f22		! %f22 = 47f1a154 85400000
!	%l0 = 0000000000002dc5, Mem[0000000021800141] = ffffcd46, %asi = 80
	stba	%l0,[%o3+0x141]%asi	! Mem[0000000021800140] = ffc5cd46
!	%f21 = 00000000, Mem[0000000030181408] = 5d000000
	sta	%f21,[%i6+%o4]0x81	! Mem[0000000030181408] = 00000000
!	%l6 = 000000000000002d, Mem[00000000211c0000] = ff0bc666
	sth	%l6,[%o2+%g0]		! Mem[00000000211c0000] = 002dc666
!	Starting 10 instruction Load Burst
!	%l1 = 00000000000000ff, imm = fffffffffffff802, %l2 = 0000000000000073
	andn	%l1,-0x7fe,%l2		! %l2 = 00000000000000fd

p0_label_181:
!	Mem[000000001008142c] = 00000000, %l4 = 00000000ffc595dd
	ldsw	[%i2+0x02c],%l4		! %l4 = 0000000000000000
!	Mem[0000000030101408] = dd860000, %l4 = 0000000000000000
	ldsha	[%i4+%o4]0x81,%l4	! %l4 = ffffffffffffdd86
!	Mem[0000000030101410] = 002d007c, %l2 = 00000000000000fd
	lduba	[%i4+%o5]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000010081438] = d792467c 000000ff, %l2 = 00000000, %l3 = b0ffffff
	ldda	[%i2+0x038]%asi,%l2	! %l2 = 00000000d792467c 00000000000000ff
!	Mem[0000000030001400] = 78000000, %f5  = 00000000
	lda	[%i0+%g0]0x81,%f5 	! %f5 = 78000000
!	Mem[0000000010041428] = 0475329a, %f1  = 00002dc5
	ld	[%i1+0x028],%f1 	! %f1 = 0475329a
!	Mem[0000000010001438] = 0e0671aa191c67b8, %l3 = 00000000000000ff
	ldxa	[%i0+0x038]%asi,%l3	! %l3 = 0e0671aa191c67b8
!	Mem[0000000030001408] = ff8dffff, %l2 = 00000000d792467c
	ldsha	[%i0+%o4]0x81,%l2	! %l2 = ffffffffffffff8d
!	Mem[0000000030001408] = ffff8dff, %f15 = ffff00ff
	lda	[%i0+%o4]0x89,%f15	! %f15 = ffff8dff
!	Starting 10 instruction Store Burst
!	%l0 = 0000000000002dc5, Mem[00000000211c0000] = 002dc666, %asi = 80
	stba	%l0,[%o2+0x000]%asi	! Mem[00000000211c0000] = c52dc666

p0_label_182:
!	Mem[0000000030181410] = 8eb5ffff, %l3 = 0e0671aa191c67b8
	ldstuba	[%i6+%o5]0x81,%l3	! %l3 = 0000008e000000ff
!	%l0 = 0000000000002dc5, Mem[0000000010141410] = ec21770300ff0000
	stxa	%l0,[%i5+%o5]0x80	! Mem[0000000010141410] = 0000000000002dc5
!	Mem[00000000201c0001] = ffff6bf6, %l2 = ffffffffffffff8d
	ldstub	[%o0+0x001],%l2		! %l2 = 000000ff000000ff
!	%l4 = ffffffffffffdd86, %l5 = ffffffffffffc52d, %l4 = ffffffffffffdd86
	xnor	%l4,%l5,%l4		! %l4 = ffffffffffffe754
!	%l5 = ffffffffffffc52d, Mem[0000000020800000] = 00ff98bf, %asi = 80
	stha	%l5,[%o1+0x000]%asi	! Mem[0000000020800000] = c52d98bf
!	Mem[0000000030141410] = ae2b5b8b, %l2 = 00000000000000ff
	ldstuba	[%i5+%o5]0x89,%l2	! %l2 = 0000008b000000ff
!	%l6 = 000000000000002d, Mem[0000000010041410] = 00000000ffff0000
	stxa	%l6,[%i1+%o5]0x88	! Mem[0000000010041410] = 000000000000002d
!	Mem[0000000010101428] = ec210000ffffb58e, %l7 = 0000000000000000, %l3 = 000000000000008e
	add	%i4,0x28,%g1
	casxa	[%g1]0x80,%l7,%l3	! %l3 = ec210000ffffb58e
!	Mem[0000000010041434] = cbaf7c59, %l3 = ec210000ffffb58e
	swap	[%i1+0x034],%l3		! %l3 = 00000000cbaf7c59
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = dd95c5ff, %f9  = 0b419631
	lda	[%i1+%g0]0x89,%f9 	! %f9 = dd95c5ff

p0_label_183:
!	Mem[00000000211c0000] = c52dc666, %l2 = 000000000000008b
	ldub	[%o2+0x001],%l2		! %l2 = 000000000000002d
!	Mem[00000000211c0000] = c52dc666, %l3 = 00000000cbaf7c59
	ldub	[%o2+0x001],%l3		! %l3 = 000000000000002d
!	Mem[0000000030181408] = 00000000 4e0f0307, %l4 = ffffe754, %l5 = ffffc52d
	ldda	[%i6+%o4]0x81,%l4	! %l4 = 0000000000000000 000000004e0f0307
!	Mem[00000000300c1400] = 2d00002d, %l1 = 00000000000000ff
	ldswa	[%i3+%g0]0x81,%l1	! %l1 = 000000002d00002d
!	Mem[0000000030001400] = 00000078, %l1 = 000000002d00002d
	lduha	[%i0+%g0]0x89,%l1	! %l1 = 0000000000000078
!	Mem[0000000010001410] = ec21de82, %l5 = 000000004e0f0307
	ldsha	[%i0+%o5]0x80,%l5	! %l5 = ffffffffffffec21
!	Mem[00000000100c1408] = ff7c00ff ffff00ff, %l4 = 00000000, %l5 = ffffec21
	ldda	[%i3+%o4]0x80,%l4	! %l4 = 00000000ff7c00ff 00000000ffff00ff
!	Mem[00000000100c1408] = ff007cff, %l7 = 0000000000000000
	lduba	[%i3+%o4]0x88,%l7	! %l7 = 00000000000000ff
!	%l1 = 0000000000000078, imm = fffffffffffffd03, %l6 = 000000000000002d
	xnor	%l1,-0x2fd,%l6		! %l6 = 0000000000000284
!	Starting 10 instruction Store Burst
!	%l2 = 000000000000002d, Mem[0000000010081410] = c52dc5ff
	stwa	%l2,[%i2+%o5]0x88	! Mem[0000000010081410] = 0000002d

p0_label_184:
!	%f0  = 00860000 0475329a 0b410000 0000ffff
!	%f4  = 2dc52dc5 78000000 5d000000 0000ffff
!	%f8  = 00000034 dd95c5ff 00000000 0b419631
!	%f12 = ff000000 000000ff 34000000 ffff8dff
	stda	%f0,[%i6]ASI_BLK_S	! Block Store to 0000000030181400
!	Mem[0000000010081408] = 0000410b, %l5 = 00000000ffff00ff
	ldstuba	[%i2+%o4]0x80,%l5	! %l5 = 00000000000000ff
!	Mem[00000000211c0001] = c52dc666, %l6 = 0000000000000284
	ldstub	[%o2+0x001],%l6		! %l6 = 0000002d000000ff
!	%l5 = 0000000000000000, Mem[0000000030081408] = 0000ffff
	stwa	%l5,[%i2+%o4]0x89	! Mem[0000000030081408] = 00000000
!	%l0 = 0000000000002dc5, Mem[0000000030001408] = ff8dffffffffffff
	stxa	%l0,[%i0+%o4]0x81	! Mem[0000000030001408] = 0000000000002dc5
!	%f30 = 8eb5ffff 000021ec, Mem[0000000030101400] = 037721ec 00000000
	stda	%f30,[%i4+%g0]0x81	! Mem[0000000030101400] = 8eb5ffff 000021ec
!	%f18 = ffffb58e, Mem[0000000010141410] = 00000000
	sta	%f18,[%i5+%o5]0x80	! Mem[0000000010141410] = ffffb58e
!	Mem[0000000010101408] = 6f327841, %l4 = 00000000ff7c00ff
	ldstub	[%i4+%o4],%l4		! %l4 = 0000006f000000ff
!	%l3 = 000000000000002d, Mem[0000000010041428] = 0475329a
	stb	%l3,[%i1+0x028]		! Mem[0000000010041428] = 2d75329a
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = 00000034, %l5 = 0000000000000000
	ldsh	[%i1+0x002],%l5		! %l5 = 0000000000000034

p0_label_185:
!	Mem[0000000010081400] = ff0000ff, %l4 = 000000000000006f
	lduw	[%i2+%g0],%l4		! %l4 = 00000000ff0000ff
!	Mem[0000000030081408] = 00000000, %f19 = 4178326f
	lda	[%i2+%o4]0x89,%f19	! %f19 = 00000000
!	Mem[0000000010141408] = ffffb58e, %l4 = 00000000ff0000ff
	lduha	[%i5+%o4]0x80,%l4	! %l4 = 000000000000ffff
!	Mem[0000000010101400] = 8eb5ffff, %l4 = 000000000000ffff
	ldswa	[%i4+%g0]0x80,%l4	! %l4 = ffffffff8eb5ffff
!	Mem[00000000300c1408] = 00000000, %f25 = 00000000
	lda	[%i3+%o4]0x81,%f25	! %f25 = 00000000
!	Mem[0000000010041400] = 34000000, %l7 = 00000000000000ff
	ldsha	[%i1+%g0]0x88,%l7	! %l7 = 0000000000000000
!	Mem[00000000100c1400] = ff000000 000000ff ff7c00ff ffff00ff
!	Mem[00000000100c1410] = ff000000 0000ff00 00000000 2669d7ba
!	Mem[00000000100c1420] = 7f78006f 052fc340 9ac0a24d ffff5252
!	Mem[00000000100c1430] = ffffffff ffe1e712 ff000000 f6cda1ad
	ldda	[%i3]ASI_BLK_AIUPL,%f16	! Block Load from 00000000100c1400
!	Mem[0000000010041408] = 8eb5ffff, %l5 = 0000000000000034
	ldsha	[%i1+%o4]0x88,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000030101408] = dd860000, %l7 = 0000000000000000
	ldsba	[%i4+%o4]0x81,%l7	! %l7 = ffffffffffffffdd
!	Starting 10 instruction Store Burst
!	%f2  = 0b410000 0000ffff, %l0 = 0000000000002dc5
!	Mem[0000000010101428] = ec210000ffffb58e
	add	%i4,0x028,%g1
	stda	%f2,[%g1+%l0]ASI_PST32_P ! Mem[0000000010101428] = ec2100000000ffff

p0_label_186:
!	Mem[0000000030101400] = 8eb5ffff, %l2 = 000000000000002d
	swapa	[%i4+%g0]0x81,%l2	! %l2 = 000000008eb5ffff
!	Mem[000000001004141c] = 0a7a7b57, %l2 = 8eb5ffff, %l4 = 8eb5ffff
	add	%i1,0x1c,%g1
	casa	[%g1]0x80,%l2,%l4	! %l4 = 000000000a7a7b57
!	%l1 = 0000000000000078, Mem[0000000030181410] = c52dc52d
	stba	%l1,[%i6+%o5]0x89	! Mem[0000000030181410] = c52dc578
!	%l2 = 000000008eb5ffff, Mem[0000000010181408] = 730d34ff
	stha	%l2,[%i6+%o4]0x88	! Mem[0000000010181408] = 730dffff
!	%l7 = ffffffffffffffdd, Mem[0000000010041400] = 34000000
	stha	%l7,[%i1+%g0]0x88	! Mem[0000000010041400] = 3400ffdd
!	%l0 = 0000000000002dc5, Mem[0000000010101434] = 00000d73
	stw	%l0,[%i4+0x034]		! Mem[0000000010101434] = 00002dc5
!	%l6 = 000000000000002d, Mem[0000000030081410] = 00000000
	stha	%l6,[%i2+%o5]0x89	! Mem[0000000030081410] = 0000002d
!	Mem[0000000030141408] = 4c000000, %l2 = 000000008eb5ffff
	swapa	[%i5+%o4]0x81,%l2	! %l2 = 000000004c000000
!	%l1 = 0000000000000078, Mem[0000000030141408] = ffffb58e
	stba	%l1,[%i5+%o4]0x89	! Mem[0000000030141408] = ffffb578
!	Starting 10 instruction Load Burst
!	Mem[0000000010081404] = ffff91ab, %l7 = ffffffffffffffdd
	ldsha	[%i2+0x004]%asi,%l7	! %l7 = ffffffffffffffff

p0_label_187:
!	%l5 = ffffffffffffffff, immed = fffffbf7, %y  = 00000000
	sdiv	%l5,-0x409,%l0		! %l0 = ffffffffffc08ebf
	mov	%l0,%y			! %y = ffc08ebf
!	Mem[0000000030141408] = ffffb578, %l2 = 000000004c000000
	ldswa	[%i5+%o4]0x89,%l2	! %l2 = ffffffffffffb578
!	Mem[0000000030141408] = 78b5ffff5da9ffff, %l1 = 0000000000000078
	ldxa	[%i5+%o4]0x81,%l1	! %l1 = 78b5ffff5da9ffff
!	Mem[0000000010081410] = 2d000000, %l2 = ffffffffffffb578
	ldsba	[%i2+%o5]0x80,%l2	! %l2 = 000000000000002d
!	Mem[0000000030081408] = 00000000, %l5 = ffffffffffffffff
	lduha	[%i2+%o4]0x81,%l5	! %l5 = 0000000000000000
!	Mem[00000000211c0000] = c5ffc666, %l1 = 78b5ffff5da9ffff
	ldsha	[%o2+0x000]%asi,%l1	! %l1 = ffffffffffffc5ff
!	Mem[0000000030101408] = dd860000, %l1 = ffffffffffffc5ff
	ldsba	[%i4+%o4]0x81,%l1	! %l1 = ffffffffffffffdd
!	Mem[0000000010081410] = 2d000000 ffffffb9, %l0 = ffc08ebf, %l1 = ffffffdd
	ldda	[%i2+0x010]%asi,%l0	! %l0 = 000000002d000000 00000000ffffffb9
!	%l6 = 000000000000002d, imm = 0000000000000521, %l7 = ffffffffffffffff
	or	%l6,0x521,%l7		! %l7 = 000000000000052d
!	Starting 10 instruction Store Burst
!	Mem[0000000010101408] = 417832ff, %l0 = 000000002d000000
	swapa	[%i4+%o4]0x88,%l0	! %l0 = 00000000417832ff

p0_label_188:
!	%f16 = ff000000 000000ff ff00ffff ff007cff
!	%f20 = 00ff0000 000000ff bad76926 00000000
!	%f24 = 40c32f05 6f00787f 5252ffff 4da2c09a
!	%f28 = 12e7e1ff ffffffff ada1cdf6 000000ff
	stda	%f16,[%i2]ASI_COMMIT_S	! Block Store to 0000000030081400
!	%l7 = 000000000000052d, Mem[0000000010041408] = 8eb5ffff
	stha	%l7,[%i1+%o4]0x88	! Mem[0000000010041408] = 8eb5052d
!	%l2 = 0000002d, %l3 = 0000002d, Mem[0000000030101408] = dd860000 00002dc5
	stda	%l2,[%i4+%o4]0x81	! Mem[0000000030101408] = 0000002d 0000002d
!	%f12 = ff000000, Mem[0000000030001400] = 00000078
	sta	%f12,[%i0+%g0]0x89	! Mem[0000000030001400] = ff000000
!	%l7 = 000000000000052d, Mem[00000000300c1410] = a90947ff
	stha	%l7,[%i3+%o5]0x81	! Mem[00000000300c1410] = 052d47ff
!	%f10 = 00000000 0b419631, %l7 = 000000000000052d
!	Mem[0000000010181420] = 037721ec159a00ff
	add	%i6,0x020,%g1
	stda	%f10,[%g1+%l7]ASI_PST16_P ! Mem[0000000010181420] = 00000000159a9631
!	%f1  = 0475329a, Mem[000000001014141c] = 0a7a7b57
	st	%f1 ,[%i5+0x01c]	! Mem[000000001014141c] = 0475329a
!	Mem[0000000010141408] = ffffb58e, %l5 = 0000000000000000
	ldstuba	[%i5+%o4]0x80,%l5	! %l5 = 000000ff000000ff
!	Mem[0000000010001400] = ffff0000, %l7 = 000000000000052d
	swapa	[%i0+%g0]0x80,%l7	! %l7 = 00000000ffff0000
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (29)
!	Mem[0000000010081410] = b9ffffff 0000002d, %l6 = 0000002d, %l7 = ffff0000
	ldda	[%i2+%o5]0x88,%l6	! %l6 = 000000000000002d 00000000b9ffffff

p0_label_189:
!	Mem[0000000030101410] = 7c002d00, %l1 = 00000000ffffffb9
	ldsba	[%i4+%o5]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000030001410] = 00000000ffff0000, %f14 = 34000000 ffff8dff
	ldda	[%i0+%o5]0x81,%f14	! %f14 = 00000000 ffff0000
!	Mem[0000000010001418] = 90ffde48, %l7 = 00000000b9ffffff
	lduwa	[%i0+0x018]%asi,%l7	! %l7 = 0000000090ffde48
!	Mem[0000000010181400] = ff0d3497, %l2 = 000000000000002d
	ldsba	[%i6+%g0]0x80,%l2	! %l2 = ffffffffffffffff
!	Mem[00000000211c0000] = c5ffc666, %l0 = 00000000417832ff
	lduh	[%o2+%g0],%l0		! %l0 = 000000000000c5ff
!	Mem[0000000020800000] = c52d98bf, %l3 = 000000000000002d
	ldsb	[%o1+%g0],%l3		! %l3 = ffffffffffffffc5
!	Mem[0000000030101410] = 002d007cffffffb0, %f28 = 12e7e1ff ffffffff
	ldda	[%i4+%o5]0x81,%f28	! %f28 = 002d007c ffffffb0
!	Mem[00000000100c1400] = 000000ff, %l0 = 000000000000c5ff
	ldsba	[%i3+%g0]0x88,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010181404] = cbafff4e, %l6 = 000000000000002d
	lduha	[%i6+0x004]%asi,%l6	! %l6 = 000000000000cbaf
!	Starting 10 instruction Store Burst
!	%f6  = 5d000000 0000ffff, %l6 = 000000000000cbaf
!	Mem[00000000300c1410] = 052d47ff00000000
	add	%i3,0x010,%g1
	stda	%f6,[%g1+%l6]ASI_PST16_SL ! Mem[00000000300c1410] = ffff00000000005d

p0_label_190:
!	%l1 = 0000000000000000, Mem[0000000030001400] = 00000000ff000000
	stxa	%l1,[%i0+%g0]0x89	! Mem[0000000030001400] = 0000000000000000
!	Mem[0000000010101408] = 2d000000, %l2 = ffffffffffffffff
	ldstuba	[%i4+%o4]0x88,%l2	! %l2 = 00000000000000ff
!	%f14 = 00000000 ffff0000, %l1 = 0000000000000000
!	Mem[0000000010141438] = bad76926e10ece31
	add	%i5,0x038,%g1
	stda	%f14,[%g1+%l1]ASI_PST32_P ! Mem[0000000010141438] = bad76926e10ece31
!	%l6 = 0000cbaf, %l7 = 90ffde48, Mem[0000000010101408] = 2d0000ff ffffb58e
	stda	%l6,[%i4+%o4]0x88	! Mem[0000000010101408] = 0000cbaf 90ffde48
!	Mem[0000000010101400] = ffffb58e, %l6 = 000000000000cbaf
	swapa	[%i4+%g0]0x88,%l6	! %l6 = 00000000ffffb58e
!	%f24 = 40c32f05 6f00787f, %l1 = 0000000000000000
!	Mem[0000000010081410] = 2d000000ffffffb9
	add	%i2,0x010,%g1
	stda	%f24,[%g1+%l1]ASI_PST16_P ! Mem[0000000010081410] = 2d000000ffffffb9
!	%l0 = ffffffffffffffff, Mem[0000000010141414] = 00002dc5, %asi = 80
	stwa	%l0,[%i5+0x014]%asi	! Mem[0000000010141414] = ffffffff
!	Mem[000000001014141b] = 037721ec, %l6 = 00000000ffffb58e
	ldstub	[%i5+0x01b],%l6		! %l6 = 000000ec000000ff
!	Mem[0000000010101410] = 00000000, %l1 = 0000000000000000
	ldstuba	[%i4+%o5]0x88,%l1	! %l1 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101428] = ec210000, %l6 = 00000000000000ec
	ldsw	[%i4+0x028],%l6		! %l6 = ffffffffec210000

p0_label_191:
!	Mem[00000000300c1400] = 2d00002d, %l6 = ffffffffec210000
	lduba	[%i3+%g0]0x81,%l6	! %l6 = 000000000000002d
!	Mem[0000000010181408] = ffff0d73, %l4 = 000000000a7a7b57
	ldsba	[%i6+%o4]0x80,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010001408] = 5d0000002d00002d, %f14 = 00000000 ffff0000
	ldda	[%i0+%o4]0x88,%f14	! %f14 = 5d000000 2d00002d
!	Mem[0000000010181408] = ffff0d73, %l2 = 0000000000000000
	lduwa	[%i6+%o4]0x80,%l2	! %l2 = 00000000ffff0d73
!	Mem[0000000020800000] = c52d98bf, %l7 = 0000000090ffde48
	ldsba	[%o1+0x001]%asi,%l7	! %l7 = 000000000000002d
!	Mem[0000000010181410] = ffff0000, %l0 = ffffffffffffffff
	lduwa	[%i6+%o5]0x80,%l0	! %l0 = 00000000ffff0000
!	Mem[0000000010001410] = 82de21ec, %l0 = 00000000ffff0000
	lduwa	[%i0+%o5]0x88,%l0	! %l0 = 0000000082de21ec
!	Mem[0000000010081410] = 2d000000ffffffb9, %l6 = 000000000000002d
	ldx	[%i2+%o5],%l6		! %l6 = 2d000000ffffffb9
!	Mem[0000000010081410] = 0000002d, %l6 = 2d000000ffffffb9
	lduba	[%i2+%o5]0x88,%l6	! %l6 = 000000000000002d
!	Starting 10 instruction Store Burst
!	%l3 = ffffffffffffffc5, Mem[00000000100c142c] = ffff5252, %asi = 80
	stba	%l3,[%i3+0x02c]%asi	! Mem[00000000100c142c] = c5ff5252

p0_label_192:
!	%f29 = ffffffb0, %f16 = ff000000, %f4  = 2dc52dc5
	fmuls	%f29,%f16,%f4 		! %f4  = ffffffb0
!	%f24 = 40c32f05 6f00787f, Mem[00000000100c1400] = ff000000 000000ff
	stda	%f24,[%i3+%g0]0x80	! Mem[00000000100c1400] = 40c32f05 6f00787f
!	%f22 = bad76926 00000000, Mem[00000000100c1408] = ff7c00ff ffff00ff
	std	%f22,[%i3+%o4]	! Mem[00000000100c1408] = bad76926 00000000
!	Mem[0000000030001408] = 00000000, %l0 = 0000000082de21ec
	ldstuba	[%i0+%o4]0x81,%l0	! %l0 = 00000000000000ff
!	%l3 = ffffffffffffffc5, Mem[00000000211c0000] = c5ffc666, %asi = 80
	stba	%l3,[%o2+0x000]%asi	! Mem[00000000211c0000] = c5ffc666
!	%f14 = 5d000000, Mem[0000000030081400] = 000000ff
	sta	%f14,[%i2+%g0]0x89	! Mem[0000000030081400] = 5d000000
!	Mem[0000000020800000] = c52d98bf, %l3 = ffffffffffffffc5
	ldstub	[%o1+%g0],%l3		! %l3 = 000000c5000000ff
!	%l4 = ffffffffffffffff, %l0 = 0000000000000000, %l2 = 00000000ffff0d73
	subc	%l4,%l0,%l2		! %l2 = ffffffffffffffff
!	Mem[0000000010141423] = 0000ffff, %l5 = 00000000000000ff
	ldstub	[%i5+0x023],%l5		! %l5 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = 0000000000000000, %f0  = 00860000 0475329a
	ldda	[%i5+%g0]0x80,%f0 	! %f0  = 00000000 00000000

p0_label_193:
!	Mem[0000000010001410] = ec21de82, %l7 = 000000000000002d
	ldsha	[%i0+%o5]0x80,%l7	! %l7 = ffffffffffffec21
!	Mem[0000000010101410] = ff000000, %l0 = 0000000000000000
	lduha	[%i4+%o5]0x80,%l0	! %l0 = 000000000000ff00
!	Mem[0000000030041400] = ffc595dd, %f21 = 000000ff
	lda	[%i1+%g0]0x81,%f21	! %f21 = ffc595dd
!	Mem[0000000010101408] = 0000cbaf, %l7 = ffffffffffffec21
	ldstuba	[%i4+%o4]0x88,%l7	! %l7 = 000000af000000ff
!	Mem[0000000030001400] = 00000000, %l1 = 0000000000000000
	lduwa	[%i0+%g0]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000010101400] = afcb0000, %l1 = 0000000000000000
	ldsba	[%i4+%g0]0x80,%l1	! %l1 = ffffffffffffffaf
!	Mem[0000000030101408] = 2d0000002d000000, %f30 = ada1cdf6 000000ff
	ldda	[%i4+%o4]0x89,%f30	! %f30 = 2d000000 2d000000
!	Mem[0000000010041418] = 00000000, %l5 = 00000000000000ff
	lduha	[%i1+0x01a]%asi,%l5	! %l5 = 0000000000000000
!	Mem[0000000010101408] = ffcb0000, %l1 = ffffffffffffffaf
	ldsba	[%i4+%o4]0x80,%l1	! %l1 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%f18 = ff00ffff ff007cff, Mem[0000000030141400] = c52d0000 00000078
	stda	%f18,[%i5+%g0]0x81	! Mem[0000000030141400] = ff00ffff ff007cff

p0_label_194:
!	%l4 = ffffffffffffffff, Mem[0000000030101408] = 0000002d
	stha	%l4,[%i4+%o4]0x81	! Mem[0000000030101408] = ffff002d
!	%l6 = 000000000000002d, Mem[0000000030041408] = ff8dffff
	stha	%l6,[%i1+%o4]0x89	! Mem[0000000030041408] = ff8d002d
!	%l7 = 00000000000000af, Mem[00000000300c1408] = 00000000
	stha	%l7,[%i3+%o4]0x89	! Mem[00000000300c1408] = 000000af
!	%f29 = ffffffb0, Mem[0000000010001408] = 2d00002d
	sta	%f29,[%i0+%o4]0x80	! Mem[0000000010001408] = ffffffb0
!	Mem[0000000030001410] = 00000000, %l1 = ffffffffffffffff
	swapa	[%i0+%o5]0x81,%l1	! %l1 = 0000000000000000
!	%l1 = 0000000000000000, Mem[0000000010041408] = 2d05b58e
	stwa	%l1,[%i1+%o4]0x80	! Mem[0000000010041408] = 00000000
!	Mem[0000000030001400] = 00000000, %l1 = 0000000000000000
	swapa	[%i0+%g0]0x81,%l1	! %l1 = 0000000000000000
!	%l0 = 0000ff00, %l1 = 00000000, Mem[0000000030001408] = 000000ff c52d0000
	stda	%l0,[%i0+%o4]0x89	! Mem[0000000030001408] = 0000ff00 00000000
!	%l3 = 00000000000000c5, Mem[00000000100c1408] = 000000002669d7ba
	stxa	%l3,[%i3+%o4]0x88	! Mem[00000000100c1408] = 00000000000000c5
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = 0000ffff, %l3 = 00000000000000c5
	ldsba	[%i6+%o5]0x88,%l3	! %l3 = ffffffffffffffff

p0_label_195:
!	Mem[0000000030041408] = 2d008dff, %l3 = ffffffffffffffff
	ldswa	[%i1+%o4]0x81,%l3	! %l3 = 000000002d008dff
!	Mem[00000000100c1410] = 000000ff, %l4 = ffffffffffffffff
	lduba	[%i3+%o5]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[00000000300c1400] = 2d00002d, %l3 = 000000002d008dff
	lduwa	[%i3+%g0]0x89,%l3	! %l3 = 000000002d00002d
!	%f23 = 00000000, %f5  = 78000000, %f28 = 002d007c
	fdivs	%f23,%f5 ,%f28		! %f28 = 00000000
!	Mem[0000000030101408] = ffff002d 0000002d, %l0 = 0000ff00, %l1 = 00000000
	ldda	[%i4+%o4]0x81,%l0	! %l0 = 00000000ffff002d 000000000000002d
!	Mem[0000000030101400] = 0000002d 000021ec, %l6 = 0000002d, %l7 = 000000af
	ldda	[%i4+%g0]0x81,%l6	! %l6 = 000000000000002d 00000000000021ec
!	Mem[0000000030001400] = 00000000, %l7 = 00000000000021ec
	lduha	[%i0+%g0]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000010141400] = 00000000, %l3 = 000000002d00002d
	lduha	[%i5+%g0]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000010101430] = 00002dc5, %l4 = 00000000000000ff
	lduh	[%i4+0x032],%l4		! %l4 = 0000000000002dc5
!	Starting 10 instruction Store Burst
!	%l3 = 0000000000000000, %l5 = 0000000000000000, %l7  = 0000000000000000
	mulx	%l3,%l5,%l7		! %l7 = 0000000000000000

p0_label_196:
!	%f4  = ffffffb0, %f29 = ffffffb0, %f10 = 00000000 0b419631
	fsmuld	%f4 ,%f29,%f10		! %f10 = fffffff6 00000000
!	%l7 = 0000000000000000, Mem[0000000030101408] = ffff002d
	stwa	%l7,[%i4+%o4]0x81	! Mem[0000000030101408] = 00000000
!	Mem[0000000030141410] = ff5b2bae, %l0 = 00000000ffff002d
	ldstuba	[%i5+%o5]0x81,%l0	! %l0 = 000000ff000000ff
!	%l4 = 0000000000002dc5, Mem[0000000030081400] = 0000005d
	stba	%l4,[%i2+%g0]0x81	! Mem[0000000030081400] = c500005d
!	%f22 = bad76926 00000000, Mem[0000000030041408] = 2d008dff c78dcd1f
	stda	%f22,[%i1+%o4]0x81	! Mem[0000000030041408] = bad76926 00000000
!	%f20 = 00ff0000 ffc595dd, Mem[0000000010141430] = 730d0000 cbaf7c59
	stda	%f20,[%i5+0x030]%asi	! Mem[0000000010141430] = 00ff0000 ffc595dd
!	%f20 = 00ff0000, Mem[0000000010101408] = 0000cbff
	sta	%f20,[%i4+%o4]0x88	! Mem[0000000010101408] = 00ff0000
!	Mem[0000000010081408] = ff00410b, %l3 = 0000000000000000
	ldstuba	[%i2+%o4]0x80,%l3	! %l3 = 000000ff000000ff
!	%l2 = ffffffffffffffff, Mem[0000000010181404] = cbafff4e, %asi = 80
	stha	%l2,[%i6+0x004]%asi	! Mem[0000000010181404] = ffffff4e
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = bad76926 00000000, %l0 = 000000ff, %l1 = 0000002d
	ldda	[%i1+%o4]0x81,%l0	! %l0 = 00000000bad76926 0000000000000000

p0_label_197:
!	Mem[0000000010141434] = ffc595dd, %l0 = 00000000bad76926
	ldsw	[%i5+0x034],%l0		! %l0 = ffffffffffc595dd
!	Mem[0000000010081410] = 0000002d, %l7 = 0000000000000000
	lduba	[%i2+%o5]0x88,%l7	! %l7 = 000000000000002d
!	%l5 = 0000000000000000, %l3 = 00000000000000ff, %l6 = 000000000000002d
	sdivx	%l5,%l3,%l6		! %l6 = 0000000000000000
!	Mem[0000000030181400] = 00860000, %f3  = 0000ffff
	lda	[%i6+%g0]0x81,%f3 	! %f3 = 00860000
!	Mem[0000000010041400] = 3196410b 3400ffdd, %l4 = 00002dc5, %l5 = 00000000
	ldda	[%i1+%g0]0x88,%l4	! %l4 = 000000003400ffdd 000000003196410b
!	Mem[0000000010001410] = 82de21ec, %l3 = 00000000000000ff
	ldsba	[%i0+%o5]0x88,%l3	! %l3 = ffffffffffffffec
!	Mem[0000000030101400] = 2d000000, %f23 = 00000000
	lda	[%i4+%g0]0x89,%f23	! %f23 = 2d000000
!	Mem[0000000021800180] = ca4c59fe, %l5 = 000000003196410b
	ldsb	[%o3+0x180],%l5		! %l5 = ffffffffffffffca
!	Mem[0000000010041400] = 3196410b3400ffdd, %l7 = 000000000000002d
	ldxa	[%i1+%g0]0x88,%l7	! %l7 = 3196410b3400ffdd
!	Starting 10 instruction Store Burst
!	%f0  = 00000000 00000000 0b410000 00860000
!	%f4  = ffffffb0 78000000 5d000000 0000ffff
!	%f8  = 00000034 dd95c5ff fffffff6 00000000
!	%f12 = ff000000 000000ff 5d000000 2d00002d
	stda	%f0,[%i4]ASI_BLK_AIUP	! Block Store to 0000000010101400

p0_label_198:
!	Mem[0000000030001410] = ffffffff, %l7 = 3196410b3400ffdd
	ldstuba	[%i0+%o5]0x89,%l7	! %l7 = 000000ff000000ff
!	%l3 = ffffffffffffffec, Mem[0000000030041400] = 92d39a15dd95c5ff
	stxa	%l3,[%i1+%g0]0x89	! Mem[0000000030041400] = ffffffffffffffec
!	%l1 = 0000000000000000, Mem[000000001000143c] = 191c67b8, %asi = 80
	stwa	%l1,[%i0+0x03c]%asi	! Mem[000000001000143c] = 00000000
!	Mem[0000000030081410] = 00ff0000, %l3 = ffffffffffffffec
	ldstuba	[%i2+%o5]0x81,%l3	! %l3 = 00000000000000ff
!	%f23 = 2d000000, Mem[00000000100c1410] = 000000ff
	sta	%f23,[%i3+%o5]0x88	! Mem[00000000100c1410] = 2d000000
!	%f16 = ff000000 000000ff, Mem[0000000010181438] = ff000000 000000ff
	stda	%f16,[%i6+0x038]%asi	! Mem[0000000010181438] = ff000000 000000ff
!	%l7 = 00000000000000ff, Mem[0000000030041408] = 000000002669d7ba
	stxa	%l7,[%i1+%o4]0x89	! Mem[0000000030041408] = 00000000000000ff
!	Mem[0000000010141410] = ffffb58e, %l3 = 0000000000000000
	swapa	[%i5+%o5]0x80,%l3	! %l3 = 00000000ffffb58e
!	Code Fragment 3
p0_fragment_24:
!	%l0 = ffffffffffc595dd
	setx	0x16c087dfcfa2049c,%g7,%l0 ! %l0 = 16c087dfcfa2049c
!	%l1 = 0000000000000000
	setx	0x42daa6b81267783c,%g7,%l1 ! %l1 = 42daa6b81267783c
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 16c087dfcfa2049c
	setx	0x478d53b7ac6c8763,%g7,%l0 ! %l0 = 478d53b7ac6c8763
!	%l1 = 42daa6b81267783c
	setx	0x41416f88511a678f,%g7,%l1 ! %l1 = 41416f88511a678f
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = c5000000, %f16 = ff000000
	lda	[%i3+%o4]0x80,%f16	! %f16 = c5000000

p0_label_199:
!	Mem[0000000030001408] = 00ff0000, %f22 = bad76926
	lda	[%i0+%o4]0x81,%f22	! %f22 = 00ff0000
!	%l5 = ffffffffffffffca, %l1 = 41416f88511a678f, %y  = ffc08ebf
	umul	%l5,%l1,%l3		! %l3 = 511a677de46e27d6, %y = 511a677d
!	Mem[0000000030101400] = 2d000000, %l5 = ffffffffffffffca
	lduba	[%i4+%g0]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000030041410] = 00000000, %f18 = ff00ffff
	lda	[%i1+%o5]0x81,%f18	! %f18 = 00000000
!	Mem[0000000010001410] = ec21de82, %l5 = 0000000000000000
	ldswa	[%i0+%o5]0x80,%l5	! %l5 = ffffffffec21de82
!	Mem[0000000030001400] = 00000000, %l3 = 511a677de46e27d6
	lduha	[%i0+%g0]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000010181408] = ffff0d7300000000, %l5 = ffffffffec21de82
	ldxa	[%i6+%o4]0x80,%l5	! %l5 = ffff0d7300000000
!	Mem[0000000030001400] = 00000000, %l2 = ffffffffffffffff
	ldswa	[%i0+%g0]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000010081408] = 6f32787f0b4100ff, %l5 = ffff0d7300000000
	ldxa	[%i2+%o4]0x88,%l5	! %l5 = 6f32787f0b4100ff
!	Starting 10 instruction Store Burst
!	%l1 = 41416f88511a678f, Mem[00000000300c1408] = af000000
	stha	%l1,[%i3+%o4]0x81	! Mem[00000000300c1408] = 678f0000

p0_label_200:
!	%f28 = 00000000 ffffffb0, %l1 = 41416f88511a678f
!	Mem[0000000030141428] = cfea979e1956777f
	add	%i5,0x028,%g1
	stda	%f28,[%g1+%l1]ASI_PST8_S ! Mem[0000000030141428] = 00ea979effffffb0
!	Mem[0000000010181410] = ffff0000, %l3 = 0000000000000000
	swapa	[%i6+%o5]0x80,%l3	! %l3 = 00000000ffff0000
!	Mem[0000000010001400] = 0000052d, %l5 = 6f32787f0b4100ff
	ldsh	[%i0+0x002],%l5		! %l5 = 000000000000052d
!	%f26 = 5252ffff, %f19 = ff007cff, %f26 = 5252ffff
	fadds	%f26,%f19,%f26		! %f26 = ff007cff
!	%l3 = 00000000ffff0000, Mem[0000000030181410] = 78c52dc578000000
	stxa	%l3,[%i6+%o5]0x81	! Mem[0000000030181410] = 00000000ffff0000
!	%f8  = 00000034 dd95c5ff, Mem[0000000030181408] = 0000410b ffff0000
	stda	%f8 ,[%i6+%o4]0x89	! Mem[0000000030181408] = 00000034 dd95c5ff
!	%l5 = 000000000000052d, Mem[0000000030101410] = 002d007cffffffb0
	stxa	%l5,[%i4+%o5]0x81	! Mem[0000000030101410] = 000000000000052d
!	Mem[0000000010141428] = 8eb50000000021ec, %l1 = 41416f88511a678f, %l5 = 000000000000052d
	add	%i5,0x28,%g1
	casxa	[%g1]0x80,%l1,%l5	! %l5 = 8eb50000000021ec
!	Mem[0000000030141410] = ff5b2bae, %l4 = 000000003400ffdd
	ldstuba	[%i5+%o5]0x81,%l4	! %l4 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = 0000002d, %l6 = 0000000000000000
	ldswa	[%i3+%o5]0x80,%l6	! %l6 = 000000000000002d

p0_label_201:
!	Mem[0000000030001410] = ffffffff, %l2 = 0000000000000000
	ldsba	[%i0+%o5]0x89,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000030081408] = ffff00ff, %l7 = 00000000000000ff
	ldswa	[%i2+%o4]0x89,%l7	! %l7 = ffffffffffff00ff
!	Mem[0000000010141410] = 00000000, %l7 = ffffffffffff00ff
	ldsba	[%i5+%o5]0x80,%l7	! %l7 = 0000000000000000
	membar	#Sync			! Added by membar checker (30)
!	Mem[0000000030081400] = c500005d 000000ff ff00ffff ff007cff
!	Mem[0000000030081410] = ffff0000 000000ff bad76926 00000000
!	Mem[0000000030081420] = 40c32f05 6f00787f 5252ffff 4da2c09a
!	Mem[0000000030081430] = 12e7e1ff ffffffff ada1cdf6 000000ff
	ldda	[%i2]ASI_BLK_SL,%f16	! Block Load from 0000000030081400
!	Mem[0000000020800000] = ff2d98bf, %l4 = 00000000000000ff
	ldsha	[%o1+0x000]%asi,%l4	! %l4 = ffffffffffffff2d
!	Mem[0000000010001408] = ffffffb0, %f3  = 00860000
	lda	[%i0+%o4]0x80,%f3 	! %f3 = ffffffb0
!	Mem[00000000300c1410] = 0000ffff, %l6 = 000000000000002d
	lduha	[%i3+%o5]0x89,%l6	! %l6 = 000000000000ffff
!	Mem[0000000030041410] = 00000000, %l2 = ffffffffffffffff
	ldsba	[%i1+%o5]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000010101434] = 000000ff, %l3 = 00000000ffff0000
	ldswa	[%i4+0x034]%asi,%l3	! %l3 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000010101410] = ffffffb0, %l2 = 0000000000000000
	swapa	[%i4+%o5]0x80,%l2	! %l2 = 00000000ffffffb0

p0_label_202:
!	%l0 = ac6c8763, %l1 = 511a678f, Mem[0000000010181400] = 97340dff 4effffff
	stda	%l0,[%i6+%g0]0x88	! Mem[0000000010181400] = ac6c8763 511a678f
!	%l2 = ffffffb0, %l3 = 000000ff, Mem[0000000030041410] = 00000000 00000000
	stda	%l2,[%i1+%o5]0x89	! Mem[0000000030041410] = ffffffb0 000000ff
!	%l5 = 8eb50000000021ec, Mem[0000000010001400] = 0000052d
	stwa	%l5,[%i0+%g0]0x80	! Mem[0000000010001400] = 000021ec
!	%f15 = 2d00002d, %f0  = 00000000
	fcmps	%fcc0,%f15,%f0 		! %fcc0 = 2
!	%f14 = 5d000000 2d00002d, %l2 = 00000000ffffffb0
!	Mem[0000000010001430] = 000000000b419631
	add	%i0,0x030,%g1
	stda	%f14,[%g1+%l2]ASI_PST16_P ! Mem[0000000010001430] = 000000000b419631
!	%l5 = 8eb50000000021ec, Mem[0000000010081400] = ab91ffffff0000ff
	stxa	%l5,[%i2+%g0]0x88	! Mem[0000000010081400] = 8eb50000000021ec
!	%l0 = 478d53b7ac6c8763, Mem[0000000010141410] = 00000000
	stba	%l0,[%i5+%o5]0x80	! Mem[0000000010141410] = 63000000
!	Mem[0000000030001410] = ffffffff, %l2 = 00000000ffffffb0
	ldstuba	[%i0+%o5]0x89,%l2	! %l2 = 000000ff000000ff
!	%l3 = 00000000000000ff, imm = 00000000000001da, %l6 = 000000000000ffff
	add	%l3,0x1da,%l6		! %l6 = 00000000000002d9
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = ecffffff, %f1  = 00000000
	lda	[%i1+%g0]0x81,%f1 	! %f1 = ecffffff

p0_label_203:
!	Mem[0000000030141400] = ffff00ff, %l2 = 00000000000000ff
	lduba	[%i5+%g0]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[00000000300c1410] = ffff0000, %l0 = 478d53b7ac6c8763
	ldswa	[%i3+%o5]0x81,%l0	! %l0 = ffffffffffff0000
!	Mem[0000000010081408] = ff00410b, %l7 = 0000000000000000
	lduha	[%i2+%o4]0x80,%l7	! %l7 = 000000000000ff00
!	Mem[0000000010181400] = 63876cac, %l4 = ffffffffffffff2d
	ldsha	[%i6+0x002]%asi,%l4	! %l4 = 0000000000006cac
!	%f7  = 0000ffff, %f8  = 00000034, %f9  = dd95c5ff
	fadds	%f7 ,%f8 ,%f9 		! %l0 = ffffffffffff0022, Unfinished, %fsr = 0700000800
!	Mem[0000000030181400] = 9a327504 00008600, %l6 = 000002d9, %l7 = 0000ff00
	ldda	[%i6+%g0]0x89,%l6	! %l6 = 0000000000008600 000000009a327504
!	Mem[0000000010101428] = fffffff6, %l3 = 00000000000000ff
	ldsb	[%i4+0x028],%l3		! %l3 = ffffffffffffffff
!	Mem[0000000010141404] = 00000000, %l5 = 8eb50000000021ec
	lduwa	[%i5+0x004]%asi,%l5	! %l5 = 0000000000000000
!	Mem[0000000010141418] = 037721ff, %l3 = ffffffffffffffff
	ldsh	[%i5+0x01a],%l3		! %l3 = 00000000000021ff
!	Starting 10 instruction Store Burst
!	%l6 = 00008600, %l7 = 9a327504, Mem[0000000010141420] = 0000ffff 00000000
	stda	%l6,[%i5+0x020]%asi	! Mem[0000000010141420] = 00008600 9a327504

p0_label_204:
!	Mem[0000000010101408] = 0b410000, %l6 = 0000000000008600
	swapa	[%i4+%o4]0x80,%l6	! %l6 = 000000000b410000
!	%f2  = 0b410000, %f0  = 00000000, %f10 = fffffff6
	fdivs	%f2 ,%f0 ,%f10		! %f10 = 7f800000
!	Mem[00000000100c1415] = 0000ff00, %l3 = 00000000000021ff
	ldstuba	[%i3+0x015]%asi,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010081400] = 000021ec, %l2 = 00000000000000ff
	ldstuba	[%i2+%g0]0x88,%l2	! %l2 = 000000ec000000ff
!	%f10 = 7f800000, %f12 = ff000000, %f2  = 0b410000
	fsubs	%f10,%f12,%f2 		! %f2  = 7f800000
!	Mem[00000000211c0001] = c5ffc666, %l1 = 41416f88511a678f
	ldstuba	[%o2+0x001]%asi,%l1	! %l1 = 000000ff000000ff
!	%l2 = 00000000000000ec, Mem[00000000100c1408] = c5000000
	stwa	%l2,[%i3+%o4]0x80	! Mem[00000000100c1408] = 000000ec
!	%f4  = ffffffb0, Mem[0000000010141400] = 00000000
	sta	%f4 ,[%i5+%g0]0x88	! Mem[0000000010141400] = ffffffb0
!	Mem[0000000010101400] = 00000000, %l2 = 00000000000000ec
	ldstuba	[%i4+%g0]0x80,%l2	! %l2 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = ddff0034, %l2 = 0000000000000000
	lduha	[%i1+%g0]0x80,%l2	! %l2 = 000000000000ddff

p0_label_205:
!	Code Fragment 4
p0_fragment_25:
!	%l0 = ffffffffffff0022
	setx	0x98d03c7828f3a15e,%g7,%l0 ! %l0 = 98d03c7828f3a15e
!	%l1 = 00000000000000ff
	setx	0x3ef0408058c7384f,%g7,%l1 ! %l1 = 3ef0408058c7384f
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 98d03c7828f3a15e
	setx	0xb727b6901f7848f3,%g7,%l0 ! %l0 = b727b6901f7848f3
!	%l1 = 3ef0408058c7384f
	setx	0xef376957ef85a409,%g7,%l1 ! %l1 = ef376957ef85a409
!	Mem[0000000030001408] = 000000000000ff00, %f24 = 7f78006f 052fc340
	ldda	[%i0+%o4]0x89,%f24	! %f24 = 00000000 0000ff00
!	Mem[0000000010081410] = b9ffffff0000002d, %l4 = 0000000000006cac
	ldxa	[%i2+%o5]0x88,%l4	! %l4 = b9ffffff0000002d
!	%f16 = ff000000, %f28 = ffffffff, %f25 = 0000ff00
	fmuls	%f16,%f28,%f25		! %f25 = ffffffff
!	Mem[0000000030141400] = ff00ffff, %l6 = 000000000b410000
	lduba	[%i5+%g0]0x81,%l6	! %l6 = 00000000000000ff
!	Mem[00000000300c1400] = 2d00002d, %l5 = 0000000000000000
	ldsba	[%i3+%g0]0x81,%l5	! %l5 = 000000000000002d
!	Mem[0000000010181400] = 63876cac8f671a51, %l7 = 000000009a327504
	ldxa	[%i6+%g0]0x80,%l7	! %l7 = 63876cac8f671a51
!	Mem[0000000010081410] = b9ffffff 0000002d, %l0 = 1f7848f3, %l1 = ef85a409
	ldda	[%i2+%o5]0x88,%l0	! %l0 = 000000000000002d 00000000b9ffffff
!	Mem[000000001014143c] = e10ece31, %l6 = 00000000000000ff
	lduba	[%i5+0x03d]%asi,%l6	! %l6 = 000000000000000e
!	Starting 10 instruction Store Burst
!	%l3 = 0000000000000000, %l1 = 00000000b9ffffff, %l6  = 000000000000000e
	mulx	%l3,%l1,%l6		! %l6 = 0000000000000000

p0_label_206:
!	%l3 = 0000000000000000, Mem[00000000300c1410] = ffff0000
	stwa	%l3,[%i3+%o5]0x81	! Mem[00000000300c1410] = 00000000
!	Mem[0000000010041400] = 3400ffdd, %l0 = 000000000000002d
	swapa	[%i1+%g0]0x88,%l0	! %l0 = 000000003400ffdd
!	Mem[0000000010081410] = 2d000000, %l6 = 0000000000000000
	swapa	[%i2+%o5]0x80,%l6	! %l6 = 000000002d000000
!	Mem[0000000010101400] = ff000000, %l5 = 000000000000002d
	ldstuba	[%i4+%g0]0x80,%l5	! %l5 = 000000ff000000ff
!	%l5 = 00000000000000ff, Mem[0000000010141400] = b0ffffff00000000
	stxa	%l5,[%i5+%g0]0x80	! Mem[0000000010141400] = 00000000000000ff
!	%f3  = ffffffb0, Mem[0000000010181414] = ff0000ff
	st	%f3 ,[%i6+0x014]	! Mem[0000000010181414] = ffffffb0
!	Mem[00000000300c1400] = 2d00002d, %l3 = 0000000000000000
	swapa	[%i3+%g0]0x89,%l3	! %l3 = 000000002d00002d
!	%l6 = 000000002d000000, Mem[00000000100c1408] = 000000ec00000000
	stxa	%l6,[%i3+%o4]0x80	! Mem[00000000100c1408] = 000000002d000000
!	%l3 = 000000002d00002d, Mem[0000000010101428] = fffffff6, %asi = 80
	stwa	%l3,[%i4+0x028]%asi	! Mem[0000000010101428] = 2d00002d
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = 00000000, %l2 = 000000000000ddff
	lduwa	[%i6+%o5]0x80,%l2	! %l2 = 0000000000000000

p0_label_207:
!	Mem[0000000010041420] = 0000002d, %l5 = 00000000000000ff
	ldsb	[%i1+0x023],%l5		! %l5 = 000000000000002d
!	Mem[00000000300c1408] = 00008f67, %l1 = 00000000b9ffffff
	ldswa	[%i3+%o4]0x89,%l1	! %l1 = 0000000000008f67
!	Mem[0000000030101400] = 2d000000, %l4 = b9ffffff0000002d
	lduha	[%i4+%g0]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000010141400] = 00000000000000ff, %l7 = 63876cac8f671a51
	ldxa	[%i5+0x000]%asi,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010181404] = 8f671a51, %l0 = 000000003400ffdd
	lduba	[%i6+0x007]%asi,%l0	! %l0 = 0000000000000051
!	Mem[0000000030141408] = ffffb578, %l7 = 00000000000000ff
	ldsha	[%i5+%o4]0x89,%l7	! %l7 = ffffffffffffb578
!	Mem[0000000010101438] = 5d0000002d00002d, %f30 = ff000000 f6cda1ad
	ldd	[%i4+0x038],%f30	! %f30 = 5d000000 2d00002d
!	Mem[00000000300c1400] = 00000000, %l0 = 0000000000000051
	lduwa	[%i3+%g0]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000010041428] = 2d75329a c46788cf, %l2 = 00000000, %l3 = 2d00002d
	ldd	[%i1+0x028],%l2		! %l2 = 000000002d75329a 00000000c46788cf
!	Starting 10 instruction Store Burst
!	%l3 = 00000000c46788cf, Mem[00000000100c1400] = 40c32f05
	stwa	%l3,[%i3+%g0]0x80	! Mem[00000000100c1400] = c46788cf

p0_label_208:
!	%l4 = 00000000, %l5 = 0000002d, Mem[0000000010101410] = 00000000 00000078
	stda	%l4,[%i4+%o5]0x88	! Mem[0000000010101410] = 00000000 0000002d
!	%l0 = 00000000, %l1 = 00008f67, Mem[0000000010141410] = 00000063 ffffffff
	stda	%l0,[%i5+%o5]0x88	! Mem[0000000010141410] = 00000000 00008f67
!	Mem[0000000010181400] = 63876cac, %l1 = 0000000000008f67
	swapa	[%i6+%g0]0x80,%l1	! %l1 = 0000000063876cac
!	%f30 = 5d000000 2d00002d, Mem[0000000030041410] = ffffffb0 000000ff
	stda	%f30,[%i1+%o5]0x89	! Mem[0000000030041410] = 5d000000 2d00002d
!	Mem[0000000010141410] = 00000000, %l0 = 0000000000000000
	swapa	[%i5+%o5]0x88,%l0	! %l0 = 0000000000000000
!	%f17 = 5d0000c5, Mem[0000000010181410] = 00000000
	sta	%f17,[%i6+%o5]0x80	! Mem[0000000010181410] = 5d0000c5
!	%l4 = 00000000, %l5 = 0000002d, Mem[0000000010101410] = 00000000 0000002d
	stda	%l4,[%i4+%o5]0x88	! Mem[0000000010101410] = 00000000 0000002d
!	%l4 = 0000000000000000, Mem[0000000010181412] = 5d0000c5
	stb	%l4,[%i6+0x012]		! Mem[0000000010181410] = 5d0000c5
!	Mem[00000000100c1410] = 0000002d, %l2 = 000000002d75329a
	ldstuba	[%i3+%o5]0x80,%l2	! %l2 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = 00000000, %l0 = 0000000000000000
	lduba	[%i4+%o5]0x88,%l0	! %l0 = 0000000000000000

p0_label_209:
!	Mem[0000000010101400] = ff000000, %l4 = 0000000000000000
	ldsb	[%i4+0x001],%l4		! %l4 = 0000000000000000
!	%f16 = ff000000, %f9  = dd95c5ff, %f20 = ff000000
	fmuls	%f16,%f9 ,%f20		! %f20 = 7f800000
!	Mem[0000000020800040] = 8dff359e, %l0 = 0000000000000000
	ldsha	[%o1+0x040]%asi,%l0	! %l0 = ffffffffffff8dff
!	Mem[0000000010101400] = ff000000, %l7 = ffffffffffffb578
	lduwa	[%i4+%g0]0x80,%l7	! %l7 = 00000000ff000000
!	Mem[0000000010001410] = ec21de82, %l3 = 00000000c46788cf
	ldswa	[%i0+%o5]0x80,%l3	! %l3 = ffffffffec21de82
!	Mem[0000000010141410] = 00000000, %l5 = 000000000000002d
	ldsba	[%i5+%o5]0x80,%l5	! %l5 = 0000000000000000
!	Mem[00000000300c1400] = 00000000, %l4 = 0000000000000000
	lduha	[%i3+%g0]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000010001400] = 000021ec 0000410b, %l2 = 00000000, %l3 = ec21de82
	ldda	[%i0+0x000]%asi,%l2	! %l2 = 00000000000021ec 000000000000410b
!	Mem[0000000010041400] = 0000002d, %l1 = 0000000063876cac
	lduha	[%i1+%g0]0x88,%l1	! %l1 = 000000000000002d
!	Starting 10 instruction Store Burst
!	Mem[0000000021800141] = ffc5cd46, %l3 = 000000000000410b
	ldstub	[%o3+0x141],%l3		! %l3 = 000000c5000000ff

p0_label_210:
!	%l0 = ffff8dff, %l1 = 0000002d, Mem[0000000010181400] = 678f0000 511a678f
	stda	%l0,[%i6+%g0]0x88	! Mem[0000000010181400] = ffff8dff 0000002d
!	%f24 = 00000000 ffffffff, Mem[0000000010101438] = 5d000000 2d00002d
	std	%f24,[%i4+0x038]	! Mem[0000000010101438] = 00000000 ffffffff
!	%f8  = 00000034 dd95c5ff, %l0 = ffffffffffff8dff
!	Mem[0000000010081420] = c78dcd1f00000000
	add	%i2,0x020,%g1
	stda	%f8,[%g1+%l0]ASI_PST16_P ! Mem[0000000010081420] = 00000034dd95c5ff
!	Mem[0000000010141400] = 00000000, %l6 = 000000002d000000
	swapa	[%i5+%g0]0x80,%l6	! %l6 = 0000000000000000
!	%l3 = 00000000000000c5, Mem[0000000010141408] = 8eb5ffff
	stha	%l3,[%i5+%o4]0x88	! Mem[0000000010141408] = 8eb500c5
!	Mem[0000000010181408] = ffff0d73, %l5 = 0000000000000000
	swapa	[%i6+%o4]0x80,%l5	! %l5 = 00000000ffff0d73
!	%l0 = ffffffffffff8dff, Mem[0000000010001417] = ff000034
	stb	%l0,[%i0+0x017]		! Mem[0000000010001414] = ff0000ff
!	Mem[0000000010181410] = 5d0000c5, %l5 = 00000000ffff0d73
	swapa	[%i6+%o5]0x80,%l5	! %l5 = 000000005d0000c5
!	%f16 = ff000000 5d0000c5 ff7c00ff ffff00ff
!	%f20 = 7f800000 0000ffff 00000000 2669d7ba
!	%f24 = 00000000 ffffffff 9ac0a24d ffff5252
!	%f28 = ffffffff ffe1e712 5d000000 2d00002d
	stda	%f16,[%i1]ASI_BLK_AIUSL	! Block Store to 0000000030041400
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = c500b58e7fffffff, %l3 = 00000000000000c5
	ldxa	[%i5+%o4]0x80,%l3	! %l3 = c500b58e7fffffff

p0_label_211:
!	Mem[00000000100c1400] = c46788cf6f00787f, %l3 = c500b58e7fffffff
	ldxa	[%i3+%g0]0x80,%l3	! %l3 = c46788cf6f00787f
!	Mem[00000000300c1408] = 678f0000, %f11 = 00000000
	lda	[%i3+%o4]0x81,%f11	! %f11 = 678f0000
!	Mem[0000000030081410] = 0000ffff, %l1 = 000000000000002d
	lduba	[%i2+%o5]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030181400] = 00008600, %l0 = ffffffffffff8dff
	ldsha	[%i6+%g0]0x89,%l0	! %l0 = ffffffffffff8600
!	Mem[0000000030001410] = 0000ffffffffffff, %l2 = 00000000000021ec
	ldxa	[%i0+%o5]0x89,%l2	! %l2 = 0000ffffffffffff
!	Mem[0000000010181404] = 2d000000, %l1 = 00000000000000ff
	lduha	[%i6+0x006]%asi,%l1	! %l1 = 0000000000000000
!	Mem[0000000030141410] = ae2b5bff, %l1 = 0000000000000000
	ldsba	[%i5+%o5]0x89,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000030101410] = 00000000, %l2 = 0000ffffffffffff
	lduwa	[%i4+%o5]0x81,%l2	! %l2 = 0000000000000000
	membar	#Sync			! Added by membar checker (31)
!	Mem[0000000010041410] = 2d00000000000000, %f0  = 00000000 ecffffff
	ldd	[%i1+%o5],%f0 		! %f0  = 2d000000 00000000
!	Starting 10 instruction Store Burst
!	%f18 = ff7c00ff, Mem[0000000030181408] = dd95c5ff
	sta	%f18,[%i6+%o4]0x89	! Mem[0000000030181408] = ff7c00ff

p0_label_212:
!	%f16 = ff000000 5d0000c5, %l3 = c46788cf6f00787f
!	Mem[0000000010001430] = 000000000b419631
	add	%i0,0x030,%g1
	stda	%f16,[%g1+%l3]ASI_PST8_P ! Mem[0000000010001430] = 000000005d0000c5
!	%l6 = 0000000000000000, Mem[0000000030001408] = 00ff0000
	stba	%l6,[%i0+%o4]0x81	! Mem[0000000030001408] = 00ff0000
!	Mem[0000000010001408] = b0ffffff, %l4 = 0000000000000000
	swapa	[%i0+%o4]0x88,%l4	! %l4 = 00000000b0ffffff
!	%l7 = 00000000ff000000, Mem[0000000010041410] = 0000002d
	stha	%l7,[%i1+%o5]0x88	! Mem[0000000010041410] = 00000000
!	Mem[000000001004141c] = 0a7a7b57, %l2 = 0000000000000000, %asi = 80
	swapa	[%i1+0x01c]%asi,%l2	! %l2 = 000000000a7a7b57
!	%f2  = 7f800000 ffffffb0, Mem[0000000010041408] = 00000000 7fffffff
	stda	%f2 ,[%i1+%o4]0x80	! Mem[0000000010041408] = 7f800000 ffffffb0
!	%l0 = ffffffffffff8600, Mem[00000000201c0000] = ffff6bf6, %asi = 80
	stba	%l0,[%o0+0x000]%asi	! Mem[00000000201c0000] = 00ff6bf6
!	%f18 = ff7c00ff ffff00ff, %l4 = 00000000b0ffffff
!	Mem[00000000100c1420] = 7f78006f052fc340
	add	%i3,0x020,%g1
	stda	%f18,[%g1+%l4]ASI_PST8_PL ! Mem[00000000100c1420] = ff00ffffff007cff
!	Mem[0000000030181400] = 00860000, %l6 = 0000000000000000
	ldstuba	[%i6+%g0]0x81,%l6	! %l6 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030101410] = 00000000, %l6 = 0000000000000000
	lduba	[%i4+%o5]0x89,%l6	! %l6 = 0000000000000000

p0_label_213:
!	Mem[00000000300c1400] = 00000000000000ff, %f20 = 7f800000 0000ffff
	ldda	[%i3+%g0]0x81,%f20	! %f20 = 00000000 000000ff
!	Mem[0000000030101408] = 00000000, %l4 = 00000000b0ffffff
	ldsba	[%i4+%o4]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000030041400] = ff0000005d0000c5, %l7 = 00000000ff000000
	ldxa	[%i1+%g0]0x89,%l7	! %l7 = ff0000005d0000c5
!	Mem[00000000300c1410] = 5d00000000000000, %f16 = ff000000 5d0000c5
	ldda	[%i3+%o5]0x89,%f16	! %f16 = 5d000000 00000000
!	Mem[0000000010081400] = 000021ff, %l5 = 000000005d0000c5
	ldsba	[%i2+%g0]0x88,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000030141408] = ffffa95dffffb578, %l2 = 000000000a7a7b57
	ldxa	[%i5+%o4]0x89,%l2	! %l2 = ffffa95dffffb578
!	Code Fragment 3
p0_fragment_26:
!	%l0 = ffffffffffff8600
	setx	0xecaa8758190fa3fb,%g7,%l0 ! %l0 = ecaa8758190fa3fb
!	%l1 = ffffffffffffffff
	setx	0xd16be0901ecf187c,%g7,%l1 ! %l1 = d16be0901ecf187c
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = ecaa8758190fa3fb
	setx	0x24aabff85d5f39b0,%g7,%l0 ! %l0 = 24aabff85d5f39b0
!	%l1 = d16be0901ecf187c
	setx	0x1ab59b08048c4cce,%g7,%l1 ! %l1 = 1ab59b08048c4cce
!	%f29 = ffe1e712, %f15 = 2d00002d, %f26 = 9ac0a24d ffff5252
	fsmuld	%f29,%f15,%f26		! %f26 = fffc3ce2 40000000
!	Mem[0000000010181400] = ffff8dff, %l2 = ffffa95dffffb578
	lduba	[%i6+%g0]0x88,%l2	! %l2 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Code Fragment 3
p0_fragment_27:
!	%l0 = 24aabff85d5f39b0
	setx	0x7d187ec0401362c4,%g7,%l0 ! %l0 = 7d187ec0401362c4
!	%l1 = 1ab59b08048c4cce
	setx	0x4648643fe7d023b5,%g7,%l1 ! %l1 = 4648643fe7d023b5
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 7d187ec0401362c4
	setx	0x4e9579778ce27c23,%g7,%l0 ! %l0 = 4e9579778ce27c23
!	%l1 = 4648643fe7d023b5
	setx	0x656d5f10222d63dc,%g7,%l1 ! %l1 = 656d5f10222d63dc

p0_label_214:
!	%f18 = ff7c00ff ffff00ff, Mem[0000000010001438] = 0e0671aa 00000000
	stda	%f18,[%i0+0x038]%asi	! Mem[0000000010001438] = ff7c00ff ffff00ff
!	%l5 = ffffffffffffffff, Mem[0000000030041408] = ff00ffffff007cff
	stxa	%l5,[%i1+%o4]0x81	! Mem[0000000030041408] = ffffffffffffffff
!	Mem[0000000010101433] = ff000000, %l0 = 4e9579778ce27c23
	ldstuba	[%i4+0x033]%asi,%l0	! %l0 = 00000000000000ff
!	%f0  = 2d000000 00000000 7f800000 ffffffb0
!	%f4  = ffffffb0 78000000 5d000000 0000ffff
!	%f8  = 00000034 dd95c5ff 7f800000 678f0000
!	%f12 = ff000000 000000ff 5d000000 2d00002d
	stda	%f0,[%i2]ASI_COMMIT_S	! Block Store to 0000000030081400
!	Mem[00000000211c0000] = c5ffc666, %l6 = 0000000000000000
	ldstuba	[%o2+0x000]%asi,%l6	! %l6 = 000000c5000000ff
!	%l2 = 00000000000000ff, Mem[0000000030041408] = ffffffff
	stwa	%l2,[%i1+%o4]0x81	! Mem[0000000030041408] = 000000ff
!	%l7 = ff0000005d0000c5, Mem[000000001018143a] = ff000000
	sth	%l7,[%i6+0x03a]		! Mem[0000000010181438] = ff0000c5
!	%l4 = 0000000000000000, Mem[0000000010181410] = 730dffff
	stba	%l4,[%i6+%o5]0x88	! Mem[0000000010181410] = 730dff00
	membar	#Sync			! Added by membar checker (32)
!	Mem[000000001008143c] = 000000ff, %l4 = 0000000000000000
	swap	[%i2+0x03c],%l4		! %l4 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = 7f800000, %l3 = c46788cf6f00787f
	lduba	[%i1+%o4]0x80,%l3	! %l3 = 000000000000007f

p0_label_215:
!	Mem[0000000010141400] = 0000002d, %l2 = 00000000000000ff
	lduwa	[%i5+%g0]0x88,%l2	! %l2 = 000000000000002d
!	Mem[0000000030001410] = ffffffff, %l1 = 656d5f10222d63dc
	lduba	[%i0+%o5]0x89,%l1	! %l1 = 00000000000000ff
!	%l4 = 00000000000000ff, %l4 = 00000000000000ff, %l3 = 000000000000007f
	xnor	%l4,%l4,%l3		! %l3 = ffffffffffffffff
!	Mem[0000000010081410] = 00000000ffffffb9, %l0 = 0000000000000000
	ldxa	[%i2+%o5]0x80,%l0	! %l0 = 00000000ffffffb9
!	Mem[0000000030001410] = ffffffff, %l4 = 00000000000000ff
	lduha	[%i0+%o5]0x89,%l4	! %l4 = 000000000000ffff
!	Mem[00000000300c1410] = 00000000, %f13 = 000000ff
	lda	[%i3+%o5]0x89,%f13	! %f13 = 00000000
!	Mem[0000000030181410] = 00000000, %l3 = ffffffffffffffff
	ldsba	[%i6+%o5]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000030181408] = ff007cff 34000000, %l6 = 000000c5, %l7 = 5d0000c5
	ldda	[%i6+%o4]0x81,%l6	! %l6 = 00000000ff007cff 0000000034000000
!	%l3 = 0000000000000000, %l3 = 0000000000000000, %l3 = 0000000000000000
	orn	%l3,%l3,%l3		! %l3 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l1 = 00000000000000ff, Mem[00000000201c0001] = 00ff6bf6
	stb	%l1,[%o0+0x001]		! Mem[00000000201c0000] = 00ff6bf6

p0_label_216:
!	Mem[0000000010001418] = 90ffde48, %l6 = 00000000ff007cff
	swap	[%i0+0x018],%l6		! %l6 = 0000000090ffde48
!	%l0 = 00000000ffffffb9, Mem[0000000030081408] = b0ffffff0000807f
	stxa	%l0,[%i2+%o4]0x89	! Mem[0000000030081408] = 00000000ffffffb9
!	%l0 = 00000000ffffffb9, Mem[0000000010101410] = 00000000
	stha	%l0,[%i4+%o5]0x88	! Mem[0000000010101410] = 0000ffb9
!	%l7 = 0000000034000000, Mem[0000000030181410] = 00000000
	stha	%l7,[%i6+%o5]0x81	! Mem[0000000030181410] = 00000000
!	Mem[0000000010101408] = 00008600, %l6 = 0000000090ffde48
	swapa	[%i4+%o4]0x80,%l6	! %l6 = 0000000000008600
!	%f2  = 7f800000 ffffffb0, %l2 = 000000000000002d
!	Mem[0000000030101400] = 0000002d000021ec
	stda	%f2,[%i4+%l2]ASI_PST8_S ! Mem[0000000030101400] = 0000002dffff21b0
!	%f23 = 2669d7ba, Mem[0000000030001400] = 00000000
	sta	%f23,[%i0+%g0]0x81	! Mem[0000000030001400] = 2669d7ba
!	%l0 = ffffffb9, %l1 = 000000ff, Mem[0000000010101400] = ff000000 00000000
	stda	%l0,[%i4+%g0]0x80	! Mem[0000000010101400] = ffffffb9 000000ff
!	Mem[00000000201c0000] = 00ff6bf6, %l4 = 000000000000ffff
	ldstuba	[%o0+0x000]%asi,%l4	! %l4 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	%l1 = 00000000000000ff, immed = 00000998, %y  = 511a677d
	umul	%l1,0x998,%l2		! %l2 = 0000000000098e68, %y = 00000000

p0_label_217:
!	Mem[0000000030141408] = 78b5ffff, %l0 = 00000000ffffffb9
	lduba	[%i5+%o4]0x81,%l0	! %l0 = 0000000000000078
!	Mem[0000000030141410] = ff5b2baef7899d86, %f10 = 7f800000 678f0000
	ldda	[%i5+%o5]0x81,%f10	! %f10 = ff5b2bae f7899d86
!	Mem[00000000100c1410] = 2d0000ff, %f8  = 00000034
	lda	[%i3+%o5]0x88,%f8 	! %f8 = 2d0000ff
!	Mem[0000000010101410] = b9ff0000, %f3  = ffffffb0
	lda	[%i4+%o5]0x80,%f3 	! %f3 = b9ff0000
!	%l7 = 0000000034000000, %l0 = 0000000000000078, %l5 = ffffffffffffffff
	sub	%l7,%l0,%l5		! %l5 = 0000000033ffff88
!	%f10 = ff5b2bae, %f20 = 00000000
	fcmps	%fcc3,%f10,%f20		! %fcc3 = 1
!	%l0 = 0000000000000078, immed = fffffa2d, %y  = 00000000
	smul	%l0,-0x5d3,%l0		! %l0 = fffffffffffd4518, %y = ffffffff
!	Mem[0000000010041408] = b0ffffff0000807f, %l6 = 0000000000008600
	ldxa	[%i1+%o4]0x88,%l6	! %l6 = b0ffffff0000807f
!	Mem[0000000030141410] = ff5b2bae, %l6 = b0ffffff0000807f
	lduha	[%i5+%o5]0x81,%l6	! %l6 = 000000000000ff5b
!	Starting 10 instruction Store Burst
!	%l1 = 00000000000000ff, Mem[0000000030041400] = c500005d000000ff
	stxa	%l1,[%i1+%g0]0x81	! Mem[0000000030041400] = 00000000000000ff

p0_label_218:
!	%l1 = 00000000000000ff, Mem[0000000010181430] = 5d6c91ff894dd97c
	stx	%l1,[%i6+0x030]		! Mem[0000000010181430] = 00000000000000ff
!	%l7 = 0000000034000000, Mem[000000001018140e] = 00000000, %asi = 80
	stha	%l7,[%i6+0x00e]%asi	! Mem[000000001018140c] = 00000000
!	%l3 = ffffffffffffffff, Mem[0000000030181400] = 000086ff
	stwa	%l3,[%i6+%g0]0x89	! Mem[0000000030181400] = ffffffff
!	%l4 = 0000000000000000, Mem[0000000010041408] = 0000807f
	stwa	%l4,[%i1+%o4]0x88	! Mem[0000000010041408] = 00000000
!	Mem[0000000010101428] = 2d00002d, %l4 = 00000000, %l4 = 00000000
	add	%i4,0x28,%g1
	casa	[%g1]0x80,%l4,%l4	! %l4 = 000000002d00002d
!	%l4 = 000000002d00002d, Mem[00000000211c0000] = ffffc666
	sth	%l4,[%o2+%g0]		! Mem[00000000211c0000] = 002dc666
!	%l0 = fffffffffffd4518, Mem[0000000010041408] = b0ffffff00000000
	stxa	%l0,[%i1+%o4]0x88	! Mem[0000000010041408] = fffffffffffd4518
!	%l4 = 000000002d00002d, Mem[00000000218001c0] = 000813ce, %asi = 80
	stha	%l4,[%o3+0x1c0]%asi	! Mem[00000000218001c0] = 002d13ce
!	Mem[00000000100c1408] = 00000000, %l6 = 000000000000ff5b
	swapa	[%i3+%o4]0x88,%l6	! %l6 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = 0000ffff, %l0 = fffffffffffd4518
	ldswa	[%i1+%o5]0x89,%l0	! %l0 = 000000000000ffff

p0_label_219:
!	Mem[00000000100c1408] = 5bff0000, %l4 = 000000002d00002d
	lduba	[%i3+%o4]0x80,%l4	! %l4 = 000000000000005b
!	Mem[0000000010041400] = 0000002d, %l2 = 0000000000098e68
	lduba	[%i1+%g0]0x88,%l2	! %l2 = 000000000000002d
!	Mem[0000000010181430] = 00000000000000ff, %l7 = 0000000034000000
	ldxa	[%i6+0x030]%asi,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030181400] = ffffffff, %l3 = ffffffffffffffff
	lduwa	[%i6+%g0]0x89,%l3	! %l3 = 00000000ffffffff
!	Mem[0000000010081408] = ff00410b, %l0 = 000000000000ffff
	lduwa	[%i2+%o4]0x80,%l0	! %l0 = 00000000ff00410b
!	Mem[0000000010001400] = 0b410000ec210000, %f10 = ff5b2bae f7899d86
	ldda	[%i0+%g0]0x88,%f10	! %f10 = 0b410000 ec210000
!	Mem[0000000010181410] = 00ff0d73ffffffb0, %f10 = 0b410000 ec210000
	ldda	[%i6+%o5]0x80,%f10	! %f10 = 00ff0d73 ffffffb0
!	Mem[0000000010001404] = 0000410b, %f23 = 2669d7ba
	lda	[%i0+0x004]%asi,%f23	! %f23 = 0000410b
!	Mem[0000000010041408] = 1845fdffffffffff, %l3 = 00000000ffffffff
	ldxa	[%i1+%o4]0x80,%l3	! %l3 = 1845fdffffffffff
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1410] = 00000000, %l1 = 00000000000000ff
	ldstuba	[%i3+%o5]0x89,%l1	! %l1 = 00000000000000ff

p0_label_220:
!	Mem[0000000010181431] = 00000000, %l0 = 00000000ff00410b
	ldstub	[%i6+0x031],%l0		! %l0 = 00000000000000ff
!	%l0 = 00000000, %l1 = 00000000, Mem[0000000030181400] = ffffffff 9a327504
	stda	%l0,[%i6+%g0]0x89	! Mem[0000000030181400] = 00000000 00000000
!	%l4 = 000000000000005b, Mem[00000000300c1408] = 00008f67
	stba	%l4,[%i3+%o4]0x89	! Mem[00000000300c1408] = 00008f5b
!	%l6 = 00000000, %l7 = 000000ff, Mem[0000000010101438] = 00000000 ffffffff
	stda	%l6,[%i4+0x038]%asi	! Mem[0000000010101438] = 00000000 000000ff
!	%f16 = 5d000000 00000000 ff7c00ff ffff00ff
!	%f20 = 00000000 000000ff 00000000 0000410b
!	%f24 = 00000000 ffffffff fffc3ce2 40000000
!	%f28 = ffffffff ffe1e712 5d000000 2d00002d
	stda	%f16,[%i2]ASI_BLK_S	! Block Store to 0000000030081400
!	%f2  = 7f800000 b9ff0000, Mem[00000000300c1408] = 00008f5b 0000ffff
	stda	%f2 ,[%i3+%o4]0x89	! Mem[00000000300c1408] = 7f800000 b9ff0000
!	Mem[0000000010181408] = 00000000, %l1 = 0000000000000000
	swapa	[%i6+%o4]0x80,%l1	! %l1 = 0000000000000000
	membar	#Sync			! Added by membar checker (33)
!	Mem[0000000010081400] = ff210000, %l1 = 0000000000000000
	ldstuba	[%i2+%g0]0x80,%l1	! %l1 = 000000ff000000ff
!	%l1 = 00000000000000ff, Mem[00000000100c142c] = c5ff5252
	stw	%l1,[%i3+0x02c]		! Mem[00000000100c142c] = 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = 5d000000 00000000 ff7c00ff ffff00ff
!	Mem[0000000030081410] = 00000000 000000ff 00000000 0000410b
!	Mem[0000000030081420] = 00000000 ffffffff fffc3ce2 40000000
!	Mem[0000000030081430] = ffffffff ffe1e712 5d000000 2d00002d
	ldda	[%i2]ASI_BLK_S,%f0	! Block Load from 0000000030081400

p0_label_221:
!	Mem[0000000020800040] = 8dff359e, %l0 = 0000000000000000
	lduba	[%o1+0x040]%asi,%l0	! %l0 = 000000000000008d
!	Mem[0000000030101400] = 2d000000, %l0 = 000000000000008d
	lduha	[%i4+%g0]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000030041400] = 00000000, %l5 = 0000000033ffff88
	lduha	[%i1+%g0]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000030101410] = 00000000, %l6 = 0000000000000000
	ldsha	[%i4+%o5]0x81,%l6	! %l6 = 0000000000000000
!	%l1 = 00000000000000ff, Mem[000000001008141f] = 0b419631, %asi = 80
	stba	%l1,[%i2+0x01f]%asi	! Mem[000000001008141c] = 0b4196ff
!	Mem[0000000010081400] = ff210000 0000b58e, %l2 = 0000002d, %l3 = ffffffff
	ldda	[%i2+%g0]0x80,%l2	! %l2 = 00000000ff210000 000000000000b58e
!	Mem[00000000300c1408] = b9ff0000, %f26 = fffc3ce2
	lda	[%i3+%o4]0x89,%f26	! %f26 = b9ff0000
!	Mem[0000000010101410] = b9ff0000, %l5 = 0000000000000000
	lduha	[%i4+%o5]0x80,%l5	! %l5 = 000000000000b9ff
!	Mem[0000000030041408] = ff000000, %f16 = 5d000000
	lda	[%i1+%o4]0x89,%f16	! %f16 = ff000000
!	Starting 10 instruction Store Burst
!	%l2 = ff210000, %l3 = 0000b58e, Mem[0000000010181408] = 00000000 00000000
	stda	%l2,[%i6+%o4]0x88	! Mem[0000000010181408] = ff210000 0000b58e

p0_label_222:
!	Mem[00000000100c1414] = 00ffff00, %l5 = 000000000000b9ff
	swap	[%i3+0x014],%l5		! %l5 = 0000000000ffff00
!	%f22 = 00000000, Mem[0000000010041410] = 00000000
	sta	%f22,[%i1+%o5]0x88	! Mem[0000000010041410] = 00000000
!	%f24 = 00000000 ffffffff, Mem[0000000010181408] = 000021ff 8eb50000
	stda	%f24,[%i6+%o4]0x80	! Mem[0000000010181408] = 00000000 ffffffff
!	%l7 = 00000000000000ff, Mem[000000001008140b] = ff00410b
	stb	%l7,[%i2+0x00b]		! Mem[0000000010081408] = ff0041ff
!	%l5 = 0000000000ffff00, Mem[0000000030101410] = 00000000
	stha	%l5,[%i4+%o5]0x89	! Mem[0000000030101410] = 0000ff00
!	%f16 = ff000000 00000000, Mem[0000000030141410] = ae2b5bff 869d89f7
	stda	%f16,[%i5+%o5]0x89	! Mem[0000000030141410] = ff000000 00000000
!	%l6 = 00000000, %l7 = 000000ff, Mem[0000000010141408] = c500b58e 7fffffff
	stda	%l6,[%i5+%o4]0x80	! Mem[0000000010141408] = 00000000 000000ff
!	Mem[0000000010141412] = 00000000, %l5 = 0000000000ffff00
	ldstub	[%i5+0x012],%l5		! %l5 = 00000000000000ff
!	%f16 = ff000000 00000000, Mem[0000000030181400] = 00000000 00000000
	stda	%f16,[%i6+%g0]0x81	! Mem[0000000030181400] = ff000000 00000000
!	Starting 10 instruction Load Burst
!	%l3 = 000000000000b58e, %l1 = 00000000000000ff, %l4 = 000000000000005b
	sub	%l3,%l1,%l4		! %l4 = 000000000000b48f

p0_label_223:
!	Mem[0000000030181400] = 000000ff, %l3 = 000000000000b58e
	ldsba	[%i6+%g0]0x89,%l3	! %l3 = ffffffffffffffff
!	%f18 = ff7c00ff, %f23 = 0000410b, %f23 = 0000410b
	fadds	%f18,%f23,%f23		! %l0 = 0000000000000022, Unfinished, %fsr = 1700000800
!	Mem[00000000300c1408] = 0000ffb9, %l5 = 0000000000000000
	lduwa	[%i3+%o4]0x81,%l5	! %l5 = 000000000000ffb9
!	Mem[0000000010081400] = 000021ff, %l6 = 0000000000000000
	ldsba	[%i2+%g0]0x88,%l6	! %l6 = ffffffffffffffff
!	Mem[00000000211c0000] = 002dc666, %l4 = 000000000000b48f
	ldsb	[%o2+0x001],%l4		! %l4 = 000000000000002d
!	Mem[0000000010001400] = 000021ec, %f29 = ffe1e712
	lda	[%i0+%g0]0x80,%f29	! %f29 = 000021ec
!	Mem[0000000030101410] = 0000ff00, %l0 = 0000000000000022
	ldswa	[%i4+%o5]0x89,%l0	! %l0 = 000000000000ff00
!	Mem[0000000010141408] = 00000000, %l5 = 000000000000ffb9
	lduwa	[%i5+%o4]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000030081400] = 0000005d, %l6 = ffffffffffffffff
	ldsba	[%i2+%g0]0x89,%l6	! %l6 = 000000000000005d
!	Starting 10 instruction Store Burst
!	Mem[0000000010181400] = ff8dffff, %l7 = 00000000000000ff
	ldsha	[%i6+%g0]0x80,%l7	! %l7 = ffffffffffffff8d

p0_label_224:
!	%l2 = 00000000ff210000, Mem[0000000010141400] = 0000002d
	stha	%l2,[%i5+%g0]0x88	! Mem[0000000010141400] = 00000000
!	Mem[0000000010181400] = ffff8dff, %l3 = ffffffffffffffff
	ldstuba	[%i6+%g0]0x88,%l3	! %l3 = 000000ff000000ff
!	%l0 = 000000000000ff00, Mem[0000000030181400] = 000000ff
	stha	%l0,[%i6+%g0]0x89	! Mem[0000000030181400] = 0000ff00
!	Mem[0000000030181400] = 0000ff00, %l7 = ffffffffffffff8d
	swapa	[%i6+%g0]0x89,%l7	! %l7 = 000000000000ff00
!	%l2 = 00000000ff210000, Mem[0000000010081408] = 6f32787fff4100ff
	stxa	%l2,[%i2+%o4]0x88	! Mem[0000000010081408] = 00000000ff210000
!	Mem[00000000201c0000] = ffff6bf6, %l0 = 000000000000ff00
	ldstuba	[%o0+0x000]%asi,%l0	! %l0 = 000000ff000000ff
!	%l6 = 0000005d, %l7 = 0000ff00, Mem[0000000030001410] = ffffffff 0000ffff
	stda	%l6,[%i0+%o5]0x89	! Mem[0000000030001410] = 0000005d 0000ff00
!	%l5 = 0000000000000000, Mem[0000000010041408] = 1845fdff
	stwa	%l5,[%i1+%o4]0x80	! Mem[0000000010041408] = 00000000
!	Mem[0000000030001400] = 2669d7ba, %l5 = 0000000000000000
	ldstuba	[%i0+%g0]0x81,%l5	! %l5 = 00000026000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = 2d00000000000000, %f26 = b9ff0000 40000000
	ldda	[%i4+%o4]0x89,%f26	! %f26 = 2d000000 00000000

p0_label_225:
!	Mem[0000000010181420] = 00000000, %l1 = 00000000000000ff
	ldsba	[%i6+0x022]%asi,%l1	! %l1 = 0000000000000000
	membar	#Sync			! Added by membar checker (34)
!	Mem[0000000010181400] = ff8dffff 2d000000 00000000 ffffffff
!	Mem[0000000010181410] = 00ff0d73 ffffffb0 00000000 4eff47ef
!	Mem[0000000010181420] = 00000000 159a9631 bb47b886 92e6fbc0
!	Mem[0000000010181430] = 00ff0000 000000ff ff0000c5 000000ff
	ldda	[%i6]ASI_BLK_AIUP,%f16	! Block Load from 0000000010181400
!	Mem[0000000010141408] = 00000000, %l3 = 00000000000000ff
	lduwa	[%i5+%o4]0x88,%l3	! %l3 = 0000000000000000
!	Mem[00000000100c1410] = 2d0000ff, %l3 = 0000000000000000
	lduba	[%i3+%o5]0x88,%l3	! %l3 = 00000000000000ff
!	%l4 = 000000000000002d, imm = 0000000000000de8, %l0 = 00000000000000ff
	xnor	%l4,0xde8,%l0		! %l0 = fffffffffffff23a
!	Mem[00000000201c0000] = ffff6bf6, %l3 = 00000000000000ff
	lduha	[%o0+0x000]%asi,%l3	! %l3 = 000000000000ffff
!	Mem[0000000010001438] = ff7c00ff, %l1 = 0000000000000000
	lduha	[%i0+0x03a]%asi,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010081408] = 00000000ff210000, %l2 = 00000000ff210000
	ldxa	[%i2+%o4]0x88,%l2	! %l2 = 00000000ff210000
!	Mem[0000000010001400] = 000021ec, %l7 = 000000000000ff00
	lduha	[%i0+%g0]0x80,%l7	! %l7 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f11 = 40000000, Mem[0000000030181400] = ffffff8d
	sta	%f11,[%i6+%g0]0x89	! Mem[0000000030181400] = 40000000

p0_label_226:
!	%l3 = 000000000000ffff, Mem[0000000030001410] = 0000005d
	stba	%l3,[%i0+%o5]0x89	! Mem[0000000030001410] = 000000ff
!	Mem[0000000010141410] = 00ff0000, %l1 = 00000000000000ff
	ldstuba	[%i5+%o5]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010001408] = 00000000, %l6 = 000000000000005d
	swapa	[%i0+%o4]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000021800141] = ffffcd46, %l1 = 0000000000000000
	ldstuba	[%o3+0x141]%asi,%l1	! %l1 = 000000ff000000ff
!	Mem[00000000100c140c] = 2d000000, %l5 = 0000000000000026
	swap	[%i3+0x00c],%l5		! %l5 = 000000002d000000
!	Mem[00000000100c1410] = 2d0000ff, %l4 = 000000000000002d
	ldstuba	[%i3+%o5]0x88,%l4	! %l4 = 000000ff000000ff
!	%l6 = 0000000000000000, Mem[0000000010041438] = bad76926e1ffce31, %asi = 80
	stxa	%l6,[%i1+0x038]%asi	! Mem[0000000010041438] = 0000000000000000
!	%l7 = 0000000000000000, Mem[0000000030041410] = 0000ffff
	stwa	%l7,[%i1+%o5]0x89	! Mem[0000000030041410] = 00000000
!	%l1 = 00000000000000ff, Mem[0000000030081408] = ff007cff
	stha	%l1,[%i2+%o4]0x89	! Mem[0000000030081408] = ff0000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = 00000000, %l2 = 00000000ff210000
	ldsha	[%i6+%o4]0x80,%l2	! %l2 = 0000000000000000

p0_label_227:
!	Mem[0000000010141400] = 00000000, %f6  = 00000000
	lda	[%i5+%g0]0x80,%f6 	! %f6 = 00000000
!	Mem[00000000300c1408] = b9ff0000, %f3  = ffff00ff
	lda	[%i3+%o4]0x89,%f3 	! %f3 = b9ff0000
!	Mem[0000000010081408] = ff210000, %l0 = fffffffffffff23a
	ldsba	[%i2+%o4]0x88,%l0	! %l0 = 0000000000000000
!	Mem[000000001018141c] = 4eff47ef, %l6 = 0000000000000000
	lduba	[%i6+0x01c]%asi,%l6	! %l6 = 000000000000004e
!	Mem[0000000020800000] = ff2d98bf, %l2 = 0000000000000000
	lduha	[%o1+0x000]%asi,%l2	! %l2 = 000000000000ff2d
!	Mem[0000000021800100] = 4905ee79, %l1 = 00000000000000ff
	ldsh	[%o3+0x100],%l1		! %l1 = 0000000000004905
!	Mem[0000000010101428] = 2d00002d 00000000, %l0 = 00000000, %l1 = 00004905
	ldd	[%i4+0x028],%l0		! %l0 = 000000002d00002d 0000000000000000
!	Mem[0000000030001408] = 00000000 0000ff00, %l4 = 000000ff, %l5 = 2d000000
	ldda	[%i0+%o4]0x89,%l4	! %l4 = 000000000000ff00 0000000000000000
!	Mem[0000000030001410] = ff000000, %l0 = 000000002d00002d
	lduha	[%i0+%o5]0x81,%l0	! %l0 = 000000000000ff00
!	Starting 10 instruction Store Burst
!	Mem[0000000030141400] = ffff00ff, %l6 = 000000000000004e
	swapa	[%i5+%g0]0x89,%l6	! %l6 = 00000000ffff00ff

p0_label_228:
!	%f0  = 5d000000 00000000, Mem[0000000030041408] = ff000000 ffffffff
	stda	%f0 ,[%i1+%o4]0x89	! Mem[0000000030041408] = 5d000000 00000000
!	%f0  = 5d000000 00000000, %l7 = 0000000000000000
!	Mem[0000000030001420] = 5e1274e7a4e0e78b
	add	%i0,0x020,%g1
	stda	%f0,[%g1+%l7]ASI_PST32_S ! Mem[0000000030001420] = 5e1274e7a4e0e78b
!	Mem[000000001000143f] = ffff00ff, %l7 = 0000000000000000
	ldstub	[%i0+0x03f],%l7		! %l7 = 000000ff000000ff
!	Mem[0000000030081410] = 00000000, %l6 = 00000000ffff00ff
	ldstuba	[%i2+%o5]0x89,%l6	! %l6 = 00000000000000ff
	membar	#Sync			! Added by membar checker (35)
!	%f10 = fffc3ce2, Mem[0000000010181420] = 00000000
	st	%f10,[%i6+0x020]	! Mem[0000000010181420] = fffc3ce2
!	%l6 = 0000000000000000, imm = 0000000000000c38, %l3 = 000000000000ffff
	or	%l6,0xc38,%l3		! %l3 = 0000000000000c38
!	Mem[0000000020800040] = 8dff359e, %l2 = 000000000000ff2d
	ldstub	[%o1+0x040],%l2		! %l2 = 0000008d000000ff
!	%f2  = ff7c00ff, Mem[0000000010041400] = 2d000000
	sta	%f2 ,[%i1+%g0]0x80	! Mem[0000000010041400] = ff7c00ff
!	%f30 = ff0000c5 000000ff, %l0 = 000000000000ff00
!	Mem[0000000010081400] = ff2100000000b58e
	stda	%f30,[%i2+%l0]ASI_PST8_PL ! Mem[0000000010081400] = ff2100000000b58e
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = b9ffffff, %l4 = 000000000000ff00
	ldsba	[%i4+%g0]0x88,%l4	! %l4 = ffffffffffffffff

p0_label_229:
!	Mem[00000000201c0000] = ffff6bf6, %l3 = 0000000000000c38
	ldub	[%o0+%g0],%l3		! %l3 = 00000000000000ff
!	Mem[0000000010101408] = 90ffde4800860000, %f12 = ffffffff ffe1e712
	ldda	[%i4+%o4]0x80,%f12	! %f12 = 90ffde48 00860000
!	Mem[0000000010041400] = ff007cff, %l5 = 0000000000000000
	ldswa	[%i1+%g0]0x88,%l5	! %l5 = ffffffffff007cff
!	Mem[0000000030041400] = 00000000 000000ff 00000000 0000005d
!	Mem[0000000030041410] = 00000000 0000807f bad76926 00000000
!	Mem[0000000030041420] = ffffffff 00000000 5252ffff 4da2c09a
!	Mem[0000000030041430] = 12e7e1ff ffffffff 2d00002d 0000005d
	ldda	[%i1]ASI_BLK_AIUSL,%f0	! Block Load from 0000000030041400
!	Mem[0000000030041410] = 00000000, %l5 = ffffffffff007cff
	ldsba	[%i1+%o5]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000010081420] = 00000034, %l7 = 00000000000000ff
	lduw	[%i2+0x020],%l7		! %l7 = 0000000000000034
!	Mem[00000000100c1410] = ff00002d 0000b9ff, %l0 = 0000ff00, %l1 = 00000000
	ldda	[%i3+%o5]0x80,%l0	! %l0 = 00000000ff00002d 000000000000b9ff
!	Mem[0000000030041410] = 00000000, %l3 = 00000000000000ff
	ldswa	[%i1+%o5]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000010101430] = ff0000ff, %l1 = 000000000000b9ff
	lduh	[%i4+0x032],%l1		! %l1 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l5 = 0000000000000000, Mem[0000000030181408] = 00000034ff7c00ff
	stxa	%l5,[%i6+%o4]0x89	! Mem[0000000030181408] = 0000000000000000

p0_label_230:
!	Mem[0000000030001400] = ff69d7ba, %l2 = 000000000000008d
	ldstuba	[%i0+%g0]0x81,%l2	! %l2 = 000000ff000000ff
!	Mem[0000000010041410] = 00000000, %l4 = ffffffffffffffff
	ldstuba	[%i1+%o5]0x80,%l4	! %l4 = 00000000000000ff
!	%f26 = bb47b886 92e6fbc0, Mem[00000000100c1420] = ff00ffff ff007cff
	stda	%f26,[%i3+0x020]%asi	! Mem[00000000100c1420] = bb47b886 92e6fbc0
!	%l5 = 0000000000000000, Mem[0000000010001400] = ec210000
	stha	%l5,[%i0+%g0]0x88	! Mem[0000000010001400] = ec210000
!	Mem[000000001014142b] = 8eb50000, %l2 = 00000000000000ff
	ldstuba	[%i5+0x02b]%asi,%l2	! %l2 = 00000000000000ff
!	%f26 = bb47b886 92e6fbc0, Mem[0000000030101410] = 00ff0000 0000052d
	stda	%f26,[%i4+%o5]0x81	! Mem[0000000030101410] = bb47b886 92e6fbc0
!	%l4 = 0000000000000000, Mem[0000000010101400] = ffffffb9
	stwa	%l4,[%i4+%g0]0x80	! Mem[0000000010101400] = 00000000
!	%l4 = 0000000000000000, Mem[0000000010181410] = 00ff0d73
	stwa	%l4,[%i6+%o5]0x80	! Mem[0000000010181410] = 00000000
!	%l4 = 00000000, %l5 = 00000000, Mem[00000000100c1410] = ff00002d 0000b9ff
	stda	%l4,[%i3+%o5]0x80	! Mem[00000000100c1410] = 00000000 00000000
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = 00000000, %l3 = 0000000000000000
	lduwa	[%i3+%o5]0x88,%l3	! %l3 = 0000000000000000

p0_label_231:
!	Mem[00000000100c1408] = 5bff0000, %f22 = 00000000
	lda	[%i3+0x008]%asi,%f22	! %f22 = 5bff0000
!	Mem[0000000010081408] = 000021ff00000000, %l6 = 0000000000000000
	ldxa	[%i2+%o4]0x80,%l6	! %l6 = 000021ff00000000
!	Mem[0000000010101410] = 0000ffb9, %l1 = 00000000000000ff
	ldsba	[%i4+%o5]0x88,%l1	! %l1 = ffffffffffffffb9
!	Mem[0000000030001400] = bad769ff, %f16 = ff8dffff
	lda	[%i0+%g0]0x89,%f16	! %f16 = bad769ff
!	Mem[0000000030081410] = 000000ff, %l6 = 000021ff00000000
	lduha	[%i2+%o5]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030081410] = ff000000000000ff, %l2 = 0000000000000000
	ldxa	[%i2+%o5]0x89,%l2	! %l2 = ff000000000000ff
!	Mem[0000000010181410] = 00000000ffffffb0, %f16 = bad769ff 2d000000
	ldda	[%i6+0x010]%asi,%f16	! %f16 = 00000000 ffffffb0
!	Mem[0000000010041410] = ff000000, %l0 = 00000000ff00002d
	lduh	[%i1+%o5],%l0		! %l0 = 000000000000ff00
!	Mem[00000000100c1408] = 26000000 0000ff5b, %l0 = 0000ff00, %l1 = ffffffb9
	ldda	[%i3+%o4]0x88,%l0	! %l0 = 000000000000ff5b 0000000026000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010001408] = 0000005d, %l6 = 00000000000000ff
	swapa	[%i0+%o4]0x88,%l6	! %l6 = 000000000000005d

p0_label_232:
!	%l3 = 0000000000000000, Mem[00000000211c0000] = 002dc666
	sth	%l3,[%o2+%g0]		! Mem[00000000211c0000] = 0000c666
!	%f19 = ffffffff, %f30 = ff0000c5, %f17 = ffffffb0
	fsubs	%f19,%f30,%f17		! %f17 = ffffffff
!	%f22 = 5bff0000 4eff47ef, %l4 = 0000000000000000
!	Mem[00000000300c1438] = 0000467cffff09a9
	add	%i3,0x038,%g1
	stda	%f22,[%g1+%l4]ASI_PST8_S ! Mem[00000000300c1438] = 0000467cffff09a9
!	%l4 = 0000000000000000, Mem[00000000300c1410] = ff000000
	stwa	%l4,[%i3+%o5]0x81	! Mem[00000000300c1410] = 00000000
!	Mem[0000000010181424] = 159a9631, %l3 = 0000000000000000, %asi = 80
	swapa	[%i6+0x024]%asi,%l3	! %l3 = 00000000159a9631
!	%f24 = 00000000 159a9631, %l2 = ff000000000000ff
!	Mem[0000000010141410] = ff00ff00678f0000
	add	%i5,0x010,%g1
	stda	%f24,[%g1+%l2]ASI_PST32_PL ! Mem[0000000010141410] = 31969a1500000000
!	%f27 = 92e6fbc0, %f26 = bb47b886, %f26 = bb47b886 92e6fbc0
	fsmuld	%f27,%f26,%f26		! %f26 = 39d68686 0338d000
!	Mem[0000000020800041] = ffff359e, %l2 = ff000000000000ff
	ldstuba	[%o1+0x041]%asi,%l2	! %l2 = 000000ff000000ff
!	Mem[0000000010101434] = 000000ff, %l6 = 000000000000005d
	swap	[%i4+0x034],%l6		! %l6 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = 159a9631, %l5 = 0000000000000000
	lduba	[%i5+%o5]0x88,%l5	! %l5 = 0000000000000031

p0_label_233:
!	Mem[0000000030141400] = 4e000000ff007cff, %l1 = 0000000026000000
	ldxa	[%i5+%g0]0x81,%l1	! %l1 = 4e000000ff007cff
!	Mem[0000000010081410] = 00000000, %l4 = 0000000000000000
	ldub	[%i2+0x013],%l4		! %l4 = 0000000000000000
!	Mem[0000000030141400] = ff7c00ff0000004e, %l2 = 00000000000000ff
	ldxa	[%i5+%g0]0x89,%l2	! %l2 = ff7c00ff0000004e
!	Mem[0000000010141408] = 00000000 000000ff, %l2 = 0000004e, %l3 = 159a9631
	ldda	[%i5+%o4]0x80,%l2	! %l2 = 0000000000000000 00000000000000ff
!	Mem[0000000010081410] = 00000000, %l0 = 000000000000ff5b
	lduba	[%i2+%o5]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000021800000] = 81ff1cea, %l2 = 0000000000000000
	ldsh	[%o3+%g0],%l2		! %l2 = ffffffffffff81ff
!	Mem[0000000030001400] = ff69d7ba, %l0 = 0000000000000000
	ldsba	[%i0+%g0]0x81,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010001400] = ec210000, %l3 = 00000000000000ff
	ldsba	[%i0+%g0]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000010181410] = 00000000, %l3 = 0000000000000000
	lduba	[%i6+%o5]0x88,%l3	! %l3 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l6 = 00000000000000ff, Mem[0000000010101434] = 0000005d
	stw	%l6,[%i4+0x034]		! Mem[0000000010101434] = 000000ff

p0_label_234:
!	%l0 = ffffffff, %l1 = ff007cff, Mem[0000000010001400] = ec210000 0b410000
	stda	%l0,[%i0+%g0]0x88	! Mem[0000000010001400] = ffffffff ff007cff
!	Mem[0000000010141400] = 00000000, %l4 = 0000000000000000
	ldsba	[%i5+%g0]0x88,%l4	! %l4 = 0000000000000000
!	%f0  = ff000000 00000000 5d000000 00000000
!	%f4  = 7f800000 00000000 00000000 2669d7ba
!	%f8  = 00000000 ffffffff 9ac0a24d ffff5252
!	%f12 = ffffffff ffe1e712 5d000000 2d00002d
	stda	%f0,[%i6]ASI_COMMIT_P	! Block Store to 0000000010181400
!	Mem[0000000010101408] = 48deff90, %f21 = ffffffb0
	lda	[%i4+%o4]0x88,%f21	! %f21 = 48deff90
!	Mem[0000000030181408] = 00000000, %l3 = 0000000000000000
	ldstuba	[%i6+%o4]0x81,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010141400] = 00000000, %l3 = 0000000000000000
	ldstuba	[%i5+%g0]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030001400] = ff69d7ba, %l6 = 00000000000000ff
	swapa	[%i0+%g0]0x81,%l6	! %l6 = 00000000ff69d7ba
!	%f17 = ffffffff, %f29 = 000000ff
	fcmps	%fcc3,%f17,%f29		! %fcc3 = 3
!	%f30 = ff0000c5 000000ff, %l5 = 0000000000000031
!	Mem[0000000030141418] = efb191ebd52b5079
	add	%i5,0x018,%g1
	stda	%f30,[%g1+%l5]ASI_PST32_SL ! Mem[0000000030141418] = ff000000d52b5079
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = 4e000000, %f20 = 00ff0d73
	lda	[%i5+%g0]0x81,%f20	! %f20 = 4e000000

p0_label_235:
!	Mem[0000000010001410] = ec21de82, %l2 = ffffffffffff81ff
	ldsba	[%i0+%o5]0x80,%l2	! %l2 = ffffffffffffffec
!	Mem[0000000030041410] = 00000000, %f20 = 4e000000
	lda	[%i1+%o5]0x81,%f20	! %f20 = 00000000
!	Mem[0000000030041410] = 00000000, %l1 = 4e000000ff007cff
	lduba	[%i1+%o5]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000020800040] = ffff359e, %l1 = 0000000000000000
	ldsha	[%o1+0x040]%asi,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010001420] = 049f032f, %l4 = 0000000000000000
	ldsba	[%i0+0x022]%asi,%l4	! %l4 = 0000000000000003
!	Mem[0000000010041410] = 00000000 000000ff, %l0 = ffffffff, %l1 = ffffffff
	ldda	[%i1+%o5]0x88,%l0	! %l0 = 00000000000000ff 0000000000000000
!	Mem[00000000100c1410] = 00000000, %l7 = 0000000000000034
	lduwa	[%i3+%o5]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000010001408] = ff0000000000005d, %l3 = 0000000000000000
	ldxa	[%i0+%o4]0x80,%l3	! %l3 = ff0000000000005d
!	Mem[0000000030001400] = ff000000, %l2 = ffffffffffffffec
	ldswa	[%i0+%g0]0x89,%l2	! %l2 = ffffffffff000000
!	Starting 10 instruction Store Burst
!	%f30 = ff0000c5 000000ff, Mem[0000000030181408] = 000000ff 00000000
	stda	%f30,[%i6+%o4]0x89	! Mem[0000000030181408] = ff0000c5 000000ff

p0_label_236:
!	%f24 = 00000000, Mem[0000000030081400] = 5d000000
	sta	%f24,[%i2+%g0]0x81	! Mem[0000000030081400] = 00000000
!	%l4 = 00000003, %l5 = 00000031, Mem[0000000010001410] = 82de21ec ff0000ff
	stda	%l4,[%i0+%o5]0x88	! Mem[0000000010001410] = 00000003 00000031
	membar	#Sync			! Added by membar checker (36)
!	Mem[000000001018143c] = 2d00002d, %l7 = 00000000, %l7 = 00000000
	add	%i6,0x3c,%g1
	casa	[%g1]0x80,%l7,%l7	! %l7 = 000000002d00002d
!	%l6 = 00000000ff69d7ba, Mem[0000000030181408] = ff000000c50000ff
	stxa	%l6,[%i6+%o4]0x81	! Mem[0000000030181408] = 00000000ff69d7ba
!	%f10 = 9ac0a24d, Mem[0000000030041408] = 00000000
	sta	%f10,[%i1+%o4]0x89	! Mem[0000000030041408] = 9ac0a24d
!	%f16 = 00000000, Mem[0000000010001400] = ffffffff
	sta	%f16,[%i0+%g0]0x88	! Mem[0000000010001400] = 00000000
!	%l1 = 0000000000000000, %l6 = 00000000ff69d7ba, %y  = ffffffff
	umul	%l1,%l6,%l2		! %l2 = 0000000000000000, %y = 00000000
!	%l3 = ff0000000000005d, immd = 0000000000000c3e, %l1 = 0000000000000000
	sdivx	%l3,0xc3e,%l1		! %l1 = ffffeb16b5571371
!	%l5 = 0000000000000031, Mem[0000000010141400] = ff000000000000ff
	stxa	%l5,[%i5+%g0]0x80	! Mem[0000000010141400] = 0000000000000031
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = 000000ff, %f23 = 4eff47ef
	lda	[%i1+%o5]0x88,%f23	! %f23 = 000000ff

p0_label_237:
!	Mem[0000000030181408] = 00000000, %l6 = 00000000ff69d7ba
	lduha	[%i6+%o4]0x89,%l6	! %l6 = 0000000000000000
!	%l3 = ff0000000000005d, %l3 = ff0000000000005d, %l0 = 00000000000000ff
	sdivx	%l3,%l3,%l0		! %l0 = 0000000000000001
!	Mem[0000000010181400] = ff000000, %l7 = 000000002d00002d
	ldsba	[%i6+%g0]0x80,%l7	! %l7 = ffffffffffffffff
!	Mem[00000000100c1410] = 00000000 00000000, %l2 = 00000000, %l3 = 0000005d
	ldd	[%i3+%o5],%l2		! %l2 = 0000000000000000 0000000000000000
!	Mem[0000000030041410] = 7f80000000000000, %f24 = 00000000 159a9631
	ldda	[%i1+%o5]0x89,%f24	! %f24 = 7f800000 00000000
!	%l5 = 0000000000000031, %l1 = ffffeb16b5571371, %y  = 00000000
	sdiv	%l5,%l1,%l5		! %l5 = 0000000000000000
	mov	%l0,%y			! %y = 00000001
!	Mem[00000000100c1400] = c46788cf6f00787f, %f28 = 00ff0000 000000ff
	ldda	[%i3+%g0]0x80,%f28	! %f28 = c46788cf 6f00787f
!	Mem[0000000010001438] = ff7c00ff ffff00ff, %l6 = 00000000, %l7 = ffffffff
	ldd	[%i0+0x038],%l6		! %l6 = 00000000ff7c00ff 00000000ffff00ff
!	Mem[0000000021800180] = ca4c59fe, %l0 = 0000000000000001
	ldsha	[%o3+0x180]%asi,%l0	! %l0 = ffffffffffffca4c
!	Starting 10 instruction Store Burst
!	Mem[0000000010041400] = ff7c00ff, %l5 = 0000000000000000
	swapa	[%i1+%g0]0x80,%l5	! %l5 = 00000000ff7c00ff

p0_label_238:
!	%l4 = 0000000000000003, Mem[00000000300c1410] = 5d00000000000000
	stxa	%l4,[%i3+%o5]0x89	! Mem[00000000300c1410] = 0000000000000003
!	%f6  = 00000000 2669d7ba, Mem[0000000010041408] = 00000000 ffffffff
	stda	%f6 ,[%i1+%o4]0x80	! Mem[0000000010041408] = 00000000 2669d7ba
!	%l0 = ffffffffffffca4c, Mem[0000000030141400] = ff7c00ff0000004e
	stxa	%l0,[%i5+%g0]0x89	! Mem[0000000030141400] = ffffffffffffca4c
!	%l3 = 0000000000000000, Mem[00000000211c0000] = 0000c666
	stb	%l3,[%o2+%g0]		! Mem[00000000211c0000] = 0000c666
!	%f4  = 7f800000 00000000, %l3 = 0000000000000000
!	Mem[0000000010081428] = b1ded3c800000000
	add	%i2,0x028,%g1
	stda	%f4,[%g1+%l3]ASI_PST8_P ! Mem[0000000010081428] = b1ded3c800000000
!	%l4 = 0000000000000003, Mem[0000000010101438] = 00000000000000ff
	stx	%l4,[%i4+0x038]		! Mem[0000000010101438] = 0000000000000003
!	Mem[0000000030181408] = 00000000, %l6 = 00000000ff7c00ff
	ldstuba	[%i6+%o4]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010081404] = 0000b58e, %l6 = 0000000000000000
	swap	[%i2+0x004],%l6		! %l6 = 000000000000b58e
!	%l7 = 00000000ffff00ff, imm = 0000000000000073, %l6 = 000000000000b58e
	xnor	%l7,0x073,%l6		! %l6 = ffffffff0000ff73
!	Starting 10 instruction Load Burst
!	Mem[0000000030081410] = ff000000, %l4 = 0000000000000003
	ldsha	[%i2+%o5]0x81,%l4	! %l4 = ffffffffffffff00

p0_label_239:
!	Mem[0000000010101408] = 0000860048deff90, %l6 = ffffffff0000ff73
	ldxa	[%i4+%o4]0x88,%l6	! %l6 = 0000860048deff90
!	Mem[0000000010001400] = ff007cff00000000, %l6 = 0000860048deff90
	ldxa	[%i0+%g0]0x88,%l6	! %l6 = ff007cff00000000
!	Mem[0000000010041400] = 00000000, %l3 = 0000000000000000
	lduba	[%i1+%g0]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000010041408] = 00000000, %l3 = 0000000000000000
	ldsh	[%i1+%o4],%l3		! %l3 = 0000000000000000
!	Mem[0000000010001408] = 000000ff, %l7 = 00000000ffff00ff
	lduha	[%i0+%o4]0x88,%l7	! %l7 = 00000000000000ff
!	%l2 = 0000000000000000, imm = 0000000000000776, %l4 = ffffffffffffff00
	xor	%l2,0x776,%l4		! %l4 = 0000000000000776
!	Mem[0000000030141410] = 00000000, %l0 = ffffffffffffca4c
	ldsba	[%i5+%o5]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000010101400] = 00000000, %l4 = 0000000000000776
	lduha	[%i4+%g0]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000030001410] = 000000ff, %l2 = 0000000000000000
	lduwa	[%i0+%o5]0x89,%l2	! %l2 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[00000000201c0001] = ffff6bf6, %l1 = ffffeb16b5571371
	ldstub	[%o0+0x001],%l1		! %l1 = 000000ff000000ff

p0_label_240:
!	Mem[0000000010041428] = 2d75329a, %l7 = 00000000000000ff
	swap	[%i1+0x028],%l7		! %l7 = 000000002d75329a
!	%l0 = 0000000000000000, Mem[0000000030001410] = 0000ff00000000ff
	stxa	%l0,[%i0+%o5]0x89	! Mem[0000000030001410] = 0000000000000000
!	Mem[0000000030081408] = ff0000ff, %l5 = 00000000ff7c00ff
	ldstuba	[%i2+%o4]0x81,%l5	! %l5 = 000000ff000000ff
!	%l5 = 00000000000000ff, Mem[00000000300c1410] = 03000000
	stha	%l5,[%i3+%o5]0x81	! Mem[00000000300c1410] = 00ff0000
!	%f24 = 7f800000 00000000, %l1 = 00000000000000ff
!	Mem[0000000010141430] = 00ff0000ffc595dd
	add	%i5,0x030,%g1
	stda	%f24,[%g1+%l1]ASI_PST16_P ! Mem[0000000010141430] = 7f80000000000000
!	Mem[00000000100c1430] = ffffffff, %l0 = 0000000000000000, %asi = 80
	swapa	[%i3+0x030]%asi,%l0	! %l0 = 00000000ffffffff
!	%f18 = 00000000 ffffffff, %l5 = 00000000000000ff
!	Mem[0000000010181418] = 000000002669d7ba
	add	%i6,0x018,%g1
	stda	%f18,[%g1+%l5]ASI_PST16_PL ! Mem[0000000010181418] = ffffffff00000000
!	%f12 = ffffffff ffe1e712, Mem[0000000030081400] = 00000000 00000000
	stda	%f12,[%i2+%g0]0x81	! Mem[0000000030081400] = ffffffff ffe1e712
!	%l6 = ff007cff00000000, Mem[0000000030141410] = 00000000
	stwa	%l6,[%i5+%o5]0x81	! Mem[0000000030141410] = 00000000
!	Starting 10 instruction Load Burst
!	Code Fragment 4
p0_fragment_28:
!	%l0 = 00000000ffffffff
	setx	0xff766f103c014b61,%g7,%l0 ! %l0 = ff766f103c014b61
!	%l1 = 00000000000000ff
	setx	0x21f36b978bcb923a,%g7,%l1 ! %l1 = 21f36b978bcb923a
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = ff766f103c014b61
	setx	0x5bab1a706629a13a,%g7,%l0 ! %l0 = 5bab1a706629a13a
!	%l1 = 21f36b978bcb923a
	setx	0x1183efe0380ffa84,%g7,%l1 ! %l1 = 1183efe0380ffa84

p0_label_241:
!	Mem[0000000010141408] = 00000000, %l6 = ff007cff00000000
	lduba	[%i5+%o4]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000010081410] = 00000000, %l5 = 00000000000000ff
	ldswa	[%i2+%o5]0x88,%l5	! %l5 = 0000000000000000
!	Mem[000000001004142c] = c46788cf, %l7 = 000000002d75329a
	ldswa	[%i1+0x02c]%asi,%l7	! %l7 = ffffffffc46788cf
!	Mem[0000000010101400] = 00000000, %l6 = 0000000000000000
	ldsba	[%i4+%g0]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000030141410] = 00000000, %l3 = 0000000000000000
	ldsha	[%i5+%o5]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000030041410] = 00000000, %f11 = ffff5252
	lda	[%i1+%o5]0x89,%f11	! %f11 = 00000000
!	Mem[0000000010001400] = 00000000, %l5 = 0000000000000000
	lduha	[%i0+%g0]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000030101408] = 00000000, %l5 = 0000000000000000
	ldswa	[%i4+%o4]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000030041408] = 5d0000009ac0a24d, %f30 = ff0000c5 000000ff
	ldda	[%i1+%o4]0x89,%f30	! %f30 = 5d000000 9ac0a24d
!	Starting 10 instruction Store Burst
!	%f29 = 6f00787f, %f20 = 00000000, %f8  = 00000000
	fdivs	%f29,%f20,%f8 		! %f8  = 7f800000

p0_label_242:
!	%l5 = 0000000000000000, Mem[0000000030081400] = ffffffff
	stha	%l5,[%i2+%g0]0x81	! Mem[0000000030081400] = 0000ffff
!	Mem[00000000300c1408] = b9ff0000, %l5 = 0000000000000000
	swapa	[%i3+%o4]0x89,%l5	! %l5 = 00000000b9ff0000
!	%l7 = ffffffffc46788cf, Mem[0000000030181400] = 0000004000000000
	stxa	%l7,[%i6+%g0]0x81	! Mem[0000000030181400] = ffffffffc46788cf
!	%l7 = ffffffffc46788cf, Mem[0000000010001408] = 5d000000000000ff
	stxa	%l7,[%i0+%o4]0x88	! Mem[0000000010001408] = ffffffffc46788cf
!	%f4  = 7f800000 00000000, %l2 = 00000000000000ff
!	Mem[0000000030001438] = 04089650a7ce975d
	add	%i0,0x038,%g1
	stda	%f4,[%g1+%l2]ASI_PST32_SL ! Mem[0000000030001438] = 000000000000807f
!	%l7 = ffffffffc46788cf, Mem[00000000300c1410] = 00ff0000
	stha	%l7,[%i3+%o5]0x81	! Mem[00000000300c1410] = 88cf0000
!	%l0 = 5bab1a706629a13a, Mem[0000000030081400] = 0000ffff
	stha	%l0,[%i2+%g0]0x81	! Mem[0000000030081400] = a13affff
!	%l2 = 00000000000000ff, Mem[0000000010141408] = 00000000000000ff
	stxa	%l2,[%i5+%o4]0x80	! Mem[0000000010141408] = 00000000000000ff
!	Mem[0000000010001400] = 00000000, %l7 = ffffffffc46788cf
	swapa	[%i0+%g0]0x88,%l7	! %l7 = 0000000000000000
!	Starting 10 instruction Load Burst
!	%l4 = 0000000000000000, %l3 = 0000000000000000, %l5  = 00000000b9ff0000
	mulx	%l4,%l3,%l5		! %l5 = 0000000000000000

p0_label_243:
!	Mem[0000000010181410] = 7f80000000000000, %f0  = ff000000 00000000
	ldda	[%i6+%o5]0x80,%f0 	! %f0  = 7f800000 00000000
!	Mem[0000000010041400] = 3196410b 00000000, %l6 = 00000000, %l7 = 00000000
	ldda	[%i1+%g0]0x88,%l6	! %l6 = 0000000000000000 000000003196410b
!	Mem[0000000030001408] = 00ff000000000000, %l2 = 00000000000000ff
	ldxa	[%i0+%o4]0x81,%l2	! %l2 = 00ff000000000000
!	Mem[0000000030001400] = 00000000ff000000, %l5 = 0000000000000000
	ldxa	[%i0+%g0]0x89,%l5	! %l5 = 00000000ff000000
!	Mem[0000000030141410] = 00000000000000ff, %f12 = ffffffff ffe1e712
	ldda	[%i5+%o5]0x81,%f12	! %f12 = 00000000 000000ff
!	Mem[0000000010181408] = 0000005d, %l5 = 00000000ff000000
	lduba	[%i6+%o4]0x88,%l5	! %l5 = 000000000000005d
!	Mem[00000000300c1408] = 00000000, %l0 = 5bab1a706629a13a
	lduwa	[%i3+%o4]0x89,%l0	! %l0 = 0000000000000000
!	%f27 = 0338d000, %f19 = ffffffff, %f6  = 00000000
	fdivs	%f27,%f19,%f6 		! %f6  = ffffffff
	membar	#Sync			! Added by membar checker (37)
!	Mem[0000000030181400] = ffffffff c46788cf ff000000 ff69d7ba
!	Mem[0000000030181410] = 00000000 ffff0000 5d000000 0000ffff
!	Mem[0000000030181420] = 00000034 dd95c5ff 00000000 0b419631
!	Mem[0000000030181430] = ff000000 000000ff 34000000 ffff8dff
	ldda	[%i6]ASI_BLK_AIUS,%f16	! Block Load from 0000000030181400
!	Starting 10 instruction Store Burst
!	%f8  = 7f800000, Mem[0000000010001408] = c46788cf
	sta	%f8 ,[%i0+%o4]0x88	! Mem[0000000010001408] = 7f800000

p0_label_244:
!	%l2 = 00ff000000000000, Mem[0000000010141408] = 00000000
	stba	%l2,[%i5+%o4]0x80	! Mem[0000000010141408] = 00000000
!	%f0  = 7f800000 00000000, %f13 = 000000ff
	fdtos	%f0 ,%f13		! %f13 = 7f800000
!	%f2  = 5d000000 00000000, Mem[0000000030041410] = 00000000 7f800000
	stda	%f2 ,[%i1+%o5]0x89	! Mem[0000000030041410] = 5d000000 00000000
!	%l4 = 00000000, %l5 = 0000005d, Mem[00000000100c1418] = 00000000 2669d7ba
	std	%l4,[%i3+0x018]		! Mem[00000000100c1418] = 00000000 0000005d
!	%l2 = 00000000, %l3 = 00000000, Mem[0000000010181408] = 0000005d 00000000
	stda	%l2,[%i6+%o4]0x88	! Mem[0000000010181408] = 00000000 00000000
!	%l6 = 00000000, %l7 = 3196410b, Mem[0000000030001410] = 00000000 00000000
	stda	%l6,[%i0+%o5]0x81	! Mem[0000000030001410] = 00000000 3196410b
!	Mem[0000000010101410] = b9ff0000, %l3 = 0000000000000000
	swapa	[%i4+%o5]0x80,%l3	! %l3 = 00000000b9ff0000
!	Mem[0000000030001408] = 00ff0000, %l4 = 0000000000000000
	swapa	[%i0+%o4]0x81,%l4	! %l4 = 0000000000ff0000
!	Mem[00000000100c142c] = 000000ff, %l5 = 000000000000005d
	swap	[%i3+0x02c],%l5		! %l5 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = 9ac0a24d, %l4 = 0000000000ff0000
	lduha	[%i1+%o4]0x89,%l4	! %l4 = 000000000000a24d

p0_label_245:
!	Mem[0000000030041408] = 4da2c09a, %l6 = 0000000000000000
	lduha	[%i1+%o4]0x81,%l6	! %l6 = 0000000000004da2
!	Mem[0000000010001438] = ff7c00ff ffff00ff, %l6 = 00004da2, %l7 = 3196410b
	ldd	[%i0+0x038],%l6		! %l6 = 00000000ff7c00ff 00000000ffff00ff
!	Mem[0000000010141400] = 00000000, %l2 = 00ff000000000000
	lduba	[%i5+%g0]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000030081400] = ffff3aa1, %l4 = 000000000000a24d
	lduba	[%i2+%g0]0x89,%l4	! %l4 = 00000000000000a1
!	Mem[0000000010001410] = 03000000, %f14 = 5d000000
	ld	[%i0+%o5],%f14	! %f14 = 03000000
!	Mem[0000000010181410] = 7f800000, %l5 = 00000000000000ff
	lduha	[%i6+%o5]0x80,%l5	! %l5 = 0000000000007f80
!	Mem[00000000300c1410] = 88cf0000 00000000, %l4 = 000000a1, %l5 = 00007f80
	ldda	[%i3+%o5]0x81,%l4	! %l4 = 0000000088cf0000 0000000000000000
!	Mem[0000000010041400] = 00000000, %l0 = 0000000000000000
	lduwa	[%i1+%g0]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000010101408] = 0000860048deff90, %f4  = 7f800000 00000000
	ldda	[%i4+%o4]0x88,%f4 	! %f4  = 00008600 48deff90
!	Starting 10 instruction Store Burst
!	%f8  = 7f800000 ffffffff, %l3 = 00000000b9ff0000
!	Mem[0000000010181410] = 7f80000000000000
	add	%i6,0x010,%g1
	stda	%f8,[%g1+%l3]ASI_PST32_P ! Mem[0000000010181410] = 7f80000000000000

p0_label_246:
!	%l2 = 0000000000000000, Mem[0000000030041400] = 00000000
	stha	%l2,[%i1+%g0]0x81	! Mem[0000000030041400] = 00000000
!	Mem[0000000020800000] = ff2d98bf, %l2 = 0000000000000000
	ldstub	[%o1+%g0],%l2		! %l2 = 000000ff000000ff
!	%l1 = 1183efe0380ffa84, Mem[0000000010181400] = 000000ff
	stba	%l1,[%i6+%g0]0x88	! Mem[0000000010181400] = 00000084
!	Mem[0000000010101400] = 00000000, %l4 = 0000000088cf0000
	ldstuba	[%i4+%g0]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[00000000100c1408] = 5bff0000, %l7 = 00000000ffff00ff
	ldstuba	[%i3+%o4]0x80,%l7	! %l7 = 0000005b000000ff
!	Mem[0000000010081400] = ff210000, %l4 = 0000000000000000
	ldstuba	[%i2+%g0]0x80,%l4	! %l4 = 000000ff000000ff
!	Mem[0000000020800040] = ffff359e, %l4 = 00000000000000ff
	ldstub	[%o1+0x040],%l4		! %l4 = 000000ff000000ff
!	Mem[000000001008141c] = 0b4196ff, %l2 = 00000000000000ff
	swap	[%i2+0x01c],%l2		! %l2 = 000000000b4196ff
!	Mem[0000000030181408] = 000000ff, %l6 = 00000000ff7c00ff
	swapa	[%i6+%o4]0x89,%l6	! %l6 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = 000000000000807f, %f8  = 7f800000 ffffffff
	ldda	[%i6+%o5]0x88,%f8 	! %f8  = 00000000 0000807f

p0_label_247:
!	%l4 = 00000000000000ff, %l5 = 0000000000000000, %l2 = 000000000b4196ff
	udivx	%l4,%l5,%l2		! Div by zero, %l0 = 0000000000000050
	membar	#Sync			! Added by membar checker (38)
!	Mem[0000000010081400] = ff210000 00000000 000021ff 00000000
!	Mem[0000000010081410] = 00000000 ffffffb9 00000034 000000ff
!	Mem[0000000010081420] = 00000034 dd95c5ff b1ded3c8 00000000
!	Mem[0000000010081430] = ff33a6cf c78dcd1f d792467c 00000000
	ldda	[%i2]ASI_BLK_AIUPL,%f16	! Block Load from 0000000010081400
!	Mem[0000000020800040] = ffff359e, %l5 = 0000000000000000
	lduh	[%o1+0x040],%l5		! %l5 = 000000000000ffff
!	Mem[0000000010001410] = 0000003100000003, %f8  = 00000000 0000807f
	ldda	[%i0+%o5]0x88,%f8 	! %f8  = 00000031 00000003
!	%f0  = 7f800000, Mem[0000000010181410] = 0000807f
	sta	%f0 ,[%i6+%o5]0x88	! Mem[0000000010181410] = 7f800000
!	Mem[0000000010001400] = cf8867c4, %l1 = 1183efe0380ffa84
	lduwa	[%i0+%g0]0x80,%l1	! %l1 = 00000000cf8867c4
!	Mem[0000000010041410] = 000000ff, %l5 = 000000000000ffff
	lduha	[%i1+%o5]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010181408] = 00000000, %l6 = 00000000000000ff
	ldsha	[%i6+%o4]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000010081410] = 00000000ffffffb9, %l2 = 000000000b4196ff
	ldxa	[%i2+0x010]%asi,%l2	! %l2 = 00000000ffffffb9
!	Starting 10 instruction Store Burst
!	%f14 = 03000000 2d00002d, %l4 = 00000000000000ff
!	Mem[00000000100c1438] = ff000000f6cda1ad
	add	%i3,0x038,%g1
	stda	%f14,[%g1+%l4]ASI_PST8_PL ! Mem[00000000100c1438] = 2d00002d00000003

p0_label_248:
!	Mem[0000000010041430] = 730d0000ffffb58e, %l0 = 0000000000000028, %l6 = 0000000000000000
	add	%i1,0x30,%g1
	casxa	[%g1]0x80,%l0,%l6	! %l6 = 730d0000ffffb58e
!	%f0  = 7f800000 00000000, %l7 = 000000000000005b
!	Mem[0000000030041400] = 00000000000000ff
	stda	%f0,[%i1+%l7]ASI_PST32_S ! Mem[0000000030041400] = 7f80000000000000
!	Mem[0000000030141408] = 78b5ffff, %l1 = 00000000cf8867c4
	swapa	[%i5+%o4]0x81,%l1	! %l1 = 0000000078b5ffff
!	%l3 = 00000000b9ff0000, Mem[00000000300c1410] = 0000cf88
	stha	%l3,[%i3+%o5]0x89	! Mem[00000000300c1410] = 00000000
!	%l6 = 730d0000ffffb58e, Mem[0000000010001412] = 03000000
	stb	%l6,[%i0+0x012]		! Mem[0000000010001410] = 03008e00
!	%f14 = 03000000 2d00002d, Mem[0000000030081400] = ffff3aa1 12e7e1ff
	stda	%f14,[%i2+%g0]0x89	! Mem[0000000030081400] = 03000000 2d00002d
!	Mem[0000000030101400] = 0000002d, %l1 = 0000000078b5ffff
	swapa	[%i4+%g0]0x81,%l1	! %l1 = 000000000000002d
!	%l2 = 00000000ffffffb9, Mem[0000000030081400] = 2d00002d
	stba	%l2,[%i2+%g0]0x81	! Mem[0000000030081400] = b900002d
!	Mem[0000000010141414] = 00000000, %l7 = 000000000000005b
	ldstub	[%i5+0x014],%l7		! %l7 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = 0000ffff, %l4 = 00000000000000ff
	lduba	[%i3+%o4]0x88,%l4	! %l4 = 00000000000000ff

p0_label_249:
!	Mem[0000000030141408] = ffffa95dc46788cf, %f14 = 03000000 2d00002d
	ldda	[%i5+%o4]0x89,%f14	! %f14 = ffffa95d c46788cf
!	Mem[0000000010001400] = cf8867c4, %l0 = 0000000000000028
	lduha	[%i0+%g0]0x80,%l0	! %l0 = 000000000000cf88
!	Mem[0000000030041400] = 7f800000, %l7 = 0000000000000000
	ldswa	[%i1+%g0]0x81,%l7	! %l7 = 000000007f800000
!	Mem[00000000211c0000] = 0000c666, %l5 = 00000000000000ff
	lduba	[%o2+0x000]%asi,%l5	! %l5 = 0000000000000000
!	Mem[0000000030101408] = 00000000, %f7  = 2669d7ba
	lda	[%i4+%o4]0x89,%f7 	! %f7 = 00000000
!	Mem[0000000010101408] = 48deff90, %f15 = c46788cf
	lda	[%i4+%o4]0x88,%f15	! %f15 = 48deff90
!	Mem[0000000030181410] = 00000000, %f1  = 00000000
	lda	[%i6+%o5]0x89,%f1 	! %f1 = 00000000
!	Mem[0000000030141408] = cf8867c4, %l3 = 00000000b9ff0000
	ldsba	[%i5+%o4]0x81,%l3	! %l3 = ffffffffffffffcf
!	Mem[0000000030101408] = 000000000000002d, %l2 = 00000000ffffffb9
	ldxa	[%i4+%o4]0x81,%l2	! %l2 = 000000000000002d
!	Starting 10 instruction Store Burst
!	%f11 = 00000000, %f6  = ffffffff, %f12 = 00000000 7f800000
	fsmuld	%f11,%f6 ,%f12		! %f12 = ffffffff e0000000

p0_label_250:
!	Mem[00000000300c1400] = 00000000, %l4 = 00000000000000ff
	swapa	[%i3+%g0]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000010081400] = ff21000000000000, %l0 = 000000000000cf88, %l1 = 000000000000002d
	casxa	[%i2]0x80,%l0,%l1	! %l1 = ff21000000000000
!	%f6  = ffffffff, Mem[0000000030041408] = 4da2c09a
	sta	%f6 ,[%i1+%o4]0x81	! Mem[0000000030041408] = ffffffff
!	Mem[0000000010081410] = 00000000, %l4 = 0000000000000000
	swapa	[%i2+%o5]0x80,%l4	! %l4 = 0000000000000000
!	%l7 = 000000007f800000, Mem[0000000010041411] = ff000000, %asi = 80
	stba	%l7,[%i1+0x011]%asi	! Mem[0000000010041410] = ff000000
!	%f18 = 00000000 ff210000, %l5 = 0000000000000000
!	Mem[0000000030141410] = 00000000000000ff
	add	%i5,0x010,%g1
	stda	%f18,[%g1+%l5]ASI_PST16_S ! Mem[0000000030141410] = 00000000000000ff
!	%l4 = 00000000, %l5 = 00000000, Mem[0000000030181408] = ff7c00ff bad769ff
	stda	%l4,[%i6+%o4]0x89	! Mem[0000000030181408] = 00000000 00000000
!	Mem[00000000201c0001] = ffff6bf6, %l4 = 0000000000000000
	ldstuba	[%o0+0x001]%asi,%l4	! %l4 = 000000ff000000ff
!	Mem[0000000010141436] = 00000000, %l7 = 000000007f800000
	ldstuba	[%i5+0x036]%asi,%l7	! %l7 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = 26000000 0000ffff, %l6 = ffffb58e, %l7 = 00000000
	ldda	[%i3+%o4]0x88,%l6	! %l6 = 000000000000ffff 0000000026000000

p0_label_251:
!	Mem[0000000010101428] = 2d00002d, %f25 = 34000000
	ld	[%i4+0x028],%f25	! %f25 = 2d00002d
!	Mem[0000000010101400] = 000000ff, %l7 = 0000000026000000
	lduha	[%i4+%g0]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[00000000300c1400] = 000000ff, %f18 = 00000000
	lda	[%i3+%g0]0x89,%f18	! %f18 = 000000ff
!	Mem[0000000010041408] = 00000000, %l6 = 000000000000ffff
	ldsha	[%i1+%o4]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000010081410] = 00000000, %f31 = 7c4692d7
	lda	[%i2+%o5]0x88,%f31	! %f31 = 00000000
!	Mem[0000000010041400] = 00000000, %l4 = 00000000000000ff
	ldsha	[%i1+%g0]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000010041410] = 000000ff, %l7 = 00000000000000ff
	lduba	[%i1+%o5]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010181400] = 84000000, %l3 = ffffffffffffffcf
	lduba	[%i6+%g0]0x80,%l3	! %l3 = 0000000000000084
!	Mem[0000000010141400] = 3100000000000000, %l6 = 0000000000000000
	ldxa	[%i5+%g0]0x88,%l6	! %l6 = 3100000000000000
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000000000, Mem[0000000010041400] = 3196410b00000000
	stxa	%l4,[%i1+%g0]0x88	! Mem[0000000010041400] = 0000000000000000

p0_label_252:
!	Mem[00000000211c0001] = 0000c666, %l3 = 0000000000000084
	ldstuba	[%o2+0x001]%asi,%l3	! %l3 = 00000000000000ff
!	%l6 = 00000000, %l7 = 000000ff, Mem[00000000100c1430] = 00000000 ffe1e712
	std	%l6,[%i3+0x030]		! Mem[00000000100c1430] = 00000000 000000ff
!	%l7 = 00000000000000ff, Mem[0000000021800081] = 009d2e32, %asi = 80
	stba	%l7,[%o3+0x081]%asi	! Mem[0000000021800080] = 00ff2e32
!	Mem[0000000010141410] = 159a9631, %l5 = 0000000000000000
	ldstuba	[%i5+%o5]0x88,%l5	! %l5 = 00000031000000ff
!	%l6 = 3100000000000000, Mem[0000000010001408] = 0000807fffffffff, %asi = 80
	stxa	%l6,[%i0+0x008]%asi	! Mem[0000000010001408] = 3100000000000000
!	Mem[0000000030141410] = 00000000, %l5 = 0000000000000031
	ldstuba	[%i5+%o5]0x81,%l5	! %l5 = 00000000000000ff
!	%l6 = 3100000000000000, Mem[0000000021800141] = ffffcd46
	stb	%l6,[%o3+0x141]		! Mem[0000000021800140] = ff00cd46
!	Mem[0000000030041410] = 00000000, %l3 = 0000000000000000
	swapa	[%i1+%o5]0x81,%l3	! %l3 = 0000000000000000
!	%l1 = ff21000000000000, Mem[00000000211c0000] = 00ffc666
	stb	%l1,[%o2+%g0]		! Mem[00000000211c0000] = 00ffc666
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = 00000000, %l5 = 0000000000000000
	lduwa	[%i1+0x000]%asi,%l5	! %l5 = 0000000000000000

p0_label_253:
!	Mem[00000000201c0000] = ffff6bf6, %l0 = 000000000000cf88
	ldsha	[%o0+0x000]%asi,%l0	! %l0 = ffffffffffffffff
!	Mem[00000000100c1420] = bb47b88692e6fbc0, %l2 = 000000000000002d
	ldxa	[%i3+0x020]%asi,%l2	! %l2 = bb47b88692e6fbc0
!	Mem[0000000030181408] = 00000000, %l1 = ff21000000000000
	ldswa	[%i6+%o4]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000010101408] = 48deff90, %l0 = ffffffffffffffff
	lduba	[%i4+%o4]0x88,%l0	! %l0 = 0000000000000090
!	Mem[00000000300c1408] = 000000000000807f, %l1 = 0000000000000000
	ldxa	[%i3+%o4]0x81,%l1	! %l1 = 000000000000807f
!	Mem[0000000010101418] = 5d000000, %l6 = 3100000000000000
	lduha	[%i4+0x01a]%asi,%l6	! %l6 = 0000000000000000
!	Mem[0000000030001410] = 00000000, %l3 = 0000000000000000
	ldsba	[%i0+%o5]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000030041410] = 00000000, %l3 = 0000000000000000
	ldswa	[%i1+%o5]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000030181408] = 00000000, %l5 = 0000000000000000
	lduwa	[%i6+%o4]0x81,%l5	! %l5 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010181400] = 84000000, %l3 = 0000000000000000
	swapa	[%i6+%g0]0x80,%l3	! %l3 = 0000000084000000

p0_label_254:
!	Mem[00000000100c1408] = ffff0000, %l3 = 0000000084000000
	ldstuba	[%i3+%o4]0x80,%l3	! %l3 = 000000ff000000ff
!	Mem[0000000030001400] = 000000ff, %l5 = 0000000000000000
	ldstuba	[%i0+%g0]0x81,%l5	! %l5 = 00000000000000ff
!	%l2 = bb47b88692e6fbc0, Mem[0000000010001410] = 03008e0031000000
	stxa	%l2,[%i0+%o5]0x80	! Mem[0000000010001410] = bb47b88692e6fbc0
!	%l7 = 00000000000000ff, Mem[0000000010001410] = bb47b886
	stba	%l7,[%i0+%o5]0x80	! Mem[0000000010001410] = ff47b886
!	Mem[000000001000141c] = 005b0000, %l5 = 00000000, %l2 = 92e6fbc0
	add	%i0,0x1c,%g1
	casa	[%g1]0x80,%l5,%l2	! %l2 = 00000000005b0000
!	%f12 = ffffffff e0000000, Mem[0000000010041410] = ff000000 00000000
	stda	%f12,[%i1+%o5]0x80	! Mem[0000000010041410] = ffffffff e0000000
!	%l0 = 0000000000000090, Mem[0000000030081408] = ff0000ff
	stba	%l0,[%i2+%o4]0x81	! Mem[0000000030081408] = 900000ff
!	Mem[0000000030081400] = 2d0000b9, %l5 = 0000000000000000
	swapa	[%i2+%g0]0x89,%l5	! %l5 = 000000002d0000b9
!	%l0 = 0000000000000090, Mem[0000000030041400] = 0000807f
	stba	%l0,[%i1+%g0]0x89	! Mem[0000000030041400] = 00008090
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = 00000000, %l4 = 0000000000000000
	ldsha	[%i0+%o4]0x89,%l4	! %l4 = 0000000000000000

p0_label_255:
!	%l6 = 0000000000000000, immed = 000006f0, %y  = 00000001
	udiv	%l6,0x6f0,%l3		! %l3 = 000000000024e6a1
	mov	%l0,%y			! %y = 00000090
!	Mem[0000000010001408] = 0000000000000031, %f24 = ffc595dd 2d00002d
	ldda	[%i0+%o4]0x88,%f24	! %f24 = 00000000 00000031
!	Mem[0000000030141400] = ffffffffffffca4c, %l3 = 000000000024e6a1
	ldxa	[%i5+%g0]0x89,%l3	! %l3 = ffffffffffffca4c
!	%l3 = ffffffffffffca4c, Mem[0000000030001400] = ff0000ff
	stha	%l3,[%i0+%g0]0x89	! Mem[0000000030001400] = ff00ca4c
!	Mem[00000000100c1410] = 00000000 00000000, %l4 = 00000000, %l5 = 2d0000b9
	ldda	[%i3+%o5]0x88,%l4	! %l4 = 0000000000000000 0000000000000000
!	Mem[0000000010001400] = cf8867c4, %l7 = 00000000000000ff
	lduba	[%i0+%g0]0x80,%l7	! %l7 = 00000000000000cf
!	Mem[00000000100c141c] = 0000005d, %l3 = ffffffffffffca4c
	ldsh	[%i3+0x01e],%l3		! %l3 = 000000000000005d
!	Mem[0000000010001408] = 00000031, %f17 = 000021ff
	lda	[%i0+%o4]0x88,%f17	! %f17 = 00000031
!	Mem[0000000010181408] = 00000000, %l6 = 0000000000000000
	lduba	[%i6+%o4]0x88,%l6	! %l6 = 0000000000000000
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (39)
!	%f26 = 00000000 c8d3deb1, Mem[0000000010081410] = 00000000 b9ffffff
	stda	%f26,[%i2+%o5]0x88	! Mem[0000000010081410] = 00000000 c8d3deb1

p0_label_256:
!	Mem[0000000030181410] = 00000000, %l6 = 0000000000000000
	ldstuba	[%i6+%o5]0x81,%l6	! %l6 = 00000000000000ff
!	%l0 = 0000000000000090, Mem[0000000030001408] = 00000000
	stha	%l0,[%i0+%o4]0x81	! Mem[0000000030001408] = 00900000
!	%l5 = 0000000000000000, Mem[00000000211c0000] = 00ffc666, %asi = 80
	stha	%l5,[%o2+0x000]%asi	! Mem[00000000211c0000] = 0000c666
!	%l1 = 000000000000807f, Mem[0000000010081408] = 000021ff
	stha	%l1,[%i2+%o4]0x80	! Mem[0000000010081408] = 807f21ff
!	%l4 = 0000000000000000, Mem[0000000030181410] = ff000000
	stba	%l4,[%i6+%o5]0x81	! Mem[0000000030181410] = 00000000
!	%l2 = 00000000005b0000, Mem[0000000010141410] = ff969a15, %asi = 80
	stwa	%l2,[%i5+0x010]%asi	! Mem[0000000010141410] = 005b0000
!	%l4 = 0000000000000000, Mem[0000000030081408] = 900000ff
	stwa	%l4,[%i2+%o4]0x81	! Mem[0000000030081408] = 00000000
!	Mem[0000000010101408] = 90ffde48, %l7 = 00000000000000cf
	swapa	[%i4+%o4]0x80,%l7	! %l7 = 0000000090ffde48
!	%l6 = 00000000, %l7 = 90ffde48, Mem[00000000300c1410] = 00000000 00000000
	stda	%l6,[%i3+%o5]0x89	! Mem[00000000300c1410] = 00000000 90ffde48
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = 7f800000, %f27 = c8d3deb1
	lda	[%i6+%o5]0x88,%f27	! %f27 = 7f800000

p0_label_257:
!	Mem[00000000300c1408] = 00000000 0000807f, %l4 = 00000000, %l5 = 00000000
	ldda	[%i3+%o4]0x81,%l4	! %l4 = 0000000000000000 000000000000807f
!	Mem[00000000300c1410] = 00000000, %l2 = 00000000005b0000
	ldswa	[%i3+%o5]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000030141408] = c46788cf, %l4 = 0000000000000000
	ldsba	[%i5+%o4]0x89,%l4	! %l4 = ffffffffffffffcf
!	Mem[0000000010081400] = 000021ff, %l3 = 000000000000005d
	lduwa	[%i2+%g0]0x88,%l3	! %l3 = 00000000000021ff
!	Mem[0000000030081400] = 00000000, %l5 = 000000000000807f
	lduwa	[%i2+%g0]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000020800040] = ffff359e, %l6 = 0000000000000000
	ldsha	[%o1+0x040]%asi,%l6	! %l6 = ffffffffffffffff
!	%l1 = 000000000000807f, imm = 00000000000003b3, %l1 = 000000000000807f
	addc	%l1,0x3b3,%l1		! %l1 = 0000000000008432
!	%l5 = 0000000000000000, %l0 = 0000000000000090, %l3 = 00000000000021ff
	orn	%l5,%l0,%l3		! %l3 = ffffffffffffff6f
!	Mem[0000000010081408] = 807f21ff, %l4 = ffffffffffffffcf
	lduha	[%i2+%o4]0x80,%l4	! %l4 = 000000000000807f
!	Starting 10 instruction Store Burst
!	%f2  = 5d000000 00000000, Mem[00000000100c1400] = cf8867c4 7f78006f
	stda	%f2 ,[%i3+%g0]0x88	! Mem[00000000100c1400] = 5d000000 00000000

p0_label_258:
!	%l5 = 0000000000000000, Mem[0000000010041410] = ffffffff
	stha	%l5,[%i1+%o5]0x88	! Mem[0000000010041410] = ffff0000
!	%l3 = ffffffffffffff6f, Mem[00000000100c140c] = 00000026
	stw	%l3,[%i3+0x00c]		! Mem[00000000100c140c] = ffffff6f
!	%f22 = ff000000 34000000, %l6 = ffffffffffffffff
!	Mem[0000000010101438] = 0000000000000003
	add	%i4,0x038,%g1
	stda	%f22,[%g1+%l6]ASI_PST32_P ! Mem[0000000010101438] = ff00000034000000
!	%l3 = ffffffffffffff6f, Mem[0000000010141408] = ff00000000000000
	stxa	%l3,[%i5+%o4]0x88	! Mem[0000000010141408] = ffffffffffffff6f
!	Code Fragment 4
p0_fragment_29:
!	%l0 = 0000000000000090
	setx	0x2aebf1685c10ce53,%g7,%l0 ! %l0 = 2aebf1685c10ce53
!	%l1 = 0000000000008432
	setx	0x6f1d40bf80f17847,%g7,%l1 ! %l1 = 6f1d40bf80f17847
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 2aebf1685c10ce53
	setx	0xd62b4e9fadff25b9,%g7,%l0 ! %l0 = d62b4e9fadff25b9
!	%l1 = 6f1d40bf80f17847
	setx	0x243418efc1c54ec3,%g7,%l1 ! %l1 = 243418efc1c54ec3
!	%f19 = ff210000, Mem[0000000030081410] = 000000ff
	sta	%f19,[%i2+%o5]0x89	! Mem[0000000030081410] = ff210000
!	Mem[0000000030141400] = ffffca4c, %l3 = ffffffffffffff6f
	swapa	[%i5+%g0]0x89,%l3	! %l3 = 00000000ffffca4c
!	%l1 = 243418efc1c54ec3, Mem[00000000300c1410] = 90ffde4800000000
	stxa	%l1,[%i3+%o5]0x89	! Mem[00000000300c1410] = 243418efc1c54ec3
!	Mem[0000000010041408] = 00000000, %l3 = 00000000ffffca4c
	swapa	[%i1+%o4]0x88,%l3	! %l3 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = cf000000, %l1 = 243418efc1c54ec3
	ldswa	[%i4+%o4]0x88,%l1	! %l1 = ffffffffcf000000

p0_label_259:
!	Mem[00000000201c0000] = ffff6bf6, %l0 = d62b4e9fadff25b9
	ldsba	[%o0+0x001]%asi,%l0	! %l0 = ffffffffffffffff
!	Mem[00000000300c1400] = ff000000, %f3  = 00000000
	lda	[%i3+%g0]0x81,%f3 	! %f3 = ff000000
!	Mem[0000000010041400] = 00000000, %l2 = 0000000000000000
	ldsba	[%i1+%g0]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000010101428] = 2d00002d, %l1 = ffffffffcf000000
	ldswa	[%i4+0x028]%asi,%l1	! %l1 = 000000002d00002d
!	Mem[0000000030141400] = ffffff6f, %l4 = 000000000000807f
	ldswa	[%i5+%g0]0x89,%l4	! %l4 = ffffffffffffff6f
!	%l0 = ffffffffffffffff, immed = fffff26c, %y  = 00000090
	umul	%l0,-0xd94,%l1		! %l1 = fffff26b00000d94, %y = fffff26b
!	Mem[0000000010141438] = bad76926, %f12 = ffffffff
	ld	[%i5+0x038],%f12	! %f12 = bad76926
!	Mem[00000000100c1400] = 000000000000005d, %l2 = 0000000000000000
	ldxa	[%i3+%g0]0x80,%l2	! %l2 = 000000000000005d
!	Mem[0000000010041410] = ffff0000, %l6 = ffffffffffffffff
	ldswa	[%i1+%o5]0x88,%l6	! %l6 = ffffffffffff0000
!	Starting 10 instruction Store Burst
!	%l0 = ffffffffffffffff, Mem[0000000030001408] = 0000000000009000
	stxa	%l0,[%i0+%o4]0x89	! Mem[0000000030001408] = ffffffffffffffff

p0_label_260:
!	Mem[0000000010081410] = b1ded3c8, %l0 = ffffffffffffffff
	ldstuba	[%i2+%o5]0x80,%l0	! %l0 = 000000b1000000ff
!	Mem[0000000030081408] = 00000000, %l5 = 0000000000000000
	ldstuba	[%i2+%o4]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010001427] = 97340d73, %l6 = ffffffffffff0000
	ldstub	[%i0+0x027],%l6		! %l6 = 00000073000000ff
!	%l6 = 0000000000000073, Mem[00000000211c0001] = 0000c666, %asi = 80
	stba	%l6,[%o2+0x001]%asi	! Mem[00000000211c0000] = 0073c666
!	%f10 = 9ac0a24d 00000000, Mem[00000000300c1410] = c34ec5c1 ef183424
	stda	%f10,[%i3+%o5]0x81	! Mem[00000000300c1410] = 9ac0a24d 00000000
!	Mem[00000000100c143c] = 00000003, %l2 = 000000000000005d
	swap	[%i3+0x03c],%l2		! %l2 = 0000000000000003
!	Mem[0000000030181408] = 00000000, %l0 = 00000000000000b1
	ldstuba	[%i6+%o4]0x81,%l0	! %l0 = 00000000000000ff
!	%l4 = ffffff6f, %l5 = 00000000, Mem[0000000030081410] = ff210000 ff000000
	stda	%l4,[%i2+%o5]0x89	! Mem[0000000030081410] = ffffff6f 00000000
!	%l4 = ffffffffffffff6f, Mem[0000000020800001] = ff2d98bf, %asi = 80
	stba	%l4,[%o1+0x001]%asi	! Mem[0000000020800000] = ff6f98bf
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = 00000000 00000000, %l2 = 00000003, %l3 = 00000000
	ldda	[%i6+%o4]0x80,%l2	! %l2 = 0000000000000000 0000000000000000

p0_label_261:
!	Mem[0000000010041410] = 0000ffffe0000000, %f12 = bad76926 e0000000
	ldd	[%i1+%o5],%f12		! %f12 = 0000ffff e0000000
!	Mem[0000000030081400] = 00000000, %l5 = 0000000000000000
	lduwa	[%i2+%g0]0x81,%l5	! %l5 = 0000000000000000
!	Code Fragment 4
p0_fragment_30:
!	%l0 = 0000000000000000
	setx	0x66f7255010239fd5,%g7,%l0 ! %l0 = 66f7255010239fd5
!	%l1 = fffff26b00000d94
	setx	0xb35a07dfdaa157e1,%g7,%l1 ! %l1 = b35a07dfdaa157e1
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 66f7255010239fd5
	setx	0xb9ac066851e0a397,%g7,%l0 ! %l0 = b9ac066851e0a397
!	%l1 = b35a07dfdaa157e1
	setx	0xc95a9d3ff5938178,%g7,%l1 ! %l1 = c95a9d3ff5938178
!	Mem[0000000010141400] = 00000000, %l5 = 0000000000000000
	lduba	[%i5+%g0]0x88,%l5	! %l5 = 0000000000000000
!	Mem[00000000100c1400] = 00000000, %l3 = 0000000000000000
	lduwa	[%i3+%g0]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000030141410] = ff000000, %f2  = 5d000000
	lda	[%i5+%o5]0x81,%f2 	! %f2 = ff000000
!	Mem[00000000100c1410] = 0000000000000000, %l7 = 0000000090ffde48
	ldxa	[%i3+0x010]%asi,%l7	! %l7 = 0000000000000000
!	Mem[0000000030001408] = ffffffffffffffff, %f8  = 00000031 00000003
	ldda	[%i0+%o4]0x81,%f8 	! %f8  = ffffffff ffffffff
!	Mem[0000000010041408] = 4ccaffff, %l2 = 0000000000000000
	lduba	[%i1+%o4]0x80,%l2	! %l2 = 000000000000004c
!	Starting 10 instruction Store Burst
!	%l6 = 0000000000000073, Mem[0000000030181408] = ff000000
	stba	%l6,[%i6+%o4]0x81	! Mem[0000000030181408] = 73000000

p0_label_262:
!	Mem[0000000030081410] = ffffff6f, %l3 = 0000000000000000
	ldstuba	[%i2+%o5]0x89,%l3	! %l3 = 0000006f000000ff
!	%l1 = c95a9d3ff5938178, Mem[0000000030041410] = 00000000
	stha	%l1,[%i1+%o5]0x81	! Mem[0000000030041410] = 81780000
!	Mem[0000000030001400] = ff00ca4c, %l4 = ffffffffffffff6f
	swapa	[%i0+%g0]0x89,%l4	! %l4 = 00000000ff00ca4c
!	Code Fragment 3
p0_fragment_31:
!	%l0 = b9ac066851e0a397
	setx	0x83eff698477c0dbc,%g7,%l0 ! %l0 = 83eff698477c0dbc
!	%l1 = c95a9d3ff5938178
	setx	0x93d25e8800637ab1,%g7,%l1 ! %l1 = 93d25e8800637ab1
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 83eff698477c0dbc
	setx	0x89e7a197b2d2ba6c,%g7,%l0 ! %l0 = 89e7a197b2d2ba6c
!	%l1 = 93d25e8800637ab1
	setx	0xe506685001287bb6,%g7,%l1 ! %l1 = e506685001287bb6
!	Mem[00000000211c0000] = 0073c666, %l1 = e506685001287bb6
	ldstub	[%o2+%g0],%l1		! %l1 = 00000000000000ff
!	%f10 = 9ac0a24d 00000000, Mem[0000000010081410] = c8d3deff 00000000
	stda	%f10,[%i2+%o5]0x88	! Mem[0000000010081410] = 9ac0a24d 00000000
!	%f30 = 00000000 00000000, %l7 = 0000000000000000
!	Mem[0000000010181408] = 0000000000000000
	add	%i6,0x008,%g1
	stda	%f30,[%g1+%l7]ASI_PST16_PL ! Mem[0000000010181408] = 0000000000000000
!	%f16 = 00000000 00000031 000000ff ff210000
!	%f20 = b9ffffff 00000000 ff000000 34000000
!	%f24 = 00000000 00000031 00000000 7f800000
!	%f28 = 1fcd8dc7 cfa633ff 00000000 00000000
	stda	%f16,[%i6]ASI_BLK_S	! Block Store to 0000000030181400
!	%l5 = 0000000000000000, Mem[000000001010140c] = 00860000
	stb	%l5,[%i4+0x00c]		! Mem[000000001010140c] = 00860000
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (40)
!	Mem[0000000010181410] = 000000007f800000, %l1 = 0000000000000000
	ldxa	[%i6+%o5]0x88,%l1	! %l1 = 000000007f800000

p0_label_263:
!	Mem[0000000010141408] = 6fffffff, %l7 = 0000000000000000
	ldub	[%i5+0x009],%l7		! %l7 = 00000000000000ff
!	%f28 = 1fcd8dc7 cfa633ff, %f13 = e0000000
	fdtoi	%f28,%f13		! %f13 = 00000000
!	Mem[0000000010141410] = 00005b00, %f3  = ff000000
	lda	[%i5+%o5]0x88,%f3 	! %f3 = 00005b00
!	Mem[00000000218001c0] = 002d13ce, %l5 = 0000000000000000
	ldub	[%o3+0x1c0],%l5		! %l5 = 0000000000000000
!	Mem[00000000100c1438] = 2d00002d, %l0 = 89e7a197b2d2ba6c
	lduh	[%i3+0x038],%l0		! %l0 = 0000000000002d00
!	Mem[0000000010181410] = 0000807f, %f16 = 00000000
	lda	[%i6+%o5]0x80,%f16	! %f16 = 0000807f
!	Mem[00000000100c1400] = 00000000, %l2 = 000000000000004c
	lduwa	[%i3+%g0]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000030141408] = cf8867c4, %l5 = 0000000000000000
	lduwa	[%i5+%o4]0x81,%l5	! %l5 = 00000000cf8867c4
!	Mem[00000000201c0000] = ffff6bf6, %l1 = 000000007f800000
	lduba	[%o0+0x001]%asi,%l1	! %l1 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l6 = 0000000000000073, Mem[0000000010181418] = ffffffff
	stw	%l6,[%i6+0x018]		! Mem[0000000010181418] = 00000073

p0_label_264:
!	%l4 = 00000000ff00ca4c, Mem[00000000100c1400] = 00000000
	stba	%l4,[%i3+%g0]0x88	! Mem[00000000100c1400] = 0000004c
!	%f11 = 00000000, Mem[00000000300c1400] = ff000000
	sta	%f11,[%i3+%g0]0x81	! Mem[00000000300c1400] = 00000000
!	Mem[00000000201c0000] = ffff6bf6, %l0 = 0000000000002d00
	ldstub	[%o0+%g0],%l0		! %l0 = 000000ff000000ff
!	Mem[0000000010141410] = 005b0000, %l0 = 00000000000000ff
	ldstuba	[%i5+%o5]0x80,%l0	! %l0 = 00000000000000ff
!	%f22 = ff000000 34000000, Mem[0000000010101408] = 000000cf 00860000
	stda	%f22,[%i4+%o4]0x80	! Mem[0000000010101408] = ff000000 34000000
!	%l6 = 0000000000000073, imm = fffffffffffff906, %l5 = 00000000cf8867c4
	subc	%l6,-0x6fa,%l5		! %l5 = 000000000000076d
!	%l4 = 00000000ff00ca4c, Mem[0000000030001410] = 0b41963100000000
	stxa	%l4,[%i0+%o5]0x89	! Mem[0000000030001410] = 00000000ff00ca4c
!	Mem[0000000010081429] = b1ded3c8, %l2 = 0000000000000000
	ldstuba	[%i2+0x029]%asi,%l2	! %l2 = 000000de000000ff
!	Mem[00000000300c1400] = 00000000, %l6 = 0000000000000073
	swapa	[%i3+%g0]0x81,%l6	! %l6 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = 00000000, %l3 = 000000000000006f
	ldswa	[%i1+%g0]0x88,%l3	! %l3 = 0000000000000000

p0_label_265:
!	Mem[0000000030041410] = 81780000, %f25 = 00000031
	lda	[%i1+%o5]0x81,%f25	! %f25 = 81780000
!	Mem[0000000010081410] = 00000000, %f31 = 00000000
	lda	[%i2+0x010]%asi,%f31	! %f31 = 00000000
!	Mem[0000000010001404] = ff7c00ff, %l7 = 00000000000000ff
	ldub	[%i0+0x006],%l7		! %l7 = 0000000000000000
!	Mem[0000000010041408] = bad76926ffffca4c, %f16 = 0000807f 00000031
	ldda	[%i1+%o4]0x88,%f16	! %f16 = bad76926 ffffca4c
!	Mem[0000000010001408] = 00000031, %l7 = 0000000000000000
	lduwa	[%i0+%o4]0x88,%l7	! %l7 = 0000000000000031
!	Mem[00000000100c1408] = 0000ffff, %l1 = 00000000000000ff
	ldsba	[%i3+%o4]0x88,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010081420] = 00000034, %l0 = 0000000000000000
	ldub	[%i2+0x021],%l0		! %l0 = 0000000000000000
!	Mem[0000000010001408] = 0000000000000031, %l6 = 0000000000000000
	ldxa	[%i0+%o4]0x88,%l6	! %l6 = 0000000000000031
	membar	#Sync			! Added by membar checker (41)
!	Mem[0000000030001400] = 6fffffff 00000000 ffffffff ffffffff
!	Mem[0000000030001410] = 4cca00ff 00000000 3fd4f6b1 6bac2748
!	Mem[0000000030001420] = 5e1274e7 a4e0e78b 000000ff a90947ff
!	Mem[0000000030001430] = d19d02da d35f234f 00000000 0000807f
	ldda	[%i0]ASI_BLK_S,%f0	! Block Load from 0000000030001400
!	Starting 10 instruction Store Burst
!	Mem[0000000010101408] = ff000000, %l3 = 0000000000000000
	ldstuba	[%i4+%o4]0x80,%l3	! %l3 = 000000ff000000ff

p0_label_266:
!	%l3 = 00000000000000ff, Mem[0000000030041410] = 81780000
	stba	%l3,[%i1+%o5]0x81	! Mem[0000000030041410] = ff780000
!	Mem[0000000030101400] = 78b5ffff, %l0 = 0000000000000000
	ldstuba	[%i4+%g0]0x81,%l0	! %l0 = 00000078000000ff
!	%f17 = ffffca4c, Mem[0000000030081408] = ff000000
	sta	%f17,[%i2+%o4]0x81	! Mem[0000000030081408] = ffffca4c
!	Mem[00000000100c1400] = 4c000000, %l7 = 0000000000000031
	ldstub	[%i3+%g0],%l7		! %l7 = 0000004c000000ff
!	%l2 = 00000000000000de, Mem[00000000300c1410] = 4da2c09a
	stha	%l2,[%i3+%o5]0x89	! Mem[00000000300c1410] = 4da200de
!	%f30 = 00000000 00000000, %l6 = 0000000000000031
!	Mem[0000000030181400] = 0000000000000031
	stda	%f30,[%i6+%l6]ASI_PST32_SL ! Mem[0000000030181400] = 0000000000000031
!	Mem[0000000010041408] = ffffca4c, %l3 = 00000000000000ff
	ldstuba	[%i1+%o4]0x88,%l3	! %l3 = 0000004c000000ff
!	%f20 = b9ffffff 00000000, Mem[0000000030101408] = 00000000 2d000000
	stda	%f20,[%i4+%o4]0x89	! Mem[0000000030101408] = b9ffffff 00000000
!	%f24 = 00000000 81780000, %l5 = 000000000000076d
!	Mem[0000000030181408] = 000000ffff210000
	add	%i6,0x008,%g1
	stda	%f24,[%g1+%l5]ASI_PST32_S ! Mem[0000000030181408] = 000000ff81780000
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = 31000000, %l7 = 000000000000004c
	ldsba	[%i0+%o4]0x80,%l7	! %l7 = 0000000000000031

p0_label_267:
!	Mem[00000000100c1418] = 00000000 0000005d, %l2 = 000000de, %l3 = 0000004c
	ldd	[%i3+0x018],%l2		! %l2 = 0000000000000000 000000000000005d
!	Mem[0000000020800000] = ff6f98bf, %l6 = 0000000000000031
	lduha	[%o1+0x000]%asi,%l6	! %l6 = 000000000000ff6f
!	Mem[0000000030041400] = 00000000 00008090, %l0 = 00000078, %l1 = ffffffff
	ldda	[%i1+%g0]0x89,%l0	! %l0 = 0000000000008090 0000000000000000
!	Mem[0000000010181410] = 0000807f 00000000, %l4 = ff00ca4c, %l5 = 0000076d
	ldda	[%i6+%o5]0x80,%l4	! %l4 = 000000000000807f 0000000000000000
!	Mem[0000000010081428] = b1ffd3c8, %l1 = 0000000000000000
	ldub	[%i2+0x029],%l1		! %l1 = 00000000000000ff
!	Mem[0000000010081400] = ff210000, %l0 = 0000000000008090
	lduha	[%i2+%g0]0x80,%l0	! %l0 = 000000000000ff21
!	Mem[0000000010141400] = 00000000, %l7 = 0000000000000031
	lduba	[%i5+%g0]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000010141420] = 00008600 9a327504, %l4 = 0000807f, %l5 = 00000000
	ldd	[%i5+0x020],%l4		! %l4 = 0000000000008600 000000009a327504
!	Mem[0000000020800040] = ffff359e, %l6 = 000000000000ff6f
	lduha	[%o1+0x040]%asi,%l6	! %l6 = 000000000000ffff
!	Starting 10 instruction Store Burst
!	%l3 = 000000000000005d, Mem[0000000030081410] = ffffffff
	stba	%l3,[%i2+%o5]0x89	! Mem[0000000030081410] = ffffff5d

p0_label_268:
!	%f21 = 00000000, %f25 = 81780000, %f30 = 00000000 00000000
	fsmuld	%f21,%f25,%f30		! %f30 = 80000000 00000000
!	Mem[00000000201c0000] = ffff6bf6, %l7 = 0000000000000000
	ldstub	[%o0+%g0],%l7		! %l7 = 000000ff000000ff
!	Mem[0000000010041400] = 00000000, %l6 = 000000000000ffff
	ldstuba	[%i1+%g0]0x80,%l6	! %l6 = 00000000000000ff
!	%l3 = 000000000000005d, Mem[0000000010081400] = ff21000000000000
	stxa	%l3,[%i2+%g0]0x80	! Mem[0000000010081400] = 000000000000005d
!	Mem[000000001000141c] = 005b0000, %l2 = 00000000, %l5 = 9a327504
	add	%i0,0x1c,%g1
	casa	[%g1]0x80,%l2,%l5	! %l5 = 00000000005b0000
!	Mem[000000001018141a] = 00000073, %l4 = 0000000000008600
	ldstuba	[%i6+0x01a]%asi,%l4	! %l4 = 00000000000000ff
!	%f29 = cfa633ff, Mem[0000000010101408] = 000000ff
	sta	%f29,[%i4+%o4]0x88	! Mem[0000000010101408] = cfa633ff
!	%l2 = 0000000000000000, Mem[0000000030101410] = 86b847bb
	stba	%l2,[%i4+%o5]0x89	! Mem[0000000030101410] = 86b84700
!	%l1 = 00000000000000ff, Mem[0000000030181410] = ffffffb9
	stba	%l1,[%i6+%o5]0x89	! Mem[0000000030181410] = ffffffff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = ff0000000000005d, %f28 = 1fcd8dc7 cfa633ff
	ldda	[%i3+%g0]0x80,%f28	! %f28 = ff000000 0000005d

p0_label_269:
!	Mem[0000000010041438] = 00000000, %f20 = b9ffffff
	ld	[%i1+0x038],%f20	! %f20 = 00000000
!	Mem[0000000010101408] = 00000034cfa633ff, %l5 = 00000000005b0000
	ldxa	[%i4+%o4]0x88,%l5	! %l5 = 00000034cfa633ff
!	Mem[0000000021800140] = ff00cd46, %l3 = 000000000000005d
	lduh	[%o3+0x140],%l3		! %l3 = 000000000000ff00
!	Mem[0000000010141420] = 00008600, %l3 = 000000000000ff00
	lduh	[%i5+0x020],%l3		! %l3 = 0000000000000000
!	%l5 = 00000034cfa633ff, Mem[0000000010001410] = ff47b886
	stwa	%l5,[%i0+%o5]0x80	! Mem[0000000010001410] = cfa633ff
!	Mem[00000000300c1408] = 000000000000807f, %l6 = 0000000000000000
	ldxa	[%i3+%o4]0x81,%l6	! %l6 = 000000000000807f
!	Mem[0000000030101408] = 00000000, %l1 = 00000000000000ff
	ldswa	[%i4+%o4]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000010081400] = 00000000, %l3 = 0000000000000000
	ldsha	[%i2+%g0]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000010181400] = 00000000 00000000, %l6 = 0000807f, %l7 = 000000ff
	ldda	[%i6+0x000]%asi,%l6	! %l6 = 0000000000000000 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030101410] = 0047b886, %l7 = 0000000000000000
	ldstuba	[%i4+%o5]0x81,%l7	! %l7 = 00000000000000ff

p0_label_270:
	membar	#Sync			! Added by membar checker (42)
!	%l0 = 0000ff21, %l1 = 00000000, Mem[0000000030001410] = ff00ca4c 00000000
	stda	%l0,[%i0+%o5]0x89	! Mem[0000000030001410] = 0000ff21 00000000
!	%f30 = 80000000 00000000, Mem[0000000030041408] = ffffffff 5d000000
	stda	%f30,[%i1+%o4]0x89	! Mem[0000000030041408] = 80000000 00000000
!	Mem[00000000100c1418] = 00000000, %l7 = 0000000000000000
	swap	[%i3+0x018],%l7		! %l7 = 0000000000000000
!	%l2 = 0000000000000000, Mem[0000000030081408] = 4ccaffff
	stwa	%l2,[%i2+%o4]0x89	! Mem[0000000030081408] = 00000000
!	Mem[0000000010081400] = 00000000, %l4 = 0000000000000000
	ldstuba	[%i2+%g0]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030081408] = 00000000, %l5 = 00000034cfa633ff
	ldstuba	[%i2+%o4]0x81,%l5	! %l5 = 00000000000000ff
!	%f11 = a90947ff, %f11 = a90947ff
	fcmpes	%fcc2,%f11,%f11		! %fcc2 = 0
!	%l3 = 0000000000000000, Mem[00000000201c0000] = ffff6bf6
	sth	%l3,[%o0+%g0]		! Mem[00000000201c0000] = 00006bf6
!	%f8  = 5e1274e7 a4e0e78b, %l6 = 0000000000000000
!	Mem[0000000030181428] = 000000007f800000
	add	%i6,0x028,%g1
	stda	%f8,[%g1+%l6]ASI_PST8_S ! Mem[0000000030181428] = 000000007f800000
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = 00006bf6, %l7 = 0000000000000000
	lduba	[%o0+0x001]%asi,%l7	! %l7 = 0000000000000000

p0_label_271:
!	Mem[0000000010101428] = 2d00002d, %l6 = 0000000000000000
	lduh	[%i4+0x028],%l6		! %l6 = 0000000000002d00
!	Mem[0000000030101400] = ffffb5ff, %f19 = ff210000
	lda	[%i4+%g0]0x89,%f19	! %f19 = ffffb5ff
!	Mem[0000000010001410] = cfa633ff92e6fbc0, %l5 = 0000000000000000
	ldxa	[%i0+%o5]0x80,%l5	! %l5 = cfa633ff92e6fbc0
!	Mem[0000000010001408] = 3100000000000000, %f24 = 00000000 81780000
	ldda	[%i0+%o4]0x80,%f24	! %f24 = 31000000 00000000
!	Mem[00000000100c1408] = 0000ffff, %l1 = 0000000000000000
	ldsha	[%i3+%o4]0x88,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010041420] = 0000002d, %l0 = 000000000000ff21
	lduw	[%i1+0x020],%l0		! %l0 = 000000000000002d
!	%f8  = 5e1274e7, %f3  = ffffffff, %f10 = 000000ff a90947ff
	fsmuld	%f8 ,%f3 ,%f10		! %f10 = ffffffff e0000000
!	Mem[0000000010001400] = cf8867c4, %l4 = 0000000000000000
	ldswa	[%i0+%g0]0x80,%l4	! %l4 = ffffffffcf8867c4
!	Mem[0000000010041410] = ffff0000, %l3 = 0000000000000000
	ldsba	[%i1+%o5]0x88,%l3	! %l3 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l0 = 0000002d, %l1 = ffffffff, Mem[0000000010041408] = ffffcaff bad76926
	stda	%l0,[%i1+%o4]0x88	! Mem[0000000010041408] = 0000002d ffffffff

p0_label_272:
!	%l1 = ffffffffffffffff, Mem[0000000030081410] = 5dffffff00000000
	stxa	%l1,[%i2+%o5]0x81	! Mem[0000000030081410] = ffffffffffffffff
!	%l7 = 0000000000000000, Mem[0000000010181410] = 0000807f00000000
	stx	%l7,[%i6+%o5]		! Mem[0000000010181410] = 0000000000000000
!	%l2 = 0000000000000000, Mem[0000000030041400] = 00008090
	stba	%l2,[%i1+%g0]0x89	! Mem[0000000030041400] = 00008000
!	%f24 = 31000000 00000000, Mem[0000000030181408] = 000000ff 81780000
	stda	%f24,[%i6+%o4]0x81	! Mem[0000000030181408] = 31000000 00000000
!	%l0 = 0000002d, %l1 = ffffffff, Mem[00000000100c1400] = ff000000 0000005d
	stda	%l0,[%i3+%g0]0x80	! Mem[00000000100c1400] = 0000002d ffffffff
!	%f20 = 00000000 00000000, Mem[0000000010041408] = 2d000000 ffffffff
	stda	%f20,[%i1+%o4]0x80	! Mem[0000000010041408] = 00000000 00000000
!	%l0 = 0000002d, %l1 = ffffffff, Mem[0000000030081400] = 00000000 03000000
	stda	%l0,[%i2+%g0]0x89	! Mem[0000000030081400] = 0000002d ffffffff
!	%f0  = 6fffffff 00000000 ffffffff ffffffff
!	%f4  = 4cca00ff 00000000 3fd4f6b1 6bac2748
!	%f8  = 5e1274e7 a4e0e78b ffffffff e0000000
!	%f12 = d19d02da d35f234f 00000000 0000807f
	stda	%f0,[%i1]ASI_COMMIT_S	! Block Store to 0000000030041400
!	%l5 = cfa633ff92e6fbc0, Mem[0000000010001428] = 0000ff91, %asi = 80
	stwa	%l5,[%i0+0x028]%asi	! Mem[0000000010001428] = 92e6fbc0
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = 0000000000000000, %l4 = ffffffffcf8867c4
	ldxa	[%i3+%o5]0x80,%l4	! %l4 = 0000000000000000

p0_label_273:
!	Mem[0000000030001400] = 6fffffff, %l5 = cfa633ff92e6fbc0
	ldswa	[%i0+%g0]0x81,%l5	! %l5 = 000000006fffffff
!	Mem[0000000021800140] = ff00cd46, %l0 = 000000000000002d
	ldub	[%o3+0x140],%l0		! %l0 = 00000000000000ff
!	Mem[0000000030101410] = ff47b886, %l7 = 0000000000000000
	lduba	[%i4+%o5]0x81,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030081400] = ffffffff 0000002d, %l2 = 00000000, %l3 = 00000000
	ldda	[%i2+%g0]0x89,%l2	! %l2 = 000000000000002d 00000000ffffffff
!	Mem[0000000030001400] = 6fffffff, %l2 = 000000000000002d
	ldsba	[%i0+%g0]0x81,%l2	! %l2 = 000000000000006f
!	Mem[0000000010081400] = ff000000, %l4 = 0000000000000000
	ldsba	[%i2+%g0]0x80,%l4	! %l4 = ffffffffffffffff
!	%l5 = 000000006fffffff, immed = fffff8ce, %y  = fffff26b
	sdiv	%l5,-0x732,%l5		! %l5 = 000000007fffffff
	mov	%l0,%y			! %y = 000000ff
!	Mem[0000000010141410] = ff5b0000, %l7 = 00000000000000ff
	lduba	[%i5+%o5]0x80,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030001408] = ffffffff, %l4 = ffffffffffffffff
	lduba	[%i0+%o4]0x81,%l4	! %l4 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l6 = 0000000000002d00, Mem[0000000010081408] = 807f21ff
	stwa	%l6,[%i2+%o4]0x80	! Mem[0000000010081408] = 00002d00

p0_label_274:
!	%l1 = ffffffffffffffff, Mem[0000000030081410] = ffffffff
	stha	%l1,[%i2+%o5]0x81	! Mem[0000000030081410] = ffffffff
!	%f26 = 00000000 7f800000, Mem[0000000010141408] = 6fffffff ffffffff
	stda	%f26,[%i5+%o4]0x80	! Mem[0000000010141408] = 00000000 7f800000
!	%l4 = 00000000000000ff, Mem[00000000218000c0] = e8e8e4de, %asi = 80
	stba	%l4,[%o3+0x0c0]%asi	! Mem[00000000218000c0] = ffe8e4de
!	%l1 = ffffffffffffffff, Mem[0000000010181408] = 0000000000000000
	stxa	%l1,[%i6+%o4]0x80	! Mem[0000000010181408] = ffffffffffffffff
!	Mem[0000000010181420] = 00000000, %l6 = 00002d00, %l3 = ffffffff
	add	%i6,0x20,%g1
	casa	[%g1]0x80,%l6,%l3	! %l3 = 0000000000000000
!	%l6 = 00002d00, %l7 = 000000ff, Mem[0000000010081400] = ff000000 0000005d
	stda	%l6,[%i2+%g0]0x80	! Mem[0000000010081400] = 00002d00 000000ff
!	%f25 = 00000000, Mem[0000000030181408] = 00000031
	sta	%f25,[%i6+%o4]0x89	! Mem[0000000030181408] = 00000000
!	%l1 = ffffffffffffffff, Mem[00000000100c1410] = 00000000
	stwa	%l1,[%i3+%o5]0x80	! Mem[00000000100c1410] = ffffffff
!	%l0 = 00000000000000ff, Mem[0000000010001400] = cf8867c4ff7c00ff
	stxa	%l0,[%i0+%g0]0x80	! Mem[0000000010001400] = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = 00000000, %l1 = ffffffffffffffff
	lduba	[%i4+%o5]0x80,%l1	! %l1 = 0000000000000000

p0_label_275:
!	Mem[00000000300c1408] = 00000000, %l5 = 000000007fffffff
	lduba	[%i3+%o4]0x89,%l5	! %l5 = 0000000000000000
!	Mem[00000000300c1400] = 00000073, %l6 = 0000000000002d00
	lduha	[%i3+%g0]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000030101410] = ff47b88692e6fbc0, %f16 = bad76926 ffffca4c
	ldda	[%i4+%o5]0x81,%f16	! %f16 = ff47b886 92e6fbc0
!	Mem[0000000021800180] = ca4c59fe, %l3 = 0000000000000000
	lduba	[%o3+0x180]%asi,%l3	! %l3 = 00000000000000ca
	membar	#Sync			! Added by membar checker (43)
!	Mem[0000000010041410] = ffff0000, %l5 = 0000000000000000
	ldswa	[%i1+%o5]0x88,%l5	! %l5 = ffffffffffff0000
!	Mem[0000000010081438] = d792467c 00000000, %l4 = 000000ff, %l5 = ffff0000
	ldd	[%i2+0x038],%l4		! %l4 = 00000000d792467c 0000000000000000
!	Mem[0000000030141408] = cf8867c4 5da9ffff, %l0 = 000000ff, %l1 = 00000000
	ldda	[%i5+%o4]0x81,%l0	! %l0 = 00000000cf8867c4 000000005da9ffff
!	Mem[0000000010101400] = 000000ff, %f18 = 000000ff
	lda	[%i4+%g0]0x88,%f18	! %f18 = 000000ff
!	Mem[00000000211c0000] = ff73c666, %l1 = 000000005da9ffff
	ldsba	[%o2+0x000]%asi,%l1	! %l1 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l0 = cf8867c4, %l1 = ffffffff, Mem[0000000010181400] = 00000000 00000000
	stda	%l0,[%i6+%g0]0x80	! Mem[0000000010181400] = cf8867c4 ffffffff

p0_label_276:
!	%f16 = ff47b886 92e6fbc0 000000ff ffffb5ff
!	%f20 = 00000000 00000000 ff000000 34000000
!	%f24 = 31000000 00000000 00000000 7f800000
!	%f28 = ff000000 0000005d 80000000 00000000
	stda	%f16,[%i1]ASI_BLK_AIUSL	! Block Store to 0000000030041400
!	%l2 = 000000000000006f, Mem[0000000010081410] = 00000000
	stha	%l2,[%i2+%o5]0x80	! Mem[0000000010081410] = 006f0000
!	%f14 = 00000000 0000807f, %l4 = 00000000d792467c
!	Mem[0000000030041428] = 0000807f00000000
	add	%i1,0x028,%g1
	stda	%f14,[%g1+%l4]ASI_PST32_S ! Mem[0000000030041428] = 0000807f00000000
!	%l6 = 0000000000000000, Mem[0000000010141408] = 0000807f00000000
	stxa	%l6,[%i5+%o4]0x88	! Mem[0000000010141408] = 0000000000000000
!	%l5 = 0000000000000000, Mem[0000000010141408] = 0000000000000000
	stxa	%l5,[%i5+%o4]0x80	! Mem[0000000010141408] = 0000000000000000
!	%l0 = cf8867c4, %l1 = ffffffff, Mem[0000000010181408] = ffffffff ffffffff
	stda	%l0,[%i6+%o4]0x80	! Mem[0000000010181408] = cf8867c4 ffffffff
!	Mem[0000000010101410] = 00000000, %l0 = 00000000cf8867c4
	ldstuba	[%i4+%o5]0x80,%l0	! %l0 = 00000000000000ff
!	%l4 = 00000000d792467c, %l3 = 00000000000000ca, %y  = 000000ff
	umul	%l4,%l3,%l0		! %l0 = 000000aa196b9dd8, %y = 000000aa
!	%l7 = 00000000000000ff, Mem[0000000010181400] = ffffffffc46788cf
	stxa	%l7,[%i6+%g0]0x88	! Mem[0000000010181400] = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = c0fbe692ff33a6cf, %f8  = 5e1274e7 a4e0e78b
	ldda	[%i0+%o5]0x88,%f8 	! %f8  = c0fbe692 ff33a6cf

p0_label_277:
	membar	#Sync			! Added by membar checker (44)
!	Mem[0000000010041410] = ffff0000, %l5 = 0000000000000000
	ldswa	[%i1+%o5]0x88,%l5	! %l5 = ffffffffffff0000
!	Mem[0000000030001400] = ffffff6f, %l1 = ffffffffffffffff
	ldsba	[%i0+%g0]0x89,%l1	! %l1 = 000000000000006f
!	Mem[0000000030101400] = ffffb5ff, %f8  = c0fbe692
	lda	[%i4+%g0]0x89,%f8 	! %f8 = ffffb5ff
!	Mem[00000000300c1410] = 4da200de, %l1 = 000000000000006f
	ldsha	[%i3+%o5]0x89,%l1	! %l1 = 00000000000000de
!	Mem[0000000010181438] = 5d0000002d00002d, %f16 = ff47b886 92e6fbc0
	ldda	[%i6+0x038]%asi,%f16	! %f16 = 5d000000 2d00002d
!	Mem[0000000030001408] = ffffffff, %l2 = 000000000000006f
	ldswa	[%i0+%o4]0x81,%l2	! %l2 = ffffffffffffffff
!	Mem[00000000100c1400] = 0000002d, %f30 = 80000000
	lda	[%i3+0x000]%asi,%f30	! %f30 = 0000002d
!	Mem[00000000211c0000] = ff73c666, %l3 = 00000000000000ca
	ldsh	[%o2+%g0],%l3		! %l3 = ffffffffffffff73
!	Mem[0000000010141400] = 00000000, %l1 = 00000000000000de
	lduha	[%i5+%g0]0x80,%l1	! %l1 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030181410] = ffffffff, %l7 = 00000000000000ff
	swapa	[%i6+%o5]0x89,%l7	! %l7 = 00000000ffffffff

p0_label_278:
!	%l1 = 0000000000000000, Mem[00000000300c1400] = 73000000
	stba	%l1,[%i3+%g0]0x89	! Mem[00000000300c1400] = 73000000
!	%l4 = 00000000d792467c, Mem[0000000010101400] = 000000ff
	stha	%l4,[%i4+%g0]0x88	! Mem[0000000010101400] = 0000467c
!	%l1 = 0000000000000000, Mem[0000000010181410] = 00000000
	stwa	%l1,[%i6+%o5]0x88	! Mem[0000000010181410] = 00000000
!	Mem[000000001004142c] = c46788cf, %l1 = 0000000000000000
	swap	[%i1+0x02c],%l1		! %l1 = 00000000c46788cf
!	%l6 = 0000000000000000, Mem[0000000010141410] = 00005bff
	stha	%l6,[%i5+%o5]0x88	! Mem[0000000010141410] = 00000000
!	Mem[0000000010081408] = 002d0000, %l1 = 00000000c46788cf
	ldstuba	[%i2+%o4]0x88,%l1	! %l1 = 00000000000000ff
!	%l0 = 000000aa196b9dd8, Mem[0000000010141410] = 00000000
	stba	%l0,[%i5+%o5]0x80	! Mem[0000000010141410] = d8000000
!	%l5 = ffffffffffff0000, Mem[00000000211c0000] = ff73c666, %asi = 80
	stha	%l5,[%o2+0x000]%asi	! Mem[00000000211c0000] = 0000c666
!	Mem[00000000100c1408] = 0000ffff, %l2 = ffffffffffffffff
	ldstuba	[%i3+%o4]0x88,%l2	! %l2 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = 0000ffff, %l4 = 00000000d792467c
	lduha	[%i3+%o4]0x88,%l4	! %l4 = 000000000000ffff

p0_label_279:
!	Mem[0000000010101404] = 000000ff, %l3 = ffffffffffffff73
	lduha	[%i4+0x006]%asi,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010101438] = ff000000, %l0 = 000000aa196b9dd8
	ldsw	[%i4+0x038],%l0		! %l0 = ffffffffff000000
!	Mem[0000000030181400] = 00000000, %l6 = 0000000000000000
	lduba	[%i6+%g0]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000010041408] = 00000000, %l1 = 0000000000000000
	ldsba	[%i1+%o4]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000030041410] = 0000000000000000, %f18 = 000000ff ffffb5ff
	ldda	[%i1+%o5]0x89,%f18	! %f18 = 00000000 00000000
!	Mem[00000000300c1408] = 7f80000000000000, %l0 = ffffffffff000000
	ldxa	[%i3+%o4]0x89,%l0	! %l0 = 7f80000000000000
!	Mem[00000000100c1400] = 0000002d, %l7 = 00000000ffffffff
	lduha	[%i3+%g0]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000010101400] = ff000000 0000467c, %l6 = 00000000, %l7 = 00000000
	ldda	[%i4+%g0]0x88,%l6	! %l6 = 000000000000467c 00000000ff000000
!	Mem[0000000010181400] = 000000ff, %l2 = 00000000000000ff
	lduba	[%i6+%g0]0x88,%l2	! %l2 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l1 = 0000000000000000, Mem[0000000010181410] = 00000000
	stwa	%l1,[%i6+%o5]0x88	! Mem[0000000010181410] = 00000000

p0_label_280:
!	Mem[0000000030001410] = 21ff0000, %l2 = 00000000000000ff
	ldstuba	[%i0+%o5]0x81,%l2	! %l2 = 00000021000000ff
!	%l4 = 000000000000ffff, Mem[0000000010001408] = 31000000
	stba	%l4,[%i0+%o4]0x80	! Mem[0000000010001408] = ff000000
!	%l1 = 0000000000000000, Mem[0000000010041410] = 0000ffff
	stha	%l1,[%i1+%o5]0x80	! Mem[0000000010041410] = 0000ffff
!	%l3 = 00000000000000ff, Mem[0000000010101430] = ff0000ff, %asi = 80
	stwa	%l3,[%i4+0x030]%asi	! Mem[0000000010101430] = 000000ff
!	Mem[00000000100c1408] = ffff0000, %l4 = 000000000000ffff
	swapa	[%i3+%o4]0x80,%l4	! %l4 = 00000000ffff0000
!	Mem[0000000010001400] = 00000000, %l4 = 00000000ffff0000
	ldstuba	[%i0+%g0]0x80,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030041410] = 00000000, %l6 = 000000000000467c
	ldstuba	[%i1+%o5]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030041410] = ff000000, %l7 = 00000000ff000000
	swapa	[%i1+%o5]0x81,%l7	! %l7 = 00000000ff000000
!	Mem[00000000201c0000] = 00006bf6, %l6 = 0000000000000000
	ldstuba	[%o0+0x000]%asi,%l6	! %l6 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = ff000000 000000ff, %l2 = 00000021, %l3 = 000000ff
	ldda	[%i5+%o5]0x81,%l2	! %l2 = 00000000ff000000 00000000000000ff

p0_label_281:
!	Mem[0000000030181408] = 00000000 00000000, %l2 = ff000000, %l3 = 000000ff
	ldda	[%i6+%o4]0x89,%l2	! %l2 = 0000000000000000 0000000000000000
!	Mem[0000000010001400] = ff000000 000000ff, %l2 = 00000000, %l3 = 00000000
	ldda	[%i0+%g0]0x88,%l2	! %l2 = 00000000000000ff 00000000ff000000
!	Mem[0000000010181408] = cf8867c4, %l7 = 00000000ff000000
	lduwa	[%i6+0x008]%asi,%l7	! %l7 = 00000000cf8867c4
!	Mem[0000000030001410] = 0000ffff, %l0 = 7f80000000000000
	lduha	[%i0+%o5]0x89,%l0	! %l0 = 000000000000ffff
!	Mem[00000000100c1400] = 0000002d, %l0 = 000000000000ffff
	lduha	[%i3+%g0]0x80,%l0	! %l0 = 0000000000000000
!	Mem[00000000100c1418] = 00000000, %l4 = 0000000000000000
	ldsha	[%i3+0x018]%asi,%l4	! %l4 = 0000000000000000
!	Mem[0000000010081420] = 00000034dd95c5ff, %f0  = 6fffffff 00000000
	ldd	[%i2+0x020],%f0 	! %f0  = 00000034 dd95c5ff
!	Mem[0000000030001410] = 0000ffff, %l2 = 00000000000000ff
	lduba	[%i0+%o5]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[0000000020800000] = ff6f98bf, %l5 = ffffffffffff0000
	ldub	[%o1+0x001],%l5		! %l5 = 000000000000006f
!	Starting 10 instruction Store Burst
!	%l2 = 000000ff, %l3 = ff000000, Mem[0000000010001410] = ff33a6cf c0fbe692
	stda	%l2,[%i0+%o5]0x88	! Mem[0000000010001410] = 000000ff ff000000

p0_label_282:
!	%l0 = 00000000, %l1 = 00000000, Mem[0000000010181418] = 0000ff73 00000000
	std	%l0,[%i6+0x018]		! Mem[0000000010181418] = 00000000 00000000
!	%l4 = 0000000000000000, Mem[0000000021800140] = ff00cd46, %asi = 80
	stba	%l4,[%o3+0x140]%asi	! Mem[0000000021800140] = 0000cd46
!	%l4 = 00000000, %l5 = 0000006f, Mem[0000000030181400] = 00000000 31000000
	stda	%l4,[%i6+%g0]0x89	! Mem[0000000030181400] = 00000000 0000006f
!	%l7 = 00000000cf8867c4, Mem[00000000300c1410] = 4da200de
	stha	%l7,[%i3+%o5]0x89	! Mem[00000000300c1410] = 4da267c4
!	%f30 = 0000002d 00000000, %l3 = 00000000ff000000
!	Mem[0000000010181428] = 9ac0a24dffff5252
	add	%i6,0x028,%g1
	stda	%f30,[%g1+%l3]ASI_PST32_PL ! Mem[0000000010181428] = 9ac0a24dffff5252
!	%l1 = 0000000000000000, Mem[000000001010141c] = 0000ffff, %asi = 80
	stwa	%l1,[%i4+0x01c]%asi	! Mem[000000001010141c] = 00000000
!	Mem[00000000300c1410] = 4da267c4, %l0 = 0000000000000000
	ldstuba	[%i3+%o5]0x89,%l0	! %l0 = 000000c4000000ff
!	Mem[0000000010081400] = 00002d00, %l4 = 0000000000000000
	swapa	[%i2+%g0]0x80,%l4	! %l4 = 0000000000002d00
!	Mem[0000000030181410] = 000000ff, %l6 = 0000000000000000
	ldstuba	[%i6+%o5]0x89,%l6	! %l6 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	%f5  = 00000000, %f28 = ff000000, %f26 = 00000000 7f800000
	fsmuld	%f5 ,%f28,%f26		! %f26 = 80000000 00000000

p0_label_283:
!	Mem[0000000010101408] = ff33a6cf 34000000, %l6 = 000000ff, %l7 = cf8867c4
	ldda	[%i4+%o4]0x80,%l6	! %l6 = 00000000ff33a6cf 0000000034000000
!	%l6 = 00000000ff33a6cf, immed = fffff679, %y  = 000000aa
	umul	%l6,-0x987,%l2		! %l2 = ff339d4f9ae5c1d7, %y = ff339d4f
!	Mem[0000000030101400] = ffb5ffff, %l5 = 000000000000006f
	ldsha	[%i4+%g0]0x81,%l5	! %l5 = ffffffffffffffb5
!	Mem[0000000010001410] = 000000ff, %l2 = ff339d4f9ae5c1d7
	ldsba	[%i0+%o5]0x88,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000010101430] = 000000ff, %l6 = 00000000ff33a6cf
	lduha	[%i4+0x030]%asi,%l6	! %l6 = 0000000000000000
!	Mem[0000000010081400] = 00000000000000ff, %l0 = 00000000000000c4
	ldxa	[%i2+%g0]0x80,%l0	! %l0 = 00000000000000ff
!	%l2 = ffffffffffffffff, imm = fffffffffffff191, %l7 = 0000000034000000
	sub	%l2,-0xe6f,%l7		! %l7 = 0000000000000e6e
!	Mem[0000000030081408] = ff000000ffff00ff, %f16 = 5d000000 2d00002d
	ldda	[%i2+%o4]0x81,%f16	! %f16 = ff000000 ffff00ff
!	Mem[0000000010081430] = ff33a6cfc78dcd1f, %f4  = 4cca00ff 00000000
	ldd	[%i2+0x030],%f4 	! %f4  = ff33a6cf c78dcd1f
!	Starting 10 instruction Store Burst
!	Mem[0000000010141408] = 00000000, %l5 = ffffffffffffffb5
	swapa	[%i5+%o4]0x80,%l5	! %l5 = 0000000000000000

p0_label_284:
!	Mem[0000000010001408] = ff000000, %l0 = 00000000000000ff
	swapa	[%i0+%o4]0x80,%l0	! %l0 = 00000000ff000000
!	%l3 = 00000000ff000000, Mem[0000000010081400] = 00000000
	stba	%l3,[%i2+%g0]0x80	! Mem[0000000010081400] = 00000000
!	Mem[0000000030141400] = ffffff6f, %l7 = 0000000000000e6e
	swapa	[%i5+%g0]0x89,%l7	! %l7 = 00000000ffffff6f
!	%l7 = 00000000ffffff6f, Mem[00000000300c1408] = 00000000
	stwa	%l7,[%i3+%o4]0x89	! Mem[00000000300c1408] = ffffff6f
!	Mem[0000000030141410] = ff000000, %l3 = 00000000ff000000
	ldstuba	[%i5+%o5]0x81,%l3	! %l3 = 000000ff000000ff
!	%l4 = 0000000000002d00, Mem[0000000010141408] = ffffffb500000000, %asi = 80
	stxa	%l4,[%i5+0x008]%asi	! Mem[0000000010141408] = 0000000000002d00
!	%l6 = 00000000, %l7 = ffffff6f, Mem[0000000030181408] = 00000000 00000000
	stda	%l6,[%i6+%o4]0x81	! Mem[0000000030181408] = 00000000 ffffff6f
!	%l5 = 0000000000000000, Mem[00000000100c1410] = 00000000ffffffff
	stxa	%l5,[%i3+%o5]0x88	! Mem[00000000100c1410] = 0000000000000000
!	%l3 = 00000000000000ff, Mem[0000000030141410] = ff000000000000ff
	stxa	%l3,[%i5+%o5]0x89	! Mem[0000000030141410] = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = ffffb5ff, %l1 = 0000000000000000
	lduha	[%i1+%o4]0x89,%l1	! %l1 = 000000000000b5ff

p0_label_285:
!	Mem[00000000100c140c] = ffffff6f, %l5 = 0000000000000000
	ldswa	[%i3+0x00c]%asi,%l5	! %l5 = ffffffffffffff6f
!	Mem[0000000010041438] = 00000000, %f22 = ff000000
	lda	[%i1+0x038]%asi,%f22	! %f22 = 00000000
!	Mem[0000000010001404] = 000000ff, %f31 = 00000000
	lda	[%i0+0x004]%asi,%f31	! %f31 = 000000ff
!	Mem[0000000030041410] = ff000000, %l3 = 00000000000000ff
	lduwa	[%i1+%o5]0x81,%l3	! %l3 = 00000000ff000000
!	Mem[0000000010181408] = cf8867c4ffffffff, %l0 = 00000000ff000000
	ldxa	[%i6+%o4]0x80,%l0	! %l0 = cf8867c4ffffffff
!	Mem[0000000030041400] = 92e6fbc0, %l0 = cf8867c4ffffffff
	lduwa	[%i1+%g0]0x89,%l0	! %l0 = 0000000092e6fbc0
!	Mem[0000000010181400] = 000000ff, %f13 = d35f234f
	lda	[%i6+%g0]0x88,%f13	! %f13 = 000000ff
!	Mem[0000000030141408] = ffffa95dc46788cf, %l5 = ffffffffffffff6f
	ldxa	[%i5+%o4]0x89,%l5	! %l5 = ffffa95dc46788cf
!	Mem[0000000030181400] = 00000000, %l0 = 0000000092e6fbc0
	lduba	[%i6+%g0]0x81,%l0	! %l0 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l0 = 0000000000000000, Mem[0000000010181410] = 00000000
	stba	%l0,[%i6+%o5]0x80	! Mem[0000000010181410] = 00000000

p0_label_286:
!	Mem[0000000030101408] = 00000000, %l2 = ffffffffffffffff
	swapa	[%i4+%o4]0x89,%l2	! %l2 = 0000000000000000
!	%l4 = 0000000000002d00, immd = 0000000000000c00, %l5 = ffffa95dc46788cf
	sdivx	%l4,0xc00,%l5		! %l5 = 0000000000000003
!	%l0 = 0000000000000000, Mem[0000000030101408] = ffffffff
	stwa	%l0,[%i4+%o4]0x89	! Mem[0000000030101408] = 00000000
!	Mem[00000000100c1400] = 0000002d, %l0 = 0000000000000000
	ldstuba	[%i3+%g0]0x80,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010101424] = dd95c5ff, %l2 = 00000000, %l0 = 00000000
	add	%i4,0x24,%g1
	casa	[%g1]0x80,%l2,%l0	! %l0 = 00000000dd95c5ff
!	Mem[0000000010081430] = ff33a6cfc78dcd1f, %f14 = 00000000 0000807f
	ldda	[%i2+0x030]%asi,%f14	! %f14 = ff33a6cf c78dcd1f
!	Mem[0000000030101400] = ffb5ffff, %l2 = 0000000000000000
	ldstuba	[%i4+%g0]0x81,%l2	! %l2 = 000000ff000000ff
!	Mem[000000001008140d] = 00000000, %l1 = 000000000000b5ff
	ldstuba	[%i2+0x00d]%asi,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030001408] = ffffffff, %l7 = 00000000ffffff6f
	swapa	[%i0+%o4]0x81,%l7	! %l7 = 00000000ffffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = ff33a6cf, %l2 = 00000000000000ff
	ldsha	[%i4+0x00a]%asi,%l2	! %l2 = ffffffffffffa6cf

p0_label_287:
!	Mem[0000000010181424] = ffffffff, %f9  = ff33a6cf
	ld	[%i6+0x024],%f9 	! %f9 = ffffffff
!	Mem[0000000010101420] = 00000034, %l4 = 0000000000002d00
	lduw	[%i4+0x020],%l4		! %l4 = 0000000000000034
!	Mem[0000000030101408] = 00000000, %l1 = 0000000000000000
	ldsba	[%i4+%o4]0x89,%l1	! %l1 = 0000000000000000
!	Mem[00000000100c1408] = 6fffffff ffff0000, %l4 = 00000034, %l5 = 00000003
	ldda	[%i3+%o4]0x88,%l4	! %l4 = 00000000ffff0000 000000006fffffff
!	Mem[0000000010101400] = 7c460000, %f18 = 00000000
	lda	[%i4+0x000]%asi,%f18	! %f18 = 7c460000
!	Mem[0000000010101408] = cfa633ff, %l6 = 0000000000000000
	ldsha	[%i4+%o4]0x88,%l6	! %l6 = 00000000000033ff
!	Mem[0000000030001410] = ffff0000, %l2 = ffffffffffffa6cf
	lduwa	[%i0+%o5]0x81,%l2	! %l2 = 00000000ffff0000
!	Mem[0000000010181438] = 5d0000002d00002d, %f20 = 00000000 00000000
	ldda	[%i6+0x038]%asi,%f20	! %f20 = 5d000000 2d00002d
!	%l4 = 00000000ffff0000, imm = 000000000000016e, %l2 = 00000000ffff0000
	xnor	%l4,0x16e,%l2		! %l2 = ffffffff0000fe91
!	Starting 10 instruction Store Burst
!	Mem[0000000030181410] = ff000000, %l3 = 00000000ff000000
	lduba	[%i6+%o5]0x81,%l3	! %l3 = 00000000000000ff

p0_label_288:
!	%f14 = ff33a6cf c78dcd1f, %l4 = 00000000ffff0000
!	Mem[0000000010041410] = 0000ffffe0000000
	add	%i1,0x010,%g1
	stda	%f14,[%g1+%l4]ASI_PST8_PL ! Mem[0000000010041410] = 0000ffffe0000000
!	%f14 = ff33a6cf c78dcd1f, Mem[0000000030081400] = 2d000000 ffffffff
	stda	%f14,[%i2+%g0]0x81	! Mem[0000000030081400] = ff33a6cf c78dcd1f
!	Mem[00000000100c1439] = 2d00002d, %l2 = ffffffff0000fe91
	ldstuba	[%i3+0x039]%asi,%l2	! %l2 = 00000000000000ff
!	%l7 = 00000000ffffffff, Mem[0000000030141400] = 00000e6e
	stwa	%l7,[%i5+%g0]0x89	! Mem[0000000030141400] = ffffffff
!	%l3 = 00000000000000ff, Mem[0000000010181400] = ff00000000000000
	stx	%l3,[%i6+%g0]		! Mem[0000000010181400] = 00000000000000ff
!	%l6 = 00000000000033ff, Mem[0000000030141408] = ffffa95dc46788cf
	stxa	%l6,[%i5+%o4]0x89	! Mem[0000000030141408] = 00000000000033ff
!	Mem[0000000030041408] = ffb5ffff, %l6 = 00000000000033ff
	ldstuba	[%i1+%o4]0x81,%l6	! %l6 = 000000ff000000ff
!	%l4 = 00000000ffff0000, Mem[0000000030141400] = ffffffff
	stwa	%l4,[%i5+%g0]0x89	! Mem[0000000030141400] = ffff0000
!	%l1 = 0000000000000000, Mem[000000001014142f] = 000021ec
	stb	%l1,[%i5+0x02f]		! Mem[000000001014142c] = 00002100
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = ff33a6cf 34000000, %l6 = 000000ff, %l7 = ffffffff
	ldda	[%i4+%o4]0x80,%l6	! %l6 = 00000000ff33a6cf 0000000034000000

p0_label_289:
!	Mem[0000000010181400] = 00000000, %f9  = ffffffff
	lda	[%i6+%g0]0x80,%f9 	! %f9 = 00000000
!	Mem[00000000211c0000] = 0000c666, %l6 = 00000000ff33a6cf
	ldsb	[%o2+%g0],%l6		! %l6 = 0000000000000000
!	Mem[0000000010181400] = 00000000, %l2 = 0000000000000000
	lduha	[%i6+%g0]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000010041414] = e0000000, %l2 = 0000000000000000
	ldsw	[%i1+0x014],%l2		! %l2 = ffffffffe0000000
!	Mem[0000000010141408] = 00000000, %l6 = 0000000000000000
	lduha	[%i5+%o4]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000030101400] = ffb5ffff, %f0  = 00000034
	lda	[%i4+%g0]0x81,%f0 	! %f0 = ffb5ffff
!	Mem[0000000010101400] = 7c460000, %l4 = 00000000ffff0000
	ldsha	[%i4+%g0]0x80,%l4	! %l4 = 0000000000007c46
!	Mem[0000000030141400] = ffff0000, %l7 = 0000000034000000
	ldswa	[%i5+%g0]0x89,%l7	! %l7 = ffffffffffff0000
!	Mem[0000000030001410] = ffff0000, %l2 = ffffffffe0000000
	lduha	[%i0+%o5]0x81,%l2	! %l2 = 000000000000ffff
!	Starting 10 instruction Store Burst
!	Mem[0000000030041410] = 000000ff, %l1 = 0000000000000000
	swapa	[%i1+%o5]0x89,%l1	! %l1 = 00000000000000ff

p0_label_290:
!	%l7 = ffffffffffff0000, Mem[0000000010141434] = 0000ff00
	stb	%l7,[%i5+0x034]		! Mem[0000000010141434] = 0000ff00
!	%f21 = 2d00002d, %f18 = 7c460000
	fsqrts	%f21,%f18		! %f18 = 36350513
!	%f14 = ff33a6cf c78dcd1f, Mem[0000000030001408] = ffffff6f ffffffff
	stda	%f14,[%i0+%o4]0x81	! Mem[0000000030001408] = ff33a6cf c78dcd1f
!	%l1 = 00000000000000ff, Mem[0000000010001408] = 000000ff
	stha	%l1,[%i0+%o4]0x80	! Mem[0000000010001408] = 00ff00ff
!	%f20 = 5d000000 2d00002d, Mem[0000000030001408] = ff33a6cf c78dcd1f
	stda	%f20,[%i0+%o4]0x81	! Mem[0000000030001408] = 5d000000 2d00002d
!	%l7 = ffffffffffff0000, %l2 = 000000000000ffff, %l3 = 00000000000000ff
	subc	%l7,%l2,%l3		! %l3 = fffffffffffe0001
!	%l1 = 00000000000000ff, Mem[0000000030081410] = ffffffff
	stba	%l1,[%i2+%o5]0x89	! Mem[0000000030081410] = ffffffff
!	%f28 = ff000000 0000005d, %l3 = fffffffffffe0001
!	Mem[0000000030081420] = 00000000ffffffff
	add	%i2,0x020,%g1
	stda	%f28,[%g1+%l3]ASI_PST32_SL ! Mem[0000000030081420] = 5d000000ffffffff
!	%l7 = ffffffffffff0000, Mem[00000000211c0001] = 0000c666, %asi = 80
	stba	%l7,[%o2+0x001]%asi	! Mem[00000000211c0000] = 0000c666
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = 000000ff, %l7 = ffffffffffff0000
	lduha	[%i5+%o5]0x89,%l7	! %l7 = 00000000000000ff

p0_label_291:
!	Mem[00000000300c1410] = ff67a24d, %l4 = 0000000000007c46
	lduwa	[%i3+%o5]0x81,%l4	! %l4 = 00000000ff67a24d
!	Mem[0000000010001408] = ff00ff00, %l5 = 000000006fffffff
	lduwa	[%i0+%o4]0x88,%l5	! %l5 = 00000000ff00ff00
!	Mem[0000000010081434] = c78dcd1f, %l5 = 00000000ff00ff00
	ldub	[%i2+0x037],%l5		! %l5 = 000000000000001f
!	Mem[0000000030081400] = 1fcd8dc7cfa633ff, %l0 = 00000000dd95c5ff
	ldxa	[%i2+%g0]0x89,%l0	! %l0 = 1fcd8dc7cfa633ff
!	Mem[00000000201c0000] = ff006bf6, %l3 = fffffffffffe0001
	ldsh	[%o0+%g0],%l3		! %l3 = ffffffffffffff00
!	Mem[0000000010101400] = ff0000000000467c, %l5 = 000000000000001f
	ldxa	[%i4+%g0]0x88,%l5	! %l5 = ff0000000000467c
!	Code Fragment 3
p0_fragment_32:
!	%l0 = 1fcd8dc7cfa633ff
	setx	0xca1c30102d980dd9,%g7,%l0 ! %l0 = ca1c30102d980dd9
!	%l1 = 00000000000000ff
	setx	0xec962ec83030dee1,%g7,%l1 ! %l1 = ec962ec83030dee1
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = ca1c30102d980dd9
	setx	0x60d4243789e6592b,%g7,%l0 ! %l0 = 60d4243789e6592b
!	%l1 = ec962ec83030dee1
	setx	0xb418ecd86fb240c7,%g7,%l1 ! %l1 = b418ecd86fb240c7
!	Mem[0000000010181400] = 00000000, %l3 = ffffffffffffff00
	lduba	[%i6+%g0]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000010101408] = ff33a6cf, %l0 = 60d4243789e6592b
	ldsba	[%i4+%o4]0x80,%l0	! %l0 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l6 = 00000000, %l7 = 000000ff, Mem[0000000010041400] = 000000ff 00000000
	stda	%l6,[%i1+%g0]0x88	! Mem[0000000010041400] = 00000000 000000ff

p0_label_292:
!	Mem[0000000030001408] = 5d000000, %l0 = ffffffffffffffff
	swapa	[%i0+%o4]0x81,%l0	! %l0 = 000000005d000000
!	%l4 = ff67a24d, %l5 = 0000467c, Mem[00000000100c1410] = 00000000 00000000
	stda	%l4,[%i3+%o5]0x88	! Mem[00000000100c1410] = ff67a24d 0000467c
!	Mem[0000000010141420] = 000086009a327504, %l7 = 00000000000000ff, %l6 = 0000000000000000
	add	%i5,0x20,%g1
	casxa	[%g1]0x80,%l7,%l6	! %l6 = 000086009a327504
!	%l2 = 000000000000ffff, Mem[0000000020800040] = ffff359e, %asi = 80
	stha	%l2,[%o1+0x040]%asi	! Mem[0000000020800040] = ffff359e
!	Mem[00000000100c1408] = 0000ffff, %l2 = 000000000000ffff
	swapa	[%i3+%o4]0x80,%l2	! %l2 = 000000000000ffff
!	%f24 = 31000000, %f23 = 34000000, %f10 = ffffffff
	fdivs	%f24,%f23,%f10		! %f10 = 3c800000
!	Mem[0000000030001400] = ffffff6f, %l3 = 0000000000000000
	ldstuba	[%i0+%g0]0x89,%l3	! %l3 = 0000006f000000ff
!	Mem[00000000201c0000] = ff006bf6, %l4 = 00000000ff67a24d
	ldstub	[%o0+%g0],%l4		! %l4 = 000000ff000000ff
!	%l3 = 000000000000006f, Mem[0000000030041410] = 00000000
	stba	%l3,[%i1+%o5]0x81	! Mem[0000000030041410] = 6f000000
!	Starting 10 instruction Load Burst
!	Mem[000000001010142c] = 00000000, %l3 = 000000000000006f
	ldsw	[%i4+0x02c],%l3		! %l3 = 0000000000000000

p0_label_293:
!	Mem[0000000010181434] = ffe1e712, %l4 = 00000000000000ff
	lduw	[%i6+0x034],%l4		! %l4 = 00000000ffe1e712
!	Mem[00000000300c1400] = 00000073, %f22 = 00000000
	lda	[%i3+%g0]0x81,%f22	! %f22 = 00000073
!	Code Fragment 4
p0_fragment_33:
!	%l0 = 000000005d000000
	setx	0xa30422281de9b77a,%g7,%l0 ! %l0 = a30422281de9b77a
!	%l1 = b418ecd86fb240c7
	setx	0x9479ebd7f85be10e,%g7,%l1 ! %l1 = 9479ebd7f85be10e
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = a30422281de9b77a
	setx	0x53c179984bf5a418,%g7,%l0 ! %l0 = 53c179984bf5a418
!	%l1 = 9479ebd7f85be10e
	setx	0xada57fa792a37d23,%g7,%l1 ! %l1 = ada57fa792a37d23
!	Mem[0000000010001410] = 000000ff, %f0  = ffb5ffff
	lda	[%i0+%o5]0x88,%f0 	! %f0 = 000000ff
!	Mem[00000000100c1408] = 0000ffff ffffff6f, %l0 = 4bf5a418, %l1 = 92a37d23
	ldd	[%i3+%o4],%l0		! %l0 = 000000000000ffff 00000000ffffff6f
!	Mem[0000000010101408] = cfa633ff, %l7 = 00000000000000ff
	lduba	[%i4+%o4]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[000000001014143c] = e10ece31, %l6 = 000086009a327504
	ldsb	[%i5+0x03e],%l6		! %l6 = ffffffffffffffce
!	Mem[0000000010081408] = ff002d00, %l4 = 00000000ffe1e712
	lduha	[%i2+%o4]0x80,%l4	! %l4 = 000000000000ff00
!	Mem[0000000010081400] = 00000000 000000ff, %l4 = 0000ff00, %l5 = 0000467c
	ldd	[%i2+%g0],%l4		! %l4 = 0000000000000000 00000000000000ff
!	Starting 10 instruction Store Burst
!	%f16 = ff000000 ffff00ff 36350513 00000000
!	%f20 = 5d000000 2d00002d 00000073 34000000
!	%f24 = 31000000 00000000 80000000 00000000
!	%f28 = ff000000 0000005d 0000002d 000000ff
	stda	%f16,[%i5]ASI_BLK_P	! Block Store to 0000000010141400

p0_label_294:
!	Mem[000000001000141c] = 005b0000, %l2 = 0000ffff, %l4 = 00000000
	add	%i0,0x1c,%g1
	casa	[%g1]0x80,%l2,%l4	! %l4 = 00000000005b0000
!	Mem[0000000030081410] = ffffffff, %l3 = 0000000000000000
	ldstuba	[%i2+%o5]0x89,%l3	! %l3 = 000000ff000000ff
!	%l2 = 000000000000ffff, Mem[0000000010001408] = ff00ff00
	stba	%l2,[%i0+%o4]0x88	! Mem[0000000010001408] = ff00ffff
!	Mem[00000000100c141c] = 0000005d, %l3 = 00000000000000ff
	swap	[%i3+0x01c],%l3		! %l3 = 000000000000005d
!	%f9  = 00000000, Mem[0000000030101410] = ff47b886
	sta	%f9 ,[%i4+%o5]0x81	! Mem[0000000030101410] = 00000000
!	Mem[0000000010181410] = 00000000, %l6 = ffffffffffffffce
	ldstuba	[%i6+%o5]0x80,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030041408] = ffffb5ff, %l2 = 000000000000ffff
	ldstuba	[%i1+%o4]0x89,%l2	! %l2 = 000000ff000000ff
!	%l6 = 00000000, %l7 = 000000ff, Mem[00000000100c1418] = 00000000 000000ff
	std	%l6,[%i3+0x018]		! Mem[00000000100c1418] = 00000000 000000ff
!	Mem[00000000300c1410] = 4da267ff, %l4 = 00000000005b0000
	swapa	[%i3+%o5]0x89,%l4	! %l4 = 000000004da267ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = ff000000, %l3 = 000000000000005d
	lduwa	[%i5+%o5]0x81,%l3	! %l3 = 00000000ff000000

p0_label_295:
!	Mem[00000000100c1418] = 00000000, %l3 = 00000000ff000000
	ldsh	[%i3+0x01a],%l3		! %l3 = 0000000000000000
!	Mem[00000000300c1408] = 6fffffff0000807f, %f4  = ff33a6cf c78dcd1f
	ldda	[%i3+%o4]0x81,%f4 	! %f4  = 6fffffff 0000807f
!	Mem[00000000100c1400] = 2d0000ff, %l7 = 00000000000000ff
	ldsba	[%i3+%g0]0x88,%l7	! %l7 = ffffffffffffffff
!	Mem[00000000100c1400] = ff00002d, %l6 = 0000000000000000
	lduha	[%i3+%g0]0x80,%l6	! %l6 = 000000000000ff00
!	Mem[0000000021800180] = ca4c59fe, %l7 = ffffffffffffffff
	ldsb	[%o3+0x181],%l7		! %l7 = 000000000000004c
!	Mem[0000000010001410] = ff000000, %l2 = 00000000000000ff
	ldsba	[%i0+%o5]0x80,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000030141410] = 000000ff, %l6 = 000000000000ff00
	lduba	[%i5+%o5]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[00000000300c1410] = 005b0000, %l1 = 00000000ffffff6f
	lduba	[%i3+%o5]0x89,%l1	! %l1 = 0000000000000000
!	Mem[00000000300c1410] = 00005b00 00000000, %l4 = 4da267ff, %l5 = 000000ff
	ldda	[%i3+%o5]0x81,%l4	! %l4 = 0000000000005b00 0000000000000000
!	Starting 10 instruction Store Burst
!	%f0  = 000000ff, %f11 = e0000000, %f9  = 00000000
	fdivs	%f0 ,%f11,%f9 		! %f9  = 80000000

p0_label_296:
!	%f15 = c78dcd1f, %f15 = c78dcd1f, %f8  = ffffb5ff
	fdivs	%f15,%f15,%f8 		! %f8  = 3f800000
!	Mem[0000000010081400] = 00000000, %l7 = 000000000000004c
	swapa	[%i2+%g0]0x88,%l7	! %l7 = 0000000000000000
!	%l0 = 000000000000ffff, imm = fffffffffffff49f, %l7 = 0000000000000000
	and	%l0,-0xb61,%l7		! %l7 = 000000000000f49f
!	%l2 = ffffffffffffffff, Mem[00000000100c1408] = 0000ffff
	stba	%l2,[%i3+%o4]0x80	! Mem[00000000100c1408] = ff00ffff
!	%l5 = 0000000000000000, Mem[0000000010001400] = ff000000000000ff
	stxa	%l5,[%i0+%g0]0x80	! Mem[0000000010001400] = 0000000000000000
!	%f12 = d19d02da, Mem[0000000030001410] = 0000ffff
	sta	%f12,[%i0+%o5]0x89	! Mem[0000000030001410] = d19d02da
!	%l2 = ffffffff, %l3 = 00000000, Mem[0000000010101418] = 5d000000 00000000
	std	%l2,[%i4+0x018]		! Mem[0000000010101418] = ffffffff 00000000
	membar	#Sync			! Added by membar checker (45)
!	Mem[0000000010141400] = 000000ff, %l0 = 000000000000ffff
	ldstuba	[%i5+%g0]0x88,%l0	! %l0 = 000000ff000000ff
!	Mem[000000001004143c] = 00000000, %l5 = 0000000000000000, %asi = 80
	swapa	[%i1+0x03c]%asi,%l5	! %l5 = 0000000000000000
!	Starting 10 instruction Load Burst
!	%f23 = 34000000, %f2  = ffffffff, %f0  = 000000ff
	fdivs	%f23,%f2 ,%f0 		! %f0  = ffffffff

p0_label_297:
!	Mem[0000000010001408] = ffff00ff, %l3 = 0000000000000000
	lduha	[%i0+%o4]0x80,%l3	! %l3 = 000000000000ffff
!	Mem[0000000010001400] = 00000000, %l5 = 0000000000000000
	lduba	[%i0+%g0]0x88,%l5	! %l5 = 0000000000000000
!	Mem[00000000211c0000] = 0000c666, %l2 = ffffffffffffffff
	lduha	[%o2+0x000]%asi,%l2	! %l2 = 0000000000000000
!	Mem[0000000010001410] = ff000000, %l0 = 00000000000000ff
	ldswa	[%i0+%o5]0x80,%l0	! %l0 = ffffffffff000000
!	Mem[0000000010101410] = 0000002d000000ff, %l2 = 0000000000000000
	ldxa	[%i4+%o5]0x88,%l2	! %l2 = 0000002d000000ff
!	Mem[0000000010081400] = 4c000000, %f9  = 80000000
	ld	[%i2+%g0],%f9 	! %f9 = 4c000000
!	Mem[000000001004140c] = 00000000, %l2 = 0000002d000000ff
	ldub	[%i1+0x00c],%l2		! %l2 = 0000000000000000
!	Mem[0000000030141408] = 000033ff, %l2 = 0000000000000000
	lduba	[%i5+%o4]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030181410] = 00000000000000ff, %f0  = ffffffff dd95c5ff
	ldda	[%i6+%o5]0x89,%f0 	! %f0  = 00000000 000000ff
!	Starting 10 instruction Store Burst
!	Mem[00000000211c0001] = 0000c666, %l6 = 00000000000000ff
	ldstuba	[%o2+0x001]%asi,%l6	! %l6 = 00000000000000ff

p0_label_298:
!	%l6 = 0000000000000000, Mem[0000000010181400] = 00000000
	stwa	%l6,[%i6+%g0]0x88	! Mem[0000000010181400] = 00000000
!	%l0 = ff000000, %l1 = 00000000, Mem[0000000030081400] = ff33a6cf c78dcd1f
	stda	%l0,[%i2+%g0]0x81	! Mem[0000000030081400] = ff000000 00000000
!	Mem[0000000010101408] = ff33a6cf, %l7 = 000000000000f49f, %asi = 80
	swapa	[%i4+0x008]%asi,%l7	! %l7 = 00000000ff33a6cf
!	%l5 = 0000000000000000, Mem[000000001000143c] = ffff00ff, %asi = 80
	stwa	%l5,[%i0+0x03c]%asi	! Mem[000000001000143c] = 00000000
!	%f15 = c78dcd1f, Mem[00000000100c1408] = ff00ffff
	sta	%f15,[%i3+0x008]%asi	! Mem[00000000100c1408] = c78dcd1f
!	%f10 = 3c800000 e0000000, %l0 = ffffffffff000000
!	Mem[0000000030141430] = 05ebb322711fcfaf
	add	%i5,0x030,%g1
	stda	%f10,[%g1+%l0]ASI_PST8_SL ! Mem[0000000030141430] = 05ebb322711fcfaf
!	Mem[000000001008140c] = 00ff0000, %l4 = 00005b00, %l0 = ff000000
	add	%i2,0x0c,%g1
	casa	[%g1]0x80,%l4,%l0	! %l0 = 0000000000ff0000
!	%l0 = 0000000000ff0000, Mem[00000000100c1400] = ff00002d
	stwa	%l0,[%i3+%g0]0x80	! Mem[00000000100c1400] = 00ff0000
!	Mem[0000000010101408] = 9ff40000, %l1 = 0000000000000000
	lduwa	[%i4+%o4]0x88,%l1	! %l1 = 000000009ff40000
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = 7c460000 000000ff, %l4 = 00005b00, %l5 = 00000000
	ldda	[%i4+0x000]%asi,%l4	! %l4 = 000000007c460000 00000000000000ff

p0_label_299:
!	Mem[0000000030141400] = ffff0000, %l2 = 00000000000000ff
	lduba	[%i5+%g0]0x89,%l2	! %l2 = 0000000000000000
!	%f26 = 80000000, %f22 = 00000073
	fcmpes	%fcc2,%f26,%f22		! %fcc2 = 1
!	%l5 = 00000000000000ff, immed = 0000093c, %y  = ff339d4f
	smul	%l5,0x93c,%l1		! %l1 = 00000000000932c4, %y = 00000000
!	Mem[00000000100c1400] = 0000ff00, %l7 = 00000000ff33a6cf
	ldsha	[%i3+%g0]0x88,%l7	! %l7 = ffffffffffffff00
!	Mem[0000000010181400] = 00000000, %l7 = ffffffffffffff00
	lduwa	[%i6+%g0]0x80,%l7	! %l7 = 0000000000000000
!	Mem[00000000100c1408] = 6fffffff1fcd8dc7, %f10 = 3c800000 e0000000
	ldda	[%i3+%o4]0x88,%f10	! %f10 = 6fffffff 1fcd8dc7
!	Mem[00000000100c1434] = 000000ff, %l5 = 00000000000000ff
	ldsb	[%i3+0x037],%l5		! %l5 = ffffffffffffffff
!	Mem[0000000010181414] = 00000000, %f17 = ffff00ff
	lda	[%i6+0x014]%asi,%f17	! %f17 = 00000000
!	Mem[0000000030141410] = ff000000, %l5 = ffffffffffffffff
	ldsha	[%i5+%o5]0x81,%l5	! %l5 = ffffffffffffff00
!	Starting 10 instruction Store Burst
!	%f3  = ffffffff, Mem[0000000010101408] = 9ff40000
	sta	%f3 ,[%i4+%o4]0x88	! Mem[0000000010101408] = ffffffff

p0_label_300:
!	%f10 = 6fffffff, Mem[00000000100c1400] = 0000ff00
	sta	%f10,[%i3+%g0]0x88	! Mem[00000000100c1400] = 6fffffff
!	%f0  = 00000000 000000ff ffffffff ffffffff
!	%f4  = 6fffffff 0000807f 3fd4f6b1 6bac2748
!	%f8  = 3f800000 4c000000 6fffffff 1fcd8dc7
!	%f12 = d19d02da 000000ff ff33a6cf c78dcd1f
	stda	%f0,[%i3]ASI_BLK_SL	! Block Store to 00000000300c1400
!	Mem[0000000010041410] = ffff0000, %l1 = 00000000000932c4
	ldstuba	[%i1+%o5]0x88,%l1	! %l1 = 00000000000000ff
!	%l2 = 00000000, %l3 = 0000ffff, Mem[0000000010101408] = ffffffff 34000000
	stda	%l2,[%i4+%o4]0x80	! Mem[0000000010101408] = 00000000 0000ffff
!	%l5 = ffffffffffffff00, Mem[0000000030041410] = 6f00000000000000
	stxa	%l5,[%i1+%o5]0x81	! Mem[0000000030041410] = ffffffffffffff00
!	Mem[0000000020800001] = ff6f98bf, %l2 = 0000000000000000
	ldstub	[%o1+0x001],%l2		! %l2 = 0000006f000000ff
	membar	#Sync			! Added by membar checker (46)
!	Mem[00000000100c1408] = c78dcd1f, %l2 = 000000000000006f
	swapa	[%i3+%o4]0x80,%l2	! %l2 = 00000000c78dcd1f
!	Mem[0000000030081410] = ffffffff, %l1 = 0000000000000000
	ldstuba	[%i2+%o5]0x89,%l1	! %l1 = 000000ff000000ff
!	Mem[00000000100c1410] = ff67a24d, %l2 = 00000000c78dcd1f
	swapa	[%i3+%o5]0x88,%l2	! %l2 = 00000000ff67a24d
!	Starting 10 instruction Load Burst
!	%f3  = ffffffff, %f13 = 000000ff, %f14 = ff33a6cf c78dcd1f
	fsmuld	%f3 ,%f13,%f14		! %f14 = ffffffff e0000000

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
	cmp	%l0,%g2			! %l0 should be 0000000000ff0000
	bne,a,pn %xcc,p0_reg_l0_fail
	mov	%l0,%g3
	ldx	[%g1+0x008],%g2
	cmp	%l1,%g2			! %l1 should be 00000000000000ff
	bne,a,pn %xcc,p0_reg_l1_fail
	mov	%l1,%g3
	ldx	[%g1+0x010],%g2
	cmp	%l2,%g2			! %l2 should be 00000000ff67a24d
	bne,a,pn %xcc,p0_reg_l2_fail
	mov	%l2,%g3
	ldx	[%g1+0x018],%g2
	cmp	%l3,%g2			! %l3 should be 000000000000ffff
	bne,a,pn %xcc,p0_reg_l3_fail
	mov	%l3,%g3
	ldx	[%g1+0x020],%g2
	cmp	%l4,%g2			! %l4 should be 000000007c460000
	bne,a,pn %xcc,p0_reg_l4_fail
	mov	%l4,%g3
	ldx	[%g1+0x028],%g2
	cmp	%l5,%g2			! %l5 should be ffffffffffffff00
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
	cmp	%l0,%l1			! %f0  should be 00000000 000000ff
	bne	%xcc,p0_f0_fail
	std	%f2,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x08],%l0
	cmp	%l0,%l1			! %f2  should be ffffffff ffffffff
	bne	%xcc,p0_f2_fail
	std	%f4,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x10],%l0
	cmp	%l0,%l1			! %f4  should be 6fffffff 0000807f
	bne	%xcc,p0_f4_fail
	std	%f6,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x18],%l0
	cmp	%l0,%l1			! %f6  should be 3fd4f6b1 6bac2748
	bne	%xcc,p0_f6_fail
	std	%f8,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x20],%l0
	cmp	%l0,%l1			! %f8  should be 3f800000 4c000000
	bne	%xcc,p0_f8_fail
	std	%f10,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x28],%l0
	cmp	%l0,%l1			! %f10 should be 6fffffff 1fcd8dc7
	bne	%xcc,p0_f10_fail
	std	%f12,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x30],%l0
	cmp	%l0,%l1			! %f12 should be d19d02da 000000ff
	bne	%xcc,p0_f12_fail
	std	%f14,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x38],%l0
	cmp	%l0,%l1			! %f14 should be ffffffff e0000000
	bne	%xcc,p0_f14_fail
	std	%f16,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x40],%l0
	cmp	%l0,%l1			! %f16 should be ff000000 00000000
	bne	%xcc,p0_f16_fail
	std	%f18,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x48],%l0
	cmp	%l0,%l1			! %f18 should be 36350513 00000000
	bne	%xcc,p0_f18_fail
	std	%f20,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x50],%l0
	cmp	%l0,%l1			! %f20 should be 5d000000 2d00002d
	bne	%xcc,p0_f20_fail
	std	%f22,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x58],%l0
	cmp	%l0,%l1			! %f22 should be 00000073 34000000
	bne	%xcc,p0_f22_fail
	std	%f24,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x60],%l0
	cmp	%l0,%l1			! %f24 should be 31000000 00000000
	bne	%xcc,p0_f24_fail
	std	%f26,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x68],%l0
	cmp	%l0,%l1			! %f26 should be 80000000 00000000
	bne	%xcc,p0_f26_fail
	std	%f28,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x70],%l0
	cmp	%l0,%l1			! %f28 should be ff000000 0000005d
	bne	%xcc,p0_f28_fail
	std	%f30,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x78],%l0
	cmp	%l0,%l1			! %f30 should be 0000002d 000000ff
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
	.word	0x00000000,0x00ff0000
	.word	0x00000000,0x000000ff
	.word	0x00000000,0xff67a24d
	.word	0x00000000,0x0000ffff
	.word	0x00000000,0x7c460000
	.word	0xffffffff,0xffffff00
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000000
p0_expected_fp_regs:
	.word	0x00000000,0x000000ff
	.word	0xffffffff,0xffffffff
	.word	0x6fffffff,0x0000807f
	.word	0x3fd4f6b1,0x6bac2748
	.word	0x3f800000,0x4c000000
	.word	0x6fffffff,0x1fcd8dc7
	.word	0xd19d02da,0x000000ff
	.word	0xffffffff,0xe0000000
	.word	0xff000000,0x00000000
	.word	0x36350513,0x00000000
	.word	0x5d000000,0x2d00002d
	.word	0x00000073,0x34000000
	.word	0x31000000,0x00000000
	.word	0x80000000,0x00000000
	.word	0xff000000,0x0000005d
	.word	0x0000002d,0x000000ff
	.word	0x00000037,0x00000800		! %fsr = 0000003700000800
p0_local0_expect:
	.word	0x00000000,0x00000000
	.word	0xffff00ff,0x00000000
	.word	0xff000000,0x000000ff
	.word	0xff007cff,0x005b0000
	.word	0x049f032f,0x97340dff
	.word	0x92e6fbc0,0x00008600
	.word	0x00000000,0x5d0000c5
	.word	0xff7c00ff,0x00000000
p0_local0_sec_expect:
	.word	0xffffffff,0x00000000
	.word	0xffffffff,0x2d00002d
	.word	0xda029dd1,0x00000000
	.word	0x3fd4f6b1,0x6bac2748
	.word	0x5e1274e7,0xa4e0e78b
	.word	0x000000ff,0xa90947ff
	.word	0xd19d02da,0xd35f234f
	.word	0x00000000,0x0000807f
p0_local1_expect:
	.word	0x00000000,0xff000000
	.word	0x00000000,0x00000000
	.word	0xff00ffff,0xe0000000
	.word	0x00000000,0x00000000
	.word	0x0000002d,0x00000000
	.word	0x000000ff,0x00000000
	.word	0x730d0000,0xffffb58e
	.word	0x00000000,0x00000000
p0_local1_sec_expect:
	.word	0xc0fbe692,0x86b847ff
	.word	0xffb5ffff,0xff000000
	.word	0xffffffff,0xffffff00
	.word	0x00000034,0x000000ff
	.word	0x00000000,0x00000031
	.word	0x0000807f,0x00000000
	.word	0x5d000000,0x000000ff
	.word	0x00000000,0x00000080
p0_local2_expect:
	.word	0x4c000000,0x000000ff
	.word	0xff002d00,0x00ff0000
	.word	0x006f0000,0x4da2c09a
	.word	0x00000034,0x000000ff
	.word	0x00000034,0xdd95c5ff
	.word	0xb1ffd3c8,0x00000000
	.word	0xff33a6cf,0xc78dcd1f
	.word	0xd792467c,0x00000000
p0_local2_sec_expect:
	.word	0xff000000,0x00000000
	.word	0xff000000,0xffff00ff
	.word	0xffffffff,0xffffffff
	.word	0x00000000,0x0000410b
	.word	0x5d000000,0xffffffff
	.word	0xfffc3ce2,0x40000000
	.word	0xffffffff,0xffe1e712
	.word	0x5d000000,0x2d00002d
p0_local3_expect:
	.word	0xffffff6f,0xffffffff
	.word	0x0000006f,0xffffff6f
	.word	0x1fcd8dc7,0x7c460000
	.word	0x00000000,0x000000ff
	.word	0xbb47b886,0x92e6fbc0
	.word	0x9ac0a24d,0x0000005d
	.word	0x00000000,0x000000ff
	.word	0x2dff002d,0x0000005d
p0_local3_sec_expect:
	.word	0xff000000,0x00000000
	.word	0xffffffff,0xffffffff
	.word	0x7f800000,0xffffff6f
	.word	0x4827ac6b,0xb1f6d43f
	.word	0x0000004c,0x0000803f
	.word	0xc78dcd1f,0xffffff6f
	.word	0xff000000,0xda029dd1
	.word	0x1fcd8dc7,0xcfa633ff
p0_local4_expect:
	.word	0x7c460000,0x000000ff
	.word	0x00000000,0x0000ffff
	.word	0xff000000,0x2d000000
	.word	0xffffffff,0x00000000
	.word	0x00000034,0xdd95c5ff
	.word	0x2d00002d,0x00000000
	.word	0x000000ff,0x000000ff
	.word	0xff000000,0x34000000
p0_local4_sec_expect:
	.word	0xffb5ffff,0xffff21b0
	.word	0x00000000,0xffffffb9
	.word	0x00000000,0x92e6fbc0
	.word	0xd792467c,0xef4709a9
	.word	0x037702eb,0x0be2dfdd
	.word	0x21de0004,0xd42070cc
	.word	0x8907f971,0x0ed1e18a
	.word	0xec217703,0x4e0f0307
p0_local5_expect:
	.word	0xff000000,0xffff00ff
	.word	0x36350513,0x00000000
	.word	0x5d000000,0x2d00002d
	.word	0x00000073,0x34000000
	.word	0x31000000,0x00000000
	.word	0x80000000,0x00000000
	.word	0xff000000,0x0000005d
	.word	0x0000002d,0x000000ff
p0_local5_sec_expect:
	.word	0x0000ffff,0xffffffff
	.word	0xff330000,0x00000000
	.word	0xff000000,0x00000000
	.word	0xff000000,0xd52b5079
	.word	0x633d819c,0x34bb3bb9
	.word	0x00ea979e,0xffffffb0
	.word	0x05ebb322,0x711fcfaf
	.word	0x6fb251dc,0x00001960
p0_local6_expect:
	.word	0x00000000,0x000000ff
	.word	0xcf8867c4,0xffffffff
	.word	0xff000000,0x00000000
	.word	0x00000000,0x00000000
	.word	0x00000000,0xffffffff
	.word	0x9ac0a24d,0xffff5252
	.word	0xffffffff,0xffe1e712
	.word	0x5d000000,0x2d00002d
p0_local6_sec_expect:
	.word	0x00000000,0x6f000000
	.word	0x00000000,0xffffff6f
	.word	0xff000000,0x00000000
	.word	0xff000000,0x34000000
	.word	0x00000000,0x00000031
	.word	0x00000000,0x7f800000
	.word	0x1fcd8dc7,0xcfa633ff
	.word	0x00000000,0x00000000
share0_expect:
	.word	0xff006bf6,0xece91a84
	.word	0x2b81fa46,0xd65fe591
	.word	0x81cbc611,0x3b8fe684
	.word	0x32079ed2,0x6077e898
	.word	0x21aafe4a,0x85878ab9
	.word	0x7fc8ec92,0x0c44dfdb
	.word	0x7d26cf9a,0xc0218a0a
	.word	0xbcd91914,0x73d1cf1b
share1_expect:
	.word	0xffff98bf,0xb2a9bdb1
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
	.word	0x00ffc666,0xfaa8d11b
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
	.word	0x5dff0f03,0xa3665d0c
	.word	0x1f084efd,0x421b35f0
	.word	0x3b624de7,0x3db06c50
	.word	0xb325f89c,0x1b755dbb
	.word	0x58088bc5,0x5a532814
	.word	0xf9f0c2f2,0xd3e7afb6
	.word	0x15edbdb1,0x2a998a76
	.word	0x4d57a9bf,0x861959cd
	.word	0x00ff2e32,0x4572df2b
	.word	0x23024b5e,0x96d51792
	.word	0x5ccb633c,0x428b214f
	.word	0xe5edaf16,0x9c7d2b83
	.word	0x2c3ce971,0xcbbb2978
	.word	0x2205bbbb,0xeccaa01e
	.word	0x380a799e,0x8b854157
	.word	0x229619e1,0x010eb500
	.word	0xffe8e4de,0xd8c8f384
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
	.word	0x0000cd46,0x116f6781
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
	.word	0x002d13ce,0xa64cf276
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
