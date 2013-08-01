/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: mpgen_3000l.s
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
!	Seed = 325162052
!	Riesling can be on
!	1 Thread, 3000 lines
!	mpgen   created on Dec 20, 2005 (16:35:03)
!	mpgen_3000l.s created on Mar 25, 2009 (16:20:52)
!	RC file : mar25.rc
!	cmd = /import/n2-tools/release/tools/mpgen/mpgen,1.051220 -rc mar25.rc -o mpgen_3000l -p 1 -l 3000

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
!	%f0  = b64e7977 827cf18e 03dbb449 87c60567
!	%f4  = 3bbcf463 c7e84f33 4234295e 29228649
!	%f8  = 651c3250 06909cc7 94491724 412ccb02
!	%f12 = 622881be edd6e5c6 a3716dda 978a5a90
	ldda	[%g1]ASI_BLK_P,%f0
	add	%g1,64,%g1
!	%f16 = 43d85bfd 881552c0 783d37e1 6dd7848f
!	%f20 = 061dd94d 09f86ad9 a8417509 abda6f33
!	%f24 = d5d0d4dc cb2b7647 59926947 a41fde32
!	%f28 = c062cc2e 8f353365 123ad57e 10c1267b
	ldda	[%g1]ASI_BLK_P,%f16
	add	%g1,64,%g1
!	%f32 = f88d1055 36977201 0719f6e2 b3edd8ba
!	%f36 = da121fd2 4b137dda c94065f5 808c2415
!	%f40 = f84e78a8 cc6887d2 cd830b86 494ed595
!	%f44 = efa1995d da4f451d ecf650b1 4b94d956
	ldda	[%g1]ASI_BLK_P,%f32

!	Set up the Graphics Status Register

	setx	0x864678080000007e,%g7,%g1 ! GSR scale = 15, align = 6
	wr	%g1,%g0,%gsr		! GSR = 864678080000007e
	wr	%g0,%y			! Clear Y register
	xorcc	%g0,%g0,%g3		! init %g3 and set flags
	membar	#Sync			! Force the block loads to complete

!	Start of Random Code for processor 0

p0_label_1:
!	Mem[000000001014142c] = e1629794, %l5 = a910899852c00f53
	lduwa	[%i5+0x02c]%asi,%l5	! %l5 = 00000000e1629794
!	Mem[0000000010001400] = b16f6ef8, %l6 = d07f6d980044b265
	lduba	[%i0+%g0]0x80,%l6	! %l6 = 00000000000000b1
!	Mem[0000000010141400] = 7f4e50085791dab5, %l1 = a68acbae127aa947
	ldxa	[%i5+%g0]0x88,%l1	! %l1 = 7f4e50085791dab5
!	Mem[0000000010101410] = 06f6cdb1, %l6 = 00000000000000b1
	ldstuba	[%i4+%o5]0x80,%l6	! %l6 = 00000006000000ff
!	%l2 = 6d4674a6, %l3 = 0af0b676, Mem[0000000010081428] = 6d528d20 3777d298
	stda	%l2,[%i2+0x028]%asi	! Mem[0000000010081428] = 6d4674a6 0af0b676
!	%l3 = 6f99a7840af0b676, Mem[0000000010001408] = ad72456e
	stha	%l3,[%i0+%o4]0x80	! Mem[0000000010001408] = b676456e
!	Mem[0000000010101410] = fff6cdb1 578fe668, %l6 = 00000006, %l7 = 0a670fac
	ldda	[%i4+%o5]0x80,%l6	! %l6 = 00000000fff6cdb1 00000000578fe668
!	Mem[0000000010141408] = 7d9a73ba, %f25 = cb2b7647
	ld	[%i5+%o4],%f25	! %f25 = 7d9a73ba
!	Mem[0000000010141400] = b5da9157, %l4 = 8b876ce63e139bbb
	ldsha	[%i5+%g0]0x80,%l4	! %l4 = ffffffffffffb5da
!	Starting 10 instruction Store Burst
!	%l7 = 00000000578fe668, Mem[00000000100c1400] = 6980daf43fc33381
	stxa	%l7,[%i3+%g0]0x88	! Mem[00000000100c1400] = 00000000578fe668

p0_label_2:
!	%l0 = 8f37d102, %l1 = 5791dab5, Mem[0000000030181408] = 1a9fce35 d21c5fbd
	stda	%l0,[%i6+%o4]0x81	! Mem[0000000030181408] = 8f37d102 5791dab5
!	Mem[0000000030141400] = 63aa31e8, %l5 = 00000000e1629794
	ldstuba	[%i5+%g0]0x81,%l5	! %l5 = 00000063000000ff
!	%f18 = 783d37e1 6dd7848f, Mem[0000000030181410] = 246df1ed d888a0ef
	stda	%f18,[%i6+%o5]0x81	! Mem[0000000030181410] = 783d37e1 6dd7848f
!	%f24 = d5d0d4dc 7d9a73ba, Mem[0000000010081420] = 98f41698 084ccda6
	stda	%f24,[%i2+0x020]%asi	! Mem[0000000010081420] = d5d0d4dc 7d9a73ba
!	%f16 = 43d85bfd 881552c0 783d37e1 6dd7848f
!	%f20 = 061dd94d 09f86ad9 a8417509 abda6f33
!	%f24 = d5d0d4dc 7d9a73ba 59926947 a41fde32
!	%f28 = c062cc2e 8f353365 123ad57e 10c1267b
	stda	%f16,[%i1]ASI_BLK_SL	! Block Store to 0000000030041400
!	Mem[000000001008141c] = a1149a97, %l1 = 7f4e50085791dab5
	swap	[%i2+0x01c],%l1		! %l1 = 00000000a1149a97
!	Mem[0000000010141428] = 96d26ea4, %l0 = 8f37d102, %l3 = 0af0b676
	add	%i5,0x28,%g1
	casa	[%g1]0x80,%l0,%l3	! %l3 = 0000000096d26ea4
!	%l4 = ffffb5da, %l5 = 00000063, Mem[0000000030181400] = 636bdc28 01c3d31a
	stda	%l4,[%i6+%g0]0x89	! Mem[0000000030181400] = ffffb5da 00000063
!	%l1 = 00000000a1149a97, Mem[00000000201c0000] = 8741851d, %asi = 80
	stha	%l1,[%o0+0x000]%asi	! Mem[00000000201c0000] = 9a97851d
!	Starting 10 instruction Load Burst
!	Mem[0000000010181418] = d7b990b5, %l3 = 0000000096d26ea4
	ldsh	[%i6+0x01a],%l3		! %l3 = ffffffffffff90b5

p0_label_3:
!	Mem[00000000100c1428] = 7675aa25 c538ae7b, %l2 = 6d4674a6, %l3 = ffff90b5
	ldd	[%i3+0x028],%l2		! %l2 = 000000007675aa25 00000000c538ae7b
!	Mem[0000000030141408] = 6a5df7d8, %l1 = 00000000a1149a97
	ldsba	[%i5+%o4]0x89,%l1	! %l1 = ffffffffffffffd8
!	Mem[00000000300c1408] = 8f789c95, %l6 = 00000000fff6cdb1
	ldsba	[%i3+%o4]0x81,%l6	! %l6 = ffffffffffffff8f
!	Mem[0000000030141408] = 6a5df7d8, %l0 = fb8d8dca8f37d102
	ldswa	[%i5+%o4]0x89,%l0	! %l0 = 000000006a5df7d8
!	Mem[0000000010141410] = 0fde369b, %f2  = 03dbb449
	lda	[%i5+%o5]0x88,%f2 	! %f2 = 0fde369b
!	Mem[0000000021800040] = 76084289, %l4 = ffffffffffffb5da
	ldub	[%o3+0x041],%l4		! %l4 = 0000000000000008
	membar	#Sync			! Added by membar checker (1)
!	Mem[0000000030041410] = d96af809, %l0 = 000000006a5df7d8
	lduba	[%i1+%o5]0x81,%l0	! %l0 = 00000000000000d9
!	Mem[0000000030181410] = 783d37e1, %l3 = 00000000c538ae7b
	ldsba	[%i6+%o5]0x81,%l3	! %l3 = 0000000000000078
!	Mem[0000000010041430] = 63aae7fa573b7f97, %f4  = 3bbcf463 c7e84f33
	ldd	[%i1+0x030],%f4 	! %f4  = 63aae7fa 573b7f97
!	Starting 10 instruction Store Burst
!	%l2 = 000000007675aa25, Mem[0000000010181405] = 60c5dcdc
	stb	%l2,[%i6+0x005]		! Mem[0000000010181404] = 6025dcdc

p0_label_4:
!	%l5 = 0000000000000063, Mem[00000000100c1412] = d96961ab
	sth	%l5,[%i3+0x012]		! Mem[00000000100c1410] = d9690063
!	Mem[0000000010101400] = edb5bf86, %l6 = ffffffffffffff8f
	swapa	[%i4+%g0]0x80,%l6	! %l6 = 00000000edb5bf86
!	Code Fragment 4
p0_fragment_1:
!	%l0 = 00000000000000d9
	setx	0xfe6f87d038f3aafd,%g7,%l0 ! %l0 = fe6f87d038f3aafd
!	%l1 = ffffffffffffffd8
	setx	0x0cf39d4875f75e8b,%g7,%l1 ! %l1 = 0cf39d4875f75e8b
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = fe6f87d038f3aafd
	setx	0x3280e8a009266b42,%g7,%l0 ! %l0 = 3280e8a009266b42
!	%l1 = 0cf39d4875f75e8b
	setx	0xcab6abf7cda84e27,%g7,%l1 ! %l1 = cab6abf7cda84e27
!	%f0  = b64e7977, Mem[0000000030101410] = 9d260a04
	sta	%f0 ,[%i4+%o5]0x89	! Mem[0000000030101410] = b64e7977
!	%l6 = edb5bf86, %l7 = 578fe668, Mem[0000000010081400] = aab638e2 2db5fa1a
	stda	%l6,[%i2+%g0]0x80	! Mem[0000000010081400] = edb5bf86 578fe668
!	%l5 = 0000000000000063, Mem[0000000030081400] = 1b8f7d46
	stwa	%l5,[%i2+%g0]0x81	! Mem[0000000030081400] = 00000063
!	%l4 = 0000000000000008, Mem[0000000010181424] = 800ab348, %asi = 80
	stwa	%l4,[%i6+0x024]%asi	! Mem[0000000010181424] = 00000008
!	%l7 = 00000000578fe668, Mem[0000000010181408] = bf25fa93
	stwa	%l7,[%i6+%o4]0x88	! Mem[0000000010181408] = 578fe668
!	%l7 = 00000000578fe668, Mem[00000000100c1408] = dfa2a285
	stba	%l7,[%i3+%o4]0x80	! Mem[00000000100c1408] = 68a2a285
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = 68a2a285, %l4 = 0000000000000008
	ldswa	[%i3+%o4]0x80,%l4	! %l4 = 0000000068a2a285

p0_label_5:
!	Mem[0000000010101400] = 8fffffff, %l6 = 00000000edb5bf86
	ldswa	[%i4+%g0]0x88,%l6	! %l6 = ffffffff8fffffff
!	Mem[0000000030181410] = e1373d78, %f17 = 881552c0
	lda	[%i6+%o5]0x89,%f17	! %f17 = e1373d78
!	Mem[0000000010041408] = 8d2ba881 63accd66, %l0 = 09266b42, %l1 = cda84e27
	ldda	[%i1+%o4]0x88,%l0	! %l0 = 0000000063accd66 000000008d2ba881
!	Mem[0000000010101410] = fff6cdb1, %f8  = 651c3250
	lda	[%i4+%o5]0x80,%f8 	! %f8 = fff6cdb1
!	Mem[0000000030141408] = 6a5df7d8, %l7 = 00000000578fe668
	lduha	[%i5+%o4]0x89,%l7	! %l7 = 000000000000f7d8
!	Mem[00000000100c1410] = d9690063, %l4 = 0000000068a2a285
	lduwa	[%i3+%o5]0x80,%l4	! %l4 = 00000000d9690063
!	Mem[00000000100c1400] = 578fe668, %f8  = fff6cdb1
	lda	[%i3+%g0]0x88,%f8 	! %f8 = 578fe668
!	Mem[0000000010141404] = 08504e7f, %l6 = ffffffff8fffffff
	lduh	[%i5+0x004],%l6		! %l6 = 0000000000000850
!	Mem[0000000030041410] = d96af809, %f26 = 59926947
	lda	[%i1+%o5]0x81,%f26	! %f26 = d96af809
!	Starting 10 instruction Store Burst
!	%f10 = 94491724 412ccb02, Mem[0000000030141410] = d52c785b e0ec1944
	stda	%f10,[%i5+%o5]0x81	! Mem[0000000030141410] = 94491724 412ccb02

!	Check Point 1 for processor 0

	set	p0_check_pt_data_1,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 0000000063accd66
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 000000008d2ba881
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l3,%g2			! %l3 = 0000000000000078
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l4,%g2			! %l4 = 00000000d9690063
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l5,%g2			! %l5 = 0000000000000063
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l6,%g2			! %l6 = 0000000000000850
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l7,%g2			! %l7 = 000000000000f7d8
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x40],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = b64e7977 827cf18e
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x48],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = 0fde369b 87c60567
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x50],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 63aae7fa 573b7f97
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x58],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 4234295e 29228649
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x60],%g3
	std	%f8,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f8 = 578fe668 06909cc7
	bne	%xcc,p0_freg_check_fail
	mov	0xf08,%g1
	ldx	[%g4+0x68],%g3
	std	%f16,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f16 = 43d85bfd e1373d78
	bne	%xcc,p0_freg_check_fail
	mov	0xf16,%g1
	ldx	[%g4+0x70],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = d5d0d4dc 7d9a73ba
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1
	ldx	[%g4+0x78],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = d96af809 a41fde32
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1

!	Check Point 1 completed


p0_label_6:
!	Mem[0000000010081410] = d14a1e87, %l7 = 000000000000f7d8
	ldstuba	[%i2+%o5]0x80,%l7	! %l7 = 000000d1000000ff
!	%f9  = 06909cc7, Mem[0000000010081400] = edb5bf86
	sta	%f9 ,[%i2+%g0]0x80	! Mem[0000000010081400] = 06909cc7
!	Mem[0000000021800141] = e8d42023, %l5 = 0000000000000063
	ldstub	[%o3+0x141],%l5		! %l5 = 000000d4000000ff
!	%l5 = 00000000000000d4, Mem[0000000010141400] = b5da9157
	stha	%l5,[%i5+%g0]0x80	! Mem[0000000010141400] = 00d49157
!	Mem[0000000030101410] = b64e7977, %l4 = 00000000d9690063
	swapa	[%i4+%o5]0x89,%l4	! %l4 = 00000000b64e7977
!	%l7 = 00000000000000d1, Mem[00000000211c0000] = f62ea37b, %asi = 80
	stha	%l7,[%o2+0x000]%asi	! Mem[00000000211c0000] = 00d1a37b
!	%l4 = 00000000b64e7977, Mem[0000000030041408] = 6dd7848f
	stha	%l4,[%i1+%o4]0x89	! Mem[0000000030041408] = 6dd77977
!	%l0 = 63accd66, %l1 = 8d2ba881, Mem[0000000010081408] = 3dc20db6 a1f079ca
	stda	%l0,[%i2+%o4]0x88	! Mem[0000000010081408] = 63accd66 8d2ba881
!	%l7 = 00000000000000d1, Mem[00000000201c0001] = 9a97851d
	stb	%l7,[%o0+0x001]		! Mem[00000000201c0000] = 9ad1851d
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = 98bc81af 63000000, %l4 = b64e7977, %l5 = 000000d4
	ldda	[%i2+%g0]0x89,%l4	! %l4 = 0000000063000000 0000000098bc81af

p0_label_7:
!	Mem[00000000100c1428] = 7675aa25 c538ae7b, %l0 = 63accd66, %l1 = 8d2ba881
	ldda	[%i3+0x028]%asi,%l0	! %l0 = 000000007675aa25 00000000c538ae7b
!	Mem[0000000030181410] = 8f84d76de1373d78, %l1 = 00000000c538ae7b
	ldxa	[%i6+%o5]0x89,%l1	! %l1 = 8f84d76de1373d78
!	Mem[0000000030181400] = ffffb5da, %l0 = 000000007675aa25
	lduba	[%i6+%g0]0x89,%l0	! %l0 = 00000000000000da
!	Mem[0000000010001400] = b16f6ef879a894ef, %l3 = 0000000000000078
	ldxa	[%i0+0x000]%asi,%l3	! %l3 = b16f6ef879a894ef
!	Mem[0000000010081410] = ff4a1e87, %l0 = 00000000000000da
	lduha	[%i2+%o5]0x80,%l0	! %l0 = 000000000000ff4a
!	Mem[0000000010101434] = ed0f510e, %l6 = 0000000000000850
	ldsba	[%i4+0x036]%asi,%l6	! %l6 = 0000000000000051
!	Mem[0000000030101410] = d9690063, %l2 = 000000007675aa25
	lduwa	[%i4+%o5]0x89,%l2	! %l2 = 00000000d9690063
!	Mem[0000000030141400] = ffaa31e8 50b9a13d, %l6 = 00000051, %l7 = 000000d1
	ldda	[%i5+%g0]0x81,%l6	! %l6 = 00000000ffaa31e8 0000000050b9a13d
!	Mem[0000000010001408] = b676456e, %l4 = 0000000063000000
	ldswa	[%i0+%o4]0x80,%l4	! %l4 = ffffffffb676456e
!	Starting 10 instruction Store Burst
!	%l7 = 0000000050b9a13d, Mem[0000000010141438] = c0179a5b, %asi = 80
	stwa	%l7,[%i5+0x038]%asi	! Mem[0000000010141438] = 50b9a13d

p0_label_8:
!	%l2 = 00000000d9690063, Mem[0000000010001410] = 6150d0b0
	stwa	%l2,[%i0+%o5]0x88	! Mem[0000000010001410] = d9690063
!	Mem[0000000010101408] = 1a0737df, %l5 = 0000000098bc81af
	swap	[%i4+%o4],%l5		! %l5 = 000000001a0737df
!	Mem[00000000218001c1] = b48b6d36, %l3 = b16f6ef879a894ef
	ldstuba	[%o3+0x1c1]%asi,%l3	! %l3 = 0000008b000000ff
!	%l6 = 00000000ffaa31e8, Mem[00000000100c1408] = 85a2a268
	stba	%l6,[%i3+%o4]0x88	! Mem[00000000100c1408] = 85a2a2e8
!	Mem[0000000010181408] = 68e68f57, %l4 = b676456e, %l0 = 0000ff4a
	add	%i6,0x08,%g1
	casa	[%g1]0x80,%l4,%l0	! %l0 = 0000000068e68f57
!	%f0  = b64e7977 827cf18e 0fde369b 87c60567
!	%f4  = 63aae7fa 573b7f97 4234295e 29228649
!	%f8  = 578fe668 06909cc7 94491724 412ccb02
!	%f12 = 622881be edd6e5c6 a3716dda 978a5a90
	stda	%f0,[%i6]ASI_BLK_P	! Block Store to 0000000010181400
!	%l0 = 0000000068e68f57, Mem[0000000010101400] = 8fffffff
	stwa	%l0,[%i4+%g0]0x88	! Mem[0000000010101400] = 68e68f57
!	%l6 = ffaa31e8, %l7 = 50b9a13d, Mem[0000000010081408] = 63accd66 8d2ba881
	stda	%l6,[%i2+%o4]0x88	! Mem[0000000010081408] = ffaa31e8 50b9a13d
	membar	#Sync			! Added by membar checker (2)
!	Mem[0000000010181400] = 77794eb6, %l4 = ffffffffb676456e
	ldstuba	[%i6+%g0]0x88,%l4	! %l4 = 000000b6000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000020800000] = 77609984, %l6 = 00000000ffaa31e8
	lduha	[%o1+0x000]%asi,%l6	! %l6 = 0000000000007760

p0_label_9:
!	Mem[0000000010181400] = ff4e7977, %l3 = 000000000000008b
	ldsba	[%i6+%g0]0x80,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010101400] = 578fe668, %l7 = 0000000050b9a13d
	ldsba	[%i4+%g0]0x80,%l7	! %l7 = 0000000000000057
!	Mem[0000000020800040] = a562b8ec, %l0 = 0000000068e68f57
	lduha	[%o1+0x040]%asi,%l0	! %l0 = 000000000000a562
!	Mem[00000000300c1408] = 959c788f, %l6 = 0000000000007760
	lduba	[%i3+%o4]0x89,%l6	! %l6 = 000000000000008f
!	Mem[0000000030001400] = 74fbd6cf26ac631b, %f2  = 0fde369b 87c60567
	ldda	[%i0+%g0]0x89,%f2 	! %f2  = 74fbd6cf 26ac631b
!	Mem[00000000300c1410] = a278104a, %l2 = 00000000d9690063
	lduwa	[%i3+%o5]0x89,%l2	! %l2 = 00000000a278104a
!	Mem[0000000030041410] = d96af809, %l3 = ffffffffffffffff
	ldswa	[%i1+%o5]0x81,%l3	! %l3 = ffffffffd96af809
!	Mem[00000000100c1408] = e8a2a2857434707e, %l2 = 00000000a278104a
	ldxa	[%i3+%o4]0x80,%l2	! %l2 = e8a2a2857434707e
!	Mem[0000000030081400] = 00000063, %l6 = 000000000000008f
	ldsba	[%i2+%g0]0x81,%l6	! %l6 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l0 = 000000000000a562, Mem[0000000020800041] = a562b8ec
	stb	%l0,[%o1+0x041]		! Mem[0000000020800040] = a562b8ec

p0_label_10:
!	%l6 = 00000000, %l7 = 00000057, Mem[0000000010001408] = 6e4576b6 f3e0459f
	stda	%l6,[%i0+%o4]0x88	! Mem[0000000010001408] = 00000000 00000057
!	%f0  = b64e7977, Mem[00000000300c1400] = 51d67195
	sta	%f0 ,[%i3+%g0]0x89	! Mem[00000000300c1400] = b64e7977
!	%f0  = b64e7977 827cf18e 74fbd6cf 26ac631b
!	%f4  = 63aae7fa 573b7f97 4234295e 29228649
!	%f8  = 578fe668 06909cc7 94491724 412ccb02
!	%f12 = 622881be edd6e5c6 a3716dda 978a5a90
	stda	%f0,[%i3]ASI_BLK_S	! Block Store to 00000000300c1400
!	%l2 = e8a2a2857434707e, Mem[00000000300c1400] = b64e7977
	stha	%l2,[%i3+%g0]0x81	! Mem[00000000300c1400] = 707e7977
!	%l5 = 000000001a0737df, Mem[0000000010181400] = ff4e7977
	stha	%l5,[%i6+%g0]0x80	! Mem[0000000010181400] = 37df7977
!	Mem[0000000030081410] = 4a304c3d, %l4 = 00000000000000b6
	swapa	[%i2+%o5]0x81,%l4	! %l4 = 000000004a304c3d
!	%f28 = c062cc2e 8f353365, Mem[0000000030081400] = 00000063 af81bc98
	stda	%f28,[%i2+%g0]0x81	! Mem[0000000030081400] = c062cc2e 8f353365
!	%f24 = d5d0d4dc 7d9a73ba, Mem[0000000010041400] = fced6a55 cd74a209
	stda	%f24,[%i1+%g0]0x88	! Mem[0000000010041400] = d5d0d4dc 7d9a73ba
!	Mem[0000000010141418] = ce9eb990cb947cb9, %l7 = 0000000000000057, %l5 = 000000001a0737df
	add	%i5,0x18,%g1
	casxa	[%g1]0x80,%l7,%l5	! %l5 = ce9eb990cb947cb9
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (3)
!	Mem[00000000300c1408] = 74fbd6cf, %l4 = 000000004a304c3d
	ldsba	[%i3+%o4]0x81,%l4	! %l4 = 0000000000000074

!	Check Point 2 for processor 0

	set	p0_check_pt_data_2,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 000000000000a562
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 8f84d76de1373d78
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = e8a2a2857434707e
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = ffffffffd96af809
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 0000000000000074
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = ce9eb990cb947cb9
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 0000000000000000
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 0000000000000057
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = b64e7977 827cf18e
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x50],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = 74fbd6cf 26ac631b
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x58],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 63aae7fa 573b7f97
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x60],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 4234295e 29228649
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1

!	Check Point 2 completed


p0_label_11:
!	%l3 = ffffffffd96af809, Mem[0000000010141408] = ba739a7d
	stwa	%l3,[%i5+%o4]0x88	! Mem[0000000010141408] = d96af809
!	Mem[000000001018141c] = 29228649, %l2 = e8a2a2857434707e
	lduha	[%i6+0x01c]%asi,%l2	! %l2 = 0000000000002922
!	Mem[0000000030041400] = 881552c0, %l3 = ffffffffd96af809
	lduwa	[%i1+%g0]0x89,%l3	! %l3 = 00000000881552c0
!	Mem[0000000010101410] = b1cdf6ff, %l5 = ce9eb990cb947cb9
	lduba	[%i4+%o5]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030101400] = f32c2985, %l0 = 000000000000a562
	ldsba	[%i4+%g0]0x89,%l0	! %l0 = ffffffffffffff85
!	Mem[0000000010101408] = af81bc98, %l5 = 00000000000000ff
	lduwa	[%i4+%o4]0x88,%l5	! %l5 = 00000000af81bc98
!	Mem[00000000100c1408] = 7e70347485a2a2e8, %f6  = 4234295e 29228649
	ldda	[%i3+%o4]0x88,%f6 	! %f6  = 7e703474 85a2a2e8
!	Mem[0000000030001410] = d102b5cd, %l3 = 00000000881552c0
	ldswa	[%i0+%o5]0x89,%l3	! %l3 = ffffffffd102b5cd
!	Mem[0000000030141400] = ffaa31e8 50b9a13d d8f75d6a 5ba08a59
!	Mem[0000000030141410] = 94491724 412ccb02 3b1ed75a 1b41e871
!	Mem[0000000030141420] = 2723af57 bac23955 f2e25d08 99c1993d
!	Mem[0000000030141430] = 93ab8046 52e548c3 7403c892 43ca1dd3
	ldda	[%i5]ASI_BLK_AIUSL,%f0	! Block Load from 0000000030141400
!	Starting 10 instruction Store Burst
!	Mem[0000000010001410] = 630069d9, %l1 = 8f84d76de1373d78
	swapa	[%i0+%o5]0x80,%l1	! %l1 = 00000000630069d9

p0_label_12:
!	%l1 = 00000000630069d9, Mem[0000000030041408] = 7779d76de1373d78
	stxa	%l1,[%i1+%o4]0x81	! Mem[0000000030041408] = 00000000630069d9
!	Mem[0000000010001410] = e1373d78, %l0 = ffffffffffffff85
	swapa	[%i0+%o5]0x80,%l0	! %l0 = 00000000e1373d78
!	%f26 = d96af809 a41fde32, Mem[0000000030081408] = 824eb49c 2ed892ea
	stda	%f26,[%i2+%o4]0x81	! Mem[0000000030081408] = d96af809 a41fde32
!	%l6 = 0000000000000000, Mem[0000000030041400] = c0521588
	stba	%l6,[%i1+%g0]0x81	! Mem[0000000030041400] = 00521588
!	Mem[0000000030101408] = b448236d, %l3 = ffffffffd102b5cd
	swapa	[%i4+%o4]0x89,%l3	! %l3 = 00000000b448236d
!	%f22 = a8417509 abda6f33, Mem[0000000010081408] = e831aaff 3da1b950
	stda	%f22,[%i2+%o4]0x80	! Mem[0000000010081408] = a8417509 abda6f33
!	%l0 = 00000000e1373d78, Mem[00000000201c0000] = 9ad1851d
	sth	%l0,[%o0+%g0]		! Mem[00000000201c0000] = 3d78851d
!	Mem[0000000010181408] = 9b36de0f, %l4 = 0000000000000074
	swapa	[%i6+%o4]0x88,%l4	! %l4 = 000000009b36de0f
!	Mem[0000000030141408] = 6a5df7d8, %l0 = 00000000e1373d78
	swapa	[%i5+%o4]0x89,%l0	! %l0 = 000000006a5df7d8
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = 8f37d102, %l7 = 0000000000000057
	ldsha	[%i6+%o4]0x81,%l7	! %l7 = ffffffffffff8f37

p0_label_13:
!	Mem[0000000010101410] = 68e68f57b1cdf6ff, %l5 = 00000000af81bc98
	ldxa	[%i4+%o5]0x88,%l5	! %l5 = 68e68f57b1cdf6ff
!	Mem[0000000010101408] = 98bc81af, %f19 = 6dd7848f
	lda	[%i4+%o4]0x80,%f19	! %f19 = 98bc81af
!	Mem[0000000030041408] = 00000000, %l1 = 00000000630069d9
	ldsba	[%i1+%o4]0x89,%l1	! %l1 = 0000000000000000
!	Mem[00000000100c1410] = d9690063, %l0 = 000000006a5df7d8
	lduha	[%i3+0x010]%asi,%l0	! %l0 = 000000000000d969
!	Mem[0000000020800000] = 77609984, %l0 = 000000000000d969
	lduh	[%o1+%g0],%l0		! %l0 = 0000000000007760
!	Mem[0000000010141410] = 9b36de0f, %l3 = 00000000b448236d
	ldub	[%i5+%o5],%l3		! %l3 = 000000000000009b
!	Mem[000000001004140c] = 81a82b8d, %l4 = 000000009b36de0f
	ldsha	[%i1+0x00c]%asi,%l4	! %l4 = ffffffffffff81a8
!	Mem[00000000100c1400] = 68e68f57, %f30 = 123ad57e
	lda	[%i3+%g0]0x80,%f30	! %f30 = 68e68f57
!	Mem[0000000030041408] = 00000000, %l5 = 68e68f57b1cdf6ff
	lduwa	[%i1+%o4]0x89,%l5	! %l5 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030101408] = cdb502d1, %l5 = 0000000000000000
	swapa	[%i4+%o4]0x81,%l5	! %l5 = 00000000cdb502d1

p0_label_14:
!	%f18 = 783d37e1 98bc81af, %l7 = ffffffffffff8f37
!	Mem[00000000300c1428] = 94491724412ccb02
	add	%i3,0x028,%g1
	stda	%f18,[%g1+%l7]ASI_PST8_SL ! Mem[00000000300c1428] = af81bc24e137cb02
!	%l0 = 00007760, %l1 = 00000000, Mem[0000000010081400] = c79c9006 68e68f57
	stda	%l0,[%i2+%g0]0x88	! Mem[0000000010081400] = 00007760 00000000
	membar	#Sync			! Added by membar checker (4)
!	%l1 = 0000000000000000, Mem[0000000030141400] = 3da1b950e831aaff
	stxa	%l1,[%i5+%g0]0x89	! Mem[0000000030141400] = 0000000000000000
!	%f4  = 02cb2c41 24174994, Mem[0000000010001418] = fd32bd42 55e8b731
	stda	%f4 ,[%i0+0x018]%asi	! Mem[0000000010001418] = 02cb2c41 24174994
!	%l6 = 0000000000000000, Mem[0000000030081400] = c062cc2e
	stwa	%l6,[%i2+%g0]0x81	! Mem[0000000030081400] = 00000000
!	Mem[0000000030041408] = 00000000, %l5 = 00000000cdb502d1
	ldstuba	[%i1+%o4]0x89,%l5	! %l5 = 00000000000000ff
!	%f16 = 43d85bfd e1373d78 783d37e1 98bc81af
!	%f20 = 061dd94d 09f86ad9 a8417509 abda6f33
!	%f24 = d5d0d4dc 7d9a73ba d96af809 a41fde32
!	%f28 = c062cc2e 8f353365 68e68f57 10c1267b
	stda	%f16,[%i1]ASI_BLK_AIUS	! Block Store to 0000000030041400
!	%l6 = 0000000000000000, Mem[0000000010101408] = 98bc81af
	stha	%l6,[%i4+%o4]0x80	! Mem[0000000010101408] = 000081af
!	%l0 = 0000000000007760, Mem[0000000020800040] = a562b8ec
	sth	%l0,[%o1+0x040]		! Mem[0000000020800040] = 7760b8ec
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = cdb502d1a3bf2890, %f0  = 3da1b950 e831aaff
	ldda	[%i0+%o5]0x81,%f0 	! %f0  = cdb502d1 a3bf2890

p0_label_15:
!	Mem[0000000030181408] = 02d1378f, %l7 = ffffffffffff8f37
	lduba	[%i6+%o4]0x89,%l7	! %l7 = 000000000000008f
!	Mem[0000000010081408] = a8417509, %l1 = 0000000000000000
	ldsha	[%i2+%o4]0x80,%l1	! %l1 = ffffffffffffa841
!	Mem[0000000010101410] = 68e68f57b1cdf6ff, %f14 = d31dca43 92c80374
	ldda	[%i4+%o5]0x88,%f14	! %f14 = 68e68f57 b1cdf6ff
!	Mem[0000000010101410] = fff6cdb1, %f13 = 4680ab93
	lda	[%i4+%o5]0x80,%f13	! %f13 = fff6cdb1
!	Mem[0000000030081400] = 6533358f 00000000, %l4 = ffff81a8, %l5 = 00000000
	ldda	[%i2+%g0]0x89,%l4	! %l4 = 0000000000000000 000000006533358f
!	Mem[0000000010001408] = 00000000, %l3 = 000000000000009b
	ldsba	[%i0+%o4]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000010001404] = 79a894ef, %l6 = 0000000000000000
	ldsw	[%i0+0x004],%l6		! %l6 = 0000000079a894ef
!	Mem[0000000010101410] = fff6cdb1 578fe668, %l4 = 00000000, %l5 = 6533358f
	ldda	[%i4+%o5]0x80,%l4	! %l4 = 00000000fff6cdb1 00000000578fe668
!	Mem[00000000201c0000] = 3d78851d, %l0 = 0000000000007760
	ldsha	[%o0+0x000]%asi,%l0	! %l0 = 0000000000003d78
!	Starting 10 instruction Store Burst
!	%l2 = 0000000000002922, Mem[0000000030041400] = fd5bd843
	stwa	%l2,[%i1+%g0]0x89	! Mem[0000000030041400] = 00002922

!	Check Point 3 for processor 0

	set	p0_check_pt_data_3,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 0000000000003d78
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = ffffffffffffa841
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 0000000000002922
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 0000000000000000
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 00000000fff6cdb1
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 00000000578fe668
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 0000000079a894ef
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 000000000000008f
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = cdb502d1 a3bf2890
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x50],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = 598aa05b 6a5df7d8
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x58],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 02cb2c41 24174994
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x60],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 71e8411b 5ad71e3b
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x68],%g3
	std	%f8,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f8 = 5539c2ba 57af2327
	bne	%xcc,p0_freg_check_fail
	mov	0xf08,%g1
	ldx	[%g4+0x70],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = 3d99c199 085de2f2
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x78],%g3
	std	%f12,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f12 = c348e552 fff6cdb1
	bne	%xcc,p0_freg_check_fail
	mov	0xf12,%g1
	ldx	[%g4+0x80],%g3
	std	%f14,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f14 = 68e68f57 b1cdf6ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf14,%g1
	ldx	[%g4+0x88],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = 783d37e1 98bc81af
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1
	ldx	[%g4+0x90],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = 68e68f57 10c1267b
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 3 completed


p0_label_16:
!	%f20 = 061dd94d 09f86ad9, %l2 = 0000000000002922
!	Mem[00000000100c1430] = bfe8895683046f12
	add	%i3,0x030,%g1
	stda	%f20,[%g1+%l2]ASI_PST8_PL ! Mem[00000000100c1430] = bf6a895683d96f12
!	%f0  = cdb502d1 a3bf2890, Mem[0000000010041430] = 63aae7fa 573b7f97
	std	%f0 ,[%i1+0x030]	! Mem[0000000010041430] = cdb502d1 a3bf2890
!	Mem[00000000300c1408] = 74fbd6cf, %l0 = 0000000000003d78
	swapa	[%i3+%o4]0x81,%l0	! %l0 = 0000000074fbd6cf
!	%l3 = 0000000000000000, Mem[0000000010081410] = ff4a1e87
	stwa	%l3,[%i2+%o5]0x80	! Mem[0000000010081410] = 00000000
!	%l6 = 79a894ef, %l7 = 0000008f, Mem[0000000010181418] = 4234295e 29228649
	std	%l6,[%i6+0x018]		! Mem[0000000010181418] = 79a894ef 0000008f
!	%f17 = e1373d78, Mem[0000000010181428] = 94491724
	st	%f17,[%i6+0x028]	! Mem[0000000010181428] = e1373d78
!	%f14 = 68e68f57 b1cdf6ff, %l0 = 0000000074fbd6cf
!	Mem[0000000030041418] = a8417509abda6f33
	add	%i1,0x018,%g1
	stda	%f14,[%g1+%l0]ASI_PST32_S ! Mem[0000000030041418] = 68e68f57b1cdf6ff
!	Mem[0000000010101410] = fff6cdb1, %l2 = 0000000000002922
	ldstuba	[%i4+%o5]0x80,%l2	! %l2 = 000000ff000000ff
!	%l0 = 0000000074fbd6cf, Mem[00000000218001c0] = b4ff6d36
	sth	%l0,[%o3+0x1c0]		! Mem[00000000218001c0] = d6cf6d36
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = 3d78851d, %l1 = ffffffffffffa841
	ldsb	[%o0+0x001],%l1		! %l1 = 0000000000000078

p0_label_17:
!	Mem[00000000100c1420] = 02ef1a8bd0a70dbd, %f30 = 68e68f57 10c1267b
	ldda	[%i3+0x020]%asi,%f30	! %f30 = 02ef1a8b d0a70dbd
!	Mem[0000000030081410] = 000000b6, %l1 = 0000000000000078
	ldsha	[%i2+%o5]0x81,%l1	! %l1 = 0000000000000000
!	Mem[00000000300c1400] = 707e7977, %l5 = 00000000578fe668
	lduha	[%i3+%g0]0x81,%l5	! %l5 = 000000000000707e
!	Mem[0000000030001410] = cdb502d1 a3bf2890, %l4 = fff6cdb1, %l5 = 0000707e
	ldda	[%i0+%o5]0x81,%l4	! %l4 = 00000000cdb502d1 00000000a3bf2890
	membar	#Sync			! Added by membar checker (5)
!	Mem[0000000010041400] = 7d9a73ba, %l1 = 0000000000000000
	swapa	[%i1+%g0]0x88,%l1	! %l1 = 000000007d9a73ba
!	Mem[000000001008140c] = abda6f33, %l7 = 000000000000008f
	ldsh	[%i2+0x00e],%l7		! %l7 = 0000000000006f33
!	Mem[00000000211c0000] = 00d1a37b, %l1 = 000000007d9a73ba
	lduh	[%o2+%g0],%l1		! %l1 = 00000000000000d1
!	Mem[0000000010101400] = 578fe668, %l1 = 00000000000000d1
	lduwa	[%i4+%g0]0x80,%l1	! %l1 = 00000000578fe668
!	Mem[0000000010141400] = 00d49157 08504e7f, %l4 = cdb502d1, %l5 = a3bf2890
	ldda	[%i5+%g0]0x80,%l4	! %l4 = 0000000000d49157 0000000008504e7f
!	Starting 10 instruction Store Burst
!	%l0 = 0000000074fbd6cf, Mem[0000000030041400] = 22290000
	stha	%l0,[%i1+%g0]0x81	! Mem[0000000030041400] = d6cf0000

p0_label_18:
!	%l5 = 0000000008504e7f, Mem[0000000010101400] = 68e68f57
	stha	%l5,[%i4+%g0]0x88	! Mem[0000000010101400] = 68e64e7f
!	%f20 = 061dd94d, Mem[0000000030081410] = 000000b6
	sta	%f20,[%i2+%o5]0x81	! Mem[0000000030081410] = 061dd94d
!	%l2 = 00000000000000ff, Mem[0000000030001408] = 0886e0b7
	stba	%l2,[%i0+%o4]0x89	! Mem[0000000030001408] = 0886e0ff
!	%f5  = 24174994, Mem[0000000030181410] = e1373d78
	sta	%f5 ,[%i6+%o5]0x89	! Mem[0000000030181410] = 24174994
!	%l6 = 0000000079a894ef, Mem[0000000030141400] = 00000000
	stha	%l6,[%i5+%g0]0x89	! Mem[0000000030141400] = 000094ef
!	Mem[0000000030141410] = 24174994, %l6 = 0000000079a894ef
	ldstuba	[%i5+%o5]0x89,%l6	! %l6 = 00000094000000ff
!	Mem[0000000030041408] = 783d37e1, %l4 = 0000000000d49157
	swapa	[%i1+%o4]0x81,%l4	! %l4 = 00000000783d37e1
!	%l3 = 0000000000000000, Mem[0000000021800140] = e8ff2023, %asi = 80
	stha	%l3,[%o3+0x140]%asi	! Mem[0000000021800140] = 00002023
!	Mem[0000000010101410] = fff6cdb1, %l5 = 0000000008504e7f
	swapa	[%i4+%o5]0x80,%l5	! %l5 = 00000000fff6cdb1
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = 00000000, %l5 = 00000000fff6cdb1
	ldsba	[%i1+%g0]0x80,%l5	! %l5 = 0000000000000000

p0_label_19:
!	Mem[0000000030181408] = b5da9157 02d1378f, %l4 = 783d37e1, %l5 = 00000000
	ldda	[%i6+%o4]0x89,%l4	! %l4 = 0000000002d1378f 00000000b5da9157
!	Mem[0000000010041410] = 7d2ce6d9, %l7 = 0000000000006f33
	ldswa	[%i1+%o5]0x80,%l7	! %l7 = 000000007d2ce6d9
!	Mem[00000000300c1400] = 77797e70, %l3 = 0000000000000000
	ldsha	[%i3+%g0]0x89,%l3	! %l3 = 0000000000007e70
!	Mem[0000000010101408] = fc7325aaaf810000, %l7 = 000000007d2ce6d9
	ldxa	[%i4+%o4]0x88,%l7	! %l7 = fc7325aaaf810000
!	Mem[0000000010081408] = a8417509abda6f33, %l6 = 0000000000000094
	ldxa	[%i2+%o4]0x80,%l6	! %l6 = a8417509abda6f33
!	Mem[00000000100c1408] = 7e703474 85a2a2e8, %l2 = 000000ff, %l3 = 00007e70
	ldda	[%i3+%o4]0x88,%l2	! %l2 = 0000000085a2a2e8 000000007e703474
!	Mem[0000000030101410] = d9690063, %l5 = 00000000b5da9157
	lduwa	[%i4+%o5]0x89,%l5	! %l5 = 00000000d9690063
!	Mem[0000000010041410] = a8490643d9e62c7d, %f30 = 02ef1a8b d0a70dbd
	ldda	[%i1+%o5]0x88,%f30	! %f30 = a8490643 d9e62c7d
!	Mem[0000000030141410] = 241749ff, %l1 = 00000000578fe668
	lduwa	[%i5+%o5]0x89,%l1	! %l1 = 00000000241749ff
!	Starting 10 instruction Store Burst
!	Mem[0000000010041400] = 00000000, %l1 = 00000000241749ff
	ldstuba	[%i1+%g0]0x88,%l1	! %l1 = 00000000000000ff

p0_label_20:
!	Mem[0000000030041410] = 061dd94d, %l6 = a8417509abda6f33
	ldstuba	[%i1+%o5]0x81,%l6	! %l6 = 00000006000000ff
!	%f20 = 061dd94d 09f86ad9, %l5 = 00000000d9690063
!	Mem[0000000030181420] = 25e7a6d9948a6312
	add	%i6,0x020,%g1
	stda	%f20,[%g1+%l5]ASI_PST16_SL ! Mem[0000000030181420] = d96af809948a6312
!	Mem[0000000010141408] = 09f86ad9d172c211, %l3 = 000000007e703474, %l6 = 0000000000000006
	add	%i5,0x08,%g1
	casxa	[%g1]0x80,%l3,%l6	! %l6 = 09f86ad9d172c211
!	Mem[0000000030181408] = 8f37d102, %l2 = 0000000085a2a2e8
	ldstuba	[%i6+%o4]0x81,%l2	! %l2 = 0000008f000000ff
!	%l1 = 0000000000000000, Mem[0000000010181408] = 7400000087c60567
	stxa	%l1,[%i6+%o4]0x80	! Mem[0000000010181408] = 0000000000000000
!	%l4 = 02d1378f, %l5 = d9690063, Mem[0000000030141408] = e1373d78 598aa05b
	stda	%l4,[%i5+%o4]0x89	! Mem[0000000030141408] = 02d1378f d9690063
!	%l6 = 09f86ad9d172c211, Mem[00000000100c1400] = 00000000578fe668
	stxa	%l6,[%i3+%g0]0x88	! Mem[00000000100c1400] = 09f86ad9d172c211
!	Mem[0000000030041410] = 4dd91dff, %l1 = 0000000000000000
	swapa	[%i1+%o5]0x89,%l1	! %l1 = 000000004dd91dff
!	%l7 = fc7325aaaf810000, Mem[0000000010101408] = 000081af
	stba	%l7,[%i4+%o4]0x80	! Mem[0000000010101408] = 000081af
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = 00003d78, %l3 = 000000007e703474
	ldsha	[%i3+%o4]0x81,%l3	! %l3 = 0000000000000000

!	Check Point 4 for processor 0

	set	p0_check_pt_data_4,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l1,%g2			! %l1 = 000000004dd91dff
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l2,%g2			! %l2 = 000000000000008f
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l3,%g2			! %l3 = 0000000000000000
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l5,%g2			! %l5 = 00000000d9690063
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l6,%g2			! %l6 = 09f86ad9d172c211
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l7,%g2			! %l7 = fc7325aaaf810000
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x38],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = 598aa05b 6a5df7d8
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x40],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 02cb2c41 24174994
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x48],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = a8490643 d9e62c7d
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 4 completed


p0_label_21:
!	Mem[0000000010181400] = 8ef17c827779df37, %f6  = 71e8411b 5ad71e3b
	ldda	[%i6+%g0]0x88,%f6 	! %f6  = 8ef17c82 7779df37
!	Mem[00000000201c0000] = 3d78851d, %l5 = 00000000d9690063
	ldsb	[%o0+%g0],%l5		! %l5 = 000000000000003d
!	Mem[0000000030041410] = 00000000, %l4 = 0000000002d1378f
	ldsba	[%i1+%o5]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000030141400] = 000094ef, %l0 = 0000000074fbd6cf
	lduba	[%i5+%g0]0x89,%l0	! %l0 = 00000000000000ef
!	Mem[0000000010001418] = 02cb2c41, %l4 = 0000000000000000
	ldsb	[%i0+0x01a],%l4		! %l4 = 000000000000002c
!	Mem[0000000010081430] = 363f9a35 27f66a3d, %l2 = 0000008f, %l3 = 00000000
	ldd	[%i2+0x030],%l2		! %l2 = 00000000363f9a35 0000000027f66a3d
!	Mem[0000000030141400] = 000094ef, %l6 = 09f86ad9d172c211
	ldsba	[%i5+%g0]0x89,%l6	! %l6 = ffffffffffffffef
!	Mem[0000000010181400] = 37df7977, %l7 = fc7325aaaf810000
	lduha	[%i6+%g0]0x80,%l7	! %l7 = 00000000000037df
!	Mem[00000000100c1408] = e8a2a285, %l5 = 000000000000003d
	lduha	[%i3+%o4]0x80,%l5	! %l5 = 000000000000e8a2
!	Starting 10 instruction Store Burst
!	%f30 = a8490643 d9e62c7d, %l6 = ffffffffffffffef
!	Mem[0000000010041438] = 6f14dc5dcb724ea5
	add	%i1,0x038,%g1
	stda	%f30,[%g1+%l6]ASI_PST16_P ! Mem[0000000010041438] = a8490643d9e62c7d

p0_label_22:
!	Mem[0000000030181410] = 94491724, %l1 = 000000004dd91dff
	swapa	[%i6+%o5]0x81,%l1	! %l1 = 0000000094491724
!	%f3  = 6a5df7d8, Mem[0000000010181410] = fae7aa63
	sta	%f3 ,[%i6+%o5]0x88	! Mem[0000000010181410] = 6a5df7d8
!	%f20 = 061dd94d 09f86ad9, %l7 = 00000000000037df
!	Mem[0000000030041420] = d5d0d4dc7d9a73ba
	add	%i1,0x020,%g1
	stda	%f20,[%g1+%l7]ASI_PST8_S ! Mem[0000000030041420] = 061dd44d09f86ad9
!	%l3 = 0000000027f66a3d, Mem[0000000010081400] = 60770000
	stba	%l3,[%i2+%g0]0x80	! Mem[0000000010081400] = 3d770000
!	Mem[0000000010041424] = 1063cb77, %l4 = 000000000000002c
	swap	[%i1+0x024],%l4		! %l4 = 000000001063cb77
!	%l5 = 000000000000e8a2, Mem[00000000300c1410] = fae7aa63
	stwa	%l5,[%i3+%o5]0x89	! Mem[00000000300c1410] = 0000e8a2
!	%l0 = 00000000000000ef, Mem[0000000010001410] = 85ffffff
	stha	%l0,[%i0+%o5]0x88	! Mem[0000000010001410] = 85ff00ef
!	%l1 = 0000000094491724, Mem[0000000030001408] = ffe08608732daac3
	stxa	%l1,[%i0+%o4]0x81	! Mem[0000000030001408] = 0000000094491724
!	%l4 = 000000001063cb77, Mem[0000000010041410] = 7d2ce6d9
	stwa	%l4,[%i1+%o5]0x80	! Mem[0000000010041410] = 1063cb77
!	Starting 10 instruction Load Burst
!	Mem[0000000010141428] = 96d26ea4e1629794, %l7 = 00000000000037df
	ldx	[%i5+0x028],%l7		! %l7 = 96d26ea4e1629794

p0_label_23:
!	Mem[00000000100c1410] = 630069d9, %l3 = 0000000027f66a3d
	lduha	[%i3+%o5]0x88,%l3	! %l3 = 00000000000069d9
!	Mem[0000000010141408] = 09f86ad9, %l4 = 000000001063cb77
	lduba	[%i5+%o4]0x80,%l4	! %l4 = 0000000000000009
!	Mem[0000000030101410] = d9690063, %l2 = 00000000363f9a35
	lduba	[%i4+%o5]0x89,%l2	! %l2 = 0000000000000063
!	Mem[0000000010041424] = 0000002c, %l4 = 0000000000000009
	ldsba	[%i1+0x024]%asi,%l4	! %l4 = 0000000000000000
!	Mem[0000000030141400] = ef94000000000000, %f24 = d5d0d4dc 7d9a73ba
	ldda	[%i5+%g0]0x81,%f24	! %f24 = ef940000 00000000
!	Mem[00000000100c1400] = d172c211, %l2 = 0000000000000063
	lduha	[%i3+%g0]0x88,%l2	! %l2 = 000000000000c211
!	Mem[0000000010041400] = d5d0d4dc000000ff, %l4 = 0000000000000000
	ldxa	[%i1+%g0]0x88,%l4	! %l4 = d5d0d4dc000000ff
!	Mem[0000000010001400] = f86e6fb1, %l6 = ffffffffffffffef
	lduha	[%i0+%g0]0x88,%l6	! %l6 = 0000000000006fb1
!	Mem[0000000030141410] = 241749ff, %l0 = 00000000000000ef
	ldsba	[%i5+%o5]0x89,%l0	! %l0 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l4 = 000000ff, %l5 = 0000e8a2, Mem[0000000030041410] = 00000000 d96af809
	stda	%l4,[%i1+%o5]0x89	! Mem[0000000030041410] = 000000ff 0000e8a2

p0_label_24:
!	Mem[0000000010181410] = 6a5df7d8, %l0 = ffffffffffffffff
	swapa	[%i6+%o5]0x88,%l0	! %l0 = 000000006a5df7d8
!	Mem[00000000100c142d] = c538ae7b, %l7 = 96d26ea4e1629794
	ldstuba	[%i3+0x02d]%asi,%l7	! %l7 = 00000038000000ff
!	Mem[0000000030181410] = 4dd91dff, %l5 = 000000000000e8a2
	ldstuba	[%i6+%o5]0x81,%l5	! %l5 = 0000004d000000ff
!	%l6 = 00006fb1, %l7 = 00000038, Mem[0000000010001408] = 00000000 57000000
	stda	%l6,[%i0+%o4]0x80	! Mem[0000000010001408] = 00006fb1 00000038
!	Mem[0000000010081410] = 00000000, %l0 = 000000006a5df7d8
	swapa	[%i2+%o5]0x80,%l0	! %l0 = 0000000000000000
!	%l2 = 0000c211, %l3 = 000069d9, Mem[0000000010081400] = 3d770000 00000000
	stda	%l2,[%i2+%g0]0x80	! Mem[0000000010081400] = 0000c211 000069d9
!	Mem[0000000021800041] = 76084289, %l2 = 000000000000c211
	ldstuba	[%o3+0x041]%asi,%l2	! %l2 = 00000008000000ff
!	Mem[0000000010081408] = a8417509, %l4 = d5d0d4dc000000ff
	ldstuba	[%i2+%o4]0x80,%l4	! %l4 = 000000a8000000ff
!	%l7 = 0000000000000038, Mem[0000000010101408] = 000081af
	stba	%l7,[%i4+%o4]0x80	! Mem[0000000010101408] = 380081af
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1438] = 3581cb85, %f9  = 57af2327
	ld	[%i3+0x038],%f9 	! %f9 = 3581cb85

p0_label_25:
!	Mem[00000000211c0000] = 00d1a37b, %l4 = 00000000000000a8
	lduba	[%o2+0x000]%asi,%l4	! %l4 = 0000000000000000
!	Mem[0000000030081400] = 00000000, %l6 = 0000000000006fb1
	ldsba	[%i2+%g0]0x81,%l6	! %l6 = 0000000000000000
!	Mem[00000000201c0000] = 3d78851d, %l7 = 0000000000000038
	lduh	[%o0+%g0],%l7		! %l7 = 0000000000003d78
!	Mem[00000000100c1410] = d9690063, %f27 = a41fde32
	lda	[%i3+%o5]0x80,%f27	! %f27 = d9690063
!	Mem[0000000010181408] = 00000000, %l3 = 00000000000069d9
	lduwa	[%i6+%o4]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000010081400] = 0000c211000069d9, %f2  = 598aa05b 6a5df7d8
	ldda	[%i2+%g0]0x80,%f2 	! %f2  = 0000c211 000069d9
!	Mem[00000000100c1400] = d172c211, %l7 = 0000000000003d78
	lduba	[%i3+%g0]0x88,%l7	! %l7 = 0000000000000011
!	Mem[0000000030081410] = 4dd91d06, %l0 = 0000000000000000
	lduwa	[%i2+%o5]0x89,%l0	! %l0 = 000000004dd91d06
!	Mem[0000000010181400] = 7779df37, %l4 = 0000000000000000
	lduha	[%i6+%g0]0x88,%l4	! %l4 = 000000000000df37
!	Starting 10 instruction Store Burst
!	Code Fragment 4
p0_fragment_2:
!	%l0 = 000000004dd91d06
	setx	0xdd39a7e83cd9d1aa,%g7,%l0 ! %l0 = dd39a7e83cd9d1aa
!	%l1 = 0000000094491724
	setx	0x741e0648162c97bc,%g7,%l1 ! %l1 = 741e0648162c97bc
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = dd39a7e83cd9d1aa
	setx	0xdbae39bfe2b9cac1,%g7,%l0 ! %l0 = dbae39bfe2b9cac1
!	%l1 = 741e0648162c97bc
	setx	0x3428d2779971df90,%g7,%l1 ! %l1 = 3428d2779971df90

!	Check Point 5 for processor 0

	set	p0_check_pt_data_5,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = dbae39bfe2b9cac1
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 3428d2779971df90
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 0000000000000008
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 0000000000000000
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 000000000000df37
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 000000000000004d
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 0000000000000000
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 0000000000000011
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = 0000c211 000069d9
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x50],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 8ef17c82 7779df37
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x58],%g3
	std	%f8,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f8 = 5539c2ba 3581cb85
	bne	%xcc,p0_freg_check_fail
	mov	0xf08,%g1
	ldx	[%g4+0x60],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = ef940000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1
	ldx	[%g4+0x68],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = d96af809 d9690063
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1

!	Check Point 5 completed


p0_label_26:
!	Mem[0000000010181423] = 578fe668, %l1 = 3428d2779971df90
	ldstub	[%i6+0x023],%l1		! %l1 = 00000068000000ff
!	Mem[0000000030081400] = 00000000, %l2 = 0000000000000008
	ldstuba	[%i2+%g0]0x89,%l2	! %l2 = 00000000000000ff
!	%l6 = 0000000000000000, Mem[0000000010141408] = 09f86ad9
	stba	%l6,[%i5+%o4]0x80	! Mem[0000000010141408] = 00f86ad9
!	%l0 = dbae39bfe2b9cac1, Mem[0000000030181400] = 00000063ffffb5da
	stxa	%l0,[%i6+%g0]0x89	! Mem[0000000030181400] = dbae39bfe2b9cac1
!	%l6 = 0000000000000000, Mem[00000000100c1410] = 5b94f0d3630069d9
	stxa	%l6,[%i3+%o5]0x88	! Mem[00000000100c1410] = 0000000000000000
!	%l4 = 0000df37, %l5 = 0000004d, Mem[0000000010081408] = ff417509 abda6f33
	stda	%l4,[%i2+%o4]0x80	! Mem[0000000010081408] = 0000df37 0000004d
!	%l4 = 000000000000df37, Mem[0000000010001410] = 85ff00ef
	stha	%l4,[%i0+%o5]0x88	! Mem[0000000010001410] = 85ffdf37
!	%l0 = dbae39bfe2b9cac1, Mem[0000000010101400] = 68e64e7f
	stha	%l0,[%i4+%g0]0x88	! Mem[0000000010101400] = 68e6cac1
!	%l1 = 0000000000000068, Mem[0000000030001400] = 1b63ac26
	stha	%l1,[%i0+%g0]0x81	! Mem[0000000030001400] = 0068ac26
!	Starting 10 instruction Load Burst
!	Mem[0000000030081410] = 061dd94d, %l1 = 0000000000000068
	ldsha	[%i2+%o5]0x81,%l1	! %l1 = 000000000000061d

p0_label_27:
!	Mem[0000000030181410] = 8f84d76dff1dd9ff, %f6  = 8ef17c82 7779df37
	ldda	[%i6+%o5]0x89,%f6 	! %f6  = 8f84d76d ff1dd9ff
!	Mem[0000000010141408] = d96af800, %l7 = 0000000000000011
	ldswa	[%i5+%o4]0x88,%l7	! %l7 = ffffffffd96af800
!	Mem[0000000030181410] = 8f84d76d ff1dd9ff, %l4 = 0000df37, %l5 = 0000004d
	ldda	[%i6+%o5]0x89,%l4	! %l4 = 00000000ff1dd9ff 000000008f84d76d
!	Mem[0000000030001410] = d102b5cd, %l4 = 00000000ff1dd9ff
	ldsha	[%i0+%o5]0x89,%l4	! %l4 = ffffffffffffb5cd
!	Mem[00000000211c0000] = 00d1a37b, %l5 = 000000008f84d76d
	lduba	[%o2+0x000]%asi,%l5	! %l5 = 0000000000000000
!	Mem[0000000030041400] = d6cf0000 e1373d78, %l2 = 00000000, %l3 = 00000000
	ldda	[%i1+%g0]0x81,%l2	! %l2 = 00000000d6cf0000 00000000e1373d78
!	Mem[00000000100c1408] = 85a2a2e8, %l0 = dbae39bfe2b9cac1
	lduha	[%i3+%o4]0x88,%l0	! %l0 = 000000000000a2e8
!	Mem[0000000030141408] = 02d1378f, %l2 = 00000000d6cf0000
	ldsha	[%i5+%o4]0x89,%l2	! %l2 = 000000000000378f
!	Mem[0000000010001408] = 38000000b16f0000, %f20 = 061dd94d 09f86ad9
	ldda	[%i0+%o4]0x88,%f20	! %f20 = 38000000 b16f0000
!	Starting 10 instruction Store Burst
!	Mem[0000000010001408] = b16f0000, %l7 = ffffffffd96af800
	swapa	[%i0+%o4]0x88,%l7	! %l7 = 00000000b16f0000

p0_label_28:
!	%l7 = 00000000b16f0000, Mem[00000000300c1410] = a2e80000573b7f97
	stxa	%l7,[%i3+%o5]0x81	! Mem[00000000300c1410] = 00000000b16f0000
!	%l6 = 0000000000000000, Mem[0000000010101400] = c1cae668
	stha	%l6,[%i4+%g0]0x80	! Mem[0000000010101400] = 0000e668
!	Mem[0000000010181400] = 37df7977, %l3 = 00000000e1373d78
	swapa	[%i6+%g0]0x80,%l3	! %l3 = 0000000037df7977
!	%f24 = ef940000 00000000, Mem[0000000030081408] = 09f86ad9 32de1fa4
	stda	%f24,[%i2+%o4]0x89	! Mem[0000000030081408] = ef940000 00000000
!	%l2 = 000000000000378f, Mem[0000000030001410] = 9028bfa3d102b5cd
	stxa	%l2,[%i0+%o5]0x89	! Mem[0000000030001410] = 000000000000378f
!	Mem[0000000010181438] = a3716dda, %l4 = ffffffffffffb5cd, %asi = 80
	swapa	[%i6+0x038]%asi,%l4	! %l4 = 00000000a3716dda
!	%l3 = 0000000037df7977, Mem[0000000010001408] = 38000000d96af800
	stxa	%l3,[%i0+%o4]0x88	! Mem[0000000010001408] = 0000000037df7977
!	Mem[0000000030041400] = d6cf0000, %l3 = 0000000037df7977
	ldstuba	[%i1+%g0]0x81,%l3	! %l3 = 000000d6000000ff
!	%l1 = 000000000000061d, Mem[0000000010081408] = 0000df37
	stba	%l1,[%i2+%o4]0x80	! Mem[0000000010081408] = 1d00df37
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = 00003d78, %l0 = 000000000000a2e8
	ldswa	[%i3+%o4]0x81,%l0	! %l0 = 0000000000003d78

p0_label_29:
!	Mem[0000000010001408] = 7779df3700000000, %f20 = 38000000 b16f0000
	ldda	[%i0+%o4]0x80,%f20	! %f20 = 7779df37 00000000
!	Mem[0000000030041400] = 0000cfff, %l1 = 000000000000061d
	lduha	[%i1+%g0]0x89,%l1	! %l1 = 000000000000cfff
!	Mem[0000000010101408] = 380081af, %l4 = 00000000a3716dda
	lduha	[%i4+%o4]0x80,%l4	! %l4 = 0000000000003800
!	Mem[0000000030101408] = 00000000, %l3 = 00000000000000d6
	lduba	[%i4+%o4]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000010041400] = 000000ff, %l4 = 0000000000003800
	ldsha	[%i1+%g0]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[000000001010141c] = 295bdcc7, %l2 = 000000000000378f
	ldsb	[%i4+0x01c],%l2		! %l2 = 0000000000000029
!	Mem[0000000010101410] = 7f4e5008, %l0 = 0000000000003d78
	lduwa	[%i4+%o5]0x88,%l0	! %l0 = 000000007f4e5008
!	Mem[000000001000141c] = 24174994, %f13 = fff6cdb1
	lda	[%i0+0x01c]%asi,%f13	! %f13 = 24174994
!	Mem[00000000300c1408] = 783d0000, %l7 = 00000000b16f0000
	lduha	[%i3+%o4]0x89,%l7	! %l7 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030181410] = ff1dd9ff, %l5 = 0000000000000000
	swapa	[%i6+%o5]0x89,%l5	! %l5 = 00000000ff1dd9ff

p0_label_30:
!	%l0 = 7f4e5008, %l1 = 0000cfff, Mem[0000000010101400] = 0000e668 97087ae2
	stda	%l0,[%i4+0x000]%asi	! Mem[0000000010101400] = 7f4e5008 0000cfff
!	%l5 = 00000000ff1dd9ff, Mem[0000000010101438] = 3c0306f6
	sth	%l5,[%i4+0x038]		! Mem[0000000010101438] = d9ff06f6
!	Mem[0000000010081410] = 6a5df7d8, %l0 = 000000007f4e5008
	ldstuba	[%i2+%o5]0x80,%l0	! %l0 = 0000006a000000ff
!	Mem[0000000010101438] = d9ff06f676945c96, %l6 = 0000000000000000, %l7 = 0000000000000000
	add	%i4,0x38,%g1
	casxa	[%g1]0x80,%l6,%l7	! %l7 = d9ff06f676945c96
!	Mem[0000000010041410] = 1063cb77, %l2 = 0000000000000029
	swapa	[%i1+%o5]0x80,%l2	! %l2 = 000000001063cb77
!	%l1 = 000000000000cfff, Mem[0000000010141408] = d96af800
	stwa	%l1,[%i5+%o4]0x88	! Mem[0000000010141408] = 0000cfff
!	Mem[0000000030181408] = ff37d102, %l5 = 00000000ff1dd9ff
	swapa	[%i6+%o4]0x81,%l5	! %l5 = 00000000ff37d102
!	%l4 = 00000000000000ff, Mem[0000000030001410] = 8f370000
	stwa	%l4,[%i0+%o5]0x81	! Mem[0000000030001410] = 000000ff
!	Mem[0000000030041408] = 5791d400, %l6 = 0000000000000000
	ldstuba	[%i1+%o4]0x89,%l6	! %l6 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = ff000000dcd4d0d5, %l0 = 000000000000006a
	ldxa	[%i1+%g0]0x80,%l0	! %l0 = ff000000dcd4d0d5

!	Check Point 6 for processor 0

	set	p0_check_pt_data_6,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = ff000000dcd4d0d5
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 000000000000cfff
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 000000001063cb77
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
	cmp	%l5,%g2			! %l5 = 00000000ff37d102
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 0000000000000000
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = d9ff06f676945c96
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = 0000c211 000069d9
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x50],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 02cb2c41 24174994
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x58],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 8f84d76d ff1dd9ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x60],%g3
	std	%f12,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f12 = c348e552 24174994
	bne	%xcc,p0_freg_check_fail
	mov	0xf12,%g1
	ldx	[%g4+0x68],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = 7779df37 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1

!	Check Point 6 completed


p0_label_31:
!	Mem[00000000100c1438] = 3581cb8503de0639, %l2 = 000000001063cb77
	ldxa	[%i3+0x038]%asi,%l2	! %l2 = 3581cb8503de0639
!	Mem[0000000030181408] = ff1dd9ff, %l3 = 0000000000000000
	lduha	[%i6+%o4]0x81,%l3	! %l3 = 000000000000ff1d
!	Mem[0000000030041410] = ff000000, %l1 = 000000000000cfff
	ldsha	[%i1+%o5]0x81,%l1	! %l1 = ffffffffffffff00
!	Mem[0000000030041400] = ffcf0000, %l2 = 3581cb8503de0639
	lduwa	[%i1+%g0]0x81,%l2	! %l2 = 00000000ffcf0000
!	Mem[0000000010101400] = ffcf000008504e7f, %l1 = ffffffffffffff00
	ldxa	[%i4+%g0]0x88,%l1	! %l1 = ffcf000008504e7f
!	Mem[0000000010041408] = 66cdac63, %l0 = ff000000dcd4d0d5
	lduha	[%i1+%o4]0x80,%l0	! %l0 = 00000000000066cd
!	Mem[0000000030141410] = ff491724, %l4 = 00000000000000ff
	lduha	[%i5+%o5]0x81,%l4	! %l4 = 000000000000ff49
!	Mem[0000000010001410] = 37dfff85, %l0 = 00000000000066cd
	lduwa	[%i0+%o5]0x80,%l0	! %l0 = 0000000037dfff85
!	Mem[0000000030181410] = 8f84d76d 00000000, %l6 = 00000000, %l7 = 76945c96
	ldda	[%i6+%o5]0x89,%l6	! %l6 = 0000000000000000 000000008f84d76d
!	Starting 10 instruction Store Burst
!	%l1 = ffcf000008504e7f, Mem[0000000010001408] = 37df7977
	stba	%l1,[%i0+%o4]0x88	! Mem[0000000010001408] = 37df797f

p0_label_32:
!	%l2 = 00000000ffcf0000, Mem[0000000020800040] = 7760b8ec
	stb	%l2,[%o1+0x040]		! Mem[0000000020800040] = 0060b8ec
!	%l2 = ffcf0000, %l3 = 0000ff1d, Mem[0000000010001400] = b16f6ef8 79a894ef
	stda	%l2,[%i0+%g0]0x80	! Mem[0000000010001400] = ffcf0000 0000ff1d
!	%l6 = 0000000000000000, Mem[0000000030141408] = 8f37d102
	stha	%l6,[%i5+%o4]0x81	! Mem[0000000030141408] = 0000d102
!	%f0  = cdb502d1, Mem[0000000010101418] = 60029afb
	sta	%f0 ,[%i4+0x018]%asi	! Mem[0000000010101418] = cdb502d1
!	%f16 = 43d85bfd e1373d78 783d37e1 98bc81af
!	%f20 = 7779df37 00000000 a8417509 abda6f33
!	%f24 = ef940000 00000000 d96af809 d9690063
!	%f28 = c062cc2e 8f353365 a8490643 d9e62c7d
	stda	%f16,[%i3]ASI_BLK_P	! Block Store to 00000000100c1400
!	%l0 = 0000000037dfff85, Mem[0000000030081400] = 6533358f000000ff
	stxa	%l0,[%i2+%g0]0x89	! Mem[0000000030081400] = 0000000037dfff85
!	%f2  = 0000c211 000069d9, %l5 = 00000000ff37d102
!	Mem[0000000010181428] = e1373d78412ccb02
	add	%i6,0x028,%g1
	stda	%f2,[%g1+%l5]ASI_PST16_P ! Mem[0000000010181428] = e1373d780000cb02
!	%f0  = cdb502d1 a3bf2890 0000c211 000069d9
!	%f4  = 02cb2c41 24174994 8f84d76d ff1dd9ff
!	%f8  = 5539c2ba 3581cb85 3d99c199 085de2f2
!	%f12 = c348e552 24174994 68e68f57 b1cdf6ff
	stda	%f0,[%i2]ASI_BLK_AIUP	! Block Store to 0000000010081400
!	%l2 = 00000000ffcf0000, Mem[00000000100c1424] = 00000000
	sth	%l2,[%i3+0x024]		! Mem[00000000100c1424] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = 00d1a37b, %l0 = 0000000037dfff85
	ldsb	[%o2+%g0],%l0		! %l0 = 0000000000000000

p0_label_33:
!	Mem[0000000030181408] = ff1dd9ff5791dab5, %f20 = 7779df37 00000000
	ldda	[%i6+%o4]0x81,%f20	! %f20 = ff1dd9ff 5791dab5
!	Mem[0000000030141408] = 02d10000, %l7 = 000000008f84d76d
	lduha	[%i5+%o4]0x89,%l7	! %l7 = 0000000000000000
!	%l2 = 00000000ffcf0000, Mem[0000000010181418] = 79a894ef
	stw	%l2,[%i6+0x018]		! Mem[0000000010181418] = ffcf0000
!	Mem[0000000010001408] = 37df797f, %l6 = 0000000000000000
	ldswa	[%i0+%o4]0x88,%l6	! %l6 = 0000000037df797f
	membar	#Sync			! Added by membar checker (6)
!	Mem[00000000100c1428] = d96af809d9690063, %l0 = 0000000000000000
	ldx	[%i3+0x028],%l0		! %l0 = d96af809d9690063
!	Mem[0000000010041400] = 000000ff, %l7 = 0000000000000000
	lduha	[%i1+%g0]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010001410] = 25e5ad3585ffdf37, %l6 = 0000000037df797f
	ldxa	[%i0+%o5]0x88,%l6	! %l6 = 25e5ad3585ffdf37
!	Mem[00000000300c1408] = 783d0000, %l4 = 000000000000ff49
	lduha	[%i3+%o4]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000030081410] = e748b0a8 4dd91d06, %l4 = 00000000, %l5 = ff37d102
	ldda	[%i2+%o5]0x89,%l4	! %l4 = 000000004dd91d06 00000000e748b0a8
!	Starting 10 instruction Store Burst
!	Mem[0000000010041430] = cdb502d1, %l6 = 25e5ad3585ffdf37, %asi = 80
	swapa	[%i1+0x030]%asi,%l6	! %l6 = 00000000cdb502d1

p0_label_34:
!	%l3 = 000000000000ff1d, Mem[0000000010001410] = 37dfff85
	stwa	%l3,[%i0+%o5]0x80	! Mem[0000000010001410] = 0000ff1d
!	Mem[0000000010141415] = 678cb230, %l3 = 000000000000ff1d
	ldstub	[%i5+0x015],%l3		! %l3 = 0000008c000000ff
!	%l5 = 00000000e748b0a8, Mem[0000000030101408] = 00000000
	stha	%l5,[%i4+%o4]0x89	! Mem[0000000030101408] = 0000b0a8
!	Mem[00000000300c1400] = 77797e70, %l1 = ffcf000008504e7f
	swapa	[%i3+%g0]0x89,%l1	! %l1 = 0000000077797e70
!	%f25 = 00000000, Mem[0000000030181408] = ffd91dff
	sta	%f25,[%i6+%o4]0x89	! Mem[0000000030181408] = 00000000
!	%l5 = 00000000e748b0a8, Mem[00000000100c1410] = 37df7977
	stha	%l5,[%i3+%o5]0x88	! Mem[00000000100c1410] = 37dfb0a8
!	%l0 = d96af809d9690063, Mem[0000000020800001] = 77609984, %asi = 80
	stba	%l0,[%o1+0x001]%asi	! Mem[0000000020800000] = 77639984
!	Mem[00000000201c0000] = 3d78851d, %l0 = d96af809d9690063
	ldsh	[%o0+%g0],%l0		! %l0 = 0000000000003d78
!	Mem[0000000010001408] = 7f79df37, %l3 = 000000000000008c
	ldstuba	[%i0+%o4]0x80,%l3	! %l3 = 0000007f000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = ffffffff, %l0 = 0000000000003d78
	ldsba	[%i6+%o5]0x80,%l0	! %l0 = ffffffffffffffff

p0_label_35:
!	Mem[0000000020800000] = 77639984, %l3 = 000000000000007f
	ldsh	[%o1+%g0],%l3		! %l3 = 0000000000007763
!	%l6 = 00000000cdb502d1, Mem[0000000010141434] = 69d5ceb3
	sth	%l6,[%i5+0x034]		! Mem[0000000010141434] = 02d1ceb3
!	Mem[0000000030001410] = 000000ff, %l0 = ffffffffffffffff
	ldsha	[%i0+%o5]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000010001410] = 1dff0000, %l0 = 0000000000000000
	ldsha	[%i0+%o5]0x88,%l0	! %l0 = 0000000000000000
!	Mem[00000000201c0000] = 3d78851d, %l3 = 0000000000007763
	lduba	[%o0+0x000]%asi,%l3	! %l3 = 000000000000003d
!	Mem[0000000021800180] = 5f00d16c, %l7 = 00000000000000ff
	ldsha	[%o3+0x180]%asi,%l7	! %l7 = 0000000000005f00
!	Mem[0000000030141410] = 241749ff, %l1 = 0000000077797e70
	ldsha	[%i5+%o5]0x89,%l1	! %l1 = 00000000000049ff
!	Mem[0000000030041408] = 5791d4ff, %l3 = 000000000000003d
	ldswa	[%i1+%o4]0x89,%l3	! %l3 = 000000005791d4ff
!	Mem[0000000010141400] = 00d49157, %l2 = 00000000ffcf0000
	ldsh	[%i5+0x002],%l2		! %l2 = ffffffffffff9157
!	Starting 10 instruction Store Burst
!	Mem[0000000010081410] = 02cb2c41, %l3 = 000000005791d4ff
	ldstuba	[%i2+%o5]0x80,%l3	! %l3 = 00000002000000ff

!	Check Point 7 for processor 0

	set	p0_check_pt_data_7,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 0000000000000000
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 00000000000049ff
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = ffffffffffff9157
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 0000000000000002
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 000000004dd91d06
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l6,%g2			! %l6 = 00000000cdb502d1
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l7,%g2			! %l7 = 0000000000005f00
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x40],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 02cb2c41 24174994
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x48],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 8f84d76d ff1dd9ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x50],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = ff1dd9ff 5791dab5
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1

!	Check Point 7 completed


p0_label_36:
!	Mem[0000000030141400] = 000094ef, %l5 = 00000000e748b0a8
	ldstuba	[%i5+%g0]0x89,%l5	! %l5 = 000000ef000000ff
!	Mem[0000000010081438] = 68e68f57b1cdf6ff, %l4 = 000000004dd91d06, %l2 = ffffffffffff9157
	add	%i2,0x38,%g1
	casxa	[%g1]0x80,%l4,%l2	! %l2 = 68e68f57b1cdf6ff
!	%l2 = 68e68f57b1cdf6ff, Mem[0000000010001410] = 0000ff1d
	stha	%l2,[%i0+%o5]0x80	! Mem[0000000010001410] = f6ffff1d
!	%l6 = 00000000cdb502d1, Mem[00000000100c1408] = e1373d78
	stwa	%l6,[%i3+%o4]0x88	! Mem[00000000100c1408] = cdb502d1
!	%l0 = 0000000000000000, Mem[00000000218000c0] = ad30d561, %asi = 80
	stba	%l0,[%o3+0x0c0]%asi	! Mem[00000000218000c0] = 0030d561
!	%l6 = 00000000cdb502d1, Mem[00000000211c0000] = 00d1a37b, %asi = 80
	stha	%l6,[%o2+0x000]%asi	! Mem[00000000211c0000] = 02d1a37b
!	Mem[0000000010081410] = ffcb2c41, %l4 = 000000004dd91d06
	swapa	[%i2+%o5]0x80,%l4	! %l4 = 00000000ffcb2c41
!	%l6 = 00000000cdb502d1, imm = fffffffffffff369, %l2 = 68e68f57b1cdf6ff
	orn	%l6,-0xc97,%l2		! %l2 = 00000000cdb50ed7
!	Mem[000000001008143e] = b1cdf6ff, %l2 = 00000000cdb50ed7
	ldstuba	[%i2+0x03e]%asi,%l2	! %l2 = 000000f6000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = 783d37e1, %f19 = 98bc81af
	lda	[%i6+%g0]0x88,%f19	! %f19 = 783d37e1

p0_label_37:
!	Mem[00000000300c1408] = 00003d78 26ac631b, %l0 = 00000000, %l1 = 000049ff
	ldda	[%i3+%o4]0x81,%l0	! %l0 = 0000000000003d78 0000000026ac631b
!	Mem[0000000010181410] = ffffffff, %l0 = 0000000000003d78
	ldswa	[%i6+%o5]0x80,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000030141408] = 0000d102, %l2 = 00000000000000f6
	ldswa	[%i5+%o4]0x81,%l2	! %l2 = 000000000000d102
!	Mem[0000000010041408] = 63accd66, %l2 = 000000000000d102
	lduha	[%i1+%o4]0x88,%l2	! %l2 = 000000000000cd66
!	Mem[00000000300c1408] = 00003d78, %l2 = 000000000000cd66
	ldsba	[%i3+%o4]0x81,%l2	! %l2 = 0000000000000000
	membar	#Sync			! Added by membar checker (7)
!	Mem[0000000010081400] = cdb502d1 a3bf2890 0000c211 000069d9
!	Mem[0000000010081410] = 4dd91d06 24174994 8f84d76d ff1dd9ff
!	Mem[0000000010081420] = 5539c2ba 3581cb85 3d99c199 085de2f2
!	Mem[0000000010081430] = c348e552 24174994 68e68f57 b1cdffff
	ldda	[%i2]ASI_BLK_PL,%f16	! Block Load from 0000000010081400
!	Mem[0000000030041410] = ff000000, %l4 = 00000000ffcb2c41
	ldswa	[%i1+%o5]0x81,%l4	! %l4 = ffffffffff000000
!	Mem[0000000030001400] = 0068ac26, %f6  = 8f84d76d
	lda	[%i0+%g0]0x81,%f6 	! %f6 = 0068ac26
!	Mem[0000000030141410] = ff491724412ccb02, %l5 = 00000000000000ef
	ldxa	[%i5+%o5]0x81,%l5	! %l5 = ff491724412ccb02
!	Starting 10 instruction Store Burst
!	Mem[0000000030081410] = 061dd94d, %l5 = ff491724412ccb02
	ldstuba	[%i2+%o5]0x81,%l5	! %l5 = 00000006000000ff

p0_label_38:
!	%f15 = b1cdf6ff, Mem[0000000010101408] = 380081af
	sta	%f15,[%i4+%o4]0x80	! Mem[0000000010101408] = b1cdf6ff
!	%l6 = 00000000cdb502d1, Mem[00000000100c1408] = af81bc98cdb502d1
	stxa	%l6,[%i3+%o4]0x88	! Mem[00000000100c1408] = 00000000cdb502d1
!	%l0 = ffffffffffffffff, Mem[0000000030101408] = 0000b0a8
	stwa	%l0,[%i4+%o4]0x89	! Mem[0000000030101408] = ffffffff
!	%l4 = ffffffffff000000, Mem[0000000030181408] = 00000000
	stba	%l4,[%i6+%o4]0x89	! Mem[0000000030181408] = 00000000
!	Mem[0000000010141428] = 96d26ea4, %l1 = 0000000026ac631b
	swap	[%i5+0x028],%l1		! %l1 = 0000000096d26ea4
!	Mem[0000000030041400] = 783d37e10000cfff, %f12 = c348e552 24174994
	ldda	[%i1+%g0]0x89,%f12	! %f12 = 783d37e1 0000cfff
!	%l7 = 0000000000005f00, Mem[00000000100c1408] = 00000000cdb502d1
	stxa	%l7,[%i3+%o4]0x88	! Mem[00000000100c1408] = 0000000000005f00
	membar	#Sync			! Added by membar checker (8)
!	%f5  = 24174994, Mem[0000000010081408] = 11c20000
	sta	%f5 ,[%i2+%o4]0x88	! Mem[0000000010081408] = 24174994
!	%l1 = 0000000096d26ea4, Mem[00000000201c0000] = 3d78851d
	sth	%l1,[%o0+%g0]		! Mem[00000000201c0000] = 6ea4851d
!	Starting 10 instruction Load Burst
!	Mem[0000000010001434] = 12f7d04d, %l3 = 0000000000000002
	lduha	[%i0+0x036]%asi,%l3	! %l3 = 000000000000d04d

p0_label_39:
!	Mem[0000000010101410] = 7f4e5008, %l5 = 0000000000000006
	ldsba	[%i4+%o5]0x88,%l5	! %l5 = 0000000000000008
!	Mem[000000001000141c] = 24174994, %l2 = 0000000000000000
	ldsw	[%i0+0x01c],%l2		! %l2 = 0000000024174994
!	Mem[00000000100c1408] = 00005f00, %l4 = ffffffffff000000
	ldswa	[%i3+%o4]0x88,%l4	! %l4 = 0000000000005f00
!	Mem[0000000010141408] = ffcf0000, %f14 = 68e68f57
	lda	[%i5+%o4]0x80,%f14	! %f14 = ffcf0000
!	Mem[0000000010181400] = e1373d78827cf18e, %f14 = ffcf0000 b1cdf6ff
	ldda	[%i6+%g0]0x80,%f14	! %f14 = e1373d78 827cf18e
!	Mem[00000000300c1410] = 00000000, %l1 = 0000000096d26ea4
	ldsha	[%i3+%o5]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000010001408] = ff79df37, %l2 = 0000000024174994
	lduha	[%i0+%o4]0x80,%l2	! %l2 = 000000000000ff79
!	Mem[0000000010181408] = 00000000, %l0 = ffffffffffffffff
	ldswa	[%i6+%o4]0x88,%l0	! %l0 = 0000000000000000
!	Mem[00000000300c1410] = 00000000, %f31 = 578fe668
	lda	[%i3+%o5]0x89,%f31	! %f31 = 00000000
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1410] = a8b0df37, %l6 = 00000000cdb502d1
	ldstuba	[%i3+%o5]0x80,%l6	! %l6 = 000000a8000000ff

p0_label_40:
!	%l0 = 0000000000000000, Mem[00000000300c1408] = 1b63ac26783d0000
	stxa	%l0,[%i3+%o4]0x89	! Mem[00000000300c1408] = 0000000000000000
!	%l2 = 000000000000ff79, Mem[0000000021800081] = ff3114cb
	stb	%l2,[%o3+0x081]		! Mem[0000000021800080] = ff7914cb
!	Mem[0000000010141400] = 00d49157, %l2 = 000000000000ff79
	ldstuba	[%i5+%g0]0x80,%l2	! %l2 = 00000000000000ff
!	%f6  = 0068ac26 ff1dd9ff, Mem[0000000010101408] = fff6cdb1 fc7325aa
	stda	%f6 ,[%i4+%o4]0x88	! Mem[0000000010101408] = 0068ac26 ff1dd9ff
!	%l1 = 0000000000000000, Mem[0000000010081400] = 9028bfa3d102b5cd
	stxa	%l1,[%i2+%g0]0x88	! Mem[0000000010081400] = 0000000000000000
!	Mem[00000000100c1408] = 005f0000, %l0 = 0000000000000000
	swapa	[%i3+%o4]0x80,%l0	! %l0 = 00000000005f0000
!	Mem[0000000030101408] = ffffffff, %l1 = 0000000000000000
	ldstuba	[%i4+%o4]0x89,%l1	! %l1 = 000000ff000000ff
!	Mem[0000000010181400] = 783d37e1, %l5 = 0000000000000008
	ldstuba	[%i6+%g0]0x88,%l5	! %l5 = 000000e1000000ff
!	%f10 = 3d99c199, Mem[0000000030141408] = 0000d102
	sta	%f10,[%i5+%o4]0x81	! Mem[0000000030141408] = 3d99c199
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = ffd49157, %l2 = 0000000000000000
	lduwa	[%i1+%o4]0x81,%l2	! %l2 = 00000000ffd49157

!	Check Point 8 for processor 0

	set	p0_check_pt_data_8,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 00000000005f0000
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 00000000ffd49157
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 000000000000d04d
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 0000000000005f00
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 00000000000000e1
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 00000000000000a8
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = cdb502d1 a3bf2890
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x48],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 0068ac26 ff1dd9ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x50],%g3
	std	%f12,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f12 = 783d37e1 0000cfff
	bne	%xcc,p0_freg_check_fail
	mov	0xf12,%g1
	ldx	[%g4+0x58],%g3
	std	%f14,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f14 = e1373d78 827cf18e
	bne	%xcc,p0_freg_check_fail
	mov	0xf14,%g1
	ldx	[%g4+0x60],%g3
	std	%f16,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f16 = 9028bfa3 d102b5cd
	bne	%xcc,p0_freg_check_fail
	mov	0xf16,%g1
	ldx	[%g4+0x68],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = d9690000 11c20000
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1
	ldx	[%g4+0x70],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = 94491724 061dd94d
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1
	ldx	[%g4+0x78],%g3
	std	%f22,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f22 = ffd91dff 6dd7848f
	bne	%xcc,p0_freg_check_fail
	mov	0xf22,%g1
	ldx	[%g4+0x80],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = 85cb8135 bac23955
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1
	ldx	[%g4+0x88],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = f2e25d08 99c1993d
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1
	ldx	[%g4+0x90],%g3
	std	%f28,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f28 = 94491724 52e548c3
	bne	%xcc,p0_freg_check_fail
	mov	0xf28,%g1
	ldx	[%g4+0x98],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = ffffcdb1 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 8 completed


p0_label_41:
!	Mem[0000000030101400] = 1705028a f32c2985, %l4 = 00005f00, %l5 = 000000e1
	ldda	[%i4+%g0]0x89,%l4	! %l4 = 00000000f32c2985 000000001705028a
!	Mem[0000000010001410] = f6ffff1d 35ade525, %l4 = f32c2985, %l5 = 1705028a
	ldda	[%i0+%o5]0x80,%l4	! %l4 = 00000000f6ffff1d 0000000035ade525
!	Mem[0000000010181410] = ffffffff, %l2 = 00000000ffd49157
	ldsha	[%i6+%o5]0x88,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000030101408] = ffffffff 993c43f4, %l6 = 000000a8, %l7 = 00005f00
	ldda	[%i4+%o4]0x81,%l6	! %l6 = 00000000ffffffff 00000000993c43f4
!	Mem[00000000300c1408] = 00000000, %l5 = 0000000035ade525
	lduwa	[%i3+%o4]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000010141408] = 0000cfff, %l3 = 000000000000d04d
	lduba	[%i5+%o4]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[000000001010142c] = 6e1e92a8, %l3 = 00000000000000ff
	lduh	[%i4+0x02e],%l3		! %l3 = 00000000000092a8
!	Mem[0000000030041410] = ff000000, %l4 = 00000000f6ffff1d
	ldsha	[%i1+%o5]0x81,%l4	! %l4 = ffffffffffffff00
!	Mem[0000000010181408] = 00000000, %l3 = 00000000000092a8
	ldsba	[%i6+%o4]0x80,%l3	! %l3 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l1 = 00000000000000ff, Mem[00000000201c0001] = 6ea4851d
	stb	%l1,[%o0+0x001]		! Mem[00000000201c0000] = 6eff851d

p0_label_42:
!	Mem[0000000010041410] = 00000029, %l6 = 00000000ffffffff
	ldstuba	[%i1+%o5]0x80,%l6	! %l6 = 00000000000000ff
!	%l2 = ffffffff, %l3 = 00000000, Mem[0000000010141408] = ffcf0000 d172c211
	stda	%l2,[%i5+%o4]0x80	! Mem[0000000010141408] = ffffffff 00000000
!	Mem[0000000010141410] = 9b36de0f, %l4 = ffffffffffffff00
	ldstuba	[%i5+%o5]0x80,%l4	! %l4 = 0000009b000000ff
!	Mem[0000000030041400] = ffcf0000, %l1 = 00000000000000ff
	swapa	[%i1+%g0]0x81,%l1	! %l1 = 00000000ffcf0000
!	%f30 = ffffcdb1, Mem[0000000010181408] = 00000000
	sta	%f30,[%i6+%o4]0x88	! Mem[0000000010181408] = ffffcdb1
!	Mem[0000000010101410] = 08504e7f, %l2 = ffffffffffffffff
	ldstuba	[%i4+%o5]0x80,%l2	! %l2 = 00000008000000ff
!	%l0 = 00000000005f0000, Mem[00000000100c142c] = d9690063
	stw	%l0,[%i3+0x02c]		! Mem[00000000100c142c] = 005f0000
!	%f28 = 94491724 52e548c3, %l7 = 00000000993c43f4
!	Mem[0000000010141418] = ce9eb990cb947cb9
	add	%i5,0x018,%g1
	stda	%f28,[%g1+%l7]ASI_PST8_PL ! Mem[0000000010141418] = ce9ee59024174994
!	Mem[0000000010181400] = ff373d78, %l5 = 0000000000000000
	swapa	[%i6+%g0]0x80,%l5	! %l5 = 00000000ff373d78
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = ff491724 412ccb02, %l0 = 005f0000, %l1 = ffcf0000
	ldda	[%i5+%o5]0x81,%l0	! %l0 = 00000000ff491724 00000000412ccb02

p0_label_43:
!	Mem[0000000030141408] = d969006399c1993d, %l5 = 00000000ff373d78
	ldxa	[%i5+%o4]0x89,%l5	! %l5 = d969006399c1993d
!	Mem[00000000100c143c] = d9e62c7d, %l0 = 00000000ff491724
	lduh	[%i3+0x03e],%l0		! %l0 = 0000000000002c7d
!	Mem[0000000010081428] = 3d99c199, %l5 = d969006399c1993d
	ldsb	[%i2+0x02a],%l5		! %l5 = ffffffffffffffc1
!	Mem[0000000010081438] = 68e68f57, %l4 = 000000000000009b
	ldub	[%i2+0x03a],%l4		! %l4 = 000000000000008f
!	Mem[00000000100c1408] = 0000000000000000, %f0  = cdb502d1 a3bf2890
	ldda	[%i3+%o4]0x80,%f0 	! %f0  = 00000000 00000000
!	%l6 = 0000000000000000, immd = fffffffffffffa5d, %l7 = 00000000993c43f4
	sdivx	%l6,-0x5a3,%l7		! %l7 = 0000000000000000
!	Mem[0000000010181418] = ffcf0000, %l2 = 0000000000000008
	lduba	[%i6+0x01a]%asi,%l2	! %l2 = 0000000000000000
!	Mem[0000000010101410] = ff504e7f, %l1 = 00000000412ccb02
	ldswa	[%i4+%o5]0x80,%l1	! %l1 = ffffffffff504e7f
!	Mem[0000000010141410] = ff36de0f67ffb230, %l6 = 0000000000000000
	ldxa	[%i5+0x010]%asi,%l6	! %l6 = ff36de0f67ffb230
!	Starting 10 instruction Store Burst
!	Mem[0000000010141400] = ffd49157, %l1 = ffffffffff504e7f
	ldstuba	[%i5+%g0]0x80,%l1	! %l1 = 000000ff000000ff

p0_label_44:
!	Mem[0000000010001436] = 12f7d04d, %l5 = ffffffffffffffc1
	ldstub	[%i0+0x036],%l5		! %l5 = 000000d0000000ff
!	Mem[0000000030081408] = 00000000, %l0 = 0000000000002c7d
	ldstuba	[%i2+%o4]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030101408] = ffffffff, %l2 = 0000000000000000
	swapa	[%i4+%o4]0x81,%l2	! %l2 = 00000000ffffffff
!	Mem[0000000010081400] = 00000000, %l0 = 0000000000000000
	swapa	[%i2+%g0]0x88,%l0	! %l0 = 0000000000000000
!	Mem[00000000100c1408] = 00000000, %l4 = 000000000000008f
	ldstuba	[%i3+%o4]0x80,%l4	! %l4 = 00000000000000ff
!	%l3 = 0000000000000000, Mem[0000000030081410] = ff1dd94d
	stba	%l3,[%i2+%o5]0x81	! Mem[0000000030081410] = 001dd94d
!	Mem[0000000020800001] = 77639984, %l6 = ff36de0f67ffb230
	ldstuba	[%o1+0x001]%asi,%l6	! %l6 = 00000063000000ff
!	%f28 = 94491724 52e548c3, Mem[00000000100c1410] = ffb0df37 00000000
	std	%f28,[%i3+%o5]	! Mem[00000000100c1410] = 94491724 52e548c3
!	Mem[0000000010141410] = ff36de0f, %l2 = 00000000ffffffff
	ldstuba	[%i5+%o5]0x80,%l2	! %l2 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	%l4 = 00000000, %l5 = 000000d0, Mem[0000000010141408] = ffffffff 00000000
	stda	%l4,[%i5+%o4]0x80	! Mem[0000000010141408] = 00000000 000000d0

p0_label_45:
!	Mem[00000000201c0000] = 6eff851d, %l3 = 0000000000000000
	ldub	[%o0+%g0],%l3		! %l3 = 000000000000006e
!	Mem[0000000030141400] = ff94000000000000, %l0 = 0000000000000000
	ldxa	[%i5+%g0]0x81,%l0	! %l0 = ff94000000000000
!	Mem[0000000010141410] = 0fde36ff, %f9  = 3581cb85
	lda	[%i5+%o5]0x88,%f9 	! %f9 = 0fde36ff
!	Mem[0000000010141408] = 00000000, %l4 = 0000000000000000
	ldswa	[%i5+%o4]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000010141408] = 00000000000000d0, %f30 = ffffcdb1 00000000
	ldda	[%i5+0x008]%asi,%f30	! %f30 = 00000000 000000d0
!	Mem[0000000030001408] = 00000000, %l4 = 0000000000000000
	lduba	[%i0+%o4]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000030101410] = 630069d9, %f5  = 24174994
	lda	[%i4+%o5]0x81,%f5 	! %f5 = 630069d9
!	Mem[0000000010081400] = 00000000, %l0 = ff94000000000000
	ldsba	[%i2+%g0]0x80,%l0	! %l0 = 0000000000000000
!	Mem[00000000100c1408] = ff000000, %l0 = 0000000000000000
	lduwa	[%i3+%o4]0x80,%l0	! %l0 = 00000000ff000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010181410] = ffffffff, %l6 = 0000000000000063
	swapa	[%i6+%o5]0x80,%l6	! %l6 = 00000000ffffffff

!	Check Point 9 for processor 0

	set	p0_check_pt_data_9,%g4
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
	cmp	%l3,%g2			! %l3 = 000000000000006e
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 0000000000000000
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 00000000000000d0
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 00000000ffffffff
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
	cmp	%g3,%g2			! %f4 = 02cb2c41 630069d9
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x58],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 0068ac26 ff1dd9ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x60],%g3
	std	%f8,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f8 = 5539c2ba 0fde36ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf08,%g1
	ldx	[%g4+0x68],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = 00000000 000000d0
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 9 completed


p0_label_46:
!	%f10 = 3d99c199 085de2f2, %l2 = 00000000000000ff
!	Mem[0000000010001408] = ff79df3700000000
	add	%i0,0x008,%g1
	stda	%f10,[%g1+%l2]ASI_PST8_P ! Mem[0000000010001408] = 3d99c199085de2f2
!	%f20 = 94491724, Mem[0000000030141400] = ff940000
	sta	%f20,[%i5+%g0]0x81	! Mem[0000000030141400] = 94491724
!	Mem[000000001010140c] = 26ac6800, %l5 = 00000000000000d0
	ldstub	[%i4+0x00c],%l5		! %l5 = 00000026000000ff
!	Mem[0000000030001408] = 00000000, %l7 = 0000000000000000
	ldstuba	[%i0+%o4]0x89,%l7	! %l7 = 00000000000000ff
!	%f0  = 00000000 00000000, Mem[0000000030101400] = f32c2985 1705028a
	stda	%f0 ,[%i4+%g0]0x89	! Mem[0000000030101400] = 00000000 00000000
!	%l0 = 00000000ff000000, Mem[0000000030081408] = 000000ff
	stba	%l0,[%i2+%o4]0x89	! Mem[0000000030081408] = 00000000
!	Mem[0000000010141410] = ff36de0f, %l7 = 0000000000000000
	swapa	[%i5+%o5]0x80,%l7	! %l7 = 00000000ff36de0f
!	Mem[0000000030141410] = ff491724, %l4 = 0000000000000000
	ldstuba	[%i5+%o5]0x81,%l4	! %l4 = 000000ff000000ff
!	%l6 = 00000000ffffffff, Mem[0000000010081410] = 94491724061dd94d
	stxa	%l6,[%i2+%o5]0x88	! Mem[0000000010081410] = 00000000ffffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = 68e68f577f4e50ff, %f24 = 85cb8135 bac23955
	ldda	[%i4+%o5]0x88,%f24	! %f24 = 68e68f57 7f4e50ff

p0_label_47:
!	Mem[00000000100c140c] = 00000000, %l0 = 00000000ff000000
	lduwa	[%i3+0x00c]%asi,%l0	! %l0 = 0000000000000000
!	Mem[0000000010081408] = 94491724000069d9, %l4 = 00000000000000ff
	ldx	[%i2+%o4],%l4		! %l4 = 94491724000069d9
!	Mem[00000000100c1410] = c348e55224174994, %l1 = 00000000000000ff
	ldxa	[%i3+%o5]0x88,%l1	! %l1 = c348e55224174994
!	Mem[0000000010101400] = 7f4e5008, %l0 = 0000000000000000
	ldsw	[%i4+%g0],%l0		! %l0 = 000000007f4e5008
!	Mem[00000000100c1408] = 000000ff, %l5 = 0000000000000026
	ldswa	[%i3+%o4]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010081438] = 68e68f57, %l3 = 000000000000006e
	lduba	[%i2+0x03b]%asi,%l3	! %l3 = 0000000000000057
!	Mem[00000000211c0000] = 02d1a37b, %l2 = 00000000000000ff
	ldub	[%o2+%g0],%l2		! %l2 = 0000000000000002
!	Mem[0000000010141408] = d000000000000000, %f6  = 0068ac26 ff1dd9ff
	ldda	[%i5+%o4]0x88,%f6 	! %f6  = d0000000 00000000
!	Mem[0000000030081410] = e748b0a84dd91d00, %f12 = 783d37e1 0000cfff
	ldda	[%i2+%o5]0x89,%f12	! %f12 = e748b0a8 4dd91d00
!	Starting 10 instruction Store Burst
!	%l6 = 00000000ffffffff, Mem[00000000100c1419] = a8417509
	stb	%l6,[%i3+0x019]		! Mem[00000000100c1418] = a8ff7509

p0_label_48:
!	%f14 = e1373d78 827cf18e, Mem[00000000300c1408] = 00000000 00000000
	stda	%f14,[%i3+%o4]0x89	! Mem[00000000300c1408] = e1373d78 827cf18e
!	Mem[00000000100c1437] = 8f353365, %l4 = 94491724000069d9
	ldstuba	[%i3+0x037]%asi,%l4	! %l4 = 00000065000000ff
!	Mem[0000000030081410] = 001dd94d, %l3 = 0000000000000057
	ldstuba	[%i2+%o5]0x81,%l3	! %l3 = 00000000000000ff
!	%f18 = d9690000 11c20000, Mem[0000000010041400] = ff000000 dcd4d0d5
	std	%f18,[%i1+%g0]	! Mem[0000000010041400] = d9690000 11c20000
!	%f11 = 085de2f2, Mem[0000000010041414] = 430649a8
	sta	%f11,[%i1+0x014]%asi	! Mem[0000000010041414] = 085de2f2
!	Mem[0000000010181400] = 00000000, %l7 = 00000000ff36de0f
	swapa	[%i6+%g0]0x88,%l7	! %l7 = 0000000000000000
!	%l4 = 0000000000000065, Mem[0000000010081408] = 94491724
	stwa	%l4,[%i2+%o4]0x80	! Mem[0000000010081408] = 00000065
!	Mem[000000001000140c] = 085de2f2, %l3 = 0000000000000000, %asi = 80
	swapa	[%i0+0x00c]%asi,%l3	! %l3 = 00000000085de2f2
!	%l4 = 00000065, %l5 = 000000ff, Mem[0000000010081408] = 00000065 000069d9
	stda	%l4,[%i2+0x008]%asi	! Mem[0000000010081408] = 00000065 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = 000069d9, %l4 = 0000000000000065
	ldswa	[%i1+%g0]0x88,%l4	! %l4 = 00000000000069d9

p0_label_49:
!	Mem[000000001018143c] = 978a5a90, %l7 = 0000000000000000
	lduh	[%i6+0x03e],%l7		! %l7 = 0000000000005a90
!	Mem[0000000030181400] = e2b9cac1, %l5 = 00000000000000ff
	lduwa	[%i6+%g0]0x89,%l5	! %l5 = 00000000e2b9cac1
	membar	#Sync			! Added by membar checker (9)
!	Mem[0000000010081400] = 00000000 00000000 00000065 000000ff
!	Mem[0000000010081410] = ffffffff 00000000 8f84d76d ff1dd9ff
!	Mem[0000000010081420] = 5539c2ba 3581cb85 3d99c199 085de2f2
!	Mem[0000000010081430] = c348e552 24174994 68e68f57 b1cdffff
	ldda	[%i2]ASI_BLK_AIUP,%f0	! Block Load from 0000000010081400
!	Mem[0000000030081400] = 00000000 37dfff85, %l0 = 7f4e5008, %l1 = 24174994
	ldda	[%i2+%g0]0x89,%l0	! %l0 = 0000000037dfff85 0000000000000000
!	Mem[0000000030101400] = 00000000 00000000 00000000 993c43f4
!	Mem[0000000030101410] = 630069d9 007ee51c 135abbdb c99b887f
!	Mem[0000000030101420] = 5311e374 ddae6b21 58753f2f 3473a3d9
!	Mem[0000000030101430] = 3a01337c dc6b25e8 18295d59 c1b881ee
	ldda	[%i4]ASI_BLK_S,%f0	! Block Load from 0000000030101400
!	Mem[0000000010101410] = ff504e7f, %l0 = 0000000037dfff85
	lduba	[%i4+%o5]0x80,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030081410] = ff1dd94d, %l1 = 0000000000000000
	ldswa	[%i2+%o5]0x81,%l1	! %l1 = ffffffffff1dd94d
!	Mem[0000000010081400] = 0000000000000000, %f28 = 94491724 52e548c3
	ldda	[%i2+%g0]0x80,%f28	! %f28 = 00000000 00000000
!	Mem[000000001000142c] = 65d0c689, %l7 = 0000000000005a90
	ldswa	[%i0+0x02c]%asi,%l7	! %l7 = 0000000065d0c689
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (10)
!	%f23 = 6dd7848f, Mem[0000000010081410] = ffffffff
	sta	%f23,[%i2+%o5]0x88	! Mem[0000000010081410] = 6dd7848f

p0_label_50:
!	Mem[0000000030101408] = 00000000, %l0 = 00000000000000ff
	ldstuba	[%i4+%o4]0x89,%l0	! %l0 = 00000000000000ff
!	%l0 = 0000000000000000, Mem[0000000010001438] = 6ebbb1da62031b1d, %asi = 80
	stxa	%l0,[%i0+0x038]%asi	! Mem[0000000010001438] = 0000000000000000
!	%l0 = 0000000000000000, Mem[00000000100c1408] = ff000000
	stba	%l0,[%i3+%o4]0x80	! Mem[00000000100c1408] = 00000000
!	%l2 = 00000002, %l3 = 085de2f2, Mem[0000000010101410] = 7f4e50ff 68e68f57
	stda	%l2,[%i4+%o5]0x88	! Mem[0000000010101410] = 00000002 085de2f2
!	%l2 = 00000002, %l3 = 085de2f2, Mem[0000000030081400] = 85ffdf37 00000000
	stda	%l2,[%i2+%g0]0x81	! Mem[0000000030081400] = 00000002 085de2f2
!	Mem[0000000030041400] = 000000ff, %l6 = 00000000ffffffff
	ldstuba	[%i1+%g0]0x81,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030141410] = 241749ff, %l3 = 00000000085de2f2
	swapa	[%i5+%o5]0x89,%l3	! %l3 = 00000000241749ff
!	%l5 = 00000000e2b9cac1, Mem[0000000030101408] = 000000ff
	stba	%l5,[%i4+%o4]0x89	! Mem[0000000030101408] = 000000c1
!	%l4 = 00000000000069d9, Mem[00000000100c1400] = fd5bd843
	stba	%l4,[%i3+%g0]0x88	! Mem[00000000100c1400] = fd5bd8d9
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = 65000000, %l5 = 00000000e2b9cac1
	ldsha	[%i2+%o4]0x88,%l5	! %l5 = 0000000000000000

!	Check Point 10 for processor 0

	set	p0_check_pt_data_10,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 0000000000000000
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = ffffffffff1dd94d
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 0000000000000002
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 00000000241749ff
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 00000000000069d9
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
	cmp	%l7,%g2			! %l7 = 0000000065d0c689
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
	cmp	%g3,%g2			! %f2 = 00000000 993c43f4
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x58],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 630069d9 007ee51c
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x60],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 135abbdb c99b887f
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x68],%g3
	std	%f8,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f8 = 5311e374 ddae6b21
	bne	%xcc,p0_freg_check_fail
	mov	0xf08,%g1
	ldx	[%g4+0x70],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = 58753f2f 3473a3d9
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x78],%g3
	std	%f12,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f12 = 3a01337c dc6b25e8
	bne	%xcc,p0_freg_check_fail
	mov	0xf12,%g1
	ldx	[%g4+0x80],%g3
	std	%f14,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f14 = 18295d59 c1b881ee
	bne	%xcc,p0_freg_check_fail
	mov	0xf14,%g1
	ldx	[%g4+0x88],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = 68e68f57 7f4e50ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1
	ldx	[%g4+0x90],%g3
	std	%f28,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f28 = 00000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf28,%g1

!	Check Point 10 completed


p0_label_51:
!	Mem[0000000010141420] = 6ad32ca6, %l0 = 0000000000000000
	lduha	[%i5+0x020]%asi,%l0	! %l0 = 0000000000006ad3
!	Mem[0000000030141400] = 24174994, %l0 = 0000000000006ad3
	lduba	[%i5+%g0]0x89,%l0	! %l0 = 0000000000000094
!	Mem[0000000030081408] = ef94000000000000, %l0 = 0000000000000094
	ldxa	[%i2+%o4]0x89,%l0	! %l0 = ef94000000000000
!	Mem[0000000030141410] = f2e25d08412ccb02, %f6  = 135abbdb c99b887f
	ldda	[%i5+%o5]0x81,%f6 	! %f6  = f2e25d08 412ccb02
!	%l5 = 0000000000000000, Mem[0000000030141410] = f2e25d08
	stba	%l5,[%i5+%o5]0x81	! Mem[0000000030141410] = 00e25d08
!	Mem[0000000030081400] = 00000002, %l5 = 0000000000000000
	lduba	[%i2+%g0]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000030141410] = 00e25d08, %l0 = ef94000000000000
	ldsha	[%i5+%o5]0x81,%l0	! %l0 = 00000000000000e2
!	Mem[00000000100c1410] = 94491724, %l2 = 0000000000000002
	ldsha	[%i3+%o5]0x80,%l2	! %l2 = ffffffffffff9449
!	Mem[00000000201c0000] = 6eff851d, %l1 = ffffffffff1dd94d
	ldub	[%o0+%g0],%l1		! %l1 = 000000000000006e
!	Starting 10 instruction Store Burst
!	%l0 = 00000000000000e2, Mem[0000000010041400] = 0000c211000069d9
	stxa	%l0,[%i1+%g0]0x88	! Mem[0000000010041400] = 00000000000000e2

p0_label_52:
!	%l7 = 0000000065d0c689, Mem[0000000010101410] = 00000002
	stha	%l7,[%i4+%o5]0x88	! Mem[0000000010101410] = 0000c689
!	%f2  = 00000000 993c43f4, %l1 = 000000000000006e
!	Mem[0000000010081428] = 3d99c199085de2f2
	add	%i2,0x028,%g1
	stda	%f2,[%g1+%l1]ASI_PST32_PL ! Mem[0000000010081428] = 3d99c19900000000
!	Mem[0000000030181400] = e2b9cac1, %l7 = 0000000065d0c689
	swapa	[%i6+%g0]0x89,%l7	! %l7 = 00000000e2b9cac1
!	%l2 = ffffffffffff9449, Mem[0000000030141408] = 3d99c199
	stba	%l2,[%i5+%o4]0x81	! Mem[0000000030141408] = 4999c199
!	%l7 = 00000000e2b9cac1, Mem[0000000030041400] = ff0000ff
	stha	%l7,[%i1+%g0]0x81	! Mem[0000000030041400] = cac100ff
!	Mem[000000001014141c] = 24174994, %l7 = 00000000e2b9cac1
	swap	[%i5+0x01c],%l7		! %l7 = 0000000024174994
!	%f16 = 9028bfa3 d102b5cd, Mem[0000000010041438] = a8490643 d9e62c7d
	stda	%f16,[%i1+0x038]%asi	! Mem[0000000010041438] = 9028bfa3 d102b5cd
!	%l2 = ffffffffffff9449, Mem[00000000300c1400] = 8ef17c8208504e7f
	stxa	%l2,[%i3+%g0]0x89	! Mem[00000000300c1400] = ffffffffffff9449
!	%l6 = 0000000000000000, Mem[0000000030181400] = 89c6d065
	stha	%l6,[%i6+%g0]0x81	! Mem[0000000030181400] = 0000d065
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = 8f84d76d00000000, %f24 = 68e68f57 7f4e50ff
	ldda	[%i2+%o5]0x80,%f24	! %f24 = 8f84d76d 00000000

p0_label_53:
!	Mem[0000000030081410] = 4dd91dff, %l4 = 00000000000069d9
	lduha	[%i2+%o5]0x89,%l4	! %l4 = 0000000000001dff
!	Mem[0000000010181400] = ff36de0f, %l3 = 00000000241749ff
	ldsha	[%i6+%g0]0x88,%l3	! %l3 = ffffffffffffde0f
!	Mem[00000000100c1404] = e1373d78, %l4 = 0000000000001dff
	lduh	[%i3+0x004],%l4		! %l4 = 000000000000e137
!	Mem[0000000010041410] = f2e25d08290000ff, %l5 = 0000000000000000
	ldxa	[%i1+%o5]0x88,%l5	! %l5 = f2e25d08290000ff
!	Mem[0000000010081430] = c348e55224174994, %f0  = 00000000 00000000
	ldda	[%i2+0x030]%asi,%f0 	! %f0  = c348e552 24174994
!	Mem[0000000010041428] = 6683e588, %l0 = 00000000000000e2
	ldsw	[%i1+0x028],%l0		! %l0 = 000000006683e588
!	Mem[00000000100c1410] = 94491724, %l1 = 000000000000006e
	lduba	[%i3+%o5]0x80,%l1	! %l1 = 0000000000000094
	membar	#Sync			! Added by membar checker (11)
!	Mem[0000000030141400] = 94491724 00000000 4999c199 630069d9
!	Mem[0000000030141410] = 00e25d08 412ccb02 3b1ed75a 1b41e871
!	Mem[0000000030141420] = 2723af57 bac23955 f2e25d08 99c1993d
!	Mem[0000000030141430] = 93ab8046 52e548c3 7403c892 43ca1dd3
	ldda	[%i5]ASI_BLK_AIUS,%f0	! Block Load from 0000000030141400
!	Mem[00000000100c1400] = 783d37e1fd5bd8d9, %f18 = d9690000 11c20000
	ldda	[%i3+%g0]0x88,%f18	! %f18 = 783d37e1 fd5bd8d9
!	Starting 10 instruction Store Burst
!	%l2 = ffffffffffff9449, %l5 = f2e25d08290000ff, %l0 = 000000006683e588
	and	%l2,%l5,%l0		! %l0 = f2e25d0829000049

p0_label_54:
!	%l5 = f2e25d08290000ff, Mem[0000000010001400] = 1dff00000000cfff
	stxa	%l5,[%i0+%g0]0x88	! Mem[0000000010001400] = f2e25d08290000ff
!	%f20 = 94491724 061dd94d, %l0 = f2e25d0829000049
!	Mem[0000000010041430] = 85ffdf37a3bf2890
	add	%i1,0x030,%g1
	stda	%f20,[%g1+%l0]ASI_PST32_P ! Mem[0000000010041430] = 85ffdf37061dd94d
!	%l3 = ffffffffffffde0f, Mem[0000000010181434] = edd6e5c6
	stw	%l3,[%i6+0x034]		! Mem[0000000010181434] = ffffde0f
!	%l6 = 0000000000000000, Mem[0000000010001400] = 290000ff
	stwa	%l6,[%i0+%g0]0x88	! Mem[0000000010001400] = 00000000
!	%l2 = ffff9449, %l3 = ffffde0f, Mem[00000000100c1410] = 24174994 c348e552
	stda	%l2,[%i3+%o5]0x88	! Mem[00000000100c1410] = ffff9449 ffffde0f
!	%l6 = 00000000, %l7 = 24174994, Mem[0000000010141410] = 00000000 67ffb230
	stda	%l6,[%i5+%o5]0x80	! Mem[0000000010141410] = 00000000 24174994
!	%l5 = f2e25d08290000ff, Mem[00000000300c1410] = 00000000
	stba	%l5,[%i3+%o5]0x81	! Mem[00000000300c1410] = ff000000
!	%l0 = f2e25d0829000049, Mem[0000000010101408] = ffd91dff
	stba	%l0,[%i4+%o4]0x80	! Mem[0000000010101408] = 49d91dff
!	%l4 = 000000000000e137, Mem[0000000030081400] = 00000002
	stha	%l4,[%i2+%g0]0x81	! Mem[0000000030081400] = e1370002
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = 085de200, %l1 = 0000000000000094
	ldsha	[%i5+%o5]0x89,%l1	! %l1 = ffffffffffffe200

p0_label_55:
!	Mem[0000000010181408] = ffffcdb1, %l0 = f2e25d0829000049
	lduwa	[%i6+%o4]0x88,%l0	! %l0 = 00000000ffffcdb1
!	Mem[0000000010101400] = ffcf000008504e7f, %l3 = ffffffffffffde0f
	ldxa	[%i4+%g0]0x88,%l3	! %l3 = ffcf000008504e7f
!	Mem[0000000030081400] = f2e25d08 020037e1, %l4 = 0000e137, %l5 = 290000ff
	ldda	[%i2+%g0]0x89,%l4	! %l4 = 00000000020037e1 00000000f2e25d08
!	Mem[00000000201c0000] = 6eff851d, %l3 = ffcf000008504e7f
	ldsba	[%o0+0x001]%asi,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010001400] = 00000000085de2f2, %f18 = 783d37e1 fd5bd8d9
	ldda	[%i0+%g0]0x80,%f18	! %f18 = 00000000 085de2f2
!	Mem[0000000030101408] = c1000000, %l6 = 0000000000000000
	ldsha	[%i4+%o4]0x81,%l6	! %l6 = ffffffffffffc100
!	Mem[0000000010181434] = ffffde0f, %l2 = ffffffffffff9449
	ldsh	[%i6+0x036],%l2		! %l2 = ffffffffffffde0f
!	Mem[0000000030081410] = ff1dd94d, %l5 = 00000000f2e25d08
	lduwa	[%i2+%o5]0x81,%l5	! %l5 = 00000000ff1dd94d
!	Mem[00000000201c0000] = 6eff851d, %l2 = ffffffffffffde0f
	lduba	[%o0+0x000]%asi,%l2	! %l2 = 000000000000006e
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (12)
!	%l2 = 000000000000006e, Mem[0000000030141400] = 24174994
	stba	%l2,[%i5+%g0]0x89	! Mem[0000000030141400] = 2417496e

!	Check Point 11 for processor 0

	set	p0_check_pt_data_11,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 00000000ffffcdb1
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = ffffffffffffe200
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 000000000000006e
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = ffffffffffffffff
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 00000000020037e1
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 00000000ff1dd94d
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = ffffffffffffc100
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = 94491724 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x48],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = 4999c199 630069d9
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x50],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 00e25d08 412ccb02
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x58],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 3b1ed75a 1b41e871
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x60],%g3
	std	%f8,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f8 = 2723af57 bac23955
	bne	%xcc,p0_freg_check_fail
	mov	0xf08,%g1
	ldx	[%g4+0x68],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = f2e25d08 99c1993d
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x70],%g3
	std	%f12,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f12 = 93ab8046 52e548c3
	bne	%xcc,p0_freg_check_fail
	mov	0xf12,%g1
	ldx	[%g4+0x78],%g3
	std	%f14,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f14 = 7403c892 43ca1dd3
	bne	%xcc,p0_freg_check_fail
	mov	0xf14,%g1
	ldx	[%g4+0x80],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = 00000000 085de2f2
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1
	ldx	[%g4+0x88],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = 8f84d76d 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1

!	Check Point 11 completed


p0_label_56:
!	Mem[0000000010001408] = 3d99c199, %l1 = ffffffffffffe200
	ldstuba	[%i0+%o4]0x80,%l1	! %l1 = 0000003d000000ff
!	%l0 = ffffcdb1, %l1 = 0000003d, Mem[0000000030081408] = 00000000 000094ef
	stda	%l0,[%i2+%o4]0x81	! Mem[0000000030081408] = ffffcdb1 0000003d
!	Mem[0000000030041410] = ff000000, %l2 = 000000000000006e
	swapa	[%i1+%o5]0x81,%l2	! %l2 = 00000000ff000000
!	%l0 = 00000000ffffcdb1, Mem[0000000010081400] = 00000000
	stha	%l0,[%i2+%g0]0x80	! Mem[0000000010081400] = cdb10000
!	%l2 = ff000000, %l3 = ffffffff, Mem[0000000010141400] = ffd49157 08504e7f
	std	%l2,[%i5+%g0]		! Mem[0000000010141400] = ff000000 ffffffff
!	%l0 = 00000000ffffcdb1, Mem[0000000010081408] = 00000065
	stba	%l0,[%i2+%o4]0x80	! Mem[0000000010081408] = b1000065
!	%l1 = 000000000000003d, Mem[0000000030181408] = 00000000
	stha	%l1,[%i6+%o4]0x89	! Mem[0000000030181408] = 0000003d
!	Mem[00000000300c1408] = 827cf18e, %l3 = ffffffffffffffff
	swapa	[%i3+%o4]0x89,%l3	! %l3 = 00000000827cf18e
!	%l1 = 000000000000003d, Mem[00000000201c0000] = 6eff851d
	stb	%l1,[%o0+%g0]		! Mem[00000000201c0000] = 3dff851d
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = 7f4e5008, %l0 = 00000000ffffcdb1
	lduba	[%i4+%g0]0x80,%l0	! %l0 = 000000000000007f

p0_label_57:
!	Mem[0000000010001410] = f6ffff1d35ade525, %f16 = 9028bfa3 d102b5cd
	ldda	[%i0+%o5]0x80,%f16	! %f16 = f6ffff1d 35ade525
!	Mem[00000000201c0000] = 3dff851d, %l0 = 000000000000007f
	lduh	[%o0+%g0],%l0		! %l0 = 0000000000003dff
!	Mem[0000000010001410] = f6ffff1d, %l7 = 0000000024174994
	lduwa	[%i0+%o5]0x80,%l7	! %l7 = 00000000f6ffff1d
!	Mem[000000001000140c] = 00000000, %l3 = 00000000827cf18e
	ldsb	[%i0+0x00f],%l3		! %l3 = 0000000000000000
!	Mem[0000000030181408] = 3d0000005791dab5, %l3 = 0000000000000000
	ldxa	[%i6+%o4]0x81,%l3	! %l3 = 3d0000005791dab5
!	Mem[0000000030001400] = 0068ac26, %l3 = 3d0000005791dab5
	ldsba	[%i0+%g0]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000010001400] = 00000000, %l7 = 00000000f6ffff1d
	lduwa	[%i0+0x000]%asi,%l7	! %l7 = 0000000000000000
!	Mem[0000000010181400] = 0fde36ff, %f19 = 085de2f2
	lda	[%i6+%g0]0x80,%f19	! %f19 = 0fde36ff
!	Mem[0000000030081410] = e748b0a8 4dd91dff, %l2 = ff000000, %l3 = 00000000
	ldda	[%i2+%o5]0x89,%l2	! %l2 = 000000004dd91dff 00000000e748b0a8
!	Starting 10 instruction Store Burst
!	Mem[0000000010001400] = 00000000, %l1 = 000000000000003d
	swapa	[%i0+%g0]0x80,%l1	! %l1 = 0000000000000000

p0_label_58:
!	Mem[0000000030181410] = 00000000, %l7 = 0000000000000000
	ldstuba	[%i6+%o5]0x81,%l7	! %l7 = 00000000000000ff
!	%l2 = 000000004dd91dff, Mem[0000000010101400] = ffcf000008504e7f
	stxa	%l2,[%i4+%g0]0x88	! Mem[0000000010101400] = 000000004dd91dff
!	%f22 = ffd91dff 6dd7848f, %l4 = 00000000020037e1
!	Mem[0000000010081410] = 8f84d76d00000000
	add	%i2,0x010,%g1
	stda	%f22,[%g1+%l4]ASI_PST32_PL ! Mem[0000000010081410] = 8f84d76d00000000
!	Mem[0000000030041408] = ffd49157, %l7 = 0000000000000000
	swapa	[%i1+%o4]0x81,%l7	! %l7 = 00000000ffd49157
!	Mem[00000000100c1408] = 00000000, %l0 = 0000000000003dff
	swapa	[%i3+%o4]0x88,%l0	! %l0 = 0000000000000000
!	%f14 = 7403c892 43ca1dd3, Mem[0000000010041400] = 000000e2 00000000
	stda	%f14,[%i1+%g0]0x88	! Mem[0000000010041400] = 7403c892 43ca1dd3
!	%l4 = 020037e1, %l5 = ff1dd94d, Mem[0000000010041420] = 61c3a0f5 0000002c
	std	%l4,[%i1+0x020]		! Mem[0000000010041420] = 020037e1 ff1dd94d
!	Mem[0000000030141400] = 6e491724, %l6 = ffffffffffffc100
	ldstuba	[%i5+%g0]0x81,%l6	! %l6 = 0000006e000000ff
!	Mem[0000000030181410] = 000000ff, %l4 = 00000000020037e1
	ldstuba	[%i6+%o5]0x89,%l4	! %l4 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = ff3d0000, %l4 = 00000000000000ff
	lduwa	[%i3+%o4]0x80,%l4	! %l4 = 00000000ff3d0000

p0_label_59:
!	Mem[0000000010001410] = f6ffff1d, %l3 = 00000000e748b0a8
	ldswa	[%i0+%o5]0x80,%l3	! %l3 = fffffffff6ffff1d
!	Mem[0000000030181400] = 65d00000, %l2 = 000000004dd91dff
	lduwa	[%i6+%g0]0x89,%l2	! %l2 = 0000000065d00000
!	Mem[0000000021800100] = 7ed35a3e, %l3 = fffffffff6ffff1d
	ldsba	[%o3+0x101]%asi,%l3	! %l3 = ffffffffffffffd3
!	Mem[0000000010181408] = b1cdffff, %l0 = 0000000000000000
	ldswa	[%i6+%o4]0x80,%l0	! %l0 = ffffffffb1cdffff
!	Mem[0000000030181408] = 0000003d, %l4 = 00000000ff3d0000
	ldsha	[%i6+%o4]0x89,%l4	! %l4 = 000000000000003d
!	Mem[00000000100c1400] = d9d85bfd, %l5 = 00000000ff1dd94d
	lduba	[%i3+%g0]0x80,%l5	! %l5 = 00000000000000d9
!	Mem[0000000030081400] = e1370002 085de2f2, %l4 = 0000003d, %l5 = 000000d9
	ldda	[%i2+%g0]0x81,%l4	! %l4 = 00000000e1370002 00000000085de2f2
!	Mem[0000000010141408] = 00000000, %l2 = 0000000065d00000
	ldsha	[%i5+%o4]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000021800180] = 5f00d16c, %l1 = 0000000000000000
	lduba	[%o3+0x180]%asi,%l1	! %l1 = 000000000000005f
!	Starting 10 instruction Store Burst
!	Mem[0000000010001408] = 99c199ff, %l2 = 0000000000000000
	ldstuba	[%i0+%o4]0x88,%l2	! %l2 = 000000ff000000ff

p0_label_60:
!	Mem[0000000030001408] = ff000000, %l3 = ffffffffffffffd3
	ldstuba	[%i0+%o4]0x81,%l3	! %l3 = 000000ff000000ff
!	%f31 = 000000d0, Mem[0000000010001408] = ff99c199
	sta	%f31,[%i0+%o4]0x80	! Mem[0000000010001408] = 000000d0
!	Mem[0000000010041420] = 020037e1ff1dd94d, %l7 = 00000000ffd49157, %l0 = ffffffffb1cdffff
	add	%i1,0x20,%g1
	casxa	[%g1]0x80,%l7,%l0	! %l0 = 020037e1ff1dd94d
!	%l4 = e1370002, %l5 = 085de2f2, Mem[00000000100c1410] = 4994ffff 0fdeffff
	stda	%l4,[%i3+%o5]0x80	! Mem[00000000100c1410] = e1370002 085de2f2
!	Mem[0000000030141400] = 241749ff, %l6 = 000000000000006e
	ldstuba	[%i5+%g0]0x89,%l6	! %l6 = 000000ff000000ff
!	%l2 = 00000000000000ff, Mem[00000000201c0000] = 3dff851d
	stb	%l2,[%o0+%g0]		! Mem[00000000201c0000] = ffff851d
!	Mem[0000000010101400] = ff1dd94d, %l1 = 000000000000005f
	ldstuba	[%i4+%g0]0x80,%l1	! %l1 = 000000ff000000ff
!	Mem[0000000030001408] = 000000ff, %l0 = 020037e1ff1dd94d
	swapa	[%i0+%o4]0x89,%l0	! %l0 = 00000000000000ff
!	%l7 = 00000000ffd49157, Mem[0000000010141428] = 26ac631be1629794, %asi = 80
	stxa	%l7,[%i5+0x028]%asi	! Mem[0000000010141428] = 00000000ffd49157
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = cdb10000, %l7 = 00000000ffd49157
	ldswa	[%i2+%g0]0x80,%l7	! %l7 = ffffffffcdb10000

!	Check Point 12 for processor 0

	set	p0_check_pt_data_12,%g4
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
	cmp	%l2,%g2			! %l2 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 00000000e1370002
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 00000000085de2f2
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = ffffffffcdb10000
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = 4999c199 630069d9
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x50],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 00e25d08 412ccb02
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x58],%g3
	std	%f16,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f16 = f6ffff1d 35ade525
	bne	%xcc,p0_freg_check_fail
	mov	0xf16,%g1
	ldx	[%g4+0x60],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = 00000000 0fde36ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1

!	Check Point 12 completed


p0_label_61:
!	Mem[0000000020800040] = 0060b8ec, %l0 = 00000000000000ff
	lduba	[%o1+0x041]%asi,%l0	! %l0 = 0000000000000060
!	Mem[0000000010141428] = 00000000, %l1 = 00000000000000ff
	ldsh	[%i5+0x02a],%l1		! %l1 = 0000000000000000
!	Mem[0000000030041400] = cac100ff, %l5 = 00000000085de2f2
	ldsha	[%i1+%g0]0x81,%l5	! %l5 = ffffffffffffcac1
!	%f16 = f6ffff1d 35ade525, Mem[0000000010101400] = 4dd91dff 00000000
	stda	%f16,[%i4+%g0]0x88	! Mem[0000000010101400] = f6ffff1d 35ade525
!	Mem[0000000030081408] = ffffcdb1, %f9  = bac23955
	lda	[%i2+%o4]0x81,%f9 	! %f9 = ffffcdb1
!	Mem[0000000010081408] = b1000065, %l7 = ffffffffcdb10000
	lduwa	[%i2+%o4]0x80,%l7	! %l7 = 00000000b1000065
!	Mem[0000000030181400] = dbae39bf 65d00000, %l4 = e1370002, %l5 = ffffcac1
	ldda	[%i6+%g0]0x89,%l4	! %l4 = 0000000065d00000 00000000dbae39bf
!	Mem[0000000010041408] = 63accd66, %l4 = 0000000065d00000
	ldswa	[%i1+%o4]0x88,%l4	! %l4 = 0000000063accd66
!	Mem[0000000010001400] = 0000003d, %l4 = 0000000063accd66
	lduha	[%i0+%g0]0x80,%l4	! %l4 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010141420] = 6ad32ca60319074f, %l6 = 00000000000000ff, %l4 = 0000000000000000
	add	%i5,0x20,%g1
	casxa	[%g1]0x80,%l6,%l4	! %l4 = 6ad32ca60319074f

p0_label_62:
!	%f24 = 8f84d76d 00000000, Mem[0000000010001408] = d0000000 00000000
	stda	%f24,[%i0+%o4]0x88	! Mem[0000000010001408] = 8f84d76d 00000000
!	%l1 = 0000000000000000, Mem[0000000010101410] = 0000c689
	stwa	%l1,[%i4+%o5]0x88	! Mem[0000000010101410] = 00000000
!	%l1 = 0000000000000000, Mem[0000000010081400] = 0000b1cd
	stha	%l1,[%i2+%g0]0x88	! Mem[0000000010081400] = 00000000
!	%l2 = 00000000000000ff, Mem[0000000010141400] = ffffffff000000ff
	stxa	%l2,[%i5+%g0]0x88	! Mem[0000000010141400] = 00000000000000ff
!	%l5 = 00000000dbae39bf, Mem[0000000010141430] = 8c6b34b002d1ceb3
	stx	%l5,[%i5+0x030]		! Mem[0000000010141430] = 00000000dbae39bf
!	%l7 = 00000000b1000065, Mem[0000000030101410] = 630069d9
	stwa	%l7,[%i4+%o5]0x81	! Mem[0000000030101410] = b1000065
!	%l1 = 0000000000000000, Mem[0000000030101400] = 0000000000000000
	stxa	%l1,[%i4+%g0]0x89	! Mem[0000000030101400] = 0000000000000000
!	%l0 = 00000060, %l1 = 00000000, Mem[0000000010101408] = ff1dd949 0068acff
	stda	%l0,[%i4+%o4]0x88	! Mem[0000000010101408] = 00000060 00000000
!	Mem[0000000010101400] = 35ade525, %l3 = 00000000000000ff
	ldstuba	[%i4+%g0]0x88,%l3	! %l3 = 00000025000000ff
!	Starting 10 instruction Load Burst
!	%l2 = 00000000000000ff, imm = fffffffffffff5c2, %l0 = 0000000000000060
	andn	%l2,-0xa3e,%l0		! %l0 = 000000000000003d

p0_label_63:
!	Mem[0000000010101410] = 00000000, %l4 = 6ad32ca60319074f
	ldswa	[%i4+%o5]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000010081410] = 8f84d76d, %l6 = 00000000000000ff
	ldsba	[%i2+%o5]0x80,%l6	! %l6 = ffffffffffffff8f
!	Mem[00000000100c1438] = a8490643, %l0 = 000000000000003d
	ldswa	[%i3+0x038]%asi,%l0	! %l0 = ffffffffa8490643
!	Mem[0000000010041418] = efa6d8e09085fb95, %l0 = ffffffffa8490643
	ldx	[%i1+0x018],%l0		! %l0 = efa6d8e09085fb95
!	Mem[0000000030081400] = 020037e1, %l6 = ffffffffffffff8f
	ldswa	[%i2+%g0]0x89,%l6	! %l6 = 00000000020037e1
!	Mem[0000000010041408] = 66cdac63, %l4 = 0000000000000000
	lduwa	[%i1+%o4]0x80,%l4	! %l4 = 0000000066cdac63
!	Mem[0000000010041400] = d31dca4392c80374, %l4 = 0000000066cdac63
	ldx	[%i1+%g0],%l4		! %l4 = d31dca4392c80374
!	%f22 = ffd91dff 6dd7848f, Mem[0000000010001408] = 00000000 8f84d76d
	stda	%f22,[%i0+%o4]0x88	! Mem[0000000010001408] = ffd91dff 6dd7848f
!	Mem[0000000010001408] = ffd91dff6dd7848f, %l5 = 00000000dbae39bf
	ldxa	[%i0+%o4]0x88,%l5	! %l5 = ffd91dff6dd7848f
!	Starting 10 instruction Store Burst
!	%f16 = f6ffff1d 35ade525 00000000 0fde36ff
!	%f20 = 94491724 061dd94d ffd91dff 6dd7848f
!	%f24 = 8f84d76d 00000000 f2e25d08 99c1993d
!	%f28 = 00000000 00000000 00000000 000000d0
	stda	%f16,[%i0]ASI_COMMIT_P	! Block Store to 0000000010001400

p0_label_64:
!	%l4 = d31dca4392c80374, Mem[0000000030001410] = ff000000
	stba	%l4,[%i0+%o5]0x89	! Mem[0000000030001410] = ff000074
!	Mem[0000000030001400] = 26ac6800, %l6 = 00000000020037e1
	ldstuba	[%i0+%g0]0x89,%l6	! %l6 = 00000000000000ff
	membar	#Sync			! Added by membar checker (13)
!	%l0 = efa6d8e09085fb95, Mem[0000000010001408] = 00000000
	stba	%l0,[%i0+%o4]0x88	! Mem[0000000010001408] = 00000095
!	Mem[00000000300c1408] = ffffffff, %l7 = 00000000b1000065
	ldstuba	[%i3+%o4]0x81,%l7	! %l7 = 000000ff000000ff
!	%l4 = d31dca4392c80374, Mem[0000000020800000] = 77ff9984
	stb	%l4,[%o1+%g0]		! Mem[0000000020800000] = 74ff9984
!	%f16 = f6ffff1d 35ade525, %l5 = ffd91dff6dd7848f
!	Mem[0000000010141408] = 00000000000000d0
	add	%i5,0x008,%g1
	stda	%f16,[%g1+%l5]ASI_PST8_PL ! Mem[0000000010141408] = 25e5ad35000000f6
!	Mem[00000000100c1410] = e1370002, %l5 = ffd91dff6dd7848f
	swapa	[%i3+%o5]0x80,%l5	! %l5 = 00000000e1370002
!	%l3 = 0000000000000025, Mem[0000000010001410] = 24174994
	stba	%l3,[%i0+%o5]0x88	! Mem[0000000010001410] = 24174925
!	%l0 = efa6d8e09085fb95, Mem[0000000010101408] = 00000060
	stwa	%l0,[%i4+%o4]0x88	! Mem[0000000010101408] = 9085fb95
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = 6e000000, %l7 = 00000000000000ff
	ldsha	[%i1+%o5]0x89,%l7	! %l7 = 0000000000000000

p0_label_65:
!	Mem[0000000010081408] = b1000065, %l3 = 0000000000000025
	ldsha	[%i2+%o4]0x80,%l3	! %l3 = ffffffffffffb100
!	Mem[0000000030101408] = c1000000, %l7 = 0000000000000000
	ldsba	[%i4+%o4]0x81,%l7	! %l7 = ffffffffffffffc1
!	Mem[0000000010101400] = ffe5ad35, %l4 = d31dca4392c80374
	ldsw	[%i4+%g0],%l4		! %l4 = ffffffffffe5ad35
!	Mem[0000000030141408] = 99c19949, %f10 = f2e25d08
	lda	[%i5+%o4]0x89,%f10	! %f10 = 99c19949
!	Mem[00000000100c1410] = 6dd7848f, %l3 = ffffffffffffb100
	lduha	[%i3+%o5]0x80,%l3	! %l3 = 0000000000006dd7
!	Mem[0000000010141424] = 0319074f, %f30 = 00000000
	lda	[%i5+0x024]%asi,%f30	! %f30 = 0319074f
!	Mem[0000000010001408] = 95000000, %l5 = 00000000e1370002
	lduha	[%i0+%o4]0x80,%l5	! %l5 = 0000000000009500
!	Mem[00000000300c1400] = ffffffffffff9449, %f22 = ffd91dff 6dd7848f
	ldda	[%i3+%g0]0x89,%f22	! %f22 = ffffffff ffff9449
!	Mem[00000000300c1400] = 4994ffff, %l4 = ffffffffffe5ad35
	ldsha	[%i3+%g0]0x81,%l4	! %l4 = 0000000000004994
!	Starting 10 instruction Store Burst
!	Mem[0000000010181408] = ffffcdb1, %l4 = 0000000000004994
	ldstuba	[%i6+%o4]0x88,%l4	! %l4 = 000000b1000000ff

!	Check Point 13 for processor 0

	set	p0_check_pt_data_13,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = efa6d8e09085fb95
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 0000000000000000
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l3,%g2			! %l3 = 0000000000006dd7
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l4,%g2			! %l4 = 00000000000000b1
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l5,%g2			! %l5 = 0000000000009500
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l6,%g2			! %l6 = 0000000000000000
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l7,%g2			! %l7 = ffffffffffffffc1
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x40],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 00e25d08 412ccb02
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x48],%g3
	std	%f8,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f8 = 2723af57 ffffcdb1
	bne	%xcc,p0_freg_check_fail
	mov	0xf08,%g1
	ldx	[%g4+0x50],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = 99c19949 99c1993d
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x58],%g3
	std	%f22,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f22 = ffffffff ffff9449
	bne	%xcc,p0_freg_check_fail
	mov	0xf22,%g1
	ldx	[%g4+0x60],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = 0319074f 000000d0
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 13 completed


p0_label_66:
!	%f28 = 00000000 00000000, Mem[0000000010041408] = 63accd66 8d2ba881
	stda	%f28,[%i1+%o4]0x88	! Mem[0000000010041408] = 00000000 00000000
!	Mem[0000000010041410] = ff000029, %l0 = efa6d8e09085fb95
	swapa	[%i1+%o5]0x80,%l0	! %l0 = 00000000ff000029
!	%l5 = 0000000000009500, Mem[0000000010001400] = f6ffff1d
	stwa	%l5,[%i0+%g0]0x80	! Mem[0000000010001400] = 00009500
!	Mem[0000000030081410] = 4dd91dff, %l7 = ffffffffffffffc1
	swapa	[%i2+%o5]0x89,%l7	! %l7 = 000000004dd91dff
!	%l1 = 0000000000000000, Mem[0000000010181428] = e1373d78
	stw	%l1,[%i6+0x028]		! Mem[0000000010181428] = 00000000
!	%l3 = 0000000000006dd7, Mem[00000000100c1408] = ff3d0000
	stba	%l3,[%i3+%o4]0x80	! Mem[00000000100c1408] = d73d0000
!	%f21 = 061dd94d, Mem[00000000300c1408] = ffffffff
	sta	%f21,[%i3+%o4]0x81	! Mem[00000000300c1408] = 061dd94d
!	%l0 = 00000000ff000029, Mem[0000000010041400] = d31dca4392c80374
	stxa	%l0,[%i1+%g0]0x80	! Mem[0000000010041400] = 00000000ff000029
!	%f0  = 94491724 00000000 4999c199 630069d9
!	%f4  = 00e25d08 412ccb02 3b1ed75a 1b41e871
!	%f8  = 2723af57 ffffcdb1 99c19949 99c1993d
!	%f12 = 93ab8046 52e548c3 7403c892 43ca1dd3
	stda	%f0,[%i1]ASI_BLK_AIUS	! Block Store to 0000000030041400
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = 00000000, %l5 = 0000000000009500
	ldsha	[%i4+%o5]0x88,%l5	! %l5 = 0000000000000000

p0_label_67:
!	Mem[000000001018140c] = 00000000, %l6 = 0000000000000000
	ldsh	[%i6+0x00c],%l6		! %l6 = 0000000000000000
!	Mem[0000000030081408] = ffffcdb10000003d, %l5 = 0000000000000000
	ldxa	[%i2+%o4]0x81,%l5	! %l5 = ffffcdb10000003d
	membar	#Sync			! Added by membar checker (14)
!	Mem[0000000010041400] = 00000000, %l7 = 000000004dd91dff
	lduba	[%i1+%g0]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000010041410] = 95fb8590, %l2 = 00000000000000ff
	lduha	[%i1+%o5]0x88,%l2	! %l2 = 0000000000008590
!	Mem[0000000030181410] = 000000ff, %l6 = 0000000000000000
	lduha	[%i6+%o5]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010041410] = f2e25d0895fb8590, %l0 = 00000000ff000029
	ldxa	[%i1+%o5]0x88,%l0	! %l0 = f2e25d0895fb8590
!	Mem[0000000030081410] = c1ffffff a8b048e7, %l2 = 00008590, %l3 = 00006dd7
	ldda	[%i2+%o5]0x81,%l2	! %l2 = 00000000c1ffffff 00000000a8b048e7
!	Mem[00000000300c1410] = 000000ff, %l3 = 00000000a8b048e7
	ldswa	[%i3+%o5]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030181400] = 65d00000, %f30 = 0319074f
	lda	[%i6+%g0]0x89,%f30	! %f30 = 65d00000
!	Starting 10 instruction Store Burst
!	Mem[0000000030101400] = 00000000, %l7 = 0000000000000000
	swapa	[%i4+%g0]0x81,%l7	! %l7 = 0000000000000000

p0_label_68:
!	%l4 = 00000000000000b1, Mem[0000000010101408] = 9085fb95
	stwa	%l4,[%i4+%o4]0x88	! Mem[0000000010101408] = 000000b1
!	%f2  = 4999c199, Mem[0000000030001408] = ff1dd94d
	sta	%f2 ,[%i0+%o4]0x89	! Mem[0000000030001408] = 4999c199
!	%f8  = 2723af57 ffffcdb1, Mem[0000000010001400] = 00950000 25e5ad35
	stda	%f8 ,[%i0+%g0]0x88	! Mem[0000000010001400] = 2723af57 ffffcdb1
!	Mem[0000000030001408] = 4999c199, %l0 = f2e25d0895fb8590
	swapa	[%i0+%o4]0x89,%l0	! %l0 = 000000004999c199
!	%f8  = 2723af57 ffffcdb1, Mem[0000000010181400] = ff36de0f 8ef17c82
	stda	%f8 ,[%i6+%g0]0x88	! Mem[0000000010181400] = 2723af57 ffffcdb1
!	%f14 = 7403c892 43ca1dd3, %l7 = 0000000000000000
!	Mem[0000000010141408] = 25e5ad35000000f6
	add	%i5,0x008,%g1
	stda	%f14,[%g1+%l7]ASI_PST16_PL ! Mem[0000000010141408] = 25e5ad35000000f6
!	Mem[000000001018143d] = 978a5a90, %l0 = 000000004999c199
	ldstuba	[%i6+0x03d]%asi,%l0	! %l0 = 0000008a000000ff
!	%f23 = ffff9449, Mem[0000000010101410] = 00000000
	sta	%f23,[%i4+%o5]0x80	! Mem[0000000010101410] = ffff9449
!	Mem[00000000100c1400] = fd5bd8d9, %l3 = 00000000000000ff
	swapa	[%i3+%g0]0x88,%l3	! %l3 = 00000000fd5bd8d9
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = 63000000, %l3 = 00000000fd5bd8d9
	ldswa	[%i6+%o5]0x88,%l3	! %l3 = 0000000063000000

p0_label_69:
!	Mem[00000000300c1400] = ffff9449, %l5 = ffffcdb10000003d
	lduha	[%i3+%g0]0x89,%l5	! %l5 = 0000000000009449
!	%l0 = 000000000000008a, %l4 = 00000000000000b1, %l2 = 00000000c1ffffff
	xnor	%l0,%l4,%l2		! %l2 = ffffffffffffffc4
!	Mem[0000000010081404] = 00000000, %l5 = 0000000000009449
	ldswa	[%i2+0x004]%asi,%l5	! %l5 = 0000000000000000
!	Mem[00000000100c1408] = 00003dd7, %l1 = 0000000000000000
	lduha	[%i3+%o4]0x88,%l1	! %l1 = 0000000000003dd7
!	Mem[0000000010041418] = efa6d8e09085fb95, %f30 = 65d00000 000000d0
	ldda	[%i1+0x018]%asi,%f30	! %f30 = efa6d8e0 9085fb95
!	Mem[00000000100c1414] = 085de2f2, %l4 = 00000000000000b1
	lduwa	[%i3+0x014]%asi,%l4	! %l4 = 00000000085de2f2
!	Mem[00000000300c1408] = 061dd94d, %l0 = 000000000000008a
	lduwa	[%i3+%o4]0x81,%l0	! %l0 = 00000000061dd94d
!	Mem[0000000010141430] = 00000000, %f10 = 99c19949
	ld	[%i5+0x030],%f10	! %f10 = 00000000
!	Mem[0000000030181408] = 0000003d, %l3 = 0000000063000000
	ldswa	[%i6+%o4]0x89,%l3	! %l3 = 000000000000003d
!	Starting 10 instruction Store Burst
!	%l2 = ffffffffffffffc4, Mem[0000000010181418] = ffcf00000000008f, %asi = 80
	stxa	%l2,[%i6+0x018]%asi	! Mem[0000000010181418] = ffffffffffffffc4

p0_label_70:
!	%l0 = 00000000061dd94d, Mem[0000000010181408] = ffcdffff
	stba	%l0,[%i6+%o4]0x80	! Mem[0000000010181408] = 4dcdffff
!	%l7 = 0000000000000000, imm = 00000000000002e7, %l2 = ffffffffffffffc4
	xor	%l7,0x2e7,%l2		! %l2 = 00000000000002e7
!	%f2  = 4999c199 630069d9, Mem[0000000010141400] = ff000000 00000000
	stda	%f2 ,[%i5+0x000]%asi	! Mem[0000000010141400] = 4999c199 630069d9
!	%l0 = 00000000061dd94d, Mem[0000000010141400] = 4999c199
	stha	%l0,[%i5+%g0]0x80	! Mem[0000000010141400] = d94dc199
!	Mem[0000000010181418] = ffffffffffffffc4, %l3 = 000000000000003d, %l1 = 0000000000003dd7
	add	%i6,0x18,%g1
	casxa	[%g1]0x80,%l3,%l1	! %l1 = ffffffffffffffc4
!	Mem[0000000030001410] = 740000ff, %l2 = 00000000000002e7
	ldstuba	[%i0+%o5]0x81,%l2	! %l2 = 00000074000000ff
!	%l6 = 00000000000000ff, Mem[0000000030041400] = 94491724
	stwa	%l6,[%i1+%g0]0x81	! Mem[0000000030041400] = 000000ff
!	%l1 = ffffffffffffffc4, Mem[0000000030081400] = 020037e1
	stha	%l1,[%i2+%g0]0x89	! Mem[0000000030081400] = 0200ffc4
!	%f9  = ffffcdb1, Mem[0000000010041408] = 00000000
	sta	%f9 ,[%i1+0x008]%asi	! Mem[0000000010041408] = ffffcdb1
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = 65d00000, %l0 = 00000000061dd94d
	ldsba	[%i6+%g0]0x89,%l0	! %l0 = 0000000000000000

!	Check Point 14 for processor 0

	set	p0_check_pt_data_14,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 0000000000000000
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = ffffffffffffffc4
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 0000000000000074
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 000000000000003d
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 00000000085de2f2
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
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = 4999c199 630069d9
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x50],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = 00000000 99c1993d
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x58],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = efa6d8e0 9085fb95
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 14 completed


p0_label_71:
!	Mem[00000000211c0000] = 02d1a37b, %l0 = 0000000000000000
	ldsha	[%o2+0x000]%asi,%l0	! %l0 = 00000000000002d1
!	Mem[0000000030181400] = 65d00000, %l7 = 0000000000000000
	lduha	[%i6+%g0]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000010001424] = 00000000, %l1 = ffffffffffffffc4
	ldsha	[%i0+0x024]%asi,%l1	! %l1 = 0000000000000000
!	Mem[0000000010001438] = 00000000, %l0 = 00000000000002d1
	ldsba	[%i0+0x03a]%asi,%l0	! %l0 = 0000000000000000
!	Mem[0000000030081408] = 3d000000b1cdffff, %l0 = 0000000000000000
	ldxa	[%i2+%o4]0x89,%l0	! %l0 = 3d000000b1cdffff
!	Mem[0000000010141408] = 25e5ad35, %l0 = 3d000000b1cdffff
	ldsha	[%i5+%o4]0x80,%l0	! %l0 = 00000000000025e5
!	Mem[00000000211c0000] = 02d1a37b, %l1 = 0000000000000000
	lduh	[%o2+%g0],%l1		! %l1 = 00000000000002d1
!	Mem[0000000030081410] = ffffffc1, %l3 = 000000000000003d
	lduba	[%i2+%o5]0x89,%l3	! %l3 = 00000000000000c1
!	Mem[0000000030081400] = f2e25d08 0200ffc4, %l4 = 085de2f2, %l5 = 00000000
	ldda	[%i2+%g0]0x89,%l4	! %l4 = 000000000200ffc4 00000000f2e25d08
!	Starting 10 instruction Store Burst
!	%f26 = f2e25d08 99c1993d, Mem[0000000010181408] = ffffcd4d 00000000
	stda	%f26,[%i6+%o4]0x88	! Mem[0000000010181408] = f2e25d08 99c1993d

p0_label_72:
!	Mem[0000000010081400] = 00000000, %l4 = 000000000200ffc4
	lduba	[%i2+%g0]0x88,%l4	! %l4 = 0000000000000000
!	%f22 = ffffffff ffff9449, Mem[0000000010181410] = 63000000 977f3b57
	stda	%f22,[%i6+%o5]0x88	! Mem[0000000010181410] = ffffffff ffff9449
!	%l5 = 00000000f2e25d08, Mem[0000000030181400] = 0000d065
	stha	%l5,[%i6+%g0]0x81	! Mem[0000000030181400] = 5d08d065
!	%l1 = 00000000000002d1, Mem[0000000010141410] = 00000000, %asi = 80
	stha	%l1,[%i5+0x010]%asi	! Mem[0000000010141410] = 02d10000
!	Mem[0000000010181408] = 99c1993d, %l3 = 00000000000000c1
	ldstuba	[%i6+%o4]0x88,%l3	! %l3 = 0000003d000000ff
!	Mem[0000000010101410] = ffff9449, %l5 = 00000000f2e25d08
	swapa	[%i4+%o5]0x80,%l5	! %l5 = 00000000ffff9449
!	Mem[000000001000140a] = 95000000, %l6 = 00000000000000ff
	ldstub	[%i0+0x00a],%l6		! %l6 = 00000000000000ff
!	%l7 = 0000000000000000, Mem[0000000030181410] = ff000000
	stwa	%l7,[%i6+%o5]0x81	! Mem[0000000030181410] = 00000000
!	Mem[0000000030181410] = 00000000, %l7 = 0000000000000000
	swapa	[%i6+%o5]0x89,%l7	! %l7 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = 00000000, %l3 = 000000000000003d
	lduha	[%i1+%g0]0x80,%l3	! %l3 = 0000000000000000

p0_label_73:
	membar	#Sync			! Added by membar checker (15)
!	Mem[0000000030041400] = 000000ff 00000000 4999c199 630069d9
!	Mem[0000000030041410] = 00e25d08 412ccb02 3b1ed75a 1b41e871
!	Mem[0000000030041420] = 2723af57 ffffcdb1 99c19949 99c1993d
!	Mem[0000000030041430] = 93ab8046 52e548c3 7403c892 43ca1dd3
	ldda	[%i1]ASI_BLK_AIUS,%f0	! Block Load from 0000000030041400
!	Mem[0000000010141408] = 25e5ad35000000f6, %f22 = ffffffff ffff9449
	ldd	[%i5+%o4],%f22		! %f22 = 25e5ad35 000000f6
!	Mem[00000000300c1400] = ffffffffffff9449, %l3 = 0000000000000000
	ldxa	[%i3+%g0]0x89,%l3	! %l3 = ffffffffffff9449
!	Mem[0000000030081410] = c1ffffff, %l1 = 00000000000002d1
	ldsba	[%i2+%o5]0x81,%l1	! %l1 = ffffffffffffffc1
!	Mem[0000000020800040] = 0060b8ec, %l3 = ffffffffffff9449
	lduba	[%o1+0x041]%asi,%l3	! %l3 = 0000000000000060
!	Mem[0000000030141408] = 4999c199, %l2 = 0000000000000074
	lduwa	[%i5+%o4]0x81,%l2	! %l2 = 000000004999c199
!	Mem[00000000300c1400] = 4994ffff, %l1 = ffffffffffffffc1
	ldsba	[%i3+%g0]0x81,%l1	! %l1 = 0000000000000049
!	Mem[0000000010081420] = 5539c2ba, %l0 = 00000000000025e5
	lduh	[%i2+0x022],%l0		! %l0 = 000000000000c2ba
!	Mem[00000000211c0000] = 02d1a37b, %l4 = 0000000000000000
	lduh	[%o2+%g0],%l4		! %l4 = 00000000000002d1
!	Starting 10 instruction Store Burst
!	Mem[0000000030181410] = 00000000, %l1 = 0000000000000049
	swapa	[%i6+%o5]0x81,%l1	! %l1 = 0000000000000000

p0_label_74:
!	%l6 = 00000000, %l7 = 00000000, Mem[0000000030181408] = 0000003d b5da9157
	stda	%l6,[%i6+%o4]0x89	! Mem[0000000030181408] = 00000000 00000000
!	Mem[00000000218001c0] = d6cf6d36, %l7 = 0000000000000000
	ldstub	[%o3+0x1c0],%l7		! %l7 = 000000d6000000ff
!	%l5 = 00000000ffff9449, Mem[0000000010001400] = b1cdffff57af2327
	stxa	%l5,[%i0+%g0]0x80	! Mem[0000000010001400] = 00000000ffff9449
!	%l6 = 0000000000000000, Mem[0000000010141420] = 6ad32ca60319074f
	stx	%l6,[%i5+0x020]		! Mem[0000000010141420] = 0000000000000000
!	%l0 = 000000000000c2ba, Mem[0000000030101410] = b1000065
	stwa	%l0,[%i4+%o5]0x81	! Mem[0000000030101410] = 0000c2ba
!	Mem[0000000010041410] = 9085fb95, %l7 = 00000000000000d6
	ldstuba	[%i1+%o5]0x80,%l7	! %l7 = 00000090000000ff
!	Mem[0000000021800000] = 543e57e0, %l4 = 00000000000002d1
	ldstuba	[%o3+0x000]%asi,%l4	! %l4 = 00000054000000ff
!	%l5 = 00000000ffff9449, Mem[0000000010101426] = 775bb616, %asi = 80
	stha	%l5,[%i4+0x026]%asi	! Mem[0000000010101424] = 775b9449
!	%f20 = 94491724 061dd94d, %l0 = 000000000000c2ba
!	Mem[00000000100c1430] = c062cc2e8f3533ff
	add	%i3,0x030,%g1
	stda	%f20,[%g1+%l0]ASI_PST16_PL ! Mem[00000000100c1430] = c0621d068f354994
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = 000000ff, %l1 = 0000000000000000
	ldsba	[%i1+%g0]0x81,%l1	! %l1 = 0000000000000000

p0_label_75:
!	Mem[0000000010041400] = 00000000, %f25 = 00000000
	ld	[%i1+%g0],%f25	! %f25 = 00000000
!	Mem[0000000030141408] = 4999c199, %l6 = 0000000000000000
	ldsha	[%i5+%o4]0x81,%l6	! %l6 = 0000000000004999
!	Mem[0000000030041408] = d9690063 99c19949, %l0 = 0000c2ba, %l1 = 00000000
	ldda	[%i1+%o4]0x89,%l0	! %l0 = 0000000099c19949 00000000d9690063
!	Mem[0000000030141400] = 241749ff, %l1 = 00000000d9690063
	lduha	[%i5+%g0]0x89,%l1	! %l1 = 00000000000049ff
!	Mem[0000000030001400] = ff68ac26, %f24 = 8f84d76d
	lda	[%i0+%g0]0x81,%f24	! %f24 = ff68ac26
!	Mem[0000000030041408] = 99c19949, %f16 = f6ffff1d
	lda	[%i1+%o4]0x89,%f16	! %f16 = 99c19949
!	Mem[00000000300c1410] = ff000000, %l3 = 0000000000000060
	ldswa	[%i3+%o5]0x81,%l3	! %l3 = ffffffffff000000
!	Mem[0000000030181410] = 8f84d76d49000000, %l6 = 0000000000004999
	ldxa	[%i6+%o5]0x89,%l6	! %l6 = 8f84d76d49000000
!	%l3 = ffffffffff000000, Mem[00000000300c1400] = 4994ffff
	stba	%l3,[%i3+%g0]0x81	! Mem[00000000300c1400] = 0094ffff
!	Starting 10 instruction Store Burst
!	%l6 = 8f84d76d49000000, Mem[0000000030181408] = 00000000
	stha	%l6,[%i6+%o4]0x89	! Mem[0000000030181408] = 00000000

!	Check Point 15 for processor 0

	set	p0_check_pt_data_15,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 0000000099c19949
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 00000000000049ff
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 000000004999c199
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = ffffffffff000000
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 0000000000000054
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l6,%g2			! %l6 = 8f84d76d49000000
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l7,%g2			! %l7 = 0000000000000090
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x40],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = 000000ff 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x48],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = 4999c199 630069d9
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x50],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 00e25d08 412ccb02
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x58],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 3b1ed75a 1b41e871
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x60],%g3
	std	%f8,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f8 = 2723af57 ffffcdb1
	bne	%xcc,p0_freg_check_fail
	mov	0xf08,%g1
	ldx	[%g4+0x68],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = 99c19949 99c1993d
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x70],%g3
	std	%f12,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f12 = 93ab8046 52e548c3
	bne	%xcc,p0_freg_check_fail
	mov	0xf12,%g1
	ldx	[%g4+0x78],%g3
	std	%f14,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f14 = 7403c892 43ca1dd3
	bne	%xcc,p0_freg_check_fail
	mov	0xf14,%g1
	ldx	[%g4+0x80],%g3
	std	%f16,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f16 = 99c19949 35ade525
	bne	%xcc,p0_freg_check_fail
	mov	0xf16,%g1
	ldx	[%g4+0x88],%g3
	std	%f22,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f22 = 25e5ad35 000000f6
	bne	%xcc,p0_freg_check_fail
	mov	0xf22,%g1
	ldx	[%g4+0x90],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = ff68ac26 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1

!	Check Point 15 completed


p0_label_76:
!	%l7 = 0000000000000090, Mem[00000000201c0000] = ffff851d
	stb	%l7,[%o0+%g0]		! Mem[00000000201c0000] = 90ff851d
	membar	#Sync			! Added by membar checker (16)
!	%f0  = 000000ff 00000000, Mem[0000000030041400] = ff000000 00000000
	stda	%f0 ,[%i1+%g0]0x89	! Mem[0000000030041400] = 000000ff 00000000
!	Mem[0000000010141400] = d94dc199, %l7 = 0000000000000090
	ldstuba	[%i5+%g0]0x80,%l7	! %l7 = 000000d9000000ff
!	Mem[0000000030181408] = 00000000, %l6 = 8f84d76d49000000
	ldstuba	[%i6+%o4]0x89,%l6	! %l6 = 00000000000000ff
!	%l1 = 00000000000049ff, Mem[0000000030141400] = 241749ff
	stba	%l1,[%i5+%g0]0x89	! Mem[0000000030141400] = 241749ff
!	Mem[0000000010141410] = 02d10000, %l7 = 00000000000000d9
	lduba	[%i5+%o5]0x80,%l7	! %l7 = 0000000000000002
!	%l0 = 0000000099c19949, Mem[0000000010181418] = ffffffff
	stb	%l0,[%i6+0x018]		! Mem[0000000010181418] = 49ffffff
!	%l6 = 0000000000000000, Mem[0000000010101408] = b1000000
	stba	%l6,[%i4+%o4]0x80	! Mem[0000000010101408] = 00000000
!	Mem[0000000030041408] = 4999c199, %l2 = 000000004999c199
	ldstuba	[%i1+%o4]0x81,%l2	! %l2 = 00000049000000ff
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (17)
!	Mem[0000000010141400] = ff4dc199 630069d9 25e5ad35 000000f6
!	Mem[0000000010141410] = 02d10000 24174994 ce9ee590 e2b9cac1
!	Mem[0000000010141420] = 00000000 00000000 00000000 ffd49157
!	Mem[0000000010141430] = 00000000 dbae39bf 50b9a13d e0d68277
	ldda	[%i5]ASI_BLK_AIUPL,%f0	! Block Load from 0000000010141400

p0_label_77:
!	Mem[0000000030041400] = 000000ff00000000, %l0 = 0000000099c19949
	ldxa	[%i1+%g0]0x89,%l0	! %l0 = 000000ff00000000
!	Mem[0000000010081408] = b1000065, %l0 = 000000ff00000000
	ldsba	[%i2+%o4]0x80,%l0	! %l0 = ffffffffffffffb1
!	Mem[0000000030181400] = dbae39bf 65d0085d, %l2 = 00000049, %l3 = ff000000
	ldda	[%i6+%g0]0x89,%l2	! %l2 = 0000000065d0085d 00000000dbae39bf
!	Mem[0000000010081400] = 0000000000000000, %f18 = 00000000 0fde36ff
	ldda	[%i2+%g0]0x88,%f18	! %f18 = 00000000 00000000
!	Mem[0000000010081400] = 00000000, %l5 = 00000000ffff9449
	ldsba	[%i2+%g0]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000020800000] = 74ff9984, %l7 = 0000000000000002
	lduba	[%o1+0x001]%asi,%l7	! %l7 = 00000000000000ff
!	Mem[00000000100c1420] = ef940000, %l0 = ffffffffffffffb1
	lduba	[%i3+0x023]%asi,%l0	! %l0 = 0000000000000000
!	Mem[0000000010101424] = 775b9449, %l5 = 0000000000000000
	lduwa	[%i4+0x024]%asi,%l5	! %l5 = 00000000775b9449
!	Mem[000000001010140c] = 00000000, %l1 = 00000000000049ff
	lduwa	[%i4+0x00c]%asi,%l1	! %l1 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f26 = f2e25d08, Mem[0000000030081408] = ffffcdb1
	sta	%f26,[%i2+%o4]0x81	! Mem[0000000030081408] = f2e25d08

p0_label_78:
!	%l6 = 0000000000000000, Mem[00000000300c1400] = ffff9400
	stha	%l6,[%i3+%g0]0x89	! Mem[00000000300c1400] = ffff0000
!	Mem[0000000010141408] = 25e5ad35, %l6 = 0000000000000000
	ldstuba	[%i5+%o4]0x80,%l6	! %l6 = 00000025000000ff
!	%l4 = 0000000000000054, Mem[0000000030181410] = 00000049
	stwa	%l4,[%i6+%o5]0x81	! Mem[0000000030181410] = 00000054
!	%l3 = 00000000dbae39bf, Mem[0000000010041400] = 00000000ff000029
	stxa	%l3,[%i1+%g0]0x80	! Mem[0000000010041400] = 00000000dbae39bf
	membar	#Sync			! Added by membar checker (18)
!	%f18 = 00000000 00000000, %l0 = 0000000000000000
!	Mem[0000000010141418] = ce9ee590e2b9cac1
	add	%i5,0x018,%g1
	stda	%f18,[%g1+%l0]ASI_PST16_PL ! Mem[0000000010141418] = ce9ee590e2b9cac1
!	%l1 = 0000000000000000, Mem[00000000211c0000] = 02d1a37b
	sth	%l1,[%o2+%g0]		! Mem[00000000211c0000] = 0000a37b
!	%l4 = 0000000000000054, Mem[0000000030081408] = 085de2f2
	stba	%l4,[%i2+%o4]0x89	! Mem[0000000030081408] = 085de254
!	%f15 = 3da1b950, Mem[0000000030041410] = 085de200
	sta	%f15,[%i1+%o5]0x89	! Mem[0000000030041410] = 3da1b950
!	%f14 = 7782d6e0 3da1b950, Mem[0000000030041408] = 99c199ff d9690063
	stda	%f14,[%i1+%o4]0x89	! Mem[0000000030041408] = 7782d6e0 3da1b950
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = 00000000, %l4 = 0000000000000054
	lduba	[%i1+%g0]0x88,%l4	! %l4 = 0000000000000000

p0_label_79:
!	Mem[0000000010081408] = 650000b1, %l7 = 00000000000000ff
	ldsha	[%i2+%o4]0x88,%l7	! %l7 = 00000000000000b1
!	Mem[0000000010081400] = 00000000, %l4 = 0000000000000000
	ldsba	[%i2+%g0]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000010001408] = ff36de0f 00ff0095, %l2 = 65d0085d, %l3 = dbae39bf
	ldda	[%i0+%o4]0x88,%l2	! %l2 = 0000000000ff0095 00000000ff36de0f
!	Mem[0000000010001408] = 00ff0095, %l1 = 0000000000000000
	ldsba	[%i0+%o4]0x88,%l1	! %l1 = ffffffffffffff95
!	Mem[0000000030001410] = ff0000ff00000000, %l7 = 00000000000000b1
	ldxa	[%i0+%o5]0x81,%l7	! %l7 = ff0000ff00000000
!	Mem[0000000030001408] = 9085fb95, %l2 = 0000000000ff0095
	lduha	[%i0+%o4]0x81,%l2	! %l2 = 0000000000009085
!	Mem[0000000030081410] = c1ffffffa8b048e7, %l5 = 00000000775b9449
	ldxa	[%i2+%o5]0x81,%l5	! %l5 = c1ffffffa8b048e7
!	Mem[00000000300c1400] = 0000ffff, %l0 = 0000000000000000
	ldsba	[%i3+%g0]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000010081400] = 00000000, %l1 = ffffffffffffff95
	ldswa	[%i2+%g0]0x88,%l1	! %l1 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f10 = 5791d4ff 00000000, %l4 = 0000000000000000
!	Mem[0000000030181400] = 5d08d065bf39aedb
	stda	%f10,[%i6+%l4]ASI_PST32_SL ! Mem[0000000030181400] = 5d08d065bf39aedb

p0_label_80:
!	Mem[0000000010101414] = f2e25d08, %l4 = 0000000000000000
	ldstub	[%i4+0x014],%l4		! %l4 = 000000f2000000ff
!	Mem[0000000010181410] = ffff9449, %l4 = 00000000000000f2
	swapa	[%i6+%o5]0x88,%l4	! %l4 = 00000000ffff9449
!	Mem[0000000010181420] = 578fe6ff06909cc7, %l3 = 00000000ff36de0f, %l1 = 0000000000000000
	add	%i6,0x20,%g1
	casxa	[%g1]0x80,%l3,%l1	! %l1 = 578fe6ff06909cc7
!	%l7 = ff0000ff00000000, Mem[0000000010081410] = 8f84d76d
	stba	%l7,[%i2+%o5]0x80	! Mem[0000000010081410] = 0084d76d
!	Mem[00000000300c1400] = ffff0000, %l6 = 0000000000000025
	ldstuba	[%i3+%g0]0x89,%l6	! %l6 = 00000000000000ff
!	%l2 = 00009085, %l3 = ff36de0f, Mem[0000000030041408] = 50b9a13d e0d68277
	stda	%l2,[%i1+%o4]0x81	! Mem[0000000030041408] = 00009085 ff36de0f
!	Mem[0000000010081428] = 3d99c199, %l7 = ff0000ff00000000, %asi = 80
	swapa	[%i2+0x028]%asi,%l7	! %l7 = 000000003d99c199
!	%f26 = f2e25d08, Mem[0000000030041408] = 00009085
	sta	%f26,[%i1+%o4]0x81	! Mem[0000000030041408] = f2e25d08
!	Mem[0000000030041400] = 00000000, %l3 = 00000000ff36de0f
	ldstuba	[%i1+%g0]0x81,%l3	! %l3 = 00000000000000ff
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (19)
!	Mem[0000000010101400] = ffe5ad35 1dfffff6 00000000 00000000
!	Mem[0000000010101410] = f2e25d08 ffe25d08 cdb502d1 295bdcc7
!	Mem[0000000010101420] = 518a9713 775b9449 9c873bb5 6e1e92a8
!	Mem[0000000010101430] = b855c84f ed0f510e d9ff06f6 76945c96
	ldda	[%i4]ASI_BLK_P,%f16	! Block Load from 0000000010101400

!	Check Point 16 for processor 0

	set	p0_check_pt_data_16,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 0000000000000000
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 578fe6ff06909cc7
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 0000000000009085
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 0000000000000000
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 00000000ffff9449
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = c1ffffffa8b048e7
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 0000000000000000
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 000000003d99c199
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = d9690063 99c14dff
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x50],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = f6000000 35ade525
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x58],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 94491724 0000d102
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x60],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = c1cab9e2 90e59ece
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
	cmp	%g3,%g2			! %f10 = 5791d4ff 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x78],%g3
	std	%f12,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f12 = bf39aedb 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf12,%g1
	ldx	[%g4+0x80],%g3
	std	%f14,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f14 = 7782d6e0 3da1b950
	bne	%xcc,p0_freg_check_fail
	mov	0xf14,%g1
	ldx	[%g4+0x88],%g3
	std	%f16,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f16 = ffe5ad35 1dfffff6
	bne	%xcc,p0_freg_check_fail
	mov	0xf16,%g1
	ldx	[%g4+0x90],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = 00000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1
	ldx	[%g4+0x98],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = f2e25d08 ffe25d08
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1
	ldx	[%g4+0xa0],%g3
	std	%f22,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f22 = cdb502d1 295bdcc7
	bne	%xcc,p0_freg_check_fail
	mov	0xf22,%g1
	ldx	[%g4+0xa8],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = 518a9713 775b9449
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1
	ldx	[%g4+0xb0],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = 9c873bb5 6e1e92a8
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1
	ldx	[%g4+0xb8],%g3
	std	%f28,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f28 = b855c84f ed0f510e
	bne	%xcc,p0_freg_check_fail
	mov	0xf28,%g1
	ldx	[%g4+0xc0],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = d9ff06f6 76945c96
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 16 completed


p0_label_81:
!	Mem[0000000030141408] = 99c19949, %l6 = 0000000000000000
	ldsba	[%i5+%o4]0x89,%l6	! %l6 = 0000000000000049
!	Mem[0000000030081400] = 0200ffc4, %l5 = c1ffffffa8b048e7
	lduha	[%i2+%g0]0x89,%l5	! %l5 = 000000000000ffc4
!	Mem[0000000030081400] = c4ff0002 085de2f2 54e25d08 0000003d
!	Mem[0000000030081410] = c1ffffff a8b048e7 e6407e40 f7ab5055
!	Mem[0000000030081420] = d8e6ce4c 942fd014 75b9858d 1620328d
!	Mem[0000000030081430] = 71ab266e c09ea95a e7e90bfe 0d25a833
	ldda	[%i2]ASI_BLK_AIUS,%f16	! Block Load from 0000000030081400
!	Mem[00000000300c1400] = ffff00ff, %l0 = 0000000000000000
	ldsha	[%i3+%g0]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[00000000100c1400] = ff000000 e1373d78 d73d0000 00000000
!	Mem[00000000100c1410] = 6dd7848f 085de2f2 a8ff7509 abda6f33
!	Mem[00000000100c1420] = ef940000 00000000 d96af809 005f0000
!	Mem[00000000100c1430] = c0621d06 8f354994 a8490643 d9e62c7d
	ldda	[%i3]ASI_BLK_P,%f16	! Block Load from 00000000100c1400
!	Mem[00000000218000c0] = 0030d561, %l3 = 0000000000000000
	ldsh	[%o3+0x0c0],%l3		! %l3 = 0000000000000030
!	Mem[0000000010181408] = f2e25d0899c199ff, %f8  = 00000000 00000000
	ldda	[%i6+%o4]0x88,%f8 	! %f8  = f2e25d08 99c199ff
!	Mem[0000000010041438] = 9028bfa3 d102b5cd, %l0 = 000000ff, %l1 = 06909cc7
	ldda	[%i1+0x038]%asi,%l0	! %l0 = 000000009028bfa3 00000000d102b5cd
!	Mem[00000000300c1400] = ff00ffff, %l7 = 000000003d99c199
	ldswa	[%i3+%g0]0x81,%l7	! %l7 = ffffffffff00ffff
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (20)
!	%l0 = 9028bfa3, %l1 = d102b5cd, Mem[00000000100c1410] = 8f84d76d f2e25d08
	stda	%l0,[%i3+%o5]0x88	! Mem[00000000100c1410] = 9028bfa3 d102b5cd

p0_label_82:
!	%f18 = d73d0000, Mem[0000000030181410] = 00000054
	sta	%f18,[%i6+%o5]0x81	! Mem[0000000030181410] = d73d0000
!	Mem[0000000010041410] = 95fb85ff, %l5 = 000000000000ffc4
	ldstuba	[%i1+%o5]0x88,%l5	! %l5 = 000000ff000000ff
!	Mem[0000000010041418] = efa6d8e0, %l3 = 0000000000000030
	swap	[%i1+0x018],%l3		! %l3 = 00000000efa6d8e0
!	%l0 = 000000009028bfa3, Mem[0000000020800040] = 0060b8ec, %asi = 80
	stba	%l0,[%o1+0x040]%asi	! Mem[0000000020800040] = a360b8ec
!	%l1 = 00000000d102b5cd, Mem[0000000010101410] = 085de2f2
	stba	%l1,[%i4+%o5]0x88	! Mem[0000000010101410] = 085de2cd
!	%l5 = 00000000000000ff, Mem[000000001014142a] = 00000000
	sth	%l5,[%i5+0x02a]		! Mem[0000000010141428] = 000000ff
!	Mem[0000000030141400] = 241749ff, %l5 = 00000000000000ff
	ldstuba	[%i5+%g0]0x89,%l5	! %l5 = 000000ff000000ff
!	%l1 = 00000000d102b5cd, Mem[0000000030101400] = 0000000000000000
	stxa	%l1,[%i4+%g0]0x89	! Mem[0000000030101400] = 00000000d102b5cd
!	Mem[0000000010101408] = 00000000, %l4 = 00000000ffff9449
	swapa	[%i4+%o4]0x88,%l4	! %l4 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = cde25d08 ffe25d08, %l4 = 00000000, %l5 = 000000ff
	ldda	[%i4+%o5]0x80,%l4	! %l4 = 00000000cde25d08 00000000ffe25d08

p0_label_83:
!	Mem[0000000010141414] = 24174994, %l2 = 0000000000009085
	ldsw	[%i5+0x014],%l2		! %l2 = 0000000024174994
!	Mem[0000000010001410] = 4dd91d0624174925, %l7 = ffffffffff00ffff
	ldxa	[%i0+%o5]0x88,%l7	! %l7 = 4dd91d0624174925
!	Mem[0000000020800040] = a360b8ec, %l4 = 00000000cde25d08
	lduha	[%o1+0x040]%asi,%l4	! %l4 = 000000000000a360
!	Mem[0000000010081400] = 00000000, %l6 = 0000000000000049
	lduba	[%i2+%g0]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000030181410] = 8f84d76d 00003dd7, %l6 = 00000000, %l7 = 24174925
	ldda	[%i6+%o5]0x89,%l6	! %l6 = 0000000000003dd7 000000008f84d76d
!	Mem[0000000010141438] = 50b9a13d, %l2 = 0000000024174994
	ldsb	[%i5+0x03b],%l2		! %l2 = 000000000000003d
!	Mem[0000000030181408] = ff000000, %f19 = 00000000
	lda	[%i6+%o4]0x81,%f19	! %f19 = ff000000
!	Mem[0000000010001408] = 00ff0095, %l6 = 0000000000003dd7
	lduwa	[%i0+%o4]0x88,%l6	! %l6 = 0000000000ff0095
!	Mem[0000000010141430] = 00000000, %l5 = 00000000ffe25d08
	lduha	[%i5+0x030]%asi,%l5	! %l5 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010041430] = 85ffdf37, %l6 = 00ff0095, %l7 = 8f84d76d
	add	%i1,0x30,%g1
	casa	[%g1]0x80,%l6,%l7	! %l7 = 0000000085ffdf37

p0_label_84:
!	%l0 = 9028bfa3, %l1 = d102b5cd, Mem[0000000030001410] = ff0000ff 00000000
	stda	%l0,[%i0+%o5]0x89	! Mem[0000000030001410] = 9028bfa3 d102b5cd
!	Mem[0000000010041418] = 000000309085fb95, %l5 = 0000000000000000, %l3 = 00000000efa6d8e0
	add	%i1,0x18,%g1
	casxa	[%g1]0x80,%l5,%l3	! %l3 = 000000309085fb95
!	Mem[000000001018141e] = ffffffc4, %l2 = 000000000000003d
	ldstub	[%i6+0x01e],%l2		! %l2 = 000000ff000000ff
!	Mem[0000000030181400] = 65d0085d, %l1 = 00000000d102b5cd
	swapa	[%i6+%g0]0x89,%l1	! %l1 = 0000000065d0085d
!	Mem[0000000030141408] = 99c19949, %l6 = 0000000000ff0095
	swapa	[%i5+%o4]0x89,%l6	! %l6 = 0000000099c19949
!	Mem[00000000100c1408] = 00003dd7, %l4 = 000000000000a360
	ldstuba	[%i3+%o4]0x88,%l4	! %l4 = 000000d7000000ff
!	%l3 = 000000309085fb95, Mem[0000000010181400] = ffffcdb1
	stha	%l3,[%i6+%g0]0x88	! Mem[0000000010181400] = fffffb95
!	%l5 = 0000000000000000, Mem[0000000010101400] = 35ade5ff
	stba	%l5,[%i4+%g0]0x88	! Mem[0000000010101400] = 35ade500
!	Mem[0000000010101408] = 4994ffff, %l0 = 000000009028bfa3
	swapa	[%i4+%o4]0x80,%l0	! %l0 = 000000004994ffff
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = ff491724 00000000, %l6 = 99c19949, %l7 = 85ffdf37
	ldda	[%i5+%g0]0x81,%l6	! %l6 = 00000000ff491724 0000000000000000

p0_label_85:
!	Mem[0000000021800080] = ff7914cb, %l6 = 00000000ff491724
	ldsh	[%o3+0x080],%l6		! %l6 = ffffffffffffff79
!	Mem[0000000010141408] = 35ade5ff, %l6 = ffffffffffffff79
	ldswa	[%i5+%o4]0x88,%l6	! %l6 = 0000000035ade5ff
!	Mem[0000000010101400] = 35ade500, %l3 = 000000309085fb95
	ldsha	[%i4+%g0]0x88,%l3	! %l3 = ffffffffffffe500
!	Mem[0000000030141400] = 241749ff, %l3 = ffffffffffffe500
	ldsba	[%i5+%g0]0x89,%l3	! %l3 = ffffffffffffffff
!	Mem[00000000100c1410] = a3bf2890, %l4 = 00000000000000d7
	lduw	[%i3+%o5],%l4		! %l4 = 00000000a3bf2890
!	Mem[0000000010181410] = 000000f2, %l1 = 0000000065d0085d
	lduba	[%i6+%o5]0x88,%l1	! %l1 = 00000000000000f2
	membar	#Sync			! Added by membar checker (21)
!	Mem[0000000030181400] = cdb502d1 bf39aedb ff000000 00000000
!	Mem[0000000030181410] = d73d0000 6dd7848f b1ac8a3b 1da45bae
!	Mem[0000000030181420] = d96af809 948a6312 9c8971bc d6fa8c51
!	Mem[0000000030181430] = 250c8aa7 956266fb ce75fb64 a19e6944
	ldda	[%i6]ASI_BLK_AIUSL,%f0	! Block Load from 0000000030181400
!	Mem[00000000300c1400] = ff00ffff, %f24 = ef940000
	lda	[%i3+%g0]0x81,%f24	! %f24 = ff00ffff
!	%l2 = 00000000000000ff, Mem[0000000010081420] = 5539c2ba
	stw	%l2,[%i2+0x020]		! Mem[0000000010081420] = 000000ff
!	Starting 10 instruction Store Burst
!	%l1 = 00000000000000f2, Mem[0000000010101410] = cde25d08
	stwa	%l1,[%i4+%o5]0x80	! Mem[0000000010101410] = 000000f2

!	Check Point 17 for processor 0

	set	p0_check_pt_data_17,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 000000004994ffff
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 00000000000000f2
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
	cmp	%l4,%g2			! %l4 = 00000000a3bf2890
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 0000000000000000
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 0000000035ade5ff
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 0000000000000000
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = dbae39bf d102b5cd
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
	cmp	%g3,%g2			! %f4 = 8f84d76d 00003dd7
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x60],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = ae5ba41d 3b8aacb1
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x68],%g3
	std	%f8,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f8 = 12638a94 09f86ad9
	bne	%xcc,p0_freg_check_fail
	mov	0xf08,%g1
	ldx	[%g4+0x70],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = 518cfad6 bc71899c
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x78],%g3
	std	%f12,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f12 = fb666295 a78a0c25
	bne	%xcc,p0_freg_check_fail
	mov	0xf12,%g1
	ldx	[%g4+0x80],%g3
	std	%f14,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f14 = 44699ea1 64fb75ce
	bne	%xcc,p0_freg_check_fail
	mov	0xf14,%g1
	ldx	[%g4+0x88],%g3
	std	%f16,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f16 = ff000000 e1373d78
	bne	%xcc,p0_freg_check_fail
	mov	0xf16,%g1
	ldx	[%g4+0x90],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = d73d0000 ff000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1
	ldx	[%g4+0x98],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = 6dd7848f 085de2f2
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1
	ldx	[%g4+0xa0],%g3
	std	%f22,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f22 = a8ff7509 abda6f33
	bne	%xcc,p0_freg_check_fail
	mov	0xf22,%g1
	ldx	[%g4+0xa8],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = ff00ffff 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1
	ldx	[%g4+0xb0],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = d96af809 005f0000
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1
	ldx	[%g4+0xb8],%g3
	std	%f28,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f28 = c0621d06 8f354994
	bne	%xcc,p0_freg_check_fail
	mov	0xf28,%g1
	ldx	[%g4+0xc0],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = a8490643 d9e62c7d
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 17 completed


p0_label_86:
!	%l4 = 00000000a3bf2890, Mem[00000000300c1400] = ffffffffffff00ff
	stxa	%l4,[%i3+%g0]0x89	! Mem[00000000300c1400] = 00000000a3bf2890
!	%l2 = 00000000000000ff, Mem[0000000010001400] = 00000000ffff9449
	stxa	%l2,[%i0+%g0]0x80	! Mem[0000000010001400] = 00000000000000ff
!	%l2 = 00000000000000ff, Mem[0000000030001410] = a3bf2890
	stha	%l2,[%i0+%o5]0x81	! Mem[0000000030001410] = 00ff2890
!	Mem[0000000010001410] = 25491724, %l4 = 00000000a3bf2890
	ldstuba	[%i0+%o5]0x80,%l4	! %l4 = 00000025000000ff
!	%f26 = d96af809 005f0000, Mem[0000000010081418] = 8f84d76d ff1dd9ff
	std	%f26,[%i2+0x018]	! Mem[0000000010081418] = d96af809 005f0000
!	%f2  = 00000000, Mem[0000000030041410] = 50b9a13d
	sta	%f2 ,[%i1+%o5]0x81	! Mem[0000000030041410] = 00000000
!	%l2 = 00000000000000ff, Mem[00000000300c1400] = 9028bfa3
	stha	%l2,[%i3+%g0]0x81	! Mem[00000000300c1400] = 00ffbfa3
!	%f30 = a8490643 d9e62c7d, Mem[0000000010141400] = ff4dc199 630069d9
	stda	%f30,[%i5+0x000]%asi	! Mem[0000000010141400] = a8490643 d9e62c7d
!	%f6  = ae5ba41d 3b8aacb1, Mem[0000000010141438] = 50b9a13d e0d68277
	stda	%f6 ,[%i5+0x038]%asi	! Mem[0000000010141438] = ae5ba41d 3b8aacb1
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = 085de254, %l0 = 000000004994ffff
	lduwa	[%i2+%o4]0x89,%l0	! %l0 = 00000000085de254

p0_label_87:
!	Mem[0000000010041400] = 00000000, %l3 = ffffffffffffffff
	ldswa	[%i1+%g0]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000010101400] = 00e5ad35, %l7 = 0000000000000000
	lduha	[%i4+%g0]0x80,%l7	! %l7 = 00000000000000e5
!	Mem[0000000030141408] = d969006300ff0095, %f28 = c0621d06 8f354994
	ldda	[%i5+%o4]0x89,%f28	! %f28 = d9690063 00ff0095
!	Mem[00000000201c0000] = 90ff851d, %l4 = 0000000000000025
	ldsb	[%o0+%g0],%l4		! %l4 = ffffffffffffff90
!	Mem[0000000010041408] = b1cdffff, %l7 = 00000000000000e5
	ldsba	[%i1+%o4]0x88,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010081410] = 000000006dd78400, %l3 = 0000000000000000
	ldxa	[%i2+%o5]0x88,%l3	! %l3 = 000000006dd78400
!	Mem[00000000100c1400] = ff000000, %f15 = 64fb75ce
	lda	[%i3+%g0]0x80,%f15	! %f15 = ff000000
!	Mem[0000000030041408] = f2e25d08, %l6 = 0000000035ade5ff
	lduwa	[%i1+%o4]0x81,%l6	! %l6 = 00000000f2e25d08
!	Mem[00000000100c1410] = a3bf2890, %l3 = 000000006dd78400
	ldsba	[%i3+%o5]0x80,%l3	! %l3 = ffffffffffffffa3
!	Starting 10 instruction Store Burst
!	%f12 = fb666295, Mem[0000000030001410] = 9028ff00
	sta	%f12,[%i0+%o5]0x89	! Mem[0000000030001410] = fb666295

p0_label_88:
!	%l4 = ffffff90, %l5 = 00000000, Mem[00000000100c1438] = a8490643 d9e62c7d
	stda	%l4,[%i3+0x038]%asi	! Mem[00000000100c1438] = ffffff90 00000000
!	%f27 = 005f0000, Mem[0000000010081424] = 3581cb85
	st	%f27,[%i2+0x024]	! Mem[0000000010081424] = 005f0000
!	Mem[0000000030101410] = 0000c2ba, %l7 = ffffffffffffffff
	swapa	[%i4+%o5]0x81,%l7	! %l7 = 000000000000c2ba
!	Mem[0000000010041410] = ff85fb95, %l3 = ffffffffffffffa3
	swapa	[%i1+%o5]0x80,%l3	! %l3 = 00000000ff85fb95
	membar	#Sync			! Added by membar checker (22)
!	%l7 = 000000000000c2ba, Mem[0000000030181410] = d73d0000
	stwa	%l7,[%i6+%o5]0x81	! Mem[0000000030181410] = 0000c2ba
!	%l5 = 0000000000000000, Mem[0000000010001428] = f2e25d08
	stw	%l5,[%i0+0x028]		! Mem[0000000010001428] = 00000000
!	%l1 = 00000000000000f2, Mem[00000000300c1410] = ff000000
	stwa	%l1,[%i3+%o5]0x81	! Mem[00000000300c1410] = 000000f2
!	%l1 = 00000000000000f2, Mem[0000000030081408] = 085de254
	stwa	%l1,[%i2+%o4]0x89	! Mem[0000000030081408] = 000000f2
!	%l3 = 00000000ff85fb95, Mem[0000000010141400] = 7d2ce6d9430649a8
	stxa	%l3,[%i5+%g0]0x88	! Mem[0000000010141400] = 00000000ff85fb95
!	Starting 10 instruction Load Burst
!	Mem[0000000030181410] = 0000c2ba, %l3 = 00000000ff85fb95
	ldsha	[%i6+%o5]0x81,%l3	! %l3 = 0000000000000000

p0_label_89:
!	Mem[00000000100c1418] = a8ff7509, %l1 = 00000000000000f2
	ldsba	[%i3+0x019]%asi,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000030001410] = 956266fb, %l2 = 00000000000000ff
	lduwa	[%i0+%o5]0x81,%l2	! %l2 = 00000000956266fb
!	Mem[0000000030081400] = 0200ffc4, %l3 = 0000000000000000
	lduha	[%i2+%g0]0x89,%l3	! %l3 = 000000000000ffc4
!	Mem[0000000030141408] = 9500ff00, %l0 = 00000000085de254
	lduwa	[%i5+%o4]0x81,%l0	! %l0 = 000000009500ff00
!	Mem[0000000010181410] = 000000f2, %f15 = ff000000
	lda	[%i6+%o5]0x88,%f15	! %f15 = 000000f2
!	Mem[0000000010041408] = b1cdffff, %l0 = 000000009500ff00
	ldsba	[%i1+%o4]0x88,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010141420] = 00000000, %l2 = 00000000956266fb
	lduha	[%i5+0x022]%asi,%l2	! %l2 = 0000000000000000
!	Mem[0000000010001408] = 9500ff00 0fde36ff, %l0 = ffffffff, %l1 = ffffffff
	ldda	[%i0+0x008]%asi,%l0	! %l0 = 000000009500ff00 000000000fde36ff
!	Mem[0000000010041400] = 00000000, %l2 = 0000000000000000
	ldsha	[%i1+%g0]0x80,%l2	! %l2 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f16 = ff000000 e1373d78 d73d0000 ff000000
!	%f20 = 6dd7848f 085de2f2 a8ff7509 abda6f33
!	%f24 = ff00ffff 00000000 d96af809 005f0000
!	%f28 = d9690063 00ff0095 a8490643 d9e62c7d
	stda	%f16,[%i2]ASI_COMMIT_S	! Block Store to 0000000030081400

p0_label_90:
!	%f1  = d102b5cd, Mem[0000000030001400] = 26ac68ff
	sta	%f1 ,[%i0+%g0]0x89	! Mem[0000000030001400] = d102b5cd
!	Mem[0000000010181434] = ffffde0f, %l7 = 0000c2ba, %l5 = 00000000
	add	%i6,0x34,%g1
	casa	[%g1]0x80,%l7,%l5	! %l5 = 00000000ffffde0f
!	%f14 = 44699ea1 000000f2, %l3 = 000000000000ffc4
!	Mem[0000000010181400] = 95fbffff57af2327
	stda	%f14,[%i6+%l3]ASI_PST8_P ! Mem[0000000010181400] = 4469ffff57002327
!	%l2 = 0000000000000000, Mem[0000000030181400] = d102b5cd
	stha	%l2,[%i6+%g0]0x89	! Mem[0000000030181400] = d1020000
!	Mem[0000000010001420] = 8f84d76d, %l4 = ffffffffffffff90
	swap	[%i0+0x020],%l4		! %l4 = 000000008f84d76d
	membar	#Sync			! Added by membar checker (23)
!	%l3 = 000000000000ffc4, Mem[0000000010081408] = b1000065
	stw	%l3,[%i2+%o4]		! Mem[0000000010081408] = 0000ffc4
!	%l7 = 000000000000c2ba, Mem[000000001000142c] = 99c1993d, %asi = 80
	stba	%l7,[%i0+0x02c]%asi	! Mem[000000001000142c] = bac1993d
!	%f20 = 6dd7848f, Mem[0000000030081410] = 8f84d76d
	sta	%f20,[%i2+%o5]0x89	! Mem[0000000030081410] = 6dd7848f
!	Mem[0000000010041408] = ffffcdb1, %l2 = 0000000000000000
	swapa	[%i1+%o4]0x80,%l2	! %l2 = 00000000ffffcdb1
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = 00e25d08, %l2 = 00000000ffffcdb1
	ldsha	[%i5+%o5]0x81,%l2	! %l2 = 00000000000000e2

!	Check Point 18 for processor 0

	set	p0_check_pt_data_18,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 000000009500ff00
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 000000000fde36ff
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 00000000000000e2
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 000000000000ffc4
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 000000008f84d76d
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l6,%g2			! %l6 = 00000000f2e25d08
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l7,%g2			! %l7 = 000000000000c2ba
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x40],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = dbae39bf d102b5cd
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x48],%g3
	std	%f14,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f14 = 44699ea1 000000f2
	bne	%xcc,p0_freg_check_fail
	mov	0xf14,%g1
	ldx	[%g4+0x50],%g3
	std	%f28,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f28 = d9690063 00ff0095
	bne	%xcc,p0_freg_check_fail
	mov	0xf28,%g1

!	Check Point 18 completed


p0_label_91:
!	Mem[0000000030141410] = 00e25d08412ccb02, %f10 = 518cfad6 bc71899c
	ldda	[%i5+%o5]0x81,%f10	! %f10 = 00e25d08 412ccb02
!	Mem[0000000030101400] = 00000000d102b5cd, %f14 = 44699ea1 000000f2
	ldda	[%i4+%g0]0x89,%f14	! %f14 = 00000000 d102b5cd
!	Mem[0000000030041400] = ff000000, %l4 = 000000008f84d76d
	ldsha	[%i1+%g0]0x81,%l4	! %l4 = ffffffffffffff00
!	Mem[0000000030081410] = 8f84d76d, %l7 = 000000000000c2ba
	ldsba	[%i2+%o5]0x81,%l7	! %l7 = ffffffffffffff8f
!	Mem[0000000030181408] = ff000000, %l7 = ffffffffffffff8f
	lduwa	[%i6+%o4]0x81,%l7	! %l7 = 00000000ff000000
!	Mem[0000000010081420] = 000000ff005f0000, %l2 = 00000000000000e2
	ldxa	[%i2+0x020]%asi,%l2	! %l2 = 000000ff005f0000
!	Mem[0000000010101408] = 9028bfa3, %l4 = ffffffffffffff00
	ldswa	[%i4+%o4]0x80,%l4	! %l4 = ffffffff9028bfa3
!	Mem[0000000010081400] = 00000000, %f17 = e1373d78
	lda	[%i2+%g0]0x80,%f17	! %f17 = 00000000
!	Mem[0000000030181410] = 8f84d76dbac20000, %l0 = 000000009500ff00
	ldxa	[%i6+%o5]0x89,%l0	! %l0 = 8f84d76dbac20000
!	Starting 10 instruction Store Burst
!	%l6 = 00000000f2e25d08, Mem[0000000030141408] = 9500ff00630069d9
	stxa	%l6,[%i5+%o4]0x81	! Mem[0000000030141408] = 00000000f2e25d08

p0_label_92:
!	%l1 = 000000000fde36ff, Mem[0000000030101400] = 00000000d102b5cd
	stxa	%l1,[%i4+%g0]0x89	! Mem[0000000030101400] = 000000000fde36ff
!	Mem[0000000030041408] = 085de2f2, %l6 = 00000000f2e25d08
	swapa	[%i1+%o4]0x89,%l6	! %l6 = 00000000085de2f2
!	%l6 = 00000000085de2f2, Mem[00000000201c0000] = 90ff851d, %asi = 80
	stha	%l6,[%o0+0x000]%asi	! Mem[00000000201c0000] = e2f2851d
!	%f0  = dbae39bf d102b5cd, Mem[0000000030041408] = f2e25d08 0fde36ff
	stda	%f0 ,[%i1+%o4]0x89	! Mem[0000000030041408] = dbae39bf d102b5cd
!	%l4 = ffffffff9028bfa3, Mem[0000000010181438] = ffffb5cd
	sth	%l4,[%i6+0x038]		! Mem[0000000010181438] = bfa3b5cd
!	Mem[0000000030001400] = cdb502d1, %l0 = 8f84d76dbac20000
	ldstuba	[%i0+%g0]0x81,%l0	! %l0 = 000000cd000000ff
!	%l0 = 000000cd, %l1 = 0fde36ff, Mem[0000000010001408] = 9500ff00 0fde36ff
	stda	%l0,[%i0+%o4]0x80	! Mem[0000000010001408] = 000000cd 0fde36ff
!	%l3 = 000000000000ffc4, Mem[0000000030181410] = bac20000
	stba	%l3,[%i6+%o5]0x89	! Mem[0000000030181410] = bac200c4
!	%l1 = 000000000fde36ff, Mem[0000000010041400] = bf39aedb00000000
	stxa	%l1,[%i1+%g0]0x88	! Mem[0000000010041400] = 000000000fde36ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = 085de200, %l2 = 000000ff005f0000
	lduwa	[%i5+%o5]0x89,%l2	! %l2 = 00000000085de200

p0_label_93:
!	Mem[0000000010141410] = 0000d102, %l0 = 00000000000000cd
	ldswa	[%i5+%o5]0x88,%l0	! %l0 = 000000000000d102
!	Mem[0000000030141410] = 085de200, %l2 = 00000000085de200
	ldswa	[%i5+%o5]0x89,%l2	! %l2 = 00000000085de200
!	Mem[0000000010141408] = ffe5ad35000000f6, %l6 = 00000000085de2f2
	ldxa	[%i5+%o4]0x80,%l6	! %l6 = ffe5ad35000000f6
!	Mem[00000000100c1400] = ff000000 e1373d78 ff3d0000 00000000
!	Mem[00000000100c1410] = a3bf2890 cdb502d1 a8ff7509 abda6f33
!	Mem[00000000100c1420] = ef940000 00000000 d96af809 005f0000
!	Mem[00000000100c1430] = c0621d06 8f354994 ffffff90 00000000
	ldda	[%i3]ASI_BLK_AIUPL,%f0	! Block Load from 00000000100c1400
!	Mem[00000000100c1400] = ff000000 e1373d78, %l4 = 9028bfa3, %l5 = ffffde0f
	ldda	[%i3+%g0]0x80,%l4	! %l4 = 00000000ff000000 00000000e1373d78
!	Mem[00000000100c1410] = 9028bfa3, %l1 = 000000000fde36ff
	ldsha	[%i3+%o5]0x88,%l1	! %l1 = ffffffffffffbfa3
	membar	#Sync			! Added by membar checker (24)
!	Mem[0000000010041400] = ff36de0f 00000000 00000000 00000000
!	Mem[0000000010041410] = ffffffa3 085de2f2 00000030 9085fb95
!	Mem[0000000010041420] = 020037e1 ff1dd94d 6683e588 aa03bbbb
!	Mem[0000000010041430] = 85ffdf37 061dd94d 9028bfa3 d102b5cd
	ldda	[%i1]ASI_BLK_P,%f16	! Block Load from 0000000010041400
!	Mem[0000000010081410] = 0084d76d00000000, %f4  = d102b5cd 9028bfa3
	ldda	[%i2+%o5]0x80,%f4 	! %f4  = 0084d76d 00000000
!	Mem[0000000030101408] = 000000c1, %l0 = 000000000000d102
	ldsba	[%i4+%o4]0x89,%l0	! %l0 = ffffffffffffffc1
!	Starting 10 instruction Store Burst
!	%l5 = 00000000e1373d78, Mem[0000000010081428] = 00000000
	sth	%l5,[%i2+0x028]		! Mem[0000000010081428] = 3d780000

p0_label_94:
	membar	#Sync			! Added by membar checker (25)
!	%f4  = 0084d76d, Mem[0000000010041410] = ffffffa3
	st	%f4 ,[%i1+%o5]		! Mem[0000000010041410] = 0084d76d
!	Mem[0000000021800040] = 76ff4289, %l7 = 00000000ff000000
	ldstub	[%o3+0x040],%l7		! %l7 = 00000076000000ff
!	%l3 = 000000000000ffc4, Mem[0000000010181400] = ffff6944
	stba	%l3,[%i6+%g0]0x88	! Mem[0000000010181400] = ffff69c4
!	Mem[0000000030041400] = ff000000, %l5 = 00000000e1373d78
	ldstuba	[%i1+%g0]0x81,%l5	! %l5 = 000000ff000000ff
!	%l6 = ffe5ad35000000f6, imm = ffffffffffffffef, %l6 = ffe5ad35000000f6
	add	%l6,-0x011,%l6		! %l6 = ffe5ad35000000e5
!	%l4 = ff000000, %l5 = 000000ff, Mem[0000000010141410] = 02d10000 24174994
	stda	%l4,[%i5+%o5]0x80	! Mem[0000000010141410] = ff000000 000000ff
!	Mem[0000000030181410] = c400c2ba, %l0 = ffffffffffffffc1
	ldstuba	[%i6+%o5]0x81,%l0	! %l0 = 000000c4000000ff
!	%f17 = 00000000, Mem[0000000010041410] = 0084d76d
	sta	%f17,[%i1+%o5]0x80	! Mem[0000000010041410] = 00000000
!	Mem[0000000010181410] = 000000f2, %l4 = 00000000ff000000
	ldstuba	[%i6+%o5]0x88,%l4	! %l4 = 000000f2000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = 085de200, %l4 = 00000000000000f2
	ldsha	[%i5+%o5]0x89,%l4	! %l4 = ffffffffffffe200

p0_label_95:
!	Mem[0000000030001408] = 9085fb95, %l0 = 00000000000000c4
	ldsba	[%i0+%o4]0x81,%l0	! %l0 = ffffffffffffff90
!	Mem[0000000010081410] = 000000006dd78400, %f8  = 00000000 000094ef
	ldda	[%i2+%o5]0x88,%f8 	! %f8  = 00000000 6dd78400
!	Mem[0000000010141400] = 95fb85ff, %l2 = 00000000085de200
	lduwa	[%i5+%g0]0x80,%l2	! %l2 = 0000000095fb85ff
!	Mem[0000000010101410] = f2000000, %l5 = 00000000000000ff
	ldsha	[%i4+%o5]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000030001410] = fb666295, %f13 = 061d62c0
	lda	[%i0+%o5]0x89,%f13	! %f13 = fb666295
!	Mem[00000000211c0000] = 0000a37b, %l2 = 0000000095fb85ff
	lduba	[%o2+0x001]%asi,%l2	! %l2 = 0000000000000000
!	Mem[0000000010141400] = 95fb85ff, %l6 = ffe5ad35000000e5
	lduwa	[%i5+%g0]0x80,%l6	! %l6 = 0000000095fb85ff
!	Mem[0000000010001424] = 00000000, %l2 = 0000000000000000
	ldsba	[%i0+0x024]%asi,%l2	! %l2 = 0000000000000000
!	Mem[0000000010101400] = f6ffff1d35ade500, %f10 = 00005f00 09f86ad9
	ldda	[%i4+%g0]0x88,%f10	! %f10 = f6ffff1d 35ade500
!	Starting 10 instruction Store Burst
!	Mem[000000001014142e] = ffd49157, %l6 = 0000000095fb85ff
	ldstuba	[%i5+0x02e]%asi,%l6	! %l6 = 00000091000000ff

!	Check Point 19 for processor 0

	set	p0_check_pt_data_19,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = ffffffffffffff90
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = ffffffffffffbfa3
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 0000000000000000
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l4,%g2			! %l4 = ffffffffffffe200
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l5,%g2			! %l5 = 0000000000000000
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l6,%g2			! %l6 = 0000000000000091
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l7,%g2			! %l7 = 0000000000000076
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x40],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = 783d37e1 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x48],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = 00000000 00003dff
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x50],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 0084d76d 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x58],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 336fdaab 0975ffa8
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x60],%g3
	std	%f8,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f8 = 00000000 6dd78400
	bne	%xcc,p0_freg_check_fail
	mov	0xf08,%g1
	ldx	[%g4+0x68],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = f6ffff1d 35ade500
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x70],%g3
	std	%f12,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f12 = 9449358f fb666295
	bne	%xcc,p0_freg_check_fail
	mov	0xf12,%g1
	ldx	[%g4+0x78],%g3
	std	%f14,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f14 = 00000000 90ffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf14,%g1
	ldx	[%g4+0x80],%g3
	std	%f16,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f16 = ff36de0f 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf16,%g1
	ldx	[%g4+0x88],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = 00000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1
	ldx	[%g4+0x90],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = ffffffa3 085de2f2
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1
	ldx	[%g4+0x98],%g3
	std	%f22,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f22 = 00000030 9085fb95
	bne	%xcc,p0_freg_check_fail
	mov	0xf22,%g1
	ldx	[%g4+0xa0],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = 020037e1 ff1dd94d
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1
	ldx	[%g4+0xa8],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = 6683e588 aa03bbbb
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1
	ldx	[%g4+0xb0],%g3
	std	%f28,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f28 = 85ffdf37 061dd94d
	bne	%xcc,p0_freg_check_fail
	mov	0xf28,%g1
	ldx	[%g4+0xb8],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = 9028bfa3 d102b5cd
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 19 completed


p0_label_96:
!	%l7 = 0000000000000076, Mem[0000000010041400] = ff36de0f, %asi = 80
	stwa	%l7,[%i1+0x000]%asi	! Mem[0000000010041400] = 00000076
!	Mem[00000000211c0001] = 0000a37b, %l5 = 0000000000000000
	ldstub	[%o2+0x001],%l5		! %l5 = 00000000000000ff
!	Mem[0000000030101400] = 0fde36ff, %l3 = 000000000000ffc4
	ldstuba	[%i4+%g0]0x89,%l3	! %l3 = 000000ff000000ff
!	%f10 = f6ffff1d 35ade500, %l0 = ffffffffffffff90
!	Mem[00000000100c1438] = ffffff9000000000
	add	%i3,0x038,%g1
	stda	%f10,[%g1+%l0]ASI_PST16_PL ! Mem[00000000100c1438] = ffffff9000000000
!	%l0 = ffffffffffffff90, Mem[0000000030081400] = 783d37e1000000ff
	stxa	%l0,[%i2+%g0]0x89	! Mem[0000000030081400] = ffffffffffffff90
!	%f16 = ff36de0f 00000000 00000000 00000000
!	%f20 = ffffffa3 085de2f2 00000030 9085fb95
!	%f24 = 020037e1 ff1dd94d 6683e588 aa03bbbb
!	%f28 = 85ffdf37 061dd94d 9028bfa3 d102b5cd
	stda	%f16,[%i1]ASI_BLK_AIUPL	! Block Store to 0000000010041400
!	Mem[0000000010001427] = 00000000, %l3 = 00000000000000ff
	ldstub	[%i0+0x027],%l3		! %l3 = 00000000000000ff
!	%l5 = 0000000000000000, Mem[0000000030101410] = ffffffff
	stba	%l5,[%i4+%o5]0x81	! Mem[0000000030101410] = 00ffffff
!	Mem[0000000030001410] = 956266fb, %l3 = 0000000000000000
	swapa	[%i0+%o5]0x81,%l3	! %l3 = 00000000956266fb
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = ff000000, %l2 = 0000000000000000
	lduwa	[%i5+0x010]%asi,%l2	! %l2 = 00000000ff000000

p0_label_97:
!	Mem[0000000030001400] = d102b5ff, %l4 = ffffffffffffe200
	ldswa	[%i0+%g0]0x89,%l4	! %l4 = ffffffffd102b5ff
!	Mem[0000000010141408] = 35ade5ff, %l0 = ffffffffffffff90
	ldsha	[%i5+%o4]0x88,%l0	! %l0 = ffffffffffffe5ff
!	Mem[0000000020800040] = a360b8ec, %l1 = ffffffffffffbfa3
	lduha	[%o1+0x040]%asi,%l1	! %l1 = 000000000000a360
!	Mem[0000000030101408] = 000000c1, %l2 = 00000000ff000000
	ldsha	[%i4+%o4]0x89,%l2	! %l2 = 00000000000000c1
!	Mem[0000000030101408] = c1000000, %l7 = 0000000000000076
	lduwa	[%i4+%o4]0x81,%l7	! %l7 = 00000000c1000000
!	Mem[0000000010081400] = 00000000, %l6 = 0000000000000091
	lduwa	[%i2+%g0]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000010001410] = ff491724, %l6 = 0000000000000000
	lduwa	[%i0+%o5]0x80,%l6	! %l6 = 00000000ff491724
!	Mem[0000000030081400] = 90ffffff, %l6 = 00000000ff491724
	ldswa	[%i2+%g0]0x81,%l6	! %l6 = ffffffff90ffffff
!	Mem[0000000030001410] = 00000000, %l3 = 00000000956266fb
	ldsba	[%i0+%o5]0x81,%l3	! %l3 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010141400] = 95fb85ff, %l1 = 000000000000a360
	ldstuba	[%i5+%g0]0x80,%l1	! %l1 = 00000095000000ff

p0_label_98:
!	%l0 = ffffe5ff, %l1 = 00000095, Mem[0000000030141400] = 241749ff 00000000
	stda	%l0,[%i5+%g0]0x89	! Mem[0000000030141400] = ffffe5ff 00000095
!	%l5 = 0000000000000000, Mem[0000000010081408] = 0000ffc4000000ff
	stxa	%l5,[%i2+%o4]0x80	! Mem[0000000010081408] = 0000000000000000
!	%l2 = 00000000000000c1, Mem[0000000010001400] = 00000000000000ff
	stxa	%l2,[%i0+%g0]0x80	! Mem[0000000010001400] = 00000000000000c1
!	%l1 = 0000000000000095, Mem[0000000020800000] = 74ff9984, %asi = 80
	stha	%l1,[%o1+0x000]%asi	! Mem[0000000020800000] = 00959984
!	Mem[0000000030101408] = 000000c1, %l4 = ffffffffd102b5ff
	swapa	[%i4+%o4]0x89,%l4	! %l4 = 00000000000000c1
!	%l1 = 0000000000000095, Mem[0000000010081400] = 00000000
	stba	%l1,[%i2+%g0]0x80	! Mem[0000000010081400] = 95000000
!	Mem[0000000010141410] = ff000000, %l5 = 0000000000000000
	ldstuba	[%i5+%o5]0x80,%l5	! %l5 = 000000ff000000ff
!	%l2 = 00000000000000c1, Mem[000000001018143c] = 97ff5a90
	sth	%l2,[%i6+0x03c]		! Mem[000000001018143c] = 00c15a90
!	%f4  = 0084d76d, Mem[0000000030001400] = d102b5ff
	sta	%f4 ,[%i0+%g0]0x89	! Mem[0000000030001400] = 0084d76d
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = d1020000, %l6 = ffffffff90ffffff
	ldsha	[%i6+%g0]0x89,%l6	! %l6 = 0000000000000000

p0_label_99:
!	Mem[0000000030141400] = ffffe5ff, %f9  = 6dd78400
	lda	[%i5+%g0]0x89,%f9 	! %f9 = ffffe5ff
!	Mem[0000000030101400] = 00000000 0fde36ff, %l2 = 000000c1, %l3 = 00000000
	ldda	[%i4+%g0]0x89,%l2	! %l2 = 000000000fde36ff 0000000000000000
!	Mem[00000000100c1400] = 783d37e1000000ff, %l2 = 000000000fde36ff
	ldxa	[%i3+%g0]0x88,%l2	! %l2 = 783d37e1000000ff
!	Mem[0000000010081400] = 95000000, %l7 = 00000000c1000000
	ldsha	[%i2+%g0]0x80,%l7	! %l7 = ffffffffffff9500
!	Mem[000000001014140c] = 000000f6, %f6  = 336fdaab
	lda	[%i5+0x00c]%asi,%f6 	! %f6 = 000000f6
!	Mem[0000000010101400] = 00e5ad35 1dfffff6, %l4 = 000000c1, %l5 = 000000ff
	ldda	[%i4+%g0]0x80,%l4	! %l4 = 0000000000e5ad35 000000001dfffff6
	membar	#Sync			! Added by membar checker (26)
!	Mem[0000000010041418] = 95fb8590 30000000, %l0 = ffffe5ff, %l1 = 00000095
	ldda	[%i1+0x018]%asi,%l0	! %l0 = 0000000095fb8590 0000000030000000
!	Mem[0000000010001408] = 000000cd, %l1 = 0000000030000000
	lduwa	[%i0+%o4]0x80,%l1	! %l1 = 00000000000000cd
!	Mem[0000000010141428] = 000000ff, %l2 = 783d37e1000000ff
	lduwa	[%i5+0x028]%asi,%l2	! %l2 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%f0  = 783d37e1, Mem[0000000010001438] = 00000000
	sta	%f0 ,[%i0+0x038]%asi	! Mem[0000000010001438] = 783d37e1

p0_label_100:
!	Mem[0000000030181400] = d1020000, %l6 = 0000000000000000
	swapa	[%i6+%g0]0x89,%l6	! %l6 = 00000000d1020000
!	Mem[0000000010181400] = c469ffff, %l2 = 00000000000000ff
	swapa	[%i6+%g0]0x80,%l2	! %l2 = 00000000c469ffff
!	%l6 = 00000000d1020000, Mem[00000000100c1408] = 00003dff
	stha	%l6,[%i3+%o4]0x88	! Mem[00000000100c1408] = 00000000
!	%l1 = 00000000000000cd, Mem[000000001000140c] = 0fde36ff, %asi = 80
	stba	%l1,[%i0+0x00c]%asi	! Mem[000000001000140c] = cdde36ff
!	%l4 = 00e5ad35, %l5 = 1dfffff6, Mem[0000000030041410] = 00000000 412ccb02
	stda	%l4,[%i1+%o5]0x81	! Mem[0000000030041410] = 00e5ad35 1dfffff6
!	Mem[0000000030001408] = 95fb8590, %l1 = 00000000000000cd
	swapa	[%i0+%o4]0x89,%l1	! %l1 = 0000000095fb8590
!	%f30 = 9028bfa3, Mem[0000000030001408] = cd000000
	sta	%f30,[%i0+%o4]0x81	! Mem[0000000030001408] = 9028bfa3
!	Code Fragment 4
p0_fragment_3:
!	%l0 = 0000000095fb8590
	setx	0xc9e30b482ac2098e,%g7,%l0 ! %l0 = c9e30b482ac2098e
!	%l1 = 0000000095fb8590
	setx	0x43681f9ffd870c9a,%g7,%l1 ! %l1 = 43681f9ffd870c9a
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = c9e30b482ac2098e
	setx	0x5dcfa2e799499ae3,%g7,%l0 ! %l0 = 5dcfa2e799499ae3
!	%l1 = 43681f9ffd870c9a
	setx	0xd9e0ef2ffd35fceb,%g7,%l1 ! %l1 = d9e0ef2ffd35fceb
!	%l3 = 0000000000000000, Mem[0000000010001416] = 061dd94d
	stb	%l3,[%i0+0x016]		! Mem[0000000010001414] = 061d004d
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = 000000ff, %l2 = 00000000c469ffff
	lduha	[%i6+%g0]0x80,%l2	! %l2 = 0000000000000000

!	Check Point 20 for processor 0

	set	p0_check_pt_data_20,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 5dcfa2e799499ae3
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = d9e0ef2ffd35fceb
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
	cmp	%l4,%g2			! %l4 = 0000000000e5ad35
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 000000001dfffff6
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 00000000d1020000
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = ffffffffffff9500
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = 783d37e1 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x50],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = 00000000 00003dff
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x58],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 0084d76d 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x60],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 000000f6 0975ffa8
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x68],%g3
	std	%f8,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f8 = 00000000 ffffe5ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf08,%g1

!	Check Point 20 completed


p0_label_101:
!	Mem[0000000010081408] = 00000000, %f5  = 00000000
	lda	[%i2+%o4]0x88,%f5 	! %f5 = 00000000
!	Mem[0000000030141410] = 00e25d08412ccb02, %l0 = 5dcfa2e799499ae3
	ldxa	[%i5+%o5]0x81,%l0	! %l0 = 00e25d08412ccb02
!	Mem[00000000100c1410] = a3bf2890cdb502d1, %f20 = ffffffa3 085de2f2
	ldda	[%i3+%o5]0x80,%f20	! %f20 = a3bf2890 cdb502d1
!	Mem[0000000030101410] = 00ffffff, %f28 = 85ffdf37
	lda	[%i4+%o5]0x81,%f28	! %f28 = 00ffffff
!	Mem[00000000100c1408] = 0000000000000000, %f14 = 00000000 90ffffff
	ldda	[%i3+%o4]0x80,%f14	! %f14 = 00000000 00000000
!	Mem[0000000010041410] = ffffffa3 085de2f2, %l4 = 00e5ad35, %l5 = 1dfffff6
	ldda	[%i1+%o5]0x88,%l4	! %l4 = 00000000085de2f2 00000000ffffffa3
!	Mem[00000000201c0000] = e2f2851d, %l7 = ffffffffffff9500
	ldsh	[%o0+%g0],%l7		! %l7 = ffffffffffffe2f2
!	Mem[0000000010181400] = 27230057ff000000, %f26 = 6683e588 aa03bbbb
	ldda	[%i6+%g0]0x88,%f26	! %f26 = 27230057 ff000000
!	Mem[00000000300c1400] = 00ffbfa300000000, %f18 = 00000000 00000000
	ldda	[%i3+%g0]0x81,%f18	! %f18 = 00ffbfa3 00000000
!	Starting 10 instruction Store Burst
!	%l4 = 085de2f2, %l5 = ffffffa3, Mem[0000000030101408] = ffb502d1 993c43f4
	stda	%l4,[%i4+%o4]0x81	! Mem[0000000030101408] = 085de2f2 ffffffa3

p0_label_102:
!	Mem[0000000030041408] = cdb502d1, %l2 = 0000000000000000
	ldstuba	[%i1+%o4]0x81,%l2	! %l2 = 000000cd000000ff
!	%f6  = 000000f6 0975ffa8, Mem[00000000100c1410] = a3bf2890 cdb502d1
	stda	%f6 ,[%i3+0x010]%asi	! Mem[00000000100c1410] = 000000f6 0975ffa8
!	%l3 = 0000000000000000, Mem[0000000010081408] = 00000000
	stha	%l3,[%i2+%o4]0x88	! Mem[0000000010081408] = 00000000
!	%f28 = 00ffffff 061dd94d, Mem[00000000300c1408] = 061dd94d 783d37e1
	stda	%f28,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00ffffff 061dd94d
!	Mem[00000000100c1400] = 000000ff, %l3 = 0000000000000000
	ldstuba	[%i3+%g0]0x88,%l3	! %l3 = 000000ff000000ff
!	Mem[0000000010081408] = 00000000, %l6 = 00000000d1020000
	swapa	[%i2+%o4]0x88,%l6	! %l6 = 0000000000000000
!	%f13 = fb666295, Mem[0000000030141410] = 00e25d08
	sta	%f13,[%i5+%o5]0x81	! Mem[0000000030141410] = fb666295
!	Mem[00000000100c1400] = ff000000, %l7 = ffffffffffffe2f2
	swapa	[%i3+%g0]0x80,%l7	! %l7 = 00000000ff000000
!	%l6 = 0000000000000000, Mem[0000000010181408] = 99c199ff
	stba	%l6,[%i6+%o4]0x88	! Mem[0000000010181408] = 99c19900
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = 00000000, %l5 = 00000000ffffffa3
	ldsw	[%i1+%o4],%l5		! %l5 = 0000000000000000

p0_label_103:
!	Mem[0000000030081400] = 90ffffffffffffff, %f18 = 00ffbfa3 00000000
	ldda	[%i2+%g0]0x81,%f18	! %f18 = 90ffffff ffffffff
!	Mem[0000000010081410] = 0084d76d, %l5 = 0000000000000000
	lduwa	[%i2+%o5]0x80,%l5	! %l5 = 000000000084d76d
!	Mem[0000000030101410] = 00ffffff, %l0 = 00e25d08412ccb02
	ldsba	[%i4+%o5]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000030081408] = 00003dd7, %l5 = 000000000084d76d
	ldsba	[%i2+%o4]0x89,%l5	! %l5 = ffffffffffffffd7
!	Mem[0000000010141410] = ff000000000000ff, %f8  = 00000000 ffffe5ff
	ldda	[%i5+%o5]0x80,%f8 	! %f8  = ff000000 000000ff
!	Mem[0000000010141400] = fffb85ff, %l2 = 00000000000000cd
	ldsba	[%i5+%g0]0x80,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000030181400] = 00000000, %l7 = 00000000ff000000
	ldsba	[%i6+%g0]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000010001438] = 783d37e1, %f26 = 27230057
	ld	[%i0+0x038],%f26	! %f26 = 783d37e1
!	Mem[0000000010001428] = 00000000, %l2 = ffffffffffffffff
	lduw	[%i0+0x028],%l2		! %l2 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l0 = 00000000, %l1 = fd35fceb, Mem[0000000010001410] = 241749ff 4d001d06
	stda	%l0,[%i0+%o5]0x88	! Mem[0000000010001410] = 00000000 fd35fceb

p0_label_104:
!	Mem[0000000030041410] = 35ade500, %l0 = 0000000000000000
	swapa	[%i1+%o5]0x89,%l0	! %l0 = 0000000035ade500
!	%l5 = ffffffffffffffd7, Mem[0000000020800040] = a360b8ec
	sth	%l5,[%o1+0x040]		! Mem[0000000020800040] = ffd7b8ec
!	%l1 = d9e0ef2ffd35fceb, Mem[0000000010101408] = 9028bfa3
	stha	%l1,[%i4+%o4]0x80	! Mem[0000000010101408] = fcebbfa3
!	%l5 = ffffffffffffffd7, Mem[0000000030081408] = 00003dd7
	stha	%l5,[%i2+%o4]0x89	! Mem[0000000030081408] = 0000ffd7
!	Mem[0000000010181408] = 0099c199, %l4 = 00000000085de2f2
	swapa	[%i6+%o4]0x80,%l4	! %l4 = 000000000099c199
!	Mem[0000000010141410] = 000000ff, %l5 = ffffffffffffffd7
	swapa	[%i5+%o5]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030101408] = 085de2f2, %l3 = 00000000000000ff
	ldstuba	[%i4+%o4]0x81,%l3	! %l3 = 00000008000000ff
!	%f8  = ff000000 000000ff, Mem[0000000010041408] = 00000000 00000000
	stda	%f8 ,[%i1+%o4]0x80	! Mem[0000000010041408] = ff000000 000000ff
!	Mem[0000000010101410] = f2000000, %l4 = 000000000099c199
	swapa	[%i4+%o5]0x88,%l4	! %l4 = 00000000f2000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = 00000000, %l7 = 0000000000000000
	lduwa	[%i5+%o4]0x89,%l7	! %l7 = 0000000000000000

p0_label_105:
!	Mem[0000000010141434] = dbae39bf, %f15 = 00000000
	lda	[%i5+0x034]%asi,%f15	! %f15 = dbae39bf
!	Mem[0000000030141410] = fb666295, %l1 = d9e0ef2ffd35fceb
	lduha	[%i5+%o5]0x81,%l1	! %l1 = 000000000000fb66
!	Mem[0000000030001400] = 6dd78400cfd6fb74, %f10 = f6ffff1d 35ade500
	ldda	[%i0+%g0]0x81,%f10	! %f10 = 6dd78400 cfd6fb74
!	Mem[0000000010081410] = 6dd78400, %l5 = 00000000000000ff
	ldswa	[%i2+%o5]0x88,%l5	! %l5 = 000000006dd78400
!	Mem[0000000010101410] = 085de2ff0099c199, %f30 = 9028bfa3 d102b5cd
	ldda	[%i4+%o5]0x88,%f30	! %f30 = 085de2ff 0099c199
!	Mem[0000000010001428] = 00000000, %l3 = 0000000000000008
	lduha	[%i0+0x028]%asi,%l3	! %l3 = 0000000000000000
!	Mem[0000000010081430] = c348e552, %l5 = 000000006dd78400
	ldsb	[%i2+0x031],%l5		! %l5 = 0000000000000048
!	Mem[0000000010101400] = 35ade500, %f29 = 061dd94d
	lda	[%i4+%g0]0x88,%f29	! %f29 = 35ade500
!	Mem[0000000010101400] = 00e5ad35, %l3 = 0000000000000000
	ldsha	[%i4+%g0]0x80,%l3	! %l3 = 00000000000000e5
!	Starting 10 instruction Store Burst
!	Mem[0000000030101410] = ffffff00, %l2 = 0000000000000000
	ldstuba	[%i4+%o5]0x89,%l2	! %l2 = 00000000000000ff

!	Check Point 21 for processor 0

	set	p0_check_pt_data_21,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 0000000035ade500
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 000000000000fb66
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 0000000000000000
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 00000000000000e5
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l5,%g2			! %l5 = 0000000000000048
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l7,%g2			! %l7 = 0000000000000000
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x38],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 0084d76d 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x40],%g3
	std	%f8,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f8 = ff000000 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf08,%g1
	ldx	[%g4+0x48],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = 6dd78400 cfd6fb74
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x50],%g3
	std	%f14,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f14 = 00000000 dbae39bf
	bne	%xcc,p0_freg_check_fail
	mov	0xf14,%g1
	ldx	[%g4+0x58],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = 90ffffff ffffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1
	ldx	[%g4+0x60],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = a3bf2890 cdb502d1
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1
	ldx	[%g4+0x68],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = 783d37e1 ff000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1
	ldx	[%g4+0x70],%g3
	std	%f28,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f28 = 00ffffff 35ade500
	bne	%xcc,p0_freg_check_fail
	mov	0xf28,%g1
	ldx	[%g4+0x78],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = 085de2ff 0099c199
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 21 completed


p0_label_106:
!	%l3 = 00000000000000e5, Mem[00000000100c1400] = 783d37e1f2e2ffff
	stxa	%l3,[%i3+%g0]0x88	! Mem[00000000100c1400] = 00000000000000e5
!	%l4 = f2000000, %l5 = 00000048, Mem[0000000010081408] = d1020000 00000000
	stda	%l4,[%i2+%o4]0x88	! Mem[0000000010081408] = f2000000 00000048
!	%f26 = 783d37e1 ff000000, %l3 = 00000000000000e5
!	Mem[0000000010101438] = d9ff06f676945c96
	add	%i4,0x038,%g1
	stda	%f26,[%g1+%l3]ASI_PST16_PL ! Mem[0000000010101438] = 000006f6e1375c96
!	%l0 = 0000000035ade500, Mem[00000000300c1410] = 000000f2
	stwa	%l0,[%i3+%o5]0x81	! Mem[00000000300c1410] = 35ade500
!	%f24 = 020037e1, Mem[0000000010081408] = 000000f2
	sta	%f24,[%i2+%o4]0x80	! Mem[0000000010081408] = 020037e1
!	Mem[0000000021800001] = ff3e57e0, %l7 = 0000000000000000
	ldstub	[%o3+0x001],%l7		! %l7 = 0000003e000000ff
!	Mem[0000000010101410] = 99c19900, %l2 = 0000000000000000
	ldstuba	[%i4+%o5]0x80,%l2	! %l2 = 00000099000000ff
!	Mem[0000000030181408] = 000000ff, %l2 = 0000000000000099
	swapa	[%i6+%o4]0x89,%l2	! %l2 = 00000000000000ff
!	%l1 = 000000000000fb66, Mem[0000000010001410] = 00000000ebfc35fd
	stxa	%l1,[%i0+%o5]0x80	! Mem[0000000010001410] = 000000000000fb66
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = 0084d76d, %l2 = 00000000000000ff
	ldsba	[%i2+%o5]0x80,%l2	! %l2 = 0000000000000000

p0_label_107:
!	Mem[00000000211c0000] = 00ffa37b, %l3 = 00000000000000e5
	ldsha	[%o2+0x000]%asi,%l3	! %l3 = 00000000000000ff
!	Mem[000000001014141c] = e2b9cac1, %l3 = 00000000000000ff
	ldsh	[%i5+0x01e],%l3		! %l3 = ffffffffffffcac1
!	Mem[0000000030001410] = 00000000cdb502d1, %f16 = ff36de0f 00000000
	ldda	[%i0+%o5]0x81,%f16	! %f16 = 00000000 cdb502d1
!	Mem[0000000010081410] = 0084d76d, %l3 = ffffffffffffcac1
	lduwa	[%i2+%o5]0x80,%l3	! %l3 = 000000000084d76d
!	Mem[0000000010001408] = cd000000, %l7 = 000000000000003e
	ldswa	[%i0+%o4]0x88,%l7	! %l7 = ffffffffcd000000
!	Mem[0000000010141408] = f600000035ade5ff, %l3 = 000000000084d76d
	ldxa	[%i5+%o4]0x88,%l3	! %l3 = f600000035ade5ff
!	Mem[00000000300c1408] = 00ffffff, %l3 = f600000035ade5ff
	lduba	[%i3+%o4]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000030041400] = ff000000, %l7 = ffffffffcd000000
	ldsba	[%i1+%g0]0x81,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010101408] = fcebbfa3, %f19 = ffffffff
	lda	[%i4+%o4]0x80,%f19	! %f19 = fcebbfa3
!	Starting 10 instruction Store Burst
!	%l7 = ffffffffffffffff, Mem[0000000010141400] = fffb85ff, %asi = 80
	stwa	%l7,[%i5+0x000]%asi	! Mem[0000000010141400] = ffffffff

p0_label_108:
!	Mem[0000000030041410] = 00000000, %l2 = 0000000000000000
	swapa	[%i1+%o5]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000030041410] = 000000001dfffff6, %l3 = 0000000000000000
	ldxa	[%i1+%o5]0x81,%l3	! %l3 = 000000001dfffff6
!	%f8  = ff000000, Mem[0000000030101408] = f2e25dff
	sta	%f8 ,[%i4+%o4]0x89	! Mem[0000000030101408] = ff000000
!	%f2  = 00000000, Mem[0000000030181408] = 99000000
	sta	%f2 ,[%i6+%o4]0x81	! Mem[0000000030181408] = 00000000
!	%l1 = 000000000000fb66, Mem[0000000010181410] = ff000000ffffffff
	stx	%l1,[%i6+%o5]		! Mem[0000000010181410] = 000000000000fb66
!	%f14 = 00000000 dbae39bf, %l3 = 000000001dfffff6
!	Mem[0000000010141400] = ffffffff00000000
	stda	%f14,[%i5+%l3]ASI_PST32_P ! Mem[0000000010141400] = 0000000000000000
!	%l7 = ffffffffffffffff, Mem[0000000030141400] = ffe5ffff95000000
	stxa	%l7,[%i5+%g0]0x81	! Mem[0000000030141400] = ffffffffffffffff
!	%f16 = 00000000 cdb502d1 90ffffff fcebbfa3
!	%f20 = a3bf2890 cdb502d1 00000030 9085fb95
!	%f24 = 020037e1 ff1dd94d 783d37e1 ff000000
!	%f28 = 00ffffff 35ade500 085de2ff 0099c199
	stda	%f16,[%i0]ASI_COMMIT_P	! Block Store to 0000000010001400
!	%l3 = 000000001dfffff6, Mem[0000000010041438] = cdb502d1, %asi = 80
	stwa	%l3,[%i1+0x038]%asi	! Mem[0000000010041438] = 1dfffff6
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = 000000ff57002327, %l0 = 0000000035ade500
	ldxa	[%i6+%g0]0x80,%l0	! %l0 = 000000ff57002327

p0_label_109:
!	Mem[00000000300c1410] = 00e5ad35, %l7 = ffffffffffffffff
	lduha	[%i3+%o5]0x89,%l7	! %l7 = 000000000000ad35
!	Mem[0000000030181410] = bac200ff, %l5 = 0000000000000048
	lduba	[%i6+%o5]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[00000000100c1428] = d96af809005f0000, %f0  = 783d37e1 000000ff
	ldd	[%i3+0x028],%f0 	! %f0  = d96af809 005f0000
!	Mem[0000000030081408] = d7ff0000 ff000000, %l0 = 57002327, %l1 = 0000fb66
	ldda	[%i2+%o4]0x81,%l0	! %l0 = 00000000d7ff0000 00000000ff000000
!	Mem[0000000030041408] = d102b5ff, %f2  = 00000000
	lda	[%i1+%o4]0x89,%f2 	! %f2 = d102b5ff
!	Mem[0000000010081400] = 95000000, %l7 = 000000000000ad35
	ldswa	[%i2+%g0]0x80,%l7	! %l7 = ffffffff95000000
!	Mem[0000000030141400] = ffffffff, %l2 = 0000000000000000
	ldsha	[%i5+%g0]0x89,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000010081410] = 0084d76d00000000, %l3 = 000000001dfffff6
	ldxa	[%i2+0x010]%asi,%l3	! %l3 = 0084d76d00000000
!	Mem[0000000010081410] = 0084d76d, %l0 = 00000000d7ff0000
	lduw	[%i2+%o5],%l0		! %l0 = 000000000084d76d
!	Starting 10 instruction Store Burst
!	%f14 = 00000000 dbae39bf, %l4 = 00000000f2000000
!	Mem[00000000300c1420] = 578fe66806909cc7
	add	%i3,0x020,%g1
	stda	%f14,[%g1+%l4]ASI_PST32_SL ! Mem[00000000300c1420] = 578fe66806909cc7

p0_label_110:
!	%l6 = 0000000000000000, Mem[0000000010041428] = bbbb03aa88e58366
	stx	%l6,[%i1+0x028]		! Mem[0000000010041428] = 0000000000000000
!	Mem[0000000010141424] = 00000000, %l0 = 000000000084d76d
	swap	[%i5+0x024],%l0		! %l0 = 0000000000000000
!	%l5 = 00000000000000ff, Mem[0000000030081400] = 90ffffff
	stwa	%l5,[%i2+%g0]0x81	! Mem[0000000030081400] = 000000ff
	membar	#Sync			! Added by membar checker (27)
!	%l2 = ffffffffffffffff, Mem[0000000010001408] = a3bfebfcffffff90
	stxa	%l2,[%i0+%o4]0x88	! Mem[0000000010001408] = ffffffffffffffff
!	%f2  = d102b5ff 00003dff, Mem[0000000030081410] = 6dd7848f f2e25d08
	stda	%f2 ,[%i2+%o5]0x89	! Mem[0000000030081410] = d102b5ff 00003dff
!	Mem[000000001014143c] = 3b8aacb1, %l3 = 0084d76d00000000
	swap	[%i5+0x03c],%l3		! %l3 = 000000003b8aacb1
!	Mem[0000000010141429] = 000000ff, %l7 = ffffffff95000000
	ldstuba	[%i5+0x029]%asi,%l7	! %l7 = 00000000000000ff
!	%l6 = 0000000000000000, Mem[0000000010041438] = 1dfffff6a3bf2890
	stx	%l6,[%i1+0x038]		! Mem[0000000010041438] = 0000000000000000
!	Mem[0000000010041408] = 000000ff, %l4 = 00000000f2000000
	ldstuba	[%i1+%o4]0x88,%l4	! %l4 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = 00ffbfa3, %l7 = 0000000000000000
	ldsba	[%i3+%g0]0x81,%l7	! %l7 = 0000000000000000

!	Check Point 22 for processor 0

	set	p0_check_pt_data_22,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 0000000000000000
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l2,%g2			! %l2 = ffffffffffffffff
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l3,%g2			! %l3 = 000000003b8aacb1
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l4,%g2			! %l4 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l5,%g2			! %l5 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l7,%g2			! %l7 = 0000000000000000
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x38],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = d96af809 005f0000
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x40],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = d102b5ff 00003dff
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x48],%g3
	std	%f16,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f16 = 00000000 cdb502d1
	bne	%xcc,p0_freg_check_fail
	mov	0xf16,%g1
	ldx	[%g4+0x50],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = 90ffffff fcebbfa3
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1

!	Check Point 22 completed


p0_label_111:
!	Mem[0000000010181410] = 00000000, %l6 = 0000000000000000
	ldsba	[%i6+%o5]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000010001400] = 00000000, %l0 = 0000000000000000
	lduha	[%i0+%g0]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000010001410] = a3bf2890, %f0  = d96af809
	lda	[%i0+%o5]0x80,%f0 	! %f0 = a3bf2890
!	Mem[0000000010101400] = f6ffff1d35ade500, %l1 = 00000000ff000000
	ldxa	[%i4+%g0]0x88,%l1	! %l1 = f6ffff1d35ade500
!	Mem[00000000100c1400] = 000000e5, %l5 = 00000000000000ff
	ldsba	[%i3+%g0]0x88,%l5	! %l5 = ffffffffffffffe5
!	Mem[0000000030001400] = 6dd78400 cfd6fb74, %l6 = 00000000, %l7 = 00000000
	ldda	[%i0+%g0]0x81,%l6	! %l6 = 000000006dd78400 00000000cfd6fb74
!	Mem[0000000030141408] = 00000000, %l6 = 000000006dd78400
	ldswa	[%i5+%o4]0x81,%l6	! %l6 = 0000000000000000
!	Mem[00000000201c0000] = e2f2851d, %l4 = 00000000000000ff
	lduha	[%o0+0x000]%asi,%l4	! %l4 = 000000000000e2f2
!	Mem[0000000010101408] = 00000000 a3bfebfc, %l6 = 00000000, %l7 = cfd6fb74
	ldda	[%i4+%o4]0x88,%l6	! %l6 = 00000000a3bfebfc 0000000000000000
!	Starting 10 instruction Store Burst
!	%l2 = ffffffffffffffff, Mem[0000000010141400] = 00000000
	stba	%l2,[%i5+%g0]0x88	! Mem[0000000010141400] = 000000ff

p0_label_112:
!	%l3 = 000000003b8aacb1, Mem[0000000010181400] = 27230057ff000000
	stxa	%l3,[%i6+%g0]0x88	! Mem[0000000010181400] = 000000003b8aacb1
!	%l4 = 000000000000e2f2, Mem[0000000010181410] = 00000000
	stha	%l4,[%i6+%o5]0x88	! Mem[0000000010181410] = 0000e2f2
!	%l1 = f6ffff1d35ade500, Mem[0000000010181408] = f2e25d08
	stwa	%l1,[%i6+%o4]0x88	! Mem[0000000010181408] = 35ade500
!	%l7 = 0000000000000000, Mem[0000000030141400] = ffffffff
	stwa	%l7,[%i5+%g0]0x81	! Mem[0000000030141400] = 00000000
!	%f26 = 783d37e1 ff000000, Mem[0000000030101410] = ffffffff 1ce57e00
	stda	%f26,[%i4+%o5]0x89	! Mem[0000000030101410] = 783d37e1 ff000000
!	%l7 = 0000000000000000, Mem[0000000010101416] = ffe25d08
	sth	%l7,[%i4+0x016]		! Mem[0000000010101414] = ffe20000
!	Mem[0000000010181410] = 0000e2f2, %l1 = f6ffff1d35ade500
	swapa	[%i6+%o5]0x88,%l1	! %l1 = 000000000000e2f2
!	%l2 = ffffffff, %l3 = 3b8aacb1, Mem[0000000030181410] = ff00c2ba 6dd7848f
	stda	%l2,[%i6+%o5]0x81	! Mem[0000000030181410] = ffffffff 3b8aacb1
!	%l1 = 000000000000e2f2, Mem[0000000030081400] = ff000000
	stba	%l1,[%i2+%g0]0x89	! Mem[0000000030081400] = ff0000f2
!	Starting 10 instruction Load Burst
!	Code Fragment 4
p0_fragment_4:
!	%l0 = 0000000000000000
	setx	0xc3bee46023576981,%g7,%l0 ! %l0 = c3bee46023576981
!	%l1 = 000000000000e2f2
	setx	0x2b0cb79075eb8d80,%g7,%l1 ! %l1 = 2b0cb79075eb8d80
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = c3bee46023576981
	setx	0xb6a3b58facb54879,%g7,%l0 ! %l0 = b6a3b58facb54879
!	%l1 = 2b0cb79075eb8d80
	setx	0xd3c44b1029f706a6,%g7,%l1 ! %l1 = d3c44b1029f706a6

p0_label_113:
!	Mem[00000000201c0000] = e2f2851d, %l5 = ffffffffffffffe5
	ldsh	[%o0+%g0],%l5		! %l5 = ffffffffffffe2f2
!	Mem[0000000010141414] = 000000ff, %l1 = d3c44b1029f706a6
	ldswa	[%i5+0x014]%asi,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010101418] = cdb502d1, %l1 = 00000000000000ff
	lduba	[%i4+0x01b]%asi,%l1	! %l1 = 00000000000000d1
!	Mem[0000000030081410] = ff3d0000, %l0 = b6a3b58facb54879
	lduha	[%i2+%o5]0x81,%l0	! %l0 = 000000000000ff3d
!	Mem[00000000211c0000] = 00ffa37b, %l2 = ffffffffffffffff
	ldsba	[%o2+0x000]%asi,%l2	! %l2 = 0000000000000000
!	Mem[0000000030041400] = 000000ff, %l5 = ffffffffffffe2f2
	lduha	[%i1+%g0]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030041408] = ffb502d1, %l3 = 000000003b8aacb1
	ldsha	[%i1+%o4]0x81,%l3	! %l3 = ffffffffffffffb5
!	Mem[0000000010181400] = b1ac8a3b00000000, %l7 = 0000000000000000
	ldxa	[%i6+%g0]0x80,%l7	! %l7 = b1ac8a3b00000000
!	Mem[0000000030081408] = 000000ff0000ffd7, %f4  = 0084d76d 00000000
	ldda	[%i2+%o4]0x89,%f4 	! %f4  = 000000ff 0000ffd7
!	Starting 10 instruction Store Burst
!	Mem[0000000010101400] = 00e5ad35, %l3 = ffffffffffffffb5
	ldstuba	[%i4+%g0]0x80,%l3	! %l3 = 00000000000000ff

p0_label_114:
!	%l4 = 000000000000e2f2, Mem[0000000030181400] = dbae39bf00000000
	stxa	%l4,[%i6+%g0]0x89	! Mem[0000000030181400] = 000000000000e2f2
!	%l0 = 000000000000ff3d, Mem[00000000100c1414] = 0975ffa8
	sth	%l0,[%i3+0x014]		! Mem[00000000100c1414] = ff3dffa8
!	%l6 = a3bfebfc, %l7 = 00000000, Mem[0000000010141430] = 00000000 dbae39bf
	stda	%l6,[%i5+0x030]%asi	! Mem[0000000010141430] = a3bfebfc 00000000
!	%l3 = 0000000000000000, Mem[0000000010141400] = ff000000
	stha	%l3,[%i5+%g0]0x80	! Mem[0000000010141400] = 00000000
!	%l2 = 00000000, %l3 = 00000000, Mem[00000000100c1408] = 00000000 00000000
	stda	%l2,[%i3+%o4]0x88	! Mem[00000000100c1408] = 00000000 00000000
!	Mem[0000000010001400] = 00000000, %l7 = b1ac8a3b00000000
	swapa	[%i0+%g0]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000020800001] = 00959984, %l3 = 0000000000000000
	ldstub	[%o1+0x001],%l3		! %l3 = 00000095000000ff
!	Mem[0000000030141410] = fb666295, %l0 = 000000000000ff3d
	ldstuba	[%i5+%o5]0x81,%l0	! %l0 = 000000fb000000ff
!	Mem[00000000201c0001] = e2f2851d, %l3 = 0000000000000095
	ldstub	[%o0+0x001],%l3		! %l3 = 000000f2000000ff
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (28)
!	Mem[0000000010101400] = ffe5ad35 1dfffff6 fcebbfa3 00000000
!	Mem[0000000010101410] = ffc19900 ffe20000 cdb502d1 295bdcc7
!	Mem[0000000010101420] = 518a9713 775b9449 9c873bb5 6e1e92a8
!	Mem[0000000010101430] = b855c84f ed0f510e 000006f6 e1375c96
	ldda	[%i4]ASI_BLK_PL,%f16	! Block Load from 0000000010101400

p0_label_115:
!	Mem[0000000020800040] = ffd7b8ec, %l3 = 00000000000000f2
	lduh	[%o1+0x040],%l3		! %l3 = 000000000000ffd7
!	Mem[0000000030181400] = 00000000 0000e2f2, %l6 = a3bfebfc, %l7 = 00000000
	ldda	[%i6+%g0]0x89,%l6	! %l6 = 000000000000e2f2 0000000000000000
!	Mem[00000000300c1410] = 35ade500b16f0000, %f4  = 000000ff 0000ffd7
	ldda	[%i3+%o5]0x81,%f4 	! %f4  = 35ade500 b16f0000
!	Mem[0000000010001428] = 783d37e1 ff000000, %l0 = 000000fb, %l1 = 000000d1
	ldd	[%i0+0x028],%l0		! %l0 = 00000000783d37e1 00000000ff000000
!	Mem[0000000010041430] = 4dd91d06 37dfff85, %l6 = 0000e2f2, %l7 = 00000000
	ldd	[%i1+0x030],%l6		! %l6 = 000000004dd91d06 0000000037dfff85
!	Mem[0000000030001408] = 9028bfa3, %l3 = 000000000000ffd7
	lduba	[%i0+%o4]0x81,%l3	! %l3 = 0000000000000090
!	Mem[0000000010101400] = ffe5ad351dfffff6, %f12 = 9449358f fb666295
	ldd	[%i4+%g0],%f12		! %f12 = ffe5ad35 1dfffff6
!	Mem[0000000030181408] = 00000000, %l1 = 00000000ff000000
	lduba	[%i6+%o4]0x89,%l1	! %l1 = 0000000000000000
!	Mem[00000000201c0000] = e2ff851d, %l6 = 000000004dd91d06
	ldsb	[%o0+%g0],%l6		! %l6 = ffffffffffffffe2
!	Starting 10 instruction Store Burst
!	Mem[0000000030041400] = ff000000 ff000000 ffb502d1 bf39aedb
!	Mem[0000000030041410] = 00000000 1dfffff6 3b1ed75a 1b41e871
!	Mem[0000000030041420] = 2723af57 ffffcdb1 99c19949 99c1993d
!	Mem[0000000030041430] = 93ab8046 52e548c3 7403c892 43ca1dd3
	ldda	[%i1]ASI_BLK_S,%f0	! Block Load from 0000000030041400

!	Check Point 23 for processor 0

	set	p0_check_pt_data_23,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 00000000783d37e1
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
	cmp	%l3,%g2			! %l3 = 0000000000000090
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 000000000000e2f2
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = ffffffffffffffe2
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 0000000037dfff85
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = ff000000 ff000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x50],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = ffb502d1 bf39aedb
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x58],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 00000000 1dfffff6
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x60],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 3b1ed75a 1b41e871
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x68],%g3
	std	%f8,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f8 = 2723af57 ffffcdb1
	bne	%xcc,p0_freg_check_fail
	mov	0xf08,%g1
	ldx	[%g4+0x70],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = 99c19949 99c1993d
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x78],%g3
	std	%f12,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f12 = 93ab8046 52e548c3
	bne	%xcc,p0_freg_check_fail
	mov	0xf12,%g1
	ldx	[%g4+0x80],%g3
	std	%f14,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f14 = 7403c892 43ca1dd3
	bne	%xcc,p0_freg_check_fail
	mov	0xf14,%g1
	ldx	[%g4+0x88],%g3
	std	%f16,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f16 = f6ffff1d 35ade5ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf16,%g1
	ldx	[%g4+0x90],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = 00000000 a3bfebfc
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1
	ldx	[%g4+0x98],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = 0000e2ff 0099c1ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1
	ldx	[%g4+0xa0],%g3
	std	%f22,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f22 = c7dc5b29 d102b5cd
	bne	%xcc,p0_freg_check_fail
	mov	0xf22,%g1
	ldx	[%g4+0xa8],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = 49945b77 13978a51
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1
	ldx	[%g4+0xb0],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = a8921e6e b53b879c
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1
	ldx	[%g4+0xb8],%g3
	std	%f28,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f28 = 0e510fed 4fc855b8
	bne	%xcc,p0_freg_check_fail
	mov	0xf28,%g1
	ldx	[%g4+0xc0],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = 965c37e1 f6060000
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 23 completed


p0_label_116:
!	Mem[0000000010101400] = ffe5ad35, %l1 = 0000000000000000
	swapa	[%i4+%g0]0x80,%l1	! %l1 = 00000000ffe5ad35
!	%l0 = 00000000783d37e1, Mem[0000000010041410] = f2e25d08a3ffffff
	stxa	%l0,[%i1+%o5]0x80	! Mem[0000000010041410] = 00000000783d37e1
	membar	#Sync			! Added by membar checker (29)
!	%f24 = 49945b77 13978a51, %l5 = 00000000000000ff
!	Mem[0000000010101410] = ffc19900ffe20000
	add	%i4,0x010,%g1
	stda	%f24,[%g1+%l5]ASI_PST32_PL ! Mem[0000000010101410] = 518a9713775b9449
!	Mem[0000000010101428] = 9c873bb56e1e92a8, %l2 = 0000000000000000, %l6 = ffffffffffffffe2
	add	%i4,0x28,%g1
	casxa	[%g1]0x80,%l2,%l6	! %l6 = 9c873bb56e1e92a8
!	%f20 = 0000e2ff 0099c1ff, Mem[0000000030101408] = ff000000 a3ffffff
	stda	%f20,[%i4+%o4]0x89	! Mem[0000000030101408] = 0000e2ff 0099c1ff
!	Mem[0000000010081438] = 68e68f57, %l5 = 000000ff, %l2 = 00000000
	add	%i2,0x38,%g1
	casa	[%g1]0x80,%l5,%l2	! %l2 = 0000000068e68f57
!	%l6 = 6e1e92a8, %l7 = 37dfff85, Mem[0000000010081400] = 00000095 00000000
	stda	%l6,[%i2+%g0]0x88	! Mem[0000000010081400] = 6e1e92a8 37dfff85
!	%l6 = 9c873bb56e1e92a8, Mem[00000000100c1438] = ffffff90, %asi = 80
	stba	%l6,[%i3+0x038]%asi	! Mem[00000000100c1438] = a8ffff90
!	%l2 = 0000000068e68f57, Mem[0000000010141408] = 35ade5ff
	stwa	%l2,[%i5+%o4]0x88	! Mem[0000000010141408] = 68e68f57
!	Starting 10 instruction Load Burst
!	Mem[00000000218000c0] = 0030d561, %l2 = 0000000068e68f57
	ldsb	[%o3+0x0c0],%l2		! %l2 = 0000000000000000

p0_label_117:
!	Mem[0000000030041400] = 000000ff, %l3 = 0000000000000090
	lduba	[%i1+%g0]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010041410] = 00000000, %l6 = 9c873bb56e1e92a8
	ldsha	[%i1+%o5]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000030041408] = d102b5ff, %l1 = 00000000ffe5ad35
	ldswa	[%i1+%o4]0x89,%l1	! %l1 = ffffffffd102b5ff
!	Mem[0000000010001400] = 00000000, %l7 = 0000000037dfff85
	lduwa	[%i0+%g0]0x88,%l7	! %l7 = 0000000000000000
!	Mem[00000000100c1400] = 000000e5, %l2 = 0000000000000000
	lduha	[%i3+%g0]0x88,%l2	! %l2 = 00000000000000e5
!	Mem[0000000010101410] = 49945b7713978a51, %f10 = 99c19949 99c1993d
	ldda	[%i4+%o5]0x88,%f10	! %f10 = 49945b77 13978a51
!	Mem[0000000010081410] = 6dd78400, %l2 = 00000000000000e5
	ldsba	[%i2+%o5]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000030181400] = f2e20000, %l3 = 00000000000000ff
	lduwa	[%i6+%g0]0x81,%l3	! %l3 = 00000000f2e20000
!	Mem[00000000211c0000] = 00ffa37b, %l2 = 0000000000000000
	ldub	[%o2+0x001],%l2		! %l2 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[00000000201c0000] = e2ff851d, %l5 = 00000000000000ff
	ldstub	[%o0+%g0],%l5		! %l5 = 000000e2000000ff

p0_label_118:
!	Mem[0000000010101420] = 518a9713, %l2 = 00000000000000ff
	ldstuba	[%i4+0x020]%asi,%l2	! %l2 = 00000051000000ff
!	Mem[0000000010181410] = 00e5ad35, %l1 = ffffffffd102b5ff
	ldswa	[%i6+%o5]0x80,%l1	! %l1 = 0000000000e5ad35
!	%f16 = f6ffff1d 35ade5ff 00000000 a3bfebfc
!	%f20 = 0000e2ff 0099c1ff c7dc5b29 d102b5cd
!	%f24 = 49945b77 13978a51 a8921e6e b53b879c
!	%f28 = 0e510fed 4fc855b8 965c37e1 f6060000
	stda	%f16,[%i3]ASI_BLK_S	! Block Store to 00000000300c1400
!	%l1 = 0000000000e5ad35, Mem[0000000030081410] = ff3d0000
	stha	%l1,[%i2+%o5]0x81	! Mem[0000000030081410] = ad350000
!	%f16 = f6ffff1d 35ade5ff 00000000 a3bfebfc
!	%f20 = 0000e2ff 0099c1ff c7dc5b29 d102b5cd
!	%f24 = 49945b77 13978a51 a8921e6e b53b879c
!	%f28 = 0e510fed 4fc855b8 965c37e1 f6060000
	stda	%f16,[%i1]ASI_BLK_AIUSL	! Block Store to 0000000030041400
!	%f6  = 3b1ed75a 1b41e871, Mem[0000000030001408] = a3bf2890 24174994
	stda	%f6 ,[%i0+%o4]0x89	! Mem[0000000030001408] = 3b1ed75a 1b41e871
!	Mem[0000000010101408] = a3bfebfc, %l6 = 0000000000000000
	swapa	[%i4+%o4]0x88,%l6	! %l6 = 00000000a3bfebfc
!	%l0 = 00000000783d37e1, Mem[0000000010101408] = 0000000000000000
	stxa	%l0,[%i4+%o4]0x80	! Mem[0000000010101408] = 00000000783d37e1
!	Mem[000000001010141b] = cdb502d1, %l7 = 0000000000000000
	ldstub	[%i4+0x01b],%l7		! %l7 = 000000d1000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = 35ade500, %l2 = 0000000000000051
	lduwa	[%i6+%o4]0x88,%l2	! %l2 = 0000000035ade500

p0_label_119:
!	Mem[0000000010181400] = 3b8aacb1, %l5 = 00000000000000e2
	lduha	[%i6+%g0]0x88,%l5	! %l5 = 000000000000acb1
	membar	#Sync			! Added by membar checker (30)
!	Mem[00000000300c1400] = 1dfffff6, %l6 = 00000000a3bfebfc
	ldsba	[%i3+%g0]0x89,%l6	! %l6 = fffffffffffffff6
!	Mem[0000000010041410] = 00000000, %f2  = ffb502d1
	lda	[%i1+%o5]0x88,%f2 	! %f2 = 00000000
!	Mem[0000000030041410] = ffc19900ffe20000, %l3 = 00000000f2e20000
	ldxa	[%i1+%o5]0x81,%l3	! %l3 = ffc19900ffe20000
!	Mem[00000000211c0000] = 00ffa37b, %l0 = 00000000783d37e1
	ldsh	[%o2+%g0],%l0		! %l0 = 00000000000000ff
!	Mem[00000000300c1400] = 1dfffff6, %l7 = 00000000000000d1
	lduba	[%i3+%g0]0x89,%l7	! %l7 = 00000000000000f6
!	Mem[0000000010181408] = 00e5ad35, %l3 = ffc19900ffe20000
	lduwa	[%i6+%o4]0x80,%l3	! %l3 = 0000000000e5ad35
!	Mem[0000000030181400] = f2e20000, %l5 = 000000000000acb1
	lduwa	[%i6+%g0]0x81,%l5	! %l5 = 00000000f2e20000
!	Mem[0000000010041410] = e1373d78 00000000, %l2 = 35ade500, %l3 = 00e5ad35
	ldda	[%i1+%o5]0x88,%l2	! %l2 = 0000000000000000 00000000e1373d78
!	Starting 10 instruction Store Burst
!	%l4 = 000000000000e2f2, Mem[0000000030141400] = 00000000
	stba	%l4,[%i5+%g0]0x81	! Mem[0000000030141400] = f2000000

p0_label_120:
!	%l0 = 00000000000000ff, Mem[0000000010041434] = 37dfff85, %asi = 80
	stwa	%l0,[%i1+0x034]%asi	! Mem[0000000010041434] = 000000ff
!	Mem[0000000010041400] = 00000000, %l4 = 000000000000e2f2
	ldstuba	[%i1+%g0]0x88,%l4	! %l4 = 00000000000000ff
!	%l4 = 0000000000000000, Mem[0000000030101400] = 0fde36ff
	stwa	%l4,[%i4+%g0]0x89	! Mem[0000000030101400] = 00000000
!	Mem[0000000030001410] = 00000000, %l5 = 00000000f2e20000
	ldstuba	[%i0+%o5]0x81,%l5	! %l5 = 00000000000000ff
!	%l6 = fffffffffffffff6, Mem[0000000030041408] = fcebbfa3
	stha	%l6,[%i1+%o4]0x81	! Mem[0000000030041408] = fff6bfa3
!	Mem[0000000030181410] = ffffffff, %l6 = fffffffffffffff6
	swapa	[%i6+%o5]0x81,%l6	! %l6 = 00000000ffffffff
!	%f10 = 49945b77 13978a51, Mem[0000000010081410] = 0084d76d 00000000
	stda	%f10,[%i2+0x010]%asi	! Mem[0000000010081410] = 49945b77 13978a51
!	Mem[0000000010141408] = 68e68f57, %l3 = 00000000e1373d78
	swapa	[%i5+%o4]0x88,%l3	! %l3 = 0000000068e68f57
!	Mem[0000000010101400] = 00000000, %l5 = 0000000000000000
	ldstuba	[%i4+%g0]0x80,%l5	! %l5 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030181410] = fffffff6 3b8aacb1, %l6 = ffffffff, %l7 = 000000f6
	ldda	[%i6+%o5]0x81,%l6	! %l6 = 00000000fffffff6 000000003b8aacb1

!	Check Point 24 for processor 0

	set	p0_check_pt_data_24,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 0000000000e5ad35
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 0000000000000000
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 0000000068e68f57
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
	cmp	%l6,%g2			! %l6 = 00000000fffffff6
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 000000003b8aacb1
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = 00000000 bf39aedb
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x50],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 3b1ed75a 1b41e871
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x58],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = 49945b77 13978a51
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1

!	Check Point 24 completed


p0_label_121:
!	Mem[0000000010001400] = d102b5cd 00000000, %l4 = 00000000, %l5 = 00000000
	ldda	[%i0+%g0]0x88,%l4	! %l4 = 0000000000000000 00000000d102b5cd
!	Mem[0000000030181400] = 000000000000e2f2, %f22 = c7dc5b29 d102b5cd
	ldda	[%i6+%g0]0x89,%f22	! %f22 = 00000000 0000e2f2
!	Mem[0000000010041400] = ff000000, %l7 = 000000003b8aacb1
	ldub	[%i1+%g0],%l7		! %l7 = 00000000000000ff
!	Mem[0000000030101410] = ff000000, %f24 = 49945b77
	lda	[%i4+%o5]0x89,%f24	! %f24 = ff000000
!	Mem[0000000010181408] = 35ade500, %l3 = 0000000068e68f57
	lduha	[%i6+%o4]0x88,%l3	! %l3 = 000000000000e500
!	Mem[0000000030081400] = f20000ff ffffffff, %l4 = 00000000, %l5 = d102b5cd
	ldda	[%i2+%g0]0x81,%l4	! %l4 = 00000000f20000ff 00000000ffffffff
	membar	#Sync			! Added by membar checker (31)
!	Mem[0000000030101400] = 00000000 00000000 ffc19900 ffe20000
!	Mem[0000000030101410] = 000000ff e1373d78 135abbdb c99b887f
!	Mem[0000000030101420] = 5311e374 ddae6b21 58753f2f 3473a3d9
!	Mem[0000000030101430] = 3a01337c dc6b25e8 18295d59 c1b881ee
	ldda	[%i4]ASI_BLK_S,%f16	! Block Load from 0000000030101400
!	Mem[0000000010001418] = 000000309085fb95, %f2  = 00000000 bf39aedb
	ldd	[%i0+0x018],%f2 	! %f2  = 00000030 9085fb95
!	Mem[0000000030181408] = 00000000, %l0 = 00000000000000ff
	lduwa	[%i6+%o4]0x81,%l0	! %l0 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l2 = 0000000000000000, Mem[0000000030081408] = d7ff0000
	stha	%l2,[%i2+%o4]0x81	! Mem[0000000030081408] = 00000000

p0_label_122:
!	Mem[00000000300c1408] = 00000000, %l4 = 00000000f20000ff
	swapa	[%i3+%o4]0x81,%l4	! %l4 = 0000000000000000
!	%l2 = 0000000000000000, Mem[0000000010081410] = 518a9713775b9449
	stxa	%l2,[%i2+%o5]0x88	! Mem[0000000010081410] = 0000000000000000
!	%l7 = 00000000000000ff, Mem[0000000010081410] = 00000000
	stha	%l7,[%i2+%o5]0x80	! Mem[0000000010081410] = 00ff0000
!	%f14 = 7403c892 43ca1dd3, %l4 = 0000000000000000
!	Mem[0000000030041418] = cdb502d1295bdcc7
	add	%i1,0x018,%g1
	stda	%f14,[%g1+%l4]ASI_PST32_S ! Mem[0000000030041418] = cdb502d1295bdcc7
!	%f6  = 3b1ed75a, Mem[0000000010181400] = b1ac8a3b
	sta	%f6 ,[%i6+%g0]0x80	! Mem[0000000010181400] = 3b1ed75a
!	%l3 = 000000000000e500, Mem[0000000030041400] = ffe5ad35
	stba	%l3,[%i1+%g0]0x81	! Mem[0000000030041400] = 00e5ad35
!	Mem[0000000030001408] = 1b41e871, %l0 = 0000000000000000
	ldstuba	[%i0+%o4]0x89,%l0	! %l0 = 00000071000000ff
!	Mem[00000000100c1418] = a8ff7509, %l0 = 0000000000000071
	ldstuba	[%i3+0x018]%asi,%l0	! %l0 = 000000a8000000ff
!	%f4  = 00000000 1dfffff6, %l0 = 00000000000000a8
!	Mem[0000000030001430] = f6da05dad78f5fd2
	add	%i0,0x030,%g1
	stda	%f4,[%g1+%l0]ASI_PST32_SL ! Mem[0000000030001430] = f6da05dad78f5fd2
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = 1b41e8ff, %l6 = 00000000fffffff6
	ldsba	[%i0+%o4]0x89,%l6	! %l6 = ffffffffffffffff

p0_label_123:
!	Mem[0000000030081408] = 00000000, %l2 = 0000000000000000
	ldsba	[%i2+%o4]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000030081400] = f20000ff, %l0 = 00000000000000a8
	lduwa	[%i2+%g0]0x81,%l0	! %l0 = 00000000f20000ff
!	Mem[0000000010001418] = 00000030, %l0 = 00000000f20000ff
	lduha	[%i0+0x018]%asi,%l0	! %l0 = 0000000000000000
!	Mem[0000000030081410] = ad350000ffb502d1, %f0  = ff000000 ff000000
	ldda	[%i2+%o5]0x81,%f0 	! %f0  = ad350000 ffb502d1
!	Mem[0000000030141400] = 000000f2, %l5 = 00000000ffffffff
	lduha	[%i5+%g0]0x89,%l5	! %l5 = 00000000000000f2
!	Mem[0000000010081400] = a8921e6e, %l6 = ffffffffffffffff
	ldswa	[%i2+%g0]0x80,%l6	! %l6 = ffffffffa8921e6e
!	Mem[00000000300c1400] = f6ffff1d35ade5ff, %l3 = 000000000000e500
	ldxa	[%i3+%g0]0x81,%l3	! %l3 = f6ffff1d35ade5ff
!	Mem[0000000010101400] = ff000000, %l2 = 0000000000000000
	ldsba	[%i4+0x001]%asi,%l2	! %l2 = 0000000000000000
!	Mem[0000000030081400] = f20000ffffffffff, %l0 = 0000000000000000
	ldxa	[%i2+%g0]0x81,%l0	! %l0 = f20000ffffffffff
!	Starting 10 instruction Store Burst
!	%l6 = ffffffffa8921e6e, Mem[0000000030001400] = 0084d76d
	stwa	%l6,[%i0+%g0]0x89	! Mem[0000000030001400] = a8921e6e

p0_label_124:
!	%l2 = 0000000000000000, Mem[00000000100c1402] = e5000000, %asi = 80
	stha	%l2,[%i3+0x002]%asi	! Mem[00000000100c1400] = e5000000
!	Mem[0000000030141410] = ff666295, %l1 = 0000000000e5ad35
	ldstuba	[%i5+%o5]0x81,%l1	! %l1 = 000000ff000000ff
!	%f14 = 7403c892 43ca1dd3, Mem[0000000010141408] = e1373d78 f6000000
	stda	%f14,[%i5+%o4]0x88	! Mem[0000000010141408] = 7403c892 43ca1dd3
!	%l7 = 00000000000000ff, Mem[0000000010001400] = 00000000cdb502d1, %asi = 80
	stxa	%l7,[%i0+0x000]%asi	! Mem[0000000010001400] = 00000000000000ff
!	Mem[0000000020800041] = ffd7b8ec, %l7 = 00000000000000ff
	ldstuba	[%o1+0x041]%asi,%l7	! %l7 = 000000d7000000ff
!	Mem[0000000010001410] = 9028bfa3, %l0 = f20000ffffffffff
	ldstuba	[%i0+%o5]0x88,%l0	! %l0 = 000000a3000000ff
!	%l0 = 00000000000000a3, Mem[0000000021800100] = 7ed35a3e, %asi = 80
	stba	%l0,[%o3+0x100]%asi	! Mem[0000000021800100] = a3d35a3e
	membar	#Sync			! Added by membar checker (32)
!	%l0 = 00000000000000a3, Mem[0000000030101408] = ffc19900
	stwa	%l0,[%i4+%o4]0x81	! Mem[0000000030101408] = 000000a3
!	%f23 = c99b887f, Mem[0000000030081410] = ad350000
	sta	%f23,[%i2+%o5]0x81	! Mem[0000000030081410] = c99b887f
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = 0099c1ff, %l5 = 00000000000000f2
	lduha	[%i1+%o5]0x89,%l5	! %l5 = 000000000000c1ff

p0_label_125:
!	Mem[0000000010181400] = 3b1ed75a, %l1 = 00000000000000ff
	ldsba	[%i6+%g0]0x80,%l1	! %l1 = 000000000000003b
!	Mem[0000000010101434] = ed0f510e, %l3 = f6ffff1d35ade5ff
	lduh	[%i4+0x034],%l3		! %l3 = 000000000000ed0f
!	Mem[0000000030041400] = 00e5ad351dfffff6, %l1 = 000000000000003b
	ldxa	[%i1+%g0]0x81,%l1	! %l1 = 00e5ad351dfffff6
!	Mem[0000000030181400] = 000000000000e2f2, %f12 = 93ab8046 52e548c3
	ldda	[%i6+%g0]0x89,%f12	! %f12 = 00000000 0000e2f2
!	Mem[0000000010141400] = 00000000, %l5 = 000000000000c1ff
	ldswa	[%i5+%g0]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000010081434] = 24174994, %l6 = ffffffffa8921e6e
	lduw	[%i2+0x034],%l6		! %l6 = 0000000024174994
!	Mem[0000000010001410] = 9028bfff, %l2 = 0000000000000000
	ldsha	[%i0+%o5]0x88,%l2	! %l2 = ffffffffffffbfff
!	Mem[0000000030001410] = ff000000cdb502d1, %l4 = 0000000000000000
	ldxa	[%i0+%o5]0x81,%l4	! %l4 = ff000000cdb502d1
!	Mem[0000000010181408] = 00e5ad35, %f4  = 00000000
	lda	[%i6+%o4]0x80,%f4 	! %f4 = 00e5ad35
!	Starting 10 instruction Store Burst
!	%f21 = e1373d78, Mem[0000000010181430] = 622881be
	sta	%f21,[%i6+0x030]%asi	! Mem[0000000010181430] = e1373d78

!	Check Point 25 for processor 0

	set	p0_check_pt_data_25,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 00000000000000a3
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 00e5ad351dfffff6
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = ffffffffffffbfff
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 000000000000ed0f
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = ff000000cdb502d1
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 0000000000000000
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 0000000024174994
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 00000000000000d7
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = ad350000 ffb502d1
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x50],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = 00000030 9085fb95
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x58],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 00e5ad35 1dfffff6
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x60],%g3
	std	%f12,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f12 = 00000000 0000e2f2
	bne	%xcc,p0_freg_check_fail
	mov	0xf12,%g1
	ldx	[%g4+0x68],%g3
	std	%f16,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f16 = 00000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf16,%g1
	ldx	[%g4+0x70],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = ffc19900 ffe20000
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1
	ldx	[%g4+0x78],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = 000000ff e1373d78
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1
	ldx	[%g4+0x80],%g3
	std	%f22,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f22 = 135abbdb c99b887f
	bne	%xcc,p0_freg_check_fail
	mov	0xf22,%g1
	ldx	[%g4+0x88],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = 5311e374 ddae6b21
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1
	ldx	[%g4+0x90],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = 58753f2f 3473a3d9
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1
	ldx	[%g4+0x98],%g3
	std	%f28,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f28 = 3a01337c dc6b25e8
	bne	%xcc,p0_freg_check_fail
	mov	0xf28,%g1
	ldx	[%g4+0xa0],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = 18295d59 c1b881ee
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 25 completed


p0_label_126:
!	Mem[0000000010141408] = d31dca43, %l7 = 00000000000000d7
	swapa	[%i5+%o4]0x80,%l7	! %l7 = 00000000d31dca43
!	Mem[00000000201c0000] = ffff851d, %l6 = 0000000024174994
	ldstub	[%o0+%g0],%l6		! %l6 = 000000ff000000ff
!	%l6 = 00000000000000ff, Mem[0000000030041400] = f6ffff1d35ade500
	stxa	%l6,[%i1+%g0]0x89	! Mem[0000000030041400] = 00000000000000ff
!	Mem[0000000010041400] = 000000ff, %l5 = 0000000000000000
	swapa	[%i1+%g0]0x88,%l5	! %l5 = 00000000000000ff
!	%f18 = ffc19900 ffe20000, %l4 = ff000000cdb502d1
!	Mem[0000000030181408] = 0000000000000000
	add	%i6,0x008,%g1
	stda	%f18,[%g1+%l4]ASI_PST32_S ! Mem[0000000030181408] = 00000000ffe20000
!	Mem[0000000010181400] = 3b1ed75a, %l4 = ff000000cdb502d1
	swapa	[%i6+%g0]0x80,%l4	! %l4 = 000000003b1ed75a
!	Mem[0000000030081408] = 00000000, %l5 = 00000000000000ff
	ldstuba	[%i2+%o4]0x81,%l5	! %l5 = 00000000000000ff
!	Mem[00000000211c0000] = 00ffa37b, %l7 = 00000000d31dca43
	ldstub	[%o2+%g0],%l7		! %l7 = 00000000000000ff
!	%f28 = 3a01337c dc6b25e8, Mem[0000000030081410] = c99b887f ffb502d1
	stda	%f28,[%i2+%o5]0x81	! Mem[0000000030081410] = 3a01337c dc6b25e8
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = f6000000, %l0 = 00000000000000a3
	lduwa	[%i3+%o5]0x88,%l0	! %l0 = 00000000f6000000

p0_label_127:
!	Mem[0000000010081408] = 00000048e1370002, %l1 = 00e5ad351dfffff6
	ldxa	[%i2+%o4]0x88,%l1	! %l1 = 00000048e1370002
!	Mem[0000000010001408] = ffffffff, %l3 = 000000000000ed0f
	lduwa	[%i0+%o4]0x88,%l3	! %l3 = 00000000ffffffff
!	Mem[0000000030141408] = 00000000f2e25d08, %l1 = 00000048e1370002
	ldxa	[%i5+%o4]0x81,%l1	! %l1 = 00000000f2e25d08
!	Mem[0000000010041408] = 000000ff, %l3 = 00000000ffffffff
	ldsha	[%i1+%o4]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010141408] = d7000000, %l3 = 00000000000000ff
	ldsha	[%i5+%o4]0x88,%l3	! %l3 = 0000000000000000
!	Mem[00000000100c1408] = 0000000000000000, %l4 = 000000003b1ed75a
	ldxa	[%i3+%o4]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000010081408] = e1370002, %l4 = 0000000000000000
	lduwa	[%i2+%o4]0x88,%l4	! %l4 = 00000000e1370002
!	Mem[0000000030141400] = f2000000, %l0 = 00000000f6000000
	ldswa	[%i5+%g0]0x81,%l0	! %l0 = fffffffff2000000
!	Mem[00000000100c1408] = 00000000, %l7 = 0000000000000000
	ldswa	[%i3+%o4]0x80,%l7	! %l7 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l4 = 00000000e1370002, Mem[00000000201c0000] = ffff851d
	stb	%l4,[%o0+%g0]		! Mem[00000000201c0000] = 02ff851d

p0_label_128:
!	Mem[0000000010081410] = 00ff0000, %l6 = 00000000000000ff
	ldstuba	[%i2+%o5]0x80,%l6	! %l6 = 00000000000000ff
!	%l3 = 0000000000000000, Mem[0000000010181430] = e1373d78ffffde0f
	stx	%l3,[%i6+0x030]		! Mem[0000000010181430] = 0000000000000000
!	%f15 = 43ca1dd3, Mem[0000000010081410] = 0000ffff
	sta	%f15,[%i2+%o5]0x88	! Mem[0000000010081410] = 43ca1dd3
!	Mem[0000000010041400] = 00000000, %l2 = ffffffffffffbfff
	ldstuba	[%i1+%g0]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030081410] = 7c33013a, %l3 = 0000000000000000
	swapa	[%i2+%o5]0x89,%l3	! %l3 = 000000007c33013a
!	%f5  = 1dfffff6, Mem[0000000030181408] = 00000000
	sta	%f5 ,[%i6+%o4]0x89	! Mem[0000000030181408] = 1dfffff6
!	%l0 = fffffffff2000000, Mem[0000000030081410] = 00000000
	stwa	%l0,[%i2+%o5]0x81	! Mem[0000000030081410] = f2000000
!	Mem[0000000010141408] = d7000000, %l3 = 000000007c33013a
	ldswa	[%i5+%o4]0x88,%l3	! %l3 = ffffffffd7000000
!	%l3 = ffffffffd7000000, Mem[0000000010081407] = 85ffdf37, %asi = 80
	stba	%l3,[%i2+0x007]%asi	! Mem[0000000010081404] = 85ffdf00
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = 00000000f2e25d08, %f28 = 3a01337c dc6b25e8
	ldda	[%i5+%o4]0x81,%f28	! %f28 = 00000000 f2e25d08

p0_label_129:
!	Mem[0000000010101408] = 00000000783d37e1, %l4 = 00000000e1370002
	ldxa	[%i4+%o4]0x80,%l4	! %l4 = 00000000783d37e1
!	Mem[0000000030081410] = e8256bdc 000000f2, %l4 = 783d37e1, %l5 = 00000000
	ldda	[%i2+%o5]0x89,%l4	! %l4 = 00000000000000f2 00000000e8256bdc
	membar	#Sync			! Added by membar checker (33)
!	Mem[0000000010081400] = a8921e6e 85ffdf00 020037e1 48000000
!	Mem[0000000010081410] = d31dca43 00000000 d96af809 005f0000
!	Mem[0000000010081420] = 000000ff 005f0000 3d780000 00000000
!	Mem[0000000010081430] = c348e552 24174994 68e68f57 b1cdffff
	ldda	[%i2]ASI_BLK_AIUP,%f16	! Block Load from 0000000010081400
!	Mem[0000000010041408] = ff000000 000000ff, %l2 = 00000000, %l3 = d7000000
	ldda	[%i1+%o4]0x88,%l2	! %l2 = 00000000000000ff 00000000ff000000
!	Mem[0000000010041410] = 00000000, %l5 = 00000000e8256bdc
	ldswa	[%i1+%o5]0x80,%l5	! %l5 = 0000000000000000
!	Mem[00000000100c1428] = d96af809, %l3 = 00000000ff000000
	ldsw	[%i3+0x028],%l3		! %l3 = ffffffffd96af809
!	Mem[0000000030081408] = 000000ff, %l6 = 0000000000000000
	ldsba	[%i2+%o4]0x89,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000021800140] = 00002023, %l7 = 0000000000000000
	ldsha	[%o3+0x140]%asi,%l7	! %l7 = 0000000000000000
!	Mem[00000000300c1400] = f6ffff1d35ade5ff, %f10 = 49945b77 13978a51
	ldda	[%i3+%g0]0x81,%f10	! %f10 = f6ffff1d 35ade5ff
!	Starting 10 instruction Store Burst
!	%l0 = fffffffff2000000, Mem[0000000010181410] = 00e5ad35
	stha	%l0,[%i6+%o5]0x80	! Mem[0000000010181410] = 0000ad35

p0_label_130:
!	%l4 = 00000000000000f2, imm = 0000000000000be4, %l0 = fffffffff2000000
	addc	%l4,0xbe4,%l0		! %l0 = 0000000000000cd6
!	%l0 = 00000cd6, %l1 = f2e25d08, Mem[0000000010141410] = d7ffffff 000000ff
	stda	%l0,[%i5+%o5]0x80	! Mem[0000000010141410] = 00000cd6 f2e25d08
!	%l7 = 0000000000000000, Mem[0000000010001400] = ff00000000000000
	stxa	%l7,[%i0+%g0]0x88	! Mem[0000000010001400] = 0000000000000000
!	Mem[0000000010181410] = 0000ad35, %l0 = 0000000000000cd6
	swapa	[%i6+%o5]0x80,%l0	! %l0 = 000000000000ad35
!	%f14 = 7403c892 43ca1dd3, %l4 = 00000000000000f2
!	Mem[0000000010181438] = bfa3b5cd00c15a90
	add	%i6,0x038,%g1
	stda	%f14,[%g1+%l4]ASI_PST32_PL ! Mem[0000000010181438] = bfa3b5cd92c80374
!	Mem[0000000030141400] = 000000f2, %l4 = 00000000000000f2
	ldstuba	[%i5+%g0]0x89,%l4	! %l4 = 000000f2000000ff
!	%f4  = 00e5ad35 1dfffff6, %l7 = 0000000000000000
!	Mem[0000000030141410] = ff666295412ccb02
	add	%i5,0x010,%g1
	stda	%f4,[%g1+%l7]ASI_PST8_S ! Mem[0000000030141410] = ff666295412ccb02
!	Mem[0000000010001408] = ffffffff, %l3 = ffffffffd96af809
	swapa	[%i0+%o4]0x80,%l3	! %l3 = 00000000ffffffff
!	Mem[00000000201c0001] = 02ff851d, %l6 = ffffffffffffffff
	ldstub	[%o0+0x001],%l6		! %l6 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = ffe20000, %l4 = 00000000000000f2
	ldsba	[%i3+%o5]0x89,%l4	! %l4 = 0000000000000000

!	Check Point 26 for processor 0

	set	p0_check_pt_data_26,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 000000000000ad35
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 00000000f2e25d08
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
	cmp	%l4,%g2			! %l4 = 0000000000000000
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
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = 00000030 9085fb95
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x50],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 00e5ad35 1dfffff6
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x58],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = f6ffff1d 35ade5ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x60],%g3
	std	%f16,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f16 = a8921e6e 85ffdf00
	bne	%xcc,p0_freg_check_fail
	mov	0xf16,%g1
	ldx	[%g4+0x68],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = 020037e1 48000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1
	ldx	[%g4+0x70],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = d31dca43 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1
	ldx	[%g4+0x78],%g3
	std	%f22,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f22 = d96af809 005f0000
	bne	%xcc,p0_freg_check_fail
	mov	0xf22,%g1
	ldx	[%g4+0x80],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = 000000ff 005f0000
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1
	ldx	[%g4+0x88],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = 3d780000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1
	ldx	[%g4+0x90],%g3
	std	%f28,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f28 = c348e552 24174994
	bne	%xcc,p0_freg_check_fail
	mov	0xf28,%g1
	ldx	[%g4+0x98],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = 68e68f57 b1cdffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 26 completed


p0_label_131:
!	Mem[0000000010081400] = a8921e6e, %f19 = 48000000
	lda	[%i2+%g0]0x80,%f19	! %f19 = a8921e6e
!	Mem[0000000010181410] = 00000cd60000fb66, %f24 = 000000ff 005f0000
	ldd	[%i6+%o5],%f24		! %f24 = 00000cd6 0000fb66
!	Mem[0000000030081408] = ff000000, %l2 = 00000000000000ff
	lduba	[%i2+%o4]0x81,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030081408] = ff000000, %l0 = 000000000000ad35
	ldsba	[%i2+%o4]0x81,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010141408] = 000000d792c80374, %f24 = 00000cd6 0000fb66
	ldda	[%i5+%o4]0x80,%f24	! %f24 = 000000d7 92c80374
!	Mem[0000000010141410] = 00000cd6, %l3 = 00000000ffffffff
	lduha	[%i5+%o5]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000010141410] = d60c0000, %l6 = 00000000000000ff
	lduha	[%i5+%o5]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000010001410] = d102b5cd9028bfff, %l2 = 00000000000000ff
	ldxa	[%i0+%o5]0x88,%l2	! %l2 = d102b5cd9028bfff
!	Mem[0000000010101430] = b855c84f, %l2 = d102b5cd9028bfff
	ldsw	[%i4+0x030],%l2		! %l2 = ffffffffb855c84f
!	Starting 10 instruction Store Burst
!	%l1 = 00000000f2e25d08, Mem[0000000010041408] = 000000ff
	stha	%l1,[%i1+%o4]0x88	! Mem[0000000010041408] = 00005d08

p0_label_132:
!	Mem[00000000211c0001] = ffffa37b, %l5 = 0000000000000000
	ldstub	[%o2+0x001],%l5		! %l5 = 000000ff000000ff
!	%l0 = ffffffffffffffff, Mem[0000000030041400] = 000000ff
	stba	%l0,[%i1+%g0]0x89	! Mem[0000000030041400] = 000000ff
!	%l0 = ffffffffffffffff, Mem[0000000010141422] = 00000000
	sth	%l0,[%i5+0x022]		! Mem[0000000010141420] = 0000ffff
!	%l5 = 00000000000000ff, Mem[00000000300c1410] = 0000e2ff
	stha	%l5,[%i3+%o5]0x81	! Mem[00000000300c1410] = 00ffe2ff
!	%l0 = ffffffffffffffff, Mem[00000000100c1400] = 000000e5
	stwa	%l0,[%i3+%g0]0x88	! Mem[00000000100c1400] = ffffffff
!	%l4 = 00000000, %l5 = 000000ff, Mem[0000000010041438] = 00000000 00000000
	stda	%l4,[%i1+0x038]%asi	! Mem[0000000010041438] = 00000000 000000ff
!	%l7 = 0000000000000000, Mem[0000000030101410] = ff000000
	stba	%l7,[%i4+%o5]0x89	! Mem[0000000030101410] = ff000000
!	%l5 = 00000000000000ff, Mem[00000000201c0000] = 02ff851d
	stb	%l5,[%o0+%g0]		! Mem[00000000201c0000] = ffff851d
!	%l5 = 00000000000000ff, Mem[0000000030001400] = 74fbd6cfa8921e6e
	stxa	%l5,[%i0+%g0]0x89	! Mem[0000000030001400] = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = 020037e148000000, %l7 = 0000000000000000
	ldxa	[%i2+%o4]0x80,%l7	! %l7 = 020037e148000000

p0_label_133:
!	Mem[00000000100c1400] = ffffffff, %l1 = 00000000f2e25d08
	ldsha	[%i3+%g0]0x80,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000030141400] = 000000ff, %l3 = 0000000000000000
	lduha	[%i5+%g0]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010181428] = 00000000 0000cb02, %l4 = 00000000, %l5 = 000000ff
	ldda	[%i6+0x028]%asi,%l4	! %l4 = 0000000000000000 000000000000cb02
!	Mem[00000000100c1430] = c0621d068f354994, %f14 = 7403c892 43ca1dd3
	ldda	[%i3+0x030]%asi,%f14	! %f14 = c0621d06 8f354994
!	Mem[00000000211c0000] = ffffa37b, %l5 = 000000000000cb02
	lduba	[%o2+0x000]%asi,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010101408] = 00000000, %l4 = 0000000000000000
	lduha	[%i4+%o4]0x88,%l4	! %l4 = 0000000000000000
!	Mem[00000000211c0000] = ffffa37b, %l5 = 00000000000000ff
	ldsh	[%o2+%g0],%l5		! %l5 = ffffffffffffffff
!	Mem[0000000030001400] = ff000000, %l6 = 0000000000000000
	ldswa	[%i0+%g0]0x81,%l6	! %l6 = ffffffffff000000
!	Mem[00000000100c1408] = 00000000, %l5 = ffffffffffffffff
	ldub	[%i3+0x00b],%l5		! %l5 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010081427] = 005f0000, %l2 = ffffffffb855c84f
	ldstuba	[%i2+0x027]%asi,%l2	! %l2 = 00000000000000ff

p0_label_134:
!	%l4 = 0000000000000000, Mem[0000000010141410] = d60c0000
	stba	%l4,[%i5+%o5]0x88	! Mem[0000000010141410] = d60c0000
!	%f0  = ad350000 ffb502d1 00000030 9085fb95
!	%f4  = 00e5ad35 1dfffff6 3b1ed75a 1b41e871
!	%f8  = 2723af57 ffffcdb1 f6ffff1d 35ade5ff
!	%f12 = 00000000 0000e2f2 c0621d06 8f354994
	stda	%f0,[%i6]ASI_BLK_AIUPL	! Block Store to 0000000010181400
!	Mem[0000000010041410] = 00000000, %l1 = ffffffffffffffff
	ldstuba	[%i1+%o5]0x80,%l1	! %l1 = 00000000000000ff
!	%l1 = 0000000000000000, Mem[0000000010041408] = ff00000000005d08
	stxa	%l1,[%i1+%o4]0x88	! Mem[0000000010041408] = 0000000000000000
!	%f16 = a8921e6e 85ffdf00 020037e1 a8921e6e
!	%f20 = d31dca43 00000000 d96af809 005f0000
!	%f24 = 000000d7 92c80374 3d780000 00000000
!	%f28 = c348e552 24174994 68e68f57 b1cdffff
	stda	%f16,[%i3]ASI_COMMIT_P	! Block Store to 00000000100c1400
	membar	#Sync			! Added by membar checker (34)
!	Mem[00000000100c1408] = e1370002, %l0 = ffffffffffffffff
	swapa	[%i3+%o4]0x88,%l0	! %l0 = 00000000e1370002
!	%l7 = 020037e148000000, Mem[0000000010101408] = 00000000
	stwa	%l7,[%i4+%o4]0x88	! Mem[0000000010101408] = 48000000
!	Mem[0000000030141400] = ff000000, %l5 = 0000000000000000
	swapa	[%i5+%g0]0x81,%l5	! %l5 = 00000000ff000000
!	%l1 = 0000000000000000, Mem[0000000030001408] = 1b41e8ff
	stba	%l1,[%i0+%o4]0x89	! Mem[0000000030001408] = 1b41e800
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = a8921e6e 85ffdf00 020037e1 48000000
!	Mem[0000000010081410] = d31dca43 00000000 d96af809 005f0000
!	Mem[0000000010081420] = 000000ff 005f00ff 3d780000 00000000
!	Mem[0000000010081430] = c348e552 24174994 68e68f57 b1cdffff
	ldda	[%i2]ASI_BLK_P,%f16	! Block Load from 0000000010081400

p0_label_135:
!	Mem[0000000030141400] = 00000000 ffffffff, %l6 = ff000000, %l7 = 48000000
	ldda	[%i5+%g0]0x81,%l6	! %l6 = 0000000000000000 00000000ffffffff
!	Mem[00000000100c1400] = a8921e6e, %l0 = 00000000e1370002
	lduba	[%i3+0x003]%asi,%l0	! %l0 = 000000000000006e
!	Mem[000000001014142c] = ffd4ff57, %l4 = 0000000000000000
	ldsb	[%i5+0x02f],%l4		! %l4 = 0000000000000057
!	Mem[0000000010001400] = 00000000, %l1 = 0000000000000000
	lduba	[%i0+%g0]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010041410] = 000000ff, %l0 = 000000000000006e
	ldsha	[%i1+%o5]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010181400] = ad350000ffb502d1, %f2  = 00000030 9085fb95
	ldda	[%i6+%g0]0x88,%f2 	! %f2  = ad350000 ffb502d1
!	%l2 = 0000000000000000, %l2 = 0000000000000000, %l4  = 0000000000000057
	mulx	%l2,%l2,%l4		! %l4 = 0000000000000000
!	Mem[0000000010001410] = ffbf2890, %l1 = 0000000000000000
	lduba	[%i0+%o5]0x80,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010141400] = 00000000, %f0  = ad350000
	lda	[%i5+%g0]0x80,%f0 	! %f0 = 00000000
!	Starting 10 instruction Store Burst
!	%l1 = 00000000000000ff, Mem[0000000030041400] = ff000000
	stha	%l1,[%i1+%g0]0x81	! Mem[0000000030041400] = 00ff0000

!	Check Point 27 for processor 0

	set	p0_check_pt_data_27,%g4
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
	cmp	%l3,%g2			! %l3 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 0000000000000000
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
	cmp	%l7,%g2			! %l7 = 00000000ffffffff
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = 00000000 ffb502d1
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x50],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = ad350000 ffb502d1
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x58],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 00e5ad35 1dfffff6
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x60],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 3b1ed75a 1b41e871
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x68],%g3
	std	%f14,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f14 = c0621d06 8f354994
	bne	%xcc,p0_freg_check_fail
	mov	0xf14,%g1
	ldx	[%g4+0x70],%g3
	std	%f16,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f16 = a8921e6e 85ffdf00
	bne	%xcc,p0_freg_check_fail
	mov	0xf16,%g1
	ldx	[%g4+0x78],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = 020037e1 48000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1
	ldx	[%g4+0x80],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = d31dca43 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1
	ldx	[%g4+0x88],%g3
	std	%f22,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f22 = d96af809 005f0000
	bne	%xcc,p0_freg_check_fail
	mov	0xf22,%g1
	ldx	[%g4+0x90],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = 000000ff 005f00ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1
	ldx	[%g4+0x98],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = 3d780000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1
	ldx	[%g4+0xa0],%g3
	std	%f28,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f28 = c348e552 24174994
	bne	%xcc,p0_freg_check_fail
	mov	0xf28,%g1
	ldx	[%g4+0xa8],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = 68e68f57 b1cdffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 27 completed


p0_label_136:
!	Mem[00000000100c1430] = c348e55224174994, %l2 = 0000000000000000, %l3 = 00000000000000ff
	add	%i3,0x30,%g1
	casxa	[%g1]0x80,%l2,%l3	! %l3 = c348e55224174994
!	Mem[0000000010181408] = 9085fb95, %l5 = 00000000ff000000
	swapa	[%i6+%o4]0x88,%l5	! %l5 = 000000009085fb95
	membar	#Sync			! Added by membar checker (35)
!	%l4 = 0000000000000000, Mem[0000000010081410] = 43ca1dd3
	stba	%l4,[%i2+%o5]0x88	! Mem[0000000010081410] = 43ca1d00
!	Mem[0000000030181410] = fffffff6, %l6 = 0000000000000000
	swapa	[%i6+%o5]0x81,%l6	! %l6 = 00000000fffffff6
!	%l1 = 00000000000000ff, Mem[0000000010081410] = 43ca1d00
	stba	%l1,[%i2+%o5]0x88	! Mem[0000000010081410] = 43ca1dff
!	%l6 = 00000000fffffff6, Mem[000000001018141c] = 5ad71e3b
	stw	%l6,[%i6+0x01c]		! Mem[000000001018141c] = fffffff6
!	%l4 = 0000000000000000, Mem[00000000201c0001] = ffff851d
	stb	%l4,[%o0+0x001]		! Mem[00000000201c0000] = ff00851d
!	Mem[0000000010041430] = 4dd91d06, %l4 = 0000000000000000, %asi = 80
	swapa	[%i1+0x030]%asi,%l4	! %l4 = 000000004dd91d06
!	%f15 = 8f354994, Mem[0000000030081408] = ff000000
	sta	%f15,[%i2+%o4]0x81	! Mem[0000000030081408] = 8f354994
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = ff000000, %l2 = 0000000000000000
	ldsha	[%i1+%o5]0x80,%l2	! %l2 = ffffffffffffff00

p0_label_137:
!	Mem[0000000010101408] = 48000000, %l7 = 00000000ffffffff
	ldsba	[%i4+%o4]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000010181438] = 9449358f061d62c0, %l1 = 00000000000000ff
	ldx	[%i6+0x038],%l1		! %l1 = 9449358f061d62c0
!	Mem[00000000100c1430] = c348e552, %l0 = 00000000000000ff
	ldswa	[%i3+0x030]%asi,%l0	! %l0 = ffffffffc348e552
!	Mem[0000000010041414] = 783d37e1, %f19 = 48000000
	ld	[%i1+0x014],%f19	! %f19 = 783d37e1
!	Mem[0000000010141408] = 7403c892d7000000, %f12 = 00000000 0000e2f2
	ldda	[%i5+%o4]0x88,%f12	! %f12 = 7403c892 d7000000
!	Mem[0000000020800040] = ffffb8ec, %l0 = ffffffffc348e552
	ldsha	[%o1+0x040]%asi,%l0	! %l0 = ffffffffffffffff
	membar	#Sync			! Added by membar checker (36)
!	Mem[0000000030181400] = f2e20000 00000000 f6ffff1d ffe20000
!	Mem[0000000030181410] = 00000000 3b8aacb1 b1ac8a3b 1da45bae
!	Mem[0000000030181420] = d96af809 948a6312 9c8971bc d6fa8c51
!	Mem[0000000030181430] = 250c8aa7 956266fb ce75fb64 a19e6944
	ldda	[%i6]ASI_BLK_AIUS,%f0	! Block Load from 0000000030181400
!	Mem[0000000030081410] = f2000000, %l6 = 00000000fffffff6
	ldsba	[%i2+%o5]0x81,%l6	! %l6 = fffffffffffffff2
!	Mem[0000000030041400] = 00ff0000, %l2 = ffffffffffffff00
	lduha	[%i1+%g0]0x81,%l2	! %l2 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%f16 = a8921e6e 85ffdf00, Mem[0000000030001410] = 000000ff d102b5cd
	stda	%f16,[%i0+%o5]0x89	! Mem[0000000030001410] = a8921e6e 85ffdf00

p0_label_138:
!	%f18 = 020037e1 783d37e1, %l2 = 00000000000000ff
!	Mem[0000000030001430] = f6da05dad78f5fd2
	add	%i0,0x030,%g1
	stda	%f18,[%g1+%l2]ASI_PST16_S ! Mem[0000000030001430] = 020037e1783d37e1
	membar	#Sync			! Added by membar checker (37)
!	%l0 = ffffffffffffffff, Mem[0000000030181410] = 00000000
	stha	%l0,[%i6+%o5]0x89	! Mem[0000000030181410] = 0000ffff
!	Mem[0000000030181408] = 1dfffff6, %l2 = 00000000000000ff
	ldstuba	[%i6+%o4]0x89,%l2	! %l2 = 000000f6000000ff
!	Mem[0000000010181408] = 000000ff, %l5 = 000000009085fb95
	swapa	[%i6+%o4]0x80,%l5	! %l5 = 00000000000000ff
!	%f20 = d31dca43 00000000, Mem[0000000010141408] = d7000000 7403c892
	stda	%f20,[%i5+%o4]0x88	! Mem[0000000010141408] = d31dca43 00000000
!	%f28 = c348e552 24174994, %l4 = 000000004dd91d06
!	Mem[0000000030001428] = ae8551afa78c711b
	add	%i0,0x028,%g1
	stda	%f28,[%g1+%l4]ASI_PST32_S ! Mem[0000000030001428] = c348e552a78c711b
!	%f30 = 68e68f57 b1cdffff, %l2 = 00000000000000f6
!	Mem[0000000010181420] = b1cdffff57af2327
	add	%i6,0x020,%g1
	stda	%f30,[%g1+%l2]ASI_PST32_PL ! Mem[0000000010181420] = b1cdffff578fe668
!	%l2 = 000000f6, %l3 = 24174994, Mem[0000000010081400] = 6e1e92a8 00dfff85
	stda	%l2,[%i2+%g0]0x88	! Mem[0000000010081400] = 000000f6 24174994
!	Mem[0000000010101408] = 48000000, %l3 = c348e55224174994
	lduha	[%i4+%o4]0x88,%l3	! %l3 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = f6ffff1d 000000ff, %l2 = 000000f6, %l3 = 00000000
	ldda	[%i4+%g0]0x88,%l2	! %l2 = 00000000000000ff 00000000f6ffff1d

p0_label_139:
!	Mem[0000000020800040] = ffffb8ec, %l3 = 00000000f6ffff1d
	ldsb	[%o1+0x040],%l3		! %l3 = ffffffffffffffff
!	Mem[0000000030181410] = b1ac8a3b0000ffff, %l1 = 9449358f061d62c0
	ldxa	[%i6+%o5]0x89,%l1	! %l1 = b1ac8a3b0000ffff
!	Mem[0000000030181408] = 0000e2ff1dffffff, %f12 = 250c8aa7 956266fb
	ldda	[%i6+%o4]0x89,%f12	! %f12 = 0000e2ff 1dffffff
!	Mem[0000000010001400] = 0000000000000000, %l5 = 00000000000000ff
	ldxa	[%i0+%g0]0x88,%l5	! %l5 = 0000000000000000
!	Mem[00000000100c1408] = ffffffff, %l2 = 00000000000000ff
	ldsha	[%i3+%o4]0x80,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000010141400] = 00000000, %l0 = ffffffffffffffff
	ldswa	[%i5+%g0]0x80,%l0	! %l0 = 0000000000000000
!	Mem[000000001018140c] = 30000000, %l7 = 0000000000000000
	ldsh	[%i6+0x00c],%l7		! %l7 = 0000000000003000
!	Mem[00000000100c1410] = 43ca1dd3, %l0 = 0000000000000000
	lduwa	[%i3+%o5]0x88,%l0	! %l0 = 0000000043ca1dd3
!	Mem[0000000010041400] = ff000000, %l4 = 000000004dd91d06
	ldsba	[%i1+%g0]0x80,%l4	! %l4 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	Mem[0000000030001408] = 1b41e800, %l2 = ffffffffffffffff
	swapa	[%i0+%o4]0x89,%l2	! %l2 = 000000001b41e800

p0_label_140:
!	%f16 = a8921e6e 85ffdf00, %l2 = 000000001b41e800
!	Mem[0000000030081400] = f20000ffffffffff
	stda	%f16,[%i2+%l2]ASI_PST8_S ! Mem[0000000030081400] = f20000ffffffffff
!	%l4 = ffffffffffffffff, Mem[0000000010141400] = 00000000
	stha	%l4,[%i5+%g0]0x80	! Mem[0000000010141400] = ffff0000
!	%l0 = 0000000043ca1dd3, Mem[0000000021800000] = ffff57e0, %asi = 80
	stha	%l0,[%o3+0x000]%asi	! Mem[0000000021800000] = 1dd357e0
!	Mem[00000000211c0001] = ffffa37b, %l6 = fffffffffffffff2
	ldstuba	[%o2+0x001]%asi,%l6	! %l6 = 000000ff000000ff
!	Mem[0000000010041408] = 00000000, %l1 = b1ac8a3b0000ffff
	ldstuba	[%i1+%o4]0x88,%l1	! %l1 = 00000000000000ff
!	%l3 = ffffffffffffffff, Mem[0000000021800000] = 1dd357e0
	sth	%l3,[%o3+%g0]		! Mem[0000000021800000] = ffff57e0
!	%l0 = 0000000043ca1dd3, Mem[00000000201c0000] = ff00851d, %asi = 80
	stha	%l0,[%o0+0x000]%asi	! Mem[00000000201c0000] = 1dd3851d
!	%l7 = 0000000000003000, Mem[0000000020800001] = 00ff9984
	stb	%l7,[%o1+0x001]		! Mem[0000000020800000] = 00009984
!	Randomly selected nop
	nop
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = 00000000, %l4 = ffffffffffffffff
	ldswa	[%i5+%o4]0x89,%l4	! %l4 = 0000000000000000

!	Check Point 28 for processor 0

	set	p0_check_pt_data_28,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 0000000043ca1dd3
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 0000000000000000
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 000000001b41e800
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = ffffffffffffffff
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
	cmp	%l6,%g2			! %l6 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 0000000000003000
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = f2e20000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x50],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = f6ffff1d ffe20000
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x58],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 00000000 3b8aacb1
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x60],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = b1ac8a3b 1da45bae
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x68],%g3
	std	%f8,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f8 = d96af809 948a6312
	bne	%xcc,p0_freg_check_fail
	mov	0xf08,%g1
	ldx	[%g4+0x70],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = 9c8971bc d6fa8c51
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x78],%g3
	std	%f12,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f12 = 0000e2ff 1dffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf12,%g1
	ldx	[%g4+0x80],%g3
	std	%f14,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f14 = ce75fb64 a19e6944
	bne	%xcc,p0_freg_check_fail
	mov	0xf14,%g1
	ldx	[%g4+0x88],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = 020037e1 783d37e1
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1

!	Check Point 28 completed


p0_label_141:
!	Mem[000000001000142c] = ff000000, %l7 = 0000000000003000
	ldub	[%i0+0x02c],%l7		! %l7 = 00000000000000ff
!	Mem[00000000211c0000] = ffffa37b, %l4 = 0000000000000000
	lduha	[%o2+0x000]%asi,%l4	! %l4 = 000000000000ffff
!	Mem[0000000030001410] = 00dfff856e1e92a8, %l2 = 000000001b41e800
	ldxa	[%i0+%o5]0x81,%l2	! %l2 = 00dfff856e1e92a8
!	Mem[0000000030001410] = 00dfff85, %l5 = 0000000000000000
	ldsba	[%i0+%o5]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000010001408] = 09f86ad9, %l1 = 0000000000000000
	lduba	[%i0+%o4]0x88,%l1	! %l1 = 00000000000000d9
!	Mem[00000000201c0000] = 1dd3851d, %l6 = 00000000000000ff
	ldsha	[%o0+0x000]%asi,%l6	! %l6 = 0000000000001dd3
!	Mem[0000000010041408] = 00000000000000ff, %l6 = 0000000000001dd3
	ldxa	[%i1+%o4]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030181400] = 0000e2f2, %l5 = 0000000000000000
	lduha	[%i6+%g0]0x89,%l5	! %l5 = 000000000000e2f2
!	Mem[0000000010001408] = 09f86ad9, %l3 = ffffffffffffffff
	lduha	[%i0+%o4]0x88,%l3	! %l3 = 0000000000006ad9
!	Starting 10 instruction Store Burst
!	%f6  = b1ac8a3b, Mem[0000000010041408] = ff000000
	sta	%f6 ,[%i1+%o4]0x80	! Mem[0000000010041408] = b1ac8a3b

p0_label_142:
!	Mem[0000000010141408] = 00000000, %l4 = 000000000000ffff
	ldstuba	[%i5+%o4]0x88,%l4	! %l4 = 00000000000000ff
!	%l4 = 0000000000000000, Mem[0000000030001400] = ff000000
	stwa	%l4,[%i0+%g0]0x81	! Mem[0000000030001400] = 00000000
!	%l0 = 0000000043ca1dd3, Mem[0000000010041410] = 000000ff
	stha	%l0,[%i1+%o5]0x88	! Mem[0000000010041410] = 00001dd3
!	%l7 = 00000000000000ff, Mem[0000000010041408] = 3b8aacb1
	stba	%l7,[%i1+%o4]0x88	! Mem[0000000010041408] = 3b8aacff
!	%l2 = 00dfff856e1e92a8, Mem[0000000010141408] = 000000ff
	stha	%l2,[%i5+%o4]0x88	! Mem[0000000010141408] = 000092a8
!	%l2 = 00dfff856e1e92a8, Mem[0000000030041408] = fff6bfa3
	stba	%l2,[%i1+%o4]0x81	! Mem[0000000030041408] = a8f6bfa3
!	%l2 = 00dfff856e1e92a8, Mem[0000000030001410] = 00dfff85
	stha	%l2,[%i0+%o5]0x81	! Mem[0000000030001410] = 92a8ff85
!	Mem[00000000100c1400] = a8921e6e, %l2 = 00dfff856e1e92a8
	swap	[%i3+%g0],%l2		! %l2 = 00000000a8921e6e
!	%f20 = d31dca43 00000000, Mem[0000000010081408] = e1370002 00000048
	stda	%f20,[%i2+%o4]0x88	! Mem[0000000010081408] = d31dca43 00000000
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = 6e1e92a8, %l1 = 00000000000000d9
	lduha	[%i3+%g0]0x80,%l1	! %l1 = 0000000000006e1e

p0_label_143:
!	Mem[0000000010041400] = ff000000, %l6 = 00000000000000ff
	ldswa	[%i1+0x000]%asi,%l6	! %l6 = ffffffffff000000
!	Mem[0000000010181414] = 35ade500, %l1 = 0000000000006e1e
	ldswa	[%i6+0x014]%asi,%l1	! %l1 = 0000000035ade500
!	Mem[00000000100c1400] = a8921e6e, %l3 = 0000000000006ad9
	lduha	[%i3+%g0]0x88,%l3	! %l3 = 0000000000001e6e
!	Mem[0000000030181400] = f2e20000, %l6 = ffffffffff000000
	lduwa	[%i6+%g0]0x81,%l6	! %l6 = 00000000f2e20000
!	Mem[0000000030081410] = 000000f2, %l5 = 000000000000e2f2
	ldsba	[%i2+%o5]0x89,%l5	! %l5 = fffffffffffffff2
!	Mem[0000000010001408] = d96af809, %l7 = 00000000000000ff
	ldsba	[%i0+%o4]0x80,%l7	! %l7 = ffffffffffffffd9
!	Mem[0000000010181400] = ffb502d1, %l3 = 0000000000001e6e
	ldswa	[%i6+%g0]0x88,%l3	! %l3 = ffffffffffb502d1
!	Mem[0000000010081400] = f600000094491724, %f22 = d96af809 005f0000
	ldda	[%i2+%g0]0x80,%f22	! %f22 = f6000000 94491724
!	Mem[0000000030001400] = 00000000, %l6 = 00000000f2e20000
	ldsha	[%i0+%g0]0x81,%l6	! %l6 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030041408] = a3bff6a8, %l4 = 0000000000000000
	ldstuba	[%i1+%o4]0x89,%l4	! %l4 = 000000a8000000ff

p0_label_144:
!	Mem[0000000030181410] = 0000ffff, %l4 = 00000000000000a8
	swapa	[%i6+%o5]0x89,%l4	! %l4 = 000000000000ffff
!	%l2 = a8921e6e, %l3 = ffb502d1, Mem[0000000010141400] = ffff0000 00000000
	stda	%l2,[%i5+0x000]%asi	! Mem[0000000010141400] = a8921e6e ffb502d1
!	%f8  = d96af809 948a6312, Mem[0000000030101400] = 00000000 00000000
	stda	%f8 ,[%i4+%g0]0x81	! Mem[0000000030101400] = d96af809 948a6312
!	%f12 = 0000e2ff 1dffffff, %l4 = 000000000000ffff
!	Mem[0000000010141400] = a8921e6effb502d1
	stda	%f12,[%i5+%l4]ASI_PST32_P ! Mem[0000000010141400] = 0000e2ff1dffffff
!	%l6 = 0000000000000000, Mem[0000000010081400] = f6000000
	stba	%l6,[%i2+%g0]0x80	! Mem[0000000010081400] = 00000000
!	%f18 = 020037e1 783d37e1, Mem[00000000300c1408] = f20000ff a3bfebfc
	stda	%f18,[%i3+%o4]0x81	! Mem[00000000300c1408] = 020037e1 783d37e1
!	%f0  = f2e20000 00000000, %l7 = ffffffffffffffd9
!	Mem[0000000010101418] = cdb502ff295bdcc7
	add	%i4,0x018,%g1
	stda	%f0,[%g1+%l7]ASI_PST32_P ! Mem[0000000010101418] = cdb502ff00000000
!	%l4 = 000000000000ffff, Mem[0000000010101400] = ff0000001dfffff6
	stxa	%l4,[%i4+%g0]0x80	! Mem[0000000010101400] = 000000000000ffff
!	%l3 = ffffffffffb502d1, Mem[0000000010001410] = 9028bfff
	stha	%l3,[%i0+%o5]0x88	! Mem[0000000010001410] = 902802d1
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = 00000000 0000ffff, %l6 = 00000000, %l7 = ffffffd9
	ldda	[%i4+%g0]0x80,%l6	! %l6 = 0000000000000000 000000000000ffff

p0_label_145:
!	Mem[0000000030081410] = 000000f2, %l5 = fffffffffffffff2
	lduba	[%i2+%o5]0x89,%l5	! %l5 = 00000000000000f2
!	Mem[0000000010041400] = 000000ff, %f1  = 00000000
	lda	[%i1+%g0]0x88,%f1 	! %f1 = 000000ff
!	Mem[0000000030081400] = ff0000f2, %f14 = ce75fb64
	lda	[%i2+%g0]0x89,%f14	! %f14 = ff0000f2
!	Mem[0000000030001400] = 00000000, %l1 = 0000000035ade500
	ldswa	[%i0+%g0]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000010041410] = d31d0000, %l1 = 0000000000000000
	ldsha	[%i1+%o5]0x80,%l1	! %l1 = ffffffffffffd31d
!	Mem[0000000010001410] = d102b5cd902802d1, %f30 = 68e68f57 b1cdffff
	ldda	[%i0+%o5]0x88,%f30	! %f30 = d102b5cd 902802d1
!	Mem[00000000100c1410] = d31dca43, %l0 = 0000000043ca1dd3
	ldsba	[%i3+%o5]0x80,%l0	! %l0 = ffffffffffffffd3
!	Mem[0000000030181408] = 1dffffff, %l1 = ffffffffffffd31d
	ldsba	[%i6+%o4]0x89,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010181410] = 1dfffff6, %l3 = ffffffffffb502d1
	lduwa	[%i6+%o5]0x88,%l3	! %l3 = 000000001dfffff6
!	Starting 10 instruction Store Burst
!	%f11 = d6fa8c51, Mem[0000000030041408] = fff6bfa3
	sta	%f11,[%i1+%o4]0x81	! Mem[0000000030041408] = d6fa8c51

!	Check Point 29 for processor 0

	set	p0_check_pt_data_29,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = ffffffffffffffd3
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = ffffffffffffffff
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 00000000a8921e6e
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 000000001dfffff6
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 000000000000ffff
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 00000000000000f2
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 0000000000000000
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 000000000000ffff
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = f2e20000 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x50],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = b1ac8a3b 1da45bae
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x58],%g3
	std	%f14,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f14 = ff0000f2 a19e6944
	bne	%xcc,p0_freg_check_fail
	mov	0xf14,%g1
	ldx	[%g4+0x60],%g3
	std	%f22,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f22 = f6000000 94491724
	bne	%xcc,p0_freg_check_fail
	mov	0xf22,%g1
	ldx	[%g4+0x68],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = d102b5cd 902802d1
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 29 completed


p0_label_146:
!	Mem[0000000010001400] = 00000000, %l7 = 000000000000ffff
	swapa	[%i0+%g0]0x80,%l7	! %l7 = 0000000000000000
!	Mem[000000001010140c] = 783d37e1, %l4 = 000000000000ffff
	swap	[%i4+0x00c],%l4		! %l4 = 00000000783d37e1
!	%l3 = 000000001dfffff6, Mem[0000000030181400] = 000000000000e2f2
	stxa	%l3,[%i6+%g0]0x89	! Mem[0000000030181400] = 000000001dfffff6
!	%f22 = f6000000, Mem[0000000030141400] = 00000000
	sta	%f22,[%i5+%g0]0x81	! Mem[0000000030141400] = f6000000
!	Mem[0000000030001408] = ffffffff, %l2 = 00000000a8921e6e
	ldstuba	[%i0+%o4]0x89,%l2	! %l2 = 000000ff000000ff
!	%l0 = ffffffffffffffd3, Mem[0000000010081422] = 000000ff
	sth	%l0,[%i2+0x022]		! Mem[0000000010081420] = 0000ffd3
!	%l7 = 0000000000000000, Mem[0000000030101410] = ff000000
	stha	%l7,[%i4+%o5]0x89	! Mem[0000000030101410] = ff000000
!	Mem[0000000010141428] = 00ff00ff, %l2 = 000000ff, %l6 = 00000000
	add	%i5,0x28,%g1
	casa	[%g1]0x80,%l2,%l6	! %l6 = 0000000000ff00ff
!	%f0  = f2e20000, Mem[0000000010141410] = 00000cd6
	sta	%f0 ,[%i5+%o5]0x80	! Mem[0000000010141410] = f2e20000
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = a8921e6e, %f24 = 000000ff
	lda	[%i3+%g0]0x88,%f24	! %f24 = a8921e6e

p0_label_147:
!	Mem[0000000010101400] = 00000000, %f18 = 020037e1
	lda	[%i4+%g0]0x80,%f18	! %f18 = 00000000
!	Mem[0000000030181410] = 000000a8, %l4 = 00000000783d37e1
	lduba	[%i6+%o5]0x89,%l4	! %l4 = 00000000000000a8
!	Mem[0000000010041410] = 00001dd3, %f16 = a8921e6e
	lda	[%i1+%o5]0x88,%f16	! %f16 = 00001dd3
!	Mem[00000000300c1400] = f6ffff1d35ade5ff, %l7 = 0000000000000000
	ldxa	[%i3+%g0]0x81,%l7	! %l7 = f6ffff1d35ade5ff
!	Mem[0000000030181408] = ffffff1d ffe20000, %l6 = 00ff00ff, %l7 = 35ade5ff
	ldda	[%i6+%o4]0x81,%l6	! %l6 = 00000000ffffff1d 00000000ffe20000
!	Mem[0000000030001410] = 92a8ff85, %l0 = ffffffffffffffd3
	ldsba	[%i0+%o5]0x81,%l0	! %l0 = ffffffffffffff92
!	Mem[0000000030081400] = ff0000f2, %l6 = 00000000ffffff1d
	lduwa	[%i2+%g0]0x89,%l6	! %l6 = 00000000ff0000f2
!	Mem[0000000010001438] = 085de2ff, %l1 = ffffffffffffffff
	ldsha	[%i0+0x038]%asi,%l1	! %l1 = 000000000000085d
!	Mem[0000000010081408] = 00000000, %l7 = 00000000ffe20000
	ldsba	[%i2+%o4]0x80,%l7	! %l7 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010081410] = 43ca1dff, %l0 = ffffffffffffff92
	ldstuba	[%i2+%o5]0x88,%l0	! %l0 = 000000ff000000ff

p0_label_148:
!	%l0 = 00000000000000ff, Mem[00000000100c1410] = d31dca43
	stwa	%l0,[%i3+%o5]0x80	! Mem[00000000100c1410] = 000000ff
!	Mem[000000001008143f] = b1cdffff, %l3 = 000000001dfffff6
	ldstuba	[%i2+0x03f]%asi,%l3	! %l3 = 000000ff000000ff
!	Mem[0000000030181408] = ffffff1d, %l2 = 00000000000000ff
	ldstuba	[%i6+%o4]0x81,%l2	! %l2 = 000000ff000000ff
!	Mem[00000000100c1408] = ffffffff, %l6 = 00000000ff0000f2
	ldstuba	[%i3+0x008]%asi,%l6	! %l6 = 000000ff000000ff
!	%f0  = f2e20000 000000ff f6ffff1d ffe20000
!	%f4  = 00000000 3b8aacb1 b1ac8a3b 1da45bae
!	%f8  = d96af809 948a6312 9c8971bc d6fa8c51
!	%f12 = 0000e2ff 1dffffff ff0000f2 a19e6944
	stda	%f0,[%i1]ASI_BLK_P	! Block Store to 0000000010041400
!	Mem[0000000010181410] = 1dfffff6, %l6 = 00000000000000ff
	ldstuba	[%i6+%o5]0x88,%l6	! %l6 = 000000f6000000ff
!	%f30 = d102b5cd 902802d1, %l6 = 00000000000000f6
!	Mem[0000000010101418] = cdb502ff00000000
	add	%i4,0x018,%g1
	stda	%f30,[%g1+%l6]ASI_PST16_PL ! Mem[0000000010101418] = cdb52890cdb50000
!	%l7 = 0000000000000000, Mem[0000000010041400] = 0000e2f2
	stha	%l7,[%i1+%g0]0x88	! Mem[0000000010041400] = 00000000
!	%l3 = 00000000000000ff, Mem[0000000030001400] = 0000000000000000
	stxa	%l3,[%i0+%g0]0x81	! Mem[0000000030001400] = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = a3000000, %f20 = d31dca43
	lda	[%i4+%o4]0x89,%f20	! %f20 = a3000000

p0_label_149:
!	Mem[0000000010081430] = c348e552, %l3 = 00000000000000ff
	ldsha	[%i2+0x032]%asi,%l3	! %l3 = ffffffffffffe552
!	%l4 = 00000000000000a8, Mem[0000000010181408] = 95fb8590
	stha	%l4,[%i6+%o4]0x88	! Mem[0000000010181408] = 95fb00a8
!	Mem[0000000010081400] = 00000000, %l4 = 00000000000000a8
	lduwa	[%i2+%g0]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000030141400] = f6000000 ffffffff, %l4 = 00000000, %l5 = 000000f2
	ldda	[%i5+%g0]0x81,%l4	! %l4 = 00000000f6000000 00000000ffffffff
!	Mem[0000000010081400] = 2417499400000000, %l7 = 0000000000000000
	ldxa	[%i2+%g0]0x88,%l7	! %l7 = 2417499400000000
!	Mem[0000000010141408] = a8920000 43ca1dd3, %l2 = 000000ff, %l3 = ffffe552
	ldda	[%i5+0x008]%asi,%l2	! %l2 = 00000000a8920000 0000000043ca1dd3
!	Mem[00000000100c1424] = 92c80374, %l1 = 000000000000085d
	ldsb	[%i3+0x025],%l1		! %l1 = ffffffffffffffc8
!	Mem[0000000010081408] = 00000000, %l7 = 2417499400000000
	lduba	[%i2+%o4]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000030081408] = 8f354994, %l0 = 00000000000000ff
	lduba	[%i2+%o4]0x81,%l0	! %l0 = 000000000000008f
!	Starting 10 instruction Store Burst
!	%l5 = 00000000ffffffff, Mem[0000000010041410] = 00000000
	stha	%l5,[%i1+%o5]0x88	! Mem[0000000010041410] = 0000ffff

p0_label_150:
!	%l0 = 000000000000008f, Mem[0000000010181410] = ffffff1d
	stwa	%l0,[%i6+%o5]0x80	! Mem[0000000010181410] = 0000008f
!	%f0  = f2e20000 000000ff f6ffff1d ffe20000
!	%f4  = 00000000 3b8aacb1 b1ac8a3b 1da45bae
!	%f8  = d96af809 948a6312 9c8971bc d6fa8c51
!	%f12 = 0000e2ff 1dffffff ff0000f2 a19e6944
	stda	%f0,[%i0]ASI_BLK_PL	! Block Store to 0000000010001400
!	%l3 = 0000000043ca1dd3, Mem[00000000211c0000] = ffffa37b, %asi = 80
	stha	%l3,[%o2+0x000]%asi	! Mem[00000000211c0000] = 1dd3a37b
	membar	#Sync			! Added by membar checker (38)
!	Mem[0000000010041400] = 00000000000000ff, %l7 = 0000000000000000, %l7 = 0000000000000000
	casxa	[%i1]0x80,%l7,%l7	! %l7 = 00000000000000ff
!	%f19 = 783d37e1, Mem[00000000100c1408] = ffffffff
	sta	%f19,[%i3+%o4]0x88	! Mem[00000000100c1408] = 783d37e1
!	%f12 = 0000e2ff 1dffffff, Mem[0000000010101410] = 518a9713 775b9449
	stda	%f12,[%i4+%o5]0x80	! Mem[0000000010101410] = 0000e2ff 1dffffff
!	%l0 = 0000008f, %l1 = ffffffc8, Mem[0000000010081410] = 43ca1dff 00000000
	stda	%l0,[%i2+%o5]0x88	! Mem[0000000010081410] = 0000008f ffffffc8
!	Mem[0000000010181410] = 0000008f, %l3 = 0000000043ca1dd3
	ldstuba	[%i6+%o5]0x80,%l3	! %l3 = 00000000000000ff
!	%l1 = ffffffffffffffc8, Mem[0000000030041408] = d6fa8c5100000000
	stxa	%l1,[%i1+%o4]0x81	! Mem[0000000030041408] = ffffffffffffffc8
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = 1dfffff6, %l5 = 00000000ffffffff
	lduba	[%i3+%g0]0x89,%l5	! %l5 = 00000000000000f6

!	Check Point 30 for processor 0

	set	p0_check_pt_data_30,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 000000000000008f
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = ffffffffffffffc8
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 00000000a8920000
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 0000000000000000
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 00000000f6000000
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 00000000000000f6
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 00000000000000f6
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = f6ffff1d ffe20000
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x50],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 00000000 3b8aacb1
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x58],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = b1ac8a3b 1da45bae
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x60],%g3
	std	%f16,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f16 = 00001dd3 85ffdf00
	bne	%xcc,p0_freg_check_fail
	mov	0xf16,%g1
	ldx	[%g4+0x68],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = 00000000 783d37e1
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1
	ldx	[%g4+0x70],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = a3000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1
	ldx	[%g4+0x78],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = a8921e6e 005f00ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1

!	Check Point 30 completed


p0_label_151:
!	Mem[0000000010001400] = ff000000, %l5 = 00000000000000f6
	ldsha	[%i0+%g0]0x80,%l5	! %l5 = ffffffffffffff00
!	Mem[0000000021800040] = ffff4289, %l1 = ffffffffffffffc8
	ldsb	[%o3+0x041],%l1		! %l1 = ffffffffffffffff
!	Mem[0000000010141400] = 0000e2ff, %l2 = 00000000a8920000
	ldswa	[%i5+%g0]0x80,%l2	! %l2 = 000000000000e2ff
!	Mem[0000000010181410] = ff00008f35ade500, %f8  = d96af809 948a6312
	ldda	[%i6+%o5]0x80,%f8 	! %f8  = ff00008f 35ade500
!	Mem[0000000010001400] = 000000ff, %l6 = 00000000000000f6
	lduha	[%i0+%g0]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[0000000020800000] = 00009984, %l6 = 00000000000000ff
	lduba	[%o1+0x000]%asi,%l6	! %l6 = 0000000000000000
!	Mem[0000000010001400] = ff0000000000e2f2, %l2 = 000000000000e2ff
	ldxa	[%i0+%g0]0x80,%l2	! %l2 = ff0000000000e2f2
!	Mem[00000000100c1400] = 6e1e92a8, %l1 = ffffffffffffffff
	ldswa	[%i3+%g0]0x80,%l1	! %l1 = 000000006e1e92a8
!	Mem[0000000010001410] = b1ac8a3b, %f25 = 005f00ff
	lda	[%i0+%o5]0x80,%f25	! %f25 = b1ac8a3b
!	Starting 10 instruction Store Burst
!	Mem[0000000010001408] = ffe20000, %l4 = 00000000f6000000
	swapa	[%i0+%o4]0x88,%l4	! %l4 = 00000000ffe20000

p0_label_152:
!	Mem[0000000010181410] = ff00008f, %l2 = ff0000000000e2f2
	swapa	[%i6+%o5]0x80,%l2	! %l2 = 00000000ff00008f
!	%f18 = 00000000 783d37e1, Mem[0000000030181400] = 1dfffff6 00000000
	stda	%f18,[%i6+%g0]0x89	! Mem[0000000030181400] = 00000000 783d37e1
!	Mem[00000000100c141e] = 005f0000, %l1 = 000000006e1e92a8
	ldstub	[%i3+0x01e],%l1		! %l1 = 00000000000000ff
!	%f26 = 3d780000 00000000, Mem[0000000030041400] = 00ff0000 00000000
	stda	%f26,[%i1+%g0]0x81	! Mem[0000000030041400] = 3d780000 00000000
!	Mem[00000000211c0001] = 1dd3a37b, %l2 = 00000000ff00008f
	ldstub	[%o2+0x001],%l2		! %l2 = 000000d3000000ff
!	Mem[0000000010001408] = 000000f6, %l6 = 0000000000000000
	ldstuba	[%i0+%o4]0x80,%l6	! %l6 = 00000000000000ff
!	Mem[00000000100c1410] = ff000000, %l5 = ffffffffffffff00
	swapa	[%i3+%o5]0x88,%l5	! %l5 = 00000000ff000000
!	%f16 = 00001dd3 85ffdf00 00000000 783d37e1
!	%f20 = a3000000 00000000 f6000000 94491724
!	%f24 = a8921e6e b1ac8a3b 3d780000 00000000
!	%f28 = c348e552 24174994 d102b5cd 902802d1
	stda	%f16,[%i2]ASI_BLK_AIUSL	! Block Store to 0000000030081400
!	%l1 = 0000000000000000, Mem[0000000010181408] = 95fb00a8
	stba	%l1,[%i6+%o4]0x88	! Mem[0000000010181408] = 95fb0000
!	Starting 10 instruction Load Burst
!	Mem[000000001018142c] = 1dfffff6, %f3  = ffe20000
	lda	[%i6+0x02c]%asi,%f3 	! %f3 = 1dfffff6

p0_label_153:
!	Mem[0000000030141410] = 02cb2c41956266ff, %f14 = ff0000f2 a19e6944
	ldda	[%i5+%o5]0x89,%f14	! %f14 = 02cb2c41 956266ff
!	Mem[0000000010101400] = 00000000, %l4 = 00000000ffe20000
	ldsha	[%i4+%g0]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000010141438] = ae5ba41d00000000, %l4 = 0000000000000000
	ldxa	[%i5+0x038]%asi,%l4	! %l4 = ae5ba41d00000000
!	Mem[00000000300c1400] = f6ffff1d 35ade5ff 020037e1 783d37e1
!	Mem[00000000300c1410] = 00ffe2ff 0099c1ff c7dc5b29 d102b5cd
!	Mem[00000000300c1420] = 49945b77 13978a51 a8921e6e b53b879c
!	Mem[00000000300c1430] = 0e510fed 4fc855b8 965c37e1 f6060000
	ldda	[%i3]ASI_BLK_AIUS,%f0	! Block Load from 00000000300c1400
!	Mem[0000000010041400] = 00000000, %l1 = 0000000000000000
	ldsba	[%i1+%g0]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000010141400] = ffe20000, %l0 = 000000000000008f
	lduwa	[%i5+%g0]0x88,%l0	! %l0 = 00000000ffe20000
!	Mem[00000000300c1410] = ffe2ff00, %f23 = 94491724
	lda	[%i3+%o5]0x89,%f23	! %f23 = ffe2ff00
!	Mem[0000000030181408] = 1dffffff, %l7 = 00000000000000ff
	lduwa	[%i6+%o4]0x89,%l7	! %l7 = 000000001dffffff
!	Mem[0000000010041410] = 0000ffff, %l0 = 00000000ffe20000
	lduwa	[%i1+%o5]0x88,%l0	! %l0 = 000000000000ffff
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (39)
!	Mem[0000000010081400] = 00000000, %l5 = 00000000ff000000
	swapa	[%i2+%g0]0x88,%l5	! %l5 = 0000000000000000

p0_label_154:
!	%l2 = 00000000000000d3, Mem[00000000218001c0] = ffcf6d36, %asi = 80
	stha	%l2,[%o3+0x1c0]%asi	! Mem[00000000218001c0] = 00d36d36
!	%l4 = ae5ba41d00000000, Mem[00000000300c1410] = ffc19900ffe2ff00
	stxa	%l4,[%i3+%o5]0x89	! Mem[00000000300c1410] = ae5ba41d00000000
!	Mem[0000000030001408] = ffffffff, %l5 = 0000000000000000
	swapa	[%i0+%o4]0x89,%l5	! %l5 = 00000000ffffffff
!	%l0 = 0000ffff, %l1 = 00000000, Mem[0000000010141408] = a8920000 43ca1dd3
	stda	%l0,[%i5+%o4]0x80	! Mem[0000000010141408] = 0000ffff 00000000
!	%l6 = 00000000, %l7 = 1dffffff, Mem[0000000010181400] = d102b5ff 000035ad
	stda	%l6,[%i6+%g0]0x80	! Mem[0000000010181400] = 00000000 1dffffff
!	Mem[0000000030081408] = 783d37e1, %l3 = 0000000000000000
	swapa	[%i2+%o4]0x89,%l3	! %l3 = 00000000783d37e1
!	Mem[0000000021800001] = ffff57e0, %l1 = 0000000000000000
	ldstub	[%o3+0x001],%l1		! %l1 = 000000ff000000ff
!	Mem[0000000010081400] = ff000000, %l0 = 000000000000ffff
	ldstuba	[%i2+%g0]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[0000000020800000] = 00009984, %l4 = ae5ba41d00000000
	ldstuba	[%o1+0x000]%asi,%l4	! %l4 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = 0099c1ff, %l6 = 0000000000000000
	ldsba	[%i1+%o5]0x89,%l6	! %l6 = ffffffffffffffff

p0_label_155:
!	Mem[00000000100c1408] = 783d37e1, %l4 = 0000000000000000
	ldswa	[%i3+%o4]0x88,%l4	! %l4 = 00000000783d37e1
!	Mem[000000001018143c] = 061d62c0, %l1 = 00000000000000ff
	ldub	[%i6+0x03e],%l1		! %l1 = 0000000000000062
!	Mem[0000000030041410] = ffc19900, %l3 = 00000000783d37e1
	lduwa	[%i1+%o5]0x81,%l3	! %l3 = 00000000ffc19900
!	Mem[0000000030141408] = 00000000, %l3 = 00000000ffc19900
	lduha	[%i5+%o4]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000030081400] = 00dfff85, %l1 = 0000000000000062
	lduba	[%i2+%g0]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000030141410] = 956266ff, %l3 = 0000000000000000
	lduba	[%i5+%o5]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030041400] = 0000783d, %l2 = 00000000000000d3
	ldsha	[%i1+%g0]0x89,%l2	! %l2 = 000000000000783d
!	Mem[00000000300c1408] = e1370002, %f21 = 00000000
	lda	[%i3+%o4]0x89,%f21	! %f21 = e1370002
!	Mem[0000000030181408] = ffffff1d, %f7  = d102b5cd
	lda	[%i6+%o4]0x81,%f7 	! %f7 = ffffff1d
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1410] = 00000000, %l6 = ffffffffffffffff
	swapa	[%i3+%o5]0x81,%l6	! %l6 = 0000000000000000

!	Check Point 31 for processor 0

	set	p0_check_pt_data_31,%g4
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
	cmp	%l2,%g2			! %l2 = 000000000000783d
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 00000000783d37e1
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 00000000ffffffff
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 0000000000000000
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 000000001dffffff
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = f6ffff1d 35ade5ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x50],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = 020037e1 783d37e1
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x58],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 00ffe2ff 0099c1ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x60],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = c7dc5b29 ffffff1d
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x68],%g3
	std	%f8,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f8 = 49945b77 13978a51
	bne	%xcc,p0_freg_check_fail
	mov	0xf08,%g1
	ldx	[%g4+0x70],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = a8921e6e b53b879c
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x78],%g3
	std	%f12,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f12 = 0e510fed 4fc855b8
	bne	%xcc,p0_freg_check_fail
	mov	0xf12,%g1
	ldx	[%g4+0x80],%g3
	std	%f14,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f14 = 965c37e1 f6060000
	bne	%xcc,p0_freg_check_fail
	mov	0xf14,%g1
	ldx	[%g4+0x88],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = a3000000 e1370002
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1
	ldx	[%g4+0x90],%g3
	std	%f22,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f22 = f6000000 ffe2ff00
	bne	%xcc,p0_freg_check_fail
	mov	0xf22,%g1
	ldx	[%g4+0x98],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = a8921e6e b1ac8a3b
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1

!	Check Point 31 completed


p0_label_156:
!	%l4 = 00000000783d37e1, Mem[0000000030141408] = 085de2f200000000
	stxa	%l4,[%i5+%o4]0x89	! Mem[0000000030141408] = 00000000783d37e1
!	%l4 = 783d37e1, %l5 = ffffffff, Mem[0000000010001418] = ae5ba41d 3b8aacb1
	std	%l4,[%i0+0x018]		! Mem[0000000010001418] = 783d37e1 ffffffff
!	Mem[0000000030181410] = a8000000, %l3 = 00000000000000ff
	swapa	[%i6+%o5]0x81,%l3	! %l3 = 00000000a8000000
!	Mem[00000000100c1410] = ffffff00, %l3 = 00000000a8000000
	ldstuba	[%i3+%o5]0x88,%l3	! %l3 = 00000000000000ff
!	%l6 = 00000000, %l7 = 1dffffff, Mem[0000000010001400] = ff000000 0000e2f2
	stda	%l6,[%i0+%g0]0x80	! Mem[0000000010001400] = 00000000 1dffffff
!	%f18 = 00000000 783d37e1, Mem[0000000010181408] = 95fb0000 00000030
	stda	%f18,[%i6+%o4]0x88	! Mem[0000000010181408] = 00000000 783d37e1
!	%l7 = 000000001dffffff, Mem[000000001010141a] = cdb52890, %asi = 80
	stba	%l7,[%i4+0x01a]%asi	! Mem[0000000010101418] = cdb5ff90
!	%l2 = 000000000000783d, Mem[00000000100c1408] = 783d37e1
	stba	%l2,[%i3+%o4]0x88	! Mem[00000000100c1408] = 783d373d
!	%l2 = 000000000000783d, Mem[0000000010081408] = 00000000
	stba	%l2,[%i2+%o4]0x80	! Mem[0000000010081408] = 3d000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = 783d37e1, %l3 = 0000000000000000
	lduba	[%i5+%o4]0x89,%l3	! %l3 = 00000000000000e1

p0_label_157:
!	Mem[00000000300c1410] = ffffffff, %l4 = 00000000783d37e1
	ldswa	[%i3+%o5]0x89,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010081410] = 8f000000 c8ffffff, %l6 = 00000000, %l7 = 1dffffff
	ldda	[%i2+%o5]0x80,%l6	! %l6 = 000000008f000000 00000000c8ffffff
!	Mem[0000000030141400] = 000000f6, %f19 = 783d37e1
	lda	[%i5+%g0]0x89,%f19	! %f19 = 000000f6
!	Mem[00000000100c143c] = b1cdffff, %l0 = 0000000000000000
	ldsh	[%i3+0x03c],%l0		! %l0 = ffffffffffffb1cd
!	Mem[00000000100c1400] = 6e1e92a8, %l4 = ffffffff, %l3 = 000000e1
	casa	[%i3]0x80,%l4,%l3	! %l3 = 000000006e1e92a8
!	Mem[00000000300c1408] = e1370002, %l0 = ffffffffffffb1cd
	lduha	[%i3+%o4]0x89,%l0	! %l0 = 0000000000000002
!	Mem[000000001004141c] = 1da45bae, %l7 = 00000000c8ffffff
	lduwa	[%i1+0x01c]%asi,%l7	! %l7 = 000000001da45bae
!	Mem[0000000030181408] = 1dffffff, %l0 = 0000000000000002
	ldswa	[%i6+%o4]0x89,%l0	! %l0 = 000000001dffffff
!	Mem[0000000030081410] = 00000000, %f9  = 13978a51
	lda	[%i2+%o5]0x81,%f9 	! %f9 = 00000000
!	Starting 10 instruction Store Burst
!	%l6 = 000000008f000000, Mem[0000000010041410] = ffff0000
	stwa	%l6,[%i1+%o5]0x80	! Mem[0000000010041410] = 8f000000

p0_label_158:
!	%l5 = 00000000ffffffff, Mem[0000000010101430] = b855c84fed0f510e
	stx	%l5,[%i4+0x030]		! Mem[0000000010101430] = 00000000ffffffff
!	Mem[00000000300c1410] = ffffffff, %l1 = 0000000000000000
	ldstuba	[%i3+%o5]0x89,%l1	! %l1 = 000000ff000000ff
!	%l2 = 000000000000783d, Mem[0000000010181400] = 00000000
	stba	%l2,[%i6+%g0]0x88	! Mem[0000000010181400] = 0000003d
!	%f20 = a3000000 e1370002, Mem[00000000100c1410] = ffffffff 00000000
	stda	%f20,[%i3+%o5]0x88	! Mem[00000000100c1410] = a3000000 e1370002
!	Mem[0000000010041408] = 1dfffff6, %l4 = ffffffffffffffff
	swapa	[%i1+%o4]0x88,%l4	! %l4 = 000000001dfffff6
!	%f6  = c7dc5b29 ffffff1d, Mem[00000000300c1410] = ffffffff ae5ba41d
	stda	%f6 ,[%i3+%o5]0x89	! Mem[00000000300c1410] = c7dc5b29 ffffff1d
!	Mem[00000000300c1408] = 020037e1, %l6 = 000000008f000000
	ldstuba	[%i3+%o4]0x81,%l6	! %l6 = 00000002000000ff
!	Mem[000000001010143c] = e1375c96, %l7 = 000000001da45bae
	ldstub	[%i4+0x03c],%l7		! %l7 = 000000e1000000ff
!	%f15 = f6060000, Mem[0000000030041408] = ffffffff
	sta	%f15,[%i1+%o4]0x81	! Mem[0000000030041408] = f6060000
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = 8f000000, %l2 = 000000000000783d
	ldsha	[%i1+%o5]0x80,%l2	! %l2 = ffffffffffff8f00

p0_label_159:
!	Mem[0000000010081408] = 3d000000, %l6 = 0000000000000002
	lduba	[%i2+%o4]0x80,%l6	! %l6 = 000000000000003d
!	Mem[0000000030041400] = 3d780000, %l7 = 00000000000000e1
	ldswa	[%i1+%g0]0x81,%l7	! %l7 = 000000003d780000
!	Mem[00000000100c1414] = 000000a3, %l6 = 000000000000003d
	lduw	[%i3+0x014],%l6		! %l6 = 00000000000000a3
!	Mem[0000000010081400] = ff0000ff, %f11 = b53b879c
	lda	[%i2+%g0]0x88,%f11	! %f11 = ff0000ff
!	Mem[0000000030141410] = 956266ff, %f2  = 020037e1
	lda	[%i5+%o5]0x89,%f2 	! %f2 = 956266ff
!	Mem[00000000211c0000] = 1dffa37b, %l7 = 000000003d780000
	ldsba	[%o2+0x000]%asi,%l7	! %l7 = 000000000000001d
!	Mem[0000000021800140] = 00002023, %l7 = 000000000000001d
	lduh	[%o3+0x140],%l7		! %l7 = 0000000000000000
!	Mem[0000000010081400] = ff0000ff, %l3 = 000000006e1e92a8
	lduwa	[%i2+%g0]0x88,%l3	! %l3 = 00000000ff0000ff
!	Mem[0000000010141410] = f2e20000f2e25d08, %l7 = 0000000000000000
	ldxa	[%i5+%o5]0x80,%l7	! %l7 = f2e20000f2e25d08
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1408] = e13700ff, %l7 = f2e20000f2e25d08
	swapa	[%i3+%o4]0x89,%l7	! %l7 = 00000000e13700ff

p0_label_160:
!	Mem[0000000010181408] = 783d37e1, %l1 = 00000000000000ff
	swapa	[%i6+%o4]0x88,%l1	! %l1 = 00000000783d37e1
!	Mem[0000000030101410] = 000000ff, %l5 = 00000000ffffffff
	swapa	[%i4+%o5]0x81,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030081400] = 00dfff85, %l7 = 00000000e13700ff
	swapa	[%i2+%g0]0x81,%l7	! %l7 = 0000000000dfff85
!	%f22 = f6000000 ffe2ff00, %l1 = 00000000783d37e1
!	Mem[0000000010081418] = d96af809005f0000
	add	%i2,0x018,%g1
	stda	%f22,[%g1+%l1]ASI_PST8_PL ! Mem[0000000010081418] = 006af809000000f6
!	Mem[00000000300c1400] = f6ffff1d, %l2 = ffffffffffff8f00
	ldstuba	[%i3+%g0]0x81,%l2	! %l2 = 000000f6000000ff
!	%l2 = 000000f6, %l3 = ff0000ff, Mem[0000000010101410] = 0000e2ff 1dffffff
	stda	%l2,[%i4+%o5]0x80	! Mem[0000000010101410] = 000000f6 ff0000ff
!	Mem[0000000010101413] = 000000f6, %l2 = 00000000000000f6
	ldstub	[%i4+0x013],%l2		! %l2 = 000000f6000000ff
!	%f24 = a8921e6e, Mem[0000000010041400] = 00000000
	sta	%f24,[%i1+0x000]%asi	! Mem[0000000010041400] = a8921e6e
!	%f2  = 956266ff 783d37e1, %l4 = 000000001dfffff6
!	Mem[00000000100c1430] = c348e55224174994
	add	%i3,0x030,%g1
	stda	%f2,[%g1+%l4]ASI_PST16_P ! Mem[00000000100c1430] = c34866ff783d4994
!	Starting 10 instruction Load Burst
!	Mem[0000000030101410] = ffffffff e1373d78, %l4 = 1dfffff6, %l5 = 000000ff
	ldda	[%i4+%o5]0x81,%l4	! %l4 = 00000000ffffffff 00000000e1373d78

!	Check Point 32 for processor 0

	set	p0_check_pt_data_32,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 000000001dffffff
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 00000000783d37e1
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 00000000000000f6
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 00000000ff0000ff
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 00000000ffffffff
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l6,%g2			! %l6 = 00000000000000a3
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l7,%g2			! %l7 = 0000000000dfff85
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x40],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = 956266ff 783d37e1
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x48],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 00ffe2ff 0099c1ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x50],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = c7dc5b29 ffffff1d
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x58],%g3
	std	%f8,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f8 = 49945b77 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf08,%g1
	ldx	[%g4+0x60],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = a8921e6e ff0000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x68],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = 00000000 000000f6
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1

!	Check Point 32 completed


p0_label_161:
!	Mem[0000000010001400] = 00000000 1dffffff, %l2 = 000000f6, %l3 = ff0000ff
	ldda	[%i0+%g0]0x80,%l2	! %l2 = 0000000000000000 000000001dffffff
!	Mem[0000000010041408] = ffffffff, %l7 = 0000000000dfff85
	lduwa	[%i1+%o4]0x80,%l7	! %l7 = 00000000ffffffff
	membar	#Sync			! Added by membar checker (40)
!	Mem[0000000010041400] = a8921e6e 000000ff ffffffff ffe20000
!	Mem[0000000010041410] = 8f000000 3b8aacb1 b1ac8a3b 1da45bae
!	Mem[0000000010041420] = d96af809 948a6312 9c8971bc d6fa8c51
!	Mem[0000000010041430] = 0000e2ff 1dffffff ff0000f2 a19e6944
	ldda	[%i1]ASI_BLK_P,%f16	! Block Load from 0000000010041400
!	Mem[0000000010001408] = ff0000f6, %l7 = 00000000ffffffff
	ldsba	[%i0+%o4]0x80,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010081410] = 8f000000, %f8  = 49945b77
	lda	[%i2+%o5]0x80,%f8 	! %f8 = 8f000000
!	Mem[0000000010141410] = f2e20000, %l4 = 00000000ffffffff
	lduha	[%i5+%o5]0x80,%l4	! %l4 = 000000000000f2e2
!	Mem[0000000030181410] = ff000000, %l5 = 00000000e1373d78
	lduba	[%i6+%o5]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000030101400] = d96af809, %l0 = 000000001dffffff
	lduha	[%i4+%g0]0x81,%l0	! %l0 = 000000000000d96a
!	Mem[0000000010101408] = 48000000, %l7 = ffffffffffffffff
	lduha	[%i4+%o4]0x88,%l7	! %l7 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030101408] = 000000a3, %l5 = 0000000000000000
	swapa	[%i4+%o4]0x81,%l5	! %l5 = 00000000000000a3

p0_label_162:
!	%l5 = 00000000000000a3, Mem[0000000010081408] = d31dca430000003d
	stxa	%l5,[%i2+%o4]0x88	! Mem[0000000010081408] = 00000000000000a3
!	%l2 = 0000000000000000, Mem[0000000030181408] = ffffff1dffe20000
	stxa	%l2,[%i6+%o4]0x81	! Mem[0000000030181408] = 0000000000000000
!	%l2 = 0000000000000000, Mem[0000000010141410] = f2e20000
	stba	%l2,[%i5+%o5]0x80	! Mem[0000000010141410] = 00e20000
!	%f3  = 783d37e1, Mem[0000000010081404] = 94491724
	sta	%f3 ,[%i2+0x004]%asi	! Mem[0000000010081404] = 783d37e1
!	%l3 = 000000001dffffff, Mem[0000000010101418] = cdb5ff90cdb50000
	stx	%l3,[%i4+0x018]		! Mem[0000000010101418] = 000000001dffffff
!	%f10 = a8921e6e, Mem[0000000030141410] = 956266ff
	sta	%f10,[%i5+%o5]0x89	! Mem[0000000030141410] = a8921e6e
!	%l4 = 000000000000f2e2, Mem[0000000010081410] = 0000008f
	stwa	%l4,[%i2+%o5]0x88	! Mem[0000000010081410] = 0000f2e2
!	%f10 = a8921e6e ff0000ff, %l2 = 0000000000000000
!	Mem[0000000010001418] = 783d37e1ffffffff
	add	%i0,0x018,%g1
	stda	%f10,[%g1+%l2]ASI_PST32_P ! Mem[0000000010001418] = 783d37e1ffffffff
	membar	#Sync			! Added by membar checker (41)
!	%l0 = 000000000000d96a, Mem[0000000010041431] = 0000e2ff, %asi = 80
	stba	%l0,[%i1+0x031]%asi	! Mem[0000000010041430] = 006ae2ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = 00000000, %l4 = 000000000000f2e2
	lduwa	[%i0+%o4]0x89,%l4	! %l4 = 0000000000000000

p0_label_163:
!	Mem[0000000030001410] = 85ffa892, %l1 = 00000000783d37e1
	lduha	[%i0+%o5]0x89,%l1	! %l1 = 000000000000a892
!	Mem[0000000030001408] = 00000000, %l5 = 00000000000000a3
	lduha	[%i0+%o4]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000030101408] = 00000000, %l5 = 0000000000000000
	lduwa	[%i4+%o4]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000010101400] = 00000000, %l5 = 0000000000000000
	ldsba	[%i4+%g0]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000030041410] = ffc19900, %l1 = 000000000000a892
	lduha	[%i1+%o5]0x81,%l1	! %l1 = 000000000000ffc1
!	Mem[0000000030041408] = 000006f6, %l0 = 000000000000d96a
	ldswa	[%i1+%o4]0x89,%l0	! %l0 = 00000000000006f6
!	Mem[0000000021800040] = ffff4289, %l1 = 000000000000ffc1
	ldub	[%o3+0x041],%l1		! %l1 = 00000000000000ff
!	Mem[00000000300c1400] = 1dffffff, %l7 = 0000000000000000
	lduwa	[%i3+%g0]0x89,%l7	! %l7 = 000000001dffffff
!	Mem[0000000010101410] = ff0000ff ff000000, %l2 = 00000000, %l3 = 1dffffff
	ldda	[%i4+%o5]0x88,%l2	! %l2 = 00000000ff000000 00000000ff0000ff
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1410] = 1dffffff, %l6 = 00000000000000a3
	ldstuba	[%i3+%o5]0x81,%l6	! %l6 = 0000001d000000ff

p0_label_164:
!	%l5 = 0000000000000000, Mem[0000000010081408] = 000000a3
	stwa	%l5,[%i2+%o4]0x88	! Mem[0000000010081408] = 00000000
!	Mem[0000000010001420] = 12638a94, %l7 = 000000001dffffff
	ldstub	[%i0+0x020],%l7		! %l7 = 00000012000000ff
!	Mem[00000000211c0000] = 1dffa37b, %l7 = 0000000000000012
	ldstub	[%o2+%g0],%l7		! %l7 = 0000001d000000ff
!	Mem[0000000010181400] = 0000003d, %l6 = 000000000000001d
	swapa	[%i6+%g0]0x88,%l6	! %l6 = 000000000000003d
!	Mem[00000000100c1418] = d96af809, %l2 = 00000000ff000000
	ldsba	[%i3+0x01a]%asi,%l2	! %l2 = fffffffffffffff8
!	Mem[0000000010141428] = 00ff00ff, %l0 = 00000000000006f6
	swap	[%i5+0x028],%l0		! %l0 = 0000000000ff00ff
!	Mem[0000000010001400] = 00000000, %l1 = 00000000000000ff
	ldstuba	[%i0+%g0]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030181400] = 783d37e1, %l1 = 0000000000000000
	ldstuba	[%i6+%g0]0x89,%l1	! %l1 = 000000e1000000ff
!	Mem[0000000010041410] = 8f000000, %l7 = 000000000000001d, %asi = 80
	swapa	[%i1+0x010]%asi,%l7	! %l7 = 000000008f000000
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = 3d373d78, %l6 = 000000000000003d
	ldsba	[%i3+%o4]0x80,%l6	! %l6 = 000000000000003d

p0_label_165:
!	Mem[0000000030101410] = 783d37e1ffffffff, %l6 = 000000000000003d
	ldxa	[%i4+%o5]0x89,%l6	! %l6 = 783d37e1ffffffff
!	Mem[0000000030101410] = ffffffff, %l4 = 0000000000000000
	ldsha	[%i4+%o5]0x81,%l4	! %l4 = ffffffffffffffff
!	Mem[00000000100c1400] = 00dfff85a8921e6e, %l1 = 00000000000000e1
	ldxa	[%i3+%g0]0x88,%l1	! %l1 = 00dfff85a8921e6e
!	Mem[0000000010141408] = ffff0000, %l3 = 00000000ff0000ff
	lduha	[%i5+%o4]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000010141438] = ae5ba41d00000000, %l1 = 00dfff85a8921e6e
	ldx	[%i5+0x038],%l1		! %l1 = ae5ba41d00000000
!	Mem[0000000030101408] = 00000000ffe20000, %l3 = 0000000000000000
	ldxa	[%i4+%o4]0x81,%l3	! %l3 = 00000000ffe20000
!	Mem[0000000010041410] = 1d000000, %l0 = 0000000000ff00ff
	lduha	[%i1+%o5]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000010141408] = ffff0000, %l0 = 0000000000000000
	lduba	[%i5+%o4]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000030081400] = e13700ffd31d0000, %f2  = 956266ff 783d37e1
	ldda	[%i2+%g0]0x81,%f2 	! %f2  = e13700ff d31d0000
!	Starting 10 instruction Store Burst
!	%l1 = ae5ba41d00000000, Mem[00000000300c1408] = 085de2f2783d37e1
	stxa	%l1,[%i3+%o4]0x81	! Mem[00000000300c1408] = ae5ba41d00000000

!	Check Point 33 for processor 0

	set	p0_check_pt_data_33,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 0000000000000000
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = ae5ba41d00000000
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = fffffffffffffff8
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 00000000ffe20000
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
	cmp	%l6,%g2			! %l6 = 783d37e1ffffffff
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 000000008f000000
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = e13700ff d31d0000
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x50],%g3
	std	%f8,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f8 = 8f000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf08,%g1
	ldx	[%g4+0x58],%g3
	std	%f16,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f16 = a8921e6e 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf16,%g1
	ldx	[%g4+0x60],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = ffffffff ffe20000
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1
	ldx	[%g4+0x68],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = 8f000000 3b8aacb1
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1
	ldx	[%g4+0x70],%g3
	std	%f22,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f22 = b1ac8a3b 1da45bae
	bne	%xcc,p0_freg_check_fail
	mov	0xf22,%g1
	ldx	[%g4+0x78],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = d96af809 948a6312
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1
	ldx	[%g4+0x80],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = 9c8971bc d6fa8c51
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1
	ldx	[%g4+0x88],%g3
	std	%f28,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f28 = 0000e2ff 1dffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf28,%g1
	ldx	[%g4+0x90],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = ff0000f2 a19e6944
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 33 completed


p0_label_166:
!	Mem[0000000030181408] = 00000000, %l0 = 0000000000000000
	swapa	[%i6+%o4]0x89,%l0	! %l0 = 0000000000000000
!	%l2 = fffffffffffffff8, Mem[0000000010181410] = 0000e2f2
	stba	%l2,[%i6+%o5]0x80	! Mem[0000000010181410] = f800e2f2
!	Mem[00000000300c1400] = 1dffffff, %l5 = 0000000000000000
	swapa	[%i3+%g0]0x89,%l5	! %l5 = 000000001dffffff
!	Mem[0000000010181400] = 0000001d, %l6 = 783d37e1ffffffff
	swapa	[%i6+%g0]0x88,%l6	! %l6 = 000000000000001d
!	Mem[00000000300c1408] = ae5ba41d, %l0 = 0000000000000000
	swapa	[%i3+%o4]0x81,%l0	! %l0 = 00000000ae5ba41d
!	Mem[00000000201c0000] = 1dd3851d, %l1 = ae5ba41d00000000
	ldstub	[%o0+%g0],%l1		! %l1 = 0000001d000000ff
!	Mem[0000000030041408] = 000006f6, %l3 = 00000000ffe20000
	swapa	[%i1+%o4]0x89,%l3	! %l3 = 00000000000006f6
!	%f30 = ff0000f2, Mem[0000000030181408] = 00000000
	sta	%f30,[%i6+%o4]0x89	! Mem[0000000030181408] = ff0000f2
!	Mem[0000000030101408] = 00000000, %l5 = 000000001dffffff
	ldstuba	[%i4+%o4]0x81,%l5	! %l5 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = 3b8aacb1, %l1 = 000000000000001d
	ldsba	[%i0+%o5]0x88,%l1	! %l1 = ffffffffffffffb1

p0_label_167:
!	Mem[00000000100c1408] = 3d373d78 a8921e6e, %l6 = 0000001d, %l7 = 8f000000
	ldda	[%i3+%o4]0x80,%l6	! %l6 = 000000003d373d78 00000000a8921e6e
!	Mem[0000000020800040] = ffffb8ec, %l3 = 00000000000006f6
	lduba	[%o1+0x041]%asi,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010181410] = f800e2f2 35ade500, %l6 = 3d373d78, %l7 = a8921e6e
	ldd	[%i6+%o5],%l6		! %l6 = 00000000f800e2f2 0000000035ade500
!	Mem[0000000010081408] = 00000000 00000000, %l2 = fffffff8, %l3 = 000000ff
	ldda	[%i2+%o4]0x80,%l2	! %l2 = 0000000000000000 0000000000000000
!	%l4 = ffffffffffffffff, immd = fffffffffffff10e, %l1 = ffffffffffffffb1
	sdivx	%l4,-0xef2,%l1		! %l1 = 0000000000000000
!	Mem[0000000030181400] = 783d37ff, %l4 = ffffffffffffffff
	lduha	[%i6+%g0]0x89,%l4	! %l4 = 00000000000037ff
!	Mem[0000000010001400] = ff000000, %l4 = 00000000000037ff
	ldsh	[%i0+0x002],%l4		! %l4 = 0000000000000000
!	Mem[0000000010181400] = ffffffff1dffffff, %f20 = 8f000000 3b8aacb1
	ldda	[%i6+%g0]0x80,%f20	! %f20 = ffffffff 1dffffff
!	Mem[0000000030081408] = 00000000, %l0 = 00000000ae5ba41d
	ldsba	[%i2+%o4]0x81,%l0	! %l0 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000000000, Mem[0000000010101408] = 48000000
	stba	%l4,[%i4+%o4]0x88	! Mem[0000000010101408] = 48000000

p0_label_168:
!	%l4 = 0000000000000000, Mem[00000000100c1410] = e1370002
	stha	%l4,[%i3+%o5]0x88	! Mem[00000000100c1410] = e1370000
!	%l6 = f800e2f2, %l7 = 35ade500, Mem[0000000030101400] = d96af809 948a6312
	stda	%l6,[%i4+%g0]0x81	! Mem[0000000030101400] = f800e2f2 35ade500
!	Mem[0000000030081408] = 00000000, %l5 = 0000000000000000
	swapa	[%i2+%o4]0x89,%l5	! %l5 = 0000000000000000
!	%l1 = 0000000000000000, Mem[000000001000142c] = bc71899c
	stw	%l1,[%i0+0x02c]		! Mem[000000001000142c] = 00000000
!	Mem[0000000010181400] = ffffffff, %l4 = 0000000000000000
	swap	[%i6+%g0],%l4		! %l4 = 00000000ffffffff
!	%f25 = 948a6312, Mem[000000001008141c] = 000000f6
	st	%f25,[%i2+0x01c]	! Mem[000000001008141c] = 948a6312
!	%f24 = d96af809, Mem[00000000100c1408] = 783d373d
	sta	%f24,[%i3+%o4]0x88	! Mem[00000000100c1408] = d96af809
!	Mem[0000000030101410] = ffffffff, %l0 = 0000000000000000
	swapa	[%i4+%o5]0x89,%l0	! %l0 = 00000000ffffffff
!	%l6 = 00000000f800e2f2, Mem[0000000010001400] = 000000ff
	stba	%l6,[%i0+%g0]0x88	! Mem[0000000010001400] = 000000f2
!	Starting 10 instruction Load Burst
!	Mem[0000000030081410] = 00000000000000a3, %l3 = 0000000000000000
	ldxa	[%i2+%o5]0x81,%l3	! %l3 = 00000000000000a3

p0_label_169:
!	Mem[00000000300c1400] = 00000000, %l4 = 00000000ffffffff
	lduwa	[%i3+%g0]0x81,%l4	! %l4 = 0000000000000000
!	Mem[00000000100c1424] = 92c80374, %l0 = 00000000ffffffff
	ldsw	[%i3+0x024],%l0		! %l0 = ffffffff92c80374
!	Mem[0000000010181408] = 00000000000000ff, %l6 = 00000000f800e2f2
	ldxa	[%i6+%o4]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010181408] = ff000000 00000000, %l0 = 92c80374, %l1 = 00000000
	ldda	[%i6+%o4]0x80,%l0	! %l0 = 00000000ff000000 0000000000000000
!	Mem[000000001018143c] = 061d62c0, %l2 = 0000000000000000
	ldsh	[%i6+0x03c],%l2		! %l2 = 000000000000061d
!	Mem[00000000100c142c] = 00000000, %l2 = 000000000000061d
	ldsh	[%i3+0x02c],%l2		! %l2 = 0000000000000000
!	Mem[0000000030041408] = 0000e2ff, %l1 = 0000000000000000
	lduha	[%i1+%o4]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000010081400] = ff0000ff, %l5 = 0000000000000000
	ldsha	[%i2+%g0]0x80,%l5	! %l5 = ffffffffffffff00
!	Mem[0000000021800040] = ffff4289, %l4 = 0000000000000000
	ldsba	[%o3+0x040]%asi,%l4	! %l4 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	Mem[0000000030001400] = 00000000, %l7 = 0000000035ade500
	ldstuba	[%i0+%g0]0x89,%l7	! %l7 = 00000000000000ff

p0_label_170:
!	%l0 = 00000000ff000000, Mem[0000000010141408] = ffff0000
	stwa	%l0,[%i5+%o4]0x88	! Mem[0000000010141408] = ff000000
!	%f20 = ffffffff 1dffffff, Mem[0000000030181408] = ff0000f2 00000000
	stda	%f20,[%i6+%o4]0x89	! Mem[0000000030181408] = ffffffff 1dffffff
!	Mem[0000000010141408] = ff000000, %l2 = 0000000000000000
	swapa	[%i5+%o4]0x88,%l2	! %l2 = 00000000ff000000
!	Mem[0000000010041400] = 6e1e92a8, %l0 = 00000000ff000000
	ldstuba	[%i1+%g0]0x88,%l0	! %l0 = 000000a8000000ff
!	%l4 = ffffffffffffffff, Mem[000000001008140b] = 00000000, %asi = 80
	stba	%l4,[%i2+0x00b]%asi	! Mem[0000000010081408] = 000000ff
!	Mem[0000000010001410] = b1ac8a3b, %l4 = ffffffff, %l5 = ffffff00
	add	%i0,0x10,%g1
	casa	[%g1]0x80,%l4,%l5	! %l5 = 00000000b1ac8a3b
!	%l3 = 00000000000000a3, Mem[0000000010001408] = f6ffff1df60000ff
	stxa	%l3,[%i0+%o4]0x88	! Mem[0000000010001408] = 00000000000000a3
!	Mem[0000000010001408] = 000000a3, %l5 = 00000000b1ac8a3b
	ldstuba	[%i0+%o4]0x88,%l5	! %l5 = 000000a3000000ff
!	%f8  = 8f000000 00000000, Mem[00000000300c1400] = 00000000 ffe5ad35
	stda	%f8 ,[%i3+%g0]0x89	! Mem[00000000300c1400] = 8f000000 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = ff0037e1, %l7 = 0000000000000000
	ldsha	[%i2+%g0]0x89,%l7	! %l7 = 00000000000037e1

!	Check Point 34 for processor 0

	set	p0_check_pt_data_34,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 00000000000000a8
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 0000000000000000
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 00000000ff000000
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 00000000000000a3
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = ffffffffffffffff
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 00000000000000a3
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 00000000000037e1
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = f6ffff1d 35ade5ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x50],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = e13700ff d31d0000
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x58],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = c7dc5b29 ffffff1d
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x60],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = ffffffff 1dffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1

!	Check Point 34 completed


p0_label_171:
!	Mem[00000000211c0000] = ffffa37b, %l3 = 00000000000000a3
	ldsh	[%o2+%g0],%l3		! %l3 = ffffffffffffffff
!	Mem[0000000010081400] = e1373d78ff0000ff, %l4 = ffffffffffffffff
	ldxa	[%i2+%g0]0x88,%l4	! %l4 = e1373d78ff0000ff
!	Mem[00000000100c1410] = 000037e1, %l2 = 00000000ff000000
	ldsha	[%i3+0x010]%asi,%l2	! %l2 = 0000000000000000
!	Mem[0000000010141400] = 0000e2ff1dffffff, %f8  = 8f000000 00000000
	ldda	[%i5+%g0]0x80,%f8 	! %f8  = 0000e2ff 1dffffff
!	Mem[00000000300c1410] = ffffffff, %l0 = 00000000000000a8
	lduba	[%i3+%o5]0x81,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030141410] = 6e1e92a8, %l0 = 00000000000000ff
	lduwa	[%i5+%o5]0x81,%l0	! %l0 = 000000006e1e92a8
!	Mem[00000000300c1410] = ffffffff, %l5 = 00000000000000a3
	ldswa	[%i3+%o5]0x89,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000010181400] = ffffff1d00000000, %f4  = 00ffe2ff 0099c1ff
	ldda	[%i6+%g0]0x88,%f4 	! %f4  = ffffff1d 00000000
!	Mem[0000000010141410] = 00e20000, %f10 = a8921e6e
	lda	[%i5+%o5]0x80,%f10	! %f10 = 00e20000
!	Starting 10 instruction Store Burst
!	Mem[0000000030101400] = f2e200f8, %l5 = ffffffffffffffff
	swapa	[%i4+%g0]0x89,%l5	! %l5 = 00000000f2e200f8

p0_label_172:
!	%l4 = e1373d78ff0000ff, Mem[0000000030101410] = 00000000
	stba	%l4,[%i4+%o5]0x89	! Mem[0000000030101410] = 000000ff
!	%f0  = f6ffff1d 35ade5ff e13700ff d31d0000
!	%f4  = ffffff1d 00000000 c7dc5b29 ffffff1d
!	%f8  = 0000e2ff 1dffffff 00e20000 ff0000ff
!	%f12 = 0e510fed 4fc855b8 965c37e1 f6060000
	stda	%f0,[%i4]ASI_BLK_S	! Block Store to 0000000030101400
!	%l5 = 00000000f2e200f8, Mem[0000000010101406] = 0000ffff
	sth	%l5,[%i4+0x006]		! Mem[0000000010101404] = 000000f8
!	Mem[0000000010181408] = ff000000, %l4 = e1373d78ff0000ff
	ldstuba	[%i6+%o4]0x80,%l4	! %l4 = 000000ff000000ff
!	Mem[0000000010181420] = b1cdffff, %l6 = 00000000000000ff
	swap	[%i6+0x020],%l6		! %l6 = 00000000b1cdffff
!	%l5 = 00000000f2e200f8, Mem[0000000030001410] = 85ffa892
	stha	%l5,[%i0+%o5]0x89	! Mem[0000000030001410] = 85ff00f8
!	%l5 = 00000000f2e200f8, Mem[0000000030101410] = 000000001dffffff
	stxa	%l5,[%i4+%o5]0x89	! Mem[0000000030101410] = 00000000f2e200f8
!	%f20 = ffffffff, Mem[0000000010041410] = 0000001d
	sta	%f20,[%i1+%o5]0x80	! Mem[0000000010041410] = ffffffff
!	Mem[0000000030081408] = 00000000, %l1 = 0000000000000000
	ldstuba	[%i2+%o4]0x81,%l1	! %l1 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = ff0000ff783d37e1, %f18 = ffffffff ffe20000
	ldda	[%i2+%g0]0x80,%f18	! %f18 = ff0000ff 783d37e1

p0_label_173:
!	Mem[0000000010001438] = 44699ea1, %l1 = 0000000000000000
	lduba	[%i0+0x03b]%asi,%l1	! %l1 = 00000000000000a1
!	Mem[0000000030041408] = 0000e2ff, %l6 = 00000000b1cdffff
	lduwa	[%i1+%o4]0x81,%l6	! %l6 = 000000000000e2ff
!	Mem[0000000010041410] = ffffffff, %f26 = 9c8971bc
	lda	[%i1+%o5]0x80,%f26	! %f26 = ffffffff
	membar	#Sync			! Added by membar checker (42)
!	Mem[0000000010101418] = 00000000, %l7 = 00000000000037e1
	ldsh	[%i4+0x018],%l7		! %l7 = 0000000000000000
!	Mem[0000000030081400] = e13700ff d31d0000, %l6 = 0000e2ff, %l7 = 00000000
	ldda	[%i2+%g0]0x81,%l6	! %l6 = 00000000e13700ff 00000000d31d0000
!	Code Fragment 3
p0_fragment_5:
!	%l0 = 000000006e1e92a8
	setx	0xce8b4c08670bb4a0,%g7,%l0 ! %l0 = ce8b4c08670bb4a0
!	%l1 = 00000000000000a1
	setx	0x5b94e4e7bca808b0,%g7,%l1 ! %l1 = 5b94e4e7bca808b0
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = ce8b4c08670bb4a0
	setx	0x7644c17024a71625,%g7,%l0 ! %l0 = 7644c17024a71625
!	%l1 = 5b94e4e7bca808b0
	setx	0xff41cd27d5c5363e,%g7,%l1 ! %l1 = ff41cd27d5c5363e
!	Mem[00000000300c1410] = ffffffff 295bdcc7, %l2 = 00000000, %l3 = ffffffff
	ldda	[%i3+%o5]0x81,%l2	! %l2 = 00000000ffffffff 00000000295bdcc7
!	Mem[00000000211c0000] = ffffa37b, %l7 = 00000000d31d0000
	lduh	[%o2+%g0],%l7		! %l7 = 000000000000ffff
!	Mem[0000000010081408] = 000000ff00000000, %l4 = 00000000000000ff
	ldxa	[%i2+%o4]0x80,%l4	! %l4 = 000000ff00000000
!	Starting 10 instruction Store Burst
!	%f6  = c7dc5b29 ffffff1d, Mem[0000000030181410] = 000000ff 3b8aacb1
	stda	%f6 ,[%i6+%o5]0x81	! Mem[0000000030181410] = c7dc5b29 ffffff1d

p0_label_174:
!	%f30 = ff0000f2 a19e6944, %l4 = 000000ff00000000
!	Mem[0000000030041408] = 0000e2ffffffffc8
	add	%i1,0x008,%g1
	stda	%f30,[%g1+%l4]ASI_PST8_S ! Mem[0000000030041408] = 0000e2ffffffffc8
!	%l0 = 24a71625, %l1 = d5c5363e, Mem[0000000010141408] = 00000000 00000000
	stda	%l0,[%i5+%o4]0x80	! Mem[0000000010141408] = 24a71625 d5c5363e
!	%f28 = 0000e2ff 1dffffff, Mem[0000000010001408] = ff000000 00000000
	stda	%f28,[%i0+%o4]0x80	! Mem[0000000010001408] = 0000e2ff 1dffffff
!	%f8  = 0000e2ff, Mem[0000000010041420] = d96af809
	sta	%f8 ,[%i1+0x020]%asi	! Mem[0000000010041420] = 0000e2ff
!	Mem[0000000010101408] = 48000000, %l2 = 00000000ffffffff
	swapa	[%i4+%o4]0x88,%l2	! %l2 = 0000000048000000
!	Mem[0000000010101408] = ffffffff, %l2 = 0000000048000000
	ldstuba	[%i4+%o4]0x88,%l2	! %l2 = 000000ff000000ff
!	%f26 = ffffffff, Mem[0000000030181408] = ffffff1d
	sta	%f26,[%i6+%o4]0x81	! Mem[0000000030181408] = ffffffff
!	Mem[00000000201c0001] = ffd3851d, %l3 = 00000000295bdcc7
	ldstuba	[%o0+0x001]%asi,%l3	! %l3 = 000000d3000000ff
!	Mem[00000000300c1400] = 00000000, %l6 = 00000000e13700ff
	swapa	[%i3+%g0]0x81,%l6	! %l6 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = f800ff85, %l0 = 7644c17024a71625
	lduwa	[%i0+%o5]0x81,%l0	! %l0 = 00000000f800ff85

p0_label_175:
!	Mem[0000000010141410] = 00e20000, %l1 = ff41cd27d5c5363e
	ldswa	[%i5+%o5]0x80,%l1	! %l1 = 0000000000e20000
!	Mem[0000000010141410] = 085de2f20000e200, %l4 = 000000ff00000000
	ldxa	[%i5+%o5]0x88,%l4	! %l4 = 085de2f20000e200
!	Mem[0000000010101408] = ffffffff0000ffff, %f10 = 00e20000 ff0000ff
	ldda	[%i4+%o4]0x80,%f10	! %f10 = ffffffff 0000ffff
!	Mem[0000000010181410] = f800e2f235ade500, %f22 = b1ac8a3b 1da45bae
	ldda	[%i6+%o5]0x80,%f22	! %f22 = f800e2f2 35ade500
!	Mem[0000000010001418] = 783d37e1 ffffffff, %l2 = 000000ff, %l3 = 000000d3
	ldd	[%i0+0x018],%l2		! %l2 = 00000000783d37e1 00000000ffffffff
!	Mem[0000000030101400] = f6ffff1d, %l1 = 0000000000e20000
	lduba	[%i4+%g0]0x81,%l1	! %l1 = 00000000000000f6
!	Mem[0000000010081400] = ff0000ff, %l1 = 00000000000000f6
	ldsba	[%i2+0x003]%asi,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010181408] = 000000ff, %l4 = 085de2f20000e200
	lduha	[%i6+%o4]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[00000000100c1438] = 68e68f57b1cdffff, %f8  = 0000e2ff 1dffffff
	ldda	[%i3+0x038]%asi,%f8 	! %f8  = 68e68f57 b1cdffff
!	Starting 10 instruction Store Burst
!	%f6  = c7dc5b29 ffffff1d, %l0 = 00000000f800ff85
!	Mem[0000000030141400] = f6000000ffffffff
	stda	%f6,[%i5+%l0]ASI_PST32_SL ! Mem[0000000030141400] = 1dffffffffffffff

!	Check Point 35 for processor 0

	set	p0_check_pt_data_35,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 00000000f800ff85
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = ffffffffffffffff
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 00000000783d37e1
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
	cmp	%l5,%g2			! %l5 = 00000000f2e200f8
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 0000000000000000
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 000000000000ffff
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = e13700ff d31d0000
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x50],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = ffffff1d 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x58],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = c7dc5b29 ffffff1d
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x60],%g3
	std	%f8,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f8 = 68e68f57 b1cdffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf08,%g1
	ldx	[%g4+0x68],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = ffffffff 0000ffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x70],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = ff0000ff 783d37e1
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1
	ldx	[%g4+0x78],%g3
	std	%f22,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f22 = f800e2f2 35ade500
	bne	%xcc,p0_freg_check_fail
	mov	0xf22,%g1
	ldx	[%g4+0x80],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = ffffffff d6fa8c51
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1

!	Check Point 35 completed


p0_label_176:
!	%l2 = 00000000783d37e1, Mem[0000000010081400] = ff0000ff
	stha	%l2,[%i2+%g0]0x88	! Mem[0000000010081400] = ff0037e1
!	Mem[0000000030081408] = 000000ff, %l5 = 00000000f2e200f8
	swapa	[%i2+%o4]0x89,%l5	! %l5 = 00000000000000ff
!	%f30 = ff0000f2 a19e6944, Mem[0000000010101408] = ffffffff ffff0000
	stda	%f30,[%i4+%o4]0x88	! Mem[0000000010101408] = ff0000f2 a19e6944
!	Mem[0000000030101400] = 1dfffff6, %l4 = 00000000000000ff
	swapa	[%i4+%g0]0x89,%l4	! %l4 = 000000001dfffff6
!	%f12 = 0e510fed 4fc855b8, %l6 = 0000000000000000
!	Mem[0000000030141410] = 6e1e92a8412ccb02
	add	%i5,0x010,%g1
	stda	%f12,[%g1+%l6]ASI_PST16_S ! Mem[0000000030141410] = 6e1e92a8412ccb02
!	Mem[0000000030101408] = ff0037e1, %l7 = 000000000000ffff
	ldstuba	[%i4+%o4]0x89,%l7	! %l7 = 000000e1000000ff
!	Mem[00000000300c1408] = 00000000, %l2 = 00000000783d37e1
	swapa	[%i3+%o4]0x81,%l2	! %l2 = 0000000000000000
!	%l6 = 0000000000000000, Mem[0000000010141400] = 0000e2ff, %asi = 80
	stwa	%l6,[%i5+0x000]%asi	! Mem[0000000010141400] = 00000000
!	Mem[0000000010101415] = ff0000ff, %l5 = 00000000000000ff
	ldstub	[%i4+0x015],%l5		! %l5 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = ffffffff ffe20000, %l6 = 00000000, %l7 = 000000e1
	ldda	[%i1+%o4]0x80,%l6	! %l6 = 00000000ffffffff 00000000ffe20000

p0_label_177:
!	Mem[0000000010181410] = f800e2f2, %l7 = 00000000ffe20000
	lduwa	[%i6+0x010]%asi,%l7	! %l7 = 00000000f800e2f2
!	Mem[0000000020800040] = ffffb8ec, %l4 = 000000001dfffff6
	ldsh	[%o1+0x040],%l4		! %l4 = ffffffffffffffff
!	Mem[0000000030081400] = e13700ff, %l5 = 0000000000000000
	lduwa	[%i2+%g0]0x81,%l5	! %l5 = 00000000e13700ff
!	Mem[0000000010181410] = f2e200f8, %l1 = ffffffffffffffff
	lduha	[%i6+%o5]0x88,%l1	! %l1 = 00000000000000f8
!	Mem[0000000030041408] = ffe20000, %l0 = 00000000f800ff85
	ldsha	[%i1+%o4]0x89,%l0	! %l0 = 0000000000000000
!	Mem[00000000300c1408] = e1373d78, %l3 = 00000000ffffffff
	ldswa	[%i3+%o4]0x89,%l3	! %l3 = ffffffffe1373d78
!	Mem[00000000100c1400] = 6e1e92a8, %l7 = 00000000f800e2f2
	lduha	[%i3+%g0]0x80,%l7	! %l7 = 0000000000006e1e
!	Mem[0000000010101410] = 000000ff, %l5 = 00000000e13700ff
	lduba	[%i4+0x013]%asi,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010181400] = 00000000, %l6 = 00000000ffffffff
	ldsba	[%i6+%g0]0x88,%l6	! %l6 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010101400] = 00000000, %l5 = 00000000000000ff
	ldstuba	[%i4+%g0]0x80,%l5	! %l5 = 00000000000000ff

p0_label_178:
!	%f20 = ffffffff 1dffffff, %l6 = 0000000000000000
!	Mem[0000000030081430] = 9449172452e548c3
	add	%i2,0x030,%g1
	stda	%f20,[%g1+%l6]ASI_PST8_SL ! Mem[0000000030081430] = 9449172452e548c3
!	Mem[0000000010181410] = f2e200f8, %l3 = ffffffffe1373d78
	swapa	[%i6+%o5]0x88,%l3	! %l3 = 00000000f2e200f8
!	%l2 = 0000000000000000, Mem[0000000030041410] = 0000e2ff0099c1ff
	stxa	%l2,[%i1+%o5]0x89	! Mem[0000000030041410] = 0000000000000000
!	Mem[0000000021800000] = ffff57e0, %l0 = 0000000000000000
	ldstub	[%o3+%g0],%l0		! %l0 = 000000ff000000ff
!	%f16 = a8921e6e 000000ff ff0000ff 783d37e1
!	%f20 = ffffffff 1dffffff f800e2f2 35ade500
!	%f24 = d96af809 948a6312 ffffffff d6fa8c51
!	%f28 = 0000e2ff 1dffffff ff0000f2 a19e6944
	stda	%f16,[%i4]ASI_BLK_S	! Block Store to 0000000030101400
!	%f14 = 965c37e1 f6060000, Mem[0000000030001410] = f800ff85 6e1e92a8
	stda	%f14,[%i0+%o5]0x81	! Mem[0000000030001410] = 965c37e1 f6060000
!	%l6 = 0000000000000000, Mem[0000000010101428] = 9c873bb5, %asi = 80
	stwa	%l6,[%i4+0x028]%asi	! Mem[0000000010101428] = 00000000
!	%f0  = f6ffff1d, Mem[0000000010001400] = f2000000
	st	%f0 ,[%i0+%g0]		! Mem[0000000010001400] = f6ffff1d
!	%l3 = 00000000f2e200f8, Mem[00000000300c1410] = ffffffff
	stha	%l3,[%i3+%o5]0x81	! Mem[00000000300c1410] = 00f8ffff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = e13700ff, %l6 = 0000000000000000
	ldsb	[%i2+0x001],%l6		! %l6 = 0000000000000037

p0_label_179:
!	Mem[00000000100c1408] = 09f86ad9 a8921e6e, %l0 = 000000ff, %l1 = 000000f8
	ldda	[%i3+0x008]%asi,%l0	! %l0 = 0000000009f86ad9 00000000a8921e6e
	membar	#Sync			! Added by membar checker (43)
!	Mem[0000000030001400] = ff000000 000000ff 00000000 5ad71e3b
!	Mem[0000000030001410] = 965c37e1 f6060000 9af317ac 5c8cb8fa
!	Mem[0000000030001420] = b27abcf1 dbfb9bb4 c348e552 a78c711b
!	Mem[0000000030001430] = 020037e1 783d37e1 c9d57b32 143a3a87
	ldda	[%i0]ASI_BLK_SL,%f16	! Block Load from 0000000030001400
!	Mem[00000000201c0000] = ffff851d, %l2 = 0000000000000000
	ldsh	[%o0+%g0],%l2		! %l2 = ffffffffffffffff
!	Mem[0000000030181410] = c7dc5b29, %l0 = 0000000009f86ad9
	lduba	[%i6+%o5]0x81,%l0	! %l0 = 00000000000000c7
!	Mem[0000000030101400] = 6e1e92a8, %l7 = 0000000000006e1e
	ldswa	[%i4+%g0]0x89,%l7	! %l7 = 000000006e1e92a8
!	Mem[0000000010181408] = ff000000, %l3 = 00000000f2e200f8
	ldsba	[%i6+%o4]0x80,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000030181410] = c7dc5b29, %l2 = ffffffffffffffff
	ldsba	[%i6+%o5]0x81,%l2	! %l2 = ffffffffffffffc7
!	Mem[00000000100c1410] = a3000000 e1370000, %l6 = 00000037, %l7 = 6e1e92a8
	ldda	[%i3+%o5]0x88,%l6	! %l6 = 00000000e1370000 00000000a3000000
!	Mem[0000000010181404] = 1dffffff, %l1 = 00000000a8921e6e
	lduba	[%i6+0x007]%asi,%l1	! %l1 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000010141410] = 0000e200, %l1 = 00000000000000ff
	ldstuba	[%i5+%o5]0x88,%l1	! %l1 = 00000000000000ff

p0_label_180:
!	Mem[0000000010181400] = 000000001dffffff, %l3 = ffffffffffffffff, %l2 = ffffffffffffffc7
	casxa	[%i6]0x80,%l3,%l2	! %l2 = 000000001dffffff
!	%l6 = e1370000, %l7 = a3000000, Mem[0000000010141410] = 0000e2ff 085de2f2
	stda	%l6,[%i5+%o5]0x88	! Mem[0000000010141410] = e1370000 a3000000
!	Mem[0000000010181404] = 1dffffff, %l7 = 00000000a3000000
	ldstub	[%i6+0x004],%l7		! %l7 = 0000001d000000ff
	membar	#Sync			! Added by membar checker (44)
!	%l6 = 00000000e1370000, Mem[0000000030001408] = 3b1ed75a00000000
	stxa	%l6,[%i0+%o4]0x89	! Mem[0000000030001408] = 00000000e1370000
!	%l7 = 000000000000001d, Mem[0000000030081400] = e13700ffd31d0000
	stxa	%l7,[%i2+%g0]0x81	! Mem[0000000030081400] = 000000000000001d
!	%f1  = 35ade5ff, Mem[0000000010181410] = e1373d78
	sta	%f1 ,[%i6+%o5]0x88	! Mem[0000000010181410] = 35ade5ff
!	%l2 = 000000001dffffff, Mem[0000000030041408] = 0000e2ff
	stwa	%l2,[%i1+%o4]0x81	! Mem[0000000030041408] = 1dffffff
!	Mem[0000000030041400] = 0000783d, %l6 = 00000000e1370000
	ldstuba	[%i1+%g0]0x89,%l6	! %l6 = 0000003d000000ff
!	%l5 = 0000000000000000, Mem[0000000030081408] = f2e200f8
	stba	%l5,[%i2+%o4]0x89	! Mem[0000000030081408] = f2e20000
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = e13700ff783d37e1, %f2  = e13700ff d31d0000
	ldda	[%i2+0x000]%asi,%f2 	! %f2  = e13700ff 783d37e1

!	Check Point 36 for processor 0

	set	p0_check_pt_data_36,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 00000000000000c7
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 0000000000000000
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 000000001dffffff
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
	cmp	%l6,%g2			! %l6 = 000000000000003d
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 000000000000001d
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = f6ffff1d 35ade5ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x50],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = e13700ff 783d37e1
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x58],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = c7dc5b29 ffffff1d
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x60],%g3
	std	%f16,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f16 = ff000000 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf16,%g1
	ldx	[%g4+0x68],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = 3b1ed75a 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1
	ldx	[%g4+0x70],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = 000006f6 e1375c96
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1
	ldx	[%g4+0x78],%g3
	std	%f22,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f22 = fab88c5c ac17f39a
	bne	%xcc,p0_freg_check_fail
	mov	0xf22,%g1
	ldx	[%g4+0x80],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = b49bfbdb f1bc7ab2
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1
	ldx	[%g4+0x88],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = 1b718ca7 52e548c3
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1
	ldx	[%g4+0x90],%g3
	std	%f28,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f28 = e1373d78 e1370002
	bne	%xcc,p0_freg_check_fail
	mov	0xf28,%g1
	ldx	[%g4+0x98],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = 873a3a14 327bd5c9
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 36 completed


p0_label_181:
!	Mem[0000000010181400] = 00000000, %l5 = 0000000000000000
	lduwa	[%i6+%g0]0x80,%l5	! %l5 = 0000000000000000
!	Mem[00000000300c1400] = 8f000000 ff0037e1, %l4 = ffffffff, %l5 = 00000000
	ldda	[%i3+%g0]0x89,%l4	! %l4 = 00000000ff0037e1 000000008f000000
!	Mem[0000000010001400] = f6ffff1d 1dffffff 0000e2ff 1dffffff
!	Mem[0000000010001410] = b1ac8a3b 00000000 783d37e1 ffffffff
!	Mem[0000000010001420] = ff638a94 09f86ad9 518cfad6 00000000
!	Mem[0000000010001430] = ffffff1d ffe20000 44699ea1 f20000ff
	ldda	[%i0]ASI_BLK_AIUPL,%f16	! Block Load from 0000000010001400
!	Mem[0000000010181430] = f2e20000, %f0  = f6ffff1d
	ld	[%i6+0x030],%f0 	! %f0 = f2e20000
!	Mem[0000000010181400] = 00000000, %l6 = 000000000000003d
	lduwa	[%i6+%g0]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000030101410] = ffffffff, %l6 = 0000000000000000
	lduwa	[%i4+%o5]0x81,%l6	! %l6 = 00000000ffffffff
!	Mem[0000000010141400] = 000000001dffffff, %f10 = ffffffff 0000ffff
	ldda	[%i5+%g0]0x80,%f10	! %f10 = 00000000 1dffffff
!	Mem[0000000010081400] = e13700ff, %l5 = 000000008f000000
	lduha	[%i2+%g0]0x80,%l5	! %l5 = 000000000000e137
!	Mem[00000000211c0000] = ffffa37b, %l7 = 000000000000001d
	lduha	[%o2+0x000]%asi,%l7	! %l7 = 000000000000ffff
!	Starting 10 instruction Store Burst
!	Mem[0000000010101408] = a19e6944, %l1 = 0000000000000000
	swapa	[%i4+%o4]0x88,%l1	! %l1 = 00000000a19e6944

p0_label_182:
!	%l4 = 00000000ff0037e1, Mem[00000000100c142c] = 00000000
	sth	%l4,[%i3+0x02c]		! Mem[00000000100c142c] = 37e10000
!	%l2 = 000000001dffffff, Mem[0000000010081408] = 000000ff
	stba	%l2,[%i2+%o4]0x80	! Mem[0000000010081408] = ff0000ff
!	%l5 = 000000000000e137, Mem[0000000030081410] = 00000000
	stwa	%l5,[%i2+%o5]0x89	! Mem[0000000030081410] = 0000e137
!	Mem[0000000010181429] = ffe5ad35, %l7 = 000000000000ffff
	ldstub	[%i6+0x029],%l7		! %l7 = 000000e5000000ff
!	Mem[0000000010141408] = 24a71625, %l2 = 000000001dffffff
	ldstuba	[%i5+%o4]0x80,%l2	! %l2 = 00000024000000ff
!	%l4 = ff0037e1, %l5 = 0000e137, Mem[0000000010081418] = 006af809 948a6312
	stda	%l4,[%i2+0x018]%asi	! Mem[0000000010081418] = ff0037e1 0000e137
!	Mem[0000000010181420] = 000000ff578fe668, %l5 = 000000000000e137, %l2 = 0000000000000024
	add	%i6,0x20,%g1
	casxa	[%g1]0x80,%l5,%l2	! %l2 = 000000ff578fe668
!	%l4 = ff0037e1, %l5 = 0000e137, Mem[0000000030001408] = 000037e1 00000000
	stda	%l4,[%i0+%o4]0x81	! Mem[0000000030001408] = ff0037e1 0000e137
!	%l6 = 00000000ffffffff, Mem[0000000010081410] = e2f20000c8ffffff
	stxa	%l6,[%i2+%o5]0x80	! Mem[0000000010081410] = 00000000ffffffff
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = ffffa37b, %l4 = 00000000ff0037e1
	lduha	[%o2+0x000]%asi,%l4	! %l4 = 000000000000ffff

p0_label_183:
!	Mem[000000001008142c] = 00000000, %f10 = 00000000
	lda	[%i2+0x02c]%asi,%f10	! %f10 = 00000000
!	Mem[00000000300c1400] = e13700ff 0000008f 783d37e1 00000000
!	Mem[00000000300c1410] = 00f8ffff 295bdcc7 c7dc5b29 d102b5cd
!	Mem[00000000300c1420] = 49945b77 13978a51 a8921e6e b53b879c
!	Mem[00000000300c1430] = 0e510fed 4fc855b8 965c37e1 f6060000
	ldda	[%i3]ASI_BLK_AIUSL,%f16	! Block Load from 00000000300c1400
!	Mem[0000000030141410] = a8921e6e, %l2 = 000000ff578fe668
	ldswa	[%i5+%o5]0x89,%l2	! %l2 = ffffffffa8921e6e
!	Mem[0000000030081408] = f2e20000, %l0 = 00000000000000c7
	lduba	[%i2+%o4]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000030181410] = c7dc5b29, %l1 = 00000000a19e6944
	lduwa	[%i6+%o5]0x81,%l1	! %l1 = 00000000c7dc5b29
!	Mem[00000000100c1408] = 6e1e92a8d96af809, %l6 = 00000000ffffffff
	ldxa	[%i3+%o4]0x88,%l6	! %l6 = 6e1e92a8d96af809
!	Mem[00000000100c1410] = e1370000, %l0 = 0000000000000000
	ldswa	[%i3+%o5]0x88,%l0	! %l0 = ffffffffe1370000
!	Mem[0000000010081408] = ff0000ff, %l3 = ffffffffffffffff
	lduba	[%i2+%o4]0x80,%l3	! %l3 = 00000000000000ff
!	%l7 = 00000000000000e5, Mem[00000000100c1400] = 6e1e92a885ffdf00
	stxa	%l7,[%i3+%g0]0x80	! Mem[00000000100c1400] = 00000000000000e5
!	Starting 10 instruction Store Burst
!	%f16 = 8f000000 ff0037e1 00000000 e1373d78
!	%f20 = c7dc5b29 fffff800 cdb502d1 295bdcc7
!	%f24 = 518a9713 775b9449 9c873bb5 6e1e92a8
!	%f28 = b855c84f ed0f510e 000006f6 e1375c96
	stda	%f16,[%i5]ASI_BLK_PL	! Block Store to 0000000010141400

p0_label_184:
!	%l2 = ffffffffa8921e6e, Mem[0000000030081400] = 00000000
	stha	%l2,[%i2+%g0]0x81	! Mem[0000000030081400] = 1e6e0000
!	Mem[0000000030041408] = 1dffffff, %l1 = 00000000c7dc5b29
	swapa	[%i1+%o4]0x81,%l1	! %l1 = 000000001dffffff
!	Mem[00000000100c1400] = 00000000, %l3 = 00000000000000ff
	swapa	[%i3+%g0]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000010101410] = 000000ff, %l3 = 0000000000000000
	swapa	[%i4+%o5]0x80,%l3	! %l3 = 00000000000000ff
!	%l4 = 000000000000ffff, Mem[0000000010101438] = 000006f6ff375c96
	stx	%l4,[%i4+0x038]		! Mem[0000000010101438] = 000000000000ffff
!	Mem[0000000010081418] = ff0037e10000e137, %l0 = ffffffffe1370000, %l7 = 00000000000000e5
	add	%i2,0x18,%g1
	casxa	[%g1]0x80,%l0,%l7	! %l7 = ff0037e10000e137
!	%l4 = 0000ffff, %l5 = 0000e137, Mem[0000000030001410] = 965c37e1 f6060000
	stda	%l4,[%i0+%o5]0x81	! Mem[0000000030001410] = 0000ffff 0000e137
!	%f12 = 0e510fed 4fc855b8, %l0 = ffffffffe1370000
!	Mem[0000000030001410] = 0000ffff0000e137
	add	%i0,0x010,%g1
	stda	%f12,[%g1+%l0]ASI_PST8_S ! Mem[0000000030001410] = 0000ffff0000e137
!	Mem[0000000030041408] = 295bdcc7, %l4 = 000000000000ffff
	swapa	[%i1+%o4]0x89,%l4	! %l4 = 00000000295bdcc7
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = 6e1e92a8, %l2 = ffffffffa8921e6e
	ldswa	[%i5+%o5]0x81,%l2	! %l2 = 000000006e1e92a8

p0_label_185:
!	Mem[0000000030141410] = 6e1e92a8, %l2 = 000000006e1e92a8
	ldsha	[%i5+%o5]0x81,%l2	! %l2 = 0000000000006e1e
!	Mem[0000000030101408] = ff0000ff, %l2 = 0000000000006e1e
	lduba	[%i4+%o4]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010181400] = 00000000, %l1 = 000000001dffffff
	ldsba	[%i6+%g0]0x88,%l1	! %l1 = 0000000000000000
	membar	#Sync			! Added by membar checker (45)
!	Mem[0000000010141408] = e1373d78, %l2 = 00000000000000ff
	lduwa	[%i5+%o4]0x88,%l2	! %l2 = 00000000e1373d78
!	Mem[00000000300c1400] = e13700ff, %l4 = 00000000295bdcc7
	lduha	[%i3+%g0]0x81,%l4	! %l4 = 000000000000e137
!	Mem[0000000010081408] = ff0000ff, %l7 = ff0037e10000e137
	lduwa	[%i2+%o4]0x88,%l7	! %l7 = 00000000ff0000ff
!	Mem[00000000201c0000] = ffff851d, %l4 = 000000000000e137
	ldsb	[%o0+0x001],%l4		! %l4 = ffffffffffffffff
!	Mem[0000000010041410] = ffffffff 3b8aacb1, %l2 = e1373d78, %l3 = 000000ff
	ldda	[%i1+%o5]0x80,%l2	! %l2 = 00000000ffffffff 000000003b8aacb1
!	Mem[000000001010141c] = 1dffffff, %l0 = ffffffffe1370000
	ldsw	[%i4+0x01c],%l0		! %l0 = 000000001dffffff
!	Starting 10 instruction Store Burst
!	%l2 = 00000000ffffffff, Mem[0000000010041410] = ffffffff
	stha	%l2,[%i1+%o5]0x88	! Mem[0000000010041410] = ffffffff

!	Check Point 37 for processor 0

	set	p0_check_pt_data_37,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 000000001dffffff
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
	cmp	%l3,%g2			! %l3 = 000000003b8aacb1
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = ffffffffffffffff
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 000000000000e137
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 6e1e92a8d96af809
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 00000000ff0000ff
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = f2e20000 35ade5ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x50],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = e13700ff 783d37e1
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x58],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = ffffff1d 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x60],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = 00000000 1dffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x68],%g3
	std	%f16,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f16 = 8f000000 ff0037e1
	bne	%xcc,p0_freg_check_fail
	mov	0xf16,%g1
	ldx	[%g4+0x70],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = 00000000 e1373d78
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1
	ldx	[%g4+0x78],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = c7dc5b29 fffff800
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1
	ldx	[%g4+0x80],%g3
	std	%f22,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f22 = cdb502d1 295bdcc7
	bne	%xcc,p0_freg_check_fail
	mov	0xf22,%g1
	ldx	[%g4+0x88],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = 518a9713 775b9449
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1
	ldx	[%g4+0x90],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = 9c873bb5 6e1e92a8
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1
	ldx	[%g4+0x98],%g3
	std	%f28,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f28 = b855c84f ed0f510e
	bne	%xcc,p0_freg_check_fail
	mov	0xf28,%g1
	ldx	[%g4+0xa0],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = 000006f6 e1375c96
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 37 completed


p0_label_186:
!	%l6 = 6e1e92a8d96af809, Mem[0000000030141408] = e1373d78
	stwa	%l6,[%i5+%o4]0x81	! Mem[0000000030141408] = d96af809
!	%l0 = 000000001dffffff, Mem[00000000300c1408] = 783d37e1
	stba	%l0,[%i3+%o4]0x81	! Mem[00000000300c1408] = ff3d37e1
!	Mem[0000000010001430] = ffffff1d, %l6 = 6e1e92a8d96af809
	swap	[%i0+0x030],%l6		! %l6 = 00000000ffffff1d
!	%f6  = c7dc5b29 ffffff1d, Mem[0000000010041410] = ffffffff 3b8aacb1
	stda	%f6 ,[%i1+%o5]0x80	! Mem[0000000010041410] = c7dc5b29 ffffff1d
!	%l1 = 0000000000000000, Mem[0000000010001400] = f6ffff1d, %asi = 80
	stba	%l1,[%i0+0x000]%asi	! Mem[0000000010001400] = 00ffff1d
!	%f0  = f2e20000 35ade5ff e13700ff 783d37e1
!	%f4  = ffffff1d 00000000 c7dc5b29 ffffff1d
!	%f8  = 68e68f57 b1cdffff 00000000 1dffffff
!	%f12 = 0e510fed 4fc855b8 965c37e1 f6060000
	stda	%f0,[%i6]ASI_BLK_P	! Block Store to 0000000010181400
!	Mem[000000001010140c] = f20000ff, %l5 = 000000000000e137
	swap	[%i4+0x00c],%l5		! %l5 = 00000000f20000ff
!	%l6 = 00000000ffffff1d, Mem[0000000030141410] = 6e1e92a8412ccb02
	stxa	%l6,[%i5+%o5]0x81	! Mem[0000000030141410] = 00000000ffffff1d
!	Mem[00000000100c141c] = 005fff00, %l6 = ffffff1d, %l7 = ff0000ff
	add	%i3,0x1c,%g1
	casa	[%g1]0x80,%l6,%l7	! %l7 = 00000000005fff00
!	Starting 10 instruction Load Burst
!	Mem[000000001010143c] = 0000ffff, %l0 = 000000001dffffff
	lduw	[%i4+0x03c],%l0		! %l0 = 000000000000ffff

p0_label_187:
!	Mem[00000000100c1408] = 09f86ad9a8921e6e, %l4 = ffffffffffffffff
	ldxa	[%i3+%o4]0x80,%l4	! %l4 = 09f86ad9a8921e6e
!	Mem[0000000010141408] = e1373d78, %l3 = 000000003b8aacb1
	ldsha	[%i5+%o4]0x88,%l3	! %l3 = 0000000000003d78
!	Mem[00000000300c1408] = ff3d37e1, %l6 = 00000000ffffff1d
	ldswa	[%i3+%o4]0x81,%l6	! %l6 = ffffffffff3d37e1
!	Mem[0000000030081410] = 0000e137, %l4 = 09f86ad9a8921e6e
	lduwa	[%i2+%o5]0x89,%l4	! %l4 = 000000000000e137
!	Mem[0000000030181410] = 295bdcc7, %l3 = 0000000000003d78
	ldswa	[%i6+%o5]0x89,%l3	! %l3 = 00000000295bdcc7
!	Mem[0000000030081410] = a3000000 0000e137, %l0 = 0000ffff, %l1 = 00000000
	ldda	[%i2+%o5]0x89,%l0	! %l0 = 000000000000e137 00000000a3000000
!	Mem[0000000010101408] = 00000000 0000e137, %l2 = ffffffff, %l3 = 295bdcc7
	ldda	[%i4+%o4]0x80,%l2	! %l2 = 0000000000000000 000000000000e137
!	Mem[0000000010041400] = ff921e6e, %l2 = 0000000000000000
	ldsba	[%i1+%g0]0x80,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000010101408] = 00000000, %l6 = ffffffffff3d37e1
	lduha	[%i4+%o4]0x80,%l6	! %l6 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f22 = cdb502d1 295bdcc7, %l7 = 00000000005fff00
!	Mem[0000000030141430] = 93ab804652e548c3
	add	%i5,0x030,%g1
	stda	%f22,[%g1+%l7]ASI_PST8_SL ! Mem[0000000030141430] = 93ab804652e548c3

p0_label_188:
!	%l0 = 000000000000e137, Mem[0000000010181400] = f2e20000
	stha	%l0,[%i6+%g0]0x80	! Mem[0000000010181400] = e1370000
!	%l5 = 00000000f20000ff, Mem[00000000218000c0] = 0030d561, %asi = 80
	stha	%l5,[%o3+0x0c0]%asi	! Mem[00000000218000c0] = 00ffd561
!	Mem[00000000100c1408] = d96af809, %l4 = 000000000000e137
	ldstuba	[%i3+%o4]0x88,%l4	! %l4 = 00000009000000ff
!	%l4 = 00000009, %l5 = f20000ff, Mem[0000000030141410] = 00000000 1dffffff
	stda	%l4,[%i5+%o5]0x89	! Mem[0000000030141410] = 00000009 f20000ff
!	Mem[00000000300c1400] = ff0037e1, %l6 = 0000000000000000
	swapa	[%i3+%g0]0x89,%l6	! %l6 = 00000000ff0037e1
!	%l1 = 00000000a3000000, Mem[0000000030081400] = 1e6e00000000001d
	stxa	%l1,[%i2+%g0]0x81	! Mem[0000000030081400] = 00000000a3000000
!	%f18 = 00000000, Mem[0000000030101400] = 6e1e92a8
	sta	%f18,[%i4+%g0]0x89	! Mem[0000000030101400] = 00000000
!	%l6 = ff0037e1, %l7 = 005fff00, Mem[0000000030041408] = ffff0000 ffffffc8
	stda	%l6,[%i1+%o4]0x81	! Mem[0000000030041408] = ff0037e1 005fff00
!	Mem[00000000100c1410] = e1370000, %l4 = 0000000000000009
	swapa	[%i3+%o5]0x88,%l4	! %l4 = 00000000e1370000
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (46)
!	Mem[0000000010181430] = 0e510fed4fc855b8, %l0 = 000000000000e137
	ldx	[%i6+0x030],%l0		! %l0 = 0e510fed4fc855b8

p0_label_189:
!	Mem[0000000030141400] = 1dffffff ffffffff, %l4 = e1370000, %l5 = f20000ff
	ldda	[%i5+%g0]0x81,%l4	! %l4 = 000000001dffffff 00000000ffffffff
!	Mem[0000000010081400] = e13700ff, %l0 = 0e510fed4fc855b8
	ldsba	[%i2+0x000]%asi,%l0	! %l0 = ffffffffffffffe1
!	Mem[0000000010181410] = ffffff1d, %l0 = ffffffffffffffe1
	ldsba	[%i6+%o5]0x80,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000030041408] = ff0037e1 005fff00, %l2 = ffffffff, %l3 = 0000e137
	ldda	[%i1+%o4]0x81,%l2	! %l2 = 00000000ff0037e1 00000000005fff00
!	Mem[0000000010181408] = e13700ff 783d37e1, %l2 = ff0037e1, %l3 = 005fff00
	ldda	[%i6+%o4]0x80,%l2	! %l2 = 00000000e13700ff 00000000783d37e1
!	Mem[0000000030081410] = 0000e137, %l1 = 00000000a3000000
	lduwa	[%i2+%o5]0x89,%l1	! %l1 = 000000000000e137
!	Mem[00000000100c1408] = d96af8ff, %l4 = 000000001dffffff
	ldsha	[%i3+%o4]0x88,%l4	! %l4 = fffffffffffff8ff
!	Mem[0000000030081400] = 00000000, %l6 = 00000000ff0037e1
	lduwa	[%i2+%g0]0x89,%l6	! %l6 = 0000000000000000
!	Mem[00000000211c0000] = ffffa37b, %l4 = fffffffffffff8ff
	ldsb	[%o2+0x001],%l4		! %l4 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	Mem[0000000010181400] = 000037e1, %l5 = 00000000ffffffff
	swapa	[%i6+%g0]0x88,%l5	! %l5 = 00000000000037e1

p0_label_190:
!	Mem[0000000030081408] = 0000e2f2, %l4 = ffffffffffffffff
	swapa	[%i2+%o4]0x81,%l4	! %l4 = 000000000000e2f2
!	Mem[0000000030101408] = ff0000ff, %l4 = 000000000000e2f2
	swapa	[%i4+%o4]0x89,%l4	! %l4 = 00000000ff0000ff
!	%f8  = 68e68f57 b1cdffff, %l1 = 000000000000e137
!	Mem[0000000030101430] = 0000e2ff1dffffff
	add	%i4,0x030,%g1
	stda	%f8,[%g1+%l1]ASI_PST16_S ! Mem[0000000030101430] = 00008f57b1cdffff
!	%l0 = ffffffffffffffff, Mem[00000000100c143a] = 68e68f57
	stb	%l0,[%i3+0x03a]		! Mem[00000000100c1438] = 68e6ff57
!	Mem[0000000010141436] = 4fc855b8, %l6 = 0000000000000000
	ldstub	[%i5+0x036],%l6		! %l6 = 00000055000000ff
!	%l1 = 000000000000e137, Mem[0000000010041400] = ff0000006e1e92ff
	stxa	%l1,[%i1+%g0]0x88	! Mem[0000000010041400] = 000000000000e137
!	%f3  = 783d37e1, Mem[0000000010041414] = ffffff1d
	sta	%f3 ,[%i1+0x014]%asi	! Mem[0000000010041414] = 783d37e1
!	%l7 = 00000000005fff00, Mem[0000000030181400] = ff373d78
	stba	%l7,[%i6+%g0]0x81	! Mem[0000000030181400] = 00373d78
!	%f28 = b855c84f ed0f510e, Mem[0000000030101410] = ffffffff 1dffffff
	stda	%f28,[%i4+%o5]0x81	! Mem[0000000030101410] = b855c84f ed0f510e
!	Starting 10 instruction Load Burst
!	%l2 = 00000000e13700ff, Mem[00000000211c0000] = ffffa37b, %asi = 80
	stha	%l2,[%o2+0x000]%asi	! Mem[00000000211c0000] = 00ffa37b

!	Check Point 38 for processor 0

	set	p0_check_pt_data_38,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = ffffffffffffffff
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 000000000000e137
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 00000000e13700ff
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 00000000783d37e1
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 00000000ff0000ff
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l6,%g2			! %l6 = 0000000000000055
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x38],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = f2e20000 35ade5ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x40],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = e13700ff 783d37e1
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x48],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = ffffff1d 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1

!	Check Point 38 completed


p0_label_191:
!	Mem[00000000300c1408] = ff3d37e1, %l6 = 0000000000000055
	ldswa	[%i3+%o4]0x81,%l6	! %l6 = ffffffffff3d37e1
!	Mem[0000000030081408] = 00000000 ffffffff, %l6 = ff3d37e1, %l7 = 005fff00
	ldda	[%i2+%o4]0x89,%l6	! %l6 = 00000000ffffffff 0000000000000000
!	Mem[00000000300c1408] = ff3d37e100000000, %l0 = ffffffffffffffff
	ldxa	[%i3+%o4]0x81,%l0	! %l0 = ff3d37e100000000
!	Mem[0000000030081410] = 37e10000 000000a3, %l2 = e13700ff, %l3 = 783d37e1
	ldda	[%i2+%o5]0x81,%l2	! %l2 = 0000000037e10000 00000000000000a3
!	Mem[000000001018140c] = 783d37e1, %l4 = 00000000ff0000ff
	ldsw	[%i6+0x00c],%l4		! %l4 = 00000000783d37e1
!	Mem[0000000010181408] = e13700ff, %l2 = 0000000037e10000
	ldsba	[%i6+%o4]0x80,%l2	! %l2 = ffffffffffffffe1
!	Mem[0000000030181408] = ffffffff, %f4  = ffffff1d
	lda	[%i6+%o4]0x89,%f4 	! %f4 = ffffffff
	membar	#Sync			! Added by membar checker (47)
!	Mem[00000000100c1400] = 000000ff 000000e5 fff86ad9 a8921e6e
!	Mem[00000000100c1410] = 09000000 000000a3 d96af809 005fff00
!	Mem[00000000100c1420] = 000000d7 92c80374 3d780000 37e10000
!	Mem[00000000100c1430] = c34866ff 783d4994 68e6ff57 b1cdffff
	ldda	[%i3]ASI_BLK_P,%f0	! Block Load from 00000000100c1400
!	Mem[0000000030001408] = ff0037e1, %l2 = ffffffffffffffe1
	ldswa	[%i0+%o4]0x81,%l2	! %l2 = ffffffffff0037e1
!	Starting 10 instruction Store Burst
!	%f26 = 9c873bb5 6e1e92a8, Mem[0000000030081408] = ffffffff 00000000
	stda	%f26,[%i2+%o4]0x81	! Mem[0000000030081408] = 9c873bb5 6e1e92a8

p0_label_192:
!	Mem[00000000201c0000] = ffff851d, %l0 = ff3d37e100000000
	ldstuba	[%o0+0x000]%asi,%l0	! %l0 = 000000ff000000ff
!	Mem[0000000030101410] = b855c84f, %l0 = 00000000000000ff
	ldstuba	[%i4+%o5]0x81,%l0	! %l0 = 000000b8000000ff
!	Mem[00000000211c0001] = 00ffa37b, %l0 = 00000000000000b8
	ldstub	[%o2+0x001],%l0		! %l0 = 000000ff000000ff
!	%f16 = 8f000000 ff0037e1, Mem[0000000010041400] = 0000e137 00000000
	stda	%f16,[%i1+%g0]0x88	! Mem[0000000010041400] = 8f000000 ff0037e1
!	%l4 = 00000000783d37e1, Mem[0000000010081408] = ff0000ff
	stba	%l4,[%i2+%o4]0x80	! Mem[0000000010081408] = e10000ff
!	Mem[0000000010081430] = c348e552, %l1 = 000000000000e137, %asi = 80
	swapa	[%i2+0x030]%asi,%l1	! %l1 = 00000000c348e552
!	%l7 = 0000000000000000, Mem[0000000010041400] = e13700ff
	stha	%l7,[%i1+%g0]0x80	! Mem[0000000010041400] = 000000ff
!	%f16 = 8f000000, Mem[0000000010001408] = 0000e2ff
	sta	%f16,[%i0+%o4]0x80	! Mem[0000000010001408] = 8f000000
!	%l4 = 00000000783d37e1, Mem[0000000030001400] = ff000000
	stha	%l4,[%i0+%g0]0x81	! Mem[0000000030001400] = 37e10000
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = 00f8ffff, %l2 = ffffffffff0037e1
	lduha	[%i3+%o5]0x81,%l2	! %l2 = 00000000000000f8

p0_label_193:
!	Mem[0000000010181424] = b1cdffff, %l6 = 00000000ffffffff
	lduh	[%i6+0x026],%l6		! %l6 = 000000000000ffff
!	Mem[0000000010181408] = e1373d78ff0037e1, %l2 = 00000000000000f8
	ldxa	[%i6+%o4]0x88,%l2	! %l2 = e1373d78ff0037e1
!	Mem[0000000010101408] = 000000000000e137, %f30 = 000006f6 e1375c96
	ldda	[%i4+%o4]0x80,%f30	! %f30 = 00000000 0000e137
!	Mem[0000000010001428] = 518cfad600000000, %f30 = 00000000 0000e137
	ldda	[%i0+0x028]%asi,%f30	! %f30 = 518cfad6 00000000
!	Mem[0000000030041408] = e13700ff, %l1 = 00000000c348e552
	lduwa	[%i1+%o4]0x89,%l1	! %l1 = 00000000e13700ff
!	Mem[00000000201c0000] = ffff851d, %l1 = 00000000e13700ff
	ldsha	[%o0+0x000]%asi,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000030001408] = e13700ff, %l3 = 00000000000000a3
	lduha	[%i0+%o4]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[00000000211c0000] = 00ffa37b, %l4 = 00000000783d37e1
	ldsb	[%o2+%g0],%l4		! %l4 = 0000000000000000
!	Mem[0000000010001410] = b1ac8a3b00000000, %l3 = 00000000000000ff
	ldxa	[%i0+0x010]%asi,%l3	! %l3 = b1ac8a3b00000000
!	Starting 10 instruction Store Burst
!	%l1 = ffffffffffffffff, Mem[0000000010001408] = 8f000000
	stba	%l1,[%i0+%o4]0x80	! Mem[0000000010001408] = ff000000

p0_label_194:
!	%l2 = e1373d78ff0037e1, Mem[0000000010001410] = b1ac8a3b00000000
	stxa	%l2,[%i0+%o5]0x80	! Mem[0000000010001410] = e1373d78ff0037e1
!	Mem[0000000030041408] = ff0037e1, %l5 = 00000000000037e1
	ldstuba	[%i1+%o4]0x81,%l5	! %l5 = 000000ff000000ff
	membar	#Sync			! Added by membar checker (48)
!	%l2 = e1373d78ff0037e1, Mem[00000000100c1410] = 09000000
	stha	%l2,[%i3+%o5]0x80	! Mem[00000000100c1410] = 37e10000
!	Mem[000000001000142c] = 00000000, %l5 = 00000000000000ff
	swap	[%i0+0x02c],%l5		! %l5 = 0000000000000000
!	%f5  = 000000a3, Mem[0000000030101400] = 00000000
	sta	%f5 ,[%i4+%g0]0x81	! Mem[0000000030101400] = 000000a3
!	%f26 = 9c873bb5, Mem[000000001004140c] = ffe20000
	st	%f26,[%i1+0x00c]	! Mem[000000001004140c] = 9c873bb5
!	%l3 = b1ac8a3b00000000, Mem[0000000030181408] = ffffffff
	stba	%l3,[%i6+%o4]0x89	! Mem[0000000030181408] = ffffff00
!	%f24 = 518a9713 775b9449, %l5 = 0000000000000000
!	Mem[0000000010181408] = e13700ff783d37e1
	add	%i6,0x008,%g1
	stda	%f24,[%g1+%l5]ASI_PST16_P ! Mem[0000000010181408] = e13700ff783d37e1
!	Mem[0000000010181410] = 1dffffff, %l2 = e1373d78ff0037e1
	ldstuba	[%i6+%o5]0x88,%l2	! %l2 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1428] = 3d78000037e10000, %f10 = 3d780000 37e10000
	ldd	[%i3+0x028],%f10	! %f10 = 3d780000 37e10000

p0_label_195:
!	Mem[00000000100c1410] = a30000000000e137, %f20 = c7dc5b29 fffff800
	ldda	[%i3+%o5]0x88,%f20	! %f20 = a3000000 0000e137
!	Mem[00000000300c1410] = 00f8ffff, %l5 = 0000000000000000
	ldsba	[%i3+%o5]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000010041420] = 0000e2ff948a6312, %f2  = fff86ad9 a8921e6e
	ldda	[%i1+0x020]%asi,%f2 	! %f2  = 0000e2ff 948a6312
!	Mem[0000000010041400] = 000000ff, %l2 = 00000000000000ff
	ldsha	[%i1+%g0]0x80,%l2	! %l2 = 0000000000000000
!	Mem[00000000300c1410] = 00f8ffff, %f10 = 3d780000
	lda	[%i3+%o5]0x81,%f10	! %f10 = 00f8ffff
!	Mem[0000000010081434] = 24174994, %l0 = 00000000000000ff
	lduh	[%i2+0x034],%l0		! %l0 = 0000000000002417
!	Mem[0000000030141400] = ffffff1d, %l1 = ffffffffffffffff
	ldswa	[%i5+%g0]0x89,%l1	! %l1 = ffffffffffffff1d
!	Mem[0000000010141400] = e13700ff, %l3 = b1ac8a3b00000000
	ldsha	[%i5+%g0]0x80,%l3	! %l3 = ffffffffffffe137
!	Mem[0000000010081400] = e13700ff783d37e1, %f28 = b855c84f ed0f510e
	ldda	[%i2+%g0]0x80,%f28	! %f28 = e13700ff 783d37e1
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000000000, Mem[0000000010041400] = 000000ff0000008f
	stxa	%l4,[%i1+%g0]0x80	! Mem[0000000010041400] = 0000000000000000

!	Check Point 39 for processor 0

	set	p0_check_pt_data_39,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 0000000000002417
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = ffffffffffffff1d
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 0000000000000000
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = ffffffffffffe137
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
	cmp	%l6,%g2			! %l6 = 000000000000ffff
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = 000000ff 000000e5
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x48],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = 0000e2ff 948a6312
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x50],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 09000000 000000a3
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x58],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = d96af809 005fff00
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x60],%g3
	std	%f8,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f8 = 000000d7 92c80374
	bne	%xcc,p0_freg_check_fail
	mov	0xf08,%g1
	ldx	[%g4+0x68],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = 00f8ffff 37e10000
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x70],%g3
	std	%f12,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f12 = c34866ff 783d4994
	bne	%xcc,p0_freg_check_fail
	mov	0xf12,%g1
	ldx	[%g4+0x78],%g3
	std	%f14,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f14 = 68e6ff57 b1cdffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf14,%g1
	ldx	[%g4+0x80],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = a3000000 0000e137
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1
	ldx	[%g4+0x88],%g3
	std	%f28,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f28 = e13700ff 783d37e1
	bne	%xcc,p0_freg_check_fail
	mov	0xf28,%g1
	ldx	[%g4+0x90],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = 518cfad6 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 39 completed


p0_label_196:
!	%f14 = 68e6ff57, Mem[0000000010041428] = 9c8971bc
	sta	%f14,[%i1+0x028]%asi	! Mem[0000000010041428] = 68e6ff57
!	%l5 = 0000000000000000, Mem[0000000030141400] = ffffff1d
	stha	%l5,[%i5+%g0]0x89	! Mem[0000000030141400] = ffff0000
!	%l3 = ffffffffffffe137, Mem[0000000010101408] = 00000000
	stwa	%l3,[%i4+%o4]0x80	! Mem[0000000010101408] = ffffe137
!	%l5 = 0000000000000000, Mem[0000000010181410] = ffffff1d
	stba	%l5,[%i6+%o5]0x80	! Mem[0000000010181410] = 00ffff1d
!	Mem[0000000030101408] = 0000e2f2, %l5 = 0000000000000000
	swapa	[%i4+%o4]0x89,%l5	! %l5 = 000000000000e2f2
!	%l1 = ffffffffffffff1d, Mem[0000000010101419] = 00000000, %asi = 80
	stba	%l1,[%i4+0x019]%asi	! Mem[0000000010101418] = 001d0000
!	%f8  = 000000d7 92c80374, Mem[0000000010101400] = ff000000 000000f8
	stda	%f8 ,[%i4+%g0]0x80	! Mem[0000000010101400] = 000000d7 92c80374
!	%f4  = 09000000, Mem[0000000030101410] = ff55c84f
	sta	%f4 ,[%i4+%o5]0x81	! Mem[0000000030101410] = 09000000
!	%f28 = e13700ff 783d37e1, %l2 = 0000000000000000
!	Mem[00000000100c1418] = d96af809005fff00
	add	%i3,0x018,%g1
	stda	%f28,[%g1+%l2]ASI_PST8_P ! Mem[00000000100c1418] = d96af809005fff00
!	Starting 10 instruction Load Burst
!	Mem[000000001000141c] = ffffffff, %l6 = 000000000000ffff
	lduw	[%i0+0x01c],%l6		! %l6 = 00000000ffffffff

p0_label_197:
!	Mem[0000000010141400] = e13700ff0000008f, %l1 = ffffffffffffff1d
	ldx	[%i5+%g0],%l1		! %l1 = e13700ff0000008f
!	Mem[0000000010141408] = 783d37e1, %l0 = 0000000000002417
	lduba	[%i5+0x00b]%asi,%l0	! %l0 = 00000000000000e1
!	Mem[000000001008143c] = b1cdffff, %l4 = 0000000000000000
	ldsw	[%i2+0x03c],%l4		! %l4 = ffffffffb1cdffff
!	Mem[00000000300c1408] = e1373dff, %l7 = 0000000000000000
	ldsha	[%i3+%o4]0x89,%l7	! %l7 = 0000000000003dff
!	Mem[0000000010041410] = c7dc5b29, %f26 = 9c873bb5
	lda	[%i1+%o5]0x80,%f26	! %f26 = c7dc5b29
!	%l0 = 00000000000000e1, %l6 = 00000000ffffffff, %l4 = ffffffffb1cdffff
	and	%l0,%l6,%l4		! %l4 = 00000000000000e1
!	Mem[0000000010081400] = e13700ff, %l3 = ffffffffffffe137
	lduha	[%i2+%g0]0x80,%l3	! %l3 = 000000000000e137
!	Mem[000000001000140c] = 1dffffff, %l2 = 0000000000000000
	lduw	[%i0+0x00c],%l2		! %l2 = 000000001dffffff
!	Mem[0000000010181438] = 965c37e1, %l0 = 00000000000000e1
	ldsba	[%i6+0x03b]%asi,%l0	! %l0 = ffffffffffffffe1
!	Starting 10 instruction Store Burst
!	Mem[0000000030001408] = e13700ff, %l1 = e13700ff0000008f
	ldstuba	[%i0+%o4]0x89,%l1	! %l1 = 000000ff000000ff

p0_label_198:
!	%l4 = 00000000000000e1, Mem[0000000030081410] = 37e10000
	stba	%l4,[%i2+%o5]0x81	! Mem[0000000030081410] = e1e10000
!	Mem[0000000030141410] = 00000009, %l4 = 00000000000000e1
	swapa	[%i5+%o5]0x89,%l4	! %l4 = 0000000000000009
!	Mem[0000000010041410] = 295bdcc7, %l6 = 00000000ffffffff
	ldstuba	[%i1+%o5]0x88,%l6	! %l6 = 000000c7000000ff
!	%f0  = 000000ff 000000e5, Mem[0000000010181408] = e13700ff 783d37e1
	stda	%f0 ,[%i6+%o4]0x80	! Mem[0000000010181408] = 000000ff 000000e5
!	Mem[0000000010001400] = 00ffff1d1dffffff, %l3 = 000000000000e137, %l1 = 00000000000000ff
	casxa	[%i0]0x80,%l3,%l1	! %l1 = 00ffff1d1dffffff
!	Mem[0000000010141400] = e13700ff, %l6 = 00000000000000c7
	swapa	[%i5+%g0]0x80,%l6	! %l6 = 00000000e13700ff
!	Mem[0000000030001410] = ffff0000, %l7 = 0000000000003dff
	swapa	[%i0+%o5]0x89,%l7	! %l7 = 00000000ffff0000
!	%l4 = 00000009, %l5 = 0000e2f2, Mem[0000000030181410] = 295bdcc7 1dffffff
	stda	%l4,[%i6+%o5]0x89	! Mem[0000000030181410] = 00000009 0000e2f2
!	%l4 = 00000009, %l5 = 0000e2f2, Mem[0000000010081408] = e10000ff 00000000
	stda	%l4,[%i2+%o4]0x80	! Mem[0000000010081408] = 00000009 0000e2f2
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = 00f8ffff, %f12 = c34866ff
	lda	[%i5+%o5]0x80,%f12	! %f12 = 00f8ffff

p0_label_199:
	membar	#Sync			! Added by membar checker (49)
!	Mem[0000000010141400] = 000000c7 0000008f 783d37e1 00000000
!	Mem[0000000010141410] = 00f8ffff 295bdcc7 c7dc5b29 d102b5cd
!	Mem[0000000010141420] = 49945b77 13978a51 a8921e6e b53b879c
!	Mem[0000000010141430] = 0e510fed 4fc8ffb8 965c37e1 f6060000
	ldda	[%i5]ASI_BLK_PL,%f0	! Block Load from 0000000010141400
!	Mem[00000000218000c0] = 00ffd561, %l4 = 0000000000000009
	lduh	[%o3+0x0c0],%l4		! %l4 = 00000000000000ff
!	Mem[0000000030001408] = e13700ff, %l1 = 00ffff1d1dffffff
	lduha	[%i0+%o4]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010181428] = 00000000, %l4 = 00000000000000ff
	ldsha	[%i6+0x028]%asi,%l4	! %l4 = 0000000000000000
!	Mem[0000000010001408] = 000000ff, %l7 = 00000000ffff0000
	lduwa	[%i0+%o4]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010041408] = ffffffff, %l5 = 000000000000e2f2
	lduha	[%i1+0x008]%asi,%l5	! %l5 = 000000000000ffff
!	Mem[00000000100c1410] = 37e10000, %l7 = 00000000000000ff
	ldsha	[%i3+%o5]0x80,%l7	! %l7 = 00000000000037e1
!	Mem[0000000010181410] = 00ffff1d, %l3 = 000000000000e137
	lduha	[%i6+%o5]0x80,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030101400] = 000000a3 000000ff, %l4 = 00000000, %l5 = 0000ffff
	ldda	[%i4+%g0]0x81,%l4	! %l4 = 00000000000000a3 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l4 = 00000000000000a3, Mem[00000000100c1408] = fff86ad9a8921e6e
	stx	%l4,[%i3+%o4]		! Mem[00000000100c1408] = 00000000000000a3

p0_label_200:
!	Mem[0000000010081410] = 00000000, %l1 = 00000000000000ff
	swapa	[%i2+%o5]0x80,%l1	! %l1 = 0000000000000000
!	%l4 = 000000a3, %l5 = 000000ff, Mem[0000000030001410] = 00003dff 37e10000
	stda	%l4,[%i0+%o5]0x89	! Mem[0000000030001410] = 000000a3 000000ff
!	Mem[0000000010141420] = 49945b77, %l2 = 1dffffff, %l1 = 00000000
	add	%i5,0x20,%g1
	casa	[%g1]0x80,%l2,%l1	! %l1 = 0000000049945b77
!	Mem[0000000030141410] = e1000000, %l1 = 0000000049945b77
	ldstuba	[%i5+%o5]0x81,%l1	! %l1 = 000000e1000000ff
!	%l0 = ffffffffffffffe1, Mem[0000000010101400] = 000000d7
	stha	%l0,[%i4+%g0]0x80	! Mem[0000000010101400] = ffe100d7
	membar	#Sync			! Added by membar checker (50)
!	%l0 = ffffffffffffffe1, Mem[0000000010141400] = c7000000
	stba	%l0,[%i5+%g0]0x88	! Mem[0000000010141400] = c70000e1
!	%f30 = 518cfad6 00000000, Mem[0000000010081420] = 0000ffd3 005f00ff
	std	%f30,[%i2+0x020]	! Mem[0000000010081420] = 518cfad6 00000000
!	%l0 = ffffffffffffffe1, Mem[0000000030181410] = 00000009
	stba	%l0,[%i6+%o5]0x89	! Mem[0000000030181410] = 000000e1
!	%f22 = cdb502d1 295bdcc7, Mem[0000000030081400] = 00000000 a3000000
	stda	%f22,[%i2+%g0]0x81	! Mem[0000000030081400] = cdb502d1 295bdcc7
!	Starting 10 instruction Load Burst
!	Mem[0000000010181428] = 00000000 1dffffff, %l6 = e13700ff, %l7 = 000037e1
	ldda	[%i6+0x028]%asi,%l6	! %l6 = 0000000000000000 000000001dffffff

!	Check Point 40 for processor 0

	set	p0_check_pt_data_40,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = ffffffffffffffe1
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 00000000000000e1
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 000000001dffffff
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 00000000000000a3
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
	cmp	%l7,%g2			! %l7 = 000000001dffffff
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = 8f000000 c7000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x50],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = 00000000 e1373d78
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x58],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = c7dc5b29 fffff800
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x60],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = cdb502d1 295bdcc7
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x68],%g3
	std	%f8,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f8 = 518a9713 775b9449
	bne	%xcc,p0_freg_check_fail
	mov	0xf08,%g1
	ldx	[%g4+0x70],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = 9c873bb5 6e1e92a8
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x78],%g3
	std	%f12,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f12 = b8ffc84f ed0f510e
	bne	%xcc,p0_freg_check_fail
	mov	0xf12,%g1
	ldx	[%g4+0x80],%g3
	std	%f14,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f14 = 000006f6 e1375c96
	bne	%xcc,p0_freg_check_fail
	mov	0xf14,%g1
	ldx	[%g4+0x88],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = c7dc5b29 6e1e92a8
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1

!	Check Point 40 completed


p0_label_201:
!	Mem[0000000030141400] = ffff0000, %l4 = 00000000000000a3
	lduba	[%i5+%g0]0x89,%l4	! %l4 = 0000000000000000
!	Mem[00000000100c1410] = 37e10000000000a3, %l4 = 0000000000000000
	ldxa	[%i3+%o5]0x80,%l4	! %l4 = 37e10000000000a3
!	Mem[0000000010081400] = e13700ff, %l2 = 000000001dffffff
	ldsba	[%i2+%g0]0x80,%l2	! %l2 = ffffffffffffffe1
!	Mem[0000000010141400] = e10000c7 0000008f, %l4 = 000000a3, %l5 = 000000ff
	ldda	[%i5+0x000]%asi,%l4	! %l4 = 00000000e10000c7 000000000000008f
!	Mem[0000000030001410] = 000000ff 000000a3, %l2 = ffffffe1, %l3 = 000000ff
	ldda	[%i0+%o5]0x89,%l2	! %l2 = 00000000000000a3 00000000000000ff
!	Mem[00000000211c0000] = 00ffa37b, %l5 = 000000000000008f
	ldub	[%o2+0x001],%l5		! %l5 = 00000000000000ff
!	Mem[0000000010041410] = ffdc5b29, %l2 = 00000000000000a3
	lduha	[%i1+%o5]0x80,%l2	! %l2 = 000000000000ffdc
!	Mem[0000000010101400] = ffe100d7, %f30 = 518cfad6
	lda	[%i4+%g0]0x80,%f30	! %f30 = ffe100d7
!	Mem[0000000010001410] = 783d37e1, %l2 = 000000000000ffdc
	lduwa	[%i0+%o5]0x88,%l2	! %l2 = 00000000783d37e1
!	Starting 10 instruction Store Burst
!	%f17 = ff0037e1, Mem[00000000300c1400] = 00000000
	sta	%f17,[%i3+%g0]0x89	! Mem[00000000300c1400] = ff0037e1

p0_label_202:
!	%f16 = 8f000000 ff0037e1 00000000 e1373d78
!	%f20 = a3000000 0000e137 cdb502d1 295bdcc7
!	%f24 = 518a9713 775b9449 c7dc5b29 6e1e92a8
!	%f28 = e13700ff 783d37e1 ffe100d7 00000000
	stda	%f16,[%i0]ASI_BLK_PL	! Block Store to 0000000010001400
!	%l1 = 00000000000000e1, Mem[0000000010081430] = 0000e13724174994, %asi = 80
	stxa	%l1,[%i2+0x030]%asi	! Mem[0000000010081430] = 00000000000000e1
!	%l3 = 00000000000000ff, Mem[0000000010101400] = ffe100d792c80374
	stxa	%l3,[%i4+%g0]0x80	! Mem[0000000010101400] = 00000000000000ff
!	%l3 = 00000000000000ff, Mem[0000000010001408] = e1373d78
	stha	%l3,[%i0+%o4]0x88	! Mem[0000000010001408] = e13700ff
	membar	#Sync			! Added by membar checker (51)
!	Mem[0000000010001400] = e13700ff, %l0 = ffffffe1, %l6 = 00000000
	casa	[%i0]0x80,%l0,%l6	! %l6 = 00000000e13700ff
!	%l4 = e10000c7, %l5 = 000000ff, Mem[0000000010001410] = 37e10000 000000a3
	std	%l4,[%i0+%o5]		! Mem[0000000010001410] = e10000c7 000000ff
!	%l0 = ffffffe1, %l1 = 000000e1, Mem[0000000010101400] = 00000000 ff000000
	stda	%l0,[%i4+%g0]0x88	! Mem[0000000010101400] = ffffffe1 000000e1
!	%l0 = ffffffffffffffe1, Mem[0000000030141408] = 09f86ad9
	stwa	%l0,[%i5+%o4]0x89	! Mem[0000000030141408] = ffffffe1
!	%l6 = 00000000e13700ff, Mem[0000000010081408] = 09000000
	stba	%l6,[%i2+%o4]0x88	! Mem[0000000010081408] = 090000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = ffffff00, %l2 = 00000000783d37e1
	ldswa	[%i6+%o4]0x89,%l2	! %l2 = ffffffffffffff00

p0_label_203:
!	Mem[0000000030001410] = a3000000, %l7 = 000000001dffffff
	swapa	[%i0+%o5]0x81,%l7	! %l7 = 00000000a3000000
!	Mem[0000000030141400] = 0000ffff, %l6 = 00000000e13700ff
	lduha	[%i5+%g0]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000030041410] = 00000000, %l6 = 0000000000000000
	lduba	[%i1+%o5]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000030141400] = ffff0000, %l4 = 00000000e10000c7
	ldsha	[%i5+%g0]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000030001410] = ffffff1d, %l3 = 00000000000000ff
	ldswa	[%i0+%o5]0x89,%l3	! %l3 = ffffffffffffff1d
!	Mem[00000000201c0000] = ffff851d, %l6 = 0000000000000000
	ldsba	[%o0+0x001]%asi,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000030101408] = e1373d7800000000, %f30 = ffe100d7 00000000
	ldda	[%i4+%o4]0x89,%f30	! %f30 = e1373d78 00000000
!	Mem[0000000010081438] = 68e68f57, %l4 = 0000000000000000
	ldub	[%i2+0x038],%l4		! %l4 = 0000000000000068
!	Mem[0000000010101400] = ffffffe1, %l4 = 0000000000000068
	lduba	[%i4+%g0]0x88,%l4	! %l4 = 00000000000000e1
!	Starting 10 instruction Store Burst
!	%l1 = 00000000000000e1, Mem[00000000100c143c] = b1cdffff, %asi = 80
	stba	%l1,[%i3+0x03c]%asi	! Mem[00000000100c143c] = e1cdffff

p0_label_204:
!	%l2 = ffffff00, %l3 = ffffff1d, Mem[0000000030141400] = ffff0000 ffffffff
	stda	%l2,[%i5+%g0]0x89	! Mem[0000000030141400] = ffffff00 ffffff1d
!	%f24 = 518a9713 775b9449, Mem[0000000030101408] = 00000000 e1373d78
	stda	%f24,[%i4+%o4]0x89	! Mem[0000000030101408] = 518a9713 775b9449
!	%l0 = ffffffffffffffe1, Mem[0000000030181410] = 0000e2f2000000e1
	stxa	%l0,[%i6+%o5]0x89	! Mem[0000000030181410] = ffffffffffffffe1
!	Mem[00000000211c0001] = 00ffa37b, %l5 = 00000000000000ff
	ldstuba	[%o2+0x001]%asi,%l5	! %l5 = 000000ff000000ff
!	%l3 = ffffffffffffff1d, Mem[0000000030041410] = 00000000
	stha	%l3,[%i1+%o5]0x89	! Mem[0000000030041410] = 0000ff1d
!	%l2 = ffffffffffffff00, Mem[0000000030181410] = ffffffffffffffe1
	stxa	%l2,[%i6+%o5]0x89	! Mem[0000000030181410] = ffffffffffffff00
!	Mem[0000000010081408] = ff000009, %l2 = ffffffffffffff00
	ldstuba	[%i2+%o4]0x80,%l2	! %l2 = 000000ff000000ff
!	Mem[00000000100c1420] = 000000d7, %l1 = 00000000000000e1, %asi = 80
	swapa	[%i3+0x020]%asi,%l1	! %l1 = 00000000000000d7
!	%l2 = 00000000000000ff, Mem[00000000100c1410] = 37e10000000000a3, %asi = 80
	stxa	%l2,[%i3+0x010]%asi	! Mem[00000000100c1410] = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c141c] = 005fff00, %f25 = 775b9449
	lda	[%i3+0x01c]%asi,%f25	! %f25 = 005fff00

p0_label_205:
!	Mem[00000000100c1418] = d96af809, %l3 = ffffffffffffff1d
	ldsb	[%i3+0x019],%l3		! %l3 = 000000000000006a
!	Mem[00000000300c1400] = e13700ff 0000008f ff3d37e1 00000000
!	Mem[00000000300c1410] = 00f8ffff 295bdcc7 c7dc5b29 d102b5cd
!	Mem[00000000300c1420] = 49945b77 13978a51 a8921e6e b53b879c
!	Mem[00000000300c1430] = 0e510fed 4fc855b8 965c37e1 f6060000
	ldda	[%i3]ASI_BLK_S,%f0	! Block Load from 00000000300c1400
!	Mem[0000000010001408] = ff0037e1, %l7 = 00000000a3000000
	ldsba	[%i0+%o4]0x80,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000030141408] = ffffffe1, %f28 = e13700ff
	lda	[%i5+%o4]0x89,%f28	! %f28 = ffffffe1
!	Mem[0000000010081400] = e13700ff, %l5 = 00000000000000ff
	lduwa	[%i2+%g0]0x80,%l5	! %l5 = 00000000e13700ff
!	Mem[0000000010001418] = c7dc5b29, %l0 = ffffffffffffffe1
	ldub	[%i0+0x01b],%l0		! %l0 = 0000000000000029
!	Mem[0000000010181410] = 1dffff00, %l0 = 0000000000000029
	ldswa	[%i6+%o5]0x88,%l0	! %l0 = 000000001dffff00
!	Mem[0000000020800000] = ff009984, %l5 = 00000000e13700ff
	lduh	[%o1+%g0],%l5		! %l5 = 000000000000ff00
!	Mem[00000000100c1410] = 00000000, %f26 = c7dc5b29
	lda	[%i3+%o5]0x88,%f26	! %f26 = 00000000
!	Starting 10 instruction Store Burst
!	Mem[00000000211c0001] = 00ffa37b, %l2 = 00000000000000ff
	ldstub	[%o2+0x001],%l2		! %l2 = 000000ff000000ff

!	Check Point 41 for processor 0

	set	p0_check_pt_data_41,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 000000001dffff00
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l2,%g2			! %l2 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l3,%g2			! %l3 = 000000000000006a
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l4,%g2			! %l4 = 00000000000000e1
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l5,%g2			! %l5 = 000000000000ff00
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l6,%g2			! %l6 = ffffffffffffffff
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l7,%g2			! %l7 = ffffffffffffffff
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x40],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = e13700ff 0000008f
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x48],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = ff3d37e1 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x50],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 00f8ffff 295bdcc7
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x58],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = c7dc5b29 d102b5cd
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x60],%g3
	std	%f8,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f8 = 49945b77 13978a51
	bne	%xcc,p0_freg_check_fail
	mov	0xf08,%g1
	ldx	[%g4+0x68],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = a8921e6e b53b879c
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x70],%g3
	std	%f12,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f12 = 0e510fed 4fc855b8
	bne	%xcc,p0_freg_check_fail
	mov	0xf12,%g1
	ldx	[%g4+0x78],%g3
	std	%f14,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f14 = 965c37e1 f6060000
	bne	%xcc,p0_freg_check_fail
	mov	0xf14,%g1
	ldx	[%g4+0x80],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = 518a9713 005fff00
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1
	ldx	[%g4+0x88],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = 00000000 6e1e92a8
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1
	ldx	[%g4+0x90],%g3
	std	%f28,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f28 = ffffffe1 783d37e1
	bne	%xcc,p0_freg_check_fail
	mov	0xf28,%g1
	ldx	[%g4+0x98],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = e1373d78 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 41 completed


p0_label_206:
!	%f18 = 00000000 e1373d78, %l3 = 000000000000006a
!	Mem[0000000030141410] = ff000000ff0000f2
	add	%i5,0x010,%g1
	stda	%f18,[%g1+%l3]ASI_PST16_SL ! Mem[0000000030141410] = ff0037e1ff000000
!	Mem[0000000030101400] = a3000000, %l0 = 000000001dffff00
	ldstuba	[%i4+%g0]0x89,%l0	! %l0 = 00000000000000ff
!	%l6 = ffffffffffffffff, Mem[0000000010081408] = 090000ff
	stba	%l6,[%i2+%o4]0x88	! Mem[0000000010081408] = 090000ff
!	%l0 = 00000000, %l1 = 000000d7, Mem[0000000010141410] = fffff800 c7dc5b29
	stda	%l0,[%i5+%o5]0x88	! Mem[0000000010141410] = 00000000 000000d7
!	%f2  = ff3d37e1 00000000, %l2 = 00000000000000ff
!	Mem[0000000010001420] = 49945b7713978a51
	add	%i0,0x020,%g1
	stda	%f2,[%g1+%l2]ASI_PST8_PL ! Mem[0000000010001420] = 00000000e1373dff
!	%f2  = ff3d37e1 00000000, Mem[0000000010141410] = 00000000 d7000000
	std	%f2 ,[%i5+%o5]	! Mem[0000000010141410] = ff3d37e1 00000000
!	Mem[0000000010181401] = ffffffff, %l2 = 00000000000000ff
	ldstub	[%i6+0x001],%l2		! %l2 = 000000ff000000ff
!	%f14 = 965c37e1 f6060000, %l1 = 00000000000000d7
!	Mem[0000000010041420] = 0000e2ff948a6312
	add	%i1,0x020,%g1
	stda	%f14,[%g1+%l1]ASI_PST8_PL ! Mem[0000000010041420] = 000006ffe18a5c96
!	%l0 = 0000000000000000, Mem[0000000030041400] = 00000000000078ff
	stxa	%l0,[%i1+%g0]0x89	! Mem[0000000030041400] = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = 00000000, %l6 = ffffffffffffffff
	ldsba	[%i3+%o4]0x80,%l6	! %l6 = 0000000000000000

p0_label_207:
!	Mem[0000000010081408] = 090000ff, %l5 = 000000000000ff00
	lduba	[%i2+%o4]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010081400] = e13700ff, %l3 = 000000000000006a
	ldswa	[%i2+%g0]0x80,%l3	! %l3 = ffffffffe13700ff
!	Mem[0000000030001400] = 37e10000, %f23 = 295bdcc7
	lda	[%i0+%g0]0x81,%f23	! %f23 = 37e10000
!	Mem[0000000010101418] = 001d0000, %l5 = 00000000000000ff
	ldsw	[%i4+0x018],%l5		! %l5 = 00000000001d0000
!	Mem[0000000010141420] = 49945b77, %l4 = 00000000000000e1
	lduw	[%i5+0x020],%l4		! %l4 = 0000000049945b77
!	Mem[0000000030141408] = 00000000ffffffe1, %f4  = 00f8ffff 295bdcc7
	ldda	[%i5+%o4]0x89,%f4 	! %f4  = 00000000 ffffffe1
!	Mem[0000000030001400] = 37e10000, %l3 = ffffffffe13700ff
	lduwa	[%i0+%g0]0x81,%l3	! %l3 = 0000000037e10000
!	Mem[0000000010041410] = e1373d78295bdcff, %f28 = ffffffe1 783d37e1
	ldda	[%i1+%o5]0x88,%f28	! %f28 = e1373d78 295bdcff
!	Mem[0000000010041400] = 00000000, %f27 = 6e1e92a8
	lda	[%i1+%g0]0x88,%f27	! %f27 = 00000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010081410] = 000000ff, %l5 = 00000000001d0000
	swapa	[%i2+%o5]0x80,%l5	! %l5 = 00000000000000ff

p0_label_208:
!	%l1 = 00000000000000d7, Mem[0000000030001408] = ff0037e1
	stha	%l1,[%i0+%o4]0x81	! Mem[0000000030001408] = 00d737e1
!	Mem[00000000100c1429] = 3d780000, %l3 = 0000000037e10000
	ldstub	[%i3+0x029],%l3		! %l3 = 00000078000000ff
!	%l0 = 0000000000000000, Mem[0000000030041400] = 00000000
	stba	%l0,[%i1+%g0]0x81	! Mem[0000000030041400] = 00000000
!	Mem[0000000010101400] = ffffffe1, %l1 = 00000000000000d7
	ldstuba	[%i4+%g0]0x88,%l1	! %l1 = 000000e1000000ff
!	Mem[0000000010141400] = e10000c7, %l1 = 000000e1, %l3 = 00000078
	casa	[%i5]0x80,%l1,%l3	! %l3 = 00000000e10000c7
!	%l1 = 00000000000000e1, Mem[0000000010181408] = 000000ff000000e5, %asi = 80
	stxa	%l1,[%i6+0x008]%asi	! Mem[0000000010181408] = 00000000000000e1
!	%l2 = 00000000000000ff, Mem[0000000030001400] = 0000e137
	stwa	%l2,[%i0+%g0]0x89	! Mem[0000000030001400] = 000000ff
!	%l6 = 0000000000000000, Mem[0000000030141408] = ffffffe1
	stba	%l6,[%i5+%o4]0x89	! Mem[0000000030141408] = ffffff00
!	%l7 = ffffffffffffffff, Mem[0000000030041408] = e13700ff
	stba	%l7,[%i1+%o4]0x89	! Mem[0000000030041408] = e13700ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030081410] = 0000e1e1, %l5 = 00000000000000ff
	ldsba	[%i2+%o5]0x89,%l5	! %l5 = ffffffffffffffe1

p0_label_209:
!	Mem[00000000100c1410] = 00000000, %l6 = 0000000000000000
	lduwa	[%i3+%o5]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000010101408] = 37e1ffff, %l6 = 0000000000000000
	ldsba	[%i4+%o4]0x88,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010181400] = ffffffff, %l3 = 00000000e10000c7
	lduha	[%i6+%g0]0x88,%l3	! %l3 = 000000000000ffff
!	Mem[0000000030001400] = 000000ff, %l7 = ffffffffffffffff
	lduha	[%i0+%g0]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010181410] = 1dffff00, %l3 = 000000000000ffff
	ldsba	[%i6+%o5]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000010081430] = 00000000000000e1, %f18 = 00000000 e1373d78
	ldd	[%i2+0x030],%f18	! %f18 = 00000000 000000e1
!	Mem[0000000010141400] = e10000c7, %l4 = 0000000049945b77
	lduha	[%i5+%g0]0x80,%l4	! %l4 = 000000000000e100
!	Mem[0000000010041434] = 1dffffff, %l3 = 0000000000000000
	ldsh	[%i1+0x034],%l3		! %l3 = 0000000000001dff
!	Mem[0000000010181400] = ffffffff, %f5  = ffffffe1
	lda	[%i6+%g0]0x80,%f5 	! %f5 = ffffffff
!	Starting 10 instruction Store Burst
!	%l0 = 0000000000000000, Mem[0000000010181420] = 68e68f57b1cdffff
	stx	%l0,[%i6+0x020]		! Mem[0000000010181420] = 0000000000000000

p0_label_210:
!	%l1 = 00000000000000e1, Mem[0000000010041410] = ffdc5b29
	stba	%l1,[%i1+%o5]0x80	! Mem[0000000010041410] = e1dc5b29
!	%l0 = 00000000, %l1 = 000000e1, Mem[0000000010081408] = 090000ff f2e20000
	stda	%l0,[%i2+%o4]0x88	! Mem[0000000010081408] = 00000000 000000e1
!	%f22 = cdb502d1 37e10000, Mem[0000000010181408] = 00000000 000000e1
	stda	%f22,[%i6+%o4]0x80	! Mem[0000000010181408] = cdb502d1 37e10000
!	%f16 = 8f000000 ff0037e1, Mem[0000000010141408] = e1373d78 00000000
	stda	%f16,[%i5+%o4]0x88	! Mem[0000000010141408] = 8f000000 ff0037e1
!	Mem[0000000030141410] = e13700ff, %l0 = 0000000000000000
	ldstuba	[%i5+%o5]0x89,%l0	! %l0 = 000000ff000000ff
!	%f4  = 00000000, Mem[0000000010181400] = ffffffff
	sta	%f4 ,[%i6+%g0]0x88	! Mem[0000000010181400] = 00000000
!	%l4 = 000000000000e100, Mem[0000000010041414] = 783d37e1
	stw	%l4,[%i1+0x014]		! Mem[0000000010041414] = 0000e100
!	Mem[0000000030081400] = cdb502d1, %l3 = 0000000000001dff
	ldstuba	[%i2+%g0]0x81,%l3	! %l3 = 000000cd000000ff
!	%l2 = 00000000000000ff, Mem[0000000030101408] = 518a9713775b9449
	stxa	%l2,[%i4+%o4]0x89	! Mem[0000000030101408] = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = 00000000, %l6 = ffffffffffffffff
	lduha	[%i3+%o5]0x80,%l6	! %l6 = 0000000000000000

!	Check Point 42 for processor 0

	set	p0_check_pt_data_42,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 00000000000000e1
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 00000000000000cd
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 000000000000e100
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = ffffffffffffffe1
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
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 00000000 ffffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x50],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = 00000000 000000e1
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1
	ldx	[%g4+0x58],%g3
	std	%f22,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f22 = cdb502d1 37e10000
	bne	%xcc,p0_freg_check_fail
	mov	0xf22,%g1
	ldx	[%g4+0x60],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = 00000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1
	ldx	[%g4+0x68],%g3
	std	%f28,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f28 = e1373d78 295bdcff
	bne	%xcc,p0_freg_check_fail
	mov	0xf28,%g1

!	Check Point 42 completed


p0_label_211:
!	Mem[0000000030181410] = ffffff00, %l1 = 00000000000000e1
	lduwa	[%i6+%o5]0x89,%l1	! %l1 = 00000000ffffff00
!	Mem[0000000020800000] = ff009984, %l3 = 00000000000000cd
	ldsh	[%o1+%g0],%l3		! %l3 = ffffffffffffff00
!	%l0 = 000000ff, %l1 = ffffff00, Mem[0000000010001408] = ff0037e1 00000000
	stda	%l0,[%i0+%o4]0x80	! Mem[0000000010001408] = 000000ff ffffff00
!	Mem[0000000030141400] = 00ffffff, %l0 = 00000000000000ff
	lduba	[%i5+%g0]0x81,%l0	! %l0 = 0000000000000000
!	Mem[00000000300c1410] = fffff800, %l3 = ffffffffffffff00
	lduwa	[%i3+%o5]0x89,%l3	! %l3 = 00000000fffff800
!	Mem[00000000100c1410] = 00000000, %l3 = 00000000fffff800
	lduha	[%i3+%o5]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000010101408] = ffffe1370000e137, %f12 = 0e510fed 4fc855b8
	ldda	[%i4+%o4]0x80,%f12	! %f12 = ffffe137 0000e137
!	Mem[0000000010101408] = 37e1ffff, %l7 = 00000000000000ff
	lduwa	[%i4+%o4]0x88,%l7	! %l7 = 0000000037e1ffff
!	Mem[0000000030101408] = 000000ff, %l6 = 0000000000000000
	lduha	[%i4+%o4]0x89,%l6	! %l6 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000010041410] = 295bdce1, %l2 = 00000000000000ff
	swapa	[%i1+%o5]0x88,%l2	! %l2 = 00000000295bdce1

p0_label_212:
!	%l2 = 00000000295bdce1, Mem[0000000010081400] = e1373d78ff0037e1
	stxa	%l2,[%i2+%g0]0x88	! Mem[0000000010081400] = 00000000295bdce1
!	%l7 = 0000000037e1ffff, Mem[0000000021800040] = ffff4289
	sth	%l7,[%o3+0x040]		! Mem[0000000021800040] = ffff4289
!	Mem[0000000010181400] = 00000000, %l2 = 00000000295bdce1
	ldstuba	[%i6+%g0]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[00000000201c0001] = ffff851d, %l6 = 00000000000000ff
	ldstub	[%o0+0x001],%l6		! %l6 = 000000ff000000ff
!	%l3 = 0000000000000000, Mem[0000000030141400] = ffffff00
	stba	%l3,[%i5+%g0]0x89	! Mem[0000000030141400] = ffffff00
!	Mem[0000000010041420] = 000006ffe18a5c96, %l1 = 00000000ffffff00, %l5 = ffffffffffffffe1
	add	%i1,0x20,%g1
	casxa	[%g1]0x80,%l1,%l5	! %l5 = 000006ffe18a5c96
!	%f16 = 8f000000, Mem[0000000030181410] = ffffff00
	sta	%f16,[%i6+%o5]0x89	! Mem[0000000030181410] = 8f000000
!	%f16 = 8f000000 ff0037e1, Mem[0000000030041410] = 0000ff1d 00000000
	stda	%f16,[%i1+%o5]0x89	! Mem[0000000030041410] = 8f000000 ff0037e1
!	%f0  = e13700ff 0000008f, Mem[0000000010041400] = 00000000 00000000
	stda	%f0 ,[%i1+%g0]0x80	! Mem[0000000010041400] = e13700ff 0000008f
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = 00000000, %l0 = 0000000000000000
	ldsba	[%i4+%o5]0x80,%l0	! %l0 = 0000000000000000

p0_label_213:
!	Mem[0000000030081410] = 0000e1e1, %l4 = 000000000000e100
	ldsba	[%i2+%o5]0x89,%l4	! %l4 = ffffffffffffffe1
!	Mem[0000000030141408] = 00ffffff00000000, %l2 = 0000000000000000
	ldxa	[%i5+%o4]0x81,%l2	! %l2 = 00ffffff00000000
!	Mem[0000000010041410] = ff000000 0000e100, %l6 = 000000ff, %l7 = 37e1ffff
	ldda	[%i1+%o5]0x80,%l6	! %l6 = 00000000ff000000 000000000000e100
!	Mem[0000000030181408] = ffffff00, %f21 = 0000e137
	lda	[%i6+%o4]0x89,%f21	! %f21 = ffffff00
!	Mem[00000000100c1430] = c34866ff, %l1 = 00000000ffffff00
	ldswa	[%i3+0x030]%asi,%l1	! %l1 = ffffffffc34866ff
!	Mem[0000000010141410] = ff3d37e1, %f1  = 0000008f
	lda	[%i5+%o5]0x80,%f1 	! %f1 = ff3d37e1
!	Mem[0000000030041410] = e13700ff, %l6 = 00000000ff000000
	ldsha	[%i1+%o5]0x81,%l6	! %l6 = ffffffffffffe137
!	Mem[0000000030041410] = 8f000000ff0037e1, %l1 = ffffffffc34866ff
	ldxa	[%i1+%o5]0x89,%l1	! %l1 = 8f000000ff0037e1
!	Mem[00000000100c1404] = 000000e5, %l5 = 000006ffe18a5c96
	lduba	[%i3+0x004]%asi,%l5	! %l5 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f20 = a3000000, Mem[0000000010081408] = 00000000
	sta	%f20,[%i2+%o4]0x88	! Mem[0000000010081408] = a3000000

p0_label_214:
!	Mem[00000000211c0000] = 00ffa37b, %l0 = 0000000000000000
	ldstuba	[%o2+0x000]%asi,%l0	! %l0 = 00000000000000ff
!	%l6 = ffffffffffffe137, Mem[0000000010041408] = ffffffff
	stha	%l6,[%i1+%o4]0x88	! Mem[0000000010041408] = ffffe137
!	Mem[0000000010141420] = 49945b77 13978a51, %l2 = 00000000, %l3 = 00000000
	ldd	[%i5+0x020],%l2		! %l2 = 0000000049945b77 0000000013978a51
!	Mem[0000000010181400] = 000000ff, %l0 = 0000000000000000
	swapa	[%i6+%g0]0x88,%l0	! %l0 = 00000000000000ff
!	%f14 = 965c37e1 f6060000, %l4 = ffffffffffffffe1
!	Mem[0000000010081438] = 68e68f57b1cdffff
	add	%i2,0x038,%g1
	stda	%f14,[%g1+%l4]ASI_PST8_P ! Mem[0000000010081438] = 965c3757b1cdff00
!	%l6 = ffffffffffffe137, Mem[000000001000140c] = ffffff00, %asi = 80
	stwa	%l6,[%i0+0x00c]%asi	! Mem[000000001000140c] = ffffe137
!	%l6 = ffffffffffffe137, Mem[0000000010001400] = ff0037e1
	stba	%l6,[%i0+%g0]0x88	! Mem[0000000010001400] = ff003737
!	%l4 = ffffffe1, %l5 = 00000000, Mem[0000000030081410] = e1e10000 000000a3
	stda	%l4,[%i2+%o5]0x81	! Mem[0000000030081410] = ffffffe1 00000000
!	Mem[0000000030081410] = ffffffe1, %l2 = 0000000049945b77
	ldstuba	[%i2+%o5]0x81,%l2	! %l2 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = 373700ff, %l2 = 00000000000000ff
	ldswa	[%i0+%g0]0x80,%l2	! %l2 = 00000000373700ff

p0_label_215:
!	Mem[0000000010041408] = ffffe137, %l6 = ffffffffffffe137
	ldsba	[%i1+%o4]0x88,%l6	! %l6 = 0000000000000037
!	Mem[0000000030001408] = 00d737e1, %l1 = 8f000000ff0037e1
	lduha	[%i0+%o4]0x81,%l1	! %l1 = 00000000000000d7
!	Mem[00000000300c1408] = ff3d37e1, %l1 = 00000000000000d7
	ldsha	[%i3+%o4]0x81,%l1	! %l1 = ffffffffffffff3d
!	Mem[0000000010041408] = ffffe137, %l0 = 00000000000000ff
	lduwa	[%i1+%o4]0x88,%l0	! %l0 = 00000000ffffe137
!	Mem[0000000010101410] = 00000000, %l3 = 0000000013978a51
	lduha	[%i4+%o5]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000030181408] = ffffffff ffffff00, %l2 = 373700ff, %l3 = 00000000
	ldda	[%i6+%o4]0x89,%l2	! %l2 = 00000000ffffff00 00000000ffffffff
!	Mem[0000000010141408] = e13700ff, %l3 = 00000000ffffffff
	ldswa	[%i5+%o4]0x80,%l3	! %l3 = ffffffffe13700ff
!	Mem[00000000100c1400] = e5000000 ff000000, %l2 = ffffff00, %l3 = e13700ff
	ldda	[%i3+%g0]0x88,%l2	! %l2 = 00000000ff000000 00000000e5000000
!	Mem[0000000030181400] = 783d3700, %l5 = 0000000000000000
	lduha	[%i6+%g0]0x89,%l5	! %l5 = 0000000000003700
!	Starting 10 instruction Store Burst
!	%l1 = ffffffffffffff3d, Mem[000000001014142e] = b53b879c
	stb	%l1,[%i5+0x02e]		! Mem[000000001014142c] = b53b3d9c

!	Check Point 43 for processor 0

	set	p0_check_pt_data_43,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 00000000ffffe137
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = ffffffffffffff3d
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 00000000ff000000
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 00000000e5000000
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = ffffffffffffffe1
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 0000000000003700
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 0000000000000037
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 000000000000e100
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = e13700ff ff3d37e1
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x50],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = ff3d37e1 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x58],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = c7dc5b29 d102b5cd
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x60],%g3
	std	%f12,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f12 = ffffe137 0000e137
	bne	%xcc,p0_freg_check_fail
	mov	0xf12,%g1
	ldx	[%g4+0x68],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = a3000000 ffffff00
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1

!	Check Point 43 completed


p0_label_216:
!	%l4 = ffffffffffffffe1, Mem[0000000010041410] = 00e10000000000ff
	stxa	%l4,[%i1+%o5]0x88	! Mem[0000000010041410] = ffffffffffffffe1
!	Mem[0000000030181408] = 00ffffff, %l5 = 0000000000003700
	swapa	[%i6+%o4]0x81,%l5	! %l5 = 0000000000ffffff
!	%l3 = 00000000e5000000, Mem[0000000010141410] = e1373dff
	stwa	%l3,[%i5+%o5]0x88	! Mem[0000000010141410] = e5000000
!	%f1  = ff3d37e1, Mem[0000000030181400] = 783d3700
	sta	%f1 ,[%i6+%g0]0x89	! Mem[0000000030181400] = ff3d37e1
!	%f30 = e1373d78 00000000, Mem[0000000030181410] = 8f000000 ffffffff
	stda	%f30,[%i6+%o5]0x89	! Mem[0000000030181410] = e1373d78 00000000
!	%l0 = 00000000ffffe137, Mem[0000000010001400] = 8f000000ff003737
	stxa	%l0,[%i0+%g0]0x88	! Mem[0000000010001400] = 00000000ffffe137
!	Mem[0000000030181410] = 00000000, %l3 = 00000000e5000000
	swapa	[%i6+%o5]0x89,%l3	! %l3 = 0000000000000000
!	%l5 = 0000000000ffffff, immd = fffffffffffff86b, %l1 = ffffffffffffff3d
	sdivx	%l5,-0x795,%l1		! %l1 = ffffffffffffde3d
!	Mem[0000000030041410] = ff0037e1, %l4 = ffffffffffffffe1
	ldstuba	[%i1+%o5]0x89,%l4	! %l4 = 000000e1000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181438] = 965c37e1f6060000, %f10 = a8921e6e b53b879c
	ldd	[%i6+0x038],%f10	! %f10 = 965c37e1 f6060000

p0_label_217:
!	Mem[0000000010181410] = 000000001dffff00, %f4  = 00000000 ffffffff
	ldda	[%i6+%o5]0x88,%f4 	! %f4  = 00000000 1dffff00
!	Mem[00000000100c1408] = 00000000, %l7 = 000000000000e100
	ldswa	[%i3+%o4]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000030181400] = ff3d37e1, %l0 = 00000000ffffe137
	lduba	[%i6+%g0]0x89,%l0	! %l0 = 00000000000000e1
!	Mem[0000000030181408] = 00370000, %l4 = 00000000000000e1
	ldswa	[%i6+%o4]0x89,%l4	! %l4 = 0000000000370000
!	Mem[0000000030181410] = e5000000, %l6 = 0000000000000037
	lduha	[%i6+%o5]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000030101410] = 00000009, %l0 = 00000000000000e1
	lduwa	[%i4+%o5]0x89,%l0	! %l0 = 0000000000000009
!	Mem[0000000030041400] = 0000000000000000, %l5 = 0000000000ffffff
	ldxa	[%i1+%g0]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000010181434] = 4fc855b8, %f0  = e13700ff
	lda	[%i6+0x034]%asi,%f0 	! %f0 = 4fc855b8
!	Mem[0000000010001408] = 37e1ffffff000000, %f20 = a3000000 ffffff00
	ldda	[%i0+%o4]0x88,%f20	! %f20 = 37e1ffff ff000000
!	Starting 10 instruction Store Burst
!	%f0  = 4fc855b8 ff3d37e1, %l1 = ffffffffffffde3d
!	Mem[0000000010141420] = 49945b7713978a51
	add	%i5,0x020,%g1
	stda	%f0,[%g1+%l1]ASI_PST8_P ! Mem[0000000010141420] = 499455b8ff3d8ae1

p0_label_218:
!	%f12 = ffffe137 0000e137, Mem[0000000030181400] = e1373dff 00000000
	stda	%f12,[%i6+%g0]0x81	! Mem[0000000030181400] = ffffe137 0000e137
!	%l6 = 0000000000000000, Mem[0000000010181408] = cdb502d1
	stba	%l6,[%i6+%o4]0x80	! Mem[0000000010181408] = 00b502d1
!	%l7 = 0000000000000000, Mem[0000000010081410] = ffffffff00001d00
	stxa	%l7,[%i2+%o5]0x88	! Mem[0000000010081410] = 0000000000000000
!	%l5 = 0000000000000000, Mem[0000000030001400] = ff000000
	stwa	%l5,[%i0+%g0]0x81	! Mem[0000000030001400] = 00000000
!	%l1 = ffffffffffffde3d, Mem[0000000030181410] = e5000000
	stba	%l1,[%i6+%o5]0x89	! Mem[0000000030181410] = e500003d
!	Mem[00000000100c1433] = c34866ff, %l7 = 0000000000000000
	ldstub	[%i3+0x033],%l7		! %l7 = 000000ff000000ff
!	Mem[0000000030001408] = 00d737e1, %l1 = ffffffffffffde3d
	swapa	[%i0+%o4]0x81,%l1	! %l1 = 0000000000d737e1
!	Mem[0000000020800040] = ffffb8ec, %l2 = 00000000ff000000
	ldstub	[%o1+0x040],%l2		! %l2 = 000000ff000000ff
!	Mem[0000000010141410] = 000000e5, %l7 = 00000000000000ff
	ldstuba	[%i5+%o5]0x80,%l7	! %l7 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = 37e1ffff, %l6 = 0000000000000000
	lduha	[%i4+%o4]0x88,%l6	! %l6 = 000000000000ffff

p0_label_219:
!	Mem[00000000300c1408] = ff3d37e100000000, %f28 = e1373d78 295bdcff
	ldda	[%i3+%o4]0x81,%f28	! %f28 = ff3d37e1 00000000
!	Mem[0000000030001410] = ffffff1d, %l6 = 000000000000ffff
	ldswa	[%i0+%o5]0x89,%l6	! %l6 = ffffffffffffff1d
!	Code Fragment 4
p0_fragment_6:
!	%l0 = 0000000000000009
	setx	0x19cb010fcf57227c,%g7,%l0 ! %l0 = 19cb010fcf57227c
!	%l1 = 0000000000d737e1
	setx	0xa861ffefc6e7a7bd,%g7,%l1 ! %l1 = a861ffefc6e7a7bd
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 19cb010fcf57227c
	setx	0x0c9cd08fc134af67,%g7,%l0 ! %l0 = 0c9cd08fc134af67
!	%l1 = a861ffefc6e7a7bd
	setx	0x5635b07f8287a946,%g7,%l1 ! %l1 = 5635b07f8287a946
!	Mem[0000000010081410] = 0000000000000000, %l4 = 0000000000370000
	ldxa	[%i2+%o5]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000010181408] = 00b502d1, %l2 = 00000000000000ff
	ldswa	[%i6+%o4]0x80,%l2	! %l2 = 0000000000b502d1
!	Mem[0000000030081408] = b53b879c, %f19 = 000000e1
	lda	[%i2+%o4]0x89,%f19	! %f19 = b53b879c
!	Mem[0000000030141410] = ff0037e1 ff000000, %l6 = ffffff1d, %l7 = 00000000
	ldda	[%i5+%o5]0x81,%l6	! %l6 = 00000000ff0037e1 00000000ff000000
!	Mem[0000000010101438] = 00000000, %l6 = 00000000ff0037e1
	lduh	[%i4+0x03a],%l6		! %l6 = 0000000000000000
!	Mem[0000000010041414] = ffffffff, %f31 = 00000000
	ld	[%i1+0x014],%f31	! %f31 = ffffffff
!	Starting 10 instruction Store Burst
!	%l7 = 00000000ff000000, Mem[0000000030101408] = 000000ff
	stha	%l7,[%i4+%o4]0x89	! Mem[0000000030101408] = 00000000

p0_label_220:
!	%l2 = 0000000000b502d1, Mem[0000000010181400] = 00000000
	stha	%l2,[%i6+%g0]0x80	! Mem[0000000010181400] = 02d10000
!	%l5 = 0000000000000000, Mem[0000000030181408] = 00003700
	stba	%l5,[%i6+%o4]0x81	! Mem[0000000030181408] = 00003700
!	%l4 = 00000000, %l5 = 00000000, Mem[0000000010141408] = e13700ff 0000008f
	stda	%l4,[%i5+%o4]0x80	! Mem[0000000010141408] = 00000000 00000000
!	%l4 = 00000000, %l5 = 00000000, Mem[0000000010101400] = ffffffff e1000000
	std	%l4,[%i4+%g0]		! Mem[0000000010101400] = 00000000 00000000
!	Mem[00000000300c1400] = ff0037e1, %l4 = 0000000000000000
	ldstuba	[%i3+%g0]0x89,%l4	! %l4 = 000000e1000000ff
!	%l0 = 0c9cd08fc134af67, Mem[0000000010101400] = 00000000, %asi = 80
	stha	%l0,[%i4+0x000]%asi	! Mem[0000000010101400] = af670000
!	Mem[0000000010141420] = 499455b8, %l0 = 0c9cd08fc134af67
	swap	[%i5+0x020],%l0		! %l0 = 00000000499455b8
!	%l0 = 00000000499455b8, Mem[0000000030141408] = 00ffffff
	stba	%l0,[%i5+%o4]0x81	! Mem[0000000030141408] = b8ffffff
!	%f21 = ff000000, Mem[00000000100c1408] = 00000000
	sta	%f21,[%i3+%o4]0x88	! Mem[00000000100c1408] = ff000000
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = ff3700ff0000008f, %l3 = 0000000000000000
	ldxa	[%i3+%g0]0x81,%l3	! %l3 = ff3700ff0000008f

!	Check Point 44 for processor 0

	set	p0_check_pt_data_44,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 00000000499455b8
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 5635b07f8287a946
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 0000000000b502d1
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = ff3700ff0000008f
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 00000000000000e1
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
	cmp	%l7,%g2			! %l7 = 00000000ff000000
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = 4fc855b8 ff3d37e1
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x50],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 00000000 1dffff00
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x58],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = c7dc5b29 d102b5cd
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x60],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = 965c37e1 f6060000
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x68],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = 00000000 b53b879c
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1
	ldx	[%g4+0x70],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = 37e1ffff ff000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1
	ldx	[%g4+0x78],%g3
	std	%f28,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f28 = ff3d37e1 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf28,%g1
	ldx	[%g4+0x80],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = e1373d78 ffffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 44 completed


p0_label_221:
!	Mem[00000000300c1410] = 00f8ffff, %l4 = 00000000000000e1
	lduwa	[%i3+%o5]0x81,%l4	! %l4 = 0000000000f8ffff
!	Mem[00000000218001c0] = 00d36d36, %l4 = 0000000000f8ffff
	lduh	[%o3+0x1c0],%l4		! %l4 = 00000000000000d3
!	Mem[0000000030081408] = b53b879c, %l3 = ff3700ff0000008f
	swapa	[%i2+%o4]0x89,%l3	! %l3 = 00000000b53b879c
!	Mem[0000000010081408] = 000000a3 e1000000, %l6 = 00000000, %l7 = ff000000
	ldda	[%i2+%o4]0x80,%l6	! %l6 = 00000000000000a3 00000000e1000000
!	Mem[0000000030181400] = 37e1ffff, %l7 = 00000000e1000000
	ldswa	[%i6+%g0]0x89,%l7	! %l7 = 0000000037e1ffff
!	Mem[0000000020800040] = ffffb8ec, %l7 = 0000000037e1ffff
	ldsb	[%o1+0x041],%l7		! %l7 = ffffffffffffffff
!	Mem[0000000030081400] = ffb502d1, %l4 = 00000000000000d3
	ldswa	[%i2+%g0]0x81,%l4	! %l4 = ffffffffffb502d1
!	Mem[00000000100c1408] = 000000ff, %l1 = 5635b07f8287a946
	ldswa	[%i3+%o4]0x80,%l1	! %l1 = 00000000000000ff
!	Mem[00000000100c1410] = ff000000 00000000, %l4 = ffb502d1, %l5 = 00000000
	ldda	[%i3+%o5]0x88,%l4	! %l4 = 0000000000000000 00000000ff000000
!	Starting 10 instruction Store Burst
!	%l2 = 0000000000b502d1, Mem[00000000100c1408] = 000000ff
	stba	%l2,[%i3+%o4]0x80	! Mem[00000000100c1408] = d10000ff

p0_label_222:
!	%l1 = 00000000000000ff, Mem[0000000010141408] = 00000000
	stha	%l1,[%i5+%o4]0x80	! Mem[0000000010141408] = 00ff0000
!	%f27 = 00000000, Mem[00000000100c143c] = e1cdffff
	st	%f27,[%i3+0x03c]	! Mem[00000000100c143c] = 00000000
	membar	#Sync			! Added by membar checker (52)
!	%l6 = 000000a3, %l7 = ffffffff, Mem[00000000300c1400] = ff0037ff 8f000000
	stda	%l6,[%i3+%g0]0x89	! Mem[00000000300c1400] = 000000a3 ffffffff
!	%l3 = 00000000b53b879c, Mem[0000000030041410] = 8f000000ff0037ff
	stxa	%l3,[%i1+%o5]0x89	! Mem[0000000030041410] = 00000000b53b879c
!	%l1 = 00000000000000ff, Mem[0000000010001400] = 37e1ffff00000000
	stxa	%l1,[%i0+%g0]0x80	! Mem[0000000010001400] = 00000000000000ff
!	Mem[00000000100c1400] = 000000ff, %l0 = 00000000499455b8
	ldstuba	[%i3+%g0]0x80,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010001400] = 00000000, %l6 = 00000000000000a3
	swapa	[%i0+%g0]0x88,%l6	! %l6 = 0000000000000000
!	%l7 = ffffffffffffffff, Mem[00000000201c0000] = ffff851d
	stb	%l7,[%o0+%g0]		! Mem[00000000201c0000] = ffff851d
!	%l4 = 0000000000000000, Mem[0000000030081400] = d102b5ff
	stwa	%l4,[%i2+%g0]0x89	! Mem[0000000030081400] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010141430] = 0e510fed, %l7 = ffffffffffffffff
	lduw	[%i5+0x030],%l7		! %l7 = 000000000e510fed

p0_label_223:
!	Mem[00000000100c1400] = ff0000ff000000e5, %f26 = 00000000 00000000
	ldd	[%i3+%g0],%f26		! %f26 = ff0000ff 000000e5
!	Mem[0000000030181408] = 00370000, %l0 = 0000000000000000
	lduwa	[%i6+%o4]0x89,%l0	! %l0 = 0000000000370000
!	Mem[0000000030081410] = ffffffe100000000, %f10 = 965c37e1 f6060000
	ldda	[%i2+%o5]0x81,%f10	! %f10 = ffffffe1 00000000
!	Mem[0000000030181400] = 37e1000037e1ffff, %l5 = 00000000ff000000
	ldxa	[%i6+%g0]0x89,%l5	! %l5 = 37e1000037e1ffff
!	Mem[0000000030001400] = ff00000000000000, %f2  = ff3d37e1 00000000
	ldda	[%i0+%g0]0x89,%f2 	! %f2  = ff000000 00000000
!	Mem[0000000010041408] = 37e1ffff 9c873bb5, %l4 = 00000000, %l5 = 37e1ffff
	ldda	[%i1+%o4]0x80,%l4	! %l4 = 0000000037e1ffff 000000009c873bb5
!	Mem[0000000030041408] = 00ff5f00e13700ff, %l3 = 00000000b53b879c
	ldxa	[%i1+%o4]0x89,%l3	! %l3 = 00ff5f00e13700ff
!	Mem[0000000010141410] = ff0000e5, %l1 = 00000000000000ff
	lduha	[%i5+%o5]0x80,%l1	! %l1 = 000000000000ff00
!	Mem[0000000030081400] = 00000000, %l4 = 0000000037e1ffff
	ldswa	[%i2+%g0]0x81,%l4	! %l4 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010041430] = 006ae2ff, %l7 = 000000000e510fed, %asi = 80
	swapa	[%i1+0x030]%asi,%l7	! %l7 = 00000000006ae2ff

p0_label_224:
!	%l5 = 000000009c873bb5, Mem[0000000030101408] = 00000000
	stwa	%l5,[%i4+%o4]0x81	! Mem[0000000030101408] = 9c873bb5
!	%f0  = 4fc855b8 ff3d37e1, %l3 = 00ff5f00e13700ff
!	Mem[0000000030101408] = 9c873bb500000000
	add	%i4,0x008,%g1
	stda	%f0,[%g1+%l3]ASI_PST32_S ! Mem[0000000030101408] = 4fc855b8ff3d37e1
!	Mem[000000001000143c] = d700e1ff, %l3 = 00ff5f00e13700ff
	swap	[%i0+0x03c],%l3		! %l3 = 00000000d700e1ff
!	%l3 = 00000000d700e1ff, Mem[0000000010141400] = c70000e1
	stba	%l3,[%i5+%g0]0x88	! Mem[0000000010141400] = c70000ff
!	%l1 = 000000000000ff00, Mem[0000000010081418] = ff0037e10000e137, %asi = 80
	stxa	%l1,[%i2+0x018]%asi	! Mem[0000000010081418] = 000000000000ff00
!	%l4 = 0000000000000000, Mem[0000000010101410] = 00000000
	stwa	%l4,[%i4+%o5]0x80	! Mem[0000000010101410] = 00000000
!	%l5 = 000000009c873bb5, Mem[0000000021800141] = 00002023
	stb	%l5,[%o3+0x141]		! Mem[0000000021800140] = 00b52023
!	%f0  = 4fc855b8 ff3d37e1 ff000000 00000000
!	%f4  = 00000000 1dffff00 c7dc5b29 d102b5cd
!	%f8  = 49945b77 13978a51 ffffffe1 00000000
!	%f12 = ffffe137 0000e137 965c37e1 f6060000
	stda	%f0,[%i1]ASI_COMMIT_S	! Block Store to 0000000030041400
!	%l0 = 0000000000370000, Mem[0000000010181408] = d102b500
	stwa	%l0,[%i6+%o4]0x88	! Mem[0000000010181408] = 00370000
!	Starting 10 instruction Load Burst
!	Mem[0000000010101438] = 00000000 0000ffff, %l4 = 00000000, %l5 = 9c873bb5
	ldd	[%i4+0x038],%l4		! %l4 = 0000000000000000 000000000000ffff

p0_label_225:
	membar	#Sync			! Added by membar checker (53)
!	Mem[0000000010041430] = 0e510fed 1dffffff, %l4 = 00000000, %l5 = 0000ffff
	ldda	[%i1+0x030]%asi,%l4	! %l4 = 000000000e510fed 000000001dffffff
!	Mem[0000000030181408] = 00370000, %l6 = 0000000000000000
	ldsha	[%i6+%o4]0x89,%l6	! %l6 = 0000000000000000
!	Mem[00000000100c1430] = c34866ff, %l1 = 000000000000ff00
	lduw	[%i3+0x030],%l1		! %l1 = 00000000c34866ff
!	Mem[0000000010101428] = 00000000, %l5 = 000000001dffffff
	ldsh	[%i4+0x02a],%l5		! %l5 = 0000000000000000
!	Mem[00000000300c1410] = c7dc5b29fffff800, %f12 = ffffe137 0000e137
	ldda	[%i3+%o5]0x89,%f12	! %f12 = c7dc5b29 fffff800
!	Mem[0000000030181400] = 37e1ffff, %l0 = 0000000000370000
	lduba	[%i6+%g0]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030001400] = 00000000000000ff, %l7 = 00000000006ae2ff
	ldxa	[%i0+%g0]0x81,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010141408] = 00ff0000, %l1 = 00000000c34866ff
	lduba	[%i5+%o4]0x80,%l1	! %l1 = 0000000000000000
!	Mem[00000000100c1408] = ff0000d1, %l0 = 00000000000000ff
	ldsba	[%i3+%o4]0x88,%l0	! %l0 = ffffffffffffffd1
!	Starting 10 instruction Store Burst
!	%l2 = 0000000000b502d1, Mem[0000000010181408] = 00003700
	stha	%l2,[%i6+%o4]0x80	! Mem[0000000010181408] = 02d13700

!	Check Point 45 for processor 0

	set	p0_check_pt_data_45,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = ffffffffffffffd1
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 0000000000000000
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l3,%g2			! %l3 = 00000000d700e1ff
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l4,%g2			! %l4 = 000000000e510fed
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
	cmp	%l7,%g2			! %l7 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x40],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = ff000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x48],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 00000000 1dffff00
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x50],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = c7dc5b29 d102b5cd
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x58],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = ffffffe1 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x60],%g3
	std	%f12,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f12 = c7dc5b29 fffff800
	bne	%xcc,p0_freg_check_fail
	mov	0xf12,%g1
	ldx	[%g4+0x68],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = ff0000ff 000000e5
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1

!	Check Point 45 completed


p0_label_226:
!	Mem[0000000030081408] = 0000008f, %l7 = 00000000000000ff
	ldstuba	[%i2+%o4]0x89,%l7	! %l7 = 0000008f000000ff
!	Mem[0000000030101400] = a30000ff, %l2 = 0000000000b502d1
	ldstuba	[%i4+%g0]0x89,%l2	! %l2 = 000000ff000000ff
!	%f10 = ffffffe1 00000000, %l6 = 0000000000000000
!	Mem[0000000010101438] = 000000000000ffff
	add	%i4,0x038,%g1
	stda	%f10,[%g1+%l6]ASI_PST16_PL ! Mem[0000000010101438] = 000000000000ffff
!	Mem[00000000100c1400] = ff0000ff000000e5, %l1 = 0000000000000000, %l6 = 0000000000000000
	casxa	[%i3]0x80,%l1,%l6	! %l6 = ff0000ff000000e5
!	%f0  = 4fc855b8 ff3d37e1, Mem[0000000010081408] = 000000a3 e1000000
	stda	%f0 ,[%i2+0x008]%asi	! Mem[0000000010081408] = 4fc855b8 ff3d37e1
!	Mem[000000001000142c] = 295bdcc7, %l4 = 000000000e510fed
	swap	[%i0+0x02c],%l4		! %l4 = 00000000295bdcc7
!	Mem[0000000010141400] = ff0000c7, %l7 = 000000000000008f
	ldstuba	[%i5+%g0]0x80,%l7	! %l7 = 000000ff000000ff
!	%l5 = 0000000000000000, Mem[0000000030041400] = 4fc855b8
	stwa	%l5,[%i1+%g0]0x81	! Mem[0000000030041400] = 00000000
!	Mem[0000000010041430] = 0e510fed1dffffff, %l6 = ff0000ff000000e5, %l7 = 00000000000000ff
	add	%i1,0x30,%g1
	casxa	[%g1]0x80,%l6,%l7	! %l7 = 0e510fed1dffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000030081410] = ffffffe1, %l4 = 00000000295bdcc7
	lduha	[%i2+%o5]0x81,%l4	! %l4 = 000000000000ffff

p0_label_227:
!	Mem[0000000010181410] = 000000001dffff00, %f10 = ffffffe1 00000000
	ldda	[%i6+%o5]0x88,%f10	! %f10 = 00000000 1dffff00
!	Mem[0000000030181400] = ffffe137, %f4  = 00000000
	lda	[%i6+%g0]0x81,%f4 	! %f4 = ffffe137
!	Mem[0000000010181400] = 0000d102, %f10 = 00000000
	lda	[%i6+%g0]0x88,%f10	! %f10 = 0000d102
!	Mem[0000000010141408] = 00ff0000, %l6 = ff0000ff000000e5
	lduha	[%i5+%o4]0x80,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030041408] = ff000000, %l1 = 0000000000000000
	lduha	[%i1+%o4]0x81,%l1	! %l1 = 000000000000ff00
!	Mem[0000000010041400] = e13700ff, %l2 = 00000000000000ff
	ldswa	[%i1+%g0]0x80,%l2	! %l2 = ffffffffe13700ff
!	Mem[0000000010001428] = a8921e6e, %f29 = 00000000
	lda	[%i0+0x028]%asi,%f29	! %f29 = a8921e6e
!	Mem[00000000300c1408] = e1373dff, %f15 = f6060000
	lda	[%i3+%o4]0x89,%f15	! %f15 = e1373dff
!	Mem[0000000010081410] = 00000000, %l7 = 0e510fed1dffffff
	lduba	[%i2+%o5]0x88,%l7	! %l7 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f24 = 518a9713, Mem[000000001014142c] = b53b3d9c
	sta	%f24,[%i5+0x02c]%asi	! Mem[000000001014142c] = 518a9713

p0_label_228:
!	%f0  = 4fc855b8 ff3d37e1, Mem[0000000010081400] = 295bdce1 00000000
	stda	%f0 ,[%i2+%g0]0x88	! Mem[0000000010081400] = 4fc855b8 ff3d37e1
!	%l1 = 000000000000ff00, Mem[0000000010081400] = e1373dff
	stba	%l1,[%i2+%g0]0x80	! Mem[0000000010081400] = 00373dff
!	Mem[0000000030181400] = ffffe137, %l6 = 00000000000000ff
	swapa	[%i6+%g0]0x81,%l6	! %l6 = 00000000ffffe137
!	%l2 = e13700ff, %l3 = d700e1ff, Mem[0000000010101428] = 00000000 6e1e92a8
	stda	%l2,[%i4+0x028]%asi	! Mem[0000000010101428] = e13700ff d700e1ff
!	%f10 = 0000d102, Mem[0000000010001400] = a3000000
	sta	%f10,[%i0+%g0]0x80	! Mem[0000000010001400] = 0000d102
!	%l1 = 000000000000ff00, Mem[0000000010181408] = 02d1370037e10000
	stxa	%l1,[%i6+%o4]0x80	! Mem[0000000010181408] = 000000000000ff00
!	%l6 = 00000000ffffe137, Mem[00000000300c1408] = e1373dff
	stba	%l6,[%i3+%o4]0x89	! Mem[00000000300c1408] = e1373d37
!	Mem[0000000010141420] = c134af67ff3d8ae1, %l7 = 0000000000000000, %l6 = 00000000ffffe137
	add	%i5,0x20,%g1
	casxa	[%g1]0x80,%l7,%l6	! %l6 = c134af67ff3d8ae1
!	Mem[0000000010181400] = 02d10000, %l6 = c134af67ff3d8ae1
	ldstuba	[%i6+%g0]0x80,%l6	! %l6 = 00000002000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = ffffe137, %l6 = 0000000000000002
	ldswa	[%i1+%o4]0x88,%l6	! %l6 = ffffffffffffe137

p0_label_229:
!	Mem[0000000010001408] = 000000ff, %l0 = ffffffffffffffd1
	lduwa	[%i0+%o4]0x80,%l0	! %l0 = 00000000000000ff
!	Mem[00000000300c1410] = 00f8ffff, %f1  = ff3d37e1
	lda	[%i3+%o5]0x81,%f1 	! %f1 = 00f8ffff
!	Mem[0000000030041410] = 00000000, %l7 = 0000000000000000
	ldswa	[%i1+%o5]0x89,%l7	! %l7 = 0000000000000000
!	%f24 = 518a9713 005fff00, Mem[0000000010181410] = 00ffff1d 00000000
	stda	%f24,[%i6+%o5]0x80	! Mem[0000000010181410] = 518a9713 005fff00
!	%l6 = ffffffffffffe137, %l2 = ffffffffe13700ff, %l5 = 0000000000000000
	orn	%l6,%l2,%l5		! %l5 = ffffffffffffff37
!	%l1 = 000000000000ff00, Mem[0000000010001410] = e10000c7
	stwa	%l1,[%i0+%o5]0x80	! Mem[0000000010001410] = 0000ff00
!	Mem[0000000010081400] = 4fc855b8ff3d3700, %f14 = 965c37e1 e1373dff
	ldda	[%i2+%g0]0x88,%f14	! %f14 = 4fc855b8 ff3d3700
!	Mem[0000000010101410] = 00000000 ffff00ff, %l6 = ffffe137, %l7 = 00000000
	ldda	[%i4+%o5]0x80,%l6	! %l6 = 0000000000000000 00000000ffff00ff
!	Mem[0000000030101410] = 00000009, %l7 = 00000000ffff00ff
	ldsba	[%i4+%o5]0x89,%l7	! %l7 = 0000000000000009
!	Starting 10 instruction Store Burst
!	Mem[0000000030101408] = b855c84f, %l5 = ffffffffffffff37
	ldstuba	[%i4+%o4]0x89,%l5	! %l5 = 0000004f000000ff

p0_label_230:
!	Mem[0000000030041410] = 00000000, %l7 = 0000000000000009
	ldstuba	[%i1+%o5]0x81,%l7	! %l7 = 00000000000000ff
!	%f6  = c7dc5b29 d102b5cd, Mem[0000000030101400] = a30000ff ff000000
	stda	%f6 ,[%i4+%g0]0x89	! Mem[0000000030101400] = c7dc5b29 d102b5cd
!	%l2 = ffffffffe13700ff, Mem[000000001000140c] = ffffe137
	stw	%l2,[%i0+0x00c]		! Mem[000000001000140c] = e13700ff
!	%f14 = 4fc855b8, Mem[0000000010081410] = 00000000
	sta	%f14,[%i2+%o5]0x88	! Mem[0000000010081410] = 4fc855b8
!	Mem[00000000100c1420] = 000000e1, %l3 = 00000000d700e1ff
	swap	[%i3+0x020],%l3		! %l3 = 00000000000000e1
!	%f18 = 00000000 b53b879c, Mem[0000000030001408] = ffffde3d 0000e137
	stda	%f18,[%i0+%o4]0x81	! Mem[0000000030001408] = 00000000 b53b879c
!	%l3 = 00000000000000e1, Mem[0000000010101410] = 00000000
	stha	%l3,[%i4+%o5]0x80	! Mem[0000000010101410] = 00e10000
!	Mem[0000000030081408] = 000000ff, %l3 = 00000000000000e1
	swapa	[%i2+%o4]0x89,%l3	! %l3 = 00000000000000ff
!	%l3 = 00000000000000ff, Mem[000000001018142e] = 1dffffff
	sth	%l3,[%i6+0x02e]		! Mem[000000001018142c] = 1dff00ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = 00000000, %l2 = ffffffffe13700ff
	ldsba	[%i6+%o4]0x88,%l2	! %l2 = 0000000000000000

!	Check Point 46 for processor 0

	set	p0_check_pt_data_46,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 00000000000000ff
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
	cmp	%l4,%g2			! %l4 = 000000000000ffff
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l5,%g2			! %l5 = 000000000000004f
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l6,%g2			! %l6 = 0000000000000000
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l7,%g2			! %l7 = 0000000000000000
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x40],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = 4fc855b8 00f8ffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x48],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = ffffe137 1dffff00
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x50],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = c7dc5b29 d102b5cd
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x58],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = 0000d102 1dffff00
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x60],%g3
	std	%f14,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f14 = 4fc855b8 ff3d3700
	bne	%xcc,p0_freg_check_fail
	mov	0xf14,%g1
	ldx	[%g4+0x68],%g3
	std	%f28,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f28 = ff3d37e1 a8921e6e
	bne	%xcc,p0_freg_check_fail
	mov	0xf28,%g1

!	Check Point 46 completed


p0_label_231:
!	Mem[0000000010181410] = 518a9713, %l1 = 000000000000ff00
	lduha	[%i6+%o5]0x80,%l1	! %l1 = 000000000000518a
	membar	#Sync			! Added by membar checker (54)
!	Mem[0000000030101400] = cdb502d1 295bdcc7 ffc855b8 ff3d37e1
!	Mem[0000000030101410] = 09000000 ed0f510e f800e2f2 35ade500
!	Mem[0000000030101420] = d96af809 948a6312 ffffffff d6fa8c51
!	Mem[0000000030101430] = 00008f57 b1cdffff ff0000f2 a19e6944
	ldda	[%i4]ASI_BLK_S,%f0	! Block Load from 0000000030101400
!	Mem[0000000010141400] = ff0000c7, %l3 = 00000000000000ff
	lduba	[%i5+%g0]0x80,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030181408] = 00370000, %l4 = 000000000000ffff
	ldsba	[%i6+%o4]0x89,%l4	! %l4 = 0000000000000000
!	Mem[00000000300c1408] = e1373d37, %l4 = 0000000000000000
	ldswa	[%i3+%o4]0x89,%l4	! %l4 = ffffffffe1373d37
!	Mem[00000000100c1400] = ff0000ff, %l1 = 000000000000518a
	ldsha	[%i3+%g0]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010041410] = e1ffffffffffffff, %l0 = 00000000000000ff
	ldxa	[%i1+%o5]0x80,%l0	! %l0 = e1ffffffffffffff
!	Mem[0000000030001400] = 00000000, %l5 = 000000000000004f
	lduwa	[%i0+%g0]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000010101408] = ffffe137 0000e137, %l2 = 00000000, %l3 = 000000ff
	ldda	[%i4+0x008]%asi,%l2	! %l2 = 00000000ffffe137 000000000000e137
!	Starting 10 instruction Store Burst
!	Mem[0000000010001410] = 00ff0000, %l0 = e1ffffffffffffff
	ldstuba	[%i0+%o5]0x88,%l0	! %l0 = 00000000000000ff

p0_label_232:
!	Mem[000000001010141c] = 1dffffff, %l4 = ffffffffe1373d37
	swap	[%i4+0x01c],%l4		! %l4 = 000000001dffffff
!	%f18 = 00000000, Mem[0000000030001400] = 00000000
	sta	%f18,[%i0+%g0]0x81	! Mem[0000000030001400] = 00000000
!	%l4 = 000000001dffffff, Mem[0000000010001410] = ff00ff00000000ff
	stxa	%l4,[%i0+%o5]0x80	! Mem[0000000010001410] = 000000001dffffff
!	%f20 = 37e1ffff ff000000, Mem[0000000030141410] = e13700ff 000000ff
	stda	%f20,[%i5+%o5]0x89	! Mem[0000000030141410] = 37e1ffff ff000000
!	%f22 = cdb502d1, Mem[0000000010181410] = 13978a51
	sta	%f22,[%i6+%o5]0x88	! Mem[0000000010181410] = cdb502d1
!	%l0 = 0000000000000000, Mem[0000000030041400] = 00000000
	stba	%l0,[%i1+%g0]0x89	! Mem[0000000030041400] = 00000000
!	Mem[0000000010081430] = 00000000000000e1, %l3 = 000000000000e137, %l0 = 0000000000000000
	add	%i2,0x30,%g1
	casxa	[%g1]0x80,%l3,%l0	! %l0 = 00000000000000e1
!	%f24 = 518a9713 005fff00, %l2 = 00000000ffffe137
!	Mem[0000000030001410] = 1dffffffff000000
	add	%i0,0x010,%g1
	stda	%f24,[%g1+%l2]ASI_PST8_S ! Mem[0000000030001410] = 1dff9713ff5fff00
!	Mem[0000000030081410] = ffffffe1, %l6 = 0000000000000000
	ldstuba	[%i2+%o5]0x81,%l6	! %l6 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = b8ffffff, %l3 = 000000000000e137
	lduwa	[%i5+%o4]0x81,%l3	! %l3 = 00000000b8ffffff

p0_label_233:
!	Mem[0000000010141400] = c70000ff, %f28 = ff3d37e1
	lda	[%i5+%g0]0x88,%f28	! %f28 = c70000ff
!	Mem[0000000030041410] = ff000000, %l5 = 0000000000000000
	lduha	[%i1+%o5]0x81,%l5	! %l5 = 000000000000ff00
!	Mem[0000000030081400] = 00000000295bdcc7, %f26 = ff0000ff 000000e5
	ldda	[%i2+%g0]0x81,%f26	! %f26 = 00000000 295bdcc7
!	Mem[0000000030081408] = 000000e1, %l0 = 00000000000000e1
	lduwa	[%i2+%o4]0x89,%l0	! %l0 = 00000000000000e1
!	Mem[0000000030041410] = 000000ff, %f20 = 37e1ffff
	lda	[%i1+%o5]0x89,%f20	! %f20 = 000000ff
!	Mem[0000000030181400] = ff000000, %f16 = 8f000000
	lda	[%i6+%g0]0x89,%f16	! %f16 = ff000000
!	Mem[0000000030101400] = cdb502d1 295bdcc7 ffc855b8 ff3d37e1
!	Mem[0000000030101410] = 09000000 ed0f510e f800e2f2 35ade500
!	Mem[0000000030101420] = d96af809 948a6312 ffffffff d6fa8c51
!	Mem[0000000030101430] = 00008f57 b1cdffff ff0000f2 a19e6944
	ldda	[%i4]ASI_BLK_AIUSL,%f0	! Block Load from 0000000030101400
!	Mem[0000000020800040] = ffffb8ec, %l4 = 000000001dffffff
	lduha	[%o1+0x040]%asi,%l4	! %l4 = 000000000000ffff
!	Mem[00000000211c0000] = ffffa37b, %l3 = 00000000b8ffffff
	ldub	[%o2+0x001],%l3		! %l3 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l1 = 00000000000000ff, Mem[000000001014143e] = f6060000, %asi = 80
	stba	%l1,[%i5+0x03e]%asi	! Mem[000000001014143c] = f606ff00

p0_label_234:
!	%f25 = 005fff00, Mem[0000000030181410] = 3d0000e5
	sta	%f25,[%i6+%o5]0x81	! Mem[0000000030181410] = 005fff00
!	%f22 = cdb502d1 37e10000, %l5 = 000000000000ff00
!	Mem[0000000030041410] = ff0000001dffff00
	add	%i1,0x010,%g1
	stda	%f22,[%g1+%l5]ASI_PST32_S ! Mem[0000000030041410] = ff0000001dffff00
!	Mem[0000000010001400] = 02d10000, %l3 = 00000000000000ff
	swapa	[%i0+%g0]0x88,%l3	! %l3 = 0000000002d10000
!	%f30 = e1373d78 ffffffff, Mem[0000000010081400] = 00373dff b855c84f
	stda	%f30,[%i2+%g0]0x80	! Mem[0000000010081400] = e1373d78 ffffffff
!	%f18 = 00000000 b53b879c, Mem[0000000010001410] = 00000000 1dffffff
	stda	%f18,[%i0+%o5]0x80	! Mem[0000000010001410] = 00000000 b53b879c
!	%f30 = e1373d78, Mem[0000000010141400] = c70000ff
	sta	%f30,[%i5+%g0]0x88	! Mem[0000000010141400] = e1373d78
!	Mem[0000000010181400] = 0000d1ff, %l4 = 000000000000ffff
	swapa	[%i6+%g0]0x88,%l4	! %l4 = 000000000000d1ff
!	%f27 = 295bdcc7, Mem[0000000010001410] = 00000000
	sta	%f27,[%i0+%o5]0x88	! Mem[0000000010001410] = 295bdcc7
!	Mem[0000000010001410] = c7dc5b29, %l7 = 0000000000000000
	ldstuba	[%i0+%o5]0x80,%l7	! %l7 = 000000c7000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = b8ffffff, %l1 = 00000000000000ff
	ldsha	[%i5+%o4]0x81,%l1	! %l1 = ffffffffffffb8ff

p0_label_235:
!	Mem[0000000010181410] = cdb502d1, %f27 = 295bdcc7
	lda	[%i6+%o5]0x88,%f27	! %f27 = cdb502d1
!	Mem[0000000010001408] = ff000000, %l4 = 000000000000d1ff
	lduba	[%i0+%o4]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000010001400] = ff000000, %f31 = ffffffff
	ld	[%i0+%g0],%f31	! %f31 = ff000000
!	Mem[0000000010001400] = ff000000 000000ff, %l6 = 000000ff, %l7 = 000000c7
	ldda	[%i0+%g0]0x88,%l6	! %l6 = 00000000000000ff 00000000ff000000
!	Mem[0000000030001408] = 00000000, %f20 = 000000ff
	lda	[%i0+%o4]0x89,%f20	! %f20 = 00000000
!	Mem[0000000010141410] = ff0000e5, %l3 = 0000000002d10000
	lduha	[%i5+%o5]0x80,%l3	! %l3 = 000000000000ff00
!	Mem[0000000010041400] = ff0037e1, %l7 = 00000000ff000000
	ldsha	[%i1+%g0]0x88,%l7	! %l7 = 00000000000037e1
!	Mem[0000000010141410] = ff0000e5, %l4 = 0000000000000000
	ldswa	[%i5+%o5]0x80,%l4	! %l4 = ffffffffff0000e5
!	Mem[00000000100c1410] = 00000000, %l2 = 00000000ffffe137
	lduba	[%i3+%o5]0x80,%l2	! %l2 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010081400] = e1373d78, %l2 = 0000000000000000
	swapa	[%i2+%g0]0x80,%l2	! %l2 = 00000000e1373d78

!	Check Point 47 for processor 0

	set	p0_check_pt_data_47,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 00000000000000e1
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = ffffffffffffb8ff
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 00000000e1373d78
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 000000000000ff00
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = ffffffffff0000e5
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 000000000000ff00
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 00000000000037e1
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = c7dc5b29 d102b5cd
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x50],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = e1373dff b855c8ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x58],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 0e510fed 00000009
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x60],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 00e5ad35 f2e200f8
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x68],%g3
	std	%f8,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f8 = 12638a94 09f86ad9
	bne	%xcc,p0_freg_check_fail
	mov	0xf08,%g1
	ldx	[%g4+0x70],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = 518cfad6 ffffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x78],%g3
	std	%f12,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f12 = ffffcdb1 578f0000
	bne	%xcc,p0_freg_check_fail
	mov	0xf12,%g1
	ldx	[%g4+0x80],%g3
	std	%f14,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f14 = 44699ea1 f20000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf14,%g1
	ldx	[%g4+0x88],%g3
	std	%f16,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f16 = ff000000 ff0037e1
	bne	%xcc,p0_freg_check_fail
	mov	0xf16,%g1
	ldx	[%g4+0x90],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = 00000000 ff000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1
	ldx	[%g4+0x98],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = 00000000 cdb502d1
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1
	ldx	[%g4+0xa0],%g3
	std	%f28,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f28 = c70000ff a8921e6e
	bne	%xcc,p0_freg_check_fail
	mov	0xf28,%g1
	ldx	[%g4+0xa8],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = e1373d78 ff000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 47 completed


p0_label_236:
!	%f0  = c7dc5b29 d102b5cd, %l1 = ffffffffffffb8ff
!	Mem[0000000030041408] = ff00000000000000
	add	%i1,0x008,%g1
	stda	%f0,[%g1+%l1]ASI_PST16_SL ! Mem[0000000030041408] = cdb502d1295bdcc7
!	Mem[0000000030101400] = cdb502d1, %l1 = ffffffffffffb8ff
	ldstuba	[%i4+%g0]0x81,%l1	! %l1 = 000000cd000000ff
!	%l6 = 00000000000000ff, Mem[0000000010181408] = 00000000
	stha	%l6,[%i6+%o4]0x88	! Mem[0000000010181408] = 000000ff
!	Mem[0000000021800101] = a3d35a3e, %l5 = 000000000000ff00
	ldstuba	[%o3+0x101]%asi,%l5	! %l5 = 000000d3000000ff
!	Mem[0000000010041410] = ffffffe1, %l3 = 000000000000ff00
	swapa	[%i1+%o5]0x88,%l3	! %l3 = 00000000ffffffe1
!	%l4 = ffffffffff0000e5, Mem[0000000030081408] = e10000006e1e92a8
	stxa	%l4,[%i2+%o4]0x81	! Mem[0000000030081408] = ffffffffff0000e5
!	Mem[0000000010101424] = 775b9449, %l7 = 000037e1, %l2 = e1373d78
	add	%i4,0x24,%g1
	casa	[%g1]0x80,%l7,%l2	! %l2 = 00000000775b9449
	membar	#Sync			! Added by membar checker (55)
!	%l1 = 00000000000000cd, Mem[0000000030101410] = 09000000
	stba	%l1,[%i4+%o5]0x81	! Mem[0000000030101410] = cd000000
!	%l1 = 00000000000000cd, Mem[00000000201c0001] = ffff851d
	stb	%l1,[%o0+0x001]		! Mem[00000000201c0000] = ffcd851d
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = 37e1ffffff000000, %f20 = 00000000 ff000000
	ldda	[%i5+%o5]0x89,%f20	! %f20 = 37e1ffff ff000000

p0_label_237:
!	Mem[0000000030001408] = 00000000, %l7 = 00000000000037e1
	ldswa	[%i0+%o4]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000010141428] = a8921e6e518a9713, %f10 = 518cfad6 ffffffff
	ldd	[%i5+0x028],%f10	! %f10 = a8921e6e 518a9713
!	Mem[00000000100c1400] = ff0000ff, %f1  = d102b5cd
	lda	[%i3+%g0]0x80,%f1 	! %f1 = ff0000ff
!	Mem[0000000010101410] = 0000e100, %f27 = cdb502d1
	lda	[%i4+%o5]0x88,%f27	! %f27 = 0000e100
!	Mem[0000000010041408] = 37e1ffff, %l2 = 00000000775b9449
	ldsha	[%i1+%o4]0x80,%l2	! %l2 = 00000000000037e1
!	Mem[0000000010101410] = ff00ffff0000e100, %f14 = 44699ea1 f20000ff
	ldda	[%i4+%o5]0x88,%f14	! %f14 = ff00ffff 0000e100
!	Mem[000000001010140c] = 0000e137, %l2 = 00000000000037e1
	ldsha	[%i4+0x00e]%asi,%l2	! %l2 = ffffffffffffe137
!	Mem[000000001000141c] = d102b5cd, %f0  = c7dc5b29
	ld	[%i0+0x01c],%f0 	! %f0 = d102b5cd
!	Mem[000000001000141c] = d102b5cd, %l2 = ffffffffffffe137
	lduh	[%i0+0x01e],%l2		! %l2 = 000000000000b5cd
!	Starting 10 instruction Store Burst
!	%l5 = 00000000000000d3, Mem[0000000010141410] = e50000ff
	stba	%l5,[%i5+%o5]0x88	! Mem[0000000010141410] = e50000d3

p0_label_238:
!	Mem[00000000300c1400] = a3000000, %l1 = 00000000000000cd
	swapa	[%i3+%g0]0x81,%l1	! %l1 = 00000000a3000000
!	Mem[0000000010101410] = 00e10000, %l3 = 00000000ffffffe1
	swapa	[%i4+%o5]0x80,%l3	! %l3 = 0000000000e10000
!	%f24 = 518a9713 005fff00, Mem[00000000300c1400] = 000000cd ffffffff
	stda	%f24,[%i3+%g0]0x81	! Mem[00000000300c1400] = 518a9713 005fff00
!	%l4 = ffffffffff0000e5, Mem[0000000010081410] = 000000004fc855b8
	stxa	%l4,[%i2+%o5]0x88	! Mem[0000000010081410] = ffffffffff0000e5
!	%f0  = d102b5cd ff0000ff, Mem[00000000300c1410] = fffff800 c7dc5b29
	stda	%f0 ,[%i3+%o5]0x89	! Mem[00000000300c1410] = d102b5cd ff0000ff
!	%f29 = a8921e6e, Mem[0000000030181408] = 00003700
	sta	%f29,[%i6+%o4]0x81	! Mem[0000000030181408] = a8921e6e
!	Mem[0000000030081410] = ffffffe1, %l7 = 0000000000000000
	ldstuba	[%i2+%o5]0x81,%l7	! %l7 = 000000ff000000ff
!	Mem[00000000300c1408] = 373d37e1, %l3 = 0000000000e10000
	swapa	[%i3+%o4]0x81,%l3	! %l3 = 00000000373d37e1
!	%l1 = 00000000a3000000, Mem[0000000010041408] = 37e1ffff
	stha	%l1,[%i1+%o4]0x80	! Mem[0000000010041408] = 0000ffff
!	Starting 10 instruction Load Burst
!	Mem[0000000030081410] = ffffffe1, %l1 = 00000000a3000000
	lduha	[%i2+%o5]0x81,%l1	! %l1 = 000000000000ffff

p0_label_239:
!	Mem[0000000030001400] = 00000000, %l3 = 00000000373d37e1
	lduwa	[%i0+%g0]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000010181400] = ffff0000, %l5 = 00000000000000d3
	lduwa	[%i6+%g0]0x80,%l5	! %l5 = 00000000ffff0000
!	Mem[0000000030041408] = cdb502d1 295bdcc7, %l4 = ff0000e5, %l5 = ffff0000
	ldda	[%i1+%o4]0x81,%l4	! %l4 = 00000000cdb502d1 00000000295bdcc7
!	Mem[0000000010101410] = ffffffe1ffff00ff, %f2  = e1373dff b855c8ff
	ldd	[%i4+%o5],%f2 		! %f2  = ffffffe1 ffff00ff
!	Mem[00000000300c1408] = 00e10000 00000000, %l4 = cdb502d1, %l5 = 295bdcc7
	ldda	[%i3+%o4]0x81,%l4	! %l4 = 0000000000e10000 0000000000000000
!	Mem[0000000030001410] = 1dff9713ff5fff00, %f30 = e1373d78 ff000000
	ldda	[%i0+%o5]0x81,%f30	! %f30 = 1dff9713 ff5fff00
!	Mem[0000000010081410] = e50000ff, %f18 = 00000000
	lda	[%i2+%o5]0x80,%f18	! %f18 = e50000ff
	membar	#Sync			! Added by membar checker (56)
!	Mem[0000000030081400] = 00000000 295bdcc7 ffffffff ff0000e5
!	Mem[0000000030081410] = ffffffe1 00000000 24174994 000000f6
!	Mem[0000000030081420] = 3b8aacb1 6e1e92a8 00000000 0000783d
!	Mem[0000000030081430] = 94491724 52e548c3 d1022890 cdb502d1
	ldda	[%i2]ASI_BLK_S,%f16	! Block Load from 0000000030081400
!	Mem[0000000030001408] = 00000000, %l6 = 00000000000000ff
	lduba	[%i0+%o4]0x81,%l6	! %l6 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010081410] = e50000ff, %l6 = 0000000000000000
	ldstuba	[%i2+%o5]0x80,%l6	! %l6 = 000000e5000000ff

p0_label_240:
!	Mem[0000000010181410] = d102b5cd, %l7 = 00000000000000ff
	ldstuba	[%i6+%o5]0x80,%l7	! %l7 = 000000d1000000ff
!	%f0  = d102b5cd ff0000ff, Mem[0000000010041410] = 00ff0000 ffffffff
	stda	%f0 ,[%i1+%o5]0x80	! Mem[0000000010041410] = d102b5cd ff0000ff
!	%l6 = 00000000000000e5, Mem[00000000100c1418] = d96af809005fff00, %asi = 80
	stxa	%l6,[%i3+0x018]%asi	! Mem[00000000100c1418] = 00000000000000e5
!	Mem[0000000010101410] = e1ffffff, %l1 = 000000000000ffff
	swapa	[%i4+%o5]0x88,%l1	! %l1 = 00000000e1ffffff
!	Mem[0000000010081408] = 4fc855b8, %l3 = 0000000000000000
	swapa	[%i2+%o4]0x80,%l3	! %l3 = 000000004fc855b8
!	Mem[00000000100c1400] = ff0000ff, %l1 = 00000000e1ffffff
	swapa	[%i3+%g0]0x88,%l1	! %l1 = 00000000ff0000ff
!	%l0 = 00000000000000e1, Mem[0000000010081408] = e1373dff00000000
	stxa	%l0,[%i2+%o4]0x88	! Mem[0000000010081408] = 00000000000000e1
!	Mem[0000000030181400] = ff000000, %l6 = 00000000000000e5
	swapa	[%i6+%g0]0x89,%l6	! %l6 = 00000000ff000000
!	%l5 = 0000000000000000, Mem[00000000201c0000] = ffcd851d, %asi = 80
	stha	%l5,[%o0+0x000]%asi	! Mem[00000000201c0000] = 0000851d
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1418] = 00000000, %l7 = 00000000000000d1
	ldsh	[%i3+0x01a],%l7		! %l7 = 0000000000000000

!	Check Point 48 for processor 0

	set	p0_check_pt_data_48,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l1,%g2			! %l1 = 00000000ff0000ff
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l2,%g2			! %l2 = 000000000000b5cd
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l3,%g2			! %l3 = 000000004fc855b8
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l5,%g2			! %l5 = 0000000000000000
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l6,%g2			! %l6 = 00000000ff000000
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l7,%g2			! %l7 = 0000000000000000
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x38],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = d102b5cd ff0000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x40],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = ffffffe1 ffff00ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x48],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 0e510fed 00000009
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x50],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = a8921e6e 518a9713
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x58],%g3
	std	%f14,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f14 = ff00ffff 0000e100
	bne	%xcc,p0_freg_check_fail
	mov	0xf14,%g1
	ldx	[%g4+0x60],%g3
	std	%f16,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f16 = 00000000 295bdcc7
	bne	%xcc,p0_freg_check_fail
	mov	0xf16,%g1
	ldx	[%g4+0x68],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = ffffffff ff0000e5
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1
	ldx	[%g4+0x70],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = ffffffe1 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1
	ldx	[%g4+0x78],%g3
	std	%f22,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f22 = 24174994 000000f6
	bne	%xcc,p0_freg_check_fail
	mov	0xf22,%g1
	ldx	[%g4+0x80],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = 3b8aacb1 6e1e92a8
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1
	ldx	[%g4+0x88],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = 00000000 0000783d
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1
	ldx	[%g4+0x90],%g3
	std	%f28,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f28 = 94491724 52e548c3
	bne	%xcc,p0_freg_check_fail
	mov	0xf28,%g1
	ldx	[%g4+0x98],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = d1022890 cdb502d1
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 48 completed


p0_label_241:
	membar	#Sync			! Added by membar checker (57)
!	Mem[0000000010041400] = e13700ff 0000008f 0000ffff 9c873bb5
!	Mem[0000000010041410] = d102b5cd ff0000ff b1ac8a3b 1da45bae
!	Mem[0000000010041420] = 000006ff e18a5c96 68e6ff57 d6fa8c51
!	Mem[0000000010041430] = 0e510fed 1dffffff ff0000f2 a19e6944
	ldda	[%i1]ASI_BLK_P,%f16	! Block Load from 0000000010041400
!	Mem[0000000010041400] = ff0037e1, %l5 = 0000000000000000
	lduha	[%i1+%g0]0x88,%l5	! %l5 = 00000000000037e1
!	Mem[000000001000140c] = e13700ff, %l4 = 0000000000e10000
	ldsw	[%i0+0x00c],%l4		! %l4 = ffffffffe13700ff
!	Mem[0000000030001408] = 00000000, %l2 = 000000000000b5cd
	ldsha	[%i0+%o4]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000030141400] = ffffff00, %l3 = 000000004fc855b8
	lduha	[%i5+%g0]0x89,%l3	! %l3 = 000000000000ff00
!	Mem[0000000010141408] = 0000ff00, %l3 = 000000000000ff00
	lduha	[%i5+%o4]0x88,%l3	! %l3 = 000000000000ff00
!	Mem[0000000010181408] = 000000ff, %l7 = 0000000000000000
	ldswa	[%i6+%o4]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[00000000211c0000] = ffffa37b, %l4 = ffffffffe13700ff
	ldub	[%o2+%g0],%l4		! %l4 = 00000000000000ff
!	Mem[0000000030081410] = ffffffe1, %l6 = 00000000ff000000
	ldsba	[%i2+%o5]0x81,%l6	! %l6 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	Mem[0000000030141410] = ff000000, %l2 = 0000000000000000
	ldstuba	[%i5+%o5]0x89,%l2	! %l2 = 00000000000000ff

p0_label_242:
!	%l7 = 00000000000000ff, Mem[0000000030101410] = 000000cd
	stwa	%l7,[%i4+%o5]0x89	! Mem[0000000030101410] = 000000ff
!	%l2 = 00000000, %l3 = 0000ff00, Mem[00000000100c1408] = ff0000d1 a3000000
	stda	%l2,[%i3+%o4]0x88	! Mem[00000000100c1408] = 00000000 0000ff00
!	%l6 = ffffffffffffffff, Mem[0000000010141416] = 00000000
	sth	%l6,[%i5+0x016]		! Mem[0000000010141414] = 0000ffff
!	Mem[0000000010141424] = ff3d8ae1, %l7 = 00000000000000ff
	swap	[%i5+0x024],%l7		! %l7 = 00000000ff3d8ae1
!	Mem[0000000010041424] = e18a5c96, %l2 = 0000000000000000
	swap	[%i1+0x024],%l2		! %l2 = 00000000e18a5c96
!	%l4 = 000000ff, %l5 = 000037e1, Mem[0000000030041408] = d102b5cd c7dc5b29
	stda	%l4,[%i1+%o4]0x89	! Mem[0000000030041408] = 000000ff 000037e1
!	%l7 = 00000000ff3d8ae1, Mem[00000000300c1408] = 0000e100
	stha	%l7,[%i3+%o4]0x89	! Mem[00000000300c1408] = 00008ae1
!	%f7  = f2e200f8, Mem[0000000010141434] = 4fc8ffb8
	st	%f7 ,[%i5+0x034]	! Mem[0000000010141434] = f2e200f8
!	%l7 = 00000000ff3d8ae1, Mem[0000000010141400] = 8f000000e1373d78
	stxa	%l7,[%i5+%g0]0x88	! Mem[0000000010141400] = 00000000ff3d8ae1
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = 00ff0000, %l5 = 00000000000037e1
	ldsba	[%i5+%o4]0x80,%l5	! %l5 = 0000000000000000

p0_label_243:
!	Mem[0000000010001410] = ffdc5b29 b53b879c, %l2 = e18a5c96, %l3 = 0000ff00
	ldda	[%i0+%o5]0x80,%l2	! %l2 = 00000000ffdc5b29 00000000b53b879c
!	Mem[0000000010001400] = ff000000 000000ff, %l6 = ffffffff, %l7 = ff3d8ae1
	ldda	[%i0+%g0]0x88,%l6	! %l6 = 00000000000000ff 00000000ff000000
!	Mem[0000000010101408] = ffffe137, %l0 = 00000000000000e1
	ldsha	[%i4+%o4]0x80,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010041410] = cdb502d1, %l6 = 00000000000000ff
	ldsba	[%i1+%o5]0x88,%l6	! %l6 = ffffffffffffffd1
!	Mem[0000000010101410] = 0000ffff, %l2 = 00000000ffdc5b29
	lduha	[%i4+%o5]0x88,%l2	! %l2 = 000000000000ffff
!	Mem[0000000010041400] = 8f000000ff0037e1, %f10 = a8921e6e 518a9713
	ldda	[%i1+%g0]0x88,%f10	! %f10 = 8f000000 ff0037e1
!	Mem[0000000010001408] = ff000000, %l2 = 000000000000ffff
	ldsha	[%i0+%o4]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000010001408] = ff000000, %l5 = 0000000000000000
	ldsba	[%i0+%o4]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000030181410] = 00ff5f00, %f10 = 8f000000
	lda	[%i6+%o5]0x89,%f10	! %f10 = 00ff5f00
!	Starting 10 instruction Store Burst
!	%l2 = 0000000000000000, Mem[0000000010181408] = 000000ff
	stwa	%l2,[%i6+%o4]0x88	! Mem[0000000010181408] = 00000000

p0_label_244:
!	%f14 = ff00ffff 0000e100, Mem[0000000030001410] = 1dff9713 ff5fff00
	stda	%f14,[%i0+%o5]0x81	! Mem[0000000030001410] = ff00ffff 0000e100
!	%l5 = 0000000000000000, Mem[00000000201c0000] = 0000851d, %asi = 80
	stha	%l5,[%o0+0x000]%asi	! Mem[00000000201c0000] = 0000851d
!	Mem[00000000100c1408] = 00000000, %l5 = 0000000000000000
	swapa	[%i3+%o4]0x88,%l5	! %l5 = 0000000000000000
!	%l1 = 00000000ff0000ff, Mem[0000000010141410] = d30000e50000ffff
	stx	%l1,[%i5+%o5]		! Mem[0000000010141410] = 00000000ff0000ff
!	%l2 = 00000000, %l3 = b53b879c, Mem[00000000100c1410] = 00000000 000000ff
	stda	%l2,[%i3+%o5]0x80	! Mem[00000000100c1410] = 00000000 b53b879c
!	%l3 = 00000000b53b879c, Mem[0000000030001400] = 00000000
	stba	%l3,[%i0+%g0]0x81	! Mem[0000000030001400] = 9c000000
!	Mem[00000000100c1400] = e1ffffff, %l7 = 00000000ff000000
	swapa	[%i3+%g0]0x88,%l7	! %l7 = 00000000e1ffffff
!	Mem[0000000030041408] = ff000000, %l4 = 00000000000000ff
	ldstuba	[%i1+%o4]0x81,%l4	! %l4 = 000000ff000000ff
!	Mem[00000000211c0001] = ffffa37b, %l3 = 00000000b53b879c
	ldstuba	[%o2+0x001]%asi,%l3	! %l3 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = 0000ffff9c873bb5, %l5 = 0000000000000000
	ldxa	[%i1+0x008]%asi,%l5	! %l5 = 0000ffff9c873bb5

p0_label_245:
!	Mem[00000000300c1408] = 00008ae1, %l4 = 00000000000000ff
	ldswa	[%i3+%o4]0x89,%l4	! %l4 = 0000000000008ae1
!	Mem[0000000010041408] = 0000ffff9c873bb5, %l4 = 0000000000008ae1
	ldxa	[%i1+%o4]0x80,%l4	! %l4 = 0000ffff9c873bb5
!	Mem[0000000030081408] = ffffffff ff0000e5, %l2 = 00000000, %l3 = 000000ff
	ldda	[%i2+%o4]0x81,%l2	! %l2 = 00000000ffffffff 00000000ff0000e5
!	Mem[0000000010101408] = ffffe137, %l1 = 00000000ff0000ff
	lduba	[%i4+%o4]0x80,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030101400] = d102b5ff, %l0 = ffffffffffffffff
	lduwa	[%i4+%g0]0x89,%l0	! %l0 = 00000000d102b5ff
!	Mem[0000000010081410] = ff0000ff, %l4 = 0000ffff9c873bb5
	lduwa	[%i2+%o5]0x80,%l4	! %l4 = 00000000ff0000ff
!	Mem[0000000030001410] = ffff00ff, %l3 = 00000000ff0000e5
	ldsba	[%i0+%o5]0x89,%l3	! %l3 = ffffffffffffffff
!	%f4  = 0e510fed, Mem[0000000010181400] = 0000ffff
	sta	%f4 ,[%i6+%g0]0x88	! Mem[0000000010181400] = 0e510fed
!	Mem[0000000010041400] = e13700ff, %l3 = ffffffffffffffff
	ldsha	[%i1+%g0]0x80,%l3	! %l3 = ffffffffffffe137
!	Starting 10 instruction Store Burst
!	%l0 = 00000000d102b5ff, Mem[0000000010181400] = 0e510fed
	stba	%l0,[%i6+%g0]0x88	! Mem[0000000010181400] = 0e510fff

!	Check Point 49 for processor 0

	set	p0_check_pt_data_49,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 00000000d102b5ff
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
	cmp	%l3,%g2			! %l3 = ffffffffffffe137
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 00000000ff0000ff
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 0000ffff9c873bb5
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = ffffffffffffffd1
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 00000000e1ffffff
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = ffffffe1 ffff00ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x50],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 00e5ad35 f2e200f8
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x58],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = 00ff5f00 ff0037e1
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x60],%g3
	std	%f16,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f16 = e13700ff 0000008f
	bne	%xcc,p0_freg_check_fail
	mov	0xf16,%g1
	ldx	[%g4+0x68],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = 0000ffff 9c873bb5
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1
	ldx	[%g4+0x70],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = d102b5cd ff0000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1
	ldx	[%g4+0x78],%g3
	std	%f22,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f22 = b1ac8a3b 1da45bae
	bne	%xcc,p0_freg_check_fail
	mov	0xf22,%g1
	ldx	[%g4+0x80],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = 000006ff e18a5c96
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1
	ldx	[%g4+0x88],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = 68e6ff57 d6fa8c51
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1
	ldx	[%g4+0x90],%g3
	std	%f28,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f28 = 0e510fed 1dffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf28,%g1
	ldx	[%g4+0x98],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = ff0000f2 a19e6944
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 49 completed


p0_label_246:
!	%l5 = 0000ffff9c873bb5, Mem[0000000010101408] = 37e1ffff
	stwa	%l5,[%i4+%o4]0x88	! Mem[0000000010101408] = 9c873bb5
!	%l0 = d102b5ff, %l1 = 000000ff, Mem[0000000010141400] = ff3d8ae1 00000000
	stda	%l0,[%i5+%g0]0x88	! Mem[0000000010141400] = d102b5ff 000000ff
!	%l6 = ffffffd1, %l7 = e1ffffff, Mem[0000000010081400] = 00000000 ffffffff
	stda	%l6,[%i2+%g0]0x80	! Mem[0000000010081400] = ffffffd1 e1ffffff
!	%l6 = ffffffd1, %l7 = e1ffffff, Mem[0000000030081408] = ffffffff e50000ff
	stda	%l6,[%i2+%o4]0x89	! Mem[0000000030081408] = ffffffd1 e1ffffff
!	%l5 = 0000ffff9c873bb5, Mem[0000000030101400] = ffb502d1
	stha	%l5,[%i4+%g0]0x81	! Mem[0000000030101400] = 3bb502d1
!	%l2 = ffffffff, %l3 = ffffe137, Mem[0000000030181408] = a8921e6e ffffffff
	stda	%l2,[%i6+%o4]0x81	! Mem[0000000030181408] = ffffffff ffffe137
!	%l2 = ffffffff, %l3 = ffffe137, Mem[0000000010081408] = e1000000 00000000
	stda	%l2,[%i2+%o4]0x80	! Mem[0000000010081408] = ffffffff ffffe137
!	%l6 = ffffffffffffffd1, Mem[0000000010181420] = 00000000, %asi = 80
	stha	%l6,[%i6+0x020]%asi	! Mem[0000000010181420] = ffd10000
!	Mem[0000000030001400] = 0000009c, %l2 = 00000000ffffffff
	swapa	[%i0+%g0]0x89,%l2	! %l2 = 000000000000009c
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = 00000000b53b879c, %l1 = 00000000000000ff
	ldxa	[%i3+%o5]0x80,%l1	! %l1 = 00000000b53b879c

p0_label_247:
!	Mem[0000000010101438] = 00000000, %l4 = 00000000ff0000ff
	lduwa	[%i4+0x038]%asi,%l4	! %l4 = 0000000000000000
!	Mem[0000000010001410] = 295bdcff, %f6  = 00e5ad35
	lda	[%i0+%o5]0x88,%f6 	! %f6 = 295bdcff
!	Mem[0000000010041400] = e13700ff, %l4 = 0000000000000000
	ldsha	[%i1+%g0]0x80,%l4	! %l4 = ffffffffffffe137
!	Mem[0000000021800140] = 00b52023, %l0 = 00000000d102b5ff
	lduh	[%o3+0x140],%l0		! %l0 = 00000000000000b5
	membar	#Sync			! Added by membar checker (58)
!	Mem[0000000030141400] = 00ffffff 1dffffff b8ffffff 00000000
!	Mem[0000000030141410] = ff0000ff ffffe137 3b1ed75a 1b41e871
!	Mem[0000000030141420] = 2723af57 bac23955 f2e25d08 99c1993d
!	Mem[0000000030141430] = 93ab8046 52e548c3 7403c892 43ca1dd3
	ldda	[%i5]ASI_BLK_AIUSL,%f0	! Block Load from 0000000030141400
!	Mem[0000000030141408] = b8ffffff 00000000, %l4 = ffffe137, %l5 = 9c873bb5
	ldda	[%i5+%o4]0x81,%l4	! %l4 = 00000000b8ffffff 0000000000000000
!	Mem[000000001008142c] = 00000000, %l1 = 00000000b53b879c
	ldsh	[%i2+0x02e],%l1		! %l1 = 0000000000000000
!	Mem[0000000010001400] = ff000000, %l4 = 00000000b8ffffff
	ldswa	[%i0+%g0]0x80,%l4	! %l4 = ffffffffff000000
!	Mem[0000000030001410] = 00e10000 ffff00ff, %l2 = 0000009c, %l3 = ffffe137
	ldda	[%i0+%o5]0x89,%l2	! %l2 = 00000000ffff00ff 0000000000e10000
!	Starting 10 instruction Store Burst
!	Mem[0000000030181410] = 005fff00, %l5 = 0000000000000000
	ldstuba	[%i6+%o5]0x81,%l5	! %l5 = 00000000000000ff

p0_label_248:
!	%f30 = ff0000f2, Mem[0000000010001400] = 000000ff
	sta	%f30,[%i0+%g0]0x88	! Mem[0000000010001400] = ff0000f2
!	Mem[0000000020800040] = ffffb8ec, %l2 = 00000000ffff00ff
	ldstub	[%o1+0x040],%l2		! %l2 = 000000ff000000ff
!	%l0 = 00000000000000b5, Mem[00000000211c0000] = ffffa37b
	sth	%l0,[%o2+%g0]		! Mem[00000000211c0000] = 00b5a37b
!	%l2 = 000000ff, %l3 = 00e10000, Mem[0000000030081408] = ffffffd1 e1ffffff
	stda	%l2,[%i2+%o4]0x89	! Mem[0000000030081408] = 000000ff 00e10000
!	%f17 = 0000008f, Mem[0000000030041400] = 00000000
	sta	%f17,[%i1+%g0]0x81	! Mem[0000000030041400] = 0000008f
!	Mem[0000000030101410] = ff000000, %l5 = 0000000000000000
	swapa	[%i4+%o5]0x81,%l5	! %l5 = 00000000ff000000
!	Mem[0000000030081400] = 00000000, %l5 = 00000000ff000000
	ldstuba	[%i2+%g0]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010041410] = d102b5cd, %l1 = 0000000000000000
	swapa	[%i1+%o5]0x80,%l1	! %l1 = 00000000d102b5cd
!	%l4 = ffffffffff000000, Mem[0000000030081400] = 000000ff
	stha	%l4,[%i2+%g0]0x89	! Mem[0000000030081400] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = 000000000000ff00, %l1 = 00000000d102b5cd
	ldxa	[%i5+%o4]0x88,%l1	! %l1 = 000000000000ff00

p0_label_249:
!	Mem[0000000010081410] = ffffffffff0000ff, %f18 = 0000ffff 9c873bb5
	ldda	[%i2+%o5]0x88,%f18	! %f18 = ffffffff ff0000ff
!	Mem[00000000100c1410] = 00000000b53b879c, %l5 = 0000000000000000
	ldxa	[%i3+%o5]0x80,%l5	! %l5 = 00000000b53b879c
!	Mem[0000000010081400] = d1ffffff, %l1 = 000000000000ff00
	ldsba	[%i2+%g0]0x88,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010181410] = 00ff5f00 cdb502ff, %l2 = 000000ff, %l3 = 00e10000
	ldda	[%i6+%o5]0x88,%l2	! %l2 = 00000000cdb502ff 0000000000ff5f00
!	Mem[00000000218000c0] = 00ffd561, %l6 = ffffffffffffffd1
	ldub	[%o3+0x0c0],%l6		! %l6 = 0000000000000000
!	Mem[0000000030001408] = 00000000, %l0 = 00000000000000b5
	lduha	[%i0+%o4]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000030141400] = ffffff00, %f29 = 1dffffff
	lda	[%i5+%g0]0x89,%f29	! %f29 = ffffff00
!	Mem[0000000030141400] = 00ffffff, %l0 = 0000000000000000
	ldswa	[%i5+%g0]0x81,%l0	! %l0 = 0000000000ffffff
!	Mem[0000000010041424] = 00000000, %l1 = ffffffffffffffff
	lduha	[%i1+0x024]%asi,%l1	! %l1 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010081408] = ffffffff, %l2 = 00000000cdb502ff
	ldstuba	[%i2+%o4]0x88,%l2	! %l2 = 000000ff000000ff

p0_label_250:
!	%f26 = 68e6ff57 d6fa8c51, Mem[0000000010001408] = 000000ff e13700ff
	std	%f26,[%i0+%o4]	! Mem[0000000010001408] = 68e6ff57 d6fa8c51
!	%l3 = 0000000000ff5f00, Mem[00000000300c1408] = 0000000000008ae1
	stxa	%l3,[%i3+%o4]0x89	! Mem[00000000300c1408] = 0000000000ff5f00
!	%f20 = d102b5cd ff0000ff, %l4 = ffffffffff000000
!	Mem[0000000010101430] = 00000000ffffffff
	add	%i4,0x030,%g1
	stda	%f20,[%g1+%l4]ASI_PST8_P ! Mem[0000000010101430] = 00000000ffffffff
!	%f22 = b1ac8a3b 1da45bae, Mem[0000000010181408] = 00000000 00ff0000
	stda	%f22,[%i6+%o4]0x88	! Mem[0000000010181408] = b1ac8a3b 1da45bae
!	Mem[0000000030141410] = ff0000ff, %l6 = 0000000000000000
	swapa	[%i5+%o5]0x81,%l6	! %l6 = 00000000ff0000ff
!	Mem[0000000010081400] = ffffffd1, %l0 = 0000000000ffffff
	ldstuba	[%i2+%g0]0x80,%l0	! %l0 = 000000ff000000ff
!	%l3 = 0000000000ff5f00, Mem[00000000300c1400] = 13978a51
	stwa	%l3,[%i3+%g0]0x89	! Mem[00000000300c1400] = 00ff5f00
!	%l6 = ff0000ff, %l7 = e1ffffff, Mem[0000000010101410] = ffff0000 ffff00ff
	stda	%l6,[%i4+%o5]0x80	! Mem[0000000010101410] = ff0000ff e1ffffff
!	Mem[000000001018140a] = ae5ba41d, %l0 = 00000000000000ff
	ldstuba	[%i6+0x00a]%asi,%l0	! %l0 = 000000a4000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = 00ff5f00, %l1 = 0000000000000000
	ldswa	[%i3+%o4]0x89,%l1	! %l1 = 0000000000ff5f00

!	Check Point 50 for processor 0

	set	p0_check_pt_data_50,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 00000000000000a4
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 0000000000ff5f00
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l4,%g2			! %l4 = ffffffffff000000
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l5,%g2			! %l5 = 00000000b53b879c
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l6,%g2			! %l6 = 00000000ff0000ff
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x38],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = ffffff1d ffffff00
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x40],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = 00000000 ffffffb8
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x48],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 37e1ffff ff0000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x50],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 71e8411b 5ad71e3b
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x58],%g3
	std	%f8,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f8 = 5539c2ba 57af2327
	bne	%xcc,p0_freg_check_fail
	mov	0xf08,%g1
	ldx	[%g4+0x60],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = 3d99c199 085de2f2
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x68],%g3
	std	%f12,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f12 = c348e552 4680ab93
	bne	%xcc,p0_freg_check_fail
	mov	0xf12,%g1
	ldx	[%g4+0x70],%g3
	std	%f14,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f14 = d31dca43 92c80374
	bne	%xcc,p0_freg_check_fail
	mov	0xf14,%g1
	ldx	[%g4+0x78],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = ffffffff ff0000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1
	ldx	[%g4+0x80],%g3
	std	%f28,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f28 = 0e510fed ffffff00
	bne	%xcc,p0_freg_check_fail
	mov	0xf28,%g1

!	Check Point 50 completed


p0_label_251:
!	Mem[0000000030141408] = b8ffffff00000000, %f22 = b1ac8a3b 1da45bae
	ldda	[%i5+%o4]0x81,%f22	! %f22 = b8ffffff 00000000
!	Mem[0000000010001420] = 00000000e1373dff, %f4  = 37e1ffff ff0000ff
	ldda	[%i0+0x020]%asi,%f4 	! %f4  = 00000000 e1373dff
!	Mem[0000000010081420] = 518cfad6, %l5 = 00000000b53b879c
	ldswa	[%i2+0x020]%asi,%l5	! %l5 = 00000000518cfad6
!	Mem[00000000211c0000] = 00b5a37b, %l6 = 00000000ff0000ff
	lduha	[%o2+0x000]%asi,%l6	! %l6 = 00000000000000b5
!	Mem[0000000010081400] = d1ffffff, %l1 = 0000000000ff5f00
	ldsha	[%i2+%g0]0x88,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000030141410] = 00000000ffffe137, %l2 = 00000000000000ff
	ldxa	[%i5+%o5]0x81,%l2	! %l2 = 00000000ffffe137
!	Mem[0000000010081428] = 3d78000000000000, %l3 = 0000000000ff5f00
	ldxa	[%i2+0x028]%asi,%l3	! %l3 = 3d78000000000000
!	Mem[000000001000140c] = d6fa8c51, %l4 = ffffffffff000000
	ldsba	[%i0+0x00e]%asi,%l4	! %l4 = ffffffffffffff8c
!	Mem[00000000100c1410] = 00000000, %l4 = ffffffffffffff8c
	lduwa	[%i3+%o5]0x80,%l4	! %l4 = 0000000000000000
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (59)
!	%l6 = 00000000000000b5, Mem[0000000030141408] = 00000000ffffffb8
	stxa	%l6,[%i5+%o4]0x89	! Mem[0000000030141408] = 00000000000000b5

p0_label_252:
!	%l1 = ffffffffffffffff, Mem[0000000030081408] = 000000ff
	stba	%l1,[%i2+%o4]0x89	! Mem[0000000030081408] = 000000ff
!	%l4 = 00000000, %l5 = 518cfad6, Mem[0000000010001428] = a8921e6e 0e510fed
	stda	%l4,[%i0+0x028]%asi	! Mem[0000000010001428] = 00000000 518cfad6
!	Mem[00000000218000c0] = 00ffd561, %l6 = 00000000000000b5
	ldstuba	[%o3+0x0c0]%asi,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010141408] = 00ff0000, %l1 = ffffffffffffffff
	ldstuba	[%i5+%o4]0x80,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010041408] = 0000ffff, %l7 = 00000000e1ffffff
	swapa	[%i1+%o4]0x80,%l7	! %l7 = 000000000000ffff
!	%l3 = 3d78000000000000, Mem[0000000030101410] = 00000000
	stha	%l3,[%i4+%o5]0x89	! Mem[0000000030101410] = 00000000
!	Mem[0000000010001408] = 68e6ff57, %l3 = 3d78000000000000
	swapa	[%i0+%o4]0x80,%l3	! %l3 = 0000000068e6ff57
!	Mem[0000000010001400] = ff0000f2, %l3 = 0000000068e6ff57
	ldstuba	[%i0+%g0]0x88,%l3	! %l3 = 000000f2000000ff
!	Mem[000000001014143b] = 965c37e1, %l3 = 00000000000000f2
	ldstuba	[%i5+0x03b]%asi,%l3	! %l3 = 000000e1000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = ffff0000, %l7 = 000000000000ffff
	ldsha	[%i5+%o4]0x80,%l7	! %l7 = ffffffffffffffff

p0_label_253:
!	Mem[0000000030101400] = 3bb502d1295bdcc7, %f0  = ffffff1d ffffff00
	ldda	[%i4+%g0]0x81,%f0 	! %f0  = 3bb502d1 295bdcc7
!	Mem[0000000010141420] = c134af67000000ff, %f10 = 3d99c199 085de2f2
	ldd	[%i5+0x020],%f10	! %f10 = c134af67 000000ff
!	Mem[0000000030141410] = 00000000, %l0 = 00000000000000a4
	lduba	[%i5+%o5]0x89,%l0	! %l0 = 0000000000000000
!	%l6 = 0000000000000000, Mem[0000000030081410] = e1ffffff
	stha	%l6,[%i2+%o5]0x89	! Mem[0000000030081410] = e1ff0000
!	Mem[0000000010141400] = d102b5ff, %f11 = 000000ff
	lda	[%i5+%g0]0x88,%f11	! %f11 = d102b5ff
!	Mem[00000000100c1410] = 00000000, %l3 = 00000000000000e1
	lduwa	[%i3+%o5]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000030001400] = ffffffff, %f29 = ffffff00
	lda	[%i0+%g0]0x81,%f29	! %f29 = ffffffff
!	Mem[00000000100c1400] = e5000000ff000000, %l3 = 0000000000000000
	ldxa	[%i3+%g0]0x88,%l3	! %l3 = e5000000ff000000
!	Mem[0000000010081428] = 3d78000000000000, %f24 = 000006ff e18a5c96
	ldda	[%i2+0x028]%asi,%f24	! %f24 = 3d780000 00000000
!	Starting 10 instruction Store Burst
!	%f4  = 00000000, Mem[0000000030081408] = 000000ff
	sta	%f4 ,[%i2+%o4]0x89	! Mem[0000000030081408] = 00000000

p0_label_254:
!	Mem[000000001010140b] = b53b879c, %l4 = 0000000000000000
	ldstuba	[%i4+0x00b]%asi,%l4	! %l4 = 0000009c000000ff
!	%f6  = 71e8411b 5ad71e3b, Mem[0000000010101418] = 001d0000 e1373d37
	std	%f6 ,[%i4+0x018]	! Mem[0000000010101418] = 71e8411b 5ad71e3b
!	%l2 = ffffe137, %l3 = ff000000, Mem[0000000010181408] = ae5bff1d 3b8aacb1
	stda	%l2,[%i6+%o4]0x80	! Mem[0000000010181408] = ffffe137 ff000000
!	%l7 = ffffffffffffffff, Mem[0000000030081400] = 00000000
	stba	%l7,[%i2+%g0]0x81	! Mem[0000000030081400] = ff000000
!	%l1 = 0000000000000000, Mem[0000000010181410] = ff02b5cd005fff00
	stxa	%l1,[%i6+%o5]0x80	! Mem[0000000010181410] = 0000000000000000
!	Mem[0000000030181400] = e5000000 0000e137 ffffffff ffffe137
!	Mem[0000000030181410] = ff5fff00 783d37e1 b1ac8a3b 1da45bae
!	Mem[0000000030181420] = d96af809 948a6312 9c8971bc d6fa8c51
!	Mem[0000000030181430] = 250c8aa7 956266fb ce75fb64 a19e6944
	ldda	[%i6]ASI_BLK_AIUS,%f0	! Block Load from 0000000030181400
!	Mem[0000000030141408] = 000000b5, %l4 = 000000000000009c
	swapa	[%i5+%o4]0x89,%l4	! %l4 = 00000000000000b5
!	%l1 = 0000000000000000, Mem[00000000100c1408] = 00000000
	stwa	%l1,[%i3+%o4]0x88	! Mem[00000000100c1408] = 00000000
!	Mem[0000000010101410] = ff0000ff, %l3 = e5000000ff000000
	ldstuba	[%i4+%o5]0x80,%l3	! %l3 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081438] = 965c3757b1cdff00, %f20 = d102b5cd ff0000ff
	ldda	[%i2+0x038]%asi,%f20	! %f20 = 965c3757 b1cdff00

p0_label_255:
!	Mem[00000000100c1428] = 3dff000037e10000, %f20 = 965c3757 b1cdff00
	ldd	[%i3+0x028],%f20	! %f20 = 3dff0000 37e10000
!	Mem[0000000010081408] = ffffffffffffe137, %f16 = e13700ff 0000008f
	ldda	[%i2+%o4]0x80,%f16	! %f16 = ffffffff ffffe137
!	Mem[0000000010181404] = 35ade5ff, %l0 = 0000000000000000
	lduw	[%i6+0x004],%l0		! %l0 = 0000000035ade5ff
!	Mem[00000000300c1400] = 00ff5f0000ff5f00, %f24 = 3d780000 00000000
	ldda	[%i3+%g0]0x89,%f24	! %f24 = 00ff5f00 00ff5f00
!	Mem[0000000010141438] = 965c37ff, %l6 = 0000000000000000
	ldsw	[%i5+0x038],%l6		! %l6 = ffffffff965c37ff
!	Mem[0000000010001400] = ff0000ff, %l4 = 00000000000000b5
	lduha	[%i0+%g0]0x80,%l4	! %l4 = 000000000000ff00
!	Mem[00000000201c0000] = 0000851d, %l6 = ffffffff965c37ff
	ldub	[%o0+0x001],%l6		! %l6 = 0000000000000000
!	Mem[0000000010101408] = b53b87ff0000e137, %l5 = 00000000518cfad6
	ldx	[%i4+%o4],%l5		! %l5 = b53b87ff0000e137
!	Mem[0000000030101410] = 00000000ed0f510e, %l6 = 0000000000000000
	ldxa	[%i4+%o5]0x81,%l6	! %l6 = 00000000ed0f510e
!	Starting 10 instruction Store Burst
!	Mem[0000000010081400] = d1ffffff, %l3 = 00000000000000ff
	swapa	[%i2+%g0]0x88,%l3	! %l3 = 00000000d1ffffff

!	Check Point 51 for processor 0

	set	p0_check_pt_data_51,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 0000000035ade5ff
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 0000000000000000
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 00000000ffffe137
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 00000000d1ffffff
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 000000000000ff00
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = b53b87ff0000e137
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 00000000ed0f510e
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = ffffffffffffffff
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = e5000000 0000e137
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x50],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = ffffffff ffffe137
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x58],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = ff5fff00 783d37e1
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x60],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = b1ac8a3b 1da45bae
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x68],%g3
	std	%f8,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f8 = d96af809 948a6312
	bne	%xcc,p0_freg_check_fail
	mov	0xf08,%g1
	ldx	[%g4+0x70],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = 9c8971bc d6fa8c51
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x78],%g3
	std	%f12,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f12 = 250c8aa7 956266fb
	bne	%xcc,p0_freg_check_fail
	mov	0xf12,%g1
	ldx	[%g4+0x80],%g3
	std	%f14,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f14 = ce75fb64 a19e6944
	bne	%xcc,p0_freg_check_fail
	mov	0xf14,%g1
	ldx	[%g4+0x88],%g3
	std	%f16,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f16 = ffffffff ffffe137
	bne	%xcc,p0_freg_check_fail
	mov	0xf16,%g1
	ldx	[%g4+0x90],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = 3dff0000 37e10000
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1
	ldx	[%g4+0x98],%g3
	std	%f22,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f22 = b8ffffff 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf22,%g1
	ldx	[%g4+0xa0],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = 00ff5f00 00ff5f00
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1
	ldx	[%g4+0xa8],%g3
	std	%f28,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f28 = 0e510fed ffffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf28,%g1

!	Check Point 51 completed


p0_label_256:
!	Mem[0000000030001400] = ffffffff, %l0 = 0000000035ade5ff
	swapa	[%i0+%g0]0x89,%l0	! %l0 = 00000000ffffffff
!	Mem[0000000010181428] = 00000000, %l3 = 00000000d1ffffff
	swap	[%i6+0x028],%l3		! %l3 = 0000000000000000
!	Mem[0000000010101408] = b53b87ff, %l1 = 0000000000000000
	swapa	[%i4+%o4]0x80,%l1	! %l1 = 00000000b53b87ff
!	%l4 = 000000000000ff00, Mem[0000000010081410] = ff0000ff
	stwa	%l4,[%i2+%o5]0x80	! Mem[0000000010081410] = 0000ff00
!	Mem[0000000030101400] = 3bb502d1, %l4 = 000000000000ff00
	ldstuba	[%i4+%g0]0x81,%l4	! %l4 = 0000003b000000ff
!	%f20 = 3dff0000, Mem[000000001014141c] = d102b5cd
	sta	%f20,[%i5+0x01c]%asi	! Mem[000000001014141c] = 3dff0000
!	Mem[00000000300c1408] = 00ff5f00, %l1 = 00000000b53b87ff
	swapa	[%i3+%o4]0x89,%l1	! %l1 = 0000000000ff5f00
!	%l2 = 00000000ffffe137, Mem[0000000030101408] = b855c8ff
	stwa	%l2,[%i4+%o4]0x89	! Mem[0000000030101408] = ffffe137
	membar	#Sync			! Added by membar checker (60)
!	%f20 = 3dff0000 37e10000, %l2 = 00000000ffffe137
!	Mem[0000000030181430] = 250c8aa7956266fb
	add	%i6,0x030,%g1
	stda	%f20,[%g1+%l2]ASI_PST32_SL ! Mem[0000000030181430] = 0000e1370000ff3d
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = 37e10000000000e5, %f14 = ce75fb64 a19e6944
	ldda	[%i6+%g0]0x89,%f14	! %f14 = 37e10000 000000e5

p0_label_257:
!	Mem[0000000010041408] = e1ffffff, %l0 = 00000000ffffffff
	lduha	[%i1+%o4]0x80,%l0	! %l0 = 000000000000e1ff
!	Mem[00000000300c1400] = 00ff5f00, %l5 = b53b87ff0000e137
	ldswa	[%i3+%g0]0x89,%l5	! %l5 = 0000000000ff5f00
!	Mem[00000000100c1410] = 00000000, %l5 = 0000000000ff5f00
	ldsba	[%i3+%o5]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000030181408] = 37e1ffff ffffffff, %l4 = 0000003b, %l5 = 00000000
	ldda	[%i6+%o4]0x89,%l4	! %l4 = 00000000ffffffff 0000000037e1ffff
!	Mem[0000000030181408] = 37e1ffffffffffff, %l3 = 0000000000000000
	ldxa	[%i6+%o4]0x89,%l3	! %l3 = 37e1ffffffffffff
!	Mem[0000000010081410] = 00ff0000, %l7 = ffffffffffffffff
	lduha	[%i2+%o5]0x88,%l7	! %l7 = 0000000000000000
!	Mem[00000000100c1400] = 000000ff000000e5, %l0 = 000000000000e1ff
	ldxa	[%i3+0x000]%asi,%l0	! %l0 = 000000ff000000e5
!	Mem[0000000010141400] = 000000ff d102b5ff, %l4 = ffffffff, %l5 = 37e1ffff
	ldda	[%i5+%g0]0x88,%l4	! %l4 = 00000000d102b5ff 00000000000000ff
!	Mem[0000000010141400] = ffb502d1, %l6 = 00000000ed0f510e
	ldswa	[%i5+%g0]0x80,%l6	! %l6 = ffffffffffb502d1
!	Starting 10 instruction Store Burst
!	%l2 = 00000000ffffe137, Mem[0000000030001400] = 35ade5ff
	stba	%l2,[%i0+%g0]0x89	! Mem[0000000030001400] = 35ade537

p0_label_258:
!	Mem[0000000030181400] = 000000e5, %l4 = 00000000d102b5ff
	swapa	[%i6+%g0]0x89,%l4	! %l4 = 00000000000000e5
!	%f16 = ffffffff ffffe137, %l3 = 37e1ffffffffffff
!	Mem[0000000030141408] = 9c00000000000000
	add	%i5,0x008,%g1
	stda	%f16,[%g1+%l3]ASI_PST16_S ! Mem[0000000030141408] = ffffffffffffe137
!	Mem[0000000030081408] = 00000000, %l0 = 000000ff000000e5
	ldstuba	[%i2+%o4]0x81,%l0	! %l0 = 00000000000000ff
!	%l0 = 0000000000000000, Mem[0000000010081428] = 3d78000000000000, %asi = 80
	stxa	%l0,[%i2+0x028]%asi	! Mem[0000000010081428] = 0000000000000000
!	Mem[00000000218001c0] = 00d36d36, %l4 = 00000000000000e5
	ldstuba	[%o3+0x1c0]%asi,%l4	! %l4 = 00000000000000ff
!	%l1 = 0000000000ff5f00, Mem[00000000300c1408] = ff873bb500000000
	stxa	%l1,[%i3+%o4]0x81	! Mem[00000000300c1408] = 0000000000ff5f00
!	%f15 = 000000e5, Mem[0000000030141408] = ffffffff
	sta	%f15,[%i5+%o4]0x89	! Mem[0000000030141408] = 000000e5
!	%l5 = 00000000000000ff, Mem[0000000030101408] = ffffe137
	stha	%l5,[%i4+%o4]0x89	! Mem[0000000030101408] = ffff00ff
!	Mem[0000000030041400] = 0000008f, %l1 = 0000000000ff5f00
	swapa	[%i1+%g0]0x81,%l1	! %l1 = 000000000000008f
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = 295bdcff, %l5 = 00000000000000ff
	lduwa	[%i0+%o5]0x88,%l5	! %l5 = 00000000295bdcff

p0_label_259:
!	Mem[0000000010041400] = e13700ff, %l7 = 0000000000000000
	lduba	[%i1+%g0]0x80,%l7	! %l7 = 00000000000000e1
!	%l1 = 000000000000008f, imm = 0000000000000106, %l5 = 00000000295bdcff
	or	%l1,0x106,%l5		! %l5 = 000000000000018f
!	Mem[0000000030141408] = 000000e5, %l6 = ffffffffffb502d1
	lduha	[%i5+%o4]0x89,%l6	! %l6 = 00000000000000e5
!	Mem[0000000030081410] = 0000ffe1, %f8  = d96af809
	lda	[%i2+%o5]0x81,%f8 	! %f8 = 0000ffe1
!	Mem[0000000010001408] = 00000000, %l2 = 00000000ffffe137
	ldswa	[%i0+%o4]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000010001408] = 00000000, %l7 = 00000000000000e1
	ldsha	[%i0+%o4]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000010081408] = ffffffff, %l0 = 0000000000000000
	lduba	[%i2+%o4]0x80,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010081418] = 000000000000ff00, %l2 = 0000000000000000
	ldx	[%i2+0x018],%l2		! %l2 = 000000000000ff00
!	Mem[0000000030181400] = ffb502d1, %l6 = 00000000000000e5
	ldsha	[%i6+%g0]0x81,%l6	! %l6 = ffffffffffffffb5
!	Starting 10 instruction Store Burst
!	%l0 = 00000000000000ff, Mem[0000000010181410] = 00000000
	stba	%l0,[%i6+%o5]0x80	! Mem[0000000010181410] = ff000000

p0_label_260:
!	Mem[0000000030081410] = e1ff0000, %l1 = 000000000000008f
	ldstuba	[%i2+%o5]0x89,%l1	! %l1 = 00000000000000ff
!	%l6 = ffffffffffffffb5, Mem[0000000010081400] = 000000ff
	stha	%l6,[%i2+%g0]0x88	! Mem[0000000010081400] = 0000ffb5
!	%l3 = 37e1ffffffffffff, Mem[0000000010181420] = ffd1000000000000
	stx	%l3,[%i6+0x020]		! Mem[0000000010181420] = 37e1ffffffffffff
!	Mem[0000000030181400] = ffb502d1, %l7 = 0000000000000000
	ldstuba	[%i6+%g0]0x81,%l7	! %l7 = 000000ff000000ff
!	Mem[0000000030001400] = 35ade537, %l1 = 0000000000000000
	ldstuba	[%i0+%g0]0x89,%l1	! %l1 = 00000037000000ff
!	%l1 = 0000000000000037, Mem[00000000211c0001] = 00b5a37b, %asi = 80
	stba	%l1,[%o2+0x001]%asi	! Mem[00000000211c0000] = 0037a37b
!	Mem[0000000010041408] = e1ffffff, %l7 = 00000000000000ff
	swapa	[%i1+%o4]0x80,%l7	! %l7 = 00000000e1ffffff
!	%l0 = 00000000000000ff, Mem[00000000100c1412] = 00000000
	sth	%l0,[%i3+0x012]		! Mem[00000000100c1410] = 000000ff
!	%l7 = 00000000e1ffffff, Mem[00000000100c1410] = 000000ff
	stwa	%l7,[%i3+%o5]0x80	! Mem[00000000100c1410] = e1ffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000020800000] = ff009984, %l2 = 000000000000ff00
	lduba	[%o1+0x000]%asi,%l2	! %l2 = 00000000000000ff

!	Check Point 52 for processor 0

	set	p0_check_pt_data_52,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 0000000000000037
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 37e1ffffffffffff
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 0000000000000000
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 000000000000018f
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = ffffffffffffffb5
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 00000000e1ffffff
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = ff5fff00 783d37e1
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x50],%g3
	std	%f8,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f8 = 0000ffe1 948a6312
	bne	%xcc,p0_freg_check_fail
	mov	0xf08,%g1
	ldx	[%g4+0x58],%g3
	std	%f14,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f14 = 37e10000 000000e5
	bne	%xcc,p0_freg_check_fail
	mov	0xf14,%g1

!	Check Point 52 completed


p0_label_261:
!	Mem[0000000030041400] = 005fff00, %l0 = 00000000000000ff
	ldsha	[%i1+%g0]0x89,%l0	! %l0 = ffffffffffffff00
!	Mem[0000000010181410] = 000000ff, %f8  = 0000ffe1
	lda	[%i6+%o5]0x88,%f8 	! %f8 = 000000ff
!	Mem[0000000010041420] = 000006ff00000000, %f18 = ffffffff ff0000ff
	ldda	[%i1+0x020]%asi,%f18	! %f18 = 000006ff 00000000
!	Mem[0000000010081430] = 00000000000000e1, %f30 = ff0000f2 a19e6944
	ldda	[%i2+0x030]%asi,%f30	! %f30 = 00000000 000000e1
!	Mem[0000000030041400] = 00ff5f00, %l6 = ffffffffffffffb5
	ldswa	[%i1+%g0]0x81,%l6	! %l6 = 0000000000ff5f00
!	Mem[0000000030081410] = e1ff00ff, %l7 = 00000000e1ffffff
	lduba	[%i2+%o5]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010141414] = ff0000ff, %l2 = 00000000000000ff
	ldsha	[%i5+0x016]%asi,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010081408] = ffffffff, %l1 = 0000000000000037
	lduwa	[%i2+%o4]0x80,%l1	! %l1 = 00000000ffffffff
!	Mem[0000000010141428] = a8921e6e, %l3 = 37e1ffffffffffff
	lduha	[%i5+0x028]%asi,%l3	! %l3 = 000000000000a892
!	Starting 10 instruction Store Burst
!	%l6 = 0000000000ff5f00, Mem[0000000010001410] = ffdc5b29b53b879c
	stx	%l6,[%i0+%o5]		! Mem[0000000010001410] = 0000000000ff5f00

p0_label_262:
!	%l5 = 000000000000018f, Mem[0000000010101400] = af670000
	stw	%l5,[%i4+%g0]		! Mem[0000000010101400] = 0000018f
!	%f24 = 00ff5f00 00ff5f00, %l1 = 00000000ffffffff
!	Mem[0000000010141430] = 0e510fedf2e200f8
	add	%i5,0x030,%g1
	stda	%f24,[%g1+%l1]ASI_PST16_PL ! Mem[0000000010141430] = 005fff00005fff00
!	%f20 = 3dff0000 37e10000, Mem[0000000010181400] = ff0f510e 35ade5ff
	stda	%f20,[%i6+%g0]0x80	! Mem[0000000010181400] = 3dff0000 37e10000
!	%l2 = 00000000000000ff, Mem[0000000030141400] = ffffff00
	stba	%l2,[%i5+%g0]0x89	! Mem[0000000030141400] = ffffffff
!	%l2 = 00000000000000ff, Mem[0000000010041408] = 000000ff
	stwa	%l2,[%i1+%o4]0x80	! Mem[0000000010041408] = 000000ff
!	%f16 = ffffffff, Mem[0000000010001408] = 00000000
	sta	%f16,[%i0+%o4]0x80	! Mem[0000000010001408] = ffffffff
!	%l3 = 000000000000a892, Mem[0000000010141408] = 0000ffff
	stba	%l3,[%i5+%o4]0x88	! Mem[0000000010141408] = 0000ff92
!	Mem[0000000030081408] = 000000ff, %l5 = 000000000000018f
	ldstuba	[%i2+%o4]0x89,%l5	! %l5 = 000000ff000000ff
!	%l2 = 00000000000000ff, Mem[0000000010081410] = ffffffff00ff0000
	stxa	%l2,[%i2+%o5]0x88	! Mem[0000000010081410] = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010041420] = 000006ff00000000, %f8  = 000000ff 948a6312
	ldda	[%i1+0x020]%asi,%f8 	! %f8  = 000006ff 00000000

p0_label_263:
!	Mem[0000000010081430] = 00000000, %l4 = 0000000000000000
	ldsb	[%i2+0x032],%l4		! %l4 = 0000000000000000
!	Mem[00000000300c1408] = 00000000, %l2 = 00000000000000ff
	lduba	[%i3+%o4]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000010001418] = c7dc5b29, %l7 = 00000000000000ff
	ldsh	[%i0+0x01a],%l7		! %l7 = 0000000000005b29
!	Mem[0000000010081410] = ff000000, %l2 = 0000000000000000
	ldswa	[%i2+%o5]0x80,%l2	! %l2 = ffffffffff000000
!	Mem[0000000010081410] = ff000000, %l2 = ffffffffff000000
	lduwa	[%i2+%o5]0x80,%l2	! %l2 = 00000000ff000000
!	Mem[0000000030081400] = 000000ff, %l2 = 00000000ff000000
	lduwa	[%i2+%g0]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[00000000100c1400] = 000000ff000000e5, %l6 = 0000000000ff5f00
	ldxa	[%i3+%g0]0x80,%l6	! %l6 = 000000ff000000e5
!	Mem[0000000010001400] = ff0000ff000000ff, %l0 = ffffffffffffff00
	ldxa	[%i0+0x000]%asi,%l0	! %l0 = ff0000ff000000ff
!	Mem[00000000100c1410] = e1ffffff, %l5 = 00000000000000ff
	ldsha	[%i3+%o5]0x80,%l5	! %l5 = ffffffffffffe1ff
!	Starting 10 instruction Store Burst
!	%l1 = 00000000ffffffff, Mem[00000000201c0000] = 0000851d, %asi = 80
	stha	%l1,[%o0+0x000]%asi	! Mem[00000000201c0000] = ffff851d

p0_label_264:
!	%f16 = ffffffff ffffe137, Mem[0000000030081400] = 000000ff c7dc5b29
	stda	%f16,[%i2+%g0]0x89	! Mem[0000000030081400] = ffffffff ffffe137
!	Mem[0000000030101408] = ff00ffff, %l2 = 00000000000000ff
	ldstuba	[%i4+%o4]0x81,%l2	! %l2 = 000000ff000000ff
!	Mem[0000000020800041] = ffffb8ec, %l5 = ffffffffffffe1ff
	ldstuba	[%o1+0x041]%asi,%l5	! %l5 = 000000ff000000ff
!	%f30 = 00000000 000000e1, Mem[0000000030041410] = 000000ff 00ffff1d
	stda	%f30,[%i1+%o5]0x89	! Mem[0000000030041410] = 00000000 000000e1
!	%l7 = 0000000000005b29, Mem[0000000021800100] = a3ff5a3e, %asi = 80
	stha	%l7,[%o3+0x100]%asi	! Mem[0000000021800100] = 5b295a3e
!	%l5 = 00000000000000ff, Mem[0000000010081410] = 000000ff
	stwa	%l5,[%i2+%o5]0x88	! Mem[0000000010081410] = 000000ff
!	%l6 = 000000ff000000e5, Mem[0000000010181410] = 00000000000000ff
	stxa	%l6,[%i6+%o5]0x88	! Mem[0000000010181410] = 000000ff000000e5
!	Mem[0000000010081400] = b5ff0000, %l0 = ff0000ff000000ff
	swapa	[%i2+%g0]0x80,%l0	! %l0 = 00000000b5ff0000
!	%l2 = 000000ff, %l3 = 0000a892, Mem[0000000010081410] = ff000000 00000000
	stda	%l2,[%i2+%o5]0x80	! Mem[0000000010081410] = 000000ff 0000a892
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = ffffffff, %l5 = 00000000000000ff
	ldsha	[%i2+%o4]0x80,%l5	! %l5 = ffffffffffffffff

p0_label_265:
!	Mem[0000000030081410] = ff00ffe100000000, %l6 = 000000ff000000e5
	ldxa	[%i2+%o5]0x81,%l6	! %l6 = ff00ffe100000000
!	Mem[0000000010101408] = 000000000000e137, %f12 = 250c8aa7 956266fb
	ldda	[%i4+%o4]0x80,%f12	! %f12 = 00000000 0000e137
!	Mem[0000000010141400] = d102b5ff, %l3 = 000000000000a892
	ldsha	[%i5+%g0]0x88,%l3	! %l3 = ffffffffffffb5ff
!	Mem[0000000010041410] = 00000000, %l4 = 0000000000000000
	ldsba	[%i1+0x010]%asi,%l4	! %l4 = 0000000000000000
!	Mem[0000000030101408] = ffff00ff, %l2 = 00000000000000ff
	ldsha	[%i4+%o4]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030181410] = 00ff5fff, %l3 = ffffffffffffb5ff
	lduwa	[%i6+%o5]0x89,%l3	! %l3 = 0000000000ff5fff
!	Mem[0000000030141410] = 00000000, %l5 = ffffffffffffffff
	lduha	[%i5+%o5]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000010101438] = 00000000, %l7 = 0000000000005b29
	lduw	[%i4+0x038],%l7		! %l7 = 0000000000000000
!	Mem[0000000010141410] = 00000000, %l1 = 00000000ffffffff
	ldsba	[%i5+%o5]0x88,%l1	! %l1 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010141428] = a8921e6e, %l3 = 00ff5fff, %l1 = 00000000
	add	%i5,0x28,%g1
	casa	[%g1]0x80,%l3,%l1	! %l1 = 00000000a8921e6e

!	Check Point 53 for processor 0

	set	p0_check_pt_data_53,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 00000000b5ff0000
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 00000000a8921e6e
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 0000000000ff5fff
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
	cmp	%l6,%g2			! %l6 = ff00ffe100000000
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 0000000000000000
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f8,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f8 = 000006ff 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf08,%g1
	ldx	[%g4+0x50],%g3
	std	%f12,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f12 = 00000000 0000e137
	bne	%xcc,p0_freg_check_fail
	mov	0xf12,%g1
	ldx	[%g4+0x58],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = 000006ff 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1
	ldx	[%g4+0x60],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = 00000000 000000e1
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 53 completed


p0_label_266:
!	%l1 = 00000000a8921e6e, Mem[0000000010001408] = ffffffff
	stba	%l1,[%i0+%o4]0x88	! Mem[0000000010001408] = ffffff6e
!	%f2  = ffffffff ffffe137, Mem[0000000030181410] = 00ff5fff e1373d78
	stda	%f2 ,[%i6+%o5]0x89	! Mem[0000000030181410] = ffffffff ffffe137
!	%f24 = 00ff5f00 00ff5f00, %l1 = 00000000a8921e6e
!	Mem[0000000030141428] = f2e25d0899c1993d
	add	%i5,0x028,%g1
	stda	%f24,[%g1+%l1]ASI_PST32_SL ! Mem[0000000030141428] = f2e25d08005fff00
!	%l0 = 00000000b5ff0000, Mem[0000000010001400] = ff0000ff
	stwa	%l0,[%i0+%g0]0x80	! Mem[0000000010001400] = b5ff0000
!	%l5 = 0000000000000000, Mem[0000000030001410] = ffff00ff
	stba	%l5,[%i0+%o5]0x89	! Mem[0000000030001410] = ffff0000
!	%l4 = 0000000000000000, Mem[0000000030081410] = ff00ffe1
	stwa	%l4,[%i2+%o5]0x81	! Mem[0000000030081410] = 00000000
!	Mem[0000000030141410] = 00000000, %l2 = 00000000000000ff
	ldstuba	[%i5+%o5]0x81,%l2	! %l2 = 00000000000000ff
!	Mem[00000000211c0000] = 0037a37b, %l7 = 0000000000000000
	ldstuba	[%o2+0x000]%asi,%l7	! %l7 = 00000000000000ff
!	%l3 = 0000000000ff5fff, Mem[0000000030001400] = ffe5ad35
	stwa	%l3,[%i0+%g0]0x81	! Mem[0000000030001400] = 00ff5fff
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = e1373dff ffff00ff, %l2 = 00000000, %l3 = 00ff5fff
	ldda	[%i4+%o4]0x89,%l2	! %l2 = 00000000ffff00ff 00000000e1373dff

p0_label_267:
!	Mem[0000000010141410] = 00000000, %l5 = 0000000000000000
	ldsba	[%i5+%o5]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000010181408] = ffffe137, %l1 = 00000000a8921e6e
	lduba	[%i6+%o4]0x80,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010081408] = ffffffff, %f26 = 68e6ff57
	lda	[%i2+%o4]0x88,%f26	! %f26 = ffffffff
!	Mem[00000000100c1418] = 00000000000000e5, %f26 = ffffffff d6fa8c51
	ldd	[%i3+0x018],%f26	! %f26 = 00000000 000000e5
!	Mem[0000000030081400] = 37e1ffffffffffff, %l3 = 00000000e1373dff
	ldxa	[%i2+%g0]0x81,%l3	! %l3 = 37e1ffffffffffff
!	Mem[0000000030081408] = ff000000, %l3 = 37e1ffffffffffff
	ldsha	[%i2+%o4]0x81,%l3	! %l3 = ffffffffffffff00
!	Mem[00000000100c1430] = c34866ff, %l4 = 0000000000000000
	ldswa	[%i3+0x030]%asi,%l4	! %l4 = ffffffffc34866ff
!	Mem[0000000010001400] = 0000ffb5, %l5 = 0000000000000000
	lduha	[%i0+%g0]0x88,%l5	! %l5 = 000000000000ffb5
!	Mem[0000000010101410] = ff0000ff, %l0 = 00000000b5ff0000
	lduwa	[%i4+%o5]0x88,%l0	! %l0 = 00000000ff0000ff
!	Starting 10 instruction Store Burst
!	%l6 = 00000000, %l7 = 00000000, Mem[00000000300c1410] = ff0000ff d102b5cd
	stda	%l6,[%i3+%o5]0x89	! Mem[00000000300c1410] = 00000000 00000000

p0_label_268:
!	Mem[00000000300c1400] = 00ff5f00, %l5 = 000000000000ffb5
	ldstuba	[%i3+%g0]0x89,%l5	! %l5 = 00000000000000ff
!	%f14 = 37e10000 000000e5, %l6 = ff00ffe100000000
!	Mem[0000000030101408] = ff00ffffff3d37e1
	add	%i4,0x008,%g1
	stda	%f14,[%g1+%l6]ASI_PST16_S ! Mem[0000000030101408] = ff00ffffff3d37e1
!	%l4 = ffffffffc34866ff, Mem[0000000010001410] = 005fff0000000000
	stxa	%l4,[%i0+%o5]0x88	! Mem[0000000010001410] = ffffffffc34866ff
!	Mem[0000000010101400] = 8f010000, %l6 = ff00ffe100000000
	ldstuba	[%i4+%g0]0x88,%l6	! %l6 = 00000000000000ff
!	%l5 = 0000000000000000, Mem[0000000030001400] = ff000000ff5fff00
	stxa	%l5,[%i0+%g0]0x89	! Mem[0000000030001400] = 0000000000000000
!	%l7 = 0000000000000000, Mem[00000000300c1400] = 00ff5fff
	stha	%l7,[%i3+%g0]0x89	! Mem[00000000300c1400] = 00ff0000
!	Mem[0000000010181428] = d1ffffff, %l3 = ffffffffffffff00
	ldstuba	[%i6+0x028]%asi,%l3	! %l3 = 000000d1000000ff
!	%l0 = 00000000ff0000ff, Mem[000000001014141e] = 3dff0000
	sth	%l0,[%i5+0x01e]		! Mem[000000001014141c] = 3dff00ff
!	%l7 = 0000000000000000, Mem[00000000100c1420] = d700e1ff92c80374, %asi = 80
	stxa	%l7,[%i3+0x020]%asi	! Mem[00000000100c1420] = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = 00e10000ffff0000, %f6  = b1ac8a3b 1da45bae
	ldda	[%i0+%o5]0x89,%f6 	! %f6  = 00e10000 ffff0000

p0_label_269:
!	Mem[0000000010041408] = ff000000, %l7 = 0000000000000000
	lduwa	[%i1+%o4]0x88,%l7	! %l7 = 00000000ff000000
	membar	#Sync			! Added by membar checker (61)
!	Mem[0000000030141400] = ffffffff 1dffffff e5000000 ffffe137
!	Mem[0000000030141410] = ff000000 ffffe137 3b1ed75a 1b41e871
!	Mem[0000000030141420] = 2723af57 bac23955 f2e25d08 005fff00
!	Mem[0000000030141430] = 93ab8046 52e548c3 7403c892 43ca1dd3
	ldda	[%i5]ASI_BLK_AIUSL,%f0	! Block Load from 0000000030141400
!	Mem[00000000300c1410] = 00000000, %l4 = ffffffffc34866ff
	lduha	[%i3+%o5]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000010101434] = ffffffff, %l4 = 0000000000000000
	lduba	[%i4+0x035]%asi,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010141408] = 0000ff92, %l4 = 00000000000000ff
	lduwa	[%i5+%o4]0x88,%l4	! %l4 = 000000000000ff92
!	Mem[00000000300c1400] = 00ff5f0000ff0000, %l5 = 0000000000000000
	ldxa	[%i3+%g0]0x89,%l5	! %l5 = 00ff5f0000ff0000
!	Mem[0000000010001408] = 518cfad6ffffff6e, %f30 = 00000000 000000e1
	ldda	[%i0+%o4]0x88,%f30	! %f30 = 518cfad6 ffffff6e
!	Mem[0000000010101400] = ff00018f, %f21 = 37e10000
	lda	[%i4+%g0]0x80,%f21	! %f21 = ff00018f
!	Mem[000000001008141c] = 0000ff00, %l2 = 00000000ffff00ff
	ldsh	[%i2+0x01c],%l2		! %l2 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l0 = 00000000ff0000ff, Mem[0000000010101410] = ff0000ff
	stba	%l0,[%i4+%o5]0x88	! Mem[0000000010101410] = ff0000ff

p0_label_270:
!	Mem[0000000030101408] = ff00ffff, %l1 = 00000000000000ff
	ldstuba	[%i4+%o4]0x81,%l1	! %l1 = 000000ff000000ff
!	%f22 = b8ffffff 00000000, Mem[00000000300c1400] = 00ff0000 00ff5f00
	stda	%f22,[%i3+%g0]0x89	! Mem[00000000300c1400] = b8ffffff 00000000
!	Mem[00000000211c0001] = ff37a37b, %l4 = 000000000000ff92
	ldstuba	[%o2+0x001]%asi,%l4	! %l4 = 00000037000000ff
!	Mem[0000000010081410] = 000000ff, %l6 = 0000000000000000
	swap	[%i2+%o5],%l6		! %l6 = 00000000000000ff
!	Mem[000000001018143c] = f6060000, %l7 = 00000000ff000000, %asi = 80
	swapa	[%i6+0x03c]%asi,%l7	! %l7 = 00000000f6060000
!	%f30 = 518cfad6 ffffff6e, Mem[0000000010041400] = ff0037e1 8f000000
	stda	%f30,[%i1+%g0]0x88	! Mem[0000000010041400] = 518cfad6 ffffff6e
!	%f24 = 00ff5f00, Mem[0000000010101400] = ff00018f
	sta	%f24,[%i4+%g0]0x80	! Mem[0000000010101400] = 00ff5f00
!	Mem[0000000010141408] = 92ff0000, %l2 = 0000000000000000
	ldstuba	[%i5+0x008]%asi,%l2	! %l2 = 00000092000000ff
!	Mem[00000000100c1426] = 00000000, %l2 = 0000000000000092
	ldstuba	[%i3+0x026]%asi,%l2	! %l2 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = 00000000, %l5 = 00ff5f0000ff0000
	ldsha	[%i4+%o4]0x80,%l5	! %l5 = 0000000000000000

!	Check Point 54 for processor 0

	set	p0_check_pt_data_54,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 00000000ff0000ff
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
	cmp	%l3,%g2			! %l3 = 00000000000000d1
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 0000000000000037
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
	cmp	%l7,%g2			! %l7 = 00000000f6060000
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = ffffff1d ffffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x50],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = 37e1ffff 000000e5
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x58],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 37e1ffff 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x60],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 71e8411b 5ad71e3b
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x68],%g3
	std	%f8,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f8 = 5539c2ba 57af2327
	bne	%xcc,p0_freg_check_fail
	mov	0xf08,%g1
	ldx	[%g4+0x70],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = 00ff5f00 085de2f2
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x78],%g3
	std	%f12,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f12 = c348e552 4680ab93
	bne	%xcc,p0_freg_check_fail
	mov	0xf12,%g1
	ldx	[%g4+0x80],%g3
	std	%f14,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f14 = d31dca43 92c80374
	bne	%xcc,p0_freg_check_fail
	mov	0xf14,%g1
	ldx	[%g4+0x88],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = 3dff0000 ff00018f
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1
	ldx	[%g4+0x90],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = 00000000 000000e5
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1
	ldx	[%g4+0x98],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = 518cfad6 ffffff6e
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 54 completed


p0_label_271:
!	Mem[0000000010001430] = e1373d78ff0037e1, %l3 = 00000000000000d1
	ldx	[%i0+0x030],%l3		! %l3 = e1373d78ff0037e1
!	%l6 = 00000000000000ff, Mem[0000000010101432] = 00000000
	stb	%l6,[%i4+0x032]		! Mem[0000000010101430] = 0000ff00
!	Mem[0000000010001410] = c34866ff, %l0 = 00000000ff0000ff
	ldswa	[%i0+%o5]0x88,%l0	! %l0 = ffffffffc34866ff
!	Mem[0000000010181410] = e5000000, %l7 = 00000000f6060000
	ldsha	[%i6+%o5]0x80,%l7	! %l7 = ffffffffffffe500
!	Mem[0000000010101408] = 00000000, %l2 = 0000000000000000
	ldsha	[%i4+%o4]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000030101400] = ffb502d1, %l6 = 00000000000000ff
	lduba	[%i4+%g0]0x81,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010081408] = ffffffff, %l6 = 00000000000000ff
	ldsba	[%i2+%o4]0x88,%l6	! %l6 = ffffffffffffffff
!	Mem[00000000100c1410] = e1ffffffb53b879c, %l7 = ffffffffffffe500
	ldxa	[%i3+%o5]0x80,%l7	! %l7 = e1ffffffb53b879c
!	Mem[0000000010081400] = ff000000, %l1 = 00000000000000ff
	ldsba	[%i2+%g0]0x88,%l1	! %l1 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l6 = ffffffffffffffff, Mem[00000000300c1408] = 00000000
	stwa	%l6,[%i3+%o4]0x89	! Mem[00000000300c1408] = ffffffff

p0_label_272:
!	%f10 = 00ff5f00 085de2f2, %l3 = e1373d78ff0037e1
!	Mem[0000000030001438] = c9d57b32143a3a87
	add	%i0,0x038,%g1
	stda	%f10,[%g1+%l3]ASI_PST16_SL ! Mem[0000000030001438] = f2e27b32143a3a87
!	%f18 = 000006ff 00000000, %l1 = 0000000000000000
!	Mem[0000000030101428] = ffffffffd6fa8c51
	add	%i4,0x028,%g1
	stda	%f18,[%g1+%l1]ASI_PST8_SL ! Mem[0000000030101428] = ffffffffd6fa8c51
!	%l4 = 0000000000000037, Mem[00000000100c1408] = 0000000000ff0000
	stxa	%l4,[%i3+%o4]0x80	! Mem[00000000100c1408] = 0000000000000037
!	Mem[0000000030041410] = e1000000, %l5 = 0000000000000000
	swapa	[%i1+%o5]0x81,%l5	! %l5 = 00000000e1000000
!	%f4  = 37e1ffff 000000ff, Mem[00000000100c1428] = 3dff0000 37e10000
	stda	%f4 ,[%i3+0x028]%asi	! Mem[00000000100c1428] = 37e1ffff 000000ff
!	%l1 = 0000000000000000, Mem[0000000010041400] = 6effffffd6fa8c51
	stxa	%l1,[%i1+%g0]0x80	! Mem[0000000010041400] = 0000000000000000
!	%l6 = ffffffffffffffff, Mem[0000000030041400] = 005fff00
	stwa	%l6,[%i1+%g0]0x89	! Mem[0000000030041400] = ffffffff
!	%l6 = ffffffffffffffff, Mem[0000000010081401] = 000000ff, %asi = 80
	stba	%l6,[%i2+0x001]%asi	! Mem[0000000010081400] = 00ff00ff
!	Mem[0000000030041400] = ffffffff, %l7 = e1ffffffb53b879c
	swapa	[%i1+%g0]0x81,%l7	! %l7 = 00000000ffffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001424] = e1373dff, %l6 = ffffffffffffffff
	lduha	[%i0+0x026]%asi,%l6	! %l6 = 0000000000003dff

p0_label_273:
!	Mem[0000000030181408] = ffffffff, %l1 = 0000000000000000
	lduba	[%i6+%o4]0x81,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030141400] = ffffff1dffffffff, %f4  = 37e1ffff 000000ff
	ldda	[%i5+%g0]0x89,%f4 	! %f4  = ffffff1d ffffffff
!	Mem[0000000010041400] = 00000000, %l3 = e1373d78ff0037e1
	lduba	[%i1+%g0]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000030041410] = 00000000, %l6 = 0000000000003dff
	ldswa	[%i1+%o5]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000030101400] = d102b5ff, %l2 = 0000000000000000
	lduwa	[%i4+%g0]0x89,%l2	! %l2 = 00000000d102b5ff
!	Mem[0000000010141428] = a8921e6e518a9713, %f6  = 71e8411b 5ad71e3b
	ldd	[%i5+0x028],%f6 	! %f6  = a8921e6e 518a9713
!	Mem[0000000030181410] = 37e1ffff, %l4 = 0000000000000037
	ldswa	[%i6+%o5]0x81,%l4	! %l4 = 0000000037e1ffff
!	Mem[0000000010181408] = ffffe137ff000000, %f28 = 0e510fed ffffffff
	ldd	[%i6+%o4],%f28		! %f28 = ffffe137 ff000000
!	Mem[00000000100c1410] = 9c873bb5ffffffe1, %f12 = c348e552 4680ab93
	ldda	[%i3+%o5]0x88,%f12	! %f12 = 9c873bb5 ffffffe1
!	Starting 10 instruction Store Burst
!	%l4 = 0000000037e1ffff, Mem[0000000021800081] = ff7914cb
	stb	%l4,[%o3+0x081]		! Mem[0000000021800080] = ffff14cb

p0_label_274:
!	%l3 = 0000000000000000, Mem[0000000030081400] = ffffffffffffe137
	stxa	%l3,[%i2+%g0]0x89	! Mem[0000000030081400] = 0000000000000000
!	Mem[0000000010041408] = ff000000, %l1 = 00000000000000ff
	ldstuba	[%i1+%o4]0x88,%l1	! %l1 = 00000000000000ff
!	%l4 = 0000000037e1ffff, Mem[00000000100c1410] = e1ffffff
	stwa	%l4,[%i3+%o5]0x80	! Mem[00000000100c1410] = 37e1ffff
!	%l3 = 0000000000000000, Mem[00000000100c1410] = ffffe137
	stba	%l3,[%i3+%o5]0x88	! Mem[00000000100c1410] = ffffe100
!	Mem[0000000030141410] = ff000000, %l6 = 0000000000000000
	ldstuba	[%i5+%o5]0x81,%l6	! %l6 = 000000ff000000ff
!	%l7 = 00000000ffffffff, Mem[00000000300c1400] = 00000000
	stba	%l7,[%i3+%g0]0x89	! Mem[00000000300c1400] = 000000ff
!	Mem[00000000211c0000] = ffffa37b, %l7 = 00000000ffffffff
	ldstub	[%o2+%g0],%l7		! %l7 = 000000ff000000ff
!	%l5 = 00000000e1000000, Mem[00000000300c1408] = ffffffff
	stba	%l5,[%i3+%o4]0x89	! Mem[00000000300c1408] = ffffff00
!	Mem[0000000010081400] = ff00ff00, %l0 = ffffffffc34866ff
	ldstuba	[%i2+%g0]0x88,%l0	! %l0 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = 00000000, %l0 = 0000000000000000
	ldswa	[%i0+%o4]0x89,%l0	! %l0 = 0000000000000000

p0_label_275:
!	Mem[0000000010101428] = e13700ff, %l5 = 00000000e1000000
	lduha	[%i4+0x028]%asi,%l5	! %l5 = 000000000000e137
!	Mem[0000000030141400] = ffffffff, %l3 = 0000000000000000
	lduha	[%i5+%g0]0x81,%l3	! %l3 = 000000000000ffff
!	Mem[0000000030081400] = 00000000, %f6  = a8921e6e
	lda	[%i2+%g0]0x81,%f6 	! %f6 = 00000000
!	Mem[000000001014141c] = 3dff00ff, %l0 = 0000000000000000
	ldsha	[%i5+0x01c]%asi,%l0	! %l0 = 0000000000003dff
!	Mem[0000000030001400] = 00000000, %l5 = 000000000000e137
	ldsha	[%i0+%g0]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000010081414] = 0000a892, %l0 = 0000000000003dff
	ldsw	[%i2+0x014],%l0		! %l0 = 000000000000a892
!	Mem[0000000010041410] = 00000000, %f27 = 000000e5
	lda	[%i1+%o5]0x88,%f27	! %f27 = 00000000
!	Mem[0000000030141410] = 000000ff, %f26 = 00000000
	lda	[%i5+%o5]0x89,%f26	! %f26 = 000000ff
!	Mem[00000000300c1408] = 00ffffff00ff5f00, %l2 = 00000000d102b5ff
	ldxa	[%i3+%o4]0x81,%l2	! %l2 = 00ffffff00ff5f00
!	Starting 10 instruction Store Burst
!	%l7 = 00000000000000ff, Mem[00000000211c0000] = ffffa37b
	stb	%l7,[%o2+%g0]		! Mem[00000000211c0000] = ffffa37b

!	Check Point 55 for processor 0

	set	p0_check_pt_data_55,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 000000000000a892
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 0000000000000000
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 00ffffff00ff5f00
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 000000000000ffff
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 0000000037e1ffff
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
	cmp	%l7,%g2			! %l7 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = ffffff1d ffffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x50],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 00000000 518a9713
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x58],%g3
	std	%f12,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f12 = 9c873bb5 ffffffe1
	bne	%xcc,p0_freg_check_fail
	mov	0xf12,%g1
	ldx	[%g4+0x60],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = 000000ff 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1
	ldx	[%g4+0x68],%g3
	std	%f28,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f28 = ffffe137 ff000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf28,%g1

!	Check Point 55 completed


p0_label_276:
!	%l6 = 00000000000000ff, Mem[0000000010181421] = 37e1ffff
	stb	%l6,[%i6+0x021]		! Mem[0000000010181420] = 37ffffff
!	%l3 = 000000000000ffff, Mem[00000000211c0000] = ffffa37b, %asi = 80
	stha	%l3,[%o2+0x000]%asi	! Mem[00000000211c0000] = ffffa37b
!	Mem[0000000010181408] = ffffe137, %l6 = 00000000000000ff
	swapa	[%i6+%o4]0x80,%l6	! %l6 = 00000000ffffe137
	membar	#Sync			! Added by membar checker (62)
!	%f26 = 000000ff, Mem[0000000030141400] = ffffffff
	sta	%f26,[%i5+%g0]0x81	! Mem[0000000030141400] = 000000ff
!	%f22 = b8ffffff 00000000, Mem[00000000100c1400] = ff000000 e5000000
	stda	%f22,[%i3+%g0]0x88	! Mem[00000000100c1400] = b8ffffff 00000000
!	Mem[00000000201c0000] = ffff851d, %l0 = 000000000000a892
	ldstuba	[%o0+0x000]%asi,%l0	! %l0 = 000000ff000000ff
!	Mem[0000000030141400] = ff000000, %l1 = 0000000000000000
	swapa	[%i5+%g0]0x89,%l1	! %l1 = 00000000ff000000
!	Mem[0000000030041410] = 00000000, %l6 = 00000000ffffe137
	swapa	[%i1+%o5]0x81,%l6	! %l6 = 0000000000000000
!	Mem[00000000100c1410] = ffffe100, %l1 = 00000000ff000000
	swapa	[%i3+%o5]0x88,%l1	! %l1 = 00000000ffffe100
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = 000000ff, %l6 = 0000000000000000
	lduha	[%i5+%o5]0x89,%l6	! %l6 = 00000000000000ff

p0_label_277:
!	Mem[0000000010101428] = e13700ff, %l0 = 00000000000000ff
	lduw	[%i4+0x028],%l0		! %l0 = 00000000e13700ff
!	Mem[0000000021800080] = ffff14cb, %l0 = 00000000e13700ff
	lduh	[%o3+0x080],%l0		! %l0 = 000000000000ffff
!	Mem[0000000030141408] = e5000000, %l6 = 00000000000000ff
	ldsba	[%i5+%o4]0x81,%l6	! %l6 = ffffffffffffffe5
!	Mem[0000000010101400] = 00ff5f0000000000, %l7 = 00000000000000ff
	ldx	[%i4+%g0],%l7		! %l7 = 00ff5f0000000000
!	Mem[00000000100c1400] = 00000000, %f30 = 518cfad6
	lda	[%i3+%g0]0x88,%f30	! %f30 = 00000000
!	Mem[00000000218000c0] = ffffd561, %l0 = 000000000000ffff
	ldub	[%o3+0x0c0],%l0		! %l0 = 00000000000000ff
!	Mem[00000000300c1408] = 00ffffff00ff5f00, %l7 = 00ff5f0000000000
	ldxa	[%i3+%o4]0x81,%l7	! %l7 = 00ffffff00ff5f00
!	Mem[00000000300c1408] = ffffff00, %l7 = 00ffffff00ff5f00
	ldsha	[%i3+%o4]0x89,%l7	! %l7 = ffffffffffffff00
!	Mem[0000000030101400] = ffb502d1, %l0 = 00000000000000ff
	lduwa	[%i4+%g0]0x81,%l0	! %l0 = 00000000ffb502d1
!	Starting 10 instruction Store Burst
!	Mem[0000000010141430] = 005fff00, %l6 = ffffffe5, %l1 = ffffe100
	add	%i5,0x30,%g1
	casa	[%g1]0x80,%l6,%l1	! %l1 = 00000000005fff00

p0_label_278:
!	%l1 = 00000000005fff00, Mem[0000000021800101] = 5b295a3e, %asi = 80
	stba	%l1,[%o3+0x101]%asi	! Mem[0000000021800100] = 5b005a3e
!	Mem[0000000030181400] = d102b5ff, %l5 = 0000000000000000
	ldstuba	[%i6+%g0]0x89,%l5	! %l5 = 000000ff000000ff
!	Mem[0000000030001410] = 0000ffff, %l7 = ffffffffffffff00
	ldstuba	[%i0+%o5]0x81,%l7	! %l7 = 00000000000000ff
!	Mem[000000001000143c] = e13700ff, %l6 = ffffffffffffffe5
	swap	[%i0+0x03c],%l6		! %l6 = 00000000e13700ff
!	%f6  = 00000000, Mem[00000000100c1410] = 000000ff
	sta	%f6 ,[%i3+%o5]0x80	! Mem[00000000100c1410] = 00000000
!	%f9  = 57af2327, Mem[0000000010041410] = 00000000
	sta	%f9 ,[%i1+%o5]0x88	! Mem[0000000010041410] = 57af2327
!	%f30 = 00000000 ffffff6e, Mem[00000000300c1408] = 00ffffff 00ff5f00
	stda	%f30,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00000000 ffffff6e
!	%l3 = 000000000000ffff, Mem[0000000030041400] = b53b879c
	stba	%l3,[%i1+%g0]0x81	! Mem[0000000030041400] = ff3b879c
!	%l4 = 37e1ffff, %l5 = 000000ff, Mem[0000000030041408] = ff000000 e1370000
	stda	%l4,[%i1+%o4]0x81	! Mem[0000000030041408] = 37e1ffff 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = 6effffff d6fa8c51, %l2 = 00ff5f00, %l3 = 0000ffff
	ldd	[%i0+%o4],%l2		! %l2 = 000000006effffff 00000000d6fa8c51

p0_label_279:
!	Mem[00000000300c1400] = ff000000ffffffb8, %f10 = 00ff5f00 085de2f2
	ldda	[%i3+%g0]0x81,%f10	! %f10 = ff000000 ffffffb8
!	Mem[0000000010181410] = e5000000, %l3 = 00000000d6fa8c51
	ldswa	[%i6+%o5]0x80,%l3	! %l3 = ffffffffe5000000
!	Mem[0000000030181410] = 37e1ffff, %l7 = 0000000000000000
	lduba	[%i6+%o5]0x81,%l7	! %l7 = 0000000000000037
!	Mem[0000000010101408] = 000000000000e137, %l0 = 00000000ffb502d1
	ldxa	[%i4+%o4]0x80,%l0	! %l0 = 000000000000e137
!	Mem[0000000010141410] = 00000000, %l2 = 000000006effffff
	ldsb	[%i5+0x012],%l2		! %l2 = 0000000000000000
!	Mem[0000000020800040] = ffffb8ec, %l6 = 00000000e13700ff
	ldsba	[%o1+0x040]%asi,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010081400] = ffff00ff, %l6 = ffffffffffffffff
	lduba	[%i2+%g0]0x80,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010141400] = ffb502d1, %l7 = 0000000000000037
	lduwa	[%i5+%g0]0x80,%l7	! %l7 = 00000000ffb502d1
!	Mem[0000000010081400] = ffff00ff, %l3 = ffffffffe5000000
	lduwa	[%i2+%g0]0x80,%l3	! %l3 = 00000000ffff00ff
!	Starting 10 instruction Store Burst
!	Mem[0000000010101410] = ff0000ff, %l4 = 0000000037e1ffff
	ldstuba	[%i4+%o5]0x80,%l4	! %l4 = 000000ff000000ff

p0_label_280:
!	Mem[00000000211c0001] = ffffa37b, %l3 = 00000000ffff00ff
	ldstub	[%o2+0x001],%l3		! %l3 = 000000ff000000ff
!	%l0 = 0000e137, %l1 = 005fff00, Mem[0000000030181410] = 37e1ffff ffffffff
	stda	%l0,[%i6+%o5]0x81	! Mem[0000000030181410] = 0000e137 005fff00
!	%l2 = 0000000000000000, Mem[0000000010181410] = e5000000
	stha	%l2,[%i6+%o5]0x80	! Mem[0000000010181410] = 00000000
!	Mem[0000000010041400] = 00000000, %l0 = 000000000000e137
	ldstuba	[%i1+%g0]0x80,%l0	! %l0 = 00000000000000ff
!	%l4 = 00000000000000ff, Mem[00000000100c1410] = 00000000
	stwa	%l4,[%i3+%o5]0x80	! Mem[00000000100c1410] = 000000ff
!	%f27 = 00000000, Mem[00000000100c1400] = 00000000
	sta	%f27,[%i3+%g0]0x80	! Mem[00000000100c1400] = 00000000
!	%f16 = ffffffff ffffe137 000006ff 00000000
!	%f20 = 3dff0000 ff00018f b8ffffff 00000000
!	%f24 = 00ff5f00 00ff5f00 000000ff 00000000
!	%f28 = ffffe137 ff000000 00000000 ffffff6e
	stda	%f16,[%i0]ASI_BLK_S	! Block Store to 0000000030001400
!	Mem[000000001004141d] = 1da45bae, %l6 = 00000000000000ff
	ldstub	[%i1+0x01d],%l6		! %l6 = 000000a4000000ff
!	%l6 = 000000a4, %l7 = ffb502d1, Mem[0000000030001408] = ff060000 00000000
	stda	%l6,[%i0+%o4]0x89	! Mem[0000000030001408] = 000000a4 ffb502d1
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = 000000ff, %l3 = 00000000000000ff
	swapa	[%i1+%g0]0x88,%l3	! %l3 = 00000000000000ff

!	Check Point 56 for processor 0

	set	p0_check_pt_data_56,%g4
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
	cmp	%l4,%g2			! %l4 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l5,%g2			! %l5 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l6,%g2			! %l6 = 00000000000000a4
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l7,%g2			! %l7 = 00000000ffb502d1
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x40],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = 37e1ffff 000000e5
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x48],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = ff000000 ffffffb8
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x50],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = 00000000 ffffff6e
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 56 completed


p0_label_281:
!	Mem[0000000010081408] = ffffffff ffffe137, %l2 = 00000000, %l3 = 000000ff
	ldda	[%i2+0x008]%asi,%l2	! %l2 = 00000000ffffffff 00000000ffffe137
	membar	#Sync			! Added by membar checker (63)
!	Mem[0000000030001400] = ffffffff, %l2 = 00000000ffffffff
	lduba	[%i0+%g0]0x81,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010041408] = ff0000ff, %l0 = 0000000000000000
	ldsha	[%i1+0x008]%asi,%l0	! %l0 = ffffffffffffff00
!	Mem[0000000010101400] = 00ff5f0000000000, %f30 = 00000000 ffffff6e
	ldda	[%i4+%g0]0x80,%f30	! %f30 = 00ff5f00 00000000
!	Mem[00000000300c1410] = 0000000000000000, %f26 = 000000ff 00000000
	ldda	[%i3+%o5]0x89,%f26	! %f26 = 00000000 00000000
!	Mem[0000000030101400] = d102b5ff, %l4 = 00000000000000ff
	lduha	[%i4+%g0]0x89,%l4	! %l4 = 000000000000b5ff
!	Mem[0000000010041410] = 57af2327, %l0 = ffffffffffffff00
	lduwa	[%i1+%o5]0x88,%l0	! %l0 = 0000000057af2327
!	Mem[0000000021800040] = ffff4289, %l0 = 0000000057af2327
	ldsha	[%o3+0x040]%asi,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010081400] = ffffffe1 ff00ffff, %l2 = 000000ff, %l3 = ffffe137
	ldda	[%i2+%g0]0x88,%l2	! %l2 = 00000000ff00ffff 00000000ffffffe1
!	Starting 10 instruction Store Burst
!	Mem[0000000030101408] = ffff00ff, %l2 = 00000000ff00ffff
	swapa	[%i4+%o4]0x89,%l2	! %l2 = 00000000ffff00ff

p0_label_282:
!	Mem[0000000030181410] = 0000e137, %l4 = 000000000000b5ff
	swapa	[%i6+%o5]0x81,%l4	! %l4 = 000000000000e137
!	Mem[00000000100c1419] = 00000000, %l5 = 00000000000000ff
	ldstub	[%i3+0x019],%l5		! %l5 = 00000000000000ff
!	Mem[0000000010181430] = 0e510fed, %l3 = 00000000ffffffe1
	swap	[%i6+0x030],%l3		! %l3 = 000000000e510fed
!	%f8  = 5539c2ba 57af2327, %l6 = 00000000000000a4
!	Mem[0000000030001428] = 000000ff00000000
	add	%i0,0x028,%g1
	stda	%f8,[%g1+%l6]ASI_PST32_S ! Mem[0000000030001428] = 000000ff00000000
!	%l5 = 0000000000000000, Mem[0000000010181410] = 00000000
	stba	%l5,[%i6+%o5]0x80	! Mem[0000000010181410] = 00000000
!	%l5 = 0000000000000000, Mem[0000000030001400] = ffffffff
	stba	%l5,[%i0+%g0]0x89	! Mem[0000000030001400] = ffffff00
!	Mem[0000000030101400] = ffb502d1, %l5 = 0000000000000000
	ldstuba	[%i4+%g0]0x81,%l5	! %l5 = 000000ff000000ff
!	%l0 = ffffffff, %l1 = 005fff00, Mem[0000000030041408] = ffffe137 ff000000
	stda	%l0,[%i1+%o4]0x89	! Mem[0000000030041408] = ffffffff 005fff00
!	%l4 = 000000000000e137, Mem[00000000300c1400] = ff000000ffffffb8
	stxa	%l4,[%i3+%g0]0x81	! Mem[00000000300c1400] = 000000000000e137
!	Starting 10 instruction Load Burst
!	Mem[0000000020800000] = ff009984, %l6 = 00000000000000a4
	lduh	[%o1+%g0],%l6		! %l6 = 000000000000ff00

p0_label_283:
!	Mem[0000000030001410] = 0000ff3d, %l7 = 00000000ffb502d1
	ldsba	[%i0+%o5]0x89,%l7	! %l7 = 000000000000003d
!	Mem[0000000010001408] = ffffff6e, %l6 = 000000000000ff00
	lduha	[%i0+%o4]0x88,%l6	! %l6 = 000000000000ff6e
!	Mem[0000000010141400] = d102b5ff, %l1 = 00000000005fff00
	ldswa	[%i5+%g0]0x88,%l1	! %l1 = ffffffffd102b5ff
!	Mem[00000000100c143c] = 00000000, %l4 = 000000000000e137
	ldsh	[%i3+0x03e],%l4		! %l4 = 0000000000000000
!	Mem[0000000030141410] = ff000000 ffffe137, %l4 = 00000000, %l5 = 000000ff
	ldda	[%i5+%o5]0x81,%l4	! %l4 = 00000000ff000000 00000000ffffe137
!	Mem[0000000030101408] = ffff00ff, %l7 = 000000000000003d
	lduba	[%i4+%o4]0x81,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010001400] = 0000ffb5, %l2 = 00000000ffff00ff
	lduwa	[%i0+%g0]0x88,%l2	! %l2 = 000000000000ffb5
!	Mem[0000000030001400] = 00ffffff, %l7 = 00000000000000ff
	ldswa	[%i0+%g0]0x81,%l7	! %l7 = 0000000000ffffff
!	Mem[0000000030001410] = 0000ff3d, %l1 = ffffffffd102b5ff
	lduha	[%i0+%o5]0x89,%l1	! %l1 = 000000000000ff3d
!	Starting 10 instruction Store Burst
!	%f16 = ffffffff ffffe137 000006ff 00000000
!	%f20 = 3dff0000 ff00018f b8ffffff 00000000
!	%f24 = 00ff5f00 00ff5f00 00000000 00000000
!	%f28 = ffffe137 ff000000 00ff5f00 00000000
	stda	%f16,[%i0]ASI_BLK_PL	! Block Store to 0000000010001400

p0_label_284:
!	Mem[00000000100c1402] = 00000000, %l6 = 000000000000ff6e
	ldstuba	[%i3+0x002]%asi,%l6	! %l6 = 00000000000000ff
!	%l1 = 000000000000ff3d, Mem[0000000010101432] = 0000ff00, %asi = 80
	stha	%l1,[%i4+0x032]%asi	! Mem[0000000010101430] = 0000ff3d
!	Mem[0000000010181400] = 0000ff3d, %l6 = 0000000000000000
	swapa	[%i6+%g0]0x88,%l6	! %l6 = 000000000000ff3d
!	Mem[0000000010081404] = e1ffffff, %l2 = 000000000000ffb5
	ldstuba	[%i2+0x004]%asi,%l2	! %l2 = 000000e1000000ff
!	Mem[00000000100c1410] = ff000000, %l1 = 000000000000ff3d
	swapa	[%i3+%o5]0x88,%l1	! %l1 = 00000000ff000000
!	%l0 = ffffffff, %l1 = ff000000, Mem[0000000010041410] = 57af2327 ff0000ff
	stda	%l0,[%i1+%o5]0x88	! Mem[0000000010041410] = ffffffff ff000000
!	Mem[0000000010181410] = 00000000, %l6 = 000000000000ff3d
	swapa	[%i6+%o5]0x88,%l6	! %l6 = 0000000000000000
!	%f10 = ff000000 ffffffb8, Mem[0000000010141408] = 0000ffff 00000000
	stda	%f10,[%i5+%o4]0x88	! Mem[0000000010141408] = ff000000 ffffffb8
!	Mem[0000000010101400] = 00ff5f00, %l2 = 00000000000000e1
	swap	[%i4+%g0],%l2		! %l2 = 0000000000ff5f00
!	Starting 10 instruction Load Burst
!	Mem[000000001008143c] = b1cdff00, %l4 = 00000000ff000000
	ldswa	[%i2+0x03c]%asi,%l4	! %l4 = ffffffffb1cdff00

p0_label_285:
!	Mem[0000000030001400] = 37e1ffffffffff00, %f12 = 9c873bb5 ffffffe1
	ldda	[%i0+%g0]0x89,%f12	! %f12 = 37e1ffff ffffff00
!	Mem[0000000010101400] = e1000000, %l4 = ffffffffb1cdff00
	lduha	[%i4+%g0]0x88,%l4	! %l4 = 0000000000000000
!	Mem[00000000100c1410] = 9c873bb50000ff3d, %f10 = ff000000 ffffffb8
	ldda	[%i3+%o5]0x88,%f10	! %f10 = 9c873bb5 0000ff3d
!	Mem[0000000030141408] = e5000000, %f0  = ffffff1d
	lda	[%i5+%o4]0x81,%f0 	! %f0 = e5000000
!	Mem[0000000030041400] = ff3b879c, %l1 = 00000000ff000000
	ldsba	[%i1+%g0]0x81,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010101430] = 0000ff3d ffffffff, %l6 = 00000000, %l7 = 00ffffff
	ldd	[%i4+0x030],%l6		! %l6 = 000000000000ff3d 00000000ffffffff
!	Mem[0000000010041428] = 68e6ff57 d6fa8c51, %l2 = 00ff5f00, %l3 = 0e510fed
	ldd	[%i1+0x028],%l2		! %l2 = 0000000068e6ff57 00000000d6fa8c51
	membar	#Sync			! Added by membar checker (64)
!	Mem[0000000010001400] = 37e1ffffffffffff, %f8  = 5539c2ba 57af2327
	ldda	[%i0+0x000]%asi,%f8 	! %f8  = 37e1ffff ffffffff
!	Mem[0000000010041400] = ff00000000000000, %l2 = 0000000068e6ff57
	ldxa	[%i1+%g0]0x80,%l2	! %l2 = ff00000000000000
!	Starting 10 instruction Store Burst
!	%l6 = 000000000000ff3d, Mem[0000000010041410] = ffffffff
	stha	%l6,[%i1+%o5]0x88	! Mem[0000000010041410] = ffffff3d

!	Check Point 57 for processor 0

	set	p0_check_pt_data_57,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = ffffffffffffffff
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = ffffffffffffffff
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = ff00000000000000
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l4,%g2			! %l4 = 0000000000000000
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l5,%g2			! %l5 = 00000000ffffe137
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l6,%g2			! %l6 = 000000000000ff3d
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l7,%g2			! %l7 = 00000000ffffffff
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x40],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = e5000000 ffffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x48],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = 37e1ffff 000000e5
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x50],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = ffffff1d ffffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x58],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 00000000 518a9713
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x60],%g3
	std	%f8,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f8 = 37e1ffff ffffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf08,%g1
	ldx	[%g4+0x68],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = 9c873bb5 0000ff3d
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x70],%g3
	std	%f12,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f12 = 37e1ffff ffffff00
	bne	%xcc,p0_freg_check_fail
	mov	0xf12,%g1
	ldx	[%g4+0x78],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = 00000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1
	ldx	[%g4+0x80],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = 00ff5f00 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 57 completed


p0_label_286:
!	%l1 = ffffffffffffffff, Mem[0000000010081410] = 00000000
	stha	%l1,[%i2+%o5]0x80	! Mem[0000000010081410] = ffff0000
!	Mem[0000000010101408] = 00000000, %l3 = 00000000d6fa8c51
	ldstuba	[%i4+%o4]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010141438] = 965c37ff, %l6 = 000000000000ff3d
	swap	[%i5+0x038],%l6		! %l6 = 00000000965c37ff
!	%l0 = ffffffff, %l1 = ffffffff, Mem[0000000010001410] = ff00018f 3dff0000
	stda	%l0,[%i0+%o5]0x88	! Mem[0000000010001410] = ffffffff ffffffff
!	%l1 = ffffffffffffffff, Mem[00000000100c1418] = 00ff0000000000e5, %asi = 80
	stxa	%l1,[%i3+0x018]%asi	! Mem[00000000100c1418] = ffffffffffffffff
!	%f12 = 37e1ffff ffffff00, %l7 = 00000000ffffffff
!	Mem[00000000300c1428] = a8921e6eb53b879c
	add	%i3,0x028,%g1
	stda	%f12,[%g1+%l7]ASI_PST16_SL ! Mem[00000000300c1428] = 00ffffffffffe137
!	Mem[0000000030181410] = 0000b5ff, %l2 = ff00000000000000
	swapa	[%i6+%o5]0x81,%l2	! %l2 = 000000000000b5ff
!	Mem[0000000010001400] = 37e1ffff, %l7 = 00000000ffffffff
	swapa	[%i0+%g0]0x80,%l7	! %l7 = 0000000037e1ffff
!	%f28 = ffffe137 ff000000, Mem[0000000030181410] = 00000000 00ff5f00
	stda	%f28,[%i6+%o5]0x89	! Mem[0000000030181410] = ffffe137 ff000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = 000000ff, %l2 = 000000000000b5ff
	lduha	[%i6+%o4]0x80,%l2	! %l2 = 0000000000000000

p0_label_287:
!	Mem[0000000010041410] = ff000000ffffff3d, %f4  = ffffff1d ffffffff
	ldda	[%i1+%o5]0x88,%f4 	! %f4  = ff000000 ffffff3d
!	Mem[0000000030001400] = 00ffffff ffffe137 a4000000 d102b5ff
!	Mem[0000000030001410] = 3dff0000 ff00018f b8ffffff 00000000
!	Mem[0000000030001420] = 00ff5f00 00ff5f00 000000ff 00000000
!	Mem[0000000030001430] = ffffe137 ff000000 00000000 ffffff6e
	ldda	[%i0]ASI_BLK_S,%f0	! Block Load from 0000000030001400
!	Mem[0000000030001400] = ffffff00, %l2 = 0000000000000000
	ldsha	[%i0+%g0]0x89,%l2	! %l2 = ffffffffffffff00
!	Mem[0000000010101408] = ff000000, %f20 = 3dff0000
	lda	[%i4+%o4]0x80,%f20	! %f20 = ff000000
!	Mem[0000000030081408] = 000000ff, %l4 = 0000000000000000
	lduha	[%i2+%o4]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030041400] = ff3b879c ff3d37e1 ffffffff 00ff5f00
!	Mem[0000000030041410] = ffffe137 00000000 c7dc5b29 d102b5cd
!	Mem[0000000030041420] = 49945b77 13978a51 ffffffe1 00000000
!	Mem[0000000030041430] = ffffe137 0000e137 965c37e1 f6060000
	ldda	[%i1]ASI_BLK_AIUSL,%f0	! Block Load from 0000000030041400
!	Mem[00000000100c1408] = 00000000, %l1 = ffffffffffffffff
	swapa	[%i3+%o4]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010101400] = 000000e100000000, %f20 = ff000000 ff00018f
	ldda	[%i4+%g0]0x80,%f20	! %f20 = 000000e1 00000000
!	Mem[0000000010041400] = ff000000, %l3 = 0000000000000000
	ldsba	[%i1+%g0]0x80,%l3	! %l3 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l0 = ffffffffffffffff, Mem[0000000030081400] = 0000000000000000
	stxa	%l0,[%i2+%g0]0x81	! Mem[0000000030081400] = ffffffffffffffff

p0_label_288:
!	%f22 = b8ffffff, Mem[0000000010041400] = ff000000
	sta	%f22,[%i1+%g0]0x80	! Mem[0000000010041400] = b8ffffff
!	%l5 = 00000000ffffe137, Mem[000000001000140c] = ff060000
	stw	%l5,[%i0+0x00c]		! Mem[000000001000140c] = ffffe137
!	%l5 = 00000000ffffe137, Mem[0000000030141408] = 000000e5
	stba	%l5,[%i5+%o4]0x89	! Mem[0000000030141408] = 00000037
!	%l1 = 0000000000000000, Mem[0000000010081414] = 0000a892, %asi = 80
	stba	%l1,[%i2+0x014]%asi	! Mem[0000000010081414] = 0000a892
!	%l4 = 00000000000000ff, Mem[0000000010001422] = 005fff00
	sth	%l4,[%i0+0x022]		! Mem[0000000010001420] = 005f00ff
!	Mem[0000000030181408] = ffffffff, %l5 = 00000000ffffe137
	ldstuba	[%i6+%o4]0x81,%l5	! %l5 = 000000ff000000ff
!	%l6 = 00000000965c37ff, Mem[00000000300c1408] = 00000000
	stwa	%l6,[%i3+%o4]0x81	! Mem[00000000300c1408] = 965c37ff
!	%l1 = 0000000000000000, Mem[0000000010101414] = e1ffffff, %asi = 80
	stwa	%l1,[%i4+0x014]%asi	! Mem[0000000010101414] = 00000000
!	%l0 = ffffffffffffffff, Mem[0000000030181408] = ffffffff
	stba	%l0,[%i6+%o4]0x89	! Mem[0000000030181408] = ffffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000030081410] = 00000000, %l3 = ffffffffffffffff
	lduwa	[%i2+%o5]0x89,%l3	! %l3 = 0000000000000000

p0_label_289:
!	Mem[0000000010001410] = ffffffff, %l4 = 00000000000000ff
	lduh	[%i0+0x012],%l4		! %l4 = 000000000000ffff
!	Mem[000000001004140c] = 9c873bb5, %l1 = 0000000000000000
	ldsb	[%i1+0x00f],%l1		! %l1 = ffffffffffffffb5
!	Mem[0000000010181408] = 000000ff, %l2 = ffffffffffffff00
	ldswa	[%i6+%o4]0x80,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030181400] = d102b5ff, %l4 = 000000000000ffff
	lduba	[%i6+%g0]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010101430] = 0000ff3dffffffff, %l6 = 00000000965c37ff
	ldx	[%i4+0x030],%l6		! %l6 = 0000ff3dffffffff
!	Mem[0000000030101410] = 00000000, %l3 = 0000000000000000
	lduha	[%i4+%o5]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000010081424] = 00000000, %l4 = 00000000000000ff
	ldsh	[%i2+0x026],%l4		! %l4 = 0000000000000000
!	Mem[0000000010101408] = ff000000, %l1 = ffffffffffffffb5
	ldswa	[%i4+%o4]0x80,%l1	! %l1 = ffffffffff000000
!	Mem[0000000010101400] = 00000000e1000000, %f26 = 00000000 00000000
	ldda	[%i4+%g0]0x88,%f26	! %f26 = 00000000 e1000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030081408] = 000000ff, %l0 = ffffffffffffffff
	swapa	[%i2+%o4]0x89,%l0	! %l0 = 00000000000000ff

p0_label_290:
!	%l7 = 0000000037e1ffff, Mem[0000000030081408] = ffffffff0000e100
	stxa	%l7,[%i2+%o4]0x81	! Mem[0000000030081408] = 0000000037e1ffff
!	%l2 = 00000000000000ff, Mem[0000000030141410] = ff000000
	stba	%l2,[%i5+%o5]0x81	! Mem[0000000030141410] = ff000000
!	%l2 = 000000ff, %l3 = 00000000, Mem[00000000300c1410] = 00000000 00000000
	stda	%l2,[%i3+%o5]0x89	! Mem[00000000300c1410] = 000000ff 00000000
	membar	#Sync			! Added by membar checker (65)
!	%f16 = ffffffff ffffe137, %l1 = ffffffffff000000
!	Mem[0000000030041400] = ff3b879cff3d37e1
	stda	%f16,[%i1+%l1]ASI_PST16_SL ! Mem[0000000030041400] = ff3b879cff3d37e1
!	Mem[00000000100c1410] = 3dff0000b53b879c, %l0 = 00000000000000ff, %l3 = 0000000000000000
	add	%i3,0x10,%g1
	casxa	[%g1]0x80,%l0,%l3	! %l3 = 3dff0000b53b879c
!	%l4 = 00000000, %l5 = 000000ff, Mem[0000000010001408] = 00000000 37e1ffff
	stda	%l4,[%i0+%o4]0x88	! Mem[0000000010001408] = 00000000 000000ff
!	Mem[0000000030181400] = ffb502d1, %l6 = 0000ff3dffffffff
	swapa	[%i6+%g0]0x81,%l6	! %l6 = 00000000ffb502d1
!	Mem[0000000030001410] = 3dff0000, %l2 = 00000000000000ff
	swapa	[%i0+%o5]0x81,%l2	! %l2 = 000000003dff0000
!	%l5 = 00000000000000ff, Mem[00000000100c1400] = 0000ff00ffffffb8
	stx	%l5,[%i3+%g0]		! Mem[00000000100c1400] = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010181400] = 0000000037e10000, %f20 = 000000e1 00000000
	ldda	[%i6+%g0]0x80,%f20	! %f20 = 00000000 37e10000

!	Check Point 58 for processor 0

	set	p0_check_pt_data_58,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l1,%g2			! %l1 = ffffffffff000000
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l2,%g2			! %l2 = 000000003dff0000
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l3,%g2			! %l3 = 3dff0000b53b879c
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
	cmp	%l6,%g2			! %l6 = 00000000ffb502d1
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x38],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = e1373dff 9c873bff
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x40],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = 005fff00 ffffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x48],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 00000000 37e1ffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x50],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = cdb502d1 295bdcc7
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x58],%g3
	std	%f8,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f8 = 518a9713 775b9449
	bne	%xcc,p0_freg_check_fail
	mov	0xf08,%g1
	ldx	[%g4+0x60],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = 00000000 e1ffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x68],%g3
	std	%f12,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f12 = 37e10000 37e1ffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf12,%g1
	ldx	[%g4+0x70],%g3
	std	%f14,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f14 = 000006f6 e1375c96
	bne	%xcc,p0_freg_check_fail
	mov	0xf14,%g1
	ldx	[%g4+0x78],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = 00000000 37e10000
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1
	ldx	[%g4+0x80],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = 00000000 e1000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1

!	Check Point 58 completed


p0_label_291:
!	Mem[0000000030101410] = 00000000, %l3 = 3dff0000b53b879c
	lduha	[%i4+%o5]0x81,%l3	! %l3 = 0000000000000000
!	Mem[00000000100c1410] = 3dff0000 b53b879c, %l2 = 3dff0000, %l3 = 00000000
	ldd	[%i3+%o5],%l2		! %l2 = 000000003dff0000 00000000b53b879c
!	Mem[0000000010101428] = e13700ff d700e1ff, %l2 = 3dff0000, %l3 = b53b879c
	ldda	[%i4+0x028]%asi,%l2	! %l2 = 00000000e13700ff 00000000d700e1ff
!	Mem[000000001010140c] = 0000e137, %l6 = 00000000ffb502d1
	lduba	[%i4+0x00f]%asi,%l6	! %l6 = 0000000000000037
!	Mem[0000000010141438] = 0000ff3d, %l1 = ffffffffff000000
	lduha	[%i5+0x038]%asi,%l1	! %l1 = 0000000000000000
!	Mem[0000000010001410] = ffffffff, %l7 = 0000000037e1ffff
	ldsba	[%i0+0x013]%asi,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000030001410] = 000000ff, %l1 = 0000000000000000
	lduha	[%i0+%o5]0x81,%l1	! %l1 = 0000000000000000
!	Mem[00000000300c1400] = 37e1000000000000, %l1 = 0000000000000000
	ldxa	[%i3+%g0]0x89,%l1	! %l1 = 37e1000000000000
!	Mem[0000000010081410] = ffff0000, %l2 = 00000000e13700ff
	lduwa	[%i2+%o5]0x80,%l2	! %l2 = 00000000ffff0000
!	Starting 10 instruction Store Burst
!	Mem[0000000010181434] = 4fc855b8, %l5 = 000000ff, %l1 = 00000000
	add	%i6,0x34,%g1
	casa	[%g1]0x80,%l5,%l1	! %l1 = 000000004fc855b8

p0_label_292:
!	%f26 = 00000000, Mem[00000000100c1410] = 3dff0000
	sta	%f26,[%i3+%o5]0x80	! Mem[00000000100c1410] = 00000000
!	Mem[0000000010101427] = 775b9449, %l3 = 00000000d700e1ff
	ldstub	[%i4+0x027],%l3		! %l3 = 00000049000000ff
!	%l6 = 0000000000000037, Mem[000000001018142c] = 1dff00ff
	stw	%l6,[%i6+0x02c]		! Mem[000000001018142c] = 00000037
!	Mem[000000001018140c] = ff000000, %l0 = 00000000000000ff
	ldstuba	[%i6+0x00c]%asi,%l0	! %l0 = 000000ff000000ff
!	%l5 = 00000000000000ff, Mem[0000000030041410] = 37e1ffff
	stba	%l5,[%i1+%o5]0x89	! Mem[0000000030041410] = 37e1ffff
!	%l0 = 00000000000000ff, Mem[0000000030041410] = 0000000037e1ffff
	stxa	%l0,[%i1+%o5]0x89	! Mem[0000000030041410] = 00000000000000ff
!	%f10 = 00000000 e1ffffff, Mem[0000000030181410] = 000000ff 37e1ffff
	stda	%f10,[%i6+%o5]0x81	! Mem[0000000030181410] = 00000000 e1ffffff
!	Mem[0000000010001420] = 005f00ff, %l5 = 00000000000000ff, %asi = 80
	swapa	[%i0+0x020]%asi,%l5	! %l5 = 00000000005f00ff
!	Mem[0000000010041410] = 3dffffff, %l6 = 0000000000000037
	ldstuba	[%i1+%o5]0x80,%l6	! %l6 = 0000003d000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = 00000000, %f2  = 005fff00
	lda	[%i5+%g0]0x81,%f2 	! %f2 = 00000000

p0_label_293:
!	%l7 = ffffffffffffffff, imm = fffffffffffff465, %l4 = 0000000000000000
	xnor	%l7,-0xb9b,%l4		! %l4 = fffffffffffff465
!	Mem[0000000030001400] = 37e1ffff ffffff00, %l4 = fffff465, %l5 = 005f00ff
	ldda	[%i0+%g0]0x89,%l4	! %l4 = 00000000ffffff00 0000000037e1ffff
!	Mem[0000000010181420] = 37ffffffffffffff, %l5 = 0000000037e1ffff
	ldxa	[%i6+0x020]%asi,%l5	! %l5 = 37ffffffffffffff
!	Mem[0000000010101410] = ff0000ff, %l7 = ffffffffffffffff
	ldsha	[%i4+%o5]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030001408] = a4000000, %l2 = 00000000ffff0000
	lduba	[%i0+%o4]0x81,%l2	! %l2 = 00000000000000a4
!	Mem[00000000100c1410] = 00000000, %l5 = 37ffffffffffffff
	ldsba	[%i3+%o5]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000030141410] = ff000000ffffe137, %f26 = 00000000 e1000000
	ldda	[%i5+%o5]0x81,%f26	! %f26 = ff000000 ffffe137
!	Mem[0000000010001410] = ffffffff ffffffff, %l2 = 000000a4, %l3 = 00000049
	ldda	[%i0+%o5]0x88,%l2	! %l2 = 00000000ffffffff 00000000ffffffff
!	Mem[0000000030101400] = c7dc5b29d102b5ff, %l2 = 00000000ffffffff
	ldxa	[%i4+%g0]0x89,%l2	! %l2 = c7dc5b29d102b5ff
!	Starting 10 instruction Store Burst
!	%f16 = ffffffff ffffe137, %l7 = 00000000000000ff
!	Mem[00000000100c1420] = 000000000000ff00
	add	%i3,0x020,%g1
	stda	%f16,[%g1+%l7]ASI_PST8_P ! Mem[00000000100c1420] = ffffffffffffe137

p0_label_294:
!	%l0 = 00000000000000ff, Mem[0000000010181408] = ff000000
	stba	%l0,[%i6+%o4]0x88	! Mem[0000000010181408] = ff0000ff
!	%l2 = d102b5ff, %l3 = ffffffff, Mem[00000000100c1410] = 00000000 9c873bb5
	stda	%l2,[%i3+%o5]0x88	! Mem[00000000100c1410] = d102b5ff ffffffff
!	%l4 = ffffff00, %l5 = 00000000, Mem[0000000010081410] = ffff0000 0000a892
	stda	%l4,[%i2+%o5]0x80	! Mem[0000000010081410] = ffffff00 00000000
!	Mem[00000000300c1410] = ff000000, %l3 = 00000000ffffffff
	ldstuba	[%i3+%o5]0x81,%l3	! %l3 = 000000ff000000ff
!	Mem[00000000100c142b] = 37e1ffff, %l7 = 00000000000000ff
	ldstuba	[%i3+0x02b]%asi,%l7	! %l7 = 000000ff000000ff
!	%l2 = c7dc5b29d102b5ff, Mem[00000000218001c1] = ffd36d36
	stb	%l2,[%o3+0x1c1]		! Mem[00000000218001c0] = ffff6d36
!	%f0  = e1373dff 9c873bff 00000000 ffffffff
!	%f4  = 00000000 37e1ffff cdb502d1 295bdcc7
!	%f8  = 518a9713 775b9449 00000000 e1ffffff
!	%f12 = 37e10000 37e1ffff 000006f6 e1375c96
	stda	%f0,[%i5]ASI_BLK_P	! Block Store to 0000000010141400
!	Mem[0000000030041410] = ff000000, %l2 = c7dc5b29d102b5ff
	swapa	[%i1+%o5]0x81,%l2	! %l2 = 00000000ff000000
!	%l4 = 00000000ffffff00, Mem[0000000010001410] = ffffffff
	stba	%l4,[%i0+%o5]0x88	! Mem[0000000010001410] = ffffff00
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (66)
!	Mem[0000000010141418] = cdb502d1, %l6 = 000000000000003d
	ldsb	[%i5+0x01a],%l6		! %l6 = 0000000000000002

p0_label_295:
!	Mem[0000000010101408] = ff000000, %l3 = 00000000000000ff
	lduha	[%i4+%o4]0x80,%l3	! %l3 = 000000000000ff00
!	Mem[00000000300c1410] = 00000000 000000ff, %l6 = 00000002, %l7 = 000000ff
	ldda	[%i3+%o5]0x89,%l6	! %l6 = 00000000000000ff 0000000000000000
!	Mem[0000000010001408] = 00000000, %l6 = 00000000000000ff
	ldsha	[%i0+%o4]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000030141400] = ffffff1d00000000, %f26 = ff000000 ffffe137
	ldda	[%i5+%g0]0x89,%f26	! %f26 = ffffff1d 00000000
!	Mem[0000000030101408] = e1373dffff00ffff, %l5 = 0000000000000000
	ldxa	[%i4+%o4]0x89,%l5	! %l5 = e1373dffff00ffff
!	Mem[00000000100c1420] = ffffffff, %l3 = 000000000000ff00
	lduh	[%i3+0x022],%l3		! %l3 = 000000000000ffff
!	Mem[0000000010101410] = ff0000ff, %l4 = 00000000ffffff00
	ldsha	[%i4+%o5]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030001408] = 000000a4, %l7 = 0000000000000000
	ldsba	[%i0+%o4]0x89,%l7	! %l7 = ffffffffffffffa4
!	Mem[0000000010181410] = 3dff0000ff000000, %l1 = 000000004fc855b8
	ldxa	[%i6+%o5]0x80,%l1	! %l1 = 3dff0000ff000000
!	Starting 10 instruction Store Burst
!	%f6  = cdb502d1 295bdcc7, %l2 = 00000000ff000000
!	Mem[00000000300c1400] = 000000000000e137
	stda	%f6,[%i3+%l2]ASI_PST32_SL ! Mem[00000000300c1400] = 000000000000e137

!	Check Point 59 for processor 0

	set	p0_check_pt_data_59,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 3dff0000ff000000
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 00000000ff000000
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 000000000000ffff
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = e1373dffff00ffff
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 0000000000000000
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = ffffffffffffffa4
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
	cmp	%g3,%g2			! %f4 = 00000000 37e1ffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x58],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = cdb502d1 295bdcc7
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x60],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = ffffff1d 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1

!	Check Point 59 completed


p0_label_296:
!	%f16 = ffffffff ffffe137, Mem[0000000010041408] = ff0000ff b53b879c
	stda	%f16,[%i1+%o4]0x88	! Mem[0000000010041408] = ffffffff ffffe137
!	%f1  = 9c873bff, Mem[0000000010081408] = ffffffff
	sta	%f1 ,[%i2+%o4]0x88	! Mem[0000000010081408] = 9c873bff
!	Mem[0000000030041400] = 9c873bff, %l5 = e1373dffff00ffff
	swapa	[%i1+%g0]0x89,%l5	! %l5 = 000000009c873bff
!	Mem[0000000010141410] = 00000000, %l3 = 000000000000ffff
	ldstuba	[%i5+%o5]0x80,%l3	! %l3 = 00000000000000ff
!	Mem[000000001014141a] = cdb502d1, %l4 = 00000000000000ff
	ldstuba	[%i5+0x01a]%asi,%l4	! %l4 = 00000002000000ff
!	Mem[0000000030181410] = 00000000, %l0 = 00000000000000ff
	swapa	[%i6+%o5]0x89,%l0	! %l0 = 0000000000000000
!	%l3 = 0000000000000000, Mem[0000000030001410] = 000000ffff00018f
	stxa	%l3,[%i0+%o5]0x81	! Mem[0000000030001410] = 0000000000000000
!	Mem[0000000010001408] = 00000000, %l6 = 00000000, %l2 = ff000000
	add	%i0,0x08,%g1
	casa	[%g1]0x80,%l6,%l2	! %l2 = 0000000000000000
!	%l2 = 0000000000000000, Mem[0000000030101408] = ffff00ffff3d37e1
	stxa	%l2,[%i4+%o4]0x81	! Mem[0000000030101408] = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = 00000000, %l4 = 0000000000000002
	ldsba	[%i3+%g0]0x81,%l4	! %l4 = 0000000000000000

p0_label_297:
!	Mem[0000000030141408] = 00000037, %l1 = 3dff0000ff000000
	ldsba	[%i5+%o4]0x89,%l1	! %l1 = 0000000000000037
!	Mem[0000000010041408] = 37e1ffff, %l7 = ffffffffffffffa4
	lduba	[%i1+%o4]0x80,%l7	! %l7 = 0000000000000037
!	Mem[00000000100c1438] = 68e6ff57, %f15 = e1375c96
	lda	[%i3+0x038]%asi,%f15	! %f15 = 68e6ff57
!	Mem[0000000030101400] = ffb502d1, %f3  = ffffffff
	lda	[%i4+%g0]0x81,%f3 	! %f3 = ffb502d1
!	Mem[0000000030081408] = 00000000, %l0 = 0000000000000000
	lduwa	[%i2+%o4]0x89,%l0	! %l0 = 0000000000000000
!	Mem[00000000201c0000] = ffff851d, %l6 = 0000000000000000
	ldsb	[%o0+%g0],%l6		! %l6 = ffffffffffffffff
!	Mem[0000000021800140] = 00b52023, %l3 = 0000000000000000
	lduha	[%o3+0x140]%asi,%l3	! %l3 = 00000000000000b5
!	Mem[0000000010141408] = 00000000, %l4 = 0000000000000000
	ldswa	[%i5+%o4]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000010141414] = 37e1ffff, %l6 = ffffffffffffffff
	ldsba	[%i5+0x015]%asi,%l6	! %l6 = ffffffffffffffe1
!	Starting 10 instruction Store Burst
!	%l2 = 00000000, %l3 = 000000b5, Mem[0000000030081410] = 00000000 00000000
	stda	%l2,[%i2+%o5]0x89	! Mem[0000000030081410] = 00000000 000000b5

p0_label_298:
!	%l2 = 0000000000000000, Mem[0000000030001400] = ffffff00
	stba	%l2,[%i0+%g0]0x89	! Mem[0000000030001400] = ffffff00
!	Mem[00000000100c1400] = 00000000, %l6 = ffffffffffffffe1
	ldstuba	[%i3+%g0]0x80,%l6	! %l6 = 00000000000000ff
!	%l5 = 000000009c873bff, Mem[0000000030041400] = ffff00ff
	stwa	%l5,[%i1+%g0]0x81	! Mem[0000000030041400] = 9c873bff
!	Mem[0000000010181408] = ff0000ffff000000, %l6 = 0000000000000000, %l1 = 0000000000000037
	add	%i6,0x08,%g1
	casxa	[%g1]0x80,%l6,%l1	! %l1 = ff0000ffff000000
!	Mem[00000000100c1409] = ffffffff, %l5 = 000000009c873bff
	ldstuba	[%i3+0x009]%asi,%l5	! %l5 = 000000ff000000ff
!	%l1 = ff0000ffff000000, Mem[0000000010181400] = 0000000037e10000
	stx	%l1,[%i6+%g0]		! Mem[0000000010181400] = ff0000ffff000000
!	%l1 = ff0000ffff000000, Mem[0000000030041408] = ffffffff
	stba	%l1,[%i1+%o4]0x89	! Mem[0000000030041408] = ffffff00
!	%f14 = 000006f6 68e6ff57, Mem[0000000010001410] = 00ffffff ffffffff
	std	%f14,[%i0+%o5]	! Mem[0000000010001410] = 000006f6 68e6ff57
!	Mem[0000000030141408] = 37000000, %l2 = 0000000000000000
	swapa	[%i5+%o4]0x81,%l2	! %l2 = 0000000037000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = ffffffffffffe137, %f22 = b8ffffff 00000000
	ldda	[%i6+%o4]0x81,%f22	! %f22 = ffffffff ffffe137

p0_label_299:
!	Mem[0000000010001400] = ffffffffffffffff, %f2  = 00000000 ffb502d1
	ldda	[%i0+%g0]0x80,%f2 	! %f2  = ffffffff ffffffff
!	Mem[0000000030081410] = 00000000, %l2 = 0000000037000000
	lduwa	[%i2+%o5]0x81,%l2	! %l2 = 0000000000000000
!	Mem[00000000300c1410] = 00000000 000000ff, %l6 = 00000000, %l7 = 00000037
	ldda	[%i3+%o5]0x89,%l6	! %l6 = 00000000000000ff 0000000000000000
!	Mem[0000000010141410] = ff000000, %l2 = 0000000000000000
	ldsba	[%i5+%o5]0x80,%l2	! %l2 = ffffffffffffffff
!	Mem[00000000100c140c] = 00000037, %l1 = ff0000ffff000000
	ldsb	[%i3+0x00e],%l1		! %l1 = 0000000000000000
!	Mem[0000000030141400] = 00000000, %l1 = 0000000000000000
	lduha	[%i5+%g0]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000010001408] = ff000000, %l0 = 0000000000000000
	ldsha	[%i0+%o4]0x80,%l0	! %l0 = ffffffffffffff00
!	Mem[0000000030041408] = 005fff00ffffff00, %f4  = 00000000 37e1ffff
	ldda	[%i1+%o4]0x89,%f4 	! %f4  = 005fff00 ffffff00
!	Mem[0000000010001408] = 000000ff, %l2 = ffffffffffffffff
	lduba	[%i0+%o4]0x88,%l2	! %l2 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l4 = 00000000, %l5 = 000000ff, Mem[0000000010141408] = 00000000 ffffffff
	stda	%l4,[%i5+%o4]0x88	! Mem[0000000010141408] = 00000000 000000ff

p0_label_300:
!	%l5 = 00000000000000ff, Mem[0000000030141408] = 00000000
	stba	%l5,[%i5+%o4]0x89	! Mem[0000000030141408] = 000000ff
!	Mem[00000000100c1410] = ffb502d1, %l0 = ffffffffffffff00
	ldstuba	[%i3+%o5]0x80,%l0	! %l0 = 000000ff000000ff
!	Mem[0000000010181408] = ff0000ff, %l3 = 00000000000000b5
	ldstuba	[%i6+%o4]0x88,%l3	! %l3 = 000000ff000000ff
!	Mem[0000000030001408] = 000000a4, %l0 = 00000000000000ff
	ldstuba	[%i0+%o4]0x89,%l0	! %l0 = 000000a4000000ff
!	%l6 = 00000000000000ff, Mem[0000000030141410] = 37e1ffff000000ff
	stxa	%l6,[%i5+%o5]0x89	! Mem[0000000030141410] = 00000000000000ff
!	%l5 = 00000000000000ff, Mem[00000000300c1408] = 965c37ff
	stwa	%l5,[%i3+%o4]0x81	! Mem[00000000300c1408] = 000000ff
!	%l4 = 00000000, %l5 = 000000ff, Mem[0000000010081408] = 9c873bff 37e1ffff
	stda	%l4,[%i2+%o4]0x88	! Mem[0000000010081408] = 00000000 000000ff
!	%l6 = 000000ff, %l7 = 00000000, Mem[0000000010001400] = ffffffff ffffffff
	stda	%l6,[%i0+%g0]0x80	! Mem[0000000010001400] = 000000ff 00000000
!	Mem[0000000010141400] = ff3d37e1, %l1 = 0000000000000000
	swapa	[%i5+%g0]0x88,%l1	! %l1 = 00000000ff3d37e1
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = ff000000, %l3 = 00000000000000ff
	lduwa	[%i4+%o4]0x80,%l3	! %l3 = 00000000ff000000

!	Check Point 60 for processor 0

	set	p0_check_pt_data_60,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 00000000000000a4
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 00000000ff3d37e1
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
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = ffffffff ffffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x50],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 005fff00 ffffff00
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x58],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = cdb502d1 295bdcc7
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x60],%g3
	std	%f14,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f14 = 000006f6 68e6ff57
	bne	%xcc,p0_freg_check_fail
	mov	0xf14,%g1
	ldx	[%g4+0x68],%g3
	std	%f22,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f22 = ffffffff ffffe137
	bne	%xcc,p0_freg_check_fail
	mov	0xf22,%g1

!	Check Point 60 completed


	ba,a	p0_not_taken_0_end
p0_not_taken_0:
!	The following code should not be executed
	ldxa	[%i1+0x008]%asi,%l4
	stha	%l2,[%i1+0x020]%asi
	ldsha	[%i3+0x022]%asi,%l6
	sub	%l7,%l4,%l3
	ldsba	[%i0+0x026]%asi,%l5
	ba,a	p0_branch_failed
p0_not_taken_0_end:


!	End of Random Code for Thread 0


!	Check Registers

p0_check_registers:
	set	p0_expected_registers,%g1

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
	sdivx	%l0,%l5,%l5
	add	%l5,%l4,%l3
	stwa	%l1,[%i3+%o5]ASI_AS_IF_USER_PRIMARY	! Mem[00000000100c1410]
	done

p0_trap1o:
	sdivx	%l0,%l5,%l5
	add	%l5,%l4,%l3
	stwa	%l1,[%o3+%i5]ASI_AS_IF_USER_PRIMARY	! Mem[00000000100c1410]
	done


p0_trap2e:
	umul	%l3,%l1,%l0
	subc	%l1,-0xa01,%l6
	addc	%l6,%l0,%l3
	umul	%l5,%l7,%l4
	sdivx	%l2,0xa19,%l1
	lduba	[%i1+%o4]ASI_AS_IF_USER_PRIMARY,%l3	! Mem[0000000010041408]
	swapa	[%i4+%g0]ASI_AS_IF_USER_PRIMARY,%l2	! Mem[0000000010101400]
	done

p0_trap2o:
	umul	%l3,%l1,%l0
	subc	%l1,-0xa01,%l6
	addc	%l6,%l0,%l3
	umul	%l5,%l7,%l4
	sdivx	%l2,0xa19,%l1
	lduba	[%o1+%i4]ASI_AS_IF_USER_PRIMARY,%l3	! Mem[0000000010041408]
	swapa	[%o4+%g0]ASI_AS_IF_USER_PRIMARY,%l2	! Mem[0000000010101400]
	done


p0_trap3e:
	sub	%l4,-0x9fb,%l3
	or	%l5,0x8f2,%l2
	and	%l0,-0xc57,%l7
	and	%l5,%l6,%l6
	orn	%l1,%l5,%l6
	or	%l2,%l5,%l5
	xnor	%l7,%l3,%l7
	done

p0_trap3o:
	sub	%l4,-0x9fb,%l3
	or	%l5,0x8f2,%l2
	and	%l0,-0xc57,%l7
	and	%l5,%l6,%l6
	orn	%l1,%l5,%l6
	or	%l2,%l5,%l5
	xnor	%l7,%l3,%l7
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
	ldx	[%g1+0x000],%l0		! %l0 = fb8d8dca8f37d102
	ldx	[%g1+0x008],%l1		! %l1 = a68acbae127aa947
	ldx	[%g1+0x010],%l2		! %l2 = c71c16ca6d4674a6
	ldx	[%g1+0x018],%l3		! %l3 = 6f99a7840af0b676
	ldx	[%g1+0x020],%l4		! %l4 = 8b876ce63e139bbb
	ldx	[%g1+0x028],%l5		! %l5 = a910899852c00f53
	ldx	[%g1+0x030],%l6		! %l6 = d07f6d980044b265
	ldx	[%g1+0x038],%l7		! %l7 = f94d015a0a670fac

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
	xor	%l3,%l0,%l1
	sub	%l4,%l5,%l3
	umul	%l5,0xa0c,%l6
	ldub	[%i6+0x01b],%l5		! Mem[000000001018141b]
	ld	[%i6+0x010],%f3 	! Mem[0000000010181410]
	jmpl	%o7,%g0
	smul	%l3,-0x5b0,%l1
p0_near_0_he:
	sdivx	%l0,0x95f,%l0
	jmpl	%o7,%g0
	sdivx	%l7,-0x0ab,%l4
near0_b2b_h:
	smul	%l1,0x4c8,%l3
	add	%l6,-0xc1d,%l2
	addc	%l6,-0xfa4,%l5
	and	%l5,%l6,%l0
	udivx	%l4,%l7,%l3
	jmpl	%o7,%g0
	addc	%l2,%l6,%l7
near0_b2b_l:
	xor	%l3,0x7e9,%l0
	andn	%l3,0xd6b,%l0
	mulx	%l0,%l1,%l1
	sdivx	%l3,0x566,%l5
	udivx	%l4,%l2,%l5
	jmpl	%o7,%g0
	smul	%l3,%l1,%l4
user_near0_end:
	.seg	"text"
	.align	0x2000
user_near1_start:
p0_near_1_le:
	swap	[%i5+0x004],%l5		! Mem[0000000010141404]
	ldsb	[%i1+0x012],%l5		! Mem[0000000010041412]
	udivx	%l0,%l7,%l4
	add	%l2,0x4b2,%l6
	std	%f6 ,[%i3+0x028]	! Mem[00000000100c1428]
	jmpl	%o7,%g0
	subc	%l0,%l4,%l2
p0_near_1_he:
	stx	%l3,[%i3+0x000]		! Mem[00000000100c1400]
	jmpl	%o7,%g0
	swap	[%i4+0x014],%l3		! Mem[0000000010101414]
near1_b2b_h:
	udivx	%l0,0x716,%l4
	jmpl	%o7,%g0
	subc	%l7,%l3,%l4
near1_b2b_l:
	orn	%l0,-0x0e1,%l5
	jmpl	%o7,%g0
	andn	%l2,-0xbea,%l4
user_near1_end:
	.seg	"text"
	.align	0x2000
user_near2_start:
p0_near_2_le:
	orn	%l7,-0x585,%l5
	std	%l2,[%i6+0x030]		! Mem[0000000010181430]
	or	%l4,-0x191,%l0
	smul	%l5,%l6,%l4
	mulx	%l6,%l4,%l1
	ldstub	[%o0+0x001],%l0		! Mem[00000000201c0001]
	sth	%l6,[%i5+0x004]		! Mem[0000000010141404]
	jmpl	%o7,%g0
	udivx	%l5,%l3,%l7
p0_near_2_he:
	sth	%l2,[%i4+0x034]		! Mem[0000000010101434]
	addc	%l0,0x97b,%l0
	stx	%l2,[%i2+0x038]		! Mem[0000000010081438]
	ldstub	[%o1+0x040],%l3		! Mem[0000000020800040]
	ldub	[%i3+0x00a],%l2		! Mem[00000000100c140a]
	subc	%l1,0xc30,%l0
	ldsb	[%i4+0x02c],%l3		! Mem[000000001010142c]
	jmpl	%o7,%g0
	and	%l1,%l3,%l3
near2_b2b_h:
	and	%l0,%l6,%l1
	or	%l2,-0x893,%l3
	jmpl	%o7,%g0
	and	%l1,0x44b,%l3
near2_b2b_l:
	mulx	%l2,0x293,%l6
	xnor	%l1,%l6,%l1
	jmpl	%o7,%g0
	add	%l7,%l5,%l3
user_near2_end:
	.seg	"text"
	.align	0x2000
user_near3_start:
p0_near_3_le:
	sth	%l4,[%i4+0x038]		! Mem[0000000010101438]
	ld	[%i4+0x008],%f1 	! Mem[0000000010101408]
	jmpl	%o7,%g0
	sth	%l7,[%i1+0x016]		! Mem[0000000010041416]
p0_near_3_he:
	and	%l1,%l2,%l4
	jmpl	%o7,%g0
	std	%l6,[%i0+0x008]		! Mem[0000000010001408]
near3_b2b_h:
	smul	%l3,%l3,%l6
	udivx	%l0,%l4,%l6
	andn	%l6,%l4,%l5
	xor	%l7,%l0,%l1
	jmpl	%o7,%g0
	udivx	%l5,%l2,%l7
near3_b2b_l:
	xnor	%l6,%l3,%l1
	udivx	%l0,0x145,%l2
	xor	%l3,%l0,%l1
	or	%l1,%l1,%l5
	jmpl	%o7,%g0
	umul	%l7,%l1,%l7
user_near3_end:
	.seg	"text"
	.text
	.align	0x2000
user_far0_start:
p0_far_0_le:
	ldstub	[%o1+0x040],%l0		! Mem[0000000020800040]
	xor	%l3,%l5,%l5
	ldstub	[%i5+0x036],%l7		! Mem[0000000010141436]
	jmpl	%o7,%g0
	ldstub	[%i6+0x039],%l2		! Mem[0000000010181439]
p0_far_0_lem:
	ldstub	[%o1+0x040],%l0		! Mem[0000000020800040]
	xor	%l3,%l5,%l5
	membar	#Sync
	ldstub	[%i5+0x036],%l7		! Mem[0000000010141436]
	membar	#Sync
	jmpl	%o7,%g0
	ldstub	[%i6+0x039],%l2		! Mem[0000000010181439]
p0_far_0_he:
	and	%l5,0x45b,%l4
	ldstub	[%o3+0x181],%l2		! Mem[0000000021800181]
	st	%f22,[%i1+0x038]	! Mem[0000000010041438]
	ldd	[%i6+0x020],%f26	! Mem[0000000010181420]
	ldsw	[%i2+0x038],%l7		! Mem[0000000010081438]
	ldstub	[%i3+0x033],%l6		! Mem[00000000100c1433]
	jmpl	%o7,%g0
	nop
p0_far_0_hem:
	and	%l5,0x45b,%l4
	ldstub	[%o3+0x181],%l2		! Mem[0000000021800181]
	membar	#Sync
	st	%f22,[%i1+0x038]	! Mem[0000000010041438]
	ldd	[%i6+0x020],%f26	! Mem[0000000010181420]
	ldsw	[%i2+0x038],%l7		! Mem[0000000010081438]
	ldstub	[%i3+0x033],%l6		! Mem[00000000100c1433]
	jmpl	%o7,%g0
	nop
p0_loop_branch_0:
	jmpl	%o7+12,%g0
	add	%l0,1,%l0
far0_b2b_h:
	nop
	andn	%l2,%l4,%l7
	or	%l1,%l0,%l6
	or	%l2,%l0,%l6
	sub	%l4,%l0,%l7
	jmpl	%o7,%g0
	udivx	%l3,%l4,%l5
far0_b2b_l:
	orn	%l6,-0x842,%l0
	nop
	and	%l0,%l1,%l1
	orn	%l7,%l1,%l4
	addc	%l1,-0xdd3,%l2
	jmpl	%o7,%g0
	nop
user_far0_end:
	.seg	"text"
	.text
	.align	0x2000
user_far1_start:
p0_far_1_le:
	mulx	%l0,%l3,%l3
	or	%l7,0x83b,%l5
	jmpl	%o7,%g0
	or	%l4,-0x910,%l4
p0_far_1_lem:
	mulx	%l0,%l3,%l3
	or	%l7,0x83b,%l5
	jmpl	%o7,%g0
	or	%l4,-0x910,%l4
p0_far_1_he:
	std	%f18,[%i1+0x008]	! Mem[0000000010041408]
	ld	[%i0+0x008],%f22	! Mem[0000000010001408]
	ldd	[%i6+0x018],%l0		! Mem[0000000010181418]
	ldsw	[%i6+0x030],%l4		! Mem[0000000010181430]
	andn	%l2,-0xb12,%l2
	std	%f22,[%i4+0x030]	! Mem[0000000010101430]
	jmpl	%o7,%g0
	ldstub	[%o1+0x000],%l5		! Mem[0000000020800000]
p0_far_1_hem:
	membar	#Sync
	std	%f18,[%i1+0x008]	! Mem[0000000010041408]
	ld	[%i0+0x008],%f22	! Mem[0000000010001408]
	ldd	[%i6+0x018],%l0		! Mem[0000000010181418]
	ldsw	[%i6+0x030],%l4		! Mem[0000000010181430]
	andn	%l2,-0xb12,%l2
	std	%f22,[%i4+0x030]	! Mem[0000000010101430]
	jmpl	%o7,%g0
	ldstub	[%o1+0x000],%l5		! Mem[0000000020800000]
p0_loop_branch_1:
	jmpl	%o7+12,%g0
	add	%l0,2,%l0
far1_b2b_h:
	nop
	nop
	or	%l7,%l5,%l6
	jmpl	%o7,%g0
	subc	%l2,0x9e6,%l0
far1_b2b_l:
	orn	%l6,0xa19,%l7
	subc	%l4,%l6,%l4
	subc	%l0,0x8f9,%l2
	jmpl	%o7,%g0
	xnor	%l2,%l4,%l0
user_far1_end:
	.seg	"text"
	.text
	.align	0x2000
user_far2_start:
p0_far_2_le:
	stw	%l1,[%i4+0x004]		! Mem[0000000010101404]
	xor	%l4,-0x7e1,%l1
	addc	%l7,0xb61,%l6
	add	%l2,%l6,%l0
	jmpl	%o7,%g0
	ldsb	[%i3+0x01a],%l7		! Mem[00000000100c141a]
p0_far_2_lem:
	membar	#Sync
	stw	%l1,[%i4+0x004]		! Mem[0000000010101404]
	xor	%l4,-0x7e1,%l1
	addc	%l7,0xb61,%l6
	add	%l2,%l6,%l0
	membar	#Sync
	jmpl	%o7,%g0
	ldsb	[%i3+0x01a],%l7		! Mem[00000000100c141a]
p0_far_2_he:
	ldstub	[%o1+0x041],%l7		! Mem[0000000020800041]
	or	%l6,-0x437,%l3
	xnor	%l3,-0x432,%l5
	std	%l0,[%i4+0x010]		! Mem[0000000010101410]
	ldstub	[%i0+0x002],%l4		! Mem[0000000010001402]
	ldub	[%i3+0x03b],%l2		! Mem[00000000100c143b]
	jmpl	%o7,%g0
	smul	%l3,0xb77,%l4
p0_far_2_hem:
	ldstub	[%o1+0x041],%l7		! Mem[0000000020800041]
	or	%l6,-0x437,%l3
	xnor	%l3,-0x432,%l5
	membar	#Sync
	std	%l0,[%i4+0x010]		! Mem[0000000010101410]
	ldstub	[%i0+0x002],%l4		! Mem[0000000010001402]
	ldub	[%i3+0x03b],%l2		! Mem[00000000100c143b]
	jmpl	%o7,%g0
	smul	%l3,0xb77,%l4
p0_loop_branch_2:
	jmpl	%o7+12,%g0
	add	%l0,3,%l0
far2_b2b_h:
	jmpl	%o7,%g0
	or	%l4,%l4,%l2
	jmpl	%o7,%g0
	nop
far2_b2b_l:
	jmpl	%o7,%g0
	subc	%l1,%l0,%l3
	jmpl	%o7,%g0
	nop
user_far2_end:
	.seg	"text"
	.text
	.align	0x2000
user_far3_start:
p0_far_3_le:
	xnor	%l4,%l6,%l6
	mulx	%l6,0xcf2,%l2
	stx	%l6,[%i0+0x020]		! Mem[0000000010001420]
	xnor	%l4,0xdb7,%l2
	lduw	[%i6+0x018],%l0		! Mem[0000000010181418]
	sdivx	%l1,%l7,%l0
	jmpl	%o7,%g0
	ldd	[%i6+0x028],%f12	! Mem[0000000010181428]
p0_far_3_lem:
	xnor	%l4,%l6,%l6
	mulx	%l6,0xcf2,%l2
	membar	#Sync
	stx	%l6,[%i0+0x020]		! Mem[0000000010001420]
	xnor	%l4,0xdb7,%l2
	lduw	[%i6+0x018],%l0		! Mem[0000000010181418]
	sdivx	%l1,%l7,%l0
	membar	#Sync
	jmpl	%o7,%g0
	ldd	[%i6+0x028],%f12	! Mem[0000000010181428]
p0_far_3_he:
	subc	%l2,0xf0e,%l2
	ldstub	[%i0+0x001],%l2		! Mem[0000000010001401]
	ldstub	[%i4+0x00d],%l2		! Mem[000000001010140d]
	and	%l3,%l5,%l1
	sth	%l3,[%i1+0x030]		! Mem[0000000010041430]
	subc	%l3,%l4,%l2
	jmpl	%o7,%g0
	andn	%l2,%l2,%l1
p0_far_3_hem:
	subc	%l2,0xf0e,%l2
	membar	#Sync
	ldstub	[%i0+0x001],%l2		! Mem[0000000010001401]
	ldstub	[%i4+0x00d],%l2		! Mem[000000001010140d]
	and	%l3,%l5,%l1
	sth	%l3,[%i1+0x030]		! Mem[0000000010041430]
	subc	%l3,%l4,%l2
	jmpl	%o7,%g0
	andn	%l2,%l2,%l1
p0_loop_branch_3:
	jmpl	%o7+12,%g0
	add	%l0,4,%l0
far3_b2b_h:
	and	%l1,%l4,%l3
	jmpl	%o7,%g0
	or	%l6,0xb4a,%l1
far3_b2b_l:
	add	%l4,%l5,%l2
	jmpl	%o7,%g0
	or	%l0,-0x445,%l6
user_far3_end:
	.seg	"text"
	.align	0x2000
user_jump0_start:
	INIT_MEM(0, 0x0010, 1, +, 0, +, 0)
p0_jmpl_0_le:
	ldsh	[%i3+0x032],%l7		! Mem[00000000100c1432]
	ldsw	[%i5+0x004],%l5		! Mem[0000000010141404]
	nop
	ldstub	[%i4+0x032],%l0		! Mem[0000000010101432]
	ldstub	[%o1+0x000],%l0		! Mem[0000000020800000]
	jmpl	%g6+8,%g0
	ldd	[%i6+0x020],%f2 	! Mem[0000000010181420]
p0_call_0_le:
	sdivx	%l6,0xcb4,%l2
	sub	%l4,-0x0e6,%l5
	std	%f8 ,[%i1+0x030]	! Mem[0000000010041430]
	smul	%l4,%l2,%l6
	ldsb	[%i1+0x031],%l2		! Mem[0000000010041431]
	ldsb	[%i0+0x01a],%l5		! Mem[000000001000141a]
	ldub	[%i5+0x00c],%l2		! Mem[000000001014140c]
	retl
	swap	[%i1+0x01c],%l3		! Mem[000000001004141c]
p0_jmpl_0_lo:
	ldsh	[%o3+0x032],%l7		! Mem[00000000100c1432]
	ldsw	[%o5+0x004],%l5		! Mem[0000000010141404]
	nop
	ldstub	[%o4+0x032],%l0		! Mem[0000000010101432]
	ldstub	[%i1+0x000],%l0		! Mem[0000000020800000]
	jmpl	%g6+8,%g0
	ldd	[%o6+0x020],%f2 	! Mem[0000000010181420]
p0_call_0_lo:
	sdivx	%l6,0xcb4,%l2
	sub	%l4,-0x0e6,%l5
	std	%f8 ,[%o1+0x030]	! Mem[0000000010041430]
	smul	%l4,%l2,%l6
	ldsb	[%o1+0x031],%l2		! Mem[0000000010041431]
	ldsb	[%o0+0x01a],%l5		! Mem[000000001000141a]
	ldub	[%o5+0x00c],%l2		! Mem[000000001014140c]
	retl
	swap	[%o1+0x01c],%l3		! Mem[000000001004141c]
p0_jmpl_0_he:
	mulx	%l7,0x334,%l1
	st	%f20,[%i6+0x000]	! Mem[0000000010181400]
	stw	%l4,[%i1+0x02c]		! Mem[000000001004142c]
	stb	%l4,[%i3+0x01d]		! Mem[00000000100c141d]
	ldstub	[%o3+0x040],%l5		! Mem[0000000021800040]
	jmpl	%g6+8,%g0
	nop
p0_call_0_he:
	mulx	%l1,-0x7bf,%l0
	std	%l2,[%i0+0x018]		! Mem[0000000010001418]
	retl
	sdivx	%l7,0x099,%l3
p0_jmpl_0_ho:
	mulx	%l7,0x334,%l1
	st	%f20,[%o6+0x000]	! Mem[0000000010181400]
	stw	%l4,[%o1+0x02c]		! Mem[000000001004142c]
	stb	%l4,[%o3+0x01d]		! Mem[00000000100c141d]
	ldstub	[%i3+0x040],%l5		! Mem[0000000021800040]
	jmpl	%g6+8,%g0
	nop
p0_call_0_ho:
	mulx	%l1,-0x7bf,%l0
	std	%l2,[%o0+0x018]		! Mem[0000000010001418]
	retl
	sdivx	%l7,0x099,%l3
user_jump0_end:
	.seg	"text"
	.align	0x2000
user_jump1_start:
	INIT_MEM(0, 0x0020, 1, +, 0, +, 0)
p0_jmpl_1_le:
	ldstub	[%i1+0x032],%l2		! Mem[0000000010041432]
	jmpl	%g6+8,%g0
	st	%f13,[%i5+0x008]	! Mem[0000000010141408]
p0_call_1_le:
	or	%l0,%l0,%l5
	umul	%l1,-0x7db,%l3
	andn	%l4,0xb81,%l6
	ldsw	[%i4+0x024],%l3		! Mem[0000000010101424]
	retl
	umul	%l3,0x162,%l7
p0_jmpl_1_lo:
	ldstub	[%o1+0x032],%l2		! Mem[0000000010041432]
	jmpl	%g6+8,%g0
	st	%f13,[%o5+0x008]	! Mem[0000000010141408]
p0_call_1_lo:
	or	%l0,%l0,%l5
	umul	%l1,-0x7db,%l3
	andn	%l4,0xb81,%l6
	ldsw	[%o4+0x024],%l3		! Mem[0000000010101424]
	retl
	umul	%l3,0x162,%l7
p0_jmpl_1_he:
	stw	%l1,[%i3+0x02c]		! Mem[00000000100c142c]
	orn	%l6,0x219,%l5
	andn	%l3,%l4,%l5
	jmpl	%g6+8,%g0
	add	%l7,0xad1,%l0
p0_call_1_he:
	lduh	[%i1+0x02e],%l4		! Mem[000000001004142e]
	or	%l1,-0x4a1,%l1
	and	%l1,%l4,%l6
	swap	[%i4+0x024],%l5		! Mem[0000000010101424]
	sdivx	%l5,%l3,%l2
	retl
	sub	%l1,-0x712,%l5
p0_jmpl_1_ho:
	stw	%l1,[%o3+0x02c]		! Mem[00000000100c142c]
	orn	%l6,0x219,%l5
	andn	%l3,%l4,%l5
	jmpl	%g6+8,%g0
	add	%l7,0xad1,%l0
p0_call_1_ho:
	lduh	[%o1+0x02e],%l4		! Mem[000000001004142e]
	or	%l1,-0x4a1,%l1
	and	%l1,%l4,%l6
	swap	[%o4+0x024],%l5		! Mem[0000000010101424]
	sdivx	%l5,%l3,%l2
	retl
	sub	%l1,-0x712,%l5
user_jump1_end:
	.seg	"text"
	.align	0x2000
user_jump2_start:
	INIT_MEM(0, 0x0030, 1, +, 0, +, 0)
p0_jmpl_2_le:
	ldd	[%i0+0x008],%l0		! Mem[0000000010001408]
	subc	%l6,0xa47,%l2
	udivx	%l0,0xdf6,%l1
	ldstub	[%o1+0x040],%l5		! Mem[0000000020800040]
	ld	[%i1+0x024],%f6 	! Mem[0000000010041424]
	jmpl	%g6+8,%g0
	swap	[%i4+0x018],%l7		! Mem[0000000010101418]
p0_call_2_le:
	retl
	ldstub	[%o2+0x001],%l0		! Mem[00000000211c0001]
p0_jmpl_2_lo:
	ldd	[%o0+0x008],%l0		! Mem[0000000010001408]
	subc	%l6,0xa47,%l2
	udivx	%l0,0xdf6,%l1
	ldstub	[%i1+0x040],%l5		! Mem[0000000020800040]
	ld	[%o1+0x024],%f6 	! Mem[0000000010041424]
	jmpl	%g6+8,%g0
	swap	[%o4+0x018],%l7		! Mem[0000000010101418]
p0_call_2_lo:
	retl
	ldstub	[%i2+0x001],%l0		! Mem[00000000211c0001]
p0_jmpl_2_he:
	andn	%l7,%l4,%l5
	ldsb	[%i0+0x002],%l0		! Mem[0000000010001402]
	stx	%l0,[%i6+0x028]		! Mem[0000000010181428]
	std	%f26,[%i5+0x038]	! Mem[0000000010141438]
	jmpl	%g6+8,%g0
	ld	[%i2+0x024],%f21	! Mem[0000000010081424]
p0_call_2_he:
	retl
	xnor	%l1,%l5,%l2
p0_jmpl_2_ho:
	andn	%l7,%l4,%l5
	ldsb	[%o0+0x002],%l0		! Mem[0000000010001402]
	stx	%l0,[%o6+0x028]		! Mem[0000000010181428]
	std	%f26,[%o5+0x038]	! Mem[0000000010141438]
	jmpl	%g6+8,%g0
	ld	[%o2+0x024],%f21	! Mem[0000000010081424]
p0_call_2_ho:
	retl
	xnor	%l1,%l5,%l2
user_jump2_end:
	.seg	"text"
	.align	0x2000
user_jump3_start:
	INIT_MEM(0, 0x0040, 1, +, 0, +, 0)
p0_jmpl_3_le:
	orn	%l7,%l4,%l4
	mulx	%l0,%l0,%l4
	ldx	[%i5+0x020],%l5		! Mem[0000000010141420]
	mulx	%l6,-0x0dd,%l3
	swap	[%i3+0x014],%l6		! Mem[00000000100c1414]
	ldub	[%i4+0x038],%l4		! Mem[0000000010101438]
	st	%f9 ,[%i4+0x030]	! Mem[0000000010101430]
	jmpl	%g6+8,%g0
	subc	%l7,%l5,%l3
p0_call_3_le:
	retl
	stb	%l4,[%i6+0x00b]		! Mem[000000001018140b]
p0_jmpl_3_lo:
	orn	%l7,%l4,%l4
	mulx	%l0,%l0,%l4
	ldx	[%o5+0x020],%l5		! Mem[0000000010141420]
	mulx	%l6,-0x0dd,%l3
	swap	[%o3+0x014],%l6		! Mem[00000000100c1414]
	ldub	[%o4+0x038],%l4		! Mem[0000000010101438]
	st	%f9 ,[%o4+0x030]	! Mem[0000000010101430]
	jmpl	%g6+8,%g0
	subc	%l7,%l5,%l3
p0_call_3_lo:
	retl
	stb	%l4,[%o6+0x00b]		! Mem[000000001018140b]
p0_jmpl_3_he:
	ldsh	[%i6+0x002],%l1		! Mem[0000000010181402]
	orn	%l7,0x7b7,%l6
	and	%l3,%l2,%l1
	ldstub	[%i6+0x015],%l5		! Mem[0000000010181415]
	std	%f26,[%i2+0x030]	! Mem[0000000010081430]
	ldd	[%i4+0x030],%f24	! Mem[0000000010101430]
	swap	[%i2+0x000],%l4		! Mem[0000000010081400]
	jmpl	%g6+8,%g0
	stx	%l4,[%i4+0x010]		! Mem[0000000010101410]
p0_call_3_he:
	retl
	addc	%l6,0x48f,%l5
p0_jmpl_3_ho:
	ldsh	[%o6+0x002],%l1		! Mem[0000000010181402]
	orn	%l7,0x7b7,%l6
	and	%l3,%l2,%l1
	ldstub	[%o6+0x015],%l5		! Mem[0000000010181415]
	std	%f26,[%o2+0x030]	! Mem[0000000010081430]
	ldd	[%o4+0x030],%f24	! Mem[0000000010101430]
	swap	[%o2+0x000],%l4		! Mem[0000000010081400]
	jmpl	%g6+8,%g0
	stx	%l4,[%o4+0x010]		! Mem[0000000010101410]
p0_call_3_ho:
	retl
	addc	%l6,0x48f,%l5
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
	.word	0xfb8d8dca,0x8f37d102		! Init value for %l0
	.word	0xa68acbae,0x127aa947		! Init value for %l1
	.word	0xc71c16ca,0x6d4674a6		! Init value for %l2
	.word	0x6f99a784,0x0af0b676		! Init value for %l3
	.word	0x8b876ce6,0x3e139bbb		! Init value for %l4
	.word	0xa9108998,0x52c00f53		! Init value for %l5
	.word	0xd07f6d98,0x0044b265		! Init value for %l6
	.word	0xf94d015a,0x0a670fac		! Init value for %l7
	.align	64
p0_init_freg:
	.word	0xb64e7977,0x827cf18e		! Init value for %f0 
	.word	0x03dbb449,0x87c60567		! Init value for %f2 
	.word	0x3bbcf463,0xc7e84f33		! Init value for %f4 
	.word	0x4234295e,0x29228649		! Init value for %f6 
	.word	0x651c3250,0x06909cc7		! Init value for %f8 
	.word	0x94491724,0x412ccb02		! Init value for %f10
	.word	0x622881be,0xedd6e5c6		! Init value for %f12
	.word	0xa3716dda,0x978a5a90		! Init value for %f14
	.word	0x43d85bfd,0x881552c0		! Init value for %f16
	.word	0x783d37e1,0x6dd7848f		! Init value for %f18
	.word	0x061dd94d,0x09f86ad9		! Init value for %f20
	.word	0xa8417509,0xabda6f33		! Init value for %f22
	.word	0xd5d0d4dc,0xcb2b7647		! Init value for %f24
	.word	0x59926947,0xa41fde32		! Init value for %f26
	.word	0xc062cc2e,0x8f353365		! Init value for %f28
	.word	0x123ad57e,0x10c1267b		! Init value for %f30
	.word	0xf88d1055,0x36977201		! Init value for %f32
	.word	0x0719f6e2,0xb3edd8ba		! Init value for %f34
	.word	0xda121fd2,0x4b137dda		! Init value for %f36
	.word	0xc94065f5,0x808c2415		! Init value for %f38
	.word	0xf84e78a8,0xcc6887d2		! Init value for %f40
	.word	0xcd830b86,0x494ed595		! Init value for %f42
	.word	0xefa1995d,0xda4f451d		! Init value for %f44
	.word	0xecf650b1,0x4b94d956		! Init value for %f46
	.word	0x904d65d3,0x1558abbc
	.word	0x72423b27,0x117b51e4
	.word	0x3f76fe49,0x8aa175b5
	.word	0x2a9835cc,0xa4e92f70
	.word	0xcdbd5c47,0x7feaa424
	.word	0xeb635c46,0x580137a1
	.word	0x9d1e9a54,0x4e7a4e1f
	.word	0xfbda8a97,0x87bd2f6b
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
	.word	0x00000000,0x000000a4
	.word	0x00000000,0xff3d37e1
	.word	0x00000000,0x000000ff
	.word	0x00000000,0xff000000
	.word	0x00000000,0x00000000
	.word	0x00000000,0x000000ff
	.word	0x00000000,0x000000ff
	.word	0x00000000,0x00000000
p0_expected_fp_regs:
	.word	0xe1373dff,0x9c873bff
	.word	0xffffffff,0xffffffff
	.word	0x005fff00,0xffffff00
	.word	0xcdb502d1,0x295bdcc7
	.word	0x518a9713,0x775b9449
	.word	0x00000000,0xe1ffffff
	.word	0x37e10000,0x37e1ffff
	.word	0x000006f6,0x68e6ff57
	.word	0xffffffff,0xffffe137
	.word	0x000006ff,0x00000000
	.word	0x00000000,0x37e10000
	.word	0xffffffff,0xffffe137
	.word	0x00ff5f00,0x00ff5f00
	.word	0xffffff1d,0x00000000
	.word	0xffffe137,0xff000000
	.word	0x00ff5f00,0x00000000
	.word	0x00000000,0x00000000		! %fsr = 0000000000000000
p0_local0_expect:
	.word	0x000000ff,0x00000000
	.word	0xff000000,0xff000000
	.word	0x000006f6,0x68e6ff57
	.word	0x00000000,0xffffffb8
	.word	0x000000ff,0x005fff00
	.word	0x00000000,0x00000000
	.word	0x000000ff,0x37e1ffff
	.word	0x00000000,0x005fff00
p0_local0_sec_expect:
	.word	0x00ffffff,0xffffe137
	.word	0xff000000,0xd102b5ff
	.word	0x00000000,0x00000000
	.word	0xb8ffffff,0x00000000
	.word	0x00ff5f00,0x00ff5f00
	.word	0x000000ff,0x00000000
	.word	0xffffe137,0xff000000
	.word	0x00000000,0xffffff6e
p0_local1_expect:
	.word	0xb8ffffff,0x00000000
	.word	0x37e1ffff,0xffffffff
	.word	0xffffffff,0x000000ff
	.word	0xb1ac8a3b,0x1dff5bae
	.word	0x000006ff,0x00000000
	.word	0x68e6ff57,0xd6fa8c51
	.word	0x0e510fed,0x1dffffff
	.word	0xff0000f2,0xa19e6944
p0_local1_sec_expect:
	.word	0x9c873bff,0xff3d37e1
	.word	0x00ffffff,0x00ff5f00
	.word	0xd102b5ff,0x00000000
	.word	0xc7dc5b29,0xd102b5cd
	.word	0x49945b77,0x13978a51
	.word	0xffffffe1,0x00000000
	.word	0xffffe137,0x0000e137
	.word	0x965c37e1,0xf6060000
p0_local2_expect:
	.word	0xffff00ff,0xffffffff
	.word	0x00000000,0xff000000
	.word	0xffffff00,0x00000000
	.word	0x00000000,0x0000ff00
	.word	0x518cfad6,0x00000000
	.word	0x00000000,0x00000000
	.word	0x00000000,0x000000e1
	.word	0x965c3757,0xb1cdff00
p0_local2_sec_expect:
	.word	0xffffffff,0xffffffff
	.word	0x00000000,0x37e1ffff
	.word	0x00000000,0xb5000000
	.word	0x24174994,0x000000f6
	.word	0x3b8aacb1,0x6e1e92a8
	.word	0x00000000,0x0000783d
	.word	0x94491724,0x52e548c3
	.word	0xd1022890,0xcdb502d1
p0_local3_expect:
	.word	0xff000000,0x000000ff
	.word	0xffffffff,0x00000037
	.word	0xffb502d1,0xffffffff
	.word	0xffffffff,0xffffffff
	.word	0xffffffff,0xffffe137
	.word	0x37e1ffff,0x000000ff
	.word	0xc34866ff,0x783d4994
	.word	0x68e6ff57,0x00000000
p0_local3_sec_expect:
	.word	0x00000000,0x0000e137
	.word	0x000000ff,0xffffff6e
	.word	0xff000000,0x00000000
	.word	0xc7dc5b29,0xd102b5cd
	.word	0x49945b77,0x13978a51
	.word	0x00ffffff,0xffffe137
	.word	0x0e510fed,0x4fc855b8
	.word	0x965c37e1,0xf6060000
p0_local4_expect:
	.word	0x000000e1,0x00000000
	.word	0xff000000,0x0000e137
	.word	0xff0000ff,0x00000000
	.word	0x71e8411b,0x5ad71e3b
	.word	0xff8a9713,0x775b94ff
	.word	0xe13700ff,0xd700e1ff
	.word	0x0000ff3d,0xffffffff
	.word	0x00000000,0x0000ffff
p0_local4_sec_expect:
	.word	0xffb502d1,0x295bdcc7
	.word	0x00000000,0x00000000
	.word	0x00000000,0xed0f510e
	.word	0xf800e2f2,0x35ade500
	.word	0xd96af809,0x948a6312
	.word	0xffffffff,0xd6fa8c51
	.word	0x00008f57,0xb1cdffff
	.word	0xff0000f2,0xa19e6944
p0_local5_expect:
	.word	0x00000000,0x9c873bff
	.word	0x00000000,0xff000000
	.word	0xff000000,0x37e1ffff
	.word	0xcdb5ffd1,0x295bdcc7
	.word	0x518a9713,0x775b9449
	.word	0x00000000,0xe1ffffff
	.word	0x37e10000,0x37e1ffff
	.word	0x000006f6,0xe1375c96
p0_local5_sec_expect:
	.word	0x00000000,0x1dffffff
	.word	0xff000000,0xffffe137
	.word	0xff000000,0x00000000
	.word	0x3b1ed75a,0x1b41e871
	.word	0x2723af57,0xbac23955
	.word	0xf2e25d08,0x005fff00
	.word	0x93ab8046,0x52e548c3
	.word	0x7403c892,0x43ca1dd3
p0_local6_expect:
	.word	0xff0000ff,0xff000000
	.word	0xff0000ff,0xff000000
	.word	0x3dff0000,0xff000000
	.word	0xc7dc5b29,0xffffff1d
	.word	0x37ffffff,0xffffffff
	.word	0xffffffff,0x00000037
	.word	0xffffffe1,0x4fc855b8
	.word	0x965c37e1,0xff000000
p0_local6_sec_expect:
	.word	0xffffffff,0x0000e137
	.word	0xffffffff,0xffffe137
	.word	0xff000000,0xe1ffffff
	.word	0xb1ac8a3b,0x1da45bae
	.word	0xd96af809,0x948a6312
	.word	0x9c8971bc,0xd6fa8c51
	.word	0x0000e137,0x0000ff3d
	.word	0xce75fb64,0xa19e6944
share0_expect:
	.word	0xffff851d,0xde8937aa
	.word	0xde82631a,0x6745b468
	.word	0x5610c0ea,0x4162d709
	.word	0xd8a4a5a1,0x8167a198
	.word	0x18b0d48e,0x0ea0138c
	.word	0x082f9616,0x1b4f587d
	.word	0x72e6ec0e,0x55df321b
	.word	0xf92b30f6,0x5cdb673a
share1_expect:
	.word	0xff009984,0x2bec91a7
	.word	0xfe5e67cb,0x581068a5
	.word	0x22022867,0x0810535b
	.word	0x123092c5,0x91af0f03
	.word	0x157251fd,0x0a58157f
	.word	0xd8af464d,0x438de4d1
	.word	0xe1d10f95,0x307759ce
	.word	0x1eafe96b,0x08c6de7f
	.word	0xffffb8ec,0xf2beaf4d
	.word	0x5f61a4b6,0xf0d51b6d
	.word	0x24a8c980,0x2f1ea9e6
	.word	0x62b5297b,0xc878e0f9
	.word	0xd24c817a,0x0e9f0f4c
	.word	0x91d42c75,0xf2c53123
	.word	0x59587949,0x678ec535
	.word	0xb718fd7a,0x1cb18583
share2_expect:
	.word	0xffffa37b,0x419acc1e
	.word	0xe88f11a2,0xc2e1d26f
	.word	0x792da353,0x5f8e1107
	.word	0x1e5937ff,0xb9a5be67
	.word	0xcef5c1b9,0xe5034501
	.word	0x93fb97f0,0xd8fc0758
	.word	0x3146b796,0xb5cc938d
	.word	0x15e56063,0x527367b8
share3_expect:
	.word	0xffff57e0,0x76cc7910
	.word	0x7e2c8b62,0x7b8b6ea4
	.word	0x6f958c74,0x76798a44
	.word	0x35081ccc,0x5edd64ad
	.word	0x4b307f3e,0x360dc1d4
	.word	0x77befed3,0xe00e49c7
	.word	0xfaf9021b,0xaa2f4afa
	.word	0x00ceabe4,0x3c742d1c
	.word	0xffff4289,0xc6fc6e66
	.word	0xe7328b6b,0xfb4cfa20
	.word	0x00e57a15,0x8a2dbd74
	.word	0xa15113af,0x6da1c168
	.word	0x7b586550,0x00fe719b
	.word	0xda68bd29,0x8fcc2f8c
	.word	0x5e362db6,0xf96522e2
	.word	0x8b252939,0x83911a7e
	.word	0xffff14cb,0x19ce252d
	.word	0x0a852c4e,0xbe598ab7
	.word	0x03ccf312,0xb52c2446
	.word	0x84a7216c,0x1b86c2af
	.word	0xe8621c4a,0xfb878f7f
	.word	0xe8045a8d,0xa157e818
	.word	0xef07f2b3,0x3cf505fe
	.word	0xc5ed017a,0x6b44ae8f
	.word	0xffffd561,0x0db4979c
	.word	0x33053dea,0xc6dbbb54
	.word	0x9f56ff5e,0xeeca61bf
	.word	0xc806d1a8,0xeafe8187
	.word	0xb985b1b9,0x523add46
	.word	0xdb9ec8b3,0x8670b6ab
	.word	0x3476b61a,0x81b40212
	.word	0x64ea8aa6,0x2c9d9979
	.word	0x5b005a3e,0xc00d1498
	.word	0x80f53c09,0xb6fdcb25
	.word	0x887794e6,0x16aa78b3
	.word	0x4f51f5d3,0xef8c5000
	.word	0x398da361,0xe6f4fcf3
	.word	0xe77bbea6,0x7177267a
	.word	0x14d99948,0xc762a774
	.word	0xc651988e,0x73343af6
	.word	0x00b52023,0x01750275
	.word	0x7104a89a,0xe1d73ff5
	.word	0x332fb3ff,0x966e20ce
	.word	0xeccfdb22,0xe9599dfe
	.word	0x5cef0576,0x1dcbe138
	.word	0x54a08e10,0xb34f837c
	.word	0xa2bf5920,0xc164ce47
	.word	0xea76dddd,0x7227205b
	.word	0x5f00d16c,0x89249a6e
	.word	0x60b02eca,0xcb4f9dc7
	.word	0x5eb5632b,0xd66ba0bb
	.word	0xad00f924,0x789730f1
	.word	0x96d0e92c,0xc93c6dd6
	.word	0x81d62bdd,0xba4e0c95
	.word	0x71b7c202,0x8b296e6b
	.word	0x822fe2b9,0xe5e92341
	.word	0xffff6d36,0xfd29576c
	.word	0x8c771932,0x184f47ca
	.word	0x4eb43808,0xffeb724a
	.word	0x3d669fa0,0x8845d527
	.word	0x4f57ece6,0xde1d53a8
	.word	0x05937090,0x2d45ebe0
	.word	0x1c3e0839,0x05a35133
	.word	0xb54c5e72,0x07d40398
p0_invalidate_semaphore:
	.word	0

!	Data for check points

	.align	8
p0_check_pt_data_1:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x63accd66		! Expected data for %l0
	.word	0x00000000,0x8d2ba881		! Expected data for %l1
	.word	0x00000000,0x00000078		! Expected data for %l3
	.word	0x00000000,0xd9690063		! Expected data for %l4
	.word	0x00000000,0x00000063		! Expected data for %l5
	.word	0x00000000,0x00000850		! Expected data for %l6
	.word	0x00000000,0x0000f7d8		! Expected data for %l7
	.word	0xb64e7977,0x827cf18e		! Expected data for %f0
	.word	0x0fde369b,0x87c60567		! Expected data for %f2
	.word	0x63aae7fa,0x573b7f97		! Expected data for %f4
	.word	0x4234295e,0x29228649		! Expected data for %f6
	.word	0x578fe668,0x06909cc7		! Expected data for %f8
	.word	0x43d85bfd,0xe1373d78		! Expected data for %f16
	.word	0xd5d0d4dc,0x7d9a73ba		! Expected data for %f24
	.word	0xd96af809,0xa41fde32		! Expected data for %f26
p0_check_pt_data_2:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x0000a562		! Expected data for %l0
	.word	0x8f84d76d,0xe1373d78		! Expected data for %l1
	.word	0xe8a2a285,0x7434707e		! Expected data for %l2
	.word	0xffffffff,0xd96af809		! Expected data for %l3
	.word	0x00000000,0x00000074		! Expected data for %l4
	.word	0xce9eb990,0xcb947cb9		! Expected data for %l5
	.word	0x00000000,0x00000000		! Expected data for %l6
	.word	0x00000000,0x00000057		! Expected data for %l7
	.word	0xb64e7977,0x827cf18e		! Expected data for %f0
	.word	0x74fbd6cf,0x26ac631b		! Expected data for %f2
	.word	0x63aae7fa,0x573b7f97		! Expected data for %f4
	.word	0x4234295e,0x29228649		! Expected data for %f6
p0_check_pt_data_3:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x00003d78		! Expected data for %l0
	.word	0xffffffff,0xffffa841		! Expected data for %l1
	.word	0x00000000,0x00002922		! Expected data for %l2
	.word	0x00000000,0x00000000		! Expected data for %l3
	.word	0x00000000,0xfff6cdb1		! Expected data for %l4
	.word	0x00000000,0x578fe668		! Expected data for %l5
	.word	0x00000000,0x79a894ef		! Expected data for %l6
	.word	0x00000000,0x0000008f		! Expected data for %l7
	.word	0xcdb502d1,0xa3bf2890		! Expected data for %f0
	.word	0x598aa05b,0x6a5df7d8		! Expected data for %f2
	.word	0x02cb2c41,0x24174994		! Expected data for %f4
	.word	0x71e8411b,0x5ad71e3b		! Expected data for %f6
	.word	0x5539c2ba,0x57af2327		! Expected data for %f8
	.word	0x3d99c199,0x085de2f2		! Expected data for %f10
	.word	0xc348e552,0xfff6cdb1		! Expected data for %f12
	.word	0x68e68f57,0xb1cdf6ff		! Expected data for %f14
	.word	0x783d37e1,0x98bc81af		! Expected data for %f18
	.word	0x68e68f57,0x10c1267b		! Expected data for %f30
p0_check_pt_data_4:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x4dd91dff		! Expected data for %l1
	.word	0x00000000,0x0000008f		! Expected data for %l2
	.word	0x00000000,0x00000000		! Expected data for %l3
	.word	0x00000000,0xd9690063		! Expected data for %l5
	.word	0x09f86ad9,0xd172c211		! Expected data for %l6
	.word	0xfc7325aa,0xaf810000		! Expected data for %l7
	.word	0x598aa05b,0x6a5df7d8		! Expected data for %f2
	.word	0x02cb2c41,0x24174994		! Expected data for %f4
	.word	0xa8490643,0xd9e62c7d		! Expected data for %f30
p0_check_pt_data_5:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0xdbae39bf,0xe2b9cac1		! Expected data for %l0
	.word	0x3428d277,0x9971df90		! Expected data for %l1
	.word	0x00000000,0x00000008		! Expected data for %l2
	.word	0x00000000,0x00000000		! Expected data for %l3
	.word	0x00000000,0x0000df37		! Expected data for %l4
	.word	0x00000000,0x0000004d		! Expected data for %l5
	.word	0x00000000,0x00000000		! Expected data for %l6
	.word	0x00000000,0x00000011		! Expected data for %l7
	.word	0x0000c211,0x000069d9		! Expected data for %f2
	.word	0x8ef17c82,0x7779df37		! Expected data for %f6
	.word	0x5539c2ba,0x3581cb85		! Expected data for %f8
	.word	0xef940000,0x00000000		! Expected data for %f24
	.word	0xd96af809,0xd9690063		! Expected data for %f26
p0_check_pt_data_6:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0xff000000,0xdcd4d0d5		! Expected data for %l0
	.word	0x00000000,0x0000cfff		! Expected data for %l1
	.word	0x00000000,0x1063cb77		! Expected data for %l2
	.word	0x00000000,0x00000000		! Expected data for %l3
	.word	0x00000000,0x000000ff		! Expected data for %l4
	.word	0x00000000,0xff37d102		! Expected data for %l5
	.word	0x00000000,0x00000000		! Expected data for %l6
	.word	0xd9ff06f6,0x76945c96		! Expected data for %l7
	.word	0x0000c211,0x000069d9		! Expected data for %f2
	.word	0x02cb2c41,0x24174994		! Expected data for %f4
	.word	0x8f84d76d,0xff1dd9ff		! Expected data for %f6
	.word	0xc348e552,0x24174994		! Expected data for %f12
	.word	0x7779df37,0x00000000		! Expected data for %f20
p0_check_pt_data_7:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x00000000		! Expected data for %l0
	.word	0x00000000,0x000049ff		! Expected data for %l1
	.word	0xffffffff,0xffff9157		! Expected data for %l2
	.word	0x00000000,0x00000002		! Expected data for %l3
	.word	0x00000000,0x4dd91d06		! Expected data for %l4
	.word	0x00000000,0xcdb502d1		! Expected data for %l6
	.word	0x00000000,0x00005f00		! Expected data for %l7
	.word	0x02cb2c41,0x24174994		! Expected data for %f4
	.word	0x8f84d76d,0xff1dd9ff		! Expected data for %f6
	.word	0xff1dd9ff,0x5791dab5		! Expected data for %f20
p0_check_pt_data_8:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x005f0000		! Expected data for %l0
	.word	0x00000000,0x000000ff		! Expected data for %l1
	.word	0x00000000,0xffd49157		! Expected data for %l2
	.word	0x00000000,0x0000d04d		! Expected data for %l3
	.word	0x00000000,0x00005f00		! Expected data for %l4
	.word	0x00000000,0x000000e1		! Expected data for %l5
	.word	0x00000000,0x000000a8		! Expected data for %l6
	.word	0xcdb502d1,0xa3bf2890		! Expected data for %f0
	.word	0x0068ac26,0xff1dd9ff		! Expected data for %f6
	.word	0x783d37e1,0x0000cfff		! Expected data for %f12
	.word	0xe1373d78,0x827cf18e		! Expected data for %f14
	.word	0x9028bfa3,0xd102b5cd		! Expected data for %f16
	.word	0xd9690000,0x11c20000		! Expected data for %f18
	.word	0x94491724,0x061dd94d		! Expected data for %f20
	.word	0xffd91dff,0x6dd7848f		! Expected data for %f22
	.word	0x85cb8135,0xbac23955		! Expected data for %f24
	.word	0xf2e25d08,0x99c1993d		! Expected data for %f26
	.word	0x94491724,0x52e548c3		! Expected data for %f28
	.word	0xffffcdb1,0x00000000		! Expected data for %f30
p0_check_pt_data_9:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0xff000000		! Expected data for %l0
	.word	0x00000000,0x000000ff		! Expected data for %l1
	.word	0x00000000,0x000000ff		! Expected data for %l2
	.word	0x00000000,0x0000006e		! Expected data for %l3
	.word	0x00000000,0x00000000		! Expected data for %l4
	.word	0x00000000,0x000000d0		! Expected data for %l5
	.word	0x00000000,0xffffffff		! Expected data for %l6
	.word	0x00000000,0x00000000		! Expected data for %l7
	.word	0x00000000,0x00000000		! Expected data for %f0
	.word	0x02cb2c41,0x630069d9		! Expected data for %f4
	.word	0x0068ac26,0xff1dd9ff		! Expected data for %f6
	.word	0x5539c2ba,0x0fde36ff		! Expected data for %f8
	.word	0x00000000,0x000000d0		! Expected data for %f30
p0_check_pt_data_10:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x00000000		! Expected data for %l0
	.word	0xffffffff,0xff1dd94d		! Expected data for %l1
	.word	0x00000000,0x00000002		! Expected data for %l2
	.word	0x00000000,0x241749ff		! Expected data for %l3
	.word	0x00000000,0x000069d9		! Expected data for %l4
	.word	0x00000000,0x00000000		! Expected data for %l5
	.word	0x00000000,0x00000000		! Expected data for %l6
	.word	0x00000000,0x65d0c689		! Expected data for %l7
	.word	0x00000000,0x00000000		! Expected data for %f0
	.word	0x00000000,0x993c43f4		! Expected data for %f2
	.word	0x630069d9,0x007ee51c		! Expected data for %f4
	.word	0x135abbdb,0xc99b887f		! Expected data for %f6
	.word	0x5311e374,0xddae6b21		! Expected data for %f8
	.word	0x58753f2f,0x3473a3d9		! Expected data for %f10
	.word	0x3a01337c,0xdc6b25e8		! Expected data for %f12
	.word	0x18295d59,0xc1b881ee		! Expected data for %f14
	.word	0x68e68f57,0x7f4e50ff		! Expected data for %f24
	.word	0x00000000,0x00000000		! Expected data for %f28
p0_check_pt_data_11:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0xffffcdb1		! Expected data for %l0
	.word	0xffffffff,0xffffe200		! Expected data for %l1
	.word	0x00000000,0x0000006e		! Expected data for %l2
	.word	0xffffffff,0xffffffff		! Expected data for %l3
	.word	0x00000000,0x020037e1		! Expected data for %l4
	.word	0x00000000,0xff1dd94d		! Expected data for %l5
	.word	0xffffffff,0xffffc100		! Expected data for %l6
	.word	0x94491724,0x00000000		! Expected data for %f0
	.word	0x4999c199,0x630069d9		! Expected data for %f2
	.word	0x00e25d08,0x412ccb02		! Expected data for %f4
	.word	0x3b1ed75a,0x1b41e871		! Expected data for %f6
	.word	0x2723af57,0xbac23955		! Expected data for %f8
	.word	0xf2e25d08,0x99c1993d		! Expected data for %f10
	.word	0x93ab8046,0x52e548c3		! Expected data for %f12
	.word	0x7403c892,0x43ca1dd3		! Expected data for %f14
	.word	0x00000000,0x085de2f2		! Expected data for %f18
	.word	0x8f84d76d,0x00000000		! Expected data for %f24
p0_check_pt_data_12:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x000000ff		! Expected data for %l0
	.word	0x00000000,0x000000ff		! Expected data for %l1
	.word	0x00000000,0x000000ff		! Expected data for %l2
	.word	0x00000000,0x000000ff		! Expected data for %l3
	.word	0x00000000,0xe1370002		! Expected data for %l4
	.word	0x00000000,0x085de2f2		! Expected data for %l5
	.word	0x00000000,0x000000ff		! Expected data for %l6
	.word	0xffffffff,0xcdb10000		! Expected data for %l7
	.word	0x4999c199,0x630069d9		! Expected data for %f2
	.word	0x00e25d08,0x412ccb02		! Expected data for %f4
	.word	0xf6ffff1d,0x35ade525		! Expected data for %f16
	.word	0x00000000,0x0fde36ff		! Expected data for %f18
p0_check_pt_data_13:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0xefa6d8e0,0x9085fb95		! Expected data for %l0
	.word	0x00000000,0x00000000		! Expected data for %l1
	.word	0x00000000,0x00006dd7		! Expected data for %l3
	.word	0x00000000,0x000000b1		! Expected data for %l4
	.word	0x00000000,0x00009500		! Expected data for %l5
	.word	0x00000000,0x00000000		! Expected data for %l6
	.word	0xffffffff,0xffffffc1		! Expected data for %l7
	.word	0x00e25d08,0x412ccb02		! Expected data for %f4
	.word	0x2723af57,0xffffcdb1		! Expected data for %f8
	.word	0x99c19949,0x99c1993d		! Expected data for %f10
	.word	0xffffffff,0xffff9449		! Expected data for %f22
	.word	0x0319074f,0x000000d0		! Expected data for %f30
p0_check_pt_data_14:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x00000000		! Expected data for %l0
	.word	0xffffffff,0xffffffc4		! Expected data for %l1
	.word	0x00000000,0x00000074		! Expected data for %l2
	.word	0x00000000,0x0000003d		! Expected data for %l3
	.word	0x00000000,0x085de2f2		! Expected data for %l4
	.word	0x00000000,0x00000000		! Expected data for %l5
	.word	0x00000000,0x000000ff		! Expected data for %l6
	.word	0x00000000,0x00000000		! Expected data for %l7
	.word	0x4999c199,0x630069d9		! Expected data for %f2
	.word	0x00000000,0x99c1993d		! Expected data for %f10
	.word	0xefa6d8e0,0x9085fb95		! Expected data for %f30
p0_check_pt_data_15:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x99c19949		! Expected data for %l0
	.word	0x00000000,0x000049ff		! Expected data for %l1
	.word	0x00000000,0x4999c199		! Expected data for %l2
	.word	0xffffffff,0xff000000		! Expected data for %l3
	.word	0x00000000,0x00000054		! Expected data for %l4
	.word	0x8f84d76d,0x49000000		! Expected data for %l6
	.word	0x00000000,0x00000090		! Expected data for %l7
	.word	0x000000ff,0x00000000		! Expected data for %f0
	.word	0x4999c199,0x630069d9		! Expected data for %f2
	.word	0x00e25d08,0x412ccb02		! Expected data for %f4
	.word	0x3b1ed75a,0x1b41e871		! Expected data for %f6
	.word	0x2723af57,0xffffcdb1		! Expected data for %f8
	.word	0x99c19949,0x99c1993d		! Expected data for %f10
	.word	0x93ab8046,0x52e548c3		! Expected data for %f12
	.word	0x7403c892,0x43ca1dd3		! Expected data for %f14
	.word	0x99c19949,0x35ade525		! Expected data for %f16
	.word	0x25e5ad35,0x000000f6		! Expected data for %f22
	.word	0xff68ac26,0x00000000		! Expected data for %f24
p0_check_pt_data_16:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x00000000		! Expected data for %l0
	.word	0x578fe6ff,0x06909cc7		! Expected data for %l1
	.word	0x00000000,0x00009085		! Expected data for %l2
	.word	0x00000000,0x00000000		! Expected data for %l3
	.word	0x00000000,0xffff9449		! Expected data for %l4
	.word	0xc1ffffff,0xa8b048e7		! Expected data for %l5
	.word	0x00000000,0x00000000		! Expected data for %l6
	.word	0x00000000,0x3d99c199		! Expected data for %l7
	.word	0xd9690063,0x99c14dff		! Expected data for %f0
	.word	0xf6000000,0x35ade525		! Expected data for %f2
	.word	0x94491724,0x0000d102		! Expected data for %f4
	.word	0xc1cab9e2,0x90e59ece		! Expected data for %f6
	.word	0x00000000,0x00000000		! Expected data for %f8
	.word	0x5791d4ff,0x00000000		! Expected data for %f10
	.word	0xbf39aedb,0x00000000		! Expected data for %f12
	.word	0x7782d6e0,0x3da1b950		! Expected data for %f14
	.word	0xffe5ad35,0x1dfffff6		! Expected data for %f16
	.word	0x00000000,0x00000000		! Expected data for %f18
	.word	0xf2e25d08,0xffe25d08		! Expected data for %f20
	.word	0xcdb502d1,0x295bdcc7		! Expected data for %f22
	.word	0x518a9713,0x775b9449		! Expected data for %f24
	.word	0x9c873bb5,0x6e1e92a8		! Expected data for %f26
	.word	0xb855c84f,0xed0f510e		! Expected data for %f28
	.word	0xd9ff06f6,0x76945c96		! Expected data for %f30
p0_check_pt_data_17:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x4994ffff		! Expected data for %l0
	.word	0x00000000,0x000000f2		! Expected data for %l1
	.word	0x00000000,0x000000ff		! Expected data for %l2
	.word	0xffffffff,0xffffffff		! Expected data for %l3
	.word	0x00000000,0xa3bf2890		! Expected data for %l4
	.word	0x00000000,0x00000000		! Expected data for %l5
	.word	0x00000000,0x35ade5ff		! Expected data for %l6
	.word	0x00000000,0x00000000		! Expected data for %l7
	.word	0xdbae39bf,0xd102b5cd		! Expected data for %f0
	.word	0x00000000,0x000000ff		! Expected data for %f2
	.word	0x8f84d76d,0x00003dd7		! Expected data for %f4
	.word	0xae5ba41d,0x3b8aacb1		! Expected data for %f6
	.word	0x12638a94,0x09f86ad9		! Expected data for %f8
	.word	0x518cfad6,0xbc71899c		! Expected data for %f10
	.word	0xfb666295,0xa78a0c25		! Expected data for %f12
	.word	0x44699ea1,0x64fb75ce		! Expected data for %f14
	.word	0xff000000,0xe1373d78		! Expected data for %f16
	.word	0xd73d0000,0xff000000		! Expected data for %f18
	.word	0x6dd7848f,0x085de2f2		! Expected data for %f20
	.word	0xa8ff7509,0xabda6f33		! Expected data for %f22
	.word	0xff00ffff,0x00000000		! Expected data for %f24
	.word	0xd96af809,0x005f0000		! Expected data for %f26
	.word	0xc0621d06,0x8f354994		! Expected data for %f28
	.word	0xa8490643,0xd9e62c7d		! Expected data for %f30
p0_check_pt_data_18:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x9500ff00		! Expected data for %l0
	.word	0x00000000,0x0fde36ff		! Expected data for %l1
	.word	0x00000000,0x000000e2		! Expected data for %l2
	.word	0x00000000,0x0000ffc4		! Expected data for %l3
	.word	0x00000000,0x8f84d76d		! Expected data for %l4
	.word	0x00000000,0xf2e25d08		! Expected data for %l6
	.word	0x00000000,0x0000c2ba		! Expected data for %l7
	.word	0xdbae39bf,0xd102b5cd		! Expected data for %f0
	.word	0x44699ea1,0x000000f2		! Expected data for %f14
	.word	0xd9690063,0x00ff0095		! Expected data for %f28
p0_check_pt_data_19:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0xffffffff,0xffffff90		! Expected data for %l0
	.word	0xffffffff,0xffffbfa3		! Expected data for %l1
	.word	0x00000000,0x00000000		! Expected data for %l2
	.word	0xffffffff,0xffffe200		! Expected data for %l4
	.word	0x00000000,0x00000000		! Expected data for %l5
	.word	0x00000000,0x00000091		! Expected data for %l6
	.word	0x00000000,0x00000076		! Expected data for %l7
	.word	0x783d37e1,0x000000ff		! Expected data for %f0
	.word	0x00000000,0x00003dff		! Expected data for %f2
	.word	0x0084d76d,0x00000000		! Expected data for %f4
	.word	0x336fdaab,0x0975ffa8		! Expected data for %f6
	.word	0x00000000,0x6dd78400		! Expected data for %f8
	.word	0xf6ffff1d,0x35ade500		! Expected data for %f10
	.word	0x9449358f,0xfb666295		! Expected data for %f12
	.word	0x00000000,0x90ffffff		! Expected data for %f14
	.word	0xff36de0f,0x00000000		! Expected data for %f16
	.word	0x00000000,0x00000000		! Expected data for %f18
	.word	0xffffffa3,0x085de2f2		! Expected data for %f20
	.word	0x00000030,0x9085fb95		! Expected data for %f22
	.word	0x020037e1,0xff1dd94d		! Expected data for %f24
	.word	0x6683e588,0xaa03bbbb		! Expected data for %f26
	.word	0x85ffdf37,0x061dd94d		! Expected data for %f28
	.word	0x9028bfa3,0xd102b5cd		! Expected data for %f30
p0_check_pt_data_20:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x5dcfa2e7,0x99499ae3		! Expected data for %l0
	.word	0xd9e0ef2f,0xfd35fceb		! Expected data for %l1
	.word	0x00000000,0x00000000		! Expected data for %l2
	.word	0x00000000,0x00000000		! Expected data for %l3
	.word	0x00000000,0x00e5ad35		! Expected data for %l4
	.word	0x00000000,0x1dfffff6		! Expected data for %l5
	.word	0x00000000,0xd1020000		! Expected data for %l6
	.word	0xffffffff,0xffff9500		! Expected data for %l7
	.word	0x783d37e1,0x000000ff		! Expected data for %f0
	.word	0x00000000,0x00003dff		! Expected data for %f2
	.word	0x0084d76d,0x00000000		! Expected data for %f4
	.word	0x000000f6,0x0975ffa8		! Expected data for %f6
	.word	0x00000000,0xffffe5ff		! Expected data for %f8
p0_check_pt_data_21:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x35ade500		! Expected data for %l0
	.word	0x00000000,0x0000fb66		! Expected data for %l1
	.word	0x00000000,0x00000000		! Expected data for %l2
	.word	0x00000000,0x000000e5		! Expected data for %l3
	.word	0x00000000,0x00000048		! Expected data for %l5
	.word	0x00000000,0x00000000		! Expected data for %l7
	.word	0x0084d76d,0x00000000		! Expected data for %f4
	.word	0xff000000,0x000000ff		! Expected data for %f8
	.word	0x6dd78400,0xcfd6fb74		! Expected data for %f10
	.word	0x00000000,0xdbae39bf		! Expected data for %f14
	.word	0x90ffffff,0xffffffff		! Expected data for %f18
	.word	0xa3bf2890,0xcdb502d1		! Expected data for %f20
	.word	0x783d37e1,0xff000000		! Expected data for %f26
	.word	0x00ffffff,0x35ade500		! Expected data for %f28
	.word	0x085de2ff,0x0099c199		! Expected data for %f30
p0_check_pt_data_22:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x00000000		! Expected data for %l0
	.word	0xffffffff,0xffffffff		! Expected data for %l2
	.word	0x00000000,0x3b8aacb1		! Expected data for %l3
	.word	0x00000000,0x000000ff		! Expected data for %l4
	.word	0x00000000,0x000000ff		! Expected data for %l5
	.word	0x00000000,0x00000000		! Expected data for %l7
	.word	0xd96af809,0x005f0000		! Expected data for %f0
	.word	0xd102b5ff,0x00003dff		! Expected data for %f2
	.word	0x00000000,0xcdb502d1		! Expected data for %f16
	.word	0x90ffffff,0xfcebbfa3		! Expected data for %f18
p0_check_pt_data_23:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x783d37e1		! Expected data for %l0
	.word	0x00000000,0x00000000		! Expected data for %l1
	.word	0x00000000,0x00000000		! Expected data for %l2
	.word	0x00000000,0x00000090		! Expected data for %l3
	.word	0x00000000,0x0000e2f2		! Expected data for %l4
	.word	0x00000000,0x000000ff		! Expected data for %l5
	.word	0xffffffff,0xffffffe2		! Expected data for %l6
	.word	0x00000000,0x37dfff85		! Expected data for %l7
	.word	0xff000000,0xff000000		! Expected data for %f0
	.word	0xffb502d1,0xbf39aedb		! Expected data for %f2
	.word	0x00000000,0x1dfffff6		! Expected data for %f4
	.word	0x3b1ed75a,0x1b41e871		! Expected data for %f6
	.word	0x2723af57,0xffffcdb1		! Expected data for %f8
	.word	0x99c19949,0x99c1993d		! Expected data for %f10
	.word	0x93ab8046,0x52e548c3		! Expected data for %f12
	.word	0x7403c892,0x43ca1dd3		! Expected data for %f14
	.word	0xf6ffff1d,0x35ade5ff		! Expected data for %f16
	.word	0x00000000,0xa3bfebfc		! Expected data for %f18
	.word	0x0000e2ff,0x0099c1ff		! Expected data for %f20
	.word	0xc7dc5b29,0xd102b5cd		! Expected data for %f22
	.word	0x49945b77,0x13978a51		! Expected data for %f24
	.word	0xa8921e6e,0xb53b879c		! Expected data for %f26
	.word	0x0e510fed,0x4fc855b8		! Expected data for %f28
	.word	0x965c37e1,0xf6060000		! Expected data for %f30
p0_check_pt_data_24:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x000000ff		! Expected data for %l0
	.word	0x00000000,0x00e5ad35		! Expected data for %l1
	.word	0x00000000,0x00000000		! Expected data for %l2
	.word	0x00000000,0x68e68f57		! Expected data for %l3
	.word	0x00000000,0x00000000		! Expected data for %l4
	.word	0x00000000,0x00000000		! Expected data for %l5
	.word	0x00000000,0xfffffff6		! Expected data for %l6
	.word	0x00000000,0x3b8aacb1		! Expected data for %l7
	.word	0x00000000,0xbf39aedb		! Expected data for %f2
	.word	0x3b1ed75a,0x1b41e871		! Expected data for %f6
	.word	0x49945b77,0x13978a51		! Expected data for %f10
p0_check_pt_data_25:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x000000a3		! Expected data for %l0
	.word	0x00e5ad35,0x1dfffff6		! Expected data for %l1
	.word	0xffffffff,0xffffbfff		! Expected data for %l2
	.word	0x00000000,0x0000ed0f		! Expected data for %l3
	.word	0xff000000,0xcdb502d1		! Expected data for %l4
	.word	0x00000000,0x00000000		! Expected data for %l5
	.word	0x00000000,0x24174994		! Expected data for %l6
	.word	0x00000000,0x000000d7		! Expected data for %l7
	.word	0xad350000,0xffb502d1		! Expected data for %f0
	.word	0x00000030,0x9085fb95		! Expected data for %f2
	.word	0x00e5ad35,0x1dfffff6		! Expected data for %f4
	.word	0x00000000,0x0000e2f2		! Expected data for %f12
	.word	0x00000000,0x00000000		! Expected data for %f16
	.word	0xffc19900,0xffe20000		! Expected data for %f18
	.word	0x000000ff,0xe1373d78		! Expected data for %f20
	.word	0x135abbdb,0xc99b887f		! Expected data for %f22
	.word	0x5311e374,0xddae6b21		! Expected data for %f24
	.word	0x58753f2f,0x3473a3d9		! Expected data for %f26
	.word	0x3a01337c,0xdc6b25e8		! Expected data for %f28
	.word	0x18295d59,0xc1b881ee		! Expected data for %f30
p0_check_pt_data_26:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x0000ad35		! Expected data for %l0
	.word	0x00000000,0xf2e25d08		! Expected data for %l1
	.word	0x00000000,0x000000ff		! Expected data for %l2
	.word	0x00000000,0xffffffff		! Expected data for %l3
	.word	0x00000000,0x00000000		! Expected data for %l4
	.word	0x00000000,0x00000000		! Expected data for %l5
	.word	0x00000000,0x000000ff		! Expected data for %l6
	.word	0x00000000,0x00000000		! Expected data for %l7
	.word	0x00000030,0x9085fb95		! Expected data for %f2
	.word	0x00e5ad35,0x1dfffff6		! Expected data for %f4
	.word	0xf6ffff1d,0x35ade5ff		! Expected data for %f10
	.word	0xa8921e6e,0x85ffdf00		! Expected data for %f16
	.word	0x020037e1,0x48000000		! Expected data for %f18
	.word	0xd31dca43,0x00000000		! Expected data for %f20
	.word	0xd96af809,0x005f0000		! Expected data for %f22
	.word	0x000000ff,0x005f0000		! Expected data for %f24
	.word	0x3d780000,0x00000000		! Expected data for %f26
	.word	0xc348e552,0x24174994		! Expected data for %f28
	.word	0x68e68f57,0xb1cdffff		! Expected data for %f30
p0_check_pt_data_27:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x000000ff		! Expected data for %l0
	.word	0x00000000,0x000000ff		! Expected data for %l1
	.word	0x00000000,0x00000000		! Expected data for %l2
	.word	0x00000000,0x000000ff		! Expected data for %l3
	.word	0x00000000,0x00000000		! Expected data for %l4
	.word	0x00000000,0xff000000		! Expected data for %l5
	.word	0x00000000,0x00000000		! Expected data for %l6
	.word	0x00000000,0xffffffff		! Expected data for %l7
	.word	0x00000000,0xffb502d1		! Expected data for %f0
	.word	0xad350000,0xffb502d1		! Expected data for %f2
	.word	0x00e5ad35,0x1dfffff6		! Expected data for %f4
	.word	0x3b1ed75a,0x1b41e871		! Expected data for %f6
	.word	0xc0621d06,0x8f354994		! Expected data for %f14
	.word	0xa8921e6e,0x85ffdf00		! Expected data for %f16
	.word	0x020037e1,0x48000000		! Expected data for %f18
	.word	0xd31dca43,0x00000000		! Expected data for %f20
	.word	0xd96af809,0x005f0000		! Expected data for %f22
	.word	0x000000ff,0x005f00ff		! Expected data for %f24
	.word	0x3d780000,0x00000000		! Expected data for %f26
	.word	0xc348e552,0x24174994		! Expected data for %f28
	.word	0x68e68f57,0xb1cdffff		! Expected data for %f30
p0_check_pt_data_28:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x43ca1dd3		! Expected data for %l0
	.word	0x00000000,0x00000000		! Expected data for %l1
	.word	0x00000000,0x1b41e800		! Expected data for %l2
	.word	0xffffffff,0xffffffff		! Expected data for %l3
	.word	0x00000000,0x00000000		! Expected data for %l4
	.word	0x00000000,0x00000000		! Expected data for %l5
	.word	0x00000000,0x000000ff		! Expected data for %l6
	.word	0x00000000,0x00003000		! Expected data for %l7
	.word	0xf2e20000,0x00000000		! Expected data for %f0
	.word	0xf6ffff1d,0xffe20000		! Expected data for %f2
	.word	0x00000000,0x3b8aacb1		! Expected data for %f4
	.word	0xb1ac8a3b,0x1da45bae		! Expected data for %f6
	.word	0xd96af809,0x948a6312		! Expected data for %f8
	.word	0x9c8971bc,0xd6fa8c51		! Expected data for %f10
	.word	0x0000e2ff,0x1dffffff		! Expected data for %f12
	.word	0xce75fb64,0xa19e6944		! Expected data for %f14
	.word	0x020037e1,0x783d37e1		! Expected data for %f18
p0_check_pt_data_29:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0xffffffff,0xffffffd3		! Expected data for %l0
	.word	0xffffffff,0xffffffff		! Expected data for %l1
	.word	0x00000000,0xa8921e6e		! Expected data for %l2
	.word	0x00000000,0x1dfffff6		! Expected data for %l3
	.word	0x00000000,0x0000ffff		! Expected data for %l4
	.word	0x00000000,0x000000f2		! Expected data for %l5
	.word	0x00000000,0x00000000		! Expected data for %l6
	.word	0x00000000,0x0000ffff		! Expected data for %l7
	.word	0xf2e20000,0x000000ff		! Expected data for %f0
	.word	0xb1ac8a3b,0x1da45bae		! Expected data for %f6
	.word	0xff0000f2,0xa19e6944		! Expected data for %f14
	.word	0xf6000000,0x94491724		! Expected data for %f22
	.word	0xd102b5cd,0x902802d1		! Expected data for %f30
p0_check_pt_data_30:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x0000008f		! Expected data for %l0
	.word	0xffffffff,0xffffffc8		! Expected data for %l1
	.word	0x00000000,0xa8920000		! Expected data for %l2
	.word	0x00000000,0x00000000		! Expected data for %l3
	.word	0x00000000,0xf6000000		! Expected data for %l4
	.word	0x00000000,0x000000f6		! Expected data for %l5
	.word	0x00000000,0x000000f6		! Expected data for %l6
	.word	0x00000000,0x000000ff		! Expected data for %l7
	.word	0xf6ffff1d,0xffe20000		! Expected data for %f2
	.word	0x00000000,0x3b8aacb1		! Expected data for %f4
	.word	0xb1ac8a3b,0x1da45bae		! Expected data for %f6
	.word	0x00001dd3,0x85ffdf00		! Expected data for %f16
	.word	0x00000000,0x783d37e1		! Expected data for %f18
	.word	0xa3000000,0x00000000		! Expected data for %f20
	.word	0xa8921e6e,0x005f00ff		! Expected data for %f24
p0_check_pt_data_31:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x00000000		! Expected data for %l0
	.word	0x00000000,0x00000000		! Expected data for %l1
	.word	0x00000000,0x0000783d		! Expected data for %l2
	.word	0x00000000,0x000000ff		! Expected data for %l3
	.word	0x00000000,0x783d37e1		! Expected data for %l4
	.word	0x00000000,0xffffffff		! Expected data for %l5
	.word	0x00000000,0x00000000		! Expected data for %l6
	.word	0x00000000,0x1dffffff		! Expected data for %l7
	.word	0xf6ffff1d,0x35ade5ff		! Expected data for %f0
	.word	0x020037e1,0x783d37e1		! Expected data for %f2
	.word	0x00ffe2ff,0x0099c1ff		! Expected data for %f4
	.word	0xc7dc5b29,0xffffff1d		! Expected data for %f6
	.word	0x49945b77,0x13978a51		! Expected data for %f8
	.word	0xa8921e6e,0xb53b879c		! Expected data for %f10
	.word	0x0e510fed,0x4fc855b8		! Expected data for %f12
	.word	0x965c37e1,0xf6060000		! Expected data for %f14
	.word	0xa3000000,0xe1370002		! Expected data for %f20
	.word	0xf6000000,0xffe2ff00		! Expected data for %f22
	.word	0xa8921e6e,0xb1ac8a3b		! Expected data for %f24
p0_check_pt_data_32:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x1dffffff		! Expected data for %l0
	.word	0x00000000,0x783d37e1		! Expected data for %l1
	.word	0x00000000,0x000000f6		! Expected data for %l2
	.word	0x00000000,0xff0000ff		! Expected data for %l3
	.word	0x00000000,0xffffffff		! Expected data for %l4
	.word	0x00000000,0x000000a3		! Expected data for %l6
	.word	0x00000000,0x00dfff85		! Expected data for %l7
	.word	0x956266ff,0x783d37e1		! Expected data for %f2
	.word	0x00ffe2ff,0x0099c1ff		! Expected data for %f4
	.word	0xc7dc5b29,0xffffff1d		! Expected data for %f6
	.word	0x49945b77,0x00000000		! Expected data for %f8
	.word	0xa8921e6e,0xff0000ff		! Expected data for %f10
	.word	0x00000000,0x000000f6		! Expected data for %f18
p0_check_pt_data_33:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x00000000		! Expected data for %l0
	.word	0xae5ba41d,0x00000000		! Expected data for %l1
	.word	0xffffffff,0xfffffff8		! Expected data for %l2
	.word	0x00000000,0xffe20000		! Expected data for %l3
	.word	0xffffffff,0xffffffff		! Expected data for %l4
	.word	0x00000000,0x00000000		! Expected data for %l5
	.word	0x783d37e1,0xffffffff		! Expected data for %l6
	.word	0x00000000,0x8f000000		! Expected data for %l7
	.word	0xe13700ff,0xd31d0000		! Expected data for %f2
	.word	0x8f000000,0x00000000		! Expected data for %f8
	.word	0xa8921e6e,0x000000ff		! Expected data for %f16
	.word	0xffffffff,0xffe20000		! Expected data for %f18
	.word	0x8f000000,0x3b8aacb1		! Expected data for %f20
	.word	0xb1ac8a3b,0x1da45bae		! Expected data for %f22
	.word	0xd96af809,0x948a6312		! Expected data for %f24
	.word	0x9c8971bc,0xd6fa8c51		! Expected data for %f26
	.word	0x0000e2ff,0x1dffffff		! Expected data for %f28
	.word	0xff0000f2,0xa19e6944		! Expected data for %f30
p0_check_pt_data_34:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x000000a8		! Expected data for %l0
	.word	0x00000000,0x00000000		! Expected data for %l1
	.word	0x00000000,0xff000000		! Expected data for %l2
	.word	0x00000000,0x000000a3		! Expected data for %l3
	.word	0xffffffff,0xffffffff		! Expected data for %l4
	.word	0x00000000,0x000000a3		! Expected data for %l5
	.word	0x00000000,0x000000ff		! Expected data for %l6
	.word	0x00000000,0x000037e1		! Expected data for %l7
	.word	0xf6ffff1d,0x35ade5ff		! Expected data for %f0
	.word	0xe13700ff,0xd31d0000		! Expected data for %f2
	.word	0xc7dc5b29,0xffffff1d		! Expected data for %f6
	.word	0xffffffff,0x1dffffff		! Expected data for %f20
p0_check_pt_data_35:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0xf800ff85		! Expected data for %l0
	.word	0xffffffff,0xffffffff		! Expected data for %l1
	.word	0x00000000,0x783d37e1		! Expected data for %l2
	.word	0x00000000,0xffffffff		! Expected data for %l3
	.word	0x00000000,0x000000ff		! Expected data for %l4
	.word	0x00000000,0xf2e200f8		! Expected data for %l5
	.word	0x00000000,0x00000000		! Expected data for %l6
	.word	0x00000000,0x0000ffff		! Expected data for %l7
	.word	0xe13700ff,0xd31d0000		! Expected data for %f2
	.word	0xffffff1d,0x00000000		! Expected data for %f4
	.word	0xc7dc5b29,0xffffff1d		! Expected data for %f6
	.word	0x68e68f57,0xb1cdffff		! Expected data for %f8
	.word	0xffffffff,0x0000ffff		! Expected data for %f10
	.word	0xff0000ff,0x783d37e1		! Expected data for %f18
	.word	0xf800e2f2,0x35ade500		! Expected data for %f22
	.word	0xffffffff,0xd6fa8c51		! Expected data for %f26
p0_check_pt_data_36:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x000000c7		! Expected data for %l0
	.word	0x00000000,0x00000000		! Expected data for %l1
	.word	0x00000000,0x1dffffff		! Expected data for %l2
	.word	0xffffffff,0xffffffff		! Expected data for %l3
	.word	0xffffffff,0xffffffff		! Expected data for %l4
	.word	0x00000000,0x00000000		! Expected data for %l5
	.word	0x00000000,0x0000003d		! Expected data for %l6
	.word	0x00000000,0x0000001d		! Expected data for %l7
	.word	0xf6ffff1d,0x35ade5ff		! Expected data for %f0
	.word	0xe13700ff,0x783d37e1		! Expected data for %f2
	.word	0xc7dc5b29,0xffffff1d		! Expected data for %f6
	.word	0xff000000,0x000000ff		! Expected data for %f16
	.word	0x3b1ed75a,0x00000000		! Expected data for %f18
	.word	0x000006f6,0xe1375c96		! Expected data for %f20
	.word	0xfab88c5c,0xac17f39a		! Expected data for %f22
	.word	0xb49bfbdb,0xf1bc7ab2		! Expected data for %f24
	.word	0x1b718ca7,0x52e548c3		! Expected data for %f26
	.word	0xe1373d78,0xe1370002		! Expected data for %f28
	.word	0x873a3a14,0x327bd5c9		! Expected data for %f30
p0_check_pt_data_37:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x1dffffff		! Expected data for %l0
	.word	0x00000000,0x00000000		! Expected data for %l1
	.word	0x00000000,0xffffffff		! Expected data for %l2
	.word	0x00000000,0x3b8aacb1		! Expected data for %l3
	.word	0xffffffff,0xffffffff		! Expected data for %l4
	.word	0x00000000,0x0000e137		! Expected data for %l5
	.word	0x6e1e92a8,0xd96af809		! Expected data for %l6
	.word	0x00000000,0xff0000ff		! Expected data for %l7
	.word	0xf2e20000,0x35ade5ff		! Expected data for %f0
	.word	0xe13700ff,0x783d37e1		! Expected data for %f2
	.word	0xffffff1d,0x00000000		! Expected data for %f4
	.word	0x00000000,0x1dffffff		! Expected data for %f10
	.word	0x8f000000,0xff0037e1		! Expected data for %f16
	.word	0x00000000,0xe1373d78		! Expected data for %f18
	.word	0xc7dc5b29,0xfffff800		! Expected data for %f20
	.word	0xcdb502d1,0x295bdcc7		! Expected data for %f22
	.word	0x518a9713,0x775b9449		! Expected data for %f24
	.word	0x9c873bb5,0x6e1e92a8		! Expected data for %f26
	.word	0xb855c84f,0xed0f510e		! Expected data for %f28
	.word	0x000006f6,0xe1375c96		! Expected data for %f30
p0_check_pt_data_38:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0xffffffff,0xffffffff		! Expected data for %l0
	.word	0x00000000,0x0000e137		! Expected data for %l1
	.word	0x00000000,0xe13700ff		! Expected data for %l2
	.word	0x00000000,0x783d37e1		! Expected data for %l3
	.word	0x00000000,0xff0000ff		! Expected data for %l4
	.word	0x00000000,0x00000055		! Expected data for %l6
	.word	0xf2e20000,0x35ade5ff		! Expected data for %f0
	.word	0xe13700ff,0x783d37e1		! Expected data for %f2
	.word	0xffffff1d,0x00000000		! Expected data for %f4
p0_check_pt_data_39:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x00002417		! Expected data for %l0
	.word	0xffffffff,0xffffff1d		! Expected data for %l1
	.word	0x00000000,0x00000000		! Expected data for %l2
	.word	0xffffffff,0xffffe137		! Expected data for %l3
	.word	0x00000000,0x00000000		! Expected data for %l4
	.word	0x00000000,0x00000000		! Expected data for %l5
	.word	0x00000000,0x0000ffff		! Expected data for %l6
	.word	0x000000ff,0x000000e5		! Expected data for %f0
	.word	0x0000e2ff,0x948a6312		! Expected data for %f2
	.word	0x09000000,0x000000a3		! Expected data for %f4
	.word	0xd96af809,0x005fff00		! Expected data for %f6
	.word	0x000000d7,0x92c80374		! Expected data for %f8
	.word	0x00f8ffff,0x37e10000		! Expected data for %f10
	.word	0xc34866ff,0x783d4994		! Expected data for %f12
	.word	0x68e6ff57,0xb1cdffff		! Expected data for %f14
	.word	0xa3000000,0x0000e137		! Expected data for %f20
	.word	0xe13700ff,0x783d37e1		! Expected data for %f28
	.word	0x518cfad6,0x00000000		! Expected data for %f30
p0_check_pt_data_40:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0xffffffff,0xffffffe1		! Expected data for %l0
	.word	0x00000000,0x000000e1		! Expected data for %l1
	.word	0x00000000,0x1dffffff		! Expected data for %l2
	.word	0x00000000,0x000000ff		! Expected data for %l3
	.word	0x00000000,0x000000a3		! Expected data for %l4
	.word	0x00000000,0x000000ff		! Expected data for %l5
	.word	0x00000000,0x00000000		! Expected data for %l6
	.word	0x00000000,0x1dffffff		! Expected data for %l7
	.word	0x8f000000,0xc7000000		! Expected data for %f0
	.word	0x00000000,0xe1373d78		! Expected data for %f2
	.word	0xc7dc5b29,0xfffff800		! Expected data for %f4
	.word	0xcdb502d1,0x295bdcc7		! Expected data for %f6
	.word	0x518a9713,0x775b9449		! Expected data for %f8
	.word	0x9c873bb5,0x6e1e92a8		! Expected data for %f10
	.word	0xb8ffc84f,0xed0f510e		! Expected data for %f12
	.word	0x000006f6,0xe1375c96		! Expected data for %f14
	.word	0xc7dc5b29,0x6e1e92a8		! Expected data for %f26
p0_check_pt_data_41:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x1dffff00		! Expected data for %l0
	.word	0x00000000,0x000000ff		! Expected data for %l2
	.word	0x00000000,0x0000006a		! Expected data for %l3
	.word	0x00000000,0x000000e1		! Expected data for %l4
	.word	0x00000000,0x0000ff00		! Expected data for %l5
	.word	0xffffffff,0xffffffff		! Expected data for %l6
	.word	0xffffffff,0xffffffff		! Expected data for %l7
	.word	0xe13700ff,0x0000008f		! Expected data for %f0
	.word	0xff3d37e1,0x00000000		! Expected data for %f2
	.word	0x00f8ffff,0x295bdcc7		! Expected data for %f4
	.word	0xc7dc5b29,0xd102b5cd		! Expected data for %f6
	.word	0x49945b77,0x13978a51		! Expected data for %f8
	.word	0xa8921e6e,0xb53b879c		! Expected data for %f10
	.word	0x0e510fed,0x4fc855b8		! Expected data for %f12
	.word	0x965c37e1,0xf6060000		! Expected data for %f14
	.word	0x518a9713,0x005fff00		! Expected data for %f24
	.word	0x00000000,0x6e1e92a8		! Expected data for %f26
	.word	0xffffffe1,0x783d37e1		! Expected data for %f28
	.word	0xe1373d78,0x00000000		! Expected data for %f30
p0_check_pt_data_42:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x000000ff		! Expected data for %l0
	.word	0x00000000,0x000000e1		! Expected data for %l1
	.word	0x00000000,0x000000ff		! Expected data for %l2
	.word	0x00000000,0x000000cd		! Expected data for %l3
	.word	0x00000000,0x0000e100		! Expected data for %l4
	.word	0xffffffff,0xffffffe1		! Expected data for %l5
	.word	0x00000000,0x00000000		! Expected data for %l6
	.word	0x00000000,0x000000ff		! Expected data for %l7
	.word	0x00000000,0xffffffff		! Expected data for %f4
	.word	0x00000000,0x000000e1		! Expected data for %f18
	.word	0xcdb502d1,0x37e10000		! Expected data for %f22
	.word	0x00000000,0x00000000		! Expected data for %f26
	.word	0xe1373d78,0x295bdcff		! Expected data for %f28
p0_check_pt_data_43:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0xffffe137		! Expected data for %l0
	.word	0xffffffff,0xffffff3d		! Expected data for %l1
	.word	0x00000000,0xff000000		! Expected data for %l2
	.word	0x00000000,0xe5000000		! Expected data for %l3
	.word	0xffffffff,0xffffffe1		! Expected data for %l4
	.word	0x00000000,0x00003700		! Expected data for %l5
	.word	0x00000000,0x00000037		! Expected data for %l6
	.word	0x00000000,0x0000e100		! Expected data for %l7
	.word	0xe13700ff,0xff3d37e1		! Expected data for %f0
	.word	0xff3d37e1,0x00000000		! Expected data for %f2
	.word	0xc7dc5b29,0xd102b5cd		! Expected data for %f6
	.word	0xffffe137,0x0000e137		! Expected data for %f12
	.word	0xa3000000,0xffffff00		! Expected data for %f20
p0_check_pt_data_44:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x499455b8		! Expected data for %l0
	.word	0x5635b07f,0x8287a946		! Expected data for %l1
	.word	0x00000000,0x00b502d1		! Expected data for %l2
	.word	0xff3700ff,0x0000008f		! Expected data for %l3
	.word	0x00000000,0x000000e1		! Expected data for %l4
	.word	0x00000000,0x00000000		! Expected data for %l5
	.word	0x00000000,0x00000000		! Expected data for %l6
	.word	0x00000000,0xff000000		! Expected data for %l7
	.word	0x4fc855b8,0xff3d37e1		! Expected data for %f0
	.word	0x00000000,0x1dffff00		! Expected data for %f4
	.word	0xc7dc5b29,0xd102b5cd		! Expected data for %f6
	.word	0x965c37e1,0xf6060000		! Expected data for %f10
	.word	0x00000000,0xb53b879c		! Expected data for %f18
	.word	0x37e1ffff,0xff000000		! Expected data for %f20
	.word	0xff3d37e1,0x00000000		! Expected data for %f28
	.word	0xe1373d78,0xffffffff		! Expected data for %f30
p0_check_pt_data_45:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0xffffffff,0xffffffd1		! Expected data for %l0
	.word	0x00000000,0x00000000		! Expected data for %l1
	.word	0x00000000,0xd700e1ff		! Expected data for %l3
	.word	0x00000000,0x0e510fed		! Expected data for %l4
	.word	0x00000000,0x00000000		! Expected data for %l5
	.word	0x00000000,0x00000000		! Expected data for %l6
	.word	0x00000000,0x000000ff		! Expected data for %l7
	.word	0xff000000,0x00000000		! Expected data for %f2
	.word	0x00000000,0x1dffff00		! Expected data for %f4
	.word	0xc7dc5b29,0xd102b5cd		! Expected data for %f6
	.word	0xffffffe1,0x00000000		! Expected data for %f10
	.word	0xc7dc5b29,0xfffff800		! Expected data for %f12
	.word	0xff0000ff,0x000000e5		! Expected data for %f26
p0_check_pt_data_46:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x000000ff		! Expected data for %l0
	.word	0x00000000,0x0000ff00		! Expected data for %l1
	.word	0x00000000,0x00000000		! Expected data for %l2
	.word	0x00000000,0x0000ffff		! Expected data for %l4
	.word	0x00000000,0x0000004f		! Expected data for %l5
	.word	0x00000000,0x00000000		! Expected data for %l6
	.word	0x00000000,0x00000000		! Expected data for %l7
	.word	0x4fc855b8,0x00f8ffff		! Expected data for %f0
	.word	0xffffe137,0x1dffff00		! Expected data for %f4
	.word	0xc7dc5b29,0xd102b5cd		! Expected data for %f6
	.word	0x0000d102,0x1dffff00		! Expected data for %f10
	.word	0x4fc855b8,0xff3d3700		! Expected data for %f14
	.word	0xff3d37e1,0xa8921e6e		! Expected data for %f28
p0_check_pt_data_47:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x000000e1		! Expected data for %l0
	.word	0xffffffff,0xffffb8ff		! Expected data for %l1
	.word	0x00000000,0xe1373d78		! Expected data for %l2
	.word	0x00000000,0x0000ff00		! Expected data for %l3
	.word	0xffffffff,0xff0000e5		! Expected data for %l4
	.word	0x00000000,0x0000ff00		! Expected data for %l5
	.word	0x00000000,0x000000ff		! Expected data for %l6
	.word	0x00000000,0x000037e1		! Expected data for %l7
	.word	0xc7dc5b29,0xd102b5cd		! Expected data for %f0
	.word	0xe1373dff,0xb855c8ff		! Expected data for %f2
	.word	0x0e510fed,0x00000009		! Expected data for %f4
	.word	0x00e5ad35,0xf2e200f8		! Expected data for %f6
	.word	0x12638a94,0x09f86ad9		! Expected data for %f8
	.word	0x518cfad6,0xffffffff		! Expected data for %f10
	.word	0xffffcdb1,0x578f0000		! Expected data for %f12
	.word	0x44699ea1,0xf20000ff		! Expected data for %f14
	.word	0xff000000,0xff0037e1		! Expected data for %f16
	.word	0x00000000,0xff000000		! Expected data for %f20
	.word	0x00000000,0xcdb502d1		! Expected data for %f26
	.word	0xc70000ff,0xa8921e6e		! Expected data for %f28
	.word	0xe1373d78,0xff000000		! Expected data for %f30
p0_check_pt_data_48:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0xff0000ff		! Expected data for %l1
	.word	0x00000000,0x0000b5cd		! Expected data for %l2
	.word	0x00000000,0x4fc855b8		! Expected data for %l3
	.word	0x00000000,0x00000000		! Expected data for %l5
	.word	0x00000000,0xff000000		! Expected data for %l6
	.word	0x00000000,0x00000000		! Expected data for %l7
	.word	0xd102b5cd,0xff0000ff		! Expected data for %f0
	.word	0xffffffe1,0xffff00ff		! Expected data for %f2
	.word	0x0e510fed,0x00000009		! Expected data for %f4
	.word	0xa8921e6e,0x518a9713		! Expected data for %f10
	.word	0xff00ffff,0x0000e100		! Expected data for %f14
	.word	0x00000000,0x295bdcc7		! Expected data for %f16
	.word	0xffffffff,0xff0000e5		! Expected data for %f18
	.word	0xffffffe1,0x00000000		! Expected data for %f20
	.word	0x24174994,0x000000f6		! Expected data for %f22
	.word	0x3b8aacb1,0x6e1e92a8		! Expected data for %f24
	.word	0x00000000,0x0000783d		! Expected data for %f26
	.word	0x94491724,0x52e548c3		! Expected data for %f28
	.word	0xd1022890,0xcdb502d1		! Expected data for %f30
p0_check_pt_data_49:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0xd102b5ff		! Expected data for %l0
	.word	0x00000000,0x000000ff		! Expected data for %l1
	.word	0x00000000,0xffffffff		! Expected data for %l2
	.word	0xffffffff,0xffffe137		! Expected data for %l3
	.word	0x00000000,0xff0000ff		! Expected data for %l4
	.word	0x0000ffff,0x9c873bb5		! Expected data for %l5
	.word	0xffffffff,0xffffffd1		! Expected data for %l6
	.word	0x00000000,0xe1ffffff		! Expected data for %l7
	.word	0xffffffe1,0xffff00ff		! Expected data for %f2
	.word	0x00e5ad35,0xf2e200f8		! Expected data for %f6
	.word	0x00ff5f00,0xff0037e1		! Expected data for %f10
	.word	0xe13700ff,0x0000008f		! Expected data for %f16
	.word	0x0000ffff,0x9c873bb5		! Expected data for %f18
	.word	0xd102b5cd,0xff0000ff		! Expected data for %f20
	.word	0xb1ac8a3b,0x1da45bae		! Expected data for %f22
	.word	0x000006ff,0xe18a5c96		! Expected data for %f24
	.word	0x68e6ff57,0xd6fa8c51		! Expected data for %f26
	.word	0x0e510fed,0x1dffffff		! Expected data for %f28
	.word	0xff0000f2,0xa19e6944		! Expected data for %f30
p0_check_pt_data_50:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x000000a4		! Expected data for %l0
	.word	0x00000000,0x00ff5f00		! Expected data for %l1
	.word	0x00000000,0x000000ff		! Expected data for %l2
	.word	0xffffffff,0xff000000		! Expected data for %l4
	.word	0x00000000,0xb53b879c		! Expected data for %l5
	.word	0x00000000,0xff0000ff		! Expected data for %l6
	.word	0xffffff1d,0xffffff00		! Expected data for %f0
	.word	0x00000000,0xffffffb8		! Expected data for %f2
	.word	0x37e1ffff,0xff0000ff		! Expected data for %f4
	.word	0x71e8411b,0x5ad71e3b		! Expected data for %f6
	.word	0x5539c2ba,0x57af2327		! Expected data for %f8
	.word	0x3d99c199,0x085de2f2		! Expected data for %f10
	.word	0xc348e552,0x4680ab93		! Expected data for %f12
	.word	0xd31dca43,0x92c80374		! Expected data for %f14
	.word	0xffffffff,0xff0000ff		! Expected data for %f18
	.word	0x0e510fed,0xffffff00		! Expected data for %f28
p0_check_pt_data_51:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x35ade5ff		! Expected data for %l0
	.word	0x00000000,0x00000000		! Expected data for %l1
	.word	0x00000000,0xffffe137		! Expected data for %l2
	.word	0x00000000,0xd1ffffff		! Expected data for %l3
	.word	0x00000000,0x0000ff00		! Expected data for %l4
	.word	0xb53b87ff,0x0000e137		! Expected data for %l5
	.word	0x00000000,0xed0f510e		! Expected data for %l6
	.word	0xffffffff,0xffffffff		! Expected data for %l7
	.word	0xe5000000,0x0000e137		! Expected data for %f0
	.word	0xffffffff,0xffffe137		! Expected data for %f2
	.word	0xff5fff00,0x783d37e1		! Expected data for %f4
	.word	0xb1ac8a3b,0x1da45bae		! Expected data for %f6
	.word	0xd96af809,0x948a6312		! Expected data for %f8
	.word	0x9c8971bc,0xd6fa8c51		! Expected data for %f10
	.word	0x250c8aa7,0x956266fb		! Expected data for %f12
	.word	0xce75fb64,0xa19e6944		! Expected data for %f14
	.word	0xffffffff,0xffffe137		! Expected data for %f16
	.word	0x3dff0000,0x37e10000		! Expected data for %f20
	.word	0xb8ffffff,0x00000000		! Expected data for %f22
	.word	0x00ff5f00,0x00ff5f00		! Expected data for %f24
	.word	0x0e510fed,0xffffffff		! Expected data for %f28
p0_check_pt_data_52:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x000000ff		! Expected data for %l0
	.word	0x00000000,0x00000037		! Expected data for %l1
	.word	0x00000000,0x000000ff		! Expected data for %l2
	.word	0x37e1ffff,0xffffffff		! Expected data for %l3
	.word	0x00000000,0x00000000		! Expected data for %l4
	.word	0x00000000,0x0000018f		! Expected data for %l5
	.word	0xffffffff,0xffffffb5		! Expected data for %l6
	.word	0x00000000,0xe1ffffff		! Expected data for %l7
	.word	0xff5fff00,0x783d37e1		! Expected data for %f4
	.word	0x0000ffe1,0x948a6312		! Expected data for %f8
	.word	0x37e10000,0x000000e5		! Expected data for %f14
p0_check_pt_data_53:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0xb5ff0000		! Expected data for %l0
	.word	0x00000000,0xa8921e6e		! Expected data for %l1
	.word	0x00000000,0x000000ff		! Expected data for %l2
	.word	0x00000000,0x00ff5fff		! Expected data for %l3
	.word	0x00000000,0x00000000		! Expected data for %l4
	.word	0x00000000,0x00000000		! Expected data for %l5
	.word	0xff00ffe1,0x00000000		! Expected data for %l6
	.word	0x00000000,0x00000000		! Expected data for %l7
	.word	0x000006ff,0x00000000		! Expected data for %f8
	.word	0x00000000,0x0000e137		! Expected data for %f12
	.word	0x000006ff,0x00000000		! Expected data for %f18
	.word	0x00000000,0x000000e1		! Expected data for %f30
p0_check_pt_data_54:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0xff0000ff		! Expected data for %l0
	.word	0x00000000,0x000000ff		! Expected data for %l1
	.word	0x00000000,0x00000000		! Expected data for %l2
	.word	0x00000000,0x000000d1		! Expected data for %l3
	.word	0x00000000,0x00000037		! Expected data for %l4
	.word	0x00000000,0x00000000		! Expected data for %l5
	.word	0x00000000,0x000000ff		! Expected data for %l6
	.word	0x00000000,0xf6060000		! Expected data for %l7
	.word	0xffffff1d,0xffffffff		! Expected data for %f0
	.word	0x37e1ffff,0x000000e5		! Expected data for %f2
	.word	0x37e1ffff,0x000000ff		! Expected data for %f4
	.word	0x71e8411b,0x5ad71e3b		! Expected data for %f6
	.word	0x5539c2ba,0x57af2327		! Expected data for %f8
	.word	0x00ff5f00,0x085de2f2		! Expected data for %f10
	.word	0xc348e552,0x4680ab93		! Expected data for %f12
	.word	0xd31dca43,0x92c80374		! Expected data for %f14
	.word	0x3dff0000,0xff00018f		! Expected data for %f20
	.word	0x00000000,0x000000e5		! Expected data for %f26
	.word	0x518cfad6,0xffffff6e		! Expected data for %f30
p0_check_pt_data_55:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x0000a892		! Expected data for %l0
	.word	0x00000000,0x00000000		! Expected data for %l1
	.word	0x00ffffff,0x00ff5f00		! Expected data for %l2
	.word	0x00000000,0x0000ffff		! Expected data for %l3
	.word	0x00000000,0x37e1ffff		! Expected data for %l4
	.word	0x00000000,0x00000000		! Expected data for %l5
	.word	0x00000000,0x000000ff		! Expected data for %l6
	.word	0x00000000,0x000000ff		! Expected data for %l7
	.word	0xffffff1d,0xffffffff		! Expected data for %f4
	.word	0x00000000,0x518a9713		! Expected data for %f6
	.word	0x9c873bb5,0xffffffe1		! Expected data for %f12
	.word	0x000000ff,0x00000000		! Expected data for %f26
	.word	0xffffe137,0xff000000		! Expected data for %f28
p0_check_pt_data_56:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x00000000		! Expected data for %l0
	.word	0x00000000,0x00000000		! Expected data for %l2
	.word	0x00000000,0x000000ff		! Expected data for %l3
	.word	0x00000000,0x000000ff		! Expected data for %l4
	.word	0x00000000,0x000000ff		! Expected data for %l5
	.word	0x00000000,0x000000a4		! Expected data for %l6
	.word	0x00000000,0xffb502d1		! Expected data for %l7
	.word	0x37e1ffff,0x000000e5		! Expected data for %f2
	.word	0xff000000,0xffffffb8		! Expected data for %f10
	.word	0x00000000,0xffffff6e		! Expected data for %f30
p0_check_pt_data_57:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0xffffffff,0xffffffff		! Expected data for %l0
	.word	0xffffffff,0xffffffff		! Expected data for %l1
	.word	0xff000000,0x00000000		! Expected data for %l2
	.word	0x00000000,0x00000000		! Expected data for %l4
	.word	0x00000000,0xffffe137		! Expected data for %l5
	.word	0x00000000,0x0000ff3d		! Expected data for %l6
	.word	0x00000000,0xffffffff		! Expected data for %l7
	.word	0xe5000000,0xffffffff		! Expected data for %f0
	.word	0x37e1ffff,0x000000e5		! Expected data for %f2
	.word	0xffffff1d,0xffffffff		! Expected data for %f4
	.word	0x00000000,0x518a9713		! Expected data for %f6
	.word	0x37e1ffff,0xffffffff		! Expected data for %f8
	.word	0x9c873bb5,0x0000ff3d		! Expected data for %f10
	.word	0x37e1ffff,0xffffff00		! Expected data for %f12
	.word	0x00000000,0x00000000		! Expected data for %f26
	.word	0x00ff5f00,0x00000000		! Expected data for %f30
p0_check_pt_data_58:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0xffffffff,0xff000000		! Expected data for %l1
	.word	0x00000000,0x3dff0000		! Expected data for %l2
	.word	0x3dff0000,0xb53b879c		! Expected data for %l3
	.word	0x00000000,0x00000000		! Expected data for %l4
	.word	0x00000000,0x000000ff		! Expected data for %l5
	.word	0x00000000,0xffb502d1		! Expected data for %l6
	.word	0xe1373dff,0x9c873bff		! Expected data for %f0
	.word	0x005fff00,0xffffffff		! Expected data for %f2
	.word	0x00000000,0x37e1ffff		! Expected data for %f4
	.word	0xcdb502d1,0x295bdcc7		! Expected data for %f6
	.word	0x518a9713,0x775b9449		! Expected data for %f8
	.word	0x00000000,0xe1ffffff		! Expected data for %f10
	.word	0x37e10000,0x37e1ffff		! Expected data for %f12
	.word	0x000006f6,0xe1375c96		! Expected data for %f14
	.word	0x00000000,0x37e10000		! Expected data for %f20
	.word	0x00000000,0xe1000000		! Expected data for %f26
p0_check_pt_data_59:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x000000ff		! Expected data for %l0
	.word	0x3dff0000,0xff000000		! Expected data for %l1
	.word	0x00000000,0xff000000		! Expected data for %l2
	.word	0x00000000,0x0000ffff		! Expected data for %l3
	.word	0x00000000,0x000000ff		! Expected data for %l4
	.word	0xe1373dff,0xff00ffff		! Expected data for %l5
	.word	0x00000000,0x00000000		! Expected data for %l6
	.word	0xffffffff,0xffffffa4		! Expected data for %l7
	.word	0x00000000,0xffffffff		! Expected data for %f2
	.word	0x00000000,0x37e1ffff		! Expected data for %f4
	.word	0xcdb502d1,0x295bdcc7		! Expected data for %f6
	.word	0xffffff1d,0x00000000		! Expected data for %f26
p0_check_pt_data_60:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x000000a4		! Expected data for %l0
	.word	0x00000000,0xff3d37e1		! Expected data for %l1
	.word	0x00000000,0x000000ff		! Expected data for %l2
	.word	0x00000000,0xff000000		! Expected data for %l3
	.word	0x00000000,0x00000000		! Expected data for %l4
	.word	0x00000000,0x000000ff		! Expected data for %l5
	.word	0x00000000,0x000000ff		! Expected data for %l6
	.word	0x00000000,0x00000000		! Expected data for %l7
	.word	0xffffffff,0xffffffff		! Expected data for %f2
	.word	0x005fff00,0xffffff00		! Expected data for %f4
	.word	0xcdb502d1,0x295bdcc7		! Expected data for %f6
	.word	0x000006f6,0x68e6ff57		! Expected data for %f14
	.word	0xffffffff,0xffffe137		! Expected data for %f22
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
	.word	0x9788b2bf,0xab8aa3a4
	.word	0x00000000,0x00000002
	.word	0xd72ad99f,0xf8dd2116
	.word	0x00000000,0x00000003
	.word	0xc40b802f,0xb281a0fc
	.word	0x00000000,0x00000004
	.word	0x875ea6ff,0x9a9b4d22
	.word	0x00000000,0x00000005
	.word	0x65e8c978,0x1c775104
	.word	0x00000000,0x00000006
	.word	0x2ddaea10,0x5db6ca37
	.word	0x00000000,0x00000007
	.word	0x9e5a46b0,0x6d23abfd
	.word	0x00000000,0x00000008
	.word	0xde2e169f,0xf6a8d433
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
	.word	0xb16f6ef8,0x79a894ef,0xad72456e,0x9f45e0f3
	.word	0xb0d05061,0x35ade525,0xfd32bd42,0x55e8b731
	.word	0xeb5fbd84,0x2fc1db17,0x6a895895,0x65d0c689
	.word	0x87438ae7,0x12f7d04d,0x6ebbb1da,0x62031b1d
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
	.word	0x1b63ac26,0xcfd6fb74,0xb7e08608,0x732daac3
	.word	0xcdb502d1,0xa3bf2890,0x9af317ac,0x5c8cb8fa
	.word	0xb27abcf1,0xdbfb9bb4,0xae8551af,0xa78c711b
	.word	0xf6da05da,0xd78f5fd2,0xc9d57b32,0x143a3a87
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
	.word	0x556aedfc,0x09a274cd,0x66cdac63,0x81a82b8d
	.word	0x7d2ce6d9,0x430649a8,0xefa6d8e0,0x9085fb95
	.word	0x61c3a0f5,0x1063cb77,0x6683e588,0xaa03bbbb
	.word	0x63aae7fa,0x573b7f97,0x6f14dc5d,0xcb724ea5
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
	.word	0xa65ff8da,0x80c2923d,0x22faed63,0xba6ca4f2
	.word	0xda24cac8,0xd26597e2,0xc816ea3d,0xc7c37e59
	.word	0x45b180c1,0x93f0c457,0xd8879d22,0xd08b458c
	.word	0x94be2e80,0xdc08d16a,0x87e45802,0x9f1d91f6
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
	.word	0xaab638e2,0x2db5fa1a,0xb60dc23d,0xca79f0a1
	.word	0xd14a1e87,0xff14850e,0x229ccedb,0xa1149a97
	.word	0x98f41698,0x084ccda6,0x6d528d20,0x3777d298
	.word	0x363f9a35,0x27f66a3d,0xa598cf31,0x8d8c0715
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
	.word	0x1b8f7d46,0xaf81bc98,0x824eb49c,0x2ed892ea
	.word	0x4a304c3d,0xa8b048e7,0xe6407e40,0xf7ab5055
	.word	0xd8e6ce4c,0x942fd014,0x75b9858d,0x1620328d
	.word	0x71ab266e,0xc09ea95a,0xe7e90bfe,0x0d25a833
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
	.word	0x8133c33f,0xf4da8069,0xdfa2a285,0x7434707e
	.word	0xd96961ab,0xd3f0945b,0x65a83c04,0x764d9b65
	.word	0x02ef1a8b,0xd0a70dbd,0x7675aa25,0xc538ae7b
	.word	0xbfe88956,0x83046f12,0x3581cb85,0x03de0639
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
	.word	0x9571d651,0xcadef01f,0x8f789c95,0xb6db2159
	.word	0x4a1078a2,0xb3daf98d,0x18a51845,0x2939aeb7
	.word	0x7e896b4b,0x619ea349,0x44ac773f,0x75c4b163
	.word	0x6637ae9a,0x7cde596a,0x0d5d70fb,0x326fc183
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
	.word	0xedb5bf86,0x97087ae2,0x1a0737df,0xaa2573fc
	.word	0x06f6cdb1,0x578fe668,0x60029afb,0x295bdcc7
	.word	0x518a9713,0x775bb616,0x9c873bb5,0x6e1e92a8
	.word	0xb855c84f,0xed0f510e,0x3c0306f6,0x76945c96
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
	.word	0x85292cf3,0x8a020517,0x6d2348b4,0x993c43f4
	.word	0x040a269d,0x007ee51c,0x135abbdb,0xc99b887f
	.word	0x5311e374,0xddae6b21,0x58753f2f,0x3473a3d9
	.word	0x3a01337c,0xdc6b25e8,0x18295d59,0xc1b881ee
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
	.word	0xb5da9157,0x08504e7f,0x7d9a73ba,0xd172c211
	.word	0x9b36de0f,0x678cb230,0xce9eb990,0xcb947cb9
	.word	0x6ad32ca6,0x0319074f,0x96d26ea4,0xe1629794
	.word	0x8c6b34b0,0x69d5ceb3,0xc0179a5b,0xe0d68277
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
	.word	0x63aa31e8,0x50b9a13d,0xd8f75d6a,0x5ba08a59
	.word	0xd52c785b,0xe0ec1944,0x3b1ed75a,0x1b41e871
	.word	0x2723af57,0xbac23955,0xf2e25d08,0x99c1993d
	.word	0x93ab8046,0x52e548c3,0x7403c892,0x43ca1dd3
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
	.word	0xf80d8eb0,0x60c5dcdc,0x93fa25bf,0x54a253f4
	.word	0x1587bee0,0x7d7065c6,0xd7b990b5,0x35d2d9ba
	.word	0xca183ff7,0x800ab348,0x81307899,0xf04aa8b9
	.word	0x3a556ff6,0x1a305500,0xb6c9bad6,0x86935743
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
	.word	0x28dc6b63,0x1ad3c301,0x1a9fce35,0xd21c5fbd
	.word	0x246df1ed,0xd888a0ef,0xb1ac8a3b,0x1da45bae
	.word	0x25e7a6d9,0x948a6312,0x9c8971bc,0xd6fa8c51
	.word	0x250c8aa7,0x956266fb,0xce75fb64,0xa19e6944
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
	.word	0x8741851d,0xde8937aa,0xde82631a,0x6745b468
	.word	0x5610c0ea,0x4162d709,0xd8a4a5a1,0x8167a198
	.word	0x18b0d48e,0x0ea0138c,0x082f9616,0x1b4f587d
	.word	0x72e6ec0e,0x55df321b,0xf92b30f6,0x5cdb673a
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
	.word	0x77609984,0x2bec91a7,0xfe5e67cb,0x581068a5
	.word	0x22022867,0x0810535b,0x123092c5,0x91af0f03
	.word	0x157251fd,0x0a58157f,0xd8af464d,0x438de4d1
	.word	0xe1d10f95,0x307759ce,0x1eafe96b,0x08c6de7f
	.word	0xa562b8ec,0xf2beaf4d,0x5f61a4b6,0xf0d51b6d
	.word	0x24a8c980,0x2f1ea9e6,0x62b5297b,0xc878e0f9
	.word	0xd24c817a,0x0e9f0f4c,0x91d42c75,0xf2c53123
	.word	0x59587949,0x678ec535,0xb718fd7a,0x1cb18583
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
	.word	0xf62ea37b,0x419acc1e,0xe88f11a2,0xc2e1d26f
	.word	0x792da353,0x5f8e1107,0x1e5937ff,0xb9a5be67
	.word	0xcef5c1b9,0xe5034501,0x93fb97f0,0xd8fc0758
	.word	0x3146b796,0xb5cc938d,0x15e56063,0x527367b8
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
	.word	0x543e57e0,0x76cc7910,0x7e2c8b62,0x7b8b6ea4
	.word	0x6f958c74,0x76798a44,0x35081ccc,0x5edd64ad
	.word	0x4b307f3e,0x360dc1d4,0x77befed3,0xe00e49c7
	.word	0xfaf9021b,0xaa2f4afa,0x00ceabe4,0x3c742d1c
	.word	0x76084289,0xc6fc6e66,0xe7328b6b,0xfb4cfa20
	.word	0x00e57a15,0x8a2dbd74,0xa15113af,0x6da1c168
	.word	0x7b586550,0x00fe719b,0xda68bd29,0x8fcc2f8c
	.word	0x5e362db6,0xf96522e2,0x8b252939,0x83911a7e
	.word	0xff3114cb,0x19ce252d,0x0a852c4e,0xbe598ab7
	.word	0x03ccf312,0xb52c2446,0x84a7216c,0x1b86c2af
	.word	0xe8621c4a,0xfb878f7f,0xe8045a8d,0xa157e818
	.word	0xef07f2b3,0x3cf505fe,0xc5ed017a,0x6b44ae8f
	.word	0xad30d561,0x0db4979c,0x33053dea,0xc6dbbb54
	.word	0x9f56ff5e,0xeeca61bf,0xc806d1a8,0xeafe8187
	.word	0xb985b1b9,0x523add46,0xdb9ec8b3,0x8670b6ab
	.word	0x3476b61a,0x81b40212,0x64ea8aa6,0x2c9d9979
	.word	0x7ed35a3e,0xc00d1498,0x80f53c09,0xb6fdcb25
	.word	0x887794e6,0x16aa78b3,0x4f51f5d3,0xef8c5000
	.word	0x398da361,0xe6f4fcf3,0xe77bbea6,0x7177267a
	.word	0x14d99948,0xc762a774,0xc651988e,0x73343af6
	.word	0xe8d42023,0x01750275,0x7104a89a,0xe1d73ff5
	.word	0x332fb3ff,0x966e20ce,0xeccfdb22,0xe9599dfe
	.word	0x5cef0576,0x1dcbe138,0x54a08e10,0xb34f837c
	.word	0xa2bf5920,0xc164ce47,0xea76dddd,0x7227205b
	.word	0x5f00d16c,0x89249a6e,0x60b02eca,0xcb4f9dc7
	.word	0x5eb5632b,0xd66ba0bb,0xad00f924,0x789730f1
	.word	0x96d0e92c,0xc93c6dd6,0x81d62bdd,0xba4e0c95
	.word	0x71b7c202,0x8b296e6b,0x822fe2b9,0xe5e92341
	.word	0xb48b6d36,0xfd29576c,0x8c771932,0x184f47ca
	.word	0x4eb43808,0xffeb724a,0x3d669fa0,0x8845d527
	.word	0x4f57ece6,0xde1d53a8,0x05937090,0x2d45ebe0
	.word	0x1c3e0839,0x05a35133,0xb54c5e72,0x07d40398
share3_end:
