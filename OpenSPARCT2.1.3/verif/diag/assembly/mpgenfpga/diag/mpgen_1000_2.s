/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: mpgen_1000_2.s
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
!	1 Thread, 1000 lines
!	mpgen   created on Dec 20, 2005 (16:35:03)
!	mpgen_1000_2.s created on Mar 27, 2009 (14:18:52)
!	RC file : random.rc
!	cmd = /import/n2-tools/release/tools/mpgen/mpgen,1.051220 -rc random.rc -o mpgen_1000_2 -p 1 -l 1000

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

p0_label_21:
!	Mem[0000000030141408] = 53b5c436 ff000000, %l2 = 00000000, %l3 = 00005c03
	ldda	[%i5+%o4]0x89,%l2	! %l2 = 00000000ff000000 0000000053b5c436
!	Mem[0000000030041410] = fff55cff, %l2 = 00000000ff000000
	ldsba	[%i1+%o5]0x89,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000010041400] = ec7b75b0, %f1  = dae9efe2
	lda	[%i1+%g0]0x80,%f1 	! %f1 = ec7b75b0
!	Mem[0000000010041400] = ec7b75b0, %l5 = fffffffffffff7ff
	ldsha	[%i1+%g0]0x80,%l5	! %l5 = ffffffffffffec7b
!	Mem[0000000010141400] = 3929c1ff, %l2 = ffffffffffffffff
	ldswa	[%i5+%g0]0x88,%l2	! %l2 = 000000003929c1ff
!	Mem[0000000030081410] = b9291d4d, %l2 = 000000003929c1ff
	lduha	[%i2+%o5]0x81,%l2	! %l2 = 000000000000b929
!	Mem[0000000010181408] = ffa4e93db1ef74ce, %l6 = 0000000000000000
	ldxa	[%i6+0x008]%asi,%l6	! %l6 = ffa4e93db1ef74ce
!	Mem[0000000021800180] = abe3e24c, %l1 = 000000000000ffff
	lduh	[%o3+0x180],%l1		! %l1 = 000000000000abe3
!	Mem[0000000030181400] = bfc7dd41, %l7 = 000000000000c3a4
	lduba	[%i6+%g0]0x89,%l7	! %l7 = 0000000000000041
!	Starting 10 instruction Store Burst
!	%l0 = 00000000da8bf391, Mem[0000000030101410] = da8bf391
	stba	%l0,[%i4+%o5]0x89	! Mem[0000000030101410] = da8bf391

p0_label_22:
!	Mem[0000000010101400] = bfc7dd41, %l3 = 0000000053b5c436
	ldstuba	[%i4+%g0]0x88,%l3	! %l3 = 00000041000000ff
!	Mem[0000000010041400] = b0757bec, %l5 = ffffffffffffec7b
	swapa	[%i1+%g0]0x88,%l5	! %l5 = 00000000b0757bec
!	Mem[0000000030101400] = 53b5c436, %l5 = 00000000b0757bec
	ldstuba	[%i4+%g0]0x81,%l5	! %l5 = 00000053000000ff
!	%l0 = da8bf391, %l1 = 0000abe3, Mem[0000000030141408] = ff000000 53b5c436
	stda	%l0,[%i5+%o4]0x89	! Mem[0000000030141408] = da8bf391 0000abe3
!	%f0  = 41ddc7bf, %f9  = e6e435b3
	fsqrts	%f0 ,%f9 		! %f9  = 40a87cad
!	Mem[0000000030041408] = ffffffff, %l7 = 0000000000000041
	swapa	[%i1+%o4]0x89,%l7	! %l7 = 00000000ffffffff
!	%l7 = 00000000ffffffff, Mem[0000000010181410] = 826182b43760a4c3
	stxa	%l7,[%i6+%o5]0x88	! Mem[0000000010181410] = 00000000ffffffff
!	%f30 = 948b31e4, Mem[000000001018143c] = 79e41b4f
	sta	%f30,[%i6+0x03c]%asi	! Mem[000000001018143c] = 948b31e4
!	Mem[0000000010141408] = fffffdf3, %l2 = 000000000000b929
	ldstuba	[%i5+%o4]0x88,%l2	! %l2 = 000000f3000000ff
!	Starting 10 instruction Load Burst
!	%l2 = 00000000000000f3, %l7 = 00000000ffffffff, %l5 = 0000000000000053
	udivx	%l2,%l7,%l5		! %l5 = 0000000000000000

p0_label_23:
!	Mem[00000000100c1400] = f60d0000, %f15 = 80000000
	lda	[%i3+%g0]0x80,%f15	! %f15 = f60d0000
!	Mem[0000000030001400] = 840000ff, %f10 = 4a66faad
	lda	[%i0+%g0]0x89,%f10	! %f10 = 840000ff
!	Mem[0000000010101410] = e8a301b25de11687, %f14 = 91f38bda f60d0000
	ldda	[%i4+%o5]0x80,%f14	! %f14 = e8a301b2 5de11687
!	%f14 = e8a301b2, %f26 = 38b6a4c3
	fcmpes	%fcc1,%f14,%f26		! %fcc1 = 1
!	Mem[0000000010101420] = 501579a4, %l4 = 00000000000000cd
	ldub	[%i4+0x020],%l4		! %l4 = 0000000000000050
!	Mem[00000000100c1410] = 6c792dc6, %l6 = ffa4e93db1ef74ce
	ldsha	[%i3+%o5]0x88,%l6	! %l6 = 0000000000002dc6
!	%l4 = 0000000000000050, %l1 = 000000000000abe3, %l5 = 0000000000000000
	add	%l4,%l1,%l5		! %l5 = 000000000000ac33
!	Mem[0000000030001408] = 0000c7b4, %l3 = 0000000000000041
	ldswa	[%i0+%o4]0x81,%l3	! %l3 = 000000000000c7b4
!	Mem[0000000030181410] = 0084cb40, %l0 = 00000000da8bf391
	ldsha	[%i6+%o5]0x81,%l0	! %l0 = 0000000000000084
!	Starting 10 instruction Store Burst
!	%l0 = 0000000000000084, Mem[0000000010141400] = 3929c1ff
	stba	%l0,[%i5+%g0]0x88	! Mem[0000000010141400] = 3929c184

p0_label_24:
!	%f26 = 38b6a4c3 36c4b553, Mem[0000000010101400] = ffddc7bf dae9efe2
	stda	%f26,[%i4+%g0]0x80	! Mem[0000000010101400] = 38b6a4c3 36c4b553
!	Mem[0000000030041408] = 00000041, %l5 = 000000000000ac33
	swapa	[%i1+%o4]0x89,%l5	! %l5 = 0000000000000041
!	%l1 = 000000000000abe3, Mem[0000000010181410] = ffffffff, %asi = 80
	stwa	%l1,[%i6+0x010]%asi	! Mem[0000000010181410] = 0000abe3
!	%l6 = 0000000000002dc6, imm = 0000000000000d97, %l4 = 0000000000000050
	xnor	%l6,0xd97,%l4		! %l4 = ffffffffffffdfae
!	%f29 = da8bf391, Mem[0000000010001410] = 174dcda7
	sta	%f29,[%i0+%o5]0x88	! Mem[0000000010001410] = da8bf391
!	Mem[0000000030081410] = 4d1d29b9, %l1 = 000000000000abe3
	swapa	[%i2+%o5]0x89,%l1	! %l1 = 000000004d1d29b9
!	%l7 = 00000000ffffffff, Mem[0000000030181408] = e2efe9da
	stba	%l7,[%i6+%o4]0x81	! Mem[0000000030181408] = ffefe9da
!	%l6 = 00002dc6, %l7 = ffffffff, Mem[0000000030101400] = ffb5c436 c3a4b638
	stda	%l6,[%i4+%g0]0x81	! Mem[0000000030101400] = 00002dc6 ffffffff
!	Mem[0000000030081410] = e3ab0000, %l1 = 000000004d1d29b9
	ldstuba	[%i2+%o5]0x81,%l1	! %l1 = 000000e3000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030001400] = 840000ff, %l0 = 0000000000000084
	lduha	[%i0+%g0]0x89,%l0	! %l0 = 00000000000000ff

p0_label_25:
!	Mem[0000000010101408] = 3de9a4cd, %l4 = ffffffffffffdfae
	lduha	[%i4+%o4]0x88,%l4	! %l4 = 000000000000a4cd
!	Mem[000000001000140c] = c3a4b638, %l1 = 00000000000000e3
	ldsha	[%i0+0x00c]%asi,%l1	! %l1 = ffffffffffffc3a4
!	Mem[0000000010081410] = f5a8db11, %l5 = 0000000000000041
	lduwa	[%i2+%o5]0x80,%l5	! %l5 = 00000000f5a8db11
!	Mem[0000000010001420] = 0000002c, %l2 = 00000000000000f3
	lduba	[%i0+0x021]%asi,%l2	! %l2 = 0000000000000000
!	Mem[0000000010101400] = 53b5c436 c3a4b638, %l4 = 0000a4cd, %l5 = f5a8db11
	ldda	[%i4+%g0]0x88,%l4	! %l4 = 00000000c3a4b638 0000000053b5c436
!	Mem[0000000030181400] = e2ef0000bfc7dd41, %f30 = 948b31e4 39045eaa
	ldda	[%i6+%g0]0x89,%f30	! %f30 = e2ef0000 bfc7dd41
!	Mem[0000000010181410] = 0000abe3, %l2 = 0000000000000000
	ldsha	[%i6+%o5]0x80,%l2	! %l2 = 0000000000000000
!	Mem[00000000100c1400] = 00000df6, %l6 = 0000000000002dc6
	ldstuba	[%i3+%g0]0x88,%l6	! %l6 = 000000f6000000ff
!	Mem[0000000010041408] = 3f83716d, %l0 = 00000000000000ff
	ldsha	[%i1+%o4]0x80,%l0	! %l0 = 0000000000003f83
!	Starting 10 instruction Store Burst
!	%f7  = bcd87dbd, Mem[00000000300c1408] = 732dd5a8
	sta	%f7 ,[%i3+%o4]0x89	! Mem[00000000300c1408] = bcd87dbd

p0_label_26:
!	Mem[0000000030001400] = ff000084, %l4 = 00000000c3a4b638
	ldstuba	[%i0+%g0]0x81,%l4	! %l4 = 000000ff000000ff
!	Mem[0000000010141410] = ffbcaf54, %l1 = ffffffffffffc3a4
	swapa	[%i5+%o5]0x80,%l1	! %l1 = 00000000ffbcaf54
!	Mem[00000000100c1420] = 15d2f2b5, %l0 = 0000000000003f83
	swap	[%i3+0x020],%l0		! %l0 = 0000000015d2f2b5
!	%l5 = 0000000053b5c436, Mem[0000000010141408] = fffdffff
	stwa	%l5,[%i5+%o4]0x80	! Mem[0000000010141408] = 53b5c436
!	%f12 = 6bc6f1ba, Mem[00000000300c1408] = bd7dd8bc
	sta	%f12,[%i3+%o4]0x81	! Mem[00000000300c1408] = 6bc6f1ba
!	Mem[00000000100c141b] = 1143cd57, %l2 = 0000000000000000
	ldstuba	[%i3+0x01b]%asi,%l2	! %l2 = 00000057000000ff
!	%l7 = 00000000ffffffff, Mem[0000000010001400] = ff000000b201a3e8
	stxa	%l7,[%i0+%g0]0x80	! Mem[0000000010001400] = 00000000ffffffff
!	Mem[0000000010181400] = ba2f6dff, %l5 = 0000000053b5c436
	ldstuba	[%i6+%g0]0x88,%l5	! %l5 = 000000ff000000ff
!	%l6 = 00000000000000f6, Mem[0000000010001408] = 53b5c436
	stwa	%l6,[%i0+%o4]0x80	! Mem[0000000010001408] = 000000f6
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1438] = 69adaf71, %f11 = da8bf391
	ld	[%i3+0x038],%f11	! %f11 = 69adaf71

p0_label_27:
!	Mem[000000001000143c] = e4318b94, %l6 = 00000000000000f6
	lduw	[%i0+0x03c],%l6		! %l6 = 00000000e4318b94
!	Mem[0000000030001400] = 840000ff, %l3 = 000000000000c7b4
	lduwa	[%i0+%g0]0x89,%l3	! %l3 = 00000000840000ff
!	Mem[0000000010181408] = ffa4e93d, %l3 = 00000000840000ff
	lduwa	[%i6+0x008]%asi,%l3	! %l3 = 00000000ffa4e93d
!	Mem[0000000010141400] = 84c12939, %l1 = 00000000ffbcaf54
	ldsba	[%i5+%g0]0x80,%l1	! %l1 = ffffffffffffff84
!	%l6 = 00000000e4318b94, %l0 = 0000000015d2f2b5, %l7 = 00000000ffffffff
	orn	%l6,%l0,%l7		! %l7 = ffffffffee3d8fde
!	Mem[0000000010181428] = 6eea0330, %l0 = 0000000015d2f2b5
	ldsb	[%i6+0x02b],%l0		! %l0 = 0000000000000030
!	Mem[00000000100c1410] = c62d796c, %l3 = 00000000ffa4e93d
	lduba	[%i3+%o5]0x80,%l3	! %l3 = 00000000000000c6
!	Mem[0000000010101410] = e8a301b2, %l5 = 00000000000000ff
	ldsba	[%i4+%o5]0x80,%l5	! %l5 = ffffffffffffffe8
!	Mem[0000000030041408] = 33ac000096223f5a, %l6 = 00000000e4318b94
	ldxa	[%i1+%o4]0x81,%l6	! %l6 = 33ac000096223f5a
!	Starting 10 instruction Store Burst
!	%l0 = 00000030, %l1 = ffffff84, Mem[0000000010041410] = a8f5ffff 6a6544af
	stda	%l0,[%i1+%o5]0x88	! Mem[0000000010041410] = 00000030 ffffff84

p0_label_28:
!	Mem[0000000010041400] = ffffec7b, %l3 = 00000000000000c6
	ldstuba	[%i1+%g0]0x88,%l3	! %l3 = 0000007b000000ff
!	%l2 = 00000057, %l3 = 0000007b, Mem[00000000100c1408] = a4c30000 00000040
	stda	%l2,[%i3+%o4]0x80	! Mem[00000000100c1408] = 00000057 0000007b
!	%f10 = 840000ff 69adaf71, Mem[00000000100c1400] = 00000dff 6db6c464
	stda	%f10,[%i3+%g0]0x88	! Mem[00000000100c1400] = 840000ff 69adaf71
!	Mem[0000000030101408] = 0000c3a4, %l3 = 000000000000007b
	ldstuba	[%i4+%o4]0x81,%l3	! %l3 = 00000000000000ff
!	%f4  = ffbcaf54 b53976a1, Mem[0000000010041408] = 3f83716d 0000bcff
	stda	%f4 ,[%i1+%o4]0x80	! Mem[0000000010041408] = ffbcaf54 b53976a1
!	%l0 = 0000000000000030, %l1 = ffffffffffffff84, %y  = ffffff3e
	sdiv	%l0,%l1,%l6		! %l6 = 000000007fffffff
	mov	%l0,%y			! %y = 00000030
!	%f2  = cda4e93d 6d71833f, %l0 = 0000000000000030
!	Mem[0000000030181430] = de14e67fc6a1c207
	add	%i6,0x030,%g1
	stda	%f2,[%g1+%l0]ASI_PST32_S ! Mem[0000000030181430] = de14e67fc6a1c207
!	%l0 = 00000030, %l1 = ffffff84, Mem[0000000010041430] = 3880263c 2c000000
	stda	%l0,[%i1+0x030]%asi	! Mem[0000000010041430] = 00000030 ffffff84
!	Mem[0000000010181406] = 67581484, %l5 = ffffffffffffffe8
	ldstuba	[%i6+0x006]%asi,%l5	! %l5 = 00000014000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = baf1c66b, %l1 = ffffffffffffff84
	lduba	[%i3+%o4]0x89,%l1	! %l1 = 000000000000006b

p0_label_29:
!	Mem[0000000030041410] = ff5cf5ff, %l2 = 0000000000000057
	ldsba	[%i1+%o5]0x81,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000010001408] = 000000f6c3a4b638, %l4 = 00000000000000ff
	ldxa	[%i0+0x008]%asi,%l4	! %l4 = 000000f6c3a4b638
!	Mem[00000000300c1410] = cda4e93d, %l0 = 0000000000000030
	ldsha	[%i3+%o5]0x81,%l0	! %l0 = ffffffffffffcda4
!	Mem[0000000030081400] = a4c30000, %l5 = 0000000000000014
	ldsha	[%i2+%g0]0x81,%l5	! %l5 = ffffffffffffa4c3
!	%f0  = 41ddc7bf, %f25 = 2c000000
	fcmpes	%fcc0,%f0 ,%f25		! %fcc0 = 2
!	Mem[00000000201c0000] = 00004b0a, %l0 = ffffffffffffcda4
	lduba	[%o0+0x000]%asi,%l0	! %l0 = 0000000000000000
!	Mem[0000000030001400] = ff000084, %l6 = 000000007fffffff
	ldsba	[%i0+%g0]0x81,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010141410] = ffffc3a4, %l5 = ffffffffffffa4c3
	lduwa	[%i5+%o5]0x80,%l5	! %l5 = 00000000ffffc3a4
!	Mem[0000000030081408] = 66d86cff, %f0  = 41ddc7bf
	lda	[%i2+%o4]0x89,%f0 	! %f0 = 66d86cff
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1400] = 00000000, %l1 = 000000000000006b
	ldstuba	[%i3+%g0]0x81,%l1	! %l1 = 00000000000000ff

p0_label_30:
!	%l5 = 00000000ffffc3a4, Mem[0000000030001410] = df6e1d6d
	stha	%l5,[%i0+%o5]0x81	! Mem[0000000030001410] = c3a41d6d
!	%l0 = 00000000, %l1 = 00000000, Mem[0000000010181400] = ff6d2fba 6758ff84
	stda	%l0,[%i6+%g0]0x80	! Mem[0000000010181400] = 00000000 00000000
!	%l7 = ffffffffee3d8fde, immed = 00000b99, %y  = 00000030
	smul	%l7,0xb99,%l7		! %l7 = ffffff3207f985ae, %y = ffffff32
!	Mem[0000000010081400] = 9100db11, %l1 = 0000000000000000
	swapa	[%i2+%g0]0x80,%l1	! %l1 = 000000009100db11
!	Mem[00000000201c0000] = 00004b0a, %l0 = 0000000000000000
	ldstub	[%o0+%g0],%l0		! %l0 = 00000000000000ff
!	Mem[00000000300c1400] = 000000ff, %l1 = 000000009100db11
	swapa	[%i3+%g0]0x89,%l1	! %l1 = 00000000000000ff
!	%f7  = bcd87dbd, Mem[00000000100c1410] = 6c792dc6
	sta	%f7 ,[%i3+%o5]0x88	! Mem[00000000100c1410] = bcd87dbd
!	%l7 = ffffff3207f985ae, Mem[0000000010141408] = 94f7ce6e36c4b553
	stxa	%l7,[%i5+%o4]0x88	! Mem[0000000010141408] = ffffff3207f985ae
!	Mem[00000000300c1408] = 6bc6f1ba, %l2 = ffffffffffffffff
	ldstuba	[%i3+%o4]0x81,%l2	! %l2 = 0000006b000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = 000000f6, %l1 = 00000000000000ff
	ldsba	[%i0+0x008]%asi,%l1	! %l1 = 0000000000000000

p0_label_31:
!	Mem[0000000010041408] = ffbcaf54, %l5 = 00000000ffffc3a4
	lduba	[%i1+%o4]0x80,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010181410] = e3ab0000, %l3 = 0000000000000000
	lduha	[%i6+%o5]0x88,%l3	! %l3 = 0000000000000000
!	Mem[00000000300c1410] = cda4e93d00000000, %l2 = 000000000000006b
	ldxa	[%i3+%o5]0x81,%l2	! %l2 = cda4e93d00000000
!	Mem[0000000010001410] = 91f38bdafa684a87, %f16 = e8a301b2 313ee06b
	ldd	[%i0+%o5],%f16		! %f16 = 91f38bda fa684a87
!	Mem[0000000010101410] = e8a301b2, %l0 = 0000000000000000
	lduha	[%i4+%o5]0x80,%l0	! %l0 = 000000000000e8a3
!	Mem[0000000030141400] = e8a301b2, %f14 = e8a301b2
	lda	[%i5+%g0]0x81,%f14	! %f14 = e8a301b2
!	Mem[0000000030041408] = 33ac000096223f5a, %f4  = ffbcaf54 b53976a1
	ldda	[%i1+%o4]0x81,%f4 	! %f4  = 33ac0000 96223f5a
!	Mem[0000000010041424] = f992187b, %f12 = 6bc6f1ba
	ld	[%i1+0x024],%f12	! %f12 = f992187b
!	Mem[0000000010181410] = 0000abe3, %l0 = 000000000000e8a3
	ldsha	[%i6+%o5]0x80,%l0	! %l0 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l4 = c3a4b638, %l5 = 000000ff, Mem[0000000010101410] = e8a301b2 5de11687
	stda	%l4,[%i4+%o5]0x80	! Mem[0000000010101410] = c3a4b638 000000ff

p0_label_32:
!	%l4 = 000000f6c3a4b638, Mem[0000000030141400] = e8a301b2
	stba	%l4,[%i5+%g0]0x81	! Mem[0000000030141400] = 38a301b2
!	%l0 = 0000000000000000, Mem[0000000010001410] = 91f38bda
	stba	%l0,[%i0+%o5]0x80	! Mem[0000000010001410] = 00f38bda
!	%l0 = 0000000000000000, %l5 = 00000000000000ff, %l3 = 0000000000000000
	andn	%l0,%l5,%l3		! %l3 = 0000000000000000
!	Mem[0000000010081425] = 224a45e1, %l4 = 000000f6c3a4b638
	ldstuba	[%i2+0x025]%asi,%l4	! %l4 = 0000004a000000ff
!	%l6 = ffffffffffffffff, Mem[0000000010041410] = 3000000084ffffff
	stxa	%l6,[%i1+%o5]0x80	! Mem[0000000010041410] = ffffffffffffffff
!	%f24 = 3880263c 2c000000, Mem[0000000010181408] = ffa4e93d b1ef74ce
	stda	%f24,[%i6+%o4]0x80	! Mem[0000000010181408] = 3880263c 2c000000
!	Mem[0000000010001418] = dbbf5604, %l2 = cda4e93d00000000
	ldstuba	[%i0+0x018]%asi,%l2	! %l2 = 000000db000000ff
!	%f12 = f992187b, %f26 = 38b6a4c3
	fsqrts	%f12,%f26		! %f26 = 7fffffff
!	Mem[0000000010141415] = 948b31e4, %l0 = 0000000000000000
	ldstuba	[%i5+0x015]%asi,%l0	! %l0 = 0000008b000000ff
!	Starting 10 instruction Load Burst
!	Mem[000000001004142c] = 41a28ea5, %l7 = ffffff3207f985ae
	lduh	[%i1+0x02c],%l7		! %l7 = 00000000000041a2

p0_label_33:
!	Mem[00000000211c0000] = d7dc9ca4, %l4 = 000000000000004a
	lduba	[%o2+0x000]%asi,%l4	! %l4 = 00000000000000d7
!	Mem[0000000010101400] = c3a4b638, %l2 = 00000000000000db
	ldswa	[%i4+%g0]0x88,%l2	! %l2 = ffffffffc3a4b638
!	Mem[0000000020800040] = 02ff5107, %l2 = ffffffffc3a4b638
	ldub	[%o1+0x041],%l2		! %l2 = 00000000000000ff
!	Mem[0000000010101400] = 53b5c436c3a4b638, %l2 = 00000000000000ff
	ldxa	[%i4+%g0]0x88,%l2	! %l2 = 53b5c436c3a4b638
!	%f12 = f992187b, %f30 = e2ef0000, %f23 = fffcaf54
	fmuls	%f12,%f30,%f23		! %f23 = 7f800000
!	Mem[0000000010181408] = 3880263c, %l7 = 00000000000041a2
	ldsha	[%i6+%o4]0x80,%l7	! %l7 = 0000000000003880
!	Mem[0000000010181410] = 0000abe300000000, %f2  = cda4e93d 6d71833f
	ldd	[%i6+%o5],%f2 		! %f2  = 0000abe3 00000000
!	Code Fragment 4
p0_fragment_2:
!	%l0 = 000000000000008b
	setx	0x148f9dd006c2fa52,%g7,%l0 ! %l0 = 148f9dd006c2fa52
!	%l1 = 0000000000000000
	setx	0xbabbfd37af2f0c99,%g7,%l1 ! %l1 = babbfd37af2f0c99
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 148f9dd006c2fa52
	setx	0xbc920e987e0ad113,%g7,%l0 ! %l0 = bc920e987e0ad113
!	%l1 = babbfd37af2f0c99
	setx	0xea4368d7de440a15,%g7,%l1 ! %l1 = ea4368d7de440a15
!	%l7 = 0000000000003880, imm = 0000000000000826, %l1 = ea4368d7de440a15
	xnor	%l7,0x826,%l1		! %l1 = ffffffffffffcf59
!	Starting 10 instruction Store Burst
!	%f29 = da8bf391, Mem[0000000030081410] = ffab0000
	sta	%f29,[%i2+%o5]0x81	! Mem[0000000030081410] = da8bf391

p0_label_34:
!	%l0 = 7e0ad113, %l1 = ffffcf59, Mem[0000000010001410] = 00f38bda fa684a87
	stda	%l0,[%i0+0x010]%asi	! Mem[0000000010001410] = 7e0ad113 ffffcf59
!	%l1 = ffffffffffffcf59, Mem[0000000010081410] = f5a8db11
	stba	%l1,[%i2+%o5]0x80	! Mem[0000000010081410] = 59a8db11
!	Mem[0000000010081408] = a445acc4, %l1 = ffffffffffffcf59
	swapa	[%i2+%o4]0x88,%l1	! %l1 = 00000000a445acc4
!	Mem[0000000010101408] = cda4e93d, %l4 = 00000000000000d7
	swapa	[%i4+%o4]0x80,%l4	! %l4 = 00000000cda4e93d
!	%l3 = 0000000000000000, Mem[0000000010141400] = 3929c184
	stha	%l3,[%i5+%g0]0x88	! Mem[0000000010141400] = 39290000
!	Mem[0000000030101408] = ff00c3a4, %l7 = 0000000000003880
	ldsha	[%i4+%o4]0x81,%l7	! %l7 = ffffffffffffff00
!	Code Fragment 4
p0_fragment_3:
!	%l0 = bc920e987e0ad113
	setx	0xc6566e9857b7f3ef,%g7,%l0 ! %l0 = c6566e9857b7f3ef
!	%l1 = 00000000a445acc4
	setx	0xc4d4bd07d093aa68,%g7,%l1 ! %l1 = c4d4bd07d093aa68
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = c6566e9857b7f3ef
	setx	0x67f4bdd7fb188771,%g7,%l0 ! %l0 = 67f4bdd7fb188771
!	%l1 = c4d4bd07d093aa68
	setx	0x248362e01c93cb21,%g7,%l1 ! %l1 = 248362e01c93cb21
!	%l4 = cda4e93d, %l5 = 000000ff, Mem[0000000030181410] = 40cb8400 c2543a02
	stda	%l4,[%i6+%o5]0x89	! Mem[0000000030181410] = cda4e93d 000000ff
!	%l4 = 00000000cda4e93d, Mem[0000000021800181] = abe3e24c, %asi = 80
	stba	%l4,[%o3+0x181]%asi	! Mem[0000000021800180] = ab3de24c
!	Starting 10 instruction Load Burst
!	Mem[000000001018140c] = 2c000000, %l2 = 53b5c436c3a4b638
	lduwa	[%i6+0x00c]%asi,%l2	! %l2 = 000000002c000000

p0_label_35:
	membar	#Sync			! Added by membar checker (5)
!	Mem[0000000030081400] = a4c30000 c4ac45a4 ff6cd866 f3265385
!	Mem[0000000030081410] = da8bf391 3f9668d5 d600f5c9 e42f8f42
!	Mem[0000000030081420] = a0c1274c 89ee0440 3901d30e 460d3245
!	Mem[0000000030081430] = b56347bb d7527b5c b83f1bed 36761e38
	ldda	[%i2]ASI_BLK_AIUSL,%f0	! Block Load from 0000000030081400
!	Mem[00000000300c1410] = 3de9a4cd, %f22 = fca0e757
	lda	[%i3+%o5]0x89,%f22	! %f22 = 3de9a4cd
!	Mem[0000000010081420] = 6d134e7a 22ff45e1, %l4 = cda4e93d, %l5 = 000000ff
	ldda	[%i2+0x020]%asi,%l4	! %l4 = 000000006d134e7a 0000000022ff45e1
!	Mem[000000001010141c] = bcd87dbd, %l4 = 000000006d134e7a
	ldsh	[%i4+0x01c],%l4		! %l4 = ffffffffffffbcd8
!	Mem[0000000030081410] = da8bf391, %f31 = bfc7dd41
	lda	[%i2+%o5]0x81,%f31	! %f31 = da8bf391
!	Mem[0000000020800000] = dc2ccc70, %l1 = 248362e01c93cb21
	ldsb	[%o1+0x001],%l1		! %l1 = 000000000000002c
!	Mem[0000000010001430] = a818ebf9c99c9026, %f20 = 874a68fa 174dcda7
	ldda	[%i0+0x030]%asi,%f20	! %f20 = a818ebf9 c99c9026
!	Mem[0000000010041410] = ffffffff, %l5 = 0000000022ff45e1
	ldsba	[%i1+%o5]0x80,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000030081410] = da8bf391, %l7 = ffffffffffffff00
	ldsha	[%i2+%o5]0x81,%l7	! %l7 = ffffffffffffda8b
!	Starting 10 instruction Store Burst
!	%l6 = ffffffffffffffff, Mem[0000000010081408] = 59cfffff
	stwa	%l6,[%i2+%o4]0x80	! Mem[0000000010081408] = ffffffff

p0_label_36:
!	%f18 = f5a8db11 dbda32c2, %l2 = 000000002c000000
!	Mem[0000000010041430] = 00000030ffffff84
	add	%i1,0x030,%g1
	stda	%f18,[%g1+%l2]ASI_PST32_PL ! Mem[0000000010041430] = 00000030ffffff84
!	%f24 = 3880263c 2c000000, Mem[00000000300c1408] = ffc6f1ba 3e478896
	stda	%f24,[%i3+%o4]0x81	! Mem[00000000300c1408] = 3880263c 2c000000
!	%l5 = ffffffffffffffff, Mem[0000000010041421] = 0698693d, %asi = 80
	stba	%l5,[%i1+0x021]%asi	! Mem[0000000010041420] = 06ff693d
!	Mem[0000000010101410] = c3a4b638, %l6 = ffffffffffffffff
	swapa	[%i4+%o5]0x80,%l6	! %l6 = 00000000c3a4b638
!	%f24 = 3880263c 2c000000, %l6 = 00000000c3a4b638
!	Mem[0000000010041420] = 06ff693df992187b
	add	%i1,0x020,%g1
	stda	%f24,[%g1+%l6]ASI_PST32_PL ! Mem[0000000010041420] = 06ff693df992187b
!	Mem[0000000010001408] = f6000000, %l5 = ffffffffffffffff
	swapa	[%i0+%o4]0x88,%l5	! %l5 = 00000000f6000000
!	Mem[0000000030081400] = a4c30000, %l6 = 00000000c3a4b638
	swapa	[%i2+%g0]0x81,%l6	! %l6 = 00000000a4c30000
!	Mem[0000000030081408] = ff6cd866, %l0 = 67f4bdd7fb188771
	ldstuba	[%i2+%o4]0x81,%l0	! %l0 = 000000ff000000ff
!	%f30 = e2ef0000 da8bf391, Mem[0000000010181410] = e3ab0000 00000000
	stda	%f30,[%i6+%o5]0x88	! Mem[0000000010181410] = e2ef0000 da8bf391
!	Starting 10 instruction Load Burst
!	Mem[0000000020800000] = dc2ccc70, %l4 = ffffffffffffbcd8
	ldsha	[%o1+0x000]%asi,%l4	! %l4 = ffffffffffffdc2c

p0_label_37:
!	Mem[00000000100c1408] = 00000057, %l3 = 0000000000000000
	lduha	[%i3+%o4]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000010081408] = ffffffff, %f19 = dbda32c2
	lda	[%i2+0x008]%asi,%f19	! %f19 = ffffffff
!	Mem[0000000030181400] = bfc7dd41, %l6 = 00000000a4c30000
	ldswa	[%i6+%g0]0x89,%l6	! %l6 = ffffffffbfc7dd41
!	Mem[00000000300c1400] = 11db0091 00005c03, %l2 = 2c000000, %l3 = 00000000
	ldda	[%i3+%g0]0x81,%l2	! %l2 = 0000000011db0091 0000000000005c03
!	Mem[0000000030101400] = 00002dc6, %l7 = ffffffffffffda8b
	lduha	[%i4+%g0]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000010141430] = bc81e290, %l7 = 0000000000000000
	lduha	[%i5+0x030]%asi,%l7	! %l7 = 000000000000bc81
!	Mem[0000000010101410] = ffffffff, %l7 = 000000000000bc81
	ldsha	[%i4+%o5]0x88,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010101410] = ffffffff, %l0 = 00000000000000ff
	ldsha	[%i4+%o5]0x80,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000030141400] = 38a301b2, %l3 = 0000000000005c03
	lduha	[%i5+%g0]0x81,%l3	! %l3 = 00000000000038a3
!	Starting 10 instruction Store Burst
!	%l6 = ffffffffbfc7dd41, Mem[0000000010081408] = ffffffff
	stwa	%l6,[%i2+%o4]0x88	! Mem[0000000010081408] = bfc7dd41

p0_label_38:
!	%f16 = 91f38bda fa684a87, Mem[00000000300c1408] = 3880263c 2c000000
	stda	%f16,[%i3+%o4]0x81	! Mem[00000000300c1408] = 91f38bda fa684a87
!	Mem[0000000010081408] = 41ddc7bf, %l3 = 00000000000038a3
	swapa	[%i2+%o4]0x80,%l3	! %l3 = 0000000041ddc7bf
!	%l2 = 0000000011db0091, Mem[0000000030041400] = 273f3297
	stha	%l2,[%i1+%g0]0x81	! Mem[0000000030041400] = 00913297
!	%l7 = ffffffffffffffff, Mem[0000000010001400] = 00000000
	stha	%l7,[%i0+%g0]0x80	! Mem[0000000010001400] = ffff0000
!	Mem[0000000010181408] = 3880263c, %l0 = ffffffffffffffff
	swapa	[%i6+%o4]0x80,%l0	! %l0 = 000000003880263c
!	%l1 = 000000000000002c, Mem[0000000010001420] = 0000002cb201a3e8
	stx	%l1,[%i0+0x020]		! Mem[0000000010001420] = 000000000000002c
!	%f4  = d568963f, %f24 = 3880263c, %f26 = 7fffffff
	fdivs	%f4 ,%f24,%f26		! %f26 = dc6850da
!	Mem[00000000100c1410] = bcd87dbd, %l0 = 000000003880263c
	ldstuba	[%i3+%o5]0x88,%l0	! %l0 = 000000bd000000ff
!	%f0  = a445acc4 0000c3a4, %l0 = 00000000000000bd
!	Mem[0000000030181428] = 6baa56d9a91c0679
	add	%i6,0x028,%g1
	stda	%f0,[%g1+%l0]ASI_PST16_SL ! Mem[0000000030181428] = a4c356d9c4ac45a4
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = a445acc438b6a4c3, %f0  = a445acc4 0000c3a4
	ldda	[%i2+%g0]0x89,%f0 	! %f0  = a445acc4 38b6a4c3

p0_label_39:
!	Mem[0000000010001428] = 00000000, %l1 = 000000000000002c
	ldub	[%i0+0x028],%l1		! %l1 = 0000000000000000
!	Mem[0000000010081404] = ecd17bff, %l0 = 00000000000000bd
	ldsw	[%i2+0x004],%l0		! %l0 = ffffffffecd17bff
!	Mem[0000000030181408] = ffefe9da, %l4 = ffffffffffffdc2c
	lduha	[%i6+%o4]0x81,%l4	! %l4 = 000000000000ffef
!	%f6  = 428f2fe4 c9f500d6, Mem[00000000100c1410] = ff7dd8bc d06c6fae
	stda	%f6 ,[%i3+%o5]0x80	! Mem[00000000100c1410] = 428f2fe4 c9f500d6
!	%l6 = ffffffffbfc7dd41, imm = 00000000000005ac, %l0 = ffffffffecd17bff
	subc	%l6,0x5ac,%l0		! %l0 = ffffffffbfc7d795
	membar	#Sync			! Added by membar checker (6)
!	Mem[0000000030041400] = 00913297 d1055c20 33ac0000 96223f5a
!	Mem[0000000030041410] = ff5cf5ff 469c20d5 19fcaf81 13b2ab7e
!	Mem[0000000030041420] = 2029d659 659a6283 93cedfa2 488ef728
!	Mem[0000000030041430] = cbbb6fae 6291c585 b7072081 ddedd791
	ldda	[%i1]ASI_BLK_AIUS,%f0	! Block Load from 0000000030041400
!	Mem[0000000010001408] = ffffffff, %l7 = ffffffffffffffff
	ldsba	[%i0+%o4]0x88,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000030081408] = ff6cd866 f3265385, %l2 = 11db0091, %l3 = 41ddc7bf
	ldda	[%i2+%o4]0x81,%l2	! %l2 = 00000000ff6cd866 00000000f3265385
!	Mem[0000000030001400] = ff000084, %l1 = 0000000000000000
	ldsba	[%i0+%g0]0x81,%l1	! %l1 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	Mem[00000000100c141c] = 82473e07, %l6 = ffffffffbfc7dd41
	ldstuba	[%i3+0x01c]%asi,%l6	! %l6 = 00000082000000ff

p0_label_40:
!	Mem[00000000100c1418] = 1143cdff, %l0 = ffffffffbfc7d795, %asi = 80
	swapa	[%i3+0x018]%asi,%l0	! %l0 = 000000001143cdff
!	%f0  = 00913297 d1055c20 33ac0000 96223f5a
!	%f4  = ff5cf5ff 469c20d5 19fcaf81 13b2ab7e
!	%f8  = 2029d659 659a6283 93cedfa2 488ef728
!	%f12 = cbbb6fae 6291c585 b7072081 ddedd791
	stda	%f0,[%i3]ASI_BLK_AIUP	! Block Store to 00000000100c1400
!	%l1 = ffffffffffffffff, Mem[0000000010181400] = 00000000
	stwa	%l1,[%i6+%g0]0x80	! Mem[0000000010181400] = ffffffff
!	%f18 = f5a8db11 ffffffff, Mem[0000000010141408] = ae85f907 32ffffff
	stda	%f18,[%i5+%o4]0x80	! Mem[0000000010141408] = f5a8db11 ffffffff
!	Mem[00000000300c1400] = 11db0091, %l4 = 000000000000ffef
	swapa	[%i3+%g0]0x81,%l4	! %l4 = 0000000011db0091
!	Mem[0000000010101408] = 000000d7, %l4 = 0000000011db0091
	swapa	[%i4+%o4]0x80,%l4	! %l4 = 00000000000000d7
!	%f16 = 91f38bda, Mem[00000000300c1410] = cda4e93d
	sta	%f16,[%i3+%o5]0x81	! Mem[00000000300c1410] = 91f38bda
!	%f20 = a818ebf9 c99c9026, Mem[0000000010081400] = 00000000 ecd17bff
	stda	%f20,[%i2+%g0]0x80	! Mem[0000000010081400] = a818ebf9 c99c9026
!	%l6 = 0000000000000082, Mem[00000000100c1400] = 00913297
	stba	%l6,[%i3+%g0]0x80	! Mem[00000000100c1400] = 82913297
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = da8bf391, %f18 = f5a8db11
	lda	[%i5+%o4]0x89,%f18	! %f18 = da8bf391

p0_label_41:
!	Mem[0000000030081400] = c3a4b638, %l3 = 00000000f3265385
	ldswa	[%i2+%g0]0x81,%l3	! %l3 = ffffffffc3a4b638
!	Mem[0000000010101410] = ffffffff000000ff, %l5 = 00000000f6000000
	ldxa	[%i4+%o5]0x80,%l5	! %l5 = ffffffff000000ff
!	Mem[0000000030181410] = 3de9a4cd, %l7 = ffffffffffffffff
	ldsha	[%i6+%o5]0x81,%l7	! %l7 = 0000000000003de9
!	Mem[0000000010101420] = 501579a4, %l1 = ffffffffffffffff
	ldsh	[%i4+0x020],%l1		! %l1 = 0000000000005015
!	Mem[0000000010141408] = f5a8db11, %f17 = fa684a87
	lda	[%i5+%o4]0x80,%f17	! %f17 = f5a8db11
!	Mem[00000000201c0000] = ff004b0a, %l4 = 00000000000000d7
	ldsh	[%o0+%g0],%l4		! %l4 = ffffffffffffff00
!	Mem[000000001004143c] = 4391f86d, %l0 = 000000001143cdff
	ldub	[%i1+0x03c],%l0		! %l0 = 0000000000000043
!	Mem[0000000010101408] = 11db0091, %l7 = 0000000000003de9
	ldswa	[%i4+%o4]0x80,%l7	! %l7 = 0000000011db0091
!	Mem[0000000021800000] = 0df65599, %l6 = 0000000000000082
	lduh	[%o3+%g0],%l6		! %l6 = 0000000000000df6
!	Starting 10 instruction Store Burst
!	Mem[0000000010181410] = 91f38bda, %l2 = 00000000ff6cd866
	swapa	[%i6+%o5]0x80,%l2	! %l2 = 0000000091f38bda

p0_label_42:
!	Mem[0000000030041400] = 00913297, %l5 = ffffffff000000ff
	swapa	[%i1+%g0]0x81,%l5	! %l5 = 0000000000913297
!	Mem[0000000030101410] = 91f38bda, %l3 = ffffffffc3a4b638
	swapa	[%i4+%o5]0x81,%l3	! %l3 = 0000000091f38bda
!	%l7 = 0000000011db0091, immd = fffffffffffff0a5, %l5 = 0000000000913297
	sdivx	%l7,-0xf5b,%l5		! %l5 = fffffffffffed653
!	Mem[0000000010181408] = ffffffff, %l4 = ffffffffffffff00
	swapa	[%i6+%o4]0x88,%l4	! %l4 = 00000000ffffffff
!	%l5 = fffffffffffed653, Mem[00000000100c1408] = 0000ac33
	stwa	%l5,[%i3+%o4]0x88	! Mem[00000000100c1408] = fffed653
!	Mem[0000000010041408] = ffbcaf54b53976a1, %l1 = 0000000000005015, %l4 = 00000000ffffffff
	add	%i1,0x08,%g1
	casxa	[%g1]0x80,%l1,%l4	! %l4 = ffbcaf54b53976a1
!	%f20 = a818ebf9 c99c9026, %l1 = 0000000000005015
!	Mem[00000000100c1418] = 19fcaf8113b2ab7e
	add	%i3,0x018,%g1
	stda	%f20,[%g1+%l1]ASI_PST32_PL ! Mem[00000000100c1418] = 26909cc913b2ab7e
!	%f26 = dc6850da 36c4b553, Mem[0000000010001410] = 13d10a7e 59cfffff
	stda	%f26,[%i0+%o5]0x88	! Mem[0000000010001410] = dc6850da 36c4b553
!	Mem[0000000030081408] = ff6cd866, %l6 = 0000000000000df6
	swapa	[%i2+%o4]0x81,%l6	! %l6 = 00000000ff6cd866
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = 59a8db11, %l2 = 0000000091f38bda
	ldsha	[%i2+%o5]0x80,%l2	! %l2 = 00000000000059a8

p0_label_43:
!	Mem[0000000030101400] = 00002dc6ffffffff, %f20 = a818ebf9 c99c9026
	ldda	[%i4+%g0]0x81,%f20	! %f20 = 00002dc6 ffffffff
!	Mem[0000000010081400] = a818ebf9, %f28 = 4a66faad
	lda	[%i2+%g0]0x80,%f28	! %f28 = a818ebf9
!	Mem[0000000030001410] = c3a41d6d, %l2 = 00000000000059a8
	lduha	[%i0+%o5]0x81,%l2	! %l2 = 000000000000c3a4
!	Mem[0000000010081400] = a818ebf9, %l4 = ffbcaf54b53976a1
	lduba	[%i2+%g0]0x80,%l4	! %l4 = 00000000000000a8
!	Mem[0000000010101414] = 000000ff, %f24 = 3880263c
	lda	[%i4+0x014]%asi,%f24	! %f24 = 000000ff
!	Mem[00000000201c0000] = ff004b0a, %l7 = 0000000011db0091
	ldsh	[%o0+%g0],%l7		! %l7 = ffffffffffffff00
!	Mem[0000000010101400] = 53b5c436c3a4b638, %f20 = 00002dc6 ffffffff
	ldda	[%i4+%g0]0x88,%f20	! %f20 = 53b5c436 c3a4b638
!	Mem[0000000010001408] = ffffffff, %l7 = ffffffffffffff00
	lduwa	[%i0+%o4]0x88,%l7	! %l7 = 00000000ffffffff
!	Mem[0000000010081400] = a818ebf9, %f1  = d1055c20
	lda	[%i2+%g0]0x80,%f1 	! %f1 = a818ebf9
!	Starting 10 instruction Store Burst
!	%f26 = dc6850da, %f3  = 96223f5a
	fsqrts	%f26,%f3 		! %f3  = 7fffffff

p0_label_44:
!	Mem[0000000030001400] = 840000ff, %l6 = 00000000ff6cd866
	ldstuba	[%i0+%g0]0x89,%l6	! %l6 = 000000ff000000ff
	membar	#Sync			! Added by membar checker (7)
!	Mem[00000000100c1425] = 659a6283, %l5 = fffffffffffed653
	ldstub	[%i3+0x025],%l5		! %l5 = 0000009a000000ff
!	%f0  = 00913297 a818ebf9, %l6 = 00000000000000ff
!	Mem[0000000010141420] = d9d3c39729bfbdf6
	add	%i5,0x020,%g1
	stda	%f0,[%g1+%l6]ASI_PST8_PL ! Mem[0000000010141420] = f9eb18a897329100
!	Mem[0000000010041400] = ffecffff, %l7 = 00000000ffffffff
	ldstuba	[%i1+%g0]0x80,%l7	! %l7 = 000000ff000000ff
!	%l5 = 000000000000009a, Mem[0000000010041410] = ffffffff
	stha	%l5,[%i1+%o5]0x88	! Mem[0000000010041410] = ffff009a
!	Mem[0000000030081400] = c3a4b638, %l7 = 00000000000000ff
	ldstuba	[%i2+%g0]0x81,%l7	! %l7 = 000000c3000000ff
!	%f21 = c3a4b638, Mem[0000000010001408] = ffffffff
	sta	%f21,[%i0+%o4]0x88	! Mem[0000000010001408] = c3a4b638
!	Mem[000000001018142c] = cda4e93d, %l4 = 00000000000000a8, %asi = 80
	swapa	[%i6+0x02c]%asi,%l4	! %l4 = 00000000cda4e93d
!	%l5 = 000000000000009a, %l4 = 00000000cda4e93d, %l4  = 00000000cda4e93d
	mulx	%l5,%l4,%l4		! %l4 = 0000007bb5344eb2
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = e2ef0000 bfc7dd41, %l2 = 0000c3a4, %l3 = 91f38bda
	ldda	[%i6+%g0]0x89,%l2	! %l2 = 00000000bfc7dd41 00000000e2ef0000

p0_label_45:
!	Mem[0000000010141408] = 11dba8f5, %l6 = 00000000000000ff
	lduwa	[%i5+%o4]0x88,%l6	! %l6 = 0000000011dba8f5
!	%l7 = 00000000000000c3, %l6 = 0000000011dba8f5, %l4 = 0000007bb5344eb2
	sub	%l7,%l6,%l4		! %l4 = ffffffffee2457ce
!	Mem[0000000030101400] = ffffffffc62d0000, %l2 = 00000000bfc7dd41
	ldxa	[%i4+%g0]0x89,%l2	! %l2 = ffffffffc62d0000
!	Mem[0000000030141410] = fa684a87, %l7 = 00000000000000c3
	lduwa	[%i5+%o5]0x89,%l7	! %l7 = 00000000fa684a87
!	Mem[0000000030001408] = b4c70000, %l1 = 0000000000005015
	ldsba	[%i0+%o4]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000020800000] = dc2ccc70, %l7 = 00000000fa684a87
	ldub	[%o1+%g0],%l7		! %l7 = 00000000000000dc
!	Mem[0000000010081418] = 5687341e, %l4 = ffffffffee2457ce
	lduba	[%i2+0x019]%asi,%l4	! %l4 = 0000000000000087
!	Mem[00000000100c141c] = 13b2ab7e, %l5 = 000000000000009a
	ldswa	[%i3+0x01c]%asi,%l5	! %l5 = 0000000013b2ab7e
!	Mem[0000000010141408] = 11dba8f5, %l1 = 0000000000000000
	lduba	[%i5+%o4]0x88,%l1	! %l1 = 00000000000000f5
!	Starting 10 instruction Store Burst
!	%f16 = 91f38bda f5a8db11, %l6 = 0000000011dba8f5
!	Mem[00000000100c1408] = 53d6feff96223f5a
	add	%i3,0x008,%g1
	stda	%f16,[%g1+%l6]ASI_PST16_P ! Mem[00000000100c1408] = 53d68bda9622db11

p0_label_46:
!	%f24 = 000000ff, Mem[0000000030181410] = cda4e93d
	sta	%f24,[%i6+%o5]0x89	! Mem[0000000030181410] = 000000ff
!	%f12 = cbbb6fae 6291c585, %l6 = 0000000011dba8f5
!	Mem[0000000010041420] = 06ff693df992187b
	add	%i1,0x020,%g1
	stda	%f12,[%g1+%l6]ASI_PST16_PL ! Mem[0000000010041420] = 85c5693dae6f187b
!	Mem[0000000010081409] = 000038a3, %l4 = 0000000000000087
	ldstub	[%i2+0x009],%l4		! %l4 = 00000000000000ff
!	Mem[000000001000142d] = c9b452b0, %l6 = 0000000011dba8f5
	ldstuba	[%i0+0x02d]%asi,%l6	! %l6 = 000000b4000000ff
!	%l6 = 00000000000000b4, Mem[0000000030041408] = 33ac0000
	stha	%l6,[%i1+%o4]0x81	! Mem[0000000030041408] = 00b40000
!	%l4 = 0000000000000000, Mem[0000000030081400] = 38b6a4ff
	stha	%l4,[%i2+%g0]0x89	! Mem[0000000030081400] = 38b60000
!	%l3 = 00000000e2ef0000, Mem[0000000010101434] = 00000030
	sth	%l3,[%i4+0x034]		! Mem[0000000010101434] = 00000030
!	%l7 = 00000000000000dc, Mem[0000000010181408] = 00ffffff
	stba	%l7,[%i6+%o4]0x80	! Mem[0000000010181408] = dcffffff
!	%l0 = 0000000000000043, Mem[0000000010041400] = ffffecff
	stha	%l0,[%i1+%g0]0x88	! Mem[0000000010041400] = ffff0043
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = d7dc9ca4, %l4 = 0000000000000000
	ldsha	[%o2+0x000]%asi,%l4	! %l4 = ffffffffffffd7dc

p0_label_47:
!	Mem[00000000100c1414] = 469c20d5, %l0 = 0000000000000043
	lduha	[%i3+0x016]%asi,%l0	! %l0 = 00000000000020d5
!	Mem[0000000010041410] = 9a00ffff, %l3 = 00000000e2ef0000
	lduha	[%i1+%o5]0x80,%l3	! %l3 = 0000000000009a00
!	Mem[0000000010101424] = e6e435b3, %l7 = 00000000000000dc
	ldub	[%i4+0x026],%l7		! %l7 = 0000000000000035
!	Mem[00000000300c1410] = da8bf391, %l7 = 0000000000000035
	lduha	[%i3+%o5]0x89,%l7	! %l7 = 000000000000f391
!	Mem[0000000021800180] = ab3de24c, %l6 = 00000000000000b4
	ldsha	[%o3+0x180]%asi,%l6	! %l6 = ffffffffffffab3d
!	Mem[00000000100c1408] = 53d68bda, %l2 = ffffffffc62d0000
	lduba	[%i3+%o4]0x80,%l2	! %l2 = 0000000000000053
!	Mem[0000000010041408] = 54afbcff, %l2 = 0000000000000053
	ldsba	[%i1+%o4]0x88,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000010141410] = e431ff94a4c3ffff, %f4  = ff5cf5ff 469c20d5
	ldda	[%i5+%o5]0x88,%f4 	! %f4  = e431ff94 a4c3ffff
!	Mem[0000000010101400] = c3a4b638, %l2 = ffffffffffffffff
	lduba	[%i4+%g0]0x88,%l2	! %l2 = 0000000000000038
!	Starting 10 instruction Store Burst
!	Mem[0000000010181411] = ff6cd866, %l3 = 0000000000009a00
	ldstuba	[%i6+0x011]%asi,%l3	! %l3 = 0000006c000000ff

p0_label_48:
!	%l1 = 00000000000000f5, Mem[0000000030001408] = b4c70000
	stha	%l1,[%i0+%o4]0x89	! Mem[0000000030001408] = b4c700f5
!	Mem[0000000010001414] = da5068dc, %l5 = 0000000013b2ab7e
	swap	[%i0+0x014],%l5		! %l5 = 00000000da5068dc
!	Mem[0000000030081410] = 91f38bda, %l7 = 000000000000f391
	ldstuba	[%i2+%o5]0x89,%l7	! %l7 = 000000da000000ff
!	%f3  = 7fffffff, Mem[0000000030181400] = bfc7dd41
	sta	%f3 ,[%i6+%g0]0x89	! Mem[0000000030181400] = 7fffffff
!	%f18 = da8bf391 ffffffff, Mem[0000000010101408] = 11db0091 6d71833f
	stda	%f18,[%i4+%o4]0x80	! Mem[0000000010101408] = da8bf391 ffffffff
!	%f22 = 3de9a4cd 7f800000, %l3 = 000000000000006c
!	Mem[0000000010041420] = 85c5693dae6f187b
	add	%i1,0x020,%g1
	stda	%f22,[%g1+%l3]ASI_PST32_PL ! Mem[0000000010041420] = 85c5693dae6f187b
!	%f26 = dc6850da, Mem[0000000030181408] = ffefe9da
	sta	%f26,[%i6+%o4]0x81	! Mem[0000000030181408] = dc6850da
!	Mem[0000000030001410] = 6d1da4c3, %l4 = ffffffffffffd7dc
	swapa	[%i0+%o5]0x89,%l4	! %l4 = 000000006d1da4c3
!	%l0 = 00000000000020d5, Mem[00000000300c1408] = 91f38bdafa684a87
	stxa	%l0,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00000000000020d5
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = 00002939, %l1 = 00000000000000f5
	ldsha	[%i5+%g0]0x80,%l1	! %l1 = 0000000000000000

p0_label_49:
!	Mem[0000000010101400] = 38b6a4c3, %l2 = 0000000000000038
	ldsba	[%i4+%g0]0x80,%l2	! %l2 = 0000000000000038
!	Code Fragment 4
p0_fragment_4:
!	%l0 = 00000000000020d5
	setx	0x20bd6fbfb9d3961e,%g7,%l0 ! %l0 = 20bd6fbfb9d3961e
!	%l1 = 0000000000000000
	setx	0x5cb8c97fa7b813a9,%g7,%l1 ! %l1 = 5cb8c97fa7b813a9
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 20bd6fbfb9d3961e
	setx	0xc4fbc5ffa144387a,%g7,%l0 ! %l0 = c4fbc5ffa144387a
!	%l1 = 5cb8c97fa7b813a9
	setx	0xf9404e58165d6993,%g7,%l1 ! %l1 = f9404e58165d6993
!	Mem[0000000030081408] = 00000df6, %l2 = 0000000000000038
	lduwa	[%i2+%o4]0x81,%l2	! %l2 = 0000000000000df6
!	Mem[00000000100c1408] = da8bd653, %f8  = 2029d659
	lda	[%i3+%o4]0x88,%f8 	! %f8 = da8bd653
!	%l5 = 00000000da5068dc, %l1 = f9404e58165d6993, %l4 = 000000006d1da4c3
	udivx	%l5,%l1,%l4		! %l4 = 0000000000000000
!	Mem[0000000030081408] = f60d0000, %l1 = f9404e58165d6993
	ldsba	[%i2+%o4]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000010101400] = c3a4b638, %f10 = 93cedfa2
	lda	[%i4+%g0]0x88,%f10	! %f10 = c3a4b638
!	Mem[00000000300c1410] = 91f38bda, %l6 = ffffffffffffab3d
	lduwa	[%i3+%o5]0x81,%l6	! %l6 = 0000000091f38bda
!	Mem[0000000010181410] = e2ef000066d8ffff, %f14 = b7072081 ddedd791
	ldda	[%i6+%o5]0x88,%f14	! %f14 = e2ef0000 66d8ffff
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000000000, Mem[000000001018142c] = 000000a8, %asi = 80
	stha	%l4,[%i6+0x02c]%asi	! Mem[000000001018142c] = 000000a8

p0_label_50:
!	Mem[0000000010181418] = c7cb53a7, %l6 = 91f38bda, %l4 = 00000000
	add	%i6,0x18,%g1
	casa	[%g1]0x80,%l6,%l4	! %l4 = 00000000c7cb53a7
!	Mem[0000000010141400] = 00002939, %l0 = c4fbc5ffa144387a
	ldstuba	[%i5+%g0]0x80,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010101400] = 38b6a4c3, %l5 = 00000000da5068dc
	swapa	[%i4+%g0]0x80,%l5	! %l5 = 0000000038b6a4c3
!	%l6 = 0000000091f38bda, Mem[0000000030081410] = ff8bf3913f9668d5
	stxa	%l6,[%i2+%o5]0x81	! Mem[0000000030081410] = 0000000091f38bda
!	%l2 = 0000000000000df6, %l7 = 00000000000000da, %l3 = 000000000000006c
	andn	%l2,%l7,%l3		! %l3 = 0000000000000d24
!	Mem[0000000030101400] = 00002dc6, %l0 = 0000000000000000
	lduwa	[%i4+%g0]0x81,%l0	! %l0 = 0000000000002dc6
!	%l6 = 91f38bda, %l7 = 000000da, Mem[0000000030041410] = fff55cff d5209c46
	stda	%l6,[%i1+%o5]0x89	! Mem[0000000030041410] = 91f38bda 000000da
!	%l7 = 00000000000000da, Mem[0000000010041408] = ffbcaf54
	stha	%l7,[%i1+%o4]0x80	! Mem[0000000010041408] = 00daaf54
!	Mem[0000000010001408] = 38b6a4c3, %l2 = 0000000000000df6
	swapa	[%i0+%o4]0x80,%l2	! %l2 = 0000000038b6a4c3
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1420] = 2029d659 65ff6283, %l4 = c7cb53a7, %l5 = 38b6a4c3
	ldd	[%i3+0x020],%l4		! %l4 = 000000002029d659 0000000065ff6283

p0_label_51:
!	Randomly selected nop
	nop
!	Mem[0000000010041410] = ffff009a, %l5 = 0000000065ff6283
	ldsba	[%i1+%o5]0x88,%l5	! %l5 = ffffffffffffff9a
!	Mem[0000000010001410] = 53b5c436, %l2 = 0000000038b6a4c3
	ldsha	[%i0+%o5]0x80,%l2	! %l2 = 00000000000053b5
!	Mem[00000000100c1408] = 53d68bda, %l1 = 0000000000000000
	lduw	[%i3+%o4],%l1		! %l1 = 0000000053d68bda
!	%l1 = 0000000053d68bda, imm = 0000000000000f84, %l6 = 0000000091f38bda
	or	%l1,0xf84,%l6		! %l6 = 0000000053d68fde
!	Mem[00000000211c0000] = d7dc9ca4, %l1 = 0000000053d68bda
	ldsba	[%o2+0x000]%asi,%l1	! %l1 = ffffffffffffffd7
!	Mem[00000000100c1418] = 26909cc9, %l4 = 000000002029d659
	ldsh	[%i3+0x01a],%l4		! %l4 = ffffffffffff9cc9
!	Mem[00000000100c1408] = 53d68bda, %l7 = 00000000000000da
	lduba	[%i3+%o4]0x80,%l7	! %l7 = 0000000000000053
!	Mem[00000000100c1400] = 82913297, %f25 = 2c000000
	lda	[%i3+0x000]%asi,%f25	! %f25 = 82913297
!	Starting 10 instruction Store Burst
!	%f2  = 33ac0000 7fffffff, Mem[0000000030001400] = 840000ff b16d2fba
	stda	%f2 ,[%i0+%g0]0x89	! Mem[0000000030001400] = 33ac0000 7fffffff

p0_label_52:
!	%l6 = 0000000053d68fde, Mem[0000000010001408] = 00000df6, %asi = 80
	stha	%l6,[%i0+0x008]%asi	! Mem[0000000010001408] = 8fde0df6
!	%l1 = ffffffffffffffd7, Mem[00000000201c0001] = ff004b0a, %asi = 80
	stba	%l1,[%o0+0x001]%asi	! Mem[00000000201c0000] = ffd74b0a
!	Mem[0000000010181410] = 66d8ffff, %l7 = 0000000000000053
	ldstuba	[%i6+%o5]0x88,%l7	! %l7 = 000000ff000000ff
!	Mem[0000000030141408] = 91f38bda, %l1 = ffffffffffffffd7
	ldstuba	[%i5+%o4]0x81,%l1	! %l1 = 00000091000000ff
!	Mem[000000001010143c] = 80000000, %l5 = ffffffffffffff9a
	ldstuba	[%i4+0x03c]%asi,%l5	! %l5 = 00000080000000ff
!	Mem[00000000100c1420] = 2029d659, %l1 = 00000091, %l4 = ffff9cc9
	add	%i3,0x20,%g1
	casa	[%g1]0x80,%l1,%l4	! %l4 = 000000002029d659
!	Mem[00000000100c1400] = 97329182, %l4 = 000000002029d659
	swapa	[%i3+%g0]0x88,%l4	! %l4 = 0000000097329182
!	%l2 = 00000000000053b5, Mem[0000000010001400] = 0000ffff
	stha	%l2,[%i0+%g0]0x88	! Mem[0000000010001400] = 000053b5
!	%l1 = 0000000000000091, Mem[0000000030101400] = 00002dc6ffffffff
	stxa	%l1,[%i4+%g0]0x81	! Mem[0000000030101400] = 0000000000000091
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = b4c700f5, %l2 = 00000000000053b5
	ldsha	[%i0+%o4]0x89,%l2	! %l2 = 00000000000000f5

p0_label_53:
!	Mem[0000000010101400] = dc6850da, %l3 = 0000000000000d24
	lduba	[%i4+%g0]0x88,%l3	! %l3 = 00000000000000da
!	Mem[0000000010101408] = 91f38bda, %l7 = 00000000000000ff
	lduha	[%i4+%o4]0x88,%l7	! %l7 = 0000000000008bda
!	Mem[0000000010081408] = 00ff38a3, %f16 = 91f38bda
	lda	[%i2+%o4]0x80,%f16	! %f16 = 00ff38a3
!	Mem[00000000300c1408] = 00000000, %l0 = 0000000000002dc6
	lduba	[%i3+%o4]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000010141438] = 4a66faad, %l3 = 00000000000000da
	lduw	[%i5+0x038],%l3		! %l3 = 000000004a66faad
!	Mem[0000000021800040] = df0131e4, %l0 = 0000000000000000
	ldub	[%o3+0x041],%l0		! %l0 = 0000000000000001
!	Mem[0000000030041410] = 000000da91f38bda, %f18 = da8bf391 ffffffff
	ldda	[%i1+%o5]0x89,%f18	! %f18 = 000000da 91f38bda
!	Mem[0000000021800080] = 9659cffb, %l5 = 0000000000000080
	ldsb	[%o3+0x080],%l5		! %l5 = ffffffffffffff96
!	Mem[0000000010001408] = 8fde0df6, %f16 = 00ff38a3
	lda	[%i0+0x008]%asi,%f16	! %f16 = 8fde0df6
!	Starting 10 instruction Store Burst
!	%l6 = 0000000053d68fde, Mem[0000000030081408] = 00000df6
	stha	%l6,[%i2+%o4]0x81	! Mem[0000000030081408] = 8fde0df6

p0_label_54:
!	%l0 = 0000000000000001, Mem[0000000010041410] = 9a00ffffffffffff
	stxa	%l0,[%i1+%o5]0x80	! Mem[0000000010041410] = 0000000000000001
!	%l3 = 000000004a66faad, Mem[0000000010141425] = 97329100, %asi = 80
	stba	%l3,[%i5+0x025]%asi	! Mem[0000000010141424] = 97ad9100
!	%f27 = 36c4b553, Mem[0000000010141410] = a4c3ffff
	sta	%f27,[%i5+%o5]0x88	! Mem[0000000010141410] = 36c4b553
!	%l3 = 000000004a66faad, Mem[00000000100c1400] = 2029d659
	stha	%l3,[%i3+%g0]0x88	! Mem[00000000100c1400] = 2029faad
!	Mem[0000000010081410] = 59a8db11dbda32c2, %l7 = 0000000000008bda, %l5 = ffffffffffffff96
	add	%i2,0x10,%g1
	casxa	[%g1]0x80,%l7,%l5	! %l5 = 59a8db11dbda32c2
!	%l7 = 0000000000008bda, Mem[00000000211c0000] = d7dc9ca4
	stb	%l7,[%o2+%g0]		! Mem[00000000211c0000] = dadc9ca4
!	%l6 = 0000000053d68fde, Mem[0000000010041400] = ffff0043
	stwa	%l6,[%i1+%g0]0x88	! Mem[0000000010041400] = 53d68fde
!	%l0 = 00000001, %l1 = 00000091, Mem[0000000030001408] = f500c7b4 e0065d43
	stda	%l0,[%i0+%o4]0x81	! Mem[0000000030001408] = 00000001 00000091
!	Mem[0000000010041408] = 00daaf54, %l3 = 000000004a66faad, %asi = 80
	swapa	[%i1+0x008]%asi,%l3	! %l3 = 0000000000daaf54
!	Starting 10 instruction Load Burst
!	Mem[0000000030001400] = 7fffffff, %l6 = 0000000053d68fde
	ldswa	[%i0+%g0]0x89,%l6	! %l6 = 000000007fffffff

p0_label_55:
!	Mem[0000000010181408] = dcffffff, %l7 = 0000000000008bda
	lduwa	[%i6+%o4]0x80,%l7	! %l7 = 00000000dcffffff
!	Mem[00000000100c1410] = fff55cff, %l4 = 0000000097329182
	lduba	[%i3+%o5]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010081400] = f9eb18a8, %l5 = 59a8db11dbda32c2
	ldsba	[%i2+%g0]0x88,%l5	! %l5 = ffffffffffffffa8
!	Mem[00000000211c0000] = dadc9ca4, %l7 = 00000000dcffffff
	lduha	[%o2+0x000]%asi,%l7	! %l7 = 000000000000dadc
!	Mem[0000000030081410] = da8bf391 00000000, %l4 = 000000ff, %l5 = ffffffa8
	ldda	[%i2+%o5]0x89,%l4	! %l4 = 0000000000000000 00000000da8bf391
!	Mem[00000000100c1408] = da8bd653, %f5  = a4c3ffff
	lda	[%i3+%o4]0x88,%f5 	! %f5 = da8bd653
!	Mem[0000000010001408] = 8fde0df6c3a4b638, %l7 = 000000000000dadc
	ldxa	[%i0+%o4]0x80,%l7	! %l7 = 8fde0df6c3a4b638
!	Mem[0000000030081408] = f60dde8f, %l0 = 0000000000000001
	ldsba	[%i2+%o4]0x89,%l0	! %l0 = ffffffffffffff8f
!	Mem[0000000010001410] = 53b5c436, %l3 = 0000000000daaf54
	ldswa	[%i0+%o5]0x80,%l3	! %l3 = 0000000053b5c436
!	Starting 10 instruction Store Burst
!	%l0 = ffffff8f, %l1 = 00000091, Mem[0000000030041400] = 000000ff d1055c20
	stda	%l0,[%i1+%g0]0x81	! Mem[0000000030041400] = ffffff8f 00000091

p0_label_56:
!	%f18 = 000000da 91f38bda, Mem[0000000030101410] = c3a4b638 adfa664a
	stda	%f18,[%i4+%o5]0x81	! Mem[0000000030101410] = 000000da 91f38bda
!	%l0 = ffffffffffffff8f, Mem[0000000021800040] = df0131e4, %asi = 80
	stba	%l0,[%o3+0x040]%asi	! Mem[0000000021800040] = 8f0131e4
!	%l0 = ffffffffffffff8f, Mem[0000000010181410] = 66d8ffff
	stha	%l0,[%i6+%o5]0x88	! Mem[0000000010181410] = 66d8ff8f
!	Mem[0000000010081408] = 00ff38a3, %l7 = 8fde0df6c3a4b638
	swapa	[%i2+%o4]0x80,%l7	! %l7 = 0000000000ff38a3
!	Mem[0000000030081408] = 8fde0df6, %l4 = 0000000000000000
	ldstuba	[%i2+%o4]0x81,%l4	! %l4 = 0000008f000000ff
!	Mem[0000000010081438] = e7b08f13, %l0 = ffffffffffffff8f
	ldstuba	[%i2+0x038]%asi,%l0	! %l0 = 000000e7000000ff
!	%f24 = 000000ff 82913297, Mem[0000000030101410] = da000000 da8bf391
	stda	%f24,[%i4+%o5]0x89	! Mem[0000000030101410] = 000000ff 82913297
!	%l0 = 00000000000000e7, Mem[0000000010001400] = b5530000
	stba	%l0,[%i0+%g0]0x80	! Mem[0000000010001400] = e7530000
!	%f11 = 488ef728, Mem[0000000010101400] = da5068dc
	sta	%f11,[%i4+%g0]0x80	! Mem[0000000010101400] = 488ef728
!	Starting 10 instruction Load Burst
!	%l6 = 000000007fffffff, Mem[0000000030101408] = 00000df6a4c300ff
	stxa	%l6,[%i4+%o4]0x89	! Mem[0000000030101408] = 000000007fffffff

p0_label_57:
!	Mem[0000000030181410] = ff000000, %l6 = 000000007fffffff
	ldswa	[%i6+%o5]0x81,%l6	! %l6 = ffffffffff000000
!	Mem[00000000300c1400] = 035c0000 efff0000, %l4 = 0000008f, %l5 = da8bf391
	ldda	[%i3+%g0]0x89,%l4	! %l4 = 00000000efff0000 00000000035c0000
!	Mem[0000000030081410] = 00000000, %l4 = 00000000efff0000
	lduwa	[%i2+%o5]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000010081410] = 59a8db11dbda32c2, %f8  = da8bd653 659a6283
	ldda	[%i2+%o5]0x80,%f8 	! %f8  = 59a8db11 dbda32c2
!	Mem[0000000010001410] = 53b5c436, %l4 = 0000000000000000
	lduwa	[%i0+%o5]0x80,%l4	! %l4 = 0000000053b5c436
!	Mem[0000000030141400] = 6be03e31b201a338, %f10 = c3a4b638 488ef728
	ldda	[%i5+%g0]0x89,%f10	! %f10 = 6be03e31 b201a338
!	Mem[0000000010001418] = ffbf5604, %l4 = 0000000053b5c436
	ldswa	[%i0+0x018]%asi,%l4	! %l4 = ffffffffffbf5604
!	Mem[0000000030081410] = 0000000091f38bda, %l6 = ffffffffff000000
	ldxa	[%i2+%o5]0x81,%l6	! %l6 = 0000000091f38bda
!	Mem[0000000010141408] = 11dba8f5, %l4 = ffffffffffbf5604
	lduwa	[%i5+%o4]0x88,%l4	! %l4 = 0000000011dba8f5
!	Starting 10 instruction Store Burst
!	%f1  = a818ebf9, Mem[0000000010141408] = f5a8db11
	sta	%f1 ,[%i5+%o4]0x80	! Mem[0000000010141408] = a818ebf9

p0_label_58:
!	Mem[00000000211c0000] = dadc9ca4, %l3 = 0000000053b5c436
	ldstub	[%o2+%g0],%l3		! %l3 = 000000da000000ff
!	Mem[0000000020800040] = 02ff5107, %l3 = 00000000000000da
	ldstuba	[%o1+0x040]%asi,%l3	! %l3 = 00000002000000ff
!	%f6  = 19fcaf81, %f20 = 53b5c436, %f17 = f5a8db11
	fdivs	%f6 ,%f20,%f17		! %f17 = 05b1f0f7
!	%l6 = 91f38bda, %l7 = 00ff38a3, Mem[0000000010101410] = ffffffff 000000ff
	stda	%l6,[%i4+%o5]0x80	! Mem[0000000010101410] = 91f38bda 00ff38a3
!	%l0 = 00000000000000e7, Mem[0000000010101408] = da8bf391
	stha	%l0,[%i4+%o4]0x80	! Mem[0000000010101408] = 00e7f391
!	Mem[0000000010141404] = 7c5bae23, %l4 = 11dba8f5, %l7 = 00ff38a3
	add	%i5,0x04,%g1
	casa	[%g1]0x80,%l4,%l7	! %l7 = 000000007c5bae23
!	Mem[00000000100c1438] = b7072081, %l6 = 0000000091f38bda
	ldstub	[%i3+0x038],%l6		! %l6 = 000000b7000000ff
!	%l3 = 0000000000000002, Mem[0000000030101408] = ffffff7f00000000
	stxa	%l3,[%i4+%o4]0x81	! Mem[0000000030101408] = 0000000000000002
!	Mem[0000000010101418] = 95a7613a, %l5 = 00000000035c0000, %asi = 80
	swapa	[%i4+0x018]%asi,%l5	! %l5 = 0000000095a7613a
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1418] = 26909cc9, %l1 = 0000000000000091
	lduha	[%i3+0x01a]%asi,%l1	! %l1 = 0000000000009cc9

p0_label_59:
!	Mem[0000000010181438] = 87264796, %l2 = 00000000000000f5
	ldsb	[%i6+0x038],%l2		! %l2 = ffffffffffffff87
!	Mem[0000000010001400] = e7530000ffffffff, %f20 = 53b5c436 c3a4b638
	ldda	[%i0+%g0]0x80,%f20	! %f20 = e7530000 ffffffff
!	Mem[0000000010141438] = 4a66faad, %f10 = 6be03e31
	ld	[%i5+0x038],%f10	! %f10 = 4a66faad
!	%f14 = e2ef0000, %f11 = b201a338, %f9  = dbda32c2
	fmuls	%f14,%f11,%f9 		! %f9  = 55720ec3
!	Mem[0000000010101400] = 488ef72836c4b553, %l3 = 0000000000000002
	ldxa	[%i4+%g0]0x80,%l3	! %l3 = 488ef72836c4b553
!	Mem[0000000010041410] = 00000000, %l4 = 0000000011dba8f5
	lduwa	[%i1+%o5]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000010181410] = 66d8ff8f, %l7 = 000000007c5bae23
	lduha	[%i6+%o5]0x88,%l7	! %l7 = 000000000000ff8f
!	Mem[0000000030041408] = 00b40000 96223f5a, %l4 = 00000000, %l5 = 95a7613a
	ldda	[%i1+%o4]0x81,%l4	! %l4 = 0000000000b40000 0000000096223f5a
!	Mem[0000000030001400] = ffffff7f, %f7  = 13b2ab7e
	lda	[%i0+%g0]0x81,%f7 	! %f7 = ffffff7f
!	Starting 10 instruction Store Burst
!	%f29 = da8bf391, Mem[0000000030181400] = ffffff7f
	sta	%f29,[%i6+%g0]0x81	! Mem[0000000030181400] = da8bf391

p0_label_60:
!	%l5 = 0000000096223f5a, Mem[0000000010181400] = ffffffff00000000
	stxa	%l5,[%i6+%g0]0x80	! Mem[0000000010181400] = 0000000096223f5a
!	Mem[0000000010181410] = 8fffd866, %l6 = 00000000000000b7
	ldstuba	[%i6+%o5]0x80,%l6	! %l6 = 0000008f000000ff
!	%l6 = 000000000000008f, imm = 0000000000000d04, %l6 = 000000000000008f
	xor	%l6,0xd04,%l6		! %l6 = 0000000000000d8b
!	%f24 = 000000ff 82913297, %l5 = 0000000096223f5a
!	Mem[0000000030081428] = 3901d30e460d3245
	add	%i2,0x028,%g1
	stda	%f24,[%g1+%l5]ASI_PST32_S ! Mem[0000000030081428] = 000000ff460d3245
!	Mem[0000000010081430] = 74ad42b6, %l4 = 00b40000, %l2 = ffffff87
	add	%i2,0x30,%g1
	casa	[%g1]0x80,%l4,%l2	! %l2 = 0000000074ad42b6
!	Mem[0000000010101404] = 36c4b553, %l3 = 488ef72836c4b553, %asi = 80
	swapa	[%i4+0x004]%asi,%l3	! %l3 = 0000000036c4b553
!	Mem[00000000300c1400] = efff0000, %l2 = 0000000074ad42b6
	swapa	[%i3+%g0]0x89,%l2	! %l2 = 00000000efff0000
!	Mem[0000000030041408] = 00b40000, %l2 = 00000000efff0000
	swapa	[%i1+%o4]0x81,%l2	! %l2 = 0000000000b40000
!	%l4 = 0000000000b40000, Mem[00000000100c1410] = ff5cf5ff
	stha	%l4,[%i3+%o5]0x80	! Mem[00000000100c1410] = 0000f5ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = 59a8db11, %l7 = 000000000000ff8f
	ldswa	[%i2+%o5]0x80,%l7	! %l7 = 0000000059a8db11

p0_label_61:
!	Mem[0000000010001410] = 53b5c43613b2ab7e, %f0  = 00913297 a818ebf9
	ldda	[%i0+%o5]0x80,%f0 	! %f0  = 53b5c436 13b2ab7e
!	Mem[0000000030101408] = 0200000000000000, %l3 = 0000000036c4b553
	ldxa	[%i4+%o4]0x89,%l3	! %l3 = 0200000000000000
!	Mem[0000000030101400] = 00000000 00000091, %l2 = 00b40000, %l3 = 00000000
	ldda	[%i4+%g0]0x81,%l2	! %l2 = 0000000000000000 0000000000000091
!	Mem[0000000010141420] = f9eb18a8 97ad9100, %l4 = 00b40000, %l5 = 96223f5a
	ldd	[%i5+0x020],%l4		! %l4 = 00000000f9eb18a8 0000000097ad9100
!	Mem[0000000030081400] = 38b60000, %l7 = 0000000059a8db11
	ldsha	[%i2+%g0]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000030181408] = da5068dc, %l1 = 0000000000009cc9
	lduba	[%i6+%o4]0x89,%l1	! %l1 = 00000000000000dc
!	Mem[000000001008143c] = 6e9230f0, %l2 = 0000000000000000
	ldsha	[%i2+0x03e]%asi,%l2	! %l2 = 00000000000030f0
!	Mem[0000000010001400] = e7530000, %l2 = 00000000000030f0
	ldsba	[%i0+%g0]0x80,%l2	! %l2 = ffffffffffffffe7
!	Mem[0000000030101400] = 00000000, %f6  = 19fcaf81
	lda	[%i4+%g0]0x89,%f6 	! %f6 = 00000000
!	Starting 10 instruction Store Burst
!	%l2 = ffffffe7, %l3 = 00000091, Mem[0000000010141428] = 9818d5dd 5c2e102f
	stda	%l2,[%i5+0x028]%asi	! Mem[0000000010141428] = ffffffe7 00000091

p0_label_62:
!	%l2 = ffffffffffffffe7, Mem[00000000300c1400] = b642ad74
	stha	%l2,[%i3+%g0]0x81	! Mem[00000000300c1400] = ffe7ad74
!	Mem[0000000010101439] = fff01e7e, %l0 = 00000000000000e7
	ldstuba	[%i4+0x039]%asi,%l0	! %l0 = 000000f0000000ff
!	%f16 = 8fde0df6 05b1f0f7, Mem[0000000010181408] = dcffffff 2c000000
	stda	%f16,[%i6+%o4]0x80	! Mem[0000000010181408] = 8fde0df6 05b1f0f7
!	%l3 = 0000000000000091, Mem[0000000030041408] = 0000ffef
	stha	%l3,[%i1+%o4]0x89	! Mem[0000000030041408] = 00000091
!	Mem[00000000100c1410] = 0000f5ff, %l1 = 00000000000000dc
	swapa	[%i3+%o5]0x80,%l1	! %l1 = 000000000000f5ff
!	Mem[0000000030101410] = 82913297, %l7 = 0000000000000000
	swapa	[%i4+%o5]0x89,%l7	! %l7 = 0000000082913297
!	Mem[00000000100c142c] = 488ef728, %l5 = 0000000097ad9100
	ldstuba	[%i3+0x02c]%asi,%l5	! %l5 = 00000048000000ff
!	Mem[0000000010101410] = da8bf391, %l3 = 0000000000000091
	ldstuba	[%i4+%o5]0x88,%l3	! %l3 = 00000091000000ff
!	Mem[00000000100c1408] = da8bd653, %l1 = 000000000000f5ff
	ldstuba	[%i3+%o4]0x88,%l1	! %l1 = 00000053000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030101410] = 00000000, %l5 = 0000000000000048
	ldsha	[%i4+%o5]0x89,%l5	! %l5 = 0000000000000000

p0_label_63:
!	%l5 = 0000000000000000, %l1 = 0000000000000053, %l7 = 0000000082913297
	andn	%l5,%l1,%l7		! %l7 = 0000000000000000
!	Mem[0000000010041408] = adfa664a, %l3 = 0000000000000091
	lduha	[%i1+%o4]0x88,%l3	! %l3 = 000000000000664a
!	Mem[0000000010081408] = fca0e75738b6a4c3, %l6 = 0000000000000d8b
	ldxa	[%i2+%o4]0x88,%l6	! %l6 = fca0e75738b6a4c3
!	Mem[0000000010101410] = fff38bda, %l5 = 0000000000000000
	lduwa	[%i4+%o5]0x80,%l5	! %l5 = 00000000fff38bda
!	Mem[0000000010101408] = 00e7f391, %l2 = ffffffffffffffe7
	ldsha	[%i4+0x00a]%asi,%l2	! %l2 = fffffffffffff391
!	Mem[0000000030181408] = da5068dc, %l1 = 0000000000000053
	lduba	[%i6+%o4]0x89,%l1	! %l1 = 00000000000000dc
!	Mem[0000000030141408] = da8bf3ff, %l7 = 0000000000000000
	ldswa	[%i5+%o4]0x89,%l7	! %l7 = ffffffffda8bf3ff
!	%l3 = 000000000000664a, %l2 = fffffffffffff391, %l0 = 00000000000000f0
	and	%l3,%l2,%l0		! %l0 = 0000000000006200
!	Mem[0000000010181408] = 8fde0df6, %l6 = fca0e75738b6a4c3
	lduwa	[%i6+%o4]0x80,%l6	! %l6 = 000000008fde0df6
!	Starting 10 instruction Store Burst
!	%l7 = ffffffffda8bf3ff, Mem[00000000100c1400] = adfa2920d1055c20
	stxa	%l7,[%i3+%g0]0x80	! Mem[00000000100c1400] = ffffffffda8bf3ff

p0_label_64:
!	%l3 = 000000000000664a, Mem[0000000010081408] = 38b6a4c3
	stwa	%l3,[%i2+%o4]0x88	! Mem[0000000010081408] = 0000664a
!	%f22 = 3de9a4cd, Mem[0000000010101434] = 00000030
	st	%f22,[%i4+0x034]	! Mem[0000000010101434] = 3de9a4cd
!	%f25 = 82913297, %f18 = 000000da, %f0  = 53b5c436
	fadds	%f25,%f18,%f0 		! %l0 = 0000000000006222, Unfinished, %fsr = 0100000800
!	Code Fragment 3
p0_fragment_5:
!	%l0 = 0000000000006222
	setx	0x258788f01b92bffb,%g7,%l0 ! %l0 = 258788f01b92bffb
!	%l1 = 00000000000000dc
	setx	0xe0529077d418827a,%g7,%l1 ! %l1 = e0529077d418827a
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 258788f01b92bffb
	setx	0xc4975337a905ae7c,%g7,%l0 ! %l0 = c4975337a905ae7c
!	%l1 = e0529077d418827a
	setx	0x3f5fecaf84d85b4e,%g7,%l1 ! %l1 = 3f5fecaf84d85b4e
!	%f4  = e431ff94, %f30 = e2ef0000
	fcmpes	%fcc1,%f4 ,%f30		! %fcc1 = 1
!	%f0  = 53b5c436 13b2ab7e, Mem[0000000010001410] = 36c4b553 7eabb213
	stda	%f0 ,[%i0+%o5]0x88	! Mem[0000000010001410] = 53b5c436 13b2ab7e
!	Mem[0000000030101408] = 00000000, %l0 = c4975337a905ae7c
	swapa	[%i4+%o4]0x81,%l0	! %l0 = 0000000000000000
!	%l0 = 0000000000000000, Mem[00000000218000c0] = 5c03524b
	stb	%l0,[%o3+0x0c0]		! Mem[00000000218000c0] = 0003524b
!	%f1  = 13b2ab7e, %f30 = e2ef0000
	fsqrts	%f1 ,%f30		! %f30 = 29973a3b
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = da5068dc, %l7 = ffffffffda8bf3ff
	lduha	[%i6+%o4]0x89,%l7	! %l7 = 00000000000068dc

p0_label_65:
!	Mem[00000000100c1420] = 2029d65965ff6283, %l4 = 00000000f9eb18a8
	ldx	[%i3+0x020],%l4		! %l4 = 2029d65965ff6283
!	Mem[0000000030101400] = 00000000, %l2 = fffffffffffff391
	lduba	[%i4+%g0]0x89,%l2	! %l2 = 0000000000000000
	membar	#Sync			! Added by membar checker (8)
!	Mem[0000000010041400] = de8fd653 d89ca2d7 4a66faad b53976a1
!	Mem[0000000010041410] = 00000000 00000001 4561a35f 742b4bb8
!	Mem[0000000010041420] = 85c5693d ae6f187b 187f9311 41a28ea5
!	Mem[0000000010041430] = 00000030 ffffff84 0cdaef19 4391f86d
	ldda	[%i1]ASI_BLK_AIUPL,%f16	! Block Load from 0000000010041400
!	Mem[00000000100c1410] = 000000dc469c20d5, %f10 = 4a66faad b201a338
	ldda	[%i3+%o5]0x80,%f10	! %f10 = 000000dc 469c20d5
!	%f11 = 469c20d5, %f15 = 66d8ffff
	fcmps	%fcc1,%f11,%f15		! %fcc1 = 1
!	Mem[0000000010081430] = 74ad42b6, %f8  = 59a8db11
	lda	[%i2+0x030]%asi,%f8 	! %f8 = 74ad42b6
!	Mem[0000000020800040] = ffff5107, %l5 = 00000000fff38bda
	ldsb	[%o1+0x040],%l5		! %l5 = ffffffffffffffff
!	Mem[0000000030081410] = 00000000, %l7 = 00000000000068dc
	ldswa	[%i2+%o5]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000010081408] = 4a660000, %l5 = ffffffffffffffff
	ldsba	[%i2+%o4]0x80,%l5	! %l5 = 000000000000004a
!	Starting 10 instruction Store Burst
!	%l5 = 000000000000004a, Mem[0000000010001400] = e7530000
	stwa	%l5,[%i0+%g0]0x80	! Mem[0000000010001400] = 0000004a

p0_label_66:
!	%l1 = 3f5fecaf84d85b4e, Mem[0000000010181411] = ffffd866
	stb	%l1,[%i6+0x011]		! Mem[0000000010181410] = ff4ed866
!	%l6 = 000000008fde0df6, Mem[000000001008142c] = fe07ffff
	stw	%l6,[%i2+0x02c]		! Mem[000000001008142c] = 8fde0df6
!	Mem[0000000010081421] = 6d134e7a, %l1 = 3f5fecaf84d85b4e
	ldstub	[%i2+0x021],%l1		! %l1 = 00000013000000ff
!	%f7  = ffffff7f, Mem[0000000030141408] = da8bf3ff
	sta	%f7 ,[%i5+%o4]0x89	! Mem[0000000030141408] = ffffff7f
!	%l0 = 0000000000000000, Mem[0000000010181408] = 8fde0df6
	stba	%l0,[%i6+%o4]0x80	! Mem[0000000010181408] = 00de0df6
!	%f4  = e431ff94, Mem[0000000010001400] = 0000004a
	sta	%f4 ,[%i0+%g0]0x80	! Mem[0000000010001400] = e431ff94
!	Mem[0000000010181400] = 00000000, %l0 = 0000000000000000
	swapa	[%i6+%g0]0x80,%l0	! %l0 = 0000000000000000
	membar	#Sync			! Added by membar checker (9)
!	%l2 = 0000000000000000, Mem[0000000010041410] = 0100000000000000
	stxa	%l2,[%i1+%o5]0x88	! Mem[0000000010041410] = 0000000000000000
!	Mem[0000000010181408] = 00de0df6, %l6 = 000000008fde0df6
	ldstuba	[%i6+%o4]0x80,%l6	! %l6 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = 00e7f391 ffffffff, %l4 = 65ff6283, %l5 = 0000004a
	ldda	[%i4+0x008]%asi,%l4	! %l4 = 0000000000e7f391 00000000ffffffff

p0_label_67:
!	Mem[0000000030101410] = 000000ff00000000, %l6 = 0000000000000000
	ldxa	[%i4+%o5]0x89,%l6	! %l6 = 000000ff00000000
!	Mem[00000000300c1400] = ffe7ad74, %f25 = 3d69c585
	lda	[%i3+%g0]0x81,%f25	! %f25 = ffe7ad74
!	Mem[0000000010041400] = de8fd653, %l2 = 0000000000000000
	ldsba	[%i1+%g0]0x80,%l2	! %l2 = ffffffffffffffde
!	Mem[0000000010001400] = e431ff94, %f29 = 30000000
	lda	[%i0+%g0]0x80,%f29	! %f29 = e431ff94
!	Mem[0000000010181400] = 0000000096223f5a, %l3 = 000000000000664a
	ldxa	[%i6+%g0]0x80,%l3	! %l3 = 0000000096223f5a
!	Mem[0000000010041408] = 4a66faad, %l2 = ffffffffffffffde
	ldswa	[%i1+%o4]0x80,%l2	! %l2 = 000000004a66faad
!	Mem[0000000030081410] = 00000000, %f2  = 33ac0000
	lda	[%i2+%o5]0x89,%f2 	! %f2 = 00000000
!	Mem[0000000010141418] = 287cc602, %l4 = 0000000000e7f391
	lduwa	[%i5+0x018]%asi,%l4	! %l4 = 00000000287cc602
!	Mem[0000000010081410] = 11dba859, %l3 = 0000000096223f5a
	lduwa	[%i2+%o5]0x88,%l3	! %l3 = 0000000011dba859
!	Starting 10 instruction Store Burst
!	Mem[0000000030041400] = ffffff8f, %l6 = 000000ff00000000
	swapa	[%i1+%g0]0x81,%l6	! %l6 = 00000000ffffff8f

p0_label_68:
!	%f12 = cbbb6fae 6291c585, %l6 = 00000000ffffff8f
!	Mem[0000000030141428] = 7ca997d65b62f46f
	add	%i5,0x028,%g1
	stda	%f12,[%g1+%l6]ASI_PST32_S ! Mem[0000000030141428] = cbbb6fae6291c585
!	%l5 = 00000000ffffffff, Mem[00000000100c1408] = ffd68bda
	stwa	%l5,[%i3+%o4]0x80	! Mem[00000000100c1408] = ffffffff
!	%l2 = 000000004a66faad, Mem[0000000010041410] = 00000000
	stha	%l2,[%i1+%o5]0x88	! Mem[0000000010041410] = 0000faad
!	%l6 = 00000000ffffff8f, Mem[0000000030081408] = ffde0df6
	stba	%l6,[%i2+%o4]0x81	! Mem[0000000030081408] = 8fde0df6
!	Mem[0000000030041408] = 00000091, %l0 = 0000000000000000
	ldstuba	[%i1+%o4]0x89,%l0	! %l0 = 00000091000000ff
!	%f20 = 01000000 00000000, Mem[0000000010181400] = 00000000 96223f5a
	stda	%f20,[%i6+%g0]0x80	! Mem[0000000010181400] = 01000000 00000000
!	%l0 = 0000000000000091, Mem[0000000010081434] = ce4c039b, %asi = 80
	stba	%l0,[%i2+0x034]%asi	! Mem[0000000010081434] = 914c039b
!	%l0 = 0000000000000091, Mem[0000000030181408] = dc6850da
	stwa	%l0,[%i6+%o4]0x81	! Mem[0000000030181408] = 00000091
!	%f30 = 6df89143 19efda0c, Mem[0000000030141400] = b201a338 6be03e31
	stda	%f30,[%i5+%g0]0x89	! Mem[0000000030141400] = 6df89143 19efda0c
!	Starting 10 instruction Load Burst
!	Mem[0000000010101404] = 36c4b553, %l7 = 0000000000000000
	ldsha	[%i4+0x004]%asi,%l7	! %l7 = 00000000000036c4

p0_label_69:
!	Mem[00000000100c1410] = dc000000, %l3 = 0000000011dba859
	lduwa	[%i3+%o5]0x88,%l3	! %l3 = 00000000dc000000
!	Mem[0000000010141410] = 36c4b553, %l5 = 00000000ffffffff
	lduha	[%i5+%o5]0x88,%l5	! %l5 = 000000000000b553
!	Mem[00000000100c1408] = ffffffff 9622db11, %l4 = 287cc602, %l5 = 0000b553
	ldda	[%i3+%o4]0x80,%l4	! %l4 = 00000000ffffffff 000000009622db11
!	%f20 = 01000000 00000000, %f4  = e431ff94 da8bd653
	fdtox	%f20,%f4 		! %f4  = 00000000 00000000
!	Mem[0000000030181408] = 41ddc7bf91000000, %l6 = 00000000ffffff8f
	ldxa	[%i6+%o4]0x89,%l6	! %l6 = 41ddc7bf91000000
!	Mem[00000000100c1408] = ffffffff, %l4 = 00000000ffffffff
	lduba	[%i3+%o4]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030181408] = 00000091bfc7dd41, %f22 = b84b2b74 5fa36145
	ldda	[%i6+%o4]0x81,%f22	! %f22 = 00000091 bfc7dd41
!	Mem[0000000030181408] = 41ddc7bf91000000, %f12 = cbbb6fae 6291c585
	ldda	[%i6+%o4]0x89,%f12	! %f12 = 41ddc7bf 91000000
!	Code Fragment 4
p0_fragment_6:
!	%l0 = 0000000000000091
	setx	0xceb6892039f4f4ed,%g7,%l0 ! %l0 = ceb6892039f4f4ed
!	%l1 = 0000000000000013
	setx	0xa56ba1778ad0fb03,%g7,%l1 ! %l1 = a56ba1778ad0fb03
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = ceb6892039f4f4ed
	setx	0x421564303dd399da,%g7,%l0 ! %l0 = 421564303dd399da
!	%l1 = a56ba1778ad0fb03
	setx	0xe32d4fff905044b7,%g7,%l1 ! %l1 = e32d4fff905044b7
!	Starting 10 instruction Store Burst
!	%f12 = 41ddc7bf, Mem[0000000030001410] = ffffd7dc
	sta	%f12,[%i0+%o5]0x89	! Mem[0000000030001410] = 41ddc7bf

p0_label_70:
!	%f10 = 000000dc 469c20d5, Mem[0000000030001400] = ffffff7f 0000ac33
	stda	%f10,[%i0+%g0]0x81	! Mem[0000000030001400] = 000000dc 469c20d5
!	Mem[00000000100c1410] = dc000000, %l2 = 000000004a66faad
	ldstuba	[%i3+%o5]0x88,%l2	! %l2 = 00000000000000ff
!	%l6 = 41ddc7bf91000000, Mem[00000000100c1408] = ffffffff
	stha	%l6,[%i3+%o4]0x80	! Mem[00000000100c1408] = 0000ffff
!	%l3 = 00000000dc000000, Mem[0000000010181408] = f7f0b105f60ddeff
	stxa	%l3,[%i6+%o4]0x88	! Mem[0000000010181408] = 00000000dc000000
!	Mem[000000001008143c] = 6e9230f0, %l4 = 00000000000000ff, %asi = 80
	swapa	[%i2+0x03c]%asi,%l4	! %l4 = 000000006e9230f0
!	%f20 = 01000000 00000000, Mem[0000000010141410] = 36c4b553 e431ff94
	stda	%f20,[%i5+%o5]0x88	! Mem[0000000010141410] = 01000000 00000000
!	Mem[0000000030181400] = da8bf391, %l1 = e32d4fff905044b7
	ldstuba	[%i6+%g0]0x81,%l1	! %l1 = 000000da000000ff
!	Mem[000000001014142f] = 00000091, %l4 = 000000006e9230f0
	ldstub	[%i5+0x02f],%l4		! %l4 = 00000091000000ff
!	Mem[0000000020800040] = ffff5107, %l0 = 421564303dd399da
	ldstuba	[%o1+0x040]%asi,%l0	! %l0 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = da8bf391, %l3 = 00000000dc000000
	ldswa	[%i1+%o5]0x81,%l3	! %l3 = ffffffffda8bf391

p0_label_71:
!	Mem[0000000010001400] = e431ff94, %l6 = 41ddc7bf91000000
	lduwa	[%i0+%g0]0x80,%l6	! %l6 = 00000000e431ff94
!	Mem[0000000010081410] = 11dba859, %l4 = 0000000000000091
	ldsha	[%i2+%o5]0x88,%l4	! %l4 = ffffffffffffa859
!	Mem[0000000010141408] = f9eb18a8, %l0 = 00000000000000ff
	ldswa	[%i5+%o4]0x88,%l0	! %l0 = fffffffff9eb18a8
!	Mem[00000000100c1408] = ffff0000, %l0 = fffffffff9eb18a8
	ldsba	[%i3+%o4]0x88,%l0	! %l0 = 0000000000000000
!	Mem[00000000218000c0] = 0003524b, %l4 = ffffffffffffa859
	ldub	[%o3+0x0c0],%l4		! %l4 = 0000000000000000
!	Mem[0000000010041410] = adfa0000, %l7 = 00000000000036c4
	lduba	[%i1+%o5]0x80,%l7	! %l7 = 00000000000000ad
!	Mem[0000000010081408] = 4a660000, %l6 = 00000000e431ff94
	ldsba	[%i2+0x00a]%asi,%l6	! %l6 = 0000000000000000
!	Mem[0000000010101408] = ffffffff91f3e700, %l4 = 0000000000000000
	ldxa	[%i4+%o4]0x88,%l4	! %l4 = ffffffff91f3e700
!	Mem[0000000010141408] = a818ebf9ffffffff, %f14 = e2ef0000 66d8ffff
	ldda	[%i5+%o4]0x80,%f14	! %f14 = a818ebf9 ffffffff
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1400] = 74ade7ff, %l2 = 0000000000000000
	swapa	[%i3+%g0]0x89,%l2	! %l2 = 0000000074ade7ff

p0_label_72:
!	Mem[00000000300c1410] = da8bf391, %l4 = ffffffff91f3e700
	ldstuba	[%i3+%o5]0x89,%l4	! %l4 = 00000091000000ff
!	%l2 = 74ade7ff, %l3 = da8bf391, Mem[0000000010101408] = 00e7f391 ffffffff
	stda	%l2,[%i4+%o4]0x80	! Mem[0000000010101408] = 74ade7ff da8bf391
!	%l3 = ffffffffda8bf391, Mem[0000000010041408] = 4a66faad
	stba	%l3,[%i1+%o4]0x80	! Mem[0000000010041408] = 9166faad
!	%f24 = 7b186fae ffe7ad74, %l3 = ffffffffda8bf391
!	Mem[0000000010081438] = ffb08f13000000ff
	add	%i2,0x038,%g1
	stda	%f24,[%g1+%l3]ASI_PST32_P ! Mem[0000000010081438] = ffb08f13ffe7ad74
!	%f26 = a58ea241, Mem[0000000010001400] = e431ff94
	sta	%f26,[%i0+%g0]0x80	! Mem[0000000010001400] = a58ea241
!	%l2 = 74ade7ff, %l3 = da8bf391, Mem[0000000010101408] = 74ade7ff da8bf391
	std	%l2,[%i4+%o4]		! Mem[0000000010101408] = 74ade7ff da8bf391
!	Mem[0000000010001410] = 13b2ab7e, %l3 = ffffffffda8bf391
	ldstuba	[%i0+%o5]0x88,%l3	! %l3 = 0000007e000000ff
!	%f30 = 6df89143, Mem[00000000100c1410] = dc0000ff
	sta	%f30,[%i3+%o5]0x88	! Mem[00000000100c1410] = 6df89143
!	Mem[0000000010041410] = 0000faad, %l4 = 0000000000000091
	swapa	[%i1+%o5]0x88,%l4	! %l4 = 000000000000faad
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = ffe7ad74, %l2 = 0000000074ade7ff
	lduba	[%i4+%o4]0x88,%l2	! %l2 = 0000000000000074

p0_label_73:
!	Mem[0000000030141400] = 0cdaef19, %f11 = 469c20d5
	lda	[%i5+%g0]0x81,%f11	! %f11 = 0cdaef19
!	Mem[0000000010141408] = ffffffff f9eb18a8, %l2 = 00000074, %l3 = 0000007e
	ldda	[%i5+%o4]0x88,%l2	! %l2 = 00000000f9eb18a8 00000000ffffffff
!	Mem[00000000211c0000] = ffdc9ca4, %l2 = 00000000f9eb18a8
	ldub	[%o2+0x001],%l2		! %l2 = 00000000000000dc
!	Mem[0000000010041410] = 00000091, %l3 = 00000000ffffffff
	ldsba	[%i1+%o5]0x88,%l3	! %l3 = ffffffffffffff91
!	Mem[0000000030001408] = 00000001, %l1 = 00000000000000da
	lduba	[%i0+%o4]0x81,%l1	! %l1 = 0000000000000000
!	Mem[00000000100c1400] = ffffffff, %l4 = 000000000000faad
	lduba	[%i3+%g0]0x80,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010001400] = a58ea241, %l3 = ffffffffffffff91
	lduba	[%i0+%g0]0x80,%l3	! %l3 = 00000000000000a5
!	Mem[0000000010181400] = 01000000, %f24 = 7b186fae
	lda	[%i6+%g0]0x80,%f24	! %f24 = 01000000
!	Mem[0000000010101408] = 91f38bda ffe7ad74, %l2 = 000000dc, %l3 = 000000a5
	ldda	[%i4+%o4]0x88,%l2	! %l2 = 00000000ffe7ad74 0000000091f38bda
!	Starting 10 instruction Store Burst
!	Code Fragment 3
p0_fragment_7:
!	%l0 = 0000000000000000
	setx	0xa7b931d7a3934d57,%g7,%l0 ! %l0 = a7b931d7a3934d57
!	%l1 = 0000000000000000
	setx	0x6e9ecae7f4611a17,%g7,%l1 ! %l1 = 6e9ecae7f4611a17
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = a7b931d7a3934d57
	setx	0xcdca04e829a7745a,%g7,%l0 ! %l0 = cdca04e829a7745a
!	%l1 = 6e9ecae7f4611a17
	setx	0xe955333fb2c6703f,%g7,%l1 ! %l1 = e955333fb2c6703f

p0_label_74:
!	%l4 = 00000000000000ff, Mem[0000000030181408] = 00000091bfc7dd41
	stxa	%l4,[%i6+%o4]0x81	! Mem[0000000030181408] = 00000000000000ff
!	Mem[000000001018143a] = 87264796, %l6 = 0000000000000000
	ldstub	[%i6+0x03a],%l6		! %l6 = 00000047000000ff
!	%f6  = 00000000 ffffff7f, %l6 = 0000000000000047
!	Mem[00000000300c1428] = 1543f3259f22289e
	add	%i3,0x028,%g1
	stda	%f6,[%g1+%l6]ASI_PST16_SL ! Mem[00000000300c1428] = 7fffffff0000289e
!	Mem[00000000100c1400] = ffffffff, %l5 = 000000009622db11
	lduba	[%i3+%g0]0x80,%l5	! %l5 = 00000000000000ff
!	%f10 = 000000dc 0cdaef19, Mem[0000000030001408] = 00000001 00000091
	stda	%f10,[%i0+%o4]0x81	! Mem[0000000030001408] = 000000dc 0cdaef19
!	%l1 = e955333fb2c6703f, Mem[000000001004143d] = 4391f86d, %asi = 80
	stba	%l1,[%i1+0x03d]%asi	! Mem[000000001004143c] = 433ff86d
!	%f24 = 01000000 ffe7ad74, Mem[00000000300c1400] = 00000000 00005c03
	stda	%f24,[%i3+%g0]0x81	! Mem[00000000300c1400] = 01000000 ffe7ad74
!	%f2  = 00000000 7fffffff, %l1 = e955333fb2c6703f
!	Mem[0000000010041408] = 9166faadb53976a1
	add	%i1,0x008,%g1
	stda	%f2,[%g1+%l1]ASI_PST8_P ! Mem[0000000010041408] = 916600007fffffff
!	%f16 = d7a29cd8 53d68fde, Mem[0000000030041410] = da8bf391 da000000
	stda	%f16,[%i1+%o5]0x81	! Mem[0000000030041410] = d7a29cd8 53d68fde
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = 91660000, %l0 = cdca04e829a7745a
	lduba	[%i1+%o4]0x80,%l0	! %l0 = 0000000000000091

p0_label_75:
!	Mem[0000000010181438] = 8726ff96, %l6 = 0000000000000047
	ldsw	[%i6+0x038],%l6		! %l6 = ffffffff8726ff96
!	Mem[00000000201c0000] = ffd74b0a, %l0 = 0000000000000091
	lduba	[%o0+0x000]%asi,%l0	! %l0 = 00000000000000ff
!	Mem[000000001010142c] = fff01e7e, %f2  = 00000000
	lda	[%i4+0x02c]%asi,%f2 	! %f2 = fff01e7e
!	Mem[0000000030141410] = 874a68fa, %l0 = 00000000000000ff
	lduwa	[%i5+%o5]0x81,%l0	! %l0 = 00000000874a68fa
!	Mem[0000000021800080] = 9659cffb, %l0 = 00000000874a68fa
	ldsh	[%o3+0x080],%l0		! %l0 = ffffffffffff9659
!	Mem[0000000010181400] = 01000000, %l5 = 00000000000000ff
	ldsha	[%i6+%g0]0x80,%l5	! %l5 = 0000000000000100
!	Mem[0000000030141410] = fa684a87, %l0 = ffffffffffff9659
	lduha	[%i5+%o5]0x89,%l0	! %l0 = 0000000000004a87
!	Mem[0000000010041438] = 0cdaef19, %f22 = 00000091
	lda	[%i1+0x038]%asi,%f22	! %f22 = 0cdaef19
!	Mem[0000000010001400] = 41a28ea5, %l7 = 00000000000000ad
	lduba	[%i0+%g0]0x88,%l7	! %l7 = 00000000000000a5
!	Starting 10 instruction Store Burst
!	%f4  = 00000000 00000000, %l5 = 0000000000000100
!	Mem[0000000010101418] = 035c0000bcd87dbd
	add	%i4,0x018,%g1
	stda	%f4,[%g1+%l5]ASI_PST8_PL ! Mem[0000000010101418] = 035c0000bcd87dbd

p0_label_76:
!	%l2 = 00000000ffe7ad74, Mem[0000000010101430] = 000000003de9a4cd, %asi = 80
	stxa	%l2,[%i4+0x030]%asi	! Mem[0000000010101430] = 00000000ffe7ad74
!	%l6 = ffffffff8726ff96, Mem[0000000010181410] = ff4ed8660000efe2
	stx	%l6,[%i6+%o5]		! Mem[0000000010181410] = ffffffff8726ff96
!	Mem[0000000020800001] = dc2ccc70, %l3 = 0000000091f38bda
	ldstub	[%o1+0x001],%l3		! %l3 = 0000002c000000ff
!	Mem[0000000030101400] = 00000000, %l4 = 00000000000000ff
	ldstuba	[%i4+%g0]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[00000000100c1400] = ffffffff, %l1 = e955333fb2c6703f
	ldstuba	[%i3+%g0]0x88,%l1	! %l1 = 000000ff000000ff
!	Mem[0000000030141410] = 874a68fa, %l4 = 0000000000000000
	swapa	[%i5+%o5]0x81,%l4	! %l4 = 00000000874a68fa
!	%f2  = fff01e7e 7fffffff, Mem[0000000010141400] = 392900ff 23ae5b7c
	stda	%f2 ,[%i5+%g0]0x88	! Mem[0000000010141400] = fff01e7e 7fffffff
!	Mem[00000000100c1434] = 6291c585, %l6 = ffffffff8726ff96
	swap	[%i3+0x034],%l6		! %l6 = 000000006291c585
!	Mem[0000000030001408] = 000000dc, %l1 = 00000000000000ff
	ldstuba	[%i0+%o4]0x81,%l1	! %l1 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = ffabb213, %l4 = 00000000874a68fa
	ldswa	[%i0+%o5]0x80,%l4	! %l4 = ffffffffffabb213

p0_label_77:
!	Mem[0000000030081400] = 0000b638c4ac45a4, %l7 = 00000000000000a5
	ldxa	[%i2+%g0]0x81,%l7	! %l7 = 0000b638c4ac45a4
!	Mem[00000000100c1414] = 469c20d5, %l2 = 00000000ffe7ad74
	ldsba	[%i3+0x015]%asi,%l2	! %l2 = ffffffffffffff9c
!	Mem[0000000010101410] = fff38bda, %l6 = 000000006291c585
	ldswa	[%i4+%o5]0x80,%l6	! %l6 = fffffffffff38bda
!	Mem[00000000300c1400] = 01000000ffe7ad74, %l2 = ffffffffffffff9c
	ldxa	[%i3+%g0]0x81,%l2	! %l2 = 01000000ffe7ad74
!	Mem[00000000100c1408] = 0000ffff9622db11, %f22 = 0cdaef19 bfc7dd41
	ldda	[%i3+%o4]0x80,%f22	! %f22 = 0000ffff 9622db11
!	Mem[00000000100c1400] = ffffffffda8bf3ff, %l3 = 000000000000002c
	ldxa	[%i3+%g0]0x80,%l3	! %l3 = ffffffffda8bf3ff
!	Mem[00000000300c1408] = 00000000, %f13 = 91000000
	lda	[%i3+%o4]0x89,%f13	! %f13 = 00000000
!	Mem[0000000010081400] = 26909cc9 f9eb18a8, %l2 = ffe7ad74, %l3 = da8bf3ff
	ldda	[%i2+%g0]0x88,%l2	! %l2 = 00000000f9eb18a8 0000000026909cc9
!	Mem[0000000010041408] = ffffff7f00006691, %l3 = 0000000026909cc9
	ldxa	[%i1+%o4]0x88,%l3	! %l3 = ffffff7f00006691
!	Starting 10 instruction Store Burst
!	%l4 = ffffffffffabb213, Mem[0000000030001410] = 7ac1db6a41ddc7bf
	stxa	%l4,[%i0+%o5]0x89	! Mem[0000000030001410] = ffffffffffabb213

p0_label_78:
!	Mem[0000000030181408] = 00000000, %l0 = 0000000000004a87
	swapa	[%i6+%o4]0x89,%l0	! %l0 = 0000000000000000
!	%f0  = 53b5c436, Mem[0000000030181400] = 91f38bff
	sta	%f0 ,[%i6+%g0]0x89	! Mem[0000000030181400] = 53b5c436
!	%f21 = 00000000, Mem[0000000010141408] = a818ebf9
	sta	%f21,[%i5+%o4]0x80	! Mem[0000000010141408] = 00000000
!	%l0 = 0000000000000000, Mem[0000000010001408] = f60dde8f
	stha	%l0,[%i0+%o4]0x88	! Mem[0000000010001408] = f60d0000
!	%f28 = 84ffffff e431ff94, %l5 = 0000000000000100
!	Mem[0000000010101408] = 74ade7ffda8bf391
	add	%i4,0x008,%g1
	stda	%f28,[%g1+%l5]ASI_PST32_P ! Mem[0000000010101408] = 74ade7ffda8bf391
!	%f16 = d7a29cd8 53d68fde a17639b5 adfa664a
!	%f20 = 01000000 00000000 0000ffff 9622db11
!	%f24 = 01000000 ffe7ad74 a58ea241 11937f18
!	%f28 = 84ffffff e431ff94 6df89143 19efda0c
	stda	%f16,[%i6]ASI_BLK_SL	! Block Store to 0000000030181400
!	Mem[0000000010141424] = 97ad9100, %l5 = 0000000000000100, %asi = 80
	swapa	[%i5+0x024]%asi,%l5	! %l5 = 0000000097ad9100
!	Mem[00000000300c1410] = da8bf3ff, %l2 = 00000000f9eb18a8
	swapa	[%i3+%o5]0x89,%l2	! %l2 = 00000000da8bf3ff
!	%l0 = 0000000000000000, Mem[00000000100c1413] = 4391f86d
	stb	%l0,[%i3+0x013]		! Mem[00000000100c1410] = 4391f800
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = 00000000f9eb18a8, %l6 = fffffffffff38bda
	ldxa	[%i3+%o5]0x89,%l6	! %l6 = 00000000f9eb18a8

p0_label_79:
!	Mem[0000000010041400] = de8fd653, %l0 = 0000000000000000
	ldsha	[%i1+%g0]0x80,%l0	! %l0 = ffffffffffffde8f
!	Mem[0000000030041410] = d7a29cd8, %l5 = 0000000097ad9100
	lduwa	[%i1+%o5]0x81,%l5	! %l5 = 00000000d7a29cd8
!	Mem[0000000010101408] = ffe7ad74, %l3 = ffffff7f00006691
	lduba	[%i4+%o4]0x88,%l3	! %l3 = 0000000000000074
!	Mem[0000000030101408] = a905ae7c, %f0  = 53b5c436
	lda	[%i4+%o4]0x81,%f0 	! %f0 = a905ae7c
!	Mem[0000000030001408] = ff0000dc, %l0 = ffffffffffffde8f
	lduha	[%i0+%o4]0x81,%l0	! %l0 = 000000000000ff00
	membar	#Sync			! Added by membar checker (10)
!	Mem[0000000010181428] = 6eea0330, %l3 = 0000000000000074
	lduba	[%i6+0x029]%asi,%l3	! %l3 = 00000000000000ea
!	Mem[0000000030101410] = 00000000, %l2 = 00000000da8bf3ff
	ldswa	[%i4+%o5]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000021800180] = ab3de24c, %l0 = 000000000000ff00
	lduh	[%o3+0x180],%l0		! %l0 = 000000000000ab3d
!	Mem[0000000030141408] = ffffff7f, %l0 = 000000000000ab3d
	ldsha	[%i5+%o4]0x89,%l0	! %l0 = ffffffffffffff7f
!	Starting 10 instruction Store Burst
!	%l1 = 0000000000000000, Mem[00000000100c1408] = 11db2296ffff0000
	stxa	%l1,[%i3+%o4]0x88	! Mem[00000000100c1408] = 0000000000000000

p0_label_80:
!	Mem[0000000010001408] = 00000df6, %l4 = ffffffffffabb213
	swapa	[%i0+%o4]0x80,%l4	! %l4 = 0000000000000df6
!	Mem[0000000010081408] = 4a660000, %l6 = 00000000f9eb18a8
	swapa	[%i2+%o4]0x80,%l6	! %l6 = 000000004a660000
!	Mem[000000001014142c] = 000000ff, %l0 = ffffff7f, %l7 = c4ac45a4
	add	%i5,0x2c,%g1
	casa	[%g1]0x80,%l0,%l7	! %l7 = 00000000000000ff
!	%l1 = 0000000000000000, Mem[0000000030141410] = 00000000
	stba	%l1,[%i5+%o5]0x81	! Mem[0000000030141410] = 00000000
!	Mem[0000000010081428] = 5badbd45, %l2 = 0000000000000000
	swap	[%i2+0x028],%l2		! %l2 = 000000005badbd45
!	Mem[0000000010181434] = f0531021, %l2 = 000000005badbd45, %asi = 80
	swapa	[%i6+0x034]%asi,%l2	! %l2 = 00000000f0531021
!	%f10 = 000000dc 0cdaef19, %l4 = 0000000000000df6
!	Mem[0000000010101430] = 00000000ffe7ad74
	add	%i4,0x030,%g1
	stda	%f10,[%g1+%l4]ASI_PST16_PL ! Mem[0000000010101430] = 0000da0cdc00ad74
!	Mem[0000000010101415] = 00ff38a3, %l3 = 00000000000000ea
	ldstuba	[%i4+0x015]%asi,%l3	! %l3 = 000000ff000000ff
!	%l1 = 0000000000000000, Mem[0000000030001408] = dc0000ff
	stwa	%l1,[%i0+%o4]0x89	! Mem[0000000030001408] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = 13b2abff, %l7 = 00000000000000ff
	lduba	[%i0+%o4]0x88,%l7	! %l7 = 00000000000000ff

p0_label_81:
!	Mem[0000000010001410] = ffabb213, %l0 = ffffffffffffff7f
	lduwa	[%i0+%o5]0x80,%l0	! %l0 = 00000000ffabb213
!	Mem[0000000010181410] = ffffffff 8726ff96, %l6 = 4a660000, %l7 = 000000ff
	ldda	[%i6+0x010]%asi,%l6	! %l6 = 00000000ffffffff 000000008726ff96
!	Mem[00000000300c1408] = 00000000, %l3 = 00000000000000ff
	lduha	[%i3+%o4]0x81,%l3	! %l3 = 0000000000000000
!	Mem[00000000100c1400] = ffffffff, %f30 = 6df89143
	lda	[%i3+%g0]0x88,%f30	! %f30 = ffffffff
!	Mem[0000000030041408] = ff000000, %l2 = 00000000f0531021
	ldswa	[%i1+%o4]0x81,%l2	! %l2 = ffffffffff000000
!	Mem[0000000010041410] = 00000091, %l1 = 0000000000000000
	lduha	[%i1+%o5]0x88,%l1	! %l1 = 0000000000000091
!	%l0 = 00000000ffabb213, immed = fffff004, %y  = ffffff32
	smul	%l0,-0xffc,%l0		! %l0 = 00000005438d984c, %y = 00000005
!	Mem[0000000010001408] = ffabb213 c3a4b638, %l6 = ffffffff, %l7 = 8726ff96
	ldd	[%i0+%o4],%l6		! %l6 = 00000000ffabb213 00000000c3a4b638
!	Mem[0000000010181410] = ffffffff, %l2 = ffffffffff000000
	lduwa	[%i6+%o5]0x88,%l2	! %l2 = 00000000ffffffff
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000000df6, Mem[0000000030001408] = 00000000
	stba	%l4,[%i0+%o4]0x89	! Mem[0000000030001408] = 000000f6

p0_label_82:
!	Mem[0000000010141400] = ffffff7f, %l7 = 00000000c3a4b638
	ldstuba	[%i5+%g0]0x80,%l7	! %l7 = 000000ff000000ff
!	%f5  = 00000000, Mem[0000000010081408] = f9eb18a8
	sta	%f5 ,[%i2+%o4]0x80	! Mem[0000000010081408] = 00000000
!	%f19 = adfa664a, Mem[0000000030101410] = 00000000
	sta	%f19,[%i4+%o5]0x81	! Mem[0000000030101410] = adfa664a
!	Mem[00000000300c1400] = 00000001, %l6 = 00000000ffabb213
	ldstuba	[%i3+%g0]0x89,%l6	! %l6 = 00000001000000ff
!	%l7 = 00000000000000ff, Mem[0000000010041408] = 00006691
	stwa	%l7,[%i1+%o4]0x88	! Mem[0000000010041408] = 000000ff
!	Mem[0000000030101410] = 4a66faad, %l1 = 0000000000000091
	ldstuba	[%i4+%o5]0x89,%l1	! %l1 = 000000ad000000ff
!	%l7 = 00000000000000ff, Mem[00000000100c1400] = ffffffff
	stwa	%l7,[%i3+%g0]0x88	! Mem[00000000100c1400] = 000000ff
!	Mem[0000000030001408] = f6000000, %l7 = 00000000000000ff
	swapa	[%i0+%o4]0x81,%l7	! %l7 = 00000000f6000000
!	%l4 = 0000000000000df6, Mem[0000000010081408] = 00000000
	stba	%l4,[%i2+%o4]0x88	! Mem[0000000010081408] = 000000f6
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = 00000000000020d5, %f14 = a818ebf9 ffffffff
	ldda	[%i3+%o4]0x81,%f14	! %f14 = 00000000 000020d5

p0_label_83:
!	Mem[0000000010141408] = 00000000, %l7 = 00000000f6000000
	lduha	[%i5+%o4]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000030181408] = a17639b5adfa664a, %l3 = 0000000000000000
	ldxa	[%i6+%o4]0x89,%l3	! %l3 = a17639b5adfa664a
!	Randomly selected nop
	nop
!	Mem[0000000020800000] = dcffcc70, %l2 = 00000000ffffffff
	ldsb	[%o1+%g0],%l2		! %l2 = ffffffffffffffdc
	membar	#Sync			! Added by membar checker (11)
!	Mem[0000000010041400] = de8fd653 d89ca2d7 ff000000 7fffffff
!	Mem[0000000010041410] = 91000000 00000000 4561a35f 742b4bb8
!	Mem[0000000010041420] = 85c5693d ae6f187b 187f9311 41a28ea5
!	Mem[0000000010041430] = 00000030 ffffff84 0cdaef19 433ff86d
	ldda	[%i1]ASI_BLK_P,%f16	! Block Load from 0000000010041400
!	Mem[00000000300c1410] = a818ebf9, %l4 = 0000000000000df6
	ldsha	[%i3+%o5]0x81,%l4	! %l4 = ffffffffffffa818
!	Mem[0000000030181400] = de8fd653, %l7 = 0000000000000000
	lduwa	[%i6+%g0]0x81,%l7	! %l7 = 00000000de8fd653
!	Mem[00000000100c1410] = d5209c4600f89143, %l4 = ffffffffffffa818
	ldxa	[%i3+%o5]0x88,%l4	! %l4 = d5209c4600f89143
!	Mem[0000000010081408] = 000000f6, %l6 = 0000000000000001
	ldsha	[%i2+%o4]0x88,%l6	! %l6 = 00000000000000f6
!	Starting 10 instruction Store Burst
!	Mem[0000000010141410] = 00000000, %l1 = 00000000000000ad
	swapa	[%i5+%o5]0x80,%l1	! %l1 = 0000000000000000

p0_label_84:
!	%l3 = a17639b5adfa664a, Mem[0000000010081428] = 000000008fde0df6, %asi = 80
	stxa	%l3,[%i2+0x028]%asi	! Mem[0000000010081428] = a17639b5adfa664a
!	%l5 = 00000000d7a29cd8, Mem[0000000021800141] = c157fbbf
	stb	%l5,[%o3+0x141]		! Mem[0000000021800140] = c1d8fbbf
!	%l6 = 00000000000000f6, Mem[0000000030081408] = f60dde8f
	stba	%l6,[%i2+%o4]0x89	! Mem[0000000030081408] = f60ddef6
!	%l3 = a17639b5adfa664a, %l3 = a17639b5adfa664a, %l4  = d5209c4600f89143
	mulx	%l3,%l3,%l4		! %l4 = 5c15fbcff5670d64
!	%f16 = de8fd653 d89ca2d7 ff000000 7fffffff
!	%f20 = 91000000 00000000 4561a35f 742b4bb8
!	%f24 = 85c5693d ae6f187b 187f9311 41a28ea5
!	%f28 = 00000030 ffffff84 0cdaef19 433ff86d
	stda	%f16,[%i2]ASI_BLK_PL	! Block Store to 0000000010081400
!	%l7 = 00000000de8fd653, Mem[0000000030181400] = de8fd653
	stha	%l7,[%i6+%g0]0x81	! Mem[0000000030181400] = d653d653
	membar	#Sync			! Added by membar checker (12)
!	%l7 = 00000000de8fd653, Mem[0000000010041408] = ff000000
	stba	%l7,[%i1+%o4]0x80	! Mem[0000000010041408] = 53000000
!	Mem[00000000100c1432] = cbbb6fae, %l5 = 00000000d7a29cd8
	ldstub	[%i3+0x032],%l5		! %l5 = 0000006f000000ff
!	Mem[0000000010101400] = 28f78e48, %l1 = 0000000000000000
	swapa	[%i4+%g0]0x88,%l1	! %l1 = 0000000028f78e48
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = ff000000, %l0 = 00000005438d984c
	ldswa	[%i0+%o4]0x89,%l0	! %l0 = ffffffffff000000

p0_label_85:
!	Mem[00000000300c1410] = f9eb18a8, %l0 = ffffffffff000000
	lduha	[%i3+%o5]0x89,%l0	! %l0 = 00000000000018a8
!	Mem[000000001014142c] = 000000ff, %l7 = 00000000de8fd653
	ldsh	[%i5+0x02c],%l7		! %l7 = 0000000000000000
!	Mem[00000000100c1410] = 4391f800, %l4 = 5c15fbcff5670d64
	ldswa	[%i3+%o5]0x80,%l4	! %l4 = 000000004391f800
	membar	#Sync			! Added by membar checker (13)
!	Mem[00000000100c1400] = ff000000 da8bf3ff 00000000 00000000
!	Mem[00000000100c1410] = 4391f800 469c20d5 26909cc9 13b2ab7e
!	Mem[00000000100c1420] = 2029d659 65ff6283 93cedfa2 ff8ef728
!	Mem[00000000100c1430] = cbbbffae 8726ff96 ff072081 ddedd791
	ldda	[%i3]ASI_BLK_P,%f0	! Block Load from 00000000100c1400
!	Mem[0000000030181410] = 0000000000000001, %f28 = 00000030 ffffff84
	ldda	[%i6+%o5]0x81,%f28	! %f28 = 00000000 00000001
!	Mem[0000000030081408] = f60ddef6, %l2 = ffffffffffffffdc
	lduwa	[%i2+%o4]0x89,%l2	! %l2 = 00000000f60ddef6
!	%f16 = de8fd653, %f23 = 742b4bb8, %f21 = 00000000
	fadds	%f16,%f23,%f21		! %f21 = 742b4bb8
!	Mem[0000000010001400] = a58ea241, %l2 = 00000000f60ddef6
	ldsba	[%i0+%g0]0x80,%l2	! %l2 = ffffffffffffffa5
!	Mem[0000000030001400] = d5209c46 dc000000, %l4 = 4391f800, %l5 = 0000006f
	ldda	[%i0+%g0]0x89,%l4	! %l4 = 00000000dc000000 00000000d5209c46
!	Starting 10 instruction Store Burst
!	%f16 = de8fd653 d89ca2d7, Mem[0000000030181400] = d653d653 d89ca2d7
	stda	%f16,[%i6+%g0]0x81	! Mem[0000000030181400] = de8fd653 d89ca2d7

p0_label_86:
	membar	#Sync			! Added by membar checker (14)
!	%l7 = 0000000000000000, Mem[00000000100c1410] = 00f89143
	stha	%l7,[%i3+%o5]0x88	! Mem[00000000100c1410] = 00f80000
!	Mem[0000000010081400] = d7a29cd8, %l2 = ffffffffffffffa5
	swapa	[%i2+%g0]0x80,%l2	! %l2 = 00000000d7a29cd8
!	%l4 = 00000000dc000000, Mem[0000000010001410] = ffabb213
	stha	%l4,[%i0+%o5]0x80	! Mem[0000000010001410] = 0000b213
!	Code Fragment 3
p0_fragment_8:
!	%l0 = 00000000000018a8
	setx	0x2762c0b87bd3d20d,%g7,%l0 ! %l0 = 2762c0b87bd3d20d
!	%l1 = 0000000028f78e48
	setx	0x979df6b872301e09,%g7,%l1 ! %l1 = 979df6b872301e09
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 2762c0b87bd3d20d
	setx	0x07a3101816574764,%g7,%l0 ! %l0 = 07a3101816574764
!	%l1 = 979df6b872301e09
	setx	0x58779ad7aeadfa93,%g7,%l1 ! %l1 = 58779ad7aeadfa93
!	%f16 = de8fd653 d89ca2d7, Mem[0000000030181400] = de8fd653 d89ca2d7
	stda	%f16,[%i6+%g0]0x81	! Mem[0000000030181400] = de8fd653 d89ca2d7
!	%l1 = 58779ad7aeadfa93, Mem[0000000030101410] = 4a66faff
	stwa	%l1,[%i4+%o5]0x89	! Mem[0000000030101410] = aeadfa93
!	Mem[0000000030101400] = 000000ff, %l5 = 00000000d5209c46
	swapa	[%i4+%g0]0x89,%l5	! %l5 = 00000000000000ff
!	%f6  = 26909cc9, Mem[0000000010001408] = ffabb213
	sta	%f6 ,[%i0+%o4]0x80	! Mem[0000000010001408] = 26909cc9
!	%l3 = a17639b5adfa664a, Mem[00000000211c0000] = ffdc9ca4
	sth	%l3,[%o2+%g0]		! Mem[00000000211c0000] = 664a9ca4
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = ffffff7f, %l3 = a17639b5adfa664a
	lduha	[%i5+%g0]0x80,%l3	! %l3 = 000000000000ffff

p0_label_87:
!	Mem[00000000100c1418] = 26909cc913b2ab7e, %f0  = ff000000 da8bf3ff
	ldd	[%i3+0x018],%f0 	! %f0  = 26909cc9 13b2ab7e
!	Mem[0000000010041408] = 00000053, %l3 = 000000000000ffff
	ldsha	[%i1+%o4]0x88,%l3	! %l3 = 0000000000000053
!	Mem[0000000021800040] = 8f0131e4, %l7 = 0000000000000000
	lduba	[%o3+0x041]%asi,%l7	! %l7 = 0000000000000001
!	Mem[0000000030141408] = 7fffffff, %l3 = 0000000000000053
	ldsha	[%i5+%o4]0x81,%l3	! %l3 = 0000000000007fff
!	Mem[0000000030101410] = 000000ffaeadfa93, %f18 = ff000000 7fffffff
	ldda	[%i4+%o5]0x89,%f18	! %f18 = 000000ff aeadfa93
!	Mem[00000000100c1408] = 00000000, %l1 = 58779ad7aeadfa93
	ldstuba	[%i3+%o4]0x80,%l1	! %l1 = 00000000000000ff
!	Mem[00000000300c1410] = a818ebf9, %l5 = 00000000000000ff
	lduwa	[%i3+%o5]0x81,%l5	! %l5 = 00000000a818ebf9
!	Mem[00000000100c1400] = 000000ff, %l4 = 00000000dc000000
	lduwa	[%i3+%g0]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030041410] = d7a29cd8, %l3 = 0000000000007fff
	ldsha	[%i1+%o5]0x81,%l3	! %l3 = ffffffffffffd7a2
!	Starting 10 instruction Store Burst
!	%l0 = 07a3101816574764, Mem[0000000030141410] = 00000000
	stwa	%l0,[%i5+%o5]0x89	! Mem[0000000030141410] = 16574764

p0_label_88:
!	Code Fragment 3
p0_fragment_9:
!	%l0 = 07a3101816574764
	setx	0xb1e2fd7fd585cb06,%g7,%l0 ! %l0 = b1e2fd7fd585cb06
!	%l1 = 0000000000000000
	setx	0xe05debe81d3545ea,%g7,%l1 ! %l1 = e05debe81d3545ea
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = b1e2fd7fd585cb06
	setx	0xf55c0a1fcb3e70c6,%g7,%l0 ! %l0 = f55c0a1fcb3e70c6
!	%l1 = e05debe81d3545ea
	setx	0x597af3e7e2826a0a,%g7,%l1 ! %l1 = 597af3e7e2826a0a
!	%f20 = 91000000, %f3  = 00000000, %f25 = ae6f187b
	fmuls	%f20,%f3 ,%f25		! %f25 = 80000000
!	%f20 = 91000000 742b4bb8, Mem[0000000010001400] = a58ea241 ffffffff
	stda	%f20,[%i0+%g0]0x80	! Mem[0000000010001400] = 91000000 742b4bb8
!	%l4 = 00000000000000ff, Mem[000000001018141e] = fea2f974, %asi = 80
	stba	%l4,[%i6+0x01e]%asi	! Mem[000000001018141c] = fea2ff74
!	%l1 = 597af3e7e2826a0a, Mem[0000000010181410] = 96ff2687ffffffff
	stxa	%l1,[%i6+%o5]0x88	! Mem[0000000010181410] = 597af3e7e2826a0a
!	%l5 = 00000000a818ebf9, Mem[0000000030081410] = 0000000091f38bda
	stxa	%l5,[%i2+%o5]0x81	! Mem[0000000030081410] = 00000000a818ebf9
!	%f30 = 0cdaef19, Mem[0000000030181400] = de8fd653
	sta	%f30,[%i6+%g0]0x81	! Mem[0000000030181400] = 0cdaef19
!	%l4 = 00000000000000ff, Mem[0000000010141408] = 00000000ffffffff
	stxa	%l4,[%i5+%o4]0x80	! Mem[0000000010141408] = 00000000000000ff
!	%f14 = ff072081 ddedd791, Mem[0000000010181428] = 6eea0330 000000a8
	stda	%f14,[%i6+0x028]%asi	! Mem[0000000010181428] = ff072081 ddedd791
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = 00000000, %l6 = 00000000000000f6
	ldsha	[%i2+%o5]0x80,%l6	! %l6 = 0000000000000000

p0_label_89:
!	Mem[0000000010001410] = 13b20000, %l0 = f55c0a1fcb3e70c6
	ldswa	[%i0+%o5]0x88,%l0	! %l0 = 0000000013b20000
!	Mem[0000000030081408] = f6de0df6, %l0 = 0000000013b20000
	ldsha	[%i2+%o4]0x81,%l0	! %l0 = fffffffffffff6de
!	Mem[0000000010081410] = 00000000 00000091, %l6 = 00000000, %l7 = 00000001
	ldd	[%i2+%o5],%l6		! %l6 = 0000000000000000 0000000000000091
!	Mem[0000000030181408] = 4a66faad, %l2 = 00000000d7a29cd8
	lduha	[%i6+%o4]0x81,%l2	! %l2 = 0000000000004a66
!	Mem[0000000010141400] = 7fffffff, %l5 = 00000000a818ebf9
	ldsha	[%i5+%g0]0x88,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000030001408] = ff000000, %l6 = 0000000000000000
	lduwa	[%i0+%o4]0x89,%l6	! %l6 = 00000000ff000000
!	Mem[0000000010141400] = ffffff7f, %l7 = 0000000000000091
	lduba	[%i5+%g0]0x80,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010141410] = 000000ad00000001, %f26 = 187f9311 41a28ea5
	ldda	[%i5+%o5]0x80,%f26	! %f26 = 000000ad 00000001
!	Mem[00000000100c1410] = 0000f800 469c20d5, %l0 = fffff6de, %l1 = e2826a0a
	ldda	[%i3+%o5]0x80,%l0	! %l0 = 000000000000f800 00000000469c20d5
!	Starting 10 instruction Store Burst
!	Mem[0000000010041408] = 00000053, %l3 = ffffffffffffd7a2
	ldstuba	[%i1+%o4]0x88,%l3	! %l3 = 00000053000000ff

p0_label_90:
!	Mem[0000000010041400] = de8fd653, %l4 = 00000000000000ff
	ldstuba	[%i1+%g0]0x80,%l4	! %l4 = 000000de000000ff
!	%l5 = ffffffffffffffff, Mem[0000000010181410] = e2826a0a
	stha	%l5,[%i6+%o5]0x88	! Mem[0000000010181410] = e282ffff
!	Mem[0000000010141408] = 00000000, %l7 = 00000000000000ff
	ldstuba	[%i5+%o4]0x80,%l7	! %l7 = 00000000000000ff
!	%l4 = 00000000000000de, Mem[00000000300c1408] = 00000000
	stha	%l4,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00de0000
!	%l7 = 0000000000000000, Mem[0000000010101408] = 91f38bdaffe7ad74
	stxa	%l7,[%i4+%o4]0x88	! Mem[0000000010101408] = 0000000000000000
!	Mem[0000000010141438] = 4a66faad, %l6 = 00000000ff000000
	swap	[%i5+0x038],%l6		! %l6 = 000000004a66faad
!	%f0  = 26909cc9, %f13 = 8726ff96, %f8  = 2029d659
	fdivs	%f0 ,%f13,%f8 		! %f8  = deddaefa
!	%l1 = 00000000469c20d5, Mem[0000000010181408] = 000000dc, %asi = 80
	stwa	%l1,[%i6+0x008]%asi	! Mem[0000000010181408] = 469c20d5
!	Mem[0000000030141400] = 0cdaef19, %l6 = 000000004a66faad
	ldstuba	[%i5+%g0]0x81,%l6	! %l6 = 0000000c000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = 26909cc9c3a4b638, %l0 = 000000000000f800
	ldx	[%i0+%o4],%l0		! %l0 = 26909cc9c3a4b638

p0_label_91:
!	Mem[00000000100c1438] = ff072081ddedd791, %f18 = 000000ff aeadfa93
	ldd	[%i3+0x038],%f18	! %f18 = ff072081 ddedd791
!	Mem[00000000300c1408] = 0000de00, %l7 = 0000000000000000
	lduba	[%i3+%o4]0x89,%l7	! %l7 = 0000000000000000
!	Mem[00000000100c1410] = 00f80000, %l3 = 0000000000000053
	lduwa	[%i3+%o5]0x88,%l3	! %l3 = 0000000000f80000
!	Mem[0000000010081400] = ffffffa553d68fde, %f24 = 85c5693d 80000000
	ldda	[%i2+%g0]0x80,%f24	! %f24 = ffffffa5 53d68fde
!	Mem[000000001008140c] = 000000ff, %l6 = 000000000000000c
	ldswa	[%i2+0x00c]%asi,%l6	! %l6 = 00000000000000ff
!	Mem[0000000020800040] = ffff5107, %l1 = 00000000469c20d5
	lduba	[%o1+0x041]%asi,%l1	! %l1 = 00000000000000ff
!	Mem[00000000201c0000] = ffd74b0a, %l1 = 00000000000000ff
	ldsb	[%o0+0x001],%l1		! %l1 = ffffffffffffffd7
!	Mem[0000000030001408] = 000000ff 0cdaef19, %l4 = 000000de, %l5 = ffffffff
	ldda	[%i0+%o4]0x81,%l4	! %l4 = 00000000000000ff 000000000cdaef19
!	%l5 = 000000000cdaef19, %l5 = 000000000cdaef19, %l1  = ffffffffffffffd7
	mulx	%l5,%l5,%l1		! %l1 = 00a541a66de3b071
!	Starting 10 instruction Store Burst
!	%f1  = 13b2ab7e, Mem[0000000030041410] = d7a29cd8
	sta	%f1 ,[%i1+%o5]0x81	! Mem[0000000030041410] = 13b2ab7e

p0_label_92:
!	Mem[0000000010001400] = 00000091, %l7 = 0000000000000000
	swapa	[%i0+%g0]0x88,%l7	! %l7 = 0000000000000091
!	%l4 = 00000000000000ff, Mem[00000000300c1408] = 0000de00
	stwa	%l4,[%i3+%o4]0x89	! Mem[00000000300c1408] = 000000ff
!	%l2 = 0000000000004a66, Mem[0000000010101410] = a338ff00da8bf3ff
	stxa	%l2,[%i4+%o5]0x88	! Mem[0000000010101410] = 0000000000004a66
!	%l1 = 00a541a66de3b071, Mem[00000000100c1410] = 00f80000
	stba	%l1,[%i3+%o5]0x88	! Mem[00000000100c1410] = 00f80071
!	%l1 = 00a541a66de3b071, Mem[0000000010181428] = ff072081ddedd791
	stx	%l1,[%i6+0x028]		! Mem[0000000010181428] = 00a541a66de3b071
!	%l2 = 0000000000004a66, Mem[0000000010041400] = 53d68fff
	stha	%l2,[%i1+%g0]0x88	! Mem[0000000010041400] = 53d64a66
!	%f24 = ffffffa5 53d68fde, Mem[0000000010181420] = 000000ff f1db96b7
	std	%f24,[%i6+0x020]	! Mem[0000000010181420] = ffffffa5 53d68fde
!	%f23 = 742b4bb8, Mem[0000000010101408] = 00000000
	sta	%f23,[%i4+%o4]0x80	! Mem[0000000010101408] = 742b4bb8
!	%f29 = 00000001, %f4  = 4391f800, %f8  = deddaefa
	fsubs	%f29,%f4 ,%f8 		! %l0 = 26909cc9c3a4b65a, Unfinished, %fsr = 0100000800
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = 19efdaff, %l3 = 0000000000f80000
	ldsba	[%i5+%g0]0x89,%l3	! %l3 = ffffffffffffffff

p0_label_93:
!	Mem[0000000030181410] = 0000000000000001, %f24 = ffffffa5 53d68fde
	ldda	[%i6+%o5]0x81,%f24	! %f24 = 00000000 00000001
!	Mem[0000000030041400] = 00000000, %l5 = 000000000cdaef19
	lduwa	[%i1+%g0]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000010181400] = 01000000, %l0 = 26909cc9c3a4b65a
	lduha	[%i6+%g0]0x80,%l0	! %l0 = 0000000000000100
!	Mem[0000000030001400] = dc000000, %l7 = 0000000000000091
	ldsha	[%i0+%g0]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000010041410] = 00000091, %l0 = 0000000000000100
	ldsha	[%i1+%o5]0x88,%l0	! %l0 = 0000000000000091
!	Mem[00000000201c0000] = ffd74b0a, %l0 = 0000000000000091
	lduh	[%o0+%g0],%l0		! %l0 = 000000000000ffd7
!	Mem[0000000010001410] = 0000b213, %l7 = 0000000000000000
	lduwa	[%i0+0x010]%asi,%l7	! %l7 = 000000000000b213
!	Mem[0000000010081400] = ffffffa5, %f1  = 13b2ab7e
	lda	[%i2+%g0]0x80,%f1 	! %f1 = ffffffa5
!	Mem[0000000010081414] = 00000091, %l2 = 0000000000004a66
	lduw	[%i2+0x014],%l2		! %l2 = 0000000000000091
!	Starting 10 instruction Store Burst
!	%f15 = ddedd791, Mem[0000000010101408] = 742b4bb8
	sta	%f15,[%i4+%o4]0x80	! Mem[0000000010101408] = ddedd791

p0_label_94:
!	Mem[0000000030041408] = ff000000, %l6 = 00000000000000ff
	swapa	[%i1+%o4]0x81,%l6	! %l6 = 00000000ff000000
!	Mem[0000000010141400] = 7fffffff, %l3 = ffffffffffffffff
	ldstuba	[%i5+%g0]0x88,%l3	! %l3 = 000000ff000000ff
!	%l3 = 00000000000000ff, immed = fffff95d, %y  = 00000005
	udiv	%l3,-0x6a3,%l3		! %l3 = 0000000000000005
	mov	%l0,%y			! %y = 0000ffd7
!	%l7 = 000000000000b213, Mem[0000000010181400] = 0000000000000001
	stxa	%l7,[%i6+%g0]0x88	! Mem[0000000010181400] = 000000000000b213
!	Mem[0000000010181408] = 469c20d5, %l2 = 0000000000000091
	swapa	[%i6+%o4]0x80,%l2	! %l2 = 00000000469c20d5
!	Mem[00000000201c0001] = ffd74b0a, %l3 = 0000000000000005
	ldstub	[%o0+0x001],%l3		! %l3 = 000000d7000000ff
!	%l1 = 00a541a66de3b071, Mem[0000000030081408] = f6de0df6
	stba	%l1,[%i2+%o4]0x81	! Mem[0000000030081408] = 71de0df6
!	Mem[0000000010101410] = 00004a66, %l4 = 00000000000000ff
	swapa	[%i4+%o5]0x88,%l4	! %l4 = 0000000000004a66
!	%l0 = 000000000000ffd7, Mem[0000000030141408] = 7fffffffe3ab0000
	stxa	%l0,[%i5+%o4]0x81	! Mem[0000000030141408] = 000000000000ffd7
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = 0000b213, %l6 = 00000000ff000000
	ldsha	[%i6+%g0]0x88,%l6	! %l6 = ffffffffffffb213

p0_label_95:
!	Mem[0000000010041400] = 664ad653, %l1 = 00a541a66de3b071
	ldsh	[%i1+0x002],%l1		! %l1 = ffffffffffffd653
!	Mem[0000000030141400] = 6df89143 19efdaff, %l2 = 469c20d5, %l3 = 000000d7
	ldda	[%i5+%g0]0x89,%l2	! %l2 = 0000000019efdaff 000000006df89143
!	Mem[0000000030141408] = 00000000 0000ffd7, %l4 = 00004a66, %l5 = 00000000
	ldda	[%i5+%o4]0x81,%l4	! %l4 = 0000000000000000 000000000000ffd7
!	Mem[0000000010141408] = ff000000000000ff, %f20 = 91000000 742b4bb8
	ldda	[%i5+%o4]0x80,%f20	! %f20 = ff000000 000000ff
!	Mem[0000000030081408] = f60dde71, %l2 = 0000000019efdaff
	ldsha	[%i2+%o4]0x89,%l2	! %l2 = ffffffffffffde71
!	Mem[0000000030001408] = 000000ff 0cdaef19, %l4 = 00000000, %l5 = 0000ffd7
	ldda	[%i0+%o4]0x81,%l4	! %l4 = 00000000000000ff 000000000cdaef19
!	Mem[0000000010041410] = 9100000000000000, %l6 = ffffffffffffb213
	ldxa	[%i1+%o5]0x80,%l6	! %l6 = 9100000000000000
!	Mem[00000000201c0000] = ffff4b0a, %l0 = 000000000000ffd7
	ldsba	[%o0+0x000]%asi,%l0	! %l0 = ffffffffffffffff
!	Mem[00000000300c1400] = ff000000ffe7ad74, %f18 = ff072081 ddedd791
	ldda	[%i3+%g0]0x81,%f18	! %f18 = ff000000 ffe7ad74
!	Starting 10 instruction Store Burst
!	%l3 = 000000006df89143, Mem[00000000218001c0] = 50411262
	sth	%l3,[%o3+0x1c0]		! Mem[00000000218001c0] = 91431262

p0_label_96:
!	%l7 = 000000000000b213, Mem[00000000300c1410] = a818ebf9
	stba	%l7,[%i3+%o5]0x81	! Mem[00000000300c1410] = 1318ebf9
!	%f0  = 26909cc9 ffffffa5 00000000 00000000
!	%f4  = 4391f800 469c20d5 26909cc9 13b2ab7e
!	%f8  = deddaefa 65ff6283 93cedfa2 ff8ef728
!	%f12 = cbbbffae 8726ff96 ff072081 ddedd791
	stda	%f0,[%i0]ASI_COMMIT_S	! Block Store to 0000000030001400
!	%f16 = de8fd653 d89ca2d7 ff000000 ffe7ad74
!	%f20 = ff000000 000000ff 4561a35f 742b4bb8
!	%f24 = 00000000 00000001 000000ad 00000001
!	%f28 = 00000000 00000001 0cdaef19 433ff86d
	stda	%f16,[%i4]ASI_BLK_AIUSL	! Block Store to 0000000030101400
!	%l6 = 9100000000000000, Mem[0000000030081410] = 00000000
	stha	%l6,[%i2+%o5]0x81	! Mem[0000000030081410] = 00000000
!	%l5 = 000000000cdaef19, Mem[00000000100c1400] = 000000ff
	stba	%l5,[%i3+%g0]0x88	! Mem[00000000100c1400] = 00000019
!	%l3 = 000000006df89143, Mem[00000000300c1400] = 000000ff
	stba	%l3,[%i3+%g0]0x89	! Mem[00000000300c1400] = 00000043
!	%l4 = 000000ff, %l5 = 0cdaef19, Mem[0000000010181408] = 00000091 00000000
	stda	%l4,[%i6+%o4]0x80	! Mem[0000000010181408] = 000000ff 0cdaef19
!	%l2 = ffffffffffffde71, %l0 = ffffffffffffffff, %y  = 0000ffd7
	smul	%l2,%l0,%l3		! %l3 = 000000000000218f, %y = 00000000
!	%f0  = 26909cc9 ffffffa5 00000000 00000000
!	%f4  = 4391f800 469c20d5 26909cc9 13b2ab7e
!	%f8  = deddaefa 65ff6283 93cedfa2 ff8ef728
!	%f12 = cbbbffae 8726ff96 ff072081 ddedd791
	stda	%f0,[%i2]ASI_BLK_AIUPL	! Block Store to 0000000010081400
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (15)
!	Mem[0000000010001410] = 0000b213, %l4 = 00000000000000ff
	ldswa	[%i0+%o5]0x80,%l4	! %l4 = 000000000000b213

p0_label_97:
!	%l2 = ffffffffffffde71, immed = 000005cf, %y  = 00000000
	umul	%l2,0x5cf,%l1		! %l1 = 000005ceff3d125f, %y = 000005ce
!	Mem[0000000010181408] = 19efda0c ff000000, %l6 = 00000000, %l7 = 0000b213
	ldda	[%i6+%o4]0x88,%l6	! %l6 = 00000000ff000000 0000000019efda0c
!	Mem[0000000010041424] = ae6f187b, %f28 = 00000000
	lda	[%i1+0x024]%asi,%f28	! %f28 = ae6f187b
!	Mem[00000000300c1400] = 43000000, %l1 = 000005ceff3d125f
	ldswa	[%i3+%g0]0x81,%l1	! %l1 = 0000000043000000
!	Mem[00000000100c140c] = 00000000, %l1 = 0000000043000000
	lduwa	[%i3+0x00c]%asi,%l1	! %l1 = 0000000000000000
!	Mem[0000000030081400] = 38b60000, %l5 = 000000000cdaef19
	lduha	[%i2+%g0]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000010001410] = 13b20000, %l0 = ffffffffffffffff
	ldsha	[%i0+%o5]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000030041408] = 000000ff, %l0 = 0000000000000000
	ldsba	[%i1+%o4]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000030001410] = 4391f800469c20d5, %l4 = 000000000000b213
	ldxa	[%i0+%o5]0x81,%l4	! %l4 = 4391f800469c20d5
!	Starting 10 instruction Store Burst
!	%l4 = 4391f800469c20d5, Mem[0000000030041408] = ff000000
	stwa	%l4,[%i1+%o4]0x89	! Mem[0000000030041408] = 469c20d5

p0_label_98:
!	%f0  = 26909cc9 ffffffa5 00000000 00000000
!	%f4  = 4391f800 469c20d5 26909cc9 13b2ab7e
!	%f8  = deddaefa 65ff6283 93cedfa2 ff8ef728
!	%f12 = cbbbffae 8726ff96 ff072081 ddedd791
	stda	%f0,[%i4]ASI_BLK_P	! Block Store to 0000000010101400
!	%f30 = 0cdaef19 433ff86d, Mem[0000000030181408] = adfa664a a17639b5
	stda	%f30,[%i6+%o4]0x89	! Mem[0000000030181408] = 0cdaef19 433ff86d
!	Mem[0000000030081410] = 00000000, %l6 = 00000000ff000000
	swapa	[%i2+%o5]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000030041410] = 7eabb213, %l6 = 0000000000000000
	swapa	[%i1+%o5]0x89,%l6	! %l6 = 000000007eabb213
	membar	#Sync			! Added by membar checker (16)
!	Mem[0000000010101410] = 4391f800, %l0 = 0000000000000000
	ldstuba	[%i4+%o5]0x80,%l0	! %l0 = 00000043000000ff
!	Mem[0000000020800040] = ffff5107, %l6 = 000000007eabb213
	ldstub	[%o1+0x040],%l6		! %l6 = 000000ff000000ff
!	Mem[0000000010101400] = 26909cc9, %l6 = 00000000000000ff
	ldstuba	[%i4+%g0]0x80,%l6	! %l6 = 00000026000000ff
!	%f24 = 00000000 00000001, Mem[00000000100c1410] = 00f80071 d5209c46
	stda	%f24,[%i3+%o5]0x88	! Mem[00000000100c1410] = 00000000 00000001
!	Mem[0000000010081410] = d5209c46, %l7 = 0000000019efda0c
	swapa	[%i2+%o5]0x80,%l7	! %l7 = 00000000d5209c46
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = 74ade7ff 000000ff, %l0 = 00000043, %l1 = 00000000
	ldda	[%i4+%o4]0x81,%l0	! %l0 = 0000000074ade7ff 00000000000000ff

p0_label_99:
!	Mem[00000000300c1410] = f9eb1813, %l2 = ffffffffffffde71
	lduha	[%i3+%o5]0x89,%l2	! %l2 = 0000000000001813
!	Mem[0000000010001408] = 26909cc9, %l2 = 0000000000001813
	ldswa	[%i0+%o4]0x80,%l2	! %l2 = 0000000026909cc9
!	Mem[0000000010141410] = ad000000, %f15 = ddedd791
	lda	[%i5+%o5]0x88,%f15	! %f15 = ad000000
!	Mem[0000000010041410] = 91000000, %f26 = 000000ad
	lda	[%i1+%o5]0x80,%f26	! %f26 = 91000000
!	Mem[0000000010141400] = ffffff7f7e1ef0ff, %l1 = 00000000000000ff
	ldxa	[%i5+%g0]0x80,%l1	! %l1 = ffffff7f7e1ef0ff
!	Mem[0000000010181400] = 13b20000, %l4 = 4391f800469c20d5
	ldswa	[%i6+%g0]0x80,%l4	! %l4 = 0000000013b20000
!	Mem[0000000030141408] = d7ff000000000000, %f18 = ff000000 ffe7ad74
	ldda	[%i5+%o4]0x89,%f18	! %f18 = d7ff0000 00000000
!	Mem[0000000010181400] = 13b20000 00000000, %l0 = 74ade7ff, %l1 = 7e1ef0ff
	ldda	[%i6+0x000]%asi,%l0	! %l0 = 0000000013b20000 0000000000000000
!	Mem[0000000010041400] = 53d64a66, %l1 = 0000000000000000
	lduwa	[%i1+%g0]0x88,%l1	! %l1 = 0000000053d64a66
!	Starting 10 instruction Store Burst
!	%l0 = 0000000013b20000, Mem[00000000300c1408] = 000000ff
	stwa	%l0,[%i3+%o4]0x89	! Mem[00000000300c1408] = 13b20000

p0_label_100:
!	%l2 = 0000000026909cc9, Mem[0000000010001410] = 0000b213
	stba	%l2,[%i0+%o5]0x80	! Mem[0000000010001410] = c900b213
!	Mem[0000000030081408] = f60dde71, %l7 = 00000000d5209c46
	swapa	[%i2+%o4]0x89,%l7	! %l7 = 00000000f60dde71
!	%l0 = 13b20000, %l1 = 53d64a66, Mem[0000000030141408] = 00000000 d7ff0000
	stda	%l0,[%i5+%o4]0x89	! Mem[0000000030141408] = 13b20000 53d64a66
!	%l1 = 0000000053d64a66, Mem[0000000010141418] = 287cc602ffde6c9b, %asi = 80
	stxa	%l1,[%i5+0x018]%asi	! Mem[0000000010141418] = 0000000053d64a66
!	%f18 = d7ff0000 00000000, Mem[0000000010041410] = 00000091 00000000
	stda	%f18,[%i1+%o5]0x88	! Mem[0000000010041410] = d7ff0000 00000000
!	Mem[0000000030181408] = 433ff86d, %l1 = 0000000053d64a66
	swapa	[%i6+%o4]0x89,%l1	! %l1 = 00000000433ff86d
!	Mem[0000000010101410] = ff91f800, %l0 = 0000000013b20000
	swapa	[%i4+%o5]0x80,%l0	! %l0 = 00000000ff91f800
!	%l6 = 0000000000000026, Mem[0000000010101400] = c99c90ff
	stwa	%l6,[%i4+%g0]0x88	! Mem[0000000010101400] = 00000026
!	Mem[0000000010101410] = 13b20000, %l1 = 00000000433ff86d
	swapa	[%i4+%o5]0x80,%l1	! %l1 = 0000000013b20000
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = 00000001, %l6 = 0000000000000026
	ldsba	[%i3+%o5]0x88,%l6	! %l6 = 0000000000000001

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
	cmp	%l0,%g2			! %l0 should be 00000000ff91f800
	bne,a,pn %xcc,p0_reg_l0_fail
	mov	%l0,%g3
	ldx	[%g1+0x008],%g2
	cmp	%l1,%g2			! %l1 should be 0000000013b20000
	bne,a,pn %xcc,p0_reg_l1_fail
	mov	%l1,%g3
	ldx	[%g1+0x010],%g2
	cmp	%l2,%g2			! %l2 should be 0000000026909cc9
	bne,a,pn %xcc,p0_reg_l2_fail
	mov	%l2,%g3
	ldx	[%g1+0x018],%g2
	cmp	%l3,%g2			! %l3 should be 000000000000218f
	bne,a,pn %xcc,p0_reg_l3_fail
	mov	%l3,%g3
	ldx	[%g1+0x020],%g2
	cmp	%l4,%g2			! %l4 should be 0000000013b20000
	bne,a,pn %xcc,p0_reg_l4_fail
	mov	%l4,%g3
	ldx	[%g1+0x028],%g2
	cmp	%l5,%g2			! %l5 should be 0000000000000000
	bne,a,pn %xcc,p0_reg_l5_fail
	mov	%l5,%g3
	ldx	[%g1+0x030],%g2
	cmp	%l6,%g2			! %l6 should be 0000000000000001
	bne,a,pn %xcc,p0_reg_l6_fail
	mov	%l6,%g3
	ldx	[%g1+0x038],%g2
	cmp	%l7,%g2			! %l7 should be 00000000f60dde71
	bne,a,pn %xcc,p0_reg_l7_fail
	mov	%l7,%g3

!	Check %y register

	set	0x000005ce,%g2
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
	cmp	%l0,%l1			! %f0  should be 26909cc9 ffffffa5
	bne	%xcc,p0_f0_fail
	std	%f2,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x08],%l0
	cmp	%l0,%l1			! %f2  should be 00000000 00000000
	bne	%xcc,p0_f2_fail
	std	%f4,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x10],%l0
	cmp	%l0,%l1			! %f4  should be 4391f800 469c20d5
	bne	%xcc,p0_f4_fail
	std	%f6,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x18],%l0
	cmp	%l0,%l1			! %f6  should be 26909cc9 13b2ab7e
	bne	%xcc,p0_f6_fail
	std	%f8,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x20],%l0
	cmp	%l0,%l1			! %f8  should be deddaefa 65ff6283
	bne	%xcc,p0_f8_fail
	std	%f10,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x28],%l0
	cmp	%l0,%l1			! %f10 should be 93cedfa2 ff8ef728
	bne	%xcc,p0_f10_fail
	std	%f12,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x30],%l0
	cmp	%l0,%l1			! %f12 should be cbbbffae 8726ff96
	bne	%xcc,p0_f12_fail
	std	%f14,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x38],%l0
	cmp	%l0,%l1			! %f14 should be ff072081 ad000000
	bne	%xcc,p0_f14_fail
	std	%f16,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x40],%l0
	cmp	%l0,%l1			! %f16 should be de8fd653 d89ca2d7
	bne	%xcc,p0_f16_fail
	std	%f18,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x48],%l0
	cmp	%l0,%l1			! %f18 should be d7ff0000 00000000
	bne	%xcc,p0_f18_fail
	std	%f20,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x50],%l0
	cmp	%l0,%l1			! %f20 should be ff000000 000000ff
	bne	%xcc,p0_f20_fail
	std	%f22,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x58],%l0
	cmp	%l0,%l1			! %f22 should be 4561a35f 742b4bb8
	bne	%xcc,p0_f22_fail
	std	%f24,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x60],%l0
	cmp	%l0,%l1			! %f24 should be 00000000 00000001
	bne	%xcc,p0_f24_fail
	std	%f26,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x68],%l0
	cmp	%l0,%l1			! %f26 should be 91000000 00000001
	bne	%xcc,p0_f26_fail
	std	%f28,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x70],%l0
	cmp	%l0,%l1			! %f28 should be ae6f187b 00000001
	bne	%xcc,p0_f28_fail
	std	%f30,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x78],%l0
	cmp	%l0,%l1			! %f30 should be 0cdaef19 433ff86d
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
	.word	0x00000000,0xff91f800
	.word	0x00000000,0x13b20000
	.word	0x00000000,0x26909cc9
	.word	0x00000000,0x0000218f
	.word	0x00000000,0x13b20000
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000001
	.word	0x00000000,0xf60dde71
p0_expected_fp_regs:
	.word	0x26909cc9,0xffffffa5
	.word	0x00000000,0x00000000
	.word	0x4391f800,0x469c20d5
	.word	0x26909cc9,0x13b2ab7e
	.word	0xdeddaefa,0x65ff6283
	.word	0x93cedfa2,0xff8ef728
	.word	0xcbbbffae,0x8726ff96
	.word	0xff072081,0xad000000
	.word	0xde8fd653,0xd89ca2d7
	.word	0xd7ff0000,0x00000000
	.word	0xff000000,0x000000ff
	.word	0x4561a35f,0x742b4bb8
	.word	0x00000000,0x00000001
	.word	0x91000000,0x00000001
	.word	0xae6f187b,0x00000001
	.word	0x0cdaef19,0x433ff86d
	.word	0x00000001,0x00000800		! %fsr = 0000000100000800
p0_local0_expect:
	.word	0x00000000,0x742b4bb8
	.word	0x26909cc9,0xc3a4b638
	.word	0xc900b213,0x36c4b553
	.word	0xffbf5604,0xbef1adf8
	.word	0x00000000,0x0000002c
	.word	0x00000000,0xc9ff52b0
	.word	0xa818ebf9,0xc99c9026
	.word	0xaa5e0439,0xe4318b94
p0_local0_sec_expect:
	.word	0x26909cc9,0xffffffa5
	.word	0x00000000,0x00000000
	.word	0x4391f800,0x469c20d5
	.word	0x26909cc9,0x13b2ab7e
	.word	0xdeddaefa,0x65ff6283
	.word	0x93cedfa2,0xff8ef728
	.word	0xcbbbffae,0x8726ff96
	.word	0xff072081,0xddedd791
p0_local1_expect:
	.word	0x664ad653,0xd89ca2d7
	.word	0xff000000,0x7fffffff
	.word	0x00000000,0x0000ffd7
	.word	0x4561a35f,0x742b4bb8
	.word	0x85c5693d,0xae6f187b
	.word	0x187f9311,0x41a28ea5
	.word	0x00000030,0xffffff84
	.word	0x0cdaef19,0x433ff86d
p0_local1_sec_expect:
	.word	0x00000000,0x00000091
	.word	0xd5209c46,0x96223f5a
	.word	0x00000000,0x53d68fde
	.word	0x19fcaf81,0x13b2ab7e
	.word	0x2029d659,0x659a6283
	.word	0x93cedfa2,0x488ef728
	.word	0xcbbb6fae,0x6291c585
	.word	0xb7072081,0xddedd791
p0_local2_expect:
	.word	0xa5ffffff,0xc99c9026
	.word	0x00000000,0x00000000
	.word	0x19efda0c,0x00f89143
	.word	0x7eabb213,0xc99c9026
	.word	0x8362ff65,0xfaaeddde
	.word	0x28f78eff,0xa2dfce93
	.word	0x96ff2687,0xaeffbbcb
	.word	0x91d7eddd,0x812007ff
p0_local2_sec_expect:
	.word	0x0000b638,0xc4ac45a4
	.word	0x469c20d5,0xf3265385
	.word	0xff000000,0xa818ebf9
	.word	0xd600f5c9,0xe42f8f42
	.word	0xa0c1274c,0x89ee0440
	.word	0x000000ff,0x460d3245
	.word	0xb56347bb,0xd7527b5c
	.word	0xb83f1bed,0x36761e38
p0_local3_expect:
	.word	0x19000000,0xda8bf3ff
	.word	0xff000000,0x00000000
	.word	0x01000000,0x00000000
	.word	0x26909cc9,0x13b2ab7e
	.word	0x2029d659,0x65ff6283
	.word	0x93cedfa2,0xff8ef728
	.word	0xcbbbffae,0x8726ff96
	.word	0xff072081,0xddedd791
p0_local3_sec_expect:
	.word	0x43000000,0xffe7ad74
	.word	0x0000b213,0x000020d5
	.word	0x1318ebf9,0x00000000
	.word	0xa1849e15,0xe9ec6e35
	.word	0xa41f9c7f,0x333b1e6d
	.word	0x7fffffff,0x0000289e
	.word	0x2394a739,0xe4d90ce9
	.word	0xf0fb41ef,0x3a393cd3
p0_local4_expect:
	.word	0x26000000,0xffffffa5
	.word	0x00000000,0x00000000
	.word	0x433ff86d,0x469c20d5
	.word	0x26909cc9,0x13b2ab7e
	.word	0xdeddaefa,0x65ff6283
	.word	0x93cedfa2,0xff8ef728
	.word	0xcbbbffae,0x8726ff96
	.word	0xff072081,0xddedd791
p0_local4_sec_expect:
	.word	0xd7a29cd8,0x53d68fde
	.word	0x74ade7ff,0x000000ff
	.word	0xff000000,0x000000ff
	.word	0xb84b2b74,0x5fa36145
	.word	0x01000000,0x00000000
	.word	0x01000000,0xad000000
	.word	0x01000000,0x00000000
	.word	0x6df83f43,0x19efda0c
p0_local5_expect:
	.word	0xffffff7f,0x7e1ef0ff
	.word	0xff000000,0x000000ff
	.word	0x000000ad,0x00000001
	.word	0x00000000,0x53d64a66
	.word	0xf9eb18a8,0x00000100
	.word	0xffffffe7,0x000000ff
	.word	0xbc81e290,0xababc67c
	.word	0xff000000,0xda8bf391
p0_local5_sec_expect:
	.word	0xffdaef19,0x4391f86d
	.word	0x0000b213,0x664ad653
	.word	0x64475716,0x174dcda7
	.word	0xfca0e757,0xa445acc4
	.word	0x3880263c,0x2c000000
	.word	0xcbbb6fae,0x6291c585
	.word	0x4a66faad,0xda8bf391
	.word	0x948b31e4,0x39045eaa
p0_local6_expect:
	.word	0x13b20000,0x00000000
	.word	0x000000ff,0x0cdaef19
	.word	0xffff82e2,0xe7f37a59
	.word	0xc7cb53a7,0xfea2ff74
	.word	0xffffffa5,0x53d68fde
	.word	0x00a541a6,0x6de3b071
	.word	0xf05220da,0x5badbd45
	.word	0x8726ff96,0x948b31e4
p0_local6_sec_expect:
	.word	0x0cdaef19,0xd89ca2d7
	.word	0x664ad653,0x19efda0c
	.word	0x00000000,0x00000001
	.word	0x11db2296,0xffff0000
	.word	0x74ade7ff,0x00000001
	.word	0x187f9311,0x41a28ea5
	.word	0x94ff31e4,0xffffff84
	.word	0x0cdaef19,0x4391f86d
share0_expect:
	.word	0xffff4b0a,0xa015fbb8
	.word	0xd006cee5,0xadae0463
	.word	0xcda55787,0x674c324c
	.word	0xd478341c,0x4cc202b5
	.word	0x416664f2,0x16f8ff6e
	.word	0x1836cdbc,0xbc6de3fe
	.word	0xb7cc2f21,0x171b4bb1
	.word	0x2b88f69c,0xb3efb29a
share1_expect:
	.word	0xdcffcc70,0xe2246932
	.word	0x23c2c571,0x0a5e9d5a
	.word	0x8bb9c35b,0xe06146a2
	.word	0xd22a98ea,0x0ffee334
	.word	0xc00732c3,0xcefb61e7
	.word	0x97869f49,0x2e0fc7bb
	.word	0x6882246b,0xc8cc8479
	.word	0xac56fcab,0xc4de480d
	.word	0xffff5107,0xabd016d1
	.word	0x12c30bd5,0x82ffa0d1
	.word	0xbd69f212,0xb5cea487
	.word	0x0ea7636b,0xc668b818
	.word	0xf0e19c9d,0x12fcbbae
	.word	0x67e99d25,0xc4132e70
	.word	0x10beff96,0x59f47a97
	.word	0x7916841d,0x172a965e
share2_expect:
	.word	0x664a9ca4,0x40ae98dd
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
	.word	0x8f0131e4,0xa4936c27
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
	.word	0x0003524b,0x6a7030f9
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
	.word	0xc1d8fbbf,0x546675f2
	.word	0xedaf83de,0xb89e5e24
	.word	0x114393bc,0x4e0fda12
	.word	0xb2326352,0xd1ff780f
	.word	0x7b0e70fd,0x40e19ede
	.word	0xb3c5e459,0x17ced733
	.word	0x126e0682,0x0542c8c2
	.word	0xc0ad70ee,0xec9355be
	.word	0xab3de24c,0x7b013a10
	.word	0x05bf5584,0x459d6ba0
	.word	0x69e1801f,0x24573811
	.word	0x21680597,0x854bc288
	.word	0x65fe244a,0xbf9b2ba6
	.word	0xab4aedfb,0x8bf533bf
	.word	0x0d2cedc7,0x5dd88594
	.word	0xe9ce4879,0xd579ffa4
	.word	0x91431262,0x336503f1
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
