/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: mpgen_100l.s
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
!	Seed = 310225710
!	Riesling can be on
!	1 Thread, 100 lines
!	mpgen   created on Dec 20, 2005 (16:35:03)
!	march10.s created on Mar 10, 2009 (22:57:10)
!	RC file : vij_noretry.rc
!	cmd = /import/n2-tools/release/tools/mpgen/mpgen,1.051220 -rc vij_noretry.rc -o march10 -p 1 -l 100

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
!	%f0  = cdb6e415 86ecb691 72cb07c4 7e6be361
!	%f4  = f2970b29 d72c6636 6a2d677f 1272bbb4
!	%f8  = 00e4c303 82bbc904 102f1dce e0515102
!	%f12 = 384bbdc7 46e30a50 7daf5b39 0b6e4abc
	ldda	[%g1]ASI_BLK_P,%f0
	add	%g1,64,%g1
!	%f16 = f2dd3a05 a216fa6f ac00e1f3 e6228505
!	%f20 = c2124aba ecf25158 6540290c 59cfcbba
!	%f24 = 2c4349d0 90b030b5 807ed0b2 d3705e49
!	%f28 = 0e0d8eba a48dd81b 62a94147 5b91dca3
	ldda	[%g1]ASI_BLK_P,%f16
	add	%g1,64,%g1
!	%f32 = b51feea6 f1d8b515 ea3c25e2 d98dee35
!	%f36 = 81206b55 3c146395 7351cf59 bcc5b9d1
!	%f40 = 027f2d2e cae71048 fafe169e f6ea25ba
!	%f44 = 5aeb430b d98a6b6c a75e9b2e 9b892a9e
	ldda	[%g1]ASI_BLK_P,%f32

!	Set up the Graphics Status Register

	setx	0x570354d00000003c,%g7,%g1 ! GSR scale =  7, align = 4
	wr	%g1,%g0,%gsr		! GSR = 570354d00000003c
	wr	%g0,%y			! Clear Y register
	xorcc	%g0,%g0,%g3		! init %g3 and set flags
	membar	#Sync			! Force the block loads to complete

!	Start of Random Code for processor 0

p0_label_1:
!	Mem[0000000010141400] = caf9db3e6b0e0469, %f26 = 807ed0b2 d3705e49
	ldda	[%i5+%g0]0x88,%f26	! %f26 = caf9db3e 6b0e0469
!	%l1 = e18631ea3b179922, Mem[00000000100c1410] = 526083321a06d0aa
	stxa	%l1,[%i3+%o5]0x88	! Mem[00000000100c1410] = e18631ea3b179922
!	Mem[00000000201c0000] = bf2f1224, %l0 = c8a2c65c7a9556fd
	lduba	[%o0+0x000]%asi,%l0	! %l0 = 00000000000000bf
!	%l5 = 8c5abbc49d112e98, Mem[00000000100c1400] = 059f0b4b
	stha	%l5,[%i3+%g0]0x80	! Mem[00000000100c1400] = 2e980b4b
!	%l1 = e18631ea3b179922, Mem[0000000030181410] = 4340c3c3309e7883
	stxa	%l1,[%i6+%o5]0x89	! Mem[0000000030181410] = e18631ea3b179922
!	%l0 = 000000bf, %l1 = 3b179922, Mem[0000000030181408] = 6fc21799 da5963a1
	stda	%l0,[%i6+%o4]0x89	! Mem[0000000030181408] = 000000bf 3b179922
!	Mem[00000000201c0000] = bf2f1224, %l4 = 44655dabbc138eca
	ldsh	[%o0+%g0],%l4		! %l4 = ffffffffffffbf2f
!	Mem[00000000218000c0] = 0de12be4, %l5 = 8c5abbc49d112e98
	lduh	[%o3+0x0c0],%l5		! %l5 = 0000000000000de1
!	%l4 = ffffffffffffbf2f, Mem[0000000010001408] = 1a970fc7
	stba	%l4,[%i0+%o4]0x88	! Mem[0000000010001408] = 1a970f2f
!	Starting 10 instruction Store Burst
!	%l7 = a944a22aa87cf01c, Mem[000000001008143d] = 0f2d40d2
	stb	%l7,[%i2+0x03d]		! Mem[000000001008143c] = 0f1c40d2

p0_label_2:
!	%l6 = 270cc396aa7df4a2, Mem[0000000010001400] = 38be13f8ffedf8ee
	stxa	%l6,[%i0+%g0]0x80	! Mem[0000000010001400] = 270cc396aa7df4a2
!	%l4 = ffffffffffffbf2f, Mem[0000000010001410] = febbecbc52f986fb
	stxa	%l4,[%i0+%o5]0x88	! Mem[0000000010001410] = ffffffffffffbf2f
!	%f26 = caf9db3e 6b0e0469, Mem[0000000030041410] = 4e88e97d c134da0f
	stda	%f26,[%i1+%o5]0x81	! Mem[0000000030041410] = caf9db3e 6b0e0469
!	Mem[0000000021800081] = f6747a43, %l0 = 00000000000000bf
	ldstuba	[%o3+0x081]%asi,%l0	! %l0 = 00000074000000ff
!	%f22 = 6540290c 59cfcbba, Mem[0000000030141408] = 79e460e6 35d0709a
	stda	%f22,[%i5+%o4]0x81	! Mem[0000000030141408] = 6540290c 59cfcbba
!	%l2 = 38d969ee8c3e78c1, Mem[0000000030041410] = caf9db3e
	stba	%l2,[%i1+%o5]0x81	! Mem[0000000030041410] = c1f9db3e
!	%l3 = 2c8db541b817a5b7, Mem[0000000030081400] = f8de4f3b
	stba	%l3,[%i2+%g0]0x89	! Mem[0000000030081400] = f8de4fb7
!	Mem[0000000020800040] = 9b8cb58d, %l3 = 2c8db541b817a5b7
	ldstub	[%o1+0x040],%l3		! %l3 = 0000009b000000ff
!	Mem[00000000100c1410] = 2299173b, %l7 = a944a22aa87cf01c
	swapa	[%i3+%o5]0x80,%l7	! %l7 = 000000002299173b
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = 000000bf, %l2 = 38d969ee8c3e78c1
	ldsba	[%i6+%o4]0x89,%l2	! %l2 = ffffffffffffffbf

p0_label_3:
!	Mem[0000000010041400] = fdf29d7d, %l5 = 0000000000000de1
	lduha	[%i1+%g0]0x80,%l5	! %l5 = 000000000000fdf2
!	Mem[0000000030041410] = 3edbf9c1, %l4 = ffffffffffffbf2f
	ldswa	[%i1+%o5]0x89,%l4	! %l4 = 000000003edbf9c1
!	Mem[0000000010001410] = 2fbfffff, %l1 = e18631ea3b179922
	ldsba	[%i0+%o5]0x80,%l1	! %l1 = 000000000000002f
!	Mem[0000000030141408] = 6540290c, %l5 = 000000000000fdf2
	ldsba	[%i5+%o4]0x81,%l5	! %l5 = 0000000000000065
!	Mem[0000000010001410] = 2fbfffff, %l1 = 000000000000002f
	ldsha	[%i0+%o5]0x80,%l1	! %l1 = 0000000000002fbf
!	Mem[0000000010081410] = 896cddbe ede9f8d2, %l0 = 00000074, %l1 = 00002fbf
	ldda	[%i2+%o5]0x80,%l0	! %l0 = 00000000896cddbe 00000000ede9f8d2
!	Mem[0000000010181400] = 36319772dc559ab1, %f26 = caf9db3e 6b0e0469
	ldda	[%i6+%g0]0x80,%f26	! %f26 = 36319772 dc559ab1
!	Mem[0000000010081420] = c9095c72, %l4 = 000000003edbf9c1
	lduba	[%i2+0x023]%asi,%l4	! %l4 = 0000000000000072
!	Mem[0000000010001428] = eee6cf39, %l4 = 0000000000000072
	lduwa	[%i0+0x028]%asi,%l4	! %l4 = 00000000eee6cf39
!	Starting 10 instruction Store Burst
!	%l4 = eee6cf39, %l5 = 00000065, Mem[0000000030141400] = 7aef75a5 10a292d7
	stda	%l4,[%i5+%g0]0x89	! Mem[0000000030141400] = eee6cf39 00000065

p0_label_4:
!	%l2 = ffffffffffffffbf, Mem[0000000030181408] = 3b179922000000bf
	stxa	%l2,[%i6+%o4]0x89	! Mem[0000000030181408] = ffffffffffffffbf
!	%l3 = 000000000000009b, Mem[0000000010041400] = fdf29d7d575742b5
	stx	%l3,[%i1+%g0]		! Mem[0000000010041400] = 000000000000009b
!	%l5 = 0000000000000065, Mem[0000000020800000] = a69b9fab
	sth	%l5,[%o1+%g0]		! Mem[0000000020800000] = 00659fab
!	%l2 = ffffffffffffffbf, imm = fffffffffffff0ae, %l6 = 270cc396aa7df4a2
	addc	%l2,-0xf52,%l6		! %l6 = fffffffffffff06d
!	Mem[0000000030001400] = 66822aa1, %l1 = 00000000ede9f8d2
	ldstuba	[%i0+%g0]0x89,%l1	! %l1 = 000000a1000000ff
!	%l0 = 896cddbe, %l1 = 000000a1, Mem[0000000030141410] = 531627b6 4943e362
	stda	%l0,[%i5+%o5]0x81	! Mem[0000000030141410] = 896cddbe 000000a1
!	Mem[00000000300c1410] = 084af959, %l4 = 00000000eee6cf39
	swapa	[%i3+%o5]0x89,%l4	! %l4 = 00000000084af959
!	%l0 = 896cddbe, %l1 = 000000a1, Mem[0000000010101410] = 63bf06b6 f963993d
	std	%l0,[%i4+%o5]		! Mem[0000000010101410] = 896cddbe 000000a1
!	%l1 = 00000000000000a1, Mem[0000000010081410] = bedd6c89
	stha	%l1,[%i2+%o5]0x88	! Mem[0000000010081410] = bedd00a1
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = 459b0675, %l2 = ffffffffffffffbf
	ldswa	[%i5+%o5]0x80,%l2	! %l2 = 00000000459b0675

p0_label_5:
!	Mem[0000000030101408] = 92a2596c, %f29 = a48dd81b
	lda	[%i4+%o4]0x89,%f29	! %f29 = 92a2596c
!	Mem[0000000010141400] = 69040e6b, %l4 = 00000000084af959
	ldsha	[%i5+%g0]0x80,%l4	! %l4 = 0000000000006904
!	Mem[0000000030041400] = 1d263bcf, %l4 = 0000000000006904
	ldsba	[%i1+%g0]0x81,%l4	! %l4 = 000000000000001d
!	Code Fragment 3
p0_fragment_1:
!	%l0 = 00000000896cddbe
	setx	0x225fc8505b55726b,%g7,%l0 ! %l0 = 225fc8505b55726b
!	%l1 = 00000000000000a1
	setx	0x4adc826f879c50b2,%g7,%l1 ! %l1 = 4adc826f879c50b2
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 225fc8505b55726b
	setx	0x0261f30f99277814,%g7,%l0 ! %l0 = 0261f30f99277814
!	%l1 = 4adc826f879c50b2
	setx	0x92fe2b002d5350c0,%g7,%l1 ! %l1 = 92fe2b002d5350c0
!	Mem[0000000010041400] = 000000000000009b, %f0  = cdb6e415 86ecb691
	ldda	[%i1+%g0]0x80,%f0 	! %f0  = 00000000 0000009b
!	Mem[00000000300c1408] = a6417fb78d0b1fa6, %f28 = 0e0d8eba 92a2596c
	ldda	[%i3+%o4]0x89,%f28	! %f28 = a6417fb7 8d0b1fa6
!	Mem[000000001004141c] = 18bfaf15, %l4 = 000000000000001d
	lduwa	[%i1+0x01c]%asi,%l4	! %l4 = 0000000018bfaf15
!	Mem[0000000010001408] = 2f0f971a e7674c3a, %l6 = fffff06d, %l7 = 2299173b
	ldda	[%i0+0x008]%asi,%l6	! %l6 = 000000002f0f971a 00000000e7674c3a
!	Mem[0000000030041400] = cf3b261d, %l7 = 00000000e7674c3a
	ldswa	[%i1+%g0]0x89,%l7	! %l7 = ffffffffcf3b261d
!	Starting 10 instruction Store Burst
!	%l5 = 0000000000000065, Mem[0000000010081400] = c19667df4b03ed24, %asi = 80
	stxa	%l5,[%i2+0x000]%asi	! Mem[0000000010081400] = 0000000000000065

!	Check Point 1 for processor 0

	set	p0_check_pt_data_1,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 0261f30f99277814
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 92fe2b002d5350c0
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 00000000459b0675
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 000000000000009b
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 0000000018bfaf15
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 0000000000000065
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 000000002f0f971a
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = ffffffffcf3b261d
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = 00000000 0000009b
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x50],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 6a2d677f 1272bbb4
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x58],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = 36319772 dc559ab1
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1
	ldx	[%g4+0x60],%g3
	std	%f28,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f28 = a6417fb7 8d0b1fa6
	bne	%xcc,p0_freg_check_fail
	mov	0xf28,%g1

!	Check Point 1 completed


p0_label_6:
!	%l5 = 0000000000000065, Mem[0000000030101408] = 677db12a92a2596c
	stxa	%l5,[%i4+%o4]0x89	! Mem[0000000030101408] = 0000000000000065
!	Mem[0000000030081410] = 608308f9, %l2 = 00000000459b0675
	swapa	[%i2+%o5]0x81,%l2	! %l2 = 00000000608308f9
!	%f14 = 7daf5b39 0b6e4abc, %l1 = 92fe2b002d5350c0
!	Mem[0000000030141438] = f5048c4fde951ac0
	add	%i5,0x038,%g1
	stda	%f14,[%g1+%l1]ASI_PST32_SL ! Mem[0000000030141438] = f5048c4fde951ac0
!	%l3 = 000000000000009b, Mem[0000000010001410] = ffffbf2f
	stha	%l3,[%i0+%o5]0x88	! Mem[0000000010001410] = ffff009b
!	%l2 = 00000000608308f9, Mem[00000000218000c1] = 0de12be4, %asi = 80
	stba	%l2,[%o3+0x0c1]%asi	! Mem[00000000218000c0] = 0df92be4
!	Mem[0000000010081410] = bedd00a1, %l2 = 00000000608308f9
	swapa	[%i2+%o5]0x88,%l2	! %l2 = 00000000bedd00a1
!	%l6 = 000000002f0f971a, Mem[0000000030141400] = eee6cf39
	stwa	%l6,[%i5+%g0]0x89	! Mem[0000000030141400] = 2f0f971a
!	Mem[0000000010101408] = 3a4df65d, %l1 = 92fe2b002d5350c0
	swapa	[%i4+%o4]0x88,%l1	! %l1 = 000000003a4df65d
!	%f0  = 00000000 0000009b 72cb07c4 7e6be361
!	%f4  = f2970b29 d72c6636 6a2d677f 1272bbb4
!	%f8  = 00e4c303 82bbc904 102f1dce e0515102
!	%f12 = 384bbdc7 46e30a50 7daf5b39 0b6e4abc
	stda	%f0,[%i2]ASI_BLK_PL	! Block Store to 0000000010081400
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = cf3b261d, %l0 = 0261f30f99277814
	lduba	[%i1+%g0]0x89,%l0	! %l0 = 000000000000001d

p0_label_7:
!	Mem[0000000010041400] = 00000000 0000009b, %l0 = 0000001d, %l1 = 3a4df65d
	ldda	[%i1+%g0]0x80,%l0	! %l0 = 0000000000000000 000000000000009b
!	Mem[00000000100c1400] = 2e980b4b, %l7 = ffffffffcf3b261d
	lduh	[%i3+0x002],%l7		! %l7 = 0000000000000b4b
!	Mem[0000000030181408] = bfffffff, %l2 = 00000000bedd00a1
	ldsha	[%i6+%o4]0x81,%l2	! %l2 = ffffffffffffbfff
!	Mem[0000000020800040] = ff8cb58d, %l0 = 0000000000000000
	lduba	[%o1+0x041]%asi,%l0	! %l0 = 000000000000008c
!	Mem[0000000010041438] = 5c708d6c fbfa3367, %l0 = 0000008c, %l1 = 0000009b
	ldda	[%i1+0x038]%asi,%l0	! %l0 = 000000005c708d6c 00000000fbfa3367
!	Mem[0000000010101400] = 9cd6264b, %l1 = 00000000fbfa3367
	ldswa	[%i4+%g0]0x88,%l1	! %l1 = ffffffff9cd6264b
!	Mem[0000000010041410] = a456c0c5 299b1b34, %l6 = 2f0f971a, %l7 = 00000b4b
	ldda	[%i1+%o5]0x80,%l6	! %l6 = 00000000a456c0c5 00000000299b1b34
!	Mem[0000000010141408] = 4ec37c32, %f28 = a6417fb7
	lda	[%i5+%o4]0x88,%f28	! %f28 = 4ec37c32
!	Mem[0000000030181408] = ffffffbf, %f25 = 90b030b5
	lda	[%i6+%o4]0x89,%f25	! %f25 = ffffffbf
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1418] = 57ada632d33d07ad, %l5 = 0000000000000065, %l0 = 000000005c708d6c
	add	%i3,0x18,%g1
	casxa	[%g1]0x80,%l5,%l0	! %l0 = 57ada632d33d07ad

p0_label_8:
!	%l6 = 00000000a456c0c5, Mem[0000000030181400] = 8e85b453
	stba	%l6,[%i6+%g0]0x81	! Mem[0000000030181400] = c585b453
!	%l6 = 00000000a456c0c5, Mem[0000000030001400] = 66822aff
	stwa	%l6,[%i0+%g0]0x89	! Mem[0000000030001400] = a456c0c5
!	Mem[000000001018142c] = 7829c929, %l3 = 0000009b, %l3 = 0000009b
	add	%i6,0x2c,%g1
	casa	[%g1]0x80,%l3,%l3	! %l3 = 000000007829c929
!	Mem[0000000010141408] = 327cc34e, %l4 = 0000000018bfaf15
	ldstuba	[%i5+%o4]0x80,%l4	! %l4 = 00000032000000ff
!	%l0 = 57ada632d33d07ad, Mem[0000000030141410] = bedd6c89
	stba	%l0,[%i5+%o5]0x89	! Mem[0000000030141410] = bedd6cad
!	Mem[000000001000143f] = 5add1360, %l0 = 57ada632d33d07ad
	ldstub	[%i0+0x03f],%l0		! %l0 = 00000060000000ff
!	Mem[0000000030101410] = 235d51e4, %l6 = 00000000a456c0c5
	ldstuba	[%i4+%o5]0x89,%l6	! %l6 = 000000e4000000ff
!	%l4 = 00000032, %l5 = 00000065, Mem[0000000030181410] = 3b179922 e18631ea
	stda	%l4,[%i6+%o5]0x89	! Mem[0000000030181410] = 00000032 00000065
!	%l0 = 00000060, %l1 = 9cd6264b, Mem[0000000010141408] = 4ec37cff e65344d2
	stda	%l0,[%i5+%o4]0x88	! Mem[0000000010141408] = 00000060 9cd6264b
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = 2f0f971a, %l3 = 000000007829c929
	ldsha	[%i0+%o4]0x80,%l3	! %l3 = 0000000000002f0f

p0_label_9:
!	Mem[00000000300c1400] = 68244485 225834de, %l2 = ffffbfff, %l3 = 00002f0f
	ldda	[%i3+%g0]0x81,%l2	! %l2 = 0000000068244485 00000000225834de
!	Mem[0000000010041410] = a456c0c5299b1b34, %l1 = ffffffff9cd6264b
	ldxa	[%i1+%o5]0x80,%l1	! %l1 = a456c0c5299b1b34
!	Mem[00000000100c1408] = 9c8f4933de7a2145, %f22 = 6540290c 59cfcbba
	ldd	[%i3+%o4],%f22		! %f22 = 9c8f4933 de7a2145
!	Mem[0000000030141408] = 6540290c, %l3 = 00000000225834de
	ldswa	[%i5+%o4]0x81,%l3	! %l3 = 000000006540290c
	membar	#Sync			! Added by membar checker (1)
!	Mem[0000000010081400] = 9b000000, %l2 = 0000000068244485
	lduha	[%i2+%g0]0x80,%l2	! %l2 = 0000000000009b00
!	Mem[0000000010081410] = d72c6636, %l1 = a456c0c5299b1b34
	ldsba	[%i2+%o5]0x88,%l1	! %l1 = 0000000000000036
!	Mem[0000000010081404] = 00000000, %l1 = 0000000000000036
	ldsba	[%i2+0x005]%asi,%l1	! %l1 = 0000000000000000
!	Mem[0000000030101400] = 8e82528a 8d809d3f 65000000 00000000
!	Mem[0000000030101410] = ff515d23 7d046439 a7d63a71 08f0758e
!	Mem[0000000030101420] = 6e88291a dc4d22dc 4085bbb4 0e99896d
!	Mem[0000000030101430] = d79eaa4f 7d319079 3295405b 5306381e
	ldda	[%i4]ASI_BLK_S,%f0	! Block Load from 0000000030101400
!	Mem[0000000010081404] = 00000000, %f23 = de7a2145
	ld	[%i2+0x004],%f23	! %f23 = 00000000
!	Starting 10 instruction Store Burst
!	%l2 = 0000000000009b00, Mem[0000000010141408] = 60000000
	stba	%l2,[%i5+%o4]0x80	! Mem[0000000010141408] = 00000000

p0_label_10:
!	%l4 = 00000032, %l5 = 00000065, Mem[00000000100c1410] = a87cf01c ea3186e1
	stda	%l4,[%i3+%o5]0x80	! Mem[00000000100c1410] = 00000032 00000065
!	%l0 = 0000000000000060, Mem[00000000100c1410] = 00000032
	stba	%l0,[%i3+%o5]0x80	! Mem[00000000100c1410] = 60000032
!	Mem[0000000030101400] = 8e82528a, %l3 = 000000006540290c
	ldstuba	[%i4+%g0]0x81,%l3	! %l3 = 0000008e000000ff
!	Mem[0000000010081420] = 04c9bb82, %l5 = 0000000000000065, %asi = 80
	swapa	[%i2+0x020]%asi,%l5	! %l5 = 0000000004c9bb82
!	%l1 = 0000000000000000, Mem[0000000030041400] = 1d263bcf
	stba	%l1,[%i1+%g0]0x81	! Mem[0000000030041400] = 00263bcf
!	Mem[0000000010181430] = 56784399081b3cc2, %l0 = 0000000000000060, %l5 = 0000000004c9bb82
	add	%i6,0x30,%g1
	casxa	[%g1]0x80,%l0,%l5	! %l5 = 56784399081b3cc2
!	%f22 = 9c8f4933 00000000, %l1 = 0000000000000000
!	Mem[0000000010181430] = 56784399081b3cc2
	add	%i6,0x030,%g1
	stda	%f22,[%g1+%l1]ASI_PST8_PL ! Mem[0000000010181430] = 56784399081b3cc2
!	%f28 = 4ec37c32 8d0b1fa6, Mem[00000000300c1410] = eee6cf39 a2d8a510
	stda	%f28,[%i3+%o5]0x89	! Mem[00000000300c1410] = 4ec37c32 8d0b1fa6
!	%l2 = 0000000000009b00, Mem[0000000030041408] = 1a6a9a51
	stba	%l2,[%i1+%o4]0x89	! Mem[0000000030041408] = 1a6a9a00
!	Starting 10 instruction Load Burst
!	Mem[0000000030001400] = c5c056a4, %l2 = 0000000000009b00
	lduba	[%i0+%g0]0x81,%l2	! %l2 = 00000000000000c5

!	Check Point 2 for processor 0

	set	p0_check_pt_data_2,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 0000000000000060
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 0000000000000000
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 00000000000000c5
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 000000000000008e
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 0000000000000032
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l6,%g2			! %l6 = 00000000000000e4
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l7,%g2			! %l7 = 00000000299b1b34
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x40],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = 8e82528a 8d809d3f
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x48],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = 65000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x50],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = ff515d23 7d046439
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x58],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = a7d63a71 08f0758e
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x60],%g3
	std	%f8,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f8 = 6e88291a dc4d22dc
	bne	%xcc,p0_freg_check_fail
	mov	0xf08,%g1
	ldx	[%g4+0x68],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = 4085bbb4 0e99896d
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x70],%g3
	std	%f12,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f12 = d79eaa4f 7d319079
	bne	%xcc,p0_freg_check_fail
	mov	0xf12,%g1
	ldx	[%g4+0x78],%g3
	std	%f14,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f14 = 3295405b 5306381e
	bne	%xcc,p0_freg_check_fail
	mov	0xf14,%g1
	ldx	[%g4+0x80],%g3
	std	%f22,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f22 = 9c8f4933 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf22,%g1
	ldx	[%g4+0x88],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = 2c4349d0 ffffffbf
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1
	ldx	[%g4+0x90],%g3
	std	%f28,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f28 = 4ec37c32 8d0b1fa6
	bne	%xcc,p0_freg_check_fail
	mov	0xf28,%g1

!	Check Point 2 completed


	ba,a	p0_not_taken_0_end
p0_not_taken_0:
!	The following code should not be executed
	ldsba	[%i4+0x00b]%asi,%l3
	std	%l6,[%i4+0x020]
	ldsba	[%i3+0x01a]%asi,%l4
	lduba	[%i5+0x011]%asi,%l5
	ba,a	p0_branch_failed
p0_not_taken_0_end:


!	End of Random Code for Thread 0

1:	membar	#Sync			! Force all stores to complete


!	Self Check Disabled

p0_check_registers:

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
	umul	%l6,%l7,%l2
	lduha	[%i0+%g0]ASI_AS_IF_USER_PRIMARY,%l2	! Mem[0000000010001400]
	ldxa	[%i6+%o4]ASI_AS_IF_USER_PRIMARY,%l4	! Mem[0000000010181408]
	stwa	%l4,[%i0+%o5]ASI_AS_IF_USER_PRIMARY	! Mem[0000000010001410]
	addc	%l3,-0x550,%l0
	done

p0_trap1o:
	umul	%l6,%l7,%l2
	lduha	[%o0+%g0]ASI_AS_IF_USER_PRIMARY,%l2	! Mem[0000000010001400]
	ldxa	[%o6+%i4]ASI_AS_IF_USER_PRIMARY,%l4	! Mem[0000000010181408]
	stwa	%l4,[%o0+%i5]ASI_AS_IF_USER_PRIMARY	! Mem[0000000010001410]
	addc	%l3,-0x550,%l0
	done


p0_trap2e:
	membar	#Sync
	ldda	[%i6]ASI_BLK_AIUP,%f0
	membar	#Sync
	stda	%l0,[%i6+%o4]ASI_AS_IF_USER_PRIMARY	! Mem[0000000010181408]
	udivx	%l1,%l6,%l6
	done

p0_trap2o:
	membar	#Sync
	ldda	[%o6]ASI_BLK_AIUP,%f0
	membar	#Sync
	stda	%l0,[%o6+%i4]ASI_AS_IF_USER_PRIMARY	! Mem[0000000010181408]
	udivx	%l1,%l6,%l6
	done


p0_trap3e:
	xor	%l3,%l5,%l7
	xnor	%l5,0x32d,%l3
	andn	%l1,%l3,%l7
	sub	%l7,0x313,%l4
	andn	%l2,-0x5f3,%l2
	done

p0_trap3o:
	xor	%l3,%l5,%l7
	xnor	%l5,0x32d,%l3
	andn	%l1,%l3,%l7
	sub	%l7,0x313,%l4
	andn	%l2,-0x5f3,%l2
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
	ldx	[%g1+0x000],%l0		! %l0 = c8a2c65c7a9556fd
	ldx	[%g1+0x008],%l1		! %l1 = e18631ea3b179922
	ldx	[%g1+0x010],%l2		! %l2 = 38d969ee8c3e78c1
	ldx	[%g1+0x018],%l3		! %l3 = 2c8db541b817a5b7
	ldx	[%g1+0x020],%l4		! %l4 = 44655dabbc138eca
	ldx	[%g1+0x028],%l5		! %l5 = 8c5abbc49d112e98
	ldx	[%g1+0x030],%l6		! %l6 = 270cc396aa7df4a2
	ldx	[%g1+0x038],%l7		! %l7 = a944a22aa87cf01c

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
	umul	%l6,%l7,%l2
	ld	[%i6+0x034],%f9 	! Mem[0000000010181434]
	sub	%l1,0xaf8,%l5
	nop
	lduw	[%i4+0x00c],%l4		! Mem[000000001010140c]
	ldstub	[%o2+0x000],%l5		! Mem[00000000211c0000]
	jmpl	%o7,%g0
	ldstub	[%o3+0x001],%l3		! Mem[0000000021800001]
p0_near_0_he:
	and	%l7,0x043,%l5
	swap	[%i5+0x03c],%l5		! Mem[000000001014143c]
	jmpl	%o7,%g0
	or	%l3,%l6,%l1
near0_b2b_h:
	umul	%l5,0x504,%l5
	xnor	%l5,%l0,%l1
	nop
	jmpl	%o7,%g0
	smul	%l2,-0x463,%l5
near0_b2b_l:
	sdivx	%l3,0xe0d,%l6
	andn	%l2,0xcc9,%l2
	or	%l0,%l2,%l1
	jmpl	%o7,%g0
	sub	%l4,-0x8a7,%l3
user_near0_end:
	.seg	"text"
	.align	0x2000
user_near1_start:
p0_near_1_le:
	andn	%l3,%l2,%l2
	jmpl	%o7,%g0
	stx	%l2,[%i1+0x038]		! Mem[0000000010041438]
p0_near_1_he:
	subc	%l3,-0xd89,%l4
	ldsw	[%i2+0x024],%l6		! Mem[0000000010081424]
	sub	%l0,%l6,%l7
	jmpl	%o7,%g0
	xor	%l7,%l7,%l5
near1_b2b_h:
	sdivx	%l4,%l7,%l3
	or	%l3,-0xc22,%l7
	subc	%l1,%l3,%l7
	udivx	%l1,%l0,%l0
	umul	%l5,%l5,%l4
	xnor	%l0,-0x9c6,%l1
	nop
	jmpl	%o7,%g0
	smul	%l5,0xa36,%l6
near1_b2b_l:
	nop
	xnor	%l7,%l3,%l7
	umul	%l0,%l6,%l6
	add	%l4,%l0,%l5
	and	%l7,%l5,%l6
	sub	%l7,%l7,%l0
	subc	%l0,-0xd2c,%l6
	jmpl	%o7,%g0
	subc	%l2,%l7,%l6
user_near1_end:
	.seg	"text"
	.align	0x2000
user_near2_start:
p0_near_2_le:
	ld	[%i3+0x008],%f5 	! Mem[00000000100c1408]
	std	%f4 ,[%i4+0x010]	! Mem[0000000010101410]
	jmpl	%o7,%g0
	ldd	[%i1+0x030],%f6 	! Mem[0000000010041430]
p0_near_2_he:
	smul	%l1,%l4,%l7
	std	%l2,[%i0+0x038]		! Mem[0000000010001438]
	and	%l1,0x855,%l2
	lduh	[%i2+0x02a],%l4		! Mem[000000001008142a]
	st	%f16,[%i6+0x038]	! Mem[0000000010181438]
	stb	%l2,[%i0+0x011]		! Mem[0000000010001411]
	jmpl	%o7,%g0
	lduw	[%i4+0x010],%l6		! Mem[0000000010101410]
near2_b2b_h:
	jmpl	%o7,%g0
	orn	%l4,%l5,%l7
	jmpl	%o7,%g0
	nop
near2_b2b_l:
	jmpl	%o7,%g0
	addc	%l2,%l5,%l5
	jmpl	%o7,%g0
	nop
user_near2_end:
	.seg	"text"
	.align	0x2000
user_near3_start:
p0_near_3_le:
	andn	%l2,-0xee7,%l3
	jmpl	%o7,%g0
	udivx	%l4,0x478,%l0
p0_near_3_he:
	xnor	%l6,-0x654,%l7
	stx	%l6,[%i3+0x038]		! Mem[00000000100c1438]
	and	%l3,-0xc59,%l6
	addc	%l5,%l0,%l4
	stx	%l7,[%i5+0x020]		! Mem[0000000010141420]
	addc	%l7,-0x712,%l3
	or	%l1,%l0,%l4
	jmpl	%o7,%g0
	addc	%l1,%l7,%l7
near3_b2b_h:
	jmpl	%o7,%g0
	umul	%l0,%l5,%l5
	jmpl	%o7,%g0
	nop
near3_b2b_l:
	jmpl	%o7,%g0
	mulx	%l5,%l1,%l4
	jmpl	%o7,%g0
	nop
user_near3_end:
	.seg	"text"
	.text
	.align	0x2000
user_far0_start:
p0_far_0_le:
	ldsh	[%i6+0x036],%l6		! Mem[0000000010181436]
	ld	[%i4+0x034],%f10	! Mem[0000000010101434]
	st	%f6 ,[%i5+0x018]	! Mem[0000000010141418]
	umul	%l5,%l1,%l7
	jmpl	%o7,%g0
	st	%f1 ,[%i4+0x01c]	! Mem[000000001010141c]
p0_far_0_lem:
	membar	#Sync
	ldsh	[%i6+0x036],%l6		! Mem[0000000010181436]
	ld	[%i4+0x034],%f10	! Mem[0000000010101434]
	st	%f6 ,[%i5+0x018]	! Mem[0000000010141418]
	umul	%l5,%l1,%l7
	membar	#Sync
	jmpl	%o7,%g0
	st	%f1 ,[%i4+0x01c]	! Mem[000000001010141c]
p0_far_0_he:
	ld	[%i4+0x000],%f20	! Mem[0000000010101400]
	orn	%l2,%l6,%l7
	std	%l4,[%i0+0x008]		! Mem[0000000010001408]
	subc	%l5,0xc2c,%l5
	jmpl	%o7,%g0
	ldsb	[%i6+0x012],%l1		! Mem[0000000010181412]
p0_far_0_hem:
	membar	#Sync
	ld	[%i4+0x000],%f20	! Mem[0000000010101400]
	orn	%l2,%l6,%l7
	std	%l4,[%i0+0x008]		! Mem[0000000010001408]
	subc	%l5,0xc2c,%l5
	membar	#Sync
	jmpl	%o7,%g0
	ldsb	[%i6+0x012],%l1		! Mem[0000000010181412]
p0_loop_branch_0:
	jmpl	%o7+12,%g0
	add	%l0,1,%l0
far0_b2b_h:
	addc	%l4,%l1,%l5
	mulx	%l6,0x778,%l7
	udivx	%l7,%l3,%l0
	sdivx	%l1,%l5,%l4
	xor	%l0,-0xea1,%l5
	jmpl	%o7,%g0
	and	%l0,-0x940,%l3
far0_b2b_l:
	add	%l4,-0x0f6,%l4
	udivx	%l4,0x88e,%l3
	and	%l7,0x649,%l3
	subc	%l7,%l0,%l2
	or	%l2,%l2,%l0
	jmpl	%o7,%g0
	andn	%l0,%l5,%l0
user_far0_end:
	.seg	"text"
	.text
	.align	0x2000
user_far1_start:
p0_far_1_le:
	nop
	andn	%l1,-0xd81,%l5
	ldd	[%i6+0x038],%l2		! Mem[0000000010181438]
	st	%f0 ,[%i1+0x01c]	! Mem[000000001004141c]
	umul	%l0,%l2,%l4
	ldstub	[%o0+0x001],%l4		! Mem[00000000201c0001]
	ldsw	[%i2+0x024],%l1		! Mem[0000000010081424]
	jmpl	%o7,%g0
	xor	%l7,%l5,%l7
p0_far_1_lem:
	nop
	andn	%l1,-0xd81,%l5
	membar	#Sync
	ldd	[%i6+0x038],%l2		! Mem[0000000010181438]
	st	%f0 ,[%i1+0x01c]	! Mem[000000001004141c]
	umul	%l0,%l2,%l4
	ldstub	[%o0+0x001],%l4		! Mem[00000000201c0001]
	ldsw	[%i2+0x024],%l1		! Mem[0000000010081424]
	jmpl	%o7,%g0
	xor	%l7,%l5,%l7
p0_far_1_he:
	xor	%l6,-0xbf4,%l1
	ldstub	[%i4+0x00f],%l3		! Mem[000000001010140f]
	ldub	[%i4+0x013],%l7		! Mem[0000000010101413]
	std	%l4,[%i2+0x028]		! Mem[0000000010081428]
	jmpl	%o7,%g0
	lduw	[%i2+0x004],%l4		! Mem[0000000010081404]
p0_far_1_hem:
	xor	%l6,-0xbf4,%l1
	membar	#Sync
	ldstub	[%i4+0x00f],%l3		! Mem[000000001010140f]
	ldub	[%i4+0x013],%l7		! Mem[0000000010101413]
	std	%l4,[%i2+0x028]		! Mem[0000000010081428]
	membar	#Sync
	jmpl	%o7,%g0
	lduw	[%i2+0x004],%l4		! Mem[0000000010081404]
p0_loop_branch_1:
	jmpl	%o7+12,%g0
	add	%l0,2,%l0
far1_b2b_h:
	or	%l7,-0x0ee,%l4
	xor	%l1,%l6,%l2
	umul	%l4,0x6c5,%l7
	xnor	%l0,%l0,%l4
	andn	%l7,0x599,%l5
	sdivx	%l0,0xe28,%l7
	jmpl	%o7,%g0
	udivx	%l5,%l1,%l5
far1_b2b_l:
	and	%l3,-0xe0b,%l3
	addc	%l1,%l2,%l4
	mulx	%l5,%l5,%l4
	add	%l7,%l3,%l3
	or	%l0,0x19d,%l2
	and	%l3,%l1,%l3
	jmpl	%o7,%g0
	subc	%l5,%l5,%l0
user_far1_end:
	.seg	"text"
	.text
	.align	0x2000
user_far2_start:
p0_far_2_le:
	ldstub	[%o1+0x001],%l1		! Mem[0000000020800001]
	xor	%l5,-0x667,%l5
	add	%l1,%l0,%l6
	st	%f3 ,[%i2+0x038]	! Mem[0000000010081438]
	ldub	[%i1+0x01f],%l1		! Mem[000000001004141f]
	jmpl	%o7,%g0
	ldd	[%i0+0x020],%f12	! Mem[0000000010001420]
p0_far_2_lem:
	ldstub	[%o1+0x001],%l1		! Mem[0000000020800001]
	xor	%l5,-0x667,%l5
	add	%l1,%l0,%l6
	membar	#Sync
	st	%f3 ,[%i2+0x038]	! Mem[0000000010081438]
	ldub	[%i1+0x01f],%l1		! Mem[000000001004141f]
	membar	#Sync
	jmpl	%o7,%g0
	ldd	[%i0+0x020],%f12	! Mem[0000000010001420]
p0_far_2_he:
	stw	%l7,[%i2+0x030]		! Mem[0000000010081430]
	stw	%l2,[%i4+0x008]		! Mem[0000000010101408]
	nop
	swap	[%i2+0x014],%l4		! Mem[0000000010081414]
	nop
	sth	%l2,[%i2+0x03a]		! Mem[000000001008143a]
	jmpl	%o7,%g0
	ldub	[%i1+0x016],%l7		! Mem[0000000010041416]
p0_far_2_hem:
	membar	#Sync
	stw	%l7,[%i2+0x030]		! Mem[0000000010081430]
	stw	%l2,[%i4+0x008]		! Mem[0000000010101408]
	nop
	swap	[%i2+0x014],%l4		! Mem[0000000010081414]
	nop
	sth	%l2,[%i2+0x03a]		! Mem[000000001008143a]
	membar	#Sync
	jmpl	%o7,%g0
	ldub	[%i1+0x016],%l7		! Mem[0000000010041416]
p0_loop_branch_2:
	jmpl	%o7+12,%g0
	add	%l0,3,%l0
far2_b2b_h:
	jmpl	%o7,%g0
	xor	%l7,-0xe69,%l4
	jmpl	%o7,%g0
	nop
far2_b2b_l:
	jmpl	%o7,%g0
	udivx	%l6,0x7ce,%l2
	jmpl	%o7,%g0
	nop
user_far2_end:
	.seg	"text"
	.text
	.align	0x2000
user_far3_start:
p0_far_3_le:
	stb	%l7,[%i6+0x036]		! Mem[0000000010181436]
	xnor	%l7,-0x325,%l2
	ldd	[%i3+0x028],%l2		! Mem[00000000100c1428]
	sdivx	%l3,%l7,%l2
	ldstub	[%i3+0x033],%l3		! Mem[00000000100c1433]
	jmpl	%o7,%g0
	smul	%l2,0x50f,%l6
p0_far_3_lem:
	membar	#Sync
	stb	%l7,[%i6+0x036]		! Mem[0000000010181436]
	xnor	%l7,-0x325,%l2
	ldd	[%i3+0x028],%l2		! Mem[00000000100c1428]
	sdivx	%l3,%l7,%l2
	ldstub	[%i3+0x033],%l3		! Mem[00000000100c1433]
	jmpl	%o7,%g0
	smul	%l2,0x50f,%l6
p0_far_3_he:
	jmpl	%o7,%g0
	sth	%l6,[%i6+0x014]		! Mem[0000000010181414]
	jmpl	%o7,%g0
	nop
p0_far_3_hem:
	membar	#Sync
	jmpl	%o7,%g0
	sth	%l6,[%i6+0x014]		! Mem[0000000010181414]
	jmpl	%o7,%g0
	nop
p0_loop_branch_3:
	jmpl	%o7+12,%g0
	add	%l0,4,%l0
far3_b2b_h:
	sub	%l4,0xaf0,%l1
	jmpl	%o7,%g0
	udivx	%l1,0xfa0,%l3
far3_b2b_l:
	and	%l5,%l5,%l2
	jmpl	%o7,%g0
	smul	%l5,0x8ca,%l0
user_far3_end:
	.seg	"text"
	.align	0x2000
user_jump0_start:
	INIT_MEM(0, 0x0010, 1, +, 0, +, 0)
p0_jmpl_0_le:
	stb	%l2,[%i2+0x03c]		! Mem[000000001008143c]
	ldub	[%i6+0x017],%l1		! Mem[0000000010181417]
	swap	[%i2+0x008],%l2		! Mem[0000000010081408]
	xnor	%l7,0x44b,%l7
	ld	[%i6+0x000],%f1 	! Mem[0000000010181400]
	or	%l4,-0x7cd,%l7
	jmpl	%g6+8,%g0
	ldsh	[%i6+0x034],%l7		! Mem[0000000010181434]
p0_call_0_le:
	retl
	ld	[%i2+0x03c],%f6 	! Mem[000000001008143c]
p0_jmpl_0_lo:
	stb	%l2,[%o2+0x03c]		! Mem[000000001008143c]
	ldub	[%o6+0x017],%l1		! Mem[0000000010181417]
	swap	[%o2+0x008],%l2		! Mem[0000000010081408]
	xnor	%l7,0x44b,%l7
	ld	[%o6+0x000],%f1 	! Mem[0000000010181400]
	or	%l4,-0x7cd,%l7
	jmpl	%g6+8,%g0
	ldsh	[%o6+0x034],%l7		! Mem[0000000010181434]
p0_call_0_lo:
	retl
	ld	[%o2+0x03c],%f6 	! Mem[000000001008143c]
p0_jmpl_0_he:
	lduw	[%i1+0x000],%l0		! Mem[0000000010041400]
	nop
	sth	%l7,[%i6+0x032]		! Mem[0000000010181432]
	ldstub	[%i4+0x013],%l4		! Mem[0000000010101413]
	ldstub	[%i5+0x00d],%l2		! Mem[000000001014140d]
	ldstub	[%i1+0x004],%l7		! Mem[0000000010041404]
	jmpl	%g6+8,%g0
	ldx	[%i0+0x010],%l5		! Mem[0000000010001410]
p0_call_0_he:
	sth	%l0,[%i1+0x004]		! Mem[0000000010041404]
	ldstub	[%i2+0x011],%l2		! Mem[0000000010081411]
	ldsw	[%i2+0x000],%l4		! Mem[0000000010081400]
	retl
	sth	%l1,[%i4+0x026]		! Mem[0000000010101426]
p0_jmpl_0_ho:
	lduw	[%o1+0x000],%l0		! Mem[0000000010041400]
	nop
	sth	%l7,[%o6+0x032]		! Mem[0000000010181432]
	ldstub	[%o4+0x013],%l4		! Mem[0000000010101413]
	ldstub	[%o5+0x00d],%l2		! Mem[000000001014140d]
	ldstub	[%o1+0x004],%l7		! Mem[0000000010041404]
	jmpl	%g6+8,%g0
	ldx	[%o0+0x010],%l5		! Mem[0000000010001410]
p0_call_0_ho:
	sth	%l0,[%o1+0x004]		! Mem[0000000010041404]
	ldstub	[%o2+0x011],%l2		! Mem[0000000010081411]
	ldsw	[%o2+0x000],%l4		! Mem[0000000010081400]
	retl
	sth	%l1,[%o4+0x026]		! Mem[0000000010101426]
user_jump0_end:
	.seg	"text"
	.align	0x2000
user_jump1_start:
	INIT_MEM(0, 0x0020, 1, +, 0, +, 0)
p0_jmpl_1_le:
	lduw	[%i2+0x02c],%l5		! Mem[000000001008142c]
	or	%l3,%l1,%l0
	smul	%l1,-0xb56,%l4
	udivx	%l5,0x4cd,%l5
	jmpl	%g6+8,%g0
	nop
p0_call_1_le:
	smul	%l4,-0x4ab,%l2
	lduw	[%i3+0x038],%l3		! Mem[00000000100c1438]
	smul	%l7,%l2,%l0
	addc	%l0,%l6,%l2
	std	%f12,[%i0+0x018]	! Mem[0000000010001418]
	xnor	%l7,-0x1d0,%l6
	retl
	ldd	[%i0+0x000],%l0		! Mem[0000000010001400]
p0_jmpl_1_lo:
	lduw	[%o2+0x02c],%l5		! Mem[000000001008142c]
	or	%l3,%l1,%l0
	smul	%l1,-0xb56,%l4
	udivx	%l5,0x4cd,%l5
	jmpl	%g6+8,%g0
	nop
p0_call_1_lo:
	smul	%l4,-0x4ab,%l2
	lduw	[%o3+0x038],%l3		! Mem[00000000100c1438]
	smul	%l7,%l2,%l0
	addc	%l0,%l6,%l2
	std	%f12,[%o0+0x018]	! Mem[0000000010001418]
	xnor	%l7,-0x1d0,%l6
	retl
	ldd	[%o0+0x000],%l0		! Mem[0000000010001400]
p0_jmpl_1_he:
	std	%f20,[%i6+0x000]	! Mem[0000000010181400]
	add	%l3,-0x706,%l6
	stb	%l4,[%i4+0x017]		! Mem[0000000010101417]
	ldsb	[%i6+0x022],%l3		! Mem[0000000010181422]
	std	%f24,[%i3+0x018]	! Mem[00000000100c1418]
	sdivx	%l7,%l4,%l4
	ldd	[%i0+0x008],%f22	! Mem[0000000010001408]
	jmpl	%g6+8,%g0
	swap	[%i5+0x02c],%l4		! Mem[000000001014142c]
p0_call_1_he:
	umul	%l4,%l6,%l1
	stb	%l4,[%i6+0x001]		! Mem[0000000010181401]
	and	%l2,%l0,%l5
	retl
	ldsw	[%i4+0x038],%l6		! Mem[0000000010101438]
p0_jmpl_1_ho:
	std	%f20,[%o6+0x000]	! Mem[0000000010181400]
	add	%l3,-0x706,%l6
	stb	%l4,[%o4+0x017]		! Mem[0000000010101417]
	ldsb	[%o6+0x022],%l3		! Mem[0000000010181422]
	std	%f24,[%o3+0x018]	! Mem[00000000100c1418]
	sdivx	%l7,%l4,%l4
	ldd	[%o0+0x008],%f22	! Mem[0000000010001408]
	jmpl	%g6+8,%g0
	swap	[%o5+0x02c],%l4		! Mem[000000001014142c]
p0_call_1_ho:
	umul	%l4,%l6,%l1
	stb	%l4,[%o6+0x001]		! Mem[0000000010181401]
	and	%l2,%l0,%l5
	retl
	ldsw	[%o4+0x038],%l6		! Mem[0000000010101438]
user_jump1_end:
	.seg	"text"
	.align	0x2000
user_jump2_start:
	INIT_MEM(0, 0x0030, 1, +, 0, +, 0)
p0_jmpl_2_le:
	mulx	%l0,-0x5d3,%l0
	st	%f11,[%i0+0x018]	! Mem[0000000010001418]
	ldd	[%i2+0x010],%l6		! Mem[0000000010081410]
	jmpl	%g6+8,%g0
	nop
p0_call_2_le:
	std	%l4,[%i1+0x020]		! Mem[0000000010041420]
	retl
	add	%l4,%l0,%l6
p0_jmpl_2_lo:
	mulx	%l0,-0x5d3,%l0
	st	%f11,[%o0+0x018]	! Mem[0000000010001418]
	ldd	[%o2+0x010],%l6		! Mem[0000000010081410]
	jmpl	%g6+8,%g0
	nop
p0_call_2_lo:
	std	%l4,[%o1+0x020]		! Mem[0000000010041420]
	retl
	add	%l4,%l0,%l6
p0_jmpl_2_he:
	std	%l6,[%i4+0x008]		! Mem[0000000010101408]
	std	%f18,[%i3+0x028]	! Mem[00000000100c1428]
	jmpl	%g6+8,%g0
	andn	%l3,%l3,%l5
p0_call_2_he:
	std	%f28,[%i6+0x038]	! Mem[0000000010181438]
	umul	%l3,0x8f8,%l7
	retl
	umul	%l0,-0x892,%l7
p0_jmpl_2_ho:
	std	%l6,[%o4+0x008]		! Mem[0000000010101408]
	std	%f18,[%o3+0x028]	! Mem[00000000100c1428]
	jmpl	%g6+8,%g0
	andn	%l3,%l3,%l5
p0_call_2_ho:
	std	%f28,[%o6+0x038]	! Mem[0000000010181438]
	umul	%l3,0x8f8,%l7
	retl
	umul	%l0,-0x892,%l7
user_jump2_end:
	.seg	"text"
	.align	0x2000
user_jump3_start:
	INIT_MEM(0, 0x0040, 1, +, 0, +, 0)
p0_jmpl_3_le:
	andn	%l2,-0xe48,%l3
	jmpl	%g6+8,%g0
	addc	%l4,0xcae,%l3
p0_call_3_le:
	or	%l7,%l7,%l3
	umul	%l1,-0x6e8,%l6
	std	%f0 ,[%i4+0x000]	! Mem[0000000010101400]
	orn	%l3,%l4,%l2
	ldd	[%i5+0x018],%l2		! Mem[0000000010141418]
	retl
	stb	%l1,[%i0+0x017]		! Mem[0000000010001417]
p0_jmpl_3_lo:
	andn	%l2,-0xe48,%l3
	jmpl	%g6+8,%g0
	addc	%l4,0xcae,%l3
p0_call_3_lo:
	or	%l7,%l7,%l3
	umul	%l1,-0x6e8,%l6
	std	%f0 ,[%o4+0x000]	! Mem[0000000010101400]
	orn	%l3,%l4,%l2
	ldd	[%o5+0x018],%l2		! Mem[0000000010141418]
	retl
	stb	%l1,[%o0+0x017]		! Mem[0000000010001417]
p0_jmpl_3_he:
	jmpl	%g6+8,%g0
	smul	%l7,%l5,%l4
p0_call_3_he:
	ldsh	[%i4+0x000],%l5		! Mem[0000000010101400]
	retl
	sub	%l7,%l3,%l5
p0_jmpl_3_ho:
	jmpl	%g6+8,%g0
	smul	%l7,%l5,%l4
p0_call_3_ho:
	ldsh	[%o4+0x000],%l5		! Mem[0000000010101400]
	retl
	sub	%l7,%l3,%l5
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
	.word	0xc8a2c65c,0x7a9556fd		! Init value for %l0
	.word	0xe18631ea,0x3b179922		! Init value for %l1
	.word	0x38d969ee,0x8c3e78c1		! Init value for %l2
	.word	0x2c8db541,0xb817a5b7		! Init value for %l3
	.word	0x44655dab,0xbc138eca		! Init value for %l4
	.word	0x8c5abbc4,0x9d112e98		! Init value for %l5
	.word	0x270cc396,0xaa7df4a2		! Init value for %l6
	.word	0xa944a22a,0xa87cf01c		! Init value for %l7
	.align	64
p0_init_freg:
	.word	0xcdb6e415,0x86ecb691		! Init value for %f0 
	.word	0x72cb07c4,0x7e6be361		! Init value for %f2 
	.word	0xf2970b29,0xd72c6636		! Init value for %f4 
	.word	0x6a2d677f,0x1272bbb4		! Init value for %f6 
	.word	0x00e4c303,0x82bbc904		! Init value for %f8 
	.word	0x102f1dce,0xe0515102		! Init value for %f10
	.word	0x384bbdc7,0x46e30a50		! Init value for %f12
	.word	0x7daf5b39,0x0b6e4abc		! Init value for %f14
	.word	0xf2dd3a05,0xa216fa6f		! Init value for %f16
	.word	0xac00e1f3,0xe6228505		! Init value for %f18
	.word	0xc2124aba,0xecf25158		! Init value for %f20
	.word	0x6540290c,0x59cfcbba		! Init value for %f22
	.word	0x2c4349d0,0x90b030b5		! Init value for %f24
	.word	0x807ed0b2,0xd3705e49		! Init value for %f26
	.word	0x0e0d8eba,0xa48dd81b		! Init value for %f28
	.word	0x62a94147,0x5b91dca3		! Init value for %f30
	.word	0xb51feea6,0xf1d8b515		! Init value for %f32
	.word	0xea3c25e2,0xd98dee35		! Init value for %f34
	.word	0x81206b55,0x3c146395		! Init value for %f36
	.word	0x7351cf59,0xbcc5b9d1		! Init value for %f38
	.word	0x027f2d2e,0xcae71048		! Init value for %f40
	.word	0xfafe169e,0xf6ea25ba		! Init value for %f42
	.word	0x5aeb430b,0xd98a6b6c		! Init value for %f44
	.word	0xa75e9b2e,0x9b892a9e		! Init value for %f46
	.word	0xda815e21,0x68da76ed
	.word	0x580ec14d,0xd995271f
	.word	0x3372d5ef,0x819bf7a4
	.word	0x4b12e304,0xf84c42d2
	.word	0x8addb29c,0x44535ad3
	.word	0xe2ae416b,0x17cd69b2
	.word	0xde0816c3,0x15a185e9
	.word	0x3042792e,0x12891f25
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
	.word	0x00000000,0x00000060
	.word	0x00000000,0x00000000
	.word	0x00000000,0x000000c5
	.word	0x00000000,0x0000008e
	.word	0x00000000,0x00000032
	.word	0x56784399,0x081b3cc2
	.word	0x00000000,0x000000e4
	.word	0x00000000,0x299b1b34
p0_expected_fp_regs:
	.word	0x8e82528a,0x8d809d3f
	.word	0x65000000,0x00000000
	.word	0xff515d23,0x7d046439
	.word	0xa7d63a71,0x08f0758e
	.word	0x6e88291a,0xdc4d22dc
	.word	0x4085bbb4,0x0e99896d
	.word	0xd79eaa4f,0x7d319079
	.word	0x3295405b,0x5306381e
	.word	0xf2dd3a05,0xa216fa6f
	.word	0xac00e1f3,0xe6228505
	.word	0xc2124aba,0xecf25158
	.word	0x9c8f4933,0x00000000
	.word	0x2c4349d0,0xffffffbf
	.word	0x36319772,0xdc559ab1
	.word	0x4ec37c32,0x8d0b1fa6
	.word	0x62a94147,0x5b91dca3
	.word	0x00000000,0x00000000		! %fsr = 0000000000000000
p0_local0_expect:
	.word	0x270cc396,0xaa7df4a2
	.word	0x2f0f971a,0xe7674c3a
	.word	0x9b00ffff,0xffffffff
	.word	0x4c936a62,0xd65f1fb8
	.word	0xfbae7cfb,0x348276f6
	.word	0xeee6cf39,0x421f84a5
	.word	0xe46105a8,0x2f444d31
	.word	0xf6b92c1f,0x5add13ff
p0_local0_sec_expect:
	.word	0xc5c056a4,0xef02e6d6
	.word	0x1c76458a,0xb6a7adc8
	.word	0xa305e745,0x9c65ab42
	.word	0x6d30208a,0xa2dfbafb
	.word	0xae3648f9,0xd5ed78c5
	.word	0xaa1c0702,0x46e9cc32
	.word	0x12e11569,0xc726b4af
	.word	0x780df98e,0x65da9021
p0_local1_expect:
	.word	0x00000000,0x0000009b
	.word	0x7d7396a7,0x38cec084
	.word	0xa456c0c5,0x299b1b34
	.word	0x5ddeaf81,0x18bfaf15
	.word	0x35a837c1,0x21469cad
	.word	0x27fa8324,0x85c11b4e
	.word	0x94db6063,0x98f15457
	.word	0x5c708d6c,0xfbfa3367
p0_local1_sec_expect:
	.word	0x00263bcf,0x03ff83f2
	.word	0x009a6a1a,0x53c45862
	.word	0xc1f9db3e,0x6b0e0469
	.word	0xa8290be6,0x420c1f39
	.word	0x8d29e95e,0xa93f028b
	.word	0x4728b546,0x4c956770
	.word	0x7d8646f7,0xd6b99c1b
	.word	0xeeb6519f,0x3d16ae4d
p0_local2_expect:
	.word	0x9b000000,0x00000000
	.word	0x61e36b7e,0xc407cb72
	.word	0x36662cd7,0x290b97f2
	.word	0xb4bb7212,0x7f672d6a
	.word	0x00000065,0x03c3e400
	.word	0x025151e0,0xce1d2f10
	.word	0x500ae346,0xc7bd4b38
	.word	0xbc4a6e0b,0x395baf7d
p0_local2_sec_expect:
	.word	0xb74fdef8,0x533476b8
	.word	0xbb6bee3e,0x97445201
	.word	0x459b0675,0xe3a29540
	.word	0x74ad7f20,0x59febc8f
	.word	0x0298d4a3,0x4bb00d6b
	.word	0x3b530839,0x1a894bbb
	.word	0x77dbf60a,0x5a552381
	.word	0x2d80707f,0xc61374c9
p0_local3_expect:
	.word	0x2e980b4b,0xe1a211e5
	.word	0x9c8f4933,0xde7a2145
	.word	0x60000032,0x00000065
	.word	0x57ada632,0xd33d07ad
	.word	0x42b7c51e,0x567aefe9
	.word	0xfde7d445,0xe5b63ad4
	.word	0x67f67c4b,0x628a8ffa
	.word	0x4457018a,0x49a13521
p0_local3_sec_expect:
	.word	0x68244485,0x225834de
	.word	0xa61f0b8d,0xb77f41a6
	.word	0xa61f0b8d,0x327cc34e
	.word	0xba094bfa,0x05f87d50
	.word	0xf0045567,0x5e63c9cf
	.word	0xd45d091e,0x6e3b35db
	.word	0x4a556e5a,0xb1c6d394
	.word	0xeb655e99,0xc8886c99
p0_local4_expect:
	.word	0x4b26d69c,0xb5abfc97
	.word	0xc050532d,0xd435e5d1
	.word	0x896cddbe,0x000000a1
	.word	0x1a26bfa2,0xf4303989
	.word	0x2ee92886,0x0ccffa15
	.word	0x457a40dc,0x9101be8f
	.word	0x1bc877c6,0x6dc68b1a
	.word	0x9b2d5bd9,0x0475e93d
p0_local4_sec_expect:
	.word	0xff82528a,0x8d809d3f
	.word	0x65000000,0x00000000
	.word	0xff515d23,0x7d046439
	.word	0xa7d63a71,0x08f0758e
	.word	0x6e88291a,0xdc4d22dc
	.word	0x4085bbb4,0x0e99896d
	.word	0xd79eaa4f,0x7d319079
	.word	0x3295405b,0x5306381e
p0_local5_expect:
	.word	0x69040e6b,0x3edbf9ca
	.word	0x00000000,0x4b26d69c
	.word	0x459b0675,0xcceb5997
	.word	0x9814cfa1,0x203bb7be
	.word	0xf11968a9,0xd075c093
	.word	0x6899a226,0xd7d48ed7
	.word	0xc012a9c8,0x0ae6addd
	.word	0x08a311a7,0xa26af9ea
p0_local5_sec_expect:
	.word	0x1a970f2f,0x65000000
	.word	0x6540290c,0x59cfcbba
	.word	0xad6cddbe,0x000000a1
	.word	0xec8ed638,0x5b81ff94
	.word	0xd28476fa,0x5e29603f
	.word	0x77bbd747,0xdfd9c035
	.word	0xcda10207,0x9eb7e114
	.word	0xf5048c4f,0xde951ac0
p0_local6_expect:
	.word	0x36319772,0xdc559ab1
	.word	0x4bca70e8,0xfef673d4
	.word	0xd869243e,0x025d1e36
	.word	0xf2e96ad6,0xc63548d7
	.word	0x898311f1,0x003aa191
	.word	0x1c90010d,0x7829c929
	.word	0x56784399,0x081b3cc2
	.word	0x986cf23b,0x5cbde131
p0_local6_sec_expect:
	.word	0xc585b453,0x821ddda6
	.word	0xbfffffff,0xffffffff
	.word	0x32000000,0x65000000
	.word	0x97d4dcdb,0x188ea9d6
	.word	0x0541f3d1,0xaab41fa5
	.word	0x7879e7ee,0xc5c13772
	.word	0xdccfca6b,0x20655970
	.word	0x17b7dab6,0x9e8bd374
share0_expect:
	.word	0xbf2f1224,0x4c9fc505
	.word	0xf7904354,0xd8cdde60
	.word	0x8d5594f0,0xc3f9600a
	.word	0xbf5f92fe,0x66a64c97
	.word	0xfd131108,0xa1e5b5cd
	.word	0xc512d7cb,0x580ea1bd
	.word	0xe04ef9d3,0x42dda8fd
	.word	0x2dc0128f,0x0020c033
share1_expect:
	.word	0x00659fab,0x083dd4a7
	.word	0xc9d3a2d8,0x3903f723
	.word	0xff7129cb,0xc316bb93
	.word	0xa7e2560e,0x74ac4f38
	.word	0x395a3868,0x9c38058c
	.word	0x50bab384,0xa02d766a
	.word	0x24739f37,0x27232bc0
	.word	0x973af999,0x4705b619
	.word	0xff8cb58d,0x33511624
	.word	0x72787d88,0xa4f3650e
	.word	0x814f6475,0x39f8267c
	.word	0xba4da96c,0x4371abd9
	.word	0xf10e1ff9,0xa61abbc8
	.word	0xc75911af,0x91725634
	.word	0xbc1ba79a,0x9c59fbec
	.word	0x7c71c288,0x37742b79
share2_expect:
	.word	0xba327086,0x49c74c3b
	.word	0x5ab50e25,0xbe532061
	.word	0xc2c65e8a,0x37f1849e
	.word	0xa2ed16b1,0xc4690dab
	.word	0xc387365d,0x5d122347
	.word	0xb0e0d946,0x2068f272
	.word	0x4b32a4cf,0xa2c93314
	.word	0xb3f6b384,0x8d958fad
share3_expect:
	.word	0xec71b3eb,0x45f630f8
	.word	0x62110b51,0xb24a77ab
	.word	0x76b07956,0xb0206773
	.word	0xff1ad882,0xe3a48331
	.word	0x86e8a912,0xceca17ac
	.word	0xdb1dacb3,0x0051ac18
	.word	0x9fc3647d,0xe1dd64fa
	.word	0x2cb5197a,0x4365766b
	.word	0xb25599b0,0xea6d1af6
	.word	0x3fe330dc,0xcc1049be
	.word	0x91c620ab,0xe31478b9
	.word	0x7198e10f,0x3c51a78d
	.word	0xf3cf6182,0xaf0a7c79
	.word	0xde6c6b97,0xc00e0b97
	.word	0x3d2ee95f,0x152fb475
	.word	0x09f84dba,0xefae053f
	.word	0xf6ff7a43,0xc7d78cac
	.word	0xdb765d16,0xefa25251
	.word	0x27b2d33b,0x0e6d3c6f
	.word	0x419c4054,0x0349b84c
	.word	0x458851b5,0xc5dd28eb
	.word	0x53ea1ff8,0x98e3c241
	.word	0xded6dfd5,0x41f01190
	.word	0x2f313817,0x7f719299
	.word	0x0df92be4,0xa1496c5a
	.word	0xfeebce50,0xdc8e94dd
	.word	0x3b1238d6,0xd4d15957
	.word	0x87ff9be9,0x63175901
	.word	0x6ea51409,0x70a9130b
	.word	0xf97317b0,0x0a5b91f8
	.word	0x1ccae184,0xd5a409b4
	.word	0x15109318,0x34910db6
	.word	0x422f6a33,0x9f789e58
	.word	0xe56334dd,0x97559dd0
	.word	0x0c086201,0xd32384de
	.word	0xd9a0ddaa,0x527ac0e9
	.word	0x3b33e5ad,0x30471055
	.word	0xe9f26bc1,0xcfa3d642
	.word	0x7b883e57,0xff9e7261
	.word	0x93d871c3,0xda36328c
	.word	0x2eafd388,0x47b2b4fb
	.word	0x83d9ae19,0xa5481619
	.word	0x49c9e352,0x0ca2fce5
	.word	0xe20a72d7,0x63e5f010
	.word	0xa7728603,0xd4df1f81
	.word	0x0feea754,0xbf90d00a
	.word	0x9d9bbbb9,0x09252b5a
	.word	0xc7352a62,0xb813c454
	.word	0x1449beeb,0xffef8910
	.word	0xdc2341ba,0x30b65040
	.word	0xf95339a1,0x5b35e6c8
	.word	0x3b134954,0x60da22dd
	.word	0xa8bcd23f,0xdea8687b
	.word	0xb4bd6662,0x76e0cbde
	.word	0x5a2d0a50,0x061866d8
	.word	0xf9e1563f,0x6127739e
	.word	0xae4ae6db,0x460b37f0
	.word	0xe73afdd8,0xd0b35c21
	.word	0x7a8769d5,0x5ccbc851
	.word	0xa16159e3,0x400d9fe0
	.word	0xc9f3040d,0xeec545d5
	.word	0x32b22fe1,0xf1a3494a
	.word	0x4d2041cb,0xfe171e45
	.word	0x5d625aef,0xfa689bb6
p0_invalidate_semaphore:
	.word	0

!	Data for check points

	.align	8
p0_check_pt_data_1:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x0261f30f,0x99277814		! Expected data for %l0
	.word	0x92fe2b00,0x2d5350c0		! Expected data for %l1
	.word	0x00000000,0x459b0675		! Expected data for %l2
	.word	0x00000000,0x0000009b		! Expected data for %l3
	.word	0x00000000,0x18bfaf15		! Expected data for %l4
	.word	0x00000000,0x00000065		! Expected data for %l5
	.word	0x00000000,0x2f0f971a		! Expected data for %l6
	.word	0xffffffff,0xcf3b261d		! Expected data for %l7
	.word	0x00000000,0x0000009b		! Expected data for %f0
	.word	0x6a2d677f,0x1272bbb4		! Expected data for %f6
	.word	0x36319772,0xdc559ab1		! Expected data for %f26
	.word	0xa6417fb7,0x8d0b1fa6		! Expected data for %f28
p0_check_pt_data_2:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x00000060		! Expected data for %l0
	.word	0x00000000,0x00000000		! Expected data for %l1
	.word	0x00000000,0x000000c5		! Expected data for %l2
	.word	0x00000000,0x0000008e		! Expected data for %l3
	.word	0x00000000,0x00000032		! Expected data for %l4
	.word	0x00000000,0x000000e4		! Expected data for %l6
	.word	0x00000000,0x299b1b34		! Expected data for %l7
	.word	0x8e82528a,0x8d809d3f		! Expected data for %f0
	.word	0x65000000,0x00000000		! Expected data for %f2
	.word	0xff515d23,0x7d046439		! Expected data for %f4
	.word	0xa7d63a71,0x08f0758e		! Expected data for %f6
	.word	0x6e88291a,0xdc4d22dc		! Expected data for %f8
	.word	0x4085bbb4,0x0e99896d		! Expected data for %f10
	.word	0xd79eaa4f,0x7d319079		! Expected data for %f12
	.word	0x3295405b,0x5306381e		! Expected data for %f14
	.word	0x9c8f4933,0x00000000		! Expected data for %f22
	.word	0x2c4349d0,0xffffffbf		! Expected data for %f24
	.word	0x4ec37c32,0x8d0b1fa6		! Expected data for %f28
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
	.word	0x9e8de5a7,0xe6b76a06
	.word	0x00000000,0x00000002
	.word	0x33f5d537,0xe8b92305
	.word	0x00000000,0x00000003
	.word	0xdaf95510,0x1c1be3e1
	.word	0x00000000,0x00000004
	.word	0x84ea54b0,0x4c49fead
	.word	0x00000000,0x00000005
	.word	0x509170ff,0xb6d143eb
	.word	0x00000000,0x00000006
	.word	0x28c7ae30,0x0e86e706
	.word	0x00000000,0x00000007
	.word	0x63edb5b0,0x343f3fd9
	.word	0x00000000,0x00000008
	.word	0x367605b8,0x60058708
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
	.word	0x38be13f8,0xffedf8ee,0xc70f971a,0xe7674c3a
	.word	0xfb86f952,0xbcecbbfe,0x4c936a62,0xd65f1fb8
	.word	0xfbae7cfb,0x348276f6,0xeee6cf39,0x421f84a5
	.word	0xe46105a8,0x2f444d31,0xf6b92c1f,0x5add1360
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
	.word	0xa12a8266,0xef02e6d6,0x1c76458a,0xb6a7adc8
	.word	0xa305e745,0x9c65ab42,0x6d30208a,0xa2dfbafb
	.word	0xae3648f9,0xd5ed78c5,0xaa1c0702,0x46e9cc32
	.word	0x12e11569,0xc726b4af,0x780df98e,0x65da9021
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
	.word	0xfdf29d7d,0x575742b5,0x7d7396a7,0x38cec084
	.word	0xa456c0c5,0x299b1b34,0x5ddeaf81,0x18bfaf15
	.word	0x35a837c1,0x21469cad,0x27fa8324,0x85c11b4e
	.word	0x94db6063,0x98f15457,0x5c708d6c,0xfbfa3367
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
	.word	0x1d263bcf,0x03ff83f2,0x519a6a1a,0x53c45862
	.word	0x4e88e97d,0xc134da0f,0xa8290be6,0x420c1f39
	.word	0x8d29e95e,0xa93f028b,0x4728b546,0x4c956770
	.word	0x7d8646f7,0xd6b99c1b,0xeeb6519f,0x3d16ae4d
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
	.word	0xc19667df,0x4b03ed24,0x4d863116,0x8b1531f9
	.word	0x896cddbe,0xede9f8d2,0x3e04196c,0x5dd9e1ec
	.word	0xc9095c72,0xa591c24c,0x0670aab0,0x4a804342
	.word	0xd29965a4,0xb91ee72b,0x7a0ae3c0,0x0f2d40d2
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
	.word	0x3b4fdef8,0x533476b8,0xbb6bee3e,0x97445201
	.word	0x608308f9,0xe3a29540,0x74ad7f20,0x59febc8f
	.word	0x0298d4a3,0x4bb00d6b,0x3b530839,0x1a894bbb
	.word	0x77dbf60a,0x5a552381,0x2d80707f,0xc61374c9
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
	.word	0x059f0b4b,0xe1a211e5,0x9c8f4933,0xde7a2145
	.word	0xaad0061a,0x32836052,0x57ada632,0xd33d07ad
	.word	0x42b7c51e,0x567aefe9,0xfde7d445,0xe5b63ad4
	.word	0x67f67c4b,0x628a8ffa,0x4457018a,0x49a13521
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
	.word	0x68244485,0x225834de,0xa61f0b8d,0xb77f41a6
	.word	0x59f94a08,0x10a5d8a2,0xba094bfa,0x05f87d50
	.word	0xf0045567,0x5e63c9cf,0xd45d091e,0x6e3b35db
	.word	0x4a556e5a,0xb1c6d394,0xeb655e99,0xc8886c99
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
	.word	0x4b26d69c,0xb5abfc97,0x5df64d3a,0xd435e5d1
	.word	0x63bf06b6,0xf963993d,0x1a26bfa2,0xf4303989
	.word	0x2ee92886,0x0ccffa15,0x457a40dc,0x9101be8f
	.word	0x1bc877c6,0x6dc68b1a,0x9b2d5bd9,0x0475e93d
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
	.word	0x8e82528a,0x8d809d3f,0x6c59a292,0x2ab17d67
	.word	0xe4515d23,0x7d046439,0xa7d63a71,0x08f0758e
	.word	0x6e88291a,0xdc4d22dc,0x4085bbb4,0x0e99896d
	.word	0xd79eaa4f,0x7d319079,0x3295405b,0x5306381e
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
	.word	0x69040e6b,0x3edbf9ca,0x327cc34e,0xd24453e6
	.word	0x459b0675,0xcceb5997,0x9814cfa1,0x203bb7be
	.word	0xf11968a9,0xd075c093,0x6899a226,0xd7d48ed7
	.word	0xc012a9c8,0x0ae6addd,0x08a311a7,0xa26af9ea
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
	.word	0xa575ef7a,0xd792a210,0x79e460e6,0x35d0709a
	.word	0x531627b6,0x4943e362,0xec8ed638,0x5b81ff94
	.word	0xd28476fa,0x5e29603f,0x77bbd747,0xdfd9c035
	.word	0xcda10207,0x9eb7e114,0xf5048c4f,0xde951ac0
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
	.word	0x36319772,0xdc559ab1,0x4bca70e8,0xfef673d4
	.word	0xd869243e,0x025d1e36,0xf2e96ad6,0xc63548d7
	.word	0x898311f1,0x003aa191,0x1c90010d,0x7829c929
	.word	0x56784399,0x081b3cc2,0x986cf23b,0x5cbde131
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
	.word	0x8e85b453,0x821ddda6,0x9917c26f,0xa16359da
	.word	0x83789e30,0xc3c34043,0x97d4dcdb,0x188ea9d6
	.word	0x0541f3d1,0xaab41fa5,0x7879e7ee,0xc5c13772
	.word	0xdccfca6b,0x20655970,0x17b7dab6,0x9e8bd374
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
	.word	0xbf2f1224,0x4c9fc505,0xf7904354,0xd8cdde60
	.word	0x8d5594f0,0xc3f9600a,0xbf5f92fe,0x66a64c97
	.word	0xfd131108,0xa1e5b5cd,0xc512d7cb,0x580ea1bd
	.word	0xe04ef9d3,0x42dda8fd,0x2dc0128f,0x0020c033
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
	.word	0xa69b9fab,0x083dd4a7,0xc9d3a2d8,0x3903f723
	.word	0xff7129cb,0xc316bb93,0xa7e2560e,0x74ac4f38
	.word	0x395a3868,0x9c38058c,0x50bab384,0xa02d766a
	.word	0x24739f37,0x27232bc0,0x973af999,0x4705b619
	.word	0x9b8cb58d,0x33511624,0x72787d88,0xa4f3650e
	.word	0x814f6475,0x39f8267c,0xba4da96c,0x4371abd9
	.word	0xf10e1ff9,0xa61abbc8,0xc75911af,0x91725634
	.word	0xbc1ba79a,0x9c59fbec,0x7c71c288,0x37742b79
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
	.word	0xba327086,0x49c74c3b,0x5ab50e25,0xbe532061
	.word	0xc2c65e8a,0x37f1849e,0xa2ed16b1,0xc4690dab
	.word	0xc387365d,0x5d122347,0xb0e0d946,0x2068f272
	.word	0x4b32a4cf,0xa2c93314,0xb3f6b384,0x8d958fad
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
	.word	0xec71b3eb,0x45f630f8,0x62110b51,0xb24a77ab
	.word	0x76b07956,0xb0206773,0xff1ad882,0xe3a48331
	.word	0x86e8a912,0xceca17ac,0xdb1dacb3,0x0051ac18
	.word	0x9fc3647d,0xe1dd64fa,0x2cb5197a,0x4365766b
	.word	0xb25599b0,0xea6d1af6,0x3fe330dc,0xcc1049be
	.word	0x91c620ab,0xe31478b9,0x7198e10f,0x3c51a78d
	.word	0xf3cf6182,0xaf0a7c79,0xde6c6b97,0xc00e0b97
	.word	0x3d2ee95f,0x152fb475,0x09f84dba,0xefae053f
	.word	0xf6747a43,0xc7d78cac,0xdb765d16,0xefa25251
	.word	0x27b2d33b,0x0e6d3c6f,0x419c4054,0x0349b84c
	.word	0x458851b5,0xc5dd28eb,0x53ea1ff8,0x98e3c241
	.word	0xded6dfd5,0x41f01190,0x2f313817,0x7f719299
	.word	0x0de12be4,0xa1496c5a,0xfeebce50,0xdc8e94dd
	.word	0x3b1238d6,0xd4d15957,0x87ff9be9,0x63175901
	.word	0x6ea51409,0x70a9130b,0xf97317b0,0x0a5b91f8
	.word	0x1ccae184,0xd5a409b4,0x15109318,0x34910db6
	.word	0x422f6a33,0x9f789e58,0xe56334dd,0x97559dd0
	.word	0x0c086201,0xd32384de,0xd9a0ddaa,0x527ac0e9
	.word	0x3b33e5ad,0x30471055,0xe9f26bc1,0xcfa3d642
	.word	0x7b883e57,0xff9e7261,0x93d871c3,0xda36328c
	.word	0x2eafd388,0x47b2b4fb,0x83d9ae19,0xa5481619
	.word	0x49c9e352,0x0ca2fce5,0xe20a72d7,0x63e5f010
	.word	0xa7728603,0xd4df1f81,0x0feea754,0xbf90d00a
	.word	0x9d9bbbb9,0x09252b5a,0xc7352a62,0xb813c454
	.word	0x1449beeb,0xffef8910,0xdc2341ba,0x30b65040
	.word	0xf95339a1,0x5b35e6c8,0x3b134954,0x60da22dd
	.word	0xa8bcd23f,0xdea8687b,0xb4bd6662,0x76e0cbde
	.word	0x5a2d0a50,0x061866d8,0xf9e1563f,0x6127739e
	.word	0xae4ae6db,0x460b37f0,0xe73afdd8,0xd0b35c21
	.word	0x7a8769d5,0x5ccbc851,0xa16159e3,0x400d9fe0
	.word	0xc9f3040d,0xeec545d5,0x32b22fe1,0xf1a3494a
	.word	0x4d2041cb,0xfe171e45,0x5d625aef,0xfa689bb6
share3_end:
