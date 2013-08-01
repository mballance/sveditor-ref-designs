/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: mpgen_50l.s
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
!	Seed = 310114742
!	Riesling can be on
!	1 Thread, 100 lines
!	mpgen   created on Dec 20, 2005 (16:35:03)
!	march10.rc.s created on Mar 10, 2009 (11:47:42)
!	RC file : vij_noretry.rc
!	cmd = /import/n2-tools/release/tools/mpgen/mpgen,1.051220 -rc vij_noretry.rc -o march10.rc -p 1 -l 100

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
!	%f0  = 46d986ed 65aad9ad 6d1b0540 6a008629
!	%f4  = 2d215561 e48a75d2 0ce8efb3 320e56f0
!	%f8  = 3b480edf 2730e728 6e14b756 e8c51102
!	%f12 = bf25cb9b 12656958 b894efc5 7aac48ac
	ldda	[%g1]ASI_BLK_P,%f0
	add	%g1,64,%g1
!	%f16 = 46769665 3405e07b 76e1e75b 4f5f92fd
!	%f20 = 966a655e 0081e4e4 d5541868 632743a6
!	%f24 = d0b1ed60 2e9fa30d eeac2e6e b28c6835
!	%f28 = aa08432a 204bcd13 d7d98c9b 7ea97ac3
	ldda	[%g1]ASI_BLK_P,%f16
	add	%g1,64,%g1
!	%f32 = 56ba219a 4afced25 9ca631e2 76ebcbb1
!	%f36 = 368f4a71 9e8a0511 a3fe74e9 b1efc581
!	%f40 = bf902166 a8a04d40 c238ab7e 1efb18be
!	%f44 = ef1eeb63 ffb2c3f8 6c859b12 f0e264fe
	ldda	[%g1]ASI_BLK_P,%f32

!	Set up the Graphics Status Register

	setx	0x5391068f00000054,%g7,%g1 ! GSR scale = 10, align = 4
	wr	%g1,%g0,%gsr		! GSR = 5391068f00000054
	wr	%g0,%y			! Clear Y register
	xorcc	%g0,%g0,%g3		! init %g3 and set flags
	membar	#Sync			! Force the block loads to complete

!	Start of Random Code for processor 0

p0_label_1:
!	%l5 = 7de99eb3f202541c, Mem[0000000010041433] = 0fbee803, %asi = 80
	stba	%l5,[%i1+0x033]%asi	! Mem[0000000010041430] = 0fbee81c
!	%l3 = 2cdef4da10dcb46b, Mem[0000000010081410] = f998ab12
	stha	%l3,[%i2+%o5]0x80	! Mem[0000000010081410] = b46bab12
!	Mem[0000000030181410] = 432ec1e7, %l4 = cb6de6e41f9e3056
	ldswa	[%i6+%o5]0x81,%l4	! %l4 = 00000000432ec1e7
!	%l2 = a06bd33e69d112bd, Mem[00000000300c1400] = 75a3fcfdf2ab5bf3
	stxa	%l2,[%i3+%g0]0x89	! Mem[00000000300c1400] = a06bd33e69d112bd
!	%f26 = eeac2e6e b28c6835, Mem[00000000100c1400] = c5cad261 ebb3c401
	stda	%f26,[%i3+%g0]0x88	! Mem[00000000100c1400] = eeac2e6e b28c6835
!	Mem[0000000010181430] = b11c7e26, %l0 = 90038704079ea279
	lduh	[%i6+0x030],%l0		! %l0 = 000000000000b11c
!	Mem[0000000010081410] = 12ab6bb4, %l5 = 7de99eb3f202541c
	ldstuba	[%i2+%o5]0x88,%l5	! %l5 = 000000b4000000ff
!	Mem[0000000010041400] = 85e1096d152ac917, %f14 = b894efc5 7aac48ac
	ldda	[%i1+%g0]0x80,%f14	! %f14 = 85e1096d 152ac917
!	Mem[0000000030041400] = 7a5f8ff3, %l2 = a06bd33e69d112bd
	ldswa	[%i1+%g0]0x89,%l2	! %l2 = 000000007a5f8ff3
!	Starting 10 instruction Store Burst
!	%l4 = 432ec1e7, %l5 = 000000b4, Mem[00000000100c1400] = 35688cb2 6e2eacee
	stda	%l4,[%i3+%g0]0x80	! Mem[00000000100c1400] = 432ec1e7 000000b4

p0_label_2:
!	%l5 = 00000000000000b4, Mem[0000000010181400] = f367e945
	stwa	%l5,[%i6+%g0]0x80	! Mem[0000000010181400] = 000000b4
!	%l3 = 2cdef4da10dcb46b, Mem[0000000030041400] = 7a5f8ff3
	stwa	%l3,[%i1+%g0]0x89	! Mem[0000000030041400] = 10dcb46b
!	Mem[0000000010101428] = c45dcea7774773de, %l5 = 00000000000000b4, %l7 = 113ac469eb3feedc
	add	%i4,0x28,%g1
	casxa	[%g1]0x80,%l5,%l7	! %l7 = c45dcea7774773de
!	%f18 = 76e1e75b 4f5f92fd, Mem[00000000100c1400] = 432ec1e7 000000b4
	stda	%f18,[%i3+%g0]0x80	! Mem[00000000100c1400] = 76e1e75b 4f5f92fd
!	Mem[00000000201c0000] = e1fe69d9, %l6 = 4732102e1de20886
	ldstub	[%o0+%g0],%l6		! %l6 = 000000e1000000ff
!	%l2 = 7a5f8ff3, %l3 = 10dcb46b, Mem[0000000010101400] = b7e9daec 666c1f30
	stda	%l2,[%i4+%g0]0x88	! Mem[0000000010101400] = 7a5f8ff3 10dcb46b
!	Mem[0000000030081410] = 502dc3cc, %l7 = c45dcea7774773de
	ldstuba	[%i2+%o5]0x81,%l7	! %l7 = 00000050000000ff
!	Mem[0000000010001434] = b3973a77, %l2 = 000000007a5f8ff3
	swap	[%i0+0x034],%l2		! %l2 = 00000000b3973a77
!	%l2 = b3973a77, %l3 = 10dcb46b, Mem[0000000010081410] = ff6bab12 0ece9b64
	stda	%l2,[%i2+%o5]0x80	! Mem[0000000010081410] = b3973a77 10dcb46b
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = 85e1096d, %l6 = 00000000000000e1
	lduwa	[%i1+%g0]0x80,%l6	! %l6 = 0000000085e1096d

p0_label_3:
!	Mem[0000000030141400] = 9642a300, %l6 = 0000000085e1096d
	lduha	[%i5+%g0]0x81,%l6	! %l6 = 0000000000009642
!	Mem[0000000030001400] = 0a2aca37, %f11 = e8c51102
	lda	[%i0+%g0]0x89,%f11	! %f11 = 0a2aca37
!	Mem[0000000030001400] = 3eddc3500a2aca37, %f16 = 46769665 3405e07b
	ldda	[%i0+%g0]0x89,%f16	! %f16 = 3eddc350 0a2aca37
!	Mem[0000000030141408] = 17de8ce2, %l6 = 0000000000009642
	ldsba	[%i5+%o4]0x81,%l6	! %l6 = 0000000000000017
!	Mem[0000000021800100] = 61446c5c, %l1 = a13b0019c4d6b61e
	ldsh	[%o3+0x100],%l1		! %l1 = 0000000000006144
!	Mem[0000000030041410] = 5a672f3ff78e577b, %l3 = 2cdef4da10dcb46b
	ldxa	[%i1+%o5]0x89,%l3	! %l3 = 5a672f3ff78e577b
!	Mem[0000000010101404] = 6bb4dc10, %f19 = 4f5f92fd
	lda	[%i4+0x004]%asi,%f19	! %f19 = 6bb4dc10
!	Mem[0000000030081408] = 48084eb1, %l2 = 00000000b3973a77
	ldsba	[%i2+%o4]0x81,%l2	! %l2 = 0000000000000048
	membar	#Sync			! Added by membar checker (1)
!	Mem[0000000010001400] = 231586c6 339ac92a 5c9c8482 4b531e1e
!	Mem[0000000010001410] = 32a9253a 0b9aa61a 0b01fcb8 299be26b
!	Mem[0000000010001420] = 49112c16 6d458df1 c4ae7e75 09f028c4
!	Mem[0000000010001430] = 7d70413d 7a5f8ff3 8e7f9390 83ee8ff2
	ldda	[%i0]ASI_BLK_P,%f16	! Block Load from 0000000010001400
!	Starting 10 instruction Store Burst
!	%l5 = 00000000000000b4, Mem[0000000010141408] = c6d5a36e
	stwa	%l5,[%i5+%o4]0x80	! Mem[0000000010141408] = 000000b4

p0_label_4:
!	Mem[0000000030101410] = d9667055, %l2 = 0000000000000048
	ldstuba	[%i4+%o5]0x81,%l2	! %l2 = 000000d9000000ff
!	%f13 = 12656958, Mem[00000000300c1400] = 69d112bd
	sta	%f13,[%i3+%g0]0x89	! Mem[00000000300c1400] = 12656958
!	%l1 = 0000000000006144, Mem[0000000010141408] = b4000000
	stba	%l1,[%i5+%o4]0x88	! Mem[0000000010141408] = b4000044
!	Mem[0000000010101418] = 5e722fe5, %l7 = 0000000000000050
	swap	[%i4+0x018],%l7		! %l7 = 000000005e722fe5
!	Mem[0000000030141400] = 9642a300, %l1 = 0000000000006144
	swapa	[%i5+%g0]0x81,%l1	! %l1 = 000000009642a300
!	%l4 = 00000000432ec1e7, Mem[0000000030101410] = ff6670552d1bd66d
	stxa	%l4,[%i4+%o5]0x81	! Mem[0000000030101410] = 00000000432ec1e7
!	Mem[0000000010081400] = 1755a3cc, %l4 = 00000000432ec1e7
	ldstuba	[%i2+%g0]0x80,%l4	! %l4 = 00000017000000ff
!	Mem[0000000010101410] = a527a810, %l3 = 5a672f3ff78e577b
	ldstuba	[%i4+%o5]0x88,%l3	! %l3 = 00000010000000ff
!	%l6 = 0000000000000017, Mem[0000000010081408] = 8eda0999cd08ef10
	stxa	%l6,[%i2+%o4]0x88	! Mem[0000000010081408] = 0000000000000017
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = 666f34d7, %l5 = 00000000000000b4
	ldswa	[%i3+%o4]0x89,%l5	! %l5 = 00000000666f34d7

p0_label_5:
!	Mem[0000000010181410] = f2d7359586031645, %f10 = 6e14b756 0a2aca37
	ldda	[%i6+%o5]0x88,%f10	! %f10 = f2d73595 86031645
!	Mem[0000000010141410] = 22c8beef, %f15 = 152ac917
	lda	[%i5+%o5]0x80,%f15	! %f15 = 22c8beef
!	Mem[0000000010001408] = 1e1e534b82849c5c, %f8  = 3b480edf 2730e728
	ldda	[%i0+%o4]0x88,%f8 	! %f8  = 1e1e534b 82849c5c
!	Mem[0000000030041408] = ac26d902, %l2 = 00000000000000d9
	lduba	[%i1+%o4]0x81,%l2	! %l2 = 00000000000000ac
!	Mem[0000000010141400] = 004a87c6, %l3 = 0000000000000010
	lduba	[%i5+%g0]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000010181438] = 278fac79, %l5 = 00000000666f34d7
	lduh	[%i6+0x03a],%l5		! %l5 = 000000000000ac79
!	Mem[0000000030081410] = ccc32dff, %l0 = 000000000000b11c
	lduha	[%i2+%o5]0x89,%l0	! %l0 = 0000000000002dff
!	Mem[0000000030001400] = 37ca2a0a50c3dd3e, %f12 = bf25cb9b 12656958
	ldda	[%i0+%g0]0x81,%f12	! %f12 = 37ca2a0a 50c3dd3e
!	Mem[0000000030181400] = f46f918a, %l3 = 0000000000000000
	ldsha	[%i6+%g0]0x81,%l3	! %l3 = fffffffffffff46f
!	Starting 10 instruction Store Burst
!	Mem[0000000010101414] = 9d562c6e, %l0 = 0000000000002dff
	ldsh	[%i4+0x016],%l0		! %l0 = 0000000000002c6e

!	Check Point 1 for processor 0

	set	p0_check_pt_data_1,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 0000000000002c6e
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 000000009642a300
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 00000000000000ac
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = fffffffffffff46f
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 0000000000000017
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 000000000000ac79
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 0000000000000017
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 000000005e722fe5
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f8,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f8 = 1e1e534b 82849c5c
	bne	%xcc,p0_freg_check_fail
	mov	0xf08,%g1
	ldx	[%g4+0x50],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = f2d73595 86031645
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x58],%g3
	std	%f12,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f12 = 37ca2a0a 50c3dd3e
	bne	%xcc,p0_freg_check_fail
	mov	0xf12,%g1
	ldx	[%g4+0x60],%g3
	std	%f14,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f14 = 85e1096d 22c8beef
	bne	%xcc,p0_freg_check_fail
	mov	0xf14,%g1
	ldx	[%g4+0x68],%g3
	std	%f16,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f16 = 231586c6 339ac92a
	bne	%xcc,p0_freg_check_fail
	mov	0xf16,%g1
	ldx	[%g4+0x70],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = 5c9c8482 4b531e1e
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1
	ldx	[%g4+0x78],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = 32a9253a 0b9aa61a
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1
	ldx	[%g4+0x80],%g3
	std	%f22,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f22 = 0b01fcb8 299be26b
	bne	%xcc,p0_freg_check_fail
	mov	0xf22,%g1
	ldx	[%g4+0x88],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = 49112c16 6d458df1
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1
	ldx	[%g4+0x90],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = c4ae7e75 09f028c4
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1
	ldx	[%g4+0x98],%g3
	std	%f28,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f28 = 7d70413d 7a5f8ff3
	bne	%xcc,p0_freg_check_fail
	mov	0xf28,%g1
	ldx	[%g4+0xa0],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = 8e7f9390 83ee8ff2
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 1 completed


p0_label_6:
!	%f21 = 0b9aa61a, Mem[0000000030041400] = 6bb4dc10
	sta	%f21,[%i1+%g0]0x81	! Mem[0000000030041400] = 0b9aa61a
!	%l0 = 00002c6e, %l1 = 9642a300, Mem[0000000030101410] = 00000000 432ec1e7
	stda	%l0,[%i4+%o5]0x81	! Mem[0000000030101410] = 00002c6e 9642a300
!	%f20 = 32a9253a 0b9aa61a, %l5 = 000000000000ac79
!	Mem[0000000030041400] = 0b9aa61afb9d4c66
	stda	%f20,[%i1+%l5]ASI_PST8_SL ! Mem[0000000030041400] = 1a9aa60b3a25a966
!	%f2  = 6d1b0540, Mem[0000000030041408] = ac26d902
	sta	%f2 ,[%i1+%o4]0x81	! Mem[0000000030041408] = 6d1b0540
!	Code Fragment 3
p0_fragment_1:
!	%l0 = 0000000000002c6e
	setx	0xcfb720efe3c9c9e1,%g7,%l0 ! %l0 = cfb720efe3c9c9e1
!	%l1 = 000000009642a300
	setx	0x785386af8e15c67d,%g7,%l1 ! %l1 = 785386af8e15c67d
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = cfb720efe3c9c9e1
	setx	0x5eeb45981d1387b2,%g7,%l0 ! %l0 = 5eeb45981d1387b2
!	%l1 = 785386af8e15c67d
	setx	0x9c04b838473e0750,%g7,%l1 ! %l1 = 9c04b838473e0750
!	Mem[0000000010001408] = 82849c5c, %l6 = 0000000000000017
	swapa	[%i0+%o4]0x88,%l6	! %l6 = 0000000082849c5c
!	Mem[0000000030181408] = e1d5d1aa, %l0 = 5eeb45981d1387b2
	ldstuba	[%i6+%o4]0x81,%l0	! %l0 = 000000e1000000ff
!	%l6 = 0000000082849c5c, Mem[00000000300c1410] = 0696c309
	stba	%l6,[%i3+%o5]0x89	! Mem[00000000300c1410] = 0696c35c
!	Mem[0000000010001408] = 17000000, %l3 = fffffffffffff46f
	swapa	[%i0+%o4]0x80,%l3	! %l3 = 0000000017000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010081430] = 5e08a86b, %l3 = 0000000017000000
	ldsh	[%i2+0x030],%l3		! %l3 = 0000000000005e08

p0_label_7:
!	Mem[0000000010101428] = c45dcea7, %l7 = 000000005e722fe5
	ldsha	[%i4+0x028]%asi,%l7	! %l7 = ffffffffffffc45d
!	Mem[0000000010181400] = 24d13d2f b4000000, %l4 = 00000017, %l5 = 0000ac79
	ldda	[%i6+%g0]0x88,%l4	! %l4 = 00000000b4000000 0000000024d13d2f
!	Mem[00000000100c1400] = 76e1e75b, %l5 = 0000000024d13d2f
	lduwa	[%i3+%g0]0x80,%l5	! %l5 = 0000000076e1e75b
!	Mem[0000000010101408] = bd6f5044, %l0 = 00000000000000e1
	ldsba	[%i4+%o4]0x88,%l0	! %l0 = 0000000000000044
!	Mem[00000000201c0000] = fffe69d9, %l2 = 00000000000000ac
	lduh	[%o0+%g0],%l2		! %l2 = 000000000000fffe
!	Mem[0000000010181400] = 000000b4, %l1 = 9c04b838473e0750
	lduha	[%i6+%g0]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000021800000] = 14f37898, %l4 = 00000000b4000000
	lduh	[%o3+%g0],%l4		! %l4 = 00000000000014f3
!	Mem[0000000021800000] = 14f37898, %l6 = 0000000082849c5c
	ldsha	[%o3+0x000]%asi,%l6	! %l6 = 00000000000014f3
!	Mem[0000000010041404] = 152ac917, %f0  = 46d986ed
	ld	[%i1+0x004],%f0 	! %f0 = 152ac917
!	Starting 10 instruction Store Burst
!	%f20 = 32a9253a 0b9aa61a, %l2 = 000000000000fffe
!	Mem[0000000030101438] = 30b11ca67ab78673
	add	%i4,0x038,%g1
	stda	%f20,[%g1+%l2]ASI_PST16_S ! Mem[0000000030101438] = 32a9253a0b9a8673

p0_label_8:
!	Mem[000000001014143c] = 82898836, %l2 = 0000fffe, %l3 = 00005e08
	add	%i5,0x3c,%g1
	casa	[%g1]0x80,%l2,%l3	! %l3 = 0000000082898836
!	%f4  = 2d215561 e48a75d2, Mem[0000000030001410] = 22d802a4 2eca83fa
	stda	%f4 ,[%i0+%o5]0x89	! Mem[0000000030001410] = 2d215561 e48a75d2
	membar	#Sync			! Added by membar checker (2)
!	%f3  = 6a008629, Mem[0000000010001400] = 231586c6
	sta	%f3 ,[%i0+%g0]0x80	! Mem[0000000010001400] = 6a008629
!	%l0 = 0000000000000044, Mem[0000000010141428] = 4e222777, %asi = 80
	stwa	%l0,[%i5+0x028]%asi	! Mem[0000000010141428] = 00000044
!	Code Fragment 3
p0_fragment_2:
!	%l0 = 0000000000000044
	setx	0x70937cc7a2bbda1e,%g7,%l0 ! %l0 = 70937cc7a2bbda1e
!	%l1 = 0000000000000000
	setx	0xf56327104a02c35b,%g7,%l1 ! %l1 = f56327104a02c35b
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 70937cc7a2bbda1e
	setx	0x7edfcdc83cde38b9,%g7,%l0 ! %l0 = 7edfcdc83cde38b9
!	%l1 = f56327104a02c35b
	setx	0xe07dbbd7db705930,%g7,%l1 ! %l1 = e07dbbd7db705930
!	Mem[00000000201c0001] = fffe69d9, %l1 = e07dbbd7db705930
	ldstuba	[%o0+0x001]%asi,%l1	! %l1 = 000000fe000000ff
!	%l4 = 00000000000014f3, Mem[0000000010001410] = 3a25a932
	stwa	%l4,[%i0+%o5]0x88	! Mem[0000000010001410] = 000014f3
!	%l5 = 0000000076e1e75b, Mem[0000000030141400] = 00006144
	stwa	%l5,[%i5+%g0]0x81	! Mem[0000000030141400] = 76e1e75b
!	%l0 = 7edfcdc83cde38b9, Mem[0000000010041400] = 6d09e185
	stba	%l0,[%i1+%g0]0x88	! Mem[0000000010041400] = 6d09e1b9
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = 6ff4ffff, %l5 = 0000000076e1e75b
	lduha	[%i0+%o4]0x88,%l5	! %l5 = 000000000000ffff

p0_label_9:
!	Mem[0000000010101410] = ffa827a5, %l1 = 00000000000000fe
	ldsba	[%i4+%o5]0x80,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010081410] = b3973a77 10dcb46b, %l0 = 3cde38b9, %l1 = ffffffff
	ldda	[%i2+%o5]0x80,%l0	! %l0 = 00000000b3973a77 0000000010dcb46b
!	Mem[0000000010001410] = 000014f3, %l4 = 00000000000014f3
	lduba	[%i0+%o5]0x88,%l4	! %l4 = 00000000000000f3
!	Mem[0000000010141410] = 22c8beef, %l1 = 0000000010dcb46b
	lduwa	[%i5+%o5]0x80,%l1	! %l1 = 0000000022c8beef
!	Mem[0000000010141410] = 22c8beef, %l1 = 0000000022c8beef
	ldswa	[%i5+%o5]0x80,%l1	! %l1 = 0000000022c8beef
!	Mem[0000000010081410] = b3973a77, %l2 = 000000000000fffe
	ldsba	[%i2+%o5]0x80,%l2	! %l2 = ffffffffffffffb3
!	Mem[0000000030041408] = 40051b6d, %l5 = 000000000000ffff
	ldsha	[%i1+%o4]0x89,%l5	! %l5 = 0000000000001b6d
	membar	#Sync			! Added by membar checker (3)
!	Mem[0000000010141400] = 004a87c6 fb68e412 440000b4 a0afd419
!	Mem[0000000010141410] = 22c8beef da6462fd f9e1222a 9947b531
!	Mem[0000000010141420] = 99351b27 477019ea 00000044 4bcc71e8
!	Mem[0000000010141430] = 83891f01 1d5b2eff fa15ddba 82898836
	ldda	[%i5]ASI_BLK_AIUPL,%f0	! Block Load from 0000000010141400
!	Mem[0000000010141408] = 440000b4, %l3 = 0000000082898836
	lduwa	[%i5+%o4]0x80,%l3	! %l3 = 00000000440000b4
!	Starting 10 instruction Store Burst
!	%f20 = 32a9253a 0b9aa61a, Mem[0000000030001410] = e48a75d2 2d215561
	stda	%f20,[%i0+%o5]0x89	! Mem[0000000030001410] = 32a9253a 0b9aa61a

p0_label_10:
!	%f28 = 7d70413d 7a5f8ff3, Mem[0000000030081400] = d81d58ac 7643e5df
	stda	%f28,[%i2+%g0]0x89	! Mem[0000000030081400] = 7d70413d 7a5f8ff3
!	Mem[0000000030101408] = 47e46368, %l7 = ffffffffffffc45d
	ldstuba	[%i4+%o4]0x89,%l7	! %l7 = 00000068000000ff
!	Mem[0000000010101400] = f38f5f7a, %l3 = 00000000440000b4
	ldstuba	[%i4+%g0]0x80,%l3	! %l3 = 000000f3000000ff
!	Mem[00000000100c1407] = 4f5f92fd, %l4 = 00000000000000f3
	ldstub	[%i3+0x007],%l4		! %l4 = 000000fd000000ff
!	Mem[0000000030101410] = 6e2c0000, %l4 = 00000000000000fd
	ldstuba	[%i4+%o5]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010041418] = 88eda069, %l7 = 00000068, %l1 = 22c8beef
	add	%i1,0x18,%g1
	casa	[%g1]0x80,%l7,%l1	! %l1 = 0000000088eda069
!	%f20 = 32a9253a, Mem[000000001008141c] = 86a69852
	st	%f20,[%i2+0x01c]	! Mem[000000001008141c] = 32a9253a
!	%l4 = 0000000000000000, Mem[00000000218001c0] = cf7bdb4c
	sth	%l4,[%o3+0x1c0]		! Mem[00000000218001c0] = 0000db4c
!	Mem[0000000030001408] = e3731afc, %l5 = 0000000000001b6d
	swapa	[%i0+%o4]0x81,%l5	! %l5 = 00000000e3731afc
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = ff55a3cc, %l4 = 0000000000000000
	lduha	[%i2+%g0]0x80,%l4	! %l4 = 000000000000ff55

!	Check Point 2 for processor 0

	set	p0_check_pt_data_2,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 00000000b3973a77
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 0000000088eda069
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = ffffffffffffffb3
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 00000000000000f3
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 000000000000ff55
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 00000000e3731afc
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 00000000000014f3
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 0000000000000068
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = 12e468fb c6874a00
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x50],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = 19d4afa0 b4000044
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x58],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = fd6264da efbec822
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x60],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 31b54799 2a22e1f9
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x68],%g3
	std	%f8,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f8 = ea197047 271b3599
	bne	%xcc,p0_freg_check_fail
	mov	0xf08,%g1
	ldx	[%g4+0x70],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = e871cc4b 44000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x78],%g3
	std	%f12,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f12 = ff2e5b1d 011f8983
	bne	%xcc,p0_freg_check_fail
	mov	0xf12,%g1
	ldx	[%g4+0x80],%g3
	std	%f14,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f14 = 36888982 badd15fa
	bne	%xcc,p0_freg_check_fail
	mov	0xf14,%g1

!	Check Point 2 completed


	ba,a	p0_not_taken_0_end
p0_not_taken_0:
!	The following code should not be executed
	nop
	nop
	nop
	stda	%l2,[%i5+0x038]%asi
	stxa	%l2,[%i0+0x028]%asi
	ldd	[%i3+0x000],%l0
	sta	%l6,[%i1+0x010]%asi
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
	ldda	[%i4+%o5]ASI_AS_IF_USER_PRIMARY,%l6	! Mem[0000000010101410]
	stwa	%l3,[%i2+%g0]ASI_AS_IF_USER_PRIMARY	! Mem[0000000010081400]
	ldswa	[%i0+%g0]ASI_AS_IF_USER_PRIMARY,%l0	! Mem[0000000010001400]
	sub	%l6,0x166,%l3
	ldxa	[%i5+%o5]ASI_AS_IF_USER_PRIMARY,%l3	! Mem[0000000010141410]
	done

p0_trap1o:
	ldda	[%o4+%i5]ASI_AS_IF_USER_PRIMARY,%l6	! Mem[0000000010101410]
	stwa	%l3,[%o2+%g0]ASI_AS_IF_USER_PRIMARY	! Mem[0000000010081400]
	ldswa	[%o0+%g0]ASI_AS_IF_USER_PRIMARY,%l0	! Mem[0000000010001400]
	sub	%l6,0x166,%l3
	ldxa	[%o5+%i5]ASI_AS_IF_USER_PRIMARY,%l3	! Mem[0000000010141410]
	done


p0_trap2e:
	udivx	%l6,%l4,%l0
	ldswa	[%i1+%g0]ASI_AS_IF_USER_PRIMARY,%l1	! Mem[0000000010041400]
	stxa	%l1,[%i5+%g0]ASI_AS_IF_USER_PRIMARY	! Mem[0000000010141400]
	andn	%l7,0x991,%l4
	add	%l1,%l6,%l6
	sdivx	%l6,%l6,%l5
	done

p0_trap2o:
	udivx	%l6,%l4,%l0
	ldswa	[%o1+%g0]ASI_AS_IF_USER_PRIMARY,%l1	! Mem[0000000010041400]
	stxa	%l1,[%o5+%g0]ASI_AS_IF_USER_PRIMARY	! Mem[0000000010141400]
	andn	%l7,0x991,%l4
	add	%l1,%l6,%l6
	sdivx	%l6,%l6,%l5
	done


p0_trap3e:
	orn	%l6,%l4,%l7
	orn	%l2,-0x7d8,%l7
	add	%l7,-0x823,%l2
	andn	%l3,-0xf33,%l4
	done

p0_trap3o:
	orn	%l6,%l4,%l7
	orn	%l2,-0x7d8,%l7
	add	%l7,-0x823,%l2
	andn	%l3,-0xf33,%l4
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
	ldx	[%g1+0x000],%l0		! %l0 = 90038704079ea279
	ldx	[%g1+0x008],%l1		! %l1 = a13b0019c4d6b61e
	ldx	[%g1+0x010],%l2		! %l2 = a06bd33e69d112bd
	ldx	[%g1+0x018],%l3		! %l3 = 2cdef4da10dcb46b
	ldx	[%g1+0x020],%l4		! %l4 = cb6de6e41f9e3056
	ldx	[%g1+0x028],%l5		! %l5 = 7de99eb3f202541c
	ldx	[%g1+0x030],%l6		! %l6 = 4732102e1de20886
	ldx	[%g1+0x038],%l7		! %l7 = 113ac469eb3feedc

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
	ldd	[%i0+0x010],%l2		! Mem[0000000010001410]
	subc	%l2,%l5,%l3
	jmpl	%o7,%g0
	st	%f5 ,[%i5+0x014]	! Mem[0000000010141414]
p0_near_0_he:
	ldstub	[%i0+0x009],%l0		! Mem[0000000010001409]
	umul	%l4,%l6,%l4
	jmpl	%o7,%g0
	stx	%l6,[%i3+0x000]		! Mem[00000000100c1400]
near0_b2b_h:
	sub	%l2,%l5,%l3
	subc	%l0,0x0a1,%l2
	nop
	and	%l0,%l5,%l0
	or	%l0,%l6,%l0
	sub	%l2,0x494,%l7
	xor	%l6,0x82b,%l7
	jmpl	%o7,%g0
	or	%l3,%l0,%l6
near0_b2b_l:
	xnor	%l4,-0x058,%l2
	xnor	%l7,-0x625,%l3
	udivx	%l5,-0xb6f,%l4
	or	%l3,%l3,%l2
	udivx	%l3,%l4,%l1
	udivx	%l4,-0x868,%l1
	umul	%l4,%l5,%l5
	jmpl	%o7,%g0
	sdivx	%l3,0xde2,%l5
user_near0_end:
	.seg	"text"
	.align	0x2000
user_near1_start:
p0_near_1_le:
	std	%l0,[%i6+0x030]		! Mem[0000000010181430]
	stx	%l4,[%i2+0x028]		! Mem[0000000010081428]
	mulx	%l2,-0x6ad,%l6
	or	%l4,%l4,%l4
	xnor	%l0,%l6,%l0
	jmpl	%o7,%g0
	lduh	[%i0+0x01c],%l1		! Mem[000000001000141c]
p0_near_1_he:
	xnor	%l6,%l0,%l1
	mulx	%l3,-0x848,%l6
	sub	%l7,-0x558,%l2
	jmpl	%o7,%g0
	sdivx	%l1,%l2,%l2
near1_b2b_h:
	jmpl	%o7,%g0
	nop
	jmpl	%o7,%g0
	nop
near1_b2b_l:
	jmpl	%o7,%g0
	xor	%l5,-0x5da,%l4
	jmpl	%o7,%g0
	nop
user_near1_end:
	.seg	"text"
	.align	0x2000
user_near2_start:
p0_near_2_le:
	jmpl	%o7,%g0
	add	%l0,%l2,%l6
	jmpl	%o7,%g0
	nop
p0_near_2_he:
	lduw	[%i5+0x03c],%l2		! Mem[000000001014143c]
	andn	%l5,%l5,%l7
	mulx	%l4,0xb5d,%l5
	ld	[%i1+0x014],%f28	! Mem[0000000010041414]
	sdivx	%l5,0x97d,%l0
	or	%l0,-0xe9f,%l0
	jmpl	%o7,%g0
	udivx	%l5,%l3,%l4
near2_b2b_h:
	or	%l1,%l0,%l6
	mulx	%l4,0xf84,%l6
	nop
	orn	%l3,0x81f,%l5
	sdivx	%l7,0x75a,%l4
	sub	%l7,%l5,%l4
	jmpl	%o7,%g0
	umul	%l2,%l4,%l5
near2_b2b_l:
	smul	%l4,0x553,%l2
	sdivx	%l3,-0x891,%l3
	mulx	%l4,%l6,%l7
	orn	%l6,-0x0bd,%l4
	subc	%l2,0x5ed,%l7
	sub	%l5,%l3,%l1
	jmpl	%o7,%g0
	udivx	%l4,-0xab2,%l6
user_near2_end:
	.seg	"text"
	.align	0x2000
user_near3_start:
p0_near_3_le:
	addc	%l4,-0xc3c,%l5
	swap	[%i1+0x024],%l6		! Mem[0000000010041424]
	stw	%l0,[%i5+0x01c]		! Mem[000000001014141c]
	jmpl	%o7,%g0
	subc	%l6,0xb50,%l6
p0_near_3_he:
	ldub	[%i0+0x02f],%l6		! Mem[000000001000142f]
	sub	%l3,%l7,%l5
	std	%l6,[%i5+0x000]		! Mem[0000000010141400]
	and	%l1,0xcc4,%l4
	jmpl	%o7,%g0
	ldd	[%i3+0x020],%l2		! Mem[00000000100c1420]
near3_b2b_h:
	add	%l4,%l2,%l1
	nop
	add	%l4,%l4,%l7
	xor	%l2,0x507,%l6
	or	%l0,-0x447,%l4
	andn	%l3,0x8e4,%l0
	mulx	%l1,%l1,%l3
	jmpl	%o7,%g0
	smul	%l1,-0x61c,%l7
near3_b2b_l:
	addc	%l2,0xb53,%l5
	addc	%l2,0x797,%l5
	udivx	%l5,-0x162,%l7
	xnor	%l1,0xdfe,%l7
	addc	%l5,%l7,%l3
	sdivx	%l4,0xaeb,%l5
	mulx	%l0,%l3,%l1
	jmpl	%o7,%g0
	xor	%l5,-0x406,%l5
user_near3_end:
	.seg	"text"
	.text
	.align	0x2000
user_far0_start:
p0_far_0_le:
	jmpl	%o7,%g0
	add	%l6,%l5,%l1
	jmpl	%o7,%g0
	nop
p0_far_0_lem:
	jmpl	%o7,%g0
	add	%l6,%l5,%l1
	jmpl	%o7,%g0
	nop
p0_far_0_he:
	std	%l2,[%i3+0x010]		! Mem[00000000100c1410]
	stx	%l7,[%i5+0x008]		! Mem[0000000010141408]
	subc	%l3,-0x3b3,%l2
	nop
	mulx	%l1,-0xcb4,%l2
	jmpl	%o7,%g0
	ldsb	[%i4+0x02f],%l1		! Mem[000000001010142f]
p0_far_0_hem:
	membar	#Sync
	std	%l2,[%i3+0x010]		! Mem[00000000100c1410]
	stx	%l7,[%i5+0x008]		! Mem[0000000010141408]
	subc	%l3,-0x3b3,%l2
	nop
	mulx	%l1,-0xcb4,%l2
	membar	#Sync
	jmpl	%o7,%g0
	ldsb	[%i4+0x02f],%l1		! Mem[000000001010142f]
p0_loop_branch_0:
	jmpl	%o7+12,%g0
	add	%l0,1,%l0
far0_b2b_h:
	jmpl	%o7,%g0
	udivx	%l4,0xf6f,%l5
	jmpl	%o7,%g0
	nop
far0_b2b_l:
	jmpl	%o7,%g0
	umul	%l2,%l6,%l3
	jmpl	%o7,%g0
	nop
user_far0_end:
	.seg	"text"
	.text
	.align	0x2000
user_far1_start:
p0_far_1_le:
	subc	%l3,-0x787,%l6
	udivx	%l2,%l7,%l0
	add	%l4,%l3,%l0
	sdivx	%l1,-0x478,%l3
	xnor	%l0,-0x4c8,%l6
	ldx	[%i5+0x020],%l4		! Mem[0000000010141420]
	jmpl	%o7,%g0
	ldsh	[%i6+0x020],%l6		! Mem[0000000010181420]
p0_far_1_lem:
	subc	%l3,-0x787,%l6
	udivx	%l2,%l7,%l0
	add	%l4,%l3,%l0
	sdivx	%l1,-0x478,%l3
	xnor	%l0,-0x4c8,%l6
	membar	#Sync
	ldx	[%i5+0x020],%l4		! Mem[0000000010141420]
	membar	#Sync
	jmpl	%o7,%g0
	ldsh	[%i6+0x020],%l6		! Mem[0000000010181420]
p0_far_1_he:
	udivx	%l0,%l7,%l0
	lduh	[%i1+0x01e],%l0		! Mem[000000001004141e]
	swap	[%i4+0x01c],%l0		! Mem[000000001010141c]
	andn	%l3,%l0,%l3
	udivx	%l6,0xa6c,%l4
	sdivx	%l6,0x1d9,%l7
	jmpl	%o7,%g0
	ldstub	[%o2+0x000],%l4		! Mem[00000000211c0000]
p0_far_1_hem:
	udivx	%l0,%l7,%l0
	membar	#Sync
	lduh	[%i1+0x01e],%l0		! Mem[000000001004141e]
	swap	[%i4+0x01c],%l0		! Mem[000000001010141c]
	andn	%l3,%l0,%l3
	udivx	%l6,0xa6c,%l4
	sdivx	%l6,0x1d9,%l7
	jmpl	%o7,%g0
	ldstub	[%o2+0x000],%l4		! Mem[00000000211c0000]
p0_loop_branch_1:
	jmpl	%o7+12,%g0
	add	%l0,2,%l0
far1_b2b_h:
	and	%l7,-0x9ce,%l5
	umul	%l3,%l3,%l6
	xor	%l0,%l6,%l4
	xor	%l3,-0x0e4,%l2
	jmpl	%o7,%g0
	nop
far1_b2b_l:
	andn	%l5,-0xe4b,%l7
	andn	%l1,%l5,%l4
	orn	%l0,-0xaa0,%l3
	subc	%l1,-0x179,%l1
	jmpl	%o7,%g0
	sdivx	%l6,%l0,%l3
user_far1_end:
	.seg	"text"
	.text
	.align	0x2000
user_far2_start:
p0_far_2_le:
	subc	%l1,0x0a4,%l6
	orn	%l2,%l6,%l7
	lduw	[%i0+0x00c],%l2		! Mem[000000001000140c]
	stx	%l3,[%i4+0x038]		! Mem[0000000010101438]
	stx	%l0,[%i6+0x018]		! Mem[0000000010181418]
	jmpl	%o7,%g0
	smul	%l6,0x6af,%l1
p0_far_2_lem:
	subc	%l1,0x0a4,%l6
	orn	%l2,%l6,%l7
	membar	#Sync
	lduw	[%i0+0x00c],%l2		! Mem[000000001000140c]
	stx	%l3,[%i4+0x038]		! Mem[0000000010101438]
	stx	%l0,[%i6+0x018]		! Mem[0000000010181418]
	jmpl	%o7,%g0
	smul	%l6,0x6af,%l1
p0_far_2_he:
	jmpl	%o7,%g0
	stx	%l5,[%i0+0x018]		! Mem[0000000010001418]
	jmpl	%o7,%g0
	nop
p0_far_2_hem:
	membar	#Sync
	jmpl	%o7,%g0
	stx	%l5,[%i0+0x018]		! Mem[0000000010001418]
	jmpl	%o7,%g0
	nop
p0_loop_branch_2:
	jmpl	%o7+12,%g0
	add	%l0,3,%l0
far2_b2b_h:
	sub	%l1,-0x283,%l1
	orn	%l0,0xc18,%l1
	mulx	%l1,%l6,%l6
	subc	%l7,0x94f,%l6
	or	%l1,0x92e,%l5
	add	%l1,%l5,%l0
	jmpl	%o7,%g0
	sub	%l2,0x8ec,%l0
far2_b2b_l:
	or	%l2,%l1,%l4
	or	%l2,-0x79a,%l4
	xnor	%l3,%l4,%l7
	subc	%l7,%l5,%l6
	smul	%l5,%l2,%l6
	orn	%l3,-0x468,%l4
	jmpl	%o7,%g0
	xnor	%l7,%l2,%l4
user_far2_end:
	.seg	"text"
	.text
	.align	0x2000
user_far3_start:
p0_far_3_le:
	orn	%l3,-0x8a4,%l3
	or	%l6,0x926,%l5
	ldd	[%i0+0x038],%f2 	! Mem[0000000010001438]
	stx	%l7,[%i2+0x010]		! Mem[0000000010081410]
	sdivx	%l0,%l0,%l0
	jmpl	%o7,%g0
	std	%f10,[%i2+0x030]	! Mem[0000000010081430]
p0_far_3_lem:
	orn	%l3,-0x8a4,%l3
	or	%l6,0x926,%l5
	membar	#Sync
	ldd	[%i0+0x038],%f2 	! Mem[0000000010001438]
	stx	%l7,[%i2+0x010]		! Mem[0000000010081410]
	sdivx	%l0,%l0,%l0
	membar	#Sync
	jmpl	%o7,%g0
	std	%f10,[%i2+0x030]	! Mem[0000000010081430]
p0_far_3_he:
	jmpl	%o7,%g0
	stb	%l3,[%i1+0x01e]		! Mem[000000001004141e]
	jmpl	%o7,%g0
	nop
p0_far_3_hem:
	membar	#Sync
	jmpl	%o7,%g0
	stb	%l3,[%i1+0x01e]		! Mem[000000001004141e]
	jmpl	%o7,%g0
	nop
p0_loop_branch_3:
	jmpl	%o7+12,%g0
	add	%l0,4,%l0
far3_b2b_h:
	sub	%l3,%l1,%l1
	xor	%l4,%l6,%l4
	xor	%l4,%l4,%l4
	sub	%l7,%l4,%l6
	jmpl	%o7,%g0
	and	%l7,%l4,%l6
far3_b2b_l:
	nop
	subc	%l4,%l1,%l1
	addc	%l6,-0x6af,%l0
	mulx	%l2,0x7dc,%l7
	jmpl	%o7,%g0
	andn	%l1,-0x0d4,%l4
user_far3_end:
	.seg	"text"
	.align	0x2000
user_jump0_start:
	INIT_MEM(0, 0x0010, 1, +, 0, +, 0)
p0_jmpl_0_le:
	ldsb	[%i5+0x027],%l7		! Mem[0000000010141427]
	ldstub	[%i3+0x005],%l0		! Mem[00000000100c1405]
	jmpl	%g6+8,%g0
	swap	[%i0+0x018],%l6		! Mem[0000000010001418]
p0_call_0_le:
	xor	%l1,-0x2e0,%l6
	retl
	sub	%l3,0x4db,%l2
p0_jmpl_0_lo:
	ldsb	[%o5+0x027],%l7		! Mem[0000000010141427]
	ldstub	[%o3+0x005],%l0		! Mem[00000000100c1405]
	jmpl	%g6+8,%g0
	swap	[%o0+0x018],%l6		! Mem[0000000010001418]
p0_call_0_lo:
	xor	%l1,-0x2e0,%l6
	retl
	sub	%l3,0x4db,%l2
p0_jmpl_0_he:
	ldsh	[%i6+0x034],%l1		! Mem[0000000010181434]
	lduh	[%i5+0x03a],%l0		! Mem[000000001014143a]
	st	%f23,[%i1+0x020]	! Mem[0000000010041420]
	stw	%l4,[%i2+0x020]		! Mem[0000000010081420]
	lduw	[%i4+0x014],%l7		! Mem[0000000010101414]
	lduh	[%i5+0x022],%l2		! Mem[0000000010141422]
	jmpl	%g6+8,%g0
	umul	%l0,-0xe41,%l2
p0_call_0_he:
	addc	%l0,%l0,%l0
	std	%l4,[%i2+0x018]		! Mem[0000000010081418]
	st	%f18,[%i5+0x024]	! Mem[0000000010141424]
	sdivx	%l5,-0x87c,%l0
	sub	%l4,%l5,%l2
	umul	%l2,0x75a,%l5
	retl
	udivx	%l0,%l4,%l7
p0_jmpl_0_ho:
	ldsh	[%o6+0x034],%l1		! Mem[0000000010181434]
	lduh	[%o5+0x03a],%l0		! Mem[000000001014143a]
	st	%f23,[%o1+0x020]	! Mem[0000000010041420]
	stw	%l4,[%o2+0x020]		! Mem[0000000010081420]
	lduw	[%o4+0x014],%l7		! Mem[0000000010101414]
	lduh	[%o5+0x022],%l2		! Mem[0000000010141422]
	jmpl	%g6+8,%g0
	umul	%l0,-0xe41,%l2
p0_call_0_ho:
	addc	%l0,%l0,%l0
	std	%l4,[%o2+0x018]		! Mem[0000000010081418]
	st	%f18,[%o5+0x024]	! Mem[0000000010141424]
	sdivx	%l5,-0x87c,%l0
	sub	%l4,%l5,%l2
	umul	%l2,0x75a,%l5
	retl
	udivx	%l0,%l4,%l7
user_jump0_end:
	.seg	"text"
	.align	0x2000
user_jump1_start:
	INIT_MEM(0, 0x0020, 1, +, 0, +, 0)
p0_jmpl_1_le:
	andn	%l3,%l5,%l6
	swap	[%i2+0x034],%l5		! Mem[0000000010081434]
	jmpl	%g6+8,%g0
	ldd	[%i4+0x010],%f14	! Mem[0000000010101410]
p0_call_1_le:
	ldx	[%i4+0x030],%l3		! Mem[0000000010101430]
	retl
	std	%f4 ,[%i3+0x020]	! Mem[00000000100c1420]
p0_jmpl_1_lo:
	andn	%l3,%l5,%l6
	swap	[%o2+0x034],%l5		! Mem[0000000010081434]
	jmpl	%g6+8,%g0
	ldd	[%o4+0x010],%f14	! Mem[0000000010101410]
p0_call_1_lo:
	ldx	[%o4+0x030],%l3		! Mem[0000000010101430]
	retl
	std	%f4 ,[%o3+0x020]	! Mem[00000000100c1420]
p0_jmpl_1_he:
	umul	%l0,%l3,%l2
	ldd	[%i3+0x038],%f22	! Mem[00000000100c1438]
	std	%l0,[%i5+0x000]		! Mem[0000000010141400]
	ldd	[%i6+0x038],%l6		! Mem[0000000010181438]
	subc	%l3,%l2,%l0
	stw	%l2,[%i1+0x010]		! Mem[0000000010041410]
	sdivx	%l2,%l4,%l4
	jmpl	%g6+8,%g0
	ldub	[%i2+0x038],%l5		! Mem[0000000010081438]
p0_call_1_he:
	ldsb	[%i0+0x028],%l0		! Mem[0000000010001428]
	and	%l6,-0x9a8,%l4
	retl
	std	%l4,[%i2+0x038]		! Mem[0000000010081438]
p0_jmpl_1_ho:
	umul	%l0,%l3,%l2
	ldd	[%o3+0x038],%f22	! Mem[00000000100c1438]
	std	%l0,[%o5+0x000]		! Mem[0000000010141400]
	ldd	[%o6+0x038],%l6		! Mem[0000000010181438]
	subc	%l3,%l2,%l0
	stw	%l2,[%o1+0x010]		! Mem[0000000010041410]
	sdivx	%l2,%l4,%l4
	jmpl	%g6+8,%g0
	ldub	[%o2+0x038],%l5		! Mem[0000000010081438]
p0_call_1_ho:
	ldsb	[%o0+0x028],%l0		! Mem[0000000010001428]
	and	%l6,-0x9a8,%l4
	retl
	std	%l4,[%o2+0x038]		! Mem[0000000010081438]
user_jump1_end:
	.seg	"text"
	.align	0x2000
user_jump2_start:
	INIT_MEM(0, 0x0030, 1, +, 0, +, 0)
p0_jmpl_2_le:
	swap	[%i2+0x02c],%l5		! Mem[000000001008142c]
	ldsb	[%i2+0x00b],%l1		! Mem[000000001008140b]
	sth	%l1,[%i4+0x020]		! Mem[0000000010101420]
	stw	%l5,[%i4+0x000]		! Mem[0000000010101400]
	swap	[%i1+0x03c],%l4		! Mem[000000001004143c]
	ldsw	[%i5+0x000],%l3		! Mem[0000000010141400]
	mulx	%l4,%l3,%l4
	jmpl	%g6+8,%g0
	ld	[%i1+0x034],%f5 	! Mem[0000000010041434]
p0_call_2_le:
	std	%f2 ,[%i0+0x030]	! Mem[0000000010001430]
	stx	%l1,[%i4+0x028]		! Mem[0000000010101428]
	std	%f10,[%i6+0x028]	! Mem[0000000010181428]
	mulx	%l4,0x883,%l7
	retl
	smul	%l5,%l3,%l1
p0_jmpl_2_lo:
	swap	[%o2+0x02c],%l5		! Mem[000000001008142c]
	ldsb	[%o2+0x00b],%l1		! Mem[000000001008140b]
	sth	%l1,[%o4+0x020]		! Mem[0000000010101420]
	stw	%l5,[%o4+0x000]		! Mem[0000000010101400]
	swap	[%o1+0x03c],%l4		! Mem[000000001004143c]
	ldsw	[%o5+0x000],%l3		! Mem[0000000010141400]
	mulx	%l4,%l3,%l4
	jmpl	%g6+8,%g0
	ld	[%o1+0x034],%f5 	! Mem[0000000010041434]
p0_call_2_lo:
	std	%f2 ,[%o0+0x030]	! Mem[0000000010001430]
	stx	%l1,[%o4+0x028]		! Mem[0000000010101428]
	std	%f10,[%o6+0x028]	! Mem[0000000010181428]
	mulx	%l4,0x883,%l7
	retl
	smul	%l5,%l3,%l1
p0_jmpl_2_he:
	addc	%l7,-0xbb9,%l1
	ldsb	[%i3+0x015],%l4		! Mem[00000000100c1415]
	std	%l6,[%i6+0x028]		! Mem[0000000010181428]
	nop
	subc	%l5,0x6cc,%l5
	jmpl	%g6+8,%g0
	ldsw	[%i4+0x038],%l4		! Mem[0000000010101438]
p0_call_2_he:
	xnor	%l6,%l2,%l5
	umul	%l0,0x4a8,%l0
	swap	[%i5+0x024],%l5		! Mem[0000000010141424]
	orn	%l7,0xcca,%l7
	sub	%l1,-0x29e,%l2
	udivx	%l3,%l0,%l4
	ldstub	[%o0+0x000],%l6		! Mem[00000000201c0000]
	retl
	umul	%l4,-0xb6b,%l5
p0_jmpl_2_ho:
	addc	%l7,-0xbb9,%l1
	ldsb	[%o3+0x015],%l4		! Mem[00000000100c1415]
	std	%l6,[%o6+0x028]		! Mem[0000000010181428]
	nop
	subc	%l5,0x6cc,%l5
	jmpl	%g6+8,%g0
	ldsw	[%o4+0x038],%l4		! Mem[0000000010101438]
p0_call_2_ho:
	xnor	%l6,%l2,%l5
	umul	%l0,0x4a8,%l0
	swap	[%o5+0x024],%l5		! Mem[0000000010141424]
	orn	%l7,0xcca,%l7
	sub	%l1,-0x29e,%l2
	udivx	%l3,%l0,%l4
	ldstub	[%i0+0x000],%l6		! Mem[00000000201c0000]
	retl
	umul	%l4,-0xb6b,%l5
user_jump2_end:
	.seg	"text"
	.align	0x2000
user_jump3_start:
	INIT_MEM(0, 0x0040, 1, +, 0, +, 0)
p0_jmpl_3_le:
	and	%l5,-0x47c,%l7
	jmpl	%g6+8,%g0
	lduh	[%i0+0x01c],%l1		! Mem[000000001000141c]
p0_call_3_le:
	retl
	stw	%l1,[%i1+0x00c]		! Mem[000000001004140c]
p0_jmpl_3_lo:
	and	%l5,-0x47c,%l7
	jmpl	%g6+8,%g0
	lduh	[%o0+0x01c],%l1		! Mem[000000001000141c]
p0_call_3_lo:
	retl
	stw	%l1,[%o1+0x00c]		! Mem[000000001004140c]
p0_jmpl_3_he:
	sth	%l5,[%i3+0x008]		! Mem[00000000100c1408]
	st	%f16,[%i2+0x024]	! Mem[0000000010081424]
	ldsb	[%i0+0x032],%l1		! Mem[0000000010001432]
	jmpl	%g6+8,%g0
	sub	%l7,0x656,%l5
p0_call_3_he:
	nop
	retl
	addc	%l1,%l4,%l3
p0_jmpl_3_ho:
	sth	%l5,[%o3+0x008]		! Mem[00000000100c1408]
	st	%f16,[%o2+0x024]	! Mem[0000000010081424]
	ldsb	[%o0+0x032],%l1		! Mem[0000000010001432]
	jmpl	%g6+8,%g0
	sub	%l7,0x656,%l5
p0_call_3_ho:
	nop
	retl
	addc	%l1,%l4,%l3
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
	.word	0x90038704,0x079ea279		! Init value for %l0
	.word	0xa13b0019,0xc4d6b61e		! Init value for %l1
	.word	0xa06bd33e,0x69d112bd		! Init value for %l2
	.word	0x2cdef4da,0x10dcb46b		! Init value for %l3
	.word	0xcb6de6e4,0x1f9e3056		! Init value for %l4
	.word	0x7de99eb3,0xf202541c		! Init value for %l5
	.word	0x4732102e,0x1de20886		! Init value for %l6
	.word	0x113ac469,0xeb3feedc		! Init value for %l7
	.align	64
p0_init_freg:
	.word	0x46d986ed,0x65aad9ad		! Init value for %f0 
	.word	0x6d1b0540,0x6a008629		! Init value for %f2 
	.word	0x2d215561,0xe48a75d2		! Init value for %f4 
	.word	0x0ce8efb3,0x320e56f0		! Init value for %f6 
	.word	0x3b480edf,0x2730e728		! Init value for %f8 
	.word	0x6e14b756,0xe8c51102		! Init value for %f10
	.word	0xbf25cb9b,0x12656958		! Init value for %f12
	.word	0xb894efc5,0x7aac48ac		! Init value for %f14
	.word	0x46769665,0x3405e07b		! Init value for %f16
	.word	0x76e1e75b,0x4f5f92fd		! Init value for %f18
	.word	0x966a655e,0x0081e4e4		! Init value for %f20
	.word	0xd5541868,0x632743a6		! Init value for %f22
	.word	0xd0b1ed60,0x2e9fa30d		! Init value for %f24
	.word	0xeeac2e6e,0xb28c6835		! Init value for %f26
	.word	0xaa08432a,0x204bcd13		! Init value for %f28
	.word	0xd7d98c9b,0x7ea97ac3		! Init value for %f30
	.word	0x56ba219a,0x4afced25		! Init value for %f32
	.word	0x9ca631e2,0x76ebcbb1		! Init value for %f34
	.word	0x368f4a71,0x9e8a0511		! Init value for %f36
	.word	0xa3fe74e9,0xb1efc581		! Init value for %f38
	.word	0xbf902166,0xa8a04d40		! Init value for %f40
	.word	0xc238ab7e,0x1efb18be		! Init value for %f42
	.word	0xef1eeb63,0xffb2c3f8		! Init value for %f44
	.word	0x6c859b12,0xf0e264fe		! Init value for %f46
	.word	0x33bf8ff9,0xb730b061
	.word	0xd0707c85,0xd967099b
	.word	0xe786be27,0xa6a662b0
	.word	0x2aebde64,0x962bbafa
	.word	0x6334b5e0,0x3d961edf
	.word	0x3027446f,0x090504a6
	.word	0x48d364cf,0x81701cf1
	.word	0x8698851a,0x4c8873ed
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
	.word	0x00000000,0xb3973a77
	.word	0x00000000,0x88eda069
	.word	0xffffffff,0xffffffb3
	.word	0x00000000,0x000000f3
	.word	0x00000000,0x0000ff55
	.word	0x00000000,0xe3731afc
	.word	0x00000000,0x000014f3
	.word	0x00000000,0x00000068
p0_expected_fp_regs:
	.word	0x12e468fb,0xc6874a00
	.word	0x19d4afa0,0xb4000044
	.word	0xfd6264da,0xefbec822
	.word	0x31b54799,0x2a22e1f9
	.word	0xea197047,0x271b3599
	.word	0xe871cc4b,0x44000000
	.word	0xff2e5b1d,0x011f8983
	.word	0x36888982,0xbadd15fa
	.word	0x231586c6,0x339ac92a
	.word	0x5c9c8482,0x4b531e1e
	.word	0x32a9253a,0x0b9aa61a
	.word	0x0b01fcb8,0x299be26b
	.word	0x49112c16,0x6d458df1
	.word	0xc4ae7e75,0x09f028c4
	.word	0x7d70413d,0x7a5f8ff3
	.word	0x8e7f9390,0x83ee8ff2
	.word	0x00000000,0x00000000		! %fsr = 0000000000000000
p0_local0_expect:
	.word	0x6a008629,0x339ac92a
	.word	0xfffff46f,0x4b531e1e
	.word	0xf3140000,0x0b9aa61a
	.word	0x0b01fcb8,0x299be26b
	.word	0x49112c16,0x6d458df1
	.word	0xc4ae7e75,0x09f028c4
	.word	0x7d70413d,0x7a5f8ff3
	.word	0x8e7f9390,0x83ee8ff2
p0_local0_sec_expect:
	.word	0x37ca2a0a,0x50c3dd3e
	.word	0x00001b6d,0x6a9c18a5
	.word	0x1aa69a0b,0x3a25a932
	.word	0xb83dc53f,0xec67c77d
	.word	0x97a0dbe9,0xc596a3ce
	.word	0x579d66e6,0x4eb011fd
	.word	0xc51529cb,0x31b05a9e
	.word	0x1616f761,0xeb3f4291
p0_local1_expect:
	.word	0xb9e1096d,0x152ac917
	.word	0xbcc3ad0c,0xfda032a1
	.word	0x4b89a9dc,0xbadf49c9
	.word	0x88eda069,0x3660c951
	.word	0x3248b6b5,0xa5516110
	.word	0x65143612,0x83e157df
	.word	0x0fbee81c,0xade31718
	.word	0x23be3d8f,0xc57e912f
p0_local1_sec_expect:
	.word	0x1a9aa60b,0x3a25a966
	.word	0x6d1b0540,0xb40318b5
	.word	0x7b578ef7,0x3f2f675a
	.word	0x355a9505,0x023f6912
	.word	0x3691f6ab,0x5d4b2c56
	.word	0x15801a50,0xa0ac18bb
	.word	0x7e7cf6f3,0x0f24fb57
	.word	0x2e05183d,0xc1d7527f
p0_local2_expect:
	.word	0xff55a3cc,0x08d9ee1e
	.word	0x17000000,0x00000000
	.word	0xb3973a77,0x10dcb46b
	.word	0x1519f0f4,0x32a9253a
	.word	0x551f39d8,0x8312383c
	.word	0x552ecdfe,0x367ecf5c
	.word	0x5e08a86b,0x6eef4594
	.word	0x7c69c99a,0x0586e620
p0_local2_sec_expect:
	.word	0xf38f5f7a,0x3d41707d
	.word	0x48084eb1,0xd0c4b429
	.word	0xff2dc3cc,0x2242bb9c
	.word	0xf38115e3,0xecdb10df
	.word	0xd6531cf7,0xc719bfc5
	.word	0xbd8f4b13,0x5d6d35e6
	.word	0x75e29b35,0x308ae187
	.word	0x49c420ad,0x2b40f3b7
p0_local3_expect:
	.word	0x76e1e75b,0x4f5f92ff
	.word	0x25920771,0x99dcc31a
	.word	0xf116fda2,0x5061a6fe
	.word	0xed636805,0xdf04cba2
	.word	0x75845039,0x76559471
	.word	0xc7bc43e8,0xa3922b8b
	.word	0x123844f2,0x7b384e8e
	.word	0x040f88d9,0x8ee96965
p0_local3_sec_expect:
	.word	0x58696512,0x3ed36ba0
	.word	0xd7346f66,0xa8c5ef00
	.word	0x5cc39606,0xa0bf772e
	.word	0xecd0311c,0xe6d71e07
	.word	0x3548cf97,0xd022aaa2
	.word	0x0720deef,0xbfa56b7e
	.word	0x6080b360,0x789f7981
	.word	0x6af2e0f1,0xc92f2b78
p0_local4_expect:
	.word	0xff8f5f7a,0x6bb4dc10
	.word	0x44506fbd,0xc2f80926
	.word	0xffa827a5,0x9d562c6e
	.word	0x00000050,0xfdfc72d6
	.word	0x22cc8c0d,0x13206b5c
	.word	0xc45dcea7,0x774773de
	.word	0xce938a26,0x99373101
	.word	0x3928dc85,0xa044a11a
p0_local4_sec_expect:
	.word	0xe1956c07,0x33a7951a
	.word	0xff63e447,0xa5156ae7
	.word	0xff002c6e,0x9642a300
	.word	0x87ebcb8a,0x980d52f6
	.word	0xb443f5bc,0xf9322cb4
	.word	0x7f2dc62d,0xfee416ab
	.word	0xe7562291,0x307dea0b
	.word	0x32a9253a,0x0b9a8673
p0_local5_expect:
	.word	0x004a87c6,0xfb68e412
	.word	0x440000b4,0xa0afd419
	.word	0x22c8beef,0xda6462fd
	.word	0xf9e1222a,0x9947b531
	.word	0x99351b27,0x477019ea
	.word	0x00000044,0x4bcc71e8
	.word	0x83891f01,0x1d5b2eff
	.word	0xfa15ddba,0x82898836
p0_local5_sec_expect:
	.word	0x76e1e75b,0xa697f08e
	.word	0x17de8ce2,0x43394e92
	.word	0x840c1f4e,0x516694ec
	.word	0x61c4d684,0xe302ac9e
	.word	0xe58c9c43,0x3ebee69f
	.word	0x085f69fd,0x5d1aa823
	.word	0x05c3ee5c,0x4d862d67
	.word	0x1b62d614,0x39231296
p0_local6_expect:
	.word	0x000000b4,0x2f3dd124
	.word	0x9dd28aac,0xf6e2aaba
	.word	0x45160386,0x9535d7f2
	.word	0x9f321743,0x9b4185b5
	.word	0xf81b6639,0xd407c8e1
	.word	0xd5fb44fd,0x690b1af5
	.word	0xb11c7e26,0x0d8d45ef
	.word	0x278fac79,0x12ea590f
p0_local6_sec_expect:
	.word	0xf46f918a,0xb7911e67
	.word	0xffd5d1aa,0xc1499ef0
	.word	0x432ec1e7,0xfb6a963b
	.word	0x9ca43932,0xffbef311
	.word	0x032988e5,0x7f587f62
	.word	0xc1c396f6,0xda7f315b
	.word	0xc0ec6cb4,0xdb984cd6
	.word	0x67dddc70,0x7136b54c
share0_expect:
	.word	0xffff69d9,0x0cd73c30
	.word	0xf9892e74,0xa67d0e34
	.word	0x8bb75842,0x18e8ce06
	.word	0xf2b0505f,0xabdf6de0
	.word	0x78bce4e9,0x989be467
	.word	0x24564c59,0xd805badb
	.word	0x4e61c3ad,0x47066b7b
	.word	0x9a5d7c37,0x2191e8f7
share1_expect:
	.word	0xf8fbd65b,0xaf62b4d4
	.word	0x6ae58e67,0x0567f98b
	.word	0xb5f4f637,0x258cbc1e
	.word	0x5f989f88,0x333b699c
	.word	0x0a4d1b40,0x5780b0d0
	.word	0xd8fbf146,0x82421d67
	.word	0xf721f93c,0xf52d8c11
	.word	0x86affac9,0xa5e578a5
	.word	0x7b950e50,0x969e2874
	.word	0x0a7a5b22,0xe47dc6e1
	.word	0x2d358370,0x63c41ed0
	.word	0xf402237d,0xe9cafee9
	.word	0x6afc4db0,0x8cb981d7
	.word	0xb2b79944,0x4b5e672a
	.word	0x54102c60,0x6bdc2914
	.word	0x851f3885,0x89f6764e
share2_expect:
	.word	0xb6297f73,0xb5e0a28d
	.word	0xa021d601,0xd8a9ccce
	.word	0x42b9f92e,0xdbcc1949
	.word	0xf635846b,0x1dedff29
	.word	0x5f4e2d4b,0x13bfb872
	.word	0x67da86be,0x7afdd36f
	.word	0x51d13158,0xd7fbbce8
	.word	0xc8000c3d,0xc0340273
share3_expect:
	.word	0x14f37898,0x62688f65
	.word	0x35af8c6f,0x65c21eaa
	.word	0x10c52933,0x2b30178a
	.word	0xbb815b25,0xe668aeba
	.word	0x75c4a9b4,0xade0553f
	.word	0xc25684e8,0x61f94311
	.word	0xa3d2d512,0x1ed6c65e
	.word	0xc3f49f0f,0x201dc060
	.word	0x32223952,0xc791ae20
	.word	0x941c9a1a,0x81ee6a1f
	.word	0x2f77a07d,0xe49e5f2b
	.word	0x222b3cdd,0xc7ac8572
	.word	0x27f6be11,0xd5d3fd43
	.word	0xa0a8177f,0xfcf78e9b
	.word	0x658d472d,0x64b5e162
	.word	0x43f10c4b,0xb0d75a63
	.word	0x8a7ef188,0x3fbb6a1e
	.word	0xe290004d,0x32b90e4f
	.word	0xc72a9267,0x27502bcc
	.word	0xa4ea1e00,0x5a210bd5
	.word	0xf5ffdf4f,0x6c5d5aac
	.word	0x9f7b304d,0x53652a21
	.word	0x10780420,0xf431d1f7
	.word	0x9ca7a8e5,0x473c4be8
	.word	0x490d557e,0x17c8a0f0
	.word	0xadd0c565,0x5f6d0ab6
	.word	0x3424a0bb,0x569873b1
	.word	0xc0fabe81,0x7d4adead
	.word	0x6658097f,0x39d45760
	.word	0x128e7400,0x38711408
	.word	0xf3db2424,0x9c11500c
	.word	0x40a6105a,0xf6aba797
	.word	0x61446c5c,0x70214605
	.word	0x23e252c8,0x7f0a230d
	.word	0x0a79417e,0x5850801e
	.word	0x62fdf825,0x9b4f2871
	.word	0xe19b72c5,0x783326b1
	.word	0x2cb8adf2,0xed6503e7
	.word	0x6fc71cb9,0xfe511cdf
	.word	0x038ddf48,0x2a7a60cc
	.word	0xba9c89bf,0x4cd5f325
	.word	0x86773e0d,0x3a2dd22a
	.word	0x31de1cd1,0x57750a0b
	.word	0x62b514b4,0xb4c6badb
	.word	0x1b7eec6d,0x32f1b520
	.word	0xf5ded146,0xf1d9f975
	.word	0x732cb9fa,0xad45fbb2
	.word	0xfdc1fc2c,0x2da66007
	.word	0xe1c8ad10,0x57cfb012
	.word	0x0d152dc0,0x2bbc68e9
	.word	0x07d0ac04,0x8e14d768
	.word	0x86e54451,0xa4bde533
	.word	0xa5b196ef,0x7291a09e
	.word	0x9cd849fa,0xd14e2694
	.word	0x9cbffa68,0x7eaa4857
	.word	0x70fd93c6,0x403a895f
	.word	0x0000db4c,0xf3cfa734
	.word	0x60878fed,0x3c2f985d
	.word	0xfbdaf4b1,0xbd8bc18b
	.word	0xe54fbd68,0x4194dec1
	.word	0x40e5eb71,0x5952a9cd
	.word	0xb19c5df2,0xcf79c57f
	.word	0x13ed9e49,0xe44c5c4f
	.word	0xbfb1f776,0x97dd15c5
p0_invalidate_semaphore:
	.word	0

!	Data for check points

	.align	8
p0_check_pt_data_1:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x00002c6e		! Expected data for %l0
	.word	0x00000000,0x9642a300		! Expected data for %l1
	.word	0x00000000,0x000000ac		! Expected data for %l2
	.word	0xffffffff,0xfffff46f		! Expected data for %l3
	.word	0x00000000,0x00000017		! Expected data for %l4
	.word	0x00000000,0x0000ac79		! Expected data for %l5
	.word	0x00000000,0x00000017		! Expected data for %l6
	.word	0x00000000,0x5e722fe5		! Expected data for %l7
	.word	0x1e1e534b,0x82849c5c		! Expected data for %f8
	.word	0xf2d73595,0x86031645		! Expected data for %f10
	.word	0x37ca2a0a,0x50c3dd3e		! Expected data for %f12
	.word	0x85e1096d,0x22c8beef		! Expected data for %f14
	.word	0x231586c6,0x339ac92a		! Expected data for %f16
	.word	0x5c9c8482,0x4b531e1e		! Expected data for %f18
	.word	0x32a9253a,0x0b9aa61a		! Expected data for %f20
	.word	0x0b01fcb8,0x299be26b		! Expected data for %f22
	.word	0x49112c16,0x6d458df1		! Expected data for %f24
	.word	0xc4ae7e75,0x09f028c4		! Expected data for %f26
	.word	0x7d70413d,0x7a5f8ff3		! Expected data for %f28
	.word	0x8e7f9390,0x83ee8ff2		! Expected data for %f30
p0_check_pt_data_2:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0xb3973a77		! Expected data for %l0
	.word	0x00000000,0x88eda069		! Expected data for %l1
	.word	0xffffffff,0xffffffb3		! Expected data for %l2
	.word	0x00000000,0x000000f3		! Expected data for %l3
	.word	0x00000000,0x0000ff55		! Expected data for %l4
	.word	0x00000000,0xe3731afc		! Expected data for %l5
	.word	0x00000000,0x000014f3		! Expected data for %l6
	.word	0x00000000,0x00000068		! Expected data for %l7
	.word	0x12e468fb,0xc6874a00		! Expected data for %f0
	.word	0x19d4afa0,0xb4000044		! Expected data for %f2
	.word	0xfd6264da,0xefbec822		! Expected data for %f4
	.word	0x31b54799,0x2a22e1f9		! Expected data for %f6
	.word	0xea197047,0x271b3599		! Expected data for %f8
	.word	0xe871cc4b,0x44000000		! Expected data for %f10
	.word	0xff2e5b1d,0x011f8983		! Expected data for %f12
	.word	0x36888982,0xbadd15fa		! Expected data for %f14
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
	.word	0xa3794110,0x34396139
	.word	0x00000000,0x00000002
	.word	0xcea17608,0x3476e618
	.word	0x00000000,0x00000003
	.word	0x7b8f76f7,0xc72253d9
	.word	0x00000000,0x00000004
	.word	0x4116f808,0x72f1fb9e
	.word	0x00000000,0x00000005
	.word	0xbbf6d127,0xf30af46e
	.word	0x00000000,0x00000006
	.word	0x9c9bda8f,0x8c6d12dd
	.word	0x00000000,0x00000007
	.word	0xf817e437,0x9276d499
	.word	0x00000000,0x00000008
	.word	0x5b83391f,0xb64f7763
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
	.word	0x231586c6,0x339ac92a,0x5c9c8482,0x4b531e1e
	.word	0x32a9253a,0x0b9aa61a,0x0b01fcb8,0x299be26b
	.word	0x49112c16,0x6d458df1,0xc4ae7e75,0x09f028c4
	.word	0x7d70413d,0xb3973a77,0x8e7f9390,0x83ee8ff2
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
	.word	0x37ca2a0a,0x50c3dd3e,0xe3731afc,0x6a9c18a5
	.word	0xa402d822,0xfa83ca2e,0xb83dc53f,0xec67c77d
	.word	0x97a0dbe9,0xc596a3ce,0x579d66e6,0x4eb011fd
	.word	0xc51529cb,0x31b05a9e,0x1616f761,0xeb3f4291
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
	.word	0x85e1096d,0x152ac917,0xbcc3ad0c,0xfda032a1
	.word	0x4b89a9dc,0xbadf49c9,0x88eda069,0x3660c951
	.word	0x3248b6b5,0xa5516110,0x65143612,0x83e157df
	.word	0x0fbee803,0xade31718,0x23be3d8f,0xc57e912f
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
	.word	0xf38f5f7a,0xfb9d4c66,0xac26d902,0xb40318b5
	.word	0x7b578ef7,0x3f2f675a,0x355a9505,0x023f6912
	.word	0x3691f6ab,0x5d4b2c56,0x15801a50,0xa0ac18bb
	.word	0x7e7cf6f3,0x0f24fb57,0x2e05183d,0xc1d7527f
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
	.word	0x1755a3cc,0x08d9ee1e,0x10ef08cd,0x9909da8e
	.word	0xf998ab12,0x0ece9b64,0x1519f0f4,0x86a69852
	.word	0x551f39d8,0x8312383c,0x552ecdfe,0x367ecf5c
	.word	0x5e08a86b,0x6eef4594,0x7c69c99a,0x0586e620
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
	.word	0xac581dd8,0xdfe54376,0x48084eb1,0xd0c4b429
	.word	0x502dc3cc,0x2242bb9c,0xf38115e3,0xecdb10df
	.word	0xd6531cf7,0xc719bfc5,0xbd8f4b13,0x5d6d35e6
	.word	0x75e29b35,0x308ae187,0x49c420ad,0x2b40f3b7
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
	.word	0x61d2cac5,0x01c4b3eb,0x25920771,0x99dcc31a
	.word	0xf116fda2,0x5061a6fe,0xed636805,0xdf04cba2
	.word	0x75845039,0x76559471,0xc7bc43e8,0xa3922b8b
	.word	0x123844f2,0x7b384e8e,0x040f88d9,0x8ee96965
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
	.word	0xf35babf2,0xfdfca375,0xd7346f66,0xa8c5ef00
	.word	0x09c39606,0xa0bf772e,0xecd0311c,0xe6d71e07
	.word	0x3548cf97,0xd022aaa2,0x0720deef,0xbfa56b7e
	.word	0x6080b360,0x789f7981,0x6af2e0f1,0xc92f2b78
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
	.word	0xecdae9b7,0x301f6c66,0x44506fbd,0xc2f80926
	.word	0x10a827a5,0x9d562c6e,0x5e722fe5,0xfdfc72d6
	.word	0x22cc8c0d,0x13206b5c,0xc45dcea7,0x774773de
	.word	0xce938a26,0x99373101,0x3928dc85,0xa044a11a
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
	.word	0xe1956c07,0x33a7951a,0x6863e447,0xa5156ae7
	.word	0xd9667055,0x2d1bd66d,0x87ebcb8a,0x980d52f6
	.word	0xb443f5bc,0xf9322cb4,0x7f2dc62d,0xfee416ab
	.word	0xe7562291,0x307dea0b,0x30b11ca6,0x7ab78673
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
	.word	0x004a87c6,0xfb68e412,0xc6d5a36e,0xa0afd419
	.word	0x22c8beef,0xda6462fd,0xf9e1222a,0x9947b531
	.word	0x99351b27,0x477019ea,0x4e222777,0x4bcc71e8
	.word	0x83891f01,0x1d5b2eff,0xfa15ddba,0x82898836
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
	.word	0x9642a300,0xa697f08e,0x17de8ce2,0x43394e92
	.word	0x840c1f4e,0x516694ec,0x61c4d684,0xe302ac9e
	.word	0xe58c9c43,0x3ebee69f,0x085f69fd,0x5d1aa823
	.word	0x05c3ee5c,0x4d862d67,0x1b62d614,0x39231296
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
	.word	0xf367e945,0x2f3dd124,0x9dd28aac,0xf6e2aaba
	.word	0x45160386,0x9535d7f2,0x9f321743,0x9b4185b5
	.word	0xf81b6639,0xd407c8e1,0xd5fb44fd,0x690b1af5
	.word	0xb11c7e26,0x0d8d45ef,0x278fac79,0x12ea590f
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
	.word	0xf46f918a,0xb7911e67,0xe1d5d1aa,0xc1499ef0
	.word	0x432ec1e7,0xfb6a963b,0x9ca43932,0xffbef311
	.word	0x032988e5,0x7f587f62,0xc1c396f6,0xda7f315b
	.word	0xc0ec6cb4,0xdb984cd6,0x67dddc70,0x7136b54c
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
	.word	0xe1fe69d9,0x0cd73c30,0xf9892e74,0xa67d0e34
	.word	0x8bb75842,0x18e8ce06,0xf2b0505f,0xabdf6de0
	.word	0x78bce4e9,0x989be467,0x24564c59,0xd805badb
	.word	0x4e61c3ad,0x47066b7b,0x9a5d7c37,0x2191e8f7
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
	.word	0xf8fbd65b,0xaf62b4d4,0x6ae58e67,0x0567f98b
	.word	0xb5f4f637,0x258cbc1e,0x5f989f88,0x333b699c
	.word	0x0a4d1b40,0x5780b0d0,0xd8fbf146,0x82421d67
	.word	0xf721f93c,0xf52d8c11,0x86affac9,0xa5e578a5
	.word	0x7b950e50,0x969e2874,0x0a7a5b22,0xe47dc6e1
	.word	0x2d358370,0x63c41ed0,0xf402237d,0xe9cafee9
	.word	0x6afc4db0,0x8cb981d7,0xb2b79944,0x4b5e672a
	.word	0x54102c60,0x6bdc2914,0x851f3885,0x89f6764e
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
	.word	0xb6297f73,0xb5e0a28d,0xa021d601,0xd8a9ccce
	.word	0x42b9f92e,0xdbcc1949,0xf635846b,0x1dedff29
	.word	0x5f4e2d4b,0x13bfb872,0x67da86be,0x7afdd36f
	.word	0x51d13158,0xd7fbbce8,0xc8000c3d,0xc0340273
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
	.word	0x14f37898,0x62688f65,0x35af8c6f,0x65c21eaa
	.word	0x10c52933,0x2b30178a,0xbb815b25,0xe668aeba
	.word	0x75c4a9b4,0xade0553f,0xc25684e8,0x61f94311
	.word	0xa3d2d512,0x1ed6c65e,0xc3f49f0f,0x201dc060
	.word	0x32223952,0xc791ae20,0x941c9a1a,0x81ee6a1f
	.word	0x2f77a07d,0xe49e5f2b,0x222b3cdd,0xc7ac8572
	.word	0x27f6be11,0xd5d3fd43,0xa0a8177f,0xfcf78e9b
	.word	0x658d472d,0x64b5e162,0x43f10c4b,0xb0d75a63
	.word	0x8a7ef188,0x3fbb6a1e,0xe290004d,0x32b90e4f
	.word	0xc72a9267,0x27502bcc,0xa4ea1e00,0x5a210bd5
	.word	0xf5ffdf4f,0x6c5d5aac,0x9f7b304d,0x53652a21
	.word	0x10780420,0xf431d1f7,0x9ca7a8e5,0x473c4be8
	.word	0x490d557e,0x17c8a0f0,0xadd0c565,0x5f6d0ab6
	.word	0x3424a0bb,0x569873b1,0xc0fabe81,0x7d4adead
	.word	0x6658097f,0x39d45760,0x128e7400,0x38711408
	.word	0xf3db2424,0x9c11500c,0x40a6105a,0xf6aba797
	.word	0x61446c5c,0x70214605,0x23e252c8,0x7f0a230d
	.word	0x0a79417e,0x5850801e,0x62fdf825,0x9b4f2871
	.word	0xe19b72c5,0x783326b1,0x2cb8adf2,0xed6503e7
	.word	0x6fc71cb9,0xfe511cdf,0x038ddf48,0x2a7a60cc
	.word	0xba9c89bf,0x4cd5f325,0x86773e0d,0x3a2dd22a
	.word	0x31de1cd1,0x57750a0b,0x62b514b4,0xb4c6badb
	.word	0x1b7eec6d,0x32f1b520,0xf5ded146,0xf1d9f975
	.word	0x732cb9fa,0xad45fbb2,0xfdc1fc2c,0x2da66007
	.word	0xe1c8ad10,0x57cfb012,0x0d152dc0,0x2bbc68e9
	.word	0x07d0ac04,0x8e14d768,0x86e54451,0xa4bde533
	.word	0xa5b196ef,0x7291a09e,0x9cd849fa,0xd14e2694
	.word	0x9cbffa68,0x7eaa4857,0x70fd93c6,0x403a895f
	.word	0xcf7bdb4c,0xf3cfa734,0x60878fed,0x3c2f985d
	.word	0xfbdaf4b1,0xbd8bc18b,0xe54fbd68,0x4194dec1
	.word	0x40e5eb71,0x5952a9cd,0xb19c5df2,0xcf79c57f
	.word	0x13ed9e49,0xe44c5c4f,0xbfb1f776,0x97dd15c5
share3_end:
