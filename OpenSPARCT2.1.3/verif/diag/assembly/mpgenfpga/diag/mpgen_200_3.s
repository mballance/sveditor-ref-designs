/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: mpgen_200_3.s
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
!	Seed = 327141852
!	Riesling can be on
!	1 Thread, 200 lines
!	mpgen   created on Dec 20, 2005 (16:35:03)
!	mpgen_200_3.s created on Mar 27, 2009 (14:18:52)
!	RC file : random.rc
!	cmd = /import/n2-tools/release/tools/mpgen/mpgen,1.051220 -rc random.rc -o mpgen_200_3 -p 1 -l 200

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
!	%f0  = 41ddc7bf dae9efe2 cda4e93d 6d71833f
!	%f4  = 7390fbcb 5de11687 95a7613a bcd87dbd
!	%f8  = 501579a4 e6e435b3 67c8e1bc 1492d902
!	%f12 = 6bc6f1ba 001ca6de fff01e7e 33a680a0
	ldda	[%g1]ASI_BLK_P,%f0
	add	%g1,64,%g1
!	%f16 = 3dc891dd 474746a4 5cf781d9 2cdae8b7
!	%f20 = 69902f39 63432a3d c6a129dd 17e05877
!	%f24 = 0a98350c e225944f b1fb02fb ae6a03b6
!	%f28 = d088b4fe c5e7ec0d 7aa30a7a fefbbfdb
	ldda	[%g1]ASI_BLK_P,%f16
	add	%g1,64,%g1
!	%f32 = 8f82bd71 083243f1 410e90e2 19ab282e
!	%f36 = 2c072966 6081d64e e77fcfe5 42b2b3e5
!	%f40 = 95fd1f10 34c598ba 2ffabde6 bdcc23a1
!	%f44 = 12eedc65 0c1cec41 7de7591d c0506936
	ldda	[%g1]ASI_BLK_P,%f32

!	Set up the Graphics Status Register

	setx	0xaa0a521700000046,%g7,%g1 ! GSR scale =  8, align = 6
	wr	%g1,%g0,%gsr		! GSR = aa0a521700000046
	wr	%g0,%y			! Clear Y register
	xorcc	%g0,%g0,%g3		! init %g3 and set flags
	membar	#Sync			! Force the block loads to complete

!	Start of Random Code for processor 0

p0_label_1:
!	Mem[0000000030101400] = 6c792dc6, %l3 = 87b0444c23329392
	lduba	[%i4+%g0]0x81,%l3	! %l3 = 000000000000006c
!	Mem[00000000201c0000] = fd404b0a, %l3 = 000000000000006c
	ldsha	[%o0+0x000]%asi,%l3	! %l3 = fffffffffffffd40
!	%l3 = fffffffffffffd40, Mem[0000000010101408] = e7e75da5
	stwa	%l3,[%i4+%o4]0x88	! Mem[0000000010101408] = fffffd40
!	Mem[00000000201c0000] = fd404b0a, %l3 = fffffffffffffd40
	ldstub	[%o0+%g0],%l3		! %l3 = 000000fd000000ff
!	Mem[0000000030001400] = c7b4747bba2f6db1, %l5 = a9d69e684d13f4df
	ldxa	[%i0+%g0]0x81,%l5	! %l5 = c7b4747bba2f6db1
!	Mem[0000000010001420] = 74962c3f6dc1d70e, %l3 = 00000000000000fd
	ldx	[%i0+0x020],%l3		! %l3 = 74962c3f6dc1d70e
!	Mem[0000000030081408] = 4031c3a6, %l0 = 7bc641c28a847e76
	swapa	[%i2+%o4]0x89,%l0	! %l0 = 000000004031c3a6
!	Mem[0000000010101408] = 40fdffff, %l3 = 74962c3f6dc1d70e
	ldsb	[%i4+%o4],%l3		! %l3 = 0000000000000040
!	Mem[0000000010001404] = b201a3e8, %l0 = 4031c3a6, %l1 = 94c4ab3b
	add	%i0,0x04,%g1
	casa	[%g1]0x80,%l0,%l1	! %l1 = 00000000b201a3e8
!	Starting 10 instruction Store Burst
!	Mem[0000000010141410] = 54afbc00, %l3 = 0000000000000040
	ldstuba	[%i5+%o5]0x88,%l3	! %l3 = 00000000000000ff

p0_label_2:
!	Mem[00000000300c1400] = 5df4502c, %l0 = 000000004031c3a6
	ldstuba	[%i3+%g0]0x89,%l0	! %l0 = 0000002c000000ff
!	%l0 = 0000002c, %l1 = b201a3e8, Mem[0000000010001420] = 74962c3f 6dc1d70e
	stda	%l0,[%i0+0x020]%asi	! Mem[0000000010001420] = 0000002c b201a3e8
!	%l5 = c7b4747bba2f6db1, Mem[0000000030181408] = 332552a1
	stwa	%l5,[%i6+%o4]0x81	! Mem[0000000030181408] = ba2f6db1
!	%l0 = 000000000000002c, Mem[0000000020800001] = dc11cc70
	stb	%l0,[%o1+0x001]		! Mem[0000000020800000] = dc2ccc70
!	%l7 = 89db3819ecd17bec, Mem[0000000010041400] = b075ee0f
	stha	%l7,[%i1+%g0]0x88	! Mem[0000000010041400] = b0757bec
!	%l5 = c7b4747bba2f6db1, Mem[0000000010181400] = 8140f35d
	stwa	%l5,[%i6+%g0]0x88	! Mem[0000000010181400] = ba2f6db1
!	%l3 = 0000000000000000, Mem[0000000021800100] = 5bcc1072
	sth	%l3,[%o3+0x100]		! Mem[0000000021800100] = 00001072
!	%l6 = f5a8db11, %l7 = ecd17bec, Mem[0000000010081400] = f8763337 8f15831a
	stda	%l6,[%i2+%g0]0x80	! Mem[0000000010081400] = f5a8db11 ecd17bec
!	%l7 = 89db3819ecd17bec, Mem[0000000030181410] = 7a40cb40
	stha	%l7,[%i6+%o5]0x81	! Mem[0000000030181410] = 7beccb40
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = 3880263c, %l1 = 00000000b201a3e8
	lduha	[%i6+%g0]0x81,%l1	! %l1 = 0000000000003880

p0_label_3:
!	%f15 = 33a680a0, %f11 = 1492d902, %f30 = 7aa30a7a
	fmuls	%f15,%f11,%f30		! %f30 = 08bf04ff
!	Mem[0000000010141410] = 54afbcff, %l2 = 75c236ba50bb2d9a
	ldswa	[%i5+%o5]0x88,%l2	! %l2 = 0000000054afbcff
!	Mem[00000000201c0000] = ff404b0a, %l3 = 0000000000000000
	ldub	[%o0+%g0],%l3		! %l3 = 00000000000000ff
!	%f30 = 08bf04ff fefbbfdb, %l6 = 4eb6715ff5a8db11
!	Mem[0000000010001418] = 06775604bef1adf8
	add	%i0,0x018,%g1
	stda	%f30,[%g1+%l6]ASI_PST16_PL ! Mem[0000000010001418] = dbbf5604bef1adf8
!	Mem[0000000020800040] = 02935107, %l3 = 00000000000000ff
	lduba	[%o1+0x040]%asi,%l3	! %l3 = 0000000000000002
	membar	#Sync			! Added by membar checker (1)
!	Mem[0000000010001400] = 6be03e31 b201a3e8 53b5c436 c3a4b638
!	Mem[0000000010001410] = a7cd4d17 fa684a87 dbbf5604 bef1adf8
!	Mem[0000000010001420] = 0000002c b201a3e8 6ff4625b 51ea2511
!	Mem[0000000010001430] = a818ebf9 c99c9026 aa5e0439 e4318b94
	ldda	[%i0]ASI_BLK_PL,%f16	! Block Load from 0000000010001400
!	Mem[0000000030001400] = c7b4747b, %l5 = c7b4747bba2f6db1
	lduha	[%i0+%g0]0x81,%l5	! %l5 = 000000000000c7b4
!	Mem[0000000010041400] = ec7b75b0, %f11 = 1492d902
	ld	[%i1+%g0],%f11	! %f11 = ec7b75b0
!	Mem[0000000030181410] = 7beccb40023a54c2, %f10 = 67c8e1bc ec7b75b0
	ldda	[%i6+%o5]0x81,%f10	! %f10 = 7beccb40 023a54c2
!	Starting 10 instruction Store Burst
!	%l0 = 000000000000002c, immed = 0000060a, %y  = 00000000
	udiv	%l0,0x60a,%l0		! %l0 = 0000000000000000
	mov	%l0,%y			! %y = 00000000

p0_label_4:
!	%l3 = 0000000000000002, Mem[0000000030081408] = 8a847e76
	stha	%l3,[%i2+%o4]0x89	! Mem[0000000030081408] = 8a840002
!	Mem[0000000030141408] = 8352168c, %l6 = 4eb6715ff5a8db11
	swapa	[%i5+%o4]0x81,%l6	! %l6 = 000000008352168c
!	%l4 = 56b26e8eb1d61f5f, Mem[0000000030141400] = 117ecd83
	stha	%l4,[%i5+%g0]0x81	! Mem[0000000030141400] = 1f5fcd83
!	%l5 = 000000000000c7b4, Mem[0000000010101411] = 58088cba
	stb	%l5,[%i4+0x011]		! Mem[0000000010101410] = 58b48cba
!	Mem[0000000020800041] = 02935107, %l6 = 000000008352168c
	ldstuba	[%o1+0x041]%asi,%l6	! %l6 = 00000093000000ff
!	%l2 = 0000000054afbcff, Mem[0000000030141400] = 1f5fcd833c81dc74
	stxa	%l2,[%i5+%g0]0x81	! Mem[0000000030141400] = 0000000054afbcff
	membar	#Sync			! Added by membar checker (2)
!	%l2 = 0000000054afbcff, Mem[0000000010001400] = 313ee06b
	stba	%l2,[%i0+%g0]0x88	! Mem[0000000010001400] = 313ee0ff
!	%f2  = cda4e93d, Mem[000000001018142c] = 378862dc
	st	%f2 ,[%i6+0x02c]	! Mem[000000001018142c] = cda4e93d
!	%l2 = 0000000054afbcff, Mem[0000000021800100] = 00001072
	stb	%l2,[%o3+0x100]		! Mem[0000000021800100] = ff001072
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = 3880263c, %f24 = e8a301b2
	lda	[%i6+%g0]0x81,%f24	! %f24 = 3880263c

p0_label_5:
!	Mem[0000000010101408] = fffffd40, %l2 = 0000000054afbcff
	ldswa	[%i4+%o4]0x88,%l2	! %l2 = fffffffffffffd40
!	Mem[0000000030081400] = 9ebe7274, %l2 = fffffffffffffd40
	ldswa	[%i2+%g0]0x89,%l2	! %l2 = ffffffff9ebe7274
!	Mem[0000000010081400] = f5a8db11, %l2 = ffffffff9ebe7274
	lduba	[%i2+%g0]0x80,%l2	! %l2 = 00000000000000f5
!	Mem[0000000030041400] = 97323f27, %l6 = 0000000000000093
	ldsha	[%i1+%g0]0x89,%l6	! %l6 = 0000000000003f27
!	Mem[00000000100c1430] = 18e80b9bb547c5ec, %l1 = 0000000000003880
	ldxa	[%i3+0x030]%asi,%l1	! %l1 = 18e80b9bb547c5ec
!	Mem[0000000030101400] = 8d4671f7c62d796c, %l1 = 18e80b9bb547c5ec
	ldxa	[%i4+%g0]0x89,%l1	! %l1 = 8d4671f7c62d796c
!	Mem[0000000010101408] = fffffd40, %l7 = 89db3819ecd17bec
	lduwa	[%i4+%o4]0x88,%l7	! %l7 = 00000000fffffd40
!	Mem[00000000300c1400] = ff50f45d, %l0 = 0000000000000000
	ldsba	[%i3+%g0]0x81,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010081400] = f5a8db11, %l4 = 56b26e8eb1d61f5f
	ldswa	[%i2+%g0]0x80,%l4	! %l4 = fffffffff5a8db11
!	Starting 10 instruction Store Burst
!	Mem[0000000030041410] = 7a5cf5ff, %l4 = fffffffff5a8db11
	ldstuba	[%i1+%o5]0x81,%l4	! %l4 = 0000007a000000ff

p0_label_6:
!	Mem[0000000010041410] = 6646d866, %l4 = 000000000000007a
	swapa	[%i1+%o5]0x88,%l4	! %l4 = 000000006646d866
!	%l5 = 000000000000c7b4, Mem[0000000010101431] = c95552b0, %asi = 80
	stba	%l5,[%i4+0x031]%asi	! Mem[0000000010101430] = c9b452b0
!	%l0 = ffffffffffffffff, Mem[000000001008142e] = fe071c7b, %asi = 80
	stha	%l0,[%i2+0x02e]%asi	! Mem[000000001008142c] = fe07ffff
!	Mem[0000000010141408] = 255c7717, %l7 = 00000000fffffd40
	swapa	[%i5+%o4]0x88,%l7	! %l7 = 00000000255c7717
!	%l0 = ffffffffffffffff, Mem[0000000030041408] = 1f18a70f
	stwa	%l0,[%i1+%o4]0x89	! Mem[0000000030041408] = ffffffff
!	Mem[0000000030081408] = 0200848a, %l4 = 000000006646d866
	swapa	[%i2+%o4]0x81,%l4	! %l4 = 000000000200848a
!	%l5 = 000000000000c7b4, Mem[0000000030001408] = 7aa73fe5
	stwa	%l5,[%i0+%o4]0x81	! Mem[0000000030001408] = 0000c7b4
!	%l1 = 8d4671f7c62d796c, Mem[00000000100c1410] = cb3db25a
	stwa	%l1,[%i3+%o5]0x80	! Mem[00000000100c1410] = c62d796c
!	%l4 = 000000000200848a, Mem[00000000201c0000] = ff404b0a
	sth	%l4,[%o0+%g0]		! Mem[00000000201c0000] = 848a4b0a
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = 801ddc649ebe7274, %f28 = 26909cc9 f9eb18a8
	ldda	[%i2+%g0]0x89,%f28	! %f28 = 801ddc64 9ebe7274

p0_label_7:
!	Mem[00000000211c0000] = d7dc9ca4, %l4 = 000000000200848a
	ldsba	[%o2+0x000]%asi,%l4	! %l4 = ffffffffffffffd7
!	%l7 = 00000000255c7717, imm = fffffffffffffc90, %l6 = 0000000000003f27
	xnor	%l7,-0x370,%l6		! %l6 = 00000000255c7478
!	Mem[00000000100c1410] = c62d796c, %l4 = ffffffffffffffd7
	ldsba	[%i3+%o5]0x80,%l4	! %l4 = ffffffffffffffc6
!	Mem[00000000100c1410] = c62d796c d06c6fae, %l2 = 000000f5, %l3 = 00000002
	ldda	[%i3+%o5]0x80,%l2	! %l2 = 00000000c62d796c 00000000d06c6fae
!	Mem[0000000010101410] = 58b48cba, %l0 = ffffffffffffffff
	lduwa	[%i4+%o5]0x80,%l0	! %l0 = 0000000058b48cba
!	Mem[0000000030141408] = f5a8db11, %l6 = 00000000255c7478
	ldswa	[%i5+%o4]0x81,%l6	! %l6 = fffffffff5a8db11
!	Mem[0000000030041408] = ffffffff, %l3 = 00000000d06c6fae
	ldsba	[%i1+%o4]0x81,%l3	! %l3 = ffffffffffffffff
!	Mem[00000000211c0000] = d7dc9ca4, %l5 = 000000000000c7b4
	ldsb	[%o2+0x001],%l5		! %l5 = ffffffffffffffdc
!	Mem[0000000030181400] = 3880263c, %l0 = 0000000058b48cba
	ldsha	[%i6+%g0]0x81,%l0	! %l0 = 0000000000003880
!	Starting 10 instruction Store Burst
!	%l4 = ffffffc6, %l5 = ffffffdc, Mem[00000000300c1410] = 6bf71a3a 9fd82cb1
	stda	%l4,[%i3+%o5]0x81	! Mem[00000000300c1410] = ffffffc6 ffffffdc

p0_label_8:
!	Mem[00000000100c1426] = fbba9eb5, %l3 = ffffffffffffffff
	ldstuba	[%i3+0x026]%asi,%l3	! %l3 = 0000009e000000ff
!	%l7 = 00000000255c7717, immed = fffff1e7, %y  = 00000000
	smul	%l7,-0xe19,%l4		! %l4 = fffffdf14b751cc1, %y = fffffdf1
!	%l4 = fffffdf14b751cc1, imm = 00000000000003d6, %l7 = 00000000255c7717
	andn	%l4,0x3d6,%l7		! %l7 = fffffdf14b751c01
!	%l1 = 8d4671f7c62d796c, Mem[0000000030081408] = 6646d866
	stha	%l1,[%i2+%o4]0x81	! Mem[0000000030081408] = 796cd866
!	Mem[0000000010001400] = 313ee0ff, %l5 = ffffffffffffffdc
	ldstuba	[%i0+%g0]0x88,%l5	! %l5 = 000000ff000000ff
!	Mem[0000000030041408] = ffffffff, %l7 = fffffdf14b751c01
	ldstuba	[%i1+%o4]0x81,%l7	! %l7 = 000000ff000000ff
!	%l6 = fffffffff5a8db11, Mem[0000000010081410] = cea3e05a
	stwa	%l6,[%i2+%o5]0x80	! Mem[0000000010081410] = f5a8db11
!	Mem[0000000030081400] = 9ebe7274, %l4 = fffffdf14b751cc1
	ldstuba	[%i2+%g0]0x89,%l4	! %l4 = 00000074000000ff
!	Mem[0000000010001400] = 313ee0ff, %l5 = 00000000000000ff
	swapa	[%i0+%g0]0x88,%l5	! %l5 = 00000000313ee0ff
!	Starting 10 instruction Load Burst
!	%l1 = 8d4671f7c62d796c, imm = ffffffffffffff1d, %l0 = 0000000000003880
	xnor	%l1,-0x0e3,%l0		! %l0 = 8d4671f7c62d798e

p0_label_9:
!	%l2 = 00000000c62d796c, immed = 00000357, %y  = fffffdf1
	smul	%l2,0x357,%l3		! %l3 = ffffff3ee1e087b4, %y = ffffff3e
!	Mem[0000000010041434] = df9d1ae4, %l1 = 8d4671f7c62d796c
	lduha	[%i1+0x036]%asi,%l1	! %l1 = 0000000000001ae4
!	Mem[0000000010141400] = 3929c14b, %l1 = 0000000000001ae4
	lduwa	[%i5+%g0]0x88,%l1	! %l1 = 000000003929c14b
!	Mem[0000000010101404] = b3713ddf, %l6 = fffffffff5a8db11
	ldswa	[%i4+0x004]%asi,%l6	! %l6 = ffffffffb3713ddf
!	Mem[0000000010081400] = f5a8db11, %l2 = 00000000c62d796c
	ldsha	[%i2+%g0]0x80,%l2	! %l2 = fffffffffffff5a8
!	%f26 = 1125ea51, %f16 = e8a301b2, %f15 = 33a680a0
	fdivs	%f26,%f16,%f15		! %f15 = 80000000
!	Mem[0000000010141408] = 40fdffff 6ecef794, %l0 = c62d798e, %l1 = 3929c14b
	ldd	[%i5+%o4],%l0		! %l0 = 0000000040fdffff 000000006ecef794
!	Mem[0000000030101410] = da8bf391, %l6 = ffffffffb3713ddf
	lduba	[%i4+%o5]0x89,%l6	! %l6 = 0000000000000091
!	Mem[0000000010041410] = 6a6544af 0000007a, %l0 = 40fdffff, %l1 = 6ecef794
	ldda	[%i1+%o5]0x88,%l0	! %l0 = 000000000000007a 000000006a6544af
!	Starting 10 instruction Store Burst
!	Mem[0000000010101408] = 40fdffff, %l5 = 00000000313ee0ff
	ldstuba	[%i4+0x008]%asi,%l5	! %l5 = 00000040000000ff

p0_label_10:
!	Mem[0000000010041410] = 7a000000, %l2 = fffffffffffff5a8
	swapa	[%i1+%o5]0x80,%l2	! %l2 = 000000007a000000
!	Mem[00000000201c0000] = 848a4b0a, %l4 = 0000000000000074
	ldstuba	[%o0+0x000]%asi,%l4	! %l4 = 00000084000000ff
!	Mem[0000000030141400] = 00000000, %f4  = 7390fbcb
	lda	[%i5+%g0]0x81,%f4 	! %f4 = 00000000
!	Mem[0000000010101430] = c9b452b0, %l6 = 00000091, %l7 = 000000ff
	add	%i4,0x30,%g1
	casa	[%g1]0x80,%l6,%l7	! %l7 = 00000000c9b452b0
!	%l7 = 00000000c9b452b0, Mem[0000000010001428] = 6ff4625b51ea2511
	stx	%l7,[%i0+0x028]		! Mem[0000000010001428] = 00000000c9b452b0
!	%l4 = 0000000000000084, Mem[0000000030001400] = c7b4747b
	stwa	%l4,[%i0+%g0]0x81	! Mem[0000000030001400] = 00000084
!	%f24 = 3880263c 2c000000, Mem[0000000010101410] = ba8cb458 b3bfc23b
	stda	%f24,[%i4+%o5]0x88	! Mem[0000000010101410] = 3880263c 2c000000
!	Mem[0000000010141410] = 54afbcff, %l0 = 000000000000007a
	ldstuba	[%i5+%o5]0x88,%l0	! %l0 = 000000ff000000ff
!	%l6 = 00000091, %l7 = c9b452b0, Mem[0000000010101410] = 0000002c 3c268038
	stda	%l6,[%i4+%o5]0x80	! Mem[0000000010101410] = 00000091 c9b452b0
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = ff72be9e, %l1 = 000000006a6544af
	lduha	[%i2+%g0]0x81,%l1	! %l1 = 000000000000ff72

p0_label_11:
!	Mem[0000000030101408] = 3dd8ed00, %l1 = 000000000000ff72
	ldsba	[%i4+%o4]0x81,%l1	! %l1 = 000000000000003d
!	Mem[0000000030001400] = 84000000, %l3 = ffffff3ee1e087b4
	lduba	[%i0+%g0]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000010081400] = 11dba8f5, %f29 = 9ebe7274
	lda	[%i2+%g0]0x88,%f29	! %f29 = 11dba8f5
!	Mem[00000000100c1410] = c62d796c, %l0 = 00000000000000ff
	ldsha	[%i3+%o5]0x80,%l0	! %l0 = ffffffffffffc62d
!	Mem[00000000100c1408] = f2bf4a03b58c8bd4, %l2 = 000000007a000000
	ldxa	[%i3+%o4]0x88,%l2	! %l2 = f2bf4a03b58c8bd4
!	Mem[0000000030181408] = b16d2fba, %l3 = 0000000000000000
	lduwa	[%i6+%o4]0x89,%l3	! %l3 = 00000000b16d2fba
!	%f14 = fff01e7e, %f11 = 023a54c2
	fsqrts	%f14,%f11		! %f11 = fff01e7e
!	Mem[0000000010141400] = 4bc12939, %l0 = ffffffffffffc62d
	ldsha	[%i5+%g0]0x80,%l0	! %l0 = 0000000000004bc1
!	Mem[0000000021800000] = 0df65599, %l3 = 00000000b16d2fba
	lduh	[%o3+%g0],%l3		! %l3 = 0000000000000df6
!	Starting 10 instruction Store Burst
!	%l2 = b58c8bd4, %l3 = 00000df6, Mem[0000000030101408] = 00edd83d afdc0de5
	stda	%l2,[%i4+%o4]0x89	! Mem[0000000030101408] = b58c8bd4 00000df6

p0_label_12:
!	Mem[00000000100c1408] = b58c8bd4, %l1 = 000000000000003d
	swapa	[%i3+%o4]0x88,%l1	! %l1 = 00000000b58c8bd4
!	%l3 = 0000000000000df6, Mem[00000000100c1400] = 18aa3c1b
	stwa	%l3,[%i3+%g0]0x88	! Mem[00000000100c1400] = 00000df6
!	%l5 = 0000000000000040, Mem[00000000100c1408] = 3d000000034abff2, %asi = 80
	stxa	%l5,[%i3+0x008]%asi	! Mem[00000000100c1408] = 0000000000000040
!	%f2  = cda4e93d 6d71833f, Mem[0000000010041408] = eb87f960 32b74340
	stda	%f2 ,[%i1+%o4]0x88	! Mem[0000000010041408] = cda4e93d 6d71833f
!	%f24 = 3880263c 2c000000, Mem[0000000010041430] = a062311c df9d1ae4
	std	%f24,[%i1+0x030]	! Mem[0000000010041430] = 3880263c 2c000000
!	%f0  = 41ddc7bf dae9efe2 cda4e93d 6d71833f
!	%f4  = 00000000 5de11687 95a7613a bcd87dbd
!	%f8  = 501579a4 e6e435b3 7beccb40 fff01e7e
!	%f12 = 6bc6f1ba 001ca6de fff01e7e 80000000
	stda	%f0,[%i4]ASI_BLK_AIUP	! Block Store to 0000000010101400
!	%f31 = 39045eaa, %f17 = 313ee06b, %f28 = 801ddc64 11dba8f5
	fsmuld	%f31,%f17,%f28		! %f28 = 3d58ac93 15144380
!	Code Fragment 4
p0_fragment_1:
!	%l0 = 0000000000004bc1
	setx	0xe714220ff053148d,%g7,%l0 ! %l0 = e714220ff053148d
!	%l1 = 00000000b58c8bd4
	setx	0x1e61708f80bc8615,%g7,%l1 ! %l1 = 1e61708f80bc8615
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = e714220ff053148d
	setx	0xbc2060df82de0ba9,%g7,%l0 ! %l0 = bc2060df82de0ba9
!	%l1 = 1e61708f80bc8615
	setx	0x860e36d843075261,%g7,%l1 ! %l1 = 860e36d843075261
!	%l7 = 00000000c9b452b0, %l0 = bc2060df82de0ba9, %l6 = 0000000000000091
	and	%l7,%l0,%l6		! %l6 = 00000000809402a0
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (3)
!	Mem[0000000010101418] = 95a7613abcd87dbd, %f28 = 3d58ac93 15144380
	ldda	[%i4+0x018]%asi,%f28	! %f28 = 95a7613a bcd87dbd

p0_label_13:
!	Mem[0000000030101410] = 4a66faadda8bf391, %f28 = 95a7613a bcd87dbd
	ldda	[%i4+%o5]0x89,%f28	! %f28 = 4a66faad da8bf391
!	Mem[0000000010081408] = fca0e757a445acc4, %f22 = f8adf1be 0456bfdb
	ldda	[%i2+%o4]0x88,%f22	! %f22 = fca0e757 a445acc4
!	Mem[00000000300c1400] = ff50f45d, %l6 = 00000000809402a0
	ldswa	[%i3+%g0]0x81,%l6	! %l6 = ffffffffff50f45d
!	Mem[0000000030081408] = 796cd866, %l1 = 860e36d843075261
	lduwa	[%i2+%o4]0x81,%l1	! %l1 = 00000000796cd866
!	Mem[0000000030081400] = 801ddc649ebe72ff, %l0 = bc2060df82de0ba9
	ldxa	[%i2+%g0]0x89,%l0	! %l0 = 801ddc649ebe72ff
!	Mem[0000000010101400] = 41ddc7bfdae9efe2, %l0 = 801ddc649ebe72ff
	ldxa	[%i4+%g0]0x80,%l0	! %l0 = 41ddc7bfdae9efe2
!	Mem[0000000021800140] = c157fbbf, %l7 = 00000000c9b452b0
	ldub	[%o3+0x140],%l7		! %l7 = 00000000000000c1
!	Mem[00000000100c1420] = 15d2f2b5 fbbaffb5, %l2 = b58c8bd4, %l3 = 00000df6
	ldd	[%i3+0x020],%l2		! %l2 = 0000000015d2f2b5 00000000fbbaffb5
!	Mem[0000000010181428] = 6eea0330, %l3 = 00000000fbbaffb5
	ldsb	[%i6+0x02b],%l3		! %l3 = 0000000000000030
!	Starting 10 instruction Store Burst
!	%f12 = 6bc6f1ba 001ca6de, %l4 = 0000000000000084
!	Mem[0000000030181428] = 02aa56d9a9b30679
	add	%i6,0x028,%g1
	stda	%f12,[%g1+%l4]ASI_PST8_S ! Mem[0000000030181428] = 6baa56d9a91c0679

p0_label_14:
!	%l4 = 0000000000000084, Mem[0000000030181410] = 7beccb40
	stha	%l4,[%i6+%o5]0x81	! Mem[0000000030181410] = 0084cb40
!	Mem[0000000021800101] = ff001072, %l2 = 0000000015d2f2b5
	ldstub	[%o3+0x101],%l2		! %l2 = 00000000000000ff
!	%f6  = 95a7613a bcd87dbd, %l4 = 0000000000000084
!	Mem[0000000010141430] = bc81e290ababc67c
	add	%i5,0x030,%g1
	stda	%f6,[%g1+%l4]ASI_PST32_PL ! Mem[0000000010141430] = bc81e290ababc67c
!	%l1 = 00000000796cd866, Mem[0000000030141400] = 00000000
	stha	%l1,[%i5+%g0]0x89	! Mem[0000000030141400] = 0000d866
!	Mem[0000000010141410] = ffbcaf54, %l1 = 00000000796cd866
	ldstub	[%i5+%o5],%l1		! %l1 = 000000ff000000ff
!	Mem[0000000010141400] = 3929c14b, %l6 = ffffffffff50f45d
	ldstuba	[%i5+%g0]0x88,%l6	! %l6 = 0000004b000000ff
!	%f18 = 38b6a4c3 36c4b553, Mem[0000000030101400] = c62d796c 8d4671f7
	stda	%f18,[%i4+%g0]0x89	! Mem[0000000030101400] = 38b6a4c3 36c4b553
!	%l2 = 00000000, %l3 = 00000030, Mem[0000000010101430] = 6bc6f1ba 001ca6de
	std	%l2,[%i4+0x030]		! Mem[0000000010101430] = 00000000 00000030
!	Mem[0000000010081407] = ecd17bec, %l3 = 0000000000000030
	ldstuba	[%i2+0x007]%asi,%l3	! %l3 = 000000ec000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = 66d86c79, %l1 = 00000000000000ff
	lduwa	[%i2+%o4]0x89,%l1	! %l1 = 0000000066d86c79

p0_label_15:
!	%f20 = 874a68fa, %f6  = 95a7613a, %f4  = 00000000 5de11687
	fsmuld	%f20,%f6 ,%f4 		! %f4  = 33b08aeb 57105480
!	Mem[0000000030081408] = 66d86c79, %l4 = 0000000000000084
	lduwa	[%i2+%o4]0x89,%l4	! %l4 = 0000000066d86c79
!	Mem[0000000010141410] = ffbcaf54b53976a1, %f4  = 33b08aeb 57105480
	ldda	[%i5+0x010]%asi,%f4 	! %f4  = ffbcaf54 b53976a1
!	Mem[0000000010001410] = a7cd4d17, %l4 = 0000000066d86c79
	ldsba	[%i0+%o5]0x80,%l4	! %l4 = ffffffffffffffa7
!	Mem[0000000010081400] = f5a8db11, %l7 = 00000000000000c1
	lduba	[%i2+%g0]0x80,%l7	! %l7 = 00000000000000f5
!	Mem[0000000010141410] = 54afbcff, %l3 = 00000000000000ec
	lduha	[%i5+%o5]0x88,%l3	! %l3 = 000000000000bcff
!	Mem[000000001014143c] = 7ca997d6, %f26 = 1125ea51
	ld	[%i5+0x03c],%f26	! %f26 = 7ca997d6
!	Mem[0000000030101410] = da8bf391, %l6 = 000000000000004b
	lduba	[%i4+%o5]0x89,%l6	! %l6 = 0000000000000091
!	Mem[0000000010001400] = 000000ff, %l2 = 0000000000000000
	ldsha	[%i0+%g0]0x88,%l2	! %l2 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%f16 = e8a301b2 313ee06b 38b6a4c3 36c4b553
!	%f20 = 874a68fa 174dcda7 fca0e757 a445acc4
!	%f24 = 3880263c 2c000000 7ca997d6 5b62f46f
!	%f28 = 4a66faad da8bf391 948b31e4 39045eaa
	stda	%f16,[%i5]ASI_BLK_S	! Block Store to 0000000030141400

p0_label_16:
	membar	#Sync			! Added by membar checker (4)
!	Mem[0000000010141434] = ababc67c, %l4 = ffffffa7, %l7 = 000000f5
	add	%i5,0x34,%g1
	casa	[%g1]0x80,%l4,%l7	! %l7 = 00000000ababc67c
!	%l1 = 0000000066d86c79, Mem[0000000030181400] = 05d99aa83c268038
	stxa	%l1,[%i6+%g0]0x89	! Mem[0000000030181400] = 0000000066d86c79
!	Mem[0000000020800041] = 02ff5107, %l5 = 0000000000000040
	ldstub	[%o1+0x041],%l5		! %l5 = 000000ff000000ff
!	%l6 = 0000000000000091, Mem[0000000010081400] = 11dba8f5
	stha	%l6,[%i2+%g0]0x88	! Mem[0000000010081400] = 11db0091
!	Mem[000000001004140c] = 3de9a4cd, %l3 = 000000000000bcff
	swap	[%i1+0x00c],%l3		! %l3 = 000000003de9a4cd
!	%f0  = 41ddc7bf dae9efe2, %l3 = 000000003de9a4cd
!	Mem[0000000030181400] = 796cd86600000000
	stda	%f0,[%i6+%l3]ASI_PST16_S ! Mem[0000000030181400] = 41ddc7bf0000efe2
!	%f16 = e8a301b2, Mem[0000000010101410] = 00000000
	sta	%f16,[%i4+%o5]0x80	! Mem[0000000010101410] = e8a301b2
!	%l3 = 000000003de9a4cd, Mem[00000000300c1410] = dcffffffc6ffffff
	stxa	%l3,[%i3+%o5]0x89	! Mem[00000000300c1410] = 000000003de9a4cd
!	%l1 = 0000000066d86c79, imm = 0000000000000d75, %l1 = 0000000066d86c79
	xnor	%l1,0xd75,%l1		! %l1 = ffffffff99279ef3
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = a8f5ffff, %l3 = 000000003de9a4cd
	lduba	[%i1+%o5]0x88,%l3	! %l3 = 00000000000000ff

p0_label_17:
!	Mem[0000000030101410] = 91f38bda, %f14 = fff01e7e
	lda	[%i4+%o5]0x81,%f14	! %f14 = 91f38bda
!	Mem[0000000030141408] = 38b6a4c3 36c4b553, %l2 = 000000ff, %l3 = 000000ff
	ldda	[%i5+%o4]0x81,%l2	! %l2 = 0000000038b6a4c3 0000000036c4b553
!	Mem[00000000100c1408] = 00000000, %l2 = 0000000038b6a4c3
	ldsba	[%i3+%o4]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000030101400] = 38b6a4c336c4b553, %f26 = 7ca997d6 5b62f46f
	ldda	[%i4+%g0]0x89,%f26	! %f26 = 38b6a4c3 36c4b553
!	Mem[0000000010081408] = a445acc4, %l3 = 0000000036c4b553
	ldswa	[%i2+%o4]0x88,%l3	! %l3 = ffffffffa445acc4
!	Mem[000000001000140c] = c3a4b638, %l2 = 0000000000000000
	lduha	[%i0+0x00c]%asi,%l2	! %l2 = 000000000000c3a4
!	Mem[0000000030081400] = ff72be9e, %l7 = 00000000ababc67c
	lduba	[%i2+%g0]0x81,%l7	! %l7 = 00000000000000ff
!	%f21 = 174dcda7, %f18 = 38b6a4c3
	fcmps	%fcc1,%f21,%f18		! %fcc1 = 1
!	Mem[0000000010041410] = fffff5a8, %l4 = ffffffffffffffa7
	ldswa	[%i1+%o5]0x80,%l4	! %l4 = fffffffffffff5a8
!	Starting 10 instruction Store Burst
!	%f22 = fca0e757 a445acc4, %l5 = 00000000000000ff
!	Mem[00000000100c1428] = 2f32c682ef5b1127
	add	%i3,0x028,%g1
	stda	%f22,[%g1+%l5]ASI_PST16_P ! Mem[00000000100c1428] = fca0e757a445acc4

p0_label_18:
!	%l2 = 0000c3a4, %l3 = a445acc4, Mem[0000000030081400] = 9ebe72ff 801ddc64
	stda	%l2,[%i2+%g0]0x89	! Mem[0000000030081400] = 0000c3a4 a445acc4
!	%f30 = 948b31e4, Mem[0000000010141414] = b53976a1
	st	%f30,[%i5+0x014]	! Mem[0000000010141414] = 948b31e4
!	%l1 = ffffffff99279ef3, Mem[0000000010141408] = fffffd40
	stba	%l1,[%i5+%o4]0x88	! Mem[0000000010141408] = fffffdf3
!	Mem[0000000030001400] = 84000000, %l1 = ffffffff99279ef3
	ldstuba	[%i0+%g0]0x89,%l1	! %l1 = 00000000000000ff
!	%f2  = cda4e93d, Mem[0000000010181408] = 741fe5f1
	sta	%f2 ,[%i6+%o4]0x80	! Mem[0000000010181408] = cda4e93d
!	Mem[0000000030141408] = 38b6a4c3, %l7 = 00000000000000ff
	swapa	[%i5+%o4]0x81,%l7	! %l7 = 0000000038b6a4c3
!	%l1 = 0000000000000000, Mem[00000000201c0000] = ff8a4b0a
	sth	%l1,[%o0+%g0]		! Mem[00000000201c0000] = 00004b0a
!	Mem[00000000100c1408] = 00000000, %l2 = 000000000000c3a4
	swapa	[%i3+%o4]0x88,%l2	! %l2 = 0000000000000000
!	%l5 = 00000000000000ff, Mem[0000000010181420] = 7ed46528
	stw	%l5,[%i6+0x020]		! Mem[0000000010181420] = 000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = 00004b0a, %l0 = 41ddc7bfdae9efe2
	ldsb	[%o0+0x001],%l0		! %l0 = 0000000000000000

p0_label_19:
!	Mem[000000001014140c] = 6ecef794, %l3 = ffffffffa445acc4
	ldswa	[%i5+0x00c]%asi,%l3	! %l3 = 000000006ecef794
!	Mem[0000000010101408] = 3de9a4cd, %l5 = 00000000000000ff
	ldsba	[%i4+%o4]0x88,%l5	! %l5 = ffffffffffffffcd
!	Mem[0000000030101410] = 4a66faadda8bf391, %f10 = 7beccb40 fff01e7e
	ldda	[%i4+%o5]0x89,%f10	! %f10 = 4a66faad da8bf391
!	Mem[00000000100c1408] = 0000c3a4, %l7 = 0000000038b6a4c3
	lduha	[%i3+%o4]0x88,%l7	! %l7 = 000000000000c3a4
!	Mem[00000000218000c0] = 5c03524b, %l3 = 000000006ecef794
	ldsha	[%o3+0x0c0]%asi,%l3	! %l3 = 0000000000005c03
!	Mem[00000000201c0000] = 00004b0a, %l6 = 0000000000000091
	lduha	[%o0+0x000]%asi,%l6	! %l6 = 0000000000000000
!	Mem[0000000030101410] = da8bf391, %l0 = 0000000000000000
	lduwa	[%i4+%o5]0x89,%l0	! %l0 = 00000000da8bf391
!	Mem[0000000010081410] = f5a8db11dbda32c2, %f18 = 38b6a4c3 36c4b553
	ldda	[%i2+0x010]%asi,%f18	! %f18 = f5a8db11 dbda32c2
!	%l7 = 000000000000c3a4, imm = fffffffffffff6db, %l5 = ffffffffffffffcd
	or	%l7,-0x925,%l5		! %l5 = fffffffffffff7ff
!	Starting 10 instruction Store Burst
!	Mem[0000000030081408] = 66d86c79, %l1 = 0000000000000000
	ldstuba	[%i2+%o4]0x89,%l1	! %l1 = 00000079000000ff

p0_label_20:
!	%l5 = fffffffffffff7ff, Mem[0000000010181400] = b16d2fba
	stba	%l5,[%i6+%g0]0x80	! Mem[0000000010181400] = ff6d2fba
!	%f28 = 4a66faad da8bf391, Mem[0000000010141438] = 547c66c1 7ca997d6
	stda	%f28,[%i5+0x038]%asi	! Mem[0000000010141438] = 4a66faad da8bf391
!	%f0  = 41ddc7bf, %f4  = ffbcaf54, %f23 = a445acc4
	fdivs	%f0 ,%f4 ,%f23		! %f23 = fffcaf54
!	%l7 = 000000000000c3a4, Mem[0000000030101408] = d48b8cb5
	stwa	%l7,[%i4+%o4]0x81	! Mem[0000000030101408] = 0000c3a4
!	%f0  = 41ddc7bf dae9efe2, Mem[0000000030181408] = b16d2fba e66089fc
	stda	%f0 ,[%i6+%o4]0x89	! Mem[0000000030181408] = 41ddc7bf dae9efe2
!	Mem[00000000201c0000] = 00004b0a, %l2 = 0000000000000000
	lduh	[%o0+%g0],%l2		! %l2 = 0000000000000000
!	%l7 = 000000000000c3a4, Mem[0000000010181410] = 54736037
	stha	%l7,[%i6+%o5]0x80	! Mem[0000000010181410] = c3a46037
!	Mem[0000000010181408] = cda4e93d, %l4 = fffffffffffff5a8
	ldstuba	[%i6+%o4]0x80,%l4	! %l4 = 000000cd000000ff
!	%l2 = 00000000, %l3 = 00005c03, Mem[00000000300c1400] = ff50f45d 4cb22a61
	stda	%l2,[%i3+%g0]0x81	! Mem[00000000300c1400] = 00000000 00005c03
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = fffff5a8, %l1 = 0000000000000079
	lduha	[%i1+%o5]0x80,%l1	! %l1 = 000000000000ffff

	ba,a	p0_not_taken_0_end
p0_not_taken_0:
!	The following code should not be executed
	nop
	mulx	%l1,0x454,%l3
	nop
	sub	%l3,%l1,%l7
	fsqrts	%f25,%f27
	fadds	%f18,%f8,%f24
	ba,a	p0_branch_failed
p0_not_taken_0_end:


!	End of Random Code for Thread 0


!	Check Registers

p0_check_registers:
	set	p0_expected_registers,%g1
	ldx	[%g1+0x000],%g2
	cmp	%l0,%g2			! %l0 should be 00000000da8bf391
	bne,a,pn %xcc,p0_reg_l0_fail
	mov	%l0,%g3
	ldx	[%g1+0x008],%g2
	cmp	%l1,%g2			! %l1 should be 000000000000ffff
	bne,a,pn %xcc,p0_reg_l1_fail
	mov	%l1,%g3
	ldx	[%g1+0x010],%g2
	cmp	%l2,%g2			! %l2 should be 0000000000000000
	bne,a,pn %xcc,p0_reg_l2_fail
	mov	%l2,%g3
	ldx	[%g1+0x018],%g2
	cmp	%l3,%g2			! %l3 should be 0000000000005c03
	bne,a,pn %xcc,p0_reg_l3_fail
	mov	%l3,%g3
	ldx	[%g1+0x020],%g2
	cmp	%l4,%g2			! %l4 should be 00000000000000cd
	bne,a,pn %xcc,p0_reg_l4_fail
	mov	%l4,%g3
	ldx	[%g1+0x028],%g2
	cmp	%l5,%g2			! %l5 should be fffffffffffff7ff
	bne,a,pn %xcc,p0_reg_l5_fail
	mov	%l5,%g3
	ldx	[%g1+0x030],%g2
	cmp	%l6,%g2			! %l6 should be 0000000000000000
	bne,a,pn %xcc,p0_reg_l6_fail
	mov	%l6,%g3
	ldx	[%g1+0x038],%g2
	cmp	%l7,%g2			! %l7 should be 000000000000c3a4
	bne,a,pn %xcc,p0_reg_l7_fail
	mov	%l7,%g3

!	Check %y register

	set	0xffffff3e,%g2
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
	cmp	%l0,%l1			! %f0  should be 41ddc7bf dae9efe2
	bne	%xcc,p0_f0_fail
	std	%f2,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x08],%l0
	cmp	%l0,%l1			! %f2  should be cda4e93d 6d71833f
	bne	%xcc,p0_f2_fail
	std	%f4,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x10],%l0
	cmp	%l0,%l1			! %f4  should be ffbcaf54 b53976a1
	bne	%xcc,p0_f4_fail
	std	%f10,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x28],%l0
	cmp	%l0,%l1			! %f10 should be 4a66faad da8bf391
	bne	%xcc,p0_f10_fail
	std	%f14,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x38],%l0
	cmp	%l0,%l1			! %f14 should be 91f38bda 80000000
	bne	%xcc,p0_f14_fail
	std	%f16,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x40],%l0
	cmp	%l0,%l1			! %f16 should be e8a301b2 313ee06b
	bne	%xcc,p0_f16_fail
	std	%f18,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x48],%l0
	cmp	%l0,%l1			! %f18 should be f5a8db11 dbda32c2
	bne	%xcc,p0_f18_fail
	std	%f20,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x50],%l0
	cmp	%l0,%l1			! %f20 should be 874a68fa 174dcda7
	bne	%xcc,p0_f20_fail
	std	%f22,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x58],%l0
	cmp	%l0,%l1			! %f22 should be fca0e757 fffcaf54
	bne	%xcc,p0_f22_fail
	std	%f24,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x60],%l0
	cmp	%l0,%l1			! %f24 should be 3880263c 2c000000
	bne	%xcc,p0_f24_fail
	std	%f26,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x68],%l0
	cmp	%l0,%l1			! %f26 should be 38b6a4c3 36c4b553
	bne	%xcc,p0_f26_fail
	std	%f28,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x70],%l0
	cmp	%l0,%l1			! %f28 should be 4a66faad da8bf391
	bne	%xcc,p0_f28_fail
	std	%f30,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x78],%l0
	cmp	%l0,%l1			! %f30 should be 948b31e4 39045eaa
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

p0_f10_fail:
	set	p0_temp,%g6
	mov	0xf10,%l0
	stx	%l0,[%g6]
	std	%f10,[%g6+8]
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
	or	%l5,%l2,%l4
	done

p0_trap1o:
	or	%l5,%l2,%l4
	done


p0_trap2e:
	fcmps	%fcc3,%f7 ,%f13
	umul	%l7,%l4,%l0
	done

p0_trap2o:
	fcmps	%fcc3,%f7 ,%f13
	umul	%l7,%l4,%l0
	done


p0_trap3e:
	and	%l6,%l4,%l3
	done

p0_trap3o:
	and	%l6,%l4,%l3
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
	ldx	[%g1+0x000],%l0		! %l0 = 7bc641c28a847e76
	ldx	[%g1+0x008],%l1		! %l1 = ef2db23e94c4ab3b
	ldx	[%g1+0x010],%l2		! %l2 = 75c236ba50bb2d9a
	ldx	[%g1+0x018],%l3		! %l3 = 87b0444c23329392
	ldx	[%g1+0x020],%l4		! %l4 = 56b26e8eb1d61f5f
	ldx	[%g1+0x028],%l5		! %l5 = a9d69e684d13f4df
	ldx	[%g1+0x030],%l6		! %l6 = 4eb6715ff5a8db11
	ldx	[%g1+0x038],%l7		! %l7 = 89db3819ecd17bec

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
	sth	%l3,[%i6+0x026]		! Mem[0000000010181426]
	jmpl	%o7,%g0
	addc	%l5,%l4,%l7
p0_near_0_he:
	xor	%l1,0x893,%l5
	xor	%l2,-0xaca,%l6
	fdivs	%f24,%f25,%f25
	mulx	%l1,%l3,%l1
	fadds	%f17,%f23,%f16
	fdivs	%f22,%f23,%f25
	addc	%l1,0x9c4,%l6
	jmpl	%o7,%g0
	fdtos	%f24,%f30
near0_b2b_h:
	xnor	%l1,%l4,%l5
	jmpl	%o7,%g0
	xnor	%l7,%l1,%l6
near0_b2b_l:
	smul	%l0,-0x346,%l4
	jmpl	%o7,%g0
	and	%l1,-0xeb6,%l4
user_near0_end:
	.seg	"text"
	.align	0x2000
user_near1_start:
p0_near_1_le:
	fsubs	%f1 ,%f7 ,%f9 
	andn	%l2,0xfbb,%l2
	jmpl	%o7,%g0
	subc	%l3,-0x962,%l3
p0_near_1_he:
	fmuls	%f28,%f29,%f21
	mulx	%l4,%l6,%l3
	umul	%l3,-0xda6,%l7
	add	%l2,0xe8c,%l2
	fdtos	%f18,%f31
	jmpl	%o7,%g0
	sub	%l0,0x221,%l1
near1_b2b_h:
	and	%l0,%l6,%l7
	subc	%l7,%l7,%l6
	xnor	%l1,%l4,%l6
	jmpl	%o7,%g0
	sdivx	%l7,-0x537,%l1
near1_b2b_l:
	xnor	%l2,%l4,%l6
	orn	%l2,0x9d4,%l7
	addc	%l0,-0x7b8,%l0
	jmpl	%o7,%g0
	smul	%l1,%l6,%l3
user_near1_end:
	.seg	"text"
	.align	0x2000
user_near2_start:
p0_near_2_le:
	smul	%l7,0xc54,%l5
	udivx	%l5,0x4db,%l6
	or	%l4,%l7,%l3
	fsqrts	%f6 ,%f5 
	fmuls	%f15,%f3 ,%f2 
	addc	%l7,0x40a,%l0
	jmpl	%o7,%g0
	orn	%l6,0xf90,%l4
p0_near_2_he:
	umul	%l2,%l7,%l4
	addc	%l3,-0x384,%l6
	jmpl	%o7,%g0
	fsqrts	%f27,%f31
near2_b2b_h:
	fdtos	%f22,%f28
	mulx	%l1,%l6,%l1
	fcmps	%fcc0,%f19,%f19
	or	%l4,%l2,%l0
	addc	%l2,-0xfce,%l0
	xor	%l1,0x20e,%l7
	mulx	%l1,%l0,%l0
	jmpl	%o7,%g0
	xnor	%l3,%l7,%l2
near2_b2b_l:
	fmuls	%f10,%f2 ,%f3 
	fadds	%f4 ,%f10,%f13
	andn	%l6,-0x779,%l6
	and	%l7,0x09e,%l7
	fsubs	%f10,%f2 ,%f1 
	add	%l0,%l1,%l6
	addc	%l3,0x991,%l6
	jmpl	%o7,%g0
	sub	%l3,%l6,%l2
user_near2_end:
	.seg	"text"
	.align	0x2000
user_near3_start:
p0_near_3_le:
	udivx	%l7,0x5c1,%l7
	and	%l3,%l7,%l6
	sdivx	%l3,-0x195,%l5
	fsqrts	%f2 ,%f2 
	jmpl	%o7,%g0
	udivx	%l1,-0x20e,%l4
p0_near_3_he:
	jmpl	%o7,%g0
	fcmps	%fcc0,%f20,%f23
	jmpl	%o7,%g0
	nop
near3_b2b_h:
	fcmps	%fcc3,%f20,%f30
	addc	%l0,-0x906,%l7
	smul	%l0,%l1,%l7
	mulx	%l6,-0x528,%l0
	or	%l1,%l6,%l2
	jmpl	%o7,%g0
	subc	%l3,%l2,%l6
near3_b2b_l:
	sdivx	%l1,%l3,%l6
	fcmps	%fcc3,%f9 ,%f9 
	mulx	%l3,0x1ab,%l2
	fdivs	%f8 ,%f13,%f14
	fsqrts	%f9 ,%f3 
	jmpl	%o7,%g0
	fdivs	%f0 ,%f7 ,%f1 
user_near3_end:
	.seg	"text"
	.text
	.align	0x2000
user_far0_start:
p0_far_0_le:
	udivx	%l2,%l7,%l3
	fsqrts	%f12,%f9 
	fsubs	%f4 ,%f5 ,%f0 
	sub	%l4,%l4,%l4
	fmuls	%f14,%f14,%f6 
	orn	%l0,%l5,%l3
	fsqrts	%f0 ,%f2 
	jmpl	%o7,%g0
	swap	[%i3+0x018],%l2		! Mem[00000000100c1418]
p0_far_0_lem:
	udivx	%l2,%l7,%l3
	fsqrts	%f12,%f9 
	fsubs	%f4 ,%f5 ,%f0 
	sub	%l4,%l4,%l4
	fmuls	%f14,%f14,%f6 
	orn	%l0,%l5,%l3
	fsqrts	%f0 ,%f2 
	membar	#Sync
	jmpl	%o7,%g0
	swap	[%i3+0x018],%l2		! Mem[00000000100c1418]
p0_far_0_he:
	fmuls	%f23,%f30,%f22
	and	%l1,0x3e8,%l3
	subc	%l7,%l1,%l7
	fsqrts	%f29,%f16
	xnor	%l6,%l2,%l2
	jmpl	%o7,%g0
	add	%l4,-0x4f8,%l2
p0_far_0_hem:
	fmuls	%f23,%f30,%f22
	and	%l1,0x3e8,%l3
	subc	%l7,%l1,%l7
	fsqrts	%f29,%f16
	xnor	%l6,%l2,%l2
	jmpl	%o7,%g0
	add	%l4,-0x4f8,%l2
p0_loop_branch_0:
	jmpl	%o7+12,%g0
	add	%l0,1,%l0
far0_b2b_h:
	subc	%l1,0x153,%l6
	udivx	%l7,0x4c5,%l6
	jmpl	%o7,%g0
	smul	%l3,%l1,%l6
far0_b2b_l:
	umul	%l6,-0xfd9,%l0
	fadds	%f6 ,%f8 ,%f0 
	jmpl	%o7,%g0
	mulx	%l5,-0x7a4,%l6
user_far0_end:
	.seg	"text"
	.text
	.align	0x2000
user_far1_start:
p0_far_1_le:
	fdivs	%f9 ,%f6 ,%f10
	fsubs	%f8 ,%f8 ,%f5 
	and	%l2,%l2,%l0
	addc	%l5,-0x4c2,%l7
	fdivs	%f13,%f0 ,%f7 
	jmpl	%o7,%g0
	fadds	%f3 ,%f14,%f4 
p0_far_1_lem:
	fdivs	%f9 ,%f6 ,%f10
	fsubs	%f8 ,%f8 ,%f5 
	and	%l2,%l2,%l0
	addc	%l5,-0x4c2,%l7
	fdivs	%f13,%f0 ,%f7 
	jmpl	%o7,%g0
	fadds	%f3 ,%f14,%f4 
p0_far_1_he:
	xor	%l4,0xec3,%l2
	fmuls	%f31,%f19,%f17
	andn	%l1,0x2b4,%l2
	fsqrts	%f25,%f25
	fsqrts	%f18,%f29
	xor	%l7,%l1,%l2
	jmpl	%o7,%g0
	andn	%l3,%l1,%l5
p0_far_1_hem:
	xor	%l4,0xec3,%l2
	fmuls	%f31,%f19,%f17
	andn	%l1,0x2b4,%l2
	fsqrts	%f25,%f25
	fsqrts	%f18,%f29
	xor	%l7,%l1,%l2
	jmpl	%o7,%g0
	andn	%l3,%l1,%l5
p0_loop_branch_1:
	jmpl	%o7+12,%g0
	add	%l0,2,%l0
far1_b2b_h:
	fmuls	%f30,%f16,%f19
	fcmps	%fcc1,%f23,%f22
	or	%l5,-0xecb,%l6
	sdivx	%l7,0xd1b,%l0
	subc	%l4,-0xc5f,%l4
	jmpl	%o7,%g0
	sub	%l5,%l4,%l6
far1_b2b_l:
	add	%l3,0xc3a,%l1
	fadds	%f2 ,%f14,%f15
	xor	%l0,%l7,%l5
	or	%l7,-0x970,%l0
	xnor	%l3,%l7,%l0
	jmpl	%o7,%g0
	udivx	%l4,%l3,%l1
user_far1_end:
	.seg	"text"
	.text
	.align	0x2000
user_far2_start:
p0_far_2_le:
	mulx	%l2,0x003,%l5
	addc	%l3,%l7,%l0
	jmpl	%o7,%g0
	sdivx	%l3,%l1,%l0
p0_far_2_lem:
	mulx	%l2,0x003,%l5
	addc	%l3,%l7,%l0
	jmpl	%o7,%g0
	sdivx	%l3,%l1,%l0
p0_far_2_he:
	or	%l6,%l3,%l4
	xnor	%l1,0xc3e,%l1
	xnor	%l0,-0xe84,%l5
	fadds	%f30,%f27,%f30
	andn	%l4,0xf05,%l5
	orn	%l1,-0x7a7,%l6
	jmpl	%o7,%g0
	fsubs	%f31,%f26,%f24
p0_far_2_hem:
	or	%l6,%l3,%l4
	xnor	%l1,0xc3e,%l1
	xnor	%l0,-0xe84,%l5
	fadds	%f30,%f27,%f30
	andn	%l4,0xf05,%l5
	orn	%l1,-0x7a7,%l6
	jmpl	%o7,%g0
	fsubs	%f31,%f26,%f24
p0_loop_branch_2:
	jmpl	%o7+12,%g0
	add	%l0,3,%l0
far2_b2b_h:
	fsqrts	%f24,%f24
	umul	%l4,-0xdb7,%l2
	fsubs	%f26,%f27,%f25
	jmpl	%o7,%g0
	fdivs	%f25,%f22,%f17
far2_b2b_l:
	xnor	%l2,-0x9cd,%l1
	add	%l5,-0xdca,%l1
	fmuls	%f2 ,%f2 ,%f7 
	jmpl	%o7,%g0
	or	%l2,-0x29f,%l4
user_far2_end:
	.seg	"text"
	.text
	.align	0x2000
user_far3_start:
p0_far_3_le:
	jmpl	%o7,%g0
	fitod	%f0 ,%f12
	jmpl	%o7,%g0
	nop
p0_far_3_lem:
	jmpl	%o7,%g0
	fitod	%f0 ,%f12
	jmpl	%o7,%g0
	nop
p0_far_3_he:
	fdivs	%f26,%f23,%f30
	sub	%l6,-0xace,%l0
	jmpl	%o7,%g0
	sdivx	%l3,0x35a,%l0
p0_far_3_hem:
	fdivs	%f26,%f23,%f30
	sub	%l6,-0xace,%l0
	jmpl	%o7,%g0
	sdivx	%l3,0x35a,%l0
p0_loop_branch_3:
	jmpl	%o7+12,%g0
	add	%l0,4,%l0
far3_b2b_h:
	fmuls	%f24,%f17,%f18
	udivx	%l2,%l2,%l7
	or	%l7,0xeae,%l3
	addc	%l1,0x24a,%l6
	subc	%l0,%l7,%l0
	subc	%l5,%l3,%l7
	subc	%l0,%l0,%l0
	jmpl	%o7,%g0
	mulx	%l6,%l4,%l3
far3_b2b_l:
	fsubs	%f2 ,%f13,%f7 
	addc	%l3,0x0a5,%l2
	mulx	%l2,-0x7ba,%l0
	orn	%l1,-0x256,%l2
	fcmps	%fcc1,%f4 ,%f0 
	fdivs	%f13,%f8 ,%f0 
	umul	%l1,%l2,%l7
	jmpl	%o7,%g0
	fdivs	%f11,%f12,%f15
user_far3_end:
	.seg	"text"
	.align	0x2000
user_jump0_start:
	INIT_MEM(0, 0x0010, 1, +, 0, +, 0)
p0_jmpl_0_le:
	xor	%l7,%l3,%l0
	jmpl	%g6+8,%g0
	udivx	%l2,0x56b,%l6
p0_call_0_le:
	add	%l6,0x354,%l6
	or	%l7,%l7,%l3
	retl
	subc	%l6,%l5,%l4
p0_jmpl_0_lo:
	xor	%l7,%l3,%l0
	jmpl	%g6+8,%g0
	udivx	%l2,0x56b,%l6
p0_call_0_lo:
	add	%l6,0x354,%l6
	or	%l7,%l7,%l3
	retl
	subc	%l6,%l5,%l4
p0_jmpl_0_he:
	umul	%l6,%l6,%l3
	orn	%l7,%l7,%l4
	umul	%l7,%l7,%l3
	fcmps	%fcc1,%f26,%f20
	smul	%l4,%l5,%l0
	subc	%l4,-0xd12,%l4
	sth	%l0,[%i2+0x016]		! Mem[0000000010081416]
	jmpl	%g6+8,%g0
	fsqrts	%f18,%f24
p0_call_0_he:
	st	%f20,[%i3+0x038]	! Mem[00000000100c1438]
	nop
	orn	%l7,%l5,%l2
	fmuls	%f18,%f28,%f27
	udivx	%l3,0x60c,%l3
	retl
	andn	%l6,-0xf75,%l2
p0_jmpl_0_ho:
	umul	%l6,%l6,%l3
	orn	%l7,%l7,%l4
	umul	%l7,%l7,%l3
	fcmps	%fcc1,%f26,%f20
	smul	%l4,%l5,%l0
	subc	%l4,-0xd12,%l4
	sth	%l0,[%o2+0x016]		! Mem[0000000010081416]
	jmpl	%g6+8,%g0
	fsqrts	%f18,%f24
p0_call_0_ho:
	st	%f20,[%o3+0x038]	! Mem[00000000100c1438]
	nop
	orn	%l7,%l5,%l2
	fmuls	%f18,%f28,%f27
	udivx	%l3,0x60c,%l3
	retl
	andn	%l6,-0xf75,%l2
user_jump0_end:
	.seg	"text"
	.align	0x2000
user_jump1_start:
	INIT_MEM(0, 0x0020, 1, +, 0, +, 0)
p0_jmpl_1_le:
	fcmps	%fcc0,%f15,%f6 
	smul	%l2,0x873,%l2
	andn	%l2,%l4,%l7
	addc	%l0,%l5,%l6
	addc	%l0,%l1,%l4
	jmpl	%g6+8,%g0
	fadds	%f11,%f8 ,%f2 
p0_call_1_le:
	ldub	[%i5+0x036],%l0		! Mem[0000000010141436]
	andn	%l2,-0x22e,%l4
	retl
	fsubs	%f14,%f4 ,%f5 
p0_jmpl_1_lo:
	fcmps	%fcc0,%f15,%f6 
	smul	%l2,0x873,%l2
	andn	%l2,%l4,%l7
	addc	%l0,%l5,%l6
	addc	%l0,%l1,%l4
	jmpl	%g6+8,%g0
	fadds	%f11,%f8 ,%f2 
p0_call_1_lo:
	ldub	[%o5+0x036],%l0		! Mem[0000000010141436]
	andn	%l2,-0x22e,%l4
	retl
	fsubs	%f14,%f4 ,%f5 
p0_jmpl_1_he:
	xor	%l3,%l4,%l3
	udivx	%l3,%l2,%l3
	sdivx	%l7,0x5ce,%l1
	or	%l4,-0x543,%l2
	sub	%l1,0xada,%l3
	umul	%l6,%l3,%l1
	jmpl	%g6+8,%g0
	fmuls	%f28,%f22,%f19
p0_call_1_he:
	mulx	%l0,%l7,%l2
	fdivs	%f31,%f28,%f19
	and	%l7,-0x5c2,%l6
	retl
	andn	%l4,%l0,%l2
p0_jmpl_1_ho:
	xor	%l3,%l4,%l3
	udivx	%l3,%l2,%l3
	sdivx	%l7,0x5ce,%l1
	or	%l4,-0x543,%l2
	sub	%l1,0xada,%l3
	umul	%l6,%l3,%l1
	jmpl	%g6+8,%g0
	fmuls	%f28,%f22,%f19
p0_call_1_ho:
	mulx	%l0,%l7,%l2
	fdivs	%f31,%f28,%f19
	and	%l7,-0x5c2,%l6
	retl
	andn	%l4,%l0,%l2
user_jump1_end:
	.seg	"text"
	.align	0x2000
user_jump2_start:
	INIT_MEM(0, 0x0030, 1, +, 0, +, 0)
p0_jmpl_2_le:
	std	%l0,[%i1+0x020]		! Mem[0000000010041420]
	umul	%l4,0x0ed,%l4
	xnor	%l0,0x270,%l7
	umul	%l1,0x5ff,%l2
	or	%l4,-0x39a,%l1
	xnor	%l3,0x277,%l6
	jmpl	%g6+8,%g0
	or	%l3,0x56b,%l5
p0_call_2_le:
	and	%l7,%l3,%l4
	retl
	xnor	%l6,0x74d,%l4
p0_jmpl_2_lo:
	std	%l0,[%o1+0x020]		! Mem[0000000010041420]
	umul	%l4,0x0ed,%l4
	xnor	%l0,0x270,%l7
	umul	%l1,0x5ff,%l2
	or	%l4,-0x39a,%l1
	xnor	%l3,0x277,%l6
	jmpl	%g6+8,%g0
	or	%l3,0x56b,%l5
p0_call_2_lo:
	and	%l7,%l3,%l4
	retl
	xnor	%l6,0x74d,%l4
p0_jmpl_2_he:
	fmuls	%f28,%f28,%f27
	mulx	%l3,%l6,%l4
	andn	%l1,-0x7b5,%l3
	or	%l2,%l7,%l6
	fcmps	%fcc1,%f27,%f29
	sub	%l6,-0xcb6,%l0
	jmpl	%g6+8,%g0
	addc	%l0,0xf2e,%l2
p0_call_2_he:
	addc	%l4,0xa60,%l0
	sdivx	%l1,-0xa30,%l2
	subc	%l4,0x730,%l0
	umul	%l5,%l0,%l0
	retl
	sub	%l0,0xd90,%l5
p0_jmpl_2_ho:
	fmuls	%f28,%f28,%f27
	mulx	%l3,%l6,%l4
	andn	%l1,-0x7b5,%l3
	or	%l2,%l7,%l6
	fcmps	%fcc1,%f27,%f29
	sub	%l6,-0xcb6,%l0
	jmpl	%g6+8,%g0
	addc	%l0,0xf2e,%l2
p0_call_2_ho:
	addc	%l4,0xa60,%l0
	sdivx	%l1,-0xa30,%l2
	subc	%l4,0x730,%l0
	umul	%l5,%l0,%l0
	retl
	sub	%l0,0xd90,%l5
user_jump2_end:
	.seg	"text"
	.align	0x2000
user_jump3_start:
	INIT_MEM(0, 0x0040, 1, +, 0, +, 0)
p0_jmpl_3_le:
	fdivs	%f1 ,%f1 ,%f3 
	mulx	%l3,-0xa63,%l0
	smul	%l0,0x02f,%l7
	jmpl	%g6+8,%g0
	fadds	%f7 ,%f2 ,%f9 
p0_call_3_le:
	st	%f11,[%i0+0x020]	! Mem[0000000010001420]
	mulx	%l7,%l6,%l3
	xnor	%l2,-0xf5d,%l6
	fsubs	%f9 ,%f1 ,%f15
	orn	%l2,-0xa18,%l2
	retl
	orn	%l3,%l6,%l7
p0_jmpl_3_lo:
	fdivs	%f1 ,%f1 ,%f3 
	mulx	%l3,-0xa63,%l0
	smul	%l0,0x02f,%l7
	jmpl	%g6+8,%g0
	fadds	%f7 ,%f2 ,%f9 
p0_call_3_lo:
	st	%f11,[%o0+0x020]	! Mem[0000000010001420]
	mulx	%l7,%l6,%l3
	xnor	%l2,-0xf5d,%l6
	fsubs	%f9 ,%f1 ,%f15
	orn	%l2,-0xa18,%l2
	retl
	orn	%l3,%l6,%l7
p0_jmpl_3_he:
	xor	%l2,0xe82,%l2
	umul	%l3,%l4,%l5
	ldd	[%i4+0x008],%l4		! Mem[0000000010101408]
	jmpl	%g6+8,%g0
	orn	%l7,-0x433,%l2
p0_call_3_he:
	and	%l0,0x975,%l6
	umul	%l5,%l2,%l4
	umul	%l5,0xc0d,%l4
	and	%l6,%l0,%l1
	fadds	%f24,%f16,%f31
	fsqrts	%f27,%f26
	fmuls	%f18,%f18,%f24
	retl
	subc	%l4,%l7,%l3
p0_jmpl_3_ho:
	xor	%l2,0xe82,%l2
	umul	%l3,%l4,%l5
	ldd	[%o4+0x008],%l4		! Mem[0000000010101408]
	jmpl	%g6+8,%g0
	orn	%l7,-0x433,%l2
p0_call_3_ho:
	and	%l0,0x975,%l6
	umul	%l5,%l2,%l4
	umul	%l5,0xc0d,%l4
	and	%l6,%l0,%l1
	fadds	%f24,%f16,%f31
	fsqrts	%f27,%f26
	fmuls	%f18,%f18,%f24
	retl
	subc	%l4,%l7,%l3
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
	.word	0x7bc641c2,0x8a847e76		! Init value for %l0
	.word	0xef2db23e,0x94c4ab3b		! Init value for %l1
	.word	0x75c236ba,0x50bb2d9a		! Init value for %l2
	.word	0x87b0444c,0x23329392		! Init value for %l3
	.word	0x56b26e8e,0xb1d61f5f		! Init value for %l4
	.word	0xa9d69e68,0x4d13f4df		! Init value for %l5
	.word	0x4eb6715f,0xf5a8db11		! Init value for %l6
	.word	0x89db3819,0xecd17bec		! Init value for %l7
	.align	64
p0_init_freg:
	.word	0x41ddc7bf,0xdae9efe2		! Init value for %f0 
	.word	0xcda4e93d,0x6d71833f		! Init value for %f2 
	.word	0x7390fbcb,0x5de11687		! Init value for %f4 
	.word	0x95a7613a,0xbcd87dbd		! Init value for %f6 
	.word	0x501579a4,0xe6e435b3		! Init value for %f8 
	.word	0x67c8e1bc,0x1492d902		! Init value for %f10
	.word	0x6bc6f1ba,0x001ca6de		! Init value for %f12
	.word	0xfff01e7e,0x33a680a0		! Init value for %f14
	.word	0x3dc891dd,0x474746a4		! Init value for %f16
	.word	0x5cf781d9,0x2cdae8b7		! Init value for %f18
	.word	0x69902f39,0x63432a3d		! Init value for %f20
	.word	0xc6a129dd,0x17e05877		! Init value for %f22
	.word	0x0a98350c,0xe225944f		! Init value for %f24
	.word	0xb1fb02fb,0xae6a03b6		! Init value for %f26
	.word	0xd088b4fe,0xc5e7ec0d		! Init value for %f28
	.word	0x7aa30a7a,0xfefbbfdb		! Init value for %f30
	.word	0x8f82bd71,0x083243f1		! Init value for %f32
	.word	0x410e90e2,0x19ab282e		! Init value for %f34
	.word	0x2c072966,0x6081d64e		! Init value for %f36
	.word	0xe77fcfe5,0x42b2b3e5		! Init value for %f38
	.word	0x95fd1f10,0x34c598ba		! Init value for %f40
	.word	0x2ffabde6,0xbdcc23a1		! Init value for %f42
	.word	0x12eedc65,0x0c1cec41		! Init value for %f44
	.word	0x7de7591d,0xc0506936		! Init value for %f46
	.word	0x34dfc55b,0xfbe94058
	.word	0xa3f5780f,0x16c9b358
	.word	0xaab83bb1,0x50a78f99
	.word	0xbc335bec,0x735ad6a8
	.word	0x7de6e893,0x3630f7c8
	.word	0x282cd852,0x7b282b7d
	.word	0x8bac8e78,0x100878f7
	.word	0x64ec4d1b,0xe7ab5ec3
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
	.word	0x00000000,0xda8bf391
	.word	0x00000000,0x0000ffff
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00005c03
	.word	0x00000000,0x000000cd
	.word	0xffffffff,0xfffff7ff
	.word	0x00000000,0x00000000
	.word	0x00000000,0x0000c3a4
p0_expected_fp_regs:
	.word	0x41ddc7bf,0xdae9efe2
	.word	0xcda4e93d,0x6d71833f
	.word	0xffbcaf54,0xb53976a1
	.word	0x95a7613a,0xbcd87dbd
	.word	0x501579a4,0xe6e435b3
	.word	0x4a66faad,0xda8bf391
	.word	0x6bc6f1ba,0x001ca6de
	.word	0x91f38bda,0x80000000
	.word	0xe8a301b2,0x313ee06b
	.word	0xf5a8db11,0xdbda32c2
	.word	0x874a68fa,0x174dcda7
	.word	0xfca0e757,0xfffcaf54
	.word	0x3880263c,0x2c000000
	.word	0x38b6a4c3,0x36c4b553
	.word	0x4a66faad,0xda8bf391
	.word	0x948b31e4,0x39045eaa
	.word	0x00000001,0x00000000		! %fsr = 0000000100000000
p0_local0_expect:
	.word	0xff000000,0xb201a3e8
	.word	0x53b5c436,0xc3a4b638
	.word	0xa7cd4d17,0xfa684a87
	.word	0xdbbf5604,0xbef1adf8
	.word	0x0000002c,0xb201a3e8
	.word	0x00000000,0xc9b452b0
	.word	0xa818ebf9,0xc99c9026
	.word	0xaa5e0439,0xe4318b94
p0_local0_sec_expect:
	.word	0xff000084,0xba2f6db1
	.word	0x0000c7b4,0xe0065d43
	.word	0xdf6e1d6d,0x6adbc17a
	.word	0xf4844f09,0x11f573f2
	.word	0x11f23500,0x322a00b4
	.word	0x911128e7,0xb0cfe4ad
	.word	0xab9e454c,0x6c0da500
	.word	0x1363c7aa,0xf6d64b31
p0_local1_expect:
	.word	0xec7b75b0,0xd89ca2d7
	.word	0x3f83716d,0x0000bcff
	.word	0xfffff5a8,0xaf44656a
	.word	0x4561a35f,0x742b4bb8
	.word	0x0698693d,0xf992187b
	.word	0x187f9311,0x41a28ea5
	.word	0x3880263c,0x2c000000
	.word	0x0cdaef19,0x4391f86d
p0_local1_sec_expect:
	.word	0x273f3297,0xd1055c20
	.word	0xffffffff,0x96223f5a
	.word	0xff5cf5ff,0x469c20d5
	.word	0x19fcaf81,0x13b2ab7e
	.word	0x2029d659,0x659a6283
	.word	0x93cedfa2,0x488ef728
	.word	0xcbbb6fae,0x6291c585
	.word	0xb7072081,0xddedd791
p0_local2_expect:
	.word	0x9100db11,0xecd17bff
	.word	0xc4ac45a4,0x57e7a0fc
	.word	0xf5a8db11,0xdbda32c2
	.word	0x5687341e,0x7123f7fa
	.word	0x6d134e7a,0x224a45e1
	.word	0x5badbd45,0xfe07ffff
	.word	0x74ad42b6,0xce4c039b
	.word	0xe7b08f13,0x6e9230f0
p0_local2_sec_expect:
	.word	0xa4c30000,0xc4ac45a4
	.word	0xff6cd866,0xf3265385
	.word	0xb9291d4d,0x3f9668d5
	.word	0xd600f5c9,0xe42f8f42
	.word	0xa0c1274c,0x89ee0440
	.word	0x3901d30e,0x460d3245
	.word	0xb56347bb,0xd7527b5c
	.word	0xb83f1bed,0x36761e38
p0_local3_expect:
	.word	0xf60d0000,0x64c4b66d
	.word	0xa4c30000,0x00000040
	.word	0xc62d796c,0xd06c6fae
	.word	0x1143cd57,0x82473e07
	.word	0x15d2f2b5,0xfbbaffb5
	.word	0xfca0e757,0xa445acc4
	.word	0x18e80b9b,0xb547c5ec
	.word	0x69adaf71,0xdc91c4f3
p0_local3_sec_expect:
	.word	0x00000000,0x00005c03
	.word	0xa8d52d73,0x3e478896
	.word	0xcda4e93d,0x00000000
	.word	0xa1849e15,0xe9ec6e35
	.word	0xa41f9c7f,0x333b1e6d
	.word	0x1543f325,0x9f22289e
	.word	0x2394a739,0xe4d90ce9
	.word	0xf0fb41ef,0x3a393cd3
p0_local4_expect:
	.word	0x41ddc7bf,0xdae9efe2
	.word	0xcda4e93d,0x6d71833f
	.word	0xe8a301b2,0x5de11687
	.word	0x95a7613a,0xbcd87dbd
	.word	0x501579a4,0xe6e435b3
	.word	0x7beccb40,0xfff01e7e
	.word	0x00000000,0x00000030
	.word	0xfff01e7e,0x80000000
p0_local4_sec_expect:
	.word	0x53b5c436,0xc3a4b638
	.word	0x0000c3a4,0xf60d0000
	.word	0x91f38bda,0xadfa664a
	.word	0x121c8f8a,0x2f60cfe7
	.word	0x2a080f6b,0x0a642914
	.word	0x271010f4,0x0d742d5d
	.word	0xd0103db0,0xca3cad63
	.word	0xda93634f,0x602ca68c
p0_local5_expect:
	.word	0xffc12939,0x7c5bae23
	.word	0xf3fdffff,0x6ecef794
	.word	0xffbcaf54,0x948b31e4
	.word	0x287cc602,0xffde6c9b
	.word	0xd9d3c397,0x29bfbdf6
	.word	0x9818d5dd,0x5c2e102f
	.word	0xbc81e290,0xababc67c
	.word	0x4a66faad,0xda8bf391
p0_local5_sec_expect:
	.word	0xe8a301b2,0x313ee06b
	.word	0x000000ff,0x36c4b553
	.word	0x874a68fa,0x174dcda7
	.word	0xfca0e757,0xa445acc4
	.word	0x3880263c,0x2c000000
	.word	0x7ca997d6,0x5b62f46f
	.word	0x4a66faad,0xda8bf391
	.word	0x948b31e4,0x39045eaa
p0_local6_expect:
	.word	0xff6d2fba,0x67581484
	.word	0xffa4e93d,0xb1ef74ce
	.word	0xc3a46037,0xb4826182
	.word	0xc7cb53a7,0xfea2f974
	.word	0x000000ff,0xf1db96b7
	.word	0x6eea0330,0xcda4e93d
	.word	0xf05220da,0xf0531021
	.word	0x87264796,0x79e41b4f
p0_local6_sec_expect:
	.word	0x41ddc7bf,0x0000efe2
	.word	0xe2efe9da,0xbfc7dd41
	.word	0x0084cb40,0x023a54c2
	.word	0xcf369ca3,0x3e60d2f7
	.word	0x92aa9841,0xcb2434f5
	.word	0x6baa56d9,0xa91c0679
	.word	0xde14e67f,0xc6a1c207
	.word	0x855a414e,0x104199cd
share0_expect:
	.word	0x00004b0a,0xa015fbb8
	.word	0xd006cee5,0xadae0463
	.word	0xcda55787,0x674c324c
	.word	0xd478341c,0x4cc202b5
	.word	0x416664f2,0x16f8ff6e
	.word	0x1836cdbc,0xbc6de3fe
	.word	0xb7cc2f21,0x171b4bb1
	.word	0x2b88f69c,0xb3efb29a
share1_expect:
	.word	0xdc2ccc70,0xe2246932
	.word	0x23c2c571,0x0a5e9d5a
	.word	0x8bb9c35b,0xe06146a2
	.word	0xd22a98ea,0x0ffee334
	.word	0xc00732c3,0xcefb61e7
	.word	0x97869f49,0x2e0fc7bb
	.word	0x6882246b,0xc8cc8479
	.word	0xac56fcab,0xc4de480d
	.word	0x02ff5107,0xabd016d1
	.word	0x12c30bd5,0x82ffa0d1
	.word	0xbd69f212,0xb5cea487
	.word	0x0ea7636b,0xc668b818
	.word	0xf0e19c9d,0x12fcbbae
	.word	0x67e99d25,0xc4132e70
	.word	0x10beff96,0x59f47a97
	.word	0x7916841d,0x172a965e
share2_expect:
	.word	0xd7dc9ca4,0x40ae98dd
	.word	0xd4a6e21b,0x55458fe9
	.word	0x7c151781,0xf4e9f16a
	.word	0x78b42d8b,0x11ec453b
	.word	0xacc38502,0x369ce2ae
	.word	0xe99495f3,0x8fbaa737
	.word	0x9f967527,0x8a7dd94b
	.word	0xf370e653,0x5db63269
share3_expect:
	.word	0x0df65599,0xce9abcd0
	.word	0x54558194,0x8612c122
	.word	0x57d51189,0x9a639923
	.word	0xa34de6d0,0xff6f9f3c
	.word	0x9a0075c8,0x1643df7a
	.word	0x2e5c8408,0xc8b18964
	.word	0x57e3ca00,0x643a75d4
	.word	0x7872bd59,0x00c4de2a
	.word	0xdf0131e4,0xa4936c27
	.word	0xdf752313,0x32d3792f
	.word	0x1440dd56,0x09ab20b0
	.word	0x5df432b0,0x50ad0af9
	.word	0x7b6beb76,0x62e148f3
	.word	0xb957eb24,0x7dae984d
	.word	0x58f53128,0x61c6afd7
	.word	0xa752be60,0x2dd61fb4
	.word	0x9659cffb,0x2df9d7fd
	.word	0x90bba9a4,0x3f6502aa
	.word	0xf0b3025e,0x5cb60921
	.word	0x095e57e6,0x51f9aae7
	.word	0x7815480d,0x8c57653a
	.word	0x249d7053,0x95456436
	.word	0xa2fc4faa,0x7660215c
	.word	0xd98bc70f,0x0991e2ee
	.word	0x5c03524b,0x6a7030f9
	.word	0x4cb0b838,0x1857424b
	.word	0xde610c5e,0x80454ea6
	.word	0xb61a7ba7,0x6067e2e1
	.word	0x4e73df88,0x6f273086
	.word	0x53d70024,0x20373576
	.word	0xa6eb70cb,0x3d551978
	.word	0xd14eb8e3,0x8ad8b1e5
	.word	0xffff1072,0x3bb2d5bf
	.word	0x19ceb223,0x7114e602
	.word	0x5cc9be76,0x8cfa7fc6
	.word	0x836f8095,0x8b080af2
	.word	0x30c10c64,0x66169c59
	.word	0x72117e35,0x53c54cf6
	.word	0x31bce9a3,0x18cf6a5b
	.word	0x714ff6d4,0xab7cec15
	.word	0xc157fbbf,0x546675f2
	.word	0xedaf83de,0xb89e5e24
	.word	0x114393bc,0x4e0fda12
	.word	0xb2326352,0xd1ff780f
	.word	0x7b0e70fd,0x40e19ede
	.word	0xb3c5e459,0x17ced733
	.word	0x126e0682,0x0542c8c2
	.word	0xc0ad70ee,0xec9355be
	.word	0xabe3e24c,0x7b013a10
	.word	0x05bf5584,0x459d6ba0
	.word	0x69e1801f,0x24573811
	.word	0x21680597,0x854bc288
	.word	0x65fe244a,0xbf9b2ba6
	.word	0xab4aedfb,0x8bf533bf
	.word	0x0d2cedc7,0x5dd88594
	.word	0xe9ce4879,0xd579ffa4
	.word	0x50411262,0x336503f1
	.word	0xdc3c0269,0xff533ba6
	.word	0xd57b3603,0x88a8a759
	.word	0x66e231f9,0x7167d08e
	.word	0xbefd4dc8,0xc02664c6
	.word	0xc6bf514e,0xa12b3140
	.word	0xc5821a66,0x7088baac
	.word	0x7d18c007,0xa17a7ba6
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
	.word	0xb8083550,0x25f60317
	.word	0x00000000,0x00000002
	.word	0x8c6709b0,0x6b37e4ee
	.word	0x00000000,0x00000003
	.word	0xf94ffd98,0x66eb4511
	.word	0x00000000,0x00000004
	.word	0x741698b7,0xb5ca9c60
	.word	0x00000000,0x00000005
	.word	0x20d4853f,0xe8f8bccf
	.word	0x00000000,0x00000006
	.word	0xb91d7390,0x76076d2c
	.word	0x00000000,0x00000007
	.word	0x70e0984f,0x8c7c2731
	.word	0x00000000,0x00000008
	.word	0x94f1ef78,0x4c7af75b
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
	.word	0x6be03e31,0xb201a3e8,0x53b5c436,0xc3a4b638
	.word	0xa7cd4d17,0xfa684a87,0x06775604,0xbef1adf8
	.word	0x74962c3f,0x6dc1d70e,0x6ff4625b,0x51ea2511
	.word	0xa818ebf9,0xc99c9026,0xaa5e0439,0xe4318b94
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
	.word	0xc7b4747b,0xba2f6db1,0x7aa73fe5,0xe0065d43
	.word	0xdf6e1d6d,0x6adbc17a,0xf4844f09,0x11f573f2
	.word	0x11f23500,0x322a00b4,0x911128e7,0xb0cfe4ad
	.word	0xab9e454c,0x6c0da500,0x1363c7aa,0xf6d64b31
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
	.word	0x0fee75b0,0xd89ca2d7,0x60f987eb,0x4043b732
	.word	0x66d84666,0xaf44656a,0x4561a35f,0x742b4bb8
	.word	0x0698693d,0xf992187b,0x187f9311,0x41a28ea5
	.word	0xa062311c,0xdf9d1ae4,0x0cdaef19,0x4391f86d
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
	.word	0x273f3297,0xd1055c20,0x0fa7181f,0x96223f5a
	.word	0x7a5cf5ff,0x469c20d5,0x19fcaf81,0x13b2ab7e
	.word	0x2029d659,0x659a6283,0x93cedfa2,0x488ef728
	.word	0xcbbb6fae,0x6291c585,0xb7072081,0xddedd791
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
	.word	0xf8763337,0x8f15831a,0xc4ac45a4,0x57e7a0fc
	.word	0xcea3e05a,0xdbda32c2,0x5687341e,0x7123f7fa
	.word	0x6d134e7a,0x224a45e1,0x5badbd45,0xfe071c7b
	.word	0x74ad42b6,0xce4c039b,0xe7b08f13,0x6e9230f0
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
	.word	0x7472be9e,0x64dc1d80,0xa6c33140,0xf3265385
	.word	0xb9291d4d,0x3f9668d5,0xd600f5c9,0xe42f8f42
	.word	0xa0c1274c,0x89ee0440,0x3901d30e,0x460d3245
	.word	0xb56347bb,0xd7527b5c,0xb83f1bed,0x36761e38
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
	.word	0x1b3caa18,0x64c4b66d,0xd48b8cb5,0x034abff2
	.word	0xcb3db25a,0xd06c6fae,0x1143cd57,0x82473e07
	.word	0x15d2f2b5,0xfbba9eb5,0x2f32c682,0xef5b1127
	.word	0x18e80b9b,0xb547c5ec,0x69adaf71,0xdc91c4f3
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
	.word	0x2c50f45d,0x4cb22a61,0xa8d52d73,0x3e478896
	.word	0x6bf71a3a,0x9fd82cb1,0xa1849e15,0xe9ec6e35
	.word	0xa41f9c7f,0x333b1e6d,0x1543f325,0x9f22289e
	.word	0x2394a739,0xe4d90ce9,0xf0fb41ef,0x3a393cd3
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
	.word	0x51933e5d,0xb3713ddf,0xa55de7e7,0xfb45d69e
	.word	0x58088cba,0x3bc2bfb3,0x1a367d27,0x8b36b2da
	.word	0x4b81bfd2,0xb34bc2c7,0x64a1e37c,0x6523b9f9
	.word	0xc95552b0,0x0ba5415f,0xf0679aff,0x1428d8ab
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
	.word	0x6c792dc6,0xf771468d,0x3dd8ed00,0xe50ddcaf
	.word	0x91f38bda,0xadfa664a,0x121c8f8a,0x2f60cfe7
	.word	0x2a080f6b,0x0a642914,0x271010f4,0x0d742d5d
	.word	0xd0103db0,0xca3cad63,0xda93634f,0x602ca68c
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
	.word	0x4bc12939,0x7c5bae23,0x17775c25,0x6ecef794
	.word	0x00bcaf54,0xb53976a1,0x287cc602,0xffde6c9b
	.word	0xd9d3c397,0x29bfbdf6,0x9818d5dd,0x5c2e102f
	.word	0xbc81e290,0xababc67c,0x547c66c1,0x7ca997d6
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
	.word	0x117ecd83,0x3c81dc74,0x8352168c,0x51714308
	.word	0x04c88107,0x3c0a249f,0x05602d13,0xfa9b1a38
	.word	0xcc768f69,0x5633ef36,0x3a9bf661,0xdc1ab873
	.word	0x70618818,0x981bb1b2,0xa4924fb9,0xc22aa6d3
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
	.word	0x5df34081,0x67581484,0x741fe5f1,0xb1ef74ce
	.word	0x54736037,0xb4826182,0xc7cb53a7,0xfea2f974
	.word	0x7ed46528,0xf1db96b7,0x6eea0330,0x378862dc
	.word	0xf05220da,0xf0531021,0x87264796,0x79e41b4f
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
	.word	0x3880263c,0xa89ad905,0x332552a1,0xfc8960e6
	.word	0x7a40cb40,0x023a54c2,0xcf369ca3,0x3e60d2f7
	.word	0x92aa9841,0xcb2434f5,0x02aa56d9,0xa9b30679
	.word	0xde14e67f,0xc6a1c207,0x855a414e,0x104199cd
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
	.word	0xfd404b0a,0xa015fbb8,0xd006cee5,0xadae0463
	.word	0xcda55787,0x674c324c,0xd478341c,0x4cc202b5
	.word	0x416664f2,0x16f8ff6e,0x1836cdbc,0xbc6de3fe
	.word	0xb7cc2f21,0x171b4bb1,0x2b88f69c,0xb3efb29a
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
	.word	0xdc11cc70,0xe2246932,0x23c2c571,0x0a5e9d5a
	.word	0x8bb9c35b,0xe06146a2,0xd22a98ea,0x0ffee334
	.word	0xc00732c3,0xcefb61e7,0x97869f49,0x2e0fc7bb
	.word	0x6882246b,0xc8cc8479,0xac56fcab,0xc4de480d
	.word	0x02935107,0xabd016d1,0x12c30bd5,0x82ffa0d1
	.word	0xbd69f212,0xb5cea487,0x0ea7636b,0xc668b818
	.word	0xf0e19c9d,0x12fcbbae,0x67e99d25,0xc4132e70
	.word	0x10beff96,0x59f47a97,0x7916841d,0x172a965e
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
	.word	0xd7dc9ca4,0x40ae98dd,0xd4a6e21b,0x55458fe9
	.word	0x7c151781,0xf4e9f16a,0x78b42d8b,0x11ec453b
	.word	0xacc38502,0x369ce2ae,0xe99495f3,0x8fbaa737
	.word	0x9f967527,0x8a7dd94b,0xf370e653,0x5db63269
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
	.word	0x0df65599,0xce9abcd0,0x54558194,0x8612c122
	.word	0x57d51189,0x9a639923,0xa34de6d0,0xff6f9f3c
	.word	0x9a0075c8,0x1643df7a,0x2e5c8408,0xc8b18964
	.word	0x57e3ca00,0x643a75d4,0x7872bd59,0x00c4de2a
	.word	0xdf0131e4,0xa4936c27,0xdf752313,0x32d3792f
	.word	0x1440dd56,0x09ab20b0,0x5df432b0,0x50ad0af9
	.word	0x7b6beb76,0x62e148f3,0xb957eb24,0x7dae984d
	.word	0x58f53128,0x61c6afd7,0xa752be60,0x2dd61fb4
	.word	0x9659cffb,0x2df9d7fd,0x90bba9a4,0x3f6502aa
	.word	0xf0b3025e,0x5cb60921,0x095e57e6,0x51f9aae7
	.word	0x7815480d,0x8c57653a,0x249d7053,0x95456436
	.word	0xa2fc4faa,0x7660215c,0xd98bc70f,0x0991e2ee
	.word	0x5c03524b,0x6a7030f9,0x4cb0b838,0x1857424b
	.word	0xde610c5e,0x80454ea6,0xb61a7ba7,0x6067e2e1
	.word	0x4e73df88,0x6f273086,0x53d70024,0x20373576
	.word	0xa6eb70cb,0x3d551978,0xd14eb8e3,0x8ad8b1e5
	.word	0x5bcc1072,0x3bb2d5bf,0x19ceb223,0x7114e602
	.word	0x5cc9be76,0x8cfa7fc6,0x836f8095,0x8b080af2
	.word	0x30c10c64,0x66169c59,0x72117e35,0x53c54cf6
	.word	0x31bce9a3,0x18cf6a5b,0x714ff6d4,0xab7cec15
	.word	0xc157fbbf,0x546675f2,0xedaf83de,0xb89e5e24
	.word	0x114393bc,0x4e0fda12,0xb2326352,0xd1ff780f
	.word	0x7b0e70fd,0x40e19ede,0xb3c5e459,0x17ced733
	.word	0x126e0682,0x0542c8c2,0xc0ad70ee,0xec9355be
	.word	0xabe3e24c,0x7b013a10,0x05bf5584,0x459d6ba0
	.word	0x69e1801f,0x24573811,0x21680597,0x854bc288
	.word	0x65fe244a,0xbf9b2ba6,0xab4aedfb,0x8bf533bf
	.word	0x0d2cedc7,0x5dd88594,0xe9ce4879,0xd579ffa4
	.word	0x50411262,0x336503f1,0xdc3c0269,0xff533ba6
	.word	0xd57b3603,0x88a8a759,0x66e231f9,0x7167d08e
	.word	0xbefd4dc8,0xc02664c6,0xc6bf514e,0xa12b3140
	.word	0xc5821a66,0x7088baac,0x7d18c007,0xa17a7ba6
share3_end:
