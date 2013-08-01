/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: mpgen_600_4.s
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
!	Seed = 327141855
!	Riesling can be on
!	1 Thread, 600 lines
!	mpgen   created on Dec 20, 2005 (16:35:03)
!	mpgen_600_4.s created on Mar 27, 2009 (14:18:55)
!	RC file : random.rc
!	cmd = /import/n2-tools/release/tools/mpgen/mpgen,1.051220 -rc random.rc -o mpgen_600_4 -p 1 -l 600

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
!	%f0  = 12be9cf8 4be67a45 867517c3 1261fd6a
!	%f4  = 781c91e0 6a485ce9 7405d5c6 133a31ec
!	%f8  = a9916d5f 3afbc871 7ff9c63f 08590d12
!	%f12 = 73cdb2f2 890271d1 fe1d82a3 61f75dba
	ldda	[%g1]ASI_BLK_P,%f0
	add	%g1,64,%g1
!	%f16 = f2660b89 29ee8f10 90322718 d5d1d354
!	%f20 = 7511905e 1d0001c1 80661940 92d8a447
!	%f24 = 0566ab42 a66f3780 aa1d888a 33d5fedf
!	%f28 = d526c6c8 ef1e71aa 54566331 a7966127
	ldda	[%g1]ASI_BLK_P,%f16
	add	%g1,64,%g1
!	%f32 = 7e452964 32aee367 2f59aa52 2a3ee734
!	%f36 = 4a865c18 832c47b5 e96c71c3 3fcc9d57
!	%f40 = 0ef25495 78b280c7 f248dcea 07e33a1b
!	%f44 = 631ab436 0a20a05e 44abe2ca 2cefeca2
	ldda	[%g1]ASI_BLK_P,%f32

!	Set up the Graphics Status Register

	setx	0x79d122e00000000f,%g7,%g1 ! GSR scale =  1, align = 7
	wr	%g1,%g0,%gsr		! GSR = 79d122e00000000f
	wr	%g0,%y			! Clear Y register
	xorcc	%g0,%g0,%g3		! init %g3 and set flags
	membar	#Sync			! Force the block loads to complete

!	Start of Random Code for processor 0

p0_label_1:
!	Mem[0000000030101408] = 1ef5d810 0e0c2367, %l4 = 4b833b4c, %l5 = d783bcb9
	ldda	[%i4+%o4]0x89,%l4	! %l4 = 000000000e0c2367 000000001ef5d810
!	%f20 = 7511905e 1d0001c1, Mem[0000000010041408] = 208dc7cc 09d747c4
	stda	%f20,[%i1+%o4]0x88	! Mem[0000000010041408] = 7511905e 1d0001c1
!	Mem[0000000010141410] = 64a0dc4c3db70e9a, %l5 = 000000001ef5d810, %l0 = 9b6ea6d0914e32fc
	add	%i5,0x10,%g1
	casxa	[%g1]0x80,%l5,%l0	! %l0 = 64a0dc4c3db70e9a
!	%f24 = 0566ab42 a66f3780, Mem[00000000300c1410] = 7959233e f02324a4
	stda	%f24,[%i3+%o5]0x89	! Mem[00000000300c1410] = 0566ab42 a66f3780
!	Mem[0000000010041410] = ccc9fbfba84f46c8, %l1 = e8640cf066f7b952
	ldxa	[%i1+%o5]0x88,%l1	! %l1 = ccc9fbfba84f46c8
!	%l1 = ccc9fbfba84f46c8, Mem[0000000030101408] = 1ef5d8100e0c2367
	stxa	%l1,[%i4+%o4]0x89	! Mem[0000000030101408] = ccc9fbfba84f46c8
!	Mem[0000000010181410] = 6874caff, %f26 = aa1d888a
	lda	[%i6+0x010]%asi,%f26	! %f26 = 6874caff
!	%l0 = 64a0dc4c3db70e9a, Mem[0000000010101424] = 9c9ea76a, %asi = 80
	stha	%l0,[%i4+0x024]%asi	! Mem[0000000010101424] = 0e9aa76a
!	Mem[0000000010141414] = 3db70e9a, %l0 = 64a0dc4c3db70e9a
	swap	[%i5+0x014],%l0		! %l0 = 000000003db70e9a
!	Starting 10 instruction Store Burst
!	Mem[0000000010101438] = a942419c, %l3 = 68eb0bd61e80263e
	swap	[%i4+0x038],%l3		! %l3 = 00000000a942419c

p0_label_2:
!	Mem[0000000010181405] = f9276d1d, %l1 = ccc9fbfba84f46c8
	ldstuba	[%i6+0x005]%asi,%l1	! %l1 = 00000027000000ff
!	Mem[0000000030001408] = be45371a, %l0 = 000000003db70e9a
	ldstuba	[%i0+%o4]0x81,%l0	! %l0 = 000000be000000ff
!	Mem[0000000010181415] = ed49370c, %l2 = 920aa7d7fc177490
	ldstuba	[%i6+0x015]%asi,%l2	! %l2 = 00000049000000ff
!	%l2 = 0000000000000049, %l1 = 0000000000000027, %l4 = 000000000e0c2367
	sdivx	%l2,%l1,%l4		! %l4 = 0000000000000001
!	%l7 = 6a399572b1427cf4, Mem[00000000100c1408] = d0f29b99
	stba	%l7,[%i3+%o4]0x88	! Mem[00000000100c1408] = d0f29bf4
!	Mem[0000000010041418] = 02cd0c75, %l5 = 000000001ef5d810, %asi = 80
	swapa	[%i1+0x018]%asi,%l5	! %l5 = 0000000002cd0c75
!	%l6 = a58ec7ca78d5db0f, Mem[0000000010001400] = 4e9375a1
	stba	%l6,[%i0+%g0]0x88	! Mem[0000000010001400] = 4e93750f
!	%l6 = a58ec7ca78d5db0f, Mem[0000000010181400] = da4a4c66
	stwa	%l6,[%i6+%g0]0x88	! Mem[0000000010181400] = 78d5db0f
!	%l2 = 0000000000000049, %l2 = 0000000000000049, %l7 = 6a399572b1427cf4
	sub	%l2,%l2,%l7		! %l7 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = 1521744b, %l6 = a58ec7ca78d5db0f
	lduwa	[%i6+%g0]0x89,%l6	! %l6 = 000000001521744b

p0_label_3:
!	Mem[0000000010101400] = 3e8a6d63, %l4 = 0000000000000001
	ldswa	[%i4+%g0]0x88,%l4	! %l4 = 000000003e8a6d63
!	Mem[0000000010101410] = 585db143, %l5 = 0000000002cd0c75
	lduba	[%i4+%o5]0x88,%l5	! %l5 = 0000000000000043
!	Mem[0000000010041400] = 6226aaa9ac96f309, %f8  = a9916d5f 3afbc871
	ldda	[%i1+%g0]0x88,%f8 	! %f8  = 6226aaa9 ac96f309
!	Mem[0000000010081410] = 9317930a, %l2 = 0000000000000049
	ldswa	[%i2+%o5]0x88,%l2	! %l2 = ffffffff9317930a
!	Mem[0000000010041410] = ccc9fbfb a84f46c8, %l6 = 1521744b, %l7 = 00000000
	ldda	[%i1+%o5]0x88,%l6	! %l6 = 00000000a84f46c8 00000000ccc9fbfb
!	Mem[0000000010041400] = 09f396ac, %f7  = 133a31ec
	lda	[%i1+%g0]0x80,%f7 	! %f7 = 09f396ac
!	Mem[0000000030081408] = d6ff9c2a, %l2 = ffffffff9317930a
	ldsba	[%i2+%o4]0x81,%l2	! %l2 = ffffffffffffffd6
!	Mem[0000000010081408] = db72c76aa644ee8f, %l7 = 00000000ccc9fbfb
	ldxa	[%i2+%o4]0x88,%l7	! %l7 = db72c76aa644ee8f
!	Mem[00000000300c1400] = 79c747592362d96d, %l3 = 00000000a942419c
	ldxa	[%i3+%g0]0x89,%l3	! %l3 = 79c747592362d96d
!	Starting 10 instruction Store Burst
!	%f9  = ac96f309, %f3  = 1261fd6a, %f25 = a66f3780
	fmuls	%f9 ,%f3 ,%f25		! %l0 = 00000000000000e0, Unfinished, %fsr = 0000000000

p0_label_4:
!	Mem[00000000100c1400] = fe2626ed, %l1 = 0000000000000027
	ldstuba	[%i3+%g0]0x88,%l1	! %l1 = 000000ed000000ff
!	%l6 = 00000000a84f46c8, Mem[0000000010041432] = 242711e3
	sth	%l6,[%i1+0x032]		! Mem[0000000010041430] = 242746c8
!	Mem[0000000021800080] = 0457fef6, %l7 = db72c76aa644ee8f
	ldstub	[%o3+0x080],%l7		! %l7 = 00000004000000ff
!	Mem[00000000201c0001] = fc69c9d1, %l0 = 00000000000000e0
	ldstub	[%o0+0x001],%l0		! %l0 = 00000069000000ff
!	%l0 = 0000000000000069, %l5 = 0000000000000043, %l1 = 00000000000000ed
	orn	%l0,%l5,%l1		! %l1 = fffffffffffffffd
!	Mem[0000000010141410] = 64a0dc4c, %l6 = a84f46c8, %l7 = 00000004
	add	%i5,0x10,%g1
	casa	[%g1]0x80,%l6,%l7	! %l7 = 0000000064a0dc4c
!	%f28 = d526c6c8 ef1e71aa, Mem[0000000010041400] = 09f396ac a9aa2662
	stda	%f28,[%i1+%g0]0x80	! Mem[0000000010041400] = d526c6c8 ef1e71aa
!	Mem[0000000010101400] = 636d8a3e, %l6 = 00000000a84f46c8
	swapa	[%i4+%g0]0x80,%l6	! %l6 = 00000000636d8a3e
!	%l5 = 0000000000000043, Mem[0000000030141400] = 110bf644
	stwa	%l5,[%i5+%g0]0x81	! Mem[0000000030141400] = 00000043
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = b1466a929317930a, %f28 = d526c6c8 ef1e71aa
	ldda	[%i2+%o5]0x88,%f28	! %f28 = b1466a92 9317930a

p0_label_5:
!	Mem[0000000030101408] = a84f46c8, %l5 = 0000000000000043
	ldsba	[%i4+%o4]0x89,%l5	! %l5 = ffffffffffffffc8
!	Mem[0000000030181408] = 7dc66b31a9c254aa, %l7 = 0000000064a0dc4c
	ldxa	[%i6+%o4]0x81,%l7	! %l7 = 7dc66b31a9c254aa
!	Mem[0000000030141408] = 97db06f26623f754, %l2 = ffffffffffffffd6
	ldxa	[%i5+%o4]0x81,%l2	! %l2 = 97db06f26623f754
!	Mem[000000001004141c] = df8aea25, %l1 = fffffffffffffffd
	ldsba	[%i1+0x01d]%asi,%l1	! %l1 = ffffffffffffff8a
	membar	#Sync			! Added by membar checker (1)
!	Mem[00000000300c1400] = 6dd96223 5947c779 085097da 315317c0
!	Mem[00000000300c1410] = 80376fa6 42ab6605 e9773d22 49d1610e
!	Mem[00000000300c1420] = 87fed287 5bc2523e 052fd791 6ff8bfb9
!	Mem[00000000300c1430] = 9b55707b 4bea9d38 b835ef8f 04f925de
	ldda	[%i3]ASI_BLK_S,%f16	! Block Load from 00000000300c1400
!	Mem[0000000010101408] = c0dfed16, %l6 = 00000000636d8a3e
	ldswa	[%i4+0x008]%asi,%l6	! %l6 = ffffffffc0dfed16
!	Mem[0000000010141410] = 64a0dc4c3db70e9a, %f10 = 7ff9c63f 08590d12
	ldda	[%i5+%o5]0x80,%f10	! %f10 = 64a0dc4c 3db70e9a
!	Mem[0000000010141400] = 618e2aba, %l2 = 97db06f26623f754
	ldsba	[%i5+%g0]0x80,%l2	! %l2 = 0000000000000061
!	Mem[00000000300c1400] = 79c747592362d96d, %f2  = 867517c3 1261fd6a
	ldda	[%i3+%g0]0x89,%f2 	! %f2  = 79c74759 2362d96d
!	Starting 10 instruction Store Burst
!	%f2  = 79c74759, %f4  = 781c91e0
	fcmpes	%fcc0,%f2 ,%f4 		! %fcc0 = 2

p0_label_6:
!	%l7 = 7dc66b31a9c254aa, Mem[0000000010101400] = c8464fa8
	stha	%l7,[%i4+%g0]0x88	! Mem[0000000010101400] = c84654aa
!	Mem[0000000030181408] = 7dc66b31, %l5 = ffffffffffffffc8
	ldstuba	[%i6+%o4]0x81,%l5	! %l5 = 0000007d000000ff
!	Mem[0000000010141408] = d9805ec1, %l5 = 000000000000007d
	ldstuba	[%i5+%o4]0x80,%l5	! %l5 = 000000d9000000ff
!	%l6 = c0dfed16, %l7 = a9c254aa, Mem[0000000030041408] = 5e0529d2 784dddfc
	stda	%l6,[%i1+%o4]0x81	! Mem[0000000030041408] = c0dfed16 a9c254aa
!	%l1 = ffffffffffffff8a, Mem[0000000030101400] = f97ac03f
	stha	%l1,[%i4+%g0]0x89	! Mem[0000000030101400] = f97aff8a
!	%l0 = 00000069, %l1 = ffffff8a, Mem[0000000030041408] = c0dfed16 a9c254aa
	stda	%l0,[%i1+%o4]0x81	! Mem[0000000030041408] = 00000069 ffffff8a
!	%f3  = 2362d96d, Mem[0000000030141400] = 00000043
	sta	%f3 ,[%i5+%g0]0x81	! Mem[0000000030141400] = 2362d96d
!	Mem[0000000030081408] = d6ff9c2a, %l2 = 0000000000000061
	ldstuba	[%i2+%o4]0x81,%l2	! %l2 = 000000d6000000ff
!	Mem[0000000010101436] = 243ac724, %l0 = 0000000000000069
	ldstuba	[%i4+0x036]%asi,%l0	! %l0 = 000000c7000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = 69000000, %l2 = 00000000000000d6
	ldswa	[%i1+%o4]0x89,%l2	! %l2 = 0000000069000000

p0_label_7:
!	Mem[0000000010041408] = 7511905e1d0001c1, %f12 = 73cdb2f2 890271d1
	ldda	[%i1+%o4]0x88,%f12	! %f12 = 7511905e 1d0001c1
!	Mem[00000000300c1410] = 80376fa6, %f5  = 6a485ce9
	lda	[%i3+%o5]0x81,%f5 	! %f5 = 80376fa6
!	Mem[0000000010141400] = ba2a8e61, %l2 = 0000000069000000
	ldswa	[%i5+%g0]0x88,%l2	! %l2 = ffffffffba2a8e61
!	Mem[0000000030101400] = f97aff8a, %l5 = 00000000000000d9
	lduwa	[%i4+%g0]0x89,%l5	! %l5 = 00000000f97aff8a
!	Mem[0000000030001408] = 1a3745ff, %l5 = 00000000f97aff8a
	ldsha	[%i0+%o4]0x89,%l5	! %l5 = 00000000000045ff
!	Mem[00000000100c1410] = 7141503f 102a0cef, %l6 = c0dfed16, %l7 = a9c254aa
	ldda	[%i3+%o5]0x88,%l6	! %l6 = 00000000102a0cef 000000007141503f
!	Mem[00000000100c1410] = 102a0cef, %l3 = 79c747592362d96d
	lduha	[%i3+%o5]0x88,%l3	! %l3 = 0000000000000cef
!	Mem[0000000010041410] = a84f46c8, %l5 = 00000000000045ff
	lduwa	[%i1+%o5]0x88,%l5	! %l5 = 00000000a84f46c8
!	Mem[0000000010041408] = c101001d, %l4 = 000000003e8a6d63
	lduwa	[%i1+%o4]0x80,%l4	! %l4 = 00000000c101001d
!	Starting 10 instruction Store Burst
!	%f4  = 781c91e0 80376fa6, Mem[0000000010041410] = c8464fa8 fbfbc9cc
	stda	%f4 ,[%i1+%o5]0x80	! Mem[0000000010041410] = 781c91e0 80376fa6

p0_label_8:
!	Mem[0000000030101400] = f97aff8a, %l0 = 00000000000000c7
	ldstuba	[%i4+%g0]0x89,%l0	! %l0 = 0000008a000000ff
!	Mem[0000000020800040] = dd77977d, %l2 = ffffffffba2a8e61
	ldstuba	[%o1+0x040]%asi,%l2	! %l2 = 000000dd000000ff
!	Mem[0000000010181400] = 78d5db0f, %l2 = 00000000000000dd
	ldstuba	[%i6+%g0]0x88,%l2	! %l2 = 0000000f000000ff
!	Mem[000000001004142c] = 1ecf0787, %l4 = c101001d, %l2 = 0000000f
	add	%i1,0x2c,%g1
	casa	[%g1]0x80,%l4,%l2	! %l2 = 000000001ecf0787
!	%l6 = 00000000102a0cef, Mem[0000000021800101] = 32dcd874
	stb	%l6,[%o3+0x101]		! Mem[0000000021800100] = 32efd874
!	Mem[0000000030101400] = ffff7af9, %l2 = 000000001ecf0787
	ldstuba	[%i4+%g0]0x81,%l2	! %l2 = 000000ff000000ff
!	%l3 = 0000000000000cef, Mem[000000001014141c] = bd78ede7, %asi = 80
	stwa	%l3,[%i5+0x01c]%asi	! Mem[000000001014141c] = 00000cef
!	%f6  = 7405d5c6 09f396ac, %l5 = 00000000a84f46c8
!	Mem[00000000100c1420] = 85ef9f3a91ac7e54
	add	%i3,0x020,%g1
	stda	%f6,[%g1+%l5]ASI_PST8_P ! Mem[00000000100c1420] = 74059f3a09ac7e54
!	%l1 = ffffffffffffff8a, Mem[0000000021800040] = 730e48bf
	sth	%l1,[%o3+0x040]		! Mem[0000000021800040] = ff8a48bf
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = 8fee44a6, %l6 = 00000000102a0cef
	ldswa	[%i2+%o4]0x80,%l6	! %l6 = ffffffff8fee44a6

p0_label_9:
!	Mem[0000000010041410] = 781c91e0, %l0 = 000000000000008a
	ldsh	[%i1+%o5],%l0		! %l0 = 000000000000781c
!	%l4 = 00000000c101001d, imm = 0000000000000faa, %l3 = 0000000000000cef
	sub	%l4,0xfaa,%l3		! %l3 = 00000000c100f073
!	Mem[0000000030101410] = 0c662c8c, %l4 = 00000000c101001d
	lduba	[%i4+%o5]0x81,%l4	! %l4 = 000000000000000c
!	%l5 = 00000000a84f46c8, %l7 = 000000007141503f, %l6 = ffffffff8fee44a6
	orn	%l5,%l7,%l6		! %l6 = ffffffffaeffefc8
!	Mem[0000000020800040] = ff77977d, %l6 = ffffffffaeffefc8
	ldub	[%o1+0x041],%l6		! %l6 = 0000000000000077
!	%l0 = 000000000000781c, imm = fffffffffffff8a6, %l1 = ffffffffffffff8a
	addc	%l0,-0x75a,%l1		! %l1 = 00000000000070c2
!	Mem[0000000030041400] = 95fff103, %l3 = 00000000c100f073
	ldsba	[%i1+%g0]0x81,%l3	! %l3 = ffffffffffffff95
!	Mem[00000000100c1408] = d0f29bf4, %l2 = 00000000000000ff
	lduwa	[%i3+%o4]0x88,%l2	! %l2 = 00000000d0f29bf4
!	Mem[00000000100c1400] = ff2626fe, %l0 = 000000000000781c
	lduwa	[%i3+%g0]0x80,%l0	! %l0 = 00000000ff2626fe
!	Starting 10 instruction Store Burst
!	%f2  = 79c74759 2362d96d, Mem[0000000030001408] = 1a3745ff b6381c23
	stda	%f2 ,[%i0+%o4]0x89	! Mem[0000000030001408] = 79c74759 2362d96d

p0_label_10:
!	%f4  = 781c91e0, %f27 = 6ff8bfb9, %f2  = 79c74759
	fdivs	%f4 ,%f27,%f2 		! %f2  = 47a12245
!	%f11 = 3db70e9a, Mem[00000000100c1410] = ef0c2a10
	sta	%f11,[%i3+%o5]0x80	! Mem[00000000100c1410] = 3db70e9a
!	Mem[0000000030001408] = 2362d96d, %l5 = 00000000a84f46c8
	ldstuba	[%i0+%o4]0x89,%l5	! %l5 = 0000006d000000ff
!	%f16 = 6dd96223 5947c779, Mem[0000000030081410] = fd13bb67 54333004
	stda	%f16,[%i2+%o5]0x89	! Mem[0000000030081410] = 6dd96223 5947c779
!	%f1  = 4be67a45, %f22 = e9773d22, %f24 = 87fed287
	fsubs	%f1 ,%f22,%f24		! %f24 = 69773d22
!	Mem[0000000010041434] = 7ca5ac4e, %l3 = ffffffffffffff95
	swap	[%i1+0x034],%l3		! %l3 = 000000007ca5ac4e
!	%l7 = 000000007141503f, Mem[0000000030141408] = 54f72366f206db97
	stxa	%l7,[%i5+%o4]0x89	! Mem[0000000030141408] = 000000007141503f
!	%f1  = 4be67a45, Mem[0000000030081408] = ffff9c2a
	sta	%f1 ,[%i2+%o4]0x81	! Mem[0000000030081408] = 4be67a45
!	%f16 = 6dd96223 5947c779 085097da 315317c0
!	%f20 = 80376fa6 42ab6605 e9773d22 49d1610e
!	%f24 = 69773d22 5bc2523e 052fd791 6ff8bfb9
!	%f28 = 9b55707b 4bea9d38 b835ef8f 04f925de
	stda	%f16,[%i1]ASI_COMMIT_P	! Block Store to 0000000010041400
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = 79c747592362d9ff, %f10 = 64a0dc4c 3db70e9a
	ldda	[%i0+%o4]0x89,%f10	! %f10 = 79c74759 2362d9ff

p0_label_11:
!	Mem[0000000010181408] = 47c0dba2, %l5 = 000000000000006d
	lduba	[%i6+%o4]0x80,%l5	! %l5 = 0000000000000047
!	Mem[00000000218001c0] = 11ca0059, %l6 = 0000000000000077
	lduba	[%o3+0x1c0]%asi,%l6	! %l6 = 0000000000000011
!	Mem[0000000010001408] = 3ecd8197, %f14 = fe1d82a3
	lda	[%i0+%o4]0x88,%f14	! %f14 = 3ecd8197
!	%l7 = 000000007141503f, %l6 = 0000000000000011, %l5 = 0000000000000047
	xor	%l7,%l6,%l5		! %l5 = 000000007141502e
!	Mem[0000000010181410] = ffca7468, %l5 = 000000007141502e
	ldswa	[%i6+%o5]0x88,%l5	! %l5 = ffffffffffca7468
!	Mem[00000000100c1410] = 9a0eb73d, %l7 = 000000007141503f
	ldsba	[%i3+%o5]0x88,%l7	! %l7 = 000000000000003d
!	Mem[0000000020800000] = 23d60d84, %l4 = 000000000000000c
	ldsb	[%o1+%g0],%l4		! %l4 = 0000000000000023
!	Mem[0000000030101400] = ffff7af910c5f634, %l1 = 00000000000070c2
	ldxa	[%i4+%g0]0x81,%l1	! %l1 = ffff7af910c5f634
!	Mem[0000000030141410] = 5eafadb0 31c4bcad, %l6 = 00000011, %l7 = 0000003d
	ldda	[%i5+%o5]0x89,%l6	! %l6 = 0000000031c4bcad 000000005eafadb0
!	Starting 10 instruction Store Burst
!	%f14 = 3ecd8197, Mem[0000000010001410] = a1fe30c8
	sta	%f14,[%i0+0x010]%asi	! Mem[0000000010001410] = 3ecd8197

p0_label_12:
!	Mem[00000000100c1410] = 3db70e9a, %l1 = ffff7af910c5f634
	ldstuba	[%i3+0x010]%asi,%l1	! %l1 = 0000003d000000ff
!	%f13 = 1d0001c1, Mem[0000000030001400] = 1c3a2613
	sta	%f13,[%i0+%g0]0x89	! Mem[0000000030001400] = 1d0001c1
!	%l0 = 00000000ff2626fe, Mem[0000000010181410] = ffca7468
	stba	%l0,[%i6+%o5]0x88	! Mem[0000000010181410] = ffca74fe
	membar	#Sync			! Added by membar checker (2)
!	%f14 = 3ecd8197 61f75dba, Mem[00000000300c1400] = 2362d96d 79c74759
	stda	%f14,[%i3+%g0]0x89	! Mem[00000000300c1400] = 3ecd8197 61f75dba
!	%l7 = 000000005eafadb0, Mem[0000000010041410] = 80376fa6
	stha	%l7,[%i1+%o5]0x80	! Mem[0000000010041410] = adb06fa6
!	%l2 = d0f29bf4, %l3 = 7ca5ac4e, Mem[00000000100c1410] = 9a0eb7ff 7141503f
	stda	%l2,[%i3+%o5]0x88	! Mem[00000000100c1410] = d0f29bf4 7ca5ac4e
!	%l2 = 00000000d0f29bf4, Mem[00000000100c1410] = d0f29bf4
	stba	%l2,[%i3+%o5]0x88	! Mem[00000000100c1410] = d0f29bf4
!	%l0 = 00000000ff2626fe, Mem[0000000030141408] = 7141503f
	stwa	%l0,[%i5+%o4]0x89	! Mem[0000000030141408] = ff2626fe
!	Mem[0000000010081408] = a644ee8f, %l3 = 000000007ca5ac4e
	ldstuba	[%i2+%o4]0x88,%l3	! %l3 = 0000008f000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010041414] = 42ab6605, %l4 = 0000000000000023
	lduwa	[%i1+0x014]%asi,%l4	! %l4 = 0000000042ab6605

p0_label_13:
!	Mem[0000000030001400] = 1d0001c1, %l4 = 0000000042ab6605
	ldsba	[%i0+%g0]0x89,%l4	! %l4 = ffffffffffffffc1
!	Mem[00000000201c0000] = fcffc9d1, %l5 = ffffffffffca7468
	ldsha	[%o0+0x000]%asi,%l5	! %l5 = fffffffffffffcff
!	Mem[0000000030101410] = 0c662c8c, %l5 = fffffffffffffcff
	ldswa	[%i4+%o5]0x81,%l5	! %l5 = 000000000c662c8c
!	Mem[0000000030101400] = ffff7af9, %f16 = 6dd96223
	lda	[%i4+%g0]0x81,%f16	! %f16 = ffff7af9
!	Mem[0000000010141430] = fbb5d0fa, %l1 = 000000000000003d
	ldub	[%i5+0x033],%l1		! %l1 = 00000000000000fa
!	Mem[0000000030081410] = 6dd96223 5947c779, %l0 = ff2626fe, %l1 = 000000fa
	ldda	[%i2+%o5]0x89,%l0	! %l0 = 000000005947c779 000000006dd96223
!	Mem[0000000010001408] = 9781cd3e, %l3 = 000000000000008f
	ldsha	[%i0+%o4]0x80,%l3	! %l3 = ffffffffffff9781
!	Mem[00000000300c1408] = da975008, %l2 = 00000000d0f29bf4
	ldsha	[%i3+%o4]0x89,%l2	! %l2 = 0000000000005008
!	Mem[00000000300c1400] = 61f75dba, %l2 = 0000000000005008
	lduwa	[%i3+%g0]0x89,%l2	! %l2 = 0000000061f75dba
!	Starting 10 instruction Store Burst
!	%f11 = 2362d9ff, Mem[0000000030181400] = 4b742115
	sta	%f11,[%i6+%g0]0x81	! Mem[0000000030181400] = 2362d9ff

p0_label_14:
!	%l7 = 000000005eafadb0, imm = fffffffffffffc87, %l5 = 000000000c662c8c
	addc	%l7,-0x379,%l5		! %l5 = 000000005eafaa37
!	%f3  = 2362d96d, Mem[00000000300c1410] = a66f3780
	sta	%f3 ,[%i3+%o5]0x89	! Mem[00000000300c1410] = 2362d96d
!	%f8  = 6226aaa9 ac96f309, Mem[0000000010001410] = 9781cd3e 3998186f
	stda	%f8 ,[%i0+%o5]0x88	! Mem[0000000010001410] = 6226aaa9 ac96f309
!	Mem[00000000100c1400] = ff2626fe, %l1 = 000000006dd96223
	ldstuba	[%i3+%g0]0x80,%l1	! %l1 = 000000ff000000ff
!	Mem[00000000100c1410] = f49bf2d0, %l1 = 00000000000000ff
	ldstuba	[%i3+%o5]0x80,%l1	! %l1 = 000000f4000000ff
!	%l0 = 000000005947c779, Mem[0000000010181425] = 1850cdf0
	stb	%l0,[%i6+0x025]		! Mem[0000000010181424] = 1879cdf0
!	%f10 = 79c74759 2362d9ff, Mem[0000000030041410] = 8bf42532 6317fb88
	stda	%f10,[%i1+%o5]0x89	! Mem[0000000030041410] = 79c74759 2362d9ff
!	%l0 = 000000005947c779, Mem[0000000010081418] = d5743747
	sth	%l0,[%i2+0x018]		! Mem[0000000010081418] = c7793747
!	Mem[00000000300c1410] = 2362d96d, %l6 = 0000000031c4bcad
	swapa	[%i3+%o5]0x89,%l6	! %l6 = 000000002362d96d
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = 72e51d9b6dd96223, %l4 = ffffffffffffffc1
	ldxa	[%i5+%g0]0x89,%l4	! %l4 = 72e51d9b6dd96223

p0_label_15:
!	%l6 = 000000002362d96d, Mem[0000000030141400] = 6dd96223
	stha	%l6,[%i5+%g0]0x89	! Mem[0000000030141400] = 6dd9d96d
!	Mem[00000000300c1400] = 61f75dba, %f31 = 04f925de
	lda	[%i3+%g0]0x89,%f31	! %f31 = 61f75dba
!	Mem[0000000030141400] = 6dd9d96d, %l7 = 000000005eafadb0
	lduha	[%i5+%g0]0x89,%l7	! %l7 = 000000000000d96d
!	Mem[0000000010001408] = 3ecd8197, %l1 = 00000000000000f4
	lduha	[%i0+%o4]0x88,%l1	! %l1 = 0000000000008197
!	Mem[0000000020800000] = 23d60d84, %l3 = ffffffffffff9781
	ldsb	[%o1+%g0],%l3		! %l3 = 0000000000000023
!	Mem[0000000030041408] = 69000000, %l0 = 000000005947c779
	ldsba	[%i1+%o4]0x89,%l0	! %l0 = 0000000000000000
!	Mem[00000000201c0000] = fcffc9d1, %l0 = 0000000000000000
	ldub	[%o0+0x001],%l0		! %l0 = 00000000000000ff
!	Mem[0000000010081408] = a644eeff, %l3 = 0000000000000023
	lduha	[%i2+%o4]0x88,%l3	! %l3 = 000000000000eeff
!	Mem[0000000010141400] = 618e2aba, %l0 = 00000000000000ff
	ldswa	[%i5+%g0]0x80,%l0	! %l0 = 00000000618e2aba
!	Starting 10 instruction Store Burst
!	%f30 = b835ef8f, Mem[0000000030041400] = 95fff103
	sta	%f30,[%i1+%g0]0x81	! Mem[0000000030041400] = b835ef8f

p0_label_16:
!	Mem[0000000030081408] = 457ae64b, %l0 = 00000000618e2aba
	ldstuba	[%i2+%o4]0x89,%l0	! %l0 = 0000004b000000ff
!	%l5 = 000000005eafaa37, imm = 0000000000000f25, %l2 = 0000000061f75dba
	and	%l5,0xf25,%l2		! %l2 = 0000000000000a25
!	%l4 = 72e51d9b6dd96223, Mem[0000000010101420] = 083790f40e9aa76a
	stx	%l4,[%i4+0x020]		! Mem[0000000010101420] = 72e51d9b6dd96223
!	%l6 = 000000002362d96d, imm = fffffffffffffacf, %l7 = 000000000000d96d
	and	%l6,-0x531,%l7		! %l7 = 000000002362d84d
!	%l3 = 000000000000eeff, Mem[0000000010101400] = a69c20c6c84654aa
	stxa	%l3,[%i4+%g0]0x88	! Mem[0000000010101400] = 000000000000eeff
!	%l1 = 0000000000008197, Mem[0000000010041400] = 6dd962235947c779, %asi = 80
	stxa	%l1,[%i1+0x000]%asi	! Mem[0000000010041400] = 0000000000008197
!	%l4 = 72e51d9b6dd96223, Mem[0000000030141410] = adbcc431
	stba	%l4,[%i5+%o5]0x81	! Mem[0000000030141410] = 23bcc431
!	Mem[00000000300c1400] = 61f75dba, %l5 = 000000005eafaa37
	ldstuba	[%i3+%g0]0x89,%l5	! %l5 = 000000ba000000ff
!	%f22 = e9773d22 49d1610e, Mem[0000000030141408] = fe2626ff 00000000
	stda	%f22,[%i5+%o4]0x81	! Mem[0000000030141408] = e9773d22 49d1610e
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = 2362d9ff, %l4 = 72e51d9b6dd96223
	lduwa	[%i0+%o4]0x89,%l4	! %l4 = 000000002362d9ff

p0_label_17:
!	Mem[0000000010001404] = 4e22978b, %f12 = 7511905e
	lda	[%i0+0x004]%asi,%f12	! %f12 = 4e22978b
!	Mem[0000000030101410] = 408f39598c2c660c, %l6 = 000000002362d96d
	ldxa	[%i4+%o5]0x89,%l6	! %l6 = 408f39598c2c660c
!	Mem[0000000030041408] = 00000069ffffff8a, %l5 = 00000000000000ba
	ldxa	[%i1+%o4]0x81,%l5	! %l5 = 00000069ffffff8a
!	Mem[0000000030081400] = f1055e53, %l3 = 000000000000eeff
	lduwa	[%i2+%g0]0x81,%l3	! %l3 = 00000000f1055e53
!	Mem[0000000010081430] = 50ae413e 8e2ed52e, %l0 = 0000004b, %l1 = 00008197
	ldd	[%i2+0x030],%l0		! %l0 = 0000000050ae413e 000000008e2ed52e
!	Mem[0000000030141408] = 223d77e9, %l4 = 000000002362d9ff
	lduha	[%i5+%o4]0x89,%l4	! %l4 = 00000000000077e9
!	Mem[00000000100c1424] = 09ac7e54, %l5 = 00000069ffffff8a
	lduw	[%i3+0x024],%l5		! %l5 = 0000000009ac7e54
!	Mem[0000000010141420] = 191917ea, %l6 = 408f39598c2c660c
	ldswa	[%i5+0x020]%asi,%l6	! %l6 = 00000000191917ea
!	Mem[0000000030081410] = 79c74759, %l1 = 000000008e2ed52e
	lduba	[%i2+%o5]0x81,%l1	! %l1 = 0000000000000079
!	Starting 10 instruction Store Burst
!	%f22 = e9773d22 49d1610e, %l5 = 0000000009ac7e54
!	Mem[0000000010001408] = 9781cd3e3ca850e1
	add	%i0,0x008,%g1
	stda	%f22,[%g1+%l5]ASI_PST8_PL ! Mem[0000000010001408] = 9781d13e22a877e1

p0_label_18:
!	%l3 = 00000000f1055e53, Mem[0000000010101408] = c0dfed16
	stwa	%l3,[%i4+%o4]0x80	! Mem[0000000010101408] = f1055e53
!	Mem[0000000010101410] = 43b15d58, %l1 = 0000000000000079
	swapa	[%i4+%o5]0x80,%l1	! %l1 = 0000000043b15d58
!	%l0 = 0000000050ae413e, Mem[0000000010081430] = 50ae413e, %asi = 80
	stwa	%l0,[%i2+0x030]%asi	! Mem[0000000010081430] = 50ae413e
!	%l3 = 00000000f1055e53, Mem[0000000030101408] = ccc9fbfba84f46c8
	stxa	%l3,[%i4+%o4]0x89	! Mem[0000000030101408] = 00000000f1055e53
!	%f24 = 69773d22, %f27 = 6ff8bfb9, %f21 = 42ab6605
	fmuls	%f24,%f27,%f21		! %f21 = 7f800000
!	%l0 = 0000000050ae413e, %l1 = 0000000043b15d58, %y  = 00000000
	udiv	%l0,%l1,%l4		! %l4 = 0000000000000001
	mov	%l0,%y			! %y = 50ae413e
!	%f9  = ac96f309, Mem[00000000100c1408] = f49bf2d0
	sta	%f9 ,[%i3+%o4]0x80	! Mem[00000000100c1408] = ac96f309
!	%l7 = 000000002362d84d, Mem[0000000030141410] = 23bcc431b0adaf5e
	stxa	%l7,[%i5+%o5]0x81	! Mem[0000000030141410] = 000000002362d84d
!	%f8  = 6226aaa9, Mem[0000000010001434] = 4d5424fa
	st	%f8 ,[%i0+0x034]	! Mem[0000000010001434] = 6226aaa9
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = ff70b3ec, %l3 = 00000000f1055e53
	ldsh	[%o2+%g0],%l3		! %l3 = ffffffffffffff70

p0_label_19:
!	Mem[0000000010041400] = 00000000, %l3 = ffffffffffffff70
	lduha	[%i1+%g0]0x80,%l3	! %l3 = 0000000000000000
!	Mem[00000000100c1408] = ac96f309, %l2 = 0000000000000a25
	lduwa	[%i3+%o4]0x80,%l2	! %l2 = 00000000ac96f309
!	Mem[0000000030141408] = e9773d22, %l0 = 0000000050ae413e
	lduwa	[%i5+%o4]0x81,%l0	! %l0 = 00000000e9773d22
!	Mem[0000000010141418] = 0d9cec27 00000cef, %l4 = 00000001, %l5 = 09ac7e54
	ldd	[%i5+0x018],%l4		! %l4 = 000000000d9cec27 0000000000000cef
!	Mem[0000000030101410] = 0c662c8c 59398f40, %l6 = 191917ea, %l7 = 2362d84d
	ldda	[%i4+%o5]0x81,%l6	! %l6 = 000000000c662c8c 0000000059398f40
!	Mem[0000000030081410] = 79c74759, %l4 = 000000000d9cec27
	ldsha	[%i2+%o5]0x81,%l4	! %l4 = 00000000000079c7
!	Mem[0000000030181410] = 863fba7b, %l1 = 0000000043b15d58
	lduwa	[%i6+%o5]0x81,%l1	! %l1 = 00000000863fba7b
!	Mem[00000000100c1408] = ac96f30972aa09a6, %f14 = 3ecd8197 61f75dba
	ldda	[%i3+%o4]0x80,%f14	! %f14 = ac96f309 72aa09a6
!	Mem[00000000211c0000] = ff70b3ec, %l5 = 0000000000000cef
	lduba	[%o2+0x000]%asi,%l5	! %l5 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l0 = 00000000e9773d22, Mem[0000000030101408] = 535e05f1
	stwa	%l0,[%i4+%o4]0x81	! Mem[0000000030101408] = e9773d22

p0_label_20:
!	%f24 = 69773d22 5bc2523e, Mem[0000000030001410] = 98015fb5 1c0c4466
	stda	%f24,[%i0+%o5]0x89	! Mem[0000000030001410] = 69773d22 5bc2523e
!	%l0 = e9773d22, %l1 = 863fba7b, Mem[0000000030041408] = 69000000 8affffff
	stda	%l0,[%i1+%o4]0x89	! Mem[0000000030041408] = e9773d22 863fba7b
!	%l2 = 00000000ac96f309, %l3 = 0000000000000000, %l5 = 00000000000000ff
	addc	%l2,%l3,%l5		! %l5 = 00000000ac96f309
!	%f22 = e9773d22 49d1610e, Mem[00000000100c1410] = ff9bf2d0 4eaca57c
	stda	%f22,[%i3+%o5]0x80	! Mem[00000000100c1410] = e9773d22 49d1610e
!	Mem[0000000030181408] = 316bc6ff, %l6 = 000000000c662c8c
	swapa	[%i6+%o4]0x89,%l6	! %l6 = 00000000316bc6ff
!	%l7 = 0000000059398f40, Mem[0000000030101408] = 00000000223d77e9
	stxa	%l7,[%i4+%o4]0x89	! Mem[0000000030101408] = 0000000059398f40
!	%l5 = 00000000ac96f309, Mem[0000000030041400] = b835ef8f3d604a9c
	stxa	%l5,[%i1+%g0]0x81	! Mem[0000000030041400] = 00000000ac96f309
!	%l5 = 00000000ac96f309, Mem[0000000030081410] = 79c747592362d96d
	stxa	%l5,[%i2+%o5]0x81	! Mem[0000000030081410] = 00000000ac96f309
!	%l4 = 000079c7, %l5 = ac96f309, Mem[0000000030001400] = c101001d acec2843
	stda	%l4,[%i0+%g0]0x81	! Mem[0000000030001400] = 000079c7 ac96f309
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = e9773d22 49d1610e, %l4 = 000079c7, %l5 = ac96f309
	ldda	[%i3+%o5]0x80,%l4	! %l4 = 00000000e9773d22 0000000049d1610e

p0_label_21:
!	Mem[0000000030101400] = f97affff, %l6 = 00000000316bc6ff
	lduba	[%i4+%g0]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010141418] = 0d9cec27, %l1 = 00000000863fba7b
	ldsha	[%i5+0x01a]%asi,%l1	! %l1 = ffffffffffffec27
!	Mem[0000000010141400] = 618e2aba, %l4 = 00000000e9773d22
	ldsha	[%i5+%g0]0x80,%l4	! %l4 = 000000000000618e
!	Mem[0000000010141410] = 64a0dc4c 3db70e9a, %l6 = 000000ff, %l7 = 59398f40
	ldda	[%i5+%o5]0x80,%l6	! %l6 = 0000000064a0dc4c 000000003db70e9a
!	Mem[0000000010041400] = 97810000 00000000, %l0 = e9773d22, %l1 = ffffec27
	ldda	[%i1+%g0]0x88,%l0	! %l0 = 0000000000000000 0000000097810000
!	%f9  = ac96f309, %f21 = 7f800000, %f2  = 47a12245
	fdivs	%f9 ,%f21,%f2 		! %f2  = 80000000
!	Mem[00000000100c1400] = ff2626fe99428988, %l2 = 00000000ac96f309
	ldxa	[%i3+%g0]0x80,%l2	! %l2 = ff2626fe99428988
!	Mem[00000000100c1410] = e9773d2249d1610e, %l1 = 0000000097810000
	ldxa	[%i3+%o5]0x80,%l1	! %l1 = e9773d2249d1610e
!	Mem[0000000010041410] = adb06fa642ab6605, %l7 = 000000003db70e9a, %l7 = 000000003db70e9a
	add	%i1,0x10,%g1
	casxa	[%g1]0x80,%l7,%l7	! %l7 = adb06fa642ab6605
!	Starting 10 instruction Store Burst
!	Mem[0000000010101408] = f1055e53, %l7 = adb06fa642ab6605
	swapa	[%i4+%o4]0x80,%l7	! %l7 = 00000000f1055e53

p0_label_22:
!	%l4 = 000000000000618e, immd = 00000000000002d7, %l5  = 0000000049d1610e
	mulx	%l4,0x2d7,%l5		! %l5 = 0000000001150a42
!	Mem[0000000030101400] = f97affff, %l4 = 000000000000618e
	swapa	[%i4+%g0]0x89,%l4	! %l4 = 00000000f97affff
!	%l5 = 0000000001150a42, Mem[0000000010041410] = a66fb0ad
	stba	%l5,[%i1+%o5]0x88	! Mem[0000000010041410] = a66fb042
!	%f24 = 69773d22 5bc2523e, Mem[00000000300c1410] = adbcc431 42ab6605
	stda	%f24,[%i3+%o5]0x81	! Mem[00000000300c1410] = 69773d22 5bc2523e
!	%f12 = 4e22978b, Mem[0000000010001400] = 0f75934e
	sta	%f12,[%i0+%g0]0x80	! Mem[0000000010001400] = 4e22978b
!	%l7 = 00000000f1055e53, Mem[0000000010101400] = 000000000000eeff
	stxa	%l7,[%i4+%g0]0x88	! Mem[0000000010101400] = 00000000f1055e53
!	%l2 = 99428988, %l3 = 00000000, Mem[0000000030041410] = ffd96223 5947c779
	stda	%l2,[%i1+%o5]0x81	! Mem[0000000030041410] = 99428988 00000000
!	%f6  = 7405d5c6 09f396ac, Mem[00000000300c1400] = 61f75dff 3ecd8197
	stda	%f6 ,[%i3+%g0]0x89	! Mem[00000000300c1400] = 7405d5c6 09f396ac
!	%l4 = 00000000f97affff, Mem[0000000010181400] = ffdbd578
	stha	%l4,[%i6+%g0]0x80	! Mem[0000000010181400] = ffffd578
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = 42b06fa6, %l6 = 0000000064a0dc4c
	lduha	[%i1+%o5]0x80,%l6	! %l6 = 00000000000042b0

p0_label_23:
!	Mem[0000000030081410] = 00000000, %l0 = 0000000000000000
	ldsba	[%i2+%o5]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000030001400] = 000079c7, %l0 = 0000000000000000
	lduba	[%i0+%g0]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000010141410] = 64a0dc4c, %l1 = e9773d2249d1610e
	lduha	[%i5+%o5]0x80,%l1	! %l1 = 00000000000064a0
!	Mem[0000000030101400] = 8e61000010c5f634, %f24 = 69773d22 5bc2523e
	ldda	[%i4+%g0]0x81,%f24	! %f24 = 8e610000 10c5f634
!	Mem[0000000030101400] = 8e610000, %f5  = 80376fa6
	lda	[%i4+%g0]0x81,%f5 	! %f5 = 8e610000
!	Mem[0000000030181400] = 2362d9ff, %l6 = 00000000000042b0
	ldsba	[%i6+%g0]0x81,%l6	! %l6 = 0000000000000023
!	Mem[0000000020800040] = ff77977d, %l7 = 00000000f1055e53
	lduba	[%o1+0x040]%asi,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030081408] = 457ae6ff, %l3 = 0000000000000000
	lduha	[%i2+%o4]0x89,%l3	! %l3 = 000000000000e6ff
!	Mem[0000000030101408] = 0000000059398f40, %f20 = 80376fa6 7f800000
	ldda	[%i4+%o4]0x89,%f20	! %f20 = 00000000 59398f40
!	Starting 10 instruction Store Burst
!	Mem[000000001014140e] = e32f68ef, %l3 = 000000000000e6ff
	ldstub	[%i5+0x00e],%l3		! %l3 = 00000068000000ff

p0_label_24:
!	%l1 = 00000000000064a0, Mem[0000000010041408] = da975008
	stha	%l1,[%i1+%o4]0x88	! Mem[0000000010041408] = da9764a0
!	Mem[0000000010181410] = fe74caffedff370c, %l7 = 00000000000000ff, %l3 = 0000000000000068
	add	%i6,0x10,%g1
	casxa	[%g1]0x80,%l7,%l3	! %l3 = fe74caffedff370c
!	Mem[0000000020800001] = 23d60d84, %l5 = 0000000001150a42
	ldstuba	[%o1+0x001]%asi,%l5	! %l5 = 000000d6000000ff
!	%l7 = 00000000000000ff, Mem[0000000030001400] = 000079c7
	stha	%l7,[%i0+%g0]0x81	! Mem[0000000030001400] = 00ff79c7
!	%l7 = 00000000000000ff, Mem[0000000030181408] = 8c2c660c
	stha	%l7,[%i6+%o4]0x81	! Mem[0000000030181408] = 00ff660c
!	%f4  = 781c91e0, Mem[0000000010141400] = 618e2aba
	sta	%f4 ,[%i5+%g0]0x80	! Mem[0000000010141400] = 781c91e0
!	Mem[00000000211c0000] = ff70b3ec, %l2 = ff2626fe99428988
	ldstub	[%o2+%g0],%l2		! %l2 = 000000ff000000ff
!	Mem[0000000010141410] = 4cdca064, %l0 = 0000000000000000
	ldstuba	[%i5+%o5]0x88,%l0	! %l0 = 00000064000000ff
!	%l4 = f97affff, %l5 = 000000d6, Mem[0000000010001400] = 4e22978b 4e22978b
	stda	%l4,[%i0+%g0]0x80	! Mem[0000000010001400] = f97affff 000000d6
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = 09f396ac, %l3 = fe74caffedff370c
	ldswa	[%i3+%o4]0x88,%l3	! %l3 = 0000000009f396ac

p0_label_25:
!	Mem[00000000201c0000] = fcffc9d1, %l5 = 00000000000000d6
	ldsha	[%o0+0x000]%asi,%l5	! %l5 = fffffffffffffcff
!	Mem[00000000211c0000] = ff70b3ec, %l4 = 00000000f97affff
	ldsb	[%o2+%g0],%l4		! %l4 = ffffffffffffffff
!	Mem[0000000010081408] = ffee44a66ac772db, %f10 = 79c74759 2362d9ff
	ldda	[%i2+%o4]0x80,%f10	! %f10 = ffee44a6 6ac772db
!	Mem[0000000030041400] = 00000000, %l2 = 00000000000000ff
	lduha	[%i1+%g0]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000030041400] = 00000000, %l7 = 00000000000000ff
	lduha	[%i1+%g0]0x89,%l7	! %l7 = 0000000000000000
!	Mem[00000000100c1408] = ac96f30972aa09a6, %l6 = 0000000000000023
	ldxa	[%i3+%o4]0x80,%l6	! %l6 = ac96f30972aa09a6
!	Mem[0000000030141410] = 4dd8622300000000, %f14 = ac96f309 72aa09a6
	ldda	[%i5+%o5]0x89,%f14	! %f14 = 4dd86223 00000000
!	Mem[0000000030041400] = 09f396ac 00000000, %l4 = ffffffff, %l5 = fffffcff
	ldda	[%i1+%g0]0x89,%l4	! %l4 = 0000000000000000 0000000009f396ac
!	Mem[0000000010081410] = 0a931793 926a46b1, %l4 = 00000000, %l5 = 09f396ac
	ldda	[%i2+%o5]0x80,%l4	! %l4 = 000000000a931793 00000000926a46b1
!	Starting 10 instruction Store Burst
!	Mem[0000000010041400] = 00000000, %l7 = 0000000000000000, %asi = 80
	swapa	[%i1+0x000]%asi,%l7	! %l7 = 0000000000000000

p0_label_26:
!	%l5 = 00000000926a46b1, Mem[0000000010081410] = 9317930a
	stwa	%l5,[%i2+%o5]0x88	! Mem[0000000010081410] = 926a46b1
!	%l7 = 0000000000000000, Mem[0000000020800000] = 23ff0d84, %asi = 80
	stha	%l7,[%o1+0x000]%asi	! Mem[0000000020800000] = 00000d84
!	%l5 = 00000000926a46b1, Mem[0000000010001410] = 09f396ac
	stwa	%l5,[%i0+%o5]0x80	! Mem[0000000010001410] = 926a46b1
!	%l5 = 00000000926a46b1, %l4 = 000000000a931793, %l1 = 00000000000064a0
	sdivx	%l5,%l4,%l1		! %l1 = 000000000000000d
!	Mem[0000000010081414] = 926a46b1, %l2 = 00000000, %l3 = 09f396ac
	add	%i2,0x14,%g1
	casa	[%g1]0x80,%l2,%l3	! %l3 = 00000000926a46b1
!	%l2 = 00000000, %l3 = 926a46b1, Mem[0000000030101408] = 408f3959 00000000
	stda	%l2,[%i4+%o4]0x81	! Mem[0000000030101408] = 00000000 926a46b1
!	Mem[0000000010041420] = 69773d22, %l5 = 926a46b1, %l0 = 00000064
	add	%i1,0x20,%g1
	casa	[%g1]0x80,%l5,%l0	! %l0 = 0000000069773d22
!	%l4 = 000000000a931793, Mem[0000000010141421] = 191917ea, %asi = 80
	stba	%l4,[%i5+0x021]%asi	! Mem[0000000010141420] = 199317ea
!	%l6 = ac96f30972aa09a6, Mem[0000000010081410] = 926a46b1
	stha	%l6,[%i2+%o5]0x88	! Mem[0000000010081410] = 926a09a6
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = a2dbc047, %f24 = 8e610000
	lda	[%i6+%o4]0x88,%f24	! %f24 = a2dbc047

p0_label_27:
!	Mem[0000000030141410] = 00000000, %l3 = 00000000926a46b1
	ldsba	[%i5+%o5]0x81,%l3	! %l3 = 0000000000000000
!	%l2 = 0000000000000000, immed = 0000046e, %y  = 50ae413e
	umul	%l2,0x46e,%l6		! %l6 = 0000000000000000, %y = 00000000
!	Mem[0000000010001400] = f97affff, %l6 = 0000000000000000
	ldsba	[%i0+0x003]%asi,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010181410] = fe74caff, %f11 = 6ac772db
	lda	[%i6+%o5]0x80,%f11	! %f11 = fe74caff
!	Mem[0000000010101424] = 6dd96223, %f10 = ffee44a6
	ld	[%i4+0x024],%f10	! %f10 = 6dd96223
!	Mem[0000000010081410] = 926a09a6, %l5 = 00000000926a46b1
	ldsha	[%i2+%o5]0x88,%l5	! %l5 = 00000000000009a6
!	Mem[0000000030181410] = 8af71b68 7bba3f86, %l0 = 69773d22, %l1 = 0000000d
	ldda	[%i6+%o5]0x89,%l0	! %l0 = 000000007bba3f86 000000008af71b68
!	Mem[0000000010001428] = dd645a89f75c5668, %f24 = a2dbc047 10c5f634
	ldd	[%i0+0x028],%f24	! %f24 = dd645a89 f75c5668
!	Mem[0000000030181400] = ffd96223, %l2 = 0000000000000000
	lduba	[%i6+%g0]0x89,%l2	! %l2 = 0000000000000023
!	Starting 10 instruction Store Burst
!	%f12 = 4e22978b 1d0001c1, Mem[0000000010001420] = 7e524ebb 04d20a46
	stda	%f12,[%i0+0x020]%asi	! Mem[0000000010001420] = 4e22978b 1d0001c1

p0_label_28:
!	%l3 = 0000000000000000, Mem[00000000100c1410] = e9773d22
	stha	%l3,[%i3+%o5]0x80	! Mem[00000000100c1410] = 00003d22
!	Mem[0000000010181408] = 47c0dba2, %l0 = 000000007bba3f86
	ldstub	[%i6+%o4],%l0		! %l0 = 00000047000000ff
!	%l4 = 000000000a931793, Mem[0000000030141400] = 6dd9d96d
	stha	%l4,[%i5+%g0]0x81	! Mem[0000000030141400] = 1793d96d
!	%l6 = ffffffffffffffff, Mem[000000001008143e] = e2263cb1, %asi = 80
	stba	%l6,[%i2+0x03e]%asi	! Mem[000000001008143c] = e226ffb1
!	%f26 = 052fd791 6ff8bfb9, Mem[0000000010141408] = ff805ec1 e32fffef
	stda	%f26,[%i5+%o4]0x80	! Mem[0000000010141408] = 052fd791 6ff8bfb9
!	%f22 = e9773d22 49d1610e, %l2 = 0000000000000023
!	Mem[0000000010001400] = f97affff000000d6
	stda	%f22,[%i0+%l2]ASI_PST32_PL ! Mem[0000000010001400] = 0e61d149223d77e9
!	%l0 = 0000000000000047, Mem[0000000010001410] = 926a46b1
	stba	%l0,[%i0+%o5]0x80	! Mem[0000000010001410] = 476a46b1
!	Mem[0000000010141400] = 781c91e0, %l3 = 0000000000000000
	swapa	[%i5+%g0]0x80,%l3	! %l3 = 00000000781c91e0
!	%f31 = 61f75dba, Mem[0000000030101410] = 8c2c660c
	sta	%f31,[%i4+%o5]0x89	! Mem[0000000030101410] = 61f75dba
!	Starting 10 instruction Load Burst
!	%l7 = 0000000000000000, imm = fffffffffffff411, %l3 = 00000000781c91e0
	or	%l7,-0xbef,%l3		! %l3 = fffffffffffff411

p0_label_29:
!	Mem[0000000030181400] = 2362d9ff291fd186, %f20 = 00000000 59398f40
	ldda	[%i6+%g0]0x81,%f20	! %f20 = 2362d9ff 291fd186
!	Mem[0000000030041400] = 00000000, %l2 = 0000000000000023
	ldsha	[%i1+%g0]0x89,%l2	! %l2 = 0000000000000000
	membar	#Sync			! Added by membar checker (3)
!	Mem[0000000010181400] = ffffd578 f9ff6d1d ffc0dba2 2ad7340b
!	Mem[0000000010181410] = fe74caff edff370c 30ef70ef fe8f387f
!	Mem[0000000010181420] = 5bf3f83d 1879cdf0 6853bd89 548612b5
!	Mem[0000000010181430] = c2809bda ce9357a6 c4d9e35f 88f88aa3
	ldda	[%i6]ASI_BLK_P,%f16	! Block Load from 0000000010181400
!	Mem[0000000010081410] = 926a09a6, %l6 = ffffffffffffffff
	lduba	[%i2+%o5]0x88,%l6	! %l6 = 00000000000000a6
!	Mem[0000000030041408] = e9773d22, %f13 = 1d0001c1
	lda	[%i1+%o4]0x89,%f13	! %f13 = e9773d22
!	Mem[0000000030001408] = 2362d9ff, %l6 = 00000000000000a6
	ldswa	[%i0+%o4]0x89,%l6	! %l6 = 000000002362d9ff
!	Mem[0000000010081410] = a6096a92, %l5 = 00000000000009a6
	lduha	[%i2+%o5]0x80,%l5	! %l5 = 000000000000a609
!	Mem[0000000010181428] = 6853bd89, %l2 = 0000000000000000
	lduw	[%i6+0x028],%l2		! %l2 = 000000006853bd89
!	%f12 = 4e22978b, %f4  = 781c91e0, %f2  = 80000000 2362d96d
	fsmuld	%f12,%f4 ,%f2 		! %f2  = 48d8dc3f b3952800
!	Starting 10 instruction Store Burst
!	%l2 = 000000006853bd89, Mem[0000000010101438] = 1e80263e
	stb	%l2,[%i4+0x038]		! Mem[0000000010101438] = 8980263e

p0_label_30:
!	%f6  = 7405d5c6 09f396ac, Mem[00000000100c1400] = ff2626fe 99428988
	stda	%f6 ,[%i3+%g0]0x80	! Mem[00000000100c1400] = 7405d5c6 09f396ac
!	%f0  = 12be9cf8 4be67a45 48d8dc3f b3952800
!	%f4  = 781c91e0 8e610000 7405d5c6 09f396ac
!	%f8  = 6226aaa9 ac96f309 6dd96223 fe74caff
!	%f12 = 4e22978b e9773d22 4dd86223 00000000
	stda	%f0,[%i0]ASI_COMMIT_S	! Block Store to 0000000030001400
!	%f16 = ffffd578 f9ff6d1d, Mem[00000000100c1408] = ac96f309 72aa09a6
	stda	%f16,[%i3+%o4]0x80	! Mem[00000000100c1408] = ffffd578 f9ff6d1d
	membar	#Sync			! Added by membar checker (4)
!	%f18 = ffc0dba2 2ad7340b, %l2 = 000000006853bd89
!	Mem[0000000010001438] = 93e4c240c7628b5f
	add	%i0,0x038,%g1
	stda	%f18,[%g1+%l2]ASI_PST16_P ! Mem[0000000010001438] = ffc0c240c762340b
!	%l6 = 2362d9ff, %l7 = 00000000, Mem[0000000030181410] = 7bba3f86 8af71b68
	stda	%l6,[%i6+%o5]0x89	! Mem[0000000030181410] = 2362d9ff 00000000
!	%f16 = ffffd578 f9ff6d1d ffc0dba2 2ad7340b
!	%f20 = fe74caff edff370c 30ef70ef fe8f387f
!	%f24 = 5bf3f83d 1879cdf0 6853bd89 548612b5
!	%f28 = c2809bda ce9357a6 c4d9e35f 88f88aa3
	stda	%f16,[%i3]ASI_BLK_P	! Block Store to 00000000100c1400
!	Mem[0000000010001410] = 476a46b1, %l1 = 000000008af71b68
	ldstuba	[%i0+%o5]0x80,%l1	! %l1 = 00000047000000ff
!	Mem[0000000030081400] = 535e05f1, %l2 = 000000006853bd89
	swapa	[%i2+%g0]0x89,%l2	! %l2 = 00000000535e05f1
!	%l6 = 000000002362d9ff, Mem[0000000010101400] = 535e05f1
	stha	%l6,[%i4+%g0]0x80	! Mem[0000000010101400] = d9ff05f1
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = 48d8dc3f, %l1 = 0000000000000047
	lduba	[%i0+%o4]0x81,%l1	! %l1 = 0000000000000048

p0_label_31:
!	Mem[0000000010041400] = 00000000, %f14 = 4dd86223
	lda	[%i1+%g0]0x80,%f14	! %f14 = 00000000
!	Mem[0000000030141410] = 00000000, %l7 = 0000000000000000
	ldswa	[%i5+%o5]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000010181410] = 0c37ffedffca74fe, %f14 = 00000000 00000000
	ldda	[%i6+%o5]0x88,%f14	! %f14 = 0c37ffed ffca74fe
!	Mem[0000000030081400] = 89bd5368236992c3, %l6 = 000000002362d9ff
	ldxa	[%i2+%g0]0x81,%l6	! %l6 = 89bd5368236992c3
!	%l5 = 000000000000a609, imm = fffffffffffff2a8, %l3 = fffffffffffff411
	andn	%l5,-0xd58,%l3		! %l3 = 0000000000000401
!	Mem[0000000030081400] = 89bd5368236992c3, %f10 = 6dd96223 fe74caff
	ldda	[%i2+%g0]0x81,%f10	! %f10 = 89bd5368 236992c3
!	Mem[0000000030001408] = 48d8dc3fb3952800, %l1 = 0000000000000048
	ldxa	[%i0+%o4]0x81,%l1	! %l1 = 48d8dc3fb3952800
!	Mem[0000000030001408] = 48d8dc3f, %l6 = 89bd5368236992c3
	lduba	[%i0+%o4]0x81,%l6	! %l6 = 0000000000000048
!	Mem[0000000020800000] = 00000d84, %l2 = 00000000535e05f1
	lduba	[%o1+0x000]%asi,%l2	! %l2 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010001410] = b1466aff, %l7 = 0000000000000000
	ldstuba	[%i0+%o5]0x88,%l7	! %l7 = 000000ff000000ff

p0_label_32:
!	%l2 = 0000000000000000, Mem[0000000030041400] = 00000000
	stwa	%l2,[%i1+%g0]0x81	! Mem[0000000030041400] = 00000000
!	%f13 = e9773d22, Mem[0000000030001410] = e0911c78
	sta	%f13,[%i0+%o5]0x89	! Mem[0000000030001410] = e9773d22
!	Mem[0000000010141400] = 00000000, %l5 = 000000000000a609
	ldstuba	[%i5+%g0]0x80,%l5	! %l5 = 00000000000000ff
!	%f14 = 0c37ffed ffca74fe, %l1 = 48d8dc3fb3952800
!	Mem[0000000010101438] = 8980263e21f13502
	add	%i4,0x038,%g1
	stda	%f14,[%g1+%l1]ASI_PST32_PL ! Mem[0000000010101438] = 8980263e21f13502
!	Mem[0000000010001400] = 0e61d149, %l4 = 000000000a931793
	ldstuba	[%i0+%g0]0x80,%l4	! %l4 = 0000000e000000ff
!	%f10 = 89bd5368, %f11 = 236992c3
	fcmpes	%fcc2,%f10,%f11		! %fcc2 = 1
!	Mem[0000000010181408] = ffc0dba2, %l1 = 48d8dc3fb3952800
	swapa	[%i6+%o4]0x80,%l1	! %l1 = 00000000ffc0dba2
!	%l6 = 0000000000000048, Mem[0000000030101408] = 00000000
	stba	%l6,[%i4+%o4]0x89	! Mem[0000000030101408] = 00000048
!	%f6  = 7405d5c6 09f396ac, %l3 = 0000000000000401
!	Mem[0000000010081428] = 57899fbb1f9bc41d
	add	%i2,0x028,%g1
	stda	%f6,[%g1+%l3]ASI_PST8_P ! Mem[0000000010081428] = 57899fbb1f9bc4ac
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = 863fba7be9773d22, %f6  = 7405d5c6 09f396ac
	ldda	[%i1+%o4]0x89,%f6 	! %f6  = 863fba7b e9773d22

p0_label_33:
!	Mem[0000000030001410] = e9773d22, %l6 = 0000000000000048
	ldsba	[%i0+%o5]0x89,%l6	! %l6 = 0000000000000022
!	Mem[0000000030181410] = 00000000 2362d9ff, %l6 = 00000022, %l7 = 000000ff
	ldda	[%i6+%o5]0x89,%l6	! %l6 = 000000002362d9ff 0000000000000000
!	Mem[0000000021800140] = 58095df1, %l4 = 000000000000000e
	ldsha	[%o3+0x140]%asi,%l4	! %l4 = 0000000000005809
!	Mem[0000000010081434] = 8e2ed52e, %l7 = 0000000000000000
	ldsba	[%i2+0x037]%asi,%l7	! %l7 = 000000000000002e
!	Mem[0000000010181408] = 002895b3, %f11 = 236992c3
	lda	[%i6+%o4]0x88,%f11	! %f11 = 002895b3
!	Mem[0000000010081438] = 55790d32e226ffb1, %f0  = 12be9cf8 4be67a45
	ldd	[%i2+0x038],%f0 	! %f0  = 55790d32 e226ffb1
!	Mem[00000000300c1410] = 3e52c25b223d7769, %l6 = 000000002362d9ff
	ldxa	[%i3+%o5]0x89,%l6	! %l6 = 3e52c25b223d7769
!	Mem[0000000030041400] = 00000000, %l0 = 0000000000000047
	lduwa	[%i1+%g0]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000010181400] = 1d6dfff978d5ffff, %f0  = 55790d32 e226ffb1
	ldda	[%i6+%g0]0x88,%f0 	! %f0  = 1d6dfff9 78d5ffff
!	Starting 10 instruction Store Burst
!	%l5 = 0000000000000000, Mem[00000000201c0001] = fcffc9d1
	stb	%l5,[%o0+0x001]		! Mem[00000000201c0000] = fc00c9d1

p0_label_34:
!	Mem[0000000030101408] = 48000000, %l4 = 0000000000005809
	ldstuba	[%i4+%o4]0x81,%l4	! %l4 = 00000048000000ff
!	%l2 = 0000000000000000, Mem[0000000030001408] = 48d8dc3f
	stha	%l2,[%i0+%o4]0x81	! Mem[0000000030001408] = 0000dc3f
!	Mem[0000000020800000] = 00000d84, %l6 = 3e52c25b223d7769
	ldstuba	[%o1+0x000]%asi,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010101408] = 0566ab42, %l2 = 0000000000000000
	swapa	[%i4+%o4]0x88,%l2	! %l2 = 000000000566ab42
	membar	#Sync			! Added by membar checker (5)
!	Mem[00000000100c1418] = 30ef70effe8f387f, %l4 = 0000000000000048, %l2 = 000000000566ab42
	add	%i3,0x18,%g1
	casxa	[%g1]0x80,%l4,%l2	! %l2 = 30ef70effe8f387f
!	Mem[0000000030001410] = 223d77e9, %l1 = 00000000ffc0dba2
	ldstuba	[%i0+%o5]0x81,%l1	! %l1 = 00000022000000ff
!	%l4 = 0000000000000048, Mem[0000000010001408] = 3ed18197
	stwa	%l4,[%i0+%o4]0x88	! Mem[0000000010001408] = 00000048
!	%f16 = ffffd578 f9ff6d1d, Mem[0000000030081410] = 00000000 ac96f309
	stda	%f16,[%i2+%o5]0x81	! Mem[0000000030081410] = ffffd578 f9ff6d1d
!	Mem[0000000010041408] = a06497da, %l2 = 30ef70effe8f387f
	swapa	[%i1+%o4]0x80,%l2	! %l2 = 00000000a06497da
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1428] = 6853bd89, %f12 = 4e22978b
	lda	[%i3+0x028]%asi,%f12	! %f12 = 6853bd89

p0_label_35:
!	Mem[0000000010041410] = 42b06fa642ab6605, %l2 = 00000000a06497da
	ldx	[%i1+%o5],%l2		! %l2 = 42b06fa642ab6605
!	Mem[0000000030081400] = 6853bd89, %f15 = ffca74fe
	lda	[%i2+%g0]0x89,%f15	! %f15 = 6853bd89
!	Mem[00000000100c1400] = 78d5ffff, %f31 = 88f88aa3
	lda	[%i3+%g0]0x88,%f31	! %f31 = 78d5ffff
!	Mem[0000000030081400] = 6853bd89, %l2 = 42b06fa642ab6605
	ldswa	[%i2+%g0]0x89,%l2	! %l2 = 000000006853bd89
!	Mem[0000000010081438] = 55790d32 e226ffb1, %l6 = 00000000, %l7 = 0000002e
	ldd	[%i2+0x038],%l6		! %l6 = 0000000055790d32 00000000e226ffb1
!	Mem[0000000010181400] = ffffd578, %l2 = 000000006853bd89
	ldsba	[%i6+%g0]0x80,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000010141410] = 4cdca0ff, %l6 = 0000000055790d32
	lduwa	[%i5+%o5]0x88,%l6	! %l6 = 000000004cdca0ff
!	Mem[0000000030081400] = 89bd5368, %l1 = 0000000000000022
	lduba	[%i2+%g0]0x81,%l1	! %l1 = 0000000000000089
!	Mem[0000000010081408] = a644eeff, %l3 = 0000000000000401
	lduwa	[%i2+%o4]0x88,%l3	! %l3 = 00000000a644eeff
!	Starting 10 instruction Store Burst
!	Mem[0000000010041410] = 42b06fa6, %l2 = ffffffffffffffff
	swapa	[%i1+%o5]0x80,%l2	! %l2 = 0000000042b06fa6

p0_label_36:
!	Mem[0000000030141400] = 1793d96d, %l2 = 0000000042b06fa6
	ldstuba	[%i5+%g0]0x81,%l2	! %l2 = 00000017000000ff
!	Mem[0000000030081410] = ffffd578, %l7 = 00000000e226ffb1
	swapa	[%i2+%o5]0x81,%l7	! %l7 = 00000000ffffd578
!	%f16 = ffffd578 f9ff6d1d, Mem[0000000010001418] = 4799c89c 820ba773
	std	%f16,[%i0+0x018]	! Mem[0000000010001418] = ffffd578 f9ff6d1d
!	Mem[0000000010101408] = 00000000, %l0 = 0000000000000000
	ldstuba	[%i4+%o4]0x88,%l0	! %l0 = 00000000000000ff
!	%l3 = 00000000a644eeff, Mem[00000000201c0000] = fc00c9d1
	sth	%l3,[%o0+%g0]		! Mem[00000000201c0000] = eeffc9d1
!	Mem[0000000010141410] = ffa0dc4c, %l6 = 000000004cdca0ff
	ldstuba	[%i5+%o5]0x80,%l6	! %l6 = 000000ff000000ff
!	%l5 = 0000000000000000, Mem[0000000010001400] = 49d161ff
	stba	%l5,[%i0+%g0]0x88	! Mem[0000000010001400] = 49d16100
!	%l4 = 00000048, %l5 = 00000000, Mem[0000000030041410] = 99428988 00000000
	stda	%l4,[%i1+%o5]0x81	! Mem[0000000030041410] = 00000048 00000000
!	%f8  = 6226aaa9, Mem[0000000030181410] = 2362d9ff
	sta	%f8 ,[%i6+%o5]0x89	! Mem[0000000030181410] = 6226aaa9
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = 09f396ac, %l2 = 0000000000000017
	lduba	[%i3+%g0]0x89,%l2	! %l2 = 00000000000000ac

p0_label_37:
!	Mem[0000000010081400] = efc6952e, %l4 = 0000000000000048
	lduwa	[%i2+%g0]0x88,%l4	! %l4 = 00000000efc6952e
!	Mem[00000000300c1400] = ac96f309 c6d50574, %l0 = 00000000, %l1 = 00000089
	ldda	[%i3+%g0]0x81,%l0	! %l0 = 00000000ac96f309 00000000c6d50574
!	%l7 = 00000000ffffd578, %l0 = 00000000ac96f309, %l2 = 00000000000000ac
	andn	%l7,%l0,%l2		! %l2 = 0000000053690470
!	Mem[0000000021800000] = 03925c53, %l4 = 00000000efc6952e
	lduha	[%o3+0x000]%asi,%l4	! %l4 = 0000000000000392
!	Mem[0000000010101410] = 79000000, %l3 = 00000000a644eeff
	lduha	[%i4+%o5]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000030041400] = 00000000, %l6 = 00000000000000ff
	ldswa	[%i1+%g0]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000010141408] = b9bff86f91d72f05, %f24 = 5bf3f83d 1879cdf0
	ldda	[%i5+%o4]0x88,%f24	! %f24 = b9bff86f 91d72f05
!	Mem[0000000010001400] = 49d16100, %l0 = 00000000ac96f309
	ldsba	[%i0+%g0]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000010081400] = ae913bc0efc6952e, %l3 = 0000000000000000
	ldxa	[%i2+%g0]0x88,%l3	! %l3 = ae913bc0efc6952e
!	Starting 10 instruction Store Burst
!	Mem[0000000010001432] = c5b8ceb9, %l1 = 00000000c6d50574
	ldstuba	[%i0+0x032]%asi,%l1	! %l1 = 000000ce000000ff

p0_label_38:
!	Mem[0000000030001408] = 3fdc0000, %l2 = 0000000053690470
	ldstuba	[%i0+%o4]0x89,%l2	! %l2 = 00000000000000ff
!	%l4 = 0000000000000392, Mem[0000000010141410] = ffa0dc4c3db70e9a
	stxa	%l4,[%i5+%o5]0x80	! Mem[0000000010141410] = 0000000000000392
!	%f18 = ffc0dba2, %f8  = 6226aaa9
	fsqrts	%f18,%f8 		! %f8  = ffc0dba2
!	%l6 = 0000000000000000, Mem[0000000030041400] = 00000000ac96f309
	stxa	%l6,[%i1+%g0]0x81	! Mem[0000000030041400] = 0000000000000000
!	%f0  = 1d6dfff9 78d5ffff, %l4 = 0000000000000392
!	Mem[00000000100c1438] = c4d9e35f88f88aa3
	add	%i3,0x038,%g1
	stda	%f0,[%g1+%l4]ASI_PST16_PL ! Mem[00000000100c1438] = c4d9d57888f88aa3
!	%l1 = 00000000000000ce, Mem[0000000030081408] = 457ae6ff
	stwa	%l1,[%i2+%o4]0x89	! Mem[0000000030081408] = 000000ce
!	Mem[0000000010101403] = d9ff05f1, %l2 = 0000000000000000
	ldstub	[%i4+0x003],%l2		! %l2 = 000000f1000000ff
!	%l7 = 00000000ffffd578, Mem[0000000010041400] = 0000000000008197
	stxa	%l7,[%i1+%g0]0x80	! Mem[0000000010041400] = 00000000ffffd578
!	%l4 = 0000000000000392, Mem[0000000010181410] = fe74caffedff370c
	stxa	%l4,[%i6+%o5]0x80	! Mem[0000000010181410] = 0000000000000392
!	Starting 10 instruction Load Burst
!	Mem[0000000010141438] = 1cfa9aae, %f27 = 548612b5
	ld	[%i5+0x038],%f27	! %f27 = 1cfa9aae

p0_label_39:
!	Mem[0000000030041410] = 0000000048000000, %l5 = 0000000000000000
	ldxa	[%i1+%o5]0x89,%l5	! %l5 = 0000000048000000
!	Mem[0000000030041410] = 00000048, %l6 = 0000000000000000
	lduwa	[%i1+%o5]0x81,%l6	! %l6 = 0000000000000048
!	Mem[000000001010142c] = a3568c4c, %l2 = 00000000000000f1
	ldsba	[%i4+0x02e]%asi,%l2	! %l2 = ffffffffffffff8c
!	%l7 = 00000000ffffd578, immd = 0000000000000e72, %l4  = 0000000000000392
	mulx	%l7,0xe72,%l4		! %l4 = 00000e71fd999f70
!	Mem[0000000010181410] = 00000000, %f28 = c2809bda
	lda	[%i6+%o5]0x80,%f28	! %f28 = 00000000
!	Mem[000000001004143c] = 04f925de, %l0 = 0000000000000000
	ldsha	[%i1+0x03e]%asi,%l0	! %l0 = 00000000000025de
!	Mem[0000000030141408] = 223d77e9, %l1 = 00000000000000ce
	ldswa	[%i5+%o4]0x89,%l1	! %l1 = 00000000223d77e9
!	Mem[0000000010001400] = 0061d149, %l5 = 0000000048000000
	lduwa	[%i0+%g0]0x80,%l5	! %l5 = 000000000061d149
!	Mem[0000000010001408] = 48000000, %l4 = 00000e71fd999f70
	ldswa	[%i0+%o4]0x80,%l4	! %l4 = 0000000048000000
!	Starting 10 instruction Store Burst
!	%l3 = ae913bc0efc6952e, Mem[0000000010041404] = ffffd578
	sth	%l3,[%i1+0x004]		! Mem[0000000010041404] = 952ed578

p0_label_40:
!	%l4 = 0000000048000000, Mem[0000000030001410] = ff3d77e9
	stwa	%l4,[%i0+%o5]0x81	! Mem[0000000030001410] = 48000000
!	%l4 = 0000000048000000, Mem[00000000100c1408] = a2dbc0ff
	stwa	%l4,[%i3+%o4]0x88	! Mem[00000000100c1408] = 48000000
!	%f18 = ffc0dba2 2ad7340b, Mem[0000000030001400] = f89cbe12 457ae64b
	stda	%f18,[%i0+%g0]0x89	! Mem[0000000030001400] = ffc0dba2 2ad7340b
!	%l7 = 00000000ffffd578, Mem[0000000010141400] = ff000000
	stwa	%l7,[%i5+%g0]0x80	! Mem[0000000010141400] = ffffd578
!	%f26 = 6853bd89, Mem[0000000030041400] = 00000000
	sta	%f26,[%i1+%g0]0x81	! Mem[0000000030041400] = 6853bd89
!	%f18 = ffc0dba2 2ad7340b, %l1 = 00000000223d77e9
!	Mem[0000000030041438] = 2deb45e85dee9bc4
	add	%i1,0x038,%g1
	stda	%f18,[%g1+%l1]ASI_PST32_SL ! Mem[0000000030041438] = 0b34d72a5dee9bc4
!	%l6 = 0000000000000048, Mem[0000000030081400] = 89bd5368
	stwa	%l6,[%i2+%g0]0x81	! Mem[0000000030081400] = 00000048
!	%f15 = 6853bd89, Mem[00000000100c1410] = ffca74fe
	sta	%f15,[%i3+%o5]0x88	! Mem[00000000100c1410] = 6853bd89
!	Mem[0000000030181408] = 00ff660c, %l1 = 00000000223d77e9
	ldstuba	[%i6+%o4]0x81,%l1	! %l1 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = 49d16100, %l2 = ffffffffffffff8c
	lduha	[%i0+%g0]0x88,%l2	! %l2 = 0000000000006100

p0_label_41:
!	Mem[0000000010041420] = 69773d225bc2523e, %l0 = 00000000000025de
	ldxa	[%i1+0x020]%asi,%l0	! %l0 = 69773d225bc2523e
!	Mem[0000000010141410] = 00000000, %l4 = 0000000048000000
	ldsw	[%i5+%o5],%l4		! %l4 = 0000000000000000
!	Mem[000000001018142c] = 548612b5, %l2 = 0000000000006100
	lduha	[%i6+0x02c]%asi,%l2	! %l2 = 0000000000005486
!	Mem[0000000010181400] = ffffd578, %l6 = 0000000000000048
	lduha	[%i6+%g0]0x80,%l6	! %l6 = 000000000000ffff
!	Mem[0000000020800000] = ff000d84, %l5 = 000000000061d149
	lduha	[%o1+0x000]%asi,%l5	! %l5 = 000000000000ff00
!	Mem[0000000030001410] = 0000618e00000048, %l4 = 0000000000000000
	ldxa	[%i0+%o5]0x89,%l4	! %l4 = 0000618e00000048
!	Mem[0000000010041410] = ffffffff 42ab6605, %l4 = 00000048, %l5 = 0000ff00
	ldda	[%i1+%o5]0x80,%l4	! %l4 = 00000000ffffffff 0000000042ab6605
!	Mem[000000001018141c] = fe8f387f, %f0  = 1d6dfff9
	lda	[%i6+0x01c]%asi,%f0 	! %f0 = fe8f387f
!	%l5 = 0000000042ab6605, %l6 = 000000000000ffff, %l7  = 00000000ffffd578
	mulx	%l5,%l6,%l7		! %l7 = 000042ab235999fb
!	Starting 10 instruction Store Burst
!	Mem[0000000010041410] = ffffffff, %l2 = 0000000000005486
	swapa	[%i1+%o5]0x88,%l2	! %l2 = 00000000ffffffff

p0_label_42:
!	%f16 = ffffd578 f9ff6d1d ffc0dba2 2ad7340b
!	%f20 = fe74caff edff370c 30ef70ef fe8f387f
!	%f24 = b9bff86f 91d72f05 6853bd89 1cfa9aae
!	%f28 = 00000000 ce9357a6 c4d9e35f 78d5ffff
	stda	%f16,[%i3]ASI_BLK_AIUP	! Block Store to 00000000100c1400
!	%l7 = 000042ab235999fb, Mem[0000000010001410] = ff6a46b1
	stwa	%l7,[%i0+%o5]0x80	! Mem[0000000010001410] = 235999fb
!	Mem[000000001000142f] = f75c5668, %l0 = 69773d225bc2523e
	ldstub	[%i0+0x02f],%l0		! %l0 = 00000068000000ff
!	%l6 = 0000ffff, %l7 = 235999fb, Mem[0000000010081408] = a644eeff db72c76a
	stda	%l6,[%i2+%o4]0x88	! Mem[0000000010081408] = 0000ffff 235999fb
!	%l1 = 0000000000000000, Mem[0000000010181400] = ffffd578f9ff6d1d
	stxa	%l1,[%i6+%g0]0x80	! Mem[0000000010181400] = 0000000000000000
!	%l5 = 0000000042ab6605, Mem[0000000030141408] = 223d77e9
	stwa	%l5,[%i5+%o4]0x89	! Mem[0000000030141408] = 42ab6605
!	%f4  = 781c91e0 8e610000, %l2 = 00000000ffffffff
!	Mem[0000000010101418] = fd81e35f1ea7b256
	add	%i4,0x018,%g1
	stda	%f4,[%g1+%l2]ASI_PST8_P ! Mem[0000000010101418] = 781c91e08e610000
!	%l5 = 0000000042ab6605, Mem[0000000010181410] = 9203000000000000
	stxa	%l5,[%i6+%o5]0x88	! Mem[0000000010181410] = 0000000042ab6605
!	Mem[0000000030181400] = ffd96223, %l6 = 000000000000ffff
	swapa	[%i6+%g0]0x89,%l6	! %l6 = 00000000ffd96223
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = ff05ffd9, %l2 = 00000000ffffffff
	ldsba	[%i4+%g0]0x88,%l2	! %l2 = ffffffffffffffd9

p0_label_43:
	membar	#Sync			! Added by membar checker (6)
!	Mem[0000000030181400] = ffff0000 291fd186 ffff660c a9c254aa
!	Mem[0000000030181410] = a9aa2662 00000000 66dfb8ce 62097954
!	Mem[0000000030181420] = 072d6118 a6309d67 f0a6b847 9c6f2e62
!	Mem[0000000030181430] = 017c0f89 e933fb8d 86152a7c 7ad11b82
	ldda	[%i6]ASI_BLK_AIUS,%f16	! Block Load from 0000000030181400
!	Mem[0000000010181410] = 0566ab42 00000000, %l0 = 00000068, %l1 = 00000000
	ldda	[%i6+0x010]%asi,%l0	! %l0 = 000000000566ab42 0000000000000000
!	Mem[0000000010141400] = 78d5ffff, %f4  = 781c91e0
	lda	[%i5+%g0]0x88,%f4 	! %f4 = 78d5ffff
!	Mem[0000000020800040] = ff77977d, %l6 = 00000000ffd96223
	lduha	[%o1+0x040]%asi,%l6	! %l6 = 000000000000ff77
!	Mem[0000000030181400] = 0000ffff, %l4 = 00000000ffffffff
	lduwa	[%i6+%g0]0x89,%l4	! %l4 = 000000000000ffff
!	Mem[0000000030001400] = 0b34d72a a2dbc0ff ff00dc3f b3952800
!	Mem[0000000030001410] = 48000000 8e610000 7405d5c6 09f396ac
!	Mem[0000000030001420] = 6226aaa9 ac96f309 6dd96223 fe74caff
!	Mem[0000000030001430] = 4e22978b e9773d22 4dd86223 00000000
	ldda	[%i0]ASI_BLK_S,%f0	! Block Load from 0000000030001400
!	Mem[00000000100c1410] = 0c37ffed ffca74fe, %l2 = ffffffd9, %l3 = efc6952e
	ldda	[%i3+%o5]0x88,%l2	! %l2 = 00000000ffca74fe 000000000c37ffed
!	Code Fragment 3
p0_fragment_1:
!	%l0 = 000000000566ab42
	setx	0x4f2ea1b06cea067a,%g7,%l0 ! %l0 = 4f2ea1b06cea067a
!	%l1 = 0000000000000000
	setx	0x6920e57fb12f7bf7,%g7,%l1 ! %l1 = 6920e57fb12f7bf7
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 4f2ea1b06cea067a
	setx	0x621c2ed8413705f7,%g7,%l0 ! %l0 = 621c2ed8413705f7
!	%l1 = 6920e57fb12f7bf7
	setx	0x991da89027272efc,%g7,%l1 ! %l1 = 991da89027272efc
!	Mem[0000000021800080] = ff57fef6, %l6 = 000000000000ff77
	lduha	[%o3+0x080]%asi,%l6	! %l6 = 000000000000ff57
!	Starting 10 instruction Store Burst
!	Mem[0000000030101408] = ff000000, %l7 = 000042ab235999fb
	swapa	[%i4+%o4]0x81,%l7	! %l7 = 00000000ff000000

p0_label_44:
!	Mem[0000000030001400] = 0b34d72a, %l4 = 000000000000ffff
	swapa	[%i0+%g0]0x81,%l4	! %l4 = 000000000b34d72a
!	%l4 = 0b34d72a, %l5 = 42ab6605, Mem[0000000030041408] = 223d77e9 7bba3f86
	stda	%l4,[%i1+%o4]0x81	! Mem[0000000030041408] = 0b34d72a 42ab6605
	membar	#Sync			! Added by membar checker (7)
!	%l4 = 000000000b34d72a, Mem[0000000030001408] = ff00dc3f
	stha	%l4,[%i0+%o4]0x81	! Mem[0000000030001408] = d72adc3f
!	%l5 = 0000000042ab6605, Mem[0000000010081400] = 2e95c6efc03b91ae
	stxa	%l5,[%i2+%g0]0x80	! Mem[0000000010081400] = 0000000042ab6605
!	%f9  = ac96f309, Mem[00000000300c1400] = ac96f309
	sta	%f9 ,[%i3+%g0]0x81	! Mem[00000000300c1400] = ac96f309
!	Mem[0000000030181410] = 6226aaa9, %l0 = 621c2ed8413705f7
	ldstuba	[%i6+%o5]0x89,%l0	! %l0 = 000000a9000000ff
!	Mem[00000000201c0000] = eeffc9d1, %l7 = 00000000ff000000
	ldstub	[%o0+%g0],%l7		! %l7 = 000000ee000000ff
!	%l4 = 0b34d72a, %l5 = 42ab6605, Mem[0000000010141400] = 78d5ffff cc465097
	stda	%l4,[%i5+%g0]0x88	! Mem[0000000010141400] = 0b34d72a 42ab6605
!	%l2 = 00000000ffca74fe, Mem[0000000010141400] = 2ad7340b
	stba	%l2,[%i5+%g0]0x80	! Mem[0000000010141400] = fed7340b
!	Starting 10 instruction Load Burst
!	%l7 = 00000000000000ee, %l4 = 000000000b34d72a, %l3 = 000000000c37ffed
	sub	%l7,%l4,%l3		! %l3 = fffffffff4cb29c4

p0_label_45:
!	Mem[0000000030101400] = 8e61000010c5f634, %f16 = ffff0000 291fd186
	ldda	[%i4+%g0]0x81,%f16	! %f16 = 8e610000 10c5f634
!	Mem[0000000030181408] = ffff660c, %l1 = 991da89027272efc
	lduba	[%i6+%o4]0x81,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030081410] = b1ff26e2, %f6  = 7405d5c6
	lda	[%i2+%o5]0x89,%f6 	! %f6 = b1ff26e2
!	Mem[0000000030081400] = 00000048 236992c3 ce000000 817ccc8b
!	Mem[0000000030081410] = e226ffb1 f9ff6d1d 8244e035 dc3cff1f
!	Mem[0000000030081420] = dc71b4ff dd2aa0c2 adabdea7 f74f043a
!	Mem[0000000030081430] = 328743fb 610602cc 86dcfb9a 101fa56e
	ldda	[%i2]ASI_BLK_AIUSL,%f16	! Block Load from 0000000030081400
!	Mem[00000000300c1408] = c0175331da975008, %f2  = ff00dc3f b3952800
	ldda	[%i3+%o4]0x89,%f2 	! %f2  = c0175331 da975008
!	%f6  = b1ff26e2, %f7  = 09f396ac, %f14 = 4dd86223 00000000
	fsmuld	%f6 ,%f7 ,%f14		! %f14 = b78e5902 97917b00
!	Mem[0000000030041410] = 00000048, %l2 = 00000000ffca74fe
	lduha	[%i1+%o5]0x81,%l2	! %l2 = 0000000000000000
!	Mem[00000000300c1400] = 7405d5c609f396ac, %l3 = fffffffff4cb29c4
	ldxa	[%i3+%g0]0x89,%l3	! %l3 = 7405d5c609f396ac
!	Mem[0000000030081400] = 00000048 236992c3, %l4 = 0b34d72a, %l5 = 42ab6605
	ldda	[%i2+%g0]0x81,%l4	! %l4 = 0000000000000048 00000000236992c3
!	Starting 10 instruction Store Burst
!	%l2 = 00000000, %l3 = 09f396ac, Mem[00000000100c1418] = 30ef70ef fe8f387f
	stda	%l2,[%i3+0x018]%asi	! Mem[00000000100c1418] = 00000000 09f396ac

p0_label_46:
!	%l0 = 00000000000000a9, Mem[0000000010041408] = 7f388ffe
	stha	%l0,[%i1+%o4]0x88	! Mem[0000000010041408] = 7f3800a9
!	%l0 = 00000000000000a9, Mem[0000000020800001] = ff000d84, %asi = 80
	stba	%l0,[%o1+0x001]%asi	! Mem[0000000020800000] = ffa90d84
!	Mem[0000000010141400] = 0b34d7fe, %l6 = 000000000000ff57
	ldstuba	[%i5+%g0]0x88,%l6	! %l6 = 000000fe000000ff
!	%l6 = 00000000000000fe, Mem[0000000030041408] = 2ad7340b
	stwa	%l6,[%i1+%o4]0x89	! Mem[0000000030041408] = 000000fe
!	Mem[0000000030101400] = 0000618e, %l3 = 7405d5c609f396ac
	swapa	[%i4+%g0]0x89,%l3	! %l3 = 000000000000618e
!	Mem[0000000010001408] = 4800000022a877e1, %l3 = 000000000000618e, %l6 = 00000000000000fe
	add	%i0,0x08,%g1
	casxa	[%g1]0x80,%l3,%l6	! %l6 = 4800000022a877e1
!	%l5 = 00000000236992c3, Mem[0000000020800040] = ff77977d, %asi = 80
	stba	%l5,[%o1+0x040]%asi	! Mem[0000000020800040] = c377977d
!	Mem[0000000010081414] = 926a46b1, %l2 = 0000000000000000
	swap	[%i2+0x014],%l2		! %l2 = 00000000926a46b1
!	%f4  = 48000000 8e610000, Mem[0000000010101420] = 72e51d9b 6dd96223
	stda	%f4 ,[%i4+0x020]%asi	! Mem[0000000010101420] = 48000000 8e610000
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = 00000048, %l7 = 00000000000000ee
	lduha	[%i0+%o5]0x89,%l7	! %l7 = 0000000000000048

p0_label_47:
!	Mem[00000000218000c0] = c2e9de96, %l6 = 4800000022a877e1
	ldsb	[%o3+0x0c1],%l6		! %l6 = ffffffffffffffe9
!	Mem[0000000030001408] = d72adc3f, %l1 = 00000000000000ff
	ldsba	[%i0+%o4]0x81,%l1	! %l1 = ffffffffffffffd7
!	Mem[0000000030181400] = ffff0000, %l2 = 00000000926a46b1
	ldstuba	[%i6+%g0]0x81,%l2	! %l2 = 000000ff000000ff
!	Mem[0000000030081400] = 48000000, %l5 = 00000000236992c3
	ldsba	[%i2+%g0]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000010101408] = 000000ff, %l1 = ffffffffffffffd7
	ldsha	[%i4+%o4]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010101408] = 000000ff, %l0 = 00000000000000a9
	ldsba	[%i4+%o4]0x88,%l0	! %l0 = ffffffffffffffff
!	Mem[000000001000141c] = f9ff6d1d, %l0 = ffffffffffffffff
	lduw	[%i0+0x01c],%l0		! %l0 = 00000000f9ff6d1d
!	Mem[0000000030041400] = 6853bd8900000000, %l1 = 00000000000000ff
	ldxa	[%i1+%g0]0x81,%l1	! %l1 = 6853bd8900000000
!	Mem[0000000030001400] = 0000ffffa2dbc0ff, %f2  = c0175331 da975008
	ldda	[%i0+%g0]0x81,%f2 	! %f2  = 0000ffff a2dbc0ff
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1410] = fe74caffedff370c, %l7 = 0000000000000048, %l4 = 0000000000000048
	add	%i3,0x10,%g1
	casxa	[%g1]0x80,%l7,%l4	! %l4 = fe74caffedff370c

p0_label_48:
!	Mem[00000000300c1410] = 223d7769, %l6 = ffffffffffffffe9
	ldstuba	[%i3+%o5]0x89,%l6	! %l6 = 00000069000000ff
!	Mem[0000000010081400] = 00000000, %l7 = 0000000000000048
	swapa	[%i2+%g0]0x80,%l7	! %l7 = 0000000000000000
!	Mem[00000000100c1419] = 00000000, %l7 = 0000000000000000
	ldstuba	[%i3+0x019]%asi,%l7	! %l7 = 00000000000000ff
!	%l4 = edff370c, %l5 = 00000000, Mem[00000000300c1410] = ff773d22 5bc2523e
	stda	%l4,[%i3+%o5]0x81	! Mem[00000000300c1410] = edff370c 00000000
!	%l7 = 0000000000000000, Mem[00000000211c0000] = ff70b3ec, %asi = 80
	stha	%l7,[%o2+0x000]%asi	! Mem[00000000211c0000] = 0000b3ec
!	%l6 = 0000000000000069, Mem[0000000010001424] = 1d0001c1, %asi = 80
	stwa	%l6,[%i0+0x024]%asi	! Mem[0000000010001424] = 00000069
!	%l2 = 00000000000000ff, Mem[0000000010101400] = d9ff05ff
	stha	%l2,[%i4+%g0]0x80	! Mem[0000000010101400] = 00ff05ff
!	%l4 = fe74caffedff370c, Mem[0000000010181400] = 00000000
	stwa	%l4,[%i6+%g0]0x80	! Mem[0000000010181400] = edff370c
!	%l2 = 000000ff, %l3 = 0000618e, Mem[0000000010101408] = ff000000 25828f64
	stda	%l2,[%i4+%o4]0x80	! Mem[0000000010101408] = 000000ff 0000618e
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = 085097da, %l4 = fe74caffedff370c
	lduba	[%i3+%o4]0x81,%l4	! %l4 = 0000000000000008

p0_label_49:
!	Mem[0000000030041400] = 00000000 89bd5368, %l0 = f9ff6d1d, %l1 = 00000000
	ldda	[%i1+%g0]0x89,%l0	! %l0 = 0000000089bd5368 0000000000000000
!	Mem[0000000010141408] = 052fd791, %l7 = 0000000000000000
	ldsha	[%i5+%o4]0x80,%l7	! %l7 = 000000000000052f
!	Mem[0000000030101400] = 34f6c51009f396ac, %f6  = b1ff26e2 09f396ac
	ldda	[%i4+%g0]0x89,%f6 	! %f6  = 34f6c510 09f396ac
!	Mem[0000000010101408] = 000000ff0000618e, %f26 = 3a044ff7 a7deabad
	ldda	[%i4+%o4]0x80,%f26	! %f26 = 000000ff 0000618e
!	Mem[0000000010081408] = ffff0000, %l4 = 0000000000000008
	ldsha	[%i2+%o4]0x80,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000030101400] = 34f6c51009f396ac, %l3 = 000000000000618e
	ldxa	[%i4+%g0]0x89,%l3	! %l3 = 34f6c51009f396ac
!	Mem[00000000100c1410] = ffca74fe, %l5 = 0000000000000000
	lduba	[%i3+%o5]0x88,%l5	! %l5 = 00000000000000fe
!	Mem[0000000010041428] = 052fd791, %l7 = 000000000000052f
	lduw	[%i1+0x028],%l7		! %l7 = 00000000052fd791
!	Mem[00000000201c0000] = ffffc9d1, %l4 = ffffffffffffffff
	lduha	[%o0+0x000]%asi,%l4	! %l4 = 000000000000ffff
!	Starting 10 instruction Store Burst
!	%f20 = 1d6dfff9 b1ff26e2, Mem[0000000010081408] = ffff0000 fb995923
	stda	%f20,[%i2+%o4]0x80	! Mem[0000000010081408] = 1d6dfff9 b1ff26e2

p0_label_50:
!	%l3 = 34f6c51009f396ac, Mem[00000000300c1400] = ac96f309
	stha	%l3,[%i3+%g0]0x81	! Mem[00000000300c1400] = 96acf309
!	%l2 = 00000000000000ff, Mem[0000000010081410] = 926a09a6
	stwa	%l2,[%i2+%o5]0x88	! Mem[0000000010081410] = 000000ff
!	%l1 = 0000000000000000, Mem[0000000020800041] = c377977d
	stb	%l1,[%o1+0x041]		! Mem[0000000020800040] = c300977d
!	%l2 = 00000000000000ff, Mem[0000000030041408] = 000000fe
	stwa	%l2,[%i1+%o4]0x89	! Mem[0000000030041408] = 000000ff
!	Mem[0000000010001410] = fb995923, %l1 = 0000000000000000
	ldstuba	[%i0+%o5]0x88,%l1	! %l1 = 00000023000000ff
!	%f8  = 6226aaa9 ac96f309, %l1 = 0000000000000023
!	Mem[0000000010101430] = 396f0200243aff24
	add	%i4,0x030,%g1
	stda	%f8,[%g1+%l1]ASI_PST32_P ! Mem[0000000010101430] = 6226aaa9ac96f309
!	%l0 = 89bd5368, %l1 = 00000023, Mem[0000000010001400] = 49d16100 e9773d22
	stda	%l0,[%i0+%g0]0x88	! Mem[0000000010001400] = 89bd5368 00000023
!	%f30 = 6ea51f10 9afbdc86, Mem[0000000010141400] = ffd7340b 0566ab42
	stda	%f30,[%i5+%g0]0x80	! Mem[0000000010141400] = 6ea51f10 9afbdc86
!	%f29 = fb438732, Mem[00000000100c1400] = 78d5ffff
	sta	%f29,[%i3+%g0]0x88	! Mem[00000000100c1400] = fb438732
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = 6853bd8900000000, %f26 = 000000ff 0000618e
	ldda	[%i1+%g0]0x81,%f26	! %f26 = 6853bd89 00000000

p0_label_51:
!	Mem[00000000300c1410] = 0c37ffed, %l6 = 0000000000000069
	lduha	[%i3+%o5]0x89,%l6	! %l6 = 000000000000ffed
!	Mem[00000000300c1410] = 0c37ffed, %l0 = 0000000089bd5368
	lduha	[%i3+%o5]0x89,%l0	! %l0 = 000000000000ffed
!	Mem[00000000300c1408] = 085097da, %l7 = 00000000052fd791
	ldswa	[%i3+%o4]0x81,%l7	! %l7 = 00000000085097da
!	%l3 = 34f6c51009f396ac, %l3 = 34f6c51009f396ac, %l0  = 000000000000ffed
	mulx	%l3,%l3,%l0		! %l0 = 974a95df7b360390
!	Mem[0000000010041434] = 4bea9d38, %l5 = 00000000000000fe
	lduw	[%i1+0x034],%l5		! %l5 = 000000004bea9d38
!	Mem[0000000010101400] = ff05ff00, %l6 = 000000000000ffed
	ldswa	[%i4+%g0]0x88,%l6	! %l6 = ffffffffff05ff00
!	Mem[0000000030141408] = 42ab6605, %l2 = 00000000000000ff
	ldsba	[%i5+%o4]0x89,%l2	! %l2 = 0000000000000005
!	Mem[0000000010041410] = 00005486, %l1 = 0000000000000023
	ldsha	[%i1+%o5]0x88,%l1	! %l1 = 0000000000005486
!	Mem[000000001014140c] = 6ff8bfb9, %l1 = 0000000000005486
	lduw	[%i5+0x00c],%l1		! %l1 = 000000006ff8bfb9
!	Starting 10 instruction Store Burst
!	%l0 = 7b360390, %l1 = 6ff8bfb9, Mem[00000000300c1408] = da975008 c0175331
	stda	%l0,[%i3+%o4]0x89	! Mem[00000000300c1408] = 7b360390 6ff8bfb9

p0_label_52:
!	Mem[0000000010181408] = b3952800, %l1 = 000000006ff8bfb9, %asi = 80
	swapa	[%i6+0x008]%asi,%l1	! %l1 = 00000000b3952800
!	Mem[00000000100c1408] = ffc0dba2, %l5 = 4bea9d38, %l4 = 0000ffff
	add	%i3,0x08,%g1
	casa	[%g1]0x80,%l5,%l4	! %l4 = 00000000ffc0dba2
!	Mem[00000000100c1410] = fe74caffedff370c, %l3 = 34f6c51009f396ac
	ldxa	[%i3+%o5]0x80,%l3	! %l3 = fe74caffedff370c
!	Code Fragment 4
p0_fragment_2:
!	%l0 = 974a95df7b360390
	setx	0x457d4b0800282f6f,%g7,%l0 ! %l0 = 457d4b0800282f6f
!	%l1 = 00000000b3952800
	setx	0x2244c06ff3d72cab,%g7,%l1 ! %l1 = 2244c06ff3d72cab
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 457d4b0800282f6f
	setx	0x4a47ea20009b9ddc,%g7,%l0 ! %l0 = 4a47ea20009b9ddc
!	%l1 = 2244c06ff3d72cab
	setx	0x451fab7f83f8b982,%g7,%l1 ! %l1 = 451fab7f83f8b982
!	Mem[00000000100c143c] = 78d5ffff, %l4 = ffc0dba2, %l4 = ffc0dba2
	add	%i3,0x3c,%g1
	casa	[%g1]0x80,%l4,%l4	! %l4 = 0000000078d5ffff
!	%l4 = 0000000078d5ffff, imm = fffffffffffff70c, %l1 = 451fab7f83f8b982
	xor	%l4,-0x8f4,%l1		! %l1 = ffffffff872a08f3
!	%f7  = 09f396ac, Mem[0000000010001400] = 89bd5368
	sta	%f7 ,[%i0+%g0]0x88	! Mem[0000000010001400] = 09f396ac
!	%l0 = 4a47ea20009b9ddc, Mem[0000000030041408] = 000000ff
	stwa	%l0,[%i1+%o4]0x89	! Mem[0000000030041408] = 009b9ddc
!	%l3 = fe74caffedff370c, Mem[00000000300c1400] = 96acf309
	stha	%l3,[%i3+%g0]0x81	! Mem[00000000300c1400] = 370cf309
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = ac96f309 23000000, %l6 = ff05ff00, %l7 = 085097da
	ldd	[%i0+%g0],%l6		! %l6 = 00000000ac96f309 0000000023000000

p0_label_53:
!	Mem[0000000030141400] = 6dd993ff, %l4 = 0000000078d5ffff
	lduba	[%i5+%g0]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010141400] = 6ea51f10, %f9  = ac96f309
	lda	[%i5+%g0]0x80,%f9 	! %f9 = 6ea51f10
!	Mem[0000000030001410] = 00000048, %l5 = 000000004bea9d38
	ldsha	[%i0+%o5]0x89,%l5	! %l5 = 0000000000000048
!	Mem[0000000030001408] = d72adc3f, %l2 = 0000000000000005
	lduba	[%i0+%o4]0x81,%l2	! %l2 = 00000000000000d7
!	Mem[000000001010142c] = a3568c4c, %l2 = 00000000000000d7
	lduw	[%i4+0x02c],%l2		! %l2 = 00000000a3568c4c
!	Mem[0000000010141430] = fbb5d0fa, %f19 = 000000ce
	lda	[%i5+0x030]%asi,%f19	! %f19 = fbb5d0fa
!	Mem[0000000010001400] = ac96f309, %l1 = ffffffff872a08f3
	lduwa	[%i0+%g0]0x80,%l1	! %l1 = 00000000ac96f309
!	Mem[00000000100c1418] = 00ff0000 09f396ac, %l6 = ac96f309, %l7 = 23000000
	ldd	[%i3+0x018],%l6		! %l6 = 0000000000ff0000 0000000009f396ac
!	Mem[00000000100c1428] = 6853bd89, %l0 = 4a47ea20009b9ddc
	ldsha	[%i3+0x02a]%asi,%l0	! %l0 = ffffffffffffbd89
!	Starting 10 instruction Store Burst
!	%l1 = 00000000ac96f309, Mem[0000000010041408] = a900387f
	stwa	%l1,[%i1+%o4]0x80	! Mem[0000000010041408] = ac96f309

p0_label_54:
!	%l0 = ffffffffffffbd89, Mem[0000000010181410] = 0566ab4200000000
	stxa	%l0,[%i6+%o5]0x80	! Mem[0000000010181410] = ffffffffffffbd89
!	%l0 = ffffffffffffbd89, Mem[0000000010101434] = ac96f309, %asi = 80
	stba	%l0,[%i4+0x034]%asi	! Mem[0000000010101434] = 8996f309
!	Mem[00000000201c0000] = ffffc9d1, %l1 = 00000000ac96f309
	ldstub	[%o0+%g0],%l1		! %l1 = 000000ff000000ff
!	Code Fragment 3
p0_fragment_3:
!	%l0 = ffffffffffffbd89
	setx	0xce338a1063161bc1,%g7,%l0 ! %l0 = ce338a1063161bc1
!	%l1 = 00000000000000ff
	setx	0xb9d8eef7d3f8e3b8,%g7,%l1 ! %l1 = b9d8eef7d3f8e3b8
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = ce338a1063161bc1
	setx	0x010fdc0833e427d6,%g7,%l0 ! %l0 = 010fdc0833e427d6
!	%l1 = b9d8eef7d3f8e3b8
	setx	0x17ac9467aedd9c05,%g7,%l1 ! %l1 = 17ac9467aedd9c05
!	Mem[0000000030101408] = fb995923, %l7 = 0000000009f396ac
	ldstuba	[%i4+%o4]0x89,%l7	! %l7 = 00000023000000ff
!	%l1 = 17ac9467aedd9c05, Mem[0000000010141410] = 00000000
	stba	%l1,[%i5+%o5]0x80	! Mem[0000000010141410] = 05000000
!	Mem[0000000030041400] = 6853bd89, %l0 = 010fdc0833e427d6
	ldstuba	[%i1+%g0]0x81,%l0	! %l0 = 00000068000000ff
!	Mem[0000000010141400] = 101fa56e, %l1 = 17ac9467aedd9c05
	swapa	[%i5+%g0]0x88,%l1	! %l1 = 00000000101fa56e
!	%f30 = 6ea51f10 9afbdc86, %l6 = 0000000000ff0000
!	Mem[0000000030101428] = 917ef8400369131e
	add	%i4,0x028,%g1
	stda	%f30,[%g1+%l6]ASI_PST8_S ! Mem[0000000030101428] = 917ef8400369131e
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = 86dcfb9a aedd9c05, %l0 = 00000068, %l1 = 101fa56e
	ldda	[%i5+%g0]0x88,%l0	! %l0 = 00000000aedd9c05 0000000086dcfb9a

p0_label_55:
!	Mem[0000000030101408] = ff5999fb 926a46b1, %l4 = 000000ff, %l5 = 00000048
	ldda	[%i4+%o4]0x81,%l4	! %l4 = 00000000ff5999fb 00000000926a46b1
!	Mem[00000000300c1400] = 370cf309c6d50574, %f8  = 6226aaa9 6ea51f10
	ldda	[%i3+%g0]0x81,%f8 	! %f8  = 370cf309 c6d50574
!	Mem[0000000030141408] = 0566ab42 49d1610e, %l6 = 00ff0000, %l7 = 00000023
	ldda	[%i5+%o4]0x81,%l6	! %l6 = 000000000566ab42 0000000049d1610e
!	Mem[0000000030041400] = ff53bd89, %l4 = 00000000ff5999fb
	ldsba	[%i1+%g0]0x81,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010081408] = 1d6dfff9, %l3 = fe74caffedff370c
	lduba	[%i2+%o4]0x80,%l3	! %l3 = 000000000000001d
!	Mem[0000000010101410] = 000000791a803be3, %f18 = 8bcc7c81 fbb5d0fa
	ldda	[%i4+%o5]0x80,%f18	! %f18 = 00000079 1a803be3
!	Mem[0000000030141408] = 0566ab4249d1610e, %l7 = 0000000049d1610e
	ldxa	[%i5+%o4]0x81,%l7	! %l7 = 0566ab4249d1610e
!	Mem[0000000030001408] = d72adc3f b3952800, %l6 = 0566ab42, %l7 = 49d1610e
	ldda	[%i0+%o4]0x81,%l6	! %l6 = 00000000d72adc3f 00000000b3952800
!	Mem[0000000030141410] = 00000000, %f0  = 0b34d72a
	lda	[%i5+%o5]0x89,%f0 	! %f0 = 00000000
!	Starting 10 instruction Store Burst
!	%l0 = 00000000aedd9c05, Mem[00000000100c1410] = ffca74fe
	stha	%l0,[%i3+%o5]0x88	! Mem[00000000100c1410] = ffca9c05

p0_label_56:
!	Mem[0000000030101410] = 61f75dba, %l6 = 00000000d72adc3f
	ldstuba	[%i4+%o5]0x89,%l6	! %l6 = 000000ba000000ff
!	%f1  = a2dbc0ff, Mem[00000000300c1410] = 0c37ffed
	sta	%f1 ,[%i3+%o5]0x89	! Mem[00000000300c1410] = a2dbc0ff
!	%l6 = 00000000000000ba, Mem[00000000300c1410] = ffc0dba2
	stba	%l6,[%i3+%o5]0x81	! Mem[00000000300c1410] = bac0dba2
!	Mem[0000000010181400] = edff370c, %l7 = 00000000b3952800
	swapa	[%i6+%g0]0x80,%l7	! %l7 = 00000000edff370c
!	Mem[0000000010101421] = 48000000, %l3 = 000000000000001d
	ldstub	[%i4+0x021],%l3		! %l3 = 00000000000000ff
!	%f20 = 1d6dfff9, Mem[0000000010141410] = 00000005
	sta	%f20,[%i5+%o5]0x88	! Mem[0000000010141410] = 1d6dfff9
!	%l0 = 00000000aedd9c05, Mem[000000001014140d] = 6ff8bfb9, %asi = 80
	stba	%l0,[%i5+0x00d]%asi	! Mem[000000001014140c] = 6f05bfb9
!	%l6 = 000000ba, %l7 = edff370c, Mem[0000000010001400] = 09f396ac 00000023
	stda	%l6,[%i0+%g0]0x88	! Mem[0000000010001400] = 000000ba edff370c
	membar	#Sync			! Added by membar checker (8)
!	%l1 = 0000000086dcfb9a, Mem[0000000030081400] = 00000048236992c3
	stxa	%l1,[%i2+%g0]0x81	! Mem[0000000030081400] = 0000000086dcfb9a
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = 86540000, %l5 = 00000000926a46b1
	lduba	[%i1+%o5]0x80,%l5	! %l5 = 0000000000000086

p0_label_57:
!	Mem[0000000010081400] = 00000048, %l2 = 00000000a3568c4c
	ldsha	[%i2+%g0]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000020800000] = ffa90d84, %l2 = 0000000000000000
	ldsb	[%o1+0x001],%l2		! %l2 = ffffffffffffffa9
!	Mem[0000000030141408] = 0e61d14942ab6605, %f22 = 1fff3cdc 35e04482
	ldda	[%i5+%o4]0x89,%f22	! %f22 = 0e61d149 42ab6605
!	Mem[0000000030001408] = 3fdc2ad7, %l7 = 00000000edff370c
	lduha	[%i0+%o4]0x89,%l7	! %l7 = 0000000000002ad7
!	Mem[0000000030141410] = 00000000, %l7 = 0000000000002ad7
	lduha	[%i5+%o5]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000010041400] = 00000000, %l3 = 0000000000000000
	ldsba	[%i1+%g0]0x88,%l3	! %l3 = 0000000000000000
!	%f1  = a2dbc0ff, %f0  = 00000000
	fcmpes	%fcc0,%f1 ,%f0 		! %fcc0 = 1
!	Mem[00000000211c0000] = 0000b3ec, %l2 = ffffffffffffffa9
	ldsb	[%o2+%g0],%l2		! %l2 = 0000000000000000
!	Mem[0000000010101408] = ff000000, %l2 = 0000000000000000
	lduba	[%i4+%o4]0x88,%l2	! %l2 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f17 = 48000000, Mem[0000000010041410] = 86540000
	sta	%f17,[%i1+%o5]0x80	! Mem[0000000010041410] = 48000000

p0_label_58:
!	%l7 = 0000000000000000, Mem[0000000030081410] = b1ff26e2
	stwa	%l7,[%i2+%o5]0x89	! Mem[0000000030081410] = 00000000
!	%l1 = 0000000086dcfb9a, Mem[0000000010181400] = 002895b3
	stha	%l1,[%i6+%g0]0x88	! Mem[0000000010181400] = 0028fb9a
!	%f4  = 48000000 8e610000, %l7 = 0000000000000000
!	Mem[0000000010081420] = dbcd7ca0821973ea
	add	%i2,0x020,%g1
	stda	%f4,[%g1+%l7]ASI_PST32_PL ! Mem[0000000010081420] = dbcd7ca0821973ea
!	Mem[0000000010001408] = 4800000022a877e1, %l3 = 0000000000000000, %l2 = 0000000000000000
	add	%i0,0x08,%g1
	casxa	[%g1]0x80,%l3,%l2	! %l2 = 4800000022a877e1
!	%f28 = cc020661 fb438732, Mem[0000000010101400] = 00ff05ff 00000000
	stda	%f28,[%i4+%g0]0x80	! Mem[0000000010101400] = cc020661 fb438732
!	%l0 = 00000000aedd9c05, Mem[0000000010001426] = 00000069
	stb	%l0,[%i0+0x026]		! Mem[0000000010001424] = 00000569
!	%l6 = 00000000000000ba, Mem[0000000030181408] = 0c66ffff
	stwa	%l6,[%i6+%o4]0x89	! Mem[0000000030181408] = 000000ba
!	Mem[0000000030041400] = 89bd53ff, %l2 = 4800000022a877e1
	swapa	[%i1+%g0]0x89,%l2	! %l2 = 0000000089bd53ff
!	Mem[0000000010041428] = 052fd791, %l4 = ffffffff, %l0 = aedd9c05
	add	%i1,0x28,%g1
	casa	[%g1]0x80,%l4,%l0	! %l0 = 00000000052fd791
!	Starting 10 instruction Load Burst
!	%f12 = 4e22978b, %f12 = 4e22978b
	fcmpes	%fcc1,%f12,%f12		! %fcc1 = 0

p0_label_59:
!	Mem[0000000010081408] = 1d6dfff9b1ff26e2, %f0  = 00000000 a2dbc0ff
	ldda	[%i2+%o4]0x80,%f0 	! %f0  = 1d6dfff9 b1ff26e2
!	Mem[0000000010141408] = b9bf056f 91d72f05, %l0 = 052fd791, %l1 = 86dcfb9a
	ldda	[%i5+%o4]0x88,%l0	! %l0 = 0000000091d72f05 00000000b9bf056f
!	Mem[0000000030001410] = 00000048, %l0 = 0000000091d72f05
	ldsba	[%i0+%o5]0x89,%l0	! %l0 = 0000000000000048
!	Mem[000000001018143c] = 88f88aa3, %l4 = ffffffffffffffff
	lduha	[%i6+0x03c]%asi,%l4	! %l4 = 00000000000088f8
!	Mem[0000000010101400] = cc020661, %l2 = 0000000089bd53ff
	lduha	[%i4+%g0]0x80,%l2	! %l2 = 000000000000cc02
!	Mem[0000000010141400] = 059cddae, %f11 = fe74caff
	lda	[%i5+%g0]0x80,%f11	! %f11 = 059cddae
!	Mem[0000000030141408] = 0e61d14942ab6605, %f10 = 6dd96223 059cddae
	ldda	[%i5+%o4]0x89,%f10	! %f10 = 0e61d149 42ab6605
!	Mem[0000000030081408] = ce000000, %l1 = 00000000b9bf056f
	lduha	[%i2+%o4]0x81,%l1	! %l1 = 000000000000ce00
!	Mem[0000000010081410] = 000000ff, %l4 = 00000000000088f8
	ldsba	[%i2+%o5]0x88,%l4	! %l4 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	Mem[0000000030141410] = 00000000, %l0 = 0000000000000048
	swapa	[%i5+%o5]0x89,%l0	! %l0 = 0000000000000000

p0_label_60:
!	%f13 = e9773d22, %f18 = 00000079, %f0  = 1d6dfff9
	fmuls	%f13,%f18,%f0 		! %l0 = 0000000000000022, Unfinished, %fsr = 0400000400
!	Mem[0000000010081400] = 48000000, %l5 = 0000000000000086
	swapa	[%i2+%g0]0x88,%l5	! %l5 = 0000000048000000
!	%l4 = ffffffff, %l5 = 48000000, Mem[0000000010181410] = ffffffff ffffbd89
	stda	%l4,[%i6+%o5]0x80	! Mem[0000000010181410] = ffffffff 48000000
!	%l7 = 0000000000000000, Mem[0000000030101410] = ff5df761
	stba	%l7,[%i4+%o5]0x81	! Mem[0000000030101410] = 005df761
!	%l2 = 000000000000cc02, Mem[0000000010101408] = ff000000
	stha	%l2,[%i4+%o4]0x88	! Mem[0000000010101408] = ff00cc02
!	%f5  = 8e610000, Mem[00000000100c1400] = 328743fb
	sta	%f5 ,[%i3+%g0]0x80	! Mem[00000000100c1400] = 8e610000
!	Mem[0000000030141410] = 48000000, %l2 = 000000000000cc02
	ldstuba	[%i5+%o5]0x81,%l2	! %l2 = 00000048000000ff
!	%f6  = 34f6c510, %f27 = 00000000, %f10 = 0e61d149
	fadds	%f6 ,%f27,%f10		! %f10 = 34f6c510
!	%l1 = 000000000000ce00, Mem[0000000020800000] = ffa90d84, %asi = 80
	stha	%l1,[%o1+0x000]%asi	! Mem[0000000020800000] = ce000d84
!	Starting 10 instruction Load Burst
!	Mem[0000000020800040] = c300977d, %l0 = 0000000000000022
	ldsba	[%o1+0x041]%asi,%l0	! %l0 = 0000000000000000

	ba,a	p0_not_taken_0_end
p0_not_taken_0:
!	The following code should not be executed
	ldsb	[%i6+0x01c],%l5
	mulx	%l5,%l5,%l3
	udiv	%l1,0x471,%l6
	addc	%l1,0x040,%l1
	sth	%l6,[%i6+0x026]
	or	%l2,%l2,%l7
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
	cmp	%l1,%g2			! %l1 should be 000000000000ce00
	bne,a,pn %xcc,p0_reg_l1_fail
	mov	%l1,%g3
	ldx	[%g1+0x010],%g2
	cmp	%l2,%g2			! %l2 should be 0000000000000048
	bne,a,pn %xcc,p0_reg_l2_fail
	mov	%l2,%g3
	ldx	[%g1+0x018],%g2
	cmp	%l3,%g2			! %l3 should be 0000000000000000
	bne,a,pn %xcc,p0_reg_l3_fail
	mov	%l3,%g3
	ldx	[%g1+0x020],%g2
	cmp	%l4,%g2			! %l4 should be ffffffffffffffff
	bne,a,pn %xcc,p0_reg_l4_fail
	mov	%l4,%g3
	ldx	[%g1+0x028],%g2
	cmp	%l5,%g2			! %l5 should be 0000000048000000
	bne,a,pn %xcc,p0_reg_l5_fail
	mov	%l5,%g3
	ldx	[%g1+0x030],%g2
	cmp	%l6,%g2			! %l6 should be 00000000000000ba
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
	cmp	%l0,%l1			! %f0  should be 1d6dfff9 b1ff26e2
	bne	%xcc,p0_f0_fail
	std	%f2,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x08],%l0
	cmp	%l0,%l1			! %f2  should be 0000ffff a2dbc0ff
	bne	%xcc,p0_f2_fail
	std	%f4,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x10],%l0
	cmp	%l0,%l1			! %f4  should be 48000000 8e610000
	bne	%xcc,p0_f4_fail
	std	%f6,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x18],%l0
	cmp	%l0,%l1			! %f6  should be 34f6c510 09f396ac
	bne	%xcc,p0_f6_fail
	std	%f8,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x20],%l0
	cmp	%l0,%l1			! %f8  should be 370cf309 c6d50574
	bne	%xcc,p0_f8_fail
	std	%f10,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x28],%l0
	cmp	%l0,%l1			! %f10 should be 34f6c510 42ab6605
	bne	%xcc,p0_f10_fail
	std	%f12,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x30],%l0
	cmp	%l0,%l1			! %f12 should be 4e22978b e9773d22
	bne	%xcc,p0_f12_fail
	std	%f14,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x38],%l0
	cmp	%l0,%l1			! %f14 should be b78e5902 97917b00
	bne	%xcc,p0_f14_fail
	std	%f16,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x40],%l0
	cmp	%l0,%l1			! %f16 should be c3926923 48000000
	bne	%xcc,p0_f16_fail
	std	%f18,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x48],%l0
	cmp	%l0,%l1			! %f18 should be 00000079 1a803be3
	bne	%xcc,p0_f18_fail
	std	%f20,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x50],%l0
	cmp	%l0,%l1			! %f20 should be 1d6dfff9 b1ff26e2
	bne	%xcc,p0_f20_fail
	std	%f22,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x58],%l0
	cmp	%l0,%l1			! %f22 should be 0e61d149 42ab6605
	bne	%xcc,p0_f22_fail
	std	%f24,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x60],%l0
	cmp	%l0,%l1			! %f24 should be c2a02add ffb471dc
	bne	%xcc,p0_f24_fail
	std	%f26,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x68],%l0
	cmp	%l0,%l1			! %f26 should be 6853bd89 00000000
	bne	%xcc,p0_f26_fail
	std	%f28,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x70],%l0
	cmp	%l0,%l1			! %f28 should be cc020661 fb438732
	bne	%xcc,p0_f28_fail
	std	%f30,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x78],%l0
	cmp	%l0,%l1			! %f30 should be 6ea51f10 9afbdc86
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
	fsqrts	%f8 ,%f9 
	xor	%l0,0x17a,%l6
	addc	%l1,-0x347,%l6
	smul	%l7,0x79c,%l1
	xnor	%l5,-0x4d0,%l4
	done

p0_trap1o:
	fsqrts	%f8 ,%f9 
	xor	%l0,0x17a,%l6
	addc	%l1,-0x347,%l6
	smul	%l7,0x79c,%l1
	xnor	%l5,-0x4d0,%l4
	done


p0_trap2e:
	swapa	[%i2+%g0]ASI_AS_IF_USER_PRIMARY,%l0	! Mem[0000000010081400]
	fcmps	%fcc0,%f8 ,%f2 
	sdivx	%l6,%l4,%l2
	or	%l5,0xc9e,%l5
	andn	%l0,%l0,%l5
	done

p0_trap2o:
	swapa	[%o2+%g0]ASI_AS_IF_USER_PRIMARY,%l0	! Mem[0000000010081400]
	fcmps	%fcc0,%f8 ,%f2 
	sdivx	%l6,%l4,%l2
	or	%l5,0xc9e,%l5
	andn	%l0,%l0,%l5
	done


p0_trap3e:
	add	%l0,-0x3aa,%l3
	add	%l0,0x20c,%l4
	xnor	%l4,-0x252,%l5
	sub	%l7,%l4,%l3
	done

p0_trap3o:
	add	%l0,-0x3aa,%l3
	add	%l0,0x20c,%l4
	xnor	%l4,-0x252,%l5
	sub	%l7,%l4,%l3
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
	ldx	[%g1+0x000],%l0		! %l0 = 9b6ea6d0914e32fc
	ldx	[%g1+0x008],%l1		! %l1 = e8640cf066f7b952
	ldx	[%g1+0x010],%l2		! %l2 = 920aa7d7fc177490
	ldx	[%g1+0x018],%l3		! %l3 = 68eb0bd61e80263e
	ldx	[%g1+0x020],%l4		! %l4 = 9332c2f44b833b4c
	ldx	[%g1+0x028],%l5		! %l5 = 4ae9ee62d783bcb9
	ldx	[%g1+0x030],%l6		! %l6 = a58ec7ca78d5db0f
	ldx	[%g1+0x038],%l7		! %l7 = 6a399572b1427cf4

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
	jmpl	%o7,%g0
	fsqrts	%f8 ,%f9 
	jmpl	%o7,%g0
	nop
p0_near_0_he:
	xor	%l0,0x17a,%l6
	addc	%l1,-0x347,%l6
	jmpl	%o7,%g0
	smul	%l7,0x79c,%l1
near0_b2b_h:
	andn	%l4,0x25b,%l1
	xor	%l5,-0x8b9,%l4
	smul	%l4,0x54e,%l0
	smul	%l5,%l1,%l4
	jmpl	%o7,%g0
	and	%l2,-0xe4b,%l6
near0_b2b_l:
	fsubs	%f8 ,%f9 ,%f12
	fdivs	%f9 ,%f2 ,%f9 
	smul	%l0,0x7be,%l1
	fcmps	%fcc0,%f9 ,%f10
	jmpl	%o7,%g0
	xor	%l2,0xfec,%l0
user_near0_end:
	.seg	"text"
	.align	0x2000
user_near1_start:
p0_near_1_le:
	jmpl	%o7,%g0
	subc	%l4,%l3,%l5
	jmpl	%o7,%g0
	nop
p0_near_1_he:
	subc	%l2,0x531,%l4
	sdivx	%l3,%l3,%l7
	jmpl	%o7,%g0
	udivx	%l5,0x9cd,%l2
near1_b2b_h:
	mulx	%l3,-0xcf5,%l7
	and	%l3,%l5,%l2
	or	%l4,%l5,%l4
	sub	%l2,%l6,%l6
	fmuls	%f25,%f18,%f28
	or	%l0,-0x571,%l5
	or	%l4,0x42b,%l0
	jmpl	%o7,%g0
	fadds	%f21,%f27,%f24
near1_b2b_l:
	mulx	%l4,%l1,%l3
	umul	%l5,%l4,%l2
	sdivx	%l1,-0x3c2,%l0
	fitod	%f1 ,%f12
	fdivs	%f9 ,%f9 ,%f9 
	fdivs	%f14,%f5 ,%f5 
	or	%l4,%l6,%l7
	jmpl	%o7,%g0
	addc	%l3,%l4,%l2
user_near1_end:
	.seg	"text"
	.align	0x2000
user_near2_start:
p0_near_2_le:
	smul	%l0,%l6,%l5
	fsqrts	%f11,%f13
	fmuls	%f4 ,%f7 ,%f7 
	fsqrts	%f13,%f15
	addc	%l4,%l6,%l6
	jmpl	%o7,%g0
	orn	%l3,%l0,%l5
p0_near_2_he:
	orn	%l0,0xe95,%l3
	smul	%l7,0xa71,%l2
	std	%l4,[%i6+0x020]		! Mem[0000000010181420]
	ldstub	[%o3+0x000],%l4		! Mem[0000000021800000]
	smul	%l3,%l0,%l1
	fsqrts	%f16,%f31
	jmpl	%o7,%g0
	fsubs	%f16,%f31,%f25
near2_b2b_h:
	andn	%l4,%l4,%l2
	jmpl	%o7,%g0
	andn	%l1,0x2a2,%l5
near2_b2b_l:
	fcmps	%fcc0,%f4 ,%f7 
	jmpl	%o7,%g0
	fcmps	%fcc2,%f6 ,%f14
user_near2_end:
	.seg	"text"
	.align	0x2000
user_near3_start:
p0_near_3_le:
	fdivs	%f13,%f13,%f1 
	udivx	%l2,0xb91,%l2
	stx	%l1,[%i6+0x018]		! Mem[0000000010181418]
	smul	%l7,%l2,%l3
	and	%l2,0x22c,%l0
	jmpl	%o7,%g0
	fsqrts	%f0 ,%f0 
p0_near_3_he:
	fcmps	%fcc3,%f18,%f28
	umul	%l4,-0x84f,%l0
	addc	%l3,%l6,%l0
	addc	%l1,-0x52c,%l1
	ldub	[%i1+0x026],%l7		! Mem[0000000010041426]
	xnor	%l5,-0x51d,%l2
	andn	%l5,0xb83,%l5
	jmpl	%o7,%g0
	sdivx	%l2,0x66e,%l2
near3_b2b_h:
	jmpl	%o7,%g0
	umul	%l3,0x052,%l6
	jmpl	%o7,%g0
	nop
near3_b2b_l:
	jmpl	%o7,%g0
	udivx	%l7,%l3,%l5
	jmpl	%o7,%g0
	nop
user_near3_end:
	.seg	"text"
	.text
	.align	0x2000
user_far0_start:
p0_far_0_le:
	fsubs	%f13,%f9 ,%f8 
	fsubs	%f8 ,%f9 ,%f1 
	or	%l5,%l2,%l5
	xor	%l5,-0xf74,%l7
	and	%l2,-0x702,%l1
	smul	%l3,%l3,%l4
	smul	%l5,-0x8e2,%l7
	jmpl	%o7,%g0
	fadds	%f0 ,%f7 ,%f3 
p0_far_0_lem:
	fsubs	%f13,%f9 ,%f8 
	fsubs	%f8 ,%f9 ,%f1 
	or	%l5,%l2,%l5
	xor	%l5,-0xf74,%l7
	and	%l2,-0x702,%l1
	smul	%l3,%l3,%l4
	smul	%l5,-0x8e2,%l7
	jmpl	%o7,%g0
	fadds	%f0 ,%f7 ,%f3 
p0_far_0_he:
	fsubs	%f18,%f28,%f25
	andn	%l0,%l3,%l6
	jmpl	%o7,%g0
	xnor	%l3,%l6,%l5
p0_far_0_hem:
	fsubs	%f18,%f28,%f25
	andn	%l0,%l3,%l6
	jmpl	%o7,%g0
	xnor	%l3,%l6,%l5
p0_loop_branch_0:
	jmpl	%o7+12,%g0
	add	%l0,1,%l0
far0_b2b_h:
	udivx	%l2,%l3,%l5
	sub	%l2,0x9c7,%l2
	fadds	%f28,%f23,%f25
	smul	%l3,0xcb6,%l7
	orn	%l5,%l5,%l7
	andn	%l7,-0xaf7,%l6
	jmpl	%o7,%g0
	mulx	%l0,%l7,%l2
far0_b2b_l:
	add	%l4,-0xd4c,%l0
	or	%l0,%l3,%l4
	orn	%l3,-0x4d7,%l4
	fadds	%f13,%f14,%f8 
	addc	%l3,%l0,%l7
	fdivs	%f3 ,%f11,%f12
	jmpl	%o7,%g0
	xor	%l4,-0x1c7,%l2
user_far0_end:
	.seg	"text"
	.text
	.align	0x2000
user_far1_start:
p0_far_1_le:
	jmpl	%o7,%g0
	fsqrts	%f7 ,%f1 
	jmpl	%o7,%g0
	nop
p0_far_1_lem:
	jmpl	%o7,%g0
	fsqrts	%f7 ,%f1 
	jmpl	%o7,%g0
	nop
p0_far_1_he:
	fcmps	%fcc1,%f16,%f20
	fdivs	%f16,%f23,%f17
	jmpl	%o7,%g0
	subc	%l3,%l2,%l5
p0_far_1_hem:
	fcmps	%fcc1,%f16,%f20
	fdivs	%f16,%f23,%f17
	jmpl	%o7,%g0
	subc	%l3,%l2,%l5
p0_loop_branch_1:
	jmpl	%o7+12,%g0
	add	%l0,2,%l0
far1_b2b_h:
	smul	%l1,%l0,%l6
	fdivs	%f31,%f29,%f16
	fsqrts	%f25,%f21
	jmpl	%o7,%g0
	or	%l0,%l7,%l0
far1_b2b_l:
	mulx	%l5,%l0,%l0
	umul	%l4,-0x60d,%l0
	fdivs	%f8 ,%f7 ,%f2 
	jmpl	%o7,%g0
	xnor	%l0,%l1,%l7
user_far1_end:
	.seg	"text"
	.text
	.align	0x2000
user_far2_start:
p0_far_2_le:
	jmpl	%o7,%g0
	fmuls	%f2 ,%f3 ,%f8 
	jmpl	%o7,%g0
	nop
p0_far_2_lem:
	jmpl	%o7,%g0
	fmuls	%f2 ,%f3 ,%f8 
	jmpl	%o7,%g0
	nop
p0_far_2_he:
	add	%l4,-0x609,%l4
	fcmps	%fcc1,%f20,%f23
	or	%l5,%l5,%l5
	or	%l5,%l7,%l1
	mulx	%l7,%l2,%l6
	smul	%l6,0xe68,%l7
	jmpl	%o7,%g0
	orn	%l1,-0x0e7,%l0
p0_far_2_hem:
	add	%l4,-0x609,%l4
	fcmps	%fcc1,%f20,%f23
	or	%l5,%l5,%l5
	or	%l5,%l7,%l1
	mulx	%l7,%l2,%l6
	smul	%l6,0xe68,%l7
	jmpl	%o7,%g0
	orn	%l1,-0x0e7,%l0
p0_loop_branch_2:
	jmpl	%o7+12,%g0
	add	%l0,3,%l0
far2_b2b_h:
	and	%l6,%l1,%l6
	mulx	%l0,%l3,%l6
	xnor	%l0,0x661,%l4
	andn	%l3,-0x2cf,%l6
	or	%l5,%l2,%l6
	udivx	%l6,-0x53c,%l2
	jmpl	%o7,%g0
	xnor	%l2,-0x54c,%l4
far2_b2b_l:
	andn	%l7,%l4,%l2
	fcmps	%fcc3,%f3 ,%f11
	udivx	%l3,%l4,%l7
	and	%l1,%l4,%l6
	mulx	%l2,0x4db,%l3
	addc	%l3,0x97c,%l1
	jmpl	%o7,%g0
	umul	%l1,%l6,%l7
user_far2_end:
	.seg	"text"
	.text
	.align	0x2000
user_far3_start:
p0_far_3_le:
	fdivs	%f6 ,%f9 ,%f10
	fadds	%f5 ,%f9 ,%f15
	fsubs	%f8 ,%f1 ,%f14
	xor	%l6,%l3,%l0
	sub	%l4,0xf1e,%l7
	jmpl	%o7,%g0
	fsubs	%f14,%f1 ,%f0 
p0_far_3_lem:
	fdivs	%f6 ,%f9 ,%f10
	fadds	%f5 ,%f9 ,%f15
	fsubs	%f8 ,%f1 ,%f14
	xor	%l6,%l3,%l0
	sub	%l4,0xf1e,%l7
	jmpl	%o7,%g0
	fsubs	%f14,%f1 ,%f0 
p0_far_3_he:
	mulx	%l7,0x7f0,%l0
	fcmps	%fcc0,%f27,%f25
	xnor	%l3,%l3,%l2
	xnor	%l1,%l7,%l6
	orn	%l5,%l6,%l4
	fadds	%f30,%f26,%f18
	jmpl	%o7,%g0
	nop
p0_far_3_hem:
	mulx	%l7,0x7f0,%l0
	fcmps	%fcc0,%f27,%f25
	xnor	%l3,%l3,%l2
	xnor	%l1,%l7,%l6
	orn	%l5,%l6,%l4
	fadds	%f30,%f26,%f18
	jmpl	%o7,%g0
	nop
p0_loop_branch_3:
	jmpl	%o7+12,%g0
	add	%l0,4,%l0
far3_b2b_h:
	fdivs	%f27,%f25,%f20
	umul	%l3,0xab5,%l2
	jmpl	%o7,%g0
	fsqrts	%f20,%f27
far3_b2b_l:
	fadds	%f12,%f5 ,%f1 
	andn	%l6,%l4,%l3
	jmpl	%o7,%g0
	sdivx	%l6,-0x6ba,%l3
user_far3_end:
	.seg	"text"
	.align	0x2000
user_jump0_start:
	INIT_MEM(0, 0x0010, 1, +, 0, +, 0)
p0_jmpl_0_le:
	jmpl	%g6+8,%g0
	mulx	%l0,%l2,%l1
p0_call_0_le:
	and	%l4,%l6,%l1
	andn	%l7,%l4,%l1
	addc	%l3,%l1,%l4
	smul	%l3,%l1,%l2
	retl
	xor	%l4,-0xc80,%l0
p0_jmpl_0_lo:
	jmpl	%g6+8,%g0
	mulx	%l0,%l2,%l1
p0_call_0_lo:
	and	%l4,%l6,%l1
	andn	%l7,%l4,%l1
	addc	%l3,%l1,%l4
	smul	%l3,%l1,%l2
	retl
	xor	%l4,-0xc80,%l0
p0_jmpl_0_he:
	subc	%l0,%l5,%l1
	fitos	%f20,%f30
	orn	%l0,0x100,%l5
	or	%l3,%l0,%l1
	stw	%l7,[%i5+0x01c]		! Mem[000000001014141c]
	and	%l0,%l5,%l5
	jmpl	%g6+8,%g0
	xor	%l4,%l4,%l6
p0_call_0_he:
	and	%l5,%l5,%l0
	addc	%l4,0x3b7,%l0
	andn	%l6,-0xb3e,%l4
	orn	%l6,-0xde6,%l1
	sdivx	%l5,%l6,%l1
	sub	%l3,%l2,%l4
	retl
	sub	%l4,0x3b7,%l6
p0_jmpl_0_ho:
	subc	%l0,%l5,%l1
	fitos	%f20,%f30
	orn	%l0,0x100,%l5
	or	%l3,%l0,%l1
	stw	%l7,[%o5+0x01c]		! Mem[000000001014141c]
	and	%l0,%l5,%l5
	jmpl	%g6+8,%g0
	xor	%l4,%l4,%l6
p0_call_0_ho:
	and	%l5,%l5,%l0
	addc	%l4,0x3b7,%l0
	andn	%l6,-0xb3e,%l4
	orn	%l6,-0xde6,%l1
	sdivx	%l5,%l6,%l1
	sub	%l3,%l2,%l4
	retl
	sub	%l4,0x3b7,%l6
user_jump0_end:
	.seg	"text"
	.align	0x2000
user_jump1_start:
	INIT_MEM(0, 0x0020, 1, +, 0, +, 0)
p0_jmpl_1_le:
	fadds	%f13,%f0 ,%f14
	and	%l4,%l0,%l3
	st	%f4 ,[%i3+0x000]	! Mem[00000000100c1400]
	or	%l0,0x353,%l0
	jmpl	%g6+8,%g0
	or	%l2,-0x1e2,%l3
p0_call_1_le:
	smul	%l5,0xe3a,%l0
	or	%l6,0xa5e,%l2
	ldub	[%i3+0x021],%l1		! Mem[00000000100c1421]
	fmuls	%f14,%f3 ,%f6 
	and	%l3,-0x217,%l5
	retl
	ldsh	[%i4+0x020],%l6		! Mem[0000000010101420]
p0_jmpl_1_lo:
	fadds	%f13,%f0 ,%f14
	and	%l4,%l0,%l3
	st	%f4 ,[%o3+0x000]	! Mem[00000000100c1400]
	or	%l0,0x353,%l0
	jmpl	%g6+8,%g0
	or	%l2,-0x1e2,%l3
p0_call_1_lo:
	smul	%l5,0xe3a,%l0
	or	%l6,0xa5e,%l2
	ldub	[%o3+0x021],%l1		! Mem[00000000100c1421]
	fmuls	%f14,%f3 ,%f6 
	and	%l3,-0x217,%l5
	retl
	ldsh	[%o4+0x020],%l6		! Mem[0000000010101420]
p0_jmpl_1_he:
	jmpl	%g6+8,%g0
	mulx	%l3,%l5,%l6
p0_call_1_he:
	subc	%l4,0x131,%l3
	smul	%l4,%l1,%l2
	xnor	%l7,%l6,%l6
	umul	%l1,-0xe0e,%l7
	andn	%l5,%l0,%l0
	retl
	ldx	[%i4+0x018],%l4		! Mem[0000000010101418]
p0_jmpl_1_ho:
	jmpl	%g6+8,%g0
	mulx	%l3,%l5,%l6
p0_call_1_ho:
	subc	%l4,0x131,%l3
	smul	%l4,%l1,%l2
	xnor	%l7,%l6,%l6
	umul	%l1,-0xe0e,%l7
	andn	%l5,%l0,%l0
	retl
	ldx	[%o4+0x018],%l4		! Mem[0000000010101418]
user_jump1_end:
	.seg	"text"
	.align	0x2000
user_jump2_start:
	INIT_MEM(0, 0x0030, 1, +, 0, +, 0)
p0_jmpl_2_le:
	jmpl	%g6+8,%g0
	addc	%l1,0x861,%l0
p0_call_2_le:
	udivx	%l7,0xb6f,%l0
	or	%l4,-0xd49,%l7
	ldx	[%i6+0x018],%l6		! Mem[0000000010181418]
	sdivx	%l2,%l6,%l0
	orn	%l7,%l2,%l0
	subc	%l1,0x63b,%l2
	retl
	umul	%l4,%l0,%l3
p0_jmpl_2_lo:
	jmpl	%g6+8,%g0
	addc	%l1,0x861,%l0
p0_call_2_lo:
	udivx	%l7,0xb6f,%l0
	or	%l4,-0xd49,%l7
	ldx	[%o6+0x018],%l6		! Mem[0000000010181418]
	sdivx	%l2,%l6,%l0
	orn	%l7,%l2,%l0
	subc	%l1,0x63b,%l2
	retl
	umul	%l4,%l0,%l3
p0_jmpl_2_he:
	jmpl	%g6+8,%g0
	fsubs	%f21,%f25,%f25
p0_call_2_he:
	or	%l7,-0x50e,%l3
	fmuls	%f18,%f24,%f28
	sdivx	%l4,-0x03e,%l4
	sdivx	%l4,%l0,%l0
	udivx	%l3,-0x104,%l2
	retl
	xnor	%l2,%l3,%l0
p0_jmpl_2_ho:
	jmpl	%g6+8,%g0
	fsubs	%f21,%f25,%f25
p0_call_2_ho:
	or	%l7,-0x50e,%l3
	fmuls	%f18,%f24,%f28
	sdivx	%l4,-0x03e,%l4
	sdivx	%l4,%l0,%l0
	udivx	%l3,-0x104,%l2
	retl
	xnor	%l2,%l3,%l0
user_jump2_end:
	.seg	"text"
	.align	0x2000
user_jump3_start:
	INIT_MEM(0, 0x0040, 1, +, 0, +, 0)
p0_jmpl_3_le:
	and	%l6,%l5,%l1
	mulx	%l7,-0xd1d,%l1
	umul	%l0,0xda3,%l5
	fsubs	%f0 ,%f4 ,%f10
	add	%l6,%l5,%l4
	xor	%l7,0x5f9,%l4
	fsubs	%f4 ,%f3 ,%f0 
	jmpl	%g6+8,%g0
	fsubs	%f8 ,%f15,%f13
p0_call_3_le:
	ldub	[%i5+0x00a],%l6		! Mem[000000001014140a]
	retl
	umul	%l4,-0x372,%l4
p0_jmpl_3_lo:
	and	%l6,%l5,%l1
	mulx	%l7,-0xd1d,%l1
	umul	%l0,0xda3,%l5
	fsubs	%f0 ,%f4 ,%f10
	add	%l6,%l5,%l4
	xor	%l7,0x5f9,%l4
	fsubs	%f4 ,%f3 ,%f0 
	jmpl	%g6+8,%g0
	fsubs	%f8 ,%f15,%f13
p0_call_3_lo:
	ldub	[%o5+0x00a],%l6		! Mem[000000001014140a]
	retl
	umul	%l4,-0x372,%l4
p0_jmpl_3_he:
	xnor	%l4,%l0,%l7
	or	%l2,-0xa92,%l7
	sdivx	%l6,-0xc08,%l2
	orn	%l4,%l4,%l7
	fcmps	%fcc2,%f17,%f24
	ldstub	[%i5+0x026],%l7		! Mem[0000000010141426]
	jmpl	%g6+8,%g0
	sdivx	%l2,%l2,%l2
p0_call_3_he:
	udivx	%l1,%l5,%l1
	andn	%l5,%l5,%l2
	retl
	addc	%l0,0x723,%l5
p0_jmpl_3_ho:
	xnor	%l4,%l0,%l7
	or	%l2,-0xa92,%l7
	sdivx	%l6,-0xc08,%l2
	orn	%l4,%l4,%l7
	fcmps	%fcc2,%f17,%f24
	ldstub	[%o5+0x026],%l7		! Mem[0000000010141426]
	jmpl	%g6+8,%g0
	sdivx	%l2,%l2,%l2
p0_call_3_ho:
	udivx	%l1,%l5,%l1
	andn	%l5,%l5,%l2
	retl
	addc	%l0,0x723,%l5
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
	.word	0x9b6ea6d0,0x914e32fc		! Init value for %l0
	.word	0xe8640cf0,0x66f7b952		! Init value for %l1
	.word	0x920aa7d7,0xfc177490		! Init value for %l2
	.word	0x68eb0bd6,0x1e80263e		! Init value for %l3
	.word	0x9332c2f4,0x4b833b4c		! Init value for %l4
	.word	0x4ae9ee62,0xd783bcb9		! Init value for %l5
	.word	0xa58ec7ca,0x78d5db0f		! Init value for %l6
	.word	0x6a399572,0xb1427cf4		! Init value for %l7
	.align	64
p0_init_freg:
	.word	0x12be9cf8,0x4be67a45		! Init value for %f0 
	.word	0x867517c3,0x1261fd6a		! Init value for %f2 
	.word	0x781c91e0,0x6a485ce9		! Init value for %f4 
	.word	0x7405d5c6,0x133a31ec		! Init value for %f6 
	.word	0xa9916d5f,0x3afbc871		! Init value for %f8 
	.word	0x7ff9c63f,0x08590d12		! Init value for %f10
	.word	0x73cdb2f2,0x890271d1		! Init value for %f12
	.word	0xfe1d82a3,0x61f75dba		! Init value for %f14
	.word	0xf2660b89,0x29ee8f10		! Init value for %f16
	.word	0x90322718,0xd5d1d354		! Init value for %f18
	.word	0x7511905e,0x1d0001c1		! Init value for %f20
	.word	0x80661940,0x92d8a447		! Init value for %f22
	.word	0x0566ab42,0xa66f3780		! Init value for %f24
	.word	0xaa1d888a,0x33d5fedf		! Init value for %f26
	.word	0xd526c6c8,0xef1e71aa		! Init value for %f28
	.word	0x54566331,0xa7966127		! Init value for %f30
	.word	0x7e452964,0x32aee367		! Init value for %f32
	.word	0x2f59aa52,0x2a3ee734		! Init value for %f34
	.word	0x4a865c18,0x832c47b5		! Init value for %f36
	.word	0xe96c71c3,0x3fcc9d57		! Init value for %f38
	.word	0x0ef25495,0x78b280c7		! Init value for %f40
	.word	0xf248dcea,0x07e33a1b		! Init value for %f42
	.word	0x631ab436,0x0a20a05e		! Init value for %f44
	.word	0x44abe2ca,0x2cefeca2		! Init value for %f46
	.word	0x6ce6a51c,0xf33d378b
	.word	0xbbc796e4,0x178417ff
	.word	0xea7e1a16,0x2e7b7b95
	.word	0x65844ff0,0x5a043a7f
	.word	0x57b14fe4,0x4c0fc124
	.word	0x9a7a6d0c,0xe1c36141
	.word	0xcb572705,0x7c6e6bea
	.word	0x1a2943c4,0xa026955e
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
	.word	0x00000000,0x0000ce00
	.word	0x00000000,0x00000048
	.word	0x00000000,0x00000000
	.word	0xffffffff,0xffffffff
	.word	0x00000000,0x48000000
	.word	0x00000000,0x000000ba
	.word	0x00000000,0x00000000
p0_expected_fp_regs:
	.word	0x1d6dfff9,0xb1ff26e2
	.word	0x0000ffff,0xa2dbc0ff
	.word	0x48000000,0x8e610000
	.word	0x34f6c510,0x09f396ac
	.word	0x370cf309,0xc6d50574
	.word	0x34f6c510,0x42ab6605
	.word	0x4e22978b,0xe9773d22
	.word	0xb78e5902,0x97917b00
	.word	0xc3926923,0x48000000
	.word	0x00000079,0x1a803be3
	.word	0x1d6dfff9,0xb1ff26e2
	.word	0x0e61d149,0x42ab6605
	.word	0xc2a02add,0xffb471dc
	.word	0x6853bd89,0x00000000
	.word	0xcc020661,0xfb438732
	.word	0x6ea51f10,0x9afbdc86
	.word	0x00000004,0x00000400		! %fsr = 0000000400000400
p0_local0_expect:
	.word	0xba000000,0x0c37ffed
	.word	0x48000000,0x22a877e1
	.word	0xff5999fb,0xa9aa2662
	.word	0xffffd578,0xf9ff6d1d
	.word	0x4e22978b,0x00000569
	.word	0xdd645a89,0xf75c56ff
	.word	0xc5b8ffb9,0x6226aaa9
	.word	0xffc0c240,0xc762340b
p0_local0_sec_expect:
	.word	0x0000ffff,0xa2dbc0ff
	.word	0xd72adc3f,0xb3952800
	.word	0x48000000,0x8e610000
	.word	0x7405d5c6,0x09f396ac
	.word	0x6226aaa9,0xac96f309
	.word	0x6dd96223,0xfe74caff
	.word	0x4e22978b,0xe9773d22
	.word	0x4dd86223,0x00000000
p0_local1_expect:
	.word	0x00000000,0x952ed578
	.word	0xac96f309,0x315317c0
	.word	0x48000000,0x42ab6605
	.word	0xe9773d22,0x49d1610e
	.word	0x69773d22,0x5bc2523e
	.word	0x052fd791,0x6ff8bfb9
	.word	0x9b55707b,0x4bea9d38
	.word	0xb835ef8f,0x04f925de
p0_local1_sec_expect:
	.word	0xe177a822,0x00000000
	.word	0xdc9d9b00,0x42ab6605
	.word	0x00000048,0x00000000
	.word	0xb3e78224,0x1a8d5386
	.word	0x646fc5f4,0x129a2bd4
	.word	0xda28b8ad,0xa7a985d3
	.word	0x92563b44,0xaffd6a1f
	.word	0x0b34d72a,0x5dee9bc4
p0_local2_expect:
	.word	0x86000000,0x42ab6605
	.word	0x1d6dfff9,0xb1ff26e2
	.word	0xff000000,0x00000000
	.word	0xc7793747,0x3bca1e4b
	.word	0xdbcd7ca0,0x821973ea
	.word	0x57899fbb,0x1f9bc4ac
	.word	0x50ae413e,0x8e2ed52e
	.word	0x55790d32,0xe226ffb1
p0_local2_sec_expect:
	.word	0x00000000,0x86dcfb9a
	.word	0xce000000,0x817ccc8b
	.word	0x00000000,0xf9ff6d1d
	.word	0x8244e035,0xdc3cff1f
	.word	0xdc71b4ff,0xdd2aa0c2
	.word	0xadabdea7,0xf74f043a
	.word	0x328743fb,0x610602cc
	.word	0x86dcfb9a,0x101fa56e
p0_local3_expect:
	.word	0x8e610000,0xf9ff6d1d
	.word	0xffc0dba2,0x2ad7340b
	.word	0x059ccaff,0xedff370c
	.word	0x00ff0000,0x09f396ac
	.word	0xb9bff86f,0x91d72f05
	.word	0x6853bd89,0x1cfa9aae
	.word	0x00000000,0xce9357a6
	.word	0xc4d9e35f,0x78d5ffff
p0_local3_sec_expect:
	.word	0x370cf309,0xc6d50574
	.word	0x9003367b,0xb9bff86f
	.word	0xbac0dba2,0x00000000
	.word	0xe9773d22,0x49d1610e
	.word	0x87fed287,0x5bc2523e
	.word	0x052fd791,0x6ff8bfb9
	.word	0x9b55707b,0x4bea9d38
	.word	0xb835ef8f,0x04f925de
p0_local4_expect:
	.word	0xcc020661,0xfb438732
	.word	0x02cc00ff,0x0000618e
	.word	0x00000079,0x1a803be3
	.word	0x781c91e0,0x8e610000
	.word	0x48ff0000,0x8e610000
	.word	0x56a6c03b,0xa3568c4c
	.word	0x6226aaa9,0x8996f309
	.word	0x8980263e,0x21f13502
p0_local4_sec_expect:
	.word	0xac96f309,0x10c5f634
	.word	0xff5999fb,0x926a46b1
	.word	0x005df761,0x59398f40
	.word	0x4daf00d3,0x1ca27773
	.word	0x7896068c,0xd90e52cc
	.word	0x917ef840,0x0369131e
	.word	0x5c26587e,0x2ed87010
	.word	0xdd9e69c4,0x85bf5f95
p0_local5_expect:
	.word	0x059cddae,0x9afbdc86
	.word	0x052fd791,0x6f05bfb9
	.word	0xf9ff6d1d,0x00000392
	.word	0x0d9cec27,0x00000cef
	.word	0x199317ea,0xb51a731a
	.word	0x4a46fa0d,0x310fa08b
	.word	0xfbb5d0fa,0x9f583f05
	.word	0x1cfa9aae,0x7fee3b5b
p0_local5_sec_expect:
	.word	0xff93d96d,0x9b1de572
	.word	0x0566ab42,0x49d1610e
	.word	0xff000000,0x2362d84d
	.word	0x8365e93b,0x7398626b
	.word	0x4fa1c03a,0x9e31052f
	.word	0x7a4f16fe,0xa2c584f2
	.word	0xfa76ba77,0x1edba537
	.word	0x33d7fad2,0xb0fcab2e
p0_local6_expect:
	.word	0x9afb2800,0x00000000
	.word	0x6ff8bfb9,0x2ad7340b
	.word	0xffffffff,0x48000000
	.word	0x30ef70ef,0xfe8f387f
	.word	0x5bf3f83d,0x1879cdf0
	.word	0x6853bd89,0x548612b5
	.word	0xc2809bda,0xce9357a6
	.word	0xc4d9e35f,0x88f88aa3
p0_local6_sec_expect:
	.word	0xffff0000,0x291fd186
	.word	0xba000000,0xa9c254aa
	.word	0xffaa2662,0x00000000
	.word	0x66dfb8ce,0x62097954
	.word	0x072d6118,0xa6309d67
	.word	0xf0a6b847,0x9c6f2e62
	.word	0x017c0f89,0xe933fb8d
	.word	0x86152a7c,0x7ad11b82
share0_expect:
	.word	0xffffc9d1,0xc795f368
	.word	0xc5a9deba,0x4e21d253
	.word	0x5ddf6329,0xb6ddd440
	.word	0x5c65cf87,0x0c150b43
	.word	0xb36ddb78,0x02488521
	.word	0x0513eb67,0x5ea1e120
	.word	0x5af46c4b,0xc771d778
	.word	0x02a63a9f,0x1da5a8f9
share1_expect:
	.word	0xce000d84,0x3fb3ec13
	.word	0xb800b974,0x66a20954
	.word	0xb2cbc625,0x6449e5d5
	.word	0xe1d1e8a8,0xd3e0722c
	.word	0x1a9000c3,0x1fef1b60
	.word	0x2e224e90,0xa228a97a
	.word	0x32d6b4ae,0x819831a2
	.word	0x44b71d2d,0x072b1fde
	.word	0xc300977d,0xc614dc50
	.word	0xd871db78,0xfa0d80cf
	.word	0x6284aef8,0x576e7e2a
	.word	0x9d8a50bd,0xb44ada80
	.word	0xcbdbad43,0xed9c86ca
	.word	0x1b758961,0xce6a5fae
	.word	0x7f743197,0x8ff87f1d
	.word	0xb4ff4a0c,0x35e86e76
share2_expect:
	.word	0x0000b3ec,0x28daf73a
	.word	0x1df15b0a,0xfc84ca22
	.word	0xb1fff3af,0x05464e02
	.word	0xcc633c22,0x4fbef66d
	.word	0x7c92aa63,0x17745518
	.word	0x77c83dbc,0x60b5a053
	.word	0xe0e30457,0xaf991cb7
	.word	0x2896f7eb,0x614ae50c
share3_expect:
	.word	0x03925c53,0xe6e072bd
	.word	0x59676f50,0x6c53241f
	.word	0x56856c2c,0x6f8029ac
	.word	0xfe739e84,0xe1e91f74
	.word	0x7ca79c50,0x9837424b
	.word	0x4e6feaf3,0xd0f9445f
	.word	0x521fc74f,0x3e756c8d
	.word	0x7b934964,0x72117cd2
	.word	0xff8a48bf,0x06dfc595
	.word	0x895b264f,0x707f932f
	.word	0xd44e3896,0xa0032ae9
	.word	0xa8b1b994,0x528322e1
	.word	0x1123168a,0x5e32bcf1
	.word	0xdd0dc6cb,0x7eb76567
	.word	0x15d50828,0x43907f94
	.word	0x8208014d,0xc4e353e4
	.word	0xff57fef6,0x9d79de7c
	.word	0xf6315b4f,0xcba29e60
	.word	0x8a75b947,0x3112e260
	.word	0xeb9854c7,0x2434ec61
	.word	0xac19e34e,0x92f6d14e
	.word	0x401931e3,0xcc2560f3
	.word	0xd0d35969,0x41cadf58
	.word	0x951cc6ae,0x2fc932e3
	.word	0xc2e9de96,0x8445b84a
	.word	0x6a5d21cb,0x1607576b
	.word	0xb30eae95,0xba80756f
	.word	0x22b6da0c,0x3cffbbae
	.word	0xd455f142,0x4648fa53
	.word	0x69d45fd2,0x400e6e31
	.word	0x807768ee,0x886e7ad2
	.word	0x03e9bae6,0x1d581941
	.word	0x32efd874,0x0efadc42
	.word	0xdfa6ff17,0x65d04513
	.word	0x299f4978,0x9a68b808
	.word	0x7c256d92,0xcf42efbf
	.word	0x35688833,0x5d83699a
	.word	0x05b76fd9,0x90304d60
	.word	0x8dd86d95,0x72d45143
	.word	0x213c8147,0x3950e6d8
	.word	0x58095df1,0xf800103c
	.word	0xf44c8d07,0x11d58c74
	.word	0xcae0ff11,0xc7461003
	.word	0xa9f93bb3,0xa27b2957
	.word	0xbcbc6c95,0xecbf860b
	.word	0x5a88827e,0x9a4bd3b5
	.word	0x5407d79e,0xf430670f
	.word	0xbf5b441d,0x248602a1
	.word	0x9c041b01,0x8c27e716
	.word	0x5b7e64ec,0x331af687
	.word	0xf2d1df87,0xa556d5a0
	.word	0xde5f170d,0x56755980
	.word	0xbcddc6aa,0xc26c6110
	.word	0x874e7ef6,0x2c96bf7b
	.word	0x609ecf9d,0x42da175a
	.word	0x85457111,0xe9db1a69
	.word	0x11ca0059,0x490a3bfa
	.word	0x92fdbcaa,0xe80e7ac3
	.word	0x3804a92c,0x40c7b84b
	.word	0x0020ee9b,0xa34bee9b
	.word	0xaee131d6,0x80712a2d
	.word	0x55cf0e10,0x5d5f8a41
	.word	0x857c2ab3,0xfee9e9c8
	.word	0x5cf1a577,0x34afb0f7
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
	.word	0x0c76207f,0xb20b4ab2
	.word	0x00000000,0x00000002
	.word	0x51ab3b98,0x23973dbc
	.word	0x00000000,0x00000003
	.word	0xc8c9adf7,0x88285311
	.word	0x00000000,0x00000004
	.word	0xd691e808,0x510d75b0
	.word	0x00000000,0x00000005
	.word	0x52302737,0x998c0b48
	.word	0x00000000,0x00000006
	.word	0xc782803f,0xa288bc61
	.word	0x00000000,0x00000007
	.word	0xafe79fdf,0xe86ad500
	.word	0x00000000,0x00000008
	.word	0x5dc26917,0xc6ff005c
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
	.word	0xa175934e,0x4e22978b,0x9781cd3e,0x3ca850e1
	.word	0xa1fe30c8,0x6f189839,0x4799c89c,0x820ba773
	.word	0x7e524ebb,0x04d20a46,0xdd645a89,0xf75c5668
	.word	0xc5b8ceb9,0x4d5424fa,0x93e4c240,0xc7628b5f
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
	.word	0x13263a1c,0xacec2843,0xbe45371a,0x231c38b6
	.word	0xb55f0198,0x66440c1c,0xfa0889e1,0x25bdc40f
	.word	0xda506b91,0xd2ba6426,0x5d46456f,0xc6067983
	.word	0xc8968149,0xca52d7e1,0x63b8036c,0xca1dbeb9
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
	.word	0x09f396ac,0xa9aa2662,0xccc78d20,0xc447d709
	.word	0xc8464fa8,0xfbfbc9cc,0x02cd0c75,0xdf8aea25
	.word	0x209ddb90,0x26d860c1,0x0c7c609a,0x1ecf0787
	.word	0x242711e3,0x7ca5ac4e,0x11ce23ea,0x50dffd57
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
	.word	0x95fff103,0x3d604a9c,0x5e0529d2,0x784dddfc
	.word	0x3225f48b,0x88fb1763,0xb3e78224,0x1a8d5386
	.word	0x646fc5f4,0x129a2bd4,0xda28b8ad,0xa7a985d3
	.word	0x92563b44,0xaffd6a1f,0x2deb45e8,0x5dee9bc4
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
	.word	0x2e95c6ef,0xc03b91ae,0x8fee44a6,0x6ac772db
	.word	0x0a931793,0x926a46b1,0xd5743747,0x3bca1e4b
	.word	0xdbcd7ca0,0x821973ea,0x57899fbb,0x1f9bc41d
	.word	0x50ae413e,0x8e2ed52e,0x55790d32,0xe2263cb1
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
	.word	0xf1055e53,0x236992c3,0xd6ff9c2a,0x817ccc8b
	.word	0x67bb13fd,0x04303354,0x8244e035,0xdc3cff1f
	.word	0xdc71b4ff,0xdd2aa0c2,0xadabdea7,0xf74f043a
	.word	0x328743fb,0x610602cc,0x86dcfb9a,0x101fa56e
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
	.word	0xed2626fe,0x99428988,0x999bf2d0,0x72aa09a6
	.word	0xef0c2a10,0x3f504171,0xd7100e5a,0x56367ada
	.word	0x85ef9f3a,0x91ac7e54,0xf20223db,0xff5636e8
	.word	0x2bbcb2f6,0x66824a83,0x1524bb92,0xa8e2c55f
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
	.word	0x6dd96223,0x5947c779,0x085097da,0x315317c0
	.word	0x3e235979,0xa42423f0,0xe9773d22,0x49d1610e
	.word	0x87fed287,0x5bc2523e,0x052fd791,0x6ff8bfb9
	.word	0x9b55707b,0x4bea9d38,0xb835ef8f,0x04f925de
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
	.word	0x636d8a3e,0xc6209ca6,0xc0dfed16,0x25828f64
	.word	0x43b15d58,0x1a803be3,0xfd81e35f,0x1ea7b256
	.word	0x083790f4,0x9c9ea76a,0x56a6c03b,0xa3568c4c
	.word	0x396f0200,0x243ac724,0xa942419c,0x21f13502
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
	.word	0x3fc07af9,0x10c5f634,0x67230c0e,0x10d8f51e
	.word	0x0c662c8c,0x59398f40,0x4daf00d3,0x1ca27773
	.word	0x7896068c,0xd90e52cc,0x917ef840,0x0369131e
	.word	0x5c26587e,0x2ed87010,0xdd9e69c4,0x85bf5f95
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
	.word	0x618e2aba,0x975046cc,0xd9805ec1,0xe32f68ef
	.word	0x64a0dc4c,0x3db70e9a,0x0d9cec27,0xbd78ede7
	.word	0x191917ea,0xb51a731a,0x4a46fa0d,0x310fa08b
	.word	0xfbb5d0fa,0x9f583f05,0x1cfa9aae,0x7fee3b5b
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
	.word	0x110bf644,0x9b1de572,0x97db06f2,0x6623f754
	.word	0xadbcc431,0xb0adaf5e,0x8365e93b,0x7398626b
	.word	0x4fa1c03a,0x9e31052f,0x7a4f16fe,0xa2c584f2
	.word	0xfa76ba77,0x1edba537,0x33d7fad2,0xb0fcab2e
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
	.word	0x664c4ada,0xf9276d1d,0x47c0dba2,0x2ad7340b
	.word	0x6874caff,0xed49370c,0x30ef70ef,0xfe8f387f
	.word	0x5bf3f83d,0x1850cdf0,0x6853bd89,0x548612b5
	.word	0xc2809bda,0xce9357a6,0xc4d9e35f,0x88f88aa3
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
	.word	0x4b742115,0x291fd186,0x7dc66b31,0xa9c254aa
	.word	0x863fba7b,0x681bf78a,0x66dfb8ce,0x62097954
	.word	0x072d6118,0xa6309d67,0xf0a6b847,0x9c6f2e62
	.word	0x017c0f89,0xe933fb8d,0x86152a7c,0x7ad11b82
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
	.word	0xfc69c9d1,0xc795f368,0xc5a9deba,0x4e21d253
	.word	0x5ddf6329,0xb6ddd440,0x5c65cf87,0x0c150b43
	.word	0xb36ddb78,0x02488521,0x0513eb67,0x5ea1e120
	.word	0x5af46c4b,0xc771d778,0x02a63a9f,0x1da5a8f9
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
	.word	0x23d60d84,0x3fb3ec13,0xb800b974,0x66a20954
	.word	0xb2cbc625,0x6449e5d5,0xe1d1e8a8,0xd3e0722c
	.word	0x1a9000c3,0x1fef1b60,0x2e224e90,0xa228a97a
	.word	0x32d6b4ae,0x819831a2,0x44b71d2d,0x072b1fde
	.word	0xdd77977d,0xc614dc50,0xd871db78,0xfa0d80cf
	.word	0x6284aef8,0x576e7e2a,0x9d8a50bd,0xb44ada80
	.word	0xcbdbad43,0xed9c86ca,0x1b758961,0xce6a5fae
	.word	0x7f743197,0x8ff87f1d,0xb4ff4a0c,0x35e86e76
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
	.word	0xff70b3ec,0x28daf73a,0x1df15b0a,0xfc84ca22
	.word	0xb1fff3af,0x05464e02,0xcc633c22,0x4fbef66d
	.word	0x7c92aa63,0x17745518,0x77c83dbc,0x60b5a053
	.word	0xe0e30457,0xaf991cb7,0x2896f7eb,0x614ae50c
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
	.word	0x03925c53,0xe6e072bd,0x59676f50,0x6c53241f
	.word	0x56856c2c,0x6f8029ac,0xfe739e84,0xe1e91f74
	.word	0x7ca79c50,0x9837424b,0x4e6feaf3,0xd0f9445f
	.word	0x521fc74f,0x3e756c8d,0x7b934964,0x72117cd2
	.word	0x730e48bf,0x06dfc595,0x895b264f,0x707f932f
	.word	0xd44e3896,0xa0032ae9,0xa8b1b994,0x528322e1
	.word	0x1123168a,0x5e32bcf1,0xdd0dc6cb,0x7eb76567
	.word	0x15d50828,0x43907f94,0x8208014d,0xc4e353e4
	.word	0x0457fef6,0x9d79de7c,0xf6315b4f,0xcba29e60
	.word	0x8a75b947,0x3112e260,0xeb9854c7,0x2434ec61
	.word	0xac19e34e,0x92f6d14e,0x401931e3,0xcc2560f3
	.word	0xd0d35969,0x41cadf58,0x951cc6ae,0x2fc932e3
	.word	0xc2e9de96,0x8445b84a,0x6a5d21cb,0x1607576b
	.word	0xb30eae95,0xba80756f,0x22b6da0c,0x3cffbbae
	.word	0xd455f142,0x4648fa53,0x69d45fd2,0x400e6e31
	.word	0x807768ee,0x886e7ad2,0x03e9bae6,0x1d581941
	.word	0x32dcd874,0x0efadc42,0xdfa6ff17,0x65d04513
	.word	0x299f4978,0x9a68b808,0x7c256d92,0xcf42efbf
	.word	0x35688833,0x5d83699a,0x05b76fd9,0x90304d60
	.word	0x8dd86d95,0x72d45143,0x213c8147,0x3950e6d8
	.word	0x58095df1,0xf800103c,0xf44c8d07,0x11d58c74
	.word	0xcae0ff11,0xc7461003,0xa9f93bb3,0xa27b2957
	.word	0xbcbc6c95,0xecbf860b,0x5a88827e,0x9a4bd3b5
	.word	0x5407d79e,0xf430670f,0xbf5b441d,0x248602a1
	.word	0x9c041b01,0x8c27e716,0x5b7e64ec,0x331af687
	.word	0xf2d1df87,0xa556d5a0,0xde5f170d,0x56755980
	.word	0xbcddc6aa,0xc26c6110,0x874e7ef6,0x2c96bf7b
	.word	0x609ecf9d,0x42da175a,0x85457111,0xe9db1a69
	.word	0x11ca0059,0x490a3bfa,0x92fdbcaa,0xe80e7ac3
	.word	0x3804a92c,0x40c7b84b,0x0020ee9b,0xa34bee9b
	.word	0xaee131d6,0x80712a2d,0x55cf0e10,0x5d5f8a41
	.word	0x857c2ab3,0xfee9e9c8,0x5cf1a577,0x34afb0f7
share3_end:
