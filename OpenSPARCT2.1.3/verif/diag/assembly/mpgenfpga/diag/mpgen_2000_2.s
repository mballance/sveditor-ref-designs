/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: mpgen_2000_2.s
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
!	Seed = 327144515
!	Riesling can be on
!	1 Thread, 2000 lines
!	mpgen   created on Dec 20, 2005 (16:35:03)
!	mpgen_2000_2.s created on Mar 27, 2009 (14:45:15)
!	RC file : random.rc
!	cmd = /import/n2-tools/release/tools/mpgen/mpgen,1.051220 -rc random.rc -o mpgen_2000_2 -p 1 -l 2000

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
!	%f0  = 3a0cc464 e025b4c3 4e446631 aaa2216e
!	%f4  = a485631c d9ea2667 01a6d6f0 fc757cfa
!	%f8  = deaebd7d 98c0f273 3430b6a3 65fc5512
!	%f12 = 1f790fec 0c529c75 a0e8d7b9 535b3e72
	ldda	[%g1]ASI_BLK_P,%f0
	add	%g1,64,%g1
!	%f16 = 396a40d9 052dfec6 2755f48c 822e7630
!	%f20 = 1b50de40 b8120897 22529dbe d958e0ad
!	%f24 = e8146e4a 98eb928c 400be218 29ff90a5
!	%f28 = 8c6dbdc0 55c61a06 d9f5beab 7e2240b7
	ldda	[%g1]ASI_BLK_P,%f16
	add	%g1,64,%g1
!	%f32 = 85d0cf2e 5e5a282f b7996b52 2d7164e2
!	%f36 = 86ad6e96 c7e242e3 9b0222ab 6d33692f
!	%f40 = c1b0b291 8d354463 181fc51a db1c4dad
!	%f44 = e85cd942 004874d4 72d1a24c 0215fdf2
	ldda	[%g1]ASI_BLK_P,%f32

!	Set up the Graphics Status Register

	setx	0xff6b044f0000003b,%g7,%g1 ! GSR scale =  7, align = 3
	wr	%g1,%g0,%gsr		! GSR = ff6b044f0000003b
	wr	%g0,%y			! Clear Y register
	xorcc	%g0,%g0,%g3		! init %g3 and set flags
	membar	#Sync			! Force the block loads to complete

!	Start of Random Code for processor 0

p0_label_1:
!	%l1 = 65fb82c89a772f40, Mem[0000000010041408] = c8aa22ae226226df
	stxa	%l1,[%i1+%o4]0x88	! Mem[0000000010041408] = 65fb82c89a772f40
!	%l6 = c584bb7669bc7d11, Mem[0000000010141410] = 599bdba8
	stha	%l6,[%i5+%o5]0x88	! Mem[0000000010141410] = 599b7d11
!	Mem[0000000010101400] = 11925c6a, %l2 = 879d1bc02a5d3cfe
	swapa	[%i4+%g0]0x80,%l2	! %l2 = 0000000011925c6a
!	%f29 = 55c61a06, Mem[0000000010141430] = ac7ff2a0
	sta	%f29,[%i5+0x030]%asi	! Mem[0000000010141430] = 55c61a06
!	%f20 = 1b50de40, Mem[0000000010081418] = 38db09e8
	sta	%f20,[%i2+0x018]%asi	! Mem[0000000010081418] = 1b50de40
!	%l4 = 0f1547c2, %l5 = 6e61420b, Mem[0000000010081408] = 234bace2 05565aa4
	stda	%l4,[%i2+%o4]0x88	! Mem[0000000010081408] = 0f1547c2 6e61420b
!	%l7 = dbba379213520f54, Mem[0000000030041400] = 98b3f89e
	stba	%l7,[%i1+%g0]0x89	! Mem[0000000030041400] = 98b3f854
!	%f21 = b8120897, Mem[0000000010041408] = 402f779a
	sta	%f21,[%i1+%o4]0x80	! Mem[0000000010041408] = b8120897
!	%l4 = 7501bb700f1547c2, Mem[0000000010041400] = 0339ce68
	stha	%l4,[%i1+%g0]0x80	! Mem[0000000010041400] = 47c2ce68
!	Starting 10 instruction Store Burst
!	%l4 = 0f1547c2, %l5 = 6e61420b, Mem[0000000010041438] = 4783d1b1 34d288e2
	std	%l4,[%i1+0x038]		! Mem[0000000010041438] = 0f1547c2 6e61420b

p0_label_2:
!	%l4 = 7501bb700f1547c2, Mem[0000000010101424] = 3c38944a
	sth	%l4,[%i4+0x024]		! Mem[0000000010101424] = 47c2944a
!	%f10 = 3430b6a3, Mem[00000000300c1408] = 09a8d674
	sta	%f10,[%i3+%o4]0x89	! Mem[00000000300c1408] = 3430b6a3
!	%l7 = dbba379213520f54, Mem[0000000010041400] = 47c2ce68
	stwa	%l7,[%i1+%g0]0x80	! Mem[0000000010041400] = 13520f54
!	%f14 = a0e8d7b9, Mem[00000000300c1410] = e1e0a596
	sta	%f14,[%i3+%o5]0x81	! Mem[00000000300c1410] = a0e8d7b9
!	%l7 = dbba379213520f54, Mem[0000000010101410] = 5adf24a5
	stba	%l7,[%i4+%o5]0x80	! Mem[0000000010101410] = 54df24a5
!	Mem[0000000010041400] = 13520f54, %l3 = d5d6250268cd7ae8
	swapa	[%i1+%g0]0x80,%l3	! %l3 = 0000000013520f54
!	%l4 = 0f1547c2, %l5 = 6e61420b, Mem[0000000010081400] = fa149d22 261b4dd3
	stda	%l4,[%i2+%g0]0x80	! Mem[0000000010081400] = 0f1547c2 6e61420b
!	%l4 = 7501bb700f1547c2, Mem[0000000030081400] = 6413cc27
	stba	%l4,[%i2+%g0]0x89	! Mem[0000000030081400] = 6413ccc2
!	%l4 = 7501bb700f1547c2, Mem[0000000030141410] = d29b4eaf
	stwa	%l4,[%i5+%o5]0x81	! Mem[0000000030141410] = 0f1547c2
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = 0f1547c2 f4f57f4f, %l6 = 69bc7d11, %l7 = 13520f54
	ldda	[%i5+%o5]0x81,%l6	! %l6 = 000000000f1547c2 00000000f4f57f4f

p0_label_3:
!	Mem[0000000030041410] = ba0b0518, %f2  = 4e446631
	lda	[%i1+%o5]0x89,%f2 	! %f2 = ba0b0518
!	Mem[0000000010081400] = c247150f, %l2 = 0000000011925c6a
	lduba	[%i2+%g0]0x88,%l2	! %l2 = 000000000000000f
!	Mem[0000000010081430] = 1b707ea8, %l6 = 000000000f1547c2
	ldsha	[%i2+0x032]%asi,%l6	! %l6 = 0000000000007ea8
!	Mem[0000000030081408] = 7169e27c, %l4 = 7501bb700f1547c2
	ldsha	[%i2+%o4]0x89,%l4	! %l4 = ffffffffffffe27c
!	Mem[00000000300c1410] = a0e8d7b9, %l1 = 65fb82c89a772f40
	lduba	[%i3+%o5]0x81,%l1	! %l1 = 00000000000000a0
!	Mem[0000000010001408] = c5cfe35b b634de0a, %l0 = 6940ca2a, %l1 = 000000a0
	ldda	[%i0+%o4]0x88,%l0	! %l0 = 00000000b634de0a 00000000c5cfe35b
!	Mem[0000000010101408] = ff1bb8b66d0f8bd3, %f14 = a0e8d7b9 535b3e72
	ldda	[%i4+%o4]0x80,%f14	! %f14 = ff1bb8b6 6d0f8bd3
!	Mem[00000000100c1410] = dec89116, %l1 = 00000000c5cfe35b
	lduba	[%i3+%o5]0x80,%l1	! %l1 = 00000000000000de
!	Mem[0000000030001410] = cf9b9d0b, %l1 = 00000000000000de
	ldsha	[%i0+%o5]0x81,%l1	! %l1 = ffffffffffffcf9b
!	Starting 10 instruction Store Burst
!	%f20 = 1b50de40 b8120897, %l1 = ffffffffffffcf9b
!	Mem[0000000010141438] = 839ecbf4daef39d4
	add	%i5,0x038,%g1
	stda	%f20,[%g1+%l1]ASI_PST32_PL ! Mem[0000000010141438] = 970812b840de501b

p0_label_4:
!	%f0  = 3a0cc464, Mem[0000000030041410] = 18050bba
	sta	%f0 ,[%i1+%o5]0x81	! Mem[0000000030041410] = 3a0cc464
!	%f12 = 1f790fec 0c529c75, Mem[0000000030141410] = 0f1547c2 f4f57f4f
	stda	%f12,[%i5+%o5]0x81	! Mem[0000000030141410] = 1f790fec 0c529c75
!	%l0 = 00000000b634de0a, Mem[00000000211c0000] = c74bcd80
	stb	%l0,[%o2+%g0]		! Mem[00000000211c0000] = 0a4bcd80
!	Mem[0000000010081408] = c247150f, %l1 = ffffcf9b, %l4 = ffffe27c
	add	%i2,0x08,%g1
	casa	[%g1]0x80,%l1,%l4	! %l4 = 00000000c247150f
!	%f23 = d958e0ad, Mem[0000000010181408] = 81cf52bb
	sta	%f23,[%i6+%o4]0x88	! Mem[0000000010181408] = d958e0ad
!	%f0  = 3a0cc464 e025b4c3, %l7 = 00000000f4f57f4f
!	Mem[0000000030141418] = 88d03638a4c525d5
	add	%i5,0x018,%g1
	stda	%f0,[%g1+%l7]ASI_PST16_SL ! Mem[0000000030141418] = c3b425e064c40c3a
!	Mem[0000000020800041] = 406bfa54, %l3 = 0000000013520f54
	ldstuba	[%o1+0x041]%asi,%l3	! %l3 = 0000006b000000ff
!	Mem[0000000010141400] = 189508d9, %l7 = 00000000f4f57f4f
	swapa	[%i5+%g0]0x80,%l7	! %l7 = 00000000189508d9
!	%f26 = 400be218, Mem[00000000100c142c] = a5b9cc6b
	st	%f26,[%i3+0x02c]	! Mem[00000000100c142c] = 400be218
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = 0ade34b6, %l0 = 00000000b634de0a
	ldswa	[%i0+%o4]0x80,%l0	! %l0 = 000000000ade34b6

p0_label_5:
!	Mem[00000000100c1410] = dec89116, %f4  = a485631c
	lda	[%i3+%o5]0x80,%f4 	! %f4 = dec89116
!	Mem[00000000100c1408] = 61a6dd761610969f, %l1 = ffffffffffffcf9b
	ldxa	[%i3+%o4]0x88,%l1	! %l1 = 61a6dd761610969f
!	Mem[0000000010141408] = 125adb7086fe2308, %f0  = 3a0cc464 e025b4c3
	ldda	[%i5+%o4]0x80,%f0 	! %f0  = 125adb70 86fe2308
!	Mem[0000000010141410] = 599b7d11, %l2 = 000000000000000f
	lduwa	[%i5+%o5]0x88,%l2	! %l2 = 00000000599b7d11
!	Mem[00000000211c0000] = 0a4bcd80, %l3 = 000000000000006b
	lduha	[%o2+0x000]%asi,%l3	! %l3 = 0000000000000a4b
!	Mem[0000000010101410] = 54df24a5, %l7 = 00000000189508d9
	lduha	[%i4+%o5]0x80,%l7	! %l7 = 00000000000054df
!	Mem[0000000030041400] = 98b3f854, %l3 = 0000000000000a4b
	lduha	[%i1+%g0]0x89,%l3	! %l3 = 000000000000f854
!	Mem[0000000030081400] = c2cc1364, %l7 = 00000000000054df
	ldsba	[%i2+%g0]0x81,%l7	! %l7 = ffffffffffffffc2
!	Mem[00000000211c0000] = 0a4bcd80, %l4 = 00000000c247150f
	ldsha	[%o2+0x000]%asi,%l4	! %l4 = 0000000000000a4b
!	Starting 10 instruction Store Burst
!	%f6  = 01a6d6f0, Mem[0000000010041410] = 0106ab6d
	sta	%f6 ,[%i1+%o5]0x80	! Mem[0000000010041410] = 01a6d6f0

p0_label_6:
!	%l6 = 0000000000007ea8, Mem[0000000010041408] = b8120897
	stwa	%l6,[%i1+%o4]0x80	! Mem[0000000010041408] = 00007ea8
!	%f18 = 2755f48c 822e7630, Mem[0000000010141400] = 4f7ff5f4 d3638195
	stda	%f18,[%i5+%g0]0x88	! Mem[0000000010141400] = 2755f48c 822e7630
!	%f16 = 396a40d9 052dfec6, Mem[0000000010141438] = 970812b8 40de501b
	stda	%f16,[%i5+0x038]%asi	! Mem[0000000010141438] = 396a40d9 052dfec6
!	Mem[000000001014142c] = d44d8b1f, %l5 = d9cd999a6e61420b
	ldstuba	[%i5+0x02c]%asi,%l5	! %l5 = 000000d4000000ff
!	%l2 = 00000000599b7d11, %l6 = 0000000000007ea8, %l4 = 0000000000000a4b
	add	%l2,%l6,%l4		! %l4 = 00000000599bfbb9
!	Mem[0000000030141400] = a7c5d5fe, %l4 = 00000000599bfbb9
	ldsha	[%i5+%g0]0x81,%l4	! %l4 = ffffffffffffa7c5
!	%l2 = 00000000599b7d11, Mem[000000001000142f] = 565c380a
	stb	%l2,[%i0+0x02f]		! Mem[000000001000142c] = 565c3811
!	%f12 = 1f790fec 0c529c75, Mem[0000000010181410] = 3dd23cfd 94ea3b0b
	stda	%f12,[%i6+%o5]0x80	! Mem[0000000010181410] = 1f790fec 0c529c75
!	%l6 = 0000000000007ea8, Mem[0000000030141408] = f4061d3f
	stha	%l6,[%i5+%o4]0x81	! Mem[0000000030141408] = 7ea81d3f
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = 94a8598e, %l3 = 000000000000f854
	lduwa	[%i6+0x000]%asi,%l3	! %l3 = 0000000094a8598e

p0_label_7:
!	Mem[0000000010001410] = b74e69ba649a5760, %l1 = 61a6dd761610969f
	ldxa	[%i0+%o5]0x88,%l1	! %l1 = b74e69ba649a5760
!	Mem[0000000020800000] = fb60a5fa, %l5 = 00000000000000d4
	ldub	[%o1+0x001],%l5		! %l5 = 0000000000000060
!	Mem[0000000030101410] = b7944ee7, %f28 = 8c6dbdc0
	lda	[%i4+%o5]0x89,%f28	! %f28 = b7944ee7
!	Mem[0000000030081408] = 44860a497169e27c, %l0 = 000000000ade34b6
	ldxa	[%i2+%o4]0x89,%l0	! %l0 = 44860a497169e27c
!	Mem[0000000010101408] = d38b0f6d b6b81bff, %l6 = 00007ea8, %l7 = ffffffc2
	ldda	[%i4+%o4]0x88,%l6	! %l6 = 00000000b6b81bff 00000000d38b0f6d
!	Mem[0000000010141410] = 117d9b59, %f12 = 1f790fec
	lda	[%i5+%o5]0x80,%f12	! %f12 = 117d9b59
!	Mem[0000000010141410] = 117d9b5932b0aa8b, %l7 = 00000000d38b0f6d
	ldxa	[%i5+%o5]0x80,%l7	! %l7 = 117d9b5932b0aa8b
!	Mem[00000000300c1400] = 5c3e61d3acaa1bad, %l7 = 117d9b5932b0aa8b
	ldxa	[%i3+%g0]0x89,%l7	! %l7 = 5c3e61d3acaa1bad
!	Mem[00000000201c0000] = f6eb5a4a, %l1 = b74e69ba649a5760
	lduba	[%o0+0x000]%asi,%l1	! %l1 = 00000000000000f6
!	Starting 10 instruction Store Burst
!	%l0 = 44860a497169e27c, Mem[0000000030181400] = 9b643583
	stha	%l0,[%i6+%g0]0x89	! Mem[0000000030181400] = 9b64e27c

p0_label_8:
!	%l4 = ffffffffffffa7c5, Mem[0000000030101408] = 940c7c6a
	stwa	%l4,[%i4+%o4]0x89	! Mem[0000000030101408] = ffffa7c5
!	%f4  = dec89116 d9ea2667, Mem[0000000010101410] = a524df54 5ca58c45
	stda	%f4 ,[%i4+%o5]0x88	! Mem[0000000010101410] = dec89116 d9ea2667
!	%l7 = 5c3e61d3acaa1bad, Mem[0000000010081418] = 1b50de40
	stb	%l7,[%i2+0x018]		! Mem[0000000010081418] = ad50de40
!	%l4 = ffffffffffffa7c5, imm = 00000000000003b3, %l6 = 00000000b6b81bff
	xor	%l4,0x3b3,%l6		! %l6 = ffffffffffffa476
!	%f20 = 1b50de40 b8120897, %l2 = 00000000599b7d11
!	Mem[00000000100c1430] = bfc28cf89b639219
	add	%i3,0x030,%g1
	stda	%f20,[%g1+%l2]ASI_PST32_P ! Mem[00000000100c1430] = bfc28cf8b8120897
!	%l1 = 00000000000000f6, Mem[00000000218000c0] = d4934e5b, %asi = 80
	stha	%l1,[%o3+0x0c0]%asi	! Mem[00000000218000c0] = 00f64e5b
!	Mem[000000001004140c] = c882fb65, %l0 = 44860a497169e27c, %asi = 80
	swapa	[%i1+0x00c]%asi,%l0	! %l0 = 00000000c882fb65
!	%f4  = dec89116, Mem[0000000030041410] = 3a0cc464
	sta	%f4 ,[%i1+%o5]0x81	! Mem[0000000030041410] = dec89116
!	%f12 = 117d9b59, Mem[0000000010101410] = 6726ead9
	st	%f12,[%i4+%o5]		! Mem[0000000010101410] = 117d9b59
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = 98b3f854, %l0 = 00000000c882fb65
	ldsha	[%i1+%g0]0x89,%l0	! %l0 = fffffffffffff854

p0_label_9:
!	Mem[0000000010001400] = 70621cea, %f25 = 98eb928c
	lda	[%i0+%g0]0x80,%f25	! %f25 = 70621cea
!	Mem[0000000030001410] = cf9b9d0b, %l4 = ffffffffffffa7c5
	ldsha	[%i0+%o5]0x81,%l4	! %l4 = ffffffffffffcf9b
!	Mem[0000000030181410] = d274552a, %l0 = fffffffffffff854
	lduba	[%i6+%o5]0x81,%l0	! %l0 = 00000000000000d2
!	Mem[0000000010001408] = c5cfe35bb634de0a, %f6  = 01a6d6f0 fc757cfa
	ldda	[%i0+%o4]0x88,%f6 	! %f6  = c5cfe35b b634de0a
!	Mem[0000000030141410] = 1f790fec, %f20 = 1b50de40
	lda	[%i5+%o5]0x81,%f20	! %f20 = 1f790fec
!	Mem[0000000030001400] = ce114ffb a60b3b7d, %l6 = ffffa476, %l7 = acaa1bad
	ldda	[%i0+%g0]0x89,%l6	! %l6 = 00000000a60b3b7d 00000000ce114ffb
!	%l3 = 0000000094a8598e, %l1 = 00000000000000f6, %l4 = ffffffffffffcf9b
	subc	%l3,%l1,%l4		! %l4 = 0000000094a85898
!	Mem[0000000010101410] = 599b7d11, %l5 = 0000000000000060
	ldsha	[%i4+%o5]0x88,%l5	! %l5 = 0000000000007d11
!	Mem[0000000021800180] = c360f854, %l7 = 00000000ce114ffb
	ldsb	[%o3+0x180],%l7		! %l7 = ffffffffffffffc3
!	Starting 10 instruction Store Burst
!	%l7 = ffffffffffffffc3, Mem[0000000010141408] = 125adb70
	stha	%l7,[%i5+%o4]0x80	! Mem[0000000010141408] = ffc3db70

p0_label_10:
!	Mem[0000000010081410] = ab74f669, %l6 = 00000000a60b3b7d
	swapa	[%i2+%o5]0x88,%l6	! %l6 = 00000000ab74f669
!	%l2 = 599b7d11, %l3 = 94a8598e, Mem[00000000100c1400] = f6c2a1b4 801ad428
	std	%l2,[%i3+%g0]		! Mem[00000000100c1400] = 599b7d11 94a8598e
!	%l0 = 00000000000000d2, Mem[0000000010141408] = 70dbc3ff
	stha	%l0,[%i5+%o4]0x88	! Mem[0000000010141408] = 70db00d2
!	%f11 = 65fc5512, Mem[0000000010181400] = 94a8598e
	st	%f11,[%i6+%g0]		! Mem[0000000010181400] = 65fc5512
!	Mem[0000000010081408] = 0f1547c2, %l3 = 0000000094a8598e
	swapa	[%i2+%o4]0x88,%l3	! %l3 = 000000000f1547c2
!	Mem[00000000300c1400] = acaa1bad, %l0 = 00000000000000d2
	ldstuba	[%i3+%g0]0x89,%l0	! %l0 = 000000ad000000ff
!	Mem[0000000010081400] = c247150f, %l1 = 00000000000000f6
	swapa	[%i2+%g0]0x88,%l1	! %l1 = 00000000c247150f
!	%f8  = deaebd7d 98c0f273, Mem[0000000010041408] = 00007ea8 7169e27c
	stda	%f8 ,[%i1+%o4]0x80	! Mem[0000000010041408] = deaebd7d 98c0f273
!	Mem[0000000030101400] = 684eb302, %l1 = 00000000c247150f
	ldstuba	[%i4+%g0]0x81,%l1	! %l1 = 00000068000000ff
!	Starting 10 instruction Load Burst
!	%f28 = b7944ee7, %f8  = deaebd7d
	fsqrts	%f28,%f8 		! %f8  = 7fffffff

p0_label_11:
!	Mem[00000000218001c0] = b3245b76, %l7 = ffffffffffffffc3
	ldsh	[%o3+0x1c0],%l7		! %l7 = ffffffffffffb324
!	Mem[00000000100c1410] = 1691c8de, %l5 = 0000000000007d11
	lduba	[%i3+%o5]0x88,%l5	! %l5 = 00000000000000de
!	Mem[0000000030141410] = ec0f791f, %f29 = 55c61a06
	lda	[%i5+%o5]0x89,%f29	! %f29 = ec0f791f
!	Mem[000000001008140c] = 0b42616e, %l2 = 00000000599b7d11
	lduw	[%i2+0x00c],%l2		! %l2 = 000000000b42616e
!	Mem[0000000030041400] = 98b3f854, %l5 = 00000000000000de
	ldsba	[%i1+%g0]0x89,%l5	! %l5 = 0000000000000054
!	Mem[0000000010101400] = fe3c5d2a, %f31 = 7e2240b7
	lda	[%i4+%g0]0x88,%f31	! %f31 = fe3c5d2a
!	Mem[0000000010141408] = 0823fe86 70db00d2, %l4 = 94a85898, %l5 = 00000054
	ldda	[%i5+%o4]0x88,%l4	! %l4 = 0000000070db00d2 000000000823fe86
!	Mem[0000000010141400] = 822e7630, %l6 = 00000000ab74f669
	ldswa	[%i5+%g0]0x88,%l6	! %l6 = ffffffff822e7630
	membar	#Sync			! Added by membar checker (1)
!	Mem[0000000030101400] = ff4eb302 37148582 c5a7ffff 6cba60e4
!	Mem[0000000030101410] = e74e94b7 914bbde3 af52593e 1c53fbca
!	Mem[0000000030101420] = 918960ee 056fad8c 129d217c b81e66a0
!	Mem[0000000030101430] = 90505644 a67a4835 3eeec2d8 38c62378
	ldda	[%i4]ASI_BLK_S,%f16	! Block Load from 0000000030101400
!	Starting 10 instruction Store Burst
!	%l4 = 0000000070db00d2, Mem[00000000211c0000] = 0a4bcd80, %asi = 80
	stha	%l4,[%o2+0x000]%asi	! Mem[00000000211c0000] = 00d2cd80

p0_label_12:
!	%f5  = d9ea2667, Mem[000000001008143c] = 05abd5e3
	sta	%f5 ,[%i2+0x03c]%asi	! Mem[000000001008143c] = d9ea2667
!	%l4 = 0000000070db00d2, Mem[0000000030081408] = 7ce26971490a8644
	stxa	%l4,[%i2+%o4]0x81	! Mem[0000000030081408] = 0000000070db00d2
!	Mem[0000000010081408] = 94a8598e, %l0 = 00000000000000ad
	swapa	[%i2+%o4]0x88,%l0	! %l0 = 0000000094a8598e
!	%f10 = 3430b6a3 65fc5512, Mem[0000000010181410] = ec0f791f 759c520c
	stda	%f10,[%i6+%o5]0x88	! Mem[0000000010181410] = 3430b6a3 65fc5512
!	Mem[00000000100c1438] = dd41bb83, %l4 = 0000000070db00d2
	swap	[%i3+0x038],%l4		! %l4 = 00000000dd41bb83
!	%l2 = 000000000b42616e, Mem[00000000201c0000] = f6eb5a4a, %asi = 80
	stha	%l2,[%o0+0x000]%asi	! Mem[00000000201c0000] = 616e5a4a
!	%l2 = 000000000b42616e, Mem[0000000010141400] = 822e7630
	stba	%l2,[%i5+%g0]0x88	! Mem[0000000010141400] = 822e766e
!	Mem[0000000030181410] = 2a5574d2, %l3 = 000000000f1547c2
	swapa	[%i6+%o5]0x89,%l3	! %l3 = 000000002a5574d2
!	%l0 = 0000000094a8598e, Mem[00000000100c1410] = 2016ce971691c8de
	stxa	%l0,[%i3+%o5]0x88	! Mem[00000000100c1410] = 0000000094a8598e
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = acaa1bff, %l7 = ffffffffffffb324
	lduha	[%i3+%g0]0x89,%l7	! %l7 = 0000000000001bff

p0_label_13:
!	Mem[0000000010081418] = ad50de40 df46364a, %l4 = dd41bb83, %l5 = 0823fe86
	ldda	[%i2+0x018]%asi,%l4	! %l4 = 00000000ad50de40 00000000df46364a
!	Mem[0000000010041418] = c77babee, %l5 = 00000000df46364a
	ldsh	[%i1+0x01a],%l5		! %l5 = ffffffffffffabee
!	Mem[0000000030041400] = 54f8b398, %l4 = 00000000ad50de40
	ldsha	[%i1+%g0]0x81,%l4	! %l4 = 00000000000054f8
!	Code Fragment 4
p0_fragment_1:
!	%l0 = 0000000094a8598e
	setx	0xefc3272851164f60,%g7,%l0 ! %l0 = efc3272851164f60
!	%l1 = 0000000000000068
	setx	0x73a6e90843d42209,%g7,%l1 ! %l1 = 73a6e90843d42209
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = efc3272851164f60
	setx	0x75d15c4853493515,%g7,%l0 ! %l0 = 75d15c4853493515
!	%l1 = 73a6e90843d42209
	setx	0x3577267f97970112,%g7,%l1 ! %l1 = 3577267f97970112
!	Mem[0000000010181400] = 4510af68 1255fc65, %l6 = 822e7630, %l7 = 00001bff
	ldda	[%i6+%g0]0x88,%l6	! %l6 = 000000001255fc65 000000004510af68
!	Mem[0000000030001408] = 462ed77b8e5373c5, %l2 = 000000000b42616e
	ldxa	[%i0+%o4]0x89,%l2	! %l2 = 462ed77b8e5373c5
!	Code Fragment 3
p0_fragment_2:
!	%l0 = 75d15c4853493515
	setx	0x7c72c6c823ee3e8c,%g7,%l0 ! %l0 = 7c72c6c823ee3e8c
!	%l1 = 3577267f97970112
	setx	0x9ca2fc182e5a9b83,%g7,%l1 ! %l1 = 9ca2fc182e5a9b83
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 7c72c6c823ee3e8c
	setx	0x8c66234021f0eae4,%g7,%l0 ! %l0 = 8c66234021f0eae4
!	%l1 = 9ca2fc182e5a9b83
	setx	0xfff2f3b7e1850ced,%g7,%l1 ! %l1 = fff2f3b7e1850ced
!	Mem[0000000010081410] = 7d3b0ba6, %f17 = 37148582
	lda	[%i2+%o5]0x80,%f17	! %f17 = 7d3b0ba6
!	Mem[0000000010141410] = 8baab032 599b7d11, %l0 = 21f0eae4, %l1 = e1850ced
	ldda	[%i5+%o5]0x88,%l0	! %l0 = 00000000599b7d11 000000008baab032
!	Starting 10 instruction Store Burst
!	%l6 = 000000001255fc65, Mem[0000000010081408] = ad0000000b42616e, %asi = 80
	stxa	%l6,[%i2+0x008]%asi	! Mem[0000000010081408] = 000000001255fc65

p0_label_14:
!	Mem[0000000030101410] = e74e94b7, %l7 = 000000004510af68
	ldstuba	[%i4+%o5]0x81,%l7	! %l7 = 000000e7000000ff
!	%l6 = 000000001255fc65, Mem[0000000010101410] = 117d9b59
	stba	%l6,[%i4+%o5]0x80	! Mem[0000000010101410] = 657d9b59
!	%l5 = ffffffffffffabee, Mem[0000000030001408] = 8e5373c5
	stwa	%l5,[%i0+%o4]0x89	! Mem[0000000030001408] = ffffabee
!	%l4 = 000054f8, %l5 = ffffabee, Mem[0000000010001410] = 649a5760 b74e69ba
	stda	%l4,[%i0+%o5]0x88	! Mem[0000000010001410] = 000054f8 ffffabee
!	%f3  = aaa2216e, Mem[00000000100c1400] = 599b7d11
	sta	%f3 ,[%i3+%g0]0x80	! Mem[00000000100c1400] = aaa2216e
!	%l5 = ffffffffffffabee, Mem[000000001004141e] = c8a9d015, %asi = 80
	stha	%l5,[%i1+0x01e]%asi	! Mem[000000001004141c] = c8a9abee
!	%l7 = 00000000000000e7, Mem[0000000030001410] = 0b9d9bcf
	stba	%l7,[%i0+%o5]0x89	! Mem[0000000030001410] = 0b9d9be7
!	Mem[00000000300c1408] = a3b63034, %l0 = 00000000599b7d11
	ldstuba	[%i3+%o4]0x81,%l0	! %l0 = 000000a3000000ff
!	%l7 = 00000000000000e7, Mem[0000000010141400] = 2755f48c822e766e
	stxa	%l7,[%i5+%g0]0x88	! Mem[0000000010141400] = 00000000000000e7
!	Starting 10 instruction Load Burst
!	Mem[000000001018140c] = f5e3b8c6, %l6 = 000000001255fc65
	lduh	[%i6+0x00c],%l6		! %l6 = 000000000000f5e3

p0_label_15:
!	Mem[0000000010081430] = 1b707ea8dc4e2b5f, %f10 = 3430b6a3 65fc5512
	ldda	[%i2+0x030]%asi,%f10	! %f10 = 1b707ea8 dc4e2b5f
!	Mem[0000000021800040] = 4a5ec8f1, %l3 = 000000002a5574d2
	ldub	[%o3+0x040],%l3		! %l3 = 000000000000004a
!	Mem[0000000030081400] = 0f4f9d1d6413ccc2, %f10 = 1b707ea8 dc4e2b5f
	ldda	[%i2+%g0]0x89,%f10	! %f10 = 0f4f9d1d 6413ccc2
!	Mem[0000000030001400] = 7d3b0ba6, %l6 = 000000000000f5e3
	ldsba	[%i0+%g0]0x81,%l6	! %l6 = 000000000000007d
!	Mem[0000000010181400] = 1255fc65, %f22 = af52593e
	lda	[%i6+%g0]0x88,%f22	! %f22 = 1255fc65
!	%l3 = 000000000000004a, imm = 00000000000009d1, %l7 = 00000000000000e7
	xor	%l3,0x9d1,%l7		! %l7 = 000000000000099b
!	Mem[0000000010181420] = 67ce8707 4de8441b, %l2 = 8e5373c5, %l3 = 0000004a
	ldda	[%i6+0x020]%asi,%l2	! %l2 = 0000000067ce8707 000000004de8441b
!	Mem[0000000010001408] = 0ade34b6, %l7 = 000000000000099b
	ldsha	[%i0+%o4]0x80,%l7	! %l7 = 0000000000000ade
!	Mem[0000000010181410] = 65fc5512, %f0  = 125adb70
	lda	[%i6+%o5]0x88,%f0 	! %f0 = 65fc5512
!	Starting 10 instruction Store Burst
!	%f14 = ff1bb8b6, Mem[00000000100c1408] = 1610969f
	sta	%f14,[%i3+%o4]0x88	! Mem[00000000100c1408] = ff1bb8b6

p0_label_16:
!	Mem[0000000021800101] = b4c5af61, %l6 = 000000000000007d
	ldstub	[%o3+0x101],%l6		! %l6 = 000000c5000000ff
!	%l7 = 0000000000000ade, Mem[0000000010081404] = 6e61420b, %asi = 80
	stwa	%l7,[%i2+0x004]%asi	! Mem[0000000010081404] = 00000ade
!	Mem[0000000020800041] = 40fffa54, %l2 = 0000000067ce8707
	ldstuba	[%o1+0x041]%asi,%l2	! %l2 = 000000ff000000ff
!	%l6 = 000000c5, %l7 = 00000ade, Mem[0000000010181418] = ea5fea6b 92a63f58
	std	%l6,[%i6+0x018]		! Mem[0000000010181418] = 000000c5 00000ade
!	%l5 = ffffffffffffabee, Mem[0000000030141400] = a7c5d5fe
	stwa	%l5,[%i5+%g0]0x81	! Mem[0000000030141400] = ffffabee
!	%l3 = 000000004de8441b, Mem[0000000030001408] = ffffabee
	stwa	%l3,[%i0+%o4]0x89	! Mem[0000000030001408] = 4de8441b
!	%l5 = ffffffffffffabee, Mem[000000001010140a] = ff1bb8b6
	sth	%l5,[%i4+0x00a]		! Mem[0000000010101408] = ff1babee
!	%f8  = 7fffffff, Mem[00000000100c1408] = b6b81bff
	sta	%f8 ,[%i3+%o4]0x80	! Mem[00000000100c1408] = 7fffffff
!	Mem[0000000030181410] = 0f1547c2, %l1 = 000000008baab032
	ldstuba	[%i6+%o5]0x89,%l1	! %l1 = 000000c2000000ff
!	Starting 10 instruction Load Burst
!	Mem[000000001008143c] = d9ea2667, %l1 = 00000000000000c2
	ldsw	[%i2+0x03c],%l1		! %l1 = ffffffffd9ea2667

p0_label_17:
!	Mem[0000000010141410] = 599b7d11, %f3  = aaa2216e
	lda	[%i5+%o5]0x88,%f3 	! %f3 = 599b7d11
	membar	#Sync			! Added by membar checker (2)
!	Mem[0000000030101400] = ff4eb302 37148582 c5a7ffff 6cba60e4
!	Mem[0000000030101410] = ff4e94b7 914bbde3 af52593e 1c53fbca
!	Mem[0000000030101420] = 918960ee 056fad8c 129d217c b81e66a0
!	Mem[0000000030101430] = 90505644 a67a4835 3eeec2d8 38c62378
	ldda	[%i4]ASI_BLK_AIUS,%f16	! Block Load from 0000000030101400
!	Mem[0000000010001410] = f8540000, %l4 = 00000000000054f8
	lduwa	[%i0+%o5]0x80,%l4	! %l4 = 00000000f8540000
!	Mem[0000000030041410] = 960e83061691c8de, %l3 = 000000004de8441b
	ldxa	[%i1+%o5]0x89,%l3	! %l3 = 960e83061691c8de
!	Mem[0000000030001408] = 462ed77b 4de8441b, %l4 = f8540000, %l5 = ffffabee
	ldda	[%i0+%o4]0x89,%l4	! %l4 = 000000004de8441b 00000000462ed77b
!	Mem[00000000100c1408] = 61a6dd76 ffffff7f, %l6 = 000000c5, %l7 = 00000ade
	ldda	[%i3+%o4]0x88,%l6	! %l6 = 00000000ffffff7f 0000000061a6dd76
!	Mem[0000000030101410] = b7944eff, %l3 = 960e83061691c8de
	ldsha	[%i4+%o5]0x89,%l3	! %l3 = 0000000000004eff
!	Mem[0000000010081420] = c1a854d7, %l7 = 0000000061a6dd76
	lduha	[%i2+0x020]%asi,%l7	! %l7 = 000000000000c1a8
!	Mem[00000000300c1408] = ffb63034, %f11 = 6413ccc2
	lda	[%i3+%o4]0x81,%f11	! %f11 = ffb63034
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1400] = ff1baaac, %l2 = 00000000000000ff
	swapa	[%i3+%g0]0x81,%l2	! %l2 = 00000000ff1baaac

p0_label_18:
!	%l0 = 000000a3, %l1 = d9ea2667, Mem[0000000010181410] = 1255fc65 a3b63034
	stda	%l0,[%i6+%o5]0x80	! Mem[0000000010181410] = 000000a3 d9ea2667
!	Mem[0000000010101408] = eeab1bff, %l1 = ffffffffd9ea2667
	swapa	[%i4+%o4]0x88,%l1	! %l1 = 00000000eeab1bff
!	%l7 = 000000000000c1a8, Mem[0000000010141408] = 0823fe8670db00d2
	stxa	%l7,[%i5+%o4]0x88	! Mem[0000000010141408] = 000000000000c1a8
!	%l2 = 00000000ff1baaac, Mem[0000000030181408] = 49a9b0f9
	stwa	%l2,[%i6+%o4]0x89	! Mem[0000000030181408] = ff1baaac
!	%l5 = 00000000462ed77b, Mem[0000000010081410] = 7d3b0ba6
	stha	%l5,[%i2+%o5]0x80	! Mem[0000000010081410] = d77b0ba6
!	%l4 = 4de8441b, %l5 = 462ed77b, Mem[00000000300c1410] = b9d7e8a0 6ef97372
	stda	%l4,[%i3+%o5]0x89	! Mem[00000000300c1410] = 4de8441b 462ed77b
!	%l0 = 00000000000000a3, Mem[00000000300c1408] = 0a51fc773430b6ff
	stxa	%l0,[%i3+%o4]0x89	! Mem[00000000300c1408] = 00000000000000a3
!	Mem[0000000030101410] = b7944eff, %l2 = 00000000ff1baaac
	swapa	[%i4+%o5]0x89,%l2	! %l2 = 00000000b7944eff
!	%l3 = 0000000000004eff, Mem[0000000030141408] = 3f1da87e
	stwa	%l3,[%i5+%o4]0x89	! Mem[0000000030141408] = 00004eff
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = 462ed77b 4de8441b, %l0 = 000000a3, %l1 = eeab1bff
	ldda	[%i0+%o4]0x89,%l0	! %l0 = 000000004de8441b 00000000462ed77b

p0_label_19:
!	Mem[0000000030141408] = 00004eff, %l4 = 000000004de8441b
	ldswa	[%i5+%o4]0x89,%l4	! %l4 = 0000000000004eff
!	Mem[00000000100c1408] = ffffff7f, %l6 = 00000000ffffff7f
	ldsba	[%i3+%o4]0x88,%l6	! %l6 = 000000000000007f
!	Mem[00000000211c0000] = 00d2cd80, %l7 = 000000000000c1a8
	ldsha	[%o2+0x000]%asi,%l7	! %l7 = 00000000000000d2
!	Mem[0000000010041400] = 68cd7ae8, %l0 = 000000004de8441b
	lduha	[%i1+%g0]0x80,%l0	! %l0 = 00000000000068cd
!	Mem[0000000030001410] = b972c7ba 0b9d9be7, %l2 = b7944eff, %l3 = 00004eff
	ldda	[%i0+%o5]0x89,%l2	! %l2 = 000000000b9d9be7 00000000b972c7ba
!	Mem[0000000010141408] = 0000c1a8, %l3 = 00000000b972c7ba
	ldsba	[%i5+%o4]0x88,%l3	! %l3 = ffffffffffffffa8
!	Mem[0000000010001410] = f8540000eeabffff, %f4  = dec89116 d9ea2667
	ldda	[%i0+%o5]0x80,%f4 	! %f4  = f8540000 eeabffff
!	Mem[0000000010141408] = a8c10000, %l6 = 000000000000007f
	lduba	[%i5+%o4]0x80,%l6	! %l6 = 00000000000000a8
!	Mem[00000000300c1410] = 462ed77b4de8441b, %l7 = 00000000000000d2
	ldxa	[%i3+%o5]0x89,%l7	! %l7 = 462ed77b4de8441b
!	Starting 10 instruction Store Burst
!	%l2 = 000000000b9d9be7, Mem[0000000010081400] = f600000000000ade
	stxa	%l2,[%i2+%g0]0x80	! Mem[0000000010081400] = 000000000b9d9be7

p0_label_20:
!	%l5 = 00000000462ed77b, Mem[0000000010181408] = d958e0ad
	stha	%l5,[%i6+%o4]0x88	! Mem[0000000010181408] = d958d77b
!	%l1 = 00000000462ed77b, Mem[0000000010141410] = 117d9b59
	stw	%l1,[%i5+%o5]		! Mem[0000000010141410] = 462ed77b
!	%f10 = 0f4f9d1d, Mem[0000000010141428] = 94fb7e1e
	st	%f10,[%i5+0x028]	! Mem[0000000010141428] = 0f4f9d1d
!	%l0 = 000068cd, %l1 = 462ed77b, Mem[0000000010141400] = 000000e7 00000000
	stda	%l0,[%i5+%g0]0x88	! Mem[0000000010141400] = 000068cd 462ed77b
!	%l4 = 0000000000004eff, Mem[00000000201c0000] = 616e5a4a
	sth	%l4,[%o0+%g0]		! Mem[00000000201c0000] = 4eff5a4a
	membar	#Sync			! Added by membar checker (3)
!	%f6  = c5cfe35b b634de0a, Mem[0000000030101400] = ff4eb302 37148582
	stda	%f6 ,[%i4+%g0]0x81	! Mem[0000000030101400] = c5cfe35b b634de0a
!	%l4 = 0000000000004eff, Mem[00000000100c1400] = 8e59a8946e21a2aa
	stxa	%l4,[%i3+%g0]0x88	! Mem[00000000100c1400] = 0000000000004eff
!	Mem[0000000010041408] = deaebd7d, %l2 = 000000000b9d9be7
	ldstuba	[%i1+%o4]0x80,%l2	! %l2 = 000000de000000ff
!	Mem[0000000010101418] = 833b786c53b1633e, %l6 = 00000000000000a8, %l3 = ffffffffffffffa8
	add	%i4,0x18,%g1
	casxa	[%g1]0x80,%l6,%l3	! %l3 = 833b786c53b1633e
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = 1b44e84d, %l7 = 462ed77b4de8441b
	ldswa	[%i0+%o4]0x81,%l7	! %l7 = 000000001b44e84d

p0_label_21:
!	Mem[0000000030001410] = 0b9d9be7, %l2 = 00000000000000de
	ldswa	[%i0+%o5]0x89,%l2	! %l2 = 000000000b9d9be7
!	Mem[0000000021800040] = 4a5ec8f1, %l1 = 00000000462ed77b
	ldsb	[%o3+0x041],%l1		! %l1 = 000000000000005e
!	Mem[0000000010041418] = c77babee c8a9abee, %l0 = 000068cd, %l1 = 0000005e
	ldda	[%i1+0x018]%asi,%l0	! %l0 = 00000000c77babee 00000000c8a9abee
!	Mem[0000000010001430] = 852496fc, %l0 = 00000000c77babee
	ldswa	[%i0+0x030]%asi,%l0	! %l0 = ffffffff852496fc
!	Mem[0000000030181408] = 2c58cb47 ff1baaac, %l0 = 852496fc, %l1 = c8a9abee
	ldda	[%i6+%o4]0x89,%l0	! %l0 = 00000000ff1baaac 000000002c58cb47
!	Mem[0000000010001408] = b634de0a, %l2 = 000000000b9d9be7
	lduba	[%i0+%o4]0x88,%l2	! %l2 = 000000000000000a
!	Mem[0000000030181408] = ff1baaac, %l2 = 000000000000000a
	ldswa	[%i6+%o4]0x89,%l2	! %l2 = ffffffffff1baaac
!	Mem[00000000211c0000] = 00d2cd80, %l3 = 833b786c53b1633e
	lduh	[%o2+%g0],%l3		! %l3 = 00000000000000d2
!	Mem[0000000010101408] = d9ea2667, %l3 = 00000000000000d2
	lduwa	[%i4+%o4]0x88,%l3	! %l3 = 00000000d9ea2667
!	Starting 10 instruction Store Burst
!	Mem[0000000010101408] = 6726ead9, %l5 = 00000000462ed77b
	swapa	[%i4+%o4]0x80,%l5	! %l5 = 000000006726ead9

p0_label_22:
!	Mem[0000000030101410] = ff1baaac, %l4 = 0000000000004eff
	swapa	[%i4+%o5]0x89,%l4	! %l4 = 00000000ff1baaac
!	Mem[0000000030041408] = d7f0257b, %l0 = 00000000ff1baaac
	ldstuba	[%i1+%o4]0x81,%l0	! %l0 = 000000d7000000ff
!	Mem[0000000010181408] = 7bd758d9, %l6 = 00000000000000a8
	ldstuba	[%i6+%o4]0x80,%l6	! %l6 = 0000007b000000ff
!	%l1 = 000000002c58cb47, Mem[0000000030001410] = 0b9d9be7
	stba	%l1,[%i0+%o5]0x89	! Mem[0000000030001410] = 0b9d9b47
!	%l3 = 00000000d9ea2667, Mem[0000000021800080] = 20308dc3
	sth	%l3,[%o3+0x080]		! Mem[0000000021800080] = 26678dc3
!	%f24 = 918960ee, Mem[00000000300c1410] = 1b44e84d
	sta	%f24,[%i3+%o5]0x81	! Mem[00000000300c1410] = 918960ee
!	%f11 = ffb63034, %f0  = 65fc5512
	fstoi	%f11,%f0 		! %f0  = 80000000
!	%l5 = 000000006726ead9, Mem[0000000010181410] = 6726ead9a3000000
	stxa	%l5,[%i6+%o5]0x88	! Mem[0000000010181410] = 000000006726ead9
!	Mem[0000000030101410] = 00004eff, %l6 = 000000000000007b
	ldstuba	[%i4+%o5]0x89,%l6	! %l6 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = a5c7725c a60b7bd7, %l0 = 000000d7, %l1 = 2c58cb47
	ldda	[%i2+%o5]0x88,%l0	! %l0 = 00000000a60b7bd7 00000000a5c7725c

p0_label_23:
!	Mem[0000000010001400] = 70621cea 2a3b6d13 0ade34b6 5be3cfc5
!	Mem[0000000010001410] = f8540000 eeabffff 4935eb91 02e1f454
!	Mem[0000000010001420] = 692f1c85 54980ce8 14cc9d31 565c3811
!	Mem[0000000010001430] = 852496fc 3db0b107 1837c19a d42c69b9
	ldda	[%i0]ASI_BLK_AIUPL,%f0	! Block Load from 0000000010001400
!	%l3 = 00000000d9ea2667, %l0 = 00000000a60b7bd7, %l0 = 00000000a60b7bd7
	xor	%l3,%l0,%l0		! %l0 = 000000007fe15db0
!	Mem[0000000030001400] = 7d3b0ba6fb4f11ce, %l3 = 00000000d9ea2667
	ldxa	[%i0+%g0]0x81,%l3	! %l3 = 7d3b0ba6fb4f11ce
!	Mem[0000000030101410] = 00004eff, %l1 = 00000000a5c7725c
	lduwa	[%i4+%o5]0x89,%l1	! %l1 = 0000000000004eff
!	Mem[0000000030101400] = 5be3cfc5, %f23 = 1c53fbca
	lda	[%i4+%g0]0x89,%f23	! %f23 = 5be3cfc5
!	Mem[0000000010141408] = 0000c1a8, %l2 = ffffffffff1baaac
	ldsba	[%i5+%o4]0x88,%l2	! %l2 = ffffffffffffffa8
!	Mem[00000000100c1408] = 7fffffff, %l5 = 000000006726ead9
	ldswa	[%i3+%o4]0x80,%l5	! %l5 = 000000007fffffff
!	%l5 = 000000007fffffff, imm = 0000000000000b11, %l6 = 00000000000000ff
	sub	%l5,0xb11,%l6		! %l6 = 000000007ffff4ee
!	Mem[0000000021800000] = b4268a92, %l5 = 000000007fffffff
	ldsb	[%o3+%g0],%l5		! %l5 = ffffffffffffffb4
!	Starting 10 instruction Store Burst
!	%f24 = 918960ee 056fad8c, Mem[0000000010181408] = d958d7ff c6b8e3f5
	stda	%f24,[%i6+%o4]0x88	! Mem[0000000010181408] = 918960ee 056fad8c

p0_label_24:
!	%f18 = c5a7ffff, Mem[0000000010141410] = 7bd72e46
	sta	%f18,[%i5+%o5]0x88	! Mem[0000000010141410] = c5a7ffff
!	%f29 = a67a4835, Mem[00000000100c1408] = ffffff7f
	sta	%f29,[%i3+%o4]0x88	! Mem[00000000100c1408] = a67a4835
!	Mem[0000000010181400] = 1255fc65, %l5 = ffffffffffffffb4
	swapa	[%i6+%g0]0x88,%l5	! %l5 = 000000001255fc65
!	%l2 = ffffffffffffffa8, immed = 00000021, %y  = 00000000
	smul	%l2,0x021,%l7		! %l7 = fffffffffffff4a8, %y = ffffffff
!	%l7 = fffffffffffff4a8, Mem[0000000010081410] = d77b0ba6
	stwa	%l7,[%i2+%o5]0x80	! Mem[0000000010081410] = fffff4a8
!	%f18 = c5a7ffff, Mem[0000000030101408] = c5a7ffff
	sta	%f18,[%i4+%o4]0x81	! Mem[0000000030101408] = c5a7ffff
!	%f28 = 90505644, %f21 = 914bbde3, %f20 = ff4e94b7
	fmuls	%f28,%f21,%f20		! %f20 = 00000000
	membar	#Sync			! Added by membar checker (4)
!	%l7 = fffffffffffff4a8, Mem[0000000010001400] = 136d3b2aea1c6270
	stxa	%l7,[%i0+%g0]0x88	! Mem[0000000010001400] = fffffffffffff4a8
!	%l0 = 000000007fe15db0, immd = fffffffffffffaa8, %l4  = 00000000ff1baaac
	mulx	%l0,-0x558,%l4		! %l4 = fffffd54a3b35b80
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = 00d2cd80, %l0 = 000000007fe15db0
	ldsh	[%o2+%g0],%l0		! %l0 = 00000000000000d2

p0_label_25:
!	Code Fragment 4
p0_fragment_3:
!	%l0 = 00000000000000d2
	setx	0xf9b19017c2d58500,%g7,%l0 ! %l0 = f9b19017c2d58500
!	%l1 = 0000000000004eff
	setx	0x7b7ef53015a71e9f,%g7,%l1 ! %l1 = 7b7ef53015a71e9f
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = f9b19017c2d58500
	setx	0xc4f9779fdb51db49,%g7,%l0 ! %l0 = c4f9779fdb51db49
!	%l1 = 7b7ef53015a71e9f
	setx	0xed8d14ffcd6ee0c7,%g7,%l1 ! %l1 = ed8d14ffcd6ee0c7
!	Mem[0000000010081408] = 00000000, %l5 = 000000001255fc65
	lduwa	[%i2+%o4]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000030101400] = c5cfe35bb634de0a, %f0  = 136d3b2a ea1c6270
	ldda	[%i4+%g0]0x81,%f0 	! %f0  = c5cfe35b b634de0a
!	Mem[0000000030001410] = 479b9d0b, %l1 = ed8d14ffcd6ee0c7
	lduba	[%i0+%o5]0x81,%l1	! %l1 = 0000000000000047
!	Mem[00000000100c1408] = 35487aa6, %l5 = 0000000000000000
	lduba	[%i3+%o4]0x80,%l5	! %l5 = 0000000000000035
!	Mem[0000000021800100] = b4ffaf61, %l4 = fffffd54a3b35b80
	ldub	[%o3+0x101],%l4		! %l4 = 00000000000000ff
!	Mem[0000000010181400] = ffffffb4, %l4 = 00000000000000ff
	lduwa	[%i6+%g0]0x88,%l4	! %l4 = 00000000ffffffb4
!	Mem[0000000010001408] = b634de0a, %l7 = fffffffffffff4a8
	ldsba	[%i0+%o4]0x88,%l7	! %l7 = 000000000000000a
!	Mem[0000000010141400] = cd680000, %l3 = 7d3b0ba6fb4f11ce
	lduha	[%i5+%g0]0x80,%l3	! %l3 = 000000000000cd68
!	Starting 10 instruction Store Burst
!	Mem[0000000010081418] = ad50de40df46364a, %l1 = 0000000000000047, %l6 = 000000007ffff4ee
	add	%i2,0x18,%g1
	casxa	[%g1]0x80,%l1,%l6	! %l6 = ad50de40df46364a

p0_label_26:
!	Mem[0000000030181400] = 7ce2649b, %l1 = 0000000000000047
	ldstuba	[%i6+%g0]0x81,%l1	! %l1 = 0000007c000000ff
!	%l6 = ad50de40df46364a, Mem[00000000201c0000] = 4eff5a4a
	sth	%l6,[%o0+%g0]		! Mem[00000000201c0000] = 364a5a4a
!	%f24 = 918960ee 056fad8c, Mem[0000000010141408] = a8c10000 00000000
	stda	%f24,[%i5+%o4]0x80	! Mem[0000000010141408] = 918960ee 056fad8c
!	Mem[0000000010181410] = d9ea2667, %l6 = ad50de40df46364a
	ldstuba	[%i6+%o5]0x80,%l6	! %l6 = 000000d9000000ff
!	Mem[0000000010181408] = 8cad6f05, %l6 = 00000000000000d9
	ldstuba	[%i6+%o4]0x80,%l6	! %l6 = 0000008c000000ff
!	%l2 = ffffffa8, %l3 = 0000cd68, Mem[0000000030141408] = ff4e0000 e3fd5116
	stda	%l2,[%i5+%o4]0x81	! Mem[0000000030141408] = ffffffa8 0000cd68
!	%l2 = ffffffffffffffa8, Mem[0000000010001408] = 0ade34b65be3cfc5
	stxa	%l2,[%i0+%o4]0x80	! Mem[0000000010001408] = ffffffffffffffa8
!	Mem[0000000010181410] = 6726eaff, %l5 = 0000000000000035
	swapa	[%i6+%o5]0x88,%l5	! %l5 = 000000006726eaff
!	Mem[0000000030041408] = 7b25f0ff, %l4 = 00000000ffffffb4
	ldstuba	[%i1+%o4]0x89,%l4	! %l4 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = ffffffa8, %f7  = 91eb3549
	lda	[%i5+%o4]0x81,%f7 	! %f7 = ffffffa8

p0_label_27:
!	Mem[0000000010141400] = 000068cd, %f27 = b81e66a0
	lda	[%i5+%g0]0x88,%f27	! %f27 = 000068cd
!	Mem[0000000030141408] = a8ffffff, %l0 = c4f9779fdb51db49
	ldswa	[%i5+%o4]0x89,%l0	! %l0 = ffffffffa8ffffff
!	Mem[0000000010181408] = ffad6f05, %l7 = 000000000000000a
	lduba	[%i6+%o4]0x80,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010001408] = ffffffff, %f24 = 918960ee
	lda	[%i0+%o4]0x80,%f24	! %f24 = ffffffff
!	Mem[0000000010141434] = 98db82eb, %l1 = 000000000000007c
	ldsba	[%i5+0x036]%asi,%l1	! %l1 = ffffffffffffff82
!	Mem[0000000010041400] = 68cd7ae8, %f13 = fc962485
	lda	[%i1+%g0]0x80,%f13	! %f13 = 68cd7ae8
!	Mem[0000000010041410] = 01a6d6f0 8d4662c9, %l2 = ffffffa8, %l3 = 0000cd68
	ldda	[%i1+%o5]0x80,%l2	! %l2 = 0000000001a6d6f0 000000008d4662c9
!	Mem[0000000010141408] = 918960ee, %l0 = ffffffffa8ffffff
	ldsw	[%i5+%o4],%l0		! %l0 = ffffffff918960ee
!	Mem[00000000100c1410] = 8e59a894, %l7 = 00000000000000ff
	ldswa	[%i3+%o5]0x80,%l7	! %l7 = ffffffff8e59a894
!	Starting 10 instruction Store Burst
!	%f24 = ffffffff 056fad8c, %l7 = ffffffff8e59a894
!	Mem[00000000100c1418] = d5edeabafff0bb9c
	add	%i3,0x018,%g1
	stda	%f24,[%g1+%l7]ASI_PST32_P ! Mem[00000000100c1418] = d5edeabafff0bb9c

p0_label_28:
!	Mem[0000000010141400] = 000068cd, %l7 = ffffffff8e59a894
	swapa	[%i5+%g0]0x88,%l7	! %l7 = 00000000000068cd
!	%l0 = ffffffff918960ee, Mem[0000000030081410] = d88d6f717f9dbe97
	stxa	%l0,[%i2+%o5]0x81	! Mem[0000000030081410] = ffffffff918960ee
!	%l2 = 01a6d6f0, %l3 = 8d4662c9, Mem[0000000010101400] = 2a5d3cfe f8aeedb0
	stda	%l2,[%i4+0x000]%asi	! Mem[0000000010101400] = 01a6d6f0 8d4662c9
!	Mem[0000000020800040] = 40fffa54, %l7 = 00000000000068cd
	ldstuba	[%o1+0x040]%asi,%l7	! %l7 = 00000040000000ff
!	Mem[0000000010081410] = a8f4ffff, %l7 = 0000000000000040
	swapa	[%i2+%o5]0x88,%l7	! %l7 = 00000000a8f4ffff
!	%l3 = 000000008d4662c9, Mem[0000000010001400] = fffff4a8
	stba	%l3,[%i0+%g0]0x88	! Mem[0000000010001400] = fffff4c9
!	Code Fragment 4
p0_fragment_4:
!	%l0 = ffffffff918960ee
	setx	0x9842fd8fba1fcd21,%g7,%l0 ! %l0 = 9842fd8fba1fcd21
!	%l1 = ffffffffffffff82
	setx	0x76e028578832c26f,%g7,%l1 ! %l1 = 76e028578832c26f
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 9842fd8fba1fcd21
	setx	0xa04f40c7e19ac5ea,%g7,%l0 ! %l0 = a04f40c7e19ac5ea
!	%l1 = 76e028578832c26f
	setx	0x89803d58043bbfb3,%g7,%l1 ! %l1 = 89803d58043bbfb3
!	Mem[0000000010001428] = 14cc9d31, %l2 = 0000000001a6d6f0, %asi = 80
	swapa	[%i0+0x028]%asi,%l2	! %l2 = 0000000014cc9d31
!	%f16 = ff4eb302, Mem[0000000010101410] = 599b7d65
	sta	%f16,[%i4+%o5]0x88	! Mem[0000000010101410] = ff4eb302
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = 35487aa676dda661, %l1 = 89803d58043bbfb3
	ldxa	[%i3+%o4]0x80,%l1	! %l1 = 35487aa676dda661

p0_label_29:
!	Mem[0000000030001400] = a60b3b7d, %f14 = b9692cd4
	lda	[%i0+%g0]0x89,%f14	! %f14 = a60b3b7d
!	Mem[0000000020800000] = fb60a5fa, %l5 = 000000006726eaff
	lduha	[%o1+0x000]%asi,%l5	! %l5 = 000000000000fb60
!	Mem[0000000010101410] = dec89116 ff4eb302, %l0 = e19ac5ea, %l1 = 76dda661
	ldda	[%i4+%o5]0x88,%l0	! %l0 = 00000000ff4eb302 00000000dec89116
!	Mem[0000000010041408] = ffaebd7d, %l7 = 00000000a8f4ffff
	ldsba	[%i1+%o4]0x80,%l7	! %l7 = ffffffffffffffff
!	%l4 = 00000000000000ff, %l2 = 0000000014cc9d31, %l5 = 000000000000fb60
	udivx	%l4,%l2,%l5		! %l5 = 0000000000000000
!	Mem[0000000030041410] = dec8911606830e96, %l5 = 0000000000000000
	ldxa	[%i1+%o5]0x81,%l5	! %l5 = dec8911606830e96
!	Mem[0000000010101400] = 01a6d6f08d4662c9, %f12 = 07b1b03d 68cd7ae8
	ldda	[%i4+%g0]0x80,%f12	! %f12 = 01a6d6f0 8d4662c9
!	Mem[0000000030001400] = 7d3b0ba6fb4f11ce, %l4 = 00000000000000ff
	ldxa	[%i0+%g0]0x81,%l4	! %l4 = 7d3b0ba6fb4f11ce
!	Mem[0000000030081408] = 00000000 70db00d2, %l4 = fb4f11ce, %l5 = 06830e96
	ldda	[%i2+%o4]0x81,%l4	! %l4 = 0000000000000000 0000000070db00d2
!	Starting 10 instruction Store Burst
!	%l1 = 00000000dec89116, Mem[0000000030001400] = a60b3b7d
	stha	%l1,[%i0+%g0]0x89	! Mem[0000000030001400] = a60b9116

p0_label_30:
!	Mem[0000000010181408] = ffad6f05ee608991, %l2 = 0000000014cc9d31, %l2 = 0000000014cc9d31
	add	%i6,0x08,%g1
	casxa	[%g1]0x80,%l2,%l2	! %l2 = ffad6f05ee608991
!	Mem[0000000030001400] = a60b9116, %l7 = ffffffffffffffff
	swapa	[%i0+%g0]0x89,%l7	! %l7 = 00000000a60b9116
!	Mem[0000000010181400] = ffffffb4, %l0 = 00000000ff4eb302
	swapa	[%i6+%g0]0x88,%l0	! %l0 = 00000000ffffffb4
!	Mem[0000000010001410] = f8540000, %l6 = 000000000000008c
	ldstuba	[%i0+%o5]0x80,%l6	! %l6 = 000000f8000000ff
!	Mem[0000000030141400] = eeabffff, %l1 = 00000000dec89116
	ldstuba	[%i5+%g0]0x89,%l1	! %l1 = 000000ff000000ff
!	%f30 = 3eeec2d8, %f1  = b634de0a
	fcmpes	%fcc3,%f30,%f1 		! %fcc3 = 2
!	%l6 = 000000f8, %l7 = a60b9116, Mem[0000000030101408] = c5a7ffff 6cba60e4
	stda	%l6,[%i4+%o4]0x81	! Mem[0000000030101408] = 000000f8 a60b9116
!	%f0  = c5cfe35b b634de0a c5cfe35b b634de0a
!	%f4  = ffffabee 000054f8 54f4e102 ffffffa8
!	%f8  = e80c9854 851c2f69 11385c56 319dcc14
!	%f12 = 01a6d6f0 8d4662c9 a60b3b7d 9ac13718
	stda	%f0,[%i4]ASI_BLK_PL	! Block Store to 0000000010101400
!	Mem[0000000010141400] = 94a8598e, %l5 = 0000000070db00d2
	ldstuba	[%i5+%g0]0x80,%l5	! %l5 = 00000094000000ff
!	Starting 10 instruction Load Burst
!	%l0 = 00000000ffffffb4, %l0 = 00000000ffffffb4, %y  = ffffffff
	umul	%l0,%l0,%l3		! %l3 = ffffff6800001690, %y = ffffff68

p0_label_31:
!	Mem[0000000010001410] = ff540000, %l2 = ffad6f05ee608991
	ldsha	[%i0+%o5]0x80,%l2	! %l2 = ffffffffffffff54
!	Mem[0000000010081408] = 00000000, %f24 = ffffffff
	lda	[%i2+%o4]0x88,%f24	! %f24 = 00000000
!	Mem[00000000100c1408] = 35487aa676dda661, %f22 = af52593e 5be3cfc5
	ldda	[%i3+0x008]%asi,%f22	! %f22 = 35487aa6 76dda661
!	Mem[0000000030041408] = c7c2784f7b25f0ff, %l7 = 00000000a60b9116
	ldxa	[%i1+%o4]0x89,%l7	! %l7 = c7c2784f7b25f0ff
!	Mem[0000000030181400] = 9b64e2ff, %f27 = 000068cd
	lda	[%i6+%g0]0x89,%f27	! %f27 = 9b64e2ff
!	Mem[0000000030081408] = 00000000, %l5 = 0000000000000094
	lduba	[%i2+%o4]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000010141410] = ffffa7c5, %l5 = 0000000000000000
	lduba	[%i5+%o5]0x80,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030001408] = 1b44e84d, %l7 = c7c2784f7b25f0ff
	lduba	[%i0+%o4]0x81,%l7	! %l7 = 000000000000001b
!	Mem[00000000201c0000] = 364a5a4a, %l3 = ffffff6800001690
	ldsba	[%o0+0x000]%asi,%l3	! %l3 = 0000000000000036
!	Starting 10 instruction Store Burst
!	%l0 = 00000000ffffffb4, Mem[00000000100c1408] = 61a6dd76a67a4835
	stxa	%l0,[%i3+%o4]0x88	! Mem[00000000100c1408] = 00000000ffffffb4

p0_label_32:
!	%l4 = 0000000000000000, Mem[0000000030181408] = ff1baaac
	stwa	%l4,[%i6+%o4]0x89	! Mem[0000000030181408] = 00000000
!	Mem[0000000030081400] = c2cc1364, %l7 = 000000000000001b
	swapa	[%i2+%g0]0x81,%l7	! %l7 = 00000000c2cc1364
!	Mem[0000000030181408] = 00000000, %l3 = 0000000000000036
	swapa	[%i6+%o4]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000010041400] = e87acd68, %l3 = 0000000000000000
	swapa	[%i1+%g0]0x88,%l3	! %l3 = 00000000e87acd68
!	%l6 = 00000000000000f8, Mem[0000000030041400] = 54f8b398
	stha	%l6,[%i1+%g0]0x81	! Mem[0000000030041400] = 00f8b398
!	%f30 = 3eeec2d8 38c62378, Mem[0000000010041408] = 7dbdaeff 73f2c098
	stda	%f30,[%i1+%o4]0x88	! Mem[0000000010041408] = 3eeec2d8 38c62378
!	Mem[0000000030141408] = a8ffffff, %l1 = 00000000000000ff
	swapa	[%i5+%o4]0x89,%l1	! %l1 = 00000000a8ffffff
!	Mem[00000000218000c0] = 00f64e5b, %l7 = 00000000c2cc1364
	ldstub	[%o3+0x0c0],%l7		! %l7 = 00000000000000ff
!	%f16 = ff4eb302 37148582, Mem[0000000010001410] = ff540000 eeabffff
	stda	%f16,[%i0+0x010]%asi	! Mem[0000000010001410] = ff4eb302 37148582
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = 918960ee 056fad8c, %l4 = 00000000, %l5 = 000000ff
	ldda	[%i5+%o4]0x80,%l4	! %l4 = 00000000918960ee 00000000056fad8c

p0_label_33:
!	Mem[0000000010141410] = c5a7ffff, %l5 = 00000000056fad8c
	lduba	[%i5+%o5]0x88,%l5	! %l5 = 00000000000000ff
	membar	#Sync			! Added by membar checker (5)
!	Mem[0000000010101408] = 0ade34b6, %l0 = 00000000ffffffb4
	lduw	[%i4+%o4],%l0		! %l0 = 000000000ade34b6
!	Mem[0000000030141408] = 000000ff, %l0 = 000000000ade34b6
	ldswa	[%i5+%o4]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010081400] = 00000000, %f19 = 6cba60e4
	lda	[%i2+%g0]0x88,%f19	! %f19 = 00000000
!	Mem[00000000100c1410] = 8e59a894, %l5 = 00000000000000ff
	ldsba	[%i3+0x013]%asi,%l5	! %l5 = ffffffffffffff94
!	Mem[0000000010141408] = 8cad6f05ee608991, %l3 = 00000000e87acd68
	ldxa	[%i5+%o4]0x88,%l3	! %l3 = 8cad6f05ee608991
!	Mem[0000000021800180] = c360f854, %l7 = 0000000000000000
	ldsba	[%o3+0x180]%asi,%l7	! %l7 = ffffffffffffffc3
!	Mem[0000000010001410] = ff4eb302, %l4 = 00000000918960ee
	ldswa	[%i0+%o5]0x80,%l4	! %l4 = ffffffffff4eb302
!	Mem[00000000100c1410] = 94a8598e, %l1 = 00000000a8ffffff
	lduba	[%i3+%o5]0x88,%l1	! %l1 = 000000000000008e
!	Starting 10 instruction Store Burst
!	%l1 = 000000000000008e, imm = 0000000000000469, %l0 = 00000000000000ff
	sub	%l1,0x469,%l0		! %l0 = fffffffffffffc25

p0_label_34:
!	%l7 = ffffffffffffffc3, Mem[0000000010101408] = 0ade34b6
	stba	%l7,[%i4+%o4]0x80	! Mem[0000000010101408] = c3de34b6
!	%l2 = ffffffffffffff54, Mem[0000000030081408] = 00000000
	stwa	%l2,[%i2+%o4]0x89	! Mem[0000000030081408] = ffffff54
!	Mem[0000000030141408] = ff000000, %l0 = fffffffffffffc25
	swapa	[%i5+%o4]0x81,%l0	! %l0 = 00000000ff000000
!	%f16 = ff4eb302, Mem[0000000010101408] = b634dec3
	sta	%f16,[%i4+%o4]0x88	! Mem[0000000010101408] = ff4eb302
!	%f6  = 54f4e102 ffffffa8, %l2 = ffffffffffffff54
!	Mem[0000000030081400] = 0000001b1d9d4f0f
	stda	%f6,[%i2+%l2]ASI_PST16_SL ! Mem[0000000030081400] = 0000001b02e14f0f
!	%l6 = 00000000000000f8, Mem[0000000030081408] = ffffff54
	stha	%l6,[%i2+%o4]0x89	! Mem[0000000030081408] = ffff00f8
!	%l2 = ffffffffffffff54, Mem[0000000010101400] = 0ade34b65be3cfc5
	stxa	%l2,[%i4+%g0]0x80	! Mem[0000000010101400] = ffffffffffffff54
!	%f6  = 54f4e102 ffffffa8, Mem[0000000010041400] = 00000000 6f76a7e9
	stda	%f6 ,[%i1+%g0]0x80	! Mem[0000000010041400] = 54f4e102 ffffffa8
!	Mem[0000000010141400] = ffa8598e, %l0 = 00000000ff000000
	swapa	[%i5+%g0]0x80,%l0	! %l0 = 00000000ffa8598e
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = 25fcffff, %l2 = ffffffffffffff54
	ldsba	[%i5+%o4]0x89,%l2	! %l2 = ffffffffffffffff

p0_label_35:
!	Mem[0000000030001400] = fffffffffb4f11ce, %l3 = 8cad6f05ee608991
	ldxa	[%i0+%g0]0x81,%l3	! %l3 = fffffffffb4f11ce
!	Mem[0000000030101410] = 00004eff, %l2 = ffffffffffffffff
	ldsba	[%i4+%o5]0x89,%l2	! %l2 = ffffffffffffffff
!	Mem[00000000100c1408] = 00000000ffffffb4, %l0 = 00000000ffa8598e
	ldxa	[%i3+%o4]0x88,%l0	! %l0 = 00000000ffffffb4
!	%l5 = ffffffffffffff94, Mem[0000000010101400] = ffffffff
	stba	%l5,[%i4+%g0]0x88	! Mem[0000000010101400] = ffffff94
!	Mem[00000000201c0000] = 364a5a4a, %l4 = ffffffffff4eb302
	lduh	[%o0+%g0],%l4		! %l4 = 000000000000364a
!	Mem[0000000010101400] = 54ffffffffffff94, %l7 = ffffffffffffffc3
	ldxa	[%i4+%g0]0x88,%l7	! %l7 = 54ffffffffffff94
!	Mem[0000000030041410] = dec8911606830e96, %f8  = e80c9854 851c2f69
	ldda	[%i1+%o5]0x81,%f8 	! %f8  = dec89116 06830e96
!	Mem[0000000030001408] = 4de8441b, %l7 = 54ffffffffffff94
	ldsba	[%i0+%o4]0x89,%l7	! %l7 = 000000000000001b
!	Mem[0000000010181408] = ffad6f05, %l3 = fffffffffb4f11ce
	ldswa	[%i6+%o4]0x80,%l3	! %l3 = ffffffffffad6f05
!	Starting 10 instruction Store Burst
!	%l0 = 00000000ffffffb4, Mem[0000000010081410] = 00000040
	stwa	%l0,[%i2+%o5]0x88	! Mem[0000000010081410] = ffffffb4

p0_label_36:
!	%l4 = 000000000000364a, Mem[0000000030181410] = ff47150fc44c04fc
	stxa	%l4,[%i6+%o5]0x81	! Mem[0000000030181410] = 000000000000364a
!	Mem[00000000100c1400] = ff4e0000, %l4 = 000000000000364a
	swapa	[%i3+%g0]0x80,%l4	! %l4 = 00000000ff4e0000
!	%l2 = ffffffffffffffff, Mem[0000000010041430] = 83e5dbb043a96d09, %asi = 80
	stxa	%l2,[%i1+0x030]%asi	! Mem[0000000010041430] = ffffffffffffffff
!	Mem[0000000030081400] = 0000001b, %l3 = ffffffffffad6f05
	ldstuba	[%i2+%g0]0x81,%l3	! %l3 = 00000000000000ff
!	%f26 = 129d217c 9b64e2ff, Mem[0000000030181400] = 9b64e2ff 2e465218
	stda	%f26,[%i6+%g0]0x89	! Mem[0000000030181400] = 129d217c 9b64e2ff
!	Mem[00000000100c1400] = 4a360000, %l0 = 00000000ffffffb4
	ldstuba	[%i3+%g0]0x88,%l0	! %l0 = 00000000000000ff
!	%l5 = ffffffffffffff94, Mem[0000000030101410] = ff4e0000914bbde3
	stxa	%l5,[%i4+%o5]0x81	! Mem[0000000030101410] = ffffffffffffff94
!	Mem[0000000010081410] = ffffffb4, %l5 = ffffffffffffff94
	swapa	[%i2+%o5]0x88,%l5	! %l5 = 00000000ffffffb4
!	%l3 = 0000000000000000, Mem[0000000010001410] = ff4eb30237148582
	stx	%l3,[%i0+%o5]		! Mem[0000000010001410] = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = 35000000, %f30 = 3eeec2d8
	lda	[%i6+%o5]0x80,%f30	! %f30 = 35000000

p0_label_37:
!	Mem[00000000300c1410] = 462ed77b ee608991, %l0 = 00000000, %l1 = 0000008e
	ldda	[%i3+%o5]0x89,%l0	! %l0 = 00000000ee608991 00000000462ed77b
!	Mem[0000000020800001] = fb60a5fa, %l1 = 00000000462ed77b
	ldstuba	[%o1+0x001]%asi,%l1	! %l1 = 00000060000000ff
!	Mem[00000000300c1408] = a3000000, %f29 = a67a4835
	lda	[%i3+%o4]0x81,%f29	! %f29 = a3000000
!	Mem[0000000010081410] = 94ffffff 5c72c7a5, %l0 = ee608991, %l1 = 00000060
	ldda	[%i2+%o5]0x80,%l0	! %l0 = 0000000094ffffff 000000005c72c7a5
!	Mem[0000000030041400] = 309a0cf5 98b3f800, %l2 = ffffffff, %l3 = 00000000
	ldda	[%i1+%g0]0x89,%l2	! %l2 = 0000000098b3f800 00000000309a0cf5
!	Mem[0000000010101400] = 94ffffff, %l0 = 0000000094ffffff
	ldsha	[%i4+%g0]0x80,%l0	! %l0 = ffffffffffff94ff
!	Mem[00000000300c1400] = ff000000, %l0 = ffffffffffff94ff
	ldsba	[%i3+%g0]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000030141410] = 759c520c ec0f791f, %l0 = 00000000, %l1 = 5c72c7a5
	ldda	[%i5+%o5]0x89,%l0	! %l0 = 00000000ec0f791f 00000000759c520c
!	Mem[00000000100c1410] = 8e59a894, %l2 = 0000000098b3f800
	lduh	[%i3+%o5],%l2		! %l2 = 0000000000008e59
!	Starting 10 instruction Store Burst
!	%l2 = 0000000000008e59, Mem[00000000300c1408] = 00000000000000a3
	stxa	%l2,[%i3+%o4]0x89	! Mem[00000000300c1408] = 0000000000008e59

p0_label_38:
!	%f24 = 00000000, Mem[0000000030181400] = 9b64e2ff
	sta	%f24,[%i6+%g0]0x89	! Mem[0000000030181400] = 00000000
!	Mem[0000000010141410] = ffffa7c5, %l5 = 00000000ffffffb4
	ldstuba	[%i5+%o5]0x80,%l5	! %l5 = 000000ff000000ff
!	%f24 = 00000000 056fad8c, Mem[0000000010081410] = 94ffffff 5c72c7a5
	stda	%f24,[%i2+0x010]%asi	! Mem[0000000010081410] = 00000000 056fad8c
!	Mem[0000000030041408] = 7b25f0ff, %l3 = 00000000309a0cf5
	swapa	[%i1+%o4]0x89,%l3	! %l3 = 000000007b25f0ff
!	Mem[0000000010081408] = 00000000, %l1 = 00000000759c520c
	ldstuba	[%i2+%o4]0x88,%l1	! %l1 = 00000000000000ff
!	%l3 = 000000007b25f0ff, Mem[0000000030101408] = 000000f8
	stba	%l3,[%i4+%o4]0x81	! Mem[0000000030101408] = ff0000f8
!	Mem[0000000030101410] = ffffffff, %l3 = 000000007b25f0ff
	ldstuba	[%i4+%o5]0x89,%l3	! %l3 = 000000ff000000ff
!	%l3 = 00000000000000ff, Mem[0000000010041400] = 02e1f454
	stha	%l3,[%i1+%g0]0x88	! Mem[0000000010041400] = 02e100ff
!	Mem[0000000010181408] = ffad6f05ee608991, %l2 = 0000000000008e59, %l2 = 0000000000008e59
	add	%i6,0x08,%g1
	casxa	[%g1]0x80,%l2,%l2	! %l2 = ffad6f05ee608991
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = 918960ee056fadff, %l4 = 00000000ff4e0000
	ldxa	[%i6+%o4]0x88,%l4	! %l4 = 918960ee056fadff

p0_label_39:
!	Mem[0000000030081408] = ffff00f8, %l1 = 0000000000000000
	ldswa	[%i2+%o4]0x89,%l1	! %l1 = ffffffffffff00f8
!	Mem[0000000010101400] = ffffff94, %l3 = 00000000000000ff
	ldsba	[%i4+%g0]0x88,%l3	! %l3 = ffffffffffffff94
!	Mem[0000000030001410] = 0b9d9b47, %l7 = 000000000000001b
	lduba	[%i0+%o5]0x89,%l7	! %l7 = 0000000000000047
!	%f26 = 129d217c 9b64e2ff, %l4 = 918960ee056fadff
!	Mem[0000000010181428] = cef62d4c3ab1ef1a
	add	%i6,0x028,%g1
	stda	%f26,[%g1+%l4]ASI_PST32_PL ! Mem[0000000010181428] = ffe2649b7c219d12
!	Mem[0000000030081400] = 1b0000ff, %l2 = ffad6f05ee608991
	ldswa	[%i2+%g0]0x89,%l2	! %l2 = 000000001b0000ff
!	Mem[0000000010141410] = c5a7ffff, %l0 = 00000000ec0f791f
	ldswa	[%i5+%o5]0x88,%l0	! %l0 = ffffffffc5a7ffff
!	Mem[0000000010001400] = c9f4ffff, %l4 = 918960ee056fadff
	lduha	[%i0+%g0]0x80,%l4	! %l4 = 000000000000c9f4
!	Mem[0000000010001410] = 00000000 00000000, %l0 = c5a7ffff, %l1 = ffff00f8
	ldda	[%i0+%o5]0x88,%l0	! %l0 = 0000000000000000 0000000000000000
!	Mem[00000000218001c0] = b3245b76, %l4 = 000000000000c9f4
	lduh	[%o3+0x1c0],%l4		! %l4 = 000000000000b324
!	Starting 10 instruction Store Burst
!	%l0 = 0000000000000000, imm = 0000000000000eb1, %l6 = 00000000000000f8
	addc	%l0,0xeb1,%l6		! %l6 = 0000000000000eb1

p0_label_40:
!	%f26 = 129d217c, %f27 = 9b64e2ff, %f17 = 37148582
	fsubs	%f26,%f27,%f17		! %f17 = 1b64e34e
!	Mem[0000000020800000] = fbffa5fa, %l3 = ffffffffffffff94
	ldstub	[%o1+%g0],%l3		! %l3 = 000000fb000000ff
!	%l3 = 00000000000000fb, Mem[0000000030181410] = 4a36000000000000
	stxa	%l3,[%i6+%o5]0x89	! Mem[0000000030181410] = 00000000000000fb
!	%l4 = 0000b324, %l5 = 000000ff, Mem[00000000100c1408] = b4ffffff 00000000
	stda	%l4,[%i3+%o4]0x80	! Mem[00000000100c1408] = 0000b324 000000ff
!	%l2 = 000000001b0000ff, Mem[0000000010141408] = ee608991
	stha	%l2,[%i5+%o4]0x88	! Mem[0000000010141408] = ee6000ff
!	%l0 = 0000000000000000, Mem[0000000030141408] = fffffc25
	stha	%l0,[%i5+%o4]0x81	! Mem[0000000030141408] = 0000fc25
!	%l0 = 0000000000000000, Mem[0000000010181410] = 0000000000000035
	stxa	%l0,[%i6+%o5]0x88	! Mem[0000000010181410] = 0000000000000000
!	%f12 = 01a6d6f0, Mem[0000000030001400] = ffffffff
	sta	%f12,[%i0+%g0]0x81	! Mem[0000000030001400] = 01a6d6f0
!	Mem[0000000010181410] = 00000000, %l6 = 0000000000000eb1
	swapa	[%i6+%o5]0x88,%l6	! %l6 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = ffff00f8, %l2 = 000000001b0000ff
	ldswa	[%i2+%o4]0x89,%l2	! %l2 = ffffffffffff00f8

p0_label_41:
!	Mem[0000000010041434] = ffffffff, %l7 = 0000000000000047
	ldsh	[%i1+0x036],%l7		! %l7 = ffffffffffffffff
!	Mem[0000000010141400] = 000000ff, %l6 = 0000000000000000
	ldsha	[%i5+%g0]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010041410] = 01a6d6f0, %f31 = 38c62378
	lda	[%i1+%o5]0x80,%f31	! %f31 = 01a6d6f0
!	Mem[00000000100c1400] = ff00364a, %l1 = 0000000000000000
	ldsba	[%i3+%g0]0x80,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010141408] = ff0060ee, %f19 = 00000000
	lda	[%i5+%o4]0x80,%f19	! %f19 = ff0060ee
!	Mem[0000000010001400] = c9f4ffffffffffff, %f12 = 01a6d6f0 8d4662c9
	ldda	[%i0+%g0]0x80,%f12	! %f12 = c9f4ffff ffffffff
!	Mem[0000000010181418] = 000000c5, %f25 = 056fad8c
	ld	[%i6+0x018],%f25	! %f25 = 000000c5
!	Mem[0000000030001400] = f0d6a601, %f22 = 35487aa6
	lda	[%i0+%g0]0x89,%f22	! %f22 = f0d6a601
!	%f18 = c5a7ffff, %f10 = 11385c56
	fsqrts	%f18,%f10		! %f10 = 7fffffff
!	Starting 10 instruction Store Burst
!	%f18 = c5a7ffff ff0060ee, Mem[0000000030041408] = f50c9a30 4f78c2c7
	stda	%f18,[%i1+%o4]0x81	! Mem[0000000030041408] = c5a7ffff ff0060ee

p0_label_42:
!	Mem[00000000100c1410] = 8e59a894, %l1 = ffffffffffffffff
	swapa	[%i3+%o5]0x80,%l1	! %l1 = 000000008e59a894
!	%l7 = ffffffffffffffff, Mem[0000000010041408] = 7823c638
	stha	%l7,[%i1+%o4]0x80	! Mem[0000000010041408] = ffffc638
!	Mem[0000000030081408] = f800ffff, %l3 = 00000000000000fb
	ldstuba	[%i2+%o4]0x81,%l3	! %l3 = 000000f8000000ff
!	%f6  = 54f4e102 ffffffa8, Mem[0000000030101408] = ff0000f8 a60b9116
	stda	%f6 ,[%i4+%o4]0x81	! Mem[0000000030101408] = 54f4e102 ffffffa8
!	%l3 = 00000000000000f8, Mem[000000001018140c] = ee608991
	stb	%l3,[%i6+0x00c]		! Mem[000000001018140c] = f8608991
!	%l4 = 000000000000b324, %l1 = 000000008e59a894, %l6  = 00000000000000ff
	mulx	%l4,%l1,%l6		! %l6 = 0000639cb57b30d0
!	%f16 = ff4eb302 1b64e34e, Mem[00000000100c1410] = ffffffff 00000000
	stda	%f16,[%i3+%o5]0x88	! Mem[00000000100c1410] = ff4eb302 1b64e34e
!	%l6 = 0000639cb57b30d0, Mem[0000000010101408] = ff4eb302
	stha	%l6,[%i4+%o4]0x88	! Mem[0000000010101408] = ff4e30d0
!	Mem[0000000030041408] = c5a7ffff, %l7 = ffffffffffffffff
	ldstuba	[%i1+%o4]0x81,%l7	! %l7 = 000000c5000000ff
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (6)
!	Mem[0000000010141400] = ff000000 7bd72e46 ff0060ee 056fad8c
!	Mem[0000000010141410] = ffffa7c5 32b0aa8b 11da2acc f04ed1c6
!	Mem[0000000010141420] = b6d1e2eb 2d092ff1 0f4f9d1d ff4d8b1f
!	Mem[0000000010141430] = 55c61a06 98db82eb 396a40d9 052dfec6
	ldda	[%i5]ASI_BLK_P,%f16	! Block Load from 0000000010141400

p0_label_43:
!	Mem[00000000100c1428] = 86842aa8, %l5 = 00000000000000ff
	lduba	[%i3+0x02a]%asi,%l5	! %l5 = 000000000000002a
!	Mem[00000000100c1400] = 4a3600ff, %l2 = ffffffffffff00f8
	ldswa	[%i3+%g0]0x88,%l2	! %l2 = 000000004a3600ff
!	Mem[0000000030101410] = ffffffff ffffff94, %l2 = 4a3600ff, %l3 = 000000f8
	ldda	[%i4+%o5]0x81,%l2	! %l2 = 00000000ffffffff 00000000ffffff94
!	Mem[00000000300c1408] = 598e000000000000, %l3 = 00000000ffffff94
	ldxa	[%i3+%o4]0x81,%l3	! %l3 = 598e000000000000
!	Mem[0000000010001430] = 852496fc, %l6 = 0000639cb57b30d0
	lduha	[%i0+0x030]%asi,%l6	! %l6 = 0000000000008524
!	Mem[0000000010041430] = ffffffffffffffff, %l3 = 598e000000000000
	ldx	[%i1+0x030],%l3		! %l3 = ffffffffffffffff
!	Mem[0000000020800000] = ffffa5fa, %l0 = 0000000000000000
	lduh	[%o1+%g0],%l0		! %l0 = 000000000000ffff
!	Mem[00000000300c1400] = ff000000, %l7 = 00000000000000c5
	ldswa	[%i3+%g0]0x89,%l7	! %l7 = ffffffffff000000
!	Mem[0000000030101400] = c5cfe35bb634de0a, %f2  = c5cfe35b b634de0a
	ldda	[%i4+%g0]0x81,%f2 	! %f2  = c5cfe35b b634de0a
!	Starting 10 instruction Store Burst
!	%f14 = a60b3b7d, %f0  = c5cfe35b, %f6  = 54f4e102 ffffffa8
	fsmuld	%f14,%f0 ,%f6 		! %f6  = 3d8c4430 543f1bc0

p0_label_44:
!	%l3 = ffffffffffffffff, Mem[0000000010001410] = 00000000
	stha	%l3,[%i0+%o5]0x80	! Mem[0000000010001410] = ffff0000
	membar	#Sync			! Added by membar checker (7)
!	%l4 = 0000b324, %l5 = 0000002a, Mem[0000000010141400] = 000000ff 462ed77b
	stda	%l4,[%i5+%g0]0x88	! Mem[0000000010141400] = 0000b324 0000002a
!	Mem[00000000100c1410] = 1b64e34e, %l2 = 00000000ffffffff
	swapa	[%i3+%o5]0x88,%l2	! %l2 = 000000001b64e34e
!	%f6  = 3d8c4430 543f1bc0, Mem[0000000030081400] = 1b0000ff 0f4fe102
	stda	%f6 ,[%i2+%g0]0x89	! Mem[0000000030081400] = 3d8c4430 543f1bc0
!	%l5 = 000000000000002a, Mem[0000000010101408] = ff4e30d0
	stwa	%l5,[%i4+%o4]0x88	! Mem[0000000010101408] = 0000002a
!	%l1 = 000000008e59a894, Mem[00000000201c0000] = 364a5a4a, %asi = 80
	stha	%l1,[%o0+0x000]%asi	! Mem[00000000201c0000] = a8945a4a
!	%l7 = ffffffffff000000, Mem[0000000021800040] = 4a5ec8f1, %asi = 80
	stha	%l7,[%o3+0x040]%asi	! Mem[0000000021800040] = 0000c8f1
!	%l6 = 0000000000008524, Mem[00000000300c1410] = ee608991
	stba	%l6,[%i3+%o5]0x89	! Mem[00000000300c1410] = ee608924
!	%l4 = 000000000000b324, Mem[0000000010181400] = 02b34eff
	stha	%l4,[%i6+%g0]0x80	! Mem[0000000010181400] = b3244eff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = b10e0000, %l0 = 000000000000ffff
	lduwa	[%i6+%o5]0x80,%l0	! %l0 = 00000000b10e0000

p0_label_45:
!	Mem[0000000010081414] = 056fad8c, %l3 = ffffffffffffffff
	ldsba	[%i2+0x015]%asi,%l3	! %l3 = 000000000000006f
!	Mem[0000000030101410] = ffffffff, %l1 = 000000008e59a894
	ldsba	[%i4+%o5]0x81,%l1	! %l1 = ffffffffffffffff
!	Mem[00000000211c0000] = 00d2cd80, %l2 = 000000001b64e34e
	lduh	[%o2+%g0],%l2		! %l2 = 00000000000000d2
!	Mem[0000000010101400] = 94ffffff, %l1 = ffffffffffffffff
	ldswa	[%i4+%g0]0x80,%l1	! %l1 = ffffffff94ffffff
!	Mem[0000000020800040] = fffffa54, %l6 = 0000000000008524
	ldsh	[%o1+0x040],%l6		! %l6 = ffffffffffffffff
!	Mem[0000000010141408] = ff0060ee056fad8c, %f2  = c5cfe35b b634de0a
	ldda	[%i5+%o4]0x80,%f2 	! %f2  = ff0060ee 056fad8c
!	%l3 = 000000000000006f, Mem[0000000030141408] = 0000fc250000cd68
	stxa	%l3,[%i5+%o4]0x81	! Mem[0000000030141408] = 000000000000006f
!	%l1 = ffffffff94ffffff, imm = fffffffffffff925, %l7 = ffffffffff000000
	subc	%l1,-0x6db,%l7		! %l7 = ffffffff950006da
!	Mem[0000000030141410] = ec0f791f, %l6 = ffffffffffffffff
	lduwa	[%i5+%o5]0x89,%l6	! %l6 = 00000000ec0f791f
!	Starting 10 instruction Store Burst
!	%f24 = b6d1e2eb 2d092ff1, %l4 = 000000000000b324
!	Mem[0000000030141410] = 1f790fec0c529c75
	add	%i5,0x010,%g1
	stda	%f24,[%g1+%l4]ASI_PST8_S ! Mem[0000000030141410] = 1f79e2ec0c099c75

p0_label_46:
!	%l2 = 00000000000000d2, Mem[00000000218001c0] = b3245b76, %asi = 80
	stha	%l2,[%o3+0x1c0]%asi	! Mem[00000000218001c0] = 00d25b76
!	%l6 = 00000000ec0f791f, Mem[0000000010081400] = 00000000
	stwa	%l6,[%i2+%g0]0x80	! Mem[0000000010081400] = ec0f791f
!	Mem[00000000300c1408] = 598e0000, %l6 = 00000000ec0f791f
	ldstuba	[%i3+%o4]0x81,%l6	! %l6 = 00000059000000ff
!	Mem[0000000010141410] = ffffa7c532b0aa8b, %f0  = c5cfe35b b634de0a
	ldda	[%i5+%o5]0x80,%f0 	! %f0  = ffffa7c5 32b0aa8b
!	Mem[0000000010181410] = 00000eb1, %l1 = ffffffff94ffffff
	swapa	[%i6+%o5]0x88,%l1	! %l1 = 0000000000000eb1
!	Mem[0000000010141420] = b6d1e2eb2d092ff1, %l5 = 000000000000002a, %l3 = 000000000000006f
	add	%i5,0x20,%g1
	casxa	[%g1]0x80,%l5,%l3	! %l3 = b6d1e2eb2d092ff1
!	Mem[0000000030101408] = 54f4e102, %l7 = ffffffff950006da
	ldstuba	[%i4+%o4]0x81,%l7	! %l7 = 00000054000000ff
!	Mem[0000000030081400] = 543f1bc0, %l7 = 0000000000000054
	swapa	[%i2+%g0]0x89,%l7	! %l7 = 00000000543f1bc0
!	%f18 = ff0060ee 056fad8c, Mem[0000000030081400] = 54000000 30448c3d
	stda	%f18,[%i2+%g0]0x81	! Mem[0000000030081400] = ff0060ee 056fad8c
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = ffffff94, %l5 = 000000000000002a
	ldsba	[%i4+%g0]0x88,%l5	! %l5 = ffffffffffffff94

p0_label_47:
!	Mem[0000000030181410] = 000000fb, %f24 = b6d1e2eb
	lda	[%i6+%o5]0x89,%f24	! %f24 = 000000fb
!	Mem[0000000010141410] = ffffa7c532b0aa8b, %l3 = b6d1e2eb2d092ff1
	ldxa	[%i5+%o5]0x80,%l3	! %l3 = ffffa7c532b0aa8b
!	Mem[0000000030001410] = b972c7ba0b9d9b47, %f30 = 396a40d9 052dfec6
	ldda	[%i0+%o5]0x89,%f30	! %f30 = b972c7ba 0b9d9b47
!	Mem[0000000030041410] = dec8911606830e96, %l3 = ffffa7c532b0aa8b
	ldxa	[%i1+%o5]0x81,%l3	! %l3 = dec8911606830e96
!	Mem[0000000030141410] = 1f79e2ec 0c099c75, %l4 = 0000b324, %l5 = ffffff94
	ldda	[%i5+%o5]0x81,%l4	! %l4 = 000000001f79e2ec 000000000c099c75
!	Mem[0000000030101400] = 5be3cfc5, %l0 = 00000000b10e0000
	lduba	[%i4+%g0]0x89,%l0	! %l0 = 00000000000000c5
!	Mem[0000000010081408] = ff000000, %l5 = 000000000c099c75
	lduba	[%i2+%o4]0x80,%l5	! %l5 = 00000000000000ff
!	Mem[00000000201c0000] = a8945a4a, %l0 = 00000000000000c5
	ldsba	[%o0+0x000]%asi,%l0	! %l0 = ffffffffffffffa8
!	Mem[0000000030001400] = 01a6d6f0, %l6 = 0000000000000059
	lduha	[%i0+%g0]0x81,%l6	! %l6 = 00000000000001a6
!	Starting 10 instruction Store Burst
!	Mem[0000000030181408] = 36000000, %l2 = 00000000000000d2
	swapa	[%i6+%o4]0x89,%l2	! %l2 = 0000000036000000

p0_label_48:
!	%l2 = 0000000036000000, Mem[00000000201c0000] = a8945a4a
	stb	%l2,[%o0+%g0]		! Mem[00000000201c0000] = 00945a4a
!	Mem[0000000030081408] = ffff00ff, %l2 = 0000000036000000
	ldstuba	[%i2+%o4]0x89,%l2	! %l2 = 000000ff000000ff
!	Code Fragment 4
p0_fragment_5:
!	%l0 = ffffffffffffffa8
	setx	0x97d7db2fa22b916f,%g7,%l0 ! %l0 = 97d7db2fa22b916f
!	%l1 = 0000000000000eb1
	setx	0x25bc4958083a3348,%g7,%l1 ! %l1 = 25bc4958083a3348
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 97d7db2fa22b916f
	setx	0x7ca709a85f7d2304,%g7,%l0 ! %l0 = 7ca709a85f7d2304
!	%l1 = 25bc4958083a3348
	setx	0x9d4888180af2880f,%g7,%l1 ! %l1 = 9d4888180af2880f
!	%l2 = 00000000000000ff, imm = fffffffffffffbc6, %l4 = 000000001f79e2ec
	xor	%l2,-0x43a,%l4		! %l4 = fffffffffffffb39
!	%l1 = 9d4888180af2880f, Mem[0000000030081408] = ff00ffff
	stha	%l1,[%i2+%o4]0x81	! Mem[0000000030081408] = 880fffff
!	%f17 = 7bd72e46, Mem[0000000010001400] = c9f4ffff
	sta	%f17,[%i0+%g0]0x80	! Mem[0000000010001400] = 7bd72e46
!	Mem[0000000030181410] = fb000000, %l5 = 00000000000000ff
	ldstuba	[%i6+%o5]0x81,%l5	! %l5 = 000000fb000000ff
!	Mem[0000000030041400] = 00f8b398, %l2 = 00000000000000ff
	ldstuba	[%i1+%g0]0x81,%l2	! %l2 = 00000000000000ff
!	%f4  = ffffabee, Mem[0000000010181400] = b3244eff
	sta	%f4 ,[%i6+%g0]0x80	! Mem[0000000010181400] = ffffabee
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = ffa7ffff, %f14 = a60b3b7d
	lda	[%i1+%o4]0x81,%f14	! %f14 = ffa7ffff

p0_label_49:
!	Mem[0000000010081408] = ff000000, %l2 = 0000000000000000
	ldswa	[%i2+%o4]0x80,%l2	! %l2 = ffffffffff000000
!	Mem[0000000010181438] = a4e811b3d69a5aa8, %l1 = 9d4888180af2880f
	ldxa	[%i6+0x038]%asi,%l1	! %l1 = a4e811b3d69a5aa8
!	Mem[0000000030101408] = 02e1f4ff, %l6 = 00000000000001a6
	ldsha	[%i4+%o4]0x89,%l6	! %l6 = fffffffffffff4ff
!	Mem[0000000021800100] = b4ffaf61, %l2 = ffffffffff000000
	ldsb	[%o3+0x101],%l2		! %l2 = ffffffffffffffff
!	Mem[0000000010141414] = 32b0aa8b, %l1 = a4e811b3d69a5aa8
	ldub	[%i5+0x015],%l1		! %l1 = 00000000000000b0
!	Mem[0000000030101408] = 02e1f4ff, %l2 = ffffffffffffffff
	ldsba	[%i4+%o4]0x89,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000010101400] = 94ffffff, %l6 = fffffffffffff4ff
	lduh	[%i4+%g0],%l6		! %l6 = 00000000000094ff
!	Mem[0000000010101408] = 0000002a, %l2 = ffffffffffffffff
	lduha	[%i4+%o4]0x88,%l2	! %l2 = 000000000000002a
!	Mem[0000000030181410] = ff000000, %l2 = 000000000000002a
	ldswa	[%i6+%o5]0x81,%l2	! %l2 = ffffffffff000000
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1408] = 0000b324, %l1 = 00000000000000b0
	ldstuba	[%i3+%o4]0x80,%l1	! %l1 = 00000000000000ff

p0_label_50:
!	%l2 = ffffffffff000000, Mem[00000000100c1408] = ff00b324
	stba	%l2,[%i3+%o4]0x80	! Mem[00000000100c1408] = 0000b324
!	%l3 = dec8911606830e96, imm = 0000000000000882, %l4 = fffffffffffffb39
	orn	%l3,0x882,%l4		! %l4 = ffffffffffffffff
!	Mem[0000000010141408] = ee6000ff, %l4 = ffffffffffffffff
	swapa	[%i5+%o4]0x88,%l4	! %l4 = 00000000ee6000ff
!	%l3 = dec8911606830e96, Mem[0000000030141400] = ffffabee
	stha	%l3,[%i5+%g0]0x81	! Mem[0000000030141400] = 0e96abee
!	Mem[000000001000142c] = 565c3811, %l2 = ffffffffff000000, %asi = 80
	swapa	[%i0+0x02c]%asi,%l2	! %l2 = 00000000565c3811
!	%l4 = 00000000ee6000ff, Mem[0000000010001408] = ffffffff
	stba	%l4,[%i0+%o4]0x88	! Mem[0000000010001408] = ffffffff
!	Mem[0000000010101414] = eeabffff, %l7 = 00000000543f1bc0, %asi = 80
	swapa	[%i4+0x014]%asi,%l7	! %l7 = 00000000eeabffff
!	%l4 = 00000000ee6000ff, Mem[0000000010081408] = ff000000
	stha	%l4,[%i2+%o4]0x80	! Mem[0000000010081408] = 00ff0000
!	%f16 = ff000000 7bd72e46 ff0060ee 056fad8c
!	%f20 = ffffa7c5 32b0aa8b 11da2acc f04ed1c6
!	%f24 = 000000fb 2d092ff1 0f4f9d1d ff4d8b1f
!	%f28 = 55c61a06 98db82eb b972c7ba 0b9d9b47
	stda	%f16,[%i0]ASI_BLK_P	! Block Store to 0000000010001400
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = ffad6f05, %l6 = 00000000000094ff
	ldsba	[%i6+%o4]0x80,%l6	! %l6 = ffffffffffffffff

p0_label_51:
!	Mem[000000001004142c] = 33f371b2, %f2  = ff0060ee
	lda	[%i1+0x02c]%asi,%f2 	! %f2 = 33f371b2
!	Mem[0000000030041400] = 98b3f8ff, %l1 = 0000000000000000
	lduba	[%i1+%g0]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010181408] = ffad6f05 f8608991, %l6 = ffffffff, %l7 = eeabffff
	ldda	[%i6+%o4]0x80,%l6	! %l6 = 00000000ffad6f05 00000000f8608991
!	Mem[0000000010141408] = 8cad6f05ffffffff, %f14 = ffa7ffff 9ac13718
	ldda	[%i5+%o4]0x88,%f14	! %f14 = 8cad6f05 ffffffff
!	Mem[0000000030181410] = ff000000, %l6 = 00000000ffad6f05
	lduha	[%i6+%o5]0x81,%l6	! %l6 = 000000000000ff00
	membar	#Sync			! Added by membar checker (8)
!	Mem[0000000010001408] = ff0060ee, %l2 = 00000000565c3811
	lduha	[%i0+0x00a]%asi,%l2	! %l2 = 00000000000060ee
!	Mem[0000000010101408] = 2a000000, %l5 = 00000000000000fb
	ldswa	[%i4+0x008]%asi,%l5	! %l5 = 000000002a000000
!	Mem[0000000010181418] = 000000c5, %l1 = 00000000000000ff
	ldswa	[%i6+0x018]%asi,%l1	! %l1 = 00000000000000c5
!	Mem[0000000010041408] = ffffc638, %l0 = 7ca709a85f7d2304
	lduwa	[%i1+%o4]0x80,%l0	! %l0 = 00000000ffffc638
!	Starting 10 instruction Store Burst
!	%l0 = 00000000ffffc638, Mem[0000000030081400] = ee6000ff
	stwa	%l0,[%i2+%g0]0x89	! Mem[0000000030081400] = ffffc638

p0_label_52:
!	%f20 = ffffa7c5, Mem[0000000010001410] = c5a7ffff
	sta	%f20,[%i0+%o5]0x88	! Mem[0000000010001410] = ffffa7c5
!	%l2 = 00000000000060ee, Mem[0000000010081438] = b259faafd9ea2667
	stx	%l2,[%i2+0x038]		! Mem[0000000010081438] = 00000000000060ee
!	Mem[0000000010101408] = 0000002a, %l3 = dec8911606830e96
	ldstuba	[%i4+%o4]0x88,%l3	! %l3 = 0000002a000000ff
!	%f22 = 11da2acc f04ed1c6, %l3 = 000000000000002a
!	Mem[00000000300c1438] = a12989e0afdad75c
	add	%i3,0x038,%g1
	stda	%f22,[%g1+%l3]ASI_PST32_S ! Mem[00000000300c1438] = 11da2accafdad75c
!	%f2  = 33f371b2 056fad8c, Mem[0000000010001438] = b972c7ba 0b9d9b47
	std	%f2 ,[%i0+0x038]	! Mem[0000000010001438] = 33f371b2 056fad8c
!	%l2 = 00000000000060ee, Mem[0000000010041408] = ffffc638
	stwa	%l2,[%i1+%o4]0x80	! Mem[0000000010041408] = 000060ee
!	%f0  = ffffa7c5 32b0aa8b, Mem[0000000010001408] = ee6000ff 8cad6f05
	stda	%f0 ,[%i0+%o4]0x88	! Mem[0000000010001408] = ffffa7c5 32b0aa8b
!	Mem[00000000300c1400] = 000000ff, %l7 = 00000000f8608991
	swapa	[%i3+%g0]0x81,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030041408] = ffffa7ff, %l5 = 000000002a000000
	ldstuba	[%i1+%o4]0x89,%l5	! %l5 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = 0ade34b65be3cfc5, %f10 = 7fffffff 319dcc14
	ldda	[%i4+%g0]0x89,%f10	! %f10 = 0ade34b6 5be3cfc5

p0_label_53:
!	Mem[0000000010181400] = ffffabee, %l2 = 00000000000060ee
	lduha	[%i6+%g0]0x80,%l2	! %l2 = 000000000000ffff
!	Mem[0000000010141408] = 8cad6f05ffffffff, %l0 = 00000000ffffc638
	ldxa	[%i5+%o4]0x88,%l0	! %l0 = 8cad6f05ffffffff
!	%l6 = 000000000000ff00, %l5 = 00000000000000ff, %l7 = 00000000000000ff
	add	%l6,%l5,%l7		! %l7 = 000000000000ffff
!	Mem[0000000021800080] = 26678dc3, %l5 = 00000000000000ff
	ldsb	[%o3+0x080],%l5		! %l5 = 0000000000000026
!	Mem[0000000010101400] = 94ffffff, %l4 = 00000000ee6000ff
	ldswa	[%i4+%g0]0x80,%l4	! %l4 = ffffffff94ffffff
!	Mem[0000000010181408] = 056fadff, %l1 = 00000000000000c5
	ldswa	[%i6+%o4]0x88,%l1	! %l1 = 00000000056fadff
!	Mem[0000000030141400] = 0e96abee, %l7 = 000000000000ffff
	ldsba	[%i5+%g0]0x81,%l7	! %l7 = 000000000000000e
!	Mem[0000000010181430] = 6e5fdef94099199d, %l7 = 000000000000000e
	ldx	[%i6+0x030],%l7		! %l7 = 6e5fdef94099199d
!	Mem[0000000010001400] = ff000000, %l4 = ffffffff94ffffff
	ldswa	[%i0+%g0]0x80,%l4	! %l4 = ffffffffff000000
!	Starting 10 instruction Store Burst
!	%l7 = 6e5fdef94099199d, Mem[0000000030081408] = ffff0f88
	stba	%l7,[%i2+%o4]0x89	! Mem[0000000030081408] = ffff0f9d

p0_label_54:
!	%f14 = 8cad6f05 ffffffff, %l6 = 000000000000ff00
!	Mem[0000000010101400] = 94ffffffffffff54
	stda	%f14,[%i4+%l6]ASI_PST16_P ! Mem[0000000010101400] = 94ffffffffffff54
!	%l6 = 000000000000ff00, Mem[0000000030001410] = 0b9d9b47
	stwa	%l6,[%i0+%o5]0x89	! Mem[0000000030001410] = 0000ff00
!	Mem[0000000030141408] = 00000000, %l2 = 000000000000ffff
	swapa	[%i5+%o4]0x81,%l2	! %l2 = 0000000000000000
!	Mem[00000000300c1410] = ee608924, %l0 = 8cad6f05ffffffff
	ldstuba	[%i3+%o5]0x89,%l0	! %l0 = 00000024000000ff
!	%f17 = 7bd72e46, %f21 = 32b0aa8b, %f20 = ffffa7c5
	fadds	%f17,%f21,%f20		! %f20 = 7bd72e46
!	%l2 = 00000000, %l3 = 0000002a, Mem[0000000010001418] = 11da2acc f04ed1c6
	stda	%l2,[%i0+0x018]%asi	! Mem[0000000010001418] = 00000000 0000002a
!	%f28 = 55c61a06 98db82eb, Mem[0000000010041408] = ee600000 3eeec2d8
	stda	%f28,[%i1+%o4]0x88	! Mem[0000000010041408] = 55c61a06 98db82eb
!	%l4 = ffffffffff000000, Mem[0000000010101400] = ffffff94
	stba	%l4,[%i4+%g0]0x88	! Mem[0000000010101400] = ffffff00
!	%l0 = 0000000000000024, Mem[0000000010101400] = 00ffffff
	stha	%l0,[%i4+%g0]0x80	! Mem[0000000010101400] = 0024ffff
!	Starting 10 instruction Load Burst
!	%f28 = 55c61a06, %f29 = 98db82eb, %f15 = ffffffff
	fmuls	%f28,%f29,%f15		! %f15 = af29dd92

p0_label_55:
!	Mem[00000000300c1410] = ee6089ff, %f1  = 32b0aa8b
	lda	[%i3+%o5]0x89,%f1 	! %f1 = ee6089ff
!	Code Fragment 4
p0_fragment_6:
!	%l0 = 0000000000000024
	setx	0x09edb007a208481c,%g7,%l0 ! %l0 = 09edb007a208481c
!	%l1 = 00000000056fadff
	setx	0xe7e73a17bf6d62a1,%g7,%l1 ! %l1 = e7e73a17bf6d62a1
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 09edb007a208481c
	setx	0xce240bf7e8537eb0,%g7,%l0 ! %l0 = ce240bf7e8537eb0
!	%l1 = e7e73a17bf6d62a1
	setx	0xf4d0060833916263,%g7,%l1 ! %l1 = f4d0060833916263
!	Mem[0000000010141420] = b6d1e2eb2d092ff1, %f16 = ff000000 7bd72e46
	ldda	[%i5+0x020]%asi,%f16	! %f16 = b6d1e2eb 2d092ff1
!	Mem[00000000100c1408] = 24b30000, %l5 = 0000000000000026
	lduha	[%i3+%o4]0x88,%l5	! %l5 = 0000000000000000
!	Mem[00000000201c0000] = 00945a4a, %l3 = 000000000000002a
	ldsh	[%o0+%g0],%l3		! %l3 = 0000000000000094
!	%f20 = 7bd72e46, %f8  = dec89116
	fsqrts	%f20,%f8 		! %f8  = 5da5f615
!	Mem[0000000010141408] = ffffffff, %l5 = 0000000000000000
	ldsba	[%i5+%o4]0x88,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000030141410] = 1f79e2ec, %f12 = c9f4ffff
	lda	[%i5+%o5]0x81,%f12	! %f12 = 1f79e2ec
!	Mem[0000000010141430] = 55c61a0698db82eb, %f8  = 5da5f615 06830e96
	ldd	[%i5+0x030],%f8 	! %f8  = 55c61a06 98db82eb
!	Starting 10 instruction Store Burst
!	%l4 = ff000000, %l5 = ffffffff, Mem[0000000010181410] = 94ffffff 00000000
	stda	%l4,[%i6+%o5]0x88	! Mem[0000000010181410] = ff000000 ffffffff

p0_label_56:
!	%l0 = ce240bf7e8537eb0, Mem[00000000100c1400] = ff00364a
	stha	%l0,[%i3+%g0]0x80	! Mem[00000000100c1400] = 7eb0364a
!	%l2 = 0000000000000000, Mem[0000000010141400] = 24b30000
	stha	%l2,[%i5+%g0]0x80	! Mem[0000000010141400] = 00000000
!	Mem[0000000030001410] = 0000ff00, %l1 = f4d0060833916263
	swapa	[%i0+%o5]0x89,%l1	! %l1 = 000000000000ff00
!	%l7 = 6e5fdef94099199d, %l4 = ffffffffff000000, %l3 = 0000000000000094
	sdivx	%l7,%l4,%l3		! %l3 = ffffff91a02106c0
!	%l6 = 000000000000ff00, %l4 = ffffffffff000000, %l0 = ce240bf7e8537eb0
	udivx	%l6,%l4,%l0		! %l0 = 0000000000000000
!	%f22 = 11da2acc f04ed1c6, Mem[0000000010141400] = 00000000 2a000000
	stda	%f22,[%i5+%g0]0x80	! Mem[0000000010141400] = 11da2acc f04ed1c6
!	Code Fragment 3
p0_fragment_7:
!	%l0 = 0000000000000000
	setx	0xf031fad81b311eac,%g7,%l0 ! %l0 = f031fad81b311eac
!	%l1 = 000000000000ff00
	setx	0x5739a4904407d6f8,%g7,%l1 ! %l1 = 5739a4904407d6f8
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = f031fad81b311eac
	setx	0x494b2c4fd319d525,%g7,%l0 ! %l0 = 494b2c4fd319d525
!	%l1 = 5739a4904407d6f8
	setx	0x48641a6fd2d804e2,%g7,%l1 ! %l1 = 48641a6fd2d804e2
!	Mem[0000000030141400] = 0e96abee, %l7 = 6e5fdef94099199d
	swapa	[%i5+%g0]0x81,%l7	! %l7 = 000000000e96abee
!	Mem[0000000030101410] = ffffffff, %l4 = ffffffffff000000
	ldstuba	[%i4+%o5]0x89,%l4	! %l4 = 000000ff000000ff
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (9)
!	Mem[0000000010001400] = ff000000 7bd72e46 8baab032 c5a7ffff
!	Mem[0000000010001410] = c5a7ffff 32b0aa8b 00000000 0000002a
!	Mem[0000000010001420] = 000000fb 2d092ff1 0f4f9d1d ff4d8b1f
!	Mem[0000000010001430] = 55c61a06 98db82eb 33f371b2 056fad8c
	ldda	[%i0]ASI_BLK_P,%f16	! Block Load from 0000000010001400

p0_label_57:
!	Mem[0000000010041410] = 01a6d6f0, %l4 = 00000000000000ff
	lduwa	[%i1+%o5]0x80,%l4	! %l4 = 0000000001a6d6f0
!	Mem[0000000010041400] = 02e100ff, %l5 = ffffffffffffffff
	lduwa	[%i1+%g0]0x88,%l5	! %l5 = 0000000002e100ff
!	Mem[0000000030001408] = 1b44e84d, %l6 = 000000000000ff00
	ldsba	[%i0+%o4]0x81,%l6	! %l6 = 000000000000001b
!	Mem[0000000010081400] = e79b9d0b 1f790fec, %l4 = 01a6d6f0, %l5 = 02e100ff
	ldda	[%i2+%g0]0x88,%l4	! %l4 = 000000001f790fec 00000000e79b9d0b
!	%f1  = ee6089ff, %f11 = 5be3cfc5, %f13 = ffffffff
	fsubs	%f1 ,%f11,%f13		! %f13 = ee6089ff
!	Mem[00000000211c0000] = 00d2cd80, %l5 = 00000000e79b9d0b
	lduba	[%o2+0x001]%asi,%l5	! %l5 = 00000000000000d2
!	Mem[00000000300c1408] = ff8e0000, %f7  = 543f1bc0
	lda	[%i3+%o4]0x81,%f7 	! %f7 = ff8e0000
!	Mem[0000000030141410] = 1f79e2ec 0c099c75, %l2 = 00000000, %l3 = a02106c0
	ldda	[%i5+%o5]0x81,%l2	! %l2 = 000000001f79e2ec 000000000c099c75
!	Mem[0000000010041400] = 02e100ff, %l3 = 000000000c099c75
	lduwa	[%i1+%g0]0x88,%l3	! %l3 = 0000000002e100ff
!	Starting 10 instruction Store Burst
!	Mem[00000000201c0000] = 00945a4a, %l7 = 000000000e96abee
	ldstub	[%o0+%g0],%l7		! %l7 = 00000000000000ff

p0_label_58:
!	%l4 = 000000001f790fec, Mem[000000001014141e] = f04ed1c6, %asi = 80
	stha	%l4,[%i5+0x01e]%asi	! Mem[000000001014141c] = f04e0fec
!	Mem[0000000010001410] = c5a7ffff, %l2 = 000000001f79e2ec
	ldstuba	[%i0+%o5]0x80,%l2	! %l2 = 000000c5000000ff
!	%f5  = 000054f8, Mem[00000000100c1410] = ffffffff
	sta	%f5 ,[%i3+%o5]0x88	! Mem[00000000100c1410] = 000054f8
!	Mem[00000000211c0001] = 00d2cd80, %l0 = 494b2c4fd319d525
	ldstuba	[%o2+0x001]%asi,%l0	! %l0 = 000000d2000000ff
!	%l5 = 00000000000000d2, Mem[0000000030041410] = dec8911606830e96
	stxa	%l5,[%i1+%o5]0x81	! Mem[0000000030041410] = 00000000000000d2
!	%l3 = 0000000002e100ff, Mem[0000000010101400] = 0024ffffffffff54
	stxa	%l3,[%i4+%g0]0x80	! Mem[0000000010101400] = 0000000002e100ff
!	%f0  = ffffa7c5 ee6089ff, Mem[0000000030141408] = 0000ffff 0000006f
	stda	%f0 ,[%i5+%o4]0x81	! Mem[0000000030141408] = ffffa7c5 ee6089ff
!	%l6 = 000000000000001b, Mem[0000000030081400] = 38c6ffff
	stha	%l6,[%i2+%g0]0x81	! Mem[0000000030081400] = 001bffff
!	Mem[0000000030101410] = ffffffff, %l4 = 000000001f790fec
	ldstuba	[%i4+%o5]0x89,%l4	! %l4 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = ffff1b00, %l2 = 00000000000000c5
	lduwa	[%i2+%g0]0x89,%l2	! %l2 = 00000000ffff1b00

p0_label_59:
!	%l7 = 0000000000000000, imm = fffffffffffff362, %l1 = 48641a6fd2d804e2
	sub	%l7,-0xc9e,%l1		! %l1 = 0000000000000c9e
!	Mem[00000000100c1400] = 000000004a36b07e, %l7 = 0000000000000000
	ldxa	[%i3+%g0]0x88,%l7	! %l7 = 000000004a36b07e
!	Mem[0000000010001410] = ffffa7ff, %l7 = 000000004a36b07e
	lduha	[%i0+%o5]0x88,%l7	! %l7 = 000000000000a7ff
!	Mem[0000000010141428] = 0f4f9d1d, %l7 = 000000000000a7ff
	ldub	[%i5+0x02b],%l7		! %l7 = 000000000000001d
!	Mem[0000000010081430] = 1b707ea8 dc4e2b5f, %l6 = 0000001b, %l7 = 0000001d
	ldda	[%i2+0x030]%asi,%l6	! %l6 = 000000001b707ea8 00000000dc4e2b5f
!	Mem[00000000211c0000] = 00ffcd80, %l0 = 00000000000000d2
	ldub	[%o2+0x001],%l0		! %l0 = 00000000000000ff
!	Mem[00000000100c142c] = 400be218, %l7 = 00000000dc4e2b5f
	ldswa	[%i3+0x02c]%asi,%l7	! %l7 = 00000000400be218
!	Mem[0000000010001408] = ffffa7c532b0aa8b, %l3 = 0000000002e100ff
	ldxa	[%i0+%o4]0x88,%l3	! %l3 = ffffa7c532b0aa8b
!	Mem[0000000010081400] = e79b9d0b 1f790fec, %l0 = 000000ff, %l1 = 00000c9e
	ldda	[%i2+%g0]0x88,%l0	! %l0 = 000000001f790fec 00000000e79b9d0b
!	Starting 10 instruction Store Burst
!	Mem[0000000030041408] = ffa7ffff, %l1 = 00000000e79b9d0b
	swapa	[%i1+%o4]0x81,%l1	! %l1 = 00000000ffa7ffff

p0_label_60:
!	%l1 = 00000000ffa7ffff, Mem[000000001004142c] = 33f371b2, %asi = 80
	stwa	%l1,[%i1+0x02c]%asi	! Mem[000000001004142c] = ffa7ffff
!	Mem[0000000010041410] = 01a6d6f0, %l3 = ffffa7c532b0aa8b
	ldstuba	[%i1+%o5]0x80,%l3	! %l3 = 00000001000000ff
!	Mem[00000000100c1410] = f8540000, %l7 = 00000000400be218
	swapa	[%i3+%o5]0x80,%l7	! %l7 = 00000000f8540000
!	Mem[0000000021800140] = 1c064205, %l7 = 00000000f8540000
	ldstuba	[%o3+0x140]%asi,%l7	! %l7 = 0000001c000000ff
!	%l3 = 0000000000000001, Mem[0000000010101418] = a8ffffff02e1f454, %asi = 80
	stxa	%l3,[%i4+0x018]%asi	! Mem[0000000010101418] = 0000000000000001
!	%l7 = 000000000000001c, Mem[0000000030181400] = 00000000
	stha	%l7,[%i6+%g0]0x81	! Mem[0000000030181400] = 001c0000
!	%f18 = 8baab032 c5a7ffff, Mem[0000000030141408] = c5a7ffff ff8960ee
	stda	%f18,[%i5+%o4]0x89	! Mem[0000000030141408] = 8baab032 c5a7ffff
!	Mem[00000000100c1400] = 7eb0364a, %l1 = 00000000ffa7ffff
	ldstuba	[%i3+%g0]0x80,%l1	! %l1 = 0000007e000000ff
!	Mem[0000000030041408] = e79b9d0b, %l4 = 00000000000000ff
	swapa	[%i1+%o4]0x81,%l4	! %l4 = 00000000e79b9d0b
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = 02e100ff, %l3 = 0000000000000001
	lduwa	[%i1+%g0]0x88,%l3	! %l3 = 0000000002e100ff

p0_label_61:
!	Mem[0000000030001400] = f0d6a601, %f5  = 000054f8
	lda	[%i0+%g0]0x89,%f5 	! %f5 = f0d6a601
!	Mem[00000000100c1408] = 0000b324, %f30 = 33f371b2
	lda	[%i3+%o4]0x80,%f30	! %f30 = 0000b324
!	Mem[0000000010041400] = ff00e102, %l4 = 00000000e79b9d0b
	lduba	[%i1+%g0]0x80,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010181400] = ffffabee 68af1045 ffad6f05 f8608991
!	Mem[0000000010181410] = 000000ff ffffffff 000000c5 00000ade
!	Mem[0000000010181420] = 67ce8707 4de8441b ffe2649b 7c219d12
!	Mem[0000000010181430] = 6e5fdef9 4099199d a4e811b3 d69a5aa8
	ldda	[%i6]ASI_BLK_AIUPL,%f0	! Block Load from 0000000010181400
!	Mem[0000000010101400] = 0000000002e100ff, %f20 = c5a7ffff 32b0aa8b
	ldd	[%i4+%g0],%f20		! %f20 = 00000000 02e100ff
!	Mem[0000000030181400] = 00001c00, %l3 = 0000000002e100ff
	lduwa	[%i6+%g0]0x89,%l3	! %l3 = 0000000000001c00
!	Mem[0000000010081428] = 79730dae, %l4 = 00000000000000ff
	ldswa	[%i2+0x028]%asi,%l4	! %l4 = 0000000079730dae
!	%f24 = 000000fb, %f25 = 2d092ff1, %f23 = 0000002a
	fsubs	%f24,%f25,%f23		! %l0 = 000000001f79100e, Unfinished, %fsr = 2000000000
!	Mem[0000000030141410] = ece2791f, %f27 = ff4d8b1f
	lda	[%i5+%o5]0x89,%f27	! %f27 = ece2791f
!	Starting 10 instruction Store Burst
!	%l1 = 000000000000007e, Mem[00000000100c1400] = 4a36b0ff
	stha	%l1,[%i3+%g0]0x88	! Mem[00000000100c1400] = 4a36007e

p0_label_62:
!	Mem[0000000010001410] = ffa7ffff32b0aa8b, %l1 = 000000000000007e, %l5 = 00000000000000d2
	add	%i0,0x10,%g1
	casxa	[%g1]0x80,%l1,%l5	! %l5 = ffa7ffff32b0aa8b
!	Mem[0000000030101400] = c5cfe35b, %l3 = 0000000000001c00
	ldstuba	[%i4+%g0]0x81,%l3	! %l3 = 000000c5000000ff
!	Mem[0000000010101400] = 00000000, %l7 = 000000000000001c
	ldstuba	[%i4+%g0]0x80,%l7	! %l7 = 00000000000000ff
!	%l6 = 1b707ea8, %l7 = 00000000, Mem[0000000030081410] = ffffffff ee608991
	stda	%l6,[%i2+%o5]0x89	! Mem[0000000030081410] = 1b707ea8 00000000
!	Mem[0000000010001408] = 32b0aa8b, %l2 = 00000000ffff1b00
	swapa	[%i0+%o4]0x88,%l2	! %l2 = 0000000032b0aa8b
!	%l0 = 000000001f79100e, Mem[0000000030041410] = 00000000
	stwa	%l0,[%i1+%o5]0x89	! Mem[0000000030041410] = 1f79100e
!	Mem[0000000010141410] = ffffa7c5, %l4 = 0000000079730dae
	ldstuba	[%i5+%o5]0x80,%l4	! %l4 = 000000ff000000ff
!	Mem[0000000030181408] = 000000d2, %l7 = 0000000000000000
	ldstuba	[%i6+%o4]0x89,%l7	! %l7 = 000000d2000000ff
!	Mem[0000000010141400] = 11da2acc, %l0 = 000000001f79100e
	ldstuba	[%i5+%g0]0x80,%l0	! %l0 = 00000011000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000218001c0] = 00d25b76, %l3 = 00000000000000c5
	ldsb	[%o3+0x1c1],%l3		! %l3 = ffffffffffffffd2

p0_label_63:
!	Mem[0000000030181400] = 00001c00, %f27 = ece2791f
	lda	[%i6+%g0]0x89,%f27	! %f27 = 00001c00
!	Mem[0000000010041400] = 02e100ff, %l4 = 00000000000000ff
	ldswa	[%i1+%g0]0x88,%l4	! %l4 = 0000000002e100ff
!	Mem[0000000010141408] = ffffffff, %l7 = 00000000000000d2
	ldsba	[%i5+%o4]0x88,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010081400] = e79b9d0b 1f790fec, %l2 = 32b0aa8b, %l3 = ffffffd2
	ldda	[%i2+%g0]0x88,%l2	! %l2 = 000000001f790fec 00000000e79b9d0b
!	%f22 = 00000000, %f19 = c5a7ffff, %f27 = 00001c00
	fdivs	%f22,%f19,%f27		! %f27 = 80000000
!	Mem[0000000030041410] = 0e10791f, %f22 = 00000000
	lda	[%i1+%o5]0x81,%f22	! %f22 = 0e10791f
!	%l0 = 0000000000000011, Mem[0000000030101400] = 0ade34b65be3cfff
	stxa	%l0,[%i4+%g0]0x89	! Mem[0000000030101400] = 0000000000000011
!	Mem[0000000030101400] = 1100000000000000, %f16 = ff000000 7bd72e46
	ldda	[%i4+%g0]0x81,%f16	! %f16 = 11000000 00000000
!	Mem[0000000010101438] = 1837c19a, %l5 = ffa7ffff32b0aa8b
	ldsh	[%i4+0x03a],%l5		! %l5 = ffffffffffffc19a
!	Starting 10 instruction Store Burst
!	Mem[0000000010041408] = 98db82eb, %l6 = 000000001b707ea8
	swapa	[%i1+%o4]0x88,%l6	! %l6 = 0000000098db82eb

p0_label_64:
	membar	#Sync			! Added by membar checker (10)
!	%l7 = ffffffffffffffff, Mem[0000000010001408] = 001bffff
	stba	%l7,[%i0+%o4]0x80	! Mem[0000000010001408] = ff1bffff
!	%f6  = de0a0000, Mem[0000000010041430] = ffffffff
	sta	%f6 ,[%i1+0x030]%asi	! Mem[0000000010041430] = de0a0000
!	%l7 = ffffffffffffffff, Mem[00000000100c1408] = 24b30000
	stha	%l7,[%i3+%o4]0x88	! Mem[00000000100c1408] = 24b3ffff
!	Mem[0000000010081400] = ec0f791f, %l7 = ffffffffffffffff
	swapa	[%i2+%g0]0x80,%l7	! %l7 = 00000000ec0f791f
!	%f13 = f9de5f6e, Mem[0000000010101400] = ff000000
	sta	%f13,[%i4+%g0]0x80	! Mem[0000000010101400] = f9de5f6e
!	%l7 = 00000000ec0f791f, Mem[0000000030141408] = ffffa7c5
	stba	%l7,[%i5+%o4]0x81	! Mem[0000000030141408] = 1fffa7c5
!	%l0 = 00000011, %l1 = 0000007e, Mem[0000000010141410] = ffffa7c5 32b0aa8b
	stda	%l0,[%i5+%o5]0x80	! Mem[0000000010141410] = 00000011 0000007e
!	Mem[0000000010101401] = f9de5f6e, %l2 = 000000001f790fec
	ldstuba	[%i4+0x001]%asi,%l2	! %l2 = 000000de000000ff
!	%f25 = 2d092ff1, Mem[0000000030181400] = 00001c00
	sta	%f25,[%i6+%g0]0x89	! Mem[0000000030181400] = 2d092ff1
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = 4099199d, %f1  = eeabffff
	lda	[%i5+%g0]0x81,%f1 	! %f1 = 4099199d

p0_label_65:
!	Mem[0000000010041408] = 1b707ea8, %l7 = 00000000ec0f791f
	ldsba	[%i1+%o4]0x88,%l7	! %l7 = ffffffffffffffa8
!	Mem[0000000030141400] = 4099199d, %f11 = 9b64e2ff
	lda	[%i5+%g0]0x81,%f11	! %f11 = 4099199d
!	Mem[0000000010001408] = ff1bffff, %l3 = 00000000e79b9d0b
	ldswa	[%i0+%o4]0x80,%l3	! %l3 = ffffffffff1bffff
!	%l7 = ffffffffffffffa8, %l6 = 0000000098db82eb, %l6 = 0000000098db82eb
	or	%l7,%l6,%l6		! %l6 = ffffffffffffffeb
!	Mem[0000000030101408] = 02e1f4ff, %l0 = 0000000000000011
	ldsba	[%i4+%o4]0x89,%l0	! %l0 = ffffffffffffffff
!	Mem[000000001014140c] = 056fad8c, %l4 = 0000000002e100ff
	lduwa	[%i5+0x00c]%asi,%l4	! %l4 = 00000000056fad8c
!	Mem[0000000010081400] = e79b9d0bffffffff, %l2 = 00000000000000de
	ldxa	[%i2+%g0]0x88,%l2	! %l2 = e79b9d0bffffffff
!	Mem[0000000030001410] = 63629133, %l2 = e79b9d0bffffffff
	lduwa	[%i0+%o5]0x81,%l2	! %l2 = 0000000063629133
!	Mem[0000000010141410] = 00000011, %f8  = 1b44e84d
	lda	[%i5+%o5]0x80,%f8 	! %f8 = 00000011
!	Starting 10 instruction Store Burst
!	Code Fragment 3
p0_fragment_8:
!	%l0 = ffffffffffffffff
	setx	0x3a23b6e859e75851,%g7,%l0 ! %l0 = 3a23b6e859e75851
!	%l1 = 000000000000007e
	setx	0x134d361fe14d8a1c,%g7,%l1 ! %l1 = 134d361fe14d8a1c
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 3a23b6e859e75851
	setx	0xadfbe6e82fcef551,%g7,%l0 ! %l0 = adfbe6e82fcef551
!	%l1 = 134d361fe14d8a1c
	setx	0x966db83f93c30639,%g7,%l1 ! %l1 = 966db83f93c30639

p0_label_66:
!	%l5 = ffffffffffffc19a, Mem[0000000030101410] = ffffffff
	stwa	%l5,[%i4+%o5]0x89	! Mem[0000000030101410] = ffffc19a
!	%l7 = ffffffffffffffa8, Mem[0000000030101410] = ffffc19a
	stwa	%l7,[%i4+%o5]0x89	! Mem[0000000030101410] = ffffffa8
!	%l2 = 63629133, %l3 = ff1bffff, Mem[0000000030101408] = fff4e102 ffffffa8
	stda	%l2,[%i4+%o4]0x81	! Mem[0000000030101408] = 63629133 ff1bffff
!	%l2 = 0000000063629133, Mem[0000000010181408] = ffad6f05
	stwa	%l2,[%i6+%o4]0x80	! Mem[0000000010181408] = 63629133
!	%f8  = 00000011 0787ce67, Mem[0000000010181400] = eeabffff 4510af68
	stda	%f8 ,[%i6+%g0]0x88	! Mem[0000000010181400] = 00000011 0787ce67
!	Mem[0000000021800101] = b4ffaf61, %l4 = 00000000056fad8c
	ldstuba	[%o3+0x101]%asi,%l4	! %l4 = 000000ff000000ff
!	%l5 = ffffffffffffc19a, Mem[0000000010141400] = cc2adaff
	stha	%l5,[%i5+%g0]0x88	! Mem[0000000010141400] = cc2ac19a
!	%f4  = ffffffff ff000000, %l5 = ffffffffffffc19a
!	Mem[00000000100c1410] = 400be21802b34eff
	add	%i3,0x010,%g1
	stda	%f4,[%g1+%l5]ASI_PST32_PL ! Mem[00000000100c1410] = 400be218ffffffff
!	%l6 = ffffffffffffffeb, Mem[000000001010142a] = 14cc9d31, %asi = 80
	stba	%l6,[%i4+0x02a]%asi	! Mem[0000000010101428] = 14cceb31
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = 00ffcd80, %l1 = 966db83f93c30639
	ldsba	[%o2+0x001]%asi,%l1	! %l1 = ffffffffffffffff

p0_label_67:
!	Mem[0000000030181408] = 000000ff, %l2 = 0000000063629133
	ldsba	[%i6+%o4]0x89,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000030001410] = 63629133bac772b9, %f28 = 55c61a06 98db82eb
	ldda	[%i0+%o5]0x81,%f28	! %f28 = 63629133 bac772b9
!	Mem[0000000010101400] = ff00e1026e5ffff9, %l6 = ffffffffffffffeb
	ldxa	[%i4+%g0]0x88,%l6	! %l6 = ff00e1026e5ffff9
!	Mem[0000000030081410] = 1b707ea8, %l4 = 00000000000000ff
	ldswa	[%i2+%o5]0x89,%l4	! %l4 = 000000001b707ea8
!	Mem[0000000030181408] = ff000000, %l7 = ffffffffffffffa8
	lduba	[%i6+%o4]0x81,%l7	! %l7 = 00000000000000ff
!	Mem[00000000300c1400] = 5c3e61d3 918960f8, %l6 = 6e5ffff9, %l7 = 000000ff
	ldda	[%i3+%g0]0x89,%l6	! %l6 = 00000000918960f8 000000005c3e61d3
!	Mem[0000000010041408] = a87e701b061ac655, %f30 = 0000b324 056fad8c
	ldda	[%i1+%o4]0x80,%f30	! %f30 = a87e701b 061ac655
!	Mem[0000000010041408] = 55c61a06 1b707ea8, %l0 = 2fcef551, %l1 = ffffffff
	ldda	[%i1+%o4]0x88,%l0	! %l0 = 000000001b707ea8 0000000055c61a06
!	Mem[0000000010141410] = 000000110000007e, %f12 = 9d199940 f9de5f6e
	ldda	[%i5+%o5]0x80,%f12	! %f12 = 00000011 0000007e
!	Starting 10 instruction Store Burst
!	%l4 = 000000001b707ea8, Mem[0000000030081408] = 9d0fffff70db00d2
	stxa	%l4,[%i2+%o4]0x81	! Mem[0000000030081408] = 000000001b707ea8

p0_label_68:
!	%f26 = 0f4f9d1d 80000000, Mem[0000000010041410] = f0d6a6ff c962468d
	stda	%f26,[%i1+%o5]0x88	! Mem[0000000010041410] = 0f4f9d1d 80000000
!	Mem[0000000020800000] = ffffa5fa, %l3 = ffffffffff1bffff
	ldstub	[%o1+%g0],%l3		! %l3 = 000000ff000000ff
!	%f16 = 11000000 00000000, Mem[0000000030181410] = 000000ff 00000000
	stda	%f16,[%i6+%o5]0x89	! Mem[0000000030181410] = 11000000 00000000
!	Mem[000000001004141c] = c8a9abee, %l3 = 00000000000000ff, %asi = 80
	swapa	[%i1+0x01c]%asi,%l3	! %l3 = 00000000c8a9abee
!	%f14 = a85a9ad6 b311e8a4, Mem[0000000010081408] = 00ff0000 1255fc65
	stda	%f14,[%i2+0x008]%asi	! Mem[0000000010081408] = a85a9ad6 b311e8a4
!	%l2 = ffffffffffffffff, Mem[0000000010141400] = 9ac12acc
	stha	%l2,[%i5+%g0]0x80	! Mem[0000000010141400] = ffff2acc
!	%l1 = 0000000055c61a06, Mem[00000000300c1408] = 00008eff
	stba	%l1,[%i3+%o4]0x89	! Mem[00000000300c1408] = 00008e06
!	%l2 = ffffffff, %l3 = c8a9abee, Mem[0000000010041410] = 80000000 0f4f9d1d
	stda	%l2,[%i1+%o5]0x88	! Mem[0000000010041410] = ffffffff c8a9abee
!	%l4 = 1b707ea8, %l5 = ffffc19a, Mem[0000000010041430] = de0a0000 ffffffff
	std	%l4,[%i1+0x030]		! Mem[0000000010041430] = 1b707ea8 ffffc19a
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = 11000000, %l0 = 000000001b707ea8
	ldswa	[%i5+%o5]0x88,%l0	! %l0 = 0000000011000000

p0_label_69:
!	Mem[0000000010081410] = 00000000, %l0 = 0000000011000000
	ldsha	[%i2+%o5]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000030181400] = 2d092ff1, %l6 = 00000000918960f8
	lduba	[%i6+%g0]0x89,%l6	! %l6 = 00000000000000f1
!	Mem[000000001000140c] = c5a7ffff, %l7 = 000000005c3e61d3
	lduw	[%i0+0x00c],%l7		! %l7 = 00000000c5a7ffff
!	Mem[00000000300c1400] = 918960f8, %l0 = 0000000000000000
	ldswa	[%i3+%g0]0x89,%l0	! %l0 = ffffffff918960f8
!	Mem[00000000100c1400] = 000000004a36007e, %l0 = ffffffff918960f8
	ldxa	[%i3+%g0]0x88,%l0	! %l0 = 000000004a36007e
!	Mem[00000000300c1408] = 068e0000, %l0 = 000000004a36007e
	ldsha	[%i3+%o4]0x81,%l0	! %l0 = 000000000000068e
!	Mem[0000000010081408] = d69a5aa8, %f12 = 00000011
	lda	[%i2+%o4]0x88,%f12	! %f12 = d69a5aa8
!	Mem[0000000030081408] = 00000000, %l3 = 00000000c8a9abee
	lduba	[%i2+%o4]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000030101408] = 63629133ff1bffff, %l7 = 00000000c5a7ffff
	ldxa	[%i4+%o4]0x81,%l7	! %l7 = 63629133ff1bffff
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1410] = ff8960ee, %l5 = ffffffffffffc19a
	ldstuba	[%i3+%o5]0x81,%l5	! %l5 = 000000ff000000ff

p0_label_70:
!	%f20 = 00000000 02e100ff, Mem[0000000010141408] = ffffffff 056fad8c
	stda	%f20,[%i5+%o4]0x80	! Mem[0000000010141408] = 00000000 02e100ff
!	%l3 = 0000000000000000, Mem[0000000010141408] = 00000000
	stwa	%l3,[%i5+%o4]0x80	! Mem[0000000010141408] = 00000000
!	Mem[0000000010041410] = ffffffffeeaba9c8, %l3 = 0000000000000000, %l5 = 00000000000000ff
	add	%i1,0x10,%g1
	casxa	[%g1]0x80,%l3,%l5	! %l5 = ffffffffeeaba9c8
!	Mem[0000000030181408] = 000000ff, %l5 = ffffffffeeaba9c8
	ldstuba	[%i6+%o4]0x89,%l5	! %l5 = 000000ff000000ff
!	Mem[0000000010041410] = ffffffff, %l5 = 00000000000000ff
	swapa	[%i1+%o5]0x80,%l5	! %l5 = 00000000ffffffff
!	Mem[0000000010181400] = 67ce8707, %l1 = 0000000055c61a06
	swapa	[%i6+%g0]0x80,%l1	! %l1 = 0000000067ce8707
!	Mem[0000000010181410] = ff000000, %l2 = ffffffffffffffff
	ldstuba	[%i6+%o5]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[000000001008143b] = 00000000, %l1 = 0000000067ce8707
	ldstub	[%i2+0x03b],%l1		! %l1 = 00000000000000ff
!	%l0 = 0000068e, %l1 = 00000000, Mem[0000000010181408] = 63629133 f8608991
	stda	%l0,[%i6+%o4]0x80	! Mem[0000000010181408] = 0000068e 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = f12f092d7c219d12, %l5 = 00000000ffffffff
	ldxa	[%i6+%g0]0x81,%l5	! %l5 = f12f092d7c219d12

p0_label_71:
!	Mem[0000000010041408] = a87e701b, %l5 = f12f092d7c219d12
	lduba	[%i1+0x00a]%asi,%l5	! %l5 = 0000000000000070
!	Mem[0000000030141408] = 8baab032c5a7ff1f, %l4 = 000000001b707ea8
	ldxa	[%i5+%o4]0x89,%l4	! %l4 = 8baab032c5a7ff1f
!	Mem[0000000020800000] = ffffa5fa, %l0 = 000000000000068e
	ldsh	[%o1+%g0],%l0		! %l0 = ffffffffffffffff
!	Mem[0000000030001410] = 33916263, %l3 = 0000000000000000
	lduha	[%i0+%o5]0x89,%l3	! %l3 = 0000000000006263
!	Mem[0000000030041400] = 309a0cf5 98b3f8ff, %l2 = 00000000, %l3 = 00006263
	ldda	[%i1+%g0]0x89,%l2	! %l2 = 0000000098b3f8ff 00000000309a0cf5
!	Mem[00000000100c1430] = bfc28cf8, %l2 = 0000000098b3f8ff
	lduh	[%i3+0x032],%l2		! %l2 = 0000000000008cf8
!	Mem[0000000020800040] = fffffa54, %l6 = 00000000000000f1
	ldsb	[%o1+0x040],%l6		! %l6 = ffffffffffffffff
!	%l5 = 0000000000000070, immd = fffffffffffff4e6, %l6 = ffffffffffffffff
	udivx	%l5,-0xb1a,%l6		! %l6 = 0000000000000000
!	Mem[00000000100c1400] = 7e00364a, %l1 = 0000000000000000
	lduha	[%i3+%g0]0x80,%l1	! %l1 = 0000000000007e00
!	Starting 10 instruction Store Burst
!	%f22 = 0e10791f 0000002a, %l7 = 63629133ff1bffff
!	Mem[00000000300c1420] = 9d6373fbc85f108f
	add	%i3,0x020,%g1
	stda	%f22,[%g1+%l7]ASI_PST16_SL ! Mem[00000000300c1420] = 2a0000001f79100e

p0_label_72:
!	%l2 = 0000000000008cf8, Mem[0000000010101408] = ff0000005be3cfc5
	stxa	%l2,[%i4+%o4]0x80	! Mem[0000000010101408] = 0000000000008cf8
!	Code Fragment 4
p0_fragment_9:
!	%l0 = ffffffffffffffff
	setx	0xfc1ea338131f2ef3,%g7,%l0 ! %l0 = fc1ea338131f2ef3
!	%l1 = 0000000000007e00
	setx	0x08fb79b04c5c7006,%g7,%l1 ! %l1 = 08fb79b04c5c7006
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = fc1ea338131f2ef3
	setx	0xfaa8c8900c72a987,%g7,%l0 ! %l0 = faa8c8900c72a987
!	%l1 = 08fb79b04c5c7006
	setx	0x1ab4ff304b7a849a,%g7,%l1 ! %l1 = 1ab4ff304b7a849a
!	Mem[000000001010142e] = 565c3811, %l7 = 63629133ff1bffff
	ldstuba	[%i4+0x02e]%asi,%l7	! %l7 = 00000038000000ff
!	Mem[0000000010041435] = ffffc19a, %l4 = 8baab032c5a7ff1f
	ldstub	[%i1+0x035],%l4		! %l4 = 000000ff000000ff
!	%f26 = 0f4f9d1d, Mem[0000000010141410] = 00000011
	sta	%f26,[%i5+%o5]0x80	! Mem[0000000010141410] = 0f4f9d1d
!	%l6 = 0000000000000000, Mem[00000000211c0000] = 00ffcd80
	sth	%l6,[%o2+%g0]		! Mem[00000000211c0000] = 0000cd80
!	%l4 = 00000000000000ff, Mem[0000000010181408] = 8e060000
	stwa	%l4,[%i6+%o4]0x88	! Mem[0000000010181408] = 000000ff
!	%f30 = a87e701b 061ac655, Mem[0000000030101410] = ffffffa8 94ffffff
	stda	%f30,[%i4+%o5]0x89	! Mem[0000000030101410] = a87e701b 061ac655
!	%l2 = 0000000000008cf8, Mem[0000000010141410] = 0f4f9d1d
	stba	%l2,[%i5+%o5]0x80	! Mem[0000000010141410] = f84f9d1d
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = 00000000, %l2 = 0000000000008cf8
	lduwa	[%i5+%o4]0x88,%l2	! %l2 = 0000000000000000

p0_label_73:
!	Mem[0000000010081400] = ffffffff, %l3 = 00000000309a0cf5
	ldsha	[%i2+%g0]0x80,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000030141408] = 1fffa7c5, %l0 = faa8c8900c72a987
	lduwa	[%i5+%o4]0x81,%l0	! %l0 = 000000001fffa7c5
!	Mem[0000000030181400] = f12f092d7c219d12, %f28 = 63629133 bac772b9
	ldda	[%i6+%g0]0x81,%f28	! %f28 = f12f092d 7c219d12
!	Mem[00000000100c1400] = 4a36007e, %l0 = 000000001fffa7c5
	ldsha	[%i3+%g0]0x88,%l0	! %l0 = 000000000000007e
!	Mem[0000000021800080] = 26678dc3, %l6 = 0000000000000000
	ldsba	[%o3+0x081]%asi,%l6	! %l6 = 0000000000000067
!	%l1 = 1ab4ff304b7a849a, imm = fffffffffffff8c4, %l5 = 0000000000000070
	and	%l1,-0x73c,%l5		! %l5 = 1ab4ff304b7a8080
!	%f21 = 02e100ff, %f13 = 0000007e, %f12 = d69a5aa8 0000007e
	fsmuld	%f21,%f13,%f12		! %l0 = 00000000000000a0, Unfinished, %fsr = 2000000000
!	%l1 = 1ab4ff304b7a849a, immed = fffff947, %y  = ffffff68
	smul	%l1,-0x6b9,%l0		! %l0 = fffffe04955a90b6, %y = fffffe04
!	Mem[0000000010041420] = ba6cab9e7fcdab61, %f0  = 4510af68 4099199d
	ldd	[%i1+0x020],%f0 	! %f0  = ba6cab9e 7fcdab61
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1408] = 068e0000, %l5 = 1ab4ff304b7a8080
	ldstuba	[%i3+%o4]0x81,%l5	! %l5 = 00000006000000ff

p0_label_74:
!	%l1 = 1ab4ff304b7a849a, Mem[0000000010041408] = 1b707ea8
	stwa	%l1,[%i1+%o4]0x88	! Mem[0000000010041408] = 4b7a849a
!	%f3  = 056fadff, Mem[0000000030181408] = ff000000
	sta	%f3 ,[%i6+%o4]0x81	! Mem[0000000030181408] = 056fadff
!	%l7 = 0000000000000038, Mem[0000000030001400] = ce114ffbf0d6a601
	stxa	%l7,[%i0+%g0]0x89	! Mem[0000000030001400] = 0000000000000038
!	%l0 = 955a90b6, %l1 = 4b7a849a, Mem[0000000010041400] = 02e100ff a8ffffff
	stda	%l0,[%i1+%g0]0x88	! Mem[0000000010041400] = 955a90b6 4b7a849a
!	Mem[0000000010141400] = ffff2accf04ed1c6, %l1 = 1ab4ff304b7a849a, %l2 = 0000000000000000
	casxa	[%i5]0x80,%l1,%l2	! %l2 = ffff2accf04ed1c6
!	Mem[0000000010101408] = 00000000, %l0 = fffffe04955a90b6
	swapa	[%i4+%o4]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000030101410] = 55c61a06, %l6 = 0000000000000067
	ldstuba	[%i4+%o5]0x81,%l6	! %l6 = 00000055000000ff
!	%f19 = c5a7ffff, Mem[0000000030181410] = 00000000
	sta	%f19,[%i6+%o5]0x89	! Mem[0000000030181410] = c5a7ffff
!	%l0 = 00000000, %l1 = 4b7a849a, Mem[0000000030181400] = 2d092ff1 129d217c
	stda	%l0,[%i6+%g0]0x89	! Mem[0000000030181400] = 00000000 4b7a849a
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = 309a0cf598b3f8ff, %f28 = f12f092d 7c219d12
	ldda	[%i1+%g0]0x89,%f28	! %f28 = 309a0cf5 98b3f8ff

p0_label_75:
!	Mem[0000000010081410] = 8cad6f05 00000000, %l0 = 00000000, %l1 = 4b7a849a
	ldda	[%i2+%o5]0x88,%l0	! %l0 = 0000000000000000 000000008cad6f05
!	Mem[00000000218001c0] = 00d25b76, %l2 = ffff2accf04ed1c6
	ldsh	[%o3+0x1c0],%l2		! %l2 = 00000000000000d2
!	Mem[0000000010041430] = 1b707ea8, %f11 = 4099199d
	lda	[%i1+0x030]%asi,%f11	! %f11 = 1b707ea8
!	Mem[0000000020800000] = ffffa5fa, %l1 = 000000008cad6f05
	ldsh	[%o1+%g0],%l1		! %l1 = ffffffffffffffff
!	Mem[0000000010101408] = f88c0000b6905a95, %f24 = 000000fb 2d092ff1
	ldda	[%i4+%o4]0x88,%f24	! %f24 = f88c0000 b6905a95
!	Mem[0000000030101408] = 33916263, %l5 = 0000000000000006
	lduba	[%i4+%o4]0x89,%l5	! %l5 = 0000000000000063
!	Mem[0000000030181410] = ffffa7c5, %l0 = 0000000000000000
	lduba	[%i6+%o5]0x81,%l0	! %l0 = 00000000000000ff
!	Mem[00000000211c0000] = 0000cd80, %l5 = 0000000000000063
	ldub	[%o2+0x001],%l5		! %l5 = 0000000000000000
!	Mem[00000000201c0000] = ff945a4a, %l6 = 0000000000000055
	ldsha	[%o0+0x000]%asi,%l6	! %l6 = ffffffffffffff94
!	Starting 10 instruction Store Burst
!	Mem[0000000010041408] = 9a847a4b, %l3 = ffffffffffffffff
	swapa	[%i1+%o4]0x80,%l3	! %l3 = 000000009a847a4b

p0_label_76:
!	%f30 = a87e701b 061ac655, %l4 = 00000000000000ff
!	Mem[0000000030041410] = 0e10791f000000d2
	add	%i1,0x010,%g1
	stda	%f30,[%g1+%l4]ASI_PST8_SL ! Mem[0000000030041410] = 55c61a061b707ea8
!	%f22 = 0e10791f 0000002a, %l1 = ffffffffffffffff
!	Mem[0000000030001408] = 1b44e84d7bd72e46
	add	%i0,0x008,%g1
	stda	%f22,[%g1+%l1]ASI_PST32_S ! Mem[0000000030001408] = 0e10791f0000002a
!	%f10 = 129d217c 1b707ea8, Mem[0000000030181408] = ffad6f05 2c58cb47
	stda	%f10,[%i6+%o4]0x89	! Mem[0000000030181408] = 129d217c 1b707ea8
!	Mem[0000000010081408] = a85a9ad6, %l5 = 0000000000000000
	swapa	[%i2+%o4]0x80,%l5	! %l5 = 00000000a85a9ad6
!	%l1 = ffffffffffffffff, imm = 0000000000000661, %l6 = ffffffffffffff94
	sub	%l1,0x661,%l6		! %l6 = fffffffffffff99e
!	%l0 = 00000000000000ff, Mem[0000000010041408] = ffffffff
	stwa	%l0,[%i1+%o4]0x88	! Mem[0000000010041408] = 000000ff
!	Mem[0000000030181410] = c5a7ffff, %l0 = 00000000000000ff
	swapa	[%i6+%o5]0x89,%l0	! %l0 = 00000000c5a7ffff
!	%l0 = 00000000c5a7ffff, Mem[0000000010181408] = ff000000
	stwa	%l0,[%i6+%o4]0x80	! Mem[0000000010181408] = c5a7ffff
!	%f14 = a85a9ad6 b311e8a4, Mem[0000000010181400] = 061ac655 00000011
	stda	%f14,[%i6+%g0]0x88	! Mem[0000000010181400] = a85a9ad6 b311e8a4
!	Starting 10 instruction Load Burst
!	Mem[0000000021800080] = 26678dc3, %l4 = 00000000000000ff
	ldsh	[%o3+0x080],%l4		! %l4 = 0000000000002667

p0_label_77:
!	Mem[0000000030101400] = 00000011, %l0 = 00000000c5a7ffff
	lduwa	[%i4+%g0]0x89,%l0	! %l0 = 0000000000000011
!	Mem[0000000030041400] = fff8b398, %l4 = 0000000000002667
	ldsha	[%i1+%g0]0x81,%l4	! %l4 = fffffffffffffff8
!	Mem[0000000030141410] = 1f79e2ec, %f20 = 00000000
	lda	[%i5+%o5]0x81,%f20	! %f20 = 1f79e2ec
!	Mem[0000000010141418] = 11da2accf04e0fec, %l2 = 00000000000000d2
	ldxa	[%i5+0x018]%asi,%l2	! %l2 = 11da2accf04e0fec
!	Mem[0000000030081408] = 000000001b707ea8, %l7 = 0000000000000038
	ldxa	[%i2+%o4]0x81,%l7	! %l7 = 000000001b707ea8
!	Mem[00000000100c1400] = 7e00364a, %l4 = fffffffffffffff8
	ldswa	[%i3+%g0]0x80,%l4	! %l4 = 000000007e00364a
!	Mem[0000000010141420] = b6d1e2eb, %f10 = 129d217c
	lda	[%i5+0x020]%asi,%f10	! %f10 = b6d1e2eb
!	%f16 = 11000000, Mem[0000000010081414] = 056fad8c
	sta	%f16,[%i2+0x014]%asi	! Mem[0000000010081414] = 11000000
!	Code Fragment 3
p0_fragment_10:
!	%l0 = 0000000000000011
	setx	0xf6df28f86b2b7dc0,%g7,%l0 ! %l0 = f6df28f86b2b7dc0
!	%l1 = ffffffffffffffff
	setx	0x7c34d20fafc9515a,%g7,%l1 ! %l1 = 7c34d20fafc9515a
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = f6df28f86b2b7dc0
	setx	0x2692f50039b33186,%g7,%l0 ! %l0 = 2692f50039b33186
!	%l1 = 7c34d20fafc9515a
	setx	0x3aa775f80f645e2c,%g7,%l1 ! %l1 = 3aa775f80f645e2c
!	Starting 10 instruction Store Burst
!	%l4 = 7e00364a, %l5 = a85a9ad6, Mem[0000000030181400] = 00000000 4b7a849a
	stda	%l4,[%i6+%g0]0x89	! Mem[0000000030181400] = 7e00364a a85a9ad6

p0_label_78:
!	%l0 = 2692f50039b33186, Mem[0000000010141420] = b6d1e2eb
	sth	%l0,[%i5+0x020]		! Mem[0000000010141420] = 3186e2eb
!	Mem[0000000010041410] = ff000000, %l5 = 00000000a85a9ad6
	swapa	[%i1+%o5]0x88,%l5	! %l5 = 00000000ff000000
!	Mem[000000001008143a] = 000000ff, %l2 = 11da2accf04e0fec
	ldstuba	[%i2+0x03a]%asi,%l2	! %l2 = 00000000000000ff
!	Mem[000000001010141c] = 00000001, %l6 = fffff99e, %l6 = fffff99e
	add	%i4,0x1c,%g1
	casa	[%g1]0x80,%l6,%l6	! %l6 = 0000000000000001
!	%l0 = 2692f50039b33186, Mem[0000000030001408] = 0e10791f
	stwa	%l0,[%i0+%o4]0x81	! Mem[0000000030001408] = 39b33186
!	%l0 = 2692f50039b33186, Mem[0000000010001408] = ff1bffff
	stba	%l0,[%i0+%o4]0x80	! Mem[0000000010001408] = 861bffff
!	%l4 = 000000007e00364a, immed = 000008d9, %y  = fffffe04
	smul	%l4,0x8d9,%l2		! %l2 = 0000045acfe054ba, %y = 0000045a
!	Mem[00000000100c1410] = 18e20b40, %l3 = 000000009a847a4b
	swapa	[%i3+%o5]0x88,%l3	! %l3 = 0000000018e20b40
!	%f12 = d69a5aa8 0000007e, Mem[0000000010101438] = 1837c19a 7d3b0ba6
	stda	%f12,[%i4+0x038]%asi	! Mem[0000000010101438] = d69a5aa8 0000007e
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = 4b7a849a, %l2 = 0000045acfe054ba
	lduha	[%i3+%o5]0x80,%l2	! %l2 = 0000000000004b7a

p0_label_79:
!	Mem[00000000201c0000] = ff945a4a, %l2 = 0000000000004b7a
	lduba	[%o0+0x001]%asi,%l2	! %l2 = 0000000000000094
!	Mem[0000000010001400] = ff000000, %l0 = 2692f50039b33186
	ldswa	[%i0+%g0]0x80,%l0	! %l0 = ffffffffff000000
!	Mem[0000000010001408] = 861bffff, %l3 = 0000000018e20b40
	ldsh	[%i0+0x00a],%l3		! %l3 = ffffffffffffffff
!	%f27 = 80000000, %f31 = 061ac655, %f27 = 80000000
	fadds	%f27,%f31,%f27		! %f27 = 061ac655
!	Mem[0000000010041408] = ff000000, %l0 = ffffffffff000000
	ldswa	[%i1+%o4]0x80,%l0	! %l0 = ffffffffff000000
!	Mem[0000000030101410] = ffc61a06, %f15 = b311e8a4
	lda	[%i4+%o5]0x81,%f15	! %f15 = ffc61a06
!	Mem[000000001004140c] = 061ac655, %l7 = 000000001b707ea8
	lduha	[%i1+0x00c]%asi,%l7	! %l7 = 000000000000061a
!	Mem[00000000100c1404] = 00000000, %l1 = 3aa775f80f645e2c
	lduba	[%i3+0x004]%asi,%l1	! %l1 = 0000000000000000
!	Mem[0000000030081410] = a87e701b, %l6 = 0000000000000001
	ldswa	[%i2+%o5]0x81,%l6	! %l6 = ffffffffa87e701b
!	Starting 10 instruction Store Burst
!	Mem[0000000030141400] = 4099199d, %l6 = ffffffffa87e701b
	swapa	[%i5+%g0]0x81,%l6	! %l6 = 000000004099199d

p0_label_80:
!	Mem[0000000010101408] = 955a90b6, %l6 = 000000004099199d, %asi = 80
	swapa	[%i4+0x008]%asi,%l6	! %l6 = 00000000955a90b6
!	%f0  = ba6cab9e 7fcdab61 918960f8 056fadff
!	%f4  = ffffffff ff000000 de0a0000 c5000000
!	%f8  = 00000011 0787ce67 b6d1e2eb 1b707ea8
!	%f12 = d69a5aa8 0000007e a85a9ad6 ffc61a06
	stda	%f0,[%i2]ASI_BLK_PL	! Block Store to 0000000010081400
!	Mem[0000000010001418] = 00000000, %l2 = 0000000000000094
	swap	[%i0+0x018],%l2		! %l2 = 0000000000000000
!	Mem[00000000100c1408] = 24b3ffff, %l3 = ffffffffffffffff
	swapa	[%i3+%o4]0x88,%l3	! %l3 = 0000000024b3ffff
!	Mem[0000000030181408] = a87e701b, %l7 = 000000000000061a
	ldstuba	[%i6+%o4]0x81,%l7	! %l7 = 000000a8000000ff
!	Mem[0000000030081408] = 00000000, %l6 = 00000000955a90b6
	ldstuba	[%i2+%o4]0x81,%l6	! %l6 = 00000000000000ff
!	%l4 = 000000007e00364a, Mem[0000000010101428] = 14cceb31, %asi = 80
	stha	%l4,[%i4+0x028]%asi	! Mem[0000000010101428] = 364aeb31
!	%l3 = 0000000024b3ffff, Mem[0000000010081410] = 000000ff
	stba	%l3,[%i2+%o5]0x80	! Mem[0000000010081410] = ff0000ff
!	%f25 = b6905a95, %f16 = 11000000, %f30 = a87e701b
	fsubs	%f25,%f16,%f30		! %f30 = b6905a95
!	Starting 10 instruction Load Burst
!	Mem[000000001010142c] = 565cff11, %l3 = 0000000024b3ffff
	lduh	[%i4+0x02e],%l3		! %l3 = 000000000000ff11

p0_label_81:
!	Mem[00000000100c1408] = ffffffff, %f24 = f88c0000
	lda	[%i3+%o4]0x80,%f24	! %f24 = ffffffff
!	Mem[00000000211c0000] = 0000cd80, %l4 = 000000007e00364a
	ldsha	[%o2+0x000]%asi,%l4	! %l4 = 0000000000000000
!	Mem[0000000030141408] = 1fffa7c5, %l7 = 00000000000000a8
	lduwa	[%i5+%o4]0x81,%l7	! %l7 = 000000001fffa7c5
!	Mem[0000000030001408] = 8631b339, %l2 = 0000000000000000
	lduwa	[%i0+%o4]0x89,%l2	! %l2 = 000000008631b339
!	Mem[00000000300c1400] = f8608991, %l6 = 0000000000000000
	lduba	[%i3+%g0]0x81,%l6	! %l6 = 00000000000000f8
!	Mem[0000000030181400] = a85a9ad67e00364a, %l3 = 000000000000ff11
	ldxa	[%i6+%g0]0x89,%l3	! %l3 = a85a9ad67e00364a
!	Mem[0000000010001408] = ffff1b86, %f19 = c5a7ffff
	lda	[%i0+%o4]0x88,%f19	! %f19 = ffff1b86
	membar	#Sync			! Added by membar checker (11)
!	Mem[0000000030081400] = 001bffff 056fad8c ff000000 1b707ea8
!	Mem[0000000030081410] = a87e701b 00000000 292b4497 1397f6b8
!	Mem[0000000030081420] = 07a18675 dfdee334 d36c6a49 7e160ac2
!	Mem[0000000030081430] = 0bfb2090 0607379a f90f993c eb694872
	ldda	[%i2]ASI_BLK_AIUSL,%f0	! Block Load from 0000000030081400
!	Mem[0000000010081408] = ffad6f05, %l1 = 0000000000000000
	ldswa	[%i2+%o4]0x80,%l1	! %l1 = ffffffffffad6f05
!	Starting 10 instruction Store Burst
!	Mem[0000000030041410] = 061ac655, %l2 = 000000008631b339
	swapa	[%i1+%o5]0x89,%l2	! %l2 = 00000000061ac655

p0_label_82:
!	Mem[0000000010181408] = c5a7ffff, %l1 = ffffffffffad6f05
	ldstuba	[%i6+%o4]0x80,%l1	! %l1 = 000000c5000000ff
!	%f22 = 0e10791f 0000002a, %l4 = 0000000000000000
!	Mem[0000000010081438] = 061ac6ffd69a5aa8
	add	%i2,0x038,%g1
	stda	%f22,[%g1+%l4]ASI_PST32_P ! Mem[0000000010081438] = 061ac6ffd69a5aa8
!	%l2 = 00000000061ac655, Mem[0000000030181410] = ff000000
	stba	%l2,[%i6+%o5]0x81	! Mem[0000000030181410] = 55000000
!	%f26 = 0f4f9d1d 061ac655, %l7 = 000000001fffa7c5
!	Mem[0000000030001430] = e2c0ba42135a44a3
	add	%i0,0x030,%g1
	stda	%f26,[%g1+%l7]ASI_PST16_S ! Mem[0000000030001430] = e2c09d1d135ac655
!	Mem[0000000010001434] = 98db82eb, %l1 = 00000000000000c5
	ldstub	[%i0+0x034],%l1		! %l1 = 00000098000000ff
!	Mem[0000000030001400] = 00000038, %l0 = ffffffffff000000
	swapa	[%i0+%g0]0x89,%l0	! %l0 = 0000000000000038
!	%f20 = 1f79e2ec 02e100ff, Mem[0000000010181408] = ffa7ffff 00000000
	stda	%f20,[%i6+%o4]0x80	! Mem[0000000010181408] = 1f79e2ec 02e100ff
!	%l5 = 00000000ff000000, Mem[0000000030041408] = ee6000ffff000000
	stxa	%l5,[%i1+%o4]0x89	! Mem[0000000030041408] = 00000000ff000000
!	Mem[0000000010041418] = c77babee000000ff, %l0 = 0000000000000038, %l6 = 00000000000000f8
	add	%i1,0x18,%g1
	casxa	[%g1]0x80,%l0,%l6	! %l6 = c77babee000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000020800040] = fffffa54, %l5 = 00000000ff000000
	lduba	[%o1+0x041]%asi,%l5	! %l5 = 00000000000000ff

p0_label_83:
!	Mem[0000000010141400] = cc2affff, %l6 = c77babee000000ff
	ldsba	[%i5+%g0]0x88,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000030101400] = 11000000, %l6 = ffffffffffffffff
	lduba	[%i4+%g0]0x81,%l6	! %l6 = 0000000000000011
!	Mem[0000000030141410] = ece2791f, %f23 = 0000002a
	lda	[%i5+%o5]0x89,%f23	! %f23 = ece2791f
!	Mem[0000000020800000] = ffffa5fa, %l1 = 0000000000000098
	lduha	[%o1+0x000]%asi,%l1	! %l1 = 000000000000ffff
!	Mem[0000000030081410] = a87e701b 00000000, %l2 = 061ac655, %l3 = 7e00364a
	ldda	[%i2+%o5]0x81,%l2	! %l2 = 00000000a87e701b 0000000000000000
!	%l1 = 000000000000ffff, %l0 = 0000000000000038, %l4 = 0000000000000000
	addc	%l1,%l0,%l4		! %l4 = 0000000000010037
!	Mem[00000000100c1408] = ffffffff, %l0 = 0000000000000038
	lduba	[%i3+%o4]0x80,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010001410] = ffa7ffff, %l0 = 00000000000000ff
	lduwa	[%i0+%o5]0x80,%l0	! %l0 = 00000000ffa7ffff
!	Mem[0000000010041408] = ff000000, %l6 = 0000000000000011
	lduba	[%i1+%o4]0x80,%l6	! %l6 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l5 = 00000000000000ff, Mem[0000000010141400] = cc2affff
	stwa	%l5,[%i5+%g0]0x88	! Mem[0000000010141400] = 000000ff

p0_label_84:
!	%l4 = 00010037, %l5 = 000000ff, Mem[0000000010181400] = b311e8a4 a85a9ad6
	stda	%l4,[%i6+%g0]0x88	! Mem[0000000010181400] = 00010037 000000ff
!	Mem[0000000010141410] = f84f9d1d, %l3 = 0000000000000000
	swapa	[%i5+%o5]0x80,%l3	! %l3 = 00000000f84f9d1d
!	%l4 = 00010037, %l5 = 000000ff, Mem[0000000010141410] = 00000000 0000007e
	stda	%l4,[%i5+%o5]0x80	! Mem[0000000010141410] = 00010037 000000ff
!	Mem[0000000010041410] = d69a5aa8, %l4 = 0000000000010037
	swapa	[%i1+%o5]0x80,%l4	! %l4 = 00000000d69a5aa8
!	%l0 = 00000000ffa7ffff, Mem[00000000300c1408] = ff8e0000
	stha	%l0,[%i3+%o4]0x81	! Mem[00000000300c1408] = ffff0000
!	%l6 = 00000000000000ff, Mem[0000000010101400] = ff00e1026e5ffff9
	stxa	%l6,[%i4+%g0]0x88	! Mem[0000000010101400] = 00000000000000ff
!	Mem[0000000030101410] = ffc61a06, %l4 = 00000000d69a5aa8
	swapa	[%i4+%o5]0x81,%l4	! %l4 = 00000000ffc61a06
!	Mem[0000000030141410] = 1f79e2ec, %l3 = 00000000f84f9d1d
	ldstuba	[%i5+%o5]0x81,%l3	! %l3 = 0000001f000000ff
!	Code Fragment 4
p0_fragment_11:
!	%l0 = 00000000ffa7ffff
	setx	0x289cf4e0110504e2,%g7,%l0 ! %l0 = 289cf4e0110504e2
!	%l1 = 000000000000ffff
	setx	0xa666b58ff3cdc647,%g7,%l1 ! %l1 = a666b58ff3cdc647
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 289cf4e0110504e2
	setx	0x3a2bfda80b823ed7,%g7,%l0 ! %l0 = 3a2bfda80b823ed7
!	%l1 = a666b58ff3cdc647
	setx	0x31e162b05bb44fc0,%g7,%l1 ! %l1 = 31e162b05bb44fc0
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = 1fffa7c532b0aa8b, %f8  = 34e3dedf 7586a107
	ldda	[%i5+%o4]0x81,%f8 	! %f8  = 1fffa7c5 32b0aa8b

p0_label_85:
!	Mem[0000000030041410] = 8631b339, %f20 = 1f79e2ec
	lda	[%i1+%o5]0x89,%f20	! %f20 = 8631b339
!	Mem[0000000010181400] = 00010037, %l7 = 000000001fffa7c5
	lduwa	[%i6+%g0]0x88,%l7	! %l7 = 0000000000010037
!	Mem[0000000010101400] = ff00000000000000, %l2 = 00000000a87e701b
	ldxa	[%i4+%g0]0x80,%l2	! %l2 = ff00000000000000
!	Mem[0000000010181408] = ece2791f, %l7 = 0000000000010037
	lduba	[%i6+%o4]0x88,%l7	! %l7 = 000000000000001f
!	Mem[000000001018141c] = 00000ade, %l1 = 31e162b05bb44fc0
	ldsh	[%i6+0x01c],%l1		! %l1 = 0000000000000000
!	Mem[000000001008141c] = 00000ade, %l3 = 000000000000001f
	ldswa	[%i2+0x01c]%asi,%l3	! %l3 = 0000000000000ade
!	%f0  = 8cad6f05, Mem[0000000010181400] = 37000100
	sta	%f0 ,[%i6+%g0]0x80	! Mem[0000000010181400] = 8cad6f05
!	%l6 = 00000000000000ff, immed = 00000576, %y  = 0000045a
	umul	%l6,0x576,%l6		! %l6 = 000000000005708a, %y = 00000000
!	Mem[0000000010041410] = 00010037, %l3 = 0000000000000ade
	lduwa	[%i1+%o5]0x80,%l3	! %l3 = 0000000000010037
!	Starting 10 instruction Store Burst
!	%l2 = ff00000000000000, Mem[0000000010101400] = ff000000
	stba	%l2,[%i4+%g0]0x80	! Mem[0000000010101400] = 00000000

p0_label_86:
!	%l4 = 00000000ffc61a06, Mem[0000000030101410] = d69a5aa8
	stwa	%l4,[%i4+%o5]0x81	! Mem[0000000030101410] = ffc61a06
!	%f0  = 8cad6f05 ffff1b00, %l0 = 3a2bfda80b823ed7
!	Mem[0000000030141400] = a87e701bb8213b3c
	stda	%f0,[%i5+%l0]ASI_PST16_SL ! Mem[0000000030141400] = 001bffff056f3b3c
!	Code Fragment 3
p0_fragment_12:
!	%l0 = 3a2bfda80b823ed7
	setx	0x839f6c67d363b9c1,%g7,%l0 ! %l0 = 839f6c67d363b9c1
!	%l1 = 0000000000000000
	setx	0xe93740b7988bd51c,%g7,%l1 ! %l1 = e93740b7988bd51c
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 839f6c67d363b9c1
	setx	0x3c93c1c7f19cf3bf,%g7,%l0 ! %l0 = 3c93c1c7f19cf3bf
!	%l1 = e93740b7988bd51c
	setx	0xe56bdd5fee5b7716,%g7,%l1 ! %l1 = e56bdd5fee5b7716
!	%l0 = 3c93c1c7f19cf3bf, Mem[0000000010141408] = 0000000002e100ff
	stxa	%l0,[%i5+%o4]0x80	! Mem[0000000010141408] = 3c93c1c7f19cf3bf
!	%l3 = 0000000000010037, Mem[0000000010041410] = 37000100
	stba	%l3,[%i1+%o5]0x88	! Mem[0000000010041410] = 37000137
!	Mem[0000000010041407] = 9a847a4b, %l3 = 0000000000010037
	ldstub	[%i1+0x007],%l3		! %l3 = 0000004b000000ff
!	%f16 = 11000000 00000000 8baab032 ffff1b86
!	%f20 = 8631b339 02e100ff 0e10791f ece2791f
!	%f24 = ffffffff b6905a95 0f4f9d1d 061ac655
!	%f28 = 309a0cf5 98b3f8ff b6905a95 061ac655
	stda	%f16,[%i6]ASI_BLK_SL	! Block Store to 0000000030181400
!	%l2 = ff00000000000000, Mem[0000000030041408] = 000000ff
	stba	%l2,[%i1+%o4]0x81	! Mem[0000000030041408] = 000000ff
!	%l1 = e56bdd5fee5b7716, Mem[0000000010181410] = ffffffffff0000ff
	stxa	%l1,[%i6+%o5]0x88	! Mem[0000000010181410] = e56bdd5fee5b7716
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = 00000000, %f15 = 3c990ff9
	lda	[%i4+%g0]0x88,%f15	! %f15 = 00000000

p0_label_87:
	membar	#Sync			! Added by membar checker (12)
!	Mem[0000000030181400] = 00000000, %l1 = e56bdd5fee5b7716
	lduha	[%i6+%g0]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000010041428] = 3ec2b76bffa7ffff, %f26 = 0f4f9d1d 061ac655
	ldda	[%i1+0x028]%asi,%f26	! %f26 = 3ec2b76b ffa7ffff
!	%f20 = 8631b339, %f25 = b6905a95
	fcmps	%fcc1,%f20,%f25		! %fcc1 = 2
!	Mem[0000000030001400] = 000000ff, %l0 = 3c93c1c7f19cf3bf
	lduwa	[%i0+%g0]0x81,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010181400] = 056fad8c, %l6 = 000000000005708a
	ldsba	[%i6+%g0]0x88,%l6	! %l6 = ffffffffffffff8c
!	Mem[0000000010141410] = 00010037, %l3 = 000000000000004b
	lduba	[%i5+%o5]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000010101408] = 9d199940, %l7 = 000000000000001f
	ldsba	[%i4+%o4]0x88,%l7	! %l7 = 0000000000000040
!	Mem[0000000010041400] = ff7a849a 955a90b6, %l6 = ffffff8c, %l7 = 00000040
	ldda	[%i1+%g0]0x88,%l6	! %l6 = 00000000955a90b6 00000000ff7a849a
!	Mem[0000000010041410] = c8a9abee37000137, %l7 = 00000000ff7a849a
	ldxa	[%i1+%o5]0x88,%l7	! %l7 = c8a9abee37000137
!	Starting 10 instruction Store Burst
!	Mem[0000000010001430] = 55c61a06, %l3 = 0000000000000000
	swap	[%i0+0x030],%l3		! %l3 = 0000000055c61a06

p0_label_88:
!	%f8  = 1fffa7c5 32b0aa8b, Mem[0000000010081428] = a87e701b ebe2d1b6
	stda	%f8 ,[%i2+0x028]%asi	! Mem[0000000010081428] = 1fffa7c5 32b0aa8b
!	Mem[0000000010081431] = 7e000000, %l1 = 0000000000000000
	ldstub	[%i2+0x031],%l1		! %l1 = 00000000000000ff
!	Mem[0000000030081408] = 000000ff, %l2 = ff00000000000000
	swapa	[%i2+%o4]0x89,%l2	! %l2 = 00000000000000ff
!	%f12 = 9a370706 9020fb0b, Mem[0000000030141400] = 001bffff 056f3b3c
	stda	%f12,[%i5+%g0]0x81	! Mem[0000000030141400] = 9a370706 9020fb0b
!	Mem[00000000300c1410] = ff8960ee, %l7 = c8a9abee37000137
	swapa	[%i3+%o5]0x81,%l7	! %l7 = 00000000ff8960ee
!	%f8  = 1fffa7c5 32b0aa8b, %l2 = 00000000000000ff
!	Mem[0000000030101430] = 90505644a67a4835
	add	%i4,0x030,%g1
	stda	%f8,[%g1+%l2]ASI_PST8_SL ! Mem[0000000030101430] = 8baab032c5a7ff1f
!	Mem[0000000010081410] = ff0000ff, %l0 = 00000000000000ff
	swapa	[%i2+%o5]0x80,%l0	! %l0 = 00000000ff0000ff
!	%l7 = 00000000ff8960ee, imm = 0000000000000fe7, %l0 = 00000000ff0000ff
	andn	%l7,0xfe7,%l0		! %l0 = 00000000ff896008
!	Mem[0000000030041408] = ff000000, %l4 = 00000000ffc61a06
	swapa	[%i1+%o4]0x89,%l4	! %l4 = 00000000ff000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = b6905a959a847aff, %l3 = 0000000055c61a06
	ldxa	[%i1+0x000]%asi,%l3	! %l3 = b6905a959a847aff

p0_label_89:
!	Mem[0000000030081400] = 001bffff, %l0 = 00000000ff896008
	lduwa	[%i2+%g0]0x81,%l0	! %l0 = 00000000001bffff
!	Mem[0000000010041410] = 37000137, %l5 = 00000000000000ff
	lduha	[%i1+%o5]0x88,%l5	! %l5 = 0000000000000137
!	Mem[0000000010041438] = 0f1547c2, %l1 = 0000000000000000
	lduwa	[%i1+0x038]%asi,%l1	! %l1 = 000000000f1547c2
!	Mem[0000000010101400] = 0000000000000000, %f10 = c20a167e 496a6cd3
	ldda	[%i4+%g0]0x88,%f10	! %f10 = 00000000 00000000
!	Mem[0000000010101410] = f8540000, %l4 = 00000000ff000000
	ldsha	[%i4+%o5]0x80,%l4	! %l4 = fffffffffffff854
!	Mem[0000000030001400] = ff000000, %l0 = 00000000001bffff
	lduha	[%i0+%g0]0x89,%l0	! %l0 = 0000000000000000
!	%l3 = b6905a959a847aff, imm = fffffffffffffa77, %l4 = fffffffffffff854
	and	%l3,-0x589,%l4		! %l4 = b6905a959a847a77
!	Mem[0000000010101408] = 9d199940, %l4 = b6905a959a847a77
	lduba	[%i4+%o4]0x88,%l4	! %l4 = 0000000000000040
!	Mem[00000000100c1418] = d5edeaba, %l4 = 0000000000000040
	lduwa	[%i3+0x018]%asi,%l4	! %l4 = 00000000d5edeaba
!	Starting 10 instruction Store Burst
!	%f19 = ffff1b86, Mem[0000000030041410] = 39b33186
	sta	%f19,[%i1+%o5]0x81	! Mem[0000000030041410] = ffff1b86

p0_label_90:
!	Mem[0000000010181408] = ece2791f, %l2 = 00000000000000ff
	ldstuba	[%i6+%o4]0x88,%l2	! %l2 = 0000001f000000ff
!	%l3 = b6905a959a847aff, Mem[0000000030081410] = a87e701b
	stha	%l3,[%i2+%o5]0x81	! Mem[0000000030081410] = 7aff701b
!	%l2 = 000000000000001f, Mem[0000000010001410] = ffa7ffff32b0aa8b
	stxa	%l2,[%i0+%o5]0x80	! Mem[0000000010001410] = 000000000000001f
!	Mem[0000000010001421] = 000000fb, %l5 = 0000000000000137
	ldstub	[%i0+0x021],%l5		! %l5 = 00000000000000ff
!	%l6 = 00000000955a90b6, Mem[0000000030081408] = 00000000
	stba	%l6,[%i2+%o4]0x89	! Mem[0000000030081408] = 000000b6
!	%f0  = 8cad6f05 ffff1b00 a87e701b 000000ff
!	%f4  = 00000000 1b707ea8 b8f69713 97442b29
!	%f8  = 1fffa7c5 32b0aa8b 00000000 00000000
!	%f12 = 9a370706 9020fb0b 724869eb 00000000
	stda	%f0,[%i4]ASI_BLK_P	! Block Store to 0000000010101400
!	Mem[0000000010081417] = ffffffff, %l0 = 0000000000000000
	ldstub	[%i2+0x017],%l0		! %l0 = 000000ff000000ff
!	%l6 = 955a90b6, %l7 = ff8960ee, Mem[0000000010041400] = b6905a95 9a847aff
	stda	%l6,[%i1+0x000]%asi	! Mem[0000000010041400] = 955a90b6 ff8960ee
!	%l0 = 00000000000000ff, Mem[0000000010081410] = 000000ff
	stwa	%l0,[%i2+%o5]0x80	! Mem[0000000010081410] = 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001420] = 00ff00fb, %l0 = 00000000000000ff
	lduwa	[%i0+0x020]%asi,%l0	! %l0 = 0000000000ff00fb

p0_label_91:
!	Mem[0000000030141410] = ece279ff, %l6 = 00000000955a90b6
	ldsba	[%i5+%o5]0x89,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000030101408] = 63629133 ff1bffff, %l6 = ffffffff, %l7 = ff8960ee
	ldda	[%i4+%o4]0x81,%l6	! %l6 = 0000000063629133 00000000ff1bffff
!	Mem[0000000021800080] = 26678dc3, %l6 = 0000000063629133
	ldsh	[%o3+0x080],%l6		! %l6 = 0000000000002667
!	%l1 = 000000000f1547c2, immed = 000004d6, %y  = 00000000
	umul	%l1,0x4d6,%l5		! %l5 = 00000048f0e9042c, %y = 00000048
!	Mem[0000000021800040] = 0000c8f1, %l3 = b6905a959a847aff
	lduba	[%o3+0x041]%asi,%l3	! %l3 = 0000000000000000
!	Mem[0000000030041408] = 061ac6ff 00000000, %l2 = 0000001f, %l3 = 00000000
	ldda	[%i1+%o4]0x81,%l2	! %l2 = 00000000061ac6ff 0000000000000000
!	Mem[0000000010001410] = 00000000, %l6 = 0000000000002667
	lduwa	[%i0+%o5]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000021800180] = c360f854, %l7 = 00000000ff1bffff
	ldsba	[%o3+0x181]%asi,%l7	! %l7 = 0000000000000060
!	Mem[0000000010001408] = ffff1b86, %l5 = 00000048f0e9042c
	lduha	[%i0+%o4]0x88,%l5	! %l5 = 0000000000001b86
!	Starting 10 instruction Store Burst
!	%l6 = 00000000, %l7 = 00000060, Mem[0000000010141418] = 11da2acc f04e0fec
	stda	%l6,[%i5+0x018]%asi	! Mem[0000000010141418] = 00000000 00000060

p0_label_92:
!	%l4 = 00000000d5edeaba, Mem[0000000030101408] = 33916263
	stwa	%l4,[%i4+%o4]0x89	! Mem[0000000030101408] = d5edeaba
!	%l0 = 0000000000ff00fb, Mem[00000000201c0000] = ff945a4a, %asi = 80
	stha	%l0,[%o0+0x000]%asi	! Mem[00000000201c0000] = 00fb5a4a
!	%l5 = 0000000000001b86, Mem[0000000030001408] = 8631b339
	stwa	%l5,[%i0+%o4]0x89	! Mem[0000000030001408] = 00001b86
!	%l2 = 00000000061ac6ff, Mem[0000000030001408] = 2a00000000001b86
	stxa	%l2,[%i0+%o4]0x89	! Mem[0000000030001408] = 00000000061ac6ff
!	%l0 = 0000000000ff00fb, immed = fffff2a1, %y  = 00000048
	sdiv	%l0,-0xd5f,%l5		! %l5 = fffffffffa9d6df1
	mov	%l0,%y			! %y = 00ff00fb
!	Mem[0000000030181400] = 00000000, %l7 = 0000000000000060
	ldstuba	[%i6+%g0]0x81,%l7	! %l7 = 00000000000000ff
!	%l6 = 0000000000000000, Mem[0000000020800040] = fffffa54, %asi = 80
	stha	%l6,[%o1+0x040]%asi	! Mem[0000000020800040] = 0000fa54
!	%l2 = 00000000061ac6ff, Mem[0000000030001400] = 000000ff
	stha	%l2,[%i0+%g0]0x81	! Mem[0000000030001400] = c6ff00ff
	membar	#Sync			! Added by membar checker (13)
!	Mem[0000000010101408] = 1b707ea8, %l3 = 0000000000000000
	ldstuba	[%i4+%o4]0x88,%l3	! %l3 = 000000a8000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = ff00000037000100, %l4 = 00000000d5edeaba
	ldxa	[%i5+%o5]0x88,%l4	! %l4 = ff00000037000100

p0_label_93:
!	Mem[0000000010041410] = 37010037, %l3 = 00000000000000a8
	lduba	[%i1+%o5]0x80,%l3	! %l3 = 0000000000000037
!	Mem[0000000030001410] = 63629133, %l0 = 0000000000ff00fb
	lduha	[%i0+%o5]0x81,%l0	! %l0 = 0000000000006362
!	Mem[0000000030141400] = 9a370706 9020fb0b 1fffa7c5 32b0aa8b
!	Mem[0000000030141410] = ff79e2ec 0c099c75 c3b425e0 64c40c3a
!	Mem[0000000030141420] = 32a75c28 447250aa ce685179 4a278aa9
!	Mem[0000000030141430] = 8297fbde 0b1c89f2 7cc7a6d8 9dbe4aa1
	ldda	[%i5]ASI_BLK_S,%f16	! Block Load from 0000000030141400
!	Mem[0000000010081414] = ffffffff, %l0 = 0000000000006362
	lduba	[%i2+0x015]%asi,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010141400] = ff000000f04ed1c6, %f10 = 00000000 00000000
	ldda	[%i5+%g0]0x80,%f10	! %f10 = ff000000 f04ed1c6
!	Mem[0000000010141410] = 37000100, %l1 = 000000000f1547c2
	ldsba	[%i5+%o5]0x88,%l1	! %l1 = 0000000000000000
!	Mem[00000000100c1400] = 4a36007e, %l3 = 0000000000000037
	ldsha	[%i3+%g0]0x88,%l3	! %l3 = 000000000000007e
!	Mem[0000000010001410] = 00000000, %l7 = 0000000000000000
	ldswa	[%i0+%o5]0x88,%l7	! %l7 = 0000000000000000
!	Mem[00000000100c1410] = 4b7a849a, %l6 = 0000000000000000
	lduba	[%i3+%o5]0x80,%l6	! %l6 = 000000000000004b
!	Starting 10 instruction Store Burst
!	Mem[0000000010001413] = 00000000, %l4 = ff00000037000100
	ldstub	[%i0+0x013],%l4		! %l4 = 00000000000000ff

p0_label_94:
!	Mem[0000000010001400] = 000000ff, %l6 = 000000000000004b
	swapa	[%i0+%g0]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030041408] = 061ac6ff, %l6 = 00000000000000ff
	ldstuba	[%i1+%o4]0x81,%l6	! %l6 = 00000006000000ff
!	%f6  = b8f69713 97442b29, Mem[0000000030081400] = 001bffff 056fad8c
	stda	%f6 ,[%i2+%g0]0x81	! Mem[0000000030081400] = b8f69713 97442b29
!	Mem[0000000030001410] = 33916263, %l0 = 00000000000000ff
	ldstuba	[%i0+%o5]0x89,%l0	! %l0 = 00000063000000ff
!	%f4  = 00000000, %f7  = 97442b29, %f0  = 8cad6f05
	fdivs	%f4 ,%f7 ,%f0 		! %f0  = 80000000
!	Mem[0000000030141408] = 1fffa7c5, %l6 = 0000000000000006
	swapa	[%i5+%o4]0x81,%l6	! %l6 = 000000001fffa7c5
!	%l1 = 0000000000000000, Mem[0000000010081410] = ffffffffff000000
	stxa	%l1,[%i2+%o5]0x88	! Mem[0000000010081410] = 0000000000000000
!	Mem[0000000030181410] = ff00e102, %l4 = 0000000000000000
	ldstuba	[%i6+%o5]0x81,%l4	! %l4 = 000000ff000000ff
!	Mem[0000000030141408] = 00000006, %l2 = 00000000061ac6ff
	swapa	[%i5+%o4]0x81,%l2	! %l2 = 0000000000000006
!	Starting 10 instruction Load Burst
!	Mem[0000000010101414] = 1b707ea8, %l3 = 000000000000007e
	lduba	[%i4+0x016]%asi,%l3	! %l3 = 000000000000007e

p0_label_95:
!	Mem[00000000100c1408] = ffffffff, %f8  = 1fffa7c5
	lda	[%i3+%o4]0x88,%f8 	! %f8 = ffffffff
!	Mem[0000000021800100] = b4ffaf61, %l0 = 0000000000000063
	lduba	[%o3+0x100]%asi,%l0	! %l0 = 00000000000000b4
!	Mem[0000000030181408] = 8baab032 ffff1b86, %l4 = 000000ff, %l5 = fa9d6df1
	ldda	[%i6+%o4]0x89,%l4	! %l4 = 00000000ffff1b86 000000008baab032
!	%l7 = 0000000000000000, %l2 = 0000000000000006, %y  = 00ff00fb
	sdiv	%l7,%l2,%l4		! %l4 = 000000007fffffff
	mov	%l0,%y			! %y = 000000b4
!	Mem[000000001008140c] = f8608991, %l6 = 000000001fffa7c5
	lduba	[%i2+0x00f]%asi,%l6	! %l6 = 0000000000000091
!	Mem[0000000010141408] = 3c93c1c7, %l7 = 0000000000000000
	ldsba	[%i5+%o4]0x80,%l7	! %l7 = 000000000000003c
!	Mem[00000000100c1400] = 7e00364a, %f6  = b8f69713
	lda	[%i3+%g0]0x80,%f6 	! %f6 = 7e00364a
!	Mem[0000000030081410] = 1b70ff7a, %l2 = 0000000000000006
	ldswa	[%i2+%o5]0x89,%l2	! %l2 = 000000001b70ff7a
!	Mem[0000000010041410] = c8a9abee 37000137, %l6 = 00000091, %l7 = 0000003c
	ldda	[%i1+%o5]0x88,%l6	! %l6 = 0000000037000137 00000000c8a9abee
!	Starting 10 instruction Store Burst
!	%l2 = 000000001b70ff7a, imm = fffffffffffff7db, %l5 = 000000008baab032
	addc	%l2,-0x825,%l5		! %l5 = 000000001b70f755

p0_label_96:
!	%l7 = 00000000c8a9abee, Mem[0000000010101408] = 1b707eff
	stha	%l7,[%i4+%o4]0x88	! Mem[0000000010101408] = 1b70abee
!	Mem[0000000030081408] = b6000000, %l7 = 00000000c8a9abee
	ldstuba	[%i2+%o4]0x81,%l7	! %l7 = 000000b6000000ff
!	%l0 = 00000000000000b4, Mem[0000000010041436] = ffffc19a
	sth	%l0,[%i1+0x036]		! Mem[0000000010041434] = ffff00b4
	membar	#Sync			! Added by membar checker (14)
!	%l3 = 000000000000007e, Mem[0000000030141400] = 9a3707069020fb0b
	stxa	%l3,[%i5+%g0]0x81	! Mem[0000000030141400] = 000000000000007e
!	Mem[0000000010141408] = 3c93c1c7, %l1 = 0000000000000000
	ldstuba	[%i5+%o4]0x80,%l1	! %l1 = 0000003c000000ff
!	Mem[0000000030041408] = ffc61aff, %l2 = 000000001b70ff7a
	ldstuba	[%i1+%o4]0x89,%l2	! %l2 = 000000ff000000ff
!	Mem[0000000010181400] = 8cad6f05, %l2 = 00000000000000ff
	ldstuba	[%i6+%g0]0x80,%l2	! %l2 = 0000008c000000ff
!	%l2 = 000000000000008c, Mem[0000000010081400] = 7fcdab61
	stha	%l2,[%i2+%g0]0x88	! Mem[0000000010081400] = 7fcd008c
!	Mem[00000000300c1410] = 37000137, %l5 = 000000001b70f755
	swapa	[%i3+%o5]0x81,%l5	! %l5 = 0000000037000137
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = ffffffff9a847a4b, %f30 = 7cc7a6d8 9dbe4aa1
	ldda	[%i3+%o5]0x88,%f30	! %f30 = ffffffff 9a847a4b

p0_label_97:
!	Mem[00000000300c1400] = f8608991, %l0 = 00000000000000b4
	ldswa	[%i3+%g0]0x81,%l0	! %l0 = fffffffff8608991
!	Mem[0000000010041434] = ffff00b4, %f17 = 9020fb0b
	ld	[%i1+0x034],%f17	! %f17 = ffff00b4
!	Mem[00000000100c140c] = 000000ff, %l7 = 00000000000000b6
	ldsh	[%i3+0x00c],%l7		! %l7 = 0000000000000000
!	Mem[0000000010041408] = ff000000, %l2 = 000000000000008c
	ldswa	[%i1+%o4]0x80,%l2	! %l2 = ffffffffff000000
!	Mem[0000000010181400] = ffad6f05, %l1 = 000000000000003c
	lduwa	[%i6+0x000]%asi,%l1	! %l1 = 00000000ffad6f05
!	Mem[00000000201c0000] = 00fb5a4a, %l3 = 000000000000007e
	ldsb	[%o0+0x001],%l3		! %l3 = fffffffffffffffb
!	Mem[0000000030141410] = ff79e2ec, %l4 = 000000007fffffff
	lduba	[%i5+%o5]0x81,%l4	! %l4 = 00000000000000ff
!	Mem[00000000100c1428] = 86842aa8, %l3 = fffffffffffffffb
	lduba	[%i3+0x029]%asi,%l3	! %l3 = 0000000000000084
!	Mem[0000000010041410] = 37010037, %l7 = 0000000000000000
	ldsba	[%i1+%o5]0x80,%l7	! %l7 = 0000000000000037
!	Starting 10 instruction Store Burst
!	%l6 = 0000000037000137, Mem[0000000010041410] = 37000137
	stha	%l6,[%i1+%o5]0x88	! Mem[0000000010041410] = 37000137

p0_label_98:
!	Mem[0000000010001410] = 000000ff, %l2 = ffffffffff000000
	swapa	[%i0+%o5]0x80,%l2	! %l2 = 00000000000000ff
!	%l3 = 0000000000000084, Mem[00000000100c1410] = 4b7a849affffffff
	stx	%l3,[%i3+%o5]		! Mem[00000000100c1410] = 0000000000000084
!	%l6 = 0000000037000137, Mem[0000000030181410] = 02e100ff
	stba	%l6,[%i6+%o5]0x89	! Mem[0000000030181410] = 02e10037
!	%l4 = 00000000000000ff, Mem[000000001000141c] = 0000002a
	stb	%l4,[%i0+0x01c]		! Mem[000000001000141c] = ff00002a
!	Mem[0000000030141410] = ece279ff, %l6 = 0000000037000137
	ldstuba	[%i5+%o5]0x89,%l6	! %l6 = 000000ff000000ff
!	%l4 = 000000ff, %l5 = 37000137, Mem[0000000030081408] = ff000000 1b707ea8
	stda	%l4,[%i2+%o4]0x81	! Mem[0000000030081408] = 000000ff 37000137
!	%f30 = ffffffff, Mem[0000000030101400] = 00000011
	sta	%f30,[%i4+%g0]0x89	! Mem[0000000030101400] = ffffffff
!	%l0 = fffffffff8608991, Mem[0000000010141410] = 37000100
	stha	%l0,[%i5+%o5]0x88	! Mem[0000000010141410] = 37008991
!	Mem[0000000010041428] = 3ec2b76b, %l3 = 0000000000000084, %asi = 80
	swapa	[%i1+0x028]%asi,%l3	! %l3 = 000000003ec2b76b
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = 001bffff 056fad8c, %l6 = 000000ff, %l7 = 00000037
	ldda	[%i4+%g0]0x88,%l6	! %l6 = 00000000056fad8c 00000000001bffff

p0_label_99:
!	Mem[0000000010141400] = 000000ff, %l5 = 0000000037000137
	ldswa	[%i5+%g0]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030181400] = ff000000, %l0 = fffffffff8608991
	lduha	[%i6+%g0]0x81,%l0	! %l0 = 000000000000ff00
!	Mem[0000000030101400] = 00000000ffffffff, %l4 = 00000000000000ff
	ldxa	[%i4+%g0]0x89,%l4	! %l4 = 00000000ffffffff
!	Mem[0000000030001400] = ff00ffc6, %l4 = 00000000ffffffff
	lduha	[%i0+%g0]0x89,%l4	! %l4 = 000000000000ffc6
!	Mem[0000000010001420] = 00ff00fb, %l7 = 00000000001bffff
	lduw	[%i0+0x020],%l7		! %l7 = 0000000000ff00fb
!	%l6 = 00000000056fad8c, %l6 = 00000000056fad8c, %l3 = 000000003ec2b76b
	andn	%l6,%l6,%l3		! %l3 = 0000000000000000
!	%f31 = 9a847a4b, %f24 = 32a75c28
	fcmps	%fcc3,%f31,%f24		! %fcc3 = 1
!	Mem[0000000010141410] = 37008991, %l2 = 00000000000000ff
	ldswa	[%i5+%o5]0x88,%l2	! %l2 = 0000000037008991
!	Mem[0000000030181410] = 02e10037, %l2 = 0000000037008991
	ldsba	[%i6+%o5]0x89,%l2	! %l2 = 0000000000000037
!	Starting 10 instruction Store Burst
!	Mem[0000000010041400] = b6905a95, %l6 = 00000000056fad8c
	ldstuba	[%i1+%g0]0x88,%l6	! %l6 = 00000095000000ff

p0_label_100:
!	%f0  = 80000000 ffff1b00 a87e701b 000000ff
!	%f4  = 00000000 1b707ea8 7e00364a 97442b29
!	%f8  = ffffffff 32b0aa8b ff000000 f04ed1c6
!	%f12 = 9a370706 9020fb0b 724869eb 00000000
	stda	%f0,[%i6]ASI_COMMIT_P	! Block Store to 0000000010181400
!	%f16 = 9a370706 ffff00b4, Mem[0000000030081410] = 7aff701b 00000000
	stda	%f16,[%i2+%o5]0x81	! Mem[0000000030081410] = 9a370706 ffff00b4
!	Mem[0000000021800040] = 0000c8f1, %l3 = 0000000000000000
	ldstub	[%o3+0x040],%l3		! %l3 = 00000000000000ff
	membar	#Sync			! Added by membar checker (15)
!	Mem[0000000010181410] = a87e701b 00000000, %l6 = 00000095, %l7 = 00ff00fb
	ldda	[%i6+%o5]0x88,%l6	! %l6 = 0000000000000000 00000000a87e701b
!	%l2 = 0000000000000037, Mem[00000000100c1410] = 00000000
	stba	%l2,[%i3+%o5]0x80	! Mem[00000000100c1410] = 37000000
!	%l3 = 0000000000000000, Mem[0000000030081408] = ff000000
	stba	%l3,[%i2+%o4]0x89	! Mem[0000000030081408] = ff000000
!	%f12 = 9a370706, Mem[0000000010001408] = ffff1b86
	sta	%f12,[%i0+%o4]0x88	! Mem[0000000010001408] = 9a370706
!	%l2 = 0000000000000037, %l5 = 00000000000000ff, %l2  = 0000000000000037
	mulx	%l2,%l5,%l2		! %l2 = 00000000000036c9
!	Mem[0000000030101410] = 061ac6ff, %l6 = 0000000000000000
	ldstuba	[%i4+%o5]0x89,%l6	! %l6 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = 061ac6ff, %l5 = 00000000000000ff
	lduba	[%i0+%o4]0x89,%l5	! %l5 = 00000000000000ff

p0_label_101:
!	Mem[0000000030181410] = 3700e10239b33186, %l2 = 00000000000036c9
	ldxa	[%i6+%o5]0x81,%l2	! %l2 = 3700e10239b33186
!	Mem[0000000010001400] = 462ed77b 0000004b, %l0 = 0000ff00, %l1 = ffad6f05
	ldda	[%i0+%g0]0x88,%l0	! %l0 = 000000000000004b 00000000462ed77b
!	Mem[00000000300c1408] = 0000ffff, %l2 = 3700e10239b33186
	ldsha	[%i3+%o4]0x89,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000030001408] = 061ac6ff, %l6 = 00000000000000ff
	lduha	[%i0+%o4]0x89,%l6	! %l6 = 000000000000c6ff
!	Mem[0000000010101434] = 9020fb0b, %l7 = 00000000a87e701b
	lduwa	[%i4+0x034]%asi,%l7	! %l7 = 000000009020fb0b
!	Mem[0000000030141400] = 00000000, %l7 = 000000009020fb0b
	ldsha	[%i5+%g0]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000030181408] = 861bffff, %l1 = 00000000462ed77b
	lduwa	[%i6+%o4]0x81,%l1	! %l1 = 00000000861bffff
!	Mem[0000000010081400] = 7fcd008c, %l0 = 000000000000004b
	ldsha	[%i2+%g0]0x88,%l0	! %l0 = 000000000000008c
!	Mem[0000000020800000] = ffffa5fa, %l3 = 0000000000000000
	ldsh	[%o1+%g0],%l3		! %l3 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l2 = ffffffff, %l3 = ffffffff, Mem[0000000010081400] = 7fcd008c ba6cab9e
	stda	%l2,[%i2+%g0]0x88	! Mem[0000000010081400] = ffffffff ffffffff

p0_label_102:
!	Mem[0000000030001400] = ff00ffc6, %l6 = 000000000000c6ff
	swapa	[%i0+%g0]0x89,%l6	! %l6 = 00000000ff00ffc6
!	Mem[00000000100c1434] = b8120897, %l4 = 000000000000ffc6
	ldstuba	[%i3+0x034]%asi,%l4	! %l4 = 000000b8000000ff
!	Mem[0000000010001400] = 4b000000, %l2 = ffffffffffffffff
	swapa	[%i0+%g0]0x80,%l2	! %l2 = 000000004b000000
!	Mem[0000000030001400] = 0000c6ff, %l4 = 00000000000000b8
	ldstuba	[%i0+%g0]0x89,%l4	! %l4 = 000000ff000000ff
!	%l0 = 000000000000008c, Mem[0000000010181410] = 00000000
	stba	%l0,[%i6+%o5]0x88	! Mem[0000000010181410] = 0000008c
!	%l4 = 00000000000000ff, Mem[00000000100c1412] = 37000000, %asi = 80
	stba	%l4,[%i3+0x012]%asi	! Mem[00000000100c1410] = 3700ff00
!	Mem[0000000010001434] = ffdb82eb, %l4 = 00000000000000ff
	ldstub	[%i0+0x034],%l4		! %l4 = 000000ff000000ff
!	%f10 = ff000000, Mem[0000000010001408] = 9a370706
	sta	%f10,[%i0+%o4]0x88	! Mem[0000000010001408] = ff000000
!	%f20 = ff79e2ec 0c099c75, Mem[0000000010101408] = 1b70abee ff000000
	stda	%f20,[%i4+%o4]0x88	! Mem[0000000010101408] = ff79e2ec 0c099c75
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = 000000001b707ea8, %l2 = 000000004b000000
	ldxa	[%i4+%o5]0x80,%l2	! %l2 = 000000001b707ea8

p0_label_103:
!	Mem[0000000010181410] = 8c000000, %l7 = 0000000000000000
	lduwa	[%i6+%o5]0x80,%l7	! %l7 = 000000008c000000
!	%l6 = 00000000ff00ffc6, immed = fffff5ec, %y  = 000000b4
	umul	%l6,-0xa14,%l1		! %l1 = ff00f5bc09ee4888, %y = ff00f5bc
!	Mem[0000000030101400] = 00000000ffffffff, %l0 = 000000000000008c
	ldxa	[%i4+%g0]0x89,%l0	! %l0 = 00000000ffffffff
!	Mem[0000000030001408] = 061ac6ff, %l6 = 00000000ff00ffc6
	lduha	[%i0+%o4]0x89,%l6	! %l6 = 000000000000c6ff
!	Mem[00000000201c0000] = 00fb5a4a, %l0 = 00000000ffffffff
	ldsb	[%o0+0x001],%l0		! %l0 = fffffffffffffffb
!	Mem[0000000010181400] = 80000000, %l5 = 00000000000000ff
	ldsha	[%i6+%g0]0x80,%l5	! %l5 = ffffffffffff8000
!	Mem[0000000030181410] = 02e10037, %l7 = 000000008c000000
	ldswa	[%i6+%o5]0x89,%l7	! %l7 = 0000000002e10037
!	Mem[0000000010181400] = 001bffff00000080, %l3 = ffffffffffffffff
	ldxa	[%i6+%g0]0x88,%l3	! %l3 = 001bffff00000080
!	Mem[0000000030101410] = 061ac6ff, %l3 = 001bffff00000080
	lduba	[%i4+%o5]0x89,%l3	! %l3 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l2 = 000000001b707ea8, Mem[0000000030141400] = 00000000
	stba	%l2,[%i5+%g0]0x81	! Mem[0000000030141400] = a8000000

p0_label_104:
!	%l6 = 000000000000c6ff, Mem[0000000030181408] = 861bffff
	stha	%l6,[%i6+%o4]0x81	! Mem[0000000030181408] = c6ffffff
!	%l2 = 1b707ea8, %l3 = 000000ff, Mem[0000000010041410] = 37010037 eeaba9c8
	stda	%l2,[%i1+%o5]0x80	! Mem[0000000010041410] = 1b707ea8 000000ff
!	Mem[0000000010081428] = 1fffa7c532b0aa8b, %l7 = 0000000002e10037, %l1 = ff00f5bc09ee4888
	add	%i2,0x28,%g1
	casxa	[%g1]0x80,%l7,%l1	! %l1 = 1fffa7c532b0aa8b
!	Mem[0000000010041410] = 1b707ea8, %l4 = 00000000000000ff
	swapa	[%i1+%o5]0x80,%l4	! %l4 = 000000001b707ea8
!	%f26 = ce685179, Mem[0000000010181400] = 80000000
	sta	%f26,[%i6+%g0]0x80	! Mem[0000000010181400] = ce685179
!	%l6 = 0000c6ff, %l7 = 02e10037, Mem[0000000010081400] = ffffffff ffffffff
	stda	%l6,[%i2+%g0]0x80	! Mem[0000000010081400] = 0000c6ff 02e10037
!	Mem[000000001018143c] = 00000000, %l3 = 00000000000000ff, %asi = 80
	swapa	[%i6+0x03c]%asi,%l3	! %l3 = 0000000000000000
!	%l2 = 000000001b707ea8, %l4 = 000000001b707ea8, %l5 = ffffffffffff8000
	andn	%l2,%l4,%l5		! %l5 = 0000000000000000
!	Mem[0000000030181400] = ff000000, %l0 = fffffffffffffffb
	ldstuba	[%i6+%g0]0x81,%l0	! %l0 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = 3700e102ffc60000, %f28 = 8297fbde 0b1c89f2
	ldda	[%i2+%g0]0x88,%f28	! %f28 = 3700e102 ffc60000

p0_label_105:
!	Mem[0000000030001410] = ff629133 bac772b9, %l0 = 000000ff, %l1 = 32b0aa8b
	ldda	[%i0+%o5]0x81,%l0	! %l0 = 00000000ff629133 00000000bac772b9
!	Mem[0000000010101408] = 759c090c, %l2 = 000000001b707ea8
	lduba	[%i4+%o4]0x80,%l2	! %l2 = 0000000000000075
!	Mem[00000000201c0000] = 00fb5a4a, %l5 = 0000000000000000
	ldsha	[%o0+0x000]%asi,%l5	! %l5 = 00000000000000fb
!	Mem[0000000010141400] = ff000000, %l1 = 00000000bac772b9
	ldsba	[%i5+%g0]0x80,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000030181400] = 000000ff, %l3 = 0000000000000000
	ldsba	[%i6+%g0]0x89,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000030041410] = ffff1b86 1b707ea8, %l6 = 0000c6ff, %l7 = 02e10037
	ldda	[%i1+%o5]0x81,%l6	! %l6 = 00000000ffff1b86 000000001b707ea8
!	Mem[0000000010041410] = ff000000, %l4 = 000000001b707ea8
	ldsba	[%i1+%o5]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000010101410] = 00000000, %f1  = ffff1b00
	lda	[%i4+%o5]0x88,%f1 	! %f1 = 00000000
!	Mem[0000000010081408] = ffad6f05, %l2 = 0000000000000075
	ldswa	[%i2+%o4]0x80,%l2	! %l2 = ffffffffffad6f05
!	Starting 10 instruction Store Burst
!	%l2 = ffffffffffad6f05, Mem[0000000030081408] = ff000000
	stwa	%l2,[%i2+%o4]0x89	! Mem[0000000030081408] = ffad6f05

p0_label_106:
!	Mem[0000000030041410] = 861bffff, %l4 = 0000000000000000
	ldstuba	[%i1+%o5]0x89,%l4	! %l4 = 000000ff000000ff
!	%l4 = 000000ff, %l5 = 000000fb, Mem[0000000010141400] = 000000ff c6d14ef0
	stda	%l4,[%i5+%g0]0x88	! Mem[0000000010141400] = 000000ff 000000fb
!	%l7 = 000000001b707ea8, Mem[0000000010181400] = 795168ce
	stha	%l7,[%i6+%g0]0x88	! Mem[0000000010181400] = 79517ea8
!	%l4 = 000000ff, %l5 = 000000fb, Mem[0000000010181408] = 1b707ea8 ff000000
	stda	%l4,[%i6+%o4]0x88	! Mem[0000000010181408] = 000000ff 000000fb
!	%l3 = ffffffffffffffff, Mem[0000000010141410] = 91890037000000ff
	stxa	%l3,[%i5+%o5]0x80	! Mem[0000000010141410] = ffffffffffffffff
!	%f8  = ffffffff 32b0aa8b, Mem[0000000010041410] = ff000000 ff000000
	stda	%f8 ,[%i1+%o5]0x88	! Mem[0000000010041410] = ffffffff 32b0aa8b
!	%f8  = ffffffff 32b0aa8b, Mem[0000000010181408] = 000000ff 000000fb
	stda	%f8 ,[%i6+%o4]0x88	! Mem[0000000010181408] = ffffffff 32b0aa8b
!	%l7 = 000000001b707ea8, Mem[00000000300c1408] = 000000000000ffff
	stxa	%l7,[%i3+%o4]0x89	! Mem[00000000300c1408] = 000000001b707ea8
!	%l3 = ffffffffffffffff, Mem[0000000010101415] = 1b707ea8
	stb	%l3,[%i4+0x015]		! Mem[0000000010101414] = 1bff7ea8
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = 0000cd80, %l6 = 00000000ffff1b86
	ldsb	[%o2+0x001],%l6		! %l6 = 0000000000000000

p0_label_107:
!	Mem[0000000010041420] = ba6cab9e, %f10 = ff000000
	ld	[%i1+0x020],%f10	! %f10 = ba6cab9e
!	Mem[0000000020800040] = 0000fa54, %l4 = 00000000000000ff
	ldub	[%o1+0x040],%l4		! %l4 = 0000000000000000
!	Mem[00000000300c1400] = f8608991 d3613e5c, %l4 = 00000000, %l5 = 000000fb
	ldda	[%i3+%g0]0x81,%l4	! %l4 = 00000000f8608991 00000000d3613e5c
!	Mem[0000000010041408] = 000000ff, %l7 = 000000001b707ea8
	lduba	[%i1+%o4]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[00000000100c1410] = 00ff0037, %f10 = ba6cab9e
	lda	[%i3+%o5]0x88,%f10	! %f10 = 00ff0037
!	Mem[0000000010101400] = 8cad6f05, %l5 = 00000000d3613e5c
	lduha	[%i4+%g0]0x80,%l5	! %l5 = 0000000000008cad
!	Mem[0000000030041400] = fff8b398, %l1 = ffffffffffffffff
	ldswa	[%i1+%g0]0x81,%l1	! %l1 = fffffffffff8b398
!	Mem[0000000010181400] = a87e5179 ffff1b00, %l0 = ff629133, %l1 = fff8b398
	ldda	[%i6+%g0]0x80,%l0	! %l0 = 00000000a87e5179 00000000ffff1b00
!	Mem[0000000010081420] = 67ce870711000000, %f8  = ffffffff 32b0aa8b
	ldda	[%i2+0x020]%asi,%f8 	! %f8  = 67ce8707 11000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030181408] = c6ffffff, %l1 = 00000000ffff1b00
	ldstuba	[%i6+%o4]0x81,%l1	! %l1 = 000000c6000000ff

p0_label_108:
!	Mem[0000000030081400] = 1397f6b8, %l3 = ffffffffffffffff
	swapa	[%i2+%g0]0x89,%l3	! %l3 = 000000001397f6b8
!	%f20 = ff79e2ec 0c099c75, Mem[0000000010041400] = b6905aff ee6089ff
	stda	%f20,[%i1+%g0]0x88	! Mem[0000000010041400] = ff79e2ec 0c099c75
!	%f22 = c3b425e0 64c40c3a, Mem[0000000030081400] = ffffffff 292b4497
	stda	%f22,[%i2+%g0]0x89	! Mem[0000000030081400] = c3b425e0 64c40c3a
!	Mem[0000000010101410] = 00000000, %l1 = 00000000000000c6
	ldstuba	[%i4+%o5]0x80,%l1	! %l1 = 00000000000000ff
!	%f24 = 32a75c28 447250aa, Mem[00000000300c1410] = 55f7701b 462ed77b
	stda	%f24,[%i3+%o5]0x89	! Mem[00000000300c1410] = 32a75c28 447250aa
!	%l4 = f8608991, %l5 = 00008cad, Mem[0000000010041410] = 32b0aa8b ffffffff
	stda	%l4,[%i1+%o5]0x88	! Mem[0000000010041410] = f8608991 00008cad
!	Mem[0000000010101410] = ff000000, %l2 = ffffffffffad6f05
	swapa	[%i4+%o5]0x80,%l2	! %l2 = 00000000ff000000
!	%l7 = 00000000000000ff, Mem[0000000010181400] = 79517ea8
	stwa	%l7,[%i6+%g0]0x88	! Mem[0000000010181400] = 000000ff
!	%l0 = 00000000a87e5179, Mem[0000000010141400] = 000000fb000000ff
	stxa	%l0,[%i5+%g0]0x88	! Mem[0000000010141400] = 00000000a87e5179
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = 000000ff, %l1 = 0000000000000000
	ldsba	[%i0+%o4]0x80,%l1	! %l1 = 0000000000000000

p0_label_109:
!	Mem[0000000030041408] = ff1ac6ff, %l6 = 0000000000000000
	lduwa	[%i1+%o4]0x81,%l6	! %l6 = 00000000ff1ac6ff
!	Mem[0000000030001408] = 00000000061ac6ff, %f22 = c3b425e0 64c40c3a
	ldda	[%i0+%o4]0x89,%f22	! %f22 = 00000000 061ac6ff
!	Mem[0000000010081430] = 7eff0000a85a9ad6, %f10 = 00ff0037 f04ed1c6
	ldda	[%i2+0x030]%asi,%f10	! %f10 = 7eff0000 a85a9ad6
!	Mem[0000000030001410] = b972c7ba339162ff, %l7 = 00000000000000ff
	ldxa	[%i0+%o5]0x89,%l7	! %l7 = b972c7ba339162ff
!	Mem[0000000010041410] = 918960f8ad8c0000, %f18 = 1fffa7c5 32b0aa8b
	ldd	[%i1+%o5],%f18		! %f18 = 918960f8 ad8c0000
!	Mem[0000000010141428] = 0f4f9d1d, %l7 = b972c7ba339162ff
	ldsw	[%i5+0x028],%l7		! %l7 = 000000000f4f9d1d
!	Mem[0000000010141410] = ffffffff, %l4 = 00000000f8608991
	ldsha	[%i5+%o5]0x88,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010081410] = 0000000000000000, %l0 = 00000000a87e5179
	ldxa	[%i2+%o5]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000010001400] = ffffffff, %l2 = 00000000ff000000
	ldswa	[%i0+%g0]0x88,%l2	! %l2 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%f26 = ce685179 4a278aa9, Mem[0000000030101408] = baeaedd5 ff1bffff
	stda	%f26,[%i4+%o4]0x81	! Mem[0000000030101408] = ce685179 4a278aa9

p0_label_110:
!	%l2 = ffffffffffffffff, Mem[00000000201c0000] = 00fb5a4a
	sth	%l2,[%o0+%g0]		! Mem[00000000201c0000] = ffff5a4a
!	Mem[000000001008143c] = d69a5aa8, %l5 = 0000000000008cad, %asi = 80
	swapa	[%i2+0x03c]%asi,%l5	! %l5 = 00000000d69a5aa8
!	Mem[0000000030141400] = a8000000, %l3 = 000000001397f6b8
	ldstuba	[%i5+%g0]0x81,%l3	! %l3 = 000000a8000000ff
!	%l6 = 00000000ff1ac6ff, Mem[0000000010001410] = ff0000000000001f, %asi = 80
	stxa	%l6,[%i0+0x010]%asi	! Mem[0000000010001410] = 00000000ff1ac6ff
!	%l4 = ffffffffffffffff, Mem[000000001014142a] = 0f4f9d1d
	stb	%l4,[%i5+0x02a]		! Mem[0000000010141428] = 0f4fff1d
!	%l2 = ffffffff, %l3 = 000000a8, Mem[0000000010041410] = 918960f8 ad8c0000
	stda	%l2,[%i1+%o5]0x80	! Mem[0000000010041410] = ffffffff 000000a8
!	Mem[0000000010101408] = 0c099c75, %l5 = 00000000d69a5aa8
	swapa	[%i4+%o4]0x88,%l5	! %l5 = 000000000c099c75
!	%f11 = a85a9ad6, Mem[0000000010101410] = 056fadff
	sta	%f11,[%i4+%o5]0x88	! Mem[0000000010101410] = a85a9ad6
!	%l3 = 00000000000000a8, Mem[0000000030081408] = ffad6f05
	stha	%l3,[%i2+%o4]0x89	! Mem[0000000030081408] = ffad00a8
!	Starting 10 instruction Load Burst
!	Mem[0000000010001418] = 00000094, %l4 = ffffffffffffffff
	lduh	[%i0+0x018],%l4		! %l4 = 0000000000000000

p0_label_111:
!	Mem[0000000010181400] = 001bffff000000ff, %l1 = 0000000000000000
	ldxa	[%i6+%g0]0x88,%l1	! %l1 = 001bffff000000ff
!	%l6 = 00000000ff1ac6ff, %l0 = 0000000000000000, %l2 = ffffffffffffffff
	or	%l6,%l0,%l2		! %l2 = 00000000ff1ac6ff
!	Mem[0000000030041408] = ff1ac6ff00000000, %l3 = 00000000000000a8
	ldxa	[%i1+%o4]0x81,%l3	! %l3 = ff1ac6ff00000000
!	Mem[0000000030001400] = 0000c6ff, %l2 = 00000000ff1ac6ff
	lduba	[%i0+%g0]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010141408] = ff93c1c7, %f3  = 000000ff
	lda	[%i5+%o4]0x80,%f3 	! %f3 = ff93c1c7
!	Mem[00000000100c1410] = 00ff0037, %l3 = ff1ac6ff00000000
	lduba	[%i3+%o5]0x88,%l3	! %l3 = 0000000000000037
!	Mem[0000000030081408] = a800adff37000137, %l3 = 0000000000000037
	ldxa	[%i2+%o4]0x81,%l3	! %l3 = a800adff37000137
!	Mem[0000000010001404] = 7bd72e46, %l2 = 00000000000000ff
	lduw	[%i0+0x004],%l2		! %l2 = 000000007bd72e46
!	Mem[000000001014143c] = 052dfec6, %f18 = 918960f8
	ld	[%i5+0x03c],%f18	! %f18 = 052dfec6
!	Starting 10 instruction Store Burst
!	%l7 = 000000000f4f9d1d, %l4 = 0000000000000000, %l0  = 0000000000000000
	mulx	%l7,%l4,%l0		! %l0 = 0000000000000000

p0_label_112:
!	Mem[00000000100c1400] = 4a36007e, %l2 = 000000007bd72e46
	ldstuba	[%i3+%g0]0x88,%l2	! %l2 = 0000007e000000ff
!	%l4 = 0000000000000000, Mem[00000000100c1408] = ffffffff000000ff
	stxa	%l4,[%i3+%o4]0x80	! Mem[00000000100c1408] = 0000000000000000
!	%l4 = 0000000000000000, Mem[0000000030181400] = 11000000000000ff
	stxa	%l4,[%i6+%g0]0x89	! Mem[0000000030181400] = 0000000000000000
!	%f28 = 3700e102 ffc60000, Mem[0000000010081418] = 000000c5 00000ade
	std	%f28,[%i2+0x018]	! Mem[0000000010081418] = 3700e102 ffc60000
!	Mem[0000000030081408] = a800adff, %l3 = a800adff37000137
	ldstuba	[%i2+%o4]0x81,%l3	! %l3 = 000000a8000000ff
!	Mem[0000000010001400] = ffffffff, %l0 = 0000000000000000
	ldstuba	[%i0+%g0]0x88,%l0	! %l0 = 000000ff000000ff
!	%f16 = 9a370706 ffff00b4, Mem[0000000030081408] = ff00adff 37000137
	stda	%f16,[%i2+%o4]0x81	! Mem[0000000030081408] = 9a370706 ffff00b4
!	%l1 = 001bffff000000ff, Mem[0000000010101410] = a85a9ad6
	stba	%l1,[%i4+%o5]0x88	! Mem[0000000010101410] = a85a9aff
!	%f12 = 9a370706 9020fb0b, Mem[0000000010081428] = 1fffa7c5 32b0aa8b
	stda	%f12,[%i2+0x028]%asi	! Mem[0000000010081428] = 9a370706 9020fb0b
!	Starting 10 instruction Load Burst
!	Code Fragment 3
p0_fragment_13:
!	%l0 = 00000000000000ff
	setx	0x1306df9ffff37752,%g7,%l0 ! %l0 = 1306df9ffff37752
!	%l1 = 001bffff000000ff
	setx	0xecfb8217dea1a8ef,%g7,%l1 ! %l1 = ecfb8217dea1a8ef
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 1306df9ffff37752
	setx	0xaa8c9cffc0084013,%g7,%l0 ! %l0 = aa8c9cffc0084013
!	%l1 = ecfb8217dea1a8ef
	setx	0xde2b8cd06faa9c0b,%g7,%l1 ! %l1 = de2b8cd06faa9c0b

p0_label_113:
!	Mem[00000000300c1400] = f8608991, %f2  = a87e701b
	lda	[%i3+%g0]0x81,%f2 	! %f2 = f8608991
!	Mem[0000000030101400] = ffffffff, %f28 = 3700e102
	lda	[%i4+%g0]0x81,%f28	! %f28 = ffffffff
!	%l5 = 000000000c099c75, %l5 = 000000000c099c75, %l3 = 00000000000000a8
	udivx	%l5,%l5,%l3		! %l3 = 0000000000000001
!	Mem[0000000010141408] = c7c193ff, %l5 = 000000000c099c75
	lduba	[%i5+%o4]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010041410] = ffffffff, %l0 = aa8c9cffc0084013
	ldsha	[%i1+%o5]0x80,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010101400] = 001bffff056fad8c, %l5 = 00000000000000ff
	ldxa	[%i4+%g0]0x88,%l5	! %l5 = 001bffff056fad8c
!	Mem[0000000010101400] = 8cad6f05, %l1 = de2b8cd06faa9c0b
	lduha	[%i4+%g0]0x80,%l1	! %l1 = 0000000000008cad
!	Mem[0000000010081408] = ffad6f05f8608991, %l3 = 0000000000000001
	ldxa	[%i2+%o4]0x80,%l3	! %l3 = ffad6f05f8608991
!	Mem[0000000030141400] = 000000ff, %l3 = ffad6f05f8608991
	lduwa	[%i5+%g0]0x89,%l3	! %l3 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l5 = 001bffff056fad8c, Mem[0000000030101410] = 061ac6ff
	stwa	%l5,[%i4+%o5]0x89	! Mem[0000000030101410] = 056fad8c

p0_label_114:
!	%l2 = 000000000000007e, Mem[0000000010041420] = ba6cab9e7fcdab61
	stx	%l2,[%i1+0x020]		! Mem[0000000010041420] = 000000000000007e
!	Mem[0000000010041410] = ffffffff, %l2 = 000000000000007e
	swapa	[%i1+%o5]0x88,%l2	! %l2 = 00000000ffffffff
!	Mem[0000000010041428] = 00000084, %l3 = 00000000000000ff
	swap	[%i1+0x028],%l3		! %l3 = 0000000000000084
!	%l5 = 001bffff056fad8c, Mem[0000000030181410] = 3700e102
	stha	%l5,[%i6+%o5]0x81	! Mem[0000000030181410] = ad8ce102
!	%f28 = ffffffff ffc60000, Mem[0000000030041410] = ffff1b86 1b707ea8
	stda	%f28,[%i1+%o5]0x81	! Mem[0000000030041410] = ffffffff ffc60000
!	%l4 = 0000000000000000, Mem[0000000010001410] = 00000000
	stba	%l4,[%i0+%o5]0x80	! Mem[0000000010001410] = 00000000
!	Mem[0000000010141408] = c7c193ff, %l5 = 001bffff056fad8c
	swapa	[%i5+%o4]0x88,%l5	! %l5 = 00000000c7c193ff
!	Mem[000000001000141c] = ff00002a, %l6 = 00000000ff1ac6ff, %asi = 80
	swapa	[%i0+0x01c]%asi,%l6	! %l6 = 00000000ff00002a
!	Mem[00000000211c0001] = 0000cd80, %l2 = 00000000ffffffff
	ldstub	[%o2+0x001],%l2		! %l2 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = ff000000, %l4 = 0000000000000000
	lduwa	[%i0+%o4]0x88,%l4	! %l4 = 00000000ff000000

p0_label_115:
!	Mem[0000000010181438] = 724869eb, %l1 = 0000000000008cad
	lduh	[%i6+0x038],%l1		! %l1 = 0000000000007248
!	Mem[0000000010041408] = 000000ff, %l7 = 000000000f4f9d1d
	ldswa	[%i1+%o4]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[00000000100c1410] = 3700ff00, %l1 = 0000000000007248
	lduba	[%i3+%o5]0x80,%l1	! %l1 = 0000000000000037
!	Mem[0000000010141410] = ffffffff, %l3 = 0000000000000084
	lduba	[%i5+0x013]%asi,%l3	! %l3 = 00000000000000ff
!	Mem[00000000201c0000] = ffff5a4a, %l4 = 00000000ff000000
	ldsha	[%o0+0x000]%asi,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010081410] = 00000000, %f24 = 32a75c28
	lda	[%i2+%o5]0x88,%f24	! %f24 = 00000000
!	Mem[0000000010101410] = ff9a5aa8, %l2 = 0000000000000000
	ldswa	[%i4+%o5]0x80,%l2	! %l2 = ffffffffff9a5aa8
!	Mem[00000000211c0000] = 00ffcd80, %l2 = ffffffffff9a5aa8
	ldsha	[%o2+0x000]%asi,%l2	! %l2 = 00000000000000ff
!	Mem[000000001004141c] = 000000ff, %l4 = ffffffffffffffff
	ldswa	[%i1+0x01c]%asi,%l4	! %l4 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%f19 = ad8c0000, Mem[00000000100c1400] = ff00364a
	sta	%f19,[%i3+%g0]0x80	! Mem[00000000100c1400] = ad8c0000

p0_label_116:
!	%l1 = 0000000000000037, Mem[00000000300c1410] = 447250aa
	stba	%l1,[%i3+%o5]0x89	! Mem[00000000300c1410] = 44725037
!	%l0 = ffffffff, %l1 = 00000037, Mem[0000000030081400] = 64c40c3a c3b425e0
	stda	%l0,[%i2+%g0]0x89	! Mem[0000000030081400] = ffffffff 00000037
!	%f18 = 052dfec6 ad8c0000, %l1 = 0000000000000037
!	Mem[0000000030101408] = ce6851794a278aa9
	add	%i4,0x008,%g1
	stda	%f18,[%g1+%l1]ASI_PST32_S ! Mem[0000000030101408] = 052dfec6ad8c0000
!	%l6 = 00000000ff00002a, Mem[0000000010041438] = 0f1547c26e61420b
	stx	%l6,[%i1+0x038]		! Mem[0000000010041438] = 00000000ff00002a
!	%f20 = ff79e2ec, Mem[0000000010081408] = 056fadff
	sta	%f20,[%i2+%o4]0x88	! Mem[0000000010081408] = ff79e2ec
!	Mem[0000000010141408] = 056fad8c, %l6 = 00000000ff00002a
	ldstuba	[%i5+%o4]0x88,%l6	! %l6 = 0000008c000000ff
!	%l1 = 0000000000000037, Mem[0000000030081400] = ffffffff
	stwa	%l1,[%i2+%g0]0x81	! Mem[0000000030081400] = 00000037
!	Mem[00000000300c1400] = f8608991, %l6 = 000000000000008c
	swapa	[%i3+%g0]0x81,%l6	! %l6 = 00000000f8608991
!	Mem[0000000010101413] = ff9a5aa8, %l0 = ffffffffffffffff
	ldstuba	[%i4+0x013]%asi,%l0	! %l0 = 000000a8000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = 759c090c, %l5 = 00000000c7c193ff
	lduwa	[%i1+%g0]0x80,%l5	! %l5 = 00000000759c090c

p0_label_117:
!	Mem[0000000010001410] = 00000000, %l5 = 00000000759c090c
	lduha	[%i0+%o5]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000010101410] = a87eff1b ff5a9aff, %l6 = f8608991, %l7 = 000000ff
	ldda	[%i4+%o5]0x88,%l6	! %l6 = 00000000ff5a9aff 00000000a87eff1b
!	Mem[0000000010041400] = 0c099c75, %l6 = 00000000ff5a9aff
	ldswa	[%i1+%g0]0x88,%l6	! %l6 = 000000000c099c75
!	Mem[0000000010001410] = 00000000, %l6 = 000000000c099c75
	ldsha	[%i0+%o5]0x88,%l6	! %l6 = 0000000000000000
!	Mem[00000000100c143c] = 9302b615, %l5 = 0000000000000000
	ldub	[%i3+0x03d],%l5		! %l5 = 0000000000000002
!	Mem[0000000010181410] = 8c000000, %l3 = 00000000000000ff
	ldsha	[%i6+0x012]%asi,%l3	! %l3 = 0000000000000000
!	Mem[0000000010041400] = 759c090c, %l5 = 0000000000000002
	lduba	[%i1+%g0]0x80,%l5	! %l5 = 0000000000000075
!	Mem[0000000010141410] = ffffffffffffffff, %f22 = 00000000 061ac6ff
	ldda	[%i5+%o5]0x80,%f22	! %f22 = ffffffff ffffffff
!	Mem[0000000010041400] = ff79e2ec0c099c75, %l7 = 00000000a87eff1b
	ldxa	[%i1+%g0]0x88,%l7	! %l7 = ff79e2ec0c099c75
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1408] = 1b707ea8, %l0 = 00000000000000a8
	ldsha	[%i3+%o4]0x89,%l0	! %l0 = 0000000000007ea8

p0_label_118:
!	%l7 = ff79e2ec0c099c75, Mem[0000000010041400] = 759c090c
	stwa	%l7,[%i1+%g0]0x80	! Mem[0000000010041400] = 0c099c75
!	%l2 = 000000ff, %l3 = 00000000, Mem[0000000010081400] = 0000c6ff 02e10037
	stda	%l2,[%i2+%g0]0x80	! Mem[0000000010081400] = 000000ff 00000000
!	%f22 = ffffffff, Mem[000000001010142c] = 00000000
	sta	%f22,[%i4+0x02c]%asi	! Mem[000000001010142c] = ffffffff
!	Mem[0000000010081400] = ff000000, %l5 = 0000000000000075
	ldstuba	[%i2+%g0]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[00000000100c1400] = ad8c0000, %l6 = 0000000000000000
	swap	[%i3+%g0],%l6		! %l6 = 00000000ad8c0000
!	%l5 = 0000000000000000, Mem[00000000218001c0] = 00d25b76, %asi = 80
	stba	%l5,[%o3+0x1c0]%asi	! Mem[00000000218001c0] = 00d25b76
!	%f16 = 9a370706 ffff00b4 052dfec6 ad8c0000
!	%f20 = ff79e2ec 0c099c75 ffffffff ffffffff
!	%f24 = 00000000 447250aa ce685179 4a278aa9
!	%f28 = ffffffff ffc60000 ffffffff 9a847a4b
	stda	%f16,[%i1]ASI_BLK_AIUS	! Block Store to 0000000030041400
!	Mem[00000000300c1408] = 1b707ea8, %l0 = 0000000000007ea8
	ldstuba	[%i3+%o4]0x89,%l0	! %l0 = 000000a8000000ff
!	%l6 = ad8c0000, %l7 = 0c099c75, Mem[0000000010141418] = 00000000 00000060
	stda	%l6,[%i5+0x018]%asi	! Mem[0000000010141418] = ad8c0000 0c099c75
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = 00ff0037, %l7 = ff79e2ec0c099c75
	lduba	[%i3+%o5]0x88,%l7	! %l7 = 0000000000000037

p0_label_119:
!	Mem[0000000010081430] = 7eff0000 a85a9ad6, %l6 = ad8c0000, %l7 = 00000037
	ldd	[%i2+0x030],%l6		! %l6 = 000000007eff0000 00000000a85a9ad6
!	Mem[0000000010081400] = ff0000ff, %l0 = 00000000000000a8
	ldswa	[%i2+%g0]0x88,%l0	! %l0 = ffffffffff0000ff
!	Mem[00000000300c1408] = ff7e701b, %l4 = 00000000000000ff
	ldsha	[%i3+%o4]0x81,%l4	! %l4 = ffffffffffffff7e
!	Mem[0000000010181418] = 7e00364a, %l7 = 00000000a85a9ad6
	ldsw	[%i6+0x018],%l7		! %l7 = 000000007e00364a
!	Mem[00000000300c1400] = 8c000000, %l2 = 00000000000000ff
	lduba	[%i3+%g0]0x89,%l2	! %l2 = 0000000000000000
	membar	#Sync			! Added by membar checker (16)
!	Mem[0000000010041400] = 759c090c, %l6 = 000000007eff0000
	ldswa	[%i1+%g0]0x88,%l6	! %l6 = 00000000759c090c
!	Mem[00000000100c1410] = 00ff0037, %l2 = 0000000000000000
	lduba	[%i3+%o5]0x88,%l2	! %l2 = 0000000000000037
!	Mem[00000000100c1400] = 00000000 00000000, %l0 = ff0000ff, %l1 = 00000037
	ldda	[%i3+0x000]%asi,%l0	! %l0 = 0000000000000000 0000000000000000
!	Mem[0000000010001410] = 00000000, %l6 = 00000000759c090c
	lduha	[%i0+0x010]%asi,%l6	! %l6 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l6 = 0000000000000000, Mem[0000000010041400] = 0c099c75
	stwa	%l6,[%i1+%g0]0x80	! Mem[0000000010041400] = 00000000

p0_label_120:
!	%l2 = 0000000000000037, Mem[0000000030041400] = 9a370706
	stba	%l2,[%i1+%g0]0x81	! Mem[0000000030041400] = 37370706
!	%l1 = 0000000000000000, Mem[0000000010001408] = ff000000
	stha	%l1,[%i0+%o4]0x88	! Mem[0000000010001408] = ff000000
!	Mem[0000000020800000] = ffffa5fa, %l2 = 0000000000000037
	ldstuba	[%o1+0x000]%asi,%l2	! %l2 = 000000ff000000ff
!	Mem[00000000100c1424] = 9c91a9f4, %l1 = 0000000000000000
	swap	[%i3+0x024],%l1		! %l1 = 000000009c91a9f4
!	Mem[00000000300c1400] = 0000008c, %l5 = 0000000000000000
	ldstuba	[%i3+%g0]0x81,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010001410] = 00000000, %l3 = 0000000000000000
	swapa	[%i0+%o5]0x88,%l3	! %l3 = 0000000000000000
!	%l0 = 0000000000000000, immed = fffff8be, %y  = ff00f5bc
	smul	%l0,-0x742,%l2		! %l2 = 0000000000000000, %y = 00000000
!	Mem[0000000030001410] = ff629133, %l5 = 0000000000000000
	ldstuba	[%i0+%o5]0x81,%l5	! %l5 = 000000ff000000ff
!	%l3 = 0000000000000000, Mem[0000000030141408] = 061ac6ff
	stba	%l3,[%i5+%o4]0x81	! Mem[0000000030141408] = 001ac6ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = 00000000, %l2 = 0000000000000000
	lduba	[%i0+%o5]0x88,%l2	! %l2 = 0000000000000000

p0_label_121:
!	%l2 = 0000000000000000, imm = fffffffffffff160, %l0 = 0000000000000000
	orn	%l2,-0xea0,%l0		! %l0 = 0000000000000e9f
!	Mem[0000000030181410] = 02e18cad, %l2 = 0000000000000000
	ldswa	[%i6+%o5]0x89,%l2	! %l2 = 0000000002e18cad
!	Mem[0000000030081408] = 9a370706, %l7 = 000000007e00364a
	ldswa	[%i2+%o4]0x81,%l7	! %l7 = ffffffff9a370706
!	Mem[0000000010001400] = ffffffff, %l0 = 0000000000000e9f
	lduba	[%i0+%g0]0x80,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030001408] = ffc61a06, %l1 = 000000009c91a9f4
	ldswa	[%i0+%o4]0x81,%l1	! %l1 = ffffffffffc61a06
!	Mem[0000000010141410] = ffffffff, %l1 = ffffffffffc61a06
	ldsba	[%i5+%o5]0x88,%l1	! %l1 = ffffffffffffffff
!	Mem[00000000300c1408] = ff7e701b, %l5 = 00000000000000ff
	ldswa	[%i3+%o4]0x81,%l5	! %l5 = ffffffffff7e701b
!	Mem[0000000010081410] = 0000000000000000, %l2 = 0000000002e18cad
	ldxa	[%i2+%o5]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000021800100] = b4ffaf61, %l7 = ffffffff9a370706
	lduh	[%o3+0x100],%l7		! %l7 = 000000000000b4ff
!	Starting 10 instruction Store Burst
!	%l7 = 000000000000b4ff, Mem[0000000030001410] = 339162ff
	stba	%l7,[%i0+%o5]0x89	! Mem[0000000030001410] = 339162ff

p0_label_122:
!	%f6  = 7e00364a 97442b29, Mem[0000000010181400] = ff000000 ffff1b00
	stda	%f6 ,[%i6+0x000]%asi	! Mem[0000000010181400] = 7e00364a 97442b29
!	%l4 = ffffff7e, %l5 = ff7e701b, Mem[0000000030081410] = 9a370706 ffff00b4
	stda	%l4,[%i2+%o5]0x81	! Mem[0000000030081410] = ffffff7e ff7e701b
!	%l4 = ffffffffffffff7e, Mem[00000000300c1410] = 37507244285ca732
	stxa	%l4,[%i3+%o5]0x81	! Mem[00000000300c1410] = ffffffffffffff7e
!	Mem[0000000010001408] = ff000000, %l4 = ffffffffffffff7e
	ldstuba	[%i0+%o4]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030001408] = 061ac6ff, %l5 = ffffffffff7e701b
	swapa	[%i0+%o4]0x89,%l5	! %l5 = 00000000061ac6ff
!	%f16 = 9a370706 ffff00b4, Mem[0000000030081408] = 9a370706 ffff00b4
	stda	%f16,[%i2+%o4]0x81	! Mem[0000000030081408] = 9a370706 ffff00b4
!	Mem[00000000201c0000] = ffff5a4a, %l5 = 00000000061ac6ff
	ldstub	[%o0+%g0],%l5		! %l5 = 000000ff000000ff
!	%l7 = 000000000000b4ff, Mem[000000001010141e] = 97442b29, %asi = 80
	stba	%l7,[%i4+0x01e]%asi	! Mem[000000001010141c] = 9744ff29
!	%l6 = 00000000, %l7 = 0000b4ff, Mem[0000000030041400] = 06073737 b400ffff
	stda	%l6,[%i1+%g0]0x89	! Mem[0000000030041400] = 00000000 0000b4ff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1424] = 00000000, %l4 = 0000000000000000
	lduwa	[%i3+0x024]%asi,%l4	! %l4 = 0000000000000000

p0_label_123:
!	Mem[00000000100c1408] = 00000000 00000000, %l2 = 00000000, %l3 = 00000000
	ldda	[%i3+%o4]0x88,%l2	! %l2 = 0000000000000000 0000000000000000
!	Mem[00000000100c1418] = d5edeaba, %l3 = 0000000000000000
	lduha	[%i3+0x01a]%asi,%l3	! %l3 = 000000000000eaba
!	Mem[00000000300c1408] = ff7e701b, %l7 = 000000000000b4ff
	lduba	[%i3+%o4]0x81,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030181400] = 00000000, %l5 = 00000000000000ff
	ldswa	[%i6+%g0]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000010181408] = 32b0aa8b, %l0 = 00000000000000ff
	ldsha	[%i6+%o4]0x88,%l0	! %l0 = ffffffffffffaa8b
!	Mem[0000000010141408] = 056fadff, %l6 = 0000000000000000
	lduwa	[%i5+%o4]0x88,%l6	! %l6 = 00000000056fadff
!	Mem[00000000100c1420] = 87a255b1, %f12 = 9a370706
	lda	[%i3+0x020]%asi,%f12	! %f12 = 87a255b1
!	Mem[000000001014143c] = 052dfec6, %l0 = ffffffffffffaa8b
	lduwa	[%i5+0x03c]%asi,%l0	! %l0 = 00000000052dfec6
!	Mem[0000000030041410] = ece279ff, %l2 = 0000000000000000
	ldsba	[%i1+%o5]0x89,%l2	! %l2 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	Mem[00000000211c0000] = 00ffcd80, %l0 = 00000000052dfec6
	ldstub	[%o2+%g0],%l0		! %l0 = 00000000000000ff

p0_label_124:
!	%f1  = 00000000, %f18 = 052dfec6, %f23 = ffffffff
	fadds	%f1 ,%f18,%f23		! %f23 = 052dfec6
!	Mem[0000000020800000] = ffffa5fa, %l1 = ffffffffffffffff
	ldstub	[%o1+%g0],%l1		! %l1 = 000000ff000000ff
!	Mem[0000000030141410] = ece279ff, %l7 = 00000000000000ff
	swapa	[%i5+%o5]0x89,%l7	! %l7 = 00000000ece279ff
!	Mem[0000000010001408] = ff0000ff, %l1 = 00000000000000ff
	ldstuba	[%i0+%o4]0x80,%l1	! %l1 = 000000ff000000ff
!	%f2  = f8608991 ff93c1c7, %l7 = 00000000ece279ff
!	Mem[00000000100c1428] = 86842aa8400be218
	add	%i3,0x028,%g1
	stda	%f2,[%g1+%l7]ASI_PST8_P ! Mem[00000000100c1428] = f8608991ff93c1c7
!	%l1 = 00000000000000ff, Mem[0000000010041410] = 0000007e
	stha	%l1,[%i1+%o5]0x88	! Mem[0000000010041410] = 000000ff
!	%l2 = ffffffffffffffff, Mem[00000000100c1408] = 00000000
	stba	%l2,[%i3+%o4]0x88	! Mem[00000000100c1408] = 000000ff
!	%l0 = 0000000000000000, Mem[0000000010181410] = 8c000000
	stha	%l0,[%i6+%o5]0x80	! Mem[0000000010181410] = 00000000
!	Mem[0000000010181438] = 724869eb000000ff, %l0 = 0000000000000000, %l1 = 00000000000000ff
	add	%i6,0x38,%g1
	casxa	[%g1]0x80,%l0,%l1	! %l1 = 724869eb000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = 3700ff00, %f7  = 97442b29
	lda	[%i3+%o5]0x80,%f7 	! %f7 = 3700ff00

p0_label_125:
!	Mem[0000000030181408] = ffffffff, %f13 = 9020fb0b
	lda	[%i6+%o4]0x89,%f13	! %f13 = ffffffff
!	Mem[0000000030001408] = 1b707eff, %l2 = ffffffffffffffff
	lduha	[%i0+%o4]0x81,%l2	! %l2 = 0000000000001b70
!	Mem[0000000030141408] = ffc61a00, %l3 = 000000000000eaba
	lduwa	[%i5+%o4]0x89,%l3	! %l3 = 00000000ffc61a00
!	Mem[0000000010081438] = 061ac6ff 00008cad, %l2 = 00001b70, %l3 = ffc61a00
	ldd	[%i2+0x038],%l2		! %l2 = 00000000061ac6ff 0000000000008cad
!	Mem[0000000010181408] = 32b0aa8b, %l3 = 0000000000008cad
	ldswa	[%i6+%o4]0x88,%l3	! %l3 = 0000000032b0aa8b
!	Mem[0000000010141410] = ffffffff, %l4 = 0000000000000000
	ldswa	[%i5+%o5]0x88,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010081410] = 00000000, %l5 = 0000000000000000
	ldswa	[%i2+%o5]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000030181410] = ad8ce102, %l7 = 00000000ece279ff
	lduba	[%i6+%o5]0x81,%l7	! %l7 = 00000000000000ad
!	Mem[00000000201c0000] = ffff5a4a, %l1 = 724869eb000000ff
	ldsba	[%o0+0x001]%asi,%l1	! %l1 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	Mem[0000000030001410] = 339162ff, %l1 = ffffffffffffffff
	ldstuba	[%i0+%o5]0x89,%l1	! %l1 = 000000ff000000ff

p0_label_126:
!	%l1 = 00000000000000ff, Mem[00000000100c1410] = 00ff0037
	stba	%l1,[%i3+%o5]0x88	! Mem[00000000100c1410] = 00ff00ff
!	Mem[0000000010041400] = 00000000, %l5 = 0000000000000000
	ldstuba	[%i1+%g0]0x80,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010081408] = ff79e2ec, %l2 = 00000000061ac6ff
	swapa	[%i2+%o4]0x88,%l2	! %l2 = 00000000ff79e2ec
!	%l4 = ffffffff, %l5 = 00000000, Mem[0000000030081410] = 7effffff 1b707eff
	stda	%l4,[%i2+%o5]0x89	! Mem[0000000030081410] = ffffffff 00000000
!	%l4 = ffffffffffffffff, Mem[0000000030101410] = 8cad6f05
	stha	%l4,[%i4+%o5]0x81	! Mem[0000000030101410] = ffff6f05
!	%l6 = 056fadff, %l7 = 000000ad, Mem[0000000030041400] = 00000000 0000b4ff
	stda	%l6,[%i1+%g0]0x89	! Mem[0000000030041400] = 056fadff 000000ad
!	%f4  = 00000000, %f12 = 87a255b1
	fcmps	%fcc3,%f4 ,%f12		! %fcc3 = 2
!	%l7 = 00000000000000ad, Mem[0000000020800040] = 0000fa54, %asi = 80
	stba	%l7,[%o1+0x040]%asi	! Mem[0000000020800040] = ad00fa54
!	%l2 = 00000000ff79e2ec, Mem[0000000010081408] = ffc61a06
	stha	%l2,[%i2+%o4]0x80	! Mem[0000000010081408] = e2ec1a06
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = b972c7ba339162ff, %l7 = 00000000000000ad
	ldxa	[%i0+%o5]0x89,%l7	! %l7 = b972c7ba339162ff

p0_label_127:
!	Mem[0000000010001438] = 33f371b2, %l7 = b972c7ba339162ff
	lduha	[%i0+0x03a]%asi,%l7	! %l7 = 00000000000071b2
!	Code Fragment 3
p0_fragment_14:
!	%l0 = 0000000000000000
	setx	0xa678a447e4221fab,%g7,%l0 ! %l0 = a678a447e4221fab
!	%l1 = 00000000000000ff
	setx	0x928842e05fe5b717,%g7,%l1 ! %l1 = 928842e05fe5b717
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = a678a447e4221fab
	setx	0xb7f344600f633ca8,%g7,%l0 ! %l0 = b7f344600f633ca8
!	%l1 = 928842e05fe5b717
	setx	0x9cd1c66024f94aa7,%g7,%l1 ! %l1 = 9cd1c66024f94aa7
!	Mem[00000000100c1410] = 8400000000ff00ff, %f26 = ce685179 4a278aa9
	ldda	[%i3+%o5]0x88,%f26	! %f26 = 84000000 00ff00ff
!	Mem[0000000030101400] = ffffffff, %l3 = 0000000032b0aa8b
	ldsha	[%i4+%g0]0x81,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000030181400] = 0000000000000000, %f28 = ffffffff ffc60000
	ldda	[%i6+%g0]0x89,%f28	! %f28 = 00000000 00000000
!	Mem[0000000030041408] = 052dfec6, %f9  = 11000000
	lda	[%i1+%o4]0x81,%f9 	! %f9 = 052dfec6
!	%f6  = 7e00364a, %f5  = 1b707ea8, %f14 = 724869eb
	fsubs	%f6 ,%f5 ,%f14		! %f14 = 7e00364a
!	Mem[000000001018143c] = 000000ff, %l5 = 0000000000000000
	lduh	[%i6+0x03e],%l5		! %l5 = 00000000000000ff
!	Mem[000000001018140c] = ffffffff, %l5 = 00000000000000ff
	lduh	[%i6+0x00c],%l5		! %l5 = 000000000000ffff
!	Starting 10 instruction Store Burst
!	Mem[0000000030141400] = ff000000, %l0 = b7f344600f633ca8
	swapa	[%i5+%g0]0x81,%l0	! %l0 = 00000000ff000000

p0_label_128:
!	Mem[0000000010181427] = 32b0aa8b, %l7 = 00000000000071b2
	ldstub	[%i6+0x027],%l7		! %l7 = 0000008b000000ff
!	%l6 = 00000000056fadff, Mem[0000000021800040] = ff00c8f1
	stb	%l6,[%o3+0x040]		! Mem[0000000021800040] = ff00c8f1
!	%f26 = 84000000 00ff00ff, Mem[0000000010141438] = 396a40d9 052dfec6
	stda	%f26,[%i5+0x038]%asi	! Mem[0000000010141438] = 84000000 00ff00ff
!	Mem[0000000030181408] = ffffffff, %l3 = ffffffffffffffff
	ldstuba	[%i6+%o4]0x89,%l3	! %l3 = 000000ff000000ff
!	%l2 = 00000000ff79e2ec, Mem[0000000010101400] = 8cad6f05ffff1b00
	stxa	%l2,[%i4+%g0]0x80	! Mem[0000000010101400] = 00000000ff79e2ec
!	Mem[00000000100c1408] = ff000000, %l0 = 00000000ff000000
	ldstuba	[%i3+%o4]0x80,%l0	! %l0 = 000000ff000000ff
!	Mem[0000000010041400] = ff000000, %l2 = 00000000ff79e2ec
	swapa	[%i1+%g0]0x80,%l2	! %l2 = 00000000ff000000
!	Mem[0000000030181408] = ffffffff, %l6 = 00000000056fadff
	swapa	[%i6+%o4]0x81,%l6	! %l6 = 00000000ffffffff
!	%f13 = ffffffff, %f5  = 1b707ea8, %f27 = 00ff00ff
	fdivs	%f13,%f5 ,%f27		! %f27 = ffffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = e2ec1a06, %l2 = 00000000ff000000
	lduha	[%i2+%o4]0x80,%l2	! %l2 = 000000000000e2ec

p0_label_129:
!	Mem[0000000010181404] = 97442b29, %l5 = 000000000000ffff
	ldsha	[%i6+0x004]%asi,%l5	! %l5 = ffffffffffff9744
!	%l6 = 00000000ffffffff, %l7 = 000000000000008b, %y  = 00000000
	sdiv	%l6,%l7,%l3		! %l3 = 0000000001d77b65
	mov	%l0,%y			! %y = 000000ff
!	Mem[00000000100c1428] = f8608991 ff93c1c7, %l2 = 0000e2ec, %l3 = 01d77b65
	ldd	[%i3+0x028],%l2		! %l2 = 00000000f8608991 00000000ff93c1c7
!	Mem[0000000010081408] = 061aece2, %l1 = 9cd1c66024f94aa7
	ldswa	[%i2+%o4]0x88,%l1	! %l1 = 00000000061aece2
!	Mem[0000000030141400] = a83c630f, %l1 = 00000000061aece2
	lduba	[%i5+%g0]0x89,%l1	! %l1 = 000000000000000f
!	Mem[0000000030141408] = ffc61a00, %l6 = 00000000ffffffff
	ldsha	[%i5+%o4]0x89,%l6	! %l6 = 0000000000001a00
!	Mem[0000000030141400] = a83c630f, %l3 = 00000000ff93c1c7
	ldsba	[%i5+%g0]0x89,%l3	! %l3 = 000000000000000f
!	Mem[0000000010001400] = ffffffff, %l6 = 0000000000001a00
	ldsha	[%i0+%g0]0x88,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000030081400] = 00000037, %l7 = 000000000000008b
	ldsha	[%i2+%g0]0x81,%l7	! %l7 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l5 = ffffffffffff9744, Mem[0000000021800101] = b4ffaf61, %asi = 80
	stba	%l5,[%o3+0x101]%asi	! Mem[0000000021800100] = b444af61

p0_label_130:
!	%l3 = 000000000000000f, Mem[00000000300c1400] = 8c0000ff
	stwa	%l3,[%i3+%g0]0x89	! Mem[00000000300c1400] = 0000000f
!	%f15 = 00000000, %f4  = 00000000
	fsqrts	%f15,%f4 		! %f4  = 00000000
!	Mem[00000000100c1434] = ff120897, %l5 = ffffffffffff9744, %asi = 80
	swapa	[%i3+0x034]%asi,%l5	! %l5 = 00000000ff120897
!	%f10 = 7eff0000, %f18 = 052dfec6, %f5  = 1b707ea8
	fdivs	%f10,%f18,%f5 		! %f5  = 7f800000
!	%l7 = 0000000000000000, Mem[00000000300c1408] = ff7e701b
	stwa	%l7,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00000000
!	Mem[0000000010081433] = 7eff0000, %l3 = 000000000000000f
	ldstub	[%i2+0x033],%l3		! %l3 = 00000000000000ff
!	Mem[0000000010081400] = ff0000ff, %l5 = 00000000ff120897
	ldstuba	[%i2+%g0]0x88,%l5	! %l5 = 000000ff000000ff
!	%f26 = 84000000, Mem[0000000010001408] = ff0000ff
	sta	%f26,[%i0+%o4]0x80	! Mem[0000000010001408] = 84000000
!	%l5 = 00000000000000ff, Mem[0000000010001418] = 00000094ff1ac6ff, %asi = 80
	stxa	%l5,[%i0+0x018]%asi	! Mem[0000000010001418] = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030181410] = 8631b339 02e18cad, %l6 = ffffffff, %l7 = 00000000
	ldda	[%i6+%o5]0x89,%l6	! %l6 = 0000000002e18cad 000000008631b339

p0_label_131:
!	Mem[0000000010041408] = 000000ff, %l3 = 0000000000000000
	ldsba	[%i1+%o4]0x88,%l3	! %l3 = ffffffffffffffff
!	Code Fragment 4
p0_fragment_15:
!	%l0 = 00000000000000ff
	setx	0x0a2e57e861e80fb5,%g7,%l0 ! %l0 = 0a2e57e861e80fb5
!	%l1 = 000000000000000f
	setx	0x701e42e063ec359e,%g7,%l1 ! %l1 = 701e42e063ec359e
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 0a2e57e861e80fb5
	setx	0xaea1848f902acf72,%g7,%l0 ! %l0 = aea1848f902acf72
!	%l1 = 701e42e063ec359e
	setx	0x28a2c9d827174d21,%g7,%l1 ! %l1 = 28a2c9d827174d21
!	Mem[0000000010101420] = 1fffa7c532b0aa8b, %l2 = 00000000f8608991
	ldx	[%i4+0x020],%l2		! %l2 = 1fffa7c532b0aa8b
!	Mem[0000000010041400] = ff79e2ec ece279ff, %l6 = 02e18cad, %l7 = 8631b339
	ldda	[%i1+%g0]0x80,%l6	! %l6 = 00000000ff79e2ec 00000000ece279ff
!	Mem[0000000030001408] = 1b707eff, %l0 = aea1848f902acf72
	ldswa	[%i0+%o4]0x81,%l0	! %l0 = 000000001b707eff
!	Mem[0000000030041408] = 052dfec6, %l1 = 28a2c9d827174d21
	ldsba	[%i1+%o4]0x81,%l1	! %l1 = 0000000000000005
!	Mem[0000000030141408] = 001ac6ff 32b0aa8b, %l2 = 32b0aa8b, %l3 = ffffffff
	ldda	[%i5+%o4]0x81,%l2	! %l2 = 00000000001ac6ff 0000000032b0aa8b
!	Mem[0000000010141418] = ad8c00000c099c75, %l0 = 000000001b707eff
	ldx	[%i5+0x018],%l0		! %l0 = ad8c00000c099c75
!	Mem[0000000010101428] = 00000000, %l1 = 0000000000000005
	lduw	[%i4+0x028],%l1		! %l1 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010081408] = e2ec1a06, %l6 = 00000000ff79e2ec
	swapa	[%i2+%o4]0x80,%l6	! %l6 = 00000000e2ec1a06

p0_label_132:
!	Mem[0000000010101410] = ff5a9aff, %l6 = 00000000e2ec1a06
	ldstuba	[%i4+%o5]0x88,%l6	! %l6 = 000000ff000000ff
!	%l0 = 0c099c75, %l1 = 00000000, Mem[0000000010001420] = 00ff00fb 2d092ff1
	stda	%l0,[%i0+0x020]%asi	! Mem[0000000010001420] = 0c099c75 00000000
!	%l5 = 00000000000000ff, Mem[0000000010081428] = 9a370706
	stw	%l5,[%i2+0x028]		! Mem[0000000010081428] = 000000ff
!	Mem[0000000030141408] = 001ac6ff, %l1 = 0000000000000000
	swapa	[%i5+%o4]0x81,%l1	! %l1 = 00000000001ac6ff
!	%f11 = a85a9ad6, %f10 = 7eff0000, %f18 = 052dfec6 ad8c0000
	fsmuld	%f11,%f10,%f18		! %f18 = c4fb3807 65400000
!	Mem[0000000030081408] = 0607379a, %l5 = 00000000000000ff
	ldstuba	[%i2+%o4]0x89,%l5	! %l5 = 0000009a000000ff
!	Mem[00000000100c1400] = 00000000, %l1 = 00000000001ac6ff
	lduwa	[%i3+%g0]0x88,%l1	! %l1 = 0000000000000000
!	%f12 = 87a255b1 ffffffff, Mem[0000000030001408] = 1b707eff 00000000
	stda	%f12,[%i0+%o4]0x81	! Mem[0000000030001408] = 87a255b1 ffffffff
!	Mem[0000000030141410] = ff000000, %l5 = 000000000000009a
	swapa	[%i5+%o5]0x81,%l5	! %l5 = 00000000ff000000
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (17)
!	Mem[0000000010081400] = ff0000ff 00000000 ff79e2ec f8608991
!	Mem[0000000010081410] = 00000000 00000000 3700e102 ffc60000
!	Mem[0000000010081420] = 67ce8707 11000000 000000ff 9020fb0b
!	Mem[0000000010081430] = 7eff00ff a85a9ad6 061ac6ff 00008cad
	ldda	[%i2]ASI_BLK_P,%f16	! Block Load from 0000000010081400

p0_label_133:
!	Mem[0000000030141408] = 00000000, %f11 = a85a9ad6
	lda	[%i5+%o4]0x81,%f11	! %f11 = 00000000
!	Mem[0000000030181408] = ffad6f05, %l1 = 0000000000000000
	ldsba	[%i6+%o4]0x89,%l1	! %l1 = 0000000000000005
!	%l2 = 00000000001ac6ff, imm = fffffffffffff91c, %l1 = 0000000000000005
	and	%l2,-0x6e4,%l1		! %l1 = 00000000001ac01c
!	Mem[00000000100c1400] = 00000000 00000000 ff000000 00000000
!	Mem[00000000100c1410] = ff00ff00 00000084 d5edeaba fff0bb9c
!	Mem[00000000100c1420] = 87a255b1 00000000 f8608991 ff93c1c7
!	Mem[00000000100c1430] = bfc28cf8 ffff9744 70db00d2 9302b615
	ldda	[%i3]ASI_BLK_P,%f0	! Block Load from 00000000100c1400
!	Mem[0000000010181410] = 00000000, %l4 = ffffffffffffffff
	lduba	[%i6+%o5]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000010101410] = ff5a9aff, %l7 = 00000000ece279ff
	lduba	[%i4+%o5]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030081410] = ffffffff, %l2 = 00000000001ac6ff
	ldswa	[%i2+%o5]0x89,%l2	! %l2 = ffffffffffffffff
!	Mem[00000000100c1400] = 00000000, %l0 = ad8c00000c099c75
	lduba	[%i3+%g0]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000030101400] = ffffffff, %l6 = 00000000000000ff
	lduba	[%i4+%g0]0x89,%l6	! %l6 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000010181410] = 00000000, %l7 = 00000000000000ff
	swapa	[%i6+%o5]0x80,%l7	! %l7 = 0000000000000000

p0_label_134:
!	%l1 = 00000000001ac01c, Mem[0000000030001410] = ff629133
	stba	%l1,[%i0+%o5]0x81	! Mem[0000000030001410] = 1c629133
!	Mem[0000000010001410] = 00000000, %l0 = 00000000, %l7 = 00000000
	add	%i0,0x10,%g1
	casa	[%g1]0x80,%l0,%l7	! %l7 = 0000000000000000
!	%l6 = 00000000000000ff, %l7 = 0000000000000000, %l0 = 0000000000000000
	and	%l6,%l7,%l0		! %l0 = 0000000000000000
!	Mem[00000000300c1408] = 00000000, %l4 = 0000000000000000
	swapa	[%i3+%o4]0x81,%l4	! %l4 = 0000000000000000
!	%l6 = 00000000000000ff, imm = 0000000000000522, %l1 = 00000000001ac01c
	xor	%l6,0x522,%l1		! %l1 = 00000000000005dd
!	Mem[0000000010141417] = ffffffff, %l4 = 0000000000000000
	ldstub	[%i5+0x017],%l4		! %l4 = 000000ff000000ff
!	%f24 = 67ce8707 11000000, %l7 = 0000000000000000
!	Mem[0000000010041418] = c77babee000000ff
	add	%i1,0x018,%g1
	stda	%f24,[%g1+%l7]ASI_PST32_PL ! Mem[0000000010041418] = c77babee000000ff
	membar	#Sync			! Added by membar checker (18)
!	%l7 = 0000000000000000, Mem[00000000100c1408] = ff000000
	stwa	%l7,[%i3+%o4]0x80	! Mem[00000000100c1408] = 00000000
!	%l5 = 00000000ff000000, Mem[0000000010001408] = 84000000
	stwa	%l5,[%i0+%o4]0x80	! Mem[0000000010001408] = ff000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = ffad6f05, %l1 = 00000000000005dd
	lduha	[%i5+%o4]0x80,%l1	! %l1 = 000000000000ffad

p0_label_135:
!	Mem[0000000010041410] = 000000ff, %l6 = 00000000000000ff
	lduwa	[%i1+%o5]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030001400] = ffc6000000000000, %l4 = 00000000000000ff
	ldxa	[%i0+%g0]0x81,%l4	! %l4 = ffc6000000000000
!	Mem[0000000010081400] = ff0000ff 00000000 ff79e2ec f8608991
!	Mem[0000000010081410] = 00000000 00000000 3700e102 ffc60000
!	Mem[0000000010081420] = 67ce8707 11000000 000000ff 9020fb0b
!	Mem[0000000010081430] = 7eff00ff a85a9ad6 061ac6ff 00008cad
	ldda	[%i2]ASI_BLK_AIUPL,%f16	! Block Load from 0000000010081400
!	Mem[0000000010041408] = 55c61a06000000ff, %f10 = f8608991 ff93c1c7
	ldda	[%i1+%o4]0x88,%f10	! %f10 = 55c61a06 000000ff
!	Mem[0000000010081400] = 00000000ff0000ff, %l3 = 0000000032b0aa8b
	ldxa	[%i2+%g0]0x88,%l3	! %l3 = 00000000ff0000ff
!	Mem[0000000010001400] = 462ed77b ffffffff, %l0 = 00000000, %l1 = 0000ffad
	ldda	[%i0+%g0]0x88,%l0	! %l0 = 00000000ffffffff 00000000462ed77b
!	Mem[00000000100c1410] = 00ff00ff, %l5 = 00000000ff000000
	lduwa	[%i3+%o5]0x88,%l5	! %l5 = 0000000000ff00ff
!	Mem[0000000030141400] = 0f633ca8 0000007e, %l0 = ffffffff, %l1 = 462ed77b
	ldda	[%i5+%g0]0x81,%l0	! %l0 = 000000000f633ca8 000000000000007e
!	Mem[0000000021800141] = ff064205, %l3 = 00000000ff0000ff
	ldstub	[%o3+0x141],%l3		! %l3 = 00000006000000ff
!	Starting 10 instruction Store Burst
!	%l0 = 000000000f633ca8, Mem[00000000300c1410] = ffffffff
	stwa	%l0,[%i3+%o5]0x81	! Mem[00000000300c1410] = 0f633ca8

p0_label_136:
	membar	#Sync			! Added by membar checker (19)
!	%l5 = 0000000000ff00ff, Mem[0000000010081426] = 11000000
	stb	%l5,[%i2+0x026]		! Mem[0000000010081424] = 1100ff00
!	%l0 = 0f633ca8, %l1 = 0000007e, Mem[0000000030001410] = 1c629133 bac772b9
	stda	%l0,[%i0+%o5]0x81	! Mem[0000000030001410] = 0f633ca8 0000007e
!	%l2 = ffffffffffffffff, Mem[0000000010141400] = a87e5179
	stba	%l2,[%i5+%g0]0x88	! Mem[0000000010141400] = a87e51ff
!	%l6 = 00000000000000ff, Mem[00000000100c1410] = ff00ff00
	stha	%l6,[%i3+%o5]0x80	! Mem[00000000100c1410] = 00ffff00
!	Mem[0000000010141403] = ff517ea8, %l5 = 0000000000ff00ff
	ldstub	[%i5+0x003],%l5		! %l5 = 000000a8000000ff
!	Mem[0000000030101410] = ffff6f05, %l7 = 0000000000000000
	ldstuba	[%i4+%o5]0x81,%l7	! %l7 = 000000ff000000ff
!	%f16 = 00000000, Mem[0000000030041400] = ffad6f05
	sta	%f16,[%i1+%g0]0x81	! Mem[0000000030041400] = 00000000
!	%f27 = ff000000, %f28 = d69a5aa8
	fcmpes	%fcc3,%f27,%f28		! %fcc3 = 1
!	%l5 = 00000000000000a8, %l4 = ffc6000000000000, %l6 = 00000000000000ff
	sdivx	%l5,%l4,%l6		! %l6 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = ff0000ff 00000000, %l4 = 00000000, %l5 = 000000a8
	ldda	[%i2+%g0]0x80,%l4	! %l4 = 00000000ff0000ff 0000000000000000

p0_label_137:
!	Mem[0000000030101410] = 056fffff, %f9  = 00000000
	lda	[%i4+%o5]0x89,%f9 	! %f9 = 056fffff
!	Mem[00000000100c1400] = 00000000, %l1 = 000000000000007e
	lduha	[%i3+%g0]0x88,%l1	! %l1 = 0000000000000000
!	Mem[00000000100c1410] = 00ffff00, %f5  = 00000084
	lda	[%i3+%o5]0x88,%f5 	! %f5 = 00ffff00
!	%l6 = 0000000000000000, imm = fffffffffffff079, %l4 = 00000000ff0000ff
	andn	%l6,-0xf87,%l4		! %l4 = 0000000000000000
!	Mem[0000000010181410] = 000000ff, %l2 = ffffffffffffffff
	ldsba	[%i6+%o5]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000010181410] = 000000ff, %l3 = 0000000000000006
	lduha	[%i6+%o5]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000010041410] = ff000000000000a8, %f30 = ad8c0000 ffc61a06
	ldda	[%i1+0x010]%asi,%f30	! %f30 = ff000000 000000a8
!	%l2 = 0000000000000000, imm = ffffffffffffffdf, %l4 = 0000000000000000
	xor	%l2,-0x021,%l4		! %l4 = ffffffffffffffdf
!	Mem[0000000030001400] = ffc60000, %f17 = ff0000ff
	lda	[%i0+%g0]0x81,%f17	! %f17 = ffc60000
!	Starting 10 instruction Store Burst
!	%l2 = 0000000000000000, %l2 = 0000000000000000, %l6  = 0000000000000000
	mulx	%l2,%l2,%l6		! %l6 = 0000000000000000

p0_label_138:
!	Mem[000000001014142c] = ff4d8b1f, %l2 = 00000000, %l5 = 00000000
	add	%i5,0x2c,%g1
	casa	[%g1]0x80,%l2,%l5	! %l5 = 00000000ff4d8b1f
!	Mem[0000000010001408] = ff000000, %l3 = 0000000000000000
	swapa	[%i0+%o4]0x80,%l3	! %l3 = 00000000ff000000
!	%f0  = 00000000, Mem[0000000030101400] = ffffffff
	sta	%f0 ,[%i4+%g0]0x89	! Mem[0000000030101400] = 00000000
!	%l2 = 00000000, %l3 = ff000000, Mem[0000000030041400] = 00000000 000000ad
	stda	%l2,[%i1+%g0]0x89	! Mem[0000000030041400] = 00000000 ff000000
!	Mem[0000000030181408] = 056fadff, %l6 = 0000000000000000
	swapa	[%i6+%o4]0x81,%l6	! %l6 = 00000000056fadff
!	%l3 = 00000000ff000000, Mem[0000000030041400] = 00000000
	stha	%l3,[%i1+%g0]0x81	! Mem[0000000030041400] = 00000000
!	%l2 = 0000000000000000, Mem[0000000030141408] = 00000000
	stwa	%l2,[%i5+%o4]0x81	! Mem[0000000030141408] = 00000000
!	%f18 = 918960f8 ece279ff, %l6 = 00000000056fadff
!	Mem[00000000100c1410] = 00ffff0000000084
	add	%i3,0x010,%g1
	stda	%f18,[%g1+%l6]ASI_PST8_PL ! Mem[00000000100c1410] = ff79e2ecf8608991
!	Mem[0000000010041400] = ff79e2ec, %l6 = 00000000056fadff, %asi = 80
	swapa	[%i1+0x000]%asi,%l6	! %l6 = 00000000ff79e2ec
!	Starting 10 instruction Load Burst
!	Mem[00000000218000c0] = fff64e5b, %l1 = 0000000000000000
	ldsha	[%o3+0x0c0]%asi,%l1	! %l1 = fffffffffffffff6

p0_label_139:
!	Mem[0000000010101400] = 00000000, %l5 = 00000000ff4d8b1f
	ldswa	[%i4+%g0]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000030181410] = ad8ce102, %l1 = fffffffffffffff6
	lduba	[%i6+%o5]0x81,%l1	! %l1 = 00000000000000ad
!	Mem[0000000010001410] = 00000000, %l5 = 0000000000000000
	lduha	[%i0+%o5]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000030081408] = b400ffff 060737ff, %l4 = ffffffdf, %l5 = 00000000
	ldda	[%i2+%o4]0x89,%l4	! %l4 = 00000000060737ff 00000000b400ffff
!	Mem[0000000030101408] = 052dfec6, %f2  = ff000000
	lda	[%i4+%o4]0x81,%f2 	! %f2 = 052dfec6
!	Mem[0000000030041410] = 759c090c ece279ff, %l6 = ff79e2ec, %l7 = 000000ff
	ldda	[%i1+%o5]0x89,%l6	! %l6 = 00000000ece279ff 00000000759c090c
!	Mem[0000000030041400] = 00000000, %l2 = 0000000000000000
	lduba	[%i1+%g0]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000010041410] = ff000000000000a8, %l6 = 00000000ece279ff
	ldx	[%i1+%o5],%l6		! %l6 = ff000000000000a8
!	Code Fragment 4
p0_fragment_16:
!	%l0 = 000000000f633ca8
	setx	0x509d295067ec9371,%g7,%l0 ! %l0 = 509d295067ec9371
!	%l1 = 00000000000000ad
	setx	0xeb385cd7c923e530,%g7,%l1 ! %l1 = eb385cd7c923e530
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 509d295067ec9371
	setx	0xa19e7df7d1ee0ee5,%g7,%l0 ! %l0 = a19e7df7d1ee0ee5
!	%l1 = eb385cd7c923e530
	setx	0xef233c3fb199d047,%g7,%l1 ! %l1 = ef233c3fb199d047
!	Starting 10 instruction Store Burst
!	%l2 = 0000000000000000, %l5 = 00000000b400ffff, %l3 = 00000000ff000000
	andn	%l2,%l5,%l3		! %l3 = 0000000000000000

p0_label_140:
!	Mem[0000000030041400] = 00000000, %l6 = ff000000000000a8
	swapa	[%i1+%g0]0x81,%l6	! %l6 = 0000000000000000
!	%l1 = ef233c3fb199d047, Mem[0000000030141400] = 7e000000a83c630f
	stxa	%l1,[%i5+%g0]0x89	! Mem[0000000030141400] = ef233c3fb199d047
!	%l0 = a19e7df7d1ee0ee5, Mem[0000000010041410] = ff000000
	stwa	%l0,[%i1+%o5]0x80	! Mem[0000000010041410] = d1ee0ee5
!	%f25 = 0787ce67, Mem[0000000030001408] = 87a255b1
	sta	%f25,[%i0+%o4]0x81	! Mem[0000000030001408] = 0787ce67
!	%l1 = ef233c3fb199d047, Mem[0000000010181410] = ff000000
	stwa	%l1,[%i6+%o5]0x88	! Mem[0000000010181410] = b199d047
!	%l0 = a19e7df7d1ee0ee5, Mem[0000000010141400] = ff7e51ff
	stba	%l0,[%i5+%g0]0x88	! Mem[0000000010141400] = ff7e51e5
!	Mem[0000000010081400] = ff0000ff, %l6 = 0000000000000000
	swapa	[%i2+%g0]0x88,%l6	! %l6 = 00000000ff0000ff
!	%l3 = 0000000000000000, Mem[0000000030041410] = ff79e2ec
	stha	%l3,[%i1+%o5]0x81	! Mem[0000000030041410] = 0000e2ec
!	Mem[0000000030081410] = ffffffff, %l4 = 00000000060737ff
	swapa	[%i2+%o5]0x81,%l4	! %l4 = 00000000ffffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001438] = 33f371b2056fad8c, %f28 = d69a5aa8 ff00ff7e
	ldd	[%i0+0x038],%f28	! %f28 = 33f371b2 056fad8c

p0_label_141:
!	Mem[0000000010081410] = 00000000, %f4  = ff00ff00
	lda	[%i2+%o5]0x80,%f4 	! %f4 = 00000000
!	Mem[0000000030181408] = 00000000, %l1 = ef233c3fb199d047
	lduba	[%i6+%o4]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000010081424] = 1100ff00, %l1 = 0000000000000000
	lduw	[%i2+0x024],%l1		! %l1 = 000000001100ff00
!	Mem[00000000300c1408] = 0000000000000000, %f20 = 00000000 00000000
	ldda	[%i3+%o4]0x81,%f20	! %f20 = 00000000 00000000
!	Mem[00000000100c1408] = 00000000, %l7 = 00000000759c090c
	lduha	[%i3+%o4]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000030141408] = 0000000032b0aa8b, %l1 = 000000001100ff00
	ldxa	[%i5+%o4]0x81,%l1	! %l1 = 0000000032b0aa8b
!	Mem[0000000030001410] = a83c630f, %l5 = 00000000b400ffff
	lduba	[%i0+%o5]0x89,%l5	! %l5 = 000000000000000f
!	Mem[0000000010001408] = 00000000, %l6 = 00000000ff0000ff
	lduha	[%i0+%o4]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000010081408] = ece279ff, %l7 = 0000000000000000
	ldsha	[%i2+%o4]0x88,%l7	! %l7 = 00000000000079ff
!	Starting 10 instruction Store Burst
!	%l1 = 0000000032b0aa8b, Mem[00000000300c1408] = 00000000
	stwa	%l1,[%i3+%o4]0x89	! Mem[00000000300c1408] = 32b0aa8b

p0_label_142:
!	%f24 = 00000011 0787ce67, Mem[0000000010141408] = 056fadff bff39cf1
	stda	%f24,[%i5+%o4]0x88	! Mem[0000000010141408] = 00000011 0787ce67
!	%l1 = 0000000032b0aa8b, Mem[0000000030101410] = ffff6f05
	stwa	%l1,[%i4+%o5]0x81	! Mem[0000000030101410] = 32b0aa8b
!	%f21 = 00000000, Mem[00000000100c1408] = 00000000
	sta	%f21,[%i3+%o4]0x88	! Mem[00000000100c1408] = 00000000
!	Mem[0000000010101429] = 00000000, %l1 = 0000000032b0aa8b
	ldstuba	[%i4+0x029]%asi,%l1	! %l1 = 00000000000000ff
!	%f28 = 33f371b2 056fad8c, Mem[0000000030001410] = a83c630f 7e000000
	stda	%f28,[%i0+%o5]0x89	! Mem[0000000030001410] = 33f371b2 056fad8c
!	%f14 = 70db00d2 9302b615, %l2 = 0000000000000000
!	Mem[0000000030001410] = 8cad6f05b271f333
	add	%i0,0x010,%g1
	stda	%f14,[%g1+%l2]ASI_PST32_S ! Mem[0000000030001410] = 8cad6f05b271f333
!	%l1 = 0000000000000000, %l0 = a19e7df7d1ee0ee5, %l6 = 0000000000000000
	subc	%l1,%l0,%l6		! %l6 = 5e6182082e11f11b
!	%l5 = 000000000000000f, Mem[0000000010081410] = 00000000
	stba	%l5,[%i2+%o5]0x88	! Mem[0000000010081410] = 0000000f
!	%f22 = 0000c6ff, Mem[00000000100c1400] = 00000000
	sta	%f22,[%i3+0x000]%asi	! Mem[00000000100c1400] = 0000c6ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = 00000000, %l0 = a19e7df7d1ee0ee5
	lduha	[%i6+%o4]0x89,%l0	! %l0 = 0000000000000000

p0_label_143:
!	Mem[0000000030101408] = c6fe2d05, %l6 = 5e6182082e11f11b
	ldswa	[%i4+%o4]0x89,%l6	! %l6 = ffffffffc6fe2d05
!	Mem[0000000010141400] = e5517eff, %l0 = 0000000000000000
	ldsha	[%i5+%g0]0x80,%l0	! %l0 = ffffffffffffe551
!	Mem[00000000300c1408] = 8baab032, %l0 = ffffffffffffe551
	lduha	[%i3+%o4]0x81,%l0	! %l0 = 0000000000008baa
!	Mem[0000000010081400] = 00000000, %l0 = 0000000000008baa
	lduwa	[%i2+%g0]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000030081400] = 37000000, %l5 = 000000000000000f
	lduwa	[%i2+%g0]0x89,%l5	! %l5 = 0000000037000000
!	Mem[0000000030081408] = ff370706, %l5 = 0000000037000000
	lduwa	[%i2+%o4]0x81,%l5	! %l5 = 00000000ff370706
!	Mem[0000000010001408] = 00000000, %l4 = 00000000ffffffff
	lduwa	[%i0+%o4]0x80,%l4	! %l4 = 0000000000000000
!	%f19 = ece279ff, %f6  = d5edeaba, %f27 = ff000000
	fadds	%f19,%f6 ,%f27		! %f27 = ece279ff
!	Mem[000000001010142c] = ffffffff, %l2 = 0000000000000000
	ldub	[%i4+0x02c],%l2		! %l2 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%f18 = 918960f8 ece279ff, %l3 = 0000000000000000
!	Mem[0000000010041438] = 00000000ff00002a
	add	%i1,0x038,%g1
	stda	%f18,[%g1+%l3]ASI_PST8_PL ! Mem[0000000010041438] = 00000000ff00002a

p0_label_144:
!	%l4 = 0000000000000000, Mem[000000001008140a] = ff79e2ec, %asi = 80
	stba	%l4,[%i2+0x00a]%asi	! Mem[0000000010081408] = ff7900ec
!	%f1  = 00000000, %f1  = 00000000
	fsqrts	%f1 ,%f1 		! %f1  = 00000000
!	%l7 = 00000000000079ff, Mem[00000000300c1408] = 8baab03200000000
	stxa	%l7,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00000000000079ff
!	%l5 = 00000000ff370706, Mem[00000000100c1400] = ffc60000
	stba	%l5,[%i3+%g0]0x88	! Mem[00000000100c1400] = ffc60006
!	%f22 = 0000c6ff, Mem[0000000030101400] = 00000000
	sta	%f22,[%i4+%g0]0x89	! Mem[0000000030101400] = 0000c6ff
!	Mem[00000000201c0000] = ffff5a4a, %l6 = ffffffffc6fe2d05
	lduba	[%o0+0x001]%asi,%l6	! %l6 = 00000000000000ff
!	%l1 = 0000000000000000, Mem[0000000010101410] = ff5a9aff
	stha	%l1,[%i4+%o5]0x88	! Mem[0000000010101410] = ff5a0000
!	%l2 = 000000ff, %l3 = 00000000, Mem[0000000010041410] = d1ee0ee5 000000a8
	stda	%l2,[%i1+%o5]0x80	! Mem[0000000010041410] = 000000ff 00000000
!	%l7 = 00000000000079ff, Mem[0000000010181438] = 724869eb000000ff, %asi = 80
	stxa	%l7,[%i6+0x038]%asi	! Mem[0000000010181438] = 00000000000079ff
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (20)
!	Mem[0000000010041400] = 056fadff ece279ff ff000000 061ac655
!	Mem[0000000010041410] = 000000ff 00000000 c77babee 000000ff
!	Mem[0000000010041420] = 00000000 0000007e 000000ff ffa7ffff
!	Mem[0000000010041430] = 1b707ea8 ffff00b4 00000000 ff00002a
	ldda	[%i1]ASI_BLK_P,%f16	! Block Load from 0000000010041400

p0_label_145:
!	Mem[0000000030141410] = 759c090c 9a000000, %l6 = 000000ff, %l7 = 000079ff
	ldda	[%i5+%o5]0x89,%l6	! %l6 = 000000009a000000 00000000759c090c
!	Mem[0000000030141400] = b199d047, %l5 = 00000000ff370706
	ldsha	[%i5+%g0]0x89,%l5	! %l5 = ffffffffffffd047
!	Mem[0000000010141400] = e5517eff00000000, %l5 = ffffffffffffd047
	ldxa	[%i5+%g0]0x80,%l5	! %l5 = e5517eff00000000
!	Mem[0000000010041408] = 000000ff, %l2 = 00000000000000ff
	lduha	[%i1+%o4]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030041400] = 000000a8 000000ff, %l6 = 9a000000, %l7 = 759c090c
	ldda	[%i1+%g0]0x81,%l6	! %l6 = 00000000000000a8 00000000000000ff
!	Mem[00000000100c1434] = ffff9744, %l4 = 0000000000000000
	ldsw	[%i3+0x034],%l4		! %l4 = ffffffffffff9744
!	Mem[0000000010101410] = 00005aff, %l5 = e5517eff00000000
	ldsba	[%i4+%o5]0x80,%l5	! %l5 = 0000000000000000
!	Mem[000000001008142c] = 9020fb0b, %l6 = 00000000000000a8
	lduha	[%i2+0x02e]%asi,%l6	! %l6 = 000000000000fb0b
!	Mem[0000000010141408] = 67ce870711000000, %l6 = 000000000000fb0b
	ldxa	[%i5+%o4]0x80,%l6	! %l6 = 67ce870711000000
!	Starting 10 instruction Store Burst
!	%l2 = 000000ff, %l3 = 00000000, Mem[0000000010081400] = 00000000 00000000
	stda	%l2,[%i2+0x000]%asi	! Mem[0000000010081400] = 000000ff 00000000

p0_label_146:
!	%f0  = 00000000, Mem[0000000010141410] = ffffffff
	sta	%f0 ,[%i5+%o5]0x80	! Mem[0000000010141410] = 00000000
!	%l5 = 0000000000000000, Mem[00000000100c1408] = 0000000000000000
	stxa	%l5,[%i3+%o4]0x80	! Mem[00000000100c1408] = 0000000000000000
!	Mem[0000000010141410] = 00000000, %l3 = 0000000000000000
	ldstuba	[%i5+%o5]0x80,%l3	! %l3 = 00000000000000ff
!	%l7 = 00000000000000ff, Mem[0000000030041400] = a8000000
	stba	%l7,[%i1+%g0]0x89	! Mem[0000000030041400] = a80000ff
!	%f2  = 052dfec6 00000000, Mem[0000000030081410] = 060737ff 00000000
	stda	%f2 ,[%i2+%o5]0x81	! Mem[0000000030081410] = 052dfec6 00000000
!	Code Fragment 3
p0_fragment_17:
!	%l0 = 0000000000000000
	setx	0x0f31c0607e9ab1ce,%g7,%l0 ! %l0 = 0f31c0607e9ab1ce
!	%l1 = 0000000000000000
	setx	0xaf60b058731fc74f,%g7,%l1 ! %l1 = af60b058731fc74f
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 0f31c0607e9ab1ce
	setx	0x4c90892faf70d1f8,%g7,%l0 ! %l0 = 4c90892faf70d1f8
!	%l1 = af60b058731fc74f
	setx	0x8d2e47b7feea2503,%g7,%l1 ! %l1 = 8d2e47b7feea2503
!	%l7 = 00000000000000ff, Mem[00000000100c1400] = ffc60006
	stba	%l7,[%i3+%g0]0x88	! Mem[00000000100c1400] = ffc600ff
!	%l6 = 67ce870711000000, %l0 = 4c90892faf70d1f8, %l5  = 0000000000000000
	mulx	%l6,%l0,%l5		! %l5 = 330603b978000000
!	Mem[0000000030041410] = 0000e2ec, %l5 = 330603b978000000
	ldstuba	[%i1+%o5]0x81,%l5	! %l5 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = 052dfec6 ad8c0000, %l4 = ffff9744, %l5 = 00000000
	ldda	[%i1+%o4]0x81,%l4	! %l4 = 00000000052dfec6 00000000ad8c0000

p0_label_147:
!	Mem[0000000030181410] = 02e18cad, %f15 = 9302b615
	lda	[%i6+%o5]0x89,%f15	! %f15 = 02e18cad
!	Mem[0000000030101400] = ffc6000000000000, %f10 = 55c61a06 000000ff
	ldda	[%i4+%g0]0x81,%f10	! %f10 = ffc60000 00000000
!	Mem[0000000010141408] = 67ce870711000000, %f0  = 00000000 00000000
	ldda	[%i5+%o4]0x80,%f0 	! %f0  = 67ce8707 11000000
!	Mem[00000000300c1408] = 00000000, %l5 = 00000000ad8c0000
	ldswa	[%i3+%o4]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000010181410] = 47d099b1, %l3 = 0000000000000000
	lduha	[%i6+%o5]0x80,%l3	! %l3 = 00000000000047d0
!	Mem[0000000030041408] = 052dfec6, %l0 = 4c90892faf70d1f8
	lduwa	[%i1+%o4]0x81,%l0	! %l0 = 00000000052dfec6
!	Mem[0000000030041410] = ece200ff, %l3 = 00000000000047d0
	lduba	[%i1+%o5]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[00000000201c0000] = ffff5a4a, %l6 = 67ce870711000000
	lduh	[%o0+%g0],%l6		! %l6 = 000000000000ffff
!	Mem[0000000010041410] = 00000000ff000000, %f30 = 00000000 ff00002a
	ldda	[%i1+%o5]0x88,%f30	! %f30 = 00000000 ff000000
!	Starting 10 instruction Store Burst
!	%l1 = 8d2e47b7feea2503, Mem[0000000010081400] = ff000000
	stha	%l1,[%i2+%g0]0x88	! Mem[0000000010081400] = ff002503

p0_label_148:
!	%l5 = 0000000000000000, Mem[000000001018143e] = 000079ff
	sth	%l5,[%i6+0x03e]		! Mem[000000001018143c] = 00000000
!	%f17 = ece279ff, %f30 = 00000000, %f8  = 87a255b1 056fffff
	fsmuld	%f17,%f30,%f8 		! %f8  = 80000000 00000000
!	%f24 = 00000000 0000007e, Mem[0000000030181410] = ad8ce102 39b33186
	stda	%f24,[%i6+%o5]0x81	! Mem[0000000030181410] = 00000000 0000007e
!	%l6 = 0000ffff, %l7 = 000000ff, Mem[0000000010101418] = b8f69713 9744ff29
	stda	%l6,[%i4+0x018]%asi	! Mem[0000000010101418] = 0000ffff 000000ff
!	Mem[0000000010081400] = ff002503, %l6 = 000000000000ffff
	ldstuba	[%i2+%g0]0x88,%l6	! %l6 = 00000003000000ff
!	%f3  = 00000000, Mem[0000000010001400] = ffffffff
	sta	%f3 ,[%i0+%g0]0x80	! Mem[0000000010001400] = 00000000
!	%l7 = 00000000000000ff, Mem[0000000010181410] = a87e701bb199d047
	stxa	%l7,[%i6+%o5]0x88	! Mem[0000000010181410] = 00000000000000ff
!	%l2 = 00000000000000ff, Mem[0000000030081410] = 052dfec600000000
	stxa	%l2,[%i2+%o5]0x81	! Mem[0000000030081410] = 00000000000000ff
!	Mem[0000000010181410] = ff000000, %l2 = 00000000000000ff
	swapa	[%i6+%o5]0x80,%l2	! %l2 = 00000000ff000000
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = ff79e2ec, %l4 = 00000000052dfec6
	ldswa	[%i3+%o5]0x80,%l4	! %l4 = ffffffffff79e2ec

p0_label_149:
!	Mem[000000001008141c] = ffc60000, %l7 = 00000000000000ff
	ldsba	[%i2+0x01c]%asi,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000030001410] = 8cad6f05, %l6 = 0000000000000003
	ldsha	[%i0+%o5]0x81,%l6	! %l6 = ffffffffffff8cad
!	Mem[0000000020800040] = ad00fa54, %l1 = 8d2e47b7feea2503
	lduha	[%o1+0x040]%asi,%l1	! %l1 = 000000000000ad00
!	Mem[00000000100c1410] = ece279ff, %l1 = 000000000000ad00
	ldsba	[%i3+%o5]0x88,%l1	! %l1 = ffffffffffffffff
!	Mem[00000000100c1410] = 918960f8ece279ff, %f24 = 00000000 0000007e
	ldda	[%i3+%o5]0x88,%f24	! %f24 = 918960f8 ece279ff
!	Mem[0000000010181408] = 32b0aa8b, %l3 = 00000000000000ff
	ldswa	[%i6+%o4]0x88,%l3	! %l3 = 0000000032b0aa8b
!	Mem[0000000010081408] = ff7900ec, %l5 = 0000000000000000
	lduba	[%i2+%o4]0x80,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010101418] = 0000ffff, %l4 = ffffffffff79e2ec
	ldsw	[%i4+0x018],%l4		! %l4 = 000000000000ffff
!	Mem[0000000030081408] = 060737ff, %l2 = 00000000ff000000
	ldsba	[%i2+%o4]0x89,%l2	! %l2 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l0 = 00000000052dfec6, Mem[0000000020800000] = ffffa5fa, %asi = 80
	stba	%l0,[%o1+0x000]%asi	! Mem[0000000020800000] = c6ffa5fa

p0_label_150:
!	%f4  = 00000000, Mem[00000000300c1410] = a83c630f
	sta	%f4 ,[%i3+%o5]0x89	! Mem[00000000300c1410] = 00000000
!	%l2 = ffffffffffffffff, Mem[00000000100c1418] = d5edeaba
	stw	%l2,[%i3+0x018]		! Mem[00000000100c1418] = ffffffff
!	%l3 = 0000000032b0aa8b, Mem[0000000030081410] = 00000000
	stba	%l3,[%i2+%o5]0x81	! Mem[0000000030081410] = 8b000000
!	Mem[0000000030101408] = c6fe2d05, %l4 = 000000000000ffff
	ldstuba	[%i4+%o4]0x89,%l4	! %l4 = 00000005000000ff
!	Mem[0000000010181408] = 32b0aa8b, %l3 = 0000000032b0aa8b
	ldstuba	[%i6+%o4]0x88,%l3	! %l3 = 0000008b000000ff
!	Mem[0000000010041410] = 000000ff, %l0 = 00000000052dfec6
	ldstuba	[%i1+%o5]0x80,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010141408] = 67ce8707, %l3 = 000000000000008b
	swapa	[%i5+%o4]0x80,%l3	! %l3 = 0000000067ce8707
!	%l6 = ffffffffffff8cad, Mem[0000000010001410] = 00000000ff1ac6ff
	stxa	%l6,[%i0+%o5]0x80	! Mem[0000000010001410] = ffffffffffff8cad
!	%f5  = 00ffff00, %f2  = 052dfec6, %f21 = 00000000
	fmuls	%f5 ,%f2 ,%f21		! %f21 = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = 7e00364a, %l7 = ffffffffffffffff
	ldswa	[%i6+%g0]0x80,%l7	! %l7 = 000000007e00364a

p0_label_151:
!	Mem[00000000300c1408] = 00000000, %l6 = ffffffffffff8cad
	lduwa	[%i3+%o4]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000020800040] = ad00fa54, %l7 = 000000007e00364a
	lduh	[%o1+0x040],%l7		! %l7 = 000000000000ad00
!	Mem[0000000010141408] = 0000008b 11000000, %l6 = 00000000, %l7 = 0000ad00
	ldda	[%i5+%o4]0x80,%l6	! %l6 = 000000000000008b 0000000011000000
!	Mem[0000000010181410] = ff000000, %l1 = ffffffffffffffff
	ldsha	[%i6+%o5]0x88,%l1	! %l1 = 0000000000000000
!	Mem[000000001018140c] = ffffffff, %l4 = 0000000000000005
	ldsb	[%i6+0x00d],%l4		! %l4 = ffffffffffffffff
!	Mem[0000000010101428] = 00ff0000ffffffff, %l1 = 0000000000000000
	ldxa	[%i4+0x028]%asi,%l1	! %l1 = 00ff0000ffffffff
!	Mem[0000000030001400] = ffc60000 00000000, %l4 = ffffffff, %l5 = 000000ff
	ldda	[%i0+%g0]0x81,%l4	! %l4 = 00000000ffc60000 0000000000000000
!	Mem[0000000030041410] = 759c090cece200ff, %f22 = c77babee 000000ff
	ldda	[%i1+%o5]0x89,%f22	! %f22 = 759c090c ece200ff
!	Mem[0000000030001400] = ffc60000, %l2 = ffffffffffffffff
	ldsba	[%i0+%g0]0x81,%l2	! %l2 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%f18 = ff000000, Mem[00000000100c1410] = ece279ff
	sta	%f18,[%i3+%o5]0x88	! Mem[00000000100c1410] = ff000000

p0_label_152:
!	%l6 = 000000000000008b, Mem[0000000030001400] = 0000c6ff
	stha	%l6,[%i0+%g0]0x89	! Mem[0000000030001400] = 0000008b
!	%f6  = d5edeaba, %f18 = ff000000
	fcmpes	%fcc0,%f6 ,%f18		! %fcc0 = 2
!	%l5 = 0000000000000000, Mem[0000000021800001] = b4268a92, %asi = 80
	stba	%l5,[%o3+0x001]%asi	! Mem[0000000021800000] = b4008a92
!	%l0 = 0000000000000000, Mem[00000000300c1410] = 00000000
	stha	%l0,[%i3+%o5]0x89	! Mem[00000000300c1410] = 00000000
!	%l6 = 000000000000008b, Mem[0000000010001410] = ffffffff
	stba	%l6,[%i0+%o5]0x80	! Mem[0000000010001410] = 8bffffff
!	%l2 = ffffffffffffffff, %l0 = 0000000000000000, %l4 = 00000000ffc60000
	sdivx	%l2,%l0,%l4		! %l4 = 00000000ffc60000
!	Mem[0000000010001410] = ffffff8b, %l5 = 0000000000000000
	swapa	[%i0+%o5]0x88,%l5	! %l5 = 00000000ffffff8b
!	Mem[0000000010081428] = 000000ff, %l0 = 0000000000000028, %asi = 80
	swapa	[%i2+0x028]%asi,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030181400] = 00000000, %l1 = 00ff0000ffffffff
	ldstuba	[%i6+%g0]0x89,%l1	! %l1 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = 8baab03200000000, %f6  = d5edeaba fff0bb9c
	ldda	[%i5+%o4]0x89,%f6 	! %f6  = 8baab032 00000000

p0_label_153:
!	Mem[0000000010041408] = ff000000, %f11 = 00000000
	lda	[%i1+%o4]0x80,%f11	! %f11 = ff000000
!	Mem[0000000010101400] = 00000000 ff79e2ec, %l4 = ffc60000, %l5 = ffffff8b
	ldda	[%i4+%g0]0x80,%l4	! %l4 = 0000000000000000 00000000ff79e2ec
!	Mem[0000000010001414] = ffff8cad, %l5 = 00000000ff79e2ec
	ldsw	[%i0+0x014],%l5		! %l5 = ffffffffffff8cad
!	Mem[0000000010101400] = 00000000, %l6 = 000000000000008b
	lduha	[%i4+%g0]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000030001408] = 0787ce67, %l0 = 00000000000000ff
	lduba	[%i0+%o4]0x81,%l0	! %l0 = 0000000000000007
!	%l3 = 0000000067ce8707, Mem[0000000010001420] = 0c099c75
	stw	%l3,[%i0+0x020]		! Mem[0000000010001420] = 67ce8707
!	Mem[00000000300c1400] = 0000000f, %f15 = 02e18cad
	lda	[%i3+%g0]0x89,%f15	! %f15 = 0000000f
!	Mem[0000000030001408] = 67ce8707, %l3 = 0000000067ce8707
	ldsha	[%i0+%o4]0x89,%l3	! %l3 = ffffffffffff8707
!	Mem[0000000030001408] = 0787ce67, %l6 = 0000000000000000
	lduwa	[%i0+%o4]0x81,%l6	! %l6 = 000000000787ce67
!	Starting 10 instruction Store Burst
!	Mem[0000000010181410] = 000000ff, %l1 = 0000000000000000
	ldstuba	[%i6+%o5]0x80,%l1	! %l1 = 00000000000000ff

p0_label_154:
!	Mem[0000000010101408] = d69a5aa8, %l2 = ffffffffffffffff
	ldstuba	[%i4+%o4]0x88,%l2	! %l2 = 000000a8000000ff
!	Mem[0000000010041410] = ff0000ff, %l4 = 0000000000000000
	swapa	[%i1+%o5]0x88,%l4	! %l4 = 00000000ff0000ff
	membar	#Sync			! Added by membar checker (21)
!	%l1 = 0000000000000000, Mem[0000000010041410] = 0000000000000000
	stxa	%l1,[%i1+%o5]0x80	! Mem[0000000010041410] = 0000000000000000
!	Mem[0000000010001408] = 00000000, %l1 = 0000000000000000
	ldstuba	[%i0+%o4]0x80,%l1	! %l1 = 00000000000000ff
!	%l3 = ffffffffffff8707, Mem[00000000300c1400] = 5c3e61d30000000f
	stxa	%l3,[%i3+%g0]0x89	! Mem[00000000300c1400] = ffffffffffff8707
!	Mem[00000000100c1410] = ff000000, %l6 = 000000000787ce67
	ldstuba	[%i3+%o5]0x88,%l6	! %l6 = 00000000000000ff
!	%l0 = 0000000000000007, Mem[0000000020800040] = ad00fa54, %asi = 80
	stha	%l0,[%o1+0x040]%asi	! Mem[0000000020800040] = 0007fa54
!	%l0 = 0000000000000007, Mem[0000000010181408] = ffaab032
	stba	%l0,[%i6+%o4]0x80	! Mem[0000000010181408] = 07aab032
!	%l2 = 00000000000000a8, Mem[0000000010081400] = ff0025ff
	stba	%l2,[%i2+%g0]0x88	! Mem[0000000010081400] = ff0025a8
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = 00000037, %l3 = ffffffffffff8707
	ldswa	[%i2+%g0]0x81,%l3	! %l3 = 0000000000000037

p0_label_155:
!	Mem[00000000300c1410] = 00000000, %l4 = 00000000ff0000ff
	lduha	[%i3+%o5]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000030181410] = 00000000, %l4 = 0000000000000000
	lduba	[%i6+%o5]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000010081408] = ec0079ff, %l2 = 00000000000000a8
	lduba	[%i2+%o4]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010081434] = a85a9ad6, %l2 = 00000000000000ff
	ldsha	[%i2+0x036]%asi,%l2	! %l2 = ffffffffffff9ad6
!	Mem[00000000300c1410] = 00000000, %l1 = 0000000000000000
	lduba	[%i3+%o5]0x81,%l1	! %l1 = 0000000000000000
!	%f9  = 00000000, %f0  = 67ce8707
	fcmpes	%fcc1,%f9 ,%f0 		! %fcc1 = 1
!	Mem[00000000100c1410] = ff0000ff, %l1 = 0000000000000000
	lduha	[%i3+%o5]0x80,%l1	! %l1 = 000000000000ff00
!	%l5 = ffffffffffff8cad, imm = 00000000000003d7, %l7 = 0000000011000000
	orn	%l5,0x3d7,%l7		! %l7 = fffffffffffffcad
!	Mem[0000000030041408] = 052dfec6ad8c0000, %l1 = 000000000000ff00
	ldxa	[%i1+%o4]0x81,%l1	! %l1 = 052dfec6ad8c0000
!	Starting 10 instruction Store Burst
!	%l6 = 0000000000000000, Mem[0000000010141408] = 0000008b
	stba	%l6,[%i5+%o4]0x80	! Mem[0000000010141408] = 0000008b

p0_label_156:
!	%l6 = 0000000000000000, Mem[0000000030081400] = 37000000
	stba	%l6,[%i2+%g0]0x89	! Mem[0000000030081400] = 37000000
!	Mem[0000000010081400] = a82500ff, %l7 = fffffffffffffcad
	swapa	[%i2+%g0]0x80,%l7	! %l7 = 00000000a82500ff
!	%l5 = ffffffffffff8cad, Mem[0000000030101410] = 32b0aa8b1b707ea8
	stxa	%l5,[%i4+%o5]0x81	! Mem[0000000030101410] = ffffffffffff8cad
!	%l2 = ffffffffffff9ad6, Mem[000000001000141c] = 000000ff
	sth	%l2,[%i0+0x01c]		! Mem[000000001000141c] = 9ad600ff
!	Mem[0000000010001400] = 00000000, %l3 = 0000000000000037
	swapa	[%i0+%g0]0x88,%l3	! %l3 = 0000000000000000
!	%f7  = 00000000, Mem[0000000030001410] = 056fad8c
	sta	%f7 ,[%i0+%o5]0x89	! Mem[0000000030001410] = 00000000
!	%l1 = 052dfec6ad8c0000, Mem[00000000211c0000] = ffffcd80, %asi = 80
	stha	%l1,[%o2+0x000]%asi	! Mem[00000000211c0000] = 0000cd80
!	%l2 = ffff9ad6, %l3 = 00000000, Mem[0000000010001410] = 00000000 ffff8cad
	stda	%l2,[%i0+%o5]0x80	! Mem[0000000010001410] = ffff9ad6 00000000
!	Mem[0000000030001410] = 00000000, %l3 = 0000000000000000
	ldstuba	[%i0+%o5]0x81,%l3	! %l3 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = 32b0aa07, %l6 = 0000000000000000
	ldsha	[%i6+%o4]0x88,%l6	! %l6 = ffffffffffffaa07

p0_label_157:
!	Mem[0000000030001408] = 67ce8707, %f2  = 052dfec6
	lda	[%i0+%o4]0x89,%f2 	! %f2 = 67ce8707
!	%f22 = 759c090c, %f3  = 00000000, %f15 = 0000000f
	fdivs	%f22,%f3 ,%f15		! %f15 = 7f800000
!	Mem[0000000030141400] = 47d099b1, %l0 = 0000000000000007
	ldswa	[%i5+%g0]0x81,%l0	! %l0 = 0000000047d099b1
!	%l6 = ffffffffffffaa07, immed = 00000ab7, %y  = 000000ff
	smul	%l6,0xab7,%l7		! %l7 = fffffffffc66d101, %y = ffffffff
!	Mem[0000000010081408] = ec0079ff, %l5 = ffffffffffff8cad
	lduwa	[%i2+%o4]0x88,%l5	! %l5 = 00000000ec0079ff
!	Mem[0000000010141408] = 0000008b, %l5 = 00000000ec0079ff
	lduha	[%i5+%o4]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000010081408] = ff7900ec, %l1 = 052dfec6ad8c0000
	lduh	[%i2+%o4],%l1		! %l1 = 000000000000ff79
!	%l7 = fffffffffc66d101, %l3 = 0000000000000000, %l7 = fffffffffc66d101
	xnor	%l7,%l3,%l7		! %l7 = 0000000003992efe
!	Mem[00000000100c143c] = 9302b615, %f28 = 1b707ea8
	ld	[%i3+0x03c],%f28	! %f28 = 9302b615
!	Starting 10 instruction Store Burst
!	%l1 = 000000000000ff79, Mem[0000000010041400] = 056fadff
	stba	%l1,[%i1+%g0]0x80	! Mem[0000000010041400] = 796fadff

p0_label_158:
!	Mem[000000001000142c] = ff4d8b1f, %l3 = 0000000000000000, %asi = 80
	swapa	[%i0+0x02c]%asi,%l3	! %l3 = 00000000ff4d8b1f
!	%l4 = 0000000000000000, Mem[0000000030141410] = 0000009a
	stba	%l4,[%i5+%o5]0x81	! Mem[0000000030141410] = 0000009a
!	%f22 = 759c090c, Mem[00000000300c1410] = 00000000
	sta	%f22,[%i3+%o5]0x89	! Mem[00000000300c1410] = 759c090c
!	Mem[0000000010081400] = fffffcad, %l5 = 0000000000000000
	ldstuba	[%i2+%g0]0x80,%l5	! %l5 = 000000ff000000ff
!	Mem[00000000100c1428] = f8608991, %l0 = 0000000047d099b1
	ldsha	[%i3+0x02a]%asi,%l0	! %l0 = ffffffffffff8991
!	Mem[0000000010081400] = fffffcad, %l2 = ffffffffffff9ad6
	ldstuba	[%i2+%g0]0x80,%l2	! %l2 = 000000ff000000ff
!	%f30 = 00000000 ff000000, %l1 = 000000000000ff79
!	Mem[0000000030101428] = 129d217cb81e66a0
	add	%i4,0x028,%g1
	stda	%f30,[%g1+%l1]ASI_PST32_S ! Mem[0000000030101428] = 129d217cff000000
!	Mem[0000000010141408] = 0000008b, %l3 = 00000000ff4d8b1f
	ldstuba	[%i5+%o4]0x80,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030041400] = a80000ff, %l0 = ffffffffffff8991
	swapa	[%i1+%g0]0x89,%l0	! %l0 = 00000000a80000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = 00000000, %l1 = 000000000000ff79
	ldswa	[%i3+%o4]0x88,%l1	! %l1 = 0000000000000000

p0_label_159:
!	Mem[0000000010101400] = 00000000 ff79e2ec, %l6 = ffffaa07, %l7 = 03992efe
	ldda	[%i4+%g0]0x80,%l6	! %l6 = 0000000000000000 00000000ff79e2ec
!	Mem[0000000010141408] = 8b0000ff, %l4 = 0000000000000000
	ldsba	[%i5+%o4]0x88,%l4	! %l4 = ffffffffffffffff
!	Mem[000000001018143c] = 00000000, %f4  = 00000000
	ld	[%i6+0x03c],%f4 	! %f4 = 00000000
!	Mem[0000000030141410] = 9a000000, %f20 = 000000ff
	lda	[%i5+%o5]0x89,%f20	! %f20 = 9a000000
!	Mem[0000000030141408] = 00000000, %l0 = 00000000a80000ff
	lduha	[%i5+%o4]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000030081400] = 00000037, %l5 = 00000000000000ff
	lduha	[%i2+%g0]0x81,%l5	! %l5 = 0000000000000000
!	%l6 = 0000000000000000, imm = 00000000000008de, %l5 = 0000000000000000
	orn	%l6,0x8de,%l5		! %l5 = fffffffffffff721
!	Mem[000000001008140c] = f8608991, %l4 = ffffffffffffffff
	lduha	[%i2+0x00e]%asi,%l4	! %l4 = 0000000000008991
!	Mem[00000000300c1408] = 00000000, %f20 = 9a000000
	lda	[%i3+%o4]0x81,%f20	! %f20 = 00000000
!	Starting 10 instruction Store Burst
!	%l0 = 0000000000000000, Mem[0000000030101408] = 00008cadc6fe2dff
	stxa	%l0,[%i4+%o4]0x89	! Mem[0000000030101408] = 0000000000000000

p0_label_160:
!	Mem[0000000030081410] = 0000008b, %l2 = 00000000000000ff
	swapa	[%i2+%o5]0x89,%l2	! %l2 = 000000000000008b
!	%f3  = 00000000, Mem[0000000010081400] = fffffcad
	sta	%f3 ,[%i2+0x000]%asi	! Mem[0000000010081400] = 00000000
!	Mem[0000000010081400] = 00000000, %l3 = 0000000000000000
	swapa	[%i2+%g0]0x80,%l3	! %l3 = 0000000000000000
!	Mem[00000000100c1408] = 00000000, %l7 = 00000000ff79e2ec
	swapa	[%i3+%o4]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000030101408] = 00000000, %l7 = 0000000000000000
	ldstuba	[%i4+%o4]0x89,%l7	! %l7 = 00000000000000ff
!	%f8  = 80000000, %f23 = ece200ff, %f28 = 9302b615
	fdivs	%f8 ,%f23,%f28		! %f28 = 00000000
!	%l2 = 000000000000008b, Mem[0000000010081410] = 0000000f
	stha	%l2,[%i2+%o5]0x88	! Mem[0000000010081410] = 0000008b
!	%f8  = 80000000, Mem[0000000010081400] = 00000000
	sta	%f8 ,[%i2+%g0]0x88	! Mem[0000000010081400] = 80000000
!	%f20 = 00000000 00000000, Mem[0000000010141400] = e5517eff 00000000
	stda	%f20,[%i5+%g0]0x80	! Mem[0000000010141400] = 00000000 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000020800000] = c6ffa5fa, %l2 = 000000000000008b
	ldsh	[%o1+%g0],%l2		! %l2 = ffffffffffffc6ff

p0_label_161:
!	Mem[0000000010141410] = 000000ff, %l4 = 0000000000008991
	lduba	[%i5+%o5]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010001410] = d69affff, %l5 = fffffffffffff721
	ldsba	[%i0+%o5]0x88,%l5	! %l5 = ffffffffffffffff
!	%l1 = 0000000000000000, %l4 = 00000000000000ff, %l1 = 0000000000000000
	subc	%l1,%l4,%l1		! %l1 = ffffffffffffff01
!	Mem[0000000030001410] = 000000ff, %f30 = 00000000
	lda	[%i0+%o5]0x89,%f30	! %f30 = 000000ff
!	Mem[0000000020800000] = c6ffa5fa, %l0 = 0000000000000000
	ldsb	[%o1+0x001],%l0		! %l0 = ffffffffffffffff
!	Mem[0000000010181400] = 4a36007e, %l0 = ffffffffffffffff
	ldsba	[%i6+%g0]0x88,%l0	! %l0 = 000000000000007e
!	Mem[0000000030001408] = 0787ce67, %l1 = ffffffffffffff01
	ldswa	[%i0+%o4]0x81,%l1	! %l1 = 000000000787ce67
!	Mem[0000000010181400] = 4a36007e, %l3 = 0000000000000000
	lduha	[%i6+%g0]0x88,%l3	! %l3 = 000000000000007e
!	Mem[00000000300c1400] = 0787ffff ffffffff, %l2 = ffffc6ff, %l3 = 0000007e
	ldda	[%i3+%g0]0x81,%l2	! %l2 = 000000000787ffff 00000000ffffffff
!	Starting 10 instruction Store Burst
!	Mem[0000000010101400] = 00000000, %l1 = 000000000787ce67
	swapa	[%i4+%g0]0x88,%l1	! %l1 = 0000000000000000

p0_label_162:
!	%f20 = 00000000 00000000, %l4 = 00000000000000ff
!	Mem[00000000300c1410] = 0c099c75ffffff7e
	add	%i3,0x010,%g1
	stda	%f20,[%g1+%l4]ASI_PST32_SL ! Mem[00000000300c1410] = 0000000000000000
!	%l1 = 0000000000000000, Mem[00000000100c1400] = ff00c6ff00000000
	stxa	%l1,[%i3+%g0]0x80	! Mem[00000000100c1400] = 0000000000000000
!	%f24 = 918960f8 ece279ff, %l7 = 0000000000000000
!	Mem[0000000010141408] = ff00008b11000000
	add	%i5,0x008,%g1
	stda	%f24,[%g1+%l7]ASI_PST16_PL ! Mem[0000000010141408] = ff00008b11000000
!	Mem[0000000010181400] = 7e00364a, %l3 = 00000000ffffffff
	ldstuba	[%i6+%g0]0x80,%l3	! %l3 = 0000007e000000ff
!	Mem[0000000010101408] = d69a5aff, %l6 = 0000000000000000
	swapa	[%i4+%o4]0x88,%l6	! %l6 = 00000000d69a5aff
!	Mem[00000000100c1408] = ece279ff, %l5 = ffffffffffffffff
	swapa	[%i3+%o4]0x88,%l5	! %l5 = 00000000ece279ff
!	%l5 = 00000000ece279ff, Mem[0000000010081400] = 00000080
	stwa	%l5,[%i2+%g0]0x80	! Mem[0000000010081400] = ece279ff
!	Mem[0000000020800001] = c6ffa5fa, %l3 = 000000000000007e
	ldstuba	[%o1+0x001]%asi,%l3	! %l3 = 000000ff000000ff
!	Mem[0000000030001400] = 0000008b, %l7 = 0000000000000000
	swapa	[%i0+%g0]0x89,%l7	! %l7 = 000000000000008b
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = 07aab032ffffffff, %f10 = ffc60000 ff000000
	ldda	[%i6+%o4]0x80,%f10	! %f10 = 07aab032 ffffffff

p0_label_163:
!	Mem[0000000020800040] = 0007fa54, %l7 = 000000000000008b
	ldsba	[%o1+0x041]%asi,%l7	! %l7 = 0000000000000007
!	Mem[0000000010081410] = 0000008b, %l3 = 00000000000000ff
	ldsba	[%i2+%o5]0x88,%l3	! %l3 = ffffffffffffff8b
!	Mem[0000000030181410] = 00000000, %l5 = 00000000ece279ff
	ldswa	[%i6+%o5]0x81,%l5	! %l5 = 0000000000000000
!	%l0 = 000000000000007e, imm = fffffffffffff511, %l5 = 0000000000000000
	subc	%l0,-0xaef,%l5		! %l5 = 0000000000000b6d
!	Mem[0000000030041410] = 759c090cece200ff, %l3 = ffffffffffffff8b
	ldxa	[%i1+%o5]0x89,%l3	! %l3 = 759c090cece200ff
!	Mem[0000000010141400] = 00000000, %l5 = 0000000000000b6d
	ldsba	[%i5+%g0]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000030041410] = ece200ff, %l0 = 000000000000007e
	lduha	[%i1+%o5]0x89,%l0	! %l0 = 00000000000000ff
	membar	#Sync			! Added by membar checker (22)
!	Mem[0000000030141400] = 47d099b1 3f3c23ef 00000000 32b0aa8b
!	Mem[0000000030141410] = 0000009a 0c099c75 c3b425e0 64c40c3a
!	Mem[0000000030141420] = 32a75c28 447250aa ce685179 4a278aa9
!	Mem[0000000030141430] = 8297fbde 0b1c89f2 7cc7a6d8 9dbe4aa1
	ldda	[%i5]ASI_BLK_SL,%f16	! Block Load from 0000000030141400
!	Mem[0000000010141400] = 00000000 00000000, %l0 = 000000ff, %l1 = 00000000
	ldda	[%i5+%g0]0x88,%l0	! %l0 = 0000000000000000 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000020800041] = 0007fa54, %l7 = 0000000000000007
	ldstub	[%o1+0x041],%l7		! %l7 = 00000007000000ff

p0_label_164:
!	Mem[0000000010101408] = 00000000, %l0 = 0000000000000000
	ldstuba	[%i4+%o4]0x88,%l0	! %l0 = 00000000000000ff
!	%f9  = 00000000, %f3  = 00000000
	fcmps	%fcc1,%f9 ,%f3 		! %fcc1 = 0
!	%f6  = 8baab032 00000000, Mem[0000000010041408] = ff000000 061ac655
	stda	%f6 ,[%i1+%o4]0x80	! Mem[0000000010041408] = 8baab032 00000000
!	Mem[00000000201c0001] = ffff5a4a, %l1 = 0000000000000000
	ldstuba	[%o0+0x001]%asi,%l1	! %l1 = 000000ff000000ff
!	Mem[0000000010141420] = 3186e2eb, %l4 = 000000ff, %l2 = 0787ffff
	add	%i5,0x20,%g1
	casa	[%g1]0x80,%l4,%l2	! %l2 = 000000003186e2eb
!	%l5 = 0000000000000000, Mem[0000000010101400] = 67ce8707
	stba	%l5,[%i4+%g0]0x80	! Mem[0000000010101400] = 00ce8707
!	Mem[00000000100c1408] = ffffffff00000000, %l1 = 00000000000000ff, %l7 = 0000000000000007
	add	%i3,0x08,%g1
	casxa	[%g1]0x80,%l1,%l7	! %l7 = ffffffff00000000
!	Mem[0000000030041410] = ece200ff, %l0 = 0000000000000000
	swapa	[%i1+%o5]0x89,%l0	! %l0 = 00000000ece200ff
!	%l0 = 00000000ece200ff, Mem[0000000030081400] = 00000037
	stwa	%l0,[%i2+%g0]0x81	! Mem[0000000030081400] = ece200ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = d69affff, %l6 = 00000000d69a5aff
	ldswa	[%i0+%o5]0x88,%l6	! %l6 = ffffffffd69affff

p0_label_165:
!	Mem[0000000010101410] = 00005aff 1bff7ea8, %l4 = 000000ff, %l5 = 00000000
	ldd	[%i4+%o5],%l4		! %l4 = 0000000000005aff 000000001bff7ea8
!	Mem[00000000100c1408] = ffffffff, %f2  = 67ce8707
	lda	[%i3+%o4]0x88,%f2 	! %f2 = ffffffff
!	Mem[0000000010001408] = ff000000, %f4  = 00000000
	lda	[%i0+%o4]0x80,%f4 	! %f4 = ff000000
!	Mem[0000000030081400] = ff00e2ec, %l0 = 00000000ece200ff
	ldswa	[%i2+%g0]0x89,%l0	! %l0 = ffffffffff00e2ec
!	Mem[0000000010041400] = 796fadff, %l0 = ffffffffff00e2ec
	ldsba	[%i1+%g0]0x80,%l0	! %l0 = 0000000000000079
!	Mem[0000000010101410] = 00005aff, %l2 = 000000003186e2eb
	lduwa	[%i4+%o5]0x80,%l2	! %l2 = 0000000000005aff
!	Mem[0000000010101408] = ff000000, %l3 = 759c090cece200ff
	lduwa	[%i4+%o4]0x80,%l3	! %l3 = 00000000ff000000
!	Mem[0000000030001410] = 33f371b2 000000ff, %l0 = 00000079, %l1 = 000000ff
	ldda	[%i0+%o5]0x89,%l0	! %l0 = 00000000000000ff 0000000033f371b2
!	Mem[0000000010041408] = 8baab032, %l3 = 00000000ff000000
	lduw	[%i1+%o4],%l3		! %l3 = 000000008baab032
!	Starting 10 instruction Store Burst
!	%l3 = 000000008baab032, Mem[0000000010001410] = d69affff
	stwa	%l3,[%i0+%o5]0x88	! Mem[0000000010001410] = 8baab032

p0_label_166:
!	Mem[0000000010101408] = ff000000, %l6 = ffffffffd69affff
	swapa	[%i4+%o4]0x80,%l6	! %l6 = 00000000ff000000
!	Mem[00000000300c1400] = 0787ffff, %l1 = 0000000033f371b2
	swapa	[%i3+%g0]0x81,%l1	! %l1 = 000000000787ffff
!	%l0 = 00000000000000ff, Mem[0000000021800040] = ff00c8f1
	sth	%l0,[%o3+0x040]		! Mem[0000000021800040] = 00ffc8f1
!	Mem[0000000010001424] = 00000000, %l6 = 00000000ff000000, %asi = 80
	swapa	[%i0+0x024]%asi,%l6	! %l6 = 0000000000000000
!	Mem[0000000030081400] = ff00e2ec, %l5 = 000000001bff7ea8
	swapa	[%i2+%g0]0x89,%l5	! %l5 = 00000000ff00e2ec
!	%f0  = 67ce8707 11000000, Mem[0000000030041400] = ffff8991 ff000000
	stda	%f0 ,[%i1+%g0]0x89	! Mem[0000000030041400] = 67ce8707 11000000
!	Mem[0000000010001408] = ff000000, %l4 = 0000000000005aff
	swapa	[%i0+%o4]0x80,%l4	! %l4 = 00000000ff000000
!	%f3  = 00000000, Mem[00000000300c1408] = 00000000
	sta	%f3 ,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00000000
!	%f10 = 07aab032 ffffffff, %l3 = 000000008baab032
!	Mem[0000000030181430] = fff8b398f50c9a30
	add	%i6,0x030,%g1
	stda	%f10,[%g1+%l3]ASI_PST8_SL ! Mem[0000000030181430] = ffffb39832b09a30
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = ff0000ff, %l4 = 00000000ff000000
	ldsha	[%i3+%o5]0x88,%l4	! %l4 = 00000000000000ff

p0_label_167:
!	Mem[0000000030001408] = 0787ce67, %f3  = 00000000
	lda	[%i0+%o4]0x81,%f3 	! %f3 = 0787ce67
!	Mem[0000000010001400] = 462ed77b00000037, %l2 = 0000000000005aff
	ldxa	[%i0+%g0]0x88,%l2	! %l2 = 462ed77b00000037
!	Mem[0000000010001400] = 00000037, %l1 = 000000000787ffff
	ldsha	[%i0+%g0]0x88,%l1	! %l1 = 0000000000000037
!	Mem[00000000300c1408] = 00000000, %l3 = 000000008baab032
	lduba	[%i3+%o4]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000010001428] = 0f4f9d1d00000000, %f22 = 3a0cc464 e025b4c3
	ldd	[%i0+0x028],%f22	! %f22 = 0f4f9d1d 00000000
!	Mem[0000000010001408] = 00005aff, %l0 = 00000000000000ff
	lduwa	[%i0+0x008]%asi,%l0	! %l0 = 0000000000005aff
!	Mem[00000000100c1410] = 918960f8ff0000ff, %l6 = 0000000000000000
	ldxa	[%i3+%o5]0x88,%l6	! %l6 = 918960f8ff0000ff
!	Mem[0000000030081400] = a87eff1b 37000000, %l2 = 00000037, %l3 = 00000000
	ldda	[%i2+%g0]0x81,%l2	! %l2 = 00000000a87eff1b 0000000037000000
!	Mem[0000000030141400] = b199d047, %f22 = 0f4f9d1d
	lda	[%i5+%g0]0x89,%f22	! %f22 = b199d047
!	Starting 10 instruction Store Burst
!	%f30 = a14abe9d, Mem[0000000010041410] = 00000000
	sta	%f30,[%i1+%o5]0x80	! Mem[0000000010041410] = a14abe9d

p0_label_168:
!	%l7 = ffffffff00000000, Mem[0000000010141408] = ff00008b
	stha	%l7,[%i5+%o4]0x80	! Mem[0000000010141408] = 0000008b
!	%f22 = b199d047, Mem[0000000010141400] = 00000000
	sta	%f22,[%i5+%g0]0x88	! Mem[0000000010141400] = b199d047
!	Mem[0000000010141408] = 0000008b, %l6 = 918960f8ff0000ff, %asi = 80
	swapa	[%i5+0x008]%asi,%l6	! %l6 = 000000000000008b
!	%l6 = 0000008b, %l7 = 00000000, Mem[0000000010081428] = 00000028 9020fb0b
	stda	%l6,[%i2+0x028]%asi	! Mem[0000000010081428] = 0000008b 00000000
!	Mem[00000000100c1400] = 00000000, %l0 = 0000000000005aff
	swapa	[%i3+%g0]0x88,%l0	! %l0 = 0000000000000000
!	%f2  = ffffffff 0787ce67, Mem[0000000030041408] = c6fe2d05 00008cad
	stda	%f2 ,[%i1+%o4]0x89	! Mem[0000000030041408] = ffffffff 0787ce67
!	Mem[0000000030001408] = 0787ce67, %l0 = 0000000000000000
	ldstuba	[%i0+%o4]0x81,%l0	! %l0 = 00000007000000ff
!	%l4 = 000000ff, %l5 = ff00e2ec, Mem[0000000010041410] = a14abe9d 00000000
	stda	%l4,[%i1+%o5]0x80	! Mem[0000000010041410] = 000000ff ff00e2ec
!	Mem[0000000010001420] = 67ce8707, %l0 = 00000007, %l2 = a87eff1b
	add	%i0,0x20,%g1
	casa	[%g1]0x80,%l0,%l2	! %l2 = 0000000067ce8707
!	Starting 10 instruction Load Burst
!	%l4 = 00000000000000ff, %l1 = 0000000000000037, %l2 = 0000000067ce8707
	subc	%l4,%l1,%l2		! %l2 = 00000000000000c8

p0_label_169:
!	Mem[00000000300c1408] = ff79000000000000, %l3 = 0000000037000000
	ldxa	[%i3+%o4]0x89,%l3	! %l3 = ff79000000000000
!	Mem[0000000030041408] = 0787ce67, %l0 = 0000000000000007
	ldsba	[%i1+%o4]0x89,%l0	! %l0 = 0000000000000067
!	Mem[0000000020800000] = c6ffa5fa, %l7 = ffffffff00000000
	ldsb	[%o1+%g0],%l7		! %l7 = ffffffffffffffc6
!	Mem[0000000010181408] = 07aab032, %l3 = ff79000000000000
	lduha	[%i6+%o4]0x80,%l3	! %l3 = 00000000000007aa
!	Mem[0000000020800000] = c6ffa5fa, %l4 = 00000000000000ff
	lduh	[%o1+%g0],%l4		! %l4 = 000000000000c6ff
!	Code Fragment 3
p0_fragment_18:
!	%l0 = 0000000000000067
	setx	0x66effea7cbc28d10,%g7,%l0 ! %l0 = 66effea7cbc28d10
!	%l1 = 0000000000000037
	setx	0x76400968189f68e8,%g7,%l1 ! %l1 = 76400968189f68e8
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 66effea7cbc28d10
	setx	0x63a0251f911172b1,%g7,%l0 ! %l0 = 63a0251f911172b1
!	%l1 = 76400968189f68e8
	setx	0x60c4282879f7cd6c,%g7,%l1 ! %l1 = 60c4282879f7cd6c
!	Mem[0000000030041408] = 0787ce67, %l2 = 00000000000000c8
	lduwa	[%i1+%o4]0x89,%l2	! %l2 = 000000000787ce67
!	Mem[00000000300c1400] = 33f371b2, %f6  = 8baab032
	lda	[%i3+%g0]0x81,%f6 	! %f6 = 33f371b2
!	Mem[0000000010081408] = ff7900ec f8608991, %l0 = 911172b1, %l1 = 79f7cd6c
	ldda	[%i2+%o4]0x80,%l0	! %l0 = 00000000ff7900ec 00000000f8608991
!	Starting 10 instruction Store Burst
!	%f0  = 67ce8707 11000000 ffffffff 0787ce67
!	%f4  = ff000000 00ffff00 33f371b2 00000000
!	%f8  = 80000000 00000000 07aab032 ffffffff
!	%f12 = bfc28cf8 ffff9744 70db00d2 7f800000
	stda	%f0,[%i0]ASI_BLK_AIUP	! Block Store to 0000000010001400

p0_label_170:
!	%f20 = 759c090c 9a000000, %l6 = 000000000000008b
!	Mem[0000000010081400] = ece279ff00000000
	stda	%f20,[%i2+%l6]ASI_PST8_PL ! Mem[0000000010081400] = 0000799a00000075
!	Mem[0000000010181400] = ff00364a, %l4 = 000000000000c6ff
	ldstuba	[%i6+%g0]0x80,%l4	! %l4 = 000000ff000000ff
!	%l0 = 00000000ff7900ec, imm = 0000000000000d0e, %l4 = 00000000000000ff
	xor	%l0,0xd0e,%l4		! %l4 = 00000000ff790de2
!	%f22 = b199d047 00000000, %l1 = 00000000f8608991
!	Mem[00000000300c1430] = 992bc7216e5f9478
	add	%i3,0x030,%g1
	stda	%f22,[%g1+%l1]ASI_PST32_SL ! Mem[00000000300c1430] = 000000006e5f9478
!	Mem[0000000030041408] = 67ce8707, %l0 = 00000000ff7900ec
	swapa	[%i1+%o4]0x81,%l0	! %l0 = 0000000067ce8707
!	%f22 = b199d047 00000000, %l0 = 0000000067ce8707
!	Mem[00000000100c1410] = ff0000fff8608991
	add	%i3,0x010,%g1
	stda	%f22,[%g1+%l0]ASI_PST16_P ! Mem[00000000100c1410] = ff00d04700000000
!	%f16 = ef233c3f b199d047 8baab032 00000000
!	%f20 = 759c090c 9a000000 b199d047 00000000
!	%f24 = aa507244 285ca732 a98a274a 795168ce
!	%f28 = f2891c0b defb9782 a14abe9d d8a6c77c
	stda	%f16,[%i3]ASI_BLK_P	! Block Store to 00000000100c1400
!	%f0  = 67ce8707, Mem[0000000010181400] = 4a3600ff
	sta	%f0 ,[%i6+%g0]0x88	! Mem[0000000010181400] = 67ce8707
!	Mem[0000000010041408] = 8baab032, %l2 = 000000000787ce67
	ldstuba	[%i1+%o4]0x80,%l2	! %l2 = 0000008b000000ff
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (23)
!	Mem[00000000100c1408] = 8baab032 00000000, %l0 = 67ce8707, %l1 = f8608991
	ldd	[%i3+%o4],%l0		! %l0 = 000000008baab032 0000000000000000

p0_label_171:
!	%f16 = ef233c3f, %f17 = b199d047, %f6  = 33f371b2
	fsubs	%f16,%f17,%f6 		! %f6  = ef233c3f
!	Mem[0000000010101400] = ece279ff 0787ce00, %l6 = 0000008b, %l7 = ffffffc6
	ldda	[%i4+%g0]0x88,%l6	! %l6 = 000000000787ce00 00000000ece279ff
!	Mem[0000000030181410] = 00000000 0000007e, %l4 = ff790de2, %l5 = ff00e2ec
	ldda	[%i6+%o5]0x81,%l4	! %l4 = 0000000000000000 000000000000007e
!	Mem[00000000100c1400] = ef233c3f, %l3 = 00000000000007aa
	ldsba	[%i3+%g0]0x80,%l3	! %l3 = ffffffffffffffef
!	Mem[0000000010141400] = 47d099b100000000, %l2 = 000000000000008b
	ldxa	[%i5+%g0]0x80,%l2	! %l2 = 47d099b100000000
!	Mem[0000000030041400] = 00000011, %l3 = ffffffffffffffef
	lduba	[%i1+%g0]0x81,%l3	! %l3 = 0000000000000000
!	%l3 = 0000000000000000, immed = 00000574, %y  = ffffffff
	umul	%l3,0x574,%l0		! %l0 = 0000000000000000, %y = 00000000
!	Mem[00000000100c1408] = 32b0aa8b, %l5 = 000000000000007e
	ldsha	[%i3+%o4]0x88,%l5	! %l5 = ffffffffffffaa8b
!	Mem[00000000100c1400] = ef233c3fb199d047, %f4  = ff000000 00ffff00
	ldda	[%i3+0x000]%asi,%f4 	! %f4  = ef233c3f b199d047
!	Starting 10 instruction Store Burst
!	Mem[0000000030001410] = 000000ff, %l4 = 0000000000000000
	swapa	[%i0+%o5]0x89,%l4	! %l4 = 00000000000000ff

p0_label_172:
!	Mem[00000000100c1408] = 32b0aa8b, %l6 = 000000000787ce00
	ldstuba	[%i3+%o4]0x88,%l6	! %l6 = 0000008b000000ff
!	Mem[0000000030081408] = 060737ff, %l3 = 0000000000000000
	swapa	[%i2+%o4]0x89,%l3	! %l3 = 00000000060737ff
!	%l2 = 47d099b100000000, %l5 = ffffffffffffaa8b, %y  = 00000000
	sdiv	%l2,%l5,%l6		! %l6 = 0000000000000000
	mov	%l0,%y			! %y = 00000000
!	Mem[00000000300c1410] = 00000000, %l6 = 0000000000000000
	ldstuba	[%i3+%o5]0x89,%l6	! %l6 = 00000000000000ff
!	%l1 = 0000000000000000, imm = fffffffffffff042, %l5 = ffffffffffffaa8b
	orn	%l1,-0xfbe,%l5		! %l5 = 0000000000000fbd
!	%f1  = 11000000, %f27 = 795168ce
	fcmps	%fcc0,%f1 ,%f27		! %fcc0 = 1
!	Mem[00000000100c1400] = ef233c3f, %l4 = 00000000000000ff
	ldstuba	[%i3+%g0]0x80,%l4	! %l4 = 000000ef000000ff
!	%f0  = 67ce8707 11000000, Mem[0000000010181408] = 32b0aa07 ffffffff
	stda	%f0 ,[%i6+%o4]0x88	! Mem[0000000010181408] = 67ce8707 11000000
!	%l0 = 0000000000000000, Mem[0000000030141410] = 759c090c9a000000
	stxa	%l0,[%i5+%o5]0x89	! Mem[0000000030141410] = 0000000000000000
!	Starting 10 instruction Load Burst
!	%l6 = 0000000000000000, immed = 00000502, %y  = 00000000
	smul	%l6,0x502,%l1		! %l1 = 0000000000000000, %y = 00000000

p0_label_173:
!	Mem[0000000010181400] = 0787ce67, %f9  = 00000000
	lda	[%i6+%g0]0x80,%f9 	! %f9 = 0787ce67
!	Mem[0000000010041400] = ffad6f79, %l3 = 00000000060737ff
	ldswa	[%i1+%g0]0x88,%l3	! %l3 = ffffffffffad6f79
!	Mem[0000000030001410] = 00000000, %l3 = ffffffffffad6f79
	ldswa	[%i0+%o5]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000010181434] = 9020fb0b, %l4 = 00000000000000ef
	lduba	[%i6+0x036]%asi,%l4	! %l4 = 00000000000000fb
!	Mem[0000000030101400] = 000000000000c6ff, %f16 = ef233c3f b199d047
	ldda	[%i4+%g0]0x89,%f16	! %f16 = 00000000 0000c6ff
!	Mem[0000000010041408] = ffaab032, %l5 = 0000000000000fbd
	ldsba	[%i1+%o4]0x80,%l5	! %l5 = ffffffffffffffff
!	Mem[00000000100c1408] = ffaab032, %l4 = 00000000000000fb
	ldswa	[%i3+%o4]0x80,%l4	! %l4 = ffffffffffaab032
!	Mem[0000000030041408] = ff7900ec, %l2 = 47d099b100000000
	lduha	[%i1+%o4]0x81,%l2	! %l2 = 000000000000ff79
!	Mem[0000000010101400] = 00ce8707, %l0 = 0000000000000000
	lduha	[%i4+%g0]0x80,%l0	! %l0 = 00000000000000ce
!	Starting 10 instruction Store Burst
!	%f11 = ffffffff, Mem[0000000010181420] = ffffffff
	sta	%f11,[%i6+0x020]%asi	! Mem[0000000010181420] = ffffffff

p0_label_174:
!	%f28 = f2891c0b, Mem[0000000010181408] = 11000000
	sta	%f28,[%i6+%o4]0x88	! Mem[0000000010181408] = f2891c0b
!	Mem[0000000010141400] = 47d099b1, %l6 = 0000000000000000
	ldstub	[%i5+%g0],%l6		! %l6 = 00000047000000ff
!	%l5 = ffffffffffffffff, Mem[0000000030101408] = ff00000000000000
	stxa	%l5,[%i4+%o4]0x81	! Mem[0000000030101408] = ffffffffffffffff
!	%l0 = 00000000000000ce, Mem[0000000010101400] = 00ce8707ff79e2ec
	stxa	%l0,[%i4+%g0]0x80	! Mem[0000000010101400] = 00000000000000ce
!	Code Fragment 4
p0_fragment_19:
!	%l0 = 00000000000000ce
	setx	0x3080109fa6fccfb7,%g7,%l0 ! %l0 = 3080109fa6fccfb7
!	%l1 = 0000000000000000
	setx	0xa4e3bfcfcd804ded,%g7,%l1 ! %l1 = a4e3bfcfcd804ded
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 3080109fa6fccfb7
	setx	0x5e422f17fab8d47c,%g7,%l0 ! %l0 = 5e422f17fab8d47c
!	%l1 = a4e3bfcfcd804ded
	setx	0x56968a887d0f488b,%g7,%l1 ! %l1 = 56968a887d0f488b
!	%l2 = 000000000000ff79, Mem[00000000100c1400] = ff233c3f
	stba	%l2,[%i3+%g0]0x80	! Mem[00000000100c1400] = 79233c3f
!	Mem[00000000100c1404] = b199d047, %l2 = 0000ff79, %l0 = fab8d47c
	add	%i3,0x04,%g1
	casa	[%g1]0x80,%l2,%l0	! %l0 = 00000000b199d047
!	Mem[0000000020800041] = 00fffa54, %l3 = 0000000000000000
	ldstuba	[%o1+0x041]%asi,%l3	! %l3 = 000000ff000000ff
!	Mem[0000000010141408] = ff0000ff, %l2 = 000000000000ff79
	ldstuba	[%i5+%o4]0x80,%l2	! %l2 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = 0000008b, %l6 = 0000000000000047
	ldswa	[%i2+%o5]0x88,%l6	! %l6 = 000000000000008b

p0_label_175:
!	Mem[0000000010141400] = b199d0ff, %l1 = 56968a887d0f488b
	ldsba	[%i5+%g0]0x88,%l1	! %l1 = ffffffffffffffff
!	%l4 = ffffffffffaab032, %l2 = 00000000000000ff, %l4 = ffffffffffaab032
	xor	%l4,%l2,%l4		! %l4 = ffffffffffaab0cd
!	Mem[0000000030141410] = 00000000, %l3 = 00000000000000ff
	lduwa	[%i5+%o5]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000010001400] = 0787ce67, %f4  = ef233c3f
	lda	[%i0+%g0]0x88,%f4 	! %f4 = 0787ce67
!	Mem[0000000010001408] = ffffffff0787ce67, %f22 = b199d047 00000000
	ldda	[%i0+%o4]0x80,%f22	! %f22 = ffffffff 0787ce67
!	Mem[0000000010001418] = 33f371b2, %l7 = 00000000ece279ff
	lduh	[%i0+0x018],%l7		! %l7 = 00000000000033f3
!	%l5 = ffffffffffffffff, %l4 = ffffffffffaab0cd, %l1 = ffffffffffffffff
	addc	%l5,%l4,%l1		! %l1 = ffffffffffaab0cc
!	Mem[0000000030141410] = 00000000, %l4 = ffffffffffaab0cd
	lduba	[%i5+%o5]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000010001420] = 80000000 00000000, %l4 = 00000000, %l5 = ffffffff
	ldda	[%i0+0x020]%asi,%l4	! %l4 = 0000000080000000 0000000000000000
!	Starting 10 instruction Store Burst
!	%l1 = ffffffffffaab0cc, Mem[00000000100c1408] = ffaab032
	stwa	%l1,[%i3+%o4]0x80	! Mem[00000000100c1408] = ffaab0cc

p0_label_176:
!	%f22 = ffffffff 0787ce67, Mem[0000000030141408] = 00000000 8baab032
	stda	%f22,[%i5+%o4]0x89	! Mem[0000000030141408] = ffffffff 0787ce67
!	Mem[0000000010001408] = ffffffff, %l2 = 00000000000000ff
	swapa	[%i0+%o4]0x80,%l2	! %l2 = 00000000ffffffff
!	%l3 = 0000000000000000, Mem[00000000100c1408] = ffaab0cc
	stwa	%l3,[%i3+%o4]0x80	! Mem[00000000100c1408] = 00000000
!	Mem[0000000010181410] = ff0000ff, %l0 = 00000000b199d047
	ldstuba	[%i6+%o5]0x88,%l0	! %l0 = 000000ff000000ff
!	%l2 = 00000000ffffffff, %l0 = 00000000000000ff, %l6 = 000000000000008b
	subc	%l2,%l0,%l6		! %l6 = 00000000ffffff00
!	%l2 = ffffffff, %l3 = 00000000, Mem[0000000010141410] = 000000ff ffffffff
	stda	%l2,[%i5+%o5]0x88	! Mem[0000000010141410] = ffffffff 00000000
!	Mem[0000000010001410] = ff000000, %l0 = 00000000000000ff
	swapa	[%i0+%o5]0x80,%l0	! %l0 = 00000000ff000000
!	Mem[00000000100c1400] = 79233c3f, %l4 = 0000000080000000
	swapa	[%i3+%g0]0x80,%l4	! %l4 = 0000000079233c3f
!	%f16 = 00000000 0000c6ff, %l3 = 0000000000000000
!	Mem[00000000100c1430] = f2891c0bdefb9782
	add	%i3,0x030,%g1
	stda	%f16,[%g1+%l3]ASI_PST8_P ! Mem[00000000100c1430] = f2891c0bdefb9782
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = 0000799a, %f27 = 795168ce
	lda	[%i2+%g0]0x80,%f27	! %f27 = 0000799a

p0_label_177:
!	Mem[00000000100c1408] = 00000000, %l7 = 00000000000033f3
	ldsba	[%i3+%o4]0x80,%l7	! %l7 = 0000000000000000
!	Mem[000000001000143c] = 7f800000, %l2 = 00000000ffffffff
	ldsb	[%i0+0x03e],%l2		! %l2 = 0000000000000000
!	Mem[0000000010001410] = 00ffff00ff000000, %f22 = ffffffff 0787ce67
	ldda	[%i0+%o5]0x88,%f22	! %f22 = 00ffff00 ff000000
!	Mem[0000000010181430] = 9a3707069020fb0b, %l6 = 00000000ffffff00
	ldxa	[%i6+0x030]%asi,%l6	! %l6 = 9a3707069020fb0b
!	Mem[0000000010101410] = 00005aff, %l3 = 0000000000000000
	ldsba	[%i4+%o5]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000021800040] = 00ffc8f1, %l5 = 0000000000000000
	ldsba	[%o3+0x040]%asi,%l5	! %l5 = 0000000000000000
!	Mem[0000000010141418] = ad8c0000 0c099c75, %l0 = ff000000, %l1 = ffaab0cc
	ldd	[%i5+0x018],%l0		! %l0 = 00000000ad8c0000 000000000c099c75
!	Mem[0000000010181408] = 0b1c89f2, %l2 = 0000000000000000
	ldsha	[%i6+%o4]0x80,%l2	! %l2 = 0000000000000b1c
!	Mem[0000000030001410] = 00000000, %l5 = 0000000000000000
	ldsha	[%i0+%o5]0x81,%l5	! %l5 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l5 = 0000000000000000, Mem[00000000211c0000] = 0000cd80, %asi = 80
	stha	%l5,[%o2+0x000]%asi	! Mem[00000000211c0000] = 0000cd80

p0_label_178:
!	Mem[00000000100c1408] = 00000000, %l2 = 0000000000000b1c
	swapa	[%i3+%o4]0x80,%l2	! %l2 = 0000000000000000
!	%f30 = a14abe9d d8a6c77c, Mem[0000000010141410] = ffffffff 00000000
	stda	%f30,[%i5+%o5]0x88	! Mem[0000000010141410] = a14abe9d d8a6c77c
!	%f16 = 00000000 0000c6ff 8baab032 00000000
!	%f20 = 759c090c 9a000000 00ffff00 ff000000
!	%f24 = aa507244 285ca732 a98a274a 0000799a
!	%f28 = f2891c0b defb9782 a14abe9d d8a6c77c
	stda	%f16,[%i0]ASI_COMMIT_S	! Block Store to 0000000030001400
!	Mem[00000000201c0001] = ffff5a4a, %l3 = 0000000000000000
	ldstuba	[%o0+0x001]%asi,%l3	! %l3 = 000000ff000000ff
!	%f0  = 67ce8707 11000000 ffffffff 0787ce67
!	%f4  = 0787ce67 b199d047 ef233c3f 00000000
!	%f8  = 80000000 0787ce67 07aab032 ffffffff
!	%f12 = bfc28cf8 ffff9744 70db00d2 7f800000
	stda	%f0,[%i1]ASI_COMMIT_P	! Block Store to 0000000010041400
!	Mem[0000000010141408] = ff0000ff, %l6 = 9a3707069020fb0b, %asi = 80
	swapa	[%i5+0x008]%asi,%l6	! %l6 = 00000000ff0000ff
!	%l5 = 0000000000000000, Mem[0000000030081408] = 00000000
	stwa	%l5,[%i2+%o4]0x89	! Mem[0000000030081408] = 00000000
!	%l4 = 0000000079233c3f, Mem[0000000010181410] = 00000000ff0000ff
	stxa	%l4,[%i6+%o5]0x88	! Mem[0000000010181410] = 0000000079233c3f
!	%l5 = 0000000000000000, Mem[00000000211c0001] = 0000cd80, %asi = 80
	stba	%l5,[%o2+0x001]%asi	! Mem[00000000211c0000] = 0000cd80
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = 11000000, %l0 = 00000000ad8c0000
	lduba	[%i1+%g0]0x89,%l0	! %l0 = 0000000000000000

p0_label_179:
	membar	#Sync			! Added by membar checker (24)
!	Mem[0000000030001410] = 0c099c75, %f24 = aa507244
	lda	[%i0+%o5]0x89,%f24	! %f24 = 0c099c75
!	Mem[0000000030001410] = 0000009a0c099c75, %l1 = 000000000c099c75
	ldxa	[%i0+%o5]0x89,%l1	! %l1 = 0000009a0c099c75
!	Mem[0000000010041414] = b199d047, %f0  = 67ce8707
	lda	[%i1+0x014]%asi,%f0 	! %f0 = b199d047
!	Mem[0000000010041410] = 47d099b167ce8707, %f8  = 80000000 0787ce67
	ldda	[%i1+%o5]0x88,%f8 	! %f8  = 47d099b1 67ce8707
!	Mem[0000000010101408] = ff79e2ecffff9ad6, %l5 = 0000000000000000
	ldxa	[%i4+%o4]0x88,%l5	! %l5 = ff79e2ecffff9ad6
!	Mem[0000000030001410] = 759c090c9a000000, %f12 = bfc28cf8 ffff9744
	ldda	[%i0+%o5]0x81,%f12	! %f12 = 759c090c 9a000000
!	Mem[0000000010181410] = 0000000079233c3f, %l2 = 0000000000000000
	ldxa	[%i6+%o5]0x88,%l2	! %l2 = 0000000079233c3f
!	Mem[0000000021800000] = b4008a92, %l3 = 00000000000000ff
	lduha	[%o3+0x000]%asi,%l3	! %l3 = 000000000000b400
!	Mem[0000000021800100] = b444af61, %l5 = ff79e2ecffff9ad6
	lduba	[%o3+0x101]%asi,%l5	! %l5 = 0000000000000044
!	Starting 10 instruction Store Burst
!	%l2 = 0000000079233c3f, Mem[0000000010141408] = 000000110bfb2090
	stxa	%l2,[%i5+%o4]0x88	! Mem[0000000010141408] = 0000000079233c3f

p0_label_180:
!	%f22 = 00ffff00 ff000000, Mem[0000000030181400] = ff000000 00000000
	stda	%f22,[%i6+%g0]0x81	! Mem[0000000030181400] = 00ffff00 ff000000
!	%l1 = 0000009a0c099c75, Mem[0000000010101410] = a87eff1bff5a0000
	stxa	%l1,[%i4+%o5]0x88	! Mem[0000000010101410] = 0000009a0c099c75
!	%f31 = d8a6c77c, Mem[0000000010181408] = 0b1c89f2
	sta	%f31,[%i6+%o4]0x80	! Mem[0000000010181408] = d8a6c77c
!	%l1 = 0000009a0c099c75, Mem[0000000010141408] = 3f3c237900000000
	stxa	%l1,[%i5+%o4]0x80	! Mem[0000000010141408] = 0000009a0c099c75
!	Mem[0000000030041408] = ec0079ff, %l0 = 0000000000000000
	ldstuba	[%i1+%o4]0x89,%l0	! %l0 = 000000ff000000ff
!	%f20 = 759c090c, Mem[00000000300c1410] = 000000ff
	sta	%f20,[%i3+%o5]0x89	! Mem[00000000300c1410] = 759c090c
!	%l3 = 000000000000b400, Mem[00000000300c1408] = 00000000000079ff
	stxa	%l3,[%i3+%o4]0x81	! Mem[00000000300c1408] = 000000000000b400
!	Mem[00000000100c1408] = 1c0b0000, %l2 = 0000000079233c3f
	swapa	[%i3+%o4]0x88,%l2	! %l2 = 000000001c0b0000
!	Mem[0000000010041437] = ffff9744, %l1 = 0000009a0c099c75
	ldstuba	[%i1+0x037]%asi,%l1	! %l1 = 00000044000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = 000000000000008b, %l4 = 0000000079233c3f
	ldxa	[%i2+%o5]0x88,%l4	! %l4 = 000000000000008b

p0_label_181:
!	Mem[0000000030101408] = ffffffff, %l7 = 0000000000000000
	ldsba	[%i4+%o4]0x81,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000030141410] = 0000000000000000, %f4  = 0787ce67 b199d047
	ldda	[%i5+%o5]0x81,%f4 	! %f4  = 00000000 00000000
!	Mem[00000000100c1400] = 80000000, %l6 = 00000000ff0000ff
	ldsha	[%i3+%g0]0x80,%l6	! %l6 = ffffffffffff8000
!	Mem[0000000010081408] = ff7900ec, %l5 = 0000000000000044
	ldswa	[%i2+%o4]0x80,%l5	! %l5 = ffffffffff7900ec
!	Mem[0000000010181408] = 7cc7a6d8, %l4 = 000000000000008b
	lduba	[%i6+%o4]0x88,%l4	! %l4 = 00000000000000d8
!	Mem[0000000030181410] = 00000000, %l6 = ffffffffffff8000
	lduwa	[%i6+%o5]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000030041400] = 11000000, %l0 = 00000000000000ff
	lduha	[%i1+%g0]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000030041410] = 759c090c00000000, %l6 = 0000000000000000
	ldxa	[%i1+%o5]0x89,%l6	! %l6 = 759c090c00000000
!	Mem[0000000010041410] = 67ce8707, %l6 = 759c090c00000000
	lduwa	[%i1+%o5]0x88,%l6	! %l6 = 0000000067ce8707
!	Starting 10 instruction Store Burst
!	%l6 = 0000000067ce8707, Mem[0000000010141408] = 0000009a0c099c75
	stx	%l6,[%i5+%o4]		! Mem[0000000010141408] = 0000000067ce8707

p0_label_182:
!	%l5 = ffffffffff7900ec, Mem[0000000030181400] = 00ffff00
	stha	%l5,[%i6+%g0]0x89	! Mem[0000000030181400] = 00ff00ec
!	%f29 = defb9782, %f7  = 00000000, %f20 = 759c090c
	fmuls	%f29,%f7 ,%f20		! %f20 = 80000000
!	Mem[0000000030101408] = ffffffff, %l7 = ffffffffffffffff
	ldstuba	[%i4+%o4]0x89,%l7	! %l7 = 000000ff000000ff
!	%f18 = 8baab032 00000000, %l0 = 0000000000000000
!	Mem[0000000010001410] = 000000ff00ffff00
	add	%i0,0x010,%g1
	stda	%f18,[%g1+%l0]ASI_PST32_PL ! Mem[0000000010001410] = 000000ff00ffff00
!	Mem[0000000030141410] = 00000000, %l1 = 0000000000000044
	swapa	[%i5+%o5]0x81,%l1	! %l1 = 0000000000000000
!	%f0  = b199d047 11000000, %l6 = 0000000067ce8707
!	Mem[0000000030041428] = ce6851794a278aa9
	add	%i1,0x028,%g1
	stda	%f0,[%g1+%l6]ASI_PST16_S ! Mem[0000000030041428] = ce68d04711000000
!	Mem[000000001008143f] = 00008cad, %l6 = 0000000067ce8707
	ldstuba	[%i2+0x03f]%asi,%l6	! %l6 = 000000ad000000ff
!	%f9  = 67ce8707, %f22 = 00ffff00, %f22 = 00ffff00 ff000000
	fsmuld	%f9 ,%f22,%f22		! %f22 = 3d29d0c7 0f1f2000
!	%f21 = 9a000000, Mem[0000000010001410] = 000000ff
	sta	%f21,[%i0+%o5]0x80	! Mem[0000000010001410] = 9a000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = 1bff7ea8, %l4 = 00000000000000d8
	lduwa	[%i2+%g0]0x89,%l4	! %l4 = 000000001bff7ea8

p0_label_183:
!	Mem[0000000010081408] = ec0079ff, %f29 = defb9782
	lda	[%i2+%o4]0x88,%f29	! %f29 = ec0079ff
!	Mem[0000000030181408] = 00000000, %l3 = 000000000000b400
	lduba	[%i6+%o4]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000030141400] = ef233c3fb199d047, %f10 = 07aab032 ffffffff
	ldda	[%i5+%g0]0x89,%f10	! %f10 = ef233c3f b199d047
!	Mem[0000000030181410] = 00000000, %f25 = 285ca732
	lda	[%i6+%o5]0x81,%f25	! %f25 = 00000000
!	Mem[0000000030081400] = a87eff1b 37000000 00000000 ffff00b4
!	Mem[0000000030081410] = ff000000 000000ff 292b4497 1397f6b8
!	Mem[0000000030081420] = 07a18675 dfdee334 d36c6a49 7e160ac2
!	Mem[0000000030081430] = 0bfb2090 0607379a f90f993c eb694872
	ldda	[%i2]ASI_BLK_AIUSL,%f16	! Block Load from 0000000030081400
!	Mem[0000000010181400] = 292b4497 67ce8707, %l2 = 1c0b0000, %l3 = 00000000
	ldda	[%i6+%g0]0x88,%l2	! %l2 = 0000000067ce8707 00000000292b4497
!	Mem[0000000030001408] = 8baab032, %l1 = 0000000000000000
	lduwa	[%i0+%o4]0x81,%l1	! %l1 = 000000008baab032
!	Mem[0000000010001408] = 000000ff, %f4  = 00000000
	lda	[%i0+0x008]%asi,%f4 	! %f4 = 000000ff
!	Mem[00000000300c1400] = ffffffffb271f333, %f12 = 759c090c 9a000000
	ldda	[%i3+%g0]0x89,%f12	! %f12 = ffffffff b271f333
!	Starting 10 instruction Store Burst
!	%l6 = 000000ad, %l7 = 000000ff, Mem[0000000010101400] = 00000000 000000ce
	stda	%l6,[%i4+%g0]0x80	! Mem[0000000010101400] = 000000ad 000000ff

p0_label_184:
!	Mem[0000000030001400] = 00000000, %l2 = 0000000067ce8707
	swapa	[%i0+%g0]0x89,%l2	! %l2 = 0000000000000000
!	%f12 = ffffffff b271f333, %l6 = 00000000000000ad
!	Mem[0000000030141420] = 32a75c28447250aa
	add	%i5,0x020,%g1
	stda	%f12,[%g1+%l6]ASI_PST8_SL ! Mem[0000000030141420] = 33a771b244ff50ff
!	Mem[0000000010141410] = 7cc7a6d8, %l5 = ffffffffff7900ec
	swapa	[%i5+%o5]0x80,%l5	! %l5 = 000000007cc7a6d8
!	Mem[0000000010041418] = ef233c3f, %l1 = 000000008baab032
	ldstuba	[%i1+0x018]%asi,%l1	! %l1 = 000000ef000000ff
!	%l1 = 00000000000000ef, Mem[0000000010181431] = 9a370706, %asi = 80
	stba	%l1,[%i6+0x031]%asi	! Mem[0000000010181430] = 9aef0706
!	Code Fragment 4
p0_fragment_20:
!	%l0 = 0000000000000000
	setx	0xed53fa97d45d3d98,%g7,%l0 ! %l0 = ed53fa97d45d3d98
!	%l1 = 00000000000000ef
	setx	0x58e03fe79920ab0d,%g7,%l1 ! %l1 = 58e03fe79920ab0d
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = ed53fa97d45d3d98
	setx	0x8aaa58dffd6d0e81,%g7,%l0 ! %l0 = 8aaa58dffd6d0e81
!	%l1 = 58e03fe79920ab0d
	setx	0x22203070458bc1f8,%g7,%l1 ! %l1 = 22203070458bc1f8
!	%f14 = 70db00d2, %f11 = b199d047, %f14 = 70db00d2
	fdivs	%f14,%f11,%f14		! %f14 = feb63fcf
!	Code Fragment 4
p0_fragment_21:
!	%l0 = 8aaa58dffd6d0e81
	setx	0x59dd69e7fc37c419,%g7,%l0 ! %l0 = 59dd69e7fc37c419
!	%l1 = 22203070458bc1f8
	setx	0x99960fc8132d44c6,%g7,%l1 ! %l1 = 99960fc8132d44c6
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 59dd69e7fc37c419
	setx	0x980b07cfd5b13cca,%g7,%l0 ! %l0 = 980b07cfd5b13cca
!	%l1 = 99960fc8132d44c6
	setx	0xf0eca33799bbf1ae,%g7,%l1 ! %l1 = f0eca33799bbf1ae
!	%f4  = 000000ff 00000000, Mem[0000000030001408] = 32b0aa8b 00000000
	stda	%f4 ,[%i0+%o4]0x89	! Mem[0000000030001408] = 000000ff 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = ffffffff, %l7 = 00000000000000ff
	ldsba	[%i4+%o4]0x81,%l7	! %l7 = ffffffffffffffff

p0_label_185:
!	Mem[00000000211c0000] = 0000cd80, %l5 = 000000007cc7a6d8
	ldsb	[%o2+0x001],%l5		! %l5 = 0000000000000000
!	Mem[0000000021800140] = ffff4205, %l5 = 0000000000000000
	ldsha	[%o3+0x140]%asi,%l5	! %l5 = ffffffffffffffff
!	Mem[00000000211c0000] = 0000cd80, %l0 = 980b07cfd5b13cca
	ldub	[%o2+%g0],%l0		! %l0 = 0000000000000000
!	Mem[0000000030101408] = ffffffff, %l0 = 0000000000000000
	ldsha	[%i4+%o4]0x81,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010101400] = 000000ad, %l3 = 00000000292b4497
	lduw	[%i4+%g0],%l3		! %l3 = 00000000000000ad
!	Mem[0000000010101408] = d69affff, %l7 = ffffffffffffffff
	ldsba	[%i4+%o4]0x80,%l7	! %l7 = ffffffffffffffd6
!	Mem[0000000010041410] = 67ce8707, %l2 = 0000000000000000
	lduwa	[%i1+%o5]0x88,%l2	! %l2 = 0000000067ce8707
!	Mem[0000000010081400] = 0000799a, %l7 = ffffffffffffffd6
	ldsha	[%i2+%g0]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000030041400] = 11000000, %l3 = 00000000000000ad
	lduha	[%i1+%g0]0x89,%l3	! %l3 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030181410] = 00000000, %l0 = ffffffffffffffff
	swapa	[%i6+%o5]0x81,%l0	! %l0 = 0000000000000000

p0_label_186:
!	%l3 = 0000000000000000, Mem[0000000010041410] = 0787ce67
	stha	%l3,[%i1+%o5]0x80	! Mem[0000000010041410] = 0000ce67
!	%l7 = 0000000000000000, Mem[0000000010141400] = ffd099b1
	stba	%l7,[%i5+%g0]0x80	! Mem[0000000010141400] = 00d099b1
!	Mem[000000001008143c] = 00008cff, %l5 = ffffffffffffffff
	swap	[%i2+0x03c],%l5		! %l5 = 0000000000008cff
!	%l0 = 0000000000000000, Mem[0000000010041434] = ffff97ff, %asi = 80
	stwa	%l0,[%i1+0x034]%asi	! Mem[0000000010041434] = 00000000
!	Mem[0000000030041408] = ec0079ff, %l0 = 0000000000000000
	ldstuba	[%i1+%o4]0x89,%l0	! %l0 = 000000ff000000ff
!	Mem[0000000030041400] = 00000011, %l7 = 0000000000000000
	ldstuba	[%i1+%g0]0x81,%l7	! %l7 = 00000000000000ff
!	%l7 = 0000000000000000, Mem[0000000010001408] = ff000000
	stba	%l7,[%i0+%o4]0x88	! Mem[0000000010001408] = ff000000
!	%l2 = 0000000067ce8707, Mem[00000000201c0000] = ffff5a4a, %asi = 80
	stha	%l2,[%o0+0x000]%asi	! Mem[00000000201c0000] = 87075a4a
!	%l6 = 00000000000000ad, Mem[0000000010081410] = 0000008b
	stha	%l6,[%i2+%o5]0x88	! Mem[0000000010081410] = 000000ad
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = 0c099c75, %l1 = f0eca33799bbf1ae
	lduba	[%i3+%o5]0x81,%l1	! %l1 = 000000000000000c

p0_label_187:
!	Mem[0000000030101408] = ffffffffffffffff, %l6 = 00000000000000ad
	ldxa	[%i4+%o4]0x89,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000030101400] = 00000000 0000c6ff, %l0 = 000000ff, %l1 = 0000000c
	ldda	[%i4+%g0]0x89,%l0	! %l0 = 000000000000c6ff 0000000000000000
!	Mem[0000000030181410] = ffffffff, %l7 = 0000000000000000
	lduba	[%i6+%o5]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010181410] = 79233c3f, %l1 = 0000000000000000
	lduwa	[%i6+%o5]0x88,%l1	! %l1 = 0000000079233c3f
!	Mem[00000000300c1410] = 00000000759c090c, %f6  = ef233c3f 00000000
	ldda	[%i3+%o5]0x89,%f6 	! %f6  = 00000000 759c090c
!	Mem[0000000030141410] = 00000044, %f29 = 9020fb0b
	lda	[%i5+%o5]0x81,%f29	! %f29 = 00000044
!	Mem[0000000010081408] = 918960f8ec0079ff, %f12 = ffffffff b271f333
	ldda	[%i2+%o4]0x88,%f12	! %f12 = 918960f8 ec0079ff
!	Mem[00000000100c1424] = 285ca732, %l5 = 0000000000008cff
	ldsba	[%i3+0x024]%asi,%l5	! %l5 = 0000000000000028
!	Mem[00000000100c1434] = defb9782, %l5 = 0000000000000028
	lduba	[%i3+0x034]%asi,%l5	! %l5 = 00000000000000de
!	Starting 10 instruction Store Burst
!	%l3 = 0000000000000000, Mem[0000000030101410] = ffffffff
	stha	%l3,[%i4+%o5]0x81	! Mem[0000000030101410] = 0000ffff

p0_label_188:
!	%f6  = 00000000 759c090c, %l3 = 0000000000000000
!	Mem[0000000010101420] = 1fffa7c532b0aa8b
	add	%i4,0x020,%g1
	stda	%f6,[%g1+%l3]ASI_PST16_P ! Mem[0000000010101420] = 1fffa7c532b0aa8b
!	%l2 = 0000000067ce8707, Mem[0000000010101418] = 0000ffff000000ff
	stx	%l2,[%i4+0x018]		! Mem[0000000010101418] = 0000000067ce8707
!	%l2 = 0000000067ce8707, Mem[0000000010181436] = 9020fb0b, %asi = 80
	stba	%l2,[%i6+0x036]%asi	! Mem[0000000010181434] = 9020070b
	membar	#Sync			! Added by membar checker (25)
!	%l4 = 000000001bff7ea8, Mem[0000000030081400] = a87eff1b37000000
	stxa	%l4,[%i2+%g0]0x81	! Mem[0000000030081400] = 000000001bff7ea8
!	Mem[0000000010001400] = 0787ce67, %l2 = 0000000067ce8707
	ldstuba	[%i0+%g0]0x88,%l2	! %l2 = 00000067000000ff
!	%l1 = 0000000079233c3f, Mem[0000000010101430] = 9a370706, %asi = 80
	stba	%l1,[%i4+0x030]%asi	! Mem[0000000010101430] = 3f370706
!	%f14 = feb63fcf, Mem[0000000030081408] = 00000000
	sta	%f14,[%i2+%o4]0x81	! Mem[0000000030081408] = feb63fcf
!	%l0 = 000000000000c6ff, Mem[00000000300c1400] = 33f371b2
	stba	%l0,[%i3+%g0]0x81	! Mem[00000000300c1400] = fff371b2
!	%l6 = ffffffffffffffff, Mem[00000000211c0001] = 0000cd80
	stb	%l6,[%o2+0x001]		! Mem[00000000211c0000] = 00ffcd80
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = 00ffcd80, %l1 = 0000000079233c3f
	lduh	[%o2+%g0],%l1		! %l1 = 00000000000000ff

p0_label_189:
!	Mem[0000000010181408] = d8a6c77c, %l0 = 000000000000c6ff
	lduha	[%i6+%o4]0x80,%l0	! %l0 = 000000000000d8a6
!	Mem[0000000010101414] = 9a000000, %l3 = 0000000000000000
	ldsba	[%i4+0x014]%asi,%l3	! %l3 = ffffffffffffff9a
!	Mem[0000000030181410] = ffffffff, %l1 = 00000000000000ff
	lduba	[%i6+%o5]0x81,%l1	! %l1 = 00000000000000ff
!	Mem[00000000100c1410] = 0c099c75, %l4 = 000000001bff7ea8
	lduwa	[%i3+%o5]0x88,%l4	! %l4 = 000000000c099c75
!	Mem[0000000010001400] = ffce8707, %l4 = 000000000c099c75
	ldswa	[%i0+%g0]0x80,%l4	! %l4 = ffffffffffce8707
!	Mem[0000000030001410] = 0c099c75, %l4 = ffffffffffce8707
	ldswa	[%i0+%o5]0x89,%l4	! %l4 = 000000000c099c75
!	Mem[00000000100c143c] = d8a6c77c, %l6 = ffffffffffffffff
	ldsh	[%i3+0x03e],%l6		! %l6 = ffffffffffffc77c
!	Mem[0000000030001410] = 759c090c9a000000, %l1 = 00000000000000ff
	ldxa	[%i0+%o5]0x81,%l1	! %l1 = 759c090c9a000000
!	%f24 = 34e3dedf, %f30 = 724869eb, %f6  = 00000000
	fdivs	%f24,%f30,%f6 		! %f6  = 0211893e
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1431] = f2891c0b, %l0 = 000000000000d8a6
	ldstub	[%i3+0x031],%l0		! %l0 = 00000089000000ff

p0_label_190:
!	Mem[0000000010101438] = 724869eb, %l5 = 00000000000000de
	swap	[%i4+0x038],%l5		! %l5 = 00000000724869eb
!	%f8  = 47d099b1, Mem[0000000010101408] = ffff9ad6
	sta	%f8 ,[%i4+%o4]0x88	! Mem[0000000010101408] = 47d099b1
!	%l4 = 000000000c099c75, Mem[0000000010041410] = 67ce0000
	stba	%l4,[%i1+%o5]0x88	! Mem[0000000010041410] = 67ce0075
!	%l7 = 00000000000000ff, Mem[0000000010181400] = 0787ce67
	stwa	%l7,[%i6+%g0]0x80	! Mem[0000000010181400] = 000000ff
!	Mem[0000000030081410] = ff000000, %l6 = ffffffffffffc77c
	ldstuba	[%i2+%o5]0x81,%l6	! %l6 = 000000ff000000ff
!	%f28 = 9a370706 00000044, %l2 = 0000000000000067
!	Mem[0000000010101420] = 1fffa7c532b0aa8b
	add	%i4,0x020,%g1
	stda	%f28,[%g1+%l2]ASI_PST16_PL ! Mem[0000000010101420] = 440000000607aa8b
!	%l3 = ffffffffffffff9a, Mem[0000000010101418] = 00000000
	stb	%l3,[%i4+0x018]		! Mem[0000000010101418] = 9a000000
!	%l7 = 00000000000000ff, Mem[0000000030001410] = 0c099c75
	stha	%l7,[%i0+%o5]0x89	! Mem[0000000030001410] = 0c0900ff
!	%l5 = 00000000724869eb, %l7 = 00000000000000ff, %l4 = 000000000c099c75
	xnor	%l5,%l7,%l4		! %l4 = ffffffff8db796eb
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = d8a6c77c 0787ce67, %l6 = 000000ff, %l7 = 000000ff
	ldda	[%i6+%o4]0x80,%l6	! %l6 = 00000000d8a6c77c 000000000787ce67

p0_label_191:
!	Mem[0000000010141408] = 00000000, %l7 = 000000000787ce67
	ldsh	[%i5+%o4],%l7		! %l7 = 0000000000000000
!	Mem[0000000030141410] = 00000044, %l6 = 00000000d8a6c77c
	ldsba	[%i5+%o5]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000030001410] = ff00090c9a000000, %f18 = b400ffff 00000000
	ldda	[%i0+%o5]0x81,%f18	! %f18 = ff00090c 9a000000
!	Mem[0000000030141408] = 67ce8707, %f9  = 67ce8707
	lda	[%i5+%o4]0x81,%f9 	! %f9 = 67ce8707
!	Mem[0000000010141408] = 00000000, %l5 = 00000000724869eb
	ldswa	[%i5+%o4]0x88,%l5	! %l5 = 0000000000000000
!	Code Fragment 3
p0_fragment_22:
!	%l0 = 0000000000000089
	setx	0x316fad87b2977068,%g7,%l0 ! %l0 = 316fad87b2977068
!	%l1 = 759c090c9a000000
	setx	0xeb811dd847ed4c17,%g7,%l1 ! %l1 = eb811dd847ed4c17
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 316fad87b2977068
	setx	0x852851af9dc91039,%g7,%l0 ! %l0 = 852851af9dc91039
!	%l1 = eb811dd847ed4c17
	setx	0x7f65b988572f8968,%g7,%l1 ! %l1 = 7f65b988572f8968
!	Mem[0000000030181410] = ffffffff, %l0 = 852851af9dc91039
	ldsba	[%i6+%o5]0x89,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010101400] = ad000000, %l7 = 0000000000000000
	ldswa	[%i4+%g0]0x88,%l7	! %l7 = ffffffffad000000
!	Mem[0000000010041408] = ffffffff, %l0 = ffffffffffffffff
	ldsba	[%i1+%o4]0x80,%l0	! %l0 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%f23 = 97442b29, Mem[0000000010001410] = 0000009a
	sta	%f23,[%i0+%o5]0x88	! Mem[0000000010001410] = 97442b29

p0_label_192:
!	Mem[0000000030181410] = ffffffff, %l7 = ffffffffad000000
	swapa	[%i6+%o5]0x89,%l7	! %l7 = 00000000ffffffff
!	Mem[00000000100c1408] = 3f3c2379, %l3 = ffffffffffffff9a
	ldstuba	[%i3+%o4]0x80,%l3	! %l3 = 0000003f000000ff
!	%l4 = ffffffff8db796eb, Mem[0000000020800040] = 00fffa54
	sth	%l4,[%o1+0x040]		! Mem[0000000020800040] = 96ebfa54
!	%l6 = 0000000000000000, Mem[0000000030141408] = 67ce8707
	stwa	%l6,[%i5+%o4]0x81	! Mem[0000000030141408] = 00000000
!	Mem[0000000030001410] = 0c0900ff, %l3 = 000000000000003f
	swapa	[%i0+%o5]0x89,%l3	! %l3 = 000000000c0900ff
!	%l2 = 00000067, %l3 = 0c0900ff, Mem[0000000010141400] = b199d000 00000000
	stda	%l2,[%i5+%g0]0x88	! Mem[0000000010141400] = 00000067 0c0900ff
!	%l7 = 00000000ffffffff, Mem[0000000010041418] = ff233c3f, %asi = 80
	stwa	%l7,[%i1+0x018]%asi	! Mem[0000000010041418] = ffffffff
!	%l2 = 00000067, %l3 = 0c0900ff, Mem[0000000010041408] = ffffffff 0787ce67
	stda	%l2,[%i1+%o4]0x80	! Mem[0000000010041408] = 00000067 0c0900ff
!	Mem[00000000100c1410] = 759c090c, %l0 = ffffffffffffffff
	swapa	[%i3+%o5]0x80,%l0	! %l0 = 00000000759c090c
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = ff7900ecf8608991, %l5 = 0000000000000000
	ldx	[%i2+%o4],%l5		! %l5 = ff7900ecf8608991

p0_label_193:
!	Mem[0000000030141400] = 47d099b1, %l3 = 000000000c0900ff
	ldsba	[%i5+%g0]0x81,%l3	! %l3 = 0000000000000047
!	Mem[0000000030101410] = ad8cffffffff0000, %f28 = 9a370706 00000044
	ldda	[%i4+%o5]0x89,%f28	! %f28 = ad8cffff ffff0000
!	Mem[0000000010101408] = b199d047, %l2 = 0000000000000067
	ldswa	[%i4+%o4]0x80,%l2	! %l2 = ffffffffb199d047
!	Mem[0000000030081400] = 00000000, %f28 = ad8cffff
	lda	[%i2+%g0]0x89,%f28	! %f28 = 00000000
!	Mem[0000000030041400] = ff000011, %l5 = ff7900ecf8608991
	ldsha	[%i1+%g0]0x81,%l5	! %l5 = ffffffffffffff00
!	Mem[0000000010101418] = 9a00000067ce8707, %f28 = 00000000 ffff0000
	ldd	[%i4+0x018],%f28	! %f28 = 9a000000 67ce8707
!	%l6 = 00000000, %l7 = ffffffff, Mem[0000000030041410] = 00000000 0c099c75
	stda	%l6,[%i1+%o5]0x81	! Mem[0000000030041410] = 00000000 ffffffff
!	Mem[0000000030101408] = ffffffff, %l7 = 00000000ffffffff
	ldsba	[%i4+%o4]0x89,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010141430] = 55c61a06, %l6 = 0000000000000000
	ldswa	[%i5+0x030]%asi,%l6	! %l6 = 0000000055c61a06
!	Starting 10 instruction Store Burst
!	%f24 = 34e3dedf 7586a107, Mem[0000000030001408] = 00000000 000000ff
	stda	%f24,[%i0+%o4]0x89	! Mem[0000000030001408] = 34e3dedf 7586a107

p0_label_194:
!	%f30 = 724869eb 3c990ff9, %l1 = 7f65b988572f8968
!	Mem[0000000010081420] = 67ce87071100ff00
	add	%i2,0x020,%g1
	stda	%f30,[%g1+%l1]ASI_PST32_P ! Mem[0000000010081420] = 67ce87071100ff00
!	Mem[0000000010101420] = 44000000, %l6 = 0000000055c61a06, %asi = 80
	swapa	[%i4+0x020]%asi,%l6	! %l6 = 0000000044000000
!	Mem[0000000030041410] = 00000000, %l0 = 00000000759c090c
	ldstuba	[%i1+%o5]0x89,%l0	! %l0 = 00000000000000ff
!	%f27 = 496a6cd3, Mem[0000000010181410] = 79233c3f
	sta	%f27,[%i6+%o5]0x88	! Mem[0000000010181410] = 496a6cd3
!	%f4  = 000000ff 00000000, Mem[0000000010181438] = 00000000 00000000
	std	%f4 ,[%i6+0x038]	! Mem[0000000010181438] = 000000ff 00000000
!	%f13 = ec0079ff, Mem[0000000030001400] = 0787ce67
	sta	%f13,[%i0+%g0]0x81	! Mem[0000000030001400] = ec0079ff
!	%f2  = ffffffff 0787ce67, %l1 = 7f65b988572f8968
!	Mem[0000000030001408] = 07a18675dfdee334
	add	%i0,0x008,%g1
	stda	%f2,[%g1+%l1]ASI_PST32_SL ! Mem[0000000030001408] = 07a18675dfdee334
!	Mem[0000000010101410] = 0c099c75, %l1 = 7f65b988572f8968
	ldsba	[%i4+%o5]0x88,%l1	! %l1 = 0000000000000075
!	Mem[000000001018142c] = f04ed1c6, %l7 = ffffffffffffffff, %asi = 80
	swapa	[%i6+0x02c]%asi,%l7	! %l7 = 00000000f04ed1c6
!	Starting 10 instruction Load Burst
!	Mem[0000000030001400] = ec0079ff, %l6 = 0000000044000000
	lduwa	[%i0+%g0]0x81,%l6	! %l6 = 00000000ec0079ff

p0_label_195:
!	Mem[00000000300c1408] = 00b4000000000000, %f14 = feb63fcf 7f800000
	ldda	[%i3+%o4]0x89,%f14	! %f14 = 00b40000 00000000
!	Mem[0000000030001408] = 34e3dedf 7586a107, %l4 = 8db796eb, %l5 = ffffff00
	ldda	[%i0+%o4]0x89,%l4	! %l4 = 000000007586a107 0000000034e3dedf
!	Mem[0000000030181408] = 00000000, %l0 = 0000000000000000
	lduba	[%i6+%o4]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000030141408] = 00000000, %l1 = 0000000000000075
	ldsha	[%i5+%o4]0x89,%l1	! %l1 = 0000000000000000
!	Mem[00000000100c1408] = 79233cff, %l1 = 0000000000000000
	lduha	[%i3+%o4]0x88,%l1	! %l1 = 0000000000003cff
!	Mem[00000000100c1408] = ff3c2379, %l2 = ffffffffb199d047
	ldswa	[%i3+%o4]0x80,%l2	! %l2 = ffffffffff3c2379
!	Mem[0000000030181400] = ec00ff00, %l7 = 00000000f04ed1c6
	ldsha	[%i6+%g0]0x81,%l7	! %l7 = ffffffffffffec00
!	Mem[00000000100c1408] = 00000000 79233cff, %l6 = ec0079ff, %l7 = ffffec00
	ldda	[%i3+%o4]0x88,%l6	! %l6 = 0000000079233cff 0000000000000000
!	Mem[0000000030081410] = ff000000000000ff, %l7 = 0000000000000000
	ldxa	[%i2+%o5]0x81,%l7	! %l7 = ff000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000010181408] = d8a6c77c, %l1 = 0000000000003cff
	ldstuba	[%i6+%o4]0x80,%l1	! %l1 = 000000d8000000ff

p0_label_196:
!	Mem[0000000030081400] = 00000000, %l7 = ff000000000000ff
	ldstuba	[%i2+%g0]0x81,%l7	! %l7 = 00000000000000ff
!	%f22 = b8f69713 97442b29, Mem[0000000010081408] = ff7900ec f8608991
	stda	%f22,[%i2+%o4]0x80	! Mem[0000000010081408] = b8f69713 97442b29
!	%l7 = 0000000000000000, Mem[0000000010141400] = 00000067
	stba	%l7,[%i5+%g0]0x88	! Mem[0000000010141400] = 00000000
!	%f16 = 00000037 1bff7ea8 ff00090c 9a000000
!	%f20 = ff000000 000000ff b8f69713 97442b29
!	%f24 = 34e3dedf 7586a107 c20a167e 496a6cd3
!	%f28 = 9a000000 67ce8707 724869eb 3c990ff9
	stda	%f16,[%i4]ASI_BLK_SL	! Block Store to 0000000030101400
!	%l4 = 000000007586a107, Mem[0000000021800180] = c360f854, %asi = 80
	stba	%l4,[%o3+0x180]%asi	! Mem[0000000021800180] = 0760f854
!	Mem[0000000030141400] = b199d047, %l1 = 00000000000000d8
	ldstuba	[%i5+%g0]0x89,%l1	! %l1 = 00000047000000ff
!	Mem[00000000100c1400] = 00000080, %l7 = 0000000000000000
	ldstuba	[%i3+%g0]0x88,%l7	! %l7 = 00000080000000ff
!	%f16 = 00000037 1bff7ea8 ff00090c 9a000000
!	%f20 = ff000000 000000ff b8f69713 97442b29
!	%f24 = 34e3dedf 7586a107 c20a167e 496a6cd3
!	%f28 = 9a000000 67ce8707 724869eb 3c990ff9
	stda	%f16,[%i1]ASI_BLK_SL	! Block Store to 0000000030041400
	membar	#Sync			! Added by membar checker (26)
!	Mem[0000000010041408] = 00000067, %l4 = 000000007586a107
	ldstuba	[%i1+%o4]0x80,%l4	! %l4 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081430] = 7eff00ff, %l6 = 0000000079233cff
	lduwa	[%i2+0x030]%asi,%l6	! %l6 = 000000007eff00ff

p0_label_197:
!	Mem[0000000010101434] = 9020fb0b, %l3 = 0000000000000047
	ldsba	[%i4+0x037]%asi,%l3	! %l3 = 000000000000000b
!	Mem[00000000100c1410] = ffffffff, %l7 = 0000000000000080
	lduwa	[%i3+%o5]0x80,%l7	! %l7 = 00000000ffffffff
!	Mem[0000000030141400] = b199d0ff, %l0 = 0000000000000000
	ldsba	[%i5+%g0]0x89,%l0	! %l0 = ffffffffffffffff
!	Mem[00000000300c1410] = 759c090c, %l2 = ffffffffff3c2379
	ldsha	[%i3+%o5]0x89,%l2	! %l2 = 000000000000090c
!	Mem[0000000010081410] = 000000ad, %l3 = 000000000000000b
	lduba	[%i2+%o5]0x88,%l3	! %l3 = 00000000000000ad
!	Mem[0000000030081410] = ff000000000000ff, %l2 = 000000000000090c
	ldxa	[%i2+%o5]0x81,%l2	! %l2 = ff000000000000ff
!	Mem[0000000030001410] = 0000003f, %l1 = 0000000000000047
	lduha	[%i0+%o5]0x89,%l1	! %l1 = 000000000000003f
!	Mem[0000000030081410] = ff000000000000ff, %f14 = 00b40000 00000000
	ldda	[%i2+%o5]0x81,%f14	! %f14 = ff000000 000000ff
!	Mem[0000000030181400] = ec00ff00 ff000000 00000000 32b0aa8b
!	Mem[0000000030181410] = 000000ad 0000007e 1f79e2ec 1f79100e
!	Mem[0000000030181420] = 955a90b6 ffffffff 55c61a06 1d9d4f0f
!	Mem[0000000030181430] = ffffb398 32b09a30 55c61a06 955a90b6
	ldda	[%i6]ASI_BLK_AIUS,%f0	! Block Load from 0000000030181400
!	Starting 10 instruction Store Burst
!	%f22 = b8f69713 97442b29, Mem[0000000030141400] = ffd099b1 3f3c23ef
	stda	%f22,[%i5+%g0]0x81	! Mem[0000000030141400] = b8f69713 97442b29

p0_label_198:
!	%l4 = 0000000000000000, %l4 = 0000000000000000, %y  = 00000000
	umul	%l4,%l4,%l6		! %l6 = 0000000000000000, %y = 00000000
!	%l6 = 0000000000000000, Mem[0000000010041408] = ff000067
	stha	%l6,[%i1+%o4]0x80	! Mem[0000000010041408] = 00000067
!	%f31 = 3c990ff9, Mem[00000000100c1410] = ffffffff
	sta	%f31,[%i3+%o5]0x80	! Mem[00000000100c1410] = 3c990ff9
!	%f0  = ec00ff00 ff000000 00000000 32b0aa8b
!	%f4  = 000000ad 0000007e 1f79e2ec 1f79100e
!	%f8  = 955a90b6 ffffffff 55c61a06 1d9d4f0f
!	%f12 = ffffb398 32b09a30 55c61a06 955a90b6
	stda	%f0,[%i6]ASI_BLK_S	! Block Store to 0000000030181400
!	Mem[00000000211c0000] = 00ffcd80, %l3 = 00000000000000ad
	ldstuba	[%o2+0x000]%asi,%l3	! %l3 = 00000000000000ff
!	%f27 = 496a6cd3, Mem[0000000030041410] = 000000ff
	sta	%f27,[%i1+%o5]0x89	! Mem[0000000030041410] = 496a6cd3
!	%l2 = 000000ff, %l3 = 00000000, Mem[0000000010041408] = 67000000 ff00090c
	stda	%l2,[%i1+%o4]0x88	! Mem[0000000010041408] = 000000ff 00000000
!	Mem[0000000020800001] = c6ffa5fa, %l1 = 000000000000003f
	ldstub	[%o1+0x001],%l1		! %l1 = 000000ff000000ff
!	%l2 = ff000000000000ff, Mem[0000000030041408] = 0000009a
	stba	%l2,[%i1+%o4]0x81	! Mem[0000000030041408] = ff00009a
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = 67ce0075, %l3 = 0000000000000000
	lduha	[%i1+%o5]0x88,%l3	! %l3 = 0000000000000075

p0_label_199:
	membar	#Sync			! Added by membar checker (27)
!	Mem[0000000030181408] = 8baab03200000000, %f16 = 00000037 1bff7ea8
	ldda	[%i6+%o4]0x89,%f16	! %f16 = 8baab032 00000000
!	Mem[0000000030081410] = 000000ff, %l7 = 00000000ffffffff
	lduwa	[%i2+%o5]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[0000000020800000] = c6ffa5fa, %l2 = ff000000000000ff
	lduba	[%o1+0x001]%asi,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030041400] = 1bff7ea8, %l3 = 0000000000000075
	lduwa	[%i1+%g0]0x89,%l3	! %l3 = 000000001bff7ea8
!	Mem[0000000010081428] = 0000008b00000000, %f2  = 00000000 32b0aa8b
	ldda	[%i2+0x028]%asi,%f2 	! %f2  = 0000008b 00000000
!	Mem[00000000100c1400] = 000000ff, %l5 = 0000000034e3dedf
	lduba	[%i3+%g0]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[00000000300c1408] = 00000000, %f28 = 9a000000
	lda	[%i3+%o4]0x89,%f28	! %f28 = 00000000
!	Mem[0000000010041400] = 0787ce67, %f6  = 1f79e2ec
	lda	[%i1+%g0]0x88,%f6 	! %f6 = 0787ce67
!	Mem[0000000030041410] = d36c6a49, %l3 = 000000001bff7ea8
	ldsba	[%i1+%o5]0x81,%l3	! %l3 = ffffffffffffffd3
!	Starting 10 instruction Store Burst
!	%l5 = 00000000000000ff, Mem[0000000030001408] = 7586a107
	stwa	%l5,[%i0+%o4]0x89	! Mem[0000000030001408] = 000000ff

p0_label_200:
!	%l4 = 00000000, %l5 = 000000ff, Mem[0000000010001408] = ff000000 67ce8707
	stda	%l4,[%i0+%o4]0x88	! Mem[0000000010001408] = 00000000 000000ff
!	%f6  = 0787ce67 1f79100e, %l6 = 0000000000000000
!	Mem[00000000300c1410] = 0c099c7500000000
	add	%i3,0x010,%g1
	stda	%f6,[%g1+%l6]ASI_PST16_S ! Mem[00000000300c1410] = 0c099c7500000000
!	%l0 = ffffffffffffffff, Mem[0000000030101400] = a87eff1b
	stba	%l0,[%i4+%g0]0x81	! Mem[0000000030101400] = ff7eff1b
!	%f22 = b8f69713 97442b29, %l4 = 0000000000000000
!	Mem[0000000030141420] = 33a771b244ff50ff
	add	%i5,0x020,%g1
	stda	%f22,[%g1+%l4]ASI_PST8_S ! Mem[0000000030141420] = 33a771b244ff50ff
!	Mem[0000000030181408] = 00000000, %l6 = 0000000000000000
	swapa	[%i6+%o4]0x89,%l6	! %l6 = 0000000000000000
!	%f23 = 97442b29, Mem[0000000030141410] = 44000000
	sta	%f23,[%i5+%o5]0x89	! Mem[0000000030141410] = 97442b29
!	Mem[0000000010101410] = 759c090c, %l4 = 0000000000000000
	swapa	[%i4+%o5]0x80,%l4	! %l4 = 00000000759c090c
!	%f10 = 55c61a06 1d9d4f0f, Mem[0000000010001420] = 80000000 00000000
	stda	%f10,[%i0+0x020]%asi	! Mem[0000000010001420] = 55c61a06 1d9d4f0f
!	%f24 = 34e3dedf 7586a107, Mem[0000000010081408] = 1397f6b8 292b4497
	stda	%f24,[%i2+%o4]0x88	! Mem[0000000010081408] = 34e3dedf 7586a107
!	Starting 10 instruction Load Burst
!	Mem[0000000010141430] = 55c61a06, %l2 = 00000000000000ff
	lduha	[%i5+0x032]%asi,%l2	! %l2 = 0000000000001a06

	ba,a	p0_not_taken_0_end
p0_not_taken_0:
!	The following code should not be executed
	ldxa	[%i4+0x008]%asi,%l6
	nop
	fmuls	%f5,%f10,%f4
	ldswa	[%i4+0x020]%asi,%l0
	sdiv	%l4,%l3,%l2
	ba,a	p0_branch_failed
p0_not_taken_0_end:


!	End of Random Code for Thread 0


!	Check Registers

p0_check_registers:
	set	p0_expected_registers,%g1
	ldx	[%g1+0x000],%g2
	cmp	%l0,%g2			! %l0 should be ffffffffffffffff
	bne,a,pn %xcc,p0_reg_l0_fail
	mov	%l0,%g3
	ldx	[%g1+0x008],%g2
	cmp	%l1,%g2			! %l1 should be 00000000000000ff
	bne,a,pn %xcc,p0_reg_l1_fail
	mov	%l1,%g3
	ldx	[%g1+0x010],%g2
	cmp	%l2,%g2			! %l2 should be 0000000000001a06
	bne,a,pn %xcc,p0_reg_l2_fail
	mov	%l2,%g3
	ldx	[%g1+0x018],%g2
	cmp	%l3,%g2			! %l3 should be ffffffffffffffd3
	bne,a,pn %xcc,p0_reg_l3_fail
	mov	%l3,%g3
	ldx	[%g1+0x020],%g2
	cmp	%l4,%g2			! %l4 should be 00000000759c090c
	bne,a,pn %xcc,p0_reg_l4_fail
	mov	%l4,%g3
	ldx	[%g1+0x028],%g2
	cmp	%l5,%g2			! %l5 should be 00000000000000ff
	bne,a,pn %xcc,p0_reg_l5_fail
	mov	%l5,%g3
	ldx	[%g1+0x030],%g2
	cmp	%l6,%g2			! %l6 should be 0000000000000000
	bne,a,pn %xcc,p0_reg_l6_fail
	mov	%l6,%g3
	ldx	[%g1+0x038],%g2
	cmp	%l7,%g2			! %l7 should be 00000000000000ff
	bne,a,pn %xcc,p0_reg_l7_fail
	mov	%l7,%g3

!	Check Floating Point Registers

p0_check_fp_registers:
	set	p0_expected_fp_regs,%g3
	std	%f0,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x00],%l0
	cmp	%l0,%l1			! %f0  should be ec00ff00 ff000000
	bne	%xcc,p0_f0_fail
	std	%f2,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x08],%l0
	cmp	%l0,%l1			! %f2  should be 0000008b 00000000
	bne	%xcc,p0_f2_fail
	std	%f4,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x10],%l0
	cmp	%l0,%l1			! %f4  should be 000000ad 0000007e
	bne	%xcc,p0_f4_fail
	std	%f6,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x18],%l0
	cmp	%l0,%l1			! %f6  should be 0787ce67 1f79100e
	bne	%xcc,p0_f6_fail
	std	%f8,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x20],%l0
	cmp	%l0,%l1			! %f8  should be 955a90b6 ffffffff
	bne	%xcc,p0_f8_fail
	std	%f10,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x28],%l0
	cmp	%l0,%l1			! %f10 should be 55c61a06 1d9d4f0f
	bne	%xcc,p0_f10_fail
	std	%f12,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x30],%l0
	cmp	%l0,%l1			! %f12 should be ffffb398 32b09a30
	bne	%xcc,p0_f12_fail
	std	%f14,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x38],%l0
	cmp	%l0,%l1			! %f14 should be 55c61a06 955a90b6
	bne	%xcc,p0_f14_fail
	std	%f16,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x40],%l0
	cmp	%l0,%l1			! %f16 should be 8baab032 00000000
	bne	%xcc,p0_f16_fail
	std	%f18,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x48],%l0
	cmp	%l0,%l1			! %f18 should be ff00090c 9a000000
	bne	%xcc,p0_f18_fail
	std	%f20,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x50],%l0
	cmp	%l0,%l1			! %f20 should be ff000000 000000ff
	bne	%xcc,p0_f20_fail
	std	%f22,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x58],%l0
	cmp	%l0,%l1			! %f22 should be b8f69713 97442b29
	bne	%xcc,p0_f22_fail
	std	%f24,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x60],%l0
	cmp	%l0,%l1			! %f24 should be 34e3dedf 7586a107
	bne	%xcc,p0_f24_fail
	std	%f26,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x68],%l0
	cmp	%l0,%l1			! %f26 should be c20a167e 496a6cd3
	bne	%xcc,p0_f26_fail
	std	%f28,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x70],%l0
	cmp	%l0,%l1			! %f28 should be 00000000 67ce8707
	bne	%xcc,p0_f28_fail
	std	%f30,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x78],%l0
	cmp	%l0,%l1			! %f30 should be 724869eb 3c990ff9
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
	sub	%l4,%l0,%l5
	ldstuba	[%i6+%o5]ASI_AS_IF_USER_PRIMARY,%l0	! Mem[0000000010181410]
	done

p0_trap1o:
	sub	%l4,%l0,%l5
	ldstuba	[%o6+%i5]ASI_AS_IF_USER_PRIMARY,%l0	! Mem[0000000010181410]
	done


p0_trap2e:
	xor	%l0,-0x245,%l3
	fdivs	%f8 ,%f4 ,%f13
	fmuls	%f6 ,%f0 ,%f5 
	subc	%l1,-0x1d9,%l0
	done

p0_trap2o:
	xor	%l0,-0x245,%l3
	fdivs	%f8 ,%f4 ,%f13
	fmuls	%f6 ,%f0 ,%f5 
	subc	%l1,-0x1d9,%l0
	done


p0_trap3e:
	andn	%l6,%l4,%l0
	add	%l5,%l1,%l3
	done

p0_trap3o:
	andn	%l6,%l4,%l0
	add	%l5,%l1,%l3
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
	ldx	[%g1+0x000],%l0		! %l0 = 415756c46940ca2a
	ldx	[%g1+0x008],%l1		! %l1 = 65fb82c89a772f40
	ldx	[%g1+0x010],%l2		! %l2 = 879d1bc02a5d3cfe
	ldx	[%g1+0x018],%l3		! %l3 = d5d6250268cd7ae8
	ldx	[%g1+0x020],%l4		! %l4 = 7501bb700f1547c2
	ldx	[%g1+0x028],%l5		! %l5 = d9cd999a6e61420b
	ldx	[%g1+0x030],%l6		! %l6 = c584bb7669bc7d11
	ldx	[%g1+0x038],%l7		! %l7 = dbba379213520f54

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
	sub	%l4,%l0,%l5
	ldstub	[%o3+0x040],%l7		! Mem[0000000021800040]
	jmpl	%o7,%g0
	andn	%l6,%l4,%l0
p0_near_0_he:
	jmpl	%o7,%g0
	xor	%l3,-0xbc4,%l1
	jmpl	%o7,%g0
	nop
near0_b2b_h:
	subc	%l0,%l2,%l7
	fdivs	%f17,%f21,%f28
	fdivs	%f20,%f16,%f24
	xor	%l1,%l4,%l6
	jmpl	%o7,%g0
	fmuls	%f19,%f28,%f23
near0_b2b_l:
	fadds	%f12,%f0 ,%f4 
	fsubs	%f8 ,%f5 ,%f9 
	xor	%l0,0x882,%l6
	fadds	%f1 ,%f0 ,%f15
	jmpl	%o7,%g0
	smul	%l3,-0x4c8,%l5
user_near0_end:
	.seg	"text"
	.align	0x2000
user_near1_start:
p0_near_1_le:
	stw	%l3,[%i6+0x004]		! Mem[0000000010181404]
	fadds	%f15,%f11,%f11
	ldx	[%i6+0x038],%l6		! Mem[0000000010181438]
	mulx	%l5,-0xa98,%l4
	xor	%l1,0x52a,%l3
	fdivs	%f6 ,%f11,%f15
	fdivs	%f12,%f12,%f4 
	jmpl	%o7,%g0
	fadds	%f0 ,%f10,%f10
p0_near_1_he:
	fadds	%f26,%f25,%f27
	sdivx	%l1,%l0,%l7
	subc	%l7,%l7,%l7
	fsqrts	%f23,%f17
	xnor	%l3,-0xd0f,%l2
	jmpl	%o7,%g0
	add	%l0,%l4,%l2
near1_b2b_h:
	subc	%l4,%l0,%l1
	xnor	%l3,0x89e,%l1
	mulx	%l4,%l0,%l4
	umul	%l0,0x1be,%l7
	jmpl	%o7,%g0
	addc	%l4,-0xef0,%l3
near1_b2b_l:
	and	%l7,0x8fd,%l5
	fdivs	%f15,%f7 ,%f10
	xnor	%l1,%l3,%l3
	fcmps	%fcc0,%f5 ,%f8 
	jmpl	%o7,%g0
	umul	%l4,%l5,%l0
user_near1_end:
	.seg	"text"
	.align	0x2000
user_near2_start:
p0_near_2_le:
	jmpl	%o7,%g0
	sdivx	%l2,%l6,%l3
	jmpl	%o7,%g0
	nop
p0_near_2_he:
	smul	%l0,0xd1e,%l7
	jmpl	%o7,%g0
	or	%l6,%l0,%l0
near2_b2b_h:
	jmpl	%o7,%g0
	fcmps	%fcc1,%f16,%f17
	jmpl	%o7,%g0
	nop
near2_b2b_l:
	jmpl	%o7,%g0
	add	%l3,%l5,%l2
	jmpl	%o7,%g0
	nop
user_near2_end:
	.seg	"text"
	.align	0x2000
user_near3_start:
p0_near_3_le:
	umul	%l1,%l1,%l1
	st	%f2 ,[%i0+0x038]	! Mem[0000000010001438]
	udivx	%l2,0xa90,%l2
	std	%l6,[%i3+0x028]		! Mem[00000000100c1428]
	xnor	%l6,-0xfc7,%l1
	jmpl	%o7,%g0
	sdivx	%l6,-0x748,%l0
p0_near_3_he:
	fsqrts	%f27,%f27
	fadds	%f17,%f21,%f24
	addc	%l3,0x488,%l3
	jmpl	%o7,%g0
	sub	%l6,0xf6b,%l3
near3_b2b_h:
	orn	%l0,%l4,%l3
	fsubs	%f28,%f23,%f16
	jmpl	%o7,%g0
	add	%l5,%l3,%l3
near3_b2b_l:
	fcmps	%fcc2,%f5 ,%f5 
	mulx	%l7,-0x576,%l2
	jmpl	%o7,%g0
	fdivs	%f10,%f0 ,%f13
user_near3_end:
	.seg	"text"
	.text
	.align	0x2000
user_far0_start:
p0_far_0_le:
	swap	[%i6+0x010],%l7		! Mem[0000000010181410]
	jmpl	%o7,%g0
	andn	%l6,-0x74d,%l5
p0_far_0_lem:
	membar	#Sync
	swap	[%i6+0x010],%l7		! Mem[0000000010181410]
	jmpl	%o7,%g0
	andn	%l6,-0x74d,%l5
p0_far_0_he:
	add	%l2,-0x4f6,%l4
	mulx	%l3,0x106,%l1
	udivx	%l5,0x66a,%l5
	udivx	%l3,-0xf92,%l5
	fcmps	%fcc3,%f27,%f29
	jmpl	%o7,%g0
	xnor	%l4,%l3,%l6
p0_far_0_hem:
	add	%l2,-0x4f6,%l4
	mulx	%l3,0x106,%l1
	udivx	%l5,0x66a,%l5
	udivx	%l3,-0xf92,%l5
	fcmps	%fcc3,%f27,%f29
	jmpl	%o7,%g0
	xnor	%l4,%l3,%l6
p0_loop_branch_0:
	jmpl	%o7+12,%g0
	add	%l0,1,%l0
far0_b2b_h:
	jmpl	%o7,%g0
	smul	%l7,%l7,%l5
	jmpl	%o7,%g0
	nop
far0_b2b_l:
	jmpl	%o7,%g0
	sdivx	%l1,%l3,%l0
	jmpl	%o7,%g0
	nop
user_far0_end:
	.seg	"text"
	.text
	.align	0x2000
user_far1_start:
p0_far_1_le:
	jmpl	%o7,%g0
	fitod	%f5 ,%f8 
	jmpl	%o7,%g0
	nop
p0_far_1_lem:
	jmpl	%o7,%g0
	fitod	%f5 ,%f8 
	jmpl	%o7,%g0
	nop
p0_far_1_he:
	fsubs	%f24,%f30,%f23
	ldx	[%i2+0x008],%l5		! Mem[0000000010081408]
	jmpl	%o7,%g0
	fadds	%f22,%f17,%f23
p0_far_1_hem:
	fsubs	%f24,%f30,%f23
	membar	#Sync
	ldx	[%i2+0x008],%l5		! Mem[0000000010081408]
	jmpl	%o7,%g0
	fadds	%f22,%f17,%f23
p0_loop_branch_1:
	jmpl	%o7+12,%g0
	add	%l0,2,%l0
far1_b2b_h:
	fsubs	%f16,%f27,%f27
	jmpl	%o7,%g0
	udivx	%l3,%l6,%l6
far1_b2b_l:
	udivx	%l4,%l7,%l1
	jmpl	%o7,%g0
	xor	%l3,%l5,%l1
user_far1_end:
	.seg	"text"
	.text
	.align	0x2000
user_far2_start:
p0_far_2_le:
	smul	%l4,%l4,%l6
	stb	%l4,[%i4+0x009]		! Mem[0000000010101409]
	or	%l3,0xbc3,%l0
	st	%f15,[%i2+0x018]	! Mem[0000000010081418]
	sub	%l7,-0x736,%l4
	jmpl	%o7,%g0
	fmuls	%f15,%f1 ,%f1 
p0_far_2_lem:
	smul	%l4,%l4,%l6
	membar	#Sync
	stb	%l4,[%i4+0x009]		! Mem[0000000010101409]
	or	%l3,0xbc3,%l0
	st	%f15,[%i2+0x018]	! Mem[0000000010081418]
	sub	%l7,-0x736,%l4
	jmpl	%o7,%g0
	fmuls	%f15,%f1 ,%f1 
p0_far_2_he:
	addc	%l4,-0x793,%l7
	sub	%l7,%l4,%l6
	mulx	%l2,%l3,%l2
	xnor	%l1,%l6,%l1
	fsubs	%f26,%f29,%f17
	jmpl	%o7,%g0
	xnor	%l4,%l2,%l2
p0_far_2_hem:
	addc	%l4,-0x793,%l7
	sub	%l7,%l4,%l6
	mulx	%l2,%l3,%l2
	xnor	%l1,%l6,%l1
	fsubs	%f26,%f29,%f17
	jmpl	%o7,%g0
	xnor	%l4,%l2,%l2
p0_loop_branch_2:
	jmpl	%o7+12,%g0
	add	%l0,3,%l0
far2_b2b_h:
	udivx	%l7,%l7,%l7
	mulx	%l2,0xcc0,%l1
	subc	%l3,%l2,%l2
	sub	%l4,0x8cc,%l3
	addc	%l4,%l3,%l7
	sdivx	%l3,-0xb52,%l1
	jmpl	%o7,%g0
	umul	%l0,-0xf2b,%l7
far2_b2b_l:
	fdtoi	%f12,%f15
	xnor	%l2,%l7,%l6
	fmuls	%f10,%f12,%f0 
	fcmps	%fcc0,%f6 ,%f3 
	or	%l6,-0xe53,%l4
	addc	%l5,0xcbf,%l5
	jmpl	%o7,%g0
	xor	%l7,%l0,%l7
user_far2_end:
	.seg	"text"
	.text
	.align	0x2000
user_far3_start:
p0_far_3_le:
	fdivs	%f5 ,%f2 ,%f2 
	std	%l0,[%i0+0x000]		! Mem[0000000010001400]
	add	%l2,-0x463,%l1
	jmpl	%o7,%g0
	umul	%l5,0xe9b,%l2
p0_far_3_lem:
	fdivs	%f5 ,%f2 ,%f2 
	membar	#Sync
	std	%l0,[%i0+0x000]		! Mem[0000000010001400]
	add	%l2,-0x463,%l1
	jmpl	%o7,%g0
	umul	%l5,0xe9b,%l2
p0_far_3_he:
	sdivx	%l4,%l1,%l3
	fcmps	%fcc0,%f27,%f21
	addc	%l4,%l4,%l5
	fsubs	%f26,%f21,%f28
	st	%f28,[%i5+0x028]	! Mem[0000000010141428]
	xnor	%l7,%l2,%l1
	jmpl	%o7,%g0
	xnor	%l1,-0x019,%l4
p0_far_3_hem:
	sdivx	%l4,%l1,%l3
	fcmps	%fcc0,%f27,%f21
	addc	%l4,%l4,%l5
	fsubs	%f26,%f21,%f28
	membar	#Sync
	st	%f28,[%i5+0x028]	! Mem[0000000010141428]
	xnor	%l7,%l2,%l1
	jmpl	%o7,%g0
	xnor	%l1,-0x019,%l4
p0_loop_branch_3:
	jmpl	%o7+12,%g0
	add	%l0,4,%l0
far3_b2b_h:
	umul	%l0,%l2,%l1
	jmpl	%o7,%g0
	fsubs	%f21,%f28,%f28
far3_b2b_l:
	mulx	%l5,%l7,%l2
	jmpl	%o7,%g0
	andn	%l6,%l4,%l2
user_far3_end:
	.seg	"text"
	.align	0x2000
user_jump0_start:
	INIT_MEM(0, 0x0010, 1, +, 0, +, 0)
p0_jmpl_0_le:
	sdivx	%l4,%l0,%l5
	fsubs	%f14,%f1 ,%f14
	jmpl	%g6+8,%g0
	sub	%l6,0x7c7,%l6
p0_call_0_le:
	fcmps	%fcc1,%f8 ,%f3 
	udivx	%l6,%l4,%l5
	add	%l7,%l6,%l0
	retl
	udivx	%l5,0xfc3,%l0
p0_jmpl_0_lo:
	sdivx	%l4,%l0,%l5
	fsubs	%f14,%f1 ,%f14
	jmpl	%g6+8,%g0
	sub	%l6,0x7c7,%l6
p0_call_0_lo:
	fcmps	%fcc1,%f8 ,%f3 
	udivx	%l6,%l4,%l5
	add	%l7,%l6,%l0
	retl
	udivx	%l5,0xfc3,%l0
p0_jmpl_0_he:
	add	%l5,-0xf7b,%l1
	jmpl	%g6+8,%g0
	fdtoi	%f28,%f20
p0_call_0_he:
	retl
	or	%l7,%l6,%l0
p0_jmpl_0_ho:
	add	%l5,-0xf7b,%l1
	jmpl	%g6+8,%g0
	fdtoi	%f28,%f20
p0_call_0_ho:
	retl
	or	%l7,%l6,%l0
user_jump0_end:
	.seg	"text"
	.align	0x2000
user_jump1_start:
	INIT_MEM(0, 0x0020, 1, +, 0, +, 0)
p0_jmpl_1_le:
	smul	%l2,-0x794,%l0
	jmpl	%g6+8,%g0
	subc	%l6,-0x7fc,%l5
p0_call_1_le:
	retl
	or	%l1,0x2b9,%l3
p0_jmpl_1_lo:
	smul	%l2,-0x794,%l0
	jmpl	%g6+8,%g0
	subc	%l6,-0x7fc,%l5
p0_call_1_lo:
	retl
	or	%l1,0x2b9,%l3
p0_jmpl_1_he:
	smul	%l5,0x52a,%l7
	sdivx	%l3,0x06b,%l4
	fadds	%f21,%f17,%f27
	ld	[%i0+0x00c],%f24	! Mem[000000001000140c]
	sub	%l2,-0xcfa,%l0
	addc	%l0,%l1,%l5
	subc	%l6,-0xe8b,%l7
	jmpl	%g6+8,%g0
	mulx	%l1,%l4,%l6
p0_call_1_he:
	umul	%l5,%l4,%l1
	fsubs	%f31,%f24,%f18
	sub	%l4,%l1,%l0
	add	%l2,0x5ba,%l1
	umul	%l3,%l1,%l4
	retl
	fsqrts	%f19,%f20
p0_jmpl_1_ho:
	smul	%l5,0x52a,%l7
	sdivx	%l3,0x06b,%l4
	fadds	%f21,%f17,%f27
	ld	[%o0+0x00c],%f24	! Mem[000000001000140c]
	sub	%l2,-0xcfa,%l0
	addc	%l0,%l1,%l5
	subc	%l6,-0xe8b,%l7
	jmpl	%g6+8,%g0
	mulx	%l1,%l4,%l6
p0_call_1_ho:
	umul	%l5,%l4,%l1
	fsubs	%f31,%f24,%f18
	sub	%l4,%l1,%l0
	add	%l2,0x5ba,%l1
	umul	%l3,%l1,%l4
	retl
	fsqrts	%f19,%f20
user_jump1_end:
	.seg	"text"
	.align	0x2000
user_jump2_start:
	INIT_MEM(0, 0x0030, 1, +, 0, +, 0)
p0_jmpl_2_le:
	addc	%l1,%l2,%l2
	subc	%l7,-0xa85,%l5
	ldd	[%i4+0x000],%f14	! Mem[0000000010101400]
	fsubs	%f9 ,%f4 ,%f15
	jmpl	%g6+8,%g0
	ldd	[%i2+0x030],%f0 	! Mem[0000000010081430]
p0_call_2_le:
	fcmps	%fcc0,%f1 ,%f4 
	fadds	%f9 ,%f5 ,%f12
	fmuls	%f11,%f1 ,%f3 
	fstoi	%f2 ,%f6 
	fadds	%f15,%f3 ,%f1 
	xor	%l0,%l5,%l2
	orn	%l6,-0x371,%l1
	retl
	addc	%l1,%l3,%l5
p0_jmpl_2_lo:
	addc	%l1,%l2,%l2
	subc	%l7,-0xa85,%l5
	ldd	[%o4+0x000],%f14	! Mem[0000000010101400]
	fsubs	%f9 ,%f4 ,%f15
	jmpl	%g6+8,%g0
	ldd	[%o2+0x030],%f0 	! Mem[0000000010081430]
p0_call_2_lo:
	fcmps	%fcc0,%f1 ,%f4 
	fadds	%f9 ,%f5 ,%f12
	fmuls	%f11,%f1 ,%f3 
	fstoi	%f2 ,%f6 
	fadds	%f15,%f3 ,%f1 
	xor	%l0,%l5,%l2
	orn	%l6,-0x371,%l1
	retl
	addc	%l1,%l3,%l5
p0_jmpl_2_he:
	smul	%l5,%l6,%l5
	mulx	%l7,-0xd9d,%l1
	umul	%l0,0x51c,%l6
	jmpl	%g6+8,%g0
	sub	%l5,%l4,%l3
p0_call_2_he:
	fstod	%f20,%f24
	fcmps	%fcc0,%f25,%f26
	fadds	%f23,%f26,%f30
	or	%l0,-0xf9c,%l1
	fsqrts	%f28,%f16
	orn	%l4,0x63c,%l4
	retl
	xnor	%l0,%l5,%l4
p0_jmpl_2_ho:
	smul	%l5,%l6,%l5
	mulx	%l7,-0xd9d,%l1
	umul	%l0,0x51c,%l6
	jmpl	%g6+8,%g0
	sub	%l5,%l4,%l3
p0_call_2_ho:
	fstod	%f20,%f24
	fcmps	%fcc0,%f25,%f26
	fadds	%f23,%f26,%f30
	or	%l0,-0xf9c,%l1
	fsqrts	%f28,%f16
	orn	%l4,0x63c,%l4
	retl
	xnor	%l0,%l5,%l4
user_jump2_end:
	.seg	"text"
	.align	0x2000
user_jump3_start:
	INIT_MEM(0, 0x0040, 1, +, 0, +, 0)
p0_jmpl_3_le:
	xnor	%l3,%l6,%l0
	fcmps	%fcc0,%f3 ,%f9 
	umul	%l5,%l3,%l0
	or	%l2,%l0,%l2
	addc	%l4,0x6b4,%l0
	jmpl	%g6+8,%g0
	fstod	%f6 ,%f8 
p0_call_3_le:
	xor	%l0,-0x907,%l5
	andn	%l7,%l0,%l5
	addc	%l7,-0xbf4,%l2
	orn	%l2,%l4,%l6
	subc	%l1,%l2,%l3
	smul	%l3,%l6,%l2
	and	%l7,0x6d1,%l3
	retl
	addc	%l1,-0x68b,%l4
p0_jmpl_3_lo:
	xnor	%l3,%l6,%l0
	fcmps	%fcc0,%f3 ,%f9 
	umul	%l5,%l3,%l0
	or	%l2,%l0,%l2
	addc	%l4,0x6b4,%l0
	jmpl	%g6+8,%g0
	fstod	%f6 ,%f8 
p0_call_3_lo:
	xor	%l0,-0x907,%l5
	andn	%l7,%l0,%l5
	addc	%l7,-0xbf4,%l2
	orn	%l2,%l4,%l6
	subc	%l1,%l2,%l3
	smul	%l3,%l6,%l2
	and	%l7,0x6d1,%l3
	retl
	addc	%l1,-0x68b,%l4
p0_jmpl_3_he:
	jmpl	%g6+8,%g0
	fdivs	%f24,%f17,%f28
p0_call_3_he:
	retl
	lduw	[%i0+0x030],%l6		! Mem[0000000010001430]
p0_jmpl_3_ho:
	jmpl	%g6+8,%g0
	fdivs	%f24,%f17,%f28
p0_call_3_ho:
	retl
	lduw	[%o0+0x030],%l6		! Mem[0000000010001430]
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
	.word	0x415756c4,0x6940ca2a		! Init value for %l0
	.word	0x65fb82c8,0x9a772f40		! Init value for %l1
	.word	0x879d1bc0,0x2a5d3cfe		! Init value for %l2
	.word	0xd5d62502,0x68cd7ae8		! Init value for %l3
	.word	0x7501bb70,0x0f1547c2		! Init value for %l4
	.word	0xd9cd999a,0x6e61420b		! Init value for %l5
	.word	0xc584bb76,0x69bc7d11		! Init value for %l6
	.word	0xdbba3792,0x13520f54		! Init value for %l7
	.align	64
p0_init_freg:
	.word	0x3a0cc464,0xe025b4c3		! Init value for %f0 
	.word	0x4e446631,0xaaa2216e		! Init value for %f2 
	.word	0xa485631c,0xd9ea2667		! Init value for %f4 
	.word	0x01a6d6f0,0xfc757cfa		! Init value for %f6 
	.word	0xdeaebd7d,0x98c0f273		! Init value for %f8 
	.word	0x3430b6a3,0x65fc5512		! Init value for %f10
	.word	0x1f790fec,0x0c529c75		! Init value for %f12
	.word	0xa0e8d7b9,0x535b3e72		! Init value for %f14
	.word	0x396a40d9,0x052dfec6		! Init value for %f16
	.word	0x2755f48c,0x822e7630		! Init value for %f18
	.word	0x1b50de40,0xb8120897		! Init value for %f20
	.word	0x22529dbe,0xd958e0ad		! Init value for %f22
	.word	0xe8146e4a,0x98eb928c		! Init value for %f24
	.word	0x400be218,0x29ff90a5		! Init value for %f26
	.word	0x8c6dbdc0,0x55c61a06		! Init value for %f28
	.word	0xd9f5beab,0x7e2240b7		! Init value for %f30
	.word	0x85d0cf2e,0x5e5a282f		! Init value for %f32
	.word	0xb7996b52,0x2d7164e2		! Init value for %f34
	.word	0x86ad6e96,0xc7e242e3		! Init value for %f36
	.word	0x9b0222ab,0x6d33692f		! Init value for %f38
	.word	0xc1b0b291,0x8d354463		! Init value for %f40
	.word	0x181fc51a,0xdb1c4dad		! Init value for %f42
	.word	0xe85cd942,0x004874d4		! Init value for %f44
	.word	0x72d1a24c,0x0215fdf2		! Init value for %f46
	.word	0x5f590928,0x8d5d5c95
	.word	0xf4489320,0x92f512ad
	.word	0x05f81fd2,0x3540d3cb
	.word	0x3e81dc20,0xe1b849d3
	.word	0xd43e5c96,0x86db495a
	.word	0xa04dc21e,0x8093c88b
	.word	0x25c2ae3b,0xabf9c24e
	.word	0x9eca718a,0x45fcc922
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
	.word	0xffffffff,0xffffffff
	.word	0x00000000,0x000000ff
	.word	0x00000000,0x00001a06
	.word	0xffffffff,0xffffffd3
	.word	0x00000000,0x759c090c
	.word	0x00000000,0x000000ff
	.word	0x00000000,0x00000000
	.word	0x00000000,0x000000ff
p0_expected_fp_regs:
	.word	0xec00ff00,0xff000000
	.word	0x0000008b,0x00000000
	.word	0x000000ad,0x0000007e
	.word	0x0787ce67,0x1f79100e
	.word	0x955a90b6,0xffffffff
	.word	0x55c61a06,0x1d9d4f0f
	.word	0xffffb398,0x32b09a30
	.word	0x55c61a06,0x955a90b6
	.word	0x8baab032,0x00000000
	.word	0xff00090c,0x9a000000
	.word	0xff000000,0x000000ff
	.word	0xb8f69713,0x97442b29
	.word	0x34e3dedf,0x7586a107
	.word	0xc20a167e,0x496a6cd3
	.word	0x00000000,0x67ce8707
	.word	0x724869eb,0x3c990ff9
	.word	0x00000010,0x00000400		! %fsr = 0000001000000400
p0_local0_expect:
	.word	0xffce8707,0x11000000
	.word	0x00000000,0xff000000
	.word	0x292b4497,0x00ffff00
	.word	0x33f371b2,0x00000000
	.word	0x55c61a06,0x1d9d4f0f
	.word	0x07aab032,0xffffffff
	.word	0xbfc28cf8,0xffff9744
	.word	0x70db00d2,0x7f800000
p0_local0_sec_expect:
	.word	0xec0079ff,0x0000c6ff
	.word	0xff000000,0xdfdee334
	.word	0x3f000000,0x9a000000
	.word	0x00ffff00,0xff000000
	.word	0xaa507244,0x285ca732
	.word	0xa98a274a,0x0000799a
	.word	0xf2891c0b,0xdefb9782
	.word	0xa14abe9d,0xd8a6c77c
p0_local1_expect:
	.word	0x67ce8707,0x11000000
	.word	0xff000000,0x00000000
	.word	0x7500ce67,0xb199d047
	.word	0xffffffff,0x00000000
	.word	0x80000000,0x0787ce67
	.word	0x07aab032,0xffffffff
	.word	0xbfc28cf8,0x00000000
	.word	0x70db00d2,0x7f800000
p0_local1_sec_expect:
	.word	0xa87eff1b,0x37000000
	.word	0xff00009a,0x0c0900ff
	.word	0xd36c6a49,0x000000ff
	.word	0x292b4497,0x1397f6b8
	.word	0x07a18675,0xdfdee334
	.word	0xd36c6a49,0x7e160ac2
	.word	0x0787ce67,0x0000009a
	.word	0xf90f993c,0xeb694872
p0_local2_expect:
	.word	0x0000799a,0x00000075
	.word	0x07a18675,0xdfdee334
	.word	0xad000000,0x00000000
	.word	0x3700e102,0xffc60000
	.word	0x67ce8707,0x1100ff00
	.word	0x0000008b,0x00000000
	.word	0x7eff00ff,0xa85a9ad6
	.word	0x061ac6ff,0xffffffff
p0_local2_sec_expect:
	.word	0xff000000,0x1bff7ea8
	.word	0xfeb63fcf,0xffff00b4
	.word	0xff000000,0x000000ff
	.word	0x292b4497,0x1397f6b8
	.word	0x07a18675,0xdfdee334
	.word	0xd36c6a49,0x7e160ac2
	.word	0x0bfb2090,0x0607379a
	.word	0xf90f993c,0xeb694872
p0_local3_expect:
	.word	0xff000000,0xb199d047
	.word	0xff3c2379,0x00000000
	.word	0x3c990ff9,0x9a000000
	.word	0xb199d047,0x00000000
	.word	0xaa507244,0x285ca732
	.word	0xa98a274a,0x795168ce
	.word	0xf2ff1c0b,0xdefb9782
	.word	0xa14abe9d,0xd8a6c77c
p0_local3_sec_expect:
	.word	0xfff371b2,0xffffffff
	.word	0x00000000,0x0000b400
	.word	0x0c099c75,0x00000000
	.word	0xb3b919e3,0x51c59100
	.word	0x2a000000,0x1f79100e
	.word	0x6b55598b,0x7283e4bc
	.word	0x00000000,0x6e5f9478
	.word	0x11da2acc,0xafdad75c
p0_local4_expect:
	.word	0x000000ad,0x000000ff
	.word	0xb199d047,0xece279ff
	.word	0x00000000,0x9a000000
	.word	0x9a000000,0x67ce8707
	.word	0x55c61a06,0x0607aa8b
	.word	0x00ff0000,0xffffffff
	.word	0x3f370706,0x9020fb0b
	.word	0x000000de,0x00000000
p0_local4_sec_expect:
	.word	0xff7eff1b,0x37000000
	.word	0x0000009a,0x0c0900ff
	.word	0xff000000,0x000000ff
	.word	0x292b4497,0x1397f6b8
	.word	0x07a18675,0xdfdee334
	.word	0xd36c6a49,0x7e160ac2
	.word	0x0787ce67,0x0000009a
	.word	0xf90f993c,0xeb694872
p0_local5_expect:
	.word	0x00000000,0xff00090c
	.word	0x00000000,0x67ce8707
	.word	0xff7900ec,0x9dbe4aa1
	.word	0xad8c0000,0x0c099c75
	.word	0x3186e2eb,0x2d092ff1
	.word	0x0f4fff1d,0xff4d8b1f
	.word	0x55c61a06,0x98db82eb
	.word	0x84000000,0x00ff00ff
p0_local5_sec_expect:
	.word	0xb8f69713,0x97442b29
	.word	0x00000000,0xffffffff
	.word	0x292b4497,0x00000000
	.word	0xc3b425e0,0x64c40c3a
	.word	0x33a771b2,0x44ff50ff
	.word	0xce685179,0x4a278aa9
	.word	0x8297fbde,0x0b1c89f2
	.word	0x7cc7a6d8,0x9dbe4aa1
p0_local6_expect:
	.word	0x000000ff,0x97442b29
	.word	0xffa6c77c,0x0787ce67
	.word	0xd36c6a49,0x00000000
	.word	0x7e00364a,0x97442b29
	.word	0xffffffff,0x32b0aaff
	.word	0xff000000,0xffffffff
	.word	0x9aef0706,0x9020070b
	.word	0x000000ff,0x00000000
p0_local6_sec_expect:
	.word	0xec00ff00,0xff000000
	.word	0x00000000,0x32b0aa8b
	.word	0x000000ad,0x0000007e
	.word	0x1f79e2ec,0x1f79100e
	.word	0x955a90b6,0xffffffff
	.word	0x55c61a06,0x1d9d4f0f
	.word	0xffffb398,0x32b09a30
	.word	0x55c61a06,0x955a90b6
share0_expect:
	.word	0x87075a4a,0xb21d1fc1
	.word	0x0f54285d,0xbe63b6ba
	.word	0x41afed05,0xf53b681d
	.word	0x6b9e94aa,0x367b455d
	.word	0x0e8866eb,0xcbe53524
	.word	0x2d3d6a37,0xecb4f4d6
	.word	0x605be45d,0xb88cc857
	.word	0xc989b0a8,0x345ad16b
share1_expect:
	.word	0xc6ffa5fa,0xfd3b44a6
	.word	0x1ca43cbb,0x3e946a1f
	.word	0x0638aa16,0x90f0c71e
	.word	0x5e39bfa3,0xa71a9e22
	.word	0xec85cc58,0x44521582
	.word	0x06b98b18,0xe5db784c
	.word	0xf7dd3403,0x3efe4a5c
	.word	0x51aa2c55,0x732b46be
	.word	0x96ebfa54,0x5c736667
	.word	0x2ca71204,0x794979f0
	.word	0x4e71e543,0x637eb2da
	.word	0x62ecaf29,0xdb2dff94
	.word	0x5633a803,0x9d3ae510
	.word	0xf8da024f,0xc59bf991
	.word	0x0c181de0,0xfe2c877e
	.word	0x1b3f8f74,0x9e3c7644
share2_expect:
	.word	0xffffcd80,0xe948fd78
	.word	0xe912f133,0x2ef6db7e
	.word	0x98860576,0xc412825d
	.word	0x89867215,0xa2bb0300
	.word	0x862cc5c8,0xd988eb33
	.word	0xdc0d2eed,0xe02cdb49
	.word	0x69017631,0x5faeb862
	.word	0xd943eb23,0xe335de2f
share3_expect:
	.word	0xb4008a92,0x941bbde7
	.word	0x1b1d5550,0x77f048fc
	.word	0x43ef49de,0x9dbaf266
	.word	0xce956d4a,0x75e755eb
	.word	0xe18f5117,0xd98b3629
	.word	0xef7e7123,0x6d84c171
	.word	0x43b352da,0x279dc8fa
	.word	0xd21a2619,0x8de7b1e1
	.word	0x00ffc8f1,0xe13f0051
	.word	0x85e6f16e,0x67ce70a7
	.word	0xfc871606,0x1231d0df
	.word	0x67e2d694,0xfa8f55e3
	.word	0x6527c069,0x0f92fecf
	.word	0x2987e5c0,0x0500afe0
	.word	0x2b4e9953,0x62acafb8
	.word	0x3b7f7184,0x5d2f5bf8
	.word	0x26678dc3,0xc11b3596
	.word	0xb04505d7,0x1b7960de
	.word	0xaefa27eb,0xa2eec98f
	.word	0x791ebca8,0x750fe2aa
	.word	0x3420537f,0xdba9cddd
	.word	0xcbb33d39,0xaa55f59a
	.word	0x99bc9cd8,0xc7322699
	.word	0xaec3db0c,0x929958f2
	.word	0xfff64e5b,0x228621e1
	.word	0x994063e7,0x8285a8d1
	.word	0x9d21923c,0xe09e8a92
	.word	0xf3e370b2,0xba28db95
	.word	0xbe2df596,0x411f8971
	.word	0xc67b9410,0xed3cc2fc
	.word	0xbf5f417e,0x5e7cde05
	.word	0xb019c746,0x8d60423a
	.word	0xb444af61,0x2bbbaa15
	.word	0xcbc5a4da,0x2c1e9e9a
	.word	0x03665cc6,0x050a3f9b
	.word	0x804d5769,0x1c0739ca
	.word	0x1e1c56a3,0xc379716e
	.word	0x1c3f6207,0x08da873b
	.word	0xcc324e5f,0x69d92230
	.word	0x38bc4259,0x28b10f88
	.word	0xffff4205,0xe971a1c2
	.word	0x4d420703,0x09b5eaf5
	.word	0xb7ef3c89,0xfca9eb21
	.word	0x9ed13781,0x747c57d1
	.word	0x96bfe368,0x6b507dd7
	.word	0x11469e2a,0x1b1e2375
	.word	0xec110ef3,0xb6dd776f
	.word	0x4c0da30f,0xb91566c6
	.word	0x0760f854,0x94d55bf3
	.word	0x32897da5,0x2b47efa0
	.word	0x222fba39,0xb09ba740
	.word	0x2c7aa3ee,0xda4d4e9e
	.word	0x4624b050,0x1cb3fe45
	.word	0x484724e7,0xd3e46664
	.word	0x219abe3f,0x589c9f87
	.word	0x74c5b64b,0xba976202
	.word	0x00d25b76,0x8e47e0b7
	.word	0x74e2cc7e,0xeb6a1e29
	.word	0xf011f699,0x1b0985f1
	.word	0x66b735fa,0x9adf705d
	.word	0x38b3d5e4,0x4004ba65
	.word	0xf131bddd,0xdc30b286
	.word	0xd4e91bbd,0x62387bcb
	.word	0x57a4fa9c,0x0244cbc7
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
	.word	0xf08efe6f,0xd2bba81e
	.word	0x00000000,0x00000002
	.word	0x785c6b57,0xc7b665b2
	.word	0x00000000,0x00000003
	.word	0x34ef1717,0x8dc1010b
	.word	0x00000000,0x00000004
	.word	0xdeb24640,0x0e148517
	.word	0x00000000,0x00000005
	.word	0x6e99e6a0,0x6d80d315
	.word	0x00000000,0x00000006
	.word	0xd4a8abe8,0x65f52249
	.word	0x00000000,0x00000007
	.word	0xa40b6c30,0x1131c2a2
	.word	0x00000000,0x00000008
	.word	0xa994be2f,0xdd7fe191
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
	.word	0x70621cea,0x2a3b6d13,0x0ade34b6,0x5be3cfc5
	.word	0x60579a64,0xba694eb7,0x4935eb91,0x02e1f454
	.word	0x692f1c85,0x54980ce8,0x14cc9d31,0x565c380a
	.word	0x852496fc,0x3db0b107,0x1837c19a,0xd42c69b9
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
	.word	0x7d3b0ba6,0xfb4f11ce,0xc573538e,0x7bd72e46
	.word	0xcf9b9d0b,0xbac772b9,0xf3187341,0x68d50536
	.word	0xadd0ff91,0x0ba043f5,0x10fa2a9b,0x9cc32763
	.word	0xe2c0ba42,0x135a44a3,0xdaeee5c6,0x4319c7e0
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
	.word	0x0339ce68,0x6f76a7e9,0xdf266222,0xae22aac8
	.word	0x0106ab6d,0x8d4662c9,0xc77babee,0xc8a9d015
	.word	0xba6cab9e,0x7fcdab61,0x3ec2b76b,0x33f371b2
	.word	0x83e5dbb0,0x43a96d09,0x4783d1b1,0x34d288e2
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
	.word	0x9ef8b398,0xf50c9a30,0xd7f0257b,0x4f78c2c7
	.word	0x18050bba,0x06830e96,0x66d00130,0xd7cddb08
	.word	0x8ef0a117,0x08d2e529,0xf825c9ae,0xef59d9ef
	.word	0x53978030,0x1986bb54,0x5292d261,0xbd75585a
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
	.word	0xfa149d22,0x261b4dd3,0xe2ac4b23,0xa45a5605
	.word	0x69f674ab,0x5c72c7a5,0x38db09e8,0xdf46364a
	.word	0xc1a854d7,0xe70a4ac1,0x79730dae,0x3630eb24
	.word	0x1b707ea8,0xdc4e2b5f,0xb259faaf,0x05abd5e3
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
	.word	0x27cc1364,0x1d9d4f0f,0x7ce26971,0x490a8644
	.word	0xd88d6f71,0x7f9dbe97,0x292b4497,0x1397f6b8
	.word	0x07a18675,0xdfdee334,0xd36c6a49,0x7e160ac2
	.word	0x0bfb2090,0x0607379a,0xf90f993c,0xeb694872
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
	.word	0xf6c2a1b4,0x801ad428,0x9f961016,0x76dda661
	.word	0xdec89116,0x97ce1620,0xd5edeaba,0xfff0bb9c
	.word	0x87a255b1,0x9c91a9f4,0x86842aa8,0xa5b9cc6b
	.word	0xbfc28cf8,0x9b639219,0xdd41bb83,0x9302b615
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
	.word	0xad1baaac,0xd3613e5c,0x74d6a809,0x77fc510a
	.word	0xe1e0a596,0x7273f96e,0xb3b919e3,0x51c59100
	.word	0x9d6373fb,0xc85f108f,0x6b55598b,0x7283e4bc
	.word	0x992bc721,0x6e5f9478,0xa12989e0,0xafdad75c
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
	.word	0x11925c6a,0xf8aeedb0,0xff1bb8b6,0x6d0f8bd3
	.word	0x5adf24a5,0x458ca55c,0x833b786c,0x53b1633e
	.word	0x669d2d11,0x3c38944a,0x43be00e8,0xafaa4540
	.word	0x0a18b95c,0xe9271dee,0x7416dd65,0x11de56ca
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
	.word	0x684eb302,0x37148582,0x6a7c0c94,0x6cba60e4
	.word	0xe74e94b7,0x914bbde3,0xaf52593e,0x1c53fbca
	.word	0x918960ee,0x056fad8c,0x129d217c,0xb81e66a0
	.word	0x90505644,0xa67a4835,0x3eeec2d8,0x38c62378
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
	.word	0x189508d9,0x958163d3,0x125adb70,0x86fe2308
	.word	0xa8db9b59,0x32b0aa8b,0x11da2acc,0xf04ed1c6
	.word	0xb6d1e2eb,0x2d092ff1,0x94fb7e1e,0xd44d8b1f
	.word	0xac7ff2a0,0x98db82eb,0x839ecbf4,0xdaef39d4
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
	.word	0xa7c5d5fe,0xb8213b3c,0xf4061d3f,0xe3fd5116
	.word	0xd29b4eaf,0xf4f57f4f,0x88d03638,0xa4c525d5
	.word	0x32a75c28,0x447250aa,0xce685179,0x4a278aa9
	.word	0x8297fbde,0x0b1c89f2,0x7cc7a6d8,0x9dbe4aa1
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
	.word	0x94a8598e,0x68af1045,0xbb52cf81,0xf5e3b8c6
	.word	0x3dd23cfd,0x94ea3b0b,0xea5fea6b,0x92a63f58
	.word	0x67ce8707,0x4de8441b,0xcef62d4c,0x3ab1ef1a
	.word	0x6e5fdef9,0x4099199d,0xa4e811b3,0xd69a5aa8
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
	.word	0x8335649b,0x1852462e,0xf9b0a949,0x47cb582c
	.word	0xd274552a,0xc44c04fc,0x80cdd7b8,0x0b6dc549
	.word	0xf41ff6f7,0x913b0140,0xf2ce4069,0x34eb07ed
	.word	0xcbcd5806,0x46e4c154,0xd7711869,0xec3714da
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
	.word	0xf6eb5a4a,0xb21d1fc1,0x0f54285d,0xbe63b6ba
	.word	0x41afed05,0xf53b681d,0x6b9e94aa,0x367b455d
	.word	0x0e8866eb,0xcbe53524,0x2d3d6a37,0xecb4f4d6
	.word	0x605be45d,0xb88cc857,0xc989b0a8,0x345ad16b
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
	.word	0xfb60a5fa,0xfd3b44a6,0x1ca43cbb,0x3e946a1f
	.word	0x0638aa16,0x90f0c71e,0x5e39bfa3,0xa71a9e22
	.word	0xec85cc58,0x44521582,0x06b98b18,0xe5db784c
	.word	0xf7dd3403,0x3efe4a5c,0x51aa2c55,0x732b46be
	.word	0x406bfa54,0x5c736667,0x2ca71204,0x794979f0
	.word	0x4e71e543,0x637eb2da,0x62ecaf29,0xdb2dff94
	.word	0x5633a803,0x9d3ae510,0xf8da024f,0xc59bf991
	.word	0x0c181de0,0xfe2c877e,0x1b3f8f74,0x9e3c7644
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
	.word	0xc74bcd80,0xe948fd78,0xe912f133,0x2ef6db7e
	.word	0x98860576,0xc412825d,0x89867215,0xa2bb0300
	.word	0x862cc5c8,0xd988eb33,0xdc0d2eed,0xe02cdb49
	.word	0x69017631,0x5faeb862,0xd943eb23,0xe335de2f
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
	.word	0xb4268a92,0x941bbde7,0x1b1d5550,0x77f048fc
	.word	0x43ef49de,0x9dbaf266,0xce956d4a,0x75e755eb
	.word	0xe18f5117,0xd98b3629,0xef7e7123,0x6d84c171
	.word	0x43b352da,0x279dc8fa,0xd21a2619,0x8de7b1e1
	.word	0x4a5ec8f1,0xe13f0051,0x85e6f16e,0x67ce70a7
	.word	0xfc871606,0x1231d0df,0x67e2d694,0xfa8f55e3
	.word	0x6527c069,0x0f92fecf,0x2987e5c0,0x0500afe0
	.word	0x2b4e9953,0x62acafb8,0x3b7f7184,0x5d2f5bf8
	.word	0x20308dc3,0xc11b3596,0xb04505d7,0x1b7960de
	.word	0xaefa27eb,0xa2eec98f,0x791ebca8,0x750fe2aa
	.word	0x3420537f,0xdba9cddd,0xcbb33d39,0xaa55f59a
	.word	0x99bc9cd8,0xc7322699,0xaec3db0c,0x929958f2
	.word	0xd4934e5b,0x228621e1,0x994063e7,0x8285a8d1
	.word	0x9d21923c,0xe09e8a92,0xf3e370b2,0xba28db95
	.word	0xbe2df596,0x411f8971,0xc67b9410,0xed3cc2fc
	.word	0xbf5f417e,0x5e7cde05,0xb019c746,0x8d60423a
	.word	0xb4c5af61,0x2bbbaa15,0xcbc5a4da,0x2c1e9e9a
	.word	0x03665cc6,0x050a3f9b,0x804d5769,0x1c0739ca
	.word	0x1e1c56a3,0xc379716e,0x1c3f6207,0x08da873b
	.word	0xcc324e5f,0x69d92230,0x38bc4259,0x28b10f88
	.word	0x1c064205,0xe971a1c2,0x4d420703,0x09b5eaf5
	.word	0xb7ef3c89,0xfca9eb21,0x9ed13781,0x747c57d1
	.word	0x96bfe368,0x6b507dd7,0x11469e2a,0x1b1e2375
	.word	0xec110ef3,0xb6dd776f,0x4c0da30f,0xb91566c6
	.word	0xc360f854,0x94d55bf3,0x32897da5,0x2b47efa0
	.word	0x222fba39,0xb09ba740,0x2c7aa3ee,0xda4d4e9e
	.word	0x4624b050,0x1cb3fe45,0x484724e7,0xd3e46664
	.word	0x219abe3f,0x589c9f87,0x74c5b64b,0xba976202
	.word	0xb3245b76,0x8e47e0b7,0x74e2cc7e,0xeb6a1e29
	.word	0xf011f699,0x1b0985f1,0x66b735fa,0x9adf705d
	.word	0x38b3d5e4,0x4004ba65,0xf131bddd,0xdc30b286
	.word	0xd4e91bbd,0x62387bcb,0x57a4fa9c,0x0244cbc7
share3_end:
