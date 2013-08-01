/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: mpgen_5000l.s
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
!	Seed = 325162124
!	Riesling can be on
!	1 Thread, 5000 lines
!	mpgen   created on Dec 20, 2005 (16:35:03)
!	mpgen_50000l.s created on Mar 25, 2009 (16:21:24)
!	RC file : mar25.rc
!	cmd = /import/n2-tools/release/tools/mpgen/mpgen,1.051220 -rc mar25.rc -o mpgen_50000l -p 1 -l 5000

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
!	%f0  = d398ac8f ff4428ca c05d49e5 b4f860ef
!	%f4  = 327e3b9b ef4ab9ef 20ec6b32 160b7fe5
!	%f8  = 3f5ca94c 1b027c8b 9ea2a36c 9fb12702
!	%f12 = 3989b8f2 d9cda08e aed9d046 7df3dc00
	ldda	[%g1]ASI_BLK_P,%f0
	add	%g1,64,%g1
!	%f16 = 215fe61d a12eb42c 3f127f49 94997547
!	%f20 = 0bde65d1 3385fac5 674d90c5 783346bf
!	%f24 = 112ffdec b1379adf 46a572a3 cb650bfe
!	%f28 = 065f771e 4241725d 71ffcb32 ef0e491b
	ldda	[%g1]ASI_BLK_P,%f16
	add	%g1,64,%g1
!	%f32 = 6fe25ce9 d2184891 4bf782e2 2d2a9d56
!	%f36 = b622dd8e 3134e536 eed39605 f4d83dc5
!	%f40 = 0a450520 e6f76e0a a3be5aa6 131edb79
!	%f44 = edf34df5 4d57b1c9 bb8fabf5 6a43bdf6
	ldda	[%g1]ASI_BLK_P,%f32

!	Set up the Graphics Status Register

	setx	0x1d26905700000056,%g7,%g1 ! GSR scale = 10, align = 6
	wr	%g1,%g0,%gsr		! GSR = 1d26905700000056
	wr	%g0,%y			! Clear Y register
	xorcc	%g0,%g0,%g3		! init %g3 and set flags
	membar	#Sync			! Force the block loads to complete

!	Start of Random Code for processor 0

p0_label_1:
!	%f28 = 065f771e 4241725d, Mem[0000000010181400] = c25b14bc b0195d80
	stda	%f28,[%i6+%g0]0x80	! Mem[0000000010181400] = 065f771e 4241725d
!	Mem[0000000010081410] = f4639d23, %l7 = 0225c199f4ff286c
	lduba	[%i2+%o5]0x80,%l7	! %l7 = 00000000000000f4
!	Mem[00000000300c1408] = 1d3235f7, %l6 = f4c78770cd3cb229
	ldsba	[%i3+%o4]0x89,%l6	! %l6 = fffffffffffffff7
!	%l4 = 378f565e264e39e7, Mem[00000000211c0000] = 230e7bbb, %asi = 80
	stha	%l4,[%o2+0x000]%asi	! Mem[00000000211c0000] = 39e77bbb
!	Mem[0000000021800000] = 1a7bd0b4, %l7 = 00000000000000f4
	ldsha	[%o3+0x000]%asi,%l7	! %l7 = 0000000000001a7b
!	%l4 = 264e39e7, %l5 = 4dfacbb7, Mem[0000000030041410] = 6c3d21e8 f2c95706
	stda	%l4,[%i1+%o5]0x81	! Mem[0000000030041410] = 264e39e7 4dfacbb7
!	Mem[0000000010001420] = e89e10b4, %f24 = 112ffdec
	ld	[%i0+0x020],%f24	! %f24 = e89e10b4
!	%l6 = fffffffffffffff7, Mem[0000000010001400] = 89e6f7f8
	stba	%l6,[%i0+%g0]0x80	! Mem[0000000010001400] = f7e6f7f8
!	Mem[0000000030101400] = 582a190f, %l2 = 6de6b199fded1bc2
	lduha	[%i4+%g0]0x81,%l2	! %l2 = 000000000000582a
!	Starting 10 instruction Store Burst
!	%l7 = 0000000000001a7b, Mem[0000000010081410] = 4686a0d6239d63f4
	stxa	%l7,[%i2+%o5]0x88	! Mem[0000000010081410] = 0000000000001a7b

p0_label_2:
!	Mem[0000000030181410] = 113346d6, %l4 = 378f565e264e39e7
	swapa	[%i6+%o5]0x89,%l4	! %l4 = 00000000113346d6
!	%f12 = 3989b8f2 d9cda08e, Mem[0000000010141418] = 1dab3894 da297551
	std	%f12,[%i5+0x018]	! Mem[0000000010141418] = 3989b8f2 d9cda08e
!	Mem[00000000100c1410] = 9ff0dd33, %l5 = c2e009084dfacbb7
	swapa	[%i3+%o5]0x88,%l5	! %l5 = 000000009ff0dd33
!	%l2 = 0000582a, %l3 = 1976768a, Mem[0000000010081410] = 7b1a0000 00000000
	stda	%l2,[%i2+%o5]0x80	! Mem[0000000010081410] = 0000582a 1976768a
!	Mem[0000000010081400] = 08cbc1aa, %l0 = f3570731b220bd9e
	swapa	[%i2+%g0]0x80,%l0	! %l0 = 0000000008cbc1aa
!	Mem[000000001010142f] = a3fb3cf0, %l2 = 000000000000582a
	ldstuba	[%i4+0x02f]%asi,%l2	! %l2 = 000000f0000000ff
!	%f22 = 674d90c5, Mem[0000000010141408] = ae3b0698
	sta	%f22,[%i5+%o4]0x88	! Mem[0000000010141408] = 674d90c5
!	%f28 = 065f771e 4241725d, %l1 = 03a34c5ec743fb63
!	Mem[0000000030181400] = 6885d15fe03279c1
	stda	%f28,[%i6+%l1]ASI_PST32_SL ! Mem[0000000030181400] = 5d7241421e775f06
!	%l6 = fffffffffffffff7, Mem[0000000030181400] = 5d724142
	stba	%l6,[%i6+%g0]0x81	! Mem[0000000030181400] = f7724142
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = 31efa1df, %l6 = fffffffffffffff7
	lduwa	[%i0+%o5]0x88,%l6	! %l6 = 0000000031efa1df

p0_label_3:
!	Mem[0000000030081410] = e50b1055, %l7 = 0000000000001a7b
	lduba	[%i2+%o5]0x81,%l7	! %l7 = 00000000000000e5
!	Mem[0000000010001408] = ce936ef3, %l1 = 03a34c5ec743fb63
	lduwa	[%i0+%o4]0x88,%l1	! %l1 = 00000000ce936ef3
!	Mem[0000000010001410] = dfa1ef31eb105ae1, %l5 = 000000009ff0dd33
	ldx	[%i0+%o5],%l5		! %l5 = dfa1ef31eb105ae1
!	Mem[0000000010001414] = eb105ae1, %l0 = 0000000008cbc1aa
	ldswa	[%i0+0x014]%asi,%l0	! %l0 = ffffffffeb105ae1
!	Mem[0000000010041418] = 2a31f72c, %l5 = dfa1ef31eb105ae1
	ldsba	[%i1+0x01a]%asi,%l5	! %l5 = fffffffffffffff7
!	Mem[0000000020800040] = 7f87ac70, %l7 = 00000000000000e5
	ldsb	[%o1+0x041],%l7		! %l7 = ffffffffffffff87
!	Mem[0000000010081408] = 69316803, %l4 = 00000000113346d6
	lduwa	[%i2+%o4]0x88,%l4	! %l4 = 0000000069316803
!	Mem[0000000030141400] = f03dc358, %l6 = 0000000031efa1df
	lduba	[%i5+%g0]0x81,%l6	! %l6 = 00000000000000f0
!	Mem[0000000030041408] = 59971743, %l0 = ffffffffeb105ae1
	ldsha	[%i1+%o4]0x81,%l0	! %l0 = 0000000000005997
!	Starting 10 instruction Store Burst
!	Mem[00000000201c0000] = 8c2aaf65, %l2 = 00000000000000f0
	ldstuba	[%o0+0x000]%asi,%l2	! %l2 = 0000008c000000ff

p0_label_4:
!	%l7 = ffffffffffffff87, Mem[00000000211c0000] = 39e77bbb, %asi = 80
	stha	%l7,[%o2+0x000]%asi	! Mem[00000000211c0000] = ff877bbb
!	%l4 = 69316803, %l5 = fffffff7, Mem[0000000010101428] = 772844fd a3fb3cff
	stda	%l4,[%i4+0x028]%asi	! Mem[0000000010101428] = 69316803 fffffff7
!	%f14 = aed9d046, Mem[0000000030181410] = e7394e26
	sta	%f14,[%i6+%o5]0x81	! Mem[0000000030181410] = aed9d046
!	%f2  = c05d49e5, Mem[0000000010001424] = 7781bcc3
	st	%f2 ,[%i0+0x024]	! Mem[0000000010001424] = c05d49e5
!	Mem[0000000030041400] = 77338946, %l0 = 0000000000005997
	ldstuba	[%i1+%g0]0x81,%l0	! %l0 = 00000077000000ff
!	%l1 = 00000000ce936ef3, Mem[0000000010081408] = 03683169
	stba	%l1,[%i2+%o4]0x80	! Mem[0000000010081408] = f3683169
!	%l0 = 0000000000000077, Mem[0000000010041408] = 2b48408d
	stwa	%l0,[%i1+%o4]0x88	! Mem[0000000010041408] = 00000077
!	Mem[0000000010081430] = 1d2636253c6cb36d, %l5 = fffffffffffffff7, %l4 = 0000000069316803
	add	%i2,0x30,%g1
	casxa	[%g1]0x80,%l5,%l4	! %l4 = 1d2636253c6cb36d
!	Mem[0000000010001410] = 31efa1df, %l6 = 00000000000000f0
	ldstuba	[%i0+%o5]0x88,%l6	! %l6 = 000000df000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = 334ff227, %l6 = 00000000000000df
	lduwa	[%i6+%o4]0x80,%l6	! %l6 = 00000000334ff227

p0_label_5:
!	Mem[0000000030101408] = 65576254, %l6 = 00000000334ff227
	ldsha	[%i4+%o4]0x81,%l6	! %l6 = 0000000000006557
	membar	#Sync			! Added by membar checker (1)
!	Mem[0000000010181400] = 065f771e 4241725d 334ff227 d78771e8
!	Mem[0000000010181410] = ab71f314 e2a61342 14b471b9 26617a8e
!	Mem[0000000010181420] = 4f61277f e46cbd64 1657e49d ba94c2f1
!	Mem[0000000010181430] = 1a1efd06 b2f265c0 a96e6a5a 864fc963
	ldda	[%i6]ASI_BLK_P,%f0	! Block Load from 0000000010181400
!	Mem[0000000010141410] = 0438326f, %l6 = 0000000000006557
	ldsha	[%i5+%o5]0x80,%l6	! %l6 = 0000000000000438
!	Mem[0000000030001408] = 76cc0dcc, %l7 = ffffffffffffff87
	lduba	[%i0+%o4]0x81,%l7	! %l7 = 0000000000000076
!	Mem[0000000010141410] = 6f323804, %l3 = 8d1c5c5c1976768a
	lduba	[%i5+%o5]0x88,%l3	! %l3 = 0000000000000004
!	Mem[0000000010041410] = aebb5bfd, %f25 = b1379adf
	ld	[%i1+%o5],%f25	! %f25 = aebb5bfd
!	Mem[0000000030101408] = 65576254, %l1 = 00000000ce936ef3
	lduwa	[%i4+%o4]0x81,%l1	! %l1 = 0000000065576254
!	Mem[0000000030041410] = 264e39e7, %l6 = 0000000000000438
	ldsba	[%i1+%o5]0x81,%l6	! %l6 = 0000000000000026
!	Mem[0000000030181408] = 759aa53f, %l2 = 000000000000008c
	lduba	[%i6+%o4]0x89,%l2	! %l2 = 000000000000003f
!	Starting 10 instruction Store Burst
!	Mem[00000000211c0000] = ff877bbb, %l7 = 0000000000000076
	ldstuba	[%o2+0x000]%asi,%l7	! %l7 = 000000ff000000ff

!	Check Point 1 for processor 0

	set	p0_check_pt_data_1,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 0000000000000077
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 0000000065576254
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 000000000000003f
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 0000000000000004
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 1d2636253c6cb36d
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = fffffffffffffff7
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 0000000000000026
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = 065f771e 4241725d
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x50],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = 334ff227 d78771e8
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x58],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = ab71f314 e2a61342
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x60],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 14b471b9 26617a8e
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x68],%g3
	std	%f8,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f8 = 4f61277f e46cbd64
	bne	%xcc,p0_freg_check_fail
	mov	0xf08,%g1
	ldx	[%g4+0x70],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = 1657e49d ba94c2f1
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x78],%g3
	std	%f12,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f12 = 1a1efd06 b2f265c0
	bne	%xcc,p0_freg_check_fail
	mov	0xf12,%g1
	ldx	[%g4+0x80],%g3
	std	%f14,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f14 = a96e6a5a 864fc963
	bne	%xcc,p0_freg_check_fail
	mov	0xf14,%g1
	ldx	[%g4+0x88],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = e89e10b4 aebb5bfd
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1

!	Check Point 1 completed


p0_label_6:
!	%f0  = 065f771e 4241725d 334ff227 d78771e8
!	%f4  = ab71f314 e2a61342 14b471b9 26617a8e
!	%f8  = 4f61277f e46cbd64 1657e49d ba94c2f1
!	%f12 = 1a1efd06 b2f265c0 a96e6a5a 864fc963
	stda	%f0,[%i5]ASI_BLK_AIUS	! Block Store to 0000000030141400
!	%f30 = 71ffcb32, Mem[0000000030081408] = e53631c8
	sta	%f30,[%i2+%o4]0x81	! Mem[0000000030081408] = 71ffcb32
!	%l5 = fffffffffffffff7, Mem[0000000010041418] = 2a31f72c
	sth	%l5,[%i1+0x018]		! Mem[0000000010041418] = fff7f72c
!	Mem[0000000030001410] = a5f26b71, %l7 = 00000000000000ff
	swapa	[%i0+%o5]0x89,%l7	! %l7 = 00000000a5f26b71
!	Mem[0000000030081400] = baecbcfd, %l4 = 1d2636253c6cb36d
	ldstuba	[%i2+%g0]0x89,%l4	! %l4 = 000000fd000000ff
!	%l7 = 00000000a5f26b71, Mem[0000000010041408] = 77000000, %asi = 80
	stba	%l7,[%i1+0x008]%asi	! Mem[0000000010041408] = 71000000
!	%f24 = e89e10b4 aebb5bfd, %l1 = 0000000065576254
!	Mem[0000000010041408] = 71000000ee5b7559
	add	%i1,0x008,%g1
	stda	%f24,[%g1+%l1]ASI_PST32_P ! Mem[0000000010041408] = 71000000ee5b7559
!	%l6 = 00000026, %l7 = a5f26b71, Mem[0000000030041410] = 264e39e7 4dfacbb7
	stda	%l6,[%i1+%o5]0x81	! Mem[0000000030041410] = 00000026 a5f26b71
!	%l1 = 0000000065576254, Mem[0000000030101408] = 65576254
	stha	%l1,[%i4+%o4]0x81	! Mem[0000000030101408] = 62546254
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = c91e057a, %l7 = 00000000a5f26b71
	lduwa	[%i4+%o5]0x88,%l7	! %l7 = 00000000c91e057a

p0_label_7:
	membar	#Sync			! Added by membar checker (2)
!	Mem[0000000030141400] = 065f771e, %l5 = fffffffffffffff7
	lduha	[%i5+%g0]0x81,%l5	! %l5 = 000000000000065f
!	Mem[0000000010081410] = 0000582a, %l4 = 00000000000000fd
	ldsw	[%i2+%o5],%l4		! %l4 = 000000000000582a
!	Mem[0000000030181408] = 3fa59a75ea671051, %l5 = 000000000000065f
	ldxa	[%i6+%o4]0x81,%l5	! %l5 = 3fa59a75ea671051
!	Mem[0000000010041408] = 59755bee00000071, %f22 = 674d90c5 783346bf
	ldda	[%i1+%o4]0x88,%f22	! %f22 = 59755bee 00000071
!	Mem[0000000030181400] = f7724142 1e775f06, %l2 = 0000003f, %l3 = 00000004
	ldda	[%i6+%g0]0x81,%l2	! %l2 = 00000000f7724142 000000001e775f06
!	Mem[0000000030101400] = 582a190f, %l5 = 3fa59a75ea671051
	lduwa	[%i4+%g0]0x81,%l5	! %l5 = 00000000582a190f
!	Code Fragment 3
p0_fragment_1:
!	%l0 = 0000000000000077
	setx	0xfc60596fef620a58,%g7,%l0 ! %l0 = fc60596fef620a58
!	%l1 = 0000000065576254
	setx	0xf59dba9f85ddc24e,%g7,%l1 ! %l1 = f59dba9f85ddc24e
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = fc60596fef620a58
	setx	0x569feb8044f39108,%g7,%l0 ! %l0 = 569feb8044f39108
!	%l1 = f59dba9f85ddc24e
	setx	0x68a09ca0656b0469,%g7,%l1 ! %l1 = 68a09ca0656b0469
!	Mem[0000000010041410] = fd5bbbae, %l7 = 00000000c91e057a
	ldsha	[%i1+%o5]0x88,%l7	! %l7 = ffffffffffffbbae
!	Mem[00000000201c0000] = ff2aaf65, %l0 = 569feb8044f39108
	lduh	[%o0+%g0],%l0		! %l0 = 000000000000ff2a
!	Starting 10 instruction Store Burst
!	%l4 = 000000000000582a, Mem[00000000201c0000] = ff2aaf65, %asi = 80
	stha	%l4,[%o0+0x000]%asi	! Mem[00000000201c0000] = 582aaf65

p0_label_8:
!	Mem[0000000010141404] = ff834ac7, %l4 = 000000000000582a, %asi = 80
	swapa	[%i5+0x004]%asi,%l4	! %l4 = 00000000ff834ac7
!	%l3 = 000000001e775f06, Mem[0000000010101412] = 7a051ec9, %asi = 80
	stba	%l3,[%i4+0x012]%asi	! Mem[0000000010101410] = 7a0506c9
!	%l7 = ffffffffffffbbae, Mem[0000000010101400] = 32633a68c2f94f33
	stxa	%l7,[%i4+%g0]0x88	! Mem[0000000010101400] = ffffffffffffbbae
!	%f30 = 71ffcb32 ef0e491b, %l1 = 68a09ca0656b0469
!	Mem[00000000300c1408] = f735321d570d0ffd
	add	%i3,0x008,%g1
	stda	%f30,[%g1+%l1]ASI_PST32_S ! Mem[00000000300c1408] = f735321def0e491b
!	%l5 = 00000000582a190f, Mem[0000000030101400] = 0f192a58
	stha	%l5,[%i4+%g0]0x89	! Mem[0000000030101400] = 0f19190f
!	%l2 = 00000000f7724142, Mem[0000000030141408] = 334ff227d78771e8
	stxa	%l2,[%i5+%o4]0x81	! Mem[0000000030141408] = 00000000f7724142
!	%l6 = 0000000000000026, Mem[0000000010081410] = 0000582a
	stha	%l6,[%i2+%o5]0x80	! Mem[0000000010081410] = 0026582a
!	Mem[0000000030041410] = 26000000, %l2 = 00000000f7724142
	swapa	[%i1+%o5]0x89,%l2	! %l2 = 0000000026000000
!	%l6 = 00000026, %l7 = ffffbbae, Mem[0000000030101408] = 54625462 f4543acc
	stda	%l6,[%i4+%o4]0x89	! Mem[0000000030101408] = 00000026 ffffbbae
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = 334ff227, %l2 = 0000000026000000
	ldsba	[%i6+%o4]0x80,%l2	! %l2 = 0000000000000033

p0_label_9:
!	Mem[0000000010101410] = 7a0506c98184bd80, %l2 = 0000000000000033
	ldxa	[%i4+%o5]0x80,%l2	! %l2 = 7a0506c98184bd80
!	Mem[0000000010141418] = 3989b8f2d9cda08e, %f4  = ab71f314 e2a61342
	ldda	[%i5+0x018]%asi,%f4 	! %f4  = 3989b8f2 d9cda08e
!	Mem[00000000100c1438] = 88aadcc9 1603950d, %l6 = 00000026, %l7 = ffffbbae
	ldd	[%i3+0x038],%l6		! %l6 = 0000000088aadcc9 000000001603950d
!	Mem[00000000100c1408] = d5e10c94, %l1 = 68a09ca0656b0469
	lduba	[%i3+%o4]0x88,%l1	! %l1 = 0000000000000094
!	Mem[0000000010001400] = f7e6f7f8, %l3 = 000000001e775f06
	ldswa	[%i0+%g0]0x80,%l3	! %l3 = fffffffff7e6f7f8
!	Mem[00000000100c1400] = 96985297 19bc084d 940ce1d5 7979a9ca
!	Mem[00000000100c1410] = b7cbfa4d e0410b1b 3f477b3c 2e808b49
!	Mem[00000000100c1420] = 5cca1143 1ea5b41d 99c32599 eb7550e3
!	Mem[00000000100c1430] = faf8f416 4562104a 88aadcc9 1603950d
	ldda	[%i3]ASI_BLK_P,%f0	! Block Load from 00000000100c1400
!	Mem[0000000030181400] = f7724142, %f24 = e89e10b4
	lda	[%i6+%g0]0x81,%f24	! %f24 = f7724142
!	Mem[0000000010141424] = d4b66f2b, %f19 = 94997547
	lda	[%i5+0x024]%asi,%f19	! %f19 = d4b66f2b
!	Mem[000000001004142c] = 06cd9827, %f20 = 0bde65d1
	ld	[%i1+0x02c],%f20	! %f20 = 06cd9827
!	Starting 10 instruction Store Burst
!	%f16 = 215fe61d a12eb42c 3f127f49 d4b66f2b
!	%f20 = 06cd9827 3385fac5 59755bee 00000071
!	%f24 = f7724142 aebb5bfd 46a572a3 cb650bfe
!	%f28 = 065f771e 4241725d 71ffcb32 ef0e491b
	stda	%f16,[%i3]ASI_BLK_AIUP	! Block Store to 00000000100c1400

p0_label_10:
!	%f10 = 99c32599 eb7550e3, Mem[0000000010141410] = 0438326f 521dadd0
	stda	%f10,[%i5+%o5]0x80	! Mem[0000000010141410] = 99c32599 eb7550e3
!	%l7 = 000000001603950d, Mem[0000000010081400] = b220bd9e
	stha	%l7,[%i2+%g0]0x80	! Mem[0000000010081400] = 950dbd9e
!	%l6 = 0000000088aadcc9, Mem[0000000010081430] = 1d2636253c6cb36d
	stx	%l6,[%i2+0x030]		! Mem[0000000010081430] = 0000000088aadcc9
!	Mem[0000000030101410] = dd959123, %l0 = 000000000000ff2a
	swapa	[%i4+%o5]0x89,%l0	! %l0 = 00000000dd959123
!	%f14 = 88aadcc9 1603950d, Mem[0000000010181418] = 14b471b9 26617a8e
	std	%f14,[%i6+0x018]	! Mem[0000000010181418] = 88aadcc9 1603950d
!	%l4 = 00000000ff834ac7, Mem[0000000010081427] = a48e840e
	stb	%l4,[%i2+0x027]		! Mem[0000000010081424] = a48e84c7
!	%f13 = 4562104a, Mem[000000001014140c] = 56710a75
	st	%f13,[%i5+0x00c]	! Mem[000000001014140c] = 4562104a
!	Mem[0000000010141400] = cf7bcca3, %l1 = 0000000000000094
	swapa	[%i5+%g0]0x80,%l1	! %l1 = 00000000cf7bcca3
!	%f11 = eb7550e3, Mem[0000000010001410] = 31efa1ff
	sta	%f11,[%i0+%o5]0x88	! Mem[0000000010001410] = eb7550e3
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (3)
!	Mem[00000000100c1408] = 3f127f49, %l1 = 00000000cf7bcca3
	ldswa	[%i3+%o4]0x80,%l1	! %l1 = 000000003f127f49

!	Check Point 2 for processor 0

	set	p0_check_pt_data_2,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 00000000dd959123
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 000000003f127f49
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 7a0506c98184bd80
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = fffffffff7e6f7f8
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 00000000ff834ac7
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 00000000582a190f
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l7,%g2			! %l7 = 000000001603950d
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x40],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = 96985297 19bc084d
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x48],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = 940ce1d5 7979a9ca
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x50],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = b7cbfa4d e0410b1b
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x58],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 3f477b3c 2e808b49
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x60],%g3
	std	%f8,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f8 = 5cca1143 1ea5b41d
	bne	%xcc,p0_freg_check_fail
	mov	0xf08,%g1
	ldx	[%g4+0x68],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = 99c32599 eb7550e3
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x70],%g3
	std	%f12,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f12 = faf8f416 4562104a
	bne	%xcc,p0_freg_check_fail
	mov	0xf12,%g1
	ldx	[%g4+0x78],%g3
	std	%f14,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f14 = 88aadcc9 1603950d
	bne	%xcc,p0_freg_check_fail
	mov	0xf14,%g1
	ldx	[%g4+0x80],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = 3f127f49 d4b66f2b
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1
	ldx	[%g4+0x88],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = 06cd9827 3385fac5
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1
	ldx	[%g4+0x90],%g3
	std	%f22,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f22 = 59755bee 00000071
	bne	%xcc,p0_freg_check_fail
	mov	0xf22,%g1
	ldx	[%g4+0x98],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = f7724142 aebb5bfd
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1

!	Check Point 2 completed


p0_label_11:
!	Mem[0000000010181410] = ab71f314, %l2 = 7a0506c98184bd80
	lduha	[%i6+%o5]0x80,%l2	! %l2 = 000000000000ab71
!	Mem[0000000030081400] = b4675bb9baecbcff, %f4  = b7cbfa4d e0410b1b
	ldda	[%i2+%g0]0x89,%f4 	! %f4  = b4675bb9 baecbcff
!	Mem[00000000201c0000] = 582aaf65, %l6 = 0000000088aadcc9
	lduh	[%o0+%g0],%l6		! %l6 = 000000000000582a
!	Mem[000000001014143c] = 169e3a0b, %l7 = 000000001603950d
	ldsha	[%i5+0x03e]%asi,%l7	! %l7 = 0000000000003a0b
!	Mem[0000000010141428] = 0b2f22d4, %l4 = 00000000ff834ac7
	ldsh	[%i5+0x028],%l4		! %l4 = 0000000000000b2f
!	Mem[0000000010101400] = aebbffff, %l2 = 000000000000ab71
	lduha	[%i4+%g0]0x80,%l2	! %l2 = 000000000000aebb
!	Mem[0000000030081410] = a3531f9755100be5, %l2 = 000000000000aebb
	ldxa	[%i2+%o5]0x89,%l2	! %l2 = a3531f9755100be5
!	Mem[00000000100c1428] = 46a572a3 cb650bfe, %l4 = 00000b2f, %l5 = 582a190f
	ldda	[%i3+0x028]%asi,%l4	! %l4 = 0000000046a572a3 00000000cb650bfe
!	Mem[0000000030181410] = 46d0d9ae, %l2 = a3531f9755100be5
	ldsha	[%i6+%o5]0x89,%l2	! %l2 = ffffffffffffd9ae
!	Starting 10 instruction Store Burst
!	%f26 = 46a572a3 cb650bfe, %l7 = 0000000000003a0b
!	Mem[0000000010041430] = 302b5b9a53f91e8f
	add	%i1,0x030,%g1
	stda	%f26,[%g1+%l7]ASI_PST8_PL ! Mem[0000000010041430] = fe0b5bcb53f91e8f

p0_label_12:
!	%l7 = 0000000000003a0b, Mem[0000000030001410] = ff000000593a0984
	stxa	%l7,[%i0+%o5]0x81	! Mem[0000000030001410] = 0000000000003a0b
!	%f0  = 96985297 19bc084d, %l3 = fffffffff7e6f7f8
!	Mem[0000000010081410] = 0026582a1976768a
	add	%i2,0x010,%g1
	stda	%f0,[%g1+%l3]ASI_PST8_P ! Mem[0000000010081410] = 969852971976768a
!	Mem[0000000010081408] = f3683169, %l4 = 0000000046a572a3
	ldstuba	[%i2+%o4]0x80,%l4	! %l4 = 000000f3000000ff
!	Mem[000000001000142c] = adf0089d, %l4 = 00000000000000f3, %asi = 80
	swapa	[%i0+0x02c]%asi,%l4	! %l4 = 00000000adf0089d
!	%l4 = adf0089d, %l5 = cb650bfe, Mem[0000000010081410] = 96985297 1976768a
	stda	%l4,[%i2+0x010]%asi	! Mem[0000000010081410] = adf0089d cb650bfe
!	%f30 = 71ffcb32, Mem[0000000030141408] = 00000000
	sta	%f30,[%i5+%o4]0x81	! Mem[0000000030141408] = 71ffcb32
!	Mem[0000000030081410] = 55100be5, %l6 = 000000000000582a
	swapa	[%i2+%o5]0x89,%l6	! %l6 = 0000000055100be5
!	%l3 = fffffffff7e6f7f8, Mem[0000000010081400] = 950dbd9e
	stwa	%l3,[%i2+%g0]0x80	! Mem[0000000010081400] = f7e6f7f8
!	Mem[0000000010081400] = f7e6f7f8, %l6 = 0000000055100be5
	swapa	[%i2+%g0]0x80,%l6	! %l6 = 00000000f7e6f7f8
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = aebb5bfd, %f20 = 06cd9827
	lda	[%i1+%o5]0x80,%f20	! %f20 = aebb5bfd

p0_label_13:
!	Mem[0000000030081408] = 32cbff71, %f10 = 99c32599
	lda	[%i2+%o4]0x89,%f10	! %f10 = 32cbff71
!	Mem[0000000010001408] = ce936ef3, %l0 = 00000000dd959123
	ldsha	[%i0+%o4]0x88,%l0	! %l0 = 0000000000006ef3
!	Mem[0000000010081410] = 9d08f0ad, %l0 = 0000000000006ef3
	lduwa	[%i2+%o5]0x88,%l0	! %l0 = 000000009d08f0ad
!	Mem[0000000030141410] = 14f371ab, %l4 = 00000000adf0089d
	lduba	[%i5+%o5]0x89,%l4	! %l4 = 00000000000000ab
!	Mem[0000000010181410] = ab71f314, %l3 = fffffffff7e6f7f8
	lduw	[%i6+%o5],%l3		! %l3 = 00000000ab71f314
!	Mem[00000000100c1408] = 497f123f, %l6 = 00000000f7e6f7f8
	ldsba	[%i3+%o4]0x88,%l6	! %l6 = 000000000000003f
!	Mem[0000000010181410] = 14f371ab, %l7 = 0000000000003a0b
	ldswa	[%i6+%o5]0x88,%l7	! %l7 = 0000000014f371ab
!	Mem[0000000010081400] = 55100be5, %f30 = 71ffcb32
	lda	[%i2+%g0]0x80,%f30	! %f30 = 55100be5
!	Mem[0000000010001410] = eb7550e3, %l0 = 000000009d08f0ad
	ldswa	[%i0+%o5]0x88,%l0	! %l0 = ffffffffeb7550e3
!	Starting 10 instruction Store Burst
!	Mem[0000000030041400] = 468933ff, %l0 = ffffffffeb7550e3
	swapa	[%i1+%g0]0x89,%l0	! %l0 = 00000000468933ff

p0_label_14:
!	%l4 = 00000000000000ab, Mem[0000000030001400] = 4893024a
	stha	%l4,[%i0+%g0]0x81	! Mem[0000000030001400] = 00ab024a
!	%l6 = 000000000000003f, Mem[0000000010081438] = 81436d5de2818c31, %asi = 80
	stxa	%l6,[%i2+0x038]%asi	! Mem[0000000010081438] = 000000000000003f
!	%f8  = 5cca1143 1ea5b41d, Mem[0000000010181428] = 1657e49d ba94c2f1
	std	%f8 ,[%i6+0x028]	! Mem[0000000010181428] = 5cca1143 1ea5b41d
!	%l1 = 000000003f127f49, Mem[0000000020800000] = ba3a7d94
	sth	%l1,[%o1+%g0]		! Mem[0000000020800000] = 7f497d94
!	%l6 = 000000000000003f, Mem[0000000030101410] = 2aff0000
	stha	%l6,[%i4+%o5]0x81	! Mem[0000000030101410] = 003f0000
!	%l2 = ffffffffffffd9ae, Mem[0000000010041400] = f0c180d3
	stwa	%l2,[%i1+%g0]0x88	! Mem[0000000010041400] = ffffd9ae
!	Mem[0000000030001400] = 00ab024a, %l4 = 00000000000000ab
	swapa	[%i0+%g0]0x81,%l4	! %l4 = 0000000000ab024a
!	Mem[0000000010081408] = ff683169, %l0 = 00000000468933ff
	swapa	[%i2+%o4]0x80,%l0	! %l0 = 00000000ff683169
!	%f15 = 1603950d, Mem[0000000010001400] = f7e6f7f8
	sta	%f15,[%i0+0x000]%asi	! Mem[0000000010001400] = 1603950d
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = c906057a, %l0 = 00000000ff683169
	lduwa	[%i4+%o5]0x88,%l0	! %l0 = 00000000c906057a

p0_label_15:
!	Mem[0000000010001430] = 90afdb7b 408c6cad, %l6 = 0000003f, %l7 = 14f371ab
	ldd	[%i0+0x030],%l6		! %l6 = 0000000090afdb7b 00000000408c6cad
!	Mem[0000000010001400] = 0d950316, %f0  = 96985297
	lda	[%i0+%g0]0x88,%f0 	! %f0 = 0d950316
!	Mem[0000000030081410] = 2a580000, %l2 = ffffffffffffd9ae
	lduba	[%i2+%o5]0x81,%l2	! %l2 = 000000000000002a
!	Mem[0000000010101420] = c280f5db, %l1 = 000000003f127f49
	lduh	[%i4+0x020],%l1		! %l1 = 000000000000c280
!	Mem[00000000201c0000] = 582aaf65, %l4 = 0000000000ab024a
	ldsh	[%o0+%g0],%l4		! %l4 = 000000000000582a
!	Randomly selected nop
	nop
!	Mem[0000000030001410] = 0000000000003a0b, %f10 = 32cbff71 eb7550e3
	ldda	[%i0+%o5]0x81,%f10	! %f10 = 00000000 00003a0b
!	Mem[0000000030141400] = 1e775f06, %f15 = 1603950d
	lda	[%i5+%g0]0x89,%f15	! %f15 = 1e775f06
!	Mem[00000000100c1400] = 215fe61da12eb42c, %l6 = 0000000090afdb7b
	ldxa	[%i3+%g0]0x80,%l6	! %l6 = 215fe61da12eb42c
!	Starting 10 instruction Store Burst
!	Mem[0000000030081400] = ffbcecba, %l0 = 00000000c906057a
	swapa	[%i2+%g0]0x81,%l0	! %l0 = 00000000ffbcecba

!	Check Point 3 for processor 0

	set	p0_check_pt_data_3,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 00000000ffbcecba
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 000000000000c280
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 000000000000002a
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 00000000ab71f314
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 000000000000582a
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l6,%g2			! %l6 = 215fe61da12eb42c
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l7,%g2			! %l7 = 00000000408c6cad
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x40],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = 0d950316 19bc084d
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x48],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = b4675bb9 baecbcff
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x50],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 3f477b3c 2e808b49
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x58],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = 00000000 00003a0b
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x60],%g3
	std	%f14,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f14 = 88aadcc9 1e775f06
	bne	%xcc,p0_freg_check_fail
	mov	0xf14,%g1
	ldx	[%g4+0x68],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = aebb5bfd 3385fac5
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1
	ldx	[%g4+0x70],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = 55100be5 ef0e491b
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 3 completed


p0_label_16:
!	%l4 = 000000000000582a, Mem[0000000010141402] = 00000094, %asi = 80
	stha	%l4,[%i5+0x002]%asi	! Mem[0000000010141400] = 0000582a
!	Mem[00000000201c0000] = 582aaf65, %l1 = 000000000000c280
	ldstuba	[%o0+0x000]%asi,%l1	! %l1 = 00000058000000ff
!	%l7 = 00000000408c6cad, Mem[0000000030001408] = cc0dcc76
	stba	%l7,[%i0+%o4]0x89	! Mem[0000000030001408] = cc0dccad
!	%f10 = 00000000 00003a0b, Mem[00000000100c1430] = 065f771e 4241725d
	std	%f10,[%i3+0x030]	! Mem[00000000100c1430] = 00000000 00003a0b
!	Mem[0000000010041408] = 00000071, %l6 = 215fe61da12eb42c
	ldstuba	[%i1+%o4]0x88,%l6	! %l6 = 00000071000000ff
!	%f18 = 3f127f49 d4b66f2b, Mem[00000000300c1400] = 3d591eec bf7fcb03
	stda	%f18,[%i3+%g0]0x89	! Mem[00000000300c1400] = 3f127f49 d4b66f2b
!	%l0 = 00000000ffbcecba, Mem[0000000010141438] = 119799e7
	stb	%l0,[%i5+0x038]		! Mem[0000000010141438] = ba9799e7
!	%l1 = 0000000000000058, Mem[0000000010081430] = 00000000
	stw	%l1,[%i2+0x030]		! Mem[0000000010081430] = 00000058
!	%l3 = 00000000ab71f314, Mem[00000000300c1408] = f735321def0e491b
	stxa	%l3,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00000000ab71f314
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = df873ce30d950316, %l5 = 00000000cb650bfe
	ldxa	[%i0+%g0]0x88,%l5	! %l5 = df873ce30d950316

p0_label_17:
!	Mem[0000000030101400] = 0f19190f 12bbd853, %l2 = 0000002a, %l3 = ab71f314
	ldda	[%i4+%g0]0x81,%l2	! %l2 = 000000000f19190f 0000000012bbd853
!	Mem[0000000030101408] = 26000000, %l1 = 0000000000000058
	ldsba	[%i4+%o4]0x81,%l1	! %l1 = 0000000000000026
!	Mem[00000000218000c0] = e8ff65e1, %l5 = df873ce30d950316
	ldsba	[%o3+0x0c0]%asi,%l5	! %l5 = ffffffffffffffe8
!	Mem[0000000030041400] = e35075eb, %f11 = 00003a0b
	lda	[%i1+%g0]0x81,%f11	! %f11 = e35075eb
!	Mem[0000000021800180] = 15372200, %l1 = 0000000000000026
	ldsh	[%o3+0x180],%l1		! %l1 = 0000000000001537
!	Mem[00000000100c1400] = 2cb42ea1 1de65f21, %l0 = ffbcecba, %l1 = 00001537
	ldda	[%i3+%g0]0x88,%l0	! %l0 = 000000001de65f21 000000002cb42ea1
!	Mem[0000000010141408] = 674d90c5, %l5 = ffffffffffffffe8
	lduba	[%i5+%o4]0x88,%l5	! %l5 = 00000000000000c5
!	Mem[0000000010001400] = 1603950d, %l7 = 00000000408c6cad
	lduba	[%i0+%g0]0x80,%l7	! %l7 = 0000000000000016
!	Mem[0000000030001410] = 0000000000003a0b, %f0  = 0d950316 19bc084d
	ldda	[%i0+%o5]0x81,%f0 	! %f0  = 00000000 00003a0b
!	Starting 10 instruction Store Burst
!	Mem[0000000010141400] = 0000582a, %l3 = 0000000012bbd853
	swapa	[%i5+%g0]0x80,%l3	! %l3 = 000000000000582a

p0_label_18:
!	%l2 = 0f19190f, %l3 = 0000582a, Mem[0000000030081400] = 7a0506c9 b4675bb9
	stda	%l2,[%i2+%g0]0x89	! Mem[0000000030081400] = 0f19190f 0000582a
!	Mem[0000000010141400] = 53d8bb12, %l7 = 0000000000000016
	ldstuba	[%i5+%g0]0x88,%l7	! %l7 = 00000012000000ff
!	%l6 = 00000071, %l7 = 00000012, Mem[0000000010101400] = ffffbbae ffffffff
	stda	%l6,[%i4+%g0]0x88	! Mem[0000000010101400] = 00000071 00000012
!	%f9  = 1ea5b41d, Mem[0000000010181408] = 334ff227
	sta	%f9 ,[%i6+%o4]0x80	! Mem[0000000010181408] = 1ea5b41d
!	%l1 = 000000002cb42ea1, Mem[00000000100c142c] = cb650bfe, %asi = 80
	stwa	%l1,[%i3+0x02c]%asi	! Mem[00000000100c142c] = 2cb42ea1
!	Mem[00000000100c1408] = 497f123f, %l6 = 0000000000000071
	ldstuba	[%i3+%o4]0x88,%l6	! %l6 = 0000003f000000ff
!	%f4  = b4675bb9 baecbcff, Mem[0000000030141400] = 065f771e 4241725d
	stda	%f4 ,[%i5+%g0]0x81	! Mem[0000000030141400] = b4675bb9 baecbcff
!	Mem[0000000030101408] = 26000000, %l6 = 000000000000003f
	ldstuba	[%i4+%o4]0x81,%l6	! %l6 = 00000026000000ff
!	%f28 = 065f771e, Mem[0000000030081400] = 0f19190f
	sta	%f28,[%i2+%g0]0x81	! Mem[0000000030081400] = 065f771e
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = 9d08f0ad, %l3 = 000000000000582a
	lduwa	[%i2+%o5]0x88,%l3	! %l3 = 000000009d08f0ad

p0_label_19:
!	Mem[0000000030081408] = 71ffcb3266a05396, %l2 = 000000000f19190f
	ldxa	[%i2+%o4]0x81,%l2	! %l2 = 71ffcb3266a05396
!	Mem[00000000300c1400] = d4b66f2b, %l4 = 000000000000582a
	lduba	[%i3+%g0]0x89,%l4	! %l4 = 000000000000002b
!	Mem[0000000010101408] = c3aebe97, %l7 = 0000000000000012
	lduba	[%i4+%o4]0x80,%l7	! %l7 = 00000000000000c3
!	Mem[0000000030141400] = ffbcecbab95b67b4, %f6  = 3f477b3c 2e808b49
	ldda	[%i5+%g0]0x89,%f6 	! %f6  = ffbcecba b95b67b4
!	Mem[0000000010041400] = ffffd9ae, %l3 = 000000009d08f0ad
	ldswa	[%i1+%g0]0x88,%l3	! %l3 = ffffffffffffd9ae
!	Mem[0000000030041410] = 424172f7, %l1 = 000000002cb42ea1
	lduwa	[%i1+%o5]0x81,%l1	! %l1 = 00000000424172f7
!	Mem[0000000030101400] = 0f19190f, %l2 = 71ffcb3266a05396
	ldswa	[%i4+%g0]0x81,%l2	! %l2 = 000000000f19190f
!	Mem[0000000030001400] = 000000ab703f51d8, %l0 = 000000001de65f21
	ldxa	[%i0+%g0]0x81,%l0	! %l0 = 000000ab703f51d8
!	Mem[0000000010101408] = c3aebe97 0f425a7c, %l2 = 0f19190f, %l3 = ffffd9ae
	ldda	[%i4+%o4]0x80,%l2	! %l2 = 00000000c3aebe97 000000000f425a7c
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1408] = 497f12ff, %l0 = 000000ab703f51d8
	ldstuba	[%i3+%o4]0x88,%l0	! %l0 = 000000ff000000ff

p0_label_20:
!	Mem[0000000020800041] = 7f87ac70, %l5 = 00000000000000c5
	ldstub	[%o1+0x041],%l5		! %l5 = 00000087000000ff
!	Mem[0000000010001400] = 1603950d, %l3 = 000000000f425a7c, %asi = 80
	swapa	[%i0+0x000]%asi,%l3	! %l3 = 000000001603950d
!	%l7 = 00000000000000c3, Mem[0000000030181410] = 5f6ed8a446d0d9ae
	stxa	%l7,[%i6+%o5]0x89	! Mem[0000000030181410] = 00000000000000c3
!	Mem[0000000010141408] = 674d90c5, %l1 = 00000000424172f7
	ldstuba	[%i5+%o4]0x88,%l1	! %l1 = 000000c5000000ff
!	%f21 = 3385fac5, Mem[0000000030081410] = 2a580000
	sta	%f21,[%i2+%o5]0x81	! Mem[0000000030081410] = 3385fac5
!	%l1 = 00000000000000c5, Mem[00000000100c1400] = 1de65f21
	stba	%l1,[%i3+%g0]0x88	! Mem[00000000100c1400] = 1de65fc5
!	Mem[00000000201c0001] = ff2aaf65, %l0 = 00000000000000ff
	ldstub	[%o0+0x001],%l0		! %l0 = 0000002a000000ff
!	Mem[0000000020800000] = 7f497d94, %l3 = 000000001603950d
	ldstub	[%o1+%g0],%l3		! %l3 = 0000007f000000ff
!	%l5 = 0000000000000087, Mem[0000000030141410] = 14f371ab
	stba	%l5,[%i5+%o5]0x89	! Mem[0000000030141410] = 14f37187
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = 97beaec3, %l5 = 0000000000000087
	lduba	[%i4+%o4]0x88,%l5	! %l5 = 00000000000000c3

!	Check Point 4 for processor 0

	set	p0_check_pt_data_4,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 000000000000002a
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 00000000000000c5
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 00000000c3aebe97
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 000000000000007f
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 000000000000002b
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 00000000000000c3
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 0000000000000026
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 00000000000000c3
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = 00000000 00003a0b
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x50],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = 940ce1d5 7979a9ca
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x58],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = ffbcecba b95b67b4
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x60],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = 00000000 e35075eb
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1

!	Check Point 4 completed


p0_label_21:
!	Mem[0000000030001408] = adcc0dcc, %l0 = 000000000000002a
	lduwa	[%i0+%o4]0x81,%l0	! %l0 = 00000000adcc0dcc
!	Mem[0000000030101410] = 1872447d00003f00, %l5 = 00000000000000c3
	ldxa	[%i4+%o5]0x89,%l5	! %l5 = 1872447d00003f00
!	Mem[0000000010001400] = 0f425a7ce33c87df, %f26 = 46a572a3 cb650bfe
	ldda	[%i0+0x000]%asi,%f26	! %f26 = 0f425a7c e33c87df
!	Mem[0000000010141400] = 53d8bbff, %l0 = 00000000adcc0dcc
	ldsha	[%i5+%g0]0x88,%l0	! %l0 = ffffffffffffbbff
!	Mem[0000000010081408] = ff338946, %l4 = 000000000000002b
	ldsba	[%i2+%o4]0x88,%l4	! %l4 = 0000000000000046
!	Mem[0000000030041408] = 59971743 8be62902, %l4 = 00000046, %l5 = 00003f00
	ldda	[%i1+%o4]0x81,%l4	! %l4 = 0000000059971743 000000008be62902
!	Mem[0000000030001410] = 00000000, %l5 = 000000008be62902
	ldsha	[%i0+%o5]0x89,%l5	! %l5 = 0000000000000000
!	Mem[00000000300c1408] = 00000000, %l0 = ffffffffffffbbff
	ldsha	[%i3+%o4]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000010041420] = acf5739d a3edf857, %l4 = 59971743, %l5 = 00000000
	ldd	[%i1+0x020],%l4		! %l4 = 00000000acf5739d 00000000a3edf857
!	Starting 10 instruction Store Burst
!	%f4  = b4675bb9 baecbcff, Mem[0000000030041410] = 424172f7 a5f26b71
	stda	%f4 ,[%i1+%o5]0x81	! Mem[0000000030041410] = b4675bb9 baecbcff

p0_label_22:
!	Mem[0000000010101410] = c906057a, %l3 = 000000000000007f
	ldstuba	[%i4+%o5]0x88,%l3	! %l3 = 0000007a000000ff
!	%l2 = 00000000c3aebe97, Mem[0000000030001400] = 000000ab
	stwa	%l2,[%i0+%g0]0x81	! Mem[0000000030001400] = c3aebe97
!	Mem[0000000010101408] = c3aebe970f425a7c, %l5 = 00000000a3edf857, %l7 = 00000000000000c3
	add	%i4,0x08,%g1
	casxa	[%g1]0x80,%l5,%l7	! %l7 = c3aebe970f425a7c
!	%f11 = e35075eb, Mem[0000000010141408] = 674d90ff
	sta	%f11,[%i5+%o4]0x88	! Mem[0000000010141408] = e35075eb
!	Mem[0000000010001400] = 0f425a7c, %l7 = c3aebe970f425a7c
	swap	[%i0+%g0],%l7		! %l7 = 000000000f425a7c
!	%l3 = 000000000000007a, Mem[00000000201c0000] = ffffaf65, %asi = 80
	stha	%l3,[%o0+0x000]%asi	! Mem[00000000201c0000] = 007aaf65
!	%f2  = 940ce1d5 7979a9ca, %l7 = 000000000f425a7c
!	Mem[00000000300c1400] = 2b6fb6d4497f123f
	stda	%f2,[%i3+%l7]ASI_PST16_S ! Mem[00000000300c1400] = 940ce1d5497f123f
!	%l5 = 00000000a3edf857, Mem[00000000300c1410] = d67f471f
	stwa	%l5,[%i3+%o5]0x89	! Mem[00000000300c1410] = a3edf857
!	Mem[0000000030041410] = b95b67b4, %l5 = 00000000a3edf857
	swapa	[%i1+%o5]0x89,%l5	! %l5 = 00000000b95b67b4
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = ff338946, %l1 = 00000000000000c5
	lduwa	[%i2+%o4]0x88,%l1	! %l1 = 00000000ff338946

p0_label_23:
!	Mem[0000000010081408] = cda2f60f ff338946, %l0 = 00000000, %l1 = ff338946
	ldda	[%i2+%o4]0x88,%l0	! %l0 = 00000000ff338946 00000000cda2f60f
!	Mem[0000000010081408] = cda2f60fff338946, %l3 = 000000000000007a
	ldxa	[%i2+%o4]0x88,%l3	! %l3 = cda2f60fff338946
!	Mem[0000000010001400] = 7c5a420f, %l7 = 000000000f425a7c
	ldsba	[%i0+%g0]0x88,%l7	! %l7 = 000000000000000f
!	Mem[0000000010181410] = ab71f314, %f16 = 215fe61d
	lda	[%i6+%o5]0x80,%f16	! %f16 = ab71f314
!	Mem[00000000100c143c] = ef0e491b, %l1 = 00000000cda2f60f
	ldsh	[%i3+0x03c],%l1		! %l1 = ffffffffffffef0e
!	Mem[0000000030181410] = c3000000, %l1 = ffffffffffffef0e
	ldsha	[%i6+%o5]0x81,%l1	! %l1 = ffffffffffffc300
!	Mem[0000000030001410] = 00000000, %f28 = 065f771e
	lda	[%i0+%o5]0x81,%f28	! %f28 = 00000000
!	Mem[00000000100c1410] = c5fa8533 2798cd06, %l2 = c3aebe97, %l3 = ff338946
	ldda	[%i3+%o5]0x88,%l2	! %l2 = 000000002798cd06 00000000c5fa8533
!	Mem[0000000010101410] = ff0506c9, %l3 = 00000000c5fa8533
	lduha	[%i4+%o5]0x80,%l3	! %l3 = 000000000000ff05
!	Starting 10 instruction Store Burst
!	%l0 = 00000000ff338946, Mem[0000000010001408] = f36e93cebef70a6b
	stxa	%l0,[%i0+%o4]0x80	! Mem[0000000010001408] = 00000000ff338946

p0_label_24:
!	Mem[0000000010141438] = ba9799e7169e3a0b, %l4 = 00000000acf5739d, %l6 = 0000000000000026
	add	%i5,0x38,%g1
	casxa	[%g1]0x80,%l4,%l6	! %l6 = ba9799e7169e3a0b
!	%l0 = ff338946, %l1 = ffffc300, Mem[0000000010001410] = e35075eb eb105ae1
	stda	%l0,[%i0+0x010]%asi	! Mem[0000000010001410] = ff338946 ffffc300
!	Mem[0000000010141410] = 9925c399, %l5 = 00000000b95b67b4
	ldstuba	[%i5+%o5]0x88,%l5	! %l5 = 00000099000000ff
!	%l0 = 00000000ff338946, Mem[0000000030041400] = e35075eb4ba35651
	stxa	%l0,[%i1+%g0]0x81	! Mem[0000000030041400] = 00000000ff338946
!	%l0 = ff338946, %l1 = ffffc300, Mem[0000000010081400] = e50b1055 3a55f89a
	stda	%l0,[%i2+%g0]0x88	! Mem[0000000010081400] = ff338946 ffffc300
!	Mem[0000000030001410] = 00000000, %l2 = 000000002798cd06
	swapa	[%i0+%o5]0x89,%l2	! %l2 = 0000000000000000
!	%l6 = ba9799e7169e3a0b, Mem[0000000030081408] = 9653a06632cbff71
	stxa	%l6,[%i2+%o4]0x89	! Mem[0000000030081408] = ba9799e7169e3a0b
!	Mem[00000000201c0000] = 007aaf65, %l4 = 00000000acf5739d
	ldstub	[%o0+%g0],%l4		! %l4 = 00000000000000ff
!	%l6 = ba9799e7169e3a0b, Mem[0000000010101410] = 80bd8481c90605ff
	stxa	%l6,[%i4+%o5]0x88	! Mem[0000000010101410] = ba9799e7169e3a0b
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = 169e3a0b, %l7 = 000000000000000f
	ldsha	[%i2+%o4]0x89,%l7	! %l7 = 0000000000003a0b

p0_label_25:
!	Mem[0000000010001418] = ccbe12ae, %l3 = 000000000000ff05
	lduw	[%i0+0x018],%l3		! %l3 = 00000000ccbe12ae
!	Mem[0000000010041400] = ffffd9ae, %l5 = 0000000000000099
	ldsba	[%i1+%g0]0x88,%l5	! %l5 = ffffffffffffffae
!	Mem[0000000030141410] = 14f37187, %l3 = 00000000ccbe12ae
	ldsba	[%i5+%o5]0x89,%l3	! %l3 = ffffffffffffff87
!	Mem[0000000030081408] = 169e3a0b, %l1 = ffffffffffffc300
	ldsba	[%i2+%o4]0x89,%l1	! %l1 = 000000000000000b
!	Mem[00000000201c0000] = ff7aaf65, %l2 = 0000000000000000
	lduha	[%o0+0x000]%asi,%l2	! %l2 = 000000000000ff7a
!	Mem[0000000010081400] = 468933ff, %f28 = 00000000
	lda	[%i2+%g0]0x80,%f28	! %f28 = 468933ff
!	Mem[0000000010001408] = 00000000, %l2 = 000000000000ff7a
	ldswa	[%i0+%o4]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000030181408] = 759aa53f, %l7 = 0000000000003a0b
	ldsba	[%i6+%o4]0x89,%l7	! %l7 = 000000000000003f
!	Mem[0000000010141410] = ffc32599 eb7550e3, %l2 = 00000000, %l3 = ffffff87
	ldda	[%i5+%o5]0x80,%l2	! %l2 = 00000000ffc32599 00000000eb7550e3
!	Starting 10 instruction Store Burst
!	%f6  = ffbcecba b95b67b4, Mem[0000000010181408] = 1db4a51e e87187d7
	stda	%f6 ,[%i6+%o4]0x88	! Mem[0000000010181408] = ffbcecba b95b67b4

!	Check Point 5 for processor 0

	set	p0_check_pt_data_5,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 00000000ff338946
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 000000000000000b
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 00000000ffc32599
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 00000000eb7550e3
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 0000000000000000
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = ffffffffffffffae
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l7,%g2			! %l7 = 000000000000003f
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x40],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = 00000000 00003a0b
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x48],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = 940ce1d5 7979a9ca
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x50],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = b4675bb9 baecbcff
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x58],%g3
	std	%f16,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f16 = ab71f314 a12eb42c
	bne	%xcc,p0_freg_check_fail
	mov	0xf16,%g1
	ldx	[%g4+0x60],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = 0f425a7c e33c87df
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1
	ldx	[%g4+0x68],%g3
	std	%f28,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f28 = 468933ff 4241725d
	bne	%xcc,p0_freg_check_fail
	mov	0xf28,%g1

!	Check Point 5 completed


p0_label_26:
!	%l3 = 00000000eb7550e3, Mem[0000000010101410] = 169e3a0b
	stba	%l3,[%i4+%o5]0x88	! Mem[0000000010101410] = 169e3ae3
!	%l2 = 00000000ffc32599, Mem[0000000030141410] = 8771f314e2a61342
	stxa	%l2,[%i5+%o5]0x81	! Mem[0000000030141410] = 00000000ffc32599
!	%l4 = 00000000, %l5 = ffffffae, Mem[0000000010081430] = 00000058 88aadcc9
	std	%l4,[%i2+0x030]		! Mem[0000000010081430] = 00000000 ffffffae
!	%l1 = 000000000000000b, Mem[00000000100c1410] = 2798cd06
	stha	%l1,[%i3+%o5]0x88	! Mem[00000000100c1410] = 2798000b
!	%l3 = 00000000eb7550e3, Mem[0000000030001410] = 06cd982700003a0b
	stxa	%l3,[%i0+%o5]0x81	! Mem[0000000030001410] = 00000000eb7550e3
!	%l2 = 00000000ffc32599, Mem[0000000030141400] = b4675bb9
	stha	%l2,[%i5+%g0]0x81	! Mem[0000000030141400] = 25995bb9
!	%l5 = ffffffffffffffae, Mem[0000000010101400] = 71000000
	stba	%l5,[%i4+%g0]0x80	! Mem[0000000010101400] = ae000000
!	%l7 = 000000000000003f, Mem[00000000100c1400] = c55fe61d
	stba	%l7,[%i3+%g0]0x80	! Mem[00000000100c1400] = 3f5fe61d
!	%l1 = 000000000000000b, Mem[0000000010081405] = 00c3ffff
	stb	%l1,[%i2+0x005]		! Mem[0000000010081404] = 000bffff
!	Starting 10 instruction Load Burst
!	Mem[0000000030181410] = 000000c3, %l3 = 00000000eb7550e3
	lduwa	[%i6+%o5]0x89,%l3	! %l3 = 00000000000000c3

p0_label_27:
!	Mem[0000000030101408] = ffffbbae000000ff, %f14 = 88aadcc9 1e775f06
	ldda	[%i4+%o4]0x89,%f14	! %f14 = ffffbbae 000000ff
!	Mem[0000000010081410] = fe0b65cb9d08f0ad, %l0 = 00000000ff338946
	ldxa	[%i2+%o5]0x88,%l0	! %l0 = fe0b65cb9d08f0ad
!	Mem[0000000010101408] = 97beaec3, %l0 = fe0b65cb9d08f0ad
	ldsha	[%i4+%o4]0x88,%l0	! %l0 = ffffffffffffaec3
!	Mem[0000000010041408] = ff000000, %l0 = ffffffffffffaec3
	ldsha	[%i1+%o4]0x80,%l0	! %l0 = ffffffffffffff00
!	Mem[0000000010001420] = e89e10b4, %l1 = 000000000000000b
	ldub	[%i0+0x023],%l1		! %l1 = 00000000000000b4
!	Mem[0000000010081418] = 9acec51b 6b46e4cb, %l4 = 00000000, %l5 = ffffffae
	ldd	[%i2+0x018],%l4		! %l4 = 000000009acec51b 000000006b46e4cb
!	Mem[00000000100c1400] = 2cb42ea1 1de65f3f, %l0 = ffffff00, %l1 = 000000b4
	ldda	[%i3+%g0]0x88,%l0	! %l0 = 000000001de65f3f 000000002cb42ea1
!	Mem[00000000100c140c] = d4b66f2b, %l6 = ba9799e7169e3a0b
	lduba	[%i3+0x00e]%asi,%l6	! %l6 = 000000000000006f
!	Mem[0000000010181418] = 88aadcc91603950d, %l0 = 000000001de65f3f
	ldx	[%i6+0x018],%l0		! %l0 = 88aadcc91603950d
!	Starting 10 instruction Store Burst
!	%l0 = 88aadcc91603950d, Mem[0000000010001410] = 468933ff
	stwa	%l0,[%i0+%o5]0x88	! Mem[0000000010001410] = 1603950d

p0_label_28:
!	Mem[0000000030041408] = 43179759, %l5 = 000000006b46e4cb
	ldstuba	[%i1+%o4]0x89,%l5	! %l5 = 00000059000000ff
!	%f9  = 1ea5b41d, Mem[000000001010142c] = fffffff7
	sta	%f9 ,[%i4+0x02c]%asi	! Mem[000000001010142c] = 1ea5b41d
!	Mem[0000000010001400] = 0f425a7c, %l4 = 000000009acec51b
	swapa	[%i0+%g0]0x80,%l4	! %l4 = 000000000f425a7c
!	%f19 = d4b66f2b, Mem[0000000010101410] = 169e3ae3
	sta	%f19,[%i4+%o5]0x88	! Mem[0000000010101410] = d4b66f2b
!	%l3 = 00000000000000c3, Mem[0000000030081410] = c5fa8533
	stba	%l3,[%i2+%o5]0x89	! Mem[0000000030081410] = c5fa85c3
!	%f8  = 5cca1143 1ea5b41d, Mem[0000000030041408] = ff971743 8be62902
	stda	%f8 ,[%i1+%o4]0x81	! Mem[0000000030041408] = 5cca1143 1ea5b41d
!	%f12 = faf8f416 4562104a, %l0 = 88aadcc91603950d
!	Mem[0000000010181418] = 88aadcc91603950d
	add	%i6,0x018,%g1
	stda	%f12,[%g1+%l0]ASI_PST8_P ! Mem[0000000010181418] = 88aadcc94562954a
!	Mem[0000000010001400] = 9acec51b, %l4 = 000000000f425a7c
	ldsha	[%i0+%g0]0x80,%l4	! %l4 = ffffffffffff9ace
!	%l5 = 0000000000000059, Mem[0000000030001408] = adcc0dcc
	stha	%l5,[%i0+%o4]0x81	! Mem[0000000030001408] = 00590dcc
!	Starting 10 instruction Load Burst
!	Mem[0000000030101410] = 003f0000, %l4 = ffffffffffff9ace
	lduwa	[%i4+%o5]0x81,%l4	! %l4 = 00000000003f0000

p0_label_29:
!	%l0 = 88aadcc91603950d, %l7 = 000000000000003f, %l4 = 00000000003f0000
	sub	%l0,%l7,%l4		! %l4 = 88aadcc9160394ce
!	Mem[00000000100c1408] = ff127f49 d4b66f2b, %l4 = 160394ce, %l5 = 00000059
	ldda	[%i3+0x008]%asi,%l4	! %l4 = 00000000ff127f49 00000000d4b66f2b
!	Mem[00000000100c1400] = 3f5fe61d a12eb42c, %l4 = ff127f49, %l5 = d4b66f2b
	ldd	[%i3+%g0],%l4		! %l4 = 000000003f5fe61d 00000000a12eb42c
!	Mem[0000000030141400] = b95b9925, %l6 = 000000000000006f
	lduwa	[%i5+%g0]0x89,%l6	! %l6 = 00000000b95b9925
!	Mem[0000000030001408] = 00590dcc, %l2 = 00000000ffc32599
	ldswa	[%i0+%o4]0x81,%l2	! %l2 = 0000000000590dcc
!	Mem[0000000030181408] = 759aa53f, %l3 = 00000000000000c3
	lduwa	[%i6+%o4]0x89,%l3	! %l3 = 00000000759aa53f
!	Mem[000000001010142c] = 1ea5b41d, %l3 = 00000000759aa53f
	lduba	[%i4+0x02d]%asi,%l3	! %l3 = 00000000000000a5
!	Mem[0000000010081408] = ff338946, %l1 = 000000002cb42ea1
	ldswa	[%i2+%o4]0x88,%l1	! %l1 = ffffffffff338946
!	Mem[00000000100c1400] = 2cb42ea11de65f3f, %l0 = 88aadcc91603950d
	ldxa	[%i3+%g0]0x88,%l0	! %l0 = 2cb42ea11de65f3f
!	Starting 10 instruction Store Burst
!	%f16 = ab71f314 a12eb42c, %l2 = 0000000000590dcc
!	Mem[0000000030001400] = c3aebe97703f51d8
	stda	%f16,[%i0+%l2]ASI_PST8_SL ! Mem[0000000030001400] = c3ae2ea1703f71ab

p0_label_30:
!	Mem[000000001000141c] = 7a244989, %l7 = 000000000000003f, %asi = 80
	swapa	[%i0+0x01c]%asi,%l7	! %l7 = 000000007a244989
!	%l4 = 3f5fe61d, %l5 = a12eb42c, Mem[0000000010041400] = ffffd9ae dd647555
	stda	%l4,[%i1+%g0]0x88	! Mem[0000000010041400] = 3f5fe61d a12eb42c
!	%l0 = 1de65f3f, %l1 = ff338946, Mem[0000000010101400] = 000000ae 00000012
	stda	%l0,[%i4+%g0]0x88	! Mem[0000000010101400] = 1de65f3f ff338946
!	Mem[00000000300c1400] = d5e10c94, %l0 = 2cb42ea11de65f3f
	swapa	[%i3+%g0]0x89,%l0	! %l0 = 00000000d5e10c94
!	%l2 = 00590dcc, %l3 = 000000a5, Mem[0000000010141418] = 3989b8f2 d9cda08e
	std	%l2,[%i5+0x018]		! Mem[0000000010141418] = 00590dcc 000000a5
!	Mem[0000000030041410] = 57f8eda3, %l2 = 0000000000590dcc
	swapa	[%i1+%o5]0x81,%l2	! %l2 = 0000000057f8eda3
!	%l0 = 00000000d5e10c94, Mem[0000000010141408] = eb7550e3
	stha	%l0,[%i5+%o4]0x80	! Mem[0000000010141408] = 0c9450e3
!	Mem[000000001010140c] = 0f425a7c, %l7 = 000000007a244989
	ldstub	[%i4+0x00c],%l7		! %l7 = 0000000f000000ff
!	%l0 = 00000000d5e10c94, Mem[0000000030141410] = 9925c3ff00000000
	stxa	%l0,[%i5+%o5]0x89	! Mem[0000000030141410] = 00000000d5e10c94
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = e35075eb00000000, %f0  = 00000000 00003a0b
	ldda	[%i0+%o5]0x89,%f0 	! %f0  = e35075eb 00000000

!	Check Point 6 for processor 0

	set	p0_check_pt_data_6,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 00000000d5e10c94
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = ffffffffff338946
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 0000000057f8eda3
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 00000000000000a5
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 000000003f5fe61d
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 00000000a12eb42c
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 00000000b95b9925
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 000000000000000f
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = e35075eb 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x50],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = b4675bb9 baecbcff
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x58],%g3
	std	%f14,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f14 = ffffbbae 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf14,%g1

!	Check Point 6 completed


p0_label_31:
!	Mem[0000000010101408] = 97beaec3, %f28 = 468933ff
	lda	[%i4+%o4]0x88,%f28	! %f28 = 97beaec3
!	Mem[0000000010181418] = 88aadcc9, %l7 = 000000000000000f
	ldswa	[%i6+0x018]%asi,%l7	! %l7 = ffffffff88aadcc9
!	Mem[00000000201c0000] = ff7aaf65, %l1 = ffffffffff338946
	lduba	[%o0+0x001]%asi,%l1	! %l1 = 000000000000007a
!	Mem[0000000010081400] = ffff0b00 ff338946, %l0 = d5e10c94, %l1 = 0000007a
	ldda	[%i2+%g0]0x88,%l0	! %l0 = 00000000ff338946 00000000ffff0b00
	membar	#Sync			! Added by membar checker (4)
!	Mem[0000000010181400] = 065f771e 4241725d b4675bb9 baecbcff
!	Mem[0000000010181410] = ab71f314 e2a61342 88aadcc9 4562954a
!	Mem[0000000010181420] = 4f61277f e46cbd64 5cca1143 1ea5b41d
!	Mem[0000000010181430] = 1a1efd06 b2f265c0 a96e6a5a 864fc963
	ldda	[%i6]ASI_BLK_AIUP,%f16	! Block Load from 0000000010181400
!	Mem[0000000010001408] = 00000000, %l5 = 00000000a12eb42c
	ldsha	[%i0+%o4]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000010141438] = ba9799e7169e3a0b, %l3 = 00000000000000a5
	ldx	[%i5+0x038],%l3		! %l3 = ba9799e7169e3a0b
!	Mem[00000000100c1408] = ff127f49, %l1 = 00000000ffff0b00
	ldsba	[%i3+%o4]0x80,%l1	! %l1 = ffffffffffffffff
!	Mem[00000000300c1400] = 3f127f491de65f3f, %l6 = 00000000b95b9925
	ldxa	[%i3+%g0]0x89,%l6	! %l6 = 3f127f491de65f3f
!	Starting 10 instruction Store Burst
!	%l2 = 0000000057f8eda3, Mem[00000000300c1400] = 3f5fe61d
	stha	%l2,[%i3+%g0]0x81	! Mem[00000000300c1400] = eda3e61d

p0_label_32:
!	%l0 = 00000000ff338946, Mem[0000000010141413] = ffc32599, %asi = 80
	stba	%l0,[%i5+0x013]%asi	! Mem[0000000010141410] = ffc32546
!	%f12 = faf8f416 4562104a, %l7 = ffffffff88aadcc9
!	Mem[0000000010101418] = af5fb9677994996f
	add	%i4,0x018,%g1
	stda	%f12,[%g1+%l7]ASI_PST16_P ! Mem[0000000010101418] = faf8b9677994104a
!	Mem[0000000010041400] = 1de65f3f, %l1 = ffffffffffffffff
	ldstuba	[%i1+%g0]0x80,%l1	! %l1 = 0000001d000000ff
!	%l0 = 00000000ff338946, Mem[0000000010141408] = 0c9450e3
	stha	%l0,[%i5+%o4]0x80	! Mem[0000000010141408] = 894650e3
!	%f0  = e35075eb, Mem[00000000100c1410] = 0b009827
	sta	%f0 ,[%i3+%o5]0x80	! Mem[00000000100c1410] = e35075eb
!	Mem[0000000030101400] = 0f19190f, %l6 = 3f127f491de65f3f
	swapa	[%i4+%g0]0x89,%l6	! %l6 = 000000000f19190f
!	%l6 = 000000000f19190f, Mem[0000000010081410] = 9d08f0ad
	stwa	%l6,[%i2+%o5]0x88	! Mem[0000000010081410] = 0f19190f
!	%f10 = 00000000 e35075eb, %l6 = 000000000f19190f
!	Mem[0000000030181438] = 5400691c4214e2cc
	add	%i6,0x038,%g1
	stda	%f10,[%g1+%l6]ASI_PST16_SL ! Mem[0000000030181438] = eb7550e300000000
!	%l2 = 0000000057f8eda3, Mem[0000000030041400] = 00000000
	stba	%l2,[%i1+%g0]0x81	! Mem[0000000030041400] = a3000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = 169e3a0b, %l7 = ffffffff88aadcc9
	ldsba	[%i2+%o4]0x89,%l7	! %l7 = 000000000000000b

p0_label_33:
!	Mem[0000000010141414] = eb7550e3, %f12 = faf8f416
	ld	[%i5+0x014],%f12	! %f12 = eb7550e3
!	Mem[0000000020800040] = 7fffac70, %l5 = 0000000000000000
	ldsba	[%o1+0x040]%asi,%l5	! %l5 = 000000000000007f
!	Mem[0000000030001410] = 00000000, %l6 = 000000000f19190f
	lduba	[%i0+%o5]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000010081408] = 468933ff, %l4 = 000000003f5fe61d
	lduwa	[%i2+%o4]0x80,%l4	! %l4 = 00000000468933ff
!	Mem[000000001018142b] = 5cca1143, %l0 = 00000000ff338946
	ldstub	[%i6+0x02b],%l0		! %l0 = 00000043000000ff
!	Mem[0000000010181410] = 14f371ab, %l7 = 000000000000000b
	ldsba	[%i6+%o5]0x88,%l7	! %l7 = ffffffffffffffab
!	Mem[0000000010141408] = e3504689, %l4 = 00000000468933ff
	lduha	[%i5+%o4]0x88,%l4	! %l4 = 0000000000004689
!	Mem[0000000030141400] = ffbcecbab95b9925, %f6  = ffbcecba b95b67b4
	ldda	[%i5+%g0]0x89,%f6 	! %f6  = ffbcecba b95b9925
!	Mem[00000000100c1400] = 3f5fe61d, %f1  = 00000000
	lda	[%i3+%g0]0x80,%f1 	! %f1 = 3f5fe61d
!	Starting 10 instruction Store Burst
!	Mem[0000000010101408] = c3aebe97, %l4 = 0000000000004689
	swapa	[%i4+%o4]0x80,%l4	! %l4 = 00000000c3aebe97

p0_label_34:
!	Mem[0000000010041408] = ff000000ee5b7559, %l5 = 000000000000007f, %l0 = 0000000000000043
	add	%i1,0x08,%g1
	casxa	[%g1]0x80,%l5,%l0	! %l0 = ff000000ee5b7559
!	%l6 = 0000000000000000, Mem[0000000010101408] = 00004689
	stwa	%l6,[%i4+%o4]0x80	! Mem[0000000010101408] = 00000000
!	%l2 = 0000000057f8eda3, Mem[00000000300c1400] = eda3e61d497f123f
	stxa	%l2,[%i3+%g0]0x81	! Mem[00000000300c1400] = 0000000057f8eda3
!	%l6 = 0000000000000000, Mem[0000000030141410] = 940ce1d5
	stba	%l6,[%i5+%o5]0x81	! Mem[0000000030141410] = 000ce1d5
!	%l2 = 57f8eda3, %l3 = 169e3a0b, Mem[0000000010141410] = ffc32546 eb7550e3
	stda	%l2,[%i5+%o5]0x80	! Mem[0000000010141410] = 57f8eda3 169e3a0b
!	%l4 = c3aebe97, %l5 = 0000007f, Mem[0000000010001410] = 0d950316 ffffc300
	stda	%l4,[%i0+0x010]%asi	! Mem[0000000010001410] = c3aebe97 0000007f
!	Mem[0000000030101400] = 1de65f3f, %l3 = ba9799e7169e3a0b
	ldstuba	[%i4+%g0]0x89,%l3	! %l3 = 0000003f000000ff
!	%f14 = ffffbbae 000000ff, Mem[0000000010081408] = 468933ff 0ff6a2cd
	stda	%f14,[%i2+%o4]0x80	! Mem[0000000010081408] = ffffbbae 000000ff
!	Mem[0000000030041408] = 4311ca5c, %l2 = 0000000057f8eda3
	ldstuba	[%i1+%o4]0x89,%l2	! %l2 = 0000005c000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = e35075eb 3385fac5, %l0 = ee5b7559, %l1 = 0000001d
	ldda	[%i3+%o5]0x80,%l0	! %l0 = 00000000e35075eb 000000003385fac5

p0_label_35:
!	Mem[0000000010141400] = 2a580000 53d8bbff, %l4 = c3aebe97, %l5 = 0000007f
	ldda	[%i5+%g0]0x88,%l4	! %l4 = 0000000053d8bbff 000000002a580000
!	Mem[00000000211c0000] = ff877bbb, %l5 = 000000002a580000
	lduh	[%o2+%g0],%l5		! %l5 = 000000000000ff87
!	Mem[0000000030041408] = ffca11431ea5b41d, %f6  = ffbcecba b95b9925
	ldda	[%i1+%o4]0x81,%f6 	! %f6  = ffca1143 1ea5b41d
	membar	#Sync			! Added by membar checker (5)
!	Mem[0000000030101400] = ff5fe61d 12bbd853 ff000000 aebbffff
!	Mem[0000000030101410] = 003f0000 7d447218 15b04473 507fc82f
!	Mem[0000000030101420] = e65d3e3c 61f8f569 6a3de8cb 1873dffd
!	Mem[0000000030101430] = 545bb8c4 49e8dbec f20316b1 7b7980ea
	ldda	[%i4]ASI_BLK_AIUSL,%f0	! Block Load from 0000000030101400
!	Mem[0000000010101400] = 3f5fe61d, %l2 = 000000000000005c
	lduwa	[%i4+%g0]0x80,%l2	! %l2 = 000000003f5fe61d
!	Mem[0000000010001400] = 9acec51b, %f26 = 5cca1143
	ld	[%i0+%g0],%f26	! %f26 = 9acec51b
!	Mem[0000000010141400] = ffbbd853, %l4 = 0000000053d8bbff
	lduha	[%i5+0x000]%asi,%l4	! %l4 = 000000000000ffbb
!	Mem[0000000010101408] = 00000000, %l2 = 000000003f5fe61d
	ldswa	[%i4+%o4]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000010041408] = 000000ff, %l6 = 0000000000000000
	ldsha	[%i1+%o4]0x88,%l6	! %l6 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000010181414] = e2a61342, %l2 = 00000000, %l4 = 0000ffbb
	add	%i6,0x14,%g1
	casa	[%g1]0x80,%l2,%l4	! %l4 = 00000000e2a61342

!	Check Point 7 for processor 0

	set	p0_check_pt_data_7,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 00000000e35075eb
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 000000003385fac5
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 0000000000000000
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 000000000000003f
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 00000000e2a61342
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 000000000000ff87
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = ffffffffffffffab
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = 53d8bb12 1de65fff
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x50],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = ffffbbae 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x58],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 1872447d 00003f00
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x60],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 2fc87f50 7344b015
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x68],%g3
	std	%f8,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f8 = 69f5f861 3c3e5de6
	bne	%xcc,p0_freg_check_fail
	mov	0xf08,%g1
	ldx	[%g4+0x70],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = fddf7318 cbe83d6a
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x78],%g3
	std	%f12,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f12 = ecdbe849 c4b85b54
	bne	%xcc,p0_freg_check_fail
	mov	0xf12,%g1
	ldx	[%g4+0x80],%g3
	std	%f14,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f14 = ea80797b b11603f2
	bne	%xcc,p0_freg_check_fail
	mov	0xf14,%g1
	ldx	[%g4+0x88],%g3
	std	%f16,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f16 = 065f771e 4241725d
	bne	%xcc,p0_freg_check_fail
	mov	0xf16,%g1
	ldx	[%g4+0x90],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = b4675bb9 baecbcff
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1
	ldx	[%g4+0x98],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = ab71f314 e2a61342
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1
	ldx	[%g4+0xa0],%g3
	std	%f22,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f22 = 88aadcc9 4562954a
	bne	%xcc,p0_freg_check_fail
	mov	0xf22,%g1
	ldx	[%g4+0xa8],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = 4f61277f e46cbd64
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1
	ldx	[%g4+0xb0],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = 9acec51b 1ea5b41d
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1
	ldx	[%g4+0xb8],%g3
	std	%f28,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f28 = 1a1efd06 b2f265c0
	bne	%xcc,p0_freg_check_fail
	mov	0xf28,%g1
	ldx	[%g4+0xc0],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = a96e6a5a 864fc963
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 7 completed


p0_label_36:
!	Mem[0000000010041408] = 000000ff, %l7 = ffffffffffffffab
	ldstuba	[%i1+%o4]0x88,%l7	! %l7 = 000000ff000000ff
!	Mem[00000000100c1412] = e35075eb, %l6 = 00000000000000ff
	ldstuba	[%i3+0x012]%asi,%l6	! %l6 = 00000075000000ff
!	Mem[0000000030041410] = cc0d5900, %l5 = 000000000000ff87
	ldstuba	[%i1+%o5]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[0000000020800041] = 7fffac70, %l5 = 0000000000000000
	ldstuba	[%o1+0x041]%asi,%l5	! %l5 = 000000ff000000ff
!	Mem[00000000300c1408] = 00000000, %l7 = 00000000000000ff
	swapa	[%i3+%o4]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000010081400] = 468933ff, %l4 = 00000000e2a61342
	ldstuba	[%i2+%g0]0x80,%l4	! %l4 = 00000046000000ff
!	%l3 = 000000000000003f, Mem[0000000010041400] = 3f5fe6ff
	stha	%l3,[%i1+%g0]0x88	! Mem[0000000010041400] = 3f5f003f
!	%l4 = 0000000000000046, Mem[00000000300c1400] = 00000000
	stwa	%l4,[%i3+%g0]0x81	! Mem[00000000300c1400] = 00000046
!	%l4 = 0000000000000046, Mem[0000000030141400] = 25995bb9baecbcff
	stxa	%l4,[%i5+%g0]0x81	! Mem[0000000030141400] = 0000000000000046
!	Starting 10 instruction Load Burst
!	Mem[0000000010001418] = ccbe12ae, %l7 = 0000000000000000
	ldswa	[%i0+0x018]%asi,%l7	! %l7 = ffffffffccbe12ae

p0_label_37:
!	Mem[000000001018142c] = 1ea5b41d, %l0 = 00000000e35075eb
	ldsba	[%i6+0x02d]%asi,%l0	! %l0 = ffffffffffffffa5
	membar	#Sync			! Added by membar checker (6)
!	Mem[00000000300c1400] = 00000046 57f8eda3 ff000000 ab71f314
!	Mem[00000000300c1410] = 57f8eda3 f7dc9b91 e4ad4171 6dd53edf
!	Mem[00000000300c1420] = 121550a3 8891fdc5 b03a461f b1e85a2f
!	Mem[00000000300c1430] = a77b4726 08023c1a c4f3b3a3 c2b5c52f
	ldda	[%i3]ASI_BLK_S,%f16	! Block Load from 00000000300c1400
!	Mem[0000000010141424] = d4b66f2b, %l2 = 0000000000000000
	ldsb	[%i5+0x025],%l2		! %l2 = ffffffffffffffb6
!	Mem[0000000010181408] = b95b67b4, %l2 = ffffffffffffffb6
	ldsba	[%i6+%o4]0x88,%l2	! %l2 = ffffffffffffffb4
!	Mem[0000000010081410] = 0f19190f, %l2 = ffffffffffffffb4
	lduba	[%i2+%o5]0x88,%l2	! %l2 = 000000000000000f
!	Mem[0000000030081408] = 169e3a0b, %l1 = 000000003385fac5
	ldsba	[%i2+%o4]0x89,%l1	! %l1 = 000000000000000b
!	Mem[00000000100c1408] = 497f12ff, %l7 = ffffffffccbe12ae
	ldsba	[%i3+%o4]0x88,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010141408] = e3504689, %l6 = 0000000000000075
	lduba	[%i5+%o4]0x88,%l6	! %l6 = 0000000000000089
!	Mem[0000000030081408] = 0b3a9e16e79997ba, %f6  = 2fc87f50 7344b015
	ldda	[%i2+%o4]0x81,%f6 	! %f6  = 0b3a9e16 e79997ba
!	Starting 10 instruction Store Burst
!	%l2 = 000000000000000f, Mem[0000000010041410] = fd5bbbae
	stwa	%l2,[%i1+%o5]0x88	! Mem[0000000010041410] = 0000000f

p0_label_38:
!	%l6 = 00000089, %l7 = ffffffff, Mem[0000000010041410] = 0f000000 61160bc4
	std	%l6,[%i1+%o5]		! Mem[0000000010041410] = 00000089 ffffffff
!	%l6 = 00000089, %l7 = ffffffff, Mem[0000000030141410] = d5e10c00 00000000
	stda	%l6,[%i5+%o5]0x89	! Mem[0000000030141410] = 00000089 ffffffff
!	%l3 = 000000000000003f, Mem[0000000010181418] = 88aadcc94562954a, %asi = 80
	stxa	%l3,[%i6+0x018]%asi	! Mem[0000000010181418] = 000000000000003f
!	%l1 = 000000000000000b, Mem[0000000010041400] = 3f005f3f
	stba	%l1,[%i1+%g0]0x80	! Mem[0000000010041400] = 0b005f3f
!	%l4 = 00000046, %l5 = 000000ff, Mem[0000000010001410] = c3aebe97 0000007f
	stda	%l4,[%i0+%o5]0x80	! Mem[0000000010001410] = 00000046 000000ff
!	%l0 = ffffffffffffffa5, Mem[0000000030181408] = 3fa59a75ea671051
	stxa	%l0,[%i6+%o4]0x81	! Mem[0000000030181408] = ffffffffffffffa5
!	%f8  = 69f5f861 3c3e5de6, %l7 = ffffffffffffffff
!	Mem[0000000010081438] = 000000000000003f
	add	%i2,0x038,%g1
	stda	%f8,[%g1+%l7]ASI_PST8_P ! Mem[0000000010081438] = 69f5f8613c3e5de6
!	%l4 = 0000000000000046, Mem[0000000010181410] = ab71f314e2a61342
	stx	%l4,[%i6+%o5]		! Mem[0000000010181410] = 0000000000000046
!	%f10 = fddf7318 cbe83d6a, %l5 = 00000000000000ff
!	Mem[0000000010181408] = b4675bb9baecbcff
	add	%i6,0x008,%g1
	stda	%f10,[%g1+%l5]ASI_PST16_P ! Mem[0000000010181408] = fddf7318cbe83d6a
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = ff127f49, %l1 = 000000000000000b
	ldsha	[%i3+%o4]0x80,%l1	! %l1 = ffffffffffffff12

p0_label_39:
!	Mem[0000000010141400] = 2a580000 53d8bbff, %l2 = 0000000f, %l3 = 0000003f
	ldda	[%i5+%g0]0x88,%l2	! %l2 = 0000000053d8bbff 000000002a580000
!	Mem[0000000010141400] = ffbbd853 0000582a 894650e3 4562104a
!	Mem[0000000010141410] = 57f8eda3 169e3a0b 00590dcc 000000a5
!	Mem[0000000010141420] = e3613df6 d4b66f2b 0b2f22d4 ec1ac7fc
!	Mem[0000000010141430] = a5aa37f8 dcfd2bef ba9799e7 169e3a0b
	ldda	[%i5]ASI_BLK_P,%f16	! Block Load from 0000000010141400
!	Mem[00000000100c1400] = 1de65f3f, %l1 = ffffffffffffff12
	ldswa	[%i3+%g0]0x88,%l1	! %l1 = 000000001de65f3f
!	Mem[0000000030101410] = 00003f00, %l6 = 0000000000000089
	ldswa	[%i4+%o5]0x89,%l6	! %l6 = 0000000000003f00
!	Mem[000000001018141c] = 0000003f, %l7 = ffffffffffffffff
	lduba	[%i6+0x01c]%asi,%l7	! %l7 = 0000000000000000
!	Mem[0000000030101410] = 00003f00, %l5 = 00000000000000ff
	lduha	[%i4+%o5]0x89,%l5	! %l5 = 0000000000003f00
!	Mem[0000000030041400] = 000000a3, %l2 = 0000000053d8bbff
	lduha	[%i1+%g0]0x89,%l2	! %l2 = 00000000000000a3
!	Mem[0000000010141434] = dcfd2bef, %f8  = 69f5f861
	ld	[%i5+0x034],%f8 	! %f8 = dcfd2bef
!	Mem[0000000030141410] = ffffffff00000089, %l5 = 0000000000003f00
	ldxa	[%i5+%o5]0x89,%l5	! %l5 = ffffffff00000089
!	Starting 10 instruction Store Burst
!	Mem[0000000010081400] = ff3389ff, %l1 = 000000001de65f3f
	ldstuba	[%i2+%g0]0x88,%l1	! %l1 = 000000ff000000ff

p0_label_40:
!	%l5 = ffffffff00000089, Mem[0000000010041408] = ff000000ee5b7559
	stx	%l5,[%i1+%o4]		! Mem[0000000010041408] = ffffffff00000089
!	Mem[0000000010101408] = 00000000, %l1 = 00000000000000ff
	ldstuba	[%i4+%o4]0x80,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010141410] = 57f8eda3, %l2 = 00000000000000a3
	swapa	[%i5+%o5]0x80,%l2	! %l2 = 0000000057f8eda3
!	%l0 = ffffffffffffffa5, Mem[0000000010041400] = 3f5f000b
	stba	%l0,[%i1+%g0]0x88	! Mem[0000000010041400] = 3f5f00a5
!	Mem[00000000211c0000] = ff877bbb, %l7 = 0000000000000000
	ldstuba	[%o2+0x000]%asi,%l7	! %l7 = 000000ff000000ff
!	%l4 = 0000000000000046, Mem[0000000010081434] = ffffffae, %asi = 80
	stwa	%l4,[%i2+0x034]%asi	! Mem[0000000010081434] = 00000046
!	Mem[0000000010041400] = a5005f3f, %l6 = 0000000000003f00
	ldstuba	[%i1+%g0]0x80,%l6	! %l6 = 000000a5000000ff
!	%l2 = 0000000057f8eda3, Mem[00000000100c1404] = a12eb42c
	stb	%l2,[%i3+0x004]		! Mem[00000000100c1404] = a32eb42c
!	%l6 = 00000000000000a5, Mem[0000000030081410] = c385fac5
	stwa	%l6,[%i2+%o5]0x81	! Mem[0000000030081410] = 000000a5
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = ff8933ff000bffff, %f4  = 1872447d 00003f00
	ldda	[%i2+%g0]0x80,%f4 	! %f4  = ff8933ff 000bffff

!	Check Point 8 for processor 0

	set	p0_check_pt_data_8,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = ffffffffffffffa5
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 0000000000000000
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 0000000057f8eda3
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l4,%g2			! %l4 = 0000000000000046
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l5,%g2			! %l5 = ffffffff00000089
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l6,%g2			! %l6 = 00000000000000a5
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l7,%g2			! %l7 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x40],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = ffffbbae 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x48],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = ff8933ff 000bffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x50],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 0b3a9e16 e79997ba
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x58],%g3
	std	%f8,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f8 = dcfd2bef 3c3e5de6
	bne	%xcc,p0_freg_check_fail
	mov	0xf08,%g1
	ldx	[%g4+0x60],%g3
	std	%f16,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f16 = ffbbd853 0000582a
	bne	%xcc,p0_freg_check_fail
	mov	0xf16,%g1
	ldx	[%g4+0x68],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = 894650e3 4562104a
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1
	ldx	[%g4+0x70],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = 57f8eda3 169e3a0b
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1
	ldx	[%g4+0x78],%g3
	std	%f22,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f22 = 00590dcc 000000a5
	bne	%xcc,p0_freg_check_fail
	mov	0xf22,%g1
	ldx	[%g4+0x80],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = e3613df6 d4b66f2b
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1
	ldx	[%g4+0x88],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = 0b2f22d4 ec1ac7fc
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1
	ldx	[%g4+0x90],%g3
	std	%f28,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f28 = a5aa37f8 dcfd2bef
	bne	%xcc,p0_freg_check_fail
	mov	0xf28,%g1
	ldx	[%g4+0x98],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = ba9799e7 169e3a0b
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 8 completed


p0_label_41:
!	Mem[0000000010041438] = 6aabdc45, %l4 = 0000000000000046
	ldsh	[%i1+0x03a],%l4		! %l4 = ffffffffffffdc45
!	Mem[00000000300c1410] = a3edf857, %f29 = dcfd2bef
	lda	[%i3+%o5]0x89,%f29	! %f29 = a3edf857
!	Mem[0000000030101408] = 000000ff, %l1 = 0000000000000000
	lduwa	[%i4+%o4]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010041410] = ffffffff 89000000, %l2 = 57f8eda3, %l3 = 2a580000
	ldda	[%i1+%o5]0x88,%l2	! %l2 = 0000000089000000 00000000ffffffff
!	Mem[0000000010101410] = 2b6fb6d4e79997ba, %l3 = 00000000ffffffff
	ldxa	[%i4+%o5]0x80,%l3	! %l3 = 2b6fb6d4e79997ba
!	Mem[00000000300c1400] = 00000046, %l3 = 2b6fb6d4e79997ba
	lduha	[%i3+%g0]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000010181408] = 1873dffd, %l1 = 00000000000000ff
	lduba	[%i6+%o4]0x88,%l1	! %l1 = 00000000000000fd
!	Mem[0000000010081408] = ffffbbae000000ff, %l5 = ffffffff00000089
	ldx	[%i2+%o4],%l5		! %l5 = ffffbbae000000ff
!	Mem[0000000010141400] = ffbbd8530000582a, %f0  = 53d8bb12 1de65fff
	ldd	[%i5+%g0],%f0 		! %f0  = ffbbd853 0000582a
!	Starting 10 instruction Store Burst
!	%l4 = ffffffffffffdc45, Mem[0000000010181410] = 00000000
	stha	%l4,[%i6+%o5]0x88	! Mem[0000000010181410] = 0000dc45

p0_label_42:
!	%l6 = 00000000000000a5, Mem[0000000010181408] = fddf7318
	stwa	%l6,[%i6+%o4]0x80	! Mem[0000000010181408] = 000000a5
	membar	#Sync			! Added by membar checker (7)
!	%f20 = 57f8eda3 169e3a0b, Mem[0000000010141430] = a5aa37f8 dcfd2bef
	stda	%f20,[%i5+0x030]%asi	! Mem[0000000010141430] = 57f8eda3 169e3a0b
!	Mem[0000000030181408] = ffffffff, %l3 = 0000000000000000
	ldstuba	[%i6+%o4]0x81,%l3	! %l3 = 000000ff000000ff
!	%f28 = a5aa37f8 a3edf857, %l1 = 00000000000000fd
!	Mem[0000000030001438] = 785c8b1a6936250f
	add	%i0,0x038,%g1
	stda	%f28,[%g1+%l1]ASI_PST32_SL ! Mem[0000000030001438] = 57f8eda36936250f
!	Mem[0000000010041400] = 3f5f00ff, %l6 = 00000000000000a5
	swapa	[%i1+%g0]0x88,%l6	! %l6 = 000000003f5f00ff
!	Mem[0000000010041410] = 89000000, %l0 = ffffffffffffffa5
	swapa	[%i1+%o5]0x88,%l0	! %l0 = 0000000089000000
!	Mem[0000000010101424] = ed262f66, %l1 = 00000000000000fd
	swap	[%i4+0x024],%l1		! %l1 = 00000000ed262f66
!	Mem[0000000010141410] = a3000000, %l3 = 00000000000000ff
	ldstuba	[%i5+%o5]0x88,%l3	! %l3 = 00000000000000ff
!	%f28 = a5aa37f8 a3edf857, Mem[0000000030101400] = ff5fe61d 12bbd853
	stda	%f28,[%i4+%g0]0x81	! Mem[0000000030101400] = a5aa37f8 a3edf857
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = 000000ff, %l2 = 0000000089000000
	ldswa	[%i4+%o4]0x88,%l2	! %l2 = 00000000000000ff

p0_label_43:
!	Mem[000000001018143c] = 864fc963, %f27 = ec1ac7fc
	ld	[%i6+0x03c],%f27	! %f27 = 864fc963
!	Mem[0000000010141408] = 894650e3, %l3 = 0000000000000000
	lduwa	[%i5+%o4]0x80,%l3	! %l3 = 00000000894650e3
!	Mem[0000000010101408] = 000000ff, %l0 = 0000000089000000
	ldsba	[%i4+%o4]0x88,%l0	! %l0 = ffffffffffffffff
!	Mem[00000000100c1410] = ebff50e3, %l6 = 000000003f5f00ff
	ldsba	[%i3+%o5]0x88,%l6	! %l6 = ffffffffffffffe3
!	Mem[00000000201c0000] = ff7aaf65, %l6 = ffffffffffffffe3
	ldub	[%o0+0x001],%l6		! %l6 = 000000000000007a
!	Mem[0000000010181410] = 45dc0000, %l6 = 000000000000007a
	lduha	[%i6+%o5]0x80,%l6	! %l6 = 00000000000045dc
!	Mem[0000000010181408] = 000000a5, %l0 = ffffffffffffffff
	ldswa	[%i6+%o4]0x80,%l0	! %l0 = 00000000000000a5
!	Mem[0000000030081400] = 1e775f06, %l7 = 00000000000000ff
	ldsha	[%i2+%g0]0x89,%l7	! %l7 = 0000000000005f06
!	Mem[0000000021800180] = 15372200, %l6 = 00000000000045dc
	ldsha	[%o3+0x180]%asi,%l6	! %l6 = 0000000000001537
!	Starting 10 instruction Store Burst
!	%l5 = ffffbbae000000ff, Mem[0000000030101408] = ff000000
	stwa	%l5,[%i4+%o4]0x81	! Mem[0000000030101408] = 000000ff

p0_label_44:
!	%f30 = ba9799e7 169e3a0b, %l4 = ffffffffffffdc45
!	Mem[0000000030001410] = 00000000eb7550e3
	add	%i0,0x010,%g1
	stda	%f30,[%g1+%l4]ASI_PST32_SL ! Mem[0000000030001410] = 0b3a9e16eb7550e3
!	%f2  = ffffbbae 000000ff, %l0 = 00000000000000a5
!	Mem[0000000030181438] = eb7550e300000000
	add	%i6,0x038,%g1
	stda	%f2,[%g1+%l0]ASI_PST8_S ! Mem[0000000030181438] = ff75bbe3000000ff
!	%l0 = 000000a5, %l1 = ed262f66, Mem[0000000010101410] = 2b6fb6d4 e79997ba
	stda	%l0,[%i4+%o5]0x80	! Mem[0000000010101410] = 000000a5 ed262f66
!	Mem[0000000010041420] = acf5739d, %l7 = 0000000000005f06
	swap	[%i1+0x020],%l7		! %l7 = 00000000acf5739d
!	%l2 = 00000000000000ff, Mem[00000000100c1400] = 3f5fe61da32eb42c
	stxa	%l2,[%i3+%g0]0x80	! Mem[00000000100c1400] = 00000000000000ff
!	Mem[0000000010101408] = 000000ff, %l2 = 00000000000000ff
	swapa	[%i4+%o4]0x88,%l2	! %l2 = 00000000000000ff
!	%l0 = 00000000000000a5, Mem[0000000030081408] = ba9799e7169e3a0b
	stxa	%l0,[%i2+%o4]0x89	! Mem[0000000030081408] = 00000000000000a5
!	%f3  = 000000ff, Mem[0000000010041408] = ffffffff
	sta	%f3 ,[%i1+%o4]0x88	! Mem[0000000010041408] = 000000ff
!	%l0 = 000000a5, %l1 = ed262f66, Mem[0000000010081410] = 0f19190f fe0b65cb
	stda	%l0,[%i2+%o5]0x88	! Mem[0000000010081410] = 000000a5 ed262f66
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = 57f8eda3f837aaa5, %f4  = ff8933ff 000bffff
	ldda	[%i4+%g0]0x89,%f4 	! %f4  = 57f8eda3 f837aaa5

p0_label_45:
!	Mem[0000000010081410] = a5000000662f26ed, %l2 = 00000000000000ff
	ldxa	[%i2+%o5]0x80,%l2	! %l2 = a5000000662f26ed
!	Mem[0000000010001410] = 00000046 000000ff, %l2 = 662f26ed, %l3 = 894650e3
	ldda	[%i0+%o5]0x80,%l2	! %l2 = 0000000000000046 00000000000000ff
!	Mem[00000000300c1410] = a3edf857, %l4 = ffffffffffffdc45
	lduwa	[%i3+%o5]0x89,%l4	! %l4 = 00000000a3edf857
!	Mem[0000000030141410] = 89000000, %l3 = 00000000000000ff
	ldswa	[%i5+%o5]0x81,%l3	! %l3 = ffffffff89000000
!	Mem[0000000030001400] = c3ae2ea1703f71ab, %f4  = 57f8eda3 f837aaa5
	ldda	[%i0+%g0]0x81,%f4 	! %f4  = c3ae2ea1 703f71ab
!	Mem[00000000100c1400] = 00000000, %l1 = 00000000ed262f66
	ldsha	[%i3+%g0]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000030101410] = 00003f00, %f17 = 0000582a
	lda	[%i4+%o5]0x89,%f17	! %f17 = 00003f00
!	Mem[0000000030181400] = f77241421e775f06, %l6 = 0000000000001537
	ldxa	[%i6+%g0]0x81,%l6	! %l6 = f77241421e775f06
!	Mem[0000000010181424] = e46cbd64, %l7 = 00000000acf5739d
	ldsb	[%i6+0x025],%l7		! %l7 = 000000000000006c
!	Starting 10 instruction Store Burst
!	%l0 = 00000000000000a5, Mem[0000000010041410] = ffffffa5
	stha	%l0,[%i1+%o5]0x88	! Mem[0000000010041410] = ffff00a5

!	Check Point 9 for processor 0

	set	p0_check_pt_data_9,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 00000000000000a5
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 0000000000000000
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 0000000000000046
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = ffffffff89000000
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 00000000a3edf857
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = ffffbbae000000ff
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = f77241421e775f06
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 000000000000006c
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = ffbbd853 0000582a
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x50],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = ffffbbae 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x58],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = c3ae2ea1 703f71ab
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x60],%g3
	std	%f16,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f16 = ffbbd853 00003f00
	bne	%xcc,p0_freg_check_fail
	mov	0xf16,%g1
	ldx	[%g4+0x68],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = 0b2f22d4 864fc963
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1
	ldx	[%g4+0x70],%g3
	std	%f28,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f28 = a5aa37f8 a3edf857
	bne	%xcc,p0_freg_check_fail
	mov	0xf28,%g1

!	Check Point 9 completed


p0_label_46:
!	Mem[0000000030141410] = 89000000, %l6 = f77241421e775f06
	swapa	[%i5+%o5]0x81,%l6	! %l6 = 0000000089000000
!	%l3 = ffffffff89000000, Mem[0000000010001408] = 00000000
	stba	%l3,[%i0+%o4]0x80	! Mem[0000000010001408] = 00000000
!	Mem[0000000010101410] = a5000000, %l7 = 000000000000006c
	swapa	[%i4+%o5]0x88,%l7	! %l7 = 00000000a5000000
!	Mem[0000000030141410] = 065f771e, %l0 = 00000000000000a5
	ldstuba	[%i5+%o5]0x89,%l0	! %l0 = 0000001e000000ff
!	%l2 = 0000000000000046, Mem[0000000030141400] = 00000000
	stha	%l2,[%i5+%g0]0x89	! Mem[0000000030141400] = 00000046
!	%l4 = 00000000a3edf857, Mem[0000000030001400] = c3ae2ea1
	stwa	%l4,[%i0+%g0]0x81	! Mem[0000000030001400] = a3edf857
!	%l3 = ffffffff89000000, Mem[0000000010081408] = ffffbbae, %asi = 80
	stwa	%l3,[%i2+0x008]%asi	! Mem[0000000010081408] = 89000000
!	%l3 = ffffffff89000000, Mem[00000000201c0000] = ff7aaf65, %asi = 80
	stha	%l3,[%o0+0x000]%asi	! Mem[00000000201c0000] = 0000af65
!	%f16 = ffbbd853 00003f00, Mem[0000000030181410] = c3000000 00000000
	stda	%f16,[%i6+%o5]0x81	! Mem[0000000030181410] = ffbbd853 00003f00
!	Starting 10 instruction Load Burst
!	Mem[0000000010001418] = ccbe12ae, %l5 = ffffbbae000000ff
	ldsba	[%i0+0x01a]%asi,%l5	! %l5 = 0000000000000012

p0_label_47:
!	Mem[0000000030181408] = ffffffff, %l5 = 0000000000000012
	ldsba	[%i6+%o4]0x81,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000020800040] = 7fffac70, %l2 = 0000000000000046
	ldub	[%o1+0x040],%l2		! %l2 = 000000000000007f
!	Mem[0000000030001408] = 00590dcc, %l7 = 00000000a5000000
	lduwa	[%i0+%o4]0x81,%l7	! %l7 = 0000000000590dcc
!	Mem[0000000010081408] = 89000000, %f3  = 000000ff
	lda	[%i2+%o4]0x80,%f3 	! %f3 = 89000000
!	Mem[0000000010181400] = 065f771e, %l7 = 0000000000590dcc
	lduha	[%i6+%g0]0x80,%l7	! %l7 = 000000000000065f
!	Mem[0000000030141400] = 00000046, %l3 = ffffffff89000000
	ldswa	[%i5+%g0]0x89,%l3	! %l3 = 0000000000000046
!	Mem[00000000100c1408] = 497f12ff, %l4 = 00000000a3edf857
	ldsha	[%i3+%o4]0x88,%l4	! %l4 = 00000000000012ff
!	Mem[0000000030001410] = 0b3a9e16 eb7550e3, %l2 = 0000007f, %l3 = 00000046
	ldda	[%i0+%o5]0x81,%l2	! %l2 = 000000000b3a9e16 00000000eb7550e3
!	Mem[0000000010081410] = 000000a5, %l1 = 0000000000000000
	ldsba	[%i2+%o5]0x88,%l1	! %l1 = ffffffffffffffa5
!	Starting 10 instruction Store Burst
!	Mem[0000000010101418] = faf8b9677994104a, %l2 = 000000000b3a9e16, %l1 = ffffffffffffffa5
	add	%i4,0x18,%g1
	casxa	[%g1]0x80,%l2,%l1	! %l1 = faf8b9677994104a

p0_label_48:
!	%f2  = ffffbbae 89000000, %l7 = 000000000000065f
!	Mem[0000000030001438] = 57f8eda36936250f
	add	%i0,0x038,%g1
	stda	%f2,[%g1+%l7]ASI_PST16_SL ! Mem[0000000030001438] = 00000089aebbffff
!	%l6 = 89000000, %l7 = 0000065f, Mem[00000000300c1410] = a3edf857 919bdcf7
	stda	%l6,[%i3+%o5]0x89	! Mem[00000000300c1410] = 89000000 0000065f
!	Mem[0000000010081428] = b6130940, %l7 = 0000065f, %l5 = ffffffff
	add	%i2,0x28,%g1
	casa	[%g1]0x80,%l7,%l5	! %l5 = 00000000b6130940
!	Mem[00000000100c1408] = ff127f49, %l7 = 000000000000065f
	ldstuba	[%i3+%o4]0x80,%l7	! %l7 = 000000ff000000ff
!	%l1 = faf8b9677994104a, Mem[0000000030001408] = 00590dcc
	stha	%l1,[%i0+%o4]0x81	! Mem[0000000030001408] = 104a0dcc
!	%f6  = 0b3a9e16 e79997ba, Mem[00000000100c1408] = ff127f49 d4b66f2b
	stda	%f6 ,[%i3+%o4]0x80	! Mem[00000000100c1408] = 0b3a9e16 e79997ba
!	Mem[0000000010041408] = ff000000, %l5 = 00000000b6130940
	ldstuba	[%i1+%o4]0x80,%l5	! %l5 = 000000ff000000ff
!	%l1 = faf8b9677994104a, Mem[0000000010081400] = ff8933ff
	stba	%l1,[%i2+%g0]0x80	! Mem[0000000010081400] = 4a8933ff
!	Mem[0000000010101410] = 0000006c, %l3 = 00000000eb7550e3
	ldstuba	[%i4+%o5]0x88,%l3	! %l3 = 0000006c000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = c5fa8533ebff50e3, %f22 = 00590dcc 000000a5
	ldda	[%i3+%o5]0x88,%f22	! %f22 = c5fa8533 ebff50e3

p0_label_49:
!	%f16 = ffbbd853 00003f00 894650e3 4562104a
!	%f20 = 57f8eda3 169e3a0b c5fa8533 ebff50e3
!	%f24 = e3613df6 d4b66f2b 0b2f22d4 864fc963
!	%f28 = a5aa37f8 a3edf857 ba9799e7 169e3a0b
	stda	%f16,[%i5]ASI_BLK_AIUSL	! Block Store to 0000000030141400
!	Mem[0000000010041408] = ff000000, %f0  = ffbbd853
	lda	[%i1+%o4]0x80,%f0 	! %f0 = ff000000
!	Mem[00000000300c1408] = ff000000ab71f314, %f12 = ecdbe849 c4b85b54
	ldda	[%i3+%o4]0x81,%f12	! %f12 = ff000000 ab71f314
	membar	#Sync			! Added by membar checker (8)
!	Mem[0000000030141400] = ffbbd85300003f00, %f12 = ff000000 ab71f314
	ldda	[%i5+%g0]0x89,%f12	! %f12 = ffbbd853 00003f00
!	Mem[0000000010101408] = ff000000, %l1 = faf8b9677994104a
	ldsba	[%i4+%o4]0x80,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000030081410] = 000000a5, %l2 = 000000000b3a9e16
	ldsba	[%i2+%o5]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000010001400] = 1bc5ce9a, %l2 = 0000000000000000
	ldsba	[%i0+%g0]0x88,%l2	! %l2 = ffffffffffffff9a
!	Mem[0000000030041408] = ffca11431ea5b41d, %l2 = ffffffffffffff9a
	ldxa	[%i1+%o4]0x81,%l2	! %l2 = ffca11431ea5b41d
!	Mem[0000000030181400] = f7724142 1e775f06 ffffffff ffffffa5
!	Mem[0000000030181410] = ffbbd853 00003f00 8eb54fdf f159e90e
!	Mem[0000000030181420] = 589ba7f5 534db6ba 35ec16f0 4424ff0d
!	Mem[0000000030181430] = 53ac191b 38a476df ff75bbe3 000000ff
	ldda	[%i6]ASI_BLK_AIUSL,%f16	! Block Load from 0000000030181400
!	Starting 10 instruction Store Burst
!	%l6 = 0000000089000000, Mem[0000000030141400] = 00003f00
	stha	%l6,[%i5+%g0]0x89	! Mem[0000000030141400] = 00000000

p0_label_50:
!	%f0  = ff000000, Mem[0000000010081410] = 000000a5
	sta	%f0 ,[%i2+%o5]0x88	! Mem[0000000010081410] = ff000000
!	Mem[0000000030001410] = 0b3a9e16, %l4 = 00000000000012ff
	ldstuba	[%i0+%o5]0x81,%l4	! %l4 = 0000000b000000ff
!	Mem[000000001000140c] = ff338946, %l7 = 00000000000000ff
	swap	[%i0+0x00c],%l7		! %l7 = 00000000ff338946
!	%f8  = dcfd2bef, Mem[0000000030081408] = a5000000
	sta	%f8 ,[%i2+%o4]0x81	! Mem[0000000030081408] = dcfd2bef
!	%f6  = 0b3a9e16, Mem[00000000100c1408] = 169e3a0b
	sta	%f6 ,[%i3+%o4]0x88	! Mem[00000000100c1408] = 0b3a9e16
!	Mem[0000000010041410] = a500ffff, %l7 = 00000000ff338946
	swapa	[%i1+%o5]0x80,%l7	! %l7 = 00000000a500ffff
!	%l4 = 000000000000000b, Mem[0000000030141400] = 00000000
	stha	%l4,[%i5+%g0]0x81	! Mem[0000000030141400] = 000b0000
!	Mem[0000000010181410] = 45dc0000, %l2 = ffca11431ea5b41d
	ldstuba	[%i6+%o5]0x80,%l2	! %l2 = 00000045000000ff
!	Mem[00000000300c1408] = 000000ff, %l5 = 00000000000000ff
	ldstuba	[%i3+%o4]0x89,%l5	! %l5 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = f837aaa5, %l7 = 00000000a500ffff
	lduba	[%i4+%g0]0x89,%l7	! %l7 = 00000000000000a5

!	Check Point 10 for processor 0

	set	p0_check_pt_data_10,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 000000000000001e
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = ffffffffffffffff
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 0000000000000045
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 000000000000006c
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 000000000000000b
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l7,%g2			! %l7 = 00000000000000a5
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x40],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = ff000000 0000582a
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x48],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = ffffbbae 89000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x50],%g3
	std	%f12,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f12 = ffbbd853 00003f00
	bne	%xcc,p0_freg_check_fail
	mov	0xf12,%g1
	ldx	[%g4+0x58],%g3
	std	%f16,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f16 = 065f771e 424172f7
	bne	%xcc,p0_freg_check_fail
	mov	0xf16,%g1
	ldx	[%g4+0x60],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = a5ffffff ffffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1
	ldx	[%g4+0x68],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = 003f0000 53d8bbff
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1
	ldx	[%g4+0x70],%g3
	std	%f22,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f22 = 0ee959f1 df4fb58e
	bne	%xcc,p0_freg_check_fail
	mov	0xf22,%g1
	ldx	[%g4+0x78],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = bab64d53 f5a79b58
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1
	ldx	[%g4+0x80],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = 0dff2444 f016ec35
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1
	ldx	[%g4+0x88],%g3
	std	%f28,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f28 = df76a438 1b19ac53
	bne	%xcc,p0_freg_check_fail
	mov	0xf28,%g1
	ldx	[%g4+0x90],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = ff000000 e3bb75ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 10 completed


p0_label_51:
!	Mem[0000000010041408] = 000000ff, %l4 = 000000000000000b
	lduha	[%i1+%o4]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030041408] = ffca1143, %l4 = 00000000000000ff
	lduba	[%i1+%o4]0x81,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030141400] = 00000b00, %f7  = e79997ba
	lda	[%i5+%g0]0x89,%f7 	! %f7 = 00000b00
!	Mem[0000000010081410] = ff000000, %l3 = 000000000000006c
	lduwa	[%i2+%o5]0x88,%l3	! %l3 = 00000000ff000000
!	Mem[00000000100c1400] = 00000000, %l7 = 00000000000000a5
	lduha	[%i3+%g0]0x80,%l7	! %l7 = 0000000000000000
!	Mem[00000000201c0000] = 0000af65, %l1 = ffffffffffffffff
	ldsh	[%o0+%g0],%l1		! %l1 = 0000000000000000
!	Mem[0000000010081420] = 9b4f0820, %l1 = 0000000000000000
	lduw	[%i2+0x020],%l1		! %l1 = 000000009b4f0820
!	Mem[0000000030081400] = 0000582a 1e775f06, %l0 = 0000001e, %l1 = 9b4f0820
	ldda	[%i2+%g0]0x89,%l0	! %l0 = 000000001e775f06 000000000000582a
!	Mem[00000000300c1408] = 000000ff, %l0 = 000000001e775f06
	lduha	[%i3+%o4]0x89,%l0	! %l0 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l0 = 000000ff, %l1 = 0000582a, Mem[00000000100c1410] = e350ffeb 3385fac5
	stda	%l0,[%i3+%o5]0x80	! Mem[00000000100c1410] = 000000ff 0000582a

p0_label_52:
!	Mem[00000000100c1408] = 169e3a0b, %l7 = 0000000000000000
	ldstuba	[%i3+%o4]0x80,%l7	! %l7 = 00000016000000ff
!	Mem[0000000030041410] = ff590dcc, %l5 = 00000000000000ff
	ldstuba	[%i1+%o5]0x81,%l5	! %l5 = 000000ff000000ff
!	%f24 = bab64d53, Mem[00000000300c1410] = 89000000
	sta	%f24,[%i3+%o5]0x89	! Mem[00000000300c1410] = bab64d53
!	Mem[000000001010142c] = 1ea5b41d, %l7 = 0000000000000016, %asi = 80
	swapa	[%i4+0x02c]%asi,%l7	! %l7 = 000000001ea5b41d
!	Mem[0000000010081410] = 000000ff, %l7 = 000000001ea5b41d
	swapa	[%i2+%o5]0x80,%l7	! %l7 = 00000000000000ff
!	%l3 = 00000000ff000000, Mem[00000000300c1400] = a3edf85746000000
	stxa	%l3,[%i3+%g0]0x89	! Mem[00000000300c1400] = 00000000ff000000
!	Mem[0000000030081400] = 065f771e, %l4 = 00000000000000ff
	swapa	[%i2+%g0]0x81,%l4	! %l4 = 00000000065f771e
!	%l7 = 00000000000000ff, Mem[0000000010041400] = a5000000
	stha	%l7,[%i1+%g0]0x80	! Mem[0000000010041400] = 00ff0000
!	%l1 = 000000000000582a, Mem[0000000010001410] = 00000046
	stha	%l1,[%i0+%o5]0x80	! Mem[0000000010001410] = 582a0046
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = 0000af65, %l0 = 00000000000000ff
	ldsba	[%o0+0x000]%asi,%l0	! %l0 = 0000000000000000

p0_label_53:
!	Mem[0000000010141430] = 57f8eda3 169e3a0b, %l2 = 00000045, %l3 = ff000000
	ldda	[%i5+0x030]%asi,%l2	! %l2 = 0000000057f8eda3 00000000169e3a0b
!	Mem[0000000030101408] = ffffbbae ff000000, %l4 = 065f771e, %l5 = 000000ff
	ldda	[%i4+%o4]0x89,%l4	! %l4 = 00000000ff000000 00000000ffffbbae
!	Mem[0000000030181408] = ffffffff, %l5 = 00000000ffffbbae
	lduba	[%i6+%o4]0x89,%l5	! %l5 = 00000000000000ff
	membar	#Sync			! Added by membar checker (9)
!	Mem[0000000010181400] = 065f771e 4241725d 000000a5 cbe83d6a
!	Mem[0000000010181410] = ffdc0000 00000046 00000000 0000003f
!	Mem[0000000010181420] = 4f61277f e46cbd64 5cca11ff 1ea5b41d
!	Mem[0000000010181430] = 1a1efd06 b2f265c0 a96e6a5a 864fc963
	ldda	[%i6]ASI_BLK_PL,%f16	! Block Load from 0000000010181400
!	Mem[0000000030081408] = dcfd2bef, %f15 = b11603f2
	lda	[%i2+%o4]0x81,%f15	! %f15 = dcfd2bef
!	Mem[0000000020800000] = ff497d94, %l6 = 0000000089000000
	ldub	[%o1+%g0],%l6		! %l6 = 00000000000000ff
!	Mem[0000000030101400] = a5aa37f8, %l2 = 0000000057f8eda3
	ldsha	[%i4+%g0]0x81,%l2	! %l2 = ffffffffffffa5aa
!	Mem[0000000010041408] = ff00000000000089, %l5 = 00000000000000ff
	ldxa	[%i1+%o4]0x80,%l5	! %l5 = ff00000000000089
!	Mem[0000000010181408] = 000000a5, %l2 = ffffffffffffa5aa
	lduwa	[%i6+%o4]0x80,%l2	! %l2 = 00000000000000a5
!	Starting 10 instruction Store Burst
!	%l2 = 00000000000000a5, Mem[00000000300c1400] = 000000ff
	stba	%l2,[%i3+%g0]0x81	! Mem[00000000300c1400] = a50000ff

p0_label_54:
!	%l2 = 000000a5, %l3 = 169e3a0b, Mem[0000000030101410] = 003f0000 7d447218
	stda	%l2,[%i4+%o5]0x81	! Mem[0000000030101410] = 000000a5 169e3a0b
!	%f6  = 0b3a9e16 00000b00, Mem[0000000030181410] = ffbbd853 00003f00
	stda	%f6 ,[%i6+%o5]0x81	! Mem[0000000030181410] = 0b3a9e16 00000b00
!	%l7 = 00000000000000ff, Mem[00000000300c1400] = ff0000a5
	stha	%l7,[%i3+%g0]0x89	! Mem[00000000300c1400] = ff0000ff
!	%l1 = 000000000000582a, Mem[00000000100c1410] = 000000ff
	stwa	%l1,[%i3+%o5]0x80	! Mem[00000000100c1410] = 0000582a
	membar	#Sync			! Added by membar checker (10)
!	%f14 = ea80797b, Mem[0000000010181408] = a5000000
	sta	%f14,[%i6+%o4]0x88	! Mem[0000000010181408] = ea80797b
!	%l2 = 00000000000000a5, Mem[00000000300c1410] = 534db6ba
	stba	%l2,[%i3+%o5]0x81	! Mem[00000000300c1410] = a54db6ba
!	%l0 = 0000000000000000, Mem[0000000010101400] = 1de65f3f
	stba	%l0,[%i4+%g0]0x88	! Mem[0000000010101400] = 1de65f00
!	Mem[0000000010181400] = 1e775f06, %l1 = 000000000000582a
	ldstuba	[%i6+%g0]0x88,%l1	! %l1 = 00000006000000ff
!	%l7 = 00000000000000ff, Mem[0000000030001408] = 104a0dcc4d7205ef
	stxa	%l7,[%i0+%o4]0x81	! Mem[0000000030001408] = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = 00000000, %l2 = 00000000000000a5
	ldsba	[%i3+%g0]0x80,%l2	! %l2 = 0000000000000000

p0_label_55:
!	Mem[0000000030041410] = ffbcecba cc0d59ff, %l6 = 000000ff, %l7 = 000000ff
	ldda	[%i1+%o5]0x89,%l6	! %l6 = 00000000cc0d59ff 00000000ffbcecba
!	Mem[0000000010181400] = 5d724142 1e775fff, %l6 = cc0d59ff, %l7 = ffbcecba
	ldda	[%i6+%g0]0x88,%l6	! %l6 = 000000001e775fff 000000005d724142
!	Mem[00000000201c0000] = 0000af65, %l5 = ff00000000000089
	ldsh	[%o0+%g0],%l5		! %l5 = 0000000000000000
!	Mem[0000000030101408] = 000000ffaebbffff, %f20 = 46000000 0000dcff
	ldda	[%i4+%o4]0x81,%f20	! %f20 = 000000ff aebbffff
!	Mem[0000000010141410] = ff0000a3, %l0 = 0000000000000000
	lduha	[%i5+0x010]%asi,%l0	! %l0 = 000000000000ff00
!	Mem[00000000100c1404] = 000000ff, %l1 = 0000000000000006
	ldsba	[%i3+0x004]%asi,%l1	! %l1 = 0000000000000000
!	Mem[0000000010081410] = 1ea5b41d, %l2 = 0000000000000000
	ldsba	[%i2+%o5]0x80,%l2	! %l2 = 000000000000001e
!	Mem[0000000010141408] = 894650e3, %f31 = 5a6a6ea9
	lda	[%i5+%o4]0x80,%f31	! %f31 = 894650e3
!	Mem[0000000010141400] = 53d8bbff, %l0 = 000000000000ff00
	lduba	[%i5+%g0]0x88,%l0	! %l0 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%f2  = ffffbbae 89000000, %l7 = 000000005d724142
!	Mem[0000000030141420] = 2b6fb6d4f63d61e3
	add	%i5,0x020,%g1
	stda	%f2,[%g1+%l7]ASI_PST16_S ! Mem[0000000030141420] = 2b6fb6d4890061e3

!	Check Point 11 for processor 0

	set	p0_check_pt_data_11,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 0000000000000000
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 000000000000001e
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 00000000169e3a0b
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 00000000ff000000
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 0000000000000000
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 000000001e775fff
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 000000005d724142
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = ff000000 0000582a
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x50],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = ffffbbae 89000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x58],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = c3ae2ea1 703f71ab
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x60],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 0b3a9e16 00000b00
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x68],%g3
	std	%f14,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f14 = ea80797b dcfd2bef
	bne	%xcc,p0_freg_check_fail
	mov	0xf14,%g1
	ldx	[%g4+0x70],%g3
	std	%f16,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f16 = 5d724142 1e775f06
	bne	%xcc,p0_freg_check_fail
	mov	0xf16,%g1
	ldx	[%g4+0x78],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = 6a3de8cb a5000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1
	ldx	[%g4+0x80],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = 000000ff aebbffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1
	ldx	[%g4+0x88],%g3
	std	%f22,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f22 = 3f000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf22,%g1
	ldx	[%g4+0x90],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = 64bd6ce4 7f27614f
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1
	ldx	[%g4+0x98],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = 1db4a51e ff11ca5c
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1
	ldx	[%g4+0xa0],%g3
	std	%f28,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f28 = c065f2b2 06fd1e1a
	bne	%xcc,p0_freg_check_fail
	mov	0xf28,%g1
	ldx	[%g4+0xa8],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = 63c94f86 894650e3
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 11 completed


p0_label_56:
!	Mem[0000000010081408] = 00000089, %l1 = 0000000000000000
	ldstuba	[%i2+%o4]0x88,%l1	! %l1 = 00000089000000ff
!	%f28 = c065f2b2 06fd1e1a, %l4 = 00000000ff000000
!	Mem[0000000030081408] = dcfd2bef00000000
	add	%i2,0x008,%g1
	stda	%f28,[%g1+%l4]ASI_PST8_S ! Mem[0000000030081408] = dcfd2bef00000000
!	%f0  = ff000000 0000582a ffffbbae 89000000
!	%f4  = c3ae2ea1 703f71ab 0b3a9e16 00000b00
!	%f8  = dcfd2bef 3c3e5de6 fddf7318 cbe83d6a
!	%f12 = ffbbd853 00003f00 ea80797b dcfd2bef
	stda	%f0,[%i3]ASI_BLK_AIUS	! Block Store to 00000000300c1400
!	%f30 = 63c94f86 894650e3, Mem[00000000300c1400] = ff000000 0000582a
	stda	%f30,[%i3+%g0]0x81	! Mem[00000000300c1400] = 63c94f86 894650e3
!	Mem[000000001000143c] = 0d0360a1, %l5 = 0000000000000000
	swap	[%i0+0x03c],%l5		! %l5 = 000000000d0360a1
!	%l0 = 00000000000000ff, Mem[0000000010001400] = 9acec51be33c87df
	stxa	%l0,[%i0+%g0]0x80	! Mem[0000000010001400] = 00000000000000ff
!	Mem[0000000030141400] = 000b0000, %l4 = 00000000ff000000
	swapa	[%i5+%g0]0x81,%l4	! %l4 = 00000000000b0000
!	Mem[0000000010141408] = 894650e3, %l4 = 00000000000b0000
	ldstuba	[%i5+%o4]0x80,%l4	! %l4 = 00000089000000ff
!	%l5 = 000000000d0360a1, Mem[00000000201c0001] = 0000af65, %asi = 80
	stba	%l5,[%o0+0x001]%asi	! Mem[00000000201c0000] = 00a1af65
!	Starting 10 instruction Load Burst
!	Mem[0000000010141428] = 0b2f22d4, %l5 = 000000000d0360a1
	lduba	[%i5+0x02b]%asi,%l5	! %l5 = 00000000000000d4

p0_label_57:
!	Mem[0000000030081400] = ff000000, %l1 = 0000000000000089
	lduwa	[%i2+%g0]0x89,%l1	! %l1 = 00000000ff000000
	membar	#Sync			! Added by membar checker (11)
!	Mem[00000000300c1400] = 864fc963, %l7 = 000000005d724142
	lduba	[%i3+%g0]0x89,%l7	! %l7 = 0000000000000063
!	Mem[0000000030141410] = 169e3a0b, %l5 = 00000000000000d4
	ldsha	[%i5+%o5]0x89,%l5	! %l5 = 0000000000003a0b
!	Mem[0000000030101400] = f837aaa5, %l1 = 00000000ff000000
	lduba	[%i4+%g0]0x89,%l1	! %l1 = 00000000000000a5
!	Mem[0000000030181400] = 424172f7, %l5 = 0000000000003a0b
	lduha	[%i6+%g0]0x89,%l5	! %l5 = 00000000000072f7
!	Mem[00000000300c1400] = 63c94f86, %l3 = 00000000169e3a0b
	lduba	[%i3+%g0]0x81,%l3	! %l3 = 0000000000000063
!	Mem[0000000010101410] = 000000ff, %l0 = 00000000000000ff
	ldsba	[%i4+%o5]0x88,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010001408] = 00000000 000000ff, %l4 = 00000089, %l5 = 000072f7
	ldda	[%i0+%o4]0x80,%l4	! %l4 = 0000000000000000 00000000000000ff
!	Mem[00000000300c1408] = ffffbbae89000000, %f22 = 3f000000 00000000
	ldda	[%i3+%o4]0x81,%f22	! %f22 = ffffbbae 89000000
!	Starting 10 instruction Store Burst
!	%l3 = 0000000000000063, Mem[0000000030101408] = ffffbbaeff000000
	stxa	%l3,[%i4+%o4]0x89	! Mem[0000000030101408] = 0000000000000063

p0_label_58:
!	%l7 = 0000000000000063, Mem[0000000010001428] = b7ba6aa9000000f3
	stx	%l7,[%i0+0x028]		! Mem[0000000010001428] = 0000000000000063
!	%l6 = 1e775fff, %l7 = 00000063, Mem[0000000030101410] = 000000a5 169e3a0b
	stda	%l6,[%i4+%o5]0x81	! Mem[0000000030101410] = 1e775fff 00000063
!	Mem[0000000030101400] = f837aaa5, %l3 = 0000000000000063
	swapa	[%i4+%g0]0x89,%l3	! %l3 = 00000000f837aaa5
!	Mem[0000000010001410] = 582a0046, %l4 = 0000000000000000
	ldstuba	[%i0+%o5]0x80,%l4	! %l4 = 00000058000000ff
!	Mem[0000000010081400] = 4a8933ff, %l6 = 000000001e775fff
	swapa	[%i2+%g0]0x80,%l6	! %l6 = 000000004a8933ff
!	%l5 = 00000000000000ff, Mem[0000000010141400] = 53d8bbff
	stwa	%l5,[%i5+%g0]0x88	! Mem[0000000010141400] = 000000ff
!	%l6 = 4a8933ff, %l7 = 00000063, Mem[0000000030181408] = ffffffff ffffffa5
	stda	%l6,[%i6+%o4]0x81	! Mem[0000000030181408] = 4a8933ff 00000063
!	%l4 = 0000000000000058, Mem[0000000010101418] = faf8b967
	sth	%l4,[%i4+0x018]		! Mem[0000000010101418] = 0058b967
!	Mem[0000000030001408] = 00000000, %l7 = 0000000000000063
	ldstuba	[%i0+%o4]0x81,%l7	! %l7 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = a3000000, %l3 = 00000000f837aaa5
	ldsba	[%i1+%g0]0x81,%l3	! %l3 = ffffffffffffffa3

p0_label_59:
!	Mem[00000000100c1410] = 0000582a, %f30 = 63c94f86
	lda	[%i3+%o5]0x80,%f30	! %f30 = 0000582a
!	Mem[0000000010101400] = 005fe61d468933ff, %l7 = 0000000000000000
	ldxa	[%i4+%g0]0x80,%l7	! %l7 = 005fe61d468933ff
!	Mem[0000000010041410] = ff338946, %l0 = ffffffffffffffff
	lduba	[%i1+%o5]0x80,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030041400] = 000000a3, %l0 = 00000000000000ff
	ldsba	[%i1+%g0]0x89,%l0	! %l0 = ffffffffffffffa3
!	Mem[000000001018140c] = cbe83d6a, %l3 = ffffffffffffffa3
	lduw	[%i6+0x00c],%l3		! %l3 = 00000000cbe83d6a
!	Mem[0000000030141400] = ff000000 53d8bbff 4a106245 e3504689
!	Mem[0000000030141410] = 0b3a9e16 a3edf857 e350ffeb 3385fac5
!	Mem[0000000030141420] = 2b6fb6d4 890061e3 63c94f86 d4222f0b
!	Mem[0000000030141430] = 57f8eda3 f837aaa5 0b3a9e16 e79997ba
	ldda	[%i5]ASI_BLK_AIUSL,%f16	! Block Load from 0000000030141400
!	Mem[00000000100c1430] = 00000000 00003a0b, %l6 = 4a8933ff, %l7 = 468933ff
	ldda	[%i3+0x030]%asi,%l6	! %l6 = 0000000000000000 0000000000003a0b
!	Mem[00000000100c1400] = 00000000 000000ff, %l4 = 00000058, %l5 = 000000ff
	ldda	[%i3+%g0]0x80,%l4	! %l4 = 0000000000000000 00000000000000ff
!	Mem[0000000030041410] = ff590dcc, %l6 = 0000000000000000
	ldsha	[%i1+%o5]0x81,%l6	! %l6 = ffffffffffffff59
!	Starting 10 instruction Store Burst
!	%l3 = 00000000cbe83d6a, Mem[0000000010001404] = 000000ff, %asi = 80
	stwa	%l3,[%i0+0x004]%asi	! Mem[0000000010001404] = cbe83d6a

p0_label_60:
!	%l3 = 00000000cbe83d6a, Mem[0000000030181408] = 4a8933ff
	stha	%l3,[%i6+%o4]0x81	! Mem[0000000030181408] = 3d6a33ff
!	%l7 = 0000000000003a0b, Mem[0000000010001400] = 00000000
	stba	%l7,[%i0+%g0]0x88	! Mem[0000000010001400] = 0000000b
!	%f12 = ffbbd853 00003f00, Mem[0000000010081410] = 1ea5b41d 662f26ed
	stda	%f12,[%i2+%o5]0x80	! Mem[0000000010081410] = ffbbd853 00003f00
!	%l7 = 0000000000003a0b, Mem[000000001014142a] = 0b2f22d4
	stb	%l7,[%i5+0x02a]		! Mem[0000000010141428] = 0b2f0bd4
!	%l5 = 00000000000000ff, Mem[0000000010001410] = ff2a0046000000ff
	stxa	%l5,[%i0+%o5]0x80	! Mem[0000000010001410] = 00000000000000ff
!	Mem[0000000030141400] = ff000000, %l6 = ffffffffffffff59
	ldstuba	[%i5+%g0]0x81,%l6	! %l6 = 000000ff000000ff
!	%l0 = ffffffa3, %l1 = 000000a5, Mem[0000000030101408] = 63000000 00000000
	stda	%l0,[%i4+%o4]0x81	! Mem[0000000030101408] = ffffffa3 000000a5
!	Mem[00000000100c1408] = 0b3a9eff, %l7 = 0000000000003a0b
	swapa	[%i3+%o4]0x88,%l7	! %l7 = 000000000b3a9eff
!	%f13 = 00003f00, Mem[0000000010101400] = 1de65f00
	sta	%f13,[%i4+%g0]0x88	! Mem[0000000010101400] = 00003f00
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = f77241421e775f06, %l0 = ffffffffffffffa3
	ldxa	[%i6+%g0]0x81,%l0	! %l0 = f77241421e775f06

!	Check Point 12 for processor 0

	set	p0_check_pt_data_12,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = f77241421e775f06
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 00000000000000a5
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l3,%g2			! %l3 = 00000000cbe83d6a
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l4,%g2			! %l4 = 0000000000000000
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l5,%g2			! %l5 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l6,%g2			! %l6 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l7,%g2			! %l7 = 000000000b3a9eff
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x40],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = c3ae2ea1 703f71ab
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x48],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 0b3a9e16 00000b00
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x50],%g3
	std	%f16,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f16 = ffbbd853 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf16,%g1
	ldx	[%g4+0x58],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = 894650e3 4562104a
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1
	ldx	[%g4+0x60],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = 57f8eda3 169e3a0b
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1
	ldx	[%g4+0x68],%g3
	std	%f22,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f22 = c5fa8533 ebff50e3
	bne	%xcc,p0_freg_check_fail
	mov	0xf22,%g1
	ldx	[%g4+0x70],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = e3610089 d4b66f2b
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1
	ldx	[%g4+0x78],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = 0b2f22d4 864fc963
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1
	ldx	[%g4+0x80],%g3
	std	%f28,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f28 = a5aa37f8 a3edf857
	bne	%xcc,p0_freg_check_fail
	mov	0xf28,%g1
	ldx	[%g4+0x88],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = ba9799e7 169e3a0b
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 12 completed


p0_label_61:
!	Mem[0000000010181400] = ff5f771e, %l6 = 00000000000000ff
	lduba	[%i6+%g0]0x80,%l6	! %l6 = 00000000000000ff
!	Mem[00000000300c1408] = ffffbbae, %l2 = 000000000000001e
	lduha	[%i3+%o4]0x81,%l2	! %l2 = 000000000000ffff
!	Mem[0000000030001410] = 169e3aff, %l7 = 000000000b3a9eff
	ldsha	[%i0+%o5]0x89,%l7	! %l7 = 0000000000003aff
!	Mem[00000000100c1418] = 59755bee, %f22 = c5fa8533
	ld	[%i3+0x018],%f22	! %f22 = 59755bee
!	Mem[00000000300c1408] = ffffbbae89000000, %l5 = 00000000000000ff
	ldxa	[%i3+%o4]0x81,%l5	! %l5 = ffffbbae89000000
!	Mem[0000000010101430] = 3311a06f, %l2 = 000000000000ffff
	lduh	[%i4+0x032],%l2		! %l2 = 000000000000a06f
!	Mem[00000000300c1408] = ffffbbae 89000000, %l6 = 000000ff, %l7 = 00003aff
	ldda	[%i3+%o4]0x81,%l6	! %l6 = 00000000ffffbbae 0000000089000000
!	Mem[0000000010081424] = a48e84c7, %l7 = 0000000089000000
	ldsba	[%i2+0x025]%asi,%l7	! %l7 = ffffffffffffff8e
!	Mem[0000000030041410] = ff590dcc, %l7 = ffffffffffffff8e
	ldsha	[%i1+%o5]0x81,%l7	! %l7 = ffffffffffffff59
!	Starting 10 instruction Store Burst
!	%l0 = 1e775f06, %l1 = 000000a5, Mem[0000000030041410] = ff590dcc baecbcff
	stda	%l0,[%i1+%o5]0x81	! Mem[0000000030041410] = 1e775f06 000000a5

p0_label_62:
!	Mem[0000000010081400] = ff5f771e, %l4 = 0000000000000000
	ldsha	[%i2+%g0]0x88,%l4	! %l4 = 000000000000771e
!	%f30 = ba9799e7 169e3a0b, %l6 = 00000000ffffbbae
!	Mem[0000000030101430] = 545bb8c449e8dbec
	add	%i4,0x030,%g1
	stda	%f30,[%g1+%l6]ASI_PST8_SL ! Mem[0000000030101430] = 543a9e164999dbba
!	%l4 = 0000771e, %l5 = 89000000, Mem[0000000010101408] = ff000000 ff425a7c
	stda	%l4,[%i4+%o4]0x80	! Mem[0000000010101408] = 0000771e 89000000
!	%l1 = 00000000000000a5, Mem[0000000020800001] = ff497d94
	stb	%l1,[%o1+0x001]		! Mem[0000000020800000] = ffa57d94
!	Code Fragment 3
p0_fragment_2:
!	%l0 = f77241421e775f06
	setx	0x8c064defbcbbeeb1,%g7,%l0 ! %l0 = 8c064defbcbbeeb1
!	%l1 = 00000000000000a5
	setx	0x8f4759d04eaf42ef,%g7,%l1 ! %l1 = 8f4759d04eaf42ef
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 8c064defbcbbeeb1
	setx	0xb596f58fb2062d22,%g7,%l0 ! %l0 = b596f58fb2062d22
!	%l1 = 8f4759d04eaf42ef
	setx	0xbac60dc86af3ae9c,%g7,%l1 ! %l1 = bac60dc86af3ae9c
!	%l4 = 000000000000771e, Mem[0000000010081400] = ff5f771e
	stha	%l4,[%i2+%g0]0x88	! Mem[0000000010081400] = ff5f771e
!	%l3 = 00000000cbe83d6a, Mem[0000000030001400] = 57f8eda3
	stba	%l3,[%i0+%g0]0x89	! Mem[0000000030001400] = 57f8ed6a
!	%f18 = 894650e3 4562104a, %l6 = 00000000ffffbbae
!	Mem[0000000010041408] = ff00000000000089
	add	%i1,0x008,%g1
	stda	%f18,[%g1+%l6]ASI_PST32_PL ! Mem[0000000010041408] = ff000000e3504689
!	%l1 = bac60dc86af3ae9c, Mem[00000000100c1408] = 0b3a0000e79997ba
	stxa	%l1,[%i3+%o4]0x80	! Mem[00000000100c1408] = bac60dc86af3ae9c
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = aebbffff, %l2 = 000000000000a06f
	lduha	[%i3+%o4]0x89,%l2	! %l2 = 000000000000ffff

p0_label_63:
!	Mem[00000000100c1408] = c80dc6ba, %f21 = 169e3a0b
	lda	[%i3+%o4]0x88,%f21	! %f21 = c80dc6ba
!	Mem[0000000010081410] = 003f000053d8bbff, %f22 = 59755bee ebff50e3
	ldda	[%i2+%o5]0x88,%f22	! %f22 = 003f0000 53d8bbff
!	Mem[0000000021800040] = e784b2d9, %l6 = 00000000ffffbbae
	ldub	[%o3+0x041],%l6		! %l6 = 0000000000000084
!	Mem[0000000010101430] = 3311a06f, %l0 = b596f58fb2062d22
	ldsha	[%i4+0x032]%asi,%l0	! %l0 = ffffffffffffa06f
!	Mem[00000000100c142c] = 2cb42ea1, %l4 = 000000000000771e
	ldsha	[%i3+0x02e]%asi,%l4	! %l4 = 0000000000002ea1
!	Mem[0000000010041424] = a3edf857, %l5 = ffffbbae89000000
	ldsh	[%i1+0x026],%l5		! %l5 = fffffffffffff857
!	Mem[0000000010141400] = 000000ff, %l4 = 0000000000002ea1
	ldsha	[%i5+%g0]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030041410] = 065f771e, %l5 = fffffffffffff857
	ldswa	[%i1+%o5]0x89,%l5	! %l5 = 00000000065f771e
!	Mem[000000001014143c] = 169e3a0b, %f21 = c80dc6ba
	ld	[%i5+0x03c],%f21	! %f21 = 169e3a0b
!	Starting 10 instruction Store Burst
!	%f20 = 57f8eda3, Mem[0000000010001410] = 00000000
	sta	%f20,[%i0+%o5]0x80	! Mem[0000000010001410] = 57f8eda3

p0_label_64:
!	%f28 = a5aa37f8 a3edf857, Mem[0000000030081408] = ef2bfddc 00000000
	stda	%f28,[%i2+%o4]0x89	! Mem[0000000030081408] = a5aa37f8 a3edf857
!	Mem[0000000030141400] = 000000ff, %l5 = 00000000065f771e
	swapa	[%i5+%g0]0x89,%l5	! %l5 = 00000000000000ff
!	%l2 = 0000ffff, %l3 = cbe83d6a, Mem[0000000030101400] = 63000000 a3edf857
	stda	%l2,[%i4+%g0]0x81	! Mem[0000000030101400] = 0000ffff cbe83d6a
!	%f30 = ba9799e7 169e3a0b, %l3 = 00000000cbe83d6a
!	Mem[0000000030001408] = ff000000000000ff
	add	%i0,0x008,%g1
	stda	%f30,[%g1+%l3]ASI_PST8_SL ! Mem[0000000030001408] = ff3a0016009997ff
!	%f0  = ff000000 0000582a ffffbbae 89000000
!	%f4  = c3ae2ea1 703f71ab 0b3a9e16 00000b00
!	%f8  = dcfd2bef 3c3e5de6 fddf7318 cbe83d6a
!	%f12 = ffbbd853 00003f00 ea80797b dcfd2bef
	stda	%f0,[%i4]ASI_BLK_P	! Block Store to 0000000010101400
!	%f18 = 894650e3 4562104a, Mem[0000000030181410] = 0b3a9e16 00000b00
	stda	%f18,[%i6+%o5]0x81	! Mem[0000000030181410] = 894650e3 4562104a
!	Mem[000000001014143c] = 169e3a0b, %l7 = ffffffffffffff59, %asi = 80
	swapa	[%i5+0x03c]%asi,%l7	! %l7 = 00000000169e3a0b
!	%l6 = 0000000000000084, immd = 0000000000000ba9, %l0  = ffffffffffffa06f
	mulx	%l6,0xba9,%l0		! %l0 = 0000000000060324
!	Mem[0000000010081400] = ff5f771e, %l5 = 00000000000000ff
	ldstuba	[%i2+%g0]0x88,%l5	! %l5 = 0000001e000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = 00a1af65, %l6 = 0000000000000084
	lduha	[%o0+0x000]%asi,%l6	! %l6 = 00000000000000a1

p0_label_65:
!	Mem[0000000010001400] = 0b000000 cbe83d6a, %l0 = 00060324, %l1 = 6af3ae9c
	ldda	[%i0+%g0]0x80,%l0	! %l0 = 000000000b000000 00000000cbe83d6a
!	Mem[0000000010041400] = 00ff00002cb42ea1, %l5 = 000000000000001e
	ldxa	[%i1+0x000]%asi,%l5	! %l5 = 00ff00002cb42ea1
!	Mem[0000000030181408] = 3d6a33ff00000063, %f28 = a5aa37f8 a3edf857
	ldda	[%i6+%o4]0x81,%f28	! %f28 = 3d6a33ff 00000063
	membar	#Sync			! Added by membar checker (12)
!	Mem[0000000010101410] = c3ae2ea1703f71ab, %l6 = 00000000000000a1
	ldxa	[%i4+%o5]0x80,%l6	! %l6 = c3ae2ea1703f71ab
!	Mem[0000000010181400] = ff5f771e 4241725d 7b7980ea cbe83d6a
!	Mem[0000000010181410] = ffdc0000 00000046 00000000 0000003f
!	Mem[0000000010181420] = 4f61277f e46cbd64 5cca11ff 1ea5b41d
!	Mem[0000000010181430] = 1a1efd06 b2f265c0 a96e6a5a 864fc963
	ldda	[%i6]ASI_BLK_P,%f16	! Block Load from 0000000010181400
!	Mem[0000000010181424] = e46cbd64, %l2 = 000000000000ffff
	ldsb	[%i6+0x024],%l2		! %l2 = ffffffffffffffe4
!	Mem[0000000030081400] = ff000000, %l0 = 000000000b000000
	ldsha	[%i2+%g0]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000030081408] = 57f8eda3f837aaa5, %f0  = ff000000 0000582a
	ldda	[%i2+%o4]0x81,%f0 	! %f0  = 57f8eda3 f837aaa5
!	Mem[00000000100c1400] = 00000000, %f7  = 00000b00
	lda	[%i3+%g0]0x88,%f7 	! %f7 = 00000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030041408] = 4311caff, %l3 = 00000000cbe83d6a
	ldstuba	[%i1+%o4]0x89,%l3	! %l3 = 000000ff000000ff

!	Check Point 13 for processor 0

	set	p0_check_pt_data_13,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 0000000000000000
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 00000000cbe83d6a
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = ffffffffffffffe4
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 00ff00002cb42ea1
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = c3ae2ea1703f71ab
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 00000000169e3a0b
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = 57f8eda3 f837aaa5
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x50],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 0b3a9e16 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x58],%g3
	std	%f16,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f16 = ff5f771e 4241725d
	bne	%xcc,p0_freg_check_fail
	mov	0xf16,%g1
	ldx	[%g4+0x60],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = 7b7980ea cbe83d6a
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1
	ldx	[%g4+0x68],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = ffdc0000 00000046
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1
	ldx	[%g4+0x70],%g3
	std	%f22,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f22 = 00000000 0000003f
	bne	%xcc,p0_freg_check_fail
	mov	0xf22,%g1
	ldx	[%g4+0x78],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = 4f61277f e46cbd64
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1
	ldx	[%g4+0x80],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = 5cca11ff 1ea5b41d
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1
	ldx	[%g4+0x88],%g3
	std	%f28,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f28 = 1a1efd06 b2f265c0
	bne	%xcc,p0_freg_check_fail
	mov	0xf28,%g1
	ldx	[%g4+0x90],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = a96e6a5a 864fc963
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 13 completed


p0_label_66:
!	%l3 = 00000000000000ff, Mem[0000000030141408] = 4a106245e3504689
	stxa	%l3,[%i5+%o4]0x81	! Mem[0000000030141408] = 00000000000000ff
!	Mem[00000000300c1400] = 63c94f86, %l5 = 00ff00002cb42ea1
	ldstuba	[%i3+%g0]0x81,%l5	! %l5 = 00000063000000ff
!	%l3 = 00000000000000ff, Mem[0000000010041400] = 0000ff00
	stba	%l3,[%i1+%g0]0x88	! Mem[0000000010041400] = 0000ffff
!	Mem[0000000010101408] = aebbffff, %l6 = c3ae2ea1703f71ab
	swapa	[%i4+%o4]0x88,%l6	! %l6 = 00000000aebbffff
!	%f13 = 00003f00, Mem[0000000030001410] = 169e3aff
	sta	%f13,[%i0+%o5]0x89	! Mem[0000000030001410] = 00003f00
!	Mem[0000000030101410] = ff5f771e, %l7 = 00000000169e3a0b
	swapa	[%i4+%o5]0x89,%l7	! %l7 = 00000000ff5f771e
!	%l7 = 00000000ff5f771e, Mem[00000000100c1400] = ff00000000000000
	stxa	%l7,[%i3+%g0]0x88	! Mem[00000000100c1400] = 00000000ff5f771e
!	%f28 = 1a1efd06 b2f265c0, %l0 = 0000000000000000
!	Mem[00000000300c1428] = fddf7318cbe83d6a
	add	%i3,0x028,%g1
	stda	%f28,[%g1+%l0]ASI_PST16_SL ! Mem[00000000300c1428] = fddf7318cbe83d6a
!	%l7 = 00000000ff5f771e, Mem[00000000100c1400] = ff5f771e
	stwa	%l7,[%i3+%g0]0x88	! Mem[00000000100c1400] = ff5f771e
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = 468933ff000000a3, %f18 = 7b7980ea cbe83d6a
	ldda	[%i1+%g0]0x89,%f18	! %f18 = 468933ff 000000a3

p0_label_67:
!	Mem[0000000020800040] = 7fffac70, %l5 = 0000000000000063
	lduha	[%o1+0x040]%asi,%l5	! %l5 = 0000000000007fff
!	Mem[0000000020800040] = 7fffac70, %l2 = ffffffffffffffe4
	ldsb	[%o1+0x040],%l2		! %l2 = 000000000000007f
!	Mem[0000000010101428] = fddf7318, %l2 = 000000000000007f
	ldsh	[%i4+0x028],%l2		! %l2 = fffffffffffffddf
!	Mem[00000000300c1400] = 864fc9ff, %l3 = 00000000000000ff
	lduwa	[%i3+%g0]0x89,%l3	! %l3 = 00000000864fc9ff
!	Mem[0000000010141404] = 0000582a, %l5 = 0000000000007fff
	lduw	[%i5+0x004],%l5		! %l5 = 000000000000582a
!	Mem[0000000010001438] = c1622dba, %l6 = 00000000aebbffff
	lduw	[%i0+0x038],%l6		! %l6 = 00000000c1622dba
!	Mem[0000000010041408] = ff000000e3504689, %f14 = ea80797b dcfd2bef
	ldda	[%i1+%o4]0x80,%f14	! %f14 = ff000000 e3504689
!	Mem[0000000010001410] = a3edf857, %f22 = 00000000
	lda	[%i0+%o5]0x88,%f22	! %f22 = a3edf857
!	Mem[0000000020800040] = 7fffac70, %l6 = 00000000c1622dba
	ldsh	[%o1+0x040],%l6		! %l6 = 0000000000007fff
!	Starting 10 instruction Store Burst
!	%l2 = fffffffffffffddf, Mem[0000000030181408] = 3d6a33ff00000063
	stxa	%l2,[%i6+%o4]0x81	! Mem[0000000030181408] = fffffffffffffddf

p0_label_68:
!	%f20 = ffdc0000 00000046, Mem[0000000010041418] = fff7f72c 3106d0a1
	stda	%f20,[%i1+0x018]%asi	! Mem[0000000010041418] = ffdc0000 00000046
!	%l0 = 0000000000000000, Mem[0000000030181410] = 4a106245e3504689
	stxa	%l0,[%i6+%o5]0x89	! Mem[0000000030181410] = 0000000000000000
!	%l5 = 000000000000582a, Mem[0000000010041418] = ffdc0000
	stb	%l5,[%i1+0x018]		! Mem[0000000010041418] = 2adc0000
!	Mem[0000000010181428] = 5cca11ff, %l4 = 00000000000000ff, %asi = 80
	swapa	[%i6+0x028]%asi,%l4	! %l4 = 000000005cca11ff
!	Mem[0000000030181400] = f7724142, %l5 = 000000000000582a
	ldstuba	[%i6+%g0]0x81,%l5	! %l5 = 000000f7000000ff
!	Mem[0000000010101408] = 703f71ab, %l4 = 000000005cca11ff
	swapa	[%i4+%o4]0x88,%l4	! %l4 = 00000000703f71ab
!	%l6 = 0000000000007fff, Mem[0000000010141410] = ff0000a3
	stha	%l6,[%i5+%o5]0x80	! Mem[0000000010141410] = 7fff00a3
!	Mem[0000000030141410] = 169e3a0b, %l4 = 00000000703f71ab
	swapa	[%i5+%o5]0x89,%l4	! %l4 = 00000000169e3a0b
	membar	#Sync			! Added by membar checker (13)
!	%l6 = 00007fff, %l7 = ff5f771e, Mem[0000000010181410] = ffdc0000 00000046
	stda	%l6,[%i6+%o5]0x80	! Mem[0000000010181410] = 00007fff ff5f771e
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = ffffbbae, %l5 = 00000000000000f7
	lduha	[%i3+%o4]0x81,%l5	! %l5 = 000000000000ffff

p0_label_69:
!	Mem[0000000010141410] = 7fff00a3, %l4 = 00000000169e3a0b
	lduha	[%i5+%o5]0x80,%l4	! %l4 = 0000000000007fff
!	Mem[0000000030101408] = ffffffa3, %l5 = 000000000000ffff
	lduha	[%i4+%o4]0x81,%l5	! %l5 = 000000000000ffff
!	Mem[0000000010181408] = 7b7980eacbe83d6a, %l6 = 0000000000007fff
	ldx	[%i6+%o4],%l6		! %l6 = 7b7980eacbe83d6a
!	Mem[0000000010141410] = a300ff7f, %l3 = 00000000864fc9ff
	lduba	[%i5+%o5]0x88,%l3	! %l3 = 000000000000007f
!	Mem[0000000010141414] = 169e3a0b, %l6 = 7b7980eacbe83d6a
	lduwa	[%i5+0x014]%asi,%l6	! %l6 = 00000000169e3a0b
!	Mem[0000000030141410] = 703f71ab, %l4 = 0000000000007fff
	lduwa	[%i5+%o5]0x89,%l4	! %l4 = 00000000703f71ab
!	Mem[0000000030181400] = ff724142, %l2 = fffffffffffffddf
	lduba	[%i6+%g0]0x81,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010041408] = 000000ff, %l5 = 000000000000ffff
	lduha	[%i1+%o4]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010101408] = ff11ca5c 89000000, %l4 = 703f71ab, %l5 = 000000ff
	ldd	[%i4+%o4],%l4		! %l4 = 00000000ff11ca5c 0000000089000000
!	Starting 10 instruction Store Burst
!	%l3 = 000000000000007f, Mem[00000000300c1400] = ffc94f86894650e3
	stxa	%l3,[%i3+%g0]0x81	! Mem[00000000300c1400] = 000000000000007f

p0_label_70:
!	Mem[0000000020800001] = ffa57d94, %l6 = 00000000169e3a0b
	ldstub	[%o1+0x001],%l6		! %l6 = 000000a5000000ff
!	%l6 = 000000a5, %l7 = ff5f771e, Mem[00000000100c1408] = c80dc6ba 9caef36a
	stda	%l6,[%i3+%o4]0x88	! Mem[00000000100c1408] = 000000a5 ff5f771e
!	Mem[0000000010001400] = 0b000000, %l7 = 00000000ff5f771e
	swapa	[%i0+%g0]0x80,%l7	! %l7 = 000000000b000000
!	%l5 = 0000000089000000, Mem[0000000030001400] = ab713f7057f8ed6a
	stxa	%l5,[%i0+%g0]0x89	! Mem[0000000030001400] = 0000000089000000
!	Mem[00000000201c0001] = 00a1af65, %l4 = 00000000ff11ca5c
	ldstub	[%o0+0x001],%l4		! %l4 = 000000a1000000ff
!	%f18 = 468933ff 000000a3, Mem[00000000300c1410] = c3ae2ea1 703f71ab
	stda	%f18,[%i3+%o5]0x81	! Mem[00000000300c1410] = 468933ff 000000a3
!	Mem[0000000010001410] = a3edf857, %l1 = 00000000cbe83d6a
	swapa	[%i0+%o5]0x88,%l1	! %l1 = 00000000a3edf857
!	%l0 = 0000000000000000, Mem[0000000030141410] = ab713f70
	stba	%l0,[%i5+%o5]0x81	! Mem[0000000030141410] = 00713f70
!	Mem[0000000010001418] = ccbe12ae0000003f, %l3 = 000000000000007f, %l3 = 000000000000007f
	add	%i0,0x18,%g1
	casxa	[%g1]0x80,%l3,%l3	! %l3 = ccbe12ae0000003f
!	Starting 10 instruction Load Burst
!	Mem[000000001018142c] = 1ea5b41d, %f0  = 57f8eda3
	ld	[%i6+0x02c],%f0 	! %f0 = 1ea5b41d

!	Check Point 14 for processor 0

	set	p0_check_pt_data_14,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l2,%g2			! %l2 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l3,%g2			! %l3 = ccbe12ae0000003f
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l4,%g2			! %l4 = 00000000000000a1
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l5,%g2			! %l5 = 0000000089000000
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l6,%g2			! %l6 = 00000000000000a5
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x30],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = 1ea5b41d f837aaa5
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x38],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = c3ae2ea1 703f71ab
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x40],%g3
	std	%f14,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f14 = ff000000 e3504689
	bne	%xcc,p0_freg_check_fail
	mov	0xf14,%g1
	ldx	[%g4+0x48],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = 468933ff 000000a3
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1
	ldx	[%g4+0x50],%g3
	std	%f22,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f22 = a3edf857 0000003f
	bne	%xcc,p0_freg_check_fail
	mov	0xf22,%g1

!	Check Point 14 completed


p0_label_71:
!	Mem[0000000030181408] = ffffffff, %l2 = 00000000000000ff
	ldsba	[%i6+%o4]0x89,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000030041408] = 4311caff, %f24 = 4f61277f
	lda	[%i1+%o4]0x89,%f24	! %f24 = 4311caff
!	Mem[0000000010081410] = ffbbd853, %f10 = fddf7318
	lda	[%i2+%o5]0x80,%f10	! %f10 = ffbbd853
!	Mem[0000000010181438] = a96e6a5a 864fc963, %l0 = 00000000, %l1 = a3edf857
	ldd	[%i6+0x038],%l0		! %l0 = 00000000a96e6a5a 00000000864fc963
!	Mem[0000000030001410] = 003f0000, %f16 = ff5f771e
	lda	[%i0+%o5]0x81,%f16	! %f16 = 003f0000
!	Mem[00000000300c1400] = 00000000, %l2 = ffffffffffffffff
	lduha	[%i3+%g0]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000030101410] = 63000000 169e3a0b, %l6 = 000000a5, %l7 = 0b000000
	ldda	[%i4+%o5]0x89,%l6	! %l6 = 00000000169e3a0b 0000000063000000
!	Mem[0000000010181400] = ff5f771e4241725d, %f30 = a96e6a5a 864fc963
	ldda	[%i6+%g0]0x80,%f30	! %f30 = ff5f771e 4241725d
!	Mem[0000000030001400] = 00000089, %l2 = 0000000000000000
	ldsba	[%i0+%g0]0x81,%l2	! %l2 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l0 = 00000000a96e6a5a, Mem[0000000030181400] = 065f771e424172ff
	stxa	%l0,[%i6+%g0]0x89	! Mem[0000000030181400] = 00000000a96e6a5a

p0_label_72:
!	%f20 = ffdc0000 00000046, Mem[00000000100c1408] = a5000000 1e775fff
	stda	%f20,[%i3+%o4]0x80	! Mem[00000000100c1408] = ffdc0000 00000046
!	Mem[00000000211c0000] = ff877bbb, %l7 = 0000000063000000
	ldstub	[%o2+%g0],%l7		! %l7 = 000000ff000000ff
!	Mem[0000000010101408] = ff11ca5c, %l7 = 00000000000000ff
	swapa	[%i4+%o4]0x80,%l7	! %l7 = 00000000ff11ca5c
!	%f18 = 468933ff 000000a3, %l1 = 00000000864fc963
!	Mem[0000000010001438] = c1622dba00000000
	add	%i0,0x038,%g1
	stda	%f18,[%g1+%l1]ASI_PST8_PL ! Mem[0000000010001438] = a3002dba00338900
!	Mem[0000000010001410] = 6a3de8cb, %l6 = 00000000169e3a0b
	swapa	[%i0+%o5]0x80,%l6	! %l6 = 000000006a3de8cb
!	%f10 = ffbbd853, Mem[0000000030101400] = 0000ffff
	sta	%f10,[%i4+%g0]0x81	! Mem[0000000030101400] = ffbbd853
!	Mem[0000000030001410] = 003f0000, %l7 = 00000000ff11ca5c
	ldstuba	[%i0+%o5]0x81,%l7	! %l7 = 00000000000000ff
!	%f30 = ff5f771e 4241725d, %l0 = 00000000a96e6a5a
!	Mem[00000000100c1400] = 1e775fff00000000
	stda	%f30,[%i3+%l0]ASI_PST32_P ! Mem[00000000100c1400] = ff5f771e00000000
!	Mem[0000000030141408] = 00000000, %l1 = 00000000864fc963
	swapa	[%i5+%o4]0x89,%l1	! %l1 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = 000000001e775fff, %f12 = ffbbd853 00003f00
	ldda	[%i3+%g0]0x88,%f12	! %f12 = 00000000 1e775fff

p0_label_73:
!	Mem[0000000010141400] = 000000ff, %l0 = 00000000a96e6a5a
	ldsha	[%i5+%g0]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010041410] = ff338946, %l6 = 000000006a3de8cb
	lduba	[%i1+%o5]0x80,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010001408] = 00000000, %l5 = 0000000089000000
	ldsha	[%i0+%o4]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000010181400] = ff5f771e, %l7 = 0000000000000000
	ldsba	[%i6+%g0]0x80,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010081410] = 53d8bbff, %f26 = 5cca11ff
	lda	[%i2+%o5]0x88,%f26	! %f26 = 53d8bbff
!	Mem[00000000211c0000] = ff877bbb, %l2 = 0000000000000000
	ldsba	[%o2+0x001]%asi,%l2	! %l2 = ffffffffffffff87
!	Mem[0000000010041408] = 000000ff, %l1 = 0000000000000000
	lduwa	[%i1+%o4]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030141408] = ff000000864fc963, %l2 = ffffffffffffff87
	ldxa	[%i5+%o4]0x89,%l2	! %l2 = ff000000864fc963
!	Mem[00000000201c0000] = 00ffaf65, %l3 = ccbe12ae0000003f
	lduba	[%o0+0x000]%asi,%l3	! %l3 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010141400] = ff000000, %l0 = 00000000000000ff
	ldstuba	[%i5+%g0]0x80,%l0	! %l0 = 000000ff000000ff

p0_label_74:
!	%l0 = 00000000000000ff, Mem[0000000030141400] = 065f771e
	stba	%l0,[%i5+%g0]0x89	! Mem[0000000030141400] = 065f77ff
!	Mem[0000000030181408] = ffffffff, %l5 = 0000000000000000
	swapa	[%i6+%o4]0x89,%l5	! %l5 = 00000000ffffffff
!	%l6 = 00000000000000ff, Mem[0000000030081410] = a5000000
	stwa	%l6,[%i2+%o5]0x89	! Mem[0000000030081410] = 000000ff
!	%l3 = 0000000000000000, Mem[0000000010181410] = 00007fffff5f771e
	stxa	%l3,[%i6+%o5]0x80	! Mem[0000000010181410] = 0000000000000000
!	%f15 = e3504689, Mem[0000000010181408] = 7b7980ea
	sta	%f15,[%i6+%o4]0x80	! Mem[0000000010181408] = e3504689
!	%f18 = 468933ff, Mem[0000000030141408] = 63c94f86
	sta	%f18,[%i5+%o4]0x81	! Mem[0000000030141408] = 468933ff
!	%l6 = 000000ff, %l7 = ffffffff, Mem[0000000010181410] = 00000000 00000000
	stda	%l6,[%i6+0x010]%asi	! Mem[0000000010181410] = 000000ff ffffffff
!	Mem[0000000010181400] = ff5f771e, %l5 = 00000000ffffffff
	swapa	[%i6+%g0]0x80,%l5	! %l5 = 00000000ff5f771e
!	%l1 = 00000000000000ff, Mem[0000000030181410] = 00000000
	stwa	%l1,[%i6+%o5]0x81	! Mem[0000000030181410] = 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = 4311caff, %l3 = 0000000000000000
	ldswa	[%i1+%o4]0x89,%l3	! %l3 = 000000004311caff

p0_label_75:
!	Mem[0000000030081400] = 000000ff, %l6 = 00000000000000ff
	lduba	[%i2+%g0]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000010041410] = ff338946ffffffff, %f30 = ff5f771e 4241725d
	ldda	[%i1+%o5]0x80,%f30	! %f30 = ff338946 ffffffff
!	Mem[000000001008142c] = a192c190, %l2 = ff000000864fc963
	lduw	[%i2+0x02c],%l2		! %l2 = 00000000a192c190
!	Mem[00000000100c1430] = 00000000, %l5 = 00000000ff5f771e
	lduba	[%i3+0x030]%asi,%l5	! %l5 = 0000000000000000
!	Mem[0000000010101408] = 000000ff, %l6 = 0000000000000000
	ldswa	[%i4+%o4]0x80,%l6	! %l6 = 00000000000000ff
!	Mem[0000000020800000] = ffff7d94, %l6 = 00000000000000ff
	lduh	[%o1+%g0],%l6		! %l6 = 000000000000ffff
!	Mem[0000000010001410] = 169e3a0b000000ff, %l4 = 00000000000000a1
	ldxa	[%i0+%o5]0x80,%l4	! %l4 = 169e3a0b000000ff
!	Mem[0000000020800040] = 7fffac70, %l3 = 000000004311caff
	lduha	[%o1+0x040]%asi,%l3	! %l3 = 0000000000007fff
	membar	#Sync			! Added by membar checker (14)
!	Mem[0000000010181400] = ffffffff 4241725d e3504689 cbe83d6a
!	Mem[0000000010181410] = 000000ff ffffffff 00000000 0000003f
!	Mem[0000000010181420] = 4f61277f e46cbd64 000000ff 1ea5b41d
!	Mem[0000000010181430] = 1a1efd06 b2f265c0 a96e6a5a 864fc963
	ldda	[%i6]ASI_BLK_P,%f16	! Block Load from 0000000010181400
!	Starting 10 instruction Store Burst
!	%l6 = 0000ffff, %l7 = ffffffff, Mem[0000000030101408] = ffffffa3 000000a5
	stda	%l6,[%i4+%o4]0x81	! Mem[0000000030101408] = 0000ffff ffffffff

!	Check Point 15 for processor 0

	set	p0_check_pt_data_15,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 00000000a192c190
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 0000000000007fff
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 169e3a0b000000ff
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 0000000000000000
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 000000000000ffff
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = ffffffffffffffff
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = 1ea5b41d f837aaa5
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x50],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 0b3a9e16 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x58],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = ffbbd853 cbe83d6a
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x60],%g3
	std	%f12,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f12 = 00000000 1e775fff
	bne	%xcc,p0_freg_check_fail
	mov	0xf12,%g1
	ldx	[%g4+0x68],%g3
	std	%f16,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f16 = ffffffff 4241725d
	bne	%xcc,p0_freg_check_fail
	mov	0xf16,%g1
	ldx	[%g4+0x70],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = e3504689 cbe83d6a
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1
	ldx	[%g4+0x78],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = 000000ff ffffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1
	ldx	[%g4+0x80],%g3
	std	%f22,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f22 = 00000000 0000003f
	bne	%xcc,p0_freg_check_fail
	mov	0xf22,%g1
	ldx	[%g4+0x88],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = 4f61277f e46cbd64
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1
	ldx	[%g4+0x90],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = 000000ff 1ea5b41d
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1
	ldx	[%g4+0x98],%g3
	std	%f28,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f28 = 1a1efd06 b2f265c0
	bne	%xcc,p0_freg_check_fail
	mov	0xf28,%g1
	ldx	[%g4+0xa0],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = a96e6a5a 864fc963
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 15 completed


p0_label_76:
!	%l4 = 169e3a0b000000ff, Mem[0000000030081408] = a3edf857
	stha	%l4,[%i2+%o4]0x89	! Mem[0000000030081408] = a3ed00ff
!	%l4 = 000000ff, %l5 = 00000000, Mem[0000000010141400] = ff000000 0000582a
	stda	%l4,[%i5+%g0]0x80	! Mem[0000000010141400] = 000000ff 00000000
!	Mem[0000000030141410] = 00713f70, %l1 = 00000000000000ff
	ldstuba	[%i5+%o5]0x81,%l1	! %l1 = 00000000000000ff
!	%l6 = 0000ffff, %l7 = ffffffff, Mem[0000000030181410] = ff000000 00000000
	stda	%l6,[%i6+%o5]0x89	! Mem[0000000030181410] = 0000ffff ffffffff
!	%l0 = 00000000000000ff, Mem[0000000010141430] = 57f8eda3
	stb	%l0,[%i5+0x030]		! Mem[0000000010141430] = fff8eda3
!	Mem[0000000030001400] = 00000089, %l2 = 00000000a192c190
	ldstuba	[%i0+%g0]0x81,%l2	! %l2 = 00000000000000ff
!	%l4 = 169e3a0b000000ff, Mem[0000000030141410] = 703f71ff
	stwa	%l4,[%i5+%o5]0x89	! Mem[0000000030141410] = 000000ff
!	%l4 = 000000ff, %l5 = 00000000, Mem[0000000010041410] = ff338946 ffffffff
	stda	%l4,[%i1+%o5]0x80	! Mem[0000000010041410] = 000000ff 00000000
!	Mem[0000000010141418] = 00590dcc000000a5, %l1 = 0000000000000000, %l0 = 00000000000000ff
	add	%i5,0x18,%g1
	casxa	[%g1]0x80,%l1,%l0	! %l0 = 00590dcc000000a5
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = ff3f0000, %l1 = 0000000000000000
	ldsha	[%i0+%o5]0x81,%l1	! %l1 = ffffffffffffff3f

p0_label_77:
!	Mem[0000000010181404] = 4241725d, %l5 = 0000000000000000
	lduh	[%i6+0x006],%l5		! %l5 = 000000000000725d
!	Mem[0000000010041410] = 00000000ff000000, %f24 = 4f61277f e46cbd64
	ldda	[%i1+%o5]0x88,%f24	! %f24 = 00000000 ff000000
!	Mem[0000000010101400] = 000000ff, %l3 = 0000000000007fff
	lduwa	[%i4+%g0]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[00000000100c1400] = ff5f771e00000000, %l5 = 000000000000725d
	ldxa	[%i3+%g0]0x80,%l5	! %l5 = ff5f771e00000000
!	%f24 = 00000000, Mem[0000000030001400] = 890000ff
	sta	%f24,[%i0+%g0]0x89	! Mem[0000000030001400] = 00000000
!	Mem[0000000030141408] = ff338946, %l0 = 00590dcc000000a5
	ldsha	[%i5+%o4]0x89,%l0	! %l0 = ffffffffffff8946
!	Mem[0000000010181410] = 000000ff ffffffff, %l0 = ffff8946, %l1 = ffffff3f
	ldda	[%i6+0x010]%asi,%l0	! %l0 = 00000000000000ff 00000000ffffffff
!	Mem[0000000010001408] = 00000000, %l7 = ffffffffffffffff
	lduwa	[%i0+%o4]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000010101410] = c3ae2ea1703f71ab, %l2 = 0000000000000000
	ldx	[%i4+%o5],%l2		! %l2 = c3ae2ea1703f71ab
!	Starting 10 instruction Store Burst
!	%f14 = ff000000, Mem[0000000010001408] = 00000000
	sta	%f14,[%i0+%o4]0x80	! Mem[0000000010001408] = ff000000

p0_label_78:
!	Mem[0000000010081408] = ff000000000000ff, %l2 = c3ae2ea1703f71ab, %l6 = 000000000000ffff
	add	%i2,0x08,%g1
	casxa	[%g1]0x80,%l2,%l6	! %l6 = ff000000000000ff
	membar	#Sync			! Added by membar checker (15)
!	%f30 = a96e6a5a 864fc963, Mem[0000000010181410] = ff000000 ffffffff
	stda	%f30,[%i6+%o5]0x88	! Mem[0000000010181410] = a96e6a5a 864fc963
!	%l6 = ff000000000000ff, Mem[0000000030141408] = 468933ff
	stba	%l6,[%i5+%o4]0x81	! Mem[0000000030141408] = ff8933ff
!	%l5 = ff5f771e00000000, Mem[0000000010101420] = dcfd2bef3c3e5de6, %asi = 80
	stxa	%l5,[%i4+0x020]%asi	! Mem[0000000010101420] = ff5f771e00000000
!	Mem[0000000030001408] = ff3a0016, %l1 = 00000000ffffffff
	swapa	[%i0+%o4]0x81,%l1	! %l1 = 00000000ff3a0016
!	Mem[0000000030041410] = 1e775f06, %l2 = c3ae2ea1703f71ab
	ldstuba	[%i1+%o5]0x81,%l2	! %l2 = 0000001e000000ff
!	Mem[0000000030041400] = 000000a3, %l7 = 0000000000000000
	ldstuba	[%i1+%g0]0x89,%l7	! %l7 = 000000a3000000ff
!	Mem[00000000300c1410] = 468933ff, %l0 = 00000000000000ff
	ldstuba	[%i3+%o5]0x81,%l0	! %l0 = 00000046000000ff
!	%l5 = ff5f771e00000000, Mem[00000000100c1410] = 0000582a0000582a
	stxa	%l5,[%i3+%o5]0x80	! Mem[00000000100c1410] = ff5f771e00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = ffffffff, %l1 = 00000000ff3a0016
	ldsba	[%i6+%g0]0x80,%l1	! %l1 = ffffffffffffffff

p0_label_79:
!	Mem[0000000030101410] = 169e3a0b, %f30 = a96e6a5a
	lda	[%i4+%o5]0x89,%f30	! %f30 = 169e3a0b
!	Mem[0000000010101410] = c3ae2ea1, %l5 = ff5f771e00000000
	lduba	[%i4+%o5]0x80,%l5	! %l5 = 00000000000000c3
!	Mem[0000000010101408] = ff000000, %l0 = 0000000000000046
	lduwa	[%i4+%o4]0x88,%l0	! %l0 = 00000000ff000000
!	Mem[0000000010001410] = 169e3a0b, %l2 = 000000000000001e
	lduha	[%i0+%o5]0x80,%l2	! %l2 = 000000000000169e
!	Mem[0000000030141408] = ff8933ff000000ff, %f16 = ffffffff 4241725d
	ldda	[%i5+%o4]0x81,%f16	! %f16 = ff8933ff 000000ff
!	Mem[0000000010141418] = 00590dcc000000a5, %l0 = 00000000ff000000
	ldx	[%i5+0x018],%l0		! %l0 = 00590dcc000000a5
!	Mem[0000000030181410] = ffff0000, %l3 = 00000000000000ff
	lduwa	[%i6+%o5]0x81,%l3	! %l3 = 00000000ffff0000
!	Mem[00000000100c1410] = 1e775fff, %f1  = f837aaa5
	lda	[%i3+%o5]0x88,%f1 	! %f1 = 1e775fff
!	Mem[0000000020800040] = 7fffac70, %l5 = 00000000000000c3
	ldsb	[%o1+0x041],%l5		! %l5 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	Mem[0000000010141408] = e35046ff, %l1 = ffffffffffffffff
	swapa	[%i5+%o4]0x88,%l1	! %l1 = 00000000e35046ff

p0_label_80:
!	Mem[0000000010081414] = 00003f00, %l4 = 000000ff, %l3 = ffff0000
	add	%i2,0x14,%g1
	casa	[%g1]0x80,%l4,%l3	! %l3 = 0000000000003f00
!	Mem[0000000010081408] = ff000000, %l2 = 000000000000169e
	swap	[%i2+%o4],%l2		! %l2 = 00000000ff000000
!	%l7 = 00000000000000a3, Mem[0000000010081408] = 9e160000
	stha	%l7,[%i2+%o4]0x88	! Mem[0000000010081408] = 9e1600a3
!	%f8  = dcfd2bef 3c3e5de6, Mem[0000000030101400] = 53d8bbff 6a3de8cb
	stda	%f8 ,[%i4+%g0]0x89	! Mem[0000000030101400] = dcfd2bef 3c3e5de6
!	Mem[0000000030101410] = 0b3a9e16, %l0 = 00590dcc000000a5
	swapa	[%i4+%o5]0x81,%l0	! %l0 = 000000000b3a9e16
!	%f30 = 169e3a0b 864fc963, Mem[0000000010041410] = 000000ff 00000000
	stda	%f30,[%i1+%o5]0x80	! Mem[0000000010041410] = 169e3a0b 864fc963
!	Mem[0000000030181410] = 0000ffff, %l6 = ff000000000000ff
	swapa	[%i6+%o5]0x89,%l6	! %l6 = 000000000000ffff
!	%l2 = 00000000ff000000, Mem[0000000030181400] = 5a6a6ea9
	stha	%l2,[%i6+%g0]0x81	! Mem[0000000030181400] = 00006ea9
!	Mem[00000000211c0000] = ff877bbb, %l7 = 00000000000000a3
	ldstuba	[%o2+0x000]%asi,%l7	! %l7 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = 065f77ff, %l4 = 169e3a0b000000ff
	lduha	[%i1+%o5]0x89,%l4	! %l4 = 00000000000077ff

!	Check Point 16 for processor 0

	set	p0_check_pt_data_16,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 000000000b3a9e16
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 00000000e35046ff
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 00000000ff000000
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 0000000000003f00
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 00000000000077ff
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = ffffffffffffffff
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l7,%g2			! %l7 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x40],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = 1ea5b41d 1e775fff
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x48],%g3
	std	%f16,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f16 = ff8933ff 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf16,%g1
	ldx	[%g4+0x50],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = 00000000 ff000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1
	ldx	[%g4+0x58],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = 169e3a0b 864fc963
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 16 completed


p0_label_81:
!	Mem[0000000010001400] = 6a3de8cb1e775fff, %l1 = 00000000e35046ff
	ldxa	[%i0+%g0]0x88,%l1	! %l1 = 6a3de8cb1e775fff
!	Mem[0000000030081410] = 000000ff, %l3 = 0000000000003f00
	ldsba	[%i2+%o5]0x89,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000030001408] = ffffffff, %l5 = ffffffffffffffff
	ldsha	[%i0+%o4]0x81,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000010081410] = 003f000053d8bbff, %l7 = 00000000000000ff
	ldxa	[%i2+%o5]0x88,%l7	! %l7 = 003f000053d8bbff
!	Mem[0000000010081408] = a300169e, %l3 = ffffffffffffffff
	lduha	[%i2+%o4]0x80,%l3	! %l3 = 000000000000a300
!	Mem[0000000010001400] = ff5f771e, %l4 = 00000000000077ff
	lduha	[%i0+%g0]0x80,%l4	! %l4 = 000000000000ff5f
!	Mem[00000000100c1410] = ff5f771e, %l0 = 000000000b3a9e16
	ldswa	[%i3+%o5]0x80,%l0	! %l0 = ffffffffff5f771e
!	Mem[0000000010001400] = 6a3de8cb1e775fff, %f0  = 1ea5b41d 1e775fff
	ldda	[%i0+%g0]0x88,%f0 	! %f0  = 6a3de8cb 1e775fff
!	Mem[0000000010001408] = ff000000, %l7 = 003f000053d8bbff
	lduha	[%i0+%o4]0x80,%l7	! %l7 = 000000000000ff00
!	Starting 10 instruction Store Burst
!	%l7 = 000000000000ff00, Mem[00000000201c0000] = 00ffaf65
	sth	%l7,[%o0+%g0]		! Mem[00000000201c0000] = ff00af65

p0_label_82:
!	Mem[0000000010181400] = ffffffff4241725d, %l0 = ffffffffff5f771e, %l6 = 000000000000ffff
	casxa	[%i6]0x80,%l0,%l6	! %l6 = ffffffff4241725d
!	%l3 = 000000000000a300, Mem[0000000010081400] = ff775fff
	stba	%l3,[%i2+%g0]0x80	! Mem[0000000010081400] = 00775fff
!	%l0 = ffffffffff5f771e, Mem[0000000010081408] = a300169e000000ff
	stxa	%l0,[%i2+%o4]0x80	! Mem[0000000010081408] = ffffffffff5f771e
!	%f4  = c3ae2ea1 703f71ab, Mem[00000000100c1408] = 0000dcff 46000000
	stda	%f4 ,[%i3+%o4]0x88	! Mem[00000000100c1408] = c3ae2ea1 703f71ab
!	%l7 = 000000000000ff00, Mem[0000000030141410] = ff000000a3edf857
	stxa	%l7,[%i5+%o5]0x81	! Mem[0000000030141410] = 000000000000ff00
!	%f16 = ff8933ff 000000ff e3504689 cbe83d6a
!	%f20 = 000000ff ffffffff 00000000 0000003f
!	%f24 = 00000000 ff000000 000000ff 1ea5b41d
!	%f28 = 1a1efd06 b2f265c0 169e3a0b 864fc963
	stda	%f16,[%i4]ASI_BLK_PL	! Block Store to 0000000010101400
!	Mem[0000000030081400] = ff000000, %l1 = 6a3de8cb1e775fff
	swapa	[%i2+%g0]0x89,%l1	! %l1 = 00000000ff000000
!	%f6  = 0b3a9e16, Mem[0000000030181408] = 00000000
	sta	%f6 ,[%i6+%o4]0x81	! Mem[0000000030181408] = 0b3a9e16
!	%f5  = 703f71ab, Mem[0000000010101418] = 3f000000
	st	%f5 ,[%i4+0x018]	! Mem[0000000010101418] = 703f71ab
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = 703f71ab, %l2 = 00000000ff000000
	ldsba	[%i3+%o4]0x88,%l2	! %l2 = ffffffffffffffab

p0_label_83:
!	Mem[0000000030001408] = ff979900ffffffff, %l5 = ffffffffffffffff
	ldxa	[%i0+%o4]0x89,%l5	! %l5 = ff979900ffffffff
!	%f3  = 89000000, Mem[0000000010181404] = 4241725d
	st	%f3 ,[%i6+0x004]	! Mem[0000000010181404] = 89000000
!	Mem[0000000010141408] = 4a106245ffffffff, %f8  = dcfd2bef 3c3e5de6
	ldda	[%i5+%o4]0x88,%f8 	! %f8  = 4a106245 ffffffff
!	Mem[0000000010181410] = 63c94f86, %l2 = ffffffffffffffab
	ldsha	[%i6+%o5]0x80,%l2	! %l2 = 00000000000063c9
	membar	#Sync			! Added by membar checker (16)
!	Mem[0000000010101400] = ff000000 ff3389ff 6a3de8cb 894650e3
!	Mem[0000000010101410] = ffffffff ff000000 703f71ab 00000000
!	Mem[0000000010101420] = 000000ff 00000000 1db4a51e ff000000
!	Mem[0000000010101430] = c065f2b2 06fd1e1a 63c94f86 0b3a9e16
	ldda	[%i4]ASI_BLK_AIUP,%f16	! Block Load from 0000000010101400
!	Mem[0000000010001400] = 1e775fff, %l7 = 000000000000ff00
	lduba	[%i0+%g0]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010081410] = 53d8bbff, %l6 = ffffffff4241725d
	ldsba	[%i2+%o5]0x88,%l6	! %l6 = ffffffffffffffff
!	Mem[00000000100c1438] = 71ffcb32 ef0e491b, %l0 = ff5f771e, %l1 = ff000000
	ldda	[%i3+0x038]%asi,%l0	! %l0 = 0000000071ffcb32 00000000ef0e491b
!	Mem[0000000010001438] = a3002dba, %l2 = 00000000000063c9
	ldub	[%i0+0x03a],%l2		! %l2 = 000000000000002d
!	Starting 10 instruction Store Burst
!	%l3 = 000000000000a300, Mem[00000000100c1400] = ff5f771e
	stwa	%l3,[%i3+%g0]0x80	! Mem[00000000100c1400] = 0000a300

p0_label_84:
!	%f8  = 4a106245, Mem[00000000100c1410] = ff5f771e
	sta	%f8 ,[%i3+%o5]0x80	! Mem[00000000100c1410] = 4a106245
!	%l7 = 00000000000000ff, Mem[00000000100c1400] = 0000a300
	stwa	%l7,[%i3+%g0]0x80	! Mem[00000000100c1400] = 000000ff
!	%l3 = 000000000000a300, Mem[0000000030181400] = 00006ea9
	stha	%l3,[%i6+%g0]0x81	! Mem[0000000030181400] = a3006ea9
!	%l1 = 00000000ef0e491b, Mem[0000000030141410] = 00000000
	stha	%l1,[%i5+%o5]0x89	! Mem[0000000030141410] = 0000491b
!	%l1 = 00000000ef0e491b, Mem[0000000030101400] = e65d3e3c
	stba	%l1,[%i4+%g0]0x81	! Mem[0000000030101400] = 1b5d3e3c
!	Mem[0000000030101408] = ffff0000, %l6 = ffffffffffffffff
	ldstuba	[%i4+%o4]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010181408] = 894650e3, %l5 = ff979900ffffffff
	swapa	[%i6+%o4]0x88,%l5	! %l5 = 00000000894650e3
!	Mem[0000000010001400] = 1e775fff, %l7 = 00000000000000ff
	swapa	[%i0+%g0]0x88,%l7	! %l7 = 000000001e775fff
!	%l4 = 000000000000ff5f, Mem[0000000010181408] = ffffffff
	stba	%l4,[%i6+%o4]0x80	! Mem[0000000010181408] = 5fffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000030181410] = ff000000, %f15 = e3504689
	lda	[%i6+%o5]0x81,%f15	! %f15 = ff000000

p0_label_85:
!	Mem[0000000010001400] = ff000000, %l5 = 00000000894650e3
	lduwa	[%i0+0x000]%asi,%l5	! %l5 = 00000000ff000000
!	Mem[0000000030081410] = 000000ff, %l6 = 0000000000000000
	lduba	[%i2+%o5]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000021800140] = 49280ea7, %l6 = 00000000000000ff
	ldsha	[%o3+0x140]%asi,%l6	! %l6 = 0000000000004928
!	%f4  = c3ae2ea1, Mem[0000000030101408] = ff00ffff
	sta	%f4 ,[%i4+%o4]0x81	! Mem[0000000030101408] = c3ae2ea1
!	Mem[0000000010041420] = 00005f06a3edf857, %f10 = ffbbd853 cbe83d6a
	ldd	[%i1+0x020],%f10	! %f10 = 00005f06 a3edf857
!	Mem[0000000030101410] = 63000000a5000000, %f2  = ffffbbae 89000000
	ldda	[%i4+%o5]0x89,%f2 	! %f2  = 63000000 a5000000
!	Mem[000000001000140c] = 000000ff, %l7 = 000000001e775fff
	ldsha	[%i0+0x00c]%asi,%l7	! %l7 = 0000000000000000
!	Mem[0000000010101408] = 6a3de8cb, %l1 = 00000000ef0e491b
	lduha	[%i4+%o4]0x80,%l1	! %l1 = 0000000000006a3d
!	Mem[0000000030141410] = 0000491b, %l6 = 0000000000004928
	ldsba	[%i5+%o5]0x89,%l6	! %l6 = 000000000000001b
!	Starting 10 instruction Store Burst
!	Mem[0000000010141410] = 7fff00a3, %l0 = 0000000071ffcb32
	ldstuba	[%i5+0x010]%asi,%l0	! %l0 = 0000007f000000ff

!	Check Point 17 for processor 0

	set	p0_check_pt_data_17,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 000000000000007f
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 0000000000006a3d
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 000000000000002d
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 000000000000a300
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 000000000000ff5f
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 00000000ff000000
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 000000000000001b
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 0000000000000000
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = 6a3de8cb 1e775fff
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x50],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = 63000000 a5000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x58],%g3
	std	%f8,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f8 = 4a106245 ffffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf08,%g1
	ldx	[%g4+0x60],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = 00005f06 a3edf857
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x68],%g3
	std	%f14,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f14 = ff000000 ff000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf14,%g1
	ldx	[%g4+0x70],%g3
	std	%f16,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f16 = ff000000 ff3389ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf16,%g1
	ldx	[%g4+0x78],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = 6a3de8cb 894650e3
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1
	ldx	[%g4+0x80],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = ffffffff ff000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1
	ldx	[%g4+0x88],%g3
	std	%f22,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f22 = 703f71ab 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf22,%g1
	ldx	[%g4+0x90],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = 000000ff 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1
	ldx	[%g4+0x98],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = 1db4a51e ff000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1
	ldx	[%g4+0xa0],%g3
	std	%f28,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f28 = c065f2b2 06fd1e1a
	bne	%xcc,p0_freg_check_fail
	mov	0xf28,%g1
	ldx	[%g4+0xa8],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = 63c94f86 0b3a9e16
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 17 completed


p0_label_86:
	membar	#Sync			! Added by membar checker (17)
!	%f18 = 6a3de8cb 894650e3, %l2 = 000000000000002d
!	Mem[0000000010101420] = 000000ff00000000
	add	%i4,0x020,%g1
	stda	%f18,[%g1+%l2]ASI_PST16_P ! Mem[0000000010101420] = 6a3de8cb000050e3
!	Mem[0000000020800040] = 7fffac70, %l0 = 000000000000007f
	ldstub	[%o1+0x040],%l0		! %l0 = 0000007f000000ff
!	Mem[0000000010101408] = 6a3de8cb, %l3 = 000000000000a300
	ldstuba	[%i4+%o4]0x80,%l3	! %l3 = 0000006a000000ff
!	%f22 = 703f71ab 00000000, %l7 = 0000000000000000
!	Mem[0000000030181428] = 35ec16f04424ff0d
	add	%i6,0x028,%g1
	stda	%f22,[%g1+%l7]ASI_PST32_SL ! Mem[0000000030181428] = 35ec16f04424ff0d
!	Mem[0000000010081420] = 9b4f0820, %l7 = 0000000000000000
	swap	[%i2+0x020],%l7		! %l7 = 000000009b4f0820
!	%f0  = 6a3de8cb 1e775fff, %l7 = 000000009b4f0820
!	Mem[0000000030181410] = ff000000ffffffff
	add	%i6,0x010,%g1
	stda	%f0,[%g1+%l7]ASI_PST8_S ! Mem[0000000030181410] = ff00e800ffffffff
!	Mem[0000000010181408] = 5fffffff, %l1 = 00006a3d, %l4 = 0000ff5f
	add	%i6,0x08,%g1
	casa	[%g1]0x80,%l1,%l4	! %l4 = 000000005fffffff
!	%l6 = 000000000000001b, Mem[0000000010181420] = 4f61277f, %asi = 80
	stba	%l6,[%i6+0x020]%asi	! Mem[0000000010181420] = 1b61277f
!	Mem[0000000030001400] = 00000000, %l7 = 000000009b4f0820
	swapa	[%i0+%g0]0x89,%l7	! %l7 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = ffffffff, %l7 = 0000000000000000
	ldsha	[%i6+%g0]0x80,%l7	! %l7 = ffffffffffffffff

p0_label_87:
!	Mem[0000000020800040] = ffffac70, %l5 = 00000000ff000000
	ldsh	[%o1+0x040],%l5		! %l5 = ffffffffffffffff
!	Mem[00000000300c1408] = aebbffff, %f4  = c3ae2ea1
	lda	[%i3+%o4]0x89,%f4 	! %f4 = aebbffff
!	Mem[0000000010101410] = ffffffff, %l3 = 000000000000006a
	lduwa	[%i4+%o5]0x88,%l3	! %l3 = 00000000ffffffff
!	Mem[0000000021800100] = 9d99b49a, %l6 = 000000000000001b
	lduha	[%o3+0x100]%asi,%l6	! %l6 = 0000000000009d99
!	Mem[0000000010041408] = 000000ff, %l6 = 0000000000009d99
	lduba	[%i1+%o4]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010181410] = 63c94f86, %f4  = aebbffff
	lda	[%i6+%o5]0x80,%f4 	! %f4 = 63c94f86
!	Mem[00000000300c1408] = ffffbbae, %f3  = a5000000
	lda	[%i3+%o4]0x81,%f3 	! %f3 = ffffbbae
!	Mem[0000000010081400] = ff5f7700, %l3 = 00000000ffffffff
	lduwa	[%i2+%g0]0x88,%l3	! %l3 = 00000000ff5f7700
!	Mem[0000000030041400] = ff000000, %l0 = 000000000000007f
	ldsba	[%i1+%g0]0x81,%l0	! %l0 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%f24 = 000000ff 00000000, Mem[0000000010001430] = 90afdb7b 408c6cad
	stda	%f24,[%i0+0x030]%asi	! Mem[0000000010001430] = 000000ff 00000000

p0_label_88:
!	Mem[00000000300c1410] = ff8933ff, %l6 = 00000000000000ff
	ldstuba	[%i3+%o5]0x81,%l6	! %l6 = 000000ff000000ff
!	Mem[0000000030001400] = 20084f9b, %l2 = 000000000000002d
	swapa	[%i0+%g0]0x81,%l2	! %l2 = 0000000020084f9b
!	%l6 = 000000ff, %l7 = ffffffff, Mem[0000000010081400] = 00775fff 000bffff
	stda	%l6,[%i2+0x000]%asi	! Mem[0000000010081400] = 000000ff ffffffff
!	Mem[00000000100c1408] = 703f71ab, %l5 = ffffffffffffffff
	ldstuba	[%i3+%o4]0x88,%l5	! %l5 = 000000ab000000ff
!	%f28 = c065f2b2 06fd1e1a, Mem[0000000030141410] = 1b490000 0000ff00
	stda	%f28,[%i5+%o5]0x81	! Mem[0000000030141410] = c065f2b2 06fd1e1a
!	%l1 = 0000000000006a3d, Mem[0000000010181400] = ffffffff
	stwa	%l1,[%i6+%g0]0x88	! Mem[0000000010181400] = 00006a3d
!	Mem[0000000010041408] = 000000ff, %l7 = ffffffffffffffff
	ldstuba	[%i1+%o4]0x88,%l7	! %l7 = 000000ff000000ff
!	Mem[00000000300c1408] = aebbffff, %l0 = ffffffffffffffff
	swapa	[%i3+%o4]0x89,%l0	! %l0 = 00000000aebbffff
!	%f20 = ffffffff ff000000, %l0 = 00000000aebbffff
!	Mem[0000000010081418] = 9acec51b6b46e4cb
	add	%i2,0x018,%g1
	stda	%f20,[%g1+%l0]ASI_PST16_PL ! Mem[0000000010081418] = 000000ffffffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = ff000000, %l6 = 00000000000000ff
	lduwa	[%i0+%g0]0x80,%l6	! %l6 = 00000000ff000000

p0_label_89:
!	%l0 = aebbffff, %l1 = 00006a3d, Mem[0000000030141400] = 065f77ff ffbbd853
	stda	%l0,[%i5+%g0]0x89	! Mem[0000000030141400] = aebbffff 00006a3d
!	%f12 = 00000000 1e775fff, Mem[0000000030081410] = ff000000 971f53a3
	stda	%f12,[%i2+%o5]0x81	! Mem[0000000030081410] = 00000000 1e775fff
!	Mem[0000000030181408] = 0b3a9e16fffffddf, %l3 = 00000000ff5f7700
	ldxa	[%i6+%o4]0x81,%l3	! %l3 = 0b3a9e16fffffddf
!	Mem[0000000030141400] = 00006a3d aebbffff, %l2 = 20084f9b, %l3 = fffffddf
	ldda	[%i5+%g0]0x89,%l2	! %l2 = 00000000aebbffff 0000000000006a3d
!	Mem[0000000010081420] = 00000000, %l7 = 00000000000000ff
	lduba	[%i2+0x023]%asi,%l7	! %l7 = 0000000000000000
!	Mem[0000000030141410] = c065f2b2, %l1 = 0000000000006a3d
	lduba	[%i5+%o5]0x81,%l1	! %l1 = 00000000000000c0
!	Mem[0000000030041400] = 468933ff000000ff, %l6 = 00000000ff000000
	ldxa	[%i1+%g0]0x89,%l6	! %l6 = 468933ff000000ff
!	Mem[0000000010081400] = 000000ff, %l7 = 0000000000000000
	ldsha	[%i2+%g0]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000010181400] = 00006a3d, %l2 = 00000000aebbffff
	ldsha	[%i6+%g0]0x88,%l2	! %l2 = 0000000000006a3d
!	Starting 10 instruction Store Burst
!	%l5 = 00000000000000ab, Mem[0000000010081410] = ffbbd853
	stba	%l5,[%i2+%o5]0x80	! Mem[0000000010081410] = abbbd853

p0_label_90:
!	Mem[0000000010101410] = ffffffff, %l0 = 00000000aebbffff
	swapa	[%i4+%o5]0x80,%l0	! %l0 = 00000000ffffffff
!	%f12 = 00000000 1e775fff, %l3 = 0000000000006a3d
!	Mem[0000000030001418] = 7b7a34e82bc2120a
	add	%i0,0x018,%g1
	stda	%f12,[%g1+%l3]ASI_PST32_SL ! Mem[0000000030001418] = ff5f771e2bc2120a
!	%l4 = 000000005fffffff, Mem[00000000201c0001] = ff00af65
	stb	%l4,[%o0+0x001]		! Mem[00000000201c0000] = ffffaf65
!	Mem[0000000030041400] = ff000000, %l0 = 00000000ffffffff
	swapa	[%i1+%g0]0x81,%l0	! %l0 = 00000000ff000000
!	%l0 = ff000000, %l1 = 000000c0, Mem[0000000010181418] = 00000000 0000003f
	std	%l0,[%i6+0x018]		! Mem[0000000010181418] = ff000000 000000c0
!	%l5 = 00000000000000ab, Mem[0000000010041404] = 2cb42ea1, %asi = 80
	stba	%l5,[%i1+0x004]%asi	! Mem[0000000010041404] = abb42ea1
!	Mem[00000000100c1400] = 000000ff, %l4 = 000000005fffffff
	swapa	[%i3+%g0]0x80,%l4	! %l4 = 00000000000000ff
!	%f14 = ff000000, Mem[0000000030081410] = 00000000
	sta	%f14,[%i2+%o5]0x89	! Mem[0000000030081410] = ff000000
!	%l0 = 00000000ff000000, Mem[00000000201c0000] = ffffaf65, %asi = 80
	stha	%l0,[%o0+0x000]%asi	! Mem[00000000201c0000] = 0000af65
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (18)
!	Mem[0000000030141400] = ffffbbae 3d6a0000 ff8933ff 000000ff
!	Mem[0000000030141410] = c065f2b2 06fd1e1a e350ffeb 3385fac5
!	Mem[0000000030141420] = 2b6fb6d4 890061e3 63c94f86 d4222f0b
!	Mem[0000000030141430] = 57f8eda3 f837aaa5 0b3a9e16 e79997ba
	ldda	[%i5]ASI_BLK_S,%f0	! Block Load from 0000000030141400

!	Check Point 18 for processor 0

	set	p0_check_pt_data_18,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 00000000ff000000
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 00000000000000c0
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 0000000000006a3d
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 0000000000006a3d
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l5,%g2			! %l5 = 00000000000000ab
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l6,%g2			! %l6 = 468933ff000000ff
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l7,%g2			! %l7 = 0000000000000000
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	nop				! Wait out %f0 latency
	nop				! Wait out %f0 latency
	nop				! Wait out %f0 latency
	nop				! Wait out %f0 latency
	ldx	[%g4+0x40],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = ffffbbae 3d6a0000
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x48],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = ff8933ff 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x50],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = c065f2b2 06fd1e1a
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x58],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = e350ffeb 3385fac5
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x60],%g3
	std	%f8,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f8 = 2b6fb6d4 890061e3
	bne	%xcc,p0_freg_check_fail
	mov	0xf08,%g1
	ldx	[%g4+0x68],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = 63c94f86 d4222f0b
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x70],%g3
	std	%f12,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f12 = 57f8eda3 f837aaa5
	bne	%xcc,p0_freg_check_fail
	mov	0xf12,%g1
	ldx	[%g4+0x78],%g3
	std	%f14,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f14 = 0b3a9e16 e79997ba
	bne	%xcc,p0_freg_check_fail
	mov	0xf14,%g1

!	Check Point 18 completed


p0_label_91:
!	Mem[0000000030101410] = 000000a5, %l1 = 00000000000000c0
	lduba	[%i4+%o5]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000010041408] = ff000000e3504689, %f4  = c065f2b2 06fd1e1a
	ldda	[%i1+0x008]%asi,%f4 	! %f4  = ff000000 e3504689
!	Mem[0000000010041400] = ffff0000, %l3 = 0000000000006a3d
	lduwa	[%i1+%g0]0x80,%l3	! %l3 = 00000000ffff0000
!	Mem[00000000300c1400] = 00000000 0000007f, %l6 = 000000ff, %l7 = 00000000
	ldda	[%i3+%g0]0x81,%l6	! %l6 = 0000000000000000 000000000000007f
!	Mem[0000000030101408] = c3ae2ea1, %f17 = ff3389ff
	lda	[%i4+%o4]0x81,%f17	! %f17 = c3ae2ea1
!	Mem[00000000100c1414] = 00000000, %l5 = 00000000000000ab
	ldsw	[%i3+0x014],%l5		! %l5 = 0000000000000000
!	Mem[0000000020800000] = ffff7d94, %l0 = 00000000ff000000
	lduba	[%o1+0x000]%asi,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030041408] = 4311caff, %l0 = 00000000000000ff
	ldsba	[%i1+%o4]0x89,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000030041410] = 065f77ff, %f14 = 0b3a9e16
	lda	[%i1+%o5]0x89,%f14	! %f14 = 065f77ff
!	Starting 10 instruction Store Burst
!	Mem[0000000010081408] = ffffffff, %l6 = 0000000000000000
	swapa	[%i2+%o4]0x80,%l6	! %l6 = 00000000ffffffff

p0_label_92:
!	%f28 = c065f2b2, Mem[0000000030181400] = a96e00a3
	sta	%f28,[%i6+%g0]0x89	! Mem[0000000030181400] = c065f2b2
!	Mem[0000000010081410] = 53d8bbab, %l2 = 0000000000006a3d
	ldstuba	[%i2+%o5]0x88,%l2	! %l2 = 000000ab000000ff
!	Mem[0000000010181400] = 00006a3d, %l4 = 00000000000000ff
	swapa	[%i6+%g0]0x88,%l4	! %l4 = 0000000000006a3d
!	%l0 = ffffffffffffffff, Mem[000000001008141c] = ffffffff
	sth	%l0,[%i2+0x01c]		! Mem[000000001008141c] = ffffffff
!	Mem[0000000030001408] = ffffffff, %l1 = 0000000000000000
	swapa	[%i0+%o4]0x89,%l1	! %l1 = 00000000ffffffff
!	Mem[0000000030001410] = 00003fff, %l3 = 00000000ffff0000
	swapa	[%i0+%o5]0x89,%l3	! %l3 = 0000000000003fff
!	Mem[00000000211c0000] = ff877bbb, %l7 = 000000000000007f
	ldstuba	[%o2+0x000]%asi,%l7	! %l7 = 000000ff000000ff
!	%l3 = 0000000000003fff, Mem[0000000010101408] = cbe83dff
	stha	%l3,[%i4+%o4]0x88	! Mem[0000000010101408] = cbe83fff
!	%f26 = 1db4a51e, Mem[00000000300c1410] = ff3389ff
	sta	%f26,[%i3+%o5]0x89	! Mem[00000000300c1410] = 1db4a51e
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = 1b5d3e3c, %l4 = 0000000000006a3d
	lduwa	[%i4+%g0]0x81,%l4	! %l4 = 000000001b5d3e3c

p0_label_93:
!	Mem[0000000010081420] = 00000000, %l3 = 0000000000003fff
	lduh	[%i2+0x020],%l3		! %l3 = 0000000000000000
!	Mem[0000000030081400] = 1e775fff, %l4 = 000000001b5d3e3c
	lduba	[%i2+%g0]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030181400] = c065f2b2, %l5 = 0000000000000000
	lduba	[%i6+%g0]0x89,%l5	! %l5 = 00000000000000b2
!	Mem[0000000030001400] = 0000002d00000000, %l3 = 0000000000000000
	ldxa	[%i0+%g0]0x81,%l3	! %l3 = 0000002d00000000
!	Mem[0000000010041408] = ff000000, %l0 = ffffffffffffffff
	ldsha	[%i1+%o4]0x80,%l0	! %l0 = ffffffffffffff00
!	Mem[00000000100c1400] = ffffff5f, %l6 = 00000000ffffffff
	lduha	[%i3+%g0]0x88,%l6	! %l6 = 000000000000ff5f
!	Mem[0000000030181410] = ff00e800ffffffff, %f12 = 57f8eda3 f837aaa5
	ldda	[%i6+%o5]0x81,%f12	! %f12 = ff00e800 ffffffff
!	Mem[0000000030101410] = 000000a5, %l4 = 00000000000000ff
	lduba	[%i4+%o5]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000010141438] = ba9799e7, %f30 = 63c94f86
	lda	[%i5+0x038]%asi,%f30	! %f30 = ba9799e7
!	Starting 10 instruction Store Burst
!	Mem[000000001014143a] = ba9799e7, %l5 = 00000000000000b2
	ldstuba	[%i5+0x03a]%asi,%l5	! %l5 = 00000099000000ff

p0_label_94:
!	%l5 = 0000000000000099, Mem[0000000010141410] = a300ffff
	stha	%l5,[%i5+%o5]0x88	! Mem[0000000010141410] = a3000099
!	%l0 = ffffffffffffff00, Mem[0000000030181400] = b2f265c0
	stwa	%l0,[%i6+%g0]0x81	! Mem[0000000030181400] = ffffff00
!	Mem[00000000100c1410] = 4562104a, %l2 = 00000000000000ab
	swapa	[%i3+%o5]0x88,%l2	! %l2 = 000000004562104a
!	%l2 = 000000004562104a, Mem[0000000030041408] = ffca1143
	stha	%l2,[%i1+%o4]0x81	! Mem[0000000030041408] = 104a1143
!	Mem[0000000010041408] = ff000000, %l4 = 0000000000000000
	swapa	[%i1+%o4]0x80,%l4	! %l4 = 00000000ff000000
!	Mem[0000000030141400] = ffffbbae, %l0 = ffffffffffffff00
	ldstuba	[%i5+%g0]0x81,%l0	! %l0 = 000000ff000000ff
!	%f6  = e350ffeb 3385fac5, Mem[0000000010181400] = 000000ff 00000089
	stda	%f6 ,[%i6+%g0]0x88	! Mem[0000000010181400] = e350ffeb 3385fac5
!	%l6 = 000000000000ff5f, Mem[0000000030181408] = 0b3a9e16fffffddf
	stxa	%l6,[%i6+%o4]0x81	! Mem[0000000030181408] = 000000000000ff5f
!	Mem[0000000021800040] = e784b2d9, %l4 = 00000000ff000000
	ldstub	[%o3+0x040],%l4		! %l4 = 000000e7000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = 3385fac5, %l1 = 00000000ffffffff
	ldsha	[%i6+%g0]0x88,%l1	! %l1 = fffffffffffffac5

p0_label_95:
!	Mem[000000001014143c] = ffffff59, %l2 = 000000004562104a
	ldsba	[%i5+0x03f]%asi,%l2	! %l2 = 0000000000000059
!	Mem[00000000201c0000] = 0000af65, %l0 = 00000000000000ff
	ldsha	[%o0+0x000]%asi,%l0	! %l0 = 0000000000000000
!	Mem[0000000030141408] = ff8933ff, %l6 = 000000000000ff5f
	ldsha	[%i5+%o4]0x81,%l6	! %l6 = ffffffffffffff89
!	Mem[00000000100c1400] = 5fffffff 00000000, %l4 = 000000e7, %l5 = 00000099
	ldda	[%i3+%g0]0x80,%l4	! %l4 = 000000005fffffff 0000000000000000
!	Mem[0000000010041400] = a12eb4ab 0000ffff, %l2 = 00000059, %l3 = 00000000
	ldda	[%i1+%g0]0x88,%l2	! %l2 = 000000000000ffff 00000000a12eb4ab
!	Mem[0000000030181410] = ff00e800, %l0 = 0000000000000000
	lduba	[%i6+%o5]0x81,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030041410] = ff775f06000000a5, %l5 = 0000000000000000
	ldxa	[%i1+%o5]0x81,%l5	! %l5 = ff775f06000000a5
!	Mem[0000000010101400] = 000000ff, %l0 = 00000000000000ff
	ldswa	[%i4+%g0]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010181410] = 63c94f86, %l7 = 00000000000000ff
	ldswa	[%i6+0x010]%asi,%l7	! %l7 = 0000000063c94f86
!	Starting 10 instruction Store Burst
!	%f26 = 1db4a51e, Mem[0000000010081408] = 00000000
	sta	%f26,[%i2+%o4]0x80	! Mem[0000000010081408] = 1db4a51e

!	Check Point 19 for processor 0

	set	p0_check_pt_data_19,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = fffffffffffffac5
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 000000000000ffff
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 00000000a12eb4ab
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 000000005fffffff
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = ff775f06000000a5
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = ffffffffffffff89
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 0000000063c94f86
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = ff8933ff 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x50],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = ff000000 e3504689
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x58],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = e350ffeb 3385fac5
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x60],%g3
	std	%f12,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f12 = ff00e800 ffffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf12,%g1
	ldx	[%g4+0x68],%g3
	std	%f14,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f14 = 065f77ff e79997ba
	bne	%xcc,p0_freg_check_fail
	mov	0xf14,%g1
	ldx	[%g4+0x70],%g3
	std	%f16,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f16 = ff000000 c3ae2ea1
	bne	%xcc,p0_freg_check_fail
	mov	0xf16,%g1
	ldx	[%g4+0x78],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = ba9799e7 0b3a9e16
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 19 completed


p0_label_96:
!	%l4 = 000000005fffffff, Mem[0000000010141408] = ffffffff4562104a, %asi = 80
	stxa	%l4,[%i5+0x008]%asi	! Mem[0000000010141408] = 000000005fffffff
!	%l1 = fffffffffffffac5, Mem[0000000030101408] = c3ae2ea1ffffffff
	stxa	%l1,[%i4+%o4]0x81	! Mem[0000000030101408] = fffffffffffffac5
!	Mem[0000000030101400] = 3c3e5d1b, %l2 = 000000000000ffff
	swapa	[%i4+%g0]0x89,%l2	! %l2 = 000000003c3e5d1b
!	%l0 = 00000000000000ff, Mem[0000000030041410] = ff775f06
	stba	%l0,[%i1+%o5]0x81	! Mem[0000000030041410] = ff775f06
!	Mem[0000000010141410] = a3000099, %l1 = fffffffffffffac5
	swapa	[%i5+%o5]0x88,%l1	! %l1 = 00000000a3000099
!	%l7 = 0000000063c94f86, Mem[0000000010001400] = ff000000cbe83d6a
	stxa	%l7,[%i0+%g0]0x80	! Mem[0000000010001400] = 0000000063c94f86
!	%l4 = 5fffffff, %l5 = 000000a5, Mem[0000000010141410] = c5faffff 169e3a0b
	stda	%l4,[%i5+%o5]0x80	! Mem[0000000010141410] = 5fffffff 000000a5
!	%f12 = ff00e800 ffffffff, %l4 = 000000005fffffff
!	Mem[0000000030101410] = 000000a500000063
	add	%i4,0x010,%g1
	stda	%f12,[%g1+%l4]ASI_PST8_SL ! Mem[0000000030101410] = ffffffff00e800ff
!	Mem[00000000201c0001] = 0000af65, %l7 = 0000000063c94f86
	ldstuba	[%o0+0x001]%asi,%l7	! %l7 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010141434] = 169e3a0b, %l0 = 00000000000000ff
	lduha	[%i5+0x034]%asi,%l0	! %l0 = 000000000000169e

p0_label_97:
!	Mem[0000000010181410] = 63c94f86, %l3 = 00000000a12eb4ab
	lduba	[%i6+%o5]0x80,%l3	! %l3 = 0000000000000063
!	Mem[000000001010143c] = 0b3a9e16, %l2 = 000000003c3e5d1b
	lduw	[%i4+0x03c],%l2		! %l2 = 000000000b3a9e16
!	Mem[0000000010001410] = 169e3a0b, %l6 = ffffffffffffff89
	lduha	[%i0+%o5]0x80,%l6	! %l6 = 000000000000169e
!	Mem[0000000010181410] = 63c94f86, %l6 = 000000000000169e
	ldswa	[%i6+%o5]0x80,%l6	! %l6 = 0000000063c94f86
!	Mem[00000000100c1410] = ab000000, %f16 = ff000000
	lda	[%i3+0x010]%asi,%f16	! %f16 = ab000000
!	Mem[0000000030101400] = 0000ffff, %l0 = 000000000000169e
	ldsba	[%i4+%g0]0x89,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000030041400] = ffffffff, %l7 = 0000000000000000
	lduwa	[%i1+%g0]0x81,%l7	! %l7 = 00000000ffffffff
!	Mem[0000000010101400] = 000000ff, %l0 = ffffffffffffffff
	lduha	[%i4+%g0]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010101424] = 000050e3, %l7 = 00000000ffffffff
	ldsh	[%i4+0x024],%l7		! %l7 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f24 = 000000ff 00000000, %l7 = 0000000000000000
!	Mem[0000000010081428] = b6130940a192c190
	add	%i2,0x028,%g1
	stda	%f24,[%g1+%l7]ASI_PST8_P ! Mem[0000000010081428] = b6130940a192c190

p0_label_98:
!	Mem[00000000300c1400] = 00000000, %l5 = ff775f06000000a5
	swapa	[%i3+%g0]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000030001400] = 2d000000, %l4 = 000000005fffffff
	ldstuba	[%i0+%g0]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[00000000300c1400] = 000000a5, %l3 = 0000000000000063
	swapa	[%i3+%g0]0x89,%l3	! %l3 = 00000000000000a5
	membar	#Sync			! Added by membar checker (19)
!	%l5 = 0000000000000000, Mem[0000000030141408] = ff8933ff
	stba	%l5,[%i5+%o4]0x81	! Mem[0000000030141408] = 008933ff
!	Mem[0000000010041408] = 00000000, %l6 = 0000000063c94f86
	ldstuba	[%i1+%o4]0x88,%l6	! %l6 = 00000000000000ff
!	Code Fragment 4
p0_fragment_3:
!	%l0 = 00000000000000ff
	setx	0xfb935637e9413f59,%g7,%l0 ! %l0 = fb935637e9413f59
!	%l1 = 00000000a3000099
	setx	0xaa286ad060dbd3b2,%g7,%l1 ! %l1 = aa286ad060dbd3b2
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = fb935637e9413f59
	setx	0x432e409fc783a8cf,%g7,%l0 ! %l0 = 432e409fc783a8cf
!	%l1 = aa286ad060dbd3b2
	setx	0x7db3792068c4e1e7,%g7,%l1 ! %l1 = 7db3792068c4e1e7
!	Mem[0000000010141410] = 5fffffff, %l4 = 0000000000000000
	swapa	[%i5+%o5]0x80,%l4	! %l4 = 000000005fffffff
!	%l5 = 0000000000000000, Mem[00000000100c1410] = 000000ab
	stha	%l5,[%i3+%o5]0x88	! Mem[00000000100c1410] = 00000000
!	%l2 = 000000000b3a9e16, Mem[0000000010041400] = ffff0000abb42ea1
	stx	%l2,[%i1+%g0]		! Mem[0000000010041400] = 000000000b3a9e16
!	Starting 10 instruction Load Burst
!	Mem[0000000030181410] = 00e800ff, %l7 = 0000000000000000
	ldswa	[%i6+%o5]0x89,%l7	! %l7 = 0000000000e800ff

p0_label_99:
!	Mem[0000000010041408] = ff000000, %l2 = 000000000b3a9e16
	lduha	[%i1+%o4]0x80,%l2	! %l2 = 000000000000ff00
!	Mem[0000000030001400] = ff00002d, %l1 = 7db3792068c4e1e7
	ldsha	[%i0+%g0]0x81,%l1	! %l1 = ffffffffffffff00
!	Mem[0000000030081410] = ff5f771eff000000, %l4 = 000000005fffffff
	ldxa	[%i2+%o5]0x89,%l4	! %l4 = ff5f771eff000000
!	Mem[0000000010041404] = 0b3a9e16, %l2 = 000000000000ff00
	lduha	[%i1+0x004]%asi,%l2	! %l2 = 0000000000000b3a
!	Mem[0000000030181410] = ff00e800ffffffff, %f14 = 065f77ff e79997ba
	ldda	[%i6+%o5]0x81,%f14	! %f14 = ff00e800 ffffffff
!	Mem[0000000010141400] = ff000000, %l6 = 0000000000000000
	ldswa	[%i5+%g0]0x88,%l6	! %l6 = ffffffffff000000
!	Mem[0000000030001410] = ffff0000, %l6 = ffffffffff000000
	lduha	[%i0+%o5]0x89,%l6	! %l6 = 0000000000000000
!	Mem[00000000300c1400] = 63000000 0000007f ffffffff 89000000
!	Mem[00000000300c1410] = 1ea5b41d 000000a3 0b3a9e16 00000b00
!	Mem[00000000300c1420] = dcfd2bef 3c3e5de6 fddf7318 cbe83d6a
!	Mem[00000000300c1430] = ffbbd853 00003f00 ea80797b dcfd2bef
	ldda	[%i3]ASI_BLK_S,%f0	! Block Load from 00000000300c1400
!	Mem[00000000100c1410] = 00000000, %l3 = 00000000000000a5
	lduha	[%i3+%o5]0x88,%l3	! %l3 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010141436] = 169e3a0b, %l2 = 0000000000000b3a
	ldstuba	[%i5+0x036]%asi,%l2	! %l2 = 0000003a000000ff

p0_label_100:
!	%l5 = 0000000000000000, Mem[0000000010041408] = 000000ff
	stha	%l5,[%i1+%o4]0x88	! Mem[0000000010041408] = 00000000
!	Mem[0000000010141410] = 00000000, %l2 = 000000000000003a
	ldstuba	[%i5+%o5]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[00000000100c1400] = ffffff5f, %l4 = ff5f771eff000000
	ldstuba	[%i3+%g0]0x88,%l4	! %l4 = 0000005f000000ff
!	%f30 = ba9799e7 0b3a9e16, Mem[0000000010001408] = ff000000 000000ff
	stda	%f30,[%i0+%o4]0x80	! Mem[0000000010001408] = ba9799e7 0b3a9e16
!	%f22 = 703f71ab, Mem[0000000030141400] = aebbffff
	sta	%f22,[%i5+%g0]0x89	! Mem[0000000030141400] = 703f71ab
!	Mem[000000001000140e] = 0b3a9e16, %l2 = 0000000000000000
	ldstub	[%i0+0x00e],%l2		! %l2 = 0000009e000000ff
!	%l7 = 0000000000e800ff, Mem[0000000010081408] = 1db4a51e
	stwa	%l7,[%i2+%o4]0x80	! Mem[0000000010081408] = 00e800ff
!	Mem[0000000010081438] = 69f5f8613c3e5de6, %l1 = ffffffffffffff00, %l0 = 432e409fc783a8cf
	add	%i2,0x38,%g1
	casxa	[%g1]0x80,%l1,%l0	! %l0 = 69f5f8613c3e5de6
!	Mem[0000000010141408] = 00000000, %l5 = 0000000000000000
	ldstuba	[%i5+%o4]0x88,%l5	! %l5 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = ffffffff, %l0 = 69f5f8613c3e5de6
	ldsba	[%i3+%g0]0x80,%l0	! %l0 = ffffffffffffffff

!	Check Point 20 for processor 0

	set	p0_check_pt_data_20,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = ffffffffffffffff
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = ffffffffffffff00
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 000000000000009e
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 0000000000000000
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 000000000000005f
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 0000000000000000
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 0000000000000000
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 0000000000e800ff
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = 63000000 0000007f
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x50],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = ffffffff 89000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x58],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 1ea5b41d 000000a3
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x60],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 0b3a9e16 00000b00
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x68],%g3
	std	%f8,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f8 = dcfd2bef 3c3e5de6
	bne	%xcc,p0_freg_check_fail
	mov	0xf08,%g1
	ldx	[%g4+0x70],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = fddf7318 cbe83d6a
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x78],%g3
	std	%f12,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f12 = ffbbd853 00003f00
	bne	%xcc,p0_freg_check_fail
	mov	0xf12,%g1
	ldx	[%g4+0x80],%g3
	std	%f14,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f14 = ea80797b dcfd2bef
	bne	%xcc,p0_freg_check_fail
	mov	0xf14,%g1
	ldx	[%g4+0x88],%g3
	std	%f16,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f16 = ab000000 c3ae2ea1
	bne	%xcc,p0_freg_check_fail
	mov	0xf16,%g1

!	Check Point 20 completed


p0_label_101:
!	Mem[0000000030101400] = ffff0000, %l5 = 0000000000000000
	lduha	[%i4+%g0]0x81,%l5	! %l5 = 000000000000ffff
!	Mem[0000000010081400] = ff000000, %l4 = 000000000000005f
	ldsba	[%i2+%g0]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000010041410] = 0b3a9e16, %l1 = ffffffffffffff00
	lduwa	[%i1+%o5]0x88,%l1	! %l1 = 000000000b3a9e16
!	Mem[0000000010141410] = ff000000, %l3 = 0000000000000000
	ldsba	[%i5+%o5]0x80,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000030181400] = 00ffffff, %l3 = ffffffffffffffff
	ldsba	[%i6+%g0]0x89,%l3	! %l3 = ffffffffffffffff
!	Mem[00000000300c1410] = 1ea5b41d, %l1 = 000000000b3a9e16
	ldsba	[%i3+%o5]0x81,%l1	! %l1 = 000000000000001e
!	Mem[0000000010181408] = 5fffffff cbe83d6a, %l2 = 0000009e, %l3 = ffffffff
	ldd	[%i6+%o4],%l2		! %l2 = 000000005fffffff 00000000cbe83d6a
!	Mem[0000000010181400] = 3385fac5, %f22 = 703f71ab
	lda	[%i6+%g0]0x88,%f22	! %f22 = 3385fac5
!	Mem[0000000010181410] = a96e6a5a 864fc963, %l2 = 5fffffff, %l3 = cbe83d6a
	ldda	[%i6+%o5]0x88,%l2	! %l2 = 00000000864fc963 00000000a96e6a5a
!	Starting 10 instruction Store Burst
!	%l2 = 00000000864fc963, Mem[00000000100c1408] = ff713f70a12eaec3, %asi = 80
	stxa	%l2,[%i3+0x008]%asi	! Mem[00000000100c1408] = 00000000864fc963

p0_label_102:
!	Mem[0000000010041410] = 169e3a0b, %l1 = 000000000000001e
	swapa	[%i1+%o5]0x80,%l1	! %l1 = 00000000169e3a0b
!	%f18 = 6a3de8cb 894650e3, Mem[0000000010141400] = 000000ff 00000000
	stda	%f18,[%i5+%g0]0x80	! Mem[0000000010141400] = 6a3de8cb 894650e3
!	%f13 = 00003f00, Mem[0000000030001408] = 00000000
	sta	%f13,[%i0+%o4]0x89	! Mem[0000000030001408] = 00003f00
!	Mem[0000000010101400] = ff000000, %l3 = 00000000a96e6a5a
	swapa	[%i4+%g0]0x80,%l3	! %l3 = 00000000ff000000
!	Mem[0000000010081418] = 000000ffffffffff, %l4 = 0000000000000000
	ldx	[%i2+0x018],%l4		! %l4 = 000000ffffffffff
!	%l5 = 000000000000ffff, Mem[0000000030001410] = ffff0000
	stwa	%l5,[%i0+%o5]0x89	! Mem[0000000030001410] = 0000ffff
!	Mem[00000000100c1410] = 00000000, %l5 = 000000000000ffff
	ldstuba	[%i3+%o5]0x80,%l5	! %l5 = 00000000000000ff
!	%l4 = 000000ffffffffff, Mem[0000000030041400] = 468933ffffffffff
	stxa	%l4,[%i1+%g0]0x89	! Mem[0000000030041400] = 000000ffffffffff
!	Mem[0000000010141438] = ba97ffe7, %l7 = 0000000000e800ff
	swap	[%i5+0x038],%l7		! %l7 = 00000000ba97ffe7
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = aebbffff, %l3 = 00000000ff000000
	lduwa	[%i4+%o5]0x80,%l3	! %l3 = 00000000aebbffff

p0_label_103:
	membar	#Sync			! Added by membar checker (20)
!	Mem[0000000010081400] = 000000ff ffffffff 00e800ff ff5f771e
!	Mem[0000000010081410] = ffbbd853 00003f00 000000ff ffffffff
!	Mem[0000000010081420] = 00000000 a48e84c7 b6130940 a192c190
!	Mem[0000000010081430] = 00000000 00000046 69f5f861 3c3e5de6
	ldda	[%i2]ASI_BLK_AIUPL,%f0	! Block Load from 0000000010081400
!	Mem[0000000030041408] = 1db4a51e 43114a10, %l0 = ffffffff, %l1 = 169e3a0b
	ldda	[%i1+%o4]0x89,%l0	! %l0 = 0000000043114a10 000000001db4a51e
!	Mem[0000000010181410] = 864fc963, %f26 = 1db4a51e
	lda	[%i6+%o5]0x88,%f26	! %f26 = 864fc963
!	Mem[0000000010181408] = 5fffffff, %f18 = 6a3de8cb
	lda	[%i6+%o4]0x80,%f18	! %f18 = 5fffffff
!	Mem[0000000010081400] = 000000ff, %l3 = 00000000aebbffff
	ldsba	[%i2+%g0]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000030041408] = 104a1143, %l7 = 00000000ba97ffe7
	ldsha	[%i1+%o4]0x81,%l7	! %l7 = 000000000000104a
!	Mem[00000000100c1408] = 63c94f8600000000, %f26 = 864fc963 ff000000
	ldda	[%i3+%o4]0x88,%f26	! %f26 = 63c94f86 00000000
!	Mem[00000000100c1400] = 00000000 ffffffff, %l0 = 43114a10, %l1 = 1db4a51e
	ldda	[%i3+%g0]0x88,%l0	! %l0 = 00000000ffffffff 0000000000000000
!	Mem[0000000010181400] = 3385fac5, %l4 = 000000ffffffffff
	ldswa	[%i6+%g0]0x88,%l4	! %l4 = 000000003385fac5
!	Starting 10 instruction Store Burst
!	%l0 = ffffffff, %l1 = 00000000, Mem[0000000030141408] = ff338900 ff000000
	stda	%l0,[%i5+%o4]0x89	! Mem[0000000030141408] = ffffffff 00000000

p0_label_104:
!	%l0 = 00000000ffffffff, Mem[0000000010141430] = fff8eda3169eff0b, %asi = 80
	stxa	%l0,[%i5+0x030]%asi	! Mem[0000000010141430] = 00000000ffffffff
!	%f24 = 000000ff 00000000, Mem[0000000030101400] = 0000ffff dcfd2bef
	stda	%f24,[%i4+%g0]0x89	! Mem[0000000030101400] = 000000ff 00000000
!	%l2 = 864fc963, %l3 = 00000000, Mem[0000000010101400] = a96e6a5a ff3389ff
	std	%l2,[%i4+%g0]		! Mem[0000000010101400] = 864fc963 00000000
!	Mem[0000000010001400] = 00000000, %l1 = 0000000000000000
	ldstuba	[%i0+%g0]0x80,%l1	! %l1 = 00000000000000ff
!	%l0 = 00000000ffffffff, Mem[0000000030001410] = ffff0000
	stba	%l0,[%i0+%o5]0x81	! Mem[0000000030001410] = ffff0000
!	Mem[0000000030041408] = 43114a10, %l2 = 00000000864fc963
	swapa	[%i1+%o4]0x89,%l2	! %l2 = 0000000043114a10
!	%l1 = 0000000000000000, Mem[0000000010101408] = ff3fe8cb
	stba	%l1,[%i4+%o4]0x80	! Mem[0000000010101408] = 003fe8cb
!	%l7 = 000000000000104a, Mem[00000000300c1400] = 63000000
	stwa	%l7,[%i3+%g0]0x81	! Mem[00000000300c1400] = 0000104a
!	Mem[0000000010141404] = 894650e3, %l3 = 00000000, %l3 = 00000000
	add	%i5,0x04,%g1
	casa	[%g1]0x80,%l3,%l3	! %l3 = 00000000894650e3
!	Starting 10 instruction Load Burst
!	Mem[0000000030101410] = ffffffff, %l6 = 0000000000000000
	lduwa	[%i4+%o5]0x89,%l6	! %l6 = 00000000ffffffff

p0_label_105:
!	Mem[0000000030081410] = ff5f771e ff000000, %l6 = ffffffff, %l7 = 0000104a
	ldda	[%i2+%o5]0x89,%l6	! %l6 = 00000000ff000000 00000000ff5f771e
!	Mem[0000000030101408] = ffffffff, %l7 = 00000000ff5f771e
	lduha	[%i4+%o4]0x89,%l7	! %l7 = 000000000000ffff
!	Mem[0000000030181410] = ff00e800, %l2 = 0000000043114a10
	lduha	[%i6+%o5]0x81,%l2	! %l2 = 000000000000ff00
!	Mem[0000000010081408] = 00e800ff, %l3 = 00000000894650e3
	lduha	[%i2+%o4]0x80,%l3	! %l3 = 00000000000000e8
!	Mem[0000000010041420] = 00005f06, %l3 = 00000000000000e8
	ldub	[%i1+0x021],%l3		! %l3 = 0000000000000000
!	Mem[0000000030001400] = ff00002d, %l0 = 00000000ffffffff
	ldsba	[%i0+%g0]0x81,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000030001400] = 2d0000ff, %f25 = 00000000
	lda	[%i0+%g0]0x89,%f25	! %f25 = 2d0000ff
!	Mem[0000000030041410] = 065f77ff, %l4 = 000000003385fac5
	ldsba	[%i1+%o5]0x89,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000030081400] = 1e775fff, %l3 = 0000000000000000
	ldsba	[%i2+%g0]0x89,%l3	! %l3 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%f26 = 63c94f86, Mem[0000000010041410] = 0000001e
	sta	%f26,[%i1+%o5]0x80	! Mem[0000000010041410] = 63c94f86

!	Check Point 21 for processor 0

	set	p0_check_pt_data_21,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = ffffffffffffffff
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 0000000000000000
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 000000000000ff00
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = ffffffffffffffff
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = ffffffffffffffff
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 0000000000000000
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 00000000ff000000
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 000000000000ffff
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = ffffffff ff000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x50],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = 1e775fff ff00e800
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x58],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 003f0000 53d8bbff
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x60],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = ffffffff ff000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x68],%g3
	std	%f8,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f8 = c7848ea4 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf08,%g1
	ldx	[%g4+0x70],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = 90c192a1 400913b6
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x78],%g3
	std	%f12,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f12 = 46000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf12,%g1
	ldx	[%g4+0x80],%g3
	std	%f14,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f14 = e65d3e3c 61f8f569
	bne	%xcc,p0_freg_check_fail
	mov	0xf14,%g1
	ldx	[%g4+0x88],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = 5fffffff 894650e3
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1
	ldx	[%g4+0x90],%g3
	std	%f22,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f22 = 3385fac5 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf22,%g1
	ldx	[%g4+0x98],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = 000000ff 2d0000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1
	ldx	[%g4+0xa0],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = 63c94f86 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1

!	Check Point 21 completed


p0_label_106:
!	%l3 = ffffffffffffffff, Mem[0000000030001400] = 2d0000ff
	stha	%l3,[%i0+%g0]0x89	! Mem[0000000030001400] = 2d00ffff
!	Mem[0000000010141418] = 00590dcc000000a5, %l7 = 000000000000ffff, %l6 = 00000000ff000000
	add	%i5,0x18,%g1
	casxa	[%g1]0x80,%l7,%l6	! %l6 = 00590dcc000000a5
!	Mem[0000000010041408] = 00000000, %l2 = 000000000000ff00
	ldstub	[%i1+%o4],%l2		! %l2 = 00000000000000ff
	membar	#Sync			! Added by membar checker (21)
!	%l6 = 000000a5, %l7 = 0000ffff, Mem[0000000010081420] = 00000000 a48e84c7
	stda	%l6,[%i2+0x020]%asi	! Mem[0000000010081420] = 000000a5 0000ffff
!	Mem[0000000010081408] = 00e800ff, %l6 = 00590dcc000000a5
	swapa	[%i2+%o4]0x80,%l6	! %l6 = 0000000000e800ff
!	%l6 = 0000000000e800ff, Mem[00000000300c1410] = 1ea5b41d
	stwa	%l6,[%i3+%o5]0x81	! Mem[00000000300c1410] = 00e800ff
!	%f25 = 2d0000ff, Mem[0000000030081410] = ff000000
	sta	%f25,[%i2+%o5]0x89	! Mem[0000000030081410] = 2d0000ff
!	Mem[0000000021800181] = 15372200, %l6 = 0000000000e800ff
	ldstuba	[%o3+0x181]%asi,%l6	! %l6 = 00000037000000ff
!	%f15 = 61f8f569, Mem[0000000030101408] = ffffffff
	sta	%f15,[%i4+%o4]0x81	! Mem[0000000030101408] = 61f8f569
!	Starting 10 instruction Load Burst
!	Mem[000000001010141c] = 00000000, %l7 = 000000000000ffff
	ldswa	[%i4+0x01c]%asi,%l7	! %l7 = 0000000000000000

p0_label_107:
!	Mem[00000000300c1410] = ff00e800, %l2 = 0000000000000000
	lduha	[%i3+%o5]0x89,%l2	! %l2 = 000000000000e800
!	Mem[00000000100c1400] = ffffffff, %l4 = ffffffffffffffff
	lduba	[%i3+%g0]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010001408] = ba9799e7, %l4 = 00000000000000ff
	lduba	[%i0+%o4]0x80,%l4	! %l4 = 00000000000000ba
!	Mem[0000000030081400] = 0000582a1e775fff, %f0  = ffffffff ff000000
	ldda	[%i2+%g0]0x89,%f0 	! %f0  = 0000582a 1e775fff
!	Mem[0000000030001400] = 2d00ffff, %l6 = 0000000000000037
	ldswa	[%i0+%g0]0x89,%l6	! %l6 = 000000002d00ffff
!	Mem[0000000030001400] = 2d00ffff, %l6 = 000000002d00ffff
	ldsha	[%i0+%g0]0x89,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010141410] = ff000000, %f23 = 00000000
	lda	[%i5+%o5]0x80,%f23	! %f23 = ff000000
!	Mem[0000000030081408] = a3ed00ff, %l0 = ffffffffffffffff
	ldswa	[%i2+%o4]0x89,%l0	! %l0 = ffffffffa3ed00ff
!	Mem[0000000030181408] = 00000000 0000ff5f, %l0 = a3ed00ff, %l1 = 00000000
	ldda	[%i6+%o4]0x81,%l0	! %l0 = 0000000000000000 000000000000ff5f
!	Starting 10 instruction Store Burst
!	%f12 = 46000000, Mem[0000000010181410] = 864fc963
	sta	%f12,[%i6+%o5]0x88	! Mem[0000000010181410] = 46000000

p0_label_108:
!	Mem[00000000300c1408] = ffffffff, %l2 = 000000000000e800
	ldstuba	[%i3+%o4]0x89,%l2	! %l2 = 000000ff000000ff
!	%l7 = 0000000000000000, Mem[0000000010181400] = 3385fac5
	stba	%l7,[%i6+%g0]0x88	! Mem[0000000010181400] = 3385fa00
!	%l4 = 000000ba, %l5 = 00000000, Mem[0000000030041408] = 63c94f86 1ea5b41d
	stda	%l4,[%i1+%o4]0x81	! Mem[0000000030041408] = 000000ba 00000000
!	Mem[0000000021800100] = 9d99b49a, %l4 = 00000000000000ba
	ldstub	[%o3+0x100],%l4		! %l4 = 0000009d000000ff
!	%f20 = ffffffff ff000000, %l0 = 0000000000000000
!	Mem[00000000100c1418] = 59755bee00000071
	add	%i3,0x018,%g1
	stda	%f20,[%g1+%l0]ASI_PST32_PL ! Mem[00000000100c1418] = 59755bee00000071
!	Mem[0000000010141408] = ff0000005fffffff, %l4 = 000000000000009d
	ldxa	[%i5+0x008]%asi,%l4	! %l4 = ff0000005fffffff
!	Code Fragment 4
p0_fragment_4:
!	%l0 = 0000000000000000
	setx	0x1e3c3b400b0b1350,%g7,%l0 ! %l0 = 1e3c3b400b0b1350
!	%l1 = 000000000000ff5f
	setx	0x9b5bee204f681ad8,%g7,%l1 ! %l1 = 9b5bee204f681ad8
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 1e3c3b400b0b1350
	setx	0x965a1f4835444d47,%g7,%l0 ! %l0 = 965a1f4835444d47
!	%l1 = 9b5bee204f681ad8
	setx	0x1278efb862d8ad56,%g7,%l1 ! %l1 = 1278efb862d8ad56
!	%l5 = 0000000000000000, Mem[0000000030101400] = 00000000
	stba	%l5,[%i4+%g0]0x81	! Mem[0000000030101400] = 00000000
!	%f26 = 63c94f86 00000000, Mem[0000000010141410] = 000000ff a5000000
	stda	%f26,[%i5+%o5]0x88	! Mem[0000000010141410] = 63c94f86 00000000
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = 4a100000, %l5 = 0000000000000000
	ldsha	[%i3+%g0]0x89,%l5	! %l5 = 0000000000000000

p0_label_109:
!	Mem[0000000030041410] = a5000000065f77ff, %l0 = 965a1f4835444d47
	ldxa	[%i1+%o5]0x89,%l0	! %l0 = a5000000065f77ff
!	Mem[00000000100c1410] = 00000000000000ff, %l5 = 0000000000000000
	ldxa	[%i3+%o5]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[0000000021800000] = 1a7bd0b4, %l3 = ffffffffffffffff
	ldsh	[%o3+%g0],%l3		! %l3 = 0000000000001a7b
!	Mem[0000000030001400] = 000000002d00ffff, %l0 = a5000000065f77ff
	ldxa	[%i0+%g0]0x89,%l0	! %l0 = 000000002d00ffff
!	Mem[0000000010001400] = 000000ff, %f28 = c065f2b2
	lda	[%i0+%g0]0x88,%f28	! %f28 = 000000ff
!	Mem[0000000010041418] = 2adc0000, %l1 = 1278efb862d8ad56
	ldsba	[%i1+0x01a]%asi,%l1	! %l1 = 0000000000000000
!	Mem[0000000010041410] = 864fc963, %l1 = 0000000000000000
	ldsba	[%i1+%o5]0x88,%l1	! %l1 = 0000000000000063
!	Mem[0000000030101410] = ff00e800ffffffff, %f0  = 0000582a 1e775fff
	ldda	[%i4+%o5]0x89,%f0 	! %f0  = ff00e800 ffffffff
!	Mem[0000000030181410] = ff00e800, %f7  = ff000000
	lda	[%i6+%o5]0x81,%f7 	! %f7 = ff00e800
!	Starting 10 instruction Store Burst
!	%l7 = 0000000000000000, Mem[00000000300c1410] = 00e800ff000000a3
	stxa	%l7,[%i3+%o5]0x81	! Mem[00000000300c1410] = 0000000000000000

p0_label_110:
!	%l4 = ff0000005fffffff, Mem[0000000010141400] = 6a3de8cb894650e3
	stxa	%l4,[%i5+%g0]0x80	! Mem[0000000010141400] = ff0000005fffffff
!	Mem[0000000010001408] = ba9799e7, %l4 = 5fffffff, %l5 = 000000ff
	add	%i0,0x08,%g1
	casa	[%g1]0x80,%l4,%l5	! %l5 = 00000000ba9799e7
!	%f20 = ffffffff ff000000, %l1 = 0000000000000063
!	Mem[0000000030101400] = 00000000ff000000
	stda	%f20,[%i4+%l1]ASI_PST8_SL ! Mem[0000000030101400] = 00000000ffffff00
!	Mem[00000000100c1408] = 00000000, %l0 = 000000002d00ffff
	swapa	[%i3+%o4]0x80,%l0	! %l0 = 0000000000000000
!	%f0  = ff00e800, Mem[0000000030001410] = ffff0000
	sta	%f0 ,[%i0+%o5]0x81	! Mem[0000000030001410] = ff00e800
!	%l4 = ff0000005fffffff, Mem[0000000010181408] = 5fffffffcbe83d6a
	stxa	%l4,[%i6+%o4]0x80	! Mem[0000000010181408] = ff0000005fffffff
!	%l2 = 000000ff, %l3 = 00001a7b, Mem[0000000010081408] = 000000a5 ff5f771e
	std	%l2,[%i2+%o4]		! Mem[0000000010081408] = 000000ff 00001a7b
!	Mem[000000001010140c] = 894650e3, %l5 = 00000000ba9799e7
	swap	[%i4+0x00c],%l5		! %l5 = 00000000894650e3
!	%l5 = 00000000894650e3, Mem[00000000100c1410] = 000000ff
	stha	%l5,[%i3+%o5]0x88	! Mem[00000000100c1410] = 000050e3
!	Starting 10 instruction Load Burst
!	Mem[0000000010101404] = 00000000, %l1 = 0000000000000063
	ldswa	[%i4+0x004]%asi,%l1	! %l1 = 0000000000000000

!	Check Point 22 for processor 0

	set	p0_check_pt_data_22,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 0000000000000000
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 0000000000000000
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 0000000000001a7b
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = ff0000005fffffff
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 00000000894650e3
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = ffffffffffffffff
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 0000000000000000
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = ff00e800 ffffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x50],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = ffffffff ff00e800
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x58],%g3
	std	%f22,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f22 = 3385fac5 ff000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf22,%g1
	ldx	[%g4+0x60],%g3
	std	%f28,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f28 = 000000ff 06fd1e1a
	bne	%xcc,p0_freg_check_fail
	mov	0xf28,%g1

!	Check Point 22 completed


p0_label_111:
!	Mem[0000000010001418] = ccbe12ae, %f0  = ff00e800
	ld	[%i0+0x018],%f0 	! %f0 = ccbe12ae
!	Mem[0000000010141400] = 000000ff, %l5 = 00000000894650e3
	ldsba	[%i5+%g0]0x88,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000010081410] = ffbbd853, %l4 = ff0000005fffffff
	ldsha	[%i2+%o5]0x80,%l4	! %l4 = ffffffffffffffbb
!	Mem[0000000030101408] = 69f5f861, %l2 = 00000000000000ff
	ldswa	[%i4+%o4]0x89,%l2	! %l2 = 0000000069f5f861
!	Mem[0000000010041410] = 63c94f86864fc963, %f8  = c7848ea4 00000000
	ldda	[%i1+0x010]%asi,%f8 	! %f8  = 63c94f86 864fc963
!	Mem[0000000030001410] = e35075eb 00e800ff, %l2 = 69f5f861, %l3 = 00001a7b
	ldda	[%i0+%o5]0x89,%l2	! %l2 = 0000000000e800ff 00000000e35075eb
!	Mem[0000000010041408] = ff000000, %l5 = ffffffffffffffff
	ldsba	[%i1+%o4]0x80,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000010081400] = 000000ffffffffff, %f18 = 5fffffff 894650e3
	ldd	[%i2+%g0],%f18		! %f18 = 000000ff ffffffff
!	Mem[0000000010141428] = 0b2f0bd4, %l4 = ffffffffffffffbb
	ldsw	[%i5+0x028],%l4		! %l4 = 000000000b2f0bd4
!	Starting 10 instruction Store Burst
!	%f30 = ba9799e7 0b3a9e16, Mem[0000000010101408] = 003fe8cb ba9799e7
	stda	%f30,[%i4+%o4]0x80	! Mem[0000000010101408] = ba9799e7 0b3a9e16

p0_label_112:
!	%l0 = 00000000, %l1 = 00000000, Mem[0000000010081400] = 000000ff ffffffff
	stda	%l0,[%i2+%g0]0x80	! Mem[0000000010081400] = 00000000 00000000
!	Mem[0000000030141408] = ffffffff, %l7 = 0000000000000000
	swapa	[%i5+%o4]0x81,%l7	! %l7 = 00000000ffffffff
!	%l6 = ffffffff, %l7 = ffffffff, Mem[0000000010141408] = 000000ff ffffff5f
	stda	%l6,[%i5+%o4]0x88	! Mem[0000000010141408] = ffffffff ffffffff
!	%l6 = ffffffffffffffff, Mem[0000000010141408] = ffffffff
	stwa	%l6,[%i5+%o4]0x80	! Mem[0000000010141408] = ffffffff
!	%f0  = ccbe12ae ffffffff, Mem[0000000010081410] = ffbbd853 00003f00
	std	%f0 ,[%i2+%o5]	! Mem[0000000010081410] = ccbe12ae ffffffff
!	Mem[0000000030081400] = ff5f771e, %l1 = 0000000000000000
	swapa	[%i2+%g0]0x81,%l1	! %l1 = 00000000ff5f771e
!	%f30 = ba9799e7 0b3a9e16, %l4 = 000000000b2f0bd4
!	Mem[0000000030001438] = 00000089aebbffff
	add	%i0,0x038,%g1
	stda	%f30,[%g1+%l4]ASI_PST32_S ! Mem[0000000030001438] = 00000089aebbffff
!	Mem[0000000021800100] = ff99b49a, %l3 = 00000000e35075eb
	ldstuba	[%o3+0x100]%asi,%l3	! %l3 = 000000ff000000ff
!	%f16 = ab000000 c3ae2ea1, Mem[0000000010081400] = 00000000 00000000
	stda	%f16,[%i2+%g0]0x88	! Mem[0000000010081400] = ab000000 c3ae2ea1
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = 000000002a580000, %f8  = 63c94f86 864fc963
	ldda	[%i2+%g0]0x81,%f8 	! %f8  = 00000000 2a580000

p0_label_113:
!	Mem[0000000030081408] = ff00eda3, %l0 = 0000000000000000
	lduha	[%i2+%o4]0x81,%l0	! %l0 = 000000000000ff00
!	Mem[00000000100c1410] = 00000000 000050e3, %l4 = 0b2f0bd4, %l5 = ffffffff
	ldda	[%i3+%o5]0x88,%l4	! %l4 = 00000000000050e3 0000000000000000
!	Mem[0000000010041408] = 000000ff, %l6 = ffffffffffffffff
	lduha	[%i1+%o4]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030101410] = ff00e800ffffffff, %f0  = ccbe12ae ffffffff
	ldda	[%i4+%o5]0x89,%f0 	! %f0  = ff00e800 ffffffff
!	Mem[0000000030181400] = 0000000000ffffff, %f4  = 003f0000 53d8bbff
	ldda	[%i6+%g0]0x89,%f4 	! %f4  = 00000000 00ffffff
	membar	#Sync			! Added by membar checker (22)
!	Mem[0000000010101400] = 864fc963 00000000 ba9799e7 0b3a9e16
!	Mem[0000000010101410] = aebbffff ff000000 703f71ab 00000000
!	Mem[0000000010101420] = 6a3de8cb 000050e3 1db4a51e ff000000
!	Mem[0000000010101430] = c065f2b2 06fd1e1a 63c94f86 0b3a9e16
	ldda	[%i4]ASI_BLK_P,%f0	! Block Load from 0000000010101400
!	Mem[0000000030101400] = 00000000 ffffff00, %l6 = 000000ff, %l7 = ffffffff
	ldda	[%i4+%g0]0x81,%l6	! %l6 = 0000000000000000 00000000ffffff00
!	Mem[0000000010001408] = e79997ba, %l0 = 000000000000ff00
	lduwa	[%i0+%o4]0x88,%l0	! %l0 = 00000000e79997ba
!	Mem[0000000021800040] = ff84b2d9, %l3 = 00000000000000ff
	lduba	[%o3+0x041]%asi,%l3	! %l3 = 0000000000000084
!	Starting 10 instruction Store Burst
!	%l7 = 00000000ffffff00, Mem[0000000030141400] = ab713f70
	stha	%l7,[%i5+%g0]0x81	! Mem[0000000030141400] = ff003f70

p0_label_114:
!	%l0 = 00000000e79997ba, Mem[0000000030101400] = 00000000
	stwa	%l0,[%i4+%g0]0x89	! Mem[0000000030101400] = e79997ba
!	%f24 = 000000ff 2d0000ff, Mem[0000000010041418] = 2adc0000 00000046
	std	%f24,[%i1+0x018]	! Mem[0000000010041418] = 000000ff 2d0000ff
!	Mem[00000000300c1408] = ffffffff, %l7 = 00000000ffffff00
	ldstuba	[%i3+%o4]0x89,%l7	! %l7 = 000000ff000000ff
	membar	#Sync			! Added by membar checker (23)
!	%l2 = 0000000000e800ff, Mem[0000000010101410] = ffffbbae
	stha	%l2,[%i4+%o5]0x88	! Mem[0000000010101410] = ffff00ff
!	%f24 = 000000ff 2d0000ff, Mem[0000000010181410] = 00000046 5a6a6ea9
	stda	%f24,[%i6+%o5]0x80	! Mem[0000000010181410] = 000000ff 2d0000ff
!	%l4 = 00000000000050e3, Mem[0000000030001408] = ff97990000003f00
	stxa	%l4,[%i0+%o4]0x89	! Mem[0000000030001408] = 00000000000050e3
!	%l6 = 00000000, %l7 = 000000ff, Mem[0000000030181410] = ff00e800 ffffffff
	stda	%l6,[%i6+%o5]0x81	! Mem[0000000030181410] = 00000000 000000ff
!	%l0 = 00000000e79997ba, Mem[0000000030001400] = ffff002d00000000
	stxa	%l0,[%i0+%g0]0x81	! Mem[0000000030001400] = 00000000e79997ba
!	%l7 = 00000000000000ff, Mem[0000000010141400] = 000000ff
	stha	%l7,[%i5+%g0]0x88	! Mem[0000000010141400] = 000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = ffffffff, %l4 = 00000000000050e3
	ldsba	[%i3+%o4]0x81,%l4	! %l4 = ffffffffffffffff

p0_label_115:
!	Mem[000000001018142c] = 1ea5b41d, %l4 = ffffffffffffffff
	lduha	[%i6+0x02e]%asi,%l4	! %l4 = 000000000000b41d
!	Mem[0000000030001410] = ff00e800, %l1 = 00000000ff5f771e
	lduwa	[%i0+%o5]0x81,%l1	! %l1 = 00000000ff00e800
!	Mem[0000000030081400] = 0000582a00000000, %f14 = 63c94f86 0b3a9e16
	ldda	[%i2+%g0]0x89,%f14	! %f14 = 0000582a 00000000
!	Mem[0000000010181408] = ff000000, %l5 = 0000000000000000
	lduba	[%i6+%o4]0x80,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030181400] = ffffff00, %l0 = 00000000e79997ba
	lduwa	[%i6+%g0]0x81,%l0	! %l0 = 00000000ffffff00
!	Mem[0000000010101408] = 169e3a0b e79997ba, %l4 = 0000b41d, %l5 = 000000ff
	ldda	[%i4+%o4]0x88,%l4	! %l4 = 00000000e79997ba 00000000169e3a0b
!	Mem[0000000030041408] = 000000ba, %l3 = 0000000000000084
	lduba	[%i1+%o4]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000010081408] = 7b1a0000ff000000, %l6 = 0000000000000000
	ldxa	[%i2+%o4]0x88,%l6	! %l6 = 7b1a0000ff000000
!	Mem[0000000010041410] = 864fc963, %l0 = 00000000ffffff00
	lduha	[%i1+%o5]0x88,%l0	! %l0 = 000000000000c963
!	Starting 10 instruction Store Burst
!	%l2 = 00e800ff, %l3 = 00000000, Mem[00000000300c1408] = ffffffff 00000089
	stda	%l2,[%i3+%o4]0x89	! Mem[00000000300c1408] = 00e800ff 00000000

!	Check Point 23 for processor 0

	set	p0_check_pt_data_23,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 000000000000c963
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 00000000ff00e800
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 0000000000e800ff
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 0000000000000000
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 00000000e79997ba
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 00000000169e3a0b
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 7b1a0000ff000000
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = 864fc963 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x50],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = ba9799e7 0b3a9e16
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x58],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = aebbffff ff000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x60],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 703f71ab 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x68],%g3
	std	%f8,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f8 = 6a3de8cb 000050e3
	bne	%xcc,p0_freg_check_fail
	mov	0xf08,%g1
	ldx	[%g4+0x70],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = 1db4a51e ff000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x78],%g3
	std	%f12,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f12 = c065f2b2 06fd1e1a
	bne	%xcc,p0_freg_check_fail
	mov	0xf12,%g1
	ldx	[%g4+0x80],%g3
	std	%f14,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f14 = 0000582a 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf14,%g1
	ldx	[%g4+0x88],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = 000000ff ffffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1

!	Check Point 23 completed


p0_label_116:
!	%f2  = ba9799e7 0b3a9e16, %l0 = 000000000000c963
!	Mem[0000000030081408] = ff00eda3f837aaa5
	add	%i2,0x008,%g1
	stda	%f2,[%g1+%l0]ASI_PST16_SL ! Mem[0000000030081408] = 169e3a0bf837aaa5
!	%l4 = 00000000e79997ba, Mem[0000000010081400] = ab000000c3ae2ea1
	stxa	%l4,[%i2+%g0]0x88	! Mem[0000000010081400] = 00000000e79997ba
!	%f4  = aebbffff ff000000, Mem[0000000010001410] = 169e3a0b 000000ff
	stda	%f4 ,[%i0+%o5]0x80	! Mem[0000000010001410] = aebbffff ff000000
!	%f0  = 864fc963 00000000 ba9799e7 0b3a9e16
!	%f4  = aebbffff ff000000 703f71ab 00000000
!	%f8  = 6a3de8cb 000050e3 1db4a51e ff000000
!	%f12 = c065f2b2 06fd1e1a 0000582a 00000000
	stda	%f0,[%i1]ASI_BLK_AIUSL	! Block Store to 0000000030041400
!	%f22 = 3385fac5 ff000000, Mem[0000000030141408] = 00000000 00000000
	stda	%f22,[%i5+%o4]0x89	! Mem[0000000030141408] = 3385fac5 ff000000
	membar	#Sync			! Added by membar checker (24)
!	Mem[0000000010041408] = 000000ff, %l0 = 000000000000c963
	swapa	[%i1+%o4]0x88,%l0	! %l0 = 00000000000000ff
!	%l1 = 00000000ff00e800, Mem[0000000010041400] = 00000000
	stwa	%l1,[%i1+%g0]0x80	! Mem[0000000010041400] = ff00e800
!	Mem[000000001010142b] = 1db4a51e, %l3 = 0000000000000000
	ldstub	[%i4+0x02b],%l3		! %l3 = 0000001e000000ff
!	Mem[0000000010001408] = ba9799e7, %l1 = 00000000ff00e800
	ldstuba	[%i0+%o4]0x80,%l1	! %l1 = 000000ba000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = 61f8f569, %l2 = 0000000000e800ff
	ldsha	[%i4+%o4]0x81,%l2	! %l2 = 00000000000061f8

p0_label_117:
!	Mem[0000000010141410] = 00000000, %l0 = 00000000000000ff
	ldsba	[%i5+%o5]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000010181410] = ff00002dff000000, %f28 = 000000ff 06fd1e1a
	ldda	[%i6+%o5]0x88,%f28	! %f28 = ff00002d ff000000
!	Mem[0000000010081400] = ba9799e7, %l5 = 00000000169e3a0b
	ldub	[%i2+%g0],%l5		! %l5 = 00000000000000ba
!	Mem[0000000010101438] = 63c94f86, %l0 = 0000000000000000
	ldsha	[%i4+0x03a]%asi,%l0	! %l0 = 0000000000004f86
!	Mem[0000000030101410] = ffffffff, %f20 = ffffffff
	lda	[%i4+%o5]0x81,%f20	! %f20 = ffffffff
!	Mem[00000000300c1400] = 0000104a0000007f, %l0 = 0000000000004f86
	ldxa	[%i3+%g0]0x81,%l0	! %l0 = 0000104a0000007f
!	Mem[0000000010001410] = aebbffff, %l3 = 000000000000001e
	lduwa	[%i0+%o5]0x80,%l3	! %l3 = 00000000aebbffff
!	Mem[00000000300c1408] = ff00e800, %l3 = 00000000aebbffff
	lduha	[%i3+%o4]0x81,%l3	! %l3 = 000000000000ff00
!	Mem[0000000010001410] = aebbffff, %l3 = 000000000000ff00
	ldsb	[%i0+0x013],%l3		! %l3 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l6 = ff000000, %l7 = 000000ff, Mem[0000000030101410] = ffffffff ff00e800
	stda	%l6,[%i4+%o5]0x89	! Mem[0000000030101410] = ff000000 000000ff

p0_label_118:
!	Mem[0000000030141408] = 000000ff, %l2 = 00000000000061f8
	swapa	[%i5+%o4]0x81,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010141410] = 00000000, %l6 = 7b1a0000ff000000
	ldstuba	[%i5+%o5]0x88,%l6	! %l6 = 00000000000000ff
!	%l3 = ffffffffffffffff, Mem[00000000211c0000] = ff877bbb
	sth	%l3,[%o2+%g0]		! Mem[00000000211c0000] = ffff7bbb
!	Mem[0000000010181418] = ff000000, %l3 = ffffffffffffffff
	ldstub	[%i6+0x018],%l3		! %l3 = 000000ff000000ff
!	Mem[0000000010041410] = 63c94f86, %l5 = 00000000000000ba
	ldstuba	[%i1+%o5]0x80,%l5	! %l5 = 00000063000000ff
!	Mem[0000000030181410] = 00000000, %l6 = 0000000000000000
	swapa	[%i6+%o5]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000010081414] = ffffffff, %l7 = 00000000000000ff
	lduwa	[%i2+0x014]%asi,%l7	! %l7 = 00000000ffffffff
!	%f11 = ff000000, Mem[0000000010001408] = e79997ff
	sta	%f11,[%i0+%o4]0x88	! Mem[0000000010001408] = ff000000
!	Mem[0000000010181400] = 00fa8533, %l1 = 00000000000000ba
	swapa	[%i6+%g0]0x80,%l1	! %l1 = 0000000000fa8533
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = 69f5f861, %l2 = 00000000000000ff
	lduwa	[%i4+%o4]0x89,%l2	! %l2 = 0000000069f5f861

p0_label_119:
!	Mem[0000000030101408] = 61f8f569, %l6 = 0000000000000000
	ldsba	[%i4+%o4]0x81,%l6	! %l6 = 0000000000000061
!	Mem[0000000010041430] = fe0b5bcb53f91e8f, %l7 = 00000000ffffffff
	ldx	[%i1+0x030],%l7		! %l7 = fe0b5bcb53f91e8f
!	%l1 = 0000000000fa8533, Mem[00000000201c0000] = 00ffaf65
	stb	%l1,[%o0+%g0]		! Mem[00000000201c0000] = 33ffaf65
!	%l5 = 0000000000000063, Mem[0000000030041400] = 864fc96300000000
	stxa	%l5,[%i1+%g0]0x89	! Mem[0000000030041400] = 0000000000000063
!	%l3 = 00000000000000ff, %l2 = 0000000069f5f861, %y  = 00000000
	umul	%l3,%l2,%l7		! %l7 = 000000698c02689f, %y = 00000069
!	Mem[0000000020800040] = ffffac70, %l6 = 0000000000000061
	ldsb	[%o1+0x041],%l6		! %l6 = ffffffffffffffff
!	Mem[0000000030181410] = 00000000, %l3 = 00000000000000ff
	ldsba	[%i6+%o5]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000010141430] = 00000000, %l3 = 0000000000000000
	ldsw	[%i5+0x030],%l3		! %l3 = 0000000000000000
!	Mem[0000000010141410] = 000000ff, %l1 = 0000000000fa8533
	lduba	[%i5+%o5]0x88,%l1	! %l1 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l0 = 0000104a0000007f, Mem[0000000030081400] = 00000000
	stba	%l0,[%i2+%g0]0x89	! Mem[0000000030081400] = 0000007f

p0_label_120:
!	Mem[00000000100c142c] = 2cb42ea1, %l3 = 0000000000000000, %asi = 80
	swapa	[%i3+0x02c]%asi,%l3	! %l3 = 000000002cb42ea1
!	Mem[0000000030101408] = 69f5f861, %l7 = 000000698c02689f
	ldstuba	[%i4+%o4]0x89,%l7	! %l7 = 00000061000000ff
!	%l1 = 00000000000000ff, Mem[0000000030081408] = 169e3a0bf837aaa5
	stxa	%l1,[%i2+%o4]0x81	! Mem[0000000030081408] = 00000000000000ff
!	%f5  = ff000000, Mem[000000001008140c] = 00001a7b
	sta	%f5 ,[%i2+0x00c]%asi	! Mem[000000001008140c] = ff000000
!	%f26 = 63c94f86 00000000, %l7 = 0000000000000061
!	Mem[0000000010101410] = ff00ffffff000000
	add	%i4,0x010,%g1
	stda	%f26,[%g1+%l7]ASI_PST8_PL ! Mem[0000000010101410] = 0000ffffff4fc900
!	%l7 = 0000000000000061, Mem[0000000030041400] = 00000063
	stba	%l7,[%i1+%g0]0x89	! Mem[0000000030041400] = 00000061
!	%f0  = 864fc963 00000000 ba9799e7 0b3a9e16
!	%f4  = aebbffff ff000000 703f71ab 00000000
!	%f8  = 6a3de8cb 000050e3 1db4a51e ff000000
!	%f12 = c065f2b2 06fd1e1a 0000582a 00000000
	stda	%f0,[%i4]ASI_COMMIT_S	! Block Store to 0000000030101400
!	Mem[0000000010141410] = ff000000, %l4 = 00000000e79997ba
	swapa	[%i5+%o5]0x80,%l4	! %l4 = 00000000ff000000
!	%f30 = ba9799e7 0b3a9e16, Mem[0000000030001410] = ff00e800 eb7550e3
	stda	%f30,[%i0+%o5]0x81	! Mem[0000000030001410] = ba9799e7 0b3a9e16
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = 7f000000, %f28 = ff00002d
	lda	[%i2+%g0]0x81,%f28	! %f28 = 7f000000

!	Check Point 24 for processor 0

	set	p0_check_pt_data_24,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 0000104a0000007f
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 0000000069f5f861
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 000000002cb42ea1
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l5,%g2			! %l5 = 0000000000000063
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l6,%g2			! %l6 = ffffffffffffffff
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l7,%g2			! %l7 = 0000000000000061
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x40],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = ffffffff ff000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1
	ldx	[%g4+0x48],%g3
	std	%f28,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f28 = 7f000000 ff000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf28,%g1

!	Check Point 24 completed


p0_label_121:
	membar	#Sync			! Added by membar checker (25)
!	Mem[0000000030101410] = aebbffff, %l2 = 0000000069f5f861
	lduba	[%i4+%o5]0x81,%l2	! %l2 = 00000000000000ae
!	Mem[00000000100c1414] = 00000000, %l4 = 00000000ff000000
	ldsb	[%i3+0x017],%l4		! %l4 = 0000000000000000
!	Mem[0000000010081410] = ccbe12ae, %f0  = 864fc963
	lda	[%i2+%o5]0x80,%f0 	! %f0 = ccbe12ae
!	Mem[00000000300c1400] = 4a100000, %l0 = 0000104a0000007f
	ldswa	[%i3+%g0]0x89,%l0	! %l0 = 000000004a100000
!	Mem[0000000030141400] = ff003f70, %l5 = 0000000000000063
	lduwa	[%i5+%g0]0x81,%l5	! %l5 = 00000000ff003f70
!	Mem[0000000030141400] = 703f00ff, %l4 = 0000000000000000
	lduba	[%i5+%g0]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010181408] = ff000000, %l3 = 000000002cb42ea1
	lduwa	[%i6+%o4]0x80,%l3	! %l3 = 00000000ff000000
!	Mem[0000000010181430] = 1a1efd06, %l1 = 00000000000000ff
	lduwa	[%i6+0x030]%asi,%l1	! %l1 = 000000001a1efd06
!	Mem[0000000010141408] = ffffffffffffffff, %l0 = 000000004a100000
	ldxa	[%i5+%o4]0x80,%l0	! %l0 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l2 = 00000000000000ae, Mem[0000000010181410] = 000000ff
	stba	%l2,[%i6+%o5]0x80	! Mem[0000000010181410] = ae0000ff

p0_label_122:
!	%l3 = 00000000ff000000, Mem[0000000010141400] = ff0000005fffffff
	stxa	%l3,[%i5+%g0]0x80	! Mem[0000000010141400] = 00000000ff000000
!	%l6 = ffffffff, %l7 = 00000061, Mem[0000000010081400] = e79997ba 00000000
	stda	%l6,[%i2+%g0]0x88	! Mem[0000000010081400] = ffffffff 00000061
!	Mem[0000000030141410] = c065f2b206fd1e1a, %l6 = ffffffffffffffff
	ldxa	[%i5+%o5]0x81,%l6	! %l6 = c065f2b206fd1e1a
!	Mem[0000000010081400] = ffffffff, %l3 = 00000000ff000000
	swapa	[%i2+%g0]0x88,%l3	! %l3 = 00000000ffffffff
!	%f19 = ffffffff, Mem[0000000010101400] = 864fc963
	sta	%f19,[%i4+%g0]0x80	! Mem[0000000010101400] = ffffffff
!	Mem[0000000010141408] = ffffffff, %l6 = c065f2b206fd1e1a
	swapa	[%i5+%o4]0x88,%l6	! %l6 = 00000000ffffffff
!	%l2 = 00000000000000ae, Mem[0000000030181408] = 00000000
	stba	%l2,[%i6+%o4]0x89	! Mem[0000000030181408] = 000000ae
!	Mem[0000000010081433] = 00000000, %l6 = 00000000ffffffff
	ldstuba	[%i2+0x033]%asi,%l6	! %l6 = 00000000000000ff
!	%f18 = 000000ff ffffffff, %l6 = 0000000000000000
!	Mem[0000000010081410] = ccbe12aeffffffff
	add	%i2,0x010,%g1
	stda	%f18,[%g1+%l6]ASI_PST8_PL ! Mem[0000000010081410] = ccbe12aeffffffff
!	Starting 10 instruction Load Burst
!	Mem[000000001008143c] = 3c3e5de6, %l7 = 0000000000000061
	lduha	[%i2+0x03c]%asi,%l7	! %l7 = 0000000000003c3e

p0_label_123:
!	Mem[0000000010081408] = 000000ffff000000, %l5 = 00000000ff003f70
	ldxa	[%i2+%o4]0x80,%l5	! %l5 = 000000ffff000000
!	Mem[0000000010181400] = 000000ba, %l5 = 000000ffff000000
	ldsba	[%i6+%g0]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000010101400] = ffffffff, %l3 = 00000000ffffffff
	lduwa	[%i4+%g0]0x88,%l3	! %l3 = 00000000ffffffff
!	Mem[0000000010001408] = 000000ff, %l6 = 0000000000000000
	ldsba	[%i0+%o4]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000010001418] = ccbe12ae, %l6 = 0000000000000000
	ldsha	[%i0+0x018]%asi,%l6	! %l6 = ffffffffffffccbe
!	Mem[0000000030181410] = 00000000, %f6  = 703f71ab
	lda	[%i6+%o5]0x89,%f6 	! %f6 = 00000000
!	Mem[0000000010141410] = e79997ba, %l5 = 0000000000000000
	ldsba	[%i5+%o5]0x80,%l5	! %l5 = ffffffffffffffe7
!	Mem[0000000030101400] = 864fc963, %f2  = ba9799e7
	lda	[%i4+%g0]0x81,%f2 	! %f2 = 864fc963
!	Mem[00000000300c1400] = 0000104a, %l5 = ffffffffffffffe7
	lduha	[%i3+%g0]0x81,%l5	! %l5 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l4 = 000000ff, %l5 = 00000000, Mem[0000000030001400] = 00000000 e79997ba
	stda	%l4,[%i0+%g0]0x81	! Mem[0000000030001400] = 000000ff 00000000

p0_label_124:
!	%l4 = 000000ff, %l5 = 00000000, Mem[0000000030101408] = e79997ba 169e3a0b
	stda	%l4,[%i4+%o4]0x89	! Mem[0000000030101408] = 000000ff 00000000
!	%f14 = 0000582a 00000000, %l5 = 0000000000000000
!	Mem[0000000010181430] = 1a1efd06b2f265c0
	add	%i6,0x030,%g1
	stda	%f14,[%g1+%l5]ASI_PST32_PL ! Mem[0000000010181430] = 1a1efd06b2f265c0
!	%l4 = 00000000000000ff, Mem[0000000010141408] = 1a1efd06
	stba	%l4,[%i5+%o4]0x80	! Mem[0000000010141408] = ff1efd06
!	%f10 = 1db4a51e ff000000, %l5 = 0000000000000000
!	Mem[00000000100c1408] = 2d00ffff864fc963
	add	%i3,0x008,%g1
	stda	%f10,[%g1+%l5]ASI_PST32_PL ! Mem[00000000100c1408] = 2d00ffff864fc963
!	%f0  = ccbe12ae 00000000, %l3 = 00000000ffffffff
!	Mem[0000000010101420] = 6a3de8cb000050e3
	add	%i4,0x020,%g1
	stda	%f0,[%g1+%l3]ASI_PST8_P ! Mem[0000000010101420] = ccbe12ae00000000
!	%l4 = 00000000000000ff, Mem[0000000030041408] = 0b3a9e16
	stba	%l4,[%i1+%o4]0x89	! Mem[0000000030041408] = 0b3a9eff
!	%f24 = 000000ff 2d0000ff, %l0 = ffffffffffffffff
!	Mem[0000000030101408] = ff00000000000000
	add	%i4,0x008,%g1
	stda	%f24,[%g1+%l0]ASI_PST8_S ! Mem[0000000030101408] = 000000ff2d0000ff
!	%f16 = ab000000 c3ae2ea1 000000ff ffffffff
!	%f20 = ffffffff ff000000 3385fac5 ff000000
!	%f24 = 000000ff 2d0000ff 63c94f86 00000000
!	%f28 = 7f000000 ff000000 ba9799e7 0b3a9e16
	stda	%f16,[%i0]ASI_BLK_S	! Block Store to 0000000030001400
	membar	#Sync			! Added by membar checker (26)
!	Mem[0000000030001408] = ff000000, %l6 = ffffffffffffccbe
	swapa	[%i0+%o4]0x89,%l6	! %l6 = 00000000ff000000
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = ffffffff, %l7 = 0000000000003c3e
	lduha	[%i3+%g0]0x80,%l7	! %l7 = 000000000000ffff

p0_label_125:
!	Mem[0000000030001410] = ffffffff, %l6 = 00000000ff000000
	ldswa	[%i0+%o5]0x81,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010181410] = ae0000ff, %l1 = 000000001a1efd06
	ldswa	[%i6+%o5]0x80,%l1	! %l1 = ffffffffae0000ff
!	Mem[0000000030081400] = 7f0000002a580000, %f26 = 63c94f86 00000000
	ldda	[%i2+%g0]0x81,%f26	! %f26 = 7f000000 2a580000
!	Mem[0000000010081408] = ff000000, %l2 = 00000000000000ae
	lduba	[%i2+%o4]0x88,%l2	! %l2 = 0000000000000000
!	Mem[00000000300c1408] = 0000000000e800ff, %f14 = 0000582a 00000000
	ldda	[%i3+%o4]0x89,%f14	! %f14 = 00000000 00e800ff
!	Mem[0000000010181400] = ba000000, %l4 = 00000000000000ff
	lduha	[%i6+%g0]0x88,%l4	! %l4 = 0000000000000000
!	Mem[00000000100c1408] = 63c94f86ffff002d, %f12 = c065f2b2 06fd1e1a
	ldda	[%i3+%o4]0x88,%f12	! %f12 = 63c94f86 ffff002d
!	Mem[0000000010181408] = ff000000, %l3 = 00000000ffffffff
	lduba	[%i6+%o4]0x80,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030001400] = a12eaec3000000ab, %l0 = ffffffffffffffff
	ldxa	[%i0+%g0]0x89,%l0	! %l0 = a12eaec3000000ab
!	Starting 10 instruction Store Burst
!	%f28 = 7f000000, Mem[0000000010181408] = ff000000
	sta	%f28,[%i6+%o4]0x80	! Mem[0000000010181408] = 7f000000

!	Check Point 25 for processor 0

	set	p0_check_pt_data_25,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = a12eaec3000000ab
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = ffffffffae0000ff
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 0000000000000000
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 0000000000000000
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 0000000000000000
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = ffffffffffffffff
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 000000000000ffff
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = ccbe12ae 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x50],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = 864fc963 0b3a9e16
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x58],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 00000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x60],%g3
	std	%f12,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f12 = 63c94f86 ffff002d
	bne	%xcc,p0_freg_check_fail
	mov	0xf12,%g1
	ldx	[%g4+0x68],%g3
	std	%f14,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f14 = 00000000 00e800ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf14,%g1
	ldx	[%g4+0x70],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = 7f000000 2a580000
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1

!	Check Point 25 completed


p0_label_126:
!	Mem[0000000030041400] = 00000061, %l5 = 0000000000000000
	swapa	[%i1+%g0]0x89,%l5	! %l5 = 0000000000000061
!	Mem[00000000211c0000] = ffff7bbb, %l3 = 00000000000000ff
	ldstuba	[%o2+0x000]%asi,%l3	! %l3 = 000000ff000000ff
!	%l1 = ffffffffae0000ff, Mem[0000000010041408] = 63c90000
	stha	%l1,[%i1+%o4]0x80	! Mem[0000000010041408] = 00ff0000
!	Mem[0000000030141408] = f8610000, %l4 = 0000000000000000
	swapa	[%i5+%o4]0x89,%l4	! %l4 = 00000000f8610000
!	%l3 = 00000000000000ff, Mem[0000000010001430] = 000000ff
	stw	%l3,[%i0+0x030]		! Mem[0000000010001430] = 000000ff
!	Mem[0000000030181408] = ae000000, %l4 = 00000000f8610000
	swapa	[%i6+%o4]0x81,%l4	! %l4 = 00000000ae000000
!	%f16 = ab000000 c3ae2ea1 000000ff ffffffff
!	%f20 = ffffffff ff000000 3385fac5 ff000000
!	%f24 = 000000ff 2d0000ff 7f000000 2a580000
!	%f28 = 7f000000 ff000000 ba9799e7 0b3a9e16
	stda	%f16,[%i5]ASI_BLK_S	! Block Store to 0000000030141400
!	%l2 = 0000000000000000, Mem[0000000010101408] = ba9799e7
	stw	%l2,[%i4+%o4]		! Mem[0000000010101408] = 00000000
!	%f2  = 864fc963 0b3a9e16, Mem[0000000010001408] = 000000ff 0b3aff16
	stda	%f2 ,[%i0+0x008]%asi	! Mem[0000000010001408] = 864fc963 0b3a9e16
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = 7f000000, %l6 = ffffffffffffffff
	lduba	[%i2+%g0]0x81,%l6	! %l6 = 000000000000007f

p0_label_127:
!	Mem[0000000010101410] = ffff0000, %l5 = 0000000000000061
	ldsha	[%i4+%o5]0x88,%l5	! %l5 = 0000000000000000
!	Mem[00000000300c1408] = ff00e800, %l7 = 000000000000ffff
	lduwa	[%i3+%o4]0x81,%l7	! %l7 = 00000000ff00e800
!	Mem[0000000010001400] = ff000000, %l1 = ffffffffae0000ff
	lduha	[%i0+0x002]%asi,%l1	! %l1 = 0000000000000000
!	Mem[0000000030081410] = ff00002d, %l3 = 00000000000000ff
	ldsba	[%i2+%o5]0x81,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000030101400] = 864fc96300000000, %l4 = 00000000ae000000
	ldxa	[%i4+%g0]0x81,%l4	! %l4 = 864fc96300000000
	membar	#Sync			! Added by membar checker (27)
!	Mem[0000000030141410] = ffffffffff000000, %f4  = aebbffff ff000000
	ldda	[%i5+%o5]0x81,%f4 	! %f4  = ffffffff ff000000
!	Mem[00000000300c1410] = 00000000, %l4 = 864fc96300000000
	lduba	[%i3+%o5]0x81,%l4	! %l4 = 0000000000000000
!	Mem[00000000211c0000] = ffff7bbb, %l5 = 0000000000000000
	lduha	[%o2+0x000]%asi,%l5	! %l5 = 000000000000ffff
!	Code Fragment 3
p0_fragment_5:
!	%l0 = a12eaec3000000ab
	setx	0xd55e06f82dff4f46,%g7,%l0 ! %l0 = d55e06f82dff4f46
!	%l1 = 0000000000000000
	setx	0x61e156c030f68ac7,%g7,%l1 ! %l1 = 61e156c030f68ac7
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = d55e06f82dff4f46
	setx	0x96f39c37fe870e51,%g7,%l0 ! %l0 = 96f39c37fe870e51
!	%l1 = 61e156c030f68ac7
	setx	0x8b72c0e84bb10d05,%g7,%l1 ! %l1 = 8b72c0e84bb10d05
!	Starting 10 instruction Store Burst
!	Mem[0000000030141410] = ffffffff, %l4 = 0000000000000000
	swapa	[%i5+%o5]0x81,%l4	! %l4 = 00000000ffffffff

p0_label_128:
!	Mem[0000000030141410] = 00000000, %l6 = 000000000000007f
	swapa	[%i5+%o5]0x81,%l6	! %l6 = 0000000000000000
!	%l0 = 96f39c37fe870e51, Mem[0000000030101408] = 000000ff
	stha	%l0,[%i4+%o4]0x81	! Mem[0000000030101408] = 0e5100ff
!	%l0 = 96f39c37fe870e51, Mem[0000000010181415] = 2d0000ff, %asi = 80
	stba	%l0,[%i6+0x015]%asi	! Mem[0000000010181414] = 2d5100ff
!	Mem[0000000030181400] = 00ffffff, %l0 = 96f39c37fe870e51
	swapa	[%i6+%g0]0x89,%l0	! %l0 = 0000000000ffffff
!	%l4 = ffffffff, %l5 = 0000ffff, Mem[0000000010081408] = ff000000 000000ff
	stda	%l4,[%i2+%o4]0x88	! Mem[0000000010081408] = ffffffff 0000ffff
!	%l2 = 0000000000000000, Mem[00000000100c1400] = ffffffff
	stwa	%l2,[%i3+%g0]0x88	! Mem[00000000100c1400] = 00000000
!	Mem[0000000030101400] = 864fc963, %l4 = 00000000ffffffff
	ldstuba	[%i4+%g0]0x81,%l4	! %l4 = 00000086000000ff
!	%f14 = 00000000, Mem[0000000010141434] = ffffffff
	sta	%f14,[%i5+0x034]%asi	! Mem[0000000010141434] = 00000000
!	%l6 = 0000000000000000, Mem[00000000100c1410] = e350000000000000
	stxa	%l6,[%i3+%o5]0x80	! Mem[00000000100c1410] = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = ae12becc, %l6 = 0000000000000000
	lduwa	[%i2+%o5]0x88,%l6	! %l6 = 00000000ae12becc

p0_label_129:
	membar	#Sync			! Added by membar checker (28)
!	Mem[0000000030101400] = ff4fc963 00000000 0e5100ff 2d0000ff
!	Mem[0000000030101410] = aebbffff ff000000 703f71ab 00000000
!	Mem[0000000030101420] = 6a3de8cb 000050e3 1db4a51e ff000000
!	Mem[0000000030101430] = c065f2b2 06fd1e1a 0000582a 00000000
	ldda	[%i4]ASI_BLK_S,%f16	! Block Load from 0000000030101400
!	Mem[0000000010141400] = 00000000ff000000, %l3 = ffffffffffffffff
	ldxa	[%i5+0x000]%asi,%l3	! %l3 = 00000000ff000000
!	Mem[0000000030181408] = f86100000000ff5f, %f0  = ccbe12ae 00000000
	ldda	[%i6+%o4]0x81,%f0 	! %f0  = f8610000 0000ff5f
!	Mem[00000000100c1408] = 2d00ffff, %l3 = 00000000ff000000
	ldsha	[%i3+0x00a]%asi,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010001438] = a3002dba, %l7 = 00000000ff00e800
	lduw	[%i0+0x038],%l7		! %l7 = 00000000a3002dba
!	Mem[0000000030101410] = aebbffff, %l1 = 8b72c0e84bb10d05
	ldswa	[%i4+%o5]0x81,%l1	! %l1 = ffffffffaebbffff
!	Mem[00000000100c1410] = 00000000, %l1 = ffffffffaebbffff
	lduha	[%i3+%o5]0x80,%l1	! %l1 = 0000000000000000
!	Mem[00000000100c1410] = 00000000, %l0 = 0000000000ffffff
	ldswa	[%i3+%o5]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000010101420] = ccbe12ae, %l1 = 0000000000000000
	lduh	[%i4+0x020],%l1		! %l1 = 000000000000ccbe
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (29)
!	%l0 = 0000000000000000, Mem[0000000030101410] = aebbffff
	stha	%l0,[%i4+%o5]0x81	! Mem[0000000030101410] = 0000ffff

p0_label_130:
!	Mem[00000000100c1410] = 00000000, %l0 = 0000000000000000
	swapa	[%i3+%o5]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000030141400] = ab000000, %l2 = 0000000000000000
	swapa	[%i5+%g0]0x81,%l2	! %l2 = 00000000ab000000
!	%l2 = ab000000, %l3 = ffffffff, Mem[0000000010181410] = ae0000ff 2d5100ff
	stda	%l2,[%i6+%o5]0x80	! Mem[0000000010181410] = ab000000 ffffffff
!	%l6 = 00000000ae12becc, Mem[0000000010041410] = ffc94f86
	stwa	%l6,[%i1+%o5]0x80	! Mem[0000000010041410] = ae12becc
!	Mem[0000000010101439] = 63c94f86, %l2 = 00000000ab000000
	ldstub	[%i4+0x039],%l2		! %l2 = 000000c9000000ff
!	Mem[0000000030101400] = 63c94fff, %l0 = 0000000000000000
	ldstuba	[%i4+%g0]0x89,%l0	! %l0 = 000000ff000000ff
!	Mem[0000000010041430] = fe0b5bcb, %l0 = 00000000000000ff
	swap	[%i1+0x030],%l0		! %l0 = 00000000fe0b5bcb
!	Mem[0000000030001400] = ab000000, %l6 = 00000000ae12becc
	swapa	[%i0+%g0]0x81,%l6	! %l6 = 00000000ab000000
!	%f20 = aebbffff ff000000, %l1 = 000000000000ccbe
!	Mem[00000000300c1428] = fddf7318cbe83d6a
	add	%i3,0x028,%g1
	stda	%f20,[%g1+%l1]ASI_PST8_S ! Mem[00000000300c1428] = aedfffffff00006a
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = 000000ff, %l6 = 00000000ab000000
	ldsba	[%i1+%o5]0x81,%l6	! %l6 = 0000000000000000

!	Check Point 26 for processor 0

	set	p0_check_pt_data_26,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 00000000fe0b5bcb
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 000000000000ccbe
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 00000000000000c9
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = ffffffffffffffff
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 0000000000000086
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 000000000000ffff
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 0000000000000000
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 00000000a3002dba
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = f8610000 0000ff5f
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x50],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = ffffffff ff000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x58],%g3
	std	%f16,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f16 = ff4fc963 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf16,%g1
	ldx	[%g4+0x60],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = 0e5100ff 2d0000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1
	ldx	[%g4+0x68],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = aebbffff ff000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1
	ldx	[%g4+0x70],%g3
	std	%f22,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f22 = 703f71ab 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf22,%g1
	ldx	[%g4+0x78],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = 6a3de8cb 000050e3
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1
	ldx	[%g4+0x80],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = 1db4a51e ff000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1
	ldx	[%g4+0x88],%g3
	std	%f28,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f28 = c065f2b2 06fd1e1a
	bne	%xcc,p0_freg_check_fail
	mov	0xf28,%g1
	ldx	[%g4+0x90],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = 0000582a 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 26 completed


p0_label_131:
!	Mem[0000000030101410] = 0000ffff, %l6 = 0000000000000000
	lduwa	[%i4+%o5]0x81,%l6	! %l6 = 000000000000ffff
!	Mem[00000000100c1428] = 46a572a3, %l4 = 0000000000000086
	swap	[%i3+0x028],%l4		! %l4 = 0000000046a572a3
!	Mem[0000000030141410] = 7f000000, %l5 = 000000000000ffff
	ldswa	[%i5+%o5]0x89,%l5	! %l5 = 000000007f000000
!	Mem[000000001010142c] = ff000000, %f21 = ff000000
	ld	[%i4+0x02c],%f21	! %f21 = ff000000
!	Mem[00000000100c1430] = 00000000, %l1 = 000000000000ccbe
	lduwa	[%i3+0x030]%asi,%l1	! %l1 = 0000000000000000
!	Mem[0000000010041410] = ae12becc864fc963, %f30 = 0000582a 00000000
	ldda	[%i1+%o5]0x80,%f30	! %f30 = ae12becc 864fc963
!	Mem[00000000201c0000] = 33ffaf65, %l6 = 000000000000ffff
	lduba	[%o0+0x000]%asi,%l6	! %l6 = 0000000000000033
!	Mem[0000000010101408] = 000000000b3a9e16, %l1 = 0000000000000000
	ldxa	[%i4+%o4]0x80,%l1	! %l1 = 000000000b3a9e16
!	Mem[0000000030141410] = 0000007f, %f16 = ff4fc963
	lda	[%i5+%o5]0x81,%f16	! %f16 = 0000007f
!	Starting 10 instruction Store Burst
!	%l3 = ffffffffffffffff, Mem[00000000300c1400] = 0000104a
	stba	%l3,[%i3+%g0]0x81	! Mem[00000000300c1400] = ff00104a

p0_label_132:
!	%f9  = 000050e3, Mem[0000000010141410] = e79997ba
	sta	%f9 ,[%i5+%o5]0x80	! Mem[0000000010141410] = 000050e3
!	Mem[00000000300c1410] = 00000000, %l0 = 00000000fe0b5bcb
	swapa	[%i3+%o5]0x81,%l0	! %l0 = 0000000000000000
!	%f9  = 000050e3, Mem[0000000010041408] = 0000ff00
	sta	%f9 ,[%i1+%o4]0x88	! Mem[0000000010041408] = 000050e3
!	%l6 = 00000033, %l7 = a3002dba, Mem[0000000010101420] = ccbe12ae 00000000
	stda	%l6,[%i4+0x020]%asi	! Mem[0000000010101420] = 00000033 a3002dba
!	%l4 = 46a572a3, %l5 = 7f000000, Mem[00000000300c1410] = cb5b0bfe 00000000
	stda	%l4,[%i3+%o5]0x89	! Mem[00000000300c1410] = 46a572a3 7f000000
!	%l0 = 00000000, %l1 = 0b3a9e16, Mem[00000000300c1408] = 00e800ff 00000000
	stda	%l0,[%i3+%o4]0x89	! Mem[00000000300c1408] = 00000000 0b3a9e16
!	%l1 = 000000000b3a9e16, Mem[0000000030081400] = 0000007f
	stha	%l1,[%i2+%g0]0x89	! Mem[0000000030081400] = 00009e16
!	Mem[0000000030001410] = ffffffff, %l7 = 00000000a3002dba
	ldstuba	[%i0+%o5]0x81,%l7	! %l7 = 000000ff000000ff
!	%l0 = 0000000000000000, Mem[00000000300c1400] = 4a1000ff
	stwa	%l0,[%i3+%g0]0x89	! Mem[00000000300c1400] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = 7f00000046a572a3, %f0  = f8610000 0000ff5f
	ldda	[%i3+%o5]0x89,%f0 	! %f0  = 7f000000 46a572a3

p0_label_133:
!	Mem[00000000100c1400] = 00000000, %l4 = 0000000046a572a3
	ldsba	[%i3+%g0]0x88,%l4	! %l4 = 0000000000000000
!	Mem[00000000201c0000] = 33ffaf65, %l3 = ffffffffffffffff
	ldsba	[%o0+0x001]%asi,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010141400] = 00000000, %f30 = ae12becc
	lda	[%i5+%g0]0x88,%f30	! %f30 = 00000000
!	Mem[0000000030041400] = 00000000, %f26 = 1db4a51e
	lda	[%i1+%g0]0x89,%f26	! %f26 = 00000000
!	Mem[0000000010081438] = 69f5f861 3c3e5de6, %l6 = 00000033, %l7 = 000000ff
	ldd	[%i2+0x038],%l6		! %l6 = 0000000069f5f861 000000003c3e5de6
!	Mem[0000000010081400] = ff000000, %l0 = 0000000000000000
	lduha	[%i2+%g0]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000010181410] = 000000ab, %l4 = 0000000000000000
	lduwa	[%i6+%o5]0x88,%l4	! %l4 = 00000000000000ab
!	Mem[0000000010141410] = e3500000, %l4 = 00000000000000ab
	lduha	[%i5+%o5]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000010001428] = 00000000, %f1  = 46a572a3
	ld	[%i0+0x028],%f1 	! %f1 = 00000000
!	Starting 10 instruction Store Burst
!	%l3 = ffffffffffffffff, Mem[0000000010041400] = 00e800ff
	stwa	%l3,[%i1+%g0]0x88	! Mem[0000000010041400] = ffffffff

p0_label_134:
!	Mem[0000000030081408] = 00000000, %l4 = 0000000000000000
	swapa	[%i2+%o4]0x81,%l4	! %l4 = 0000000000000000
!	%l4 = 00000000, %l5 = 7f000000, Mem[0000000010081410] = ccbe12ae ffffffff
	stda	%l4,[%i2+%o5]0x80	! Mem[0000000010081410] = 00000000 7f000000
!	Mem[000000001004141c] = 2d0000ff, %l5 = 000000007f000000
	ldstuba	[%i1+0x01c]%asi,%l5	! %l5 = 0000002d000000ff
!	Mem[0000000010101408] = 00000000, %l1 = 0b3a9e16, %l3 = ffffffff
	add	%i4,0x08,%g1
	casa	[%g1]0x80,%l1,%l3	! %l3 = 0000000000000000
!	%l7 = 000000003c3e5de6, Mem[0000000010141420] = e3613df6, %asi = 80
	stha	%l7,[%i5+0x020]%asi	! Mem[0000000010141420] = 5de63df6
!	%f2  = 864fc963 0b3a9e16, Mem[0000000010181410] = 000000ab ffffffff
	stda	%f2 ,[%i6+%o5]0x88	! Mem[0000000010181410] = 864fc963 0b3a9e16
!	%f17 = 00000000, Mem[0000000030181400] = fe870e51
	sta	%f17,[%i6+%g0]0x89	! Mem[0000000030181400] = 00000000
!	%l2 = 000000c9, %l3 = 00000000, Mem[0000000010181410] = 0b3a9e16 864fc963
	stda	%l2,[%i6+%o5]0x88	! Mem[0000000010181410] = 000000c9 00000000
!	%l4 = 0000000000000000, Mem[0000000010001410] = aebbffffff000000
	stxa	%l4,[%i0+%o5]0x80	! Mem[0000000010001410] = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = c9000000, %f20 = aebbffff
	lda	[%i6+%o5]0x80,%f20	! %f20 = c9000000

p0_label_135:
!	Mem[0000000030181408] = 000061f8, %f30 = 00000000
	lda	[%i6+%o4]0x89,%f30	! %f30 = 000061f8
!	Mem[0000000010041410] = ccbe12ae, %l0 = 0000000000000000
	lduba	[%i1+%o5]0x88,%l0	! %l0 = 00000000000000ae
!	Mem[0000000010041410] = ae12becc, %l2 = 00000000000000c9
	lduba	[%i1+%o5]0x80,%l2	! %l2 = 00000000000000ae
!	Mem[0000000010081420] = 000000a50000ffff, %f30 = 000061f8 864fc963
	ldda	[%i2+0x020]%asi,%f30	! %f30 = 000000a5 0000ffff
!	Mem[00000000300c1410] = a372a546, %l6 = 0000000069f5f861
	ldswa	[%i3+%o5]0x81,%l6	! %l6 = ffffffffa372a546
!	Mem[0000000010081408] = ffffffff ffff0000, %l6 = a372a546, %l7 = 3c3e5de6
	ldda	[%i2+%o4]0x80,%l6	! %l6 = 00000000ffffffff 00000000ffff0000
!	Mem[0000000010141410] = 000050e3864fc963, %f0  = 7f000000 00000000
	ldda	[%i5+%o5]0x80,%f0 	! %f0  = 000050e3 864fc963
!	Mem[0000000030181400] = 00000000, %l4 = 0000000000000000
	lduba	[%i6+%g0]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000030141408] = 000000ff, %l4 = 0000000000000000
	ldsha	[%i5+%o4]0x81,%l4	! %l4 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f4  = ffffffff ff000000, %l0 = 00000000000000ae
!	Mem[0000000010041410] = ae12becc864fc963
	add	%i1,0x010,%g1
	stda	%f4,[%g1+%l0]ASI_PST16_P ! Mem[0000000010041410] = ffffffffff00c963

!	Check Point 27 for processor 0

	set	p0_check_pt_data_27,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 00000000000000ae
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 000000000b3a9e16
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 00000000000000ae
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 0000000000000000
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 0000000000000000
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 000000000000002d
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 00000000ffffffff
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 00000000ffff0000
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = 000050e3 864fc963
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x50],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 00000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x58],%g3
	std	%f16,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f16 = 0000007f 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf16,%g1
	ldx	[%g4+0x60],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = c9000000 ff000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1
	ldx	[%g4+0x68],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = 00000000 ff000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1
	ldx	[%g4+0x70],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = 000000a5 0000ffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 27 completed


p0_label_136:
!	Mem[0000000030001410] = ffffffff, %l7 = 00000000ffff0000
	swapa	[%i0+%o5]0x81,%l7	! %l7 = 00000000ffffffff
!	%l6 = 00000000ffffffff, Mem[0000000030101400] = ff4fc963
	stwa	%l6,[%i4+%g0]0x81	! Mem[0000000030101400] = ffffffff
!	%f2  = 864fc963, Mem[0000000030101400] = ffffffff
	sta	%f2 ,[%i4+%g0]0x81	! Mem[0000000030101400] = 864fc963
!	%l4 = 0000000000000000, Mem[0000000010001410] = 0000000000000000
	stxa	%l4,[%i0+%o5]0x88	! Mem[0000000010001410] = 0000000000000000
!	%f2  = 864fc963 0b3a9e16, Mem[0000000010181400] = ba000000 e350ffeb
	stda	%f2 ,[%i6+%g0]0x88	! Mem[0000000010181400] = 864fc963 0b3a9e16
!	%f0  = 000050e3 864fc963, Mem[0000000030081410] = 2d0000ff ff5f771e
	stda	%f0 ,[%i2+%o5]0x89	! Mem[0000000030081410] = 000050e3 864fc963
!	Mem[0000000010041410] = ffffffff, %l0 = 00000000000000ae
	ldstuba	[%i1+%o5]0x88,%l0	! %l0 = 000000ff000000ff
!	%l7 = 00000000ffffffff, Mem[000000001000141c] = 0000003f
	stw	%l7,[%i0+0x01c]		! Mem[000000001000141c] = ffffffff
!	%l6 = ffffffff, %l7 = ffffffff, Mem[0000000010001410] = 00000000 00000000
	stda	%l6,[%i0+%o5]0x80	! Mem[0000000010001410] = ffffffff ffffffff
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (30)
!	Mem[0000000010101400] = ffffffff 00000000 00000000 0b3a9e16
!	Mem[0000000010101410] = 0000ffff ff4fc900 703f71ab 00000000
!	Mem[0000000010101420] = 00000033 a3002dba 1db4a5ff ff000000
!	Mem[0000000010101430] = c065f2b2 06fd1e1a 63ff4f86 0b3a9e16
	ldda	[%i4]ASI_BLK_P,%f0	! Block Load from 0000000010101400

p0_label_137:
!	Mem[00000000211c0000] = ffff7bbb, %l3 = 0000000000000000
	lduba	[%o2+0x001]%asi,%l3	! %l3 = 00000000000000ff
!	Mem[00000000100c1408] = ffff002d, %l1 = 000000000b3a9e16
	lduba	[%i3+%o4]0x88,%l1	! %l1 = 000000000000002d
!	Mem[0000000021800100] = ff99b49a, %l4 = 0000000000000000
	ldub	[%o3+0x100],%l4		! %l4 = 00000000000000ff
!	Mem[0000000030141400] = 00000000, %l1 = 000000000000002d
	lduwa	[%i5+%g0]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000010081400] = 000000ff, %f31 = 0000ffff
	lda	[%i2+%g0]0x80,%f31	! %f31 = 000000ff
!	Mem[0000000010101408] = 00000000, %l7 = 00000000ffffffff
	ldswa	[%i4+%o4]0x88,%l7	! %l7 = 0000000000000000
!	Mem[00000000300c1400] = 00000000 0000007f 00000000 169e3a0b
!	Mem[00000000300c1410] = a372a546 0000007f 0b3a9e16 00000b00
!	Mem[00000000300c1420] = dcfd2bef 3c3e5de6 aedfffff ff00006a
!	Mem[00000000300c1430] = ffbbd853 00003f00 ea80797b dcfd2bef
	ldda	[%i3]ASI_BLK_S,%f0	! Block Load from 00000000300c1400
!	Mem[00000000300c1408] = 00000000, %l1 = 0000000000000000
	lduha	[%i3+%o4]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000030001410] = 0000ffff, %l5 = 000000000000002d
	lduwa	[%i0+%o5]0x89,%l5	! %l5 = 000000000000ffff
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1408] = ffff002d, %l6 = 00000000ffffffff
	ldstuba	[%i3+%o4]0x88,%l6	! %l6 = 0000002d000000ff

p0_label_138:
!	%l2 = 00000000000000ae, Mem[0000000010001434] = 00000000
	sth	%l2,[%i0+0x034]		! Mem[0000000010001434] = 00ae0000
!	%l0 = 00000000000000ff, Mem[0000000010081400] = 000000ff
	stha	%l0,[%i2+%g0]0x80	! Mem[0000000010081400] = 00ff00ff
	membar	#Sync			! Added by membar checker (31)
!	%f28 = c065f2b2 06fd1e1a, Mem[00000000300c1408] = 00000000 169e3a0b
	stda	%f28,[%i3+%o4]0x81	! Mem[00000000300c1408] = c065f2b2 06fd1e1a
!	%l7 = 0000000000000000, Mem[000000001004140d] = e3504689, %asi = 80
	stba	%l7,[%i1+0x00d]%asi	! Mem[000000001004140c] = e3004689
!	Mem[0000000030081400] = 00009e16, %l3 = 00000000000000ff
	ldstuba	[%i2+%g0]0x89,%l3	! %l3 = 00000016000000ff
!	Mem[0000000030101410] = ffff0000, %l7 = 0000000000000000
	swapa	[%i4+%o5]0x89,%l7	! %l7 = 00000000ffff0000
!	%l5 = 000000000000ffff, Mem[0000000030081410] = 63c94f86
	stha	%l5,[%i2+%o5]0x81	! Mem[0000000030081410] = ffff4f86
!	%l1 = 0000000000000000, Mem[0000000010001408] = 864fc963
	stwa	%l1,[%i0+%o4]0x80	! Mem[0000000010001408] = 00000000
!	%l4 = 00000000000000ff, Mem[0000000030141410] = 0000007f
	stha	%l4,[%i5+%o5]0x81	! Mem[0000000030141410] = 00ff007f
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = ffffccbe, %l7 = 00000000ffff0000
	lduha	[%i0+%o4]0x89,%l7	! %l7 = 000000000000ccbe

p0_label_139:
!	Mem[0000000030081400] = ff9e00002a580000, %f18 = 0e5100ff 2d0000ff
	ldda	[%i2+%g0]0x81,%f18	! %f18 = ff9e0000 2a580000
!	Mem[0000000030001408] = ffffccbe, %l1 = 0000000000000000
	ldswa	[%i0+%o4]0x89,%l1	! %l1 = ffffffffffffccbe
!	Mem[0000000030101400] = 63c94f86, %l4 = 00000000000000ff
	lduha	[%i4+%g0]0x89,%l4	! %l4 = 0000000000004f86
!	Mem[00000000100c1410] = 00000000, %l3 = 0000000000000016
	ldswa	[%i3+%o5]0x80,%l3	! %l3 = 0000000000000000
!	Mem[00000000300c1408] = 1a1efd06b2f265c0, %l3 = 0000000000000000
	ldxa	[%i3+%o4]0x89,%l3	! %l3 = 1a1efd06b2f265c0
!	Mem[0000000010001428] = 00000000, %l7 = 000000000000ccbe
	ldsha	[%i0+0x02a]%asi,%l7	! %l7 = 0000000000000000
!	Mem[0000000010081408] = ffffffffffff0000, %l7 = 0000000000000000
	ldxa	[%i2+%o4]0x80,%l7	! %l7 = ffffffffffff0000
!	Mem[0000000010141438] = 00e800ffffffff59, %l7 = ffffffffffff0000
	ldx	[%i5+0x038],%l7		! %l7 = 00e800ffffffff59
!	Code Fragment 3
p0_fragment_6:
!	%l0 = 00000000000000ff
	setx	0x51e2ee402c43d0f7,%g7,%l0 ! %l0 = 51e2ee402c43d0f7
!	%l1 = ffffffffffffccbe
	setx	0x32f311aff72a20fa,%g7,%l1 ! %l1 = 32f311aff72a20fa
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 51e2ee402c43d0f7
	setx	0x95f704dfda75b514,%g7,%l0 ! %l0 = 95f704dfda75b514
!	%l1 = 32f311aff72a20fa
	setx	0x7edbbc87d9fa3afa,%g7,%l1 ! %l1 = 7edbbc87d9fa3afa
!	Starting 10 instruction Store Burst
!	Mem[0000000010141410] = 000050e3, %l7 = 00e800ffffffff59
	swapa	[%i5+%o5]0x80,%l7	! %l7 = 00000000000050e3

p0_label_140:
!	Mem[0000000030181410] = 00000000, %l6 = 000000000000002d
	ldstuba	[%i6+%o5]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030041410] = 000000ff, %l4 = 0000000000004f86
	ldstuba	[%i1+%o5]0x81,%l4	! %l4 = 00000000000000ff
!	%l2 = 000000ae, %l3 = b2f265c0, Mem[0000000010141400] = 00000000 000000ff
	stda	%l2,[%i5+%g0]0x88	! Mem[0000000010141400] = 000000ae b2f265c0
!	Mem[0000000030081400] = ff9e0000, %l2 = 00000000000000ae
	swapa	[%i2+%g0]0x81,%l2	! %l2 = 00000000ff9e0000
!	%f2  = 00000000 169e3a0b, Mem[0000000030081410] = 864fffff 000050e3
	stda	%f2 ,[%i2+%o5]0x89	! Mem[0000000030081410] = 00000000 169e3a0b
!	%f10 = aedfffff ff00006a, Mem[0000000030101408] = 0e5100ff 2d0000ff
	stda	%f10,[%i4+%o4]0x81	! Mem[0000000030101408] = aedfffff ff00006a
!	%l1 = 7edbbc87d9fa3afa, Mem[0000000030041408] = ff9e3a0b
	stha	%l1,[%i1+%o4]0x81	! Mem[0000000030041408] = 3afa3a0b
!	Mem[0000000030141410] = 00ff007f, %l2 = 00000000ff9e0000
	swapa	[%i5+%o5]0x81,%l2	! %l2 = 0000000000ff007f
!	Mem[00000000100c1434] = 00003a0b, %l0 = da75b514, %l2 = 00ff007f
	add	%i3,0x34,%g1
	casa	[%g1]0x80,%l0,%l2	! %l2 = 0000000000003a0b
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = ffffffff, %l2 = 0000000000003a0b
	ldsha	[%i1+%g0]0x88,%l2	! %l2 = ffffffffffffffff

!	Check Point 28 for processor 0

	set	p0_check_pt_data_28,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 95f704dfda75b514
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 7edbbc87d9fa3afa
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = ffffffffffffffff
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 1a1efd06b2f265c0
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 0000000000000000
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 000000000000ffff
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 0000000000000000
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 00000000000050e3
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = 00000000 0000007f
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x50],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = 00000000 169e3a0b
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x58],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = a372a546 0000007f
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x60],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 0b3a9e16 00000b00
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x68],%g3
	std	%f8,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f8 = dcfd2bef 3c3e5de6
	bne	%xcc,p0_freg_check_fail
	mov	0xf08,%g1
	ldx	[%g4+0x70],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = aedfffff ff00006a
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x78],%g3
	std	%f12,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f12 = ffbbd853 00003f00
	bne	%xcc,p0_freg_check_fail
	mov	0xf12,%g1
	ldx	[%g4+0x80],%g3
	std	%f14,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f14 = ea80797b dcfd2bef
	bne	%xcc,p0_freg_check_fail
	mov	0xf14,%g1
	ldx	[%g4+0x88],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = ff9e0000 2a580000
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1
	ldx	[%g4+0x90],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = 000000a5 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 28 completed


p0_label_141:
!	Mem[0000000030041408] = 3afa3a0b, %l0 = 95f704dfda75b514
	lduha	[%i1+%o4]0x81,%l0	! %l0 = 0000000000003afa
!	Mem[0000000010041408] = 894600e3 000050e3, %l0 = 00003afa, %l1 = d9fa3afa
	ldda	[%i1+%o4]0x88,%l0	! %l0 = 00000000000050e3 00000000894600e3
!	Mem[0000000030001408] = beccffff, %l0 = 00000000000050e3
	ldswa	[%i0+%o4]0x81,%l0	! %l0 = ffffffffbeccffff
!	Mem[0000000010181400] = 169e3a0b, %l0 = ffffffffbeccffff
	ldswa	[%i6+%g0]0x80,%l0	! %l0 = 00000000169e3a0b
!	Mem[00000000100c1410] = 0000000000000000, %l1 = 00000000894600e3
	ldxa	[%i3+%o5]0x80,%l1	! %l1 = 0000000000000000
!	Mem[00000000100c1410] = 00000000, %l5 = 000000000000ffff
	lduwa	[%i3+%o5]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000030101400] = 0000000063c94f86, %f12 = ffbbd853 00003f00
	ldda	[%i4+%g0]0x89,%f12	! %f12 = 00000000 63c94f86
!	Mem[0000000030101410] = 00000000, %l2 = ffffffffffffffff
	ldsba	[%i4+%o5]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000010101408] = 00000000, %l6 = 0000000000000000
	lduw	[%i4+%o4],%l6		! %l6 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1410] = 46a572a3, %l2 = 0000000000000000
	ldstuba	[%i3+%o5]0x89,%l2	! %l2 = 000000a3000000ff

p0_label_142:
!	%f12 = 00000000 63c94f86, %l3 = 1a1efd06b2f265c0
!	Mem[0000000030001400] = ae12beccc3ae2ea1
	stda	%f12,[%i0+%l3]ASI_PST32_SL ! Mem[0000000030001400] = ae12beccc3ae2ea1
!	%l1 = 0000000000000000, Mem[0000000010141428] = 0b2f0bd4
	stw	%l1,[%i5+0x028]		! Mem[0000000010141428] = 00000000
!	%l7 = 00000000000050e3, Mem[0000000010041410] = ffffffffff00c963
	stxa	%l7,[%i1+%o5]0x80	! Mem[0000000010041410] = 00000000000050e3
!	%f23 = 00000000, Mem[0000000010141410] = 59ffffff
	sta	%f23,[%i5+%o5]0x88	! Mem[0000000010141410] = 00000000
!	%l0 = 169e3a0b, %l1 = 00000000, Mem[0000000010101400] = ffffffff 00000000
	stda	%l0,[%i4+%g0]0x88	! Mem[0000000010101400] = 169e3a0b 00000000
!	Mem[0000000030181400] = 00000000, %l3 = 1a1efd06b2f265c0
	ldstuba	[%i6+%g0]0x81,%l3	! %l3 = 00000000000000ff
!	%f15 = dcfd2bef, Mem[0000000010181410] = 000000c9
	sta	%f15,[%i6+%o5]0x88	! Mem[0000000010181410] = dcfd2bef
!	Mem[0000000010081438] = 69f5f8613c3e5de6, %l1 = 0000000000000000, %l7 = 00000000000050e3
	add	%i2,0x38,%g1
	casxa	[%g1]0x80,%l1,%l7	! %l7 = 69f5f8613c3e5de6
!	%l6 = 0000000000000000, Mem[0000000010041410] = 00000000
	stha	%l6,[%i1+%o5]0x88	! Mem[0000000010041410] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = ffff0000ff000000, %l5 = 0000000000000000
	ldxa	[%i0+%o5]0x81,%l5	! %l5 = ffff0000ff000000

p0_label_143:
!	Mem[0000000030001400] = ccbe12ae, %l2 = 00000000000000a3
	ldsha	[%i0+%g0]0x89,%l2	! %l2 = 00000000000012ae
!	Mem[0000000030081400] = 000000ae, %l2 = 00000000000012ae
	ldsha	[%i2+%g0]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000030141400] = 00000000, %f24 = 6a3de8cb
	lda	[%i5+%g0]0x89,%f24	! %f24 = 00000000
!	Mem[0000000030001408] = beccffff ffffffff, %l6 = 00000000, %l7 = 3c3e5de6
	ldda	[%i0+%o4]0x81,%l6	! %l6 = 00000000beccffff 00000000ffffffff
!	Mem[0000000030181408] = f86100000000ff5f, %f24 = 00000000 000050e3
	ldda	[%i6+%o4]0x81,%f24	! %f24 = f8610000 0000ff5f
!	Mem[0000000010181410] = ef2bfddc, %l0 = 00000000169e3a0b
	ldswa	[%i6+%o5]0x80,%l0	! %l0 = ffffffffef2bfddc
!	Mem[0000000010081408] = 0000ffffffffffff, %f28 = c065f2b2 06fd1e1a
	ldda	[%i2+%o4]0x88,%f28	! %f28 = 0000ffff ffffffff
!	Mem[0000000010141408] = ff1efd06ffffffff, %f24 = f8610000 0000ff5f
	ldda	[%i5+0x008]%asi,%f24	! %f24 = ff1efd06 ffffffff
!	Mem[0000000010041410] = 00000000, %l4 = 0000000000000000
	ldstuba	[%i1+%o5]0x88,%l4	! %l4 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000030081400] = 000000ae, %l2 = 0000000000000000
	ldstuba	[%i2+%g0]0x81,%l2	! %l2 = 00000000000000ff

p0_label_144:
!	%l0 = ffffffffef2bfddc, Mem[0000000010141410] = 00000000
	stwa	%l0,[%i5+%o5]0x80	! Mem[0000000010141410] = ef2bfddc
!	%l5 = ffff0000ff000000, Mem[0000000030101400] = 864fc963
	stwa	%l5,[%i4+%g0]0x81	! Mem[0000000030101400] = ff000000
!	Mem[0000000010041410] = 000000ff, %l7 = 00000000ffffffff
	ldstuba	[%i1+%o5]0x88,%l7	! %l7 = 000000ff000000ff
!	%l7 = 00000000000000ff, Mem[0000000021800100] = ff99b49a
	sth	%l7,[%o3+0x100]		! Mem[0000000021800100] = 00ffb49a
!	%f4  = a372a546 0000007f, Mem[0000000030041400] = 00000000 00000000
	stda	%f4 ,[%i1+%g0]0x81	! Mem[0000000030041400] = a372a546 0000007f
!	Mem[00000000300c1408] = c065f2b2, %l6 = 00000000beccffff
	ldstuba	[%i3+%o4]0x81,%l6	! %l6 = 000000c0000000ff
!	%f0  = 00000000 0000007f 00000000 169e3a0b
!	%f4  = a372a546 0000007f 0b3a9e16 00000b00
!	%f8  = dcfd2bef 3c3e5de6 aedfffff ff00006a
!	%f12 = 00000000 63c94f86 ea80797b dcfd2bef
	stda	%f0,[%i1]ASI_BLK_AIUS	! Block Store to 0000000030041400
!	%f24 = ff1efd06 ffffffff, %l4 = 0000000000000000
!	Mem[00000000100c1410] = 0000000000000000
	add	%i3,0x010,%g1
	stda	%f24,[%g1+%l4]ASI_PST8_P ! Mem[00000000100c1410] = 0000000000000000
!	Mem[0000000030181408] = 000061f8, %l0 = ffffffffef2bfddc
	swapa	[%i6+%o4]0x89,%l0	! %l0 = 00000000000061f8
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (32)
!	Mem[0000000030041400] = 00000000, %l7 = 00000000000000ff
	lduwa	[%i1+%g0]0x89,%l7	! %l7 = 0000000000000000

p0_label_145:
!	Mem[0000000020800040] = ffffac70, %l2 = 0000000000000000
	ldsb	[%o1+0x041],%l2		! %l2 = ffffffffffffffff
!	Mem[0000000010181400] = 0b3a9e16, %l4 = 0000000000000000
	ldsba	[%i6+%g0]0x88,%l4	! %l4 = 0000000000000016
!	Mem[0000000030101408] = ffffdfae, %l4 = 0000000000000016
	ldsha	[%i4+%o4]0x89,%l4	! %l4 = ffffffffffffdfae
!	Mem[0000000010141400] = 000000ae, %l4 = ffffffffffffdfae
	ldsha	[%i5+%g0]0x88,%l4	! %l4 = 00000000000000ae
!	Mem[000000001004143c] = 183170b9, %f22 = 703f71ab
	lda	[%i1+0x03c]%asi,%f22	! %f22 = 183170b9
!	Mem[0000000030181410] = ff000000000000ff, %l2 = ffffffffffffffff
	ldxa	[%i6+%o5]0x89,%l2	! %l2 = ff000000000000ff
!	Mem[00000000100c1400] = 00000000, %l4 = 00000000000000ae
	ldsba	[%i3+%g0]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000010081410] = 00000000, %l7 = 0000000000000000
	ldsba	[%i2+%o5]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000010081400] = 00ff00ff, %l7 = 0000000000000000
	ldsha	[%i2+%g0]0x80,%l7	! %l7 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l2 = ff000000000000ff, Mem[0000000010101408] = 00000000
	stba	%l2,[%i4+%o4]0x88	! Mem[0000000010101408] = 000000ff

!	Check Point 29 for processor 0

	set	p0_check_pt_data_29,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 00000000000061f8
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 0000000000000000
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = ff000000000000ff
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 0000000000000000
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 0000000000000000
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = ffff0000ff000000
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 00000000000000c0
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = 00000000 0000007f
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x50],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 0b3a9e16 00000b00
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x58],%g3
	std	%f12,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f12 = 00000000 63c94f86
	bne	%xcc,p0_freg_check_fail
	mov	0xf12,%g1
	ldx	[%g4+0x60],%g3
	std	%f22,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f22 = 183170b9 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf22,%g1
	ldx	[%g4+0x68],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = ff1efd06 ffffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1
	ldx	[%g4+0x70],%g3
	std	%f28,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f28 = 0000ffff ffffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf28,%g1

!	Check Point 29 completed


p0_label_146:
!	%f18 = ff9e0000 2a580000, Mem[0000000010141430] = 00000000 00000000
	stda	%f18,[%i5+0x030]%asi	! Mem[0000000010141430] = ff9e0000 2a580000
!	%l7 = 00000000000000ff, Mem[0000000010081408] = ffffffff
	stba	%l7,[%i2+%o4]0x80	! Mem[0000000010081408] = ffffffff
!	%l6 = 000000c0, %l7 = 000000ff, Mem[0000000030141410] = ff9e0000 ff000000
	stda	%l6,[%i5+%o5]0x81	! Mem[0000000030141410] = 000000c0 000000ff
!	%f7  = 00000b00, Mem[0000000030001410] = ffff0000
	sta	%f7 ,[%i0+%o5]0x81	! Mem[0000000030001410] = 00000b00
!	Mem[00000000300c1408] = ff65f2b2, %l7 = 00000000000000ff
	ldstuba	[%i3+%o4]0x81,%l7	! %l7 = 000000ff000000ff
!	%l7 = 00000000000000ff, Mem[0000000010141408] = ff1efd06
	stba	%l7,[%i5+%o4]0x80	! Mem[0000000010141408] = ff1efd06
!	Mem[0000000010101410] = ffff0000, %l5 = ffff0000ff000000
	ldstuba	[%i4+%o5]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[000000001010143b] = 63ff4f86, %l5 = 0000000000000000
	ldstub	[%i4+0x03b],%l5		! %l5 = 00000086000000ff
!	%l0 = 00000000000061f8, Mem[0000000010141428] = 00000000ec1ac7fc
	stx	%l0,[%i5+0x028]		! Mem[0000000010141428] = 00000000000061f8
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = ff00ff00, %l0 = 00000000000061f8
	lduha	[%i2+%g0]0x88,%l0	! %l0 = 000000000000ff00

p0_label_147:
!	Mem[0000000010181410] = ef2bfddc00000000, %l7 = 00000000000000ff
	ldxa	[%i6+0x010]%asi,%l7	! %l7 = ef2bfddc00000000
!	Mem[0000000010181408] = 7f000000, %l2 = ff000000000000ff
	ldsba	[%i6+%o4]0x80,%l2	! %l2 = 000000000000007f
!	Mem[0000000010141424] = d4b66f2b, %l5 = 0000000000000086
	ldsb	[%i5+0x027],%l5		! %l5 = 000000000000002b
!	Mem[0000000010141410] = ef2bfddc, %l2 = 000000000000007f
	lduha	[%i5+%o5]0x80,%l2	! %l2 = 000000000000ef2b
!	Mem[0000000010141430] = ff9e0000 2a580000, %l6 = 000000c0, %l7 = 00000000
	ldda	[%i5+0x030]%asi,%l6	! %l6 = 00000000ff9e0000 000000002a580000
!	Mem[000000001014140c] = ffffffff, %l6 = 00000000ff9e0000
	lduha	[%i5+0x00c]%asi,%l6	! %l6 = 000000000000ffff
!	Mem[0000000030001410] = 00000b00, %l3 = 0000000000000000
	ldsba	[%i0+%o5]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000010001410] = ffffffff, %f15 = dcfd2bef
	lda	[%i0+%o5]0x88,%f15	! %f15 = ffffffff
!	Mem[0000000010081424] = 0000ffff, %l2 = 000000000000ef2b
	lduw	[%i2+0x024],%l2		! %l2 = 000000000000ffff
!	Starting 10 instruction Store Burst
!	Mem[00000000201c0000] = 33ffaf65, %l0 = 000000000000ff00
	ldstuba	[%o0+0x000]%asi,%l0	! %l0 = 00000033000000ff

p0_label_148:
!	Mem[00000000100c1408] = ff00ffff, %l5 = 000000000000002b
	ldstuba	[%i3+%o4]0x80,%l5	! %l5 = 000000ff000000ff
!	%l4 = 00000000, %l5 = 000000ff, Mem[0000000030181400] = 000000ff 00000000
	stda	%l4,[%i6+%g0]0x89	! Mem[0000000030181400] = 00000000 000000ff
!	Mem[000000001010140c] = 0b3a9e16, %l1 = 0000000000000000, %asi = 80
	swapa	[%i4+0x00c]%asi,%l1	! %l1 = 000000000b3a9e16
!	%f30 = 000000a5, Mem[0000000010141400] = ae000000
	sta	%f30,[%i5+%g0]0x80	! Mem[0000000010141400] = 000000a5
!	Mem[0000000030101408] = aedfffff, %l5 = 00000000000000ff
	ldstuba	[%i4+%o4]0x81,%l5	! %l5 = 000000ae000000ff
!	%f16 = 0000007f 00000000 ff9e0000 2a580000
!	%f20 = c9000000 ff000000 183170b9 00000000
!	%f24 = ff1efd06 ffffffff 00000000 ff000000
!	%f28 = 0000ffff ffffffff 000000a5 000000ff
	stda	%f16,[%i5]ASI_COMMIT_P	! Block Store to 0000000010141400
!	Mem[0000000030081410] = 0b3a9e16, %l0 = 0000000000000033
	swapa	[%i2+%o5]0x81,%l0	! %l0 = 000000000b3a9e16
!	%l4 = 0000000000000000, Mem[0000000010181430] = 1a1efd06b2f265c0, %asi = 80
	stxa	%l4,[%i6+0x030]%asi	! Mem[0000000010181430] = 0000000000000000
!	%l0 = 0b3a9e16, %l1 = 0b3a9e16, Mem[0000000010181410] = ef2bfddc 00000000
	stda	%l0,[%i6+%o5]0x80	! Mem[0000000010181410] = 0b3a9e16 0b3a9e16
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = 864fc9630b3a9e16, %f4  = a372a546 0000007f
	ldda	[%i6+%g0]0x88,%f4 	! %f4  = 864fc963 0b3a9e16

p0_label_149:
!	Mem[0000000030001408] = ffffccbe, %f14 = ea80797b
	lda	[%i0+%o4]0x89,%f14	! %f14 = ffffccbe
!	Mem[0000000030101408] = 6a0000ffffffdfff, %l6 = 000000000000ffff
	ldxa	[%i4+%o4]0x89,%l6	! %l6 = 6a0000ffffffdfff
!	Mem[0000000010101410] = 00c94fffffff00ff, %l4 = 0000000000000000
	ldxa	[%i4+%o5]0x88,%l4	! %l4 = 00c94fffffff00ff
!	Mem[0000000020800040] = ffffac70, %l0 = 000000000b3a9e16
	lduha	[%o1+0x040]%asi,%l0	! %l0 = 000000000000ffff
!	Mem[0000000010101434] = 06fd1e1a, %l6 = 6a0000ffffffdfff
	lduw	[%i4+0x034],%l6		! %l6 = 0000000006fd1e1a
!	Mem[0000000010081408] = ffffffff, %l1 = 000000000b3a9e16
	lduha	[%i2+%o4]0x80,%l1	! %l1 = 000000000000ffff
!	Mem[0000000010101408] = ff000000, %f14 = ffffccbe
	lda	[%i4+%o4]0x80,%f14	! %f14 = ff000000
	membar	#Sync			! Added by membar checker (33)
!	%l4 = 00c94fffffff00ff, Mem[0000000010141400] = 0000007f
	stha	%l4,[%i5+%g0]0x80	! Mem[0000000010141400] = 00ff007f
!	Mem[00000000300c1410] = 46a572ff, %f18 = ff9e0000
	lda	[%i3+%o5]0x89,%f18	! %f18 = 46a572ff
!	Starting 10 instruction Store Burst
!	%l6 = 0000000006fd1e1a, Mem[0000000030181400] = 00000000ff000000
	stxa	%l6,[%i6+%g0]0x81	! Mem[0000000030181400] = 0000000006fd1e1a

p0_label_150:
!	%f28 = 0000ffff ffffffff, Mem[0000000010081408] = ffffffff ffff0000
	stda	%f28,[%i2+%o4]0x80	! Mem[0000000010081408] = 0000ffff ffffffff
!	%l0 = 000000000000ffff, Mem[0000000010081410] = 00000000
	stha	%l0,[%i2+%o5]0x80	! Mem[0000000010081410] = ffff0000
!	%f26 = 00000000, Mem[0000000010181408] = 7f000000
	sta	%f26,[%i6+%o4]0x80	! Mem[0000000010181408] = 00000000
!	%l0 = 000000000000ffff, Mem[0000000010001410] = ffffffff
	stha	%l0,[%i0+%o5]0x80	! Mem[0000000010001410] = ffffffff
!	%l3 = 0000000000000000, Mem[0000000020800000] = ffff7d94
	sth	%l3,[%o1+%g0]		! Mem[0000000020800000] = 00007d94
!	%l6 = 06fd1e1a, %l7 = 2a580000, Mem[0000000030041400] = 00000000 7f000000
	stda	%l6,[%i1+%g0]0x89	! Mem[0000000030041400] = 06fd1e1a 2a580000
!	%l5 = 00000000000000ae, Mem[0000000010041410] = ff000000000050e3
	stxa	%l5,[%i1+%o5]0x80	! Mem[0000000010041410] = 00000000000000ae
!	%l5 = 00000000000000ae, Mem[0000000030141408] = 000000ff
	stba	%l5,[%i5+%o4]0x81	! Mem[0000000030141408] = ae0000ff
!	%f22 = 183170b9 00000000, Mem[00000000100c1428] = 00000086 00000000
	std	%f22,[%i3+0x028]	! Mem[00000000100c1428] = 183170b9 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = 00000000, %l5 = 00000000000000ae
	ldsha	[%i6+%g0]0x81,%l5	! %l5 = 0000000000000000

!	Check Point 30 for processor 0

	set	p0_check_pt_data_30,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 000000000000ffff
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 000000000000ffff
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 000000000000ffff
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 0000000000000000
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 00c94fffffff00ff
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 0000000000000000
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 0000000006fd1e1a
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 000000002a580000
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 864fc963 0b3a9e16
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x50],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 0b3a9e16 00000b00
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x58],%g3
	std	%f14,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f14 = ff000000 ffffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf14,%g1
	ldx	[%g4+0x60],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = 46a572ff 2a580000
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1

!	Check Point 30 completed


p0_label_151:
!	Mem[0000000010181410] = 0b3a9e16, %l1 = 000000000000ffff
	ldsba	[%i6+%o5]0x80,%l1	! %l1 = 000000000000000b
!	Mem[0000000030001400] = ccbe12ae, %l3 = 0000000000000000
	lduba	[%i0+%g0]0x89,%l3	! %l3 = 00000000000000ae
!	Mem[0000000010181400] = 169e3a0b, %l7 = 000000002a580000
	ldsba	[%i6+%g0]0x80,%l7	! %l7 = 0000000000000016
!	Mem[0000000021800180] = 15ff2200, %l5 = 0000000000000000
	lduha	[%o3+0x180]%asi,%l5	! %l5 = 00000000000015ff
!	Mem[0000000010181410] = 0b3a9e16, %l5 = 00000000000015ff
	ldsha	[%i6+%o5]0x80,%l5	! %l5 = 0000000000000b3a
!	Mem[0000000010101408] = ff000000, %f15 = ffffffff
	lda	[%i4+%o4]0x80,%f15	! %f15 = ff000000
!	Mem[0000000010041400] = ffffffff, %f3  = 169e3a0b
	lda	[%i1+%g0]0x88,%f3 	! %f3 = ffffffff
!	Mem[00000000100c1410] = 00000000, %l7 = 0000000000000016
	ldsba	[%i3+%o5]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000010141400] = 00ff007f00000000, %f6  = 0b3a9e16 00000b00
	ldda	[%i5+0x000]%asi,%f6 	! %f6  = 00ff007f 00000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010181428] = 000000ff, %l7 = 0000000000000000
	ldstuba	[%i6+0x028]%asi,%l7	! %l7 = 00000000000000ff

p0_label_152:
!	%f0  = 00000000 0000007f 00000000 ffffffff
!	%f4  = 864fc963 0b3a9e16 00ff007f 00000000
!	%f8  = dcfd2bef 3c3e5de6 aedfffff ff00006a
!	%f12 = 00000000 63c94f86 ff000000 ff000000
	stda	%f0,[%i5]ASI_BLK_S	! Block Store to 0000000030141400
!	%l2 = 000000000000ffff, Mem[0000000010101430] = c065f2b2
	stw	%l2,[%i4+0x030]		! Mem[0000000010101430] = 0000ffff
!	Mem[0000000030001410] = 00000b00, %l6 = 0000000006fd1e1a
	ldstuba	[%i0+%o5]0x81,%l6	! %l6 = 00000000000000ff
	membar	#Sync			! Added by membar checker (34)
!	%f16 = 0000007f 00000000 46a572ff 2a580000
!	%f20 = c9000000 ff000000 183170b9 00000000
!	%f24 = ff1efd06 ffffffff 00000000 ff000000
!	%f28 = 0000ffff ffffffff 000000a5 000000ff
	stda	%f16,[%i5]ASI_BLK_AIUSL	! Block Store to 0000000030141400
!	%l5 = 0000000000000b3a, Mem[0000000030041408] = 00000000
	stba	%l5,[%i1+%o4]0x89	! Mem[0000000030041408] = 0000003a
!	%l5 = 0000000000000b3a, Mem[0000000010081418] = 000000ff
	stb	%l5,[%i2+0x018]		! Mem[0000000010081418] = 3a0000ff
!	%l2 = 000000000000ffff, Mem[0000000010001410] = ffffffff
	stwa	%l2,[%i0+%o5]0x88	! Mem[0000000010001410] = 0000ffff
!	%l7 = 0000000000000000, Mem[0000000010081400] = 00ff00ff61000000
	stxa	%l7,[%i2+%g0]0x80	! Mem[0000000010081400] = 0000000000000000
	membar	#Sync			! Added by membar checker (35)
!	Mem[0000000010141408] = ff9e00002a580000, %l6 = 0000000000000000, %l6 = 0000000000000000
	add	%i5,0x08,%g1
	casxa	[%g1]0x80,%l6,%l6	! %l6 = ff9e00002a580000
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = 00000000, %l1 = 000000000000000b
	ldswa	[%i0+%o4]0x88,%l1	! %l1 = 0000000000000000

p0_label_153:
!	Mem[0000000010001400] = ff000000, %l2 = 000000000000ffff
	ldsha	[%i0+%g0]0x80,%l2	! %l2 = ffffffffffffff00
!	Mem[0000000030181400] = 1a1efd0600000000, %f6  = 00ff007f 00000000
	ldda	[%i6+%g0]0x89,%f6 	! %f6  = 1a1efd06 00000000
!	Mem[0000000010041410] = 00000000000000ae, %f28 = 0000ffff ffffffff
	ldda	[%i1+%o5]0x80,%f28	! %f28 = 00000000 000000ae
!	Mem[0000000030181410] = ff000000 000000ff, %l4 = ffff00ff, %l5 = 00000b3a
	ldda	[%i6+%o5]0x89,%l4	! %l4 = 00000000000000ff 00000000ff000000
!	Mem[0000000030181400] = 1a1efd0600000000, %f0  = 00000000 0000007f
	ldda	[%i6+%g0]0x89,%f0 	! %f0  = 1a1efd06 00000000
!	Mem[0000000010101400] = 0b3a9e16, %l3 = 00000000000000ae
	ldswa	[%i4+%g0]0x80,%l3	! %l3 = 000000000b3a9e16
!	Mem[0000000030181408] = dcfd2bef, %l2 = ffffffffffffff00
	lduba	[%i6+%o4]0x81,%l2	! %l2 = 00000000000000dc
!	Mem[0000000030141408] = 0000582a, %l6 = ff9e00002a580000
	lduha	[%i5+%o4]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000010001428] = 00000000, %l0 = 000000000000ffff
	ldsh	[%i0+0x02a],%l0		! %l0 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[00000000218000c0] = e8ff65e1, %l4 = 00000000000000ff
	ldstuba	[%o3+0x0c0]%asi,%l4	! %l4 = 000000e8000000ff

p0_label_154:
!	Mem[0000000030081408] = 00000000, %l7 = 0000000000000000
	swapa	[%i2+%o4]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000030141410] = ff000000, %l5 = 00000000ff000000
	ldstuba	[%i5+%o5]0x89,%l5	! %l5 = 00000000000000ff
!	%f22 = 183170b9 00000000, Mem[0000000030141410] = ff0000ff 000000c9
	stda	%f22,[%i5+%o5]0x81	! Mem[0000000030141410] = 183170b9 00000000
!	%l6 = 0000000000000000, Mem[0000000010181400] = 0b3a9e16
	stha	%l6,[%i6+%g0]0x88	! Mem[0000000010181400] = 0b3a0000
!	%f23 = 00000000, Mem[0000000010101410] = ffff00ff
	sta	%f23,[%i4+%o5]0x88	! Mem[0000000010101410] = 00000000
!	%l6 = 00000000, %l7 = 00000000, Mem[0000000030141400] = 00000000 7f000000
	stda	%l6,[%i5+%g0]0x81	! Mem[0000000030141400] = 00000000 00000000
!	Mem[00000000100c141c] = 00000071, %l3 = 000000000b3a9e16, %asi = 80
	swapa	[%i3+0x01c]%asi,%l3	! %l3 = 0000000000000071
!	%f29 = 000000ae, Mem[0000000030141400] = 00000000
	sta	%f29,[%i5+%g0]0x89	! Mem[0000000030141400] = 000000ae
!	%l2 = 00000000000000dc, Mem[000000001014141a] = 183170b9
	sth	%l2,[%i5+0x01a]		! Mem[0000000010141418] = 183100dc
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = 183170b9, %l6 = 0000000000000000
	lduwa	[%i5+%o5]0x81,%l6	! %l6 = 00000000183170b9

p0_label_155:
!	Mem[00000000300c1410] = ff72a546, %l5 = 0000000000000000
	ldsha	[%i3+%o5]0x81,%l5	! %l5 = ffffffffffffff72
!	Mem[00000000211c0000] = ffff7bbb, %l0 = 0000000000000000
	ldsh	[%o2+%g0],%l0		! %l0 = ffffffffffffffff
!	Mem[0000000010041410] = 00000000, %l2 = 00000000000000dc
	ldsha	[%i1+%o5]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000030041400] = 1a1efd06, %l1 = 0000000000000000
	ldsba	[%i1+%g0]0x81,%l1	! %l1 = 000000000000001a
!	Mem[0000000010141410] = c9000000, %l5 = ffffffffffffff72
	lduha	[%i5+%o5]0x80,%l5	! %l5 = 000000000000c900
!	Mem[0000000030101410] = 00000000, %l0 = ffffffffffffffff
	ldsba	[%i4+%o5]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000030101408] = ffdfffff, %l4 = 00000000000000e8
	ldswa	[%i4+%o4]0x81,%l4	! %l4 = ffffffffffdfffff
!	Mem[0000000010181418] = ff000000, %l1 = 000000000000001a
	ldsh	[%i6+0x01a],%l1		! %l1 = 0000000000000000
!	Mem[0000000010181410] = 0b3a9e16, %l1 = 0000000000000000
	lduwa	[%i6+%o5]0x80,%l1	! %l1 = 000000000b3a9e16
!	Starting 10 instruction Store Burst
!	%l4 = ffdfffff, %l5 = 0000c900, Mem[0000000030181408] = ef2bfddc 5fff0000
	stda	%l4,[%i6+%o4]0x89	! Mem[0000000030181408] = ffdfffff 0000c900

!	Check Point 31 for processor 0

	set	p0_check_pt_data_31,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 0000000000000000
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 000000000b3a9e16
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 0000000000000000
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 0000000000000071
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = ffffffffffdfffff
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 000000000000c900
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 00000000183170b9
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 0000000000000000
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = 1a1efd06 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x50],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = 00000000 ffffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x58],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 864fc963 0b3a9e16
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x60],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 1a1efd06 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x68],%g3
	std	%f14,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f14 = ff000000 ff000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf14,%g1
	ldx	[%g4+0x70],%g3
	std	%f28,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f28 = 00000000 000000ae
	bne	%xcc,p0_freg_check_fail
	mov	0xf28,%g1

!	Check Point 31 completed


p0_label_156:
!	%l1 = 000000000b3a9e16, Mem[0000000010081408] = ffff0000
	stba	%l1,[%i2+%o4]0x88	! Mem[0000000010081408] = ffff0016
!	%l2 = 0000000000000000, Mem[0000000030141408] = 2a580000
	stba	%l2,[%i5+%o4]0x89	! Mem[0000000030141408] = 2a580000
!	Mem[00000000218001c0] = e269397e, %l0 = 0000000000000000
	ldstub	[%o3+0x1c0],%l0		! %l0 = 000000e2000000ff
!	Mem[0000000010181410] = 0b3a9e16, %l1 = 000000000b3a9e16
	ldstuba	[%i6+%o5]0x80,%l1	! %l1 = 0000000b000000ff
!	%l2 = 0000000000000000, Mem[00000000100c1408] = ffff00ff
	stha	%l2,[%i3+%o4]0x88	! Mem[00000000100c1408] = ffff0000
!	%l2 = 0000000000000000, Mem[0000000030081400] = ae0000ff
	stwa	%l2,[%i2+%g0]0x89	! Mem[0000000030081400] = 00000000
!	%l4 = ffffffffffdfffff, Mem[0000000010181408] = 000000005fffffff
	stxa	%l4,[%i6+%o4]0x80	! Mem[0000000010181408] = ffffffffffdfffff
!	%l1 = 000000000000000b, Mem[0000000010141410] = c9000000ff000000
	stx	%l1,[%i5+%o5]		! Mem[0000000010141410] = 000000000000000b
!	%l0 = 000000e2, %l1 = 0000000b, Mem[0000000010041408] = e3500000 e3004689
	std	%l0,[%i1+%o4]		! Mem[0000000010041408] = 000000e2 0000000b
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = 0000ffff, %f16 = 0000007f
	lda	[%i0+%o5]0x88,%f16	! %f16 = 0000ffff

p0_label_157:
!	Mem[0000000010141408] = 0000582a00009eff, %f22 = 183170b9 00000000
	ldda	[%i5+%o4]0x88,%f22	! %f22 = 0000582a 00009eff
!	%l0 = 00000000000000e2, Mem[0000000010041438] = 6aabdc45, %asi = 80
	stba	%l0,[%i1+0x038]%asi	! Mem[0000000010041438] = e2abdc45
!	Mem[0000000010181400] = 864fc9630b3a0000, %l0 = 00000000000000e2
	ldxa	[%i6+%g0]0x88,%l0	! %l0 = 864fc9630b3a0000
!	Mem[0000000010001410] = ffffffff0000ffff, %f6  = 1a1efd06 00000000
	ldda	[%i0+%o5]0x88,%f6 	! %f6  = ffffffff 0000ffff
!	Mem[0000000010141420] = ff1efd06, %f28 = 00000000
	ld	[%i5+0x020],%f28	! %f28 = ff1efd06
!	Mem[0000000030081400] = 00000000, %l7 = 0000000000000000
	lduba	[%i2+%g0]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000010001400] = ff000000 63c94f86 00000000 0b3a9e16
!	Mem[0000000010001410] = ffff0000 ffffffff ccbe12ae ffffffff
!	Mem[0000000010001420] = e89e10b4 c05d49e5 00000000 00000063
!	Mem[0000000010001430] = 000000ff 00ae0000 a3002dba 00338900
	ldda	[%i0]ASI_BLK_P,%f0	! Block Load from 0000000010001400
!	Mem[00000000100c1408] = ffff0000, %l6 = 00000000183170b9
	ldswa	[%i3+%o4]0x88,%l6	! %l6 = ffffffffffff0000
!	Mem[0000000030141408] = 0000582a, %f28 = ff1efd06
	lda	[%i5+%o4]0x81,%f28	! %f28 = 0000582a
!	Starting 10 instruction Store Burst
!	%l1 = 000000000000000b, Mem[0000000030041400] = 06fd1e1a
	stba	%l1,[%i1+%g0]0x89	! Mem[0000000030041400] = 06fd1e0b

p0_label_158:
!	%f28 = 0000582a, Mem[00000000100c1408] = ffff0000
	sta	%f28,[%i3+%o4]0x88	! Mem[00000000100c1408] = 0000582a
!	%l5 = 000000000000c900, Mem[0000000010041410] = 00000000
	stba	%l5,[%i1+%o5]0x88	! Mem[0000000010041410] = 00000000
!	%f24 = ff1efd06 ffffffff, Mem[0000000030101400] = 000000ff 00000000
	stda	%f24,[%i4+%g0]0x89	! Mem[0000000030101400] = ff1efd06 ffffffff
!	%f27 = ff000000, Mem[0000000030041410] = 46a572a3
	sta	%f27,[%i1+%o5]0x89	! Mem[0000000030041410] = ff000000
!	%l7 = 0000000000000000, Mem[0000000010141400] = 00ff007f
	stha	%l7,[%i5+%g0]0x80	! Mem[0000000010141400] = 0000007f
!	%f26 = 00000000 ff000000, Mem[0000000010081408] = ffff0016 ffffffff
	stda	%f26,[%i2+%o4]0x88	! Mem[0000000010081408] = 00000000 ff000000
!	Mem[0000000010101400] = 169e3a0b, %l7 = 0000000000000000
	ldstuba	[%i4+%g0]0x88,%l7	! %l7 = 0000000b000000ff
!	%l0 = 864fc9630b3a0000, Mem[0000000010041418] = 000000ffff0000ff
	stx	%l0,[%i1+0x018]		! Mem[0000000010041418] = 864fc9630b3a0000
!	Mem[0000000010041400] = ffffffff, %l6 = ffffffffffff0000
	ldstuba	[%i1+%g0]0x88,%l6	! %l6 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = ffffdfffffffffff, %f20 = c9000000 ff000000
	ldda	[%i6+%o4]0x88,%f20	! %f20 = ffffdfff ffffffff

p0_label_159:
!	Mem[00000000300c1410] = ff72a546, %l4 = ffffffffffdfffff
	ldswa	[%i3+%o5]0x81,%l4	! %l4 = ffffffffff72a546
!	Mem[0000000010041400] = 169e3a0bffffffff, %l7 = 000000000000000b
	ldxa	[%i1+%g0]0x88,%l7	! %l7 = 169e3a0bffffffff
!	Mem[0000000030041408] = 0000003a, %l5 = 000000000000c900
	lduba	[%i1+%o4]0x89,%l5	! %l5 = 000000000000003a
!	Mem[0000000010041400] = ffffffff, %l7 = 169e3a0bffffffff
	ldswa	[%i1+%g0]0x80,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010181400] = 00003a0b, %l1 = 000000000000000b
	lduwa	[%i6+%g0]0x80,%l1	! %l1 = 0000000000003a0b
!	Mem[0000000010081408] = ff000000, %l5 = 000000000000003a
	lduha	[%i2+%o4]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000030081408] = 00000000000000ff, %f22 = 0000582a 00009eff
	ldda	[%i2+%o4]0x81,%f22	! %f22 = 00000000 000000ff
!	Mem[0000000030181410] = ff000000, %l7 = ffffffffffffffff
	lduwa	[%i6+%o5]0x81,%l7	! %l7 = 00000000ff000000
!	Mem[0000000010001400] = ff000000, %l1 = 0000000000003a0b
	ldsba	[%i0+%g0]0x80,%l1	! %l1 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%f29 = 000000ae, Mem[0000000010081410] = ffff0000
	sta	%f29,[%i2+%o5]0x80	! Mem[0000000010081410] = 000000ae

p0_label_160:
!	%l7 = 00000000ff000000, Mem[000000001010143d] = 0b3a9e16, %asi = 80
	stba	%l7,[%i4+0x03d]%asi	! Mem[000000001010143c] = 0b009e16
!	Mem[0000000030041400] = 06fd1e0b, %l7 = 00000000ff000000
	swapa	[%i1+%g0]0x89,%l7	! %l7 = 0000000006fd1e0b
!	%l7 = 0000000006fd1e0b, Mem[000000001008142c] = a192c190
	stw	%l7,[%i2+0x02c]		! Mem[000000001008142c] = 06fd1e0b
!	%l4 = ffffffffff72a546, Mem[0000000010141410] = 0b00000000000000
	stxa	%l4,[%i5+%o5]0x88	! Mem[0000000010141410] = ffffffffff72a546
!	Mem[00000000100c1400] = 00000000, %l2 = 0000000000000000
	ldstuba	[%i3+%g0]0x80,%l2	! %l2 = 00000000000000ff
!	%l2 = 0000000000000000, Mem[0000000010181410] = 169e3aff
	stba	%l2,[%i6+%o5]0x88	! Mem[0000000010181410] = 169e3a00
!	Mem[00000000100c140a] = 2a580000, %l6 = 00000000000000ff
	ldstub	[%i3+0x00a],%l6		! %l6 = 00000000000000ff
!	%l2 = 0000000000000000, Mem[00000000100c1410] = 0000000000000000
	stx	%l2,[%i3+%o5]		! Mem[00000000100c1410] = 0000000000000000
	membar	#Sync			! Added by membar checker (36)
!	%f18 = 46a572ff 2a580000, Mem[0000000010001408] = 00000000 169e3a0b
	stda	%f18,[%i0+%o4]0x88	! Mem[0000000010001408] = 46a572ff 2a580000
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = 1a1efd06 b2f265ff, %l2 = 00000000, %l3 = 00000071
	ldda	[%i3+%o4]0x89,%l2	! %l2 = 00000000b2f265ff 000000001a1efd06

!	Check Point 32 for processor 0

	set	p0_check_pt_data_32,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 864fc9630b3a0000
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = ffffffffffffffff
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 00000000b2f265ff
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l4,%g2			! %l4 = ffffffffff72a546
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l5,%g2			! %l5 = 0000000000000000
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l6,%g2			! %l6 = 0000000000000000
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l7,%g2			! %l7 = 0000000006fd1e0b
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x40],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = ff000000 63c94f86
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x48],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = 00000000 0b3a9e16
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x50],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = ffff0000 ffffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x58],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = ccbe12ae ffffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x60],%g3
	std	%f8,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f8 = e89e10b4 c05d49e5
	bne	%xcc,p0_freg_check_fail
	mov	0xf08,%g1
	ldx	[%g4+0x68],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = 00000000 00000063
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x70],%g3
	std	%f12,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f12 = 000000ff 00ae0000
	bne	%xcc,p0_freg_check_fail
	mov	0xf12,%g1
	ldx	[%g4+0x78],%g3
	std	%f14,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f14 = a3002dba 00338900
	bne	%xcc,p0_freg_check_fail
	mov	0xf14,%g1
	ldx	[%g4+0x80],%g3
	std	%f16,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f16 = 0000ffff 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf16,%g1
	ldx	[%g4+0x88],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = ffffdfff ffffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1
	ldx	[%g4+0x90],%g3
	std	%f22,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f22 = 00000000 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf22,%g1
	ldx	[%g4+0x98],%g3
	std	%f28,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f28 = 0000582a 000000ae
	bne	%xcc,p0_freg_check_fail
	mov	0xf28,%g1

!	Check Point 32 completed


p0_label_161:
!	Mem[0000000010001410] = ffffffff0000ffff, %l4 = ffffffffff72a546
	ldxa	[%i0+%o5]0x88,%l4	! %l4 = ffffffff0000ffff
!	Mem[0000000030181400] = 00000000, %l0 = 864fc9630b3a0000
	lduha	[%i6+%g0]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000030181408] = ffffdfff00c90000, %f28 = 0000582a 000000ae
	ldda	[%i6+%o4]0x81,%f28	! %f28 = ffffdfff 00c90000
!	Mem[0000000010041410] = 00000000 000000ae, %l0 = 00000000, %l1 = ffffffff
	ldda	[%i1+%o5]0x80,%l0	! %l0 = 0000000000000000 00000000000000ae
!	Mem[00000000300c1408] = b2f265ff, %l4 = ffffffff0000ffff
	lduba	[%i3+%o4]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010001414] = ffffffff, %l3 = 000000001a1efd06
	ldub	[%i0+0x017],%l3		! %l3 = 00000000000000ff
!	Mem[0000000010041400] = 169e3a0bffffffff, %l6 = 0000000000000000
	ldxa	[%i1+%g0]0x88,%l6	! %l6 = 169e3a0bffffffff
!	Mem[0000000010001400] = ff000000 63c94f86, %l2 = b2f265ff, %l3 = 000000ff
	ldda	[%i0+%g0]0x80,%l2	! %l2 = 00000000ff000000 0000000063c94f86
!	Mem[000000001014141c] = 00000000, %l4 = 00000000000000ff
	lduha	[%i5+0x01c]%asi,%l4	! %l4 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010041400] = ffffffff, %l3 = 0000000063c94f86
	swapa	[%i1+%g0]0x80,%l3	! %l3 = 00000000ffffffff

p0_label_162:
!	%l3 = 00000000ffffffff, Mem[0000000030001408] = beccffff
	stha	%l3,[%i0+%o4]0x81	! Mem[0000000030001408] = ffffffff
!	Code Fragment 4
p0_fragment_7:
!	%l0 = 0000000000000000
	setx	0x55daf5681f5baa64,%g7,%l0 ! %l0 = 55daf5681f5baa64
!	%l1 = 00000000000000ae
	setx	0xe0fe7f40144dbc52,%g7,%l1 ! %l1 = e0fe7f40144dbc52
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 55daf5681f5baa64
	setx	0xa7146c9877da1f96,%g7,%l0 ! %l0 = a7146c9877da1f96
!	%l1 = e0fe7f40144dbc52
	setx	0x0af51bd030490cc8,%g7,%l1 ! %l1 = 0af51bd030490cc8
!	Mem[0000000010181410] = 169e3a00, %l1 = 0af51bd030490cc8
	swapa	[%i6+%o5]0x88,%l1	! %l1 = 00000000169e3a00
!	%l0 = 77da1f96, %l1 = 169e3a00, Mem[0000000010101430] = 0000ffff 06fd1e1a
	stda	%l0,[%i4+0x030]%asi	! Mem[0000000010101430] = 77da1f96 169e3a00
!	%l6 = 169e3a0bffffffff, Mem[00000000300c1408] = ff65f2b2
	stba	%l6,[%i3+%o4]0x81	! Mem[00000000300c1408] = ff65f2b2
!	%f31 = 000000ff, Mem[0000000030001408] = ffffffff
	sta	%f31,[%i0+%o4]0x81	! Mem[0000000030001408] = 000000ff
!	Mem[0000000030001400] = ae12becc, %l7 = 0000000006fd1e0b
	swapa	[%i0+%g0]0x81,%l7	! %l7 = 00000000ae12becc
!	%l7 = 00000000ae12becc, Mem[0000000030001408] = 000000ff
	stba	%l7,[%i0+%o4]0x81	! Mem[0000000030001408] = cc0000ff
!	%l0 = a7146c9877da1f96, Mem[0000000010041400] = 63c94f86
	stwa	%l0,[%i1+%g0]0x80	! Mem[0000000010041400] = 77da1f96
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = 00000000, %l1 = 00000000169e3a00
	ldswa	[%i2+%g0]0x80,%l1	! %l1 = 0000000000000000

p0_label_163:
!	Mem[0000000010001410] = 0000ffff, %l6 = 169e3a0bffffffff
	ldswa	[%i0+%o5]0x88,%l6	! %l6 = 000000000000ffff
!	Mem[00000000211c0000] = ffff7bbb, %l4 = 0000000000000000
	ldsb	[%o2+%g0],%l4		! %l4 = ffffffffffffffff
!	Mem[0000000010041420] = 00005f06, %l7 = 00000000ae12becc
	ldswa	[%i1+0x020]%asi,%l7	! %l7 = 0000000000005f06
!	Mem[0000000030081410] = 0000003300000000, %f0  = ff000000 63c94f86
	ldda	[%i2+%o5]0x81,%f0 	! %f0  = 00000033 00000000
!	Mem[0000000010101410] = 00c94fff00000000, %f16 = 0000ffff 00000000
	ldda	[%i4+%o5]0x88,%f16	! %f16 = 00c94fff 00000000
!	Mem[0000000010101410] = 00000000, %l1 = 0000000000000000
	lduha	[%i4+%o5]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000030081410] = 0000003300000000, %f20 = ffffdfff ffffffff
	ldda	[%i2+%o5]0x81,%f20	! %f20 = 00000033 00000000
!	Mem[0000000010101420] = 00000033 a3002dba, %l6 = 0000ffff, %l7 = 00005f06
	ldda	[%i4+0x020]%asi,%l6	! %l6 = 0000000000000033 00000000a3002dba
!	Mem[0000000021800140] = 49280ea7, %l1 = 0000000000000000
	ldub	[%o3+0x140],%l1		! %l1 = 0000000000000049
!	Starting 10 instruction Store Burst
!	Mem[0000000030041400] = ff000000, %l6 = 0000000000000033
	ldstuba	[%i1+%g0]0x89,%l6	! %l6 = 00000000000000ff

p0_label_164:
!	%l6 = 00000000, %l7 = a3002dba, Mem[0000000010001410] = 0000ffff ffffffff
	stda	%l6,[%i0+%o5]0x88	! Mem[0000000010001410] = 00000000 a3002dba
!	%f4  = ffff0000 ffffffff, Mem[0000000030141410] = 183170b9 00000000
	stda	%f4 ,[%i5+%o5]0x81	! Mem[0000000030141410] = ffff0000 ffffffff
!	Mem[00000000211c0001] = ffff7bbb, %l3 = 00000000ffffffff
	ldstub	[%o2+0x001],%l3		! %l3 = 000000ff000000ff
!	Mem[0000000030181410] = 000000ff, %l0 = a7146c9877da1f96
	swapa	[%i6+%o5]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[000000001000140c] = ff72a546, %l3 = 00000000000000ff, %asi = 80
	swapa	[%i0+0x00c]%asi,%l3	! %l3 = 00000000ff72a546
!	%l7 = 00000000a3002dba, Mem[0000000010101400] = 169e3aff
	stwa	%l7,[%i4+%g0]0x88	! Mem[0000000010101400] = a3002dba
!	%l3 = 00000000ff72a546, Mem[0000000030081408] = ff00000000000000
	stxa	%l3,[%i2+%o4]0x89	! Mem[0000000030081408] = 00000000ff72a546
!	%l2 = 00000000ff000000, Mem[0000000030001408] = cc0000ff
	stha	%l2,[%i0+%o4]0x81	! Mem[0000000030001408] = 000000ff
!	Mem[0000000010081410] = 000000ae, %l3 = 00000000ff72a546
	ldstuba	[%i2+%o5]0x80,%l3	! %l3 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = ba2d00a300000000, %l5 = 0000000000000000
	ldxa	[%i4+%g0]0x80,%l5	! %l5 = ba2d00a300000000

p0_label_165:
!	Mem[0000000010181438] = a96e6a5a, %l0 = 00000000000000ff
	ldsba	[%i6+0x038]%asi,%l0	! %l0 = ffffffffffffffa9
!	Mem[0000000010081410] = ff0000ae, %l7 = 00000000a3002dba
	lduwa	[%i2+%o5]0x80,%l7	! %l7 = 00000000ff0000ae
!	Mem[0000000010001410] = a3002dba00000000, %f8  = e89e10b4 c05d49e5
	ldda	[%i0+%o5]0x88,%f8 	! %f8  = a3002dba 00000000
!	Mem[00000000201c0000] = ffffaf65, %l3 = 0000000000000000
	lduha	[%o0+0x000]%asi,%l3	! %l3 = 000000000000ffff
!	Mem[0000000030141400] = 000000ae, %l4 = ffffffffffffffff
	ldsba	[%i5+%g0]0x89,%l4	! %l4 = ffffffffffffffae
!	Mem[0000000030141410] = 0000ffff, %l3 = 000000000000ffff
	ldsba	[%i5+%o5]0x89,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010101408] = 000000ff, %l4 = ffffffffffffffae
	ldsba	[%i4+%o4]0x88,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010041400] = 961fda77, %l0 = ffffffffffffffa9
	ldswa	[%i1+%g0]0x88,%l0	! %l0 = ffffffff961fda77
!	Mem[0000000030081408] = 46a572ff 00000000, %l4 = ffffffff, %l5 = 00000000
	ldda	[%i2+%o4]0x81,%l4	! %l4 = 0000000046a572ff 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010081400] = 00000000, %l4 = 0000000046a572ff
	swapa	[%i2+%g0]0x80,%l4	! %l4 = 0000000000000000

!	Check Point 33 for processor 0

	set	p0_check_pt_data_33,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = ffffffff961fda77
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 0000000000000049
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l3,%g2			! %l3 = ffffffffffffffff
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l4,%g2			! %l4 = 0000000000000000
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l5,%g2			! %l5 = 0000000000000000
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l6,%g2			! %l6 = 0000000000000000
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l7,%g2			! %l7 = 00000000ff0000ae
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x40],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = 00000033 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x48],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = 00000000 0b3a9e16
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x50],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = ffff0000 ffffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x58],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = ccbe12ae ffffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x60],%g3
	std	%f8,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f8 = a3002dba 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf08,%g1
	ldx	[%g4+0x68],%g3
	std	%f16,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f16 = 00c94fff 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf16,%g1
	ldx	[%g4+0x70],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = 00000033 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1
	ldx	[%g4+0x78],%g3
	std	%f28,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f28 = ffffdfff 00c90000
	bne	%xcc,p0_freg_check_fail
	mov	0xf28,%g1

!	Check Point 33 completed


p0_label_166:
!	Mem[0000000010001400] = ff000000, %l5 = 0000000000000000
	swapa	[%i0+%g0]0x80,%l5	! %l5 = 00000000ff000000
!	%f25 = ffffffff, Mem[000000001000143c] = 00338900
	st	%f25,[%i0+0x03c]	! Mem[000000001000143c] = ffffffff
!	%l6 = 0000000000000000, Mem[0000000010101424] = a3002dba
	sth	%l6,[%i4+0x024]		! Mem[0000000010101424] = 00002dba
!	%l4 = 00000000, %l5 = ff000000, Mem[0000000030041408] = 3a000000 169e3a0b
	stda	%l4,[%i1+%o4]0x81	! Mem[0000000030041408] = 00000000 ff000000
!	%l2 = 00000000ff000000, Mem[000000001000140c] = 000000ff, %asi = 80
	stha	%l2,[%i0+0x00c]%asi	! Mem[000000001000140c] = 000000ff
!	Mem[0000000030141400] = ae000000, %l5 = 00000000ff000000
	swapa	[%i5+%g0]0x81,%l5	! %l5 = 00000000ae000000
!	%l5 = 00000000ae000000, %l2 = 00000000ff000000, %l6 = 0000000000000000
	or	%l5,%l2,%l6		! %l6 = 00000000ff000000
!	Mem[000000001014142c] = ff000000, %l5 = 00000000ae000000, %asi = 80
	swapa	[%i5+0x02c]%asi,%l5	! %l5 = 00000000ff000000
!	%l2 = 00000000ff000000, Mem[0000000010041438] = e2abdc45
	sth	%l2,[%i1+0x038]		! Mem[0000000010041438] = 0000dc45
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = ff1efd06 ffffffff, %l0 = 961fda77, %l1 = 00000049
	ldda	[%i4+%g0]0x89,%l0	! %l0 = 00000000ffffffff 00000000ff1efd06

p0_label_167:
!	Mem[0000000010041400] = 77da1f96 0b3a9e16, %l4 = 00000000, %l5 = ff000000
	ldda	[%i1+%g0]0x80,%l4	! %l4 = 0000000077da1f96 000000000b3a9e16
!	Mem[0000000010001410] = 00000000, %l0 = 00000000ffffffff
	lduwa	[%i0+%o5]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000010041408] = 000000e20000000b, %f20 = 00000033 00000000
	ldd	[%i1+%o4],%f20		! %f20 = 000000e2 0000000b
!	Mem[0000000030101408] = ffdfffff, %l4 = 0000000077da1f96
	ldsba	[%i4+%o4]0x81,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000030141410] = 0000ffff, %l2 = 00000000ff000000
	ldsha	[%i5+%o5]0x89,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000020800000] = 00007d94, %l0 = 0000000000000000
	ldsh	[%o1+%g0],%l0		! %l0 = 0000000000000000
!	Mem[0000000010141408] = ff9e0000, %l7 = 00000000ff0000ae
	ldsba	[%i5+%o4]0x80,%l7	! %l7 = ffffffffffffffff
!	Mem[00000000211c0000] = ffff7bbb, %l2 = ffffffffffffffff
	ldsba	[%o2+0x000]%asi,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000030141408] = 2a580000, %f1  = 00000000
	lda	[%i5+%o4]0x89,%f1 	! %f1 = 2a580000
!	Starting 10 instruction Store Burst
!	Mem[00000000100c142e] = 00000000, %l4 = ffffffffffffffff
	ldstuba	[%i3+0x02e]%asi,%l4	! %l4 = 00000000000000ff

p0_label_168:
!	%l7 = ffffffffffffffff, Mem[0000000030181410] = ff00000077da1f96
	stxa	%l7,[%i6+%o5]0x89	! Mem[0000000030181410] = ffffffffffffffff
!	Mem[0000000030181408] = ffdfffff, %l3 = ffffffffffffffff
	swapa	[%i6+%o4]0x89,%l3	! %l3 = 00000000ffdfffff
!	Mem[00000000100c1414] = 00000000, %l5 = 0b3a9e16, %l3 = ffdfffff
	add	%i3,0x14,%g1
	casa	[%g1]0x80,%l5,%l3	! %l3 = 0000000000000000
!	Mem[0000000010101408] = 000000ff, %l1 = 00000000ff1efd06
	ldstuba	[%i4+%o4]0x88,%l1	! %l1 = 000000ff000000ff
!	Mem[0000000010001424] = c05d49e5, %l6 = 00000000ff000000, %asi = 80
	swapa	[%i0+0x024]%asi,%l6	! %l6 = 00000000c05d49e5
!	%l7 = ffffffffffffffff, Mem[0000000010041413] = 00000000, %asi = 80
	stba	%l7,[%i1+0x013]%asi	! Mem[0000000010041410] = 000000ff
!	Mem[0000000010001410] = 00000000, %l6 = 00000000c05d49e5
	ldstuba	[%i0+%o5]0x80,%l6	! %l6 = 00000000000000ff
!	%l6 = 0000000000000000, Mem[000000001014141c] = 00000000, %asi = 80
	stba	%l6,[%i5+0x01c]%asi	! Mem[000000001014141c] = 00000000
!	%f22 = 00000000, Mem[0000000010041418] = 864fc963
	sta	%f22,[%i1+0x018]%asi	! Mem[0000000010041418] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = 0000582a, %l3 = 0000000000000000
	ldsha	[%i0+%o4]0x80,%l3	! %l3 = 0000000000000000

p0_label_169:
!	Mem[00000000100c1400] = ff00000000000000, %l5 = 000000000b3a9e16
	ldxa	[%i3+%g0]0x80,%l5	! %l5 = ff00000000000000
!	Mem[00000000100c1408] = 00ff582a, %l5 = ff00000000000000
	lduha	[%i3+%o4]0x88,%l5	! %l5 = 000000000000582a
!	Mem[00000000100c141c] = 0b3a9e16, %l0 = 0000000000000000
	ldub	[%i3+0x01d],%l0		! %l0 = 000000000000003a
!	Mem[0000000030081410] = 0000003300000000, %f26 = 00000000 ff000000
	ldda	[%i2+%o5]0x81,%f26	! %f26 = 00000033 00000000
!	Mem[0000000010101410] = 00000000, %l0 = 000000000000003a
	lduha	[%i4+%o5]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000030101400] = ffffffff, %l3 = 0000000000000000
	ldsha	[%i4+%g0]0x89,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000030101408] = 6a0000ffffffdfff, %f20 = 000000e2 0000000b
	ldda	[%i4+%o4]0x89,%f20	! %f20 = 6a0000ff ffffdfff
!	Mem[00000000100c1400] = ff000000, %l4 = 0000000000000000
	ldsba	[%i3+%g0]0x80,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010141408] = ff9e0000, %l2 = ffffffffffffffff
	lduwa	[%i5+%o4]0x80,%l2	! %l2 = 00000000ff9e0000
!	Starting 10 instruction Store Burst
!	%l0 = 00000000, %l1 = 000000ff, Mem[0000000010141410] = ff72a546 ffffffff
	stda	%l0,[%i5+%o5]0x88	! Mem[0000000010141410] = 00000000 000000ff

p0_label_170:
!	%l6 = 0000000000000000, Mem[0000000021800140] = 49280ea7
	sth	%l6,[%o3+0x140]		! Mem[0000000021800140] = 00000ea7
!	%l3 = ffffffffffffffff, Mem[00000000100c1410] = 00000000
	stwa	%l3,[%i3+%o5]0x80	! Mem[00000000100c1410] = ffffffff
!	%f4  = ffff0000 ffffffff, Mem[0000000010181410] = 30490cc8 169e3a0b
	stda	%f4 ,[%i6+%o5]0x88	! Mem[0000000010181410] = ffff0000 ffffffff
!	Mem[00000000201c0000] = ffffaf65, %l4 = ffffffffffffffff
	ldstuba	[%o0+0x000]%asi,%l4	! %l4 = 000000ff000000ff
!	%f20 = 6a0000ff, Mem[0000000010141410] = 00000000
	sta	%f20,[%i5+%o5]0x80	! Mem[0000000010141410] = 6a0000ff
!	Mem[0000000010181408] = ffffffff, %l6 = 0000000000000000
	ldstuba	[%i6+%o4]0x88,%l6	! %l6 = 000000ff000000ff
!	%l1 = 00000000000000ff, Mem[0000000030181408] = 0000c900ffffffff
	stxa	%l1,[%i6+%o4]0x89	! Mem[0000000030181408] = 00000000000000ff
!	%l4 = 00000000000000ff, Mem[0000000010041418] = 00000000, %asi = 80
	stwa	%l4,[%i1+0x018]%asi	! Mem[0000000010041418] = 000000ff
!	Mem[0000000010141400] = 7f000000, %l0 = 0000000000000000
	ldstuba	[%i5+%g0]0x88,%l0	! %l0 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1418] = 59755bee, %f21 = ffffdfff
	lda	[%i3+0x018]%asi,%f21	! %f21 = 59755bee

!	Check Point 34 for processor 0

	set	p0_check_pt_data_34,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 0000000000000000
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 00000000ff9e0000
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = ffffffffffffffff
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 000000000000582a
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = ffffffffffffffff
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = 00000033 2a580000
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x50],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = ffff0000 ffffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x58],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = 6a0000ff 59755bee
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1
	ldx	[%g4+0x60],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = 00000033 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1

!	Check Point 34 completed


p0_label_171:
!	Mem[00000000100c1430] = 00000000, %l6 = 00000000000000ff
	lduwa	[%i3+0x030]%asi,%l6	! %l6 = 0000000000000000
!	Mem[00000000100c1408] = 00ff582a, %l4 = 00000000000000ff
	lduba	[%i3+%o4]0x88,%l4	! %l4 = 000000000000002a
!	Mem[0000000010181438] = a96e6a5a, %l6 = 0000000000000000
	lduh	[%i6+0x038],%l6		! %l6 = 000000000000a96e
!	Mem[0000000010081410] = ff0000ae, %l4 = 000000000000002a
	lduwa	[%i2+%o5]0x80,%l4	! %l4 = 00000000ff0000ae
!	Mem[0000000030101400] = ffffffff, %l1 = 00000000000000ff
	ldswa	[%i4+%g0]0x89,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000020800040] = ffffac70, %l1 = ffffffffffffffff
	lduba	[%o1+0x040]%asi,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010141400] = ff00007f00000000, %l1 = 00000000000000ff
	ldxa	[%i5+%g0]0x80,%l1	! %l1 = ff00007f00000000
!	Mem[0000000010181400] = 864fc963 0b3a0000, %l4 = ff0000ae, %l5 = 0000582a
	ldda	[%i6+%g0]0x88,%l4	! %l4 = 000000000b3a0000 00000000864fc963
!	Mem[0000000030181400] = 00000000, %l2 = 00000000ff9e0000
	lduha	[%i6+%g0]0x81,%l2	! %l2 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000021800181] = 15ff2200, %l7 = ffffffffffffffff
	ldstub	[%o3+0x181],%l7		! %l7 = 000000ff000000ff

p0_label_172:
!	%f8  = a3002dba 00000000, Mem[0000000010101400] = ba2d00a3 00000000
	stda	%f8 ,[%i4+%g0]0x80	! Mem[0000000010101400] = a3002dba 00000000
!	%f10 = 00000000 00000063, Mem[0000000030081400] = 00000000 2a580000
	stda	%f10,[%i2+%g0]0x81	! Mem[0000000030081400] = 00000000 00000063
!	Mem[0000000010001430] = 000000ff, %l3 = ffffffff, %l0 = 00000000
	add	%i0,0x30,%g1
	casa	[%g1]0x80,%l3,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030101410] = 00000000, %l2 = 0000000000000000
	ldstuba	[%i4+%o5]0x81,%l2	! %l2 = 00000000000000ff
!	%l0 = 00000000000000ff, Mem[0000000030101410] = 000000ff
	stha	%l0,[%i4+%o5]0x89	! Mem[0000000030101410] = 000000ff
!	%l3 = ffffffffffffffff, Mem[0000000030001410] = ff000b00
	stwa	%l3,[%i0+%o5]0x81	! Mem[0000000030001410] = ffffffff
!	%l2 = 00000000, %l3 = ffffffff, Mem[0000000030001408] = 000000ff ffffffff
	stda	%l2,[%i0+%o4]0x81	! Mem[0000000030001408] = 00000000 ffffffff
!	%l4 = 0b3a0000, %l5 = 864fc963, Mem[00000000100c1410] = ffffffff 00000000
	stda	%l4,[%i3+%o5]0x80	! Mem[00000000100c1410] = 0b3a0000 864fc963
!	Mem[0000000030081408] = ff72a546, %l5 = 00000000864fc963
	ldstuba	[%i2+%o4]0x89,%l5	! %l5 = 00000046000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = ff00000000000000, %l6 = 000000000000a96e
	ldxa	[%i5+%g0]0x81,%l6	! %l6 = ff00000000000000

p0_label_173:
!	Mem[0000000010141410] = 000000ffff00006a, %l3 = ffffffffffffffff
	ldxa	[%i5+%o5]0x88,%l3	! %l3 = 000000ffff00006a
!	Mem[0000000010081430] = 000000ff00000046, %f26 = 00000033 00000000
	ldd	[%i2+0x030],%f26	! %f26 = 000000ff 00000046
!	Mem[00000000300c1410] = ff72a546, %l6 = ff00000000000000
	lduha	[%i3+%o5]0x81,%l6	! %l6 = 000000000000ff72
!	Mem[000000001000143c] = ffffffff, %l4 = 000000000b3a0000
	lduw	[%i0+0x03c],%l4		! %l4 = 00000000ffffffff
	membar	#Sync			! Added by membar checker (37)
!	Mem[0000000010141400] = ff00007f 00000000 ff9e0000 2a580000
!	Mem[0000000010141410] = 6a0000ff ff000000 183100dc 00000000
!	Mem[0000000010141420] = ff1efd06 ffffffff 00000000 ae000000
!	Mem[0000000010141430] = 0000ffff ffffffff 000000a5 000000ff
	ldda	[%i5]ASI_BLK_P,%f16	! Block Load from 0000000010141400
!	Mem[0000000010101400] = ba2d00a3, %l1 = ff00007f00000000
	lduwa	[%i4+%g0]0x88,%l1	! %l1 = 00000000ba2d00a3
!	Mem[0000000010181400] = 00003a0b63c94f86, %l3 = 000000ffff00006a
	ldxa	[%i6+%g0]0x80,%l3	! %l3 = 00003a0b63c94f86
!	Mem[0000000030081410] = 00000033, %l3 = 00003a0b63c94f86
	ldswa	[%i2+%o5]0x81,%l3	! %l3 = 0000000000000033
!	Mem[0000000030181408] = ff000000, %l3 = 0000000000000033
	lduha	[%i6+%o4]0x81,%l3	! %l3 = 000000000000ff00
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (38)
!	%f8  = a3002dba 00000000, %l0 = 00000000000000ff
!	Mem[0000000010141410] = 6a0000ffff000000
	add	%i5,0x010,%g1
	stda	%f8,[%g1+%l0]ASI_PST16_PL ! Mem[0000000010141410] = 00000000ba2d00a3

p0_label_174:
!	%f28 = 0000ffff ffffffff, Mem[0000000010181400] = 00003a0b 63c94f86
	stda	%f28,[%i6+%g0]0x80	! Mem[0000000010181400] = 0000ffff ffffffff
!	Mem[0000000030081410] = 33000000, %l3 = 000000000000ff00
	swapa	[%i2+%o5]0x89,%l3	! %l3 = 0000000033000000
!	%l6 = 0000ff72, %l7 = 000000ff, Mem[0000000010181428] = ff0000ff 1ea5b41d
	std	%l6,[%i6+0x028]		! Mem[0000000010181428] = 0000ff72 000000ff
!	Mem[0000000010181400] = ffff0000, %l6 = 000000000000ff72
	swapa	[%i6+%g0]0x88,%l6	! %l6 = 00000000ffff0000
!	Mem[00000000211c0001] = ffff7bbb, %l5 = 0000000000000046
	ldstub	[%o2+0x001],%l5		! %l5 = 000000ff000000ff
!	Mem[0000000010181410] = ffffffff, %l1 = 00000000ba2d00a3
	swapa	[%i6+%o5]0x80,%l1	! %l1 = 00000000ffffffff
!	Mem[0000000030181410] = ffffffff, %l4 = 00000000ffffffff
	ldstuba	[%i6+%o5]0x89,%l4	! %l4 = 000000ff000000ff
!	%f16 = ff00007f 00000000 ff9e0000 2a580000
!	%f20 = 6a0000ff ff000000 183100dc 00000000
!	%f24 = ff1efd06 ffffffff 00000000 ae000000
!	%f28 = 0000ffff ffffffff 000000a5 000000ff
	stda	%f16,[%i2]ASI_BLK_SL	! Block Store to 0000000030081400
!	%l7 = 00000000000000ff, Mem[0000000010001410] = ff000000
	stba	%l7,[%i0+%o5]0x80	! Mem[0000000010001410] = ff000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030001400] = 0b1efd06, %l5 = 00000000000000ff
	lduwa	[%i0+%g0]0x89,%l5	! %l5 = 000000000b1efd06

p0_label_175:
!	Mem[0000000030001408] = 00000000, %l1 = 00000000ffffffff
	lduba	[%i0+%o4]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000010041408] = e2000000, %l4 = 00000000000000ff
	ldsba	[%i1+%o4]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000030041400] = ff0000ff0000582a, %l0 = 00000000000000ff
	ldxa	[%i1+%g0]0x81,%l0	! %l0 = ff0000ff0000582a
!	Mem[0000000021800000] = 1a7bd0b4, %l7 = 00000000000000ff
	lduha	[%o3+0x000]%asi,%l7	! %l7 = 0000000000001a7b
!	Mem[0000000010041400] = 961fda77, %l1 = 0000000000000000
	lduba	[%i1+%g0]0x88,%l1	! %l1 = 0000000000000077
!	Mem[0000000010041408] = 000000e20000000b, %f8  = a3002dba 00000000
	ldda	[%i1+%o4]0x80,%f8 	! %f8  = 000000e2 0000000b
!	Mem[0000000010181410] = a3002dba, %l1 = 0000000000000077
	ldswa	[%i6+%o5]0x88,%l1	! %l1 = ffffffffa3002dba
!	Mem[0000000030001400] = 06fd1e0b, %l0 = ff0000ff0000582a
	ldsba	[%i0+%g0]0x81,%l0	! %l0 = 0000000000000006
!	Mem[0000000030041408] = 00000000, %f7  = ffffffff
	lda	[%i1+%o4]0x89,%f7 	! %f7 = 00000000
!	Starting 10 instruction Store Burst
!	%l3 = 0000000033000000, Mem[0000000010141400] = ff00007f
	stwa	%l3,[%i5+%g0]0x80	! Mem[0000000010141400] = 33000000

!	Check Point 35 for processor 0

	set	p0_check_pt_data_35,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 0000000000000006
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = ffffffffa3002dba
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 0000000000000000
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 0000000033000000
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 0000000000000000
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 000000000b1efd06
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 00000000ffff0000
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 0000000000001a7b
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = ffff0000 ffffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x50],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = ccbe12ae 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x58],%g3
	std	%f8,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f8 = 000000e2 0000000b
	bne	%xcc,p0_freg_check_fail
	mov	0xf08,%g1
	ldx	[%g4+0x60],%g3
	std	%f16,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f16 = ff00007f 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf16,%g1
	ldx	[%g4+0x68],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = ff9e0000 2a580000
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1
	ldx	[%g4+0x70],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = 6a0000ff ff000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1
	ldx	[%g4+0x78],%g3
	std	%f22,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f22 = 183100dc 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf22,%g1
	ldx	[%g4+0x80],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = ff1efd06 ffffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1
	ldx	[%g4+0x88],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = 00000000 ae000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1
	ldx	[%g4+0x90],%g3
	std	%f28,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f28 = 0000ffff ffffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf28,%g1
	ldx	[%g4+0x98],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = 000000a5 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 35 completed


p0_label_176:
!	Mem[0000000010141418] = 183100dc00000000, %l0 = 0000000000000006, %l1 = ffffffffa3002dba
	add	%i5,0x18,%g1
	casxa	[%g1]0x80,%l0,%l1	! %l1 = 183100dc00000000
!	%l7 = 0000000000001a7b, Mem[00000000300c1410] = 46a572ff
	stwa	%l7,[%i3+%o5]0x89	! Mem[00000000300c1410] = 00001a7b
!	%l4 = 0000000000000000, Mem[0000000030141408] = 2a580000
	stba	%l4,[%i5+%o4]0x89	! Mem[0000000030141408] = 2a580000
!	Mem[0000000010001400] = 00000000, %l2 = 0000000000000000
	ldstuba	[%i0+%g0]0x80,%l2	! %l2 = 00000000000000ff
!	Mem[00000000100c1428] = 183170b9, %l1 = 183100dc00000000
	ldstuba	[%i3+0x028]%asi,%l1	! %l1 = 00000018000000ff
!	Mem[0000000010101408] = 000000ff, %l0 = 0000000000000006
	swapa	[%i4+%o4]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010181410] = a3002dba, %l4 = 0000000000000000
	ldstuba	[%i6+%o5]0x88,%l4	! %l4 = 000000ba000000ff
!	Mem[0000000010181400] = 0000ff72, %l1 = 0000000000000018
	swapa	[%i6+%g0]0x88,%l1	! %l1 = 000000000000ff72
!	%l2 = 0000000000000000, Mem[00000000201c0000] = ffffaf65, %asi = 80
	stba	%l2,[%o0+0x000]%asi	! Mem[00000000201c0000] = 00ffaf65
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = 3300000000000000, %f28 = 0000ffff ffffffff
	ldda	[%i5+%g0]0x80,%f28	! %f28 = 33000000 00000000

p0_label_177:
	membar	#Sync			! Added by membar checker (39)
!	Mem[0000000030081400] = 00000000, %l1 = 000000000000ff72
	ldsha	[%i2+%g0]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000010041408] = 000000e20000000b, %l3 = 0000000033000000
	ldxa	[%i1+%o4]0x80,%l3	! %l3 = 000000e20000000b
!	Mem[00000000218000c0] = ffff65e1, %l4 = 00000000000000ba
	ldsba	[%o3+0x0c0]%asi,%l4	! %l4 = ffffffffffffffff
!	Mem[000000001000142c] = 00000063, %f7  = 00000000
	ld	[%i0+0x02c],%f7 	! %f7 = 00000063
!	Mem[0000000030041400] = ff0000ff, %l4 = ffffffffffffffff
	lduwa	[%i1+%g0]0x81,%l4	! %l4 = 00000000ff0000ff
!	Mem[0000000010101400] = a3002dba00000000, %f18 = ff9e0000 2a580000
	ldda	[%i4+%g0]0x80,%f18	! %f18 = a3002dba 00000000
!	Mem[0000000010141410] = 00000000, %l7 = 0000000000001a7b
	ldsha	[%i5+%o5]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000010041400] = 169e3a0b961fda77, %f0  = 00000033 2a580000
	ldda	[%i1+%g0]0x88,%f0 	! %f0  = 169e3a0b 961fda77
!	Mem[0000000030001410] = ffffffff, %l2 = 0000000000000000
	ldswa	[%i0+%o5]0x89,%l2	! %l2 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	Mem[0000000010101406] = 00000000, %l1 = 0000000000000000
	ldstuba	[%i4+0x006]%asi,%l1	! %l1 = 00000000000000ff

p0_label_178:
!	%l3 = 000000e20000000b, Mem[00000000300c1408] = b2f265ff
	stha	%l3,[%i3+%o4]0x89	! Mem[00000000300c1408] = b2f2000b
!	Mem[0000000020800041] = ffffac70, %l1 = 0000000000000000
	ldstub	[%o1+0x041],%l1		! %l1 = 000000ff000000ff
!	%l4 = 00000000ff0000ff, Mem[0000000010041408] = 000000e2, %asi = 80
	stha	%l4,[%i1+0x008]%asi	! Mem[0000000010041408] = 00ff00e2
!	Mem[0000000010101400] = ba2d00a3, %l2 = ffffffffffffffff
	swapa	[%i4+%g0]0x88,%l2	! %l2 = 00000000ba2d00a3
!	%l0 = 00000000000000ff, Mem[000000001014143c] = 000000ff, %asi = 80
	stwa	%l0,[%i5+0x03c]%asi	! Mem[000000001014143c] = 000000ff
!	%l0 = 000000ff, %l1 = 000000ff, Mem[0000000030081400] = 00000000 7f0000ff
	stda	%l0,[%i2+%g0]0x81	! Mem[0000000030081400] = 000000ff 000000ff
!	%f0  = 169e3a0b, Mem[0000000010181400] = 00000018
	sta	%f0 ,[%i6+%g0]0x88	! Mem[0000000010181400] = 169e3a0b
!	Mem[0000000030141400] = ff000000, %l7 = 0000000000000000
	ldstuba	[%i5+%g0]0x81,%l7	! %l7 = 000000ff000000ff
!	%l4 = 00000000ff0000ff, Mem[0000000010001400] = 000000ff
	stwa	%l4,[%i0+%g0]0x88	! Mem[0000000010001400] = ff0000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = 0000582a000000ff, %f8  = 000000e2 0000000b
	ldda	[%i0+%o4]0x80,%f8 	! %f8  = 0000582a 000000ff

p0_label_179:
!	Mem[0000000030141410] = 0000ffff, %l1 = 00000000000000ff
	ldsba	[%i5+%o5]0x89,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010041410] = 000000ff, %l0 = 00000000000000ff
	lduwa	[%i1+%o5]0x80,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030181410] = ffffffff, %l0 = 00000000000000ff
	ldsba	[%i6+%o5]0x81,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010181408] = ffffffff, %l3 = 000000e20000000b
	ldswa	[%i6+%o4]0x80,%l3	! %l3 = ffffffffffffffff
	membar	#Sync			! Added by membar checker (40)
!	Mem[0000000010181400] = 0b3a9e16 ffffffff ffffffff ffdfffff
!	Mem[0000000010181410] = ff2d00a3 0000ffff ff000000 000000c0
!	Mem[0000000010181420] = 1b61277f e46cbd64 0000ff72 000000ff
!	Mem[0000000010181430] = 00000000 00000000 a96e6a5a 864fc963
	ldda	[%i6]ASI_BLK_PL,%f0	! Block Load from 0000000010181400
!	Mem[0000000030081400] = 000000ff, %l2 = 00000000ba2d00a3
	lduwa	[%i2+%g0]0x81,%l2	! %l2 = 00000000000000ff
!	Mem[00000000300c1410] = 00001a7b, %l4 = 00000000ff0000ff
	lduha	[%i3+%o5]0x89,%l4	! %l4 = 0000000000001a7b
!	Mem[0000000010041408] = 00ff00e2 0000000b, %l0 = ffffffff, %l1 = ffffffff
	ldda	[%i1+%o4]0x80,%l0	! %l0 = 0000000000ff00e2 000000000000000b
!	Mem[0000000010081410] = ae0000ff, %l0 = 0000000000ff00e2
	ldsha	[%i2+%o5]0x88,%l0	! %l0 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l5 = 000000000b1efd06, Mem[0000000010081400] = 46a572ff
	stba	%l5,[%i2+%g0]0x80	! Mem[0000000010081400] = 06a572ff

p0_label_180:
!	%l2 = 00000000000000ff, Mem[00000000100c142e] = 0000ff00
	sth	%l2,[%i3+0x02e]		! Mem[00000000100c142c] = 000000ff
!	%f0  = ffffffff 169e3a0b ffffdfff ffffffff
!	%f4  = ffff0000 a3002dff c0000000 000000ff
!	%f8  = 64bd6ce4 7f27611b ff000000 72ff0000
!	%f12 = 00000000 00000000 63c94f86 5a6a6ea9
	stda	%f0,[%i5]ASI_BLK_PL	! Block Store to 0000000010141400
!	%l1 = 000000000000000b, Mem[0000000010001400] = ff0000ff
	stha	%l1,[%i0+%g0]0x88	! Mem[0000000010001400] = ff00000b
!	Mem[00000000300c1400] = 00000000, %l6 = 00000000ffff0000
	ldstuba	[%i3+%g0]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000021800101] = 00ffb49a, %l4 = 0000000000001a7b
	ldstuba	[%o3+0x101]%asi,%l4	! %l4 = 000000ff000000ff
!	%l3 = ffffffffffffffff, Mem[000000001014140c] = ffdfffff, %asi = 80
	stwa	%l3,[%i5+0x00c]%asi	! Mem[000000001014140c] = ffffffff
	membar	#Sync			! Added by membar checker (41)
!	Mem[0000000010141408] = ffffffff, %l3 = ffffffffffffffff
	ldstuba	[%i5+%o4]0x80,%l3	! %l3 = 000000ff000000ff
!	%l6 = 00000000, %l7 = 000000ff, Mem[0000000010041408] = 00ff00e2 0000000b
	stda	%l6,[%i1+0x008]%asi	! Mem[0000000010041408] = 00000000 000000ff
!	Mem[0000000030141408] = 2a580000, %l6 = 0000000000000000
	ldstuba	[%i5+%o4]0x89,%l6	! %l6 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = 2a580000, %l1 = 000000000000000b
	lduba	[%i2+%o4]0x89,%l1	! %l1 = 0000000000000000

!	Check Point 36 for processor 0

	set	p0_check_pt_data_36,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 0000000000000000
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l6,%g2			! %l6 = 0000000000000000
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l7,%g2			! %l7 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x40],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = ffffffff 169e3a0b
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x48],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = ffffdfff ffffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x50],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = ffff0000 a3002dff
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x58],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = c0000000 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x60],%g3
	std	%f8,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f8 = 64bd6ce4 7f27611b
	bne	%xcc,p0_freg_check_fail
	mov	0xf08,%g1
	ldx	[%g4+0x68],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = ff000000 72ff0000
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x70],%g3
	std	%f12,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f12 = 00000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf12,%g1
	ldx	[%g4+0x78],%g3
	std	%f14,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f14 = 63c94f86 5a6a6ea9
	bne	%xcc,p0_freg_check_fail
	mov	0xf14,%g1
	ldx	[%g4+0x80],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = a3002dba 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1
	ldx	[%g4+0x88],%g3
	std	%f28,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f28 = 33000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf28,%g1

!	Check Point 36 completed


p0_label_181:
!	Mem[0000000030101400] = ffffffff, %l0 = 00000000000000ff
	lduha	[%i4+%g0]0x89,%l0	! %l0 = 000000000000ffff
!	Mem[0000000010081430] = 000000ff, %l5 = 000000000b1efd06
	ldswa	[%i2+0x030]%asi,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010041428] = d56a83d006cd9827, %l6 = 0000000000000000
	ldxa	[%i1+0x028]%asi,%l6	! %l6 = d56a83d006cd9827
!	Mem[00000000300c1408] = 1a1efd06 b2f2000b, %l0 = 0000ffff, %l1 = 00000000
	ldda	[%i3+%o4]0x89,%l0	! %l0 = 00000000b2f2000b 000000001a1efd06
!	Mem[0000000010041410] = ae000000ff000000, %f18 = a3002dba 00000000
	ldda	[%i1+%o5]0x88,%f18	! %f18 = ae000000 ff000000
!	Mem[0000000010041400] = 169e3a0b961fda77, %l2 = 00000000000000ff
	ldxa	[%i1+%g0]0x88,%l2	! %l2 = 169e3a0b961fda77
!	Mem[0000000030081408] = 0000582a, %l0 = 00000000b2f2000b
	lduba	[%i2+%o4]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000030101410] = 000000ff000000ff, %l3 = 00000000000000ff
	ldxa	[%i4+%o5]0x89,%l3	! %l3 = 000000ff000000ff
!	Mem[0000000010081428] = b613094006fd1e0b, %f16 = ff00007f 00000000
	ldda	[%i2+0x028]%asi,%f16	! %f16 = b6130940 06fd1e0b
!	Starting 10 instruction Store Burst
!	Mem[00000000201c0000] = 00ffaf65, %l5 = 00000000000000ff
	lduh	[%o0+%g0],%l5		! %l5 = 00000000000000ff

p0_label_182:
!	Mem[0000000010041408] = 00000000, %l4 = 00000000000000ff
	swap	[%i1+%o4],%l4		! %l4 = 0000000000000000
!	%f25 = ffffffff, Mem[0000000030141408] = 2a5800ff
	sta	%f25,[%i5+%o4]0x89	! Mem[0000000030141408] = ffffffff
!	%l6 = d56a83d006cd9827, Mem[0000000030041400] = ff0000ff
	stha	%l6,[%i1+%g0]0x81	! Mem[0000000030041400] = 982700ff
!	Mem[0000000010001408] = 2a580000, %l7 = 00000000000000ff
	swapa	[%i0+%o4]0x88,%l7	! %l7 = 000000002a580000
!	Mem[0000000030141400] = ff000000, %l4 = 0000000000000000
	ldstuba	[%i5+%g0]0x81,%l4	! %l4 = 000000ff000000ff
!	Mem[0000000010081420] = 000000a5, %l5 = 000000ff, %l7 = 2a580000
	add	%i2,0x20,%g1
	casa	[%g1]0x80,%l5,%l7	! %l7 = 00000000000000a5
!	Mem[0000000010081400] = 06a572ff, %l1 = 000000001a1efd06
	swapa	[%i2+%g0]0x80,%l1	! %l1 = 0000000006a572ff
!	%l2 = 961fda77, %l3 = 000000ff, Mem[0000000010141410] = ff2d00a3 0000ffff
	stda	%l2,[%i5+%o5]0x80	! Mem[0000000010141410] = 961fda77 000000ff
!	Mem[0000000010101410] = 00000000, %l6 = d56a83d006cd9827
	swapa	[%i4+%o5]0x88,%l6	! %l6 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = 0b3a9e16ffffffff, %f28 = 33000000 00000000
	ldda	[%i5+%g0]0x80,%f28	! %f28 = 0b3a9e16 ffffffff

p0_label_183:
!	Mem[0000000030041410] = ff000000, %l6 = 0000000000000000
	ldsba	[%i1+%o5]0x89,%l6	! %l6 = 0000000000000000
!	Mem[00000000100c1410] = 0b3a0000, %l2 = 169e3a0b961fda77
	lduha	[%i3+%o5]0x80,%l2	! %l2 = 0000000000000b3a
!	Mem[0000000010001410] = ff000000ba2d00a3, %l6 = 0000000000000000
	ldxa	[%i0+%o5]0x80,%l6	! %l6 = ff000000ba2d00a3
!	Mem[0000000010141408] = ffffffff, %l2 = 0000000000000b3a
	lduba	[%i5+%o4]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030041410] = ff000000, %l3 = 000000ff000000ff
	ldsha	[%i1+%o5]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000030101410] = ff000000, %l3 = 0000000000000000
	lduba	[%i4+%o5]0x81,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010141414] = 000000ff, %f12 = 00000000
	ld	[%i5+0x014],%f12	! %f12 = 000000ff
!	Mem[0000000030141400] = 000000ff, %l3 = 00000000000000ff
	lduha	[%i5+%g0]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[00000000300c1408] = 0b00f2b2, %l6 = ff000000ba2d00a3
	ldsha	[%i3+%o4]0x81,%l6	! %l6 = 0000000000000b00
!	Starting 10 instruction Store Burst
!	Mem[0000000030001408] = 00000000, %l0 = 0000000000000000
	swapa	[%i0+%o4]0x81,%l0	! %l0 = 0000000000000000

p0_label_184:
!	%l2 = 00000000000000ff, Mem[0000000010081400] = 1a1efd06
	stha	%l2,[%i2+%g0]0x80	! Mem[0000000010081400] = 00fffd06
!	Mem[0000000030001410] = ffffffff, %l2 = 00000000000000ff
	ldstuba	[%i0+%o5]0x81,%l2	! %l2 = 000000ff000000ff
!	%l5 = 00000000000000ff, Mem[00000000100c1418] = 59755bee0b3a9e16, %asi = 80
	stxa	%l5,[%i3+0x018]%asi	! Mem[00000000100c1418] = 00000000000000ff
!	%f12 = 000000ff 00000000, Mem[0000000010081428] = b6130940 06fd1e0b
	std	%f12,[%i2+0x028]	! Mem[0000000010081428] = 000000ff 00000000
!	Mem[000000001018142c] = 000000ff, %l0 = 0000000000000000
	swap	[%i6+0x02c],%l0		! %l0 = 00000000000000ff
!	Mem[0000000010081412] = ff0000ae, %l7 = 00000000000000a5
	ldstub	[%i2+0x012],%l7		! %l7 = 00000000000000ff
!	%l2 = 000000ff, %l3 = 000000ff, Mem[0000000010181408] = ffffffff ffffdfff
	stda	%l2,[%i6+%o4]0x88	! Mem[0000000010181408] = 000000ff 000000ff
!	%l4 = 00000000000000ff, Mem[0000000030081400] = 000000ff
	stba	%l4,[%i2+%g0]0x81	! Mem[0000000030081400] = ff0000ff
!	%f9  = 7f27611b, Mem[0000000030101408] = ffdfffff
	sta	%f9 ,[%i4+%o4]0x81	! Mem[0000000030101408] = 7f27611b
!	Starting 10 instruction Load Burst
!	Mem[0000000030181410] = ffffffff, %l7 = 0000000000000000
	lduwa	[%i6+%o5]0x89,%l7	! %l7 = 00000000ffffffff

p0_label_185:
!	Mem[0000000010001428] = 00000000, %l1 = 0000000006a572ff
	lduwa	[%i0+0x028]%asi,%l1	! %l1 = 0000000000000000
!	Mem[0000000010081408] = 000000ff00000000, %l2 = 00000000000000ff
	ldxa	[%i2+%o4]0x80,%l2	! %l2 = 000000ff00000000
!	Mem[0000000030081408] = 2a580000, %l1 = 0000000000000000
	ldsha	[%i2+%o4]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000030101410] = ff000000, %l3 = 00000000000000ff
	ldsha	[%i4+%o5]0x81,%l3	! %l3 = ffffffffffffff00
!	Mem[0000000030141410] = ffff0000ffffffff, %f28 = 0b3a9e16 ffffffff
	ldda	[%i5+%o5]0x81,%f28	! %f28 = ffff0000 ffffffff
!	Mem[0000000010041424] = a3edf857, %l3 = ffffffffffffff00
	lduw	[%i1+0x024],%l3		! %l3 = 00000000a3edf857
!	Mem[0000000010001430] = 000000ff00ae0000, %l2 = 000000ff00000000
	ldx	[%i0+0x030],%l2		! %l2 = 000000ff00ae0000
!	Mem[0000000010041410] = ff000000, %l3 = 00000000a3edf857
	lduwa	[%i1+%o5]0x88,%l3	! %l3 = 00000000ff000000
!	Mem[0000000010041438] = 0000dc45, %l1 = 0000000000000000
	ldsba	[%i1+0x038]%asi,%l1	! %l1 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[000000001010140c] = 00000000, %l2 = 000000ff00ae0000
	ldstub	[%i4+0x00c],%l2		! %l2 = 00000000000000ff

!	Check Point 37 for processor 0

	set	p0_check_pt_data_37,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 0000000000000000
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 0000000000000000
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 00000000ff000000
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 0000000000000b00
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 00000000ffffffff
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = ffffffff 169e3a0b
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x50],%g3
	std	%f12,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f12 = 000000ff 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf12,%g1
	ldx	[%g4+0x58],%g3
	std	%f16,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f16 = b6130940 06fd1e0b
	bne	%xcc,p0_freg_check_fail
	mov	0xf16,%g1
	ldx	[%g4+0x60],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = ae000000 ff000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1
	ldx	[%g4+0x68],%g3
	std	%f28,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f28 = ffff0000 ffffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf28,%g1

!	Check Point 37 completed


p0_label_186:
!	%f2  = ffffdfff ffffffff, %l5 = 00000000000000ff
!	Mem[0000000030101408] = 7f27611bff00006a
	add	%i4,0x008,%g1
	stda	%f2,[%g1+%l5]ASI_PST32_S ! Mem[0000000030101408] = ffffdfffffffffff
!	%l7 = 00000000ffffffff, Mem[0000000010101400] = ffffffff
	stba	%l7,[%i4+%g0]0x80	! Mem[0000000010101400] = ffffffff
!	%l6 = 0000000000000b00, Mem[0000000010141420] = 1b61277f
	stw	%l6,[%i5+0x020]		! Mem[0000000010141420] = 00000b00
!	%l0 = 000000ff, %l1 = 00000000, Mem[0000000010041420] = 00005f06 a3edf857
	std	%l0,[%i1+0x020]		! Mem[0000000010041420] = 000000ff 00000000
!	%l5 = 00000000000000ff, Mem[0000000030101410] = 000000ff000000ff
	stxa	%l5,[%i4+%o5]0x89	! Mem[0000000030101410] = 00000000000000ff
!	%f16 = b6130940 06fd1e0b ae000000 ff000000
!	%f20 = 6a0000ff ff000000 183100dc 00000000
!	%f24 = ff1efd06 ffffffff 00000000 ae000000
!	%f28 = ffff0000 ffffffff 000000a5 000000ff
	stda	%f16,[%i3]ASI_BLK_PL	! Block Store to 00000000100c1400
!	%l5 = 00000000000000ff, Mem[0000000010141418] = ff000000000000c0, %asi = 80
	stxa	%l5,[%i5+0x018]%asi	! Mem[0000000010141418] = 00000000000000ff
!	%l0 = 00000000000000ff, Mem[0000000010001400] = 0b0000ff
	stba	%l0,[%i0+%g0]0x80	! Mem[0000000010001400] = ff0000ff
	membar	#Sync			! Added by membar checker (42)
!	Mem[00000000100c1400] = 0b1efd06, %l2 = 0000000000000000
	ldstuba	[%i3+%g0]0x80,%l2	! %l2 = 0000000b000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = ae000000ff000000, %l6 = 0000000000000b00
	ldxa	[%i3+%o4]0x88,%l6	! %l6 = ae000000ff000000

p0_label_187:
!	Mem[0000000010101408] = 06000000, %l5 = 00000000000000ff
	ldsha	[%i4+%o4]0x80,%l5	! %l5 = 0000000000000600
!	Mem[0000000030001400] = 06fd1e0bc3ae2ea1, %f20 = 6a0000ff ff000000
	ldda	[%i0+%g0]0x81,%f20	! %f20 = 06fd1e0b c3ae2ea1
!	Mem[0000000030181408] = ff000000, %l4 = 00000000000000ff
	lduba	[%i6+%o4]0x81,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010141400] = 0b3a9e16 ffffffff ffffffff ffffffff
!	Mem[0000000010141410] = 961fda77 000000ff 00000000 000000ff
!	Mem[0000000010141420] = 00000b00 e46cbd64 0000ff72 000000ff
!	Mem[0000000010141430] = 00000000 00000000 a96e6a5a 864fc963
	ldda	[%i5]ASI_BLK_AIUPL,%f0	! Block Load from 0000000010141400
!	Mem[0000000010101400] = 00ff0000 ffffffff, %l6 = ff000000, %l7 = ffffffff
	ldda	[%i4+%g0]0x88,%l6	! %l6 = 00000000ffffffff 0000000000ff0000
!	Mem[0000000030041400] = 982700ff, %l7 = 0000000000ff0000
	ldsha	[%i1+%g0]0x81,%l7	! %l7 = ffffffffffff9827
!	Mem[0000000010041400] = 77da1f960b3a9e16, %f20 = 06fd1e0b c3ae2ea1
	ldda	[%i1+%g0]0x80,%f20	! %f20 = 77da1f96 0b3a9e16
!	Mem[0000000030181400] = 00000000, %l2 = 000000000000000b
	lduwa	[%i6+%g0]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000030001408] = 00000000, %l6 = 00000000ffffffff
	ldsba	[%i0+%o4]0x81,%l6	! %l6 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f30 = 000000a5 000000ff, Mem[0000000030081400] = ff0000ff 000000ff
	stda	%f30,[%i2+%g0]0x81	! Mem[0000000030081400] = 000000a5 000000ff

p0_label_188:
!	%l1 = 0000000000000000, Mem[0000000010081408] = 000000ff00000000
	stxa	%l1,[%i2+%o4]0x80	! Mem[0000000010081408] = 0000000000000000
!	%f30 = 000000a5, Mem[00000000100c1434] = 0000ffff
	sta	%f30,[%i3+0x034]%asi	! Mem[00000000100c1434] = 000000a5
!	%f20 = 77da1f96 0b3a9e16, Mem[0000000010081438] = 69f5f861 3c3e5de6
	stda	%f20,[%i2+0x038]%asi	! Mem[0000000010081438] = 77da1f96 0b3a9e16
!	Mem[0000000030141408] = ffffffff, %l4 = 00000000000000ff
	ldstuba	[%i5+%o4]0x89,%l4	! %l4 = 000000ff000000ff
!	%f24 = ff1efd06 ffffffff, %l6 = 0000000000000000
!	Mem[0000000010101410] = 2798cd06ff4fc900
	add	%i4,0x010,%g1
	stda	%f24,[%g1+%l6]ASI_PST16_PL ! Mem[0000000010101410] = 2798cd06ff4fc900
!	%l6 = 0000000000000000, Mem[00000000211c0000] = ffff7bbb
	sth	%l6,[%o2+%g0]		! Mem[00000000211c0000] = 00007bbb
!	Mem[00000000300c1408] = b2f2000b, %l0 = 00000000000000ff
	swapa	[%i3+%o4]0x89,%l0	! %l0 = 00000000b2f2000b
!	Mem[00000000100c1410] = ff000000, %l4 = 00000000000000ff
	ldstuba	[%i3+%o5]0x88,%l4	! %l4 = 00000000000000ff
!	%f30 = 000000a5 000000ff, %l1 = 0000000000000000
!	Mem[0000000030001438] = ba9799e70b3a9e16
	add	%i0,0x038,%g1
	stda	%f30,[%g1+%l1]ASI_PST32_SL ! Mem[0000000030001438] = ba9799e70b3a9e16
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = 2798cd06, %l3 = 00000000ff000000
	ldsha	[%i4+%o5]0x80,%l3	! %l3 = 0000000000002798

p0_label_189:
!	Mem[0000000010081400] = 00fffd06, %l5 = 0000000000000600
	lduha	[%i2+%g0]0x80,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030101400] = ffffffff, %l1 = 0000000000000000
	lduba	[%i4+%g0]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010101410] = 2798cd06, %l0 = 00000000b2f2000b
	ldsha	[%i4+%o5]0x80,%l0	! %l0 = 0000000000002798
!	Mem[0000000030101410] = 00000000000000ff, %f30 = 000000a5 000000ff
	ldda	[%i4+%o5]0x89,%f30	! %f30 = 00000000 000000ff
!	Mem[00000000300c1400] = 000000ff, %l7 = ffffffffffff9827
	lduha	[%i3+%g0]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010081400] = 00fffd06, %l2 = 0000000000000000
	ldswa	[%i2+%g0]0x80,%l2	! %l2 = 0000000000fffd06
!	Mem[0000000030001408] = ffffffff00000000, %f20 = 77da1f96 0b3a9e16
	ldda	[%i0+%o4]0x89,%f20	! %f20 = ffffffff 00000000
!	Mem[0000000030101400] = ffffffff, %f29 = ffffffff
	lda	[%i4+%g0]0x89,%f29	! %f29 = ffffffff
!	Mem[0000000030181400] = 1a1efd0600000000, %l7 = 00000000000000ff
	ldxa	[%i6+%g0]0x89,%l7	! %l7 = 1a1efd0600000000
!	Starting 10 instruction Store Burst
!	%l3 = 0000000000002798, Mem[0000000030041410] = 000000ff0000007f
	stxa	%l3,[%i1+%o5]0x81	! Mem[0000000030041410] = 0000000000002798

p0_label_190:
!	%l2 = 00fffd06, %l3 = 00002798, Mem[0000000030141410] = 0000ffff ffffffff
	stda	%l2,[%i5+%o5]0x89	! Mem[0000000030141410] = 00fffd06 00002798
!	Mem[0000000020800001] = 00007d94, %l2 = 0000000000fffd06
	ldstub	[%o1+0x001],%l2		! %l2 = 00000000000000ff
!	Mem[00000000211c0001] = 00007bbb, %l5 = 00000000000000ff
	ldstuba	[%o2+0x001]%asi,%l5	! %l5 = 00000000000000ff
!	%l1 = 00000000000000ff, Mem[0000000030101408] = ffffdfffffffffff
	stxa	%l1,[%i4+%o4]0x81	! Mem[0000000030101408] = 00000000000000ff
!	%l0 = 0000000000002798, Mem[0000000030181410] = ffffffff
	stwa	%l0,[%i6+%o5]0x81	! Mem[0000000030181410] = 00002798
!	%l3 = 0000000000002798, Mem[0000000010081408] = 00000000
	stba	%l3,[%i2+%o4]0x80	! Mem[0000000010081408] = 98000000
!	%f21 = 00000000, Mem[0000000010101408] = 06000000
	sta	%f21,[%i4+%o4]0x80	! Mem[0000000010101408] = 00000000
!	%l2 = 0000000000000000, Mem[0000000010101408] = 00000000
	stha	%l2,[%i4+%o4]0x80	! Mem[0000000010101408] = 00000000
!	%l5 = 0000000000000000, Mem[0000000010081400] = 06fdff00
	stwa	%l5,[%i2+%g0]0x88	! Mem[0000000010081400] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1404] = 400913b6, %l4 = 0000000000000000
	lduh	[%i3+0x004],%l4		! %l4 = 0000000000004009

!	Check Point 38 for processor 0

	set	p0_check_pt_data_38,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 0000000000002798
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 0000000000000000
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 0000000000002798
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 0000000000004009
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 0000000000000000
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 0000000000000000
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 1a1efd0600000000
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = ffffffff 169e3a0b
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x50],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = ffffffff ffffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x58],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = ff000000 77da1f96
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x60],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = ff000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x68],%g3
	std	%f8,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f8 = 64bd6ce4 000b0000
	bne	%xcc,p0_freg_check_fail
	mov	0xf08,%g1
	ldx	[%g4+0x70],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = ff000000 72ff0000
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x78],%g3
	std	%f12,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f12 = 00000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf12,%g1
	ldx	[%g4+0x80],%g3
	std	%f14,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f14 = 63c94f86 5a6a6ea9
	bne	%xcc,p0_freg_check_fail
	mov	0xf14,%g1
	ldx	[%g4+0x88],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = ffffffff 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1
	ldx	[%g4+0x90],%g3
	std	%f28,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f28 = ffff0000 ffffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf28,%g1
	ldx	[%g4+0x98],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = 00000000 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 38 completed


p0_label_191:
!	Mem[0000000010181410] = a3002dff, %f14 = 63c94f86
	lda	[%i6+%o5]0x88,%f14	! %f14 = a3002dff
!	Mem[0000000010041410] = 000000ff 000000ae, %l6 = 00000000, %l7 = 00000000
	ldda	[%i1+%o5]0x80,%l6	! %l6 = 00000000000000ff 00000000000000ae
!	Mem[0000000010181408] = ff000000, %l2 = 0000000000000000
	ldsha	[%i6+%o4]0x80,%l2	! %l2 = ffffffffffffff00
!	Mem[0000000030001410] = ffffffff ff000000, %l6 = 000000ff, %l7 = 000000ae
	ldda	[%i0+%o5]0x81,%l6	! %l6 = 00000000ffffffff 00000000ff000000
!	Mem[0000000030101408] = 00000000000000ff, %f14 = a3002dff 5a6a6ea9
	ldda	[%i4+%o4]0x81,%f14	! %f14 = 00000000 000000ff
!	%f4  = ff000000 77da1f96, Mem[00000000300c1408] = ff000000 06fd1e1a
	stda	%f4 ,[%i3+%o4]0x81	! Mem[00000000300c1408] = ff000000 77da1f96
!	Mem[0000000010101400] = ffffffff0000ff00, %l5 = 0000000000000000
	ldxa	[%i4+%g0]0x80,%l5	! %l5 = ffffffff0000ff00
!	Mem[0000000030001410] = ffffffff ff000000, %l4 = 00004009, %l5 = 0000ff00
	ldda	[%i0+%o5]0x81,%l4	! %l4 = 00000000ffffffff 00000000ff000000
!	Mem[0000000030181400] = 00000000, %l7 = 00000000ff000000
	ldswa	[%i6+%g0]0x89,%l7	! %l7 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f2  = ffffffff ffffffff, Mem[0000000030181400] = 00000000 06fd1e1a
	stda	%f2 ,[%i6+%g0]0x81	! Mem[0000000030181400] = ffffffff ffffffff

p0_label_192:
!	%f16 = b6130940 06fd1e0b, %l4 = 00000000ffffffff
!	Mem[0000000030141410] = 06fdff0098270000
	add	%i5,0x010,%g1
	stda	%f16,[%g1+%l4]ASI_PST8_S ! Mem[0000000030141410] = b613094006fd1e0b
!	%l5 = 00000000ff000000, Mem[0000000010081410] = ff00ffae7f000000
	stxa	%l5,[%i2+%o5]0x80	! Mem[0000000010081410] = 00000000ff000000
!	Mem[0000000030081400] = 000000a5, %l2 = ffffffffffffff00
	swapa	[%i2+%g0]0x81,%l2	! %l2 = 00000000000000a5
!	%f18 = ae000000 ff000000, Mem[00000000300c1410] = 00001a7b 7f000000
	stda	%f18,[%i3+%o5]0x89	! Mem[00000000300c1410] = ae000000 ff000000
!	%l0 = 0000000000002798, Mem[0000000010101400] = ffffffff0000ff00
	stxa	%l0,[%i4+%g0]0x80	! Mem[0000000010101400] = 0000000000002798
!	Mem[0000000030081408] = 0000582a, %l7 = 0000000000000000
	ldstuba	[%i2+%o4]0x81,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010101410] = 2798cd06, %l4 = 00000000ffffffff
	swapa	[%i4+%o5]0x80,%l4	! %l4 = 000000002798cd06
!	%l0 = 0000000000002798, Mem[0000000030141408] = ffffffff
	stwa	%l0,[%i5+%o4]0x89	! Mem[0000000030141408] = 00002798
!	%l5 = 00000000ff000000, Mem[0000000010101410] = ffffffffff4fc900
	stxa	%l5,[%i4+%o5]0x80	! Mem[0000000010101410] = 00000000ff000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = 00000000, %f6  = ff000000
	lda	[%i2+%g0]0x88,%f6 	! %f6 = 00000000

p0_label_193:
!	Mem[00000000100c1400] = 06fd1eff, %l6 = 00000000ffffffff
	ldsba	[%i3+%g0]0x88,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010181410] = ff2d00a3, %l3 = 0000000000002798
	ldsha	[%i6+%o5]0x80,%l3	! %l3 = ffffffffffffff2d
!	Mem[0000000010001408] = ff000000, %l2 = 00000000000000a5
	lduwa	[%i0+%o4]0x80,%l2	! %l2 = 00000000ff000000
!	Mem[00000000100c1408] = 000000ff000000ae, %l2 = 00000000ff000000
	ldxa	[%i3+%o4]0x80,%l2	! %l2 = 000000ff000000ae
!	Mem[0000000010041400] = 77da1f96, %l5 = 00000000ff000000
	lduh	[%i1+%g0],%l5		! %l5 = 00000000000077da
!	Mem[0000000010101400] = 00000000, %l0 = 0000000000002798
	ldsha	[%i4+%g0]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000030181408] = ff00000000000000, %l7 = 0000000000000000
	ldxa	[%i6+%o4]0x81,%l7	! %l7 = ff00000000000000
!	Mem[0000000030181400] = ffffffffffffffff, %l4 = 000000002798cd06
	ldxa	[%i6+%g0]0x89,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010081410] = 00000000, %l4 = ffffffffffffffff
	lduba	[%i2+%o5]0x88,%l4	! %l4 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000000000, Mem[00000000100c1428] = 000000ae00000000, %asi = 80
	stxa	%l4,[%i3+0x028]%asi	! Mem[00000000100c1428] = 0000000000000000

p0_label_194:
!	%l1 = 00000000000000ff, Mem[0000000010081410] = 00000000ff000000
	stxa	%l1,[%i2+%o5]0x80	! Mem[0000000010081410] = 00000000000000ff
!	Mem[0000000010141406] = ffffffff, %l7 = ff00000000000000
	ldstub	[%i5+0x006],%l7		! %l7 = 000000ff000000ff
	membar	#Sync			! Added by membar checker (43)
!	%l4 = 00000000, %l5 = 000077da, Mem[0000000010141408] = ffffffff ffffffff
	stda	%l4,[%i5+%o4]0x88	! Mem[0000000010141408] = 00000000 000077da
!	%l4 = 0000000000000000, Mem[00000000300c1408] = ff000000
	stha	%l4,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00000000
!	Mem[0000000030041410] = 00000000, %l6 = ffffffffffffffff
	swapa	[%i1+%o5]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000010041400] = 961fda77, %l3 = ffffffffffffff2d
	swapa	[%i1+%g0]0x88,%l3	! %l3 = 00000000961fda77
!	Mem[00000000211c0001] = 00ff7bbb, %l6 = 0000000000000000
	ldstub	[%o2+0x001],%l6		! %l6 = 000000ff000000ff
!	%f20 = ffffffff 00000000, Mem[0000000010041408] = 000000ff 000000ff
	stda	%f20,[%i1+%o4]0x80	! Mem[0000000010041408] = ffffffff 00000000
!	%l1 = 00000000000000ff, Mem[0000000010041400] = 2dffffff, %asi = 80
	stwa	%l1,[%i1+0x000]%asi	! Mem[0000000010041400] = 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = 00000000 000000ff, %l6 = 000000ff, %l7 = 000000ff
	ldd	[%i2+%o5],%l6		! %l6 = 0000000000000000 00000000000000ff

p0_label_195:
!	Mem[00000000100c1410] = ff0000ff, %l4 = 0000000000000000
	lduha	[%i3+%o5]0x80,%l4	! %l4 = 000000000000ff00
!	Mem[0000000030041408] = 00000000, %l5 = 00000000000077da
	ldsba	[%i1+%o4]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000010141410] = ff000000 77da1f96, %l4 = 0000ff00, %l5 = 00000000
	ldda	[%i5+%o5]0x88,%l4	! %l4 = 0000000077da1f96 00000000ff000000
!	Mem[0000000010101400] = 0000000000002798, %f6  = 00000000 00000000
	ldda	[%i4+0x000]%asi,%f6 	! %f6  = 00000000 00002798
!	Mem[0000000010101408] = 00000000, %l7 = 00000000000000ff
	ldsba	[%i4+%o4]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000030041408] = 00000000, %l1 = 00000000000000ff
	lduba	[%i1+%o4]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000010141408] = 00000000, %l6 = 0000000000000000
	lduha	[%i5+%o4]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000010181410] = ff2d00a3, %l7 = 0000000000000000
	lduba	[%i6+%o5]0x80,%l7	! %l7 = 00000000000000ff
!	Mem[00000000218001c0] = ff69397e, %l7 = 00000000000000ff
	ldsb	[%o3+0x1c0],%l7		! %l7 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%f20 = ffffffff 00000000, Mem[00000000100c1438] = ff000000 a5000000
	std	%f20,[%i3+0x038]	! Mem[00000000100c1438] = ffffffff 00000000

!	Check Point 39 for processor 0

	set	p0_check_pt_data_39,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 0000000000000000
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 0000000000000000
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 000000ff000000ae
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 00000000961fda77
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 0000000077da1f96
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 00000000ff000000
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 0000000000000000
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = ffffffffffffffff
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = ff000000 77da1f96
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x50],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 00000000 00002798
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x58],%g3
	std	%f14,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f14 = 00000000 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf14,%g1

!	Check Point 39 completed


p0_label_196:
!	Mem[0000000020800000] = 00ff7d94, %l7 = ffffffffffffffff
	ldstuba	[%o1+0x000]%asi,%l7	! %l7 = 00000000000000ff
!	%f26 = 00000000 ae000000, Mem[0000000010141400] = 169e3a0b ffffffff
	stda	%f26,[%i5+%g0]0x88	! Mem[0000000010141400] = 00000000 ae000000
!	%l3 = 00000000961fda77, Mem[0000000010001410] = ff000000
	stha	%l3,[%i0+%o5]0x80	! Mem[0000000010001410] = da770000
!	Mem[0000000010001434] = 00ae0000, %l0 = 0000000000000000, %asi = 80
	swapa	[%i0+0x034]%asi,%l0	! %l0 = 0000000000ae0000
!	%l1 = 0000000000000000, Mem[0000000030181408] = ff000000
	stwa	%l1,[%i6+%o4]0x81	! Mem[0000000030181408] = 00000000
!	%f10 = ff000000 72ff0000, %l6 = 0000000000000000
!	Mem[0000000030141420] = ffffffff06fd1eff
	add	%i5,0x020,%g1
	stda	%f10,[%g1+%l6]ASI_PST8_S ! Mem[0000000030141420] = ffffffff06fd1eff
!	Mem[0000000030181410] = 00002798, %l7 = 0000000000000000
	swapa	[%i6+%o5]0x81,%l7	! %l7 = 0000000000002798
!	%l4 = 0000000077da1f96, Mem[00000000211c0001] = 00ff7bbb, %asi = 80
	stba	%l4,[%o2+0x001]%asi	! Mem[00000000211c0000] = 00967bbb
!	%l3 = 00000000961fda77, Mem[00000000100c141c] = dc003118, %asi = 80
	stha	%l3,[%i3+0x01c]%asi	! Mem[00000000100c141c] = da773118
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = 2a5800ff, %l4 = 0000000077da1f96
	lduwa	[%i2+%o4]0x89,%l4	! %l4 = 000000002a5800ff

p0_label_197:
!	Mem[00000000100c1408] = 000000ff, %l5 = 00000000ff000000
	lduha	[%i3+%o4]0x80,%l5	! %l5 = 0000000000000000
!	Mem[00000000211c0000] = 00967bbb, %l4 = 000000002a5800ff
	lduba	[%o2+0x001]%asi,%l4	! %l4 = 0000000000000096
!	Mem[00000000300c1400] = 000000ff, %f21 = 00000000
	lda	[%i3+%g0]0x89,%f21	! %f21 = 000000ff
!	Mem[0000000010081400] = 00000000, %l5 = 0000000000000000
	ldsha	[%i2+%g0]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000030081408] = 2a5800ff, %l0 = 0000000000ae0000
	lduha	[%i2+%o4]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010141430] = 00000000, %l3 = 00000000961fda77
	lduba	[%i5+0x030]%asi,%l3	! %l3 = 0000000000000000
!	Mem[0000000030081400] = ff000000 00ffffff, %l2 = 000000ae, %l3 = 00000000
	ldda	[%i2+%g0]0x89,%l2	! %l2 = 0000000000ffffff 00000000ff000000
!	Mem[00000000100c1408] = ae000000ff000000, %f4  = ff000000 77da1f96
	ldda	[%i3+%o4]0x88,%f4 	! %f4  = ae000000 ff000000
!	Mem[0000000030141408] = 98270000ff72a546, %l3 = 00000000ff000000
	ldxa	[%i5+%o4]0x81,%l3	! %l3 = 98270000ff72a546
!	Starting 10 instruction Store Burst
!	%l0 = 000000ff, %l1 = 00000000, Mem[0000000010081410] = 00000000 ff000000
	stda	%l0,[%i2+%o5]0x88	! Mem[0000000010081410] = 000000ff 00000000

p0_label_198:
!	Mem[00000000300c1408] = 00000000, %l1 = 0000000000000000
	swapa	[%i3+%o4]0x81,%l1	! %l1 = 0000000000000000
!	%l6 = 0000000000000000, Mem[0000000030141408] = 98270000
	stwa	%l6,[%i5+%o4]0x81	! Mem[0000000030141408] = 00000000
!	Mem[000000001008140c] = 00000000, %l6 = 0000000000000000, %asi = 80
	swapa	[%i2+0x00c]%asi,%l6	! %l6 = 0000000000000000
!	Mem[0000000030101410] = 000000ff, %l1 = 0000000000000000
	swapa	[%i4+%o5]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[00000000201c0000] = 00ffaf65, %l6 = 0000000000000000
	ldstuba	[%o0+0x000]%asi,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030001410] = ffffffff, %l3 = 98270000ff72a546
	ldstuba	[%i0+%o5]0x81,%l3	! %l3 = 000000ff000000ff
!	Mem[0000000010041400] = 000000ff, %l0 = 00000000000000ff
	ldstuba	[%i1+%g0]0x80,%l0	! %l0 = 00000000000000ff
!	Mem[00000000300c1400] = 000000ff, %l2 = 0000000000ffffff
	ldstuba	[%i3+%g0]0x89,%l2	! %l2 = 000000ff000000ff
!	Mem[00000000211c0000] = 00967bbb, %l0 = 0000000000000000
	ldstuba	[%o2+0x000]%asi,%l0	! %l0 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = 00000000, %l1 = 00000000000000ff
	lduwa	[%i4+%o4]0x89,%l1	! %l1 = 0000000000000000

p0_label_199:
!	Mem[0000000030141408] = 00000000, %l5 = 0000000000000000
	ldsba	[%i5+%o4]0x81,%l5	! %l5 = 0000000000000000
!	Mem[00000000100c1410] = 6a0000ffff0000ff, %l3 = 00000000000000ff
	ldxa	[%i3+%o5]0x88,%l3	! %l3 = 6a0000ffff0000ff
!	Mem[0000000010081408] = 98000000 00000000, %l2 = 000000ff, %l3 = ff0000ff
	ldda	[%i2+0x008]%asi,%l2	! %l2 = 0000000098000000 0000000000000000
!	Mem[0000000030141410] = b6130940, %l2 = 0000000098000000
	ldswa	[%i5+%o5]0x81,%l2	! %l2 = ffffffffb6130940
!	Mem[0000000010181408] = ff000000, %l5 = 0000000000000000
	ldswa	[%i6+%o4]0x80,%l5	! %l5 = ffffffffff000000
!	Mem[0000000030141410] = 0b1efd06400913b6, %l7 = 0000000000002798
	ldxa	[%i5+%o5]0x89,%l7	! %l7 = 0b1efd06400913b6
!	Mem[0000000010001418] = ccbe12ae, %l6 = 0000000000000000
	lduha	[%i0+0x01a]%asi,%l6	! %l6 = 00000000000012ae
!	Mem[0000000030001410] = ffffffff, %l6 = 00000000000012ae
	lduba	[%i0+%o5]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[000000001000141c] = ffffffff, %l5 = ffffffffff000000
	lduh	[%i0+0x01c],%l5		! %l5 = 000000000000ffff
!	Starting 10 instruction Store Burst
!	%l7 = 0b1efd06400913b6, Mem[0000000010001420] = e89e10b4, %asi = 80
	stwa	%l7,[%i0+0x020]%asi	! Mem[0000000010001420] = 400913b6

p0_label_200:
!	%l2 = ffffffffb6130940, Mem[0000000030041400] = ff002798
	stba	%l2,[%i1+%g0]0x89	! Mem[0000000030041400] = ff002740
!	Mem[0000000010181418] = ff000000000000c0, %l4 = 0000000000000096, %l0 = 0000000000000000
	add	%i6,0x18,%g1
	casxa	[%g1]0x80,%l4,%l0	! %l0 = ff000000000000c0
!	%l4 = 00000096, %l5 = 0000ffff, Mem[0000000010001428] = 00000000 00000063
	stda	%l4,[%i0+0x028]%asi	! Mem[0000000010001428] = 00000096 0000ffff
!	Mem[00000000300c1408] = 00000000, %l5 = 000000000000ffff
	swapa	[%i3+%o4]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000030181408] = 00000000 00000000, %l0 = 000000c0, %l1 = 00000000
	ldda	[%i6+%o4]0x81,%l0	! %l0 = 0000000000000000 0000000000000000
!	Mem[00000000100c1410] = ff0000ff, %l3 = 0000000000000000
	ldstuba	[%i3+%o5]0x80,%l3	! %l3 = 000000ff000000ff
!	Mem[0000000020800040] = ffffac70, %l5 = 0000000000000000
	ldstub	[%o1+0x040],%l5		! %l5 = 000000ff000000ff
!	Mem[0000000010181428] = 0000ff72, %l1 = 0000000000000000
	swap	[%i6+0x028],%l1		! %l1 = 000000000000ff72
!	%l7 = 0b1efd06400913b6, Mem[0000000010181422] = 1b61277f
	sth	%l7,[%i6+0x022]		! Mem[0000000010181420] = 1b6113b6
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = b613094006fd1e0b, %f22 = 183100dc 00000000
	ldda	[%i5+%o5]0x81,%f22	! %f22 = b6130940 06fd1e0b

!	Check Point 40 for processor 0

	set	p0_check_pt_data_40,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 0000000000000000
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 000000000000ff72
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = ffffffffb6130940
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 0000000000000096
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 0b1efd06400913b6
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = ffffffff 169e3a0b
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x50],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = ffffffff ffffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x58],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = ae000000 ff000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x60],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = ffffffff 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1
	ldx	[%g4+0x68],%g3
	std	%f22,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f22 = b6130940 06fd1e0b
	bne	%xcc,p0_freg_check_fail
	mov	0xf22,%g1

!	Check Point 40 completed


p0_label_201:
!	Mem[0000000030141410] = b6130940, %l4 = 0000000000000096
	lduba	[%i5+%o5]0x81,%l4	! %l4 = 00000000000000b6
	membar	#Sync			! Added by membar checker (44)
!	Mem[0000000010001400] = ff0000ff 63c94f86 ff000000 000000ff
!	Mem[0000000010001410] = da770000 ba2d00a3 ccbe12ae ffffffff
!	Mem[0000000010001420] = 400913b6 ff000000 00000096 0000ffff
!	Mem[0000000010001430] = 000000ff 00000000 a3002dba ffffffff
	ldda	[%i0]ASI_BLK_P,%f0	! Block Load from 0000000010001400
!	Mem[0000000021800040] = ff84b2d9, %l5 = 00000000000000ff
	ldsh	[%o3+0x040],%l5		! %l5 = ffffffffffffff84
!	Mem[00000000201c0000] = ffffaf65, %l5 = ffffffffffffff84
	ldsba	[%o0+0x000]%asi,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000030141400] = 000000ff, %l6 = 00000000000000ff
	ldsba	[%i5+%g0]0x89,%l6	! %l6 = ffffffffffffffff
!	%l1 = 000000000000ff72, %l2 = ffffffffb6130940, %l7 = 0b1efd06400913b6
	subc	%l1,%l2,%l7		! %l7 = 0000000049edf632
!	Mem[00000000100c140c] = 000000ae, %l6 = ffffffffffffffff
	ldsha	[%i3+0x00c]%asi,%l6	! %l6 = 0000000000000000
!	Mem[0000000010101408] = 000000ff 00000000, %l4 = 000000b6, %l5 = ffffffff
	ldda	[%i4+%o4]0x88,%l4	! %l4 = 0000000000000000 00000000000000ff
!	Mem[0000000010101400] = 98270000 00000000, %l0 = 00000000, %l1 = 0000ff72
	ldda	[%i4+%g0]0x88,%l0	! %l0 = 0000000000000000 0000000098270000
!	Starting 10 instruction Store Burst
!	Mem[0000000030081400] = ffffff00, %l1 = 0000000098270000
	ldstuba	[%i2+%g0]0x81,%l1	! %l1 = 000000ff000000ff

p0_label_202:
!	Mem[0000000030001410] = ffffffff, %l4 = 0000000000000000
	ldstuba	[%i0+%o5]0x89,%l4	! %l4 = 000000ff000000ff
!	%l7 = 0000000049edf632, Mem[0000000010041400] = ff0000ff
	stwa	%l7,[%i1+%g0]0x80	! Mem[0000000010041400] = 49edf632
!	%f24 = ff1efd06 ffffffff, Mem[0000000030041400] = 402700ff 0000582a
	stda	%f24,[%i1+%g0]0x81	! Mem[0000000030041400] = ff1efd06 ffffffff
!	%f30 = 00000000 000000ff, %l6 = 0000000000000000
!	Mem[00000000300c1438] = ea80797bdcfd2bef
	add	%i3,0x038,%g1
	stda	%f30,[%g1+%l6]ASI_PST8_S ! Mem[00000000300c1438] = ea80797bdcfd2bef
!	Mem[000000001014143f] = 864fc963, %l5 = 00000000000000ff
	ldstub	[%i5+0x03f],%l5		! %l5 = 00000063000000ff
!	Mem[00000000100c1400] = ff1efd06, %l1 = 00000000000000ff
	ldstuba	[%i3+%g0]0x80,%l1	! %l1 = 000000ff000000ff
!	%l5 = 0000000000000063, Mem[0000000010081410] = ff000000
	stha	%l5,[%i2+%o5]0x80	! Mem[0000000010081410] = 00630000
!	Mem[0000000010081428] = 000000ff00000000, %l0 = 0000000000000000, %l4 = 00000000000000ff
	add	%i2,0x28,%g1
	casxa	[%g1]0x80,%l0,%l4	! %l4 = 000000ff00000000
!	Mem[0000000030101408] = 00000000, %l5 = 0000000000000063
	ldstuba	[%i4+%o4]0x81,%l5	! %l5 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = ff000000, %l2 = ffffffffb6130940
	ldswa	[%i4+%o4]0x81,%l2	! %l2 = ffffffffff000000

p0_label_203:
!	Mem[000000001010143c] = 0b009e16, %l6 = 0000000000000000
	lduha	[%i4+0x03e]%asi,%l6	! %l6 = 0000000000009e16
!	Mem[0000000030181400] = ffffffff ffffffff, %l0 = 00000000, %l1 = 000000ff
	ldda	[%i6+%g0]0x89,%l0	! %l0 = 00000000ffffffff 00000000ffffffff
!	Mem[0000000010101400] = 9827000000000000, %f26 = 00000000 ae000000
	ldda	[%i4+%g0]0x88,%f26	! %f26 = 98270000 00000000
!	Mem[0000000010141420] = 00000b00e46cbd64, %f22 = b6130940 06fd1e0b
	ldda	[%i5+0x020]%asi,%f22	! %f22 = 00000b00 e46cbd64
!	Mem[0000000010141410] = 961fda77, %l5 = 0000000000000000
	ldsha	[%i5+%o5]0x80,%l5	! %l5 = ffffffffffff961f
!	Mem[0000000030001410] = ffffffff, %l0 = 00000000ffffffff
	ldsha	[%i0+%o5]0x81,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010141410] = 961fda77000000ff, %l7 = 0000000049edf632
	ldxa	[%i5+%o5]0x80,%l7	! %l7 = 961fda77000000ff
!	Mem[00000000100c1408] = 000000ff, %l2 = ffffffffff000000
	lduba	[%i3+%o4]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000010181400] = 169e3a0b, %l6 = 0000000000009e16
	ldsha	[%i6+%g0]0x88,%l6	! %l6 = 0000000000003a0b
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1400] = ff000000, %l5 = ffffffffffff961f
	ldstuba	[%i3+%g0]0x81,%l5	! %l5 = 000000ff000000ff

p0_label_204:
!	Mem[0000000010081424] = 0000ffff, %l7 = 000000ff, %l3 = 000000ff
	add	%i2,0x24,%g1
	casa	[%g1]0x80,%l7,%l3	! %l3 = 000000000000ffff
!	%l6 = 0000000000003a0b, Mem[0000000030041408] = 000000ff00000000
	stxa	%l6,[%i1+%o4]0x89	! Mem[0000000030041408] = 0000000000003a0b
!	%f18 = ae000000, Mem[0000000010181408] = 000000ff
	sta	%f18,[%i6+%o4]0x88	! Mem[0000000010181408] = ae000000
	membar	#Sync			! Added by membar checker (45)
!	%l6 = 0000000000003a0b, Mem[0000000010001410] = 000077da
	stwa	%l6,[%i0+%o5]0x88	! Mem[0000000010001410] = 00003a0b
!	%f6  = ccbe12ae, Mem[0000000010041410] = ff000000
	sta	%f6 ,[%i1+%o5]0x88	! Mem[0000000010041410] = ccbe12ae
!	%l4 = 00000000, %l5 = 000000ff, Mem[0000000030181410] = 00000000 ffffffff
	stda	%l4,[%i6+%o5]0x81	! Mem[0000000030181410] = 00000000 000000ff
!	Mem[000000001004143c] = 183170b9, %l0 = ffffffff, %l5 = 000000ff
	add	%i1,0x3c,%g1
	casa	[%g1]0x80,%l0,%l5	! %l5 = 00000000183170b9
!	%l1 = 00000000ffffffff, Mem[0000000010181400] = 0b3a9e16
	stw	%l1,[%i6+%g0]		! Mem[0000000010181400] = ffffffff
!	%l6 = 0000000000003a0b, Mem[0000000030181408] = 00000000
	stba	%l6,[%i6+%o4]0x89	! Mem[0000000030181408] = 0000000b
!	Starting 10 instruction Load Burst
!	Mem[0000000010041438] = 0000dc45183170b9, %l2 = 0000000000000000
	ldx	[%i1+0x038],%l2		! %l2 = 0000dc45183170b9

p0_label_205:
!	Mem[00000000100c1400] = 06fd1eff, %l3 = 000000000000ffff
	lduwa	[%i3+%g0]0x88,%l3	! %l3 = 0000000006fd1eff
!	Mem[0000000010041408] = ffffffff, %l6 = 0000000000003a0b
	ldub	[%i1+0x00b],%l6		! %l6 = 00000000000000ff
!	Mem[0000000010181410] = ff2d00a3, %l0 = ffffffffffffffff
	lduha	[%i6+0x010]%asi,%l0	! %l0 = 000000000000ff2d
!	Mem[0000000010101434] = 169e3a00, %l1 = 00000000ffffffff
	lduwa	[%i4+0x034]%asi,%l1	! %l1 = 00000000169e3a00
!	Mem[0000000030001408] = 00000000, %f30 = 00000000
	lda	[%i0+%o4]0x89,%f30	! %f30 = 00000000
!	Mem[0000000030081408] = 2a5800ff, %l5 = 00000000183170b9
	ldswa	[%i2+%o4]0x89,%l5	! %l5 = 000000002a5800ff
!	Mem[0000000010101410] = 00000000, %l0 = 000000000000ff2d
	lduba	[%i4+%o5]0x88,%l0	! %l0 = 0000000000000000
!	Mem[00000000100c1400] = 06fd1eff, %l5 = 000000002a5800ff
	lduwa	[%i3+%g0]0x88,%l5	! %l5 = 0000000006fd1eff
!	Mem[00000000100c1410] = ff0000ff, %l6 = 00000000000000ff
	ldsba	[%i3+%o5]0x80,%l6	! %l6 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l4 = 00000000, %l5 = 06fd1eff, Mem[00000000100c1410] = ff0000ff ff00006a
	stda	%l4,[%i3+%o5]0x80	! Mem[00000000100c1410] = 00000000 06fd1eff

!	Check Point 41 for processor 0

	set	p0_check_pt_data_41,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 0000000000000000
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 00000000169e3a00
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 0000dc45183170b9
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 0000000006fd1eff
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 000000ff00000000
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 0000000006fd1eff
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = ffffffffffffffff
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 961fda77000000ff
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = ff0000ff 63c94f86
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x50],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = ff000000 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x58],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = da770000 ba2d00a3
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x60],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = ccbe12ae ffffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x68],%g3
	std	%f8,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f8 = 400913b6 ff000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf08,%g1
	ldx	[%g4+0x70],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = 00000096 0000ffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x78],%g3
	std	%f12,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f12 = 000000ff 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf12,%g1
	ldx	[%g4+0x80],%g3
	std	%f14,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f14 = a3002dba ffffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf14,%g1
	ldx	[%g4+0x88],%g3
	std	%f22,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f22 = 00000b00 e46cbd64
	bne	%xcc,p0_freg_check_fail
	mov	0xf22,%g1
	ldx	[%g4+0x90],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = 98270000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1
	ldx	[%g4+0x98],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = 00000000 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 41 completed


p0_label_206:
!	%f4  = da770000 ba2d00a3, %l6 = ffffffffffffffff
!	Mem[0000000010181420] = 1b6113b6e46cbd64
	add	%i6,0x020,%g1
	stda	%f4,[%g1+%l6]ASI_PST8_PL ! Mem[0000000010181420] = a3002dba000077da
!	%l3 = 0000000006fd1eff, Mem[00000000300c1408] = ffff0000
	stwa	%l3,[%i3+%o4]0x89	! Mem[00000000300c1408] = 06fd1eff
!	%f0  = ff0000ff 63c94f86 ff000000 000000ff
!	%f4  = da770000 ba2d00a3 ccbe12ae ffffffff
!	%f8  = 400913b6 ff000000 00000096 0000ffff
!	%f12 = 000000ff 00000000 a3002dba ffffffff
	stda	%f0,[%i4]ASI_COMMIT_S	! Block Store to 0000000030101400
!	Mem[0000000030001410] = ffffffff, %l1 = 00000000169e3a00
	ldstuba	[%i0+%o5]0x81,%l1	! %l1 = 000000ff000000ff
!	Mem[0000000010181410] = a3002dff, %l2 = 0000dc45183170b9
	swapa	[%i6+%o5]0x88,%l2	! %l2 = 00000000a3002dff
!	%l3 = 0000000006fd1eff, Mem[0000000021800040] = ff84b2d9, %asi = 80
	stha	%l3,[%o3+0x040]%asi	! Mem[0000000021800040] = 1effb2d9
!	%f28 = ffff0000 ffffffff, Mem[00000000100c1418] = 00000000 da773118
	stda	%f28,[%i3+0x018]%asi	! Mem[00000000100c1418] = ffff0000 ffffffff
!	Mem[00000000100c1408] = 000000ff, %l5 = 0000000006fd1eff
	swapa	[%i3+%o4]0x80,%l5	! %l5 = 00000000000000ff
!	%l4 = 00000000, %l5 = 000000ff, Mem[0000000010001400] = ff0000ff 63c94f86
	std	%l4,[%i0+%g0]		! Mem[0000000010001400] = 00000000 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = ffffffff00000000, %l1 = 00000000000000ff
	ldxa	[%i1+%o4]0x80,%l1	! %l1 = ffffffff00000000

p0_label_207:
!	Mem[0000000010141408] = 00000000, %l2 = 00000000a3002dff
	ldswa	[%i5+%o4]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000020800000] = ffff7d94, %l5 = 00000000000000ff
	ldsb	[%o1+0x001],%l5		! %l5 = ffffffffffffffff
	membar	#Sync			! Added by membar checker (46)
!	Mem[0000000010101424] = 00002dba, %l1 = ffffffff00000000
	lduba	[%i4+0x025]%asi,%l1	! %l1 = 0000000000000000
!	Mem[00000000100c1420] = ffffffff06fd1eff, %l3 = 0000000006fd1eff
	ldx	[%i3+0x020],%l3		! %l3 = ffffffff06fd1eff
!	Mem[0000000030041410] = ffffffff, %l4 = 000000ff00000000
	lduba	[%i1+%o5]0x81,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030181400] = ffffffff, %l7 = 961fda77000000ff
	ldsba	[%i6+%g0]0x89,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010001408] = 000000ff, %l6 = ffffffffffffffff
	ldswa	[%i0+%o4]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030181408] = 0000000b, %l3 = ffffffff06fd1eff
	ldsba	[%i6+%o4]0x89,%l3	! %l3 = 000000000000000b
!	Mem[0000000030101410] = da770000ba2d00a3, %f22 = 00000b00 e46cbd64
	ldda	[%i4+%o5]0x81,%f22	! %f22 = da770000 ba2d00a3
!	Starting 10 instruction Store Burst
!	Mem[0000000030001408] = 00000000, %l5 = ffffffffffffffff
	ldstuba	[%i0+%o4]0x81,%l5	! %l5 = 00000000000000ff

p0_label_208:
!	%l5 = 0000000000000000, Mem[0000000030181400] = ffffffffffffffff
	stxa	%l5,[%i6+%g0]0x89	! Mem[0000000030181400] = 0000000000000000
!	%f4  = da770000 ba2d00a3, %l1 = 0000000000000000
!	Mem[0000000010181410] = b97031180000ffff
	add	%i6,0x010,%g1
	stda	%f4,[%g1+%l1]ASI_PST16_PL ! Mem[0000000010181410] = b97031180000ffff
!	Mem[0000000010141400] = ae000000, %l6 = 00000000000000ff
	ldstuba	[%i5+%g0]0x88,%l6	! %l6 = 00000000000000ff
!	%l1 = 0000000000000000, Mem[0000000010001405] = 000000ff
	stb	%l1,[%i0+0x005]		! Mem[0000000010001404] = 000000ff
!	Mem[0000000010101428] = 1db4a5ff, %l2 = 0000000000000000
	swap	[%i4+0x028],%l2		! %l2 = 000000001db4a5ff
!	%f6  = ccbe12ae ffffffff, %l5 = 0000000000000000
!	Mem[0000000030001408] = ff000000ffffffff
	add	%i0,0x008,%g1
	stda	%f6,[%g1+%l5]ASI_PST16_S ! Mem[0000000030001408] = ff000000ffffffff
!	%f22 = da770000 ba2d00a3, %l2 = 000000001db4a5ff
!	Mem[0000000010001428] = 000000960000ffff
	add	%i0,0x028,%g1
	stda	%f22,[%g1+%l2]ASI_PST16_P ! Mem[0000000010001428] = da770000ba2d00a3
!	%l5 = 0000000000000000, Mem[0000000010141428] = 0000ff72000000ff, %asi = 80
	stxa	%l5,[%i5+0x028]%asi	! Mem[0000000010141428] = 0000000000000000
!	%l2 = 1db4a5ff, %l3 = 0000000b, Mem[0000000030041400] = 06fd1eff ffffffff
	stda	%l2,[%i1+%g0]0x89	! Mem[0000000030041400] = 1db4a5ff 0000000b
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = 183170b9, %l5 = 0000000000000000
	ldsha	[%i6+%o5]0x88,%l5	! %l5 = 00000000000070b9

p0_label_209:
!	%f31 = 000000ff, Mem[0000000030041400] = ffa5b41d
	sta	%f31,[%i1+%g0]0x81	! Mem[0000000030041400] = 000000ff
!	Mem[0000000030001410] = 000000ff ffffffff, %l6 = 00000000, %l7 = ffffffff
	ldda	[%i0+%o5]0x89,%l6	! %l6 = 00000000ffffffff 00000000000000ff
!	Mem[0000000010001408] = ff000000, %l4 = 00000000000000ff
	lduwa	[%i0+%o4]0x80,%l4	! %l4 = 00000000ff000000
!	%l5 = 00000000000070b9, %l2 = 000000001db4a5ff, %l4 = 00000000ff000000
	and	%l5,%l2,%l4		! %l4 = 00000000000020b9
!	Mem[0000000010041400] = 49edf632, %l5 = 00000000000070b9
	lduwa	[%i1+%g0]0x80,%l5	! %l5 = 0000000049edf632
!	Mem[0000000010181410] = b9703118, %l7 = 00000000000000ff
	lduwa	[%i6+%o5]0x80,%l7	! %l7 = 00000000b9703118
!	Mem[0000000030141408] = 00000000, %l3 = 000000000000000b
	ldsba	[%i5+%o4]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000010001410] = 0b3a0000ba2d00a3, %f4  = da770000 ba2d00a3
	ldda	[%i0+0x010]%asi,%f4 	! %f4  = 0b3a0000 ba2d00a3
!	Mem[0000000010041420] = 000000ff00000000, %l1 = 0000000000000000
	ldx	[%i1+0x020],%l1		! %l1 = 000000ff00000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010081430] = 000000ff00000046, %l3 = 0000000000000000, %l5 = 0000000049edf632
	add	%i2,0x30,%g1
	casxa	[%g1]0x80,%l3,%l5	! %l5 = 000000ff00000046

p0_label_210:
!	%l6 = 00000000ffffffff, Mem[0000000030181410] = 00000000
	stha	%l6,[%i6+%o5]0x89	! Mem[0000000030181410] = 0000ffff
!	%l4 = 00000000000020b9, Mem[0000000010141408] = 000077da00000000
	stxa	%l4,[%i5+%o4]0x88	! Mem[0000000010141408] = 00000000000020b9
!	%l0 = 0000000000000000, Mem[00000000100c1408] = 06fd1eff
	stha	%l0,[%i3+%o4]0x80	! Mem[00000000100c1408] = 00001eff
!	%f2  = ff000000, Mem[0000000010081414] = 00000000
	st	%f2 ,[%i2+0x014]	! Mem[0000000010081414] = ff000000
!	%f26 = 98270000 00000000, Mem[00000000300c1408] = 06fd1eff 961fda77
	stda	%f26,[%i3+%o4]0x89	! Mem[00000000300c1408] = 98270000 00000000
!	%l4 = 00000000000020b9, Mem[0000000010141408] = b9200000
	stwa	%l4,[%i5+%o4]0x80	! Mem[0000000010141408] = 000020b9
!	Mem[0000000010041408] = ffffffff, %l6 = 00000000ffffffff
	swapa	[%i1+%o4]0x88,%l6	! %l6 = 00000000ffffffff
!	Mem[0000000010041408] = ffffffff, %l5 = 000000ff00000046
	ldstuba	[%i1+%o4]0x80,%l5	! %l5 = 000000ff000000ff
!	%f26 = 98270000 00000000, Mem[0000000030141400] = 000000ff 00000000
	stda	%f26,[%i5+%g0]0x89	! Mem[0000000030141400] = 98270000 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = 961fda77, %l5 = 00000000000000ff
	ldsh	[%i5+%o5],%l5		! %l5 = ffffffffffff961f

!	Check Point 42 for processor 0

	set	p0_check_pt_data_42,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l1,%g2			! %l1 = 000000ff00000000
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l2,%g2			! %l2 = 000000001db4a5ff
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l3,%g2			! %l3 = 0000000000000000
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l4,%g2			! %l4 = 00000000000020b9
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l5,%g2			! %l5 = ffffffffffff961f
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l6,%g2			! %l6 = 00000000ffffffff
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l7,%g2			! %l7 = 00000000b9703118
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x40],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 0b3a0000 ba2d00a3
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x48],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = ccbe12ae ffffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x50],%g3
	std	%f22,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f22 = da770000 ba2d00a3
	bne	%xcc,p0_freg_check_fail
	mov	0xf22,%g1

!	Check Point 42 completed


p0_label_211:
!	Mem[0000000010001400] = 00000000, %l0 = 0000000000000000
	ldsba	[%i0+%g0]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000030041410] = ffffffff 00002798, %l0 = 00000000, %l1 = 00000000
	ldda	[%i1+%o5]0x81,%l0	! %l0 = 00000000ffffffff 0000000000002798
!	Mem[0000000030081400] = 00ffffff, %l5 = ffffffffffff961f
	lduha	[%i2+%g0]0x89,%l5	! %l5 = 000000000000ffff
!	Mem[0000000030041410] = 98270000ffffffff, %l4 = 00000000000020b9
	ldxa	[%i1+%o5]0x89,%l4	! %l4 = 98270000ffffffff
!	Mem[0000000010081400] = 00000000, %l1 = 0000000000002798
	lduha	[%i2+%g0]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000030141410] = 400913b6, %l5 = 000000000000ffff
	ldsha	[%i5+%o5]0x89,%l5	! %l5 = 00000000000013b6
!	Mem[0000000030041408] = 0b3a0000, %f27 = 00000000
	lda	[%i1+%o4]0x81,%f27	! %f27 = 0b3a0000
!	Mem[0000000010181420] = a3002dba 000077da, %l6 = ffffffff, %l7 = b9703118
	ldda	[%i6+0x020]%asi,%l6	! %l6 = 00000000a3002dba 00000000000077da
!	Mem[0000000030041410] = ffffffff, %l6 = 00000000a3002dba
	lduba	[%i1+%o5]0x81,%l6	! %l6 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%f16 = b6130940 06fd1e0b, Mem[0000000010101408] = 00000000 000000ff
	stda	%f16,[%i4+%o4]0x88	! Mem[0000000010101408] = b6130940 06fd1e0b

p0_label_212:
!	Mem[00000000100c1408] = 00001eff, %l7 = 00000000000077da
	ldstuba	[%i3+%o4]0x80,%l7	! %l7 = 00000000000000ff
!	%l2 = 1db4a5ff, %l3 = 00000000, Mem[0000000010041400] = 49edf632 0b3a9e16
	stda	%l2,[%i1+0x000]%asi	! Mem[0000000010041400] = 1db4a5ff 00000000
!	Mem[0000000010001420] = 400913b6ff000000, %l7 = 0000000000000000, %l5 = 00000000000013b6
	add	%i0,0x20,%g1
	casxa	[%g1]0x80,%l7,%l5	! %l5 = 400913b6ff000000
!	%l2 = 000000001db4a5ff, Mem[0000000030181410] = ffff0000
	stwa	%l2,[%i6+%o5]0x81	! Mem[0000000030181410] = 1db4a5ff
!	Mem[00000000100c141c] = ffffffff, %l6 = 00000000000000ff
	swap	[%i3+0x01c],%l6		! %l6 = 00000000ffffffff
!	Mem[0000000030041410] = ffffffff, %l3 = 0000000000000000
	swapa	[%i1+%o5]0x89,%l3	! %l3 = 00000000ffffffff
!	%l0 = 00000000ffffffff, Mem[00000000300c1408] = 0000000000002798
	stxa	%l0,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00000000ffffffff
!	Mem[0000000010181410] = b9703118, %l3 = 00000000ffffffff
	swapa	[%i6+%o5]0x80,%l3	! %l3 = 00000000b9703118
!	Mem[0000000030181408] = 0000000b, %l5 = 400913b6ff000000
	swapa	[%i6+%o4]0x89,%l5	! %l5 = 000000000000000b
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = ff0000ae00000000, %l0 = 00000000ffffffff
	ldxa	[%i5+%g0]0x80,%l0	! %l0 = ff0000ae00000000

p0_label_213:
!	Mem[0000000010001400] = 00000000, %f19 = ff000000
	lda	[%i0+%g0]0x80,%f19	! %f19 = 00000000
!	Mem[00000000300c1400] = ff0000000000007f, %l2 = 000000001db4a5ff
	ldxa	[%i3+%g0]0x81,%l2	! %l2 = ff0000000000007f
!	Mem[0000000010141410] = 77da1f96, %l2 = ff0000000000007f
	ldswa	[%i5+%o5]0x88,%l2	! %l2 = 0000000077da1f96
!	Mem[0000000010081430] = 000000ff00000046, %l2 = 0000000077da1f96
	ldx	[%i2+0x030],%l2		! %l2 = 000000ff00000046
!	Mem[00000000211c0000] = ff967bbb, %l7 = 0000000000000000
	ldsba	[%o2+0x000]%asi,%l7	! %l7 = ffffffffffffffff
!	Mem[00000000100c1410] = 00000000, %l5 = 000000000000000b
	lduba	[%i3+%o5]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000010141400] = 00000000ae0000ff, %l4 = 98270000ffffffff
	ldxa	[%i5+%g0]0x88,%l4	! %l4 = 00000000ae0000ff
!	Mem[00000000100c1408] = ff1e00ff, %l0 = ff0000ae00000000
	ldsha	[%i3+%o4]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010001410] = 0b3a0000ba2d00a3, %l1 = 0000000000000000
	ldxa	[%i0+%o5]0x80,%l1	! %l1 = 0b3a0000ba2d00a3
!	Starting 10 instruction Store Burst
!	%l3 = 00000000b9703118, Mem[0000000010001400] = 00000000
	stha	%l3,[%i0+%g0]0x80	! Mem[0000000010001400] = 31180000

p0_label_214:
!	%l0 = 000000ff, %l1 = ba2d00a3, Mem[0000000030041410] = 00000000 00002798
	stda	%l0,[%i1+%o5]0x81	! Mem[0000000030041410] = 000000ff ba2d00a3
!	Mem[0000000030181410] = 1db4a5ff, %l7 = ffffffffffffffff
	swapa	[%i6+%o5]0x81,%l7	! %l7 = 000000001db4a5ff
!	%l4 = ae0000ff, %l5 = 00000000, Mem[0000000010041400] = 1db4a5ff 00000000
	stda	%l4,[%i1+%g0]0x80	! Mem[0000000010041400] = ae0000ff 00000000
!	%f15 = ffffffff, Mem[00000000300c1410] = 000000ff
	sta	%f15,[%i3+%o5]0x81	! Mem[00000000300c1410] = ffffffff
!	%l6 = ffffffff, %l7 = 1db4a5ff, Mem[0000000010101400] = 00000000 00002798
	stda	%l6,[%i4+0x000]%asi	! Mem[0000000010101400] = ffffffff 1db4a5ff
!	%l7 = 000000001db4a5ff, Mem[0000000010041408] = ffffffff00000000
	stx	%l7,[%i1+%o4]		! Mem[0000000010041408] = 000000001db4a5ff
!	Mem[0000000010001410] = 00003a0b, %l2 = 000000ff00000046
	swapa	[%i0+%o5]0x88,%l2	! %l2 = 0000000000003a0b
!	Mem[0000000030081400] = 00ffffff, %l6 = 00000000ffffffff
	swapa	[%i2+%g0]0x89,%l6	! %l6 = 0000000000ffffff
!	%l4 = 00000000ae0000ff, Mem[0000000010041400] = ae0000ff
	stwa	%l4,[%i1+%g0]0x80	! Mem[0000000010041400] = ae0000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = 000000ff, %l3 = 00000000b9703118
	lduwa	[%i4+%o4]0x89,%l3	! %l3 = 00000000000000ff

p0_label_215:
!	Mem[00000000300c1400] = 000000ff, %l6 = 0000000000ffffff
	lduha	[%i3+%g0]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030001408] = ff000000, %l6 = 00000000000000ff
	lduba	[%i0+%o4]0x81,%l6	! %l6 = 00000000000000ff
!	Mem[000000001018140c] = ff000000, %f30 = 00000000
	ld	[%i6+0x00c],%f30	! %f30 = ff000000
!	Mem[0000000010081420] = 000000a50000ffff, %f30 = ff000000 000000ff
	ldda	[%i2+0x020]%asi,%f30	! %f30 = 000000a5 0000ffff
!	Mem[0000000030001408] = ffffffff000000ff, %l7 = 000000001db4a5ff
	ldxa	[%i0+%o4]0x89,%l7	! %l7 = ffffffff000000ff
!	Mem[0000000010141408] = b9200000, %l1 = 0b3a0000ba2d00a3
	ldsha	[%i5+%o4]0x88,%l1	! %l1 = 0000000000000000
!	Mem[00000000100c1400] = 06fd1eff, %l0 = 00000000000000ff
	ldsba	[%i3+%g0]0x88,%l0	! %l0 = ffffffffffffffff
!	Mem[00000000100c1438] = ffffffff 00000000, %l6 = 000000ff, %l7 = 000000ff
	ldda	[%i3+0x038]%asi,%l6	! %l6 = 00000000ffffffff 0000000000000000
!	Mem[0000000030141410] = b613094006fd1e0b, %l7 = 0000000000000000
	ldxa	[%i5+%o5]0x81,%l7	! %l7 = b613094006fd1e0b
!	Starting 10 instruction Store Burst
!	Mem[0000000010101428] = 00000000, %l4 = ae0000ff, %l0 = ffffffff
	add	%i4,0x28,%g1
	casa	[%g1]0x80,%l4,%l0	! %l0 = 0000000000000000

!	Check Point 43 for processor 0

	set	p0_check_pt_data_43,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 0000000000000000
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 0000000000000000
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 0000000000003a0b
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 00000000ae0000ff
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 0000000000000000
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 00000000ffffffff
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = b613094006fd1e0b
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = ff0000ff 63c94f86
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x50],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = ccbe12ae ffffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x58],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = ae000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1
	ldx	[%g4+0x60],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = 98270000 0b3a0000
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1
	ldx	[%g4+0x68],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = 000000a5 0000ffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 43 completed


p0_label_216:
!	Mem[000000001000141c] = ffffffff, %l0 = 0000000000000000, %asi = 80
	swapa	[%i0+0x01c]%asi,%l0	! %l0 = 00000000ffffffff
!	Mem[0000000010141408] = 000020b9, %l3 = 00000000000000ff
	ldstuba	[%i5+%o4]0x80,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010081400] = 00000000, %l1 = 0000000000000000
	swapa	[%i2+%g0]0x80,%l1	! %l1 = 0000000000000000
!	%l3 = 0000000000000000, Mem[0000000010101400] = ffa5b41dffffffff
	stxa	%l3,[%i4+%g0]0x88	! Mem[0000000010101400] = 0000000000000000
!	%f12 = 000000ff 00000000, Mem[00000000100c1408] = ff001eff 000000ae
	stda	%f12,[%i3+0x008]%asi	! Mem[00000000100c1408] = 000000ff 00000000
!	Mem[0000000010101408] = 0b1efd06, %l4 = 00000000ae0000ff
	ldstuba	[%i4+%o4]0x80,%l4	! %l4 = 0000000b000000ff
!	Mem[0000000010181400] = ffffffff, %l6 = 00000000ffffffff
	swapa	[%i6+%g0]0x80,%l6	! %l6 = 00000000ffffffff
!	Mem[00000000100c143b] = ffffffff, %l4 = 000000000000000b
	ldstuba	[%i3+0x03b]%asi,%l4	! %l4 = 000000ff000000ff
!	%f0  = ff0000ff 63c94f86, Mem[0000000010041410] = ae12becc 000000ae
	stda	%f0 ,[%i1+%o5]0x80	! Mem[0000000010041410] = ff0000ff 63c94f86
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = ff1efd06 400913b6, %l2 = 00003a0b, %l3 = 00000000
	ldda	[%i4+%o4]0x80,%l2	! %l2 = 00000000ff1efd06 00000000400913b6

p0_label_217:
!	Mem[0000000030041400] = 0000000bff000000, %f16 = b6130940 06fd1e0b
	ldda	[%i1+%g0]0x89,%f16	! %f16 = 0000000b ff000000
!	Mem[00000000201c0000] = ffffaf65, %l3 = 00000000400913b6
	ldsba	[%o0+0x000]%asi,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010001408] = 000000ff, %l2 = 00000000ff1efd06
	ldswa	[%i0+%o4]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000020800040] = ffffac70, %l7 = b613094006fd1e0b
	ldsba	[%o1+0x040]%asi,%l7	! %l7 = ffffffffffffffff
!	Mem[00000000100c1408] = 000000ff, %l7 = ffffffffffffffff
	ldswa	[%i3+%o4]0x80,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030101408] = 000000ff, %l5 = 0000000000000000
	lduba	[%i4+%o4]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010001408] = 000000ff, %l1 = 0000000000000000
	lduba	[%i0+%o4]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030101400] = ff0000ff, %f9  = ff000000
	lda	[%i4+%g0]0x89,%f9 	! %f9 = ff0000ff
!	Mem[0000000010081410] = 00630000, %l1 = 00000000000000ff
	lduwa	[%i2+%o5]0x80,%l1	! %l1 = 0000000000630000
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1408] = 00000000, %l2 = 00000000000000ff
	ldstuba	[%i3+%o4]0x81,%l2	! %l2 = 00000000000000ff

p0_label_218:
!	%f10 = 00000096 0000ffff, Mem[0000000010041400] = ae0000ff 00000000
	stda	%f10,[%i1+%g0]0x80	! Mem[0000000010041400] = 00000096 0000ffff
!	%l6 = 00000000ffffffff, Mem[0000000010081400] = 00000000
	stwa	%l6,[%i2+%g0]0x88	! Mem[0000000010081400] = ffffffff
!	Mem[0000000010141424] = e46cbd64, %l0 = ffffffff, %l1 = 00630000
	add	%i5,0x24,%g1
	casa	[%g1]0x80,%l0,%l1	! %l1 = 00000000e46cbd64
!	%l2 = 0000000000000000, Mem[000000001000141f] = 00000000
	stb	%l2,[%i0+0x01f]		! Mem[000000001000141c] = 00000000
!	%l3 = ffffffffffffffff, Mem[0000000010001432] = 000000ff
	sth	%l3,[%i0+0x032]		! Mem[0000000010001430] = 0000ffff
!	%f24 = ff1efd06 ffffffff, %l4 = 00000000000000ff
!	Mem[0000000030181430] = 53ac191b38a476df
	add	%i6,0x030,%g1
	stda	%f24,[%g1+%l4]ASI_PST32_S ! Mem[0000000030181430] = ff1efd06ffffffff
!	Mem[0000000010041410] = ff0000ff, %l7 = 00000000000000ff
	ldstuba	[%i1+%o5]0x80,%l7	! %l7 = 000000ff000000ff
!	Mem[0000000030081410] = 000000ff, %l3 = ffffffffffffffff
	ldstuba	[%i2+%o5]0x81,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030041400] = ff000000, %l5 = 00000000000000ff
	swapa	[%i1+%g0]0x89,%l5	! %l5 = 00000000ff000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = 06fd1eff, %l0 = 00000000ffffffff
	ldsha	[%i4+%o4]0x88,%l0	! %l0 = 0000000000001eff

p0_label_219:
!	Mem[0000000030041410] = a3002dba ff000000, %l0 = 00001eff, %l1 = e46cbd64
	ldda	[%i1+%o5]0x89,%l0	! %l0 = 00000000ff000000 00000000a3002dba
!	Mem[0000000010081410] = 00006300, %l4 = 00000000000000ff
	ldswa	[%i2+%o5]0x88,%l4	! %l4 = 0000000000006300
!	Mem[0000000010101400] = 0000000000000000, %f12 = 000000ff 00000000
	ldd	[%i4+%g0],%f12		! %f12 = 00000000 00000000
!	Mem[0000000010141414] = 000000ff, %l7 = 00000000000000ff
	ldsba	[%i5+0x016]%asi,%l7	! %l7 = 0000000000000000
!	Mem[00000000100c1408] = ff000000, %l7 = 0000000000000000
	ldswa	[%i3+%o4]0x88,%l7	! %l7 = ffffffffff000000
!	Mem[00000000201c0000] = ffffaf65, %l5 = 00000000ff000000
	ldub	[%o0+0x001],%l5		! %l5 = 00000000000000ff
!	Mem[00000000300c1408] = ff000000, %f14 = a3002dba
	lda	[%i3+%o4]0x81,%f14	! %f14 = ff000000
!	Mem[0000000030081408] = 2a5800ff, %l1 = 00000000a3002dba
	ldswa	[%i2+%o4]0x89,%l1	! %l1 = 000000002a5800ff
!	Mem[00000000100c143c] = 00000000, %l2 = 0000000000000000
	lduh	[%i3+0x03e],%l2		! %l2 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f2  = ff000000 000000ff, Mem[0000000030001408] = 000000ff ffffffff
	stda	%f2 ,[%i0+%o4]0x89	! Mem[0000000030001408] = ff000000 000000ff

p0_label_220:
!	%f13 = 00000000, Mem[00000000300c1408] = 000000ff
	sta	%f13,[%i3+%o4]0x89	! Mem[00000000300c1408] = 00000000
!	%f4  = 0b3a0000 ba2d00a3, Mem[0000000030001408] = 000000ff ff000000
	stda	%f4 ,[%i0+%o4]0x89	! Mem[0000000030001408] = 0b3a0000 ba2d00a3
!	Mem[00000000100c1408] = 000000ff, %l2 = 0000000000000000
	ldstuba	[%i3+%o4]0x80,%l2	! %l2 = 00000000000000ff
!	Mem[00000000218001c1] = ff69397e, %l4 = 0000000000006300
	ldstub	[%o3+0x1c1],%l4		! %l4 = 00000069000000ff
!	%f2  = ff000000 000000ff, Mem[00000000100c1410] = 00000000 ff1efd06
	stda	%f2 ,[%i3+%o5]0x88	! Mem[00000000100c1410] = ff000000 000000ff
!	%l0 = 00000000ff000000, Mem[0000000030181410] = ffffffff
	stba	%l0,[%i6+%o5]0x81	! Mem[0000000030181410] = 00ffffff
!	%f2  = ff000000 000000ff, Mem[0000000010041418] = 000000ff 0b3a0000
	stda	%f2 ,[%i1+0x018]%asi	! Mem[0000000010041418] = ff000000 000000ff
!	%l2 = 0000000000000000, Mem[0000000021800180] = 15ff2200
	sth	%l2,[%o3+0x180]		! Mem[0000000021800180] = 00002200
!	%l6 = 00000000ffffffff, Mem[0000000010181410] = ffffffff
	stha	%l6,[%i6+%o5]0x88	! Mem[0000000010181410] = ffffffff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = ff0000ff, %l0 = 00000000ff000000
	lduba	[%i3+%o4]0x88,%l0	! %l0 = 00000000000000ff

!	Check Point 44 for processor 0

	set	p0_check_pt_data_44,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 000000002a5800ff
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 0000000000000000
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 0000000000000000
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 0000000000000069
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l7,%g2			! %l7 = ffffffffff000000
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x40],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = ff0000ff 63c94f86
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x48],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = ff000000 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x50],%g3
	std	%f8,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f8 = 400913b6 ff0000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf08,%g1
	ldx	[%g4+0x58],%g3
	std	%f12,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f12 = 00000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf12,%g1
	ldx	[%g4+0x60],%g3
	std	%f14,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f14 = ff000000 ffffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf14,%g1
	ldx	[%g4+0x68],%g3
	std	%f16,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f16 = 0000000b ff000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf16,%g1

!	Check Point 44 completed


p0_label_221:
!	Mem[0000000030181408] = ff000000, %l3 = 0000000000000000
	lduha	[%i6+%o4]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000030181408] = ff000000, %l0 = 00000000000000ff
	ldswa	[%i6+%o4]0x89,%l0	! %l0 = ffffffffff000000
!	Mem[0000000020800040] = ffffac70, %l5 = 00000000000000ff
	ldsh	[%o1+0x040],%l5		! %l5 = ffffffffffffffff
!	Mem[00000000201c0000] = ffffaf65, %l6 = 00000000ffffffff
	ldsha	[%o0+0x000]%asi,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000030181410] = 00ffffff, %l0 = ffffffffff000000
	lduba	[%i6+%o5]0x81,%l0	! %l0 = 0000000000000000
!	Mem[00000000300c1410] = ffffffff, %l4 = 0000000000000069
	lduha	[%i3+%o5]0x81,%l4	! %l4 = 000000000000ffff
!	Mem[0000000030141400] = 0000000000002798, %l7 = ffffffffff000000
	ldxa	[%i5+%g0]0x81,%l7	! %l7 = 0000000000002798
!	Mem[0000000010181400] = ffffffffffffffff, %f6  = ccbe12ae ffffffff
	ldda	[%i6+%g0]0x88,%f6 	! %f6  = ffffffff ffffffff
!	Mem[0000000030181408] = 000000ff, %l7 = 0000000000002798
	lduha	[%i6+%o4]0x81,%l7	! %l7 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l6 = ffffffffffffffff, Mem[0000000030001408] = a3002dba
	stwa	%l6,[%i0+%o4]0x81	! Mem[0000000030001408] = ffffffff

p0_label_222:
!	Mem[00000000201c0001] = ffffaf65, %l0 = 0000000000000000
	ldstuba	[%o0+0x001]%asi,%l0	! %l0 = 000000ff000000ff
!	%l5 = ffffffffffffffff, Mem[0000000010041434] = 53f91e8f
	stw	%l5,[%i1+0x034]		! Mem[0000000010041434] = ffffffff
!	%f17 = ff000000, Mem[00000000100c1400] = 06fd1eff
	sta	%f17,[%i3+%g0]0x88	! Mem[00000000100c1400] = ff000000
!	Mem[00000000201c0000] = ffffaf65, %l4 = 000000000000ffff
	ldstuba	[%o0+0x000]%asi,%l4	! %l4 = 000000ff000000ff
!	%l4 = 000000ff, %l5 = ffffffff, Mem[0000000010141410] = 961fda77 000000ff
	stda	%l4,[%i5+%o5]0x80	! Mem[0000000010141410] = 000000ff ffffffff
!	%l1 = 000000002a5800ff, Mem[00000000100c1408] = ff0000ff
	stha	%l1,[%i3+%o4]0x80	! Mem[00000000100c1408] = 00ff00ff
!	%l3 = 0000000000000000, Mem[0000000010101408] = ff1efd06400913b6
	stxa	%l3,[%i4+%o4]0x80	! Mem[0000000010101408] = 0000000000000000
!	%f31 = 0000ffff, Mem[0000000030081408] = 2a5800ff
	sta	%f31,[%i2+%o4]0x89	! Mem[0000000030081408] = 0000ffff
!	%l7 = 0000000000000000, Mem[0000000010001400] = 00001831
	stha	%l7,[%i0+%g0]0x88	! Mem[0000000010001400] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = b613094006fd1e0b, %l6 = ffffffffffffffff
	ldxa	[%i5+%o5]0x81,%l6	! %l6 = b613094006fd1e0b

p0_label_223:
!	Mem[0000000010101420] = 00000033, %l6 = b613094006fd1e0b
	ldsw	[%i4+0x020],%l6		! %l6 = 0000000000000033
!	Mem[0000000030141400] = 00000000, %l7 = 0000000000000000
	ldsha	[%i5+%g0]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000010081410] = 00006300, %l4 = 00000000000000ff
	lduha	[%i2+%o5]0x88,%l4	! %l4 = 0000000000006300
!	Mem[0000000030041408] = 0b3a0000, %l2 = 0000000000000000
	lduba	[%i1+%o4]0x81,%l2	! %l2 = 000000000000000b
!	Mem[00000000100c1408] = 00ff00ff, %l1 = 000000002a5800ff
	lduw	[%i3+%o4],%l1		! %l1 = 0000000000ff00ff
!	Mem[0000000010181408] = ae000000, %l3 = 0000000000000000
	lduha	[%i6+%o4]0x88,%l3	! %l3 = 0000000000000000
!	Mem[00000000100c1408] = ff00ff00, %l1 = 0000000000ff00ff
	ldswa	[%i3+%o4]0x88,%l1	! %l1 = ffffffffff00ff00
!	Mem[0000000010101410] = 00000000, %l2 = 000000000000000b
	lduba	[%i4+%o5]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000010101408] = 00000000, %f21 = 000000ff
	lda	[%i4+%o4]0x88,%f21	! %f21 = 00000000
!	Starting 10 instruction Store Burst
!	%l4 = 00006300, %l5 = ffffffff, Mem[0000000010001400] = 00000000 ff000000
	stda	%l4,[%i0+%g0]0x88	! Mem[0000000010001400] = 00006300 ffffffff

p0_label_224:
!	%l7 = 0000000000000000, Mem[00000000100c1408] = ff00ff00
	stba	%l7,[%i3+%o4]0x88	! Mem[00000000100c1408] = ff00ff00
!	Mem[00000000100c1408] = 00ff00ff, %l2 = 0000000000000000
	swapa	[%i3+%o4]0x80,%l2	! %l2 = 0000000000ff00ff
!	%f29 = ffffffff, Mem[0000000030141408] = 00000000
	sta	%f29,[%i5+%o4]0x81	! Mem[0000000030141408] = ffffffff
!	Mem[0000000010081422] = 000000a5, %l4 = 0000000000006300
	ldstub	[%i2+0x022],%l4		! %l4 = 00000000000000ff
!	%l4 = 00000000, %l5 = ffffffff, Mem[0000000010001400] = 00630000 ffffffff
	stda	%l4,[%i0+%g0]0x80	! Mem[0000000010001400] = 00000000 ffffffff
!	Mem[0000000010181410] = ffffffff, %l3 = 0000000000000000
	ldstuba	[%i6+%o5]0x80,%l3	! %l3 = 000000ff000000ff
!	Mem[0000000010141430] = 00000000, %l5 = ffffffffffffffff, %asi = 80
	swapa	[%i5+0x030]%asi,%l5	! %l5 = 0000000000000000
!	Mem[00000000211c0001] = ff967bbb, %l4 = 0000000000000000
	ldstub	[%o2+0x001],%l4		! %l4 = 00000096000000ff
!	Mem[0000000010141408] = b92000ff, %l6 = 0000000000000033
	swapa	[%i5+%o4]0x88,%l6	! %l6 = 00000000b92000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010041428] = d56a83d006cd9827, %l3 = 00000000000000ff
	ldx	[%i1+0x028],%l3		! %l3 = d56a83d006cd9827

p0_label_225:
!	Mem[0000000030141400] = 00000000, %l0 = 00000000000000ff
	ldstuba	[%i5+%g0]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010141410] = ffffffff ff000000, %l4 = 00000096, %l5 = 00000000
	ldda	[%i5+%o5]0x88,%l4	! %l4 = 00000000ff000000 00000000ffffffff
!	Mem[0000000010041400] = 000000960000ffff, %l4 = 00000000ff000000
	ldxa	[%i1+%g0]0x80,%l4	! %l4 = 000000960000ffff
!	Mem[0000000030181408] = 000000ff, %l6 = 00000000b92000ff
	ldsba	[%i6+%o4]0x81,%l6	! %l6 = 0000000000000000
!	Mem[000000001008140c] = 00000000, %l2 = 0000000000ff00ff
	lduh	[%i2+0x00c],%l2		! %l2 = 0000000000000000
!	Mem[0000000030101410] = da770000, %l5 = 00000000ffffffff
	ldsba	[%i4+%o5]0x81,%l5	! %l5 = ffffffffffffffda
!	Mem[0000000030181400] = 00000000, %l7 = 0000000000000000
	ldsba	[%i6+%g0]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000030081400] = ff000000 ffffffff, %l2 = 00000000, %l3 = 06cd9827
	ldda	[%i2+%g0]0x89,%l2	! %l2 = 00000000ffffffff 00000000ff000000
!	Mem[0000000030181410] = ffffff00, %l4 = 000000960000ffff
	ldswa	[%i6+%o5]0x89,%l4	! %l4 = ffffffffffffff00
!	Starting 10 instruction Store Burst
!	Mem[00000000211c0001] = ffff7bbb, %l2 = 00000000ffffffff
	ldstub	[%o2+0x001],%l2		! %l2 = 000000ff000000ff

!	Check Point 45 for processor 0

	set	p0_check_pt_data_45,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 0000000000000000
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = ffffffffff00ff00
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 00000000ff000000
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = ffffffffffffff00
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = ffffffffffffffda
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 0000000000000000
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 0000000000000000
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = ff000000 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x50],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 0b3a0000 ba2d00a3
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x58],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = ffffffff ffffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x60],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = ffffffff 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1

!	Check Point 45 completed


p0_label_226:
!	%l6 = 0000000000000000, Mem[0000000030181408] = ff000000
	stha	%l6,[%i6+%o4]0x89	! Mem[0000000030181408] = ff000000
!	Mem[0000000010041408] = 00000000, %l6 = 0000000000000000
	ldstuba	[%i1+%o4]0x80,%l6	! %l6 = 00000000000000ff
!	Mem[000000001018142c] = 00000000, %l2 = 00000000000000ff
	ldstuba	[%i6+0x02c]%asi,%l2	! %l2 = 00000000000000ff
!	%f27 = 0b3a0000, Mem[0000000010001410] = 46000000
	sta	%f27,[%i0+%o5]0x80	! Mem[0000000010001410] = 0b3a0000
!	Mem[0000000010101400] = 00000000, %l4 = ffffffffffffff00
	swapa	[%i4+%g0]0x88,%l4	! %l4 = 0000000000000000
!	Mem[000000001000141a] = ccbe12ae, %l7 = 0000000000000000
	ldstuba	[%i0+0x01a]%asi,%l7	! %l7 = 00000012000000ff
!	Mem[0000000010001410] = 0b3a0000, %l4 = 0000000000000000
	ldstuba	[%i0+%o5]0x80,%l4	! %l4 = 0000000b000000ff
!	%l3 = 00000000ff000000, Mem[0000000030141400] = 98270000000000ff
	stxa	%l3,[%i5+%g0]0x89	! Mem[0000000030141400] = 00000000ff000000
!	Mem[0000000010001410] = ff3a0000, %l3 = 00000000ff000000
	swapa	[%i0+%o5]0x80,%l3	! %l3 = 00000000ff3a0000
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = 0000ffff, %l6 = 0000000000000000
	lduba	[%i2+%o4]0x89,%l6	! %l6 = 00000000000000ff

p0_label_227:
!	Mem[0000000030141400] = 000000ff, %f18 = ae000000
	lda	[%i5+%g0]0x81,%f18	! %f18 = 000000ff
!	Mem[0000000030101400] = ff0000ff, %l0 = 0000000000000000
	ldswa	[%i4+%g0]0x89,%l0	! %l0 = ffffffffff0000ff
!	Mem[0000000010181408] = 000000ae ff000000, %l0 = ff0000ff, %l1 = ff00ff00
	ldda	[%i6+%o4]0x80,%l0	! %l0 = 00000000000000ae 00000000ff000000
!	Mem[0000000030181408] = 000000ff, %l5 = ffffffffffffffda
	ldsba	[%i6+%o4]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000010041410] = ff0000ff, %l4 = 000000000000000b
	lduwa	[%i1+%o5]0x80,%l4	! %l4 = 00000000ff0000ff
!	Mem[0000000030181410] = ff000000 ffffff00, %l0 = 000000ae, %l1 = ff000000
	ldda	[%i6+%o5]0x89,%l0	! %l0 = 00000000ffffff00 00000000ff000000
!	Mem[0000000010001434] = 00000000, %l5 = 0000000000000000
	ldsba	[%i0+0x035]%asi,%l5	! %l5 = 0000000000000000
!	Mem[0000000010001410] = ff000000, %l2 = 0000000000000000
	ldsba	[%i0+%o5]0x80,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000010101408] = 00000000, %l6 = 00000000000000ff
	ldsba	[%i4+%o4]0x88,%l6	! %l6 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f22 = da770000, Mem[0000000010181404] = ffffffff
	st	%f22,[%i6+0x004]	! Mem[0000000010181404] = da770000

p0_label_228:
!	Mem[0000000010001410] = 000000ff, %l1 = 00000000ff000000
	swapa	[%i0+%o5]0x88,%l1	! %l1 = 00000000000000ff
!	%l0 = 00000000ffffff00, Mem[0000000010101410] = 00000000, %asi = 80
	stwa	%l0,[%i4+0x010]%asi	! Mem[0000000010101410] = ffffff00
!	%l4 = ff0000ff, %l5 = 00000000, Mem[0000000030141410] = 400913b6 0b1efd06
	stda	%l4,[%i5+%o5]0x89	! Mem[0000000030141410] = ff0000ff 00000000
!	%f10 = 00000096 0000ffff, %l6 = 0000000000000000
!	Mem[0000000030101418] = ccbe12aeffffffff
	add	%i4,0x018,%g1
	stda	%f10,[%g1+%l6]ASI_PST8_SL ! Mem[0000000030101418] = ccbe12aeffffffff
!	%l3 = 00000000ff3a0000, Mem[0000000010101410] = ffffff00ff000000
	stxa	%l3,[%i4+%o5]0x80	! Mem[0000000010101410] = 00000000ff3a0000
!	Mem[000000001014142f] = 00000000, %l2 = ffffffffffffffff
	ldstuba	[%i5+0x02f]%asi,%l2	! %l2 = 00000000000000ff
!	%l1 = 00000000000000ff, Mem[0000000020800040] = ffffac70
	stb	%l1,[%o1+0x040]		! Mem[0000000020800040] = ffffac70
!	Mem[0000000010141404] = 00000000, %l2 = 00000000, %l1 = 000000ff
	add	%i5,0x04,%g1
	casa	[%g1]0x80,%l2,%l1	! %l1 = 0000000000000000
!	%l4 = 00000000ff0000ff, Mem[0000000030041410] = 000000ffba2d00a3
	stxa	%l4,[%i1+%o5]0x81	! Mem[0000000030041410] = 00000000ff0000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1404] = 400913b6, %l0 = 00000000ffffff00
	ldsb	[%i3+0x004],%l0		! %l0 = 0000000000000040

p0_label_229:
!	Mem[0000000010101434] = 169e3a00, %l0 = 0000000000000040
	lduw	[%i4+0x034],%l0		! %l0 = 00000000169e3a00
!	Mem[0000000010081410] = 00630000 ff000000, %l6 = 00000000, %l7 = 00000012
	ldda	[%i2+%o5]0x80,%l6	! %l6 = 0000000000630000 00000000ff000000
!	Mem[0000000010001410] = a3002dbaff000000, %l4 = 00000000ff0000ff
	ldxa	[%i0+%o5]0x88,%l4	! %l4 = a3002dbaff000000
	membar	#Sync			! Added by membar checker (47)
!	Mem[0000000010001400] = 00000000 ffffffff ff000000 000000ff
!	Mem[0000000010001410] = 000000ff ba2d00a3 ccbeffae 00000000
!	Mem[0000000010001420] = 400913b6 ff000000 da770000 ba2d00a3
!	Mem[0000000010001430] = 0000ffff 00000000 a3002dba ffffffff
	ldda	[%i0]ASI_BLK_P,%f16	! Block Load from 0000000010001400
!	Mem[0000000010081420] = 0000ffa5, %l6 = 0000000000630000
	lduh	[%i2+0x020],%l6		! %l6 = 0000000000000000
!	Mem[0000000010181400] = ffffffff da770000, %l2 = 00000000, %l3 = ff3a0000
	ldda	[%i6+%g0]0x80,%l2	! %l2 = 00000000ffffffff 00000000da770000
!	Mem[0000000010001400] = 00000000, %l6 = 0000000000000000
	lduha	[%i0+%g0]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000030041410] = 00000000, %l1 = 0000000000000000
	ldsha	[%i1+%o5]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000030101410] = 000077da, %l5 = 0000000000000000
	lduwa	[%i4+%o5]0x89,%l5	! %l5 = 00000000000077da
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (48)
!	%f14 = ff000000 ffffffff, Mem[0000000010001418] = ccbeffae 00000000
	std	%f14,[%i0+0x018]	! Mem[0000000010001418] = ff000000 ffffffff

p0_label_230:
!	%f0  = ff0000ff 63c94f86 ff000000 000000ff
!	%f4  = 0b3a0000 ba2d00a3 ffffffff ffffffff
!	%f8  = 400913b6 ff0000ff 00000096 0000ffff
!	%f12 = 00000000 00000000 ff000000 ffffffff
	stda	%f0,[%i0]ASI_COMMIT_P	! Block Store to 0000000010001400
!	%l3 = 00000000da770000, Mem[0000000030181410] = 00ffffff000000ff
	stxa	%l3,[%i6+%o5]0x81	! Mem[0000000030181410] = 00000000da770000
!	%l2 = ffffffff, %l3 = da770000, Mem[0000000030041400] = 000000ff 0000000b
	stda	%l2,[%i1+%g0]0x89	! Mem[0000000030041400] = ffffffff da770000
!	%l5 = 00000000000077da, Mem[0000000030181400] = 00000000
	stwa	%l5,[%i6+%g0]0x89	! Mem[0000000030181400] = 000077da
!	%l3 = 00000000da770000, Mem[0000000010181408] = 000000ffae000000
	stxa	%l3,[%i6+%o4]0x88	! Mem[0000000010181408] = 00000000da770000
!	%l7 = 00000000ff000000, Mem[0000000030041408] = 00003a0b
	stha	%l7,[%i1+%o4]0x89	! Mem[0000000030041408] = 00000000
!	Mem[0000000010041410] = ff0000ff, %l5 = 00000000000077da
	ldstuba	[%i1+%o5]0x88,%l5	! %l5 = 000000ff000000ff
!	%f18 = ff000000 000000ff, Mem[0000000030041408] = 00000000 00000000
	stda	%f18,[%i1+%o4]0x89	! Mem[0000000030041408] = ff000000 000000ff
	membar	#Sync			! Added by membar checker (49)
!	%l2 = ffffffff, %l3 = da770000, Mem[0000000010001418] = ffffffff ffffffff
	stda	%l2,[%i0+0x018]%asi	! Mem[0000000010001418] = ffffffff da770000
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = ffffffff, %l4 = a3002dbaff000000
	lduba	[%i2+%g0]0x89,%l4	! %l4 = 00000000000000ff

!	Check Point 46 for processor 0

	set	p0_check_pt_data_46,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 00000000169e3a00
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 0000000000000000
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 00000000ffffffff
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l4,%g2			! %l4 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l5,%g2			! %l5 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l6,%g2			! %l6 = 0000000000000000
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l7,%g2			! %l7 = 00000000ff000000
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x40],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = ff0000ff 63c94f86
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x48],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = ff000000 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x50],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = ffffffff ffffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x58],%g3
	std	%f16,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f16 = 00000000 ffffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf16,%g1
	ldx	[%g4+0x60],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = ff000000 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1
	ldx	[%g4+0x68],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = 000000ff ba2d00a3
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1
	ldx	[%g4+0x70],%g3
	std	%f22,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f22 = ccbeffae 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf22,%g1
	ldx	[%g4+0x78],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = 400913b6 ff000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1
	ldx	[%g4+0x80],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = da770000 ba2d00a3
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1
	ldx	[%g4+0x88],%g3
	std	%f28,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f28 = 0000ffff 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf28,%g1
	ldx	[%g4+0x90],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = a3002dba ffffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 46 completed


p0_label_231:
!	Mem[0000000010181410] = ffff0000ffffffff, %l4 = 00000000000000ff
	ldxa	[%i6+%o5]0x88,%l4	! %l4 = ffff0000ffffffff
!	Mem[0000000030081410] = ff0000ff, %l0 = 00000000169e3a00
	ldswa	[%i2+%o5]0x89,%l0	! %l0 = ffffffffff0000ff
!	Mem[0000000010141408] = 00000033, %l2 = 00000000ffffffff
	ldswa	[%i5+%o4]0x88,%l2	! %l2 = 0000000000000033
!	Mem[0000000010041408] = ff0000001db4a5ff, %f12 = 00000000 00000000
	ldda	[%i1+0x008]%asi,%f12	! %f12 = ff000000 1db4a5ff
!	Mem[0000000030001410] = ffffffff, %l1 = 0000000000000000
	lduwa	[%i0+%o5]0x89,%l1	! %l1 = 00000000ffffffff
!	Mem[0000000030141410] = ff0000ff, %l2 = 0000000000000033
	lduwa	[%i5+%o5]0x89,%l2	! %l2 = 00000000ff0000ff
!	Mem[0000000010181400] = ffffffff, %l5 = 00000000000000ff
	lduba	[%i6+%g0]0x80,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010101410] = 00000000, %f11 = 0000ffff
	lda	[%i4+%o5]0x88,%f11	! %f11 = 00000000
!	Mem[0000000010041408] = ff000000, %l3 = 00000000da770000
	lduha	[%i1+%o4]0x80,%l3	! %l3 = 000000000000ff00
!	Starting 10 instruction Store Burst
!	%l2 = 00000000ff0000ff, Mem[0000000030141400] = 00000000ff000000
	stxa	%l2,[%i5+%g0]0x89	! Mem[0000000030141400] = 00000000ff0000ff

p0_label_232:
!	%f12 = ff000000 1db4a5ff, %l2 = 00000000ff0000ff
!	Mem[0000000030181428] = 35ec16f04424ff0d
	add	%i6,0x028,%g1
	stda	%f12,[%g1+%l2]ASI_PST32_S ! Mem[0000000030181428] = ff0000001db4a5ff
!	%f8  = 400913b6 ff0000ff, Mem[0000000030181400] = da770000 00000000
	stda	%f8 ,[%i6+%g0]0x81	! Mem[0000000030181400] = 400913b6 ff0000ff
!	%l1 = 00000000ffffffff, Mem[0000000010081410] = 00630000
	stha	%l1,[%i2+%o5]0x80	! Mem[0000000010081410] = ffff0000
!	%f3  = 000000ff, Mem[0000000010041408] = 000000ff
	sta	%f3 ,[%i1+%o4]0x88	! Mem[0000000010041408] = 000000ff
!	Mem[0000000030081400] = ffffffff, %l6 = 0000000000000000
	ldstuba	[%i2+%g0]0x81,%l6	! %l6 = 000000ff000000ff
!	%l5 = 00000000000000ff, Mem[0000000030081408] = 0000ffff
	stba	%l5,[%i2+%o4]0x89	! Mem[0000000030081408] = 0000ffff
!	%f22 = ccbeffae, Mem[0000000010141420] = 00000b00
	st	%f22,[%i5+0x020]	! Mem[0000000010141420] = ccbeffae
!	%l4 = ffff0000ffffffff, Mem[0000000010081408] = 9800000000000000
	stxa	%l4,[%i2+%o4]0x80	! Mem[0000000010081408] = ffff0000ffffffff
!	Mem[0000000010141418] = 00000000, %l3 = 0000ff00, %l1 = ffffffff
	add	%i5,0x18,%g1
	casa	[%g1]0x80,%l3,%l1	! %l1 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = 00000000, %l1 = 0000000000000000
	lduha	[%i4+%o5]0x80,%l1	! %l1 = 0000000000000000

p0_label_233:
!	Mem[0000000010081400] = ffffffff00000000, %f30 = a3002dba ffffffff
	ldda	[%i2+%g0]0x80,%f30	! %f30 = ffffffff 00000000
!	Mem[00000000300c1410] = ffffffff, %l3 = 000000000000ff00
	ldsba	[%i3+%o5]0x89,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010181410] = ffffffff, %l0 = ffffffffff0000ff
	ldsha	[%i6+%o5]0x88,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010001420] = 400913b6ff0000ff, %f28 = 0000ffff 00000000
	ldda	[%i0+0x020]%asi,%f28	! %f28 = 400913b6 ff0000ff
!	Mem[0000000010181418] = ff000000 000000c0, %l0 = ffffffff, %l1 = 00000000
	ldda	[%i6+0x018]%asi,%l0	! %l0 = 00000000ff000000 00000000000000c0
!	Mem[00000000300c1408] = 00000000, %l5 = 00000000000000ff
	ldsba	[%i3+%o4]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000030041410] = 00000000, %l7 = 00000000ff000000
	ldsha	[%i1+%o5]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000010181400] = ffffffff, %l3 = ffffffffffffffff
	ldsba	[%i6+%g0]0x88,%l3	! %l3 = ffffffffffffffff
!	Mem[00000000300c1408] = 00000000, %f25 = ff000000
	lda	[%i3+%o4]0x81,%f25	! %f25 = 00000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010181428] = 00000000ff000000, %l6 = 00000000000000ff, %l7 = 0000000000000000
	add	%i6,0x28,%g1
	casxa	[%g1]0x80,%l6,%l7	! %l7 = 00000000ff000000

p0_label_234:
!	%f30 = ffffffff 00000000, Mem[0000000010101410] = 00000000 ff3a0000
	stda	%f30,[%i4+0x010]%asi	! Mem[0000000010101410] = ffffffff 00000000
!	Mem[0000000010081410] = 0000ffff, %l2 = 00000000ff0000ff
	ldstuba	[%i2+%o5]0x88,%l2	! %l2 = 000000ff000000ff
!	%f0  = ff0000ff 63c94f86 ff000000 000000ff
!	%f4  = 0b3a0000 ba2d00a3 ffffffff ffffffff
!	%f8  = 400913b6 ff0000ff 00000096 00000000
!	%f12 = ff000000 1db4a5ff ff000000 ffffffff
	stda	%f0,[%i1]ASI_BLK_SL	! Block Store to 0000000030041400
!	Mem[0000000030181410] = 00000000, %l7 = 00000000ff000000
	swapa	[%i6+%o5]0x81,%l7	! %l7 = 0000000000000000
!	%f31 = 00000000, Mem[0000000030181400] = b6130940
	sta	%f31,[%i6+%g0]0x89	! Mem[0000000030181400] = 00000000
!	Mem[0000000010141410] = ff000000, %l3 = ffffffffffffffff
	ldstuba	[%i5+%o5]0x88,%l3	! %l3 = 00000000000000ff
!	%f26 = da770000 ba2d00a3, %l1 = 00000000000000c0
!	Mem[0000000010141418] = 00000000000000ff
	add	%i5,0x018,%g1
	stda	%f26,[%g1+%l1]ASI_PST32_PL ! Mem[0000000010141418] = 00000000000000ff
!	Mem[0000000010081408] = 0000ffff, %l6 = 00000000000000ff
	swapa	[%i2+%o4]0x88,%l6	! %l6 = 000000000000ffff
!	Mem[00000000100c1408] = 00000000, %l7 = 0000000000000000
	ldstuba	[%i3+%o4]0x80,%l7	! %l7 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = ffffff00, %l2 = 00000000000000ff
	lduha	[%i4+%g0]0x88,%l2	! %l2 = 000000000000ff00

p0_label_235:
	membar	#Sync			! Added by membar checker (50)
!	Mem[0000000010041410] = ff0000ff, %l5 = 0000000000000000
	lduha	[%i1+%o5]0x80,%l5	! %l5 = 000000000000ff00
!	Mem[0000000010101410] = ffffffff, %l7 = 0000000000000000
	ldsba	[%i4+%o5]0x88,%l7	! %l7 = ffffffffffffffff
!	Mem[000000001018143c] = 864fc963, %l7 = ffffffffffffffff
	ldswa	[%i6+0x03c]%asi,%l7	! %l7 = ffffffff864fc963
!	Mem[0000000030081408] = ffff0000, %l6 = 000000000000ffff
	ldswa	[%i2+%o4]0x81,%l6	! %l6 = ffffffffffff0000
!	Mem[0000000010081400] = ffffffff, %l2 = 000000000000ff00
	lduwa	[%i2+%g0]0x88,%l2	! %l2 = 00000000ffffffff
!	Mem[0000000010141438] = a96e6a5a864fc9ff, %f20 = 000000ff ba2d00a3
	ldd	[%i5+0x038],%f20	! %f20 = a96e6a5a 864fc9ff
!	Mem[0000000030181408] = ff000000, %l3 = 0000000000000000
	ldsha	[%i6+%o4]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000010181400] = 000077daffffffff, %l3 = 0000000000000000
	ldxa	[%i6+%g0]0x88,%l3	! %l3 = 000077daffffffff
!	Mem[0000000010081408] = ff000000 ffffffff, %l2 = ffffffff, %l3 = ffffffff
	ldda	[%i2+0x008]%asi,%l2	! %l2 = 00000000ff000000 00000000ffffffff
!	Starting 10 instruction Store Burst
!	Mem[0000000020800040] = ffffac70, %l4 = ffff0000ffffffff
	ldstuba	[%o1+0x040]%asi,%l4	! %l4 = 000000ff000000ff

!	Check Point 47 for processor 0

	set	p0_check_pt_data_47,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 00000000ff000000
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 00000000000000c0
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 00000000ff000000
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 00000000ffffffff
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 000000000000ff00
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = ffffffffffff0000
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = ffffffff864fc963
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = ff0000ff 63c94f86
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x50],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = ff000000 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x58],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = 00000096 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x60],%g3
	std	%f12,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f12 = ff000000 1db4a5ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf12,%g1
	ldx	[%g4+0x68],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = a96e6a5a 864fc9ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1
	ldx	[%g4+0x70],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = 400913b6 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1
	ldx	[%g4+0x78],%g3
	std	%f28,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f28 = 400913b6 ff0000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf28,%g1
	ldx	[%g4+0x80],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = ffffffff 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 47 completed


p0_label_236:
!	%f24 = 400913b6 00000000, Mem[00000000300c1410] = ffffffff 000000ae
	stda	%f24,[%i3+%o5]0x81	! Mem[00000000300c1410] = 400913b6 00000000
!	Mem[0000000030041408] = 000000ff, %l3 = 00000000ffffffff
	swapa	[%i1+%o4]0x89,%l3	! %l3 = 00000000000000ff
!	%l3 = 00000000000000ff, Mem[0000000030001410] = ffffffff
	stba	%l3,[%i0+%o5]0x81	! Mem[0000000030001410] = ffffffff
!	%f6  = ffffffff, Mem[00000000300c1400] = 000000ff
	sta	%f6 ,[%i3+%g0]0x89	! Mem[00000000300c1400] = ffffffff
!	Mem[0000000030141408] = ffffffff, %l7 = ffffffff864fc963
	ldstuba	[%i5+%o4]0x81,%l7	! %l7 = 000000ff000000ff
!	%l7 = 00000000000000ff, Mem[0000000010101410] = 00000000ffffffff
	stxa	%l7,[%i4+%o5]0x88	! Mem[0000000010101410] = 00000000000000ff
!	%f24 = 400913b6 00000000, Mem[0000000010141400] = ae0000ff ff000000
	stda	%f24,[%i5+%g0]0x88	! Mem[0000000010141400] = 400913b6 00000000
!	%l3 = 00000000000000ff, Mem[0000000010081400] = ffffffff00000000
	stxa	%l3,[%i2+%g0]0x80	! Mem[0000000010081400] = 00000000000000ff
!	%f12 = ff000000 1db4a5ff, %l2 = 00000000ff000000
!	Mem[0000000010181408] = 000077da00000000
	add	%i6,0x008,%g1
	stda	%f12,[%g1+%l2]ASI_PST16_PL ! Mem[0000000010181408] = 000077da00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = ff0000ff, %l4 = 00000000000000ff
	lduba	[%i1+%o5]0x80,%l4	! %l4 = 00000000000000ff

p0_label_237:
!	Mem[0000000010181408] = da770000, %f31 = 00000000
	lda	[%i6+%o4]0x88,%f31	! %f31 = da770000
!	Mem[0000000030001408] = ffffffff, %l1 = 00000000000000c0
	lduwa	[%i0+%o4]0x89,%l1	! %l1 = 00000000ffffffff
!	Mem[0000000010101410] = ff00000000000000, %l6 = ffffffffffff0000
	ldxa	[%i4+%o5]0x80,%l6	! %l6 = ff00000000000000
!	Mem[0000000030141410] = ff0000ff, %l2 = 00000000ff000000
	ldswa	[%i5+%o5]0x89,%l2	! %l2 = ffffffffff0000ff
!	Mem[0000000030101400] = ff0000ff, %l0 = 00000000ff000000
	lduba	[%i4+%g0]0x81,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010101410] = ff000000, %f22 = ccbeffae
	lda	[%i4+%o5]0x80,%f22	! %f22 = ff000000
!	Mem[00000000300c1400] = 7f000000 ffffffff, %l2 = ff0000ff, %l3 = 000000ff
	ldda	[%i3+%g0]0x89,%l2	! %l2 = 00000000ffffffff 000000007f000000
!	Mem[0000000030081410] = 6a0000ff ff0000ff, %l6 = 00000000, %l7 = 000000ff
	ldda	[%i2+%o5]0x89,%l6	! %l6 = 00000000ff0000ff 000000006a0000ff
!	Mem[0000000010041410] = ff0000ff, %l5 = 000000000000ff00
	lduha	[%i1+%o5]0x88,%l5	! %l5 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l0 = 00000000000000ff, Mem[00000000300c1410] = 400913b6
	stba	%l0,[%i3+%o5]0x81	! Mem[00000000300c1410] = ff0913b6

p0_label_238:
!	Mem[0000000030001408] = ffffffff, %l5 = 00000000000000ff
	swapa	[%i0+%o4]0x89,%l5	! %l5 = 00000000ffffffff
!	Mem[0000000010001425] = ff0000ff, %l4 = 00000000000000ff
	ldstuba	[%i0+0x025]%asi,%l4	! %l4 = 00000000000000ff
!	%f10 = 00000096, Mem[0000000010141408] = 00000033
	sta	%f10,[%i5+%o4]0x88	! Mem[0000000010141408] = 00000096
!	%f15 = ffffffff, Mem[0000000030041400] = 63c94f86
	sta	%f15,[%i1+%g0]0x89	! Mem[0000000030041400] = ffffffff
!	%f4  = 0b3a0000, Mem[0000000030141410] = ff0000ff
	sta	%f4 ,[%i5+%o5]0x89	! Mem[0000000030141410] = 0b3a0000
!	%l6 = ff0000ff, %l7 = 6a0000ff, Mem[0000000010141408] = 96000000 00000000
	stda	%l6,[%i5+%o4]0x80	! Mem[0000000010141408] = ff0000ff 6a0000ff
!	Mem[00000000100c1410] = ff000000, %l6 = 00000000ff0000ff
	ldstuba	[%i3+%o5]0x80,%l6	! %l6 = 000000ff000000ff
!	Mem[0000000030001400] = 06fd1e0b, %l5 = 00000000ffffffff
	swapa	[%i0+%g0]0x81,%l5	! %l5 = 0000000006fd1e0b
!	Mem[0000000020800040] = ffffac70, %l7 = 000000006a0000ff
	ldstub	[%o1+0x040],%l7		! %l7 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = ffffffff, %l3 = 000000007f000000
	lduha	[%i6+%o5]0x88,%l3	! %l3 = 000000000000ffff

p0_label_239:
!	Mem[0000000010101400] = 00ffffff, %l6 = 00000000000000ff
	ldsha	[%i4+%g0]0x80,%l6	! %l6 = 00000000000000ff
!	%l2 = 00000000ffffffff, immed = fffffe24, %y  = 00000069
	udiv	%l2,-0x1dc,%l4		! %l4 = 000000000000006a
	mov	%l0,%y			! %y = 000000ff
!	Mem[0000000030101408] = 000000ff, %l6 = 00000000000000ff
	ldsha	[%i4+%o4]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010081408] = 000000ff, %l6 = 00000000000000ff
	ldsha	[%i2+%o4]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010081408] = ff000000, %l3 = 000000000000ffff
	lduwa	[%i2+%o4]0x80,%l3	! %l3 = 00000000ff000000
!	Mem[000000001008140c] = ffffffff, %l0 = 00000000000000ff
	ldub	[%i2+0x00f],%l0		! %l0 = 00000000000000ff
!	Mem[0000000030101410] = da770000ba2d00a3, %f4  = 0b3a0000 ba2d00a3
	ldda	[%i4+%o5]0x81,%f4 	! %f4  = da770000 ba2d00a3
!	Mem[0000000010181410] = ffffffff, %l0 = 00000000000000ff
	lduwa	[%i6+%o5]0x80,%l0	! %l0 = 00000000ffffffff
!	Mem[00000000300c1408] = ffffffff00000000, %f14 = ff000000 ffffffff
	ldda	[%i3+%o4]0x89,%f14	! %f14 = ffffffff 00000000
!	Starting 10 instruction Store Burst
!	%f14 = ffffffff 00000000, Mem[0000000010041408] = 000000ff ffa5b41d
	stda	%f14,[%i1+%o4]0x88	! Mem[0000000010041408] = ffffffff 00000000

p0_label_240:
!	Mem[0000000010101433] = 77da1f96, %l6 = 00000000000000ff
	ldstuba	[%i4+0x033]%asi,%l6	! %l6 = 00000096000000ff
!	Mem[0000000021800100] = 00ffb49a, %l6 = 0000000000000096
	ldstub	[%o3+0x100],%l6		! %l6 = 00000000000000ff
!	Mem[0000000030141400] = ff0000ff, %l1 = 00000000ffffffff
	ldstuba	[%i5+%g0]0x81,%l1	! %l1 = 000000ff000000ff
!	Mem[0000000010141413] = ff0000ff, %l0 = 00000000ffffffff
	ldstuba	[%i5+0x013]%asi,%l0	! %l0 = 000000ff000000ff
!	Mem[0000000010101408] = 00000000, %l2 = 00000000ffffffff
	ldstuba	[%i4+%o4]0x80,%l2	! %l2 = 00000000000000ff
!	%f20 = a96e6a5a 864fc9ff, %l5 = 0000000006fd1e0b
!	Mem[0000000030141408] = ffffffffff72a546
	add	%i5,0x008,%g1
	stda	%f20,[%g1+%l5]ASI_PST32_S ! Mem[0000000030141408] = a96e6a5a864fc9ff
!	Mem[000000001008141c] = ffffffff, %l5 = 0000000006fd1e0b, %asi = 80
	swapa	[%i2+0x01c]%asi,%l5	! %l5 = 00000000ffffffff
!	Mem[0000000030181400] = 00000000, %l4 = 000000000000006a
	ldstuba	[%i6+%g0]0x81,%l4	! %l4 = 00000000000000ff
!	Mem[00000000201c0001] = ffffaf65, %l6 = 0000000000000000
	ldstub	[%o0+0x001],%l6		! %l6 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = ff0913b6, %l1 = 00000000000000ff
	ldsha	[%i3+%o5]0x81,%l1	! %l1 = ffffffffffffff09

!	Check Point 48 for processor 0

	set	p0_check_pt_data_48,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = ffffffffffffff09
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 0000000000000000
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 00000000ff000000
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 0000000000000000
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 00000000ffffffff
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = ff000000 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x50],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = da770000 ba2d00a3
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x58],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = ffffffff ffffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x60],%g3
	std	%f14,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f14 = ffffffff 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf14,%g1
	ldx	[%g4+0x68],%g3
	std	%f22,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f22 = ff000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf22,%g1
	ldx	[%g4+0x70],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = ffffffff da770000
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 48 completed


p0_label_241:
!	Mem[000000001018142c] = ff000000, %l5 = 00000000ffffffff
	ldsha	[%i6+0x02c]%asi,%l5	! %l5 = ffffffffffffff00
!	Mem[0000000010101408] = 000000ff, %l2 = 0000000000000000
	ldsha	[%i4+%o4]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030101400] = ff0000ff, %f31 = da770000
	lda	[%i4+%g0]0x81,%f31	! %f31 = ff0000ff
!	Mem[0000000010001400] = ff0000ff, %f30 = ffffffff
	lda	[%i0+%g0]0x88,%f30	! %f30 = ff0000ff
!	Mem[0000000010181410] = ffffffff, %l5 = ffffffffffffff00
	ldswa	[%i6+%o5]0x88,%l5	! %l5 = ffffffffffffffff
!	Mem[00000000300c1410] = b61309ff, %f17 = ffffffff
	lda	[%i3+%o5]0x89,%f17	! %f17 = b61309ff
!	Mem[0000000020800040] = ffffac70, %l1 = ffffffffffffff09
	ldub	[%o1+0x041],%l1		! %l1 = 00000000000000ff
!	Mem[0000000010181410] = ffffffff, %l3 = 00000000ff000000
	lduwa	[%i6+%o5]0x88,%l3	! %l3 = 00000000ffffffff
!	Mem[0000000010181410] = ffffffff, %l3 = 00000000ffffffff
	lduha	[%i6+%o5]0x88,%l3	! %l3 = 000000000000ffff
!	Starting 10 instruction Store Burst
!	Mem[00000000211c0000] = ffff7bbb, %l6 = 00000000000000ff
	ldstub	[%o2+%g0],%l6		! %l6 = 000000ff000000ff

p0_label_242:
!	%l4 = 00000000, %l5 = ffffffff, Mem[0000000010181408] = da770000 00000000
	stda	%l4,[%i6+%o4]0x88	! Mem[0000000010181408] = 00000000 ffffffff
!	%l3 = 000000000000ffff, Mem[0000000030181408] = 00000000ff000000
	stxa	%l3,[%i6+%o4]0x89	! Mem[0000000030181408] = 000000000000ffff
!	Mem[0000000010101408] = 000000ff, %l4 = 0000000000000000
	swapa	[%i4+%o4]0x88,%l4	! %l4 = 00000000000000ff
!	%l4 = 00000000000000ff, Mem[0000000010081400] = 00000000000000ff
	stx	%l4,[%i2+%g0]		! Mem[0000000010081400] = 00000000000000ff
!	%l3 = 000000000000ffff, Mem[00000000211c0001] = ffff7bbb, %asi = 80
	stba	%l3,[%o2+0x001]%asi	! Mem[00000000211c0000] = ffff7bbb
!	Mem[000000001014140b] = ff0000ff, %l2 = 00000000000000ff
	ldstub	[%i5+0x00b],%l2		! %l2 = 000000ff000000ff
!	%l7 = 00000000000000ff, Mem[0000000010001408] = ff000000, %asi = 80
	stwa	%l7,[%i0+0x008]%asi	! Mem[0000000010001408] = 000000ff
!	Mem[0000000010001400] = ff0000ff63c94f86, %l3 = 000000000000ffff, %l0 = 00000000000000ff
	casxa	[%i0]0x80,%l3,%l0	! %l0 = ff0000ff63c94f86
!	%l6 = 00000000000000ff, Mem[0000000010041424] = 00000000
	sth	%l6,[%i1+0x024]		! Mem[0000000010041424] = 00ff0000
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = 00000000, %f24 = 400913b6
	lda	[%i4+%o4]0x80,%f24	! %f24 = 00000000

p0_label_243:
!	Mem[00000000100c1408] = ff00000000000000, %l5 = ffffffffffffffff
	ldxa	[%i3+0x008]%asi,%l5	! %l5 = ff00000000000000
!	Mem[0000000030001400] = ffffffff, %l7 = 00000000000000ff
	ldsha	[%i0+%g0]0x81,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000030041400] = ff0000ffffffffff, %l7 = ffffffffffffffff
	ldxa	[%i1+%g0]0x89,%l7	! %l7 = ff0000ffffffffff
!	Mem[00000000100c1410] = 000000ff, %l4 = 00000000000000ff
	lduba	[%i3+%o5]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010101410] = 000000ff, %f27 = ba2d00a3
	lda	[%i4+%o5]0x88,%f27	! %f27 = 000000ff
!	Mem[0000000030081400] = ffffffff, %l1 = 00000000000000ff
	ldsba	[%i2+%g0]0x89,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010181408] = 00000000, %l6 = 00000000000000ff
	ldswa	[%i6+%o4]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000010141408] = ff0000ff, %l0 = ff0000ff63c94f86
	ldsh	[%i5+0x00a],%l0		! %l0 = 00000000000000ff
!	Mem[0000000030081400] = ffffffff000000ff, %f22 = ff000000 00000000
	ldda	[%i2+%g0]0x81,%f22	! %f22 = ffffffff 000000ff
!	Starting 10 instruction Store Burst
!	%l7 = ff0000ffffffffff, Mem[0000000010041400] = 00000096
	stwa	%l7,[%i1+%g0]0x80	! Mem[0000000010041400] = ffffffff

p0_label_244:
!	Mem[0000000010181408] = 00000000, %l4 = 00000000000000ff
	ldstuba	[%i6+%o4]0x80,%l4	! %l4 = 00000000000000ff
!	%l5 = ff00000000000000, Mem[00000000100c142c] = 00000000
	stw	%l5,[%i3+0x02c]		! Mem[00000000100c142c] = 00000000
!	%f8  = 400913b6 ff0000ff, Mem[0000000030081410] = ff0000ff ff00006a
	stda	%f8 ,[%i2+%o5]0x81	! Mem[0000000030081410] = 400913b6 ff0000ff
!	%l5 = ff00000000000000, Mem[0000000030141408] = a96e6a5a864fc9ff
	stxa	%l5,[%i5+%o4]0x81	! Mem[0000000030141408] = ff00000000000000
!	%l7 = ff0000ffffffffff, Mem[0000000010081434] = 00000046
	stb	%l7,[%i2+0x034]		! Mem[0000000010081434] = ff000046
!	Mem[000000001010142e] = ff000000, %l6 = 0000000000000000
	ldstuba	[%i4+0x02e]%asi,%l6	! %l6 = 00000000000000ff
!	Mem[00000000100c143c] = 00000000, %l1 = ffffffffffffffff, %asi = 80
	swapa	[%i3+0x03c]%asi,%l1	! %l1 = 0000000000000000
!	Mem[0000000030181400] = ff000000, %l3 = 000000000000ffff
	swapa	[%i6+%g0]0x81,%l3	! %l3 = 00000000ff000000
!	%l7 = ff0000ffffffffff, Mem[0000000010001408] = ff000000ff000000
	stxa	%l7,[%i0+%o4]0x88	! Mem[0000000010001408] = ff0000ffffffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000030101410] = 000077da, %l5 = ff00000000000000
	lduha	[%i4+%o5]0x89,%l5	! %l5 = 00000000000077da

p0_label_245:
!	Mem[000000001010143c] = 0b009e16, %l0 = 00000000000000ff
	lduw	[%i4+0x03c],%l0		! %l0 = 000000000b009e16
!	Mem[0000000010181410] = ffffffff0000ffff, %l2 = 00000000000000ff
	ldxa	[%i6+%o5]0x80,%l2	! %l2 = ffffffff0000ffff
!	Mem[0000000030001400] = ffffffff, %l4 = 0000000000000000
	ldsha	[%i0+%g0]0x81,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010001400] = ff0000ff, %l3 = 00000000ff000000
	ldsba	[%i0+%g0]0x88,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000030081400] = ffffffff 000000ff, %l6 = 00000000, %l7 = ffffffff
	ldda	[%i2+%g0]0x81,%l6	! %l6 = 00000000ffffffff 00000000000000ff
!	Mem[0000000010081410] = 0000ffff, %f25 = 00000000
	lda	[%i2+%o5]0x88,%f25	! %f25 = 0000ffff
!	Code Fragment 4
p0_fragment_8:
!	%l0 = 000000000b009e16
	setx	0x31fd94f7bd0452e4,%g7,%l0 ! %l0 = 31fd94f7bd0452e4
!	%l1 = 0000000000000000
	setx	0xb53313f073472207,%g7,%l1 ! %l1 = b53313f073472207
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 31fd94f7bd0452e4
	setx	0x5b45efefadd212bd,%g7,%l0 ! %l0 = 5b45efefadd212bd
!	%l1 = b53313f073472207
	setx	0x0a5f699054c38bdb,%g7,%l1 ! %l1 = 0a5f699054c38bdb
!	Mem[0000000030101400] = ff0000ff, %l5 = 00000000000077da
	ldswa	[%i4+%g0]0x89,%l5	! %l5 = ffffffffff0000ff
!	Mem[0000000030081400] = ffffffff, %f11 = 00000000
	lda	[%i2+%g0]0x89,%f11	! %f11 = ffffffff
!	Starting 10 instruction Store Burst
!	%l1 = 0a5f699054c38bdb, Mem[0000000010141408] = ff0000ff
	stha	%l1,[%i5+%o4]0x88	! Mem[0000000010141408] = ff008bdb

!	Check Point 49 for processor 0

	set	p0_check_pt_data_49,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 5b45efefadd212bd
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 0a5f699054c38bdb
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = ffffffff0000ffff
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = ffffffffffffffff
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = ffffffffffffffff
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = ffffffffff0000ff
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 00000000ffffffff
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = ffffffff ffffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x50],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = 00000096 ffffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x58],%g3
	std	%f16,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f16 = 00000000 b61309ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf16,%g1
	ldx	[%g4+0x60],%g3
	std	%f22,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f22 = ffffffff 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf22,%g1
	ldx	[%g4+0x68],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = 00000000 0000ffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1
	ldx	[%g4+0x70],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = da770000 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1
	ldx	[%g4+0x78],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = ff0000ff ff0000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 49 completed


p0_label_246:
!	Mem[00000000100c1432] = ffffffff, %l5 = ffffffffff0000ff
	ldstuba	[%i3+0x032]%asi,%l5	! %l5 = 000000ff000000ff
!	%l4 = ffffffffffffffff, Mem[00000000100c1400] = ff000000
	stha	%l4,[%i3+%g0]0x88	! Mem[00000000100c1400] = ff00ffff
!	%l1 = 0a5f699054c38bdb, Mem[0000000010001400] = ff0000ff
	stwa	%l1,[%i0+%g0]0x80	! Mem[0000000010001400] = 54c38bdb
!	Mem[0000000010041400] = ffffffff, %l0 = 5b45efefadd212bd
	swapa	[%i1+%g0]0x88,%l0	! %l0 = 00000000ffffffff
!	Mem[0000000030001410] = ffffffff, %l7 = 00000000000000ff
	ldstuba	[%i0+%o5]0x89,%l7	! %l7 = 000000ff000000ff
!	%f16 = 00000000 b61309ff, Mem[0000000030041408] = ffffffff 000000ff
	stda	%f16,[%i1+%o4]0x81	! Mem[0000000030041408] = 00000000 b61309ff
!	%f20 = a96e6a5a 864fc9ff, Mem[0000000030001410] = ffffffff 000000ff
	stda	%f20,[%i0+%o5]0x89	! Mem[0000000030001410] = a96e6a5a 864fc9ff
!	%f20 = a96e6a5a 864fc9ff, Mem[0000000010101408] = 00000000 00000000
	stda	%f20,[%i4+%o4]0x80	! Mem[0000000010101408] = a96e6a5a 864fc9ff
!	Mem[00000000100c1400] = ffff00ff, %l5 = 00000000000000ff
	swapa	[%i3+%g0]0x80,%l5	! %l5 = 00000000ffff00ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = ffffffff, %l5 = 00000000ffff00ff
	ldsba	[%i1+%g0]0x81,%l5	! %l5 = ffffffffffffffff

p0_label_247:
!	Mem[00000000300c1410] = ff0913b6, %l7 = 00000000000000ff
	lduwa	[%i3+%o5]0x81,%l7	! %l7 = 00000000ff0913b6
!	Mem[0000000030041410] = a3002dba, %l5 = ffffffffffffffff
	lduba	[%i1+%o5]0x81,%l5	! %l5 = 00000000000000a3
!	Mem[0000000030001410] = ffc94f86, %l0 = 00000000ffffffff
	ldswa	[%i0+%o5]0x81,%l0	! %l0 = ffffffffffc94f86
!	Mem[0000000030081410] = b6130940, %l5 = 00000000000000a3
	ldsha	[%i2+%o5]0x89,%l5	! %l5 = 0000000000000940
!	Mem[0000000010101408] = a96e6a5a, %l7 = 00000000ff0913b6
	lduha	[%i4+%o4]0x80,%l7	! %l7 = 000000000000a96e
!	Mem[00000000100c1428] = 0000000000000000, %l7 = 000000000000a96e
	ldxa	[%i3+0x028]%asi,%l7	! %l7 = 0000000000000000
!	Mem[0000000030101410] = 000077da, %l1 = 0a5f699054c38bdb
	ldsha	[%i4+%o5]0x89,%l1	! %l1 = 00000000000077da
!	Mem[0000000030041410] = a3002dba, %l7 = 0000000000000000
	ldswa	[%i1+%o5]0x81,%l7	! %l7 = ffffffffa3002dba
!	Mem[0000000030101408] = 000000ff, %l0 = ffffffffffc94f86
	ldswa	[%i4+%o4]0x89,%l0	! %l0 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1400] = ff000000, %l1 = 00000000000077da
	swapa	[%i3+%g0]0x88,%l1	! %l1 = 00000000ff000000

p0_label_248:
!	Mem[00000000300c1410] = ff0913b6, %l5 = 0000000000000940
	ldstuba	[%i3+%o5]0x81,%l5	! %l5 = 000000ff000000ff
!	Mem[00000000218001c0] = ffff397e, %l6 = 00000000ffffffff
	ldstub	[%o3+0x1c0],%l6		! %l6 = 000000ff000000ff
!	%l4 = ffffffff, %l5 = 000000ff, Mem[0000000010081400] = 00000000 000000ff
	std	%l4,[%i2+%g0]		! Mem[0000000010081400] = ffffffff 000000ff
!	Mem[0000000030081408] = ffff0000, %l0 = 00000000000000ff
	ldstuba	[%i2+%o4]0x81,%l0	! %l0 = 000000ff000000ff
!	Mem[0000000010101400] = 00ffffff, %l4 = ffffffff, %l5 = 000000ff
	casa	[%i4]0x80,%l4,%l5	! %l5 = 0000000000ffffff
!	Mem[0000000010101408] = a96e6a5a, %l1 = 00000000ff000000
	ldstuba	[%i4+%o4]0x80,%l1	! %l1 = 000000a9000000ff
!	Mem[0000000030041408] = 00000000, %l6 = 00000000000000ff
	swapa	[%i1+%o4]0x81,%l6	! %l6 = 0000000000000000
!	Mem[00000000300c1400] = ffffffff, %l6 = 0000000000000000
	ldstuba	[%i3+%g0]0x81,%l6	! %l6 = 000000ff000000ff
!	%l1 = 00000000000000a9, Mem[0000000030041408] = 000000ff
	stha	%l1,[%i1+%o4]0x81	! Mem[0000000030041408] = 00a900ff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = 000000ff, %l5 = 0000000000ffffff
	ldsha	[%i3+%o4]0x88,%l5	! %l5 = 00000000000000ff

p0_label_249:
!	Mem[00000000211c0000] = ffff7bbb, %l5 = 00000000000000ff
	ldsba	[%o2+0x000]%asi,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000030181408] = 0000ffff, %l3 = ffffffffffffffff
	lduba	[%i6+%o4]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[00000000100c1408] = ff000000, %l2 = ffffffff0000ffff
	lduba	[%i3+%o4]0x80,%l2	! %l2 = 00000000000000ff
!	Mem[00000000100c1408] = ff00000000000000, %l1 = 00000000000000a9
	ldxa	[%i3+%o4]0x80,%l1	! %l1 = ff00000000000000
!	Mem[0000000010001408] = ff0000ffffffffff, %f24 = 00000000 0000ffff
	ldda	[%i0+%o4]0x88,%f24	! %f24 = ff0000ff ffffffff
!	Mem[00000000201c0000] = ffffaf65, %l5 = ffffffffffffffff
	ldsb	[%o0+%g0],%l5		! %l5 = ffffffffffffffff
!	Mem[0000000010141408] = db8b00ff, %l4 = ffffffffffffffff
	ldsba	[%i5+%o4]0x80,%l4	! %l4 = ffffffffffffffdb
	membar	#Sync			! Added by membar checker (51)
!	Mem[0000000030081400] = ffffffff 000000ff ffff0000 00009eff
!	Mem[0000000030081410] = 400913b6 ff0000ff 00000000 dc003118
!	Mem[0000000030081420] = ffffffff 06fd1eff 000000ae 00000000
!	Mem[0000000030081430] = ffffffff ffff0000 ff000000 a5000000
	ldda	[%i2]ASI_BLK_S,%f0	! Block Load from 0000000030081400
!	Mem[0000000010001408] = ff0000ff ffffffff, %l4 = ffffffdb, %l5 = ffffffff
	ldda	[%i0+%o4]0x88,%l4	! %l4 = 00000000ffffffff 00000000ff0000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000030081408] = 0000ffff, %l7 = ffffffffa3002dba
	ldstuba	[%i2+%o4]0x89,%l7	! %l7 = 000000ff000000ff

p0_label_250:
!	Mem[0000000010081408] = 000000ff, %l6 = 00000000000000ff
	ldstuba	[%i2+%o4]0x88,%l6	! %l6 = 000000ff000000ff
!	%l3 = 00000000000000ff, Mem[000000001018142e] = ff000000, %asi = 80
	stha	%l3,[%i6+0x02e]%asi	! Mem[000000001018142c] = ff0000ff
!	Mem[0000000010101410] = ff000000, %l4 = 00000000ffffffff
	ldstuba	[%i4+%o5]0x80,%l4	! %l4 = 000000ff000000ff
!	%l1 = ff00000000000000, Mem[0000000030141400] = ff0000ff
	stba	%l1,[%i5+%g0]0x81	! Mem[0000000030141400] = 000000ff
!	%f18 = ff000000 000000ff, Mem[0000000010081410] = 0000ffff 000000ff
	stda	%f18,[%i2+%o5]0x88	! Mem[0000000010081410] = ff000000 000000ff
!	%f26 = da770000 000000ff, Mem[0000000010141430] = ffffffff 00000000
	std	%f26,[%i5+0x030]	! Mem[0000000010141430] = da770000 000000ff
!	%f27 = 000000ff, Mem[0000000010081400] = ffffffff
	sta	%f27,[%i2+%g0]0x80	! Mem[0000000010081400] = 000000ff
!	Mem[00000000100c1410] = 000000ff, %l2 = 00000000000000ff
	ldstuba	[%i3+%o5]0x88,%l2	! %l2 = 000000ff000000ff
!	Mem[0000000010141408] = ff008bdb, %l6 = 00000000000000ff
	ldstuba	[%i5+%o4]0x88,%l6	! %l6 = 000000db000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = 0000ffff, %l6 = 00000000000000db
	lduba	[%i6+%o4]0x89,%l6	! %l6 = 00000000000000ff

!	Check Point 50 for processor 0

	set	p0_check_pt_data_50,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = ff00000000000000
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 00000000ff0000ff
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = ffffffff 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x50],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = ffff0000 00009eff
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x58],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 400913b6 ff0000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x60],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 00000000 dc003118
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x68],%g3
	std	%f8,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f8 = ffffffff 06fd1eff
	bne	%xcc,p0_freg_check_fail
	mov	0xf08,%g1
	ldx	[%g4+0x70],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = 000000ae 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x78],%g3
	std	%f12,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f12 = ffffffff ffff0000
	bne	%xcc,p0_freg_check_fail
	mov	0xf12,%g1
	ldx	[%g4+0x80],%g3
	std	%f14,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f14 = ff000000 a5000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf14,%g1
	ldx	[%g4+0x88],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = ff0000ff ffffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1

!	Check Point 50 completed


p0_label_251:
!	Mem[0000000010081410] = 000000ff, %l3 = 00000000000000ff
	ldsba	[%i2+%o5]0x88,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010081410] = 000000ff, %l1 = ff00000000000000
	ldswa	[%i2+%o5]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010101408] = ff6e6a5a864fc9ff, %l4 = 00000000000000ff
	ldxa	[%i4+%o4]0x80,%l4	! %l4 = ff6e6a5a864fc9ff
!	Mem[00000000300c1400] = ffffffff, %l5 = 00000000ff0000ff
	lduba	[%i3+%g0]0x81,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010141420] = ccbeffae, %l6 = 00000000000000ff
	ldsh	[%i5+0x020],%l6		! %l6 = ffffffffffffccbe
!	Mem[0000000010041400] = ffff0000add212bd, %f10 = 000000ae 00000000
	ldda	[%i1+%g0]0x88,%f10	! %f10 = ffff0000 add212bd
!	Mem[0000000010101410] = ff000000, %l0 = 00000000000000ff
	lduha	[%i4+%o5]0x80,%l0	! %l0 = 000000000000ff00
!	Mem[0000000030081400] = ff000000 ffffffff, %l4 = 864fc9ff, %l5 = 000000ff
	ldda	[%i2+%g0]0x89,%l4	! %l4 = 00000000ffffffff 00000000ff000000
!	Mem[0000000010001400] = 54c38bdb, %f0  = ffffffff
	lda	[%i0+%g0]0x80,%f0 	! %f0 = 54c38bdb
!	Starting 10 instruction Store Burst
!	%l0 = 0000ff00, %l1 = 000000ff, Mem[0000000010041408] = 00000000 ffffffff
	stda	%l0,[%i1+%o4]0x88	! Mem[0000000010041408] = 0000ff00 000000ff

p0_label_252:
!	%f0  = 54c38bdb 000000ff, %l4 = 00000000ffffffff
!	Mem[0000000010001418] = ffffffffda770000
	add	%i0,0x018,%g1
	stda	%f0,[%g1+%l4]ASI_PST16_P ! Mem[0000000010001418] = 54c38bdb000000ff
!	%f2  = ffff0000, Mem[0000000010141408] = ff008bff
	sta	%f2 ,[%i5+%o4]0x88	! Mem[0000000010141408] = ffff0000
!	Mem[0000000030141408] = 000000ff, %l2 = 00000000000000ff
	swapa	[%i5+%o4]0x89,%l2	! %l2 = 00000000000000ff
!	%l1 = 00000000000000ff, Mem[0000000030101410] = da770000
	stha	%l1,[%i4+%o5]0x81	! Mem[0000000030101410] = 00ff0000
!	%l4 = 00000000ffffffff, Mem[0000000021800080] = 8bedd5df, %asi = 80
	stha	%l4,[%o3+0x080]%asi	! Mem[0000000021800080] = ffffd5df
!	%l1 = 00000000000000ff, Mem[0000000010141408] = ffff0000
	stha	%l1,[%i5+%o4]0x88	! Mem[0000000010141408] = ffff00ff
!	Mem[0000000030181410] = ff000000, %l3 = ffffffffffffffff
	swapa	[%i6+%o5]0x81,%l3	! %l3 = 00000000ff000000
!	Mem[0000000010041410] = ff0000ff, %l4 = 00000000ffffffff
	swapa	[%i1+%o5]0x80,%l4	! %l4 = 00000000ff0000ff
!	%l0 = 000000000000ff00, Mem[0000000010141428] = 00000000, %asi = 80
	stba	%l0,[%i5+0x028]%asi	! Mem[0000000010141428] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = ff9e00000000ffff, %l4 = 00000000ff0000ff
	ldxa	[%i2+%o4]0x89,%l4	! %l4 = ff9e00000000ffff

p0_label_253:
!	Mem[0000000010101410] = ff000000, %l2 = 00000000000000ff
	lduha	[%i4+%o5]0x80,%l2	! %l2 = 000000000000ff00
!	Mem[00000000300c1400] = ffffffff, %l0 = 000000000000ff00
	ldsha	[%i3+%g0]0x81,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010101408] = ff6e6a5a, %l4 = ff9e00000000ffff
	ldsba	[%i4+%o4]0x80,%l4	! %l4 = ffffffffffffffff
!	Mem[00000000100c1400] = da770000, %l6 = ffffffffffffccbe
	lduba	[%i3+%g0]0x80,%l6	! %l6 = 00000000000000da
!	Mem[0000000030181400] = ffff0000, %l3 = 00000000ff000000
	ldsha	[%i6+%g0]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000030081410] = 400913b6ff0000ff, %f6  = 00000000 dc003118
	ldda	[%i2+%o5]0x81,%f6 	! %f6  = 400913b6 ff0000ff
!	Mem[0000000030001410] = ffc94f86, %l4 = ffffffffffffffff
	lduha	[%i0+%o5]0x81,%l4	! %l4 = 000000000000ffc9
!	Mem[0000000030081408] = 0000ffff, %l6 = 00000000000000da
	lduba	[%i2+%o4]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030141408] = 00000000000000ff, %l0 = ffffffffffffffff
	ldxa	[%i5+%o4]0x89,%l0	! %l0 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l3 = 0000000000000000, Mem[0000000030101408] = ff000000000000ff
	stxa	%l3,[%i4+%o4]0x89	! Mem[0000000030101408] = 0000000000000000

p0_label_254:
!	%f16 = 00000000 b61309ff, %l6 = 00000000000000ff
!	Mem[0000000030001428] = 63c94f8600000000
	add	%i0,0x028,%g1
	stda	%f16,[%g1+%l6]ASI_PST32_S ! Mem[0000000030001428] = 00000000b61309ff
!	%l3 = 0000000000000000, Mem[0000000010141428] = 00000000000000ff, %asi = 80
	stxa	%l3,[%i5+0x028]%asi	! Mem[0000000010141428] = 0000000000000000
!	%f16 = 00000000 b61309ff ff000000 000000ff
!	%f20 = a96e6a5a 864fc9ff ffffffff 000000ff
!	%f24 = ff0000ff ffffffff da770000 000000ff
!	%f28 = 400913b6 ff0000ff ff0000ff ff0000ff
	stda	%f16,[%i1]ASI_COMMIT_S	! Block Store to 0000000030041400
!	%f0  = 54c38bdb, Mem[0000000010081410] = ff000000
	sta	%f0 ,[%i2+%o5]0x80	! Mem[0000000010081410] = 54c38bdb
	membar	#Sync			! Added by membar checker (52)
!	%f10 = ffff0000, Mem[0000000030041408] = ff000000
	sta	%f10,[%i1+%o4]0x81	! Mem[0000000030041408] = ffff0000
!	Mem[0000000010141408] = ff00ffff, %l5 = ff000000, %l7 = 000000ff
	add	%i5,0x08,%g1
	casa	[%g1]0x80,%l5,%l7	! %l7 = 00000000ff00ffff
!	%f28 = 400913b6, Mem[0000000030001400] = ffffffff
	sta	%f28,[%i0+%g0]0x89	! Mem[0000000030001400] = 400913b6
!	Mem[0000000010141400] = 00000000, %l2 = 000000000000ff00
	ldstuba	[%i5+%g0]0x88,%l2	! %l2 = 00000000000000ff
!	%f7  = ff0000ff, Mem[0000000010141408] = ff00ffff
	sta	%f7 ,[%i5+%o4]0x80	! Mem[0000000010141408] = ff0000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = ffffffff, %l3 = 0000000000000000
	lduha	[%i6+%g0]0x88,%l3	! %l3 = 000000000000ffff

p0_label_255:
!	Mem[0000000030041410] = a96e6a5a864fc9ff, %f16 = 00000000 b61309ff
	ldda	[%i1+%o5]0x81,%f16	! %f16 = a96e6a5a 864fc9ff
!	Mem[0000000030181410] = ffffffff, %l6 = 00000000000000ff
	ldsha	[%i6+%o5]0x89,%l6	! %l6 = ffffffffffffffff
!	Mem[00000000300c1408] = 00000000, %f20 = a96e6a5a
	lda	[%i3+%o4]0x81,%f20	! %f20 = 00000000
!	Mem[0000000010101408] = 5a6a6eff, %l3 = 000000000000ffff
	lduba	[%i4+%o4]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010181428] = 00000000, %l1 = 00000000000000ff
	ldub	[%i6+0x02a],%l1		! %l1 = 0000000000000000
!	Mem[0000000010001408] = ffffffff, %l3 = 00000000000000ff
	lduha	[%i0+%o4]0x80,%l3	! %l3 = 000000000000ffff
!	Mem[0000000030181410] = ffffffff, %l7 = 00000000ff00ffff
	lduba	[%i6+%o5]0x81,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030081410] = 400913b6, %l3 = 000000000000ffff
	ldsba	[%i2+%o5]0x81,%l3	! %l3 = 0000000000000040
!	Mem[0000000020800040] = ffffac70, %l7 = 00000000000000ff
	ldsha	[%o1+0x040]%asi,%l7	! %l7 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l0 = 00000000000000ff, Mem[0000000010141408] = ff0000ff
	stha	%l0,[%i5+%o4]0x88	! Mem[0000000010141408] = ff0000ff

!	Check Point 51 for processor 0

	set	p0_check_pt_data_51,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 0000000000000000
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 0000000000000000
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 0000000000000040
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 000000000000ffc9
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 00000000ff000000
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = ffffffffffffffff
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = ffffffffffffffff
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = 54c38bdb 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x50],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 400913b6 ff0000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x58],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 400913b6 ff0000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x60],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = ffff0000 add212bd
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x68],%g3
	std	%f16,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f16 = a96e6a5a 864fc9ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf16,%g1
	ldx	[%g4+0x70],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = 00000000 864fc9ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1

!	Check Point 51 completed


p0_label_256:
!	%l7 = ffffffffffffffff, Mem[0000000030081400] = ffffffff
	stha	%l7,[%i2+%g0]0x81	! Mem[0000000030081400] = ffffffff
!	Mem[00000000100c1408] = 000000ff, %l1 = 0000000000000000
	swapa	[%i3+%o4]0x88,%l1	! %l1 = 00000000000000ff
!	%l4 = 000000000000ffc9, Mem[0000000030001408] = ff00000000003a0b
	stxa	%l4,[%i0+%o4]0x81	! Mem[0000000030001408] = 000000000000ffc9
!	%l2 = 0000000000000000, Mem[0000000010041400] = bd12d2ad0000ffff
	stxa	%l2,[%i1+%g0]0x80	! Mem[0000000010041400] = 0000000000000000
!	%l0 = 00000000000000ff, Mem[0000000010041400] = 00000000
	stha	%l0,[%i1+%g0]0x88	! Mem[0000000010041400] = 000000ff
!	%f17 = 864fc9ff, Mem[0000000010101408] = ff6e6a5a
	sta	%f17,[%i4+%o4]0x80	! Mem[0000000010101408] = 864fc9ff
!	%l1 = 00000000000000ff, Mem[00000000300c1410] = 00000000b61309ff
	stxa	%l1,[%i3+%o5]0x89	! Mem[00000000300c1410] = 00000000000000ff
!	%l0 = 00000000000000ff, Mem[0000000030081408] = 0000ffff
	stha	%l0,[%i2+%o4]0x89	! Mem[0000000030081408] = 000000ff
!	%l4 = 0000ffc9, %l5 = ff000000, Mem[0000000010041408] = 00ff0000 ff000000
	stda	%l4,[%i1+%o4]0x80	! Mem[0000000010041408] = 0000ffc9 ff000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030001400] = b6130940, %l7 = ffffffffffffffff
	ldsba	[%i0+%g0]0x81,%l7	! %l7 = ffffffffffffffb6

p0_label_257:
!	Mem[0000000030081410] = 400913b6, %l1 = 00000000000000ff
	ldsba	[%i2+%o5]0x81,%l1	! %l1 = 0000000000000040
!	Mem[0000000030081400] = ffffffff, %l7 = ffffffffffffffb6
	lduwa	[%i2+%g0]0x81,%l7	! %l7 = 00000000ffffffff
!	Mem[00000000100c1410] = 000000ff, %f5  = ff0000ff
	lda	[%i3+%o5]0x88,%f5 	! %f5 = 000000ff
!	Mem[0000000010001408] = ffffffff, %l5 = 00000000ff000000
	lduba	[%i0+%o4]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010141418] = 00000000, %l0 = 00000000000000ff
	ldsh	[%i5+0x018],%l0		! %l0 = 0000000000000000
!	Mem[0000000010041410] = ffffffff, %l1 = 0000000000000040
	ldsba	[%i1+%o5]0x88,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000030181410] = ffffffff, %l1 = ffffffffffffffff
	ldsha	[%i6+%o5]0x81,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000020800000] = ffff7d94, %l1 = ffffffffffffffff
	lduha	[%o1+0x000]%asi,%l1	! %l1 = 000000000000ffff
!	Mem[0000000010041400] = 00000000000000ff, %f26 = da770000 000000ff
	ldda	[%i1+%g0]0x88,%f26	! %f26 = 00000000 000000ff
!	Starting 10 instruction Store Burst
!	%l7 = 00000000ffffffff, Mem[0000000030181400] = 0000ffffff0000ff
	stxa	%l7,[%i6+%g0]0x81	! Mem[0000000030181400] = 00000000ffffffff

p0_label_258:
!	%f0  = 54c38bdb 000000ff, Mem[0000000010001410] = 00003a0b a3002dba
	stda	%f0 ,[%i0+%o5]0x88	! Mem[0000000010001410] = 54c38bdb 000000ff
!	%f16 = a96e6a5a 864fc9ff ff000000 000000ff
!	%f20 = 00000000 864fc9ff ffffffff 000000ff
!	%f24 = ff0000ff ffffffff 00000000 000000ff
!	%f28 = 400913b6 ff0000ff ff0000ff ff0000ff
	stda	%f16,[%i6]ASI_BLK_PL	! Block Store to 0000000010181400
!	Mem[00000000100c1410] = ff000000, %l7 = 00000000ffffffff
	ldstuba	[%i3+%o5]0x80,%l7	! %l7 = 000000ff000000ff
!	Mem[00000000100c1417] = 000000ff, %l7 = 00000000000000ff
	ldstub	[%i3+0x017],%l7		! %l7 = 000000ff000000ff
!	Mem[0000000010001410] = 000000ff, %l1 = 000000000000ffff
	ldstuba	[%i0+%o5]0x88,%l1	! %l1 = 000000ff000000ff
!	%f2  = ffff0000 00009eff, %l0 = 0000000000000000
!	Mem[0000000030141420] = ffffffff06fd1eff
	add	%i5,0x020,%g1
	stda	%f2,[%g1+%l0]ASI_PST8_SL ! Mem[0000000030141420] = ffffffff06fd1eff
!	Mem[0000000010101408] = ffc94f86, %l5 = 00000000000000ff
	ldstuba	[%i4+%o4]0x88,%l5	! %l5 = 00000086000000ff
!	Mem[0000000010081408] = ff000000, %l0 = 0000000000000000
	ldstuba	[%i2+%o4]0x80,%l0	! %l0 = 000000ff000000ff
!	Mem[0000000030081410] = 400913b6, %l0 = 00000000000000ff
	ldstuba	[%i2+%o5]0x81,%l0	! %l0 = 00000040000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = ff000000, %l6 = ffffffffffffffff
	ldsba	[%i2+%o4]0x81,%l6	! %l6 = ffffffffffffffff

p0_label_259:
!	Mem[0000000010081410] = db8bc354, %l1 = 00000000000000ff
	ldsha	[%i2+%o5]0x88,%l1	! %l1 = ffffffffffffc354
!	Mem[0000000010001400] = 864fc963db8bc354, %f2  = ffff0000 00009eff
	ldda	[%i0+%g0]0x88,%f2 	! %f2  = 864fc963 db8bc354
!	Mem[0000000030001410] = 864fc9ff, %f11 = add212bd
	lda	[%i0+%o5]0x89,%f11	! %f11 = 864fc9ff
!	Mem[00000000100c1408] = 00000000, %l4 = 000000000000ffc9
	ldsba	[%i3+%o4]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000010081408] = ff000000, %l2 = 0000000000000000
	ldsba	[%i2+%o4]0x80,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000010101410] = ff000000, %l1 = ffffffffffffc354
	ldswa	[%i4+%o5]0x80,%l1	! %l1 = ffffffffff000000
!	Mem[00000000100c1410] = ff000000000000ff, %l1 = ffffffffff000000
	ldxa	[%i3+%o5]0x88,%l1	! %l1 = ff000000000000ff
!	Mem[0000000010141430] = da770000, %l6 = ffffffffffffffff
	lduw	[%i5+0x030],%l6		! %l6 = 00000000da770000
!	Mem[0000000010141438] = a96e6a5a, %l3 = 0000000000000040
	ldsb	[%i5+0x03b],%l3		! %l3 = 000000000000005a
!	Starting 10 instruction Store Burst
!	%f0  = 54c38bdb 000000ff, %l6 = 00000000da770000
!	Mem[0000000010001400] = 54c38bdb63c94f86
	stda	%f0,[%i0+%l6]ASI_PST32_P ! Mem[0000000010001400] = 54c38bdb63c94f86

p0_label_260:
!	%f14 = ff000000 a5000000, %l0 = 0000000000000040
!	Mem[0000000010101438] = 63ff4fff0b009e16
	add	%i4,0x038,%g1
	stda	%f14,[%g1+%l0]ASI_PST8_PL ! Mem[0000000010101438] = 63ff4fff0b000016
!	%f4  = 400913b6 000000ff, Mem[0000000030081400] = ffffffff 000000ff
	stda	%f4 ,[%i2+%g0]0x81	! Mem[0000000030081400] = 400913b6 000000ff
!	%l2 = ffffffffffffffff, Mem[0000000030181400] = 00000000
	stba	%l2,[%i6+%g0]0x89	! Mem[0000000030181400] = 000000ff
!	Mem[00000000100c1400] = da770000, %l7 = 00000000000000ff
	ldstuba	[%i3+%g0]0x80,%l7	! %l7 = 000000da000000ff
!	%l2 = ffffffffffffffff, Mem[0000000010081400] = 000000ff
	stwa	%l2,[%i2+%g0]0x80	! Mem[0000000010081400] = ffffffff
!	%l4 = 00000000, %l5 = 00000086, Mem[0000000030181408] = ffff0000 00000000
	stda	%l4,[%i6+%o4]0x81	! Mem[0000000030181408] = 00000000 00000086
!	%f4  = 400913b6, Mem[0000000030101408] = 00000000
	sta	%f4 ,[%i4+%o4]0x81	! Mem[0000000030101408] = 400913b6
!	%l4 = 00000000, %l5 = 00000086, Mem[0000000010141400] = 000000ff 400913b6
	stda	%l4,[%i5+%g0]0x88	! Mem[0000000010141400] = 00000000 00000086
!	%l0 = 0000000000000040, Mem[0000000010141410] = ffffffffff0000ff
	stxa	%l0,[%i5+%o5]0x88	! Mem[0000000010141410] = 0000000000000040
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = a96e6a5a864fc9ff, %l1 = ff000000000000ff
	ldxa	[%i0+%o5]0x89,%l1	! %l1 = a96e6a5a864fc9ff

!	Check Point 52 for processor 0

	set	p0_check_pt_data_52,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 0000000000000040
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = a96e6a5a864fc9ff
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = ffffffffffffffff
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 000000000000005a
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 0000000000000000
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 0000000000000086
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 00000000da770000
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 00000000000000da
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = 864fc963 db8bc354
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x50],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 400913b6 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x58],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = ffff0000 864fc9ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x60],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = 00000000 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1

!	Check Point 52 completed


p0_label_261:
!	Mem[0000000030101410] = 0000ff00, %f12 = ffffffff
	lda	[%i4+%o5]0x89,%f12	! %f12 = 0000ff00
!	Mem[0000000030041410] = a96e6a5a, %l5 = 0000000000000086
	ldsba	[%i1+%o5]0x81,%l5	! %l5 = ffffffffffffffa9
!	Mem[0000000010081408] = ffffffff000000ff, %l6 = 00000000da770000
	ldxa	[%i2+%o4]0x88,%l6	! %l6 = ffffffff000000ff
	membar	#Sync			! Added by membar checker (53)
!	Mem[0000000010181400] = 864fc9ff, %l7 = 00000000000000da
	ldsba	[%i6+%g0]0x88,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000030101410] = 0000ff00, %l7 = ffffffffffffffff
	ldsba	[%i4+%o5]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000030081400] = 400913b6, %l5 = ffffffffffffffa9
	ldswa	[%i2+%g0]0x81,%l5	! %l5 = 00000000400913b6
!	Mem[0000000030001408] = 00000000, %l7 = 0000000000000000
	lduwa	[%i0+%o4]0x81,%l7	! %l7 = 0000000000000000
!	Mem[00000000100c1408] = 00000000, %l5 = 00000000400913b6
	lduwa	[%i3+%o4]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000030001408] = c9ff000000000000, %f24 = ff0000ff ffffffff
	ldda	[%i0+%o4]0x89,%f24	! %f24 = c9ff0000 00000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030141408] = ff000000, %l4 = 0000000000000000
	ldstuba	[%i5+%o4]0x81,%l4	! %l4 = 000000ff000000ff

p0_label_262:
!	%l1 = a96e6a5a864fc9ff, Mem[0000000010181408] = 000000ff
	stba	%l1,[%i6+%o4]0x88	! Mem[0000000010181408] = 000000ff
!	%l1 = a96e6a5a864fc9ff, Mem[0000000010181420] = ffffffff
	stw	%l1,[%i6+0x020]		! Mem[0000000010181420] = 864fc9ff
!	Mem[0000000010081408] = ff000000, %l1 = a96e6a5a864fc9ff
	swapa	[%i2+%o4]0x80,%l1	! %l1 = 00000000ff000000
!	Mem[0000000030041410] = 5a6a6ea9, %l4 = 00000000000000ff
	ldstuba	[%i1+%o5]0x89,%l4	! %l4 = 000000a9000000ff
!	%f28 = 400913b6, Mem[0000000030141410] = 0b3a0000
	sta	%f28,[%i5+%o5]0x89	! Mem[0000000030141410] = 400913b6
!	Mem[0000000030101400] = ff0000ff, %l0 = 0000000000000040
	swapa	[%i4+%g0]0x89,%l0	! %l0 = 00000000ff0000ff
!	Mem[0000000010181408] = 000000ff, %l0 = 00000000ff0000ff
	ldstuba	[%i6+%o4]0x88,%l0	! %l0 = 000000ff000000ff
!	Mem[00000000211c0001] = ffff7bbb, %l7 = 0000000000000000
	ldstuba	[%o2+0x001]%asi,%l7	! %l7 = 000000ff000000ff
!	%f0  = 54c38bdb 000000ff, %l6 = ffffffff000000ff
!	Mem[0000000010041418] = ff000000000000ff
	add	%i1,0x018,%g1
	stda	%f0,[%g1+%l6]ASI_PST8_PL ! Mem[0000000010041418] = ff000000db8bc354
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = c9ff0000, %f13 = ffff0000
	lda	[%i1+%o4]0x88,%f13	! %f13 = c9ff0000

p0_label_263:
!	Mem[0000000010101400] = 00ffffff, %l2 = ffffffffffffffff
	lduwa	[%i4+%g0]0x80,%l2	! %l2 = 0000000000ffffff
!	Mem[0000000030101410] = 0000ff00, %l7 = 00000000000000ff
	lduwa	[%i4+%o5]0x89,%l7	! %l7 = 000000000000ff00
!	Mem[0000000030101410] = 0000ff00, %f6  = 400913b6
	lda	[%i4+%o5]0x89,%f6 	! %f6 = 0000ff00
!	Mem[00000000300c1400] = ffffffff, %l5 = 0000000000000000
	ldswa	[%i3+%g0]0x89,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000030181410] = ffffffff da770000, %l4 = 000000a9, %l5 = ffffffff
	ldda	[%i6+%o5]0x81,%l4	! %l4 = 00000000ffffffff 00000000da770000
!	Mem[0000000030001408] = 00000000, %l7 = 000000000000ff00
	lduba	[%i0+%o4]0x89,%l7	! %l7 = 0000000000000000
!	Mem[00000000211c0000] = ffff7bbb, %l3 = 000000000000005a
	lduh	[%o2+%g0],%l3		! %l3 = 000000000000ffff
!	Mem[0000000010141400] = 00000000, %l7 = 0000000000000000
	lduha	[%i5+%g0]0x88,%l7	! %l7 = 0000000000000000
!	Mem[00000000300c1408] = 00000000 ffffffff, %l0 = 000000ff, %l1 = ff000000
	ldda	[%i3+%o4]0x81,%l0	! %l0 = 0000000000000000 00000000ffffffff
!	Starting 10 instruction Store Burst
!	Mem[0000000021800101] = ffffb49a, %l4 = 00000000ffffffff
	ldstuba	[%o3+0x101]%asi,%l4	! %l4 = 000000ff000000ff

p0_label_264:
!	%l1 = 00000000ffffffff, Mem[00000000211c0001] = ffff7bbb, %asi = 80
	stba	%l1,[%o2+0x001]%asi	! Mem[00000000211c0000] = ffff7bbb
!	%l2 = 00ffffff, %l3 = 0000ffff, Mem[0000000030101410] = 0000ff00 a3002dba
	stda	%l2,[%i4+%o5]0x89	! Mem[0000000030101410] = 00ffffff 0000ffff
!	Mem[00000000100c1400] = ff770000, %l7 = 0000000000000000
	ldstuba	[%i3+%g0]0x80,%l7	! %l7 = 000000ff000000ff
!	%l5 = 00000000da770000, Mem[00000000100c140c] = 00000000, %asi = 80
	stwa	%l5,[%i3+0x00c]%asi	! Mem[00000000100c140c] = da770000
!	%l4 = 00000000000000ff, Mem[00000000211c0001] = ffff7bbb
	stb	%l4,[%o2+0x001]		! Mem[00000000211c0000] = ffff7bbb
!	Mem[0000000010041408] = 0000ffc9, %l4 = 00000000000000ff
	swapa	[%i1+%o4]0x80,%l4	! %l4 = 000000000000ffc9
!	%f4  = 400913b6 000000ff, Mem[0000000030181408] = 00000000 86000000
	stda	%f4 ,[%i6+%o4]0x89	! Mem[0000000030181408] = 400913b6 000000ff
!	Mem[0000000030181400] = 000000ff, %l3 = 000000000000ffff
	swapa	[%i6+%g0]0x89,%l3	! %l3 = 00000000000000ff
!	%f0  = 54c38bdb 000000ff, %l1 = 00000000ffffffff
!	Mem[0000000030041418] = ffffffff000000ff
	add	%i1,0x018,%g1
	stda	%f0,[%g1+%l1]ASI_PST8_S ! Mem[0000000030041418] = 54c38bdb000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = 00000000 000000ff, %l4 = 0000ffc9, %l5 = da770000
	ldda	[%i4+%o5]0x88,%l4	! %l4 = 00000000000000ff 0000000000000000

p0_label_265:
!	Mem[0000000010081424] = 0000ffff, %l7 = 00000000000000ff
	lduh	[%i2+0x024],%l7		! %l7 = 0000000000000000
!	Mem[0000000030081410] = ff0913b6ff0000ff, %l4 = 00000000000000ff
	ldxa	[%i2+%o5]0x81,%l4	! %l4 = ff0913b6ff0000ff
!	Mem[0000000030141410] = b6130940, %l1 = 00000000ffffffff
	ldswa	[%i5+%o5]0x81,%l1	! %l1 = ffffffffb6130940
!	Mem[0000000030081400] = 400913b6, %f2  = 864fc963
	lda	[%i2+%g0]0x81,%f2 	! %f2 = 400913b6
!	Mem[00000000300c1400] = ffffffff0000007f, %f8  = ffffffff 06fd1eff
	ldda	[%i3+%g0]0x81,%f8 	! %f8  = ffffffff 0000007f
!	Mem[00000000300c1410] = 000000ff, %l7 = 0000000000000000
	ldswa	[%i3+%o5]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010181408] = 000000ff, %l7 = 00000000000000ff
	ldswa	[%i6+%o4]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010101408] = ff4fc9ff, %l3 = 00000000000000ff
	lduha	[%i4+%o4]0x80,%l3	! %l3 = 000000000000ff4f
!	Mem[0000000030081410] = ff0913b6, %l1 = ffffffffb6130940
	lduwa	[%i2+%o5]0x81,%l1	! %l1 = 00000000ff0913b6
!	Starting 10 instruction Store Burst
!	%f13 = c9ff0000, Mem[0000000010001400] = db8bc354
	sta	%f13,[%i0+%g0]0x88	! Mem[0000000010001400] = c9ff0000

!	Check Point 53 for processor 0

	set	p0_check_pt_data_53,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 0000000000000000
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 00000000ff0913b6
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 0000000000ffffff
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 000000000000ff4f
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = ff0913b6ff0000ff
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 0000000000000000
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = ffffffff000000ff
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = 54c38bdb 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x50],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = 400913b6 db8bc354
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x58],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 400913b6 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x60],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 0000ff00 ff0000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x68],%g3
	std	%f8,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f8 = ffffffff 0000007f
	bne	%xcc,p0_freg_check_fail
	mov	0xf08,%g1
	ldx	[%g4+0x70],%g3
	std	%f12,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f12 = 0000ff00 c9ff0000
	bne	%xcc,p0_freg_check_fail
	mov	0xf12,%g1
	ldx	[%g4+0x78],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = c9ff0000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1

!	Check Point 53 completed


p0_label_266:
!	%l2 = 00ffffff, %l3 = 0000ff4f, Mem[0000000030181400] = 0000ffff ffffffff
	stda	%l2,[%i6+%g0]0x89	! Mem[0000000030181400] = 00ffffff 0000ff4f
!	%l2 = 0000000000ffffff, Mem[0000000010181420] = 864fc9ff, %asi = 80
	stwa	%l2,[%i6+0x020]%asi	! Mem[0000000010181420] = 00ffffff
!	Mem[0000000010141418] = 00000000000000ff, %l0 = 0000000000000000, %l6 = ffffffff000000ff
	add	%i5,0x18,%g1
	casxa	[%g1]0x80,%l0,%l6	! %l6 = 00000000000000ff
!	%f2  = 400913b6 db8bc354, %l7 = 00000000000000ff
!	Mem[0000000030001428] = 00000000b61309ff
	add	%i0,0x028,%g1
	stda	%f2,[%g1+%l7]ASI_PST16_SL ! Mem[0000000030001428] = 54c38bdbb6130940
!	Mem[0000000010181408] = ff000000, %l5 = 0000000000000000
	swap	[%i6+%o4],%l5		! %l5 = 00000000ff000000
!	%f13 = c9ff0000, Mem[0000000030101410] = 00ffffff
	sta	%f13,[%i4+%o5]0x89	! Mem[0000000030101410] = c9ff0000
!	%l1 = 00000000ff0913b6, Mem[00000000300c1400] = ffffffff
	stwa	%l1,[%i3+%g0]0x89	! Mem[00000000300c1400] = ff0913b6
!	Mem[0000000030181408] = 000000ff, %l1 = 00000000ff0913b6
	swapa	[%i6+%o4]0x89,%l1	! %l1 = 00000000000000ff
!	%l4 = ff0913b6ff0000ff, Mem[0000000010181400] = a96e6a5a864fc9ff
	stxa	%l4,[%i6+%g0]0x88	! Mem[0000000010181400] = ff0913b6ff0000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = 00000000000000ff, %f14 = ff000000 a5000000
	ldda	[%i4+%o5]0x88,%f14	! %f14 = 00000000 000000ff

p0_label_267:
!	Mem[000000001000142c] = 0000ffff, %l7 = 00000000000000ff
	ldsw	[%i0+0x02c],%l7		! %l7 = 000000000000ffff
!	Mem[0000000010181408] = ff00000000000000, %l3 = 000000000000ff4f
	ldxa	[%i6+%o4]0x88,%l3	! %l3 = ff00000000000000
!	Mem[0000000010001410] = 54c38bdb 000000ff, %l6 = 000000ff, %l7 = 0000ffff
	ldda	[%i0+%o5]0x88,%l6	! %l6 = 00000000000000ff 0000000054c38bdb
!	Mem[0000000030041408] = 0000ffff, %l4 = ff0913b6ff0000ff
	ldswa	[%i1+%o4]0x89,%l4	! %l4 = 000000000000ffff
!	Mem[0000000030041408] = 0000ffff, %l0 = 0000000000000000
	lduha	[%i1+%o4]0x89,%l0	! %l0 = 000000000000ffff
!	Mem[00000000100c1408] = 000077da00000000, %f14 = 00000000 000000ff
	ldda	[%i3+%o4]0x88,%f14	! %f14 = 000077da 00000000
!	Mem[0000000010101400] = ffffff00, %l0 = 000000000000ffff
	lduba	[%i4+%g0]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000010001400] = 0000ffc9, %l5 = 00000000ff000000
	ldswa	[%i0+%g0]0x80,%l5	! %l5 = 000000000000ffc9
!	Mem[00000000100c1410] = ff000000, %l5 = 000000000000ffc9
	ldsba	[%i3+%o5]0x80,%l5	! %l5 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	Mem[0000000010001400] = c9ff0000, %l3 = ff00000000000000
	ldstuba	[%i0+%g0]0x88,%l3	! %l3 = 00000000000000ff

p0_label_268:
!	%l4 = 000000000000ffff, Mem[000000001010140e] = 864fc9ff, %asi = 80
	stba	%l4,[%i4+0x00e]%asi	! Mem[000000001010140c] = 864fffff
!	%f0  = 54c38bdb 000000ff 400913b6 db8bc354
!	%f4  = 400913b6 000000ff 0000ff00 ff0000ff
!	%f8  = ffffffff 0000007f ffff0000 864fc9ff
!	%f12 = 0000ff00 c9ff0000 000077da 00000000
	stda	%f0,[%i3]ASI_BLK_AIUS	! Block Store to 00000000300c1400
!	%l0 = 0000000000000000, Mem[0000000010041408] = 000000ff
	stwa	%l0,[%i1+%o4]0x80	! Mem[0000000010041408] = 00000000
!	%l2 = 0000000000ffffff, Mem[0000000030141400] = ff000000
	stba	%l2,[%i5+%g0]0x89	! Mem[0000000030141400] = ff0000ff
!	%f24 = c9ff0000, Mem[0000000030101400] = 40000000
	sta	%f24,[%i4+%g0]0x81	! Mem[0000000030101400] = c9ff0000
!	%l0 = 0000000000000000, Mem[0000000010181418] = ff000000, %asi = 80
	stwa	%l0,[%i6+0x018]%asi	! Mem[0000000010181418] = 00000000
!	%f16 = a96e6a5a, Mem[0000000010041400] = 000000ff
	sta	%f16,[%i1+%g0]0x88	! Mem[0000000010041400] = a96e6a5a
!	%l3 = 0000000000000000, Mem[0000000010141414] = 00000000, %asi = 80
	stha	%l3,[%i5+0x014]%asi	! Mem[0000000010141414] = 00000000
!	%l2 = 00ffffff, %l3 = 00000000, Mem[0000000010101400] = ffffff00 00000000
	stda	%l2,[%i4+%g0]0x88	! Mem[0000000010101400] = 00ffffff 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = 400913b6, %l2 = 0000000000ffffff
	ldsba	[%i5+%o5]0x89,%l2	! %l2 = ffffffffffffffb6

p0_label_269:
!	Mem[00000000201c0000] = ffffaf65, %l5 = ffffffffffffffff
	ldsb	[%o0+%g0],%l5		! %l5 = ffffffffffffffff
!	Mem[0000000010101410] = 000000ff, %l7 = 0000000054c38bdb
	ldswa	[%i4+%o5]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010001410] = 54c38bdb000000ff, %f26 = 00000000 000000ff
	ldda	[%i0+%o5]0x88,%f26	! %f26 = 54c38bdb 000000ff
!	Mem[0000000030041408] = ffff0000 000000ff, %l6 = 000000ff, %l7 = 000000ff
	ldda	[%i1+%o4]0x81,%l6	! %l6 = 00000000ffff0000 00000000000000ff
!	Mem[0000000030181410] = ffffffff, %l4 = 000000000000ffff
	ldsha	[%i6+%o5]0x89,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010081410] = 54c38bdb 000000ff, %l0 = 00000000, %l1 = 000000ff
	ldda	[%i2+%o5]0x80,%l0	! %l0 = 0000000054c38bdb 00000000000000ff
!	Mem[0000000010141400] = 00000000 86000000, %l2 = ffffffb6, %l3 = 00000000
	ldda	[%i5+%g0]0x80,%l2	! %l2 = 0000000000000000 0000000086000000
!	Mem[0000000010041408] = 00000000 ff000000, %l2 = 00000000, %l3 = 86000000
	ldd	[%i1+%o4],%l2		! %l2 = 0000000000000000 00000000ff000000
!	Mem[0000000010181410] = ffc94f8600000000, %f16 = a96e6a5a 864fc9ff
	ldd	[%i6+%o5],%f16		! %f16 = ffc94f86 00000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010041410] = ffffffff, %l3 = 00000000ff000000
	ldstuba	[%i1+%o5]0x88,%l3	! %l3 = 000000ff000000ff

p0_label_270:
!	%l1 = 00000000000000ff, Mem[0000000030041410] = ff6e6a5a
	stba	%l1,[%i1+%o5]0x81	! Mem[0000000030041410] = ff6e6a5a
!	Mem[0000000020800041] = ffffac70, %l3 = 00000000000000ff
	ldstuba	[%o1+0x041]%asi,%l3	! %l3 = 000000ff000000ff
!	%l7 = 00000000000000ff, Mem[0000000010001408] = ffffffff
	stwa	%l7,[%i0+%o4]0x80	! Mem[0000000010001408] = 000000ff
!	Mem[0000000010101410] = ff000000, %l5 = ffffffffffffffff
	swapa	[%i4+%o5]0x80,%l5	! %l5 = 00000000ff000000
!	%f26 = 54c38bdb 000000ff, Mem[0000000030101410] = c9ff0000 0000ffff
	stda	%f26,[%i4+%o5]0x89	! Mem[0000000030101410] = 54c38bdb 000000ff
!	%l0 = 0000000054c38bdb, Mem[0000000030081400] = 400913b6
	stba	%l0,[%i2+%g0]0x81	! Mem[0000000030081400] = db0913b6
!	%f27 = 000000ff, Mem[0000000030181410] = ffffffff
	sta	%f27,[%i6+%o5]0x89	! Mem[0000000030181410] = 000000ff
!	%l0 = 0000000054c38bdb, Mem[00000000100c1408] = 000077da00000000
	stxa	%l0,[%i3+%o4]0x88	! Mem[00000000100c1408] = 0000000054c38bdb
!	Mem[0000000010141407] = 86000000, %l0 = 0000000054c38bdb
	ldstub	[%i5+0x007],%l0		! %l0 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = 00ffffff, %l6 = 00000000ffff0000
	ldsha	[%i6+%g0]0x89,%l6	! %l6 = ffffffffffffffff

!	Check Point 54 for processor 0

	set	p0_check_pt_data_54,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 0000000000000000
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l2,%g2			! %l2 = 0000000000000000
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l3,%g2			! %l3 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l4,%g2			! %l4 = ffffffffffffffff
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l5,%g2			! %l5 = 00000000ff000000
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l6,%g2			! %l6 = ffffffffffffffff
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l7,%g2			! %l7 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x40],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = 54c38bdb 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x48],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = 400913b6 db8bc354
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x50],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 0000ff00 ff0000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x58],%g3
	std	%f14,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f14 = 000077da 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf14,%g1
	ldx	[%g4+0x60],%g3
	std	%f16,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f16 = ffc94f86 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf16,%g1
	ldx	[%g4+0x68],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = 54c38bdb 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1

!	Check Point 54 completed


p0_label_271:
!	Mem[0000000010081420] = 0000ffa5, %l0 = 0000000000000000
	lduha	[%i2+0x022]%asi,%l0	! %l0 = 000000000000ffa5
!	Mem[0000000030041410] = ffc94f865a6a6eff, %f4  = 400913b6 000000ff
	ldda	[%i1+%o5]0x89,%f4 	! %f4  = ffc94f86 5a6a6eff
!	Mem[0000000010041408] = 00000000, %l3 = 00000000000000ff
	ldsha	[%i1+%o4]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000010001438] = ff000000ffffffff, %f26 = 54c38bdb 000000ff
	ldda	[%i0+0x038]%asi,%f26	! %f26 = ff000000 ffffffff
!	Mem[0000000030141408] = 00000000000000ff, %f30 = ff0000ff ff0000ff
	ldda	[%i5+%o4]0x89,%f30	! %f30 = 00000000 000000ff
!	Mem[0000000010101410] = ffffffff, %l2 = 0000000000000000
	ldswa	[%i4+0x010]%asi,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000030141400] = ff0000ff00000000, %f14 = 000077da 00000000
	ldda	[%i5+%g0]0x81,%f14	! %f14 = ff0000ff 00000000
!	Mem[0000000010041400] = 5a6a6ea9, %l4 = ffffffffffffffff
	lduba	[%i1+%g0]0x80,%l4	! %l4 = 000000000000005a
!	Mem[0000000010001410] = ff000000, %l6 = ffffffffffffffff
	ldswa	[%i0+%o5]0x80,%l6	! %l6 = ffffffffff000000
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (54)
!	Mem[00000000300c1410] = 400913b6, %l4 = 000000000000005a
	swapa	[%i3+%o5]0x81,%l4	! %l4 = 00000000400913b6

p0_label_272:
!	Mem[0000000030001408] = 00000000, %l0 = 000000000000ffa5
	ldstuba	[%i0+%o4]0x81,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030081410] = b61309ff, %l0 = 0000000000000000
	ldstuba	[%i2+%o5]0x89,%l0	! %l0 = 000000ff000000ff
!	Mem[00000000300c1400] = 54c38bdb, %l6 = ffffffffff000000
	swapa	[%i3+%g0]0x81,%l6	! %l6 = 0000000054c38bdb
!	Mem[00000000100c1400] = ff770000, %l1 = 00000000000000ff
	ldstuba	[%i3+%g0]0x80,%l1	! %l1 = 000000ff000000ff
!	%l5 = 00000000ff000000, Mem[00000000100c1408] = db8bc354
	stha	%l5,[%i3+%o4]0x80	! Mem[00000000100c1408] = 0000c354
!	%l7 = 00000000000000ff, Mem[0000000030041400] = 00000000
	stba	%l7,[%i1+%g0]0x89	! Mem[0000000030041400] = 000000ff
!	%l6 = 54c38bdb, %l7 = 000000ff, Mem[0000000010041408] = 00000000 ff000000
	stda	%l6,[%i1+%o4]0x80	! Mem[0000000010041408] = 54c38bdb 000000ff
!	Mem[0000000010181408] = 00000000, %l4 = 00000000400913b6
	ldstuba	[%i6+%o4]0x80,%l4	! %l4 = 00000000000000ff
!	Mem[000000001000141c] = 000000ff, %l7 = 00000000000000ff
	ldstuba	[%i0+0x01c]%asi,%l7	! %l7 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = ff000000000000ff, %l3 = 0000000000000000
	ldxa	[%i3+%g0]0x89,%l3	! %l3 = ff000000000000ff

p0_label_273:
!	Mem[00000000100c1410] = ff000000, %l5 = 00000000ff000000
	ldswa	[%i3+0x010]%asi,%l5	! %l5 = ffffffffff000000
!	Mem[00000000201c0000] = ffffaf65, %l7 = 0000000000000000
	ldsha	[%o0+0x000]%asi,%l7	! %l7 = ffffffffffffffff
!	%l7 = ffffffffffffffff, imm = ffffffffffffff68, %l2 = ffffffffffffffff
	andn	%l7,-0x098,%l2		! %l2 = 0000000000000097
!	Mem[0000000010041408] = 54c38bdb, %l0 = 00000000000000ff
	lduba	[%i1+%o4]0x80,%l0	! %l0 = 0000000000000054
!	Mem[0000000010101408] = ff4fc9ff, %l3 = ff000000000000ff
	lduba	[%i4+%o4]0x80,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010181410] = 864fc9ff, %l2 = 0000000000000097
	ldswa	[%i6+%o5]0x88,%l2	! %l2 = ffffffff864fc9ff
!	Mem[00000000100c1408] = 0000000054c30000, %l2 = ffffffff864fc9ff
	ldxa	[%i3+%o4]0x88,%l2	! %l2 = 0000000054c30000
!	Mem[0000000010041420] = 000000ff 00ff0000, %l4 = 00000000, %l5 = ff000000
	ldda	[%i1+0x020]%asi,%l4	! %l4 = 00000000000000ff 0000000000ff0000
!	Mem[0000000030141410] = 400913b6, %l7 = ffffffffffffffff
	ldswa	[%i5+%o5]0x89,%l7	! %l7 = 00000000400913b6
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1410] = ff000000, %l6 = 0000000054c38bdb
	swapa	[%i3+%o5]0x80,%l6	! %l6 = 00000000ff000000

p0_label_274:
!	%l6 = 00000000ff000000, Mem[0000000010001400] = c9ff00ff
	stha	%l6,[%i0+%g0]0x88	! Mem[0000000010001400] = c9ff0000
!	Mem[0000000030181410] = 000000ff, %l2 = 0000000054c30000
	swapa	[%i6+%o5]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030041410] = ff6e6a5a, %l6 = 00000000ff000000
	swapa	[%i1+%o5]0x81,%l6	! %l6 = 00000000ff6e6a5a
!	Mem[0000000010141420] = ccbeffaee46cbd64, %l6 = 00000000ff6e6a5a, %l7 = 00000000400913b6
	add	%i5,0x20,%g1
	casxa	[%g1]0x80,%l6,%l7	! %l7 = ccbeffaee46cbd64
!	%f18 = ff000000 000000ff, Mem[0000000030181400] = ffffff00 4fff0000
	stda	%f18,[%i6+%g0]0x81	! Mem[0000000030181400] = ff000000 000000ff
!	%l0 = 0000000000000054, Mem[0000000010081400] = ffffffff
	stba	%l0,[%i2+%g0]0x88	! Mem[0000000010081400] = ffffff54
!	%l6 = ff6e6a5a, %l7 = e46cbd64, Mem[0000000010081400] = ffffff54 ff000000
	stda	%l6,[%i2+%g0]0x88	! Mem[0000000010081400] = ff6e6a5a e46cbd64
!	%l7 = ccbeffaee46cbd64, Mem[0000000030101408] = 400913b6
	stha	%l7,[%i4+%o4]0x81	! Mem[0000000030101408] = bd6413b6
!	%l1 = 00000000000000ff, Mem[0000000030181408] = 400913b6ff0913b6
	stxa	%l1,[%i6+%o4]0x89	! Mem[0000000030181408] = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = 00ffffff, %f9  = 0000007f
	lda	[%i4+%g0]0x88,%f9 	! %f9 = 00ffffff

p0_label_275:
!	Mem[000000001018141c] = ffffffff, %l2 = 00000000000000ff
	ldswa	[%i6+0x01c]%asi,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000030081400] = db0913b6, %l0 = 0000000000000054
	ldsha	[%i2+%g0]0x81,%l0	! %l0 = ffffffffffffdb09
!	Mem[0000000010041400] = a96e6a5a, %l3 = 00000000000000ff
	ldsha	[%i1+%g0]0x88,%l3	! %l3 = 0000000000006a5a
!	Mem[00000000300c1410] = 5a000000, %l3 = 0000000000006a5a
	lduha	[%i3+%o5]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000010001400] = 0000ffc9, %f30 = 00000000
	lda	[%i0+%g0]0x80,%f30	! %f30 = 0000ffc9
!	Mem[0000000030181400] = ff000000, %l0 = ffffffffffffdb09
	ldsba	[%i6+%g0]0x81,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010001400] = 0000ffc9, %l7 = ccbeffaee46cbd64
	lduha	[%i0+%g0]0x80,%l7	! %l7 = 0000000000000000
!	%l6 = 00000000ff6e6a5a, Mem[0000000010141414] = 00000000, %asi = 80
	stba	%l6,[%i5+0x014]%asi	! Mem[0000000010141414] = 5a000000
!	%l5 = 0000000000ff0000, %l3 = 0000000000000000, %l6 = 00000000ff6e6a5a
	xnor	%l5,%l3,%l6		! %l6 = ffffffffff00ffff
!	Starting 10 instruction Store Burst
!	Mem[0000000030141410] = b6130940, %l5 = 0000000000ff0000
	swapa	[%i5+%o5]0x81,%l5	! %l5 = 00000000b6130940

!	Check Point 55 for processor 0

	set	p0_check_pt_data_55,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = ffffffffffffffff
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = ffffffffffffffff
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 0000000000000000
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 00000000b6130940
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = ffffffffff00ffff
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 0000000000000000
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = ffc94f86 5a6a6eff
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x50],%g3
	std	%f8,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f8 = ffffffff 00ffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf08,%g1
	ldx	[%g4+0x58],%g3
	std	%f14,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f14 = ff0000ff 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf14,%g1
	ldx	[%g4+0x60],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = ff000000 ffffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1
	ldx	[%g4+0x68],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = 0000ffc9 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 55 completed


p0_label_276:
!	%f13 = c9ff0000, Mem[0000000030101408] = b61364bd
	sta	%f13,[%i4+%o4]0x89	! Mem[0000000030101408] = c9ff0000
!	%l6 = ffffffffff00ffff, Mem[0000000030041410] = 000000ff
	stba	%l6,[%i1+%o5]0x89	! Mem[0000000030041410] = 000000ff
!	%l5 = 00000000b6130940, Mem[0000000010141400] = 00000000
	stba	%l5,[%i5+%g0]0x80	! Mem[0000000010141400] = 40000000
!	%l3 = 0000000000000000, Mem[0000000030001400] = b6130940
	stha	%l3,[%i0+%g0]0x81	! Mem[0000000030001400] = 00000940
!	%l4 = 00000000000000ff, Mem[0000000030041400] = 000000ff
	stwa	%l4,[%i1+%g0]0x89	! Mem[0000000030041400] = 000000ff
!	%l0 = ffffffffffffffff, Mem[00000000201c0000] = ffffaf65
	stb	%l0,[%o0+%g0]		! Mem[00000000201c0000] = ffffaf65
!	%l7 = 0000000000000000, Mem[0000000030041400] = 000000ff
	stha	%l7,[%i1+%g0]0x89	! Mem[0000000030041400] = 00000000
!	%f24 = c9ff0000 00000000, Mem[0000000030141408] = ff000000 00000000
	stda	%f24,[%i5+%o4]0x81	! Mem[0000000030141408] = c9ff0000 00000000
!	%l7 = 0000000000000000, Mem[0000000010041408] = ff000000db8bc354
	stxa	%l7,[%i1+%o4]0x88	! Mem[0000000010041408] = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010101430] = 77da1fff, %l4 = 00000000000000ff
	ldsw	[%i4+0x030],%l4		! %l4 = 0000000077da1fff

p0_label_277:
!	Mem[0000000021800100] = ffffb49a, %l3 = 0000000000000000
	ldsh	[%o3+0x100],%l3		! %l3 = ffffffffffffffff
!	Mem[0000000010181400] = ff0000ff, %l4 = 0000000077da1fff
	ldsba	[%i6+%g0]0x80,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010041410] = 864fc963 ffffffff, %l4 = ffffffff, %l5 = b6130940
	ldda	[%i1+%o5]0x88,%l4	! %l4 = 00000000ffffffff 00000000864fc963
!	Mem[0000000010181400] = ff0000ff, %l0 = ffffffffffffffff
	ldsha	[%i6+%g0]0x80,%l0	! %l0 = ffffffffffffff00
!	Mem[0000000010041408] = 00000000 00000000, %l6 = ff00ffff, %l7 = 00000000
	ldda	[%i1+%o4]0x80,%l6	! %l6 = 0000000000000000 0000000000000000
!	Mem[0000000010181408] = ff000000, %l7 = 0000000000000000
	ldsba	[%i6+%o4]0x80,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010101438] = 63ff4fff, %l6 = 0000000000000000
	lduha	[%i4+0x038]%asi,%l6	! %l6 = 00000000000063ff
!	Mem[00000000300c1408] = b6130940, %l7 = ffffffffffffffff
	lduba	[%i3+%o4]0x89,%l7	! %l7 = 0000000000000040
!	Mem[0000000010001410] = 54c38bdb000000ff, %f4  = ffc94f86 5a6a6eff
	ldda	[%i0+%o5]0x88,%f4 	! %f4  = 54c38bdb 000000ff
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1400] = 000077ff, %l3 = ffffffffffffffff
	ldstuba	[%i3+%g0]0x88,%l3	! %l3 = 000000ff000000ff

p0_label_278:
!	%f0  = 54c38bdb 000000ff, Mem[0000000010101408] = ff4fc9ff 864fffff
	stda	%f0 ,[%i4+%o4]0x80	! Mem[0000000010101408] = 54c38bdb 000000ff
!	Mem[000000001000141a] = 54c38bdb, %l2 = ffffffffffffffff
	ldstuba	[%i0+0x01a]%asi,%l2	! %l2 = 0000008b000000ff
!	Mem[00000000211c0000] = ffff7bbb, %l7 = 0000000000000040
	ldstub	[%o2+%g0],%l7		! %l7 = 000000ff000000ff
!	%f14 = ff0000ff 00000000, %l5 = 00000000864fc963
!	Mem[00000000300c1420] = ffffffff0000007f
	add	%i3,0x020,%g1
	stda	%f14,[%g1+%l5]ASI_PST8_S ! Mem[00000000300c1420] = ff0000ff00000000
!	Mem[0000000021800181] = 00002200, %l1 = 00000000000000ff
	ldstub	[%o3+0x181],%l1		! %l1 = 00000000000000ff
!	%l4 = 00000000ffffffff, Mem[00000000100c1408] = 0000000054c30000
	stxa	%l4,[%i3+%o4]0x88	! Mem[00000000100c1408] = 00000000ffffffff
!	%f26 = ff000000 ffffffff, Mem[0000000010001400] = c9ff0000 864fc963
	stda	%f26,[%i0+%g0]0x88	! Mem[0000000010001400] = ff000000 ffffffff
!	%f0  = 54c38bdb 000000ff, %l4 = 00000000ffffffff
!	Mem[00000000100c1430] = ffffffff000000a5
	add	%i3,0x030,%g1
	stda	%f0,[%g1+%l4]ASI_PST8_PL ! Mem[00000000100c1430] = ff000000db8bc354
!	Mem[0000000030101408] = c9ff0000, %l1 = 0000000000000000
	swapa	[%i4+%o4]0x89,%l1	! %l1 = 00000000c9ff0000
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = 54c38bdb b6130940, %l4 = ffffffff, %l5 = 864fc963
	ldda	[%i3+%o4]0x89,%l4	! %l4 = 00000000b6130940 0000000054c38bdb

p0_label_279:
!	Mem[00000000300c1408] = 400913b6db8bc354, %f4  = 54c38bdb 000000ff
	ldda	[%i3+%o4]0x81,%f4 	! %f4  = 400913b6 db8bc354
!	Mem[0000000010141418] = 00000000 000000ff, %l0 = ffffff00, %l1 = c9ff0000
	ldd	[%i5+0x018],%l0		! %l0 = 0000000000000000 00000000000000ff
!	Mem[00000000201c0000] = ffffaf65, %l2 = 000000000000008b
	ldub	[%o0+0x001],%l2		! %l2 = 00000000000000ff
!	Mem[00000000211c0000] = ffff7bbb, %l3 = 00000000000000ff
	lduba	[%o2+0x000]%asi,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030001410] = a96e6a5a864fc9ff, %l4 = 00000000b6130940
	ldxa	[%i0+%o5]0x89,%l4	! %l4 = a96e6a5a864fc9ff
!	Mem[0000000010141410] = 40000000, %l4 = a96e6a5a864fc9ff
	ldswa	[%i5+0x010]%asi,%l4	! %l4 = 0000000040000000
!	Mem[00000000100c1410] = 54c38bdb, %l5 = 0000000054c38bdb
	lduba	[%i3+0x010]%asi,%l5	! %l5 = 0000000000000054
!	Mem[0000000030101400] = c9ff0000, %l7 = 00000000000000ff
	ldsba	[%i4+%g0]0x81,%l7	! %l7 = ffffffffffffffc9
!	Mem[0000000030141410] = 00ff0000, %l3 = 00000000000000ff
	lduha	[%i5+%o5]0x81,%l3	! %l3 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%f22 = ffffffff 000000ff, Mem[0000000030041400] = 00000000 ff0913b6
	stda	%f22,[%i1+%g0]0x89	! Mem[0000000030041400] = ffffffff 000000ff

p0_label_280:
!	Mem[0000000030141408] = 0000ffc9, %l3 = 00000000000000ff
	swapa	[%i5+%o4]0x89,%l3	! %l3 = 000000000000ffc9
!	Mem[00000000100c1410] = db8bc354, %l2 = 00000000000000ff
	swapa	[%i3+%o5]0x88,%l2	! %l2 = 00000000db8bc354
!	%l1 = 00000000000000ff, Mem[00000000300c1410] = 0000005a
	stba	%l1,[%i3+%o5]0x81	! Mem[00000000300c1410] = ff00005a
!	%f30 = 0000ffc9 000000ff, %l1 = 00000000000000ff
!	Mem[0000000030181418] = 8eb54fdff159e90e
	add	%i6,0x018,%g1
	stda	%f30,[%g1+%l1]ASI_PST16_S ! Mem[0000000030181418] = 0000ffc9000000ff
!	Mem[0000000030101408] = 00000000, %l5 = 0000000000000054
	swapa	[%i4+%o4]0x89,%l5	! %l5 = 0000000000000000
!	%l6 = 000063ff, %l7 = ffffffc9, Mem[0000000010141400] = 40000000 860000ff
	std	%l6,[%i5+%g0]		! Mem[0000000010141400] = 000063ff ffffffc9
!	Mem[000000001004141a] = ff000000, %l7 = ffffffffffffffc9
	ldstuba	[%i1+0x01a]%asi,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030101408] = 54000000, %l7 = 0000000000000000
	swapa	[%i4+%o4]0x81,%l7	! %l7 = 0000000054000000
!	%l0 = 00000000, %l1 = 000000ff, Mem[0000000010101438] = 63ff4fff 0b000016
	std	%l0,[%i4+0x038]		! Mem[0000000010101438] = 00000000 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = db8bc354, %l5 = 0000000000000000
	ldsba	[%i2+%o5]0x88,%l5	! %l5 = 0000000000000054

!	Check Point 56 for processor 0

	set	p0_check_pt_data_56,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 0000000000000000
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 00000000db8bc354
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 000000000000ffc9
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 0000000040000000
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 0000000000000054
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 00000000000063ff
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 0000000054000000
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = 54c38bdb 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x50],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 400913b6 db8bc354
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x58],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 0000ff00 ff0000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1

!	Check Point 56 completed


p0_label_281:
!	Mem[00000000201c0000] = ffffaf65, %l7 = 0000000054000000
	lduba	[%o0+0x000]%asi,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010181404] = b61309ff, %l6 = 00000000000063ff
	lduwa	[%i6+0x004]%asi,%l6	! %l6 = 00000000b61309ff
!	Mem[0000000030001400] = a12eaec340090000, %l6 = 00000000b61309ff
	ldxa	[%i0+%g0]0x89,%l6	! %l6 = a12eaec340090000
!	Mem[00000000100c1438] = ffffffffffffffff, %f4  = 400913b6 db8bc354
	ldd	[%i3+0x038],%f4 	! %f4  = ffffffff ffffffff
!	Mem[0000000030141400] = ff0000ff, %l2 = 00000000db8bc354
	lduba	[%i5+%g0]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030041400] = ffffffff 000000ff, %l0 = 00000000, %l1 = 000000ff
	ldda	[%i1+%g0]0x89,%l0	! %l0 = 00000000000000ff 00000000ffffffff
!	Mem[0000000020800000] = ffff7d94, %l6 = a12eaec340090000
	ldsha	[%o1+0x000]%asi,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000030101410] = 54c38bdb000000ff, %l7 = 00000000000000ff
	ldxa	[%i4+%o5]0x89,%l7	! %l7 = 54c38bdb000000ff
!	Mem[000000001014142c] = 00000000, %l0 = 00000000000000ff
	lduwa	[%i5+0x02c]%asi,%l0	! %l0 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l2 = 00000000000000ff, Mem[0000000030041400] = ff000000
	stwa	%l2,[%i1+%g0]0x81	! Mem[0000000030041400] = 000000ff

p0_label_282:
!	%l7 = 54c38bdb000000ff, Mem[0000000030181408] = 000000ff
	stwa	%l7,[%i6+%o4]0x89	! Mem[0000000030181408] = 000000ff
!	%f26 = ff000000 ffffffff, %l1 = 00000000ffffffff
!	Mem[00000000100c1410] = ff000000000000ff
	add	%i3,0x010,%g1
	stda	%f26,[%g1+%l1]ASI_PST16_P ! Mem[00000000100c1410] = ff000000ffffffff
!	%l4 = 40000000, %l5 = 00000054, Mem[0000000030081410] = ff0913b6 ff0000ff
	stda	%l4,[%i2+%o5]0x81	! Mem[0000000030081410] = 40000000 00000054
!	Mem[00000000300c1408] = 400913b6, %l6 = ffffffffffffffff
	swapa	[%i3+%o4]0x81,%l6	! %l6 = 00000000400913b6
!	%f12 = 0000ff00, Mem[00000000100c1408] = ffffffff
	sta	%f12,[%i3+%o4]0x80	! Mem[00000000100c1408] = 0000ff00
!	Mem[0000000010101400] = ffffff00, %l4 = 0000000040000000
	ldstuba	[%i4+%g0]0x80,%l4	! %l4 = 000000ff000000ff
!	%l2 = 00000000000000ff, Mem[0000000010001430] = 00000000
	stw	%l2,[%i0+0x030]		! Mem[0000000010001430] = 000000ff
!	Mem[00000000100c1430] = ff000000 db8bc354, %l2 = 000000ff, %l3 = 0000ffc9
	ldda	[%i3+0x030]%asi,%l2	! %l2 = 00000000ff000000 00000000db8bc354
!	Mem[0000000010081408] = 864fc9ff, %l6 = 00000000400913b6
	ldstuba	[%i2+%o4]0x80,%l6	! %l6 = 00000086000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = ff000000, %l6 = 0000000000000086
	lduba	[%i0+%o5]0x80,%l6	! %l6 = 00000000000000ff

p0_label_283:
!	Mem[0000000030001410] = a96e6a5a864fc9ff, %l1 = 00000000ffffffff
	ldxa	[%i0+%o5]0x89,%l1	! %l1 = a96e6a5a864fc9ff
!	Mem[00000000201c0000] = ffffaf65, %l5 = 0000000000000054
	lduba	[%o0+0x000]%asi,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030001400] = 00000940c3ae2ea1, %f24 = c9ff0000 00000000
	ldda	[%i0+%g0]0x81,%f24	! %f24 = 00000940 c3ae2ea1
!	Mem[000000001000141c] = ff0000ff, %l7 = 54c38bdb000000ff
	ldsw	[%i0+0x01c],%l7		! %l7 = ffffffffff0000ff
!	Mem[0000000030001410] = a96e6a5a 864fc9ff, %l0 = 00000000, %l1 = 864fc9ff
	ldda	[%i0+%o5]0x89,%l0	! %l0 = 00000000864fc9ff 00000000a96e6a5a
!	Mem[0000000010101410] = ffffffff 00000000, %l6 = 000000ff, %l7 = ff0000ff
	ldda	[%i4+%o5]0x80,%l6	! %l6 = 00000000ffffffff 0000000000000000
!	Mem[0000000010081410] = 54c38bdb000000ff, %f6  = 0000ff00 ff0000ff
	ldda	[%i2+%o5]0x80,%f6 	! %f6  = 54c38bdb 000000ff
!	Mem[0000000030041400] = ff000000, %l5 = 00000000000000ff
	lduwa	[%i1+%g0]0x89,%l5	! %l5 = 00000000ff000000
!	Mem[0000000010081410] = db8bc354, %l1 = 00000000a96e6a5a
	ldswa	[%i2+%o5]0x88,%l1	! %l1 = ffffffffdb8bc354
!	Starting 10 instruction Store Burst
!	%f0  = 54c38bdb 000000ff 400913b6 db8bc354
!	%f4  = ffffffff ffffffff 54c38bdb 000000ff
!	%f8  = ffffffff 00ffffff ffff0000 864fc9ff
!	%f12 = 0000ff00 c9ff0000 ff0000ff 00000000
	stda	%f0,[%i6]ASI_BLK_SL	! Block Store to 0000000030181400

p0_label_284:
!	Mem[00000000100c1410] = ff000000, %l4 = 00000000000000ff
	swapa	[%i3+%o5]0x80,%l4	! %l4 = 00000000ff000000
!	Mem[00000000211c0001] = ffff7bbb, %l2 = 00000000ff000000
	ldstuba	[%o2+0x001]%asi,%l2	! %l2 = 000000ff000000ff
!	%f20 = 00000000 864fc9ff, Mem[0000000030081410] = 40000000 00000054
	stda	%f20,[%i2+%o5]0x81	! Mem[0000000030081410] = 00000000 864fc9ff
!	Mem[00000000211c0000] = ffff7bbb, %l2 = 00000000000000ff
	ldstub	[%o2+%g0],%l2		! %l2 = 000000ff000000ff
!	Mem[0000000010081400] = ff6e6a5a, %l3 = 00000000db8bc354
	ldstuba	[%i2+%g0]0x88,%l3	! %l3 = 0000005a000000ff
!	%l3 = 000000000000005a, Mem[0000000030101400] = 0000ffc9
	stba	%l3,[%i4+%g0]0x89	! Mem[0000000030101400] = 0000ff5a
!	%l3 = 000000000000005a, Mem[0000000030101400] = 0000ff5a
	stwa	%l3,[%i4+%g0]0x89	! Mem[0000000030101400] = 0000005a
!	Mem[00000000300c1410] = ff00005a, %l6 = 00000000ffffffff
	ldstuba	[%i3+%o5]0x81,%l6	! %l6 = 000000ff000000ff
!	Mem[0000000010141410] = 40000000, %l5 = 00000000ff000000
	ldstuba	[%i5+%o5]0x80,%l5	! %l5 = 00000040000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = 000000ffffffffff, %l3 = 000000000000005a
	ldxa	[%i3+%o5]0x80,%l3	! %l3 = 000000ffffffffff

p0_label_285:
	membar	#Sync			! Added by membar checker (55)
!	Mem[0000000010181400] = ff0913b6ff0000ff, %l6 = 00000000000000ff
	ldxa	[%i6+%g0]0x88,%l6	! %l6 = ff0913b6ff0000ff
!	Mem[0000000030101410] = 000000ff, %f25 = c3ae2ea1
	lda	[%i4+%o5]0x89,%f25	! %f25 = 000000ff
!	Mem[00000000100c1400] = 000077ff, %l3 = 000000ffffffffff
	ldsha	[%i3+%g0]0x88,%l3	! %l3 = 00000000000077ff
!	Code Fragment 4
p0_fragment_9:
!	%l0 = 00000000864fc9ff
	setx	0xe3efc377d4a22670,%g7,%l0 ! %l0 = e3efc377d4a22670
!	%l1 = ffffffffdb8bc354
	setx	0x24e17297a624527c,%g7,%l1 ! %l1 = 24e17297a624527c
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = e3efc377d4a22670
	setx	0xad342a7065abc6f1,%g7,%l0 ! %l0 = ad342a7065abc6f1
!	%l1 = 24e17297a624527c
	setx	0xc5a70b2fb1f3d035,%g7,%l1 ! %l1 = c5a70b2fb1f3d035
!	Mem[00000000100c1408] = 0000ff0000000000, %l3 = 00000000000077ff
	ldxa	[%i3+%o4]0x80,%l3	! %l3 = 0000ff0000000000
!	Mem[0000000010081434] = ff000046, %l2 = 00000000000000ff
	lduh	[%i2+0x034],%l2		! %l2 = 000000000000ff00
!	Mem[0000000010101410] = ffffffff, %l1 = c5a70b2fb1f3d035
	ldsba	[%i4+%o5]0x88,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010141410] = ff000000, %f0  = 54c38bdb
	lda	[%i5+0x010]%asi,%f0 	! %f0 = ff000000
!	Mem[0000000030101408] = 00000000, %f5  = ffffffff
	lda	[%i4+%o4]0x81,%f5 	! %f5 = 00000000
!	Starting 10 instruction Store Burst
!	%f24 = 00000940 000000ff, Mem[00000000100c1400] = 000077ff b6130940
	stda	%f24,[%i3+%g0]0x88	! Mem[00000000100c1400] = 00000940 000000ff

!	Check Point 57 for processor 0

	set	p0_check_pt_data_57,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = ad342a7065abc6f1
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = ffffffffffffffff
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 000000000000ff00
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 0000ff0000000000
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 00000000ff000000
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 0000000000000040
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = ff0913b6ff0000ff
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 0000000000000000
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = ff000000 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x50],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = 400913b6 db8bc354
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x58],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = ffffffff 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x60],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 54c38bdb 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x68],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = 00000940 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1

!	Check Point 57 completed


p0_label_286:
!	%l5 = 0000000000000040, Mem[00000000100c1400] = ff000000, %asi = 80
	stwa	%l5,[%i3+0x000]%asi	! Mem[00000000100c1400] = 00000040
!	Mem[0000000030141410] = 0000ff00, %l6 = ff0913b6ff0000ff
	ldstuba	[%i5+%o5]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[000000001008140c] = ffffffff, %l0 = 65abc6f1, %l5 = 00000040
	add	%i2,0x0c,%g1
	casa	[%g1]0x80,%l0,%l5	! %l5 = 00000000ffffffff
!	%l2 = 000000000000ff00, Mem[0000000010081410] = 54c38bdb
	stba	%l2,[%i2+%o5]0x80	! Mem[0000000010081410] = 00c38bdb
!	Mem[00000000300c1400] = 000000ff, %l7 = 0000000000000000
	ldstuba	[%i3+%g0]0x89,%l7	! %l7 = 000000ff000000ff
!	%l7 = 00000000000000ff, Mem[0000000010141404] = ffffffc9, %asi = 80
	stha	%l7,[%i5+0x004]%asi	! Mem[0000000010141404] = 00ffffc9
!	%l0 = ad342a7065abc6f1, Mem[0000000010141410] = ff000000
	stha	%l0,[%i5+%o5]0x80	! Mem[0000000010141410] = c6f10000
!	%l1 = ffffffffffffffff, Mem[0000000030101408] = 00000000
	stha	%l1,[%i4+%o4]0x81	! Mem[0000000030101408] = ffff0000
!	%l5 = 00000000ffffffff, Mem[0000000010001438] = ff000000ffffffff
	stx	%l5,[%i0+0x038]		! Mem[0000000010001438] = 00000000ffffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = ff000000db8bc300, %f0  = ff000000 000000ff
	ldda	[%i2+%o5]0x88,%f0 	! %f0  = ff000000 db8bc300

p0_label_287:
	membar	#Sync			! Added by membar checker (56)
!	Mem[0000000030101400] = 5a000000 63c94f86 ffff0000 00000000
!	Mem[0000000030101410] = ff000000 db8bc354 ccbe12ae ffffffff
!	Mem[0000000030101420] = 400913b6 ff000000 00000096 0000ffff
!	Mem[0000000030101430] = 000000ff 00000000 a3002dba ffffffff
	ldda	[%i4]ASI_BLK_S,%f16	! Block Load from 0000000030101400
!	Mem[0000000010101408] = 54c38bdb, %l6 = 0000000000000000
	ldswa	[%i4+%o4]0x80,%l6	! %l6 = 0000000054c38bdb
!	Mem[0000000010041428] = d56a83d0, %f2  = 400913b6
	lda	[%i1+0x028]%asi,%f2 	! %f2 = d56a83d0
!	Mem[0000000030081410] = ffc94f8600000000, %f10 = ffff0000 864fc9ff
	ldda	[%i2+%o5]0x89,%f10	! %f10 = ffc94f86 00000000
!	Mem[0000000030141400] = ff0000ff, %l4 = 00000000ff000000
	ldswa	[%i5+%g0]0x89,%l4	! %l4 = ffffffffff0000ff
!	Mem[0000000010181400] = ff0000ff b61309ff, %l2 = 0000ff00, %l3 = 00000000
	ldd	[%i6+%g0],%l2		! %l2 = 00000000ff0000ff 00000000b61309ff
!	Mem[000000001010141c] = 00000000, %f4  = ffffffff
	lda	[%i4+0x01c]%asi,%f4 	! %f4 = 00000000
!	Mem[0000000030041410] = ff000000, %l6 = 0000000054c38bdb
	ldswa	[%i1+%o5]0x81,%l6	! %l6 = ffffffffff000000
!	Mem[0000000030181410] = ffffffff ffffffff, %l6 = ff000000, %l7 = 000000ff
	ldda	[%i6+%o5]0x81,%l6	! %l6 = 00000000ffffffff 00000000ffffffff
!	Starting 10 instruction Store Burst
!	%l4 = ffffffffff0000ff, Mem[0000000010141430] = da770000
	stb	%l4,[%i5+0x030]		! Mem[0000000010141430] = ff770000

p0_label_288:
!	%f0  = ff000000, Mem[0000000010041400] = a96e6a5a
	sta	%f0 ,[%i1+%g0]0x88	! Mem[0000000010041400] = ff000000
!	%l3 = 00000000b61309ff, Mem[0000000030181410] = ffffffff
	stwa	%l3,[%i6+%o5]0x89	! Mem[0000000030181410] = b61309ff
!	%f10 = ffc94f86 00000000, Mem[0000000010041410] = ffffffff 63c94f86
	stda	%f10,[%i1+0x010]%asi	! Mem[0000000010041410] = ffc94f86 00000000
!	Mem[0000000010001408] = ff000000, %l5 = 00000000ffffffff
	swapa	[%i0+%o4]0x88,%l5	! %l5 = 00000000ff000000
!	Mem[0000000030001410] = ffc94f86, %l0 = ad342a7065abc6f1
	ldstuba	[%i0+%o5]0x81,%l0	! %l0 = 000000ff000000ff
!	Mem[00000000100c1418] = ffff0000, %l4 = ffffffffff0000ff
	ldstub	[%i3+0x018],%l4		! %l4 = 000000ff000000ff
!	Mem[00000000300c1408] = ffffffff, %l2 = 00000000ff0000ff
	ldstuba	[%i3+%o4]0x89,%l2	! %l2 = 000000ff000000ff
!	Mem[0000000030141400] = ff0000ff, %l5 = 00000000ff000000
	swapa	[%i5+%g0]0x81,%l5	! %l5 = 00000000ff0000ff
!	Mem[0000000030001410] = ffc94f86, %l3 = 00000000b61309ff
	ldstuba	[%i0+%o5]0x81,%l3	! %l3 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = ff000000, %l6 = 00000000ffffffff
	lduha	[%i2+%o4]0x81,%l6	! %l6 = 000000000000ff00

p0_label_289:
!	Mem[0000000030101400] = 5a00000063c94f86, %f2  = d56a83d0 db8bc354
	ldda	[%i4+%g0]0x81,%f2 	! %f2  = 5a000000 63c94f86
!	Mem[000000001014141c] = 000000ff, %l5 = 00000000ff0000ff
	ldsh	[%i5+0x01e],%l5		! %l5 = 00000000000000ff
!	Mem[0000000010001408] = ffffffff, %l1 = ffffffffffffffff
	lduha	[%i0+%o4]0x80,%l1	! %l1 = 000000000000ffff
!	Mem[0000000010141408] = ff0000ff, %l0 = 00000000000000ff
	ldsha	[%i5+%o4]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010101410] = ffffffff, %l0 = 00000000000000ff
	lduha	[%i4+%o5]0x80,%l0	! %l0 = 000000000000ffff
!	Mem[0000000010041408] = 00000000, %l6 = 000000000000ff00
	ldsba	[%i1+%o4]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000030001410] = 864fc9ff, %l7 = 00000000ffffffff
	lduha	[%i0+%o5]0x89,%l7	! %l7 = 000000000000c9ff
!	Mem[0000000030101408] = 0000ffff, %f0  = ff000000
	lda	[%i4+%o4]0x89,%f0 	! %f0 = 0000ffff
!	Mem[0000000010081408] = ff4fc9ff, %l6 = 0000000000000000
	ldswa	[%i2+%o4]0x80,%l6	! %l6 = ffffffffff4fc9ff
!	Starting 10 instruction Store Burst
!	%l6 = ffffffffff4fc9ff, Mem[0000000030041410] = ff000000
	stwa	%l6,[%i1+%o5]0x81	! Mem[0000000030041410] = ff4fc9ff

p0_label_290:
!	Mem[0000000030001400] = 00000940, %l6 = ffffffffff4fc9ff
	swapa	[%i0+%g0]0x81,%l6	! %l6 = 0000000000000940
!	Mem[0000000030141400] = 000000ff, %l0 = 000000000000ffff
	ldstuba	[%i5+%g0]0x89,%l0	! %l0 = 000000ff000000ff
!	%l7 = 000000000000c9ff, Mem[0000000030081408] = ff000000
	stba	%l7,[%i2+%o4]0x81	! Mem[0000000030081408] = ff000000
!	%f2  = 5a000000 63c94f86, Mem[00000000100c1430] = ff000000 db8bc354
	stda	%f2 ,[%i3+0x030]%asi	! Mem[00000000100c1430] = 5a000000 63c94f86
!	%l0 = 00000000000000ff, Mem[0000000030001410] = 864fc9ff
	stha	%l0,[%i0+%o5]0x89	! Mem[0000000030001410] = 864f00ff
!	%f20 = ff000000, Mem[0000000030081410] = 00000000
	sta	%f20,[%i2+%o5]0x81	! Mem[0000000030081410] = ff000000
!	Mem[0000000010181410] = 864fc9ff, %l3 = 00000000000000ff
	ldstuba	[%i6+%o5]0x88,%l3	! %l3 = 000000ff000000ff
!	%f14 = ff0000ff 00000000, Mem[0000000030001410] = 864f00ff a96e6a5a
	stda	%f14,[%i0+%o5]0x89	! Mem[0000000030001410] = ff0000ff 00000000
!	%l0 = 000000ff, %l1 = 0000ffff, Mem[0000000030001400] = ff4fc9ff c3ae2ea1
	stda	%l0,[%i0+%g0]0x81	! Mem[0000000030001400] = 000000ff 0000ffff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1418] = ffff0000000000ff, %f18 = ffff0000 00000000
	ldd	[%i3+0x018],%f18	! %f18 = ffff0000 000000ff

!	Check Point 58 for processor 0

	set	p0_check_pt_data_58,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 000000000000ffff
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 0000000000000940
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 000000000000c9ff
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = 0000ffff db8bc300
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x50],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = 5a000000 63c94f86
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x58],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 00000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x60],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 54c38bdb 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x68],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = ffc94f86 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x70],%g3
	std	%f16,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f16 = 5a000000 63c94f86
	bne	%xcc,p0_freg_check_fail
	mov	0xf16,%g1
	ldx	[%g4+0x78],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = ffff0000 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1
	ldx	[%g4+0x80],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = ff000000 db8bc354
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1
	ldx	[%g4+0x88],%g3
	std	%f22,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f22 = ccbe12ae ffffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf22,%g1
	ldx	[%g4+0x90],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = 400913b6 ff000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1
	ldx	[%g4+0x98],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = 00000096 0000ffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1
	ldx	[%g4+0xa0],%g3
	std	%f28,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f28 = 000000ff 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf28,%g1
	ldx	[%g4+0xa8],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = a3002dba ffffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 58 completed


p0_label_291:
!	Mem[00000000300c1408] = ffffffff db8bc354, %l0 = 000000ff, %l1 = 0000ffff
	ldda	[%i3+%o4]0x81,%l0	! %l0 = 00000000ffffffff 00000000db8bc354
!	Mem[000000001000140c] = ff0000ff, %l4 = 00000000000000ff
	ldsba	[%i0+0x00c]%asi,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000030141408] = ff000000, %l2 = 00000000000000ff
	lduha	[%i5+%o4]0x81,%l2	! %l2 = 000000000000ff00
!	Mem[0000000030081410] = 000000ff, %l0 = 00000000ffffffff
	ldswa	[%i2+%o5]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030001408] = 000000ff, %l3 = 00000000000000ff
	lduba	[%i0+%o4]0x89,%l3	! %l3 = 00000000000000ff
	membar	#Sync			! Added by membar checker (57)
!	Mem[00000000300c1400] = ff000000 000000ff ffffffff db8bc354
!	Mem[00000000300c1410] = ff00005a 000000ff 0000ff00 ff0000ff
!	Mem[00000000300c1420] = ff0000ff 00000000 ffff0000 864fc9ff
!	Mem[00000000300c1430] = 0000ff00 c9ff0000 000077da 00000000
	ldda	[%i3]ASI_BLK_SL,%f0	! Block Load from 00000000300c1400
!	Mem[0000000010141434] = 000000ff, %l1 = 00000000db8bc354
	lduha	[%i5+0x034]%asi,%l1	! %l1 = 0000000000000000
!	Mem[00000000100c1400] = 00000040, %l2 = 000000000000ff00
	lduba	[%i3+%g0]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000010001408] = ffffffff, %l7 = 000000000000c9ff
	ldsba	[%i0+%o4]0x80,%l7	! %l7 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%f16 = 5a000000 63c94f86 ffff0000 000000ff
!	%f20 = ff000000 db8bc354 ccbe12ae ffffffff
!	%f24 = 400913b6 ff000000 00000096 0000ffff
!	%f28 = 000000ff 00000000 a3002dba ffffffff
	stda	%f16,[%i6]ASI_BLK_SL	! Block Store to 0000000030181400

p0_label_292:
!	Mem[0000000030141400] = ff000000, %l1 = 0000000000000000
	ldstuba	[%i5+%g0]0x81,%l1	! %l1 = 000000ff000000ff
!	Mem[0000000030041400] = 000000ff, %l3 = 00000000000000ff
	ldstuba	[%i1+%g0]0x81,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030101410] = ff000000, %l2 = 0000000000000000
	ldstuba	[%i4+%o5]0x81,%l2	! %l2 = 000000ff000000ff
!	Mem[0000000020800000] = ffff7d94, %l3 = 0000000000000000
	ldstuba	[%o1+0x000]%asi,%l3	! %l3 = 000000ff000000ff
!	Mem[0000000010001410] = 000000ff, %l6 = 0000000000000940
	swapa	[%i0+%o5]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010001426] = ffff00ff, %l0 = 00000000000000ff
	ldstuba	[%i0+0x026]%asi,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030081410] = 000000ff, %l7 = ffffffffffffffff
	ldstuba	[%i2+%o5]0x89,%l7	! %l7 = 000000ff000000ff
	membar	#Sync			! Added by membar checker (58)
!	%l3 = 00000000000000ff, Mem[00000000300c1400] = ff000000000000ff
	stxa	%l3,[%i3+%g0]0x89	! Mem[00000000300c1400] = 00000000000000ff
!	Mem[0000000030041408] = 0000ffff, %l5 = 00000000000000ff
	ldstuba	[%i1+%o4]0x89,%l5	! %l5 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = 000000ff, %f15 = da770000
	lda	[%i6+%o4]0x88,%f15	! %f15 = 000000ff

p0_label_293:
!	Mem[00000000211c0000] = ffff7bbb, %l7 = 00000000000000ff
	ldub	[%o2+0x001],%l7		! %l7 = 00000000000000ff
!	Mem[0000000010101438] = 00000000 000000ff, %l2 = 000000ff, %l3 = 000000ff
	ldd	[%i4+0x038],%l2		! %l2 = 0000000000000000 00000000000000ff
!	Mem[0000000010141410] = 0000f1c6, %l5 = 00000000000000ff
	ldswa	[%i5+%o5]0x88,%l5	! %l5 = 000000000000f1c6
!	Mem[00000000300c1400] = ff000000, %l5 = 000000000000f1c6
	ldswa	[%i3+%g0]0x81,%l5	! %l5 = ffffffffff000000
!	Mem[00000000100c1410] = 000000ff, %l5 = ffffffffff000000
	ldsha	[%i3+%o5]0x80,%l5	! %l5 = 0000000000000000
!	Mem[00000000100c1410] = 000000ff, %l6 = 00000000000000ff
	ldsba	[%i3+%o5]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000030081400] = ff000000b61309db, %l5 = 0000000000000000
	ldxa	[%i2+%g0]0x89,%l5	! %l5 = ff000000b61309db
!	Mem[0000000030081400] = db0913b6000000ff, %f30 = a3002dba ffffffff
	ldda	[%i2+%g0]0x81,%f30	! %f30 = db0913b6 000000ff
!	Mem[0000000010001400] = ffffffff, %l4 = ffffffffffffffff
	lduha	[%i0+%g0]0x88,%l4	! %l4 = 000000000000ffff
!	Starting 10 instruction Store Burst
!	%f24 = 400913b6 ff000000, Mem[0000000010041410] = 864fc9ff 00000000
	stda	%f24,[%i1+%o5]0x88	! Mem[0000000010041410] = 400913b6 ff000000

p0_label_294:
!	Mem[00000000100c1400] = 00000040, %l0 = 0000000000000000
	ldstuba	[%i3+%g0]0x80,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010041403] = 000000ff, %l3 = 00000000000000ff
	ldstuba	[%i1+0x003]%asi,%l3	! %l3 = 000000ff000000ff
!	Mem[0000000010181424] = ff0000ff, %l1 = 00000000000000ff, %asi = 80
	swapa	[%i6+0x024]%asi,%l1	! %l1 = 00000000ff0000ff
!	%f5  = 5a0000ff, Mem[0000000030181410] = db8bc354
	sta	%f5 ,[%i6+%o5]0x89	! Mem[0000000030181410] = 5a0000ff
!	%f28 = 000000ff, Mem[00000000300c1410] = 5a0000ff
	sta	%f28,[%i3+%o5]0x89	! Mem[00000000300c1410] = 000000ff
!	%l1 = 00000000ff0000ff, Mem[0000000010101408] = ff000000db8bc354
	stxa	%l1,[%i4+%o4]0x88	! Mem[0000000010101408] = 00000000ff0000ff
!	%f26 = 00000096 0000ffff, Mem[0000000010081410] = 00c38bdb 000000ff
	stda	%f26,[%i2+%o5]0x80	! Mem[0000000010081410] = 00000096 0000ffff
!	%f2  = 54c38bdb ffffffff, Mem[0000000030001410] = 00000000 ff0000ff
	stda	%f2 ,[%i0+%o5]0x89	! Mem[0000000030001410] = 54c38bdb ffffffff
!	%l6 = 0000000000000000, Mem[00000000100c1400] = ff000040
	stba	%l6,[%i3+%g0]0x80	! Mem[00000000100c1400] = 00000040
!	Starting 10 instruction Load Burst
!	Mem[0000000030181410] = ff00005a, %l0 = 0000000000000000
	ldsha	[%i6+%o5]0x81,%l0	! %l0 = ffffffffffffff00

p0_label_295:
!	Mem[0000000010001408] = ffffffff, %l6 = 0000000000000000
	ldsba	[%i0+%o4]0x88,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010101418] = 703f71ab00000000, %f22 = ccbe12ae ffffffff
	ldda	[%i4+0x018]%asi,%f22	! %f22 = 703f71ab 00000000
!	Mem[0000000010041418] = ff00ff00, %l7 = 00000000000000ff
	lduh	[%i1+0x01a],%l7		! %l7 = 000000000000ff00
	membar	#Sync			! Added by membar checker (59)
!	Mem[0000000010181400] = ff0000ff b61309ff ff000000 000000ff
!	Mem[0000000010181410] = ffc94f86 00000000 00000000 ffffffff
!	Mem[0000000010181420] = 00ffffff 000000ff ff000000 00000000
!	Mem[0000000010181430] = ff0000ff b6130940 ff0000ff ff0000ff
	ldda	[%i6]ASI_BLK_PL,%f16	! Block Load from 0000000010181400
!	Mem[0000000030001410] = ffffffff, %l5 = ff000000b61309db
	ldsba	[%i0+%o5]0x81,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000030081410] = 000000ff, %l1 = 00000000ff0000ff
	ldswa	[%i2+%o5]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010181410] = ffc94f86, %l2 = 0000000000000000
	lduha	[%i6+%o5]0x80,%l2	! %l2 = 000000000000ffc9
!	Mem[0000000030181410] = ff00005a 000000ff, %l2 = 0000ffc9, %l3 = 000000ff
	ldda	[%i6+%o5]0x81,%l2	! %l2 = 00000000ff00005a 00000000000000ff
!	Mem[0000000010181410] = ffc94f86, %l0 = ffffffffffffff00
	lduwa	[%i6+%o5]0x80,%l0	! %l0 = 00000000ffc94f86
!	Starting 10 instruction Store Burst
!	%l3 = 00000000000000ff, Mem[0000000030141410] = 0000ffff
	stba	%l3,[%i5+%o5]0x89	! Mem[0000000030141410] = 0000ffff

!	Check Point 59 for processor 0

	set	p0_check_pt_data_59,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 00000000ffc94f86
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 00000000ff00005a
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 000000000000ffff
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = ffffffffffffffff
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = ffffffffffffffff
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 000000000000ff00
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = ff000000 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x50],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = 54c38bdb ffffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x58],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = ff000000 5a0000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x60],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = ff0000ff 00ff0000
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x68],%g3
	std	%f8,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f8 = 00000000 ff0000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf08,%g1
	ldx	[%g4+0x70],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = ffc94f86 0000ffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x78],%g3
	std	%f12,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f12 = 0000ffc9 00ff0000
	bne	%xcc,p0_freg_check_fail
	mov	0xf12,%g1
	ldx	[%g4+0x80],%g3
	std	%f14,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f14 = 00000000 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf14,%g1
	ldx	[%g4+0x88],%g3
	std	%f16,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f16 = ff0913b6 ff0000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf16,%g1
	ldx	[%g4+0x90],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = ff000000 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1
	ldx	[%g4+0x98],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = 00000000 864fc9ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1
	ldx	[%g4+0xa0],%g3
	std	%f22,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f22 = ffffffff 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf22,%g1
	ldx	[%g4+0xa8],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = ff000000 ffffff00
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1
	ldx	[%g4+0xb0],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = 00000000 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1
	ldx	[%g4+0xb8],%g3
	std	%f28,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f28 = 400913b6 ff0000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf28,%g1
	ldx	[%g4+0xc0],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = ff0000ff ff0000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 59 completed


p0_label_296:
!	%l4 = 000000000000ffff, Mem[0000000030141408] = ff000000
	stha	%l4,[%i5+%o4]0x81	! Mem[0000000030141408] = ffff0000
!	Mem[0000000010041400] = 000000ff, %l1 = 000000ff, %l6 = ffffffff
	casa	[%i1]0x80,%l1,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010001400] = ffffffff, %l4 = 000000000000ffff
	ldstuba	[%i0+%g0]0x88,%l4	! %l4 = 000000ff000000ff
	membar	#Sync			! Added by membar checker (60)
!	%l2 = 00000000ff00005a, Mem[0000000010181410] = ffc94f86
	stha	%l2,[%i6+%o5]0x80	! Mem[0000000010181410] = 005a4f86
!	%f4  = ff000000 5a0000ff, %l3 = 00000000000000ff
!	Mem[0000000010181430] = ff0000ffb6130940
	add	%i6,0x030,%g1
	stda	%f4,[%g1+%l3]ASI_PST8_P ! Mem[0000000010181430] = ff0000005a0000ff
!	%l5 = ffffffffffffffff, Mem[0000000010181400] = ff0000ff
	stba	%l5,[%i6+%g0]0x88	! Mem[0000000010181400] = ff0000ff
!	Mem[00000000100c1400] = 00000040, %l5 = ffffffffffffffff
	swapa	[%i3+%g0]0x80,%l5	! %l5 = 0000000000000040
!	Mem[00000000300c1408] = ffffffff, %l2 = 00000000ff00005a
	ldstuba	[%i3+%o4]0x81,%l2	! %l2 = 000000ff000000ff
!	%l6 = 000000ff, %l7 = 0000ff00, Mem[0000000010001408] = ffffffff ff0000ff
	stda	%l6,[%i0+%o4]0x80	! Mem[0000000010001408] = 000000ff 0000ff00
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = ffffffff, %l3 = 00000000000000ff
	ldsba	[%i1+%g0]0x88,%l3	! %l3 = ffffffffffffffff

p0_label_297:
!	Mem[0000000030041410] = ffc94f86ffc94fff, %f6  = ff0000ff 00ff0000
	ldda	[%i1+%o5]0x89,%f6 	! %f6  = ffc94f86 ffc94fff
!	Mem[0000000010081428] = 000000ff 00000000, %l2 = 000000ff, %l3 = ffffffff
	ldda	[%i2+0x028]%asi,%l2	! %l2 = 00000000000000ff 0000000000000000
!	Mem[0000000010001430] = 000000ff00000000, %l2 = 00000000000000ff
	ldx	[%i0+0x030],%l2		! %l2 = 000000ff00000000
!	Mem[0000000030041410] = ff4fc9ff, %l5 = 0000000000000040
	lduwa	[%i1+%o5]0x81,%l5	! %l5 = 00000000ff4fc9ff
!	Mem[0000000010081400] = ff6a6eff 64bd6ce4 ff4fc9ff ffffffff
!	Mem[0000000010081410] = 00000096 0000ffff 3a0000ff 06fd1e0b
!	Mem[0000000010081420] = 0000ffa5 0000ffff 000000ff 00000000
!	Mem[0000000010081430] = 000000ff ff000046 77da1f96 0b3a9e16
	ldda	[%i2]ASI_BLK_P,%f16	! Block Load from 0000000010081400
!	Mem[0000000030101410] = 54c38bdb 000000ff, %l4 = 000000ff, %l5 = ff4fc9ff
	ldda	[%i4+%o5]0x89,%l4	! %l4 = 00000000000000ff 0000000054c38bdb
!	Mem[0000000030081400] = db0913b6 000000ff ff000000 00009eff
!	Mem[0000000030081410] = ff000000 864fc9ff 00000000 dc003118
!	Mem[0000000030081420] = ffffffff 06fd1eff 000000ae 00000000
!	Mem[0000000030081430] = ffffffff ffff0000 ff000000 a5000000
	ldda	[%i2]ASI_BLK_S,%f16	! Block Load from 0000000030081400
!	Mem[0000000010001410] = 40090000, %l4 = 00000000000000ff
	ldswa	[%i0+%o5]0x80,%l4	! %l4 = 0000000040090000
!	Mem[0000000030181400] = 5a00000063c94f86, %f14 = 00000000 000000ff
	ldda	[%i6+%g0]0x89,%f14	! %f14 = 5a000000 63c94f86
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (61)
!	%l6 = 000000ff, %l7 = 0000ff00, Mem[0000000010081410] = 96000000 ffff0000
	stda	%l6,[%i2+%o5]0x88	! Mem[0000000010081410] = 000000ff 0000ff00

p0_label_298:
!	%l4 = 0000000040090000, Mem[0000000010081408] = ffc94fff
	stwa	%l4,[%i2+%o4]0x88	! Mem[0000000010081408] = 40090000
!	%l0 = ffc94f86, %l1 = 000000ff, Mem[0000000030001410] = ffffffff 54c38bdb
	stda	%l0,[%i0+%o5]0x89	! Mem[0000000030001410] = ffc94f86 000000ff
!	%l3 = 0000000000000000, Mem[00000000300c1410] = ff000000
	stba	%l3,[%i3+%o5]0x81	! Mem[00000000300c1410] = 00000000
!	Mem[0000000010101400] = 00ffffff, %l5 = 0000000054c38bdb
	swapa	[%i4+%g0]0x88,%l5	! %l5 = 0000000000ffffff
!	%f10 = ffc94f86 0000ffff, Mem[0000000030041408] = ffff0000 000000ff
	stda	%f10,[%i1+%o4]0x81	! Mem[0000000030041408] = ffc94f86 0000ffff
!	%l4 = 40090000, %l5 = 00ffffff, Mem[0000000030141410] = ffff0000 00000000
	stda	%l4,[%i5+%o5]0x81	! Mem[0000000030141410] = 40090000 00ffffff
!	%f14 = 5a000000 63c94f86, Mem[0000000030001408] = ff000000 0000ffc9
	stda	%f14,[%i0+%o4]0x81	! Mem[0000000030001408] = 5a000000 63c94f86
!	Mem[0000000030081410] = ff000000, %l3 = 0000000000000000
	ldstuba	[%i2+%o5]0x81,%l3	! %l3 = 000000ff000000ff
!	Mem[000000001018141d] = ffffffff, %l2 = 000000ff00000000
	ldstuba	[%i6+0x01d]%asi,%l2	! %l2 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101420] = 00000033, %f13 = 00ff0000
	lda	[%i4+0x020]%asi,%f13	! %f13 = 00000033

p0_label_299:
!	Mem[0000000010101410] = ffffffff, %l2 = 00000000000000ff
	ldswa	[%i4+%o5]0x80,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000010101410] = ffffffff, %l6 = 00000000000000ff
	ldsw	[%i4+%o5],%l6		! %l6 = ffffffffffffffff
!	Mem[00000000300c1410] = 00000000 000000ff, %l4 = 40090000, %l5 = 00ffffff
	ldda	[%i3+%o5]0x81,%l4	! %l4 = 0000000000000000 00000000000000ff
!	Mem[00000000211c0000] = ffff7bbb, %l7 = 000000000000ff00
	lduha	[%o2+0x000]%asi,%l7	! %l7 = 000000000000ffff
!	Mem[0000000030141408] = 000000000000ffff, %l5 = 00000000000000ff
	ldxa	[%i5+%o4]0x89,%l5	! %l5 = 000000000000ffff
!	Mem[0000000030181400] = 864fc963 0000005a ff000000 0000ffff
!	Mem[0000000030181410] = ff00005a 000000ff ffffffff ae12becc
!	Mem[0000000030181420] = 000000ff b6130940 ffff0000 96000000
!	Mem[0000000030181430] = 00000000 ff000000 ffffffff ba2d00a3
	ldda	[%i6]ASI_BLK_AIUSL,%f0	! Block Load from 0000000030181400
!	Mem[0000000010101410] = ffffffff, %l1 = 00000000000000ff
	lduba	[%i4+%o5]0x88,%l1	! %l1 = 00000000000000ff
!	%l3 = 00000000000000ff, %l0 = 00000000ffc94f86, %l7 = 000000000000ffff
	and	%l3,%l0,%l7		! %l7 = 0000000000000086
!	Mem[0000000030041408] = ffc94f86, %l3 = 00000000000000ff
	ldsba	[%i1+%o4]0x81,%l3	! %l3 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%f16 = db0913b6 000000ff ff000000 00009eff
!	%f20 = ff000000 864fc9ff 00000000 dc003118
!	%f24 = ffffffff 06fd1eff 000000ae 00000000
!	%f28 = ffffffff ffff0000 ff000000 a5000000
	stda	%f16,[%i0]ASI_COMMIT_S	! Block Store to 0000000030001400

p0_label_300:
!	%f4  = ff000000 5a0000ff, Mem[0000000030141408] = ffff0000 00000000
	stda	%f4 ,[%i5+%o4]0x81	! Mem[0000000030141408] = ff000000 5a0000ff
!	Mem[0000000020800040] = ffffac70, %l0 = 00000000ffc94f86
	ldstuba	[%o1+0x040]%asi,%l0	! %l0 = 000000ff000000ff
!	%f0  = 5a000000 63c94f86 ffff0000 000000ff
!	%f4  = ff000000 5a0000ff ccbe12ae ffffffff
!	%f8  = 400913b6 ff000000 00000096 0000ffff
!	%f12 = 000000ff 00000000 a3002dba ffffffff
	stda	%f0,[%i2]ASI_BLK_S	! Block Store to 0000000030081400
!	%l0 = 000000ff, %l1 = 000000ff, Mem[0000000010141400] = 000063ff 00ffffc9
	stda	%l0,[%i5+%g0]0x80	! Mem[0000000010141400] = 000000ff 000000ff
!	Mem[00000000300c1408] = ffffffff, %l2 = ffffffffffffffff
	swapa	[%i3+%o4]0x81,%l2	! %l2 = 00000000ffffffff
!	%l5 = 000000000000ffff, Mem[0000000010081410] = 000000ff
	stha	%l5,[%i2+%o5]0x88	! Mem[0000000010081410] = 0000ffff
!	Mem[0000000020800040] = ffffac70, %l4 = 0000000000000000
	ldstuba	[%o1+0x040]%asi,%l4	! %l4 = 000000ff000000ff
!	Mem[0000000010041410] = ff000000, %l6 = ffffffffffffffff
	swapa	[%i1+%o5]0x88,%l6	! %l6 = 00000000ff000000
!	%l5 = 000000000000ffff, Mem[0000000010101408] = 00000000ff0000ff
	stxa	%l5,[%i4+%o4]0x88	! Mem[0000000010101408] = 000000000000ffff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = 0000ff00, %l7 = 0000000000000086
	ldsha	[%i3+%o4]0x80,%l7	! %l7 = 0000000000000000

!	Check Point 60 for processor 0

	set	p0_check_pt_data_60,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 00000000ffffffff
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = ffffffffffffffff
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 000000000000ffff
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 00000000ff000000
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 0000000000000000
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = 5a000000 63c94f86
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x50],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = ffff0000 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x58],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = ff000000 5a0000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x60],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = ccbe12ae ffffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x68],%g3
	std	%f8,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f8 = 400913b6 ff000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf08,%g1
	ldx	[%g4+0x70],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = 00000096 0000ffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x78],%g3
	std	%f12,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f12 = 000000ff 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf12,%g1
	ldx	[%g4+0x80],%g3
	std	%f14,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f14 = a3002dba ffffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf14,%g1
	ldx	[%g4+0x88],%g3
	std	%f16,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f16 = db0913b6 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf16,%g1
	ldx	[%g4+0x90],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = ff000000 00009eff
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1
	ldx	[%g4+0x98],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = ff000000 864fc9ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1
	ldx	[%g4+0xa0],%g3
	std	%f22,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f22 = 00000000 dc003118
	bne	%xcc,p0_freg_check_fail
	mov	0xf22,%g1
	ldx	[%g4+0xa8],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = ffffffff 06fd1eff
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1
	ldx	[%g4+0xb0],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = 000000ae 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1
	ldx	[%g4+0xb8],%g3
	std	%f28,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f28 = ffffffff ffff0000
	bne	%xcc,p0_freg_check_fail
	mov	0xf28,%g1
	ldx	[%g4+0xc0],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = ff000000 a5000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 60 completed


p0_label_301:
!	Mem[0000000030141400] = ff00000000000000, %l3 = ffffffffffffffff
	ldxa	[%i5+%g0]0x81,%l3	! %l3 = ff00000000000000
!	Mem[0000000010181400] = ff0000ff, %f17 = 000000ff
	lda	[%i6+%g0]0x80,%f17	! %f17 = ff0000ff
	membar	#Sync			! Added by membar checker (62)
!	Mem[0000000010081400] = ff6a6eff, %l2 = 00000000ffffffff
	ldswa	[%i2+%g0]0x80,%l2	! %l2 = ffffffffff6a6eff
!	Mem[0000000010041410] = ffffffff, %l0 = 00000000000000ff
	lduba	[%i1+%o5]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[00000000300c1408] = 54c38bdb ffffffff, %l2 = ff6a6eff, %l3 = 00000000
	ldda	[%i3+%o4]0x89,%l2	! %l2 = 00000000ffffffff 0000000054c38bdb
!	Mem[00000000300c1410] = ff000000 00000000, %l2 = ffffffff, %l3 = 54c38bdb
	ldda	[%i3+%o5]0x89,%l2	! %l2 = 0000000000000000 00000000ff000000
!	Mem[0000000010181400] = ff0913b6ff0000ff, %f12 = 000000ff 00000000
	ldda	[%i6+%g0]0x88,%f12	! %f12 = ff0913b6 ff0000ff
!	Mem[0000000010181418] = 00000000ffffffff, %l6 = 00000000ff000000
	ldxa	[%i6+0x018]%asi,%l6	! %l6 = 00000000ffffffff
!	Mem[0000000030081408] = ffff0000000000ff, %l2 = 0000000000000000
	ldxa	[%i2+%o4]0x81,%l2	! %l2 = ffff0000000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000010101418] = 703f71ab00000000, %l2 = ffff0000000000ff, %l4 = 00000000000000ff
	add	%i4,0x18,%g1
	casxa	[%g1]0x80,%l2,%l4	! %l4 = 703f71ab00000000

p0_label_302:
!	Mem[0000000030081400] = 5a000000, %l1 = 00000000000000ff
	ldstuba	[%i2+%g0]0x81,%l1	! %l1 = 0000005a000000ff
!	Mem[0000000010041431] = 000000ff, %l0 = 00000000000000ff
	ldstub	[%i1+0x031],%l0		! %l0 = 00000000000000ff
!	Mem[0000000020800000] = ffff7d94, %l6 = 00000000ffffffff
	ldstuba	[%o1+0x000]%asi,%l6	! %l6 = 000000ff000000ff
!	Mem[0000000010041400] = ffffffff, %l6 = 00000000000000ff
	swapa	[%i1+%g0]0x80,%l6	! %l6 = 00000000ffffffff
!	%l1 = 000000000000005a, Mem[00000000100c1438] = ffffffffffffffff
	stx	%l1,[%i3+0x038]		! Mem[00000000100c1438] = 000000000000005a
!	%l6 = ffffffff, %l7 = 00000000, Mem[0000000030101410] = ff000000 db8bc354
	stda	%l6,[%i4+%o5]0x81	! Mem[0000000030101410] = ffffffff 00000000
!	%l6 = 00000000ffffffff, Mem[0000000010181400] = ff0000ff
	stba	%l6,[%i6+%g0]0x88	! Mem[0000000010181400] = ff0000ff
!	Mem[0000000030001410] = 000000ff, %l2 = ffff0000000000ff
	swapa	[%i0+%o5]0x89,%l2	! %l2 = 00000000000000ff
!	%f22 = 00000000 dc003118, Mem[0000000030141410] = 40090000 00ffffff
	stda	%f22,[%i5+%o5]0x81	! Mem[0000000030141410] = 00000000 dc003118
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = 000000ff, %l3 = 00000000ff000000
	ldsba	[%i3+%g0]0x89,%l3	! %l3 = ffffffffffffffff

p0_label_303:
!	Mem[0000000030141408] = 000000ff, %l4 = 703f71ab00000000
	lduha	[%i5+%o4]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[00000000100c1400] = ffffffff, %l0 = 0000000000000000
	lduha	[%i3+%g0]0x80,%l0	! %l0 = 000000000000ffff
!	Mem[0000000030181408] = ff0000000000ffff, %l0 = 000000000000ffff
	ldxa	[%i6+%o4]0x81,%l0	! %l0 = ff0000000000ffff
!	Mem[0000000030181410] = ff00005a, %l0 = ff0000000000ffff
	ldswa	[%i6+%o5]0x81,%l0	! %l0 = ffffffffff00005a
!	Mem[00000000211c0000] = ffff7bbb, %l7 = 0000000000000000
	ldsb	[%o2+%g0],%l7		! %l7 = ffffffffffffffff
!	Mem[0000000010041408] = 00000000, %l6 = 00000000ffffffff
	ldsha	[%i1+%o4]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000010101400] = db8bc354, %l2 = 00000000000000ff
	ldswa	[%i4+%g0]0x80,%l2	! %l2 = ffffffffdb8bc354
!	Mem[0000000030041408] = 864fc9ff, %l0 = ffffffffff00005a
	ldsha	[%i1+%o4]0x89,%l0	! %l0 = ffffffffffffc9ff
!	Mem[0000000030101410] = 00000000ffffffff, %l6 = 0000000000000000
	ldxa	[%i4+%o5]0x89,%l6	! %l6 = 00000000ffffffff
!	Starting 10 instruction Store Burst
!	%l4 = 00000000000000ff, Mem[00000000300c1408] = ffffffff
	stwa	%l4,[%i3+%o4]0x89	! Mem[00000000300c1408] = 000000ff

p0_label_304:
!	Mem[00000000300c1408] = 000000ff, %l7 = ffffffffffffffff
	ldstuba	[%i3+%o4]0x89,%l7	! %l7 = 000000ff000000ff
!	Mem[000000001004141c] = db8bc354, %l6 = ffffffff, %l1 = 0000005a
	add	%i1,0x1c,%g1
	casa	[%g1]0x80,%l6,%l1	! %l1 = 00000000db8bc354
!	Mem[0000000010081428] = 000000ff, %l7 = 00000000000000ff
	ldstub	[%i2+0x028],%l7		! %l7 = 00000000000000ff
!	%l2 = db8bc354, %l3 = ffffffff, Mem[0000000010101410] = ffffffff 00000000
	stda	%l2,[%i4+%o5]0x80	! Mem[0000000010101410] = db8bc354 ffffffff
!	%l7 = 0000000000000000, Mem[0000000030181410] = 5a0000ff
	stwa	%l7,[%i6+%o5]0x89	! Mem[0000000030181410] = 00000000
!	%l4 = 00000000000000ff, Mem[0000000010081400] = ff6a6eff
	stba	%l4,[%i2+%g0]0x80	! Mem[0000000010081400] = ff6a6eff
!	%l2 = ffffffffdb8bc354, Mem[0000000010141408] = ff0000ff
	stwa	%l2,[%i5+%o4]0x88	! Mem[0000000010141408] = db8bc354
!	%l7 = 0000000000000000, Mem[0000000010041400] = 000000ff00000000
	stxa	%l7,[%i1+%g0]0x80	! Mem[0000000010041400] = 0000000000000000
!	Mem[0000000010101410] = db8bc354, %l4 = 00000000000000ff
	ldstuba	[%i4+%o5]0x80,%l4	! %l4 = 000000db000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = 000000000000ffff, %f4  = ff000000 5a0000ff
	ldda	[%i4+%o4]0x89,%f4 	! %f4  = 00000000 0000ffff

p0_label_305:
	membar	#Sync			! Added by membar checker (63)
!	Mem[00000000300c1400] = ff000000 00000000 ff000000 db8bc354
!	Mem[00000000300c1410] = 00000000 000000ff 0000ff00 ff0000ff
!	Mem[00000000300c1420] = ff0000ff 00000000 ffff0000 864fc9ff
!	Mem[00000000300c1430] = 0000ff00 c9ff0000 000077da 00000000
	ldda	[%i3]ASI_BLK_S,%f0	! Block Load from 00000000300c1400
!	Mem[0000000030001408] = ff000000, %f26 = 000000ae
	lda	[%i0+%o4]0x81,%f26	! %f26 = ff000000
!	Mem[00000000100c1408] = 00ff0000, %l3 = ffffffffffffffff
	lduha	[%i3+%o4]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000030141408] = ff00005a000000ff, %l3 = 0000000000000000
	ldxa	[%i5+%o4]0x89,%l3	! %l3 = ff00005a000000ff
!	Mem[0000000030081410] = ff000000, %l5 = 000000000000ffff
	ldsha	[%i2+%o5]0x81,%l5	! %l5 = ffffffffffffff00
!	Mem[0000000010101408] = 0000ffff, %l2 = ffffffffdb8bc354
	lduba	[%i4+%o4]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030181408] = 000000ff, %l1 = 00000000db8bc354
	ldswa	[%i6+%o4]0x89,%l1	! %l1 = 00000000000000ff
!	%l4 = 00000000000000db, Mem[0000000010041408] = 00000000
	stwa	%l4,[%i1+%o4]0x88	! Mem[0000000010041408] = 000000db
!	Mem[0000000010101400] = db8bc354, %l6 = 00000000ffffffff
	lduwa	[%i4+%g0]0x80,%l6	! %l6 = 00000000db8bc354
!	Starting 10 instruction Store Burst
!	%l3 = ff00005a000000ff, Mem[0000000010101410] = ff8bc354
	stwa	%l3,[%i4+%o5]0x80	! Mem[0000000010101410] = 000000ff

!	Check Point 61 for processor 0

	set	p0_check_pt_data_61,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = ffffffffffffc9ff
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = ff00005a000000ff
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 00000000000000db
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = ffffffffffffff00
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 00000000db8bc354
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 0000000000000000
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = ff000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x50],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = ff000000 db8bc354
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x58],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 00000000 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x60],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 0000ff00 ff0000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x68],%g3
	std	%f8,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f8 = ff0000ff 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf08,%g1
	ldx	[%g4+0x70],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = ffff0000 864fc9ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x78],%g3
	std	%f12,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f12 = 0000ff00 c9ff0000
	bne	%xcc,p0_freg_check_fail
	mov	0xf12,%g1
	ldx	[%g4+0x80],%g3
	std	%f14,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f14 = 000077da 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf14,%g1
	ldx	[%g4+0x88],%g3
	std	%f16,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f16 = db0913b6 ff0000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf16,%g1
	ldx	[%g4+0x90],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = ff000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1

!	Check Point 61 completed


p0_label_306:
!	%l7 = 0000000000000000, Mem[0000000010041400] = 0000000000000000
	stxa	%l7,[%i1+%g0]0x88	! Mem[0000000010041400] = 0000000000000000
!	Mem[00000000300c1410] = 00000000, %l3 = ff00005a000000ff
	ldstuba	[%i3+%o5]0x89,%l3	! %l3 = 00000000000000ff
!	%l3 = 0000000000000000, Mem[00000000100c140a] = 0000ff00, %asi = 80
	stha	%l3,[%i3+0x00a]%asi	! Mem[00000000100c1408] = 00000000
!	%f4  = 00000000 000000ff, Mem[0000000030141408] = 000000ff ff00005a
	stda	%f4 ,[%i5+%o4]0x89	! Mem[0000000030141408] = 00000000 000000ff
!	%f12 = 0000ff00, Mem[0000000010001418] = 54c3ffdb
	sta	%f12,[%i0+0x018]%asi	! Mem[0000000010001418] = 0000ff00
!	%f20 = ff000000 864fc9ff, %l0 = ffffffffffffc9ff
!	Mem[0000000010001430] = 000000ff00000000
	add	%i0,0x030,%g1
	stda	%f20,[%g1+%l0]ASI_PST32_PL ! Mem[0000000010001430] = ffc94f86000000ff
!	%l0 = ffffc9ff, %l1 = 000000ff, Mem[0000000030041408] = ffc94f86 0000ffff
	stda	%l0,[%i1+%o4]0x81	! Mem[0000000030041408] = ffffc9ff 000000ff
!	%l1 = 00000000000000ff, Mem[00000000201c0000] = ffffaf65
	sth	%l1,[%o0+%g0]		! Mem[00000000201c0000] = 00ffaf65
!	Mem[00000000100c1414] = ffffffff, %l5 = ffffff00, %l4 = 000000db
	add	%i3,0x14,%g1
	casa	[%g1]0x80,%l5,%l4	! %l4 = 00000000ffffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = ffc94fff, %l6 = 00000000db8bc354
	lduba	[%i1+%o5]0x89,%l6	! %l6 = 00000000000000ff

p0_label_307:
!	Mem[0000000010101418] = 703f71ab, %f24 = ffffffff
	lda	[%i4+0x018]%asi,%f24	! %f24 = 703f71ab
!	Mem[0000000030041400] = ff0000ff, %l2 = 00000000000000ff
	ldsha	[%i1+%g0]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[00000000100c1428] = 00000000 00000000, %l4 = ffffffff, %l5 = ffffff00
	ldda	[%i3+0x028]%asi,%l4	! %l4 = 0000000000000000 0000000000000000
!	Mem[0000000010101430] = 77da1fff, %l2 = 00000000000000ff
	lduwa	[%i4+0x030]%asi,%l2	! %l2 = 0000000077da1fff
!	Mem[0000000010081430] = 000000ff ff000046, %l2 = 77da1fff, %l3 = 00000000
	ldd	[%i2+0x030],%l2		! %l2 = 00000000000000ff 00000000ff000046
!	Mem[0000000010101438] = 00000000000000ff, %f18 = ff000000 00009eff
	ldd	[%i4+0x038],%f18	! %f18 = 00000000 000000ff
!	Mem[0000000030001400] = db0913b6, %l7 = 0000000000000000
	lduwa	[%i0+%g0]0x81,%l7	! %l7 = 00000000db0913b6
!	Mem[0000000010041400] = 0000000000000000, %f12 = 0000ff00 c9ff0000
	ldd	[%i1+%g0],%f12		! %f12 = 00000000 00000000
!	Mem[0000000010081408] = 00000940, %l5 = 0000000000000000
	ldsha	[%i2+%o4]0x80,%l5	! %l5 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030101408] = 0000ffff, %l1 = 00000000000000ff
	ldstuba	[%i4+%o4]0x89,%l1	! %l1 = 000000ff000000ff

p0_label_308:
!	%l0 = ffffffffffffc9ff, Mem[0000000010001410] = 40090000
	stba	%l0,[%i0+%o5]0x80	! Mem[0000000010001410] = ff090000
!	Mem[0000000010141403] = 000000ff, %l0 = ffffffffffffc9ff
	ldstuba	[%i5+0x003]%asi,%l0	! %l0 = 000000ff000000ff
!	Mem[0000000010041408] = db000000, %l2 = 00000000000000ff
	swapa	[%i1+%o4]0x80,%l2	! %l2 = 00000000db000000
!	Mem[0000000021800100] = ffffb49a, %l3 = 00000000ff000046
	ldstub	[%o3+0x100],%l3		! %l3 = 000000ff000000ff
!	%l2 = db000000, %l3 = 000000ff, Mem[0000000030101408] = ffff0000 00000000
	stda	%l2,[%i4+%o4]0x81	! Mem[0000000030101408] = db000000 000000ff
!	Mem[0000000010181410] = 005a4f86, %l0 = 00000000000000ff
	ldsha	[%i6+0x012]%asi,%l0	! %l0 = 0000000000004f86
!	%l1 = 00000000000000ff, Mem[0000000030101410] = ffffffff
	stwa	%l1,[%i4+%o5]0x89	! Mem[0000000030101410] = 000000ff
!	%f21 = 864fc9ff, Mem[0000000030001410] = ff000000
	sta	%f21,[%i0+%o5]0x81	! Mem[0000000030001410] = 864fc9ff
!	%f28 = ffffffff, Mem[0000000010141400] = 000000ff
	sta	%f28,[%i5+%g0]0x80	! Mem[0000000010141400] = ffffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = 00000000, %l5 = 0000000000000000
	ldswa	[%i5+%o5]0x89,%l5	! %l5 = 0000000000000000

p0_label_309:
!	Mem[0000000010101418] = 703f71ab, %l2 = 00000000db000000
	ldsb	[%i4+0x019],%l2		! %l2 = 000000000000003f
!	Mem[0000000010101400] = db8bc354, %l3 = 00000000000000ff
	lduha	[%i4+%g0]0x80,%l3	! %l3 = 000000000000db8b
!	Mem[00000000300c1400] = 000000ff, %l5 = 0000000000000000
	lduha	[%i3+%g0]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030101410] = 000000ff, %l7 = 00000000db0913b6
	lduba	[%i4+%o5]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[0000000021800080] = ffffd5df, %l1 = 00000000000000ff
	ldsba	[%o3+0x081]%asi,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000030041400] = ff0000ff, %l4 = 0000000000000000
	ldswa	[%i1+%g0]0x81,%l4	! %l4 = ffffffffff0000ff
!	Mem[0000000010181410] = 005a4f86, %l6 = 00000000000000ff
	ldsha	[%i6+%o5]0x80,%l6	! %l6 = 000000000000005a
!	Mem[0000000020800000] = ffff7d94, %l0 = 0000000000004f86
	lduba	[%o1+0x001]%asi,%l0	! %l0 = 00000000000000ff
!	Mem[00000000100c1438] = 00000000, %l6 = 000000000000005a
	lduw	[%i3+0x038],%l6		! %l6 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l0 = 00000000000000ff, Mem[0000000010001408] = 000000ff0000ff00
	stxa	%l0,[%i0+%o4]0x80	! Mem[0000000010001408] = 00000000000000ff

p0_label_310:
!	%l4 = ff0000ff, %l5 = 000000ff, Mem[0000000030141400] = ff000000 00000000
	stda	%l4,[%i5+%g0]0x81	! Mem[0000000030141400] = ff0000ff 000000ff
!	%l2 = 0000003f, %l3 = 0000db8b, Mem[0000000010101430] = 77da1fff 169e3a00
	std	%l2,[%i4+0x030]		! Mem[0000000010101430] = 0000003f 0000db8b
!	%l0 = 00000000000000ff, Mem[0000000030041408] = ffffc9ff
	stha	%l0,[%i1+%o4]0x81	! Mem[0000000030041408] = 00ffc9ff
!	Mem[0000000030081408] = ffff0000, %l3 = 000000000000db8b
	ldstuba	[%i2+%o4]0x81,%l3	! %l3 = 000000ff000000ff
!	Mem[0000000010101408] = 0000ffff, %l0 = 00000000000000ff
	ldstuba	[%i4+%o4]0x88,%l0	! %l0 = 000000ff000000ff
!	%l3 = 00000000000000ff, Mem[0000000020800001] = ffff7d94, %asi = 80
	stba	%l3,[%o1+0x001]%asi	! Mem[0000000020800000] = ffff7d94
!	%l2 = 000000000000003f, Mem[0000000010001410] = ff090000db8bc354
	stxa	%l2,[%i0+%o5]0x80	! Mem[0000000010001410] = 000000000000003f
!	%l0 = 00000000000000ff, Mem[0000000030101410] = ff000000
	stwa	%l0,[%i4+%o5]0x81	! Mem[0000000030101410] = 000000ff
!	%l6 = 00000000, %l7 = 000000ff, Mem[0000000030001400] = db0913b6 000000ff
	stda	%l6,[%i0+%g0]0x81	! Mem[0000000030001400] = 00000000 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = ffc94f86, %l5 = 00000000000000ff
	ldsha	[%i0+%o5]0x89,%l5	! %l5 = 0000000000004f86

!	Check Point 62 for processor 0

	set	p0_check_pt_data_62,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = ffffffffffffffff
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 000000000000003f
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = ffffffffff0000ff
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 0000000000004f86
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 0000000000000000
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = ff000000 db8bc354
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x50],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 00000000 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x58],%g3
	std	%f12,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f12 = 00000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf12,%g1
	ldx	[%g4+0x60],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = 00000000 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1
	ldx	[%g4+0x68],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = 703f71ab 06fd1eff
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1

!	Check Point 62 completed


p0_label_311:
!	Mem[0000000010101410] = 000000ffffffffff, %l4 = ffffffffff0000ff
	ldxa	[%i4+%o5]0x80,%l4	! %l4 = 000000ffffffffff
!	Mem[00000000100c1400] = 00000940ffffffff, %l7 = 00000000000000ff
	ldxa	[%i3+%g0]0x88,%l7	! %l7 = 00000940ffffffff
!	Mem[0000000010081410] = ffff000000ff0000, %l5 = 0000000000004f86
	ldxa	[%i2+%o5]0x80,%l5	! %l5 = ffff000000ff0000
!	Mem[0000000030141408] = ff000000, %l4 = 000000ffffffffff
	lduwa	[%i5+%o4]0x81,%l4	! %l4 = 00000000ff000000
!	Mem[00000000100c1410] = 000000ffffffffff, %l0 = 00000000000000ff
	ldxa	[%i3+%o5]0x80,%l0	! %l0 = 000000ffffffffff
!	Mem[0000000030041408] = ff000000ffc9ff00, %f22 = 00000000 dc003118
	ldda	[%i1+%o4]0x89,%f22	! %f22 = ff000000 ffc9ff00
!	Mem[00000000211c0000] = ffff7bbb, %l1 = ffffffffffffffff
	lduh	[%o2+%g0],%l1		! %l1 = 000000000000ffff
!	Mem[0000000010001408] = 00000000, %f31 = a5000000
	lda	[%i0+%o4]0x80,%f31	! %f31 = 00000000
!	Mem[0000000030181408] = 000000ff, %f7  = ff0000ff
	lda	[%i6+%o4]0x89,%f7 	! %f7 = 000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000010001400] = ffffffff, %l4 = 00000000ff000000
	ldstuba	[%i0+%g0]0x88,%l4	! %l4 = 000000ff000000ff

p0_label_312:
!	%f5  = 000000ff, Mem[0000000010101408] = 0000ffff
	sta	%f5 ,[%i4+%o4]0x88	! Mem[0000000010101408] = 000000ff
!	%f14 = 000077da 00000000, Mem[0000000010081400] = ff6a6eff 64bd6ce4
	stda	%f14,[%i2+%g0]0x80	! Mem[0000000010081400] = 000077da 00000000
!	Mem[0000000010141410] = 0000f1c6, %l5 = ffff000000ff0000
	swapa	[%i5+%o5]0x88,%l5	! %l5 = 000000000000f1c6
!	%f2  = ff000000 db8bc354, Mem[0000000030101408] = 000000db ff000000
	stda	%f2 ,[%i4+%o4]0x89	! Mem[0000000030101408] = ff000000 db8bc354
!	%f11 = 864fc9ff, Mem[0000000030041400] = ff0000ff
	sta	%f11,[%i1+%g0]0x89	! Mem[0000000030041400] = 864fc9ff
!	%f30 = ff000000 00000000, %l3 = 00000000000000ff
!	Mem[0000000010041428] = d56a83d006cd9827
	add	%i1,0x028,%g1
	stda	%f30,[%g1+%l3]ASI_PST16_P ! Mem[0000000010041428] = ff00000000000000
!	Mem[0000000030141408] = 000000ff, %l2 = 000000000000003f
	ldstuba	[%i5+%o4]0x89,%l2	! %l2 = 000000ff000000ff
!	Mem[0000000010101408] = ff000000, %l2 = 000000ff, %l5 = 0000f1c6
	add	%i4,0x08,%g1
	casa	[%g1]0x80,%l2,%l5	! %l5 = 00000000ff000000
!	%l4 = 00000000000000ff, Mem[0000000010001408] = 00000000000000ff, %asi = 80
	stxa	%l4,[%i0+0x008]%asi	! Mem[0000000010001408] = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = 00000000, %l3 = 00000000000000ff
	lduba	[%i3+%o4]0x88,%l3	! %l3 = 0000000000000000

p0_label_313:
!	Mem[0000000010041410] = ffffffff, %l4 = 00000000000000ff
	ldswa	[%i1+%o5]0x88,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000030041410] = ff4fc9ff, %l2 = 00000000000000ff
	ldsba	[%i1+%o5]0x81,%l2	! %l2 = ffffffffffffffff
!	Mem[00000000100c1400] = ffffffff, %l0 = 000000ffffffffff
	ldsba	[%i3+%g0]0x80,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000030001400] = 00000000, %l5 = 00000000ff000000
	ldsha	[%i0+%g0]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000030081410] = 000000ff, %l2 = ffffffffffffffff
	ldsha	[%i2+%o5]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030081400] = ff000000 63c94f86, %l0 = ffffffff, %l1 = 0000ffff
	ldda	[%i2+%g0]0x81,%l0	! %l0 = 00000000ff000000 0000000063c94f86
!	Mem[0000000010181438] = ff0000ff, %l5 = 0000000000000000
	lduw	[%i6+0x038],%l5		! %l5 = 00000000ff0000ff
!	Mem[0000000030101400] = 0000005a, %l7 = 00000940ffffffff
	lduwa	[%i4+%g0]0x89,%l7	! %l7 = 000000000000005a
!	Mem[00000000300c1410] = ff000000000000ff, %l0 = 00000000ff000000
	ldxa	[%i3+%o5]0x81,%l0	! %l0 = ff000000000000ff
!	Starting 10 instruction Store Burst
!	%l0 = ff000000000000ff, Mem[0000000010041410] = ffffffff
	stba	%l0,[%i1+%o5]0x80	! Mem[0000000010041410] = ffffffff

p0_label_314:
!	%l4 = ffffffff, %l5 = ff0000ff, Mem[0000000010081438] = 77da1f96 0b3a9e16
	stda	%l4,[%i2+0x038]%asi	! Mem[0000000010081438] = ffffffff ff0000ff
!	%l2 = 000000ff, %l3 = 00000000, Mem[0000000010101410] = 000000ff ffffffff
	stda	%l2,[%i4+0x010]%asi	! Mem[0000000010101410] = 000000ff 00000000
!	Mem[0000000010181408] = ff000000, %l0 = ff000000000000ff
	swapa	[%i6+%o4]0x80,%l0	! %l0 = 00000000ff000000
	membar	#Sync			! Added by membar checker (64)
!	%l0 = ff000000, %l1 = 63c94f86, Mem[00000000300c1408] = ff000000 db8bc354
	stda	%l0,[%i3+%o4]0x81	! Mem[00000000300c1408] = ff000000 63c94f86
!	Mem[0000000010081408] = 00000940ffffffff, %l4 = ffffffffffffffff, %l2 = 00000000000000ff
	add	%i2,0x08,%g1
	casxa	[%g1]0x80,%l4,%l2	! %l2 = 00000940ffffffff
!	Mem[0000000010101410] = ff000000, %l4 = ffffffffffffffff
	ldstuba	[%i4+%o5]0x88,%l4	! %l4 = 00000000000000ff
!	%f22 = ff000000, Mem[0000000010081408] = 00000940
	sta	%f22,[%i2+%o4]0x80	! Mem[0000000010081408] = ff000000
!	Mem[0000000030041410] = ff4fc9ff, %l4 = 0000000000000000
	ldstuba	[%i1+%o5]0x81,%l4	! %l4 = 000000ff000000ff
!	%l5 = 00000000ff0000ff, Mem[0000000010181410] = 864f5a00
	stwa	%l5,[%i6+%o5]0x88	! Mem[0000000010181410] = ff0000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = ffc94fff, %f12 = 00000000
	lda	[%i1+%o5]0x89,%f12	! %f12 = ffc94fff

p0_label_315:
!	Mem[0000000030181400] = 63c94f86, %l5 = 00000000ff0000ff
	ldswa	[%i6+%g0]0x89,%l5	! %l5 = 0000000063c94f86
!	Mem[0000000030101400] = 5a000000 63c94f86, %l2 = ffffffff, %l3 = 00000000
	ldda	[%i4+%g0]0x81,%l2	! %l2 = 000000005a000000 0000000063c94f86
!	Mem[00000000100c1408] = 0000000000000000, %f28 = ffffffff ffff0000
	ldda	[%i3+%o4]0x80,%f28	! %f28 = 00000000 00000000
!	Mem[0000000030101400] = 5a000000, %f26 = ff000000
	lda	[%i4+%g0]0x81,%f26	! %f26 = 5a000000
!	Mem[0000000030141410] = 00000000, %l1 = 0000000063c94f86
	ldsba	[%i5+%o5]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000030081400] = ff000000 63c94f86 ffff0000 000000ff
!	Mem[0000000030081410] = ff000000 5a0000ff ccbe12ae ffffffff
!	Mem[0000000030081420] = 400913b6 ff000000 00000096 0000ffff
!	Mem[0000000030081430] = 000000ff 00000000 a3002dba ffffffff
	ldda	[%i2]ASI_BLK_AIUS,%f0	! Block Load from 0000000030081400
!	Mem[0000000010001400] = ffffffff, %l5 = 0000000063c94f86
	lduwa	[%i0+%g0]0x88,%l5	! %l5 = 00000000ffffffff
!	Mem[0000000010041408] = 000000ff, %l2 = 000000005a000000
	ldswa	[%i1+%o4]0x80,%l2	! %l2 = 00000000000000ff
!	Mem[00000000201c0000] = 00ffaf65, %l2 = 00000000000000ff
	ldsha	[%o0+0x000]%asi,%l2	! %l2 = 00000000000000ff
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (65)
!	%f16 = db0913b6 ff0000ff, %l6 = 0000000000000000
!	Mem[0000000030081418] = ccbe12aeffffffff
	add	%i2,0x018,%g1
	stda	%f16,[%g1+%l6]ASI_PST32_SL ! Mem[0000000030081418] = ccbe12aeffffffff

!	Check Point 63 for processor 0

	set	p0_check_pt_data_63,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 00000000ff000000
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 0000000000000000
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 0000000063c94f86
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 00000000ffffffff
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l7,%g2			! %l7 = 000000000000005a
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x40],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = ff000000 63c94f86
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x48],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = ffff0000 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x50],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = ff000000 5a0000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x58],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = ccbe12ae ffffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x60],%g3
	std	%f8,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f8 = 400913b6 ff000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf08,%g1
	ldx	[%g4+0x68],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = 00000096 0000ffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x70],%g3
	std	%f12,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f12 = 000000ff 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf12,%g1
	ldx	[%g4+0x78],%g3
	std	%f14,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f14 = a3002dba ffffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf14,%g1
	ldx	[%g4+0x80],%g3
	std	%f22,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f22 = ff000000 ffc9ff00
	bne	%xcc,p0_freg_check_fail
	mov	0xf22,%g1
	ldx	[%g4+0x88],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = 5a000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1
	ldx	[%g4+0x90],%g3
	std	%f28,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f28 = 00000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf28,%g1
	ldx	[%g4+0x98],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = ff000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 63 completed


p0_label_316:
!	%l3 = 0000000063c94f86, Mem[0000000030101410] = 000000ff
	stwa	%l3,[%i4+%o5]0x81	! Mem[0000000030101410] = 63c94f86
!	%f11 = 0000ffff, Mem[0000000030041400] = ffc94f86
	sta	%f11,[%i1+%g0]0x81	! Mem[0000000030041400] = 0000ffff
!	%l0 = 00000000ff000000, Mem[0000000010101400] = 54c38bdb
	stwa	%l0,[%i4+%g0]0x88	! Mem[0000000010101400] = ff000000
!	%f14 = a3002dba ffffffff, %l4 = 00000000000000ff
!	Mem[0000000030001400] = 00000000000000ff
	stda	%f14,[%i0+%l4]ASI_PST32_SL ! Mem[0000000030001400] = ffffffffba2d00a3
!	%l4 = 000000ff, %l5 = ffffffff, Mem[0000000010081400] = 000077da 00000000
	stda	%l4,[%i2+%g0]0x80	! Mem[0000000010081400] = 000000ff ffffffff
!	Mem[0000000010041400] = 00000000, %l1 = 0000000000000000
	ldstuba	[%i1+%g0]0x88,%l1	! %l1 = 00000000000000ff
!	%l0 = 00000000ff000000, Mem[0000000010081408] = ff000000
	stwa	%l0,[%i2+%o4]0x80	! Mem[0000000010081408] = ff000000
!	%l4 = 00000000000000ff, Mem[0000000030001408] = ff000000
	stba	%l4,[%i0+%o4]0x81	! Mem[0000000030001408] = ff000000
!	%l4 = 000000ff, %l5 = ffffffff, Mem[0000000010041410] = ffffffff 400913b6
	stda	%l4,[%i1+%o5]0x88	! Mem[0000000010041410] = 000000ff ffffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000010041418] = ff00ff00db8bc354, %f0  = ff000000 63c94f86
	ldd	[%i1+0x018],%f0 	! %f0  = ff00ff00 db8bc354

p0_label_317:
!	Mem[0000000030001410] = 864fc9ff864fc9ff, %l1 = 0000000000000000
	ldxa	[%i0+%o5]0x81,%l1	! %l1 = 864fc9ff864fc9ff
!	Mem[0000000010101410] = ff0000ff, %l4 = 00000000000000ff
	ldswa	[%i4+%o5]0x80,%l4	! %l4 = ffffffffff0000ff
!	Mem[0000000030141400] = ff0000ff 000000ff ff000000 00000000
!	Mem[0000000030141410] = 00000000 dc003118 00000000 b9703118
!	Mem[0000000030141420] = ffffffff 06fd1eff 000000ff 00000000
!	Mem[0000000030141430] = ffffffff ffff0000 ff000000 a5000000
	ldda	[%i5]ASI_BLK_AIUS,%f16	! Block Load from 0000000030141400
!	Mem[0000000010001400] = ff000000ffffffff, %f14 = a3002dba ffffffff
	ldda	[%i0+%g0]0x88,%f14	! %f14 = ff000000 ffffffff
!	Mem[000000001014141c] = 000000ff, %f6  = ccbe12ae
	ld	[%i5+0x01c],%f6 	! %f6 = 000000ff
!	Mem[0000000030181408] = ffff0000000000ff, %l1 = 864fc9ff864fc9ff
	ldxa	[%i6+%o4]0x89,%l1	! %l1 = ffff0000000000ff
!	Mem[0000000030001410] = 864fc9ff, %l4 = ffffffffff0000ff
	ldstuba	[%i0+%o5]0x81,%l4	! %l4 = 00000086000000ff
!	Mem[0000000030081400] = ff000000 63c94f86, %l0 = ff000000, %l1 = 000000ff
	ldda	[%i2+%g0]0x81,%l0	! %l0 = 00000000ff000000 0000000063c94f86
!	Mem[0000000010101410] = ff0000ff, %l6 = 0000000000000000
	lduba	[%i4+%o5]0x88,%l6	! %l6 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%f10 = 00000096, Mem[000000001010140c] = 00000000
	st	%f10,[%i4+0x00c]	! Mem[000000001010140c] = 00000096

p0_label_318:
!	%l7 = 000000000000005a, Mem[0000000010141416] = 5a000000
	stb	%l7,[%i5+0x016]		! Mem[0000000010141414] = 5a005a00
!	%f12 = 000000ff, Mem[0000000010141410] = 00ff0000
	sta	%f12,[%i5+%o5]0x88	! Mem[0000000010141410] = 000000ff
!	%f0  = ff00ff00 db8bc354, %l3 = 0000000063c94f86
!	Mem[0000000030001410] = ff4fc9ff864fc9ff
	add	%i0,0x010,%g1
	stda	%f0,[%g1+%l3]ASI_PST16_SL ! Mem[0000000030001410] = ff4f8bdb00ffc9ff
!	%l0 = 00000000ff000000, Mem[0000000010001408] = 00000000
	stha	%l0,[%i0+%o4]0x88	! Mem[0000000010001408] = 00000000
	membar	#Sync			! Added by membar checker (66)
!	%l5 = 00000000ffffffff, Mem[0000000030141400] = ff000000ff0000ff
	stxa	%l5,[%i5+%g0]0x89	! Mem[0000000030141400] = 00000000ffffffff
!	Mem[0000000030081410] = ff000000, %l3 = 0000000063c94f86
	swapa	[%i2+%o5]0x81,%l3	! %l3 = 00000000ff000000
!	%f8  = 400913b6 ff000000, Mem[0000000010181408] = 000000ff 000000ff
	stda	%f8 ,[%i6+%o4]0x80	! Mem[0000000010181408] = 400913b6 ff000000
!	%l7 = 000000000000005a, Mem[0000000010081410] = ffff000000ff0000
	stxa	%l7,[%i2+%o5]0x80	! Mem[0000000010081410] = 000000000000005a
!	Mem[0000000030041410] = ff4fc9ff, %l7 = 000000000000005a
	ldstuba	[%i1+%o5]0x81,%l7	! %l7 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010141430] = ff770000, %l7 = 00000000000000ff
	ldsha	[%i5+0x032]%asi,%l7	! %l7 = 0000000000000000

p0_label_319:
!	Mem[0000000010081410] = 00000000, %l0 = 00000000ff000000
	lduha	[%i2+%o5]0x80,%l0	! %l0 = 0000000000000000
!	Mem[00000000100c1400] = ffffffff 40090000 00000000 00000000
!	Mem[00000000100c1410] = 000000ff ffffffff ffff0000 000000ff
!	Mem[00000000100c1420] = ffffffff 06fd1eff 00000000 00000000
!	Mem[00000000100c1430] = 5a000000 63c94f86 00000000 0000005a
	ldda	[%i3]ASI_BLK_PL,%f16	! Block Load from 00000000100c1400
!	Mem[0000000030041400] = ffff0000, %l7 = 0000000000000000
	ldsha	[%i1+%g0]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000020800000] = ffff7d94, %l7 = 0000000000000000
	ldsh	[%o1+%g0],%l7		! %l7 = ffffffffffffffff
!	Mem[0000000010081418] = 3a0000ff, %l5 = 00000000ffffffff
	ldsh	[%i2+0x018],%l5		! %l5 = 0000000000003a00
!	Mem[0000000010141414] = 5a005a00, %l0 = 0000000000000000
	lduh	[%i5+0x014],%l0		! %l0 = 0000000000005a00
!	Mem[0000000010141438] = a96e6a5a 864fc9ff, %l0 = 00005a00, %l1 = 63c94f86
	ldda	[%i5+0x038]%asi,%l0	! %l0 = 00000000a96e6a5a 00000000864fc9ff
!	%l2 = 00000000000000ff, Mem[0000000030101410] = 864fc963
	stha	%l2,[%i4+%o5]0x89	! Mem[0000000030101410] = 864f00ff
!	Mem[0000000010001408] = ff00000000000000, %l7 = ffffffffffffffff
	ldxa	[%i0+%o4]0x88,%l7	! %l7 = ff00000000000000
!	Starting 10 instruction Store Burst
!	%f6  = 000000ff ffffffff, %l3 = 00000000ff000000
!	Mem[0000000030101410] = ff004f8600000000
	add	%i4,0x010,%g1
	stda	%f6,[%g1+%l3]ASI_PST8_SL ! Mem[0000000030101410] = ff004f8600000000

p0_label_320:
!	Mem[0000000010041400] = ff000000, %l2 = 00000000000000ff
	ldstuba	[%i1+%g0]0x80,%l2	! %l2 = 000000ff000000ff
!	Mem[0000000010041400] = 000000ff, %l3 = 00000000ff000000
	ldstuba	[%i1+%g0]0x88,%l3	! %l3 = 000000ff000000ff
!	Mem[00000000100c1414] = ffffffff, %l3 = 00000000000000ff
	swap	[%i3+0x014],%l3		! %l3 = 00000000ffffffff
!	%l3 = 00000000ffffffff, Mem[0000000010081400] = ff000000
	stwa	%l3,[%i2+%g0]0x88	! Mem[0000000010081400] = ffffffff
!	%l3 = 00000000ffffffff, Mem[0000000030141410] = 00000000
	stwa	%l3,[%i5+%o5]0x89	! Mem[0000000030141410] = ffffffff
!	Mem[00000000100c1410] = 000000ff, %l5 = 0000000000003a00
	ldstuba	[%i3+%o5]0x80,%l5	! %l5 = 00000000000000ff
!	%f8  = 400913b6 ff000000, %l5 = 0000000000000000
!	Mem[0000000010181418] = 00000000ffffffff
	add	%i6,0x018,%g1
	stda	%f8,[%g1+%l5]ASI_PST32_PL ! Mem[0000000010181418] = 00000000ffffffff
!	Mem[0000000020800001] = ffff7d94, %l6 = 00000000000000ff
	ldstuba	[%o1+0x001]%asi,%l6	! %l6 = 000000ff000000ff
!	%l4 = 00000086, %l5 = 00000000, Mem[0000000010081400] = ffffffff ffffffff
	std	%l4,[%i2+%g0]		! Mem[0000000010081400] = 00000086 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = ff0000ff 00000000, %l4 = 00000086, %l5 = 00000000
	ldd	[%i6+%o5],%l4		! %l4 = 00000000ff0000ff 0000000000000000

!	Check Point 64 for processor 0

	set	p0_check_pt_data_64,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 00000000a96e6a5a
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 00000000864fc9ff
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 00000000ffffffff
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 00000000ff0000ff
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 0000000000000000
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = ff00000000000000
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = ff00ff00 db8bc354
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x50],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = ff000000 5a0000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x58],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 000000ff ffffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x60],%g3
	std	%f14,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f14 = ff000000 ffffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf14,%g1
	ldx	[%g4+0x68],%g3
	std	%f16,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f16 = 00000940 ffffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf16,%g1
	ldx	[%g4+0x70],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = 00000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1
	ldx	[%g4+0x78],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = ffffffff ff000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1
	ldx	[%g4+0x80],%g3
	std	%f22,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f22 = ff000000 0000ffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf22,%g1
	ldx	[%g4+0x88],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = ff1efd06 ffffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1
	ldx	[%g4+0x90],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = 00000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1
	ldx	[%g4+0x98],%g3
	std	%f28,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f28 = 864fc963 0000005a
	bne	%xcc,p0_freg_check_fail
	mov	0xf28,%g1
	ldx	[%g4+0xa0],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = 5a000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 64 completed


p0_label_321:
!	Mem[0000000010141418] = 00000000, %l3 = 00000000ffffffff
	lduw	[%i5+0x018],%l3		! %l3 = 0000000000000000
!	Mem[00000000300c1408] = 000000ff, %l2 = 00000000000000ff
	ldsha	[%i3+%o4]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[00000000300c1408] = 864fc963000000ff, %l3 = 0000000000000000
	ldxa	[%i3+%o4]0x89,%l3	! %l3 = 864fc963000000ff
!	Mem[00000000100c1410] = ff000000ff0000ff, %f10 = 00000096 0000ffff
	ldda	[%i3+%o5]0x88,%f10	! %f10 = ff000000 ff0000ff
!	Mem[000000001014142c] = 00000000, %l3 = 864fc963000000ff
	ldub	[%i5+0x02c],%l3		! %l3 = 0000000000000000
!	Mem[0000000010001400] = ffffffff, %l3 = 0000000000000000
	ldsha	[%i0+0x002]%asi,%l3	! %l3 = ffffffffffffffff
!	Mem[00000000201c0000] = 00ffaf65, %l1 = 00000000864fc9ff
	lduba	[%o0+0x001]%asi,%l1	! %l1 = 00000000000000ff
	membar	#Sync			! Added by membar checker (67)
!	Mem[0000000030101400] = 5a000000 63c94f86 54c38bdb 000000ff
!	Mem[0000000030101410] = ff004f86 00000000 ccbe12ae ffffffff
!	Mem[0000000030101420] = 400913b6 ff000000 00000096 0000ffff
!	Mem[0000000030101430] = 000000ff 00000000 a3002dba ffffffff
	ldda	[%i4]ASI_BLK_SL,%f16	! Block Load from 0000000030101400
!	Mem[0000000010181408] = b6130940, %f13 = 00000000
	lda	[%i6+%o4]0x88,%f13	! %f13 = b6130940
!	Starting 10 instruction Store Burst
!	Mem[0000000010141408] = db8bc354, %l1 = 00000000000000ff
	swapa	[%i5+%o4]0x88,%l1	! %l1 = 00000000db8bc354

p0_label_322:
!	Mem[0000000030001408] = 000000ff, %l7 = ff00000000000000
	ldswa	[%i0+%o4]0x89,%l7	! %l7 = 00000000000000ff
!	%l7 = 00000000000000ff, Mem[0000000030141408] = 000000ff
	stba	%l7,[%i5+%o4]0x89	! Mem[0000000030141408] = 000000ff
!	Mem[0000000010141400] = ffffffff, %l5 = 0000000000000000
	ldstuba	[%i5+%g0]0x80,%l5	! %l5 = 000000ff000000ff
!	%l7 = 00000000000000ff, Mem[0000000010001400] = ffffffff
	stha	%l7,[%i0+%g0]0x88	! Mem[0000000010001400] = ffff00ff
!	%l1 = 00000000db8bc354, Mem[0000000030081408] = ffff0000
	stba	%l1,[%i2+%o4]0x81	! Mem[0000000030081408] = 54ff0000
!	%l2 = 00000000000000ff, Mem[00000000201c0001] = 00ffaf65, %asi = 80
	stba	%l2,[%o0+0x001]%asi	! Mem[00000000201c0000] = 00ffaf65
!	Mem[000000001018141c] = ffffffff, %l0 = 00000000a96e6a5a, %asi = 80
	swapa	[%i6+0x01c]%asi,%l0	! %l0 = 00000000ffffffff
!	%l6 = 00000000000000ff, Mem[0000000010081414] = 0000005a, %asi = 80
	stwa	%l6,[%i2+0x014]%asi	! Mem[0000000010081414] = 000000ff
!	%l4 = 00000000ff0000ff, Mem[000000001008141e] = 06fd1e0b, %asi = 80
	stba	%l4,[%i2+0x01e]%asi	! Mem[000000001008141c] = 06fdff0b
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = ff000000, %l5 = 00000000000000ff
	ldsba	[%i2+%o4]0x80,%l5	! %l5 = ffffffffffffffff

p0_label_323:
!	Mem[0000000010081400] = 00000086, %f4  = ff000000
	lda	[%i2+%g0]0x80,%f4 	! %f4 = 00000086
!	Mem[0000000010101408] = 000000ff, %l2 = 00000000000000ff
	ldsha	[%i4+%o4]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010001410] = 00000000, %f2  = ffff0000
	lda	[%i0+%o5]0x88,%f2 	! %f2 = 00000000
!	Mem[0000000030081400] = ff00000063c94f86, %f0  = ff00ff00 db8bc354
	ldda	[%i2+%g0]0x81,%f0 	! %f0  = ff000000 63c94f86
!	Mem[0000000030001400] = ffffffff, %l4 = 00000000ff0000ff
	lduba	[%i0+%g0]0x81,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010141400] = ff000000ffffffff, %f8  = 400913b6 ff000000
	ldda	[%i5+%g0]0x88,%f8 	! %f8  = ff000000 ffffffff
!	Mem[0000000010101400] = 000000ff, %l0 = 00000000ffffffff
	lduba	[%i4+%g0]0x80,%l0	! %l0 = 0000000000000000
!	Mem[000000001018142c] = 00000000, %f7  = ffffffff
	lda	[%i6+0x02c]%asi,%f7 	! %f7 = 00000000
!	Mem[0000000030041408] = 00ffc9ff, %l4 = 00000000000000ff
	ldsba	[%i1+%o4]0x81,%l4	! %l4 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[000000001018140c] = ff000000, %l7 = 000000ff, %l4 = 00000000
	add	%i6,0x0c,%g1
	casa	[%g1]0x80,%l7,%l4	! %l4 = 00000000ff000000

p0_label_324:
!	Mem[0000000030081408] = 54ff0000, %l5 = ffffffffffffffff
	ldsba	[%i2+%o4]0x81,%l5	! %l5 = 0000000000000054
	membar	#Sync			! Added by membar checker (68)
!	%l6 = 00000000000000ff, Mem[0000000030101400] = 0000005a
	stba	%l6,[%i4+%g0]0x89	! Mem[0000000030101400] = 000000ff
!	%f16 = 864fc963, Mem[000000001010143c] = 000000ff
	st	%f16,[%i4+0x03c]	! Mem[000000001010143c] = 864fc963
!	Mem[0000000010101410] = ff0000ff, %l0 = 0000000000000000
	ldstuba	[%i4+%o5]0x88,%l0	! %l0 = 000000ff000000ff
!	%l2 = 00000000000000ff, Mem[00000000300c1410] = 000000ff
	stba	%l2,[%i3+%o5]0x89	! Mem[00000000300c1410] = 000000ff
!	Mem[00000000211c0001] = ffff7bbb, %l2 = 00000000000000ff
	ldstub	[%o2+0x001],%l2		! %l2 = 000000ff000000ff
!	%f6  = 000000ff, Mem[0000000010081410] = 00000000
	sta	%f6 ,[%i2+%o5]0x88	! Mem[0000000010081410] = 000000ff
!	Mem[0000000030001410] = ff4f8bdb, %l2 = 00000000000000ff
	ldstuba	[%i0+%o5]0x81,%l2	! %l2 = 000000ff000000ff
!	%l1 = 00000000db8bc354, Mem[00000000100c1404] = 40090000, %asi = 80
	stwa	%l1,[%i3+0x004]%asi	! Mem[00000000100c1404] = db8bc354
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = ffffffff, %l1 = 00000000db8bc354
	lduwa	[%i3+%g0]0x80,%l1	! %l1 = 00000000ffffffff

p0_label_325:
!	Mem[0000000030141410] = ffffffff, %l6 = 00000000000000ff
	lduha	[%i5+%o5]0x89,%l6	! %l6 = 000000000000ffff
!	Mem[0000000010081400] = 86000000, %l7 = 00000000000000ff
	lduha	[%i2+%g0]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000030181400] = 63c94f86, %l4 = 00000000ff000000
	lduwa	[%i6+%g0]0x89,%l4	! %l4 = 0000000063c94f86
!	Mem[00000000300c1410] = ff000000000000ff, %f30 = ffffffff ba2d00a3
	ldda	[%i3+%o5]0x89,%f30	! %f30 = ff000000 000000ff
!	Mem[0000000010041408] = 00000000 ff000000, %l0 = 000000ff, %l1 = ffffffff
	ldda	[%i1+%o4]0x88,%l0	! %l0 = 00000000ff000000 0000000000000000
!	Mem[00000000100c1408] = 00000000, %l5 = 0000000000000054
	ldswa	[%i3+%o4]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000010181400] = ff0000ff, %f14 = ff000000
	lda	[%i6+%g0]0x88,%f14	! %f14 = ff0000ff
!	Mem[0000000030181410] = 00000000, %l1 = 0000000000000000
	ldsba	[%i6+%o5]0x81,%l1	! %l1 = 0000000000000000
!	Mem[00000000100c1400] = ffffffff db8bc354, %l4 = 63c94f86, %l5 = 00000000
	ldda	[%i3+%g0]0x80,%l4	! %l4 = 00000000ffffffff 00000000db8bc354
!	Starting 10 instruction Store Burst
!	%f22 = ffffffff ae12becc, Mem[0000000010081438] = ffffffff ff0000ff
	stda	%f22,[%i2+0x038]%asi	! Mem[0000000010081438] = ffffffff ae12becc

!	Check Point 65 for processor 0

	set	p0_check_pt_data_65,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 00000000ff000000
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 0000000000000000
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = ffffffffffffffff
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 00000000ffffffff
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 00000000db8bc354
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 000000000000ffff
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 0000000000000000
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = ff000000 63c94f86
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x50],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = 00000000 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x58],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 00000086 5a0000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x60],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 000000ff 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x68],%g3
	std	%f8,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f8 = ff000000 ffffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf08,%g1
	ldx	[%g4+0x70],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = ff000000 ff0000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x78],%g3
	std	%f12,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f12 = 000000ff b6130940
	bne	%xcc,p0_freg_check_fail
	mov	0xf12,%g1
	ldx	[%g4+0x80],%g3
	std	%f14,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f14 = ff0000ff ffffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf14,%g1
	ldx	[%g4+0x88],%g3
	std	%f16,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f16 = 864fc963 0000005a
	bne	%xcc,p0_freg_check_fail
	mov	0xf16,%g1
	ldx	[%g4+0x90],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = ff000000 db8bc354
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1
	ldx	[%g4+0x98],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = 00000000 864f00ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1
	ldx	[%g4+0xa0],%g3
	std	%f22,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f22 = ffffffff ae12becc
	bne	%xcc,p0_freg_check_fail
	mov	0xf22,%g1
	ldx	[%g4+0xa8],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = 000000ff b6130940
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1
	ldx	[%g4+0xb0],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = ffff0000 96000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1
	ldx	[%g4+0xb8],%g3
	std	%f28,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f28 = 00000000 ff000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf28,%g1
	ldx	[%g4+0xc0],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = ff000000 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 65 completed


p0_label_326:
!	Mem[00000000100c1408] = 00000000, %l1 = 0000000000000000
	swapa	[%i3+%o4]0x80,%l1	! %l1 = 0000000000000000
!	%f26 = ffff0000 96000000, Mem[0000000010081408] = 000000ff ffffffff
	stda	%f26,[%i2+%o4]0x88	! Mem[0000000010081408] = ffff0000 96000000
!	Mem[0000000030181410] = 00000000, %l1 = 0000000000000000
	swapa	[%i6+%o5]0x81,%l1	! %l1 = 0000000000000000
!	%f28 = 00000000 ff000000, Mem[0000000010081408] = 00000096 0000ffff
	stda	%f28,[%i2+%o4]0x80	! Mem[0000000010081408] = 00000000 ff000000
!	%f28 = 00000000, Mem[0000000030101408] = 54c38bdb
	sta	%f28,[%i4+%o4]0x81	! Mem[0000000030101408] = 00000000
!	%l2 = 000000ff, %l3 = ffffffff, Mem[0000000030101408] = 00000000 000000ff
	stda	%l2,[%i4+%o4]0x81	! Mem[0000000030101408] = 000000ff ffffffff
!	%l5 = 00000000db8bc354, Mem[0000000010101408] = 000000ff
	stwa	%l5,[%i4+%o4]0x88	! Mem[0000000010101408] = db8bc354
!	%f11 = ff0000ff, Mem[0000000010181408] = 400913b6
	sta	%f11,[%i6+%o4]0x80	! Mem[0000000010181408] = ff0000ff
!	Mem[0000000010101410] = ff0000ff, %l7 = 0000000000000000
	ldstuba	[%i4+%o5]0x80,%l7	! %l7 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = ff0000ff, %l0 = 00000000ff000000
	lduba	[%i4+%o5]0x88,%l0	! %l0 = 00000000000000ff

p0_label_327:
!	Mem[0000000010001430] = ffc94f86, %l3 = ffffffffffffffff
	lduba	[%i0+0x031]%asi,%l3	! %l3 = 00000000000000c9
!	Mem[0000000030141410] = ffffffff, %l7 = 00000000000000ff
	ldsha	[%i5+%o5]0x81,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000030141410] = ffffffffdc003118, %f2  = 00000000 000000ff
	ldda	[%i5+%o5]0x81,%f2 	! %f2  = ffffffff dc003118
!	Mem[0000000010181408] = ff0000ff, %l4 = 00000000ffffffff
	lduwa	[%i6+%o4]0x80,%l4	! %l4 = 00000000ff0000ff
!	Mem[0000000010141438] = a96e6a5a864fc9ff, %l6 = 000000000000ffff
	ldx	[%i5+0x038],%l6		! %l6 = a96e6a5a864fc9ff
!	Mem[0000000030081400] = 000000ff, %f10 = ff000000
	lda	[%i2+%g0]0x89,%f10	! %f10 = 000000ff
!	Mem[000000001014143c] = 864fc9ff, %l2 = 00000000000000ff
	ldub	[%i5+0x03f],%l2		! %l2 = 00000000000000ff
!	Mem[0000000010041410] = 000000ff, %l1 = 0000000000000000
	lduwa	[%i1+%o5]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010001430] = ffc94f86 000000ff, %l0 = 000000ff, %l1 = 000000ff
	ldda	[%i0+0x030]%asi,%l0	! %l0 = 00000000ffc94f86 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l5 = 00000000db8bc354, Mem[0000000010141428] = 00000000
	sth	%l5,[%i5+0x028]		! Mem[0000000010141428] = c3540000

p0_label_328:
!	Mem[0000000010001400] = ff00ffff, %l1 = 00000000000000ff
	swapa	[%i0+%g0]0x80,%l1	! %l1 = 00000000ff00ffff
!	Mem[0000000030041408] = ffc9ff00, %l7 = ffffffffffffffff
	swapa	[%i1+%o4]0x89,%l7	! %l7 = 00000000ffc9ff00
!	%l3 = 00000000000000c9, Mem[0000000010001438] = 00000000
	stw	%l3,[%i0+0x038]		! Mem[0000000010001438] = 000000c9
!	%l5 = 00000000db8bc354, Mem[0000000010101408] = 96000000db8bc354
	stxa	%l5,[%i4+%o4]0x88	! Mem[0000000010101408] = 00000000db8bc354
!	%f22 = ffffffff ae12becc, %l6 = a96e6a5a864fc9ff
!	Mem[0000000010181430] = ff0000005a0000ff
	add	%i6,0x030,%g1
	stda	%f22,[%g1+%l6]ASI_PST32_P ! Mem[0000000010181430] = ffffffffae12becc
!	Mem[0000000010181410] = ff0000ff, %l6 = a96e6a5a864fc9ff
	swapa	[%i6+%o5]0x80,%l6	! %l6 = 00000000ff0000ff
!	%l3 = 00000000000000c9, Mem[0000000010141400] = ffffffff
	stha	%l3,[%i5+%g0]0x80	! Mem[0000000010141400] = 00c9ffff
!	Mem[0000000010101400] = ff000000, %l2 = 00000000000000ff
	ldstuba	[%i4+%g0]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030181408] = ff000000, %l2 = 0000000000000000
	ldstuba	[%i6+%o4]0x81,%l2	! %l2 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = 00ffaf65, %l3 = 00000000000000c9
	ldub	[%o0+0x001],%l3		! %l3 = 00000000000000ff

p0_label_329:
!	Mem[0000000030141410] = ffffffff, %f7  = 00000000
	lda	[%i5+%o5]0x81,%f7 	! %f7 = ffffffff
!	Mem[0000000010141410] = ff000000 5a005a00, %l4 = ff0000ff, %l5 = db8bc354
	ldda	[%i5+%o5]0x80,%l4	! %l4 = 00000000ff000000 000000005a005a00
!	Mem[0000000021800000] = 1a7bd0b4, %l6 = 00000000ff0000ff
	ldub	[%o3+0x001],%l6		! %l6 = 000000000000007b
!	Mem[0000000010141410] = 000000ff, %l4 = 00000000ff000000
	ldswa	[%i5+%o5]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[00000000201c0000] = 00ffaf65, %l3 = 00000000000000ff
	ldsh	[%o0+%g0],%l3		! %l3 = 00000000000000ff
!	Mem[0000000010141410] = 005a005a000000ff, %f16 = 864fc963 0000005a
	ldda	[%i5+%o5]0x88,%f16	! %f16 = 005a005a 000000ff
!	Mem[0000000010141428] = c3540000 00000000, %l6 = 0000007b, %l7 = ffc9ff00
	ldda	[%i5+0x028]%asi,%l6	! %l6 = 00000000c3540000 0000000000000000
!	Mem[0000000030041410] = ffc94fff, %l6 = 00000000c3540000
	lduwa	[%i1+%o5]0x89,%l6	! %l6 = 00000000ffc94fff
!	Mem[0000000030081410] = 63c94f86, %l6 = 00000000ffc94fff
	ldsba	[%i2+%o5]0x81,%l6	! %l6 = 0000000000000063
!	Starting 10 instruction Store Burst
!	%f0  = ff000000 63c94f86 ffffffff dc003118
!	%f4  = 00000086 5a0000ff 000000ff ffffffff
!	%f8  = ff000000 ffffffff 000000ff ff0000ff
!	%f12 = 000000ff b6130940 ff0000ff ffffffff
	stda	%f0,[%i0]ASI_BLK_AIUSL	! Block Store to 0000000030001400

p0_label_330:
!	%f22 = ffffffff ae12becc, Mem[0000000010001418] = 0000ff00 ff0000ff
	stda	%f22,[%i0+0x018]%asi	! Mem[0000000010001418] = ffffffff ae12becc
!	%f20 = 00000000 864f00ff, Mem[0000000030181410] = 00000000 ff000000
	stda	%f20,[%i6+%o5]0x89	! Mem[0000000030181410] = 00000000 864f00ff
!	Mem[00000000201c0001] = 00ffaf65, %l6 = 0000000000000063
	ldstub	[%o0+0x001],%l6		! %l6 = 000000ff000000ff
!	Mem[00000000100c1410] = ff0000ff, %l4 = 00000000000000ff
	ldstuba	[%i3+%o5]0x80,%l4	! %l4 = 000000ff000000ff
!	%l0 = ffc94f86, %l1 = ff00ffff, Mem[0000000010181410] = ffc94f86 00000000
	stda	%l0,[%i6+%o5]0x88	! Mem[0000000010181410] = ffc94f86 ff00ffff
!	%f25 = b6130940, Mem[0000000030141408] = ff000000
	sta	%f25,[%i5+%o4]0x81	! Mem[0000000030141408] = b6130940
!	%f18 = ff000000, Mem[0000000010181400] = ff0000ff
	sta	%f18,[%i6+%g0]0x88	! Mem[0000000010181400] = ff000000
!	Mem[0000000010081408] = 00000000, %l4 = 00000000000000ff
	ldstuba	[%i2+%o4]0x88,%l4	! %l4 = 00000000000000ff
!	%l0 = 00000000ffc94f86, Mem[000000001014140c] = 6a0000ff
	sth	%l0,[%i5+0x00c]		! Mem[000000001014140c] = 4f8600ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = 54c38bdb, %l3 = 00000000000000ff
	lduha	[%i4+%o4]0x80,%l3	! %l3 = 00000000000054c3

!	Check Point 66 for processor 0

	set	p0_check_pt_data_66,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 00000000ffc94f86
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 00000000ff00ffff
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 00000000000054c3
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 0000000000000000
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l6,%g2			! %l6 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l7,%g2			! %l7 = 0000000000000000
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x40],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = ff000000 63c94f86
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x48],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = ffffffff dc003118
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x50],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 00000086 5a0000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x58],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 000000ff ffffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x60],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = 000000ff ff0000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x68],%g3
	std	%f16,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f16 = 005a005a 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf16,%g1

!	Check Point 66 completed


p0_label_331:
!	Mem[00000000300c1408] = 000000ff, %l0 = 00000000ffc94f86
	lduha	[%i3+%o4]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[00000000201c0000] = 00ffaf65, %l3 = 00000000000054c3
	ldsha	[%o0+0x000]%asi,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010101400] = ff0000ff, %l7 = 0000000000000000
	ldswa	[%i4+%g0]0x88,%l7	! %l7 = ffffffffff0000ff
	membar	#Sync			! Added by membar checker (69)
!	Mem[0000000010001438] = 000000c9 ffffffff, %l6 = 000000ff, %l7 = ff0000ff
	ldda	[%i0+0x038]%asi,%l6	! %l6 = 00000000000000c9 00000000ffffffff
!	Mem[0000000030001400] = 864fc963, %f20 = 00000000
	lda	[%i0+%g0]0x81,%f20	! %f20 = 864fc963
!	Mem[00000000100c1410] = ff0000ff000000ff, %f30 = ff000000 000000ff
	ldda	[%i3+%o5]0x80,%f30	! %f30 = ff0000ff 000000ff
!	Mem[0000000010001438] = 000000c9ffffffff, %l4 = 0000000000000000
	ldxa	[%i0+0x038]%asi,%l4	! %l4 = 000000c9ffffffff
!	Mem[0000000030081408] = 0000ff54, %l5 = 000000005a005a00
	lduwa	[%i2+%o4]0x89,%l5	! %l5 = 000000000000ff54
!	Mem[0000000030181408] = 000000ff, %l0 = 00000000000000ff
	lduha	[%i6+%o4]0x89,%l0	! %l0 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1408] = 000000ff, %l1 = 00000000ff00ffff
	swapa	[%i3+%o4]0x89,%l1	! %l1 = 00000000000000ff

p0_label_332:
!	Mem[0000000010081400] = 00000086, %l0 = 00000000000000ff
	swapa	[%i2+%g0]0x80,%l0	! %l0 = 0000000000000086
!	%l7 = 00000000ffffffff, Mem[0000000010141418] = 00000000000000ff
	stx	%l7,[%i5+0x018]		! Mem[0000000010141418] = 00000000ffffffff
!	%f2  = ffffffff dc003118, Mem[0000000010141408] = 000000ff ff00864f
	stda	%f2 ,[%i5+%o4]0x88	! Mem[0000000010141408] = ffffffff dc003118
!	%f28 = 00000000 ff000000, %l6 = 00000000000000c9
!	Mem[00000000300c1418] = 0000ff00ff0000ff
	add	%i3,0x018,%g1
	stda	%f28,[%g1+%l6]ASI_PST32_SL ! Mem[00000000300c1418] = 000000ffff0000ff
!	%f28 = 00000000 ff000000, Mem[0000000010181410] = 864fc9ff ffff00ff
	stda	%f28,[%i6+%o5]0x80	! Mem[0000000010181410] = 00000000 ff000000
!	%f10 = 000000ff ff0000ff, Mem[0000000010141420] = ccbeffae e46cbd64
	stda	%f10,[%i5+0x020]%asi	! Mem[0000000010141420] = 000000ff ff0000ff
!	%l2 = 000000ff, %l3 = 000000ff, Mem[00000000300c1410] = ff000000 000000ff
	stda	%l2,[%i3+%o5]0x81	! Mem[00000000300c1410] = 000000ff 000000ff
!	%l7 = 00000000ffffffff, Mem[0000000010081410] = ff000000
	stba	%l7,[%i2+%o5]0x80	! Mem[0000000010081410] = ff000000
!	Mem[000000001018143c] = ff0000ff, %l2 = 00000000000000ff
	swap	[%i6+0x03c],%l2		! %l2 = 00000000ff0000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = ffffffff, %l7 = 00000000ffffffff
	lduha	[%i1+%o4]0x81,%l7	! %l7 = 000000000000ffff

p0_label_333:
!	Mem[0000000010041400] = 000000ff, %l4 = 000000c9ffffffff
	lduba	[%i1+%g0]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[00000000300c1408] = ff00ffff, %l7 = 000000000000ffff
	lduwa	[%i3+%o4]0x89,%l7	! %l7 = 00000000ff00ffff
!	Mem[0000000010141400] = ffffc900, %l2 = 00000000ff0000ff
	ldsba	[%i5+%g0]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000010001410] = 00000000, %l1 = 00000000000000ff
	ldsha	[%i0+%o5]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010081408] = ff000000, %l1 = 0000000000000000
	lduw	[%i2+%o4],%l1		! %l1 = 00000000ff000000
!	Mem[0000000030101410] = 864f00ff, %l6 = 00000000000000c9
	ldsba	[%i4+%o5]0x89,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010001414] = 0000003f, %f19 = db8bc354
	lda	[%i0+0x014]%asi,%f19	! %f19 = 0000003f
!	Mem[0000000010041418] = ff00ff00db8bc354, %f26 = ffff0000 96000000
	ldda	[%i1+0x018]%asi,%f26	! %f26 = ff00ff00 db8bc354
!	Mem[0000000010081410] = ff000000 000000ff, %l4 = 000000ff, %l5 = 0000ff54
	ldda	[%i2+%o5]0x80,%l4	! %l4 = 00000000ff000000 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l5 = 00000000000000ff, Mem[0000000010101400] = 00000000ff0000ff
	stxa	%l5,[%i4+%g0]0x88	! Mem[0000000010101400] = 00000000000000ff

p0_label_334:
!	%l0 = 0000000000000086, Mem[00000000300c1400] = 000000ff
	stwa	%l0,[%i3+%g0]0x89	! Mem[00000000300c1400] = 00000086
!	%l0 = 00000086, %l1 = ff000000, Mem[0000000030041400] = ffff0000 ffffffff
	stda	%l0,[%i1+%g0]0x89	! Mem[0000000030041400] = 00000086 ff000000
!	Mem[0000000010081400] = ff000000, %l7 = 00000000ff00ffff
	ldstuba	[%i2+%g0]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030181410] = 864f00ff, %l3 = 00000000000000ff
	swapa	[%i6+%o5]0x89,%l3	! %l3 = 00000000864f00ff
!	Mem[000000001008141c] = 06fdff0b, %l7 = 0000000000000000, %asi = 80
	swapa	[%i2+0x01c]%asi,%l7	! %l7 = 0000000006fdff0b
!	Mem[0000000010001420] = 400913b6, %l3 = 00000000864f00ff
	ldstuba	[%i0+0x020]%asi,%l3	! %l3 = 00000040000000ff
!	Mem[00000000201c0001] = 00ffaf65, %l2 = 0000000000000000
	ldstuba	[%o0+0x001]%asi,%l2	! %l2 = 000000ff000000ff
!	Mem[0000000010001428] = 00000096, %l3 = 0000000000000040
	swap	[%i0+0x028],%l3		! %l3 = 0000000000000096
!	%f14 = ff0000ff ffffffff, Mem[00000000100c1428] = 00000000 00000000
	std	%f14,[%i3+0x028]	! Mem[00000000100c1428] = ff0000ff ffffffff
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = 00ffaf65, %l7 = 0000000006fdff0b
	lduba	[%o0+0x000]%asi,%l7	! %l7 = 0000000000000000

p0_label_335:
!	Mem[0000000030001400] = 864fc963 000000ff 183100dc ffffffff
!	Mem[0000000030001410] = ff00005a 86000000 ffffffff ff000000
!	Mem[0000000030001420] = ffffffff 000000ff ff0000ff ff000000
!	Mem[0000000030001430] = 400913b6 ff000000 ffffffff ff0000ff
	ldda	[%i0]ASI_BLK_AIUSL,%f0	! Block Load from 0000000030001400
!	Mem[0000000010101408] = db8bc354, %l7 = 0000000000000000
	ldsha	[%i4+%o4]0x88,%l7	! %l7 = ffffffffffffc354
!	Mem[00000000100c1410] = ff0000ff, %l4 = 00000000ff000000
	lduwa	[%i3+%o5]0x80,%l4	! %l4 = 00000000ff0000ff
!	Mem[0000000010081400] = ff0000ff, %f24 = 000000ff
	lda	[%i2+0x000]%asi,%f24	! %f24 = ff0000ff
!	Mem[0000000030081410] = ff00005a864fc963, %f30 = ff0000ff 000000ff
	ldda	[%i2+%o5]0x89,%f30	! %f30 = ff00005a 864fc963
!	Mem[0000000010181438] = ff0000ff, %l5 = 00000000000000ff
	ldsh	[%i6+0x03a],%l5		! %l5 = 00000000000000ff
!	Mem[0000000030141400] = ffffffff, %f29 = ff000000
	lda	[%i5+%g0]0x89,%f29	! %f29 = ffffffff
!	Mem[00000000300c1408] = ffff00ff, %l4 = 00000000ff0000ff
	ldsha	[%i3+%o4]0x81,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000020800040] = ffffac70, %l3 = 0000000000000096
	ldsba	[%o1+0x040]%asi,%l3	! %l3 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l0 = 0000000000000086, Mem[0000000010141430] = ff770000000000ff, %asi = 80
	stxa	%l0,[%i5+0x030]%asi	! Mem[0000000010141430] = 0000000000000086

!	Check Point 67 for processor 0

	set	p0_check_pt_data_67,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 0000000000000086
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 00000000ff000000
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = ffffffffffffffff
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = ffffffffffffffff
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = ffffffffffffffff
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = ffffffffffffc354
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = ff000000 63c94f86
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x50],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = ffffffff dc003118
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x58],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 00000086 5a0000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x60],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 000000ff ffffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x68],%g3
	std	%f8,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f8 = ff000000 ffffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf08,%g1
	ldx	[%g4+0x70],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = 000000ff ff0000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x78],%g3
	std	%f12,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f12 = 000000ff b6130940
	bne	%xcc,p0_freg_check_fail
	mov	0xf12,%g1
	ldx	[%g4+0x80],%g3
	std	%f14,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f14 = ff0000ff ffffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf14,%g1
	ldx	[%g4+0x88],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = ff000000 0000003f
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1
	ldx	[%g4+0x90],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = 864fc963 864f00ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1
	ldx	[%g4+0x98],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = ff0000ff b6130940
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1
	ldx	[%g4+0xa0],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = ff00ff00 db8bc354
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1
	ldx	[%g4+0xa8],%g3
	std	%f28,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f28 = 00000000 ffffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf28,%g1
	ldx	[%g4+0xb0],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = ff00005a 864fc963
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 67 completed


p0_label_336:
	membar	#Sync			! Added by membar checker (70)
!	%l4 = ffffffffffffffff, Mem[0000000030001410] = ff00005a
	stha	%l4,[%i0+%o5]0x81	! Mem[0000000030001410] = ffff005a
!	Mem[0000000030141400] = ffffffff, %l5 = 00000000000000ff
	ldstuba	[%i5+%g0]0x89,%l5	! %l5 = 000000ff000000ff
!	Mem[0000000030041408] = ffffffff, %l0 = 0000000000000086
	swapa	[%i1+%o4]0x89,%l0	! %l0 = 00000000ffffffff
!	Mem[0000000010141427] = ff0000ff, %l6 = ffffffffffffffff
	ldstuba	[%i5+0x027]%asi,%l6	! %l6 = 000000ff000000ff
!	Mem[0000000010041408] = ff000000, %l3 = ffffffffffffffff
	swapa	[%i1+%o4]0x88,%l3	! %l3 = 00000000ff000000
!	%f4  = 00000086 5a0000ff, %l6 = 00000000000000ff
!	Mem[0000000030081410] = 63c94f865a0000ff
	add	%i2,0x010,%g1
	stda	%f4,[%g1+%l6]ASI_PST16_S ! Mem[0000000030081410] = 000000865a0000ff
!	%l6 = 00000000000000ff, Mem[0000000010141400] = 00c9ffff
	sth	%l6,[%i5+%g0]		! Mem[0000000010141400] = 00ffffff
!	%l6 = 00000000000000ff, Mem[00000000201c0001] = 00ffaf65, %asi = 80
	stba	%l6,[%o0+0x001]%asi	! Mem[00000000201c0000] = 00ffaf65
!	Mem[00000000201c0000] = 00ffaf65, %l4 = ffffffffffffffff
	ldstuba	[%o0+0x000]%asi,%l4	! %l4 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = ffffffff 00000000, %l4 = 00000000, %l5 = 000000ff
	ldda	[%i1+%o4]0x80,%l4	! %l4 = 00000000ffffffff 0000000000000000

p0_label_337:
!	Mem[00000000100c1400] = ffffffff, %f10 = 000000ff
	lda	[%i3+%g0]0x80,%f10	! %f10 = ffffffff
!	Mem[0000000010001410] = 3f00000000000000, %l5 = 0000000000000000
	ldxa	[%i0+%o5]0x88,%l5	! %l5 = 3f00000000000000
!	Mem[00000000211c0000] = ffff7bbb, %l7 = ffffffffffffc354
	lduh	[%o2+%g0],%l7		! %l7 = 000000000000ffff
!	Mem[0000000030181400] = 5a000000 63c94f86, %l4 = ffffffff, %l5 = 00000000
	ldda	[%i6+%g0]0x89,%l4	! %l4 = 0000000063c94f86 000000005a000000
!	Mem[0000000030101410] = 864f00ff, %l2 = 00000000000000ff
	ldsha	[%i4+%o5]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[00000000100c1410] = ff0000ff, %l5 = 000000005a000000
	lduha	[%i3+0x010]%asi,%l5	! %l5 = 000000000000ff00
!	Mem[0000000030041410] = ff4fc9ff, %f29 = ffffffff
	lda	[%i1+%o5]0x81,%f29	! %f29 = ff4fc9ff
!	Mem[0000000010101410] = ff0000ff, %l4 = 0000000063c94f86
	ldsba	[%i4+0x010]%asi,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000030081400] = 000000ff, %l6 = 00000000000000ff
	ldswa	[%i2+%g0]0x89,%l6	! %l6 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l3 = 00000000ff000000, Mem[0000000030181410] = 000000ff
	stwa	%l3,[%i6+%o5]0x89	! Mem[0000000030181410] = ff000000

p0_label_338:
!	%l1 = 00000000ff000000, Mem[0000000030101400] = ff000000
	stba	%l1,[%i4+%g0]0x81	! Mem[0000000030101400] = 00000000
!	%f16 = 005a005a 000000ff ff000000 0000003f
!	%f20 = 864fc963 864f00ff ffffffff ae12becc
!	%f24 = ff0000ff b6130940 ff00ff00 db8bc354
!	%f28 = 00000000 ff4fc9ff ff00005a 864fc963
	stda	%f16,[%i0]ASI_BLK_AIUPL	! Block Store to 0000000010001400
!	%l2 = 000000ff, %l3 = ff000000, Mem[0000000030041400] = 00000086 ff000000
	stda	%l2,[%i1+%g0]0x89	! Mem[0000000030041400] = 000000ff ff000000
	membar	#Sync			! Added by membar checker (71)
!	Mem[0000000010001410] = 864f00ff, %l6 = 00000000000000ff
	ldstuba	[%i0+%o5]0x88,%l6	! %l6 = 000000ff000000ff
!	%l6 = 00000000000000ff, Mem[0000000030081410] = 86000000
	stwa	%l6,[%i2+%o5]0x89	! Mem[0000000030081410] = 000000ff
!	Mem[0000000010141410] = ff000000, %l1 = 00000000ff000000
	ldstuba	[%i5+%o5]0x80,%l1	! %l1 = 000000ff000000ff
!	%f0  = ff000000 63c94f86 ffffffff dc003118
!	%f4  = 00000086 5a0000ff 000000ff ffffffff
!	%f8  = ff000000 ffffffff ffffffff ff0000ff
!	%f12 = 000000ff b6130940 ff0000ff ffffffff
	stda	%f0,[%i3]ASI_BLK_AIUSL	! Block Store to 00000000300c1400
!	Mem[0000000010141410] = 000000ff, %l4 = ffffffffffffffff
	swapa	[%i5+%o5]0x88,%l4	! %l4 = 00000000000000ff
!	%l1 = 00000000000000ff, Mem[0000000010041423] = 000000ff
	stb	%l1,[%i1+0x023]		! Mem[0000000010041420] = 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010141404] = 000000ff, %l2 = 00000000000000ff
	ldsh	[%i5+0x004],%l2		! %l2 = 0000000000000000

p0_label_339:
!	Mem[0000000010041400] = ff000000, %l0 = 00000000ffffffff
	ldswa	[%i1+%g0]0x80,%l0	! %l0 = ffffffffff000000
	membar	#Sync			! Added by membar checker (72)
!	Mem[00000000100c142c] = ffffffff, %l0 = ffffffffff000000
	ldsha	[%i3+0x02e]%asi,%l0	! %l0 = ffffffffffffffff
!	Mem[000000001008143c] = ae12becc, %l4 = 00000000000000ff
	ldsba	[%i2+0x03d]%asi,%l4	! %l4 = 0000000000000012
!	Mem[00000000100c1430] = 5a000000, %l4 = 0000000000000012
	ldsba	[%i3+0x032]%asi,%l4	! %l4 = 0000000000000000
!	Mem[0000000010101404] = 00000000, %l2 = 0000000000000000
	lduha	[%i4+0x004]%asi,%l2	! %l2 = 0000000000000000
!	Mem[0000000010001408] = 3f000000000000ff, %f10 = ffffffff ff0000ff
	ldda	[%i0+%o4]0x80,%f10	! %f10 = 3f000000 000000ff
!	Mem[0000000030141408] = 400913b6, %l1 = 00000000000000ff
	ldsha	[%i5+%o4]0x89,%l1	! %l1 = 00000000000013b6
!	Mem[0000000010101408] = db8bc354, %l6 = 00000000000000ff
	lduha	[%i4+%o4]0x88,%l6	! %l6 = 000000000000c354
!	Mem[0000000030041408] = 00000086, %l2 = 0000000000000000
	lduha	[%i1+%o4]0x89,%l2	! %l2 = 0000000000000086
!	Starting 10 instruction Store Burst
!	Mem[0000000010081430] = 000000ffff000046, %l1 = 00000000000013b6, %l4 = 0000000000000000
	add	%i2,0x30,%g1
	casxa	[%g1]0x80,%l1,%l4	! %l4 = 000000ffff000046

p0_label_340:
!	%f6  = 000000ff ffffffff, Mem[00000000100c1410] = ff0000ff 000000ff
	std	%f6 ,[%i3+%o5]	! Mem[00000000100c1410] = 000000ff ffffffff
!	Mem[0000000010181409] = ff0000ff, %l7 = 000000000000ffff
	ldstuba	[%i6+0x009]%asi,%l7	! %l7 = 00000000000000ff
!	%f20 = 864fc963 864f00ff, Mem[0000000030101408] = ff000000 ffffffff
	stda	%f20,[%i4+%o4]0x89	! Mem[0000000030101408] = 864fc963 864f00ff
!	Mem[0000000010101400] = 000000ff, %l4 = 000000ffff000046
	swapa	[%i4+%g0]0x88,%l4	! %l4 = 00000000000000ff
!	%l5 = 000000000000ff00, Mem[0000000010141400] = 00ffffff
	stba	%l5,[%i5+%g0]0x80	! Mem[0000000010141400] = 00ffffff
!	Mem[00000000300c1408] = dc003118, %l5 = 000000000000ff00
	ldstuba	[%i3+%o4]0x89,%l5	! %l5 = 00000018000000ff
!	%l2 = 00000086, %l3 = ff000000, Mem[0000000010041410] = 000000ff ffffffff
	stda	%l2,[%i1+%o5]0x88	! Mem[0000000010041410] = 00000086 ff000000
!	Mem[0000000010081430] = 000000ff, %l1 = 00000000000013b6, %asi = 80
	swapa	[%i2+0x030]%asi,%l1	! %l1 = 00000000000000ff
!	%l5 = 0000000000000018, Mem[0000000010181408] = ff00ffff
	stwa	%l5,[%i6+%o4]0x88	! Mem[0000000010181408] = 00000018
!	Starting 10 instruction Load Burst
!	Mem[00000000218001c0] = ffff397e, %l0 = ffffffffffffffff
	ldsha	[%o3+0x1c0]%asi,%l0	! %l0 = ffffffffffffffff

!	Check Point 68 for processor 0

	set	p0_check_pt_data_68,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = ffffffffffffffff
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 0000000000000086
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l4,%g2			! %l4 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l5,%g2			! %l5 = 0000000000000018
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l6,%g2			! %l6 = 000000000000c354
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l7,%g2			! %l7 = 0000000000000000
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x40],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 00000086 5a0000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x48],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = 3f000000 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x50],%g3
	std	%f28,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f28 = 00000000 ff4fc9ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf28,%g1

!	Check Point 68 completed


p0_label_341:
!	Mem[0000000021800100] = ffffb49a, %l7 = 0000000000000000
	ldsh	[%o3+0x100],%l7		! %l7 = ffffffffffffffff
!	Mem[0000000010101410] = ff0000ff, %l3 = 00000000ff000000
	ldsha	[%i4+%o5]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[00000000100c1408] = 00000000, %l5 = 0000000000000018
	ldsha	[%i3+%o4]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000010141400] = 00ffffff, %l0 = ffffffffffffffff
	lduha	[%i5+0x002]%asi,%l0	! %l0 = 000000000000ffff
!	Mem[0000000010081400] = ff0000ff, %l4 = 00000000000000ff
	ldswa	[%i2+%g0]0x88,%l4	! %l4 = ffffffffff0000ff
!	Mem[0000000010141410] = ffffffff5a005a00, %f20 = 864fc963 864f00ff
	ldda	[%i5+%o5]0x80,%f20	! %f20 = ffffffff 5a005a00
!	Mem[00000000100c1408] = 00000000, %l3 = 00000000000000ff
	lduha	[%i3+%o4]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000030101408] = 864fc963 864f00ff, %l0 = 0000ffff, %l1 = 000000ff
	ldda	[%i4+%o4]0x89,%l0	! %l0 = 00000000864f00ff 00000000864fc963
!	Mem[0000000010141410] = 005a005affffffff, %f16 = 005a005a 000000ff
	ldda	[%i5+%o5]0x88,%f16	! %f16 = 005a005a ffffffff
!	Starting 10 instruction Store Burst
!	%l0 = 00000000864f00ff, Mem[0000000030001400] = 864fc963
	stba	%l0,[%i0+%g0]0x81	! Mem[0000000030001400] = ff4fc963

p0_label_342:
!	%l0 = 864f00ff, %l1 = 864fc963, Mem[0000000010081428] = ff0000ff 00000000
	std	%l0,[%i2+0x028]		! Mem[0000000010081428] = 864f00ff 864fc963
!	%l6 = 000000000000c354, Mem[00000000100c1400] = ffffffff
	stba	%l6,[%i3+%g0]0x88	! Mem[00000000100c1400] = ffffff54
!	Mem[0000000010181410] = 00000000, %l2 = 0000000000000086
	swapa	[%i6+%o5]0x80,%l2	! %l2 = 0000000000000000
!	%l6 = 0000c354, %l7 = ffffffff, Mem[0000000010081430] = 000013b6 ff000046
	stda	%l6,[%i2+0x030]%asi	! Mem[0000000010081430] = 0000c354 ffffffff
!	%f22 = ffffffff ae12becc, Mem[0000000010181410] = 00000086 ff000000
	std	%f22,[%i6+%o5]	! Mem[0000000010181410] = ffffffff ae12becc
!	%l5 = 0000000000000000, Mem[0000000030001408] = 183100dc
	stba	%l5,[%i0+%o4]0x81	! Mem[0000000030001408] = 003100dc
!	%l3 = 0000000000000000, Mem[0000000030181408] = 000000ff
	stwa	%l3,[%i6+%o4]0x89	! Mem[0000000030181408] = 00000000
!	%f14 = ff0000ff ffffffff, %l7 = ffffffffffffffff
!	Mem[0000000030001418] = ffffffffff000000
	add	%i0,0x018,%g1
	stda	%f14,[%g1+%l7]ASI_PST16_S ! Mem[0000000030001418] = ff0000ffffffffff
!	%l0 = 00000000864f00ff, Mem[0000000010081439] = ffffffff, %asi = 80
	stba	%l0,[%i2+0x039]%asi	! Mem[0000000010081438] = ffffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = ffff0000 00000000, %l4 = ff0000ff, %l5 = 00000000
	ldda	[%i6+%o4]0x89,%l4	! %l4 = 0000000000000000 00000000ffff0000

p0_label_343:
!	Mem[0000000010081408] = 000000ff, %f27 = db8bc354
	lda	[%i2+%o4]0x88,%f27	! %f27 = 000000ff
!	Mem[0000000010141408] = 183100dc, %l7 = ffffffffffffffff
	ldsba	[%i5+%o4]0x80,%l7	! %l7 = 0000000000000018
!	Mem[0000000010081408] = ff000000ff000000, %f26 = ff00ff00 000000ff
	ldda	[%i2+%o4]0x80,%f26	! %f26 = ff000000 ff000000
!	Mem[0000000010181400] = ff000000, %l0 = 00000000864f00ff
	lduwa	[%i6+%g0]0x88,%l0	! %l0 = 00000000ff000000
!	Mem[0000000010081408] = ff000000, %l2 = 0000000000000000
	ldsha	[%i2+%o4]0x80,%l2	! %l2 = ffffffffffffff00
!	Mem[0000000010101408] = db8bc354, %f14 = ff0000ff
	lda	[%i4+%o4]0x88,%f14	! %f14 = db8bc354
!	Mem[0000000010141408] = 183100dc, %f21 = 5a005a00
	lda	[%i5+%o4]0x80,%f21	! %f21 = 183100dc
!	Mem[00000000100c1408] = 0000000000000000, %f0  = ff000000 63c94f86
	ldda	[%i3+%o4]0x80,%f0 	! %f0  = 00000000 00000000
!	Mem[0000000010141410] = ffffffff, %l1 = 00000000864fc963
	ldsha	[%i5+%o5]0x88,%l1	! %l1 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%f8  = ff000000 ffffffff, %l7 = 0000000000000018
!	Mem[0000000030181408] = 000000000000ffff
	add	%i6,0x008,%g1
	stda	%f8,[%g1+%l7]ASI_PST16_SL ! Mem[0000000030181408] = 00000000000000ff

p0_label_344:
!	Mem[000000001000142c] = 00ff00ff, %l3 = 0000000000000000
	ldstub	[%i0+0x02c],%l3		! %l3 = 00000000000000ff
!	Mem[0000000030041408] = 00000086, %l2 = ffffffffffffff00
	swapa	[%i1+%o4]0x89,%l2	! %l2 = 0000000000000086
!	Mem[00000000201c0000] = ffffaf65, %l4 = 0000000000000000
	ldstub	[%o0+%g0],%l4		! %l4 = 000000ff000000ff
!	%f12 = 000000ff b6130940, Mem[0000000010001400] = ff000000 5a005a00
	stda	%f12,[%i0+%g0]0x80	! Mem[0000000010001400] = 000000ff b6130940
!	Mem[0000000010001410] = ff004f86, %l6 = 000000000000c354
	ldstuba	[%i0+%o5]0x80,%l6	! %l6 = 000000ff000000ff
!	Mem[0000000010101408] = db8bc354, %l2 = 0000000000000086
	ldstuba	[%i4+%o4]0x88,%l2	! %l2 = 00000054000000ff
!	%l6 = 00000000000000ff, Mem[00000000218001c0] = ffff397e
	sth	%l6,[%o3+0x1c0]		! Mem[00000000218001c0] = 00ff397e
!	%l2 = 0000000000000054, Mem[0000000030181400] = 864fc963
	stwa	%l2,[%i6+%g0]0x81	! Mem[0000000030181400] = 00000054
!	%l7 = 0000000000000018, Mem[00000000211c0000] = ffff7bbb, %asi = 80
	stba	%l7,[%o2+0x000]%asi	! Mem[00000000211c0000] = 18ff7bbb
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = ffffffffdc003118, %f28 = 00000000 ff4fc9ff
	ldda	[%i5+%o4]0x88,%f28	! %f28 = ffffffff dc003118

p0_label_345:
!	Mem[00000000300c1408] = dc0031ff, %l0 = 00000000ff000000
	ldsba	[%i3+%o4]0x89,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000030181408] = ff000000 00000000, %l6 = 000000ff, %l7 = 00000018
	ldda	[%i6+%o4]0x89,%l6	! %l6 = 0000000000000000 00000000ff000000
!	Mem[0000000010141410] = ffffffff, %l6 = 0000000000000000
	ldsha	[%i5+%o5]0x88,%l6	! %l6 = ffffffffffffffff
!	Mem[00000000100c1410] = 000000ff, %l5 = 00000000ffff0000
	lduba	[%i3+%o5]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000020800040] = ffffac70, %l3 = 0000000000000000
	lduh	[%o1+0x040],%l3		! %l3 = 000000000000ffff
!	Mem[0000000010141408] = dc003118, %f25 = b6130940
	lda	[%i5+%o4]0x88,%f25	! %f25 = dc003118
!	Mem[00000000100c1408] = 00000000, %l1 = ffffffffffffffff
	ldsha	[%i3+%o4]0x88,%l1	! %l1 = 0000000000000000
!	Mem[00000000100c140c] = 00000000, %l7 = 00000000ff000000
	lduha	[%i3+0x00c]%asi,%l7	! %l7 = 0000000000000000
!	Mem[0000000010181408] = 18000000, %l4 = 00000000000000ff
	lduwa	[%i6+%o4]0x80,%l4	! %l4 = 0000000018000000
!	Starting 10 instruction Store Burst
!	%l0 = ffffffffffffffff, Mem[00000000300c1400] = ff00000063c94f86
	stxa	%l0,[%i3+%g0]0x89	! Mem[00000000300c1400] = ffffffffffffffff

!	Check Point 69 for processor 0

	set	p0_check_pt_data_69,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = ffffffffffffffff
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 0000000000000000
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 0000000000000054
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 000000000000ffff
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 0000000018000000
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 0000000000000000
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = ffffffffffffffff
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 0000000000000000
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = 00000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x50],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 00000086 5a0000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x58],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 000000ff ffffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x60],%g3
	std	%f14,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f14 = db8bc354 ffffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf14,%g1
	ldx	[%g4+0x68],%g3
	std	%f16,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f16 = 005a005a ffffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf16,%g1
	ldx	[%g4+0x70],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = ffffffff 183100dc
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1
	ldx	[%g4+0x78],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = ff0000ff dc003118
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1
	ldx	[%g4+0x80],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = ff000000 ff000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1
	ldx	[%g4+0x88],%g3
	std	%f28,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f28 = ffffffff dc003118
	bne	%xcc,p0_freg_check_fail
	mov	0xf28,%g1

!	Check Point 69 completed


p0_label_346:
!	%l4 = 0000000018000000, Mem[0000000010041408] = ffffffff
	stha	%l4,[%i1+%o4]0x88	! Mem[0000000010041408] = ffff0000
!	%f28 = ffffffff dc003118, Mem[0000000030041408] = 00ffffff 000000ff
	stda	%f28,[%i1+%o4]0x81	! Mem[0000000030041408] = ffffffff dc003118
!	%f3  = dc003118, Mem[0000000030141410] = ffffffff
	sta	%f3 ,[%i5+%o5]0x89	! Mem[0000000030141410] = dc003118
!	%l4 = 0000000018000000, Mem[0000000010181400] = ff000000
	stba	%l4,[%i6+%g0]0x88	! Mem[0000000010181400] = ff000000
!	Mem[0000000010181400] = ff000000, %l3 = 000000000000ffff
	swapa	[%i6+%g0]0x88,%l3	! %l3 = 00000000ff000000
!	Mem[0000000010141430] = 0000000000000086, %l4 = 0000000018000000, %l2 = 0000000000000054
	add	%i5,0x30,%g1
	casxa	[%g1]0x80,%l4,%l2	! %l2 = 0000000000000086
!	%l4 = 18000000, %l5 = 00000000, Mem[0000000030001410] = 5a00ffff 00000086
	stda	%l4,[%i0+%o5]0x89	! Mem[0000000030001410] = 18000000 00000000
!	%l0 = ffffffff, %l1 = 00000000, Mem[0000000030081410] = ff000000 5a0000ff
	stda	%l0,[%i2+%o5]0x81	! Mem[0000000030081410] = ffffffff 00000000
!	%l2 = 0000000000000086, Mem[0000000010101400] = 460000ff
	stba	%l2,[%i4+%g0]0x80	! Mem[0000000010101400] = 860000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = ff0000ff 00000000, %l6 = ffffffff, %l7 = 00000000
	ldda	[%i4+%o5]0x80,%l6	! %l6 = 00000000ff0000ff 0000000000000000

p0_label_347:
!	Mem[00000000100c1428] = ff0000ffffffffff, %l5 = 0000000000000000
	ldxa	[%i3+0x028]%asi,%l5	! %l5 = ff0000ffffffffff
!	Mem[00000000100c1418] = ffff0000 000000ff, %l0 = ffffffff, %l1 = 00000000
	ldd	[%i3+0x018],%l0		! %l0 = 00000000ffff0000 00000000000000ff
!	Mem[0000000010001410] = ff004f8663c94f86, %f22 = ffffffff ae12becc
	ldda	[%i0+%o5]0x80,%f22	! %f22 = ff004f86 63c94f86
!	Mem[00000000100c1400] = ffffff54, %l0 = 00000000ffff0000
	ldsha	[%i3+%g0]0x88,%l0	! %l0 = ffffffffffffff54
!	Mem[0000000030001410] = 18000000, %l7 = 0000000000000000
	lduha	[%i0+%o5]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000030181400] = 54000000, %l1 = 00000000000000ff
	lduha	[%i6+%g0]0x89,%l1	! %l1 = 0000000000000000
!	Mem[000000001004143c] = 183170b9, %l4 = 0000000018000000
	ldswa	[%i1+0x03c]%asi,%l4	! %l4 = 00000000183170b9
!	Mem[0000000030041408] = ffffffff, %l1 = 0000000000000000
	ldswa	[%i1+%o4]0x81,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000030181410] = 000000ff00000000, %f2  = ffffffff dc003118
	ldda	[%i6+%o5]0x81,%f2 	! %f2  = 000000ff 00000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010101408] = db8bc3ff, %l0 = ffffffffffffff54
	swapa	[%i4+%o4]0x88,%l0	! %l0 = 00000000db8bc3ff

p0_label_348:
!	%f26 = ff000000, Mem[0000000030081410] = ffffffff
	sta	%f26,[%i2+%o5]0x89	! Mem[0000000030081410] = ff000000
!	%l0 = 00000000db8bc3ff, Mem[0000000010181430] = ffffffff
	stw	%l0,[%i6+0x030]		! Mem[0000000010181430] = db8bc3ff
!	%l5 = ff0000ffffffffff, Mem[0000000030141408] = b6130940
	stwa	%l5,[%i5+%o4]0x81	! Mem[0000000030141408] = ffffffff
!	%l6 = ff0000ff, %l7 = 00000000, Mem[0000000010001400] = ff000000 400913b6
	stda	%l6,[%i0+%g0]0x88	! Mem[0000000010001400] = ff0000ff 00000000
!	%f26 = ff000000 ff000000, %l6 = 00000000ff0000ff
!	Mem[0000000030141428] = 000000ff00000000
	add	%i5,0x028,%g1
	stda	%f26,[%g1+%l6]ASI_PST32_S ! Mem[0000000030141428] = ff000000ff000000
!	%l6 = ff0000ff, %l7 = 00000000, Mem[0000000030041400] = ff000000 000000ff
	stda	%l6,[%i1+%g0]0x81	! Mem[0000000030041400] = ff0000ff 00000000
!	Mem[0000000030181400] = 54000000, %l1 = ffffffffffffffff
	swapa	[%i6+%g0]0x89,%l1	! %l1 = 0000000054000000
!	%f10 = 3f000000 000000ff, Mem[0000000010181408] = 18000000 ff000000
	stda	%f10,[%i6+%o4]0x80	! Mem[0000000010181408] = 3f000000 000000ff
!	%l1 = 0000000054000000, Mem[0000000010101400] = 860000ff00000000, %asi = 80
	stxa	%l1,[%i4+0x000]%asi	! Mem[0000000010101400] = 0000000054000000
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = 000000ff, %l4 = 00000000183170b9
	ldsba	[%i3+%o5]0x80,%l4	! %l4 = 0000000000000000

p0_label_349:
!	Mem[0000000030081410] = 00000000ff000000, %f8  = ff000000 ffffffff
	ldda	[%i2+%o5]0x89,%f8 	! %f8  = 00000000 ff000000
!	Mem[0000000030101408] = ff004f86, %l5 = ff0000ffffffffff
	lduha	[%i4+%o4]0x81,%l5	! %l5 = 000000000000ff00
!	Mem[0000000010141400] = ffffff00, %l3 = 00000000ff000000
	lduwa	[%i5+%g0]0x88,%l3	! %l3 = 00000000ffffff00
!	Mem[0000000030001408] = 003100dc, %f27 = ff000000
	lda	[%i0+%o4]0x81,%f27	! %f27 = 003100dc
!	Mem[0000000030101408] = ff004f8663c94f86, %f4  = 00000086 5a0000ff
	ldda	[%i4+%o4]0x81,%f4 	! %f4  = ff004f86 63c94f86
!	Mem[00000000201c0000] = ffffaf65, %l0 = 00000000db8bc3ff
	lduha	[%o0+0x000]%asi,%l0	! %l0 = 000000000000ffff
!	Mem[00000000300c1408] = ff3100dc, %l3 = 00000000ffffff00
	ldswa	[%i3+%o4]0x81,%l3	! %l3 = ffffffffff3100dc
!	Mem[00000000211c0000] = 18ff7bbb, %l4 = 0000000000000000
	lduha	[%o2+0x000]%asi,%l4	! %l4 = 00000000000018ff
!	Mem[0000000030181410] = 000000ff, %l3 = ffffffffff3100dc
	ldsha	[%i6+%o5]0x81,%l3	! %l3 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010041414] = 000000ff, %l4 = 00000000000018ff
	swap	[%i1+0x014],%l4		! %l4 = 00000000000000ff

p0_label_350:
!	Mem[00000000100c1408] = 00000000, %l1 = 0000000054000000
	ldstuba	[%i3+%o4]0x80,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010101400] = 00000000, %l5 = 000000000000ff00
	ldstuba	[%i4+%g0]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030181400] = ffffffff, %l0 = 000000000000ffff
	ldstuba	[%i6+%g0]0x81,%l0	! %l0 = 000000ff000000ff
!	%l4 = 00000000000000ff, Mem[0000000030041408] = ffffffff
	stba	%l4,[%i1+%o4]0x89	! Mem[0000000030041408] = ffffffff
!	%l6 = 00000000ff0000ff, Mem[0000000010181408] = 3f000000
	stwa	%l6,[%i6+%o4]0x80	! Mem[0000000010181408] = ff0000ff
!	%f22 = ff004f86 63c94f86, %l3 = 0000000000000000
!	Mem[0000000010181418] = 00000000a96e6a5a
	add	%i6,0x018,%g1
	stda	%f22,[%g1+%l3]ASI_PST32_PL ! Mem[0000000010181418] = 00000000a96e6a5a
!	Mem[00000000300c1410] = ff00005a, %l7 = 0000000000000000
	swapa	[%i3+%o5]0x81,%l7	! %l7 = 00000000ff00005a
!	Mem[0000000010101400] = 000000ff, %l5 = 0000000000000000
	ldstuba	[%i4+%g0]0x88,%l5	! %l5 = 000000ff000000ff
!	%l5 = 00000000000000ff, Mem[0000000030041408] = ffffffff
	stwa	%l5,[%i1+%o4]0x81	! Mem[0000000030041408] = 000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = 18ff7bbb, %l4 = 00000000000000ff
	ldsb	[%o2+0x001],%l4		! %l4 = ffffffffffffffff

!	Check Point 70 for processor 0

	set	p0_check_pt_data_70,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 0000000000000000
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l3,%g2			! %l3 = 0000000000000000
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l4,%g2			! %l4 = ffffffffffffffff
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l5,%g2			! %l5 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l7,%g2			! %l7 = 00000000ff00005a
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x38],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = 00000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x40],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = 000000ff 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x48],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = ff004f86 63c94f86
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x50],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 000000ff ffffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x58],%g3
	std	%f8,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f8 = 00000000 ff000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf08,%g1
	ldx	[%g4+0x60],%g3
	std	%f22,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f22 = ff004f86 63c94f86
	bne	%xcc,p0_freg_check_fail
	mov	0xf22,%g1
	ldx	[%g4+0x68],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = ff000000 003100dc
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1

!	Check Point 70 completed


p0_label_351:
!	Mem[00000000300c1410] = 0000000086000000, %l0 = 00000000000000ff
	ldxa	[%i3+%o5]0x81,%l0	! %l0 = 0000000086000000
!	Mem[0000000030101400] = 864fc963 00000000, %l2 = 00000086, %l3 = 00000000
	ldda	[%i4+%g0]0x89,%l2	! %l2 = 0000000000000000 00000000864fc963
!	Mem[00000000300c1408] = dc0031ff, %l0 = 0000000086000000
	ldswa	[%i3+%o4]0x89,%l0	! %l0 = ffffffffdc0031ff
!	Mem[0000000030181400] = ffffffff, %l4 = ffffffffffffffff
	lduwa	[%i6+%g0]0x81,%l4	! %l4 = 00000000ffffffff
!	Mem[0000000030081410] = 00000000ff000000, %f4  = ff004f86 63c94f86
	ldda	[%i2+%o5]0x89,%f4 	! %f4  = 00000000 ff000000
!	Mem[00000000211c0000] = 18ff7bbb, %l6 = 00000000ff0000ff
	ldub	[%o2+%g0],%l6		! %l6 = 0000000000000018
!	Mem[0000000030041400] = ff0000ff, %l6 = 0000000000000018
	lduba	[%i1+%g0]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[00000000100c1400] = 54ffffff, %l1 = 0000000000000000
	lduba	[%i3+%g0]0x80,%l1	! %l1 = 0000000000000054
!	Mem[0000000010141408] = 183100dcffffffff, %l3 = 00000000864fc963
	ldx	[%i5+%o4],%l3		! %l3 = 183100dcffffffff
!	Starting 10 instruction Store Burst
!	Mem[0000000010081400] = ff0000ff, %l4 = 00000000ffffffff
	ldstuba	[%i2+%g0]0x88,%l4	! %l4 = 000000ff000000ff

p0_label_352:
!	Mem[0000000030141408] = ffffffff, %l4 = 00000000000000ff
	ldstuba	[%i5+%o4]0x81,%l4	! %l4 = 000000ff000000ff
!	Mem[0000000010081410] = ff000000, %l7 = 00000000ff00005a
	swapa	[%i2+%o5]0x80,%l7	! %l7 = 00000000ff000000
!	%l6 = 00000000000000ff, Mem[0000000030081408] = 0000ff54
	stwa	%l6,[%i2+%o4]0x89	! Mem[0000000030081408] = 000000ff
!	%l2 = 0000000000000000, Mem[0000000020800000] = ffff7d94
	sth	%l2,[%o1+%g0]		! Mem[0000000020800000] = 00007d94
!	%l2 = 0000000000000000, Mem[0000000030141408] = ffffffff
	stba	%l2,[%i5+%o4]0x89	! Mem[0000000030141408] = ffffff00
!	%l4 = 00000000000000ff, Mem[0000000030001408] = ffffffffdc003100
	stxa	%l4,[%i0+%o4]0x89	! Mem[0000000030001408] = 00000000000000ff
!	%f9  = ff000000, Mem[0000000010041408] = 0000ffff
	sta	%f9 ,[%i1+%o4]0x80	! Mem[0000000010041408] = ff000000
!	Mem[0000000030101410] = ff004f86, %l2 = 0000000000000000
	swapa	[%i4+%o5]0x81,%l2	! %l2 = 00000000ff004f86
!	%l0 = dc0031ff, %l1 = 00000054, Mem[0000000030181400] = ffffffff 5a000000
	stda	%l0,[%i6+%g0]0x89	! Mem[0000000030181400] = dc0031ff 00000054
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = 000000ff, %l7 = 00000000ff000000
	lduha	[%i2+%g0]0x89,%l7	! %l7 = 00000000000000ff

p0_label_353:
!	Mem[0000000010101414] = 00000000, %l2 = 00000000ff004f86
	ldsba	[%i4+0x015]%asi,%l2	! %l2 = 0000000000000000
!	Mem[00000000201c0000] = ffffaf65, %l5 = 00000000000000ff
	lduba	[%o0+0x000]%asi,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030041410] = ffc94fff, %l1 = 0000000000000054
	ldsha	[%i1+%o5]0x89,%l1	! %l1 = 0000000000004fff
!	Mem[0000000010041400] = ff000000, %l2 = 0000000000000000
	lduwa	[%i1+%g0]0x80,%l2	! %l2 = 00000000ff000000
!	Mem[00000000201c0000] = ffffaf65, %l0 = ffffffffdc0031ff
	lduha	[%o0+0x000]%asi,%l0	! %l0 = 000000000000ffff
!	Mem[0000000030001410] = 00000018, %l3 = 183100dcffffffff
	lduba	[%i0+%o5]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000030001400] = ff4fc963, %l3 = 0000000000000000
	ldsha	[%i0+%g0]0x81,%l3	! %l3 = ffffffffffffff4f
!	Mem[0000000030101410] = 00000000, %l7 = 00000000000000ff
	ldsha	[%i4+%o5]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000010181408] = ff0000ff, %f15 = ffffffff
	lda	[%i6+%o4]0x80,%f15	! %f15 = ff0000ff
!	Starting 10 instruction Store Burst
!	%f12 = 000000ff b6130940, %l7 = 0000000000000000
!	Mem[0000000030181438] = ffffffffba2d00a3
	add	%i6,0x038,%g1
	stda	%f12,[%g1+%l7]ASI_PST8_S ! Mem[0000000030181438] = ffffffffba2d00a3

p0_label_354:
!	Mem[0000000010101400] = 000000ff, %l6 = 00000000000000ff
	swapa	[%i4+%g0]0x88,%l6	! %l6 = 00000000000000ff
!	%l2 = 00000000ff000000, Mem[00000000100c1403] = 54ffffff, %asi = 80
	stba	%l2,[%i3+0x003]%asi	! Mem[00000000100c1400] = 54ffff00
!	%l4 = 000000ff, %l5 = 000000ff, Mem[0000000030141410] = 183100dc dc003118
	stda	%l4,[%i5+%o5]0x81	! Mem[0000000030141410] = 000000ff 000000ff
!	%l2 = 00000000ff000000, Mem[000000001014143c] = 864fc9ff, %asi = 80
	stwa	%l2,[%i5+0x03c]%asi	! Mem[000000001014143c] = ff000000
!	%l7 = 0000000000000000, Mem[0000000010181408] = ff0000ff
	stwa	%l7,[%i6+%o4]0x80	! Mem[0000000010181408] = 00000000
!	Mem[00000000300c1400] = ffffffff, %l4 = 00000000000000ff
	ldstuba	[%i3+%g0]0x81,%l4	! %l4 = 000000ff000000ff
!	Mem[00000000100c1408] = ff000000, %l1 = 00004fff, %l3 = ffffff4f
	add	%i3,0x08,%g1
	casa	[%g1]0x80,%l1,%l3	! %l3 = 00000000ff000000
!	%l1 = 0000000000004fff, Mem[0000000030181410] = ff000000
	stba	%l1,[%i6+%o5]0x89	! Mem[0000000030181410] = ff0000ff
!	Mem[0000000021800041] = 1effb2d9, %l5 = 00000000000000ff
	ldstub	[%o3+0x041],%l5		! %l5 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181420] = 00ffffff 000000ff, %l0 = 0000ffff, %l1 = 00004fff
	ldd	[%i6+0x020],%l0		! %l0 = 0000000000ffffff 00000000000000ff

p0_label_355:
!	Mem[0000000010081408] = 000000ff, %l6 = 00000000000000ff
	lduha	[%i2+%o4]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[00000000300c1410] = 00000000, %l5 = 00000000000000ff
	ldsba	[%i3+%o5]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000010141408] = dc003118, %l4 = 00000000000000ff
	ldswa	[%i5+%o4]0x88,%l4	! %l4 = ffffffffdc003118
!	Mem[0000000030081400] = ff000000, %l2 = 00000000ff000000
	ldsba	[%i2+%g0]0x81,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000010001400] = ff0000ff00000000, %f8  = 00000000 ff000000
	ldda	[%i0+%g0]0x80,%f8 	! %f8  = ff0000ff 00000000
!	Mem[0000000010041408] = ff000000, %l2 = ffffffffffffffff
	ldsha	[%i1+%o4]0x80,%l2	! %l2 = ffffffffffffff00
!	Mem[0000000030001410] = 0000001800000000, %f28 = ffffffff dc003118
	ldda	[%i0+%o5]0x81,%f28	! %f28 = 00000018 00000000
!	Mem[00000000211c0000] = 18ff7bbb, %l1 = 00000000000000ff
	lduba	[%o2+0x001]%asi,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030141410] = ff000000, %l1 = 00000000000000ff
	lduha	[%i5+%o5]0x89,%l1	! %l1 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010181400] = 0000ffff, %l1 = 0000000000000000
	swapa	[%i6+%g0]0x88,%l1	! %l1 = 000000000000ffff

!	Check Point 71 for processor 0

	set	p0_check_pt_data_71,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 0000000000ffffff
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 000000000000ffff
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = ffffffffffffff00
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 00000000ff000000
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = ffffffffdc003118
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 0000000000000000
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 0000000000000000
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = 00000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x50],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = 000000ff 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x58],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 00000000 ff000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x60],%g3
	std	%f8,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f8 = ff0000ff 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf08,%g1
	ldx	[%g4+0x68],%g3
	std	%f14,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f14 = db8bc354 ff0000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf14,%g1
	ldx	[%g4+0x70],%g3
	std	%f28,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f28 = 00000018 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf28,%g1

!	Check Point 71 completed


p0_label_356:
!	Mem[0000000030101400] = 00000000, %l6 = 00000000000000ff
	lduba	[%i4+%g0]0x81,%l6	! %l6 = 0000000000000000
!	%l6 = 0000000000000000, Mem[0000000010101424] = 00002dba, %asi = 80
	stha	%l6,[%i4+0x024]%asi	! Mem[0000000010101424] = 00002dba
!	%f30 = ff00005a 864fc963, %l1 = 000000000000ffff
!	Mem[0000000010141420] = 000000ffff0000ff
	add	%i5,0x020,%g1
	stda	%f30,[%g1+%l1]ASI_PST16_P ! Mem[0000000010141420] = ff00005a864fc963
!	%l5 = 0000000000000000, Mem[0000000010181404] = b61309ff
	sth	%l5,[%i6+0x004]		! Mem[0000000010181404] = 000009ff
!	%l5 = 0000000000000000, Mem[0000000021800040] = 1effb2d9
	sth	%l5,[%o3+0x040]		! Mem[0000000021800040] = 0000b2d9
!	%l5 = 0000000000000000, Mem[0000000010081400] = ff0000ff
	stba	%l5,[%i2+%g0]0x80	! Mem[0000000010081400] = 000000ff
!	%f12 = 000000ff b6130940, Mem[0000000010101408] = 54ffffff 00000000
	stda	%f12,[%i4+0x008]%asi	! Mem[0000000010101408] = 000000ff b6130940
!	%l0 = 0000000000ffffff, Mem[0000000030001408] = 000000ff
	stwa	%l0,[%i0+%o4]0x89	! Mem[0000000030001408] = 00ffffff
!	%l0 = 00ffffff, %l1 = 0000ffff, Mem[0000000010101400] = 000000ff 00000054
	stda	%l0,[%i4+%g0]0x88	! Mem[0000000010101400] = 00ffffff 0000ffff
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = 00000000, %l1 = 000000000000ffff
	lduha	[%i3+%o5]0x81,%l1	! %l1 = 0000000000000000

p0_label_357:
!	Mem[00000000211c0000] = 18ff7bbb, %l4 = ffffffffdc003118
	lduh	[%o2+%g0],%l4		! %l4 = 00000000000018ff
!	Mem[00000000201c0000] = ffffaf65, %l1 = 0000000000000000
	ldsb	[%o0+0x001],%l1		! %l1 = ffffffffffffffff
!	Mem[000000001018140c] = 000000ff, %l5 = 0000000000000000
	ldsh	[%i6+0x00e],%l5		! %l5 = 00000000000000ff
!	Mem[0000000010081400] = ff000000, %l6 = 0000000000000000
	lduba	[%i2+%g0]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000010141410] = ffffffff, %l3 = 00000000ff000000
	lduba	[%i5+%o5]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030081408] = ff000000, %l0 = 0000000000ffffff
	ldsha	[%i2+%o4]0x81,%l0	! %l0 = ffffffffffffff00
!	Mem[00000000300c1400] = ffffffff, %l5 = 00000000000000ff
	lduha	[%i3+%g0]0x81,%l5	! %l5 = 000000000000ffff
!	Mem[0000000010001418] = ccbe12ae ffffffff, %l6 = 00000000, %l7 = 00000000
	ldd	[%i0+0x018],%l6		! %l6 = 00000000ccbe12ae 00000000ffffffff
!	Mem[0000000030181410] = ff0000ff, %l5 = 000000000000ffff
	lduwa	[%i6+%o5]0x81,%l5	! %l5 = 00000000ff0000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000030001408] = ffffff00, %l2 = ffffffffffffff00
	ldstuba	[%i0+%o4]0x81,%l2	! %l2 = 000000ff000000ff

p0_label_358:
!	%f20 = ffffffff 183100dc, %l5 = 00000000ff0000ff
!	Mem[0000000030141408] = 00ffffff00000000
	add	%i5,0x008,%g1
	stda	%f20,[%g1+%l5]ASI_PST16_S ! Mem[0000000030141408] = ffffffff183100dc
!	%l2 = 00000000000000ff, Mem[0000000030181400] = dc0031ff
	stwa	%l2,[%i6+%g0]0x89	! Mem[0000000030181400] = 000000ff
!	Mem[0000000030081408] = 000000ff, %l2 = 00000000000000ff
	ldstuba	[%i2+%o4]0x89,%l2	! %l2 = 000000ff000000ff
!	%l1 = ffffffffffffffff, Mem[0000000030081400] = ff000000
	stba	%l1,[%i2+%g0]0x81	! Mem[0000000030081400] = ff000000
!	Mem[0000000010081408] = ff000000, %l2 = 00000000000000ff
	swapa	[%i2+%o4]0x80,%l2	! %l2 = 00000000ff000000
!	Mem[0000000010041414] = 000018ff, %l4 = 000018ff, %l2 = ff000000
	add	%i1,0x14,%g1
	casa	[%g1]0x80,%l4,%l2	! %l2 = 00000000000018ff
!	%l4 = 00000000000018ff, Mem[0000000010001404] = 00000000, %asi = 80
	stwa	%l4,[%i0+0x004]%asi	! Mem[0000000010001404] = 000018ff
!	Mem[00000000300c1400] = ffffffff, %l6 = 00000000ccbe12ae
	ldstuba	[%i3+%g0]0x89,%l6	! %l6 = 000000ff000000ff
!	%l3 = 00000000000000ff, %l0 = ffffffffffffff00, %y  = 000000ff
	umul	%l3,%l0,%l3		! %l3 = 000000feffff0100, %y = 000000fe
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = 18000000, %l6 = 00000000000000ff
	lduba	[%i0+%o5]0x89,%l6	! %l6 = 0000000000000000

p0_label_359:
!	Mem[0000000010081410] = ff0000005a0000ff, %l5 = 00000000ff0000ff
	ldxa	[%i2+%o5]0x88,%l5	! %l5 = ff0000005a0000ff
!	%f22 = ff004f86 63c94f86, Mem[0000000010081408] = ff000000 000000ff
	stda	%f22,[%i2+%o4]0x88	! Mem[0000000010081408] = ff004f86 63c94f86
!	Mem[0000000010081400] = 000000ff 00000000, %l6 = 00000000, %l7 = ffffffff
	ldda	[%i2+%g0]0x80,%l6	! %l6 = 00000000000000ff 0000000000000000
!	Mem[0000000010081410] = ff00005a, %l0 = ffffffffffffff00
	lduwa	[%i2+0x010]%asi,%l0	! %l0 = 00000000ff00005a
!	Mem[0000000030101410] = 0000000000000000, %l6 = 00000000000000ff
	ldxa	[%i4+%o5]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000010001408] = 3f000000 000000ff, %l6 = 00000000, %l7 = 00000000
	ldda	[%i0+%o4]0x80,%l6	! %l6 = 000000003f000000 00000000000000ff
!	Mem[0000000010101400] = ffffff00, %l2 = 00000000000018ff
	ldsha	[%i4+%g0]0x80,%l2	! %l2 = ffffffffffffffff
!	Mem[00000000300c1408] = dc0031ff, %l3 = 000000feffff0100
	ldswa	[%i3+%o4]0x89,%l3	! %l3 = ffffffffdc0031ff
!	Mem[00000000100c1410] = ffffffffff000000, %f24 = ff0000ff dc003118
	ldda	[%i3+%o5]0x88,%f24	! %f24 = ffffffff ff000000
!	Starting 10 instruction Store Burst
!	%f30 = ff00005a 864fc963, Mem[00000000100c1410] = ff000000 ffffffff
	stda	%f30,[%i3+%o5]0x88	! Mem[00000000100c1410] = ff00005a 864fc963

p0_label_360:
!	%l0 = ff00005a, %l1 = ffffffff, Mem[0000000010101400] = 00ffffff 0000ffff
	stda	%l0,[%i4+%g0]0x88	! Mem[0000000010101400] = ff00005a ffffffff
!	Mem[0000000020800001] = 00007d94, %l0 = 00000000ff00005a
	ldstub	[%o1+0x001],%l0		! %l0 = 00000000000000ff
!	%l3 = ffffffffdc0031ff, Mem[0000000010181408] = 00000000
	stha	%l3,[%i6+%o4]0x88	! Mem[0000000010181408] = 000031ff
!	%l4 = 00000000000018ff, Mem[0000000010041420] = 000000ff00ff0000
	stx	%l4,[%i1+0x020]		! Mem[0000000010041420] = 00000000000018ff
!	Mem[0000000030041400] = ff0000ff, %l7 = 00000000000000ff
	ldstuba	[%i1+%g0]0x81,%l7	! %l7 = 000000ff000000ff
!	Mem[00000000100c1424] = 06fd1eff, %l3 = ffffffffdc0031ff, %asi = 80
	swapa	[%i3+0x024]%asi,%l3	! %l3 = 0000000006fd1eff
!	%l1 = ffffffffffffffff, Mem[00000000300c1400] = ffffffffffffffff
	stxa	%l1,[%i3+%g0]0x81	! Mem[00000000300c1400] = ffffffffffffffff
!	Mem[0000000010001400] = ff0000ff, %l3 = 06fd1eff, %l3 = 06fd1eff
	casa	[%i0]0x80,%l3,%l3	! %l3 = 00000000ff0000ff
!	%l3 = 00000000ff0000ff, Mem[0000000010001408] = ff0000000000003f
	stxa	%l3,[%i0+%o4]0x88	! Mem[0000000010001408] = 00000000ff0000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030101410] = 00000000, %f1  = 00000000
	lda	[%i4+%o5]0x81,%f1 	! %f1 = 00000000

!	Check Point 72 for processor 0

	set	p0_check_pt_data_72,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 0000000000000000
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = ffffffffffffffff
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = ffffffffffffffff
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 00000000ff0000ff
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 00000000000018ff
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = ff0000005a0000ff
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 000000003f000000
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = 00000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x50],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 000000ff ffffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x58],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = ffffffff ff000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1

!	Check Point 72 completed


p0_label_361:
!	Mem[0000000030141400] = ffffffff, %l7 = 00000000000000ff
	ldsba	[%i5+%g0]0x81,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010081410] = 5a0000ff, %l6 = 000000003f000000
	lduha	[%i2+%o5]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010041408] = ff000000, %l1 = ffffffffffffffff
	ldsha	[%i1+%o4]0x80,%l1	! %l1 = ffffffffffffff00
!	Mem[0000000010041400] = ff000000 00000000, %l6 = 000000ff, %l7 = ffffffff
	ldda	[%i1+%g0]0x80,%l6	! %l6 = 00000000ff000000 0000000000000000
!	Mem[00000000100c140d] = 00000000, %l2 = ffffffffffffffff
	ldstub	[%i3+0x00d],%l2		! %l2 = 00000000000000ff
!	Mem[0000000030001410] = 0000001800000000, %l3 = 00000000ff0000ff
	ldxa	[%i0+%o5]0x81,%l3	! %l3 = 0000001800000000
!	Mem[0000000010081400] = ff000000, %l1 = ffffffffffffff00
	ldsha	[%i2+%g0]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010001408] = ff0000ff, %l4 = 00000000000018ff
	lduba	[%i0+%o4]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[00000000211c0000] = 18ff7bbb, %l7 = 0000000000000000
	ldsha	[%o2+0x000]%asi,%l7	! %l7 = 00000000000018ff
!	Starting 10 instruction Store Burst
!	%l0 = 0000000000000000, Mem[0000000030181400] = ff00000054000000
	stxa	%l0,[%i6+%g0]0x81	! Mem[0000000030181400] = 0000000000000000

p0_label_362:
!	%l2 = 0000000000000000, Mem[0000000030181408] = 00000000000000ff
	stxa	%l2,[%i6+%o4]0x81	! Mem[0000000030181408] = 0000000000000000
!	%l6 = ff000000, %l7 = 000018ff, Mem[0000000010001408] = ff0000ff 00000000
	stda	%l6,[%i0+%o4]0x88	! Mem[0000000010001408] = ff000000 000018ff
!	Mem[0000000010081414] = 000000ff, %l7 = 000018ff, %l0 = 00000000
	add	%i2,0x14,%g1
	casa	[%g1]0x80,%l7,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030081400] = 000000ff, %l2 = 0000000000000000
	ldstuba	[%i2+%g0]0x89,%l2	! %l2 = 000000ff000000ff
!	%f22 = ff004f86 63c94f86, %l0 = 00000000000000ff
!	Mem[0000000010081410] = ff00005a000000ff
	add	%i2,0x010,%g1
	stda	%f22,[%g1+%l0]ASI_PST16_P ! Mem[0000000010081410] = ff004f8663c94f86
!	%f0  = 00000000 00000000 000000ff 00000000
!	%f4  = 00000000 ff000000 000000ff ffffffff
!	%f8  = ff0000ff 00000000 3f000000 000000ff
!	%f12 = 000000ff b6130940 db8bc354 ff0000ff
	stda	%f0,[%i3]ASI_BLK_AIUP	! Block Store to 00000000100c1400
!	Mem[0000000010041400] = ff000000, %l0 = 00000000000000ff, %asi = 80
	swapa	[%i1+0x000]%asi,%l0	! %l0 = 00000000ff000000
!	%l5 = ff0000005a0000ff, Mem[0000000010181434] = ae12becc
	sth	%l5,[%i6+0x034]		! Mem[0000000010181434] = 00ffbecc
!	Mem[0000000010081410] = ff004f86, %l2 = 00000000000000ff
	ldstuba	[%i2+%o5]0x80,%l2	! %l2 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101430] = 0000003f, %l4 = 00000000000000ff
	ldsha	[%i4+0x030]%asi,%l4	! %l4 = 0000000000000000

p0_label_363:
!	Mem[0000000010081434] = ffffffff, %l2 = 00000000000000ff
	ldsba	[%i2+0x036]%asi,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000030101408] = ff004f86, %l4 = 0000000000000000
	lduba	[%i4+%o4]0x81,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030001400] = ff4fc963, %l7 = 00000000000018ff
	ldswa	[%i0+%g0]0x81,%l7	! %l7 = ffffffffff4fc963
!	Mem[0000000030001410] = 18000000, %l6 = 00000000ff000000
	ldsha	[%i0+%o5]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000030141400] = 00000000ffffffff, %f18 = ff000000 0000003f
	ldda	[%i5+%g0]0x89,%f18	! %f18 = 00000000 ffffffff
!	Mem[0000000010001408] = 000000ffff180000, %l4 = 00000000000000ff
	ldxa	[%i0+%o4]0x80,%l4	! %l4 = 000000ffff180000
	membar	#Sync			! Added by membar checker (73)
!	Mem[00000000100c1400] = 00000000, %l2 = ffffffffffffffff
	lduba	[%i3+0x003]%asi,%l2	! %l2 = 0000000000000000
!	Mem[0000000030001408] = 0000000000ffffff, %f30 = ff00005a 864fc963
	ldda	[%i0+%o4]0x89,%f30	! %f30 = 00000000 00ffffff
!	Mem[0000000010001408] = 000000ffff180000, %l2 = 0000000000000000
	ldxa	[%i0+%o4]0x80,%l2	! %l2 = 000000ffff180000
!	Starting 10 instruction Store Burst
!	%f16 = 005a005a ffffffff, %l0 = 00000000ff000000
!	Mem[0000000030101420] = 400913b6ff000000
	add	%i4,0x020,%g1
	stda	%f16,[%g1+%l0]ASI_PST16_SL ! Mem[0000000030101420] = 400913b6ff000000

p0_label_364:
!	%l6 = 00000000, %l7 = ff4fc963, Mem[0000000010181408] = ff310000 000000ff
	stda	%l6,[%i6+%o4]0x80	! Mem[0000000010181408] = 00000000 ff4fc963
!	Mem[0000000030101410] = 00000000, %l1 = 0000000000000000
	ldstuba	[%i4+%o5]0x89,%l1	! %l1 = 00000000000000ff
!	%f8  = ff0000ff 00000000, Mem[0000000010101428] = 00000000 ff00ff00
	std	%f8 ,[%i4+0x028]	! Mem[0000000010101428] = ff0000ff 00000000
!	%l0 = ff000000, %l1 = 00000000, Mem[0000000010141408] = dc003118 ffffffff
	stda	%l0,[%i5+%o4]0x88	! Mem[0000000010141408] = ff000000 00000000
!	Mem[0000000030041400] = ff0000ff, %l3 = 0000001800000000
	swapa	[%i1+%g0]0x81,%l3	! %l3 = 00000000ff0000ff
!	%l3 = 00000000ff0000ff, Mem[0000000010041408] = ff000000, %asi = 80
	stwa	%l3,[%i1+0x008]%asi	! Mem[0000000010041408] = ff0000ff
!	%f18 = 00000000, Mem[000000001004140c] = 00000000
	sta	%f18,[%i1+0x00c]%asi	! Mem[000000001004140c] = 00000000
!	%f8  = ff0000ff 00000000, Mem[0000000010141430] = 00000000 00000086
	std	%f8 ,[%i5+0x030]	! Mem[0000000010141430] = ff0000ff 00000000
!	%l6 = 0000000000000000, Mem[0000000030041408] = ff000000
	stba	%l6,[%i1+%o4]0x89	! Mem[0000000030041408] = ff000000
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1428] = 3f000000, %f18 = 00000000
	ld	[%i3+0x028],%f18	! %f18 = 3f000000

p0_label_365:
!	Mem[0000000010101410] = ff0000ff, %l7 = ffffffffff4fc963
	lduwa	[%i4+%o5]0x80,%l7	! %l7 = 00000000ff0000ff
!	Mem[0000000010141408] = 000000ff00000000, %f24 = ffffffff ff000000
	ldda	[%i5+%o4]0x80,%f24	! %f24 = 000000ff 00000000
!	Mem[0000000010101400] = 5a0000ff, %l2 = 000000ffff180000
	lduba	[%i4+0x001]%asi,%l2	! %l2 = 0000000000000000
!	Mem[0000000020800040] = ffffac70, %l6 = 0000000000000000
	ldsh	[%o1+0x040],%l6		! %l6 = ffffffffffffffff
!	Mem[0000000030001408] = 00ffffff, %l7 = 00000000ff0000ff
	lduba	[%i0+%o4]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[00000000100c1410] = 00000000, %l2 = 0000000000000000
	ldsha	[%i3+%o5]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000010041428] = ff000000, %l2 = 0000000000000000
	ldub	[%i1+0x02a],%l2		! %l2 = 0000000000000000
!	Mem[00000000300c1400] = ffffffff, %l5 = ff0000005a0000ff
	ldswa	[%i3+%g0]0x81,%l5	! %l5 = ffffffffffffffff
!	Mem[000000001004143c] = 183170b9, %l7 = 00000000000000ff
	lduba	[%i1+0x03c]%asi,%l7	! %l7 = 0000000000000018
!	Starting 10 instruction Store Burst
!	%f2  = 000000ff 00000000, Mem[0000000030181410] = ff0000ff 00000000
	stda	%f2 ,[%i6+%o5]0x81	! Mem[0000000030181410] = 000000ff 00000000

!	Check Point 73 for processor 0

	set	p0_check_pt_data_73,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l1,%g2			! %l1 = 0000000000000000
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l2,%g2			! %l2 = 0000000000000000
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l3,%g2			! %l3 = 00000000ff0000ff
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l4,%g2			! %l4 = 000000ffff180000
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l5,%g2			! %l5 = ffffffffffffffff
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l6,%g2			! %l6 = ffffffffffffffff
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l7,%g2			! %l7 = 0000000000000018
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x40],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 000000ff ffffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x48],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = 3f000000 ffffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1
	ldx	[%g4+0x50],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = 000000ff 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1
	ldx	[%g4+0x58],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = 00000000 00ffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 73 completed


p0_label_366:
!	%l0 = ff000000, %l1 = 00000000, Mem[0000000010081410] = 864f00ff 864fc963
	stda	%l0,[%i2+%o5]0x88	! Mem[0000000010081410] = ff000000 00000000
!	Mem[0000000030141400] = ffffffff, %l2 = 0000000000000000
	swapa	[%i5+%g0]0x81,%l2	! %l2 = 00000000ffffffff
!	%l4 = 000000ffff180000, Mem[0000000010101400] = 5a0000ffffffffff, %asi = 80
	stxa	%l4,[%i4+0x000]%asi	! Mem[0000000010101400] = 000000ffff180000
!	%l2 = 00000000ffffffff, Mem[0000000030101410] = ff00000000000000
	stxa	%l2,[%i4+%o5]0x81	! Mem[0000000030101410] = 00000000ffffffff
!	%l6 = ffffffff, %l7 = 00000018, Mem[0000000010081400] = 000000ff 00000000
	stda	%l6,[%i2+%g0]0x80	! Mem[0000000010081400] = ffffffff 00000018
!	%l2 = 00000000ffffffff, Mem[0000000010101410] = ff0000ff
	stwa	%l2,[%i4+%o5]0x80	! Mem[0000000010101410] = ffffffff
!	%f20 = ffffffff 183100dc, %l2 = 00000000ffffffff
!	Mem[0000000030101410] = 00000000ffffffff
	add	%i4,0x010,%g1
	stda	%f20,[%g1+%l2]ASI_PST16_SL ! Mem[0000000030101410] = dc003118ffffffff
!	%f14 = db8bc354 ff0000ff, %l7 = 0000000000000018
!	Mem[00000000100c1420] = ff0000ff00000000
	add	%i3,0x020,%g1
	stda	%f14,[%g1+%l7]ASI_PST32_PL ! Mem[00000000100c1420] = ff0000ff00000000
!	%f11 = 000000ff, Mem[0000000010181408] = 00000000
	sta	%f11,[%i6+%o4]0x80	! Mem[0000000010181408] = 000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = 000000ff 00000000, %l4 = ff180000, %l5 = ffffffff
	ldda	[%i3+%o4]0x80,%l4	! %l4 = 00000000000000ff 0000000000000000

p0_label_367:
!	Mem[0000000010181430] = db8bc3ff 00ffbecc, %l0 = ff000000, %l1 = 00000000
	ldd	[%i6+0x030],%l0		! %l0 = 00000000db8bc3ff 0000000000ffbecc
!	Mem[0000000010041434] = ffffffff, %l5 = 0000000000000000
	ldsb	[%i1+0x037],%l5		! %l5 = ffffffffffffffff
!	Mem[0000000030181400] = 0000000000000000, %l2 = 00000000ffffffff
	ldxa	[%i6+%g0]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000010041408] = 00000000ff0000ff, %f8  = ff0000ff 00000000
	ldda	[%i1+%o4]0x88,%f8 	! %f8  = 00000000 ff0000ff
!	Mem[0000000010001400] = ff0000ff 000018ff, %l4 = 000000ff, %l5 = ffffffff
	ldda	[%i0+%g0]0x80,%l4	! %l4 = 00000000ff0000ff 00000000000018ff
!	Mem[000000001010141c] = 00000000, %l5 = 00000000000018ff
	lduw	[%i4+0x01c],%l5		! %l5 = 0000000000000000
!	Mem[0000000010001430] = ffc94fff00000000, %l2 = 0000000000000000
	ldx	[%i0+0x030],%l2		! %l2 = ffc94fff00000000
!	Mem[0000000010181420] = 00ffffff 000000ff, %l6 = ffffffff, %l7 = 00000018
	ldd	[%i6+0x020],%l6		! %l6 = 0000000000ffffff 00000000000000ff
!	Mem[0000000030041408] = 000000ff, %l3 = 00000000ff0000ff
	ldswa	[%i1+%o4]0x81,%l3	! %l3 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l2 = ffc94fff00000000, Mem[0000000030081400] = ff00000063c94f86
	stxa	%l2,[%i2+%g0]0x81	! Mem[0000000030081400] = ffc94fff00000000

p0_label_368:
!	%f16 = 005a005a ffffffff 3f000000 ffffffff
!	%f20 = ffffffff 183100dc ff004f86 63c94f86
!	%f24 = 000000ff 00000000 ff000000 003100dc
!	%f28 = 00000018 00000000 00000000 00ffffff
	stda	%f16,[%i3]ASI_COMMIT_P	! Block Store to 00000000100c1400
!	%l1 = 0000000000ffbecc, Mem[0000000010041408] = ff0000ff
	stba	%l1,[%i1+%o4]0x88	! Mem[0000000010041408] = ff0000cc
!	%l7 = 00000000000000ff, Mem[0000000030101408] = 864f00ff
	stha	%l7,[%i4+%o4]0x89	! Mem[0000000030101408] = 864f00ff
!	Mem[00000000211c0000] = 18ff7bbb, %l4 = 00000000ff0000ff
	ldstuba	[%o2+0x000]%asi,%l4	! %l4 = 00000018000000ff
!	Mem[0000000010181404] = 000009ff, %l3 = 00000000000000ff, %asi = 80
	swapa	[%i6+0x004]%asi,%l3	! %l3 = 00000000000009ff
!	%f16 = 005a005a ffffffff 3f000000 ffffffff
!	%f20 = ffffffff 183100dc ff004f86 63c94f86
!	%f24 = 000000ff 00000000 ff000000 003100dc
!	%f28 = 00000018 00000000 00000000 00ffffff
	stda	%f16,[%i6]ASI_COMMIT_S	! Block Store to 0000000030181400
!	%f8  = 00000000 ff0000ff, Mem[0000000030101410] = dc003118 ffffffff
	stda	%f8 ,[%i4+%o5]0x81	! Mem[0000000030101410] = 00000000 ff0000ff
!	%f10 = 3f000000 000000ff, Mem[0000000010001400] = ff0000ff 000018ff
	stda	%f10,[%i0+%g0]0x80	! Mem[0000000010001400] = 3f000000 000000ff
	membar	#Sync			! Added by membar checker (74)
!	Mem[0000000030181408] = 0000003f, %l6 = 0000000000ffffff
	ldstuba	[%i6+%o4]0x89,%l6	! %l6 = 0000003f000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = ffffffff dc0031ff, %l6 = 0000003f, %l7 = 000000ff
	ldda	[%i3+%o4]0x89,%l6	! %l6 = 00000000dc0031ff 00000000ffffffff

p0_label_369:
!	Mem[00000000100c1400] = 005a005a ffffffff, %l0 = db8bc3ff, %l1 = 00ffbecc
	ldda	[%i3+%g0]0x80,%l0	! %l0 = 00000000005a005a 00000000ffffffff
!	Mem[0000000010141400] = 00ffffff 000000ff 000000ff 00000000
!	Mem[0000000010141410] = ffffffff 5a005a00 00000000 ffffffff
!	Mem[0000000010141420] = ff00005a 864fc963 c3540000 00000000
!	Mem[0000000010141430] = ff0000ff 00000000 a96e6a5a ff000000
	ldda	[%i5]ASI_BLK_P,%f16	! Block Load from 0000000010141400
!	Mem[0000000020800000] = 00ff7d94, %l5 = 0000000000000000
	lduh	[%o1+%g0],%l5		! %l5 = 00000000000000ff
!	Mem[0000000010181408] = 000000ff, %l6 = 00000000dc0031ff
	ldsha	[%i6+%o4]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000030041408] = 183100dcff000000, %l1 = 00000000ffffffff
	ldxa	[%i1+%o4]0x89,%l1	! %l1 = 183100dcff000000
!	Mem[0000000010181410] = ffffffff, %l1 = 183100dcff000000
	lduha	[%i6+%o5]0x88,%l1	! %l1 = 000000000000ffff
!	Mem[0000000030081408] = ff000000, %l5 = 00000000000000ff
	ldswa	[%i2+%o4]0x81,%l5	! %l5 = ffffffffff000000
!	Mem[0000000010041408] = 00000000ff0000cc, %f12 = 000000ff b6130940
	ldda	[%i1+%o4]0x88,%f12	! %f12 = 00000000 ff0000cc
!	Mem[0000000010081434] = ffffffff, %l5 = ffffffffff000000
	ldsba	[%i2+0x035]%asi,%l5	! %l5 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l2 = 00000000, %l3 = 000009ff, Mem[0000000030041400] = 00000000 00000000
	stda	%l2,[%i1+%g0]0x89	! Mem[0000000030041400] = 00000000 000009ff

p0_label_370:
!	%l4 = 00000018, %l5 = ffffffff, Mem[00000000100c1400] = 5a005a00 ffffffff
	stda	%l4,[%i3+%g0]0x88	! Mem[00000000100c1400] = 00000018 ffffffff
!	Mem[0000000030001410] = 00000018, %l3 = 00000000000009ff
	swapa	[%i0+%o5]0x81,%l3	! %l3 = 0000000000000018
!	%l4 = 0000000000000018, Mem[0000000010041410] = 86000000
	stba	%l4,[%i1+%o5]0x80	! Mem[0000000010041410] = 18000000
!	%f14 = db8bc354 ff0000ff, %l7 = 00000000ffffffff
!	Mem[0000000030041410] = ff4fc9ff864fc9ff
	add	%i1,0x010,%g1
	stda	%f14,[%g1+%l7]ASI_PST32_S ! Mem[0000000030041410] = db8bc354ff0000ff
!	Mem[00000000211c0001] = ffff7bbb, %l5 = ffffffffffffffff
	ldstub	[%o2+0x001],%l5		! %l5 = 000000ff000000ff
!	Mem[0000000030101408] = ff004f86, %l7 = 00000000ffffffff
	swapa	[%i4+%o4]0x81,%l7	! %l7 = 00000000ff004f86
!	Mem[0000000010141420] = ff00005a, %l3 = 0000000000000018, %asi = 80
	swapa	[%i5+0x020]%asi,%l3	! %l3 = 00000000ff00005a
!	%f2  = 000000ff 00000000, Mem[0000000010081410] = ff000000 00000000
	stda	%f2 ,[%i2+%o5]0x88	! Mem[0000000010081410] = 000000ff 00000000
!	%f6  = 000000ff ffffffff, %l0 = 00000000005a005a
!	Mem[0000000030081420] = 400913b6ff000000
	add	%i2,0x020,%g1
	stda	%f6,[%g1+%l0]ASI_PST8_S ! Mem[0000000030081420] = 400013ffff00ff00
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = cc0000ff, %l6 = 0000000000000000
	lduha	[%i1+%o4]0x80,%l6	! %l6 = 000000000000cc00

!	Check Point 74 for processor 0

	set	p0_check_pt_data_74,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l1,%g2			! %l1 = 000000000000ffff
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l2,%g2			! %l2 = ffc94fff00000000
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l3,%g2			! %l3 = 00000000ff00005a
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l4,%g2			! %l4 = 0000000000000018
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l5,%g2			! %l5 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l6,%g2			! %l6 = 000000000000cc00
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x38],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = 00000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x40],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 00000000 ff000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x48],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 000000ff ffffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x50],%g3
	std	%f8,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f8 = 00000000 ff0000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf08,%g1
	ldx	[%g4+0x58],%g3
	std	%f12,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f12 = 00000000 ff0000cc
	bne	%xcc,p0_freg_check_fail
	mov	0xf12,%g1
	ldx	[%g4+0x60],%g3
	std	%f16,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f16 = 00ffffff 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf16,%g1
	ldx	[%g4+0x68],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = 000000ff 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1
	ldx	[%g4+0x70],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = ffffffff 5a005a00
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1
	ldx	[%g4+0x78],%g3
	std	%f22,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f22 = 00000000 ffffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf22,%g1
	ldx	[%g4+0x80],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = ff00005a 864fc963
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1
	ldx	[%g4+0x88],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = c3540000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1
	ldx	[%g4+0x90],%g3
	std	%f28,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f28 = ff0000ff 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf28,%g1
	ldx	[%g4+0x98],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = a96e6a5a ff000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 74 completed


p0_label_371:
!	Mem[00000000100c1408] = ffffffff0000003f, %f6  = 000000ff ffffffff
	ldda	[%i3+%o4]0x88,%f6 	! %f6  = ffffffff 0000003f
!	%l0 = 00000000005a005a, immed = fffffd69, %y  = 000000fe
	smul	%l0,-0x297,%l1		! %l1 = ffffffff16e916ea, %y = ffffffff
!	Mem[0000000030001408] = 00ffffff, %l3 = 00000000ff00005a
	ldsba	[%i0+%o4]0x89,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000030101410] = 00000000, %l2 = ffc94fff00000000
	lduha	[%i4+%o5]0x81,%l2	! %l2 = 0000000000000000
	membar	#Sync			! Added by membar checker (75)
!	Mem[0000000010141400] = 00ffffff 000000ff 000000ff 00000000
!	Mem[0000000010141410] = ffffffff 5a005a00 00000000 ffffffff
!	Mem[0000000010141420] = 00000018 864fc963 c3540000 00000000
!	Mem[0000000010141430] = ff0000ff 00000000 a96e6a5a ff000000
	ldda	[%i5]ASI_BLK_PL,%f16	! Block Load from 0000000010141400
!	Mem[0000000010141408] = ff000000, %l5 = 00000000000000ff
	ldswa	[%i5+%o4]0x88,%l5	! %l5 = ffffffffff000000
!	Mem[0000000010101410] = ffffffff, %l0 = 00000000005a005a
	ldsha	[%i4+0x012]%asi,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000030081410] = 000000ff, %l7 = 00000000ff004f86
	lduwa	[%i2+%o5]0x81,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010101400] = ff000000, %f3  = 00000000
	lda	[%i4+%g0]0x88,%f3 	! %f3 = ff000000
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (76)
!	%l4 = 0000000000000018, Mem[0000000010141408] = 00000000ff000000
	stxa	%l4,[%i5+%o4]0x88	! Mem[0000000010141408] = 0000000000000018

p0_label_372:
!	Mem[0000000030041408] = ff000000, %l2 = 0000000000000000
	ldstuba	[%i1+%o4]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[000000001010142c] = 00000000, %l3 = ffffffff, %l5 = ff000000
	add	%i4,0x2c,%g1
	casa	[%g1]0x80,%l3,%l5	! %l5 = 0000000000000000
!	Mem[0000000010141418] = 00000000ffffffff, %l1 = ffffffff16e916ea, %l3 = ffffffffffffffff
	add	%i5,0x18,%g1
	casxa	[%g1]0x80,%l1,%l3	! %l3 = 00000000ffffffff
!	Mem[0000000020800041] = ffffac70, %l7 = 00000000000000ff
	ldstuba	[%o1+0x041]%asi,%l7	! %l7 = 000000ff000000ff
!	%l5 = 0000000000000000, Mem[00000000300c1408] = ff3100dc
	stha	%l5,[%i3+%o4]0x81	! Mem[00000000300c1408] = 000000dc
!	Mem[0000000030081408] = 000000ff, %l7 = 00000000000000ff
	ldstuba	[%i2+%o4]0x89,%l7	! %l7 = 000000ff000000ff
!	%l0 = ffffffffffffffff, Mem[0000000030141408] = ffffffff
	stba	%l0,[%i5+%o4]0x81	! Mem[0000000030141408] = ffffffff
!	Mem[0000000030101408] = ffffffff, %l3 = 00000000ffffffff
	swapa	[%i4+%o4]0x89,%l3	! %l3 = 00000000ffffffff
!	%l7 = 00000000000000ff, Mem[0000000030081400] = ffc94fff00000000
	stxa	%l7,[%i2+%g0]0x81	! Mem[0000000030081400] = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000021800040] = 0000b2d9, %l0 = ffffffffffffffff
	ldsb	[%o3+0x040],%l0		! %l0 = 0000000000000000

p0_label_373:
!	Mem[0000000010041408] = cc0000ff, %l1 = ffffffff16e916ea
	ldsba	[%i1+%o4]0x80,%l1	! %l1 = ffffffffffffffcc
!	Mem[00000000300c1408] = dc000000, %l7 = 00000000000000ff
	ldsba	[%i3+%o4]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000010101400] = 000000ff ff180000, %l2 = 00000000, %l3 = ffffffff
	ldda	[%i4+%g0]0x80,%l2	! %l2 = 00000000000000ff 00000000ff180000
!	Mem[0000000021800080] = ffffd5df, %l3 = 00000000ff180000
	ldsh	[%o3+0x080],%l3		! %l3 = ffffffffffffffff
!	Mem[00000000100c1414] = 183100dc, %l0 = 0000000000000000
	lduh	[%i3+0x016],%l0		! %l0 = 00000000000000dc
!	Mem[0000000010101410] = ffffffff, %l0 = 00000000000000dc
	ldsha	[%i4+%o5]0x80,%l0	! %l0 = ffffffffffffffff
!	Mem[00000000201c0000] = ffffaf65, %l5 = 0000000000000000
	ldsb	[%o0+%g0],%l5		! %l5 = ffffffffffffffff
!	Mem[0000000030101410] = ff0000ff00000000, %f10 = 3f000000 000000ff
	ldda	[%i4+%o5]0x89,%f10	! %f10 = ff0000ff 00000000
!	Mem[0000000030141408] = dc003118ffffffff, %l6 = 000000000000cc00
	ldxa	[%i5+%o4]0x89,%l6	! %l6 = dc003118ffffffff
!	Starting 10 instruction Store Burst
!	%f12 = 00000000, Mem[000000001004143c] = 183170b9
	st	%f12,[%i1+0x03c]	! Mem[000000001004143c] = 00000000

p0_label_374:
!	%l1 = ffffffffffffffcc, Mem[0000000010181408] = 000000ff
	stba	%l1,[%i6+%o4]0x80	! Mem[0000000010181408] = cc0000ff
!	Mem[0000000030141400] = 00000000, %l5 = ffffffffffffffff
	swapa	[%i5+%g0]0x81,%l5	! %l5 = 0000000000000000
!	%l6 = ffffffff, %l7 = 00000000, Mem[0000000030081408] = ff000000 000000ff
	stda	%l6,[%i2+%o4]0x81	! Mem[0000000030081408] = ffffffff 00000000
!	%l1 = ffffffffffffffcc, Mem[0000000010101400] = 000000ff
	stha	%l1,[%i4+%g0]0x80	! Mem[0000000010101400] = ffcc00ff
!	Mem[0000000010001408] = 000000ff, %l4 = 0000000000000018
	ldstuba	[%i0+%o4]0x80,%l4	! %l4 = 00000000000000ff
!	%l0 = ffffffffffffffff, Mem[0000000010041404] = 00000000, %asi = 80
	stha	%l0,[%i1+0x004]%asi	! Mem[0000000010041404] = ffff0000
!	%l1 = ffffffffffffffcc, Mem[0000000030141408] = ffffffff
	stha	%l1,[%i5+%o4]0x89	! Mem[0000000030141408] = ffffffcc
!	Mem[0000000010101410] = ffffffff00000000, %l4 = 0000000000000000, %l3 = ffffffffffffffff
	add	%i4,0x10,%g1
	casxa	[%g1]0x80,%l4,%l3	! %l3 = ffffffff00000000
!	%l5 = 0000000000000000, Mem[0000000010081408] = 864fc963, %asi = 80
	stba	%l5,[%i2+0x008]%asi	! Mem[0000000010081408] = 004fc963
!	Starting 10 instruction Load Burst
!	Mem[0000000020800000] = 00ff7d94, %l4 = 0000000000000000
	ldsha	[%o1+0x000]%asi,%l4	! %l4 = 00000000000000ff

p0_label_375:
!	Mem[00000000100c1410] = ffffffff, %l6 = dc003118ffffffff
	lduba	[%i3+%o5]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010101410] = ffffffff00000000, %f14 = db8bc354 ff0000ff
	ldda	[%i4+%o5]0x80,%f14	! %f14 = ffffffff 00000000
!	Mem[0000000030041408] = ff0000ff dc003118, %l0 = ffffffff, %l1 = ffffffcc
	ldda	[%i1+%o4]0x81,%l0	! %l0 = 00000000ff0000ff 00000000dc003118
!	Mem[0000000010101400] = ff00ccff, %l7 = 0000000000000000
	lduba	[%i4+%g0]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[00000000300c1408] = dc000000, %l6 = 00000000000000ff
	ldsba	[%i3+%o4]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000010141400] = 00ffffff, %l2 = 00000000000000ff
	lduba	[%i5+%g0]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000010141410] = ffffffff, %l4 = 00000000000000ff
	ldsba	[%i5+%o5]0x88,%l4	! %l4 = ffffffffffffffff
!	%l1 = 00000000dc003118, Mem[0000000010041400] = 0000ffffff000000
	stxa	%l1,[%i1+%g0]0x88	! Mem[0000000010041400] = 00000000dc003118
!	Mem[0000000030041408] = ff0000ff, %l0 = 00000000ff0000ff
	lduba	[%i1+%o4]0x89,%l0	! %l0 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l3 = ffffffff00000000, Mem[0000000030081408] = ffffffff
	stba	%l3,[%i2+%o4]0x81	! Mem[0000000030081408] = 00ffffff

!	Check Point 75 for processor 0

	set	p0_check_pt_data_75,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 00000000dc003118
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 0000000000000000
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = ffffffff00000000
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = ffffffffffffffff
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 0000000000000000
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 0000000000000000
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = 00000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x50],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = 000000ff ff000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x58],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = ffffffff 0000003f
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x60],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = ff0000ff 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x68],%g3
	std	%f14,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f14 = ffffffff 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf14,%g1
	ldx	[%g4+0x70],%g3
	std	%f16,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f16 = ff000000 ffffff00
	bne	%xcc,p0_freg_check_fail
	mov	0xf16,%g1
	ldx	[%g4+0x78],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = 00000000 ff000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1
	ldx	[%g4+0x80],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = 005a005a ffffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1
	ldx	[%g4+0x88],%g3
	std	%f22,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f22 = ffffffff 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf22,%g1
	ldx	[%g4+0x90],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = 63c94f86 18000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1
	ldx	[%g4+0x98],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = 00000000 000054c3
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1
	ldx	[%g4+0xa0],%g3
	std	%f28,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f28 = 00000000 ff0000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf28,%g1
	ldx	[%g4+0xa8],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = 000000ff 5a6a6ea9
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 75 completed


p0_label_376:
!	Mem[0000000010081408] = 004fc963, %l7 = 00000000000000ff
	swap	[%i2+%o4],%l7		! %l7 = 00000000004fc963
!	Mem[0000000010081420] = 0000ffa5, %l2 = 0000000000000000
	ldstub	[%i2+0x020],%l2		! %l2 = 00000000000000ff
!	Mem[0000000010001400] = 3f000000, %l0 = 00000000000000ff
	ldstuba	[%i0+%g0]0x80,%l0	! %l0 = 0000003f000000ff
!	%l6 = 0000000000000000, Mem[0000000010041408] = 00000000ff0000cc
	stxa	%l6,[%i1+%o4]0x88	! Mem[0000000010041408] = 0000000000000000
!	%l1 = 00000000dc003118, Mem[00000000300c1408] = dc000000
	stwa	%l1,[%i3+%o4]0x89	! Mem[00000000300c1408] = dc003118
!	%f28 = 00000000 ff0000ff, Mem[0000000030101408] = ffffffff 63c94f86
	stda	%f28,[%i4+%o4]0x81	! Mem[0000000030101408] = 00000000 ff0000ff
!	%l4 = ffffffff, %l5 = 00000000, Mem[0000000030181410] = ffffffff 183100dc
	stda	%l4,[%i6+%o5]0x81	! Mem[0000000030181410] = ffffffff 00000000
!	%l0 = 0000003f, %l1 = dc003118, Mem[0000000030141400] = ffffffff 00000000
	stda	%l0,[%i5+%g0]0x89	! Mem[0000000030141400] = 0000003f dc003118
!	Mem[0000000010181408] = ff0000cc, %l0 = 000000000000003f
	ldstuba	[%i6+%o4]0x88,%l0	! %l0 = 000000cc000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = ff0000ff, %f14 = ffffffff
	lda	[%i1+%o4]0x81,%f14	! %f14 = ff0000ff

p0_label_377:
!	Mem[0000000030081408] = ffffff00, %l3 = ffffffff00000000
	ldsba	[%i2+%o4]0x89,%l3	! %l3 = 0000000000000000
!	%l3 = 0000000000000000, immed = 00000929, %y  = ffffffff
	udiv	%l3,0x929,%l7		! %l7 = 00000000ffffffff
	mov	%l0,%y			! %y = 000000cc
!	Mem[0000000010101408] = 000000ffb6130940, %f26 = 00000000 000054c3
	ldda	[%i4+%o4]0x80,%f26	! %f26 = 000000ff b6130940
!	Mem[0000000030001400] = 63c94fff, %l6 = 0000000000000000
	lduwa	[%i0+%g0]0x89,%l6	! %l6 = 0000000063c94fff
!	Mem[0000000010141410] = ffffffff5a005a00, %l6 = 0000000063c94fff
	ldxa	[%i5+%o5]0x80,%l6	! %l6 = ffffffff5a005a00
!	Mem[0000000030041400] = 00000000, %l4 = ffffffffffffffff
	ldsba	[%i1+%g0]0x81,%l4	! %l4 = 0000000000000000
!	Mem[00000000100c1408] = 3f000000, %l1 = 00000000dc003118
	lduwa	[%i3+0x008]%asi,%l1	! %l1 = 000000003f000000
!	Mem[0000000030041410] = db8bc354ff0000ff, %l7 = 00000000ffffffff
	ldxa	[%i1+%o5]0x81,%l7	! %l7 = db8bc354ff0000ff
!	Mem[0000000010141408] = 18000000, %f23 = 00000000
	lda	[%i5+%o4]0x80,%f23	! %f23 = 18000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010041400] = 183100dc, %l3 = 0000000000000000
	swapa	[%i1+%g0]0x80,%l3	! %l3 = 00000000183100dc

p0_label_378:
!	Mem[0000000010081410] = 00000000ff000000, %l5 = 0000000000000000, %l0 = 00000000000000cc
	add	%i2,0x10,%g1
	casxa	[%g1]0x80,%l5,%l0	! %l0 = 00000000ff000000
!	Mem[00000000100c1410] = ffffffff, %l1 = 000000003f000000
	swapa	[%i3+%o5]0x80,%l1	! %l1 = 00000000ffffffff
!	%l0 = 00000000ff000000, Mem[0000000030081410] = 000000ff
	stba	%l0,[%i2+%o5]0x81	! Mem[0000000030081410] = 000000ff
!	%l0 = 00000000ff000000, Mem[0000000030081400] = 00000000
	stwa	%l0,[%i2+%g0]0x89	! Mem[0000000030081400] = ff000000
!	Mem[00000000100c1408] = 3f000000, %l2 = 0000000000000000
	swapa	[%i3+%o4]0x80,%l2	! %l2 = 000000003f000000
!	Mem[00000000211c0000] = ffff7bbb, %l3 = 00000000183100dc
	ldstub	[%o2+%g0],%l3		! %l3 = 000000ff000000ff
!	Mem[000000001014141c] = ffffffff, %l3 = 000000ff, %l4 = 00000000
	add	%i5,0x1c,%g1
	casa	[%g1]0x80,%l3,%l4	! %l4 = 00000000ffffffff
!	Mem[0000000010041400] = 00000000, %l7 = db8bc354ff0000ff, %asi = 80
	swapa	[%i1+0x000]%asi,%l7	! %l7 = 0000000000000000
!	%l6 = ffffffff5a005a00, Mem[0000000030041408] = ff0000ff
	stwa	%l6,[%i1+%o4]0x81	! Mem[0000000030041408] = 5a005a00
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (77)
!	Mem[0000000010001400] = ff000000 000000ff ff0000ff ff180000
!	Mem[0000000010001410] = ff004f86 63c94f86 ccbe12ae ffffffff
!	Mem[0000000010001420] = 400913b6 ff0000ff 54c38bdb ffff00ff
!	Mem[0000000010001430] = ffc94fff 00000000 63c94f86 5a0000ff
	ldda	[%i0]ASI_BLK_PL,%f16	! Block Load from 0000000010001400

p0_label_379:
!	Mem[0000000030101408] = 00000000, %l4 = 00000000ffffffff
	ldsba	[%i4+%o4]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000010001400] = ff000000000000ff, %f4  = 00000000 ff000000
	ldda	[%i0+%g0]0x88,%f4 	! %f4  = ff000000 000000ff
!	Mem[0000000010001400] = ff000000 000000ff ff0000ff ff180000
!	Mem[0000000010001410] = ff004f86 63c94f86 ccbe12ae ffffffff
!	Mem[0000000010001420] = 400913b6 ff0000ff 54c38bdb ffff00ff
!	Mem[0000000010001430] = ffc94fff 00000000 63c94f86 5a0000ff
	ldda	[%i0]ASI_BLK_AIUPL,%f16	! Block Load from 0000000010001400
!	Mem[0000000030041408] = 005a005a, %l1 = 00000000ffffffff
	ldswa	[%i1+%o4]0x89,%l1	! %l1 = 00000000005a005a
!	Mem[00000000100c1408] = 00000000 ffffffff, %l6 = 5a005a00, %l7 = 00000000
	ldda	[%i3+0x008]%asi,%l6	! %l6 = 0000000000000000 00000000ffffffff
!	Mem[0000000030141410] = ff000000ff000000, %f14 = ff0000ff 00000000
	ldda	[%i5+%o5]0x89,%f14	! %f14 = ff000000 ff000000
!	Mem[0000000010081414] = ff000000, %f11 = 00000000
	lda	[%i2+0x014]%asi,%f11	! %f11 = ff000000
!	Mem[0000000010141408] = 00000018, %l0 = 00000000ff000000
	ldsha	[%i5+%o4]0x88,%l0	! %l0 = 0000000000000018
!	Mem[0000000010181424] = 000000ff, %l0 = 0000000000000018
	ldub	[%i6+0x024],%l0		! %l0 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l7 = 00000000ffffffff, Mem[000000001014141d] = ffffffff
	stb	%l7,[%i5+0x01d]		! Mem[000000001014141c] = ffffffff

p0_label_380:
!	Mem[0000000010141400] = 00ffffff, %l2 = 000000003f000000
	ldstuba	[%i5+%g0]0x80,%l2	! %l2 = 00000000000000ff
!	%f0  = 00000000 00000000 000000ff ff000000
!	%f4  = ff000000 000000ff ffffffff 0000003f
!	%f8  = 00000000 ff0000ff ff0000ff ff000000
!	%f12 = 00000000 ff0000cc ff000000 ff000000
	stda	%f0,[%i1]ASI_BLK_AIUS	! Block Store to 0000000030041400
	membar	#Sync			! Added by membar checker (78)
!	Mem[0000000030041400] = 00000000, %l6 = 0000000000000000
	swapa	[%i1+%g0]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000010081400] = ffffffff, %l0 = 0000000000000000
	ldstuba	[%i2+%g0]0x88,%l0	! %l0 = 000000ff000000ff
!	Mem[0000000010141415] = 5a005a00, %l7 = 00000000ffffffff
	ldstuba	[%i5+0x015]%asi,%l7	! %l7 = 00000000000000ff
!	%f4  = ff000000 000000ff, %l6 = 0000000000000000
!	Mem[0000000010141418] = 00000000ffffffff
	add	%i5,0x018,%g1
	stda	%f4,[%g1+%l6]ASI_PST32_P ! Mem[0000000010141418] = 00000000ffffffff
!	%f4  = ff000000 000000ff, Mem[0000000010181408] = ff0000ff 63c94fff
	stda	%f4 ,[%i6+%o4]0x88	! Mem[0000000010181408] = ff000000 000000ff
!	%l1 = 00000000005a005a, Mem[0000000030081410] = ff000000
	stwa	%l1,[%i2+%o5]0x89	! Mem[0000000030081410] = 005a005a
!	%l1 = 00000000005a005a, Mem[0000000030101410] = 00000000
	stha	%l1,[%i4+%o5]0x89	! Mem[0000000030101410] = 0000005a
!	Starting 10 instruction Load Burst
!	Mem[0000000010141404] = 000000ff, %l3 = 00000000000000ff
	lduw	[%i5+0x004],%l3		! %l3 = 00000000000000ff

!	Check Point 76 for processor 0

	set	p0_check_pt_data_76,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 00000000005a005a
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 0000000000000000
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 0000000000000000
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l6,%g2			! %l6 = 0000000000000000
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l7,%g2			! %l7 = 0000000000000000
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x40],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = ff000000 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x48],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = ffffffff 0000003f
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x50],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = ff0000ff ff000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x58],%g3
	std	%f14,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f14 = ff000000 ff000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf14,%g1
	ldx	[%g4+0x60],%g3
	std	%f16,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f16 = ff000000 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf16,%g1
	ldx	[%g4+0x68],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = 000018ff ff0000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1
	ldx	[%g4+0x70],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = 864fc963 864f00ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1
	ldx	[%g4+0x78],%g3
	std	%f22,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f22 = ffffffff ae12becc
	bne	%xcc,p0_freg_check_fail
	mov	0xf22,%g1
	ldx	[%g4+0x80],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = ff0000ff b6130940
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1
	ldx	[%g4+0x88],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = ff00ffff db8bc354
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1
	ldx	[%g4+0x90],%g3
	std	%f28,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f28 = 00000000 ff4fc9ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf28,%g1
	ldx	[%g4+0x98],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = ff00005a 864fc963
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 76 completed


p0_label_381:
!	Mem[0000000030181410] = ffffffff, %l1 = 00000000005a005a
	ldsha	[%i6+%o5]0x89,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000021800180] = 00ff2200, %l2 = 0000000000000000
	ldsh	[%o3+0x180],%l2		! %l2 = 00000000000000ff
!	Mem[00000000300c1400] = ffffffff, %l3 = 00000000000000ff
	lduba	[%i3+%g0]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030041410] = ff000000000000ff, %f24 = ff0000ff b6130940
	ldda	[%i1+%o5]0x89,%f24	! %f24 = ff000000 000000ff
!	Mem[0000000010141408] = 1800000000000000, %f28 = 00000000 ff4fc9ff
	ldd	[%i5+%o4],%f28		! %f28 = 18000000 00000000
!	Mem[0000000030001408] = ffffff00, %l7 = 0000000000000000
	lduha	[%i0+%o4]0x81,%l7	! %l7 = 000000000000ffff
!	Mem[0000000010181400] = 00000000, %l7 = 000000000000ffff
	ldsha	[%i6+%g0]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000030101408] = 00000000, %l5 = 0000000000000000
	lduwa	[%i4+%o4]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000010081408] = ff000000, %l1 = ffffffffffffffff
	ldsba	[%i2+%o4]0x88,%l1	! %l1 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l1 = 0000000000000000, Mem[0000000010101400] = 000018ffff00ccff
	stxa	%l1,[%i4+%g0]0x88	! Mem[0000000010101400] = 0000000000000000

p0_label_382:
!	Mem[0000000010181410] = ffffffff, %l3 = 00000000000000ff
	swapa	[%i6+%o5]0x88,%l3	! %l3 = 00000000ffffffff
!	Mem[0000000030101408] = 00000000, %l1 = 0000000000000000
	swapa	[%i4+%o4]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000010181438] = ff0000ff, %l2 = 00000000000000ff
	swap	[%i6+0x038],%l2		! %l2 = 00000000ff0000ff
!	Mem[00000000100c1425] = 00000000, %l2 = 00000000ff0000ff
	ldstub	[%i3+0x025],%l2		! %l2 = 00000000000000ff
!	Mem[0000000030101408] = 00000000, %l6 = 0000000000000000
	swapa	[%i4+%o4]0x89,%l6	! %l6 = 0000000000000000
!	%f10 = ff0000ff, Mem[0000000030101410] = 0000005a
	sta	%f10,[%i4+%o5]0x89	! Mem[0000000030101410] = ff0000ff
!	Mem[0000000030081410] = 005a005a, %l1 = 0000000000000000
	swapa	[%i2+%o5]0x89,%l1	! %l1 = 00000000005a005a
!	%l4 = 0000000000000000, Mem[00000000211c0000] = ffff7bbb, %asi = 80
	stha	%l4,[%o2+0x000]%asi	! Mem[00000000211c0000] = 00007bbb
!	Mem[00000000100c141c] = 63c94f86, %l1 = 00000000005a005a
	swap	[%i3+0x01c],%l1		! %l1 = 0000000063c94f86
!	Starting 10 instruction Load Burst
!	Mem[0000000010101428] = ff0000ff, %l0 = 00000000000000ff
	ldsh	[%i4+0x02a],%l0		! %l0 = 00000000000000ff

p0_label_383:
!	Mem[0000000030101400] = 00000000, %l1 = 0000000063c94f86
	lduwa	[%i4+%g0]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000030101400] = 00000000, %l1 = 0000000000000000
	ldswa	[%i4+%g0]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000030141410] = 000000ff, %l4 = 0000000000000000
	ldsha	[%i5+%o5]0x81,%l4	! %l4 = 0000000000000000
!	Mem[00000000100c1410] = 3f000000 183100dc, %l2 = 00000000, %l3 = ffffffff
	ldda	[%i3+%o5]0x80,%l2	! %l2 = 000000003f000000 00000000183100dc
!	Mem[0000000010001414] = 63c94f86, %f20 = 864fc963
	ld	[%i0+0x014],%f20	! %f20 = 63c94f86
!	Mem[0000000010001400] = ff000000000000ff, %f4  = ff000000 000000ff
	ldda	[%i0+0x000]%asi,%f4 	! %f4  = ff000000 000000ff
!	Mem[0000000030081410] = 00000000 00000000, %l2 = 3f000000, %l3 = 183100dc
	ldda	[%i2+%o5]0x89,%l2	! %l2 = 0000000000000000 0000000000000000
!	Mem[000000001018140c] = 000000ff, %l6 = 0000000000000000
	lduh	[%i6+0x00e],%l6		! %l6 = 00000000000000ff
!	%l2 = 0000000000000000, Mem[0000000021800100] = ffffb49a, %asi = 80
	stha	%l2,[%o3+0x100]%asi	! Mem[0000000021800100] = 0000b49a
!	Starting 10 instruction Store Burst
!	%l0 = 000000ff, %l1 = 00000000, Mem[0000000030181408] = 000000ff ffffffff
	stda	%l0,[%i6+%o4]0x89	! Mem[0000000030181408] = 000000ff 00000000

p0_label_384:
!	Mem[00000000100c1400] = 00000018, %l6 = 00000000000000ff
	ldstuba	[%i3+%g0]0x88,%l6	! %l6 = 00000018000000ff
!	%l2 = 0000000000000000, Mem[0000000010141410] = ffffffff
	stha	%l2,[%i5+%o5]0x80	! Mem[0000000010141410] = 0000ffff
!	%f2  = 000000ff ff000000, %l4 = 0000000000000000
!	Mem[0000000010041428] = ff00000000000000
	add	%i1,0x028,%g1
	stda	%f2,[%g1+%l4]ASI_PST16_PL ! Mem[0000000010041428] = ff00000000000000
!	%l4 = 00000000, %l5 = 00000000, Mem[0000000010081400] = ffffffff 00000018
	stda	%l4,[%i2+%g0]0x80	! Mem[0000000010081400] = 00000000 00000000
!	Mem[00000000100c141c] = 005a005a, %l4 = 00000000, %l5 = 00000000
	add	%i3,0x1c,%g1
	casa	[%g1]0x80,%l4,%l5	! %l5 = 00000000005a005a
!	%f10 = ff0000ff ff000000, Mem[00000000300c1410] = 00000000 00000086
	stda	%f10,[%i3+%o5]0x89	! Mem[00000000300c1410] = ff0000ff ff000000
!	Mem[0000000010041408] = 00000000, %l3 = 0000000000000000
	ldstuba	[%i1+%o4]0x88,%l3	! %l3 = 00000000000000ff
!	%l4 = 00000000, %l5 = 005a005a, Mem[0000000030101408] = 00000000 ff0000ff
	stda	%l4,[%i4+%o4]0x81	! Mem[0000000030101408] = 00000000 005a005a
!	Mem[0000000010141410] = ffff0000, %l7 = 0000000000000000
	swapa	[%i5+%o5]0x88,%l7	! %l7 = 00000000ffff0000
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = ff000000, %l1 = 0000000000000000
	ldsha	[%i2+%g0]0x89,%l1	! %l1 = 0000000000000000

p0_label_385:
!	Mem[0000000030101400] = 00000000, %l0 = 00000000000000ff
	ldsha	[%i4+%g0]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000010141400] = ffffffff 000000ff, %l0 = 00000000, %l1 = 00000000
	ldda	[%i5+%g0]0x80,%l0	! %l0 = 00000000ffffffff 00000000000000ff
!	Mem[0000000010001408] = ff0000ff, %l7 = 00000000ffff0000
	lduwa	[%i0+%o4]0x88,%l7	! %l7 = 00000000ff0000ff
!	Mem[0000000030181400] = 005a005a, %f11 = ff000000
	lda	[%i6+%g0]0x81,%f11	! %f11 = 005a005a
!	Mem[0000000010101400] = 00000000 00000000, %l6 = 00000018, %l7 = ff0000ff
	ldda	[%i4+%g0]0x88,%l6	! %l6 = 0000000000000000 0000000000000000
!	Mem[0000000010081400] = 00000000, %l7 = 0000000000000000
	ldsha	[%i2+%g0]0x88,%l7	! %l7 = 0000000000000000
!	Mem[00000000201c0000] = ffffaf65, %l0 = 00000000ffffffff
	ldub	[%o0+%g0],%l0		! %l0 = 00000000000000ff
!	Mem[0000000030141400] = 0000003f, %l4 = 0000000000000000
	ldsba	[%i5+%g0]0x89,%l4	! %l4 = 000000000000003f
!	Mem[0000000010041410] = 000000ff00000018, %f24 = ff000000 000000ff
	ldda	[%i1+%o5]0x88,%f24	! %f24 = 000000ff 00000018
!	Starting 10 instruction Store Burst
!	%f6  = ffffffff, Mem[0000000030041408] = ff000000
	sta	%f6 ,[%i1+%o4]0x89	! Mem[0000000030041408] = ffffffff

!	Check Point 77 for processor 0

	set	p0_check_pt_data_77,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 0000000000000000
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 0000000000000000
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 000000000000003f
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 00000000005a005a
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 0000000000000000
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 0000000000000000
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = 00000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x50],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = 000000ff ff000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x58],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = ff000000 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x60],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = ffffffff 0000003f
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x68],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = ff0000ff 005a005a
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x70],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = 63c94f86 864f00ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1
	ldx	[%g4+0x78],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = 000000ff 00000018
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1
	ldx	[%g4+0x80],%g3
	std	%f28,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f28 = 18000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf28,%g1

!	Check Point 77 completed


p0_label_386:
!	Mem[0000000030141400] = 3f000000, %l2 = 0000000000000000
	swapa	[%i5+%g0]0x81,%l2	! %l2 = 000000003f000000
!	%l0 = 00000000000000ff, Mem[0000000010081400] = 0000000000000000
	stxa	%l0,[%i2+%g0]0x80	! Mem[0000000010081400] = 00000000000000ff
!	%f20 = 63c94f86 864f00ff, %l1 = 00000000000000ff
!	Mem[0000000030181420] = 000000ff00000000
	add	%i6,0x020,%g1
	stda	%f20,[%g1+%l1]ASI_PST16_SL ! Mem[0000000030181420] = ff004f86864fc963
!	Mem[0000000030041408] = ffffffff, %l4 = 000000000000003f
	ldstuba	[%i1+%o4]0x81,%l4	! %l4 = 000000ff000000ff
!	%f24 = 000000ff, Mem[0000000010101408] = 000000ff
	st	%f24,[%i4+%o4]		! Mem[0000000010101408] = 000000ff
!	Mem[00000000300c1400] = ffffffffffffffff, %l3 = 0000000000000000
	ldxa	[%i3+%g0]0x81,%l3	! %l3 = ffffffffffffffff
!	%l0 = 00000000000000ff, Mem[0000000010141400] = ffffffff
	stba	%l0,[%i5+%g0]0x80	! Mem[0000000010141400] = ffffffff
!	%l2 = 3f000000, %l3 = ffffffff, Mem[0000000010041408] = ff000000 00000000
	stda	%l2,[%i1+%o4]0x80	! Mem[0000000010041408] = 3f000000 ffffffff
!	%l3 = ffffffffffffffff, Mem[0000000010001410] = 864f00ff
	stha	%l3,[%i0+%o5]0x88	! Mem[0000000010001410] = 864fffff
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = dc003118, %f5  = 000000ff
	lda	[%i3+%o4]0x89,%f5 	! %f5 = dc003118

p0_label_387:
!	Mem[00000000211c0000] = 00007bbb, %l0 = 00000000000000ff
	ldub	[%o2+%g0],%l0		! %l0 = 0000000000000000
!	Mem[0000000010081408] = 000000ff, %l0 = 0000000000000000
	ldstuba	[%i2+%o4]0x80,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010081400] = 00000000, %l4 = 00000000000000ff
	lduha	[%i2+%g0]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000010081408] = ff0000ff, %l5 = 00000000005a005a
	ldsba	[%i2+%o4]0x80,%l5	! %l5 = ffffffffffffffff
!	Mem[000000001014143c] = ff000000, %l6 = 0000000000000000
	ldsba	[%i5+0x03e]%asi,%l6	! %l6 = 0000000000000000
!	Mem[0000000030181408] = 000000ff, %f13 = ff0000cc
	lda	[%i6+%o4]0x89,%f13	! %f13 = 000000ff
!	Mem[0000000030041400] = 00000000, %l1 = 00000000000000ff
	lduba	[%i1+%g0]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000010181408] = ff000000 000000ff, %l0 = 00000000, %l1 = 00000000
	ldda	[%i6+%o4]0x88,%l0	! %l0 = 00000000000000ff 00000000ff000000
!	Mem[00000000300c1400] = ffffffffffffffff, %l1 = 00000000ff000000
	ldxa	[%i3+%g0]0x81,%l1	! %l1 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000000000, Mem[00000000201c0000] = ffffaf65
	stb	%l4,[%o0+%g0]		! Mem[00000000201c0000] = 00ffaf65

p0_label_388:
!	%l0 = 00000000000000ff, Mem[00000000300c1408] = ffffffffdc003118
	stxa	%l0,[%i3+%o4]0x89	! Mem[00000000300c1408] = 00000000000000ff
!	%l0 = 00000000000000ff, Mem[0000000030081408] = 00000000ffffff00
	stxa	%l0,[%i2+%o4]0x89	! Mem[0000000030081408] = 00000000000000ff
!	%f30 = ff00005a 864fc963, Mem[0000000030181408] = ff000000 00000000
	stda	%f30,[%i6+%o4]0x81	! Mem[0000000030181408] = ff00005a 864fc963
!	%f20 = 63c94f86 864f00ff, %l3 = ffffffffffffffff
!	Mem[0000000010101420] = 0000003300002dba
	add	%i4,0x020,%g1
	stda	%f20,[%g1+%l3]ASI_PST16_P ! Mem[0000000010101420] = 63c94f86864f00ff
!	Mem[0000000030001410] = ff090000, %l0 = 00000000000000ff
	swapa	[%i0+%o5]0x89,%l0	! %l0 = 00000000ff090000
!	%f22 = ffffffff, Mem[0000000010141400] = ffffffff
	sta	%f22,[%i5+%g0]0x88	! Mem[0000000010141400] = ffffffff
!	%f20 = 63c94f86 864f00ff, Mem[0000000010001408] = ff0000ff 000018ff
	stda	%f20,[%i0+%o4]0x88	! Mem[0000000010001408] = 63c94f86 864f00ff
!	%l4 = 00000000, %l5 = ffffffff, Mem[0000000030181408] = 5a0000ff 63c94f86
	stda	%l4,[%i6+%o4]0x89	! Mem[0000000030181408] = 00000000 ffffffff
!	Mem[0000000010041408] = 3f000000, %l7 = 0000000000000000
	swapa	[%i1+%o4]0x80,%l7	! %l7 = 000000003f000000
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = 000000ff, %l4 = 0000000000000000
	ldswa	[%i3+%o5]0x81,%l4	! %l4 = 00000000000000ff

p0_label_389:
!	Mem[0000000030181400] = 5a005a00, %l3 = ffffffffffffffff
	lduwa	[%i6+%g0]0x89,%l3	! %l3 = 000000005a005a00
!	Mem[0000000010001430] = ffc94fff00000000, %l4 = 00000000000000ff
	ldxa	[%i0+0x030]%asi,%l4	! %l4 = ffc94fff00000000
!	Mem[0000000010101400] = 00000000, %l1 = ffffffffffffffff
	lduba	[%i4+%g0]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010001408] = 864f00ff, %l3 = 000000005a005a00
	lduwa	[%i0+%o4]0x88,%l3	! %l3 = 00000000864f00ff
!	Mem[0000000010181400] = 00000000, %l6 = 0000000000000000
	ldswa	[%i6+%g0]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000010001408] = ff004f86, %l7 = 000000003f000000
	lduba	[%i0+%o4]0x80,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010041400] = ff0000ff 00000000, %l6 = 00000000, %l7 = 000000ff
	ldda	[%i1+%g0]0x80,%l6	! %l6 = 00000000ff0000ff 0000000000000000
!	Mem[0000000010081410] = 00000000, %l1 = 0000000000000000
	ldsha	[%i2+%o5]0x80,%l1	! %l1 = 0000000000000000
!	Mem[00000000100c143d] = 00ffffff, %l3 = 00000000864f00ff
	ldstuba	[%i3+0x03d]%asi,%l3	! %l3 = 000000ff000000ff
!	Starting 10 instruction Store Burst
!	%f0  = 00000000 00000000, %l1 = 0000000000000000
!	Mem[0000000010141400] = ffffffff000000ff
	stda	%f0,[%i5+%l1]ASI_PST32_P ! Mem[0000000010141400] = ffffffff000000ff

p0_label_390:
!	%l4 = ffc94fff00000000, Mem[0000000030101400] = 00000000
	stwa	%l4,[%i4+%g0]0x81	! Mem[0000000030101400] = 00000000
!	%l1 = 0000000000000000, Mem[0000000010101410] = ffffffff
	stha	%l1,[%i4+%o5]0x80	! Mem[0000000010101410] = 0000ffff
!	%l1 = 0000000000000000, Mem[0000000010141420] = 00000018864fc963
	stx	%l1,[%i5+0x020]		! Mem[0000000010141420] = 0000000000000000
!	%l4 = 00000000, %l5 = ffffffff, Mem[0000000010041430] = 00ff00ff ffffffff
	stda	%l4,[%i1+0x030]%asi	! Mem[0000000010041430] = 00000000 ffffffff
!	Mem[0000000010181410] = 000000ff, %l3 = 00000000000000ff
	swapa	[%i6+%o5]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010081410] = 00000000, %l4 = ffc94fff00000000
	ldstuba	[%i2+%o5]0x88,%l4	! %l4 = 00000000000000ff
!	%l0 = 00000000ff090000, Mem[0000000030181408] = ffffffff00000000
	stxa	%l0,[%i6+%o4]0x89	! Mem[0000000030181408] = 00000000ff090000
!	%l2 = 000000003f000000, Mem[0000000010001400] = ff000000
	stba	%l2,[%i0+%g0]0x80	! Mem[0000000010001400] = 00000000
!	Mem[0000000010081410] = ff000000, %l0 = ff090000, %l7 = 00000000
	add	%i2,0x10,%g1
	casa	[%g1]0x80,%l0,%l7	! %l7 = 00000000ff000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = ffffffff, %l1 = 0000000000000000
	ldsha	[%i1+%o4]0x81,%l1	! %l1 = ffffffffffffffff

!	Check Point 78 for processor 0

	set	p0_check_pt_data_78,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 00000000ff090000
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = ffffffffffffffff
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l3,%g2			! %l3 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l4,%g2			! %l4 = 0000000000000000
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l5,%g2			! %l5 = ffffffffffffffff
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l6,%g2			! %l6 = 00000000ff0000ff
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l7,%g2			! %l7 = 00000000ff000000
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x40],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = 00000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x48],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = ff000000 dc003118
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x50],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = ffffffff 0000003f
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x58],%g3
	std	%f12,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f12 = 00000000 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf12,%g1

!	Check Point 78 completed


p0_label_391:
!	Mem[0000000030081400] = 000000ff000000ff, %f22 = ffffffff ae12becc
	ldda	[%i2+%g0]0x81,%f22	! %f22 = 000000ff 000000ff
!	Mem[0000000030001408] = 00ffffff, %l5 = ffffffffffffffff
	lduba	[%i0+%o4]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010101400] = 00000000, %f17 = 000000ff
	lda	[%i4+%g0]0x80,%f17	! %f17 = 00000000
!	Mem[0000000010141408] = 00000018, %l2 = 000000003f000000
	lduha	[%i5+%o4]0x88,%l2	! %l2 = 0000000000000018
!	Mem[00000000211c0000] = 00007bbb, %l5 = 00000000000000ff
	ldsha	[%o2+0x000]%asi,%l5	! %l5 = 0000000000000000
!	Mem[0000000010141420] = 0000000000000000, %f18 = 000018ff ff0000ff
	ldda	[%i5+0x020]%asi,%f18	! %f18 = 00000000 00000000
!	Mem[0000000030001400] = ff4fc963, %l3 = 00000000000000ff
	lduba	[%i0+%g0]0x81,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010101410] = 0000ffff, %f0  = 00000000
	lda	[%i4+0x010]%asi,%f0 	! %f0 = 0000ffff
!	Mem[0000000010141408] = 00000018, %l4 = 0000000000000000
	lduwa	[%i5+%o4]0x88,%l4	! %l4 = 0000000000000018
!	Starting 10 instruction Store Burst
!	Mem[0000000030141410] = ff000000, %l4 = 0000000000000018
	ldstuba	[%i5+%o5]0x89,%l4	! %l4 = 00000000000000ff

p0_label_392:
!	%l2 = 0000000000000018, Mem[00000000211c0001] = 00007bbb, %asi = 80
	stba	%l2,[%o2+0x001]%asi	! Mem[00000000211c0000] = 00187bbb
!	%f26 = ff00ffff db8bc354, %l4 = 0000000000000000
!	Mem[0000000010001408] = ff004f86864fc963
	add	%i0,0x008,%g1
	stda	%f26,[%g1+%l4]ASI_PST32_PL ! Mem[0000000010001408] = ff004f86864fc963
!	Mem[0000000030141400] = 00000000, %l2 = 0000000000000018
	ldstuba	[%i5+%g0]0x89,%l2	! %l2 = 00000000000000ff
!	%l1 = ffffffffffffffff, Mem[0000000030141400] = ff000000183100dc
	stxa	%l1,[%i5+%g0]0x81	! Mem[0000000030141400] = ffffffffffffffff
!	Mem[0000000030101410] = ff0000ff, %l0 = 00000000ff090000
	swapa	[%i4+%o5]0x81,%l0	! %l0 = 00000000ff0000ff
!	%f20 = 63c94f86 864f00ff, %l0 = 00000000ff0000ff
!	Mem[0000000010041430] = 00000000ffffffff
	add	%i1,0x030,%g1
	stda	%f20,[%g1+%l0]ASI_PST16_PL ! Mem[0000000010041430] = ff004f86864fc963
!	%l6 = 00000000ff0000ff, Mem[00000000100c1408] = 00000000
	stba	%l6,[%i3+%o4]0x80	! Mem[00000000100c1408] = ff000000
!	Mem[000000001008142c] = 864fc963, %l1 = ffffffffffffffff
	ldstub	[%i2+0x02c],%l1		! %l1 = 00000086000000ff
!	%f0  = 0000ffff 00000000, Mem[0000000030181410] = ffffffff 00000000
	stda	%f0 ,[%i6+%o5]0x81	! Mem[0000000030181410] = 0000ffff 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000021800180] = 00ff2200, %l7 = 00000000ff000000
	ldsha	[%o3+0x180]%asi,%l7	! %l7 = 00000000000000ff

p0_label_393:
!	Mem[0000000030041408] = ffffffff, %l5 = 0000000000000000
	lduba	[%i1+%o4]0x81,%l5	! %l5 = 00000000000000ff
	membar	#Sync			! Added by membar checker (79)
!	Mem[0000000010041400] = ff0000ff 00000000 00000000 ffffffff
!	Mem[0000000010041410] = 18000000 ff000000 ff00ff00 db8bc354
!	Mem[0000000010041420] = 00000000 000018ff ff000000 00000000
!	Mem[0000000010041430] = ff004f86 864fc963 0000dc45 00000000
	ldda	[%i1]ASI_BLK_P,%f0	! Block Load from 0000000010041400
!	Mem[0000000030101408] = 00000000, %l5 = 00000000000000ff
	lduha	[%i4+%o4]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000010001400] = 00000000 000000ff ff004f86 864fc963
!	Mem[0000000010001410] = ffff4f86 63c94f86 ccbe12ae ffffffff
!	Mem[0000000010001420] = 400913b6 ff0000ff 54c38bdb ffff00ff
!	Mem[0000000010001430] = ffc94fff 00000000 63c94f86 5a0000ff
	ldda	[%i0]ASI_BLK_P,%f16	! Block Load from 0000000010001400
!	Mem[0000000010041408] = 00000000, %l5 = 0000000000000000
	lduha	[%i1+0x008]%asi,%l5	! %l5 = 0000000000000000
!	Mem[0000000030101400] = 864fc963 00000000, %l6 = ff0000ff, %l7 = 000000ff
	ldda	[%i4+%g0]0x89,%l6	! %l6 = 0000000000000000 00000000864fc963
!	Mem[0000000030041400] = 00000000, %l7 = 00000000864fc963
	lduwa	[%i1+%g0]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000010141410] = 000000005aff5a00, %l7 = 0000000000000000
	ldxa	[%i5+%o5]0x80,%l7	! %l7 = 000000005aff5a00
!	Mem[0000000010181410] = ccbe12ae000000ff, %f8  = 00000000 000018ff
	ldda	[%i6+%o5]0x88,%f8 	! %f8  = ccbe12ae 000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000030181408] = ff090000, %l0 = 00000000ff0000ff
	swapa	[%i6+%o4]0x89,%l0	! %l0 = 00000000ff090000

p0_label_394:
!	Mem[0000000010001408] = 864f00ff, %l5 = 0000000000000000
	swapa	[%i0+%o4]0x88,%l5	! %l5 = 00000000864f00ff
!	Mem[00000000211c0001] = 00187bbb, %l5 = 00000000864f00ff
	ldstub	[%o2+0x001],%l5		! %l5 = 00000018000000ff
!	Mem[00000000100c1400] = 000000ff, %l4 = 0000000000000000
	swapa	[%i3+%g0]0x88,%l4	! %l4 = 00000000000000ff
!	%f5  = ff000000, Mem[00000000100c1410] = 0000003f
	sta	%f5 ,[%i3+%o5]0x88	! Mem[00000000100c1410] = ff000000
!	Mem[0000000010001408] = 00000000, %l7 = 000000005aff5a00
	ldstuba	[%i0+%o4]0x80,%l7	! %l7 = 00000000000000ff
!	%l6 = 00000000, %l7 = 00000000, Mem[0000000030081410] = 00000000 00000000
	stda	%l6,[%i2+%o5]0x81	! Mem[0000000030081410] = 00000000 00000000
!	%f0  = ff0000ff 00000000 00000000 ffffffff
!	%f4  = 18000000 ff000000 ff00ff00 db8bc354
!	%f8  = ccbe12ae 000000ff ff000000 00000000
!	%f12 = ff004f86 864fc963 0000dc45 00000000
	stda	%f0,[%i0]ASI_BLK_AIUS	! Block Store to 0000000030001400
	membar	#Sync			! Added by membar checker (80)
!	Mem[0000000010001430] = ffc94fff00000000, %l4 = 00000000000000ff, %l6 = 0000000000000000
	add	%i0,0x30,%g1
	casxa	[%g1]0x80,%l4,%l6	! %l6 = ffc94fff00000000
!	%l0 = 00000000ff090000, Mem[0000000030141400] = ffffffff
	stwa	%l0,[%i5+%g0]0x81	! Mem[0000000030141400] = ff090000
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = ff000000, %l2 = 0000000000000000
	ldsha	[%i2+%g0]0x89,%l2	! %l2 = 0000000000000000

p0_label_395:
!	Mem[0000000030081408] = 000000ff, %l0 = 00000000ff090000
	ldswa	[%i2+%o4]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010041408] = 00000000ffffffff, %f8  = ccbe12ae 000000ff
	ldda	[%i1+%o4]0x80,%f8 	! %f8  = 00000000 ffffffff
!	Mem[0000000010081400] = 00000000 000000ff, %l4 = 000000ff, %l5 = 00000018
	ldd	[%i2+%g0],%l4		! %l4 = 0000000000000000 00000000000000ff
!	Mem[0000000010181410] = ccbe12ae000000ff, %l2 = 0000000000000000
	ldxa	[%i6+%o5]0x88,%l2	! %l2 = ccbe12ae000000ff
!	Mem[000000001014143c] = ff000000, %l0 = 00000000000000ff
	ldswa	[%i5+0x03c]%asi,%l0	! %l0 = ffffffffff000000
!	Mem[0000000010081408] = ff0000ff, %l5 = 00000000000000ff
	lduha	[%i2+%o4]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010081410] = 000000ff 000000ff, %l0 = ff000000, %l1 = 00000086
	ldda	[%i2+%o5]0x88,%l0	! %l0 = 00000000000000ff 00000000000000ff
!	Mem[0000000010041400] = ff0000ff, %l5 = 00000000000000ff
	ldswa	[%i1+%g0]0x80,%l5	! %l5 = ffffffffff0000ff
!	Mem[0000000010041400] = ff0000ff00000000, %l7 = 0000000000000000
	ldx	[%i1+%g0],%l7		! %l7 = ff0000ff00000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030001408] = 00000000, %l1 = 00000000000000ff
	swapa	[%i0+%o4]0x89,%l1	! %l1 = 0000000000000000

!	Check Point 79 for processor 0

	set	p0_check_pt_data_79,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 0000000000000000
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = ccbe12ae000000ff
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 0000000000000000
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = ffffffffff0000ff
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l7,%g2			! %l7 = ff0000ff00000000
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x40],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = ff0000ff 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x48],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = 00000000 ffffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x50],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 18000000 ff000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x58],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = ff00ff00 db8bc354
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x60],%g3
	std	%f8,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f8 = 00000000 ffffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf08,%g1
	ldx	[%g4+0x68],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = ff000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x70],%g3
	std	%f12,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f12 = ff004f86 864fc963
	bne	%xcc,p0_freg_check_fail
	mov	0xf12,%g1
	ldx	[%g4+0x78],%g3
	std	%f14,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f14 = 0000dc45 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf14,%g1
	ldx	[%g4+0x80],%g3
	std	%f16,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f16 = 00000000 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf16,%g1
	ldx	[%g4+0x88],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = ff004f86 864fc963
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1
	ldx	[%g4+0x90],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = ffff4f86 63c94f86
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1
	ldx	[%g4+0x98],%g3
	std	%f22,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f22 = ccbe12ae ffffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf22,%g1
	ldx	[%g4+0xa0],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = 400913b6 ff0000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1
	ldx	[%g4+0xa8],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = 54c38bdb ffff00ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1
	ldx	[%g4+0xb0],%g3
	std	%f28,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f28 = ffc94fff 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf28,%g1
	ldx	[%g4+0xb8],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = 63c94f86 5a0000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 79 completed


p0_label_396:
!	%l2 = ccbe12ae000000ff, Mem[00000000218001c0] = 00ff397e
	sth	%l2,[%o3+0x1c0]		! Mem[00000000218001c0] = 00ff397e
!	Mem[0000000030081408] = ff000000, %l7 = ff0000ff00000000
	ldstuba	[%i2+%o4]0x81,%l7	! %l7 = 000000ff000000ff
!	%f18 = ff004f86 864fc963, Mem[0000000030141408] = ffffffcc dc003118
	stda	%f18,[%i5+%o4]0x89	! Mem[0000000030141408] = ff004f86 864fc963
!	Mem[0000000010081438] = ffffffffae12becc, %l6 = ffc94fff00000000, %l7 = 00000000000000ff
	add	%i2,0x38,%g1
	casxa	[%g1]0x80,%l6,%l7	! %l7 = ffffffffae12becc
!	%f5  = ff000000, Mem[0000000030141400] = 000009ff
	sta	%f5 ,[%i5+%g0]0x89	! Mem[0000000030141400] = ff000000
!	Mem[00000000100c1410] = 000000ff183100dc, %l7 = ffffffffae12becc, %l0 = 00000000000000ff
	add	%i3,0x10,%g1
	casxa	[%g1]0x80,%l7,%l0	! %l0 = 000000ff183100dc
!	%f12 = ff004f86, Mem[0000000010001420] = 400913b6
	st	%f12,[%i0+0x020]	! Mem[0000000010001420] = ff004f86
!	%f27 = ffff00ff, Mem[0000000010001408] = 000000ff
	sta	%f27,[%i0+%o4]0x88	! Mem[0000000010001408] = ffff00ff
!	%l2 = ccbe12ae000000ff, Mem[0000000010181414] = ae12becc, %asi = 80
	stwa	%l2,[%i6+0x014]%asi	! Mem[0000000010181414] = 000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = ff000000, %l0 = 000000ff183100dc
	lduwa	[%i3+%o5]0x89,%l0	! %l0 = 00000000ff000000

p0_label_397:
!	Mem[0000000010101408] = 000000ffb6130940, %f6  = ff00ff00 db8bc354
	ldda	[%i4+%o4]0x80,%f6 	! %f6  = 000000ff b6130940
!	Mem[0000000010001400] = 00000000, %l3 = 00000000000000ff
	lduha	[%i0+%g0]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000010101418] = 703f71ab, %f8  = 00000000
	ld	[%i4+0x018],%f8 	! %f8 = 703f71ab
!	Mem[0000000010101410] = 0000ffff 00000000, %l0 = ff000000, %l1 = 00000000
	ldda	[%i4+%o5]0x80,%l0	! %l0 = 000000000000ffff 0000000000000000
!	Mem[0000000030041408] = 000000ff ffffffff, %l0 = 0000ffff, %l1 = 00000000
	ldda	[%i1+%o4]0x89,%l0	! %l0 = 00000000ffffffff 00000000000000ff
!	Mem[00000000100c1400] = ffffffff 00000000, %l0 = ffffffff, %l1 = 000000ff
	ldda	[%i3+%g0]0x88,%l0	! %l0 = 0000000000000000 00000000ffffffff
!	Mem[00000000100c1420] = 000000ff, %l4 = 0000000000000000
	lduw	[%i3+0x020],%l4		! %l4 = 00000000000000ff
!	Mem[0000000030081400] = 000000ff 000000ff, %l4 = 000000ff, %l5 = ff0000ff
	ldda	[%i2+%g0]0x81,%l4	! %l4 = 00000000000000ff 00000000000000ff
!	Mem[0000000010181418] = 00000000, %l0 = 0000000000000000
	ldswa	[%i6+0x018]%asi,%l0	! %l0 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l6 = ffc94fff00000000, Mem[0000000010101408] = 000000ff
	stba	%l6,[%i4+%o4]0x80	! Mem[0000000010101408] = 000000ff

p0_label_398:
!	Mem[00000000100c1410] = 000000ff, %l6 = ffc94fff00000000
	swap	[%i3+%o5],%l6		! %l6 = 00000000000000ff
!	Mem[0000000010001400] = 00000000, %l3 = 0000000000000000
	swapa	[%i0+%g0]0x80,%l3	! %l3 = 0000000000000000
!	%f0  = ff0000ff 00000000, %l0 = 0000000000000000
!	Mem[0000000010041410] = 18000000ff000000
	add	%i1,0x010,%g1
	stda	%f0,[%g1+%l0]ASI_PST8_PL ! Mem[0000000010041410] = 18000000ff000000
!	%f18 = ff004f86 864fc963, Mem[0000000010041428] = ff000000 00000000
	stda	%f18,[%i1+0x028]%asi	! Mem[0000000010041428] = ff004f86 864fc963
!	Mem[0000000010081420] = ff00ffa50000ffff, %l4 = 00000000000000ff, %l4 = 00000000000000ff
	add	%i2,0x20,%g1
	casxa	[%g1]0x80,%l4,%l4	! %l4 = ff00ffa50000ffff
!	%l4 = ff00ffa50000ffff, Mem[0000000030101400] = 864fc96300000000
	stxa	%l4,[%i4+%g0]0x89	! Mem[0000000030101400] = ff00ffa50000ffff
!	%l3 = 0000000000000000, Mem[0000000030141400] = 000000ff
	stba	%l3,[%i5+%g0]0x81	! Mem[0000000030141400] = 000000ff
!	%l6 = 00000000000000ff, Mem[0000000010041408] = 00000000
	stha	%l6,[%i1+%o4]0x88	! Mem[0000000010041408] = 000000ff
!	%l2 = ccbe12ae000000ff, Mem[0000000030041410] = ff000000000000ff
	stxa	%l2,[%i1+%o5]0x89	! Mem[0000000030041410] = ccbe12ae000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = 00000000 183100dc, %l0 = 00000000, %l1 = ffffffff
	ldd	[%i3+%o5],%l0		! %l0 = 0000000000000000 00000000183100dc

p0_label_399:
!	Mem[0000000010041400] = ff0000ff, %l5 = 00000000000000ff
	ldsba	[%i1+%g0]0x80,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000020800040] = ffffac70, %l6 = 00000000000000ff
	ldsha	[%o1+0x040]%asi,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000020800040] = ffffac70, %l5 = ffffffffffffffff
	lduh	[%o1+0x040],%l5		! %l5 = 000000000000ffff
!	Mem[0000000010101400] = 0000000000000000, %f14 = 0000dc45 00000000
	ldda	[%i4+%g0]0x80,%f14	! %f14 = 00000000 00000000
!	Mem[0000000030141408] = 63c94f86, %l0 = 0000000000000000
	ldswa	[%i5+%o4]0x81,%l0	! %l0 = 0000000063c94f86
!	%l5 = 000000000000ffff, Mem[0000000010141408] = 0000000000000018
	stxa	%l5,[%i5+%o4]0x88	! Mem[0000000010141408] = 000000000000ffff
!	Mem[0000000021800000] = 1a7bd0b4, %l7 = ffffffffae12becc
	ldsh	[%o3+%g0],%l7		! %l7 = 0000000000001a7b
!	Mem[00000000100c1400] = 00000000, %l1 = 00000000183100dc
	lduwa	[%i3+%g0]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010041400] = ff0000ff00000000, %l0 = 0000000063c94f86
	ldx	[%i1+%g0],%l0		! %l0 = ff0000ff00000000
!	Starting 10 instruction Store Burst
!	%l6 = ffffffff, %l7 = 00001a7b, Mem[0000000010081410] = 000000ff 000000ff
	stda	%l6,[%i2+%o5]0x88	! Mem[0000000010081410] = ffffffff 00001a7b

p0_label_400:
!	%l2 = ccbe12ae000000ff, Mem[0000000010181410] = ff000000000000ff
	stxa	%l2,[%i6+%o5]0x88	! Mem[0000000010181410] = ccbe12ae000000ff
!	%f0  = ff0000ff 00000000, Mem[00000000100c1410] = 00000000 dc003118
	stda	%f0 ,[%i3+%o5]0x88	! Mem[00000000100c1410] = ff0000ff 00000000
!	Mem[0000000010041400] = ff0000ff, %l3 = 0000000000000000
	ldstuba	[%i1+%g0]0x80,%l3	! %l3 = 000000ff000000ff
!	%f16 = 00000000 000000ff, %l6 = ffffffffffffffff
!	Mem[0000000030041420] = 00000000ff0000ff
	add	%i1,0x020,%g1
	stda	%f16,[%g1+%l6]ASI_PST8_SL ! Mem[0000000030041420] = ff00000000000000
!	Mem[0000000030001410] = 18000000, %l1 = 0000000000000000
	swapa	[%i0+%o5]0x81,%l1	! %l1 = 0000000018000000
!	%l4 = ff00ffa50000ffff, immd = fffffffffffff1ef, %l2  = ccbe12ae000000ff
	mulx	%l4,-0xe11,%l2		! %l2 = 02f4000af1ef0e11
!	%l4 = ff00ffa50000ffff, %l0 = ff0000ff00000000, %y  = 000000cc
	udiv	%l4,%l0,%l4		! %l4 = ff00ffa50000ffff
	mov	%l0,%y			! %y = 00000028
!	%l3 = 00000000000000ff, Mem[0000000010041400] = ff0000ff
	stba	%l3,[%i1+%g0]0x88	! Mem[0000000010041400] = ff0000ff
!	Mem[0000000030081410] = 00000000, %l6 = ffffffffffffffff
	swapa	[%i2+%o5]0x81,%l6	! %l6 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1420] = 000000ff00ff0000, %f10 = ff000000 00000000
	ldda	[%i3+0x020]%asi,%f10	! %f10 = 000000ff 00ff0000

!	Check Point 80 for processor 0

	set	p0_check_pt_data_80,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = ff0000ff00000028
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 0000000018000000
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 02f4000af1ef0e11
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = ff00ffa50000ffff
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 000000000000ffff
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 0000000000000000
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 0000000000001a7b
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = ff0000ff 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x50],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 18000000 ff000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x58],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 000000ff b6130940
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x60],%g3
	std	%f8,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f8 = 703f71ab ffffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf08,%g1
	ldx	[%g4+0x68],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = 000000ff 00ff0000
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x70],%g3
	std	%f14,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f14 = 00000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf14,%g1

!	Check Point 80 completed


p0_label_401:
!	Mem[000000001000141c] = ffffffff, %f19 = 864fc963
	lda	[%i0+0x01c]%asi,%f19	! %f19 = ffffffff
!	Mem[0000000030041400] = 00000000, %l2 = 02f4000af1ef0e11
	lduwa	[%i1+%g0]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000030041410] = 000000ff, %l3 = 00000000000000ff
	ldsba	[%i1+%o5]0x89,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000030181408] = ff0000ff, %l6 = 0000000000000000
	lduha	[%i6+%o4]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010181408] = ff000000000000ff, %f6  = 000000ff b6130940
	ldda	[%i6+%o4]0x80,%f6 	! %f6  = ff000000 000000ff
!	Mem[0000000020800040] = ffffac70, %l7 = 0000000000001a7b
	ldsh	[%o1+0x040],%l7		! %l7 = ffffffffffffffff
!	Mem[0000000030101410] = 000009ff, %l7 = ffffffffffffffff
	ldsha	[%i4+%o5]0x89,%l7	! %l7 = 00000000000009ff
!	Mem[00000000201c0000] = 00ffaf65, %l5 = 000000000000ffff
	ldsb	[%o0+%g0],%l5		! %l5 = 0000000000000000
!	Mem[0000000030181408] = ff0000ff, %l6 = 00000000000000ff
	lduha	[%i6+%o4]0x81,%l6	! %l6 = 000000000000ff00
!	Starting 10 instruction Store Burst
!	Mem[0000000010101400] = 00000000, %l4 = ff00ffa50000ffff
	swapa	[%i4+%g0]0x80,%l4	! %l4 = 0000000000000000

p0_label_402:
!	%f25 = ff0000ff, Mem[0000000030001408] = ff000000
	sta	%f25,[%i0+%o4]0x81	! Mem[0000000030001408] = ff0000ff
!	%l0 = ff0000ff00000028, Mem[0000000010001400] = 00000000
	stba	%l0,[%i0+%g0]0x88	! Mem[0000000010001400] = 00000028
!	Mem[00000000100c1408] = 000000ff, %l6 = 000000000000ff00
	swapa	[%i3+%o4]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030181408] = ff0000ff, %l0 = ff0000ff00000028
	ldstuba	[%i6+%o4]0x81,%l0	! %l0 = 000000ff000000ff
!	%f16 = 00000000 000000ff, %l1 = 0000000018000000
!	Mem[0000000030081420] = 400013ffff00ff00
	add	%i2,0x020,%g1
	stda	%f16,[%g1+%l1]ASI_PST8_S ! Mem[0000000030081420] = 400013ffff00ff00
!	%f20 = ffff4f86 63c94f86, %l5 = 0000000000000000
!	Mem[0000000030041420] = ff00000000000000
	add	%i1,0x020,%g1
	stda	%f20,[%g1+%l5]ASI_PST32_SL ! Mem[0000000030041420] = ff00000000000000
!	Mem[0000000021800141] = 00000ea7, %l7 = 00000000000009ff
	ldstub	[%o3+0x141],%l7		! %l7 = 00000000000000ff
!	%l3 = ffffffffffffffff, Mem[000000001010143e] = 864fc963
	sth	%l3,[%i4+0x03e]		! Mem[000000001010143c] = 864fffff
!	Mem[0000000010181408] = 000000ff, %l4 = 0000000000000000
	ldstuba	[%i6+%o4]0x88,%l4	! %l4 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = ffffffff, %l4 = 00000000000000ff
	lduba	[%i3+%g0]0x89,%l4	! %l4 = 00000000000000ff

p0_label_403:
!	Mem[0000000020800040] = ffffac70, %l0 = 00000000000000ff
	ldub	[%o1+0x041],%l0		! %l0 = 00000000000000ff
!	Mem[00000000211c0000] = 00ff7bbb, %l2 = 0000000000000000
	ldub	[%o2+0x001],%l2		! %l2 = 00000000000000ff
!	Mem[0000000010101434] = 0000db8b, %f26 = 54c38bdb
	lda	[%i4+0x034]%asi,%f26	! %f26 = 0000db8b
!	Mem[0000000030001400] = ff0000ff, %l6 = 00000000000000ff
	lduha	[%i0+%g0]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030001410] = 00000000, %l6 = 00000000000000ff
	swapa	[%i0+%o5]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000030181410] = 00000000 ffff0000, %l2 = 000000ff, %l3 = ffffffff
	ldda	[%i6+%o5]0x89,%l2	! %l2 = 00000000ffff0000 0000000000000000
!	Mem[0000000010101424] = 864f00ff, %l0 = 00000000000000ff
	ldsw	[%i4+0x024],%l0		! %l0 = ffffffff864f00ff
!	Mem[0000000010101408] = 000000ffb6130940, %f8  = 703f71ab ffffffff
	ldda	[%i4+%o4]0x80,%f8 	! %f8  = 000000ff b6130940
!	Mem[0000000010081400] = 00000000, %l7 = 0000000000000000
	lduwa	[%i2+%g0]0x88,%l7	! %l7 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1408] = ff000000, %l4 = 00000000000000ff
	swapa	[%i3+%o4]0x81,%l4	! %l4 = 00000000ff000000

p0_label_404:
!	%f30 = 63c94f86, Mem[0000000010081400] = 00000000
	st	%f30,[%i2+%g0]		! Mem[0000000010081400] = 63c94f86
!	%l0 = ffffffff864f00ff, Mem[00000000300c1408] = 000000ff
	stha	%l0,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00ff00ff
!	%l5 = 0000000000000000, Mem[0000000010041400] = ff0000ff00000000
	stxa	%l5,[%i1+%g0]0x80	! Mem[0000000010041400] = 0000000000000000
!	Mem[00000000100c1420] = 000000ff, %l1 = 0000000018000000
	swap	[%i3+0x020],%l1		! %l1 = 00000000000000ff
!	Mem[00000000100c1400] = 00000000, %l1 = 00000000000000ff
	ldstuba	[%i3+%g0]0x80,%l1	! %l1 = 00000000000000ff
!	Mem[0000000021800041] = 0000b2d9, %l2 = 00000000ffff0000
	ldstuba	[%o3+0x041]%asi,%l2	! %l2 = 00000000000000ff
!	%l1 = 0000000000000000, Mem[0000000010181429] = ff000000, %asi = 80
	stba	%l1,[%i6+0x029]%asi	! Mem[0000000010181428] = ff000000
!	Code Fragment 3
p0_fragment_10:
!	%l0 = ffffffff864f00ff
	setx	0xfa3ce9c0149b5e26,%g7,%l0 ! %l0 = fa3ce9c0149b5e26
!	%l1 = 0000000000000000
	setx	0x658f33d057bde554,%g7,%l1 ! %l1 = 658f33d057bde554
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = fa3ce9c0149b5e26
	setx	0x0167813ffd8fa9c8,%g7,%l0 ! %l0 = 0167813ffd8fa9c8
!	%l1 = 658f33d057bde554
	setx	0x7aea4efff1248064,%g7,%l1 ! %l1 = 7aea4efff1248064
!	%f10 = 000000ff 00ff0000, Mem[0000000010141408] = ffff0000 00000000
	stda	%f10,[%i5+0x008]%asi	! Mem[0000000010141408] = 000000ff 00ff0000
!	Starting 10 instruction Load Burst
!	Mem[0000000010101418] = 703f71ab00000000, %f4  = 18000000 ff000000
	ldda	[%i4+0x018]%asi,%f4 	! %f4  = 703f71ab 00000000

p0_label_405:
!	Mem[0000000030041410] = ff000000, %f17 = 000000ff
	lda	[%i1+%o5]0x81,%f17	! %f17 = ff000000
!	Mem[0000000010141400] = ff000000 ffffffff, %l2 = 00000000, %l3 = 00000000
	ldda	[%i5+%g0]0x88,%l2	! %l2 = 00000000ffffffff 00000000ff000000
!	Mem[0000000010101410] = ffff0000, %l0 = 0167813ffd8fa9c8
	ldsba	[%i4+%o5]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000010141428] = c3540000, %l3 = 00000000ff000000
	ldsb	[%i5+0x02b],%l3		! %l3 = 0000000000000000
!	Mem[0000000030101408] = 00000000, %f7  = 000000ff
	lda	[%i4+%o4]0x89,%f7 	! %f7 = 00000000
!	Mem[0000000010181418] = 00000000a96e6a5a, %f6  = ff000000 00000000
	ldd	[%i6+0x018],%f6 	! %f6  = 00000000 a96e6a5a
!	Mem[0000000030101408] = 00000000, %l7 = 0000000000000000
	lduba	[%i4+%o4]0x81,%l7	! %l7 = 0000000000000000
!	Mem[00000000100c1428] = ff000000, %l6 = 0000000000000000
	ldub	[%i3+0x029],%l6		! %l6 = 0000000000000000
!	Mem[0000000030001400] = ff0000ff, %l3 = 0000000000000000
	lduha	[%i0+%g0]0x89,%l3	! %l3 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l7 = 0000000000000000, Mem[0000000030101410] = 000009ff
	stba	%l7,[%i4+%o5]0x89	! Mem[0000000030101410] = 00000900

!	Check Point 81 for processor 0

	set	p0_check_pt_data_81,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 0000000000000000
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 7aea4efff1248064
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 00000000ffffffff
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 00000000ff000000
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 0000000000000000
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 0000000000000000
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 0000000000000000
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = 00000000 ffffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x50],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 703f71ab 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x58],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 00000000 a96e6a5a
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x60],%g3
	std	%f8,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f8 = 000000ff b6130940
	bne	%xcc,p0_freg_check_fail
	mov	0xf08,%g1
	ldx	[%g4+0x68],%g3
	std	%f16,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f16 = 00000000 ff000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf16,%g1
	ldx	[%g4+0x70],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = ff004f86 ffffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1
	ldx	[%g4+0x78],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = 0000db8b ffff00ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1

!	Check Point 81 completed


p0_label_406:
!	%f22 = ccbe12ae ffffffff, %l2 = 00000000ffffffff
!	Mem[0000000030081410] = ffffffff00000000
	add	%i2,0x010,%g1
	stda	%f22,[%g1+%l2]ASI_PST32_SL ! Mem[0000000030081410] = ffffffffae12becc
!	Mem[0000000010101410] = 0000ffff, %l5 = 0000000000000000
	ldstuba	[%i4+%o5]0x80,%l5	! %l5 = 00000000000000ff
!	%l2 = ffffffff, %l3 = 000000ff, Mem[0000000010001410] = ffff4f86 63c94f86
	stda	%l2,[%i0+%o5]0x80	! Mem[0000000010001410] = ffffffff 000000ff
!	%f9  = b6130940, Mem[0000000030041410] = 000000ff
	sta	%f9 ,[%i1+%o5]0x89	! Mem[0000000030041410] = b6130940
!	Mem[00000000100c1400] = ff000000, %l0 = 0000000000000000
	swap	[%i3+%g0],%l0		! %l0 = 00000000ff000000
!	%f22 = ccbe12ae ffffffff, Mem[0000000010041428] = ff004f86 864fc963
	stda	%f22,[%i1+0x028]%asi	! Mem[0000000010041428] = ccbe12ae ffffffff
!	%f14 = 00000000 00000000, Mem[0000000010141408] = 000000ff 00ff0000
	stda	%f14,[%i5+%o4]0x80	! Mem[0000000010141408] = 00000000 00000000
!	%l4 = 00000000ff000000, Mem[0000000010141408] = 00000000
	stwa	%l4,[%i5+%o4]0x80	! Mem[0000000010141408] = ff000000
!	Mem[0000000030181400] = 005a005a, %l5 = 0000000000000000
	ldstuba	[%i6+%g0]0x81,%l5	! %l5 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = 0000ff00, %l2 = 00000000ffffffff
	ldsha	[%i3+%o4]0x88,%l2	! %l2 = ffffffffffffff00

p0_label_407:
!	Mem[0000000030041408] = ffffffff, %l5 = 0000000000000000
	ldsha	[%i1+%o4]0x81,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000030041400] = 00000000, %l1 = 7aea4efff1248064
	ldsha	[%i1+%g0]0x89,%l1	! %l1 = 0000000000000000
!	Mem[00000000100c1430] = 00000018, %l4 = 00000000ff000000
	lduw	[%i3+0x030],%l4		! %l4 = 0000000000000018
!	Mem[0000000010181420] = 00ffffff, %f9  = b6130940
	lda	[%i6+0x020]%asi,%f9 	! %f9 = 00ffffff
!	Mem[0000000030001410] = 000000ff, %f30 = 63c94f86
	lda	[%i0+%o5]0x81,%f30	! %f30 = 000000ff
!	Mem[00000000100c1420] = 18000000 00ff0000, %l4 = 00000018, %l5 = ffffffff
	ldd	[%i3+0x020],%l4		! %l4 = 0000000018000000 0000000000ff0000
!	Mem[0000000030041408] = 000000ffffffffff, %l7 = 0000000000000000
	ldxa	[%i1+%o4]0x89,%l7	! %l7 = 000000ffffffffff
!	Mem[0000000010001410] = ffffffff, %l5 = 0000000000ff0000
	ldsha	[%i0+%o5]0x88,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000010141408] = ff000000, %l0 = 00000000ff000000
	ldsba	[%i5+%o4]0x80,%l0	! %l0 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	Mem[0000000010141416] = 5aff5a00, %l7 = 000000ffffffffff
	ldstub	[%i5+0x016],%l7		! %l7 = 0000005a000000ff

p0_label_408:
!	Mem[0000000030041400] = 00000000, %l3 = 00000000000000ff
	ldstuba	[%i1+%g0]0x89,%l3	! %l3 = 00000000000000ff
!	%f4  = 703f71ab, Mem[0000000030001400] = ff0000ff
	sta	%f4 ,[%i0+%g0]0x89	! Mem[0000000030001400] = 703f71ab
!	Mem[0000000010141400] = ffffffff, %l3 = 0000000000000000
	ldstuba	[%i5+%g0]0x88,%l3	! %l3 = 000000ff000000ff
!	%l5 = ffffffffffffffff, Mem[0000000030181408] = ff0000ff
	stba	%l5,[%i6+%o4]0x89	! Mem[0000000030181408] = ff0000ff
!	Mem[0000000030101410] = 00090000, %l4 = 0000000018000000
	swapa	[%i4+%o5]0x81,%l4	! %l4 = 0000000000090000
!	%f10 = 000000ff, Mem[0000000030001400] = 703f71ab
	sta	%f10,[%i0+%g0]0x89	! Mem[0000000030001400] = 000000ff
!	%l5 = ffffffffffffffff, Mem[00000000300c1410] = ff0000ffff000000
	stxa	%l5,[%i3+%o5]0x89	! Mem[00000000300c1410] = ffffffffffffffff
!	Mem[0000000010041424] = 000018ff, %l4 = 0000000000090000, %asi = 80
	swapa	[%i1+0x024]%asi,%l4	! %l4 = 00000000000018ff
!	%l0 = ffffffffffffffff, Mem[0000000030101410] = 18000000ff0000ff
	stxa	%l0,[%i4+%o5]0x81	! Mem[0000000030101410] = ffffffffffffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101420] = 63c94f86864f00ff, %l5 = ffffffffffffffff
	ldxa	[%i4+0x020]%asi,%l5	! %l5 = 63c94f86864f00ff

p0_label_409:
!	Mem[0000000030181410] = ffff0000, %l4 = 00000000000018ff
	lduha	[%i6+%o5]0x89,%l4	! %l4 = 0000000000000000
!	Mem[00000000300c1408] = 00ff00ff, %l1 = 0000000000000000
	lduba	[%i3+%o4]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000030001400] = ff000000, %f0  = ff0000ff
	lda	[%i0+%g0]0x81,%f0 	! %f0 = ff000000
!	Mem[0000000030141410] = ff0000ff, %f7  = a96e6a5a
	lda	[%i5+%o5]0x89,%f7 	! %f7 = ff0000ff
!	Mem[0000000030181400] = ffffffff5a005aff, %f24 = 400913b6 ff0000ff
	ldda	[%i6+%g0]0x89,%f24	! %f24 = ffffffff 5a005aff
!	Mem[0000000030001408] = ff0000ff, %l5 = 63c94f86864f00ff
	lduha	[%i0+%o4]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[00000000211c0000] = 00ff7bbb, %l6 = 0000000000000000
	lduh	[%o2+%g0],%l6		! %l6 = 00000000000000ff
!	Mem[0000000030181408] = ff0000ff, %l7 = 000000000000005a
	lduwa	[%i6+%o4]0x89,%l7	! %l7 = 00000000ff0000ff
!	Mem[0000000010101400] = 00000000ffff0000, %l7 = 00000000ff0000ff
	ldxa	[%i4+%g0]0x88,%l7	! %l7 = 00000000ffff0000
!	Starting 10 instruction Store Burst
!	%f10 = 000000ff 00ff0000, %l6 = 00000000000000ff
!	Mem[0000000010001428] = 54c38bdbffff00ff
	add	%i0,0x028,%g1
	stda	%f10,[%g1+%l6]ASI_PST32_PL ! Mem[0000000010001428] = 0000ff00ff000000

p0_label_410:
!	%l6 = 00000000000000ff, Mem[0000000030181408] = ff0000ff00000000
	stxa	%l6,[%i6+%o4]0x81	! Mem[0000000030181408] = 00000000000000ff
!	%l2 = ffffffffffffff00, immd = 0000000000000e24, %l0  = ffffffffffffffff
	mulx	%l2,0xe24,%l0		! %l0 = fffffffffff1dc00
!	%f6  = 00000000, Mem[0000000010101438] = 00000000
	st	%f6 ,[%i4+0x038]	! Mem[0000000010101438] = 00000000
!	Mem[0000000030081408] = 000000ff, %l7 = 00000000ffff0000
	swapa	[%i2+%o4]0x89,%l7	! %l7 = 00000000000000ff
!	%l4 = 0000000000000000, Mem[0000000010141410] = 00000000
	stwa	%l4,[%i5+%o5]0x88	! Mem[0000000010141410] = 00000000
!	%f24 = ffffffff 5a005aff, %l4 = 0000000000000000
!	Mem[0000000010181430] = db8bc3ff00ffbecc
	add	%i6,0x030,%g1
	stda	%f24,[%g1+%l4]ASI_PST32_P ! Mem[0000000010181430] = db8bc3ff00ffbecc
!	Mem[0000000010081405] = 000000ff, %l4 = 0000000000000000
	ldstub	[%i2+0x005],%l4		! %l4 = 00000000000000ff
!	%f10 = 000000ff, Mem[0000000010101424] = 864f00ff
	sta	%f10,[%i4+0x024]%asi	! Mem[0000000010101424] = 000000ff
!	Mem[0000000030101408] = 00000000, %l0 = fffffffffff1dc00
	ldstuba	[%i4+%o4]0x89,%l0	! %l0 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = 00000000, %l7 = 00000000000000ff
	ldswa	[%i6+%g0]0x88,%l7	! %l7 = 0000000000000000

!	Check Point 82 for processor 0

	set	p0_check_pt_data_82,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 0000000000000000
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 0000000000000000
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = ffffffffffffff00
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 0000000000000000
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 0000000000000000
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = ff000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x50],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 703f71ab 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x58],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 00000000 ff0000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x60],%g3
	std	%f8,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f8 = 000000ff 00ffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf08,%g1
	ldx	[%g4+0x68],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = ffffffff 5a005aff
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1
	ldx	[%g4+0x70],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = 000000ff 5a0000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 82 completed


p0_label_411:
!	Mem[0000000030081400] = 000000ff000000ff, %f16 = 00000000 ff000000
	ldda	[%i2+%g0]0x81,%f16	! %f16 = 000000ff 000000ff
!	Mem[000000001010143c] = 864fffff, %l0 = 0000000000000000
	lduha	[%i4+0x03c]%asi,%l0	! %l0 = 000000000000864f
!	Mem[0000000010181400] = 00000000, %l4 = 0000000000000000
	ldsha	[%i6+0x002]%asi,%l4	! %l4 = 0000000000000000
!	Mem[0000000030081410] = ffffffffae12becc, %l1 = 0000000000000000
	ldxa	[%i2+%o5]0x81,%l1	! %l1 = ffffffffae12becc
!	Mem[0000000010101400] = ffff0000, %f4  = 703f71ab
	lda	[%i4+%g0]0x88,%f4 	! %f4 = ffff0000
!	Mem[0000000010101408] = 000000ff, %l1 = ffffffffae12becc
	lduba	[%i4+%o4]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000010141410] = 00000000, %f7  = ff0000ff
	lda	[%i5+%o5]0x88,%f7 	! %f7 = 00000000
!	Mem[0000000010001430] = ffc94fff, %l2 = ffffffffffffff00
	ldsha	[%i0+0x030]%asi,%l2	! %l2 = ffffffffffffffc9
!	Mem[0000000010041408] = 000000ff, %l6 = 00000000000000ff
	ldsba	[%i1+%o4]0x88,%l6	! %l6 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l5 = 00000000000000ff, Mem[00000000100c1408] = 0000ff00
	stba	%l5,[%i3+%o4]0x88	! Mem[00000000100c1408] = 0000ffff

p0_label_412:
!	Mem[00000000211c0001] = 00ff7bbb, %l5 = 00000000000000ff
	ldstuba	[%o2+0x001]%asi,%l5	! %l5 = 000000ff000000ff
!	%f8  = 000000ff 00ffffff, Mem[00000000100c1400] = 00000000 ffffffff
	stda	%f8 ,[%i3+%g0]0x80	! Mem[00000000100c1400] = 000000ff 00ffffff
!	%l0 = 0000864f, %l1 = 00000000, Mem[0000000030001408] = ff0000ff ffffffff
	stda	%l0,[%i0+%o4]0x89	! Mem[0000000030001408] = 0000864f 00000000
!	%l0 = 000000000000864f, Mem[0000000010001408] = ff00ffff864fc963
	stxa	%l0,[%i0+%o4]0x80	! Mem[0000000010001408] = 000000000000864f
!	Mem[00000000100c1410] = 00000000, %l4 = 0000000000000000
	swapa	[%i3+%o5]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000010101410] = ffff00ff, %l3 = 00000000000000ff
	swapa	[%i4+%o5]0x88,%l3	! %l3 = 00000000ffff00ff
!	Mem[00000000300c1410] = ffffffff, %l3 = 00000000ffff00ff
	ldstuba	[%i3+%o5]0x89,%l3	! %l3 = 000000ff000000ff
!	%l1 = 0000000000000000, Mem[0000000010181408] = 000000ff
	stba	%l1,[%i6+%o4]0x88	! Mem[0000000010181408] = 00000000
!	Mem[0000000010141408] = ff000000, %l7 = 0000000000000000
	ldstuba	[%i5+%o4]0x80,%l7	! %l7 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = ffffffff, %l7 = 00000000000000ff
	ldswa	[%i3+%o5]0x89,%l7	! %l7 = ffffffffffffffff

p0_label_413:
!	Mem[0000000030041408] = ffffffff, %l6 = ffffffffffffffff
	lduwa	[%i1+%o4]0x81,%l6	! %l6 = 00000000ffffffff
!	Mem[0000000030101408] = 000000ff, %l5 = 00000000000000ff
	lduba	[%i4+%o4]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010181410] = 000000ff, %l1 = 0000000000000000
	ldswa	[%i6+%o5]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030041408] = ffffffffff000000, %f10 = 000000ff 00ff0000
	ldda	[%i1+%o4]0x81,%f10	! %f10 = ffffffff ff000000
!	Mem[0000000030181408] = 00000000 000000ff, %l4 = 00000000, %l5 = 000000ff
	ldda	[%i6+%o4]0x81,%l4	! %l4 = 0000000000000000 00000000000000ff
!	Mem[00000000201c0000] = 00ffaf65, %l7 = ffffffffffffffff
	ldsb	[%o0+%g0],%l7		! %l7 = 0000000000000000
!	Mem[0000000010141420] = 0000000000000000, %f14 = 00000000 00000000
	ldd	[%i5+0x020],%f14	! %f14 = 00000000 00000000
!	Mem[0000000030081408] = 0000ffff, %l2 = ffffffffffffffc9
	lduwa	[%i2+%o4]0x81,%l2	! %l2 = 000000000000ffff
!	Mem[0000000030041410] = ccbe12aeb6130940, %f20 = ffff4f86 63c94f86
	ldda	[%i1+%o5]0x89,%f20	! %f20 = ccbe12ae b6130940
!	Starting 10 instruction Store Burst
!	%l5 = 00000000000000ff, Mem[00000000300c1400] = ffffffff
	stwa	%l5,[%i3+%g0]0x89	! Mem[00000000300c1400] = 000000ff

p0_label_414:
!	%l0 = 000000000000864f, Mem[0000000010181410] = ff000000ae12becc
	stxa	%l0,[%i6+%o5]0x80	! Mem[0000000010181410] = 000000000000864f
!	%l5 = 00000000000000ff, Mem[0000000010001408] = 4f86000000000000
	stxa	%l5,[%i0+%o4]0x88	! Mem[0000000010001408] = 00000000000000ff
!	%l4 = 0000000000000000, Mem[0000000030101410] = ffffffff
	stwa	%l4,[%i4+%o5]0x89	! Mem[0000000030101410] = 00000000
!	%l3 = 00000000000000ff, Mem[0000000010141400] = ffffffff
	sth	%l3,[%i5+%g0]		! Mem[0000000010141400] = 00ffffff
!	Mem[0000000030081400] = 000000ff, %l4 = 0000000000000000
	ldstuba	[%i2+%g0]0x81,%l4	! %l4 = 00000000000000ff
!	Mem[00000000100c1400] = ff000000, %l6 = 00000000ffffffff
	ldstuba	[%i3+%g0]0x88,%l6	! %l6 = 00000000000000ff
!	%l0 = 000000000000864f, Mem[0000000010001400] = 28000000
	stha	%l0,[%i0+%g0]0x80	! Mem[0000000010001400] = 864f0000
!	Mem[0000000030041410] = 400913b6, %l5 = 00000000000000ff
	swapa	[%i1+%o5]0x81,%l5	! %l5 = 00000000400913b6
!	%f0  = ff000000 00000000 00000000 ffffffff
!	%f4  = ffff0000 00000000 00000000 00000000
!	%f8  = 000000ff 00ffffff ffffffff ff000000
!	%f12 = ff004f86 864fc963 00000000 00000000
	stda	%f0,[%i1]ASI_BLK_AIUSL	! Block Store to 0000000030041400
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = 00ff7bbb, %l3 = 00000000000000ff
	ldsb	[%o2+0x001],%l3		! %l3 = ffffffffffffffff

p0_label_415:
!	Mem[0000000030001408] = 4f860000, %l7 = 0000000000000000
	ldsba	[%i0+%o4]0x81,%l7	! %l7 = 000000000000004f
!	Mem[00000000300c1400] = ffffffff 000000ff, %l2 = 0000ffff, %l3 = ffffffff
	ldda	[%i3+%g0]0x89,%l2	! %l2 = 00000000000000ff 00000000ffffffff
!	Mem[0000000030181408] = ff00000000000000, %f18 = ff004f86 ffffffff
	ldda	[%i6+%o4]0x89,%f18	! %f18 = ff000000 00000000
!	Mem[0000000010001430] = ffc94fff00000000, %l7 = 000000000000004f
	ldx	[%i0+0x030],%l7		! %l7 = ffc94fff00000000
!	Mem[00000000100c1408] = ffff0000 ffffffff, %l0 = 0000864f, %l1 = 000000ff
	ldda	[%i3+%o4]0x80,%l0	! %l0 = 00000000ffff0000 00000000ffffffff
!	Mem[0000000010101410] = 000000ff, %l7 = ffc94fff00000000
	lduwa	[%i4+%o5]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030141408] = 63c94f86, %l3 = 00000000ffffffff
	lduwa	[%i5+%o4]0x81,%l3	! %l3 = 0000000063c94f86
!	Mem[0000000030181408] = 00000000, %l3 = 0000000063c94f86
	ldstuba	[%i6+%o4]0x81,%l3	! %l3 = 00000000000000ff
!	Mem[0000000020800000] = 00ff7d94, %l5 = 00000000400913b6
	ldsba	[%o1+0x001]%asi,%l5	! %l5 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%f18 = ff000000 00000000, Mem[00000000300c1400] = ff000000 ffffffff
	stda	%f18,[%i3+%g0]0x81	! Mem[00000000300c1400] = ff000000 00000000

!	Check Point 83 for processor 0

	set	p0_check_pt_data_83,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 00000000ffff0000
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 00000000ffffffff
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 0000000000000000
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 0000000000000000
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = ffffffffffffffff
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 0000000000000000
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = ff000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x50],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = 00000000 ffffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x58],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = ffff0000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x60],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 00000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x68],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = ffffffff ff000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x70],%g3
	std	%f14,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f14 = 00000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf14,%g1
	ldx	[%g4+0x78],%g3
	std	%f16,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f16 = 000000ff 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf16,%g1
	ldx	[%g4+0x80],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = ff000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1
	ldx	[%g4+0x88],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = ccbe12ae b6130940
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1

!	Check Point 83 completed


p0_label_416:
!	Mem[000000001008142c] = ff4fc963, %l5 = ffffffff, %l5 = ffffffff
	add	%i2,0x2c,%g1
	casa	[%g1]0x80,%l5,%l5	! %l5 = 00000000ff4fc963
!	Mem[0000000030101410] = 00000000, %l7 = 00000000000000ff
	ldstuba	[%i4+%o5]0x81,%l7	! %l7 = 00000000000000ff
!	%l4 = 0000000000000000, Mem[00000000211c0001] = 00ff7bbb, %asi = 80
	stba	%l4,[%o2+0x001]%asi	! Mem[00000000211c0000] = 00007bbb
!	%l4 = 00000000, %l5 = ff4fc963, Mem[0000000010181408] = 00000000 000000ff
	stda	%l4,[%i6+%o4]0x80	! Mem[0000000010181408] = 00000000 ff4fc963
!	%l1 = 00000000ffffffff, Mem[00000000201c0000] = 00ffaf65, %asi = 80
	stba	%l1,[%o0+0x000]%asi	! Mem[00000000201c0000] = ffffaf65
!	Mem[00000000100c1400] = ff0000ff, %l5 = 00000000ff4fc963
	ldstuba	[%i3+%g0]0x88,%l5	! %l5 = 000000ff000000ff
!	%f10 = ffffffff ff000000, Mem[0000000010101408] = ff000000 400913b6
	stda	%f10,[%i4+%o4]0x88	! Mem[0000000010101408] = ffffffff ff000000
!	%l1 = 00000000ffffffff, Mem[0000000010181436] = 00ffbecc
	stb	%l1,[%i6+0x036]		! Mem[0000000010181434] = 00ffffcc
!	%f21 = b6130940, Mem[0000000030001410] = 000000ff
	sta	%f21,[%i0+%o5]0x81	! Mem[0000000030001410] = b6130940
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = ff0000ff, %l6 = 0000000000000000
	ldsha	[%i2+%o4]0x80,%l6	! %l6 = ffffffffffffff00

p0_label_417:
!	Mem[00000000300c1400] = 00000000000000ff, %f12 = ff004f86 864fc963
	ldda	[%i3+%g0]0x89,%f12	! %f12 = 00000000 000000ff
!	Mem[0000000030001410] = b6130940, %l6 = ffffffffffffff00
	ldstuba	[%i0+%o5]0x81,%l6	! %l6 = 000000b6000000ff
!	Mem[0000000030101408] = 000000ff, %l7 = 0000000000000000
	ldswa	[%i4+%o4]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010141408] = ff00000000000000, %l1 = 00000000ffffffff
	ldxa	[%i5+%o4]0x80,%l1	! %l1 = ff00000000000000
!	Mem[0000000010101414] = 00000000, %l7 = 00000000000000ff
	ldswa	[%i4+0x014]%asi,%l7	! %l7 = 0000000000000000
!	Mem[0000000030101400] = ffff0000, %l4 = 0000000000000000
	lduba	[%i4+%g0]0x81,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010101420] = 63c94f86000000ff, %f20 = ccbe12ae b6130940
	ldda	[%i4+0x020]%asi,%f20	! %f20 = 63c94f86 000000ff
!	Mem[00000000100c1410] = 00000000, %l1 = ff00000000000000
	lduwa	[%i3+%o5]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010101410] = 000000ff, %l6 = 00000000000000b6
	ldsha	[%i4+%o5]0x88,%l6	! %l6 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000010101403] = 0000ffff, %l7 = 0000000000000000
	ldstub	[%i4+0x003],%l7		! %l7 = 000000ff000000ff

p0_label_418:
!	Mem[0000000020800040] = ffffac70, %l6 = 00000000000000ff
	ldstub	[%o1+0x040],%l6		! %l6 = 000000ff000000ff
!	%l3 = 0000000000000000, Mem[0000000030001400] = ff00000000000000
	stxa	%l3,[%i0+%g0]0x81	! Mem[0000000030001400] = 0000000000000000
!	%f31 = 5a0000ff, Mem[0000000010041410] = 18000000
	sta	%f31,[%i1+%o5]0x80	! Mem[0000000010041410] = 5a0000ff
!	Mem[0000000020800001] = 00ff7d94, %l6 = 00000000000000ff
	ldstub	[%o1+0x001],%l6		! %l6 = 000000ff000000ff
!	%f2  = 00000000, Mem[0000000010141410] = 00000000
	sta	%f2 ,[%i5+%o5]0x80	! Mem[0000000010141410] = 00000000
!	%l6 = 000000ff, %l7 = 000000ff, Mem[0000000030001410] = 400913ff 000000ff
	stda	%l6,[%i0+%o5]0x89	! Mem[0000000030001410] = 000000ff 000000ff
!	Mem[0000000010001408] = ff000000, %l7 = 00000000000000ff
	swapa	[%i0+%o4]0x80,%l7	! %l7 = 00000000ff000000
!	Mem[0000000030081410] = ffffffff, %l4 = 00000000000000ff
	swapa	[%i2+%o5]0x89,%l4	! %l4 = 00000000ffffffff
!	Mem[00000000211c0001] = 00007bbb, %l0 = 00000000ffff0000
	ldstuba	[%o2+0x001]%asi,%l0	! %l0 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = 00000000, %l3 = 0000000000000000
	lduha	[%i6+%o4]0x80,%l3	! %l3 = 0000000000000000

p0_label_419:
!	Mem[00000000300c1400] = 000000ff, %l5 = 00000000000000ff
	lduha	[%i3+%g0]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030081408] = 0000ffff 00000000, %l0 = 00000000, %l1 = 00000000
	ldda	[%i2+%o4]0x81,%l0	! %l0 = 000000000000ffff 0000000000000000
	membar	#Sync			! Added by membar checker (81)
!	Mem[0000000030041408] = 00000000ffffffff, %l1 = 0000000000000000
	ldxa	[%i1+%o4]0x89,%l1	! %l1 = 00000000ffffffff
!	Mem[0000000030041400] = ff00000000000000, %f30 = 000000ff 5a0000ff
	ldda	[%i1+%g0]0x89,%f30	! %f30 = ff000000 00000000
!	Mem[0000000030101408] = ff000000 005a005a, %l2 = 000000ff, %l3 = 00000000
	ldda	[%i4+%o4]0x81,%l2	! %l2 = 00000000ff000000 00000000005a005a
!	Mem[0000000010181400] = 00000000, %l2 = 00000000ff000000
	ldsba	[%i6+%g0]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000030181410] = 0000ffff, %l4 = 00000000ffffffff
	lduha	[%i6+%o5]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000030081400] = ff0000ff, %l6 = 00000000000000ff
	lduwa	[%i2+%g0]0x81,%l6	! %l6 = 00000000ff0000ff
!	Mem[000000001018142c] = 00000000, %l6 = 00000000ff0000ff
	ldsh	[%i6+0x02e],%l6		! %l6 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l1 = 00000000ffffffff, Mem[0000000010041408] = ff000000
	stba	%l1,[%i1+%o4]0x80	! Mem[0000000010041408] = ff000000

p0_label_420:
!	%f27 = ffff00ff, Mem[00000000300c1410] = ffffffff
	sta	%f27,[%i3+%o5]0x81	! Mem[00000000300c1410] = ffff00ff
!	%l4 = 0000000000000000, Mem[0000000030141410] = ff0000ff
	stha	%l4,[%i5+%o5]0x89	! Mem[0000000030141410] = ff000000
!	%f24 = ffffffff, Mem[0000000030081408] = ffff0000
	sta	%f24,[%i2+%o4]0x89	! Mem[0000000030081408] = ffffffff
!	%l7 = 00000000ff000000, Mem[0000000010041414] = ff000000, %asi = 80
	stwa	%l7,[%i1+0x014]%asi	! Mem[0000000010041414] = ff000000
!	Mem[0000000010141428] = c354000000000000, %l4 = 0000000000000000, %l0 = 000000000000ffff
	add	%i5,0x28,%g1
	casxa	[%g1]0x80,%l4,%l0	! %l0 = c354000000000000
!	%l7 = 00000000ff000000, Mem[0000000010141410] = 00000000
	stwa	%l7,[%i5+%o5]0x80	! Mem[0000000010141410] = ff000000
!	Mem[0000000030181400] = 5a005aff, %l7 = 00000000ff000000
	ldstuba	[%i6+%g0]0x89,%l7	! %l7 = 000000ff000000ff
!	Mem[0000000010001410] = ffffffff, %l5 = 00000000000000ff
	ldstuba	[%i0+%o5]0x88,%l5	! %l5 = 000000ff000000ff
!	%l5 = 00000000000000ff, Mem[0000000021800100] = 0000b49a, %asi = 80
	stha	%l5,[%o3+0x100]%asi	! Mem[0000000021800100] = 00ffb49a
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1420] = 1800000000ff0000, %f24 = ffffffff 5a005aff
	ldd	[%i3+0x020],%f24	! %f24 = 18000000 00ff0000

!	Check Point 84 for processor 0

	set	p0_check_pt_data_84,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = c354000000000000
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 00000000ffffffff
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 0000000000000000
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 00000000005a005a
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 0000000000000000
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 0000000000000000
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = ff000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x50],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = 00000000 ffffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x58],%g3
	std	%f12,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f12 = 00000000 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf12,%g1
	ldx	[%g4+0x60],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = 63c94f86 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1
	ldx	[%g4+0x68],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = 18000000 00ff0000
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1
	ldx	[%g4+0x70],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = ff000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 84 completed


p0_label_421:
!	Mem[0000000030181408] = ff000000, %l4 = 0000000000000000
	ldsha	[%i6+%o4]0x81,%l4	! %l4 = ffffffffffffff00
!	Mem[0000000030141400] = ff000000, %l5 = 00000000000000ff
	lduba	[%i5+%g0]0x89,%l5	! %l5 = 0000000000000000
!	Mem[00000000300c1410] = ffff00ff, %l5 = 0000000000000000
	lduba	[%i3+%o5]0x81,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030081410] = ff000000ae12becc, %f4  = ffff0000 00000000
	ldda	[%i2+%o5]0x81,%f4 	! %f4  = ff000000 ae12becc
!	Mem[0000000030141410] = 000000ff, %f14 = 00000000
	lda	[%i5+%o5]0x81,%f14	! %f14 = 000000ff
!	Mem[0000000010101408] = 000000ff, %l0 = c354000000000000
	lduha	[%i4+%o4]0x80,%l0	! %l0 = 0000000000000000
!	Mem[00000000211c0000] = 00ff7bbb, %l5 = 00000000000000ff
	ldsb	[%o2+0x001],%l5		! %l5 = ffffffffffffffff
!	Mem[0000000010081408] = ff0000ff 864f00ff, %l4 = ffffff00, %l5 = ffffffff
	ldda	[%i2+%o4]0x80,%l4	! %l4 = 00000000ff0000ff 00000000864f00ff
!	Mem[0000000010101410] = ff000000, %l1 = 00000000ffffffff
	lduba	[%i4+%o5]0x80,%l1	! %l1 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000030081400] = ff0000ff, %l6 = 0000000000000000
	swapa	[%i2+%g0]0x81,%l6	! %l6 = 00000000ff0000ff

p0_label_422:
!	Mem[00000000211c0001] = 00ff7bbb, %l5 = 00000000864f00ff
	ldstuba	[%o2+0x001]%asi,%l5	! %l5 = 000000ff000000ff
!	Mem[0000000030041410] = 00000000, %l0 = 0000000000000000
	ldstuba	[%i1+%o5]0x89,%l0	! %l0 = 00000000000000ff
!	%l0 = 0000000000000000, Mem[0000000010141408] = 000000ff
	stba	%l0,[%i5+%o4]0x88	! Mem[0000000010141408] = 00000000
!	%f2  = 00000000 ffffffff, %l0 = 0000000000000000
!	Mem[0000000010141438] = a96e6a5aff000000
	add	%i5,0x038,%g1
	stda	%f2,[%g1+%l0]ASI_PST16_P ! Mem[0000000010141438] = a96e6a5aff000000
!	Mem[0000000010181408] = 00000000, %l5 = 00000000000000ff
	swapa	[%i6+%o4]0x80,%l5	! %l5 = 0000000000000000
!	%l7 = 00000000000000ff, Mem[0000000030041400] = 00000000
	stba	%l7,[%i1+%g0]0x89	! Mem[0000000030041400] = 000000ff
!	%l6 = 00000000ff0000ff, Mem[0000000010101420] = 63c94f86, %asi = 80
	stwa	%l6,[%i4+0x020]%asi	! Mem[0000000010101420] = ff0000ff
!	Mem[0000000030001408] = 4f860000, %l3 = 00000000005a005a
	swapa	[%i0+%o4]0x81,%l3	! %l3 = 000000004f860000
!	%l6 = 00000000ff0000ff, Mem[0000000010101410] = 000000ff
	stba	%l6,[%i4+%o5]0x88	! Mem[0000000010101410] = 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = 5a005a00, %l4 = 00000000ff0000ff
	ldswa	[%i0+%o4]0x89,%l4	! %l4 = 000000005a005a00

p0_label_423:
!	Mem[00000000201c0000] = ffffaf65, %l7 = 00000000000000ff
	ldsb	[%o0+%g0],%l7		! %l7 = ffffffffffffffff
!	Mem[0000000030101408] = 000000ff, %l3 = 000000004f860000
	ldsba	[%i4+%o4]0x89,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010081438] = ffffffffae12becc, %f24 = 18000000 00ff0000
	ldda	[%i2+0x038]%asi,%f24	! %f24 = ffffffff ae12becc
!	Mem[0000000030081410] = 000000ff, %l4 = 000000005a005a00
	lduwa	[%i2+%o5]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030101400] = ffff0000, %l0 = 0000000000000000
	lduwa	[%i4+%g0]0x81,%l0	! %l0 = 00000000ffff0000
!	Mem[0000000030041408] = ffffffff, %f9  = 00ffffff
	lda	[%i1+%o4]0x81,%f9 	! %f9 = ffffffff
!	Mem[00000000100c1438] = 0000000000ffffff, %f28 = ffc94fff 00000000
	ldd	[%i3+0x038],%f28	! %f28 = 00000000 00ffffff
!	Mem[0000000030081410] = 000000ff, %l1 = 00000000000000ff
	ldsba	[%i2+%o5]0x89,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000020800000] = 00ff7d94, %l1 = ffffffffffffffff
	ldsh	[%o1+%g0],%l1		! %l1 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000010001408] = 000000ff, %l5 = 0000000000000000
	ldstuba	[%i0+%o4]0x80,%l5	! %l5 = 00000000000000ff

p0_label_424:
!	Mem[000000001018141c] = a96e6a5a, %l2 = 0000000000000000
	swap	[%i6+0x01c],%l2		! %l2 = 00000000a96e6a5a
!	Mem[0000000010141408] = 00000000, %l7 = ffffffffffffffff
	ldstuba	[%i5+%o4]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010181408] = ff000000, %l2 = 00000000a96e6a5a
	ldstuba	[%i6+%o4]0x88,%l2	! %l2 = 00000000000000ff
!	%l4 = 00000000000000ff, Mem[0000000010101410] = 000000ff
	stha	%l4,[%i4+%o5]0x88	! Mem[0000000010101410] = 000000ff
!	%l7 = 0000000000000000, Mem[0000000030141408] = 63c94f86864f00ff
	stxa	%l7,[%i5+%o4]0x81	! Mem[0000000030141408] = 0000000000000000
!	%l0 = 00000000ffff0000, Mem[0000000010001400] = 864f0000
	stha	%l0,[%i0+%g0]0x80	! Mem[0000000010001400] = 00000000
!	Mem[0000000030181400] = 5a005aff, %l5 = 0000000000000000
	ldstuba	[%i6+%g0]0x89,%l5	! %l5 = 000000ff000000ff
!	Mem[0000000010041400] = 00000000, %l2 = 0000000000000000
	ldstuba	[%i1+%g0]0x80,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030041410] = ff000000, %l5 = 00000000000000ff
	ldstuba	[%i1+%o5]0x81,%l5	! %l5 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = ff000000ff000000, %f26 = 0000db8b ffff00ff
	ldda	[%i5+%o5]0x89,%f26	! %f26 = ff000000 ff000000

p0_label_425:
!	Mem[0000000020800040] = ffffac70, %l0 = 00000000ffff0000
	ldsb	[%o1+0x040],%l0		! %l0 = ffffffffffffffff
!	Mem[0000000030041410] = 000000ff, %l0 = ffffffffffffffff
	lduba	[%i1+%o5]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010081408] = ff0000ff, %l2 = 0000000000000000
	lduba	[%i2+%o4]0x80,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010181438] = 000000ff000000ff, %f0  = ff000000 00000000
	ldd	[%i6+0x038],%f0 	! %f0  = 000000ff 000000ff
!	Mem[0000000021800080] = ffffd5df, %l2 = 00000000000000ff
	lduh	[%o3+0x080],%l2		! %l2 = 000000000000ffff
!	Mem[00000000100c1438] = 0000000000ffffff, %l5 = 00000000000000ff
	ldxa	[%i3+0x038]%asi,%l5	! %l5 = 0000000000ffffff
!	Mem[0000000010001408] = ff0000ff00000000, %l0 = 00000000000000ff
	ldxa	[%i0+0x008]%asi,%l0	! %l0 = ff0000ff00000000
!	Mem[0000000020800040] = ffffac70, %l1 = 00000000000000ff
	ldub	[%o1+0x040],%l1		! %l1 = 00000000000000ff
!	Mem[00000000300c1400] = 000000ff, %l7 = 0000000000000000
	lduwa	[%i3+%g0]0x89,%l7	! %l7 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000010141412] = ff000000, %l3 = ffffffffffffffff
	ldstub	[%i5+0x012],%l3		! %l3 = 00000000000000ff

!	Check Point 85 for processor 0

	set	p0_check_pt_data_85,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = ff0000ff00000000
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 000000000000ffff
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 0000000000000000
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 0000000000ffffff
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l7,%g2			! %l7 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x40],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = 000000ff 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x48],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = ff000000 ae12becc
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x50],%g3
	std	%f8,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f8 = 000000ff ffffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf08,%g1
	ldx	[%g4+0x58],%g3
	std	%f14,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f14 = 000000ff 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf14,%g1
	ldx	[%g4+0x60],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = ffffffff ae12becc
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1
	ldx	[%g4+0x68],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = ff000000 ff000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1
	ldx	[%g4+0x70],%g3
	std	%f28,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f28 = 00000000 00ffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf28,%g1

!	Check Point 85 completed


p0_label_426:
!	%l6 = 00000000ff0000ff, Mem[00000000218001c0] = 00ff397e, %asi = 80
	stba	%l6,[%o3+0x1c0]%asi	! Mem[00000000218001c0] = ffff397e
!	Mem[0000000030001400] = 00000000, %l4 = 00000000000000ff
	swapa	[%i0+%g0]0x89,%l4	! %l4 = 0000000000000000
!	%l4 = 0000000000000000, Mem[00000000211c0000] = 00ff7bbb
	sth	%l4,[%o2+%g0]		! Mem[00000000211c0000] = 00007bbb
!	%l5 = 0000000000ffffff, Mem[0000000030041408] = 00000000ffffffff
	stxa	%l5,[%i1+%o4]0x89	! Mem[0000000030041408] = 0000000000ffffff
!	%f22 = ccbe12ae ffffffff, Mem[0000000030181410] = 0000ffff 00000000
	stda	%f22,[%i6+%o5]0x81	! Mem[0000000030181410] = ccbe12ae ffffffff
!	Mem[0000000030101408] = 000000ff, %l0 = ff0000ff00000000
	swapa	[%i4+%o4]0x89,%l0	! %l0 = 00000000000000ff
!	%l0 = 000000ff, %l1 = 000000ff, Mem[00000000100c1418] = ff004f86 005a005a
	stda	%l0,[%i3+0x018]%asi	! Mem[00000000100c1418] = 000000ff 000000ff
!	%l0 = 00000000000000ff, Mem[0000000021800041] = 00ffb2d9
	stb	%l0,[%o3+0x041]		! Mem[0000000021800040] = 00ffb2d9
!	%l1 = 00000000000000ff, Mem[00000000211c0000] = 00007bbb
	sth	%l1,[%o2+%g0]		! Mem[00000000211c0000] = 00ff7bbb
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = ffffffff, %l3 = 0000000000000000
	ldswa	[%i2+%o5]0x80,%l3	! %l3 = ffffffffffffffff

p0_label_427:
!	Mem[0000000010041410] = 5a0000ff, %l1 = 00000000000000ff
	lduwa	[%i1+%o5]0x80,%l1	! %l1 = 000000005a0000ff
!	Mem[0000000010101408] = ff000000, %l6 = 00000000ff0000ff
	lduha	[%i4+%o4]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000030081410] = ff000000, %f15 = 00000000
	lda	[%i2+%o5]0x81,%f15	! %f15 = ff000000
!	Mem[0000000030001408] = 000000005a005a00, %f12 = 00000000 000000ff
	ldda	[%i0+%o4]0x89,%f12	! %f12 = 00000000 5a005a00
!	Mem[0000000010101420] = ff0000ff, %l2 = 0000ffff, %l5 = 00ffffff
	add	%i4,0x20,%g1
	casa	[%g1]0x80,%l2,%l5	! %l5 = 00000000ff0000ff
!	Mem[0000000010141408] = 00000000000000ff, %l7 = 00000000000000ff
	ldxa	[%i5+%o4]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030081410] = 000000ff, %l1 = 000000005a0000ff
	lduwa	[%i2+%o5]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010041408] = 000000ff, %l2 = 000000000000ffff
	lduwa	[%i1+%o4]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010101414] = 00000000, %l2 = 00000000000000ff
	lduh	[%i4+0x014],%l2		! %l2 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f22 = ccbe12ae ffffffff, %l0 = 00000000000000ff
!	Mem[0000000030181408] = ff000000000000ff
	add	%i6,0x008,%g1
	stda	%f22,[%g1+%l0]ASI_PST32_SL ! Mem[0000000030181408] = ffffffffae12becc

p0_label_428:
!	Mem[0000000030141408] = 00000000, %l2 = 0000000000000000
	ldstuba	[%i5+%o4]0x89,%l2	! %l2 = 00000000000000ff
!	%l1 = 00000000000000ff, Mem[00000000300c1400] = 000000ff
	stwa	%l1,[%i3+%g0]0x89	! Mem[00000000300c1400] = 000000ff
!	%l0 = 00000000000000ff, Mem[0000000030141408] = 000000ff
	stha	%l0,[%i5+%o4]0x89	! Mem[0000000030141408] = 000000ff
!	%f5  = ae12becc, Mem[0000000030041400] = ff000000
	sta	%f5 ,[%i1+%g0]0x81	! Mem[0000000030041400] = ae12becc
!	Mem[0000000010001418] = ccbe12ae, %l6 = 0000000000000000
	swap	[%i0+0x018],%l6		! %l6 = 00000000ccbe12ae
!	Mem[0000000030181408] = ccbe12ae ffffffff, %l2 = 00000000, %l3 = ffffffff
	ldda	[%i6+%o4]0x89,%l2	! %l2 = 00000000ffffffff 00000000ccbe12ae
!	Mem[0000000010181400] = 00000000, %l6 = 00000000ccbe12ae, %asi = 80
	swapa	[%i6+0x000]%asi,%l6	! %l6 = 0000000000000000
!	%l0 = 00000000000000ff, Mem[0000000010181408] = ff0000ff
	stba	%l0,[%i6+%o4]0x88	! Mem[0000000010181408] = ff0000ff
!	%l5 = 00000000ff0000ff, Mem[0000000021800180] = 00ff2200, %asi = 80
	stha	%l5,[%o3+0x180]%asi	! Mem[0000000021800180] = 00ff2200
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = 00ff00ff, %l0 = 00000000000000ff
	ldsha	[%i3+%o4]0x81,%l0	! %l0 = 00000000000000ff

p0_label_429:
!	Mem[0000000030181408] = ffffffffae12becc, %f12 = 00000000 5a005a00
	ldda	[%i6+%o4]0x81,%f12	! %f12 = ffffffff ae12becc
!	Mem[0000000030101410] = ff000000, %l3 = 00000000ccbe12ae
	lduwa	[%i4+%o5]0x81,%l3	! %l3 = 00000000ff000000
!	Mem[0000000010181408] = 63c94fffff0000ff, %l3 = 00000000ff000000
	ldxa	[%i6+%o4]0x88,%l3	! %l3 = 63c94fffff0000ff
!	Mem[00000000300c1408] = 00ff00ff 00000000, %l2 = ffffffff, %l3 = ff0000ff
	ldda	[%i3+%o4]0x81,%l2	! %l2 = 0000000000ff00ff 0000000000000000
!	Mem[0000000010101408] = 000000ffffffffff, %f2  = 00000000 ffffffff
	ldda	[%i4+%o4]0x80,%f2 	! %f2  = 000000ff ffffffff
!	Mem[0000000010001408] = ff0000ff, %l1 = 00000000000000ff
	ldsba	[%i0+%o4]0x88,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000030041410] = ff000000, %l6 = 0000000000000000
	ldsha	[%i1+%o5]0x81,%l6	! %l6 = ffffffffffffff00
	membar	#Sync			! Added by membar checker (82)
!	Mem[0000000030041400] = ae12becc 000000ff ffffff00 00000000
!	Mem[0000000030041410] = ff000000 0000ffff 00000000 00000000
!	Mem[0000000030041420] = ffffff00 ff000000 000000ff ffffffff
!	Mem[0000000030041430] = 63c94f86 864f00ff 00000000 00000000
	ldda	[%i1]ASI_BLK_AIUSL,%f16	! Block Load from 0000000030041400
!	Mem[00000000201c0000] = ffffaf65, %l5 = 00000000ff0000ff
	lduba	[%o0+0x001]%asi,%l5	! %l5 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000010181434] = 00ffffcc, %l1 = ffffffffffffffff, %asi = 80
	swapa	[%i6+0x034]%asi,%l1	! %l1 = 0000000000ffffcc

p0_label_430:
!	%l6 = ffffffffffffff00, Mem[0000000010181400] = ae12becc
	stha	%l6,[%i6+%g0]0x88	! Mem[0000000010181400] = ae12ff00
!	%l0 = 00000000000000ff, Mem[0000000010101400] = 0000ffff
	stwa	%l0,[%i4+%g0]0x80	! Mem[0000000010101400] = 000000ff
!	%l2 = 00ff00ff, %l3 = 00000000, Mem[0000000010141408] = ff000000 00000000
	stda	%l2,[%i5+%o4]0x80	! Mem[0000000010141408] = 00ff00ff 00000000
!	Mem[0000000010181408] = ff0000ff, %l2 = 0000000000ff00ff
	swapa	[%i6+%o4]0x80,%l2	! %l2 = 00000000ff0000ff
!	%l2 = ff0000ff, %l3 = 00000000, Mem[0000000030001400] = ff000000 00000000
	stda	%l2,[%i0+%g0]0x81	! Mem[0000000030001400] = ff0000ff 00000000
!	%l3 = 0000000000000000, Mem[0000000030081408] = ffffffff
	stha	%l3,[%i2+%o4]0x89	! Mem[0000000030081408] = ffff0000
!	%l2 = 00000000ff0000ff, Mem[0000000010001410] = ffffffff
	stba	%l2,[%i0+%o5]0x88	! Mem[0000000010001410] = ffffffff
!	%f4  = ff000000 ae12becc, %l4 = 0000000000000000
!	Mem[0000000010101438] = 00000000864fffff
	add	%i4,0x038,%g1
	stda	%f4,[%g1+%l4]ASI_PST16_P ! Mem[0000000010101438] = 00000000864fffff
!	Mem[0000000030181400] = 5a005aff, %l7 = 00000000000000ff
	ldstuba	[%i6+%g0]0x89,%l7	! %l7 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081424] = 0000ffff, %f12 = ffffffff
	ld	[%i2+0x024],%f12	! %f12 = 0000ffff

!	Check Point 86 for processor 0

	set	p0_check_pt_data_86,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 0000000000ffffcc
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 00000000ff0000ff
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 0000000000000000
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l5,%g2			! %l5 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l6,%g2			! %l6 = ffffffffffffff00
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l7,%g2			! %l7 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x40],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = 000000ff ffffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x48],%g3
	std	%f12,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f12 = 0000ffff ae12becc
	bne	%xcc,p0_freg_check_fail
	mov	0xf12,%g1
	ldx	[%g4+0x50],%g3
	std	%f14,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f14 = 000000ff ff000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf14,%g1
	ldx	[%g4+0x58],%g3
	std	%f16,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f16 = ff000000 ccbe12ae
	bne	%xcc,p0_freg_check_fail
	mov	0xf16,%g1
	ldx	[%g4+0x60],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = 00000000 00ffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1
	ldx	[%g4+0x68],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = ffff0000 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1
	ldx	[%g4+0x70],%g3
	std	%f22,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f22 = 00000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf22,%g1
	ldx	[%g4+0x78],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = 000000ff 00ffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1
	ldx	[%g4+0x80],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = ffffffff ff000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1
	ldx	[%g4+0x88],%g3
	std	%f28,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f28 = ff004f86 864fc963
	bne	%xcc,p0_freg_check_fail
	mov	0xf28,%g1
	ldx	[%g4+0x90],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = 00000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 86 completed


p0_label_431:
!	Mem[0000000030041400] = ae12becc, %f10 = ffffffff
	lda	[%i1+%g0]0x81,%f10	! %f10 = ae12becc
!	Mem[0000000030181400] = ff5a005a, %l0 = 00000000000000ff
	ldswa	[%i6+%g0]0x81,%l0	! %l0 = ffffffffff5a005a
!	Mem[0000000010001404] = 000000ff, %f4  = ff000000
	lda	[%i0+0x004]%asi,%f4 	! %f4 = 000000ff
!	Mem[00000000300c1400] = ff000000, %l3 = 0000000000000000
	ldsba	[%i3+%g0]0x81,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010181408] = ff00ff00, %l4 = 0000000000000000
	lduba	[%i6+%o4]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000010081400] = 63c94f86, %l7 = 00000000000000ff
	ldsha	[%i2+%g0]0x80,%l7	! %l7 = 00000000000063c9
!	Mem[00000000300c1408] = 00000000 ff00ff00, %l2 = ff0000ff, %l3 = ffffffff
	ldda	[%i3+%o4]0x89,%l2	! %l2 = 00000000ff00ff00 0000000000000000
!	Mem[00000000201c0000] = ffffaf65, %l2 = 00000000ff00ff00
	ldsba	[%o0+0x001]%asi,%l2	! %l2 = ffffffffffffffff
!	Mem[00000000100c1410] = 00000000ff0000ff, %f8  = 000000ff ffffffff
	ldda	[%i3+%o5]0x80,%f8 	! %f8  = 00000000 ff0000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000030081408] = ffff0000, %l4 = 0000000000000000
	ldstuba	[%i2+%o4]0x89,%l4	! %l4 = 00000000000000ff

p0_label_432:
!	Mem[0000000030041408] = 00ffffff, %l4 = 0000000000000000
	swapa	[%i1+%o4]0x89,%l4	! %l4 = 0000000000ffffff
!	Mem[00000000211c0000] = 00ff7bbb, %l1 = 0000000000ffffcc
	ldstub	[%o2+%g0],%l1		! %l1 = 00000000000000ff
!	Mem[0000000010081400] = 864fc963, %l4 = 0000000000ffffff
	swapa	[%i2+%g0]0x88,%l4	! %l4 = 00000000864fc963
!	%l5 = 00000000000000ff, Mem[0000000030101400] = 0000ffff
	stba	%l5,[%i4+%g0]0x89	! Mem[0000000030101400] = 0000ffff
!	%f2  = 000000ff ffffffff, Mem[0000000030141400] = 000000ff ffffffff
	stda	%f2 ,[%i5+%g0]0x81	! Mem[0000000030141400] = 000000ff ffffffff
!	%l3 = 0000000000000000, Mem[0000000030081400] = 00000000
	stha	%l3,[%i2+%g0]0x89	! Mem[0000000030081400] = 00000000
!	Mem[0000000030001400] = ff0000ff, %l4 = 00000000864fc963
	ldstuba	[%i0+%g0]0x89,%l4	! %l4 = 000000ff000000ff
!	%f28 = ff004f86 864fc963, %l3 = 0000000000000000
!	Mem[0000000010041418] = ff00ff00db8bc354
	add	%i1,0x018,%g1
	stda	%f28,[%g1+%l3]ASI_PST16_P ! Mem[0000000010041418] = ff00ff00db8bc354
!	Mem[00000000300c1408] = ff00ff00, %l1 = 0000000000000000
	swapa	[%i3+%o4]0x89,%l1	! %l1 = 00000000ff00ff00
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = ff000000, %l3 = 0000000000000000
	lduwa	[%i1+%o5]0x81,%l3	! %l3 = 00000000ff000000

p0_label_433:
!	Mem[0000000030101400] = ffff0000, %l6 = ffffffffffffff00
	lduha	[%i4+%g0]0x81,%l6	! %l6 = 000000000000ffff
!	Mem[0000000021800000] = 1a7bd0b4, %l2 = ffffffffffffffff
	lduba	[%o3+0x000]%asi,%l2	! %l2 = 000000000000001a
!	Mem[0000000030081408] = ff00ffff, %l7 = 00000000000063c9
	ldsha	[%i2+%o4]0x81,%l7	! %l7 = ffffffffffffff00
!	Mem[0000000030001408] = 5a005a00, %l2 = 000000000000001a
	lduha	[%i0+%o4]0x89,%l2	! %l2 = 0000000000005a00
!	Mem[0000000010141408] = ff00ff00, %l2 = 0000000000005a00
	ldswa	[%i5+%o4]0x88,%l2	! %l2 = ffffffffff00ff00
!	Mem[0000000010081420] = ff00ffa50000ffff, %l7 = ffffffffffffff00
	ldxa	[%i2+0x020]%asi,%l7	! %l7 = ff00ffa50000ffff
!	Mem[0000000030041400] = ae12becc, %l2 = ffffffffff00ff00
	ldsha	[%i1+%g0]0x81,%l2	! %l2 = ffffffffffffae12
!	Mem[0000000030001408] = 5a005a00, %l7 = ff00ffa50000ffff
	ldsha	[%i0+%o4]0x89,%l7	! %l7 = 0000000000005a00
!	Mem[00000000100c142c] = 003100dc, %l7 = 0000000000005a00
	ldsba	[%i3+0x02d]%asi,%l7	! %l7 = 0000000000000031
!	Starting 10 instruction Store Burst
!	Mem[0000000030181408] = ffffffff, %l2 = ffffffffffffae12
	swapa	[%i6+%o4]0x89,%l2	! %l2 = 00000000ffffffff

p0_label_434:
!	Mem[0000000010181400] = 00ff12ae, %l4 = 00000000000000ff
	lduha	[%i6+%g0]0x80,%l4	! %l4 = 00000000000000ff
!	%f8  = 00000000 ff0000ff, Mem[0000000010081408] = ff0000ff 864f00ff
	stda	%f8 ,[%i2+%o4]0x80	! Mem[0000000010081408] = 00000000 ff0000ff
!	Mem[0000000030101410] = ff000000, %l7 = 0000000000000031
	ldstuba	[%i4+%o5]0x81,%l7	! %l7 = 000000ff000000ff
!	%l4 = 00000000000000ff, Mem[0000000010101400] = ff000000
	stwa	%l4,[%i4+%g0]0x88	! Mem[0000000010101400] = 000000ff
!	%f15 = ff000000, Mem[00000000100c1400] = ff0000ff
	sta	%f15,[%i3+%g0]0x80	! Mem[00000000100c1400] = ff000000
!	%l7 = 00000000000000ff, Mem[0000000030001408] = 5a005a00
	stba	%l7,[%i0+%o4]0x89	! Mem[0000000030001408] = 5a005aff
!	Mem[0000000010081408] = 00000000, %l3 = 00000000ff000000
	ldstuba	[%i2+%o4]0x88,%l3	! %l3 = 00000000000000ff
!	%l3 = 0000000000000000, Mem[0000000010141410] = 00ff00ff
	stha	%l3,[%i5+%o5]0x88	! Mem[0000000010141410] = 00ff0000
!	Mem[0000000030181410] = ccbe12ae, %l7 = 00000000000000ff
	swapa	[%i6+%o5]0x81,%l7	! %l7 = 00000000ccbe12ae
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = 00000000, %l4 = 00000000000000ff
	lduha	[%i3+%o4]0x89,%l4	! %l4 = 0000000000000000

p0_label_435:
!	Mem[0000000030181410] = ff000000, %l0 = ffffffffff5a005a
	ldswa	[%i6+%o5]0x89,%l0	! %l0 = ffffffffff000000
!	Mem[0000000010001410] = ffffffff, %l5 = 00000000000000ff
	ldsba	[%i0+%o5]0x80,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000021800100] = 00ffb49a, %l5 = ffffffffffffffff
	lduh	[%o3+0x100],%l5		! %l5 = 00000000000000ff
!	Mem[0000000030001400] = ff0000ff, %l6 = 000000000000ffff
	lduba	[%i0+%g0]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030141408] = 00000000000000ff, %f20 = ffff0000 000000ff
	ldda	[%i5+%o4]0x89,%f20	! %f20 = 00000000 000000ff
!	Mem[0000000030041408] = 0000000000000000, %l0 = ffffffffff000000
	ldxa	[%i1+%o4]0x81,%l0	! %l0 = 0000000000000000
!	Mem[000000001000142c] = ff000000, %l3 = 0000000000000000
	lduha	[%i0+0x02e]%asi,%l3	! %l3 = 0000000000000000
!	Mem[0000000010001420] = ff004f86, %l7 = 00000000ccbe12ae
	lduwa	[%i0+0x020]%asi,%l7	! %l7 = 00000000ff004f86
!	Mem[0000000020800000] = 00ff7d94, %l2 = 00000000ffffffff
	ldub	[%o1+%g0],%l2		! %l2 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l6 = 000000ff, %l7 = ff004f86, Mem[0000000010181400] = ae12ff00 ff000000
	stda	%l6,[%i6+%g0]0x88	! Mem[0000000010181400] = 000000ff ff004f86

!	Check Point 87 for processor 0

	set	p0_check_pt_data_87,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 0000000000000000
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 00000000ff00ff00
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 0000000000000000
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 0000000000000000
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 0000000000000000
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 00000000ff004f86
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = 000000ff ffffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x50],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 000000ff ae12becc
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x58],%g3
	std	%f8,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f8 = 00000000 ff0000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf08,%g1
	ldx	[%g4+0x60],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = ae12becc ff000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x68],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = 00000000 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1

!	Check Point 87 completed


p0_label_436:
!	%f10 = ae12becc, Mem[0000000010101408] = ff000000
	sta	%f10,[%i4+%o4]0x88	! Mem[0000000010101408] = ae12becc
!	%f20 = 00000000 000000ff, %l2 = 0000000000000000
!	Mem[0000000030141438] = ff000000a5000000
	add	%i5,0x038,%g1
	stda	%f20,[%g1+%l2]ASI_PST16_S ! Mem[0000000030141438] = ff000000a5000000
!	%f28 = ff004f86 864fc963, Mem[0000000010081410] = ffffffff 7b1a0000
	std	%f28,[%i2+%o5]	! Mem[0000000010081410] = ff004f86 864fc963
!	%l2 = 0000000000000000, Mem[0000000030181408] = ffffae12
	stwa	%l2,[%i6+%o4]0x89	! Mem[0000000030181408] = 00000000
!	%l0 = 0000000000000000, Mem[00000000300c1410] = ffff00ff
	stba	%l0,[%i3+%o5]0x81	! Mem[00000000300c1410] = 00ff00ff
!	Mem[0000000010181437] = ffffffff, %l5 = 00000000000000ff
	ldstuba	[%i6+0x037]%asi,%l5	! %l5 = 000000ff000000ff
	membar	#Sync			! Added by membar checker (83)
!	%f0  = 000000ff 000000ff, %l1 = 00000000ff00ff00
!	Mem[0000000030041418] = 0000000000000000
	add	%i1,0x018,%g1
	stda	%f0,[%g1+%l1]ASI_PST32_SL ! Mem[0000000030041418] = 0000000000000000
!	%l3 = 0000000000000000, Mem[0000000010001408] = ff0000ff
	stha	%l3,[%i0+%o4]0x80	! Mem[0000000010001408] = 000000ff
!	Mem[00000000100c1408] = 0000ffff, %l3 = 0000000000000000
	ldstuba	[%i3+%o4]0x88,%l3	! %l3 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = 00ffffff, %l0 = 0000000000000000
	ldswa	[%i5+%g0]0x80,%l0	! %l0 = 0000000000ffffff

p0_label_437:
!	Mem[00000000100c1410] = 00000000ff0000ff, %l3 = 00000000000000ff
	ldxa	[%i3+%o5]0x80,%l3	! %l3 = 00000000ff0000ff
!	Mem[0000000010181410] = 4f86000000000000, %l1 = 00000000ff00ff00
	ldxa	[%i6+%o5]0x88,%l1	! %l1 = 4f86000000000000
!	Mem[0000000010001410] = ffffffff, %l0 = 0000000000ffffff
	ldsba	[%i0+%o5]0x88,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000021800040] = 00ffb2d9, %l5 = 00000000000000ff
	ldsh	[%o3+0x040],%l5		! %l5 = 00000000000000ff
!	Mem[00000000100c1410] = 00000000, %l5 = 00000000000000ff
	lduba	[%i3+%o5]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000030001408] = 5a005aff, %l6 = 00000000000000ff
	ldsha	[%i0+%o4]0x89,%l6	! %l6 = 0000000000005aff
!	Mem[0000000030081410] = 000000ff, %l6 = 0000000000005aff
	ldsba	[%i2+%o5]0x89,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000030001400] = ff0000ff, %f16 = ff000000
	lda	[%i0+%g0]0x81,%f16	! %f16 = ff0000ff
!	Mem[00000000300c1410] = ff00ff00, %l5 = 0000000000000000
	ldsha	[%i3+%o5]0x89,%l5	! %l5 = ffffffffffffff00
!	Starting 10 instruction Store Burst
!	%l2 = 0000000000000000, Mem[0000000010041408] = ffffffff000000ff
	stxa	%l2,[%i1+%o4]0x88	! Mem[0000000010041408] = 0000000000000000

p0_label_438:
!	%l7 = 00000000ff004f86, Mem[0000000010141408] = ff00ff00
	stwa	%l7,[%i5+%o4]0x88	! Mem[0000000010141408] = ff004f86
!	%l2 = 0000000000000000, Mem[0000000010001400] = 00000000
	stwa	%l2,[%i0+%g0]0x88	! Mem[0000000010001400] = 00000000
!	%l4 = 00000000, %l5 = ffffff00, Mem[0000000030001410] = ff000000 ff000000
	stda	%l4,[%i0+%o5]0x81	! Mem[0000000030001410] = 00000000 ffffff00
!	%f18 = 00000000 00ffffff, Mem[00000000100c1410] = 00000000 ff0000ff
	stda	%f18,[%i3+%o5]0x88	! Mem[00000000100c1410] = 00000000 00ffffff
!	Mem[0000000010081400] = 00ffffff, %l2 = 0000000000000000
	ldstuba	[%i2+%g0]0x88,%l2	! %l2 = 000000ff000000ff
!	%l1 = 4f86000000000000, Mem[0000000030181400] = 5a005aff
	stwa	%l1,[%i6+%g0]0x89	! Mem[0000000030181400] = 00000000
!	%l6 = ffffffffffffffff, Mem[0000000030101400] = 0000ffff
	stha	%l6,[%i4+%g0]0x89	! Mem[0000000030101400] = 0000ffff
!	Mem[0000000010041438] = 0000dc45, %l6 = ffffffffffffffff
	swap	[%i1+0x038],%l6		! %l6 = 000000000000dc45
!	Mem[0000000030181408] = 00000000, %l2 = 00000000000000ff
	swapa	[%i6+%o4]0x81,%l2	! %l2 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = 00000000, %l1 = 4f86000000000000
	lduwa	[%i3+%o4]0x89,%l1	! %l1 = 0000000000000000

p0_label_439:
!	Mem[0000000010181400] = ff000000, %l4 = 0000000000000000
	lduba	[%i6+%g0]0x80,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010101410] = ff00000000000000, %l6 = 000000000000dc45
	ldxa	[%i4+%o5]0x80,%l6	! %l6 = ff00000000000000
!	Mem[0000000010181400] = 000000ff, %f25 = 00ffffff
	lda	[%i6+%g0]0x88,%f25	! %f25 = 000000ff
!	Mem[0000000030101410] = ff000000, %l0 = ffffffffffffffff
	ldswa	[%i4+%o5]0x81,%l0	! %l0 = ffffffffff000000
!	Mem[0000000010181410] = 00000000, %f20 = 00000000
	lda	[%i6+%o5]0x88,%f20	! %f20 = 00000000
!	Mem[0000000010081410] = 864f00ff, %l4 = 00000000000000ff
	lduwa	[%i2+%o5]0x88,%l4	! %l4 = 00000000864f00ff
!	Mem[0000000030141410] = ff000000, %l1 = 0000000000000000
	lduwa	[%i5+%o5]0x89,%l1	! %l1 = 00000000ff000000
!	Mem[0000000010001428] = 0000ff00, %l1 = 00000000ff000000
	ldswa	[%i0+0x028]%asi,%l1	! %l1 = 000000000000ff00
!	Mem[0000000030041410] = ff000000, %l0 = ffffffffff000000
	ldsba	[%i1+%o5]0x81,%l0	! %l0 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l5 = ffffffffffffff00, Mem[0000000010081410] = 864f00ff
	stba	%l5,[%i2+%o5]0x88	! Mem[0000000010081410] = 864f0000

p0_label_440:
!	%l6 = 00000000, %l7 = ff004f86, Mem[0000000030101400] = ffff0000 a5ff00ff
	stda	%l6,[%i4+%g0]0x81	! Mem[0000000030101400] = 00000000 ff004f86
!	%f13 = ae12becc, Mem[0000000030041400] = ccbe12ae
	sta	%f13,[%i1+%g0]0x89	! Mem[0000000030041400] = ae12becc
!	Mem[0000000010001400] = 00000000, %l7 = 00000000ff004f86
	ldstuba	[%i0+%g0]0x80,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030081400] = 00000000, %l0 = ffffffffffffffff
	ldstuba	[%i2+%g0]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[00000000201c0001] = ffffaf65, %l3 = 00000000ff0000ff
	ldstub	[%o0+0x001],%l3		! %l3 = 000000ff000000ff
!	%f22 = 00000000 00000000, Mem[0000000030141400] = 000000ff ffffffff
	stda	%f22,[%i5+%g0]0x81	! Mem[0000000030141400] = 00000000 00000000
!	Mem[000000001008142d] = ff4fc963, %l4 = 00000000864f00ff
	ldstub	[%i2+0x02d],%l4		! %l4 = 0000004f000000ff
!	%l5 = ffffffffffffff00, Mem[000000001010143c] = 864fffff
	stw	%l5,[%i4+0x03c]		! Mem[000000001010143c] = ffffff00
!	Mem[0000000010001430] = ffc94fff, %l7 = 0000000000000000
	swap	[%i0+0x030],%l7		! %l7 = 00000000ffc94fff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = 00000000 0000864f, %l4 = 0000004f, %l5 = ffffff00
	ldd	[%i6+%o5],%l4		! %l4 = 0000000000000000 000000000000864f

!	Check Point 88 for processor 0

	set	p0_check_pt_data_88,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 0000000000000000
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 000000000000ff00
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 0000000000000000
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 0000000000000000
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 000000000000864f
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = ff00000000000000
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 00000000ffc94fff
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 000000ff ae12becc
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x50],%g3
	std	%f16,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f16 = ff0000ff ccbe12ae
	bne	%xcc,p0_freg_check_fail
	mov	0xf16,%g1
	ldx	[%g4+0x58],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = 00000000 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1
	ldx	[%g4+0x60],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = 000000ff 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1

!	Check Point 88 completed


p0_label_441:
!	Mem[0000000010081404] = 00ff00ff, %l6 = ff00000000000000
	ldub	[%i2+0x006],%l6		! %l6 = 0000000000000000
!	Mem[0000000010101408] = ccbe12aeffffffff, %f0  = 000000ff 000000ff
	ldd	[%i4+%o4],%f0 		! %f0  = ccbe12ae ffffffff
!	Mem[00000000300c1400] = 000000ff, %l7 = 00000000ffc94fff
	lduwa	[%i3+%g0]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010141410] = 0000ff00, %f14 = 000000ff
	lda	[%i5+%o5]0x80,%f14	! %f14 = 0000ff00
!	Mem[0000000030101408] = 00000000005a005a, %f8  = 00000000 ff0000ff
	ldda	[%i4+%o4]0x81,%f8 	! %f8  = 00000000 005a005a
!	Mem[0000000030041400] = ccbe12ae, %f7  = 00000000
	lda	[%i1+%g0]0x81,%f7 	! %f7 = ccbe12ae
!	Mem[0000000030001410] = 00000000, %l7 = 00000000000000ff
	ldsba	[%i0+%o5]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000010001408] = 000000ff00000000, %f4  = 000000ff ae12becc
	ldda	[%i0+%o4]0x80,%f4 	! %f4  = 000000ff 00000000
!	Mem[0000000010081408] = ff000000, %l2 = 0000000000000000
	ldsba	[%i2+%o4]0x80,%l2	! %l2 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	Mem[00000000211c0000] = ffff7bbb, %l7 = 0000000000000000
	ldstub	[%o2+%g0],%l7		! %l7 = 000000ff000000ff

p0_label_442:
!	Mem[0000000030001408] = 5a005aff, %l0 = 0000000000000000
	swapa	[%i0+%o4]0x89,%l0	! %l0 = 000000005a005aff
!	%f29 = 864fc963, Mem[0000000010001400] = 000000ff
	sta	%f29,[%i0+%g0]0x88	! Mem[0000000010001400] = 864fc963
!	Mem[0000000020800001] = 00ff7d94, %l6 = 0000000000000000
	ldstuba	[%o1+0x001]%asi,%l6	! %l6 = 000000ff000000ff
!	Mem[0000000010181410] = 00000000, %l1 = 000000000000ff00
	lduwa	[%i6+%o5]0x80,%l1	! %l1 = 0000000000000000
!	%l2 = ffffffff, %l3 = 000000ff, Mem[00000000300c1400] = ff000000 00000000
	stda	%l2,[%i3+%g0]0x81	! Mem[00000000300c1400] = ffffffff 000000ff
!	%l4 = 00000000, %l5 = 0000864f, Mem[0000000030101400] = 00000000 864f00ff
	stda	%l4,[%i4+%g0]0x89	! Mem[0000000030101400] = 00000000 0000864f
!	Mem[00000000100c1408] = 0000ffff, %l1 = 0000000000000000
	swapa	[%i3+%o4]0x88,%l1	! %l1 = 000000000000ffff
!	Mem[0000000030001400] = ff0000ff, %l0 = 000000005a005aff
	ldstuba	[%i0+%g0]0x81,%l0	! %l0 = 000000ff000000ff
!	Mem[0000000030001410] = 00000000, %l7 = 00000000000000ff
	swapa	[%i0+%o5]0x89,%l7	! %l7 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010181434] = ffffffff, %l2 = ffffffffffffffff
	ldsba	[%i6+0x034]%asi,%l2	! %l2 = ffffffffffffffff

p0_label_443:
!	Mem[0000000030141410] = 000000ff, %l3 = 00000000000000ff
	lduwa	[%i5+%o5]0x81,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010101400] = ff00000000000000, %f6  = 00000000 ccbe12ae
	ldda	[%i4+%g0]0x80,%f6 	! %f6  = ff000000 00000000
!	Mem[0000000010041410] = 5a0000ffff000000, %l3 = 00000000000000ff
	ldxa	[%i1+%o5]0x80,%l3	! %l3 = 5a0000ffff000000
!	Mem[0000000030001400] = 00000000ff0000ff, %f24 = 000000ff 000000ff
	ldda	[%i0+%g0]0x89,%f24	! %f24 = 00000000 ff0000ff
!	Mem[00000000100c1400] = ff00000000ffffff, %f4  = 000000ff 00000000
	ldda	[%i3+%g0]0x80,%f4 	! %f4  = ff000000 00ffffff
!	Mem[0000000010081408] = ff000000, %l4 = 0000000000000000
	ldsba	[%i2+%o4]0x80,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010041410] = 5a0000ff, %l5 = 000000000000864f
	ldswa	[%i1+%o5]0x80,%l5	! %l5 = 000000005a0000ff
!	Mem[0000000030001410] = 000000ff, %l3 = 5a0000ffff000000
	ldswa	[%i0+%o5]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[00000000300c1410] = 00ff00ff, %l2 = ffffffffffffffff
	ldsha	[%i3+%o5]0x81,%l2	! %l2 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%f19 = 00ffffff, Mem[0000000010001400] = 864fc963
	sta	%f19,[%i0+%g0]0x88	! Mem[0000000010001400] = 00ffffff

p0_label_444:
!	%l2 = 000000ff, %l3 = 000000ff, Mem[0000000030001400] = ff0000ff 00000000
	stda	%l2,[%i0+%g0]0x89	! Mem[0000000030001400] = 000000ff 000000ff
!	%l4 = ffffffffffffffff, Mem[0000000010041408] = 00000000
	stba	%l4,[%i1+%o4]0x88	! Mem[0000000010041408] = 000000ff
!	%f8  = 00000000 005a005a, Mem[0000000030181408] = 000000ff ae12becc
	stda	%f8 ,[%i6+%o4]0x81	! Mem[0000000030181408] = 00000000 005a005a
!	%l5 = 000000005a0000ff, Mem[00000000100c1408] = 00000000
	stwa	%l5,[%i3+%o4]0x80	! Mem[00000000100c1408] = 5a0000ff
!	%l1 = 000000000000ffff, Mem[00000000100c1414] = 00000000, %asi = 80
	stwa	%l1,[%i3+0x014]%asi	! Mem[00000000100c1414] = 0000ffff
!	Mem[0000000010001408] = ff000000, %l0 = 00000000000000ff
	ldstuba	[%i0+%o4]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010041430] = ff004f86864fc963, %l0 = 0000000000000000, %l3 = 00000000000000ff
	add	%i1,0x30,%g1
	casxa	[%g1]0x80,%l0,%l3	! %l3 = ff004f86864fc963
	membar	#Sync			! Added by membar checker (84)
!	Mem[0000000010141400] = 00ffffff 000000ff 864f00ff 00000000
!	Mem[0000000010141410] = 0000ff00 5affff00 00000000 ffffffff
!	Mem[0000000010141420] = 00000000 00000000 c3540000 00000000
!	Mem[0000000010141430] = ff0000ff 00000000 a96e6a5a ff000000
	ldda	[%i5]ASI_BLK_AIUP,%f0	! Block Load from 0000000010141400
!	%l7 = 0000000000000000, Mem[0000000030081400] = 000000ff
	stba	%l7,[%i2+%g0]0x89	! Mem[0000000030081400] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010081414] = 864fc963, %l6 = 00000000000000ff
	lduwa	[%i2+0x014]%asi,%l6	! %l6 = 00000000864fc963

p0_label_445:
!	Mem[0000000010141410] = 0000ff00, %l5 = 000000005a0000ff
	lduwa	[%i5+0x010]%asi,%l5	! %l5 = 000000000000ff00
!	Mem[0000000030181408] = 00000000, %l3 = ff004f86864fc963
	lduwa	[%i6+%o4]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000010101400] = 000000ff, %l6 = 00000000864fc963
	lduwa	[%i4+%g0]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010141424] = 00000000, %l6 = 00000000000000ff
	ldsw	[%i5+0x024],%l6		! %l6 = 0000000000000000
!	Mem[000000001014140c] = 00000000, %f26 = ffffffff
	lda	[%i5+0x00c]%asi,%f26	! %f26 = 00000000
!	Mem[0000000010001400] = ffffff00, %l1 = 000000000000ffff
	ldsba	[%i0+%g0]0x80,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010141408] = ff004f86, %l6 = 0000000000000000
	ldsba	[%i5+%o4]0x88,%l6	! %l6 = ffffffffffffff86
!	Mem[0000000010101408] = ccbe12ae, %l2 = 00000000000000ff
	ldswa	[%i4+%o4]0x80,%l2	! %l2 = ffffffffccbe12ae
!	Mem[0000000010041400] = 00000000000000ff, %l5 = 000000000000ff00
	ldxa	[%i1+%g0]0x88,%l5	! %l5 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000010181402] = ff000000, %l0 = 0000000000000000
	ldstub	[%i6+0x002],%l0		! %l0 = 00000000000000ff

!	Check Point 89 for processor 0

	set	p0_check_pt_data_89,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 0000000000000000
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = ffffffffffffffff
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = ffffffffccbe12ae
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 0000000000000000
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = ffffffffffffffff
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = ffffffffffffff86
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 0000000000000000
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = 00ffffff 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x50],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = 864f00ff 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x58],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 0000ff00 5affff00
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x60],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 00000000 ffffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x68],%g3
	std	%f8,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f8 = 00000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf08,%g1
	ldx	[%g4+0x70],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = c3540000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x78],%g3
	std	%f12,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f12 = ff0000ff 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf12,%g1
	ldx	[%g4+0x80],%g3
	std	%f14,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f14 = a96e6a5a ff000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf14,%g1
	ldx	[%g4+0x88],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = 00000000 ff0000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1
	ldx	[%g4+0x90],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = 00000000 ff000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1

!	Check Point 89 completed


p0_label_446:
!	%l4 = ffffffff, %l5 = 000000ff, Mem[0000000030181408] = 00000000 5a005a00
	stda	%l4,[%i6+%o4]0x89	! Mem[0000000030181408] = ffffffff 000000ff
!	%l7 = 0000000000000000, Mem[00000000300c1400] = ffffffff
	stha	%l7,[%i3+%g0]0x81	! Mem[00000000300c1400] = 0000ffff
!	%l4 = ffffffff, %l5 = 000000ff, Mem[0000000030001410] = ff000000 ffffff00
	stda	%l4,[%i0+%o5]0x81	! Mem[0000000030001410] = ffffffff 000000ff
!	%f6  = 00000000 ffffffff, Mem[0000000010081428] = 864f00ff ffffc963
	std	%f6 ,[%i2+0x028]	! Mem[0000000010081428] = 00000000 ffffffff
!	Mem[0000000030141400] = 00000000, %l6 = ffffffffffffff86
	ldstuba	[%i5+%g0]0x89,%l6	! %l6 = 00000000000000ff
!	%f21 = 000000ff, Mem[0000000030141410] = ff000000
	sta	%f21,[%i5+%o5]0x89	! Mem[0000000030141410] = 000000ff
!	%f16 = ff0000ff ccbe12ae 00000000 00ffffff
!	%f20 = 00000000 000000ff 00000000 00000000
!	%f24 = 00000000 ff0000ff 00000000 ff000000
!	%f28 = ff004f86 864fc963 00000000 00000000
	stda	%f16,[%i1]ASI_BLK_P	! Block Store to 0000000010041400
!	Mem[0000000010101420] = ff0000ff000000ff, %l7 = 0000000000000000, %l2 = ffffffffccbe12ae
	add	%i4,0x20,%g1
	casxa	[%g1]0x80,%l7,%l2	! %l2 = ff0000ff000000ff
!	%f12 = ff0000ff 00000000, Mem[00000000100c1410] = ffffff00 0000ffff
	stda	%f12,[%i3+%o5]0x80	! Mem[00000000100c1410] = ff0000ff 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = ff0000ff, %l3 = 0000000000000000
	lduba	[%i0+%o4]0x88,%l3	! %l3 = 00000000000000ff

p0_label_447:
!	Mem[0000000030041410] = ffff0000000000ff, %f6  = 00000000 ffffffff
	ldda	[%i1+%o5]0x89,%f6 	! %f6  = ffff0000 000000ff
!	Mem[0000000030041410] = ff000000, %l6 = 0000000000000000
	ldsba	[%i1+%o5]0x81,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010181404] = 864f00ff, %l5 = 00000000000000ff
	lduh	[%i6+0x006],%l5		! %l5 = 00000000000000ff
!	Mem[0000000010141408] = 864f00ff, %f10 = c3540000
	lda	[%i5+%o4]0x80,%f10	! %f10 = 864f00ff
!	Mem[00000000300c1410] = 00ff00ff, %l1 = ffffffffffffffff
	ldswa	[%i3+%o5]0x81,%l1	! %l1 = 0000000000ff00ff
!	Mem[00000000100c1400] = ff000000, %l1 = 0000000000ff00ff
	ldsba	[%i3+%g0]0x80,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010001400] = ffffff00, %l1 = ffffffffffffffff
	ldsha	[%i0+%g0]0x80,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000030081410] = ff000000ae12becc, %f10 = 864f00ff 00000000
	ldda	[%i2+%o5]0x81,%f10	! %f10 = ff000000 ae12becc
!	Mem[0000000010141410] = 00ff0000, %l6 = ffffffffffffffff
	lduba	[%i5+%o5]0x88,%l6	! %l6 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010101400] = 000000ff, %l6 = 0000000000000000
	ldstuba	[%i4+%g0]0x88,%l6	! %l6 = 000000ff000000ff

p0_label_448:
!	%l4 = ffffffff, %l5 = 000000ff, Mem[0000000030081400] = 00000000 ff000000
	stda	%l4,[%i2+%g0]0x89	! Mem[0000000030081400] = ffffffff 000000ff
!	%l3 = 00000000000000ff, Mem[0000000010101424] = 000000ff
	stw	%l3,[%i4+0x024]		! Mem[0000000010101424] = 000000ff
!	Mem[0000000030141400] = ff000000, %l1 = ffffffffffffffff
	ldstuba	[%i5+%g0]0x81,%l1	! %l1 = 000000ff000000ff
!	%f4  = 0000ff00 5affff00, %l0 = 0000000000000000
!	Mem[00000000100c1428] = ff000000003100dc
	add	%i3,0x028,%g1
	stda	%f4,[%g1+%l0]ASI_PST8_PL ! Mem[00000000100c1428] = ff000000003100dc
!	Mem[0000000010101400] = ff000000, %l6 = 00000000000000ff
	swapa	[%i4+%g0]0x80,%l6	! %l6 = 00000000ff000000
!	%f12 = ff0000ff 00000000, Mem[0000000010081408] = ff000000 ff0000ff
	stda	%f12,[%i2+%o4]0x80	! Mem[0000000010081408] = ff0000ff 00000000
	membar	#Sync			! Added by membar checker (85)
!	Mem[0000000010041434] = 864fc963, %l7 = 00000000, %l1 = 000000ff
	add	%i1,0x34,%g1
	casa	[%g1]0x80,%l7,%l1	! %l1 = 00000000864fc963
!	%f30 = 00000000, Mem[0000000030081410] = 000000ff
	sta	%f30,[%i2+%o5]0x89	! Mem[0000000030081410] = 00000000
!	Mem[0000000030101400] = 00000000, %l6 = 00000000ff000000
	swapa	[%i4+%g0]0x89,%l6	! %l6 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010101420] = ff0000ff, %l6 = 0000000000000000
	ldub	[%i4+0x023],%l6		! %l6 = 00000000000000ff

p0_label_449:
!	Mem[0000000030101400] = 0000864f ff000000, %l2 = 000000ff, %l3 = 000000ff
	ldda	[%i4+%g0]0x89,%l2	! %l2 = 00000000ff000000 000000000000864f
!	Mem[00000000300c1408] = 0000000000000000, %f20 = 00000000 000000ff
	ldda	[%i3+%o4]0x81,%f20	! %f20 = 00000000 00000000
!	Mem[0000000010141408] = ff004f86, %l4 = ffffffffffffffff
	ldswa	[%i5+%o4]0x88,%l4	! %l4 = ffffffffff004f86
!	Mem[0000000010001434] = 00000000, %l1 = 00000000864fc963
	ldsw	[%i0+0x034],%l1		! %l1 = 0000000000000000
!	Mem[0000000030141410] = ff000000000000ff, %f2  = 864f00ff 00000000
	ldda	[%i5+%o5]0x89,%f2 	! %f2  = ff000000 000000ff
!	Mem[0000000010101410] = ff000000, %l7 = 0000000000000000
	ldsha	[%i4+%o5]0x80,%l7	! %l7 = ffffffffffffff00
!	Mem[0000000030181410] = ff000000, %f26 = 00000000
	lda	[%i6+%o5]0x89,%f26	! %f26 = ff000000
!	Mem[00000000218001c0] = ffff397e, %l1 = 0000000000000000
	lduha	[%o3+0x1c0]%asi,%l1	! %l1 = 000000000000ffff
!	Mem[0000000030141410] = 000000ff, %l6 = 00000000000000ff
	ldswa	[%i5+%o5]0x89,%l6	! %l6 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l5 = 00000000000000ff, Mem[0000000010101400] = 000000ff
	stha	%l5,[%i4+%g0]0x80	! Mem[0000000010101400] = 00ff00ff

p0_label_450:
!	Mem[00000000100c1438] = 0000000000ffffff, %l6 = 00000000000000ff, %l6 = 00000000000000ff
	add	%i3,0x38,%g1
	casxa	[%g1]0x80,%l6,%l6	! %l6 = 0000000000ffffff
!	%l2 = ff000000, %l3 = 0000864f, Mem[00000000100c1408] = 5a0000ff ffffffff
	stda	%l2,[%i3+%o4]0x80	! Mem[00000000100c1408] = ff000000 0000864f
!	Mem[0000000030001400] = 000000ff, %l7 = ffffffffffffff00
	swapa	[%i0+%g0]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010081410] = 864f0000, %l6 = 0000000000ffffff
	ldstuba	[%i2+%o5]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[000000001004143c] = 00000000, %l3 = 000000000000864f
	swap	[%i1+0x03c],%l3		! %l3 = 0000000000000000
!	%f16 = ff0000ff ccbe12ae 00000000 00ffffff
!	%f20 = 00000000 00000000 00000000 00000000
!	%f24 = 00000000 ff0000ff ff000000 ff000000
!	%f28 = ff004f86 864fc963 00000000 00000000
	stda	%f16,[%i2]ASI_BLK_P	! Block Store to 0000000010081400
!	%l1 = 000000000000ffff, Mem[0000000030001408] = 0000000000000000
	stxa	%l1,[%i0+%o4]0x81	! Mem[0000000030001408] = 000000000000ffff
!	%l0 = 00000000, %l1 = 0000ffff, Mem[0000000010041408] = 00000000 00ffffff
	stda	%l0,[%i1+%o4]0x80	! Mem[0000000010041408] = 00000000 0000ffff
!	%l6 = 00000000, %l7 = 000000ff, Mem[0000000010041410] = 00000000 ff000000
	stda	%l6,[%i1+%o5]0x88	! Mem[0000000010041410] = 00000000 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = ff00ff00, %l6 = 0000000000000000
	lduha	[%i6+%o4]0x88,%l6	! %l6 = 000000000000ff00

!	Check Point 90 for processor 0

	set	p0_check_pt_data_90,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l1,%g2			! %l1 = 000000000000ffff
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l3,%g2			! %l3 = 0000000000000000
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l4,%g2			! %l4 = ffffffffff004f86
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l5,%g2			! %l5 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l6,%g2			! %l6 = 000000000000ff00
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l7,%g2			! %l7 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x38],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = ff000000 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x40],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = ffff0000 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x48],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = ff000000 ae12becc
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x50],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = 00000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1
	ldx	[%g4+0x58],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = ff000000 ff000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1

!	Check Point 90 completed


p0_label_451:
!	Mem[0000000010141410] = 0000ff005affff00, %f6  = ffff0000 000000ff
	ldda	[%i5+%o5]0x80,%f6 	! %f6  = 0000ff00 5affff00
	membar	#Sync			! Added by membar checker (86)
!	Mem[0000000010081428] = ff000000ff000000, %f4  = 0000ff00 5affff00
	ldda	[%i2+0x028]%asi,%f4 	! %f4  = ff000000 ff000000
!	Mem[0000000010041400] = ff0000ff, %l5 = 00000000000000ff
	ldsha	[%i1+%g0]0x80,%l5	! %l5 = ffffffffffffff00
!	Mem[0000000030101400] = 000000ff, %l3 = 0000000000000000
	ldsha	[%i4+%g0]0x81,%l3	! %l3 = 0000000000000000
!	Code Fragment 3
p0_fragment_11:
!	%l0 = 0000000000000000
	setx	0x2d5de9079c7d4303,%g7,%l0 ! %l0 = 2d5de9079c7d4303
!	%l1 = 000000000000ffff
	setx	0x1ad6390849cca4b3,%g7,%l1 ! %l1 = 1ad6390849cca4b3
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 2d5de9079c7d4303
	setx	0xaf667db84a47a971,%g7,%l0 ! %l0 = af667db84a47a971
!	%l1 = 1ad6390849cca4b3
	setx	0x33c7d697d36e439b,%g7,%l1 ! %l1 = 33c7d697d36e439b
!	Mem[00000000100c1410] = ff0000ff00000000, %f28 = ff004f86 864fc963
	ldda	[%i3+%o5]0x80,%f28	! %f28 = ff0000ff 00000000
!	Mem[0000000030101400] = 000000ff4f860000, %l4 = ffffffffff004f86
	ldxa	[%i4+%g0]0x81,%l4	! %l4 = 000000ff4f860000
!	Mem[0000000010081410] = 0000000000000000, %f16 = ff0000ff ccbe12ae
	ldda	[%i2+%o5]0x80,%f16	! %f16 = 00000000 00000000
!	Mem[0000000030181400] = 00000000 ffffffff, %l2 = ff000000, %l3 = 00000000
	ldda	[%i6+%g0]0x81,%l2	! %l2 = 0000000000000000 00000000ffffffff
!	Starting 10 instruction Store Burst
!	Mem[000000001018140c] = ff4fc963, %l3 = ffffffff, %l3 = ffffffff
	add	%i6,0x0c,%g1
	casa	[%g1]0x80,%l3,%l3	! %l3 = 00000000ff4fc963

p0_label_452:
!	Mem[00000000300c1410] = 00ff00ff, %l0 = af667db84a47a971
	ldstuba	[%i3+%o5]0x81,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010101400] = 00ff00ff, %l0 = 0000000000000000
	ldstuba	[%i4+%g0]0x80,%l0	! %l0 = 00000000000000ff
!	%l0 = 0000000000000000, Mem[00000000300c1408] = 00000000
	stha	%l0,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00000000
!	%f12 = ff0000ff 00000000, %l1 = 33c7d697d36e439b
!	Mem[0000000010081420] = 00000000ff0000ff
	add	%i2,0x020,%g1
	stda	%f12,[%g1+%l1]ASI_PST16_P ! Mem[0000000010081420] = ff00000000000000
!	Mem[0000000010041424] = ff0000ff, %l2 = 0000000000000000
	swap	[%i1+0x024],%l2		! %l2 = 00000000ff0000ff
!	Mem[0000000030141410] = ff000000, %l6 = 000000000000ff00
	ldstuba	[%i5+%o5]0x81,%l6	! %l6 = 000000ff000000ff
!	%l2 = ff0000ff, %l3 = ff4fc963, Mem[0000000010181400] = 00ff00ff ff004f86
	stda	%l2,[%i6+%g0]0x88	! Mem[0000000010181400] = ff0000ff ff4fc963
!	Mem[0000000010001410] = ffffffff, %l6 = 00000000000000ff
	swapa	[%i0+%o5]0x88,%l6	! %l6 = 00000000ffffffff
!	Mem[0000000010001418] = 00000000ffffffff, %l7 = 00000000000000ff, %l4 = 000000ff4f860000
	add	%i0,0x18,%g1
	casxa	[%g1]0x80,%l7,%l4	! %l4 = 00000000ffffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = 0000864fff000000, %l4 = 00000000ffffffff
	ldxa	[%i4+%g0]0x89,%l4	! %l4 = 0000864fff000000

p0_label_453:
!	Mem[0000000010181410] = 00000000, %l5 = ffffffffffffff00
	lduha	[%i6+0x012]%asi,%l5	! %l5 = 0000000000000000
!	Mem[0000000010001410] = ff000000, %l4 = 0000864fff000000
	ldsba	[%i0+%o5]0x80,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000030141400] = ff000000, %l5 = 0000000000000000
	lduha	[%i5+%g0]0x81,%l5	! %l5 = 000000000000ff00
!	Mem[0000000030141408] = 000000ff, %l2 = 00000000ff0000ff
	lduba	[%i5+%o4]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[00000000201c0000] = ffffaf65, %l7 = 00000000000000ff
	ldsh	[%o0+%g0],%l7		! %l7 = ffffffffffffffff
!	Mem[0000000030181408] = ffffffff, %l3 = 00000000ff4fc963
	lduwa	[%i6+%o4]0x89,%l3	! %l3 = 00000000ffffffff
!	Mem[0000000010181408] = 63c94fffff00ff00, %l1 = 33c7d697d36e439b
	ldxa	[%i6+%o4]0x88,%l1	! %l1 = 63c94fffff00ff00
!	Mem[0000000010181410] = 00000000, %f2  = ff000000
	lda	[%i6+%o5]0x88,%f2 	! %f2 = 00000000
!	Mem[00000000300c1400] = ffff0000, %l3 = 00000000ffffffff
	ldsha	[%i3+%g0]0x89,%l3	! %l3 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010041434] = 864fc963, %l1 = 63c94fffff00ff00, %asi = 80
	swapa	[%i1+0x034]%asi,%l1	! %l1 = 00000000864fc963

p0_label_454:
!	%l6 = ffffffff, %l7 = ffffffff, Mem[00000000100c1438] = 00000000 00ffffff
	stda	%l6,[%i3+0x038]%asi	! Mem[00000000100c1438] = ffffffff ffffffff
!	Mem[0000000030041410] = 000000ff, %l6 = 00000000ffffffff
	swapa	[%i1+%o5]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[00000000100c1410] = ff0000ff, %l4 = ffffffffffffffff
	swapa	[%i3+%o5]0x80,%l4	! %l4 = 00000000ff0000ff
!	%l1 = 00000000864fc963, Mem[0000000030001410] = ffffffff
	stba	%l1,[%i0+%o5]0x89	! Mem[0000000030001410] = ffffff63
!	%l2 = 00000000000000ff, Mem[0000000030101400] = 0000864fff000000
	stxa	%l2,[%i4+%g0]0x89	! Mem[0000000030101400] = 00000000000000ff
!	%f24 = 00000000 ff0000ff, Mem[0000000030141400] = 000000ff 00000000
	stda	%f24,[%i5+%g0]0x89	! Mem[0000000030141400] = 00000000 ff0000ff
!	%f6  = 0000ff00 5affff00, %l4 = 00000000ff0000ff
!	Mem[0000000010181400] = ff0000ff63c94fff
	stda	%f6,[%i6+%l4]ASI_PST8_PL ! Mem[0000000010181400] = 00ffff5a00ff0000
!	%l0 = 0000000000000000, Mem[0000000010001400] = ffffff00
	stha	%l0,[%i0+%g0]0x80	! Mem[0000000010001400] = 0000ff00
!	%l1 = 00000000864fc963, Mem[0000000030141410] = 000000ff
	stwa	%l1,[%i5+%o5]0x89	! Mem[0000000030141410] = 864fc963
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = ff0000ff, %l2 = 00000000000000ff
	lduha	[%i1+%g0]0x88,%l2	! %l2 = 00000000000000ff

p0_label_455:
!	Mem[0000000010041400] = ae12beccff0000ff, %l6 = 00000000000000ff
	ldxa	[%i1+%g0]0x88,%l6	! %l6 = ae12beccff0000ff
!	Mem[0000000010041408] = 00000000, %l1 = 00000000864fc963
	ldswa	[%i1+%o4]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000010041400] = ae12beccff0000ff, %f20 = 00000000 00000000
	ldda	[%i1+%g0]0x88,%f20	! %f20 = ae12becc ff0000ff
!	Mem[00000000100c142c] = 003100dc, %f31 = 00000000
	ld	[%i3+0x02c],%f31	! %f31 = 003100dc
!	Mem[0000000010141400] = 00ffffff, %l0 = 0000000000000000
	lduha	[%i5+%g0]0x80,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010081400] = ff0000ff, %f0  = 00ffffff
	lda	[%i2+%g0]0x88,%f0 	! %f0 = ff0000ff
!	Mem[0000000010081410] = 00000000, %l0 = 00000000000000ff
	ldsba	[%i2+%o5]0x80,%l0	! %l0 = 0000000000000000
!	Mem[00000000211c0000] = ffff7bbb, %l0 = 0000000000000000
	lduba	[%o2+0x001]%asi,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030141408] = ff000000, %l1 = 0000000000000000
	ldswa	[%i5+%o4]0x81,%l1	! %l1 = ffffffffff000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030041410] = ffffffff, %l6 = ae12beccff0000ff
	swapa	[%i1+%o5]0x89,%l6	! %l6 = 00000000ffffffff

!	Check Point 91 for processor 0

	set	p0_check_pt_data_91,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = ffffffffff000000
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 0000000000000000
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 00000000ff0000ff
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 000000000000ff00
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 00000000ffffffff
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = ffffffffffffffff
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = ff0000ff 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x50],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = 00000000 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x58],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = ff000000 ff000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x60],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 0000ff00 5affff00
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x68],%g3
	std	%f16,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f16 = 00000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf16,%g1
	ldx	[%g4+0x70],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = ae12becc ff0000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1
	ldx	[%g4+0x78],%g3
	std	%f28,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f28 = ff0000ff 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf28,%g1
	ldx	[%g4+0x80],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = 00000000 003100dc
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 91 completed


p0_label_456:
!	%f22 = 00000000 00000000, Mem[0000000010101410] = ff000000 00000000
	std	%f22,[%i4+%o5]	! Mem[0000000010101410] = 00000000 00000000
!	%f16 = 00000000 00000000, %l1 = ffffffffff000000
!	Mem[0000000030141400] = ff0000ff00000000
	stda	%f16,[%i5+%l1]ASI_PST8_SL ! Mem[0000000030141400] = ff0000ff00000000
!	Mem[0000000010181410] = 00000000, %l4 = 00000000ff0000ff
	swapa	[%i6+%o5]0x80,%l4	! %l4 = 0000000000000000
!	%l4 = 0000000000000000, Mem[0000000010181408] = 00ff00ff
	stwa	%l4,[%i6+%o4]0x80	! Mem[0000000010181408] = 00000000
!	%l2 = 000000ff, %l3 = 00000000, Mem[0000000010081408] = 00000000 00ffffff
	stda	%l2,[%i2+%o4]0x80	! Mem[0000000010081408] = 000000ff 00000000
!	%l4 = 0000000000000000, Mem[0000000010001408] = ff0000ff
	stwa	%l4,[%i0+%o4]0x80	! Mem[0000000010001408] = 00000000
!	%f10 = ff000000, Mem[0000000030001410] = 63ffffff
	sta	%f10,[%i0+%o5]0x81	! Mem[0000000030001410] = ff000000
!	Mem[0000000010101428] = ff0000ff, %l3 = 0000000000000000
	swap	[%i4+0x028],%l3		! %l3 = 00000000ff0000ff
!	%l5 = 000000000000ff00, Mem[0000000030101400] = 000000ff
	stba	%l5,[%i4+%g0]0x89	! Mem[0000000030101400] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010041430] = ff004f86, %l2 = 00000000000000ff
	lduwa	[%i1+0x030]%asi,%l2	! %l2 = 00000000ff004f86

p0_label_457:
!	Mem[0000000010041408] = 00000000, %l0 = 00000000000000ff
	ldswa	[%i1+%o4]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000030141408] = 00000000 000000ff, %l4 = 00000000, %l5 = 0000ff00
	ldda	[%i5+%o4]0x89,%l4	! %l4 = 00000000000000ff 0000000000000000
!	Mem[0000000010081400] = ff0000ff, %l3 = 00000000ff0000ff
	ldsba	[%i2+%g0]0x88,%l3	! %l3 = ffffffffffffffff
!	Mem[00000000300c1400] = 0000ffff000000ff, %l2 = 00000000ff004f86
	ldxa	[%i3+%g0]0x81,%l2	! %l2 = 0000ffff000000ff
!	Mem[0000000010001400] = 0000ff00, %l7 = ffffffffffffffff
	lduba	[%i0+%g0]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000010101410] = 00000000, %l7 = 0000000000000000
	lduwa	[%i4+%o5]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000010101418] = 703f71ab, %l7 = 0000000000000000
	lduh	[%i4+0x01a],%l7		! %l7 = 00000000000071ab
!	Mem[0000000030081400] = ffffffff, %l5 = 0000000000000000
	ldswa	[%i2+%g0]0x89,%l5	! %l5 = ffffffffffffffff
	membar	#Sync			! Added by membar checker (87)
!	Mem[0000000010101400] = ffff00ff 00000000 ccbe12ae ffffffff
!	Mem[0000000010101410] = 00000000 00000000 703f71ab 00000000
!	Mem[0000000010101420] = ff0000ff 000000ff 00000000 00000000
!	Mem[0000000010101430] = 0000003f 0000db8b 00000000 ffffff00
	ldda	[%i4]ASI_BLK_PL,%f16	! Block Load from 0000000010101400
!	Starting 10 instruction Store Burst
!	%l6 = 00000000ffffffff, Mem[0000000030001408] = ffff000000000000
	stxa	%l6,[%i0+%o4]0x89	! Mem[0000000030001408] = 00000000ffffffff

p0_label_458:
!	%l6 = ffffffff, %l7 = 000071ab, Mem[0000000030181410] = 000000ff ffffffff
	stda	%l6,[%i6+%o5]0x81	! Mem[0000000030181410] = ffffffff 000071ab
!	%f4  = ff000000, Mem[0000000030041400] = ccbe12ae
	sta	%f4 ,[%i1+%g0]0x81	! Mem[0000000030041400] = ff000000
!	%l1 = ffffffffff000000, Mem[0000000010141410] = 00ff0000
	stha	%l1,[%i5+%o5]0x88	! Mem[0000000010141410] = 00ff0000
!	%f4  = ff000000, Mem[0000000030181408] = ffffffff
	sta	%f4 ,[%i6+%o4]0x89	! Mem[0000000030181408] = ff000000
!	%l2 = 0000ffff000000ff, Mem[0000000030001410] = ff000000
	stba	%l2,[%i0+%o5]0x81	! Mem[0000000030001410] = ff000000
!	Mem[0000000010081408] = ff000000, %l6 = 00000000ffffffff
	ldstuba	[%i2+%o4]0x88,%l6	! %l6 = 00000000000000ff
!	%l1 = ffffffffff000000, Mem[0000000030081400] = ffffffffff000000
	stxa	%l1,[%i2+%g0]0x81	! Mem[0000000030081400] = ffffffffff000000
!	Mem[0000000030001408] = ffffffff, %l1 = ffffffffff000000
	ldstuba	[%i0+%o4]0x81,%l1	! %l1 = 000000ff000000ff
!	%f11 = ae12becc, Mem[0000000010001408] = 00000000
	sta	%f11,[%i0+%o4]0x80	! Mem[0000000010001408] = ae12becc
!	Starting 10 instruction Load Burst
!	Mem[00000000100c143c] = ffffffff, %l1 = 00000000000000ff
	lduwa	[%i3+0x03c]%asi,%l1	! %l1 = 00000000ffffffff

p0_label_459:
!	Mem[0000000030181400] = 00000000, %l7 = 00000000000071ab
	ldsba	[%i6+%g0]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000010181400] = 00ffff5a, %l3 = ffffffffffffffff
	ldsba	[%i6+%g0]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000010041408] = 00000000, %l0 = 0000000000000000
	ldsha	[%i1+%o4]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000010141410] = 00ff0000, %l5 = ffffffffffffffff
	lduwa	[%i5+%o5]0x88,%l5	! %l5 = 0000000000ff0000
!	Mem[0000000030041400] = ff000000000000ff, %f12 = ff0000ff 00000000
	ldda	[%i1+%g0]0x81,%f12	! %f12 = ff000000 000000ff
!	Mem[0000000010081408] = ff0000ff00000000, %f8  = 00000000 00000000
	ldd	[%i2+%o4],%f8 		! %f8  = ff0000ff 00000000
!	Mem[0000000030141400] = ff0000ff, %l3 = 0000000000000000
	lduha	[%i5+%g0]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010181410] = ff0000ff, %l5 = 0000000000ff0000
	ldswa	[%i6+%o5]0x80,%l5	! %l5 = ffffffffff0000ff
!	Mem[0000000030041410] = ff0000ff, %l1 = 00000000ffffffff
	ldsba	[%i1+%o5]0x89,%l1	! %l1 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	Mem[0000000020800041] = ffffac70, %l6 = 0000000000000000
	ldstuba	[%o1+0x041]%asi,%l6	! %l6 = 000000ff000000ff

p0_label_460:
!	%l5 = ffffffffff0000ff, Mem[0000000010081408] = ff0000ff00000000
	stxa	%l5,[%i2+%o4]0x80	! Mem[0000000010081408] = ffffffffff0000ff
!	Mem[0000000010001408] = ae12becc, %l6 = 00000000000000ff
	swapa	[%i0+%o4]0x80,%l6	! %l6 = 00000000ae12becc
!	Mem[0000000030101410] = ff000000, %l3 = 00000000000000ff
	swapa	[%i4+%o5]0x81,%l3	! %l3 = 00000000ff000000
!	Mem[00000000211c0001] = ffff7bbb, %l5 = ffffffffff0000ff
	ldstub	[%o2+0x001],%l5		! %l5 = 000000ff000000ff
!	Mem[00000000100c1410] = ffffffff, %l1 = ffffffffffffffff
	swapa	[%i3+%o5]0x80,%l1	! %l1 = 00000000ffffffff
!	%f2  = 00000000 000000ff, Mem[00000000300c1410] = ffff00ff ffffffff
	stda	%f2 ,[%i3+%o5]0x81	! Mem[00000000300c1410] = 00000000 000000ff
!	%l4 = 00000000000000ff, Mem[0000000010081400] = ff0000ff
	stwa	%l4,[%i2+%g0]0x88	! Mem[0000000010081400] = 000000ff
!	Mem[0000000010001410] = 000000ff, %l4 = 00000000000000ff
	ldstuba	[%i0+%o5]0x88,%l4	! %l4 = 000000ff000000ff
!	%l2 = 0000ffff000000ff, Mem[0000000010181437] = ffffffff, %asi = 80
	stba	%l2,[%i6+0x037]%asi	! Mem[0000000010181434] = ffffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = 00ffff5a00ff0000, %l0 = 0000000000000000
	ldxa	[%i5+%o5]0x88,%l0	! %l0 = 00ffff5a00ff0000

!	Check Point 92 for processor 0

	set	p0_check_pt_data_92,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 00ffff5a00ff0000
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 00000000ffffffff
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 0000ffff000000ff
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 00000000ff000000
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 00000000ae12becc
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 0000000000000000
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = ff000000 ff000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x50],%g3
	std	%f8,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f8 = ff0000ff 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf08,%g1
	ldx	[%g4+0x58],%g3
	std	%f12,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f12 = ff000000 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf12,%g1
	ldx	[%g4+0x60],%g3
	std	%f16,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f16 = 00000000 ff00ffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf16,%g1
	ldx	[%g4+0x68],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = ffffffff ae12becc
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1
	ldx	[%g4+0x70],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = 00000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1
	ldx	[%g4+0x78],%g3
	std	%f22,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f22 = 00000000 ab713f70
	bne	%xcc,p0_freg_check_fail
	mov	0xf22,%g1
	ldx	[%g4+0x80],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = ff000000 ff0000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1
	ldx	[%g4+0x88],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = 00000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1
	ldx	[%g4+0x90],%g3
	std	%f28,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f28 = 8bdb0000 3f000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf28,%g1
	ldx	[%g4+0x98],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = 00ffffff 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 92 completed


p0_label_461:
!	Mem[0000000010101410] = 00000000, %f3  = 000000ff
	ld	[%i4+%o5],%f3 	! %f3 = 00000000
!	Mem[0000000010141408] = 864f00ff 00000000, %l0 = 00ff0000, %l1 = ffffffff
	ldda	[%i5+%o4]0x80,%l0	! %l0 = 00000000864f00ff 0000000000000000
!	Mem[0000000010181420] = 00ffffff 000000ff, %l2 = 000000ff, %l3 = ff000000
	ldd	[%i6+0x020],%l2		! %l2 = 0000000000ffffff 00000000000000ff
!	Mem[0000000010041408] = 00000000, %l3 = 00000000000000ff
	ldsha	[%i1+%o4]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000010041408] = 00000000, %l6 = 00000000ae12becc
	lduwa	[%i1+%o4]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000030181410] = ffffffff 000071ab, %l0 = 864f00ff, %l1 = 00000000
	ldda	[%i6+%o5]0x81,%l0	! %l0 = 00000000ffffffff 00000000000071ab
!	Mem[00000000100c1400] = ff000000, %l6 = 0000000000000000
	lduha	[%i3+0x000]%asi,%l6	! %l6 = 000000000000ff00
!	Mem[00000000201c0000] = ffffaf65, %l7 = 0000000000000000
	lduh	[%o0+%g0],%l7		! %l7 = 000000000000ffff
!	Mem[0000000010041408] = 00000000, %l5 = 00000000000000ff
	ldswa	[%i1+%o4]0x88,%l5	! %l5 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010101410] = 00000000, %l7 = 000000000000ffff
	swapa	[%i4+%o5]0x88,%l7	! %l7 = 0000000000000000

p0_label_462:
!	Mem[0000000030041410] = ff0000ff, %l5 = 0000000000000000
	ldstuba	[%i1+%o5]0x89,%l5	! %l5 = 000000ff000000ff
!	%l4 = 00000000000000ff, Mem[0000000010181408] = 00000000
	stwa	%l4,[%i6+%o4]0x80	! Mem[0000000010181408] = 000000ff
!	%l4 = 000000ff, %l5 = 000000ff, Mem[0000000030001410] = 000000ff ff000000
	stda	%l4,[%i0+%o5]0x89	! Mem[0000000030001410] = 000000ff 000000ff
!	%l2 = 0000000000ffffff, Mem[0000000030001408] = ffffffff
	stwa	%l2,[%i0+%o4]0x81	! Mem[0000000030001408] = 00ffffff
!	%l5 = 00000000000000ff, Mem[0000000021800101] = 00ffb49a, %asi = 80
	stba	%l5,[%o3+0x101]%asi	! Mem[0000000021800100] = 00ffb49a
!	%f10 = ff000000 ae12becc, %l3 = 0000000000000000
!	Mem[0000000030081420] = 400013ffff00ff00
	add	%i2,0x020,%g1
	stda	%f10,[%g1+%l3]ASI_PST32_S ! Mem[0000000030081420] = 400013ffff00ff00
!	Mem[0000000030181410] = ffffffff, %l0 = 00000000ffffffff
	swapa	[%i6+%o5]0x81,%l0	! %l0 = 00000000ffffffff
!	%f12 = ff000000, Mem[0000000010081400] = ff000000
	sta	%f12,[%i2+%g0]0x80	! Mem[0000000010081400] = ff000000
!	Mem[0000000030081408] = ffff00ff, %l5 = 00000000000000ff
	ldstuba	[%i2+%o4]0x89,%l5	! %l5 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = 00000000 005a005a, %l4 = 000000ff, %l5 = 000000ff
	ldda	[%i4+%o4]0x81,%l4	! %l4 = 0000000000000000 00000000005a005a

p0_label_463:
!	Mem[0000000010001408] = ff000000, %l7 = 0000000000000000
	lduha	[%i0+%o4]0x88,%l7	! %l7 = 0000000000000000
!	Mem[00000000100c1408] = 000000ff, %l6 = 000000000000ff00
	lduba	[%i3+%o4]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[00000000100c1408] = 000000ff, %l3 = 0000000000000000
	ldswa	[%i3+%o4]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030081400] = ffffffff, %l1 = 00000000000071ab
	lduha	[%i2+%g0]0x81,%l1	! %l1 = 000000000000ffff
!	Mem[0000000010181408] = ff000000, %f10 = ff000000
	lda	[%i6+%o4]0x88,%f10	! %f10 = ff000000
!	Mem[0000000010101410] = 000000000000ffff, %l6 = 00000000000000ff
	ldxa	[%i4+%o5]0x88,%l6	! %l6 = 000000000000ffff
!	Mem[00000000100c1400] = ff00000000ffffff, %l1 = 000000000000ffff
	ldx	[%i3+%g0],%l1		! %l1 = ff00000000ffffff
!	Mem[0000000030001410] = 000000ff 000000ff, %l4 = 00000000, %l5 = 005a005a
	ldda	[%i0+%o5]0x89,%l4	! %l4 = 00000000000000ff 00000000000000ff
!	Mem[0000000010041420] = 00000000, %l6 = 000000000000ffff
	ldsha	[%i1+0x020]%asi,%l6	! %l6 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010041408] = 000000000000ffff, %l1 = ff00000000ffffff, %l0 = 00000000ffffffff
	add	%i1,0x08,%g1
	casxa	[%g1]0x80,%l1,%l0	! %l0 = 000000000000ffff

p0_label_464:
!	%l3 = 00000000000000ff, Mem[00000000300c1408] = 0000000000000000
	stxa	%l3,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00000000000000ff
!	Mem[0000000030181400] = 00000000, %l2 = 0000000000ffffff
	ldstuba	[%i6+%g0]0x89,%l2	! %l2 = 00000000000000ff
!	%l3 = 00000000000000ff, Mem[00000000100c1400] = ff000000
	stwa	%l3,[%i3+%g0]0x80	! Mem[00000000100c1400] = 000000ff
!	%f16 = 00000000 ff00ffff ffffffff ae12becc
!	%f20 = 00000000 00000000 00000000 ab713f70
!	%f24 = ff000000 ff0000ff 00000000 00000000
!	%f28 = 8bdb0000 3f000000 00ffffff 00000000
	stda	%f16,[%i2]ASI_COMMIT_S	! Block Store to 0000000030081400
!	%f14 = a96e6a5a, Mem[00000000100c1408] = ff000000
	sta	%f14,[%i3+%o4]0x80	! Mem[00000000100c1408] = a96e6a5a
!	Mem[0000000030181410] = ffffffff, %l6 = 0000000000000000
	ldstuba	[%i6+%o5]0x89,%l6	! %l6 = 000000ff000000ff
!	%l4 = 000000ff, %l5 = 000000ff, Mem[0000000030181400] = 000000ff ffffffff
	stda	%l4,[%i6+%g0]0x89	! Mem[0000000030181400] = 000000ff 000000ff
!	%l2 = 00000000, %l3 = 000000ff, Mem[0000000030141400] = ff0000ff 00000000
	stda	%l2,[%i5+%g0]0x81	! Mem[0000000030141400] = 00000000 000000ff
	membar	#Sync			! Added by membar checker (88)
!	Mem[0000000030081408] = ffffffff, %l1 = ff00000000ffffff
	ldstuba	[%i2+%o4]0x89,%l1	! %l1 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = ff000000000000ff, %f16 = 00000000 ff00ffff
	ldda	[%i0+%o5]0x80,%f16	! %f16 = ff000000 000000ff

p0_label_465:
!	Mem[0000000010101400] = ffff00ff, %l2 = 0000000000000000
	ldsha	[%i4+%g0]0x80,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000010081430] = ff004f86864fc963, %l5 = 00000000000000ff
	ldxa	[%i2+0x030]%asi,%l5	! %l5 = ff004f86864fc963
!	Mem[00000000300c1400] = ffff0000, %l5 = ff004f86864fc963
	lduha	[%i3+%g0]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000010081400] = ff000000, %l3 = 00000000000000ff
	lduwa	[%i2+%g0]0x80,%l3	! %l3 = 00000000ff000000
!	Mem[00000000300c1410] = 00000000, %l6 = 00000000000000ff
	ldsba	[%i3+%o5]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000010101410] = 0000ffff, %l7 = 0000000000000000
	ldswa	[%i4+%o5]0x88,%l7	! %l7 = 000000000000ffff
!	Mem[0000000010101400] = ff00ffff, %l0 = 000000000000ffff
	lduwa	[%i4+%g0]0x88,%l0	! %l0 = 00000000ff00ffff
!	Mem[0000000010181410] = ff0000ff, %l0 = 00000000ff00ffff
	lduha	[%i6+%o5]0x80,%l0	! %l0 = 000000000000ff00
!	Mem[0000000010041410] = 00000000, %l0 = 000000000000ff00
	ldsha	[%i1+%o5]0x88,%l0	! %l0 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010181410] = ff0000ff, %l3 = 00000000ff000000
	ldstuba	[%i6+%o5]0x80,%l3	! %l3 = 000000ff000000ff

!	Check Point 93 for processor 0

	set	p0_check_pt_data_93,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 0000000000000000
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = ffffffffffffffff
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l5,%g2			! %l5 = 0000000000000000
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l6,%g2			! %l6 = 0000000000000000
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l7,%g2			! %l7 = 000000000000ffff
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x40],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = ff0000ff 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x48],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = 00000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x50],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = ff000000 ff000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x58],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = ff000000 ae12becc
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x60],%g3
	std	%f16,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f16 = ff000000 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf16,%g1

!	Check Point 93 completed


p0_label_466:
!	%l7 = 000000000000ffff, Mem[0000000030081410] = 0000000000000000
	stxa	%l7,[%i2+%o5]0x89	! Mem[0000000030081410] = 000000000000ffff
!	%l4 = 00000000000000ff, Mem[0000000010181400] = 5affff00
	stwa	%l4,[%i6+%g0]0x88	! Mem[0000000010181400] = 000000ff
!	%f4  = ff000000 ff000000, %l3 = 00000000000000ff
!	Mem[0000000030101400] = 0000000000000000
	stda	%f4,[%i4+%l3]ASI_PST8_S ! Mem[0000000030101400] = ff000000ff000000
!	%l0 = 0000000000000000, Mem[0000000030101408] = 00000000
	stwa	%l0,[%i4+%o4]0x81	! Mem[0000000030101408] = 00000000
!	%l0 = 0000000000000000, Mem[0000000030001410] = 000000ff
	stwa	%l0,[%i0+%o5]0x89	! Mem[0000000030001410] = 00000000
!	%l6 = 00000000, %l7 = 0000ffff, Mem[0000000010181400] = ff000000 00ff0000
	stda	%l6,[%i6+%g0]0x80	! Mem[0000000010181400] = 00000000 0000ffff
!	Mem[0000000030041410] = ff0000ff, %l1 = 00000000000000ff
	ldstuba	[%i1+%o5]0x81,%l1	! %l1 = 000000ff000000ff
!	%f26 = 00000000 00000000, Mem[00000000100c1400] = 000000ff 00ffffff
	stda	%f26,[%i3+0x000]%asi	! Mem[00000000100c1400] = 00000000 00000000
!	Mem[0000000010001428] = 0000ff00, %l4 = 00000000000000ff
	swap	[%i0+0x028],%l4		! %l4 = 000000000000ff00
!	Starting 10 instruction Load Burst
!	Mem[0000000010101424] = 000000ff, %l7 = 000000000000ffff
	ldswa	[%i4+0x024]%asi,%l7	! %l7 = 00000000000000ff

p0_label_467:
!	Mem[0000000010001428] = 000000ff, %l6 = 0000000000000000
	lduwa	[%i0+0x028]%asi,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030141408] = 000000ff, %l0 = 0000000000000000
	lduha	[%i5+%o4]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030081400] = 00000000, %l7 = 00000000000000ff
	lduha	[%i2+%g0]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000010001410] = ff000000, %l7 = 0000000000000000
	ldswa	[%i0+%o5]0x80,%l7	! %l7 = ffffffffff000000
!	Mem[00000000100c1428] = ff000000003100dc, %f24 = ff000000 ff0000ff
	ldd	[%i3+0x028],%f24	! %f24 = ff000000 003100dc
!	Mem[0000000030181410] = ffffffff000071ab, %f12 = ff000000 000000ff
	ldda	[%i6+%o5]0x81,%f12	! %f12 = ffffffff 000071ab
!	Mem[0000000010181408] = ff000000, %f5  = ff000000
	lda	[%i6+%o4]0x88,%f5 	! %f5 = ff000000
!	Mem[00000000300c1408] = ff00000000000000, %l6 = 00000000000000ff
	ldxa	[%i3+%o4]0x89,%l6	! %l6 = ff00000000000000
!	Mem[0000000030181400] = 000000ff000000ff, %f12 = ffffffff 000071ab
	ldda	[%i6+%g0]0x89,%f12	! %f12 = 000000ff 000000ff
!	Starting 10 instruction Store Burst
!	%l0 = 00000000000000ff, Mem[0000000020800001] = 00ff7d94
	stb	%l0,[%o1+0x001]		! Mem[0000000020800000] = 00ff7d94

p0_label_468:
!	%l2 = ffffffff, %l3 = 000000ff, Mem[0000000010081420] = ff000000 00000000
	stda	%l2,[%i2+0x020]%asi	! Mem[0000000010081420] = ffffffff 000000ff
!	Mem[00000000211c0001] = ffff7bbb, %l6 = ff00000000000000
	ldstub	[%o2+0x001],%l6		! %l6 = 000000ff000000ff
!	%l6 = 00000000000000ff, Mem[0000000010181420] = 00ffffff000000ff, %asi = 80
	stxa	%l6,[%i6+0x020]%asi	! Mem[0000000010181420] = 00000000000000ff
!	%f8  = ff0000ff 00000000, Mem[00000000300c1410] = 00000000 000000ff
	stda	%f8 ,[%i3+%o5]0x81	! Mem[00000000300c1410] = ff0000ff 00000000
!	%l1 = 00000000000000ff, Mem[00000000218000c0] = ffff65e1
	sth	%l1,[%o3+0x0c0]		! Mem[00000000218000c0] = 00ff65e1
!	%l3 = 00000000000000ff, Mem[00000000218000c0] = 00ff65e1, %asi = 80
	stba	%l3,[%o3+0x0c0]%asi	! Mem[00000000218000c0] = ffff65e1
!	%f8  = ff0000ff, Mem[0000000010181408] = 000000ff
	sta	%f8 ,[%i6+0x008]%asi	! Mem[0000000010181408] = ff0000ff
!	%f28 = 8bdb0000, Mem[0000000030041410] = ff0000ff
	sta	%f28,[%i1+%o5]0x81	! Mem[0000000030041410] = 8bdb0000
!	Mem[0000000010001410] = 000000ff, %l5 = 0000000000000000
	ldstuba	[%i0+%o5]0x88,%l5	! %l5 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = 5a6a6ea9, %l6 = 00000000000000ff
	ldsba	[%i3+%o4]0x88,%l6	! %l6 = ffffffffffffffa9

p0_label_469:
	membar	#Sync			! Added by membar checker (89)
!	Mem[0000000010181400] = 00000000 0000ffff ff0000ff ff4fc963
!	Mem[0000000010181410] = ff0000ff 0000864f 00000000 00000000
!	Mem[0000000010181420] = 00000000 000000ff ff000000 00000000
!	Mem[0000000010181430] = db8bc3ff ffffffff 000000ff 000000ff
	ldda	[%i6]ASI_BLK_P,%f0	! Block Load from 0000000010181400
!	Mem[0000000010001400] = 00ff0000, %l5 = 00000000000000ff
	ldsba	[%i0+%g0]0x88,%l5	! %l5 = 0000000000000000
!	Mem[00000000100c1410] = ffffffff, %l1 = 00000000000000ff
	ldswa	[%i3+%o5]0x88,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010141400] = ffffff00, %l4 = 000000000000ff00
	ldsha	[%i5+%g0]0x88,%l4	! %l4 = ffffffffffffff00
!	Mem[000000001018141c] = 00000000, %l1 = ffffffffffffffff
	ldub	[%i6+0x01c],%l1		! %l1 = 0000000000000000
!	Mem[00000000300c1410] = ff0000ff, %l5 = 0000000000000000
	lduha	[%i3+%o5]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[00000000100c1408] = a96e6a5a, %l6 = ffffffffffffffa9
	lduha	[%i3+%o4]0x80,%l6	! %l6 = 000000000000a96e
!	Mem[0000000010001438] = 63c94f86 5a0000ff, %l0 = 000000ff, %l1 = 00000000
	ldda	[%i0+0x038]%asi,%l0	! %l0 = 0000000063c94f86 000000005a0000ff
!	Mem[0000000030141400] = 00000000, %l3 = 00000000000000ff
	ldsba	[%i5+%g0]0x89,%l3	! %l3 = 0000000000000000
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (90)
!	%l2 = ffffffff, %l3 = 00000000, Mem[0000000010181408] = ff0000ff ff4fc963
	stda	%l2,[%i6+0x008]%asi	! Mem[0000000010181408] = ffffffff 00000000

p0_label_470:
!	Mem[0000000010081410] = 00000000, %l6 = 000000000000a96e
	swapa	[%i2+%o5]0x88,%l6	! %l6 = 0000000000000000
!	%l2 = ffffffffffffffff, Mem[0000000010181408] = ffffffff
	stha	%l2,[%i6+%o4]0x80	! Mem[0000000010181408] = ffffffff
!	Mem[0000000030141408] = 000000ff, %l4 = ffffffffffffff00
	swapa	[%i5+%o4]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[00000000100c1410] = ffffffff, %l7 = ffffffffff000000
	swapa	[%i3+%o5]0x80,%l7	! %l7 = 00000000ffffffff
!	%l2 = ffffffffffffffff, Mem[0000000030041400] = ff000000
	stwa	%l2,[%i1+%g0]0x81	! Mem[0000000030041400] = ffffffff
!	Mem[0000000030041410] = 0000db8b, %l7 = 00000000ffffffff
	ldstuba	[%i1+%o5]0x89,%l7	! %l7 = 0000008b000000ff
!	Mem[0000000030001410] = 00000000, %l2 = ffffffffffffffff
	ldstuba	[%i0+%o5]0x81,%l2	! %l2 = 00000000000000ff
!	Mem[00000000300c1408] = 00000000, %l0 = 0000000063c94f86
	ldstuba	[%i3+%o4]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010001408] = 000000ff, %l0 = 0000000000000000
	ldstuba	[%i0+%o4]0x80,%l0	! %l0 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010041404] = ccbe12ae, %l3 = 0000000000000000
	ldsb	[%i1+0x006],%l3		! %l3 = 0000000000000012

!	Check Point 94 for processor 0

	set	p0_check_pt_data_94,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 0000000000000000
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 000000005a0000ff
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 0000000000000000
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 0000000000000012
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 0000000000000000
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 000000000000008b
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = 00000000 0000ffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x50],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = ff0000ff ff4fc963
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x58],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = ff0000ff 0000864f
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x60],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 00000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x68],%g3
	std	%f8,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f8 = 00000000 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf08,%g1
	ldx	[%g4+0x70],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = ff000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x78],%g3
	std	%f12,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f12 = db8bc3ff ffffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf12,%g1
	ldx	[%g4+0x80],%g3
	std	%f14,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f14 = 000000ff 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf14,%g1
	ldx	[%g4+0x88],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = ff000000 003100dc
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1

!	Check Point 94 completed


p0_label_471:
!	Mem[0000000010141428] = c354000000000000, %l4 = 00000000000000ff
	ldxa	[%i5+0x028]%asi,%l4	! %l4 = c354000000000000
!	Mem[00000000300c1400] = 0000ffff000000ff, %f20 = 00000000 00000000
	ldda	[%i3+%g0]0x81,%f20	! %f20 = 0000ffff 000000ff
!	Mem[0000000030101410] = 000000ff, %l3 = 0000000000000012
	lduwa	[%i4+%o5]0x81,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010081418] = 00000000, %l3 = 00000000000000ff
	ldsba	[%i2+0x01a]%asi,%l3	! %l3 = 0000000000000000
!	Mem[0000000010041400] = ff0000ffccbe12ae, %f18 = ffffffff ae12becc
	ldd	[%i1+%g0],%f18		! %f18 = ff0000ff ccbe12ae
!	Mem[0000000030181410] = ab710000 ffffffff, %l2 = 00000000, %l3 = 00000000
	ldda	[%i6+%o5]0x89,%l2	! %l2 = 00000000ffffffff 00000000ab710000
!	Mem[0000000030181410] = ffffffff, %l7 = 000000000000008b
	ldswa	[%i6+%o5]0x81,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010101410] = 0000ffff, %l1 = 000000005a0000ff
	lduwa	[%i4+%o5]0x88,%l1	! %l1 = 000000000000ffff
!	Mem[0000000030101400] = ff000000, %l5 = 00000000000000ff
	ldsba	[%i4+%g0]0x81,%l5	! %l5 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l7 = ffffffffffffffff, Mem[0000000030101410] = ff000000
	stha	%l7,[%i4+%o5]0x89	! Mem[0000000030101410] = ff00ffff

p0_label_472:
!	%l2 = 00000000ffffffff, Mem[0000000010181400] = 00000000
	stwa	%l2,[%i6+%g0]0x88	! Mem[0000000010181400] = ffffffff
!	%f7  = 00000000, Mem[0000000030181400] = 000000ff
	sta	%f7 ,[%i6+%g0]0x89	! Mem[0000000030181400] = 00000000
!	Mem[0000000010181400] = ffffffff, %l1 = 000000000000ffff
	ldstuba	[%i6+%g0]0x88,%l1	! %l1 = 000000ff000000ff
!	%l0 = 0000000000000000, Mem[000000001008143d] = 00000000
	stb	%l0,[%i2+0x03d]		! Mem[000000001008143c] = 00000000
!	%f11 = 00000000, Mem[0000000010081400] = 000000ff
	sta	%f11,[%i2+%g0]0x88	! Mem[0000000010081400] = 00000000
!	Mem[00000000100c1400] = 00000000, %l7 = ffffffffffffffff
	swapa	[%i3+%g0]0x88,%l7	! %l7 = 0000000000000000
!	%l6 = 0000000000000000, Mem[00000000211c0000] = ffff7bbb
	sth	%l6,[%o2+%g0]		! Mem[00000000211c0000] = 00007bbb
!	%f24 = ff000000 003100dc, Mem[0000000030101408] = 00000000 5a005a00
	stda	%f24,[%i4+%o4]0x89	! Mem[0000000030101408] = ff000000 003100dc
!	%l4 = 00000000, %l5 = ffffffff, Mem[0000000030081408] = ffffffff ccbe12ae
	stda	%l4,[%i2+%o4]0x89	! Mem[0000000030081408] = 00000000 ffffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = 00000000, %l0 = 0000000000000000
	ldswa	[%i5+%g0]0x89,%l0	! %l0 = 0000000000000000

p0_label_473:
!	Mem[00000000201c0000] = ffffaf65, %l2 = 00000000ffffffff
	ldsb	[%o0+0x001],%l2		! %l2 = ffffffffffffffff
!	Mem[0000000010001420] = ff004f86 ff0000ff, %l2 = ffffffff, %l3 = ab710000
	ldd	[%i0+0x020],%l2		! %l2 = 00000000ff004f86 00000000ff0000ff
!	Mem[0000000010041400] = ff0000ff, %l3 = 00000000ff0000ff
	lduba	[%i1+%g0]0x80,%l3	! %l3 = 00000000000000ff
!	Mem[00000000100c1408] = 5a6a6ea9, %f1  = 0000ffff
	lda	[%i3+%o4]0x88,%f1 	! %f1 = 5a6a6ea9
!	Mem[00000000300c1410] = ff0000ff00000000, %l7 = 0000000000000000
	ldxa	[%i3+%o5]0x81,%l7	! %l7 = ff0000ff00000000
!	Mem[0000000030141400] = 00000000, %l7 = ff0000ff00000000
	ldswa	[%i5+%g0]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000010041410] = 00000000, %l0 = 0000000000000000
	lduwa	[%i1+%o5]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000010081408] = ffffffff, %l4 = c354000000000000
	lduha	[%i2+%o4]0x88,%l4	! %l4 = 000000000000ffff
!	Mem[0000000010181410] = ff0000ff, %l7 = 0000000000000000
	lduba	[%i6+%o5]0x88,%l7	! %l7 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l7 = 00000000000000ff, Mem[0000000030101400] = 000000ff
	stha	%l7,[%i4+%g0]0x89	! Mem[0000000030101400] = 000000ff

p0_label_474:
!	%f10 = ff000000 00000000, Mem[0000000010181420] = 00000000 000000ff
	std	%f10,[%i6+0x020]	! Mem[0000000010181420] = ff000000 00000000
!	%l1 = 00000000000000ff, Mem[0000000030041410] = ffff00000000dbff
	stxa	%l1,[%i1+%o5]0x89	! Mem[0000000030041410] = 00000000000000ff
!	%l1 = 00000000000000ff, Mem[00000000211c0001] = 00007bbb, %asi = 80
	stba	%l1,[%o2+0x001]%asi	! Mem[00000000211c0000] = 00ff7bbb
!	Mem[0000000030101400] = ff000000, %l4 = 000000000000ffff
	ldstuba	[%i4+%g0]0x81,%l4	! %l4 = 000000ff000000ff
!	%l7 = 00000000000000ff, Mem[00000000300c1408] = 000000ff
	stba	%l7,[%i3+%o4]0x89	! Mem[00000000300c1408] = 000000ff
!	%l6 = 00000000, %l7 = 000000ff, Mem[0000000010001420] = ff004f86 ff0000ff
	stda	%l6,[%i0+0x020]%asi	! Mem[0000000010001420] = 00000000 000000ff
!	%l4 = 00000000000000ff, Mem[00000000100c1400] = ffffffff
	stb	%l4,[%i3+%g0]		! Mem[00000000100c1400] = ffffffff
!	%f31 = 00000000, Mem[0000000010101410] = ffff0000
	sta	%f31,[%i4+%o5]0x80	! Mem[0000000010101410] = 00000000
!	Mem[0000000030181400] = 00000000, %l7 = 00000000000000ff
	ldstuba	[%i6+%g0]0x89,%l7	! %l7 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = ffffffff, %l2 = 00000000ff004f86
	ldsba	[%i3+%g0]0x80,%l2	! %l2 = ffffffffffffffff

p0_label_475:
!	Mem[0000000010001408] = ff0000ff00000000, %l7 = 0000000000000000
	ldxa	[%i0+%o4]0x80,%l7	! %l7 = ff0000ff00000000
!	Mem[0000000010041418] = 00000000, %l5 = ffffffffffffffff
	ldsba	[%i1+0x01a]%asi,%l5	! %l5 = 0000000000000000
!	Mem[00000000100c1418] = 000000ff 000000ff, %l6 = 00000000, %l7 = 00000000
	ldd	[%i3+0x018],%l6		! %l6 = 00000000000000ff 00000000000000ff
!	Mem[0000000010101400] = ff00ffff, %l0 = 0000000000000000
	lduha	[%i4+%g0]0x88,%l0	! %l0 = 000000000000ffff
!	Mem[0000000010101400] = ffff00ff00000000, %l2 = ffffffffffffffff
	ldxa	[%i4+%g0]0x80,%l2	! %l2 = ffff00ff00000000
!	Mem[00000000100c1400] = ffffffff, %l2 = ffff00ff00000000
	lduha	[%i3+%g0]0x80,%l2	! %l2 = 000000000000ffff
!	Mem[0000000030001408] = 00ffffff, %l2 = 000000000000ffff
	lduba	[%i0+%o4]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000010041408] = 00000000, %l1 = 00000000000000ff
	lduba	[%i1+%o4]0x80,%l1	! %l1 = 0000000000000000
!	Mem[00000000100c1400] = ffffffff, %l0 = 000000000000ffff
	ldsh	[%i3+0x002],%l0		! %l0 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	Mem[0000000030041400] = ffffffff, %l3 = 00000000000000ff
	swapa	[%i1+%g0]0x81,%l3	! %l3 = 00000000ffffffff

!	Check Point 95 for processor 0

	set	p0_check_pt_data_95,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = ffffffffffffffff
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 0000000000000000
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 0000000000000000
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 00000000ffffffff
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 0000000000000000
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l7,%g2			! %l7 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x40],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = 00000000 5a6a6ea9
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x48],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = ff0000ff ff4fc963
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x50],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 00000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x58],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = ff0000ff ccbe12ae
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1
	ldx	[%g4+0x60],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = 0000ffff 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1

!	Check Point 95 completed


p0_label_476:
!	%l7 = 00000000000000ff, Mem[000000001014141c] = ffffffff, %asi = 80
	stwa	%l7,[%i5+0x01c]%asi	! Mem[000000001014141c] = 000000ff
!	%l5 = 0000000000000000, Mem[0000000010001400] = 0000ff00
	stha	%l5,[%i0+%g0]0x80	! Mem[0000000010001400] = 0000ff00
!	%f26 = 00000000, Mem[0000000030081410] = ffff0000
	sta	%f26,[%i2+%o5]0x81	! Mem[0000000030081410] = 00000000
!	Mem[0000000010141408] = ff004f86, %l0 = ffffffffffffffff
	ldstuba	[%i5+%o4]0x88,%l0	! %l0 = 00000086000000ff
!	%l6 = 00000000000000ff, Mem[0000000010001404] = 000000ff, %asi = 80
	stwa	%l6,[%i0+0x004]%asi	! Mem[0000000010001404] = 000000ff
!	Mem[0000000010041410] = 00000000, %l3 = 00000000ffffffff
	swapa	[%i1+%o5]0x88,%l3	! %l3 = 0000000000000000
!	%l1 = 0000000000000000, Mem[0000000030001408] = 00ffffff
	stba	%l1,[%i0+%o4]0x81	! Mem[0000000030001408] = 00ffffff
!	Mem[0000000020800000] = 00ff7d94, %l6 = 00000000000000ff
	ldstuba	[%o1+0x000]%asi,%l6	! %l6 = 00000000000000ff
!	%l3 = 0000000000000000, Mem[0000000030081410] = 00000000
	stwa	%l3,[%i2+%o5]0x81	! Mem[0000000030081410] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = 00000000, %l4 = 00000000000000ff
	lduh	[%i4+0x012],%l4		! %l4 = 0000000000000000

p0_label_477:
!	Mem[0000000010101408] = ccbe12aeffffffff, %l7 = 00000000000000ff
	ldxa	[%i4+%o4]0x80,%l7	! %l7 = ccbe12aeffffffff
!	Mem[000000001018141c] = 00000000, %l1 = 0000000000000000
	ldsw	[%i6+0x01c],%l1		! %l1 = 0000000000000000
!	Mem[0000000030141408] = ffffff00, %l2 = 0000000000000000
	ldsba	[%i5+%o4]0x89,%l2	! %l2 = 0000000000000000
!	Mem[00000000300c1400] = ffff0000, %l4 = 0000000000000000
	lduba	[%i3+%g0]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000030181410] = ffffffff000071ab, %f22 = 00000000 ab713f70
	ldda	[%i6+%o5]0x81,%f22	! %f22 = ffffffff 000071ab
!	Mem[0000000010101400] = ffff00ff, %l5 = 0000000000000000
	ldswa	[%i4+%g0]0x80,%l5	! %l5 = ffffffffffff00ff
!	Mem[0000000030101410] = ffffffff ff00ffff, %l2 = 00000000, %l3 = 00000000
	ldda	[%i4+%o5]0x89,%l2	! %l2 = 00000000ff00ffff 00000000ffffffff
!	Mem[0000000030181410] = ffffffff, %f22 = ffffffff
	lda	[%i6+%o5]0x81,%f22	! %f22 = ffffffff
!	Mem[0000000030181408] = 000000ff, %f27 = 00000000
	lda	[%i6+%o4]0x81,%f27	! %f27 = 000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000010101410] = 00000000, %l3 = 00000000ffffffff
	ldstuba	[%i4+%o5]0x80,%l3	! %l3 = 00000000000000ff

p0_label_478:
!	%l4 = 0000000000000000, Mem[00000000201c0000] = ffffaf65
	sth	%l4,[%o0+%g0]		! Mem[00000000201c0000] = 0000af65
!	%l4 = 00000000, %l5 = ffff00ff, Mem[0000000030081400] = 00000000 ff00ffff
	stda	%l4,[%i2+%g0]0x81	! Mem[0000000030081400] = 00000000 ffff00ff
!	%f14 = 000000ff 000000ff, Mem[0000000010101400] = ff00ffff 00000000
	stda	%f14,[%i4+%g0]0x88	! Mem[0000000010101400] = 000000ff 000000ff
!	%l7 = ccbe12aeffffffff, Mem[00000000211c0000] = 00ff7bbb, %asi = 80
	stha	%l7,[%o2+0x000]%asi	! Mem[00000000211c0000] = ffff7bbb
!	Mem[0000000030101400] = 000000ff, %l0 = 0000000000000086
	ldstuba	[%i4+%g0]0x89,%l0	! %l0 = 000000ff000000ff
!	Mem[0000000010041400] = ff0000ff, %l2 = 00000000ff00ffff
	ldstuba	[%i1+%g0]0x80,%l2	! %l2 = 000000ff000000ff
!	%l7 = ccbe12aeffffffff, Mem[0000000010181410] = ff0000ff
	stba	%l7,[%i6+%o5]0x80	! Mem[0000000010181410] = ff0000ff
!	Mem[00000000100c1408] = 5a6a6ea9, %l6 = 0000000000000000
	swapa	[%i3+%o4]0x88,%l6	! %l6 = 000000005a6a6ea9
!	Mem[0000000010001408] = ff0000ff, %l7 = ccbe12aeffffffff
	ldstuba	[%i0+%o4]0x80,%l7	! %l7 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = ffffffff, %l3 = 0000000000000000
	ldsha	[%i6+%g0]0x80,%l3	! %l3 = ffffffffffffffff

p0_label_479:
!	Mem[0000000010181410] = ff0000ff, %f17 = 000000ff
	lda	[%i6+%o5]0x80,%f17	! %f17 = ff0000ff
!	Mem[0000000010081420] = ffffffff, %l2 = 00000000000000ff
	ldsh	[%i2+0x022],%l2		! %l2 = ffffffffffffffff
!	Mem[0000000010181410] = ff0000ff, %l4 = 0000000000000000
	ldsba	[%i6+%o5]0x88,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010141400] = 00ffffff000000ff, %f4  = ff0000ff 0000864f
	ldda	[%i5+%g0]0x80,%f4 	! %f4  = 00ffffff 000000ff
!	Mem[0000000010001408] = ff0000ff00000000, %l6 = 000000005a6a6ea9
	ldxa	[%i0+%o4]0x80,%l6	! %l6 = ff0000ff00000000
!	Mem[0000000010081410] = 6ea90000 00000000, %l2 = ffffffff, %l3 = ffffffff
	ldda	[%i2+%o5]0x80,%l2	! %l2 = 000000006ea90000 0000000000000000
!	Mem[0000000010101410] = 000000ff, %l7 = 00000000000000ff
	ldswa	[%i4+%o5]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030101400] = 000000ff 000000ff, %l6 = 00000000, %l7 = 000000ff
	ldda	[%i4+%g0]0x89,%l6	! %l6 = 00000000000000ff 00000000000000ff
!	Mem[0000000010001410] = ff000000 000000ff, %l0 = 000000ff, %l1 = 00000000
	ldd	[%i0+%o5],%l0		! %l0 = 00000000ff000000 00000000000000ff
!	Starting 10 instruction Store Burst
!	%f18 = ff0000ff ccbe12ae, Mem[00000000300c1400] = 0000ffff 000000ff
	stda	%f18,[%i3+%g0]0x81	! Mem[00000000300c1400] = ff0000ff ccbe12ae

p0_label_480:
!	%l4 = ffffffffffffffff, Mem[00000000300c1400] = ff0000ff
	stha	%l4,[%i3+%g0]0x89	! Mem[00000000300c1400] = ff00ffff
!	%l6 = 000000ff, %l7 = 000000ff, Mem[0000000010101410] = ff000000 00000000
	stda	%l6,[%i4+%o5]0x80	! Mem[0000000010101410] = 000000ff 000000ff
!	%l2 = 6ea90000, %l3 = 00000000, Mem[0000000010041408] = 00000000 ffff0000
	stda	%l2,[%i1+%o4]0x88	! Mem[0000000010041408] = 6ea90000 00000000
!	Mem[0000000010081408] = ffffffff, %l5 = ffffffffffff00ff
	ldstuba	[%i2+%o4]0x88,%l5	! %l5 = 000000ff000000ff
!	Mem[0000000030101410] = ffff00ff, %l1 = 00000000000000ff
	ldstuba	[%i4+%o5]0x81,%l1	! %l1 = 000000ff000000ff
!	%l5 = 00000000000000ff, Mem[0000000010001400] = 0000ff00
	stba	%l5,[%i0+%g0]0x80	! Mem[0000000010001400] = ff00ff00
!	Mem[0000000010001408] = ff0000ff, %l5 = 00000000000000ff
	ldstuba	[%i0+%o4]0x88,%l5	! %l5 = 000000ff000000ff
!	%l5 = 00000000000000ff, Mem[0000000030101400] = 000000ff
	stha	%l5,[%i4+%g0]0x89	! Mem[0000000030101400] = 000000ff
!	Mem[0000000010181410] = ff0000ff, %l2 = 000000006ea90000
	swapa	[%i6+%o5]0x88,%l2	! %l2 = 00000000ff0000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = 000000ff, %l2 = 00000000ff0000ff
	ldsha	[%i4+%g0]0x89,%l2	! %l2 = 00000000000000ff

!	Check Point 96 for processor 0

	set	p0_check_pt_data_96,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 00000000ff000000
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 0000000000000000
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = ffffffffffffffff
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = 00000000 5a6a6ea9
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x50],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = ff0000ff ff4fc963
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x58],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 00ffffff 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x60],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 00000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x68],%g3
	std	%f16,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f16 = ff000000 ff0000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf16,%g1
	ldx	[%g4+0x70],%g3
	std	%f22,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f22 = ffffffff 000071ab
	bne	%xcc,p0_freg_check_fail
	mov	0xf22,%g1
	ldx	[%g4+0x78],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = 00000000 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1

!	Check Point 96 completed


p0_label_481:
!	Mem[00000000211c0000] = ffff7bbb, %l6 = 00000000000000ff
	lduha	[%o2+0x000]%asi,%l6	! %l6 = 000000000000ffff
!	Mem[0000000010181408] = ffffffff00000000, %f22 = ffffffff 000071ab
	ldda	[%i6+%o4]0x80,%f22	! %f22 = ffffffff 00000000
!	Mem[0000000010081408] = ff0000ffffffffff, %f28 = 8bdb0000 3f000000
	ldda	[%i2+%o4]0x88,%f28	! %f28 = ff0000ff ffffffff
!	Mem[0000000010181430] = db8bc3ffffffffff, %f10 = ff000000 00000000
	ldda	[%i6+0x030]%asi,%f10	! %f10 = db8bc3ff ffffffff
!	Mem[0000000030181400] = 000000ff, %l1 = 00000000000000ff
	ldsha	[%i6+%g0]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[00000000300c1400] = ffff00ff, %l6 = 000000000000ffff
	ldswa	[%i3+%g0]0x81,%l6	! %l6 = ffffffffffff00ff
!	Mem[0000000030041408] = 0000000000000000, %f6  = 00000000 00000000
	ldda	[%i1+%o4]0x81,%f6 	! %f6  = 00000000 00000000
!	Mem[0000000010001400] = ff00ff00, %l3 = 0000000000000000
	ldsha	[%i0+%g0]0x80,%l3	! %l3 = ffffffffffffff00
!	Mem[0000000010041410] = ffffffff, %l4 = ffffffffffffffff
	lduwa	[%i1+%o5]0x80,%l4	! %l4 = 00000000ffffffff
!	Starting 10 instruction Store Burst
!	Mem[0000000030041410] = 000000ff, %l5 = 00000000000000ff
	ldstuba	[%i1+%o5]0x89,%l5	! %l5 = 000000ff000000ff

p0_label_482:
!	Mem[00000000300c1408] = ff000000, %l4 = 00000000ffffffff
	swapa	[%i3+%o4]0x81,%l4	! %l4 = 00000000ff000000
!	Mem[00000000201c0001] = 0000af65, %l2 = 00000000000000ff
	ldstuba	[%o0+0x001]%asi,%l2	! %l2 = 00000000000000ff
!	%f26 = 00000000 000000ff, %l5 = 00000000000000ff
!	Mem[0000000010101410] = 000000ff000000ff
	add	%i4,0x010,%g1
	stda	%f26,[%g1+%l5]ASI_PST8_PL ! Mem[0000000010101410] = ff00000000000000
!	Mem[0000000030141410] = 864fc963, %l5 = 00000000000000ff
	ldstuba	[%i5+%o5]0x89,%l5	! %l5 = 00000063000000ff
!	%l0 = ff000000, %l1 = 000000ff, Mem[0000000010181400] = ffffffff 0000ffff
	stda	%l0,[%i6+%g0]0x80	! Mem[0000000010181400] = ff000000 000000ff
!	%f3  = ff4fc963, Mem[00000000100c1408] = 00000000
	sta	%f3 ,[%i3+%o4]0x88	! Mem[00000000100c1408] = ff4fc963
!	Mem[0000000010041408] = 6ea90000, %l3 = ffffffffffffff00
	swapa	[%i1+%o4]0x88,%l3	! %l3 = 000000006ea90000
!	Mem[0000000030041400] = ff000000, %l1 = 00000000000000ff
	swapa	[%i1+%g0]0x89,%l1	! %l1 = 00000000ff000000
!	%f12 = db8bc3ff ffffffff, %l4 = 00000000ff000000
!	Mem[0000000030081420] = ff000000ff0000ff
	add	%i2,0x020,%g1
	stda	%f12,[%g1+%l4]ASI_PST8_S ! Mem[0000000030081420] = ff000000ff0000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = ffffffff, %l4 = 00000000ff000000
	lduha	[%i1+%o5]0x80,%l4	! %l4 = 000000000000ffff

p0_label_483:
!	Mem[0000000021800100] = 00ffb49a, %l5 = 0000000000000063
	ldsba	[%o3+0x100]%asi,%l5	! %l5 = 0000000000000000
	membar	#Sync			! Added by membar checker (91)
!	Mem[0000000010181400] = ff000000 000000ff ffffffff 00000000
!	Mem[0000000010181410] = 0000a96e 0000864f 00000000 00000000
!	Mem[0000000010181420] = ff000000 00000000 ff000000 00000000
!	Mem[0000000010181430] = db8bc3ff ffffffff 000000ff 000000ff
	ldda	[%i6]ASI_BLK_AIUPL,%f16	! Block Load from 0000000010181400
!	Mem[0000000030141410] = 864fc9ff, %l0 = 00000000ff000000
	ldsha	[%i5+%o5]0x89,%l0	! %l0 = ffffffffffffc9ff
!	Mem[0000000010081408] = ffffffffff0000ff, %f4  = 00ffffff 000000ff
	ldda	[%i2+0x008]%asi,%f4 	! %f4  = ffffffff ff0000ff
!	Mem[0000000030181408] = 000000ff, %l0 = ffffffffffffc9ff
	ldsba	[%i6+%o4]0x81,%l0	! %l0 = 0000000000000000
!	Mem[000000001010141c] = 00000000, %l4 = 000000000000ffff
	lduba	[%i4+0x01c]%asi,%l4	! %l4 = 0000000000000000
!	Mem[0000000010081400] = 00000000, %l4 = 0000000000000000
	ldsba	[%i2+%g0]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000030081410] = 00000000 00000000, %l0 = 00000000, %l1 = ff000000
	ldda	[%i2+%o5]0x81,%l0	! %l0 = 0000000000000000 0000000000000000
!	Mem[0000000010001408] = ff0000ff 00000000, %l4 = 00000000, %l5 = 00000000
	ldda	[%i0+0x008]%asi,%l4	! %l4 = 00000000ff0000ff 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010101410] = ff000000, %l4 = 00000000ff0000ff
	swapa	[%i4+%o5]0x80,%l4	! %l4 = 00000000ff000000

p0_label_484:
!	%l2 = 0000000000000000, Mem[0000000030101408] = dc003100000000ff
	stxa	%l2,[%i4+%o4]0x81	! Mem[0000000030101408] = 0000000000000000
!	Mem[00000000100c1410] = 000000ff, %l6 = ffffffffffff00ff
	swapa	[%i3+%o5]0x88,%l6	! %l6 = 00000000000000ff
	membar	#Sync			! Added by membar checker (92)
!	%l5 = 0000000000000000, Mem[0000000010181400] = 000000ff
	stba	%l5,[%i6+%g0]0x88	! Mem[0000000010181400] = 00000000
!	%l6 = 000000ff, %l7 = 000000ff, Mem[0000000030041400] = ff000000 000000ff
	stda	%l6,[%i1+%g0]0x81	! Mem[0000000030041400] = 000000ff 000000ff
!	%l0 = 00000000, %l1 = 00000000, Mem[0000000010141408] = ff4f00ff 00000000
	stda	%l0,[%i5+%o4]0x80	! Mem[0000000010141408] = 00000000 00000000
!	%f10 = db8bc3ff ffffffff, %l3 = 000000006ea90000
!	Mem[00000000300c1420] = ffffffff000000ff
	add	%i3,0x020,%g1
	stda	%f10,[%g1+%l3]ASI_PST16_S ! Mem[00000000300c1420] = ffffffff000000ff
!	%l2 = 00000000, %l3 = 6ea90000, Mem[00000000100c1408] = 63c94fff 0000864f
	stda	%l2,[%i3+0x008]%asi	! Mem[00000000100c1408] = 00000000 6ea90000
!	%l2 = 00000000, %l3 = 6ea90000, Mem[0000000030141400] = 00000000 000000ff
	stda	%l2,[%i5+%g0]0x81	! Mem[0000000030141400] = 00000000 6ea90000
!	%l3 = 000000006ea90000, Mem[00000000201c0000] = 00ffaf65, %asi = 80
	stha	%l3,[%o0+0x000]%asi	! Mem[00000000201c0000] = 0000af65
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = ffffffff, %l0 = 0000000000000000
	ldswa	[%i6+%o4]0x88,%l0	! %l0 = ffffffffffffffff

p0_label_485:
!	Mem[0000000010101408] = ccbe12ae, %l2 = 0000000000000000
	ldsba	[%i4+%o4]0x80,%l2	! %l2 = ffffffffffffffcc
!	Mem[0000000010041408] = 00ffffff, %f4  = ffffffff
	lda	[%i1+%o4]0x80,%f4 	! %f4 = 00ffffff
!	Mem[0000000010181408] = 00000000ffffffff, %l6 = 00000000000000ff
	ldxa	[%i6+%o4]0x88,%l6	! %l6 = 00000000ffffffff
!	Mem[0000000010041428] = 00000000ff000000, %l3 = 000000006ea90000, %l1 = 0000000000000000
	add	%i1,0x28,%g1
	casxa	[%g1]0x80,%l3,%l1	! %l1 = 00000000ff000000
!	Mem[0000000030081408] = 00000000, %l0 = ffffffffffffffff
	ldswa	[%i2+%o4]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000010101400] = ff000000, %f0  = 00000000
	lda	[%i4+%g0]0x80,%f0 	! %f0 = ff000000
!	Mem[00000000300c1410] = ff0000ff, %l4 = 00000000ff000000
	ldswa	[%i3+%o5]0x89,%l4	! %l4 = ffffffffff0000ff
!	Mem[0000000010141408] = 00000000, %l1 = 00000000ff000000
	ldsba	[%i5+%o4]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010181400] = 00000000, %f2  = ff0000ff
	lda	[%i6+%g0]0x88,%f2 	! %f2 = 00000000
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1410] = ff00ffff, %l1 = 0000000000000000
	ldstuba	[%i3+0x010]%asi,%l1	! %l1 = 000000ff000000ff

!	Check Point 97 for processor 0

	set	p0_check_pt_data_97,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 0000000000000000
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = ffffffffffffffcc
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 000000006ea90000
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = ffffffffff0000ff
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 0000000000000000
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 00000000ffffffff
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = ff000000 5a6a6ea9
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x48],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = 00000000 ff4fc963
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x50],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 00ffffff ff0000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x58],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 00000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x60],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = db8bc3ff ffffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x68],%g3
	std	%f16,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f16 = ff000000 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf16,%g1
	ldx	[%g4+0x70],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = 00000000 ffffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1
	ldx	[%g4+0x78],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = 4f860000 6ea90000
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1
	ldx	[%g4+0x80],%g3
	std	%f22,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f22 = 00000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf22,%g1
	ldx	[%g4+0x88],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = 00000000 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1
	ldx	[%g4+0x90],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = 00000000 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1
	ldx	[%g4+0x98],%g3
	std	%f28,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f28 = ffffffff ffc38bdb
	bne	%xcc,p0_freg_check_fail
	mov	0xf28,%g1
	ldx	[%g4+0xa0],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = ff000000 ff000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 97 completed


p0_label_486:
!	%f2  = 00000000 ff4fc963, %l3 = 000000006ea90000
!	Mem[0000000010141418] = 00000000000000ff
	add	%i5,0x018,%g1
	stda	%f2,[%g1+%l3]ASI_PST8_PL ! Mem[0000000010141418] = 00000000000000ff
!	%l3 = 000000006ea90000, Mem[0000000030181410] = ffffffff
	stwa	%l3,[%i6+%o5]0x89	! Mem[0000000030181410] = 6ea90000
!	%l1 = 00000000000000ff, Mem[00000000300c1400] = ffff00ff
	stha	%l1,[%i3+%g0]0x81	! Mem[00000000300c1400] = 00ff00ff
!	%l6 = ffffffff, %l7 = 000000ff, Mem[0000000030001400] = 00ffffff ff000000
	stda	%l6,[%i0+%g0]0x81	! Mem[0000000030001400] = ffffffff 000000ff
!	Mem[0000000030101410] = ffff00ff, %l2 = ffffffffffffffcc
	swapa	[%i4+%o5]0x81,%l2	! %l2 = 00000000ffff00ff
!	%f27 = 000000ff, Mem[0000000010081400] = 00000000
	sta	%f27,[%i2+%g0]0x88	! Mem[0000000010081400] = 000000ff
!	%f10 = db8bc3ff ffffffff, Mem[0000000030101408] = 00000000 00000000
	stda	%f10,[%i4+%o4]0x81	! Mem[0000000030101408] = db8bc3ff ffffffff
!	%f30 = ff000000 ff000000, Mem[0000000010101418] = 703f71ab 00000000
	stda	%f30,[%i4+0x018]%asi	! Mem[0000000010101418] = ff000000 ff000000
!	%l6 = 00000000ffffffff, Mem[00000000300c1408] = ffffffff
	stwa	%l6,[%i3+%o4]0x81	! Mem[00000000300c1408] = ffffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = 00000000, %l5 = 0000000000000000
	ldswa	[%i1+%o4]0x81,%l5	! %l5 = 0000000000000000

p0_label_487:
!	Mem[00000000100c1400] = ffffffff, %f23 = 00000000
	lda	[%i3+%g0]0x88,%f23	! %f23 = ffffffff
!	Mem[00000000201c0000] = 0000af65, %l7 = 00000000000000ff
	ldsh	[%o0+%g0],%l7		! %l7 = 0000000000000000
!	Mem[0000000030001408] = 00ffffff, %l7 = 0000000000000000
	lduwa	[%i0+%o4]0x81,%l7	! %l7 = 0000000000ffffff
!	Mem[0000000010041408] = ffffff00, %l6 = 00000000ffffffff
	ldswa	[%i1+%o4]0x88,%l6	! %l6 = ffffffffffffff00
!	Mem[0000000010101400] = ff000000, %l2 = 00000000ffff00ff
	ldswa	[%i4+%g0]0x80,%l2	! %l2 = ffffffffff000000
!	Mem[0000000030141410] = 864fc9ff, %l4 = ffffffffff0000ff
	lduba	[%i5+%o5]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[00000000100c1410] = ff00ffff, %l7 = 0000000000ffffff
	ldsba	[%i3+%o5]0x80,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010041424] = 00000000, %l7 = ffffffffffffffff
	lduba	[%i1+0x026]%asi,%l7	! %l7 = 0000000000000000
!	Mem[0000000030081410] = 00000000, %l5 = 0000000000000000
	ldsba	[%i2+%o5]0x89,%l5	! %l5 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f28 = ffffffff, Mem[0000000030001408] = ffffff00
	sta	%f28,[%i0+%o4]0x89	! Mem[0000000030001408] = ffffffff

p0_label_488:
!	Mem[00000000100c1408] = 00000000, %l2 = ffffffffff000000
	swapa	[%i3+%o4]0x88,%l2	! %l2 = 0000000000000000
!	Mem[00000000100c142d] = 003100dc, %l6 = ffffffffffffff00
	ldstuba	[%i3+0x02d]%asi,%l6	! %l6 = 00000031000000ff
!	%f28 = ffffffff ffc38bdb, Mem[0000000030141410] = ffc94f86 000000ff
	stda	%f28,[%i5+%o5]0x81	! Mem[0000000030141410] = ffffffff ffc38bdb
!	%f14 = 000000ff 000000ff, %l6 = 0000000000000031
!	Mem[0000000010041408] = 00ffffff00000000
	add	%i1,0x008,%g1
	stda	%f14,[%g1+%l6]ASI_PST32_PL ! Mem[0000000010041408] = ff00000000000000
!	Mem[00000000100c1400] = ffffffff00000000, %l3 = 000000006ea90000, %l5 = 0000000000000000
	casxa	[%i3]0x80,%l3,%l5	! %l5 = ffffffff00000000
!	Mem[0000000020800001] = ffff7d94, %l6 = 0000000000000031
	ldstuba	[%o1+0x001]%asi,%l6	! %l6 = 000000ff000000ff
!	%l7 = 0000000000000000, Mem[0000000010001408] = ff0000ff
	stha	%l7,[%i0+%o4]0x88	! Mem[0000000010001408] = ff000000
!	%f7  = 00000000, Mem[0000000030001410] = 000000ff
	sta	%f7 ,[%i0+%o5]0x89	! Mem[0000000030001410] = 00000000
!	%f18 = 00000000 ffffffff, Mem[0000000030181408] = ff000000 000000ff
	stda	%f18,[%i6+%o4]0x89	! Mem[0000000030181408] = 00000000 ffffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = ff00000000000000, %f26 = 00000000 000000ff
	ldda	[%i6+%g0]0x88,%f26	! %f26 = ff000000 00000000

p0_label_489:
!	Mem[0000000010181410] = 4f860000 6ea90000, %l4 = 000000ff, %l5 = 00000000
	ldda	[%i6+%o5]0x88,%l4	! %l4 = 000000006ea90000 000000004f860000
!	Mem[0000000010041408] = 000000ff, %l0 = 0000000000000000
	lduha	[%i1+%o4]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030141408] = 00ffffff, %l3 = 000000006ea90000
	ldsba	[%i5+%o4]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000021800180] = 00ff2200, %l7 = 0000000000000000
	ldsh	[%o3+0x180],%l7		! %l7 = 00000000000000ff
!	Mem[0000000020800040] = ffffac70, %l6 = 00000000000000ff
	lduh	[%o1+0x040],%l6		! %l6 = 000000000000ffff
!	Mem[0000000010181410] = 6ea90000, %f29 = ffc38bdb
	lda	[%i6+%o5]0x88,%f29	! %f29 = 6ea90000
!	Mem[0000000010181418] = 00000000 00000000, %l6 = 0000ffff, %l7 = 000000ff
	ldd	[%i6+0x018],%l6		! %l6 = 0000000000000000 0000000000000000
!	Mem[0000000030041400] = ff000000, %l0 = 00000000000000ff
	lduwa	[%i1+%g0]0x89,%l0	! %l0 = 00000000ff000000
!	Mem[0000000030101410] = ffffffffccffffff, %l7 = 0000000000000000
	ldxa	[%i4+%o5]0x89,%l7	! %l7 = ffffffffccffffff
!	Starting 10 instruction Store Burst
!	Mem[0000000030141400] = 00000000, %l5 = 000000004f860000
	swapa	[%i5+%g0]0x89,%l5	! %l5 = 0000000000000000

p0_label_490:
!	Mem[0000000030101408] = ffc38bdb, %l6 = 0000000000000000
	swapa	[%i4+%o4]0x89,%l6	! %l6 = 00000000ffc38bdb
!	Mem[0000000030081410] = 00000000, %l4 = 000000006ea90000
	ldstuba	[%i2+%o5]0x81,%l4	! %l4 = 00000000000000ff
!	%f6  = 00000000, Mem[0000000030041408] = 00000000
	sta	%f6 ,[%i1+%o4]0x89	! Mem[0000000030041408] = 00000000
!	%l2 = 0000000000000000, Mem[0000000030101408] = 00000000
	stba	%l2,[%i4+%o4]0x81	! Mem[0000000030101408] = 00000000
!	%f31 = ff000000, Mem[0000000030081408] = 00000000
	sta	%f31,[%i2+%o4]0x89	! Mem[0000000030081408] = ff000000
!	%f18 = 00000000 ffffffff, Mem[0000000010101400] = ff000000 ff000000
	stda	%f18,[%i4+%g0]0x80	! Mem[0000000010101400] = 00000000 ffffffff
!	%l6 = 00000000ffc38bdb, Mem[0000000010181403] = 00000000
	stb	%l6,[%i6+0x003]		! Mem[0000000010181400] = 000000db
!	Mem[000000001018142e] = 00000000, %l4 = 0000000000000000
	ldstuba	[%i6+0x02e]%asi,%l4	! %l4 = 00000000000000ff
!	%l6 = 00000000ffc38bdb, Mem[0000000020800040] = ffffac70
	sth	%l6,[%o1+0x040]		! Mem[0000000020800040] = 8bdbac70
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = 000000ff000000ff, %l2 = 0000000000000000
	ldxa	[%i6+%g0]0x89,%l2	! %l2 = 000000ff000000ff

!	Check Point 98 for processor 0

	set	p0_check_pt_data_98,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 00000000ff000000
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l2,%g2			! %l2 = 000000ff000000ff
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l3,%g2			! %l3 = 0000000000000000
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l4,%g2			! %l4 = 0000000000000000
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l5,%g2			! %l5 = 0000000000000000
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l6,%g2			! %l6 = 00000000ffc38bdb
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l7,%g2			! %l7 = ffffffffccffffff
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x40],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 00ffffff ff0000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x48],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 00000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x50],%g3
	std	%f22,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f22 = 00000000 ffffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf22,%g1
	ldx	[%g4+0x58],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = ff000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1
	ldx	[%g4+0x60],%g3
	std	%f28,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f28 = ffffffff 6ea90000
	bne	%xcc,p0_freg_check_fail
	mov	0xf28,%g1

!	Check Point 98 completed


p0_label_491:
!	Mem[0000000021800000] = 1a7bd0b4, %l5 = 0000000000000000
	ldsba	[%o3+0x001]%asi,%l5	! %l5 = 000000000000007b
!	Mem[00000000201c0000] = 0000af65, %l7 = ffffffffccffffff
	lduha	[%o0+0x000]%asi,%l7	! %l7 = 0000000000000000
!	Mem[0000000010181408] = 00000000ffffffff, %l1 = 00000000000000ff
	ldxa	[%i6+%o4]0x88,%l1	! %l1 = 00000000ffffffff
!	Mem[00000000100c1428] = ff000000, %f11 = ffffffff
	ld	[%i3+0x028],%f11	! %f11 = ff000000
!	Mem[0000000030141410] = ffffffff, %l5 = 000000000000007b
	lduba	[%i5+%o5]0x81,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010141420] = 00000000, %f5  = ff0000ff
	lda	[%i5+0x020]%asi,%f5 	! %f5 = 00000000
!	Mem[0000000010181400] = db000000, %l4 = 0000000000000000
	ldsba	[%i6+%g0]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000030041400] = 000000ff, %l7 = 0000000000000000
	lduba	[%i1+%g0]0x81,%l7	! %l7 = 0000000000000000
!	Mem[000000001010142c] = 00000000, %l2 = 000000ff000000ff
	ldswa	[%i4+0x02c]%asi,%l2	! %l2 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l1 = 00000000ffffffff, Mem[000000001000143b] = 63c94f86
	stb	%l1,[%i0+0x03b]		! Mem[0000000010001438] = 63c94fff

p0_label_492:
!	Mem[0000000030141408] = ffffff00, %l6 = 00000000ffc38bdb
	swapa	[%i5+%o4]0x89,%l6	! %l6 = 00000000ffffff00
!	%l5 = 00000000000000ff, Mem[0000000010181400] = 000000db
	stwa	%l5,[%i6+%g0]0x80	! Mem[0000000010181400] = 000000ff
!	Mem[00000000100c140b] = 000000ff, %l2 = 0000000000000000
	ldstub	[%i3+0x00b],%l2		! %l2 = 000000ff000000ff
!	%l0 = 00000000ff000000, Mem[00000000300c1410] = ff0000ff
	stha	%l0,[%i3+%o5]0x81	! Mem[00000000300c1410] = 000000ff
!	Mem[0000000010081408] = ffffffff, %l2 = 00000000000000ff
	swapa	[%i2+%o4]0x88,%l2	! %l2 = 00000000ffffffff
!	%f24 = 00000000 000000ff, %l3 = 0000000000000000
!	Mem[00000000300c1420] = ffffffff000000ff
	add	%i3,0x020,%g1
	stda	%f24,[%g1+%l3]ASI_PST16_SL ! Mem[00000000300c1420] = ffffffff000000ff
!	Mem[00000000100c1408] = ff000000, %l3 = 0000000000000000
	swapa	[%i3+%o4]0x88,%l3	! %l3 = 00000000ff000000
!	Mem[0000000010001428] = 000000ffff000000, %l5 = 00000000000000ff, %l1 = 00000000ffffffff
	add	%i0,0x28,%g1
	casxa	[%g1]0x80,%l5,%l1	! %l1 = 000000ffff000000
!	Mem[00000000100c1400] = ffffffff, %l5 = 00000000000000ff
	ldstuba	[%i3+%g0]0x88,%l5	! %l5 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = ff000000ccbe12ae, %f0  = ff000000 5a6a6ea9
	ldda	[%i2+%g0]0x80,%f0 	! %f0  = ff000000 ccbe12ae

p0_label_493:
!	Mem[0000000010141408] = 00000000, %l1 = 000000ffff000000
	ldswa	[%i5+%o4]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000010181400] = ff000000ff000000, %f16 = ff000000 000000ff
	ldda	[%i6+%g0]0x88,%f16	! %f16 = ff000000 ff000000
!	Mem[0000000030101410] = ffffffcc, %l2 = 00000000ffffffff
	lduwa	[%i4+%o5]0x81,%l2	! %l2 = 00000000ffffffcc
!	Mem[0000000010041408] = ff00000000000000, %f10 = db8bc3ff ff000000
	ldd	[%i1+%o4],%f10		! %f10 = ff000000 00000000
!	Mem[0000000010181408] = ffffffff, %f26 = ff000000
	lda	[%i6+%o4]0x80,%f26	! %f26 = ffffffff
!	Mem[00000000100c1400] = ffffffff, %l4 = 0000000000000000
	lduba	[%i3+%g0]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030101410] = ffffffcc, %l3 = 00000000ff000000
	ldsba	[%i4+%o5]0x81,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010041408] = ff000000, %l1 = 0000000000000000
	ldswa	[%i1+%o4]0x80,%l1	! %l1 = ffffffffff000000
!	Mem[0000000010141408] = 0000000000000000, %f16 = ff000000 ff000000
	ldda	[%i5+%o4]0x88,%f16	! %f16 = 00000000 00000000
!	Starting 10 instruction Store Burst
!	%l3 = ffffffffffffffff, Mem[0000000030141408] = db8bc3ff
	stba	%l3,[%i5+%o4]0x81	! Mem[0000000030141408] = ff8bc3ff

p0_label_494:
!	%f24 = 00000000, Mem[0000000010141418] = 00000000
	sta	%f24,[%i5+0x018]%asi	! Mem[0000000010141418] = 00000000
!	%l6 = 00000000ffffff00, Mem[0000000030041400] = ff000000
	stba	%l6,[%i1+%g0]0x89	! Mem[0000000030041400] = ff000000
!	%l4 = 00000000000000ff, Mem[0000000010141408] = 00000000, %asi = 80
	stwa	%l4,[%i5+0x008]%asi	! Mem[0000000010141408] = 000000ff
!	%l7 = 0000000000000000, Mem[0000000030001410] = 00000000ff000000
	stxa	%l7,[%i0+%o5]0x81	! Mem[0000000030001410] = 0000000000000000
!	%l5 = 00000000000000ff, Mem[0000000010141408] = 00000000ff000000
	stxa	%l5,[%i5+%o4]0x88	! Mem[0000000010141408] = 00000000000000ff
!	%f16 = 00000000 00000000 00000000 ffffffff
!	%f20 = 4f860000 6ea90000 00000000 ffffffff
!	%f24 = 00000000 000000ff ffffffff 00000000
!	%f28 = ffffffff 6ea90000 ff000000 ff000000
	stda	%f16,[%i0]ASI_BLK_S	! Block Store to 0000000030001400
!	%l4 = 00000000000000ff, Mem[0000000010041414] = ff000000, %asi = 80
	stha	%l4,[%i1+0x014]%asi	! Mem[0000000010041414] = 00ff0000
!	%l3 = ffffffffffffffff, Mem[0000000030141400] = 4f860000
	stha	%l3,[%i5+%g0]0x89	! Mem[0000000030141400] = 4f86ffff
!	%l3 = ffffffffffffffff, Mem[00000000100c1400] = ffffffff
	stwa	%l3,[%i3+%g0]0x80	! Mem[00000000100c1400] = ffffffff
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (93)
!	Mem[0000000030001408] = 00000000, %l3 = ffffffffffffffff
	lduwa	[%i0+%o4]0x81,%l3	! %l3 = 0000000000000000

p0_label_495:
!	Mem[0000000010041400] = ff0000ff, %l0 = 00000000ff000000
	ldswa	[%i1+%g0]0x80,%l0	! %l0 = ffffffffff0000ff
!	Mem[0000000030001408] = 00000000ffffffff, %f10 = ff000000 00000000
	ldda	[%i0+%o4]0x81,%f10	! %f10 = 00000000 ffffffff
!	Mem[000000001004142c] = ff000000, %l2 = 00000000ffffffcc
	ldsba	[%i1+0x02f]%asi,%l2	! %l2 = 0000000000000000
!	Mem[0000000010141408] = ff000000, %l4 = 00000000000000ff
	lduwa	[%i5+%o4]0x80,%l4	! %l4 = 00000000ff000000
!	Mem[0000000010141408] = 000000ff, %l4 = 00000000ff000000
	lduwa	[%i5+%o4]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030081400] = 00000000, %l3 = 0000000000000000
	ldsha	[%i2+%g0]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000010081408] = ff000000, %f17 = 00000000
	lda	[%i2+%o4]0x80,%f17	! %f17 = ff000000
!	Mem[0000000010041410] = ffffffff, %l0 = ffffffffff0000ff
	ldsha	[%i1+%o5]0x88,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000030041400] = 000000ff, %f26 = ffffffff
	lda	[%i1+%g0]0x81,%f26	! %f26 = 000000ff
!	Starting 10 instruction Store Burst
!	%l1 = ffffffffff000000, Mem[0000000030101408] = 00000000
	stha	%l1,[%i4+%o4]0x89	! Mem[0000000030101408] = 00000000

!	Check Point 99 for processor 0

	set	p0_check_pt_data_99,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = ffffffffffffffff
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = ffffffffff000000
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 0000000000000000
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 0000000000000000
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l7,%g2			! %l7 = 0000000000000000
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x40],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = ff000000 ccbe12ae
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x48],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 00ffffff 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x50],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = 00000000 ffffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x58],%g3
	std	%f16,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f16 = 00000000 ff000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf16,%g1
	ldx	[%g4+0x60],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = 000000ff 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1

!	Check Point 99 completed


p0_label_496:
!	%l0 = ffffffffffffffff, Mem[0000000010141400] = 00ffffff
	stwa	%l0,[%i5+%g0]0x80	! Mem[0000000010141400] = ffffffff
!	Mem[0000000010141410] = 00ff0000, %l4 = 00000000000000ff
	ldstuba	[%i5+%o5]0x88,%l4	! %l4 = 00000000000000ff
!	%f10 = 00000000 ffffffff, Mem[00000000100c1400] = ffffffff 00000000
	stda	%f10,[%i3+%g0]0x80	! Mem[00000000100c1400] = 00000000 ffffffff
!	%l0 = ffffffffffffffff, Mem[0000000010181408] = ffffffff
	stha	%l0,[%i6+%o4]0x80	! Mem[0000000010181408] = ffffffff
!	%l1 = ffffffffff000000, Mem[0000000030081410] = 000000ff
	stwa	%l1,[%i2+%o5]0x89	! Mem[0000000030081410] = ff000000
!	%l1 = ffffffffff000000, Mem[0000000030181400] = 000000ff
	stwa	%l1,[%i6+%g0]0x89	! Mem[0000000030181400] = ff000000
!	Mem[0000000030141400] = ffff864f, %l2 = 0000000000000000
	swapa	[%i5+%g0]0x81,%l2	! %l2 = 00000000ffff864f
!	%l7 = 0000000000000000, Mem[0000000010181400] = ff000000ff000000
	stxa	%l7,[%i6+%g0]0x88	! Mem[0000000010181400] = 0000000000000000
!	%f3  = ff4fc963, Mem[000000001008143c] = 00000000
	st	%f3 ,[%i2+0x03c]	! Mem[000000001008143c] = ff4fc963
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = 000000ff ff000000, %l0 = ffffffff, %l1 = ff000000
	ldda	[%i6+%g0]0x89,%l0	! %l0 = 00000000ff000000 00000000000000ff

p0_label_497:
!	Mem[00000000100c1404] = ffffffff, %l0 = 00000000ff000000
	ldsba	[%i3+0x006]%asi,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000030041408] = 00000000, %l4 = 0000000000000000
	ldsha	[%i1+%o4]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000010081410] = 6ea90000 00000000, %l2 = ffff864f, %l3 = 00000000
	ldda	[%i2+%o5]0x80,%l2	! %l2 = 000000006ea90000 0000000000000000
!	Mem[0000000010181400] = 00000000 00000000, %l2 = 6ea90000, %l3 = 00000000
	ldda	[%i6+%g0]0x88,%l2	! %l2 = 0000000000000000 0000000000000000
!	Mem[000000001004143c] = 0000864f, %l7 = 0000000000000000
	lduw	[%i1+0x03c],%l7		! %l7 = 000000000000864f
!	Mem[0000000010101400] = 00000000, %l0 = ffffffffffffffff
	lduwa	[%i4+%g0]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000010001408] = 00000000ff000000, %f16 = 00000000 ff000000
	ldda	[%i0+%o4]0x88,%f16	! %f16 = 00000000 ff000000
!	Mem[0000000021800180] = 00ff2200, %l7 = 000000000000864f
	ldub	[%o3+0x180],%l7		! %l7 = 0000000000000000
!	Mem[00000000100c1408] = 00000000, %l2 = 0000000000000000
	ldsba	[%i3+%o4]0x88,%l2	! %l2 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f10 = 00000000 ffffffff, %l4 = 0000000000000000
!	Mem[0000000030101400] = ff000000ff000000
	stda	%f10,[%i4+%l4]ASI_PST8_SL ! Mem[0000000030101400] = ff000000ff000000

p0_label_498:
!	Mem[0000000010001438] = 63c94fff, %l3 = 0000000000000000, %asi = 80
	swapa	[%i0+0x038]%asi,%l3	! %l3 = 0000000063c94fff
!	Mem[00000000300c1400] = ff00ff00, %l3 = 0000000063c94fff
	ldstuba	[%i3+%g0]0x89,%l3	! %l3 = 00000000000000ff
!	%l4 = 0000000000000000, Mem[0000000010101428] = 0000000000000000
	stx	%l4,[%i4+0x028]		! Mem[0000000010101428] = 0000000000000000
!	%l5 = 00000000000000ff, Mem[0000000010081410] = 6ea9000000000000
	stxa	%l5,[%i2+%o5]0x80	! Mem[0000000010081410] = 00000000000000ff
!	Mem[00000000100c140c] = 6ea90000, %l3 = 00000000, %l4 = 00000000
	add	%i3,0x0c,%g1
	casa	[%g1]0x80,%l3,%l4	! %l4 = 000000006ea90000
!	Mem[0000000010001410] = ff000000, %l5 = 00000000000000ff
	ldstuba	[%i0+%o5]0x80,%l5	! %l5 = 000000ff000000ff
!	Mem[0000000010081410] = 00000000, %l5 = 00000000000000ff
	ldstuba	[%i2+%o5]0x80,%l5	! %l5 = 00000000000000ff
!	%f18 = 00000000 ffffffff, Mem[00000000100c1400] = 00000000 ffffffff
	stda	%f18,[%i3+%g0]0x88	! Mem[00000000100c1400] = 00000000 ffffffff
!	%l6 = 00000000ffffff00, Mem[0000000030141400] = 000000006ea90000
	stxa	%l6,[%i5+%g0]0x81	! Mem[0000000030141400] = 00000000ffffff00
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = 00000000, %l0 = 0000000000000000
	lduwa	[%i4+%o4]0x89,%l0	! %l0 = 0000000000000000

p0_label_499:
!	Mem[0000000020800000] = ffff7d94, %l1 = 00000000000000ff
	ldsb	[%o1+0x001],%l1		! %l1 = ffffffffffffffff
!	Mem[00000000201c0000] = 0000af65, %l2 = 0000000000000000
	ldsb	[%o0+%g0],%l2		! %l2 = 0000000000000000
!	Mem[0000000030081408] = 000000ff, %l1 = ffffffffffffffff
	lduba	[%i2+%o4]0x81,%l1	! %l1 = 0000000000000000
!	Mem[00000000300c1400] = ff00ffff, %l1 = 0000000000000000
	lduba	[%i3+%g0]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[00000000100c1420] = 18000000, %f0  = ff000000
	ld	[%i3+0x020],%f0 	! %f0 = 18000000
!	Mem[0000000010001400] = ff00ff00, %l4 = 000000006ea90000
	ldsh	[%i0+0x002],%l4		! %l4 = ffffffffffffff00
!	Mem[00000000100c1408] = 0000a96e 00000000, %l2 = 00000000, %l3 = 00000000
	ldda	[%i3+%o4]0x88,%l2	! %l2 = 0000000000000000 000000000000a96e
!	Mem[00000000300c1408] = ffffffff, %l3 = 000000000000a96e
	ldswa	[%i3+%o4]0x81,%l3	! %l3 = ffffffffffffffff
!	Mem[00000000218000c0] = ffff65e1, %l0 = 0000000000000000
	ldub	[%o3+0x0c0],%l0		! %l0 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%f17 = ff000000, Mem[0000000010101408] = ae12becc
	sta	%f17,[%i4+%o4]0x88	! Mem[0000000010101408] = ff000000

p0_label_500:
!	Mem[0000000010181400] = 00000000, %l1 = 00000000000000ff
	ldstuba	[%i6+%g0]0x80,%l1	! %l1 = 00000000000000ff
!	%l7 = 0000000000000000, Mem[0000000010181400] = ff000000, %asi = 80
	stba	%l7,[%i6+0x000]%asi	! Mem[0000000010181400] = 00000000
!	%l2 = 00000000, %l3 = ffffffff, Mem[0000000010181410] = 0000a96e 0000864f
	stda	%l2,[%i6+%o5]0x80	! Mem[0000000010181410] = 00000000 ffffffff
!	Mem[0000000010181414] = ffffffff, %l1 = 0000000000000000
	ldstub	[%i6+0x014],%l1		! %l1 = 000000ff000000ff
!	Mem[00000000100c1410] = ff00ffff, %l7 = 0000000000000000
	swapa	[%i3+%o5]0x80,%l7	! %l7 = 00000000ff00ffff
!	Mem[0000000030001400] = 00000000, %l1 = 00000000000000ff
	ldstuba	[%i0+%g0]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010081410] = 000000ff, %l6 = 00000000ffffff00
	ldstuba	[%i2+%o5]0x88,%l6	! %l6 = 000000ff000000ff
!	%l1 = 0000000000000000, Mem[0000000010181408] = ffffffff
	stba	%l1,[%i6+%o4]0x88	! Mem[0000000010181408] = ffffff00
!	Mem[0000000030041408] = 00000000, %l6 = 00000000000000ff
	swapa	[%i1+%o4]0x89,%l6	! %l6 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = ff000000, %f17 = ff000000
	lda	[%i4+%g0]0x81,%f17	! %f17 = ff000000

!	Check Point 100 for processor 0

	set	p0_check_pt_data_100,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 0000000000000000
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 0000000000000000
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = ffffffffffffffff
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = ffffffffffffff00
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 0000000000000000
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 0000000000000000
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 00000000ff00ffff
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = 18000000 ccbe12ae
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x50],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = 00000000 ff4fc963
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x58],%g3
	std	%f16,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f16 = 00000000 ff000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf16,%g1

!	Check Point 100 completed


	ba,a	p0_not_taken_0_end
p0_not_taken_0:
!	The following code should not be executed
	ldx	[%i2+0x028],%l4
	sta	%l2,[%i3+0x03c]%asi
	stba	%l3,[%i6+0x017]%asi
	ldda	[%i6+0x010]%asi,%l6
	ldda	[%i1+0x028]%asi,%l0
	ldsba	[%i3+0x03a]%asi,%l2
	ba,a	p0_branch_failed
p0_not_taken_0_end:


!	End of Random Code for Thread 0


!	Check Registers

p0_check_registers:
	set	p0_expected_registers,%g1

!	Check %y register

	set	0x00000028,%g2
	rd	%y,%g3
	cmp	%g2,%g3
	bne,a	p0_failed
	mov	0x111,%g1

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
p0_ccr_fail:
	ba	p0_failed
	mov	%g5,%g3			! %g5 = %ccr
p0_reg_check_fail0:
	ba	p0_failed
	mov	%l0,%g3			! Reg %l0 compare failed
p0_reg_check_fail1:
	ba	p0_failed
	mov	%l1,%g3			! Reg %l1 compare failed
p0_reg_check_fail2:
	ba	p0_failed
	mov	%l2,%g3			! Reg %l2 compare failed
p0_reg_check_fail3:
	ba	p0_failed
	mov	%l3,%g3			! Reg %l3 compare failed
p0_reg_check_fail4:
	ba	p0_failed
	mov	%l4,%g3			! Reg %l4 compare failed
p0_reg_check_fail5:
	ba	p0_failed
	mov	%l5,%g3			! Reg %l5 compare failed
p0_reg_check_fail6:
	ba	p0_failed
	mov	%l6,%g3			! Reg %l6 compare failed
p0_reg_check_fail7:
	ba	p0_failed
	mov	%l7,%g3			! Reg %l7 compare failed
p0_freg_check_fail:
	ba	p0_failed
	nop

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
	or	%l7,-0x49d,%l0
	lduba	[%i1+%g0]ASI_AS_IF_USER_PRIMARY,%l5	! Mem[0000000010041400]
	ldstuba	[%i3+%o5]ASI_AS_IF_USER_PRIMARY,%l4	! Mem[00000000100c1410]
	membar	#Sync
	ldda	[%i6]ASI_BLK_AIUP,%f0
	membar	#Sync
	stxa	%l7,[%i5+%o4]ASI_AS_IF_USER_PRIMARY	! Mem[0000000010141408]
	stda	%l0,[%i3+%o4]ASI_AS_IF_USER_PRIMARY	! Mem[00000000100c1408]
	nop
	done

p0_trap1o:
	or	%l7,-0x49d,%l0
	lduba	[%o1+%g0]ASI_AS_IF_USER_PRIMARY,%l5	! Mem[0000000010041400]
	ldstuba	[%o3+%i5]ASI_AS_IF_USER_PRIMARY,%l4	! Mem[00000000100c1410]
	membar	#Sync
	ldda	[%o6]ASI_BLK_AIUP,%f0
	membar	#Sync
	stxa	%l7,[%o5+%i4]ASI_AS_IF_USER_PRIMARY	! Mem[0000000010141408]
	stda	%l0,[%o3+%i4]ASI_AS_IF_USER_PRIMARY	! Mem[00000000100c1408]
	nop
	done


p0_trap2e:
	xnor	%l6,%l4,%l4
	ldxa	[%i1+%g0]ASI_AS_IF_USER_PRIMARY,%l5	! Mem[0000000010041400]
	stwa	%l5,[%i0+%o5]ASI_AS_IF_USER_PRIMARY	! Mem[0000000010001410]
	subc	%l6,0xe9e,%l5
	udivx	%l6,0xca0,%l5
	membar	#Sync
	ldda	[%i0]ASI_BLK_AIUP,%f16
	membar	#Sync
	done

p0_trap2o:
	xnor	%l6,%l4,%l4
	ldxa	[%o1+%g0]ASI_AS_IF_USER_PRIMARY,%l5	! Mem[0000000010041400]
	stwa	%l5,[%o0+%i5]ASI_AS_IF_USER_PRIMARY	! Mem[0000000010001410]
	subc	%l6,0xe9e,%l5
	udivx	%l6,0xca0,%l5
	membar	#Sync
	ldda	[%o0]ASI_BLK_AIUP,%f16
	membar	#Sync
	done


p0_trap3e:
	and	%l5,%l5,%l5
	or	%l3,0x268,%l6
	xor	%l5,-0xcb5,%l5
	done

p0_trap3o:
	and	%l5,%l5,%l5
	or	%l3,0x268,%l6
	xor	%l5,-0xcb5,%l5
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
	ldx	[%g1+0x000],%l0		! %l0 = f3570731b220bd9e
	ldx	[%g1+0x008],%l1		! %l1 = 03a34c5ec743fb63
	ldx	[%g1+0x010],%l2		! %l2 = 6de6b199fded1bc2
	ldx	[%g1+0x018],%l3		! %l3 = 8d1c5c5c1976768a
	ldx	[%g1+0x020],%l4		! %l4 = 378f565e264e39e7
	ldx	[%g1+0x028],%l5		! %l5 = c2e009084dfacbb7
	ldx	[%g1+0x030],%l6		! %l6 = f4c78770cd3cb229
	ldx	[%g1+0x038],%l7		! %l7 = 0225c199f4ff286c

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
	or	%l7,-0x49d,%l0
	jmpl	%o7,%g0
	ldsh	[%i2+0x000],%l3		! Mem[0000000010081400]
p0_near_0_he:
	ldx	[%i5+0x018],%l3		! Mem[0000000010141418]
	jmpl	%o7,%g0
	st	%f24,[%i3+0x03c]	! Mem[00000000100c143c]
near0_b2b_h:
	xnor	%l4,-0x826,%l5
	andn	%l2,-0x062,%l7
	and	%l6,%l5,%l2
	smul	%l3,0xf23,%l1
	xnor	%l0,-0x588,%l2
	jmpl	%o7,%g0
	umul	%l6,%l5,%l3
near0_b2b_l:
	umul	%l1,-0x0ee,%l5
	umul	%l0,-0xb1e,%l2
	xor	%l1,0x4f8,%l3
	nop
	sdivx	%l2,%l6,%l0
	jmpl	%o7,%g0
	umul	%l1,%l4,%l4
user_near0_end:
	.seg	"text"
	.align	0x2000
user_near1_start:
p0_near_1_le:
	ldd	[%i0+0x010],%l4		! Mem[0000000010001410]
	xor	%l5,0xdca,%l3
	ldd	[%i5+0x010],%l2		! Mem[0000000010141410]
	ldd	[%i1+0x008],%l2		! Mem[0000000010041408]
	swap	[%i2+0x03c],%l6		! Mem[000000001008143c]
	and	%l1,%l2,%l5
	std	%f4 ,[%i5+0x030]	! Mem[0000000010141430]
	jmpl	%o7,%g0
	stw	%l2,[%i1+0x02c]		! Mem[000000001004142c]
p0_near_1_he:
	nop
	or	%l1,%l4,%l4
	or	%l1,%l5,%l2
	add	%l2,-0x544,%l4
	jmpl	%o7,%g0
	andn	%l5,%l4,%l1
near1_b2b_h:
	jmpl	%o7,%g0
	subc	%l2,%l6,%l0
	jmpl	%o7,%g0
	nop
near1_b2b_l:
	jmpl	%o7,%g0
	xnor	%l4,%l6,%l0
	jmpl	%o7,%g0
	nop
user_near1_end:
	.seg	"text"
	.align	0x2000
user_near2_start:
p0_near_2_le:
	mulx	%l5,0x56b,%l4
	ldub	[%i6+0x032],%l1		! Mem[0000000010181432]
	nop
	ldsh	[%i0+0x030],%l1		! Mem[0000000010001430]
	stw	%l0,[%i4+0x03c]		! Mem[000000001010143c]
	swap	[%i6+0x024],%l1		! Mem[0000000010181424]
	jmpl	%o7,%g0
	add	%l6,0xf73,%l2
p0_near_2_he:
	ldsw	[%i6+0x020],%l3		! Mem[0000000010181420]
	jmpl	%o7,%g0
	xnor	%l1,%l7,%l4
near2_b2b_h:
	or	%l3,-0x90f,%l5
	umul	%l6,%l5,%l0
	orn	%l7,0x858,%l7
	orn	%l5,%l1,%l3
	xor	%l1,-0x8b5,%l5
	orn	%l0,%l3,%l0
	or	%l0,%l0,%l4
	jmpl	%o7,%g0
	andn	%l1,%l5,%l4
near2_b2b_l:
	orn	%l0,%l2,%l2
	nop
	add	%l2,0xd8a,%l0
	umul	%l6,-0xf2f,%l0
	sdivx	%l6,-0x750,%l6
	addc	%l1,-0x23f,%l5
	andn	%l7,0x5de,%l0
	jmpl	%o7,%g0
	addc	%l6,%l0,%l5
user_near2_end:
	.seg	"text"
	.align	0x2000
user_near3_start:
p0_near_3_le:
	and	%l2,0x267,%l6
	ldd	[%i5+0x030],%l2		! Mem[0000000010141430]
	andn	%l2,%l2,%l2
	subc	%l7,%l0,%l6
	jmpl	%o7,%g0
	mulx	%l3,%l6,%l5
p0_near_3_he:
	andn	%l7,%l0,%l5
	ldsb	[%i2+0x01b],%l6		! Mem[000000001008141b]
	stb	%l5,[%i1+0x03d]		! Mem[000000001004143d]
	nop
	ldsb	[%i1+0x014],%l1		! Mem[0000000010041414]
	std	%l4,[%i6+0x000]		! Mem[0000000010181400]
	jmpl	%o7,%g0
	subc	%l0,%l1,%l6
near3_b2b_h:
	andn	%l3,%l4,%l0
	or	%l2,%l2,%l7
	xnor	%l4,0xcd6,%l3
	udivx	%l5,0xb36,%l2
	nop
	subc	%l1,%l4,%l2
	sdivx	%l6,-0xafb,%l7
	jmpl	%o7,%g0
	subc	%l1,%l7,%l0
near3_b2b_l:
	andn	%l3,%l0,%l4
	subc	%l6,%l5,%l4
	sub	%l1,0xcf4,%l0
	and	%l5,0x36f,%l2
	xnor	%l1,%l3,%l5
	umul	%l0,-0x609,%l7
	and	%l0,%l7,%l6
	jmpl	%o7,%g0
	umul	%l3,%l3,%l3
user_near3_end:
	.seg	"text"
	.text
	.align	0x2000
user_far0_start:
p0_far_0_le:
	xor	%l4,%l1,%l3
	xnor	%l4,%l0,%l5
	andn	%l0,%l3,%l0
	umul	%l6,0x323,%l7
	ldsw	[%i3+0x020],%l7		! Mem[00000000100c1420]
	ldub	[%i3+0x03d],%l5		! Mem[00000000100c143d]
	st	%f7 ,[%i4+0x034]	! Mem[0000000010101434]
	jmpl	%o7,%g0
	sdivx	%l3,0x4d6,%l0
p0_far_0_lem:
	xor	%l4,%l1,%l3
	xnor	%l4,%l0,%l5
	andn	%l0,%l3,%l0
	umul	%l6,0x323,%l7
	membar	#Sync
	ldsw	[%i3+0x020],%l7		! Mem[00000000100c1420]
	ldub	[%i3+0x03d],%l5		! Mem[00000000100c143d]
	st	%f7 ,[%i4+0x034]	! Mem[0000000010101434]
	jmpl	%o7,%g0
	sdivx	%l3,0x4d6,%l0
p0_far_0_he:
	jmpl	%o7,%g0
	swap	[%i3+0x020],%l6		! Mem[00000000100c1420]
	jmpl	%o7,%g0
	nop
p0_far_0_hem:
	membar	#Sync
	jmpl	%o7,%g0
	swap	[%i3+0x020],%l6		! Mem[00000000100c1420]
	jmpl	%o7,%g0
	nop
p0_loop_branch_0:
	jmpl	%o7+12,%g0
	add	%l0,1,%l0
far0_b2b_h:
	xor	%l6,%l7,%l1
	orn	%l3,%l4,%l3
	jmpl	%o7,%g0
	subc	%l6,-0xb32,%l3
far0_b2b_l:
	add	%l7,%l6,%l2
	udivx	%l7,%l6,%l2
	jmpl	%o7,%g0
	addc	%l7,-0xd7c,%l5
user_far0_end:
	.seg	"text"
	.text
	.align	0x2000
user_far1_start:
p0_far_1_le:
	st	%f9 ,[%i5+0x004]	! Mem[0000000010141404]
	stb	%l6,[%i0+0x008]		! Mem[0000000010001408]
	add	%l3,%l7,%l1
	or	%l5,0x827,%l5
	sub	%l6,-0x73f,%l1
	orn	%l2,0x2ec,%l5
	jmpl	%o7,%g0
	addc	%l1,%l4,%l2
p0_far_1_lem:
	membar	#Sync
	st	%f9 ,[%i5+0x004]	! Mem[0000000010141404]
	stb	%l6,[%i0+0x008]		! Mem[0000000010001408]
	add	%l3,%l7,%l1
	or	%l5,0x827,%l5
	sub	%l6,-0x73f,%l1
	orn	%l2,0x2ec,%l5
	jmpl	%o7,%g0
	addc	%l1,%l4,%l2
p0_far_1_he:
	ldstub	[%o1+0x000],%l5		! Mem[0000000020800000]
	swap	[%i6+0x00c],%l5		! Mem[000000001018140c]
	ldd	[%i0+0x010],%l6		! Mem[0000000010001410]
	ldx	[%i2+0x018],%l2		! Mem[0000000010081418]
	ldstub	[%i5+0x00a],%l3		! Mem[000000001014140a]
	ldd	[%i5+0x018],%l2		! Mem[0000000010141418]
	ldub	[%i5+0x03c],%l3		! Mem[000000001014143c]
	jmpl	%o7,%g0
	sub	%l7,0xc7f,%l7
p0_far_1_hem:
	ldstub	[%o1+0x000],%l5		! Mem[0000000020800000]
	membar	#Sync
	swap	[%i6+0x00c],%l5		! Mem[000000001018140c]
	ldd	[%i0+0x010],%l6		! Mem[0000000010001410]
	ldx	[%i2+0x018],%l2		! Mem[0000000010081418]
	ldstub	[%i5+0x00a],%l3		! Mem[000000001014140a]
	ldd	[%i5+0x018],%l2		! Mem[0000000010141418]
	ldub	[%i5+0x03c],%l3		! Mem[000000001014143c]
	jmpl	%o7,%g0
	sub	%l7,0xc7f,%l7
p0_loop_branch_1:
	jmpl	%o7+12,%g0
	add	%l0,2,%l0
far1_b2b_h:
	subc	%l5,-0xb3b,%l2
	add	%l4,%l0,%l2
	xnor	%l0,-0xaa3,%l7
	xnor	%l2,%l6,%l1
	umul	%l6,0x722,%l6
	subc	%l2,%l7,%l5
	jmpl	%o7,%g0
	orn	%l3,%l0,%l7
far1_b2b_l:
	xor	%l2,%l6,%l2
	mulx	%l0,%l6,%l7
	xnor	%l3,%l7,%l4
	or	%l3,%l0,%l7
	smul	%l7,-0xc3c,%l5
	subc	%l2,-0x7b2,%l4
	jmpl	%o7,%g0
	sdivx	%l7,%l5,%l5
user_far1_end:
	.seg	"text"
	.text
	.align	0x2000
user_far2_start:
p0_far_2_le:
	lduh	[%i1+0x014],%l5		! Mem[0000000010041414]
	addc	%l5,%l2,%l4
	ldsb	[%i6+0x02f],%l4		! Mem[000000001018142f]
	ldstub	[%i6+0x02c],%l4		! Mem[000000001018142c]
	lduw	[%i1+0x018],%l5		! Mem[0000000010041418]
	ldd	[%i2+0x020],%l2		! Mem[0000000010081420]
	ldsh	[%i0+0x018],%l1		! Mem[0000000010001418]
	jmpl	%o7,%g0
	stx	%l3,[%i3+0x008]		! Mem[00000000100c1408]
p0_far_2_lem:
	membar	#Sync
	lduh	[%i1+0x014],%l5		! Mem[0000000010041414]
	addc	%l5,%l2,%l4
	ldsb	[%i6+0x02f],%l4		! Mem[000000001018142f]
	ldstub	[%i6+0x02c],%l4		! Mem[000000001018142c]
	lduw	[%i1+0x018],%l5		! Mem[0000000010041418]
	ldd	[%i2+0x020],%l2		! Mem[0000000010081420]
	ldsh	[%i0+0x018],%l1		! Mem[0000000010001418]
	membar	#Sync
	jmpl	%o7,%g0
	stx	%l3,[%i3+0x008]		! Mem[00000000100c1408]
p0_far_2_he:
	jmpl	%o7,%g0
	add	%l5,%l3,%l7
	jmpl	%o7,%g0
	nop
p0_far_2_hem:
	jmpl	%o7,%g0
	add	%l5,%l3,%l7
	jmpl	%o7,%g0
	nop
p0_loop_branch_2:
	jmpl	%o7+12,%g0
	add	%l0,3,%l0
far2_b2b_h:
	xor	%l2,%l2,%l5
	jmpl	%o7,%g0
	orn	%l7,%l4,%l4
far2_b2b_l:
	add	%l0,0xa18,%l3
	jmpl	%o7,%g0
	smul	%l5,%l7,%l7
user_far2_end:
	.seg	"text"
	.text
	.align	0x2000
user_far3_start:
p0_far_3_le:
	umul	%l4,%l5,%l0
	jmpl	%o7,%g0
	andn	%l1,%l4,%l6
p0_far_3_lem:
	umul	%l4,%l5,%l0
	jmpl	%o7,%g0
	andn	%l1,%l4,%l6
p0_far_3_he:
	andn	%l6,%l7,%l6
	subc	%l1,%l6,%l0
	stb	%l2,[%i4+0x02a]		! Mem[000000001010142a]
	ldstub	[%o2+0x001],%l3		! Mem[00000000211c0001]
	jmpl	%o7,%g0
	lduh	[%i4+0x00a],%l2		! Mem[000000001010140a]
p0_far_3_hem:
	andn	%l6,%l7,%l6
	subc	%l1,%l6,%l0
	membar	#Sync
	stb	%l2,[%i4+0x02a]		! Mem[000000001010142a]
	ldstub	[%o2+0x001],%l3		! Mem[00000000211c0001]
	membar	#Sync
	jmpl	%o7,%g0
	lduh	[%i4+0x00a],%l2		! Mem[000000001010140a]
p0_loop_branch_3:
	jmpl	%o7+12,%g0
	add	%l0,4,%l0
far3_b2b_h:
	andn	%l7,%l2,%l1
	xor	%l2,0xcf8,%l7
	jmpl	%o7,%g0
	sdivx	%l5,%l1,%l2
far3_b2b_l:
	udivx	%l6,-0xbf4,%l5
	xor	%l5,-0xec8,%l7
	jmpl	%o7,%g0
	udivx	%l1,0x59e,%l0
user_far3_end:
	.seg	"text"
	.align	0x2000
user_jump0_start:
	INIT_MEM(0, 0x0010, 1, +, 0, +, 0)
p0_jmpl_0_le:
	swap	[%i4+0x010],%l5		! Mem[0000000010101410]
	jmpl	%g6+8,%g0
	ldd	[%i0+0x000],%f8 	! Mem[0000000010001400]
p0_call_0_le:
	sth	%l7,[%i0+0x02e]		! Mem[000000001000142e]
	and	%l6,%l2,%l4
	stx	%l3,[%i3+0x020]		! Mem[00000000100c1420]
	swap	[%i1+0x010],%l2		! Mem[0000000010041410]
	andn	%l6,%l2,%l4
	retl
	lduw	[%i2+0x008],%l2		! Mem[0000000010081408]
p0_jmpl_0_lo:
	swap	[%o4+0x010],%l5		! Mem[0000000010101410]
	jmpl	%g6+8,%g0
	ldd	[%o0+0x000],%f8 	! Mem[0000000010001400]
p0_call_0_lo:
	sth	%l7,[%o0+0x02e]		! Mem[000000001000142e]
	and	%l6,%l2,%l4
	stx	%l3,[%o3+0x020]		! Mem[00000000100c1420]
	swap	[%o1+0x010],%l2		! Mem[0000000010041410]
	andn	%l6,%l2,%l4
	retl
	lduw	[%o2+0x008],%l2		! Mem[0000000010081408]
p0_jmpl_0_he:
	add	%l1,0x840,%l6
	ldsh	[%i4+0x01c],%l2		! Mem[000000001010141c]
	lduw	[%i1+0x018],%l0		! Mem[0000000010041418]
	ldsh	[%i4+0x014],%l4		! Mem[0000000010101414]
	or	%l6,-0x241,%l1
	ldd	[%i2+0x030],%f28	! Mem[0000000010081430]
	jmpl	%g6+8,%g0
	or	%l7,-0x2bb,%l7
p0_call_0_he:
	lduw	[%i6+0x00c],%l3		! Mem[000000001018140c]
	retl
	lduh	[%i3+0x006],%l6		! Mem[00000000100c1406]
p0_jmpl_0_ho:
	add	%l1,0x840,%l6
	ldsh	[%o4+0x01c],%l2		! Mem[000000001010141c]
	lduw	[%o1+0x018],%l0		! Mem[0000000010041418]
	ldsh	[%o4+0x014],%l4		! Mem[0000000010101414]
	or	%l6,-0x241,%l1
	ldd	[%o2+0x030],%f28	! Mem[0000000010081430]
	jmpl	%g6+8,%g0
	or	%l7,-0x2bb,%l7
p0_call_0_ho:
	lduw	[%o6+0x00c],%l3		! Mem[000000001018140c]
	retl
	lduh	[%o3+0x006],%l6		! Mem[00000000100c1406]
user_jump0_end:
	.seg	"text"
	.align	0x2000
user_jump1_start:
	INIT_MEM(0, 0x0020, 1, +, 0, +, 0)
p0_jmpl_1_le:
	umul	%l3,-0xfe7,%l7
	jmpl	%g6+8,%g0
	subc	%l6,-0x161,%l1
p0_call_1_le:
	stx	%l2,[%i5+0x028]		! Mem[0000000010141428]
	and	%l1,%l1,%l0
	stx	%l1,[%i2+0x008]		! Mem[0000000010081408]
	retl
	swap	[%i1+0x02c],%l3		! Mem[000000001004142c]
p0_jmpl_1_lo:
	umul	%l3,-0xfe7,%l7
	jmpl	%g6+8,%g0
	subc	%l6,-0x161,%l1
p0_call_1_lo:
	stx	%l2,[%o5+0x028]		! Mem[0000000010141428]
	and	%l1,%l1,%l0
	stx	%l1,[%o2+0x008]		! Mem[0000000010081408]
	retl
	swap	[%o1+0x02c],%l3		! Mem[000000001004142c]
p0_jmpl_1_he:
	umul	%l1,%l3,%l5
	ldsb	[%i1+0x03d],%l0		! Mem[000000001004143d]
	lduh	[%i6+0x00a],%l6		! Mem[000000001018140a]
	ldstub	[%i4+0x01e],%l7		! Mem[000000001010141e]
	swap	[%i0+0x018],%l5		! Mem[0000000010001418]
	jmpl	%g6+8,%g0
	ldsh	[%i1+0x034],%l5		! Mem[0000000010041434]
p0_call_1_he:
	std	%f28,[%i3+0x028]	! Mem[00000000100c1428]
	std	%l6,[%i5+0x038]		! Mem[0000000010141438]
	ldx	[%i2+0x028],%l6		! Mem[0000000010081428]
	stw	%l4,[%i5+0x034]		! Mem[0000000010141434]
	subc	%l0,-0x63e,%l2
	retl
	orn	%l2,-0xa31,%l3
p0_jmpl_1_ho:
	umul	%l1,%l3,%l5
	ldsb	[%o1+0x03d],%l0		! Mem[000000001004143d]
	lduh	[%o6+0x00a],%l6		! Mem[000000001018140a]
	ldstub	[%o4+0x01e],%l7		! Mem[000000001010141e]
	swap	[%o0+0x018],%l5		! Mem[0000000010001418]
	jmpl	%g6+8,%g0
	ldsh	[%o1+0x034],%l5		! Mem[0000000010041434]
p0_call_1_ho:
	std	%f28,[%o3+0x028]	! Mem[00000000100c1428]
	std	%l6,[%o5+0x038]		! Mem[0000000010141438]
	ldx	[%o2+0x028],%l6		! Mem[0000000010081428]
	stw	%l4,[%o5+0x034]		! Mem[0000000010141434]
	subc	%l0,-0x63e,%l2
	retl
	orn	%l2,-0xa31,%l3
user_jump1_end:
	.seg	"text"
	.align	0x2000
user_jump2_start:
	INIT_MEM(0, 0x0030, 1, +, 0, +, 0)
p0_jmpl_2_le:
	ldstub	[%i3+0x00e],%l6		! Mem[00000000100c140e]
	orn	%l3,-0xab6,%l7
	jmpl	%g6+8,%g0
	lduh	[%i2+0x002],%l4		! Mem[0000000010081402]
p0_call_2_le:
	add	%l5,-0xff7,%l2
	udivx	%l7,-0x356,%l0
	orn	%l5,0xc3e,%l1
	retl
	std	%f14,[%i2+0x020]	! Mem[0000000010081420]
p0_jmpl_2_lo:
	ldstub	[%o3+0x00e],%l6		! Mem[00000000100c140e]
	orn	%l3,-0xab6,%l7
	jmpl	%g6+8,%g0
	lduh	[%o2+0x002],%l4		! Mem[0000000010081402]
p0_call_2_lo:
	add	%l5,-0xff7,%l2
	udivx	%l7,-0x356,%l0
	orn	%l5,0xc3e,%l1
	retl
	std	%f14,[%o2+0x020]	! Mem[0000000010081420]
p0_jmpl_2_he:
	subc	%l6,%l4,%l7
	xor	%l3,%l2,%l5
	std	%l0,[%i4+0x018]		! Mem[0000000010101418]
	mulx	%l1,%l5,%l7
	jmpl	%g6+8,%g0
	sdivx	%l1,-0x11e,%l4
p0_call_2_he:
	ldd	[%i3+0x030],%l4		! Mem[00000000100c1430]
	stw	%l4,[%i4+0x01c]		! Mem[000000001010141c]
	retl
	subc	%l0,-0xe90,%l5
p0_jmpl_2_ho:
	subc	%l6,%l4,%l7
	xor	%l3,%l2,%l5
	std	%l0,[%o4+0x018]		! Mem[0000000010101418]
	mulx	%l1,%l5,%l7
	jmpl	%g6+8,%g0
	sdivx	%l1,-0x11e,%l4
p0_call_2_ho:
	ldd	[%o3+0x030],%l4		! Mem[00000000100c1430]
	stw	%l4,[%o4+0x01c]		! Mem[000000001010141c]
	retl
	subc	%l0,-0xe90,%l5
user_jump2_end:
	.seg	"text"
	.align	0x2000
user_jump3_start:
	INIT_MEM(0, 0x0040, 1, +, 0, +, 0)
p0_jmpl_3_le:
	and	%l1,%l0,%l7
	ld	[%i5+0x008],%f10	! Mem[0000000010141408]
	stx	%l2,[%i4+0x028]		! Mem[0000000010101428]
	sth	%l0,[%i1+0x00c]		! Mem[000000001004140c]
	subc	%l3,%l2,%l7
	jmpl	%g6+8,%g0
	ldx	[%i5+0x000],%l2		! Mem[0000000010141400]
p0_call_3_le:
	retl
	xnor	%l2,%l0,%l0
p0_jmpl_3_lo:
	and	%l1,%l0,%l7
	ld	[%o5+0x008],%f10	! Mem[0000000010141408]
	stx	%l2,[%o4+0x028]		! Mem[0000000010101428]
	sth	%l0,[%o1+0x00c]		! Mem[000000001004140c]
	subc	%l3,%l2,%l7
	jmpl	%g6+8,%g0
	ldx	[%o5+0x000],%l2		! Mem[0000000010141400]
p0_call_3_lo:
	retl
	xnor	%l2,%l0,%l0
p0_jmpl_3_he:
	sdivx	%l1,%l5,%l1
	ldx	[%i1+0x020],%l7		! Mem[0000000010041420]
	swap	[%i5+0x028],%l7		! Mem[0000000010141428]
	andn	%l0,%l1,%l3
	orn	%l5,%l0,%l1
	smul	%l3,-0x321,%l5
	add	%l3,-0xcba,%l3
	jmpl	%g6+8,%g0
	std	%f22,[%i5+0x008]	! Mem[0000000010141408]
p0_call_3_he:
	orn	%l5,%l3,%l2
	nop
	andn	%l0,%l4,%l2
	std	%l2,[%i3+0x030]		! Mem[00000000100c1430]
	std	%l6,[%i1+0x010]		! Mem[0000000010041410]
	stx	%l4,[%i4+0x018]		! Mem[0000000010101418]
	udivx	%l4,%l0,%l3
	retl
	and	%l0,0x9f9,%l0
p0_jmpl_3_ho:
	sdivx	%l1,%l5,%l1
	ldx	[%o1+0x020],%l7		! Mem[0000000010041420]
	swap	[%o5+0x028],%l7		! Mem[0000000010141428]
	andn	%l0,%l1,%l3
	orn	%l5,%l0,%l1
	smul	%l3,-0x321,%l5
	add	%l3,-0xcba,%l3
	jmpl	%g6+8,%g0
	std	%f22,[%o5+0x008]	! Mem[0000000010141408]
p0_call_3_ho:
	orn	%l5,%l3,%l2
	nop
	andn	%l0,%l4,%l2
	std	%l2,[%o3+0x030]		! Mem[00000000100c1430]
	std	%l6,[%o1+0x010]		! Mem[0000000010041410]
	stx	%l4,[%o4+0x018]		! Mem[0000000010101418]
	udivx	%l4,%l0,%l3
	retl
	and	%l0,0x9f9,%l0
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
	.word	0xf3570731,0xb220bd9e		! Init value for %l0
	.word	0x03a34c5e,0xc743fb63		! Init value for %l1
	.word	0x6de6b199,0xfded1bc2		! Init value for %l2
	.word	0x8d1c5c5c,0x1976768a		! Init value for %l3
	.word	0x378f565e,0x264e39e7		! Init value for %l4
	.word	0xc2e00908,0x4dfacbb7		! Init value for %l5
	.word	0xf4c78770,0xcd3cb229		! Init value for %l6
	.word	0x0225c199,0xf4ff286c		! Init value for %l7
	.align	64
p0_init_freg:
	.word	0xd398ac8f,0xff4428ca		! Init value for %f0 
	.word	0xc05d49e5,0xb4f860ef		! Init value for %f2 
	.word	0x327e3b9b,0xef4ab9ef		! Init value for %f4 
	.word	0x20ec6b32,0x160b7fe5		! Init value for %f6 
	.word	0x3f5ca94c,0x1b027c8b		! Init value for %f8 
	.word	0x9ea2a36c,0x9fb12702		! Init value for %f10
	.word	0x3989b8f2,0xd9cda08e		! Init value for %f12
	.word	0xaed9d046,0x7df3dc00		! Init value for %f14
	.word	0x215fe61d,0xa12eb42c		! Init value for %f16
	.word	0x3f127f49,0x94997547		! Init value for %f18
	.word	0x0bde65d1,0x3385fac5		! Init value for %f20
	.word	0x674d90c5,0x783346bf		! Init value for %f22
	.word	0x112ffdec,0xb1379adf		! Init value for %f24
	.word	0x46a572a3,0xcb650bfe		! Init value for %f26
	.word	0x065f771e,0x4241725d		! Init value for %f28
	.word	0x71ffcb32,0xef0e491b		! Init value for %f30
	.word	0x6fe25ce9,0xd2184891		! Init value for %f32
	.word	0x4bf782e2,0x2d2a9d56		! Init value for %f34
	.word	0xb622dd8e,0x3134e536		! Init value for %f36
	.word	0xeed39605,0xf4d83dc5		! Init value for %f38
	.word	0x0a450520,0xe6f76e0a		! Init value for %f40
	.word	0xa3be5aa6,0x131edb79		! Init value for %f42
	.word	0xedf34df5,0x4d57b1c9		! Init value for %f44
	.word	0xbb8fabf5,0x6a43bdf6		! Init value for %f46
	.word	0xf8d3edeb,0x03bb90d0
	.word	0x2f0e49df,0xe4ea4c00
	.word	0x79831541,0xd40697e1
	.word	0x4e10a9ac,0xae084598
	.word	0xc9ca7eeb,0x1367b150
	.word	0xe69a9c6a,0x96f22ff5
	.word	0x79207600,0x94f39727
	.word	0x7b659aa3,0x90efb2f3
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
	.word	0x00000000,0x000000ff
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000000
	.word	0xffffffff,0xffffffff
	.word	0xffffffff,0xffffff00
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000000
	.word	0x00000000,0xff00ffff
p0_expected_fp_regs:
	.word	0x18000000,0xccbe12ae
	.word	0x00000000,0xff4fc963
	.word	0x00ffffff,0x00000000
	.word	0x00000000,0x00000000
	.word	0x00000000,0x000000ff
	.word	0x00000000,0xffffffff
	.word	0xdb8bc3ff,0xffffffff
	.word	0x000000ff,0x000000ff
	.word	0x00000000,0xff000000
	.word	0x00000000,0xffffffff
	.word	0x4f860000,0x6ea90000
	.word	0x00000000,0xffffffff
	.word	0x00000000,0x000000ff
	.word	0x000000ff,0x00000000
	.word	0xffffffff,0x6ea90000
	.word	0xff000000,0xff000000
	.word	0x00000000,0x00000000		! %fsr = 0000000000000000
p0_local0_expect:
	.word	0xff00ff00,0x000000ff
	.word	0x000000ff,0x00000000
	.word	0xff000000,0x000000ff
	.word	0x00000000,0xffffffff
	.word	0x00000000,0x000000ff
	.word	0x000000ff,0xff000000
	.word	0x00000000,0x00000000
	.word	0x00000000,0x5a0000ff
p0_local0_sec_expect:
	.word	0xff000000,0x00000000
	.word	0x00000000,0xffffffff
	.word	0x4f860000,0x6ea90000
	.word	0x00000000,0xffffffff
	.word	0x00000000,0x000000ff
	.word	0xffffffff,0x00000000
	.word	0xffffffff,0x6ea90000
	.word	0xff000000,0xff000000
p0_local1_expect:
	.word	0xff0000ff,0xccbe12ae
	.word	0xff000000,0x00000000
	.word	0xffffffff,0x00ff0000
	.word	0x00000000,0x00000000
	.word	0x00000000,0x00000000
	.word	0x00000000,0xff000000
	.word	0xff004f86,0xff00ff00
	.word	0x00000000,0x0000864f
p0_local1_sec_expect:
	.word	0x000000ff,0x000000ff
	.word	0xff000000,0x00000000
	.word	0xff000000,0x00000000
	.word	0x00000000,0x00000000
	.word	0xffffff00,0xff000000
	.word	0x000000ff,0xffffffff
	.word	0x63c94f86,0x864f00ff
	.word	0x00000000,0x00000000
p0_local2_expect:
	.word	0xff000000,0xccbe12ae
	.word	0xff000000,0xff0000ff
	.word	0xff000000,0x000000ff
	.word	0x00000000,0x00000000
	.word	0xffffffff,0x000000ff
	.word	0xff000000,0xff000000
	.word	0xff004f86,0x864fc963
	.word	0x00000000,0xff4fc963
p0_local2_sec_expect:
	.word	0x00000000,0xffff00ff
	.word	0x000000ff,0xffffffff
	.word	0x000000ff,0x00000000
	.word	0x00000000,0xab713f70
	.word	0xff000000,0xff0000ff
	.word	0x00000000,0x00000000
	.word	0x8bdb0000,0x3f000000
	.word	0x00ffffff,0x00000000
p0_local3_expect:
	.word	0xffffffff,0x00000000
	.word	0x00000000,0x6ea90000
	.word	0x00000000,0x00000000
	.word	0x000000ff,0x000000ff
	.word	0x18000000,0x00ff0000
	.word	0xff000000,0x00ff00dc
	.word	0x00000018,0x00000000
	.word	0xffffffff,0xffffffff
p0_local3_sec_expect:
	.word	0xffff00ff,0xccbe12ae
	.word	0xffffffff,0x000000ff
	.word	0x000000ff,0x00000000
	.word	0xffffffff,0xff000000
	.word	0xffffffff,0x000000ff
	.word	0xff0000ff,0xffffffff
	.word	0x400913b6,0xff000000
	.word	0xffffffff,0xff0000ff
p0_local4_expect:
	.word	0x00000000,0xffffffff
	.word	0x000000ff,0xffffffff
	.word	0xff0000ff,0x00000000
	.word	0xff000000,0xff000000
	.word	0xff0000ff,0x000000ff
	.word	0x00000000,0x00000000
	.word	0x0000003f,0x0000db8b
	.word	0x00000000,0xffffff00
p0_local4_sec_expect:
	.word	0xff000000,0xff000000
	.word	0x00000000,0xffffffff
	.word	0xffffffcc,0xffffffff
	.word	0xccbe12ae,0xffffffff
	.word	0x400913b6,0xff000000
	.word	0x00000096,0x0000ffff
	.word	0x000000ff,0x00000000
	.word	0xa3002dba,0xffffffff
p0_local5_expect:
	.word	0xffffffff,0x000000ff
	.word	0xff000000,0x00000000
	.word	0xff00ff00,0x5affff00
	.word	0x00000000,0x000000ff
	.word	0x00000000,0x00000000
	.word	0xc3540000,0x00000000
	.word	0xff0000ff,0x00000000
	.word	0xa96e6a5a,0xff000000
p0_local5_sec_expect:
	.word	0x00000000,0xffffff00
	.word	0xff8bc3ff,0x00000000
	.word	0xffffffff,0xffc38bdb
	.word	0x00000000,0xb9703118
	.word	0xffffffff,0x06fd1eff
	.word	0xff000000,0xff000000
	.word	0xffffffff,0xffff0000
	.word	0xff000000,0xa5000000
p0_local6_expect:
	.word	0x00000000,0x00000000
	.word	0x00ffffff,0x00000000
	.word	0x00000000,0xffffffff
	.word	0x00000000,0x00000000
	.word	0xff000000,0x00000000
	.word	0xff000000,0x0000ff00
	.word	0xdb8bc3ff,0xffffffff
	.word	0x000000ff,0x000000ff
p0_local6_sec_expect:
	.word	0x000000ff,0xff000000
	.word	0xffffffff,0x00000000
	.word	0x0000a96e,0x000071ab
	.word	0xff004f86,0x63c94f86
	.word	0xff004f86,0x864fc963
	.word	0xff000000,0x003100dc
	.word	0x00000018,0x00000000
	.word	0x00000000,0x00ffffff
share0_expect:
	.word	0x0000af65,0x30dac7c2
	.word	0xd548aa16,0x85db0da4
	.word	0xc29e3766,0x54f339d1
	.word	0xb77b1491,0x0f7ebf24
	.word	0xd167dcf2,0x5628e878
	.word	0xd0b3f3aa,0x40d52359
	.word	0xa92650f2,0xfe15a1db
	.word	0xbb35c6ba,0x365b538a
share1_expect:
	.word	0xffff7d94,0x1f4e73bb
	.word	0x5f025cdf,0xbe432551
	.word	0xbe8ff6a3,0xcb99bf0b
	.word	0xe6cb3ca1,0x8e25677b
	.word	0x70c9772d,0xf5055d97
	.word	0x26127699,0xe03b6f1d
	.word	0x066d0309,0x3873cfda
	.word	0x162fcd3f,0x300ae503
	.word	0x8bdbac70,0x309fd23d
	.word	0x06480c5e,0x5d032515
	.word	0xd039ec90,0x996469f6
	.word	0x40ca660f,0xe5444aa5
	.word	0xd7402d66,0x111b7cd4
	.word	0x073d04ed,0xe581e20b
	.word	0x49275ea9,0xa65acb59
	.word	0x5b4df44a,0x0793b71b
share2_expect:
	.word	0xffff7bbb,0x3358b80a
	.word	0xfa94a846,0x5ae6adbb
	.word	0x624b8d3f,0x293e14e7
	.word	0x6acf9d23,0x13efd7ab
	.word	0x7da49e89,0x62d2b4c9
	.word	0x30f86310,0x23b48acc
	.word	0x1022ef7a,0xbc1a60c1
	.word	0xda7b11a3,0x19372280
share3_expect:
	.word	0x1a7bd0b4,0x76b24138
	.word	0xc2c098aa,0xac6b2c90
	.word	0x5ef1a604,0xcab9a2f8
	.word	0xfb588c64,0xd2d1e7b1
	.word	0xfb7d7a42,0x97e19484
	.word	0xa855640f,0x2bba31ab
	.word	0x664022d7,0x615e9dce
	.word	0x931d1f08,0x57b7fb18
	.word	0x00ffb2d9,0xd47d3896
	.word	0xf1978243,0x45c2edec
	.word	0x4b99763d,0x4a8bd1d0
	.word	0xfc7eb327,0xb1a4c590
	.word	0xcfca3d3c,0xb9783abb
	.word	0xc1a514e5,0x8a975dd4
	.word	0x860a38d2,0x54064216
	.word	0x2e5d41f1,0x6fa2aab6
	.word	0xffffd5df,0x31153ccd
	.word	0x77dcc712,0x38d7cb4b
	.word	0xa32d99be,0xe3834032
	.word	0x3d11febc,0xafc5da4f
	.word	0x3f3a2976,0x63dae063
	.word	0x7e9d2991,0xd26fe678
	.word	0x56cc73fb,0xb094791e
	.word	0xd79090be,0x2a2a0097
	.word	0xffff65e1,0xd12e5820
	.word	0x382a5f7e,0x0a9fe904
	.word	0x8b4a1da6,0x9a814623
	.word	0x14f324d8,0x47b0e15b
	.word	0xbc41dcfd,0xa32a80ca
	.word	0x0a1a5fd7,0x16b7e8d3
	.word	0x713a8ad2,0x821f11fe
	.word	0x245bb006,0xb1d6f90d
	.word	0x00ffb49a,0x7f3dec3c
	.word	0x9e1fe3f9,0xb6dead55
	.word	0xef742a16,0xc5b63883
	.word	0x2c1564eb,0x7ac7fe3c
	.word	0x25f5ebbd,0x2e1ca157
	.word	0xc7fec74a,0x04943fe6
	.word	0x97044f9c,0x9babf88c
	.word	0x6ddc08da,0x845f8d4a
	.word	0x00ff0ea7,0x0986bd0d
	.word	0x8c7a1ae6,0x7e5ef061
	.word	0x1271bedb,0xe371f32a
	.word	0x31f70282,0xaaacec0e
	.word	0x9f4446ce,0x3ac68134
	.word	0xebaa7210,0x02674594
	.word	0x42f9c6a0,0x6287174f
	.word	0x78c595b9,0x9c188ecf
	.word	0x00ff2200,0x808373c2
	.word	0x3bf2621e,0x7b0b01a3
	.word	0xeb4f2b27,0x807dab1f
	.word	0x36a08234,0xedb68289
	.word	0xcef80214,0x0fe2d5ba
	.word	0xe26f7959,0x0ef0a951
	.word	0x816fd7ae,0x466bd4b3
	.word	0xc1ca1099,0xb55682e9
	.word	0xffff397e,0x9dfe71c0
	.word	0x6e3ad4ee,0xc1e33d16
	.word	0x770b2570,0x2f591b5e
	.word	0x2c3f8b44,0xc70051c7
	.word	0x75aca526,0xdb8c5ddc
	.word	0xf816f750,0xd70bb558
	.word	0xcd2d95ed,0xd6cac9a7
	.word	0xbb9e88ae,0xe682d560
p0_invalidate_semaphore:
	.word	0

!	Data for check points

	.align	8
p0_check_pt_data_1:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x00000077		! Expected data for %l0
	.word	0x00000000,0x65576254		! Expected data for %l1
	.word	0x00000000,0x0000003f		! Expected data for %l2
	.word	0x00000000,0x00000004		! Expected data for %l3
	.word	0x1d263625,0x3c6cb36d		! Expected data for %l4
	.word	0xffffffff,0xfffffff7		! Expected data for %l5
	.word	0x00000000,0x00000026		! Expected data for %l6
	.word	0x00000000,0x000000ff		! Expected data for %l7
	.word	0x065f771e,0x4241725d		! Expected data for %f0
	.word	0x334ff227,0xd78771e8		! Expected data for %f2
	.word	0xab71f314,0xe2a61342		! Expected data for %f4
	.word	0x14b471b9,0x26617a8e		! Expected data for %f6
	.word	0x4f61277f,0xe46cbd64		! Expected data for %f8
	.word	0x1657e49d,0xba94c2f1		! Expected data for %f10
	.word	0x1a1efd06,0xb2f265c0		! Expected data for %f12
	.word	0xa96e6a5a,0x864fc963		! Expected data for %f14
	.word	0xe89e10b4,0xaebb5bfd		! Expected data for %f24
p0_check_pt_data_2:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0xdd959123		! Expected data for %l0
	.word	0x00000000,0x3f127f49		! Expected data for %l1
	.word	0x7a0506c9,0x8184bd80		! Expected data for %l2
	.word	0xffffffff,0xf7e6f7f8		! Expected data for %l3
	.word	0x00000000,0xff834ac7		! Expected data for %l4
	.word	0x00000000,0x582a190f		! Expected data for %l5
	.word	0x00000000,0x1603950d		! Expected data for %l7
	.word	0x96985297,0x19bc084d		! Expected data for %f0
	.word	0x940ce1d5,0x7979a9ca		! Expected data for %f2
	.word	0xb7cbfa4d,0xe0410b1b		! Expected data for %f4
	.word	0x3f477b3c,0x2e808b49		! Expected data for %f6
	.word	0x5cca1143,0x1ea5b41d		! Expected data for %f8
	.word	0x99c32599,0xeb7550e3		! Expected data for %f10
	.word	0xfaf8f416,0x4562104a		! Expected data for %f12
	.word	0x88aadcc9,0x1603950d		! Expected data for %f14
	.word	0x3f127f49,0xd4b66f2b		! Expected data for %f18
	.word	0x06cd9827,0x3385fac5		! Expected data for %f20
	.word	0x59755bee,0x00000071		! Expected data for %f22
	.word	0xf7724142,0xaebb5bfd		! Expected data for %f24
p0_check_pt_data_3:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0xffbcecba		! Expected data for %l0
	.word	0x00000000,0x0000c280		! Expected data for %l1
	.word	0x00000000,0x0000002a		! Expected data for %l2
	.word	0x00000000,0xab71f314		! Expected data for %l3
	.word	0x00000000,0x0000582a		! Expected data for %l4
	.word	0x215fe61d,0xa12eb42c		! Expected data for %l6
	.word	0x00000000,0x408c6cad		! Expected data for %l7
	.word	0x0d950316,0x19bc084d		! Expected data for %f0
	.word	0xb4675bb9,0xbaecbcff		! Expected data for %f4
	.word	0x3f477b3c,0x2e808b49		! Expected data for %f6
	.word	0x00000000,0x00003a0b		! Expected data for %f10
	.word	0x88aadcc9,0x1e775f06		! Expected data for %f14
	.word	0xaebb5bfd,0x3385fac5		! Expected data for %f20
	.word	0x55100be5,0xef0e491b		! Expected data for %f30
p0_check_pt_data_4:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x0000002a		! Expected data for %l0
	.word	0x00000000,0x000000c5		! Expected data for %l1
	.word	0x00000000,0xc3aebe97		! Expected data for %l2
	.word	0x00000000,0x0000007f		! Expected data for %l3
	.word	0x00000000,0x0000002b		! Expected data for %l4
	.word	0x00000000,0x000000c3		! Expected data for %l5
	.word	0x00000000,0x00000026		! Expected data for %l6
	.word	0x00000000,0x000000c3		! Expected data for %l7
	.word	0x00000000,0x00003a0b		! Expected data for %f0
	.word	0x940ce1d5,0x7979a9ca		! Expected data for %f2
	.word	0xffbcecba,0xb95b67b4		! Expected data for %f6
	.word	0x00000000,0xe35075eb		! Expected data for %f10
p0_check_pt_data_5:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0xff338946		! Expected data for %l0
	.word	0x00000000,0x0000000b		! Expected data for %l1
	.word	0x00000000,0xffc32599		! Expected data for %l2
	.word	0x00000000,0xeb7550e3		! Expected data for %l3
	.word	0x00000000,0x00000000		! Expected data for %l4
	.word	0xffffffff,0xffffffae		! Expected data for %l5
	.word	0x00000000,0x0000003f		! Expected data for %l7
	.word	0x00000000,0x00003a0b		! Expected data for %f0
	.word	0x940ce1d5,0x7979a9ca		! Expected data for %f2
	.word	0xb4675bb9,0xbaecbcff		! Expected data for %f4
	.word	0xab71f314,0xa12eb42c		! Expected data for %f16
	.word	0x0f425a7c,0xe33c87df		! Expected data for %f26
	.word	0x468933ff,0x4241725d		! Expected data for %f28
p0_check_pt_data_6:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0xd5e10c94		! Expected data for %l0
	.word	0xffffffff,0xff338946		! Expected data for %l1
	.word	0x00000000,0x57f8eda3		! Expected data for %l2
	.word	0x00000000,0x000000a5		! Expected data for %l3
	.word	0x00000000,0x3f5fe61d		! Expected data for %l4
	.word	0x00000000,0xa12eb42c		! Expected data for %l5
	.word	0x00000000,0xb95b9925		! Expected data for %l6
	.word	0x00000000,0x0000000f		! Expected data for %l7
	.word	0xe35075eb,0x00000000		! Expected data for %f0
	.word	0xb4675bb9,0xbaecbcff		! Expected data for %f4
	.word	0xffffbbae,0x000000ff		! Expected data for %f14
p0_check_pt_data_7:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0xe35075eb		! Expected data for %l0
	.word	0x00000000,0x3385fac5		! Expected data for %l1
	.word	0x00000000,0x00000000		! Expected data for %l2
	.word	0x00000000,0x0000003f		! Expected data for %l3
	.word	0x00000000,0xe2a61342		! Expected data for %l4
	.word	0x00000000,0x0000ff87		! Expected data for %l5
	.word	0x00000000,0x000000ff		! Expected data for %l6
	.word	0xffffffff,0xffffffab		! Expected data for %l7
	.word	0x53d8bb12,0x1de65fff		! Expected data for %f0
	.word	0xffffbbae,0x000000ff		! Expected data for %f2
	.word	0x1872447d,0x00003f00		! Expected data for %f4
	.word	0x2fc87f50,0x7344b015		! Expected data for %f6
	.word	0x69f5f861,0x3c3e5de6		! Expected data for %f8
	.word	0xfddf7318,0xcbe83d6a		! Expected data for %f10
	.word	0xecdbe849,0xc4b85b54		! Expected data for %f12
	.word	0xea80797b,0xb11603f2		! Expected data for %f14
	.word	0x065f771e,0x4241725d		! Expected data for %f16
	.word	0xb4675bb9,0xbaecbcff		! Expected data for %f18
	.word	0xab71f314,0xe2a61342		! Expected data for %f20
	.word	0x88aadcc9,0x4562954a		! Expected data for %f22
	.word	0x4f61277f,0xe46cbd64		! Expected data for %f24
	.word	0x9acec51b,0x1ea5b41d		! Expected data for %f26
	.word	0x1a1efd06,0xb2f265c0		! Expected data for %f28
	.word	0xa96e6a5a,0x864fc963		! Expected data for %f30
p0_check_pt_data_8:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0xffffffff,0xffffffa5		! Expected data for %l0
	.word	0x00000000,0x00000000		! Expected data for %l1
	.word	0x00000000,0x57f8eda3		! Expected data for %l2
	.word	0x00000000,0x00000046		! Expected data for %l4
	.word	0xffffffff,0x00000089		! Expected data for %l5
	.word	0x00000000,0x000000a5		! Expected data for %l6
	.word	0x00000000,0x000000ff		! Expected data for %l7
	.word	0xffffbbae,0x000000ff		! Expected data for %f2
	.word	0xff8933ff,0x000bffff		! Expected data for %f4
	.word	0x0b3a9e16,0xe79997ba		! Expected data for %f6
	.word	0xdcfd2bef,0x3c3e5de6		! Expected data for %f8
	.word	0xffbbd853,0x0000582a		! Expected data for %f16
	.word	0x894650e3,0x4562104a		! Expected data for %f18
	.word	0x57f8eda3,0x169e3a0b		! Expected data for %f20
	.word	0x00590dcc,0x000000a5		! Expected data for %f22
	.word	0xe3613df6,0xd4b66f2b		! Expected data for %f24
	.word	0x0b2f22d4,0xec1ac7fc		! Expected data for %f26
	.word	0xa5aa37f8,0xdcfd2bef		! Expected data for %f28
	.word	0xba9799e7,0x169e3a0b		! Expected data for %f30
p0_check_pt_data_9:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x000000a5		! Expected data for %l0
	.word	0x00000000,0x00000000		! Expected data for %l1
	.word	0x00000000,0x00000046		! Expected data for %l2
	.word	0xffffffff,0x89000000		! Expected data for %l3
	.word	0x00000000,0xa3edf857		! Expected data for %l4
	.word	0xffffbbae,0x000000ff		! Expected data for %l5
	.word	0xf7724142,0x1e775f06		! Expected data for %l6
	.word	0x00000000,0x0000006c		! Expected data for %l7
	.word	0xffbbd853,0x0000582a		! Expected data for %f0
	.word	0xffffbbae,0x000000ff		! Expected data for %f2
	.word	0xc3ae2ea1,0x703f71ab		! Expected data for %f4
	.word	0xffbbd853,0x00003f00		! Expected data for %f16
	.word	0x0b2f22d4,0x864fc963		! Expected data for %f26
	.word	0xa5aa37f8,0xa3edf857		! Expected data for %f28
p0_check_pt_data_10:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x0000001e		! Expected data for %l0
	.word	0xffffffff,0xffffffff		! Expected data for %l1
	.word	0x00000000,0x00000045		! Expected data for %l2
	.word	0x00000000,0x0000006c		! Expected data for %l3
	.word	0x00000000,0x0000000b		! Expected data for %l4
	.word	0x00000000,0x000000ff		! Expected data for %l5
	.word	0x00000000,0x000000a5		! Expected data for %l7
	.word	0xff000000,0x0000582a		! Expected data for %f0
	.word	0xffffbbae,0x89000000		! Expected data for %f2
	.word	0xffbbd853,0x00003f00		! Expected data for %f12
	.word	0x065f771e,0x424172f7		! Expected data for %f16
	.word	0xa5ffffff,0xffffffff		! Expected data for %f18
	.word	0x003f0000,0x53d8bbff		! Expected data for %f20
	.word	0x0ee959f1,0xdf4fb58e		! Expected data for %f22
	.word	0xbab64d53,0xf5a79b58		! Expected data for %f24
	.word	0x0dff2444,0xf016ec35		! Expected data for %f26
	.word	0xdf76a438,0x1b19ac53		! Expected data for %f28
	.word	0xff000000,0xe3bb75ff		! Expected data for %f30
p0_check_pt_data_11:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x000000ff		! Expected data for %l0
	.word	0x00000000,0x00000000		! Expected data for %l1
	.word	0x00000000,0x0000001e		! Expected data for %l2
	.word	0x00000000,0x169e3a0b		! Expected data for %l3
	.word	0x00000000,0xff000000		! Expected data for %l4
	.word	0x00000000,0x00000000		! Expected data for %l5
	.word	0x00000000,0x1e775fff		! Expected data for %l6
	.word	0x00000000,0x5d724142		! Expected data for %l7
	.word	0xff000000,0x0000582a		! Expected data for %f0
	.word	0xffffbbae,0x89000000		! Expected data for %f2
	.word	0xc3ae2ea1,0x703f71ab		! Expected data for %f4
	.word	0x0b3a9e16,0x00000b00		! Expected data for %f6
	.word	0xea80797b,0xdcfd2bef		! Expected data for %f14
	.word	0x5d724142,0x1e775f06		! Expected data for %f16
	.word	0x6a3de8cb,0xa5000000		! Expected data for %f18
	.word	0x000000ff,0xaebbffff		! Expected data for %f20
	.word	0x3f000000,0x00000000		! Expected data for %f22
	.word	0x64bd6ce4,0x7f27614f		! Expected data for %f24
	.word	0x1db4a51e,0xff11ca5c		! Expected data for %f26
	.word	0xc065f2b2,0x06fd1e1a		! Expected data for %f28
	.word	0x63c94f86,0x894650e3		! Expected data for %f30
p0_check_pt_data_12:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0xf7724142,0x1e775f06		! Expected data for %l0
	.word	0x00000000,0x000000a5		! Expected data for %l1
	.word	0x00000000,0xcbe83d6a		! Expected data for %l3
	.word	0x00000000,0x00000000		! Expected data for %l4
	.word	0x00000000,0x000000ff		! Expected data for %l5
	.word	0x00000000,0x000000ff		! Expected data for %l6
	.word	0x00000000,0x0b3a9eff		! Expected data for %l7
	.word	0xc3ae2ea1,0x703f71ab		! Expected data for %f4
	.word	0x0b3a9e16,0x00000b00		! Expected data for %f6
	.word	0xffbbd853,0x000000ff		! Expected data for %f16
	.word	0x894650e3,0x4562104a		! Expected data for %f18
	.word	0x57f8eda3,0x169e3a0b		! Expected data for %f20
	.word	0xc5fa8533,0xebff50e3		! Expected data for %f22
	.word	0xe3610089,0xd4b66f2b		! Expected data for %f24
	.word	0x0b2f22d4,0x864fc963		! Expected data for %f26
	.word	0xa5aa37f8,0xa3edf857		! Expected data for %f28
	.word	0xba9799e7,0x169e3a0b		! Expected data for %f30
p0_check_pt_data_13:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x00000000		! Expected data for %l0
	.word	0x00000000,0xcbe83d6a		! Expected data for %l1
	.word	0xffffffff,0xffffffe4		! Expected data for %l2
	.word	0x00000000,0x000000ff		! Expected data for %l3
	.word	0x00000000,0x000000ff		! Expected data for %l4
	.word	0x00ff0000,0x2cb42ea1		! Expected data for %l5
	.word	0xc3ae2ea1,0x703f71ab		! Expected data for %l6
	.word	0x00000000,0x169e3a0b		! Expected data for %l7
	.word	0x57f8eda3,0xf837aaa5		! Expected data for %f0
	.word	0x0b3a9e16,0x00000000		! Expected data for %f6
	.word	0xff5f771e,0x4241725d		! Expected data for %f16
	.word	0x7b7980ea,0xcbe83d6a		! Expected data for %f18
	.word	0xffdc0000,0x00000046		! Expected data for %f20
	.word	0x00000000,0x0000003f		! Expected data for %f22
	.word	0x4f61277f,0xe46cbd64		! Expected data for %f24
	.word	0x5cca11ff,0x1ea5b41d		! Expected data for %f26
	.word	0x1a1efd06,0xb2f265c0		! Expected data for %f28
	.word	0xa96e6a5a,0x864fc963		! Expected data for %f30
p0_check_pt_data_14:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x000000ff		! Expected data for %l2
	.word	0xccbe12ae,0x0000003f		! Expected data for %l3
	.word	0x00000000,0x000000a1		! Expected data for %l4
	.word	0x00000000,0x89000000		! Expected data for %l5
	.word	0x00000000,0x000000a5		! Expected data for %l6
	.word	0x1ea5b41d,0xf837aaa5		! Expected data for %f0
	.word	0xc3ae2ea1,0x703f71ab		! Expected data for %f4
	.word	0xff000000,0xe3504689		! Expected data for %f14
	.word	0x468933ff,0x000000a3		! Expected data for %f18
	.word	0xa3edf857,0x0000003f		! Expected data for %f22
p0_check_pt_data_15:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x000000ff		! Expected data for %l0
	.word	0x00000000,0x000000ff		! Expected data for %l1
	.word	0x00000000,0xa192c190		! Expected data for %l2
	.word	0x00000000,0x00007fff		! Expected data for %l3
	.word	0x169e3a0b,0x000000ff		! Expected data for %l4
	.word	0x00000000,0x00000000		! Expected data for %l5
	.word	0x00000000,0x0000ffff		! Expected data for %l6
	.word	0xffffffff,0xffffffff		! Expected data for %l7
	.word	0x1ea5b41d,0xf837aaa5		! Expected data for %f0
	.word	0x0b3a9e16,0x00000000		! Expected data for %f6
	.word	0xffbbd853,0xcbe83d6a		! Expected data for %f10
	.word	0x00000000,0x1e775fff		! Expected data for %f12
	.word	0xffffffff,0x4241725d		! Expected data for %f16
	.word	0xe3504689,0xcbe83d6a		! Expected data for %f18
	.word	0x000000ff,0xffffffff		! Expected data for %f20
	.word	0x00000000,0x0000003f		! Expected data for %f22
	.word	0x4f61277f,0xe46cbd64		! Expected data for %f24
	.word	0x000000ff,0x1ea5b41d		! Expected data for %f26
	.word	0x1a1efd06,0xb2f265c0		! Expected data for %f28
	.word	0xa96e6a5a,0x864fc963		! Expected data for %f30
p0_check_pt_data_16:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x0b3a9e16		! Expected data for %l0
	.word	0x00000000,0xe35046ff		! Expected data for %l1
	.word	0x00000000,0xff000000		! Expected data for %l2
	.word	0x00000000,0x00003f00		! Expected data for %l3
	.word	0x00000000,0x000077ff		! Expected data for %l4
	.word	0xffffffff,0xffffffff		! Expected data for %l5
	.word	0x00000000,0x000000ff		! Expected data for %l7
	.word	0x1ea5b41d,0x1e775fff		! Expected data for %f0
	.word	0xff8933ff,0x000000ff		! Expected data for %f16
	.word	0x00000000,0xff000000		! Expected data for %f24
	.word	0x169e3a0b,0x864fc963		! Expected data for %f30
p0_check_pt_data_17:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x0000007f		! Expected data for %l0
	.word	0x00000000,0x00006a3d		! Expected data for %l1
	.word	0x00000000,0x0000002d		! Expected data for %l2
	.word	0x00000000,0x0000a300		! Expected data for %l3
	.word	0x00000000,0x0000ff5f		! Expected data for %l4
	.word	0x00000000,0xff000000		! Expected data for %l5
	.word	0x00000000,0x0000001b		! Expected data for %l6
	.word	0x00000000,0x00000000		! Expected data for %l7
	.word	0x6a3de8cb,0x1e775fff		! Expected data for %f0
	.word	0x63000000,0xa5000000		! Expected data for %f2
	.word	0x4a106245,0xffffffff		! Expected data for %f8
	.word	0x00005f06,0xa3edf857		! Expected data for %f10
	.word	0xff000000,0xff000000		! Expected data for %f14
	.word	0xff000000,0xff3389ff		! Expected data for %f16
	.word	0x6a3de8cb,0x894650e3		! Expected data for %f18
	.word	0xffffffff,0xff000000		! Expected data for %f20
	.word	0x703f71ab,0x00000000		! Expected data for %f22
	.word	0x000000ff,0x00000000		! Expected data for %f24
	.word	0x1db4a51e,0xff000000		! Expected data for %f26
	.word	0xc065f2b2,0x06fd1e1a		! Expected data for %f28
	.word	0x63c94f86,0x0b3a9e16		! Expected data for %f30
p0_check_pt_data_18:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0xff000000		! Expected data for %l0
	.word	0x00000000,0x000000c0		! Expected data for %l1
	.word	0x00000000,0x00006a3d		! Expected data for %l2
	.word	0x00000000,0x00006a3d		! Expected data for %l3
	.word	0x00000000,0x000000ab		! Expected data for %l5
	.word	0x468933ff,0x000000ff		! Expected data for %l6
	.word	0x00000000,0x00000000		! Expected data for %l7
	.word	0xffffbbae,0x3d6a0000		! Expected data for %f0
	.word	0xff8933ff,0x000000ff		! Expected data for %f2
	.word	0xc065f2b2,0x06fd1e1a		! Expected data for %f4
	.word	0xe350ffeb,0x3385fac5		! Expected data for %f6
	.word	0x2b6fb6d4,0x890061e3		! Expected data for %f8
	.word	0x63c94f86,0xd4222f0b		! Expected data for %f10
	.word	0x57f8eda3,0xf837aaa5		! Expected data for %f12
	.word	0x0b3a9e16,0xe79997ba		! Expected data for %f14
p0_check_pt_data_19:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x000000ff		! Expected data for %l0
	.word	0xffffffff,0xfffffac5		! Expected data for %l1
	.word	0x00000000,0x0000ffff		! Expected data for %l2
	.word	0x00000000,0xa12eb4ab		! Expected data for %l3
	.word	0x00000000,0x5fffffff		! Expected data for %l4
	.word	0xff775f06,0x000000a5		! Expected data for %l5
	.word	0xffffffff,0xffffff89		! Expected data for %l6
	.word	0x00000000,0x63c94f86		! Expected data for %l7
	.word	0xff8933ff,0x000000ff		! Expected data for %f2
	.word	0xff000000,0xe3504689		! Expected data for %f4
	.word	0xe350ffeb,0x3385fac5		! Expected data for %f6
	.word	0xff00e800,0xffffffff		! Expected data for %f12
	.word	0x065f77ff,0xe79997ba		! Expected data for %f14
	.word	0xff000000,0xc3ae2ea1		! Expected data for %f16
	.word	0xba9799e7,0x0b3a9e16		! Expected data for %f30
p0_check_pt_data_20:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0xffffffff,0xffffffff		! Expected data for %l0
	.word	0xffffffff,0xffffff00		! Expected data for %l1
	.word	0x00000000,0x0000009e		! Expected data for %l2
	.word	0x00000000,0x00000000		! Expected data for %l3
	.word	0x00000000,0x0000005f		! Expected data for %l4
	.word	0x00000000,0x00000000		! Expected data for %l5
	.word	0x00000000,0x00000000		! Expected data for %l6
	.word	0x00000000,0x00e800ff		! Expected data for %l7
	.word	0x63000000,0x0000007f		! Expected data for %f0
	.word	0xffffffff,0x89000000		! Expected data for %f2
	.word	0x1ea5b41d,0x000000a3		! Expected data for %f4
	.word	0x0b3a9e16,0x00000b00		! Expected data for %f6
	.word	0xdcfd2bef,0x3c3e5de6		! Expected data for %f8
	.word	0xfddf7318,0xcbe83d6a		! Expected data for %f10
	.word	0xffbbd853,0x00003f00		! Expected data for %f12
	.word	0xea80797b,0xdcfd2bef		! Expected data for %f14
	.word	0xab000000,0xc3ae2ea1		! Expected data for %f16
p0_check_pt_data_21:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0xffffffff,0xffffffff		! Expected data for %l0
	.word	0x00000000,0x00000000		! Expected data for %l1
	.word	0x00000000,0x0000ff00		! Expected data for %l2
	.word	0xffffffff,0xffffffff		! Expected data for %l3
	.word	0xffffffff,0xffffffff		! Expected data for %l4
	.word	0x00000000,0x00000000		! Expected data for %l5
	.word	0x00000000,0xff000000		! Expected data for %l6
	.word	0x00000000,0x0000ffff		! Expected data for %l7
	.word	0xffffffff,0xff000000		! Expected data for %f0
	.word	0x1e775fff,0xff00e800		! Expected data for %f2
	.word	0x003f0000,0x53d8bbff		! Expected data for %f4
	.word	0xffffffff,0xff000000		! Expected data for %f6
	.word	0xc7848ea4,0x00000000		! Expected data for %f8
	.word	0x90c192a1,0x400913b6		! Expected data for %f10
	.word	0x46000000,0x00000000		! Expected data for %f12
	.word	0xe65d3e3c,0x61f8f569		! Expected data for %f14
	.word	0x5fffffff,0x894650e3		! Expected data for %f18
	.word	0x3385fac5,0x00000000		! Expected data for %f22
	.word	0x000000ff,0x2d0000ff		! Expected data for %f24
	.word	0x63c94f86,0x00000000		! Expected data for %f26
p0_check_pt_data_22:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x00000000		! Expected data for %l0
	.word	0x00000000,0x00000000		! Expected data for %l1
	.word	0x00000000,0x000000ff		! Expected data for %l2
	.word	0x00000000,0x00001a7b		! Expected data for %l3
	.word	0xff000000,0x5fffffff		! Expected data for %l4
	.word	0x00000000,0x894650e3		! Expected data for %l5
	.word	0xffffffff,0xffffffff		! Expected data for %l6
	.word	0x00000000,0x00000000		! Expected data for %l7
	.word	0xff00e800,0xffffffff		! Expected data for %f0
	.word	0xffffffff,0xff00e800		! Expected data for %f6
	.word	0x3385fac5,0xff000000		! Expected data for %f22
	.word	0x000000ff,0x06fd1e1a		! Expected data for %f28
p0_check_pt_data_23:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x0000c963		! Expected data for %l0
	.word	0x00000000,0xff00e800		! Expected data for %l1
	.word	0x00000000,0x00e800ff		! Expected data for %l2
	.word	0x00000000,0x00000000		! Expected data for %l3
	.word	0x00000000,0xe79997ba		! Expected data for %l4
	.word	0x00000000,0x169e3a0b		! Expected data for %l5
	.word	0x7b1a0000,0xff000000		! Expected data for %l6
	.word	0x00000000,0x000000ff		! Expected data for %l7
	.word	0x864fc963,0x00000000		! Expected data for %f0
	.word	0xba9799e7,0x0b3a9e16		! Expected data for %f2
	.word	0xaebbffff,0xff000000		! Expected data for %f4
	.word	0x703f71ab,0x00000000		! Expected data for %f6
	.word	0x6a3de8cb,0x000050e3		! Expected data for %f8
	.word	0x1db4a51e,0xff000000		! Expected data for %f10
	.word	0xc065f2b2,0x06fd1e1a		! Expected data for %f12
	.word	0x0000582a,0x00000000		! Expected data for %f14
	.word	0x000000ff,0xffffffff		! Expected data for %f18
p0_check_pt_data_24:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x0000104a,0x0000007f		! Expected data for %l0
	.word	0x00000000,0x000000ff		! Expected data for %l1
	.word	0x00000000,0x69f5f861		! Expected data for %l2
	.word	0x00000000,0x2cb42ea1		! Expected data for %l3
	.word	0x00000000,0x00000063		! Expected data for %l5
	.word	0xffffffff,0xffffffff		! Expected data for %l6
	.word	0x00000000,0x00000061		! Expected data for %l7
	.word	0xffffffff,0xff000000		! Expected data for %f20
	.word	0x7f000000,0xff000000		! Expected data for %f28
p0_check_pt_data_25:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0xa12eaec3,0x000000ab		! Expected data for %l0
	.word	0xffffffff,0xae0000ff		! Expected data for %l1
	.word	0x00000000,0x00000000		! Expected data for %l2
	.word	0x00000000,0x000000ff		! Expected data for %l3
	.word	0x00000000,0x00000000		! Expected data for %l4
	.word	0x00000000,0x00000000		! Expected data for %l5
	.word	0xffffffff,0xffffffff		! Expected data for %l6
	.word	0x00000000,0x0000ffff		! Expected data for %l7
	.word	0xccbe12ae,0x00000000		! Expected data for %f0
	.word	0x864fc963,0x0b3a9e16		! Expected data for %f2
	.word	0x00000000,0x00000000		! Expected data for %f6
	.word	0x63c94f86,0xffff002d		! Expected data for %f12
	.word	0x00000000,0x00e800ff		! Expected data for %f14
	.word	0x7f000000,0x2a580000		! Expected data for %f26
p0_check_pt_data_26:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0xfe0b5bcb		! Expected data for %l0
	.word	0x00000000,0x0000ccbe		! Expected data for %l1
	.word	0x00000000,0x000000c9		! Expected data for %l2
	.word	0xffffffff,0xffffffff		! Expected data for %l3
	.word	0x00000000,0x00000086		! Expected data for %l4
	.word	0x00000000,0x0000ffff		! Expected data for %l5
	.word	0x00000000,0x00000000		! Expected data for %l6
	.word	0x00000000,0xa3002dba		! Expected data for %l7
	.word	0xf8610000,0x0000ff5f		! Expected data for %f0
	.word	0xffffffff,0xff000000		! Expected data for %f4
	.word	0xff4fc963,0x00000000		! Expected data for %f16
	.word	0x0e5100ff,0x2d0000ff		! Expected data for %f18
	.word	0xaebbffff,0xff000000		! Expected data for %f20
	.word	0x703f71ab,0x00000000		! Expected data for %f22
	.word	0x6a3de8cb,0x000050e3		! Expected data for %f24
	.word	0x1db4a51e,0xff000000		! Expected data for %f26
	.word	0xc065f2b2,0x06fd1e1a		! Expected data for %f28
	.word	0x0000582a,0x00000000		! Expected data for %f30
p0_check_pt_data_27:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x000000ae		! Expected data for %l0
	.word	0x00000000,0x0b3a9e16		! Expected data for %l1
	.word	0x00000000,0x000000ae		! Expected data for %l2
	.word	0x00000000,0x00000000		! Expected data for %l3
	.word	0x00000000,0x00000000		! Expected data for %l4
	.word	0x00000000,0x0000002d		! Expected data for %l5
	.word	0x00000000,0xffffffff		! Expected data for %l6
	.word	0x00000000,0xffff0000		! Expected data for %l7
	.word	0x000050e3,0x864fc963		! Expected data for %f0
	.word	0x00000000,0x00000000		! Expected data for %f6
	.word	0x0000007f,0x00000000		! Expected data for %f16
	.word	0xc9000000,0xff000000		! Expected data for %f20
	.word	0x00000000,0xff000000		! Expected data for %f26
	.word	0x000000a5,0x0000ffff		! Expected data for %f30
p0_check_pt_data_28:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x95f704df,0xda75b514		! Expected data for %l0
	.word	0x7edbbc87,0xd9fa3afa		! Expected data for %l1
	.word	0xffffffff,0xffffffff		! Expected data for %l2
	.word	0x1a1efd06,0xb2f265c0		! Expected data for %l3
	.word	0x00000000,0x00000000		! Expected data for %l4
	.word	0x00000000,0x0000ffff		! Expected data for %l5
	.word	0x00000000,0x00000000		! Expected data for %l6
	.word	0x00000000,0x000050e3		! Expected data for %l7
	.word	0x00000000,0x0000007f		! Expected data for %f0
	.word	0x00000000,0x169e3a0b		! Expected data for %f2
	.word	0xa372a546,0x0000007f		! Expected data for %f4
	.word	0x0b3a9e16,0x00000b00		! Expected data for %f6
	.word	0xdcfd2bef,0x3c3e5de6		! Expected data for %f8
	.word	0xaedfffff,0xff00006a		! Expected data for %f10
	.word	0xffbbd853,0x00003f00		! Expected data for %f12
	.word	0xea80797b,0xdcfd2bef		! Expected data for %f14
	.word	0xff9e0000,0x2a580000		! Expected data for %f18
	.word	0x000000a5,0x000000ff		! Expected data for %f30
p0_check_pt_data_29:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x000061f8		! Expected data for %l0
	.word	0x00000000,0x00000000		! Expected data for %l1
	.word	0xff000000,0x000000ff		! Expected data for %l2
	.word	0x00000000,0x00000000		! Expected data for %l3
	.word	0x00000000,0x00000000		! Expected data for %l4
	.word	0xffff0000,0xff000000		! Expected data for %l5
	.word	0x00000000,0x000000c0		! Expected data for %l6
	.word	0x00000000,0x000000ff		! Expected data for %l7
	.word	0x00000000,0x0000007f		! Expected data for %f0
	.word	0x0b3a9e16,0x00000b00		! Expected data for %f6
	.word	0x00000000,0x63c94f86		! Expected data for %f12
	.word	0x183170b9,0x00000000		! Expected data for %f22
	.word	0xff1efd06,0xffffffff		! Expected data for %f24
	.word	0x0000ffff,0xffffffff		! Expected data for %f28
p0_check_pt_data_30:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x0000ffff		! Expected data for %l0
	.word	0x00000000,0x0000ffff		! Expected data for %l1
	.word	0x00000000,0x0000ffff		! Expected data for %l2
	.word	0x00000000,0x00000000		! Expected data for %l3
	.word	0x00c94fff,0xffff00ff		! Expected data for %l4
	.word	0x00000000,0x00000000		! Expected data for %l5
	.word	0x00000000,0x06fd1e1a		! Expected data for %l6
	.word	0x00000000,0x2a580000		! Expected data for %l7
	.word	0x864fc963,0x0b3a9e16		! Expected data for %f4
	.word	0x0b3a9e16,0x00000b00		! Expected data for %f6
	.word	0xff000000,0xffffffff		! Expected data for %f14
	.word	0x46a572ff,0x2a580000		! Expected data for %f18
p0_check_pt_data_31:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x00000000		! Expected data for %l0
	.word	0x00000000,0x0b3a9e16		! Expected data for %l1
	.word	0x00000000,0x00000000		! Expected data for %l2
	.word	0x00000000,0x00000071		! Expected data for %l3
	.word	0xffffffff,0xffdfffff		! Expected data for %l4
	.word	0x00000000,0x0000c900		! Expected data for %l5
	.word	0x00000000,0x183170b9		! Expected data for %l6
	.word	0x00000000,0x00000000		! Expected data for %l7
	.word	0x1a1efd06,0x00000000		! Expected data for %f0
	.word	0x00000000,0xffffffff		! Expected data for %f2
	.word	0x864fc963,0x0b3a9e16		! Expected data for %f4
	.word	0x1a1efd06,0x00000000		! Expected data for %f6
	.word	0xff000000,0xff000000		! Expected data for %f14
	.word	0x00000000,0x000000ae		! Expected data for %f28
p0_check_pt_data_32:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x864fc963,0x0b3a0000		! Expected data for %l0
	.word	0xffffffff,0xffffffff		! Expected data for %l1
	.word	0x00000000,0xb2f265ff		! Expected data for %l2
	.word	0xffffffff,0xff72a546		! Expected data for %l4
	.word	0x00000000,0x00000000		! Expected data for %l5
	.word	0x00000000,0x00000000		! Expected data for %l6
	.word	0x00000000,0x06fd1e0b		! Expected data for %l7
	.word	0xff000000,0x63c94f86		! Expected data for %f0
	.word	0x00000000,0x0b3a9e16		! Expected data for %f2
	.word	0xffff0000,0xffffffff		! Expected data for %f4
	.word	0xccbe12ae,0xffffffff		! Expected data for %f6
	.word	0xe89e10b4,0xc05d49e5		! Expected data for %f8
	.word	0x00000000,0x00000063		! Expected data for %f10
	.word	0x000000ff,0x00ae0000		! Expected data for %f12
	.word	0xa3002dba,0x00338900		! Expected data for %f14
	.word	0x0000ffff,0x00000000		! Expected data for %f16
	.word	0xffffdfff,0xffffffff		! Expected data for %f20
	.word	0x00000000,0x000000ff		! Expected data for %f22
	.word	0x0000582a,0x000000ae		! Expected data for %f28
p0_check_pt_data_33:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0xffffffff,0x961fda77		! Expected data for %l0
	.word	0x00000000,0x00000049		! Expected data for %l1
	.word	0xffffffff,0xffffffff		! Expected data for %l3
	.word	0x00000000,0x00000000		! Expected data for %l4
	.word	0x00000000,0x00000000		! Expected data for %l5
	.word	0x00000000,0x00000000		! Expected data for %l6
	.word	0x00000000,0xff0000ae		! Expected data for %l7
	.word	0x00000033,0x00000000		! Expected data for %f0
	.word	0x00000000,0x0b3a9e16		! Expected data for %f2
	.word	0xffff0000,0xffffffff		! Expected data for %f4
	.word	0xccbe12ae,0xffffffff		! Expected data for %f6
	.word	0xa3002dba,0x00000000		! Expected data for %f8
	.word	0x00c94fff,0x00000000		! Expected data for %f16
	.word	0x00000033,0x00000000		! Expected data for %f20
	.word	0xffffdfff,0x00c90000		! Expected data for %f28
p0_check_pt_data_34:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x00000000		! Expected data for %l0
	.word	0x00000000,0x000000ff		! Expected data for %l1
	.word	0x00000000,0xff9e0000		! Expected data for %l2
	.word	0xffffffff,0xffffffff		! Expected data for %l3
	.word	0x00000000,0x000000ff		! Expected data for %l4
	.word	0x00000000,0x0000582a		! Expected data for %l5
	.word	0x00000000,0x000000ff		! Expected data for %l6
	.word	0xffffffff,0xffffffff		! Expected data for %l7
	.word	0x00000033,0x2a580000		! Expected data for %f0
	.word	0xffff0000,0xffffffff		! Expected data for %f4
	.word	0x6a0000ff,0x59755bee		! Expected data for %f20
	.word	0x00000033,0x00000000		! Expected data for %f26
p0_check_pt_data_35:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x00000006		! Expected data for %l0
	.word	0xffffffff,0xa3002dba		! Expected data for %l1
	.word	0x00000000,0x00000000		! Expected data for %l2
	.word	0x00000000,0x33000000		! Expected data for %l3
	.word	0x00000000,0x00000000		! Expected data for %l4
	.word	0x00000000,0x0b1efd06		! Expected data for %l5
	.word	0x00000000,0xffff0000		! Expected data for %l6
	.word	0x00000000,0x00001a7b		! Expected data for %l7
	.word	0xffff0000,0xffffffff		! Expected data for %f4
	.word	0xccbe12ae,0x00000000		! Expected data for %f6
	.word	0x000000e2,0x0000000b		! Expected data for %f8
	.word	0xff00007f,0x00000000		! Expected data for %f16
	.word	0xff9e0000,0x2a580000		! Expected data for %f18
	.word	0x6a0000ff,0xff000000		! Expected data for %f20
	.word	0x183100dc,0x00000000		! Expected data for %f22
	.word	0xff1efd06,0xffffffff		! Expected data for %f24
	.word	0x00000000,0xae000000		! Expected data for %f26
	.word	0x0000ffff,0xffffffff		! Expected data for %f28
	.word	0x000000a5,0x000000ff		! Expected data for %f30
p0_check_pt_data_36:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x000000ff		! Expected data for %l0
	.word	0x00000000,0x00000000		! Expected data for %l1
	.word	0x00000000,0x000000ff		! Expected data for %l2
	.word	0x00000000,0x000000ff		! Expected data for %l3
	.word	0x00000000,0x000000ff		! Expected data for %l4
	.word	0x00000000,0x00000000		! Expected data for %l6
	.word	0x00000000,0x000000ff		! Expected data for %l7
	.word	0xffffffff,0x169e3a0b		! Expected data for %f0
	.word	0xffffdfff,0xffffffff		! Expected data for %f2
	.word	0xffff0000,0xa3002dff		! Expected data for %f4
	.word	0xc0000000,0x000000ff		! Expected data for %f6
	.word	0x64bd6ce4,0x7f27611b		! Expected data for %f8
	.word	0xff000000,0x72ff0000		! Expected data for %f10
	.word	0x00000000,0x00000000		! Expected data for %f12
	.word	0x63c94f86,0x5a6a6ea9		! Expected data for %f14
	.word	0xa3002dba,0x00000000		! Expected data for %f18
	.word	0x33000000,0x00000000		! Expected data for %f28
p0_check_pt_data_37:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x000000ff		! Expected data for %l0
	.word	0x00000000,0x00000000		! Expected data for %l1
	.word	0x00000000,0x00000000		! Expected data for %l2
	.word	0x00000000,0xff000000		! Expected data for %l3
	.word	0x00000000,0x000000ff		! Expected data for %l4
	.word	0x00000000,0x000000ff		! Expected data for %l5
	.word	0x00000000,0x00000b00		! Expected data for %l6
	.word	0x00000000,0xffffffff		! Expected data for %l7
	.word	0xffffffff,0x169e3a0b		! Expected data for %f0
	.word	0x000000ff,0x00000000		! Expected data for %f12
	.word	0xb6130940,0x06fd1e0b		! Expected data for %f16
	.word	0xae000000,0xff000000		! Expected data for %f18
	.word	0xffff0000,0xffffffff		! Expected data for %f28
p0_check_pt_data_38:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x00002798		! Expected data for %l0
	.word	0x00000000,0x000000ff		! Expected data for %l1
	.word	0x00000000,0x00000000		! Expected data for %l2
	.word	0x00000000,0x00002798		! Expected data for %l3
	.word	0x00000000,0x00004009		! Expected data for %l4
	.word	0x00000000,0x00000000		! Expected data for %l5
	.word	0x00000000,0x00000000		! Expected data for %l6
	.word	0x1a1efd06,0x00000000		! Expected data for %l7
	.word	0xffffffff,0x169e3a0b		! Expected data for %f0
	.word	0xffffffff,0xffffffff		! Expected data for %f2
	.word	0xff000000,0x77da1f96		! Expected data for %f4
	.word	0xff000000,0x00000000		! Expected data for %f6
	.word	0x64bd6ce4,0x000b0000		! Expected data for %f8
	.word	0xff000000,0x72ff0000		! Expected data for %f10
	.word	0x00000000,0x00000000		! Expected data for %f12
	.word	0x63c94f86,0x5a6a6ea9		! Expected data for %f14
	.word	0xffffffff,0x00000000		! Expected data for %f20
	.word	0xffff0000,0xffffffff		! Expected data for %f28
	.word	0x00000000,0x000000ff		! Expected data for %f30
p0_check_pt_data_39:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x00000000		! Expected data for %l0
	.word	0x00000000,0x00000000		! Expected data for %l1
	.word	0x000000ff,0x000000ae		! Expected data for %l2
	.word	0x00000000,0x961fda77		! Expected data for %l3
	.word	0x00000000,0x77da1f96		! Expected data for %l4
	.word	0x00000000,0xff000000		! Expected data for %l5
	.word	0x00000000,0x00000000		! Expected data for %l6
	.word	0xffffffff,0xffffffff		! Expected data for %l7
	.word	0xff000000,0x77da1f96		! Expected data for %f4
	.word	0x00000000,0x00002798		! Expected data for %f6
	.word	0x00000000,0x000000ff		! Expected data for %f14
p0_check_pt_data_40:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x00000000		! Expected data for %l0
	.word	0x00000000,0x0000ff72		! Expected data for %l1
	.word	0xffffffff,0xb6130940		! Expected data for %l2
	.word	0x00000000,0x000000ff		! Expected data for %l3
	.word	0x00000000,0x00000096		! Expected data for %l4
	.word	0x00000000,0x000000ff		! Expected data for %l5
	.word	0x00000000,0x000000ff		! Expected data for %l6
	.word	0x0b1efd06,0x400913b6		! Expected data for %l7
	.word	0xffffffff,0x169e3a0b		! Expected data for %f0
	.word	0xffffffff,0xffffffff		! Expected data for %f2
	.word	0xae000000,0xff000000		! Expected data for %f4
	.word	0xffffffff,0x000000ff		! Expected data for %f20
	.word	0xb6130940,0x06fd1e0b		! Expected data for %f22
p0_check_pt_data_41:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x00000000		! Expected data for %l0
	.word	0x00000000,0x169e3a00		! Expected data for %l1
	.word	0x0000dc45,0x183170b9		! Expected data for %l2
	.word	0x00000000,0x06fd1eff		! Expected data for %l3
	.word	0x000000ff,0x00000000		! Expected data for %l4
	.word	0x00000000,0x06fd1eff		! Expected data for %l5
	.word	0xffffffff,0xffffffff		! Expected data for %l6
	.word	0x961fda77,0x000000ff		! Expected data for %l7
	.word	0xff0000ff,0x63c94f86		! Expected data for %f0
	.word	0xff000000,0x000000ff		! Expected data for %f2
	.word	0xda770000,0xba2d00a3		! Expected data for %f4
	.word	0xccbe12ae,0xffffffff		! Expected data for %f6
	.word	0x400913b6,0xff000000		! Expected data for %f8
	.word	0x00000096,0x0000ffff		! Expected data for %f10
	.word	0x000000ff,0x00000000		! Expected data for %f12
	.word	0xa3002dba,0xffffffff		! Expected data for %f14
	.word	0x00000b00,0xe46cbd64		! Expected data for %f22
	.word	0x98270000,0x00000000		! Expected data for %f26
	.word	0x00000000,0x000000ff		! Expected data for %f30
p0_check_pt_data_42:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x000000ff,0x00000000		! Expected data for %l1
	.word	0x00000000,0x1db4a5ff		! Expected data for %l2
	.word	0x00000000,0x00000000		! Expected data for %l3
	.word	0x00000000,0x000020b9		! Expected data for %l4
	.word	0xffffffff,0xffff961f		! Expected data for %l5
	.word	0x00000000,0xffffffff		! Expected data for %l6
	.word	0x00000000,0xb9703118		! Expected data for %l7
	.word	0x0b3a0000,0xba2d00a3		! Expected data for %f4
	.word	0xccbe12ae,0xffffffff		! Expected data for %f6
	.word	0xda770000,0xba2d00a3		! Expected data for %f22
p0_check_pt_data_43:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x00000000		! Expected data for %l0
	.word	0x00000000,0x00000000		! Expected data for %l1
	.word	0x00000000,0x00003a0b		! Expected data for %l2
	.word	0x00000000,0x000000ff		! Expected data for %l3
	.word	0x00000000,0xae0000ff		! Expected data for %l4
	.word	0x00000000,0x00000000		! Expected data for %l5
	.word	0x00000000,0xffffffff		! Expected data for %l6
	.word	0xb6130940,0x06fd1e0b		! Expected data for %l7
	.word	0xff0000ff,0x63c94f86		! Expected data for %f0
	.word	0xccbe12ae,0xffffffff		! Expected data for %f6
	.word	0xae000000,0x00000000		! Expected data for %f18
	.word	0x98270000,0x0b3a0000		! Expected data for %f26
	.word	0x000000a5,0x0000ffff		! Expected data for %f30
p0_check_pt_data_44:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x000000ff		! Expected data for %l0
	.word	0x00000000,0x2a5800ff		! Expected data for %l1
	.word	0x00000000,0x00000000		! Expected data for %l2
	.word	0x00000000,0x00000000		! Expected data for %l3
	.word	0x00000000,0x00000069		! Expected data for %l4
	.word	0x00000000,0x000000ff		! Expected data for %l5
	.word	0xffffffff,0xff000000		! Expected data for %l7
	.word	0xff0000ff,0x63c94f86		! Expected data for %f0
	.word	0xff000000,0x000000ff		! Expected data for %f2
	.word	0x400913b6,0xff0000ff		! Expected data for %f8
	.word	0x00000000,0x00000000		! Expected data for %f12
	.word	0xff000000,0xffffffff		! Expected data for %f14
	.word	0x0000000b,0xff000000		! Expected data for %f16
p0_check_pt_data_45:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x00000000		! Expected data for %l0
	.word	0xffffffff,0xff00ff00		! Expected data for %l1
	.word	0x00000000,0x000000ff		! Expected data for %l2
	.word	0x00000000,0xff000000		! Expected data for %l3
	.word	0xffffffff,0xffffff00		! Expected data for %l4
	.word	0xffffffff,0xffffffda		! Expected data for %l5
	.word	0x00000000,0x00000000		! Expected data for %l6
	.word	0x00000000,0x00000000		! Expected data for %l7
	.word	0xff000000,0x000000ff		! Expected data for %f2
	.word	0x0b3a0000,0xba2d00a3		! Expected data for %f4
	.word	0xffffffff,0xffffffff		! Expected data for %f6
	.word	0xffffffff,0x00000000		! Expected data for %f20
p0_check_pt_data_46:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x169e3a00		! Expected data for %l0
	.word	0x00000000,0x00000000		! Expected data for %l1
	.word	0x00000000,0xffffffff		! Expected data for %l2
	.word	0x00000000,0x000000ff		! Expected data for %l4
	.word	0x00000000,0x000000ff		! Expected data for %l5
	.word	0x00000000,0x00000000		! Expected data for %l6
	.word	0x00000000,0xff000000		! Expected data for %l7
	.word	0xff0000ff,0x63c94f86		! Expected data for %f0
	.word	0xff000000,0x000000ff		! Expected data for %f2
	.word	0xffffffff,0xffffffff		! Expected data for %f6
	.word	0x00000000,0xffffffff		! Expected data for %f16
	.word	0xff000000,0x000000ff		! Expected data for %f18
	.word	0x000000ff,0xba2d00a3		! Expected data for %f20
	.word	0xccbeffae,0x00000000		! Expected data for %f22
	.word	0x400913b6,0xff000000		! Expected data for %f24
	.word	0xda770000,0xba2d00a3		! Expected data for %f26
	.word	0x0000ffff,0x00000000		! Expected data for %f28
	.word	0xa3002dba,0xffffffff		! Expected data for %f30
p0_check_pt_data_47:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0xff000000		! Expected data for %l0
	.word	0x00000000,0x000000c0		! Expected data for %l1
	.word	0x00000000,0xff000000		! Expected data for %l2
	.word	0x00000000,0xffffffff		! Expected data for %l3
	.word	0x00000000,0x000000ff		! Expected data for %l4
	.word	0x00000000,0x0000ff00		! Expected data for %l5
	.word	0xffffffff,0xffff0000		! Expected data for %l6
	.word	0xffffffff,0x864fc963		! Expected data for %l7
	.word	0xff0000ff,0x63c94f86		! Expected data for %f0
	.word	0xff000000,0x000000ff		! Expected data for %f2
	.word	0x00000096,0x00000000		! Expected data for %f10
	.word	0xff000000,0x1db4a5ff		! Expected data for %f12
	.word	0xa96e6a5a,0x864fc9ff		! Expected data for %f20
	.word	0x400913b6,0x00000000		! Expected data for %f24
	.word	0x400913b6,0xff0000ff		! Expected data for %f28
	.word	0xffffffff,0x00000000		! Expected data for %f30
p0_check_pt_data_48:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x000000ff		! Expected data for %l0
	.word	0xffffffff,0xffffff09		! Expected data for %l1
	.word	0x00000000,0x00000000		! Expected data for %l2
	.word	0x00000000,0xff000000		! Expected data for %l3
	.word	0x00000000,0x00000000		! Expected data for %l4
	.word	0x00000000,0xffffffff		! Expected data for %l5
	.word	0x00000000,0x000000ff		! Expected data for %l6
	.word	0x00000000,0x000000ff		! Expected data for %l7
	.word	0xff000000,0x000000ff		! Expected data for %f2
	.word	0xda770000,0xba2d00a3		! Expected data for %f4
	.word	0xffffffff,0xffffffff		! Expected data for %f6
	.word	0xffffffff,0x00000000		! Expected data for %f14
	.word	0xff000000,0x00000000		! Expected data for %f22
	.word	0xffffffff,0xda770000		! Expected data for %f30
p0_check_pt_data_49:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x5b45efef,0xadd212bd		! Expected data for %l0
	.word	0x0a5f6990,0x54c38bdb		! Expected data for %l1
	.word	0xffffffff,0x0000ffff		! Expected data for %l2
	.word	0xffffffff,0xffffffff		! Expected data for %l3
	.word	0xffffffff,0xffffffff		! Expected data for %l4
	.word	0xffffffff,0xff0000ff		! Expected data for %l5
	.word	0x00000000,0xffffffff		! Expected data for %l6
	.word	0x00000000,0x000000ff		! Expected data for %l7
	.word	0xffffffff,0xffffffff		! Expected data for %f6
	.word	0x00000096,0xffffffff		! Expected data for %f10
	.word	0x00000000,0xb61309ff		! Expected data for %f16
	.word	0xffffffff,0x000000ff		! Expected data for %f22
	.word	0x00000000,0x0000ffff		! Expected data for %f24
	.word	0xda770000,0x000000ff		! Expected data for %f26
	.word	0xff0000ff,0xff0000ff		! Expected data for %f30
p0_check_pt_data_50:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x000000ff		! Expected data for %l0
	.word	0xff000000,0x00000000		! Expected data for %l1
	.word	0x00000000,0x000000ff		! Expected data for %l2
	.word	0x00000000,0x000000ff		! Expected data for %l3
	.word	0x00000000,0x000000ff		! Expected data for %l4
	.word	0x00000000,0xff0000ff		! Expected data for %l5
	.word	0x00000000,0x000000ff		! Expected data for %l6
	.word	0x00000000,0x000000ff		! Expected data for %l7
	.word	0xffffffff,0x000000ff		! Expected data for %f0
	.word	0xffff0000,0x00009eff		! Expected data for %f2
	.word	0x400913b6,0xff0000ff		! Expected data for %f4
	.word	0x00000000,0xdc003118		! Expected data for %f6
	.word	0xffffffff,0x06fd1eff		! Expected data for %f8
	.word	0x000000ae,0x00000000		! Expected data for %f10
	.word	0xffffffff,0xffff0000		! Expected data for %f12
	.word	0xff000000,0xa5000000		! Expected data for %f14
	.word	0xff0000ff,0xffffffff		! Expected data for %f24
p0_check_pt_data_51:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x000000ff		! Expected data for %l0
	.word	0x00000000,0x00000000		! Expected data for %l1
	.word	0x00000000,0x00000000		! Expected data for %l2
	.word	0x00000000,0x00000040		! Expected data for %l3
	.word	0x00000000,0x0000ffc9		! Expected data for %l4
	.word	0x00000000,0xff000000		! Expected data for %l5
	.word	0xffffffff,0xffffffff		! Expected data for %l6
	.word	0xffffffff,0xffffffff		! Expected data for %l7
	.word	0x54c38bdb,0x000000ff		! Expected data for %f0
	.word	0x400913b6,0xff0000ff		! Expected data for %f4
	.word	0x400913b6,0xff0000ff		! Expected data for %f6
	.word	0xffff0000,0xadd212bd		! Expected data for %f10
	.word	0xa96e6a5a,0x864fc9ff		! Expected data for %f16
	.word	0x00000000,0x864fc9ff		! Expected data for %f20
p0_check_pt_data_52:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x00000040		! Expected data for %l0
	.word	0xa96e6a5a,0x864fc9ff		! Expected data for %l1
	.word	0xffffffff,0xffffffff		! Expected data for %l2
	.word	0x00000000,0x0000005a		! Expected data for %l3
	.word	0x00000000,0x00000000		! Expected data for %l4
	.word	0x00000000,0x00000086		! Expected data for %l5
	.word	0x00000000,0xda770000		! Expected data for %l6
	.word	0x00000000,0x000000da		! Expected data for %l7
	.word	0x864fc963,0xdb8bc354		! Expected data for %f2
	.word	0x400913b6,0x000000ff		! Expected data for %f4
	.word	0xffff0000,0x864fc9ff		! Expected data for %f10
	.word	0x00000000,0x000000ff		! Expected data for %f26
p0_check_pt_data_53:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x00000000		! Expected data for %l0
	.word	0x00000000,0xff0913b6		! Expected data for %l1
	.word	0x00000000,0x00ffffff		! Expected data for %l2
	.word	0x00000000,0x0000ff4f		! Expected data for %l3
	.word	0xff0913b6,0xff0000ff		! Expected data for %l4
	.word	0x00000000,0x00000000		! Expected data for %l5
	.word	0xffffffff,0x000000ff		! Expected data for %l6
	.word	0x00000000,0x000000ff		! Expected data for %l7
	.word	0x54c38bdb,0x000000ff		! Expected data for %f0
	.word	0x400913b6,0xdb8bc354		! Expected data for %f2
	.word	0x400913b6,0x000000ff		! Expected data for %f4
	.word	0x0000ff00,0xff0000ff		! Expected data for %f6
	.word	0xffffffff,0x0000007f		! Expected data for %f8
	.word	0x0000ff00,0xc9ff0000		! Expected data for %f12
	.word	0xc9ff0000,0x00000000		! Expected data for %f24
p0_check_pt_data_54:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x00000000		! Expected data for %l0
	.word	0x00000000,0x00000000		! Expected data for %l2
	.word	0x00000000,0x000000ff		! Expected data for %l3
	.word	0xffffffff,0xffffffff		! Expected data for %l4
	.word	0x00000000,0xff000000		! Expected data for %l5
	.word	0xffffffff,0xffffffff		! Expected data for %l6
	.word	0x00000000,0x000000ff		! Expected data for %l7
	.word	0x54c38bdb,0x000000ff		! Expected data for %f0
	.word	0x400913b6,0xdb8bc354		! Expected data for %f2
	.word	0x0000ff00,0xff0000ff		! Expected data for %f6
	.word	0x000077da,0x00000000		! Expected data for %f14
	.word	0xffc94f86,0x00000000		! Expected data for %f16
	.word	0x54c38bdb,0x000000ff		! Expected data for %f26
p0_check_pt_data_55:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0xffffffff,0xffffffff		! Expected data for %l0
	.word	0x00000000,0x000000ff		! Expected data for %l1
	.word	0xffffffff,0xffffffff		! Expected data for %l2
	.word	0x00000000,0x00000000		! Expected data for %l3
	.word	0x00000000,0x000000ff		! Expected data for %l4
	.word	0x00000000,0xb6130940		! Expected data for %l5
	.word	0xffffffff,0xff00ffff		! Expected data for %l6
	.word	0x00000000,0x00000000		! Expected data for %l7
	.word	0xffc94f86,0x5a6a6eff		! Expected data for %f4
	.word	0xffffffff,0x00ffffff		! Expected data for %f8
	.word	0xff0000ff,0x00000000		! Expected data for %f14
	.word	0xff000000,0xffffffff		! Expected data for %f26
	.word	0x0000ffc9,0x000000ff		! Expected data for %f30
p0_check_pt_data_56:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x00000000		! Expected data for %l0
	.word	0x00000000,0x000000ff		! Expected data for %l1
	.word	0x00000000,0xdb8bc354		! Expected data for %l2
	.word	0x00000000,0x0000ffc9		! Expected data for %l3
	.word	0x00000000,0x40000000		! Expected data for %l4
	.word	0x00000000,0x00000054		! Expected data for %l5
	.word	0x00000000,0x000063ff		! Expected data for %l6
	.word	0x00000000,0x54000000		! Expected data for %l7
	.word	0x54c38bdb,0x000000ff		! Expected data for %f0
	.word	0x400913b6,0xdb8bc354		! Expected data for %f4
	.word	0x0000ff00,0xff0000ff		! Expected data for %f6
p0_check_pt_data_57:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0xad342a70,0x65abc6f1		! Expected data for %l0
	.word	0xffffffff,0xffffffff		! Expected data for %l1
	.word	0x00000000,0x0000ff00		! Expected data for %l2
	.word	0x0000ff00,0x00000000		! Expected data for %l3
	.word	0x00000000,0xff000000		! Expected data for %l4
	.word	0x00000000,0x00000040		! Expected data for %l5
	.word	0xff0913b6,0xff0000ff		! Expected data for %l6
	.word	0x00000000,0x00000000		! Expected data for %l7
	.word	0xff000000,0x000000ff		! Expected data for %f0
	.word	0x400913b6,0xdb8bc354		! Expected data for %f2
	.word	0xffffffff,0x00000000		! Expected data for %f4
	.word	0x54c38bdb,0x000000ff		! Expected data for %f6
	.word	0x00000940,0x000000ff		! Expected data for %f24
p0_check_pt_data_58:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x000000ff		! Expected data for %l0
	.word	0x00000000,0x0000ffff		! Expected data for %l1
	.word	0x00000000,0x000000ff		! Expected data for %l2
	.word	0x00000000,0x000000ff		! Expected data for %l3
	.word	0x00000000,0x000000ff		! Expected data for %l4
	.word	0x00000000,0x000000ff		! Expected data for %l5
	.word	0x00000000,0x00000940		! Expected data for %l6
	.word	0x00000000,0x0000c9ff		! Expected data for %l7
	.word	0x0000ffff,0xdb8bc300		! Expected data for %f0
	.word	0x5a000000,0x63c94f86		! Expected data for %f2
	.word	0x00000000,0x00000000		! Expected data for %f4
	.word	0x54c38bdb,0x000000ff		! Expected data for %f6
	.word	0xffc94f86,0x00000000		! Expected data for %f10
	.word	0x5a000000,0x63c94f86		! Expected data for %f16
	.word	0xffff0000,0x000000ff		! Expected data for %f18
	.word	0xff000000,0xdb8bc354		! Expected data for %f20
	.word	0xccbe12ae,0xffffffff		! Expected data for %f22
	.word	0x400913b6,0xff000000		! Expected data for %f24
	.word	0x00000096,0x0000ffff		! Expected data for %f26
	.word	0x000000ff,0x00000000		! Expected data for %f28
	.word	0xa3002dba,0xffffffff		! Expected data for %f30
p0_check_pt_data_59:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0xffc94f86		! Expected data for %l0
	.word	0x00000000,0x000000ff		! Expected data for %l1
	.word	0x00000000,0xff00005a		! Expected data for %l2
	.word	0x00000000,0x000000ff		! Expected data for %l3
	.word	0x00000000,0x0000ffff		! Expected data for %l4
	.word	0xffffffff,0xffffffff		! Expected data for %l5
	.word	0xffffffff,0xffffffff		! Expected data for %l6
	.word	0x00000000,0x0000ff00		! Expected data for %l7
	.word	0xff000000,0x000000ff		! Expected data for %f0
	.word	0x54c38bdb,0xffffffff		! Expected data for %f2
	.word	0xff000000,0x5a0000ff		! Expected data for %f4
	.word	0xff0000ff,0x00ff0000		! Expected data for %f6
	.word	0x00000000,0xff0000ff		! Expected data for %f8
	.word	0xffc94f86,0x0000ffff		! Expected data for %f10
	.word	0x0000ffc9,0x00ff0000		! Expected data for %f12
	.word	0x00000000,0x000000ff		! Expected data for %f14
	.word	0xff0913b6,0xff0000ff		! Expected data for %f16
	.word	0xff000000,0x000000ff		! Expected data for %f18
	.word	0x00000000,0x864fc9ff		! Expected data for %f20
	.word	0xffffffff,0x00000000		! Expected data for %f22
	.word	0xff000000,0xffffff00		! Expected data for %f24
	.word	0x00000000,0x000000ff		! Expected data for %f26
	.word	0x400913b6,0xff0000ff		! Expected data for %f28
	.word	0xff0000ff,0xff0000ff		! Expected data for %f30
p0_check_pt_data_60:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x000000ff		! Expected data for %l0
	.word	0x00000000,0x000000ff		! Expected data for %l1
	.word	0x00000000,0xffffffff		! Expected data for %l2
	.word	0xffffffff,0xffffffff		! Expected data for %l3
	.word	0x00000000,0x000000ff		! Expected data for %l4
	.word	0x00000000,0x0000ffff		! Expected data for %l5
	.word	0x00000000,0xff000000		! Expected data for %l6
	.word	0x00000000,0x00000000		! Expected data for %l7
	.word	0x5a000000,0x63c94f86		! Expected data for %f0
	.word	0xffff0000,0x000000ff		! Expected data for %f2
	.word	0xff000000,0x5a0000ff		! Expected data for %f4
	.word	0xccbe12ae,0xffffffff		! Expected data for %f6
	.word	0x400913b6,0xff000000		! Expected data for %f8
	.word	0x00000096,0x0000ffff		! Expected data for %f10
	.word	0x000000ff,0x00000000		! Expected data for %f12
	.word	0xa3002dba,0xffffffff		! Expected data for %f14
	.word	0xdb0913b6,0x000000ff		! Expected data for %f16
	.word	0xff000000,0x00009eff		! Expected data for %f18
	.word	0xff000000,0x864fc9ff		! Expected data for %f20
	.word	0x00000000,0xdc003118		! Expected data for %f22
	.word	0xffffffff,0x06fd1eff		! Expected data for %f24
	.word	0x000000ae,0x00000000		! Expected data for %f26
	.word	0xffffffff,0xffff0000		! Expected data for %f28
	.word	0xff000000,0xa5000000		! Expected data for %f30
p0_check_pt_data_61:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0xffffffff,0xffffc9ff		! Expected data for %l0
	.word	0x00000000,0x000000ff		! Expected data for %l1
	.word	0x00000000,0x000000ff		! Expected data for %l2
	.word	0xff00005a,0x000000ff		! Expected data for %l3
	.word	0x00000000,0x000000db		! Expected data for %l4
	.word	0xffffffff,0xffffff00		! Expected data for %l5
	.word	0x00000000,0xdb8bc354		! Expected data for %l6
	.word	0x00000000,0x00000000		! Expected data for %l7
	.word	0xff000000,0x00000000		! Expected data for %f0
	.word	0xff000000,0xdb8bc354		! Expected data for %f2
	.word	0x00000000,0x000000ff		! Expected data for %f4
	.word	0x0000ff00,0xff0000ff		! Expected data for %f6
	.word	0xff0000ff,0x00000000		! Expected data for %f8
	.word	0xffff0000,0x864fc9ff		! Expected data for %f10
	.word	0x0000ff00,0xc9ff0000		! Expected data for %f12
	.word	0x000077da,0x00000000		! Expected data for %f14
	.word	0xdb0913b6,0xff0000ff		! Expected data for %f16
	.word	0xff000000,0x00000000		! Expected data for %f26
p0_check_pt_data_62:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x000000ff		! Expected data for %l0
	.word	0xffffffff,0xffffffff		! Expected data for %l1
	.word	0x00000000,0x0000003f		! Expected data for %l2
	.word	0x00000000,0x000000ff		! Expected data for %l3
	.word	0xffffffff,0xff0000ff		! Expected data for %l4
	.word	0x00000000,0x00004f86		! Expected data for %l5
	.word	0x00000000,0x00000000		! Expected data for %l6
	.word	0x00000000,0x000000ff		! Expected data for %l7
	.word	0xff000000,0xdb8bc354		! Expected data for %f2
	.word	0x00000000,0x000000ff		! Expected data for %f4
	.word	0x00000000,0x00000000		! Expected data for %f12
	.word	0x00000000,0x000000ff		! Expected data for %f18
	.word	0x703f71ab,0x06fd1eff		! Expected data for %f24
p0_check_pt_data_63:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0xff000000		! Expected data for %l0
	.word	0x00000000,0x00000000		! Expected data for %l1
	.word	0x00000000,0x000000ff		! Expected data for %l2
	.word	0x00000000,0x63c94f86		! Expected data for %l3
	.word	0x00000000,0x000000ff		! Expected data for %l4
	.word	0x00000000,0xffffffff		! Expected data for %l5
	.word	0x00000000,0x0000005a		! Expected data for %l7
	.word	0xff000000,0x63c94f86		! Expected data for %f0
	.word	0xffff0000,0x000000ff		! Expected data for %f2
	.word	0xff000000,0x5a0000ff		! Expected data for %f4
	.word	0xccbe12ae,0xffffffff		! Expected data for %f6
	.word	0x400913b6,0xff000000		! Expected data for %f8
	.word	0x00000096,0x0000ffff		! Expected data for %f10
	.word	0x000000ff,0x00000000		! Expected data for %f12
	.word	0xa3002dba,0xffffffff		! Expected data for %f14
	.word	0xff000000,0xffc9ff00		! Expected data for %f22
	.word	0x5a000000,0x00000000		! Expected data for %f26
	.word	0x00000000,0x00000000		! Expected data for %f28
	.word	0xff000000,0x00000000		! Expected data for %f30
p0_check_pt_data_64:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0xa96e6a5a		! Expected data for %l0
	.word	0x00000000,0x864fc9ff		! Expected data for %l1
	.word	0x00000000,0x000000ff		! Expected data for %l2
	.word	0x00000000,0xffffffff		! Expected data for %l3
	.word	0x00000000,0xff0000ff		! Expected data for %l4
	.word	0x00000000,0x00000000		! Expected data for %l5
	.word	0x00000000,0x000000ff		! Expected data for %l6
	.word	0xff000000,0x00000000		! Expected data for %l7
	.word	0xff00ff00,0xdb8bc354		! Expected data for %f0
	.word	0xff000000,0x5a0000ff		! Expected data for %f4
	.word	0x000000ff,0xffffffff		! Expected data for %f6
	.word	0xff000000,0xffffffff		! Expected data for %f14
	.word	0x00000940,0xffffffff		! Expected data for %f16
	.word	0x00000000,0x00000000		! Expected data for %f18
	.word	0xffffffff,0xff000000		! Expected data for %f20
	.word	0xff000000,0x0000ffff		! Expected data for %f22
	.word	0xff1efd06,0xffffffff		! Expected data for %f24
	.word	0x00000000,0x00000000		! Expected data for %f26
	.word	0x864fc963,0x0000005a		! Expected data for %f28
	.word	0x5a000000,0x00000000		! Expected data for %f30
p0_check_pt_data_65:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0xff000000		! Expected data for %l0
	.word	0x00000000,0x00000000		! Expected data for %l1
	.word	0x00000000,0x000000ff		! Expected data for %l2
	.word	0xffffffff,0xffffffff		! Expected data for %l3
	.word	0x00000000,0xffffffff		! Expected data for %l4
	.word	0x00000000,0xdb8bc354		! Expected data for %l5
	.word	0x00000000,0x0000ffff		! Expected data for %l6
	.word	0x00000000,0x00000000		! Expected data for %l7
	.word	0xff000000,0x63c94f86		! Expected data for %f0
	.word	0x00000000,0x000000ff		! Expected data for %f2
	.word	0x00000086,0x5a0000ff		! Expected data for %f4
	.word	0x000000ff,0x00000000		! Expected data for %f6
	.word	0xff000000,0xffffffff		! Expected data for %f8
	.word	0xff000000,0xff0000ff		! Expected data for %f10
	.word	0x000000ff,0xb6130940		! Expected data for %f12
	.word	0xff0000ff,0xffffffff		! Expected data for %f14
	.word	0x864fc963,0x0000005a		! Expected data for %f16
	.word	0xff000000,0xdb8bc354		! Expected data for %f18
	.word	0x00000000,0x864f00ff		! Expected data for %f20
	.word	0xffffffff,0xae12becc		! Expected data for %f22
	.word	0x000000ff,0xb6130940		! Expected data for %f24
	.word	0xffff0000,0x96000000		! Expected data for %f26
	.word	0x00000000,0xff000000		! Expected data for %f28
	.word	0xff000000,0x000000ff		! Expected data for %f30
p0_check_pt_data_66:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0xffc94f86		! Expected data for %l0
	.word	0x00000000,0xff00ffff		! Expected data for %l1
	.word	0x00000000,0x000000ff		! Expected data for %l2
	.word	0x00000000,0x000054c3		! Expected data for %l3
	.word	0x00000000,0x00000000		! Expected data for %l4
	.word	0x00000000,0x000000ff		! Expected data for %l6
	.word	0x00000000,0x00000000		! Expected data for %l7
	.word	0xff000000,0x63c94f86		! Expected data for %f0
	.word	0xffffffff,0xdc003118		! Expected data for %f2
	.word	0x00000086,0x5a0000ff		! Expected data for %f4
	.word	0x000000ff,0xffffffff		! Expected data for %f6
	.word	0x000000ff,0xff0000ff		! Expected data for %f10
	.word	0x005a005a,0x000000ff		! Expected data for %f16
p0_check_pt_data_67:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x00000086		! Expected data for %l0
	.word	0x00000000,0xff000000		! Expected data for %l1
	.word	0x00000000,0x000000ff		! Expected data for %l2
	.word	0xffffffff,0xffffffff		! Expected data for %l3
	.word	0xffffffff,0xffffffff		! Expected data for %l4
	.word	0x00000000,0x000000ff		! Expected data for %l5
	.word	0xffffffff,0xffffffff		! Expected data for %l6
	.word	0xffffffff,0xffffc354		! Expected data for %l7
	.word	0xff000000,0x63c94f86		! Expected data for %f0
	.word	0xffffffff,0xdc003118		! Expected data for %f2
	.word	0x00000086,0x5a0000ff		! Expected data for %f4
	.word	0x000000ff,0xffffffff		! Expected data for %f6
	.word	0xff000000,0xffffffff		! Expected data for %f8
	.word	0x000000ff,0xff0000ff		! Expected data for %f10
	.word	0x000000ff,0xb6130940		! Expected data for %f12
	.word	0xff0000ff,0xffffffff		! Expected data for %f14
	.word	0xff000000,0x0000003f		! Expected data for %f18
	.word	0x864fc963,0x864f00ff		! Expected data for %f20
	.word	0xff0000ff,0xb6130940		! Expected data for %f24
	.word	0xff00ff00,0xdb8bc354		! Expected data for %f26
	.word	0x00000000,0xffffffff		! Expected data for %f28
	.word	0xff00005a,0x864fc963		! Expected data for %f30
p0_check_pt_data_68:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0xffffffff,0xffffffff		! Expected data for %l0
	.word	0x00000000,0x000000ff		! Expected data for %l1
	.word	0x00000000,0x00000086		! Expected data for %l2
	.word	0x00000000,0x000000ff		! Expected data for %l4
	.word	0x00000000,0x00000018		! Expected data for %l5
	.word	0x00000000,0x0000c354		! Expected data for %l6
	.word	0x00000000,0x00000000		! Expected data for %l7
	.word	0x00000086,0x5a0000ff		! Expected data for %f4
	.word	0x3f000000,0x000000ff		! Expected data for %f10
	.word	0x00000000,0xff4fc9ff		! Expected data for %f28
p0_check_pt_data_69:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0xffffffff,0xffffffff		! Expected data for %l0
	.word	0x00000000,0x00000000		! Expected data for %l1
	.word	0x00000000,0x00000054		! Expected data for %l2
	.word	0x00000000,0x0000ffff		! Expected data for %l3
	.word	0x00000000,0x18000000		! Expected data for %l4
	.word	0x00000000,0x00000000		! Expected data for %l5
	.word	0xffffffff,0xffffffff		! Expected data for %l6
	.word	0x00000000,0x00000000		! Expected data for %l7
	.word	0x00000000,0x00000000		! Expected data for %f0
	.word	0x00000086,0x5a0000ff		! Expected data for %f4
	.word	0x000000ff,0xffffffff		! Expected data for %f6
	.word	0xdb8bc354,0xffffffff		! Expected data for %f14
	.word	0x005a005a,0xffffffff		! Expected data for %f16
	.word	0xffffffff,0x183100dc		! Expected data for %f20
	.word	0xff0000ff,0xdc003118		! Expected data for %f24
	.word	0xff000000,0xff000000		! Expected data for %f26
	.word	0xffffffff,0xdc003118		! Expected data for %f28
p0_check_pt_data_70:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x000000ff		! Expected data for %l0
	.word	0x00000000,0x00000000		! Expected data for %l1
	.word	0x00000000,0x00000000		! Expected data for %l3
	.word	0xffffffff,0xffffffff		! Expected data for %l4
	.word	0x00000000,0x000000ff		! Expected data for %l5
	.word	0x00000000,0xff00005a		! Expected data for %l7
	.word	0x00000000,0x00000000		! Expected data for %f0
	.word	0x000000ff,0x00000000		! Expected data for %f2
	.word	0xff004f86,0x63c94f86		! Expected data for %f4
	.word	0x000000ff,0xffffffff		! Expected data for %f6
	.word	0x00000000,0xff000000		! Expected data for %f8
	.word	0xff004f86,0x63c94f86		! Expected data for %f22
	.word	0xff000000,0x003100dc		! Expected data for %f26
p0_check_pt_data_71:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x00ffffff		! Expected data for %l0
	.word	0x00000000,0x0000ffff		! Expected data for %l1
	.word	0xffffffff,0xffffff00		! Expected data for %l2
	.word	0x00000000,0xff000000		! Expected data for %l3
	.word	0xffffffff,0xdc003118		! Expected data for %l4
	.word	0x00000000,0x00000000		! Expected data for %l5
	.word	0x00000000,0x000000ff		! Expected data for %l6
	.word	0x00000000,0x00000000		! Expected data for %l7
	.word	0x00000000,0x00000000		! Expected data for %f0
	.word	0x000000ff,0x00000000		! Expected data for %f2
	.word	0x00000000,0xff000000		! Expected data for %f4
	.word	0xff0000ff,0x00000000		! Expected data for %f8
	.word	0xdb8bc354,0xff0000ff		! Expected data for %f14
	.word	0x00000018,0x00000000		! Expected data for %f28
p0_check_pt_data_72:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x00000000		! Expected data for %l0
	.word	0xffffffff,0xffffffff		! Expected data for %l1
	.word	0xffffffff,0xffffffff		! Expected data for %l2
	.word	0x00000000,0xff0000ff		! Expected data for %l3
	.word	0x00000000,0x000018ff		! Expected data for %l4
	.word	0xff000000,0x5a0000ff		! Expected data for %l5
	.word	0x00000000,0x3f000000		! Expected data for %l6
	.word	0x00000000,0x000000ff		! Expected data for %l7
	.word	0x00000000,0x00000000		! Expected data for %f0
	.word	0x000000ff,0xffffffff		! Expected data for %f6
	.word	0xffffffff,0xff000000		! Expected data for %f24
p0_check_pt_data_73:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x00000000		! Expected data for %l1
	.word	0x00000000,0x00000000		! Expected data for %l2
	.word	0x00000000,0xff0000ff		! Expected data for %l3
	.word	0x000000ff,0xff180000		! Expected data for %l4
	.word	0xffffffff,0xffffffff		! Expected data for %l5
	.word	0xffffffff,0xffffffff		! Expected data for %l6
	.word	0x00000000,0x00000018		! Expected data for %l7
	.word	0x000000ff,0xffffffff		! Expected data for %f6
	.word	0x3f000000,0xffffffff		! Expected data for %f18
	.word	0x000000ff,0x00000000		! Expected data for %f24
	.word	0x00000000,0x00ffffff		! Expected data for %f30
p0_check_pt_data_74:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x0000ffff		! Expected data for %l1
	.word	0xffc94fff,0x00000000		! Expected data for %l2
	.word	0x00000000,0xff00005a		! Expected data for %l3
	.word	0x00000000,0x00000018		! Expected data for %l4
	.word	0x00000000,0x000000ff		! Expected data for %l5
	.word	0x00000000,0x0000cc00		! Expected data for %l6
	.word	0x00000000,0x00000000		! Expected data for %f0
	.word	0x00000000,0xff000000		! Expected data for %f4
	.word	0x000000ff,0xffffffff		! Expected data for %f6
	.word	0x00000000,0xff0000ff		! Expected data for %f8
	.word	0x00000000,0xff0000cc		! Expected data for %f12
	.word	0x00ffffff,0x000000ff		! Expected data for %f16
	.word	0x000000ff,0x00000000		! Expected data for %f18
	.word	0xffffffff,0x5a005a00		! Expected data for %f20
	.word	0x00000000,0xffffffff		! Expected data for %f22
	.word	0xff00005a,0x864fc963		! Expected data for %f24
	.word	0xc3540000,0x00000000		! Expected data for %f26
	.word	0xff0000ff,0x00000000		! Expected data for %f28
	.word	0xa96e6a5a,0xff000000		! Expected data for %f30
p0_check_pt_data_75:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x000000ff		! Expected data for %l0
	.word	0x00000000,0xdc003118		! Expected data for %l1
	.word	0x00000000,0x00000000		! Expected data for %l2
	.word	0xffffffff,0x00000000		! Expected data for %l3
	.word	0xffffffff,0xffffffff		! Expected data for %l4
	.word	0x00000000,0x00000000		! Expected data for %l5
	.word	0x00000000,0x00000000		! Expected data for %l6
	.word	0x00000000,0x000000ff		! Expected data for %l7
	.word	0x00000000,0x00000000		! Expected data for %f0
	.word	0x000000ff,0xff000000		! Expected data for %f2
	.word	0xffffffff,0x0000003f		! Expected data for %f6
	.word	0xff0000ff,0x00000000		! Expected data for %f10
	.word	0xffffffff,0x00000000		! Expected data for %f14
	.word	0xff000000,0xffffff00		! Expected data for %f16
	.word	0x00000000,0xff000000		! Expected data for %f18
	.word	0x005a005a,0xffffffff		! Expected data for %f20
	.word	0xffffffff,0x00000000		! Expected data for %f22
	.word	0x63c94f86,0x18000000		! Expected data for %f24
	.word	0x00000000,0x000054c3		! Expected data for %f26
	.word	0x00000000,0xff0000ff		! Expected data for %f28
	.word	0x000000ff,0x5a6a6ea9		! Expected data for %f30
p0_check_pt_data_76:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x000000ff		! Expected data for %l0
	.word	0x00000000,0x005a005a		! Expected data for %l1
	.word	0x00000000,0x00000000		! Expected data for %l2
	.word	0x00000000,0x000000ff		! Expected data for %l3
	.word	0x00000000,0x00000000		! Expected data for %l4
	.word	0x00000000,0x00000000		! Expected data for %l6
	.word	0x00000000,0x00000000		! Expected data for %l7
	.word	0xff000000,0x000000ff		! Expected data for %f4
	.word	0xffffffff,0x0000003f		! Expected data for %f6
	.word	0xff0000ff,0xff000000		! Expected data for %f10
	.word	0xff000000,0xff000000		! Expected data for %f14
	.word	0xff000000,0x000000ff		! Expected data for %f16
	.word	0x000018ff,0xff0000ff		! Expected data for %f18
	.word	0x864fc963,0x864f00ff		! Expected data for %f20
	.word	0xffffffff,0xae12becc		! Expected data for %f22
	.word	0xff0000ff,0xb6130940		! Expected data for %f24
	.word	0xff00ffff,0xdb8bc354		! Expected data for %f26
	.word	0x00000000,0xff4fc9ff		! Expected data for %f28
	.word	0xff00005a,0x864fc963		! Expected data for %f30
p0_check_pt_data_77:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x000000ff		! Expected data for %l0
	.word	0x00000000,0x000000ff		! Expected data for %l1
	.word	0x00000000,0x00000000		! Expected data for %l2
	.word	0x00000000,0x00000000		! Expected data for %l3
	.word	0x00000000,0x0000003f		! Expected data for %l4
	.word	0x00000000,0x005a005a		! Expected data for %l5
	.word	0x00000000,0x00000000		! Expected data for %l6
	.word	0x00000000,0x00000000		! Expected data for %l7
	.word	0x00000000,0x00000000		! Expected data for %f0
	.word	0x000000ff,0xff000000		! Expected data for %f2
	.word	0xff000000,0x000000ff		! Expected data for %f4
	.word	0xffffffff,0x0000003f		! Expected data for %f6
	.word	0xff0000ff,0x005a005a		! Expected data for %f10
	.word	0x63c94f86,0x864f00ff		! Expected data for %f20
	.word	0x000000ff,0x00000018		! Expected data for %f24
	.word	0x18000000,0x00000000		! Expected data for %f28
p0_check_pt_data_78:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0xff090000		! Expected data for %l0
	.word	0xffffffff,0xffffffff		! Expected data for %l1
	.word	0x00000000,0x000000ff		! Expected data for %l3
	.word	0x00000000,0x00000000		! Expected data for %l4
	.word	0xffffffff,0xffffffff		! Expected data for %l5
	.word	0x00000000,0xff0000ff		! Expected data for %l6
	.word	0x00000000,0xff000000		! Expected data for %l7
	.word	0x00000000,0x00000000		! Expected data for %f0
	.word	0xff000000,0xdc003118		! Expected data for %f4
	.word	0xffffffff,0x0000003f		! Expected data for %f6
	.word	0x00000000,0x000000ff		! Expected data for %f12
p0_check_pt_data_79:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x000000ff		! Expected data for %l0
	.word	0x00000000,0x00000000		! Expected data for %l1
	.word	0xccbe12ae,0x000000ff		! Expected data for %l2
	.word	0x00000000,0x000000ff		! Expected data for %l3
	.word	0x00000000,0x00000000		! Expected data for %l4
	.word	0xffffffff,0xff0000ff		! Expected data for %l5
	.word	0xff0000ff,0x00000000		! Expected data for %l7
	.word	0xff0000ff,0x00000000		! Expected data for %f0
	.word	0x00000000,0xffffffff		! Expected data for %f2
	.word	0x18000000,0xff000000		! Expected data for %f4
	.word	0xff00ff00,0xdb8bc354		! Expected data for %f6
	.word	0x00000000,0xffffffff		! Expected data for %f8
	.word	0xff000000,0x00000000		! Expected data for %f10
	.word	0xff004f86,0x864fc963		! Expected data for %f12
	.word	0x0000dc45,0x00000000		! Expected data for %f14
	.word	0x00000000,0x000000ff		! Expected data for %f16
	.word	0xff004f86,0x864fc963		! Expected data for %f18
	.word	0xffff4f86,0x63c94f86		! Expected data for %f20
	.word	0xccbe12ae,0xffffffff		! Expected data for %f22
	.word	0x400913b6,0xff0000ff		! Expected data for %f24
	.word	0x54c38bdb,0xffff00ff		! Expected data for %f26
	.word	0xffc94fff,0x00000000		! Expected data for %f28
	.word	0x63c94f86,0x5a0000ff		! Expected data for %f30
p0_check_pt_data_80:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0xff0000ff,0x00000028		! Expected data for %l0
	.word	0x00000000,0x18000000		! Expected data for %l1
	.word	0x02f4000a,0xf1ef0e11		! Expected data for %l2
	.word	0x00000000,0x000000ff		! Expected data for %l3
	.word	0xff00ffa5,0x0000ffff		! Expected data for %l4
	.word	0x00000000,0x0000ffff		! Expected data for %l5
	.word	0x00000000,0x00000000		! Expected data for %l6
	.word	0x00000000,0x00001a7b		! Expected data for %l7
	.word	0xff0000ff,0x00000000		! Expected data for %f0
	.word	0x18000000,0xff000000		! Expected data for %f4
	.word	0x000000ff,0xb6130940		! Expected data for %f6
	.word	0x703f71ab,0xffffffff		! Expected data for %f8
	.word	0x000000ff,0x00ff0000		! Expected data for %f10
	.word	0x00000000,0x00000000		! Expected data for %f14
p0_check_pt_data_81:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x00000000		! Expected data for %l0
	.word	0x7aea4eff,0xf1248064		! Expected data for %l1
	.word	0x00000000,0xffffffff		! Expected data for %l2
	.word	0x00000000,0x000000ff		! Expected data for %l3
	.word	0x00000000,0xff000000		! Expected data for %l4
	.word	0x00000000,0x00000000		! Expected data for %l5
	.word	0x00000000,0x00000000		! Expected data for %l6
	.word	0x00000000,0x00000000		! Expected data for %l7
	.word	0x00000000,0xffffffff		! Expected data for %f2
	.word	0x703f71ab,0x00000000		! Expected data for %f4
	.word	0x00000000,0xa96e6a5a		! Expected data for %f6
	.word	0x000000ff,0xb6130940		! Expected data for %f8
	.word	0x00000000,0xff000000		! Expected data for %f16
	.word	0xff004f86,0xffffffff		! Expected data for %f18
	.word	0x0000db8b,0xffff00ff		! Expected data for %f26
p0_check_pt_data_82:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x00000000		! Expected data for %l0
	.word	0x00000000,0x00000000		! Expected data for %l1
	.word	0xffffffff,0xffffff00		! Expected data for %l2
	.word	0x00000000,0x000000ff		! Expected data for %l3
	.word	0x00000000,0x00000000		! Expected data for %l4
	.word	0x00000000,0x000000ff		! Expected data for %l5
	.word	0x00000000,0x000000ff		! Expected data for %l6
	.word	0x00000000,0x00000000		! Expected data for %l7
	.word	0xff000000,0x00000000		! Expected data for %f0
	.word	0x703f71ab,0x00000000		! Expected data for %f4
	.word	0x00000000,0xff0000ff		! Expected data for %f6
	.word	0x000000ff,0x00ffffff		! Expected data for %f8
	.word	0xffffffff,0x5a005aff		! Expected data for %f24
	.word	0x000000ff,0x5a0000ff		! Expected data for %f30
p0_check_pt_data_83:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0xffff0000		! Expected data for %l0
	.word	0x00000000,0xffffffff		! Expected data for %l1
	.word	0x00000000,0x000000ff		! Expected data for %l2
	.word	0x00000000,0x00000000		! Expected data for %l3
	.word	0x00000000,0x00000000		! Expected data for %l4
	.word	0xffffffff,0xffffffff		! Expected data for %l5
	.word	0x00000000,0x00000000		! Expected data for %l6
	.word	0x00000000,0x000000ff		! Expected data for %l7
	.word	0xff000000,0x00000000		! Expected data for %f0
	.word	0x00000000,0xffffffff		! Expected data for %f2
	.word	0xffff0000,0x00000000		! Expected data for %f4
	.word	0x00000000,0x00000000		! Expected data for %f6
	.word	0xffffffff,0xff000000		! Expected data for %f10
	.word	0x00000000,0x00000000		! Expected data for %f14
	.word	0x000000ff,0x000000ff		! Expected data for %f16
	.word	0xff000000,0x00000000		! Expected data for %f18
	.word	0xccbe12ae,0xb6130940		! Expected data for %f20
p0_check_pt_data_84:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0xc3540000,0x00000000		! Expected data for %l0
	.word	0x00000000,0xffffffff		! Expected data for %l1
	.word	0x00000000,0x00000000		! Expected data for %l2
	.word	0x00000000,0x005a005a		! Expected data for %l3
	.word	0x00000000,0x00000000		! Expected data for %l4
	.word	0x00000000,0x000000ff		! Expected data for %l5
	.word	0x00000000,0x00000000		! Expected data for %l6
	.word	0x00000000,0x000000ff		! Expected data for %l7
	.word	0xff000000,0x00000000		! Expected data for %f0
	.word	0x00000000,0xffffffff		! Expected data for %f2
	.word	0x00000000,0x000000ff		! Expected data for %f12
	.word	0x63c94f86,0x000000ff		! Expected data for %f20
	.word	0x18000000,0x00ff0000		! Expected data for %f24
	.word	0xff000000,0x00000000		! Expected data for %f30
p0_check_pt_data_85:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0xff0000ff,0x00000000		! Expected data for %l0
	.word	0x00000000,0x000000ff		! Expected data for %l1
	.word	0x00000000,0x0000ffff		! Expected data for %l2
	.word	0x00000000,0x00000000		! Expected data for %l3
	.word	0x00000000,0x000000ff		! Expected data for %l4
	.word	0x00000000,0x00ffffff		! Expected data for %l5
	.word	0x00000000,0x000000ff		! Expected data for %l7
	.word	0x000000ff,0x000000ff		! Expected data for %f0
	.word	0xff000000,0xae12becc		! Expected data for %f4
	.word	0x000000ff,0xffffffff		! Expected data for %f8
	.word	0x000000ff,0x00000000		! Expected data for %f14
	.word	0xffffffff,0xae12becc		! Expected data for %f24
	.word	0xff000000,0xff000000		! Expected data for %f26
	.word	0x00000000,0x00ffffff		! Expected data for %f28
p0_check_pt_data_86:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x000000ff		! Expected data for %l0
	.word	0x00000000,0x00ffffcc		! Expected data for %l1
	.word	0x00000000,0xff0000ff		! Expected data for %l2
	.word	0x00000000,0x00000000		! Expected data for %l3
	.word	0x00000000,0x000000ff		! Expected data for %l5
	.word	0xffffffff,0xffffff00		! Expected data for %l6
	.word	0x00000000,0x000000ff		! Expected data for %l7
	.word	0x000000ff,0xffffffff		! Expected data for %f2
	.word	0x0000ffff,0xae12becc		! Expected data for %f12
	.word	0x000000ff,0xff000000		! Expected data for %f14
	.word	0xff000000,0xccbe12ae		! Expected data for %f16
	.word	0x00000000,0x00ffffff		! Expected data for %f18
	.word	0xffff0000,0x000000ff		! Expected data for %f20
	.word	0x00000000,0x00000000		! Expected data for %f22
	.word	0x000000ff,0x00ffffff		! Expected data for %f24
	.word	0xffffffff,0xff000000		! Expected data for %f26
	.word	0xff004f86,0x864fc963		! Expected data for %f28
	.word	0x00000000,0x00000000		! Expected data for %f30
p0_check_pt_data_87:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x00000000		! Expected data for %l0
	.word	0x00000000,0xff00ff00		! Expected data for %l1
	.word	0x00000000,0x00000000		! Expected data for %l2
	.word	0x00000000,0x00000000		! Expected data for %l3
	.word	0x00000000,0x00000000		! Expected data for %l4
	.word	0x00000000,0x000000ff		! Expected data for %l5
	.word	0x00000000,0x000000ff		! Expected data for %l6
	.word	0x00000000,0xff004f86		! Expected data for %l7
	.word	0x000000ff,0xffffffff		! Expected data for %f2
	.word	0x000000ff,0xae12becc		! Expected data for %f4
	.word	0x00000000,0xff0000ff		! Expected data for %f8
	.word	0xae12becc,0xff000000		! Expected data for %f10
	.word	0x00000000,0x000000ff		! Expected data for %f20
p0_check_pt_data_88:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x00000000		! Expected data for %l0
	.word	0x00000000,0x0000ff00		! Expected data for %l1
	.word	0x00000000,0x00000000		! Expected data for %l2
	.word	0x00000000,0x000000ff		! Expected data for %l3
	.word	0x00000000,0x00000000		! Expected data for %l4
	.word	0x00000000,0x0000864f		! Expected data for %l5
	.word	0xff000000,0x00000000		! Expected data for %l6
	.word	0x00000000,0xffc94fff		! Expected data for %l7
	.word	0x000000ff,0xae12becc		! Expected data for %f4
	.word	0xff0000ff,0xccbe12ae		! Expected data for %f16
	.word	0x00000000,0x000000ff		! Expected data for %f20
	.word	0x000000ff,0x000000ff		! Expected data for %f24
p0_check_pt_data_89:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x00000000		! Expected data for %l0
	.word	0xffffffff,0xffffffff		! Expected data for %l1
	.word	0xffffffff,0xccbe12ae		! Expected data for %l2
	.word	0x00000000,0x00000000		! Expected data for %l3
	.word	0xffffffff,0xffffffff		! Expected data for %l4
	.word	0x00000000,0x000000ff		! Expected data for %l5
	.word	0xffffffff,0xffffff86		! Expected data for %l6
	.word	0x00000000,0x00000000		! Expected data for %l7
	.word	0x00ffffff,0x000000ff		! Expected data for %f0
	.word	0x864f00ff,0x00000000		! Expected data for %f2
	.word	0x0000ff00,0x5affff00		! Expected data for %f4
	.word	0x00000000,0xffffffff		! Expected data for %f6
	.word	0x00000000,0x00000000		! Expected data for %f8
	.word	0xc3540000,0x00000000		! Expected data for %f10
	.word	0xff0000ff,0x00000000		! Expected data for %f12
	.word	0xa96e6a5a,0xff000000		! Expected data for %f14
	.word	0x00000000,0xff0000ff		! Expected data for %f24
	.word	0x00000000,0xff000000		! Expected data for %f26
p0_check_pt_data_90:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x0000ffff		! Expected data for %l1
	.word	0x00000000,0x00000000		! Expected data for %l3
	.word	0xffffffff,0xff004f86		! Expected data for %l4
	.word	0x00000000,0x000000ff		! Expected data for %l5
	.word	0x00000000,0x0000ff00		! Expected data for %l6
	.word	0x00000000,0x000000ff		! Expected data for %l7
	.word	0xff000000,0x000000ff		! Expected data for %f2
	.word	0xffff0000,0x000000ff		! Expected data for %f6
	.word	0xff000000,0xae12becc		! Expected data for %f10
	.word	0x00000000,0x00000000		! Expected data for %f20
	.word	0xff000000,0xff000000		! Expected data for %f26
p0_check_pt_data_91:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x000000ff		! Expected data for %l0
	.word	0xffffffff,0xff000000		! Expected data for %l1
	.word	0x00000000,0x000000ff		! Expected data for %l2
	.word	0x00000000,0x00000000		! Expected data for %l3
	.word	0x00000000,0xff0000ff		! Expected data for %l4
	.word	0x00000000,0x0000ff00		! Expected data for %l5
	.word	0x00000000,0xffffffff		! Expected data for %l6
	.word	0xffffffff,0xffffffff		! Expected data for %l7
	.word	0xff0000ff,0x000000ff		! Expected data for %f0
	.word	0x00000000,0x000000ff		! Expected data for %f2
	.word	0xff000000,0xff000000		! Expected data for %f4
	.word	0x0000ff00,0x5affff00		! Expected data for %f6
	.word	0x00000000,0x00000000		! Expected data for %f16
	.word	0xae12becc,0xff0000ff		! Expected data for %f20
	.word	0xff0000ff,0x00000000		! Expected data for %f28
	.word	0x00000000,0x003100dc		! Expected data for %f30
p0_check_pt_data_92:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00ffff5a,0x00ff0000		! Expected data for %l0
	.word	0x00000000,0xffffffff		! Expected data for %l1
	.word	0x0000ffff,0x000000ff		! Expected data for %l2
	.word	0x00000000,0xff000000		! Expected data for %l3
	.word	0x00000000,0x000000ff		! Expected data for %l4
	.word	0x00000000,0x000000ff		! Expected data for %l5
	.word	0x00000000,0xae12becc		! Expected data for %l6
	.word	0x00000000,0x00000000		! Expected data for %l7
	.word	0xff000000,0xff000000		! Expected data for %f4
	.word	0xff0000ff,0x00000000		! Expected data for %f8
	.word	0xff000000,0x000000ff		! Expected data for %f12
	.word	0x00000000,0xff00ffff		! Expected data for %f16
	.word	0xffffffff,0xae12becc		! Expected data for %f18
	.word	0x00000000,0x00000000		! Expected data for %f20
	.word	0x00000000,0xab713f70		! Expected data for %f22
	.word	0xff000000,0xff0000ff		! Expected data for %f24
	.word	0x00000000,0x00000000		! Expected data for %f26
	.word	0x8bdb0000,0x3f000000		! Expected data for %f28
	.word	0x00ffffff,0x00000000		! Expected data for %f30
p0_check_pt_data_93:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x00000000		! Expected data for %l0
	.word	0x00000000,0x000000ff		! Expected data for %l1
	.word	0xffffffff,0xffffffff		! Expected data for %l2
	.word	0x00000000,0x000000ff		! Expected data for %l3
	.word	0x00000000,0x00000000		! Expected data for %l5
	.word	0x00000000,0x00000000		! Expected data for %l6
	.word	0x00000000,0x0000ffff		! Expected data for %l7
	.word	0xff0000ff,0x000000ff		! Expected data for %f0
	.word	0x00000000,0x00000000		! Expected data for %f2
	.word	0xff000000,0xff000000		! Expected data for %f4
	.word	0xff000000,0xae12becc		! Expected data for %f10
	.word	0xff000000,0x000000ff		! Expected data for %f16
p0_check_pt_data_94:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x00000000		! Expected data for %l0
	.word	0x00000000,0x5a0000ff		! Expected data for %l1
	.word	0x00000000,0x00000000		! Expected data for %l2
	.word	0x00000000,0x00000012		! Expected data for %l3
	.word	0x00000000,0x000000ff		! Expected data for %l4
	.word	0x00000000,0x000000ff		! Expected data for %l5
	.word	0x00000000,0x00000000		! Expected data for %l6
	.word	0x00000000,0x0000008b		! Expected data for %l7
	.word	0x00000000,0x0000ffff		! Expected data for %f0
	.word	0xff0000ff,0xff4fc963		! Expected data for %f2
	.word	0xff0000ff,0x0000864f		! Expected data for %f4
	.word	0x00000000,0x00000000		! Expected data for %f6
	.word	0x00000000,0x000000ff		! Expected data for %f8
	.word	0xff000000,0x00000000		! Expected data for %f10
	.word	0xdb8bc3ff,0xffffffff		! Expected data for %f12
	.word	0x000000ff,0x000000ff		! Expected data for %f14
	.word	0xff000000,0x003100dc		! Expected data for %f24
p0_check_pt_data_95:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0xffffffff,0xffffffff		! Expected data for %l0
	.word	0x00000000,0x00000000		! Expected data for %l1
	.word	0x00000000,0x00000000		! Expected data for %l2
	.word	0x00000000,0xffffffff		! Expected data for %l3
	.word	0x00000000,0x000000ff		! Expected data for %l4
	.word	0x00000000,0x00000000		! Expected data for %l5
	.word	0x00000000,0x000000ff		! Expected data for %l7
	.word	0x00000000,0x5a6a6ea9		! Expected data for %f0
	.word	0xff0000ff,0xff4fc963		! Expected data for %f2
	.word	0x00000000,0x00000000		! Expected data for %f6
	.word	0xff0000ff,0xccbe12ae		! Expected data for %f18
	.word	0x0000ffff,0x000000ff		! Expected data for %f20
p0_check_pt_data_96:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0xff000000		! Expected data for %l0
	.word	0x00000000,0x000000ff		! Expected data for %l1
	.word	0x00000000,0x000000ff		! Expected data for %l2
	.word	0x00000000,0x00000000		! Expected data for %l3
	.word	0xffffffff,0xffffffff		! Expected data for %l4
	.word	0x00000000,0x000000ff		! Expected data for %l5
	.word	0x00000000,0x000000ff		! Expected data for %l6
	.word	0x00000000,0x000000ff		! Expected data for %l7
	.word	0x00000000,0x5a6a6ea9		! Expected data for %f0
	.word	0xff0000ff,0xff4fc963		! Expected data for %f2
	.word	0x00ffffff,0x000000ff		! Expected data for %f4
	.word	0x00000000,0x00000000		! Expected data for %f6
	.word	0xff000000,0xff0000ff		! Expected data for %f16
	.word	0xffffffff,0x000071ab		! Expected data for %f22
	.word	0x00000000,0x000000ff		! Expected data for %f26
p0_check_pt_data_97:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x00000000		! Expected data for %l0
	.word	0x00000000,0x000000ff		! Expected data for %l1
	.word	0xffffffff,0xffffffcc		! Expected data for %l2
	.word	0x00000000,0x6ea90000		! Expected data for %l3
	.word	0xffffffff,0xff0000ff		! Expected data for %l4
	.word	0x00000000,0x00000000		! Expected data for %l5
	.word	0x00000000,0xffffffff		! Expected data for %l6
	.word	0xff000000,0x5a6a6ea9		! Expected data for %f0
	.word	0x00000000,0xff4fc963		! Expected data for %f2
	.word	0x00ffffff,0xff0000ff		! Expected data for %f4
	.word	0x00000000,0x00000000		! Expected data for %f6
	.word	0xdb8bc3ff,0xffffffff		! Expected data for %f10
	.word	0xff000000,0x000000ff		! Expected data for %f16
	.word	0x00000000,0xffffffff		! Expected data for %f18
	.word	0x4f860000,0x6ea90000		! Expected data for %f20
	.word	0x00000000,0x00000000		! Expected data for %f22
	.word	0x00000000,0x000000ff		! Expected data for %f24
	.word	0x00000000,0x000000ff		! Expected data for %f26
	.word	0xffffffff,0xffc38bdb		! Expected data for %f28
	.word	0xff000000,0xff000000		! Expected data for %f30
p0_check_pt_data_98:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0xff000000		! Expected data for %l0
	.word	0x000000ff,0x000000ff		! Expected data for %l2
	.word	0x00000000,0x00000000		! Expected data for %l3
	.word	0x00000000,0x00000000		! Expected data for %l4
	.word	0x00000000,0x00000000		! Expected data for %l5
	.word	0x00000000,0xffc38bdb		! Expected data for %l6
	.word	0xffffffff,0xccffffff		! Expected data for %l7
	.word	0x00ffffff,0xff0000ff		! Expected data for %f4
	.word	0x00000000,0x00000000		! Expected data for %f6
	.word	0x00000000,0xffffffff		! Expected data for %f22
	.word	0xff000000,0x00000000		! Expected data for %f26
	.word	0xffffffff,0x6ea90000		! Expected data for %f28
p0_check_pt_data_99:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0xffffffff,0xffffffff		! Expected data for %l0
	.word	0xffffffff,0xff000000		! Expected data for %l1
	.word	0x00000000,0x00000000		! Expected data for %l2
	.word	0x00000000,0x00000000		! Expected data for %l3
	.word	0x00000000,0x000000ff		! Expected data for %l4
	.word	0x00000000,0x000000ff		! Expected data for %l5
	.word	0x00000000,0x00000000		! Expected data for %l7
	.word	0xff000000,0xccbe12ae		! Expected data for %f0
	.word	0x00ffffff,0x00000000		! Expected data for %f4
	.word	0x00000000,0xffffffff		! Expected data for %f10
	.word	0x00000000,0xff000000		! Expected data for %f16
	.word	0x000000ff,0x00000000		! Expected data for %f26
p0_check_pt_data_100:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x000000ff		! Expected data for %l0
	.word	0x00000000,0x00000000		! Expected data for %l1
	.word	0x00000000,0x00000000		! Expected data for %l2
	.word	0xffffffff,0xffffffff		! Expected data for %l3
	.word	0xffffffff,0xffffff00		! Expected data for %l4
	.word	0x00000000,0x00000000		! Expected data for %l5
	.word	0x00000000,0x00000000		! Expected data for %l6
	.word	0x00000000,0xff00ffff		! Expected data for %l7
	.word	0x18000000,0xccbe12ae		! Expected data for %f0
	.word	0x00000000,0xff4fc963		! Expected data for %f2
	.word	0x00000000,0xff000000		! Expected data for %f16
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
	.word	0x2129aa9f,0xd14de800
	.word	0x00000000,0x00000002
	.word	0x211d041f,0xbe1df312
	.word	0x00000000,0x00000003
	.word	0x2618adef,0xe99c266c
	.word	0x00000000,0x00000004
	.word	0x1527487f,0xfd698bc2
	.word	0x00000000,0x00000005
	.word	0xea293098,0x69a897d4
	.word	0x00000000,0x00000006
	.word	0xe3050a30,0x517b11eb
	.word	0x00000000,0x00000007
	.word	0x7552d36f,0xea6271a5
	.word	0x00000000,0x00000008
	.word	0x0a0c3a1f,0xe225b187
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
	.word	0x89e6f7f8,0xe33c87df,0xf36e93ce,0xbef70a6b
	.word	0xdfa1ef31,0xeb105ae1,0xccbe12ae,0x7a244989
	.word	0xe89e10b4,0x7781bcc3,0xb7ba6aa9,0xadf0089d
	.word	0x90afdb7b,0x408c6cad,0xc1622dba,0x0d0360a1
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
	.word	0x4893024a,0x703f51d8,0x76cc0dcc,0x4d7205ef
	.word	0x716bf2a5,0x593a0984,0x7b7a34e8,0x2bc2120a
	.word	0xb76830b1,0xf859b6e8,0x4d63fe27,0x89a1ea0b
	.word	0xa3c1d262,0x2bdc87ce,0x785c8b1a,0x6936250f
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
	.word	0xd380c1f0,0x557564dd,0x8d40482b,0xee5b7559
	.word	0xaebb5bfd,0x61160bc4,0x2a31f72c,0x3106d0a1
	.word	0xacf5739d,0xa3edf857,0xd56a83d0,0x06cd9827
	.word	0x302b5b9a,0x53f91e8f,0x6aabdc45,0x183170b9
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
	.word	0x77338946,0x4ba35651,0x59971743,0x8be62902
	.word	0x6c3d21e8,0xf2c95706,0xa28c2e95,0x688ad0d1
	.word	0x7cb06731,0xd18ed4f7,0x7dbe090a,0x1b84add4
	.word	0x43c81f34,0xddf00dfa,0xbc17a842,0xc58168ae
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
	.word	0x08cbc1aa,0x9af8553a,0x03683169,0x0ff6a2cd
	.word	0xf4639d23,0xd6a08646,0x9acec51b,0x6b46e4cb
	.word	0x9b4f0820,0xa48e840e,0xb6130940,0xa192c190
	.word	0x1d263625,0x3c6cb36d,0x81436d5d,0xe2818c31
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
	.word	0xfdbcecba,0xb95b67b4,0xe53631c8,0x66a05396
	.word	0xe50b1055,0x971f53a3,0xe757fa54,0x5c083b1d
	.word	0x53fab710,0xb878f1a0,0x93919fad,0x0fecfb85
	.word	0x3215b3ba,0xa130785a,0x15a4964e,0xa5c8c65f
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
	.word	0x96985297,0x19bc084d,0x940ce1d5,0x7979a9ca
	.word	0x33ddf09f,0xe0410b1b,0x3f477b3c,0x2e808b49
	.word	0x5cca1143,0x1ea5b41d,0x99c32599,0xeb7550e3
	.word	0xfaf8f416,0x4562104a,0x88aadcc9,0x1603950d
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
	.word	0xec1e593d,0x03cb7fbf,0xf735321d,0x570d0ffd
	.word	0x1f477fd6,0xf7dc9b91,0xe4ad4171,0x6dd53edf
	.word	0x121550a3,0x8891fdc5,0xb03a461f,0xb1e85a2f
	.word	0xa77b4726,0x08023c1a,0xc4f3b3a3,0xc2b5c52f
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
	.word	0x334ff9c2,0x683a6332,0xc3aebe97,0x0f425a7c
	.word	0x7a051ec9,0x8184bd80,0xaf5fb967,0x7994996f
	.word	0xc280f5db,0xed262f66,0x772844fd,0xa3fb3cf0
	.word	0x3311a06f,0xdfecf7b2,0xc8969ab2,0xbd6269f2
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
	.word	0x582a190f,0x12bbd853,0x65576254,0xcc3a54f4
	.word	0x239195dd,0x7d447218,0x15b04473,0x507fc82f
	.word	0xe65d3e3c,0x61f8f569,0x6a3de8cb,0x1873dffd
	.word	0x545bb8c4,0x49e8dbec,0xf20316b1,0x7b7980ea
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
	.word	0xcf7bcca3,0xff834ac7,0x98063bae,0x56710a75
	.word	0x0438326f,0x521dadd0,0x1dab3894,0xda297551
	.word	0xe3613df6,0xd4b66f2b,0x0b2f22d4,0xec1ac7fc
	.word	0xa5aa37f8,0xdcfd2bef,0x119799e7,0x169e3a0b
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
	.word	0xf03dc358,0x2aa7c601,0x47f20e8e,0x65ff69f1
	.word	0x67822ca3,0x43123d00,0x5038dbe2,0xdb39f689
	.word	0x8e78bc8b,0x48e7ae99,0xc48ab63c,0xcb057659
	.word	0xc8291d5e,0xccc00d5f,0x89f76ea2,0xf618188f
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
	.word	0xc25b14bc,0xb0195d80,0x334ff227,0xd78771e8
	.word	0xab71f314,0xe2a61342,0x14b471b9,0x26617a8e
	.word	0x4f61277f,0xe46cbd64,0x1657e49d,0xba94c2f1
	.word	0x1a1efd06,0xb2f265c0,0xa96e6a5a,0x864fc963
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
	.word	0x6885d15f,0xe03279c1,0x3fa59a75,0xea671051
	.word	0xd6463311,0xa4d86e5f,0x8eb54fdf,0xf159e90e
	.word	0x589ba7f5,0x534db6ba,0x35ec16f0,0x4424ff0d
	.word	0x53ac191b,0x38a476df,0x5400691c,0x4214e2cc
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
	.word	0x8c2aaf65,0x30dac7c2,0xd548aa16,0x85db0da4
	.word	0xc29e3766,0x54f339d1,0xb77b1491,0x0f7ebf24
	.word	0xd167dcf2,0x5628e878,0xd0b3f3aa,0x40d52359
	.word	0xa92650f2,0xfe15a1db,0xbb35c6ba,0x365b538a
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
	.word	0xba3a7d94,0x1f4e73bb,0x5f025cdf,0xbe432551
	.word	0xbe8ff6a3,0xcb99bf0b,0xe6cb3ca1,0x8e25677b
	.word	0x70c9772d,0xf5055d97,0x26127699,0xe03b6f1d
	.word	0x066d0309,0x3873cfda,0x162fcd3f,0x300ae503
	.word	0x7f87ac70,0x309fd23d,0x06480c5e,0x5d032515
	.word	0xd039ec90,0x996469f6,0x40ca660f,0xe5444aa5
	.word	0xd7402d66,0x111b7cd4,0x073d04ed,0xe581e20b
	.word	0x49275ea9,0xa65acb59,0x5b4df44a,0x0793b71b
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
	.word	0x230e7bbb,0x3358b80a,0xfa94a846,0x5ae6adbb
	.word	0x624b8d3f,0x293e14e7,0x6acf9d23,0x13efd7ab
	.word	0x7da49e89,0x62d2b4c9,0x30f86310,0x23b48acc
	.word	0x1022ef7a,0xbc1a60c1,0xda7b11a3,0x19372280
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
	.word	0x1a7bd0b4,0x76b24138,0xc2c098aa,0xac6b2c90
	.word	0x5ef1a604,0xcab9a2f8,0xfb588c64,0xd2d1e7b1
	.word	0xfb7d7a42,0x97e19484,0xa855640f,0x2bba31ab
	.word	0x664022d7,0x615e9dce,0x931d1f08,0x57b7fb18
	.word	0xe784b2d9,0xd47d3896,0xf1978243,0x45c2edec
	.word	0x4b99763d,0x4a8bd1d0,0xfc7eb327,0xb1a4c590
	.word	0xcfca3d3c,0xb9783abb,0xc1a514e5,0x8a975dd4
	.word	0x860a38d2,0x54064216,0x2e5d41f1,0x6fa2aab6
	.word	0x8bedd5df,0x31153ccd,0x77dcc712,0x38d7cb4b
	.word	0xa32d99be,0xe3834032,0x3d11febc,0xafc5da4f
	.word	0x3f3a2976,0x63dae063,0x7e9d2991,0xd26fe678
	.word	0x56cc73fb,0xb094791e,0xd79090be,0x2a2a0097
	.word	0xe8ff65e1,0xd12e5820,0x382a5f7e,0x0a9fe904
	.word	0x8b4a1da6,0x9a814623,0x14f324d8,0x47b0e15b
	.word	0xbc41dcfd,0xa32a80ca,0x0a1a5fd7,0x16b7e8d3
	.word	0x713a8ad2,0x821f11fe,0x245bb006,0xb1d6f90d
	.word	0x9d99b49a,0x7f3dec3c,0x9e1fe3f9,0xb6dead55
	.word	0xef742a16,0xc5b63883,0x2c1564eb,0x7ac7fe3c
	.word	0x25f5ebbd,0x2e1ca157,0xc7fec74a,0x04943fe6
	.word	0x97044f9c,0x9babf88c,0x6ddc08da,0x845f8d4a
	.word	0x49280ea7,0x0986bd0d,0x8c7a1ae6,0x7e5ef061
	.word	0x1271bedb,0xe371f32a,0x31f70282,0xaaacec0e
	.word	0x9f4446ce,0x3ac68134,0xebaa7210,0x02674594
	.word	0x42f9c6a0,0x6287174f,0x78c595b9,0x9c188ecf
	.word	0x15372200,0x808373c2,0x3bf2621e,0x7b0b01a3
	.word	0xeb4f2b27,0x807dab1f,0x36a08234,0xedb68289
	.word	0xcef80214,0x0fe2d5ba,0xe26f7959,0x0ef0a951
	.word	0x816fd7ae,0x466bd4b3,0xc1ca1099,0xb55682e9
	.word	0xe269397e,0x9dfe71c0,0x6e3ad4ee,0xc1e33d16
	.word	0x770b2570,0x2f591b5e,0x2c3f8b44,0xc70051c7
	.word	0x75aca526,0xdb8c5ddc,0xf816f750,0xd70bb558
	.word	0xcd2d95ed,0xd6cac9a7,0xbb9e88ae,0xe682d560
share3_end:
