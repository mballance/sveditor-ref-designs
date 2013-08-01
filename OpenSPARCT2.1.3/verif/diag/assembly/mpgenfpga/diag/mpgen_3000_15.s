/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: mpgen_3000_15.s
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
!	Seed = 327144535
!	Riesling can be on
!	1 Thread, 3000 lines
!	mpgen   created on Dec 20, 2005 (16:35:03)
!	mpgen_3000_15.s created on Mar 27, 2009 (14:45:35)
!	RC file : random.rc
!	cmd = /import/n2-tools/release/tools/mpgen/mpgen,1.051220 -rc random.rc -o mpgen_3000_15 -p 1 -l 3000

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
!	%f0  = a4bdbde0 f5969ca9 912a05c7 ca2516a2
!	%f4  = 5738ab28 c19e324d eb5c6612 c170afb0
!	%f8  = 9263b683 00d74f0d a4c504b7 87af6512
!	%f12 = 0b2f8ade 965ee3c9 8f42ddd7 20f9d58a
	ldda	[%g1]ASI_BLK_P,%f0
	add	%g1,64,%g1
!	%f16 = e1372629 58b20084 8af30670 ce8ecf5c
!	%f20 = c5d3253a 5f880035 413188a4 012b48db
!	%f24 = 775a5ef2 50a00528 b0a253ce 0e1973b3
!	%f28 = 4049c358 fea97ab2 a5d41c1d 9a41c1c7
	ldda	[%g1]ASI_BLK_P,%f16
	add	%g1,64,%g1
!	%f32 = e8afeef0 7d941297 7641f152 a6652f38
!	%f36 = d20c3e7c 2182fab9 67449473 a2159f27
!	%f40 = 6392c65d 21f504cf c8d17eca 4a362c97
!	%f44 = e96a1b5e 43ec5752 ada08b66 5260ecc2
	ldda	[%g1]ASI_BLK_P,%f32

!	Set up the Graphics Status Register

	setx	0x44f6b24000000077,%g7,%g1 ! GSR scale = 14, align = 7
	wr	%g1,%g0,%gsr		! GSR = 44f6b24000000077
	wr	%g0,%y			! Clear Y register
	xorcc	%g0,%g0,%g3		! init %g3 and set flags
	membar	#Sync			! Force the block loads to complete

!	Start of Random Code for processor 0

p0_label_1:
!	%f18 = 8af30670 ce8ecf5c, Mem[0000000030101408] = d8ce0170 a9e274c4
	stda	%f18,[%i4+%o4]0x81	! Mem[0000000030101408] = 8af30670 ce8ecf5c
!	%l2 = 442ab8884b6f1614, Mem[0000000030041408] = b95a4bac
	stha	%l2,[%i1+%o4]0x81	! Mem[0000000030041408] = 16144bac
!	Mem[0000000010041410] = 133dceb3, %f26 = b0a253ce
	lda	[%i1+%o5]0x80,%f26	! %f26 = 133dceb3
!	%l5 = b64e5972097fcbb5, Mem[0000000030001408] = c673e04a
	stwa	%l5,[%i0+%o4]0x89	! Mem[0000000030001408] = 097fcbb5
!	Mem[0000000010101408] = c27a4c3f, %l3 = 08b3573df3f2a20a
	swapa	[%i4+%o4]0x88,%l3	! %l3 = 00000000c27a4c3f
!	Mem[0000000030081408] = dd7d5836, %l0 = 1464a3286bd6d300
	lduha	[%i2+%o4]0x81,%l0	! %l0 = 000000000000dd7d
!	%l7 = 08d9fb3230ee1634, Mem[0000000010181428] = 9df02ce2, %asi = 80
	stwa	%l7,[%i6+0x028]%asi	! Mem[0000000010181428] = 30ee1634
!	%l2 = 442ab8884b6f1614, imm = fffffffffffff3fd, %l5 = b64e5972097fcbb5
	xor	%l2,-0xc03,%l5		! %l5 = bbd54777b490e5e9
!	Mem[0000000010181400] = bb5aef27, %l0 = 000000000000dd7d
	ldsha	[%i6+%g0]0x80,%l0	! %l0 = ffffffffffffbb5a
!	Starting 10 instruction Store Burst
!	%l5 = bbd54777b490e5e9, Mem[00000000100c1400] = 2eb69969
	stha	%l5,[%i3+%g0]0x88	! Mem[00000000100c1400] = 2eb6e5e9

p0_label_2:
!	Mem[0000000030181400] = 0418b91c, %l3 = 00000000c27a4c3f
	ldsha	[%i6+%g0]0x89,%l3	! %l3 = ffffffffffffb91c
!	%l7 = 08d9fb3230ee1634, Mem[0000000030101410] = ef8690e26fd5d3e2
	stxa	%l7,[%i4+%o5]0x81	! Mem[0000000030101410] = 08d9fb3230ee1634
!	%l4 = 5dae98bc0f975740, immed = 00000ad8, %y  = 00000000
	udiv	%l4,0xad8,%l7		! %l7 = 0000000000017013
	mov	%l0,%y			! %y = ffffbb5a
!	%l4 = 5dae98bc0f975740, imm = ffffffffffffffec, %l5 = bbd54777b490e5e9
	addc	%l4,-0x014,%l5		! %l5 = 5dae98bc0f97572c
!	Mem[00000000300c1408] = ebb2fdda, %l5 = 5dae98bc0f97572c
	swapa	[%i3+%o4]0x81,%l5	! %l5 = 00000000ebb2fdda
!	%f14 = 8f42ddd7, Mem[0000000010101408] = 0aa2f2f3
	sta	%f14,[%i4+%o4]0x80	! Mem[0000000010101408] = 8f42ddd7
!	Mem[00000000100c1408] = 44fa28d0, %l6 = 5dd1a632547327ab
	swapa	[%i3+%o4]0x88,%l6	! %l6 = 0000000044fa28d0
!	Mem[0000000030041410] = 07a5e44d, %l6 = 0000000044fa28d0
	swapa	[%i1+%o5]0x89,%l6	! %l6 = 0000000007a5e44d
!	%l6 = 07a5e44d, %l7 = 00017013, Mem[0000000030181410] = 0682cb6f 498f6cce
	stda	%l6,[%i6+%o5]0x89	! Mem[0000000030181410] = 07a5e44d 00017013
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = 4a42522a, %f11 = 87af6512
	ld	[%i2+%o4],%f11	! %f11 = 4a42522a

p0_label_3:
!	Mem[000000001018142c] = 8100b17d, %l7 = 0000000000017013
	ldub	[%i6+0x02d],%l7		! %l7 = 0000000000000000
!	%l6 = 0000000007a5e44d, imm = 0000000000000311, %l1 = 38bb34c03e7637d6
	xor	%l6,0x311,%l1		! %l1 = 0000000007a5e75c
!	Mem[00000000100c1408] = ab277354, %l3 = ffffffffffffb91c
	lduwa	[%i3+%o4]0x80,%l3	! %l3 = 00000000ab277354
!	Mem[0000000010101410] = 095135f0, %l1 = 0000000007a5e75c
	lduba	[%i4+%o5]0x80,%l1	! %l1 = 0000000000000009
!	Mem[0000000030181400] = 0418b91c, %l3 = 00000000ab277354
	lduha	[%i6+%g0]0x89,%l3	! %l3 = 000000000000b91c
!	Mem[0000000010101414] = 47c6b2b0, %l3 = 000000000000b91c
	lduba	[%i4+0x017]%asi,%l3	! %l3 = 00000000000000b0
!	Mem[0000000030001408] = 8b3141eb097fcbb5, %l7 = 0000000000000000
	ldxa	[%i0+%o4]0x89,%l7	! %l7 = 8b3141eb097fcbb5
!	Mem[0000000010181434] = 3b3a6b3f, %f27 = 0e1973b3
	ld	[%i6+0x034],%f27	! %f27 = 3b3a6b3f
!	Mem[0000000030081400] = a177a6af, %l0 = ffffffffffffbb5a
	lduha	[%i2+%g0]0x81,%l0	! %l0 = 000000000000a177
!	Starting 10 instruction Store Burst
!	%l0 = 000000000000a177, Mem[0000000030081400] = a177a6af60aef68f
	stxa	%l0,[%i2+%g0]0x81	! Mem[0000000030081400] = 000000000000a177

p0_label_4:
!	%l4 = 0f975740, %l5 = ebb2fdda, Mem[0000000030101408] = 7006f38a 5ccf8ece
	stda	%l4,[%i4+%o4]0x89	! Mem[0000000030101408] = 0f975740 ebb2fdda
!	%f26 = 133dceb3 3b3a6b3f, Mem[0000000010041400] = 347cbcdd 66a31434
	std	%f26,[%i1+%g0]	! Mem[0000000010041400] = 133dceb3 3b3a6b3f
!	%f3  = ca2516a2, %f18 = 8af30670, %f23 = 012b48db
	fsubs	%f3 ,%f18,%f23		! %f23 = ca2516a2
!	Mem[0000000010141400] = 997bde1f, %l3 = 00000000000000b0, %asi = 80
	swapa	[%i5+0x000]%asi,%l3	! %l3 = 00000000997bde1f
!	Mem[0000000030041408] = ac4b1416, %l6 = 0000000007a5e44d
	ldstuba	[%i1+%o4]0x89,%l6	! %l6 = 00000016000000ff
!	%f24 = 775a5ef2 50a00528, %l5 = 00000000ebb2fdda
!	Mem[0000000010101430] = 6afb8e9655b8fc7c
	add	%i4,0x030,%g1
	stda	%f24,[%g1+%l5]ASI_PST32_PL ! Mem[0000000010101430] = 6afb8e96f25e5a77
!	Mem[00000000300c1410] = c9bd086d, %l4 = 5dae98bc0f975740
	ldstuba	[%i3+%o5]0x81,%l4	! %l4 = 000000c9000000ff
!	Mem[0000000010001400] = e740342b, %l2 = 442ab8884b6f1614
	ldstuba	[%i0+%g0]0x80,%l2	! %l2 = 000000e7000000ff
!	%f30 = a5d41c1d 9a41c1c7, Mem[0000000010081408] = 4a42522a f9ee0583
	stda	%f30,[%i2+%o4]0x80	! Mem[0000000010081408] = a5d41c1d 9a41c1c7
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = 5d662049 2373c496, %l2 = 000000e7, %l3 = 997bde1f
	ldda	[%i6+0x010]%asi,%l2	! %l2 = 000000005d662049 000000002373c496

p0_label_5:
!	%l5 = 00000000ebb2fdda, imm = fffffffffffff3ba, %l1 = 0000000000000009
	xor	%l5,-0xc46,%l1		! %l1 = ffffffff144d0e60
!	Mem[0000000030081400] = 77a1000000000000, %f10 = a4c504b7 4a42522a
	ldda	[%i2+%g0]0x89,%f10	! %f10 = 77a10000 00000000
!	Mem[00000000100c1418] = d1555933, %l5 = 00000000ebb2fdda
	ldsw	[%i3+0x018],%l5		! %l5 = ffffffffd1555933
	membar	#Sync			! Added by membar checker (1)
!	Mem[0000000010101400] = c5517e6a f3e54b44 8f42ddd7 433924ef
!	Mem[0000000010101410] = 095135f0 47c6b2b0 30fdc02c 9592cf1c
!	Mem[0000000010101420] = 8a78816a 3ee5dbe1 8062c5e8 725741a6
!	Mem[0000000010101430] = 6afb8e96 f25e5a77 914e80b8 5745154b
	ldda	[%i4]ASI_BLK_P,%f0	! Block Load from 0000000010101400
!	Mem[0000000030141410] = bbb4ffc256d7a6d3, %l6 = 0000000000000016
	ldxa	[%i5+%o5]0x81,%l6	! %l6 = bbb4ffc256d7a6d3
!	Mem[0000000030081410] = 3f1dfc16e658797a, %f18 = 8af30670 ce8ecf5c
	ldda	[%i2+%o5]0x89,%f18	! %f18 = 3f1dfc16 e658797a
!	Mem[0000000010181408] = 19757b20, %l4 = 00000000000000c9
	ldsba	[%i6+%o4]0x80,%l4	! %l4 = 0000000000000019
!	Mem[0000000030041410] = d028fa44, %l7 = 8b3141eb097fcbb5
	lduha	[%i1+%o5]0x81,%l7	! %l7 = 000000000000d028
!	Mem[00000000211c0000] = d96c980d, %l6 = bbb4ffc256d7a6d3
	lduba	[%o2+0x000]%asi,%l6	! %l6 = 00000000000000d9
!	Starting 10 instruction Store Burst
!	Mem[0000000030041400] = 66e42a1c, %l2 = 000000005d662049
	ldstuba	[%i1+%g0]0x89,%l2	! %l2 = 0000001c000000ff

p0_label_6:
!	%l4 = 0000000000000019, Mem[00000000201c0000] = fda319af, %asi = 80
	stha	%l4,[%o0+0x000]%asi	! Mem[00000000201c0000] = 001919af
!	Code Fragment 4
p0_fragment_1:
!	%l0 = 000000000000a177
	setx	0x39594b580e2482c3,%g7,%l0 ! %l0 = 39594b580e2482c3
!	%l1 = ffffffff144d0e60
	setx	0x322397ffc32c4877,%g7,%l1 ! %l1 = 322397ffc32c4877
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 39594b580e2482c3
	setx	0x025056f85cae8384,%g7,%l0 ! %l0 = 025056f85cae8384
!	%l1 = 322397ffc32c4877
	setx	0x2eaac4e7c087a97a,%g7,%l1 ! %l1 = 2eaac4e7c087a97a
!	%f28 = 4049c358, Mem[0000000030001408] = b5cb7f09
	sta	%f28,[%i0+%o4]0x81	! Mem[0000000030001408] = 4049c358
!	Mem[00000000300c1400] = 4e728631, %l6 = 00000000000000d9
	swapa	[%i3+%g0]0x89,%l6	! %l6 = 000000004e728631
!	%f20 = c5d3253a, Mem[0000000030101408] = 4057970f
	sta	%f20,[%i4+%o4]0x81	! Mem[0000000030101408] = c5d3253a
!	%l3 = 000000002373c496, Mem[0000000010141410] = 72b4c9609f937292
	stxa	%l3,[%i5+%o5]0x88	! Mem[0000000010141410] = 000000002373c496
!	%l0 = 5cae8384, %l1 = c087a97a, Mem[0000000030041400] = ff2ae466 dbbd3d3c
	stda	%l0,[%i1+%g0]0x81	! Mem[0000000030041400] = 5cae8384 c087a97a
!	%l4 = 0000000000000019, Mem[00000000100c1400] = 2eb6e5e9
	stba	%l4,[%i3+%g0]0x88	! Mem[00000000100c1400] = 2eb6e519
!	Mem[0000000010181400] = 27ef5abb, %l2 = 000000000000001c
	ldstuba	[%i6+%g0]0x88,%l2	! %l2 = 000000bb000000ff
!	Starting 10 instruction Load Burst
!	%l5 = ffffffffd1555933, %l1 = 2eaac4e7c087a97a, %l1 = 2eaac4e7c087a97a
	andn	%l5,%l1,%l1		! %l1 = d1553b1811505001

p0_label_7:
!	Mem[0000000030141408] = 59dfb343, %l3 = 000000002373c496
	lduwa	[%i5+%o4]0x81,%l3	! %l3 = 0000000059dfb343
!	Mem[0000000010141410] = 96c47323, %f23 = ca2516a2
	lda	[%i5+%o5]0x80,%f23	! %f23 = 96c47323
!	Mem[0000000010081400] = 9d4351b7, %f26 = 133dceb3
	ld	[%i2+%g0],%f26	! %f26 = 9d4351b7
!	Mem[0000000010101408] = d7dd428f, %l3 = 0000000059dfb343
	lduha	[%i4+%o4]0x88,%l3	! %l3 = 000000000000428f
!	Mem[000000001004141c] = 38bcbdbe, %f1  = f3e54b44
	lda	[%i1+0x01c]%asi,%f1 	! %f1 = 38bcbdbe
!	Mem[0000000010181410] = 5d6620492373c496, %f22 = 413188a4 96c47323
	ldda	[%i6+%o5]0x80,%f22	! %f22 = 5d662049 2373c496
!	Mem[0000000010141408] = 3df2ce82a1f49eb1, %l3 = 000000000000428f
	ldxa	[%i5+%o4]0x80,%l3	! %l3 = 3df2ce82a1f49eb1
!	Mem[0000000010001410] = 505d8668, %l1 = d1553b1811505001
	lduba	[%i0+%o5]0x80,%l1	! %l1 = 0000000000000050
!	Mem[0000000010041408] = 3ce31959, %l4 = 0000000000000019
	lduha	[%i1+%o4]0x80,%l4	! %l4 = 0000000000003ce3
!	Starting 10 instruction Store Burst
!	%l0 = 025056f85cae8384, %l1 = 0000000000000050, %l3 = 3df2ce82a1f49eb1
	and	%l0,%l1,%l3		! %l3 = 0000000000000000

p0_label_8:
!	%f28 = 4049c358 fea97ab2, %l1 = 0000000000000050
!	Mem[0000000030001428] = 10ffdbc6a9f92710
	add	%i0,0x028,%g1
	stda	%f28,[%g1+%l1]ASI_PST32_S ! Mem[0000000030001428] = 10ffdbc6a9f92710
!	%f22 = 5d662049 2373c496, Mem[0000000030081408] = 36587ddd eba467c9
	stda	%f22,[%i2+%o4]0x89	! Mem[0000000030081408] = 5d662049 2373c496
!	%f0  = c5517e6a 38bcbdbe, Mem[0000000010181400] = ff5aef27 fcedf601
	stda	%f0 ,[%i6+%g0]0x80	! Mem[0000000010181400] = c5517e6a 38bcbdbe
!	%f16 = e1372629 58b20084, Mem[0000000030101410] = 32fbd908 3416ee30
	stda	%f16,[%i4+%o5]0x89	! Mem[0000000030101410] = e1372629 58b20084
!	%f6  = 30fdc02c, %f16 = e1372629, %f17 = 58b20084
	fadds	%f6 ,%f16,%f17		! %f17 = e1372629
!	Mem[0000000030101408] = 3a25d3c5, %l6 = 000000004e728631
	swapa	[%i4+%o4]0x89,%l6	! %l6 = 000000003a25d3c5
	membar	#Sync			! Added by membar checker (2)
!	%f24 = 775a5ef2 50a00528, Mem[0000000010101408] = 8f42ddd7 433924ef
	stda	%f24,[%i4+%o4]0x80	! Mem[0000000010101408] = 775a5ef2 50a00528
!	%l0 = 025056f85cae8384, %l0 = 025056f85cae8384, %y  = ffffbb5a
	smul	%l0,%l0,%l7		! %l7 = 218de57deb005c10, %y = 218de57d
!	Mem[0000000010181417] = 2373c496, %l6 = 000000003a25d3c5
	ldstuba	[%i6+0x017]%asi,%l6	! %l6 = 00000096000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = ac89d0e3, %l5 = ffffffffd1555933
	ldswa	[%i5+%g0]0x81,%l5	! %l5 = ffffffffac89d0e3

p0_label_9:
!	Mem[0000000030181400] = 1cb91804, %f20 = c5d3253a
	lda	[%i6+%g0]0x81,%f20	! %f20 = 1cb91804
!	Mem[0000000010181410] = 5d6620492373c4ff, %l4 = 0000000000003ce3
	ldxa	[%i6+%o5]0x80,%l4	! %l4 = 5d6620492373c4ff
!	Mem[0000000010081400] = b751439d, %f11 = 725741a6
	lda	[%i2+%g0]0x88,%f11	! %f11 = b751439d
!	Mem[0000000030181408] = d4694c43, %l7 = 218de57deb005c10
	ldswa	[%i6+%o4]0x81,%l7	! %l7 = ffffffffd4694c43
!	Mem[0000000030141400] = 5e55c12f e3d089ac, %l6 = 00000096, %l7 = d4694c43
	ldda	[%i5+%g0]0x89,%l6	! %l6 = 00000000e3d089ac 000000005e55c12f
!	Mem[0000000010181408] = 207b7519, %l4 = 5d6620492373c4ff
	lduwa	[%i6+%o4]0x88,%l4	! %l4 = 00000000207b7519
!	Mem[0000000021800040] = 110e4385, %l5 = ffffffffac89d0e3
	lduh	[%o3+0x040],%l5		! %l5 = 000000000000110e
!	Mem[0000000010081400] = d07b5173 b751439d, %l6 = e3d089ac, %l7 = 5e55c12f
	ldda	[%i2+%g0]0x88,%l6	! %l6 = 00000000b751439d 00000000d07b5173
!	Mem[00000000300c1410] = ffbd086d0039f71b, %f18 = 3f1dfc16 e658797a
	ldda	[%i3+%o5]0x81,%f18	! %f18 = ffbd086d 0039f71b
!	Starting 10 instruction Store Burst
!	Mem[0000000010041410] = b3ce3d13, %l1 = 0000000000000050
	swapa	[%i1+%o5]0x88,%l1	! %l1 = 00000000b3ce3d13

p0_label_10:
!	Mem[0000000030041400] = 5cae8384, %l1 = 00000000b3ce3d13
	ldstuba	[%i1+%g0]0x81,%l1	! %l1 = 0000005c000000ff
!	Mem[00000000300c1400] = d9000000, %l5 = 000000000000110e
	ldstuba	[%i3+%g0]0x81,%l5	! %l5 = 000000d9000000ff
!	%l3 = 0000000000000000, Mem[0000000010041410] = 00000050
	stba	%l3,[%i1+%o5]0x88	! Mem[0000000010041410] = 00000000
!	%l0 = 5cae8384, %l1 = 0000005c, Mem[0000000030101408] = 3186724e dafdb2eb
	stda	%l0,[%i4+%o4]0x81	! Mem[0000000030101408] = 5cae8384 0000005c
!	%f8  = 8a78816a 3ee5dbe1, Mem[0000000010001408] = 0a670801 d1cfb611
	stda	%f8 ,[%i0+%o4]0x88	! Mem[0000000010001408] = 8a78816a 3ee5dbe1
!	%f16 = e1372629 e1372629 ffbd086d 0039f71b
!	%f20 = 1cb91804 5f880035 5d662049 2373c496
!	%f24 = 775a5ef2 50a00528 9d4351b7 3b3a6b3f
!	%f28 = 4049c358 fea97ab2 a5d41c1d 9a41c1c7
	stda	%f16,[%i6]ASI_COMMIT_P	! Block Store to 0000000010181400
!	Mem[0000000030001410] = 3f96878c, %l3 = 0000000000000000
	swapa	[%i0+%o5]0x89,%l3	! %l3 = 000000003f96878c
!	Mem[00000000211c0001] = d96c980d, %l6 = 00000000b751439d
	ldstuba	[%o2+0x001]%asi,%l6	! %l6 = 0000006c000000ff
!	%l6 = 000000000000006c, Mem[0000000010041418] = 94e32346, %asi = 80
	stba	%l6,[%i1+0x018]%asi	! Mem[0000000010041418] = 6ce32346
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = 8483aeff, %l2 = 00000000000000bb
	lduba	[%i1+%g0]0x89,%l2	! %l2 = 00000000000000ff

p0_label_11:
!	Mem[0000000030001410] = 00000000, %l7 = 00000000d07b5173
	ldsba	[%i0+%o5]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000030001408] = 58c34940, %l3 = 000000003f96878c
	lduwa	[%i0+%o4]0x89,%l3	! %l3 = 0000000058c34940
!	Mem[0000000030081400] = 00000000, %l4 = 00000000207b7519
	ldsha	[%i2+%g0]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000030101400] = b9284053 63bef5c8, %l0 = 5cae8384, %l1 = 0000005c
	ldda	[%i4+%g0]0x81,%l0	! %l0 = 00000000b9284053 0000000063bef5c8
!	Mem[0000000010001430] = 22110106, %f3  = 433924ef
	lda	[%i0+0x030]%asi,%f3 	! %f3 = 22110106
!	Mem[0000000010041410] = 00000000, %l2 = 00000000000000ff
	lduba	[%i1+%o5]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000030181400] = 1cb91804, %l4 = 0000000000000000
	lduha	[%i6+%g0]0x81,%l4	! %l4 = 0000000000001cb9
!	Mem[0000000010041400] = 133dceb33b3a6b3f, %f14 = 914e80b8 5745154b
	ldda	[%i1+%g0]0x80,%f14	! %f14 = 133dceb3 3b3a6b3f
!	Mem[0000000010101410] = b0b2c647f0355109, %l4 = 0000000000001cb9
	ldxa	[%i4+%o5]0x88,%l4	! %l4 = b0b2c647f0355109
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (3)
!	%l3 = 0000000058c34940, Mem[0000000010181408] = ffbd086d
	stwa	%l3,[%i6+%o4]0x80	! Mem[0000000010181408] = 58c34940

p0_label_12:
!	%l7 = 0000000000000000, Mem[00000000300c1408] = 2c57970f
	stwa	%l7,[%i3+%o4]0x89	! Mem[00000000300c1408] = 00000000
!	Mem[0000000020800041] = 06f0226c, %l2 = 0000000000000000
	ldstub	[%o1+0x041],%l2		! %l2 = 000000f0000000ff
!	%l4 = b0b2c647f0355109, %l7 = 0000000000000000, %y  = 218de57d
	umul	%l4,%l7,%l3		! %l3 = 0000000000000000, %y = 00000000
!	Mem[0000000010181424] = 50a00528, %l6 = 000000000000006c
	swap	[%i6+0x024],%l6		! %l6 = 0000000050a00528
!	Mem[00000000100c1408] = 547327ab, %l6 = 0000000050a00528
	swapa	[%i3+%o4]0x88,%l6	! %l6 = 00000000547327ab
!	Mem[0000000010101408] = f25e5a77, %l6 = 00000000547327ab
	ldstuba	[%i4+%o4]0x88,%l6	! %l6 = 00000077000000ff
!	Mem[0000000030101408] = 8483ae5c, %l2 = 00000000000000f0
	swapa	[%i4+%o4]0x89,%l2	! %l2 = 000000008483ae5c
!	Mem[0000000010101410] = 095135f0, %l7 = 0000000000000000
	swapa	[%i4+%o5]0x80,%l7	! %l7 = 00000000095135f0
!	%f1  = 38bcbdbe, Mem[0000000010041408] = 5919e33c
	sta	%f1 ,[%i1+%o4]0x88	! Mem[0000000010041408] = 38bcbdbe
!	Starting 10 instruction Load Burst
!	Mem[0000000021800180] = e8f2ad00, %l3 = 0000000000000000
	lduh	[%o3+0x180],%l3		! %l3 = 000000000000e8f2

p0_label_13:
!	Mem[00000000211c0000] = d9ff980d, %l3 = 000000000000e8f2
	ldsha	[%o2+0x000]%asi,%l3	! %l3 = ffffffffffffd9ff
!	Mem[0000000030181408] = 434c69d4, %l0 = 00000000b9284053
	lduba	[%i6+%o4]0x89,%l0	! %l0 = 00000000000000d4
!	Mem[0000000030101400] = c8f5be63 534028b9, %l0 = 000000d4, %l1 = 63bef5c8
	ldda	[%i4+%g0]0x89,%l0	! %l0 = 00000000534028b9 00000000c8f5be63
!	Mem[0000000030181400] = 1cb91804, %l1 = 00000000c8f5be63
	ldsha	[%i6+%g0]0x81,%l1	! %l1 = 0000000000001cb9
!	Mem[0000000030101410] = e137262958b20084, %f18 = ffbd086d 0039f71b
	ldda	[%i4+%o5]0x89,%f18	! %f18 = e1372629 58b20084
!	Mem[0000000010141410] = 000000002373c496, %f28 = 4049c358 fea97ab2
	ldda	[%i5+%o5]0x88,%f28	! %f28 = 00000000 2373c496
!	Mem[0000000010081410] = 1eab7afe155f25fd, %l7 = 00000000095135f0
	ldxa	[%i2+%o5]0x88,%l7	! %l7 = 1eab7afe155f25fd
!	Mem[0000000030101400] = c8f5be63534028b9, %f2  = 8f42ddd7 22110106
	ldda	[%i4+%g0]0x89,%f2 	! %f2  = c8f5be63 534028b9
!	Mem[0000000030141408] = 43b3df59, %l1 = 0000000000001cb9
	lduha	[%i5+%o4]0x89,%l1	! %l1 = 000000000000df59
!	Starting 10 instruction Store Burst
!	Mem[0000000010141408] = 82cef23d, %l3 = ffffffffffffd9ff
	swapa	[%i5+%o4]0x88,%l3	! %l3 = 0000000082cef23d

p0_label_14:
!	Mem[0000000010101430] = 6afb8e96, %l2 = 000000008483ae5c
	swap	[%i4+0x030],%l2		! %l2 = 000000006afb8e96
!	%f4  = 095135f0 47c6b2b0, %l0 = 00000000534028b9
!	Mem[0000000030081428] = 9daec754db994448
	add	%i2,0x028,%g1
	stda	%f4,[%g1+%l0]ASI_PST16_SL ! Mem[0000000030081428] = b0b2c754db995109
!	%l1 = 000000000000df59, Mem[0000000010181408] = 1bf739004049c358
	stxa	%l1,[%i6+%o4]0x88	! Mem[0000000010181408] = 000000000000df59
!	Mem[0000000010101422] = 8a78816a, %l5 = 00000000000000d9
	ldstub	[%i4+0x022],%l5		! %l5 = 00000081000000ff
!	%f20 = 1cb91804 5f880035, %l1 = 000000000000df59
!	Mem[0000000030001428] = 10ffdbc6a9f92710
	add	%i0,0x028,%g1
	stda	%f20,[%g1+%l1]ASI_PST16_S ! Mem[0000000030001428] = 1cb9dbc6a9f90035
!	%l1 = 000000000000df59, Mem[0000000030041408] = ac4b14ff
	stba	%l1,[%i1+%o4]0x89	! Mem[0000000030041408] = ac4b1459
!	%l5 = 0000000000000081, Mem[0000000030001410] = 00000000
	stha	%l5,[%i0+%o5]0x89	! Mem[0000000030001410] = 00000081
!	%f16 = e1372629, Mem[0000000030141408] = 59dfb343
	sta	%f16,[%i5+%o4]0x81	! Mem[0000000030141408] = e1372629
!	Mem[0000000010081410] = fd255f15, %l6 = 0000000000000077
	swapa	[%i2+%o5]0x80,%l6	! %l6 = 00000000fd255f15
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = ffd9ffff a1f49eb1, %l0 = 534028b9, %l1 = 0000df59
	ldda	[%i5+0x008]%asi,%l0	! %l0 = 00000000ffd9ffff 00000000a1f49eb1

p0_label_15:
!	Mem[00000000100c1400] = 19e5b62ef04f903a, %l3 = 0000000082cef23d
	ldxa	[%i3+%g0]0x80,%l3	! %l3 = 19e5b62ef04f903a
!	Mem[0000000030141410] = c2ffb4bb, %l2 = 000000006afb8e96
	lduha	[%i5+%o5]0x89,%l2	! %l2 = 000000000000b4bb
!	Mem[0000000010041430] = 1bdbf694e5936eab, %l0 = 00000000ffd9ffff
	ldxa	[%i1+0x030]%asi,%l0	! %l0 = 1bdbf694e5936eab
!	%l6 = 00000000fd255f15, imm = 0000000000000a39, %l4 = b0b2c647f0355109
	and	%l6,0xa39,%l4		! %l4 = 0000000000000a11
!	Mem[00000000100c1408] = 50a00528, %l7 = 1eab7afe155f25fd
	lduwa	[%i3+%o4]0x88,%l7	! %l7 = 0000000050a00528
!	Mem[0000000030181400] = d83be1db 0418b91c, %l4 = 00000a11, %l5 = 00000081
	ldda	[%i6+%g0]0x89,%l4	! %l4 = 000000000418b91c 00000000d83be1db
!	Mem[0000000010141408] = b19ef4a1ffffd9ff, %f4  = 095135f0 47c6b2b0
	ldda	[%i5+%o4]0x88,%f4 	! %f4  = b19ef4a1 ffffd9ff
!	Mem[00000000100c1400] = 19e5b62e, %l7 = 0000000050a00528
	ldsba	[%i3+%g0]0x80,%l7	! %l7 = 0000000000000019
!	Mem[0000000010181430] = 4049c358, %l0 = 1bdbf694e5936eab
	ldsha	[%i6+0x030]%asi,%l0	! %l0 = 0000000000004049
!	Starting 10 instruction Store Burst
!	%f22 = 5d662049, %f30 = a5d41c1d
	fsqrts	%f22,%f30		! %f30 = 4e72b7f2

p0_label_16:
!	Mem[0000000030141410] = c2ffb4bb, %l3 = 19e5b62ef04f903a
	swapa	[%i5+%o5]0x89,%l3	! %l3 = 00000000c2ffb4bb
!	Mem[0000000010141400] = 000000b0, %l3 = 00000000c2ffb4bb
	ldstuba	[%i5+%g0]0x80,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030101400] = 534028b9, %l4 = 000000000418b91c
	swapa	[%i4+%g0]0x89,%l4	! %l4 = 00000000534028b9
!	%f25 = 50a00528, Mem[0000000010141400] = ff0000b0
	sta	%f25,[%i5+%g0]0x80	! Mem[0000000010141400] = 50a00528
!	%f14 = 133dceb3, Mem[0000000030141400] = ac89d0e3
	sta	%f14,[%i5+%g0]0x81	! Mem[0000000030141400] = 133dceb3
!	%l0 = 0000000000004049, Mem[0000000010181410] = 0418b91c
	stwa	%l0,[%i6+%o5]0x88	! Mem[0000000010181410] = 00004049
!	%f11 = b751439d, Mem[00000000100c1410] = dff9a010
	sta	%f11,[%i3+%o5]0x80	! Mem[00000000100c1410] = b751439d
!	Mem[00000000100c1420] = af83e48b02283563, %l5 = 00000000d83be1db, %l7 = 0000000000000019
	add	%i3,0x20,%g1
	casxa	[%g1]0x80,%l5,%l7	! %l7 = af83e48b02283563
!	%f5  = ffffd9ff, Mem[00000000300c1400] = 000000ff
	sta	%f5 ,[%i3+%g0]0x89	! Mem[00000000300c1400] = ffffd9ff
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (4)
!	Mem[0000000010181400] = e1372629 e1372629 59df0000 00000000
!	Mem[0000000010181410] = 49400000 5f880035 5d662049 2373c496
!	Mem[0000000010181420] = 775a5ef2 0000006c 9d4351b7 3b3a6b3f
!	Mem[0000000010181430] = 4049c358 fea97ab2 a5d41c1d 9a41c1c7
	ldda	[%i6]ASI_BLK_AIUP,%f0	! Block Load from 0000000010181400

p0_label_17:
!	Mem[0000000010101408] = ff5a5ef2, %l0 = 0000000000004049
	ldswa	[%i4+%o4]0x80,%l0	! %l0 = ffffffffff5a5ef2
!	Mem[0000000030041408] = 59144bac, %l6 = 00000000fd255f15
	lduha	[%i1+%o4]0x81,%l6	! %l6 = 0000000000005914
!	Mem[0000000010181438] = a5d41c1d, %l2 = 000000000000b4bb
	ldsb	[%i6+0x03a],%l2		! %l2 = 000000000000001c
!	Mem[0000000010041410] = 00000000, %l4 = 00000000534028b9
	ldsha	[%i1+%o5]0x88,%l4	! %l4 = 0000000000000000
!	Mem[00000000211c0000] = d9ff980d, %l4 = 0000000000000000
	lduba	[%o2+0x001]%asi,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010001410] = 505d8668, %l0 = ffffffffff5a5ef2
	ldswa	[%i0+%o5]0x80,%l0	! %l0 = 00000000505d8668
!	Mem[0000000030181410] = 0001701307a5e44d, %f26 = 9d4351b7 3b3a6b3f
	ldda	[%i6+%o5]0x89,%f26	! %f26 = 00017013 07a5e44d
!	Mem[0000000010081408] = a5d41c1d, %l3 = 0000000000000000
	ldswa	[%i2+%o4]0x80,%l3	! %l3 = ffffffffa5d41c1d
!	Mem[00000000100c1410] = b751439d, %l5 = 00000000d83be1db
	ldsba	[%i3+%o5]0x80,%l5	! %l5 = ffffffffffffffb7
!	Starting 10 instruction Store Burst
!	%f18 = e1372629 58b20084, Mem[0000000010001418] = 2e3bb29a ab6cb408
	std	%f18,[%i0+0x018]	! Mem[0000000010001418] = e1372629 58b20084

p0_label_18:
!	%l7 = af83e48b02283563, Mem[0000000010041408] = bebdbc38
	stba	%l7,[%i1+%o4]0x80	! Mem[0000000010041408] = 63bdbc38
!	%l6 = 00005914, %l7 = 02283563, Mem[0000000010041430] = 1bdbf694 e5936eab
	stda	%l6,[%i1+0x030]%asi	! Mem[0000000010041430] = 00005914 02283563
!	Mem[00000000300c1408] = 00000000, %l3 = ffffffffa5d41c1d
	ldstuba	[%i3+%o4]0x89,%l3	! %l3 = 00000000000000ff
!	%l1 = 00000000a1f49eb1, Mem[0000000010081408] = 1d1cd4a5
	stba	%l1,[%i2+%o4]0x88	! Mem[0000000010081408] = 1d1cd4b1
!	Mem[00000000300c1408] = ff000000, %l7 = af83e48b02283563
	swapa	[%i3+%o4]0x81,%l7	! %l7 = 00000000ff000000
!	%l6 = 0000000000005914, Mem[00000000201c0000] = 001919af
	sth	%l6,[%o0+%g0]		! Mem[00000000201c0000] = 591419af
!	Mem[00000000100c1438] = 10ca031c0700407a, %l5 = ffffffffffffffb7, %l6 = 0000000000005914
	add	%i3,0x38,%g1
	casxa	[%g1]0x80,%l5,%l6	! %l6 = 10ca031c0700407a
!	%l6 = 0700407a, %l7 = ff000000, Mem[0000000010041438] = 9faa33db ff4961d8
	stda	%l6,[%i1+0x038]%asi	! Mem[0000000010041438] = 0700407a ff000000
!	%l4 = 00000000000000ff, Mem[00000000100c1410] = b751439d
	stwa	%l4,[%i3+%o5]0x80	! Mem[00000000100c1410] = 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000020800000] = f63317e8, %l4 = 00000000000000ff
	ldsb	[%o1+%g0],%l4		! %l4 = fffffffffffffff6

p0_label_19:
!	Mem[0000000010081408] = 1d1cd4b1, %l5 = ffffffffffffffb7
	ldsha	[%i2+%o4]0x88,%l5	! %l5 = ffffffffffffd4b1
!	Mem[0000000010101400] = 444be5f36a7e51c5, %f20 = 1cb91804 5f880035
	ldda	[%i4+%g0]0x88,%f20	! %f20 = 444be5f3 6a7e51c5
!	Mem[0000000030081410] = 7a7958e616fc1d3f, %l4 = fffffffffffffff6
	ldxa	[%i2+%o5]0x81,%l4	! %l4 = 7a7958e616fc1d3f
!	Mem[0000000030081400] = 77a1000000000000, %f28 = 00000000 2373c496
	ldda	[%i2+%g0]0x89,%f28	! %f28 = 77a10000 00000000
!	Mem[0000000030181408] = 434c69d4, %f21 = 6a7e51c5
	lda	[%i6+%o4]0x89,%f21	! %f21 = 434c69d4
!	Mem[0000000030141400] = 133dceb3 2fc1555e, %l2 = 0000001c, %l3 = 00000000
	ldda	[%i5+%g0]0x81,%l2	! %l2 = 00000000133dceb3 000000002fc1555e
!	Mem[0000000010001408] = 8a78816a3ee5dbe1, %f16 = e1372629 e1372629
	ldda	[%i0+%o4]0x88,%f16	! %f16 = 8a78816a 3ee5dbe1
!	Mem[0000000030141400] = b3ce3d13, %l5 = ffffffffffffd4b1
	lduwa	[%i5+%g0]0x89,%l5	! %l5 = 00000000b3ce3d13
!	Mem[0000000030181410] = 00017013 07a5e44d, %l4 = 16fc1d3f, %l5 = b3ce3d13
	ldda	[%i6+%o5]0x89,%l4	! %l4 = 0000000007a5e44d 0000000000017013
!	Starting 10 instruction Store Burst
!	%l4 = 0000000007a5e44d, Mem[0000000030081410] = 3f1dfc16e658797a
	stxa	%l4,[%i2+%o5]0x89	! Mem[0000000030081410] = 0000000007a5e44d

p0_label_20:
!	%l1 = 00000000a1f49eb1, Mem[0000000010041400] = 133dceb3
	stw	%l1,[%i1+%g0]		! Mem[0000000010041400] = a1f49eb1
!	%l1 = 00000000a1f49eb1, Mem[0000000010081430] = 5ea16e43, %asi = 80
	stwa	%l1,[%i2+0x030]%asi	! Mem[0000000010081430] = a1f49eb1
!	Mem[0000000020800000] = f63317e8, %l5 = 0000000000017013
	ldstub	[%o1+%g0],%l5		! %l5 = 000000f6000000ff
!	%l6 = 10ca031c0700407a, Mem[00000000300c1408] = 022835635e4de1dd
	stxa	%l6,[%i3+%o4]0x81	! Mem[00000000300c1408] = 10ca031c0700407a
!	Mem[0000000010101408] = f25e5aff, %l2 = 00000000133dceb3
	swapa	[%i4+%o4]0x88,%l2	! %l2 = 00000000f25e5aff
!	%l5 = 00000000000000f6, %l1 = 00000000a1f49eb1, %l4 = 0000000007a5e44d
	sdivx	%l5,%l1,%l4		! %l4 = 0000000000000000
!	%f6  = 5d662049 2373c496, %l7 = 00000000ff000000
!	Mem[00000000300c1420] = e9ac274a0d75349a
	add	%i3,0x020,%g1
	stda	%f6,[%g1+%l7]ASI_PST16_S ! Mem[00000000300c1420] = e9ac274a0d75349a
!	%l1 = 00000000a1f49eb1, Mem[0000000030001408] = 58c34940
	stwa	%l1,[%i0+%o4]0x89	! Mem[0000000030001408] = a1f49eb1
!	%l6 = 0700407a, %l7 = ff000000, Mem[0000000010141400] = 50a00528 8eac6b86
	stda	%l6,[%i5+%g0]0x80	! Mem[0000000010141400] = 0700407a ff000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030181410] = 07a5e44d, %l0 = 00000000505d8668
	lduwa	[%i6+%o5]0x89,%l0	! %l0 = 0000000007a5e44d

p0_label_21:
!	Mem[0000000030081400] = 00000000, %l4 = 0000000000000000
	lduwa	[%i2+%g0]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000010041410] = 00000000, %l1 = 00000000a1f49eb1
	ldsha	[%i1+%o5]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000030101410] = 58b20084, %l0 = 0000000007a5e44d
	lduha	[%i4+%o5]0x89,%l0	! %l0 = 0000000000000084
!	Mem[0000000010041410] = 00000000, %l4 = 0000000000000000
	ldsba	[%i1+%o5]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000010101410] = 0000000047c6b2b0, %f28 = 77a10000 00000000
	ldda	[%i4+%o5]0x80,%f28	! %f28 = 00000000 47c6b2b0
!	Mem[0000000010001408] = e1dbe53e, %l7 = 00000000ff000000
	ldsh	[%i0+%o4],%l7		! %l7 = ffffffffffffe1db
!	Mem[0000000010081408] = 1d1cd4b1, %l2 = 00000000f25e5aff
	lduba	[%i2+%o4]0x88,%l2	! %l2 = 00000000000000b1
!	Mem[0000000010081408] = b1d41c1d9a41c1c7, %f10 = 9d4351b7 3b3a6b3f
	ldda	[%i2+%o4]0x80,%f10	! %f10 = b1d41c1d 9a41c1c7
!	Mem[0000000010181438] = a5d41c1d, %f2  = 59df0000
	ld	[%i6+0x038],%f2 	! %f2 = a5d41c1d
!	Starting 10 instruction Store Burst
!	%l5 = 00000000000000f6, Mem[0000000030081400] = 00000000
	stha	%l5,[%i2+%g0]0x89	! Mem[0000000030081400] = 000000f6

p0_label_22:
!	Mem[00000000100c1430] = 3e645548, %l6 = 0700407a, %l7 = ffffe1db
	add	%i3,0x30,%g1
	casa	[%g1]0x80,%l6,%l7	! %l7 = 000000003e645548
!	%f20 = 444be5f3, Mem[00000000300c1410] = 6d08bdff
	sta	%f20,[%i3+%o5]0x89	! Mem[00000000300c1410] = 444be5f3
	membar	#Sync			! Added by membar checker (5)
!	%l4 = 0000000000000000, Mem[000000001018140a] = 59df0000, %asi = 80
	stba	%l4,[%i6+0x00a]%asi	! Mem[0000000010181408] = 59df0000
!	%l3 = 000000002fc1555e, Mem[0000000010001410] = 505d8668
	stba	%l3,[%i0+%o5]0x80	! Mem[0000000010001410] = 5e5d8668
!	%l2 = 000000b1, %l3 = 2fc1555e, Mem[0000000030101408] = 000000f0 5c000000
	stda	%l2,[%i4+%o4]0x89	! Mem[0000000030101408] = 000000b1 2fc1555e
!	%f22 = 5d662049 2373c496, Mem[0000000010141428] = c842be0e 2335a31a
	std	%f22,[%i5+0x028]	! Mem[0000000010141428] = 5d662049 2373c496
!	%l7 = 000000003e645548, Mem[0000000030001410] = 00000081
	stba	%l7,[%i0+%o5]0x89	! Mem[0000000030001410] = 00000048
!	Mem[0000000010001408] = 3ee5dbe1, %l2 = 00000000000000b1
	ldstuba	[%i0+%o4]0x88,%l2	! %l2 = 000000e1000000ff
!	Mem[0000000010181428] = 9d4351b7, %l4 = 0000000000000000, %asi = 80
	swapa	[%i6+0x028]%asi,%l4	! %l4 = 000000009d4351b7
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = 292637e1, %l4 = 000000009d4351b7
	ldsha	[%i6+%g0]0x88,%l4	! %l4 = 00000000000037e1

p0_label_23:
!	Mem[0000000030081410] = 07a5e44d, %l5 = 00000000000000f6
	lduha	[%i2+%o5]0x89,%l5	! %l5 = 000000000000e44d
!	Mem[000000001000140c] = 6a81788a, %l2 = 00000000000000e1
	lduba	[%i0+0x00f]%asi,%l2	! %l2 = 000000000000008a
!	Mem[0000000010001408] = ffdbe53e 6a81788a, %l6 = 0700407a, %l7 = 3e645548
	ldda	[%i0+%o4]0x80,%l6	! %l6 = 00000000ffdbe53e 000000006a81788a
!	Mem[0000000010081408] = 1d1cd4b1, %l3 = 000000002fc1555e
	lduwa	[%i2+%o4]0x88,%l3	! %l3 = 000000001d1cd4b1
!	Mem[00000000100c1400] = 3a904ff02eb6e519, %f30 = 4e72b7f2 9a41c1c7
	ldda	[%i3+%g0]0x88,%f30	! %f30 = 3a904ff0 2eb6e519
!	Mem[0000000020800000] = ff3317e8, %l7 = 000000006a81788a
	ldub	[%o1+0x001],%l7		! %l7 = 0000000000000033
!	Mem[0000000010041408] = 38bcbd63, %l4 = 00000000000037e1
	lduwa	[%i1+%o4]0x88,%l4	! %l4 = 0000000038bcbd63
!	Mem[0000000030081408] = 5d6620492373c496, %l3 = 000000001d1cd4b1
	ldxa	[%i2+%o4]0x89,%l3	! %l3 = 5d6620492373c496
!	Mem[0000000030001408] = b19ef4a1eb41318b, %f6  = 5d662049 2373c496
	ldda	[%i0+%o4]0x81,%f6 	! %f6  = b19ef4a1 eb41318b
!	Starting 10 instruction Store Burst
!	Mem[0000000030141408] = e1372629, %l4 = 0000000038bcbd63
	swapa	[%i5+%o4]0x81,%l4	! %l4 = 00000000e1372629

p0_label_24:
!	Mem[00000000201c0000] = 591419af, %l4 = 00000000e1372629
	ldstub	[%o0+%g0],%l4		! %l4 = 00000059000000ff
!	%l7 = 0000000000000033, Mem[0000000010081410] = 00000077
	stwa	%l7,[%i2+%o5]0x80	! Mem[0000000010081410] = 00000033
!	%l4 = 0000000000000059, %l0 = 0000000000000084, %l7 = 0000000000000033
	xnor	%l4,%l0,%l7		! %l7 = ffffffffffffff22
!	%f28 = 00000000, Mem[0000000030041410] = 44fa28d0
	sta	%f28,[%i1+%o5]0x89	! Mem[0000000030041410] = 00000000
!	%l0 = 00000084, %l1 = 00000000, Mem[0000000030101408] = b1000000 5e55c12f
	stda	%l0,[%i4+%o4]0x81	! Mem[0000000030101408] = 00000084 00000000
!	%l7 = ffffffffffffff22, Mem[0000000010141410] = 96c47323
	stwa	%l7,[%i5+%o5]0x80	! Mem[0000000010141410] = ffffff22
!	%l2 = 000000000000008a, imm = 0000000000000b59, %l2 = 000000000000008a
	sub	%l2,0xb59,%l2		! %l2 = fffffffffffff531
!	%f0  = e1372629 e1372629, %l4 = 0000000000000059
!	Mem[00000000300c1438] = 4e88cf033c9e3d33
	add	%i3,0x038,%g1
	stda	%f0,[%g1+%l4]ASI_PST16_S ! Mem[00000000300c1438] = e137cf033c9e2629
!	Mem[000000001018141e] = 2373c496, %l0 = 0000000000000084
	ldstuba	[%i6+0x01e]%asi,%l0	! %l0 = 000000c4000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = 63bdbc38, %f27 = 07a5e44d
	lda	[%i1+%o4]0x80,%f27	! %f27 = 63bdbc38

p0_label_25:
!	Mem[00000000300c1408] = 10ca031c, %l1 = 0000000000000000
	ldsba	[%i3+%o4]0x81,%l1	! %l1 = 0000000000000010
!	Mem[0000000030181410] = 4de4a507, %l3 = 5d6620492373c496
	lduha	[%i6+%o5]0x81,%l3	! %l3 = 0000000000004de4
!	%l7 = ffffffffffffff22, immd = fffffffffffff7d3, %l0  = 00000000000000c4
	mulx	%l7,-0x82d,%l0		! %l0 = 0000000000071706
!	Mem[00000000201c0000] = ff1419af, %l0 = 0000000000071706
	ldub	[%o0+0x001],%l0		! %l0 = 0000000000000014
!	Mem[00000000100c1400] = 19e5b62e, %l0 = 0000000000000014
	ldsha	[%i3+0x000]%asi,%l0	! %l0 = 00000000000019e5
!	Mem[0000000030041400] = ffae8384c087a97a, %l0 = 00000000000019e5
	ldxa	[%i1+%g0]0x81,%l0	! %l0 = ffae8384c087a97a
!	Mem[0000000030081410] = 4de4a507, %l1 = 0000000000000010
	ldsha	[%i2+%o5]0x81,%l1	! %l1 = 0000000000004de4
!	Mem[0000000010001424] = aa9ebb80, %l0 = ffae8384c087a97a
	ldsw	[%i0+0x024],%l0		! %l0 = ffffffffaa9ebb80
!	Mem[00000000100c1400] = 19e5b62e, %f9  = 0000006c
	lda	[%i3+%g0]0x80,%f9 	! %f9 = 19e5b62e
!	Starting 10 instruction Store Burst
!	%f30 = 3a904ff0 2eb6e519, Mem[0000000030001400] = db9675ac 3116a030
	stda	%f30,[%i0+%g0]0x89	! Mem[0000000030001400] = 3a904ff0 2eb6e519

p0_label_26:
!	%f4  = 49400000, Mem[0000000010001400] = ff40342b
	sta	%f4 ,[%i0+%g0]0x80	! Mem[0000000010001400] = 49400000
!	%l5 = 000000000000e44d, Mem[0000000010141400] = 0700407a
	stwa	%l5,[%i5+%g0]0x80	! Mem[0000000010141400] = 0000e44d
!	%f26 = 00017013, Mem[0000000030001408] = a1f49eb1
	sta	%f26,[%i0+%o4]0x89	! Mem[0000000030001408] = 00017013
!	Mem[0000000030141410] = f04f903a, %l6 = 00000000ffdbe53e
	swapa	[%i5+%o5]0x89,%l6	! %l6 = 00000000f04f903a
!	%l1 = 0000000000004de4, Mem[0000000010101408] = b3ce3d1350a00528
	stxa	%l1,[%i4+%o4]0x80	! Mem[0000000010101408] = 0000000000004de4
!	%l0 = aa9ebb80, %l1 = 00004de4, Mem[0000000010081400] = b751439d d07b5173
	stda	%l0,[%i2+%g0]0x88	! Mem[0000000010081400] = aa9ebb80 00004de4
!	Mem[0000000010081439] = 7455d1b4, %l4 = 0000000000000059
	ldstub	[%i2+0x039],%l4		! %l4 = 00000055000000ff
!	Mem[0000000021800141] = 30bc94e3, %l1 = 0000000000004de4
	ldstuba	[%o3+0x141]%asi,%l1	! %l1 = 000000bc000000ff
!	%l0 = ffffffffaa9ebb80, Mem[0000000010041408] = 63bdbc38b9013952
	stxa	%l0,[%i1+%o4]0x80	! Mem[0000000010041408] = ffffffffaa9ebb80
!	Starting 10 instruction Load Burst
!	Mem[0000000030101410] = e137262958b20084, %l1 = 00000000000000bc
	ldxa	[%i4+%o5]0x89,%l1	! %l1 = e137262958b20084

p0_label_27:
!	Mem[0000000010181408] = 59df0000, %l5 = 000000000000e44d
	lduba	[%i6+%o4]0x80,%l5	! %l5 = 0000000000000059
!	Mem[0000000010001400] = 00004049, %l2 = fffffffffffff531
	lduba	[%i0+%g0]0x88,%l2	! %l2 = 0000000000000049
!	%l1 = e137262958b20084, immed = 00000e61, %y  = 00000000
	smul	%l1,0xe61,%l5		! %l5 = 000004fb57796a04, %y = 000004fb
!	Mem[0000000010081400] = aa9ebb80, %l7 = ffffffffffffff22
	ldsha	[%i2+%g0]0x88,%l7	! %l7 = ffffffffffffbb80
!	Mem[0000000030041408] = ac4b1459, %l4 = 0000000000000055
	ldswa	[%i1+%o4]0x89,%l4	! %l4 = ffffffffac4b1459
!	Mem[0000000010181410] = 49400000, %l6 = 00000000f04f903a
	ldsba	[%i6+%o5]0x80,%l6	! %l6 = 0000000000000049
!	Mem[0000000030141410] = 3ee5dbff56d7a6d3, %l5 = 000004fb57796a04
	ldxa	[%i5+%o5]0x81,%l5	! %l5 = 3ee5dbff56d7a6d3
!	Mem[0000000010001410] = 68865d5e, %f4  = 49400000
	lda	[%i0+%o5]0x88,%f4 	! %f4 = 68865d5e
!	Mem[00000000100c1410] = 000000ff, %l1 = e137262958b20084
	lduha	[%i3+%o5]0x80,%l1	! %l1 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f6  = b19ef4a1, %f3  = 00000000, %f24 = 775a5ef2 50a00528
	fsmuld	%f6 ,%f3 ,%f24		! %f24 = 80000000 00000000

p0_label_28:
!	%f26 = 00017013, %f24 = 80000000, %f26 = 00017013
	fsubs	%f26,%f24,%f26		! %l0 = ffffffffaa9ebba2, Unfinished, %fsr = 0000000000
!	%l6 = 00000049, %l7 = ffffbb80, Mem[0000000030181400] = 1cb91804 dbe13bd8
	stda	%l6,[%i6+%g0]0x81	! Mem[0000000030181400] = 00000049 ffffbb80
!	%f15 = 9a41c1c7, Mem[0000000010181408] = 0000df59
	sta	%f15,[%i6+%o4]0x88	! Mem[0000000010181408] = 9a41c1c7
!	Mem[00000000300c1400] = ffd9ffff, %l2 = 0000000000000049
	swapa	[%i3+%g0]0x81,%l2	! %l2 = 00000000ffd9ffff
!	%f16 = 8a78816a, Mem[0000000010081400] = aa9ebb80
	sta	%f16,[%i2+%g0]0x88	! Mem[0000000010081400] = 8a78816a
!	%l7 = ffffffffffffbb80, Mem[0000000030181408] = a7924bdd434c69d4
	stxa	%l7,[%i6+%o4]0x89	! Mem[0000000030181408] = ffffffffffffbb80
!	%f14 = a5d41c1d 9a41c1c7, %l4 = ffffffffac4b1459
!	Mem[0000000010001418] = e137262958b20084
	add	%i0,0x018,%g1
	stda	%f14,[%g1+%l4]ASI_PST32_PL ! Mem[0000000010001418] = c7c1419a58b20084
!	Mem[0000000010141410] = ffffff22, %l4 = ffffffffac4b1459
	swapa	[%i5+%o5]0x80,%l4	! %l4 = 00000000ffffff22
!	Mem[0000000030001408] = 00017013, %l2 = 00000000ffd9ffff
	ldsha	[%i0+%o4]0x89,%l2	! %l2 = 0000000000007013
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = 534d1e6e00000000, %f18 = e1372629 58b20084
	ldda	[%i1+%o5]0x88,%f18	! %f18 = 534d1e6e 00000000

p0_label_29:
!	%f11 = 9a41c1c7, %f2  = a5d41c1d
	fcmps	%fcc1,%f11,%f2 		! %fcc1 = 2
!	Mem[0000000010041400] = a1f49eb1, %f19 = 00000000
	lda	[%i1+%g0]0x80,%f19	! %f19 = a1f49eb1
!	Mem[0000000010181408] = c7c1419a, %l5 = 3ee5dbff56d7a6d3
	lduwa	[%i6+%o4]0x80,%l5	! %l5 = 00000000c7c1419a
!	Mem[0000000010081408] = c7c1419a 1d1cd4b1, %l0 = aa9ebba2, %l1 = 00000000
	ldda	[%i2+%o4]0x88,%l0	! %l0 = 000000001d1cd4b1 00000000c7c1419a
!	%l3 = 0000000000004de4, imm = 000000000000046c, %l7 = ffffffffffffbb80
	xor	%l3,0x46c,%l7		! %l7 = 0000000000004988
!	Mem[0000000020800040] = 06ff226c, %l4 = 00000000ffffff22
	ldsb	[%o1+0x041],%l4		! %l4 = ffffffffffffffff
!	Mem[0000000010041408] = ffffffff, %l6 = 0000000000000049
	lduba	[%i1+%o4]0x80,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030101400] = 0418b91c, %f28 = 00000000
	lda	[%i4+%g0]0x89,%f28	! %f28 = 0418b91c
!	%f23 = 2373c496, %f4  = 68865d5e, %f10 = b1d41c1d
	fdivs	%f23,%f4 ,%f10		! %l0 = 000000001d1cd4d3, Unfinished, %fsr = 0200000000
!	Starting 10 instruction Store Burst
!	Mem[000000001014141f] = 88f9d8ea, %l4 = ffffffffffffffff
	ldstub	[%i5+0x01f],%l4		! %l4 = 000000ea000000ff

p0_label_30:
!	%l5 = 00000000c7c1419a, Mem[0000000010141408] = b19ef4a1ffffd9ff
	stxa	%l5,[%i5+%o4]0x88	! Mem[0000000010141408] = 00000000c7c1419a
!	%l5 = 00000000c7c1419a, Mem[0000000030141408] = 38bcbd63
	stha	%l5,[%i5+%o4]0x81	! Mem[0000000030141408] = 419abd63
!	Mem[0000000030041400] = ffae8384, %l1 = 00000000c7c1419a
	ldstuba	[%i1+%g0]0x81,%l1	! %l1 = 000000ff000000ff
!	%f14 = a5d41c1d 9a41c1c7, %l0 = 000000001d1cd4d3
!	Mem[0000000030001400] = 19e5b62ef04f903a
	stda	%f14,[%i0+%l0]ASI_PST32_S ! Mem[0000000030001400] = a5d41c1d9a41c1c7
!	Mem[0000000010041400] = b19ef4a1, %l0 = 000000001d1cd4d3
	ldstuba	[%i1+%g0]0x88,%l0	! %l0 = 000000a1000000ff
!	%f0  = e1372629 e1372629 a5d41c1d 00000000
!	%f4  = 68865d5e 5f880035 b19ef4a1 eb41318b
!	%f8  = 775a5ef2 19e5b62e b1d41c1d 9a41c1c7
!	%f12 = 4049c358 fea97ab2 a5d41c1d 9a41c1c7
	stda	%f0,[%i6]ASI_COMMIT_S	! Block Store to 0000000030181400
!	%l6 = 00000000000000ff, Mem[0000000010101410] = 00000000
	stwa	%l6,[%i4+%o5]0x88	! Mem[0000000010101410] = 000000ff
!	Mem[000000001014142c] = 2373c496, %l7 = 0000000000004988, %asi = 80
	swapa	[%i5+0x02c]%asi,%l7	! %l7 = 000000002373c496
!	%f21 = 434c69d4, Mem[0000000010081408] = b1d41c1d
	sta	%f21,[%i2+%o4]0x80	! Mem[0000000010081408] = 434c69d4
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = b19ef4ff, %l2 = 0000000000007013
	lduha	[%i1+%g0]0x88,%l2	! %l2 = 000000000000f4ff

p0_label_31:
!	Mem[00000000300c1408] = 10ca031c0700407a, %l6 = 00000000000000ff
	ldxa	[%i3+%o4]0x81,%l6	! %l6 = 10ca031c0700407a
!	Mem[0000000010001410] = 5e5d8668 94e9ad49, %l6 = 0700407a, %l7 = 2373c496
	ldda	[%i0+%o5]0x80,%l6	! %l6 = 000000005e5d8668 0000000094e9ad49
!	Mem[0000000030101400] = 1cb91804, %l0 = 00000000000000a1
	ldsha	[%i4+%g0]0x81,%l0	! %l0 = 0000000000001cb9
!	Mem[0000000030041410] = 00000000, %l6 = 000000005e5d8668
	lduha	[%i1+%o5]0x89,%l6	! %l6 = 0000000000000000
!	Mem[00000000300c1410] = f3e54b44, %l5 = 00000000c7c1419a
	lduha	[%i3+%o5]0x81,%l5	! %l5 = 000000000000f3e5
!	Mem[0000000030141400] = 133dceb32fc1555e, %f16 = 8a78816a 3ee5dbe1
	ldda	[%i5+%g0]0x81,%f16	! %f16 = 133dceb3 2fc1555e
	membar	#Sync			! Added by membar checker (6)
!	Mem[0000000010181400] = e1372629, %l0 = 0000000000001cb9
	ldsha	[%i6+%g0]0x80,%l0	! %l0 = ffffffffffffe137
!	Mem[00000000100c1400] = 19e5b62ef04f903a, %l5 = 000000000000f3e5
	ldxa	[%i3+%g0]0x80,%l5	! %l5 = 19e5b62ef04f903a
!	Mem[00000000201c0000] = ff1419af, %l7 = 0000000094e9ad49
	lduha	[%o0+0x000]%asi,%l7	! %l7 = 000000000000ff14
!	Starting 10 instruction Store Burst
!	Mem[0000000010181400] = e1372629, %l2 = 000000000000f4ff
	swapa	[%i6+%g0]0x80,%l2	! %l2 = 00000000e1372629

p0_label_32:
!	%f8  = 775a5ef2 19e5b62e, Mem[0000000030041400] = 8483aeff 7aa987c0
	stda	%f8 ,[%i1+%g0]0x89	! Mem[0000000030041400] = 775a5ef2 19e5b62e
!	%f21 = 434c69d4, Mem[0000000010181424] = 0000006c
	sta	%f21,[%i6+0x024]%asi	! Mem[0000000010181424] = 434c69d4
!	%l6 = 0000000000000000, Mem[0000000010101410] = 000000ff
	stha	%l6,[%i4+%o5]0x88	! Mem[0000000010101410] = 00000000
!	%l6 = 0000000000000000, Mem[0000000010081408] = 434c69d4
	stw	%l6,[%i2+%o4]		! Mem[0000000010081408] = 00000000
!	Mem[0000000030181408] = a5d41c1d, %l0 = ffffffffffffe137
	ldstuba	[%i6+%o4]0x81,%l0	! %l0 = 000000a5000000ff
!	%f0  = e1372629 e1372629, %l0 = 00000000000000a5
!	Mem[0000000010041410] = 000000006e1e4d53
	add	%i1,0x010,%g1
	stda	%f0,[%g1+%l0]ASI_PST16_P ! Mem[0000000010041410] = 000026296e1e2629
!	%l5 = 19e5b62ef04f903a, Mem[00000000300c1410] = f3e54b44
	stba	%l5,[%i3+%o5]0x81	! Mem[00000000300c1410] = 3ae54b44
!	Mem[00000000300c1400] = 49000000, %l0 = 00000000000000a5
	swapa	[%i3+%g0]0x89,%l0	! %l0 = 0000000049000000
!	%l0 = 0000000049000000, Mem[0000000030001400] = a5d41c1d
	stha	%l0,[%i0+%g0]0x81	! Mem[0000000030001400] = 00001c1d
!	Starting 10 instruction Load Burst
!	Code Fragment 3
p0_fragment_2:
!	%l0 = 0000000049000000
	setx	0xf46a0377f7179b67,%g7,%l0 ! %l0 = f46a0377f7179b67
!	%l1 = 00000000000000ff
	setx	0x1bb4082fae9c64d0,%g7,%l1 ! %l1 = 1bb4082fae9c64d0
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = f46a0377f7179b67
	setx	0x7271fd8036906ba1,%g7,%l0 ! %l0 = 7271fd8036906ba1
!	%l1 = 1bb4082fae9c64d0
	setx	0x8a0cc91786a48f51,%g7,%l1 ! %l1 = 8a0cc91786a48f51

p0_label_33:
!	Mem[0000000030141400] = 133dceb3, %l4 = 00000000000000ea
	ldsba	[%i5+%g0]0x81,%l4	! %l4 = 0000000000000013
!	Mem[00000000100c1408] = 2805a050 a03f5a8f, %l4 = 00000013, %l5 = f04f903a
	ldda	[%i3+%o4]0x80,%l4	! %l4 = 000000002805a050 00000000a03f5a8f
!	Mem[0000000010101400] = c5517e6a, %l5 = 00000000a03f5a8f
	ldsha	[%i4+%g0]0x80,%l5	! %l5 = ffffffffffffc551
!	Mem[00000000201c0000] = ff1419af, %l7 = 000000000000ff14
	lduba	[%o0+0x001]%asi,%l7	! %l7 = 0000000000000014
!	Mem[00000000218001c0] = 54e9f4cf, %l5 = ffffffffffffc551
	ldsb	[%o3+0x1c0],%l5		! %l5 = 0000000000000054
!	Mem[0000000030101408] = 0000008400000000, %f12 = 4049c358 fea97ab2
	ldda	[%i4+%o4]0x81,%f12	! %f12 = 00000084 00000000
!	Mem[0000000030081408] = 5d662049 2373c496, %l2 = e1372629, %l3 = 00004de4
	ldda	[%i2+%o4]0x89,%l2	! %l2 = 000000002373c496 000000005d662049
!	Mem[0000000030001400] = c7c1419a1d1c0000, %l3 = 000000005d662049
	ldxa	[%i0+%g0]0x89,%l3	! %l3 = c7c1419a1d1c0000
!	Mem[00000000300c1410] = 3ae54b44, %l4 = 000000002805a050
	lduwa	[%i3+%o5]0x81,%l4	! %l4 = 000000003ae54b44
!	Starting 10 instruction Store Burst
!	%l0 = 7271fd8036906ba1, Mem[0000000030101410] = e137262958b20084
	stxa	%l0,[%i4+%o5]0x89	! Mem[0000000030101410] = 7271fd8036906ba1

p0_label_34:
!	%l7 = 0000000000000014, Mem[0000000010001400] = 00004049
	stha	%l7,[%i0+%g0]0x88	! Mem[0000000010001400] = 00000014
!	%l2 = 000000002373c496, Mem[00000000300c1410] = 3ae54b440039f71b
	stxa	%l2,[%i3+%o5]0x81	! Mem[00000000300c1410] = 000000002373c496
!	Mem[00000000300c1410] = 00000000, %l6 = 0000000000000000
	ldstuba	[%i3+%o5]0x81,%l6	! %l6 = 00000000000000ff
!	%l0 = 7271fd8036906ba1, Mem[00000000300c1410] = 000000ff
	stwa	%l0,[%i3+%o5]0x89	! Mem[00000000300c1410] = 36906ba1
!	%l4 = 000000003ae54b44, Mem[0000000030001400] = 1d1c0000
	stwa	%l4,[%i0+%g0]0x89	! Mem[0000000030001400] = 3ae54b44
!	%l3 = c7c1419a1d1c0000, Mem[0000000030141408] = 419abd63
	stha	%l3,[%i5+%o4]0x81	! Mem[0000000030141408] = 0000bd63
!	%l2 = 000000002373c496, Mem[0000000010081400] = 8a78816a
	stba	%l2,[%i2+%g0]0x88	! Mem[0000000010081400] = 8a788196
!	%f4  = 68865d5e 5f880035, Mem[0000000030001400] = 444be53a 9a41c1c7
	stda	%f4 ,[%i0+%g0]0x81	! Mem[0000000030001400] = 68865d5e 5f880035
!	%l4 = 3ae54b44, %l5 = 00000054, Mem[0000000030181408] = 1d1cd4ff 00000000
	stda	%l4,[%i6+%o4]0x89	! Mem[0000000030181408] = 3ae54b44 00000054
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = d9ff980d, %l1 = 8a0cc91786a48f51
	lduh	[%o2+%g0],%l1		! %l1 = 000000000000d9ff

p0_label_35:
!	Mem[0000000030141410] = 3ee5dbff, %f26 = 00017013
	lda	[%i5+%o5]0x81,%f26	! %f26 = 3ee5dbff
!	Mem[0000000010041438] = 0700407a ff000000, %l4 = 3ae54b44, %l5 = 00000054
	ldda	[%i1+0x038]%asi,%l4	! %l4 = 000000000700407a 00000000ff000000
!	Mem[0000000030001408] = 8b3141eb00017013, %f0  = e1372629 e1372629
	ldda	[%i0+%o4]0x89,%f0 	! %f0  = 8b3141eb 00017013
!	Mem[0000000010001410] = 68865d5e, %l3 = c7c1419a1d1c0000
	ldsha	[%i0+%o5]0x88,%l3	! %l3 = 0000000000005d5e
!	Mem[00000000100c1428] = e27e2b41 f2aa7756, %l6 = 00000000, %l7 = 00000014
	ldda	[%i3+0x028]%asi,%l6	! %l6 = 00000000e27e2b41 00000000f2aa7756
!	Mem[00000000300c1410] = 96c47323 36906ba1, %l4 = 0700407a, %l5 = ff000000
	ldda	[%i3+%o5]0x89,%l4	! %l4 = 0000000036906ba1 0000000096c47323
!	Mem[0000000010101408] = 00000000, %l0 = 7271fd8036906ba1
	ldsha	[%i4+%o4]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000010141400] = 000000ff4de40000, %f14 = a5d41c1d 9a41c1c7
	ldda	[%i5+%g0]0x88,%f14	! %f14 = 000000ff 4de40000
!	Mem[0000000010081430] = a1f49eb18d1e3315, %l7 = 00000000f2aa7756
	ldx	[%i2+0x030],%l7		! %l7 = a1f49eb18d1e3315
!	Starting 10 instruction Store Burst
!	%f20 = 444be5f3, Mem[0000000010181400] = fff40000
	sta	%f20,[%i6+%g0]0x88	! Mem[0000000010181400] = 444be5f3

p0_label_36:
!	%l0 = 00000000, %l1 = 0000d9ff, Mem[0000000030141410] = 3ee5dbff 56d7a6d3
	stda	%l0,[%i5+%o5]0x81	! Mem[0000000030141410] = 00000000 0000d9ff
!	Mem[000000001008143d] = 8670507d, %l3 = 0000000000005d5e
	ldstuba	[%i2+0x03d]%asi,%l3	! %l3 = 00000070000000ff
!	Mem[0000000030181410] = 5e5d8668, %l2 = 000000002373c496
	ldstuba	[%i6+%o5]0x89,%l2	! %l2 = 00000068000000ff
!	%l7 = a1f49eb18d1e3315, Mem[00000000100c1408] = 50a00528
	stha	%l7,[%i3+%o4]0x88	! Mem[00000000100c1408] = 50a03315
!	%l4 = 0000000036906ba1, immd = ffffffffffffffef, %l3 = 0000000000000070
	udivx	%l4,-0x011,%l3		! %l3 = 0000000000000000
!	Mem[0000000010141410] = 59144bac, %l2 = 0000000000000068
	ldstuba	[%i5+%o5]0x88,%l2	! %l2 = 000000ac000000ff
!	%l6 = e27e2b41, %l7 = 8d1e3315, Mem[0000000030081400] = f6000000 0000a177
	stda	%l6,[%i2+%g0]0x81	! Mem[0000000030081400] = e27e2b41 8d1e3315
!	%l2 = 00000000000000ac, imm = 0000000000000c92, %l5 = 0000000096c47323
	orn	%l2,0xc92,%l5		! %l5 = fffffffffffff3ed
!	%l7 = a1f49eb18d1e3315, Mem[0000000030181410] = ff865d5e5f880035
	stxa	%l7,[%i6+%o5]0x81	! Mem[0000000030181410] = a1f49eb18d1e3315
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = a16b9036, %l7 = a1f49eb18d1e3315
	lduha	[%i3+%o5]0x81,%l7	! %l7 = 000000000000a16b

p0_label_37:
!	Mem[0000000030181410] = b19ef4a1, %l7 = 000000000000a16b
	ldsha	[%i6+%o5]0x89,%l7	! %l7 = fffffffffffff4a1
!	Mem[0000000010081400] = 8a788196, %f8  = 775a5ef2
	lda	[%i2+%g0]0x88,%f8 	! %f8 = 8a788196
!	Mem[0000000030041410] = 00000000484d7c90, %l5 = fffffffffffff3ed
	ldxa	[%i1+%o5]0x81,%l5	! %l5 = 00000000484d7c90
!	Mem[0000000030081410] = 4de4a50700000000, %l6 = 00000000e27e2b41
	ldxa	[%i2+%o5]0x81,%l6	! %l6 = 4de4a50700000000
	membar	#Sync			! Added by membar checker (7)
!	Mem[0000000010081400] = 9681788a e44d0000 00000000 9a41c1c7
!	Mem[0000000010081410] = 00000033 fe7aab1e 01754022 5c537926
!	Mem[0000000010081420] = d4a89ab5 118b92db 417e3c83 18ae2b56
!	Mem[0000000010081430] = a1f49eb1 8d1e3315 74ffd1b4 86ff507d
	ldda	[%i2]ASI_BLK_PL,%f16	! Block Load from 0000000010081400
!	Mem[0000000030041408] = ac4b1459, %l4 = 0000000036906ba1
	ldsba	[%i1+%o4]0x89,%l4	! %l4 = 0000000000000059
!	Mem[0000000010181400] = 292637e1444be5f3, %f6  = b19ef4a1 eb41318b
	ldda	[%i6+%g0]0x88,%f6 	! %f6  = 292637e1 444be5f3
!	Mem[00000000300c1400] = a5000000, %l2 = 00000000000000ac
	ldsba	[%i3+%g0]0x81,%l2	! %l2 = ffffffffffffffa5
!	Mem[0000000010081424] = 118b92db, %l3 = 0000000000000000
	ldsb	[%i2+0x026],%l3		! %l3 = ffffffffffffff92
!	Starting 10 instruction Store Burst
!	Mem[0000000010181408] = 9a41c1c7, %l1 = 000000000000d9ff
	ldstuba	[%i6+%o4]0x88,%l1	! %l1 = 000000c7000000ff

p0_label_38:
	membar	#Sync			! Added by membar checker (8)
!	%l7 = fffffffffffff4a1, Mem[0000000010081419] = 01754022
	stb	%l7,[%i2+0x019]		! Mem[0000000010081418] = 01a14022
!	%l5 = 00000000484d7c90, Mem[00000000100c1434] = 01051319
	sth	%l5,[%i3+0x034]		! Mem[00000000100c1434] = 7c901319
!	%f2  = a5d41c1d 00000000, Mem[0000000030181408] = 444be53a 54000000
	stda	%f2 ,[%i6+%o4]0x81	! Mem[0000000030181408] = a5d41c1d 00000000
!	%f14 = 000000ff 4de40000, Mem[0000000030141410] = 00000000 ffd90000
	stda	%f14,[%i5+%o5]0x89	! Mem[0000000030141410] = 000000ff 4de40000
!	%l0 = 0000000000000000, Mem[0000000010141410] = 59144bff
	stha	%l0,[%i5+%o5]0x88	! Mem[0000000010141410] = 59140000
!	Mem[000000001018143c] = 9a41c1c7, %l0 = 0000000000000000
	swap	[%i6+0x03c],%l0		! %l0 = 000000009a41c1c7
!	Mem[0000000010101410] = 00000000, %l7 = fffffffffffff4a1
	swapa	[%i4+%o5]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000030141400] = 133dceb3, %l4 = 0000000000000059
	swapa	[%i5+%g0]0x81,%l4	! %l4 = 00000000133dceb3
!	Mem[00000000100c1400] = 19e5b62e, %l7 = 0000000000000000
	ldstuba	[%i3+%g0]0x80,%l7	! %l7 = 00000019000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = 0000000000004de4, %l3 = ffffffffffffff92
	ldxa	[%i4+%o4]0x80,%l3	! %l3 = 0000000000004de4

p0_label_39:
!	Mem[00000000100c1438] = 10ca031c, %f0  = 8b3141eb
	ld	[%i3+0x038],%f0 	! %f0 = 10ca031c
!	%l6 = 4de4a50700000000, imm = fffffffffffffb46, %l6 = 4de4a50700000000
	add	%l6,-0x4ba,%l6		! %l6 = 4de4a506fffffb46
!	Mem[00000000300c1400] = a50000001835ce8f, %f4  = 68865d5e 5f880035
	ldda	[%i3+%g0]0x81,%f4 	! %f4  = a5000000 1835ce8f
!	Mem[00000000201c0000] = ff1419af, %l7 = 0000000000000019
	ldub	[%o0+%g0],%l7		! %l7 = 00000000000000ff
!	Mem[000000001008143c] = 86ff507d, %l3 = 0000000000004de4
	ldsw	[%i2+0x03c],%l3		! %l3 = ffffffff86ff507d
!	%f28 = 15331e8d, %f15 = 4de40000
	fcmpes	%fcc1,%f28,%f15		! %fcc1 = 1
!	Mem[0000000030081400] = 412b7ee2, %l0 = 000000009a41c1c7
	lduba	[%i2+%g0]0x89,%l0	! %l0 = 00000000000000e2
!	Mem[0000000030181400] = e1372629, %l1 = 00000000000000c7
	lduba	[%i6+%g0]0x81,%l1	! %l1 = 00000000000000e1
!	%l4 = 00000000133dceb3, %l4 = 00000000133dceb3, %y  = 000004fb
	udiv	%l4,%l4,%l1		! %l1 = 0000000000004244
	mov	%l0,%y			! %y = 000000e2
!	Starting 10 instruction Store Burst
!	%f4  = a5000000, Mem[0000000010041400] = b19ef4ff
	sta	%f4 ,[%i1+%g0]0x88	! Mem[0000000010041400] = a5000000

p0_label_40:
!	%f13 = 00000000, Mem[0000000010181410] = 00004049
	sta	%f13,[%i6+%o5]0x88	! Mem[0000000010181410] = 00000000
!	%l6 = 4de4a506fffffb46, Mem[0000000010001400] = 14000000
	stba	%l6,[%i0+%g0]0x80	! Mem[0000000010001400] = 46000000
!	%f27 = 833c7e41, Mem[0000000030141410] = 4de40000
	sta	%f27,[%i5+%o5]0x89	! Mem[0000000030141410] = 833c7e41
!	%l0 = 00000000000000e2, Mem[0000000010001438] = 4deff6287bc773ad
	stx	%l0,[%i0+0x038]		! Mem[0000000010001438] = 00000000000000e2
!	%f14 = 000000ff 4de40000, Mem[0000000030001410] = 48000000 dc254e45
	stda	%f14,[%i0+%o5]0x81	! Mem[0000000030001410] = 000000ff 4de40000
!	%f22 = 2679535c 22407501, %l2 = ffffffffffffffa5
!	Mem[0000000010181420] = 775a5ef2434c69d4
	add	%i6,0x020,%g1
	stda	%f22,[%g1+%l2]ASI_PST32_P ! Mem[0000000010181420] = 775a5ef222407501
!	%l1 = 0000000000004244, Mem[0000000010081408] = 000000009a41c1c7
	stxa	%l1,[%i2+%o4]0x80	! Mem[0000000010081408] = 0000000000004244
!	Mem[0000000030181400] = e1372629, %l5 = 00000000484d7c90
	swapa	[%i6+%g0]0x81,%l5	! %l5 = 00000000e1372629
!	%l4 = 00000000133dceb3, %l0 = 00000000000000e2, %l7 = 00000000000000ff
	xor	%l4,%l0,%l7		! %l7 = 00000000133dce51
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = 6a7e51c5, %l2 = ffffffffffffffa5
	ldsba	[%i4+%g0]0x88,%l2	! %l2 = ffffffffffffffc5

p0_label_41:
!	Mem[0000000021800100] = f9e49c47, %l0 = 00000000000000e2
	ldub	[%o3+0x101],%l0		! %l0 = 00000000000000e4
!	Mem[0000000010181408] = 00000000 9a41c1ff, %l6 = fffffb46, %l7 = 133dce51
	ldda	[%i6+%o4]0x88,%l6	! %l6 = 000000009a41c1ff 0000000000000000
!	Mem[0000000030101400] = 0418b91c, %l3 = ffffffff86ff507d
	lduha	[%i4+%g0]0x89,%l3	! %l3 = 000000000000b91c
!	Mem[0000000010101428] = 8062c5e8, %l1 = 0000000000004244
	ldswa	[%i4+0x028]%asi,%l1	! %l1 = ffffffff8062c5e8
!	Mem[0000000030041400] = 2eb6e519f25e5a77, %l2 = ffffffffffffffc5
	ldxa	[%i1+%g0]0x81,%l2	! %l2 = 2eb6e519f25e5a77
!	Mem[00000000100c1410] = 000000ff3aab7db2, %f22 = 2679535c 22407501
	ldda	[%i3+%o5]0x80,%f22	! %f22 = 000000ff 3aab7db2
!	Mem[0000000010101408] = 00000000, %f27 = 833c7e41
	lda	[%i4+%o4]0x80,%f27	! %f27 = 00000000
!	Mem[0000000010141400] = 0000e44dff000000, %l7 = 0000000000000000
	ldx	[%i5+%g0],%l7		! %l7 = 0000e44dff000000
!	Mem[0000000010101400] = 444be5f36a7e51c5, %l3 = 000000000000b91c
	ldxa	[%i4+%g0]0x88,%l3	! %l3 = 444be5f36a7e51c5
!	Starting 10 instruction Store Burst
!	Mem[0000000030141410] = 833c7e41, %l0 = 00000000000000e4
	ldstuba	[%i5+%o5]0x89,%l0	! %l0 = 00000041000000ff

p0_label_42:
!	Mem[0000000010081408] = 00000000, %l5 = 00000000e1372629
	ldstuba	[%i2+%o4]0x80,%l5	! %l5 = 00000000000000ff
!	%l4 = 133dceb3, %l5 = 00000000, Mem[0000000010181438] = a5d41c1d 00000000
	std	%l4,[%i6+0x038]		! Mem[0000000010181438] = 133dceb3 00000000
!	%f22 = 000000ff 3aab7db2, Mem[0000000030141408] = 0000bd63 3c20ef0a
	stda	%f22,[%i5+%o4]0x81	! Mem[0000000030141408] = 000000ff 3aab7db2
!	%f12 = 00000084 00000000, %l4 = 00000000133dceb3
!	Mem[0000000010041420] = ab924c13940a9807
	add	%i1,0x020,%g1
	stda	%f12,[%g1+%l4]ASI_PST16_PL ! Mem[0000000010041420] = 00000000940a9807
!	%l3 = 444be5f36a7e51c5, Mem[0000000010081408] = ff000000
	stwa	%l3,[%i2+%o4]0x80	! Mem[0000000010081408] = 6a7e51c5
!	%f10 = b1d41c1d, %f23 = 3aab7db2, %f16 = 00004de4
	fadds	%f10,%f23,%f16		! %f16 = 3aab7d7d
!	Code Fragment 3
p0_fragment_3:
!	%l0 = 0000000000000041
	setx	0x8aa9715006b77933,%g7,%l0 ! %l0 = 8aa9715006b77933
!	%l1 = ffffffff8062c5e8
	setx	0x2a4287279f920d60,%g7,%l1 ! %l1 = 2a4287279f920d60
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 8aa9715006b77933
	setx	0x331a872fb30d5ea4,%g7,%l0 ! %l0 = 331a872fb30d5ea4
!	%l1 = 2a4287279f920d60
	setx	0xf435d13066067238,%g7,%l1 ! %l1 = f435d13066067238
!	%f30 = 7d50ff86 b4d1ff74, Mem[0000000030181408] = a5d41c1d 00000000
	stda	%f30,[%i6+%o4]0x81	! Mem[0000000030181408] = 7d50ff86 b4d1ff74
!	Mem[0000000030101410] = 36906ba1, %l0 = 331a872fb30d5ea4
	swapa	[%i4+%o5]0x89,%l0	! %l0 = 0000000036906ba1
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = b27dab3aff000000, %f16 = 3aab7d7d 8a788196
	ldda	[%i3+%o5]0x88,%f16	! %f16 = b27dab3a ff000000

p0_label_43:
!	%l1 = f435d13066067238, imm = fffffffffffff098, %l3 = 444be5f36a7e51c5
	sub	%l1,-0xf68,%l3		! %l3 = f435d130660681a0
!	Mem[000000001014142c] = 00004988, %l6 = 000000009a41c1ff
	ldsw	[%i5+0x02c],%l6		! %l6 = 0000000000004988
!	Mem[0000000030141400] = 59000000, %l3 = f435d130660681a0
	lduba	[%i5+%g0]0x89,%l3	! %l3 = 0000000000000000
!	Mem[00000000100c1410] = 000000ff3aab7db2, %l6 = 0000000000004988
	ldxa	[%i3+%o5]0x80,%l6	! %l6 = 000000ff3aab7db2
!	Mem[0000000030141410] = ff7e3c83, %l2 = 2eb6e519f25e5a77
	lduba	[%i5+%o5]0x81,%l2	! %l2 = 00000000000000ff
!	Mem[000000001018141c] = 2373ff96, %l6 = 000000ff3aab7db2
	ldsba	[%i6+0x01f]%asi,%l6	! %l6 = ffffffffffffff96
!	Mem[00000000300c1410] = a16b9036, %l5 = 0000000000000000
	ldswa	[%i3+%o5]0x81,%l5	! %l5 = ffffffffa16b9036
!	Mem[0000000030001408] = 13700100 eb41318b, %l6 = ffffff96, %l7 = ff000000
	ldda	[%i0+%o4]0x81,%l6	! %l6 = 0000000013700100 00000000eb41318b
!	Mem[0000000030081410] = 07a5e44d, %l5 = ffffffffa16b9036
	lduwa	[%i2+%o5]0x89,%l5	! %l5 = 0000000007a5e44d
!	Starting 10 instruction Store Burst
!	%l1 = f435d13066067238, Mem[0000000030081410] = 0000000007a5e44d
	stxa	%l1,[%i2+%o5]0x89	! Mem[0000000030081410] = f435d13066067238

p0_label_44:
!	Mem[0000000021800040] = 110e4385, %l5 = 0000000007a5e44d
	ldstub	[%o3+0x040],%l5		! %l5 = 00000011000000ff
!	%f16 = b27dab3a, Mem[0000000010081428] = 417e3c83
	sta	%f16,[%i2+0x028]%asi	! Mem[0000000010081428] = b27dab3a
!	%l5 = 0000000000000011, Mem[0000000010181410] = 00000000
	stwa	%l5,[%i6+%o5]0x88	! Mem[0000000010181410] = 00000011
!	%l3 = 0000000000000000, Mem[00000000100c1410] = ff000000
	stwa	%l3,[%i3+%o5]0x88	! Mem[00000000100c1410] = 00000000
!	%l2 = 00000000000000ff, Mem[0000000010101410] = a1f4ffff47c6b2b0, %asi = 80
	stxa	%l2,[%i4+0x010]%asi	! Mem[0000000010101410] = 00000000000000ff
!	Mem[0000000030041408] = ac4b1459, %l2 = 00000000000000ff
	ldstuba	[%i1+%o4]0x89,%l2	! %l2 = 00000059000000ff
!	Mem[0000000010041432] = 00005914, %l1 = f435d13066067238
	ldstuba	[%i1+0x032]%asi,%l1	! %l1 = 00000059000000ff
!	%f25 = b59aa8d4, Mem[0000000030001410] = ff000000
	sta	%f25,[%i0+%o5]0x89	! Mem[0000000030001410] = b59aa8d4
!	%l6 = 13700100, %l7 = eb41318b, Mem[0000000010081408] = 6a7e51c5 00004244
	std	%l6,[%i2+%o4]		! Mem[0000000010081408] = 13700100 eb41318b
!	Starting 10 instruction Load Burst
!	Mem[0000000030181410] = b19ef4a1, %f16 = b27dab3a
	lda	[%i6+%o5]0x89,%f16	! %f16 = b19ef4a1

p0_label_45:
	membar	#Sync			! Added by membar checker (9)
!	Mem[0000000030181400] = 484d7c90 e1372629 7d50ff86 b4d1ff74
!	Mem[0000000030181410] = a1f49eb1 8d1e3315 b19ef4a1 eb41318b
!	Mem[0000000030181420] = 775a5ef2 19e5b62e b1d41c1d 9a41c1c7
!	Mem[0000000030181430] = 4049c358 fea97ab2 a5d41c1d 9a41c1c7
	ldda	[%i6]ASI_BLK_AIUS,%f16	! Block Load from 0000000030181400
!	Mem[0000000010081400] = 8a788196, %l0 = 0000000036906ba1
	ldsba	[%i2+%g0]0x88,%l0	! %l0 = ffffffffffffff96
!	Mem[0000000030101400] = 0418b91c, %f8  = 8a788196
	lda	[%i4+%g0]0x89,%f8 	! %f8 = 0418b91c
!	Mem[0000000020800000] = ff3317e8, %l0 = ffffffffffffff96
	ldsba	[%o1+0x001]%asi,%l0	! %l0 = 0000000000000033
!	Mem[00000000211c0000] = d9ff980d, %l7 = 00000000eb41318b
	ldsha	[%o2+0x000]%asi,%l7	! %l7 = ffffffffffffd9ff
!	Mem[00000000100c1408] = 1533a050, %l3 = 0000000000000000
	lduba	[%i3+0x00b]%asi,%l3	! %l3 = 0000000000000050
!	Mem[0000000010141400] = 0000e44d ff000000, %l2 = 00000059, %l3 = 00000050
	ldda	[%i5+%g0]0x80,%l2	! %l2 = 000000000000e44d 00000000ff000000
!	Mem[00000000100c1400] = 2eb6e5ff, %l3 = 00000000ff000000
	lduwa	[%i3+%g0]0x88,%l3	! %l3 = 000000002eb6e5ff
!	Mem[0000000030041408] = ac4b14ff, %l1 = 0000000000000059
	lduha	[%i1+%o4]0x89,%l1	! %l1 = 00000000000014ff
!	Starting 10 instruction Store Burst
!	%l0 = 00000033, %l1 = 000014ff, Mem[0000000010141400] = 0000e44d ff000000
	stda	%l0,[%i5+%g0]0x80	! Mem[0000000010141400] = 00000033 000014ff

p0_label_46:
!	Mem[0000000010101408] = 00000000, %l4 = 00000000133dceb3
	swapa	[%i4+%o4]0x80,%l4	! %l4 = 0000000000000000
!	%l7 = ffffffffffffd9ff, Mem[0000000030101400] = c8f5be630418b91c
	stxa	%l7,[%i4+%g0]0x89	! Mem[0000000030101400] = ffffffffffffd9ff
!	%l0 = 00000033, %l1 = 000014ff, Mem[0000000010041418] = 6ce32346 38bcbdbe
	std	%l0,[%i1+0x018]		! Mem[0000000010041418] = 00000033 000014ff
!	Mem[0000000030141410] = ff7e3c83, %l7 = ffffffffffffd9ff
	swapa	[%i5+%o5]0x81,%l7	! %l7 = 00000000ff7e3c83
!	%f8  = 0418b91c 19e5b62e, Mem[0000000010181428] = 00000000 3b3a6b3f
	stda	%f8 ,[%i6+0x028]%asi	! Mem[0000000010181428] = 0418b91c 19e5b62e
!	%l3 = 000000002eb6e5ff, Mem[0000000010141408] = 9a41c1c700000000
	stxa	%l3,[%i5+%o4]0x80	! Mem[0000000010141408] = 000000002eb6e5ff
!	%l0 = 0000000000000033, imm = 0000000000000e42, %l1 = 00000000000014ff
	xnor	%l0,0xe42,%l1		! %l1 = fffffffffffff18e
	membar	#Sync			! Added by membar checker (10)
!	%f7  = 444be5f3, Mem[0000000030181410] = a1f49eb1
	sta	%f7 ,[%i6+%o5]0x81	! Mem[0000000030181410] = 444be5f3
!	Mem[0000000030081410] = 66067238, %l0 = 0000000000000033
	ldstuba	[%i2+%o5]0x89,%l0	! %l0 = 00000038000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = 59140000, %l5 = 0000000000000011
	ldswa	[%i5+%o5]0x88,%l5	! %l5 = 0000000059140000

p0_label_47:
!	Mem[00000000201c0000] = ff1419af, %l4 = 0000000000000000
	ldsb	[%o0+%g0],%l4		! %l4 = ffffffffffffffff
!	Mem[00000000300c1408] = 10ca031c0700407a, %f14 = 000000ff 4de40000
	ldda	[%i3+%o4]0x81,%f14	! %f14 = 10ca031c 0700407a
!	Mem[00000000100c1420] = af83e48b, %l3 = 000000002eb6e5ff
	ldswa	[%i3+0x020]%asi,%l3	! %l3 = ffffffffaf83e48b
!	Mem[0000000030101410] = b30d5ea4, %l1 = fffffffffffff18e
	ldswa	[%i4+%o5]0x89,%l1	! %l1 = ffffffffb30d5ea4
!	Mem[0000000030001400] = 68865d5e 5f880035 13700100 eb41318b
!	Mem[0000000030001410] = d4a89ab5 4de40000 f7ac8d7d 76b6b320
!	Mem[0000000030001420] = 657a3cc5 2ad2fe98 1cb9dbc6 a9f90035
!	Mem[0000000030001430] = d211b849 32af21d4 4ad61294 35f51fc5
	ldda	[%i0]ASI_BLK_SL,%f16	! Block Load from 0000000030001400
!	Mem[0000000030181410] = 444be5f3 8d1e3315, %l0 = 00000038, %l1 = b30d5ea4
	ldda	[%i6+%o5]0x81,%l0	! %l0 = 00000000444be5f3 000000008d1e3315
!	%l6 = 0000000013700100, %l5 = 0000000059140000, %l0  = 00000000444be5f3
	mulx	%l6,%l5,%l0		! %l0 = 06c3751914000000
!	Mem[0000000010181408] = ffc1419a, %l6 = 0000000013700100
	ldsha	[%i6+%o4]0x80,%l6	! %l6 = ffffffffffffffc1
!	Mem[0000000010141400] = 00000033000014ff, %l2 = 000000000000e44d
	ldxa	[%i5+%g0]0x80,%l2	! %l2 = 00000033000014ff
!	Starting 10 instruction Store Burst
!	%f10 = b1d41c1d 9a41c1c7, Mem[0000000010081408] = 13700100 eb41318b
	stda	%f10,[%i2+%o4]0x80	! Mem[0000000010081408] = b1d41c1d 9a41c1c7

p0_label_48:
!	%l6 = ffffffffffffffc1, Mem[0000000010181408] = ffc1419a
	stwa	%l6,[%i6+%o4]0x80	! Mem[0000000010181408] = ffffffc1
!	%l6 = ffffffffffffffc1, Mem[0000000010081420] = d4a89ab5, %asi = 80
	stwa	%l6,[%i2+0x020]%asi	! Mem[0000000010081420] = ffffffc1
!	%l1 = 000000008d1e3315, Mem[00000000300c1408] = 1c03ca10
	stba	%l1,[%i3+%o4]0x89	! Mem[00000000300c1408] = 1c03ca15
!	%f0  = 10ca031c 00017013 a5d41c1d 00000000
!	%f4  = a5000000 1835ce8f 292637e1 444be5f3
!	%f8  = 0418b91c 19e5b62e b1d41c1d 9a41c1c7
!	%f12 = 00000084 00000000 10ca031c 0700407a
	stda	%f0,[%i4]ASI_BLK_AIUP	! Block Store to 0000000010101400
!	%l3 = ffffffffaf83e48b, Mem[0000000020800040] = 06ff226c, %asi = 80
	stha	%l3,[%o1+0x040]%asi	! Mem[0000000020800040] = e48b226c
!	%f16 = 3500885f 5e5d8668, Mem[0000000030081410] = 660672ff f435d130
	stda	%f16,[%i2+%o5]0x89	! Mem[0000000030081410] = 3500885f 5e5d8668
!	%l0 = 06c3751914000000, Mem[00000000100c1410] = 00000000
	stha	%l0,[%i3+%o5]0x88	! Mem[00000000100c1410] = 00000000
!	%f26 = 3500f9a9 c6dbb91c, Mem[0000000010181400] = 444be5f3 292637e1
	stda	%f26,[%i6+%g0]0x88	! Mem[0000000010181400] = 3500f9a9 c6dbb91c
!	%l4 = ffffffff, %l5 = 59140000, Mem[0000000010041408] = ffffffff aa9ebb80
	stda	%l4,[%i1+%o4]0x80	! Mem[0000000010041408] = ffffffff 59140000
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = 00000033, %l4 = ffffffffffffffff
	lduwa	[%i5+0x000]%asi,%l4	! %l4 = 0000000000000033

p0_label_49:
!	Mem[0000000030181400] = 484d7c90, %l4 = 0000000000000033
	lduba	[%i6+%g0]0x81,%l4	! %l4 = 0000000000000048
!	Mem[0000000021800140] = 30ff94e3, %l2 = 00000033000014ff
	ldsba	[%o3+0x140]%asi,%l2	! %l2 = 0000000000000030
!	Mem[0000000021800180] = e8f2ad00, %l5 = 0000000059140000
	ldsha	[%o3+0x180]%asi,%l5	! %l5 = ffffffffffffe8f2
!	Mem[0000000010181410] = 00000011, %f26 = 3500f9a9
	lda	[%i6+%o5]0x88,%f26	! %f26 = 00000011
!	Mem[0000000010181424] = 22407501, %l5 = ffffffffffffe8f2
	ldsha	[%i6+0x024]%asi,%l5	! %l5 = 0000000000002240
!	Mem[0000000010081408] = 1d1cd4b1, %l5 = 0000000000002240
	ldswa	[%i2+%o4]0x88,%l5	! %l5 = 000000001d1cd4b1
!	Mem[0000000010181400] = 1cb9dbc6, %l2 = 0000000000000030
	ldsba	[%i6+%g0]0x80,%l2	! %l2 = 000000000000001c
!	Mem[0000000030041408] = ac4b14ff, %l7 = 00000000ff7e3c83
	lduba	[%i1+%o4]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010001400] = 00000046, %l0 = 06c3751914000000
	ldsba	[%i0+%g0]0x88,%l0	! %l0 = 0000000000000046
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000000048, Mem[0000000030181410] = 444be5f3
	stwa	%l4,[%i6+%o5]0x81	! Mem[0000000030181410] = 00000048

p0_label_50:
!	Mem[000000001014140d] = 2eb6e5ff, %l2 = 000000000000001c
	ldstuba	[%i5+0x00d]%asi,%l2	! %l2 = 000000b6000000ff
!	%l6 = ffffffffffffffc1, Mem[0000000020800000] = ff3317e8, %asi = 80
	stha	%l6,[%o1+0x000]%asi	! Mem[0000000020800000] = ffc117e8
!	%f22 = 20b3b676 7d8dacf7, Mem[0000000030141400] = 59000000 5e55c12f
	stda	%f22,[%i5+%g0]0x89	! Mem[0000000030141400] = 20b3b676 7d8dacf7
!	%l2 = 000000b6, %l3 = af83e48b, Mem[0000000010081420] = ffffffc1 118b92db
	stda	%l2,[%i2+0x020]%asi	! Mem[0000000010081420] = 000000b6 af83e48b
!	%l3 = ffffffffaf83e48b, imm = fffffffffffff41a, %l3 = ffffffffaf83e48b
	addc	%l3,-0xbe6,%l3		! %l3 = ffffffffaf83d8a5
!	Mem[00000000100c1400] = ffe5b62e, %l1 = 000000008d1e3315
	swapa	[%i3+%g0]0x80,%l1	! %l1 = 00000000ffe5b62e
	membar	#Sync			! Added by membar checker (11)
!	%l3 = ffffffffaf83d8a5, Mem[0000000030001400] = 68865d5e
	stwa	%l3,[%i0+%g0]0x81	! Mem[0000000030001400] = af83d8a5
!	%l6 = ffffffc1, %l7 = 000000ff, Mem[0000000010141400] = 33000000 ff140000
	stda	%l6,[%i5+%g0]0x88	! Mem[0000000010141400] = ffffffc1 000000ff
!	%l1 = 00000000ffe5b62e, Mem[00000000100c140c] = a03f5a8f
	sth	%l1,[%i3+0x00c]		! Mem[00000000100c140c] = b62e5a8f
!	Starting 10 instruction Load Burst
!	Mem[0000000010181430] = 4049c358fea97ab2, %f6  = 292637e1 444be5f3
	ldda	[%i6+0x030]%asi,%f6 	! %f6  = 4049c358 fea97ab2

p0_label_51:
!	Mem[0000000010141408] = 00000000, %f7  = fea97ab2
	lda	[%i5+%o4]0x88,%f7 	! %f7 = 00000000
!	Mem[0000000010101410] = a5000000, %l3 = ffffffffaf83d8a5
	ldsha	[%i4+%o5]0x80,%l3	! %l3 = ffffffffffffa500
!	Mem[0000000030041400] = 19e5b62e, %l7 = 00000000000000ff
	ldsba	[%i1+%g0]0x89,%l7	! %l7 = 000000000000002e
!	Mem[0000000030041410] = 00000000, %l5 = 000000001d1cd4b1
	lduba	[%i1+%o5]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000010181410] = 11000000, %l0 = 0000000000000046
	lduwa	[%i6+%o5]0x80,%l0	! %l0 = 0000000011000000
!	Mem[0000000030181400] = 907c4d48, %l0 = 0000000011000000
	lduha	[%i6+%g0]0x89,%l0	! %l0 = 0000000000004d48
!	Mem[0000000030101408] = 00000084, %l3 = ffffffffffffa500
	lduha	[%i4+%o4]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000010001408] = ffdbe53e6a81788a, %f2  = a5d41c1d 00000000
	ldda	[%i0+0x008]%asi,%f2 	! %f2  = ffdbe53e 6a81788a
!	Mem[0000000010041400] = a5000000, %l3 = 0000000000000000
	lduba	[%i1+%g0]0x88,%l3	! %l3 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030081408] = 96c47323, %l1 = 00000000ffe5b62e
	swapa	[%i2+%o4]0x81,%l1	! %l1 = 0000000096c47323

p0_label_52:
!	%f14 = 10ca031c 0700407a, %l3 = 0000000000000000
!	Mem[00000000300c1408] = 15ca031c0700407a
	add	%i3,0x008,%g1
	stda	%f14,[%g1+%l3]ASI_PST32_S ! Mem[00000000300c1408] = 15ca031c0700407a
!	%l2 = 00000000000000b6, Mem[0000000021800140] = 30ff94e3
	stb	%l2,[%o3+0x140]		! Mem[0000000021800140] = b6ff94e3
!	%l5 = 0000000000000000, Mem[0000000010181410] = 00000011
	stba	%l5,[%i6+%o5]0x88	! Mem[0000000010181410] = 00000000
!	Mem[0000000030001408] = 00017013, %l4 = 0000000000000048
	ldstuba	[%i0+%o4]0x89,%l4	! %l4 = 00000013000000ff
!	%l0 = 0000000000004d48, Mem[0000000010181408] = ffffffc100000000, %asi = 80
	stxa	%l0,[%i6+0x008]%asi	! Mem[0000000010181408] = 0000000000004d48
!	%l5 = 0000000000000000, Mem[0000000030001408] = ff700100
	stha	%l5,[%i0+%o4]0x81	! Mem[0000000030001408] = 00000100
!	%f30 = c51ff535, Mem[0000000010001400] = 46000000
	sta	%f30,[%i0+%g0]0x80	! Mem[0000000010001400] = c51ff535
!	Mem[0000000010101410] = a5000000, %l3 = 0000000000000000
	ldstuba	[%i4+%o5]0x80,%l3	! %l3 = 000000a5000000ff
!	%l2 = 000000b6, %l3 = 000000a5, Mem[0000000010081408] = 1d1cd4b1 c7c1419a
	stda	%l2,[%i2+%o4]0x88	! Mem[0000000010081408] = 000000b6 000000a5
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = 00000000, %l5 = 0000000000000000
	ldswa	[%i1+%o5]0x81,%l5	! %l5 = 0000000000000000

p0_label_53:
!	Mem[0000000030181410] = 00000048, %l5 = 0000000000000000
	ldswa	[%i6+%o5]0x81,%l5	! %l5 = 0000000000000048
!	Mem[0000000020800040] = e48b226c, %l5 = 0000000000000048
	lduha	[%o1+0x040]%asi,%l5	! %l5 = 000000000000e48b
!	Mem[0000000010001410] = 5e5d866894e9ad49, %l7 = 000000000000002e
	ldx	[%i0+%o5],%l7		! %l7 = 5e5d866894e9ad49
!	Mem[00000000211c0000] = d9ff980d, %l6 = ffffffffffffffc1
	lduh	[%o2+%g0],%l6		! %l6 = 000000000000d9ff
!	Mem[0000000010181408] = 00000000, %f9  = 19e5b62e
	lda	[%i6+%o4]0x88,%f9 	! %f9 = 00000000
!	Mem[0000000010101410] = ff000000, %l7 = 5e5d866894e9ad49
	ldsha	[%i4+%o5]0x80,%l7	! %l7 = ffffffffffffff00
!	Mem[0000000010081408] = 000000b6, %l4 = 0000000000000013
	lduha	[%i2+%o4]0x88,%l4	! %l4 = 00000000000000b6
!	Mem[0000000010181410] = 3500885f00000000, %l0 = 0000000000004d48
	ldxa	[%i6+%o5]0x88,%l0	! %l0 = 3500885f00000000
!	Mem[0000000030141410] = ffd9ffff, %l6 = 000000000000d9ff
	ldswa	[%i5+%o5]0x89,%l6	! %l6 = ffffffffffd9ffff
!	Starting 10 instruction Store Burst
!	Mem[0000000010001433] = 22110106, %l4 = 00000000000000b6
	ldstuba	[%i0+0x033]%asi,%l4	! %l4 = 00000006000000ff

p0_label_54:
!	%l0 = 3500885f00000000, Mem[0000000010101400] = 10ca031c
	stwa	%l0,[%i4+%g0]0x80	! Mem[0000000010101400] = 00000000
!	%l6 = ffffffffffd9ffff, Mem[0000000030041400] = 2eb6e519
	stha	%l6,[%i1+%g0]0x81	! Mem[0000000030041400] = ffffe519
!	%l5 = 000000000000e48b, %l7 = ffffffffffffff00, %l6 = ffffffffffd9ffff
	or	%l5,%l7,%l6		! %l6 = ffffffffffffff8b
!	%f27 = c6dbb91c, Mem[0000000030141400] = 7d8dacf7
	sta	%f27,[%i5+%g0]0x89	! Mem[0000000030141400] = c6dbb91c
!	%f10 = b1d41c1d 9a41c1c7, Mem[00000000100c1400] = 8d1e3315 f04f903a
	stda	%f10,[%i3+%g0]0x80	! Mem[00000000100c1400] = b1d41c1d 9a41c1c7
!	%l3 = 00000000000000a5, Mem[0000000030081410] = 3500885f5e5d8668
	stxa	%l3,[%i2+%o5]0x89	! Mem[0000000030081410] = 00000000000000a5
!	%l0 = 3500885f00000000, Mem[0000000010181400] = 1cb9dbc6a9f90035
	stxa	%l0,[%i6+%g0]0x80	! Mem[0000000010181400] = 3500885f00000000
!	%f10 = b1d41c1d 9a41c1c7, Mem[0000000030001408] = 00000100 eb41318b
	stda	%f10,[%i0+%o4]0x81	! Mem[0000000030001408] = b1d41c1d 9a41c1c7
!	%l3 = 00000000000000a5, Mem[00000000100c1408] = 50a03315
	stha	%l3,[%i3+%o4]0x88	! Mem[00000000100c1408] = 50a000a5
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = 1d1cd4a5, %l4 = 0000000000000006
	ldsha	[%i4+%o4]0x88,%l4	! %l4 = ffffffffffffd4a5

p0_label_55:
!	Mem[00000000300c1410] = a16b9036, %l1 = 0000000096c47323
	lduwa	[%i3+%o5]0x81,%l1	! %l1 = 00000000a16b9036
!	Mem[0000000010081434] = 8d1e3315, %l4 = ffffffffffffd4a5
	ldsha	[%i2+0x034]%asi,%l4	! %l4 = ffffffffffff8d1e
!	Mem[0000000010001408] = ffdbe53e6a81788a, %f6  = 4049c358 00000000
	ldd	[%i0+%o4],%f6 		! %f6  = ffdbe53e 6a81788a
!	Mem[0000000030141400] = 1cb9dbc6, %l2 = 00000000000000b6
	ldswa	[%i5+%g0]0x81,%l2	! %l2 = 000000001cb9dbc6
!	Code Fragment 4
p0_fragment_4:
!	%l0 = 3500885f00000000
	setx	0x21f5e4e7fc87821f,%g7,%l0 ! %l0 = 21f5e4e7fc87821f
!	%l1 = 00000000a16b9036
	setx	0x44974d178b6b05e3,%g7,%l1 ! %l1 = 44974d178b6b05e3
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 21f5e4e7fc87821f
	setx	0xf8091fafd771338e,%g7,%l0 ! %l0 = f8091fafd771338e
!	%l1 = 44974d178b6b05e3
	setx	0xb6c613f822693e43,%g7,%l1 ! %l1 = b6c613f822693e43
!	Mem[0000000030141410] = ffd9ffff, %l2 = 000000001cb9dbc6
	lduwa	[%i5+%o5]0x89,%l2	! %l2 = 00000000ffd9ffff
!	Mem[0000000010041438] = 0700407a, %l5 = 000000000000e48b
	lduwa	[%i1+0x038]%asi,%l5	! %l5 = 000000000700407a
!	Mem[0000000030101408] = 00000084 00000000, %l6 = ffffff8b, %l7 = ffffff00
	ldda	[%i4+%o4]0x81,%l6	! %l6 = 0000000000000084 0000000000000000
!	Mem[0000000010041408] = ffffffff, %l4 = ffffffffffff8d1e
	lduba	[%i1+%o4]0x80,%l4	! %l4 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l5 = 000000000700407a, Mem[0000000010041410] = 29260000
	stha	%l5,[%i1+%o5]0x88	! Mem[0000000010041410] = 2926407a

p0_label_56:
!	%f12 = 00000084 00000000, %l6 = 0000000000000084
!	Mem[00000000100c1420] = af83e48b02283563
	add	%i3,0x020,%g1
	stda	%f12,[%g1+%l6]ASI_PST32_P ! Mem[00000000100c1420] = af83e48b02283563
!	%l2 = 00000000ffd9ffff, Mem[00000000201c0000] = ff1419af
	sth	%l2,[%o0+%g0]		! Mem[00000000201c0000] = ffff19af
!	%l0 = f8091fafd771338e, Mem[0000000010041410] = 29261e6e2926407a
	stxa	%l0,[%i1+%o5]0x88	! Mem[0000000010041410] = f8091fafd771338e
!	%l5 = 000000000700407a, Mem[0000000010001400] = c51ff535
	stwa	%l5,[%i0+%g0]0x80	! Mem[0000000010001400] = 0700407a
!	%l3 = 00000000000000a5, Mem[0000000030001410] = d4a89ab5
	stha	%l3,[%i0+%o5]0x81	! Mem[0000000030001410] = 00a59ab5
!	%l3 = 00000000000000a5, Mem[00000000300c1400] = a50000001835ce8f
	stxa	%l3,[%i3+%g0]0x81	! Mem[00000000300c1400] = 00000000000000a5
!	%l5 = 000000000700407a, Mem[0000000030081408] = 2eb6e5ff
	stwa	%l5,[%i2+%o4]0x89	! Mem[0000000030081408] = 0700407a
!	%l5 = 000000000700407a, Mem[0000000010081410] = 00000033fe7aab1e
	stxa	%l5,[%i2+%o5]0x80	! Mem[0000000010081410] = 000000000700407a
!	%f31 = 9412d64a, %f10 = b1d41c1d, %f5  = 1835ce8f
	fadds	%f31,%f10,%f5 		! %f5  = b1d41c1d
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = b59aa500, %l5 = 000000000700407a
	lduwa	[%i0+%o5]0x89,%l5	! %l5 = 00000000b59aa500

p0_label_57:
!	Mem[0000000010081408] = b6000000a5000000, %f24 = 98fed22a c53c7a65
	ldda	[%i2+%o4]0x80,%f24	! %f24 = b6000000 a5000000
!	Mem[0000000010081400] = 8a788196, %l2 = 00000000ffd9ffff
	ldsba	[%i2+%g0]0x88,%l2	! %l2 = ffffffffffffff96
!	Mem[0000000010181408] = 00000000, %l7 = 0000000000000000
	ldsha	[%i6+%o4]0x88,%l7	! %l7 = 0000000000000000
	membar	#Sync			! Added by membar checker (12)
!	Mem[0000000030141400] = 1cb9dbc6 76b6b320 000000ff 3aab7db2
!	Mem[0000000030141410] = ffffd9ff ff000000 ecc80273 9f4d9aba
!	Mem[0000000030141420] = 1717b366 380a1d7e 7a7acd55 fa443e8a
!	Mem[0000000030141430] = 55ac23f7 eecdc1db 5a8161f8 b478b4b3
	ldda	[%i5]ASI_BLK_AIUS,%f0	! Block Load from 0000000030141400
!	Mem[0000000010041408] = ffffffff, %f19 = 00017013
	lda	[%i1+0x008]%asi,%f19	! %f19 = ffffffff
!	Mem[0000000010101434] = 00000000, %l2 = ffffffffffffff96
	lduwa	[%i4+0x034]%asi,%l2	! %l2 = 0000000000000000
!	Mem[0000000010181410] = 000000005f880035, %l0 = f8091fafd771338e
	ldxa	[%i6+%o5]0x80,%l0	! %l0 = 000000005f880035
!	Mem[0000000030141410] = ffd9ffff, %l6 = 0000000000000084
	ldsha	[%i5+%o5]0x89,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010001438] = 00000000, %l0 = 000000005f880035
	lduba	[%i0+0x039]%asi,%l0	! %l0 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030001400] = af83d8a5, %l0 = 0000000000000000
	swapa	[%i0+%g0]0x81,%l0	! %l0 = 00000000af83d8a5

p0_label_58:
!	%f25 = a5000000, Mem[00000000300c1410] = 36906ba1
	sta	%f25,[%i3+%o5]0x89	! Mem[00000000300c1410] = a5000000
!	%l2 = 0000000000000000, Mem[0000000010041430] = 0000ff1402283563, %asi = 80
	stxa	%l2,[%i1+0x030]%asi	! Mem[0000000010041430] = 0000000000000000
!	Mem[000000001004143f] = ff000000, %l1 = b6c613f822693e43
	ldstuba	[%i1+0x03f]%asi,%l1	! %l1 = 00000000000000ff
!	%f24 = b6000000 a5000000, %l0 = 00000000af83d8a5
!	Mem[0000000010181438] = 133dceb300000000
	add	%i6,0x038,%g1
	stda	%f24,[%g1+%l0]ASI_PST8_PL ! Mem[0000000010181438] = 003d00b3000000b6
!	Mem[0000000010041434] = 00000000, %l4 = 00000000000000ff
	ldstub	[%i1+0x034],%l4		! %l4 = 00000000000000ff
!	%f20 = 0000e44d b59aa8d4, Mem[0000000010081430] = a1f49eb1 8d1e3315
	std	%f20,[%i2+0x030]	! Mem[0000000010081430] = 0000e44d b59aa8d4
!	%l6 = ffffffffffffffff, Mem[0000000010101400] = 00000000
	stha	%l6,[%i4+%g0]0x88	! Mem[0000000010101400] = 0000ffff
	membar	#Sync			! Added by membar checker (13)
!	%l3 = 00000000000000a5, Mem[0000000030141410] = 000000ffffd9ffff
	stxa	%l3,[%i5+%o5]0x89	! Mem[0000000030141410] = 00000000000000a5
!	Mem[0000000010141420] = fbc755fb16ea1aa4, %l0 = 00000000af83d8a5, %l0 = 00000000af83d8a5
	add	%i5,0x20,%g1
	casxa	[%g1]0x80,%l0,%l0	! %l0 = fbc755fb16ea1aa4
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = 00000000, %l5 = 00000000b59aa500
	ldsba	[%i6+%o4]0x80,%l5	! %l5 = 0000000000000000

p0_label_59:
!	Mem[0000000010001400] = 0700407a, %l0 = fbc755fb16ea1aa4
	ldsba	[%i0+%g0]0x80,%l0	! %l0 = 0000000000000007
!	Mem[0000000010001428] = d637d3f7, %l5 = 0000000000000000
	lduha	[%i0+0x028]%asi,%l5	! %l5 = 000000000000d637
!	Mem[0000000010081410] = 7a400007 00000000, %l2 = 00000000, %l3 = 000000a5
	ldda	[%i2+%o5]0x88,%l2	! %l2 = 0000000000000000 000000007a400007
!	Mem[0000000010081400] = 9681788a, %l7 = 0000000000000000
	ldsba	[%i2+%g0]0x80,%l7	! %l7 = ffffffffffffff96
!	Mem[0000000030081408] = 5d6620490700407a, %l2 = 0000000000000000
	ldxa	[%i2+%o4]0x89,%l2	! %l2 = 5d6620490700407a
!	Mem[0000000010141400] = c1ffffff, %l4 = 0000000000000000
	lduba	[%i5+%g0]0x80,%l4	! %l4 = 00000000000000c1
!	Mem[0000000030041408] = f9b62acfac4b14ff, %f12 = 55ac23f7 eecdc1db
	ldda	[%i1+%o4]0x89,%f12	! %f12 = f9b62acf ac4b14ff
!	Mem[0000000010041400] = 000000a5, %l5 = 000000000000d637
	ldsh	[%i1+%g0],%l5		! %l5 = 0000000000000000
!	Mem[0000000010181408] = 00000000, %l3 = 000000007a400007
	lduba	[%i6+%o4]0x80,%l3	! %l3 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[000000001014141c] = 88f9d8ff, %l2 = 5d6620490700407a
	ldstub	[%i5+0x01c],%l2		! %l2 = 00000088000000ff

p0_label_60:
!	Mem[0000000030181400] = 484d7c90, %l3 = 0000000000000000
	swapa	[%i6+%g0]0x81,%l3	! %l3 = 00000000484d7c90
!	%l5 = 0000000000000000, Mem[0000000010001400] = 0700407a12fde9ef
	stxa	%l5,[%i0+%g0]0x80	! Mem[0000000010001400] = 0000000000000000
!	Mem[0000000030141410] = a5000000, %l7 = ffffffffffffff96
	ldstuba	[%i5+%o5]0x81,%l7	! %l7 = 000000a5000000ff
!	%l0 = 0000000000000007, %l6 = ffffffffffffffff, %l5 = 0000000000000000
	subc	%l0,%l6,%l5		! %l5 = 0000000000000008
!	Mem[0000000010141408] = 00000000, %l2 = 0000000000000088
	ldstuba	[%i5+%o4]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030001410] = b59aa500, %l4 = 00000000000000c1
	swapa	[%i0+%o5]0x89,%l4	! %l4 = 00000000b59aa500
!	%f22 = 20b3b676, %f23 = 7d8dacf7, %f18 = 8b3141eb
	fsubs	%f22,%f23,%f18		! %f18 = fd8dacf7
!	%l5 = 0000000000000008, Mem[0000000030001408] = b1d41c1d
	stwa	%l5,[%i0+%o4]0x81	! Mem[0000000030001408] = 00000008
!	%l1 = 0000000000000000, imm = fffffffffffff7d0, %l1 = 0000000000000000
	add	%l1,-0x830,%l1		! %l1 = fffffffffffff7d0
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = 00000000, %f22 = 20b3b676
	lda	[%i1+%o5]0x89,%f22	! %f22 = 00000000

p0_label_61:
!	Mem[0000000030081410] = a5000000 00000000, %l0 = 00000007, %l1 = fffff7d0
	ldda	[%i2+%o5]0x81,%l0	! %l0 = 00000000a5000000 0000000000000000
!	Mem[0000000010101408] = a5d41c1d00000000, %l3 = 00000000484d7c90
	ldxa	[%i4+0x008]%asi,%l3	! %l3 = a5d41c1d00000000
!	Mem[0000000010001410] = 5e5d8668, %l6 = ffffffffffffffff
	lduwa	[%i0+%o5]0x80,%l6	! %l6 = 000000005e5d8668
!	Mem[0000000010141408] = ff0000002effe5ff, %l1 = 0000000000000000
	ldxa	[%i5+%o4]0x80,%l1	! %l1 = ff0000002effe5ff
!	Mem[00000000211c0000] = d9ff980d, %l6 = 000000005e5d8668
	ldsba	[%o2+0x001]%asi,%l6	! %l6 = ffffffffffffffff
!	Mem[00000000100c1408] = 50a000a5, %f10 = 7a7acd55
	lda	[%i3+%o4]0x88,%f10	! %f10 = 50a000a5
!	Mem[0000000030081410] = a5000000, %l1 = ff0000002effe5ff
	lduha	[%i2+%o5]0x81,%l1	! %l1 = 000000000000a500
!	%l5 = 0000000000000008, %l0 = 00000000a5000000, %l5 = 0000000000000008
	sub	%l5,%l0,%l5		! %l5 = ffffffff5b000008
!	Mem[0000000010001408] = ffdbe53e6a81788a, %l6 = ffffffffffffffff
	ldxa	[%i0+%o4]0x80,%l6	! %l6 = ffdbe53e6a81788a
!	Starting 10 instruction Store Burst
!	Mem[0000000030101410] = a45e0db3, %l3 = a5d41c1d00000000
	ldstuba	[%i4+%o5]0x81,%l3	! %l3 = 000000a4000000ff

p0_label_62:
!	Mem[0000000010181408] = 00000000, %l3 = 00000000000000a4
	swapa	[%i6+%o4]0x88,%l3	! %l3 = 0000000000000000
!	%l4 = 00000000b59aa500, Mem[0000000030081410] = 00000000000000a5
	stxa	%l4,[%i2+%o5]0x89	! Mem[0000000030081410] = 00000000b59aa500
!	Mem[0000000010041400] = 000000a53b3a6b3f, %l0 = 00000000a5000000, %l6 = ffdbe53e6a81788a
	casxa	[%i1]0x80,%l0,%l6	! %l6 = 000000a53b3a6b3f
!	Mem[00000000100c1400] = 1d1cd4b1, %l4 = 00000000b59aa500
	swapa	[%i3+%g0]0x88,%l4	! %l4 = 000000001d1cd4b1
!	Mem[0000000030141410] = 000000ff, %l0 = 00000000a5000000
	ldstuba	[%i5+%o5]0x89,%l0	! %l0 = 000000ff000000ff
!	%l0 = 00000000000000ff, Mem[0000000010081415] = 0700407a
	stb	%l0,[%i2+0x015]		! Mem[0000000010081414] = 07ff407a
!	%l2 = 0000000000000000, %l2 = 0000000000000000, %y  = 000000e2
	smul	%l2,%l2,%l7		! %l7 = 0000000000000000, %y = 00000000
!	%l3 = 0000000000000000, Mem[0000000010141408] = 000000ff
	stwa	%l3,[%i5+%o4]0x88	! Mem[0000000010141408] = 00000000
!	%l7 = 0000000000000000, Mem[00000000218000c0] = 342d4926, %asi = 80
	stha	%l7,[%o3+0x0c0]%asi	! Mem[00000000218000c0] = 00004926
!	Starting 10 instruction Load Burst
!	%l2 = 0000000000000000, imm = 0000000000000c9f, %l3 = 0000000000000000
	add	%l2,0xc9f,%l3		! %l3 = 0000000000000c9f

p0_label_63:
!	Mem[00000000100c1408] = a500a050, %l7 = 0000000000000000
	lduha	[%i3+%o4]0x80,%l7	! %l7 = 000000000000a500
!	Mem[00000000100c1410] = 00000000, %l3 = 0000000000000c9f
	ldswa	[%i3+%o5]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000010141408] = 00000000, %l7 = 000000000000a500
	lduba	[%i5+%o4]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000030041410] = 907c4d4800000000, %l6 = 000000a53b3a6b3f
	ldxa	[%i1+%o5]0x89,%l6	! %l6 = 907c4d4800000000
!	%f25 = a5000000, %f23 = 7d8dacf7
	fcmpes	%fcc2,%f25,%f23		! %fcc2 = 1
!	%f10 = 50a000a5, %f5  = ff000000, %f9  = 380a1d7e
	fadds	%f10,%f5 ,%f9 		! %f9  = ff000000
!	Mem[0000000030001400] = 00000000, %l6 = 907c4d4800000000
	ldswa	[%i0+%g0]0x81,%l6	! %l6 = 0000000000000000
!	%l5 = ffffffff5b000008, %l0 = 00000000000000ff, %l5 = ffffffff5b000008
	andn	%l5,%l0,%l5		! %l5 = ffffffff5b000000
!	Mem[0000000010101400] = ffff000000017013, %f28 = d421af32 49b811d2
	ldda	[%i4+%g0]0x80,%f28	! %f28 = ffff0000 00017013
!	Starting 10 instruction Store Burst
!	%f27 = c6dbb91c, Mem[00000000300c1408] = 15ca031c
	sta	%f27,[%i3+%o4]0x81	! Mem[00000000300c1408] = c6dbb91c

p0_label_64:
!	%l6 = 00000000, %l7 = 00000000, Mem[00000000100c1408] = 50a000a5 8f5a2eb6
	stda	%l6,[%i3+%o4]0x88	! Mem[00000000100c1408] = 00000000 00000000
!	%l6 = 0000000000000000, Mem[0000000030141410] = ff000000
	stba	%l6,[%i5+%o5]0x81	! Mem[0000000030141410] = 00000000
!	%l3 = 0000000000000000, Mem[0000000010081428] = b27dab3a
	stw	%l3,[%i2+0x028]		! Mem[0000000010081428] = 00000000
!	Mem[0000000010141408] = 00000000, %l2 = 0000000000000000
	ldstuba	[%i5+%o4]0x80,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010001410] = 5e5d8668, %l4 = 000000001d1cd4b1
	swapa	[%i0+%o5]0x80,%l4	! %l4 = 000000005e5d8668
!	%l6 = 0000000000000000, %l7 = 0000000000000000, %l5 = ffffffff5b000000
	and	%l6,%l7,%l5		! %l5 = 0000000000000000
!	%f10 = 50a000a5 fa443e8a, Mem[0000000030001400] = 00000000 5f880035
	stda	%f10,[%i0+%g0]0x81	! Mem[0000000030001400] = 50a000a5 fa443e8a
!	%f20 = 0000e44d b59aa8d4, Mem[0000000010041408] = ffffffff 59140000
	stda	%f20,[%i1+%o4]0x80	! Mem[0000000010041408] = 0000e44d b59aa8d4
!	%l4 = 000000005e5d8668, Mem[0000000010181408] = 000000a4
	stwa	%l4,[%i6+%o4]0x88	! Mem[0000000010181408] = 5e5d8668
!	Starting 10 instruction Load Burst
!	Mem[0000000010101438] = 10ca031c, %f16 = 3500885f
	ld	[%i4+0x038],%f16	! %f16 = 10ca031c

p0_label_65:
!	Mem[0000000030141410] = 00000000, %l5 = 0000000000000000
	lduba	[%i5+%o5]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000010181408] = 68865d5e00004d48, %f20 = 0000e44d b59aa8d4
	ldd	[%i6+%o4],%f20		! %f20 = 68865d5e 00004d48
!	Mem[0000000030081410] = b59aa500, %l7 = 0000000000000000
	lduwa	[%i2+%o5]0x89,%l7	! %l7 = 00000000b59aa500
!	Mem[0000000010181420] = 775a5ef2, %l0 = 00000000000000ff
	lduh	[%i6+0x022],%l0		! %l0 = 0000000000005ef2
!	Mem[00000000100c1434] = 7c901319, %l0 = 0000000000005ef2
	ldsb	[%i3+0x036],%l0		! %l0 = 0000000000000013
!	Mem[0000000010101408] = 1d1cd4a5, %l5 = 0000000000000000
	ldsha	[%i4+%o4]0x88,%l5	! %l5 = ffffffffffffd4a5
!	Mem[0000000030141400] = 1cb9dbc6, %l7 = 00000000b59aa500
	ldsba	[%i5+%g0]0x81,%l7	! %l7 = 000000000000001c
!	Mem[00000000100c1410] = 000000003aab7db2, %l3 = 0000000000000000
	ldxa	[%i3+%o5]0x80,%l3	! %l3 = 000000003aab7db2
!	Mem[0000000010001438] = 00000000, %l1 = 000000000000a500
	ldub	[%i0+0x03a],%l1		! %l1 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f12 = f9b62acf ac4b14ff, %l2 = 0000000000000000
!	Mem[0000000030001410] = c10000004de40000
	add	%i0,0x010,%g1
	stda	%f12,[%g1+%l2]ASI_PST8_S ! Mem[0000000030001410] = c10000004de40000

p0_label_66:
!	Mem[0000000020800041] = e48b226c, %l7 = 000000000000001c
	ldstuba	[%o1+0x041]%asi,%l7	! %l7 = 0000008b000000ff
!	%l2 = 0000000000000000, Mem[0000000030141408] = 000000ff
	stha	%l2,[%i5+%o4]0x81	! Mem[0000000030141408] = 000000ff
!	%l2 = 0000000000000000, Mem[0000000030041410] = 00000000
	stha	%l2,[%i1+%o5]0x81	! Mem[0000000030041410] = 00000000
!	%f9  = ff000000, Mem[0000000030101408] = 00000084
	sta	%f9 ,[%i4+%o4]0x81	! Mem[0000000030101408] = ff000000
!	Mem[0000000030001410] = c1000000, %l1 = 0000000000000000
	ldstuba	[%i0+%o5]0x81,%l1	! %l1 = 000000c1000000ff
!	%f10 = 50a000a5 fa443e8a, Mem[0000000010041400] = 000000a5 3b3a6b3f
	std	%f10,[%i1+%g0]	! Mem[0000000010041400] = 50a000a5 fa443e8a
!	Mem[0000000010141400] = c1ffffff, %l3 = 000000003aab7db2
	ldstuba	[%i5+%g0]0x80,%l3	! %l3 = 000000c1000000ff
!	%l0 = 00000013, %l1 = 000000c1, Mem[0000000010041400] = a500a050 8a3e44fa
	stda	%l0,[%i1+%g0]0x88	! Mem[0000000010041400] = 00000013 000000c1
!	%l5 = ffffffffffffd4a5, Mem[00000000100c1400] = 00a59ab5
	stha	%l5,[%i3+%g0]0x80	! Mem[00000000100c1400] = d4a59ab5
!	Starting 10 instruction Load Burst
!	Mem[0000000010141420] = fbc755fb, %l7 = 000000000000008b
	ldub	[%i5+0x022],%l7		! %l7 = 0000000000000055

p0_label_67:
!	Mem[0000000030141410] = 00000000, %l1 = 00000000000000c1
	ldswa	[%i5+%o5]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000010141410] = 59140000, %l2 = 0000000000000000
	lduwa	[%i5+%o5]0x88,%l2	! %l2 = 0000000059140000
!	Mem[0000000010001410] = b1d41c1d, %f22 = 00000000
	lda	[%i0+%o5]0x88,%f22	! %f22 = b1d41c1d
!	Mem[0000000010101408] = a5d41c1d00000000, %l4 = 000000005e5d8668
	ldx	[%i4+%o4],%l4		! %l4 = a5d41c1d00000000
!	Mem[0000000010041410] = d771338e, %l4 = a5d41c1d00000000
	ldsha	[%i1+%o5]0x88,%l4	! %l4 = 000000000000338e
!	%l3 = 00000000000000c1, imm = fffffffffffffb5d, %l0 = 0000000000000013
	sub	%l3,-0x4a3,%l0		! %l0 = 0000000000000564
	membar	#Sync			! Added by membar checker (14)
!	Mem[00000000300c1400] = 00000000 000000a5 c6dbb91c 0700407a
!	Mem[00000000300c1410] = 000000a5 2373c496 d3b0b970 6159318b
!	Mem[00000000300c1420] = e9ac274a 0d75349a 552004da 9c159b6e
!	Mem[00000000300c1430] = 6298e50c 1112413c e137cf03 3c9e2629
	ldda	[%i3]ASI_BLK_S,%f0	! Block Load from 00000000300c1400
!	Mem[0000000030141410] = 00000000, %f22 = b1d41c1d
	lda	[%i5+%o5]0x81,%f22	! %f22 = 00000000
!	Mem[000000001018140c] = 00004d48, %f16 = 10ca031c
	ld	[%i6+0x00c],%f16	! %f16 = 00004d48
!	Starting 10 instruction Store Burst
!	Mem[0000000010181420] = 775a5ef2, %l1 = 0000000000000000, %asi = 80
	swapa	[%i6+0x020]%asi,%l1	! %l1 = 00000000775a5ef2

p0_label_68:
!	Mem[00000000201c0001] = ffff19af, %l0 = 0000000000000564
	ldstuba	[%o0+0x001]%asi,%l0	! %l0 = 000000ff000000ff
!	%l0 = 00000000000000ff, Mem[00000000100c1410] = 00000000
	stwa	%l0,[%i3+%o5]0x88	! Mem[00000000100c1410] = 000000ff
!	Mem[0000000030001400] = 50a000a5, %l7 = 0000000000000055
	swapa	[%i0+%g0]0x81,%l7	! %l7 = 0000000050a000a5
!	Mem[0000000030081408] = 7a400007, %l0 = 00000000000000ff
	ldstuba	[%i2+%o4]0x81,%l0	! %l0 = 0000007a000000ff
!	Mem[00000000100c1410] = 000000ff, %l6 = 0000000000000000
	swapa	[%i3+%o5]0x88,%l6	! %l6 = 00000000000000ff
!	%f31 = 9412d64a, %f28 = ffff0000, %f25 = a5000000
	fsubs	%f31,%f28,%f25		! %f25 = ffff0000
!	%f17 = 5e5d8668, Mem[0000000030081400] = e27e2b41
	sta	%f17,[%i2+%g0]0x81	! Mem[0000000030081400] = 5e5d8668
!	Mem[0000000010001438] = 00000000, %l6 = 00000000000000ff
	swap	[%i0+0x038],%l6		! %l6 = 0000000000000000
!	Mem[00000000300c1408] = 1cb9dbc6, %l4 = 000000000000338e
	ldstuba	[%i3+%o4]0x89,%l4	! %l4 = 000000c6000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = 00000000, %l1 = 00000000775a5ef2
	ldsba	[%i1+%o5]0x89,%l1	! %l1 = 0000000000000000

p0_label_69:
!	Mem[0000000030181408] = 7d50ff86b4d1ff74, %f18 = fd8dacf7 ffffffff
	ldda	[%i6+%o4]0x81,%f18	! %f18 = 7d50ff86 b4d1ff74
!	Mem[000000001000141c] = 58b20084, %f30 = c51ff535
	lda	[%i0+0x01c]%asi,%f30	! %f30 = 58b20084
!	Mem[0000000030101410] = ff5e0db380fd7172, %f22 = 00000000 7d8dacf7
	ldda	[%i4+%o5]0x81,%f22	! %f22 = ff5e0db3 80fd7172
!	Mem[0000000010081400] = 8a788196, %l0 = 000000000000007a
	ldsha	[%i2+%g0]0x88,%l0	! %l0 = ffffffffffff8196
!	Mem[0000000030101408] = 000000ff, %l7 = 0000000050a000a5
	lduba	[%i4+%o4]0x89,%l7	! %l7 = 00000000000000ff
	membar	#Sync			! Added by membar checker (15)
!	Mem[0000000030081400] = 5e5d8668 8d1e3315 ff400007 4920665d
!	Mem[0000000030081410] = 00a59ab5 00000000 ccc989c0 c971ce8e
!	Mem[0000000030081420] = 491588d6 947903e2 b0b2c754 db995109
!	Mem[0000000030081430] = 3a9fb502 0c281024 b82a2f11 4f979be2
	ldda	[%i2]ASI_BLK_AIUS,%f16	! Block Load from 0000000030081400
!	Mem[0000000010081424] = af83e48b, %l4 = 00000000000000c6
	lduba	[%i2+0x024]%asi,%l4	! %l4 = 00000000000000af
!	Mem[0000000030101408] = ff000000, %l0 = ffffffffffff8196
	lduwa	[%i4+%o4]0x81,%l0	! %l0 = 00000000ff000000
!	%l4 = 00000000000000af, imm = fffffffffffffa48, %l5 = ffffffffffffd4a5
	sub	%l4,-0x5b8,%l5		! %l5 = 0000000000000667
!	Starting 10 instruction Store Burst
!	%l4 = 00000000000000af, Mem[0000000010041408] = 4de40000
	stwa	%l4,[%i1+%o4]0x88	! Mem[0000000010041408] = 000000af

p0_label_70:
!	%l1 = 0000000000000000, Mem[0000000010081400] = 9681788a, %asi = 80
	stha	%l1,[%i2+0x000]%asi	! Mem[0000000010081400] = 0000788a
!	Mem[0000000030181410] = 00000048, %l2 = 0000000059140000
	ldstuba	[%i6+%o5]0x81,%l2	! %l2 = 00000000000000ff
!	Mem[000000001008140c] = a5000000, %l7 = 00000000000000ff
	swap	[%i2+0x00c],%l7		! %l7 = 00000000a5000000
!	%l7 = 00000000a5000000, Mem[00000000201c0000] = ffff19af
	sth	%l7,[%o0+%g0]		! Mem[00000000201c0000] = 000019af
!	Mem[0000000010141408] = ff000000, %l6 = 0000000000000000
	swapa	[%i5+%o4]0x80,%l6	! %l6 = 00000000ff000000
!	Mem[00000000300c1400] = 00000000, %l2 = 0000000000000000
	ldstuba	[%i3+%g0]0x89,%l2	! %l2 = 00000000000000ff
!	%f14 = e137cf03, Mem[00000000100c1418] = d1555933
	st	%f14,[%i3+0x018]	! Mem[00000000100c1418] = e137cf03
!	%f8  = e9ac274a 0d75349a, %l1 = 0000000000000000
!	Mem[0000000010001418] = c7c1419a58b20084
	add	%i0,0x018,%g1
	stda	%f8,[%g1+%l1]ASI_PST32_P ! Mem[0000000010001418] = c7c1419a58b20084
!	%l1 = 0000000000000000, imm = 00000000000008ad, %l3 = 00000000000000c1
	subc	%l1,0x8ad,%l3		! %l3 = fffffffffffff753
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = ff000000, %l4 = 00000000000000af
	lduwa	[%i5+%o4]0x89,%l4	! %l4 = 00000000ff000000

p0_label_71:
!	Mem[0000000010181400] = 3500885f, %l2 = 0000000000000000
	lduba	[%i6+%g0]0x80,%l2	! %l2 = 0000000000000035
!	Mem[0000000010141410] = 00001459, %l0 = 00000000ff000000
	ldswa	[%i5+%o5]0x80,%l0	! %l0 = 0000000000001459
!	Mem[0000000010041410] = 8e3371d7, %l6 = 00000000ff000000
	lduba	[%i1+%o5]0x80,%l6	! %l6 = 000000000000008e
!	Mem[0000000030101400] = ffffffff ffffd9ff, %l6 = 0000008e, %l7 = a5000000
	ldda	[%i4+%g0]0x89,%l6	! %l6 = 00000000ffffd9ff 00000000ffffffff
!	Mem[0000000010041400] = 00000013, %l5 = 0000000000000667
	ldsha	[%i1+%g0]0x88,%l5	! %l5 = 0000000000000013
!	Mem[000000001010140c] = 00000000, %l1 = 0000000000000000
	lduw	[%i4+0x00c],%l1		! %l1 = 0000000000000000
!	Mem[0000000010181410] = 00000000, %l0 = 0000000000001459
	ldsba	[%i6+%o5]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000010141428] = 5d662049, %l1 = 0000000000000000
	ldsb	[%i5+0x029],%l1		! %l1 = 0000000000000066
!	Mem[0000000030181400] = 00000000, %l4 = 00000000ff000000
	lduwa	[%i6+%g0]0x81,%l4	! %l4 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l3 = fffffffffffff753, Mem[0000000030141410] = 00000000
	stba	%l3,[%i5+%o5]0x89	! Mem[0000000030141410] = 00000053

p0_label_72:
!	%l7 = 00000000ffffffff, Mem[0000000010041410] = f8091fafd771338e
	stxa	%l7,[%i1+%o5]0x88	! Mem[0000000010041410] = 00000000ffffffff
!	Mem[0000000030101410] = b30d5eff, %l4 = 0000000000000000
	ldstuba	[%i4+%o5]0x89,%l4	! %l4 = 000000ff000000ff
!	%l0 = 0000000000000000, Mem[00000000300c1400] = 000000ff
	stwa	%l0,[%i3+%g0]0x89	! Mem[00000000300c1400] = 00000000
!	%l7 = 00000000ffffffff, Mem[0000000010041400] = 13000000c1000000
	stxa	%l7,[%i1+%g0]0x80	! Mem[0000000010041400] = 00000000ffffffff
!	Mem[00000000300c1408] = 1cb9dbff, %l3 = fffffffffffff753
	ldstuba	[%i3+%o4]0x89,%l3	! %l3 = 000000ff000000ff
!	Mem[0000000030181408] = 7d50ff86, %l3 = 00000000000000ff
	swapa	[%i6+%o4]0x81,%l3	! %l3 = 000000007d50ff86
!	%l2 = 00000035, %l3 = 7d50ff86, Mem[0000000010041400] = 00000000 ffffffff
	stda	%l2,[%i1+%g0]0x88	! Mem[0000000010041400] = 00000035 7d50ff86
!	Mem[0000000010001410] = 1d1cd4b1, %l7 = ffffffff, %l5 = 00000013
	add	%i0,0x10,%g1
	casa	[%g1]0x80,%l7,%l5	! %l5 = 000000001d1cd4b1
!	Mem[0000000010081408] = b6000000, %l4 = 00000000000000ff
	ldstuba	[%i2+%o4]0x80,%l4	! %l4 = 000000b6000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = 000000ff, %l0 = 0000000000000000
	lduwa	[%i4+%o5]0x88,%l0	! %l0 = 00000000000000ff

p0_label_73:
!	Mem[0000000010141430] = b405f584, %l5 = 000000001d1cd4b1
	ldsb	[%i5+0x031],%l5		! %l5 = 0000000000000005
!	Mem[0000000010081424] = af83e48b, %f17 = 8d1e3315
	ld	[%i2+0x024],%f17	! %f17 = af83e48b
!	Mem[0000000010001408] = 3ee5dbff, %l0 = 00000000000000ff
	lduwa	[%i0+%o4]0x88,%l0	! %l0 = 000000003ee5dbff
!	Mem[0000000030101410] = ff5e0db3, %l5 = 0000000000000005
	lduha	[%i4+%o5]0x81,%l5	! %l5 = 000000000000ff5e
!	Mem[0000000010081408] = 000000ff, %f7  = 6159318b
	lda	[%i2+%o4]0x88,%f7 	! %f7 = 000000ff
!	Mem[0000000030141400] = 1cb9dbc6 76b6b320, %l0 = 3ee5dbff, %l1 = 00000066
	ldda	[%i5+%g0]0x81,%l0	! %l0 = 000000001cb9dbc6 0000000076b6b320
!	Mem[0000000010081410] = 0000000007ff407a, %l5 = 000000000000ff5e
	ldxa	[%i2+%o5]0x80,%l5	! %l5 = 0000000007ff407a
!	Mem[0000000010041408] = af000000, %l1 = 0000000076b6b320
	ldsba	[%i1+%o4]0x80,%l1	! %l1 = ffffffffffffffaf
!	Mem[0000000010041408] = 000000af, %f21 = 00000000
	lda	[%i1+%o4]0x88,%f21	! %f21 = 000000af
!	Starting 10 instruction Store Burst
!	%l4 = 00000000000000b6, Mem[0000000010001410] = 49ade994b1d41c1d
	stxa	%l4,[%i0+%o5]0x88	! Mem[0000000010001410] = 00000000000000b6

p0_label_74:
!	Mem[0000000030101408] = ff000000, %l7 = 00000000ffffffff
	swapa	[%i4+%o4]0x81,%l7	! %l7 = 00000000ff000000
!	%f12 = 6298e50c, %f7  = 000000ff
	fcmpes	%fcc3,%f12,%f7 		! %fcc3 = 2
!	%l2 = 0000000000000035, Mem[000000001008142c] = 18ae2b56, %asi = 80
	stha	%l2,[%i2+0x02c]%asi	! Mem[000000001008142c] = 00352b56
!	%l7 = 00000000ff000000, imm = 0000000000000e73, %l4 = 00000000000000b6
	andn	%l7,0xe73,%l4		! %l4 = 00000000ff000000
!	%f12 = 6298e50c 1112413c, Mem[0000000010081410] = 00000000 7a40ff07
	stda	%f12,[%i2+%o5]0x88	! Mem[0000000010081410] = 6298e50c 1112413c
!	%l6 = ffffd9ff, %l7 = ff000000, Mem[0000000010081430] = 0000e44d b59aa8d4
	std	%l6,[%i2+0x030]		! Mem[0000000010081430] = ffffd9ff ff000000
!	%f0  = 00000000, Mem[0000000030001400] = 00000055
	sta	%f0 ,[%i0+%g0]0x81	! Mem[0000000030001400] = 00000000
!	%l7 = 00000000ff000000, Mem[0000000010101410] = ff000000
	stwa	%l7,[%i4+%o5]0x80	! Mem[0000000010101410] = ff000000
!	%l0 = 1cb9dbc6, %l1 = ffffffaf, Mem[0000000010101408] = 1d1cd4a5 00000000
	stda	%l0,[%i4+%o4]0x88	! Mem[0000000010101408] = 1cb9dbc6 ffffffaf
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = d9ff980d, %l1 = ffffffffffffffaf
	ldsh	[%o2+%g0],%l1		! %l1 = ffffffffffffd9ff

p0_label_75:
!	Mem[0000000010181410] = 00000000, %l4 = 00000000ff000000
	lduwa	[%i6+%o5]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000030181410] = ff000048, %l1 = ffffffffffffd9ff
	lduba	[%i6+%o5]0x81,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010181400] = 5f880035, %l6 = 00000000ffffd9ff
	ldswa	[%i6+%g0]0x88,%l6	! %l6 = 000000005f880035
!	Mem[000000001010140c] = afffffff, %l5 = 0000000007ff407a
	lduwa	[%i4+0x00c]%asi,%l5	! %l5 = 00000000afffffff
!	Mem[00000000100c1418] = e137cf03, %l1 = 00000000000000ff
	ldsba	[%i3+0x01a]%asi,%l1	! %l1 = ffffffffffffffcf
!	Mem[0000000010141438] = 05d7f66e, %l0 = 000000001cb9dbc6
	lduha	[%i5+0x038]%asi,%l0	! %l0 = 00000000000005d7
!	Mem[0000000030081408] = 070040ff, %l4 = 0000000000000000
	ldswa	[%i2+%o4]0x89,%l4	! %l4 = 00000000070040ff
!	Mem[0000000030081408] = 070040ff, %l4 = 00000000070040ff
	lduba	[%i2+%o4]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010041418] = 00000033000014ff, %l7 = 00000000ff000000
	ldxa	[%i1+0x018]%asi,%l7	! %l7 = 00000033000014ff
!	Starting 10 instruction Store Burst
!	%l6 = 000000005f880035, Mem[0000000010181410] = 3500885f00000000
	stxa	%l6,[%i6+%o5]0x88	! Mem[0000000010181410] = 000000005f880035

p0_label_76:
!	Mem[0000000010001400] = 00000000, %l5 = 00000000afffffff
	ldstuba	[%i0+%g0]0x88,%l5	! %l5 = 00000000000000ff
!	%l7 = 00000033000014ff, Mem[00000000100c1410] = b27dab3a00000000
	stxa	%l7,[%i3+%o5]0x88	! Mem[00000000100c1410] = 00000033000014ff
!	Mem[0000000030041408] = ac4b14ff, %l0 = 00000000000005d7
	ldstuba	[%i1+%o4]0x89,%l0	! %l0 = 000000ff000000ff
!	Mem[00000000211c0000] = d9ff980d, %l6 = 000000005f880035
	ldstub	[%o2+%g0],%l6		! %l6 = 000000d9000000ff
!	%f16 = 5e5d8668, Mem[00000000300c1408] = ffdbb91c
	sta	%f16,[%i3+%o4]0x81	! Mem[00000000300c1408] = 5e5d8668
!	Mem[0000000010101430] = 00000084, %l5 = 0000000000000000, %asi = 80
	swapa	[%i4+0x030]%asi,%l5	! %l5 = 0000000000000084
!	%f16 = 5e5d8668 af83e48b, Mem[00000000100c1400] = b59aa5d4 c7c1419a
	stda	%f16,[%i3+%g0]0x88	! Mem[00000000100c1400] = 5e5d8668 af83e48b
!	Mem[0000000010001408] = 3ee5dbff, %l3 = 000000007d50ff86
	ldstuba	[%i0+%o4]0x88,%l3	! %l3 = 000000ff000000ff
!	Mem[00000000100c1400] = 8be483af, %l7 = 00000033000014ff
	ldstuba	[%i3+%g0]0x80,%l7	! %l7 = 0000008b000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1424] = 02283563, %l1 = ffffffffffffffcf
	ldsh	[%i3+0x026],%l1		! %l1 = 0000000000003563

p0_label_77:
!	Mem[0000000030181408] = 000000ff, %l0 = 00000000000000ff
	lduba	[%i6+%o4]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000030101410] = 7271fd80b30d5eff, %f28 = 3a9fb502 0c281024
	ldda	[%i4+%o5]0x89,%f28	! %f28 = 7271fd80 b30d5eff
!	Mem[0000000010001438] = 000000ff000000e2, %f6  = d3b0b970 000000ff
	ldd	[%i0+0x038],%f6 	! %f6  = 000000ff 000000e2
!	Mem[0000000030181408] = ff000000, %l7 = 000000000000008b
	ldsba	[%i6+%o4]0x89,%l7	! %l7 = 0000000000000000
!	%l4 = 00000000000000ff, %l7 = 0000000000000000, %l6 = 00000000000000d9
	subc	%l4,%l7,%l6		! %l6 = 00000000000000ff
!	Mem[0000000010181400] = 3500885f 00000000, %l2 = 00000035, %l3 = 000000ff
	ldd	[%i6+%g0],%l2		! %l2 = 000000003500885f 0000000000000000
!	Mem[0000000010041400] = 35000000, %l4 = 00000000000000ff
	lduba	[%i1+%g0]0x80,%l4	! %l4 = 0000000000000035
!	Mem[0000000010041408] = 000000af, %l6 = 00000000000000ff
	ldswa	[%i1+%o4]0x88,%l6	! %l6 = 00000000000000af
!	Mem[0000000010101420] = 0418b91c19e5b62e, %l2 = 000000003500885f
	ldx	[%i4+0x020],%l2		! %l2 = 0418b91c19e5b62e
!	Starting 10 instruction Store Burst
!	%l3 = 0000000000000000, Mem[0000000020800000] = ffc117e8, %asi = 80
	stba	%l3,[%o1+0x000]%asi	! Mem[0000000020800000] = 00c117e8

p0_label_78:
	membar	#Sync			! Added by membar checker (16)
!	%f12 = 6298e50c 1112413c, %l3 = 0000000000000000
!	Mem[0000000030081430] = 3a9fb5020c281024
	add	%i2,0x030,%g1
	stda	%f12,[%g1+%l3]ASI_PST16_SL ! Mem[0000000030081430] = 3a9fb5020c281024
!	%l2 = 0418b91c19e5b62e, Mem[00000000100c1408] = 00000000
	stba	%l2,[%i3+%o4]0x88	! Mem[00000000100c1408] = 0000002e
!	Mem[0000000010041408] = 000000af, %l6 = 00000000000000af
	ldstuba	[%i1+%o4]0x88,%l6	! %l6 = 000000af000000ff
!	Mem[0000000010101438] = 10ca031c0700407a, %l4 = 0000000000000035, %l3 = 0000000000000000
	add	%i4,0x38,%g1
	casxa	[%g1]0x80,%l4,%l3	! %l3 = 10ca031c0700407a
!	%l4 = 00000035, %l5 = 00000084, Mem[0000000010141410] = 59140000 00000000
	stda	%l4,[%i5+%o5]0x88	! Mem[0000000010141410] = 00000035 00000084
!	Mem[0000000030141408] = 000000ff, %l6 = 00000000000000af
	swapa	[%i5+%o4]0x81,%l6	! %l6 = 00000000000000ff
!	%l6 = 00000000000000ff, Mem[00000000100c1408] = 000000000000002e
	stxa	%l6,[%i3+%o4]0x88	! Mem[00000000100c1408] = 00000000000000ff
!	%l2 = 0418b91c19e5b62e, Mem[0000000030141400] = c6dbb91c
	stba	%l2,[%i5+%g0]0x89	! Mem[0000000030141400] = c6dbb92e
!	Mem[0000000021800101] = f9e49c47, %l4 = 0000000000000035
	ldstub	[%o3+0x101],%l4		! %l4 = 000000e4000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = c6dbb91c, %l2 = 0418b91c19e5b62e
	lduwa	[%i4+%o4]0x80,%l2	! %l2 = 00000000c6dbb91c

p0_label_79:
!	Mem[0000000030001400] = 00000000, %l2 = 00000000c6dbb91c
	ldswa	[%i0+%g0]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000010001428] = d637d3f7 71e86242, %l6 = 000000ff, %l7 = 00000000
	ldda	[%i0+0x028]%asi,%l6	! %l6 = 00000000d637d3f7 0000000071e86242
!	Mem[0000000030141408] = 000000af, %l6 = 00000000d637d3f7
	ldsha	[%i5+%o4]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000010001408] = ffdbe53e, %f29 = b30d5eff
	lda	[%i0+%o4]0x80,%f29	! %f29 = ffdbe53e
!	Mem[0000000010181408] = 5e5d8668, %l5 = 0000000000000084
	ldsba	[%i6+%o4]0x88,%l5	! %l5 = 0000000000000068
!	Mem[0000000030101408] = ffffffff, %l3 = 10ca031c0700407a
	ldsba	[%i4+%o4]0x81,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000021800000] = 0db7dd30, %l1 = 0000000000003563
	lduha	[%o3+0x000]%asi,%l1	! %l1 = 0000000000000db7
!	Mem[0000000010181400] = 3500885f 00000000, %l6 = 00000000, %l7 = 71e86242
	ldda	[%i6+%g0]0x80,%l6	! %l6 = 000000003500885f 0000000000000000
!	Mem[0000000010081400] = 0000788a e44d0000, %l0 = 00000000, %l1 = 00000db7
	ldd	[%i2+%g0],%l0		! %l0 = 000000000000788a 00000000e44d0000
!	Starting 10 instruction Store Burst
!	%l4 = 000000e4, %l5 = 00000068, Mem[00000000100c1400] = ffe483af 68865d5e
	stda	%l4,[%i3+%g0]0x80	! Mem[00000000100c1400] = 000000e4 00000068

p0_label_80:
!	%l6 = 000000003500885f, Mem[0000000020800001] = 00c117e8, %asi = 80
	stba	%l6,[%o1+0x001]%asi	! Mem[0000000020800000] = 005f17e8
!	Mem[0000000010041410] = ffffffff, %l3 = ffffffffffffffff
	ldstuba	[%i1+%o5]0x80,%l3	! %l3 = 000000ff000000ff
!	Mem[0000000030101400] = ffd9ffff, %l6 = 000000003500885f
	swapa	[%i4+%g0]0x81,%l6	! %l6 = 00000000ffd9ffff
!	%l0 = 000000000000788a, Mem[00000000300c1410] = 000000a5
	stwa	%l0,[%i3+%o5]0x81	! Mem[00000000300c1410] = 0000788a
!	Mem[0000000030141400] = c6dbb92e, %l5 = 0000000000000068
	swapa	[%i5+%g0]0x89,%l5	! %l5 = 00000000c6dbb92e
!	%l3 = 00000000000000ff, Mem[00000000100c1410] = 00000033000014ff
	stxa	%l3,[%i3+%o5]0x88	! Mem[00000000100c1410] = 00000000000000ff
!	%l1 = 00000000e44d0000, Mem[0000000030101410] = b30d5eff
	stha	%l1,[%i4+%o5]0x89	! Mem[0000000030101410] = b30d0000
!	Mem[0000000010181400] = 5f880035, %l4 = 00000000000000e4
	swapa	[%i6+%g0]0x88,%l4	! %l4 = 000000005f880035
!	%l2 = 0000000000000000, Mem[0000000010041410] = ffffffff
	stha	%l2,[%i1+%o5]0x80	! Mem[0000000010041410] = 0000ffff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1430] = 3e645548, %l4 = 000000005f880035
	ldsw	[%i3+0x030],%l4		! %l4 = 000000003e645548

p0_label_81:
!	Mem[0000000030141408] = 000000af, %l3 = 00000000000000ff
	ldswa	[%i5+%o4]0x81,%l3	! %l3 = 00000000000000af
!	Mem[0000000010001400] = 000000ff, %l5 = 00000000c6dbb92e
	ldsha	[%i0+%g0]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010141400] = 000000ff ffffffff, %l0 = 0000788a, %l1 = e44d0000
	ldda	[%i5+%g0]0x88,%l0	! %l0 = 00000000ffffffff 00000000000000ff
!	Mem[0000000010141408] = 000000002effe5ff, %f30 = b82a2f11 4f979be2
	ldda	[%i5+%o4]0x80,%f30	! %f30 = 00000000 2effe5ff
!	Mem[0000000010141400] = ffffffff ff000000, %l6 = ffd9ffff, %l7 = 00000000
	ldda	[%i5+0x000]%asi,%l6	! %l6 = 00000000ffffffff 00000000ff000000
!	Mem[0000000010181408] = 484d00005e5d8668, %l5 = 00000000000000ff
	ldxa	[%i6+%o4]0x88,%l5	! %l5 = 484d00005e5d8668
!	Mem[0000000030181408] = ff000000, %l5 = 484d00005e5d8668
	ldsha	[%i6+%o4]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000010041410] = ffff0000, %l6 = 00000000ffffffff
	ldsha	[%i1+%o5]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000030001408] = 00000008, %l4 = 000000003e645548
	lduwa	[%i0+%o4]0x81,%l4	! %l4 = 0000000000000008
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000000008, Mem[0000000010081400] = 0000788a
	stba	%l4,[%i2+%g0]0x80	! Mem[0000000010081400] = 0800788a

p0_label_82:
!	%l1 = 00000000000000ff, Mem[0000000030001410] = 000000ff
	stba	%l1,[%i0+%o5]0x89	! Mem[0000000030001410] = 000000ff
!	%l3 = 00000000000000af, Mem[00000000201c0000] = 000019af, %asi = 80
	stha	%l3,[%o0+0x000]%asi	! Mem[00000000201c0000] = 00af19af
!	%l7 = 00000000ff000000, Mem[0000000030101410] = 00000db3
	stba	%l7,[%i4+%o5]0x81	! Mem[0000000030101410] = 00000db3
!	Mem[0000000030101410] = b30d0000, %l2 = 0000000000000000
	swapa	[%i4+%o5]0x89,%l2	! %l2 = 00000000b30d0000
!	%l7 = 00000000ff000000, Mem[00000000100c1400] = 000000e4
	stha	%l7,[%i3+%g0]0x80	! Mem[00000000100c1400] = 000000e4
!	%l2 = 00000000b30d0000, Mem[00000000100c1410] = ff00000000000000
	stx	%l2,[%i3+%o5]		! Mem[00000000100c1410] = 00000000b30d0000
!	Mem[0000000010001400] = 000000ff, %l5 = 0000000000000000
	ldstuba	[%i0+%g0]0x88,%l5	! %l5 = 000000ff000000ff
!	%l2 = b30d0000, %l3 = 000000af, Mem[0000000010001430] = 221101ff 585c6b8c
	std	%l2,[%i0+0x030]		! Mem[0000000010001430] = b30d0000 000000af
!	%l5 = 00000000000000ff, Mem[0000000010101408] = 1cb9dbc6
	stwa	%l5,[%i4+%o4]0x88	! Mem[0000000010101408] = 000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1430] = 3e645548 7c901319, %l0 = ffffffff, %l1 = 000000ff
	ldda	[%i3+0x030]%asi,%l0	! %l0 = 000000003e645548 000000007c901319

p0_label_83:
!	Mem[0000000010141408] = 00000000, %f14 = e137cf03
	ld	[%i5+%o4],%f14	! %f14 = 00000000
!	Mem[0000000010101400] = 0000ffff, %l1 = 000000007c901319
	ldsba	[%i4+%g0]0x88,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000030001408] = 00000008, %f26 = b0b2c754
	lda	[%i0+%o4]0x81,%f26	! %f26 = 00000008
!	Mem[0000000010181430] = 4049c358fea97ab2, %l3 = 00000000000000af
	ldxa	[%i6+0x030]%asi,%l3	! %l3 = 4049c358fea97ab2
!	Mem[00000000100c1400] = 000000e4, %l0 = 000000003e645548
	ldswa	[%i3+%g0]0x80,%l0	! %l0 = 00000000000000e4
!	Mem[0000000010101408] = 000000ff, %l1 = ffffffffffffffff
	lduha	[%i4+%o4]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[00000000211c0000] = ffff980d, %l0 = 00000000000000e4
	ldsha	[%o2+0x000]%asi,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010001408] = ffdbe53e, %l7 = 00000000ff000000
	ldsha	[%i0+%o4]0x80,%l7	! %l7 = ffffffffffffffdb
!	Mem[0000000030041400] = ffffe519, %f22 = ccc989c0
	lda	[%i1+%g0]0x81,%f22	! %f22 = ffffe519
!	Starting 10 instruction Store Burst
!	%l1 = 00000000000000ff, Mem[0000000030181400] = 00000000
	stwa	%l1,[%i6+%g0]0x89	! Mem[0000000030181400] = 000000ff

p0_label_84:
!	%l2 = 00000000b30d0000, %l5 = 00000000000000ff, %l3  = 4049c358fea97ab2
	mulx	%l2,%l5,%l3		! %l3 = 000000b259f30000
!	Mem[0000000030001400] = 00000000, %l4 = 0000000000000008
	swapa	[%i0+%g0]0x81,%l4	! %l4 = 0000000000000000
!	%l7 = ffffffffffffffdb, Mem[0000000030081410] = b59aa500
	stba	%l7,[%i2+%o5]0x89	! Mem[0000000030081410] = b59aa5db
!	%l6 = 00000000, %l7 = ffffffdb, Mem[0000000010101410] = ff000000 1835ce8f
	stda	%l6,[%i4+%o5]0x80	! Mem[0000000010101410] = 00000000 ffffffdb
!	Mem[0000000010101404] = 00017013, %l4 = 0000000000000000
	swap	[%i4+0x004],%l4		! %l4 = 0000000000017013
!	%f20 = 00a59ab5 000000af, Mem[0000000010041400] = 35000000 86ff507d
	stda	%f20,[%i1+%g0]0x80	! Mem[0000000010041400] = 00a59ab5 000000af
!	Mem[0000000030081410] = b59aa5db, %l2 = 00000000b30d0000
	swapa	[%i2+%o5]0x89,%l2	! %l2 = 00000000b59aa5db
!	Mem[0000000020800000] = 005f17e8, %l1 = 00000000000000ff
	ldstuba	[%o1+0x000]%asi,%l1	! %l1 = 00000000000000ff
!	%l3 = 000000b259f30000, imm = 00000000000005e2, %l5 = 00000000000000ff
	subc	%l3,0x5e2,%l5		! %l5 = 000000b259f2fa1e
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = 20b3b67600000068, %l7 = ffffffffffffffdb
	ldxa	[%i5+%g0]0x89,%l7	! %l7 = 20b3b67600000068

p0_label_85:
!	%f8  = e9ac274a, %f21 = 000000af, %f15 = 3c9e2629
	fdivs	%f8 ,%f21,%f15		! %f15 = ff800000
!	Mem[0000000010001410] = b6000000 00000000, %l2 = b59aa5db, %l3 = 59f30000
	ldda	[%i0+%o5]0x80,%l2	! %l2 = 00000000b6000000 0000000000000000
!	%l3 = 0000000000000000, immed = fffff7f4, %y  = 00000000
	umul	%l3,-0x80c,%l0		! %l0 = 0000000000000000, %y = 00000000
!	Mem[0000000030181400] = ff000000, %l0 = 0000000000000000
	ldsha	[%i6+%g0]0x81,%l0	! %l0 = ffffffffffffff00
!	Mem[0000000010181410] = 3500885f00000000, %l0 = ffffffffffffff00
	ldx	[%i6+%o5],%l0		! %l0 = 3500885f00000000
!	Mem[0000000030141410] = 53000000, %l5 = 000000b259f2fa1e
	ldsba	[%i5+%o5]0x81,%l5	! %l5 = 0000000000000053
!	Mem[000000001018141c] = 2373ff96, %l1 = 0000000000000000
	ldsba	[%i6+0x01c]%asi,%l1	! %l1 = 0000000000000023
!	Mem[0000000030101400] = ffffffff 5f880035, %l4 = 00017013, %l5 = 00000053
	ldda	[%i4+%g0]0x89,%l4	! %l4 = 000000005f880035 00000000ffffffff
!	Mem[0000000010001400] = ff000000, %l1 = 0000000000000023
	lduwa	[%i0+%g0]0x80,%l1	! %l1 = 00000000ff000000
!	Starting 10 instruction Store Burst
!	%l1 = 00000000ff000000, imm = fffffffffffff553, %l5 = 00000000ffffffff
	xnor	%l1,-0xaad,%l5		! %l5 = 00000000ff000aac

p0_label_86:
!	%l3 = 0000000000000000, Mem[0000000030041408] = ff144bac
	stha	%l3,[%i1+%o4]0x81	! Mem[0000000030041408] = 00004bac
!	Mem[0000000010081410] = 3c411211, %l7 = 20b3b67600000068
	ldstuba	[%i2+%o5]0x80,%l7	! %l7 = 0000003c000000ff
!	Mem[00000000218001c1] = 54e9f4cf, %l2 = 00000000b6000000
	ldstub	[%o3+0x1c1],%l2		! %l2 = 000000e9000000ff
!	%f30 = 00000000 2effe5ff, Mem[0000000010041438] = 0700407a ff0000ff
	std	%f30,[%i1+0x038]	! Mem[0000000010041438] = 00000000 2effe5ff
!	Mem[0000000010001438] = 000000ff, %l7 = 0000003c, %l5 = ff000aac
	add	%i0,0x38,%g1
	casa	[%g1]0x80,%l7,%l5	! %l5 = 00000000000000ff
!	%f16 = 5e5d8668 af83e48b ff400007 4920665d
!	%f20 = 00a59ab5 000000af ffffe519 c971ce8e
!	%f24 = 491588d6 947903e2 00000008 db995109
!	%f28 = 7271fd80 ffdbe53e 00000000 2effe5ff
	stda	%f16,[%i2]ASI_BLK_AIUP	! Block Store to 0000000010081400
!	%l6 = 0000000000000000, Mem[0000000010141408] = 00000000
	stha	%l6,[%i5+%o4]0x80	! Mem[0000000010141408] = 00000000
!	%l3 = 0000000000000000, Mem[0000000010041410] = 00000000ffff0000
	stxa	%l3,[%i1+%o5]0x88	! Mem[0000000010041410] = 0000000000000000
!	%f3  = 0700407a, Mem[0000000010141410] = 35000000
	st	%f3 ,[%i5+%o5]		! Mem[0000000010141410] = 0700407a
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = 00000000, %l4 = 000000005f880035
	ldsha	[%i1+%o5]0x80,%l4	! %l4 = 0000000000000000

p0_label_87:
!	Mem[0000000030141408] = af000000, %f4  = 000000a5
	lda	[%i5+%o4]0x89,%f4 	! %f4 = af000000
!	Mem[00000000218000c0] = 00004926, %l4 = 0000000000000000
	ldsha	[%o3+0x0c0]%asi,%l4	! %l4 = 0000000000000000
	membar	#Sync			! Added by membar checker (17)
!	Mem[0000000010081408] = 070040ff, %l6 = 0000000000000000
	lduha	[%i2+%o4]0x88,%l6	! %l6 = 00000000000040ff
!	Mem[0000000010001408] = 3ee5dbff, %l3 = 0000000000000000
	ldsha	[%i0+%o4]0x88,%l3	! %l3 = ffffffffffffdbff
!	%l3 = ffffffffffffdbff, %l2 = 00000000000000e9, %l6 = 00000000000040ff
	add	%l3,%l2,%l6		! %l6 = ffffffffffffdce8
!	Mem[0000000010141424] = 16ea1aa4, %l5 = 00000000000000ff
	ldsha	[%i5+0x024]%asi,%l5	! %l5 = 00000000000016ea
!	Mem[0000000010041408] = ff000000, %l6 = ffffffffffffdce8
	lduba	[%i1+%o4]0x80,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010181428] = 0418b91c 19e5b62e, %l0 = 00000000, %l1 = ff000000
	ldd	[%i6+0x028],%l0		! %l0 = 000000000418b91c 0000000019e5b62e
!	Mem[000000001004143c] = 2effe5ff, %l5 = 00000000000016ea
	lduw	[%i1+0x03c],%l5		! %l5 = 000000002effe5ff
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000000000, Mem[000000001014143e] = ad8fd493, %asi = 80
	stba	%l4,[%i5+0x03e]%asi	! Mem[000000001014143c] = ad8f0093

p0_label_88:
!	%l6 = 000000ff, %l7 = 0000003c, Mem[00000000100c1410] = 00000000 b30d0000
	stda	%l6,[%i3+0x010]%asi	! Mem[00000000100c1410] = 000000ff 0000003c
!	%l7 = 000000000000003c, Mem[0000000010101410] = 00000000
	stha	%l7,[%i4+%o5]0x80	! Mem[0000000010101410] = 003c0000
!	Mem[00000000201c0001] = 00af19af, %l5 = 000000002effe5ff
	ldstuba	[%o0+0x001]%asi,%l5	! %l5 = 000000af000000ff
!	%l5 = 00000000000000af, Mem[0000000030001410] = 000000ff
	stwa	%l5,[%i0+%o5]0x89	! Mem[0000000030001410] = 000000af
!	%l4 = 0000000000000000, Mem[0000000010101438] = 10ca031c0700407a, %asi = 80
	stxa	%l4,[%i4+0x038]%asi	! Mem[0000000010101438] = 0000000000000000
!	Mem[00000000100c1408] = ff000000, %l0 = 000000000418b91c
	ldstuba	[%i3+%o4]0x80,%l0	! %l0 = 000000ff000000ff
!	Mem[0000000010101410] = 00003c00, %l0 = 00000000000000ff
	ldstuba	[%i4+%o5]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[000000001018140f] = 00004d48, %l0 = 0000000000000000
	ldstuba	[%i6+0x00f]%asi,%l0	! %l0 = 00000048000000ff
!	Mem[0000000010081405] = af83e48b, %l3 = ffffffffffffdbff
	ldstub	[%i2+0x005],%l3		! %l3 = 00000083000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = ffdbe53e, %l0 = 0000000000000048
	ldswa	[%i0+%o4]0x80,%l0	! %l0 = ffffffffffdbe53e

p0_label_89:
!	Mem[00000000300c1408] = 5e5d8668 0700407a, %l4 = 00000000, %l5 = 000000af
	ldda	[%i3+%o4]0x81,%l4	! %l4 = 000000005e5d8668 000000000700407a
!	Mem[00000000300c1408] = 5e5d8668, %l2 = 00000000000000e9
	lduha	[%i3+%o4]0x81,%l2	! %l2 = 0000000000005e5d
!	Mem[00000000100c1434] = 7c901319, %l7 = 000000000000003c
	lduw	[%i3+0x034],%l7		! %l7 = 000000007c901319
!	Mem[00000000100c1408] = ff000000, %l5 = 000000000700407a
	ldsba	[%i3+%o4]0x80,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000010181410] = 3500885f, %l3 = 0000000000000083
	ldswa	[%i6+%o5]0x80,%l3	! %l3 = 000000003500885f
!	Mem[0000000010081410] = 00a59ab5, %f14 = 00000000
	lda	[%i2+%o5]0x80,%f14	! %f14 = 00a59ab5
!	Mem[0000000030001400] = 00000008, %l2 = 0000000000005e5d
	ldswa	[%i0+%g0]0x81,%l2	! %l2 = 0000000000000008
!	Mem[0000000010081428] = 00000008, %l2 = 0000000000000008
	lduwa	[%i2+0x028]%asi,%l2	! %l2 = 0000000000000008
!	Mem[0000000030101408] = ffffffff, %l7 = 000000007c901319
	ldswa	[%i4+%o4]0x89,%l7	! %l7 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	Mem[0000000010001400] = 000000ff, %l5 = ffffffffffffffff
	swapa	[%i0+%g0]0x88,%l5	! %l5 = 00000000000000ff

p0_label_90:
!	%l3 = 000000003500885f, Mem[00000000211c0000] = ffff980d
	sth	%l3,[%o2+%g0]		! Mem[00000000211c0000] = 885f980d
!	%l0 = ffffffffffdbe53e, Mem[0000000010081433] = 7271fd80, %asi = 80
	stba	%l0,[%i2+0x033]%asi	! Mem[0000000010081430] = 7271fd3e
!	Mem[0000000030141410] = 53000000, %l6 = 00000000000000ff
	ldstuba	[%i5+%o5]0x81,%l6	! %l6 = 00000053000000ff
!	Mem[0000000030041408] = 00004bac, %l2 = 0000000000000008
	ldstuba	[%i1+%o4]0x81,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030141410] = 000000ff, %l7 = ffffffffffffffff
	swapa	[%i5+%o5]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010181438] = 003d00b3, %l2 = 0000000000000000
	ldstuba	[%i6+0x038]%asi,%l2	! %l2 = 00000000000000ff
!	%l1 = 0000000019e5b62e, Mem[0000000030081408] = ff4000074920665d
	stxa	%l1,[%i2+%o4]0x81	! Mem[0000000030081408] = 0000000019e5b62e
!	%l4 = 000000005e5d8668, Mem[0000000030141408] = b27dab3aaf000000
	stxa	%l4,[%i5+%o4]0x89	! Mem[0000000030141408] = 000000005e5d8668
!	%l5 = 00000000000000ff, Mem[0000000030081410] = b30d0000
	stba	%l5,[%i2+%o5]0x89	! Mem[0000000030081410] = b30d00ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = 7a400007, %l5 = 00000000000000ff
	ldsha	[%i5+%o5]0x88,%l5	! %l5 = 0000000000000007

p0_label_91:
!	Mem[0000000010141400] = ffffffff, %l7 = 00000000000000ff
	lduha	[%i5+%g0]0x88,%l7	! %l7 = 000000000000ffff
!	Mem[00000000300c1410] = 8a780000, %l4 = 000000005e5d8668
	ldsba	[%i3+%o5]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000030101400] = 3500885f, %f30 = 00000000
	lda	[%i4+%g0]0x81,%f30	! %f30 = 3500885f
!	Mem[0000000030181410] = 480000ff, %l4 = 0000000000000000
	lduba	[%i6+%o5]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[00000000100c1400] = 000000e4, %l3 = 000000003500885f
	ldswa	[%i3+%g0]0x80,%l3	! %l3 = 00000000000000e4
!	Mem[0000000010141430] = b405f584fde3b5f5, %l7 = 000000000000ffff
	ldx	[%i5+0x030],%l7		! %l7 = b405f584fde3b5f5
!	Mem[0000000010181408] = 5e5d8668, %l3 = 00000000000000e4
	ldsha	[%i6+%o4]0x88,%l3	! %l3 = ffffffffffff8668
!	Mem[0000000030081400] = 68865d5e, %f14 = 00a59ab5
	lda	[%i2+%g0]0x89,%f14	! %f14 = 68865d5e
!	Mem[0000000010141408] = 00000000, %f31 = 2effe5ff
	lda	[%i5+%o4]0x88,%f31	! %f31 = 00000000
!	Starting 10 instruction Store Burst
!	%l4 = 000000ff, %l5 = 00000007, Mem[0000000030101408] = ffffffff 00000000
	stda	%l4,[%i4+%o4]0x89	! Mem[0000000030101408] = 000000ff 00000007

p0_label_92:
!	%l3 = ffffffffffff8668, Mem[0000000010001417] = 00000000, %asi = 80
	stba	%l3,[%i0+0x017]%asi	! Mem[0000000010001414] = 00000068
!	Mem[0000000010041400] = b59aa500, %l0 = ffffffffffdbe53e
	swapa	[%i1+%g0]0x88,%l0	! %l0 = 00000000b59aa500
!	Mem[0000000030041400] = ffffe519, %l2 = 0000000000000000
	ldstuba	[%i1+%g0]0x81,%l2	! %l2 = 000000ff000000ff
!	Mem[0000000030181400] = 000000ff, %l6 = 0000000000000053
	swapa	[%i6+%g0]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010101400] = 0000ffff, %l2 = 00000000000000ff
	ldstuba	[%i4+%g0]0x88,%l2	! %l2 = 000000ff000000ff
!	%l3 = ffffffffffff8668, Mem[0000000010081428] = 00000008db995109
	stx	%l3,[%i2+0x028]		! Mem[0000000010081428] = ffffffffffff8668
!	%f16 = 5e5d8668 af83e48b ff400007 4920665d
!	%f20 = 00a59ab5 000000af ffffe519 c971ce8e
!	%f24 = 491588d6 947903e2 00000008 db995109
!	%f28 = 7271fd80 ffdbe53e 3500885f 00000000
	stda	%f16,[%i0]ASI_BLK_P	! Block Store to 0000000010001400
!	%l7 = b405f584fde3b5f5, Mem[0000000010141400] = ffffffff
	stwa	%l7,[%i5+%g0]0x88	! Mem[0000000010141400] = fde3b5f5
!	Mem[0000000030001400] = 00000008, %l0 = 00000000b59aa500
	swapa	[%i0+%g0]0x81,%l0	! %l0 = 0000000000000008
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = 96c473238a780000, %l3 = ffffffffffff8668
	ldxa	[%i3+%o5]0x89,%l3	! %l3 = 96c473238a780000

p0_label_93:
!	Mem[0000000030081400] = 5e5d86688d1e3315, %f14 = 68865d5e ff800000
	ldda	[%i2+%g0]0x81,%f14	! %f14 = 5e5d8668 8d1e3315
!	Mem[0000000010181408] = 68865d5e, %l0 = 0000000000000008
	lduwa	[%i6+%o4]0x80,%l0	! %l0 = 0000000068865d5e
!	Mem[00000000100c1408] = 00000000000000ff, %f0  = 00000000 000000a5
	ldda	[%i3+%o4]0x88,%f0 	! %f0  = 00000000 000000ff
!	Mem[0000000010081400] = 5e5d8668, %l6 = 00000000000000ff
	ldsha	[%i2+%g0]0x80,%l6	! %l6 = 0000000000005e5d
!	Mem[0000000010081410] = 00a59ab5000000af, %f6  = 000000ff 000000e2
	ldda	[%i2+%o5]0x80,%f6 	! %f6  = 00a59ab5 000000af
	membar	#Sync			! Added by membar checker (18)
!	Mem[0000000010001410] = 00a59ab5, %l3 = 96c473238a780000
	ldsba	[%i0+%o5]0x80,%l3	! %l3 = 0000000000000000
!	Mem[00000000100c1408] = ff000000, %f9  = 0d75349a
	lda	[%i3+%o4]0x80,%f9 	! %f9 = ff000000
!	Mem[0000000010181400] = 00000000000000e4, %l7 = b405f584fde3b5f5
	ldxa	[%i6+%g0]0x88,%l7	! %l7 = 00000000000000e4
!	Mem[0000000010041438] = 00000000, %l0 = 0000000068865d5e
	lduba	[%i1+0x039]%asi,%l0	! %l0 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030081408] = 00000000, %l3 = 0000000000000000
	swapa	[%i2+%o4]0x81,%l3	! %l3 = 0000000000000000

p0_label_94:
!	%f0  = 00000000 000000ff, Mem[0000000030181410] = ff000048 8d1e3315
	stda	%f0 ,[%i6+%o5]0x81	! Mem[0000000030181410] = 00000000 000000ff
!	%l2 = 000000ff, %l3 = 00000000, Mem[0000000010141408] = 00000000 2effe5ff
	std	%l2,[%i5+%o4]		! Mem[0000000010141408] = 000000ff 00000000
!	Mem[0000000030041408] = ac4b00ff, %l5 = 0000000000000007
	ldstuba	[%i1+%o4]0x89,%l5	! %l5 = 000000ff000000ff
!	%l3 = 0000000000000000, Mem[0000000020800040] = e4ff226c
	stb	%l3,[%o1+0x040]		! Mem[0000000020800040] = 00ff226c
!	Mem[0000000010141400] = fde3b5f5, %l2 = 00000000000000ff
	ldstuba	[%i5+%g0]0x88,%l2	! %l2 = 000000f5000000ff
!	%l7 = 00000000000000e4, Mem[0000000010041408] = ff000000
	stwa	%l7,[%i1+%o4]0x80	! Mem[0000000010041408] = 000000e4
!	%l1 = 0000000019e5b62e, Mem[00000000211c0000] = 885f980d, %asi = 80
	stba	%l1,[%o2+0x000]%asi	! Mem[00000000211c0000] = 2e5f980d
!	Mem[0000000030141400] = 00000068, %l6 = 0000000000005e5d
	swapa	[%i5+%g0]0x89,%l6	! %l6 = 0000000000000068
!	Mem[0000000030101400] = 3500885f, %l1 = 0000000019e5b62e
	ldstuba	[%i4+%g0]0x81,%l1	! %l1 = 00000035000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010141428] = 5d662049, %l0 = 0000000000000000
	ldswa	[%i5+0x028]%asi,%l0	! %l0 = 000000005d662049

p0_label_95:
!	%l0 = 000000005d662049, imm = 0000000000000c08, %l0 = 000000005d662049
	orn	%l0,0xc08,%l0		! %l0 = fffffffffffff3ff
!	Mem[0000000010001410] = 00a59ab5000000af, %l0 = fffffffffffff3ff
	ldxa	[%i0+0x010]%asi,%l0	! %l0 = 00a59ab5000000af
!	%l7 = 00000000000000e4, imm = ffffffffffffff0c, %l4 = 00000000000000ff
	andn	%l7,-0x0f4,%l4		! %l4 = 00000000000000e0
!	Mem[0000000010001410] = b59aa500, %l7 = 00000000000000e4
	lduwa	[%i0+%o5]0x88,%l7	! %l7 = 00000000b59aa500
!	Mem[00000000100c1410] = ff000000, %l7 = 00000000b59aa500
	lduwa	[%i3+%o5]0x88,%l7	! %l7 = 00000000ff000000
!	Mem[0000000030141408] = 68865d5e, %l7 = 00000000ff000000
	lduba	[%i5+%o4]0x81,%l7	! %l7 = 0000000000000068
!	Mem[0000000030181400] = 53000000, %l3 = 0000000000000000
	ldsha	[%i6+%g0]0x81,%l3	! %l3 = 0000000000005300
!	Mem[0000000010101408] = ffffffaf000000ff, %l5 = 00000000000000ff
	ldxa	[%i4+%o4]0x88,%l5	! %l5 = ffffffaf000000ff
!	Mem[0000000010081438] = 00000000, %l2 = 00000000000000f5
	lduwa	[%i2+0x038]%asi,%l2	! %l2 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l6 = 00000068, %l7 = 00000068, Mem[0000000010081400] = 5e5d8668 afffe48b
	stda	%l6,[%i2+%g0]0x80	! Mem[0000000010081400] = 00000068 00000068

p0_label_96:
!	Mem[0000000010001400] = 68865d5e, %l3 = 0000000000005300
	swapa	[%i0+%g0]0x88,%l3	! %l3 = 0000000068865d5e
!	%f20 = 00a59ab5 000000af, %l3 = 0000000068865d5e
!	Mem[0000000010041420] = 00000000940a9807
	add	%i1,0x020,%g1
	stda	%f20,[%g1+%l3]ASI_PST32_PL ! Mem[0000000010041420] = 00000000b59aa500
!	Mem[000000001018141d] = 2373ff96, %l0 = 00a59ab5000000af
	ldstuba	[%i6+0x01d]%asi,%l0	! %l0 = 00000073000000ff
!	Mem[00000000100c1410] = 000000ff, %l7 = 0000000000000068
	swapa	[%i3+%o5]0x80,%l7	! %l7 = 00000000000000ff
!	%l5 = ffffffaf000000ff, Mem[0000000030181408] = 74ffd1b4ff000000
	stxa	%l5,[%i6+%o4]0x89	! Mem[0000000030181408] = ffffffaf000000ff
!	Mem[0000000010001428] = 00000008, %l3 = 68865d5e, %l1 = 00000035
	add	%i0,0x28,%g1
	casa	[%g1]0x80,%l3,%l1	! %l1 = 0000000000000008
!	%l4 = 00000000000000e0, Mem[0000000010081410] = b59aa500
	stwa	%l4,[%i2+%o5]0x88	! Mem[0000000010081410] = 000000e0
!	%f0  = 00000000 000000ff, Mem[0000000010101400] = 0000ffff 00000000
	stda	%f0 ,[%i4+%g0]0x88	! Mem[0000000010101400] = 00000000 000000ff
!	%f16 = 5e5d8668 af83e48b, %l3 = 0000000068865d5e
!	Mem[0000000030081408] = 0000000019e5b62e
	add	%i2,0x008,%g1
	stda	%f16,[%g1+%l3]ASI_PST8_S ! Mem[0000000030081408] = 005d0068af83e42e
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = 8a780000, %l1 = 0000000000000008
	ldsba	[%i3+%o5]0x89,%l1	! %l1 = 0000000000000000

p0_label_97:
!	Mem[0000000030101408] = ff000000, %f27 = db995109
	lda	[%i4+%o4]0x81,%f27	! %f27 = ff000000
!	Mem[00000000300c1410] = 0000788a, %l3 = 0000000068865d5e
	ldsba	[%i3+%o5]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000010001408] = ff400007 4920665d, %l6 = 00000068, %l7 = 000000ff
	ldda	[%i0+%o4]0x80,%l6	! %l6 = 00000000ff400007 000000004920665d
!	Mem[0000000010081438] = 000000002effe5ff, %f2  = c6dbb91c 0700407a
	ldda	[%i2+0x038]%asi,%f2 	! %f2  = 00000000 2effe5ff
!	Mem[0000000010181428] = 0418b91c19e5b62e, %l3 = 0000000000000000
	ldxa	[%i6+0x028]%asi,%l3	! %l3 = 0418b91c19e5b62e
!	Mem[0000000030141408] = 5e5d8668, %l0 = 0000000000000073
	ldsba	[%i5+%o4]0x89,%l0	! %l0 = 0000000000000068
!	Mem[0000000030181400] = 00000053, %l1 = 0000000000000000
	ldsba	[%i6+%g0]0x89,%l1	! %l1 = 0000000000000053
!	Mem[0000000010081410] = e0000000, %l6 = 00000000ff400007
	ldsha	[%i2+0x012]%asi,%l6	! %l6 = 0000000000000000
!	Mem[0000000010181410] = 3500885f, %l4 = 00000000000000e0
	lduha	[%i6+%o5]0x80,%l4	! %l4 = 0000000000003500
!	Starting 10 instruction Store Burst
!	%l0 = 0000000000000068, Mem[0000000030001408] = 08000000
	stha	%l0,[%i0+%o4]0x89	! Mem[0000000030001408] = 08000068

p0_label_98:
!	%f20 = 00a59ab5 000000af, Mem[0000000010081420] = 491588d6 947903e2
	std	%f20,[%i2+0x020]	! Mem[0000000010081420] = 00a59ab5 000000af
!	%f13 = 1112413c, Mem[0000000030101410] = 00000000
	sta	%f13,[%i4+%o5]0x89	! Mem[0000000030101410] = 1112413c
!	%l3 = 0418b91c19e5b62e, Mem[0000000030141410] = ffffffff
	stwa	%l3,[%i5+%o5]0x89	! Mem[0000000030141410] = 19e5b62e
!	Mem[0000000030101400] = ff00885f, %l0 = 0000000000000068
	ldstuba	[%i4+%g0]0x81,%l0	! %l0 = 000000ff000000ff
!	Mem[0000000010141410] = 0700407a, %l2 = 0000000000000000
	ldstub	[%i5+%o5],%l2		! %l2 = 00000007000000ff
!	Mem[0000000030001410] = af000000, %l7 = 000000004920665d
	ldstuba	[%i0+%o5]0x81,%l7	! %l7 = 000000af000000ff
!	%l2 = 0000000000000007, Mem[00000000100c1400] = 000000e4
	stba	%l2,[%i3+%g0]0x80	! Mem[00000000100c1400] = 070000e4
!	%l7 = 00000000000000af, Mem[0000000030141408] = 000000005e5d8668
	stxa	%l7,[%i5+%o4]0x89	! Mem[0000000030141408] = 00000000000000af
!	%l1 = 0000000000000053, Mem[0000000030001400] = b59aa500
	stha	%l1,[%i0+%g0]0x81	! Mem[0000000030001400] = 0053a500
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = 7a40000768865d5e, %l6 = 0000000000000000
	ldxa	[%i3+%o4]0x89,%l6	! %l6 = 7a40000768865d5e

p0_label_99:
!	Mem[0000000010101438] = 0000000000000000, %f14 = 5e5d8668 8d1e3315
	ldd	[%i4+0x038],%f14	! %f14 = 00000000 00000000
!	Mem[00000000100c1400] = 070000e4, %l0 = 00000000000000ff
	lduha	[%i3+%g0]0x80,%l0	! %l0 = 0000000000000700
!	Mem[000000001008140c] = 4920665d, %f25 = 947903e2
	lda	[%i2+0x00c]%asi,%f25	! %f25 = 4920665d
!	Mem[0000000030081410] = ff000db3, %l5 = ffffffaf000000ff
	lduwa	[%i2+%o5]0x81,%l5	! %l5 = 00000000ff000db3
!	Mem[00000000300c1410] = 0000788a2373c496, %f6  = 00a59ab5 000000af
	ldda	[%i3+%o5]0x81,%f6 	! %f6  = 0000788a 2373c496
!	Mem[0000000010101410] = 00003cff, %l6 = 7a40000768865d5e
	ldsha	[%i4+%o5]0x88,%l6	! %l6 = 0000000000003cff
!	Mem[0000000030181408] = ff000000, %l1 = 0000000000000053
	ldswa	[%i6+%o4]0x81,%l1	! %l1 = ffffffffff000000
!	Mem[0000000010081410] = 000000e0, %l1 = ffffffffff000000
	ldswa	[%i2+%o5]0x88,%l1	! %l1 = 00000000000000e0
!	Mem[00000000211c0000] = 2e5f980d, %l0 = 0000000000000700
	ldsb	[%o2+0x001],%l0		! %l0 = 000000000000005f
!	Starting 10 instruction Store Burst
!	Mem[0000000030141408] = 000000af, %l4 = 0000000000003500
	swapa	[%i5+%o4]0x89,%l4	! %l4 = 00000000000000af

p0_label_100:
!	%f31 = 00000000, Mem[00000000300c1408] = 5e5d8668
	sta	%f31,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00000000
!	Mem[000000001000142c] = db995109, %l1 = 00000000000000e0
	swap	[%i0+0x02c],%l1		! %l1 = 00000000db995109
!	%l5 = 00000000ff000db3, Mem[0000000010041400] = ffdbe53e
	stwa	%l5,[%i1+%g0]0x88	! Mem[0000000010041400] = ff000db3
!	Mem[0000000030001410] = ff000000, %l7 = 00000000000000af
	swapa	[%i0+%o5]0x81,%l7	! %l7 = 00000000ff000000
!	%l7 = 00000000ff000000, Mem[0000000030101410] = 3c41121180fd7172
	stxa	%l7,[%i4+%o5]0x81	! Mem[0000000030101410] = 00000000ff000000
!	%l3 = 0418b91c19e5b62e, Mem[0000000010181408] = 68865d5e00004dff
	stxa	%l3,[%i6+%o4]0x80	! Mem[0000000010181408] = 0418b91c19e5b62e
!	%f6  = 0000788a 2373c496, %l1 = 00000000db995109
!	Mem[0000000030041430] = 7537166b25f0a633
	add	%i1,0x030,%g1
	stda	%f6,[%g1+%l1]ASI_PST16_SL ! Mem[0000000030041430] = 96c4166b25f00000
!	%l1 = 00000000db995109, Mem[00000000211c0001] = 2e5f980d
	stb	%l1,[%o2+0x001]		! Mem[00000000211c0000] = 2e09980d
!	%l4 = 00000000000000af, Mem[0000000030141410] = 2eb6e51900000000
	stxa	%l4,[%i5+%o5]0x81	! Mem[0000000030141410] = 00000000000000af
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = ff400007, %l7 = 00000000ff000000
	ldub	[%i2+%o4],%l7		! %l7 = 00000000000000ff

p0_label_101:
!	Mem[00000000100c1408] = ff000000, %l6 = 0000000000003cff
	ldsw	[%i3+%o4],%l6		! %l6 = ffffffffff000000
!	Mem[0000000010141408] = ff000000, %l4 = 00000000000000af
	ldsba	[%i5+%o4]0x88,%l4	! %l4 = 0000000000000000
!	Mem[00000000100c1410] = 00000068, %l2 = 0000000000000007
	lduwa	[%i3+%o5]0x80,%l2	! %l2 = 0000000000000068
!	%l5 = 00000000ff000db3, immd = fffffffffffff570, %l7  = 00000000000000ff
	mulx	%l5,-0xa90,%l7		! %l7 = fffff57a8f6f4d50
!	Mem[0000000010081400] = 68000000, %l6 = ffffffffff000000
	ldsha	[%i2+%g0]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000030141410] = 00000000, %l0 = 000000000000005f
	lduha	[%i5+%o5]0x89,%l0	! %l0 = 0000000000000000
!	Mem[00000000300c1400] = 00000000, %l4 = 0000000000000000
	lduha	[%i3+%g0]0x89,%l4	! %l4 = 0000000000000000
!	Mem[00000000300c1408] = 00000000, %l7 = fffff57a8f6f4d50
	lduba	[%i3+%o4]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000010141410] = ff00407a84000000, %f4  = af000000 2373c496
	ldda	[%i5+%o5]0x80,%f4 	! %f4  = ff00407a 84000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010081410] = 000000e0, %l4 = 0000000000000000
	ldstuba	[%i2+%o5]0x88,%l4	! %l4 = 000000e0000000ff

p0_label_102:
!	%l4 = 00000000000000e0, Mem[00000000100c1426] = 02283563, %asi = 80
	stha	%l4,[%i3+0x026]%asi	! Mem[00000000100c1424] = 022800e0
!	%l6 = 0000000000000000, Mem[0000000010081400] = 00000068
	stba	%l6,[%i2+%g0]0x80	! Mem[0000000010081400] = 00000068
!	%l5 = 00000000ff000db3, Mem[0000000010181420] = 0000000022407501, %asi = 80
	stxa	%l5,[%i6+0x020]%asi	! Mem[0000000010181420] = 00000000ff000db3
!	%l0 = 00000000, %l1 = db995109, Mem[0000000010141400] = fde3b5ff 000000ff
	stda	%l0,[%i5+%g0]0x88	! Mem[0000000010141400] = 00000000 db995109
!	Mem[0000000010001410] = 00a59ab5, %l3 = 0418b91c19e5b62e
	ldstuba	[%i0+%o5]0x80,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030101410] = 00000000, %l4 = 00000000000000e0
	ldstuba	[%i4+%o5]0x89,%l4	! %l4 = 00000000000000ff
!	%f3  = 2effe5ff, Mem[0000000010001410] = ffa59ab5
	sta	%f3 ,[%i0+%o5]0x80	! Mem[0000000010001410] = 2effe5ff
!	%f16 = 5e5d8668 af83e48b ff400007 4920665d
!	%f20 = 00a59ab5 000000af ffffe519 c971ce8e
!	%f24 = 491588d6 4920665d 00000008 ff000000
!	%f28 = 7271fd80 ffdbe53e 3500885f 00000000
	stda	%f16,[%i0]ASI_COMMIT_S	! Block Store to 0000000030001400
	membar	#Sync			! Added by membar checker (19)
!	Mem[0000000010001420] = 491588d6, %l1 = db995109, %l0 = 00000000
	add	%i0,0x20,%g1
	casa	[%g1]0x80,%l1,%l0	! %l0 = 00000000491588d6
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = 00530000, %f30 = 3500885f
	lda	[%i0+0x000]%asi,%f30	! %f30 = 00530000

p0_label_103:
!	Mem[0000000010141420] = fbc755fb 16ea1aa4, %l4 = 00000000, %l5 = ff000db3
	ldda	[%i5+0x020]%asi,%l4	! %l4 = 00000000fbc755fb 0000000016ea1aa4
!	Mem[0000000030081408] = 68005d00, %l2 = 0000000000000068
	lduba	[%i2+%o4]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000020800000] = ff5f17e8, %l3 = 0000000000000000
	lduba	[%o1+0x001]%asi,%l3	! %l3 = 000000000000005f
!	Mem[0000000010081410] = ff000000, %l4 = 00000000fbc755fb
	lduba	[%i2+0x013]%asi,%l4	! %l4 = 0000000000000000
!	Mem[0000000030141408] = 0000000000003500, %f4  = ff00407a 84000000
	ldda	[%i5+%o4]0x89,%f4 	! %f4  = 00000000 00003500
!	Mem[0000000030181408] = ffffffaf 000000ff, %l0 = 491588d6, %l1 = db995109
	ldda	[%i6+%o4]0x89,%l0	! %l0 = 00000000000000ff 00000000ffffffaf
!	Mem[00000000100c1400] = 070000e4, %l7 = 0000000000000000
	ldub	[%i3+%g0],%l7		! %l7 = 0000000000000007
!	%f1  = 000000ff, %f5  = 00003500
	fcmps	%fcc1,%f1 ,%f5 		! %fcc1 = 1
!	Mem[0000000010141418] = b74204f1, %l6 = 0000000000000000
	lduh	[%i5+0x018],%l6		! %l6 = 000000000000b742
!	Starting 10 instruction Store Burst
!	Mem[0000000010141402] = 00000000, %l2 = 0000000000000000
	ldstub	[%i5+0x002],%l2		! %l2 = 00000000000000ff

p0_label_104:
!	Mem[0000000030101400] = 5f8800ff, %l3 = 000000000000005f
	swapa	[%i4+%g0]0x89,%l3	! %l3 = 000000005f8800ff
!	Mem[0000000010001410] = ffe5ff2e, %l0 = 00000000000000ff
	ldstuba	[%i0+%o5]0x88,%l0	! %l0 = 0000002e000000ff
!	%f18 = ff400007, Mem[00000000100c1410] = 00000068
	sta	%f18,[%i3+%o5]0x80	! Mem[00000000100c1410] = ff400007
!	%l5 = 0000000016ea1aa4, Mem[0000000010001400] = 00530000
	stha	%l5,[%i0+%g0]0x80	! Mem[0000000010001400] = 1aa40000
!	Mem[000000001014140b] = 000000ff, %l7 = 0000000000000007
	ldstuba	[%i5+0x00b]%asi,%l7	! %l7 = 000000ff000000ff
!	Mem[0000000030041410] = 00000000, %l0 = 000000000000002e
	swapa	[%i1+%o5]0x81,%l0	! %l0 = 0000000000000000
!	%l3 = 000000005f8800ff, Mem[0000000030141408] = 00350000
	stba	%l3,[%i5+%o4]0x81	! Mem[0000000030141408] = ff350000
!	%l2 = 0000000000000000, Mem[0000000010081408] = ff400007
	stw	%l2,[%i2+%o4]		! Mem[0000000010081408] = 00000000
!	%f2  = 00000000, Mem[0000000010081414] = 000000af
	st	%f2 ,[%i2+0x014]	! Mem[0000000010081414] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010141430] = b405f584, %l0 = 0000000000000000
	ldsha	[%i5+0x032]%asi,%l0	! %l0 = fffffffffffff584

p0_label_105:
!	Mem[0000000030181408] = ff000000, %l2 = 0000000000000000
	lduha	[%i6+%o4]0x81,%l2	! %l2 = 000000000000ff00
!	Mem[0000000030041400] = 19e5ffff, %f11 = 9c159b6e
	lda	[%i1+%g0]0x89,%f11	! %f11 = 19e5ffff
!	Mem[0000000030081410] = ff000db3, %l7 = 00000000000000ff
	lduwa	[%i2+%o5]0x81,%l7	! %l7 = 00000000ff000db3
!	%l3 = 000000005f8800ff, imm = fffffffffffff429, %l6 = 000000000000b742
	orn	%l3,-0xbd7,%l6		! %l6 = 000000005f880bff
!	Mem[0000000030001410] = af000000b59aa500, %l0 = fffffffffffff584
	ldxa	[%i0+%o5]0x89,%l0	! %l0 = af000000b59aa500
!	%l3 = 000000005f8800ff, immd = 0000000000000382, %l2 = 000000000000ff00
	udivx	%l3,0x382,%l2		! %l2 = 00000000001b3bde
!	Mem[0000000010081408] = 5d66204900000000, %f26 = 00000008 ff000000
	ldda	[%i2+%o4]0x88,%f26	! %f26 = 5d662049 00000000
!	Mem[00000000100c1408] = 000000ff, %l3 = 000000005f8800ff
	ldsba	[%i3+%o4]0x88,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010141400] = 00ff0000, %l6 = 000000005f880bff
	ldsba	[%i5+%g0]0x88,%l6	! %l6 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f12 = 6298e50c 1112413c, Mem[0000000010081400] = 00000068 00000068
	stda	%f12,[%i2+%g0]0x80	! Mem[0000000010081400] = 6298e50c 1112413c

p0_label_106:
!	%l4 = 00000000, %l5 = 16ea1aa4, Mem[0000000010041410] = 00000000 00000000
	stda	%l4,[%i1+%o5]0x88	! Mem[0000000010041410] = 00000000 16ea1aa4
!	%l0 = af000000b59aa500, Mem[0000000010141400] = 00ff0000
	stwa	%l0,[%i5+%g0]0x88	! Mem[0000000010141400] = b59aa500
!	%l2 = 00000000001b3bde, Mem[0000000030141408] = ff350000
	stba	%l2,[%i5+%o4]0x81	! Mem[0000000030141408] = de350000
!	%l5 = 0000000016ea1aa4, Mem[00000000218001c0] = 54fff4cf, %asi = 80
	stha	%l5,[%o3+0x1c0]%asi	! Mem[00000000218001c0] = 1aa4f4cf
!	%l3 = ffffffffffffffff, imm = 0000000000000d8e, %l0 = af000000b59aa500
	xnor	%l3,0xd8e,%l0		! %l0 = 0000000000000d8e
!	%f8  = e9ac274a ff000000, Mem[0000000010101400] = 000000ff 00000000
	stda	%f8 ,[%i4+%g0]0x88	! Mem[0000000010101400] = e9ac274a ff000000
!	Mem[0000000030001410] = 00a59ab5, %l3 = ffffffffffffffff
	swapa	[%i0+%o5]0x81,%l3	! %l3 = 0000000000a59ab5
!	%f30 = 00530000 00000000, %l5 = 0000000016ea1aa4
!	Mem[0000000030101410] = ff000000ff000000
	add	%i4,0x010,%g1
	stda	%f30,[%g1+%l5]ASI_PST32_S ! Mem[0000000030101410] = ff000000ff000000
!	Mem[0000000010101400] = 000000ff, %l4 = 00000000, %l1 = ffffffaf
	casa	[%i4]0x80,%l4,%l1	! %l1 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = ff00000007000000, %l1 = 00000000000000ff
	ldxa	[%i4+%o4]0x81,%l1	! %l1 = ff00000007000000

p0_label_107:
!	Mem[00000000300c1408] = 00000000, %l6 = 0000000000000000
	lduwa	[%i3+%o4]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000030181410] = 00000000 000000ff, %l6 = 00000000, %l7 = ff000db3
	ldda	[%i6+%o5]0x81,%l6	! %l6 = 0000000000000000 00000000000000ff
!	Mem[0000000030081408] = 005d0068af83e42e, %l6 = 0000000000000000
	ldxa	[%i2+%o4]0x81,%l6	! %l6 = 005d0068af83e42e
!	Mem[0000000030001410] = ffffffff, %l3 = 0000000000a59ab5
	lduha	[%i0+%o5]0x81,%l3	! %l3 = 000000000000ffff
!	Mem[00000000100c1400] = 070000e4, %f8  = e9ac274a
	lda	[%i3+%g0]0x80,%f8 	! %f8 = 070000e4
!	Mem[0000000020800000] = ff5f17e8, %l0 = 0000000000000d8e
	ldsh	[%o1+%g0],%l0		! %l0 = ffffffffffffff5f
!	Mem[00000000100c1430] = 3e645548, %l7 = 00000000000000ff
	ldsh	[%i3+0x030],%l7		! %l7 = 0000000000003e64
!	Mem[0000000021800080] = 6933c3e5, %l6 = 005d0068af83e42e
	lduha	[%o3+0x080]%asi,%l6	! %l6 = 0000000000006933
!	Mem[0000000030141408] = de350000 00000000, %l6 = 00006933, %l7 = 00003e64
	ldda	[%i5+%o4]0x81,%l6	! %l6 = 00000000de350000 0000000000000000
!	Starting 10 instruction Store Burst
!	%l2 = 00000000001b3bde, Mem[0000000010001410] = ffffe5ff
	stwa	%l2,[%i0+%o5]0x80	! Mem[0000000010001410] = 001b3bde

p0_label_108:
!	%f8  = 070000e4, Mem[0000000010041404] = 000000af
	st	%f8 ,[%i1+0x004]	! Mem[0000000010041404] = 070000e4
!	Mem[00000000211c0001] = 2e09980d, %l2 = 00000000001b3bde
	ldstuba	[%o2+0x001]%asi,%l2	! %l2 = 00000009000000ff
!	Code Fragment 4
p0_fragment_5:
!	%l0 = ffffffffffffff5f
	setx	0xbb61db1fa30e62d4,%g7,%l0 ! %l0 = bb61db1fa30e62d4
!	%l1 = ff00000007000000
	setx	0x470505485483d44d,%g7,%l1 ! %l1 = 470505485483d44d
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = bb61db1fa30e62d4
	setx	0x51b55867cd975f17,%g7,%l0 ! %l0 = 51b55867cd975f17
!	%l1 = 470505485483d44d
	setx	0xa0b4aa586d053bd5,%g7,%l1 ! %l1 = a0b4aa586d053bd5
!	%l3 = 000000000000ffff, Mem[0000000010081408] = 00000000
	stwa	%l3,[%i2+%o4]0x80	! Mem[0000000010081408] = 0000ffff
!	%f4  = 00000000 00003500, Mem[0000000010081428] = ffffffff ffff8668
	std	%f4 ,[%i2+0x028]	! Mem[0000000010081428] = 00000000 00003500
!	Mem[0000000030081408] = 005d0068, %l1 = a0b4aa586d053bd5
	swapa	[%i2+%o4]0x81,%l1	! %l1 = 00000000005d0068
!	%f0  = 00000000, Mem[0000000010141408] = ff000000
	sta	%f0 ,[%i5+%o4]0x88	! Mem[0000000010141408] = 00000000
!	%f22 = ffffe519 c971ce8e, %f27 = 00000000
	fdtoi	%f22,%f27		! %f27 = 80000000
!	%l1 = 00000000005d0068, Mem[0000000010041410] = 00000000
	stha	%l1,[%i1+%o5]0x80	! Mem[0000000010041410] = 00680000
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = 0000788a, %l5 = 0000000016ea1aa4
	ldsha	[%i3+%o5]0x81,%l5	! %l5 = 0000000000000000

p0_label_109:
!	Mem[0000000010081400] = 3c4112110ce59862, %f18 = ff400007 4920665d
	ldda	[%i2+%g0]0x88,%f18	! %f18 = 3c411211 0ce59862
!	Mem[00000000100c1408] = ff000000, %l6 = 00000000de350000
	lduba	[%i3+%o4]0x80,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030001408] = 5d662049070040ff, %l2 = 0000000000000009
	ldxa	[%i0+%o4]0x89,%l2	! %l2 = 5d662049070040ff
!	Mem[0000000010081400] = 3c4112110ce59862, %l7 = 0000000000000000
	ldxa	[%i2+%g0]0x88,%l7	! %l7 = 3c4112110ce59862
!	Mem[0000000030181408] = ff000000, %l7 = 3c4112110ce59862
	lduba	[%i6+%o4]0x81,%l7	! %l7 = 00000000000000ff
!	Mem[00000000100c1408] = 000000ff, %l4 = 0000000000000000
	lduha	[%i3+%o4]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[00000000300c1408] = 00000000, %l5 = 0000000000000000
	ldswa	[%i3+%o4]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000030081408] = d53b056d, %l3 = 000000000000ffff
	lduba	[%i2+%o4]0x89,%l3	! %l3 = 000000000000006d
!	Mem[0000000010041400] = b30d00ff, %l7 = 00000000000000ff
	lduha	[%i1+%g0]0x80,%l7	! %l7 = 000000000000b30d
!	Starting 10 instruction Store Burst
!	Mem[0000000010041424] = b59aa500, %l7 = 0000b30d, %l0 = cd975f17
	add	%i1,0x24,%g1
	casa	[%g1]0x80,%l7,%l0	! %l0 = 00000000b59aa500

p0_label_110:
!	%l2 = 5d662049070040ff, Mem[0000000010141408] = 00000000
	stha	%l2,[%i5+%o4]0x88	! Mem[0000000010141408] = 000040ff
!	%f0  = 00000000 000000ff, Mem[0000000030001410] = ffffffff 000000af
	stda	%f0 ,[%i0+%o5]0x81	! Mem[0000000030001410] = 00000000 000000ff
!	Mem[0000000030101400] = 5f000000, %l2 = 5d662049070040ff
	ldstuba	[%i4+%g0]0x81,%l2	! %l2 = 0000005f000000ff
!	%l1 = 00000000005d0068, Mem[0000000010101400] = 000000ff
	stwa	%l1,[%i4+%g0]0x80	! Mem[0000000010101400] = 005d0068
!	%l2 = 000000000000005f, Mem[0000000010041400] = e4000007ff000db3
	stxa	%l2,[%i1+%g0]0x88	! Mem[0000000010041400] = 000000000000005f
!	%l0 = 00000000b59aa500, Mem[0000000010181420] = 00000000ff000db3, %asi = 80
	stxa	%l0,[%i6+0x020]%asi	! Mem[0000000010181420] = 00000000b59aa500
!	Code Fragment 3
p0_fragment_6:
!	%l0 = 00000000b59aa500
	setx	0x56f20890335b628e,%g7,%l0 ! %l0 = 56f20890335b628e
!	%l1 = 00000000005d0068
	setx	0xaeab7ac842144721,%g7,%l1 ! %l1 = aeab7ac842144721
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 56f20890335b628e
	setx	0x67416fcff9d30462,%g7,%l0 ! %l0 = 67416fcff9d30462
!	%l1 = aeab7ac842144721
	setx	0x3f8f9fcfcc68103b,%g7,%l1 ! %l1 = 3f8f9fcfcc68103b
!	%f8  = 070000e4, Mem[0000000010041414] = a41aea16
	sta	%f8 ,[%i1+0x014]%asi	! Mem[0000000010041414] = 070000e4
!	%l3 = 000000000000006d, Mem[000000001010143c] = 00000000, %asi = 80
	stha	%l3,[%i4+0x03c]%asi	! Mem[000000001010143c] = 006d0000
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = 68005d00, %l2 = 000000000000005f
	lduba	[%i4+%g0]0x88,%l2	! %l2 = 0000000000000000

p0_label_111:
!	Mem[0000000010081410] = ff000000, %f25 = 4920665d
	lda	[%i2+%o5]0x80,%f25	! %f25 = ff000000
!	Mem[00000000300c1410] = 0000788a, %l2 = 0000000000000000
	lduha	[%i3+%o5]0x81,%l2	! %l2 = 0000000000000000
!	%f5  = 00003500, %f25 = ff000000
	fsqrts	%f5 ,%f25		! %l0 = 67416fcff9d30484, Unfinished, %fsr = 2500000000
!	Mem[0000000030041410] = 0000002e484d7c90, %f0  = 00000000 000000ff
	ldda	[%i1+%o5]0x81,%f0 	! %f0  = 0000002e 484d7c90
!	Mem[0000000030101408] = ff000000, %l4 = 00000000000000ff
	ldswa	[%i4+%o4]0x81,%l4	! %l4 = ffffffffff000000
!	Mem[00000000100c1410] = ff400007, %l4 = ffffffffff000000
	ldsba	[%i3+%o5]0x80,%l4	! %l4 = ffffffffffffffff
!	Mem[00000000100c1424] = 022800e0, %l7 = 000000000000b30d
	ldswa	[%i3+0x024]%asi,%l7	! %l7 = 00000000022800e0
!	%l0 = 67416fcff9d30484, imm = 0000000000000045, %l1 = 3f8f9fcfcc68103b
	subc	%l0,0x045,%l1		! %l1 = 67416fcff9d3043f
!	Mem[0000000010041408] = 000000e4 b59aa8d4, %l0 = f9d30484, %l1 = f9d3043f
	ldda	[%i1+%o4]0x80,%l0	! %l0 = 00000000000000e4 00000000b59aa8d4
!	Starting 10 instruction Store Burst
!	%f30 = 00530000 00000000, Mem[0000000030001400] = 68865d5e 8be483af
	stda	%f30,[%i0+%g0]0x89	! Mem[0000000030001400] = 00530000 00000000

p0_label_112:
!	%l6 = 00000000000000ff, Mem[00000000100c1408] = ff000000
	stwa	%l6,[%i3+%o4]0x80	! Mem[00000000100c1408] = 000000ff
!	Mem[0000000010181428] = 0418b91c19e5b62e, %l1 = 00000000b59aa8d4, %l2 = 0000000000000000
	add	%i6,0x28,%g1
	casxa	[%g1]0x80,%l1,%l2	! %l2 = 0418b91c19e5b62e
!	Mem[0000000030181400] = 53000000, %l5 = 0000000000000000
	swapa	[%i6+%g0]0x81,%l5	! %l5 = 0000000053000000
!	%l2 = 0418b91c19e5b62e, Mem[0000000030001408] = ff400007
	stwa	%l2,[%i0+%o4]0x81	! Mem[0000000030001408] = 19e5b62e
!	%l7 = 00000000022800e0, Mem[0000000030181410] = 00000000
	stha	%l7,[%i6+%o5]0x81	! Mem[0000000030181410] = 00e00000
!	%l2 = 19e5b62e, %l3 = 0000006d, Mem[0000000010141400] = b59aa500 db995109
	stda	%l2,[%i5+%g0]0x88	! Mem[0000000010141400] = 19e5b62e 0000006d
!	Mem[00000000100c1400] = e4000007, %l7 = 00000000022800e0
	swapa	[%i3+%g0]0x88,%l7	! %l7 = 00000000e4000007
!	Mem[0000000030041400] = ffffe519, %l4 = ffffffffffffffff
	ldstuba	[%i1+%g0]0x81,%l4	! %l4 = 000000ff000000ff
!	Mem[0000000030141400] = 00005e5d, %l0 = 00000000000000e4
	swapa	[%i5+%g0]0x89,%l0	! %l0 = 0000000000005e5d
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (20)
!	Mem[00000000100c1400] = e0002802 00000068 000000ff 00000000
!	Mem[00000000100c1410] = ff400007 0000003c e137cf03 9237c966
!	Mem[00000000100c1420] = af83e48b 022800e0 e27e2b41 f2aa7756
!	Mem[00000000100c1430] = 3e645548 7c901319 10ca031c 0700407a
	ldda	[%i3]ASI_BLK_AIUP,%f0	! Block Load from 00000000100c1400

p0_label_113:
!	Mem[0000000010141410] = ff00407a, %l7 = 00000000e4000007
	ldsha	[%i5+0x012]%asi,%l7	! %l7 = 000000000000407a
!	Mem[0000000010001420] = 491588d6947903e2, %l3 = 000000000000006d
	ldx	[%i0+0x020],%l3		! %l3 = 491588d6947903e2
!	Mem[0000000010001410] = 001b3bde, %l7 = 000000000000407a
	lduba	[%i0+%o5]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000010101408] = 000000ff, %l7 = 0000000000000000
	lduha	[%i4+%o4]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010101408] = ff000000afffffff, %f18 = 3c411211 0ce59862
	ldd	[%i4+%o4],%f18		! %f18 = ff000000 afffffff
!	Mem[00000000201c0000] = 00ff19af, %l7 = 00000000000000ff
	lduh	[%o0+%g0],%l7		! %l7 = 00000000000000ff
!	Mem[0000000030001410] = 00000000 000000ff, %l0 = 00005e5d, %l1 = b59aa8d4
	ldda	[%i0+%o5]0x81,%l0	! %l0 = 0000000000000000 00000000000000ff
!	Mem[00000000201c0000] = 00ff19af, %l7 = 00000000000000ff
	lduba	[%o0+0x001]%asi,%l7	! %l7 = 00000000000000ff
!	Code Fragment 3
p0_fragment_7:
!	%l0 = 0000000000000000
	setx	0x13e482784c6b1e56,%g7,%l0 ! %l0 = 13e482784c6b1e56
!	%l1 = 00000000000000ff
	setx	0x4e6ee0907a4f8119,%g7,%l1 ! %l1 = 4e6ee0907a4f8119
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 13e482784c6b1e56
	setx	0x99c475e796060897,%g7,%l0 ! %l0 = 99c475e796060897
!	%l1 = 4e6ee0907a4f8119
	setx	0x3d383dd01a0f12ab,%g7,%l1 ! %l1 = 3d383dd01a0f12ab
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1410] = ff400007, %l3 = 491588d6947903e2
	swapa	[%i3+%o5]0x80,%l3	! %l3 = 00000000ff400007

p0_label_114:
!	%f27 = 80000000, %f19 = afffffff, %f30 = 00530000
	fsubs	%f27,%f19,%f30		! %f30 = 2fffffff
!	%f20 = 00a59ab5 000000af, Mem[0000000010101408] = ff000000 afffffff
	stda	%f20,[%i4+%o4]0x80	! Mem[0000000010101408] = 00a59ab5 000000af
!	Mem[0000000010181410] = 5f880035, %l7 = 00000000000000ff
	swapa	[%i6+%o5]0x88,%l7	! %l7 = 000000005f880035
!	Mem[0000000010101410] = ff3c0000, %l0 = 96060897, %l3 = ff400007
	add	%i4,0x10,%g1
	casa	[%g1]0x80,%l0,%l3	! %l3 = 00000000ff3c0000
!	%f25 = ff000000, Mem[0000000010101410] = 00003cff
	sta	%f25,[%i4+%o5]0x88	! Mem[0000000010101410] = ff000000
!	Mem[0000000010101400] = 68005d00, %l5 = 0000000053000000
	ldstuba	[%i4+%g0]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010081408] = 0000ffff, %l4 = 00000000000000ff
	swapa	[%i2+%o4]0x80,%l4	! %l4 = 000000000000ffff
!	%f22 = ffffe519 c971ce8e, %l6 = 00000000000000ff
!	Mem[0000000010001408] = ff4000074920665d
	add	%i0,0x008,%g1
	stda	%f22,[%g1+%l6]ASI_PST16_PL ! Mem[0000000010001408] = 8ece71c919e5ffff
!	%l1 = 3d383dd01a0f12ab, Mem[0000000010181400] = e400000000000000
	stx	%l1,[%i6+%g0]		! Mem[0000000010181400] = 3d383dd01a0f12ab
!	Starting 10 instruction Load Burst
!	Mem[0000000030181410] = ff0000000000e000, %l7 = 000000005f880035
	ldxa	[%i6+%o5]0x89,%l7	! %l7 = ff0000000000e000

p0_label_115:
!	Mem[0000000030141408] = de350000, %l0 = 99c475e796060897
	lduba	[%i5+%o4]0x81,%l0	! %l0 = 00000000000000de
!	Mem[0000000030141410] = 00000000, %l1 = 3d383dd01a0f12ab
	ldsha	[%i5+%o5]0x89,%l1	! %l1 = 0000000000000000
!	Mem[00000000300c1410] = 0000788a, %l2 = 0418b91c19e5b62e
	ldsha	[%i3+%o5]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000010041408] = 000000e4 b59aa8d4, %l6 = 000000ff, %l7 = 0000e000
	ldda	[%i1+%o4]0x80,%l6	! %l6 = 00000000000000e4 00000000b59aa8d4
!	Mem[0000000010001400] = 0000a41a, %l4 = 000000000000ffff
	lduha	[%i0+%g0]0x88,%l4	! %l4 = 000000000000a41a
!	%l2 = 0000000000000000, %l6 = 00000000000000e4, %l2 = 0000000000000000
	addc	%l2,%l6,%l2		! %l2 = 00000000000000e4
!	Mem[0000000030101400] = ff000000, %f22 = ffffe519
	lda	[%i4+%g0]0x81,%f22	! %f22 = ff000000
!	Mem[0000000020800000] = ff5f17e8, %l3 = 00000000ff3c0000
	ldsba	[%o1+0x000]%asi,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000021800000] = 0db7dd30, %l5 = 0000000000000000
	lduh	[%o3+%g0],%l5		! %l5 = 0000000000000db7
!	Starting 10 instruction Store Burst
!	%f27 = 80000000, %f31 = 00000000, %f21 = 000000af
	fdivs	%f27,%f31,%f21		! %f21 = 7fffffff

p0_label_116:
!	%f14 = 10ca031c 0700407a, %l6 = 00000000000000e4
!	Mem[0000000030081438] = b82a2f114f979be2
	add	%i2,0x038,%g1
	stda	%f14,[%g1+%l6]ASI_PST32_SL ! Mem[0000000030081438] = b82a2f114f979be2
!	%l1 = 0000000000000000, Mem[0000000010001400] = 1aa40000
	stwa	%l1,[%i0+%g0]0x80	! Mem[0000000010001400] = 00000000
!	%l7 = 00000000b59aa8d4, Mem[0000000030181408] = 000000ff
	stba	%l7,[%i6+%o4]0x89	! Mem[0000000030181408] = 000000d4
!	%f14 = 10ca031c 0700407a, Mem[0000000010181400] = d03d383d ab120f1a
	stda	%f14,[%i6+%g0]0x88	! Mem[0000000010181400] = 10ca031c 0700407a
!	%l2 = 00000000000000e4, Mem[0000000010001408] = 8ece71c919e5ffff
	stx	%l2,[%i0+%o4]		! Mem[0000000010001408] = 00000000000000e4
!	Mem[0000000010141424] = 16ea1aa4, %l4 = 0000a41a, %l2 = 000000e4
	add	%i5,0x24,%g1
	casa	[%g1]0x80,%l4,%l2	! %l2 = 0000000016ea1aa4
!	Mem[0000000010001400] = 00000000, %l4 = 000000000000a41a
	ldstuba	[%i0+%g0]0x80,%l4	! %l4 = 00000000000000ff
!	Mem[0000000021800140] = b6ff94e3, %l4 = 0000000000000000
	ldstub	[%o3+0x140],%l4		! %l4 = 000000b6000000ff
!	%l2 = 0000000016ea1aa4, Mem[000000001004142e] = 3ac10b66, %asi = 80
	stba	%l2,[%i1+0x02e]%asi	! Mem[000000001004142c] = 3ac1a466
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = 0700407a, %l0 = 00000000000000de
	ldsba	[%i6+%g0]0x88,%l0	! %l0 = 000000000000007a

p0_label_117:
!	Mem[00000000300c1408] = 00000000 0700407a, %l4 = 000000b6, %l5 = 00000db7
	ldda	[%i3+%o4]0x81,%l4	! %l4 = 0000000000000000 000000000700407a
!	Mem[0000000030041410] = 2e000000, %l7 = 00000000b59aa8d4
	ldswa	[%i1+%o5]0x89,%l7	! %l7 = 000000002e000000
!	Mem[0000000010141408] = 000040ff, %f15 = 0700407a
	lda	[%i5+%o4]0x88,%f15	! %f15 = 000040ff
!	Mem[00000000100c1428] = e27e2b41, %l1 = 0000000000000000
	lduh	[%i3+0x028],%l1		! %l1 = 000000000000e27e
!	Mem[0000000010101400] = ff5d00684a27ace9, %l1 = 000000000000e27e
	ldxa	[%i4+%g0]0x80,%l1	! %l1 = ff5d00684a27ace9
!	Mem[0000000030181410] = ff0000000000e000, %f12 = 3e645548 7c901319
	ldda	[%i6+%o5]0x89,%f12	! %f12 = ff000000 0000e000
!	Mem[00000000201c0000] = 00ff19af, %l1 = ff5d00684a27ace9
	ldsb	[%o0+0x001],%l1		! %l1 = ffffffffffffffff
!	Mem[00000000300c1410] = 0000788a, %l5 = 000000000700407a
	ldsba	[%i3+%o5]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000030101410] = 000000ff, %l7 = 000000002e000000
	lduba	[%i4+%o5]0x89,%l7	! %l7 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%f0  = e0002802 00000068, %l6 = 00000000000000e4
!	Mem[0000000010001430] = 7271fd80ffdbe53e
	add	%i0,0x030,%g1
	stda	%f0,[%g1+%l6]ASI_PST16_P ! Mem[0000000010001430] = 72712802ffdbe53e

p0_label_118:
!	%l2 = 0000000016ea1aa4, Mem[0000000010081410] = ff000000, %asi = 80
	stwa	%l2,[%i2+0x010]%asi	! Mem[0000000010081410] = 16ea1aa4
!	Mem[0000000030081410] = ff000db3, %l2 = 0000000016ea1aa4
	ldstuba	[%i2+%o5]0x81,%l2	! %l2 = 000000ff000000ff
!	%l5 = 0000000000000000, Mem[0000000010181408] = 0418b91c
	stha	%l5,[%i6+%o4]0x80	! Mem[0000000010181408] = 0000b91c
!	%l3 = ffffffffffffffff, Mem[0000000010081438] = 000000002effe5ff
	stx	%l3,[%i2+0x038]		! Mem[0000000010081438] = ffffffffffffffff
	membar	#Sync			! Added by membar checker (21)
!	%f7  = 9237c966, Mem[00000000100c1400] = e0002802
	sta	%f7 ,[%i3+%g0]0x80	! Mem[00000000100c1400] = 9237c966
!	%l3 = ffffffffffffffff, Mem[0000000021800180] = e8f2ad00
	sth	%l3,[%o3+0x180]		! Mem[0000000021800180] = ffffad00
!	%f10 = e27e2b41 f2aa7756, %l6 = 00000000000000e4
!	Mem[00000000300c1430] = 6298e50c1112413c
	add	%i3,0x030,%g1
	stda	%f10,[%g1+%l6]ASI_PST16_S ! Mem[00000000300c1430] = 62982b411112413c
!	%f17 = af83e48b, Mem[00000000100c1408] = ff000000
	sta	%f17,[%i3+%o4]0x88	! Mem[00000000100c1408] = af83e48b
!	%f0  = e0002802 00000068, %l1 = ffffffffffffffff
!	Mem[0000000010001420] = 491588d6947903e2
	add	%i0,0x020,%g1
	stda	%f0,[%g1+%l1]ASI_PST16_PL ! Mem[0000000010001420] = 68000000022800e0
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = 7a4000ff, %f0  = e0002802
	lda	[%i5+%o5]0x88,%f0 	! %f0 = 7a4000ff

p0_label_119:
!	Mem[0000000010081408] = 000000ff, %f2  = 000000ff
	lda	[%i2+%o4]0x80,%f2 	! %f2 = 000000ff
!	Mem[0000000010081400] = 3c411211 0ce59862, %l4 = 00000000, %l5 = 00000000
	ldda	[%i2+%g0]0x88,%l4	! %l4 = 000000000ce59862 000000003c411211
!	Mem[0000000030141400] = 20b3b676000000e4, %f0  = 7a4000ff 00000068
	ldda	[%i5+%g0]0x89,%f0 	! %f0  = 20b3b676 000000e4
!	Mem[0000000020800040] = 00ff226c, %l7 = 00000000000000ff
	lduh	[%o1+0x040],%l7		! %l7 = 00000000000000ff
!	Mem[00000000211c0000] = 2eff980d, %l6 = 00000000000000e4
	lduh	[%o2+%g0],%l6		! %l6 = 0000000000002eff
!	Mem[00000000201c0000] = 00ff19af, %l2 = 00000000000000ff
	ldsba	[%o0+0x001]%asi,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000021800080] = 6933c3e5, %l5 = 000000003c411211
	ldsha	[%o3+0x080]%asi,%l5	! %l5 = 0000000000006933
!	Mem[0000000021800140] = ffff94e3, %l4 = 000000000ce59862
	ldsb	[%o3+0x141],%l4		! %l4 = ffffffffffffffff
!	Mem[0000000010081408] = 000000ff 4920665d, %l2 = ffffffff, %l3 = ffffffff
	ldd	[%i2+%o4],%l2		! %l2 = 00000000000000ff 000000004920665d
!	Starting 10 instruction Store Burst
!	Mem[0000000030041410] = 0000002e, %l7 = 00000000000000ff
	swapa	[%i1+%o5]0x81,%l7	! %l7 = 000000000000002e

p0_label_120:
!	Mem[0000000010041418] = 00000033, %l3 = 000000004920665d, %asi = 80
	swapa	[%i1+0x018]%asi,%l3	! %l3 = 0000000000000033
!	%l0 = 0000007a, %l1 = ffffffff, Mem[0000000010101408] = b59aa500 af000000
	stda	%l0,[%i4+%o4]0x88	! Mem[0000000010101408] = 0000007a ffffffff
!	%f28 = 7271fd80 ffdbe53e, %l7 = 000000000000002e
!	Mem[0000000010181410] = ff00000000000000
	add	%i6,0x010,%g1
	stda	%f28,[%g1+%l7]ASI_PST8_PL ! Mem[0000000010181410] = ffe5dbff00fd0000
!	Mem[0000000010141408] = 000040ff, %l1 = ffffffffffffffff
	ldstuba	[%i5+%o4]0x88,%l1	! %l1 = 000000ff000000ff
!	Mem[0000000010081408] = 000000ff, %l3 = 00000033, %l5 = 00006933
	add	%i2,0x08,%g1
	casa	[%g1]0x80,%l3,%l5	! %l5 = 00000000000000ff
!	%l5 = 00000000000000ff, Mem[0000000021800000] = 0db7dd30
	stb	%l5,[%o3+%g0]		! Mem[0000000021800000] = ffb7dd30
!	%l0 = 000000000000007a, Mem[0000000010041408] = d4a89ab5e4000000
	stxa	%l0,[%i1+%o4]0x88	! Mem[0000000010041408] = 000000000000007a
!	%f7  = 9237c966, Mem[0000000030001400] = 00000000
	sta	%f7 ,[%i0+%g0]0x89	! Mem[0000000030001400] = 9237c966
!	Mem[0000000010101408] = 0000007a, %l4 = ffffffffffffffff
	ldstuba	[%i4+%o4]0x88,%l4	! %l4 = 0000007a000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = 2eb6e519, %l3 = 0000000000000033
	ldswa	[%i5+%g0]0x80,%l3	! %l3 = 000000002eb6e519

p0_label_121:
!	Mem[00000000211c0000] = 2eff980d, %l2 = 00000000000000ff
	lduh	[%o2+%g0],%l2		! %l2 = 0000000000002eff
!	Mem[0000000010081410] = 16ea1aa4, %l4 = 000000000000007a
	ldsha	[%i2+%o5]0x80,%l4	! %l4 = 00000000000016ea
!	Mem[00000000100c1408] = af83e48b, %l6 = 0000000000002eff
	ldsba	[%i3+%o4]0x88,%l6	! %l6 = ffffffffffffff8b
!	Mem[000000001018143c] = 000000b6, %l7 = 000000000000002e
	lduba	[%i6+0x03e]%asi,%l7	! %l7 = 0000000000000000
!	Mem[0000000030181408] = 000000d4, %l7 = 0000000000000000
	ldsba	[%i6+%o4]0x89,%l7	! %l7 = ffffffffffffffd4
!	Mem[0000000030101400] = ffffffff000000ff, %f24 = 491588d6 ff000000
	ldda	[%i4+%g0]0x89,%f24	! %f24 = ffffffff 000000ff
!	Mem[0000000030141400] = e4000000, %l5 = 00000000000000ff
	lduwa	[%i5+%g0]0x81,%l5	! %l5 = 00000000e4000000
!	Mem[00000000100c142c] = f2aa7756, %l5 = 00000000e4000000
	lduha	[%i3+0x02e]%asi,%l5	! %l5 = 0000000000007756
!	Mem[0000000030141400] = e4000000, %l4 = 00000000000016ea
	ldswa	[%i5+%g0]0x81,%l4	! %l4 = ffffffffe4000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030181408] = d4000000, %l4 = ffffffffe4000000
	swapa	[%i6+%o4]0x81,%l4	! %l4 = 00000000d4000000

p0_label_122:
!	%l0 = 000000000000007a, Mem[00000000300c1410] = 0000788a2373c496
	stxa	%l0,[%i3+%o5]0x81	! Mem[00000000300c1410] = 000000000000007a
!	%f2  = 000000ff 00000000, Mem[0000000010181418] = 5d662049 23ffff96
	std	%f2 ,[%i6+0x018]	! Mem[0000000010181418] = 000000ff 00000000
!	%l4 = 00000000d4000000, Mem[0000000030141408] = de350000
	stwa	%l4,[%i5+%o4]0x81	! Mem[0000000030141408] = d4000000
!	%f16 = 5e5d8668, Mem[00000000300c1400] = 00000000
	sta	%f16,[%i3+%g0]0x89	! Mem[00000000300c1400] = 5e5d8668
!	Mem[0000000010101408] = 000000ff, %l5 = 0000000000007756
	ldstuba	[%i4+%o4]0x88,%l5	! %l5 = 000000ff000000ff
!	Mem[0000000010041408] = 7a000000, %l2 = 0000000000002eff
	ldstuba	[%i1+%o4]0x80,%l2	! %l2 = 0000007a000000ff
!	Mem[0000000010101428] = b1d41c1d, %l2 = 000000000000007a, %asi = 80
	swapa	[%i4+0x028]%asi,%l2	! %l2 = 00000000b1d41c1d
!	%l4 = 00000000d4000000, %l6 = ffffffffffffff8b, %y  = 00000000
	smul	%l4,%l6,%l3		! %l3 = 000000141c000000, %y = 00000014
!	Mem[000000001004140c] = 00000000, %l0 = 000000000000007a
	ldstub	[%i1+0x00c],%l0		! %l0 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = 00000000 0700407a, %l4 = d4000000, %l5 = 000000ff
	ldda	[%i3+%o4]0x81,%l4	! %l4 = 0000000000000000 000000000700407a

p0_label_123:
!	Mem[0000000010141428] = 5d66204900004988, %f2  = 000000ff 00000000
	ldd	[%i5+0x028],%f2 	! %f2  = 5d662049 00004988
!	Mem[0000000010181410] = ffdbe5ff, %l0 = 0000000000000000
	ldswa	[%i6+%o5]0x88,%l0	! %l0 = ffffffffffdbe5ff
!	Mem[00000000100c1410] = 947903e2, %l7 = ffffffffffffffd4
	lduba	[%i3+%o5]0x80,%l7	! %l7 = 0000000000000094
!	Mem[0000000010001400] = 8be483af 000000ff, %l0 = ffdbe5ff, %l1 = 000000ff
	ldda	[%i0+%g0]0x88,%l0	! %l0 = 00000000000000ff 000000008be483af
!	Mem[0000000030081408] = 2ee483afd53b056d, %l3 = 000000141c000000
	ldxa	[%i2+%o4]0x89,%l3	! %l3 = 2ee483afd53b056d
!	Mem[00000000100c1400] = 9237c966, %l0 = 00000000000000ff
	ldsba	[%i3+%g0]0x80,%l0	! %l0 = ffffffffffffff92
!	Mem[0000000010001410] = 001b3bde, %l1 = 000000008be483af
	ldswa	[%i0+%o5]0x80,%l1	! %l1 = 00000000001b3bde
!	Mem[0000000010041400] = 5f000000, %l7 = 0000000000000094
	ldsba	[%i1+%g0]0x80,%l7	! %l7 = 000000000000005f
!	Mem[0000000030001410] = 00000000, %l7 = 000000000000005f
	lduba	[%i0+%o5]0x89,%l7	! %l7 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f8  = af83e48b, %f15 = 000040ff
	fcmpes	%fcc2,%f8 ,%f15		! %fcc2 = 1

p0_label_124:
!	%l6 = ffffff8b, %l7 = 00000000, Mem[0000000010101408] = 000000ff ffffffff
	stda	%l6,[%i4+%o4]0x88	! Mem[0000000010101408] = ffffff8b 00000000
!	%l2 = b1d41c1d, %l3 = d53b056d, Mem[0000000010001410] = 001b3bde 000000af
	stda	%l2,[%i0+%o5]0x80	! Mem[0000000010001410] = b1d41c1d d53b056d
!	Mem[00000000211c0000] = 2eff980d, %l5 = 000000000700407a
	ldstuba	[%o2+0x000]%asi,%l5	! %l5 = 0000002e000000ff
!	%l0 = ffffffffffffff92, Mem[0000000030141410] = 00000000
	stba	%l0,[%i5+%o5]0x81	! Mem[0000000030141410] = 92000000
!	%l6 = ffffff8b, %l7 = 00000000, Mem[0000000010001410] = b1d41c1d d53b056d
	stda	%l6,[%i0+%o5]0x80	! Mem[0000000010001410] = ffffff8b 00000000
!	%f14 = 10ca031c 000040ff, %l7 = 0000000000000000
!	Mem[0000000010181420] = 00000000b59aa500
	add	%i6,0x020,%g1
	stda	%f14,[%g1+%l7]ASI_PST8_P ! Mem[0000000010181420] = 00000000b59aa500
!	%f8  = af83e48b, Mem[0000000010001400] = ff000000
	sta	%f8 ,[%i0+%g0]0x80	! Mem[0000000010001400] = af83e48b
!	%l5 = 000000000000002e, Mem[0000000010141402] = 2eb6e519
	sth	%l5,[%i5+0x002]		! Mem[0000000010141400] = 2eb6002e
!	%l3 = 2ee483afd53b056d, Mem[0000000010181400] = 7a400007
	stha	%l3,[%i6+%g0]0x80	! Mem[0000000010181400] = 056d0007
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = 00ff19af, %l4 = 0000000000000000
	ldsb	[%o0+0x001],%l4		! %l4 = ffffffffffffffff

p0_label_125:
!	%f27 = 80000000, %f31 = 00000000, %f31 = 00000000
	fdivs	%f27,%f31,%f31		! %f31 = 7fffffff
!	%l4 = ffffffffffffffff, %l3 = 2ee483afd53b056d, %l5 = 000000000000002e
	add	%l4,%l3,%l5		! %l5 = 2ee483afd53b056c
!	Mem[0000000030181400] = 00000000, %l0 = ffffffffffffff92
	ldsba	[%i6+%g0]0x89,%l0	! %l0 = 0000000000000000
!	Mem[00000000300c1400] = 5e5d8668, %l6 = ffffffffffffff8b
	ldsba	[%i3+%g0]0x89,%l6	! %l6 = 0000000000000068
!	Mem[0000000010001408] = 00000000, %l1 = 00000000001b3bde
	ldsba	[%i0+%o4]0x88,%l1	! %l1 = 0000000000000000
!	Mem[00000000211c0000] = ffff980d, %l1 = 0000000000000000
	ldsh	[%o2+%g0],%l1		! %l1 = ffffffffffffffff
!	Mem[00000000201c0000] = 00ff19af, %l7 = 0000000000000000
	ldsh	[%o0+%g0],%l7		! %l7 = 00000000000000ff
!	Mem[0000000030001410] = 00000000, %l1 = ffffffffffffffff
	lduba	[%i0+%o5]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000010001408] = 00000000, %l0 = 0000000000000000
	ldsha	[%i0+%o4]0x80,%l0	! %l0 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l5 = 2ee483afd53b056c, Mem[0000000010101410] = 000000ff
	stha	%l5,[%i4+%o5]0x80	! Mem[0000000010101410] = 056c00ff

p0_label_126:
!	Mem[0000000010101413] = 056c00ff, %l7 = 00000000000000ff
	ldstuba	[%i4+0x013]%asi,%l7	! %l7 = 000000ff000000ff
!	Mem[00000000218001c1] = 1aa4f4cf, %l4 = ffffffffffffffff
	ldstuba	[%o3+0x1c1]%asi,%l4	! %l4 = 000000a4000000ff
!	%f20 = 00a59ab5 7fffffff, Mem[0000000010181400] = 056d0007 1c03ca10
	stda	%f20,[%i6+%g0]0x80	! Mem[0000000010181400] = 00a59ab5 7fffffff
!	%l6 = 0000000000000068, Mem[0000000010141400] = 2e00b62e
	stha	%l6,[%i5+%g0]0x88	! Mem[0000000010141400] = 2e000068
!	%f20 = 00a59ab5 7fffffff, Mem[0000000010001420] = 68000000 022800e0
	std	%f20,[%i0+0x020]	! Mem[0000000010001420] = 00a59ab5 7fffffff
!	Mem[00000000100c1400] = 66c93792, %l2 = 00000000b1d41c1d
	ldstuba	[%i3+%g0]0x88,%l2	! %l2 = 00000092000000ff
!	%f16 = 5e5d8668 af83e48b ff000000 afffffff
!	%f20 = 00a59ab5 7fffffff ff000000 c971ce8e
!	%f24 = ffffffff 000000ff 5d662049 80000000
!	%f28 = 7271fd80 ffdbe53e 2fffffff 7fffffff
	stda	%f16,[%i5]ASI_BLK_AIUPL	! Block Store to 0000000010141400
!	%l7 = 00000000000000ff, Mem[0000000030141408] = d4000000
	stwa	%l7,[%i5+%o4]0x81	! Mem[0000000030141408] = 000000ff
!	%l3 = 2ee483afd53b056d, Mem[0000000010141400] = 5e5d8668af83e48b
	stxa	%l3,[%i5+%g0]0x88	! Mem[0000000010141400] = 2ee483afd53b056d
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = 8be483af, %l4 = 00000000000000a4
	ldswa	[%i0+%g0]0x88,%l4	! %l4 = ffffffff8be483af

p0_label_127:
!	Mem[0000000030001400] = 9237c966, %l3 = 2ee483afd53b056d
	ldsha	[%i0+%g0]0x89,%l3	! %l3 = ffffffffffffc966
	membar	#Sync			! Added by membar checker (22)
!	Mem[0000000010141408] = ffffffaf, %l0 = 0000000000000000
	lduw	[%i5+%o4],%l0		! %l0 = 00000000ffffffaf
!	Mem[0000000030141400] = 000000e4, %l7 = 00000000000000ff
	ldswa	[%i5+%g0]0x89,%l7	! %l7 = 00000000000000e4
!	Mem[0000000030101400] = 000000ff, %f27 = 80000000
	lda	[%i4+%g0]0x89,%f27	! %f27 = 000000ff
!	Mem[0000000030001400] = 66c93792, %l4 = ffffffff8be483af
	lduha	[%i0+%g0]0x81,%l4	! %l4 = 00000000000066c9
!	Mem[0000000010041410] = 00680000, %l6 = 0000000000000068
	lduwa	[%i1+%o5]0x80,%l6	! %l6 = 0000000000680000
!	Mem[00000000100c1410] = 947903e2, %l3 = ffffffffffffc966
	ldswa	[%i3+%o5]0x80,%l3	! %l3 = ffffffff947903e2
!	Mem[0000000010141430] = 3ee5dbff 80fd7172, %l0 = ffffffaf, %l1 = 00000000
	ldda	[%i5+0x030]%asi,%l0	! %l0 = 000000003ee5dbff 0000000080fd7172
!	Mem[00000000211c0000] = ffff980d, %l0 = 000000003ee5dbff
	ldsb	[%o2+0x001],%l0		! %l0 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l3 = ffffffff947903e2, immed = fffff982, %y  = 00000014
	smul	%l3,-0x67e,%l1		! %l1 = 000002ba1658cac4, %y = 000002ba

p0_label_128:
!	%f30 = 2fffffff 7fffffff, Mem[0000000030181410] = 0000e000 ff000000
	stda	%f30,[%i6+%o5]0x89	! Mem[0000000030181410] = 2fffffff 7fffffff
!	%l3 = ffffffff947903e2, Mem[0000000030041410] = ff000000
	stba	%l3,[%i1+%o5]0x89	! Mem[0000000030041410] = ff0000e2
!	%l3 = ffffffff947903e2, Mem[0000000030181408] = 000000e4
	stwa	%l3,[%i6+%o4]0x89	! Mem[0000000030181408] = 947903e2
!	Mem[0000000010141410] = 7fffffff, %l6 = 0000000000680000
	swapa	[%i5+%o5]0x88,%l6	! %l6 = 000000007fffffff
!	Mem[0000000010001410] = 8bffffff, %l1 = 000002ba1658cac4
	swapa	[%i0+%o5]0x88,%l1	! %l1 = 000000008bffffff
!	%f26 = 5d662049 000000ff, Mem[00000000100c1408] = 8be483af 00000000
	stda	%f26,[%i3+%o4]0x80	! Mem[00000000100c1408] = 5d662049 000000ff
!	%l1 = 000000008bffffff, Mem[0000000010081408] = 000000ff
	stba	%l1,[%i2+%o4]0x80	! Mem[0000000010081408] = ff0000ff
!	Mem[0000000010141410] = 00006800, %l1 = 000000008bffffff
	ldstuba	[%i5+%o5]0x80,%l1	! %l1 = 00000000000000ff
!	%l5 = 2ee483afd53b056c, Mem[0000000030181400] = 00000000
	stba	%l5,[%i6+%g0]0x81	! Mem[0000000030181400] = 6c000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = af83e48b, %l5 = 2ee483afd53b056c
	ldsha	[%i0+%g0]0x80,%l5	! %l5 = ffffffffffffaf83

p0_label_129:
!	Mem[0000000030141410] = 00000092, %l7 = 00000000000000e4
	lduwa	[%i5+%o5]0x89,%l7	! %l7 = 0000000000000092
!	Mem[0000000010081400] = 6298e50c, %f23 = c971ce8e
	lda	[%i2+%g0]0x80,%f23	! %f23 = 6298e50c
!	Mem[0000000010081400] = 6298e50c, %f26 = 5d662049
	lda	[%i2+%g0]0x80,%f26	! %f26 = 6298e50c
!	Mem[0000000010041418] = 4920665d 000014ff, %l6 = 7fffffff, %l7 = 00000092
	ldda	[%i1+0x018]%asi,%l6	! %l6 = 000000004920665d 00000000000014ff
!	Mem[0000000030001408] = 2eb6e519, %f25 = 000000ff
	lda	[%i0+%o4]0x89,%f25	! %f25 = 2eb6e519
!	Mem[0000000010101408] = 00000000ffffff8b, %l2 = 0000000000000092
	ldxa	[%i4+%o4]0x88,%l2	! %l2 = 00000000ffffff8b
!	Mem[00000000100c1410] = 947903e2, %l2 = 00000000ffffff8b
	lduba	[%i3+%o5]0x80,%l2	! %l2 = 0000000000000094
!	Mem[0000000010081400] = 6298e50c, %l3 = ffffffff947903e2
	ldsba	[%i2+%g0]0x80,%l3	! %l3 = 0000000000000062
!	Mem[0000000010001408] = e400000000000000, %f26 = 6298e50c 000000ff
	ldda	[%i0+%o4]0x88,%f26	! %f26 = e4000000 00000000
!	Starting 10 instruction Store Burst
!	%l6 = 4920665d, %l7 = 000014ff, Mem[0000000030041410] = e20000ff 484d7c90
	stda	%l6,[%i1+%o5]0x81	! Mem[0000000030041410] = 4920665d 000014ff

p0_label_130:
!	%l7 = 00000000000014ff, Mem[0000000010041408] = 000000ff
	stha	%l7,[%i1+%o4]0x88	! Mem[0000000010041408] = 000014ff
!	%f5  = 0000003c, Mem[0000000010101410] = 056c00ff
	sta	%f5 ,[%i4+%o5]0x80	! Mem[0000000010101410] = 0000003c
!	%f4  = ff400007 0000003c, %l3 = 0000000000000062
!	Mem[0000000030081428] = b0b2c754db995109
	add	%i2,0x028,%g1
	stda	%f4,[%g1+%l3]ASI_PST32_S ! Mem[0000000030081428] = ff400007db995109
!	%l4 = 000066c9, %l5 = ffffaf83, Mem[0000000030041410] = 4920665d 000014ff
	stda	%l4,[%i1+%o5]0x81	! Mem[0000000030041410] = 000066c9 ffffaf83
!	%l7 = 00000000000014ff, Mem[0000000010181408] = 0000b91c19e5b62e
	stxa	%l7,[%i6+%o4]0x80	! Mem[0000000010181408] = 00000000000014ff
!	Mem[0000000030041408] = ff004bac, %l3 = 0000000000000062
	swapa	[%i1+%o4]0x81,%l3	! %l3 = 00000000ff004bac
!	%l4 = 000066c9, %l5 = ffffaf83, Mem[0000000010081418] = ffffe519 c971ce8e
	std	%l4,[%i2+0x018]		! Mem[0000000010081418] = 000066c9 ffffaf83
!	%l2 = 0000000000000094, Mem[00000000300c1408] = 00000000
	stba	%l2,[%i3+%o4]0x89	! Mem[00000000300c1408] = 00000094
!	%f19 = afffffff, %f15 = 000040ff, %f29 = ffdbe53e
	fdivs	%f19,%f15,%f29		! %l0 = 0000000000000021, Unfinished, %fsr = 2500000000
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = 6800000066c937ff, %f10 = e27e2b41 f2aa7756
	ldda	[%i3+%g0]0x88,%f10	! %f10 = 68000000 66c937ff

p0_label_131:
!	Mem[0000000010181438] = ff3d00b3, %l4 = 00000000000066c9
	ldsb	[%i6+0x039],%l4		! %l4 = 000000000000003d
!	Mem[00000000100c1408] = 5d662049, %l3 = 00000000ff004bac
	ldsba	[%i3+%o4]0x80,%l3	! %l3 = 000000000000005d
!	Mem[0000000010101408] = 8bffffff, %l6 = 000000004920665d
	lduwa	[%i4+%o4]0x80,%l6	! %l6 = 000000008bffffff
!	Mem[0000000010101400] = e9ac274a68005dff, %l2 = 0000000000000094
	ldxa	[%i4+%g0]0x88,%l2	! %l2 = e9ac274a68005dff
!	Mem[0000000030081410] = ff000db3, %l1 = 0000000000000000
	lduba	[%i2+%o5]0x81,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030041410] = 83afffffc9660000, %l3 = 000000000000005d
	ldxa	[%i1+%o5]0x89,%l3	! %l3 = 83afffffc9660000
!	Mem[00000000300c1410] = 00000000, %l0 = 0000000000000021
	lduha	[%i3+%o5]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000030181410] = 7fffffff, %l6 = 000000008bffffff
	ldsba	[%i6+%o5]0x89,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000030181410] = 7fffffff, %f26 = e4000000
	lda	[%i6+%o5]0x89,%f26	! %f26 = 7fffffff
!	Starting 10 instruction Store Burst
!	Mem[0000000010081410] = a41aea16, %l4 = 000000000000003d
	ldstuba	[%i2+%o5]0x88,%l4	! %l4 = 00000016000000ff

p0_label_132:
!	Mem[0000000010081400] = 0ce59862, %l3 = 83afffffc9660000
	ldstuba	[%i2+%g0]0x88,%l3	! %l3 = 00000062000000ff
!	%f4  = ff400007, Mem[0000000030001410] = 00000000
	sta	%f4 ,[%i0+%o5]0x89	! Mem[0000000030001410] = ff400007
!	Mem[0000000021800040] = ff0e4385, %l0 = 0000000000000000
	ldstuba	[%o3+0x040]%asi,%l0	! %l0 = 000000ff000000ff
!	Mem[0000000030081410] = ff000db3, %l3 = 0000000000000062
	swapa	[%i2+%o5]0x81,%l3	! %l3 = 00000000ff000db3
!	%l2 = e9ac274a68005dff, Mem[0000000030181400] = 0000006c
	stwa	%l2,[%i6+%g0]0x89	! Mem[0000000030181400] = 68005dff
!	%l2 = 68005dff, %l3 = ff000db3, Mem[0000000010041400] = 0000005f 00000000
	stda	%l2,[%i1+%g0]0x88	! Mem[0000000010041400] = 68005dff ff000db3
!	Mem[0000000030041410] = 000066c9, %l6 = ffffffffffffffff
	swapa	[%i1+%o5]0x81,%l6	! %l6 = 00000000000066c9
!	%l1 = 00000000000000ff, Mem[0000000010141408] = ffffffaf000000ff
	stxa	%l1,[%i5+%o4]0x80	! Mem[0000000010141408] = 00000000000000ff
!	Mem[0000000030041410] = ffffffff, %l1 = 00000000000000ff
	swapa	[%i1+%o5]0x81,%l1	! %l1 = 00000000ffffffff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = 947903e2, %l3 = 00000000ff000db3
	lduba	[%i3+%o5]0x80,%l3	! %l3 = 0000000000000094

p0_label_133:
!	Mem[0000000030001408] = 2eb6e519, %l6 = 00000000000066c9
	ldsba	[%i0+%o4]0x89,%l6	! %l6 = 0000000000000019
!	Mem[0000000030001410] = 070040ff, %l0 = 00000000000000ff
	lduba	[%i0+%o5]0x81,%l0	! %l0 = 0000000000000007
!	Mem[00000000100c1408] = 5d662049, %l1 = 00000000ffffffff
	ldswa	[%i3+0x008]%asi,%l1	! %l1 = 000000005d662049
!	Mem[00000000211c0000] = ffff980d, %l4 = 0000000000000016
	ldsba	[%o2+0x001]%asi,%l4	! %l4 = ffffffffffffffff
!	Mem[00000000100c1410] = e2037994, %l3 = 0000000000000094
	lduba	[%i3+%o5]0x88,%l3	! %l3 = 0000000000000094
!	Mem[0000000010081400] = ff98e50c, %l3 = 0000000000000094
	lduwa	[%i2+%g0]0x80,%l3	! %l3 = 00000000ff98e50c
!	Mem[0000000030181400] = ff5d0068, %l6 = 0000000000000019
	lduha	[%i6+%g0]0x81,%l6	! %l6 = 000000000000ff5d
!	Mem[0000000030141400] = e400000076b6b320, %f20 = 00a59ab5 7fffffff
	ldda	[%i5+%g0]0x81,%f20	! %f20 = e4000000 76b6b320
!	Mem[00000000100c140c] = 000000ff, %l3 = 00000000ff98e50c
	ldsb	[%i3+0x00d],%l3		! %l3 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l4 = ffffffff, %l5 = ffffaf83, Mem[0000000010101418] = 292637e1 444be5f3
	std	%l4,[%i4+0x018]		! Mem[0000000010101418] = ffffffff ffffaf83

p0_label_134:
!	%f0  = 20b3b676 000000e4 5d662049 00004988
!	%f4  = ff400007 0000003c e137cf03 9237c966
!	%f8  = af83e48b 022800e0 68000000 66c937ff
!	%f12 = ff000000 0000e000 10ca031c 000040ff
	stda	%f0,[%i1]ASI_BLK_AIUPL	! Block Store to 0000000010041400
!	%l3 = 0000000000000000, Mem[00000000100c1408] = 5d662049
	stba	%l3,[%i3+%o4]0x80	! Mem[00000000100c1408] = 00662049
!	Mem[0000000030181410] = ffffff7f, %l1 = 000000005d662049
	ldstuba	[%i6+%o5]0x81,%l1	! %l1 = 000000ff000000ff
!	%l4 = ffffffff, %l5 = ffffaf83, Mem[0000000010001410] = 1658cac4 00000000
	stda	%l4,[%i0+%o5]0x88	! Mem[0000000010001410] = ffffffff ffffaf83
!	Mem[00000000100c1420] = af83e48b022800e0, %l2 = e9ac274a68005dff, %l4 = ffffffffffffffff
	add	%i3,0x20,%g1
	casxa	[%g1]0x80,%l2,%l4	! %l4 = af83e48b022800e0
!	%f17 = af83e48b, Mem[0000000030081400] = 68865d5e
	sta	%f17,[%i2+%g0]0x89	! Mem[0000000030081400] = af83e48b
!	%f20 = e4000000 76b6b320, %l6 = 000000000000ff5d
!	Mem[0000000030141400] = e400000076b6b320
	stda	%f20,[%i5+%l6]ASI_PST8_S ! Mem[0000000030141400] = e400000076b6b320
!	%l2 = 68005dff, %l3 = 00000000, Mem[0000000030041408] = 00000062 cf2ab6f9
	stda	%l2,[%i1+%o4]0x81	! Mem[0000000030041408] = 68005dff 00000000
!	Mem[00000000218000c1] = 00004926, %l4 = af83e48b022800e0
	ldstub	[%o3+0x0c1],%l4		! %l4 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[000000001014143c] = ffffff2f, %l0 = 0000000000000007
	lduh	[%i5+0x03e],%l0		! %l0 = 000000000000ff2f

p0_label_135:
!	Mem[0000000010141400] = 6d053bd5, %l7 = 00000000000014ff
	ldswa	[%i5+%g0]0x80,%l7	! %l7 = 000000006d053bd5
!	Mem[0000000010101408] = 8bffffff, %l0 = 000000000000ff2f
	lduh	[%i4+0x00a],%l0		! %l0 = 000000000000ffff
!	Mem[0000000030081408] = 6d053bd5, %l0 = 000000000000ffff
	ldsba	[%i2+%o4]0x81,%l0	! %l0 = 000000000000006d
!	Mem[00000000201c0000] = 00ff19af, %l3 = 0000000000000000
	ldub	[%o0+%g0],%l3		! %l3 = 0000000000000000
!	Mem[00000000100c1408] = ff00000049206600, %f22 = ff000000 6298e50c
	ldda	[%i3+%o4]0x88,%f22	! %f22 = ff000000 49206600
	membar	#Sync			! Added by membar checker (23)
!	Mem[0000000010041408] = 00004988, %l2 = e9ac274a68005dff
	ldsba	[%i1+%o4]0x88,%l2	! %l2 = ffffffffffffff88
!	Mem[0000000030141400] = e4000000, %l4 = 0000000000000000
	lduha	[%i5+%g0]0x81,%l4	! %l4 = 000000000000e400
!	Mem[00000000201c0000] = 00ff19af, %l4 = 000000000000e400
	ldsba	[%o0+0x000]%asi,%l4	! %l4 = 0000000000000000
!	Mem[0000000010141408] = 00000000, %l5 = ffffffffffffaf83
	ldsha	[%i5+%o4]0x88,%l5	! %l5 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030141408] = 000000ff, %l2 = ffffffffffffff88
	ldstuba	[%i5+%o4]0x81,%l2	! %l2 = 00000000000000ff

p0_label_136:
!	%l4 = 0000000000000000, Mem[0000000010081400] = ff98e50c
	stba	%l4,[%i2+%g0]0x80	! Mem[0000000010081400] = 0098e50c
!	Mem[0000000010001408] = 00000000, %l0 = 000000000000006d
	ldstuba	[%i0+%o4]0x80,%l0	! %l0 = 00000000000000ff
!	%f31 = 7fffffff, Mem[0000000010081400] = 0ce59800
	sta	%f31,[%i2+%g0]0x88	! Mem[0000000010081400] = 7fffffff
!	Mem[0000000030001408] = 19e5b62e, %l6 = 000000000000ff5d
	swapa	[%i0+%o4]0x81,%l6	! %l6 = 0000000019e5b62e
!	%l4 = 00000000, %l5 = 00000000, Mem[00000000100c1410] = 947903e2 0000003c
	stda	%l4,[%i3+%o5]0x80	! Mem[00000000100c1410] = 00000000 00000000
!	%l6 = 0000000019e5b62e, Mem[0000000010041438] = ff4000001c03ca10, %asi = 80
	stxa	%l6,[%i1+0x038]%asi	! Mem[0000000010041438] = 0000000019e5b62e
!	%l3 = 0000000000000000, Mem[0000000030041410] = ff000000
	stwa	%l3,[%i1+%o5]0x89	! Mem[0000000030041410] = 00000000
!	%f0  = 20b3b676 000000e4, Mem[0000000010041410] = 3c000000 070040ff
	stda	%f0 ,[%i1+%o5]0x80	! Mem[0000000010041410] = 20b3b676 000000e4
!	%l6 = 0000000019e5b62e, Mem[0000000010101410] = 3c000000
	stba	%l6,[%i4+%o5]0x88	! Mem[0000000010101410] = 3c00002e
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = 884900004920665d, %l4 = 0000000000000000
	ldxa	[%i1+%o4]0x80,%l4	! %l4 = 884900004920665d

p0_label_137:
!	Mem[0000000030101408] = 000000ff, %l2 = 0000000000000000
	lduba	[%i4+%o4]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010041410] = 20b3b676 000000e4, %l6 = 19e5b62e, %l7 = 6d053bd5
	ldda	[%i1+%o5]0x80,%l6	! %l6 = 0000000020b3b676 00000000000000e4
!	Mem[0000000010101408] = ffffff8b, %l3 = 0000000000000000
	lduha	[%i4+%o4]0x88,%l3	! %l3 = 000000000000ff8b
!	Mem[0000000030081410] = 00000062, %l2 = 00000000000000ff
	ldswa	[%i2+%o5]0x81,%l2	! %l2 = 0000000000000062
!	Mem[0000000030101410] = ff000000, %f7  = 9237c966
	lda	[%i4+%o5]0x81,%f7 	! %f7 = ff000000
!	Mem[0000000030081400] = 8be483af 8d1e3315 6d053bd5 af83e42e
!	Mem[0000000030081410] = 00000062 00000000 ccc989c0 c971ce8e
!	Mem[0000000030081420] = 491588d6 947903e2 ff400007 db995109
!	Mem[0000000030081430] = 3a9fb502 0c281024 b82a2f11 4f979be2
	ldda	[%i2]ASI_BLK_AIUS,%f0	! Block Load from 0000000030081400
!	Mem[00000000201c0000] = 00ff19af, %l4 = 884900004920665d
	ldsba	[%o0+0x001]%asi,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010001408] = ff000000, %f17 = af83e48b
	lda	[%i0+%o4]0x80,%f17	! %f17 = ff000000
!	Mem[0000000010101400] = ff5d0068, %l4 = ffffffffffffffff
	ldsba	[%i4+%g0]0x80,%l4	! %l4 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l0 = 0000000000000000, Mem[00000000300c1408] = 7a40000700000094
	stxa	%l0,[%i3+%o4]0x89	! Mem[00000000300c1408] = 0000000000000000

p0_label_138:
!	%l0 = 0000000000000000, Mem[0000000020800000] = ff5f17e8
	sth	%l0,[%o1+%g0]		! Mem[0000000020800000] = 000017e8
!	%l4 = ffffffff, %l5 = 00000000, Mem[0000000010081410] = ffea1aa4 00000000
	std	%l4,[%i2+%o5]		! Mem[0000000010081410] = ffffffff 00000000
!	%l0 = 0000000000000000, Mem[0000000010081424] = 000000af
	stw	%l0,[%i2+0x024]		! Mem[0000000010081424] = 00000000
!	%l6 = 20b3b676, %l7 = 000000e4, Mem[0000000030181400] = ff5d0068 e1372629
	stda	%l6,[%i6+%g0]0x81	! Mem[0000000030181400] = 20b3b676 000000e4
!	Mem[0000000010001410] = ffffffff, %l7 = 00000000000000e4
	swapa	[%i0+%o5]0x88,%l7	! %l7 = 00000000ffffffff
!	%f21 = 76b6b320, Mem[0000000010001410] = e4000000
	sta	%f21,[%i0+%o5]0x80	! Mem[0000000010001410] = 76b6b320
!	Mem[0000000030181400] = 76b6b320, %l2 = 0000000000000062
	swapa	[%i6+%g0]0x89,%l2	! %l2 = 0000000076b6b320
!	%l6 = 0000000020b3b676, Mem[0000000030181408] = 947903e2
	stwa	%l6,[%i6+%o4]0x89	! Mem[0000000030181408] = 20b3b676
!	%l3 = 000000000000ff8b, Mem[0000000030141408] = ff0000ff
	stba	%l3,[%i5+%o4]0x81	! Mem[0000000030141408] = 8b0000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = b59aa500, %l3 = 000000000000ff8b
	ldsba	[%i6+%g0]0x88,%l3	! %l3 = 0000000000000000

p0_label_139:
!	Mem[000000001008140c] = 4920665d, %l3 = 0000000000000000
	lduw	[%i2+0x00c],%l3		! %l3 = 000000004920665d
!	Mem[00000000100c1408] = 00662049, %l5 = 0000000000000000
	lduwa	[%i3+%o4]0x80,%l5	! %l5 = 0000000000662049
!	Mem[0000000010181408] = 00000000, %f31 = 7fffffff
	lda	[%i6+%o4]0x88,%f31	! %f31 = 00000000
!	Mem[0000000020800000] = 000017e8, %l2 = 0000000076b6b320
	ldub	[%o1+0x001],%l2		! %l2 = 0000000000000000
!	Mem[0000000010001438] = 3500885f00000000, %l6 = 0000000020b3b676
	ldxa	[%i0+0x038]%asi,%l6	! %l6 = 3500885f00000000
!	Mem[0000000020800000] = 000017e8, %l3 = 000000004920665d
	ldsba	[%o1+0x001]%asi,%l3	! %l3 = 0000000000000000
!	Mem[0000000010141404] = af83e42e, %l0 = 0000000000000000
	lduwa	[%i5+0x004]%asi,%l0	! %l0 = 00000000af83e42e
!	Mem[00000000300c1410] = 00000000, %l1 = 00000000000000ff
	ldsha	[%i3+%o5]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000020800000] = 000017e8, %l4 = ffffffffffffffff
	lduha	[%o1+0x000]%asi,%l4	! %l4 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l5 = 0000000000662049, Mem[0000000030001400] = 005300009237c966
	stxa	%l5,[%i0+%g0]0x89	! Mem[0000000030001400] = 0000000000662049

p0_label_140:
!	%l7 = 00000000ffffffff, Mem[00000000300c1408] = 0000000000000000
	stxa	%l7,[%i3+%o4]0x89	! Mem[00000000300c1408] = 00000000ffffffff
!	%l6 = 3500885f00000000, Mem[0000000010101410] = 2e00003cffffffdb
	stxa	%l6,[%i4+%o5]0x80	! Mem[0000000010101410] = 3500885f00000000
!	Mem[00000000218000c0] = 00ff4926, %l3 = 0000000000000000
	lduh	[%o3+0x0c0],%l3		! %l3 = 00000000000000ff
!	%l2 = 00000000, %l3 = 000000ff, Mem[0000000010001400] = af83e48b af83e48b
	stda	%l2,[%i0+0x000]%asi	! Mem[0000000010001400] = 00000000 000000ff
!	%l7 = 00000000ffffffff, Mem[0000000010181410] = ffdbe5ff
	stha	%l7,[%i6+%o5]0x88	! Mem[0000000010181410] = ffdbffff
!	Mem[0000000010141400] = 6d053bd5, %l4 = 0000000000000000
	swapa	[%i5+%g0]0x80,%l4	! %l4 = 000000006d053bd5
!	%l0 = 00000000af83e42e, Mem[0000000010081410] = ffffffff
	stwa	%l0,[%i2+%o5]0x88	! Mem[0000000010081410] = af83e42e
!	Mem[0000000030041410] = 00000000, %l6 = 3500885f00000000
	swapa	[%i1+%o5]0x89,%l6	! %l6 = 0000000000000000
!	%f29 = ffdbe53e, Mem[00000000100c1430] = 3e645548
	sta	%f29,[%i3+0x030]%asi	! Mem[00000000100c1430] = ffdbe53e
!	Starting 10 instruction Load Burst
!	Mem[0000000010101418] = ffffffffffffaf83, %f16 = 5e5d8668 ff000000
	ldda	[%i4+0x018]%asi,%f16	! %f16 = ffffffff ffffaf83

p0_label_141:
!	Mem[0000000030181410] = ffffff7f, %l2 = 0000000000000000
	lduwa	[%i6+%o5]0x81,%l2	! %l2 = 00000000ffffff7f
!	Mem[0000000021800000] = ffb7dd30, %l7 = 00000000ffffffff
	ldsh	[%o3+%g0],%l7		! %l7 = ffffffffffffffb7
!	Mem[00000000300c1408] = ffffffff00000000, %l1 = 0000000000000000
	ldxa	[%i3+%o4]0x81,%l1	! %l1 = ffffffff00000000
!	Mem[0000000010041410] = 20b3b676 000000e4, %l0 = af83e42e, %l1 = 00000000
	ldda	[%i1+%o5]0x80,%l0	! %l0 = 0000000020b3b676 00000000000000e4
!	Mem[00000000300c1400] = 68865d5e, %l7 = ffffffffffffffb7
	ldsha	[%i3+%g0]0x81,%l7	! %l7 = 0000000000006886
!	Mem[0000000030001410] = 070040ff, %l4 = 000000006d053bd5
	ldsha	[%i0+%o5]0x81,%l4	! %l4 = 0000000000000700
!	%f17 = ffffaf83, %f24 = ffffffff, %f16 = ffffffff
	fmuls	%f17,%f24,%f16		! %f16 = ffffffff
!	Mem[00000000300c1410] = 00000000, %l0 = 0000000020b3b676
	ldsba	[%i3+%o5]0x89,%l0	! %l0 = 0000000000000000
!	%l7 = 0000000000006886, %l7 = 0000000000006886, %l6 = 0000000000000000
	udivx	%l7,%l7,%l6		! %l6 = 0000000000000001
!	Starting 10 instruction Store Burst
!	%l5 = 0000000000662049, Mem[0000000010181410] = ffffdbff
	stwa	%l5,[%i6+%o5]0x80	! Mem[0000000010181410] = 00662049

p0_label_142:
!	%f16 = ffffffff ffffaf83 ff000000 afffffff
!	%f20 = e4000000 76b6b320 ff000000 49206600
!	%f24 = ffffffff 2eb6e519 7fffffff 00000000
!	%f28 = 7271fd80 ffdbe53e 2fffffff 00000000
	stda	%f16,[%i4]ASI_BLK_S	! Block Store to 0000000030101400
	membar	#Sync			! Added by membar checker (24)
!	Mem[000000001010142f] = 9a41c1c7, %l4 = 0000000000000700
	ldstuba	[%i4+0x02f]%asi,%l4	! %l4 = 000000c7000000ff
!	%l1 = 00000000000000e4, Mem[0000000030101408] = 000000ff
	stha	%l1,[%i4+%o4]0x89	! Mem[0000000030101408] = 000000e4
!	Code Fragment 4
p0_fragment_8:
!	%l0 = 0000000000000000
	setx	0x5a2ec36f97e6ec29,%g7,%l0 ! %l0 = 5a2ec36f97e6ec29
!	%l1 = 00000000000000e4
	setx	0x505645f7d6bc599b,%g7,%l1 ! %l1 = 505645f7d6bc599b
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 5a2ec36f97e6ec29
	setx	0x794051afc3978a69,%g7,%l0 ! %l0 = 794051afc3978a69
!	%l1 = 505645f7d6bc599b
	setx	0x15727abf83a70323,%g7,%l1 ! %l1 = 15727abf83a70323
!	%l4 = 00000000000000c7, Mem[0000000010181400] = 00a59ab57fffffff
	stx	%l4,[%i6+%g0]		! Mem[0000000010181400] = 00000000000000c7
!	%l5 = 0000000000662049, Mem[0000000010101408] = 8bffffff
	stwa	%l5,[%i4+%o4]0x80	! Mem[0000000010101408] = 00662049
!	Mem[0000000030101400] = ffffffff, %l0 = 794051afc3978a69
	ldstuba	[%i4+%g0]0x81,%l0	! %l0 = 000000ff000000ff
!	Mem[0000000010101400] = ff5d0068, %l5 = 0000000000662049
	swapa	[%i4+%g0]0x80,%l5	! %l5 = 00000000ff5d0068
!	%f20 = e4000000, Mem[0000000010001434] = ffdbe53e
	st	%f20,[%i0+0x034]	! Mem[0000000010001434] = e4000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = 5dff0000, %l7 = 0000000000006886
	lduwa	[%i0+%o4]0x89,%l7	! %l7 = 000000005dff0000

p0_label_143:
!	Mem[0000000010141434] = 80fd7172, %f22 = ff000000
	ld	[%i5+0x034],%f22	! %f22 = 80fd7172
!	Mem[0000000030001408] = 5dff0000, %l6 = 0000000000000001
	ldswa	[%i0+%o4]0x89,%l6	! %l6 = 000000005dff0000
!	Mem[0000000010101408] = 00662049 00000000, %l6 = 5dff0000, %l7 = 5dff0000
	ldda	[%i4+0x008]%asi,%l6	! %l6 = 0000000000662049 0000000000000000
!	Mem[0000000030141400] = 20b3b676 000000e4, %l2 = ffffff7f, %l3 = 000000ff
	ldda	[%i5+%g0]0x89,%l2	! %l2 = 00000000000000e4 0000000020b3b676
!	Code Fragment 3
p0_fragment_9:
!	%l0 = 00000000000000ff
	setx	0xcc9dc6efcfbda606,%g7,%l0 ! %l0 = cc9dc6efcfbda606
!	%l1 = 15727abf83a70323
	setx	0xc560be1fb840ff85,%g7,%l1 ! %l1 = c560be1fb840ff85
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = cc9dc6efcfbda606
	setx	0x451a94c8213cc5c5,%g7,%l0 ! %l0 = 451a94c8213cc5c5
!	%l1 = c560be1fb840ff85
	setx	0x04171c8001c31abb,%g7,%l1 ! %l1 = 04171c8001c31abb
!	%l2 = 00000000000000e4, Mem[000000001018143c] = 000000b6
	stw	%l2,[%i6+0x03c]		! Mem[000000001018143c] = 000000e4
!	Mem[0000000010141400] = 00000000 af83e42e, %l2 = 000000e4, %l3 = 20b3b676
	ldda	[%i5+%g0]0x80,%l2	! %l2 = 0000000000000000 00000000af83e42e
!	Mem[000000001008143c] = ffffffff, %l3 = 00000000af83e42e
	lduh	[%i2+0x03c],%l3		! %l3 = 000000000000ffff
!	Mem[0000000010141410] = 00a59ab5 006800ff, %l4 = 000000c7, %l5 = ff5d0068
	ldda	[%i5+%o5]0x88,%l4	! %l4 = 00000000006800ff 0000000000a59ab5
!	Starting 10 instruction Store Burst
!	%l2 = 00000000, %l3 = 0000ffff, Mem[0000000030181408] = 76b6b320 afffffff
	stda	%l2,[%i6+%o4]0x81	! Mem[0000000030181408] = 00000000 0000ffff

p0_label_144:
!	Mem[00000000100c1410] = 00000000, %l2 = 0000000000000000
	swapa	[%i3+%o5]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000010181415] = 00fd0000, %l2 = 0000000000000000
	ldstuba	[%i6+0x015]%asi,%l2	! %l2 = 000000fd000000ff
!	Mem[0000000010141400] = 00000000, %l7 = 0000000000000000
	ldstuba	[%i5+%g0]0x88,%l7	! %l7 = 00000000000000ff
!	%l6 = 00662049, %l7 = 00000000, Mem[0000000010041400] = e4000000 76b6b320
	stda	%l6,[%i1+0x000]%asi	! Mem[0000000010041400] = 00662049 00000000
!	%l0 = 451a94c8213cc5c5, Mem[0000000030041400] = 775a5ef219e5ffff
	stxa	%l0,[%i1+%g0]0x89	! Mem[0000000030041400] = 451a94c8213cc5c5
!	%l1 = 04171c8001c31abb, Mem[0000000010141400] = 2ee483af000000ff
	stxa	%l1,[%i5+%g0]0x88	! Mem[0000000010141400] = 04171c8001c31abb
!	Mem[00000000300c1408] = ffffffff, %l4 = 00000000006800ff
	swapa	[%i3+%o4]0x89,%l4	! %l4 = 00000000ffffffff
!	%l6 = 0000000000662049, Mem[00000000300c1408] = ff006800
	stwa	%l6,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00662049
!	%f18 = ff000000 afffffff, Mem[00000000300c1408] = 00662049 00000000
	stda	%f18,[%i3+%o4]0x81	! Mem[00000000300c1408] = ff000000 afffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = ff000000ff400007, %l7 = 0000000000000000
	ldxa	[%i0+%o5]0x89,%l7	! %l7 = ff000000ff400007

p0_label_145:
!	Mem[0000000010081408] = ff0000ff, %l5 = 0000000000a59ab5
	lduwa	[%i2+%o4]0x88,%l5	! %l5 = 00000000ff0000ff
!	Mem[0000000030081410] = 00000062 00000000, %l2 = 000000fd, %l3 = 0000ffff
	ldda	[%i2+%o5]0x81,%l2	! %l2 = 0000000000000062 0000000000000000
!	Mem[00000000100c1418] = e137cf039237c966, %l3 = 0000000000000000
	ldx	[%i3+0x018],%l3		! %l3 = e137cf039237c966
!	Mem[0000000030041410] = 00000000, %l3 = e137cf039237c966
	lduba	[%i1+%o5]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000030001410] = ff400007, %l1 = 04171c8001c31abb
	ldsba	[%i0+%o5]0x89,%l1	! %l1 = 0000000000000007
!	Mem[0000000010101400] = 49206600, %l3 = 0000000000000000
	lduwa	[%i4+%g0]0x88,%l3	! %l3 = 0000000049206600
!	Mem[0000000030141400] = 000000e4, %l5 = 00000000ff0000ff
	lduba	[%i5+%g0]0x89,%l5	! %l5 = 00000000000000e4
!	Mem[0000000010081400] = ffffff7f 1112413c, %l0 = 213cc5c5, %l1 = 00000007
	ldda	[%i2+%g0]0x80,%l0	! %l0 = 00000000ffffff7f 000000001112413c
!	Mem[0000000030081410] = 0000000062000000, %l0 = 00000000ffffff7f
	ldxa	[%i2+%o5]0x89,%l0	! %l0 = 0000000062000000
!	Starting 10 instruction Store Burst
!	%l4 = ffffffff, %l5 = 000000e4, Mem[0000000010101408] = 49206600 00000000
	stda	%l4,[%i4+%o4]0x88	! Mem[0000000010101408] = ffffffff 000000e4

p0_label_146:
!	Mem[0000000010081400] = 7fffffff, %l1 = 000000001112413c
	swapa	[%i2+%g0]0x88,%l1	! %l1 = 000000007fffffff
!	Mem[000000001004142c] = 00000068, %l6 = 0000000000662049
	ldstub	[%i1+0x02c],%l6		! %l6 = 00000000000000ff
!	%l5 = 00000000000000e4, Mem[0000000030081408] = 2ee483afd53b056d
	stxa	%l5,[%i2+%o4]0x89	! Mem[0000000030081408] = 00000000000000e4
!	Mem[0000000010041400] = 49206600, %l2 = 0000000000000062
	swapa	[%i1+%g0]0x88,%l2	! %l2 = 0000000049206600
!	%f28 = 7271fd80 ffdbe53e, %l3 = 0000000049206600
!	Mem[0000000010101438] = 00000000006d0000
	add	%i4,0x038,%g1
	stda	%f28,[%g1+%l3]ASI_PST16_P ! Mem[0000000010101438] = 00000000006d0000
!	%l0 = 0000000062000000, Mem[0000000030081408] = e400000000000000
	stxa	%l0,[%i2+%o4]0x81	! Mem[0000000030081408] = 0000000062000000
!	Mem[00000000100c1400] = ff37c966, %l5 = 00000000000000e4
	ldstuba	[%i3+%g0]0x80,%l5	! %l5 = 000000ff000000ff
!	Mem[000000001010142c] = 9a41c1ff, %l4 = 00000000ffffffff, %asi = 80
	swapa	[%i4+0x02c]%asi,%l4	! %l4 = 000000009a41c1ff
!	%l6 = 0000000000000000, Mem[0000000030081400] = 8be483af
	stwa	%l6,[%i2+%g0]0x81	! Mem[0000000030081400] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = 00000000, %l4 = 000000009a41c1ff
	ldsba	[%i1+%o5]0x81,%l4	! %l4 = 0000000000000000

p0_label_147:
!	Mem[00000000300c1408] = ff000000afffffff, %l7 = ff000000ff400007
	ldxa	[%i3+%o4]0x81,%l7	! %l7 = ff000000afffffff
!	Mem[0000000010141408] = 00000000, %l2 = 0000000049206600
	lduwa	[%i5+%o4]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000010141438] = ffffff7f, %f21 = 76b6b320
	ld	[%i5+0x038],%f21	! %f21 = ffffff7f
!	Mem[0000000010101408] = ffffffff e4000000, %l4 = 00000000, %l5 = 000000ff
	ldd	[%i4+%o4],%l4		! %l4 = 00000000ffffffff 00000000e4000000
!	Mem[0000000030081400] = 00000000, %l5 = 00000000e4000000
	lduba	[%i2+%g0]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000010141424] = ffffffff, %l2 = 0000000000000000
	ldub	[%i5+0x025],%l2		! %l2 = 00000000000000ff
!	Mem[0000000030001410] = ff400007, %f29 = ffdbe53e
	lda	[%i0+%o5]0x89,%f29	! %f29 = ff400007
!	Mem[0000000010041408] = 5d662049 00004988, %l2 = 000000ff, %l3 = 49206600
	ldda	[%i1+%o4]0x88,%l2	! %l2 = 0000000000004988 000000005d662049
!	Mem[0000000010141404] = 801c1704, %l6 = 0000000000000000
	lduha	[%i5+0x006]%asi,%l6	! %l6 = 0000000000001704
!	Starting 10 instruction Store Burst
!	Mem[0000000030041410] = 00000000, %l5 = 0000000000000000
	swapa	[%i1+%o5]0x89,%l5	! %l5 = 0000000000000000

p0_label_148:
!	%l1 = 000000007fffffff, Mem[000000001004142c] = ff000068, %asi = 80
	stwa	%l1,[%i1+0x02c]%asi	! Mem[000000001004142c] = 7fffffff
!	Mem[0000000030141408] = 8b0000ff, %l0 = 0000000062000000
	ldstuba	[%i5+%o4]0x81,%l0	! %l0 = 0000008b000000ff
!	Mem[0000000030141410] = 92000000, %l2 = 0000000000004988
	ldstuba	[%i5+%o5]0x81,%l2	! %l2 = 00000092000000ff
!	%l3 = 000000005d662049, Mem[0000000030181408] = 000000000000ffff
	stxa	%l3,[%i6+%o4]0x81	! Mem[0000000030181408] = 000000005d662049
!	Mem[0000000010181420] = 00000000, %l3 = 000000005d662049
	swap	[%i6+0x020],%l3		! %l3 = 0000000000000000
!	Mem[0000000010041410] = 20b3b676, %l3 = 0000000000000000
	ldstuba	[%i1+%o5]0x80,%l3	! %l3 = 00000020000000ff
!	%l0 = 0000008b, %l1 = 7fffffff, Mem[00000000100c1410] = 00000000 00000000
	std	%l0,[%i3+%o5]		! Mem[00000000100c1410] = 0000008b 7fffffff
!	Mem[0000000030041410] = 00000000, %l5 = 0000000000000000
	ldstuba	[%i1+%o5]0x89,%l5	! %l5 = 00000000000000ff
!	%f22 = 80fd7172, Mem[0000000030141400] = e4000000
	sta	%f22,[%i5+%g0]0x81	! Mem[0000000030141400] = 80fd7172
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = 3c4112111112413c, %f2  = 6d053bd5 af83e42e
	ldda	[%i2+%g0]0x88,%f2 	! %f2  = 3c411211 1112413c

p0_label_149:
!	Mem[0000000010101430] = 00000000, %l6 = 0000000000001704
	ldsh	[%i4+0x032],%l6		! %l6 = 0000000000000000
!	Mem[0000000010081400] = 1112413c, %l5 = 0000000000000000
	lduba	[%i2+%g0]0x88,%l5	! %l5 = 000000000000003c
!	%f30 = 2fffffff, %f23 = 49206600, %f1  = 8d1e3315
	fsubs	%f30,%f23,%f1 		! %f1  = c9206600
!	Mem[00000000300c1410] = 00000000, %l4 = 00000000ffffffff
	ldsba	[%i3+%o5]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000030081400] = 15331e8d00000000, %f6  = ccc989c0 c971ce8e
	ldda	[%i2+%g0]0x89,%f6 	! %f6  = 15331e8d 00000000
!	Mem[000000001014143c] = ffffff2f, %l3 = 0000000000000020
	ldsha	[%i5+0x03e]%asi,%l3	! %l3 = ffffffffffffff2f
!	%l2 = 0000000000000092, %l5 = 000000000000003c, %l3 = ffffffffffffff2f
	xnor	%l2,%l5,%l3		! %l3 = ffffffffffffff51
!	Mem[0000000030141410] = af000000000000ff, %f6  = 15331e8d 00000000
	ldda	[%i5+%o5]0x89,%f6 	! %f6  = af000000 000000ff
!	Mem[0000000010041408] = 884900004920665d, %l6 = 0000000000000000
	ldxa	[%i1+%o4]0x80,%l6	! %l6 = 884900004920665d
!	Starting 10 instruction Store Burst
!	%l7 = ff000000afffffff, Mem[0000000010001400] = 00000000000000ff
	stxa	%l7,[%i0+%g0]0x80	! Mem[0000000010001400] = ff000000afffffff

p0_label_150:
!	%l4 = 0000000000000000, Mem[0000000030081410] = 62000000
	stba	%l4,[%i2+%o5]0x89	! Mem[0000000030081410] = 62000000
!	Mem[000000001018142c] = 19e5b62e, %l7 = ff000000afffffff, %asi = 80
	swapa	[%i6+0x02c]%asi,%l7	! %l7 = 0000000019e5b62e
!	Mem[0000000010081421] = 00a59ab5, %l2 = 0000000000000092
	ldstub	[%i2+0x021],%l2		! %l2 = 000000a5000000ff
!	Mem[0000000030181410] = 7fffffff, %l6 = 884900004920665d
	ldstuba	[%i6+%o5]0x89,%l6	! %l6 = 000000ff000000ff
!	Mem[0000000010141410] = ff006800, %l3 = ffffffffffffff51
	ldstuba	[%i5+%o5]0x80,%l3	! %l3 = 000000ff000000ff
!	%l3 = 00000000000000ff, Mem[0000000030141408] = ff0000ff
	stba	%l3,[%i5+%o4]0x89	! Mem[0000000030141408] = ff0000ff
!	%l6 = 00000000000000ff, Mem[0000000020800000] = 000017e8
	stb	%l6,[%o1+%g0]		! Mem[0000000020800000] = ff0017e8
!	%f15 = 4f979be2, Mem[00000000100c1410] = 0000008b
	sta	%f15,[%i3+%o5]0x80	! Mem[00000000100c1410] = 4f979be2
!	%f4  = 00000062 00000000, %l5 = 000000000000003c
!	Mem[0000000010041400] = 6200000000000000
	stda	%f4,[%i1+%l5]ASI_PST8_P ! Mem[0000000010041400] = 6200006200000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = e4000000, %l7 = 0000000019e5b62e
	ldsha	[%i4+%o4]0x81,%l7	! %l7 = ffffffffffffe400

p0_label_151:
!	Mem[0000000010141428] = 00000080 4920665d, %l0 = 0000008b, %l1 = 7fffffff
	ldd	[%i5+0x028],%l0		! %l0 = 0000000000000080 000000004920665d
!	Mem[0000000030001400] = 4920660000000000, %f10 = ff400007 db995109
	ldda	[%i0+%g0]0x81,%f10	! %f10 = 49206600 00000000
!	Mem[0000000030081408] = 00000000, %l5 = 000000000000003c
	ldsba	[%i2+%o4]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000010181400] = c700000000000000, %f30 = 2fffffff 00000000
	ldda	[%i6+%g0]0x88,%f30	! %f30 = c7000000 00000000
!	Mem[00000000218000c0] = 00ff4926, %l7 = ffffffffffffe400
	lduba	[%o3+0x0c1]%asi,%l7	! %l7 = 00000000000000ff
!	Mem[00000000201c0000] = 00ff19af, %l7 = 00000000000000ff
	ldsba	[%o0+0x000]%asi,%l7	! %l7 = 0000000000000000
!	Mem[0000000010141410] = ff006800 b59aa500, %l0 = 00000080, %l1 = 4920665d
	ldda	[%i5+%o5]0x80,%l0	! %l0 = 00000000ff006800 00000000b59aa500
!	Mem[0000000030181410] = 2fffffff7fffffff, %f24 = ffffffff 2eb6e519
	ldda	[%i6+%o5]0x89,%f24	! %f24 = 2fffffff 7fffffff
!	Mem[00000000100c1424] = 022800e0, %l6 = 00000000000000ff
	lduha	[%i3+0x024]%asi,%l6	! %l6 = 0000000000000228
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000000000, Mem[00000000100c1408] = 49206600
	stha	%l4,[%i3+%o4]0x88	! Mem[00000000100c1408] = 49200000

p0_label_152:
!	Mem[0000000010041410] = ffb3b676, %l2 = 00000000000000a5
	ldstuba	[%i1+%o5]0x80,%l2	! %l2 = 000000ff000000ff
!	%l5 = 0000000000000000, Mem[00000000211c0000] = ffff980d, %asi = 80
	stba	%l5,[%o2+0x000]%asi	! Mem[00000000211c0000] = 00ff980d
!	%l5 = 0000000000000000, Mem[00000000201c0000] = 00ff19af, %asi = 80
	stha	%l5,[%o0+0x000]%asi	! Mem[00000000201c0000] = 000019af
!	%f4  = 00000062 00000000, Mem[0000000010141408] = 00000000 000000ff
	stda	%f4 ,[%i5+0x008]%asi	! Mem[0000000010141408] = 00000062 00000000
!	Mem[0000000030141408] = ff0000ff, %l3 = 00000000000000ff
	swapa	[%i5+%o4]0x89,%l3	! %l3 = 00000000ff0000ff
!	%f12 = 3a9fb502 0c281024, Mem[0000000030101408] = e4000000 afffffff
	stda	%f12,[%i4+%o4]0x81	! Mem[0000000030101408] = 3a9fb502 0c281024
!	%f26 = 7fffffff 00000000, %l1 = 00000000b59aa500
!	Mem[0000000030081428] = ff400007db995109
	add	%i2,0x028,%g1
	stda	%f26,[%g1+%l1]ASI_PST16_SL ! Mem[0000000030081428] = ff400007db995109
!	%l3 = 00000000ff0000ff, Mem[0000000010141402] = bb1ac301, %asi = 80
	stha	%l3,[%i5+0x002]%asi	! Mem[0000000010141400] = bb1a00ff
!	Mem[0000000010141438] = ffffff7fffffff2f, %l0 = 00000000ff006800, %l3 = 00000000ff0000ff
	add	%i5,0x38,%g1
	casxa	[%g1]0x80,%l0,%l3	! %l3 = ffffff7fffffff2f
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = ff0000ff4920665d, %l5 = 0000000000000000
	ldxa	[%i2+%o4]0x80,%l5	! %l5 = ff0000ff4920665d

p0_label_153:
!	Mem[00000000100c1410] = ffffff7fe29b974f, %f22 = 80fd7172 49206600
	ldda	[%i3+%o5]0x88,%f22	! %f22 = ffffff7f e29b974f
!	Mem[0000000010181400] = 00000000, %l1 = 00000000b59aa500
	ldswa	[%i6+%g0]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000030181410] = 7fffffff, %f10 = 49206600
	lda	[%i6+%o5]0x89,%f10	! %f10 = 7fffffff
!	Mem[0000000010101438] = 00000000 006d0000, %l0 = ff006800, %l1 = 00000000
	ldda	[%i4+0x038]%asi,%l0	! %l0 = 0000000000000000 00000000006d0000
!	Mem[0000000010041410] = ffb3b676, %l6 = 0000000000000228
	lduwa	[%i1+%o5]0x80,%l6	! %l6 = 00000000ffb3b676
!	Mem[00000000218001c0] = 1afff4cf, %l3 = ffffff7fffffff2f
	ldsha	[%o3+0x1c0]%asi,%l3	! %l3 = 0000000000001aff
!	Mem[0000000030181400] = 62000000, %l2 = 00000000000000ff
	lduba	[%i6+%g0]0x81,%l2	! %l2 = 0000000000000062
!	Mem[0000000010041408] = 88490000, %l2 = 0000000000000062
	ldsha	[%i1+%o4]0x80,%l2	! %l2 = ffffffffffff8849
!	%f12 = 3a9fb502, %f4  = 00000062, %f25 = 7fffffff
	fadds	%f12,%f4 ,%f25		! %l0 = 0000000000000022, Unfinished, %fsr = 2500000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010101410] = 3500885f00000000, %l4 = 0000000000000000, %l7 = 0000000000000000
	add	%i4,0x10,%g1
	casxa	[%g1]0x80,%l4,%l7	! %l7 = 3500885f00000000

p0_label_154:
!	Mem[0000000030101408] = 02b59f3a, %l2 = ffffffffffff8849
	swapa	[%i4+%o4]0x89,%l2	! %l2 = 0000000002b59f3a
!	Mem[0000000010101408] = ffffffff, %l1 = 00000000006d0000
	swap	[%i4+%o4],%l1		! %l1 = 00000000ffffffff
!	%l4 = 0000000000000000, Mem[0000000030181400] = 00000062
	stwa	%l4,[%i6+%g0]0x89	! Mem[0000000030181400] = 00000000
!	%f10 = 7fffffff 00000000, Mem[0000000010001408] = ff000000 000000e4
	stda	%f10,[%i0+%o4]0x80	! Mem[0000000010001408] = 7fffffff 00000000
!	%l0 = 0000000000000022, Mem[0000000010181410] = 49206600
	stha	%l0,[%i6+%o5]0x88	! Mem[0000000010181410] = 49200022
!	Mem[0000000010101410] = 3500885f, %l3 = 0000000000001aff, %asi = 80
	swapa	[%i4+0x010]%asi,%l3	! %l3 = 000000003500885f
!	%l6 = ffb3b676, %l7 = 00000000, Mem[0000000010181420] = 5d662049 b59aa500
	stda	%l6,[%i6+0x020]%asi	! Mem[0000000010181420] = ffb3b676 00000000
!	Mem[0000000010181408] = 00000000, %l7 = 3500885f00000000
	ldstuba	[%i6+%o4]0x88,%l7	! %l7 = 00000000000000ff
!	%f28 = 7271fd80 ff400007, Mem[00000000300c1410] = 00000000 7a000000
	stda	%f28,[%i3+%o5]0x89	! Mem[00000000300c1410] = 7271fd80 ff400007
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = 00000000, %l0 = 0000000000000022
	ldswa	[%i6+%o4]0x89,%l0	! %l0 = 0000000000000000

p0_label_155:
!	Mem[0000000030181400] = 00000000000000e4, %l3 = 000000003500885f
	ldxa	[%i6+%g0]0x81,%l3	! %l3 = 00000000000000e4
!	Mem[0000000010101400] = 006620494a27ace9, %l5 = ff0000ff4920665d
	ldxa	[%i4+%g0]0x80,%l5	! %l5 = 006620494a27ace9
!	Mem[0000000010081400] = 3c411211 1112413c, %l0 = 00000000, %l1 = ffffffff
	ldda	[%i2+%g0]0x80,%l0	! %l0 = 000000003c411211 000000001112413c
!	Mem[00000000211c0000] = 00ff980d, %l3 = 00000000000000e4
	lduh	[%o2+%g0],%l3		! %l3 = 00000000000000ff
!	Mem[0000000010001408] = 7fffffff 00000000, %l2 = 02b59f3a, %l3 = 000000ff
	ldda	[%i0+%o4]0x80,%l2	! %l2 = 000000007fffffff 0000000000000000
!	Mem[0000000030141408] = 000000ff, %f30 = c7000000
	lda	[%i5+%o4]0x89,%f30	! %f30 = 000000ff
!	Mem[0000000010001408] = 00000000 ffffff7f, %l2 = 7fffffff, %l3 = 00000000
	ldda	[%i0+%o4]0x88,%l2	! %l2 = 00000000ffffff7f 0000000000000000
!	Mem[0000000030081410] = 62000000, %l2 = 00000000ffffff7f
	ldsha	[%i2+%o5]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000010141400] = 04171c80ff001abb, %f28 = 7271fd80 ff400007
	ldda	[%i5+%g0]0x88,%f28	! %f28 = 04171c80 ff001abb
!	Starting 10 instruction Store Burst
!	%l4 = 00000000, %l5 = 4a27ace9, Mem[0000000010181400] = 00000000 000000c7
	stda	%l4,[%i6+%g0]0x80	! Mem[0000000010181400] = 00000000 4a27ace9

p0_label_156:
!	%f20 = e4000000, %f31 = 00000000
	fcmps	%fcc1,%f20,%f31		! %fcc1 = 1
!	%l2 = 0000000000000000, Mem[0000000010081410] = af83e42e
	stha	%l2,[%i2+%o5]0x88	! Mem[0000000010081410] = af830000
!	%l7 = 0000000000000000, %l6 = 00000000ffb3b676, %l2 = 0000000000000000
	addc	%l7,%l6,%l2		! %l2 = 00000000ffb3b676
!	Mem[0000000030001410] = 070040ff, %l3 = 0000000000000000
	ldstuba	[%i0+%o5]0x81,%l3	! %l3 = 00000007000000ff
!	%l7 = 0000000000000000, Mem[0000000030181408] = 00000000
	stha	%l7,[%i6+%o4]0x81	! Mem[0000000030181408] = 00000000
!	%l7 = 0000000000000000, Mem[0000000030181410] = 7fffffff
	stha	%l7,[%i6+%o5]0x89	! Mem[0000000030181410] = 7fff0000
!	Mem[00000000300c1408] = ff000000, %l3 = 0000000000000007
	swapa	[%i3+%o4]0x81,%l3	! %l3 = 00000000ff000000
!	%f16 = ffffffff ffffaf83, %l4 = 0000000000000000
!	Mem[0000000030101430] = 7271fd80ffdbe53e
	add	%i4,0x030,%g1
	stda	%f16,[%g1+%l4]ASI_PST16_SL ! Mem[0000000030101430] = 7271fd80ffdbe53e
!	%f0  = 8be483af c9206600, Mem[0000000010081420] = 00ff9ab5 00000000
	std	%f0 ,[%i2+0x020]	! Mem[0000000010081420] = 8be483af c9206600
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = 5e5d8668, %l6 = 00000000ffb3b676
	ldsha	[%i3+%g0]0x89,%l6	! %l6 = ffffffffffff8668

p0_label_157:
!	Mem[00000000201c0000] = 000019af, %l1 = 000000001112413c
	ldsha	[%o0+0x000]%asi,%l1	! %l1 = 0000000000000000
!	Mem[0000000010181410] = 22002049, %l2 = 00000000ffb3b676
	ldsha	[%i6+%o5]0x80,%l2	! %l2 = 0000000000002200
!	Mem[0000000030101408] = ffff8849, %l2 = 0000000000002200
	ldsha	[%i4+%o4]0x89,%l2	! %l2 = ffffffffffff8849
!	Mem[0000000010041408] = 88490000, %l4 = 0000000000000000
	lduba	[%i1+%o4]0x80,%l4	! %l4 = 0000000000000088
!	Mem[0000000010081410] = 000083af, %l4 = 0000000000000088
	lduha	[%i2+%o5]0x80,%l4	! %l4 = 0000000000000000
!	%l5 = 006620494a27ace9, imm = fffffffffffffa00, %l3 = 00000000ff000000
	orn	%l5,-0x600,%l3		! %l3 = 006620494a27adff
!	Mem[00000000100c1410] = e29b974f, %l2 = ffffffffffff8849
	ldswa	[%i3+%o5]0x88,%l2	! %l2 = ffffffffe29b974f
!	Mem[00000000100c1410] = 4f979be2, %l4 = 0000000000000000
	ldswa	[%i3+%o5]0x80,%l4	! %l4 = 000000004f979be2
!	Mem[0000000010081408] = ff0000ff, %l5 = 006620494a27ace9
	ldsha	[%i2+%o4]0x88,%l5	! %l5 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%f24 = 2fffffff, Mem[0000000010081410] = 000083af
	sta	%f24,[%i2+%o5]0x80	! Mem[0000000010081410] = 2fffffff

p0_label_158:
!	%l0 = 3c411211, %l1 = 00000000, Mem[0000000010181400] = 00000000 e9ac274a
	stda	%l0,[%i6+%g0]0x88	! Mem[0000000010181400] = 3c411211 00000000
!	%l3 = 006620494a27adff, Mem[000000001010141a] = ffffffff, %asi = 80
	stha	%l3,[%i4+0x01a]%asi	! Mem[0000000010101418] = ffffadff
!	%f30 = 000000ff 00000000, Mem[0000000030181410] = 0000ff7f ffffff2f
	stda	%f30,[%i6+%o5]0x81	! Mem[0000000030181410] = 000000ff 00000000
!	%f22 = ffffff7f, %f12 = 3a9fb502, %f30 = 000000ff
	fadds	%f22,%f12,%f30		! %f30 = ffffff7f
!	Mem[0000000030141410] = ff000000, %l1 = 0000000000000000
	swapa	[%i5+%o5]0x81,%l1	! %l1 = 00000000ff000000
!	%l6 = ffff8668, %l7 = 00000000, Mem[0000000010101430] = 00000000 00000000
	std	%l6,[%i4+0x030]		! Mem[0000000010101430] = ffff8668 00000000
!	Mem[0000000030081400] = 00000000, %l2 = ffffffffe29b974f
	swapa	[%i2+%g0]0x81,%l2	! %l2 = 0000000000000000
!	%l4 = 000000004f979be2, Mem[0000000010181400] = 1112413c00000000
	stxa	%l4,[%i6+%g0]0x80	! Mem[0000000010181400] = 000000004f979be2
!	%f28 = 04171c80, %f2  = 3c411211
	fcmps	%fcc1,%f28,%f2 		! %fcc1 = 1
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = e9ac274a49206600, %f20 = e4000000 ffffff7f
	ldda	[%i4+%g0]0x88,%f20	! %f20 = e9ac274a 49206600

p0_label_159:
!	Mem[0000000010141408] = 00000062, %l2 = 0000000000000000
	lduwa	[%i5+%o4]0x80,%l2	! %l2 = 0000000000000062
!	Mem[0000000010141400] = bb1a00ff, %l7 = 0000000000000000
	ldsba	[%i5+%g0]0x80,%l7	! %l7 = ffffffffffffffbb
!	Mem[0000000030041410] = 83afffff000000ff, %f2  = 3c411211 1112413c
	ldda	[%i1+%o5]0x89,%f2 	! %f2  = 83afffff 000000ff
!	Mem[0000000010101428] = 0000007a, %l7 = ffffffffffffffbb
	lduwa	[%i4+0x028]%asi,%l7	! %l7 = 000000000000007a
!	Mem[0000000030001410] = ff4000ff, %l0 = 000000003c411211
	lduha	[%i0+%o5]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[000000001004141c] = 03cf37e1, %l2 = 0000000000000062
	lduha	[%i1+0x01c]%asi,%l2	! %l2 = 00000000000003cf
!	Mem[0000000030181400] = 00000000, %l5 = 00000000000000ff
	ldsha	[%i6+%g0]0x81,%l5	! %l5 = 0000000000000000
!	Mem[00000000100c1410] = e29b974f, %l0 = 00000000000000ff
	lduha	[%i3+%o5]0x88,%l0	! %l0 = 000000000000974f
!	Mem[0000000010001408] = ffffff7f, %l7 = 000000000000007a
	ldsha	[%i0+%o4]0x88,%l7	! %l7 = ffffffffffffff7f
!	Starting 10 instruction Store Burst
!	%l6 = ffffffffffff8668, Mem[0000000010101410] = 00001aff
	stha	%l6,[%i4+%o5]0x80	! Mem[0000000010101410] = 86681aff

p0_label_160:
!	Mem[0000000010081408] = ff0000ff, %l2 = 00000000000003cf
	swapa	[%i2+%o4]0x88,%l2	! %l2 = 00000000ff0000ff
!	%l0 = 000000000000974f, Mem[0000000030141408] = 000000ff
	stwa	%l0,[%i5+%o4]0x89	! Mem[0000000030141408] = 0000974f
!	%f26 = 7fffffff 00000000, Mem[0000000010101410] = ff1a6886 00000000
	stda	%f26,[%i4+%o5]0x88	! Mem[0000000010101410] = 7fffffff 00000000
!	%f12 = 3a9fb502 0c281024, %l5 = 0000000000000000
!	Mem[0000000010041418] = 66c9379203cf37e1
	add	%i1,0x018,%g1
	stda	%f12,[%g1+%l5]ASI_PST8_PL ! Mem[0000000010041418] = 66c9379203cf37e1
!	%l0 = 0000974f, %l1 = ff000000, Mem[0000000030181408] = 00000000 5d662049
	stda	%l0,[%i6+%o4]0x81	! Mem[0000000030181408] = 0000974f ff000000
!	%l2 = 00000000ff0000ff, Mem[00000000201c0001] = 000019af, %asi = 80
	stba	%l2,[%o0+0x001]%asi	! Mem[00000000201c0000] = 00ff19af
!	Code Fragment 4
p0_fragment_10:
!	%l0 = 000000000000974f
	setx	0x66efeae0589973ca,%g7,%l0 ! %l0 = 66efeae0589973ca
!	%l1 = 00000000ff000000
	setx	0x2718dc57cec64699,%g7,%l1 ! %l1 = 2718dc57cec64699
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 66efeae0589973ca
	setx	0x053de2e7d4710c8c,%g7,%l0 ! %l0 = 053de2e7d4710c8c
!	%l1 = 2718dc57cec64699
	setx	0xfbe381e794c35275,%g7,%l1 ! %l1 = fbe381e794c35275
!	Mem[00000000211c0001] = 00ff980d, %l7 = ffffffffffffff7f
	ldstub	[%o2+0x001],%l7		! %l7 = 000000ff000000ff
!	Mem[000000001008142c] = 00003500, %l4 = 000000004f979be2
	ldstuba	[%i2+0x02c]%asi,%l4	! %l4 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = 76b6b320, %f21 = 49206600
	lda	[%i0+%o5]0x80,%f21	! %f21 = 76b6b320

p0_label_161:
!	Mem[0000000010001430] = 72712802e4000000, %l3 = 006620494a27adff
	ldx	[%i0+0x030],%l3		! %l3 = 72712802e4000000
!	Mem[00000000211c0000] = 00ff980d, %l3 = 72712802e4000000
	ldub	[%o2+%g0],%l3		! %l3 = 0000000000000000
	membar	#Sync			! Added by membar checker (25)
!	Mem[0000000010141400] = bb1a00ff 801c1704 00000062 00000000
!	Mem[0000000010141410] = ff006800 b59aa500 8ece71c9 000000ff
!	Mem[0000000010141420] = ff000000 ffffffff 00000080 4920665d
!	Mem[0000000010141430] = 3ee5dbff 80fd7172 ffffff7f ffffff2f
	ldda	[%i5]ASI_BLK_P,%f0	! Block Load from 0000000010141400
!	Mem[0000000030001400] = 49206600 00000000 0000ff5d 4920665d
!	Mem[0000000030001410] = ff0040ff 000000ff ffffe519 c971ce8e
!	Mem[0000000030001420] = 491588d6 4920665d 00000008 ff000000
!	Mem[0000000030001430] = 7271fd80 ffdbe53e 3500885f 00000000
	ldda	[%i0]ASI_BLK_SL,%f0	! Block Load from 0000000030001400
!	Mem[0000000010001410] = 76b6b320, %l6 = ffffffffffff8668
	lduba	[%i0+%o5]0x80,%l6	! %l6 = 0000000000000076
!	Mem[0000000010181400] = 00000000, %l2 = 00000000ff0000ff
	ldsba	[%i6+%g0]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000030181410] = 000000ff00000000, %l5 = 0000000000000000
	ldxa	[%i6+%o5]0x81,%l5	! %l5 = 000000ff00000000
!	Mem[0000000010101400] = 00662049, %l6 = 0000000000000076
	lduha	[%i4+%g0]0x80,%l6	! %l6 = 0000000000000066
!	Mem[00000000100c1404] = 00000068, %l6 = 0000000000000066
	ldswa	[%i3+0x004]%asi,%l6	! %l6 = 0000000000000068
!	Starting 10 instruction Store Burst
!	%l7 = 00000000000000ff, imm = 0000000000000ca9, %l6 = 0000000000000068
	andn	%l7,0xca9,%l6		! %l6 = 0000000000000056

p0_label_162:
!	%l0 = 053de2e7d4710c8c, Mem[00000000300c1408] = 07000000
	stwa	%l0,[%i3+%o4]0x89	! Mem[00000000300c1408] = d4710c8c
!	%l3 = 0000000000000000, Mem[0000000010101408] = 00006d00
	stwa	%l3,[%i4+%o4]0x88	! Mem[0000000010101408] = 00000000
!	%f28 = 04171c80 ff001abb, Mem[00000000100c1400] = ff37c966 00000068
	stda	%f28,[%i3+%g0]0x80	! Mem[00000000100c1400] = 04171c80 ff001abb
!	Mem[0000000010001415] = 83afffff, %l1 = fbe381e794c35275
	ldstub	[%i0+0x015],%l1		! %l1 = 000000af000000ff
!	%l3 = 0000000000000000, immd = 00000000000008a0, %l3  = 0000000000000000
	mulx	%l3,0x8a0,%l3		! %l3 = 0000000000000000
!	Mem[0000000010041400] = 62000062, %l0 = 053de2e7d4710c8c
	swap	[%i1+%g0],%l0		! %l0 = 0000000062000062
!	%l6 = 00000056, %l7 = 000000ff, Mem[0000000030101410] = e4000000 76b6b320
	stda	%l6,[%i4+%o5]0x81	! Mem[0000000030101410] = 00000056 000000ff
!	Mem[00000000300c1408] = 8c0c71d4, %l1 = 00000000000000af
	ldstuba	[%i3+%o4]0x81,%l1	! %l1 = 0000008c000000ff
!	Mem[00000000100c1400] = 801c1704, %l3 = 0000000000000000
	swapa	[%i3+%g0]0x88,%l3	! %l3 = 00000000801c1704
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = ff000000, %f23 = e29b974f
	lda	[%i6+%o4]0x80,%f23	! %f23 = ff000000

p0_label_163:
!	Mem[00000000100c1410] = e29b974f, %l5 = 000000ff00000000
	lduwa	[%i3+%o5]0x88,%l5	! %l5 = 00000000e29b974f
!	Mem[0000000010141410] = ff006800, %l4 = 0000000000000000
	ldsba	[%i5+%o5]0x80,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000030001410] = ff0040ff, %l2 = 0000000000000000
	lduwa	[%i0+%o5]0x81,%l2	! %l2 = 00000000ff0040ff
!	Mem[0000000030041400] = 213cc5c5, %l0 = 0000000062000062
	lduba	[%i1+%g0]0x89,%l0	! %l0 = 00000000000000c5
!	%f25 = 7fffffff, %f16 = ffffffff
	fsqrts	%f25,%f16		! %f16 = 7fffffff
!	Mem[0000000030041400] = c5c53c21c8941a45, %f16 = 7fffffff ffffaf83
	ldda	[%i1+%g0]0x81,%f16	! %f16 = c5c53c21 c8941a45
!	Mem[0000000010101420] = 0418b91c, %l0 = 00000000000000c5
	ldsh	[%i4+0x022],%l0		! %l0 = ffffffffffffb91c
!	Mem[0000000010101400] = 00662049, %l3 = 00000000801c1704
	lduwa	[%i4+%g0]0x80,%l3	! %l3 = 0000000000662049
!	Mem[0000000030081410] = 0000006200000000, %l1 = 000000000000008c
	ldxa	[%i2+%o5]0x81,%l1	! %l1 = 0000006200000000
!	Starting 10 instruction Store Burst
!	%l4 = ffffffffffffffff, Mem[0000000010001400] = ff000000
	stwa	%l4,[%i0+%g0]0x80	! Mem[0000000010001400] = ffffffff

p0_label_164:
!	%l6 = 0000000000000056, Mem[0000000030041408] = 68005dff
	stwa	%l6,[%i1+%o4]0x81	! Mem[0000000030041408] = 00000056
!	Mem[00000000100c1438] = 10ca031c, %l6 = 0000000000000056
	swap	[%i3+0x038],%l6		! %l6 = 0000000010ca031c
	membar	#Sync			! Added by membar checker (26)
!	%f18 = ff000000 afffffff, Mem[0000000010141408] = 00000062 00000000
	stda	%f18,[%i5+%o4]0x80	! Mem[0000000010141408] = ff000000 afffffff
!	%l4 = ffffffffffffffff, Mem[0000000030181400] = 00000000
	stba	%l4,[%i6+%g0]0x89	! Mem[0000000030181400] = 000000ff
!	Mem[00000000300c1400] = 68865d5e, %l7 = 00000000000000ff
	swapa	[%i3+%g0]0x81,%l7	! %l7 = 0000000068865d5e
!	Mem[0000000030001400] = 49206600, %l3 = 0000000000662049
	ldstuba	[%i0+%g0]0x81,%l3	! %l3 = 00000049000000ff
!	%f29 = ff001abb, %f20 = e9ac274a
	fcmpes	%fcc3,%f29,%f20		! %fcc3 = 1
!	Code Fragment 3
p0_fragment_11:
!	%l0 = ffffffffffffb91c
	setx	0xa4891ff78885412c,%g7,%l0 ! %l0 = a4891ff78885412c
!	%l1 = 0000006200000000
	setx	0x7d5c1d1fa2cc4323,%g7,%l1 ! %l1 = 7d5c1d1fa2cc4323
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = a4891ff78885412c
	setx	0x58e01358269ed476,%g7,%l0 ! %l0 = 58e01358269ed476
!	%l1 = 7d5c1d1fa2cc4323
	setx	0xb613ee1807d81ee7,%g7,%l1 ! %l1 = b613ee1807d81ee7
!	Mem[0000000010041408] = 88490000, %l1 = 07d81ee7, %l2 = ff0040ff
	add	%i1,0x08,%g1
	casa	[%g1]0x80,%l1,%l2	! %l2 = 0000000088490000
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = ff000000 ff4000ff, %l6 = 10ca031c, %l7 = 68865d5e
	ldda	[%i0+%o5]0x89,%l6	! %l6 = 00000000ff4000ff 00000000ff000000

p0_label_165:
!	Mem[0000000030001410] = ff0040ff, %l6 = 00000000ff4000ff
	lduwa	[%i0+%o5]0x81,%l6	! %l6 = 00000000ff0040ff
!	Mem[00000000100c1408] = 49200000, %l3 = 0000000000000049
	ldswa	[%i3+%o4]0x88,%l3	! %l3 = 0000000049200000
!	Mem[0000000030001400] = ff20660000000000, %l3 = 0000000049200000
	ldxa	[%i0+%g0]0x81,%l3	! %l3 = ff20660000000000
!	Mem[0000000010041410] = ffb3b676, %l5 = 00000000e29b974f
	lduwa	[%i1+%o5]0x80,%l5	! %l5 = 00000000ffb3b676
!	Mem[0000000030141410] = 00000000, %l4 = ffffffffffffffff
	ldsba	[%i5+%o5]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000010141424] = ffffffff, %f19 = afffffff
	ld	[%i5+0x024],%f19	! %f19 = ffffffff
!	Mem[000000001008143c] = ffffffff, %l1 = b613ee1807d81ee7
	ldsw	[%i2+0x03c],%l1		! %l1 = ffffffffffffffff
!	Mem[0000000030141400] = 20b3b6767271fd80, %l2 = 0000000088490000
	ldxa	[%i5+%g0]0x89,%l2	! %l2 = 20b3b6767271fd80
!	Mem[0000000030041400] = c5c53c21 c8941a45 00000056 00000000
!	Mem[0000000030041410] = ff000000 ffffaf83 b082273f 81646ed8
!	Mem[0000000030041420] = 07fefd24 30fbc62b 82f0fa56 4746726e
!	Mem[0000000030041430] = 96c4166b 25f00000 ec0404c9 f9c9cf7f
	ldda	[%i1]ASI_BLK_S,%f0	! Block Load from 0000000030041400
!	Starting 10 instruction Store Burst
!	Mem[0000000030101400] = ffffffff, %l3 = ff20660000000000
	swapa	[%i4+%g0]0x81,%l3	! %l3 = 00000000ffffffff

p0_label_166:
!	Mem[0000000010181430] = 4049c358fea97ab2, %l2 = 20b3b6767271fd80, %l7 = 00000000ff000000
	add	%i6,0x30,%g1
	casxa	[%g1]0x80,%l2,%l7	! %l7 = 4049c358fea97ab2
!	Mem[0000000030081408] = 00000000, %l4 = 0000000000000000
	swapa	[%i2+%o4]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000030141400] = 80fd7172, %l4 = 0000000000000000
	ldstuba	[%i5+%g0]0x81,%l4	! %l4 = 00000080000000ff
!	%l2 = 7271fd80, %l3 = ffffffff, Mem[0000000010141408] = 000000ff ffffffaf
	stda	%l2,[%i5+%o4]0x88	! Mem[0000000010141408] = 7271fd80 ffffffff
!	Mem[0000000030041400] = c5c53c21, %l7 = 4049c358fea97ab2
	swapa	[%i1+%g0]0x81,%l7	! %l7 = 00000000c5c53c21
!	Mem[0000000010101400] = 00662049, %l4 = 00000080, %l7 = c5c53c21
	casa	[%i4]0x80,%l4,%l7	! %l7 = 0000000000662049
!	%f21 = 76b6b320, Mem[0000000030081400] = 4f979be2
	sta	%f21,[%i2+%g0]0x89	! Mem[0000000030081400] = 76b6b320
!	%f28 = 04171c80, %f26 = 7fffffff, %f31 = 00000000
	fdivs	%f28,%f26,%f31		! %f31 = 7fffffff
!	Mem[0000000010081410] = 2fffffff00000000, %l4 = 0000000000000080, %l0 = 58e01358269ed476
	add	%i2,0x10,%g1
	casxa	[%g1]0x80,%l4,%l0	! %l0 = 2fffffff00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = bb1a00ff, %f23 = ff000000
	lda	[%i5+%g0]0x80,%f23	! %f23 = bb1a00ff

p0_label_167:
!	Mem[00000000300c1408] = ffffffafd4710cff, %f18 = ff000000 ffffffff
	ldda	[%i3+%o4]0x89,%f18	! %f18 = ffffffaf d4710cff
!	%l5 = 00000000ffb3b676, immed = fffff274, %y  = 000002ba
	udiv	%l5,-0xd8c,%l2		! %l2 = 00000000000002ba
	mov	%l0,%y			! %y = 00000000
!	Mem[0000000030001408] = 5dff0000, %l3 = 00000000ffffffff
	ldswa	[%i0+%o4]0x89,%l3	! %l3 = 000000005dff0000
!	Mem[0000000030081408] = 0000000062000000, %l7 = 0000000000662049
	ldxa	[%i2+%o4]0x81,%l7	! %l7 = 0000000062000000
!	Mem[0000000010081410] = ffffff2f, %l7 = 0000000062000000
	lduwa	[%i2+%o5]0x88,%l7	! %l7 = 00000000ffffff2f
!	Mem[00000000300c1400] = 000000ff000000a5, %f30 = ffffff7f 7fffffff
	ldda	[%i3+%g0]0x81,%f30	! %f30 = 000000ff 000000a5
!	Code Fragment 3
p0_fragment_12:
!	%l0 = 2fffffff00000000
	setx	0x09c447978c4c8db9,%g7,%l0 ! %l0 = 09c447978c4c8db9
!	%l1 = ffffffffffffffff
	setx	0xe556d3d8369d002d,%g7,%l1 ! %l1 = e556d3d8369d002d
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 09c447978c4c8db9
	setx	0xe9a3a997eaaf0e5b,%g7,%l0 ! %l0 = e9a3a997eaaf0e5b
!	%l1 = e556d3d8369d002d
	setx	0x19a43d07c50f2f94,%g7,%l1 ! %l1 = 19a43d07c50f2f94
!	Mem[0000000021800040] = ff0e4385, %l2 = 00000000000002ba
	lduh	[%o3+0x040],%l2		! %l2 = 000000000000ff0e
!	Mem[0000000030101408] = 4988ffff0c281024, %l1 = 19a43d07c50f2f94
	ldxa	[%i4+%o4]0x81,%l1	! %l1 = 4988ffff0c281024
!	Starting 10 instruction Store Burst
!	%l6 = ff0040ff, %l7 = ffffff2f, Mem[0000000010101410] = 00000000 7fffffff
	stda	%l6,[%i4+%o5]0x88	! Mem[0000000010101410] = ff0040ff ffffff2f

p0_label_168:
!	%f1  = c8941a45, Mem[0000000030141400] = 7271fdff
	sta	%f1 ,[%i5+%g0]0x89	! Mem[0000000030141400] = c8941a45
!	Mem[0000000010101400] = 00662049, %l3 = 000000005dff0000
	ldstuba	[%i4+%g0]0x80,%l3	! %l3 = 00000000000000ff
!	%l2 = 000000000000ff0e, Mem[0000000010141408] = 80fd7172, %asi = 80
	stwa	%l2,[%i5+0x008]%asi	! Mem[0000000010141408] = 0000ff0e
!	%f31 = 000000a5, %f24 = 2fffffff, %f27 = 00000000
	fdivs	%f31,%f24,%f27		! %l0 = e9a3a997eaaf0e7d, Unfinished, %fsr = 1500000000
!	Mem[0000000030081410] = 00000062, %l2 = 000000000000ff0e
	ldstuba	[%i2+%o5]0x81,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010101408] = 00000000, %l4 = 0000000000000080
	swapa	[%i4+%o4]0x88,%l4	! %l4 = 0000000000000000
!	%l2 = 0000000000000000, Mem[0000000030181400] = 000000ff
	stwa	%l2,[%i6+%g0]0x89	! Mem[0000000030181400] = 00000000
!	Mem[00000000211c0000] = 00ff980d, %l2 = 0000000000000000
	ldstuba	[%o2+0x000]%asi,%l2	! %l2 = 00000000000000ff
!	%l2 = 00000000, %l3 = 00000000, Mem[0000000010081400] = 1112413c 3c411211
	stda	%l2,[%i2+%g0]0x88	! Mem[0000000010081400] = 00000000 00000000
!	Starting 10 instruction Load Burst
!	Mem[000000001000141c] = c971ce8e, %f21 = 76b6b320
	ld	[%i0+0x01c],%f21	! %f21 = c971ce8e

p0_label_169:
!	Mem[0000000010081408] = cf0300004920665d, %f6  = b082273f 81646ed8
	ldda	[%i2+%o4]0x80,%f6 	! %f6  = cf030000 4920665d
!	Mem[0000000030181408] = 4f970000, %l3 = 0000000000000000
	lduba	[%i6+%o4]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000010041410] = ffb3b676, %l0 = e9a3a997eaaf0e7d
	ldsba	[%i1+%o5]0x80,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000030041400] = fea97ab2, %l3 = 0000000000000000
	ldsha	[%i1+%g0]0x81,%l3	! %l3 = fffffffffffffea9
!	Mem[0000000030181410] = 00000000 ff000000, %l4 = 00000000, %l5 = ffb3b676
	ldda	[%i6+%o5]0x89,%l4	! %l4 = 00000000ff000000 0000000000000000
!	Mem[0000000010141408] = 0000ff0e, %l7 = 00000000ffffff2f
	lduba	[%i5+%o4]0x80,%l7	! %l7 = 0000000000000000
!	Mem[00000000100c1410] = 4f979be27fffffff, %f10 = 82f0fa56 4746726e
	ldda	[%i3+%o5]0x80,%f10	! %f10 = 4f979be2 7fffffff
!	Mem[0000000010081408] = cf030000, %l5 = 0000000000000000
	lduba	[%i2+%o4]0x80,%l5	! %l5 = 00000000000000cf
!	Mem[0000000030001408] = 0000ff5d 4920665d, %l6 = ff0040ff, %l7 = 00000000
	ldda	[%i0+%o4]0x81,%l6	! %l6 = 000000000000ff5d 000000004920665d
!	Starting 10 instruction Store Burst
!	%f20 = e9ac274a c971ce8e, %l4 = 00000000ff000000
!	Mem[0000000030141428] = 7a7acd55fa443e8a
	add	%i5,0x028,%g1
	stda	%f20,[%g1+%l4]ASI_PST32_S ! Mem[0000000030141428] = 7a7acd55fa443e8a

p0_label_170:
!	%l2 = 0000000000000000, Mem[0000000020800000] = ff0017e8
	sth	%l2,[%o1+%g0]		! Mem[0000000020800000] = 000017e8
!	%l4 = 00000000ff000000, Mem[0000000030081408] = 0000006200000000
	stxa	%l4,[%i2+%o4]0x89	! Mem[0000000030081408] = 00000000ff000000
!	Mem[0000000010181410] = 49200022, %l7 = 000000004920665d
	ldstuba	[%i6+%o5]0x88,%l7	! %l7 = 00000022000000ff
!	Mem[0000000030141408] = 0000974f, %l6 = 000000000000ff5d
	ldstuba	[%i5+%o4]0x89,%l6	! %l6 = 0000004f000000ff
!	Mem[0000000021800081] = 6933c3e5, %l4 = 00000000ff000000
	ldstub	[%o3+0x081],%l4		! %l4 = 00000033000000ff
!	Mem[0000000010041408] = 88490000, %l2 = 0000000000000000
	swapa	[%i1+%o4]0x80,%l2	! %l2 = 0000000088490000
!	%l5 = 00000000000000cf, Mem[0000000010001400] = ffffffff
	stba	%l5,[%i0+%g0]0x88	! Mem[0000000010001400] = ffffffcf
!	Mem[0000000030081408] = 000000ff, %l6 = 000000000000004f
	ldstuba	[%i2+%o4]0x81,%l6	! %l6 = 00000000000000ff
!	%l2 = 0000000088490000, Mem[0000000030141410] = 00000000
	stha	%l2,[%i5+%o5]0x81	! Mem[0000000030141410] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = 00000000 000000af, %l6 = 00000000, %l7 = 00000022
	ldda	[%i5+%o5]0x81,%l6	! %l6 = 0000000000000000 00000000000000af

p0_label_171:
!	Mem[0000000010141400] = bb1a00ff801c1704, %l4 = 0000000000000033
	ldxa	[%i5+%g0]0x80,%l4	! %l4 = bb1a00ff801c1704
!	Mem[00000000100c1410] = e29b974f, %l7 = 00000000000000af
	ldsha	[%i3+%o5]0x88,%l7	! %l7 = ffffffffffff974f
!	Mem[0000000010041410] = ffb3b676, %l2 = 0000000088490000
	lduha	[%i1+%o5]0x80,%l2	! %l2 = 000000000000ffb3
!	Mem[0000000010081400] = 00000000, %l1 = 4988ffff0c281024
	lduha	[%i2+%g0]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000030001410] = ff4000ff, %l2 = 000000000000ffb3
	ldsba	[%i0+%o5]0x89,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000030081408] = ff0000ff, %l6 = 0000000000000000
	lduba	[%i2+%o4]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030081408] = 00000000 ff0000ff, %l4 = 801c1704, %l5 = 000000cf
	ldda	[%i2+%o4]0x89,%l4	! %l4 = 00000000ff0000ff 0000000000000000
!	Mem[0000000030101400] = 00000000, %f8  = 07fefd24
	lda	[%i4+%g0]0x89,%f8 	! %f8 = 00000000
!	%l7 = ffffffffffff974f, %l1 = 0000000000000000, %l0 = ffffffffffffffff
	xnor	%l7,%l1,%l0		! %l0 = 00000000000068b0
!	Starting 10 instruction Store Burst
!	%l6 = 00000000000000ff, Mem[0000000030101410] = ff00000056000000
	stxa	%l6,[%i4+%o5]0x89	! Mem[0000000030101410] = 00000000000000ff

p0_label_172:
!	%f4  = ff000000 ffffaf83, Mem[0000000010001410] = 76b6b320 83ffffff
	stda	%f4 ,[%i0+%o5]0x80	! Mem[0000000010001410] = ff000000 ffffaf83
!	%f22 = ffffff7f, Mem[0000000010101410] = ff4000ff
	sta	%f22,[%i4+%o5]0x80	! Mem[0000000010101410] = ffffff7f
!	Mem[0000000030081408] = ff0000ff, %l4 = 00000000ff0000ff
	swapa	[%i2+%o4]0x81,%l4	! %l4 = 00000000ff0000ff
!	Mem[0000000010081408] = 000003cf, %l1 = 0000000000000000
	ldstuba	[%i2+%o4]0x88,%l1	! %l1 = 000000cf000000ff
!	Mem[0000000010081410] = 2fffffff, %l1 = 00000000000000cf
	ldstuba	[%i2+%o5]0x80,%l1	! %l1 = 0000002f000000ff
!	Mem[0000000030101400] = 00000000, %l4 = 00000000ff0000ff
	swapa	[%i4+%g0]0x81,%l4	! %l4 = 0000000000000000
!	%l6 = 00000000000000ff, Mem[0000000010141408] = 0eff0000
	stba	%l6,[%i5+%o4]0x88	! Mem[0000000010141408] = 0eff00ff
!	%f0  = c5c53c21 c8941a45 00000056 00000000
!	%f4  = ff000000 ffffaf83 cf030000 4920665d
!	%f8  = 00000000 30fbc62b 4f979be2 7fffffff
!	%f12 = 96c4166b 25f00000 ec0404c9 f9c9cf7f
	stda	%f0,[%i3]ASI_BLK_P	! Block Store to 00000000100c1400
!	Mem[0000000010141408] = 0eff00ff, %l2 = ffffffffffffffff
	swapa	[%i5+%o4]0x88,%l2	! %l2 = 000000000eff00ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = 00000000000097ff, %l6 = 00000000000000ff
	ldxa	[%i5+%o4]0x89,%l6	! %l6 = 00000000000097ff

p0_label_173:
!	Mem[0000000030081410] = 620000ff, %l6 = 00000000000097ff
	ldswa	[%i2+%o5]0x89,%l6	! %l6 = 00000000620000ff
!	Mem[0000000030001400] = ff206600 00000000, %l4 = 00000000, %l5 = 00000000
	ldda	[%i0+%g0]0x81,%l4	! %l4 = 00000000ff206600 0000000000000000
!	Mem[0000000010181408] = ff000000, %l2 = 000000000eff00ff
	ldsha	[%i6+%o4]0x80,%l2	! %l2 = ffffffffffffff00
!	Mem[0000000030101408] = 4988ffff 0c281024, %l4 = ff206600, %l5 = 00000000
	ldda	[%i4+%o4]0x81,%l4	! %l4 = 000000004988ffff 000000000c281024
	membar	#Sync			! Added by membar checker (27)
!	Mem[00000000100c1424] = 30fbc62b, %l5 = 000000000c281024
	lduwa	[%i3+0x024]%asi,%l5	! %l5 = 0000000030fbc62b
!	%l4 = 000000004988ffff, immd = fffffffffffffda5, %l5 = 0000000030fbc62b
	sdivx	%l4,-0x25b,%l5		! %l5 = ffffffffffe0c7f6
!	Mem[0000000030081408] = ff0000ff, %l4 = 000000004988ffff
	lduba	[%i2+%o4]0x81,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030141400] = 451a94c8, %l6 = 00000000620000ff
	lduha	[%i5+%g0]0x81,%l6	! %l6 = 000000000000451a
!	Mem[0000000030041410] = 000000ff, %l3 = fffffffffffffea9
	lduba	[%i1+%o5]0x89,%l3	! %l3 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000021800140] = ffff94e3, %l1 = 000000000000002f
	ldstub	[%o3+0x140],%l1		! %l1 = 000000ff000000ff

p0_label_174:
!	%l7 = ffffffffffff974f, Mem[00000000100c1400] = c5c53c21
	stwa	%l7,[%i3+%g0]0x80	! Mem[00000000100c1400] = ffff974f
!	%f10 = 4f979be2 7fffffff, %l7 = ffffffffffff974f
!	Mem[0000000010101420] = 0418b91c19e5b62e
	add	%i4,0x020,%g1
	stda	%f10,[%g1+%l7]ASI_PST8_PL ! Mem[0000000010101420] = ffffff7f19e5972e
!	%l1 = 00000000000000ff, Mem[0000000010041410] = ffb3b676000000e4
	stxa	%l1,[%i1+%o5]0x80	! Mem[0000000010041410] = 00000000000000ff
!	%l7 = ffffffffffff974f, Mem[000000001004141d] = 03cf37e1, %asi = 80
	stba	%l7,[%i1+0x01d]%asi	! Mem[000000001004141c] = 034f37e1
!	%l5 = ffffffffffe0c7f6, Mem[0000000010101438] = 00000000, %asi = 80
	stwa	%l5,[%i4+0x038]%asi	! Mem[0000000010101438] = ffe0c7f6
!	%f16 = c5c53c21 c8941a45, Mem[0000000010001418] = ffffe519 c971ce8e
	stda	%f16,[%i0+0x018]%asi	! Mem[0000000010001418] = c5c53c21 c8941a45
!	%l4 = 000000ff, %l5 = ffe0c7f6, Mem[0000000010041438] = 00000000 19e5b62e
	std	%l4,[%i1+0x038]		! Mem[0000000010041438] = 000000ff ffe0c7f6
!	Mem[0000000010001411] = ff000000, %l3 = 00000000000000ff
	ldstub	[%i0+0x011],%l3		! %l3 = 00000000000000ff
!	%l5 = ffffffffffe0c7f6, Mem[0000000010141418] = 8ece71c9000000ff, %asi = 80
	stxa	%l5,[%i5+0x018]%asi	! Mem[0000000010141418] = ffffffffffe0c7f6
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = ffffffff, %l2 = ffffffffffffff00
	lduba	[%i5+%o4]0x88,%l2	! %l2 = 00000000000000ff

p0_label_175:
!	Mem[0000000010001410] = 83afffff 0000ffff, %l4 = 000000ff, %l5 = ffe0c7f6
	ldda	[%i0+%o5]0x88,%l4	! %l4 = 000000000000ffff 0000000083afffff
!	Mem[0000000030181410] = ff000000, %l5 = 0000000083afffff
	ldswa	[%i6+%o5]0x89,%l5	! %l5 = ffffffffff000000
!	Mem[0000000010041410] = 00000000000000ff, %f20 = e9ac274a c971ce8e
	ldda	[%i1+%o5]0x80,%f20	! %f20 = 00000000 000000ff
!	Mem[0000000020800040] = 00ff226c, %l2 = 00000000000000ff
	ldsb	[%o1+0x040],%l2		! %l2 = 0000000000000000
!	Mem[0000000010141418] = ffffffffffe0c7f6, %l4 = 000000000000ffff, %l4 = 000000000000ffff
	add	%i5,0x18,%g1
	casxa	[%g1]0x80,%l4,%l4	! %l4 = ffffffffffe0c7f6
!	Mem[0000000010101408] = 80000000, %l3 = 0000000000000000
	ldswa	[%i4+%o4]0x80,%l3	! %l3 = ffffffff80000000
!	Mem[0000000010081410] = ffffffff, %l0 = 00000000000068b0
	ldsba	[%i2+%o5]0x88,%l0	! %l0 = ffffffffffffffff
!	Mem[00000000100c1400] = ffff974f, %l6 = 000000000000451a
	ldswa	[%i3+%g0]0x80,%l6	! %l6 = ffffffffffff974f
!	%f26 = 7fffffff, %f2  = 00000056
	fcmpes	%fcc2,%f26,%f2 		! %fcc2 = 3
!	Starting 10 instruction Store Burst
!	%f6  = cf030000, Mem[0000000010101410] = ffffff7f
	sta	%f6 ,[%i4+%o5]0x80	! Mem[0000000010101410] = cf030000

p0_label_176:
!	Code Fragment 4
p0_fragment_13:
!	%l0 = ffffffffffffffff
	setx	0x763ec9ffc9010c9a,%g7,%l0 ! %l0 = 763ec9ffc9010c9a
!	%l1 = 00000000000000ff
	setx	0x5822acb7e133cbb6,%g7,%l1 ! %l1 = 5822acb7e133cbb6
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 763ec9ffc9010c9a
	setx	0xab5d9a57b6ced162,%g7,%l0 ! %l0 = ab5d9a57b6ced162
!	%l1 = 5822acb7e133cbb6
	setx	0x8270934814d7542e,%g7,%l1 ! %l1 = 8270934814d7542e
!	%l6 = ffffffffffff974f, Mem[00000000300c1408] = ff0c71d4
	stwa	%l6,[%i3+%o4]0x81	! Mem[00000000300c1408] = ffff974f
!	%f28 = 04171c80 ff001abb, %l2 = 0000000000000000
!	Mem[0000000010141400] = bb1a00ff801c1704
	stda	%f28,[%i5+%l2]ASI_PST8_P ! Mem[0000000010141400] = bb1a00ff801c1704
!	%l7 = ffffffffffff974f, Mem[0000000030001400] = ff206600
	stha	%l7,[%i0+%g0]0x81	! Mem[0000000030001400] = 974f6600
!	Mem[00000000300c1400] = 000000ff, %l5 = ffffffffff000000
	ldstuba	[%i3+%g0]0x81,%l5	! %l5 = 00000000000000ff
!	%l6 = ffff974f, %l7 = ffff974f, Mem[0000000010101408] = 80000000 e4000000
	std	%l6,[%i4+%o4]		! Mem[0000000010101408] = ffff974f ffff974f
!	Mem[0000000010141429] = 00000080, %l4 = ffffffffffe0c7f6
	ldstuba	[%i5+0x029]%asi,%l4	! %l4 = 00000000000000ff
!	%l7 = ffffffffffff974f, Mem[00000000300c1410] = 7271fd80ff400007
	stxa	%l7,[%i3+%o5]0x89	! Mem[00000000300c1410] = ffffffffffff974f
!	%l6 = ffff974f, %l7 = ffff974f, Mem[0000000010081410] = ffffffff 00000000
	stda	%l6,[%i2+%o5]0x88	! Mem[0000000010081410] = ffff974f ffff974f
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = ff030000, %l1 = 8270934814d7542e
	lduwa	[%i2+%o4]0x80,%l1	! %l1 = 00000000ff030000

p0_label_177:
!	Mem[0000000030041400] = b27aa9fe, %l6 = ffffffffffff974f
	ldsba	[%i1+%g0]0x89,%l6	! %l6 = fffffffffffffffe
!	Mem[0000000030001400] = 00664f97, %l0 = ab5d9a57b6ced162
	ldsha	[%i0+%g0]0x89,%l0	! %l0 = 0000000000004f97
!	Mem[000000001000142c] = 000000e0, %l1 = 00000000ff030000
	ldsw	[%i0+0x02c],%l1		! %l1 = 00000000000000e0
!	Mem[0000000010101408] = ffff974fffff974f, %l2 = 0000000000000000
	ldxa	[%i4+%o4]0x80,%l2	! %l2 = ffff974fffff974f
!	Mem[0000000010141430] = 3ee5dbff, %l3 = ffffffff80000000
	ldub	[%i5+0x030],%l3		! %l3 = 000000000000003e
!	Mem[0000000030041400] = b27aa9fe, %l7 = ffffffffffff974f
	ldswa	[%i1+%g0]0x89,%l7	! %l7 = ffffffffb27aa9fe
!	Mem[0000000030101408] = ffff8849, %l0 = 0000000000004f97
	lduba	[%i4+%o4]0x89,%l0	! %l0 = 0000000000000049
!	Mem[0000000030041410] = ff000000, %l5 = 0000000000000000
	ldsha	[%i1+%o5]0x81,%l5	! %l5 = ffffffffffffff00
!	Mem[0000000010181410] = ff002049, %l5 = ffffffffffffff00
	ldswa	[%i6+%o5]0x80,%l5	! %l5 = ffffffffff002049
!	Starting 10 instruction Store Burst
!	%f20 = 00000000 000000ff, %l4 = 0000000000000000
!	Mem[00000000300c1428] = 552004da9c159b6e
	add	%i3,0x028,%g1
	stda	%f20,[%g1+%l4]ASI_PST8_SL ! Mem[00000000300c1428] = 552004da9c159b6e

p0_label_178:
!	Mem[00000000100c1408] = 00000056, %l6 = fffffffffffffffe
	swapa	[%i3+%o4]0x80,%l6	! %l6 = 0000000000000056
!	%l7 = ffffffffb27aa9fe, Mem[0000000030181400] = 00000000
	stwa	%l7,[%i6+%g0]0x89	! Mem[0000000030181400] = b27aa9fe
!	%f1  = c8941a45, Mem[0000000030181400] = fea97ab2
	sta	%f1 ,[%i6+%g0]0x81	! Mem[0000000030181400] = c8941a45
!	%l0 = 0000000000000049, Mem[0000000020800040] = 00ff226c, %asi = 80
	stha	%l0,[%o1+0x040]%asi	! Mem[0000000020800040] = 0049226c
!	Mem[000000001008140d] = 4920665d, %l5 = ffffffffff002049
	ldstub	[%i2+0x00d],%l5		! %l5 = 00000020000000ff
!	Mem[00000000100c1418] = cf0300004920665d, %l5 = 0000000000000020, %l1 = 00000000000000e0
	add	%i3,0x18,%g1
	casxa	[%g1]0x80,%l5,%l1	! %l1 = cf0300004920665d
!	Mem[0000000010041400] = d4710c8c, %l6 = 0000000000000056
	swapa	[%i1+%g0]0x80,%l6	! %l6 = 00000000d4710c8c
!	Mem[0000000010181438] = ff3d00b3, %l4 = 00000000, %l2 = ffff974f
	add	%i6,0x38,%g1
	casa	[%g1]0x80,%l4,%l2	! %l2 = 00000000ff3d00b3
!	Mem[0000000010081400] = 00000000, %l4 = 0000000000000000
	ldstuba	[%i2+%g0]0x80,%l4	! %l4 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = bb1a00ff, %f4  = ff000000
	lda	[%i5+%g0]0x80,%f4 	! %f4 = bb1a00ff

p0_label_179:
!	Mem[0000000030001408] = 5dff0000, %l4 = 0000000000000000
	ldsba	[%i0+%o4]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000010101420] = ffffff7f, %f21 = 000000ff
	ld	[%i4+0x020],%f21	! %f21 = ffffff7f
!	Mem[0000000010101400] = e9ac274a492066ff, %l1 = cf0300004920665d
	ldxa	[%i4+%g0]0x88,%l1	! %l1 = e9ac274a492066ff
!	Mem[0000000010141408] = ffffffffffffffff, %f14 = ec0404c9 f9c9cf7f
	ldda	[%i5+0x008]%asi,%f14	! %f14 = ffffffff ffffffff
!	Mem[0000000010081410] = ffff974f, %l0 = 0000000000000049
	lduwa	[%i2+%o5]0x88,%l0	! %l0 = 00000000ffff974f
!	Mem[0000000030081410] = 620000ff, %l6 = 00000000d4710c8c
	lduba	[%i2+%o5]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010141428] = 00ff0080, %l7 = ffffffffb27aa9fe
	lduwa	[%i5+0x028]%asi,%l7	! %l7 = 0000000000ff0080
!	Mem[0000000030181410] = ff000000, %f16 = c5c53c21
	lda	[%i6+%o5]0x89,%f16	! %f16 = ff000000
!	%f8  = 00000000, %f9  = 30fbc62b
	fcmpes	%fcc3,%f8 ,%f9 		! %fcc3 = 1
!	Starting 10 instruction Store Burst
!	Mem[0000000030041408] = 00000056, %l4 = 0000000000000000
	ldstuba	[%i1+%o4]0x81,%l4	! %l4 = 00000000000000ff

p0_label_180:
!	%l0 = ffff974f, %l1 = 492066ff, Mem[0000000010141410] = ff006800 b59aa500
	stda	%l0,[%i5+%o5]0x80	! Mem[0000000010141410] = ffff974f 492066ff
!	%f8  = 00000000 30fbc62b, Mem[0000000010141410] = ffff974f 492066ff
	stda	%f8 ,[%i5+%o5]0x80	! Mem[0000000010141410] = 00000000 30fbc62b
!	%l3 = 000000000000003e, Mem[0000000010101410] = cf0300002fffffff
	stxa	%l3,[%i4+%o5]0x80	! Mem[0000000010101410] = 000000000000003e
!	%l0 = 00000000ffff974f, Mem[0000000030101410] = 000000ff
	stba	%l0,[%i4+%o5]0x89	! Mem[0000000030101410] = 0000004f
!	%l3 = 000000000000003e, %l4 = 0000000000000000, %y  = 00000000
	sdiv	%l3,%l4,%l0		! Div by zero, %l0 = 00000000ffff979f
	mov	%l0,%y			! %y = ffff9777
!	%l3 = 000000000000003e, Mem[000000001014142e] = 4920665d, %asi = 80
	stba	%l3,[%i5+0x02e]%asi	! Mem[000000001014142c] = 49203e5d
!	%l5 = 0000000000000020, Mem[0000000020800000] = 000017e8
	stb	%l5,[%o1+%g0]		! Mem[0000000020800000] = 200017e8
!	%l1 = e9ac274a492066ff, Mem[0000000030041400] = b27aa9fe
	stwa	%l1,[%i1+%g0]0x89	! Mem[0000000030041400] = 492066ff
!	%l7 = 0000000000ff0080, Mem[00000000100c1408] = fffffffe00000000
	stxa	%l7,[%i3+%o4]0x80	! Mem[00000000100c1408] = 0000000000ff0080
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = ff000000, %l7 = 0000000000ff0080
	swapa	[%i2+%g0]0x80,%l7	! %l7 = 00000000ff000000

p0_label_181:
!	Mem[0000000030181410] = 000000ff, %f24 = 2fffffff
	lda	[%i6+%o5]0x81,%f24	! %f24 = 000000ff
!	Mem[0000000010141414] = 30fbc62b, %l5 = 0000000000000020
	lduha	[%i5+0x016]%asi,%l5	! %l5 = 000000000000c62b
!	Mem[0000000010141410] = 00000000, %l0 = 00000000ffff9777
	ldsha	[%i5+%o5]0x88,%l0	! %l0 = 0000000000000000
!	Mem[00000000300c1400] = ff0000ff000000a5, %l0 = 0000000000000000
	ldxa	[%i3+%g0]0x81,%l0	! %l0 = ff0000ff000000a5
!	Mem[0000000010141408] = ffffffff, %l3 = 000000000000003e
	ldsha	[%i5+%o4]0x80,%l3	! %l3 = ffffffffffffffff
!	Mem[00000000201c0000] = 00ff19af, %l1 = e9ac274a492066ff
	ldsba	[%o0+0x000]%asi,%l1	! %l1 = 0000000000000000
!	Mem[00000000100c1408] = 8000ff0000000000, %f28 = 04171c80 ff001abb
	ldda	[%i3+%o4]0x88,%f28	! %f28 = 8000ff00 00000000
!	Mem[00000000300c1410] = 4f97ffff, %l5 = 000000000000c62b
	lduha	[%i3+%o5]0x81,%l5	! %l5 = 0000000000004f97
!	Mem[0000000010041420] = e0002802, %l7 = 00000000ff000000
	ldsh	[%i1+0x022],%l7		! %l7 = 0000000000002802
!	Starting 10 instruction Store Burst
!	Mem[0000000010081428] = 00000000, %l3 = ffffffff, %l6 = 000000ff
	add	%i2,0x28,%g1
	casa	[%g1]0x80,%l3,%l6	! %l6 = 0000000000000000

p0_label_182:
!	%f31 = 000000a5, Mem[00000000300c1408] = 4f97ffff
	sta	%f31,[%i3+%o4]0x89	! Mem[00000000300c1408] = 000000a5
!	Mem[0000000020800001] = 200017e8, %l6 = 0000000000000000
	ldstuba	[%o1+0x001]%asi,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030101408] = 4988ffff, %l4 = 0000000000000000
	swapa	[%i4+%o4]0x81,%l4	! %l4 = 000000004988ffff
!	%f5  = ffffaf83, Mem[0000000030081408] = ff0000ff
	sta	%f5 ,[%i2+%o4]0x81	! Mem[0000000030081408] = ffffaf83
!	%l3 = ffffffffffffffff, Mem[00000000100c1410] = 000000ff
	stba	%l3,[%i3+%o5]0x88	! Mem[00000000100c1410] = 000000ff
!	%l2 = 00000000ff3d00b3, Mem[0000000030181400] = c8941a45
	stba	%l2,[%i6+%g0]0x81	! Mem[0000000030181400] = b3941a45
!	%l7 = 0000000000002802, Mem[0000000010041410] = 00000000
	stwa	%l7,[%i1+%o5]0x80	! Mem[0000000010041410] = 00002802
!	%l6 = 00000000, %l7 = 00002802, Mem[00000000100c1408] = 00000000 8000ff00
	stda	%l6,[%i3+%o4]0x88	! Mem[00000000100c1408] = 00000000 00002802
!	Mem[0000000030181400] = 451a94b3, %l4 = 000000004988ffff
	swapa	[%i6+%g0]0x89,%l4	! %l4 = 00000000451a94b3
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = 00000000 8000ff00, %l2 = ff3d00b3, %l3 = ffffffff
	ldda	[%i2+%g0]0x88,%l2	! %l2 = 000000008000ff00 0000000000000000

p0_label_183:
!	Mem[0000000010081410] = ffff974f, %l1 = 0000000000000000
	lduha	[%i2+%o5]0x88,%l1	! %l1 = 000000000000974f
!	Mem[0000000010101410] = 00000000, %l7 = 0000000000002802
	ldsha	[%i4+%o5]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000030081400] = 20b3b676, %l4 = 00000000451a94b3
	lduba	[%i2+%g0]0x81,%l4	! %l4 = 0000000000000020
!	Mem[0000000030041408] = ff000056, %l4 = 0000000000000020
	ldsha	[%i1+%o4]0x81,%l4	! %l4 = ffffffffffffff00
!	Mem[00000000201c0000] = 00ff19af, %l5 = 0000000000004f97
	ldub	[%o0+%g0],%l5		! %l5 = 0000000000000000
!	Mem[0000000030101410] = 0000004f, %l0 = ff0000ff000000a5
	lduba	[%i4+%o5]0x89,%l0	! %l0 = 000000000000004f
!	Code Fragment 3
p0_fragment_14:
!	%l0 = 000000000000004f
	setx	0x3de9c087b7715954,%g7,%l0 ! %l0 = 3de9c087b7715954
!	%l1 = 000000000000974f
	setx	0x1718aeffbcb128a8,%g7,%l1 ! %l1 = 1718aeffbcb128a8
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 3de9c087b7715954
	setx	0xdc1508a03559fe25,%g7,%l0 ! %l0 = dc1508a03559fe25
!	%l1 = 1718aeffbcb128a8
	setx	0x8c0350f030e61f3b,%g7,%l1 ! %l1 = 8c0350f030e61f3b
!	Mem[0000000010001438] = 3500885f00000000, %l7 = 0000000000000000
	ldx	[%i0+0x038],%l7		! %l7 = 3500885f00000000
!	Mem[0000000010141410] = 00000000, %l6 = 0000000000000000
	ldsha	[%i5+%o5]0x80,%l6	! %l6 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030001410] = ff4000ff, %l3 = 0000000000000000
	ldstuba	[%i0+%o5]0x89,%l3	! %l3 = 000000ff000000ff

p0_label_184:
!	Mem[0000000010081410] = ffff974f, %l0 = dc1508a03559fe25
	ldstuba	[%i2+%o5]0x88,%l0	! %l0 = 0000004f000000ff
!	%f8  = 00000000, Mem[00000000300c1400] = ff0000ff
	sta	%f8 ,[%i3+%g0]0x81	! Mem[00000000300c1400] = 00000000
!	%l4 = ffffffffffffff00, Mem[0000000010141416] = 30fbc62b
	stb	%l4,[%i5+0x016]		! Mem[0000000010141414] = 30fb002b
!	%f14 = ffffffff ffffffff, %l3 = 00000000000000ff
!	Mem[00000000100c1430] = 96c4166b25f00000
	add	%i3,0x030,%g1
	stda	%f14,[%g1+%l3]ASI_PST8_PL ! Mem[00000000100c1430] = ffffffffffffffff
!	%l4 = ffffffffffffff00, Mem[0000000010081400] = 8000ff00
	stwa	%l4,[%i2+%g0]0x88	! Mem[0000000010081400] = ffffff00
!	%l5 = 0000000000000000, Mem[00000000100c1429] = 4f979be2
	stb	%l5,[%i3+0x029]		! Mem[00000000100c1428] = 4f009be2
!	Mem[0000000010081414] = 4f97ffff, %l4 = ffffff00, %l3 = 000000ff
	add	%i2,0x14,%g1
	casa	[%g1]0x80,%l4,%l3	! %l3 = 000000004f97ffff
!	%l2 = 000000008000ff00, Mem[0000000010041408] = 00000000
	stwa	%l2,[%i1+%o4]0x80	! Mem[0000000010041408] = 8000ff00
!	%l7 = 3500885f00000000, Mem[00000000300c1400] = 00000000
	stha	%l7,[%i3+%g0]0x81	! Mem[00000000300c1400] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = 00ff0080, %f30 = 000000ff
	lda	[%i1+%o4]0x88,%f30	! %f30 = 00ff0080

p0_label_185:
!	%f27 = 00000000, %f16 = ff000000 c8941a45
	fitod	%f27,%f16		! %f16 = 00000000 00000000
!	Mem[0000000010101408] = ffff974f, %l2 = 000000008000ff00
	lduwa	[%i4+%o4]0x80,%l2	! %l2 = 00000000ffff974f
!	Mem[0000000010001434] = e4000000, %f5  = ffffaf83
	lda	[%i0+0x034]%asi,%f5 	! %f5 = e4000000
	membar	#Sync			! Added by membar checker (28)
!	Mem[0000000030081400] = 20b3b676 8d1e3315 ffffaf83 00000000
!	Mem[0000000030081410] = ff000062 00000000 ccc989c0 c971ce8e
!	Mem[0000000030081420] = 491588d6 947903e2 ff400007 db995109
!	Mem[0000000030081430] = 3a9fb502 0c281024 b82a2f11 4f979be2
	ldda	[%i2]ASI_BLK_AIUSL,%f16	! Block Load from 0000000030081400
!	Mem[0000000030041410] = 000000ff, %f13 = 25f00000
	lda	[%i1+%o5]0x89,%f13	! %f13 = 000000ff
!	Mem[0000000010001410] = 0000ffff, %l0 = 000000000000004f
	lduba	[%i0+%o5]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010181428] = 0418b91c, %l5 = 0000000000000000
	lduwa	[%i6+0x028]%asi,%l5	! %l5 = 000000000418b91c
!	Mem[0000000010081400] = ffffff00, %l3 = 000000004f97ffff
	lduwa	[%i2+%g0]0x88,%l3	! %l3 = 00000000ffffff00
!	Mem[0000000030181400] = ffff8849000000e4, %l7 = 3500885f00000000
	ldxa	[%i6+%g0]0x81,%l7	! %l7 = ffff8849000000e4
!	Starting 10 instruction Store Burst
!	%l1 = 8c0350f030e61f3b, Mem[0000000030101400] = ff0000ff
	stha	%l1,[%i4+%g0]0x89	! Mem[0000000030101400] = ff001f3b

p0_label_186:
!	%l5 = 000000000418b91c, Mem[0000000021800000] = ffb7dd30
	stb	%l5,[%o3+%g0]		! Mem[0000000021800000] = 1cb7dd30
!	Mem[0000000030041408] = 560000ff, %l0 = 00000000000000ff
	swapa	[%i1+%o4]0x89,%l0	! %l0 = 00000000560000ff
!	%l4 = ffffffffffffff00, %l1 = 8c0350f030e61f3b, %y  = ffff9777
	umul	%l4,%l1,%l3		! %l3 = 30e61f0a19e0c500, %y = 30e61f0a
!	Mem[00000000100c1428] = 4f009be2, %l4 = ffffffffffffff00
	swap	[%i3+0x028],%l4		! %l4 = 000000004f009be2
!	%l1 = 8c0350f030e61f3b, %l7 = ffff8849000000e4, %l4 = 000000004f009be2
	sub	%l1,%l7,%l4		! %l4 = 8c03c8a730e61e57
!	%l4 = 30e61e57, %l5 = 0418b91c, Mem[00000000100c1410] = 000000ff 83afffff
	stda	%l4,[%i3+%o5]0x88	! Mem[00000000100c1410] = 30e61e57 0418b91c
!	Mem[0000000010101410] = 00000000, %l6 = 0000000000000000
	swap	[%i4+%o5],%l6		! %l6 = 0000000000000000
!	%f0  = c5c53c21 c8941a45 00000056 00000000
!	%f4  = bb1a00ff e4000000 cf030000 4920665d
!	%f8  = 00000000 30fbc62b 4f979be2 7fffffff
!	%f12 = 96c4166b 000000ff ffffffff ffffffff
	stda	%f0,[%i0]ASI_BLK_AIUPL	! Block Store to 0000000010001400
!	Mem[000000001018142e] = afffffff, %l7 = ffff8849000000e4
	ldstub	[%i6+0x02e],%l7		! %l7 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = 5dff0000, %l7 = 00000000000000ff
	lduha	[%i0+%o4]0x89,%l7	! %l7 = 0000000000000000

p0_label_187:
!	Mem[0000000010081414] = 4f97ffff, %f20 = 00000000
	ld	[%i2+0x014],%f20	! %f20 = 4f97ffff
!	Mem[0000000030101408] = 00000000, %l4 = 8c03c8a730e61e57
	ldsba	[%i4+%o4]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000030101410] = 4f000000, %f18 = 00000000
	lda	[%i4+%o5]0x81,%f18	! %f18 = 4f000000
!	%f21 = 620000ff, %f23 = c089c9cc
	fcmpes	%fcc0,%f21,%f23		! %fcc0 = 2
!	Mem[0000000021800100] = f9ff9c47, %l0 = 00000000560000ff
	ldsha	[%o3+0x100]%asi,%l0	! %l0 = fffffffffffff9ff
!	Mem[00000000100c1420] = 00000000 30fbc62b, %l2 = ffff974f, %l3 = 19e0c500
	ldda	[%i3+0x020]%asi,%l2	! %l2 = 0000000000000000 0000000030fbc62b
	membar	#Sync			! Added by membar checker (29)
!	Mem[0000000010001404] = 213cc5c5, %l1 = 8c0350f030e61f3b
	lduba	[%i0+0x004]%asi,%l1	! %l1 = 0000000000000021
!	Mem[0000000030101408] = 00000000, %f3  = 00000000
	lda	[%i4+%o4]0x81,%f3 	! %f3 = 00000000
!	Mem[00000000300c1400] = 00000000, %l6 = 0000000000000000
	lduba	[%i3+%g0]0x89,%l6	! %l6 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030001408] = 5dff0000, %l3 = 0000000030fbc62b
	ldstuba	[%i0+%o4]0x89,%l3	! %l3 = 00000000000000ff

p0_label_188:
!	%l3 = 0000000000000000, Mem[0000000010081408] = ff030000
	stba	%l3,[%i2+%o4]0x80	! Mem[0000000010081408] = 00030000
!	%l4 = 00000000, %l5 = 0418b91c, Mem[0000000030181400] = ffff8849 000000e4
	stda	%l4,[%i6+%g0]0x81	! Mem[0000000030181400] = 00000000 0418b91c
!	%l4 = 0000000000000000, Mem[0000000030181400] = 00000000
	stba	%l4,[%i6+%g0]0x89	! Mem[0000000030181400] = 00000000
!	%l4 = 0000000000000000, Mem[0000000030141400] = 451a94c8
	stwa	%l4,[%i5+%g0]0x81	! Mem[0000000030141400] = 00000000
!	%l0 = fffffffffffff9ff, Mem[0000000010041403] = 00000056
	stb	%l0,[%i1+0x003]		! Mem[0000000010041400] = 000000ff
!	%l6 = 0000000000000000, Mem[00000000100c1408] = 00000000
	stba	%l6,[%i3+%o4]0x88	! Mem[00000000100c1408] = 00000000
!	%f31 = 112f2ab8, Mem[0000000030041410] = ff000000
	sta	%f31,[%i1+%o5]0x81	! Mem[0000000030041410] = 112f2ab8
!	Mem[0000000030141410] = 00000000, %l5 = 000000000418b91c
	swapa	[%i5+%o5]0x81,%l5	! %l5 = 0000000000000000
!	%f9  = 30fbc62b, Mem[0000000030181400] = 00000000
	sta	%f9 ,[%i6+%g0]0x81	! Mem[0000000030181400] = 30fbc62b
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = ff001f3b, %l1 = 0000000000000021
	ldstuba	[%i4+%g0]0x89,%l1	! %l1 = 0000003b000000ff

p0_label_189:
!	Mem[0000000010041414] = 000000ff, %l0 = fffffffffffff9ff
	lduha	[%i1+0x014]%asi,%l0	! %l0 = 0000000000000000
!	Mem[0000000010181410] = ff00204900ff0000, %l3 = 0000000000000000
	ldxa	[%i6+%o5]0x80,%l3	! %l3 = ff00204900ff0000
!	Mem[0000000030101410] = 0000004f, %l6 = 0000000000000000
	ldsha	[%i4+%o5]0x89,%l6	! %l6 = 000000000000004f
!	Mem[00000000211c0000] = ffff980d, %l1 = 000000000000003b
	lduba	[%o2+0x000]%asi,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010101438] = ffe0c7f6, %f27 = 070040ff
	lda	[%i4+0x038]%asi,%f27	! %f27 = ffe0c7f6
!	Mem[0000000030041408] = ff000000, %l3 = ff00204900ff0000
	lduha	[%i1+%o4]0x81,%l3	! %l3 = 000000000000ff00
!	%f30 = e29b974f, %f4  = bb1a00ff e4000000
	fitod	%f30,%f4 		! %f4  = c1bd6468 b1000000
!	Mem[0000000010041410] = 00002802, %l4 = 0000000000000000
	lduha	[%i1+%o5]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000030181408] = 000000ff4f970000, %f16 = 15331e8d 76b6b320
	ldda	[%i6+%o4]0x89,%f16	! %f16 = 000000ff 4f970000
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1400] = 00000000, %l6 = 000000000000004f
	ldstuba	[%i3+%g0]0x89,%l6	! %l6 = 00000000000000ff

p0_label_190:
!	Mem[0000000010041430] = 00e00000, %l4 = 0000000000000000
	swap	[%i1+0x030],%l4		! %l4 = 0000000000e00000
!	%l4 = 00e00000, %l5 = 00000000, Mem[0000000010101408] = ffff974f ffff974f
	stda	%l4,[%i4+%o4]0x80	! Mem[0000000010101408] = 00e00000 00000000
!	%f18 = 4f000000 83afffff, Mem[0000000010041408] = 00ff0080 5d662049
	stda	%f18,[%i1+%o4]0x88	! Mem[0000000010041408] = 4f000000 83afffff
!	%l3 = 000000000000ff00, Mem[0000000010001408] = 00000000
	stwa	%l3,[%i0+%o4]0x80	! Mem[0000000010001408] = 0000ff00
!	%l3 = 000000000000ff00, Mem[00000000300c1400] = ff000000
	stba	%l3,[%i3+%g0]0x81	! Mem[00000000300c1400] = 00000000
!	Mem[0000000010101400] = 492066ff, %l3 = 000000000000ff00
	swapa	[%i4+%g0]0x88,%l3	! %l3 = 00000000492066ff
!	%l0 = 0000000000000000, Mem[0000000030141408] = ff970000
	stwa	%l0,[%i5+%o4]0x81	! Mem[0000000030141408] = 00000000
!	Mem[0000000010181400] = 00000000, %l3 = 00000000492066ff
	ldstuba	[%i6+%g0]0x80,%l3	! %l3 = 00000000000000ff
!	%l3 = 0000000000000000, Mem[0000000010181434] = fea97ab2, %asi = 80
	stwa	%l3,[%i6+0x034]%asi	! Mem[0000000010181434] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[00000000218000c0] = 00ff4926, %l5 = 0000000000000000
	ldub	[%o3+0x0c0],%l5		! %l5 = 0000000000000000

p0_label_191:
!	Mem[0000000030101410] = 0000004f, %l6 = 0000000000000000
	lduwa	[%i4+%o5]0x89,%l6	! %l6 = 000000000000004f
!	Mem[0000000030001400] = 00664f97, %l2 = 0000000000000000
	lduha	[%i0+%g0]0x89,%l2	! %l2 = 0000000000004f97
!	Mem[0000000030141410] = 0418b91c000000af, %f24 = e2037994 d6881549
	ldda	[%i5+%o5]0x81,%f24	! %f24 = 0418b91c 000000af
!	Mem[0000000010001420] = 2bc6fb30, %l5 = 0000000000000000
	lduh	[%i0+0x022],%l5		! %l5 = 000000000000fb30
!	%l6 = 000000000000004f, %l0 = 0000000000000000, %l7 = 0000000000000000
	and	%l6,%l0,%l7		! %l7 = 0000000000000000
!	Mem[0000000030081400] = 15331e8d76b6b320, %l5 = 000000000000fb30
	ldxa	[%i2+%g0]0x89,%l5	! %l5 = 15331e8d76b6b320
!	Mem[0000000030181410] = 00000000ff000000, %f30 = e29b974f 112f2ab8
	ldda	[%i6+%o5]0x89,%f30	! %f30 = 00000000 ff000000
	membar	#Sync			! Added by membar checker (30)
!	Mem[0000000010041400] = 000000ff 00000000 ffffaf83 0000004f
!	Mem[0000000010041410] = 00002802 000000ff 66c93792 034f37e1
!	Mem[0000000010041420] = e0002802 8be483af ff37c966 7fffffff
!	Mem[0000000010041430] = 00000000 000000ff 000000ff ffe0c7f6
	ldda	[%i1]ASI_BLK_P,%f16	! Block Load from 0000000010041400
!	Mem[0000000010041408] = 83afffff, %l1 = 00000000000000ff
	lduha	[%i1+%o4]0x88,%l1	! %l1 = 000000000000ffff
!	Starting 10 instruction Store Burst
!	%l6 = 000000000000004f, Mem[0000000030141408] = 00000000
	stwa	%l6,[%i5+%o4]0x89	! Mem[0000000030141408] = 0000004f

p0_label_192:
!	%l7 = 0000000000000000, Mem[0000000030101410] = 4f00000000000000
	stxa	%l7,[%i4+%o5]0x81	! Mem[0000000030101410] = 0000000000000000
!	%f6  = cf030000 4920665d, %l0 = 0000000000000000
!	Mem[0000000010001408] = 0000ff0056000000
	add	%i0,0x008,%g1
	stda	%f6,[%g1+%l0]ASI_PST16_PL ! Mem[0000000010001408] = 0000ff0056000000
!	Mem[0000000030081408] = 83afffff, %l7 = 0000000000000000
	ldstuba	[%i2+%o4]0x89,%l7	! %l7 = 000000ff000000ff
!	%l3 = 0000000000000000, Mem[0000000010081400] = 00ffffff00000000
	stxa	%l3,[%i2+%g0]0x80	! Mem[0000000010081400] = 0000000000000000
!	Mem[00000000100c1408] = 00000000, %l2 = 0000000000004f97
	ldstuba	[%i3+%o4]0x80,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030141408] = 4f000000, %l7 = 00000000000000ff
	swapa	[%i5+%o4]0x81,%l7	! %l7 = 000000004f000000
!	Mem[0000000010181408] = 000000ff, %l7 = 000000004f000000
	swapa	[%i6+%o4]0x88,%l7	! %l7 = 00000000000000ff
!	%l3 = 0000000000000000, Mem[0000000030001408] = ff00ff5d4920665d
	stxa	%l3,[%i0+%o4]0x81	! Mem[0000000030001408] = 0000000000000000
!	%f8  = 00000000 30fbc62b, %l7 = 00000000000000ff
!	Mem[0000000010001430] = ff0000006b16c496
	add	%i0,0x030,%g1
	stda	%f8,[%g1+%l7]ASI_PST8_PL ! Mem[0000000010001430] = 2bc6fb3000000000
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = ffff980d, %l3 = 0000000000000000
	ldsb	[%o2+0x001],%l3		! %l3 = ffffffffffffffff

p0_label_193:
!	Mem[0000000030081408] = 0000000083afffff, %l3 = ffffffffffffffff
	ldxa	[%i2+%o4]0x89,%l3	! %l3 = 0000000083afffff
!	Mem[0000000010001410] = e4000000, %l1 = 000000000000ffff
	lduwa	[%i0+%o5]0x88,%l1	! %l1 = 00000000e4000000
!	Mem[0000000030081408] = 83afffff, %l0 = 0000000000000000
	lduba	[%i2+%o4]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010001408] = 0000ff00, %l5 = 15331e8d76b6b320
	lduha	[%i0+%o4]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000030041410] = 112f2ab8ffffaf83, %l5 = 0000000000000000
	ldxa	[%i1+%o5]0x81,%l5	! %l5 = 112f2ab8ffffaf83
!	Mem[0000000030041400] = ff662049c8941a45, %f2  = 00000056 00000000
	ldda	[%i1+%g0]0x81,%f2 	! %f2  = ff662049 c8941a45
!	Mem[0000000010081410] = ff97ffff, %l2 = 0000000000000000
	ldsw	[%i2+%o5],%l2		! %l2 = ffffffffff97ffff
!	Mem[00000000100c141c] = 4920665d, %l4 = 0000000000e00000
	ldswa	[%i3+0x01c]%asi,%l4	! %l4 = 000000004920665d
!	Mem[0000000030101400] = 83afffffff001fff, %l6 = 000000000000004f
	ldxa	[%i4+%g0]0x89,%l6	! %l6 = 83afffffff001fff
!	Starting 10 instruction Store Burst
!	Mem[0000000010081418] = 000066c9, %l6 = ff001fff, %l6 = ff001fff
	add	%i2,0x18,%g1
	casa	[%g1]0x80,%l6,%l6	! %l6 = 00000000000066c9

p0_label_194:
	membar	#Sync			! Added by membar checker (31)
!	%f9  = 30fbc62b, Mem[0000000010041410] = 00002802
	sta	%f9 ,[%i1+%o5]0x80	! Mem[0000000010041410] = 30fbc62b
!	%l4 = 000000004920665d, Mem[0000000010141424] = ffffffff
	sth	%l4,[%i5+0x024]		! Mem[0000000010141424] = 665dffff
!	%l4 = 4920665d, %l5 = ffffaf83, Mem[0000000030041410] = b82a2f11 83afffff
	stda	%l4,[%i1+%o5]0x89	! Mem[0000000030041410] = 4920665d ffffaf83
!	Mem[0000000010101410] = 00000000, %l7 = 00000000000000ff
	ldstuba	[%i4+%o5]0x80,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030101400] = ff001fff, %l1 = 00000000e4000000
	swapa	[%i4+%g0]0x89,%l1	! %l1 = 00000000ff001fff
!	Mem[0000000010141410] = 0000000030fb002b, %l6 = 00000000000066c9, %l7 = 0000000000000000
	add	%i5,0x10,%g1
	casxa	[%g1]0x80,%l6,%l7	! %l7 = 0000000030fb002b
!	%l6 = 00000000000066c9, Mem[00000000300c1400] = 00000000
	stha	%l6,[%i3+%g0]0x81	! Mem[00000000300c1400] = 66c90000
!	Mem[0000000010181410] = ff002049, %l2 = ffffffffff97ffff
	swapa	[%i6+%o5]0x80,%l2	! %l2 = 00000000ff002049
!	%f6  = cf030000 4920665d, Mem[0000000030041408] = 000000ff 00000000
	stda	%f6 ,[%i1+%o4]0x89	! Mem[0000000030041408] = cf030000 4920665d
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = 000000a5, %l4 = 000000004920665d
	ldswa	[%i3+%o4]0x89,%l4	! %l4 = 00000000000000a5

p0_label_195:
!	Mem[0000000010101408] = 00e00000 00000000, %l6 = 000066c9, %l7 = 30fb002b
	ldda	[%i4+%o4]0x80,%l6	! %l6 = 0000000000e00000 0000000000000000
!	Mem[0000000030181400] = 1cb918042bc6fb30, %f6  = cf030000 4920665d
	ldda	[%i6+%g0]0x89,%f6 	! %f6  = 1cb91804 2bc6fb30
!	%l7 = 0000000000000000, %l1 = 00000000ff001fff, %l3  = 0000000083afffff
	mulx	%l7,%l1,%l3		! %l3 = 0000000000000000
!	Mem[0000000030101400] = 000000e4, %l0 = 00000000000000ff
	ldsha	[%i4+%g0]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000010181408] = 0000004f000014ff, %f16 = 000000ff 00000000
	ldda	[%i6+%o4]0x80,%f16	! %f16 = 0000004f 000014ff
!	Mem[0000000010001400] = c8941a45, %l2 = 00000000ff002049
	lduwa	[%i0+%g0]0x88,%l2	! %l2 = 00000000c8941a45
!	Mem[0000000021800180] = ffffad00, %l1 = 00000000ff001fff
	ldub	[%o3+0x180],%l1		! %l1 = 00000000000000ff
!	Mem[0000000010181400] = ff000000, %l6 = 0000000000e00000
	lduha	[%i6+%g0]0x80,%l6	! %l6 = 000000000000ff00
!	Mem[0000000010081400] = 00000000, %l4 = 00000000000000a5
	lduwa	[%i2+%g0]0x88,%l4	! %l4 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1400] = 0000c966, %l6 = 000000000000ff00
	ldstuba	[%i3+%g0]0x89,%l6	! %l6 = 00000066000000ff

p0_label_196:
!	%f20 = 00002802 000000ff, Mem[0000000030001410] = ff4000ff ff000000
	stda	%f20,[%i0+%o5]0x89	! Mem[0000000030001410] = 00002802 000000ff
!	%l2 = 00000000c8941a45, Mem[0000000030141410] = 1cb91804
	stha	%l2,[%i5+%o5]0x89	! Mem[0000000030141410] = 1cb91a45
!	%l2 = 00000000c8941a45, Mem[0000000030141400] = 00000000
	stwa	%l2,[%i5+%g0]0x89	! Mem[0000000030141400] = c8941a45
!	%f26 = ff37c966 7fffffff, Mem[0000000010141410] = 00000000 2b00fb30
	stda	%f26,[%i5+%o5]0x88	! Mem[0000000010141410] = ff37c966 7fffffff
!	Mem[0000000030041408] = 4920665d, %l5 = 112f2ab8ffffaf83
	swapa	[%i1+%o4]0x89,%l5	! %l5 = 000000004920665d
!	%l2 = 00000000c8941a45, Mem[000000001004143c] = ffe0c7f6, %asi = 80
	stha	%l2,[%i1+0x03c]%asi	! Mem[000000001004143c] = 1a45c7f6
!	Mem[0000000010041408] = 83afffff, %l3 = 0000000000000000
	ldstuba	[%i1+%o4]0x88,%l3	! %l3 = 000000ff000000ff
!	Mem[0000000030041400] = ff662049, %l2 = 00000000c8941a45
	swapa	[%i1+%g0]0x81,%l2	! %l2 = 00000000ff662049
!	Mem[00000000300c1400] = ffc90000, %l7 = 0000000000000000
	swapa	[%i3+%g0]0x81,%l7	! %l7 = 00000000ffc90000
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = 000000ff, %l3 = 00000000000000ff
	ldsba	[%i3+%o4]0x88,%l3	! %l3 = ffffffffffffffff

p0_label_197:
!	Mem[0000000030141410] = 451ab91c, %l5 = 000000004920665d
	lduha	[%i5+%o5]0x81,%l5	! %l5 = 000000000000451a
!	Mem[0000000010181400] = 000000ff, %l3 = ffffffffffffffff
	ldsba	[%i6+%g0]0x88,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010041410] = 2bc6fb30, %l5 = 000000000000451a
	ldsba	[%i1+%o5]0x88,%l5	! %l5 = 0000000000000030
!	Mem[0000000010081400] = 00000000, %l4 = 0000000000000000
	lduha	[%i2+%g0]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000010101400] = 00ff0000, %l0 = 0000000000000000
	lduba	[%i4+0x001]%asi,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010101420] = ffffff7f 19e5972e, %l4 = 00000000, %l5 = 00000030
	ldda	[%i4+0x020]%asi,%l4	! %l4 = 00000000ffffff7f 0000000019e5972e
!	Mem[0000000010141400] = bb1a00ff, %f0  = c5c53c21
	lda	[%i5+%g0]0x80,%f0 	! %f0 = bb1a00ff
!	Code Fragment 4
p0_fragment_15:
!	%l0 = 00000000000000ff
	setx	0x67dc9e805838e4b8,%g7,%l0 ! %l0 = 67dc9e805838e4b8
!	%l1 = 00000000000000ff
	setx	0x9928682fc77e38b5,%g7,%l1 ! %l1 = 9928682fc77e38b5
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 67dc9e805838e4b8
	setx	0x0d82013864f7b6eb,%g7,%l0 ! %l0 = 0d82013864f7b6eb
!	%l1 = 9928682fc77e38b5
	setx	0x3fb00cf84f3968fb,%g7,%l1 ! %l1 = 3fb00cf84f3968fb
!	Mem[0000000010101400] = 0000ff00, %l1 = 3fb00cf84f3968fb
	lduwa	[%i4+%g0]0x88,%l1	! %l1 = 000000000000ff00
!	Starting 10 instruction Store Burst
!	%l0 = 0d82013864f7b6eb, Mem[0000000010181410] = ffff97ff
	stha	%l0,[%i6+%o5]0x88	! Mem[0000000010181410] = ffffb6eb

p0_label_198:
!	%l6 = 0000000000000066, Mem[0000000010081428] = 00000000
	stb	%l6,[%i2+0x028]		! Mem[0000000010081428] = 66000000
!	Mem[00000000300c1400] = 00000000, %l6 = 0000000000000066
	ldsha	[%i3+%g0]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000010081410] = ff97ffff, %l7 = 00000000ffc90000
	swapa	[%i2+%o5]0x80,%l7	! %l7 = 00000000ff97ffff
!	%l1 = 000000000000ff00, Mem[00000000100c1410] = 571ee630
	stwa	%l1,[%i3+%o5]0x80	! Mem[00000000100c1410] = 0000ff00
!	Mem[0000000010141410] = ffffff7f, %l7 = 00000000ff97ffff
	ldstub	[%i5+%o5],%l7		! %l7 = 000000ff000000ff
!	%l3 = ffffffffffffffff, %l1 = 000000000000ff00, %l0 = 0d82013864f7b6eb
	andn	%l3,%l1,%l0		! %l0 = ffffffffffff00ff
!	Mem[0000000030041400] = 451a94c8, %l3 = ffffffffffffffff
	swapa	[%i1+%g0]0x89,%l3	! %l3 = 00000000451a94c8
!	%l1 = 000000000000ff00, Mem[0000000030101408] = 00000000
	stwa	%l1,[%i4+%o4]0x89	! Mem[0000000030101408] = 0000ff00
!	Mem[00000000100c1408] = 000000ff, %l6 = 0000000000000000
	ldstuba	[%i3+%o4]0x88,%l6	! %l6 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	%f3  = c8941a45, %f24 = e0002802
	fcmpes	%fcc1,%f3 ,%f24		! %fcc1 = 2

p0_label_199:
!	Mem[0000000010181408] = 0000004f, %l6 = 00000000000000ff
	ldswa	[%i6+%o4]0x80,%l6	! %l6 = 000000000000004f
!	Mem[0000000030001400] = 00664f97, %l4 = 00000000ffffff7f
	ldsha	[%i0+%g0]0x89,%l4	! %l4 = 0000000000004f97
!	Mem[0000000030001400] = 974f6600, %l5 = 0000000019e5972e
	lduwa	[%i0+%g0]0x81,%l5	! %l5 = 00000000974f6600
!	Mem[0000000030041400] = ffffffff, %l7 = 00000000000000ff
	lduha	[%i1+%g0]0x89,%l7	! %l7 = 000000000000ffff
!	Mem[0000000010181408] = 0000004f, %l7 = 000000000000ffff
	ldswa	[%i6+%o4]0x80,%l7	! %l7 = 000000000000004f
!	Mem[00000000300c1400] = a500000000000000, %l2 = 00000000ff662049
	ldxa	[%i3+%g0]0x89,%l2	! %l2 = a500000000000000
!	Mem[00000000100c1404] = c8941a45, %l2 = a500000000000000
	ldub	[%i3+0x006],%l2		! %l2 = 000000000000001a
!	Mem[0000000010041410] = 30fbc62b000000ff, %l5 = 00000000974f6600
	ldxa	[%i1+%o5]0x80,%l5	! %l5 = 30fbc62b000000ff
!	Mem[00000000300c1408] = 000000a5, %l3 = 00000000451a94c8
	ldsha	[%i3+%o4]0x89,%l3	! %l3 = 00000000000000a5
!	Starting 10 instruction Store Burst
!	%f20 = 00002802 000000ff, Mem[0000000030181410] = ff000000 00000000
	stda	%f20,[%i6+%o5]0x89	! Mem[0000000030181410] = 00002802 000000ff

p0_label_200:
!	%f4  = c1bd6468 b1000000, %l4 = 0000000000004f97
!	Mem[0000000030101410] = 0000000000000000
	add	%i4,0x010,%g1
	stda	%f4,[%g1+%l4]ASI_PST32_SL ! Mem[0000000030101410] = 000000b16864bdc1
!	%l2 = 000000000000001a, Mem[00000000300c1410] = 4f97ffff
	stwa	%l2,[%i3+%o5]0x81	! Mem[00000000300c1410] = 0000001a
!	%l1 = 000000000000ff00, Mem[00000000100c1410] = 0000ff00
	stwa	%l1,[%i3+%o5]0x80	! Mem[00000000100c1410] = 0000ff00
!	Mem[0000000010101400] = 0000ff00, %l5 = 30fbc62b000000ff
	swapa	[%i4+%g0]0x88,%l5	! %l5 = 000000000000ff00
!	%l0 = ffffffffffff00ff, Mem[0000000010041408] = 83afffff
	stwa	%l0,[%i1+%o4]0x88	! Mem[0000000010041408] = ffff00ff
!	%l4 = 0000000000004f97, Mem[00000000201c0000] = 00ff19af, %asi = 80
	stha	%l4,[%o0+0x000]%asi	! Mem[00000000201c0000] = 4f9719af
!	Mem[0000000010141410] = ffffff7f, %l0 = ffffffffffff00ff
	swapa	[%i5+%o5]0x80,%l0	! %l0 = 00000000ffffff7f
!	%l0 = 00000000ffffff7f, Mem[0000000010101400] = 000000ff
	stba	%l0,[%i4+%g0]0x88	! Mem[0000000010101400] = 0000007f
!	%l6 = 000000000000004f, imm = fffffffffffff259, %l2 = 000000000000001a
	add	%l6,-0xda7,%l2		! %l2 = fffffffffffff2a8
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = 4f9719af, %l2 = fffffffffffff2a8
	lduha	[%o0+0x000]%asi,%l2	! %l2 = 0000000000004f97

p0_label_201:
!	Mem[0000000010081400] = 00000000, %l3 = 00000000000000a5
	lduba	[%i2+%g0]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000010181408] = 0000004f 000014ff, %l6 = 0000004f, %l7 = 0000004f
	ldda	[%i6+%o4]0x80,%l6	! %l6 = 000000000000004f 00000000000014ff
!	Mem[0000000010101408] = 00e00000, %l3 = 0000000000000000
	lduba	[%i4+%o4]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000030101408] = 00ff00000c281024, %l3 = 0000000000000000
	ldxa	[%i4+%o4]0x81,%l3	! %l3 = 00ff00000c281024
!	Mem[0000000010101418] = ffffadffffffaf83, %l7 = 00000000000014ff
	ldxa	[%i4+0x018]%asi,%l7	! %l7 = ffffadffffffaf83
!	%f25 = 8be483af, %f17 = 000014ff
	fstoi	%f25,%f17		! %f17 = 00000000
!	Mem[0000000030141410] = 451ab91c, %l2 = 0000000000004f97
	ldswa	[%i5+%o5]0x81,%l2	! %l2 = 00000000451ab91c
!	Mem[0000000010101400] = 0000007f, %l7 = ffffadffffffaf83
	lduba	[%i4+%g0]0x88,%l7	! %l7 = 000000000000007f
!	Mem[0000000030101410] = c1bd6468b1000000, %l1 = 000000000000ff00
	ldxa	[%i4+%o5]0x89,%l1	! %l1 = c1bd6468b1000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010001400] = 451a94c8, %l5 = 000000000000ff00, %asi = 80
	swapa	[%i0+0x000]%asi,%l5	! %l5 = 00000000451a94c8

p0_label_202:
!	Mem[000000001008142b] = 66000000, %l5 = 00000000451a94c8
	ldstuba	[%i2+0x02b]%asi,%l5	! %l5 = 00000000000000ff
!	%f28 = 00000000 000000ff, Mem[0000000010141400] = ff001abb 04171c80
	stda	%f28,[%i5+%g0]0x88	! Mem[0000000010141400] = 00000000 000000ff
!	Mem[0000000030101408] = 00ff0000, %l6 = 000000000000004f
	ldstuba	[%i4+%o4]0x81,%l6	! %l6 = 00000000000000ff
!	%l1 = c1bd6468b1000000, Mem[0000000010081408] = 00030000
	stba	%l1,[%i2+%o4]0x80	! Mem[0000000010081408] = 00030000
!	Mem[0000000010081410] = 0000c9ff, %l1 = c1bd6468b1000000
	swapa	[%i2+%o5]0x88,%l1	! %l1 = 000000000000c9ff
!	%f11 = 7fffffff, %f6  = 1cb91804 2bc6fb30
	fitod	%f11,%f6 		! %f6  = 41dfffff ffc00000
!	%f12 = 96c4166b, %f22 = 66c93792
	fcmpes	%fcc2,%f12,%f22		! %fcc2 = 1
!	%l4 = 0000000000004f97, Mem[0000000030001400] = 974f6600
	stwa	%l4,[%i0+%g0]0x81	! Mem[0000000030001400] = 00004f97
!	Mem[0000000030101410] = 000000b1, %l2 = 00000000451ab91c
	ldstuba	[%i4+%o5]0x81,%l2	! %l2 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = a5000000, %l5 = 0000000000000000
	ldsha	[%i3+%o4]0x81,%l5	! %l5 = ffffffffffffa500

p0_label_203:
!	Mem[0000000021800000] = 1cb7dd30, %l4 = 0000000000004f97
	ldsb	[%o3+0x001],%l4		! %l4 = ffffffffffffffb7
!	%l2 = 0000000000000000, imm = fffffffffffffb59, %l5 = ffffffffffffa500
	andn	%l2,-0x4a7,%l5		! %l5 = 0000000000000000
!	Mem[0000000010001408] = 0000ff0056000000, %l4 = ffffffffffffffb7
	ldxa	[%i0+0x008]%asi,%l4	! %l4 = 0000ff0056000000
!	Mem[0000000010141410] = ffff00ff, %l4 = 0000ff0056000000
	ldsba	[%i5+%o5]0x80,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000030101410] = b10000ff, %l3 = 00ff00000c281024
	lduha	[%i4+%o5]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010081420] = 8be483af c9206600, %l0 = ffffff7f, %l1 = 0000c9ff
	ldda	[%i2+0x020]%asi,%l0	! %l0 = 000000008be483af 00000000c9206600
!	Mem[0000000010181410] = ffffb6eb, %f16 = 0000004f
	lda	[%i6+%o5]0x88,%f16	! %f16 = ffffb6eb
!	Mem[000000001008141c] = ffffaf83, %f12 = 96c4166b
	lda	[%i2+0x01c]%asi,%f12	! %f12 = ffffaf83
!	Mem[0000000010181400] = ff000000, %l0 = 000000008be483af
	ldsba	[%i6+%g0]0x80,%l0	! %l0 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	Mem[0000000010041408] = ff00ffff, %l2 = 0000000000000000, %asi = 80
	swapa	[%i1+0x008]%asi,%l2	! %l2 = 00000000ff00ffff

p0_label_204:
!	%l2 = 00000000ff00ffff, Mem[0000000030081410] = ff00006200000000
	stxa	%l2,[%i2+%o5]0x81	! Mem[0000000030081410] = 00000000ff00ffff
!	%f16 = ffffb6eb 00000000 ffffaf83 0000004f
!	%f20 = 00002802 000000ff 66c93792 034f37e1
!	%f24 = e0002802 8be483af ff37c966 7fffffff
!	%f28 = 00000000 000000ff 000000ff ffe0c7f6
	stda	%f16,[%i0]ASI_BLK_AIUP	! Block Store to 0000000010001400
!	%l6 = 0000000000000000, Mem[0000000021800180] = ffffad00, %asi = 80
	stba	%l6,[%o3+0x180]%asi	! Mem[0000000021800180] = 00ffad00
!	Code Fragment 4
p0_fragment_16:
!	%l0 = ffffffffffffffff
	setx	0x6e2b5990117fb56b,%g7,%l0 ! %l0 = 6e2b5990117fb56b
!	%l1 = 00000000c9206600
	setx	0x3a49fd80469057d4,%g7,%l1 ! %l1 = 3a49fd80469057d4
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 6e2b5990117fb56b
	setx	0x24cc492f9eb8caf3,%g7,%l0 ! %l0 = 24cc492f9eb8caf3
!	%l1 = 3a49fd80469057d4
	setx	0x96cfd8c0226b88e2,%g7,%l1 ! %l1 = 96cfd8c0226b88e2
!	%f12 = ffffaf83 000000ff, Mem[0000000030101400] = e4000000 83afffff
	stda	%f12,[%i4+%g0]0x89	! Mem[0000000030101400] = ffffaf83 000000ff
!	Mem[0000000010101430] = ffff8668, %l6 = 0000000000000000
	swap	[%i4+0x030],%l6		! %l6 = 00000000ffff8668
!	%l6 = ffff8668, %l7 = 0000007f, Mem[0000000010141400] = ff000000 00000000
	stda	%l6,[%i5+%g0]0x80	! Mem[0000000010141400] = ffff8668 0000007f
!	%l6 = 00000000ffff8668, %l5 = 0000000000000000, %l4 = ffffffffffffffff
	and	%l6,%l5,%l4		! %l4 = 0000000000000000
!	Mem[00000000100c1400] = ffff974f, %l7 = 000000000000007f
	swapa	[%i3+%g0]0x80,%l7	! %l7 = 00000000ffff974f
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = 00e00000, %l3 = 00000000000000ff
	lduba	[%i4+%o4]0x80,%l3	! %l3 = 0000000000000000

p0_label_205:
!	Mem[0000000021800140] = ffff94e3, %l4 = 0000000000000000
	ldsha	[%o3+0x140]%asi,%l4	! %l4 = ffffffffffffffff
!	Mem[00000000100c1408] = 000000ff, %l0 = 24cc492f9eb8caf3
	lduba	[%i3+%o4]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010081408] = 0003000049ff665d, %l1 = 96cfd8c0226b88e2
	ldxa	[%i2+%o4]0x80,%l1	! %l1 = 0003000049ff665d
!	Mem[00000000201c0000] = 4f9719af, %l6 = 00000000ffff8668
	lduba	[%o0+0x001]%asi,%l6	! %l6 = 0000000000000097
!	%l4 = ffffffffffffffff, immd = 0000000000000146, %l6  = 0000000000000097
	mulx	%l4,0x146,%l6		! %l6 = fffffffffffffeba
!	Mem[0000000030081410] = 00000000, %l5 = 0000000000000000
	lduba	[%i2+%o5]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000010041418] = 66c93792034f37e1, %l0 = 00000000000000ff
	ldxa	[%i1+0x018]%asi,%l0	! %l0 = 66c93792034f37e1
!	Mem[0000000030181408] = 0000974f, %l6 = fffffffffffffeba
	ldsba	[%i6+%o4]0x81,%l6	! %l6 = 0000000000000000
!	Mem[00000000300c1408] = 000000a5, %l5 = 0000000000000000
	lduwa	[%i3+%o4]0x89,%l5	! %l5 = 00000000000000a5
!	Starting 10 instruction Store Burst
!	%l5 = 00000000000000a5, Mem[0000000010141418] = ffffffffffe0c7f6, %asi = 80
	stxa	%l5,[%i5+0x018]%asi	! Mem[0000000010141418] = 00000000000000a5

p0_label_206:
!	Mem[0000000010181408] = 0000004f, %l4 = ffffffffffffffff
	swapa	[%i6+%o4]0x80,%l4	! %l4 = 000000000000004f
!	%f4  = c1bd6468 b1000000, Mem[0000000010081408] = 00000300 5d66ff49
	stda	%f4 ,[%i2+%o4]0x88	! Mem[0000000010081408] = c1bd6468 b1000000
!	Mem[0000000010041400] = 000000ff00000000, %l0 = 66c93792034f37e1, %l6 = 0000000000000000
	casxa	[%i1]0x80,%l0,%l6	! %l6 = 000000ff00000000
!	Mem[0000000010041400] = ff000000, %l3 = 0000000000000000
	ldstuba	[%i1+%g0]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010081400] = 00000000, %l4 = 000000000000004f
	swapa	[%i2+%g0]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000010101403] = 7f000000, %l6 = 000000ff00000000
	ldstuba	[%i4+0x003]%asi,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030081400] = 76b6b320, %l4 = 0000000000000000
	ldstuba	[%i2+%g0]0x89,%l4	! %l4 = 00000020000000ff
!	%l0 = 66c93792034f37e1, Mem[0000000010101408] = 00e0000000000000
	stxa	%l0,[%i4+%o4]0x80	! Mem[0000000010101408] = 66c93792034f37e1
!	Code Fragment 3
p0_fragment_17:
!	%l0 = 66c93792034f37e1
	setx	0xf94bf2487b0a1536,%g7,%l0 ! %l0 = f94bf2487b0a1536
!	%l1 = 0003000049ff665d
	setx	0xc7021f6036e48372,%g7,%l1 ! %l1 = c7021f6036e48372
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = f94bf2487b0a1536
	setx	0x228d1307f950dcc7,%g7,%l0 ! %l0 = 228d1307f950dcc7
!	%l1 = c7021f6036e48372
	setx	0xabf643b86e700ad4,%g7,%l1 ! %l1 = abf643b86e700ad4
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = b1000000, %l3 = 0000000000000000
	lduwa	[%i2+%o4]0x88,%l3	! %l3 = 00000000b1000000

p0_label_207:
!	Mem[0000000010101408] = 9237c966, %l7 = 00000000ffff974f
	ldsha	[%i4+%o4]0x88,%l7	! %l7 = ffffffffffffc966
!	Mem[0000000030041410] = ffffaf83 4920665d, %l2 = ff00ffff, %l3 = b1000000
	ldda	[%i1+%o5]0x89,%l2	! %l2 = 000000004920665d 00000000ffffaf83
!	Mem[0000000030001408] = 00000000, %l2 = 000000004920665d
	lduba	[%i0+%o4]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000010041400] = ff0000ff, %f28 = 00000000
	lda	[%i1+%g0]0x88,%f28	! %f28 = ff0000ff
!	Mem[0000000010181410] = ebb6ffff, %l4 = 0000000000000020
	ldsba	[%i6+%o5]0x80,%l4	! %l4 = ffffffffffffffeb
!	Mem[0000000010141410] = ffff00ff66c937ff, %l7 = ffffffffffffc966
	ldxa	[%i5+%o5]0x80,%l7	! %l7 = ffff00ff66c937ff
!	Mem[00000000300c1400] = 00000000, %l6 = 0000000000000000
	lduha	[%i3+%g0]0x81,%l6	! %l6 = 0000000000000000
!	%l7 = ffff00ff66c937ff, Mem[0000000010181408] = ffffffff
	stwa	%l7,[%i6+%o4]0x80	! Mem[0000000010181408] = 66c937ff
!	Mem[0000000010101408] = 9237c966, %f5  = b1000000
	lda	[%i4+%o4]0x88,%f5 	! %f5 = 9237c966
!	Starting 10 instruction Store Burst
!	%l3 = 00000000ffffaf83, Mem[0000000021800041] = ff0e4385, %asi = 80
	stba	%l3,[%o3+0x041]%asi	! Mem[0000000021800040] = ff834385

p0_label_208:
!	%f6  = 41dfffff ffc00000, %l2 = 0000000000000000
!	Mem[0000000010181430] = 4049c35800000000
	add	%i6,0x030,%g1
	stda	%f6,[%g1+%l2]ASI_PST32_P ! Mem[0000000010181430] = 4049c35800000000
!	Mem[0000000010181408] = 66c937ff, %l3 = 00000000ffffaf83
	swapa	[%i6+%o4]0x80,%l3	! %l3 = 0000000066c937ff
!	%f4  = c1bd6468, Mem[0000000010181410] = ffffb6eb
	sta	%f4 ,[%i6+%o5]0x88	! Mem[0000000010181410] = c1bd6468
!	%f0  = bb1a00ff c8941a45 ff662049 c8941a45
!	%f4  = c1bd6468 9237c966 41dfffff ffc00000
!	%f8  = 00000000 30fbc62b 4f979be2 7fffffff
!	%f12 = ffffaf83 000000ff ffffffff ffffffff
	stda	%f0,[%i5]ASI_COMMIT_P	! Block Store to 0000000010141400
!	%l6 = 00000000, %l7 = 66c937ff, Mem[0000000030081410] = 00000000 ff00ffff
	stda	%l6,[%i2+%o5]0x81	! Mem[0000000030081410] = 00000000 66c937ff
!	Mem[0000000010181400] = 000000ff, %l2 = 0000000000000000
	swapa	[%i6+%g0]0x88,%l2	! %l2 = 00000000000000ff
!	%l4 = ffffffffffffffeb, Mem[000000001004140d] = 0000004f, %asi = 80
	stba	%l4,[%i1+0x00d]%asi	! Mem[000000001004140c] = 00eb004f
!	%f24 = e0002802 8be483af, Mem[0000000030001400] = 00004f97 00000000
	stda	%f24,[%i0+%g0]0x81	! Mem[0000000030001400] = e0002802 8be483af
!	%l6 = 0000000000000000, Mem[00000000100c1410] = 0000ff00
	stha	%l6,[%i3+%o5]0x80	! Mem[00000000100c1410] = 0000ff00
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = ff00000002280000, %f28 = ff0000ff 000000ff
	ldda	[%i0+%o5]0x81,%f28	! %f28 = ff000000 02280000

p0_label_209:
!	Code Fragment 4
p0_fragment_18:
!	%l0 = 228d1307f950dcc7
	setx	0x93cfa737de4c9d47,%g7,%l0 ! %l0 = 93cfa737de4c9d47
!	%l1 = abf643b86e700ad4
	setx	0x0350101fe8519dc1,%g7,%l1 ! %l1 = 0350101fe8519dc1
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 93cfa737de4c9d47
	setx	0xbd28a1301244bfae,%g7,%l0 ! %l0 = bd28a1301244bfae
!	%l1 = 0350101fe8519dc1
	setx	0x564cc8e0731f6569,%g7,%l1 ! %l1 = 564cc8e0731f6569
!	Mem[0000000010101400] = ff00007f, %l1 = 564cc8e0731f6569
	lduwa	[%i4+%g0]0x88,%l1	! %l1 = 00000000ff00007f
!	%l7 = ffff00ff66c937ff, imm = 00000000000005fc, %l4 = ffffffffffffffeb
	xor	%l7,0x5fc,%l4		! %l4 = ffff00ff66c93203
!	Mem[0000000010081408] = 000000b16864bdc1, %f20 = 00002802 000000ff
	ldda	[%i2+%o4]0x80,%f20	! %f20 = 000000b1 6864bdc1
!	Mem[0000000010041408] = 4f00eb0000000000, %l1 = 00000000ff00007f
	ldxa	[%i1+%o4]0x88,%l1	! %l1 = 4f00eb0000000000
	membar	#Sync			! Added by membar checker (32)
!	Mem[0000000010001410] = 00002802 000000ff, %l2 = 000000ff, %l3 = 66c937ff
	ldda	[%i0+%o5]0x80,%l2	! %l2 = 0000000000002802 00000000000000ff
!	Code Fragment 4
p0_fragment_19:
!	%l0 = bd28a1301244bfae
	setx	0x28449f27d088b124,%g7,%l0 ! %l0 = 28449f27d088b124
!	%l1 = 4f00eb0000000000
	setx	0x7c4a39384037601e,%g7,%l1 ! %l1 = 7c4a39384037601e
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 28449f27d088b124
	setx	0x0167158fda381fcf,%g7,%l0 ! %l0 = 0167158fda381fcf
!	%l1 = 7c4a39384037601e
	setx	0x9e07ad7fe9e7d1ff,%g7,%l1 ! %l1 = 9e07ad7fe9e7d1ff
!	Mem[0000000010181408] = 83afffff, %l1 = 9e07ad7fe9e7d1ff
	ldswa	[%i6+%o4]0x88,%l1	! %l1 = ffffffff83afffff
!	Mem[0000000020800000] = 20ff17e8, %l3 = 00000000000000ff
	lduh	[%o1+%g0],%l3		! %l3 = 00000000000020ff
!	Starting 10 instruction Store Burst
!	Mem[0000000030001410] = 000000ff, %l3 = 00000000000020ff
	ldstuba	[%i0+%o5]0x89,%l3	! %l3 = 000000ff000000ff

p0_label_210:
!	%l5 = 00000000000000a5, Mem[0000000030081408] = ffffaf83
	stwa	%l5,[%i2+%o4]0x81	! Mem[0000000030081408] = 000000a5
!	%f0  = bb1a00ff, Mem[000000001014140c] = c8941a45
	st	%f0 ,[%i5+0x00c]	! Mem[000000001014140c] = bb1a00ff
!	Mem[00000000300c1408] = a5000000, %l4 = ffff00ff66c93203
	swapa	[%i3+%o4]0x81,%l4	! %l4 = 00000000a5000000
!	%f18 = ffffaf83 0000004f, %l4 = 00000000a5000000
!	Mem[0000000010181418] = 000000ff00000000
	add	%i6,0x018,%g1
	stda	%f18,[%g1+%l4]ASI_PST8_PL ! Mem[0000000010181418] = 000000ff00000000
!	%f4  = c1bd6468 9237c966, %l5 = 00000000000000a5
!	Mem[00000000100c1430] = ffffffffffffffff
	add	%i3,0x030,%g1
	stda	%f4,[%g1+%l5]ASI_PST8_P ! Mem[00000000100c1430] = c1ff64ffff37ff66
!	Mem[0000000010181400] = 00000000, %l6 = 0000000000000000
	swapa	[%i6+%g0]0x80,%l6	! %l6 = 0000000000000000
!	%l6 = 00000000, %l7 = 66c937ff, Mem[0000000010101400] = 7f0000ff 4a27ace9
	stda	%l6,[%i4+0x000]%asi	! Mem[0000000010101400] = 00000000 66c937ff
!	Mem[0000000030181408] = 4f970000, %l4 = 00000000a5000000
	ldstuba	[%i6+%o4]0x89,%l4	! %l4 = 00000000000000ff
!	%l1 = ffffffff83afffff, Mem[0000000010141408] = 492066ff
	stwa	%l1,[%i5+%o4]0x88	! Mem[0000000010141408] = 83afffff
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = ffb3b676, %l1 = ffffffff83afffff
	lduwa	[%i2+%g0]0x81,%l1	! %l1 = 00000000ffb3b676

p0_label_211:
!	Mem[0000000030081400] = 15331e8d 76b6b3ff, %l6 = 00000000, %l7 = 66c937ff
	ldda	[%i2+%g0]0x89,%l6	! %l6 = 0000000076b6b3ff 0000000015331e8d
!	Mem[0000000010141408] = 83afffff, %l5 = 00000000000000a5
	ldsha	[%i5+%o4]0x88,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000030101410] = b10000ff, %f15 = ffffffff
	lda	[%i4+%o5]0x89,%f15	! %f15 = b10000ff
!	Mem[0000000030181400] = 1cb918042bc6fb30, %f20 = 000000b1 6864bdc1
	ldda	[%i6+%g0]0x89,%f20	! %f20 = 1cb91804 2bc6fb30
!	Mem[0000000010141410] = c1bd6468, %f29 = 02280000
	lda	[%i5+0x010]%asi,%f29	! %f29 = c1bd6468
!	Mem[0000000030041410] = 5d662049, %l5 = ffffffffffffffff
	lduha	[%i1+%o5]0x81,%l5	! %l5 = 0000000000005d66
!	Mem[0000000030181400] = 2bc6fb30, %l6 = 0000000076b6b3ff
	lduwa	[%i6+%g0]0x89,%l6	! %l6 = 000000002bc6fb30
!	Mem[0000000030041408] = 83afffff, %f23 = 034f37e1
	lda	[%i1+%o4]0x81,%f23	! %f23 = 83afffff
	membar	#Sync			! Added by membar checker (33)
!	Mem[00000000100c1400] = 0000007f c8941a45 ff000000 02280000
!	Mem[00000000100c1410] = 0000ff00 1cb91804 cf030000 4920665d
!	Mem[00000000100c1420] = 00000000 30fbc62b ffffff00 7fffffff
!	Mem[00000000100c1430] = c1ff64ff ff37ff66 ec0404c9 f9c9cf7f
	ldda	[%i3]ASI_BLK_P,%f0	! Block Load from 00000000100c1400
!	Starting 10 instruction Store Burst
!	%f20 = 1cb91804, Mem[0000000010181410] = c1bd6468
	sta	%f20,[%i6+%o5]0x88	! Mem[0000000010181410] = 1cb91804

p0_label_212:
!	Mem[0000000010101408] = 66c93792, %l1 = 00000000ffb3b676
	swapa	[%i4+%o4]0x80,%l1	! %l1 = 0000000066c93792
!	Mem[0000000010181410] = 0418b91c, %l5 = 0000000000005d66
	swap	[%i6+%o5],%l5		! %l5 = 000000000418b91c
!	%l3 = 00000000000000ff, Mem[0000000010081400] = 000000000000004f
	stxa	%l3,[%i2+%g0]0x88	! Mem[0000000010081400] = 00000000000000ff
!	%l5 = 000000000418b91c, Mem[0000000010181418] = 000000ff00000000
	stx	%l5,[%i6+0x018]		! Mem[0000000010181418] = 000000000418b91c
!	Mem[0000000030181408] = ff00974f, %l1 = 0000000066c93792
	ldstuba	[%i6+%o4]0x81,%l1	! %l1 = 000000ff000000ff
!	Mem[0000000010141438] = ffffffffffffffff, %l5 = 000000000418b91c, %l7 = 0000000015331e8d
	add	%i5,0x38,%g1
	casxa	[%g1]0x80,%l5,%l7	! %l7 = ffffffffffffffff
!	Mem[00000000300c1408] = 66c93203, %l4 = 0000000000000000
	ldstuba	[%i3+%o4]0x81,%l4	! %l4 = 00000066000000ff
!	%l3 = 00000000000000ff, %l4 = 0000000000000066, %l2  = 0000000000002802
	mulx	%l3,%l4,%l2		! %l2 = 000000000000659a
!	%f29 = c1bd6468, Mem[00000000300c1400] = 00000000
	sta	%f29,[%i3+%g0]0x81	! Mem[00000000300c1400] = c1bd6468
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = 0000ffff, %l4 = 0000000000000066
	lduba	[%i4+%o4]0x89,%l4	! %l4 = 00000000000000ff

p0_label_213:
!	Mem[0000000021800040] = ff834385, %l1 = 00000000000000ff
	lduba	[%o3+0x041]%asi,%l1	! %l1 = 0000000000000083
!	Mem[0000000030041400] = ffffffff, %f24 = e0002802
	lda	[%i1+%g0]0x89,%f24	! %f24 = ffffffff
!	Mem[00000000100c1400] = 451a94c87f000000, %f30 = 000000ff ffe0c7f6
	ldda	[%i3+%g0]0x88,%f30	! %f30 = 451a94c8 7f000000
!	Mem[0000000010101428] = 0000007affffffff, %f22 = 66c93792 83afffff
	ldda	[%i4+0x028]%asi,%f22	! %f22 = 0000007a ffffffff
!	Mem[0000000010101408] = ffb3b676, %l6 = 000000002bc6fb30
	lduwa	[%i4+%o4]0x80,%l6	! %l6 = 00000000ffb3b676
!	Mem[0000000020800000] = 20ff17e8, %l3 = 00000000000000ff
	lduha	[%o1+0x000]%asi,%l3	! %l3 = 00000000000020ff
!	Mem[000000001010141c] = ffffaf83, %f21 = 2bc6fb30
	ld	[%i4+0x01c],%f21	! %f21 = ffffaf83
!	Mem[0000000030101410] = ff0000b1, %l5 = 000000000418b91c
	lduba	[%i4+%o5]0x81,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010041410] = 2bc6fb30, %l0 = 0167158fda381fcf
	lduha	[%i1+%o5]0x88,%l0	! %l0 = 000000000000fb30
!	Starting 10 instruction Store Burst
!	%l1 = 0000000000000083, Mem[0000000010141408] = ffffaf83
	stha	%l1,[%i5+%o4]0x80	! Mem[0000000010141408] = 0083af83

p0_label_214:
!	Mem[0000000030141408] = ff000000, %l3 = 00000000000020ff
	swapa	[%i5+%o4]0x89,%l3	! %l3 = 00000000ff000000
!	%l6 = 00000000ffb3b676, Mem[0000000010081400] = ff000000
	stha	%l6,[%i2+%g0]0x80	! Mem[0000000010081400] = b6760000
!	%l0 = 000000000000fb30, Mem[0000000010101408] = ffb3b676, %asi = 80
	stwa	%l0,[%i4+0x008]%asi	! Mem[0000000010101408] = 0000fb30
!	Mem[00000000100c1400] = 7f000000, %l5 = 00000000000000ff
	swapa	[%i3+%g0]0x88,%l5	! %l5 = 000000007f000000
!	%l1 = 0000000000000083, Mem[0000000030101400] = ffffaf83000000ff
	stxa	%l1,[%i4+%g0]0x89	! Mem[0000000030101400] = 0000000000000083
!	%l4 = 00000000000000ff, Mem[0000000010141400] = ff001abb
	stba	%l4,[%i5+%g0]0x88	! Mem[0000000010141400] = ff001aff
!	%l3 = 00000000ff000000, Mem[0000000010081408] = 000000b1
	stba	%l3,[%i2+%o4]0x80	! Mem[0000000010081408] = 000000b1
!	%l4 = 00000000000000ff, Mem[0000000010001410] = 00002802
	stb	%l4,[%i0+%o5]		! Mem[0000000010001410] = ff002802
!	Mem[0000000010041410] = 2bc6fb30, %l2 = 000000000000659a
	swapa	[%i1+%o5]0x88,%l2	! %l2 = 000000002bc6fb30
!	Starting 10 instruction Load Burst
!	Mem[00000000100c140c] = 02280000, %l3 = 00000000ff000000
	ldsh	[%i3+0x00c],%l3		! %l3 = 0000000000000228

p0_label_215:
!	Mem[0000000010041408] = 4f00eb00 00000000, %l6 = ffb3b676, %l7 = ffffffff
	ldda	[%i1+%o4]0x88,%l6	! %l6 = 0000000000000000 000000004f00eb00
!	Mem[00000000100c1408] = 000000ff, %l3 = 0000000000000228
	ldsha	[%i3+%o4]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010101410] = 000000ff, %l3 = 00000000000000ff
	lduha	[%i4+%o5]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030081408] = a5000000, %l0 = 000000000000fb30
	lduha	[%i2+%o4]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000010101410] = ff0000000000003e, %f24 = ffffffff 8be483af
	ldda	[%i4+%o5]0x80,%f24	! %f24 = ff000000 0000003e
!	Mem[0000000030001408] = 0000000000000000, %l5 = 000000007f000000
	ldxa	[%i0+%o4]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000010041410] = 0000659a, %l1 = 0000000000000083
	lduba	[%i1+%o5]0x88,%l1	! %l1 = 000000000000009a
!	Mem[0000000010001410] = 022800ff, %f0  = 0000007f
	lda	[%i0+%o5]0x88,%f0 	! %f0 = 022800ff
!	Mem[0000000010001408] = ffffaf83, %l5 = 0000000000000000
	lduba	[%i0+%o4]0x80,%l5	! %l5 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000030081408] = a5000000, %l7 = 000000004f00eb00
	swapa	[%i2+%o4]0x89,%l7	! %l7 = 00000000a5000000

p0_label_216:
!	%l7 = 00000000a5000000, Mem[0000000010081400] = b6760000
	stba	%l7,[%i2+%g0]0x80	! Mem[0000000010081400] = 00760000
!	Mem[00000000201c0000] = 4f9719af, %l6 = 0000000000000000
	ldstuba	[%o0+0x000]%asi,%l6	! %l6 = 0000004f000000ff
!	%l0 = 0000000000000000, Mem[0000000030001410] = ff00000002280000
	stxa	%l0,[%i0+%o5]0x81	! Mem[0000000030001410] = 0000000000000000
!	Code Fragment 3
p0_fragment_20:
!	%l0 = 0000000000000000
	setx	0xb127f13851691fae,%g7,%l0 ! %l0 = b127f13851691fae
!	%l1 = 000000000000009a
	setx	0x2b5defa0107184d1,%g7,%l1 ! %l1 = 2b5defa0107184d1
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = b127f13851691fae
	setx	0x89e1bbc829010dde,%g7,%l0 ! %l0 = 89e1bbc829010dde
!	%l1 = 2b5defa0107184d1
	setx	0x11c816a79aaaea72,%g7,%l1 ! %l1 = 11c816a79aaaea72
!	%f11 = 7fffffff, Mem[0000000010081410] = b1000000
	sta	%f11,[%i2+%o5]0x88	! Mem[0000000010081410] = 7fffffff
!	Mem[0000000010141410] = c1bd6468, %l0 = 89e1bbc829010dde
	ldstuba	[%i5+%o5]0x80,%l0	! %l0 = 000000c1000000ff
!	%l5 = 00000000000000ff, Mem[0000000010041400] = ff0000ff
	stha	%l5,[%i1+%g0]0x80	! Mem[0000000010041400] = 00ff00ff
!	%l0 = 000000c1, %l1 = 9aaaea72, Mem[0000000010141410] = 6864bdff 66c93792
	stda	%l0,[%i5+%o5]0x88	! Mem[0000000010141410] = 000000c1 9aaaea72
!	Mem[0000000010141410] = 000000c1, %l1 = 11c816a79aaaea72
	ldstuba	[%i5+%o5]0x88,%l1	! %l1 = 000000c1000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = b1000000, %l1 = 00000000000000c1
	ldsba	[%i2+%o4]0x88,%l1	! %l1 = 0000000000000000

p0_label_217:
!	Mem[0000000010001410] = 022800ff, %f25 = 0000003e
	lda	[%i0+%o5]0x88,%f25	! %f25 = 022800ff
!	Mem[0000000010181414] = 00ff0000, %f29 = c1bd6468
	ld	[%i6+0x014],%f29	! %f29 = 00ff0000
!	Mem[0000000030101408] = 0000ffff, %f3  = 02280000
	lda	[%i4+%o4]0x89,%f3 	! %f3 = 0000ffff
!	Mem[00000000201c0000] = ff9719af, %l5 = 00000000000000ff
	lduh	[%o0+%g0],%l5		! %l5 = 000000000000ff97
!	Mem[0000000010141400] = ff1a00ff, %l3 = 00000000000000ff
	lduha	[%i5+%g0]0x80,%l3	! %l3 = 000000000000ff1a
!	Mem[0000000030001408] = 00000000, %l1 = 0000000000000000
	ldsba	[%i0+%o4]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000030001410] = 00000000, %l1 = 0000000000000000
	lduwa	[%i0+%o5]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000010041408] = 0000000000eb004f, %l0 = 00000000000000c1
	ldxa	[%i1+0x008]%asi,%l0	! %l0 = 0000000000eb004f
!	Mem[0000000030181410] = ff000000, %l2 = 000000002bc6fb30
	ldsha	[%i6+%o5]0x81,%l2	! %l2 = ffffffffffffff00
!	Starting 10 instruction Store Burst
!	%f22 = 0000007a ffffffff, %l4 = 00000000000000ff
!	Mem[0000000030041420] = 07fefd2430fbc62b
	add	%i1,0x020,%g1
	stda	%f22,[%g1+%l4]ASI_PST8_SL ! Mem[0000000030041420] = ffffffff7a000000

p0_label_218:
!	%l3 = 000000000000ff1a, Mem[0000000030141410] = 1cb91a45
	stha	%l3,[%i5+%o5]0x89	! Mem[0000000030141410] = 1cb9ff1a
!	Mem[0000000030181400] = 2bc6fb30, %l7 = 00000000a5000000
	ldstuba	[%i6+%g0]0x89,%l7	! %l7 = 00000030000000ff
!	%l0 = 0000000000eb004f, Mem[0000000030181408] = ff00974f
	stwa	%l0,[%i6+%o4]0x81	! Mem[0000000030181408] = 00eb004f
!	Mem[000000001004142c] = 7fffffff, %l1 = 00000000, %l7 = 00000030
	add	%i1,0x2c,%g1
	casa	[%g1]0x80,%l1,%l7	! %l7 = 000000007fffffff
!	Mem[0000000010081400] = 00007600, %l7 = 000000007fffffff
	swapa	[%i2+%g0]0x88,%l7	! %l7 = 0000000000007600
!	%l4 = 00000000000000ff, Mem[0000000010141400] = ff001aff
	stba	%l4,[%i5+%g0]0x88	! Mem[0000000010141400] = ff001aff
	membar	#Sync			! Added by membar checker (34)
!	%l2 = ffffffffffffff00, Mem[00000000100c1417] = 1cb91804, %asi = 80
	stba	%l2,[%i3+0x017]%asi	! Mem[00000000100c1414] = 1cb91800
!	%l0 = 0000000000eb004f, Mem[00000000201c0000] = ff9719af, %asi = 80
	stba	%l0,[%o0+0x000]%asi	! Mem[00000000201c0000] = 4f9719af
!	%l4 = 00000000000000ff, Mem[00000000100c1408] = 00002802000000ff
	stxa	%l4,[%i3+%o4]0x88	! Mem[00000000100c1408] = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = 1affb91c, %f31 = 7f000000
	lda	[%i5+%o5]0x81,%f31	! %f31 = 1affb91c

p0_label_219:
!	Mem[00000000100c1434] = ff37ff66, %f9  = 30fbc62b
	lda	[%i3+0x034]%asi,%f9 	! %f9 = ff37ff66
!	Mem[0000000030101400] = 8300000000000000, %l0 = 0000000000eb004f
	ldxa	[%i4+%g0]0x81,%l0	! %l0 = 8300000000000000
!	Mem[0000000030101408] = 0000ffff, %l2 = ffffffffffffff00
	lduwa	[%i4+%o4]0x89,%l2	! %l2 = 000000000000ffff
!	Mem[0000000010101400] = 00000000 66c937ff 0000fb30 034f37e1
!	Mem[0000000010101410] = ff000000 0000003e ffffadff ffffaf83
!	Mem[0000000010101420] = ffffff7f 19e5972e 0000007a ffffffff
!	Mem[0000000010101430] = 00000000 00000000 ffe0c7f6 006d0000
	ldda	[%i4]ASI_BLK_AIUP,%f0	! Block Load from 0000000010101400
!	Mem[0000000010081438] = ffffffff, %l3 = 000000000000ff1a
	ldsh	[%i2+0x038],%l3		! %l3 = ffffffffffffffff
!	Mem[0000000030081410] = 00000000, %l3 = ffffffffffffffff
	lduwa	[%i2+%o5]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000030001408] = 0000000000000000, %f20 = 1cb91804 ffffaf83
	ldda	[%i0+%o4]0x89,%f20	! %f20 = 00000000 00000000
!	Mem[0000000030101400] = 00000083, %l0 = 8300000000000000
	ldswa	[%i4+%g0]0x89,%l0	! %l0 = 0000000000000083
!	Mem[0000000010181428] = 0418b91c afffffff, %l6 = 0000004f, %l7 = 00007600
	ldda	[%i6+0x028]%asi,%l6	! %l6 = 000000000418b91c 00000000afffffff
!	Starting 10 instruction Store Burst
!	%f18 = ffffaf83, Mem[0000000030101400] = 00000083
	sta	%f18,[%i4+%g0]0x89	! Mem[0000000030101400] = ffffaf83

p0_label_220:
!	%f20 = 00000000 00000000, %l6 = 000000000418b91c
!	Mem[0000000030101428] = 7fffffff00000000
	add	%i4,0x028,%g1
	stda	%f20,[%g1+%l6]ASI_PST16_SL ! Mem[0000000030101428] = 7fffffff00000000
!	%l1 = 0000000000000000, Mem[00000000100c1408] = ff000000
	stwa	%l1,[%i3+%o4]0x80	! Mem[00000000100c1408] = 00000000
!	%l0 = 0000000000000083, Mem[0000000030081408] = 4f00eb00
	stwa	%l0,[%i2+%o4]0x89	! Mem[0000000030081408] = 00000083
!	%l4 = 000000ff, %l5 = 0000ff97, Mem[0000000030181400] = 2bc6fbff 1cb91804
	stda	%l4,[%i6+%g0]0x89	! Mem[0000000030181400] = 000000ff 0000ff97
!	%l1 = 0000000000000000, Mem[00000000100c1400] = ff000000c8941a45
	stx	%l1,[%i3+%g0]		! Mem[00000000100c1400] = 0000000000000000
!	%f22 = 0000007a ffffffff, %l1 = 0000000000000000
!	Mem[0000000030101428] = 7fffffff00000000
	add	%i4,0x028,%g1
	stda	%f22,[%g1+%l1]ASI_PST16_SL ! Mem[0000000030101428] = 7fffffff00000000
!	%l2 = 000000000000ffff, Mem[0000000010081408] = b1000000
	stba	%l2,[%i2+%o4]0x88	! Mem[0000000010081408] = b10000ff
!	Mem[0000000010181410] = 665d0000, %l2 = 000000000000ffff
	ldstuba	[%i6+%o5]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030181400] = 000000ff, %l0 = 0000000000000083
	swapa	[%i6+%g0]0x89,%l0	! %l0 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = 0000fb30034f37e1, %f22 = 0000007a ffffffff
	ldda	[%i4+%o4]0x80,%f22	! %f22 = 0000fb30 034f37e1

p0_label_221:
!	Mem[00000000300c1408] = ffffffaf0332c9ff, %f26 = ff37c966 7fffffff
	ldda	[%i3+%o4]0x89,%f26	! %f26 = ffffffaf 0332c9ff
!	Mem[0000000010081410] = ffffff7f, %f16 = ffffb6eb
	lda	[%i2+%o5]0x80,%f16	! %f16 = ffffff7f
!	Mem[0000000030101400] = 83afffff, %l2 = 0000000000000000
	ldsba	[%i4+%g0]0x81,%l2	! %l2 = ffffffffffffff83
!	%f25 = 022800ff, %f23 = 034f37e1, %f26 = ffffffaf
	fsubs	%f25,%f23,%f26		! %f26 = 832537a1
!	Mem[0000000010181400] = 00000000, %l6 = 000000000418b91c
	ldsh	[%i6+0x002],%l6		! %l6 = 0000000000000000
!	Mem[0000000030181410] = ff000000, %f20 = 00000000
	lda	[%i6+%o5]0x81,%f20	! %f20 = ff000000
!	Mem[00000000300c1400] = c1bd6468, %l5 = 000000000000ff97
	lduwa	[%i3+%g0]0x81,%l5	! %l5 = 00000000c1bd6468
!	Mem[0000000030041410] = 5d66204983afffff, %f18 = ffffaf83 0000004f
	ldda	[%i1+%o5]0x81,%f18	! %f18 = 5d662049 83afffff
!	Mem[0000000030101408] = ffff0000, %f22 = 0000fb30
	lda	[%i4+%o4]0x81,%f22	! %f22 = ffff0000
!	Starting 10 instruction Store Burst
!	Mem[0000000010041400] = 00ff00ff, %l5 = 00000000c1bd6468
	swapa	[%i1+%g0]0x80,%l5	! %l5 = 0000000000ff00ff

p0_label_222:
!	Mem[0000000030001408] = 00000000, %l1 = 0000000000000000
	ldstuba	[%i0+%o4]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010001400] = ebb6ffff, %l0 = 00000000000000ff
	ldstuba	[%i0+%g0]0x88,%l0	! %l0 = 000000ff000000ff
!	%l3 = 0000000000000000, Mem[00000000211c0001] = ffff980d, %asi = 80
	stba	%l3,[%o2+0x001]%asi	! Mem[00000000211c0000] = ff00980d
!	%l1 = 0000000000000000, Mem[0000000010081428] = 660000ffff003500
	stx	%l1,[%i2+0x028]		! Mem[0000000010081428] = 0000000000000000
!	Mem[0000000010001410] = ff002802, %l6 = 0000000000000000
	swapa	[%i0+%o5]0x80,%l6	! %l6 = 00000000ff002802
!	%f17 = 00000000, Mem[0000000010141408] = 0083af83
	sta	%f17,[%i5+0x008]%asi	! Mem[0000000010141408] = 00000000
!	%l0 = 00000000000000ff, Mem[000000001008143e] = ffffffff, %asi = 80
	stha	%l0,[%i2+0x03e]%asi	! Mem[000000001008143c] = ffff00ff
!	Mem[0000000010041410] = 0000659a, %l5 = 0000000000ff00ff
	ldstuba	[%i1+%o5]0x88,%l5	! %l5 = 0000009a000000ff
!	Mem[0000000030001400] = 022800e0, %l3 = 0000000000000000
	ldstuba	[%i0+%g0]0x89,%l3	! %l3 = 000000e0000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = 00000000000020ff, %f20 = ff000000 00000000
	ldda	[%i5+%o4]0x89,%f20	! %f20 = 00000000 000020ff

p0_label_223:
!	Mem[0000000010141410] = ff000000, %l2 = ffffffffffffff83
	lduba	[%i5+%o5]0x80,%l2	! %l2 = 00000000000000ff
!	Mem[000000001004141c] = 034f37e1, %l2 = 00000000000000ff
	ldsw	[%i1+0x01c],%l2		! %l2 = 00000000034f37e1
!	Mem[0000000010081410] = ffff974f7fffffff, %f24 = ff000000 022800ff
	ldda	[%i2+%o5]0x88,%f24	! %f24 = ffff974f 7fffffff
!	Mem[0000000010001430] = 00000000, %l2 = 00000000034f37e1
	lduw	[%i0+0x030],%l2		! %l2 = 0000000000000000
!	Mem[0000000010141410] = 000000ff, %l1 = 0000000000000000
	ldswa	[%i5+%o5]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010081410] = ffffff7f4f97ffff, %f10 = 0000007a ffffffff
	ldda	[%i2+%o5]0x80,%f10	! %f10 = ffffff7f 4f97ffff
!	Mem[0000000010001410] = 00000000, %l6 = 00000000ff002802
	ldsha	[%i0+%o5]0x88,%l6	! %l6 = 0000000000000000
!	%l3 = 00000000000000e0, %l7 = 00000000afffffff, %l6 = 0000000000000000
	xor	%l3,%l7,%l6		! %l6 = 00000000afffff1f
!	Mem[0000000010101410] = ff000000, %l6 = 00000000afffff1f
	lduba	[%i4+0x011]%asi,%l6	! %l6 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010141408] = 00000000, %l1 = 00000000000000ff
	swapa	[%i5+%o4]0x80,%l1	! %l1 = 0000000000000000

p0_label_224:
!	Mem[0000000030181400] = 00000083, %l1 = 0000000000000000
	ldstuba	[%i6+%g0]0x89,%l1	! %l1 = 00000083000000ff
!	%f26 = 832537a1, Mem[0000000030081400] = 76b6b3ff
	sta	%f26,[%i2+%g0]0x89	! Mem[0000000030081400] = 832537a1
!	%l5 = 000000000000009a, %l3 = 00000000000000e0, %y  = 30e61f0a
	umul	%l5,%l3,%l2		! %l2 = 00000000000086c0, %y = 00000000
!	Mem[0000000010101401] = 00000000, %l3 = 00000000000000e0
	ldstub	[%i4+0x001],%l3		! %l3 = 00000000000000ff
!	%l0 = 00000000000000ff, Mem[0000000010141400] = ff001aff
	stwa	%l0,[%i5+%g0]0x88	! Mem[0000000010141400] = 000000ff
!	Mem[0000000010001410] = 00000000, %l6 = 0000000000000000
	ldstuba	[%i0+%o5]0x88,%l6	! %l6 = 00000000000000ff
!	%f2  = 0000fb30 034f37e1, Mem[00000000100c1400] = 00000000 00000000
	stda	%f2 ,[%i3+%g0]0x80	! Mem[00000000100c1400] = 0000fb30 034f37e1
!	%f14 = ffe0c7f6 006d0000, %l3 = 0000000000000000
!	Mem[0000000030081408] = 8300000000000000
	add	%i2,0x008,%g1
	stda	%f14,[%g1+%l3]ASI_PST32_SL ! Mem[0000000030081408] = 8300000000000000
!	%f26 = 832537a1 0332c9ff, Mem[00000000100c1408] = 00000000 00000000
	stda	%f26,[%i3+%o4]0x88	! Mem[00000000100c1408] = 832537a1 0332c9ff
!	Starting 10 instruction Load Burst
!	%l5 = 000000000000009a, immd = 0000000000000ad7, %l1 = 0000000000000083
	udivx	%l5,0xad7,%l1		! %l1 = 0000000000000000

p0_label_225:
!	Mem[0000000030041410] = 4920665d, %l5 = 000000000000009a
	ldswa	[%i1+%o5]0x89,%l5	! %l5 = 000000004920665d
!	Mem[00000000201c0000] = 4f9719af, %l4 = 00000000000000ff
	ldsha	[%o0+0x000]%asi,%l4	! %l4 = 0000000000004f97
!	Mem[0000000030081400] = a1372583 8d1e3315, %l0 = 000000ff, %l1 = 00000000
	ldda	[%i2+%g0]0x81,%l0	! %l0 = 00000000a1372583 000000008d1e3315
!	Mem[0000000030081410] = 00000000, %l1 = 000000008d1e3315
	lduha	[%i2+%o5]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000030101410] = c1bd6468 b10000ff, %l0 = a1372583, %l1 = 00000000
	ldda	[%i4+%o5]0x89,%l0	! %l0 = 00000000b10000ff 00000000c1bd6468
!	Mem[00000000201c0000] = 4f9719af, %l2 = 00000000000086c0
	lduh	[%o0+%g0],%l2		! %l2 = 0000000000004f97
!	Mem[00000000100c1408] = 0332c9ff, %l6 = 0000000000000000
	lduha	[%i3+%o4]0x88,%l6	! %l6 = 000000000000c9ff
!	Mem[0000000010001400] = ffffb6eb, %l2 = 0000000000004f97
	ldswa	[%i0+%g0]0x80,%l2	! %l2 = ffffffffffffb6eb
!	Mem[00000000218000c0] = 00ff4926, %l4 = 0000000000004f97
	lduha	[%o3+0x0c0]%asi,%l4	! %l4 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%f12 = 00000000 00000000, Mem[0000000010181418] = 00000000 0418b91c
	stda	%f12,[%i6+0x018]%asi	! Mem[0000000010181418] = 00000000 00000000

p0_label_226:
!	%l6 = 000000000000c9ff, immed = fffff05b, %y  = 00000000
	smul	%l6,-0xfa5,%l7		! %l7 = fffffffff3a7dda5, %y = ffffffff
!	Mem[0000000010081410] = ffffff7f, %l5 = 000000004920665d
	swapa	[%i2+%o5]0x80,%l5	! %l5 = 00000000ffffff7f
!	%l5 = 00000000ffffff7f, Mem[000000001018141c] = 00000000
	sth	%l5,[%i6+0x01c]		! Mem[000000001018141c] = ff7f0000
!	%l0 = 00000000b10000ff, Mem[0000000030181400] = 000000ff
	stha	%l0,[%i6+%g0]0x89	! Mem[0000000030181400] = 000000ff
!	%l6 = 000000000000c9ff, Mem[0000000030101408] = 0000ffff
	stwa	%l6,[%i4+%o4]0x89	! Mem[0000000030101408] = 0000c9ff
!	%l4 = 00000000000000ff, Mem[00000000100c1410] = 00ff0000
	stwa	%l4,[%i3+%o5]0x88	! Mem[00000000100c1410] = 000000ff
!	%l0 = 00000000b10000ff, Mem[0000000010081400] = 7fffffff
	stwa	%l0,[%i2+%g0]0x88	! Mem[0000000010081400] = b10000ff
!	Mem[0000000010001400] = ffffb6eb, %l3 = 0000000000000000
	ldstuba	[%i0+%g0]0x80,%l3	! %l3 = 000000ff000000ff
!	%l5 = 00000000ffffff7f, Mem[0000000020800000] = 20ff17e8, %asi = 80
	stha	%l5,[%o1+0x000]%asi	! Mem[0000000020800000] = ff7f17e8
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = 8300000000000000, %f2  = 0000fb30 034f37e1
	ldda	[%i2+%o4]0x81,%f2 	! %f2  = 83000000 00000000

p0_label_227:
!	Mem[0000000010101400] = 00ff0000 66c937ff, %l0 = b10000ff, %l1 = c1bd6468
	ldda	[%i4+0x000]%asi,%l0	! %l0 = 0000000000ff0000 0000000066c937ff
!	Mem[0000000010181408] = 83afffff, %l4 = 00000000000000ff
	ldsha	[%i6+%o4]0x88,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000030041400] = ffffffff, %l4 = ffffffffffffffff
	lduha	[%i1+%g0]0x89,%l4	! %l4 = 000000000000ffff
!	Mem[0000000010081408] = b10000ff, %l7 = fffffffff3a7dda5
	lduwa	[%i2+%o4]0x88,%l7	! %l7 = 00000000b10000ff
!	Mem[0000000010081410] = 5d662049, %l0 = 0000000000ff0000
	ldsha	[%i2+%o5]0x88,%l0	! %l0 = 0000000000002049
!	Mem[0000000030041410] = 4920665d, %l0 = 0000000000002049
	ldswa	[%i1+%o5]0x89,%l0	! %l0 = 000000004920665d
!	Mem[0000000030081408] = 83000000, %l6 = 000000000000c9ff
	lduwa	[%i2+%o4]0x81,%l6	! %l6 = 0000000083000000
!	Mem[00000000211c0000] = ff00980d, %l5 = 00000000ffffff7f
	ldsh	[%o2+%g0],%l5		! %l5 = ffffffffffffff00
!	Mem[0000000010141430] = ffffaf83000000ff, %l4 = 000000000000ffff
	ldx	[%i5+0x030],%l4		! %l4 = ffffaf83000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000010101401] = 00ff0000, %l1 = 0000000066c937ff
	ldstub	[%i4+0x001],%l1		! %l1 = 000000ff000000ff

p0_label_228:
!	%f1  = 66c937ff, Mem[0000000030141400] = 451a94c8
	sta	%f1 ,[%i5+%g0]0x81	! Mem[0000000030141400] = 66c937ff
!	%l1 = 00000000000000ff, Mem[0000000030141400] = 66c937ff
	stba	%l1,[%i5+%g0]0x81	! Mem[0000000030141400] = ffc937ff
!	Mem[00000000300c1408] = ffc93203, %l7 = 00000000b10000ff
	ldstuba	[%i3+%o4]0x81,%l7	! %l7 = 000000ff000000ff
!	Mem[000000001018140e] = 000014ff, %l1 = 00000000000000ff
	ldstuba	[%i6+0x00e]%asi,%l1	! %l1 = 00000014000000ff
!	Mem[0000000010041410] = ff650000, %l6 = 0000000083000000
	swapa	[%i1+%o5]0x80,%l6	! %l6 = 00000000ff650000
!	%l5 = ffffffffffffff00, Mem[00000000211c0001] = ff00980d, %asi = 80
	stba	%l5,[%o2+0x001]%asi	! Mem[00000000211c0000] = ff00980d
!	%l6 = ff650000, %l7 = 000000ff, Mem[0000000030141410] = 1affb91c 000000af
	stda	%l6,[%i5+%o5]0x81	! Mem[0000000030141410] = ff650000 000000ff
!	%l3 = 00000000000000ff, Mem[0000000010181408] = ffffaf83
	stwa	%l3,[%i6+%o4]0x80	! Mem[0000000010181408] = 000000ff
!	%l3 = 00000000000000ff, Mem[0000000030081408] = 00000083
	stha	%l3,[%i2+%o4]0x89	! Mem[0000000030081408] = 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = c1bd6468, %l7 = 00000000000000ff
	ldsba	[%i1+%g0]0x80,%l7	! %l7 = ffffffffffffffc1

p0_label_229:
!	Mem[000000001018141c] = ff7f0000, %f14 = ffe0c7f6
	lda	[%i6+0x01c]%asi,%f14	! %f14 = ff7f0000
!	Mem[00000000300c1400] = a5000000 6864bdc1, %l6 = ff650000, %l7 = ffffffc1
	ldda	[%i3+%g0]0x89,%l6	! %l6 = 000000006864bdc1 00000000a5000000
!	Mem[00000000300c1410] = 0000001a, %l3 = 00000000000000ff
	ldsba	[%i3+%o5]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000010101400] = 00ff000066c937ff, %f26 = 832537a1 0332c9ff
	ldda	[%i4+0x000]%asi,%f26	! %f26 = 00ff0000 66c937ff
!	Mem[0000000030001408] = 00000000 000000ff, %l2 = ffffb6eb, %l3 = 00000000
	ldda	[%i0+%o4]0x89,%l2	! %l2 = 00000000000000ff 0000000000000000
!	Mem[0000000010181438] = ff3d00b3000000e4, %l3 = 0000000000000000
	ldxa	[%i6+0x038]%asi,%l3	! %l3 = ff3d00b3000000e4
!	Mem[0000000030101410] = ff0000b1, %l0 = 000000004920665d
	lduwa	[%i4+%o5]0x81,%l0	! %l0 = 00000000ff0000b1
!	Mem[00000000300c1408] = ffffffaf0332c9ff, %f0  = 00000000 66c937ff
	ldda	[%i3+%o4]0x89,%f0 	! %f0  = ffffffaf 0332c9ff
!	Mem[0000000010001410] = 000000ff, %f9  = 19e5972e
	lda	[%i0+%o5]0x88,%f9 	! %f9 = 000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000010041400] = 6864bdc1, %l7 = 00000000a5000000
	ldstuba	[%i1+%g0]0x88,%l7	! %l7 = 000000c1000000ff

p0_label_230:
	membar	#Sync			! Added by membar checker (35)
!	%f2  = 83000000 00000000, %l6 = 000000006864bdc1
!	Mem[0000000010101410] = ff0000000000003e
	add	%i4,0x010,%g1
	stda	%f2,[%g1+%l6]ASI_PST32_P ! Mem[0000000010101410] = ff00000000000000
!	%l3 = ff3d00b3000000e4, Mem[0000000010081408] = c1bd6468b10000ff
	stxa	%l3,[%i2+%o4]0x88	! Mem[0000000010081408] = ff3d00b3000000e4
!	Mem[0000000030001400] = 022800ff, %l4 = ffffaf83000000ff
	ldstuba	[%i0+%g0]0x89,%l4	! %l4 = 000000ff000000ff
!	%l5 = ffffffffffffff00, Mem[0000000020800040] = 0049226c, %asi = 80
	stha	%l5,[%o1+0x040]%asi	! Mem[0000000020800040] = ff00226c
!	%f0  = ffffffaf 0332c9ff 83000000 00000000
!	%f4  = ff000000 0000003e ffffadff ffffaf83
!	%f8  = ffffff7f 000000ff ffffff7f 4f97ffff
!	%f12 = 00000000 00000000 ff7f0000 006d0000
	stda	%f0,[%i5]ASI_BLK_P	! Block Store to 0000000010141400
!	Mem[0000000030081400] = 832537a1, %l4 = 00000000000000ff
	ldstuba	[%i2+%g0]0x89,%l4	! %l4 = 000000a1000000ff
!	%l0 = 00000000ff0000b1, Mem[000000001018141a] = 00000000
	stb	%l0,[%i6+0x01a]		! Mem[0000000010181418] = 0000b100
!	Mem[000000001004140c] = 00eb004f, %l5 = ffffffffffffff00
	swap	[%i1+0x00c],%l5		! %l5 = 0000000000eb004f
!	%l6 = 000000006864bdc1, Mem[0000000030181400] = 000000ff
	stha	%l6,[%i6+%g0]0x89	! Mem[0000000030181400] = 0000bdc1
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = 5d66204983afffff, %l7 = 00000000000000c1
	ldxa	[%i1+%o5]0x81,%l7	! %l7 = 5d66204983afffff

p0_label_231:
!	Mem[0000000010081410] = 5d662049, %l5 = 0000000000eb004f
	lduha	[%i2+%o5]0x88,%l5	! %l5 = 0000000000002049
!	Mem[0000000010181408] = ff000000, %l0 = 00000000ff0000b1
	lduha	[%i6+%o4]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000030101410] = c1bd6468b10000ff, %l1 = 0000000000000014
	ldxa	[%i4+%o5]0x89,%l1	! %l1 = c1bd6468b10000ff
!	Mem[0000000030101408] = 0000c9ff, %f19 = 83afffff
	lda	[%i4+%o4]0x89,%f19	! %f19 = 0000c9ff
!	Mem[0000000030181410] = 000000ff, %l3 = ff3d00b3000000e4
	lduha	[%i6+%o5]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030181410] = ff000000, %f18 = 5d662049
	lda	[%i6+%o5]0x81,%f18	! %f18 = ff000000
!	Mem[0000000010181420] = ffb3b676, %l4 = 00000000000000a1
	lduwa	[%i6+0x020]%asi,%l4	! %l4 = 00000000ffb3b676
!	Mem[0000000010041410] = 83000000, %l5 = 0000000000002049
	ldsha	[%i1+%o5]0x80,%l5	! %l5 = ffffffffffff8300
!	Mem[00000000300c1410] = 1a000000, %l4 = 00000000ffb3b676
	ldsha	[%i3+%o5]0x89,%l4	! %l4 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f18 = ff000000, Mem[0000000030141400] = ffc937ff
	sta	%f18,[%i5+%g0]0x81	! Mem[0000000030141400] = ff000000

p0_label_232:
!	Mem[0000000030181410] = ff000000, %l4 = 0000000000000000
	swapa	[%i6+%o5]0x81,%l4	! %l4 = 00000000ff000000
!	%l4 = ff000000, %l5 = ffff8300, Mem[0000000030141410] = ff650000 000000ff
	stda	%l4,[%i5+%o5]0x81	! Mem[0000000030141410] = ff000000 ffff8300
!	%f27 = 66c937ff, %f31 = 1affb91c, %f30 = 451a94c8
	fsubs	%f27,%f31,%f30		! %f30 = 66c937ff
!	%l1 = c1bd6468b10000ff, Mem[00000000300c1400] = c1bd6468
	stba	%l1,[%i3+%g0]0x81	! Mem[00000000300c1400] = ffbd6468
!	Mem[0000000010101408] = 0000fb30, %l7 = 5d66204983afffff
	ldstuba	[%i4+%o4]0x80,%l7	! %l7 = 00000000000000ff
!	%l4 = ff000000, %l5 = ffff8300, Mem[0000000030141408] = ff200000 00000000
	stda	%l4,[%i5+%o4]0x81	! Mem[0000000030141408] = ff000000 ffff8300
	membar	#Sync			! Added by membar checker (36)
!	Mem[0000000010141404] = 0332c9ff, %l7 = 00000000, %l7 = 00000000
	add	%i5,0x04,%g1
	casa	[%g1]0x80,%l7,%l7	! %l7 = 000000000332c9ff
!	%l0 = 0000000000000000, Mem[0000000010181408] = ffff0000ff000000
	stxa	%l0,[%i6+%o4]0x88	! Mem[0000000010181408] = 0000000000000000
!	Mem[0000000020800040] = ff00226c, %l1 = c1bd6468b10000ff
	ldstub	[%o1+0x040],%l1		! %l1 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = ebb6ffff, %f10 = ffffff7f
	lda	[%i0+%g0]0x88,%f10	! %f10 = ebb6ffff

p0_label_233:
!	Mem[0000000010001408] = 83afffff, %l6 = 000000006864bdc1
	ldswa	[%i0+%o4]0x88,%l6	! %l6 = ffffffff83afffff
!	Mem[0000000010101410] = 000000ff, %f27 = 66c937ff
	lda	[%i4+%o5]0x88,%f27	! %f27 = 000000ff
!	Mem[00000000300c1410] = 1a000000, %l4 = 00000000ff000000
	ldswa	[%i3+%o5]0x89,%l4	! %l4 = 000000001a000000
!	Mem[00000000300c1408] = ffc93203, %l7 = 000000000332c9ff
	ldswa	[%i3+%o4]0x81,%l7	! %l7 = ffffffffffc93203
!	Mem[0000000010141400] = ffffffaf 0332c9ff 83000000 00000000
!	Mem[0000000010141410] = ff000000 0000003e ffffadff ffffaf83
!	Mem[0000000010141420] = ffffff7f 000000ff ffffff7f 4f97ffff
!	Mem[0000000010141430] = 00000000 00000000 ff7f0000 006d0000
	ldda	[%i5]ASI_BLK_P,%f0	! Block Load from 0000000010141400
!	Mem[0000000010001420] = e0002802, %l5 = ffffffffffff8300
	lduh	[%i0+0x020],%l5		! %l5 = 000000000000e000
!	Mem[0000000010181408] = 00000000 00000000, %l2 = 000000ff, %l3 = 000000ff
	ldda	[%i6+0x008]%asi,%l2	! %l2 = 0000000000000000 0000000000000000
!	Mem[0000000010141418] = ffffadffffffaf83, %f24 = ffff974f 7fffffff
	ldd	[%i5+0x018],%f24	! %f24 = ffffadff ffffaf83
!	Mem[0000000010141410] = 000000ff, %l0 = 0000000000000000
	ldsba	[%i5+%o5]0x88,%l0	! %l0 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l2 = 0000000000000000, imm = fffffffffffff899, %l4 = 000000001a000000
	xnor	%l2,-0x767,%l4		! %l4 = 0000000000000766

p0_label_234:
!	Mem[00000000300c1408] = ffc93203, %l6 = ffffffff83afffff
	ldstuba	[%i3+%o4]0x81,%l6	! %l6 = 000000ff000000ff
!	%f0  = ffffffaf 0332c9ff 83000000 00000000
!	%f4  = ff000000 0000003e ffffadff ffffaf83
!	%f8  = ffffff7f 000000ff ffffff7f 4f97ffff
!	%f12 = 00000000 00000000 ff7f0000 006d0000
	stda	%f0,[%i3]ASI_BLK_AIUS	! Block Store to 00000000300c1400
!	%f28 = ff000000 00ff0000, %l1 = 00000000000000ff
!	Mem[0000000010041420] = e00028028be483af
	add	%i1,0x020,%g1
	stda	%f28,[%g1+%l1]ASI_PST16_P ! Mem[0000000010041420] = ff00000000ff0000
!	Mem[0000000030081410] = 00000000, %l7 = ffffffffffc93203
	ldstuba	[%i2+%o5]0x89,%l7	! %l7 = 00000000000000ff
!	%l7 = 0000000000000000, Mem[0000000030141400] = ff000000
	stwa	%l7,[%i5+%g0]0x81	! Mem[0000000030141400] = 00000000
!	Mem[0000000010101413] = ff000000, %l3 = 0000000000000000
	ldstub	[%i4+0x013],%l3		! %l3 = 00000000000000ff
	membar	#Sync			! Added by membar checker (37)
!	Mem[00000000100c1400] = 30fb0000, %l5 = 000000000000e000
	ldstuba	[%i3+%g0]0x88,%l5	! %l5 = 00000000000000ff
!	%f18 = ff000000, %f22 = ffff0000 034f37e1
	fstox	%f18,%f22		! %f22 = 80000000 00000000
!	Code Fragment 3
p0_fragment_21:
!	%l0 = ffffffffffffffff
	setx	0x19456d4058f8c72b,%g7,%l0 ! %l0 = 19456d4058f8c72b
!	%l1 = 00000000000000ff
	setx	0xa5a9767fec186b0e,%g7,%l1 ! %l1 = a5a9767fec186b0e
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 19456d4058f8c72b
	setx	0x704a8667d0b5105a,%g7,%l0 ! %l0 = 704a8667d0b5105a
!	%l1 = a5a9767fec186b0e
	setx	0x9dd9d06fef17d759,%g7,%l1 ! %l1 = 9dd9d06fef17d759
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1418] = cf030000, %l0 = 704a8667d0b5105a
	ldswa	[%i3+0x018]%asi,%l0	! %l0 = ffffffffcf030000

p0_label_235:
!	Mem[00000000300c1410] = 3e000000 000000ff, %l2 = 00000000, %l3 = 00000000
	ldda	[%i3+%o5]0x89,%l2	! %l2 = 00000000000000ff 000000003e000000
!	Mem[0000000010101410] = ff0000ff, %f21 = 000020ff
	lda	[%i4+%o5]0x80,%f21	! %f21 = ff0000ff
!	Mem[0000000030081400] = ff372583 8d1e3315 ff000000 00000000
!	Mem[0000000030081410] = ff000000 66c937ff ccc989c0 c971ce8e
!	Mem[0000000030081420] = 491588d6 947903e2 ff400007 db995109
!	Mem[0000000030081430] = 3a9fb502 0c281024 b82a2f11 4f979be2
	ldda	[%i2]ASI_BLK_AIUSL,%f0	! Block Load from 0000000030081400
!	Mem[0000000010001408] = ffffaf830000004f, %l0 = ffffffffcf030000
	ldx	[%i0+%o4],%l0		! %l0 = ffffaf830000004f
!	Mem[00000000218001c0] = 1afff4cf, %l4 = 0000000000000766
	lduh	[%o3+0x1c0],%l4		! %l4 = 0000000000001aff
!	Mem[0000000010041408] = 00000000ffffff00, %f30 = 66c937ff 1affb91c
	ldda	[%i1+%o4]0x80,%f30	! %f30 = 00000000 ffffff00
!	Mem[0000000010181410] = ff005d66, %f19 = 0000c9ff
	ld	[%i6+%o5],%f19	! %f19 = ff005d66
!	Mem[00000000100c1400] = ff00fb30, %l7 = 0000000000000000
	ldsba	[%i3+%g0]0x80,%l7	! %l7 = ffffffffffffffff
!	%f24 = ffffadff, %f26 = 00ff0000
	fsqrts	%f24,%f26		! %f26 = ffffadff
!	Starting 10 instruction Store Burst
!	Mem[0000000030041400] = ffffffff, %l5 = 0000000000000000
	swapa	[%i1+%g0]0x89,%l5	! %l5 = 00000000ffffffff

p0_label_236:
!	%l0 = ffffaf830000004f, Mem[0000000030141408] = ff000000ffff8300
	stxa	%l0,[%i5+%o4]0x81	! Mem[0000000030141408] = ffffaf830000004f
!	Mem[0000000010181400] = 00000000, %l4 = 0000000000001aff
	ldstuba	[%i6+%g0]0x88,%l4	! %l4 = 00000000000000ff
!	%l4 = 0000000000000000, Mem[0000000030101410] = b10000ff
	stba	%l4,[%i4+%o5]0x89	! Mem[0000000030101410] = b1000000
!	Mem[00000000100c1410] = ff000000, %l4 = 0000000000000000
	ldstuba	[%i3+%o5]0x80,%l4	! %l4 = 000000ff000000ff
!	%l1 = 9dd9d06fef17d759, Mem[00000000211c0000] = ff00980d
	stb	%l1,[%o2+%g0]		! Mem[00000000211c0000] = 5900980d
!	Mem[0000000010041410] = 00000083, %l6 = 00000000000000ff
	swapa	[%i1+%o5]0x88,%l6	! %l6 = 0000000000000083
!	%f18 = ff000000, Mem[000000001000140c] = 0000004f
	sta	%f18,[%i0+0x00c]%asi	! Mem[000000001000140c] = ff000000
!	Mem[0000000010001410] = ff000000, %l6 = 0000000000000083
	ldstuba	[%i0+%o5]0x80,%l6	! %l6 = 000000ff000000ff
!	Code Fragment 4
p0_fragment_22:
!	%l0 = ffffaf830000004f
	setx	0xeb56901fc623fd17,%g7,%l0 ! %l0 = eb56901fc623fd17
!	%l1 = 9dd9d06fef17d759
	setx	0x659a51d78d7b2c18,%g7,%l1 ! %l1 = 659a51d78d7b2c18
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = eb56901fc623fd17
	setx	0x677bda202daea3ff,%g7,%l0 ! %l0 = 677bda202daea3ff
!	%l1 = 659a51d78d7b2c18
	setx	0xc24979affd1a8dfb,%g7,%l1 ! %l1 = c24979affd1a8dfb
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = 00000000, %l4 = 00000000000000ff
	ldswa	[%i0+%o5]0x81,%l4	! %l4 = 0000000000000000

p0_label_237:
!	Mem[0000000010101400] = 0000ff00, %l2 = 00000000000000ff
	lduwa	[%i4+%g0]0x88,%l2	! %l2 = 000000000000ff00
!	Mem[00000000300c1410] = 000000ff, %l7 = ffffffffffffffff
	ldsha	[%i3+%o5]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030141408] = 83afffff, %l7 = 00000000000000ff
	lduba	[%i5+%o4]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[00000000300c1408] = 00000083, %f19 = ff005d66
	lda	[%i3+%o4]0x89,%f19	! %f19 = 00000083
!	Mem[0000000030001410] = 0000000000000000, %l6 = 00000000000000ff
	ldxa	[%i0+%o5]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000010181410] = 665d00ff, %l4 = 0000000000000000
	ldsha	[%i6+%o5]0x88,%l4	! %l4 = 00000000000000ff
!	%f7  = c089c9cc, %f23 = 00000000, %f5  = 000000ff
	fadds	%f7 ,%f23,%f5 		! %f5  = c089c9cc
!	Mem[0000000010181400] = 000000ff, %f7  = c089c9cc
	lda	[%i6+%g0]0x88,%f7 	! %f7 = 000000ff
!	Mem[0000000010181408] = 00000000, %l3 = 000000003e000000
	lduwa	[%i6+%o4]0x80,%l3	! %l3 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010181408] = 00000000, %l3 = 0000000000000000
	ldstub	[%i6+%o4],%l3		! %l3 = 00000000000000ff

p0_label_238:
!	Mem[0000000010001400] = ebb6ffff, %l0 = 677bda202daea3ff
	swapa	[%i0+%g0]0x88,%l0	! %l0 = 00000000ebb6ffff
!	%f28 = ff000000 00ff0000, %l4 = 00000000000000ff
!	Mem[0000000030141410] = ff000000ffff8300
	add	%i5,0x010,%g1
	stda	%f28,[%g1+%l4]ASI_PST32_S ! Mem[0000000030141410] = ff00000000ff0000
!	%l1 = c24979affd1a8dfb, Mem[0000000010141400] = ffffffaf0332c9ff
	stxa	%l1,[%i5+%g0]0x80	! Mem[0000000010141400] = c24979affd1a8dfb
!	%f6  = 8ece71c9 000000ff, Mem[00000000300c1408] = 00000083 00000000
	stda	%f6 ,[%i3+%o4]0x89	! Mem[00000000300c1408] = 8ece71c9 000000ff
!	%f10 = 095199db 070040ff, Mem[00000000300c1410] = ff000000 0000003e
	stda	%f10,[%i3+%o5]0x81	! Mem[00000000300c1410] = 095199db 070040ff
!	%l1 = c24979affd1a8dfb, Mem[0000000030181410] = 00000000
	stba	%l1,[%i6+%o5]0x89	! Mem[0000000030181410] = 000000fb
!	Mem[0000000010181408] = ff000000, %l0 = 00000000ebb6ffff
	swapa	[%i6+%o4]0x80,%l0	! %l0 = 00000000ff000000
!	Mem[0000000030041400] = 00000000, %l1 = c24979affd1a8dfb
	swapa	[%i1+%g0]0x81,%l1	! %l1 = 0000000000000000
!	%l3 = 0000000000000000, Mem[0000000010141410] = ff000000
	stha	%l3,[%i5+%o5]0x80	! Mem[0000000010141410] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = 00000000, %l3 = 0000000000000000
	lduba	[%i0+%o5]0x81,%l3	! %l3 = 0000000000000000

p0_label_239:
!	Mem[000000001000140c] = ff000000, %l5 = 00000000ffffffff
	ldsha	[%i0+0x00c]%asi,%l5	! %l5 = ffffffffffffff00
!	Mem[0000000010181420] = ffb3b676, %l4 = 00000000000000ff
	ldsb	[%i6+0x021],%l4		! %l4 = ffffffffffffffb3
!	%f13 = 02b59f3a, %f25 = ffffaf83, %f14 = e29b974f
	fmuls	%f13,%f25,%f14		! %f14 = ffffaf83
!	Mem[0000000010181410] = 0000ff00665d00ff, %f2  = 00000000 000000ff
	ldda	[%i6+%o5]0x88,%f2 	! %f2  = 0000ff00 665d00ff
!	Mem[0000000010041428] = ff37c9667fffffff, %l1 = 0000000000000000
	ldxa	[%i1+0x028]%asi,%l1	! %l1 = ff37c9667fffffff
!	Mem[0000000010181400] = ff000000, %l0 = 00000000ff000000
	lduba	[%i6+%g0]0x80,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010001408] = ffffaf83, %l3 = 0000000000000000
	ldsha	[%i0+%o4]0x80,%l3	! %l3 = ffffffffffffffff
!	Mem[00000000300c1400] = ffc93203afffffff, %f4  = ff37c966 c089c9cc
	ldda	[%i3+%g0]0x89,%f4 	! %f4  = ffc93203 afffffff
!	Mem[0000000030041400] = fd1a8dfb, %l2 = 000000000000ff00
	lduwa	[%i1+%g0]0x81,%l2	! %l2 = 00000000fd1a8dfb
!	Starting 10 instruction Store Burst
!	Mem[0000000010181430] = 4049c35800000000, %l5 = ffffffffffffff00, %l4 = ffffffffffffffb3
	add	%i6,0x30,%g1
	casxa	[%g1]0x80,%l5,%l4	! %l4 = 4049c35800000000

p0_label_240:
!	%l3 = ffffffffffffffff, Mem[0000000030041400] = fb8d1afd
	stba	%l3,[%i1+%g0]0x89	! Mem[0000000030041400] = fb8d1aff
!	Mem[00000000100c1408] = ffc93203, %l3 = ffffffffffffffff
	ldstuba	[%i3+%o4]0x80,%l3	! %l3 = 000000ff000000ff
!	%l2 = 00000000fd1a8dfb, Mem[00000000300c1410] = 095199db
	stba	%l2,[%i3+%o5]0x81	! Mem[00000000300c1410] = fb5199db
!	Mem[0000000010041410] = 000000ff, %l6 = 0000000000000000
	ldstuba	[%i1+%o5]0x88,%l6	! %l6 = 000000ff000000ff
!	Mem[0000000010001408] = 83afffff, %l5 = ffffffffffffff00
	ldstuba	[%i0+%o4]0x88,%l5	! %l5 = 000000ff000000ff
!	Mem[0000000030101408] = 0000c9ff, %l3 = 00000000000000ff
	ldstuba	[%i4+%o4]0x89,%l3	! %l3 = 000000ff000000ff
!	%l7 = 00000000000000ff, %l7 = 00000000000000ff, %l3 = 00000000000000ff
	andn	%l7,%l7,%l3		! %l3 = 0000000000000000
	membar	#Sync			! Added by membar checker (38)
!	%f10 = 095199db 070040ff, %l3 = 0000000000000000
!	Mem[0000000030081430] = 3a9fb5020c281024
	add	%i2,0x030,%g1
	stda	%f10,[%g1+%l3]ASI_PST8_SL ! Mem[0000000030081430] = 3a9fb5020c281024
!	%l6 = 00000000000000ff, Mem[00000000100c1408] = ffc93203
	stha	%l6,[%i3+%o4]0x80	! Mem[00000000100c1408] = 00ff3203
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = 4920665d, %l6 = 00000000000000ff
	lduba	[%i2+%o5]0x80,%l6	! %l6 = 0000000000000049

p0_label_241:
!	Mem[00000000100c1400] = 30fb00ff, %f24 = ffffadff
	lda	[%i3+%g0]0x88,%f24	! %f24 = 30fb00ff
!	Mem[00000000300c1400] = ffc93203afffffff, %f30 = 00000000 ffffff00
	ldda	[%i3+%g0]0x89,%f30	! %f30 = ffc93203 afffffff
!	%l4 = 4049c35800000000, immed = fffff3da, %y  = ffffffff
	umul	%l4,-0xc26,%l3		! %l3 = 0000000000000000, %y = 00000000
!	Mem[0000000010101408] = ff00fb30, %l5 = 00000000000000ff
	ldsba	[%i4+%o4]0x80,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000030101400] = 83afffff 00000000 ffc90000 0c281024
!	Mem[0000000030101410] = 000000b1 6864bdc1 ff000000 49206600
!	Mem[0000000030101420] = ffffffff 2eb6e519 7fffffff 00000000
!	Mem[0000000030101430] = 7271fd80 ffdbe53e 2fffffff 00000000
	ldda	[%i4]ASI_BLK_SL,%f0	! Block Load from 0000000030101400
!	Mem[0000000010181410] = ff005d66, %l1 = ff37c9667fffffff
	lduha	[%i6+%o5]0x80,%l1	! %l1 = 000000000000ff00
!	%l5 = ffffffffffffffff, %l5 = ffffffffffffffff, %l2 = 00000000fd1a8dfb
	andn	%l5,%l5,%l2		! %l2 = 0000000000000000
!	%l4 = 4049c35800000000, imm = fffffffffffffdf9, %l0 = 00000000000000ff
	sub	%l4,-0x207,%l0		! %l0 = 4049c35800000207
!	Mem[0000000010181400] = ff000000, %l1 = 000000000000ff00
	lduba	[%i6+%g0]0x80,%l1	! %l1 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000010141414] = 0000003e, %l7 = 00000000000000ff
	swap	[%i5+0x014],%l7		! %l7 = 000000000000003e

p0_label_242:
!	Mem[0000000030181408] = 00eb004f, %l3 = 0000000000000000
	ldstuba	[%i6+%o4]0x81,%l3	! %l3 = 00000000000000ff
!	%l4 = 4049c35800000000, Mem[0000000030001410] = 00000000
	stwa	%l4,[%i0+%o5]0x81	! Mem[0000000030001410] = 00000000
!	Mem[0000000010041418] = 66c93792034f37e1, %l6 = 0000000000000049, %l2 = 0000000000000000
	add	%i1,0x18,%g1
	casxa	[%g1]0x80,%l6,%l2	! %l2 = 66c93792034f37e1
!	%l0 = 4049c35800000207, Mem[0000000030041400] = fb8d1aff
	stba	%l0,[%i1+%g0]0x89	! Mem[0000000030041400] = fb8d1a07
!	%f22 = 80000000 00000000, %l3 = 0000000000000000
!	Mem[0000000030041408] = 83afffff000003cf
	add	%i1,0x008,%g1
	stda	%f22,[%g1+%l3]ASI_PST16_S ! Mem[0000000030041408] = 83afffff000003cf
!	%l4 = 4049c35800000000, Mem[00000000300c1408] = 000000ff
	stba	%l4,[%i3+%o4]0x89	! Mem[00000000300c1408] = 00000000
!	%l6 = 00000049, %l7 = 0000003e, Mem[00000000100c1410] = 000000ff 0018b91c
	stda	%l6,[%i3+%o5]0x88	! Mem[00000000100c1410] = 00000049 0000003e
!	Mem[0000000030101400] = 83afffff, %l6 = 0000000000000049
	swapa	[%i4+%g0]0x81,%l6	! %l6 = 0000000083afffff
!	Mem[0000000010081400] = ff0000b1, %l5 = ffffffffffffffff
	swapa	[%i2+%g0]0x80,%l5	! %l5 = 00000000ff0000b1
!	Starting 10 instruction Load Burst
!	%f23 = 00000000, %f24 = 30fb00ff, %f26 = ffffadff
	fmuls	%f23,%f24,%f26		! %f26 = 00000000

p0_label_243:
!	Mem[0000000010101400] = 00ff0000, %l4 = 4049c35800000000
	ldsba	[%i4+0x000]%asi,%l4	! %l4 = 0000000000000000
!	Mem[0000000030041400] = 071a8dfb, %l4 = 0000000000000000
	lduwa	[%i1+%g0]0x81,%l4	! %l4 = 00000000071a8dfb
!	Mem[0000000030001400] = af83e48b022800ff, %l3 = 0000000000000000
	ldxa	[%i0+%g0]0x89,%l3	! %l3 = af83e48b022800ff
!	Mem[0000000030081410] = 000000ff, %l2 = 66c93792034f37e1
	lduba	[%i2+%o5]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030041410] = 5d662049, %l6 = 0000000083afffff
	lduwa	[%i1+%o5]0x81,%l6	! %l6 = 000000005d662049
!	Mem[00000000100c1410] = 49000000, %l1 = 00000000000000ff
	ldsba	[%i3+%o5]0x80,%l1	! %l1 = 0000000000000049
!	Mem[0000000010081408] = e4000000 b3003dff, %l0 = 00000207, %l1 = 00000049
	ldda	[%i2+0x008]%asi,%l0	! %l0 = 00000000e4000000 00000000b3003dff
!	Mem[0000000030141410] = ff000000, %l3 = af83e48b022800ff
	lduwa	[%i5+%o5]0x81,%l3	! %l3 = 00000000ff000000
!	Mem[0000000010101400] = 00ff0000 66c937ff, %l6 = 5d662049, %l7 = 0000003e
	ldda	[%i4+%g0]0x80,%l6	! %l6 = 0000000000ff0000 0000000066c937ff
!	Starting 10 instruction Store Burst
!	%f16 = ffffff7f 00000000 ff000000 00000083
!	%f20 = 00000000 ff0000ff 80000000 00000000
!	%f24 = 30fb00ff ffffaf83 00000000 000000ff
!	%f28 = ff000000 00ff0000 ffc93203 afffffff
	stda	%f16,[%i1]ASI_BLK_AIUPL	! Block Store to 0000000010041400

p0_label_244:
!	%l1 = 00000000b3003dff, Mem[0000000030141408] = 83afffff
	stha	%l1,[%i5+%o4]0x89	! Mem[0000000030141408] = 83af3dff
!	%f8  = 19e5b62e ffffffff, Mem[0000000010141410] = 00000000 000000ff
	std	%f8 ,[%i5+%o5]	! Mem[0000000010141410] = 19e5b62e ffffffff
!	Mem[0000000010101408] = ff00fb30, %l3 = 00000000ff000000
	ldstuba	[%i4+%o4]0x80,%l3	! %l3 = 000000ff000000ff
!	%l4 = 071a8dfb, %l5 = ff0000b1, Mem[0000000010101410] = ff0000ff 00000000
	stda	%l4,[%i4+%o5]0x80	! Mem[0000000010101410] = 071a8dfb ff0000b1
!	%l2 = 00000000000000ff, Mem[0000000010001438] = 000000ff, %asi = 80
	stha	%l2,[%i0+0x038]%asi	! Mem[0000000010001438] = 00ff00ff
!	%f0  = 00000000 ffffaf83 2410280c 0000c9ff
!	%f4  = c1bd6468 b1000000 00662049 000000ff
!	%f8  = 19e5b62e ffffffff 00000000 ffffff7f
!	%f12 = 3ee5dbff 80fd7172 00000000 ffffff2f
	stda	%f0,[%i2]ASI_BLK_PL	! Block Store to 0000000010081400
	membar	#Sync			! Added by membar checker (39)
!	Mem[0000000010041420] = 83afffff, %l1 = 00000000b3003dff
	ldsb	[%i1+0x023],%l1		! %l1 = ffffffffffffffff
!	%f14 = 00000000 ffffff2f, Mem[0000000010101400] = 00ff0000 66c937ff
	stda	%f14,[%i4+%g0]0x80	! Mem[0000000010101400] = 00000000 ffffff2f
!	Mem[0000000030001408] = ff000000, %l4 = 00000000071a8dfb
	swapa	[%i0+%o4]0x81,%l4	! %l4 = 00000000ff000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = 83afffff, %l1 = ffffffffffffffff
	ldsba	[%i2+%g0]0x80,%l1	! %l1 = ffffffffffffff83

p0_label_245:
!	Mem[00000000201c0000] = 4f9719af, %l1 = ffffffffffffff83
	ldsb	[%o0+%g0],%l1		! %l1 = 000000000000004f
!	Mem[0000000030001410] = 00000000, %l4 = 00000000ff000000
	ldswa	[%i0+%o5]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000030181400] = 0000bdc1, %l4 = 0000000000000000
	ldsha	[%i6+%g0]0x89,%l4	! %l4 = ffffffffffffbdc1
!	Mem[0000000030101408] = ffc90000, %l6 = 0000000000ff0000
	ldsba	[%i4+%o4]0x81,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000030041408] = cf030000 ffffaf83, %l2 = 000000ff, %l3 = 000000ff
	ldda	[%i1+%o4]0x89,%l2	! %l2 = 00000000ffffaf83 00000000cf030000
!	Mem[0000000010001410] = ff000000, %l4 = ffffffffffffbdc1
	lduba	[%i0+%o5]0x80,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010141434] = 00000000, %l4 = 00000000000000ff
	ldsba	[%i5+0x034]%asi,%l4	! %l4 = 0000000000000000
!	Mem[0000000010001400] = 2daea3ff, %l5 = 00000000ff0000b1
	ldsha	[%i0+%g0]0x88,%l5	! %l5 = ffffffffffffa3ff
!	%f13 = 80fd7172, %f27 = 000000ff, %f6  = 00662049
	fsubs	%f13,%f27,%f6 		! %l0 = 00000000e4000022, Unfinished, %fsr = 1600000800
!	Starting 10 instruction Store Burst
!	%l0 = 00000000e4000022, Mem[0000000010141439] = ff7f0000, %asi = 80
	stba	%l0,[%i5+0x039]%asi	! Mem[0000000010141438] = ff220000

p0_label_246:
!	Mem[0000000030181400] = c1bd0000, %l7 = 0000000066c937ff
	swapa	[%i6+%g0]0x81,%l7	! %l7 = 00000000c1bd0000
!	%l5 = ffffffffffffa3ff, Mem[0000000030001408] = fb8d1a07
	stba	%l5,[%i0+%o4]0x89	! Mem[0000000030001408] = fb8d1aff
!	%f16 = ffffff7f, Mem[0000000010141400] = c24979af
	sta	%f16,[%i5+%g0]0x80	! Mem[0000000010141400] = ffffff7f
!	%l4 = 0000000000000000, Mem[0000000030001408] = ff1a8dfb
	stwa	%l4,[%i0+%o4]0x81	! Mem[0000000030001408] = 00000000
!	Mem[000000001010142e] = ffffffff, %l5 = ffffffffffffa3ff
	ldstuba	[%i4+0x02e]%asi,%l5	! %l5 = 000000ff000000ff
!	%f16 = ffffff7f 00000000 ff000000 00000083
!	%f20 = 00000000 ff0000ff 80000000 00000000
!	%f24 = 30fb00ff ffffaf83 00000000 000000ff
!	%f28 = ff000000 00ff0000 ffc93203 afffffff
	stda	%f16,[%i4]ASI_BLK_AIUS	! Block Store to 0000000030101400
!	%l5 = 00000000000000ff, Mem[00000000300c1400] = ffffffaf0332c9ff
	stxa	%l5,[%i3+%g0]0x81	! Mem[00000000300c1400] = 00000000000000ff
!	%l1 = 000000000000004f, Mem[0000000010181410] = 0000ff00665d00ff
	stxa	%l1,[%i6+%o5]0x88	! Mem[0000000010181410] = 000000000000004f
!	%f4  = c1bd6468 b1000000, Mem[0000000030041408] = ffffaf83 cf030000
	stda	%f4 ,[%i1+%o4]0x89	! Mem[0000000030041408] = c1bd6468 b1000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010141438] = ff220000006d0000, %f2  = 2410280c 0000c9ff
	ldd	[%i5+0x038],%f2 	! %f2  = ff220000 006d0000

p0_label_247:
!	Mem[00000000211c0000] = 5900980d, %l3 = 00000000cf030000
	ldsba	[%o2+0x001]%asi,%l3	! %l3 = 0000000000000000
!	Mem[0000000020800040] = ff00226c, %l5 = 00000000000000ff
	ldsh	[%o1+0x040],%l5		! %l5 = ffffffffffffff00
	membar	#Sync			! Added by membar checker (40)
!	Mem[0000000030101408] = 000000ff, %l0 = 00000000e4000022
	ldsha	[%i4+%o4]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[0000000021800040] = ff834385, %l7 = 00000000c1bd0000
	lduh	[%o3+0x040],%l7		! %l7 = 000000000000ff83
!	Mem[0000000010081408] = ffc900000c281024, %l6 = ffffffffffffffff
	ldxa	[%i2+%o4]0x80,%l6	! %l6 = ffc900000c281024
!	Mem[0000000010101410] = b10000fffb8d1a07, %l1 = 000000000000004f
	ldxa	[%i4+%o5]0x88,%l1	! %l1 = b10000fffb8d1a07
!	Mem[0000000010101408] = ff00fb30034f37e1, %f16 = ffffff7f 00000000
	ldda	[%i4+%o4]0x80,%f16	! %f16 = ff00fb30 034f37e1
!	Mem[0000000010041408] = 00000083, %l3 = 0000000000000000
	lduha	[%i1+%o4]0x88,%l3	! %l3 = 0000000000000083
!	%l4 = 0000000000000000, immed = ffffffcc, %y  = 00000000
	umul	%l4,-0x034,%l1		! %l1 = 0000000000000000, %y = 00000000
!	Starting 10 instruction Store Burst
!	%f24 = 30fb00ff ffffaf83, %l7 = 000000000000ff83
!	Mem[0000000030001428] = 00000008ff000000
	add	%i0,0x028,%g1
	stda	%f24,[%g1+%l7]ASI_PST16_S ! Mem[0000000030001428] = 00000008ffffaf83

p0_label_248:
!	%f30 = ffc93203 afffffff, Mem[0000000030101408] = ff000000 00000083
	stda	%f30,[%i4+%o4]0x81	! Mem[0000000030101408] = ffc93203 afffffff
!	%l2 = 00000000ffffaf83, Mem[0000000010141400] = ffffff7ffd1a8dfb
	stxa	%l2,[%i5+%g0]0x80	! Mem[0000000010141400] = 00000000ffffaf83
!	%f16 = ff00fb30 034f37e1 ff000000 00000083
!	%f20 = 00000000 ff0000ff 80000000 00000000
!	%f24 = 30fb00ff ffffaf83 00000000 000000ff
!	%f28 = ff000000 00ff0000 ffc93203 afffffff
	stda	%f16,[%i0]ASI_BLK_AIUP	! Block Store to 0000000010001400
!	%f4  = c1bd6468 b1000000, %l7 = 000000000000ff83
!	Mem[0000000010001430] = ff00000000ff0000
	add	%i0,0x030,%g1
	stda	%f4,[%g1+%l7]ASI_PST16_PL ! Mem[0000000010001430] = 000000b100ff0000
!	%l0 = 000000ff, %l1 = 00000000, Mem[0000000010101408] = ff00fb30 034f37e1
	stda	%l0,[%i4+%o4]0x80	! Mem[0000000010101408] = 000000ff 00000000
!	Mem[00000000300c1400] = 00000000, %l3 = 0000000000000083
	ldstuba	[%i3+%g0]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[00000000211c0001] = 5900980d, %l5 = ffffffffffffff00
	ldstuba	[%o2+0x001]%asi,%l5	! %l5 = 00000000000000ff
!	%l4 = 00000000, %l5 = 00000000, Mem[00000000300c1410] = db9951fb ff400007
	stda	%l4,[%i3+%o5]0x89	! Mem[00000000300c1410] = 00000000 00000000
!	Mem[0000000010141404] = ffffaf83, %l2 = 00000000ffffaf83
	swap	[%i5+0x004],%l2		! %l2 = 00000000ffffaf83
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = 000000b16864bdc1, %l7 = 000000000000ff83
	ldxa	[%i1+%o4]0x81,%l7	! %l7 = 000000b16864bdc1

p0_label_249:
!	Mem[0000000010101408] = 000000ff00000000, %l1 = 0000000000000000
	ldx	[%i4+%o4],%l1		! %l1 = 000000ff00000000
!	Mem[0000000010101400] = 00000000ffffff2f, %l5 = 0000000000000000
	ldxa	[%i4+%g0]0x80,%l5	! %l5 = 00000000ffffff2f
!	%l1 = 000000ff00000000, %l3 = 0000000000000000, %l1 = 000000ff00000000
	sub	%l1,%l3,%l1		! %l1 = 000000ff00000000
!	Mem[0000000010141400] = 00000000, %l1 = 000000ff00000000
	ldsha	[%i5+%g0]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000030141408] = 83af3dff, %l3 = 0000000000000000
	ldsha	[%i5+%o4]0x89,%l3	! %l3 = 0000000000003dff
!	Mem[0000000010081408] = ffc90000, %l3 = 0000000000003dff
	ldsw	[%i2+%o4],%l3		! %l3 = ffffffffffc90000
!	Mem[000000001014140c] = 00000000, %l4 = 0000000000000000
	lduwa	[%i5+0x00c]%asi,%l4	! %l4 = 0000000000000000
!	%l3 = ffffffffffc90000, Mem[0000000030181408] = ffeb004f
	stwa	%l3,[%i6+%o4]0x81	! Mem[0000000030181408] = ffc90000
!	Mem[0000000021800000] = 1cb7dd30, %l2 = 00000000ffffaf83
	ldsb	[%o3+0x001],%l2		! %l2 = ffffffffffffffb7
!	Starting 10 instruction Store Burst
!	%l2 = ffffffffffffffb7, Mem[0000000010101408] = 000000ff
	stba	%l2,[%i4+%o4]0x80	! Mem[0000000010101408] = b70000ff

p0_label_250:
!	%l0 = 000000ff, %l1 = 00000000, Mem[00000000100c1400] = ff00fb30 034f37e1
	stda	%l0,[%i3+%g0]0x80	! Mem[00000000100c1400] = 000000ff 00000000
!	%l5 = 00000000ffffff2f, immed = 00000974, %y  = 00000000
	smul	%l5,0x974,%l3		! %l3 = fffffffffff8484c, %y = ffffffff
!	Mem[0000000010141408] = 00000083, %l6 = ffc900000c281024
	ldstuba	[%i5+%o4]0x88,%l6	! %l6 = 00000083000000ff
!	Mem[0000000010101400] = 00000000, %l6 = 0000000000000083
	ldstuba	[%i4+%g0]0x80,%l6	! %l6 = 00000000000000ff
!	%f1  = ffffaf83, Mem[0000000030041408] = 000000b1
	sta	%f1 ,[%i1+%o4]0x81	! Mem[0000000030041408] = ffffaf83
!	%l6 = 0000000000000000, Mem[0000000010101410] = 071a8dfb
	stha	%l6,[%i4+%o5]0x80	! Mem[0000000010101410] = 00008dfb
!	%l6 = 00000000, %l7 = 6864bdc1, Mem[0000000010141410] = 19e5b62e ffffffff
	stda	%l6,[%i5+%o5]0x80	! Mem[0000000010141410] = 00000000 6864bdc1
!	%l6 = 0000000000000000, Mem[0000000010141410] = c1bd646800000000
	stxa	%l6,[%i5+%o5]0x88	! Mem[0000000010141410] = 0000000000000000
!	%l6 = 0000000000000000, Mem[0000000010001410] = 00000000
	stwa	%l6,[%i0+%o5]0x80	! Mem[0000000010001410] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010101418] = ffffadff, %l0 = 00000000000000ff
	lduwa	[%i4+0x018]%asi,%l0	! %l0 = 00000000ffffadff

p0_label_251:
!	Mem[0000000010101408] = b70000ff, %l7 = 000000b16864bdc1
	lduwa	[%i4+%o4]0x80,%l7	! %l7 = 00000000b70000ff
	membar	#Sync			! Added by membar checker (41)
!	Mem[0000000030101400] = ffffff7f 00000000 ffc93203 afffffff
!	Mem[0000000030101410] = 00000000 ff0000ff 80000000 00000000
!	Mem[0000000030101420] = 30fb00ff ffffaf83 00000000 000000ff
!	Mem[0000000030101430] = ff000000 00ff0000 ffc93203 afffffff
	ldda	[%i4]ASI_BLK_AIUS,%f0	! Block Load from 0000000030101400
!	Mem[0000000021800180] = 00ffad00, %l3 = fffffffffff8484c
	lduba	[%o3+0x181]%asi,%l3	! %l3 = 00000000000000ff
!	Mem[00000000300c1410] = 0000000000000000, %l7 = 00000000b70000ff
	ldxa	[%i3+%o5]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000010041400] = ffffff7f 00000000, %l4 = 00000000, %l5 = ffffff2f
	ldda	[%i1+%g0]0x88,%l4	! %l4 = 0000000000000000 00000000ffffff7f
!	Mem[00000000100c1408] = 0332ff00, %l2 = ffffffffffffffb7
	lduha	[%i3+%o4]0x88,%l2	! %l2 = 000000000000ff00
!	Mem[0000000010181400] = 000000ff, %l0 = 00000000ffffadff
	ldswa	[%i6+%g0]0x88,%l0	! %l0 = 00000000000000ff
!	%f28 = ff000000, %f30 = ffc93203
	fstoi	%f28,%f30		! %f30 = 80000000
!	Mem[0000000010181410] = 4f000000, %l7 = 0000000000000000
	lduba	[%i6+%o5]0x80,%l7	! %l7 = 000000000000004f
!	Starting 10 instruction Store Burst
!	Mem[00000000211c0001] = 59ff980d, %l4 = 0000000000000000
	ldstub	[%o2+0x001],%l4		! %l4 = 000000ff000000ff

p0_label_252:
!	%f26 = 00000000 000000ff, Mem[0000000010081410] = 000000b1 6864bdc1
	stda	%f26,[%i2+%o5]0x80	! Mem[0000000010081410] = 00000000 000000ff
!	%l6 = 0000000000000000, Mem[0000000010141400] = 00000000
	stha	%l6,[%i5+%g0]0x80	! Mem[0000000010141400] = 00000000
!	%f18 = ff000000 00000083, Mem[0000000010181408] = ebb6ffff 00000000
	stda	%f18,[%i6+%o4]0x80	! Mem[0000000010181408] = ff000000 00000083
!	%l0 = 00000000000000ff, Mem[000000001010142a] = 0000007a, %asi = 80
	stha	%l0,[%i4+0x02a]%asi	! Mem[0000000010101428] = 000000ff
!	%f30 = 80000000 afffffff, %l2 = 000000000000ff00
!	Mem[0000000030041400] = 071a8dfbc8941a45
	stda	%f30,[%i1+%l2]ASI_PST32_SL ! Mem[0000000030041400] = 071a8dfbc8941a45
!	%l3 = 00000000000000ff, Mem[0000000010181400] = ff000000
	sth	%l3,[%i6+%g0]		! Mem[0000000010181400] = 00ff0000
!	Mem[0000000010101418] = ffffadff, %l7 = 000000000000004f, %asi = 80
	swapa	[%i4+0x018]%asi,%l7	! %l7 = 00000000ffffadff
!	%l6 = 0000000000000000, Mem[0000000030181410] = 000000fb
	stwa	%l6,[%i6+%o5]0x89	! Mem[0000000030181410] = 00000000
!	%f16 = ff00fb30 034f37e1 ff000000 00000083
!	%f20 = 00000000 ff0000ff 80000000 00000000
!	%f24 = 30fb00ff ffffaf83 00000000 000000ff
!	%f28 = ff000000 00ff0000 80000000 afffffff
	stda	%f16,[%i6]ASI_COMMIT_S	! Block Store to 0000000030181400
!	Starting 10 instruction Load Burst
!	%l6 = 0000000000000000, %l0 = 00000000000000ff, %y  = ffffffff
	sdiv	%l6,%l0,%l7		! %l7 = fffffffffefefeff
	mov	%l0,%y			! %y = 000000ff

p0_label_253:
!	Mem[0000000030141408] = ff3daf83, %l3 = 00000000000000ff
	ldswa	[%i5+%o4]0x81,%l3	! %l3 = ffffffffff3daf83
!	Mem[0000000010101400] = ff000000, %l4 = 00000000000000ff
	ldsba	[%i4+%g0]0x80,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000030001408] = 00000000, %l7 = fffffffffefefeff
	lduwa	[%i0+%o4]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000010101408] = b70000ff00000000, %f10 = 00000000 000000ff
	ldda	[%i4+%o4]0x80,%f10	! %f10 = b70000ff 00000000
!	Mem[0000000010041410] = ff0000ff, %l7 = 0000000000000000
	ldsha	[%i1+%o5]0x80,%l7	! %l7 = ffffffffffffff00
!	Mem[0000000030001400] = ff002802 8be483af 00000000 00000000
!	Mem[0000000030001410] = 00000000 00000000 ffffe519 c971ce8e
!	Mem[0000000030001420] = 491588d6 4920665d 00000008 ffffaf83
!	Mem[0000000030001430] = 7271fd80 ffdbe53e 3500885f 00000000
	ldda	[%i0]ASI_BLK_S,%f16	! Block Load from 0000000030001400
!	Mem[0000000010041410] = ff0000ff, %l2 = 000000000000ff00
	lduba	[%i1+%o5]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030041408] = c1bd6468 83afffff, %l0 = 000000ff, %l1 = 00000000
	ldda	[%i1+%o4]0x89,%l0	! %l0 = 0000000083afffff 00000000c1bd6468
!	Mem[0000000010141434] = 00000000, %f4  = 00000000
	ld	[%i5+0x034],%f4 	! %f4 = 00000000
!	Starting 10 instruction Store Burst
!	%f8  = 30fb00ff ffffaf83, Mem[0000000010001410] = 00000000 ff0000ff
	std	%f8 ,[%i0+%o5]	! Mem[0000000010001410] = 30fb00ff ffffaf83

p0_label_254:
!	Mem[00000000100c1408] = 00ff3203, %l1 = 00000000c1bd6468
	ldstuba	[%i3+%o4]0x80,%l1	! %l1 = 00000000000000ff
!	%l6 = 00000000, %l7 = ffffff00, Mem[0000000010041408] = 00000083 ff000000
	stda	%l6,[%i1+%o4]0x88	! Mem[0000000010041408] = 00000000 ffffff00
!	%f4  = 00000000 ff0000ff, %l4 = ffffffffffffffff
!	Mem[0000000030081428] = ff400007db995109
	add	%i2,0x028,%g1
	stda	%f4,[%g1+%l4]ASI_PST8_S ! Mem[0000000030081428] = 00000000ff0000ff
	membar	#Sync			! Added by membar checker (42)
!	Mem[0000000010181410] = 4f000000, %l6 = 0000000000000000
	swapa	[%i6+%o5]0x80,%l6	! %l6 = 000000004f000000
!	Mem[0000000010041427] = ff00fb30, %l7 = ffffffffffffff00
	ldstuba	[%i1+0x027]%asi,%l7	! %l7 = 00000030000000ff
!	%l2 = 00000000000000ff, Mem[0000000030101410] = 00000000
	stwa	%l2,[%i4+%o5]0x81	! Mem[0000000030101410] = 000000ff
!	Mem[00000000300c1408] = 00000000, %l5 = 00000000ffffff7f
	swapa	[%i3+%o4]0x89,%l5	! %l5 = 0000000000000000
!	%f20 = 00000000, Mem[0000000010001434] = 00ff0000
	st	%f20,[%i0+0x034]	! Mem[0000000010001434] = 00000000
!	%f26 = 00000008 ffffaf83, %l0 = 0000000083afffff
!	Mem[0000000010081428] = 7fffffff00000000
	add	%i2,0x028,%g1
	stda	%f26,[%g1+%l0]ASI_PST8_P ! Mem[0000000010081428] = 00000008ffffaf83
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = 000000ff, %f21 = 00000000
	lda	[%i5+%o4]0x88,%f21	! %f21 = 000000ff

p0_label_255:
!	Mem[0000000010141400] = 00000000, %l3 = ffffffffff3daf83
	lduba	[%i5+%g0]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000030141410] = ff000000, %l6 = 000000004f000000
	ldsba	[%i5+%o5]0x81,%l6	! %l6 = ffffffffffffffff
!	Mem[00000000211c0000] = 59ff980d, %l6 = ffffffffffffffff
	ldsha	[%o2+0x000]%asi,%l6	! %l6 = 00000000000059ff
!	Mem[0000000030181400] = ff00fb30034f37e1, %f8  = 30fb00ff ffffaf83
	ldda	[%i6+%g0]0x81,%f8 	! %f8  = ff00fb30 034f37e1
!	Mem[0000000010101410] = 00008dfb, %l1 = 0000000000000000
	ldswa	[%i4+%o5]0x80,%l1	! %l1 = 0000000000008dfb
!	Mem[0000000010141430] = 00000000, %l7 = 0000000000000030
	lduwa	[%i5+0x030]%asi,%l7	! %l7 = 0000000000000000
!	Mem[0000000010141400] = 00000000ffffaf83, %l3 = 0000000000000000
	ldxa	[%i5+%g0]0x80,%l3	! %l3 = 00000000ffffaf83
!	Mem[0000000021800080] = 69ffc3e5, %l4 = ffffffffffffffff
	lduba	[%o3+0x081]%asi,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010081408] = ffc90000, %l6 = 00000000000059ff
	lduba	[%i2+%o4]0x80,%l6	! %l6 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%f31 = 00000000, %f23 = c971ce8e, %f26 = 00000008
	fmuls	%f31,%f23,%f26		! %f26 = 80000000

p0_label_256:
!	%l4 = 00000000000000ff, Mem[0000000010041400] = 00000000
	stwa	%l4,[%i1+%g0]0x80	! Mem[0000000010041400] = 000000ff
!	%f18 = 00000000 00000000, %f24 = 491588d6
	fxtos	%f18,%f24		! %f24 = 00000000
!	%l7 = 0000000000000000, Mem[0000000010181400] = 00ff00004f979be2
	stx	%l7,[%i6+%g0]		! Mem[0000000010181400] = 0000000000000000
!	Mem[0000000030081410] = ff000000, %l6 = 00000000000000ff
	ldstuba	[%i2+%o5]0x81,%l6	! %l6 = 000000ff000000ff
!	%l2 = 00000000000000ff, Mem[0000000010101408] = ff0000b7
	stwa	%l2,[%i4+%o4]0x88	! Mem[0000000010101408] = 000000ff
!	Mem[0000000010081400] = 83afffff, %l3 = 00000000ffffaf83
	lduba	[%i2+0x002]%asi,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010041410] = ff0000ff, %l0 = 0000000083afffff
	swapa	[%i1+%o5]0x88,%l0	! %l0 = 00000000ff0000ff
!	%l1 = 0000000000008dfb, Mem[0000000010141400] = 00000000
	stha	%l1,[%i5+%g0]0x88	! Mem[0000000010141400] = 00008dfb
!	%l6 = 00000000000000ff, Mem[0000000010001408] = 000000ff
	stwa	%l6,[%i0+%o4]0x88	! Mem[0000000010001408] = 000000ff
!	Starting 10 instruction Load Burst
!	%l1 = 0000000000008dfb, imm = 00000000000002b7, %l1 = 0000000000008dfb
	xnor	%l1,0x2b7,%l1		! %l1 = ffffffffffff70b3

p0_label_257:
!	%f0  = ffffff7f, %f6  = 80000000, %f20 = 00000000 000000ff
	fsmuld	%f0 ,%f6 ,%f20		! %f20 = ffffffef e0000000
!	Mem[0000000010041410] = 0000000083afffff, %f16 = ff002802 8be483af
	ldda	[%i1+%o5]0x88,%f16	! %f16 = 00000000 83afffff
!	Mem[0000000030181400] = ff00fb30034f37e1, %f6  = 80000000 00000000
	ldda	[%i6+%g0]0x81,%f6 	! %f6  = ff00fb30 034f37e1
!	Mem[00000000100c1400] = 000000ff, %l7 = 0000000000000000
	ldsba	[%i3+%g0]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000030001410] = 00000000, %l7 = 0000000000000000
	ldswa	[%i0+%o5]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000010101404] = ffffff2f, %l0 = 00000000ff0000ff
	lduh	[%i4+0x004],%l0		! %l0 = 000000000000ffff
!	Mem[000000001018143c] = 000000e4, %l6 = 00000000000000ff
	lduwa	[%i6+0x03c]%asi,%l6	! %l6 = 00000000000000e4
!	Mem[0000000010101400] = 000000ff, %f3  = afffffff
	lda	[%i4+%g0]0x88,%f3 	! %f3 = 000000ff
!	Mem[0000000010041410] = ffffaf8300000000, %f0  = ffffff7f 00000000
	ldda	[%i1+%o5]0x80,%f0 	! %f0  = ffffaf83 00000000
!	Starting 10 instruction Store Burst
!	Mem[0000000021800140] = ffff94e3, %l1 = ffffffffffff70b3
	ldstuba	[%o3+0x140]%asi,%l1	! %l1 = 000000ff000000ff

p0_label_258:
!	%l6 = 00000000000000e4, Mem[0000000030141410] = 000000ff
	stha	%l6,[%i5+%o5]0x89	! Mem[0000000030141410] = 000000e4
!	Mem[0000000030081410] = ff000000, %l6 = 00000000000000e4
	swapa	[%i2+%o5]0x81,%l6	! %l6 = 00000000ff000000
!	%f16 = 00000000, Mem[0000000010181400] = 00000000
	sta	%f16,[%i6+%g0]0x80	! Mem[0000000010181400] = 00000000
!	%l4 = 00000000000000ff, Mem[0000000010081410] = 00000000000000ff
	stxa	%l4,[%i2+%o5]0x80	! Mem[0000000010081410] = 00000000000000ff
!	%l1 = 00000000000000ff, %l7 = 0000000000000000, %l3 = 00000000000000ff
	andn	%l1,%l7,%l3		! %l3 = 00000000000000ff
!	Mem[0000000010041428] = ff000000, %l1 = 00000000000000ff, %asi = 80
	swapa	[%i1+0x028]%asi,%l1	! %l1 = 00000000ff000000
!	%f24 = 00000000 4920665d, Mem[0000000030081410] = e4000000 ff37c966
	stda	%f24,[%i2+%o5]0x89	! Mem[0000000030081410] = 00000000 4920665d
!	%l0 = 000000000000ffff, Mem[0000000010141400] = fb8d0000
	stba	%l0,[%i5+%g0]0x80	! Mem[0000000010141400] = ff8d0000
!	Mem[0000000030041400] = fb8d1a07, %l2 = 00000000000000ff
	ldstuba	[%i1+%g0]0x89,%l2	! %l2 = 00000007000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = 00000000000000ff, %l0 = 000000000000ffff
	ldxa	[%i2+%o5]0x80,%l0	! %l0 = 00000000000000ff

p0_label_259:
!	Mem[0000000030101410] = 000000ffff0000ff, %l5 = 0000000000000000
	ldxa	[%i4+%o5]0x81,%l5	! %l5 = 000000ffff0000ff
!	Mem[0000000010181408] = ff000000, %f1  = 00000000
	lda	[%i6+%o4]0x80,%f1 	! %f1 = ff000000
!	Mem[0000000010141404] = ffffaf83, %f12 = ff000000
	lda	[%i5+0x004]%asi,%f12	! %f12 = ffffaf83
!	Mem[00000000100c1408] = 0332ffff, %l5 = 000000ffff0000ff
	ldswa	[%i3+%o4]0x88,%l5	! %l5 = 000000000332ffff
!	Mem[00000000300c1410] = 00000000, %l7 = 0000000000000000
	lduba	[%i3+%o5]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000030181400] = ff00fb30, %f20 = ffffffef
	lda	[%i6+%g0]0x81,%f20	! %f20 = ff00fb30
!	Mem[0000000030181410] = 00000000, %l0 = 00000000000000ff
	lduha	[%i6+%o5]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000010001400] = 30fb00ff, %l3 = 00000000000000ff
	lduba	[%i0+%g0]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030041400] = fb8d1aff, %f10 = b70000ff
	lda	[%i1+%g0]0x89,%f10	! %f10 = fb8d1aff
!	Starting 10 instruction Store Burst
!	%f8  = ff00fb30 034f37e1, Mem[0000000010001400] = ff00fb30 034f37e1
	stda	%f8 ,[%i0+%g0]0x80	! Mem[0000000010001400] = ff00fb30 034f37e1

p0_label_260:
!	Mem[0000000010081400] = 83afffff, %l1 = 00000000ff000000
	ldstuba	[%i2+%g0]0x80,%l1	! %l1 = 00000083000000ff
!	%l0 = 0000000000000000, Mem[00000000201c0001] = 4f9719af, %asi = 80
	stba	%l0,[%o0+0x001]%asi	! Mem[00000000201c0000] = 4f0019af
!	Mem[0000000030081408] = ff000000, %l5 = 000000000332ffff
	ldstuba	[%i2+%o4]0x81,%l5	! %l5 = 000000ff000000ff
!	%l4 = 00000000000000ff, Mem[0000000010041410] = 0000000083afffff
	stxa	%l4,[%i1+%o5]0x88	! Mem[0000000010041410] = 00000000000000ff
!	%l3 = 00000000000000ff, Mem[00000000300c1400] = ff000000
	stba	%l3,[%i3+%g0]0x81	! Mem[00000000300c1400] = ff000000
!	%l0 = 00000000, %l1 = 00000083, Mem[0000000010081420] = ffffffff 2eb6e519
	std	%l0,[%i2+0x020]		! Mem[0000000010081420] = 00000000 00000083
!	Mem[00000000100c1410] = 49000000, %l7 = 0000000000000000
	ldstuba	[%i3+%o5]0x80,%l7	! %l7 = 00000049000000ff
!	Mem[0000000030081410] = 5d662049, %l6 = 00000000ff000000
	swapa	[%i2+%o5]0x81,%l6	! %l6 = 000000005d662049
!	Mem[000000001010141c] = ffffaf83, %l6 = 5d662049, %l5 = 000000ff
	add	%i4,0x1c,%g1
	casa	[%g1]0x80,%l6,%l5	! %l5 = 00000000ffffaf83
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = ffc93203, %l7 = 0000000000000049
	lduwa	[%i4+%o4]0x81,%l7	! %l7 = 00000000ffc93203

p0_label_261:
!	%f29 = ffdbe53e, %f9  = 034f37e1, %f14 = ffc93203
	fdivs	%f29,%f9 ,%f14		! %f14 = ffdbe53e
!	Mem[00000000300c1400] = ff000000, %l5 = 00000000ffffaf83
	lduha	[%i3+%g0]0x81,%l5	! %l5 = 000000000000ff00
!	Mem[0000000030181408] = ff000000, %f5  = ff0000ff
	lda	[%i6+%o4]0x81,%f5 	! %f5 = ff000000
!	Mem[0000000030081410] = ff000000, %f5  = ff000000
	lda	[%i2+%o5]0x81,%f5 	! %f5 = ff000000
!	Mem[0000000030141410] = e400000000ff0000, %f22 = ffffe519 c971ce8e
	ldda	[%i5+%o5]0x81,%f22	! %f22 = e4000000 00ff0000
!	Mem[0000000010141400] = ff8d0000ffffaf83, %f4  = 00000000 ff000000
	ldda	[%i5+0x000]%asi,%f4 	! %f4  = ff8d0000 ffffaf83
!	Mem[00000000300c1410] = 00000000, %l1 = 0000000000000083
	ldswa	[%i3+%o5]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000010101400] = ff000000, %l0 = 0000000000000000
	lduwa	[%i4+%g0]0x80,%l0	! %l0 = 00000000ff000000
!	Mem[00000000100c1400] = ff000000, %l1 = 0000000000000000
	lduwa	[%i3+%g0]0x88,%l1	! %l1 = 00000000ff000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010001408] = 000000ff, %l7 = 00000000ffc93203
	swapa	[%i0+%o4]0x88,%l7	! %l7 = 00000000000000ff

p0_label_262:
!	Mem[00000000100c1408] = ffff3203, %l2 = 0000000000000007
	ldstuba	[%i3+%o4]0x80,%l2	! %l2 = 000000ff000000ff
!	Mem[00000000201c0000] = 4f0019af, %l6 = 000000005d662049
	ldstub	[%o0+%g0],%l6		! %l6 = 0000004f000000ff
!	%f10 = fb8d1aff, Mem[00000000300c1410] = 00000000
	sta	%f10,[%i3+%o5]0x89	! Mem[00000000300c1410] = fb8d1aff
!	%f27 = ffffaf83, Mem[00000000300c1410] = ff1a8dfb
	sta	%f27,[%i3+%o5]0x81	! Mem[00000000300c1410] = ffffaf83
!	%l0 = ff000000, %l1 = ff000000, Mem[0000000030181400] = ff00fb30 034f37e1
	stda	%l0,[%i6+%g0]0x81	! Mem[0000000030181400] = ff000000 ff000000
!	%l5 = 000000000000ff00, %l7 = 00000000000000ff, %l4  = 00000000000000ff
	mulx	%l5,%l7,%l4		! %l4 = 0000000000fe0100
!	%l2 = 000000ff, %l3 = 000000ff, Mem[00000000100c1408] = ffff3203 a1372583
	stda	%l2,[%i3+0x008]%asi	! Mem[00000000100c1408] = 000000ff 000000ff
!	%l2 = 00000000000000ff, Mem[00000000100c1408] = 000000ff
	stba	%l2,[%i3+%o4]0x80	! Mem[00000000100c1408] = ff0000ff
!	Mem[0000000010081400] = ffffafff, %l7 = 00000000000000ff
	ldstuba	[%i2+%g0]0x88,%l7	! %l7 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[000000001000142c] = 000000ff, %l3 = 00000000000000ff
	ldswa	[%i0+0x02c]%asi,%l3	! %l3 = 00000000000000ff

p0_label_263:
!	Mem[0000000010041408] = 00000000 00ffffff, %l0 = ff000000, %l1 = ff000000
	ldda	[%i1+%o4]0x80,%l0	! %l0 = 0000000000000000 0000000000ffffff
!	Mem[0000000030081410] = 000000ff, %l5 = 000000000000ff00
	lduba	[%i2+%o5]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[0000000020800000] = ff7f17e8, %l2 = 00000000000000ff
	lduh	[%o1+%g0],%l2		! %l2 = 000000000000ff7f
!	Mem[00000000201c0000] = ff0019af, %l7 = 00000000000000ff
	ldsb	[%o0+0x001],%l7		! %l7 = 0000000000000000
!	Mem[0000000010081428] = 00000008ffffaf83, %l3 = 00000000000000ff
	ldxa	[%i2+0x028]%asi,%l3	! %l3 = 00000008ffffaf83
!	Mem[0000000010101408] = ff00000000000000, %f16 = 00000000 83afffff
	ldda	[%i4+%o4]0x80,%f16	! %f16 = ff000000 00000000
!	Mem[0000000010101410] = fb8d0000, %l5 = 00000000000000ff
	ldswa	[%i4+%o5]0x88,%l5	! %l5 = fffffffffb8d0000
!	%l6 = 000000000000004f, %l0 = 0000000000000000, %l7 = 0000000000000000
	sub	%l6,%l0,%l7		! %l7 = 000000000000004f
!	Mem[0000000010001400] = ff00fb30, %l1 = 0000000000ffffff
	lduha	[%i0+%g0]0x80,%l1	! %l1 = 000000000000ff00
!	Starting 10 instruction Store Burst
!	Mem[0000000010041408] = 00000000, %l6 = 000000000000004f
	swapa	[%i1+%o4]0x80,%l6	! %l6 = 0000000000000000

p0_label_264:
!	%l4 = 0000000000fe0100, Mem[0000000010081400] = 00000000ffffafff
	stxa	%l4,[%i2+%g0]0x88	! Mem[0000000010081400] = 0000000000fe0100
!	%f16 = ff000000 00000000 00000000 00000000
!	%f20 = ff00fb30 e0000000 e4000000 00ff0000
!	%f24 = 00000000 4920665d 80000000 ffffaf83
!	%f28 = 7271fd80 ffdbe53e 3500885f 00000000
	stda	%f16,[%i2]ASI_BLK_AIUSL	! Block Store to 0000000030081400
!	Mem[0000000030001410] = 00000000, %l1 = 000000000000ff00
	ldstuba	[%i0+%o5]0x89,%l1	! %l1 = 00000000000000ff
!	%f0  = ffffaf83 ff000000 ffc93203 000000ff
!	%f4  = ff8d0000 ffffaf83 ff00fb30 034f37e1
!	%f8  = ff00fb30 034f37e1 fb8d1aff 00000000
!	%f12 = ffffaf83 00ff0000 ffdbe53e afffffff
	stda	%f0,[%i1]ASI_COMMIT_S	! Block Store to 0000000030041400
!	Mem[00000000100c1400] = ff000000, %l6 = 0000000000000000
	swapa	[%i3+%g0]0x88,%l6	! %l6 = 00000000ff000000
!	Mem[0000000010101400] = ff000000, %l7 = 000000000000004f
	ldstuba	[%i4+%g0]0x80,%l7	! %l7 = 000000ff000000ff
!	%f28 = 7271fd80 ffdbe53e, Mem[0000000010081400] = 00fe0100 00000000
	stda	%f28,[%i2+%g0]0x88	! Mem[0000000010081400] = 7271fd80 ffdbe53e
!	Mem[0000000010101410] = 00008dfb, %l1 = 0000000000000000
	ldstuba	[%i4+%o5]0x80,%l1	! %l1 = 00000000000000ff
!	%f20 = ff00fb30 e0000000, Mem[0000000010081400] = 3ee5dbff 80fd7172
	stda	%f20,[%i2+%g0]0x80	! Mem[0000000010081400] = ff00fb30 e0000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = 000000007fffffff, %f30 = 3500885f 00000000
	ldda	[%i4+%g0]0x89,%f30	! %f30 = 00000000 7fffffff

p0_label_265:
!	Mem[0000000010181410] = 0000000000000000, %f28 = 7271fd80 ffdbe53e
	ldda	[%i6+0x010]%asi,%f28	! %f28 = 00000000 00000000
!	Mem[00000000100c1400] = 0000000000000000, %f20 = ff00fb30 e0000000
	ldd	[%i3+%g0],%f20		! %f20 = 00000000 00000000
!	%l1 = 0000000000000000, immed = fffffd18, %y  = 000000ff
	smul	%l1,-0x2e8,%l0		! %l0 = 0000000000000000, %y = 00000000
	membar	#Sync			! Added by membar checker (43)
!	Mem[0000000010081400] = ff00fb30e0000000, %f20 = 00000000 00000000
	ldda	[%i2+%g0]0x80,%f20	! %f20 = ff00fb30 e0000000
!	Mem[0000000010041400] = 000000ff, %l5 = fffffffffb8d0000
	lduha	[%i1+%g0]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000020800040] = ff00226c, %l2 = 000000000000ff7f
	ldsb	[%o1+0x041],%l2		! %l2 = 0000000000000000
!	Mem[00000000218000c0] = 00ff4926, %l1 = 0000000000000000
	ldsh	[%o3+0x0c0],%l1		! %l1 = 00000000000000ff
!	Mem[0000000010081410] = 00000000, %l7 = 00000000000000ff
	ldsha	[%i2+%o5]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000010141418] = ffffadff, %l7 = 0000000000000000
	lduh	[%i5+0x018],%l7		! %l7 = 000000000000ffff
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1434] = ff37ff66, %l4 = 0000000000fe0100
	swap	[%i3+0x034],%l4		! %l4 = 00000000ff37ff66

p0_label_266:
!	%l2 = 0000000000000000, Mem[0000000030041408] = ff0000000332c9ff
	stxa	%l2,[%i1+%o4]0x89	! Mem[0000000030041408] = 0000000000000000
!	%f14 = ffdbe53e afffffff, %f24 = 00000000
	fxtos	%f14,%f24		! %f24 = da106b05
!	%l3 = 00000008ffffaf83, Mem[00000000211c0000] = 59ff980d
	sth	%l3,[%o2+%g0]		! Mem[00000000211c0000] = af83980d
!	%l0 = 0000000000000000, immed = fffff84d, %y  = 00000000
	sdiv	%l0,-0x7b3,%l3		! %l3 = 0000000000000000
	mov	%l0,%y			! %y = 00000000
!	Mem[0000000010081408] = ffc90000, %l7 = 000000000000ffff
	swapa	[%i2+%o4]0x80,%l7	! %l7 = 00000000ffc90000
!	%l7 = 00000000ffc90000, Mem[0000000030001410] = ff000000
	stha	%l7,[%i0+%o5]0x81	! Mem[0000000030001410] = 00000000
!	%l2 = 00000000, %l3 = 00000000, Mem[0000000030101410] = ff000000 ff0000ff
	stda	%l2,[%i4+%o5]0x89	! Mem[0000000030101410] = 00000000 00000000
!	%l0 = 0000000000000000, Mem[0000000010181410] = 00000000
	stba	%l0,[%i6+%o5]0x88	! Mem[0000000010181410] = 00000000
!	Mem[000000001014143d] = 006d0000, %l5 = 0000000000000000
	ldstub	[%i5+0x03d],%l5		! %l5 = 0000006d000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030101410] = 00000000 00000000, %l2 = 00000000, %l3 = 00000000
	ldda	[%i4+%o5]0x81,%l2	! %l2 = 0000000000000000 0000000000000000

p0_label_267:
!	Mem[0000000020800040] = ff00226c, %l5 = 000000000000006d
	lduh	[%o1+0x040],%l5		! %l5 = 000000000000ff00
!	Mem[0000000030001410] = 00000000 00000000, %l4 = ff37ff66, %l5 = 0000ff00
	ldda	[%i0+%o5]0x89,%l4	! %l4 = 0000000000000000 0000000000000000
!	Mem[0000000010081410] = 00000000, %l2 = 0000000000000000
	ldsba	[%i2+0x010]%asi,%l2	! %l2 = 0000000000000000
!	%l4 = 0000000000000000, %l5 = 0000000000000000, %l3 = 0000000000000000
	xor	%l4,%l5,%l3		! %l3 = 0000000000000000
!	Mem[0000000030141408] = ff3daf83, %l4 = 0000000000000000
	ldsha	[%i5+%o4]0x81,%l4	! %l4 = ffffffffffffff3d
!	%f21 = e0000000, %f17 = 00000000, %f2  = ffc93203 000000ff
	fsmuld	%f21,%f17,%f2 		! %f2  = 80000000 00000000
!	%l3 = 0000000000000000, imm = 0000000000000483, %l3 = 0000000000000000
	subc	%l3,0x483,%l3		! %l3 = fffffffffffffb7d
!	Mem[0000000010141420] = ffffff7f, %l7 = 00000000ffc90000
	ldsha	[%i5+0x020]%asi,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010041400] = 000000ff, %l4 = ffffffffffffff3d
	ldsba	[%i1+%g0]0x80,%l4	! %l4 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010181410] = 00000000, %l7 = ffffffffffffffff
	swapa	[%i6+%o5]0x88,%l7	! %l7 = 0000000000000000

p0_label_268:
!	%l7 = 0000000000000000, Mem[0000000030041410] = 83afffff00008dff
	stxa	%l7,[%i1+%o5]0x89	! Mem[0000000030041410] = 0000000000000000
!	%l0 = 0000000000000000, Mem[00000000300c1408] = ffffff7f
	stba	%l0,[%i3+%o4]0x89	! Mem[00000000300c1408] = ffffff00
!	Mem[00000000100c1400] = 00000000, %l5 = 0000000000000000
	ldstuba	[%i3+%g0]0x88,%l5	! %l5 = 00000000000000ff
!	%f20 = ff00fb30 e0000000, Mem[0000000010141400] = ff8d0000 ffffaf83
	stda	%f20,[%i5+%g0]0x80	! Mem[0000000010141400] = ff00fb30 e0000000
!	%l2 = 0000000000000000, Mem[00000000300c1400] = ff000000000000ff
	stxa	%l2,[%i3+%g0]0x89	! Mem[00000000300c1400] = 0000000000000000
!	%l6 = 00000000ff000000, Mem[0000000030101400] = ffffff7f
	stwa	%l6,[%i4+%g0]0x81	! Mem[0000000030101400] = ff000000
!	%l5 = 0000000000000000, Mem[00000000300c1410] = ffffaf83
	stha	%l5,[%i3+%o5]0x81	! Mem[00000000300c1410] = 0000af83
!	%f14 = ffdbe53e afffffff, Mem[00000000100c1400] = ff000000 00000000
	stda	%f14,[%i3+%g0]0x80	! Mem[00000000100c1400] = ffdbe53e afffffff
!	%f14 = ffdbe53e afffffff, %l6 = 00000000ff000000
!	Mem[0000000010141400] = ff00fb30e0000000
	stda	%f14,[%i5+%l6]ASI_PST16_P ! Mem[0000000010141400] = ff00fb30e0000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = ff000000, %l3 = fffffffffffffb7d
	ldsha	[%i4+%g0]0x80,%l3	! %l3 = ffffffffffffff00

p0_label_269:
!	%f21 = e0000000, %f14 = ffdbe53e, %f22 = e4000000
	fsubs	%f21,%f14,%f22		! %f22 = ffdbe53e
!	Mem[0000000010181400] = 00000000, %l7 = 0000000000000000
	lduba	[%i6+%g0]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000010181410] = ffffffff00000000, %l0 = 0000000000000000
	ldxa	[%i6+%o5]0x80,%l0	! %l0 = ffffffff00000000
!	Mem[0000000010181400] = 0000000000000000, %f2  = 80000000 00000000
	ldda	[%i6+%g0]0x88,%f2 	! %f2  = 00000000 00000000
!	Mem[0000000030041410] = 00000000, %l5 = 0000000000000000
	lduba	[%i1+%o5]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000010081400] = ff00fb30e0000000, %f20 = ff00fb30 e0000000
	ldda	[%i2+%g0]0x80,%f20	! %f20 = ff00fb30 e0000000
!	Mem[0000000010141410] = 00000000, %l3 = ffffffffffffff00
	lduwa	[%i5+%o5]0x88,%l3	! %l3 = 0000000000000000
!	Code Fragment 3
p0_fragment_23:
!	%l0 = ffffffff00000000
	setx	0xa2e07ddfef909f84,%g7,%l0 ! %l0 = a2e07ddfef909f84
!	%l1 = 00000000000000ff
	setx	0xf6d0b52006c97aa1,%g7,%l1 ! %l1 = f6d0b52006c97aa1
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = a2e07ddfef909f84
	setx	0xc9897f7f896f2ef3,%g7,%l0 ! %l0 = c9897f7f896f2ef3
!	%l1 = f6d0b52006c97aa1
	setx	0x31fc44701c32f778,%g7,%l1 ! %l1 = 31fc44701c32f778
!	Mem[0000000010101410] = ff008dfbff0000b1, %f22 = ffdbe53e 00ff0000
	ldda	[%i4+%o5]0x80,%f22	! %f22 = ff008dfb ff0000b1
!	Starting 10 instruction Store Burst
!	%l4 = 00000000, %l5 = 00000000, Mem[0000000010001410] = ff00fb30 83afffff
	stda	%l4,[%i0+%o5]0x88	! Mem[0000000010001410] = 00000000 00000000

p0_label_270:
!	Mem[0000000010181400] = 00000000, %l3 = 0000000000000000
	ldstuba	[%i6+%g0]0x80,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030001408] = 00000000, %l4 = 0000000000000000
	ldstuba	[%i0+%o4]0x81,%l4	! %l4 = 00000000000000ff
!	%l0 = 896f2ef3, %l1 = 1c32f778, Mem[0000000010181428] = 0418b91c afffffff
	std	%l0,[%i6+0x028]		! Mem[0000000010181428] = 896f2ef3 1c32f778
!	%l4 = 0000000000000000, Mem[0000000010101426] = 19e5972e, %asi = 80
	stha	%l4,[%i4+0x026]%asi	! Mem[0000000010101424] = 19e50000
!	%l7 = 0000000000000000, Mem[0000000010101408] = ff000000
	stha	%l7,[%i4+%o4]0x80	! Mem[0000000010101408] = 00000000
!	%l4 = 00000000, %l5 = 00000000, Mem[0000000010081420] = 00000000 00000083
	stda	%l4,[%i2+0x020]%asi	! Mem[0000000010081420] = 00000000 00000000
!	%l4 = 0000000000000000, Mem[0000000010141427] = 000000ff, %asi = 80
	stba	%l4,[%i5+0x027]%asi	! Mem[0000000010141424] = 00000000
!	%f28 = 00000000 00000000, Mem[0000000010041418] = 00000000 00000080
	stda	%f28,[%i1+0x018]%asi	! Mem[0000000010041418] = 00000000 00000000
!	Code Fragment 3
p0_fragment_24:
!	%l0 = c9897f7f896f2ef3
	setx	0x3e0c3ee07ce881d8,%g7,%l0 ! %l0 = 3e0c3ee07ce881d8
!	%l1 = 31fc44701c32f778
	setx	0x89ff63983a4f7fb0,%g7,%l1 ! %l1 = 89ff63983a4f7fb0
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 3e0c3ee07ce881d8
	setx	0x10cf887f818d133d,%g7,%l0 ! %l0 = 10cf887f818d133d
!	%l1 = 89ff63983a4f7fb0
	setx	0x6cc29effe2243947,%g7,%l1 ! %l1 = 6cc29effe2243947
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = 000000ff, %l2 = 0000000000000000
	lduwa	[%i1+%g0]0x80,%l2	! %l2 = 00000000000000ff

p0_label_271:
!	Mem[0000000010181438] = ff3d00b3, %l1 = 6cc29effe2243947
	lduh	[%i6+0x03a],%l1		! %l1 = 00000000000000b3
!	Mem[0000000030141400] = 00000000, %l0 = 10cf887f818d133d
	ldsba	[%i5+%g0]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000030101408] = ffc93203, %l5 = 0000000000000000
	ldsba	[%i4+%o4]0x81,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000030041400] = ffffaf83, %f28 = 00000000
	lda	[%i1+%g0]0x81,%f28	! %f28 = ffffaf83
!	Mem[00000000201c0000] = ff0019af, %l1 = 00000000000000b3
	lduha	[%o0+0x000]%asi,%l1	! %l1 = 000000000000ff00
!	Mem[0000000010001408] = 0332c9ff, %l4 = 0000000000000000
	lduh	[%i0+%o4],%l4		! %l4 = 0000000000000332
!	Mem[0000000010041400] = ff000000, %l1 = 000000000000ff00
	ldsba	[%i1+%g0]0x88,%l1	! %l1 = 0000000000000000
!	Mem[00000000100c1408] = ff0000ff, %l4 = 0000000000000332
	lduha	[%i3+%o4]0x80,%l4	! %l4 = 000000000000ff00
!	Mem[0000000030181400] = 000000ff, %f30 = 00000000
	lda	[%i6+%g0]0x89,%f30	! %f30 = 000000ff
!	Starting 10 instruction Store Burst
!	%l6 = 00000000ff000000, Mem[0000000010001400] = ff00fb30034f37e1
	stxa	%l6,[%i0+%g0]0x80	! Mem[0000000010001400] = 00000000ff000000

p0_label_272:
!	%f9  = 034f37e1, Mem[0000000030041410] = 00000000
	sta	%f9 ,[%i1+%o5]0x81	! Mem[0000000030041410] = 034f37e1
!	Mem[0000000010081400] = ff00fb30, %l3 = 0000000000000000
	swapa	[%i2+%g0]0x80,%l3	! %l3 = 00000000ff00fb30
!	Mem[0000000030141410] = e4000000, %l7 = 0000000000000000
	swapa	[%i5+%o5]0x81,%l7	! %l7 = 00000000e4000000
!	Mem[0000000030001410] = 00000000, %l6 = 00000000ff000000
	swapa	[%i0+%o5]0x89,%l6	! %l6 = 0000000000000000
!	%l4 = 000000000000ff00, Mem[0000000010001400] = 00000000
	stha	%l4,[%i0+%g0]0x88	! Mem[0000000010001400] = 0000ff00
!	%f12 = ffffaf83, %f1  = ff000000, %f6  = ff00fb30 034f37e1
	fsmuld	%f12,%f1 ,%f6 		! %f6  = fffff5f0 60000000
!	%f24 = da106b05 4920665d, Mem[0000000010101400] = 000000ff 2fffffff
	stda	%f24,[%i4+%g0]0x88	! Mem[0000000010101400] = da106b05 4920665d
!	%l6 = 0000000000000000, Mem[0000000030101410] = 00000000
	stha	%l6,[%i4+%o5]0x81	! Mem[0000000030101410] = 00000000
!	%f24 = da106b05 4920665d, %l5 = ffffffffffffffff
!	Mem[0000000010101438] = ffe0c7f6006d0000
	add	%i4,0x038,%g1
	stda	%f24,[%g1+%l5]ASI_PST16_P ! Mem[0000000010101438] = da106b054920665d
!	Starting 10 instruction Load Burst
!	%f26 = 80000000, %f8  = ff00fb30
	fcmpes	%fcc3,%f26,%f8 		! %fcc3 = 2

p0_label_273:
!	Mem[0000000030101400] = ff000000 00000000, %l6 = 00000000, %l7 = e4000000
	ldda	[%i4+%g0]0x81,%l6	! %l6 = 00000000ff000000 0000000000000000
!	Mem[0000000010001410] = 00000000, %l0 = 0000000000000000
	lduha	[%i0+%o5]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000010041410] = ff000000, %l5 = ffffffffffffffff
	ldswa	[%i1+%o5]0x80,%l5	! %l5 = ffffffffff000000
!	Mem[0000000010141400] = ff00fb30 e0000000, %l4 = 0000ff00, %l5 = ff000000
	ldda	[%i5+%g0]0x80,%l4	! %l4 = 00000000ff00fb30 00000000e0000000
!	Mem[0000000030101410] = 00000000, %l1 = 0000000000000000
	ldsba	[%i4+%o5]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000010001408] = 83000000ffc93203, %f28 = ffffaf83 00000000
	ldda	[%i0+%o4]0x88,%f28	! %f28 = 83000000 ffc93203
!	Mem[0000000010101400] = 5d662049, %l3 = 00000000ff00fb30
	ldswa	[%i4+0x000]%asi,%l3	! %l3 = 000000005d662049
!	Mem[0000000010001400] = 00ff0000ff000000, %l1 = 0000000000000000
	ldxa	[%i0+%g0]0x80,%l1	! %l1 = 00ff0000ff000000
!	Mem[0000000030081410] = 000000e0 30fb00ff, %l6 = ff000000, %l7 = 00000000
	ldda	[%i2+%o5]0x81,%l6	! %l6 = 00000000000000e0 0000000030fb00ff
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1400] = 00000000, %l1 = 00ff0000ff000000
	swapa	[%i3+%g0]0x81,%l1	! %l1 = 0000000000000000

p0_label_274:
!	%l4 = ff00fb30, %l5 = e0000000, Mem[0000000010001400] = 00ff0000 ff000000
	stda	%l4,[%i0+%g0]0x80	! Mem[0000000010001400] = ff00fb30 e0000000
!	Mem[0000000030081400] = 00000000, %l2 = 00000000000000ff
	swapa	[%i2+%g0]0x81,%l2	! %l2 = 0000000000000000
!	%l7 = 0000000030fb00ff, Mem[0000000010141406] = e0000000, %asi = 80
	stba	%l7,[%i5+0x006]%asi	! Mem[0000000010141404] = e000ff00
!	%l0 = 00000000, %l1 = 00000000, Mem[0000000030141408] = ff3daf83 0000004f
	stda	%l0,[%i5+%o4]0x81	! Mem[0000000030141408] = 00000000 00000000
!	%f10 = fb8d1aff 00000000, Mem[0000000030001400] = 022800ff af83e48b
	stda	%f10,[%i0+%g0]0x89	! Mem[0000000030001400] = fb8d1aff 00000000
!	%l7 = 0000000030fb00ff, Mem[0000000030081400] = 000000ff
	stha	%l7,[%i2+%g0]0x81	! Mem[0000000030081400] = 00ff00ff
!	Mem[0000000030081408] = 00000000, %l2 = 0000000000000000
	swapa	[%i2+%o4]0x81,%l2	! %l2 = 0000000000000000
!	%f10 = fb8d1aff 00000000, Mem[00000000300c1400] = 000000ff 00000000
	stda	%f10,[%i3+%g0]0x89	! Mem[00000000300c1400] = fb8d1aff 00000000
!	Mem[00000000100c1410] = ff000000, %l3 = 000000005d662049
	swapa	[%i3+%o5]0x80,%l3	! %l3 = 00000000ff000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = ffff0000, %f28 = 83000000
	lda	[%i2+%o4]0x88,%f28	! %f28 = ffff0000

p0_label_275:
!	Mem[0000000010141410] = 00000000, %f24 = da106b05
	lda	[%i5+%o5]0x80,%f24	! %f24 = 00000000
!	Mem[0000000030181400] = 000000ff, %l5 = 00000000e0000000
	ldswa	[%i6+%g0]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030101400] = 000000ff, %l4 = 00000000ff00fb30
	lduwa	[%i4+%g0]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010081400] = 00000000 e0000000, %l0 = 00000000, %l1 = 00000000
	ldda	[%i2+%g0]0x80,%l0	! %l0 = 0000000000000000 00000000e0000000
!	%f5  = ffffaf83, %f25 = 4920665d
	fcmpes	%fcc1,%f5 ,%f25		! %fcc1 = 3
!	Mem[0000000030181400] = 000000ff 000000ff, %l4 = 000000ff, %l5 = 000000ff
	ldda	[%i6+%g0]0x89,%l4	! %l4 = 00000000000000ff 00000000000000ff
!	Mem[0000000010001430] = 000000b1 00000000, %l2 = 00000000, %l3 = ff000000
	ldda	[%i0+0x030]%asi,%l2	! %l2 = 00000000000000b1 0000000000000000
!	Mem[0000000030141408] = 00000000, %l6 = 00000000000000e0
	lduba	[%i5+%o4]0x81,%l6	! %l6 = 0000000000000000
!	%f22 = ff008dfb, %f14 = ffdbe53e, %f8  = ff00fb30
	fdivs	%f22,%f14,%f8 		! %f8  = ffdbe53e
!	Starting 10 instruction Store Burst
!	%l7 = 0000000030fb00ff, immd = fffffffffffff186, %l0 = 0000000000000000
	udivx	%l7,-0xe7a,%l0		! %l0 = 0000000000000000

p0_label_276:
!	%l2 = 00000000000000b1, Mem[0000000030041408] = 00000000
	stha	%l2,[%i1+%o4]0x81	! Mem[0000000030041408] = 00b10000
!	%l4 = 00000000000000ff, Mem[0000000010041408] = 0000004f00ffffff
	stxa	%l4,[%i1+%o4]0x80	! Mem[0000000010041408] = 00000000000000ff
!	%l7 = 0000000030fb00ff, Mem[0000000030181408] = ff000000
	stba	%l7,[%i6+%o4]0x81	! Mem[0000000030181408] = ff000000
!	%l6 = 0000000000000000, Mem[00000000211c0001] = af83980d, %asi = 80
	stba	%l6,[%o2+0x001]%asi	! Mem[00000000211c0000] = af00980d
!	%l6 = 0000000000000000, %l2 = 00000000000000b1, %l5 = 00000000000000ff
	xnor	%l6,%l2,%l5		! %l5 = ffffffffffffff4e
!	%f0  = ffffaf83 ff000000, Mem[00000000100c1430] = c1ff64ff 00fe0100
	std	%f0 ,[%i3+0x030]	! Mem[00000000100c1430] = ffffaf83 ff000000
!	Mem[0000000010041438] = ffffffaf0332c9ff, %l0 = 0000000000000000, %l7 = 0000000030fb00ff
	add	%i1,0x38,%g1
	casxa	[%g1]0x80,%l0,%l7	! %l7 = ffffffaf0332c9ff
!	%f22 = ff008dfb, Mem[0000000030181408] = ff000000
	sta	%f22,[%i6+%o4]0x81	! Mem[0000000030181408] = ff008dfb
!	%f10 = fb8d1aff 00000000, %l1 = 00000000e0000000
!	Mem[0000000030101420] = 30fb00ffffffaf83
	add	%i4,0x020,%g1
	stda	%f10,[%g1+%l1]ASI_PST8_S ! Mem[0000000030101420] = 30fb00ffffffaf83
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = ff00000000000000, %l4 = 00000000000000ff
	ldxa	[%i1+%o4]0x88,%l4	! %l4 = ff00000000000000

p0_label_277:
!	Mem[0000000030041408] = 000000000000b100, %l3 = 0000000000000000
	ldxa	[%i1+%o4]0x89,%l3	! %l3 = 000000000000b100
!	Mem[0000000030081408] = 00000000, %l2 = 00000000000000b1
	lduwa	[%i2+%o4]0x89,%l2	! %l2 = 0000000000000000
!	Mem[00000000300c1408] = 00ffffff, %l4 = ff00000000000000
	ldswa	[%i3+%o4]0x81,%l4	! %l4 = 0000000000ffffff
!	Mem[0000000010081410] = ff000000 00000000, %l0 = 00000000, %l1 = e0000000
	ldda	[%i2+%o5]0x88,%l0	! %l0 = 0000000000000000 00000000ff000000
!	Mem[0000000030081410] = ff00fb30e0000000, %l1 = 00000000ff000000
	ldxa	[%i2+%o5]0x89,%l1	! %l1 = ff00fb30e0000000
!	Mem[0000000010101408] = 0000000000000000, %l5 = ffffffffffffff4e
	ldxa	[%i4+%o4]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000030141400] = 20b3b67600000000, %l4 = 0000000000ffffff
	ldxa	[%i5+%g0]0x89,%l4	! %l4 = 20b3b67600000000
!	Mem[0000000010041408] = 00000000 000000ff, %l0 = 00000000, %l1 = e0000000
	ldd	[%i1+%o4],%l0		! %l0 = 0000000000000000 00000000000000ff
!	Mem[00000000100c1414] = 3e000000, %l1 = 00000000000000ff
	lduha	[%i3+0x014]%asi,%l1	! %l1 = 0000000000003e00
!	Starting 10 instruction Store Burst
!	%l4 = 00000000, %l5 = 00000000, Mem[00000000100c1400] = 3ee5dbff ffffffaf
	stda	%l4,[%i3+%g0]0x88	! Mem[00000000100c1400] = 00000000 00000000

p0_label_278:
!	Mem[0000000010081410] = 00000000, %l3 = 000000000000b100
	swapa	[%i2+%o5]0x88,%l3	! %l3 = 0000000000000000
!	%l7 = ffffffaf0332c9ff, %l2 = 0000000000000000, %l5 = 0000000000000000
	xnor	%l7,%l2,%l5		! %l5 = 00000050fccd3600
!	Mem[0000000010141400] = 30fb00ff, %l2 = 0000000000000000
	ldstuba	[%i5+%g0]0x88,%l2	! %l2 = 000000ff000000ff
!	Mem[0000000010101408] = 00000000, %l3 = 0000000000000000
	ldstuba	[%i4+%o4]0x88,%l3	! %l3 = 00000000000000ff
!	%l6 = 0000000000000000, Mem[0000000030041400] = ffffaf83
	stha	%l6,[%i1+%g0]0x81	! Mem[0000000030041400] = 0000af83
!	%f6  = fffff5f0, Mem[0000000010041408] = 00000000
	sta	%f6 ,[%i1+0x008]%asi	! Mem[0000000010041408] = fffff5f0
!	%l0 = 0000000000000000, Mem[0000000010101410] = ff008dfb
	stwa	%l0,[%i4+%o5]0x80	! Mem[0000000010101410] = 00000000
!	Mem[0000000010101410] = 00000000, %l1 = 0000000000003e00
	swapa	[%i4+%o5]0x88,%l1	! %l1 = 0000000000000000
!	Mem[00000000211c0000] = af00980d, %l2 = 00000000000000ff
	ldstuba	[%o2+0x000]%asi,%l2	! %l2 = 000000af000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000020800040] = ff00226c, %l0 = 0000000000000000
	ldsha	[%o1+0x040]%asi,%l0	! %l0 = ffffffffffffff00

p0_label_279:
!	Mem[0000000010181400] = ff00000000000000, %f12 = ffffaf83 00ff0000
	ldda	[%i6+%g0]0x80,%f12	! %f12 = ff000000 00000000
!	Mem[0000000030041410] = 034f37e1, %l6 = 0000000000000000
	ldsba	[%i1+%o5]0x81,%l6	! %l6 = 0000000000000003
!	Mem[00000000300c1410] = 83af0000, %l4 = 20b3b67600000000
	lduha	[%i3+%o5]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000030181408] = ff008dfb, %l4 = 0000000000000000
	lduwa	[%i6+%o4]0x81,%l4	! %l4 = 00000000ff008dfb
!	Mem[0000000010001408] = ffc93203, %l2 = 00000000000000af
	lduba	[%i0+%o4]0x88,%l2	! %l2 = 0000000000000003
!	Mem[0000000010101408] = ff000000, %f5  = ffffaf83
	lda	[%i4+%o4]0x80,%f5 	! %f5 = ff000000
!	Mem[0000000010141418] = ffffadff ffffaf83, %l0 = ffffff00, %l1 = 00000000
	ldda	[%i5+0x018]%asi,%l0	! %l0 = 00000000ffffadff 00000000ffffaf83
!	%l4 = 00000000ff008dfb, %l3 = 0000000000000000, %l2 = 0000000000000003
	addc	%l4,%l3,%l2		! %l2 = 00000000ff008dfb
!	Mem[00000000100c1400] = 0000000000000000, %f12 = ff000000 00000000
	ldda	[%i3+%g0]0x80,%f12	! %f12 = 00000000 00000000
!	Starting 10 instruction Store Burst
!	%l2 = 00000000ff008dfb, Mem[0000000010081430] = 7271fd80ffdbe53e
	stx	%l2,[%i2+0x030]		! Mem[0000000010081430] = 00000000ff008dfb

p0_label_280:
!	%f30 = 000000ff 7fffffff, %l1 = 00000000ffffaf83
!	Mem[0000000010041428] = 000000ff00000000
	add	%i1,0x028,%g1
	stda	%f30,[%g1+%l1]ASI_PST16_P ! Mem[0000000010041428] = 000000ff7fffffff
!	%f30 = 000000ff 7fffffff, Mem[0000000030141400] = 00000000 20b3b676
	stda	%f30,[%i5+%g0]0x89	! Mem[0000000030141400] = 000000ff 7fffffff
!	%l5 = 00000050fccd3600, Mem[0000000010181408] = ff00000000000083
	stx	%l5,[%i6+%o4]		! Mem[0000000010181408] = 00000050fccd3600
!	%f16 = ff000000, Mem[0000000010041400] = 000000ff
	sta	%f16,[%i1+%g0]0x80	! Mem[0000000010041400] = ff000000
!	%l0 = 00000000ffffadff, Mem[0000000010041410] = ff000000
	stwa	%l0,[%i1+%o5]0x80	! Mem[0000000010041410] = ffffadff
!	%f30 = 000000ff 7fffffff, %l6 = 0000000000000003
!	Mem[0000000010041418] = 0000000000000000
	add	%i1,0x018,%g1
	stda	%f30,[%g1+%l6]ASI_PST8_P ! Mem[0000000010041418] = 000000000000ffff
!	%f7  = 60000000, Mem[0000000010081410] = 0000b100
	sta	%f7 ,[%i2+%o5]0x88	! Mem[0000000010081410] = 60000000
!	%l0 = ffffadff, %l1 = ffffaf83, Mem[00000000300c1400] = 00000000 fb8d1aff
	stda	%l0,[%i3+%g0]0x89	! Mem[00000000300c1400] = ffffadff ffffaf83
!	%f0  = ffffaf83 ff000000 00000000 00000000
!	%f4  = ff8d0000 ff000000 fffff5f0 60000000
!	%f8  = ffdbe53e 034f37e1 fb8d1aff 00000000
!	%f12 = 00000000 00000000 ffdbe53e afffffff
	stda	%f0,[%i3]ASI_BLK_AIUS	! Block Store to 00000000300c1400
!	Starting 10 instruction Load Burst
!	Mem[000000001000141c] = 00000000, %l0 = 00000000ffffadff
	ldub	[%i0+0x01d],%l0		! %l0 = 0000000000000000

p0_label_281:
!	Mem[0000000030181400] = ff000000 ff000000, %l4 = ff008dfb, %l5 = fccd3600
	ldda	[%i6+%g0]0x81,%l4	! %l4 = 00000000ff000000 00000000ff000000
!	Mem[0000000030081410] = e0000000, %l1 = 00000000ffffaf83
	lduha	[%i2+%o5]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000010081408] = ffff0000, %l5 = 00000000ff000000
	ldsha	[%i2+%o4]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000030141400] = 7fffffff, %l1 = 0000000000000000
	ldswa	[%i5+%g0]0x89,%l1	! %l1 = 000000007fffffff
!	Mem[0000000030081410] = e0000000, %f20 = ff00fb30
	lda	[%i2+%o5]0x89,%f20	! %f20 = e0000000
!	Mem[0000000010041410] = ffffadff, %l7 = ffffffaf0332c9ff
	ldsba	[%i1+%o5]0x80,%l7	! %l7 = ffffffffffffffff
	membar	#Sync			! Added by membar checker (44)
!	Mem[00000000300c1410] = ff8d0000, %l2 = 00000000ff008dfb
	ldswa	[%i3+%o5]0x81,%l2	! %l2 = ffffffffff8d0000
!	Mem[0000000010141408] = 000000ff, %l4 = 00000000ff000000
	ldsba	[%i5+%o4]0x88,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010181400] = ff000000 00000000 00000050 fccd3600
!	Mem[0000000010181410] = ffffffff 00000000 0000b100 ff7f0000
!	Mem[0000000010181420] = ffb3b676 00000000 896f2ef3 1c32f778
!	Mem[0000000010181430] = 4049c358 00000000 ff3d00b3 000000e4
	ldda	[%i6]ASI_BLK_P,%f16	! Block Load from 0000000010181400
!	Starting 10 instruction Store Burst
!	%l4 = ffffffffffffffff, Mem[0000000010101408] = ff000000
	stha	%l4,[%i4+%o4]0x80	! Mem[0000000010101408] = ffff0000

p0_label_282:
!	%l3 = 0000000000000000, Mem[0000000030101410] = 00000000
	stba	%l3,[%i4+%o5]0x81	! Mem[0000000030101410] = 00000000
!	%l3 = 0000000000000000, Mem[0000000010081418] = ff000000
	stb	%l3,[%i2+0x018]		! Mem[0000000010081418] = 00000000
!	%l5 = 0000000000000000, Mem[0000000010001410] = 00000000
	stwa	%l5,[%i0+%o5]0x80	! Mem[0000000010001410] = 00000000
	membar	#Sync			! Added by membar checker (45)
!	%l1 = 000000007fffffff, Mem[0000000010181400] = ff000000
	stha	%l1,[%i6+%g0]0x80	! Mem[0000000010181400] = ffff0000
!	Mem[0000000010101408] = 0000ffff, %l6 = 0000000000000003
	ldstuba	[%i4+%o4]0x88,%l6	! %l6 = 000000ff000000ff
!	%f18 = 00000050 fccd3600, %l5 = 0000000000000000
!	Mem[0000000010101400] = 5d662049056b10da
	stda	%f18,[%i4+%l5]ASI_PST32_P ! Mem[0000000010101400] = 5d662049056b10da
!	%f12 = 00000000 00000000, Mem[0000000010101408] = 0000ffff 00000000
	stda	%f12,[%i4+%o4]0x88	! Mem[0000000010101408] = 00000000 00000000
!	%l6 = 00000000000000ff, Mem[0000000010181410] = ffffffff
	stba	%l6,[%i6+%o5]0x88	! Mem[0000000010181410] = ffffffff
!	Mem[0000000030041408] = 0000b100, %l0 = 0000000000000000
	ldstuba	[%i1+%o4]0x89,%l0	! %l0 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = 00000000 00000000, %l2 = ff8d0000, %l3 = 00000000
	ldda	[%i2+%o4]0x89,%l2	! %l2 = 0000000000000000 0000000000000000

p0_label_283:
!	Code Fragment 3
p0_fragment_25:
!	%l0 = 0000000000000000
	setx	0x2b2e57286259f770,%g7,%l0 ! %l0 = 2b2e57286259f770
!	%l1 = 000000007fffffff
	setx	0x74e3ecf7c98bf098,%g7,%l1 ! %l1 = 74e3ecf7c98bf098
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 2b2e57286259f770
	setx	0x0bb9716feaeb01da,%g7,%l0 ! %l0 = 0bb9716feaeb01da
!	%l1 = 74e3ecf7c98bf098
	setx	0x85fb29b01a14b065,%g7,%l1 ! %l1 = 85fb29b01a14b065
!	Mem[0000000010001408] = 0332c9ff, %f27 = 1c32f778
	lda	[%i0+%o4]0x80,%f27	! %f27 = 0332c9ff
!	%f20 = ffffffff 00000000, %l0 = 0bb9716feaeb01da
!	Mem[0000000010141438] = ff22000000ff0000
	add	%i5,0x038,%g1
	stda	%f20,[%g1+%l0]ASI_PST16_PL ! Mem[0000000010141438] = ff22000000ffffff
!	Mem[00000000100c1420] = 00000000 30fbc62b, %l6 = 000000ff, %l7 = ffffffff
	ldd	[%i3+0x020],%l6		! %l6 = 0000000000000000 0000000030fbc62b
!	Mem[0000000030181410] = 00000000, %l7 = 0000000030fbc62b
	lduwa	[%i6+%o5]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000010001438] = ffc93203, %l0 = 0bb9716feaeb01da
	ldsha	[%i0+0x03a]%asi,%l0	! %l0 = 0000000000003203
!	Mem[0000000030181410] = ff0000ff 00000000, %l6 = 00000000, %l7 = 00000000
	ldda	[%i6+%o5]0x89,%l6	! %l6 = 0000000000000000 00000000ff0000ff
!	Mem[0000000010041410] = ffffadff, %l6 = 0000000000000000
	ldsb	[%i1+%o5],%l6		! %l6 = ffffffffffffffff
!	%l4 = ffffffffffffffff, %l4 = ffffffffffffffff, %y  = 00000000
	udiv	%l4,%l4,%l4		! %l4 = 0000000000000001
	mov	%l0,%y			! %y = 00003203
!	Starting 10 instruction Store Burst
!	Mem[0000000010181430] = 4049c358, %l4 = 0000000000000001, %asi = 80
	swapa	[%i6+0x030]%asi,%l4	! %l4 = 000000004049c358

p0_label_284:
!	Mem[0000000030141400] = ffffff7f, %l2 = 0000000000000000
	ldstuba	[%i5+%g0]0x81,%l2	! %l2 = 000000ff000000ff
!	%l3 = 0000000000000000, %l1 = 85fb29b01a14b065, %l6  = ffffffffffffffff
	mulx	%l3,%l1,%l6		! %l6 = 0000000000000000
!	%l7 = 00000000ff0000ff, Mem[0000000010141410] = 00000000
	stha	%l7,[%i5+%o5]0x88	! Mem[0000000010141410] = 000000ff
!	%f23 = ff7f0000, Mem[0000000030001408] = ff000000
	sta	%f23,[%i0+%o4]0x81	! Mem[0000000030001408] = ff7f0000
!	Mem[0000000010081420] = 00000000, %l7 = 00000000ff0000ff, %asi = 80
	swapa	[%i2+0x020]%asi,%l7	! %l7 = 0000000000000000
!	%l1 = 85fb29b01a14b065, Mem[0000000030041400] = 0000af83
	stwa	%l1,[%i1+%g0]0x81	! Mem[0000000030041400] = 1a14b065
!	%l4 = 000000004049c358, Mem[0000000010001410] = 00000000
	stwa	%l4,[%i0+%o5]0x88	! Mem[0000000010001410] = 4049c358
!	Mem[0000000010001408] = ffc93203, %l7 = 0000000000000000
	swapa	[%i0+%o4]0x88,%l7	! %l7 = 00000000ffc93203
!	Mem[0000000010041418] = 00000000, %l4 = 4049c358, %l5 = 00000000
	add	%i1,0x18,%g1
	casa	[%g1]0x80,%l4,%l5	! %l5 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030081410] = e0000000, %l2 = 00000000000000ff
	ldsba	[%i2+%o5]0x89,%l2	! %l2 = 0000000000000000

p0_label_285:
!	Mem[00000000211c0000] = ff00980d, %l4 = 000000004049c358
	ldsba	[%o2+0x000]%asi,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010041418] = 00000000, %f8  = ffdbe53e
	lda	[%i1+0x018]%asi,%f8 	! %f8 = 00000000
!	Mem[0000000030101400] = ff000000, %l3 = 0000000000000000
	lduwa	[%i4+%g0]0x81,%l3	! %l3 = 00000000ff000000
!	Mem[0000000030041410] = 00000000e1374f03, %f4  = ff8d0000 ff000000
	ldda	[%i1+%o5]0x89,%f4 	! %f4  = 00000000 e1374f03
!	%l1 = 85fb29b01a14b065, %l7 = 00000000ffc93203, %l4 = ffffffffffffffff
	subc	%l1,%l7,%l4		! %l4 = 85fb29af1a4b7e62
!	Mem[0000000030041400] = 1a14b065, %l3 = 00000000ff000000
	lduwa	[%i1+%g0]0x81,%l3	! %l3 = 000000001a14b065
!	Mem[00000000300c1408] = 00000000 00000000, %l2 = 00000000, %l3 = 1a14b065
	ldda	[%i3+%o4]0x81,%l2	! %l2 = 0000000000000000 0000000000000000
!	Mem[00000000100c1410] = 4920665d, %l3 = 0000000000000000
	ldswa	[%i3+%o5]0x88,%l3	! %l3 = 000000004920665d
!	Mem[0000000030001408] = ff7f000000000000, %f8  = 00000000 034f37e1
	ldda	[%i0+%o4]0x81,%f8 	! %f8  = ff7f0000 00000000
!	Starting 10 instruction Store Burst
!	%l3 = 000000004920665d, Mem[0000000010001413] = 58c34940
	stb	%l3,[%i0+0x013]		! Mem[0000000010001410] = 58c3495d

p0_label_286:
!	%l4 = 85fb29af1a4b7e62, Mem[0000000010081410] = 00000060000000ff
	stx	%l4,[%i2+%o5]		! Mem[0000000010081410] = 85fb29af1a4b7e62
!	Mem[00000000300c1400] = ffffaf83, %l1 = 85fb29b01a14b065
	swapa	[%i3+%g0]0x81,%l1	! %l1 = 00000000ffffaf83
!	Mem[0000000030081410] = 000000e0, %l0 = 0000000000003203
	swapa	[%i2+%o5]0x81,%l0	! %l0 = 00000000000000e0
!	Mem[00000000100c1408] = ff0000ff, %l0 = 00000000000000e0
	swapa	[%i3+%o4]0x88,%l0	! %l0 = 00000000ff0000ff
!	Mem[0000000030001408] = 00007fff, %l5 = 0000000000000000
	ldstuba	[%i0+%o4]0x89,%l5	! %l5 = 000000ff000000ff
!	%f16 = ff000000 00000000 00000050 fccd3600
!	%f20 = ffffffff 00000000 0000b100 ff7f0000
!	%f24 = ffb3b676 00000000 896f2ef3 0332c9ff
!	%f28 = 4049c358 00000000 ff3d00b3 000000e4
	stda	%f16,[%i1]ASI_BLK_AIUP	! Block Store to 0000000010041400
!	%f10 = fb8d1aff 00000000, Mem[0000000030141400] = 7fffffff 000000ff
	stda	%f10,[%i5+%g0]0x89	! Mem[0000000030141400] = fb8d1aff 00000000
!	%l4 = 85fb29af1a4b7e62, Mem[0000000010181429] = 896f2ef3
	stb	%l4,[%i6+0x029]		! Mem[0000000010181428] = 89622ef3
!	%f7  = 60000000, Mem[00000000100c1404] = 00000000
	st	%f7 ,[%i3+0x004]	! Mem[00000000100c1404] = 60000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030081410] = 03320000, %f2  = 00000000
	lda	[%i2+%o5]0x89,%f2 	! %f2 = 03320000

p0_label_287:
	membar	#Sync			! Added by membar checker (46)
!	Mem[0000000010041408] = 00000050fccd3600, %f14 = ffdbe53e afffffff
	ldda	[%i1+%o4]0x80,%f14	! %f14 = 00000050 fccd3600
!	Mem[0000000030101408] = ffc93203, %l2 = 0000000000000000
	ldswa	[%i4+%o4]0x81,%l2	! %l2 = ffffffffffc93203
!	Mem[0000000010001410] = 58c3495d, %l2 = ffffffffffc93203
	ldswa	[%i0+%o5]0x80,%l2	! %l2 = 0000000058c3495d
!	Mem[0000000030081400] = ff00ff00, %l2 = 0000000058c3495d
	ldsha	[%i2+%g0]0x89,%l2	! %l2 = ffffffffffffff00
!	Mem[0000000010181418] = 0000b100, %l1 = 00000000ffffaf83
	ldsha	[%i6+0x01a]%asi,%l1	! %l1 = ffffffffffffb100
!	%l5 = 00000000000000ff, imm = fffffffffffffab1, %l2 = ffffffffffffff00
	addc	%l5,-0x54f,%l2		! %l2 = fffffffffffffbb0
!	Mem[00000000218001c0] = 1afff4cf, %l3 = 000000004920665d
	ldub	[%o3+0x1c0],%l3		! %l3 = 000000000000001a
!	Mem[0000000030101410] = 00000000, %f26 = 896f2ef3
	lda	[%i4+%o5]0x81,%f26	! %f26 = 00000000
!	Mem[000000001018140c] = fccd3600, %l6 = 0000000000000000
	ldsw	[%i6+0x00c],%l6		! %l6 = fffffffffccd3600
!	Starting 10 instruction Store Burst
!	%f12 = 00000000, Mem[00000000100c1410] = 4920665d
	sta	%f12,[%i3+%o5]0x88	! Mem[00000000100c1410] = 00000000

p0_label_288:
!	%l6 = fffffffffccd3600, Mem[0000000030141410] = 00000000
	stha	%l6,[%i5+%o5]0x89	! Mem[0000000030141410] = 00003600
!	Mem[0000000030101410] = 00000000, %l3 = 000000000000001a
	swapa	[%i4+%o5]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000030081410] = 03320000, %l3 = 0000000000000000
	ldstuba	[%i2+%o5]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010041410] = ffffffff, %l3 = 0000000000000000
	ldstuba	[%i1+%o5]0x88,%l3	! %l3 = 000000ff000000ff
!	%l3 = 00000000000000ff, Mem[0000000030001408] = ff7f0000
	stba	%l3,[%i0+%o4]0x81	! Mem[0000000030001408] = ff7f0000
!	Mem[0000000010141400] = 30fb00ff, %l1 = ffffffffffffb100
	swapa	[%i5+%g0]0x88,%l1	! %l1 = 0000000030fb00ff
!	%l2 = fffffffffffffbb0, Mem[0000000030181400] = ff000000
	stwa	%l2,[%i6+%g0]0x81	! Mem[0000000030181400] = fffffbb0
!	Mem[0000000010081408] = ffff0000, %l2 = fffffffffffffbb0
	ldstuba	[%i2+%o4]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010041410] = ffffffff, %l6 = fffffffffccd3600
	swapa	[%i1+%o5]0x88,%l6	! %l6 = 00000000ffffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = 00000050, %l2 = 0000000000000000
	ldsb	[%i1+0x009],%l2		! %l2 = 0000000000000000

p0_label_289:
!	Mem[0000000010081410] = 85fb29af1a4b7e62, %l4 = 85fb29af1a4b7e62
	ldxa	[%i2+%o5]0x80,%l4	! %l4 = 85fb29af1a4b7e62
!	Mem[000000001010142c] = ffffffff, %l4 = 85fb29af1a4b7e62
	ldsw	[%i4+0x02c],%l4		! %l4 = ffffffffffffffff
!	%l7 = 00000000ffc93203, %l4 = ffffffffffffffff, %l6 = 00000000ffffffff
	andn	%l7,%l4,%l6		! %l6 = 0000000000000000
!	%l3 = 00000000000000ff, immed = fffff766, %y  = 00003203
	smul	%l3,-0x89a,%l5		! %l5 = fffffffffff76e9a, %y = ffffffff
!	Mem[00000000300c1408] = 00000000, %l7 = 00000000ffc93203
	lduwa	[%i3+%o4]0x81,%l7	! %l7 = 0000000000000000
!	%l7 = 0000000000000000, imm = 0000000000000a13, %l2 = 0000000000000000
	xor	%l7,0xa13,%l2		! %l2 = 0000000000000a13
!	%l4 = ffffffffffffffff, imm = fffffffffffff3ae, %l4 = ffffffffffffffff
	add	%l4,-0xc52,%l4		! %l4 = fffffffffffff3ad
!	Mem[0000000030101400] = ff00000000000000, %l5 = fffffffffff76e9a
	ldxa	[%i4+%g0]0x81,%l5	! %l5 = ff00000000000000
!	Mem[0000000010041424] = 00000000, %l2 = 0000000000000a13
	lduba	[%i1+0x026]%asi,%l2	! %l2 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010041415] = 00000000, %l6 = 0000000000000000
	ldstuba	[%i1+0x015]%asi,%l6	! %l6 = 00000000000000ff

p0_label_290:
!	Mem[0000000030081408] = 00000000, %l7 = 0000000000000000
	swapa	[%i2+%o4]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000010141420] = ffffff7f, %l3 = 00000000000000ff
	ldstub	[%i5+0x020],%l3		! %l3 = 000000ff000000ff
!	%f22 = 0000b100 ff7f0000, %l4 = fffffffffffff3ad
!	Mem[00000000100c1400] = 0000000060000000
	stda	%f22,[%i3+%l4]ASI_PST8_PL ! Mem[00000000100c1400] = 00007fff60b10000
!	%l6 = 0000000000000000, Mem[0000000010141434] = 00000000, %asi = 80
	stwa	%l6,[%i5+0x034]%asi	! Mem[0000000010141434] = 00000000
!	%l0 = 00000000ff0000ff, Mem[0000000030101410] = 0000001a
	stha	%l0,[%i4+%o5]0x81	! Mem[0000000030101410] = 00ff001a
!	Mem[00000000300c1400] = 65b0141a, %l5 = ff00000000000000
	ldstuba	[%i3+%g0]0x89,%l5	! %l5 = 0000001a000000ff
!	%l7 = 0000000000000000, Mem[0000000010141410] = ff000000
	stha	%l7,[%i5+%o5]0x80	! Mem[0000000010141410] = 00000000
!	%f7  = 60000000, %f3  = 00000000, %f28 = 4049c358
	fmuls	%f7 ,%f3 ,%f28		! %f28 = 00000000
!	%f16 = ff000000 00000000 00000050 fccd3600
!	%f20 = ffffffff 00000000 0000b100 ff7f0000
!	%f24 = ffb3b676 00000000 00000000 0332c9ff
!	%f28 = 00000000 00000000 ff3d00b3 000000e4
	stda	%f16,[%i1]ASI_BLK_AIUSL	! Block Store to 0000000030041400
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = ffff00ff, %l7 = 0000000000000000
	ldswa	[%i2+%o4]0x88,%l7	! %l7 = ffffffffffff00ff

p0_label_291:
!	%l0 = 00000000ff0000ff, %l1 = 0000000030fb00ff, %l3 = 00000000000000ff
	udivx	%l0,%l1,%l3		! %l3 = 0000000000000005
!	Mem[00000000300c1408] = 0000000000000000, %l6 = 0000000000000000
	ldxa	[%i3+%o4]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000010081408] = ffff00ff, %l7 = ffffffffffff00ff
	lduba	[%i2+%o4]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[00000000300c1410] = ff8d0000ff000000, %l2 = 0000000000000000
	ldxa	[%i3+%o5]0x81,%l2	! %l2 = ff8d0000ff000000
!	Mem[000000001010141c] = ffffaf83, %l4 = fffffffffffff3ad
	ldsw	[%i4+0x01c],%l4		! %l4 = ffffffffffffaf83
!	Mem[0000000030181408] = fb8d00ff, %f14 = 00000050
	lda	[%i6+%o4]0x89,%f14	! %f14 = fb8d00ff
!	Mem[00000000300c1400] = 65b014ff, %l5 = 000000000000001a
	ldsha	[%i3+%g0]0x89,%l5	! %l5 = 00000000000014ff
!	Mem[0000000010081400] = 000000e0 00000000, %l6 = 00000000, %l7 = 000000ff
	ldda	[%i2+%g0]0x88,%l6	! %l6 = 0000000000000000 00000000000000e0
!	Mem[0000000030141410] = 0036000000ff0000, %f8  = ff7f0000 00000000
	ldda	[%i5+%o5]0x81,%f8 	! %f8  = 00360000 00ff0000
!	Starting 10 instruction Store Burst
!	%l6 = 00000000, %l7 = 000000e0, Mem[0000000010001428] = 00000000 000000ff
	stda	%l6,[%i0+0x028]%asi	! Mem[0000000010001428] = 00000000 000000e0

p0_label_292:
	membar	#Sync			! Added by membar checker (47)
!	%f16 = ff000000 00000000 00000050 fccd3600
!	%f20 = ffffffff 00000000 0000b100 ff7f0000
!	%f24 = ffb3b676 00000000 00000000 0332c9ff
!	%f28 = 00000000 00000000 ff3d00b3 000000e4
	stda	%f16,[%i1]ASI_COMMIT_S	! Block Store to 0000000030041400
!	%f8  = 00360000, Mem[00000000300c1400] = 65b014ff
	sta	%f8 ,[%i3+%g0]0x89	! Mem[00000000300c1400] = 00360000
!	Mem[0000000010141410] = 00000000, %l2 = ff8d0000ff000000
	swapa	[%i5+%o5]0x80,%l2	! %l2 = 0000000000000000
!	%f6  = fffff5f0 60000000, Mem[0000000030101410] = 00ff001a 00000000
	stda	%f6 ,[%i4+%o5]0x81	! Mem[0000000030101410] = fffff5f0 60000000
!	Mem[0000000010141400] = ffffb100, %l3 = 0000000000000005
	ldstuba	[%i5+%g0]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010181430] = 0000000100000000, %l6 = 0000000000000000, %l4 = ffffffffffffaf83
	add	%i6,0x30,%g1
	casxa	[%g1]0x80,%l6,%l4	! %l4 = 0000000100000000
!	%l4 = 0000000100000000, Mem[00000000100c1400] = 00007fff
	stwa	%l4,[%i3+%g0]0x80	! Mem[00000000100c1400] = 00000000
!	Mem[0000000030001410] = 000000ff, %l6 = 0000000000000000
	ldstuba	[%i0+%o5]0x81,%l6	! %l6 = 00000000000000ff
!	%l2 = 0000000000000000, Mem[00000000100c1434] = ff000000
	stw	%l2,[%i3+0x034]		! Mem[00000000100c1434] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = 5d662049, %l2 = 0000000000000000
	ldsha	[%i4+%g0]0x80,%l2	! %l2 = 0000000000005d66

p0_label_293:
!	Mem[0000000030101408] = ffc93203, %l2 = 0000000000005d66
	lduwa	[%i4+%o4]0x81,%l2	! %l2 = 00000000ffc93203
!	Mem[0000000010181428] = 89622ef3, %l6 = 0000000000000000
	ldsh	[%i6+0x028],%l6		! %l6 = ffffffffffff8962
!	%f10 = fb8d1aff, %f12 = 00000000, %f14 = fb8d00ff fccd3600
	fsmuld	%f10,%f12,%f14		! %f14 = 80000000 00000000
!	Mem[00000000300c1410] = 00008dff, %l2 = 00000000ffc93203
	lduwa	[%i3+%o5]0x89,%l2	! %l2 = 0000000000008dff
!	Mem[0000000010081408] = ffff00ff, %l4 = 0000000100000000
	ldsha	[%i2+%o4]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010181408] = 00000050, %l7 = 00000000000000e0
	lduwa	[%i6+%o4]0x80,%l7	! %l7 = 0000000000000050
!	Mem[0000000010001408] = 00000000, %l1 = 0000000030fb00ff
	lduwa	[%i0+%o4]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010181408] = 00000050, %l1 = 0000000000000000
	lduha	[%i6+%o4]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000030181400] = fffffbb0, %l4 = 00000000000000ff
	ldsba	[%i6+%g0]0x81,%l4	! %l4 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%f4  = 00000000 e1374f03, %l1 = 0000000000000000
!	Mem[0000000010141418] = ffffadffffffaf83
	add	%i5,0x018,%g1
	stda	%f4,[%g1+%l1]ASI_PST16_P ! Mem[0000000010141418] = ffffadffffffaf83

p0_label_294:
!	%f8  = 00360000 00ff0000, Mem[0000000010181408] = 00000050 fccd3600
	stda	%f8 ,[%i6+0x008]%asi	! Mem[0000000010181408] = 00360000 00ff0000
!	%f2  = 03320000 00000000, %l5 = 00000000000014ff
!	Mem[0000000010081400] = 00000000e0000000
	stda	%f2,[%i2+%l5]ASI_PST32_P ! Mem[0000000010081400] = 0332000000000000
!	%l0 = 00000000ff0000ff, Mem[0000000020800000] = ff7f17e8
	stb	%l0,[%o1+%g0]		! Mem[0000000020800000] = ff7f17e8
!	Mem[0000000030141408] = 00000000, %l3 = 0000000000000000
	ldstuba	[%i5+%o4]0x81,%l3	! %l3 = 00000000000000ff
!	%l5 = 00000000000014ff, Mem[0000000030101408] = 0332c9ff
	stba	%l5,[%i4+%o4]0x89	! Mem[0000000030101408] = 0332c9ff
!	%f10 = fb8d1aff 00000000, Mem[0000000030001400] = 00000000 fb8d1aff
	stda	%f10,[%i0+%g0]0x89	! Mem[0000000030001400] = fb8d1aff 00000000
!	%l5 = 00000000000014ff, imm = fffffffffffff373, %l5 = 00000000000014ff
	sub	%l5,-0xc8d,%l5		! %l5 = 000000000000218c
!	Mem[0000000010101400] = 4920665d, %l3 = 0000000000000000
	ldstuba	[%i4+%g0]0x88,%l3	! %l3 = 0000005d000000ff
!	Mem[0000000030001408] = 00007fff, %l2 = 0000000000008dff
	swapa	[%i0+%o4]0x89,%l2	! %l2 = 0000000000007fff
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = ff8d0000, %l4 = ffffffffffffffff
	lduha	[%i3+%o5]0x81,%l4	! %l4 = 000000000000ff8d

p0_label_295:
!	Mem[0000000030141410] = 00003600, %f7  = 60000000
	lda	[%i5+%o5]0x89,%f7 	! %f7 = 00003600
!	Mem[0000000030001410] = ff0000ff, %l3 = 000000000000005d
	ldswa	[%i0+%o5]0x89,%l3	! %l3 = ffffffffff0000ff
!	Mem[0000000020800000] = ff7f17e8, %l1 = 0000000000000000
	ldsb	[%o1+0x001],%l1		! %l1 = 000000000000007f
	membar	#Sync			! Added by membar checker (48)
!	Mem[0000000010041410] = 0036cdfc, %l3 = ffffffffff0000ff
	ldsha	[%i1+%o5]0x80,%l3	! %l3 = 0000000000000036
!	Mem[0000000010041408] = 00000050, %f30 = ff3d00b3
	lda	[%i1+%o4]0x80,%f30	! %f30 = 00000050
!	%l0 = 00000000ff0000ff, %l1 = 000000000000007f, %l6 = ffffffffffff8962
	udivx	%l0,%l1,%l6		! %l6 = 000000000202040a
!	Mem[0000000030081410] = 033200ff, %f0  = ffffaf83
	lda	[%i2+%o5]0x89,%f0 	! %f0 = 033200ff
!	Mem[0000000010181408] = 00360000, %l5 = 000000000000218c
	lduba	[%i6+%o4]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000010181400] = 000000000000ffff, %l0 = 00000000ff0000ff
	ldxa	[%i6+%g0]0x88,%l0	! %l0 = 000000000000ffff
!	Starting 10 instruction Store Burst
!	%f23 = ff7f0000, Mem[0000000030081408] = 00000000
	sta	%f23,[%i2+%o4]0x81	! Mem[0000000030081408] = ff7f0000

p0_label_296:
!	Mem[0000000010001421] = 30fb00ff, %l6 = 000000000202040a
	ldstub	[%i0+0x021],%l6		! %l6 = 000000fb000000ff
!	Mem[0000000020800041] = ff00226c, %l4 = 000000000000ff8d
	ldstuba	[%o1+0x041]%asi,%l4	! %l4 = 00000000000000ff
!	%f12 = 00000000 00000000, Mem[0000000030181400] = fffffbb0 ff000000
	stda	%f12,[%i6+%g0]0x81	! Mem[0000000030181400] = 00000000 00000000
!	%f18 = 00000050 fccd3600, %f8  = 00360000
	fdtoi	%f18,%f8 		! %l0 = 0000000000010021, Unfinished, %fsr = 2700000800
!	%l3 = 0000000000000036, Mem[0000000010041408] = 00000050fccd3600
	stx	%l3,[%i1+%o4]		! Mem[0000000010041408] = 0000000000000036
!	%l7 = 0000000000000050, Mem[0000000030101400] = 000000ff
	stha	%l7,[%i4+%g0]0x89	! Mem[0000000030101400] = 00000050
!	%f20 = ffffffff 00000000, %l0 = 0000000000010021
!	Mem[0000000030181408] = ff008dfb00000083
	add	%i6,0x008,%g1
	stda	%f20,[%g1+%l0]ASI_PST8_S ! Mem[0000000030181408] = ff00fffb00000000
!	%l6 = 00000000000000fb, Mem[0000000010101400] = ff662049
	stha	%l6,[%i4+%g0]0x80	! Mem[0000000010101400] = 00fb2049
!	%l5 = 0000000000000000, Mem[0000000010141410] = ff00000000000000, %asi = 80
	stxa	%l5,[%i5+0x010]%asi	! Mem[0000000010141410] = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = ffffffff, %l3 = 0000000000000036
	lduha	[%i6+%o5]0x80,%l3	! %l3 = 000000000000ffff

p0_label_297:
!	Mem[00000000201c0000] = ff0019af, %l4 = 0000000000000000
	lduh	[%o0+%g0],%l4		! %l4 = 000000000000ff00
!	Mem[0000000030181408] = ff00fffb, %l2 = 0000000000007fff
	ldswa	[%i6+%o4]0x81,%l2	! %l2 = ffffffffff00fffb
!	%f18 = 00000050, %f31 = 000000e4, %f8  = 00360000
	fdivs	%f18,%f31,%f8 		! %l0 = 0000000000010043, Unfinished, %fsr = 2700000800
!	Mem[00000000100c1410] = 00000000, %l6 = 00000000000000fb
	lduwa	[%i3+%o5]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000010081410] = 85fb29af1a4b7e62, %l4 = 000000000000ff00
	ldxa	[%i2+%o5]0x80,%l4	! %l4 = 85fb29af1a4b7e62
!	Mem[0000000030001408] = 00008dff, %l7 = 0000000000000050
	lduwa	[%i0+%o4]0x89,%l7	! %l7 = 0000000000008dff
!	Mem[00000000201c0000] = ff0019af, %l4 = 85fb29af1a4b7e62
	lduh	[%o0+%g0],%l4		! %l4 = 000000000000ff00
!	Mem[0000000030101408] = ffc93203, %l1 = 000000000000007f
	lduha	[%i4+%o4]0x81,%l1	! %l1 = 000000000000ffc9
!	Mem[0000000010101408] = 0000000000000000, %l1 = 000000000000ffc9
	ldxa	[%i4+%o4]0x88,%l1	! %l1 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1410] = ff8d0000, %l7 = 0000000000008dff
	swapa	[%i3+%o5]0x81,%l7	! %l7 = 00000000ff8d0000

p0_label_298:
!	%f3  = 00000000, Mem[0000000010101408] = 00000000
	sta	%f3 ,[%i4+%o4]0x80	! Mem[0000000010101408] = 00000000
!	%f20 = ffffffff 00000000, %l0 = 0000000000010043
!	Mem[0000000010181408] = 0036000000ff0000
	add	%i6,0x008,%g1
	stda	%f20,[%g1+%l0]ASI_PST32_P ! Mem[0000000010181408] = ffffffff00000000
!	%l6 = 00000000, %l7 = ff8d0000, Mem[00000000100c1400] = 00000000 60b10000
	std	%l6,[%i3+%g0]		! Mem[00000000100c1400] = 00000000 ff8d0000
!	%f24 = ffb3b676 00000000, Mem[0000000030001400] = 00000000 ff1a8dfb
	stda	%f24,[%i0+%g0]0x81	! Mem[0000000030001400] = ffb3b676 00000000
!	%l2 = ffffffffff00fffb, Mem[0000000030041400] = ff00000000000000
	stxa	%l2,[%i1+%g0]0x81	! Mem[0000000030041400] = ffffffffff00fffb
!	Mem[0000000010041410] = fccd3600, %l5 = 0000000000000000
	swapa	[%i1+%o5]0x88,%l5	! %l5 = 00000000fccd3600
!	%f0  = 033200ff ff000000, Mem[0000000030081410] = 033200ff ff00fb30
	stda	%f0 ,[%i2+%o5]0x89	! Mem[0000000030081410] = 033200ff ff000000
!	%f12 = 00000000, Mem[0000000010041410] = 00000000
	sta	%f12,[%i1+%o5]0x80	! Mem[0000000010041410] = 00000000
!	%l3 = 000000000000ffff, Mem[0000000010101410] = 00003e00
	stha	%l3,[%i4+%o5]0x88	! Mem[0000000010101410] = 0000ffff
!	Starting 10 instruction Load Burst
!	Mem[0000000020800040] = ffff226c, %l5 = 00000000fccd3600
	ldub	[%o1+0x040],%l5		! %l5 = 00000000000000ff

p0_label_299:
!	Mem[0000000030181408] = ff00fffb, %l5 = 00000000000000ff
	lduba	[%i6+%o4]0x81,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010181400] = ffff0000, %f10 = fb8d1aff
	lda	[%i6+%g0]0x80,%f10	! %f10 = ffff0000
!	Code Fragment 3
p0_fragment_26:
!	%l0 = 0000000000010043
	setx	0x55dcd66fc14e8dd5,%g7,%l0 ! %l0 = 55dcd66fc14e8dd5
!	%l1 = 0000000000000000
	setx	0x83f9ed3ff819eed2,%g7,%l1 ! %l1 = 83f9ed3ff819eed2
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 55dcd66fc14e8dd5
	setx	0xd09e9ddfdbdbf378,%g7,%l0 ! %l0 = d09e9ddfdbdbf378
!	%l1 = 83f9ed3ff819eed2
	setx	0xf8d6f897c66eb368,%g7,%l1 ! %l1 = f8d6f897c66eb368
!	Mem[0000000030041410] = ffffffff, %f12 = 00000000
	lda	[%i1+%o5]0x89,%f12	! %f12 = ffffffff
!	Mem[00000000300c1400] = 00003600, %l0 = d09e9ddfdbdbf378
	ldsba	[%i3+%g0]0x81,%l0	! %l0 = 0000000000000000
!	Mem[00000000300c1410] = ff8d0000, %l3 = 000000000000ffff
	ldsha	[%i3+%o5]0x89,%l3	! %l3 = 0000000000000000
!	%l7 = 00000000ff8d0000, immed = fffffb6d, %y  = ffffffff
	sdiv	%l7,-0x493,%l2		! %l2 = 0000000000001924
	mov	%l0,%y			! %y = 00000000
!	Mem[0000000030101410] = f0f5ffff, %l4 = 000000000000ff00
	lduwa	[%i4+%o5]0x89,%l4	! %l4 = 00000000f0f5ffff
!	Mem[0000000010141408] = ff000000, %l0 = 0000000000000000
	lduwa	[%i5+%o4]0x80,%l0	! %l0 = 00000000ff000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010141400] = ffffb1ff, %l2 = 0000000000001924
	swapa	[%i5+%g0]0x88,%l2	! %l2 = 00000000ffffb1ff

p0_label_300:
!	Mem[0000000030041400] = ffffffff, %l3 = 0000000000000000
	swapa	[%i1+%g0]0x81,%l3	! %l3 = 00000000ffffffff
!	Mem[0000000030141410] = 00360000, %l4 = 00000000f0f5ffff
	ldstuba	[%i5+%o5]0x81,%l4	! %l4 = 00000000000000ff
!	Mem[00000000100c1410] = 00000000, %l2 = 00000000ffffb1ff
	ldstuba	[%i3+%o5]0x80,%l2	! %l2 = 00000000000000ff
!	%l1 = f8d6f897c66eb368, Mem[000000001018142a] = 89622ef3, %asi = 80
	stha	%l1,[%i6+0x02a]%asi	! Mem[0000000010181428] = 8962b368
!	%l3 = 00000000ffffffff, Mem[0000000010101410] = 0000ffff
	stwa	%l3,[%i4+%o5]0x88	! Mem[0000000010101410] = ffffffff
!	Mem[00000000100c140c] = 000000ff, %l5 = 00000000000000ff, %asi = 80
	swapa	[%i3+0x00c]%asi,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010001404] = e0000000, %l4 = 00000000, %l0 = ff000000
	add	%i0,0x04,%g1
	casa	[%g1]0x80,%l4,%l0	! %l0 = 00000000e0000000
!	Mem[0000000010081400] = 03320000, %l3 = 00000000ffffffff
	ldstuba	[%i2+%g0]0x80,%l3	! %l3 = 00000003000000ff
!	%f17 = 00000000, Mem[0000000010141408] = ff000000
	sta	%f17,[%i5+%o4]0x80	! Mem[0000000010141408] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[000000001004141c] = ff7f0000, %f5  = e1374f03
	lda	[%i1+0x01c]%asi,%f5 	! %f5 = ff7f0000

	ba,a	p0_not_taken_0_end
p0_not_taken_0:
!	The following code should not be executed
	nop
	sub	%l4,%l1,%l6
	lduha	[%i4+0x00e]%asi,%l0
	ba,a	p0_branch_failed
p0_not_taken_0_end:


!	End of Random Code for Thread 0


!	Check Registers

p0_check_registers:
	set	p0_expected_registers,%g1
	ldx	[%g1+0x000],%g2
	cmp	%l0,%g2			! %l0 should be 00000000e0000000
	bne,a,pn %xcc,p0_reg_l0_fail
	mov	%l0,%g3
	ldx	[%g1+0x008],%g2
	cmp	%l1,%g2			! %l1 should be f8d6f897c66eb368
	bne,a,pn %xcc,p0_reg_l1_fail
	mov	%l1,%g3
	ldx	[%g1+0x010],%g2
	cmp	%l2,%g2			! %l2 should be 0000000000000000
	bne,a,pn %xcc,p0_reg_l2_fail
	mov	%l2,%g3
	ldx	[%g1+0x018],%g2
	cmp	%l3,%g2			! %l3 should be 0000000000000003
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
	cmp	%l6,%g2			! %l6 should be 0000000000000000
	bne,a,pn %xcc,p0_reg_l6_fail
	mov	%l6,%g3
	ldx	[%g1+0x038],%g2
	cmp	%l7,%g2			! %l7 should be 00000000ff8d0000
	bne,a,pn %xcc,p0_reg_l7_fail
	mov	%l7,%g3

!	Check Floating Point Registers

p0_check_fp_registers:
	set	p0_expected_fp_regs,%g3
	std	%f0,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x00],%l0
	cmp	%l0,%l1			! %f0  should be 033200ff ff000000
	bne	%xcc,p0_f0_fail
	std	%f2,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x08],%l0
	cmp	%l0,%l1			! %f2  should be 03320000 00000000
	bne	%xcc,p0_f2_fail
	std	%f4,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x10],%l0
	cmp	%l0,%l1			! %f4  should be 00000000 ff7f0000
	bne	%xcc,p0_f4_fail
	std	%f6,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x18],%l0
	cmp	%l0,%l1			! %f6  should be fffff5f0 00003600
	bne	%xcc,p0_f6_fail
	std	%f8,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x20],%l0
	cmp	%l0,%l1			! %f8  should be 00360000 00ff0000
	bne	%xcc,p0_f8_fail
	std	%f10,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x28],%l0
	cmp	%l0,%l1			! %f10 should be ffff0000 00000000
	bne	%xcc,p0_f10_fail
	std	%f12,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x30],%l0
	cmp	%l0,%l1			! %f12 should be ffffffff 00000000
	bne	%xcc,p0_f12_fail
	std	%f14,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x38],%l0
	cmp	%l0,%l1			! %f14 should be 80000000 00000000
	bne	%xcc,p0_f14_fail
	std	%f16,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x40],%l0
	cmp	%l0,%l1			! %f16 should be ff000000 00000000
	bne	%xcc,p0_f16_fail
	std	%f18,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x48],%l0
	cmp	%l0,%l1			! %f18 should be 00000050 fccd3600
	bne	%xcc,p0_f18_fail
	std	%f20,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x50],%l0
	cmp	%l0,%l1			! %f20 should be ffffffff 00000000
	bne	%xcc,p0_f20_fail
	std	%f22,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x58],%l0
	cmp	%l0,%l1			! %f22 should be 0000b100 ff7f0000
	bne	%xcc,p0_f22_fail
	std	%f24,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x60],%l0
	cmp	%l0,%l1			! %f24 should be ffb3b676 00000000
	bne	%xcc,p0_f24_fail
	std	%f26,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x68],%l0
	cmp	%l0,%l1			! %f26 should be 00000000 0332c9ff
	bne	%xcc,p0_f26_fail
	std	%f28,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x70],%l0
	cmp	%l0,%l1			! %f28 should be 00000000 00000000
	bne	%xcc,p0_f28_fail
	std	%f30,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x78],%l0
	cmp	%l0,%l1			! %f30 should be 00000050 000000e4
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
	mulx	%l5,0xb9f,%l4
	add	%l0,%l2,%l1
	done

p0_trap1o:
	mulx	%l5,0xb9f,%l4
	add	%l0,%l2,%l1
	done


p0_trap2e:
	or	%l3,-0x0fc,%l1
	or	%l5,%l4,%l0
	xor	%l7,%l1,%l0
	andn	%l3,-0x3a3,%l6
	orn	%l5,0xc64,%l2
	udivx	%l0,-0x37c,%l7
	done

p0_trap2o:
	or	%l3,-0x0fc,%l1
	or	%l5,%l4,%l0
	xor	%l7,%l1,%l0
	andn	%l3,-0x3a3,%l6
	orn	%l5,0xc64,%l2
	udivx	%l0,-0x37c,%l7
	done


p0_trap3e:
	xnor	%l2,-0x99f,%l3
	add	%l5,%l3,%l2
	sub	%l3,%l5,%l6
	subc	%l1,%l1,%l4
	done

p0_trap3o:
	xnor	%l2,-0x99f,%l3
	add	%l5,%l3,%l2
	sub	%l3,%l5,%l6
	subc	%l1,%l1,%l4
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
	ldx	[%g1+0x000],%l0		! %l0 = 1464a3286bd6d300
	ldx	[%g1+0x008],%l1		! %l1 = 38bb34c03e7637d6
	ldx	[%g1+0x010],%l2		! %l2 = 442ab8884b6f1614
	ldx	[%g1+0x018],%l3		! %l3 = 08b3573df3f2a20a
	ldx	[%g1+0x020],%l4		! %l4 = 5dae98bc0f975740
	ldx	[%g1+0x028],%l5		! %l5 = b64e5972097fcbb5
	ldx	[%g1+0x030],%l6		! %l6 = 5dd1a632547327ab
	ldx	[%g1+0x038],%l7		! %l7 = 08d9fb3230ee1634

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
	orn	%l0,0x469,%l2
	and	%l4,%l3,%l5
	add	%l4,%l7,%l2
	and	%l7,%l0,%l6
	jmpl	%o7,%g0
	smul	%l3,%l4,%l0
p0_near_0_he:
	udivx	%l0,%l4,%l3
	udivx	%l7,0x3aa,%l3
	fsubs	%f30,%f25,%f18
	fcmps	%fcc0,%f18,%f23
	jmpl	%o7,%g0
	and	%l6,-0xcf0,%l4
near0_b2b_h:
	fmuls	%f21,%f27,%f18
	fsubs	%f23,%f25,%f19
	mulx	%l5,%l5,%l5
	jmpl	%o7,%g0
	subc	%l5,%l5,%l1
near0_b2b_l:
	smul	%l6,-0xddb,%l3
	and	%l7,%l6,%l0
	mulx	%l3,0x264,%l6
	jmpl	%o7,%g0
	sub	%l0,%l3,%l0
user_near0_end:
	.seg	"text"
	.align	0x2000
user_near1_start:
p0_near_1_le:
	jmpl	%o7,%g0
	fsubs	%f10,%f6 ,%f12
	jmpl	%o7,%g0
	nop
p0_near_1_he:
	mulx	%l1,-0xe26,%l3
	mulx	%l5,%l3,%l5
	add	%l4,0x02d,%l4
	jmpl	%o7,%g0
	add	%l1,0x1f4,%l5
near1_b2b_h:
	jmpl	%o7,%g0
	fdivs	%f29,%f26,%f16
	jmpl	%o7,%g0
	nop
near1_b2b_l:
	jmpl	%o7,%g0
	smul	%l4,-0x3b1,%l0
	jmpl	%o7,%g0
	nop
user_near1_end:
	.seg	"text"
	.align	0x2000
user_near2_start:
p0_near_2_le:
	fmuls	%f13,%f10,%f2 
	fmuls	%f10,%f7 ,%f1 
	jmpl	%o7,%g0
	sdivx	%l1,%l5,%l6
p0_near_2_he:
	or	%l4,0x99d,%l1
	xnor	%l1,%l3,%l1
	jmpl	%o7,%g0
	udivx	%l1,%l1,%l2
near2_b2b_h:
	fcmps	%fcc1,%f25,%f24
	subc	%l7,%l1,%l7
	mulx	%l4,%l6,%l7
	fcmps	%fcc1,%f18,%f16
	jmpl	%o7,%g0
	fadds	%f26,%f19,%f26
near2_b2b_l:
	udivx	%l0,%l5,%l2
	fsqrts	%f2 ,%f4 
	or	%l2,0xf61,%l0
	orn	%l2,%l5,%l3
	jmpl	%o7,%g0
	umul	%l0,0x305,%l1
user_near2_end:
	.seg	"text"
	.align	0x2000
user_near3_start:
p0_near_3_le:
	addc	%l7,%l0,%l3
	subc	%l1,-0xd38,%l0
	andn	%l6,-0x93d,%l2
	jmpl	%o7,%g0
	fsubs	%f8 ,%f8 ,%f3 
p0_near_3_he:
	ldsw	[%i4+0x030],%l7		! Mem[0000000010101430]
	stw	%l3,[%i6+0x028]		! Mem[0000000010181428]
	xor	%l1,%l1,%l5
	smul	%l2,0xcc6,%l4
	sub	%l0,%l4,%l6
	fcmps	%fcc1,%f18,%f24
	nop
	jmpl	%o7,%g0
	xnor	%l1,%l1,%l3
near3_b2b_h:
	smul	%l5,-0x242,%l6
	umul	%l4,%l4,%l6
	xnor	%l7,0x0f2,%l0
	jmpl	%o7,%g0
	fdivs	%f21,%f17,%f31
near3_b2b_l:
	or	%l3,-0x985,%l1
	andn	%l6,0x92c,%l2
	fsqrts	%f7 ,%f6 
	jmpl	%o7,%g0
	xnor	%l1,-0x4ff,%l0
user_near3_end:
	.seg	"text"
	.text
	.align	0x2000
user_far0_start:
p0_far_0_le:
	fmuls	%f11,%f12,%f1 
	or	%l0,-0xd57,%l4
	and	%l5,-0x467,%l0
	jmpl	%o7,%g0
	xor	%l6,%l5,%l3
p0_far_0_lem:
	fmuls	%f11,%f12,%f1 
	or	%l0,-0xd57,%l4
	and	%l5,-0x467,%l0
	jmpl	%o7,%g0
	xor	%l6,%l5,%l3
p0_far_0_he:
	fcmps	%fcc2,%f27,%f27
	fmuls	%f19,%f17,%f29
	xor	%l3,-0x095,%l6
	xnor	%l0,%l3,%l3
	fsqrts	%f23,%f18
	umul	%l1,-0xc81,%l5
	sub	%l2,%l3,%l7
	jmpl	%o7,%g0
	and	%l0,0x70a,%l0
p0_far_0_hem:
	fcmps	%fcc2,%f27,%f27
	fmuls	%f19,%f17,%f29
	xor	%l3,-0x095,%l6
	xnor	%l0,%l3,%l3
	fsqrts	%f23,%f18
	umul	%l1,-0xc81,%l5
	sub	%l2,%l3,%l7
	jmpl	%o7,%g0
	and	%l0,0x70a,%l0
p0_loop_branch_0:
	jmpl	%o7+12,%g0
	add	%l0,1,%l0
far0_b2b_h:
	and	%l3,%l6,%l7
	add	%l7,%l0,%l2
	fsubs	%f24,%f29,%f17
	jmpl	%o7,%g0
	addc	%l7,%l6,%l7
far0_b2b_l:
	fcmps	%fcc3,%f12,%f3 
	addc	%l2,0x5ac,%l3
	addc	%l3,0x88b,%l0
	jmpl	%o7,%g0
	xor	%l0,%l4,%l5
user_far0_end:
	.seg	"text"
	.text
	.align	0x2000
user_far1_start:
p0_far_1_le:
	smul	%l2,-0x31b,%l6
	jmpl	%o7,%g0
	xor	%l4,%l6,%l6
p0_far_1_lem:
	smul	%l2,-0x31b,%l6
	jmpl	%o7,%g0
	xor	%l4,%l6,%l6
p0_far_1_he:
	fmuls	%f17,%f17,%f19
	jmpl	%o7,%g0
	umul	%l0,0xe43,%l0
p0_far_1_hem:
	fmuls	%f17,%f17,%f19
	jmpl	%o7,%g0
	umul	%l0,0xe43,%l0
p0_loop_branch_1:
	jmpl	%o7+12,%g0
	add	%l0,2,%l0
far1_b2b_h:
	and	%l7,0x8c9,%l2
	fadds	%f16,%f21,%f16
	umul	%l1,0xe80,%l4
	addc	%l4,0x3fd,%l7
	jmpl	%o7,%g0
	fsqrts	%f29,%f21
far1_b2b_l:
	xnor	%l6,0x9d3,%l3
	fdivs	%f9 ,%f13,%f12
	and	%l3,-0x2c2,%l2
	fsqrts	%f10,%f15
	jmpl	%o7,%g0
	smul	%l2,-0x5ed,%l3
user_far1_end:
	.seg	"text"
	.text
	.align	0x2000
user_far2_start:
p0_far_2_le:
	smul	%l4,0x44a,%l4
	or	%l6,-0x81c,%l6
	or	%l7,-0x259,%l7
	fmuls	%f15,%f5 ,%f2 
	jmpl	%o7,%g0
	smul	%l7,%l0,%l2
p0_far_2_lem:
	smul	%l4,0x44a,%l4
	or	%l6,-0x81c,%l6
	or	%l7,-0x259,%l7
	fmuls	%f15,%f5 ,%f2 
	jmpl	%o7,%g0
	smul	%l7,%l0,%l2
p0_far_2_he:
	addc	%l4,-0x49b,%l2
	xnor	%l6,0xe3e,%l4
	jmpl	%o7,%g0
	udivx	%l6,%l6,%l2
p0_far_2_hem:
	addc	%l4,-0x49b,%l2
	xnor	%l6,0xe3e,%l4
	jmpl	%o7,%g0
	udivx	%l6,%l6,%l2
p0_loop_branch_2:
	jmpl	%o7+12,%g0
	add	%l0,3,%l0
far2_b2b_h:
	jmpl	%o7,%g0
	fadds	%f26,%f30,%f23
	jmpl	%o7,%g0
	nop
far2_b2b_l:
	jmpl	%o7,%g0
	mulx	%l3,-0xd2f,%l1
	jmpl	%o7,%g0
	nop
user_far2_end:
	.seg	"text"
	.text
	.align	0x2000
user_far3_start:
p0_far_3_le:
	orn	%l4,%l1,%l5
	jmpl	%o7,%g0
	ldub	[%i0+0x012],%l6		! Mem[0000000010001412]
p0_far_3_lem:
	orn	%l4,%l1,%l5
	membar	#Sync
	jmpl	%o7,%g0
	ldub	[%i0+0x012],%l6		! Mem[0000000010001412]
p0_far_3_he:
	fcmps	%fcc3,%f30,%f29
	xor	%l4,%l2,%l2
	andn	%l6,0x2fb,%l3
	jmpl	%o7,%g0
	mulx	%l7,%l2,%l6
p0_far_3_hem:
	fcmps	%fcc3,%f30,%f29
	xor	%l4,%l2,%l2
	andn	%l6,0x2fb,%l3
	jmpl	%o7,%g0
	mulx	%l7,%l2,%l6
p0_loop_branch_3:
	jmpl	%o7+12,%g0
	add	%l0,4,%l0
far3_b2b_h:
	fdivs	%f31,%f18,%f25
	and	%l2,%l3,%l4
	jmpl	%o7,%g0
	fdivs	%f24,%f26,%f25
far3_b2b_l:
	or	%l6,-0xd32,%l0
	fsqrts	%f0 ,%f10
	jmpl	%o7,%g0
	fsqrts	%f0 ,%f10
user_far3_end:
	.seg	"text"
	.align	0x2000
user_jump0_start:
	INIT_MEM(0, 0x0010, 1, +, 0, +, 0)
p0_jmpl_0_le:
	addc	%l0,%l6,%l1
	fadds	%f14,%f10,%f0 
	xnor	%l5,%l1,%l1
	fitos	%f8 ,%f4 
	jmpl	%g6+8,%g0
	fdivs	%f8 ,%f9 ,%f0 
p0_call_0_le:
	subc	%l5,0x89a,%l0
	retl
	subc	%l4,%l6,%l2
p0_jmpl_0_lo:
	addc	%l0,%l6,%l1
	fadds	%f14,%f10,%f0 
	xnor	%l5,%l1,%l1
	fitos	%f8 ,%f4 
	jmpl	%g6+8,%g0
	fdivs	%f8 ,%f9 ,%f0 
p0_call_0_lo:
	subc	%l5,0x89a,%l0
	retl
	subc	%l4,%l6,%l2
p0_jmpl_0_he:
	smul	%l5,%l4,%l2
	fsqrts	%f24,%f31
	ldd	[%i4+0x008],%f18	! Mem[0000000010101408]
	mulx	%l3,%l7,%l2
	jmpl	%g6+8,%g0
	nop
p0_call_0_he:
	smul	%l4,0x7fe,%l0
	sub	%l7,-0x06a,%l5
	or	%l4,%l6,%l6
	udivx	%l6,0x0e4,%l6
	add	%l5,%l2,%l5
	fsubs	%f16,%f31,%f26
	andn	%l2,0x8c6,%l0
	retl
	and	%l2,0xb9d,%l4
p0_jmpl_0_ho:
	smul	%l5,%l4,%l2
	fsqrts	%f24,%f31
	ldd	[%o4+0x008],%f18	! Mem[0000000010101408]
	mulx	%l3,%l7,%l2
	jmpl	%g6+8,%g0
	nop
p0_call_0_ho:
	smul	%l4,0x7fe,%l0
	sub	%l7,-0x06a,%l5
	or	%l4,%l6,%l6
	udivx	%l6,0x0e4,%l6
	add	%l5,%l2,%l5
	fsubs	%f16,%f31,%f26
	andn	%l2,0x8c6,%l0
	retl
	and	%l2,0xb9d,%l4
user_jump0_end:
	.seg	"text"
	.align	0x2000
user_jump1_start:
	INIT_MEM(0, 0x0020, 1, +, 0, +, 0)
p0_jmpl_1_le:
	sdivx	%l2,%l6,%l1
	sdivx	%l0,%l4,%l4
	jmpl	%g6+8,%g0
	orn	%l2,%l4,%l4
p0_call_1_le:
	retl
	fsqrts	%f2 ,%f1 
p0_jmpl_1_lo:
	sdivx	%l2,%l6,%l1
	sdivx	%l0,%l4,%l4
	jmpl	%g6+8,%g0
	orn	%l2,%l4,%l4
p0_call_1_lo:
	retl
	fsqrts	%f2 ,%f1 
p0_jmpl_1_he:
	mulx	%l2,-0xae8,%l2
	addc	%l2,%l1,%l0
	fitod	%f26,%f22
	ldsw	[%i6+0x014],%l6		! Mem[0000000010181414]
	or	%l6,%l5,%l1
	ldstub	[%i3+0x009],%l1		! Mem[00000000100c1409]
	addc	%l3,%l7,%l7
	jmpl	%g6+8,%g0
	mulx	%l6,0xb98,%l6
p0_call_1_he:
	smul	%l2,-0xe9d,%l6
	andn	%l2,0xbd2,%l6
	mulx	%l3,-0x0d8,%l4
	subc	%l0,%l5,%l4
	addc	%l4,-0x429,%l1
	retl
	umul	%l1,-0x917,%l4
p0_jmpl_1_ho:
	mulx	%l2,-0xae8,%l2
	addc	%l2,%l1,%l0
	fitod	%f26,%f22
	ldsw	[%o6+0x014],%l6		! Mem[0000000010181414]
	or	%l6,%l5,%l1
	ldstub	[%o3+0x009],%l1		! Mem[00000000100c1409]
	addc	%l3,%l7,%l7
	jmpl	%g6+8,%g0
	mulx	%l6,0xb98,%l6
p0_call_1_ho:
	smul	%l2,-0xe9d,%l6
	andn	%l2,0xbd2,%l6
	mulx	%l3,-0x0d8,%l4
	subc	%l0,%l5,%l4
	addc	%l4,-0x429,%l1
	retl
	umul	%l1,-0x917,%l4
user_jump1_end:
	.seg	"text"
	.align	0x2000
user_jump2_start:
	INIT_MEM(0, 0x0030, 1, +, 0, +, 0)
p0_jmpl_2_le:
	mulx	%l1,-0xb99,%l6
	subc	%l5,-0x27a,%l0
	add	%l7,%l2,%l0
	add	%l0,%l0,%l4
	addc	%l7,%l6,%l1
	xnor	%l1,0x029,%l6
	fsubs	%f6 ,%f3 ,%f7 
	jmpl	%g6+8,%g0
	andn	%l2,0x849,%l6
p0_call_2_le:
	retl
	xor	%l0,0xbcc,%l4
p0_jmpl_2_lo:
	mulx	%l1,-0xb99,%l6
	subc	%l5,-0x27a,%l0
	add	%l7,%l2,%l0
	add	%l0,%l0,%l4
	addc	%l7,%l6,%l1
	xnor	%l1,0x029,%l6
	fsubs	%f6 ,%f3 ,%f7 
	jmpl	%g6+8,%g0
	andn	%l2,0x849,%l6
p0_call_2_lo:
	retl
	xor	%l0,0xbcc,%l4
p0_jmpl_2_he:
	jmpl	%g6+8,%g0
	add	%l4,0x3bb,%l5
p0_call_2_he:
	fsubs	%f31,%f27,%f17
	add	%l3,%l6,%l3
	retl
	xor	%l5,%l3,%l0
p0_jmpl_2_ho:
	jmpl	%g6+8,%g0
	add	%l4,0x3bb,%l5
p0_call_2_ho:
	fsubs	%f31,%f27,%f17
	add	%l3,%l6,%l3
	retl
	xor	%l5,%l3,%l0
user_jump2_end:
	.seg	"text"
	.align	0x2000
user_jump3_start:
	INIT_MEM(0, 0x0040, 1, +, 0, +, 0)
p0_jmpl_3_le:
	jmpl	%g6+8,%g0
	add	%l0,-0x4c2,%l3
p0_call_3_le:
	fmuls	%f9 ,%f11,%f14
	retl
	fsqrts	%f10,%f8 
p0_jmpl_3_lo:
	jmpl	%g6+8,%g0
	add	%l0,-0x4c2,%l3
p0_call_3_lo:
	fmuls	%f9 ,%f11,%f14
	retl
	fsqrts	%f10,%f8 
p0_jmpl_3_he:
	udivx	%l0,%l5,%l4
	sub	%l6,%l3,%l1
	sub	%l5,%l6,%l7
	and	%l6,0x83c,%l1
	jmpl	%g6+8,%g0
	udivx	%l0,0x413,%l3
p0_call_3_he:
	fsubs	%f17,%f30,%f25
	retl
	fsubs	%f30,%f21,%f18
p0_jmpl_3_ho:
	udivx	%l0,%l5,%l4
	sub	%l6,%l3,%l1
	sub	%l5,%l6,%l7
	and	%l6,0x83c,%l1
	jmpl	%g6+8,%g0
	udivx	%l0,0x413,%l3
p0_call_3_ho:
	fsubs	%f17,%f30,%f25
	retl
	fsubs	%f30,%f21,%f18
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
	.word	0x1464a328,0x6bd6d300		! Init value for %l0
	.word	0x38bb34c0,0x3e7637d6		! Init value for %l1
	.word	0x442ab888,0x4b6f1614		! Init value for %l2
	.word	0x08b3573d,0xf3f2a20a		! Init value for %l3
	.word	0x5dae98bc,0x0f975740		! Init value for %l4
	.word	0xb64e5972,0x097fcbb5		! Init value for %l5
	.word	0x5dd1a632,0x547327ab		! Init value for %l6
	.word	0x08d9fb32,0x30ee1634		! Init value for %l7
	.align	64
p0_init_freg:
	.word	0xa4bdbde0,0xf5969ca9		! Init value for %f0 
	.word	0x912a05c7,0xca2516a2		! Init value for %f2 
	.word	0x5738ab28,0xc19e324d		! Init value for %f4 
	.word	0xeb5c6612,0xc170afb0		! Init value for %f6 
	.word	0x9263b683,0x00d74f0d		! Init value for %f8 
	.word	0xa4c504b7,0x87af6512		! Init value for %f10
	.word	0x0b2f8ade,0x965ee3c9		! Init value for %f12
	.word	0x8f42ddd7,0x20f9d58a		! Init value for %f14
	.word	0xe1372629,0x58b20084		! Init value for %f16
	.word	0x8af30670,0xce8ecf5c		! Init value for %f18
	.word	0xc5d3253a,0x5f880035		! Init value for %f20
	.word	0x413188a4,0x012b48db		! Init value for %f22
	.word	0x775a5ef2,0x50a00528		! Init value for %f24
	.word	0xb0a253ce,0x0e1973b3		! Init value for %f26
	.word	0x4049c358,0xfea97ab2		! Init value for %f28
	.word	0xa5d41c1d,0x9a41c1c7		! Init value for %f30
	.word	0xe8afeef0,0x7d941297		! Init value for %f32
	.word	0x7641f152,0xa6652f38		! Init value for %f34
	.word	0xd20c3e7c,0x2182fab9		! Init value for %f36
	.word	0x67449473,0xa2159f27		! Init value for %f38
	.word	0x6392c65d,0x21f504cf		! Init value for %f40
	.word	0xc8d17eca,0x4a362c97		! Init value for %f42
	.word	0xe96a1b5e,0x43ec5752		! Init value for %f44
	.word	0xada08b66,0x5260ecc2		! Init value for %f46
	.word	0x75ffd4c4,0xacc9ce97
	.word	0x031051ac,0xdc3c1103
	.word	0x7409105e,0xee3e1b09
	.word	0xb264d450,0xc22dea57
	.word	0x51aad1a0,0xbe6c2b98
	.word	0x8eba9a88,0x014027cd
	.word	0x51278af9,0x807b7be2
	.word	0x01490a98,0x404a2296
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
	.word	0x00000000,0xe0000000
	.word	0xf8d6f897,0xc66eb368
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000003
	.word	0x00000000,0x00000000
	.word	0x00000000,0x000000ff
	.word	0x00000000,0x00000000
	.word	0x00000000,0xff8d0000
p0_expected_fp_regs:
	.word	0x033200ff,0xff000000
	.word	0x03320000,0x00000000
	.word	0x00000000,0xff7f0000
	.word	0xfffff5f0,0x00003600
	.word	0x00360000,0x00ff0000
	.word	0xffff0000,0x00000000
	.word	0xffffffff,0x00000000
	.word	0x80000000,0x00000000
	.word	0xff000000,0x00000000
	.word	0x00000050,0xfccd3600
	.word	0xffffffff,0x00000000
	.word	0x0000b100,0xff7f0000
	.word	0xffb3b676,0x00000000
	.word	0x00000000,0x0332c9ff
	.word	0x00000000,0x00000000
	.word	0x00000050,0x000000e4
	.word	0x00000027,0x00000800		! %fsr = 0000002700000800
p0_local0_expect:
	.word	0xff00fb30,0xe0000000
	.word	0x00000000,0x00000083
	.word	0x58c3495d,0x00000000
	.word	0x80000000,0x00000000
	.word	0x30ff00ff,0xffffaf83
	.word	0x00000000,0x000000e0
	.word	0x000000b1,0x00000000
	.word	0xffc93203,0xafffffff
p0_local0_sec_expect:
	.word	0xffb3b676,0x00000000
	.word	0xff8d0000,0x00000000
	.word	0xff0000ff,0x00000000
	.word	0xffffe519,0xc971ce8e
	.word	0x491588d6,0x4920665d
	.word	0x00000008,0xffffaf83
	.word	0x7271fd80,0xffdbe53e
	.word	0x3500885f,0x00000000
p0_local1_expect:
	.word	0xff000000,0x00000000
	.word	0x00000000,0x00000036
	.word	0x00000000,0x00ff0000
	.word	0x0000b100,0xff7f0000
	.word	0xffb3b676,0x00000000
	.word	0x896f2ef3,0x0332c9ff
	.word	0x4049c358,0x00000000
	.word	0xff3d00b3,0x000000e4
p0_local1_sec_expect:
	.word	0x00000000,0xff00fffb
	.word	0x00000050,0xfccd3600
	.word	0xffffffff,0x00000000
	.word	0x0000b100,0xff7f0000
	.word	0xffb3b676,0x00000000
	.word	0x00000000,0x0332c9ff
	.word	0x00000000,0x00000000
	.word	0xff3d00b3,0x000000e4
p0_local2_expect:
	.word	0xff320000,0x00000000
	.word	0xff00ffff,0x0c281024
	.word	0x85fb29af,0x1a4b7e62
	.word	0x00000000,0x49206600
	.word	0xff0000ff,0x00000000
	.word	0x00000008,0xffffaf83
	.word	0x00000000,0xff008dfb
	.word	0x2fffffff,0x00000000
p0_local2_sec_expect:
	.word	0x00ff00ff,0x000000ff
	.word	0xff7f0000,0x00000000
	.word	0x000000ff,0xff003203
	.word	0x0000ff00,0x000000e4
	.word	0x5d662049,0x00000000
	.word	0x83afffff,0x00000080
	.word	0x3ee5dbff,0x80fd7172
	.word	0x00000000,0x5f880035
p0_local3_expect:
	.word	0x00000000,0xff8d0000
	.word	0xe0000000,0x000000ff
	.word	0xff000000,0x3e000000
	.word	0xcf030000,0x4920665d
	.word	0x00000000,0x30fbc62b
	.word	0xffffff00,0x7fffffff
	.word	0xffffaf83,0x00000000
	.word	0xec0404c9,0xf9c9cf7f
p0_local3_sec_expect:
	.word	0x00003600,0xff000000
	.word	0x00000000,0x00000000
	.word	0x00008dff,0xff000000
	.word	0xfffff5f0,0x60000000
	.word	0xffdbe53e,0x034f37e1
	.word	0xfb8d1aff,0x00000000
	.word	0x00000000,0x00000000
	.word	0xffdbe53e,0xafffffff
p0_local4_expect:
	.word	0x00fb2049,0x056b10da
	.word	0x00000000,0x00000000
	.word	0xffffffff,0xff0000b1
	.word	0x0000004f,0xffffaf83
	.word	0xffffff7f,0x19e50000
	.word	0x000000ff,0xffffffff
	.word	0x00000000,0x00000000
	.word	0xda106b05,0x4920665d
p0_local4_sec_expect:
	.word	0x50000000,0x00000000
	.word	0xffc93203,0xafffffff
	.word	0xfffff5f0,0x60000000
	.word	0x80000000,0x00000000
	.word	0x30fb00ff,0xffffaf83
	.word	0x00000000,0x000000ff
	.word	0xff000000,0x00ff0000
	.word	0xffc93203,0xafffffff
p0_local5_expect:
	.word	0x24190000,0xe000ff00
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000000
	.word	0xffffadff,0xffffaf83
	.word	0xffffff7f,0x00000000
	.word	0xffffff7f,0x4f97ffff
	.word	0x00000000,0x00000000
	.word	0xff220000,0x00ffffff
p0_local5_sec_expect:
	.word	0x00000000,0xff1a8dfb
	.word	0xff000000,0x00000000
	.word	0xff360000,0x00ff0000
	.word	0xecc80273,0x9f4d9aba
	.word	0x1717b366,0x380a1d7e
	.word	0x7a7acd55,0xfa443e8a
	.word	0x55ac23f7,0xeecdc1db
	.word	0x5a8161f8,0xb478b4b3
p0_local6_expect:
	.word	0xffff0000,0x00000000
	.word	0xffffffff,0x00000000
	.word	0xffffffff,0x00000000
	.word	0x0000b100,0xff7f0000
	.word	0xffb3b676,0x00000000
	.word	0x8962b368,0x1c32f778
	.word	0x00000001,0x00000000
	.word	0xff3d00b3,0x000000e4
p0_local6_sec_expect:
	.word	0x00000000,0x00000000
	.word	0xff00fffb,0x00000000
	.word	0x00000000,0xff0000ff
	.word	0x80000000,0x00000000
	.word	0x30fb00ff,0xffffaf83
	.word	0x00000000,0x000000ff
	.word	0xff000000,0x00ff0000
	.word	0x80000000,0xafffffff
share0_expect:
	.word	0xff0019af,0xd6ec9f34
	.word	0x8577bee9,0x12d0c65f
	.word	0x8507c618,0x8f45ba33
	.word	0x4556a49c,0xe1719183
	.word	0xd90cd6dd,0x72fbf47c
	.word	0x8cfcf1a3,0xf5118c48
	.word	0x9eeb5fd0,0x15cdfc59
	.word	0x67966f61,0x139afd2c
share1_expect:
	.word	0xff7f17e8,0x42a77903
	.word	0x7876947c,0x4ce54a80
	.word	0xeb2adaea,0x1c65b0fa
	.word	0x41a37aee,0xe0adf0e1
	.word	0x3f9bd842,0x10efde8d
	.word	0x6bb7f054,0x4ef52fc0
	.word	0xee3a721f,0x69884720
	.word	0xa2f1377e,0x5c433191
	.word	0xffff226c,0x96e7a157
	.word	0x53b30256,0xf40889bd
	.word	0x78d2708a,0x4f8b4e67
	.word	0xc6fc5875,0x0c9f9fa4
	.word	0xc82ba2e6,0x81c6491c
	.word	0x069dacc6,0x248c113e
	.word	0x182f43d6,0x1f92b667
	.word	0x40073aca,0xe1e5acba
share2_expect:
	.word	0xff00980d,0x6491bddf
	.word	0xfa036248,0x19247664
	.word	0x83ed4313,0x5b5ad40b
	.word	0xe093c733,0x21af58bf
	.word	0x912a78c0,0x098870b3
	.word	0x525075f9,0xdf8557ac
	.word	0x161ff98f,0xa0e008a4
	.word	0xfd232bcc,0x2c122c70
share3_expect:
	.word	0x1cb7dd30,0x0379183c
	.word	0x3f0a580b,0xa12686eb
	.word	0xa7f691eb,0x588193e7
	.word	0x8a1b9385,0x6aea5658
	.word	0x96a9f782,0x361e722b
	.word	0xf97644fd,0xce081fab
	.word	0x65530dcb,0xafa8c926
	.word	0x11659b0d,0x7d2cc3d0
	.word	0xff834385,0x2cdd7196
	.word	0xd05ea0ad,0x62cbebaf
	.word	0x61295857,0x4c404ff8
	.word	0xf0c860bc,0xca11ce21
	.word	0x3774027c,0xb4e8cb3a
	.word	0xc4799e44,0xd0f0b5e7
	.word	0x50b8bcd4,0xa65f4f67
	.word	0x72711ec4,0x2d9a5bbf
	.word	0x69ffc3e5,0x09cdc37a
	.word	0x7d56d656,0x99f2936b
	.word	0x5cf367bf,0x5b0e6709
	.word	0x6dabdc34,0x99f43afa
	.word	0x8d1c5557,0x749e148a
	.word	0x228a62ba,0x34f2a7eb
	.word	0xc876249f,0x7b0cd311
	.word	0x76c4b40b,0x5b9dbcac
	.word	0x00ff4926,0xf1a3b862
	.word	0xf26da26f,0x8ca8bf0a
	.word	0x2887ffb1,0xc78bcb0a
	.word	0x81897d1e,0x83449236
	.word	0xa0b47539,0xa2290970
	.word	0x09c96ad2,0xedf7d9a3
	.word	0x26db8def,0xa861df54
	.word	0xa2b16684,0x61bd276a
	.word	0xf9ff9c47,0x5daeb9a7
	.word	0x63c0183a,0x6bfe7d25
	.word	0xc350b8a4,0x9be9b6d1
	.word	0xf688d5d3,0x50d5d717
	.word	0x6bcd2768,0x3bab0fa1
	.word	0xc23e03e4,0xf531246b
	.word	0xda886e38,0xc348534d
	.word	0xd793d0bf,0x418ed1e7
	.word	0xffff94e3,0x1100befd
	.word	0xbd3f45df,0x8743e0ca
	.word	0x0137c6d1,0x05e76146
	.word	0x135c5d23,0xd68e5ad1
	.word	0x08a50ee5,0xb0b91dc5
	.word	0x698c19f6,0xa6db729c
	.word	0x2608e2ef,0xf614166b
	.word	0xb5f870a0,0x21c6a4f5
	.word	0x00ffad00,0x0f0102e2
	.word	0x690dbbd4,0xaa1b5b62
	.word	0x143e9447,0xf2c80e29
	.word	0xec79c666,0x7c8ee595
	.word	0xf9d151cd,0x890e3195
	.word	0x72e6426a,0x3241f092
	.word	0xfa74bf9b,0x80672b28
	.word	0xe937332f,0x3db8f43f
	.word	0x1afff4cf,0xe77cd94e
	.word	0x0417990d,0x86fe8668
	.word	0xc79e2ff9,0xb87672ff
	.word	0x89978bec,0x3f566d8b
	.word	0xff1ebd0f,0x23be6a3e
	.word	0xa18cb631,0xb852c953
	.word	0x160fe36e,0x96f73328
	.word	0x79fb08b8,0xecb3d9ed
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
	.word	0x016e1dc7,0xeadf767b
	.word	0x00000000,0x00000002
	.word	0x590f3537,0xc0b3756e
	.word	0x00000000,0x00000003
	.word	0x5d938ad7,0xcde394b4
	.word	0x00000000,0x00000004
	.word	0xc5acf090,0x00195c2f
	.word	0x00000000,0x00000005
	.word	0xda59a1d8,0x3b17c0ec
	.word	0x00000000,0x00000006
	.word	0x4e53bf4f,0xbf01c2e5
	.word	0x00000000,0x00000007
	.word	0x6c170b3f,0x89a05a20
	.word	0x00000000,0x00000008
	.word	0xa018af67,0x80b1470a
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
	.word	0xe740342b,0x12fde9ef,0x0108670a,0x11b6cfd1
	.word	0x505d8668,0x94e9ad49,0x2e3bb29a,0xab6cb408
	.word	0x5ed96d0f,0xaa9ebb80,0xd637d3f7,0x71e86242
	.word	0x22110106,0x585c6b8c,0x4deff628,0x7bc773ad
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
	.word	0xac7596db,0x30a01631,0x4ae073c6,0xeb41318b
	.word	0x8c87963f,0xdc254e45,0xf7ac8d7d,0x76b6b320
	.word	0x657a3cc5,0x2ad2fe98,0x10ffdbc6,0xa9f92710
	.word	0xd211b849,0x32af21d4,0x4ad61294,0x35f51fc5
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
	.word	0x347cbcdd,0x66a31434,0x3ce31959,0xb9013952
	.word	0x133dceb3,0x6e1e4d53,0x94e32346,0x38bcbdbe
	.word	0xab924c13,0x940a9807,0x8b10dcb0,0x3ac10b66
	.word	0x1bdbf694,0xe5936eab,0x9faa33db,0xff4961d8
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
	.word	0x1c2ae466,0xdbbd3d3c,0xb95a4bac,0xcf2ab6f9
	.word	0x4de4a507,0x484d7c90,0xb082273f,0x81646ed8
	.word	0x07fefd24,0x30fbc62b,0x82f0fa56,0x4746726e
	.word	0x7537166b,0x25f0a633,0xec0404c9,0xf9c9cf7f
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
	.word	0x9d4351b7,0x73517bd0,0x4a42522a,0xf9ee0583
	.word	0xfd255f15,0xfe7aab1e,0x01754022,0x5c537926
	.word	0xd4a89ab5,0x118b92db,0x417e3c83,0x18ae2b56
	.word	0x5ea16e43,0x8d1e3315,0x7455d1b4,0x8670507d
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
	.word	0xa177a6af,0x60aef68f,0xdd7d5836,0xc967a4eb
	.word	0x7a7958e6,0x16fc1d3f,0xccc989c0,0xc971ce8e
	.word	0x491588d6,0x947903e2,0x9daec754,0xdb994448
	.word	0x3a9fb502,0x0c281024,0xb82a2f11,0x4f979be2
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
	.word	0x6999b62e,0xf04f903a,0xd028fa44,0xa03f5a8f
	.word	0xdff9a010,0x3aab7db2,0xd1555933,0x9237c966
	.word	0xaf83e48b,0x02283563,0xe27e2b41,0xf2aa7756
	.word	0x3e645548,0x01051319,0x10ca031c,0x0700407a
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
	.word	0x3186724e,0x1835ce8f,0xebb2fdda,0x5e4de1dd
	.word	0xc9bd086d,0x0039f71b,0xd3b0b970,0x6159318b
	.word	0xe9ac274a,0x0d75349a,0x552004da,0x9c159b6e
	.word	0x6298e50c,0x1112413c,0x4e88cf03,0x3c9e3d33
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
	.word	0xc5517e6a,0xf3e54b44,0x3f4c7ac2,0x433924ef
	.word	0x095135f0,0x47c6b2b0,0x30fdc02c,0x9592cf1c
	.word	0x8a78816a,0x3ee5dbe1,0x8062c5e8,0x725741a6
	.word	0x6afb8e96,0x55b8fc7c,0x914e80b8,0x5745154b
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
	.word	0xb9284053,0x63bef5c8,0xd8ce0170,0xa9e274c4
	.word	0xef8690e2,0x6fd5d3e2,0xdbf82270,0x6b973ec4
	.word	0xc08514d5,0x294b281e,0x2144abf4,0xe4d12b11
	.word	0xe5b7fe67,0x774b9f44,0x1c70601e,0x858b6963
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
	.word	0x997bde1f,0x8eac6b86,0x3df2ce82,0xa1f49eb1
	.word	0x9272939f,0x60c9b472,0xb74204f1,0x88f9d8ea
	.word	0xfbc755fb,0x16ea1aa4,0xc842be0e,0x2335a31a
	.word	0xb405f584,0xfde3b5f5,0x05d7f66e,0xad8fd493
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
	.word	0xac89d0e3,0x2fc1555e,0x59dfb343,0x3c20ef0a
	.word	0xbbb4ffc2,0x56d7a6d3,0xecc80273,0x9f4d9aba
	.word	0x1717b366,0x380a1d7e,0x7a7acd55,0xfa443e8a
	.word	0x55ac23f7,0xeecdc1db,0x5a8161f8,0xb478b4b3
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
	.word	0xbb5aef27,0xfcedf601,0x19757b20,0xa0568bed
	.word	0x5d662049,0x2373c496,0x554714fe,0x4257334b
	.word	0xa0c812cf,0x2b22a539,0x9df02ce2,0x8100b17d
	.word	0xbf985ee2,0x3b3a6b3f,0x350f2666,0x88012fd6
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
	.word	0x1cb91804,0xdbe13bd8,0xd4694c43,0xdd4b92a7
	.word	0x6fcb8206,0xce6c8f49,0x61dea0cd,0x80b12788
	.word	0xc2b325be,0xfd44d8e1,0x843613a4,0x6cedf85a
	.word	0x6e9fa9d7,0x29c1c741,0xb2061a6c,0x5f9b952b
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
	.word	0xfda319af,0xd6ec9f34,0x8577bee9,0x12d0c65f
	.word	0x8507c618,0x8f45ba33,0x4556a49c,0xe1719183
	.word	0xd90cd6dd,0x72fbf47c,0x8cfcf1a3,0xf5118c48
	.word	0x9eeb5fd0,0x15cdfc59,0x67966f61,0x139afd2c
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
	.word	0xf63317e8,0x42a77903,0x7876947c,0x4ce54a80
	.word	0xeb2adaea,0x1c65b0fa,0x41a37aee,0xe0adf0e1
	.word	0x3f9bd842,0x10efde8d,0x6bb7f054,0x4ef52fc0
	.word	0xee3a721f,0x69884720,0xa2f1377e,0x5c433191
	.word	0x06f0226c,0x96e7a157,0x53b30256,0xf40889bd
	.word	0x78d2708a,0x4f8b4e67,0xc6fc5875,0x0c9f9fa4
	.word	0xc82ba2e6,0x81c6491c,0x069dacc6,0x248c113e
	.word	0x182f43d6,0x1f92b667,0x40073aca,0xe1e5acba
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
	.word	0xd96c980d,0x6491bddf,0xfa036248,0x19247664
	.word	0x83ed4313,0x5b5ad40b,0xe093c733,0x21af58bf
	.word	0x912a78c0,0x098870b3,0x525075f9,0xdf8557ac
	.word	0x161ff98f,0xa0e008a4,0xfd232bcc,0x2c122c70
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
	.word	0x0db7dd30,0x0379183c,0x3f0a580b,0xa12686eb
	.word	0xa7f691eb,0x588193e7,0x8a1b9385,0x6aea5658
	.word	0x96a9f782,0x361e722b,0xf97644fd,0xce081fab
	.word	0x65530dcb,0xafa8c926,0x11659b0d,0x7d2cc3d0
	.word	0x110e4385,0x2cdd7196,0xd05ea0ad,0x62cbebaf
	.word	0x61295857,0x4c404ff8,0xf0c860bc,0xca11ce21
	.word	0x3774027c,0xb4e8cb3a,0xc4799e44,0xd0f0b5e7
	.word	0x50b8bcd4,0xa65f4f67,0x72711ec4,0x2d9a5bbf
	.word	0x6933c3e5,0x09cdc37a,0x7d56d656,0x99f2936b
	.word	0x5cf367bf,0x5b0e6709,0x6dabdc34,0x99f43afa
	.word	0x8d1c5557,0x749e148a,0x228a62ba,0x34f2a7eb
	.word	0xc876249f,0x7b0cd311,0x76c4b40b,0x5b9dbcac
	.word	0x342d4926,0xf1a3b862,0xf26da26f,0x8ca8bf0a
	.word	0x2887ffb1,0xc78bcb0a,0x81897d1e,0x83449236
	.word	0xa0b47539,0xa2290970,0x09c96ad2,0xedf7d9a3
	.word	0x26db8def,0xa861df54,0xa2b16684,0x61bd276a
	.word	0xf9e49c47,0x5daeb9a7,0x63c0183a,0x6bfe7d25
	.word	0xc350b8a4,0x9be9b6d1,0xf688d5d3,0x50d5d717
	.word	0x6bcd2768,0x3bab0fa1,0xc23e03e4,0xf531246b
	.word	0xda886e38,0xc348534d,0xd793d0bf,0x418ed1e7
	.word	0x30bc94e3,0x1100befd,0xbd3f45df,0x8743e0ca
	.word	0x0137c6d1,0x05e76146,0x135c5d23,0xd68e5ad1
	.word	0x08a50ee5,0xb0b91dc5,0x698c19f6,0xa6db729c
	.word	0x2608e2ef,0xf614166b,0xb5f870a0,0x21c6a4f5
	.word	0xe8f2ad00,0x0f0102e2,0x690dbbd4,0xaa1b5b62
	.word	0x143e9447,0xf2c80e29,0xec79c666,0x7c8ee595
	.word	0xf9d151cd,0x890e3195,0x72e6426a,0x3241f092
	.word	0xfa74bf9b,0x80672b28,0xe937332f,0x3db8f43f
	.word	0x54e9f4cf,0xe77cd94e,0x0417990d,0x86fe8668
	.word	0xc79e2ff9,0xb87672ff,0x89978bec,0x3f566d8b
	.word	0xff1ebd0f,0x23be6a3e,0xa18cb631,0xb852c953
	.word	0x160fe36e,0x96f73328,0x79fb08b8,0xecb3d9ed
share3_end:
