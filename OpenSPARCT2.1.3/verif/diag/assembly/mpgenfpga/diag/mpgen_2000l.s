/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: mpgen_2000l.s
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
!	Seed = 325162034
!	Riesling can be on
!	1 Thread, 2000 lines
!	mpgen   created on Dec 20, 2005 (16:35:03)
!	mpgen_2000l.s created on Mar 25, 2009 (16:20:34)
!	RC file : mar25.rc
!	cmd = /import/n2-tools/release/tools/mpgen/mpgen,1.051220 -rc mar25.rc -o mpgen_2000l -p 1 -l 2000

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
!	%f0  = b8fc05a1 6367b33f d1c5e7a2 805884c5
!	%f4  = 9b8a3885 05e16164 e66bfd79 fd120472
!	%f8  = ec73f491 4b342b56 520d00d2 4f2f6302
!	%f12 = 30c5f851 75cc2614 45203f3f 926e6b34
	ldda	[%g1]ASI_BLK_P,%f0
	add	%g1,64,%g1
!	%f16 = 9c3a34d5 b5d7f295 ed8515c7 d7c87641
!	%f20 = b6ddc26c f35fc89e 58623cfa bd883550
!	%f24 = c6585e18 2f2900a1 29df2870 53294cbf
!	%f28 = 10016ef2 0805fcd7 dab1dfd1 17ec71b3
	ldda	[%g1]ASI_BLK_P,%f16
	add	%g1,64,%g1
!	%f32 = 87fac300 2b86419d f7dd17e2 dea39413
!	%f36 = c9130c03 0f91a033 b7650081 dfe0d829
!	%f40 = 27cb5b4a ff08d584 c972e80e 3441b5dc
!	%f44 = cf0eda77 6774a8d2 f58d4a00 40595e2e
	ldda	[%g1]ASI_BLK_P,%f32

!	Set up the Graphics Status Register

	setx	0xaf21ba2000000048,%g7,%g1 ! GSR scale =  9, align = 0
	wr	%g1,%g0,%gsr		! GSR = af21ba2000000048
	wr	%g0,%y			! Clear Y register
	xorcc	%g0,%g0,%g3		! init %g3 and set flags
	membar	#Sync			! Force the block loads to complete

!	Start of Random Code for processor 0

p0_label_1:
!	Mem[00000000211c0000] = b341b5d7, %l4 = 208572882404f430
	lduh	[%o2+%g0],%l4		! %l4 = 000000000000b341
!	%f23 = bd883550, Mem[0000000030041410] = 865010a3
	sta	%f23,[%i1+%o5]0x81	! Mem[0000000030041410] = bd883550
!	Mem[0000000010001408] = dc55a41e, %l0 = 3d9b2f6fe67d95db
	ldsha	[%i0+%o4]0x80,%l0	! %l0 = ffffffffffffdc55
!	Mem[0000000010141400] = e8ab7753, %l1 = cf44ab82a54854c0
	swapa	[%i5+%g0]0x88,%l1	! %l1 = 00000000e8ab7753
!	Mem[0000000030181400] = 1da153d8, %l3 = 2838fa4e274f4671
	lduwa	[%i6+%g0]0x81,%l3	! %l3 = 000000001da153d8
!	Mem[0000000010041410] = a89537bd, %l7 = b716d14a6fc1097c
	ldstuba	[%i1+%o5]0x88,%l7	! %l7 = 000000bd000000ff
!	Mem[00000000300c1400] = c81a593a, %l1 = 00000000e8ab7753
	ldstuba	[%i3+%g0]0x89,%l1	! %l1 = 0000003a000000ff
!	%f22 = 58623cfa bd883550, %l1 = 000000000000003a
!	Mem[0000000030041410] = bd883550f8df3020
	add	%i1,0x010,%g1
	stda	%f22,[%g1+%l1]ASI_PST8_S ! Mem[0000000030041410] = bd883cfabddf3520
!	%f28 = 10016ef2 0805fcd7, Mem[0000000030041410] = fa3c88bd 2035dfbd
	stda	%f28,[%i1+%o5]0x89	! Mem[0000000030041410] = 10016ef2 0805fcd7
!	Starting 10 instruction Store Burst
!	Mem[0000000010101410] = 31e92d61, %l5 = e29ca9bc93f1603a
	ldstuba	[%i4+%o5]0x88,%l5	! %l5 = 00000061000000ff

p0_label_2:
!	%l1 = 000000000000003a, Mem[0000000010141434] = 602eff93, %asi = 80
	stwa	%l1,[%i5+0x034]%asi	! Mem[0000000010141434] = 0000003a
!	%l6 = c76d6721ed06b274, Mem[0000000010141400] = c05448a53f0132d0
	stxa	%l6,[%i5+%g0]0x80	! Mem[0000000010141400] = c76d6721ed06b274
!	%l4 = 000000000000b341, Mem[0000000030081410] = a69f3371
	stba	%l4,[%i2+%o5]0x89	! Mem[0000000030081410] = a69f3341
!	Mem[0000000010081400] = 669a25d87f0a13da, %l1 = 000000000000003a, %l1 = 000000000000003a
	casxa	[%i2]0x80,%l1,%l1	! %l1 = 669a25d87f0a13da
!	Mem[0000000010081410] = 7278a874, %l1 = 669a25d87f0a13da
	ldstuba	[%i2+%o5]0x88,%l1	! %l1 = 00000074000000ff
!	%l0 = ffffffffffffdc55, Mem[0000000030101400] = 4346900d
	stba	%l0,[%i4+%g0]0x89	! Mem[0000000030101400] = 43469055
!	%l5 = 0000000000000061, Mem[00000000100c1438] = 8fe52c5d, %asi = 80
	stwa	%l5,[%i3+0x038]%asi	! Mem[00000000100c1438] = 00000061
!	%l7 = 00000000000000bd, Mem[00000000300c1408] = 0692c00c
	stba	%l7,[%i3+%o4]0x89	! Mem[00000000300c1408] = 0692c0bd
!	Mem[000000001000140c] = 35513158, %l1 = 0000000000000074, %asi = 80
	swapa	[%i0+0x00c]%asi,%l1	! %l1 = 0000000035513158
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = d853a11d, %l3 = 000000001da153d8
	ldswa	[%i6+%g0]0x89,%l3	! %l3 = ffffffffd853a11d

p0_label_3:
!	Mem[0000000010181400] = 2f89f8fb, %l7 = 00000000000000bd
	ldsha	[%i6+%g0]0x80,%l7	! %l7 = 0000000000002f89
!	Mem[0000000010001400] = 1cb6a49a8b7274a2, %l6 = c76d6721ed06b274
	ldxa	[%i0+%g0]0x80,%l6	! %l6 = 1cb6a49a8b7274a2
!	Mem[000000001018140c] = b8528a1c, %l2 = 1d697016691ccadf
	ldsba	[%i6+0x00d]%asi,%l2	! %l2 = 0000000000000052
!	Mem[0000000010141408] = ea6db661, %l6 = 1cb6a49a8b7274a2
	lduba	[%i5+%o4]0x88,%l6	! %l6 = 0000000000000061
!	Mem[0000000010001410] = 44f7283c, %l4 = 000000000000b341
	ldsba	[%i0+%o5]0x80,%l4	! %l4 = 0000000000000044
!	Mem[0000000010181408] = 1c8a52b8009f455a, %l0 = ffffffffffffdc55
	ldxa	[%i6+%o4]0x88,%l0	! %l0 = 1c8a52b8009f455a
!	Code Fragment 4
p0_fragment_1:
!	%l0 = 1c8a52b8009f455a
	setx	0xb48510a78de0bf21,%g7,%l0 ! %l0 = b48510a78de0bf21
!	%l1 = 0000000035513158
	setx	0x72c3e5985d3b3174,%g7,%l1 ! %l1 = 72c3e5985d3b3174
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = b48510a78de0bf21
	setx	0x8f6698900e5b9083,%g7,%l0 ! %l0 = 8f6698900e5b9083
!	%l1 = 72c3e5985d3b3174
	setx	0x302ec8385726ff17,%g7,%l1 ! %l1 = 302ec8385726ff17
!	Mem[0000000010141400] = c76d6721ed06b274, %f14 = 45203f3f 926e6b34
	ldda	[%i5+%g0]0x80,%f14	! %f14 = c76d6721 ed06b274
!	Mem[0000000030181410] = 7001eef5, %l7 = 0000000000002f89
	ldsba	[%i6+%o5]0x81,%l7	! %l7 = 0000000000000070
!	Starting 10 instruction Store Burst
!	Mem[0000000010141410] = e3afffff, %l2 = 0000000000000052
	swapa	[%i5+%o5]0x88,%l2	! %l2 = 00000000e3afffff

p0_label_4:
!	%l0 = 0e5b9083, %l1 = 5726ff17, Mem[0000000010101408] = cbda6747 82fee86e
	stda	%l0,[%i4+%o4]0x80	! Mem[0000000010101408] = 0e5b9083 5726ff17
!	%l5 = 0000000000000061, Mem[0000000010041400] = cf2cf651
	stwa	%l5,[%i1+%g0]0x80	! Mem[0000000010041400] = 00000061
!	%l5 = 0000000000000061, Mem[0000000030001410] = d2c7f440
	stha	%l5,[%i0+%o5]0x89	! Mem[0000000030001410] = d2c70061
!	%l3 = ffffffffd853a11d, Mem[000000001008143c] = 62db824c, %asi = 80
	stba	%l3,[%i2+0x03c]%asi	! Mem[000000001008143c] = 1ddb824c
!	%l0 = 0e5b9083, %l1 = 5726ff17, Mem[0000000010101408] = 83905b0e 17ff2657
	stda	%l0,[%i4+%o4]0x88	! Mem[0000000010101408] = 0e5b9083 5726ff17
!	%l3 = ffffffffd853a11d, Mem[0000000010081408] = e3b2fe78
	stba	%l3,[%i2+%o4]0x88	! Mem[0000000010081408] = e3b2fe1d
!	%l4 = 00000044, %l5 = 00000061, Mem[00000000100c1420] = 3cf18691 57606edb
	stda	%l4,[%i3+0x020]%asi	! Mem[00000000100c1420] = 00000044 00000061
!	Mem[0000000010141410] = 52000000, %l3 = ffffffffd853a11d
	swapa	[%i5+%o5]0x80,%l3	! %l3 = 0000000052000000
!	%l2 = e3afffff, %l3 = 52000000, Mem[0000000010181410] = 5eff1405 04ee03ee
	stda	%l2,[%i6+%o5]0x88	! Mem[0000000010181410] = e3afffff 52000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = 009f455a, %l0 = 8f6698900e5b9083
	lduwa	[%i6+%o4]0x88,%l0	! %l0 = 00000000009f455a

p0_label_5:
!	Mem[0000000010141400] = c76d6721ed06b274, %l5 = 0000000000000061
	ldxa	[%i5+%g0]0x80,%l5	! %l5 = c76d6721ed06b274
!	Mem[0000000030101408] = 6697c257, %l1 = 302ec8385726ff17
	lduwa	[%i4+%o4]0x81,%l1	! %l1 = 000000006697c257
!	Mem[00000000100c1410] = da947aff, %f30 = dab1dfd1
	lda	[%i3+%o5]0x88,%f30	! %f30 = da947aff
!	Mem[0000000030001400] = cbc11310, %l7 = 0000000000000070
	ldsba	[%i0+%g0]0x81,%l7	! %l7 = ffffffffffffffcb
!	Mem[0000000030141410] = f2bd4295f876ea74, %f12 = 30c5f851 75cc2614
	ldda	[%i5+%o5]0x89,%f12	! %f12 = f2bd4295 f876ea74
!	Mem[000000001018143c] = 6f64bbd1, %l1 = 000000006697c257
	ldsw	[%i6+0x03c],%l1		! %l1 = 000000006f64bbd1
	membar	#Sync			! Added by membar checker (1)
!	Mem[00000000300c1400] = ff591ac8 c2885361 bdc09206 721d1a44
!	Mem[00000000300c1410] = 0ccf3734 e9746bb4 7de5c496 982226b7
!	Mem[00000000300c1420] = 0e8b5533 22b7fa40 28cefcc5 5e95ef4c
!	Mem[00000000300c1430] = bd6b53ba 5debeccd eca45b45 d9bf64ea
	ldda	[%i3]ASI_BLK_SL,%f16	! Block Load from 00000000300c1400
!	Mem[0000000010101414] = 0a1d82a8, %l2 = 00000000e3afffff
	lduba	[%i4+0x016]%asi,%l2	! %l2 = 0000000000000082
!	Mem[0000000010001410] = 44f7283c, %f1  = 6367b33f
	lda	[%i0+0x010]%asi,%f1 	! %f1 = 44f7283c
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1400] = 55063cb6, %l3 = 0000000052000000
	ldstuba	[%i3+%g0]0x88,%l3	! %l3 = 000000b6000000ff

!	Check Point 1 for processor 0

	set	p0_check_pt_data_1,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 00000000009f455a
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 000000006f64bbd1
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 0000000000000082
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 00000000000000b6
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 0000000000000044
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = c76d6721ed06b274
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 0000000000000061
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = ffffffffffffffcb
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = b8fc05a1 44f7283c
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x50],%g3
	std	%f12,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f12 = f2bd4295 f876ea74
	bne	%xcc,p0_freg_check_fail
	mov	0xf12,%g1
	ldx	[%g4+0x58],%g3
	std	%f14,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f14 = c76d6721 ed06b274
	bne	%xcc,p0_freg_check_fail
	mov	0xf14,%g1
	ldx	[%g4+0x60],%g3
	std	%f16,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f16 = 615388c2 c81a59ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf16,%g1
	ldx	[%g4+0x68],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = 441a1d72 0692c0bd
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1
	ldx	[%g4+0x70],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = b46b74e9 3437cf0c
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1
	ldx	[%g4+0x78],%g3
	std	%f22,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f22 = b7262298 96c4e57d
	bne	%xcc,p0_freg_check_fail
	mov	0xf22,%g1
	ldx	[%g4+0x80],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = 40fab722 33558b0e
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1
	ldx	[%g4+0x88],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = 4cef955e c5fcce28
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1
	ldx	[%g4+0x90],%g3
	std	%f28,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f28 = cdeceb5d ba536bbd
	bne	%xcc,p0_freg_check_fail
	mov	0xf28,%g1
	ldx	[%g4+0x98],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = ea64bfd9 455ba4ec
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 1 completed


p0_label_6:
!	%l4 = 00000044, %l5 = ed06b274, Mem[0000000030141410] = f876ea74 f2bd4295
	stda	%l4,[%i5+%o5]0x89	! Mem[0000000030141410] = 00000044 ed06b274
!	%l0 = 00000000009f455a, Mem[0000000030101410] = c72bbe67
	stba	%l0,[%i4+%o5]0x81	! Mem[0000000030101410] = 5a2bbe67
!	Mem[0000000010181438] = 3ab671d5, %l7 = ffffffffffffffcb, %asi = 80
	swapa	[%i6+0x038]%asi,%l7	! %l7 = 000000003ab671d5
!	Mem[0000000030141408] = 1ed38cb7, %l7 = 000000003ab671d5
	swapa	[%i5+%o4]0x89,%l7	! %l7 = 000000001ed38cb7
	membar	#Sync			! Added by membar checker (2)
!	%l0 = 009f455a, %l1 = 6f64bbd1, Mem[00000000300c1410] = 3437cf0c b46b74e9
	stda	%l0,[%i3+%o5]0x89	! Mem[00000000300c1410] = 009f455a 6f64bbd1
!	%l2 = 0000000000000082, Mem[0000000030081400] = 2810fa5f
	stba	%l2,[%i2+%g0]0x89	! Mem[0000000030081400] = 2810fa82
!	%l6 = 0000000000000061, Mem[0000000010181400] = 2f89f8fbac925426, %asi = 80
	stxa	%l6,[%i6+0x000]%asi	! Mem[0000000010181400] = 0000000000000061
!	%l3 = 00000000000000b6, Mem[0000000030041410] = 0805fcd7
	stha	%l3,[%i1+%o5]0x89	! Mem[0000000030041410] = 080500b6
!	Mem[0000000010181400] = 00000000, %l7 = 000000001ed38cb7
	swapa	[%i6+%g0]0x88,%l7	! %l7 = 0000000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = e5806db457c29766, %l4 = 0000000000000044
	ldxa	[%i4+%o4]0x89,%l4	! %l4 = e5806db457c29766

p0_label_7:
!	Mem[0000000010041408] = 0873e995, %l1 = 000000006f64bbd1
	ldsha	[%i1+%o4]0x88,%l1	! %l1 = ffffffffffffe995
!	Mem[0000000030181400] = d853a11d, %l3 = 00000000000000b6
	ldsba	[%i6+%g0]0x89,%l3	! %l3 = 000000000000001d
!	Mem[00000000201c0000] = fdf39b8f, %l4 = e5806db457c29766
	ldsha	[%o0+0x000]%asi,%l4	! %l4 = fffffffffffffdf3
!	Mem[0000000030081408] = f9caf502, %l5 = c76d6721ed06b274
	ldswa	[%i2+%o4]0x89,%l5	! %l5 = fffffffff9caf502
!	Mem[00000000211c0000] = b341b5d7, %l1 = ffffffffffffe995
	lduh	[%o2+%g0],%l1		! %l1 = 000000000000b341
!	Mem[0000000010101400] = 10914887, %l0 = 00000000009f455a
	lduba	[%i4+%g0]0x80,%l0	! %l0 = 0000000000000010
!	Mem[0000000010001410] = 44f7283c, %l7 = 0000000000000000
	ldsba	[%i0+0x012]%asi,%l7	! %l7 = 0000000000000028
!	Mem[00000000300c1410] = 6f64bbd1009f455a, %f0  = b8fc05a1 44f7283c
	ldda	[%i3+%o5]0x89,%f0 	! %f0  = 6f64bbd1 009f455a
!	Mem[0000000010141410] = d853a11d, %l3 = 000000000000001d
	ldsh	[%i5+0x012],%l3		! %l3 = ffffffffffffa11d
!	Starting 10 instruction Store Burst
!	Mem[0000000010101400] = 10914887, %l7 = 0000000000000028
	swapa	[%i4+%g0]0x80,%l7	! %l7 = 0000000010914887

p0_label_8:
!	%f16 = 615388c2 c81a59ff, %l0 = 0000000000000010
!	Mem[0000000010041408] = 95e97308468285d3
	add	%i1,0x008,%g1
	stda	%f16,[%g1+%l0]ASI_PST16_PL ! Mem[0000000010041408] = 95e97308468285d3
!	Mem[00000000100c1410] = da947aff, %l6 = 0000000000000061
	ldstuba	[%i3+%o5]0x88,%l6	! %l6 = 000000ff000000ff
!	%f30 = ea64bfd9, Mem[0000000010141408] = 61b66dea
	sta	%f30,[%i5+%o4]0x80	! Mem[0000000010141408] = ea64bfd9
!	Mem[0000000010101400] = 00000028, %l5 = fffffffff9caf502
	ldstuba	[%i4+%g0]0x80,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010101400] = 280000ff, %l6 = 00000000000000ff
	swapa	[%i4+%g0]0x88,%l6	! %l6 = 00000000280000ff
!	Mem[0000000010141408] = d9bf64ea, %l0 = 0000000000000010
	ldstuba	[%i5+%o4]0x88,%l0	! %l0 = 000000ea000000ff
!	%f26 = 4cef955e, Mem[0000000030141408] = d571b63a
	sta	%f26,[%i5+%o4]0x81	! Mem[0000000030141408] = 4cef955e
!	%f28 = cdeceb5d ba536bbd, Mem[0000000010181410] = e3afffff 52000000
	stda	%f28,[%i6+%o5]0x88	! Mem[0000000010181410] = cdeceb5d ba536bbd
!	%l2 = 00000082, %l3 = ffffa11d, Mem[0000000010041418] = 61f359ff 4268c889
	std	%l2,[%i1+0x018]		! Mem[0000000010041418] = 00000082 ffffa11d
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = 02f5caf9794a8491, %l7 = 0000000010914887
	ldxa	[%i2+%o4]0x81,%l7	! %l7 = 02f5caf9794a8491

p0_label_9:
!	Mem[0000000020800040] = 46d9e25a, %l0 = 00000000000000ea
	lduha	[%o1+0x040]%asi,%l0	! %l0 = 00000000000046d9
!	Mem[0000000030141410] = 44000000, %l4 = fffffffffffffdf3
	lduba	[%i5+%o5]0x81,%l4	! %l4 = 0000000000000044
!	Mem[00000000100c1400] = ff3c0655, %l0 = 00000000000046d9
	lduha	[%i3+%g0]0x80,%l0	! %l0 = 000000000000ff3c
!	Mem[00000000100c1410] = da947aff, %l5 = 0000000000000000
	ldswa	[%i3+%o5]0x88,%l5	! %l5 = ffffffffda947aff
!	Mem[0000000010181408] = 5a459f00, %l2 = 0000000000000082
	ldsha	[%i6+%o4]0x80,%l2	! %l2 = 0000000000005a45
!	Mem[00000000100c1400] = 55063cff, %l1 = 000000000000b341
	ldsha	[%i3+%g0]0x88,%l1	! %l1 = 0000000000003cff
	membar	#Sync			! Added by membar checker (3)
!	Mem[0000000010141400] = c76d6721 ed06b274 ff64bfd9 e545dd67
!	Mem[0000000010141410] = d853a11d 94e9022f ff795814 f47ca02d
!	Mem[0000000010141420] = 031a783d b6b67068 348aa427 35edcef8
!	Mem[0000000010141430] = fa62794f 0000003a 3498af52 7ae32cb8
	ldda	[%i5]ASI_BLK_P,%f0	! Block Load from 0000000010141400
!	Mem[0000000010141400] = c76d6721, %f20 = b46b74e9
	lda	[%i5+%g0]0x80,%f20	! %f20 = c76d6721
!	Mem[0000000030101408] = 6697c257, %l5 = ffffffffda947aff
	ldsha	[%i4+%o4]0x81,%l5	! %l5 = 0000000000006697
!	Starting 10 instruction Store Burst
!	Mem[0000000010001408] = dc55a41e, %l6 = 00000000280000ff
	swapa	[%i0+%o4]0x80,%l6	! %l6 = 00000000dc55a41e

p0_label_10:
!	Mem[00000000100c1428] = 89e8739e, %l2 = 0000000000005a45
	ldstuba	[%i3+0x028]%asi,%l2	! %l2 = 00000089000000ff
!	%l3 = ffffffffffffa11d, Mem[0000000030181410] = 7001eef5
	stwa	%l3,[%i6+%o5]0x81	! Mem[0000000030181410] = ffffa11d
!	%l2 = 00000089, %l3 = ffffa11d, Mem[0000000010181400] = 1ed38cb7 61000000
	stda	%l2,[%i6+%g0]0x88	! Mem[0000000010181400] = 00000089 ffffa11d
!	%f19 = 0692c0bd, Mem[0000000010041400] = 61000000
	sta	%f19,[%i1+%g0]0x88	! Mem[0000000010041400] = 0692c0bd
!	Mem[000000001010141c] = 8147b36e, %l3 = ffffffffffffa11d
	swap	[%i4+0x01c],%l3		! %l3 = 000000008147b36e
!	%f18 = 441a1d72 0692c0bd, Mem[0000000030101408] = 6697c257 b46d80e5
	stda	%f18,[%i4+%o4]0x81	! Mem[0000000030101408] = 441a1d72 0692c0bd
!	%l6 = dc55a41e, %l7 = 794a8491, Mem[0000000030101400] = 55904643 64d1f116
	stda	%l6,[%i4+%g0]0x81	! Mem[0000000030101400] = dc55a41e 794a8491
!	%l3 = 000000008147b36e, Mem[0000000020800040] = 46d9e25a
	stb	%l3,[%o1+0x040]		! Mem[0000000020800040] = 6ed9e25a
	membar	#Sync			! Added by membar checker (4)
!	%l2 = 0000000000000089, Mem[0000000010141408] = ff64bfd9
	stha	%l2,[%i5+%o4]0x80	! Mem[0000000010141408] = 0089bfd9
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = d38582460873e995, %l3 = 000000008147b36e
	ldxa	[%i1+%o4]0x88,%l3	! %l3 = d38582460873e995

!	Check Point 2 for processor 0

	set	p0_check_pt_data_2,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 000000000000ff3c
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 0000000000003cff
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 0000000000000089
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = d38582460873e995
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 0000000000000044
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 0000000000006697
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 00000000dc55a41e
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 02f5caf9794a8491
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = c76d6721 ed06b274
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x50],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = ff64bfd9 e545dd67
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x58],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = d853a11d 94e9022f
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x60],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = ff795814 f47ca02d
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x68],%g3
	std	%f8,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f8 = 031a783d b6b67068
	bne	%xcc,p0_freg_check_fail
	mov	0xf08,%g1
	ldx	[%g4+0x70],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = 348aa427 35edcef8
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x78],%g3
	std	%f12,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f12 = fa62794f 0000003a
	bne	%xcc,p0_freg_check_fail
	mov	0xf12,%g1
	ldx	[%g4+0x80],%g3
	std	%f14,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f14 = 3498af52 7ae32cb8
	bne	%xcc,p0_freg_check_fail
	mov	0xf14,%g1
	ldx	[%g4+0x88],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = c76d6721 3437cf0c
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1

!	Check Point 2 completed


p0_label_11:
!	Mem[0000000010181400] = 89000000, %l4 = 0000000000000044
	ldsh	[%i6+0x002],%l4		! %l4 = 0000000000000000
!	Mem[0000000030141410] = 44000000, %f2  = ff64bfd9
	lda	[%i5+%o5]0x81,%f2 	! %f2 = 44000000
!	Mem[000000001000142c] = d9d69556, %l6 = 00000000dc55a41e
	ldsb	[%i0+0x02d],%l6		! %l6 = ffffffffffffffd6
!	Mem[0000000010101408] = 0e5b9083, %f1  = ed06b274
	lda	[%i4+%o4]0x88,%f1 	! %f1 = 0e5b9083
!	Mem[0000000010041410] = ff3795a8, %l7 = 02f5caf9794a8491
	lduba	[%i1+0x010]%asi,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010101400] = ff000000, %l3 = d38582460873e995
	ldsba	[%i4+%g0]0x80,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000030081400] = 2810fa82, %l1 = 0000000000003cff
	ldsba	[%i2+%g0]0x89,%l1	! %l1 = ffffffffffffff82
!	Mem[0000000010181408] = 009f455a, %l5 = 0000000000006697
	lduba	[%i6+%o4]0x88,%l5	! %l5 = 000000000000005a
!	Mem[0000000030101400] = 1ea455dc, %l2 = 0000000000000089
	ldswa	[%i4+%g0]0x89,%l2	! %l2 = 000000001ea455dc
!	Starting 10 instruction Store Burst
!	%l3 = ffffffffffffffff, Mem[0000000010001408] = ff000028
	stwa	%l3,[%i0+%o4]0x88	! Mem[0000000010001408] = ffffffff

p0_label_12:
!	%l7 = 00000000000000ff, Mem[0000000010041408] = 95e97308
	stha	%l7,[%i1+%o4]0x80	! Mem[0000000010041408] = 00ff7308
!	Mem[000000001000142e] = d9d69556, %l3 = ffffffffffffffff
	ldstub	[%i0+0x02e],%l3		! %l3 = 00000095000000ff
!	%f18 = 441a1d72 0692c0bd, %l0 = 000000000000ff3c
!	Mem[0000000030041438] = c801c78542576a2f
	add	%i1,0x038,%g1
	stda	%f18,[%g1+%l0]ASI_PST16_SL ! Mem[0000000030041438] = c801c785721d1a44
!	%l2 = 000000001ea455dc, Mem[0000000030081408] = 02f5caf9
	stwa	%l2,[%i2+%o4]0x81	! Mem[0000000030081408] = 1ea455dc
!	%l6 = ffffffd6, %l7 = 000000ff, Mem[00000000100c1400] = 55063cff 0f28a18c
	stda	%l6,[%i3+%g0]0x88	! Mem[00000000100c1400] = ffffffd6 000000ff
!	Mem[0000000010101408] = 83905b0e, %l1 = ffffff82, %l1 = ffffff82
	add	%i4,0x08,%g1
	casa	[%g1]0x80,%l1,%l1	! %l1 = 0000000083905b0e
!	%l5 = 000000000000005a, Mem[0000000010001410] = 44f7283c9902143e
	stxa	%l5,[%i0+%o5]0x80	! Mem[0000000010001410] = 000000000000005a
!	%l4 = 0000000000000000, Mem[0000000010141408] = d9bf8900
	stba	%l4,[%i5+%o4]0x88	! Mem[0000000010141408] = d9bf8900
!	%l1 = 0000000083905b0e, Mem[0000000010081400] = d8259a66
	stwa	%l1,[%i2+%g0]0x88	! Mem[0000000010081400] = 83905b0e
!	Starting 10 instruction Load Burst
!	Mem[0000000030001400] = 1013c1cb, %l6 = ffffffffffffffd6
	lduha	[%i0+%g0]0x89,%l6	! %l6 = 000000000000c1cb

p0_label_13:
!	Mem[0000000010041400] = 0692c0bd, %l4 = 0000000000000000
	ldswa	[%i1+%g0]0x88,%l4	! %l4 = 000000000692c0bd
!	Mem[0000000010041400] = bdc09206, %l6 = 000000000000c1cb
	ldswa	[%i1+%g0]0x80,%l6	! %l6 = ffffffffbdc09206
!	Mem[000000001010141c] = ffffa11d, %l3 = 0000000000000095
	lduba	[%i4+0x01f]%asi,%l3	! %l3 = 000000000000001d
!	Mem[0000000010041400] = bdc09206, %l0 = 000000000000ff3c
	lduba	[%i1+%g0]0x80,%l0	! %l0 = 00000000000000bd
!	Mem[0000000010001408] = ffffffff, %f11 = 35edcef8
	lda	[%i0+%o4]0x80,%f11	! %f11 = ffffffff
!	Mem[0000000030101410] = 5a2bbe67, %f16 = 615388c2
	lda	[%i4+%o5]0x81,%f16	! %f16 = 5a2bbe67
!	Mem[00000000211c0000] = b341b5d7, %l3 = 000000000000001d
	lduh	[%o2+%g0],%l3		! %l3 = 000000000000b341
!	Mem[0000000030081400] = 82fa1028 c9fad25a, %l6 = bdc09206, %l7 = 000000ff
	ldda	[%i2+%g0]0x81,%l6	! %l6 = 0000000082fa1028 00000000c9fad25a
!	Mem[0000000030001410] = d2c70061, %f5  = 94e9022f
	lda	[%i0+%o5]0x89,%f5 	! %f5 = d2c70061
!	Starting 10 instruction Store Burst
!	Mem[0000000010001408] = ffffffff, %l0 = 00000000000000bd
	ldstuba	[%i0+%o4]0x80,%l0	! %l0 = 000000ff000000ff

p0_label_14:
!	%l0 = 00000000000000ff, Mem[0000000010001400] = 1cb6a49a
	stwa	%l0,[%i0+%g0]0x80	! Mem[0000000010001400] = 000000ff
!	%f0  = c76d6721 0e5b9083, %l7 = 00000000c9fad25a
!	Mem[0000000010181438] = ffffffcb6f64bbd1
	add	%i6,0x038,%g1
	stda	%f0,[%g1+%l7]ASI_PST16_PL ! Mem[0000000010181438] = ffff5b0e6f646dc7
!	Mem[0000000010141408] = 0089bfd9, %l7 = 00000000c9fad25a
	ldstuba	[%i5+%o4]0x80,%l7	! %l7 = 00000000000000ff
!	%l1 = 0000000083905b0e, Mem[0000000010041402] = bdc09206, %asi = 80
	stha	%l1,[%i1+0x002]%asi	! Mem[0000000010041400] = bdc05b0e
!	%f0  = c76d6721 0e5b9083, %l3 = 000000000000b341
!	Mem[0000000010101438] = 4d55d0012de6dbd2
	add	%i4,0x038,%g1
	stda	%f0,[%g1+%l3]ASI_PST32_P ! Mem[0000000010101438] = 4d55d0010e5b9083
!	Mem[0000000010141400] = 21676dc7, %l5 = 000000000000005a
	ldstuba	[%i5+%g0]0x88,%l5	! %l5 = 000000c7000000ff
!	%l0 = 00000000000000ff, Mem[0000000030181408] = d01900dd82abd71c
	stxa	%l0,[%i6+%o4]0x89	! Mem[0000000030181408] = 00000000000000ff
!	Mem[00000000100c1408] = fb4a979d, %l0 = 00000000000000ff
	ldstuba	[%i3+%o4]0x88,%l0	! %l0 = 0000009d000000ff
!	%l6 = 82fa1028, %l7 = 00000000, Mem[0000000030081410] = a69f3341 de1a0dc9
	stda	%l6,[%i2+%o5]0x89	! Mem[0000000030081410] = 82fa1028 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030001400] = cbc11310, %l1 = 0000000083905b0e
	ldsba	[%i0+%g0]0x81,%l1	! %l1 = ffffffffffffffcb

p0_label_15:
!	Mem[0000000021800000] = 9933c8c8, %l1 = ffffffffffffffcb
	lduh	[%o3+%g0],%l1		! %l1 = 0000000000009933
!	Mem[0000000030101410] = 67be2b5a, %f3  = e545dd67
	lda	[%i4+%o5]0x89,%f3 	! %f3 = 67be2b5a
!	Mem[0000000030041400] = f647d8f4, %l2 = 000000001ea455dc
	ldsba	[%i1+%g0]0x89,%l2	! %l2 = fffffffffffffff4
!	Mem[0000000010141410] = 1da153d8, %l5 = 00000000000000c7
	ldsha	[%i5+%o5]0x88,%l5	! %l5 = 00000000000053d8
!	Mem[0000000010081400] = 83905b0e, %l2 = fffffffffffffff4
	lduba	[%i2+%g0]0x88,%l2	! %l2 = 000000000000000e
!	Mem[0000000010001434] = d3bfcf8b, %l5 = 00000000000053d8
	lduwa	[%i0+0x034]%asi,%l5	! %l5 = 00000000d3bfcf8b
!	Mem[0000000030141410] = 00000044, %l4 = 000000000692c0bd
	lduwa	[%i5+%o5]0x89,%l4	! %l4 = 0000000000000044
!	Mem[0000000030141400] = 49399308, %l7 = 0000000000000000
	lduba	[%i5+%g0]0x81,%l7	! %l7 = 0000000000000049
!	Mem[0000000030181410] = cb4a43821da1ffff, %f26 = 4cef955e c5fcce28
	ldda	[%i6+%o5]0x89,%f26	! %f26 = cb4a4382 1da1ffff
!	Starting 10 instruction Store Burst
!	Mem[0000000010101410] = ff2de931, %l3 = 000000000000b341
	swapa	[%i4+%o5]0x80,%l3	! %l3 = 00000000ff2de931

!	Check Point 3 for processor 0

	set	p0_check_pt_data_3,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 000000000000009d
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 0000000000009933
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 000000000000000e
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 00000000ff2de931
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 0000000000000044
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 00000000d3bfcf8b
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 0000000082fa1028
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 0000000000000049
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = c76d6721 0e5b9083
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x50],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = 44000000 67be2b5a
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x58],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = d853a11d d2c70061
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x60],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = ff795814 f47ca02d
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x68],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = 348aa427 ffffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x70],%g3
	std	%f16,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f16 = 5a2bbe67 c81a59ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf16,%g1
	ldx	[%g4+0x78],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = cb4a4382 1da1ffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1

!	Check Point 3 completed


p0_label_16:
!	%f16 = 5a2bbe67 c81a59ff 441a1d72 0692c0bd
!	%f20 = c76d6721 3437cf0c b7262298 96c4e57d
!	%f24 = 40fab722 33558b0e cb4a4382 1da1ffff
!	%f28 = cdeceb5d ba536bbd ea64bfd9 455ba4ec
	stda	%f16,[%i4]ASI_BLK_AIUP	! Block Store to 0000000010101400
!	Mem[0000000030141408] = 4cef955e, %l4 = 0000000000000044
	swapa	[%i5+%o4]0x81,%l4	! %l4 = 000000004cef955e
!	%f12 = fa62794f 0000003a, %l7 = 0000000000000049
!	Mem[0000000030081410] = 2810fa8200000000
	add	%i2,0x010,%g1
	stda	%f12,[%g1+%l7]ASI_PST8_S ! Mem[0000000030081410] = 2862fa820000003a
!	%l5 = 00000000d3bfcf8b, Mem[0000000010101420] = 40fab72233558b0e, %asi = 80
	stxa	%l5,[%i4+0x020]%asi	! Mem[0000000010101420] = 00000000d3bfcf8b
!	Mem[00000000300c1410] = 009f455a, %l1 = 0000000000009933
	ldstuba	[%i3+%o5]0x89,%l1	! %l1 = 0000005a000000ff
!	%l5 = 00000000d3bfcf8b, Mem[00000000201c0000] = fdf39b8f, %asi = 80
	stha	%l5,[%o0+0x000]%asi	! Mem[00000000201c0000] = cf8b9b8f
!	Mem[000000001014140d] = e545dd67, %l3 = 00000000ff2de931
	ldstub	[%i5+0x00d],%l3		! %l3 = 00000045000000ff
!	%f16 = 5a2bbe67 c81a59ff 441a1d72 0692c0bd
!	%f20 = c76d6721 3437cf0c b7262298 96c4e57d
!	%f24 = 40fab722 33558b0e cb4a4382 1da1ffff
!	%f28 = cdeceb5d ba536bbd ea64bfd9 455ba4ec
	stda	%f16,[%i2]ASI_BLK_AIUSL	! Block Store to 0000000030081400
!	Mem[0000000010041410] = a89537ff, %l1 = 000000000000005a
	ldstuba	[%i1+%o5]0x88,%l1	! %l1 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = a89537ff, %l4 = 000000004cef955e
	ldsha	[%i1+%o5]0x88,%l4	! %l4 = 00000000000037ff

p0_label_17:
!	Mem[0000000010041408] = 0873ff00, %l7 = 0000000000000049
	ldsha	[%i1+%o4]0x88,%l7	! %l7 = ffffffffffffff00
!	Mem[00000000100c1418] = a4590319f9fbe3e0, %l5 = 00000000d3bfcf8b
	ldxa	[%i3+0x018]%asi,%l5	! %l5 = a4590319f9fbe3e0
!	Mem[0000000010181400] = 00000089, %l2 = 000000000000000e
	ldsha	[%i6+%g0]0x88,%l2	! %l2 = 0000000000000089
!	Mem[0000000030101400] = dc55a41e, %f15 = 7ae32cb8
	lda	[%i4+%g0]0x81,%f15	! %f15 = dc55a41e
	membar	#Sync			! Added by membar checker (5)
!	Mem[0000000030081408] = 0692c0bd, %l5 = a4590319f9fbe3e0
	lduha	[%i2+%o4]0x89,%l5	! %l5 = 000000000000c0bd
!	Mem[0000000010181400] = 89000000, %l7 = ffffffffffffff00
	ldswa	[%i6+%g0]0x80,%l7	! %l7 = ffffffff89000000
!	Mem[0000000021800140] = 7312ef3d, %l6 = 0000000082fa1028
	ldsba	[%o3+0x140]%asi,%l6	! %l6 = 0000000000000073
!	Mem[0000000010001408] = ffffffff, %f8  = 031a783d
	lda	[%i0+%o4]0x88,%f8 	! %f8 = ffffffff
!	Mem[0000000021800100] = d03e4a7a, %l3 = 0000000000000045
	ldub	[%o3+0x100],%l3		! %l3 = 00000000000000d0
!	Starting 10 instruction Store Burst
!	%l1 = 00000000000000ff, Mem[0000000030081410] = 3437cf0c
	stba	%l1,[%i2+%o5]0x89	! Mem[0000000030081410] = 3437cfff

p0_label_18:
!	%f12 = fa62794f, Mem[0000000030181410] = 1da1ffff
	sta	%f12,[%i6+%o5]0x89	! Mem[0000000030181410] = fa62794f
!	%l0 = 000000000000009d, Mem[0000000030001408] = 147762c2
	stba	%l0,[%i0+%o4]0x81	! Mem[0000000030001408] = 9d7762c2
!	%l0 = 000000000000009d, Mem[0000000010181408] = 5a459f00b8528a1c
	stxa	%l0,[%i6+%o4]0x80	! Mem[0000000010181408] = 000000000000009d
!	Mem[0000000010141400] = 21676dff, %l2 = 0000000000000089
	ldstuba	[%i5+%g0]0x88,%l2	! %l2 = 000000ff000000ff
!	Mem[0000000030101400] = 1ea455dc, %l2 = 00000000000000ff
	ldstuba	[%i4+%g0]0x89,%l2	! %l2 = 000000dc000000ff
!	%f14 = 3498af52 dc55a41e, Mem[00000000300c1410] = 009f45ff 6f64bbd1
	stda	%f14,[%i3+%o5]0x89	! Mem[00000000300c1410] = 3498af52 dc55a41e
!	Mem[0000000010141400] = ff6d6721, %l1 = 00000000000000ff
	ldstuba	[%i5+%g0]0x80,%l1	! %l1 = 000000ff000000ff
!	Mem[00000000100c1400] = d6ffffff ff000000, %l4 = 000037ff, %l5 = 0000c0bd
	ldda	[%i3+%g0]0x80,%l4	! %l4 = 00000000d6ffffff 00000000ff000000
!	Mem[0000000010141408] = d9bf89ff, %l5 = 00000000ff000000
	ldstuba	[%i5+%o4]0x88,%l5	! %l5 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101438] = ea64bfd9, %l2 = 00000000000000dc
	lduh	[%i4+0x03a],%l2		! %l2 = 000000000000bfd9

p0_label_19:
!	Mem[0000000030101410] = 67be2b5a, %l2 = 000000000000bfd9
	ldsba	[%i4+%o5]0x89,%l2	! %l2 = 000000000000005a
!	Mem[00000000100c1418] = a4590319, %l1 = 00000000000000ff
	lduha	[%i3+0x01a]%asi,%l1	! %l1 = 0000000000000319
!	Mem[00000000100c1400] = ffffffd6, %l5 = 00000000000000ff
	lduba	[%i3+%g0]0x88,%l5	! %l5 = 00000000000000d6
!	Mem[00000000100c1420] = 00000044 00000061, %l2 = 0000005a, %l3 = 000000d0
	ldda	[%i3+0x020]%asi,%l2	! %l2 = 0000000000000044 0000000000000061
!	Mem[0000000010001430] = 130fe697, %l0 = 000000000000009d
	lduwa	[%i0+0x030]%asi,%l0	! %l0 = 00000000130fe697
!	Mem[00000000300c1408] = bdc09206, %l0 = 00000000130fe697
	lduba	[%i3+%o4]0x81,%l0	! %l0 = 00000000000000bd
!	Mem[00000000100c1400] = 000000ffffffffd6, %f20 = c76d6721 3437cf0c
	ldda	[%i3+%g0]0x88,%f20	! %f20 = 000000ff ffffffd6
!	Mem[0000000020800000] = 824c7fc1, %l7 = ffffffff89000000
	lduba	[%o1+0x000]%asi,%l7	! %l7 = 0000000000000082
!	Mem[0000000010141428] = 348aa427, %l4 = 00000000d6ffffff
	ldsh	[%i5+0x028],%l4		! %l4 = 000000000000348a
!	Starting 10 instruction Store Burst
!	Mem[0000000010181400] = 00000089, %l1 = 0000000000000319
	ldstuba	[%i6+%g0]0x88,%l1	! %l1 = 00000089000000ff

p0_label_20:
!	Mem[0000000030001400] = cbc11310, %l4 = 000000000000348a
	swapa	[%i0+%g0]0x81,%l4	! %l4 = 00000000cbc11310
!	Code Fragment 3
p0_fragment_2:
!	%l0 = 00000000000000bd
	setx	0x2c0481dff360fcfe,%g7,%l0 ! %l0 = 2c0481dff360fcfe
!	%l1 = 0000000000000089
	setx	0xe246d127f7eed430,%g7,%l1 ! %l1 = e246d127f7eed430
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 2c0481dff360fcfe
	setx	0x4c09e79782fc3a38,%g7,%l0 ! %l0 = 4c09e79782fc3a38
!	%l1 = e246d127f7eed430
	setx	0x4dae946873f7e720,%g7,%l1 ! %l1 = 4dae946873f7e720
!	Mem[0000000030081410] = 3437cfff, %l2 = 0000000000000044
	ldstuba	[%i2+%o5]0x89,%l2	! %l2 = 000000ff000000ff
!	Mem[0000000030181410] = 4f7962fa, %l7 = 0000000000000082
	swapa	[%i6+%o5]0x81,%l7	! %l7 = 000000004f7962fa
!	%l1 = 4dae946873f7e720, Mem[0000000010081400] = 0e5b9083
	stwa	%l1,[%i2+%g0]0x80	! Mem[0000000010081400] = 73f7e720
!	%l6 = 0000000000000073, Mem[0000000010041418] = 00000082ffffa11d
	stx	%l6,[%i1+0x018]		! Mem[0000000010041418] = 0000000000000073
!	Mem[0000000030001408] = c262779d, %l5 = 00000000000000d6
	swapa	[%i0+%o4]0x89,%l5	! %l5 = 00000000c262779d
!	%l3 = 0000000000000061, Mem[0000000030001408] = d6000000
	stwa	%l3,[%i0+%o4]0x81	! Mem[0000000030001408] = 00000061
!	Mem[0000000010081408] = 1dfeb2e3, %l0 = 4c09e79782fc3a38
	swapa	[%i2+%o4]0x80,%l0	! %l0 = 000000001dfeb2e3
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = d2c70061, %l3 = 0000000000000061
	lduha	[%i0+%o5]0x89,%l3	! %l3 = 0000000000000061

!	Check Point 4 for processor 0

	set	p0_check_pt_data_4,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 000000001dfeb2e3
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 4dae946873f7e720
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 0000000000000061
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 00000000cbc11310
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 00000000c262779d
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 0000000000000073
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 000000004f7962fa
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = 44000000 67be2b5a
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x50],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = d853a11d d2c70061
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x58],%g3
	std	%f8,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f8 = ffffffff b6b67068
	bne	%xcc,p0_freg_check_fail
	mov	0xf08,%g1
	ldx	[%g4+0x60],%g3
	std	%f14,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f14 = 3498af52 dc55a41e
	bne	%xcc,p0_freg_check_fail
	mov	0xf14,%g1
	ldx	[%g4+0x68],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = 000000ff ffffffd6
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1

!	Check Point 4 completed


p0_label_21:
!	Mem[0000000010001430] = 130fe697, %l5 = 00000000c262779d
	lduwa	[%i0+0x030]%asi,%l5	! %l5 = 00000000130fe697
!	Mem[00000000218001c0] = 39ba67be, %l7 = 000000004f7962fa
	lduba	[%o3+0x1c1]%asi,%l7	! %l7 = 00000000000000ba
!	Mem[00000000211c0000] = b341b5d7, %l5 = 00000000130fe697
	lduh	[%o2+%g0],%l5		! %l5 = 000000000000b341
!	Mem[0000000010141410] = d853a11d, %l2 = 00000000000000ff
	lduba	[%i5+%o5]0x80,%l2	! %l2 = 00000000000000d8
!	Mem[0000000030101400] = 1ea455ff, %l2 = 00000000000000d8
	ldsha	[%i4+%g0]0x89,%l2	! %l2 = 00000000000055ff
!	Mem[0000000030101408] = 721d1a44, %l1 = 4dae946873f7e720
	lduwa	[%i4+%o4]0x89,%l1	! %l1 = 00000000721d1a44
!	Mem[0000000010181418] = 769fac2dc511fcb3, %l5 = 000000000000b341
	ldx	[%i6+0x018],%l5		! %l5 = 769fac2dc511fcb3
!	Mem[00000000218001c0] = 39ba67be, %l0 = 000000001dfeb2e3
	lduha	[%o3+0x1c0]%asi,%l0	! %l0 = 00000000000039ba
!	Mem[0000000030181400] = 1da153d8 9d60522b, %l2 = 000055ff, %l3 = 00000061
	ldda	[%i6+%g0]0x81,%l2	! %l2 = 000000001da153d8 000000009d60522b
!	Starting 10 instruction Store Burst
!	%l2 = 000000001da153d8, Mem[0000000010101410] = 21676dc7
	stwa	%l2,[%i4+%o5]0x88	! Mem[0000000010101410] = 1da153d8

p0_label_22:
!	Mem[0000000010041408] = 0873ff00, %l0 = 00000000000039ba
	swapa	[%i1+%o4]0x88,%l0	! %l0 = 000000000873ff00
!	Mem[00000000100c1410] = da947aff, %l5 = 769fac2dc511fcb3
	swapa	[%i3+%o5]0x88,%l5	! %l5 = 00000000da947aff
!	%f16 = 5a2bbe67 c81a59ff, %l2 = 000000001da153d8
!	Mem[0000000030141410] = 4400000074b206ed
	add	%i5,0x010,%g1
	stda	%f16,[%g1+%l2]ASI_PST16_SL ! Mem[0000000030141410] = 4400000074b22b5a
!	Mem[0000000030181400] = d853a11d, %l0 = 000000000873ff00
	ldstuba	[%i6+%g0]0x89,%l0	! %l0 = 0000001d000000ff
!	Mem[0000000030101408] = 721d1a44, %l2 = 000000001da153d8
	ldstuba	[%i4+%o4]0x89,%l2	! %l2 = 00000044000000ff
!	%f30 = ea64bfd9, Mem[0000000010181408] = 00000000
	sta	%f30,[%i6+%o4]0x80	! Mem[0000000010181408] = ea64bfd9
!	Mem[0000000030081408] = 0692c0bd, %l7 = 00000000000000ba
	ldstuba	[%i2+%o4]0x89,%l7	! %l7 = 000000bd000000ff
!	%l5 = 00000000da947aff, Mem[000000001004141b] = 00000000
	stb	%l5,[%i1+0x01b]		! Mem[0000000010041418] = 000000ff
!	%f22 = b7262298, Mem[0000000010141410] = 1da153d8
	sta	%f22,[%i5+%o5]0x88	! Mem[0000000010141410] = b7262298
!	Starting 10 instruction Load Burst
!	Mem[0000000010001404] = 8b7274a2, %l6 = 0000000000000073
	ldswa	[%i0+0x004]%asi,%l6	! %l6 = ffffffff8b7274a2

p0_label_23:
!	Mem[0000000010181408] = d9bf64ea, %l5 = 00000000da947aff
	ldsha	[%i6+%o4]0x88,%l5	! %l5 = 00000000000064ea
!	Mem[0000000030141410] = 5a2bb27400000044, %f14 = 3498af52 dc55a41e
	ldda	[%i5+%o5]0x89,%f14	! %f14 = 5a2bb274 00000044
!	Mem[0000000010181404] = 1da1ffff, %f11 = ffffffff
	lda	[%i6+0x004]%asi,%f11	! %f11 = 1da1ffff
!	Mem[0000000030101408] = ff1a1d720692c0bd, %f0  = c76d6721 0e5b9083
	ldda	[%i4+%o4]0x81,%f0 	! %f0  = ff1a1d72 0692c0bd
!	Mem[00000000300c1410] = 1ea455dc, %l4 = 00000000cbc11310
	lduwa	[%i3+%o5]0x81,%l4	! %l4 = 000000001ea455dc
!	Mem[0000000030001410] = 6100c7d2, %l2 = 0000000000000044
	lduha	[%i0+%o5]0x81,%l2	! %l2 = 0000000000006100
!	Mem[00000000100c1400] = 000000ffffffffd6, %f12 = fa62794f 0000003a
	ldda	[%i3+%g0]0x88,%f12	! %f12 = 000000ff ffffffd6
!	Mem[0000000030141408] = 44000000, %l6 = ffffffff8b7274a2
	lduha	[%i5+%o4]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000010081400] = 20e7f773, %f18 = 441a1d72
	lda	[%i2+%g0]0x88,%f18	! %f18 = 20e7f773
!	Starting 10 instruction Store Burst
!	Mem[0000000030001400] = 8a340000, %l6 = 0000000000000000
	ldstuba	[%i0+%g0]0x89,%l6	! %l6 = 00000000000000ff

p0_label_24:
!	Mem[0000000010081408] = 383afc82, %l5 = 00000000000064ea
	ldstuba	[%i2+%o4]0x88,%l5	! %l5 = 00000082000000ff
!	%l3 = 000000009d60522b, Mem[00000000211c0000] = b341b5d7, %asi = 80
	stha	%l3,[%o2+0x000]%asi	! Mem[00000000211c0000] = 522bb5d7
!	%f28 = cdeceb5d ba536bbd, Mem[0000000030081408] = 0692c0ff 441a1d72
	stda	%f28,[%i2+%o4]0x89	! Mem[0000000030081408] = cdeceb5d ba536bbd
!	Mem[0000000010141400] = ff6d6721, %l2 = 0000000000006100
	swapa	[%i5+%g0]0x80,%l2	! %l2 = 00000000ff6d6721
!	%l4 = 1ea455dc, %l5 = 00000082, Mem[0000000010141408] = d9bf89ff 67ddffe5
	stda	%l4,[%i5+%o4]0x88	! Mem[0000000010141408] = 1ea455dc 00000082
!	Mem[0000000010141410] = b7262298, %l2 = 00000000ff6d6721
	swapa	[%i5+%o5]0x88,%l2	! %l2 = 00000000b7262298
!	%l4 = 000000001ea455dc, Mem[00000000201c0000] = cf8b9b8f
	stb	%l4,[%o0+%g0]		! Mem[00000000201c0000] = dc8b9b8f
!	%f28 = cdeceb5d ba536bbd, Mem[0000000030001410] = d2c70061 3c17bc6a
	stda	%f28,[%i0+%o5]0x89	! Mem[0000000030001410] = cdeceb5d ba536bbd
!	%l4 = 1ea455dc, %l5 = 00000082, Mem[0000000030181400] = d853a1ff 2b52609d
	stda	%l4,[%i6+%g0]0x89	! Mem[0000000030181400] = 1ea455dc 00000082
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = ff6d6721, %l2 = 00000000b7262298
	lduha	[%i5+%o5]0x88,%l2	! %l2 = 0000000000006721

p0_label_25:
!	Mem[0000000030001410] = ba536bbd, %f19 = 0692c0bd
	lda	[%i0+%o5]0x89,%f19	! %f19 = ba536bbd
!	Mem[00000000211c0000] = 522bb5d7, %l1 = 00000000721d1a44
	lduba	[%o2+0x001]%asi,%l1	! %l1 = 000000000000002b
!	Mem[0000000010181414] = 5debeccd, %l7 = 00000000000000bd
	ldsba	[%i6+0x015]%asi,%l7	! %l7 = ffffffffffffffeb
!	%l3 = 000000009d60522b, %l5 = 0000000000000082, %l4 = 000000001ea455dc
	andn	%l3,%l5,%l4		! %l4 = 000000009d605229
!	Mem[00000000211c0000] = 522bb5d7, %l3 = 000000009d60522b
	ldsha	[%o2+0x000]%asi,%l3	! %l3 = 000000000000522b
!	Mem[0000000010181408] = ea64bfd9, %l1 = 000000000000002b
	ldswa	[%i6+%o4]0x80,%l1	! %l1 = ffffffffea64bfd9
!	Mem[0000000030041410] = b6000508f26e0110, %l2 = 0000000000006721
	ldxa	[%i1+%o5]0x81,%l2	! %l2 = b6000508f26e0110
!	Mem[0000000010101410] = d853a11d3437cf0c, %f14 = 5a2bb274 00000044
	ldda	[%i4+%o5]0x80,%f14	! %f14 = d853a11d 3437cf0c
!	Mem[0000000030041400] = f4d847f6 20110ca0 b5c330f2 b7e5e7d9
!	Mem[0000000030041410] = b6000508 f26e0110 ae0124bf 96bcaf58
!	Mem[0000000030041420] = 102f9d1b f650184e 0fb6e140 3d1c2039
!	Mem[0000000030041430] = 1390a3a7 325384bb c801c785 721d1a44
	ldda	[%i1]ASI_BLK_SL,%f16	! Block Load from 0000000030041400
!	Starting 10 instruction Store Burst
!	Mem[0000000010101410] = d853a11d, %l2 = b6000508f26e0110
	swapa	[%i4+%o5]0x80,%l2	! %l2 = 00000000d853a11d

!	Check Point 5 for processor 0

	set	p0_check_pt_data_5,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 000000000000001d
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = ffffffffea64bfd9
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 00000000d853a11d
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 000000000000522b
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 000000009d605229
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 0000000000000082
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 0000000000000000
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = ffffffffffffffeb
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = ff1a1d72 0692c0bd
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x50],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = 44000000 67be2b5a
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x58],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = 348aa427 1da1ffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x60],%g3
	std	%f12,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f12 = 000000ff ffffffd6
	bne	%xcc,p0_freg_check_fail
	mov	0xf12,%g1
	ldx	[%g4+0x68],%g3
	std	%f14,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f14 = d853a11d 3437cf0c
	bne	%xcc,p0_freg_check_fail
	mov	0xf14,%g1
	ldx	[%g4+0x70],%g3
	std	%f16,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f16 = a00c1120 f647d8f4
	bne	%xcc,p0_freg_check_fail
	mov	0xf16,%g1
	ldx	[%g4+0x78],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = d9e7e5b7 f230c3b5
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1
	ldx	[%g4+0x80],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = 10016ef2 080500b6
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1
	ldx	[%g4+0x88],%g3
	std	%f22,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f22 = 58afbc96 bf2401ae
	bne	%xcc,p0_freg_check_fail
	mov	0xf22,%g1
	ldx	[%g4+0x90],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = 4e1850f6 1b9d2f10
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1
	ldx	[%g4+0x98],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = 39201c3d 40e1b60f
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1
	ldx	[%g4+0xa0],%g3
	std	%f28,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f28 = bb845332 a7a39013
	bne	%xcc,p0_freg_check_fail
	mov	0xf28,%g1
	ldx	[%g4+0xa8],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = 441a1d72 85c701c8
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 5 completed


p0_label_26:
!	%f10 = 348aa427 1da1ffff, Mem[0000000010141408] = dc55a41e 82000000
	stda	%f10,[%i5+%o4]0x80	! Mem[0000000010141408] = 348aa427 1da1ffff
!	%l6 = 00000000, %l7 = ffffffeb, Mem[0000000010041420] = c6d1caf1 8d68389a
	std	%l6,[%i1+0x020]		! Mem[0000000010041420] = 00000000 ffffffeb
!	%l3 = 000000000000522b, Mem[00000000211c0001] = 522bb5d7, %asi = 80
	stba	%l3,[%o2+0x001]%asi	! Mem[00000000211c0000] = 522bb5d7
!	Mem[00000000100c1408] = ff974afb, %l5 = 0000000000000082
	ldstuba	[%i3+%o4]0x80,%l5	! %l5 = 000000ff000000ff
!	%l2 = 00000000d853a11d, Mem[0000000021800180] = aa532710
	sth	%l2,[%o3+0x180]		! Mem[0000000021800180] = a11d2710
!	%f21 = 080500b6, Mem[0000000030101400] = 1ea455ff
	sta	%f21,[%i4+%g0]0x89	! Mem[0000000030101400] = 080500b6
!	%l0 = 000000000000001d, Mem[0000000010001404] = 8b7274a2
	stw	%l0,[%i0+0x004]		! Mem[0000000010001404] = 0000001d
!	%l4 = 9d605229, %l5 = 000000ff, Mem[0000000010081410] = ffa87872 09c3a4a8
	stda	%l4,[%i2+%o5]0x80	! Mem[0000000010081410] = 9d605229 000000ff
!	Mem[0000000030141408] = 44000000, %l5 = 00000000000000ff
	ldstuba	[%i5+%o4]0x89,%l5	! %l5 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000020800040] = 6ed9e25a, %l7 = ffffffffffffffeb
	ldsba	[%o1+0x041]%asi,%l7	! %l7 = ffffffffffffffd9

p0_label_27:
!	Mem[0000000010101408] = 721d1a44, %l3 = 000000000000522b
	lduwa	[%i4+%o4]0x88,%l3	! %l3 = 00000000721d1a44
!	Mem[0000000030081408] = ba536bbd, %l1 = ffffffffea64bfd9
	lduba	[%i2+%o4]0x89,%l1	! %l1 = 00000000000000bd
!	Code Fragment 3
p0_fragment_3:
!	%l0 = 000000000000001d
	setx	0xb7eb2d7f82a7ae4b,%g7,%l0 ! %l0 = b7eb2d7f82a7ae4b
!	%l1 = 00000000000000bd
	setx	0x7090de77e6f7afde,%g7,%l1 ! %l1 = 7090de77e6f7afde
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = b7eb2d7f82a7ae4b
	setx	0x4f0bd1a875a5a177,%g7,%l0 ! %l0 = 4f0bd1a875a5a177
!	%l1 = 7090de77e6f7afde
	setx	0x1417fda01949ddac,%g7,%l1 ! %l1 = 1417fda01949ddac
!	Mem[0000000010101410] = 0ccf3734 10016ef2, %l6 = 00000000, %l7 = ffffffd9
	ldda	[%i4+%o5]0x88,%l6	! %l6 = 0000000010016ef2 000000000ccf3734
!	Mem[0000000030101400] = b6000508, %l1 = 1417fda01949ddac
	lduha	[%i4+%g0]0x81,%l1	! %l1 = 000000000000b600
!	Mem[0000000010001410] = 00000000, %l2 = 00000000d853a11d
	ldswa	[%i0+%o5]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000030041400] = f4d847f6 20110ca0 b5c330f2 b7e5e7d9
!	Mem[0000000030041410] = b6000508 f26e0110 ae0124bf 96bcaf58
!	Mem[0000000030041420] = 102f9d1b f650184e 0fb6e140 3d1c2039
!	Mem[0000000030041430] = 1390a3a7 325384bb c801c785 721d1a44
	ldda	[%i1]ASI_BLK_AIUSL,%f16	! Block Load from 0000000030041400
!	Mem[0000000010041410] = ff3795a8052702e5, %f14 = d853a11d 3437cf0c
	ldda	[%i1+%o5]0x80,%f14	! %f14 = ff3795a8 052702e5
!	Mem[0000000010101408] = 441a1d72, %l3 = 00000000721d1a44
	lduha	[%i4+%o4]0x80,%l3	! %l3 = 000000000000441a
!	Starting 10 instruction Store Burst
!	Mem[0000000030081408] = bd6b53ba, %l5 = 0000000000000000
	ldstuba	[%i2+%o4]0x81,%l5	! %l5 = 000000bd000000ff

p0_label_28:
!	%l5 = 00000000000000bd, Mem[0000000010041400] = 0e5bc0bd
	stha	%l5,[%i1+%g0]0x88	! Mem[0000000010041400] = 0e5b00bd
!	Mem[0000000030001408] = 00000061, %l5 = 00000000000000bd
	swapa	[%i0+%o4]0x81,%l5	! %l5 = 0000000000000061
!	%l1 = 000000000000b600, Mem[00000000300c1400] = c81a59ff
	stwa	%l1,[%i3+%g0]0x89	! Mem[00000000300c1400] = 0000b600
!	%f7  = f47ca02d, Mem[0000000010141410] = 21676dff
	sta	%f7 ,[%i5+0x010]%asi	! Mem[0000000010141410] = f47ca02d
	membar	#Sync			! Added by membar checker (6)
!	%f7  = f47ca02d, Mem[0000000030041400] = f647d8f4
	sta	%f7 ,[%i1+%g0]0x89	! Mem[0000000030041400] = f47ca02d
!	%f23 = bf2401ae, Mem[0000000030101408] = ff1a1d72
	sta	%f23,[%i4+%o4]0x81	! Mem[0000000030101408] = bf2401ae
!	Mem[0000000030101400] = b6000508, %l7 = 000000000ccf3734
	ldstuba	[%i4+%g0]0x81,%l7	! %l7 = 000000b6000000ff
!	%l2 = 0000000000000000, Mem[00000000100c1408] = fb4a97ff
	stha	%l2,[%i3+%o4]0x88	! Mem[00000000100c1408] = fb4a0000
!	%l5 = 0000000000000061, Mem[0000000010101430] = cdeceb5dba536bbd, %asi = 80
	stxa	%l5,[%i4+0x030]%asi	! Mem[0000000010101430] = 0000000000000061
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = ff3795a8, %l3 = 000000000000441a
	ldswa	[%i1+%o5]0x80,%l3	! %l3 = ffffffffff3795a8

p0_label_29:
!	Mem[0000000010041408] = ba390000, %l3 = ffffffffff3795a8
	lduwa	[%i1+0x008]%asi,%l3	! %l3 = 00000000ba390000
!	Mem[0000000010001400] = 000000ff0000001d, %l0 = 4f0bd1a875a5a177
	ldxa	[%i0+%g0]0x80,%l0	! %l0 = 000000ff0000001d
!	Mem[00000000100c1410] = b3fc11c5, %l5 = 0000000000000061
	ldswa	[%i3+%o5]0x80,%l5	! %l5 = ffffffffb3fc11c5
!	Mem[00000000300c1410] = dc55a41e, %l5 = ffffffffb3fc11c5
	lduba	[%i3+%o5]0x89,%l5	! %l5 = 000000000000001e
!	Mem[00000000100c1408] = fb4a0000, %l5 = 000000000000001e
	ldsba	[%i3+%o4]0x88,%l5	! %l5 = 0000000000000000
!	Mem[00000000100c1408] = 9a1a650b fb4a0000, %l0 = 0000001d, %l1 = 0000b600
	ldda	[%i3+%o4]0x88,%l0	! %l0 = 00000000fb4a0000 000000009a1a650b
!	Mem[0000000030141408] = ff000044, %l0 = 00000000fb4a0000
	ldswa	[%i5+%o4]0x81,%l0	! %l0 = ffffffffff000044
!	Mem[0000000010081400] = da130a7f 20e7f773, %l0 = ff000044, %l1 = 9a1a650b
	ldda	[%i2+%g0]0x88,%l0	! %l0 = 0000000020e7f773 00000000da130a7f
!	Mem[0000000030101410] = 5a2bbe67, %f13 = ffffffd6
	lda	[%i4+%o5]0x81,%f13	! %f13 = 5a2bbe67
!	Starting 10 instruction Store Burst
!	%f16 = a00c1120 f647d8f4, Mem[0000000010001400] = ff000000 1d000000
	stda	%f16,[%i0+%g0]0x88	! Mem[0000000010001400] = a00c1120 f647d8f4

p0_label_30:
!	Mem[0000000030181408] = ff000000, %l7 = 00000000000000b6
	swapa	[%i6+%o4]0x81,%l7	! %l7 = 00000000ff000000
!	%f31 = 85c701c8, Mem[0000000010041400] = 0e5b00bd
	sta	%f31,[%i1+%g0]0x88	! Mem[0000000010041400] = 85c701c8
!	%l2 = 0000000000000000, Mem[0000000030101400] = ff000508794a8491
	stxa	%l2,[%i4+%g0]0x81	! Mem[0000000030101400] = 0000000000000000
!	%f30 = 441a1d72, Mem[0000000010001410] = 00000000
	sta	%f30,[%i0+%o5]0x80	! Mem[0000000010001410] = 441a1d72
!	Mem[0000000010081410] = 9d605229000000ff, %l2 = 0000000000000000, %l4 = 000000009d605229
	add	%i2,0x10,%g1
	casxa	[%g1]0x80,%l2,%l4	! %l4 = 9d605229000000ff
!	%f4  = d853a11d d2c70061, Mem[0000000030001408] = 000000bd 86496f75
	stda	%f4 ,[%i0+%o4]0x81	! Mem[0000000030001408] = d853a11d d2c70061
!	Mem[0000000010141410] = f47ca02d, %l5 = 0000000000000000
	ldstuba	[%i5+%o5]0x80,%l5	! %l5 = 000000f4000000ff
!	Mem[0000000021800141] = 7312ef3d, %l0 = 0000000020e7f773
	ldstuba	[%o3+0x141]%asi,%l0	! %l0 = 00000012000000ff
!	Mem[0000000010081408] = fffc3a38, %l5 = 00000000000000f4
	swapa	[%i2+%o4]0x80,%l5	! %l5 = 00000000fffc3a38
!	Starting 10 instruction Load Burst
!	Mem[0000000020800040] = 6ed9e25a, %l4 = 9d605229000000ff
	ldsb	[%o1+0x041],%l4		! %l4 = ffffffffffffffd9

!	Check Point 6 for processor 0

	set	p0_check_pt_data_6,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 0000000000000012
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 00000000da130a7f
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 0000000000000000
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 00000000ba390000
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = ffffffffffffffd9
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 00000000fffc3a38
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l7,%g2			! %l7 = 00000000ff000000
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x40],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = ff1a1d72 0692c0bd
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x48],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = ff795814 f47ca02d
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x50],%g3
	std	%f12,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f12 = 000000ff 5a2bbe67
	bne	%xcc,p0_freg_check_fail
	mov	0xf12,%g1
	ldx	[%g4+0x58],%g3
	std	%f14,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f14 = ff3795a8 052702e5
	bne	%xcc,p0_freg_check_fail
	mov	0xf14,%g1
	ldx	[%g4+0x60],%g3
	std	%f16,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f16 = a00c1120 f647d8f4
	bne	%xcc,p0_freg_check_fail
	mov	0xf16,%g1
	ldx	[%g4+0x68],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = d9e7e5b7 f230c3b5
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1
	ldx	[%g4+0x70],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = 10016ef2 080500b6
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1
	ldx	[%g4+0x78],%g3
	std	%f22,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f22 = 58afbc96 bf2401ae
	bne	%xcc,p0_freg_check_fail
	mov	0xf22,%g1
	ldx	[%g4+0x80],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = 4e1850f6 1b9d2f10
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1
	ldx	[%g4+0x88],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = 39201c3d 40e1b60f
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1
	ldx	[%g4+0x90],%g3
	std	%f28,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f28 = bb845332 a7a39013
	bne	%xcc,p0_freg_check_fail
	mov	0xf28,%g1
	ldx	[%g4+0x98],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = 441a1d72 85c701c8
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 6 completed


p0_label_31:
!	Mem[0000000010041408] = 000039ba, %l0 = 0000000000000012
	lduba	[%i1+%o4]0x88,%l0	! %l0 = 00000000000000ba
!	Mem[0000000010141420] = 031a783d b6b67068, %l2 = 00000000, %l3 = ba390000
	ldd	[%i5+0x020],%l2		! %l2 = 00000000031a783d 00000000b6b67068
!	Mem[0000000030141400] = 49399308, %l4 = ffffffffffffffd9
	lduwa	[%i5+%g0]0x81,%l4	! %l4 = 0000000049399308
!	Mem[0000000010081408] = 86ddcb5ff4000000, %l4 = 0000000049399308
	ldxa	[%i2+%o4]0x88,%l4	! %l4 = 86ddcb5ff4000000
!	Mem[0000000010181408] = d9bf64ea, %l6 = 0000000010016ef2
	lduwa	[%i6+%o4]0x88,%l6	! %l6 = 00000000d9bf64ea
!	Mem[0000000010041408] = 000039ba, %l4 = 86ddcb5ff4000000
	ldsha	[%i1+%o4]0x88,%l4	! %l4 = 00000000000039ba
!	Mem[0000000010101408] = 721d1a44, %f29 = a7a39013
	lda	[%i4+%o4]0x88,%f29	! %f29 = 721d1a44
!	Mem[0000000030141400] = 49399308, %l6 = 00000000d9bf64ea
	ldswa	[%i5+%g0]0x81,%l6	! %l6 = 0000000049399308
!	Mem[00000000300c1410] = 1ea455dc, %l5 = 00000000fffc3a38
	ldswa	[%i3+%o5]0x81,%l5	! %l5 = 000000001ea455dc
!	Starting 10 instruction Store Burst
!	Mem[0000000010141410] = ff7ca02d, %l6 = 0000000049399308
	ldstuba	[%i5+%o5]0x80,%l6	! %l6 = 000000ff000000ff

p0_label_32:
!	Mem[0000000010041428] = 71687c50099744c1, %l6 = 00000000000000ff, %l1 = 00000000da130a7f
	add	%i1,0x28,%g1
	casxa	[%g1]0x80,%l6,%l1	! %l1 = 71687c50099744c1
!	Mem[0000000010181408] = ea64bfd9, %l3 = 00000000b6b67068
	swapa	[%i6+%o4]0x80,%l3	! %l3 = 00000000ea64bfd9
!	Mem[0000000020800040] = 6ed9e25a, %l4 = 00000000000039ba
	ldstuba	[%o1+0x040]%asi,%l4	! %l4 = 0000006e000000ff
!	%l2 = 00000000031a783d, Mem[00000000300c1410] = 1ea455dc
	stha	%l2,[%i3+%o5]0x81	! Mem[00000000300c1410] = 783d55dc
!	%f28 = bb845332, Mem[0000000030141400] = 49399308
	sta	%f28,[%i5+%g0]0x81	! Mem[0000000030141400] = bb845332
!	Mem[0000000030181410] = 00000082, %l2 = 00000000031a783d
	swapa	[%i6+%o5]0x81,%l2	! %l2 = 0000000000000082
!	%l7 = 00000000ff000000, Mem[0000000010081404] = 7f0a13da
	stw	%l7,[%i2+0x004]		! Mem[0000000010081404] = ff000000
!	%l3 = 00000000ea64bfd9, Mem[000000001004140e] = 468285d3
	stb	%l3,[%i1+0x00e]		! Mem[000000001004140c] = 4682d9d3
!	%l2 = 0000000000000082, Mem[0000000030001408] = d853a11d
	stba	%l2,[%i0+%o4]0x81	! Mem[0000000030001408] = 8253a11d
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = 00b60000 c2885361, %l2 = 00000082, %l3 = ea64bfd9
	ldda	[%i3+%g0]0x81,%l2	! %l2 = 0000000000b60000 00000000c2885361

p0_label_33:
!	Mem[0000000030181410] = 3d781a03, %l6 = 00000000000000ff
	lduwa	[%i6+%o5]0x89,%l6	! %l6 = 000000003d781a03
!	Mem[0000000010181408] = b6b67068 0000009d, %l4 = 0000006e, %l5 = 1ea455dc
	ldda	[%i6+%o4]0x80,%l4	! %l4 = 00000000b6b67068 000000000000009d
!	Mem[00000000100c1438] = 00000061 77db6f55, %l2 = 00b60000, %l3 = c2885361
	ldd	[%i3+0x038],%l2		! %l2 = 0000000000000061 0000000077db6f55
!	Mem[0000000010141420] = 031a783d, %l7 = 00000000ff000000
	ldswa	[%i5+0x020]%asi,%l7	! %l7 = 00000000031a783d
!	Mem[0000000030081408] = ff6b53ba, %l1 = 71687c50099744c1
	ldsba	[%i2+%o4]0x81,%l1	! %l1 = ffffffffffffffff
!	Mem[00000000300c1410] = 783d55dc, %l5 = 000000000000009d
	ldsha	[%i3+%o5]0x81,%l5	! %l5 = 000000000000783d
!	Mem[000000001000142c] = d9d6ff56, %l6 = 000000003d781a03
	ldsh	[%i0+0x02c],%l6		! %l6 = ffffffffffffd9d6
!	Mem[0000000010041420] = 00000000, %l3 = 0000000077db6f55
	ldub	[%i1+0x020],%l3		! %l3 = 0000000000000000
!	Mem[0000000030101400] = 00000000, %l5 = 000000000000783d
	ldsba	[%i4+%g0]0x89,%l5	! %l5 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l1 = ffffffffffffffff, Mem[0000000010041400] = c801c785
	stwa	%l1,[%i1+%g0]0x80	! Mem[0000000010041400] = ffffffff

p0_label_34:
!	%f4  = d853a11d, Mem[0000000010181408] = b6b67068
	sta	%f4 ,[%i6+0x008]%asi	! Mem[0000000010181408] = d853a11d
!	Mem[0000000030041410] = b6000508, %l4 = 00000000b6b67068
	swapa	[%i1+%o5]0x81,%l4	! %l4 = 00000000b6000508
!	Mem[0000000030081400] = ff591ac8, %l4 = 00000000b6000508
	swapa	[%i2+%g0]0x81,%l4	! %l4 = 00000000ff591ac8
!	Mem[0000000010101400] = 5a2bbe67, %l0 = 00000000000000ba
	ldstuba	[%i4+%g0]0x80,%l0	! %l0 = 0000005a000000ff
!	%l2 = 0000000000000061, Mem[0000000010081410] = 9d605229000000ff
	stx	%l2,[%i2+%o5]		! Mem[0000000010081410] = 0000000000000061
!	Mem[0000000010041410] = ff3795a8, %l7 = 00000000031a783d
	ldstuba	[%i1+%o5]0x80,%l7	! %l7 = 000000ff000000ff
!	%f0  = ff1a1d72 0692c0bd 44000000 67be2b5a
!	%f4  = d853a11d d2c70061 ff795814 f47ca02d
!	%f8  = ffffffff b6b67068 348aa427 1da1ffff
!	%f12 = 000000ff 5a2bbe67 ff3795a8 052702e5
	stda	%f0,[%i1]ASI_BLK_PL	! Block Store to 0000000010041400
!	Mem[00000000100c1404] = ff000000, %l0 = 0000005a, %l5 = 00000000
	add	%i3,0x04,%g1
	casa	[%g1]0x80,%l0,%l5	! %l5 = 00000000ff000000
!	Mem[0000000030001400] = ff00348a, %l7 = 00000000000000ff
	swapa	[%i0+%g0]0x81,%l7	! %l7 = 00000000ff00348a
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = 00000044, %l3 = 0000000000000000
	ldstuba	[%i5+%o5]0x89,%l3	! %l3 = 00000044000000ff

p0_label_35:
!	Mem[0000000030141400] = 7adba270 325384bb, %l4 = ff591ac8, %l5 = ff000000
	ldda	[%i5+%g0]0x89,%l4	! %l4 = 00000000325384bb 000000007adba270
!	Mem[0000000020800040] = ffd9e25a, %l3 = 0000000000000044
	ldsha	[%o1+0x040]%asi,%l3	! %l3 = ffffffffffffffd9
!	Mem[0000000030181408] = 000000b6, %l3 = ffffffffffffffd9
	ldsba	[%i6+%o4]0x81,%l3	! %l3 = 0000000000000000
	membar	#Sync			! Added by membar checker (7)
!	Mem[0000000010041408] = 67be2b5a, %f16 = a00c1120
	lda	[%i1+%o4]0x88,%f16	! %f16 = 67be2b5a
!	Mem[0000000010181410] = cdeceb5dba536bbd, %f10 = 348aa427 1da1ffff
	ldda	[%i6+%o5]0x88,%f10	! %f10 = cdeceb5d ba536bbd
!	Mem[0000000010041408] = 5a2bbe67, %f2  = 44000000
	lda	[%i1+%o4]0x80,%f2 	! %f2 = 5a2bbe67
!	Mem[0000000020800040] = ffd9e25a, %l0 = 000000000000005a
	lduha	[%o1+0x040]%asi,%l0	! %l0 = 000000000000ffd9
!	Mem[00000000100c1400] = d6ffffff, %l1 = ffffffffffffffff
	ldsha	[%i3+%g0]0x80,%l1	! %l1 = ffffffffffffd6ff
!	Mem[0000000010001408] = ffffffff, %l1 = ffffffffffffd6ff
	ldsha	[%i0+%o4]0x80,%l1	! %l1 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l3 = 0000000000000000, Mem[00000000100c1400] = ffffffd6
	stha	%l3,[%i3+%g0]0x88	! Mem[00000000100c1400] = ffff0000

!	Check Point 7 for processor 0

	set	p0_check_pt_data_7,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 000000000000ffd9
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = ffffffffffffffff
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l3,%g2			! %l3 = 0000000000000000
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l4,%g2			! %l4 = 00000000325384bb
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l5,%g2			! %l5 = 000000007adba270
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l6,%g2			! %l6 = ffffffffffffd9d6
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l7,%g2			! %l7 = 00000000ff00348a
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x40],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = 5a2bbe67 67be2b5a
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x48],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = d853a11d d2c70061
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x50],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = cdeceb5d ba536bbd
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x58],%g3
	std	%f16,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f16 = 67be2b5a f647d8f4
	bne	%xcc,p0_freg_check_fail
	mov	0xf16,%g1
	ldx	[%g4+0x60],%g3
	std	%f28,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f28 = bb845332 721d1a44
	bne	%xcc,p0_freg_check_fail
	mov	0xf28,%g1

!	Check Point 7 completed


p0_label_36:
!	%l3 = 0000000000000000, Mem[0000000010081400] = 73f7e720
	stwa	%l3,[%i2+%g0]0x80	! Mem[0000000010081400] = 00000000
!	%f16 = 67be2b5a f647d8f4, Mem[0000000010081410] = 00000000 00000061
	stda	%f16,[%i2+%o5]0x80	! Mem[0000000010081410] = 67be2b5a f647d8f4
!	Mem[000000001000140d] = 00000074, %l6 = ffffffffffffd9d6
	ldstub	[%i0+0x00d],%l6		! %l6 = 00000000000000ff
!	%l5 = 000000007adba270, Mem[0000000030101408] = bf2401ae0692c0bd
	stxa	%l5,[%i4+%o4]0x81	! Mem[0000000030101408] = 000000007adba270
!	%l4 = 325384bb, %l5 = 7adba270, Mem[0000000010001418] = f17a36b8 5fca4fb3
	std	%l4,[%i0+0x018]		! Mem[0000000010001418] = 325384bb 7adba270
!	%l2 = 00000061, %l3 = 00000000, Mem[0000000010141410] = ff7ca02d 94e9022f
	stda	%l2,[%i5+%o5]0x80	! Mem[0000000010141410] = 00000061 00000000
!	%f14 = ff3795a8 052702e5, Mem[0000000010101410] = 10016ef2 0ccf3734
	stda	%f14,[%i4+%o5]0x88	! Mem[0000000010101410] = ff3795a8 052702e5
!	Mem[0000000010101408] = 441a1d72, %l0 = 000000000000ffd9
	ldstuba	[%i4+%o4]0x80,%l0	! %l0 = 00000044000000ff
!	Mem[00000000300c1400] = 0000b600, %l1 = ffffffffffffffff
	ldstuba	[%i3+%g0]0x89,%l1	! %l1 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = 522bb5d7, %l2 = 0000000000000061
	ldsb	[%o2+%g0],%l2		! %l2 = 0000000000000052

p0_label_37:
!	Mem[0000000030101400] = 00000000, %l6 = 0000000000000000
	ldsba	[%i4+%g0]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000030001410] = ba536bbd, %l6 = 0000000000000000
	ldsba	[%i0+%o5]0x89,%l6	! %l6 = ffffffffffffffbd
!	Mem[0000000010041400] = bdc09206, %l3 = 0000000000000000
	ldsha	[%i1+%g0]0x80,%l3	! %l3 = ffffffffffffbdc0
!	Mem[0000000030041400] = 2da07cf4, %l4 = 00000000325384bb
	ldsba	[%i1+%g0]0x81,%l4	! %l4 = 000000000000002d
!	Mem[00000000201c0000] = dc8b9b8f, %l1 = 0000000000000000
	lduh	[%o0+%g0],%l1		! %l1 = 000000000000dc8b
!	Mem[0000000020800000] = 824c7fc1, %l5 = 000000007adba270
	ldsh	[%o1+%g0],%l5		! %l5 = ffffffffffff824c
!	Mem[0000000030101400] = 00000000, %l5 = ffffffffffff824c
	ldswa	[%i4+%g0]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000021800100] = d03e4a7a, %l2 = 0000000000000052
	lduba	[%o3+0x100]%asi,%l2	! %l2 = 00000000000000d0
!	Mem[0000000010181428] = 8a7d31b3, %l0 = 0000000000000044
	lduh	[%i6+0x02a],%l0		! %l0 = 00000000000031b3
!	Starting 10 instruction Store Burst
!	%l2 = 00000000000000d0, Mem[0000000030101410] = 67be2b5a
	stwa	%l2,[%i4+%o5]0x89	! Mem[0000000030101410] = 000000d0

p0_label_38:
!	%f6  = ff795814 f47ca02d, %l7 = 00000000ff00348a
!	Mem[0000000030141418] = dd893e8c0a005f0c
	add	%i5,0x018,%g1
	stda	%f6,[%g1+%l7]ASI_PST32_S ! Mem[0000000030141418] = ff7958140a005f0c
!	%l1 = 000000000000dc8b, Mem[0000000021800040] = 9f179ae4
	stb	%l1,[%o3+0x040]		! Mem[0000000021800040] = 8b179ae4
!	%l2 = 00000000000000d0, Mem[000000001018141e] = c511fcb3, %asi = 80
	stba	%l2,[%i6+0x01e]%asi	! Mem[000000001018141c] = c511d0b3
!	Mem[0000000030001410] = bd6b53ba, %l0 = 00000000000031b3
	ldstuba	[%i0+%o5]0x81,%l0	! %l0 = 000000bd000000ff
!	%l7 = 00000000ff00348a, Mem[0000000021800041] = 8b179ae4, %asi = 80
	stba	%l7,[%o3+0x041]%asi	! Mem[0000000021800040] = 8b8a9ae4
!	%l7 = 00000000ff00348a, Mem[0000000010181400] = ff000000
	stwa	%l7,[%i6+%g0]0x80	! Mem[0000000010181400] = ff00348a
!	Mem[0000000010041408] = 67be2b5a, %l3 = ffffffffffffbdc0
	swapa	[%i1+%o4]0x88,%l3	! %l3 = 0000000067be2b5a
!	%f22 = 58afbc96 bf2401ae, Mem[0000000030181408] = b6000000 00000000
	stda	%f22,[%i6+%o4]0x89	! Mem[0000000030181408] = 58afbc96 bf2401ae
!	%f0  = ff1a1d72, Mem[0000000030141410] = 000000ff
	sta	%f0 ,[%i5+%o5]0x89	! Mem[0000000030141410] = ff1a1d72
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1434] = 5681b46c, %l2 = 00000000000000d0
	ldsw	[%i3+0x034],%l2		! %l2 = 000000005681b46c

p0_label_39:
!	Mem[0000000010101434] = 00000061, %l7 = 00000000ff00348a
	lduwa	[%i4+0x034]%asi,%l7	! %l7 = 0000000000000061
!	Mem[0000000010101410] = e5022705, %l7 = 0000000000000061
	lduwa	[%i4+%o5]0x80,%l7	! %l7 = 00000000e5022705
!	%l0 = 00000000000000bd, Mem[00000000211c0000] = 522bb5d7
	sth	%l0,[%o2+%g0]		! Mem[00000000211c0000] = 00bdb5d7
!	Mem[0000000010041410] = 6100c7d2, %l4 = 000000000000002d
	ldsba	[%i1+%o5]0x80,%l4	! %l4 = 0000000000000061
!	Mem[0000000030041400] = f47ca02d, %l3 = 0000000067be2b5a
	ldsba	[%i1+%g0]0x89,%l3	! %l3 = 000000000000002d
!	Mem[0000000030001410] = ff6b53ba, %f24 = 4e1850f6
	lda	[%i0+%o5]0x81,%f24	! %f24 = ff6b53ba
!	Mem[0000000010081408] = 000000f4, %l6 = ffffffffffffffbd
	ldsba	[%i2+%o4]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000030101410] = d0000000, %l6 = 0000000000000000
	ldswa	[%i4+%o5]0x81,%l6	! %l6 = ffffffffd0000000
!	Mem[0000000010001430] = 130fe697 d3bfcf8b, %l2 = 5681b46c, %l3 = 0000002d
	ldda	[%i0+0x030]%asi,%l2	! %l2 = 00000000130fe697 00000000d3bfcf8b
!	Starting 10 instruction Store Burst
!	%l1 = 000000000000dc8b, Mem[0000000030181408] = 58afbc96bf2401ae
	stxa	%l1,[%i6+%o4]0x89	! Mem[0000000030181408] = 000000000000dc8b

p0_label_40:
!	%l4 = 0000000000000061, Mem[0000000010041400] = 0692c0bd
	stwa	%l4,[%i1+%g0]0x88	! Mem[0000000010041400] = 00000061
!	%l2 = 130fe697, %l3 = d3bfcf8b, Mem[0000000010181410] = ba536bbd cdeceb5d
	stda	%l2,[%i6+%o5]0x88	! Mem[0000000010181410] = 130fe697 d3bfcf8b
!	%f31 = 85c701c8, Mem[0000000030001408] = 1da15382
	sta	%f31,[%i0+%o4]0x89	! Mem[0000000030001408] = 85c701c8
!	%l1 = 000000000000dc8b, Mem[0000000010001400] = f4d847f6
	stba	%l1,[%i0+%g0]0x80	! Mem[0000000010001400] = 8bd847f6
!	%l7 = 00000000e5022705, Mem[0000000010141410] = 61000000
	stba	%l7,[%i5+%o5]0x88	! Mem[0000000010141410] = 61000005
!	%l2 = 130fe697, %l3 = d3bfcf8b, Mem[0000000030141408] = 440000ff e4bf534d
	stda	%l2,[%i5+%o4]0x89	! Mem[0000000030141408] = 130fe697 d3bfcf8b
!	Mem[0000000030081400] = b6000508, %l0 = 00000000000000bd
	swapa	[%i2+%g0]0x81,%l0	! %l0 = 00000000b6000508
!	%l2 = 00000000130fe697, Mem[00000000100c1413] = b3fc11c5
	stb	%l2,[%i3+0x013]		! Mem[00000000100c1410] = b3fc1197
!	%f4  = d853a11d d2c70061, Mem[0000000030141410] = 721d1aff 74b22b5a
	stda	%f4 ,[%i5+%o5]0x81	! Mem[0000000030141410] = d853a11d d2c70061
!	Starting 10 instruction Load Burst
!	Mem[0000000010101420] = 00000000, %l6 = ffffffffd0000000
	ldub	[%i4+0x021],%l6		! %l6 = 0000000000000000

!	Check Point 8 for processor 0

	set	p0_check_pt_data_8,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 00000000b6000508
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 000000000000dc8b
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 00000000130fe697
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 00000000d3bfcf8b
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 0000000000000061
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
	cmp	%l7,%g2			! %l7 = 00000000e5022705
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = 5a2bbe67 67be2b5a
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x50],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = ff6b53ba 1b9d2f10
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1

!	Check Point 8 completed


p0_label_41:
!	Mem[0000000030001408] = c801c785, %f12 = 000000ff
	lda	[%i0+%o4]0x81,%f12	! %f12 = c801c785
	membar	#Sync			! Added by membar checker (8)
!	Mem[0000000030001400] = 000000ff c3071a44 c801c785 d2c70061
!	Mem[0000000030001410] = ff6b53ba 5debeccd 007bbbbd 835e80db
!	Mem[0000000030001420] = e3d6eb97 6685ec48 551ed02c e51eb7d3
!	Mem[0000000030001430] = 3f2cb25d 3e2dee16 22873e41 0bc8eac7
	ldda	[%i0]ASI_BLK_AIUSL,%f16	! Block Load from 0000000030001400
!	Mem[0000000010001408] = ffffffff, %l2 = 00000000130fe697
	ldsha	[%i0+%o4]0x80,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000010141408] = 348aa427, %l1 = 000000000000dc8b
	lduwa	[%i5+%o4]0x80,%l1	! %l1 = 00000000348aa427
!	Mem[0000000010081408] = 000000f4, %l2 = ffffffffffffffff
	ldsba	[%i2+%o4]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000030101410] = 4f550ab7000000d0, %f12 = c801c785 5a2bbe67
	ldda	[%i4+%o5]0x89,%f12	! %f12 = 4f550ab7 000000d0
!	Mem[0000000030081410] = ffcf3734, %l7 = 00000000e5022705
	ldsba	[%i2+%o5]0x81,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010101430] = 00000000, %f7  = f47ca02d
	ld	[%i4+0x030],%f7 	! %f7 = 00000000
!	Mem[0000000010101410] = ff3795a8052702e5, %l3 = 00000000d3bfcf8b
	ldxa	[%i4+%o5]0x88,%l3	! %l3 = ff3795a8052702e5
!	Starting 10 instruction Store Burst
!	%f0  = ff1a1d72 0692c0bd, Mem[0000000010181410] = 97e60f13 8bcfbfd3
	stda	%f0 ,[%i6+%o5]0x80	! Mem[0000000010181410] = ff1a1d72 0692c0bd

p0_label_42:
!	%f4  = d853a11d d2c70061, %l1 = 00000000348aa427
!	Mem[0000000010081410] = 67be2b5af647d8f4
	add	%i2,0x010,%g1
	stda	%f4,[%g1+%l1]ASI_PST8_PL ! Mem[0000000010081410] = 6100c75af6a1d8f4
!	%f1  = 0692c0bd, Mem[00000000100c1400] = ffff0000
	sta	%f1 ,[%i3+%g0]0x88	! Mem[00000000100c1400] = 0692c0bd
!	%f11 = ba536bbd, Mem[0000000030181410] = 3d781a03
	sta	%f11,[%i6+%o5]0x89	! Mem[0000000030181410] = ba536bbd
!	%l5 = 0000000000000000, Mem[0000000010081408] = 000000f4
	stba	%l5,[%i2+%o4]0x80	! Mem[0000000010081408] = 000000f4
!	%l6 = 0000000000000000, Mem[00000000201c0000] = dc8b9b8f, %asi = 80
	stha	%l6,[%o0+0x000]%asi	! Mem[00000000201c0000] = 00009b8f
!	Mem[0000000010181404] = 1da1ffff, %l6 = 0000000000000000, %asi = 80
	swapa	[%i6+0x004]%asi,%l6	! %l6 = 000000001da1ffff
!	%l5 = 0000000000000000, Mem[0000000021800081] = d8a93b1a, %asi = 80
	stba	%l5,[%o3+0x081]%asi	! Mem[0000000021800080] = d8003b1a
!	%l6 = 000000001da1ffff, Mem[00000000211c0000] = 00bdb5d7, %asi = 80
	stba	%l6,[%o2+0x000]%asi	! Mem[00000000211c0000] = ffbdb5d7
!	%l2 = 0000000000000000, Mem[0000000030081400] = bd000000
	stwa	%l2,[%i2+%g0]0x89	! Mem[0000000030081400] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = 8bdc0000, %l7 = ffffffffffffffff
	lduha	[%i6+%o4]0x81,%l7	! %l7 = 0000000000008bdc

p0_label_43:
!	Mem[0000000020800040] = ffd9e25a, %l5 = 0000000000000000
	lduh	[%o1+0x040],%l5		! %l5 = 000000000000ffd9
!	Mem[00000000100c1410] = b3fc1197, %l2 = 0000000000000000
	lduha	[%i3+%o5]0x80,%l2	! %l2 = 000000000000b3fc
!	Mem[0000000030001400] = 441a07c3ff000000, %l6 = 000000001da1ffff
	ldxa	[%i0+%g0]0x89,%l6	! %l6 = 441a07c3ff000000
!	Mem[0000000010001410] = 441a1d72, %l4 = 0000000000000061
	ldsba	[%i0+%o5]0x80,%l4	! %l4 = 0000000000000044
!	Mem[000000001010142c] = 1da1ffff, %l3 = ff3795a8052702e5
	ldsb	[%i4+0x02c],%l3		! %l3 = 000000000000001d
!	Mem[00000000300c1400] = ffb60000c2885361, %f4  = d853a11d d2c70061
	ldda	[%i3+%g0]0x81,%f4 	! %f4  = ffb60000 c2885361
!	Mem[00000000211c0000] = ffbdb5d7, %l0 = 00000000b6000508
	ldsba	[%o2+0x001]%asi,%l0	! %l0 = ffffffffffffffbd
!	Mem[0000000010141410] = 61000005, %l1 = 00000000348aa427
	ldswa	[%i5+%o5]0x88,%l1	! %l1 = 0000000061000005
!	Mem[0000000030081400] = 00000000 67be2b5a, %l6 = ff000000, %l7 = 00008bdc
	ldda	[%i2+%g0]0x81,%l6	! %l6 = 0000000000000000 0000000067be2b5a
!	Starting 10 instruction Store Burst
!	Mem[0000000010001408] = ffffffff, %l4 = 0000000000000044
	swapa	[%i0+%o4]0x88,%l4	! %l4 = 00000000ffffffff

p0_label_44:
!	Mem[0000000030041408] = f230c3b5, %l7 = 0000000067be2b5a
	swapa	[%i1+%o4]0x89,%l7	! %l7 = 00000000f230c3b5
!	%f4  = ffb60000 c2885361, %l2 = 000000000000b3fc
!	Mem[0000000010001400] = 8bd847f620110ca0
	stda	%f4,[%i0+%l2]ASI_PST32_PL ! Mem[0000000010001400] = 8bd847f620110ca0
!	Mem[0000000030141408] = 130fe697, %l6 = 0000000000000000
	swapa	[%i5+%o4]0x89,%l6	! %l6 = 00000000130fe697
!	Mem[00000000211c0001] = ffbdb5d7, %l3 = 000000000000001d
	ldstuba	[%o2+0x001]%asi,%l3	! %l3 = 000000bd000000ff
!	%f3  = 67be2b5a, Mem[0000000030141410] = d853a11d
	sta	%f3 ,[%i5+%o5]0x81	! Mem[0000000030141410] = 67be2b5a
!	%l4 = ffffffff, %l5 = 0000ffd9, Mem[00000000300c1400] = 0000b6ff 615388c2
	stda	%l4,[%i3+%g0]0x89	! Mem[00000000300c1400] = ffffffff 0000ffd9
!	%l0 = ffffffffffffffbd, Mem[0000000010041410] = d2c70061
	stwa	%l0,[%i1+%o5]0x88	! Mem[0000000010041410] = ffffffbd
!	%l6 = 00000000130fe697, Mem[0000000010141408] = 348aa427
	stwa	%l6,[%i5+%o4]0x80	! Mem[0000000010141408] = 130fe697
!	Mem[0000000010141430] = fa62794f0000003a, %l0 = ffffffffffffffbd, %l1 = 0000000061000005
	add	%i5,0x30,%g1
	casxa	[%g1]0x80,%l0,%l1	! %l1 = fa62794f0000003a
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = ff591ac867be2bff, %l1 = fa62794f0000003a
	ldxa	[%i4+%g0]0x88,%l1	! %l1 = ff591ac867be2bff

p0_label_45:
!	Mem[0000000030041400] = f47ca02d, %l0 = ffffffffffffffbd
	ldsha	[%i1+%g0]0x89,%l0	! %l0 = ffffffffffffa02d
!	Mem[0000000010041408] = c0bdffff, %l3 = 00000000000000bd
	ldsba	[%i1+%o4]0x80,%l3	! %l3 = ffffffffffffffc0
!	Mem[0000000010141410] = 00000000 61000005, %l2 = 0000b3fc, %l3 = ffffffc0
	ldda	[%i5+%o5]0x88,%l2	! %l2 = 0000000061000005 0000000000000000
!	Mem[0000000030101410] = d0000000, %l0 = ffffffffffffa02d
	lduha	[%i4+%o5]0x81,%l0	! %l0 = 000000000000d000
!	Mem[0000000030001400] = ff000000, %l1 = ff591ac867be2bff
	lduwa	[%i0+%g0]0x89,%l1	! %l1 = 00000000ff000000
!	Mem[0000000010101408] = ff1a1d72, %l1 = 00000000ff000000
	ldsha	[%i4+0x008]%asi,%l1	! %l1 = ffffffffffffff1a
!	Mem[00000000100c140c] = 0b651a9a, %l1 = ffffffffffffff1a
	ldsha	[%i3+0x00e]%asi,%l1	! %l1 = 0000000000001a9a
!	Mem[0000000030041410] = 6870b6b6, %l3 = 0000000000000000
	lduha	[%i1+%o5]0x89,%l3	! %l3 = 000000000000b6b6
!	Mem[0000000030101410] = d0000000, %l4 = 00000000ffffffff
	ldswa	[%i4+%o5]0x81,%l4	! %l4 = ffffffffd0000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030041408] = 67be2b5a, %l1 = 0000000000001a9a
	swapa	[%i1+%o4]0x89,%l1	! %l1 = 0000000067be2b5a

!	Check Point 9 for processor 0

	set	p0_check_pt_data_9,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 000000000000d000
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 0000000067be2b5a
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 0000000061000005
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 000000000000b6b6
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = ffffffffd0000000
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 000000000000ffd9
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 00000000130fe697
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 00000000f230c3b5
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = 5a2bbe67 67be2b5a
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x50],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = ffb60000 c2885361
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x58],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = ff795814 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x60],%g3
	std	%f12,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f12 = 4f550ab7 000000d0
	bne	%xcc,p0_freg_check_fail
	mov	0xf12,%g1
	ldx	[%g4+0x68],%g3
	std	%f16,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f16 = 441a07c3 ff000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf16,%g1
	ldx	[%g4+0x70],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = 6100c7d2 85c701c8
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1
	ldx	[%g4+0x78],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = cdeceb5d ba536bff
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1
	ldx	[%g4+0x80],%g3
	std	%f22,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f22 = db805e83 bdbb7b00
	bne	%xcc,p0_freg_check_fail
	mov	0xf22,%g1
	ldx	[%g4+0x88],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = 48ec8566 97ebd6e3
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1
	ldx	[%g4+0x90],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = d3b71ee5 2cd01e55
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1
	ldx	[%g4+0x98],%g3
	std	%f28,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f28 = 16ee2d3e 5db22c3f
	bne	%xcc,p0_freg_check_fail
	mov	0xf28,%g1
	ldx	[%g4+0xa0],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = c7eac80b 413e8722
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 9 completed


p0_label_46:
!	%l2 = 0000000061000005, Mem[0000000030181400] = dc55a41e
	stwa	%l2,[%i6+%g0]0x81	! Mem[0000000030181400] = 61000005
!	Mem[0000000010001408] = 4400000000ff0074, %l5 = 000000000000ffd9, %l6 = 00000000130fe697
	add	%i0,0x08,%g1
	casxa	[%g1]0x80,%l5,%l6	! %l6 = 4400000000ff0074
!	Mem[0000000030141408] = 00000000, %l1 = 0000000067be2b5a
	ldstuba	[%i5+%o4]0x81,%l1	! %l1 = 00000000000000ff
!	%l0 = 000000000000d000, Mem[0000000030141408] = d3bfcf8b000000ff
	stxa	%l0,[%i5+%o4]0x89	! Mem[0000000030141408] = 000000000000d000
!	%l3 = 000000000000b6b6, Mem[00000000100c1400] = 0692c0bd
	stha	%l3,[%i3+%g0]0x88	! Mem[00000000100c1400] = 0692b6b6
!	%f24 = 48ec8566 97ebd6e3, %l6 = 4400000000ff0074
!	Mem[00000000100c1420] = 0000004400000061
	add	%i3,0x020,%g1
	stda	%f24,[%g1+%l6]ASI_PST8_P ! Mem[00000000100c1420] = 00ec856600eb0061
!	%l0 = 000000000000d000, Mem[00000000100c1400] = b6b69206
	stwa	%l0,[%i3+%g0]0x80	! Mem[00000000100c1400] = 0000d000
!	%l6 = 00ff0074, %l7 = f230c3b5, Mem[00000000100c1408] = 00004afb 0b651a9a
	stda	%l6,[%i3+%o4]0x80	! Mem[00000000100c1408] = 00ff0074 f230c3b5
!	%f20 = cdeceb5d ba536bff, Mem[0000000010101408] = 721d1aff bdc09206
	stda	%f20,[%i4+%o4]0x88	! Mem[0000000010101408] = cdeceb5d ba536bff
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = 0692c0bd, %f9  = b6b67068
	lda	[%i3+%o4]0x89,%f9 	! %f9 = 0692c0bd

p0_label_47:
!	Mem[0000000010101410] = ff3795a8052702e5, %f6  = ff795814 00000000
	ldda	[%i4+%o5]0x88,%f6 	! %f6  = ff3795a8 052702e5
!	Mem[0000000010081408] = 000000f4, %l5 = 000000000000ffd9
	lduha	[%i2+%o4]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000010101410] = e5022705, %l1 = 0000000000000000
	lduba	[%i4+0x010]%asi,%l1	! %l1 = 00000000000000e5
!	Mem[0000000030181400] = 05000061, %l6 = 4400000000ff0074
	lduwa	[%i6+%g0]0x89,%l6	! %l6 = 0000000005000061
!	Mem[00000000100c1400] = 0000d000, %l1 = 00000000000000e5
	lduba	[%i3+%g0]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000030181410] = bd6b53ba, %l5 = 0000000000000000
	ldsba	[%i6+%o5]0x81,%l5	! %l5 = ffffffffffffffbd
!	Mem[0000000010141408] = 97e60f13, %l1 = 0000000000000000
	ldsha	[%i5+%o4]0x88,%l1	! %l1 = 0000000000000f13
!	Mem[00000000211c0000] = ffffb5d7, %l2 = 0000000061000005
	ldsha	[%o2+0x000]%asi,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000021800040] = 8b8a9ae4, %l6 = 0000000005000061
	lduba	[%o3+0x041]%asi,%l6	! %l6 = 000000000000008a
!	Starting 10 instruction Store Burst
!	%l3 = 000000000000b6b6, Mem[0000000030041408] = 9a1a0000
	stba	%l3,[%i1+%o4]0x81	! Mem[0000000030041408] = b61a0000

p0_label_48:
!	%l5 = ffffffffffffffbd, Mem[00000000300c1408] = 0692c0bd
	stwa	%l5,[%i3+%o4]0x89	! Mem[00000000300c1408] = ffffffbd
!	Mem[0000000020800041] = ffd9e25a, %l2 = ffffffffffffffff
	ldstuba	[%o1+0x041]%asi,%l2	! %l2 = 000000d9000000ff
!	%l4 = d0000000, %l5 = ffffffbd, Mem[0000000010041408] = c0bdffff 00000044
	std	%l4,[%i1+%o4]		! Mem[0000000010041408] = d0000000 ffffffbd
!	Mem[0000000030101408] = 00000000, %l1 = 0000000000000f13
	ldstuba	[%i4+%o4]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010001400] = 8bd847f6, %l0 = 000000000000d000
	swapa	[%i0+%g0]0x80,%l0	! %l0 = 000000008bd847f6
!	%f12 = 4f550ab7 000000d0, Mem[0000000030101410] = d0000000 b70a554f
	stda	%f12,[%i4+%o5]0x81	! Mem[0000000030101410] = 4f550ab7 000000d0
!	%l3 = 000000000000b6b6, Mem[0000000030141400] = 325384bb
	stwa	%l3,[%i5+%g0]0x89	! Mem[0000000030141400] = 0000b6b6
!	Mem[000000001004142c] = 27a48a34, %l4 = ffffffffd0000000, %asi = 80
	swapa	[%i1+0x02c]%asi,%l4	! %l4 = 0000000027a48a34
!	Mem[00000000100c1410] = b3fc1197, %l5 = ffffffffffffffbd
	ldstuba	[%i3+%o5]0x80,%l5	! %l5 = 000000b3000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = 0000d000, %l3 = 000000000000b6b6
	ldsba	[%i5+%o4]0x89,%l3	! %l3 = 0000000000000000

p0_label_49:
!	Mem[00000000300c1410] = 783d55dc, %l2 = 00000000000000d9
	lduha	[%i3+%o5]0x81,%l2	! %l2 = 000000000000783d
!	Mem[0000000010181400] = ff00348a00000000, %f16 = 441a07c3 ff000000
	ldda	[%i6+0x000]%asi,%f16	! %f16 = ff00348a 00000000
!	Mem[0000000010101408] = ff6b53ba, %f28 = 16ee2d3e
	lda	[%i4+%o4]0x80,%f28	! %f28 = ff6b53ba
!	Mem[00000000211c0000] = ffffb5d7, %l1 = 0000000000000000
	ldsh	[%o2+%g0],%l1		! %l1 = ffffffffffffffff
!	Mem[0000000020800000] = 824c7fc1, %l1 = ffffffffffffffff
	ldub	[%o1+0x001],%l1		! %l1 = 000000000000004c
!	Mem[00000000201c0000] = 00009b8f, %l2 = 000000000000783d
	lduh	[%o0+%g0],%l2		! %l2 = 0000000000000000
!	Mem[0000000030101408] = 000000ff, %l0 = 000000008bd847f6
	lduwa	[%i4+%o4]0x89,%l0	! %l0 = 00000000000000ff
!	%l2 = 0000000000000000, immed = 0000053e, %y  = 00000000
	smul	%l2,0x53e,%l5		! %l5 = 0000000000000000, %y = 00000000
!	Mem[0000000030141400] = 0000b6b6, %f30 = c7eac80b
	lda	[%i5+%g0]0x89,%f30	! %f30 = 0000b6b6
!	Starting 10 instruction Store Burst
!	Mem[000000001000143e] = 5df73ecc, %l0 = 00000000000000ff
	ldstub	[%i0+0x03e],%l0		! %l0 = 0000003e000000ff

p0_label_50:
!	Mem[00000000100c1408] = 00ff0074, %l1 = 000000000000004c
	swapa	[%i3+%o4]0x80,%l1	! %l1 = 0000000000ff0074
!	Mem[0000000010101410] = 052702e5, %l3 = 0000000000000000
	swapa	[%i4+%o5]0x88,%l3	! %l3 = 00000000052702e5
!	%l7 = 00000000f230c3b5, Mem[0000000010041400] = 61000000
	stba	%l7,[%i1+%g0]0x80	! Mem[0000000010041400] = b5000000
!	Mem[00000000100c1434] = 5681b46c, %l5 = 00000000, %l7 = f230c3b5
	add	%i3,0x34,%g1
	casa	[%g1]0x80,%l5,%l7	! %l7 = 000000005681b46c
!	%f30 = 0000b6b6 413e8722, Mem[0000000030101400] = 00000000 00000000
	stda	%f30,[%i4+%g0]0x89	! Mem[0000000030101400] = 0000b6b6 413e8722
!	Mem[0000000010181408] = d853a11d, %l6 = 000000000000008a
	swapa	[%i6+%o4]0x80,%l6	! %l6 = 00000000d853a11d
!	%f14 = ff3795a8 052702e5, Mem[00000000300c1410] = 783d55dc 52af9834
	stda	%f14,[%i3+%o5]0x81	! Mem[00000000300c1410] = ff3795a8 052702e5
!	%l6 = 00000000d853a11d, Mem[0000000030101408] = ff000000
	stha	%l6,[%i4+%o4]0x81	! Mem[0000000030101408] = a11d0000
!	Mem[0000000010141410] = 05000061, %l3 = 00000000052702e5
	swapa	[%i5+%o5]0x80,%l3	! %l3 = 0000000005000061
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = 000000b5, %l0 = 000000000000003e
	lduwa	[%i1+%g0]0x88,%l0	! %l0 = 00000000000000b5

!	Check Point 10 for processor 0

	set	p0_check_pt_data_10,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 00000000000000b5
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 0000000000ff0074
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 0000000000000000
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 0000000005000061
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l5,%g2			! %l5 = 0000000000000000
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l6,%g2			! %l6 = 00000000d853a11d
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x38],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = ff3795a8 052702e5
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x40],%g3
	std	%f8,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f8 = ffffffff 0692c0bd
	bne	%xcc,p0_freg_check_fail
	mov	0xf08,%g1
	ldx	[%g4+0x48],%g3
	std	%f16,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f16 = ff00348a 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf16,%g1
	ldx	[%g4+0x50],%g3
	std	%f28,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f28 = ff6b53ba 5db22c3f
	bne	%xcc,p0_freg_check_fail
	mov	0xf28,%g1
	ldx	[%g4+0x58],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = 0000b6b6 413e8722
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 10 completed


p0_label_51:
!	Mem[0000000010141408] = 130fe697, %f12 = 4f550ab7
	lda	[%i5+%o4]0x80,%f12	! %f12 = 130fe697
!	Mem[0000000010101400] = ff2bbe67c81a59ff, %l2 = 0000000000000000
	ldxa	[%i4+0x000]%asi,%l2	! %l2 = ff2bbe67c81a59ff
!	Mem[0000000030101400] = 413e8722, %l2 = ff2bbe67c81a59ff
	lduha	[%i4+%g0]0x89,%l2	! %l2 = 0000000000008722
!	Mem[0000000010181418] = 769fac2dc511d0b3, %l5 = 0000000000000000
	ldxa	[%i6+0x018]%asi,%l5	! %l5 = 769fac2dc511d0b3
!	Mem[0000000020800000] = 824c7fc1, %l1 = 0000000000ff0074
	lduha	[%o1+0x000]%asi,%l1	! %l1 = 000000000000824c
!	Mem[000000001000140c] = 00ff0074, %l7 = 000000005681b46c
	ldsha	[%i0+0x00e]%asi,%l7	! %l7 = 0000000000000074
!	Mem[00000000100c1408] = 4c000000, %l2 = 0000000000008722
	ldsha	[%i3+%o4]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000021800180] = a11d2710, %l3 = 0000000005000061
	ldsha	[%o3+0x180]%asi,%l3	! %l3 = ffffffffffffa11d
!	Mem[0000000010001400] = 0000d000 20110ca0, %l0 = 000000b5, %l1 = 0000824c
	ldda	[%i0+%g0]0x80,%l0	! %l0 = 000000000000d000 0000000020110ca0
!	Starting 10 instruction Store Burst
!	Mem[0000000010101400] = ff2bbe67, %l0 = 000000000000d000
	swapa	[%i4+%g0]0x80,%l0	! %l0 = 00000000ff2bbe67

p0_label_52:
!	%l4 = 0000000027a48a34, Mem[0000000030041410] = 6870b6b6
	stha	%l4,[%i1+%o5]0x89	! Mem[0000000030041410] = 68708a34
!	%l5 = 769fac2dc511d0b3, Mem[0000000010041410] = ffffffbd
	stwa	%l5,[%i1+%o5]0x88	! Mem[0000000010041410] = c511d0b3
!	Mem[0000000010001400] = 0000d000, %l7 = 0000000000000074
	ldstuba	[%i0+%g0]0x80,%l7	! %l7 = 00000000000000ff
	membar	#Sync			! Added by membar checker (9)
!	%l0 = 00000000ff2bbe67, Mem[0000000030001408] = c801c785d2c70061
	stxa	%l0,[%i0+%o4]0x81	! Mem[0000000030001408] = 00000000ff2bbe67
!	%l0 = ff2bbe67, %l1 = 20110ca0, Mem[0000000010001408] = 44000000 00ff0074
	stda	%l0,[%i0+%o4]0x80	! Mem[0000000010001408] = ff2bbe67 20110ca0
!	Mem[0000000010181410] = ff1a1d72, %l2 = 0000000000000000
	swapa	[%i6+%o5]0x80,%l2	! %l2 = 00000000ff1a1d72
!	%l3 = ffffffffffffa11d, Mem[0000000030041408] = b61a0000
	stwa	%l3,[%i1+%o4]0x81	! Mem[0000000030041408] = ffffa11d
!	%l2 = 00000000ff1a1d72, Mem[0000000010141400] = 00006100
	stba	%l2,[%i5+%g0]0x80	! Mem[0000000010141400] = 72006100
!	Mem[00000000201c0000] = 00009b8f, %l2 = 00000000ff1a1d72
	ldstub	[%o0+%g0],%l2		! %l2 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = 00000000, %l1 = 0000000020110ca0
	ldswa	[%i2+%g0]0x89,%l1	! %l1 = 0000000000000000

p0_label_53:
!	Mem[0000000010081408] = f4000000, %l2 = 0000000000000000
	ldswa	[%i2+%o4]0x88,%l2	! %l2 = fffffffff4000000
!	Mem[0000000030101408] = a11d0000, %l0 = 00000000ff2bbe67
	lduba	[%i4+%o4]0x81,%l0	! %l0 = 00000000000000a1
!	Mem[0000000030001400] = 441a07c3ff000000, %l0 = 00000000000000a1
	ldxa	[%i0+%g0]0x89,%l0	! %l0 = 441a07c3ff000000
!	Mem[0000000010141408] = 130fe697, %l3 = ffffffffffffa11d
	ldsha	[%i5+%o4]0x80,%l3	! %l3 = 000000000000130f
!	Mem[0000000010181434] = 6e6bb475, %l2 = fffffffff4000000
	ldswa	[%i6+0x034]%asi,%l2	! %l2 = 000000006e6bb475
!	Mem[0000000030101400] = 22873e41, %l0 = 441a07c3ff000000
	lduwa	[%i4+%g0]0x81,%l0	! %l0 = 0000000022873e41
!	Mem[0000000010081410] = f4d8a1f65ac70061, %l3 = 000000000000130f
	ldxa	[%i2+%o5]0x88,%l3	! %l3 = f4d8a1f65ac70061
!	Mem[0000000010181424] = a97d9677, %l3 = f4d8a1f65ac70061
	ldsh	[%i6+0x024],%l3		! %l3 = ffffffffffffa97d
!	Mem[0000000010001430] = 130fe697, %f12 = 130fe697
	ld	[%i0+0x030],%f12	! %f12 = 130fe697
!	Starting 10 instruction Store Burst
!	Mem[00000000201c0000] = ff009b8f, %l1 = 0000000000000000
	ldstub	[%o0+%g0],%l1		! %l1 = 000000ff000000ff

p0_label_54:
!	%f14 = ff3795a8 052702e5, %l1 = 00000000000000ff
!	Mem[0000000010181428] = 8a7d31b390266667
	add	%i6,0x028,%g1
	stda	%f14,[%g1+%l1]ASI_PST16_PL ! Mem[0000000010181428] = e5022705a89537ff
!	%l7 = 0000000000000000, Mem[0000000010141428] = 348aa427, %asi = 80
	stwa	%l7,[%i5+0x028]%asi	! Mem[0000000010141428] = 00000000
!	%f29 = 5db22c3f, Mem[0000000030041400] = 2da07cf4
	sta	%f29,[%i1+%g0]0x81	! Mem[0000000030041400] = 5db22c3f
!	Mem[000000001018140c] = 0000009d, %l5 = c511d0b3, %l3 = ffffa97d
	add	%i6,0x0c,%g1
	casa	[%g1]0x80,%l5,%l3	! %l3 = 000000000000009d
!	%l5 = 769fac2dc511d0b3, Mem[00000000100c142f] = cc34bfeb
	stb	%l5,[%i3+0x02f]		! Mem[00000000100c142c] = cc34bfb3
!	%l0 = 22873e41, %l1 = 000000ff, Mem[00000000300c1408] = ffffffbd 441a1d72
	stda	%l0,[%i3+%o4]0x89	! Mem[00000000300c1408] = 22873e41 000000ff
!	%f28 = ff6b53ba 5db22c3f, Mem[0000000010041408] = 000000d0 bdffffff
	stda	%f28,[%i1+%o4]0x88	! Mem[0000000010041408] = ff6b53ba 5db22c3f
!	%l6 = d853a11d, %l7 = 00000000, Mem[0000000030141408] = 00d00000 00000000
	stda	%l6,[%i5+%o4]0x81	! Mem[0000000030141408] = d853a11d 00000000
!	%l0 = 22873e41, %l1 = 000000ff, Mem[0000000010041408] = 3f2cb25d ba536bff
	stda	%l0,[%i1+%o4]0x80	! Mem[0000000010041408] = 22873e41 000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = ff3795a8 052702e5, %l0 = 22873e41, %l1 = 000000ff
	ldda	[%i3+%o5]0x81,%l0	! %l0 = 00000000ff3795a8 00000000052702e5

p0_label_55:
!	Mem[0000000030081408] = ba536bff, %l1 = 00000000052702e5
	lduba	[%i2+%o4]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010081410] = 6100c75a, %l5 = 769fac2dc511d0b3
	lduwa	[%i2+%o5]0x80,%l5	! %l5 = 000000006100c75a
!	Mem[0000000010181408] = 0000008a, %l7 = 0000000000000000
	ldswa	[%i6+%o4]0x80,%l7	! %l7 = 000000000000008a
!	Mem[0000000010041408] = 22873e41000000ff, %l6 = 00000000d853a11d
	ldxa	[%i1+%o4]0x80,%l6	! %l6 = 22873e41000000ff
!	Mem[00000000100c1408] = 0000004c, %l5 = 000000006100c75a
	ldswa	[%i3+0x008]%asi,%l5	! %l5 = 000000000000004c
!	Mem[0000000030141410] = 67be2b5a, %l6 = 22873e41000000ff
	lduha	[%i5+%o5]0x81,%l6	! %l6 = 00000000000067be
!	Mem[0000000030101408] = 70a2db7a00001da1, %f4  = ffb60000 c2885361
	ldda	[%i4+%o4]0x89,%f4 	! %f4  = 70a2db7a 00001da1
!	Mem[0000000030001410] = ba536bff, %l2 = 000000006e6bb475
	lduwa	[%i0+%o5]0x89,%l2	! %l2 = 00000000ba536bff
!	Mem[0000000010141400] = 72006100ed06b274, %l2 = 00000000ba536bff
	ldxa	[%i5+%g0]0x80,%l2	! %l2 = 72006100ed06b274
!	Starting 10 instruction Store Burst
!	%f21 = ba536bff, Mem[0000000030141410] = 67be2b5a
	sta	%f21,[%i5+%o5]0x81	! Mem[0000000030141410] = ba536bff

!	Check Point 11 for processor 0

	set	p0_check_pt_data_11,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 00000000ff3795a8
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 72006100ed06b274
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 000000000000009d
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l5,%g2			! %l5 = 000000000000004c
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l6,%g2			! %l6 = 00000000000067be
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l7,%g2			! %l7 = 000000000000008a
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x40],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = ff1a1d72 0692c0bd
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x48],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 70a2db7a 00001da1
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x50],%g3
	std	%f12,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f12 = 130fe697 000000d0
	bne	%xcc,p0_freg_check_fail
	mov	0xf12,%g1

!	Check Point 11 completed


p0_label_56:
!	%f16 = ff00348a, Mem[0000000010001420] = 190c89c6
	st	%f16,[%i0+0x020]	! Mem[0000000010001420] = ff00348a
!	%l6 = 00000000000067be, Mem[0000000030001400] = 441a07c3ff000000
	stxa	%l6,[%i0+%g0]0x89	! Mem[0000000030001400] = 00000000000067be
!	%l0 = 00000000ff3795a8, Mem[0000000010081400] = 00000000
	stwa	%l0,[%i2+%g0]0x80	! Mem[0000000010081400] = ff3795a8
!	%l4 = 0000000027a48a34, Mem[0000000010001410] = 441a1d72
	stha	%l4,[%i0+%o5]0x80	! Mem[0000000010001410] = 8a341d72
!	%l5 = 000000000000004c, Mem[0000000030141408] = d853a11d
	stwa	%l5,[%i5+%o4]0x81	! Mem[0000000030141408] = 0000004c
!	Mem[0000000010181426] = a97d9677, %l3 = 000000000000009d
	ldstub	[%i6+0x026],%l3		! %l3 = 00000096000000ff
!	Mem[0000000020800001] = 824c7fc1, %l6 = 00000000000067be
	ldstuba	[%o1+0x001]%asi,%l6	! %l6 = 0000004c000000ff
!	%f14 = ff3795a8 052702e5, %l6 = 000000000000004c
!	Mem[0000000030041428] = 0fb6e1403d1c2039
	add	%i1,0x028,%g1
	stda	%f14,[%g1+%l6]ASI_PST16_S ! Mem[0000000030041428] = ff3795a83d1c2039
!	Mem[0000000030141410] = ff6b53ba, %l4 = 0000000027a48a34
	ldstuba	[%i5+%o5]0x89,%l4	! %l4 = 000000ba000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = 4c000000, %l1 = 00000000000000ff
	ldswa	[%i5+%o4]0x89,%l1	! %l1 = 000000004c000000

p0_label_57:
!	Mem[0000000030181408] = 0000dc8b, %l0 = 00000000ff3795a8
	lduha	[%i6+%o4]0x89,%l0	! %l0 = 000000000000dc8b
!	Mem[0000000030081410] = ffcf3734, %l2 = 72006100ed06b274
	lduha	[%i2+%o5]0x81,%l2	! %l2 = 000000000000ffcf
!	Mem[0000000030181400] = 05000061, %l1 = 000000004c000000
	ldsba	[%i6+%g0]0x89,%l1	! %l1 = 0000000000000061
!	Mem[000000001004140c] = 000000ff, %l1 = 0000000000000061
	ldsh	[%i1+0x00c],%l1		! %l1 = 0000000000000000
!	Mem[00000000201c0000] = ff009b8f, %l0 = 000000000000dc8b
	lduba	[%o0+0x001]%asi,%l0	! %l0 = 0000000000000000
!	Mem[0000000010041410] = d853a11dc511d0b3, %l0 = 0000000000000000
	ldxa	[%i1+%o5]0x88,%l0	! %l0 = d853a11dc511d0b3
!	Mem[0000000010101410] = ff3795a800000000, %l5 = 000000000000004c
	ldxa	[%i4+%o5]0x88,%l5	! %l5 = ff3795a800000000
!	Mem[000000001004142c] = d0000000, %l2 = 000000000000ffcf
	ldsha	[%i1+0x02e]%asi,%l2	! %l2 = 0000000000000000
!	Mem[0000000030001408] = 67be2bff00000000, %f18 = 6100c7d2 85c701c8
	ldda	[%i0+%o4]0x89,%f18	! %f18 = 67be2bff 00000000
!	Starting 10 instruction Store Burst
!	%l7 = 000000000000008a, Mem[0000000010101420] = 00000000d3bfcf8b, %asi = 80
	stxa	%l7,[%i4+0x020]%asi	! Mem[0000000010101420] = 000000000000008a

p0_label_58:
!	%f2  = 5a2bbe67, Mem[0000000010081408] = f4000000
	sta	%f2 ,[%i2+%o4]0x88	! Mem[0000000010081408] = 5a2bbe67
!	%l6 = 0000004c, %l7 = 0000008a, Mem[0000000030181408] = 0000dc8b 00000000
	stda	%l6,[%i6+%o4]0x89	! Mem[0000000030181408] = 0000004c 0000008a
!	Mem[0000000010181408] = 8a000000, %l1 = 0000000000000000
	ldstuba	[%i6+%o4]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[00000000300c1410] = a89537ff, %l5 = ff3795a800000000
	swapa	[%i3+%o5]0x89,%l5	! %l5 = 00000000a89537ff
!	Mem[000000001010143c] = 455ba4ec, %l7 = 000000000000008a, %asi = 80
	swapa	[%i4+0x03c]%asi,%l7	! %l7 = 00000000455ba4ec
!	%f16 = ff00348a 00000000, %l2 = 0000000000000000
!	Mem[0000000010181408] = ff00008a0000009d
	add	%i6,0x008,%g1
	stda	%f16,[%g1+%l2]ASI_PST32_PL ! Mem[0000000010181408] = ff00008a0000009d
!	%f3  = 67be2b5a, Mem[0000000030181408] = 4c000000
	sta	%f3 ,[%i6+%o4]0x81	! Mem[0000000030181408] = 67be2b5a
!	Mem[0000000010141408] = 130fe697, %l2 = 0000000000000000
	swapa	[%i5+%o4]0x80,%l2	! %l2 = 00000000130fe697
!	%l5 = 00000000a89537ff, Mem[0000000021800140] = 73ffef3d
	sth	%l5,[%o3+0x140]		! Mem[0000000021800140] = 37ffef3d
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = 4c000000, %l0 = d853a11dc511d0b3
	ldswa	[%i3+%o4]0x88,%l0	! %l0 = 000000004c000000

p0_label_59:
!	Mem[0000000010081410] = 6100c75a, %l0 = 000000004c000000
	lduwa	[%i2+0x010]%asi,%l0	! %l0 = 000000006100c75a
!	Mem[00000000100c1400] = 00d00000, %l6 = 000000000000004c
	lduba	[%i3+%g0]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000010081408] = 86ddcb5f 5a2bbe67, %l0 = 6100c75a, %l1 = 00000000
	ldda	[%i2+%o4]0x88,%l0	! %l0 = 000000005a2bbe67 0000000086ddcb5f
!	Mem[000000001010143c] = 0000008a, %l7 = 00000000455ba4ec
	ldsba	[%i4+0x03c]%asi,%l7	! %l7 = 0000000000000000
!	Mem[0000000010141408] = 00000000, %l7 = 0000000000000000
	ldsha	[%i5+%o4]0x88,%l7	! %l7 = 0000000000000000
!	Mem[00000000100c1410] = 78f096f59711fcff, %f28 = ff6b53ba 5db22c3f
	ldda	[%i3+%o5]0x88,%f28	! %f28 = 78f096f5 9711fcff
!	Mem[0000000010001400] = ff00d00020110ca0, %f18 = 67be2bff 00000000
	ldda	[%i0+0x000]%asi,%f18	! %f18 = ff00d000 20110ca0
!	Mem[0000000030101410] = 4f550ab7, %f26 = d3b71ee5
	lda	[%i4+%o5]0x81,%f26	! %f26 = 4f550ab7
!	Mem[0000000010081410] = 5ac70061, %l7 = 0000000000000000
	lduha	[%i2+%o5]0x88,%l7	! %l7 = 0000000000000061
!	Starting 10 instruction Store Burst
!	Mem[0000000010181418] = 769fac2d, %l1 = 86ddcb5f, %l6 = 00000000
	add	%i6,0x18,%g1
	casa	[%g1]0x80,%l1,%l6	! %l6 = 00000000769fac2d

p0_label_60:
!	Mem[0000000010101408] = ff6b53ba, %l7 = 0000000000000061
	swap	[%i4+%o4],%l7		! %l7 = 00000000ff6b53ba
!	Mem[0000000030081408] = ff6b53ba, %l6 = 00000000769fac2d
	ldstuba	[%i2+%o4]0x81,%l6	! %l6 = 000000ff000000ff
!	Mem[0000000030181400] = 61000005, %l5 = 00000000a89537ff
	ldstuba	[%i6+%g0]0x81,%l5	! %l5 = 00000061000000ff
!	%f14 = ff3795a8, Mem[0000000010181408] = 8a0000ff
	sta	%f14,[%i6+%o4]0x88	! Mem[0000000010181408] = ff3795a8
!	%f30 = 0000b6b6 413e8722, %l1 = 0000000086ddcb5f
!	Mem[00000000100c1438] = 0000006177db6f55
	add	%i3,0x038,%g1
	stda	%f30,[%g1+%l1]ASI_PST32_P ! Mem[00000000100c1438] = 0000b6b6413e8722
!	Mem[0000000030181408] = 67be2b5a, %l4 = 00000000000000ba
	ldsha	[%i6+%o4]0x81,%l4	! %l4 = 00000000000067be
!	%l6 = 000000ff, %l7 = ff6b53ba, Mem[0000000010101410] = 00000000 a89537ff
	std	%l6,[%i4+%o5]		! Mem[0000000010101410] = 000000ff ff6b53ba
!	%f14 = ff3795a8 052702e5, Mem[0000000030181408] = 67be2b5a 8a000000
	stda	%f14,[%i6+%o4]0x81	! Mem[0000000030181408] = ff3795a8 052702e5
!	%f12 = 130fe697 000000d0, Mem[00000000100c1430] = 7c81cf36 5681b46c
	std	%f12,[%i3+0x030]	! Mem[00000000100c1430] = 130fe697 000000d0
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = ffffffff, %l4 = 00000000000067be
	ldsha	[%i3+%g0]0x89,%l4	! %l4 = ffffffffffffffff

!	Check Point 12 for processor 0

	set	p0_check_pt_data_12,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 000000005a2bbe67
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 0000000086ddcb5f
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 00000000130fe697
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 0000000000000096
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = ffffffffffffffff
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 0000000000000061
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 00000000ff6b53ba
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = ff1a1d72 0692c0bd
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x50],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = ff00d000 20110ca0
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1
	ldx	[%g4+0x58],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = 4f550ab7 2cd01e55
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1
	ldx	[%g4+0x60],%g3
	std	%f28,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f28 = 78f096f5 9711fcff
	bne	%xcc,p0_freg_check_fail
	mov	0xf28,%g1

!	Check Point 12 completed


p0_label_61:
!	Mem[0000000030041410] = 68708a34, %l1 = 0000000086ddcb5f
	lduba	[%i1+%o5]0x89,%l1	! %l1 = 0000000000000034
!	Mem[00000000300c1400] = ffffffff, %l0 = 000000005a2bbe67
	ldswa	[%i3+%g0]0x81,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010041434] = ff000000, %l0 = ffffffffffffffff
	lduh	[%i1+0x036],%l0		! %l0 = 0000000000000000
!	Mem[0000000030181400] = ff000005, %l2 = 00000000130fe697
	lduba	[%i6+%g0]0x81,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030181400] = ff000005, %l5 = 0000000000000061
	lduba	[%i6+%g0]0x81,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010001408] = ff2bbe67, %l7 = 00000000ff6b53ba
	lduha	[%i0+%o4]0x80,%l7	! %l7 = 000000000000ff2b
!	Mem[0000000010001408] = 67be2bff, %l0 = 0000000000000000
	lduba	[%i0+%o4]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030001408] = 00000000, %l0 = 00000000000000ff
	lduha	[%i0+%o4]0x89,%l0	! %l0 = 0000000000000000
	membar	#Sync			! Added by membar checker (10)
!	Mem[0000000030141400] = b6b60000 70a2db7a 0000004c 00000000
!	Mem[0000000030141410] = ff536bff d2c70061 ff795814 0a005f0c
!	Mem[0000000030141420] = 86813ec1 d2f09e33 419e8199 88506935
!	Mem[0000000030141430] = 4e478378 82559f9b f55f280a c63561c4
	ldda	[%i5]ASI_BLK_AIUS,%f16	! Block Load from 0000000030141400
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1428] = ffe8739e, %l5 = 00000000000000ff
	ldstuba	[%i3+0x028]%asi,%l5	! %l5 = 000000ff000000ff

p0_label_62:
!	%l6 = 000000ff, %l7 = 0000ff2b, Mem[0000000030041410] = 68708a34 10016ef2
	stda	%l6,[%i1+%o5]0x89	! Mem[0000000030041410] = 000000ff 0000ff2b
!	%f2  = 5a2bbe67 67be2b5a, %l5 = 00000000000000ff
!	Mem[0000000030001428] = 551ed02ce51eb7d3
	add	%i0,0x028,%g1
	stda	%f2,[%g1+%l5]ASI_PST16_SL ! Mem[0000000030001428] = 5a2bbe6767be2b5a
!	%l4 = ffffffffffffffff, Mem[0000000030081400] = 00000000
	stha	%l4,[%i2+%g0]0x89	! Mem[0000000030081400] = 0000ffff
!	Mem[0000000030181410] = ba536bbd, %l6 = 00000000000000ff
	ldstuba	[%i6+%o5]0x89,%l6	! %l6 = 000000bd000000ff
!	%l7 = 000000000000ff2b, Mem[000000001014141e] = f47ca02d
	sth	%l7,[%i5+0x01e]		! Mem[000000001014141c] = f47cff2b
!	%l6 = 000000bd, %l7 = 0000ff2b, Mem[0000000030181410] = ba536bff cb4a4382
	stda	%l6,[%i6+%o5]0x89	! Mem[0000000030181410] = 000000bd 0000ff2b
!	Mem[0000000010081410] = 6100c75a, %l5 = 00000000000000ff
	swapa	[%i2+%o5]0x80,%l5	! %l5 = 000000006100c75a
!	%l6 = 00000000000000bd, Mem[0000000030101408] = a11d0000
	stba	%l6,[%i4+%o4]0x81	! Mem[0000000030101408] = bd1d0000
!	%f0  = ff1a1d72 0692c0bd 5a2bbe67 67be2b5a
!	%f4  = 70a2db7a 00001da1 ff3795a8 052702e5
!	%f8  = ffffffff 0692c0bd cdeceb5d ba536bbd
!	%f12 = 130fe697 000000d0 ff3795a8 052702e5
	stda	%f0,[%i1]ASI_BLK_AIUS	! Block Store to 0000000030041400
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1400] = 0000d000ff000000, %l4 = ffffffffffffffff
	ldxa	[%i3+%g0]0x80,%l4	! %l4 = 0000d000ff000000

p0_label_63:
	membar	#Sync			! Added by membar checker (11)
!	Mem[0000000010041408] = 413e8722, %l7 = 000000000000ff2b
	ldswa	[%i1+%o4]0x88,%l7	! %l7 = 00000000413e8722
!	Mem[0000000010001408] = 67be2bff, %l5 = 000000006100c75a
	lduha	[%i0+%o4]0x88,%l5	! %l5 = 0000000000002bff
!	Mem[0000000030081400] = ffff000067be2b5a, %l7 = 00000000413e8722
	ldxa	[%i2+%g0]0x81,%l7	! %l7 = ffff000067be2b5a
!	Mem[0000000030101400] = 22873e41, %l7 = ffff000067be2b5a
	ldswa	[%i4+%g0]0x81,%l7	! %l7 = 0000000022873e41
!	Mem[0000000030101400] = 22873e41, %l7 = 0000000022873e41
	lduwa	[%i4+%g0]0x81,%l7	! %l7 = 0000000022873e41
!	Mem[0000000010101410] = 000000ff ff6b53ba, %l0 = 00000000, %l1 = 00000034
	ldd	[%i4+%o5],%l0		! %l0 = 00000000000000ff 00000000ff6b53ba
!	Mem[0000000010001400] = 00d000ff, %l2 = 00000000000000ff
	lduba	[%i0+%g0]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010181410] = 00000000, %l3 = 0000000000000096
	ldsba	[%i6+%o5]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000030081408] = ff6b53ba 5debeccd, %l4 = ff000000, %l5 = 00002bff
	ldda	[%i2+%o4]0x81,%l4	! %l4 = 00000000ff6b53ba 000000005debeccd
!	Starting 10 instruction Store Burst
!	%f18 = 0000004c 00000000, Mem[0000000010101428] = cb4a4382 1da1ffff
	stda	%f18,[%i4+0x028]%asi	! Mem[0000000010101428] = 0000004c 00000000

p0_label_64:
!	Mem[0000000010041413] = b3d011c5, %l2 = 00000000000000ff
	ldstuba	[%i1+0x013]%asi,%l2	! %l2 = 000000c5000000ff
!	%f8  = ffffffff 0692c0bd, Mem[0000000030181408] = ff3795a8 052702e5
	stda	%f8 ,[%i6+%o4]0x81	! Mem[0000000030181408] = ffffffff 0692c0bd
!	Mem[000000001004143c] = a89537ff, %l1 = 00000000ff6b53ba
	swap	[%i1+0x03c],%l1		! %l1 = 00000000a89537ff
!	%l0 = 00000000000000ff, Mem[0000000010101408] = 00000061
	stha	%l0,[%i4+%o4]0x80	! Mem[0000000010101408] = 00ff0061
!	Mem[0000000010101408] = 6100ff00, %l5 = 000000005debeccd
	ldstuba	[%i4+%o4]0x88,%l5	! %l5 = 00000000000000ff
!	%f22 = ff795814, Mem[0000000030141400] = 0000b6b6
	sta	%f22,[%i5+%g0]0x89	! Mem[0000000030141400] = ff795814
!	%f4  = 70a2db7a 00001da1, Mem[0000000030141410] = ff6b53ff 6100c7d2
	stda	%f4 ,[%i5+%o5]0x89	! Mem[0000000030141410] = 70a2db7a 00001da1
!	%l0 = 00000000000000ff, Mem[0000000010101408] = ffff00615debeccd
	stxa	%l0,[%i4+%o4]0x80	! Mem[0000000010101408] = 00000000000000ff
!	%l0 = 00000000000000ff, Mem[0000000030181408] = ffffffff0692c0bd
	stxa	%l0,[%i6+%o4]0x81	! Mem[0000000030181408] = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = 0000004c f230c3b5, %l4 = ff6b53ba, %l5 = 00000000
	ldda	[%i3+%o4]0x80,%l4	! %l4 = 000000000000004c 00000000f230c3b5

p0_label_65:
!	Mem[00000000201c0000] = ff009b8f, %l6 = 00000000000000bd
	ldstub	[%o0+%g0],%l6		! %l6 = 000000ff000000ff
!	Mem[0000000030041408] = 5a2bbe6767be2b5a, %l1 = 00000000a89537ff
	ldxa	[%i1+%o4]0x81,%l1	! %l1 = 5a2bbe6767be2b5a
!	Mem[0000000030081410] = ffcf3734, %l1 = 5a2bbe6767be2b5a
	lduba	[%i2+%o5]0x81,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010141420] = 031a783db6b67068, %f6  = ff3795a8 052702e5
	ldda	[%i5+0x020]%asi,%f6 	! %f6  = 031a783d b6b67068
!	Mem[0000000010141400] = 00610072, %l7 = 0000000022873e41
	ldsha	[%i5+%g0]0x88,%l7	! %l7 = 0000000000000072
!	Mem[0000000010001400] = 00d000ff, %l5 = 00000000f230c3b5
	ldsba	[%i0+%g0]0x88,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000030141408] = 4c000000, %f0  = ff1a1d72
	lda	[%i5+%o4]0x89,%f0 	! %f0 = 4c000000
!	Mem[0000000010041404] = 721d1aff, %f11 = ba536bbd
	lda	[%i1+0x004]%asi,%f11	! %f11 = 721d1aff
!	Mem[0000000010081400] = ff3795a8ff000000, %f22 = ff795814 0a005f0c
	ldda	[%i2+%g0]0x80,%f22	! %f22 = ff3795a8 ff000000
!	Starting 10 instruction Store Burst
!	%l1 = 00000000000000ff, Mem[0000000030001410] = ba536bff
	stba	%l1,[%i0+%o5]0x89	! Mem[0000000030001410] = ba536bff

!	Check Point 13 for processor 0

	set	p0_check_pt_data_13,%g4
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
	cmp	%l2,%g2			! %l2 = 00000000000000c5
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 0000000000000000
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 000000000000004c
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = ffffffffffffffff
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 0000000000000072
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = 4c000000 0692c0bd
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x50],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 70a2db7a 00001da1
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x58],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 031a783d b6b67068
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x60],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = cdeceb5d 721d1aff
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x68],%g3
	std	%f16,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f16 = b6b60000 70a2db7a
	bne	%xcc,p0_freg_check_fail
	mov	0xf16,%g1
	ldx	[%g4+0x70],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = 0000004c 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1
	ldx	[%g4+0x78],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = ff536bff d2c70061
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1
	ldx	[%g4+0x80],%g3
	std	%f22,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f22 = ff3795a8 ff000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf22,%g1
	ldx	[%g4+0x88],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = 86813ec1 d2f09e33
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1
	ldx	[%g4+0x90],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = 419e8199 88506935
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1
	ldx	[%g4+0x98],%g3
	std	%f28,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f28 = 4e478378 82559f9b
	bne	%xcc,p0_freg_check_fail
	mov	0xf28,%g1
	ldx	[%g4+0xa0],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = f55f280a c63561c4
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 13 completed


p0_label_66:
!	%f18 = 0000004c 00000000, Mem[0000000010101408] = 00000000 000000ff
	stda	%f18,[%i4+%o4]0x80	! Mem[0000000010101408] = 0000004c 00000000
!	%l4 = 000000000000004c, Mem[0000000021800140] = 37ffef3d, %asi = 80
	stha	%l4,[%o3+0x140]%asi	! Mem[0000000021800140] = 004cef3d
!	%f24 = 86813ec1 d2f09e33, Mem[0000000030141400] = ff795814 7adba270
	stda	%f24,[%i5+%g0]0x89	! Mem[0000000030141400] = 86813ec1 d2f09e33
!	%l4 = 000000000000004c, Mem[000000001000142c] = d9d6ff56
	stw	%l4,[%i0+0x02c]		! Mem[000000001000142c] = 0000004c
!	Mem[000000001014141f] = f47cff2b, %l1 = 00000000000000ff
	ldstub	[%i5+0x01f],%l1		! %l1 = 0000002b000000ff
!	%l0 = 00000000000000ff, Mem[0000000010141408] = 00000000
	stha	%l0,[%i5+%o4]0x80	! Mem[0000000010141408] = 00ff0000
!	Mem[0000000030101410] = b70a554f, %l3 = 0000000000000000
	ldstuba	[%i4+%o5]0x89,%l3	! %l3 = 0000004f000000ff
!	Mem[000000001014140c] = 1da1ffff, %l5 = ffffffffffffffff, %asi = 80
	swapa	[%i5+0x00c]%asi,%l5	! %l5 = 000000001da1ffff
!	Mem[0000000030101410] = ff550ab7, %l7 = 0000000000000072
	swapa	[%i4+%o5]0x81,%l7	! %l7 = 00000000ff550ab7
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = ffffb5d7, %l5 = 000000001da1ffff
	ldsha	[%o2+0x000]%asi,%l5	! %l5 = ffffffffffffffff

p0_label_67:
!	Mem[00000000300c1400] = ffffffff, %f11 = 721d1aff
	lda	[%i3+%g0]0x81,%f11	! %f11 = ffffffff
!	Mem[0000000010181408] = a89537ff, %l5 = ffffffffffffffff
	ldsha	[%i6+0x00a]%asi,%l5	! %l5 = 00000000000037ff
!	Mem[00000000201c0000] = ff009b8f, %l1 = 000000000000002b
	lduh	[%o0+%g0],%l1		! %l1 = 000000000000ff00
!	Mem[0000000010081418] = 8e0705b0ef662ee2, %l7 = 00000000ff550ab7
	ldx	[%i2+0x018],%l7		! %l7 = 8e0705b0ef662ee2
!	Mem[0000000021800140] = 004cef3d, %l0 = 00000000000000ff
	ldsh	[%o3+0x140],%l0		! %l0 = 000000000000004c
!	Mem[0000000010001408] = a00c112067be2bff, %f26 = 419e8199 88506935
	ldda	[%i0+%o4]0x88,%f26	! %f26 = a00c1120 67be2bff
!	Mem[0000000030101410] = d000000072000000, %l3 = 000000000000004f
	ldxa	[%i4+%o5]0x89,%l3	! %l3 = d000000072000000
!	Mem[0000000010141410] = 052702e5 00000000, %l0 = 0000004c, %l1 = 0000ff00
	ldda	[%i5+%o5]0x80,%l0	! %l0 = 00000000052702e5 0000000000000000
!	Mem[0000000010001410] = 721d348a, %l5 = 00000000000037ff
	ldsba	[%i0+%o5]0x88,%l5	! %l5 = ffffffffffffff8a
!	Starting 10 instruction Store Burst
!	%l4 = 000000000000004c, Mem[00000000300c1400] = 0000ffd9ffffffff
	stxa	%l4,[%i3+%g0]0x89	! Mem[00000000300c1400] = 000000000000004c

p0_label_68:
!	%l0 = 00000000052702e5, Mem[0000000030181408] = 00000000
	stha	%l0,[%i6+%o4]0x81	! Mem[0000000030181408] = 02e50000
!	Mem[0000000030141408] = 0000004c, %l7 = 8e0705b0ef662ee2
	ldstuba	[%i5+%o4]0x81,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030001410] = ff6b53ba, %l5 = ffffffffffffff8a
	swapa	[%i0+%o5]0x81,%l5	! %l5 = 00000000ff6b53ba
!	Mem[0000000030001400] = be670000, %l1 = 0000000000000000
	swapa	[%i0+%g0]0x81,%l1	! %l1 = 00000000be670000
!	%l0 = 00000000052702e5, Mem[0000000030001400] = 00000000
	stha	%l0,[%i0+%g0]0x81	! Mem[0000000030001400] = 02e50000
!	%f24 = 86813ec1 d2f09e33, Mem[0000000010041408] = 413e8722 ff000000
	stda	%f24,[%i1+%o4]0x88	! Mem[0000000010041408] = 86813ec1 d2f09e33
!	Mem[0000000021800040] = 8b8a9ae4, %l1 = 00000000be670000
	ldstuba	[%o3+0x040]%asi,%l1	! %l1 = 0000008b000000ff
!	%f30 = f55f280a c63561c4, %l7 = 0000000000000000
!	Mem[0000000030101418] = a82261ac7517a6c8
	add	%i4,0x018,%g1
	stda	%f30,[%g1+%l7]ASI_PST8_SL ! Mem[0000000030101418] = a82261ac7517a6c8
!	%l1 = 000000000000008b, Mem[0000000010001400] = ff00d000
	stha	%l1,[%i0+%g0]0x80	! Mem[0000000010001400] = 008bd000
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = 339ef0d2c13e8186, %l3 = d000000072000000
	ldxa	[%i5+%g0]0x81,%l3	! %l3 = 339ef0d2c13e8186

p0_label_69:
!	Mem[0000000010081424] = c3168c16, %l2 = 00000000000000c5
	ldsb	[%i2+0x026],%l2		! %l2 = ffffffffffffff8c
!	Mem[00000000300c1410] = e502270500000000, %l3 = 339ef0d2c13e8186
	ldxa	[%i3+%o5]0x89,%l3	! %l3 = e502270500000000
!	Mem[0000000010001408] = a00c112067be2bff, %f24 = 86813ec1 d2f09e33
	ldda	[%i0+%o4]0x88,%f24	! %f24 = a00c1120 67be2bff
!	Mem[00000000100c1410] = 78f096f59711fcff, %f0  = 4c000000 0692c0bd
	ldda	[%i3+%o5]0x88,%f0 	! %f0  = 78f096f5 9711fcff
!	Mem[0000000010081408] = 5a2bbe67, %l7 = 0000000000000000
	lduha	[%i2+%o4]0x88,%l7	! %l7 = 000000000000be67
!	Mem[0000000030001400] = 02e50000, %f17 = 70a2db7a
	lda	[%i0+%g0]0x81,%f17	! %f17 = 02e50000
!	Mem[0000000010081428] = 30850e60, %l4 = 000000000000004c
	ldub	[%i2+0x02a],%l4		! %l4 = 000000000000000e
!	Mem[0000000010081410] = 000000ff, %l5 = 00000000ff6b53ba
	lduwa	[%i2+%o5]0x80,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010081434] = 0668c80a, %l6 = 00000000000000ff
	ldsb	[%i2+0x036],%l6		! %l6 = ffffffffffffffc8
!	Starting 10 instruction Store Burst
!	Mem[0000000030101400] = 413e8722, %l6 = ffffffffffffffc8
	ldstuba	[%i4+%g0]0x89,%l6	! %l6 = 00000022000000ff

p0_label_70:
!	%f0  = 78f096f5 9711fcff 5a2bbe67 67be2b5a
!	%f4  = 70a2db7a 00001da1 031a783d b6b67068
!	%f8  = ffffffff 0692c0bd cdeceb5d ffffffff
!	%f12 = 130fe697 000000d0 ff3795a8 052702e5
	stda	%f0,[%i0]ASI_BLK_AIUPL	! Block Store to 0000000010001400
!	%l0 = 052702e5, %l1 = 0000008b, Mem[0000000030041408] = 67be2b5a 5a2bbe67
	stda	%l0,[%i1+%o4]0x89	! Mem[0000000030041408] = 052702e5 0000008b
!	%l4 = 000000000000000e, Mem[0000000030181408] = 0000e502
	stha	%l4,[%i6+%o4]0x89	! Mem[0000000030181408] = 0000000e
!	Mem[0000000010141433] = fa62794f, %l7 = 000000000000be67
	ldstub	[%i5+0x033],%l7		! %l7 = 0000004f000000ff
!	%f28 = 4e478378 82559f9b, %l2 = ffffffffffffff8c
!	Mem[0000000010081428] = 30850e60ea867e20
	add	%i2,0x028,%g1
	stda	%f28,[%g1+%l2]ASI_PST32_PL ! Mem[0000000010081428] = 30850e60ea867e20
!	%f16 = b6b60000 02e50000, Mem[0000000010081430] = 87ff338b 0668c80a
	stda	%f16,[%i2+0x030]%asi	! Mem[0000000010081430] = b6b60000 02e50000
!	%l6 = 0000000000000022, Mem[0000000030141400] = 339ef0d2
	stwa	%l6,[%i5+%g0]0x81	! Mem[0000000030141400] = 00000022
!	Mem[00000000300c1410] = 00000000, %l1 = 000000000000008b
	ldstuba	[%i3+%o5]0x81,%l1	! %l1 = 00000000000000ff
!	Mem[00000000201c0001] = ff009b8f, %l2 = ffffffffffffff8c
	ldstuba	[%o0+0x001]%asi,%l2	! %l2 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = 0000004c, %l5 = 00000000000000ff
	lduwa	[%i4+%o4]0x80,%l5	! %l5 = 000000000000004c

!	Check Point 14 for processor 0

	set	p0_check_pt_data_14,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 00000000052702e5
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
	cmp	%l3,%g2			! %l3 = e502270500000000
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 000000000000000e
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 000000000000004c
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 0000000000000022
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 000000000000004f
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = 78f096f5 9711fcff
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x50],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = cdeceb5d ffffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x58],%g3
	std	%f16,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f16 = b6b60000 02e50000
	bne	%xcc,p0_freg_check_fail
	mov	0xf16,%g1
	ldx	[%g4+0x60],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = a00c1120 67be2bff
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1
	ldx	[%g4+0x68],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = a00c1120 67be2bff
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1

!	Check Point 14 completed


p0_label_71:
!	Mem[00000000211c0000] = ffffb5d7, %l4 = 000000000000000e
	lduba	[%o2+0x000]%asi,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030181408] = 0e000000, %l3 = e502270500000000
	lduba	[%i6+%o4]0x81,%l3	! %l3 = 000000000000000e
	membar	#Sync			! Added by membar checker (12)
!	Mem[0000000010001400] = 9711fcff, %f8  = ffffffff
	lda	[%i0+%g0]0x88,%f8 	! %f8 = 9711fcff
!	Mem[0000000030141408] = ff00004c, %l5 = 000000000000004c
	lduha	[%i5+%o4]0x81,%l5	! %l5 = 000000000000ff00
!	Mem[0000000010101410] = 000000ff, %l6 = 0000000000000022
	ldswa	[%i4+%o5]0x80,%l6	! %l6 = 00000000000000ff
!	Mem[00000000201c0000] = ffff9b8f, %l5 = 000000000000ff00
	ldsba	[%o0+0x001]%asi,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000030001408] = 00000000, %l7 = 000000000000004f
	ldswa	[%i0+%o4]0x89,%l7	! %l7 = 0000000000000000
!	Mem[00000000300c1408] = 22873e41, %l2 = 0000000000000000
	lduwa	[%i3+%o4]0x89,%l2	! %l2 = 0000000022873e41
!	Mem[0000000030181408] = ff000000 0000000e, %l4 = 000000ff, %l5 = ffffffff
	ldda	[%i6+%o4]0x89,%l4	! %l4 = 000000000000000e 00000000ff000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010141400] = 72006100, %l6 = 00000000000000ff
	swapa	[%i5+%g0]0x80,%l6	! %l6 = 0000000072006100

p0_label_72:
!	Mem[00000000100c1410] = fffc1197, %l2 = 0000000022873e41
	swap	[%i3+%o5],%l2		! %l2 = 00000000fffc1197
!	%f0  = 78f096f5, Mem[0000000010081434] = 02e50000
	st	%f0 ,[%i2+0x034]	! Mem[0000000010081434] = 78f096f5
!	%f21 = d2c70061, Mem[0000000010101408] = 0000004c
	sta	%f21,[%i4+%o4]0x80	! Mem[0000000010101408] = d2c70061
!	%l0 = 00000000052702e5, Mem[0000000030001410] = cdeceb5d8affffff
	stxa	%l0,[%i0+%o5]0x89	! Mem[0000000030001410] = 00000000052702e5
!	Mem[0000000030141410] = 00001da1, %l0 = 00000000052702e5
	ldstuba	[%i5+%o5]0x89,%l0	! %l0 = 000000a1000000ff
!	%f14 = ff3795a8 052702e5, Mem[0000000030001410] = 052702e5 00000000
	stda	%f14,[%i0+%o5]0x89	! Mem[0000000030001410] = ff3795a8 052702e5
!	%l1 = 0000000000000000, Mem[0000000030181408] = 0000000e
	stwa	%l1,[%i6+%o4]0x89	! Mem[0000000030181408] = 00000000
!	Mem[0000000030181400] = ff000005, %l2 = 00000000fffc1197
	ldstuba	[%i6+%g0]0x81,%l2	! %l2 = 000000ff000000ff
!	%l5 = 00000000ff000000, Mem[0000000010001410] = 00001da1
	stwa	%l5,[%i0+%o5]0x88	! Mem[0000000010001410] = ff000000
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = 22873e41, %l0 = 00000000000000a1
	lduha	[%i3+%o5]0x80,%l0	! %l0 = 0000000000002287

p0_label_73:
!	Mem[0000000030181410] = 0000ff2b 000000bd, %l0 = 00002287, %l1 = 00000000
	ldda	[%i6+%o5]0x89,%l0	! %l0 = 00000000000000bd 000000000000ff2b
!	Mem[0000000030181400] = ff000005, %l7 = 0000000000000000
	lduba	[%i6+%g0]0x81,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010101400] = 00d00000, %l4 = 000000000000000e
	ldsha	[%i4+%g0]0x88,%l4	! %l4 = 0000000000000000
	membar	#Sync			! Added by membar checker (13)
!	Mem[0000000010001400] = fffc1197 f596f078 5a2bbe67 67be2b5a
!	Mem[0000000010001410] = 000000ff 7adba270 6870b6b6 3d781a03
!	Mem[0000000010001420] = bdc09206 ffffffff ffffffff 5debeccd
!	Mem[0000000010001430] = d0000000 97e60f13 e5022705 a89537ff
	ldda	[%i0]ASI_BLK_PL,%f0	! Block Load from 0000000010001400
!	Mem[000000001008143c] = 1ddb824c, %l0 = 00000000000000bd
	lduwa	[%i2+0x03c]%asi,%l0	! %l0 = 000000001ddb824c
!	Mem[0000000030001400] = 0000e502, %l2 = 00000000000000ff
	lduwa	[%i0+%g0]0x89,%l2	! %l2 = 000000000000e502
!	Mem[0000000010041410] = b3d011ff, %f27 = 67be2bff
	lda	[%i1+%o5]0x80,%f27	! %f27 = b3d011ff
!	Mem[0000000010001410] = ff000000, %f23 = ff000000
	lda	[%i0+%o5]0x88,%f23	! %f23 = ff000000
!	Mem[00000000300c1408] = 413e8722, %l0 = 000000001ddb824c
	ldsba	[%i3+%o4]0x81,%l0	! %l0 = 0000000000000041
!	Starting 10 instruction Store Burst
!	Mem[0000000010041413] = b3d011ff, %l5 = 00000000ff000000
	ldstub	[%i1+0x013],%l5		! %l5 = 000000ff000000ff

p0_label_74:
!	%l6 = 0000000072006100, Mem[0000000030101410] = 72000000
	stwa	%l6,[%i4+%o5]0x89	! Mem[0000000030101410] = 72006100
!	%f24 = a00c1120 67be2bff, %l4 = 0000000000000000
!	Mem[0000000030101428] = 043d9dcd676a6fdd
	add	%i4,0x028,%g1
	stda	%f24,[%g1+%l4]ASI_PST32_SL ! Mem[0000000030101428] = 043d9dcd676a6fdd
!	%f16 = b6b60000, Mem[0000000010081410] = ff000000
	sta	%f16,[%i2+%o5]0x88	! Mem[0000000010081410] = b6b60000
!	%l4 = 0000000000000000, Mem[00000000100c141b] = a4590319
	stb	%l4,[%i3+0x01b]		! Mem[00000000100c1418] = a4590300
!	%l0 = 0000000000000041, Mem[0000000030001400] = 02e50000
	stba	%l0,[%i0+%g0]0x81	! Mem[0000000030001400] = 41e50000
!	%f22 = ff3795a8 ff000000, %l6 = 0000000072006100
!	Mem[0000000030181428] = 210f5094868cb043
	add	%i6,0x028,%g1
	stda	%f22,[%g1+%l6]ASI_PST16_SL ! Mem[0000000030181428] = 210f5094868cb043
!	Mem[0000000020800040] = ffffe25a, %l6 = 0000000072006100
	ldstuba	[%o1+0x040]%asi,%l6	! %l6 = 000000ff000000ff
!	Mem[0000000030081410] = 3437cfff, %l2 = 000000000000e502
	swapa	[%i2+%o5]0x89,%l2	! %l2 = 000000003437cfff
!	%l2 = 000000003437cfff, Mem[0000000010181400] = ff00348a00000000
	stxa	%l2,[%i6+%g0]0x80	! Mem[0000000010181400] = 000000003437cfff
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = 050000ff, %l3 = 000000000000000e
	ldsba	[%i6+%g0]0x89,%l3	! %l3 = ffffffffffffffff

p0_label_75:
!	Mem[000000001014143c] = 7ae32cb8, %l5 = 00000000000000ff
	ldsba	[%i5+0x03f]%asi,%l5	! %l5 = ffffffffffffffb8
!	Mem[000000001018142c] = a89537ff, %f17 = 02e50000
	ld	[%i6+0x02c],%f17	! %f17 = a89537ff
!	Mem[0000000010001408] = 67be2b5a, %l4 = 0000000000000000
	ldsba	[%i0+%o4]0x88,%l4	! %l4 = 000000000000005a
!	Mem[00000000100c1434] = 000000d0, %l4 = 000000000000005a
	ldsha	[%i3+0x036]%asi,%l4	! %l4 = 00000000000000d0
!	Mem[0000000010181408] = 9d000000ff3795a8, %f30 = f55f280a c63561c4
	ldda	[%i6+%o4]0x88,%f30	! %f30 = 9d000000 ff3795a8
!	Mem[0000000030081400] = 0000ffff, %l4 = 00000000000000d0
	swapa	[%i2+%g0]0x89,%l4	! %l4 = 000000000000ffff
!	Mem[0000000010041400] = ff1a1d72000000b5, %l4 = 000000000000ffff
	ldxa	[%i1+%g0]0x88,%l4	! %l4 = ff1a1d72000000b5
!	Mem[0000000030181408] = 00000000, %f18 = 0000004c
	lda	[%i6+%o4]0x89,%f18	! %f18 = 00000000
!	Mem[0000000010001420] = bdc09206 ffffffff, %l2 = 3437cfff, %l3 = ffffffff
	ldda	[%i0+0x020]%asi,%l2	! %l2 = 00000000bdc09206 00000000ffffffff
!	Starting 10 instruction Store Burst
!	Mem[0000000010141408] = 00ff0000, %l0 = 0000000000000041
	ldstuba	[%i5+%o4]0x80,%l0	! %l0 = 00000000000000ff

!	Check Point 15 for processor 0

	set	p0_check_pt_data_15,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 0000000000000000
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l2,%g2			! %l2 = 00000000bdc09206
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l3,%g2			! %l3 = 00000000ffffffff
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l4,%g2			! %l4 = ff1a1d72000000b5
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l5,%g2			! %l5 = ffffffffffffffb8
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l6,%g2			! %l6 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l7,%g2			! %l7 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x40],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = 78f096f5 9711fcff
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x48],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = 5a2bbe67 67be2b5a
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x50],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 70a2db7a ff000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x58],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 031a783d b6b67068
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x60],%g3
	std	%f8,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f8 = ffffffff 0692c0bd
	bne	%xcc,p0_freg_check_fail
	mov	0xf08,%g1
	ldx	[%g4+0x68],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = cdeceb5d ffffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x70],%g3
	std	%f12,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f12 = 130fe697 000000d0
	bne	%xcc,p0_freg_check_fail
	mov	0xf12,%g1
	ldx	[%g4+0x78],%g3
	std	%f14,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f14 = ff3795a8 052702e5
	bne	%xcc,p0_freg_check_fail
	mov	0xf14,%g1
	ldx	[%g4+0x80],%g3
	std	%f16,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f16 = b6b60000 a89537ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf16,%g1
	ldx	[%g4+0x88],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = 00000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1
	ldx	[%g4+0x90],%g3
	std	%f22,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f22 = ff3795a8 ff000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf22,%g1
	ldx	[%g4+0x98],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = a00c1120 b3d011ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1
	ldx	[%g4+0xa0],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = 9d000000 ff3795a8
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 15 completed


p0_label_76:
!	%f16 = b6b60000 a89537ff 00000000 00000000
!	%f20 = ff536bff d2c70061 ff3795a8 ff000000
!	%f24 = a00c1120 67be2bff a00c1120 b3d011ff
!	%f28 = 4e478378 82559f9b 9d000000 ff3795a8
	stda	%f16,[%i4]ASI_BLK_S	! Block Store to 0000000030101400
!	Mem[0000000030001408] = 00000000, %l6 = 00000000000000ff
	ldstuba	[%i0+%o4]0x89,%l6	! %l6 = 00000000000000ff
	membar	#Sync			! Added by membar checker (14)
!	%l1 = 000000000000ff2b, Mem[0000000010001424] = ffffffff, %asi = 80
	stba	%l1,[%i0+0x024]%asi	! Mem[0000000010001424] = 2bffffff
!	%f25 = 67be2bff, Mem[0000000030141408] = 4c0000ff
	sta	%f25,[%i5+%o4]0x89	! Mem[0000000030141408] = 67be2bff
!	%f6  = 031a783d, Mem[00000000100c1400] = 0000d000
	sta	%f6 ,[%i3+0x000]%asi	! Mem[00000000100c1400] = 031a783d
!	%l7 = 00000000000000ff, Mem[0000000010181410] = bdc0920600000000
	stxa	%l7,[%i6+%o5]0x88	! Mem[0000000010181410] = 00000000000000ff
!	Mem[0000000010181408] = ff3795a8, %l1 = 000000000000ff2b
	ldstuba	[%i6+%o4]0x88,%l1	! %l1 = 000000a8000000ff
!	%l6 = 0000000000000000, Mem[0000000030041410] = 7adba270
	stba	%l6,[%i1+%o5]0x89	! Mem[0000000030041410] = 7adba200
!	Mem[00000000211c0000] = ffffb5d7, %l3 = 00000000ffffffff
	ldstuba	[%o2+0x000]%asi,%l3	! %l3 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = 0000b6b6, %l3 = 00000000000000ff
	ldsba	[%i2+%o5]0x80,%l3	! %l3 = 0000000000000000

p0_label_77:
!	Mem[0000000010081408] = 67be2b5a 5fcbdd86, %l0 = 00000000, %l1 = 000000a8
	ldda	[%i2+%o4]0x80,%l0	! %l0 = 0000000067be2b5a 000000005fcbdd86
!	Mem[0000000010041410] = b3d011ff 1da153d8, %l4 = 000000b5, %l5 = ffffffb8
	ldda	[%i1+%o5]0x80,%l4	! %l4 = 00000000b3d011ff 000000001da153d8
!	Mem[0000000010181400] = 00000000, %f8  = ffffffff
	lda	[%i6+%g0]0x88,%f8 	! %f8 = 00000000
!	Mem[00000000300c1400] = 000000000000004c, %f0  = 78f096f5 9711fcff
	ldda	[%i3+%g0]0x89,%f0 	! %f0  = 00000000 0000004c
!	Mem[00000000100c1410] = 78f096f5 413e8722, %l0 = 67be2b5a, %l1 = 5fcbdd86
	ldda	[%i3+%o5]0x88,%l0	! %l0 = 00000000413e8722 0000000078f096f5
!	Mem[0000000030181408] = ff00000000000000, %l5 = 000000001da153d8
	ldxa	[%i6+%o4]0x89,%l5	! %l5 = ff00000000000000
!	Mem[0000000021800040] = ff8a9ae4, %l0 = 00000000413e8722
	ldsba	[%o3+0x040]%asi,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010181410] = 000000ff, %l5 = ff00000000000000
	lduwa	[%i6+%o5]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030181410] = bd000000, %l1 = 0000000078f096f5
	lduba	[%i6+%o5]0x81,%l1	! %l1 = 00000000000000bd
!	Starting 10 instruction Store Burst
!	%l5 = 00000000000000ff, Mem[0000000030141408] = 0000000067be2bff
	stxa	%l5,[%i5+%o4]0x89	! Mem[0000000030141408] = 00000000000000ff

p0_label_78:
!	%l5 = 00000000000000ff, Mem[0000000010181428] = e5022705a89537ff, %asi = 80
	stxa	%l5,[%i6+0x028]%asi	! Mem[0000000010181428] = 00000000000000ff
!	%f24 = a00c1120 67be2bff, Mem[0000000030041400] = 721d1aff bdc09206
	stda	%f24,[%i1+%g0]0x89	! Mem[0000000030041400] = a00c1120 67be2bff
!	%f20 = ff536bff d2c70061, Mem[00000000300c1410] = ff000000 052702e5
	stda	%f20,[%i3+%o5]0x81	! Mem[00000000300c1410] = ff536bff d2c70061
!	Mem[0000000010041408] = 339ef0d2, %l3 = 0000000000000000, %asi = 80
	swapa	[%i1+0x008]%asi,%l3	! %l3 = 00000000339ef0d2
!	%l5 = 00000000000000ff, Mem[0000000010041408] = 00000000
	stwa	%l5,[%i1+%o4]0x80	! Mem[0000000010041408] = 000000ff
!	Mem[0000000020800040] = ffffe25a, %l0 = ffffffffffffffff
	ldstub	[%o1+0x040],%l0		! %l0 = 000000ff000000ff
!	Mem[00000000100c1408] = 0000004c, %l7 = 00000000000000ff
	ldstuba	[%i3+%o4]0x80,%l7	! %l7 = 00000000000000ff
!	%l4 = 00000000b3d011ff, Mem[0000000010001410] = ff000000
	stha	%l4,[%i0+%o5]0x88	! Mem[0000000010001410] = ff0011ff
!	Mem[00000000100c1428] = ffe8739ecc34bfb3, %l6 = 0000000000000000, %l1 = 00000000000000bd
	add	%i3,0x28,%g1
	casxa	[%g1]0x80,%l6,%l1	! %l1 = ffe8739ecc34bfb3
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = ff9537ff, %l2 = 00000000bdc09206
	lduw	[%i6+%o4],%l2		! %l2 = 00000000ff9537ff

p0_label_79:
!	Mem[0000000030041400] = a00c1120 67be2bff, %l0 = 000000ff, %l1 = cc34bfb3
	ldda	[%i1+%g0]0x89,%l0	! %l0 = 0000000067be2bff 00000000a00c1120
!	Mem[0000000010041400] = b5000000, %l3 = 00000000339ef0d2
	ldsba	[%i1+%g0]0x80,%l3	! %l3 = ffffffffffffffb5
!	Mem[0000000010101410] = 000000ffff6b53ba, %f30 = 9d000000 ff3795a8
	ldda	[%i4+0x010]%asi,%f30	! %f30 = 000000ff ff6b53ba
!	Mem[0000000010081430] = b6b60000, %l6 = 0000000000000000
	ldsb	[%i2+0x031],%l6		! %l6 = ffffffffffffffb6
!	Mem[0000000030081408] = ff6b53ba, %l2 = 00000000ff9537ff
	lduba	[%i2+%o4]0x81,%l2	! %l2 = 00000000000000ff
!	Mem[00000000100c1410] = 22873e41, %l1 = 00000000a00c1120
	lduha	[%i3+0x010]%asi,%l1	! %l1 = 0000000000002287
!	Mem[000000001014141c] = f47cffff, %f7  = b6b67068
	lda	[%i5+0x01c]%asi,%f7 	! %f7 = f47cffff
!	Mem[00000000201c0000] = ffff9b8f, %l6 = ffffffffffffffb6
	ldub	[%o0+%g0],%l6		! %l6 = 00000000000000ff
!	Mem[0000000010001400] = fffc1197f596f078, %l1 = 0000000000002287
	ldxa	[%i0+%g0]0x80,%l1	! %l1 = fffc1197f596f078
!	Starting 10 instruction Store Burst
!	Mem[0000000030101410] = ff536bff, %l3 = ffffffffffffffb5
	ldstuba	[%i4+%o5]0x81,%l3	! %l3 = 000000ff000000ff

p0_label_80:
!	%l5 = 00000000000000ff, Mem[0000000030141410] = ff1d00007adba270
	stxa	%l5,[%i5+%o5]0x81	! Mem[0000000030141410] = 00000000000000ff
!	Mem[00000000100c1408] = ff00004c, %l3 = 00000000000000ff
	ldstuba	[%i3+%o4]0x80,%l3	! %l3 = 000000ff000000ff
!	%f16 = b6b60000 a89537ff, Mem[0000000030181400] = 050000ff 00000082
	stda	%f16,[%i6+%g0]0x89	! Mem[0000000030181400] = b6b60000 a89537ff
!	%l4 = b3d011ff, %l5 = 000000ff, Mem[0000000010101408] = d2c70061 00000000
	stda	%l4,[%i4+%o4]0x80	! Mem[0000000010101408] = b3d011ff 000000ff
!	Mem[0000000030141408] = 000000ff, %l0 = 0000000067be2bff
	swapa	[%i5+%o4]0x89,%l0	! %l0 = 00000000000000ff
!	%f16 = b6b60000 a89537ff 00000000 00000000
!	%f20 = ff536bff d2c70061 ff3795a8 ff000000
!	%f24 = a00c1120 67be2bff a00c1120 b3d011ff
!	%f28 = 4e478378 82559f9b 000000ff ff6b53ba
	stda	%f16,[%i1]ASI_BLK_AIUS	! Block Store to 0000000030041400
!	%l7 = 0000000000000000, Mem[0000000030141408] = ff2bbe67
	stba	%l7,[%i5+%o4]0x81	! Mem[0000000030141408] = 002bbe67
!	Mem[0000000020800000] = 82ff7fc1, %l0 = 00000000000000ff
	ldstub	[%o1+%g0],%l0		! %l0 = 00000082000000ff
!	%l5 = 00000000000000ff, Mem[00000000300c1408] = 413e8722ff000000
	stxa	%l5,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = 70a2db7a ff0011ff, %l0 = 00000082, %l1 = f596f078
	ldda	[%i0+%o5]0x88,%l0	! %l0 = 00000000ff0011ff 0000000070a2db7a

!	Check Point 16 for processor 0

	set	p0_check_pt_data_16,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 00000000ff0011ff
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 0000000070a2db7a
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
	cmp	%l5,%g2			! %l5 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
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
	cmp	%g3,%g2			! %f0 = 00000000 0000004c
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x48],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 70a2db7a ff000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x50],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 031a783d f47cffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x58],%g3
	std	%f8,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f8 = 00000000 0692c0bd
	bne	%xcc,p0_freg_check_fail
	mov	0xf08,%g1
	ldx	[%g4+0x60],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = 000000ff ff6b53ba
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 16 completed


p0_label_81:
!	Mem[0000000010001400] = fffc1197f596f078, %f4  = 70a2db7a ff000000
	ldda	[%i0+%g0]0x80,%f4 	! %f4  = fffc1197 f596f078
!	Mem[0000000030081410] = 0000e502, %l7 = 0000000000000000
	lduba	[%i2+%o5]0x89,%l7	! %l7 = 0000000000000002
!	Mem[0000000010141408] = 0000ffff, %l4 = 00000000b3d011ff
	lduba	[%i5+%o4]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010101438] = ea64bfd90000008a, %l6 = 00000000000000ff
	ldx	[%i4+0x038],%l6		! %l6 = ea64bfd90000008a
!	Mem[0000000021800040] = ff8a9ae4, %l2 = 00000000000000ff
	ldsba	[%o3+0x041]%asi,%l2	! %l2 = ffffffffffffff8a
!	Mem[0000000010081400] = a89537ff, %l1 = 0000000070a2db7a
	lduba	[%i2+%g0]0x88,%l1	! %l1 = 00000000000000ff
	membar	#Sync			! Added by membar checker (15)
!	Mem[0000000010041400] = 000000b5, %l7 = 0000000000000002
	ldswa	[%i1+%g0]0x88,%l7	! %l7 = 00000000000000b5
!	Mem[0000000010141410] = 00000000 e5022705, %l0 = ff0011ff, %l1 = 000000ff
	ldda	[%i5+%o5]0x88,%l0	! %l0 = 00000000e5022705 0000000000000000
!	Mem[0000000010041434] = ff000000, %l5 = 00000000000000ff
	ldsh	[%i1+0x036],%l5		! %l5 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f12 = 130fe697, Mem[0000000010141400] = 000000ff
	sta	%f12,[%i5+%g0]0x80	! Mem[0000000010141400] = 130fe697

p0_label_82:
!	Mem[0000000030001410] = 052702e5, %l4 = 00000000000000ff
	ldstuba	[%i0+%o5]0x89,%l4	! %l4 = 000000e5000000ff
!	Mem[0000000010041408] = ff000000, %l1 = 0000000000000000
	ldstuba	[%i1+%o4]0x88,%l1	! %l1 = 00000000000000ff
!	%f21 = d2c70061, Mem[0000000010081410] = b6b60000
	sta	%f21,[%i2+%o5]0x88	! Mem[0000000010081410] = d2c70061
!	Mem[0000000030081400] = d0000000, %f24 = a00c1120
	lda	[%i2+%g0]0x81,%f24	! %f24 = d0000000
!	%l6 = ea64bfd90000008a, Mem[0000000010141408] = 0000ffff
	stha	%l6,[%i5+%o4]0x88	! Mem[0000000010141408] = 0000008a
!	Mem[0000000030101400] = 0000b6b6, %l1 = 0000000000000000
	ldstuba	[%i4+%g0]0x89,%l1	! %l1 = 000000b6000000ff
!	%f20 = ff536bff d2c70061, Mem[0000000010141400] = 130fe697 ed06b274
	std	%f20,[%i5+%g0]	! Mem[0000000010141400] = ff536bff d2c70061
!	Mem[0000000010101438] = ea64bfd9, %l1 = 00000000000000b6
	ldstuba	[%i4+0x038]%asi,%l1	! %l1 = 000000ea000000ff
!	Mem[0000000010141410] = 052702e500000000, %l1 = 00000000000000ea, %l1 = 00000000000000ea
	add	%i5,0x10,%g1
	casxa	[%g1]0x80,%l1,%l1	! %l1 = 052702e500000000
!	Starting 10 instruction Load Burst
!	Mem[000000001014142c] = 35edcef8, %f18 = 00000000
	lda	[%i5+0x02c]%asi,%f18	! %f18 = 35edcef8

p0_label_83:
!	Mem[0000000030141400] = 00000022, %l0 = 00000000e5022705
	ldsba	[%i5+%g0]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000010181408] = ff3795ff, %f26 = a00c1120
	lda	[%i6+%o4]0x88,%f26	! %f26 = ff3795ff
!	Mem[0000000010001410] = ff1100ff, %l6 = ea64bfd90000008a
	lduba	[%i0+%o5]0x80,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010141434] = 0000003a, %l6 = 00000000000000ff
	ldsb	[%i5+0x034],%l6		! %l6 = 0000000000000000
!	Mem[0000000030001400] = 00000000 0000e541, %l0 = 00000000, %l1 = 00000000
	ldda	[%i0+%g0]0x89,%l0	! %l0 = 000000000000e541 0000000000000000
!	Mem[0000000010001408] = 5a2bbe67, %f26 = ff3795ff
	lda	[%i0+%o4]0x80,%f26	! %f26 = 5a2bbe67
!	Mem[0000000010101400] = 0000d000, %l0 = 000000000000e541
	ldsha	[%i4+%g0]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000020800000] = ffff7fc1, %l0 = 0000000000000000
	ldsh	[%o1+%g0],%l0		! %l0 = ffffffffffffffff
!	Mem[0000000030081400] = d000000067be2b5a, %f22 = ff3795a8 ff000000
	ldda	[%i2+%g0]0x81,%f22	! %f22 = d0000000 67be2b5a
!	Starting 10 instruction Store Burst
!	Mem[000000001004143c] = ff6b53ba, %l1 = 0000000000000000
	swap	[%i1+0x03c],%l1		! %l1 = 00000000ff6b53ba

p0_label_84:
!	Mem[0000000030141400] = 22000000, %l5 = 0000000000000000
	ldstuba	[%i5+%g0]0x89,%l5	! %l5 = 00000000000000ff
!	%l6 = 0000000000000000, Mem[00000000100c1410] = 22873e41, %asi = 80
	stba	%l6,[%i3+0x010]%asi	! Mem[00000000100c1410] = 00873e41
!	%l1 = 00000000ff6b53ba, Mem[0000000010101410] = 000000ffff6b53ba
	stxa	%l1,[%i4+%o5]0x80	! Mem[0000000010101410] = 00000000ff6b53ba
!	%l7 = 00000000000000b5, Mem[0000000010081400] = ff3795a8ff000000
	stxa	%l7,[%i2+%g0]0x80	! Mem[0000000010081400] = 00000000000000b5
!	Mem[0000000010141410] = e5022705, %l4 = 00000000000000e5
	ldstuba	[%i5+%o5]0x88,%l4	! %l4 = 00000005000000ff
!	Mem[0000000030001408] = 000000ff, %l2 = ffffffffffffff8a
	ldstuba	[%i0+%o4]0x89,%l2	! %l2 = 000000ff000000ff
!	Mem[0000000010001400] = fffc1197, %l5 = 0000000000000000
	swapa	[%i0+%g0]0x80,%l5	! %l5 = 00000000fffc1197
!	Mem[0000000010181400] = 00000000, %l1 = 00000000ff6b53ba
	swapa	[%i6+%g0]0x88,%l1	! %l1 = 0000000000000000
!	%f18 = 35edcef8 00000000, Mem[0000000010181408] = ff3795ff 9d000000
	stda	%f18,[%i6+%o4]0x88	! Mem[0000000010181408] = 35edcef8 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000020800000] = ffff7fc1, %l3 = 00000000000000ff
	ldub	[%o1+%g0],%l3		! %l3 = 00000000000000ff

p0_label_85:
!	Mem[0000000030041408] = 00000000, %l5 = 00000000fffc1197
	lduha	[%i1+%o4]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000030181410] = 0000ff2b000000bd, %l0 = ffffffffffffffff
	ldxa	[%i6+%o5]0x89,%l0	! %l0 = 0000ff2b000000bd
!	Mem[00000000201c0000] = ffff9b8f, %l5 = 0000000000000000
	ldsh	[%o0+%g0],%l5		! %l5 = ffffffffffffffff
!	Mem[0000000010081410] = 6100c7d2, %l4 = 0000000000000005
	lduha	[%i2+%o5]0x80,%l4	! %l4 = 0000000000006100
!	Mem[0000000010101424] = 0000008a, %l7 = 00000000000000b5
	lduh	[%i4+0x024],%l7		! %l7 = 0000000000000000
!	Mem[0000000030001408] = 67be2bff 000000ff, %l6 = 00000000, %l7 = 00000000
	ldda	[%i0+%o4]0x89,%l6	! %l6 = 00000000000000ff 0000000067be2bff
!	Mem[0000000030181400] = ff3795a8, %l6 = 00000000000000ff
	lduba	[%i6+%g0]0x81,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030141410] = 00000000, %l0 = 0000ff2b000000bd
	lduba	[%i5+%o5]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000030181400] = ff3795a8, %l2 = 00000000000000ff
	ldsba	[%i6+%g0]0x81,%l2	! %l2 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%f20 = ff536bff, Mem[0000000030081410] = 0000e502
	sta	%f20,[%i2+%o5]0x89	! Mem[0000000030081410] = ff536bff

!	Check Point 17 for processor 0

	set	p0_check_pt_data_17,%g4
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
	cmp	%l2,%g2			! %l2 = ffffffffffffffff
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 0000000000006100
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = ffffffffffffffff
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 0000000067be2bff
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = 00000000 0000004c
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x50],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = fffc1197 f596f078
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x58],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 031a783d f47cffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x60],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = 35edcef8 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1
	ldx	[%g4+0x68],%g3
	std	%f22,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f22 = d0000000 67be2b5a
	bne	%xcc,p0_freg_check_fail
	mov	0xf22,%g1
	ldx	[%g4+0x70],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = d0000000 67be2bff
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1
	ldx	[%g4+0x78],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = 5a2bbe67 b3d011ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1

!	Check Point 17 completed


p0_label_86:
!	%f9  = 0692c0bd, Mem[0000000030141408] = 002bbe67
	sta	%f9 ,[%i5+%o4]0x81	! Mem[0000000030141408] = 0692c0bd
!	%f18 = 35edcef8 00000000, Mem[0000000010001408] = 67be2b5a 5a2bbe67
	stda	%f18,[%i0+%o4]0x88	! Mem[0000000010001408] = 35edcef8 00000000
!	Mem[0000000010081400] = 00000000, %l7 = 0000000067be2bff
	swapa	[%i2+%g0]0x80,%l7	! %l7 = 0000000000000000
!	%l4 = 0000000000006100, Mem[0000000030041410] = ff536bff
	stwa	%l4,[%i1+%o5]0x81	! Mem[0000000030041410] = 00006100
!	%f24 = d0000000, Mem[0000000030101400] = 0000b6ff
	sta	%f24,[%i4+%g0]0x89	! Mem[0000000030101400] = d0000000
!	Mem[00000000300c1410] = ff536bff, %l4 = 0000000000006100
	ldstuba	[%i3+%o5]0x81,%l4	! %l4 = 000000ff000000ff
!	%l3 = 00000000000000ff, Mem[0000000030141408] = bdc09206
	stha	%l3,[%i5+%o4]0x89	! Mem[0000000030141408] = bdc000ff
!	Mem[00000000100c1403] = 031a783d, %l7 = 0000000000000000
	ldstuba	[%i3+0x003]%asi,%l7	! %l7 = 0000003d000000ff
!	%f14 = ff3795a8 052702e5, %l7 = 000000000000003d
!	Mem[0000000030081408] = ff6b53ba5debeccd
	add	%i2,0x008,%g1
	stda	%f14,[%g1+%l7]ASI_PST32_S ! Mem[0000000030081408] = ff6b53ba052702e5
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = 00000000, %l3 = 00000000000000ff
	lduha	[%i4+%o4]0x81,%l3	! %l3 = 0000000000000000

p0_label_87:
!	Mem[00000000100c1420] = 00ec856600eb0061, %l1 = 0000000000000000
	ldxa	[%i3+0x020]%asi,%l1	! %l1 = 00ec856600eb0061
!	Mem[0000000020800040] = ffffe25a, %l7 = 000000000000003d
	ldsh	[%o1+0x040],%l7		! %l7 = ffffffffffffffff
!	Mem[00000000100c1400] = ff781a03, %l7 = ffffffffffffffff
	lduha	[%i3+%g0]0x88,%l7	! %l7 = 0000000000001a03
!	Code Fragment 4
p0_fragment_4:
!	%l0 = 0000000000000000
	setx	0xe63ef81040b66266,%g7,%l0 ! %l0 = e63ef81040b66266
!	%l1 = 00ec856600eb0061
	setx	0x599348385444e30a,%g7,%l1 ! %l1 = 599348385444e30a
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = e63ef81040b66266
	setx	0x1331b7a868b5fcc7,%g7,%l0 ! %l0 = 1331b7a868b5fcc7
!	%l1 = 599348385444e30a
	setx	0x6745de0044f12589,%g7,%l1 ! %l1 = 6745de0044f12589
!	Mem[0000000010141400] = ff536bff, %l3 = 0000000000000000
	ldsha	[%i5+%g0]0x80,%l3	! %l3 = ffffffffffffff53
!	Mem[0000000010101400] = ff591ac8 00d00000, %l0 = 68b5fcc7, %l1 = 44f12589
	ldda	[%i4+%g0]0x88,%l0	! %l0 = 0000000000d00000 00000000ff591ac8
!	Mem[0000000030001410] = ff022705, %l6 = 00000000000000ff
	lduba	[%i0+%o5]0x81,%l6	! %l6 = 00000000000000ff
!	Mem[00000000201c0000] = ffff9b8f, %l6 = 00000000000000ff
	lduha	[%o0+0x000]%asi,%l6	! %l6 = 000000000000ffff
!	Mem[0000000010081408] = 67be2b5a5fcbdd86, %f14 = ff3795a8 052702e5
	ldda	[%i2+0x008]%asi,%f14	! %f14 = 67be2b5a 5fcbdd86
!	Starting 10 instruction Store Burst
!	%l2 = ffffffffffffffff, Mem[00000000300c1408] = 00000000
	stha	%l2,[%i3+%o4]0x81	! Mem[00000000300c1408] = ffff0000

p0_label_88:
!	%l1 = 00000000ff591ac8, Mem[0000000030041400] = 0000b6b6
	stwa	%l1,[%i1+%g0]0x89	! Mem[0000000030041400] = ff591ac8
!	%l6 = 000000000000ffff, Mem[0000000020800000] = ffff7fc1
	stb	%l6,[%o1+%g0]		! Mem[0000000020800000] = ffff7fc1
!	%l2 = ffffffffffffffff, Mem[0000000010081410] = 6100c7d2
	stha	%l2,[%i2+%o5]0x80	! Mem[0000000010081410] = ffffc7d2
!	%l5 = ffffffffffffffff, Mem[0000000010001410] = ff1100ff
	stba	%l5,[%i0+%o5]0x80	! Mem[0000000010001410] = ff1100ff
!	%l3 = ffffffffffffff53, Mem[0000000010141410] = ff2702e500000000
	stxa	%l3,[%i5+%o5]0x80	! Mem[0000000010141410] = ffffffffffffff53
!	%l7 = 0000000000001a03, Mem[00000000100c1424] = 00eb0061
	stb	%l7,[%i3+0x024]		! Mem[00000000100c1424] = 03eb0061
!	Mem[0000000030181400] = a89537ff, %l0 = 0000000000d00000
	ldstuba	[%i6+%g0]0x89,%l0	! %l0 = 000000ff000000ff
!	Mem[0000000010081410] = d2c7ffff, %l5 = ffffffffffffffff
	swapa	[%i2+%o5]0x88,%l5	! %l5 = 00000000d2c7ffff
!	%f0  = 00000000 0000004c 5a2bbe67 67be2b5a
!	%f4  = fffc1197 f596f078 031a783d f47cffff
!	%f8  = 00000000 0692c0bd cdeceb5d ffffffff
!	%f12 = 130fe697 000000d0 67be2b5a 5fcbdd86
	stda	%f0,[%i3]ASI_BLK_AIUS	! Block Store to 00000000300c1400
!	Starting 10 instruction Load Burst
!	Mem[0000000021800000] = 9933c8c8, %l6 = 000000000000ffff
	ldsha	[%o3+0x000]%asi,%l6	! %l6 = ffffffffffff9933

p0_label_89:
!	Mem[0000000010101410] = 00000000, %l4 = 00000000000000ff
	lduha	[%i4+%o5]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000010181408] = 00000000, %l3 = ffffffffffffff53
	lduha	[%i6+%o4]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000030101410] = ff536bff, %l2 = ffffffffffffffff
	ldswa	[%i4+%o5]0x81,%l2	! %l2 = ffffffffff536bff
!	Mem[0000000030081400] = d000000067be2b5a, %f24 = d0000000 67be2bff
	ldda	[%i2+%g0]0x81,%f24	! %f24 = d0000000 67be2b5a
!	Mem[0000000010101400] = 0000d000, %l2 = ffffffffff536bff
	lduwa	[%i4+0x000]%asi,%l2	! %l2 = 000000000000d000
!	Mem[0000000030001400] = 0000e541, %f25 = 67be2b5a
	lda	[%i0+%g0]0x89,%f25	! %f25 = 0000e541
!	Mem[00000000211c0000] = ffffb5d7, %l7 = 0000000000001a03
	ldub	[%o2+0x001],%l7		! %l7 = 00000000000000ff
!	Mem[0000000030101410] = ff6b53ff, %f20 = ff536bff
	lda	[%i4+%o5]0x89,%f20	! %f20 = ff6b53ff
!	Mem[0000000030101400] = d0000000, %l3 = 0000000000000000
	lduba	[%i4+%g0]0x89,%l3	! %l3 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f26 = 5a2bbe67 b3d011ff, %l3 = 0000000000000000
!	Mem[0000000010081410] = fffffffff6a1d8f4
	add	%i2,0x010,%g1
	stda	%f26,[%g1+%l3]ASI_PST32_PL ! Mem[0000000010081410] = fffffffff6a1d8f4

p0_label_90:
!	%l7 = 00000000000000ff, Mem[0000000010001408] = 00000000
	stwa	%l7,[%i0+%o4]0x88	! Mem[0000000010001408] = 000000ff
!	%l6 = ffff9933, %l7 = 000000ff, Mem[0000000030141400] = ff000022 c13e8186
	stda	%l6,[%i5+%g0]0x81	! Mem[0000000030141400] = ffff9933 000000ff
!	Mem[0000000030081408] = ff6b53ba, %l5 = 00000000d2c7ffff
	ldstuba	[%i2+%o4]0x81,%l5	! %l5 = 000000ff000000ff
!	Mem[00000000201c0000] = ffff9b8f, %l6 = ffffffffffff9933
	ldstuba	[%o0+0x000]%asi,%l6	! %l6 = 000000ff000000ff
!	%f22 = d0000000 67be2b5a, %l3 = 0000000000000000
!	Mem[0000000030081410] = ff6b53ff21676dc7
	add	%i2,0x010,%g1
	stda	%f22,[%g1+%l3]ASI_PST16_SL ! Mem[0000000030081410] = ff6b53ff21676dc7
!	%l5 = 00000000000000ff, Mem[0000000010001400] = 00000000
	stwa	%l5,[%i0+%g0]0x80	! Mem[0000000010001400] = 000000ff
!	Mem[0000000030001408] = ff000000, %l3 = 0000000000000000
	ldstuba	[%i0+%o4]0x81,%l3	! %l3 = 000000ff000000ff
!	%l2 = 000000000000d000, Mem[0000000010181430] = ca713b746e6bb475
	stx	%l2,[%i6+0x030]		! Mem[0000000010181430] = 000000000000d000
!	%f26 = 5a2bbe67 b3d011ff, %l2 = 000000000000d000
!	Mem[0000000030001420] = e3d6eb976685ec48
	add	%i0,0x020,%g1
	stda	%f26,[%g1+%l2]ASI_PST8_SL ! Mem[0000000030001420] = e3d6eb976685ec48
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (16)
!	Mem[00000000100c1410] = 00873e41, %f20 = ff6b53ff
	lda	[%i3+%o5]0x80,%f20	! %f20 = 00873e41

!	Check Point 18 for processor 0

	set	p0_check_pt_data_18,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 00000000ff591ac8
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 000000000000d000
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
	cmp	%l7,%g2			! %l7 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = 00000000 0000004c
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x50],%g3
	std	%f14,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f14 = 67be2b5a 5fcbdd86
	bne	%xcc,p0_freg_check_fail
	mov	0xf14,%g1
	ldx	[%g4+0x58],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = 00873e41 d2c70061
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1
	ldx	[%g4+0x60],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = d0000000 0000e541
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1

!	Check Point 18 completed


p0_label_91:
!	Mem[00000000201c0000] = ffff9b8f, %l7 = 00000000000000ff
	lduba	[%o0+0x001]%asi,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030101400] = 000000d0 a89537ff 00000000 00000000
!	Mem[0000000030101410] = ff536bff d2c70061 ff3795a8 ff000000
!	Mem[0000000030101420] = a00c1120 67be2bff a00c1120 b3d011ff
!	Mem[0000000030101430] = 4e478378 82559f9b 9d000000 ff3795a8
	ldda	[%i4]ASI_BLK_AIUS,%f16	! Block Load from 0000000030101400
!	Mem[0000000010081410] = ffffffff, %l5 = 00000000000000ff
	ldsba	[%i2+%o5]0x80,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000010181400] = ff6b53ba, %l6 = 00000000000000ff
	lduba	[%i6+%g0]0x88,%l6	! %l6 = 00000000000000ba
!	Mem[00000000300c1408] = 5a2bbe6767be2b5a, %l2 = 000000000000d000
	ldxa	[%i3+%o4]0x89,%l2	! %l2 = 5a2bbe6767be2b5a
!	Mem[0000000020800000] = ffff7fc1, %l4 = 0000000000000000
	lduh	[%o1+%g0],%l4		! %l4 = 000000000000ffff
!	Mem[0000000010101400] = 0000d000c81a59ff, %f12 = 130fe697 000000d0
	ldda	[%i4+%g0]0x80,%f12	! %f12 = 0000d000 c81a59ff
!	Mem[0000000010081408] = 5a2bbe67, %l5 = ffffffffffffffff
	ldsba	[%i2+%o4]0x88,%l5	! %l5 = 0000000000000067
!	Mem[0000000030041400] = ff591ac8, %l2 = 5a2bbe6767be2b5a
	lduwa	[%i1+%g0]0x89,%l2	! %l2 = 00000000ff591ac8
!	Starting 10 instruction Store Burst
!	Mem[0000000030081400] = 000000d0, %l7 = 00000000000000ff
	ldstuba	[%i2+%g0]0x89,%l7	! %l7 = 000000d0000000ff

p0_label_92:
!	%l2 = ff591ac8, %l3 = 000000ff, Mem[0000000010141430] = fa6279ff 0000003a
	stda	%l2,[%i5+0x030]%asi	! Mem[0000000010141430] = ff591ac8 000000ff
!	%f4  = fffc1197 f596f078, Mem[0000000010081430] = b6b60000 78f096f5
	std	%f4 ,[%i2+0x030]	! Mem[0000000010081430] = fffc1197 f596f078
!	Mem[0000000010081410] = ffffffff, %l1 = 00000000ff591ac8
	ldstuba	[%i2+%o5]0x88,%l1	! %l1 = 000000ff000000ff
!	Mem[0000000010041428] = ffffa11dd0000000, %l0 = 00000000000000ff, %l5 = 0000000000000067
	add	%i1,0x28,%g1
	casxa	[%g1]0x80,%l0,%l5	! %l5 = ffffa11dd0000000
!	Mem[0000000010141408] = 0000008a, %l5 = ffffa11dd0000000
	ldstuba	[%i5+%o4]0x88,%l5	! %l5 = 0000008a000000ff
!	%l7 = 00000000000000d0, Mem[0000000030041400] = ff591ac8
	stha	%l7,[%i1+%g0]0x89	! Mem[0000000030041400] = ff5900d0
!	%f8  = 00000000 0692c0bd, Mem[0000000030141410] = 00000000 ff000000
	stda	%f8 ,[%i5+%o5]0x89	! Mem[0000000030141410] = 00000000 0692c0bd
!	Mem[0000000030141400] = 3399ffff, %l5 = 000000000000008a
	swapa	[%i5+%g0]0x89,%l5	! %l5 = 000000003399ffff
!	Mem[0000000010101400] = 00d00000, %l4 = 000000000000ffff
	swapa	[%i4+%g0]0x88,%l4	! %l4 = 0000000000d00000
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = ff11d0b3, %l6 = 00000000000000ba
	lduwa	[%i1+%o5]0x88,%l6	! %l6 = 00000000ff11d0b3

p0_label_93:
!	Mem[0000000030141400] = 0000008a, %l3 = 00000000000000ff
	lduba	[%i5+%g0]0x89,%l3	! %l3 = 000000000000008a
!	Mem[0000000010001400] = 000000ff f596f078, %l4 = 00d00000, %l5 = 3399ffff
	ldda	[%i0+%g0]0x80,%l4	! %l4 = 00000000000000ff 00000000f596f078
!	Mem[0000000030181400] = a89537ff, %l1 = 00000000000000ff
	lduba	[%i6+%g0]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030081410] = ff536bff, %l0 = 00000000000000ff
	lduha	[%i2+%o5]0x89,%l0	! %l0 = 0000000000006bff
!	Mem[0000000010041408] = ff0000ff c13e8186, %l2 = ff591ac8, %l3 = 0000008a
	ldda	[%i1+%o4]0x80,%l2	! %l2 = 00000000ff0000ff 00000000c13e8186
!	Mem[0000000030041400] = d00059ff, %l3 = 00000000c13e8186
	ldsba	[%i1+%g0]0x81,%l3	! %l3 = ffffffffffffffd0
!	Mem[000000001004140c] = c13e8186, %l7 = 00000000000000d0
	lduw	[%i1+0x00c],%l7		! %l7 = 00000000c13e8186
!	Mem[0000000010141400] = ff536bff, %l3 = ffffffffffffffd0
	lduba	[%i5+%g0]0x80,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030101408] = 00000000, %l5 = 00000000f596f078
	lduwa	[%i4+%o4]0x81,%l5	! %l5 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010181400] = ba536bff, %l7 = 00000000c13e8186
	swapa	[%i6+%g0]0x80,%l7	! %l7 = 00000000ba536bff

p0_label_94:
!	Mem[0000000030181408] = 00000000, %l6 = 00000000ff11d0b3
	ldstuba	[%i6+%o4]0x81,%l6	! %l6 = 00000000000000ff
!	%f15 = 5fcbdd86, Mem[0000000030081400] = 000000ff
	sta	%f15,[%i2+%g0]0x89	! Mem[0000000030081400] = 5fcbdd86
!	%l7 = 00000000ba536bff, Mem[00000000201c0000] = ffff9b8f, %asi = 80
	stba	%l7,[%o0+0x000]%asi	! Mem[00000000201c0000] = ffff9b8f
!	%l2 = 00000000ff0000ff, Mem[0000000030041410] = 00006100d2c70061
	stxa	%l2,[%i1+%o5]0x81	! Mem[0000000030041410] = 00000000ff0000ff
!	Mem[0000000010141408] = ff000000ffffffff, %l2 = 00000000ff0000ff, %l3 = 00000000000000ff
	add	%i5,0x08,%g1
	casxa	[%g1]0x80,%l2,%l3	! %l3 = ff000000ffffffff
!	%l0 = 00006bff, %l1 = 000000ff, Mem[0000000010081420] = 45dd6172 c3168c16
	std	%l0,[%i2+0x020]		! Mem[0000000010081420] = 00006bff 000000ff
!	Mem[0000000010181410] = ff000000, %l3 = ff000000ffffffff
	ldstuba	[%i6+%o5]0x80,%l3	! %l3 = 000000ff000000ff
!	Mem[0000000010181410] = 000000ff, %l4 = 00000000000000ff
	swapa	[%i6+%o5]0x88,%l4	! %l4 = 00000000000000ff
!	%l0 = 0000000000006bff, Mem[0000000010101400] = 0000ffff
	stwa	%l0,[%i4+%g0]0x88	! Mem[0000000010101400] = 00006bff
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = 0000008a, %l6 = 0000000000000000
	ldsha	[%i5+%g0]0x89,%l6	! %l6 = 000000000000008a

p0_label_95:
!	Mem[0000000010001408] = 35edcef8000000ff, %f26 = a00c1120 b3d011ff
	ldda	[%i0+%o4]0x88,%f26	! %f26 = 35edcef8 000000ff
!	Mem[0000000010101400] = ff6b0000, %l1 = 00000000000000ff
	lduha	[%i4+%g0]0x80,%l1	! %l1 = 000000000000ff6b
!	Mem[00000000100c1408] = b5c330f24c0000ff, %f8  = 00000000 0692c0bd
	ldda	[%i3+%o4]0x88,%f8 	! %f8  = b5c330f2 4c0000ff
!	Mem[000000001004143c] = 00000000, %l4 = 00000000000000ff
	ldsha	[%i1+0x03c]%asi,%l4	! %l4 = 0000000000000000
!	Mem[0000000010181434] = 0000d000, %l7 = 00000000ba536bff
	lduba	[%i6+0x037]%asi,%l7	! %l7 = 0000000000000000
!	Mem[00000000100c1410] = 78f096f5413e8700, %l6 = 000000000000008a
	ldxa	[%i3+%o5]0x88,%l6	! %l6 = 78f096f5413e8700
!	Mem[0000000030081400] = 5a2bbe675fcbdd86, %f18 = 00000000 00000000
	ldda	[%i2+%g0]0x89,%f18	! %f18 = 5a2bbe67 5fcbdd86
!	Mem[0000000030101408] = 00000000, %l6 = 78f096f5413e8700
	lduba	[%i4+%o4]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000010001418] = 6870b6b63d781a03, %l5 = 0000000000000000
	ldx	[%i0+0x018],%l5		! %l5 = 6870b6b63d781a03
!	Starting 10 instruction Store Burst
!	%f4  = fffc1197, Mem[000000001014140c] = ffffffff
	sta	%f4 ,[%i5+0x00c]%asi	! Mem[000000001014140c] = fffc1197

!	Check Point 19 for processor 0

	set	p0_check_pt_data_19,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 0000000000006bff
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 000000000000ff6b
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 00000000ff0000ff
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
	cmp	%l5,%g2			! %l5 = 6870b6b63d781a03
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
	cmp	%g3,%g2			! %f2 = 5a2bbe67 67be2b5a
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x50],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = fffc1197 f596f078
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x58],%g3
	std	%f8,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f8 = b5c330f2 4c0000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf08,%g1
	ldx	[%g4+0x60],%g3
	std	%f12,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f12 = 0000d000 c81a59ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf12,%g1
	ldx	[%g4+0x68],%g3
	std	%f16,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f16 = 000000d0 a89537ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf16,%g1
	ldx	[%g4+0x70],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = 5a2bbe67 5fcbdd86
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1
	ldx	[%g4+0x78],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = ff536bff d2c70061
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1
	ldx	[%g4+0x80],%g3
	std	%f22,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f22 = ff3795a8 ff000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf22,%g1
	ldx	[%g4+0x88],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = a00c1120 67be2bff
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1
	ldx	[%g4+0x90],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = 35edcef8 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1
	ldx	[%g4+0x98],%g3
	std	%f28,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f28 = 4e478378 82559f9b
	bne	%xcc,p0_freg_check_fail
	mov	0xf28,%g1
	ldx	[%g4+0xa0],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = 9d000000 ff3795a8
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 19 completed


p0_label_96:
!	%l2 = 00000000ff0000ff, Mem[0000000010141410] = 53ffffffffffffff
	stxa	%l2,[%i5+%o5]0x88	! Mem[0000000010141410] = 00000000ff0000ff
!	Mem[0000000030101400] = 000000d0, %l4 = 0000000000000000
	ldstuba	[%i4+%g0]0x81,%l4	! %l4 = 00000000000000ff
!	%l7 = 0000000000000000, Mem[00000000100c1400] = 031a78ff
	stha	%l7,[%i3+%g0]0x80	! Mem[00000000100c1400] = 000078ff
!	Mem[0000000010041408] = ff0000ff, %l3 = 00000000000000ff
	ldstuba	[%i1+%o4]0x88,%l3	! %l3 = 000000ff000000ff
!	Mem[00000000100c1408] = 4c0000ff, %l2 = 00000000ff0000ff
	swapa	[%i3+%o4]0x88,%l2	! %l2 = 000000004c0000ff
!	Mem[0000000010001407] = f596f078, %l2 = 000000004c0000ff
	ldstuba	[%i0+0x007]%asi,%l2	! %l2 = 00000078000000ff
!	%l2 = 0000000000000078, Mem[0000000010181414] = 00000000, %asi = 80
	stha	%l2,[%i6+0x014]%asi	! Mem[0000000010181414] = 00780000
!	%l0 = 0000000000006bff, Mem[0000000020800040] = ffffe25a, %asi = 80
	stba	%l0,[%o1+0x040]%asi	! Mem[0000000020800040] = ffffe25a
!	%f30 = 9d000000 ff3795a8, Mem[00000000100c1408] = ff0000ff f230c3b5
	stda	%f30,[%i3+%o4]0x80	! Mem[00000000100c1408] = 9d000000 ff3795a8
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = 00000000f8ceed35, %f30 = 9d000000 ff3795a8
	ldda	[%i6+%o4]0x80,%f30	! %f30 = 00000000 f8ceed35

p0_label_97:
!	Mem[000000001010143c] = 0000008a, %l4 = 0000000000000000
	lduwa	[%i4+0x03c]%asi,%l4	! %l4 = 000000000000008a
!	Mem[0000000010001408] = ff000000, %l7 = 0000000000000000
	lduwa	[%i0+%o4]0x80,%l7	! %l7 = 00000000ff000000
!	Mem[0000000010141414] = 00000000, %l2 = 0000000000000078
	lduw	[%i5+0x014],%l2		! %l2 = 0000000000000000
!	Mem[0000000010001400] = ff000000, %f3  = 67be2b5a
	lda	[%i0+%g0]0x88,%f3 	! %f3 = ff000000
!	Mem[0000000010041408] = ff0000ff c13e8186, %l6 = 00000000, %l7 = ff000000
	ldda	[%i1+%o4]0x80,%l6	! %l6 = 00000000ff0000ff 00000000c13e8186
!	Mem[0000000010181420] = 13d90025 a97dff77, %l4 = 0000008a, %l5 = 3d781a03
	ldda	[%i6+0x020]%asi,%l4	! %l4 = 0000000013d90025 00000000a97dff77
!	Mem[0000000030181410] = 0000ff2b000000bd, %l5 = 00000000a97dff77
	ldxa	[%i6+%o5]0x89,%l5	! %l5 = 0000ff2b000000bd
!	Mem[0000000010081400] = 67be2bff000000b5, %l3 = 00000000000000ff
	ldxa	[%i2+%g0]0x80,%l3	! %l3 = 67be2bff000000b5
!	Mem[0000000030141408] = bdc000ff, %l0 = 0000000000006bff
	lduha	[%i5+%o4]0x89,%l0	! %l0 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[0000000010081408] = 67be2b5a, %l1 = 000000000000ff6b
	swapa	[%i2+%o4]0x80,%l1	! %l1 = 0000000067be2b5a

p0_label_98:
!	Mem[0000000010101400] = ff6b0000, %l6 = 00000000ff0000ff
	ldstuba	[%i4+%g0]0x80,%l6	! %l6 = 000000ff000000ff
!	%l4 = 0000000013d90025, Mem[0000000010181400] = c13e8186
	stwa	%l4,[%i6+%g0]0x80	! Mem[0000000010181400] = 13d90025
!	Mem[0000000010041400] = 000000b5, %l3 = 67be2bff000000b5
	swapa	[%i1+%g0]0x88,%l3	! %l3 = 00000000000000b5
!	Mem[0000000010081428] = 30850e60, %l0 = 00000000000000ff
	swap	[%i2+0x028],%l0		! %l0 = 0000000030850e60
!	Mem[0000000010041400] = 000000b5, %l2 = 0000000000000000
	swapa	[%i1+%g0]0x88,%l2	! %l2 = 00000000000000b5
!	Mem[0000000030101408] = 00000000, %l0 = 0000000030850e60
	ldstuba	[%i4+%o4]0x81,%l0	! %l0 = 00000000000000ff
!	%f8  = b5c330f2 4c0000ff, Mem[0000000030141400] = 0000008a ff000000
	stda	%f8 ,[%i5+%g0]0x89	! Mem[0000000030141400] = b5c330f2 4c0000ff
!	Mem[0000000030001400] = 41e50000, %l5 = 0000ff2b000000bd
	ldstuba	[%i0+%g0]0x81,%l5	! %l5 = 00000041000000ff
!	%f21 = d2c70061, Mem[0000000010181418] = 769fac2d
	st	%f21,[%i6+0x018]	! Mem[0000000010181418] = d2c70061
!	Starting 10 instruction Load Burst
!	Mem[0000000010081430] = fffc1197f596f078, %f12 = 0000d000 c81a59ff
	ldda	[%i2+0x030]%asi,%f12	! %f12 = fffc1197 f596f078

p0_label_99:
!	Mem[0000000010001408] = 000000ff, %l0 = 0000000000000000
	lduha	[%i0+%o4]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010141410] = ff0000ff, %l3 = 00000000000000b5
	ldsha	[%i5+%o5]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010081410] = fffffffff6a1d8f4, %l0 = 00000000000000ff
	ldxa	[%i2+%o5]0x80,%l0	! %l0 = fffffffff6a1d8f4
!	Mem[0000000010001408] = ff000000 f8ceed35, %l4 = 13d90025, %l5 = 00000041
	ldda	[%i0+%o4]0x80,%l4	! %l4 = 00000000ff000000 00000000f8ceed35
!	Mem[0000000010081408] = 0000ff6b, %l7 = 00000000c13e8186
	lduha	[%i2+%o4]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000030101400] = ff0000d0, %l4 = 00000000ff000000
	ldsba	[%i4+%g0]0x81,%l4	! %l4 = ffffffffffffffff
!	Mem[00000000100c1400] = 000078ff ff000000, %l4 = ffffffff, %l5 = f8ceed35
	ldda	[%i3+%g0]0x80,%l4	! %l4 = 00000000000078ff 00000000ff000000
!	Mem[0000000010101410] = 00000000, %l2 = 00000000000000b5
	ldsba	[%i4+%o5]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000030081408] = ba536bff, %f14 = 67be2b5a
	lda	[%i2+%o4]0x89,%f14	! %f14 = ba536bff
!	Starting 10 instruction Store Burst
!	Mem[0000000030101400] = d00000ff, %l6 = 00000000000000ff
	swapa	[%i4+%g0]0x89,%l6	! %l6 = 00000000d00000ff

p0_label_100:
!	%f16 = 000000d0 a89537ff 5a2bbe67 5fcbdd86
!	%f20 = ff536bff d2c70061 ff3795a8 ff000000
!	%f24 = a00c1120 67be2bff 35edcef8 000000ff
!	%f28 = 4e478378 82559f9b 00000000 f8ceed35
	stda	%f16,[%i3]ASI_BLK_S	! Block Store to 00000000300c1400
!	%l7 = 0000000000000000, Mem[0000000010101410] = 00000000
	stha	%l7,[%i4+%o5]0x80	! Mem[0000000010101410] = 00000000
!	%f1  = 0000004c, Mem[0000000030081400] = 5fcbdd86
	sta	%f1 ,[%i2+%g0]0x89	! Mem[0000000030081400] = 0000004c
!	%l0 = f6a1d8f4, %l1 = 67be2b5a, Mem[0000000010001410] = ff0011ff 70a2db7a
	stda	%l0,[%i0+%o5]0x88	! Mem[0000000010001410] = f6a1d8f4 67be2b5a
!	%l0 = fffffffff6a1d8f4, Mem[0000000020800000] = ffff7fc1
	stb	%l0,[%o1+%g0]		! Mem[0000000020800000] = f4ff7fc1
!	%l7 = 0000000000000000, Mem[0000000010041410] = d853a11dff11d0b3
	stxa	%l7,[%i1+%o5]0x88	! Mem[0000000010041410] = 0000000000000000
!	%l4 = 00000000000078ff, Mem[00000000300c1408] = 86ddcb5f67be2b5a
	stxa	%l4,[%i3+%o4]0x89	! Mem[00000000300c1408] = 00000000000078ff
!	Mem[00000000201c0001] = ffff9b8f, %l6 = 00000000d00000ff
	ldstub	[%o0+0x001],%l6		! %l6 = 000000ff000000ff
!	Mem[0000000010181400] = 13d90025, %l0 = fffffffff6a1d8f4
	ldstuba	[%i6+%g0]0x80,%l0	! %l0 = 00000013000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = 0000ff6b5fcbdd86, %f4  = fffc1197 f596f078
	ldda	[%i2+%o4]0x80,%f4 	! %f4  = 0000ff6b 5fcbdd86

!	Check Point 20 for processor 0

	set	p0_check_pt_data_20,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 0000000000000013
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
	cmp	%l4,%g2			! %l4 = 00000000000078ff
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l5,%g2			! %l5 = 00000000ff000000
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l6,%g2			! %l6 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l7,%g2			! %l7 = 0000000000000000
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x40],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = 5a2bbe67 ff000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x48],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 0000ff6b 5fcbdd86
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x50],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 031a783d f47cffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x58],%g3
	std	%f12,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f12 = fffc1197 f596f078
	bne	%xcc,p0_freg_check_fail
	mov	0xf12,%g1
	ldx	[%g4+0x60],%g3
	std	%f14,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f14 = ba536bff 5fcbdd86
	bne	%xcc,p0_freg_check_fail
	mov	0xf14,%g1
	ldx	[%g4+0x68],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = 00000000 f8ceed35
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 20 completed


p0_label_101:
!	%l1 = 0000000067be2b5a, immd = fffffffffffff1b1, %l1 = 0000000067be2b5a
	udivx	%l1,-0xe4f,%l1		! %l1 = 0000000000000000
!	Mem[0000000030101410] = 6100c7d2 ff6b53ff, %l2 = 00000000, %l3 = 000000ff
	ldda	[%i4+%o5]0x89,%l2	! %l2 = 00000000ff6b53ff 000000006100c7d2
!	Mem[000000001010141c] = 96c4e57d, %l3 = 000000006100c7d2
	ldsba	[%i4+0x01c]%asi,%l3	! %l3 = ffffffffffffff96
!	Mem[0000000030101400] = ff000000 a89537ff, %l0 = 00000013, %l1 = 00000000
	ldda	[%i4+%g0]0x81,%l0	! %l0 = 00000000ff000000 00000000a89537ff
!	Mem[0000000030081400] = 4c000000 67be2b5a, %l6 = 000000ff, %l7 = 00000000
	ldda	[%i2+%g0]0x81,%l6	! %l6 = 000000004c000000 0000000067be2b5a
!	Mem[0000000021800100] = d03e4a7a, %l0 = 00000000ff000000
	ldsb	[%o3+0x100],%l0		! %l0 = ffffffffffffffd0
	membar	#Sync			! Added by membar checker (17)
!	Mem[00000000300c1410] = 6100c7d2 ff6b53ff, %l2 = ff6b53ff, %l3 = ffffff96
	ldda	[%i3+%o5]0x89,%l2	! %l2 = 00000000ff6b53ff 000000006100c7d2
!	Mem[0000000010041438] = e502270500000000, %l0 = ffffffffffffffd0
	ldx	[%i1+0x038],%l0		! %l0 = e502270500000000
!	Mem[0000000030101408] = 00000000000000ff, %l5 = 00000000ff000000
	ldxa	[%i4+%o4]0x89,%l5	! %l5 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l3 = 000000006100c7d2, Mem[00000000300c1408] = ff78000000000000
	stxa	%l3,[%i3+%o4]0x81	! Mem[00000000300c1408] = 000000006100c7d2

p0_label_102:
!	%l4 = 000078ff, %l5 = 000000ff, Mem[00000000100c1410] = 413e8700 78f096f5
	stda	%l4,[%i3+%o5]0x88	! Mem[00000000100c1410] = 000078ff 000000ff
!	%l6 = 000000004c000000, Mem[00000000300c1408] = 00000000
	stwa	%l6,[%i3+%o4]0x89	! Mem[00000000300c1408] = 4c000000
!	Mem[0000000010101400] = ff6b0000, %l2 = 00000000ff6b53ff
	ldstuba	[%i4+%g0]0x80,%l2	! %l2 = 000000ff000000ff
!	%l2 = 00000000000000ff, Mem[0000000010081428] = 000000ff, %asi = 80
	stha	%l2,[%i2+0x028]%asi	! Mem[0000000010081428] = 00ff00ff
!	Mem[0000000010181408] = 00000000, %l1 = 00000000a89537ff
	ldstuba	[%i6+%o4]0x80,%l1	! %l1 = 00000000000000ff
!	%l3 = 000000006100c7d2, Mem[0000000010181410] = ff000000
	stwa	%l3,[%i6+%o5]0x80	! Mem[0000000010181410] = 6100c7d2
!	%l2 = 00000000000000ff, Mem[0000000010041400] = 00000000
	stwa	%l2,[%i1+%g0]0x80	! Mem[0000000010041400] = 000000ff
!	%l0 = e502270500000000, Mem[0000000010101408] = b3d011ff
	stba	%l0,[%i4+%o4]0x80	! Mem[0000000010101408] = 00d011ff
!	Mem[00000000300c1410] = ff536bff, %l6 = 000000004c000000
	ldstuba	[%i3+%o5]0x81,%l6	! %l6 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030081410] = ff6b53ff, %l3 = 000000006100c7d2
	ldswa	[%i2+%o5]0x81,%l3	! %l3 = ffffffffff6b53ff

p0_label_103:
!	Mem[0000000030141408] = ff00c0bd, %f19 = 5fcbdd86
	lda	[%i5+%o4]0x81,%f19	! %f19 = ff00c0bd
!	Mem[0000000030181400] = ff3795a8, %l4 = 00000000000078ff
	ldsba	[%i6+%g0]0x81,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000030041400] = d00059ff, %l1 = 0000000000000000
	ldswa	[%i1+%g0]0x81,%l1	! %l1 = ffffffffd00059ff
!	Mem[0000000030181410] = bd000000, %l6 = 00000000000000ff
	ldsba	[%i6+%o5]0x81,%l6	! %l6 = ffffffffffffffbd
!	Mem[0000000030181400] = b6b60000a89537ff, %f10 = cdeceb5d ffffffff
	ldda	[%i6+%g0]0x89,%f10	! %f10 = b6b60000 a89537ff
!	Mem[0000000030141408] = 00000000 bdc000ff, %l0 = 00000000, %l1 = d00059ff
	ldda	[%i5+%o4]0x89,%l0	! %l0 = 00000000bdc000ff 0000000000000000
!	Mem[00000000100c1408] = 9d000000, %l6 = ffffffffffffffbd
	lduha	[%i3+%o4]0x80,%l6	! %l6 = 0000000000009d00
!	Mem[00000000300c1400] = 000000d0, %l6 = 0000000000009d00
	lduwa	[%i3+%g0]0x81,%l6	! %l6 = 00000000000000d0
!	Mem[0000000010101434] = 00000061, %l5 = 00000000000000ff
	ldsba	[%i4+0x035]%asi,%l5	! %l5 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010001434] = 97e60f13, %l3 = ffffffffff6b53ff
	swap	[%i0+0x034],%l3		! %l3 = 0000000097e60f13

p0_label_104:
!	%f2  = 5a2bbe67 ff000000, Mem[0000000010141410] = ff0000ff 00000000
	stda	%f2 ,[%i5+%o5]0x88	! Mem[0000000010141410] = 5a2bbe67 ff000000
!	Mem[0000000030181408] = ff000000, %l6 = 00000000000000d0
	swapa	[%i6+%o4]0x81,%l6	! %l6 = 00000000ff000000
!	%l4 = ffffffffffffffff, Mem[0000000030181408] = 000000d0
	stba	%l4,[%i6+%o4]0x81	! Mem[0000000030181408] = ff0000d0
!	%l3 = 0000000097e60f13, Mem[0000000030041410] = 00000000
	stba	%l3,[%i1+%o5]0x81	! Mem[0000000030041410] = 13000000
!	Mem[0000000030141410] = bdc09206, %l5 = 0000000000000000
	swapa	[%i5+%o5]0x81,%l5	! %l5 = 00000000bdc09206
!	Mem[0000000010181410] = d2c70061, %l0 = 00000000bdc000ff
	ldstuba	[%i6+%o5]0x88,%l0	! %l0 = 00000061000000ff
!	%l3 = 0000000097e60f13, Mem[0000000030101408] = ff000000
	stha	%l3,[%i4+%o4]0x81	! Mem[0000000030101408] = 0f130000
!	%l5 = 00000000bdc09206, Mem[0000000010181408] = 000000ff
	stba	%l5,[%i6+%o4]0x88	! Mem[0000000010181408] = 00000006
!	Mem[0000000010101405] = c81a59ff, %l3 = 0000000097e60f13
	ldstuba	[%i4+0x005]%asi,%l3	! %l3 = 0000001a000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030101410] = ff6b53ff, %l4 = ffffffffffffffff
	ldsha	[%i4+%o5]0x89,%l4	! %l4 = 00000000000053ff

p0_label_105:
!	Mem[0000000010041408] = 86813ec1ff0000ff, %l6 = 00000000ff000000
	ldxa	[%i1+%o4]0x88,%l6	! %l6 = 86813ec1ff0000ff
!	Mem[0000000030081410] = ff536bff, %l7 = 0000000067be2b5a
	ldswa	[%i2+%o5]0x89,%l7	! %l7 = ffffffffff536bff
!	Mem[00000000300c1400] = ff3795a8 d0000000, %l4 = 000053ff, %l5 = bdc09206
	ldda	[%i3+%g0]0x89,%l4	! %l4 = 00000000d0000000 00000000ff3795a8
!	Mem[0000000021800100] = d03e4a7a, %l0 = 0000000000000061
	lduba	[%o3+0x101]%asi,%l0	! %l0 = 000000000000003e
!	Mem[0000000030181400] = ff3795a80000b6b6, %f30 = 00000000 f8ceed35
	ldda	[%i6+%g0]0x81,%f30	! %f30 = ff3795a8 0000b6b6
!	Mem[0000000010141400] = ff6b53ff, %l3 = 000000000000001a
	lduha	[%i5+%g0]0x88,%l3	! %l3 = 00000000000053ff
!	Mem[0000000021800100] = d03e4a7a, %l7 = ffffffffff536bff
	lduha	[%o3+0x100]%asi,%l7	! %l7 = 000000000000d03e
!	Mem[0000000010101400] = ff6b0000, %l3 = 00000000000053ff
	ldsha	[%i4+%g0]0x80,%l3	! %l3 = ffffffffffffff6b
!	Mem[0000000010101408] = 00d011ff000000ff, %l6 = 86813ec1ff0000ff
	ldxa	[%i4+%o4]0x80,%l6	! %l6 = 00d011ff000000ff
!	Starting 10 instruction Store Burst
!	%f12 = fffc1197, Mem[0000000010101408] = 00d011ff
	sta	%f12,[%i4+%o4]0x80	! Mem[0000000010101408] = fffc1197

!	Check Point 21 for processor 0

	set	p0_check_pt_data_21,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 000000000000003e
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
	cmp	%l3,%g2			! %l3 = ffffffffffffff6b
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 00000000d0000000
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 00000000ff3795a8
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 00d011ff000000ff
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 000000000000d03e
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = 00000000 0000004c
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x50],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = 5a2bbe67 ff000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x58],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 0000ff6b 5fcbdd86
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x60],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 031a783d f47cffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x68],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = b6b60000 a89537ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x70],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = 5a2bbe67 ff00c0bd
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1
	ldx	[%g4+0x78],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = ff3795a8 0000b6b6
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 21 completed


p0_label_106:
!	%l0 = 000000000000003e, Mem[0000000021800140] = 004cef3d, %asi = 80
	stba	%l0,[%o3+0x140]%asi	! Mem[0000000021800140] = 3e4cef3d
!	%l7 = 000000000000d03e, Mem[0000000010181400] = ffd900253437cfff
	stxa	%l7,[%i6+%g0]0x80	! Mem[0000000010181400] = 000000000000d03e
!	%l3 = ffffffffffffff6b, Mem[0000000010041408] = ff0000ff
	stha	%l3,[%i1+%o4]0x88	! Mem[0000000010041408] = ff00ff6b
!	%l4 = 00000000d0000000, Mem[0000000010081410] = fffffffff6a1d8f4
	stxa	%l4,[%i2+%o5]0x80	! Mem[0000000010081410] = 00000000d0000000
!	%l2 = 00000000000000ff, Mem[0000000010001427] = 2bffffff
	stb	%l2,[%i0+0x027]		! Mem[0000000010001424] = 2bffffff
!	%f14 = ba536bff 5fcbdd86, Mem[0000000010041428] = ffffa11d d0000000
	std	%f14,[%i1+0x028]	! Mem[0000000010041428] = ba536bff 5fcbdd86
!	%f24 = a00c1120 67be2bff, Mem[0000000030101400] = ff000000 a89537ff
	stda	%f24,[%i4+%g0]0x81	! Mem[0000000030101400] = a00c1120 67be2bff
!	%l2 = 00000000000000ff, Mem[0000000010041400] = 000000ff
	stha	%l2,[%i1+%g0]0x80	! Mem[0000000010041400] = 00ff00ff
!	Mem[0000000010101400] = ff6b0000, %l2 = 00000000000000ff
	swapa	[%i4+%g0]0x80,%l2	! %l2 = 00000000ff6b0000
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = 00000000, %l5 = 00000000ff3795a8
	ldsba	[%i5+%o5]0x81,%l5	! %l5 = 0000000000000000

p0_label_107:
!	Mem[0000000010041400] = ff00ff00, %l3 = ffffffffffffff6b
	ldswa	[%i1+%g0]0x88,%l3	! %l3 = ffffffffff00ff00
!	Mem[0000000010141408] = ff000000, %l2 = 00000000ff6b0000
	ldsba	[%i5+%o4]0x80,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000010101408] = 9711fcff, %l5 = 0000000000000000
	ldsba	[%i4+%o4]0x88,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000010101410] = 00000000, %l7 = 000000000000d03e
	ldsba	[%i4+%o5]0x88,%l7	! %l7 = 0000000000000000
!	Mem[00000000300c1410] = 6100c7d2 ff6b53ff, %l0 = 0000003e, %l1 = 00000000
	ldda	[%i3+%o5]0x89,%l0	! %l0 = 00000000ff6b53ff 000000006100c7d2
!	Mem[0000000010081410] = 00000000 d0000000, %l6 = 000000ff, %l7 = 00000000
	ldda	[%i2+%o5]0x80,%l6	! %l6 = 0000000000000000 00000000d0000000
!	Mem[0000000030181410] = bd0000002bff0000, %l2 = ffffffffffffffff
	ldxa	[%i6+%o5]0x81,%l2	! %l2 = bd0000002bff0000
!	Mem[0000000030141400] = ff00004c, %l4 = 00000000d0000000
	lduba	[%i5+%g0]0x81,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010181434] = 0000d000, %l2 = bd0000002bff0000
	ldub	[%i6+0x035],%l2		! %l2 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010181410] = d2c700ff, %l4 = 00000000000000ff
	ldstuba	[%i6+%o5]0x88,%l4	! %l4 = 000000ff000000ff

p0_label_108:
!	Mem[0000000010081400] = 67be2bff, %l6 = 0000000000000000
	ldstuba	[%i2+%g0]0x80,%l6	! %l6 = 00000067000000ff
!	%l3 = ffffffffff00ff00, Mem[00000000300c1408] = d2c700614c000000
	stxa	%l3,[%i3+%o4]0x89	! Mem[00000000300c1408] = ffffffffff00ff00
!	%f26 = 35edcef8, Mem[0000000030101410] = ff6b53ff
	sta	%f26,[%i4+%o5]0x89	! Mem[0000000030101410] = 35edcef8
!	%f16 = 000000d0 a89537ff 5a2bbe67 ff00c0bd
!	%f20 = ff536bff d2c70061 ff3795a8 ff000000
!	%f24 = a00c1120 67be2bff 35edcef8 000000ff
!	%f28 = 4e478378 82559f9b ff3795a8 0000b6b6
	stda	%f16,[%i4]ASI_BLK_AIUSL	! Block Store to 0000000030101400
!	%f10 = b6b60000, Mem[0000000010181410] = d2c700ff
	sta	%f10,[%i6+%o5]0x88	! Mem[0000000010181410] = b6b60000
!	Mem[00000000300c1400] = 000000d0, %l2 = 0000000000000000
	swapa	[%i3+%g0]0x81,%l2	! %l2 = 00000000000000d0
!	%l2 = 000000d0, %l3 = ff00ff00, Mem[00000000300c1400] = 00000000 ff3795a8
	stda	%l2,[%i3+%g0]0x89	! Mem[00000000300c1400] = 000000d0 ff00ff00
	membar	#Sync			! Added by membar checker (18)
!	Mem[0000000010101410] = 00000000, %l4 = 00000000000000ff
	swapa	[%i4+%o5]0x80,%l4	! %l4 = 0000000000000000
!	%f26 = 35edcef8 000000ff, %l1 = 000000006100c7d2
!	Mem[0000000030041428] = a00c1120b3d011ff
	add	%i1,0x028,%g1
	stda	%f26,[%g1+%l1]ASI_PST16_SL ! Mem[0000000030041428] = a00c0000b3d011ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001420] = bdc092062bffffff, %l4 = 0000000000000000
	ldxa	[%i0+0x020]%asi,%l4	! %l4 = bdc092062bffffff

p0_label_109:
!	Mem[00000000300c1400] = d000000000ff00ff, %f20 = ff536bff d2c70061
	ldda	[%i3+%g0]0x81,%f20	! %f20 = d0000000 00ff00ff
!	Mem[0000000030041410] = 13000000, %f9  = 4c0000ff
	lda	[%i1+%o5]0x81,%f9 	! %f9 = 13000000
!	Mem[0000000010101420] = 000000000000008a, %f4  = 0000ff6b 5fcbdd86
	ldda	[%i4+0x020]%asi,%f4 	! %f4  = 00000000 0000008a
!	Mem[0000000010081410] = 000000d000000000, %l3 = ffffffffff00ff00
	ldxa	[%i2+%o5]0x88,%l3	! %l3 = 000000d000000000
!	Mem[0000000030081410] = ff536bff, %l4 = bdc092062bffffff
	ldsha	[%i2+%o5]0x89,%l4	! %l4 = 0000000000006bff
!	Mem[0000000010001410] = 67be2b5a f6a1d8f4, %l0 = ff6b53ff, %l1 = 6100c7d2
	ldda	[%i0+%o5]0x88,%l0	! %l0 = 00000000f6a1d8f4 0000000067be2b5a
!	Mem[0000000030081410] = ff6b53ff, %f5  = 0000008a
	lda	[%i2+%o5]0x81,%f5 	! %f5 = ff6b53ff
!	Mem[0000000010181408] = 06000000, %l0 = 00000000f6a1d8f4
	lduba	[%i6+%o4]0x80,%l0	! %l0 = 0000000000000006
!	Mem[0000000010181410] = 0000b6b600780000, %f0  = 00000000 0000004c
	ldda	[%i6+%o5]0x80,%f0 	! %f0  = 0000b6b6 00780000
!	Starting 10 instruction Store Burst
!	%l3 = 000000d000000000, Mem[00000000201c0000] = ffff9b8f
	sth	%l3,[%o0+%g0]		! Mem[00000000201c0000] = 00009b8f

p0_label_110:
!	%l1 = 0000000067be2b5a, Mem[00000000100c1410] = ff780000ff000000
	stx	%l1,[%i3+%o5]		! Mem[00000000100c1410] = 0000000067be2b5a
!	%l2 = 00000000000000d0, Mem[0000000010041400] = ff00ff00
	stha	%l2,[%i1+%g0]0x88	! Mem[0000000010041400] = ff0000d0
!	Mem[0000000010081408] = 6bff0000, %l3 = 000000d000000000
	ldstuba	[%i2+%o4]0x88,%l3	! %l3 = 00000000000000ff
!	%f2  = 5a2bbe67, Mem[00000000100c1408] = 9d000000
	sta	%f2 ,[%i3+%o4]0x80	! Mem[00000000100c1408] = 5a2bbe67
!	%l4 = 0000000000006bff, Mem[0000000030001408] = ff000000
	stba	%l4,[%i0+%o4]0x81	! Mem[0000000030001408] = ff000000
!	%f30 = ff3795a8 0000b6b6, Mem[0000000010081408] = ff00ff6b 5fcbdd86
	stda	%f30,[%i2+%o4]0x80	! Mem[0000000010081408] = ff3795a8 0000b6b6
!	%f12 = fffc1197 f596f078, %l4 = 0000000000006bff
!	Mem[00000000100c1408] = 5a2bbe67ff3795a8
	add	%i3,0x008,%g1
	stda	%f12,[%g1+%l4]ASI_PST8_P ! Mem[00000000100c1408] = fffc1197f596f078
!	%l5 = ffffffffffffffff, Mem[000000001000143b] = e5022705
	stb	%l5,[%i0+0x03b]		! Mem[0000000010001438] = e50227ff
!	Mem[00000000300c1408] = 00ff00ff, %l4 = 0000000000006bff
	swapa	[%i3+%o4]0x81,%l4	! %l4 = 0000000000ff00ff
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1404] = ff000000, %l6 = 0000000000000067
	ldsb	[%i3+0x005],%l6		! %l6 = 0000000000000000

!	Check Point 22 for processor 0

	set	p0_check_pt_data_22,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 0000000000000006
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l2,%g2			! %l2 = 00000000000000d0
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l3,%g2			! %l3 = 0000000000000000
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l4,%g2			! %l4 = 0000000000ff00ff
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l5,%g2			! %l5 = ffffffffffffffff
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l6,%g2			! %l6 = 0000000000000000
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l7,%g2			! %l7 = 00000000d0000000
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x40],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = 0000b6b6 00780000
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x48],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 00000000 ff6b53ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x50],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 031a783d f47cffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x58],%g3
	std	%f8,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f8 = b5c330f2 13000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf08,%g1
	ldx	[%g4+0x60],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = d0000000 00ff00ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1

!	Check Point 22 completed


p0_label_111:
!	Mem[0000000030181400] = ff3795a80000b6b6, %l7 = 00000000d0000000
	ldxa	[%i6+%g0]0x81,%l7	! %l7 = ff3795a80000b6b6
!	Mem[0000000021800040] = ff8a9ae4, %l3 = 0000000000000000
	lduh	[%o3+0x040],%l3		! %l3 = 000000000000ff8a
!	Mem[0000000010181420] = 13d90025a97dff77, %f10 = b6b60000 a89537ff
	ldda	[%i6+0x020]%asi,%f10	! %f10 = 13d90025 a97dff77
!	Mem[0000000010001400] = ff000000, %l5 = ffffffffffffffff
	lduwa	[%i0+%g0]0x88,%l5	! %l5 = 00000000ff000000
!	Mem[0000000010081400] = ffbe2bff000000b5, %l7 = ff3795a80000b6b6
	ldx	[%i2+%g0],%l7		! %l7 = ffbe2bff000000b5
!	Mem[00000000100c1428] = ffe8739e, %f24 = a00c1120
	ld	[%i3+0x028],%f24	! %f24 = ffe8739e
!	Mem[0000000010041408] = 6bff00ff, %f6  = 031a783d
	lda	[%i1+%o4]0x80,%f6 	! %f6 = 6bff00ff
!	Mem[0000000020800040] = ffffe25a, %l1 = 0000000067be2b5a
	ldsba	[%o1+0x041]%asi,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000021800080] = d8003b1a, %l3 = 000000000000ff8a
	ldub	[%o3+0x081],%l3		! %l3 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010041410] = 00000000, %l4 = 0000000000ff00ff
	swapa	[%i1+%o5]0x80,%l4	! %l4 = 0000000000000000

p0_label_112:
!	Mem[0000000010041400] = ff0000d0, %l5 = 00000000ff000000
	swapa	[%i1+%g0]0x88,%l5	! %l5 = 00000000ff0000d0
!	%f3  = ff000000, Mem[0000000010101410] = ff000000
	sta	%f3 ,[%i4+%o5]0x88	! Mem[0000000010101410] = ff000000
!	%f28 = 4e478378 82559f9b, Mem[0000000010181410] = 0000b6b6 00780000
	stda	%f28,[%i6+%o5]0x80	! Mem[0000000010181410] = 4e478378 82559f9b
!	%l7 = ffbe2bff000000b5, Mem[0000000030181410] = 000000bd
	stwa	%l7,[%i6+%o5]0x89	! Mem[0000000030181410] = 000000b5
!	%l0 = 0000000000000006, Mem[00000000201c0000] = 00009b8f
	stb	%l0,[%o0+%g0]		! Mem[00000000201c0000] = 06009b8f
!	%l4 = 0000000000000000, Mem[00000000100c1410] = 0000000067be2b5a
	stxa	%l4,[%i3+%o5]0x80	! Mem[00000000100c1410] = 0000000000000000
!	%l4 = 00000000, %l5 = ff0000d0, Mem[0000000010141438] = 3498af52 7ae32cb8
	stda	%l4,[%i5+0x038]%asi	! Mem[0000000010141438] = 00000000 ff0000d0
!	Mem[0000000030101408] = bdc000ff, %l0 = 0000000000000006
	ldstuba	[%i4+%o4]0x81,%l0	! %l0 = 000000bd000000ff
!	%l6 = 0000000000000000, Mem[0000000030101400] = ff3795a8
	stba	%l6,[%i4+%g0]0x81	! Mem[0000000030101400] = 003795a8
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = ff3795a80000b6b6, %l5 = 00000000ff0000d0
	ldxa	[%i2+%o4]0x80,%l5	! %l5 = ff3795a80000b6b6

p0_label_113:
!	Mem[0000000030181408] = ff000000d00000ff, %f24 = ffe8739e 67be2bff
	ldda	[%i6+%o4]0x89,%f24	! %f24 = ff000000 d00000ff
!	Mem[0000000010101408] = 9711fcff, %l7 = ffbe2bff000000b5
	lduba	[%i4+%o4]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030041408] = 00000000, %l7 = 00000000000000ff
	ldsha	[%i1+%o4]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000010041410] = 00ff00ff, %l1 = ffffffffffffffff
	ldsha	[%i1+%o5]0x80,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010141400] = ff6b53ff, %f28 = 4e478378
	lda	[%i5+%g0]0x88,%f28	! %f28 = ff6b53ff
!	Mem[0000000010041400] = 000000ff, %l7 = 0000000000000000
	lduha	[%i1+%g0]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000010101400] = 000000ff, %l1 = 00000000000000ff
	ldswa	[%i4+%g0]0x80,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030101400] = a8953700, %l3 = 0000000000000000
	ldswa	[%i4+%g0]0x89,%l3	! %l3 = ffffffffa8953700
!	Mem[0000000010041400] = 000000ff 721d1aff, %l0 = 000000bd, %l1 = 000000ff
	ldda	[%i1+%g0]0x80,%l0	! %l0 = 00000000000000ff 00000000721d1aff
!	Starting 10 instruction Store Burst
!	Mem[00000000218001c0] = 39ba67be, %l5 = ff3795a80000b6b6
	ldstub	[%o3+0x1c0],%l5		! %l5 = 00000039000000ff

p0_label_114:
!	%f21 = 00ff00ff, Mem[000000001000140c] = f8ceed35
	st	%f21,[%i0+0x00c]	! Mem[000000001000140c] = 00ff00ff
!	%l2 = 000000d0, %l3 = a8953700, Mem[00000000300c1400] = d0000000 00ff00ff
	stda	%l2,[%i3+%g0]0x81	! Mem[00000000300c1400] = 000000d0 a8953700
!	%f12 = fffc1197 f596f078, %l7 = 0000000000000000
!	Mem[0000000030041438] = 000000ffff6b53ba
	add	%i1,0x038,%g1
	stda	%f12,[%g1+%l7]ASI_PST32_SL ! Mem[0000000030041438] = 000000ffff6b53ba
!	%l4 = 0000000000000000, Mem[0000000021800000] = 9933c8c8
	sth	%l4,[%o3+%g0]		! Mem[0000000021800000] = 0000c8c8
!	%l0 = 000000ff, %l1 = 721d1aff, Mem[0000000030181400] = a89537ff b6b60000
	stda	%l0,[%i6+%g0]0x89	! Mem[0000000030181400] = 000000ff 721d1aff
!	%l5 = 0000000000000039, Mem[0000000030041410] = 00000013
	stha	%l5,[%i1+%o5]0x89	! Mem[0000000030041410] = 00000039
!	%l4 = 00000000, %l5 = 00000039, Mem[0000000030081400] = 0000004c 5a2bbe67
	stda	%l4,[%i2+%g0]0x89	! Mem[0000000030081400] = 00000000 00000039
!	Mem[00000000300c1408] = 00006bff, %l6 = 0000000000000000
	swapa	[%i3+%o4]0x81,%l6	! %l6 = 0000000000006bff
!	Mem[000000001004140c] = c13e8186, %l5 = 00000039, %l1 = 721d1aff
	add	%i1,0x0c,%g1
	casa	[%g1]0x80,%l5,%l1	! %l1 = 00000000c13e8186
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = 000000ff, %f26 = 35edcef8
	lda	[%i0+%o4]0x89,%f26	! %f26 = 000000ff

p0_label_115:
!	Mem[00000000201c0000] = 06009b8f, %l0 = 00000000000000ff
	ldsb	[%o0+0x001],%l0		! %l0 = 0000000000000000
!	Mem[0000000010181408] = 00000006, %l5 = 0000000000000039
	lduha	[%i6+%o4]0x88,%l5	! %l5 = 0000000000000006
!	Mem[0000000030001400] = 0000e5ff, %l0 = 0000000000000000
	lduba	[%i0+%g0]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010181408] = 00000006, %l0 = 00000000000000ff
	ldsba	[%i6+%o4]0x88,%l0	! %l0 = 0000000000000006
!	Mem[0000000010141400] = ff536bff d2c70061, %l4 = 00000000, %l5 = 00000006
	ldd	[%i5+%g0],%l4		! %l4 = 00000000ff536bff 00000000d2c70061
!	Mem[0000000010101408] = fffc1197000000ff, %l2 = 00000000000000d0
	ldxa	[%i4+0x008]%asi,%l2	! %l2 = fffc1197000000ff
!	Mem[0000000010181420] = 13d90025, %l7 = 0000000000000000
	lduha	[%i6+0x020]%asi,%l7	! %l7 = 00000000000013d9
!	Mem[00000000211c0000] = ffffb5d7, %l7 = 00000000000013d9
	lduha	[%o2+0x000]%asi,%l7	! %l7 = 000000000000ffff
!	Mem[0000000010081408] = ff3795a8 0000b6b6, %l0 = 00000006, %l1 = c13e8186
	ldda	[%i2+%o4]0x80,%l0	! %l0 = 00000000ff3795a8 000000000000b6b6
!	Starting 10 instruction Store Burst
!	Mem[00000000218000c1] = afbdcbcc, %l3 = ffffffffa8953700
	ldstub	[%o3+0x0c1],%l3		! %l3 = 000000bd000000ff

!	Check Point 23 for processor 0

	set	p0_check_pt_data_23,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 00000000ff3795a8
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 000000000000b6b6
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = fffc1197000000ff
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 00000000000000bd
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l5,%g2			! %l5 = 00000000d2c70061
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l7,%g2			! %l7 = 000000000000ffff
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x38],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = 0000b6b6 00780000
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x40],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 00000000 ff6b53ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x48],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 6bff00ff f47cffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x50],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = 13d90025 a97dff77
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x58],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = ff000000 d00000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1
	ldx	[%g4+0x60],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = 000000ff 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1
	ldx	[%g4+0x68],%g3
	std	%f28,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f28 = ff6b53ff 82559f9b
	bne	%xcc,p0_freg_check_fail
	mov	0xf28,%g1

!	Check Point 23 completed


p0_label_116:
!	%l2 = fffc1197000000ff, Mem[0000000030081408] = ff6b53ba
	stwa	%l2,[%i2+%o4]0x81	! Mem[0000000030081408] = 000000ff
!	%l2 = 000000ff, %l3 = 000000bd, Mem[0000000030081400] = 00000000 00000039
	stda	%l2,[%i2+%g0]0x89	! Mem[0000000030081400] = 000000ff 000000bd
!	Mem[0000000030141408] = ff00c0bd, %l4 = 00000000ff536bff
	swapa	[%i5+%o4]0x81,%l4	! %l4 = 00000000ff00c0bd
!	Mem[0000000030001408] = 000000ff, %l7 = 000000000000ffff
	ldstuba	[%i0+%o4]0x89,%l7	! %l7 = 000000ff000000ff
!	%l7 = 00000000000000ff, Mem[0000000030141410] = 00000000
	stwa	%l7,[%i5+%o5]0x81	! Mem[0000000030141410] = 000000ff
!	Mem[0000000030081400] = 000000ff, %l7 = 00000000000000ff
	swapa	[%i2+%g0]0x89,%l7	! %l7 = 00000000000000ff
!	%l6 = 0000000000006bff, Mem[0000000010081410] = 00000000d0000000
	stxa	%l6,[%i2+%o5]0x80	! Mem[0000000010081410] = 0000000000006bff
!	%f20 = d0000000 00ff00ff, Mem[0000000030101410] = d2c70061 ff536bff
	stda	%f20,[%i4+%o5]0x89	! Mem[0000000030101410] = d0000000 00ff00ff
!	Mem[00000000100c142c] = cc34bfb3, %l7 = 00000000000000ff
	swap	[%i3+0x02c],%l7		! %l7 = 00000000cc34bfb3
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = 000000ff, %l5 = 00000000d2c70061
	lduha	[%i5+%o4]0x88,%l5	! %l5 = 00000000000000ff

p0_label_117:
!	Mem[0000000010101408] = ff0000009711fcff, %f22 = ff3795a8 ff000000
	ldda	[%i4+%o4]0x88,%f22	! %f22 = ff000000 9711fcff
!	Mem[0000000030141410] = ff000000, %l0 = 00000000ff3795a8
	lduha	[%i5+%o5]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000021800040] = ff8a9ae4, %l7 = 00000000cc34bfb3
	ldub	[%o3+0x041],%l7		! %l7 = 000000000000008a
!	Mem[00000000100c1410] = 0000000000000000, %f18 = 5a2bbe67 ff00c0bd
	ldda	[%i3+%o5]0x88,%f18	! %f18 = 00000000 00000000
!	Mem[0000000030081408] = 000000ff052702e5, %f20 = d0000000 00ff00ff
	ldda	[%i2+%o4]0x81,%f20	! %f20 = 000000ff 052702e5
!	Mem[0000000010101400] = ff59ffc8ff000000, %f2  = 5a2bbe67 ff000000
	ldda	[%i4+%g0]0x88,%f2 	! %f2  = ff59ffc8 ff000000
!	Mem[0000000010041408] = 86813ec1ff00ff6b, %f28 = ff6b53ff 82559f9b
	ldda	[%i1+%o4]0x88,%f28	! %f28 = 86813ec1 ff00ff6b
!	Mem[0000000010081400] = b5000000 ff2bbeff, %l4 = ff00c0bd, %l5 = 000000ff
	ldda	[%i2+%g0]0x88,%l4	! %l4 = 00000000ff2bbeff 00000000b5000000
!	Mem[0000000030041408] = 0000000000000000, %l1 = 000000000000b6b6
	ldxa	[%i1+%o4]0x81,%l1	! %l1 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1400] = ff780000, %l0 = 0000000000000000
	ldstuba	[%i3+%g0]0x88,%l0	! %l0 = 00000000000000ff

p0_label_118:
!	Mem[0000000010141420] = 031a783d, %l7 = 0000008a, %l7 = 0000008a
	add	%i5,0x20,%g1
	casa	[%g1]0x80,%l7,%l7	! %l7 = 00000000031a783d
!	%f20 = 000000ff, Mem[0000000010101408] = 9711fcff
	sta	%f20,[%i4+%o4]0x88	! Mem[0000000010101408] = 000000ff
!	Mem[0000000010181410] = 4e478378, %l3 = 00000000000000bd
	ldsba	[%i6+%o5]0x80,%l3	! %l3 = 000000000000004e
!	%l2 = fffc1197000000ff, Mem[00000000100c1400] = ff0078ff
	stwa	%l2,[%i3+%g0]0x80	! Mem[00000000100c1400] = 000000ff
!	Mem[0000000010081436] = f596f078, %l1 = 0000000000000000
	ldstuba	[%i2+0x036]%asi,%l1	! %l1 = 000000f0000000ff
!	Mem[0000000030081400] = ff000000, %l3 = 000000000000004e
	swapa	[%i2+%g0]0x81,%l3	! %l3 = 00000000ff000000
!	%l3 = 00000000ff000000, Mem[0000000010001412] = f4d8a1f6, %asi = 80
	stha	%l3,[%i0+0x012]%asi	! Mem[0000000010001410] = f4d80000
!	Mem[00000000300c1408] = 00000000, %l4 = 00000000ff2bbeff
	ldstuba	[%i3+%o4]0x81,%l4	! %l4 = 00000000000000ff
!	%l0 = 0000000000000000, Mem[0000000030141408] = ff536bff
	stha	%l0,[%i5+%o4]0x81	! Mem[0000000030141408] = 00006bff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = ffbe2bff000000b5, %f12 = fffc1197 f596f078
	ldda	[%i2+%g0]0x80,%f12	! %f12 = ffbe2bff 000000b5

p0_label_119:
!	Mem[0000000010141438] = 00000000, %l0 = 0000000000000000
	ldsba	[%i5+0x03b]%asi,%l0	! %l0 = 0000000000000000
!	Mem[0000000010041404] = 721d1aff, %l5 = 00000000b5000000
	lduh	[%i1+0x006],%l5		! %l5 = 0000000000001aff
!	Mem[0000000010041434] = ff000000, %l6 = 0000000000006bff
	ldsw	[%i1+0x034],%l6		! %l6 = ffffffffff000000
!	Mem[0000000010001408] = ff000000, %l4 = 0000000000000000
	lduwa	[%i0+%o4]0x80,%l4	! %l4 = 00000000ff000000
!	Mem[000000001000143c] = a89537ff, %l4 = 00000000ff000000
	ldsh	[%i0+0x03e],%l4		! %l4 = 00000000000037ff
!	Mem[00000000100c1410] = 00000000, %f28 = 86813ec1
	lda	[%i3+%o5]0x80,%f28	! %f28 = 00000000
!	Mem[00000000300c1410] = ff6b53ff, %l7 = 00000000031a783d
	lduha	[%i3+%o5]0x89,%l7	! %l7 = 00000000000053ff
!	Mem[0000000010101400] = 000000ff, %l0 = 0000000000000000
	ldsha	[%i4+%g0]0x80,%l0	! %l0 = 0000000000000000
!	Mem[00000000300c1410] = 6100c7d2ff6b53ff, %f20 = 000000ff 052702e5
	ldda	[%i3+%o5]0x89,%f20	! %f20 = 6100c7d2 ff6b53ff
!	Starting 10 instruction Store Burst
!	Mem[0000000021800181] = a11d2710, %l7 = 00000000000053ff
	ldstuba	[%o3+0x181]%asi,%l7	! %l7 = 0000001d000000ff

p0_label_120:
!	%l6 = ffffffffff000000, Mem[0000000010001410] = f4d800005a2bbe67
	stxa	%l6,[%i0+%o5]0x80	! Mem[0000000010001410] = ffffffffff000000
!	%f2  = ff59ffc8 ff000000, Mem[0000000030081408] = 000000ff 052702e5
	stda	%f2 ,[%i2+%o4]0x81	! Mem[0000000030081408] = ff59ffc8 ff000000
!	Mem[00000000201c0001] = 06009b8f, %l1 = 00000000000000f0
	ldstub	[%o0+0x001],%l1		! %l1 = 00000000000000ff
!	%l0 = 00000000, %l1 = 00000000, Mem[0000000010181410] = 7883474e 9b9f5582
	stda	%l0,[%i6+%o5]0x88	! Mem[0000000010181410] = 00000000 00000000
!	%f30 = ff3795a8, Mem[00000000300c1408] = 000000ff
	sta	%f30,[%i3+%o4]0x89	! Mem[00000000300c1408] = ff3795a8
!	%f14 = ba536bff 5fcbdd86, %l3 = 00000000ff000000
!	Mem[00000000300c1418] = ff3795a8ff000000
	add	%i3,0x018,%g1
	stda	%f14,[%g1+%l3]ASI_PST8_SL ! Mem[00000000300c1418] = ff3795a8ff000000
!	%l7 = 000000000000001d, Mem[00000000201c0000] = 06ff9b8f, %asi = 80
	stha	%l7,[%o0+0x000]%asi	! Mem[00000000201c0000] = 001d9b8f
!	%l3 = 00000000ff000000, Mem[0000000030101410] = ff00ff00000000d0
	stxa	%l3,[%i4+%o5]0x81	! Mem[0000000030101410] = 00000000ff000000
!	Mem[0000000030001410] = ff022705, %l5 = 0000000000001aff
	ldstuba	[%i0+%o5]0x81,%l5	! %l5 = 000000ff000000ff
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (19)
!	Mem[0000000030041400] = d00059ff a89537ff 00000000 00000000
!	Mem[0000000030041410] = 39000000 ff0000ff ff3795a8 ff000000
!	Mem[0000000030041420] = a00c1120 67be2bff a00c0000 b3d011ff
!	Mem[0000000030041430] = 4e478378 82559f9b 000000ff ff6b53ba
	ldda	[%i1]ASI_BLK_S,%f0	! Block Load from 0000000030041400

!	Check Point 24 for processor 0

	set	p0_check_pt_data_24,%g4
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
	cmp	%l3,%g2			! %l3 = 00000000ff000000
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l4,%g2			! %l4 = 00000000000037ff
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l5,%g2			! %l5 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l6,%g2			! %l6 = ffffffffff000000
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l7,%g2			! %l7 = 000000000000001d
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	nop				! Wait out %f0 latency
	nop				! Wait out %f0 latency
	nop				! Wait out %f0 latency
	nop				! Wait out %f0 latency
	ldx	[%g4+0x40],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = d00059ff a89537ff
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
	cmp	%g3,%g2			! %f4 = 39000000 ff0000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x58],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = ff3795a8 ff000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x60],%g3
	std	%f8,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f8 = a00c1120 67be2bff
	bne	%xcc,p0_freg_check_fail
	mov	0xf08,%g1
	ldx	[%g4+0x68],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = a00c0000 b3d011ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x70],%g3
	std	%f12,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f12 = 4e478378 82559f9b
	bne	%xcc,p0_freg_check_fail
	mov	0xf12,%g1
	ldx	[%g4+0x78],%g3
	std	%f14,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f14 = 000000ff ff6b53ba
	bne	%xcc,p0_freg_check_fail
	mov	0xf14,%g1
	ldx	[%g4+0x80],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = 00000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1
	ldx	[%g4+0x88],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = 6100c7d2 ff6b53ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1
	ldx	[%g4+0x90],%g3
	std	%f22,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f22 = ff000000 9711fcff
	bne	%xcc,p0_freg_check_fail
	mov	0xf22,%g1
	ldx	[%g4+0x98],%g3
	std	%f28,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f28 = 00000000 ff00ff6b
	bne	%xcc,p0_freg_check_fail
	mov	0xf28,%g1

!	Check Point 24 completed


p0_label_121:
!	Mem[0000000010081408] = a89537ff, %l0 = 0000000000000000
	lduba	[%i2+%o4]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010081418] = 8e0705b0, %f11 = b3d011ff
	ld	[%i2+0x018],%f11	! %f11 = 8e0705b0
!	Mem[00000000100c1418] = a4590300f9fbe3e0, %f4  = 39000000 ff0000ff
	ldda	[%i3+0x018]%asi,%f4 	! %f4  = a4590300 f9fbe3e0
!	Mem[0000000010041410] = ff00ff00, %l6 = ffffffffff000000
	lduba	[%i1+%o5]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000010141408] = ff000000 fffc1197, %l4 = 000037ff, %l5 = 000000ff
	ldda	[%i5+%o4]0x80,%l4	! %l4 = 00000000ff000000 00000000fffc1197
!	Mem[0000000010101400] = ff000000, %l3 = 00000000ff000000
	ldsha	[%i4+%g0]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000010081420] = 00006bff, %l1 = 0000000000000000
	ldsh	[%i2+0x020],%l1		! %l1 = 0000000000000000
!	Mem[0000000010181408] = 06000000, %l3 = 0000000000000000
	lduwa	[%i6+%o4]0x80,%l3	! %l3 = 0000000006000000
!	Mem[0000000010181410] = 0000000000000000, %l7 = 000000000000001d
	ldxa	[%i6+%o5]0x88,%l7	! %l7 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f12 = 4e478378, Mem[0000000010141414] = 67be2b5a
	sta	%f12,[%i5+0x014]%asi	! Mem[0000000010141414] = 4e478378

p0_label_122:
!	Mem[00000000300c1408] = a89537ff, %l3 = 0000000006000000
	swapa	[%i3+%o4]0x81,%l3	! %l3 = 00000000a89537ff
!	%f6  = ff3795a8 ff000000, %l6 = 0000000000000000
!	Mem[00000000300c1420] = a00c112067be2bff
	add	%i3,0x020,%g1
	stda	%f6,[%g1+%l6]ASI_PST8_S ! Mem[00000000300c1420] = a00c112067be2bff
!	%l1 = 0000000000000000, Mem[0000000010081408] = ff3795a80000b6b6
	stxa	%l1,[%i2+%o4]0x80	! Mem[0000000010081408] = 0000000000000000
!	Mem[0000000010141408] = 000000ff, %l0 = 00000000000000ff
	ldstuba	[%i5+%o4]0x88,%l0	! %l0 = 000000ff000000ff
!	%l2 = 000000ff, %l3 = a89537ff, Mem[0000000010101410] = 000000ff ff6b53ba
	stda	%l2,[%i4+0x010]%asi	! Mem[0000000010101410] = 000000ff a89537ff
	membar	#Sync			! Added by membar checker (20)
!	%f30 = ff3795a8 0000b6b6, Mem[0000000030041410] = 39000000 ff0000ff
	stda	%f30,[%i1+%o5]0x81	! Mem[0000000030041410] = ff3795a8 0000b6b6
!	Mem[0000000030141400] = 4c0000ff, %l1 = 0000000000000000
	swapa	[%i5+%g0]0x89,%l1	! %l1 = 000000004c0000ff
!	%l2 = fffc1197000000ff, Mem[000000001018143c] = 6f646dc7
	stb	%l2,[%i6+0x03c]		! Mem[000000001018143c] = ff646dc7
!	Mem[00000000300c1408] = 00000006, %l1 = 000000004c0000ff
	swapa	[%i3+%o4]0x89,%l1	! %l1 = 0000000000000006
!	Starting 10 instruction Load Burst
!	Mem[0000000030001400] = ffe50000, %l0 = 00000000000000ff
	lduwa	[%i0+%g0]0x81,%l0	! %l0 = 00000000ffe50000

p0_label_123:
!	Mem[0000000030141400] = 00000000, %l4 = 00000000ff000000
	ldswa	[%i5+%g0]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000010041400] = ff000000, %l3 = 00000000a89537ff
	ldsha	[%i1+%g0]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000010081410] = 0000000000006bff, %f24 = ff000000 d00000ff
	ldda	[%i2+0x010]%asi,%f24	! %f24 = 00000000 00006bff
!	Mem[0000000010001434] = ff6b53ff, %f20 = 6100c7d2
	ld	[%i0+0x034],%f20	! %f20 = ff6b53ff
!	Mem[0000000010041410] = 00ff00ff, %l4 = 0000000000000000
	lduha	[%i1+%o5]0x80,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010041410] = 00ff00ff, %l7 = 0000000000000000
	lduba	[%i1+%o5]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000030181410] = b5000000, %f9  = 67be2bff
	lda	[%i6+%o5]0x81,%f9 	! %f9 = b5000000
!	Mem[0000000010041410] = 00ff00ff, %l1 = 0000000000000006
	ldub	[%i1+%o5],%l1		! %l1 = 0000000000000000
!	Mem[00000000201c0000] = 001d9b8f, %l3 = 0000000000000000
	lduba	[%o0+0x001]%asi,%l3	! %l3 = 000000000000001d
!	Starting 10 instruction Store Burst
!	Mem[0000000010081408] = 00000000, %l3 = 000000000000001d
	ldstuba	[%i2+%o4]0x80,%l3	! %l3 = 00000000000000ff

p0_label_124:
!	%f12 = 4e478378 82559f9b, Mem[0000000030141410] = ff000000 00000000
	stda	%f12,[%i5+%o5]0x89	! Mem[0000000030141410] = 4e478378 82559f9b
!	Mem[0000000020800000] = f4ff7fc1, %l1 = 0000000000000000
	ldstuba	[%o1+0x000]%asi,%l1	! %l1 = 000000f4000000ff
!	%f11 = 8e0705b0, Mem[0000000010081400] = ffbe2bff
	sta	%f11,[%i2+%g0]0x80	! Mem[0000000010081400] = 8e0705b0
!	Mem[0000000030041410] = ff3795a8, %l6 = 0000000000000000
	ldstuba	[%i1+%o5]0x81,%l6	! %l6 = 000000ff000000ff
!	Mem[00000000300c1410] = ff6b53ff, %l7 = 0000000000000000
	ldstuba	[%i3+%o5]0x89,%l7	! %l7 = 000000ff000000ff
!	Mem[0000000010141408] = 000000ff, %l5 = 00000000fffc1197
	ldstuba	[%i5+%o4]0x88,%l5	! %l5 = 000000ff000000ff
!	%l0 = 00000000ffe50000, Mem[0000000010041400] = 000000ff
	stba	%l0,[%i1+%g0]0x80	! Mem[0000000010041400] = 000000ff
!	Mem[0000000010041424] = ffffffff, %l3 = 0000000000000000
	swap	[%i1+0x024],%l3		! %l3 = 00000000ffffffff
!	%l4 = 00000000000000ff, Mem[0000000010041408] = 6bff00ff
	stwa	%l4,[%i1+%o4]0x80	! Mem[0000000010041408] = 000000ff
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = ff00004c, %l0 = 00000000ffe50000
	lduba	[%i3+%o4]0x81,%l0	! %l0 = 00000000000000ff

p0_label_125:
!	Mem[0000000010101410] = 000000ff, %l4 = 00000000000000ff
	lduwa	[%i4+%o5]0x80,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010181400] = 000000000000d03e, %l0 = 00000000000000ff
	ldxa	[%i6+%g0]0x80,%l0	! %l0 = 000000000000d03e
!	Mem[0000000030141400] = 00000000 f230c3b5, %l2 = 000000ff, %l3 = ffffffff
	ldda	[%i5+%g0]0x81,%l2	! %l2 = 0000000000000000 00000000f230c3b5
!	Mem[0000000010081400] = b005078e, %l5 = 00000000000000ff
	lduba	[%i2+%g0]0x88,%l5	! %l5 = 000000000000008e
!	Mem[0000000010001400] = 000000fff596f0ff, %f26 = 000000ff 000000ff
	ldda	[%i0+%g0]0x80,%f26	! %f26 = 000000ff f596f0ff
!	Mem[00000000211c0000] = ffffb5d7, %l6 = 00000000000000ff
	ldsh	[%o2+%g0],%l6		! %l6 = ffffffffffffffff
!	Mem[0000000030001400] = 0000e5ff, %l6 = ffffffffffffffff
	ldsha	[%i0+%g0]0x89,%l6	! %l6 = ffffffffffffe5ff
!	Mem[0000000030081410] = ff6b53ff, %l0 = 000000000000d03e
	ldsba	[%i2+%o5]0x81,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010001410] = ffffffff, %l4 = 00000000000000ff
	ldsba	[%i0+%o5]0x80,%l4	! %l4 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	Mem[0000000010101400] = 000000ff, %l2 = 0000000000000000
	swapa	[%i4+%g0]0x80,%l2	! %l2 = 00000000000000ff

!	Check Point 25 for processor 0

	set	p0_check_pt_data_25,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = ffffffffffffffff
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 00000000000000f4
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l3,%g2			! %l3 = 00000000f230c3b5
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l4,%g2			! %l4 = ffffffffffffffff
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l5,%g2			! %l5 = 000000000000008e
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l6,%g2			! %l6 = ffffffffffffe5ff
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l7,%g2			! %l7 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x40],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = 00000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x48],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = a4590300 f9fbe3e0
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x50],%g3
	std	%f8,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f8 = a00c1120 b5000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf08,%g1
	ldx	[%g4+0x58],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = a00c0000 8e0705b0
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x60],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = ff6b53ff ff6b53ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1
	ldx	[%g4+0x68],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = 00000000 00006bff
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1
	ldx	[%g4+0x70],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = 000000ff f596f0ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1

!	Check Point 25 completed


p0_label_126:
!	%l2 = 00000000000000ff, Mem[0000000010081408] = 000000ff
	stha	%l2,[%i2+%o4]0x88	! Mem[0000000010081408] = 000000ff
!	Mem[0000000010041404] = 721d1aff, %l2 = 00000000000000ff
	swap	[%i1+0x004],%l2		! %l2 = 00000000721d1aff
!	%l5 = 000000000000008e, Mem[0000000010081400] = b005078e
	stba	%l5,[%i2+%g0]0x88	! Mem[0000000010081400] = b005078e
!	Mem[0000000010081410] = 00000000, %l0 = ffffffffffffffff
	ldstuba	[%i2+%o5]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[00000000211c0001] = ffffb5d7, %l0 = 0000000000000000
	ldstub	[%o2+0x001],%l0		! %l0 = 000000ff000000ff
!	Mem[0000000010101408] = ff000000, %l5 = 000000000000008e
	ldstuba	[%i4+%o4]0x80,%l5	! %l5 = 000000ff000000ff
!	Mem[0000000010081410] = 000000ff, %l1 = 00000000000000f4
	swapa	[%i2+%o5]0x88,%l1	! %l1 = 00000000000000ff
!	%f25 = 00006bff, Mem[0000000010101410] = 000000ff
	st	%f25,[%i4+%o5]		! Mem[0000000010101410] = 00006bff
!	Mem[0000000010181401] = 00000000, %l5 = 00000000000000ff
	ldstuba	[%i6+0x001]%asi,%l5	! %l5 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = 000000ff, %l1 = 00000000000000ff
	lduwa	[%i1+0x008]%asi,%l1	! %l1 = 00000000000000ff

p0_label_127:
!	Mem[0000000030101408] = 5a2bbe67 ff00c0ff, %l6 = ffffe5ff, %l7 = 000000ff
	ldda	[%i4+%o4]0x89,%l6	! %l6 = 00000000ff00c0ff 000000005a2bbe67
!	Mem[00000000100c1400] = 000000ff, %l3 = 00000000f230c3b5
	ldsha	[%i3+%g0]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000030081410] = ff536bff, %l1 = 00000000000000ff
	ldswa	[%i2+%o5]0x89,%l1	! %l1 = ffffffffff536bff
!	Mem[0000000010101428] = 0000004c, %l3 = 0000000000000000
	lduh	[%i4+0x028],%l3		! %l3 = 0000000000000000
!	Mem[00000000100c1410] = 00000000, %l1 = ffffffffff536bff
	lduba	[%i3+%o5]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010041438] = e502270500000000, %f14 = 000000ff ff6b53ba
	ldda	[%i1+0x038]%asi,%f14	! %f14 = e5022705 00000000
!	Mem[0000000020800000] = ffff7fc1, %l7 = 000000005a2bbe67
	lduba	[%o1+0x000]%asi,%l7	! %l7 = 00000000000000ff
!	Mem[0000000020800040] = ffffe25a, %l2 = 00000000721d1aff
	ldsb	[%o1+0x040],%l2		! %l2 = ffffffffffffffff
!	Mem[0000000010001418] = 6870b6b63d781a03, %l3 = 0000000000000000
	ldx	[%i0+0x018],%l3		! %l3 = 6870b6b63d781a03
!	Starting 10 instruction Store Burst
!	Mem[0000000030081400] = 4e000000, %l6 = 00000000ff00c0ff
	swapa	[%i2+%g0]0x89,%l6	! %l6 = 000000004e000000

p0_label_128:
!	%l5 = 0000000000000000, Mem[0000000030141408] = 00006bff
	stba	%l5,[%i5+%o4]0x81	! Mem[0000000030141408] = 00006bff
!	Mem[0000000030041400] = d00059ff, %l2 = ffffffffffffffff
	swapa	[%i1+%g0]0x81,%l2	! %l2 = 00000000d00059ff
!	Mem[0000000010181400] = 0000ff00, %l6 = 000000004e000000
	swapa	[%i6+%g0]0x88,%l6	! %l6 = 000000000000ff00
!	%l0 = 000000ff, %l1 = 00000000, Mem[0000000010081410] = 000000f4 ff6b0000
	stda	%l0,[%i2+%o5]0x88	! Mem[0000000010081410] = 000000ff 00000000
!	%l0 = 000000ff, %l1 = 00000000, Mem[0000000010141410] = 000000ff 4e478378
	stda	%l0,[%i5+%o5]0x80	! Mem[0000000010141410] = 000000ff 00000000
!	Mem[0000000030041410] = ff3795a8, %l0 = 00000000000000ff
	ldstuba	[%i1+%o5]0x81,%l0	! %l0 = 000000ff000000ff
!	%f6  = ff3795a8 ff000000, %l0 = 00000000000000ff
!	Mem[0000000030041438] = 000000ffff6b53ba
	add	%i1,0x038,%g1
	stda	%f6,[%g1+%l0]ASI_PST8_SL ! Mem[0000000030041438] = 000000ffa89537ff
!	Mem[00000000100c1408] = 9711fcff, %l3 = 6870b6b63d781a03
	ldstuba	[%i3+%o4]0x88,%l3	! %l3 = 000000ff000000ff
!	%l7 = 00000000000000ff, Mem[0000000010101410] = 00006bffa89537ff, %asi = 80
	stxa	%l7,[%i4+0x010]%asi	! Mem[0000000010101410] = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = ffffffff, %l4 = ffffffffffffffff
	lduha	[%i0+%o5]0x80,%l4	! %l4 = 000000000000ffff

p0_label_129:
!	Mem[0000000010081400] = 8e0705b0, %l3 = 00000000000000ff
	lduwa	[%i2+%g0]0x80,%l3	! %l3 = 000000008e0705b0
!	Mem[0000000010181408] = 06000000, %l2 = 00000000d00059ff
	lduha	[%i6+%o4]0x80,%l2	! %l2 = 0000000000000600
!	Mem[0000000030141410] = 9b9f5582, %l1 = 0000000000000000
	ldswa	[%i5+%o5]0x81,%l1	! %l1 = ffffffff9b9f5582
!	Mem[0000000030001400] = ffe5000000000000, %l7 = 00000000000000ff
	ldxa	[%i0+%g0]0x81,%l7	! %l7 = ffe5000000000000
!	Mem[00000000100c1414] = 00000000, %l7 = ffe5000000000000
	ldub	[%i3+0x015],%l7		! %l7 = 0000000000000000
!	Mem[00000000100c1418] = a4590300, %l4 = 000000000000ffff
	ldsba	[%i3+0x01b]%asi,%l4	! %l4 = 0000000000000000
!	Mem[0000000030081410] = ff6b53ff, %l5 = 0000000000000000
	ldsba	[%i2+%o5]0x81,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000010141410] = ff000000, %l7 = 0000000000000000
	ldsba	[%i5+%o5]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000010001428] = ffffffff5debeccd, %f4  = a4590300 f9fbe3e0
	ldd	[%i0+0x028],%f4 	! %f4  = ffffffff 5debeccd
!	Starting 10 instruction Store Burst
!	%l7 = 0000000000000000, Mem[0000000030141408] = ff6b0000
	stwa	%l7,[%i5+%o4]0x89	! Mem[0000000030141408] = 00000000

p0_label_130:
!	Mem[0000000010101424] = 0000008a, %l3 = 8e0705b0, %l5 = ffffffff
	add	%i4,0x24,%g1
	casa	[%g1]0x80,%l3,%l5	! %l5 = 000000000000008a
!	%l3 = 000000008e0705b0, Mem[0000000030101410] = 00000000
	stwa	%l3,[%i4+%o5]0x89	! Mem[0000000030101410] = 8e0705b0
!	%l1 = ffffffff9b9f5582, Mem[0000000010041400] = 000000ff, %asi = 80
	stha	%l1,[%i1+0x000]%asi	! Mem[0000000010041400] = 558200ff
!	Mem[0000000030081410] = ff6b53ff, %l0 = 00000000000000ff
	ldstuba	[%i2+%o5]0x81,%l0	! %l0 = 000000ff000000ff
!	%l2 = 0000000000000600, Mem[000000001014141a] = ff795814, %asi = 80
	stha	%l2,[%i5+0x01a]%asi	! Mem[0000000010141418] = ff790600
!	%f4  = ffffffff 5debeccd, Mem[0000000010181410] = 00000000 00000000
	stda	%f4 ,[%i6+%o5]0x80	! Mem[0000000010181410] = ffffffff 5debeccd
!	%l4 = 0000000000000000, Mem[0000000010101400] = 00000000
	stwa	%l4,[%i4+%g0]0x80	! Mem[0000000010101400] = 00000000
!	Mem[000000001004140c] = c13e8186, %l0 = 000000ff, %l5 = 0000008a
	add	%i1,0x0c,%g1
	casa	[%g1]0x80,%l0,%l5	! %l5 = 00000000c13e8186
!	%l1 = ffffffff9b9f5582, Mem[0000000010001408] = ff00ff00000000ff
	stxa	%l1,[%i0+%o4]0x88	! Mem[0000000010001408] = ffffffff9b9f5582
!	Starting 10 instruction Load Burst
!	Mem[0000000010101434] = 00000061, %l5 = 00000000c13e8186
	lduwa	[%i4+0x034]%asi,%l5	! %l5 = 0000000000000061

!	Check Point 26 for processor 0

	set	p0_check_pt_data_26,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = ffffffff9b9f5582
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 0000000000000600
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 000000008e0705b0
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 0000000000000000
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 0000000000000061
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l7,%g2			! %l7 = 0000000000000000
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x40],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = ffffffff 5debeccd
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x48],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = ff3795a8 ff000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x50],%g3
	std	%f14,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f14 = e5022705 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf14,%g1

!	Check Point 26 completed


p0_label_131:
!	Mem[0000000030181400] = ff000000, %l5 = 0000000000000061
	lduba	[%i6+%g0]0x81,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030081408] = c8ff59ff, %l7 = 0000000000000000
	ldswa	[%i2+%o4]0x89,%l7	! %l7 = ffffffffc8ff59ff
!	Mem[00000000218000c0] = afffcbcc, %l7 = ffffffffc8ff59ff
	lduha	[%o3+0x0c0]%asi,%l7	! %l7 = 000000000000afff
!	Mem[0000000010101400] = 00000000, %f0  = d00059ff
	lda	[%i4+%g0]0x80,%f0 	! %f0 = 00000000
!	Mem[00000000201c0000] = 001d9b8f, %l6 = 000000000000ff00
	ldsba	[%o0+0x000]%asi,%l6	! %l6 = 0000000000000000
!	Mem[0000000030141400] = 00000000f230c3b5, %l7 = 000000000000afff
	ldxa	[%i5+%g0]0x81,%l7	! %l7 = 00000000f230c3b5
!	Mem[0000000010181400] = 4e000000, %l4 = 0000000000000000
	ldsba	[%i6+%g0]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000010041410] = 00000000 ff00ff00, %l0 = 000000ff, %l1 = 9b9f5582
	ldda	[%i1+%o5]0x88,%l0	! %l0 = 00000000ff00ff00 0000000000000000
!	Mem[0000000010141400] = ff6b53ff, %l0 = 00000000ff00ff00
	ldsba	[%i5+%g0]0x88,%l0	! %l0 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l4 = 00000000, %l5 = 000000ff, Mem[0000000030101400] = 003795a8 d0000000
	stda	%l4,[%i4+%g0]0x81	! Mem[0000000030101400] = 00000000 000000ff

p0_label_132:
!	%l2 = 0000000000000600, Mem[0000000010181400] = 0000004e
	stha	%l2,[%i6+%g0]0x80	! Mem[0000000010181400] = 0600004e
!	Mem[0000000030141410] = 9b9f5582, %l2 = 0000000000000600
	ldstuba	[%i5+%o5]0x81,%l2	! %l2 = 0000009b000000ff
!	Mem[0000000010081410] = 000000ff, %l4 = 0000000000000000
	ldstuba	[%i2+%o5]0x88,%l4	! %l4 = 000000ff000000ff
!	Mem[0000000020800000] = ffff7fc1, %l3 = 000000008e0705b0
	ldstub	[%o1+%g0],%l3		! %l3 = 000000ff000000ff
!	Mem[0000000010181400] = 4e000006, %l1 = 0000000000000000
	ldstuba	[%i6+%g0]0x88,%l1	! %l1 = 00000006000000ff
!	%f12 = 4e478378 82559f9b, Mem[0000000030101410] = b005078e ff000000
	stda	%f12,[%i4+%o5]0x81	! Mem[0000000030101410] = 4e478378 82559f9b
!	%f24 = 00000000 00006bff, %l4 = 00000000000000ff
!	Mem[0000000010081418] = 8e0705b0ef662ee2
	add	%i2,0x018,%g1
	stda	%f24,[%g1+%l4]ASI_PST8_PL ! Mem[0000000010081418] = ff6b000000000000
!	%l4 = 000000ff, %l5 = 000000ff, Mem[0000000010181400] = ff00004e 0000d03e
	std	%l4,[%i6+%g0]		! Mem[0000000010181400] = 000000ff 000000ff
!	%l3 = 00000000000000ff, Mem[00000000300c1410] = ff536bff
	stba	%l3,[%i3+%o5]0x81	! Mem[00000000300c1410] = ff536bff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = ff000000, %l3 = 00000000000000ff
	ldsha	[%i0+%g0]0x88,%l3	! %l3 = 0000000000000000

p0_label_133:
!	Mem[0000000030181400] = ff000000ff1a1d72, %l3 = 0000000000000000
	ldxa	[%i6+%g0]0x81,%l3	! %l3 = ff000000ff1a1d72
!	Mem[000000001004140c] = c13e8186, %l2 = 000000000000009b
	lduba	[%i1+0x00f]%asi,%l2	! %l2 = 0000000000000086
!	Mem[0000000030041410] = a89537ff, %l4 = 00000000000000ff
	ldsha	[%i1+%o5]0x89,%l4	! %l4 = 00000000000037ff
!	Mem[0000000030081410] = c76d6721ff536bff, %l4 = 00000000000037ff
	ldxa	[%i2+%o5]0x89,%l4	! %l4 = c76d6721ff536bff
!	Mem[0000000030101408] = ffc000ff, %l5 = 00000000000000ff
	lduwa	[%i4+%o4]0x81,%l5	! %l5 = 00000000ffc000ff
!	Mem[00000000100c1430] = 130fe697000000d0, %f12 = 4e478378 82559f9b
	ldd	[%i3+0x030],%f12	! %f12 = 130fe697 000000d0
!	Mem[0000000010041420] = 6870b6b600000000, %l4 = c76d6721ff536bff
	ldxa	[%i1+0x020]%asi,%l4	! %l4 = 6870b6b600000000
!	Mem[000000001008140c] = 00000000, %l6 = 0000000000000000
	lduh	[%i2+0x00c],%l6		! %l6 = 0000000000000000
!	Mem[0000000010181424] = a97dff77, %l4 = 6870b6b600000000
	ldsw	[%i6+0x024],%l4		! %l4 = ffffffffa97dff77
!	Starting 10 instruction Store Burst
!	%l3 = ff000000ff1a1d72, Mem[0000000030181400] = 000000ff
	stha	%l3,[%i6+%g0]0x89	! Mem[0000000030181400] = 00001d72

p0_label_134:
!	%l1 = 0000000000000006, Mem[00000000300c1408] = ff00004c
	stwa	%l1,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00000006
!	%l5 = 00000000ffc000ff, Mem[0000000030181400] = 721d0000
	stha	%l5,[%i6+%g0]0x81	! Mem[0000000030181400] = 00ff0000
!	%l0 = ffffffffffffffff, Mem[00000000201c0001] = 001d9b8f
	stb	%l0,[%o0+0x001]		! Mem[00000000201c0000] = 00ff9b8f
!	Mem[00000000201c0000] = 00ff9b8f, %l4 = ffffffffa97dff77
	ldstuba	[%o0+0x000]%asi,%l4	! %l4 = 00000000000000ff
!	Mem[00000000100c1410] = 00000000, %l4 = 0000000000000000
	ldstuba	[%i3+%o5]0x88,%l4	! %l4 = 00000000000000ff
!	%f12 = 130fe697 000000d0, Mem[0000000030041410] = ff3795a8 0000b6b6
	stda	%f12,[%i1+%o5]0x81	! Mem[0000000030041410] = 130fe697 000000d0
!	%l4 = 00000000, %l5 = ffc000ff, Mem[0000000030001410] = 052702ff ff3795a8
	stda	%l4,[%i0+%o5]0x89	! Mem[0000000030001410] = 00000000 ffc000ff
!	Mem[0000000010001410] = ffffffff, %l6 = 0000000000000000, %asi = 80
	swapa	[%i0+0x010]%asi,%l6	! %l6 = 00000000ffffffff
!	%f30 = ff3795a8 0000b6b6, %l5 = 00000000ffc000ff
!	Mem[0000000010001430] = d0000000ff6b53ff
	add	%i0,0x030,%g1
	stda	%f30,[%g1+%l5]ASI_PST32_PL ! Mem[0000000010001430] = b6b60000a89537ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = ff000000, %l3 = ff000000ff1a1d72
	lduba	[%i0+%g0]0x88,%l3	! %l3 = 0000000000000000

p0_label_135:
!	Mem[0000000010081430] = fffc1197, %l3 = 0000000000000000
	lduh	[%i2+0x032],%l3		! %l3 = 0000000000001197
!	Mem[0000000030081400] = ff00c0ff, %l5 = 00000000ffc000ff
	ldsha	[%i2+%g0]0x89,%l5	! %l5 = ffffffffffffc0ff
!	Mem[000000001018142c] = 000000ff, %l1 = 0000000000000006
	ldswa	[%i6+0x02c]%asi,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010141428] = 00000000, %l5 = ffffffffffffc0ff
	ldsb	[%i5+0x02a],%l5		! %l5 = 0000000000000000
!	Mem[0000000010041408] = 000000ff c13e8186, %l0 = ffffffff, %l1 = 000000ff
	ldda	[%i1+%o4]0x80,%l0	! %l0 = 00000000000000ff 00000000c13e8186
!	Mem[0000000021800040] = ff8a9ae4, %l5 = 0000000000000000
	ldsha	[%o3+0x040]%asi,%l5	! %l5 = ffffffffffffff8a
!	Mem[0000000030101410] = 4e478378 82559f9b, %l0 = 000000ff, %l1 = c13e8186
	ldda	[%i4+%o5]0x81,%l0	! %l0 = 000000004e478378 0000000082559f9b
!	Mem[0000000010081408] = ff000000, %f31 = 0000b6b6
	ld	[%i2+%o4],%f31	! %f31 = ff000000
!	Mem[000000001008143c] = 1ddb824c, %l2 = 0000000000000086
	ldub	[%i2+0x03e],%l2		! %l2 = 0000000000000082
!	Starting 10 instruction Store Burst
!	%l2 = 00000082, %l3 = 00001197, Mem[0000000030181400] = 00ff0000 ff1a1d72
	stda	%l2,[%i6+%g0]0x81	! Mem[0000000030181400] = 00000082 00001197

!	Check Point 27 for processor 0

	set	p0_check_pt_data_27,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 000000004e478378
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 0000000082559f9b
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 0000000000000082
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 0000000000001197
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 0000000000000000
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = ffffffffffffff8a
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 00000000ffffffff
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 00000000f230c3b5
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = 00000000 a89537ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x50],%g3
	std	%f12,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f12 = 130fe697 000000d0
	bne	%xcc,p0_freg_check_fail
	mov	0xf12,%g1
	ldx	[%g4+0x58],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = ff3795a8 ff000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 27 completed


p0_label_136:
!	%l6 = ffffffff, %l7 = f230c3b5, Mem[0000000030101400] = 00000000 ff000000
	stda	%l6,[%i4+%g0]0x89	! Mem[0000000030101400] = ffffffff f230c3b5
!	Mem[00000000201c0000] = ffff9b8f, %l0 = 000000004e478378
	lduba	[%o0+0x000]%asi,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010181400] = 000000ff, %l4 = 0000000000000000
	swapa	[%i6+%g0]0x80,%l4	! %l4 = 00000000000000ff
!	%l5 = ffffffffffffff8a, Mem[0000000030001410] = ffc000ff00000000
	stxa	%l5,[%i0+%o5]0x89	! Mem[0000000030001410] = ffffffffffffff8a
!	%l4 = 00000000000000ff, Mem[0000000030101410] = 7883474e
	stwa	%l4,[%i4+%o5]0x89	! Mem[0000000030101410] = 000000ff
!	%l4 = 000000ff, %l5 = ffffff8a, Mem[0000000010001430] = b6b60000 a89537ff
	stda	%l4,[%i0+0x030]%asi	! Mem[0000000010001430] = 000000ff ffffff8a
!	Mem[00000000201c0000] = ffff9b8f, %l2 = 0000000000000082
	ldstuba	[%o0+0x000]%asi,%l2	! %l2 = 000000ff000000ff
!	%l4 = 00000000000000ff, Mem[0000000010041420] = 6870b6b6
	stw	%l4,[%i1+0x020]		! Mem[0000000010041420] = 000000ff
!	Mem[00000000201c0000] = ffff9b8f, %l1 = 0000000082559f9b
	ldstub	[%o0+%g0],%l1		! %l1 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = 00000000 000000ff, %l2 = 000000ff, %l3 = 00001197
	ldda	[%i2+%o4]0x88,%l2	! %l2 = 00000000000000ff 0000000000000000

p0_label_137:
!	Mem[00000000211c0000] = ffffb5d7, %l3 = 0000000000000000
	ldub	[%o2+0x001],%l3		! %l3 = 00000000000000ff
!	Mem[0000000010041434] = ff000000, %l3 = 00000000000000ff
	ldsb	[%i1+0x035],%l3		! %l3 = 0000000000000000
!	Mem[0000000010041400] = ff008255, %l2 = 00000000000000ff
	lduha	[%i1+%g0]0x88,%l2	! %l2 = 0000000000008255
!	Mem[0000000030101408] = ff00c0ff, %l0 = 00000000000000ff
	ldsha	[%i4+%o4]0x89,%l0	! %l0 = ffffffffffffc0ff
!	Mem[0000000030141410] = 4e478378 82559fff, %l0 = ffffc0ff, %l1 = 000000ff
	ldda	[%i5+%o5]0x89,%l0	! %l0 = 0000000082559fff 000000004e478378
!	Mem[0000000030001410] = ffffff8a, %f13 = 000000d0
	lda	[%i0+%o5]0x89,%f13	! %f13 = ffffff8a
!	Mem[0000000010141410] = 000000ff, %l3 = 0000000000000000
	ldsba	[%i5+%o5]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000030181400] = 9711000082000000, %l5 = ffffffffffffff8a
	ldxa	[%i6+%g0]0x89,%l5	! %l5 = 9711000082000000
!	Mem[0000000010001408] = 9b9f5582, %l0 = 0000000082559fff
	lduwa	[%i0+%o4]0x88,%l0	! %l0 = 000000009b9f5582
!	Starting 10 instruction Store Burst
!	Mem[0000000010081400] = 8e0705b0, %l7 = 00000000f230c3b5
	swapa	[%i2+%g0]0x80,%l7	! %l7 = 000000008e0705b0

p0_label_138:
!	%l2 = 0000000000008255, Mem[00000000218001c0] = ffba67be, %asi = 80
	stha	%l2,[%o3+0x1c0]%asi	! Mem[00000000218001c0] = 825567be
!	%l2 = 0000000000008255, Mem[0000000010141406] = d2c70061
	sth	%l2,[%i5+0x006]		! Mem[0000000010141404] = d2c78255
!	Mem[000000001004143e] = 00000000, %l3 = 0000000000000000
	ldstub	[%i1+0x03e],%l3		! %l3 = 00000000000000ff
!	Mem[0000000010001410] = 00000000, %l7 = 000000008e0705b0
	ldstuba	[%i0+%o5]0x88,%l7	! %l7 = 00000000000000ff
!	%l1 = 000000004e478378, Mem[000000001018143c] = ff646dc7, %asi = 80
	stha	%l1,[%i6+0x03c]%asi	! Mem[000000001018143c] = 83786dc7
!	%f8  = a00c1120 b5000000, Mem[00000000300c1400] = d0000000 003795a8
	stda	%f8 ,[%i3+%g0]0x89	! Mem[00000000300c1400] = a00c1120 b5000000
!	Mem[0000000010081410] = ff000000, %l6 = 00000000ffffffff
	swapa	[%i2+%o5]0x80,%l6	! %l6 = 00000000ff000000
!	Mem[0000000030001400] = ffe50000, %l1 = 000000004e478378
	swapa	[%i0+%g0]0x81,%l1	! %l1 = 00000000ffe50000
!	%l6 = 00000000ff000000, Mem[000000001014142c] = 35edcef8
	stw	%l6,[%i5+0x02c]		! Mem[000000001014142c] = ff000000
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (21)
!	Mem[0000000010101400] = 00000000 c8ff59ff ff000000 000000ff
!	Mem[0000000010101410] = 00000000 000000ff b7262298 96c4e57d
!	Mem[0000000010101420] = 00000000 0000008a 0000004c 00000000
!	Mem[0000000010101430] = 00000000 00000061 ff64bfd9 0000008a
	ldda	[%i4]ASI_BLK_P,%f16	! Block Load from 0000000010101400

p0_label_139:
!	Mem[0000000030101400] = ffffffff, %l1 = 00000000ffe50000
	ldswa	[%i4+%g0]0x89,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010001410] = ff000000, %l2 = 0000000000008255
	ldsba	[%i0+%o5]0x80,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000030101400] = f230c3b5 ffffffff, %l0 = 9b9f5582, %l1 = ffffffff
	ldda	[%i4+%g0]0x89,%l0	! %l0 = 00000000ffffffff 00000000f230c3b5
!	Mem[0000000010181408] = 06000000f8ceed35, %f12 = 130fe697 ffffff8a
	ldd	[%i6+%o4],%f12		! %f12 = 06000000 f8ceed35
!	Mem[0000000030041410] = 130fe697, %l1 = 00000000f230c3b5
	lduwa	[%i1+%o5]0x81,%l1	! %l1 = 00000000130fe697
!	Mem[0000000030181400] = 82000000, %l7 = 0000000000000000
	lduwa	[%i6+%g0]0x89,%l7	! %l7 = 0000000082000000
!	Mem[000000001018143c] = 83786dc7, %f5  = 5debeccd
	lda	[%i6+0x03c]%asi,%f5 	! %f5 = 83786dc7
!	Mem[0000000010081410] = 00000000 ffffffff, %l2 = ffffffff, %l3 = 00000000
	ldda	[%i2+%o5]0x88,%l2	! %l2 = 00000000ffffffff 0000000000000000
!	Mem[0000000030001408] = 67be2bff000000ff, %l3 = 0000000000000000
	ldxa	[%i0+%o4]0x89,%l3	! %l3 = 67be2bff000000ff
!	Starting 10 instruction Store Burst
!	%l1 = 00000000130fe697, Mem[0000000010041408] = ff000000
	stha	%l1,[%i1+%o4]0x88	! Mem[0000000010041408] = ff00e697

p0_label_140:
!	Mem[000000001018140c] = f8ceed35, %l1 = 00000000130fe697
	swap	[%i6+0x00c],%l1		! %l1 = 00000000f8ceed35
!	%l3 = 67be2bff000000ff, Mem[00000000100c1408] = 9711fcff
	stha	%l3,[%i3+%o4]0x88	! Mem[00000000100c1408] = 971100ff
!	%l1 = 00000000f8ceed35, Mem[0000000030001400] = 7883474e
	stwa	%l1,[%i0+%g0]0x89	! Mem[0000000030001400] = f8ceed35
!	%f0  = 00000000 a89537ff, Mem[0000000010141410] = 000000ff 00000000
	stda	%f0 ,[%i5+%o5]0x80	! Mem[0000000010141410] = 00000000 a89537ff
!	%f0  = 00000000, Mem[0000000010141408] = ff000000
	sta	%f0 ,[%i5+%o4]0x80	! Mem[0000000010141408] = 00000000
!	Mem[0000000010041408] = ff00e697, %l7 = 0000000082000000
	swapa	[%i1+%o4]0x88,%l7	! %l7 = 00000000ff00e697
!	%f0  = 00000000 a89537ff, Mem[0000000010141408] = 00000000 9711fcff
	stda	%f0 ,[%i5+%o4]0x88	! Mem[0000000010141408] = 00000000 a89537ff
!	%f16 = 00000000 c8ff59ff ff000000 000000ff
!	%f20 = 00000000 000000ff b7262298 96c4e57d
!	%f24 = 00000000 0000008a 0000004c 00000000
!	%f28 = 00000000 00000061 ff64bfd9 0000008a
	stda	%f16,[%i0]ASI_BLK_AIUPL	! Block Store to 0000000010001400
!	%l3 = 67be2bff000000ff, Mem[0000000010181410] = ffffffff
	stba	%l3,[%i6+%o5]0x88	! Mem[0000000010181410] = ffffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = 82000000, %f1  = a89537ff
	lda	[%i6+%g0]0x89,%f1 	! %f1 = 82000000

!	Check Point 28 for processor 0

	set	p0_check_pt_data_28,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 00000000ffffffff
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 00000000f8ceed35
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 00000000ffffffff
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 67be2bff000000ff
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l5,%g2			! %l5 = 9711000082000000
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l7,%g2			! %l7 = 00000000ff00e697
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x38],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = 00000000 82000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x40],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = 00000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x48],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = ffffffff 83786dc7
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x50],%g3
	std	%f12,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f12 = 06000000 f8ceed35
	bne	%xcc,p0_freg_check_fail
	mov	0xf12,%g1
	ldx	[%g4+0x58],%g3
	std	%f16,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f16 = 00000000 c8ff59ff
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
	cmp	%g3,%g2			! %f20 = 00000000 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1
	ldx	[%g4+0x70],%g3
	std	%f22,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f22 = b7262298 96c4e57d
	bne	%xcc,p0_freg_check_fail
	mov	0xf22,%g1
	ldx	[%g4+0x78],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = 00000000 0000008a
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1
	ldx	[%g4+0x80],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = 0000004c 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1
	ldx	[%g4+0x88],%g3
	std	%f28,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f28 = 00000000 00000061
	bne	%xcc,p0_freg_check_fail
	mov	0xf28,%g1
	ldx	[%g4+0x90],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = ff64bfd9 0000008a
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 28 completed


p0_label_141:
!	Mem[0000000010101410] = 00000000, %l1 = 00000000f8ceed35
	ldswa	[%i4+%o5]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010181424] = a97dff77, %l2 = 00000000ffffffff
	ldsba	[%i6+0x024]%asi,%l2	! %l2 = ffffffffffffffa9
!	Mem[0000000010041414] = 00000000, %l3 = 67be2bff000000ff
	ldub	[%i1+0x015],%l3		! %l3 = 0000000000000000
!	Mem[0000000010101430] = 00000000, %l3 = 0000000000000000
	ldsw	[%i4+0x030],%l3		! %l3 = 0000000000000000
!	Mem[0000000030101408] = ff00c0ff, %l7 = 00000000ff00e697
	ldsha	[%i4+%o4]0x89,%l7	! %l7 = ffffffffffffc0ff
!	Mem[00000000201c0000] = ffff9b8f, %l0 = 00000000ffffffff
	lduba	[%o0+0x000]%asi,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030181400] = 0000008200001197, %f22 = b7262298 96c4e57d
	ldda	[%i6+%g0]0x81,%f22	! %f22 = 00000082 00001197
!	Mem[0000000010141410] = ff3795a800000000, %l2 = ffffffffffffffa9
	ldxa	[%i5+%o5]0x88,%l2	! %l2 = ff3795a800000000
!	Mem[0000000010141400] = ff536bff, %l4 = 00000000000000ff
	lduba	[%i5+%g0]0x80,%l4	! %l4 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	%l6 = ff000000, %l7 = ffffc0ff, Mem[0000000010141410] = 00000000 a89537ff
	stda	%l6,[%i5+%o5]0x80	! Mem[0000000010141410] = ff000000 ffffc0ff

p0_label_142:
!	%l6 = 00000000ff000000, Mem[0000000030101408] = ffc000ff67be2b5a
	stxa	%l6,[%i4+%o4]0x81	! Mem[0000000030101408] = 00000000ff000000
!	Mem[0000000010081420] = 00006bff000000ff, %l0 = 00000000000000ff, %l1 = 0000000000000000
	add	%i2,0x20,%g1
	casxa	[%g1]0x80,%l0,%l1	! %l1 = 00006bff000000ff
!	%l3 = 0000000000000000, Mem[0000000010081408] = ff000000
	stha	%l3,[%i2+%o4]0x80	! Mem[0000000010081408] = 00000000
!	%l1 = 00006bff000000ff, Mem[0000000030001408] = ff000000
	stwa	%l1,[%i0+%o4]0x81	! Mem[0000000030001408] = 000000ff
!	%l0 = 00000000000000ff, Mem[0000000030141408] = 0000000000000000
	stxa	%l0,[%i5+%o4]0x81	! Mem[0000000030141408] = 00000000000000ff
!	%l0 = 000000ff, %l1 = 000000ff, Mem[0000000010041428] = ba536bff 5fcbdd86
	stda	%l0,[%i1+0x028]%asi	! Mem[0000000010041428] = 000000ff 000000ff
!	Mem[0000000030081400] = ffc000ff, %l1 = 00006bff000000ff
	ldstuba	[%i2+%g0]0x81,%l1	! %l1 = 000000ff000000ff
!	%l6 = ff000000, %l7 = ffffc0ff, Mem[0000000010041410] = ff00ff00 00000000
	stda	%l6,[%i1+%o5]0x88	! Mem[0000000010041410] = ff000000 ffffc0ff
	membar	#Sync			! Added by membar checker (22)
!	Mem[000000001000141e] = 982226b7, %l1 = 00000000000000ff
	ldstuba	[%i0+0x01e]%asi,%l1	! %l1 = 00000026000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = ff000000, %l5 = 9711000082000000
	lduwa	[%i0+0x008]%asi,%l5	! %l5 = 00000000ff000000

p0_label_143:
!	Mem[0000000010001408] = 000000ff, %l5 = 00000000ff000000
	ldswa	[%i0+%o4]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[00000000211c0000] = ffffb5d7, %l0 = 00000000000000ff
	lduh	[%o2+%g0],%l0		! %l0 = 000000000000ffff
!	Mem[0000000010081408] = 0000000000000000, %f18 = ff000000 000000ff
	ldda	[%i2+%o4]0x80,%f18	! %f18 = 00000000 00000000
!	Mem[0000000030141410] = ff9f5582, %f27 = 00000000
	lda	[%i5+%o5]0x81,%f27	! %f27 = ff9f5582
!	Mem[00000000100c1430] = 130fe697000000d0, %f22 = 00000082 00001197
	ldda	[%i3+0x030]%asi,%f22	! %f22 = 130fe697 000000d0
!	Mem[00000000100c1410] = 000000ff, %f7  = ff000000
	lda	[%i3+%o5]0x88,%f7 	! %f7 = 000000ff
!	Mem[0000000030101400] = f230c3b5ffffffff, %f28 = 00000000 00000061
	ldda	[%i4+%g0]0x89,%f28	! %f28 = f230c3b5 ffffffff
!	Mem[0000000030041410] = 130fe697, %l5 = 00000000000000ff
	lduwa	[%i1+%o5]0x81,%l5	! %l5 = 00000000130fe697
!	Mem[000000001008140c] = 00000000, %l0 = 000000000000ffff
	lduwa	[%i2+0x00c]%asi,%l0	! %l0 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1400] = ff000000, %l5 = 00000000130fe697
	ldstuba	[%i3+%g0]0x88,%l5	! %l5 = 00000000000000ff

p0_label_144:
!	%f0  = 00000000, Mem[00000000100c1410] = ff000000
	sta	%f0 ,[%i3+%o5]0x80	! Mem[00000000100c1410] = 00000000
!	Mem[0000000010081408] = 0000000000000000, %l6 = 00000000ff000000, %l2 = ff3795a800000000
	add	%i2,0x08,%g1
	casxa	[%g1]0x80,%l6,%l2	! %l2 = 0000000000000000
!	%f15 = 00000000, Mem[0000000010001434] = 00000000
	sta	%f15,[%i0+0x034]%asi	! Mem[0000000010001434] = 00000000
!	Mem[000000001014140c] = 00000000, %l0 = 0000000000000000
	swap	[%i5+0x00c],%l0		! %l0 = 0000000000000000
!	Mem[0000000010141434] = 000000ff, %l7 = ffffc0ff, %l3 = 00000000
	add	%i5,0x34,%g1
	casa	[%g1]0x80,%l7,%l3	! %l3 = 00000000000000ff
!	%l4 = 00000000000000ff, Mem[0000000030141408] = 00000000
	stha	%l4,[%i5+%o4]0x81	! Mem[0000000030141408] = 00ff0000
!	Mem[000000001004143c] = 0000ff00, %l7 = ffffffffffffc0ff, %asi = 80
	swapa	[%i1+0x03c]%asi,%l7	! %l7 = 000000000000ff00
!	Mem[0000000030001400] = 35edcef8, %l7 = 000000000000ff00
	swapa	[%i0+%g0]0x81,%l7	! %l7 = 0000000035edcef8
!	%l1 = 0000000000000026, Mem[0000000010141410] = ff000000ffffc0ff
	stxa	%l1,[%i5+%o5]0x80	! Mem[0000000010141410] = 0000000000000026
!	Starting 10 instruction Load Burst
!	Mem[0000000030001400] = 00ff0000, %l6 = 00000000ff000000
	ldsha	[%i0+%g0]0x89,%l6	! %l6 = 0000000000000000

p0_label_145:
!	Mem[0000000010101400] = 00000000, %l6 = 0000000000000000
	ldsha	[%i4+%g0]0x88,%l6	! %l6 = 0000000000000000
!	Mem[00000000201c0000] = ffff9b8f, %l0 = 0000000000000000
	ldsba	[%o0+0x001]%asi,%l0	! %l0 = ffffffffffffffff
!	Mem[00000000201c0000] = ffff9b8f, %l5 = 0000000000000000
	ldsba	[%o0+0x000]%asi,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000010141410] = 00000000, %l1 = 0000000000000026
	ldswa	[%i5+%o5]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000030081400] = ffc000ff, %l1 = 0000000000000000
	ldsba	[%i2+%g0]0x81,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000030081408] = 000000ffc8ff59ff, %l1 = ffffffffffffffff
	ldxa	[%i2+%o4]0x89,%l1	! %l1 = 000000ffc8ff59ff
!	Mem[0000000010141400] = ff536bff d2c78255, %l6 = 00000000, %l7 = 35edcef8
	ldda	[%i5+%g0]0x80,%l6	! %l6 = 00000000ff536bff 00000000d2c78255
!	Mem[0000000010041410] = ff000000, %l0 = ffffffffffffffff
	ldsba	[%i1+%o5]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000030101400] = ffffffff, %l4 = 00000000000000ff
	ldsba	[%i4+%g0]0x81,%l4	! %l4 = ffffffffffffffff
!	Starting 10 instruction Store Burst
!	%l0 = 00000000, %l1 = c8ff59ff, Mem[0000000010001438] = 8a000000 d9bf64ff
	std	%l0,[%i0+0x038]		! Mem[0000000010001438] = 00000000 c8ff59ff

!	Check Point 29 for processor 0

	set	p0_check_pt_data_29,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 0000000000000000
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 000000ffc8ff59ff
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
	cmp	%l4,%g2			! %l4 = ffffffffffffffff
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = ffffffffffffffff
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = 00000000ff536bff
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 00000000d2c78255
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = ff3795a8 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x50],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = 00000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1
	ldx	[%g4+0x58],%g3
	std	%f22,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f22 = 130fe697 000000d0
	bne	%xcc,p0_freg_check_fail
	mov	0xf22,%g1
	ldx	[%g4+0x60],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = 0000004c ff9f5582
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1
	ldx	[%g4+0x68],%g3
	std	%f28,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f28 = f230c3b5 ffffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf28,%g1

!	Check Point 29 completed


p0_label_146:
!	Mem[0000000010141418] = ff790600, %l3 = 000000ff, %l6 = ff536bff
	add	%i5,0x18,%g1
	casa	[%g1]0x80,%l3,%l6	! %l6 = 00000000ff790600
!	Mem[0000000030181400] = 82000000, %l1 = 000000ffc8ff59ff
	ldstuba	[%i6+%g0]0x89,%l1	! %l1 = 00000000000000ff
!	%l4 = ffffffffffffffff, Mem[0000000010081428] = 00ff00ff
	stw	%l4,[%i2+0x028]		! Mem[0000000010081428] = ffffffff
!	%f6  = ff3795a8, Mem[00000000100c1400] = ff0000ff
	sta	%f6 ,[%i3+%g0]0x80	! Mem[00000000100c1400] = ff3795a8
!	Mem[0000000030001400] = 0000ff00, %l4 = ffffffffffffffff
	ldstuba	[%i0+%g0]0x81,%l4	! %l4 = 00000000000000ff
!	%l4 = 0000000000000000, Mem[0000000010181400] = 00000000
	stba	%l4,[%i6+%g0]0x80	! Mem[0000000010181400] = 00000000
!	Mem[0000000030141408] = 00ff0000, %l3 = 00000000000000ff
	ldstuba	[%i5+%o4]0x81,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030081410] = ff536bff, %l3 = 0000000000000000
	swapa	[%i2+%o5]0x89,%l3	! %l3 = 00000000ff536bff
!	%f4  = ffffffff 83786dc7, %l7 = 00000000d2c78255
!	Mem[0000000030181420] = 5b7093451f091f08
	add	%i6,0x020,%g1
	stda	%f4,[%g1+%l7]ASI_PST32_S ! Mem[0000000030181420] = 5b70934583786dc7
!	Starting 10 instruction Load Burst
!	Mem[0000000010041438] = e5022705 ffffc0ff, %l0 = 00000000, %l1 = 00000000
	ldd	[%i1+0x038],%l0		! %l0 = 00000000e5022705 00000000ffffc0ff

p0_label_147:
!	Mem[0000000010081410] = ffffffff, %l1 = 00000000ffffc0ff
	ldsha	[%i2+%o5]0x80,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000021800000] = 0000c8c8, %l3 = 00000000ff536bff
	ldsb	[%o3+0x001],%l3		! %l3 = 0000000000000000
!	%l6 = 00000000ff790600, Mem[0000000030041410] = 130fe697
	stba	%l6,[%i1+%o5]0x81	! Mem[0000000030041410] = 000fe697
!	Mem[0000000010141408] = ff3795a8, %f30 = ff64bfd9
	ld	[%i5+%o4],%f30	! %f30 = ff3795a8
!	Mem[00000000211c0000] = ffffb5d7, %l4 = 0000000000000000
	ldsba	[%o2+0x001]%asi,%l4	! %l4 = ffffffffffffffff
!	Mem[00000000211c0000] = ffffb5d7, %l5 = ffffffffffffffff
	ldub	[%o2+0x001],%l5		! %l5 = 00000000000000ff
!	Mem[00000000211c0000] = ffffb5d7, %l3 = 0000000000000000
	lduha	[%o2+0x000]%asi,%l3	! %l3 = 000000000000ffff
!	Mem[00000000300c1400] = 000000b5 20110ca0, %l4 = ffffffff, %l5 = 000000ff
	ldda	[%i3+%g0]0x81,%l4	! %l4 = 00000000000000b5 0000000020110ca0
!	Mem[0000000030041408] = 0000000000000000, %f12 = 06000000 f8ceed35
	ldda	[%i1+%o4]0x89,%f12	! %f12 = 00000000 00000000
!	Starting 10 instruction Store Burst
!	%l7 = 00000000d2c78255, Mem[0000000030181400] = ff00008200001197
	stxa	%l7,[%i6+%g0]0x81	! Mem[0000000030181400] = 00000000d2c78255

p0_label_148:
!	%l7 = 00000000d2c78255, Mem[0000000010041434] = ff000000, %asi = 80
	stwa	%l7,[%i1+0x034]%asi	! Mem[0000000010041434] = d2c78255
!	Mem[0000000010181418] = d2c70061, %l3 = 000000000000ffff
	ldstub	[%i6+0x018],%l3		! %l3 = 000000d2000000ff
!	%f7  = 000000ff, Mem[0000000010101424] = 0000008a
	st	%f7 ,[%i4+0x024]	! Mem[0000000010101424] = 000000ff
!	Mem[0000000030101410] = ff000000, %l7 = 00000000d2c78255
	swapa	[%i4+%o5]0x81,%l7	! %l7 = 00000000ff000000
!	%f16 = 00000000, Mem[0000000010181408] = 00000006
	sta	%f16,[%i6+%o4]0x88	! Mem[0000000010181408] = 00000000
!	Mem[000000001014141c] = f47cffff, %l4 = 000000b5, %l7 = ff000000
	add	%i5,0x1c,%g1
	casa	[%g1]0x80,%l4,%l7	! %l7 = 00000000f47cffff
!	%l1 = ffffffffffffffff, Mem[0000000010101400] = 00000000c8ff59ff
	stxa	%l1,[%i4+%g0]0x80	! Mem[0000000010101400] = ffffffffffffffff
!	%l5 = 0000000020110ca0, Mem[0000000030001400] = ff00ff00
	stha	%l5,[%i0+%g0]0x81	! Mem[0000000030001400] = 0ca0ff00
!	Mem[0000000010081410] = ffffffff, %l7 = 00000000f47cffff
	swapa	[%i2+%o5]0x80,%l7	! %l7 = 00000000ffffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = c8ff59ff, %l2 = 0000000000000000
	lduwa	[%i2+%o4]0x89,%l2	! %l2 = 00000000c8ff59ff

p0_label_149:
!	Mem[00000000100c1408] = ff001197, %l2 = 00000000c8ff59ff
	ldsba	[%i3+%o4]0x80,%l2	! %l2 = ffffffffffffffff
!	Mem[00000000100c1400] = a89537ff, %f19 = 00000000
	lda	[%i3+%g0]0x88,%f19	! %f19 = a89537ff
!	Mem[0000000010181408] = 00000000, %l2 = ffffffffffffffff
	lduwa	[%i6+%o4]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000030081408] = c8ff59ff, %f3  = 00000000
	lda	[%i2+%o4]0x89,%f3 	! %f3 = c8ff59ff
!	Mem[00000000300c1408] = 00000006, %l2 = 0000000000000000
	lduwa	[%i3+%o4]0x81,%l2	! %l2 = 0000000000000006
!	Mem[0000000010181400] = 00000000000000ff, %l4 = 00000000000000b5
	ldxa	[%i6+%g0]0x80,%l4	! %l4 = 00000000000000ff
!	Mem[00000000218000c0] = afffcbcc, %l7 = 00000000ffffffff
	ldsha	[%o3+0x0c0]%asi,%l7	! %l7 = ffffffffffffafff
!	Mem[0000000010141410] = 00000000 00000026, %l6 = ff790600, %l7 = ffffafff
	ldda	[%i5+%o5]0x80,%l6	! %l6 = 0000000000000000 0000000000000026
!	Mem[0000000010041420] = 000000ff 00000000, %l6 = 00000000, %l7 = 00000026
	ldd	[%i1+0x020],%l6		! %l6 = 00000000000000ff 0000000000000000
!	Starting 10 instruction Store Burst
!	%f10 = a00c0000 8e0705b0, Mem[0000000010101400] = ffffffff ffffffff
	stda	%f10,[%i4+%g0]0x80	! Mem[0000000010101400] = a00c0000 8e0705b0

p0_label_150:
!	%l4 = 00000000000000ff, Mem[0000000030081400] = ff00c0ff
	stba	%l4,[%i2+%g0]0x89	! Mem[0000000030081400] = ff00c0ff
!	Mem[00000000100c1400] = ff3795a8, %l3 = 00000000000000d2
	ldstuba	[%i3+%g0]0x80,%l3	! %l3 = 000000ff000000ff
!	Mem[0000000010141400] = ff6b53ff, %l5 = 0000000020110ca0
	ldstuba	[%i5+%g0]0x88,%l5	! %l5 = 000000ff000000ff
!	Mem[0000000010101408] = 000000ff, %l6 = 00000000000000ff
	ldstuba	[%i4+%o4]0x88,%l6	! %l6 = 000000ff000000ff
!	%l0 = 00000000e5022705, Mem[0000000010001410] = ff000000
	stba	%l0,[%i0+%o5]0x80	! Mem[0000000010001410] = 05000000
!	%f11 = 8e0705b0, Mem[0000000010041430] = 67be2b5a
	st	%f11,[%i1+0x030]	! Mem[0000000010041430] = 8e0705b0
!	Mem[0000000030041400] = ffffffff, %l3 = 00000000000000ff
	swapa	[%i1+%g0]0x81,%l3	! %l3 = 00000000ffffffff
!	%f26 = 0000004c, Mem[0000000030141408] = 0000ffff
	sta	%f26,[%i5+%o4]0x89	! Mem[0000000030141408] = 0000004c
!	Mem[0000000010041410] = ff000000, %l4 = 00000000000000ff
	ldstuba	[%i1+%o5]0x88,%l4	! %l4 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030041408] = 00000000, %l7 = 0000000000000000
	lduba	[%i1+%o4]0x81,%l7	! %l7 = 0000000000000000

!	Check Point 30 for processor 0

	set	p0_check_pt_data_30,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l1,%g2			! %l1 = ffffffffffffffff
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l2,%g2			! %l2 = 0000000000000006
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l3,%g2			! %l3 = 00000000ffffffff
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
	cmp	%l7,%g2			! %l7 = 0000000000000000
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x40],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = 00000000 82000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x48],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = 00000000 c8ff59ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x50],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = ffffffff 83786dc7
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x58],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = ff3795a8 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x60],%g3
	std	%f12,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f12 = 00000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf12,%g1
	ldx	[%g4+0x68],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = 00000000 a89537ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1
	ldx	[%g4+0x70],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = ff3795a8 0000008a
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 30 completed


p0_label_151:
!	Mem[0000000010181430] = 000000000000d000, %l2 = 0000000000000006
	ldxa	[%i6+0x030]%asi,%l2	! %l2 = 000000000000d000
!	Mem[0000000030041400] = 000000ffa89537ff, %f8  = a00c1120 b5000000
	ldda	[%i1+%g0]0x81,%f8 	! %f8  = 000000ff a89537ff
!	Mem[0000000030101410] = d2c78255 82559f9b, %l4 = 00000000, %l5 = 000000ff
	ldda	[%i4+%o5]0x81,%l4	! %l4 = 00000000d2c78255 0000000082559f9b
!	Mem[0000000030101408] = 000000ff00000000, %l2 = 000000000000d000
	ldxa	[%i4+%o4]0x89,%l2	! %l2 = 000000ff00000000
!	Mem[0000000010081410] = f47cffff00000000, %f22 = 130fe697 000000d0
	ldda	[%i2+%o5]0x80,%f22	! %f22 = f47cffff 00000000
!	Mem[0000000010141408] = a89537ff, %l5 = 0000000082559f9b
	lduwa	[%i5+%o4]0x88,%l5	! %l5 = 00000000a89537ff
!	Mem[0000000010141400] = 5582c7d2 ff6b53ff, %l4 = d2c78255, %l5 = a89537ff
	ldda	[%i5+%g0]0x88,%l4	! %l4 = 00000000ff6b53ff 000000005582c7d2
!	Mem[0000000010041408] = 86813ec182000000, %l0 = 00000000e5022705
	ldxa	[%i1+%o4]0x88,%l0	! %l0 = 86813ec182000000
!	Mem[0000000010141410] = 00000000, %l5 = 000000005582c7d2
	ldswa	[%i5+%o5]0x88,%l5	! %l5 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l0 = 86813ec182000000, Mem[000000001004140e] = c13e8186
	sth	%l0,[%i1+0x00e]		! Mem[000000001004140c] = c13e0000

p0_label_152:
!	%l1 = ffffffffffffffff, Mem[0000000030041408] = 00000000
	stba	%l1,[%i1+%o4]0x81	! Mem[0000000030041408] = ff000000
!	Mem[0000000010181431] = 00000000, %l7 = 0000000000000000
	ldstuba	[%i6+0x031]%asi,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030081400] = ff00c0ff, %l0 = 86813ec182000000
	swapa	[%i2+%g0]0x89,%l0	! %l0 = 00000000ff00c0ff
!	Mem[0000000021800181] = a1ff2710, %l5 = 0000000000000000
	ldstub	[%o3+0x181],%l5		! %l5 = 000000ff000000ff
!	Mem[00000000211c0001] = ffffb5d7, %l4 = 00000000ff6b53ff
	ldstub	[%o2+0x001],%l4		! %l4 = 000000ff000000ff
!	%l5 = 00000000000000ff, Mem[00000000300c1408] = 00000006
	stha	%l5,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00ff0006
!	Mem[0000000030181410] = b5000000, %l0 = 00000000ff00c0ff
	ldstuba	[%i6+%o5]0x81,%l0	! %l0 = 000000b5000000ff
!	%f13 = 00000000, Mem[00000000300c1408] = 0600ff00
	sta	%f13,[%i3+%o4]0x89	! Mem[00000000300c1408] = 00000000
!	%f20 = 00000000, Mem[0000000010041410] = ff0000ff
	sta	%f20,[%i1+%o5]0x88	! Mem[0000000010041410] = 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = ff000000000000ff, %l4 = 00000000000000ff
	ldxa	[%i4+%o4]0x88,%l4	! %l4 = ff000000000000ff

p0_label_153:
!	Mem[0000000010041400] = 558200ff 000000ff, %l4 = 000000ff, %l5 = 000000ff
	ldda	[%i1+%g0]0x80,%l4	! %l4 = 00000000558200ff 00000000000000ff
!	Mem[0000000010101410] = 00000000000000ff, %f8  = 000000ff a89537ff
	ldda	[%i4+%o5]0x80,%f8 	! %f8  = 00000000 000000ff
!	Mem[00000000300c1410] = ff536bff, %l4 = 00000000558200ff
	ldswa	[%i3+%o5]0x81,%l4	! %l4 = ffffffffff536bff
!	Mem[0000000010001408] = 000000ff, %l2 = 000000ff00000000
	ldswa	[%i0+%o4]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[00000000100c1408] = ff001197 f596f078, %l2 = 000000ff, %l3 = ffffffff
	ldd	[%i3+%o4],%l2		! %l2 = 00000000ff001197 00000000f596f078
!	Mem[0000000010081408] = 00000000, %l6 = 00000000000000ff
	lduba	[%i2+%o4]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000030181410] = ff000000, %l3 = 00000000f596f078
	ldsha	[%i6+%o5]0x81,%l3	! %l3 = ffffffffffffff00
!	Mem[0000000010101418] = b7262298, %f13 = 00000000
	ld	[%i4+0x018],%f13	! %f13 = b7262298
!	Mem[00000000100c1410] = 00000000 00000000, %l2 = ff001197, %l3 = ffffff00
	ldda	[%i3+%o5]0x88,%l2	! %l2 = 0000000000000000 0000000000000000
!	Starting 10 instruction Store Burst
!	%f0  = 00000000 82000000, Mem[0000000010041410] = 00000000 ffffc0ff
	stda	%f0 ,[%i1+%o5]0x88	! Mem[0000000010041410] = 00000000 82000000

p0_label_154:
!	%l6 = 0000000000000000, Mem[0000000010181400] = 00000000
	stwa	%l6,[%i6+%g0]0x88	! Mem[0000000010181400] = 00000000
!	%l1 = ffffffffffffffff, Mem[00000000201c0000] = ffff9b8f, %asi = 80
	stha	%l1,[%o0+0x000]%asi	! Mem[00000000201c0000] = ffff9b8f
!	%f31 = 0000008a, Mem[0000000010081410] = ffff7cf4
	sta	%f31,[%i2+%o5]0x88	! Mem[0000000010081410] = 0000008a
!	%f24 = 00000000 0000008a, %l4 = ffffffffff536bff
!	Mem[0000000030041420] = a00c112067be2bff
	add	%i1,0x020,%g1
	stda	%f24,[%g1+%l4]ASI_PST16_S ! Mem[0000000030041420] = 000000000000008a
!	Mem[00000000100c1427] = 03eb0061, %l7 = 0000000000000000
	ldstub	[%i3+0x027],%l7		! %l7 = 00000061000000ff
!	%f28 = f230c3b5 ffffffff, Mem[0000000010181420] = 13d90025 a97dff77
	std	%f28,[%i6+0x020]	! Mem[0000000010181420] = f230c3b5 ffffffff
!	Mem[0000000010081408] = 00000000, %l3 = 0000000000000000
	ldstuba	[%i2+%o4]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[00000000100c1410] = 00000000, %l6 = 0000000000000000
	ldstuba	[%i3+%o5]0x88,%l6	! %l6 = 00000000000000ff
!	%f28 = f230c3b5 ffffffff, Mem[0000000010141400] = ff6b53ff 5582c7d2
	stda	%f28,[%i5+%g0]0x88	! Mem[0000000010141400] = f230c3b5 ffffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000010101424] = 000000ff, %l0 = 00000000000000b5
	lduh	[%i4+0x026],%l0		! %l0 = 00000000000000ff

p0_label_155:
!	Mem[00000000201c0000] = ffff9b8f, %l2 = 0000000000000000
	lduba	[%o0+0x000]%asi,%l2	! %l2 = 00000000000000ff
!	Mem[0000000020800000] = ffff7fc1, %l5 = 00000000000000ff
	lduh	[%o1+%g0],%l5		! %l5 = 000000000000ffff
!	Mem[00000000100c1410] = 000000ff, %f6  = ff3795a8
	lda	[%i3+%o5]0x88,%f6 	! %f6 = 000000ff
!	Mem[0000000030181408] = ff000000d00000ff, %f6  = 000000ff 000000ff
	ldda	[%i6+%o4]0x89,%f6 	! %f6  = ff000000 d00000ff
!	Mem[0000000010141400] = ffffffff, %l7 = 0000000000000061
	lduba	[%i5+%g0]0x80,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010141400] = f230c3b5ffffffff, %l1 = ffffffffffffffff
	ldxa	[%i5+%g0]0x88,%l1	! %l1 = f230c3b5ffffffff
!	Mem[00000000100c1410] = 00000000000000ff, %l4 = ffffffffff536bff
	ldxa	[%i3+%o5]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010001408] = ff000000000000ff, %f18 = 00000000 a89537ff
	ldda	[%i0+%o4]0x88,%f18	! %f18 = ff000000 000000ff
!	Mem[0000000010141410] = 00000000, %l6 = 0000000000000000
	ldsha	[%i5+%o5]0x88,%l6	! %l6 = 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010001424] = 00000000, %l2 = 000000ff, %l5 = 0000ffff
	add	%i0,0x24,%g1
	casa	[%g1]0x80,%l2,%l5	! %l5 = 0000000000000000

!	Check Point 31 for processor 0

	set	p0_check_pt_data_31,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = f230c3b5ffffffff
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
	cmp	%l4,%g2			! %l4 = 00000000000000ff
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
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = 00000000 c8ff59ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x50],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = ffffffff 83786dc7
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x58],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = ff000000 d00000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x60],%g3
	std	%f8,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f8 = 00000000 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf08,%g1
	ldx	[%g4+0x68],%g3
	std	%f12,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f12 = 00000000 b7262298
	bne	%xcc,p0_freg_check_fail
	mov	0xf12,%g1
	ldx	[%g4+0x70],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = ff000000 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1
	ldx	[%g4+0x78],%g3
	std	%f22,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f22 = f47cffff 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf22,%g1

!	Check Point 31 completed


p0_label_156:
!	%l6 = 0000000000000000, Mem[00000000201c0000] = ffff9b8f
	stb	%l6,[%o0+%g0]		! Mem[00000000201c0000] = 00ff9b8f
!	Mem[0000000010181400] = 00000000000000ff, %l7 = 00000000000000ff, %l7 = 00000000000000ff
	casxa	[%i6]0x80,%l7,%l7	! %l7 = 00000000000000ff
!	%f22 = f47cffff 00000000, Mem[0000000010041408] = 00000082 c13e0000
	stda	%f22,[%i1+%o4]0x80	! Mem[0000000010041408] = f47cffff 00000000
!	%l5 = 0000000000000000, Mem[0000000030141410] = ff9f5582
	stba	%l5,[%i5+%o5]0x81	! Mem[0000000030141410] = 009f5582
!	%l4 = 00000000000000ff, Mem[0000000010081410] = 8a000000
	stba	%l4,[%i2+%o5]0x80	! Mem[0000000010081410] = ff000000
!	Mem[0000000010041400] = 558200ff, %l5 = 0000000000000000
	swapa	[%i1+%g0]0x80,%l5	! %l5 = 00000000558200ff
!	%f16 = 00000000 c8ff59ff, Mem[0000000010181408] = 00000000 130fe697
	stda	%f16,[%i6+%o4]0x80	! Mem[0000000010181408] = 00000000 c8ff59ff
!	%l5 = 00000000558200ff, Mem[0000000020800041] = ffffe25a
	stb	%l5,[%o1+0x041]		! Mem[0000000020800040] = ffffe25a
!	Mem[0000000010141401] = ffffffff, %l7 = 00000000000000ff
	ldstuba	[%i5+0x001]%asi,%l7	! %l7 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000021800140] = 3e4cef3d, %l2 = 00000000000000ff
	lduba	[%o3+0x141]%asi,%l2	! %l2 = 000000000000004c

p0_label_157:
!	Mem[0000000010001408] = ff000000, %l1 = f230c3b5ffffffff
	ldswa	[%i0+%o4]0x80,%l1	! %l1 = ffffffffff000000
!	Mem[0000000010181408] = 00000000, %l7 = 00000000000000ff
	lduwa	[%i6+%o4]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000010101400] = a00c0000, %l5 = 00000000558200ff
	ldswa	[%i4+%g0]0x80,%l5	! %l5 = ffffffffa00c0000
!	Mem[0000000030081410] = 00000000, %l0 = 00000000000000ff
	lduwa	[%i2+%o5]0x89,%l0	! %l0 = 0000000000000000
	membar	#Sync			! Added by membar checker (23)
!	Mem[0000000010141400] = ffffffff b5c330f2 ff3795a8 00000000
!	Mem[0000000010141410] = 00000000 00000026 ff790600 f47cffff
!	Mem[0000000010141420] = 031a783d b6b67068 00000000 ff000000
!	Mem[0000000010141430] = ff591ac8 000000ff 00000000 ff0000d0
	ldda	[%i5]ASI_BLK_P,%f0	! Block Load from 0000000010141400
!	Mem[0000000030041410] = 000fe697, %l6 = 0000000000000000
	ldsha	[%i1+%o5]0x81,%l6	! %l6 = 000000000000000f
!	Mem[0000000030181408] = ff0000d0, %l2 = 000000000000004c
	ldsba	[%i6+%o4]0x81,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000010001400] = ff59ffc8, %f18 = ff000000
	lda	[%i0+%g0]0x80,%f18	! %f18 = ff59ffc8
!	Mem[0000000030141400] = 00000000f230c3b5, %f20 = 00000000 000000ff
	ldda	[%i5+%g0]0x81,%f20	! %f20 = 00000000 f230c3b5
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (24)
!	%l6 = 000000000000000f, Mem[0000000010141400] = ffffffff
	stba	%l6,[%i5+%g0]0x80	! Mem[0000000010141400] = 0fffffff

p0_label_158:
!	%f3  = 00000000, Mem[0000000010141410] = 00000000
	sta	%f3 ,[%i5+%o5]0x88	! Mem[0000000010141410] = 00000000
!	Mem[0000000010081410] = 000000ff, %l0 = 0000000000000000
	ldstuba	[%i2+%o5]0x88,%l0	! %l0 = 000000ff000000ff
!	%l5 = ffffffffa00c0000, Mem[00000000100c1422] = 00ec8566, %asi = 80
	stba	%l5,[%i3+0x022]%asi	! Mem[00000000100c1420] = 00ec0066
!	%f18 = ff59ffc8 000000ff, %l7 = 0000000000000000
!	Mem[0000000030081408] = ff59ffc8ff000000
	add	%i2,0x008,%g1
	stda	%f18,[%g1+%l7]ASI_PST8_S ! Mem[0000000030081408] = ff59ffc8ff000000
!	%f6  = ff790600, Mem[00000000100c1410] = ff000000
	sta	%f6 ,[%i3+%o5]0x80	! Mem[00000000100c1410] = ff790600
!	%f24 = 00000000, Mem[0000000030181410] = 000000ff
	sta	%f24,[%i6+%o5]0x89	! Mem[0000000030181410] = 00000000
!	%f21 = f230c3b5, Mem[0000000030001400] = 0ca0ff00
	sta	%f21,[%i0+%g0]0x81	! Mem[0000000030001400] = f230c3b5
!	%l0 = 00000000000000ff, Mem[0000000010181420] = f230c3b5ffffffff
	stx	%l0,[%i6+0x020]		! Mem[0000000010181420] = 00000000000000ff
!	Mem[0000000010101408] = 000000ff, %l4 = 00000000000000ff
	swapa	[%i4+%o4]0x88,%l4	! %l4 = 00000000000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = c8ff59ff, %l2 = ffffffffffffffff
	lduwa	[%i0+%g0]0x88,%l2	! %l2 = 00000000c8ff59ff

p0_label_159:
!	Mem[00000000100c1408] = ff001197, %l1 = ffffffffff000000
	lduh	[%i3+%o4],%l1		! %l1 = 000000000000ff00
!	Mem[0000000030041410] = 97e60f00, %l6 = 000000000000000f
	lduha	[%i1+%o5]0x89,%l6	! %l6 = 0000000000000f00
!	Mem[0000000030141408] = 0000004c, %f19 = 000000ff
	lda	[%i5+%o4]0x89,%f19	! %f19 = 0000004c
!	Mem[0000000010101400] = b005078e00000ca0, %l3 = 0000000000000000
	ldxa	[%i4+%g0]0x88,%l3	! %l3 = b005078e00000ca0
!	Mem[0000000030041408] = ff000000, %l7 = 0000000000000000
	lduha	[%i1+%o4]0x81,%l7	! %l7 = 000000000000ff00
!	Mem[0000000030181400] = 00000000, %l0 = 00000000000000ff
	lduwa	[%i6+%g0]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000030181400] = 00000000d2c78255, %f0  = ffffffff b5c330f2
	ldda	[%i6+%g0]0x81,%f0 	! %f0  = 00000000 d2c78255
!	Mem[0000000010001410] = 05000000, %l5 = ffffffffa00c0000
	ldsha	[%i0+%o5]0x80,%l5	! %l5 = 0000000000000500
!	Mem[0000000010101400] = 00000ca0, %l0 = 0000000000000000
	lduwa	[%i4+%g0]0x88,%l0	! %l0 = 0000000000000ca0
!	Starting 10 instruction Store Burst
!	Mem[0000000010101428] = 0000004c, %l1 = 000000000000ff00
	swap	[%i4+0x028],%l1		! %l1 = 000000000000004c

p0_label_160:
!	%l3 = b005078e00000ca0, Mem[0000000030001408] = ff000000
	stba	%l3,[%i0+%o4]0x89	! Mem[0000000030001408] = ff0000a0
!	%l3 = b005078e00000ca0, Mem[0000000010141410] = 00000000
	stw	%l3,[%i5+%o5]		! Mem[0000000010141410] = 00000ca0
!	Mem[0000000010041408] = f47cffff, %l0 = 0000000000000ca0
	ldstuba	[%i1+%o4]0x80,%l0	! %l0 = 000000f4000000ff
!	%l4 = 000000ff, %l5 = 00000500, Mem[0000000010041410] = 82000000 00000000
	stda	%l4,[%i1+%o5]0x88	! Mem[0000000010041410] = 000000ff 00000500
!	%f16 = 00000000, Mem[0000000030181400] = 00000000
	sta	%f16,[%i6+%g0]0x81	! Mem[0000000030181400] = 00000000
!	Mem[0000000010001408] = 000000ff, %l3 = b005078e00000ca0
	ldstuba	[%i0+%o4]0x88,%l3	! %l3 = 000000ff000000ff
!	Mem[0000000010041412] = ff000000, %l6 = 0000000000000f00
	ldstub	[%i1+0x012],%l6		! %l6 = 00000000000000ff
!	Mem[0000000010001410] = 00000005, %l2 = 00000000c8ff59ff
	swapa	[%i0+%o5]0x88,%l2	! %l2 = 0000000000000005
!	Mem[0000000010141408] = ff3795a8, %l7 = 000000000000ff00
	ldstuba	[%i5+%o4]0x80,%l7	! %l7 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030081410] = 00000000, %l6 = 0000000000000000
	ldsba	[%i2+%o5]0x81,%l6	! %l6 = 0000000000000000

!	Check Point 32 for processor 0

	set	p0_check_pt_data_32,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 00000000000000f4
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 000000000000004c
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 0000000000000005
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l5,%g2			! %l5 = 0000000000000500
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
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = 00000000 d2c78255
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x48],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = ff3795a8 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x50],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 00000000 00000026
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x58],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = ff790600 f47cffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x60],%g3
	std	%f8,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f8 = 031a783d b6b67068
	bne	%xcc,p0_freg_check_fail
	mov	0xf08,%g1
	ldx	[%g4+0x68],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = 00000000 ff000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x70],%g3
	std	%f12,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f12 = ff591ac8 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf12,%g1
	ldx	[%g4+0x78],%g3
	std	%f14,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f14 = 00000000 ff0000d0
	bne	%xcc,p0_freg_check_fail
	mov	0xf14,%g1
	ldx	[%g4+0x80],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = ff59ffc8 0000004c
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1
	ldx	[%g4+0x88],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = 00000000 f230c3b5
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1

!	Check Point 32 completed


p0_label_161:
!	Mem[0000000010181400] = 00000000, %l7 = 00000000000000ff
	lduh	[%i6+%g0],%l7		! %l7 = 0000000000000000
!	Mem[0000000010101408] = 000000ff, %l7 = 0000000000000000
	ldswa	[%i4+%o4]0x88,%l7	! %l7 = 00000000000000ff
!	%l7 = 00000000000000ff, %l4 = 00000000000000ff, %l2 = 0000000000000005
	udivx	%l7,%l4,%l2		! %l2 = 0000000000000001
!	Mem[00000000100c1408] = 971100ff, %l1 = 000000000000004c
	ldsha	[%i3+%o4]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010041400] = 00000000, %l3 = 00000000000000ff
	ldsha	[%i1+%g0]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000010001400] = ff59ffc8, %f4  = 00000000
	lda	[%i0+%g0]0x80,%f4 	! %f4 = ff59ffc8
!	Mem[0000000030181400] = 00000000, %l4 = 00000000000000ff
	ldswa	[%i6+%g0]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000030141410] = 009f5582, %l6 = 0000000000000000
	ldsba	[%i5+%o5]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000010101408] = ff000000, %l3 = 0000000000000000
	ldswa	[%i4+%o4]0x80,%l3	! %l3 = ffffffffff000000
!	Starting 10 instruction Store Burst
!	%l7 = 00000000000000ff, Mem[0000000010181408] = 00000000
	stwa	%l7,[%i6+%o4]0x80	! Mem[0000000010181408] = 000000ff

p0_label_162:
!	Mem[0000000020800000] = ffff7fc1, %l2 = 0000000000000001
	ldstuba	[%o1+0x000]%asi,%l2	! %l2 = 000000ff000000ff
!	Mem[0000000030141410] = 009f5582, %l3 = ffffffffff000000
	ldstuba	[%i5+%o5]0x81,%l3	! %l3 = 00000000000000ff
!	%f12 = ff591ac8 000000ff, Mem[0000000010081408] = ff000000 00000000
	stda	%f12,[%i2+%o4]0x80	! Mem[0000000010081408] = ff591ac8 000000ff
!	Mem[00000000100c1430] = 130fe697000000d0, %l0 = 00000000000000f4, %l1 = 00000000000000ff
	add	%i3,0x30,%g1
	casxa	[%g1]0x80,%l0,%l1	! %l1 = 130fe697000000d0
!	Mem[00000000100c1410] = 000679ff, %l1 = 130fe697000000d0
	ldstuba	[%i3+%o5]0x88,%l1	! %l1 = 000000ff000000ff
!	Mem[0000000010081430] = fffc1197, %l6 = 0000000000000000
	swap	[%i2+0x030],%l6		! %l6 = 00000000fffc1197
!	%f3  = 00000000, Mem[0000000030041410] = 97e60f00
	sta	%f3 ,[%i1+%o5]0x89	! Mem[0000000030041410] = 00000000
!	%l0 = 00000000000000f4, Mem[0000000010081408] = c81a59ff
	stha	%l0,[%i2+%o4]0x88	! Mem[0000000010081408] = c81a00f4
!	%l4 = 00000000, %l5 = 00000500, Mem[0000000010081410] = ff000000 00000000
	stda	%l4,[%i2+%o5]0x80	! Mem[0000000010081410] = 00000000 00000500
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = ffffb5d7, %l4 = 0000000000000000
	lduh	[%o2+%g0],%l4		! %l4 = 000000000000ffff

p0_label_163:
!	Mem[0000000010001410] = ff59ffc8, %l1 = 00000000000000ff
	ldsba	[%i0+%o5]0x80,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010181410] = ffffffff, %l2 = 00000000000000ff
	ldsba	[%i6+%o5]0x88,%l2	! %l2 = ffffffffffffffff
!	Mem[00000000300c1410] = ff536bffd2c70061, %f0  = 00000000 d2c78255
	ldda	[%i3+%o5]0x81,%f0 	! %f0  = ff536bff d2c70061
!	Mem[00000000218001c0] = 825567be, %l4 = 000000000000ffff
	ldsba	[%o3+0x1c1]%asi,%l4	! %l4 = 0000000000000055
!	Mem[0000000010141400] = 0fffffffb5c330f2, %l7 = 00000000000000ff
	ldxa	[%i5+%g0]0x80,%l7	! %l7 = 0fffffffb5c330f2
!	Mem[0000000010081438] = ed96f7f6, %l5 = 0000000000000500
	ldsb	[%i2+0x039],%l5		! %l5 = ffffffffffffff96
!	Mem[0000000010081438] = ed96f7f6 1ddb824c, %l4 = 00000055, %l5 = ffffff96
	ldda	[%i2+0x038]%asi,%l4	! %l4 = 00000000ed96f7f6 000000001ddb824c
!	%l1 = ffffffffffffffff, Mem[0000000030081400] = 000000bd82000000
	stxa	%l1,[%i2+%g0]0x89	! Mem[0000000030081400] = ffffffffffffffff
!	Mem[0000000010041438] = e5022705ffffc0ff, %l6 = 00000000fffc1197
	ldx	[%i1+0x038],%l6		! %l6 = e5022705ffffc0ff
!	Starting 10 instruction Store Burst
!	%l0 = 000000f4, %l1 = ffffffff, Mem[00000000100c1408] = ff001197 f596f078
	stda	%l0,[%i3+%o4]0x80	! Mem[00000000100c1408] = 000000f4 ffffffff

p0_label_164:
!	Mem[00000000100c141d] = f9fbe3e0, %l4 = 00000000ed96f7f6
	ldstub	[%i3+0x01d],%l4		! %l4 = 000000fb000000ff
!	%f12 = ff591ac8, Mem[00000000300c1408] = 00000000
	sta	%f12,[%i3+%o4]0x89	! Mem[00000000300c1408] = ff591ac8
!	%l4 = 00000000000000fb, Mem[0000000010181400] = 00000000
	stwa	%l4,[%i6+%g0]0x88	! Mem[0000000010181400] = 000000fb
!	%l0 = 000000f4, %l1 = ffffffff, Mem[0000000010001410] = ff59ffc8 00000000
	stda	%l0,[%i0+%o5]0x80	! Mem[0000000010001410] = 000000f4 ffffffff
!	Mem[00000000211c0000] = ffffb5d7, %l7 = 0fffffffb5c330f2
	ldstuba	[%o2+0x000]%asi,%l7	! %l7 = 000000ff000000ff
!	%l6 = e5022705ffffc0ff, Mem[0000000020800001] = ffff7fc1, %asi = 80
	stba	%l6,[%o1+0x001]%asi	! Mem[0000000020800000] = ffff7fc1
!	%f30 = ff3795a8, Mem[0000000010001400] = ff59ffc8
	sta	%f30,[%i0+%g0]0x80	! Mem[0000000010001400] = ff3795a8
!	Mem[0000000021800100] = d03e4a7a, %l5 = 000000001ddb824c
	ldstub	[%o3+0x100],%l5		! %l5 = 000000d0000000ff
!	Mem[0000000030181408] = ff0000d0, %l3 = 0000000000000000
	ldstuba	[%i6+%o4]0x81,%l3	! %l3 = 000000ff000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = 00000000f230c3b5, %f8  = 031a783d b6b67068
	ldda	[%i5+%g0]0x81,%f8 	! %f8  = 00000000 f230c3b5

p0_label_165:
!	Mem[0000000030101408] = 00000000ff000000, %f30 = ff3795a8 0000008a
	ldda	[%i4+%o4]0x81,%f30	! %f30 = 00000000 ff000000
!	Mem[0000000030141408] = 4c000000000000ff, %f6  = ff790600 f47cffff
	ldda	[%i5+%o4]0x81,%f6 	! %f6  = 4c000000 000000ff
!	Mem[0000000010181408] = 000000ff, %l5 = 00000000000000d0
	ldsba	[%i6+%o4]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000010041428] = 000000ff, %l2 = ffffffffffffffff
	lduw	[%i1+0x028],%l2		! %l2 = 00000000000000ff
!	Mem[0000000010181410] = ffffffff 5debeccd, %l4 = 000000fb, %l5 = 00000000
	ldda	[%i6+%o5]0x80,%l4	! %l4 = 00000000ffffffff 000000005debeccd
!	Mem[0000000010181408] = 000000ffc8ff59ff, %f18 = ff59ffc8 0000004c
	ldda	[%i6+%o4]0x80,%f18	! %f18 = 000000ff c8ff59ff
!	Mem[0000000030001408] = 67be2bffff0000a0, %f12 = ff591ac8 000000ff
	ldda	[%i0+%o4]0x89,%f12	! %f12 = 67be2bff ff0000a0
!	%l6 = e5022705ffffc0ff, Mem[0000000030181400] = 00000000d2c78255
	stxa	%l6,[%i6+%g0]0x81	! Mem[0000000030181400] = e5022705ffffc0ff
!	Mem[0000000010141400] = ffffff0f, %l5 = 000000005debeccd
	lduha	[%i5+%g0]0x88,%l5	! %l5 = 000000000000ff0f
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1408] = ff591ac8, %l4 = 00000000ffffffff
	ldstuba	[%i3+%o4]0x89,%l4	! %l4 = 000000c8000000ff

!	Check Point 33 for processor 0

	set	p0_check_pt_data_33,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l1,%g2			! %l1 = ffffffffffffffff
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l2,%g2			! %l2 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l3,%g2			! %l3 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l4,%g2			! %l4 = 00000000000000c8
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l5,%g2			! %l5 = 000000000000ff0f
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l6,%g2			! %l6 = e5022705ffffc0ff
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l7,%g2			! %l7 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x40],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = ff536bff d2c70061
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x48],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = ff59ffc8 00000026
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x50],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 4c000000 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x58],%g3
	std	%f8,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f8 = 00000000 f230c3b5
	bne	%xcc,p0_freg_check_fail
	mov	0xf08,%g1
	ldx	[%g4+0x60],%g3
	std	%f12,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f12 = 67be2bff ff0000a0
	bne	%xcc,p0_freg_check_fail
	mov	0xf12,%g1
	ldx	[%g4+0x68],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = 000000ff c8ff59ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1
	ldx	[%g4+0x70],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = 00000000 ff000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 33 completed


p0_label_166:
!	%f6  = 4c000000 000000ff, Mem[0000000010181408] = 000000ff c8ff59ff
	stda	%f6 ,[%i6+%o4]0x80	! Mem[0000000010181408] = 4c000000 000000ff
!	%l1 = ffffffffffffffff, Mem[000000001000140c] = 000000ff, %asi = 80
	stba	%l1,[%i0+0x00c]%asi	! Mem[000000001000140c] = ff0000ff
!	%f22 = f47cffff 00000000, %l5 = 000000000000ff0f
!	Mem[0000000010081430] = 00000000f596ff78
	add	%i2,0x030,%g1
	stda	%f22,[%g1+%l5]ASI_PST16_P ! Mem[0000000010081430] = f47cffff00000000
!	%l6 = e5022705ffffc0ff, Mem[0000000010001408] = ff000000
	stwa	%l6,[%i0+%o4]0x80	! Mem[0000000010001408] = ffffc0ff
!	Mem[00000000211c0000] = ffffb5d7, %l2 = 00000000000000ff
	ldstuba	[%o2+0x000]%asi,%l2	! %l2 = 000000ff000000ff
!	%f0  = ff536bff d2c70061 ff3795a8 00000000
!	%f4  = ff59ffc8 00000026 4c000000 000000ff
!	%f8  = 00000000 f230c3b5 00000000 ff000000
!	%f12 = 67be2bff ff0000a0 00000000 ff0000d0
	stda	%f0,[%i4]ASI_BLK_SL	! Block Store to 0000000030101400
!	Mem[0000000010141408] = ff3795a8, %l2 = 00000000000000ff
	ldstuba	[%i5+%o4]0x80,%l2	! %l2 = 000000ff000000ff
!	Mem[0000000010141408] = ff3795a8, %l3 = 00000000000000ff
	ldstuba	[%i5+%o4]0x80,%l3	! %l3 = 000000ff000000ff
!	Mem[0000000010081418] = ff6b000000000000, %l3 = 00000000000000ff, %l1 = ffffffffffffffff
	add	%i2,0x18,%g1
	casxa	[%g1]0x80,%l3,%l1	! %l1 = ff6b000000000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = ffffffff, %l0 = 00000000000000f4
	lduha	[%i6+%o5]0x88,%l0	! %l0 = 000000000000ffff

p0_label_167:
!	Mem[0000000030181400] = 052702e5, %l1 = ff6b000000000000
	lduwa	[%i6+%g0]0x89,%l1	! %l1 = 00000000052702e5
!	Mem[0000000010041408] = ff7cffff, %f19 = c8ff59ff
	lda	[%i1+0x008]%asi,%f19	! %f19 = ff7cffff
!	Mem[0000000010001430] = 61000000, %l5 = 000000000000ff0f
	ldsha	[%i0+0x030]%asi,%l5	! %l5 = 0000000000006100
	membar	#Sync			! Added by membar checker (25)
!	Mem[0000000010101408] = ff000000000000ff, %l3 = 00000000000000ff
	ldxa	[%i4+%o4]0x80,%l3	! %l3 = ff000000000000ff
!	Mem[0000000010081400] = f230c3b5, %l7 = 00000000000000ff
	lduba	[%i2+%g0]0x80,%l7	! %l7 = 00000000000000f2
!	Mem[0000000030181408] = ff0000d0 000000ff, %l2 = 000000ff, %l3 = 000000ff
	ldda	[%i6+%o4]0x81,%l2	! %l2 = 00000000ff0000d0 00000000000000ff
!	Mem[00000000100c1400] = ff3795a8, %l3 = 00000000000000ff
	ldsba	[%i3+%g0]0x80,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010101410] = ff00000000000000, %l3 = ffffffffffffffff
	ldxa	[%i4+%o5]0x88,%l3	! %l3 = ff00000000000000
!	Mem[0000000030001410] = 8affffffffffffff, %f2  = ff3795a8 00000000
	ldda	[%i0+%o5]0x81,%f2 	! %f2  = 8affffff ffffffff
!	Starting 10 instruction Store Burst
!	%f24 = 00000000 0000008a, Mem[00000000100c1408] = 000000f4 ffffffff
	stda	%f24,[%i3+%o4]0x80	! Mem[00000000100c1408] = 00000000 0000008a

p0_label_168:
!	%l2 = 00000000ff0000d0, Mem[00000000201c0000] = 00ff9b8f, %asi = 80
	stha	%l2,[%o0+0x000]%asi	! Mem[00000000201c0000] = 00d09b8f
!	Mem[0000000010101410] = 00000000, %l3 = ff00000000000000
	swapa	[%i4+%o5]0x80,%l3	! %l3 = 0000000000000000
!	%f20 = 00000000 f230c3b5, %l3 = 0000000000000000
!	Mem[0000000010101410] = 00000000000000ff
	add	%i4,0x010,%g1
	stda	%f20,[%g1+%l3]ASI_PST32_P ! Mem[0000000010101410] = 00000000000000ff
!	Mem[00000000100c1400] = a89537ff, %l3 = 0000000000000000
	ldstuba	[%i3+%g0]0x88,%l3	! %l3 = 000000ff000000ff
!	%l0 = 000000000000ffff, Mem[0000000030081400] = ffffffff
	stha	%l0,[%i2+%g0]0x89	! Mem[0000000030081400] = ffffffff
!	Mem[000000001018142f] = 000000ff, %l0 = 000000000000ffff
	ldstuba	[%i6+0x02f]%asi,%l0	! %l0 = 000000ff000000ff
!	%l6 = ffffc0ff, %l7 = 000000f2, Mem[0000000030141410] = 82559fff 4e478378
	stda	%l6,[%i5+%o5]0x89	! Mem[0000000030141410] = ffffc0ff 000000f2
!	Mem[00000000100c1400] = ff3795a8ff000000, %l5 = 0000000000006100, %l6 = e5022705ffffc0ff
	casxa	[%i3]0x80,%l5,%l6	! %l6 = ff3795a8ff000000
!	%l5 = 0000000000006100, Mem[0000000010141400] = f230c3b5ffffff0f
	stxa	%l5,[%i5+%g0]0x88	! Mem[0000000010141400] = 0000000000006100
!	Starting 10 instruction Load Burst
!	Mem[0000000010101438] = ff64bfd9 0000008a, %l6 = ff000000, %l7 = 000000f2
	ldd	[%i4+0x038],%l6		! %l6 = 00000000ff64bfd9 000000000000008a

p0_label_169:
!	Mem[0000000010101410] = ff00000000000000, %f12 = 67be2bff ff0000a0
	ldda	[%i4+%o5]0x88,%f12	! %f12 = ff000000 00000000
!	Mem[00000000300c1408] = ff1a59ff, %l7 = 000000000000008a
	lduwa	[%i3+%o4]0x81,%l7	! %l7 = 00000000ff1a59ff
!	Mem[0000000030181408] = ff0000d0000000ff, %l4 = 00000000000000c8
	ldxa	[%i6+%o4]0x81,%l4	! %l4 = ff0000d0000000ff
!	Mem[0000000010081408] = f4001ac8000000ff, %l3 = 00000000000000ff
	ldxa	[%i2+0x008]%asi,%l3	! %l3 = f4001ac8000000ff
!	Mem[0000000010141400] = 0000000000006100, %f6  = 4c000000 000000ff
	ldda	[%i5+%g0]0x88,%f6 	! %f6  = 00000000 00006100
!	Mem[0000000030001400] = 00000000b5c330f2, %f26 = 0000004c ff9f5582
	ldda	[%i0+%g0]0x89,%f26	! %f26 = 00000000 b5c330f2
!	Mem[0000000010181414] = 5debeccd, %l5 = 0000000000006100
	lduh	[%i6+0x014],%l5		! %l5 = 0000000000005deb
!	Mem[0000000030141400] = 00000000f230c3b5, %l5 = 0000000000005deb
	ldxa	[%i5+%g0]0x81,%l5	! %l5 = 00000000f230c3b5
!	Mem[00000000300c1410] = ff6b53ff, %l2 = 00000000ff0000d0
	ldswa	[%i3+%o5]0x89,%l2	! %l2 = ffffffffff6b53ff
!	Starting 10 instruction Store Burst
!	Mem[0000000030081400] = ffffffff, %l3 = f4001ac8000000ff
	swapa	[%i2+%g0]0x81,%l3	! %l3 = 00000000ffffffff

p0_label_170:
!	%l0 = 00000000000000ff, Mem[0000000030141400] = 00000000
	stba	%l0,[%i5+%g0]0x89	! Mem[0000000030141400] = 000000ff
!	%l2 = ffffffffff6b53ff, Mem[0000000010101400] = 00000ca0
	stwa	%l2,[%i4+%g0]0x88	! Mem[0000000010101400] = ff6b53ff
!	Mem[0000000010181410] = ffffffff, %l4 = ff0000d0000000ff
	swapa	[%i6+%o5]0x80,%l4	! %l4 = 00000000ffffffff
!	%f30 = 00000000, Mem[0000000010141408] = ff3795a8
	sta	%f30,[%i5+%o4]0x80	! Mem[0000000010141408] = 00000000
!	Mem[00000000100c1400] = ff3795a8, %l1 = 00000000052702e5
	swapa	[%i3+%g0]0x80,%l1	! %l1 = 00000000ff3795a8
!	Mem[0000000010141408] = 00000000, %l1 = 00000000ff3795a8
	swapa	[%i5+%o4]0x88,%l1	! %l1 = 0000000000000000
!	%f22 = f47cffff, Mem[0000000010001400] = ff3795a8
	sta	%f22,[%i0+%g0]0x80	! Mem[0000000010001400] = f47cffff
!	%l5 = 00000000f230c3b5, Mem[00000000201c0000] = 00d09b8f, %asi = 80
	stba	%l5,[%o0+0x000]%asi	! Mem[00000000201c0000] = b5d09b8f
!	%l5 = 00000000f230c3b5, Mem[0000000030181408] = ff0000d0
	stwa	%l5,[%i6+%o4]0x81	! Mem[0000000030181408] = f230c3b5
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = 4c000000 000000ff, %l4 = ffffffff, %l5 = f230c3b5
	ldd	[%i6+%o4],%l4		! %l4 = 000000004c000000 00000000000000ff

!	Check Point 34 for processor 0

	set	p0_check_pt_data_34,%g4
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
	cmp	%l2,%g2			! %l2 = ffffffffff6b53ff
	bne	%xcc,p0_reg_check_fail2
	mov	0xee2,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l3,%g2			! %l3 = 00000000ffffffff
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l4,%g2			! %l4 = 000000004c000000
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l7,%g2			! %l7 = 00000000ff1a59ff
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x40],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = 8affffff ffffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x48],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = ff59ffc8 00000026
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x50],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 00000000 00006100
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x58],%g3
	std	%f12,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f12 = ff000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf12,%g1
	ldx	[%g4+0x60],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = 000000ff ff7cffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1
	ldx	[%g4+0x68],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = 00000000 b5c330f2
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1

!	Check Point 34 completed


p0_label_171:
!	Mem[00000000100c1420] = 00ec006603eb00ff, %f24 = 00000000 0000008a
	ldda	[%i3+0x020]%asi,%f24	! %f24 = 00ec0066 03eb00ff
!	Mem[00000000300c1408] = ff1a59ffffffffff, %l4 = 000000004c000000
	ldxa	[%i3+%o4]0x81,%l4	! %l4 = ff1a59ffffffffff
!	Mem[0000000010141400] = 00000000 00006100, %l6 = ff64bfd9, %l7 = ff1a59ff
	ldda	[%i5+%g0]0x88,%l6	! %l6 = 0000000000006100 0000000000000000
!	Mem[0000000010041410] = 00ff00ff, %l2 = ffffffffff6b53ff
	lduha	[%i1+%o5]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030001400] = f230c3b5 00000000 a00000ff ff2bbe67
!	Mem[0000000030001410] = 8affffff ffffffff 007bbbbd 835e80db
!	Mem[0000000030001420] = e3d6eb97 6685ec48 5a2bbe67 67be2b5a
!	Mem[0000000030001430] = 3f2cb25d 3e2dee16 22873e41 0bc8eac7
	ldda	[%i0]ASI_BLK_S,%f0	! Block Load from 0000000030001400
!	Mem[0000000010001420] = 8a000000, %l2 = 00000000000000ff
	ldsh	[%i0+0x020],%l2		! %l2 = ffffffffffff8a00
!	Mem[00000000300c1410] = 6100c7d2ff6b53ff, %f22 = f47cffff 00000000
	ldda	[%i3+%o5]0x89,%f22	! %f22 = 6100c7d2 ff6b53ff
!	Mem[00000000211c0000] = ffffb5d7, %l4 = ff1a59ffffffffff
	ldsb	[%o2+0x001],%l4		! %l4 = ffffffffffffffff
!	Mem[0000000010141400] = 0061000000000000, %f22 = 6100c7d2 ff6b53ff
	ldda	[%i5+%g0]0x80,%f22	! %f22 = 00610000 00000000
!	Starting 10 instruction Store Burst
!	%l7 = 0000000000000000, Mem[0000000010001400] = ffff7cf4
	stwa	%l7,[%i0+%g0]0x88	! Mem[0000000010001400] = 00000000

p0_label_172:
!	%l1 = 0000000000000000, Mem[0000000010101400] = ff536bff
	stha	%l1,[%i4+%g0]0x80	! Mem[0000000010101400] = 00006bff
!	%l2 = ffff8a00, %l3 = ffffffff, Mem[0000000010081410] = 00000000 00000500
	stda	%l2,[%i2+%o5]0x80	! Mem[0000000010081410] = ffff8a00 ffffffff
!	Mem[00000000201c0000] = b5d09b8f, %l0 = 00000000000000ff
	ldstuba	[%o0+0x000]%asi,%l0	! %l0 = 000000b5000000ff
!	%l1 = 0000000000000000, Mem[0000000010181410] = cdeceb5dff000000
	stxa	%l1,[%i6+%o5]0x88	! Mem[0000000010181410] = 0000000000000000
!	Mem[0000000030041410] = 00000000, %l5 = 00000000000000ff
	swapa	[%i1+%o5]0x81,%l5	! %l5 = 0000000000000000
!	%f28 = f230c3b5, Mem[0000000030141400] = 000000ff
	sta	%f28,[%i5+%g0]0x89	! Mem[0000000030141400] = f230c3b5
!	Mem[0000000030041400] = 000000ff, %l3 = 00000000ffffffff
	swapa	[%i1+%g0]0x81,%l3	! %l3 = 00000000000000ff
!	%l5 = 0000000000000000, Mem[0000000020800041] = ffffe25a
	stb	%l5,[%o1+0x041]		! Mem[0000000020800040] = ff00e25a
!	%l6 = 00006100, %l7 = 00000000, Mem[00000000100c1428] = ffe8739e 000000ff
	std	%l6,[%i3+0x028]		! Mem[00000000100c1428] = 00006100 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010181418] = ffc70061, %l4 = ffffffffffffffff
	lduh	[%i6+0x018],%l4		! %l4 = 000000000000ffc7

p0_label_173:
!	Mem[0000000010101410] = 00000000, %l7 = 0000000000000000
	ldsba	[%i4+%o5]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000030041408] = ff000000, %l1 = 0000000000000000
	lduwa	[%i1+%o4]0x81,%l1	! %l1 = 00000000ff000000
!	Mem[0000000010001400] = 00000000, %f23 = 00000000
	lda	[%i0+%g0]0x80,%f23	! %f23 = 00000000
!	Mem[00000000300c1410] = ff536bff, %l6 = 0000000000006100
	lduha	[%i3+%o5]0x81,%l6	! %l6 = 000000000000ff53
!	Mem[0000000010041410] = ff00ff00, %l6 = 000000000000ff53
	lduwa	[%i1+%o5]0x80,%l6	! %l6 = 00000000ff00ff00
!	Mem[0000000010081410] = ffff8a00, %l4 = 000000000000ffc7
	lduha	[%i2+%o5]0x80,%l4	! %l4 = 000000000000ffff
!	Mem[0000000010141408] = 00000000 ff3795a8, %l2 = ffff8a00, %l3 = 000000ff
	ldda	[%i5+%o4]0x88,%l2	! %l2 = 00000000ff3795a8 0000000000000000
!	Mem[0000000010101400] = 00006bff8e0705b0, %f28 = f230c3b5 ffffffff
	ldda	[%i4+%g0]0x80,%f28	! %f28 = 00006bff 8e0705b0
!	Mem[0000000010001410] = 000000f4 ffffffff, %l4 = 0000ffff, %l5 = 00000000
	ldda	[%i0+%o5]0x80,%l4	! %l4 = 00000000000000f4 00000000ffffffff
!	Starting 10 instruction Store Burst
!	Mem[0000000010081400] = b5c330f2, %l1 = 00000000ff000000
	ldstuba	[%i2+%g0]0x88,%l1	! %l1 = 000000f2000000ff

p0_label_174:
!	%l6 = 00000000ff00ff00, Mem[0000000010181408] = 0000004c
	stha	%l6,[%i6+%o4]0x88	! Mem[0000000010181408] = 0000ff00
!	Mem[0000000030081400] = ff000000, %l2 = 00000000ff3795a8
	swapa	[%i2+%g0]0x89,%l2	! %l2 = 00000000ff000000
!	%f16 = 00000000 c8ff59ff, Mem[0000000030181408] = b5c330f2 ff000000
	stda	%f16,[%i6+%o4]0x89	! Mem[0000000030181408] = 00000000 c8ff59ff
!	Mem[00000000201c0001] = ffd09b8f, %l1 = 00000000000000f2
	ldstub	[%o0+0x001],%l1		! %l1 = 000000d0000000ff
	membar	#Sync			! Added by membar checker (26)
!	%l1 = 00000000000000d0, Mem[0000000030001400] = b5c330f2
	stwa	%l1,[%i0+%g0]0x89	! Mem[0000000030001400] = 000000d0
!	Mem[0000000030001408] = a00000ff, %l0 = 00000000000000b5
	swapa	[%i0+%o4]0x81,%l0	! %l0 = 00000000a00000ff
!	%f16 = 00000000 c8ff59ff 000000ff ff7cffff
!	%f20 = 00000000 f230c3b5 00610000 00000000
!	%f24 = 00ec0066 03eb00ff 00000000 b5c330f2
!	%f28 = 00006bff 8e0705b0 00000000 ff000000
	stda	%f16,[%i3]ASI_BLK_S	! Block Store to 00000000300c1400
!	%l7 = 0000000000000000, Mem[0000000010101438] = ff64bfd9, %asi = 80
	stwa	%l7,[%i4+0x038]%asi	! Mem[0000000010101438] = 00000000
!	%l2 = ff000000, %l3 = 00000000, Mem[0000000030101410] = 00000026 ff59ffc8
	stda	%l2,[%i4+%o5]0x89	! Mem[0000000030101410] = ff000000 00000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = ff6b0000, %l1 = 00000000000000d0
	lduha	[%i4+%g0]0x88,%l1	! %l1 = 0000000000000000

p0_label_175:
!	Mem[0000000030081400] = ffffffffff3795a8, %f12 = 3f2cb25d 3e2dee16
	ldda	[%i2+%g0]0x89,%f12	! %f12 = ffffffff ff3795a8
!	Mem[0000000021800080] = d8003b1a, %l5 = 00000000ffffffff
	ldsha	[%o3+0x080]%asi,%l5	! %l5 = ffffffffffffd800
!	Mem[0000000010101428] = 0000ff0000000000, %l0 = 00000000a00000ff
	ldx	[%i4+0x028],%l0		! %l0 = 0000ff0000000000
!	Mem[0000000030181408] = ff59ffc800000000, %f10 = 5a2bbe67 67be2b5a
	ldda	[%i6+%o4]0x81,%f10	! %f10 = ff59ffc8 00000000
!	Mem[0000000010041400] = 00000000, %l4 = 00000000000000f4
	ldsha	[%i1+%g0]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000030001408] = 000000b5ff2bbe67, %f14 = 22873e41 0bc8eac7
	ldda	[%i0+%o4]0x81,%f14	! %f14 = 000000b5 ff2bbe67
!	Mem[0000000030081410] = 00000000, %l7 = 0000000000000000
	lduha	[%i2+%o5]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000010081410] = ffff8a00, %l4 = 0000000000000000
	ldsha	[%i2+0x010]%asi,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010081408] = c81a00f4, %l4 = ffffffffffffffff
	ldsha	[%i2+%o4]0x88,%l4	! %l4 = 00000000000000f4
!	Starting 10 instruction Store Burst
!	%l2 = 00000000ff000000, Mem[0000000030101400] = 6100c7d2
	stba	%l2,[%i4+%g0]0x81	! Mem[0000000030101400] = 0000c7d2

!	Check Point 35 for processor 0

	set	p0_check_pt_data_35,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 0000ff0000000000
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
	cmp	%l4,%g2			! %l4 = 00000000000000f4
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x28],%g2
	cmp	%l5,%g2			! %l5 = ffffffffffffd800
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l6,%g2			! %l6 = 00000000ff00ff00
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l7,%g2			! %l7 = 0000000000000000
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x40],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = f230c3b5 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x48],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = a00000ff ff2bbe67
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x50],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 8affffff ffffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x58],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 007bbbbd 835e80db
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x60],%g3
	std	%f8,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f8 = e3d6eb97 6685ec48
	bne	%xcc,p0_freg_check_fail
	mov	0xf08,%g1
	ldx	[%g4+0x68],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = ff59ffc8 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x70],%g3
	std	%f12,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f12 = ffffffff ff3795a8
	bne	%xcc,p0_freg_check_fail
	mov	0xf12,%g1
	ldx	[%g4+0x78],%g3
	std	%f14,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f14 = 000000b5 ff2bbe67
	bne	%xcc,p0_freg_check_fail
	mov	0xf14,%g1
	ldx	[%g4+0x80],%g3
	std	%f22,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f22 = 00610000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf22,%g1
	ldx	[%g4+0x88],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = 00ec0066 03eb00ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1
	ldx	[%g4+0x90],%g3
	std	%f28,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f28 = 00006bff 8e0705b0
	bne	%xcc,p0_freg_check_fail
	mov	0xf28,%g1

!	Check Point 35 completed


p0_label_176:
!	Mem[0000000010141410] = 00000ca0, %l2 = 00000000ff000000
	swapa	[%i5+%o5]0x80,%l2	! %l2 = 0000000000000ca0
!	Mem[00000000201c0001] = ffff9b8f, %l2 = 0000000000000ca0
	ldstub	[%o0+0x001],%l2		! %l2 = 000000ff000000ff
!	%l7 = 0000000000000000, Mem[0000000010001416] = ffffffff
	sth	%l7,[%i0+0x016]		! Mem[0000000010001414] = ffff0000
!	Code Fragment 3
p0_fragment_5:
!	%l0 = 0000ff0000000000
	setx	0x8c69a7d7c68ce5ee,%g7,%l0 ! %l0 = 8c69a7d7c68ce5ee
!	%l1 = 0000000000000000
	setx	0x92c51cc7c948afb7,%g7,%l1 ! %l1 = 92c51cc7c948afb7
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 8c69a7d7c68ce5ee
	setx	0xf0f204afe4250d30,%g7,%l0 ! %l0 = f0f204afe4250d30
!	%l1 = 92c51cc7c948afb7
	setx	0xf67367e81961d5bd,%g7,%l1 ! %l1 = f67367e81961d5bd
!	Mem[00000000211c0001] = ffffb5d7, %l2 = 00000000000000ff
	ldstuba	[%o2+0x001]%asi,%l2	! %l2 = 000000ff000000ff
!	Mem[0000000010081410] = 008affff, %l0 = f0f204afe4250d30
	ldstuba	[%i2+%o5]0x88,%l0	! %l0 = 000000ff000000ff
!	%f18 = 000000ff ff7cffff, Mem[0000000030101400] = 0000c7d2 ff6b53ff
	stda	%f18,[%i4+%g0]0x81	! Mem[0000000030101400] = 000000ff ff7cffff
!	%l0 = 00000000000000ff, Mem[00000000300c1400] = 00000000
	stba	%l0,[%i3+%g0]0x81	! Mem[00000000300c1400] = ff000000
!	%l4 = 00000000000000f4, Mem[0000000010181428] = 00000000
	stb	%l4,[%i6+0x028]		! Mem[0000000010181428] = f4000000
!	Starting 10 instruction Load Burst
!	Mem[0000000010001404] = 00000000, %l5 = ffffffffffffd800
	ldsha	[%i0+0x006]%asi,%l5	! %l5 = 0000000000000000

p0_label_177:
!	Mem[000000001018141c] = c511d0b3, %l4 = 00000000000000f4
	ldub	[%i6+0x01c],%l4		! %l4 = 00000000000000c5
!	Mem[0000000010001408] = ffc0ffff, %l5 = 0000000000000000
	lduba	[%i0+%o4]0x88,%l5	! %l5 = 00000000000000ff
	membar	#Sync			! Added by membar checker (27)
!	Mem[00000000100c1430] = 130fe697, %l0 = 00000000000000ff
	ldswa	[%i3+0x030]%asi,%l0	! %l0 = 00000000130fe697
!	Mem[0000000010041400] = ff00000000000000, %l6 = 00000000ff00ff00
	ldxa	[%i1+%g0]0x88,%l6	! %l6 = ff00000000000000
!	Mem[0000000010181408] = 0000ff00, %l5 = 00000000000000ff
	ldswa	[%i6+%o4]0x88,%l5	! %l5 = 000000000000ff00
!	Mem[0000000030041410] = 000000ff, %l4 = 00000000000000c5
	lduba	[%i1+%o5]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000010081400] = b5c330ff, %l7 = 0000000000000000
	lduba	[%i2+%g0]0x88,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030141410] = ffffc0ff, %l2 = 00000000000000ff
	ldswa	[%i5+%o5]0x89,%l2	! %l2 = ffffffffffffc0ff
!	Mem[0000000010141420] = 031a783d, %l3 = 0000000000000000
	ldsha	[%i5+0x020]%asi,%l3	! %l3 = 000000000000031a
!	Starting 10 instruction Store Burst
!	%f0  = f230c3b5 00000000 a00000ff ff2bbe67
!	%f4  = 8affffff ffffffff 007bbbbd 835e80db
!	%f8  = e3d6eb97 6685ec48 ff59ffc8 00000000
!	%f12 = ffffffff ff3795a8 000000b5 ff2bbe67
	stda	%f0,[%i4]ASI_COMMIT_P	! Block Store to 0000000010101400

p0_label_178:
	membar	#Sync			! Added by membar checker (28)
!	%l7 = 00000000000000ff, Mem[0000000010101422] = e3d6eb97
	sth	%l7,[%i4+0x022]		! Mem[0000000010101420] = e3d600ff
!	%l5 = 000000000000ff00, Mem[00000000218001c1] = 825567be
	stb	%l5,[%o3+0x1c1]		! Mem[00000000218001c0] = 820067be
!	%l5 = 000000000000ff00, Mem[0000000030001410] = 8affffff
	stwa	%l5,[%i0+%o5]0x81	! Mem[0000000030001410] = 0000ff00
!	Mem[00000000211c0000] = ffffb5d7, %l5 = 000000000000ff00
	ldstub	[%o2+%g0],%l5		! %l5 = 000000ff000000ff
!	Mem[0000000010001400] = 00000000, %l7 = 00000000000000ff
	ldstuba	[%i0+%g0]0x88,%l7	! %l7 = 00000000000000ff
!	%l0 = 00000000130fe697, Mem[0000000010141410] = ff000000
	stba	%l0,[%i5+%o5]0x80	! Mem[0000000010141410] = 97000000
!	Mem[0000000030141400] = b5c330f2, %l7 = 0000000000000000
	swapa	[%i5+%g0]0x81,%l7	! %l7 = 00000000b5c330f2
!	%l7 = 00000000b5c330f2, Mem[0000000010041400] = 00000000000000ff
	stxa	%l7,[%i1+%g0]0x80	! Mem[0000000010041400] = 00000000b5c330f2
!	%f13 = ff3795a8, Mem[0000000030101410] = ff000000
	sta	%f13,[%i4+%o5]0x89	! Mem[0000000030101410] = ff3795a8
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = 00000000, %l3 = 000000000000031a
	lduha	[%i6+%o5]0x80,%l3	! %l3 = 0000000000000000

p0_label_179:
!	Mem[00000000100c1400] = 052702e5 ff000000 00000000 0000008a
!	Mem[00000000100c1410] = ff790600 00000000 a4590300 f9ffe3e0
!	Mem[00000000100c1420] = 00ec0066 03eb00ff 00006100 00000000
!	Mem[00000000100c1430] = 130fe697 000000d0 0000b6b6 413e8722
	ldda	[%i3]ASI_BLK_PL,%f0	! Block Load from 00000000100c1400
!	Mem[0000000010101410] = ffffff8a, %f26 = 00000000
	lda	[%i4+%o5]0x88,%f26	! %f26 = ffffff8a
!	Mem[0000000020800040] = ff00e25a, %l6 = ff00000000000000
	lduha	[%o1+0x040]%asi,%l6	! %l6 = 000000000000ff00
!	Mem[000000001010143c] = ff2bbe67, %l3 = 0000000000000000
	lduw	[%i4+0x03c],%l3		! %l3 = 00000000ff2bbe67
!	Mem[0000000010181410] = 00000000, %f23 = 00000000
	lda	[%i6+%o5]0x88,%f23	! %f23 = 00000000
	membar	#Sync			! Added by membar checker (29)
!	Mem[0000000030101400] = 000000ff ff7cffff 00000000 a89537ff
!	Mem[0000000030101410] = a89537ff 00000000 ff000000 0000004c
!	Mem[0000000030101420] = b5c330f2 00000000 000000ff 00000000
!	Mem[0000000030101430] = a00000ff ff2bbe67 d00000ff 00000000
	ldda	[%i4]ASI_BLK_AIUSL,%f16	! Block Load from 0000000030101400
!	Mem[0000000030081408] = ff59ffc8, %f8  = ff00eb03
	lda	[%i2+%o4]0x81,%f8 	! %f8 = ff59ffc8
!	Mem[0000000030041410] = 000000ff, %l7 = 00000000b5c330f2
	ldswa	[%i1+%o5]0x81,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030181410] = 00000000, %l7 = 00000000000000ff
	ldswa	[%i6+%o5]0x81,%l7	! %l7 = 0000000000000000
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (30)
!	%l1 = f67367e81961d5bd, Mem[0000000030101408] = 00000000
	stwa	%l1,[%i4+%o4]0x89	! Mem[0000000030101408] = 1961d5bd

p0_label_180:
!	%l5 = 00000000000000ff, Mem[00000000100c1400] = 052702e5ff000000
	stxa	%l5,[%i3+%g0]0x80	! Mem[00000000100c1400] = 00000000000000ff
!	%l6 = 0000ff00, %l7 = 00000000, Mem[0000000030101408] = bdd56119 a89537ff
	stda	%l6,[%i4+%o4]0x81	! Mem[0000000030101408] = 0000ff00 00000000
!	%l0 = 00000000130fe697, Mem[0000000010141419] = ff790600, %asi = 80
	stba	%l0,[%i5+0x019]%asi	! Mem[0000000010141418] = ff970600
!	Mem[00000000100c1400] = 00000000, %l1 = f67367e81961d5bd
	ldstuba	[%i3+%g0]0x88,%l1	! %l1 = 00000000000000ff
!	%f26 = 00000000, Mem[0000000030041400] = ffffffff
	sta	%f26,[%i1+%g0]0x81	! Mem[0000000030041400] = 00000000
!	Mem[0000000030041408] = ff000000, %l0 = 00000000130fe697
	swapa	[%i1+%o4]0x81,%l0	! %l0 = 00000000ff000000
!	%l0 = 00000000ff000000, Mem[0000000030041408] = 97e60f13
	stba	%l0,[%i1+%o4]0x89	! Mem[0000000030041408] = 97e60f00
!	Mem[0000000010041410] = 00ff00ff, %l3 = 00000000ff2bbe67
	ldstuba	[%i1+%o5]0x88,%l3	! %l3 = 000000ff000000ff
!	Mem[0000000010081400] = ff30c3b5, %l0 = 00000000ff000000
	swapa	[%i2+%g0]0x80,%l0	! %l0 = 00000000ff30c3b5
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = 0000ff00, %l5 = 00000000000000ff
	ldsha	[%i0+%o5]0x81,%l5	! %l5 = 0000000000000000

!	Check Point 36 for processor 0

	set	p0_check_pt_data_36,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 00000000ff30c3b5
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 0000000000000000
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = ffffffffffffc0ff
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
	cmp	%l6,%g2			! %l6 = 000000000000ff00
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 0000000000000000
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = 000000ff e5022705
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x50],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = 8a000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x58],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 00000000 000679ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x60],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = e0e3fff9 000359a4
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x68],%g3
	std	%f8,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f8 = ff59ffc8 6600ec00
	bne	%xcc,p0_freg_check_fail
	mov	0xf08,%g1
	ldx	[%g4+0x70],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = 00000000 00610000
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x78],%g3
	std	%f12,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f12 = d0000000 97e60f13
	bne	%xcc,p0_freg_check_fail
	mov	0xf12,%g1
	ldx	[%g4+0x80],%g3
	std	%f14,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f14 = 22873e41 b6b60000
	bne	%xcc,p0_freg_check_fail
	mov	0xf14,%g1
	ldx	[%g4+0x88],%g3
	std	%f16,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f16 = ffff7cff ff000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf16,%g1
	ldx	[%g4+0x90],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = ff3795a8 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1
	ldx	[%g4+0x98],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = 00000000 ff3795a8
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1
	ldx	[%g4+0xa0],%g3
	std	%f22,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f22 = 4c000000 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf22,%g1
	ldx	[%g4+0xa8],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = 00000000 f230c3b5
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1
	ldx	[%g4+0xb0],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = 00000000 ff000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1
	ldx	[%g4+0xb8],%g3
	std	%f28,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f28 = 67be2bff ff0000a0
	bne	%xcc,p0_freg_check_fail
	mov	0xf28,%g1
	ldx	[%g4+0xc0],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = 00000000 ff0000d0
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 36 completed


p0_label_181:
!	Mem[00000000100c1418] = a4590300, %l1 = 0000000000000000
	lduh	[%i3+0x018],%l1		! %l1 = 000000000000a459
	membar	#Sync			! Added by membar checker (31)
!	Mem[0000000010081400] = ff000000 000000b5 f4001ac8 000000ff
!	Mem[0000000010081410] = ffff8a00 ffffffff ff6b0000 00000000
!	Mem[0000000010081420] = 00006bff 000000ff ffffffff ea867e20
!	Mem[0000000010081430] = f47cffff 00000000 ed96f7f6 1ddb824c
	ldda	[%i2]ASI_BLK_PL,%f16	! Block Load from 0000000010081400
!	Mem[0000000010141408] = ff3795a8, %l0 = 00000000ff30c3b5
	lduba	[%i5+%o4]0x88,%l0	! %l0 = 00000000000000a8
!	Mem[0000000010041400] = f230c3b500000000, %l2 = ffffffffffffc0ff
	ldxa	[%i1+%g0]0x88,%l2	! %l2 = f230c3b500000000
!	Mem[00000000300c1410] = 00000000, %l6 = 000000000000ff00
	ldsha	[%i3+%o5]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000030041408] = 000fe697, %l3 = 00000000000000ff
	lduha	[%i1+%o4]0x81,%l3	! %l3 = 000000000000000f
!	Mem[0000000030141408] = ff000000 0000004c, %l2 = 00000000, %l3 = 0000000f
	ldda	[%i5+%o4]0x89,%l2	! %l2 = 000000000000004c 00000000ff000000
!	Mem[00000000300c1408] = 000000ffff7cffff, %l0 = 00000000000000a8
	ldxa	[%i3+%o4]0x81,%l0	! %l0 = 000000ffff7cffff
!	Mem[0000000030001400] = d0000000, %l3 = 00000000ff000000
	lduwa	[%i0+%g0]0x81,%l3	! %l3 = 00000000d0000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030081400] = ff3795a8, %l0 = 000000ffff7cffff
	swapa	[%i2+%g0]0x89,%l0	! %l0 = 00000000ff3795a8

p0_label_182:
!	%f6  = e0e3fff9 000359a4, Mem[00000000300c1410] = 00000000 b5c330f2
	stda	%f6 ,[%i3+%o5]0x89	! Mem[00000000300c1410] = e0e3fff9 000359a4
!	%l0 = 00000000ff3795a8, Mem[00000000100c1410] = 000679ff
	stha	%l0,[%i3+%o5]0x88	! Mem[00000000100c1410] = 000695a8
!	Mem[0000000010141430] = ff591ac8, %l6 = 0000000000000000, %asi = 80
	swapa	[%i5+0x030]%asi,%l6	! %l6 = 00000000ff591ac8
!	Mem[00000000100c141c] = f9ffe3e0, %l5 = 0000000000000000, %asi = 80
	swapa	[%i3+0x01c]%asi,%l5	! %l5 = 00000000f9ffe3e0
!	Mem[0000000010141410] = 97000000, %l6 = 00000000ff591ac8
	swapa	[%i5+%o5]0x80,%l6	! %l6 = 0000000097000000
!	%l3 = 00000000d0000000, Mem[0000000030001408] = b5000000
	stha	%l3,[%i0+%o4]0x89	! Mem[0000000030001408] = b5000000
!	Mem[0000000010101410] = ffffff8a, %l0 = 00000000ff3795a8
	swapa	[%i4+%o5]0x88,%l0	! %l0 = 00000000ffffff8a
!	%f12 = d0000000 97e60f13, Mem[0000000030001410] = 0000ff00 ffffffff
	stda	%f12,[%i0+%o5]0x81	! Mem[0000000030001410] = d0000000 97e60f13
!	Mem[000000001000140c] = ff0000ff, %l7 = 0000000000000000
	swap	[%i0+0x00c],%l7		! %l7 = 00000000ff0000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = ff591ac8, %l0 = 00000000ffffff8a
	lduha	[%i5+%o5]0x80,%l0	! %l0 = 000000000000ff59

p0_label_183:
!	Mem[00000000201c0000] = ffff9b8f, %l3 = 00000000d0000000
	ldsha	[%o0+0x000]%asi,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000030081408] = ff59ffc8, %f14 = 22873e41
	lda	[%i2+%o4]0x81,%f14	! %f14 = ff59ffc8
!	Mem[0000000010041418] = 2da07cf4, %l1 = 000000000000a459
	ldub	[%i1+0x018],%l1		! %l1 = 000000000000002d
!	Mem[0000000030101400] = ff000000, %l0 = 000000000000ff59
	ldsba	[%i4+%g0]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000030101400] = ff000000, %l3 = ffffffffffffffff
	lduha	[%i4+%g0]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000010181400] = fb000000 000000ff, %l6 = 97000000, %l7 = ff0000ff
	ldda	[%i6+%g0]0x80,%l6	! %l6 = 00000000fb000000 00000000000000ff
!	Mem[0000000010081438] = ed96f7f61ddb824c, %l5 = 00000000f9ffe3e0
	ldx	[%i2+0x038],%l5		! %l5 = ed96f7f61ddb824c
!	Mem[0000000010101400] = f230c3b5, %f10 = 00000000
	lda	[%i4+%g0]0x80,%f10	! %f10 = f230c3b5
!	Mem[00000000300c1400] = ff000000, %f14 = ff59ffc8
	lda	[%i3+%g0]0x81,%f14	! %f14 = ff000000
!	Starting 10 instruction Store Burst
	membar	#Sync			! Added by membar checker (32)
!	%f12 = d0000000 97e60f13, Mem[0000000010081400] = ff000000 000000b5
	stda	%f12,[%i2+%g0]0x80	! Mem[0000000010081400] = d0000000 97e60f13

p0_label_184:
!	Mem[0000000021800081] = d8003b1a, %l3 = 0000000000000000
	ldstub	[%o3+0x081],%l3		! %l3 = 00000000000000ff
!	%l6 = 00000000fb000000, Mem[0000000010181408] = 00ff0000000000ff, %asi = 80
	stxa	%l6,[%i6+0x008]%asi	! Mem[0000000010181408] = 00000000fb000000
!	%l2 = 0000004c, %l3 = 00000000, Mem[0000000010041408] = ff7cffff 00000000
	stda	%l2,[%i1+%o4]0x80	! Mem[0000000010041408] = 0000004c 00000000
!	%l2 = 000000000000004c, Mem[0000000010181420] = 00000000
	sth	%l2,[%i6+0x020]		! Mem[0000000010181420] = 004c0000
!	%l5 = ed96f7f61ddb824c, Mem[0000000030181400] = e5022705
	stwa	%l5,[%i6+%g0]0x81	! Mem[0000000030181400] = 1ddb824c
!	%l2 = 0000004c, %l3 = 00000000, Mem[00000000300c1410] = a4590300 f9ffe3e0
	stda	%l2,[%i3+%o5]0x81	! Mem[00000000300c1410] = 0000004c 00000000
!	%f30 = 4c82db1d f6f796ed, Mem[0000000010041400] = 00000000 b5c330f2
	stda	%f30,[%i1+%g0]0x80	! Mem[0000000010041400] = 4c82db1d f6f796ed
!	%f0  = 000000ff e5022705, Mem[0000000030001408] = b5000000 67be2bff
	stda	%f0 ,[%i0+%o4]0x89	! Mem[0000000030001408] = 000000ff e5022705
!	Mem[0000000010081400] = d0000000, %l2 = 000000000000004c
	ldstub	[%i2+%g0],%l2		! %l2 = 000000d0000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000030001400] = d0000000, %l1 = 000000000000002d
	ldswa	[%i0+%g0]0x81,%l1	! %l1 = ffffffffd0000000

p0_label_185:
!	Mem[0000000030181400] = ffc0ffff 4c82db1d, %l4 = 00000000, %l5 = 1ddb824c
	ldda	[%i6+%g0]0x89,%l4	! %l4 = 000000004c82db1d 00000000ffc0ffff
!	Mem[0000000010181408] = 00000000, %l6 = 00000000fb000000
	lduha	[%i6+%o4]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000010141400] = 00006100, %l7 = 00000000000000ff
	lduwa	[%i5+%g0]0x88,%l7	! %l7 = 0000000000006100
!	Mem[0000000030101400] = ff000000, %l5 = 00000000ffc0ffff
	lduba	[%i4+%g0]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000010101400] = b5c330f2, %f31 = f6f796ed
	lda	[%i4+%g0]0x88,%f31	! %f31 = b5c330f2
!	Mem[0000000030001408] = 000000ff e5022705, %l0 = 00000000, %l1 = d0000000
	ldda	[%i0+%o4]0x89,%l0	! %l0 = 00000000e5022705 00000000000000ff
!	Mem[0000000030101410] = 00000000ff3795a8, %l6 = 0000000000000000
	ldxa	[%i4+%o5]0x89,%l6	! %l6 = 00000000ff3795a8
!	Mem[0000000030101408] = 0000ff00, %l2 = 00000000000000d0
	ldswa	[%i4+%o4]0x81,%l2	! %l2 = 000000000000ff00
!	Mem[00000000300c1400] = 000000ff, %l3 = 0000000000000000
	ldsha	[%i3+%g0]0x89,%l3	! %l3 = 00000000000000ff
!	Starting 10 instruction Store Burst
!	Mem[000000001014142c] = ff000000, %l1 = 00000000000000ff, %asi = 80
	swapa	[%i5+0x02c]%asi,%l1	! %l1 = 00000000ff000000

!	Check Point 37 for processor 0

	set	p0_check_pt_data_37,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 00000000e5022705
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 00000000ff000000
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 000000000000ff00
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
	cmp	%l6,%g2			! %l6 = 00000000ff3795a8
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l7,%g2			! %l7 = 0000000000006100
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x40],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = 000000ff e5022705
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x48],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = 8a000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x50],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 00000000 000679ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x58],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = e0e3fff9 000359a4
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x60],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = f230c3b5 00610000
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1
	ldx	[%g4+0x68],%g3
	std	%f14,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f14 = ff000000 b6b60000
	bne	%xcc,p0_freg_check_fail
	mov	0xf14,%g1
	ldx	[%g4+0x70],%g3
	std	%f16,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f16 = b5000000 000000ff
	bne	%xcc,p0_freg_check_fail
	mov	0xf16,%g1
	ldx	[%g4+0x78],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = ff000000 c81a00f4
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1
	ldx	[%g4+0x80],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = ffffffff 008affff
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1
	ldx	[%g4+0x88],%g3
	std	%f22,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f22 = 00000000 00006bff
	bne	%xcc,p0_freg_check_fail
	mov	0xf22,%g1
	ldx	[%g4+0x90],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = ff000000 ff6b0000
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1
	ldx	[%g4+0x98],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = 207e86ea ffffffff
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1
	ldx	[%g4+0xa0],%g3
	std	%f28,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f28 = 00000000 ffff7cf4
	bne	%xcc,p0_freg_check_fail
	mov	0xf28,%g1
	ldx	[%g4+0xa8],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = 4c82db1d b5c330f2
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 37 completed


p0_label_186:
!	Mem[000000001010140c] = ff2bbe67, %l2 = 000000000000ff00, %asi = 80
	swapa	[%i4+0x00c]%asi,%l2	! %l2 = 00000000ff2bbe67
!	Mem[0000000030181400] = 1ddb824c, %l1 = 00000000ff000000
	ldstuba	[%i6+%g0]0x81,%l1	! %l1 = 0000001d000000ff
!	Mem[0000000010041408] = 0000004c00000000, %l1 = 000000000000001d, %l2 = 00000000ff2bbe67
	add	%i1,0x08,%g1
	casxa	[%g1]0x80,%l1,%l2	! %l2 = 0000004c00000000
!	%f6  = e0e3fff9 000359a4, Mem[0000000030081410] = 00000000 c76d6721
	stda	%f6 ,[%i2+%o5]0x89	! Mem[0000000030081410] = e0e3fff9 000359a4
!	%l5 = 0000000000000000, Mem[0000000030081400] = ffffffffff7cffff
	stxa	%l5,[%i2+%g0]0x89	! Mem[0000000030081400] = 0000000000000000
!	%l7 = 0000000000006100, Mem[000000001004142a] = 000000ff
	sth	%l7,[%i1+0x02a]		! Mem[0000000010041428] = 00006100
!	Mem[0000000030181410] = 00000000, %l1 = 000000000000001d
	ldstuba	[%i6+%o5]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[00000000300c1410] = 4c000000, %l1 = 0000000000000000
	swapa	[%i3+%o5]0x89,%l1	! %l1 = 000000004c000000
!	%f14 = ff000000 b6b60000, %l6 = 00000000ff3795a8
!	Mem[0000000010101420] = e3d600ff6685ec48
	add	%i4,0x020,%g1
	stda	%f14,[%g1+%l6]ASI_PST32_PL ! Mem[0000000010101420] = e3d600ff6685ec48
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (33)
!	Mem[0000000030001400] = d0000000 00000000 052702e5 ff000000
!	Mem[0000000030001410] = d0000000 97e60f13 007bbbbd 835e80db
!	Mem[0000000030001420] = e3d6eb97 6685ec48 5a2bbe67 67be2b5a
!	Mem[0000000030001430] = 3f2cb25d 3e2dee16 22873e41 0bc8eac7
	ldda	[%i0]ASI_BLK_AIUS,%f16	! Block Load from 0000000030001400

p0_label_187:
!	Mem[00000000100c1430] = 130fe697, %l7 = 0000000000006100
	ldsba	[%i3+0x032]%asi,%l7	! %l7 = ffffffffffffffe6
!	Mem[0000000030141400] = b5c330f200000000, %l2 = 0000004c00000000
	ldxa	[%i5+%g0]0x89,%l2	! %l2 = b5c330f200000000
!	Mem[0000000010141400] = 00610000 00000000, %l0 = e5022705, %l1 = 4c000000
	ldda	[%i5+%g0]0x80,%l0	! %l0 = 0000000000610000 0000000000000000
!	Mem[0000000010041400] = 4c82db1d, %f4  = 00000000
	lda	[%i1+%g0]0x80,%f4 	! %f4 = 4c82db1d
!	Mem[00000000100c1408] = 8a00000000000000, %l6 = 00000000ff3795a8
	ldxa	[%i3+%o4]0x88,%l6	! %l6 = 8a00000000000000
!	Mem[0000000030081408] = 000000ffc8ff59ff, %l6 = 8a00000000000000
	ldxa	[%i2+%o4]0x89,%l6	! %l6 = 000000ffc8ff59ff
!	Mem[0000000010041400] = 4c82db1df6f796ed, %l5 = 0000000000000000
	ldx	[%i1+%g0],%l5		! %l5 = 4c82db1df6f796ed
!	Mem[00000000100c1408] = 8a00000000000000, %f4  = 4c82db1d 000679ff
	ldda	[%i3+%o4]0x88,%f4 	! %f4  = 8a000000 00000000
!	Mem[0000000010181408] = 000000fb00000000, %f14 = ff000000 b6b60000
	ldda	[%i6+%o4]0x88,%f14	! %f14 = 000000fb 00000000
!	Starting 10 instruction Store Burst
!	Mem[0000000010001410] = f4000000, %l4 = 000000004c82db1d
	swapa	[%i0+%o5]0x88,%l4	! %l4 = 00000000f4000000

p0_label_188:
!	%l7 = ffffffffffffffe6, Mem[0000000010041410] = ff00ff0000050000
	stxa	%l7,[%i1+%o5]0x80	! Mem[0000000010041410] = ffffffffffffffe6
	membar	#Sync			! Added by membar checker (34)
!	%l3 = 00000000000000ff, Mem[0000000030001410] = d000000097e60f13
	stxa	%l3,[%i0+%o5]0x81	! Mem[0000000030001410] = 00000000000000ff
!	%l7 = ffffffffffffffe6, Mem[00000000300c1400] = ff000000
	stha	%l7,[%i3+%g0]0x81	! Mem[00000000300c1400] = ffe60000
!	Mem[0000000030141400] = 00000000, %l4 = 00000000f4000000
	ldstuba	[%i5+%g0]0x81,%l4	! %l4 = 00000000000000ff
!	%l1 = 0000000000000000, Mem[0000000010001400] = ff00000000000000
	stxa	%l1,[%i0+%g0]0x80	! Mem[0000000010001400] = 0000000000000000
!	%f12 = d0000000 97e60f13, Mem[0000000010081430] = f47cffff 00000000
	stda	%f12,[%i2+0x030]%asi	! Mem[0000000010081430] = d0000000 97e60f13
!	%f12 = d0000000 97e60f13, %l6 = 000000ffc8ff59ff
!	Mem[0000000030101408] = 0000ff0000000000
	add	%i4,0x008,%g1
	stda	%f12,[%g1+%l6]ASI_PST32_S ! Mem[0000000030101408] = d000000097e60f13
!	Mem[0000000030101400] = ff000000, %l1 = 0000000000000000
	ldstuba	[%i4+%g0]0x89,%l1	! %l1 = 00000000000000ff
!	%l0 = 00610000, %l1 = 00000000, Mem[0000000010081400] = 000000ff 130fe697
	stda	%l0,[%i2+%g0]0x88	! Mem[0000000010081400] = 00610000 00000000
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = 00000000 00000000, %l6 = c8ff59ff, %l7 = ffffffe6
	ldda	[%i3+%o5]0x89,%l6	! %l6 = 0000000000000000 0000000000000000

p0_label_189:
!	Mem[00000000100c1400] = ff000000, %f6  = e0e3fff9
	lda	[%i3+%g0]0x80,%f6 	! %f6 = ff000000
!	Mem[0000000030001400] = 000000d0, %l6 = 0000000000000000
	ldswa	[%i0+%g0]0x89,%l6	! %l6 = 00000000000000d0
!	Mem[0000000010141408] = a89537ff, %f24 = e3d6eb97
	lda	[%i5+%o4]0x80,%f24	! %f24 = a89537ff
!	Mem[00000000100c1424] = 03eb00ff, %l3 = 00000000000000ff
	lduba	[%i3+0x025]%asi,%l3	! %l3 = 00000000000000eb
!	Mem[0000000030081400] = 00000000 00000000, %l6 = 000000d0, %l7 = 00000000
	ldda	[%i2+%g0]0x89,%l6	! %l6 = 0000000000000000 0000000000000000
!	Mem[0000000030041408] = 00000000 97e60f00, %l4 = 00000000, %l5 = f6f796ed
	ldda	[%i1+%o4]0x89,%l4	! %l4 = 0000000097e60f00 0000000000000000
!	Mem[0000000030041410] = ff000000, %l3 = 00000000000000eb
	ldsha	[%i1+%o5]0x89,%l3	! %l3 = 0000000000000000
!	Mem[00000000100c1408] = 00000000, %l2 = b5c330f200000000
	ldub	[%i3+0x00b],%l2		! %l2 = 0000000000000000
!	Mem[0000000010141400] = 00000000 00006100, %l6 = 00000000, %l7 = 00000000
	ldda	[%i5+%g0]0x88,%l6	! %l6 = 0000000000006100 0000000000000000
!	Starting 10 instruction Store Burst
!	Mem[0000000030001410] = 00000000, %l7 = 0000000000000000
	ldstuba	[%i0+%o5]0x81,%l7	! %l7 = 00000000000000ff

p0_label_190:
!	Mem[0000000020800041] = ff00e25a, %l6 = 0000000000006100
	ldstub	[%o1+0x041],%l6		! %l6 = 00000000000000ff
!	%l2 = 0000000000000000, Mem[0000000010101408] = a00000ff
	stwa	%l2,[%i4+%o4]0x80	! Mem[0000000010101408] = 00000000
!	%f26 = 5a2bbe67, Mem[0000000030181408] = c8ff59ff
	sta	%f26,[%i6+%o4]0x89	! Mem[0000000030181408] = 5a2bbe67
!	%f17 = 00000000, Mem[0000000010081408] = c81a00f4
	sta	%f17,[%i2+%o4]0x88	! Mem[0000000010081408] = 00000000
!	%l4 = 0000000097e60f00, Mem[0000000010141408] = ff3795a8
	stha	%l4,[%i5+%o4]0x88	! Mem[0000000010141408] = ff370f00
!	%l7 = 0000000000000000, Mem[0000000030081410] = 000359a4
	stha	%l7,[%i2+%o5]0x89	! Mem[0000000030081410] = 00030000
!	%l4 = 0000000097e60f00, Mem[0000000030081410] = e0e3fff900030000
	stxa	%l4,[%i2+%o5]0x89	! Mem[0000000030081410] = 0000000097e60f00
!	%l2 = 00000000, %l3 = 00000000, Mem[00000000100c1410] = a8950600 00000000
	stda	%l2,[%i3+%o5]0x80	! Mem[00000000100c1410] = 00000000 00000000
!	%l4 = 0000000097e60f00, Mem[0000000030001400] = d0000000
	stha	%l4,[%i0+%g0]0x81	! Mem[0000000030001400] = 0f000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030101410] = ff3795a8, %l4 = 0000000097e60f00
	lduba	[%i4+%o5]0x89,%l4	! %l4 = 00000000000000a8

!	Check Point 38 for processor 0

	set	p0_check_pt_data_38,%g4
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
	cmp	%l3,%g2			! %l3 = 0000000000000000
	bne	%xcc,p0_reg_check_fail3
	mov	0xee3,%g1
	ldx	[%g4+0x20],%g2
	cmp	%l4,%g2			! %l4 = 00000000000000a8
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
	cmp	%l7,%g2			! %l7 = 0000000000000000
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x40],%g3
	std	%f0,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f0 = 000000ff e5022705
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x48],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 8a000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x50],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = ff000000 000359a4
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x58],%g3
	std	%f14,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f14 = 000000fb 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf14,%g1
	ldx	[%g4+0x60],%g3
	std	%f16,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f16 = d0000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf16,%g1
	ldx	[%g4+0x68],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = 052702e5 ff000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1
	ldx	[%g4+0x70],%g3
	std	%f20,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f20 = d0000000 97e60f13
	bne	%xcc,p0_freg_check_fail
	mov	0xf20,%g1
	ldx	[%g4+0x78],%g3
	std	%f22,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f22 = 007bbbbd 835e80db
	bne	%xcc,p0_freg_check_fail
	mov	0xf22,%g1
	ldx	[%g4+0x80],%g3
	std	%f24,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f24 = a89537ff 6685ec48
	bne	%xcc,p0_freg_check_fail
	mov	0xf24,%g1
	ldx	[%g4+0x88],%g3
	std	%f26,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f26 = 5a2bbe67 67be2b5a
	bne	%xcc,p0_freg_check_fail
	mov	0xf26,%g1
	ldx	[%g4+0x90],%g3
	std	%f28,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f28 = 3f2cb25d 3e2dee16
	bne	%xcc,p0_freg_check_fail
	mov	0xf28,%g1
	ldx	[%g4+0x98],%g3
	std	%f30,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f30 = 22873e41 0bc8eac7
	bne	%xcc,p0_freg_check_fail
	mov	0xf30,%g1

!	Check Point 38 completed


p0_label_191:
!	Mem[0000000030081410] = 00000000 97e60f00, %l6 = 00000000, %l7 = 00000000
	ldda	[%i2+%o5]0x89,%l6	! %l6 = 0000000097e60f00 0000000000000000
!	Mem[00000000100c1410] = 00000000, %f2  = 8a000000
	ld	[%i3+%o5],%f2 	! %f2 = 00000000
!	Mem[0000000010081410] = ffff8a00 ffffffff, %l2 = 00000000, %l3 = 00000000
	ldda	[%i2+%o5]0x80,%l2	! %l2 = 00000000ffff8a00 00000000ffffffff
!	Mem[00000000211c0000] = ffffb5d7, %l5 = 0000000000000000
	ldub	[%o2+0x001],%l5		! %l5 = 00000000000000ff
!	Mem[0000000010141400] = 00006100, %l4 = 00000000000000a8
	ldsba	[%i5+%g0]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000010141414] = 00000026, %l4 = 0000000000000000
	ldub	[%i5+0x016],%l4		! %l4 = 0000000000000000
!	Mem[0000000030081410] = 000fe697, %l0 = 0000000000610000
	ldsba	[%i2+%o5]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000010101410] = ff3795a8, %f11 = 00610000
	lda	[%i4+%o5]0x88,%f11	! %f11 = ff3795a8
!	Mem[0000000010181410] = 00000000, %l3 = 00000000ffffffff
	ldsha	[%i6+%o5]0x80,%l3	! %l3 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l1 = 0000000000000000, Mem[00000000300c1408] = ff000000
	stwa	%l1,[%i3+%o4]0x89	! Mem[00000000300c1408] = 00000000

p0_label_192:
!	Mem[00000000300c1408] = 00000000, %l6 = 0000000097e60f00
	swapa	[%i3+%o4]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000010001410] = 4c82db1d, %l1 = 0000000000000000
	lduba	[%i0+%o5]0x88,%l1	! %l1 = 000000000000001d
!	Mem[0000000010141410] = ff591ac8, %l6 = 0000000000000000
	ldstuba	[%i5+%o5]0x80,%l6	! %l6 = 000000ff000000ff
!	%l3 = 0000000000000000, Mem[00000000300c1410] = 0000000000000000
	stxa	%l3,[%i3+%o5]0x89	! Mem[00000000300c1410] = 0000000000000000
!	Mem[00000000201c0001] = ffff9b8f, %l7 = 0000000000000000
	ldstuba	[%o0+0x001]%asi,%l7	! %l7 = 000000ff000000ff
!	Mem[0000000010041434] = d2c78255, %l3 = 0000000000000000
	swap	[%i1+0x034],%l3		! %l3 = 00000000d2c78255
!	Mem[0000000010041408] = 0000004c, %l7 = 000000ff, %l3 = d2c78255
	add	%i1,0x08,%g1
	casa	[%g1]0x80,%l7,%l3	! %l3 = 000000000000004c
!	%l4 = 0000000000000000, Mem[0000000010001410] = 4c82db1d
	stha	%l4,[%i0+%o5]0x88	! Mem[0000000010001410] = 4c820000
!	%l6 = 000000ff, %l7 = 000000ff, Mem[0000000010081400] = 00610000 00000000
	stda	%l6,[%i2+%g0]0x88	! Mem[0000000010081400] = 000000ff 000000ff
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = 00000000, %l3 = 000000000000004c
	lduwa	[%i0+%g0]0x88,%l3	! %l3 = 0000000000000000

p0_label_193:
!	Mem[0000000010001410] = 0000824c, %l0 = 0000000000000000
	ldsba	[%i0+%o5]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000010081418] = ff6b0000, %l1 = 000000000000001d
	ldsha	[%i2+0x018]%asi,%l1	! %l1 = ffffffffffffff6b
!	Mem[0000000030081408] = c8ff59ff, %l5 = 00000000000000ff
	lduha	[%i2+%o4]0x89,%l5	! %l5 = 00000000000059ff
!	Mem[0000000030101400] = ffff7cff ff0000ff, %l0 = 00000000, %l1 = ffffff6b
	ldda	[%i4+%g0]0x89,%l0	! %l0 = 00000000ff0000ff 00000000ffff7cff
!	Mem[0000000020800000] = ffff7fc1, %l2 = 00000000ffff8a00
	ldsh	[%o1+%g0],%l2		! %l2 = ffffffffffffffff
!	Mem[0000000030101400] = ff0000ff ff7cffff, %l0 = ff0000ff, %l1 = ffff7cff
	ldda	[%i4+%g0]0x81,%l0	! %l0 = 00000000ff0000ff 00000000ff7cffff
!	Mem[0000000010081408] = ff00000000000000, %l5 = 00000000000059ff
	ldxa	[%i2+%o4]0x88,%l5	! %l5 = ff00000000000000
!	Mem[0000000030181408] = 5a2bbe67, %l1 = 00000000ff7cffff
	lduwa	[%i6+%o4]0x89,%l1	! %l1 = 000000005a2bbe67
!	Mem[0000000010041408] = 0000004c, %l3 = 0000000000000000
	ldsha	[%i1+%o4]0x80,%l3	! %l3 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%l2 = ffffffffffffffff, Mem[0000000030081410] = 97e60f00
	stwa	%l2,[%i2+%o5]0x89	! Mem[0000000030081410] = ffffffff

p0_label_194:
!	Mem[0000000030101400] = ff0000ff, %l6 = 00000000000000ff
	ldstuba	[%i4+%g0]0x89,%l6	! %l6 = 000000ff000000ff
!	Mem[00000000300c1408] = 97e60f00, %l0 = 00000000ff0000ff
	ldstuba	[%i3+%o4]0x89,%l0	! %l0 = 00000000000000ff
!	%l7 = 00000000000000ff, Mem[0000000021800101] = ff3e4a7a
	stb	%l7,[%o3+0x101]		! Mem[0000000021800100] = ffff4a7a
!	Mem[0000000010081424] = 000000ff, %l3 = 00000000, %l6 = 000000ff
	add	%i2,0x24,%g1
	casa	[%g1]0x80,%l3,%l6	! %l6 = 00000000000000ff
!	%f5  = 00000000, Mem[0000000030001410] = 000000ff
	sta	%f5 ,[%i0+%o5]0x89	! Mem[0000000030001410] = 00000000
!	%l2 = ffffffffffffffff, Mem[0000000030081410] = ffffffff
	stwa	%l2,[%i2+%o5]0x89	! Mem[0000000030081410] = ffffffff
!	%l2 = ffffffffffffffff, Mem[0000000010041400] = 1ddb824c
	stha	%l2,[%i1+%g0]0x88	! Mem[0000000010041400] = 1ddbffff
!	Mem[0000000010141408] = 000f37ff, %l6 = 00000000000000ff
	swapa	[%i5+%o4]0x80,%l6	! %l6 = 00000000000f37ff
!	%l2 = ffffffffffffffff, Mem[0000000030081410] = ffffffff
	stwa	%l2,[%i2+%o5]0x81	! Mem[0000000030081410] = ffffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000030001400] = 00000000 0000000f, %l6 = 000f37ff, %l7 = 000000ff
	ldda	[%i0+%g0]0x89,%l6	! %l6 = 000000000000000f 0000000000000000

p0_label_195:
!	Mem[0000000010141400] = 0000000000006100, %l2 = ffffffffffffffff
	ldxa	[%i5+%g0]0x88,%l2	! %l2 = 0000000000006100
!	Mem[00000000300c1410] = 0000000000000000, %l6 = 000000000000000f
	ldxa	[%i3+%o5]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000010101410] = ffffffff ff3795a8, %l0 = 00000000, %l1 = 5a2bbe67
	ldda	[%i4+%o5]0x88,%l0	! %l0 = 00000000ff3795a8 00000000ffffffff
!	Mem[00000000100c1428] = 00006100, %l6 = 0000000000000000
	ldswa	[%i3+0x028]%asi,%l6	! %l6 = 0000000000006100
!	Mem[00000000300c1410] = 00000000, %l6 = 0000000000006100
	lduha	[%i3+%o5]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000020800000] = ffff7fc1, %l6 = 0000000000000000
	ldub	[%o1+0x001],%l6		! %l6 = 00000000000000ff
!	Mem[0000000010181410] = 00000000, %l0 = 00000000ff3795a8
	lduha	[%i6+%o5]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000010181428] = f4000000, %l0 = 0000000000000000
	lduwa	[%i6+0x028]%asi,%l0	! %l0 = 00000000f4000000
!	Mem[0000000010041408] = 0000004c, %l5 = ff00000000000000
	lduba	[%i1+%o4]0x80,%l5	! %l5 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f25 = 6685ec48, Mem[0000000010041408] = 0000004c
	sta	%f25,[%i1+%o4]0x80	! Mem[0000000010041408] = 6685ec48

!	Check Point 39 for processor 0

	set	p0_check_pt_data_39,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 00000000f4000000
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 00000000ffffffff
	bne	%xcc,p0_reg_check_fail1
	mov	0xee1,%g1
	ldx	[%g4+0x18],%g2
	cmp	%l2,%g2			! %l2 = 0000000000006100
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
	cmp	%g3,%g2			! %f0 = 000000ff e5022705
	bne	%xcc,p0_freg_check_fail
	mov	0xf00,%g1
	ldx	[%g4+0x50],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = 00000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x58],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = ff000000 000359a4
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x60],%g3
	std	%f10,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f10 = f230c3b5 ff3795a8
	bne	%xcc,p0_freg_check_fail
	mov	0xf10,%g1

!	Check Point 39 completed


p0_label_196:
!	Mem[0000000030101410] = a89537ff, %l3 = 0000000000000000
	ldstuba	[%i4+%o5]0x81,%l3	! %l3 = 000000a8000000ff
!	%l1 = 00000000ffffffff, Mem[00000000100c1410] = 00000000
	stba	%l1,[%i3+%o5]0x80	! Mem[00000000100c1410] = ff000000
!	Mem[0000000030181410] = ff000000, %l1 = 00000000ffffffff
	swapa	[%i6+%o5]0x81,%l1	! %l1 = 00000000ff000000
!	Mem[00000000100c1408] = 00000000, %l2 = 0000000000006100
	ldstuba	[%i3+%o4]0x88,%l2	! %l2 = 00000000000000ff
!	%f30 = 22873e41 0bc8eac7, Mem[00000000300c1400] = ffe60000 c8ff59ff
	stda	%f30,[%i3+%g0]0x81	! Mem[00000000300c1400] = 22873e41 0bc8eac7
!	Mem[0000000030181408] = 67be2b5a, %l5 = 0000000000000000
	ldstuba	[%i6+%o4]0x81,%l5	! %l5 = 00000067000000ff
!	Mem[0000000030081410] = ffffffff, %l2 = 0000000000000000
	swapa	[%i2+%o5]0x81,%l2	! %l2 = 00000000ffffffff
!	Mem[0000000030181410] = ffffffff, %l6 = 00000000000000ff
	swapa	[%i6+%o5]0x81,%l6	! %l6 = 00000000ffffffff
!	Mem[0000000030141408] = 4c000000, %l7 = 0000000000000000
	swapa	[%i5+%o4]0x81,%l7	! %l7 = 000000004c000000
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = 000000d0, %l0 = 00000000f4000000
	lduwa	[%i4+%o4]0x89,%l0	! %l0 = 00000000000000d0

p0_label_197:
!	Mem[0000000020800040] = ffffe25a, %l4 = 0000000000000000
	ldsba	[%o1+0x041]%asi,%l4	! %l4 = ffffffffffffffff
!	Mem[00000000211c0000] = ffffb5d7, %l3 = 00000000000000a8
	ldsh	[%o2+%g0],%l3		! %l3 = ffffffffffffffff
!	Mem[0000000010001420] = 8a00000000000000, %f12 = d0000000 97e60f13
	ldda	[%i0+0x020]%asi,%f12	! %f12 = 8a000000 00000000
!	Mem[0000000010181420] = 004c0000, %l0 = 00000000000000d0
	lduwa	[%i6+0x020]%asi,%l0	! %l0 = 00000000004c0000
!	Mem[00000000300c1410] = 00000000 00000000, %l6 = ffffffff, %l7 = 4c000000
	ldda	[%i3+%o5]0x89,%l6	! %l6 = 0000000000000000 0000000000000000
!	Mem[0000000030181400] = 4c82dbff, %l2 = 00000000ffffffff
	ldsba	[%i6+%g0]0x89,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000010141438] = 00000000ff0000d0, %f18 = 052702e5 ff000000
	ldd	[%i5+0x038],%f18	! %f18 = 00000000 ff0000d0
!	Mem[0000000030041408] = 000fe697, %l7 = 0000000000000000
	lduha	[%i1+%o4]0x81,%l7	! %l7 = 000000000000000f
!	Mem[0000000030001400] = 0000000f, %l6 = 0000000000000000
	lduba	[%i0+%g0]0x89,%l6	! %l6 = 000000000000000f
!	Starting 10 instruction Store Burst
!	Mem[000000001000140c] = 00000000, %l2 = ffffffffffffffff
	swap	[%i0+0x00c],%l2		! %l2 = 0000000000000000

p0_label_198:
!	Mem[0000000010001410] = 0000824c, %l7 = 000000000000000f
	ldstuba	[%i0+%o5]0x80,%l7	! %l7 = 00000000000000ff
!	%f28 = 3f2cb25d 3e2dee16, %l4 = ffffffffffffffff
!	Mem[0000000010101420] = e3d600ff6685ec48
	add	%i4,0x020,%g1
	stda	%f28,[%g1+%l4]ASI_PST8_PL ! Mem[0000000010101420] = 16ee2d3e5db22c3f
!	Mem[000000001018141c] = c511d0b3, %l6 = 000000000000000f
	ldstuba	[%i6+0x01c]%asi,%l6	! %l6 = 000000c5000000ff
!	Mem[0000000010041408] = 48ec8566, %l3 = ffffffffffffffff
	swapa	[%i1+%o4]0x88,%l3	! %l3 = 0000000048ec8566
!	%l2 = 00000000, %l3 = 48ec8566, Mem[0000000010001410] = 4c8200ff 0000ffff
	stda	%l2,[%i0+%o5]0x88	! Mem[0000000010001410] = 00000000 48ec8566
!	%f0  = 000000ff e5022705 00000000 00000000
!	%f4  = 8a000000 00000000 ff000000 000359a4
!	%f8  = ff59ffc8 6600ec00 f230c3b5 ff3795a8
!	%f12 = 8a000000 00000000 000000fb 00000000
	stda	%f0,[%i3]ASI_COMMIT_S	! Block Store to 00000000300c1400
!	%l0 = 00000000004c0000, Mem[0000000030041400] = 00000000
	stha	%l0,[%i1+%g0]0x89	! Mem[0000000030041400] = 00000000
!	%f22 = 007bbbbd 835e80db, %l3 = 0000000048ec8566
!	Mem[0000000030001418] = 007bbbbd835e80db
	add	%i0,0x018,%g1
	stda	%f22,[%g1+%l3]ASI_PST16_S ! Mem[0000000030001418] = 007bbbbd835e80db
!	%l4 = ffffffff, %l5 = 00000067, Mem[0000000010181400] = 000000fb ff000000
	stda	%l4,[%i6+%g0]0x88	! Mem[0000000010181400] = ffffffff 00000067
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (35)
!	Mem[00000000300c1410] = 8a00000000000000, %l2 = 0000000000000000
	ldxa	[%i3+%o5]0x81,%l2	! %l2 = 8a00000000000000

p0_label_199:
!	Mem[0000000010181408] = 00000000, %f2  = 00000000
	lda	[%i6+%o4]0x80,%f2 	! %f2 = 00000000
!	Mem[00000000100c1410] = ff000000, %l3 = 0000000048ec8566
	lduha	[%i3+%o5]0x80,%l3	! %l3 = 000000000000ff00
!	Mem[0000000021800040] = ff8a9ae4, %l1 = 00000000ff000000
	lduh	[%o3+0x040],%l1		! %l1 = 000000000000ff8a
!	Mem[0000000010181408] = 000000fb00000000, %f6  = ff000000 000359a4
	ldda	[%i6+%o4]0x88,%f6 	! %f6  = 000000fb 00000000
!	Mem[0000000030141408] = 00000000000000ff, %l7 = 0000000000000000
	ldxa	[%i5+%o4]0x81,%l7	! %l7 = 00000000000000ff
!	Mem[00000000211c0000] = ffffb5d7, %l0 = 00000000004c0000
	lduh	[%o2+%g0],%l0		! %l0 = 000000000000ffff
!	Mem[0000000030141410] = ffc0ffff f2000000, %l4 = ffffffff, %l5 = 00000067
	ldda	[%i5+%o5]0x81,%l4	! %l4 = 00000000ffc0ffff 00000000f2000000
!	Mem[0000000030141410] = ffc0ffff, %l6 = 00000000000000c5
	ldsba	[%i5+%o5]0x81,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010181408] = 00000000, %l2 = 8a00000000000000
	ldsha	[%i6+%o4]0x80,%l2	! %l2 = 0000000000000000
!	Starting 10 instruction Store Burst
!	%f30 = 22873e41 0bc8eac7, %l2 = 0000000000000000
!	Mem[0000000010101430] = ffffffffff3795a8
	add	%i4,0x030,%g1
	stda	%f30,[%g1+%l2]ASI_PST32_PL ! Mem[0000000010101430] = ffffffffff3795a8

p0_label_200:
!	%l1 = 000000000000ff8a, Mem[0000000010101410] = a89537ff
	stba	%l1,[%i4+%o5]0x80	! Mem[0000000010101410] = 8a9537ff
!	%f13 = 00000000, Mem[0000000010141408] = ff000000
	sta	%f13,[%i5+%o4]0x88	! Mem[0000000010141408] = 00000000
!	%l3 = 000000000000ff00, Mem[0000000010181400] = ffffffff
	stha	%l3,[%i6+%g0]0x88	! Mem[0000000010181400] = ffffff00
!	Mem[00000000211c0001] = ffffb5d7, %l5 = 00000000f2000000
	ldstuba	[%o2+0x001]%asi,%l5	! %l5 = 000000ff000000ff
!	%l0 = 000000000000ffff, Mem[0000000010081408] = 00000000
	stha	%l0,[%i2+%o4]0x80	! Mem[0000000010081408] = ffff0000
!	%l1 = 000000000000ff8a, Mem[0000000010081410] = ffff8a00
	stba	%l1,[%i2+%o5]0x80	! Mem[0000000010081410] = 8aff8a00
!	%l7 = 00000000000000ff, Mem[0000000010041400] = ffffdb1d
	stba	%l7,[%i1+%g0]0x80	! Mem[0000000010041400] = ffffdb1d
!	%f14 = 000000fb, Mem[0000000010001408] = ffc0ffff
	sta	%f14,[%i0+%o4]0x88	! Mem[0000000010001408] = 000000fb
!	Mem[0000000010181400] = 00ffffff, %l0 = 0000ffff, %l5 = 000000ff
	casa	[%i6]0x80,%l0,%l5	! %l5 = 0000000000ffffff
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = ffffffff, %l3 = 000000000000ff00
	ldsha	[%i1+%o5]0x80,%l3	! %l3 = ffffffffffffffff

!	Check Point 40 for processor 0

	set	p0_check_pt_data_40,%g4
	rd	%ccr,%g5		! %g5 = 44
	ldx	[%g4+0x08],%g2
	cmp	%l0,%g2			! %l0 = 000000000000ffff
	bne	%xcc,p0_reg_check_fail0
	mov	0xee0,%g1
	ldx	[%g4+0x10],%g2
	cmp	%l1,%g2			! %l1 = 000000000000ff8a
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
	cmp	%l4,%g2			! %l4 = 00000000ffc0ffff
	bne	%xcc,p0_reg_check_fail4
	mov	0xee4,%g1
	ldx	[%g4+0x30],%g2
	cmp	%l5,%g2			! %l5 = 0000000000ffffff
	bne	%xcc,p0_reg_check_fail5
	mov	0xee5,%g1
	ldx	[%g4+0x38],%g2
	cmp	%l6,%g2			! %l6 = ffffffffffffffff
	bne	%xcc,p0_reg_check_fail6
	mov	0xee6,%g1
	ldx	[%g4+0x40],%g2
	cmp	%l7,%g2			! %l7 = 00000000000000ff
	bne	%xcc,p0_reg_check_fail7
	mov	0xee7,%g1
	ldx	[%g4+0x48],%g3
	std	%f2,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f2 = 00000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf02,%g1
	ldx	[%g4+0x50],%g3
	std	%f4,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f4 = 8a000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf04,%g1
	ldx	[%g4+0x58],%g3
	std	%f6,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f6 = 000000fb 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf06,%g1
	ldx	[%g4+0x60],%g3
	std	%f12,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f12 = 8a000000 00000000
	bne	%xcc,p0_freg_check_fail
	mov	0xf12,%g1
	ldx	[%g4+0x68],%g3
	std	%f18,[%g4]
	ldx	[%g4],%g2
	cmp	%g3,%g2			! %f18 = 00000000 ff0000d0
	bne	%xcc,p0_freg_check_fail
	mov	0xf18,%g1

!	Check Point 40 completed


	ba,a	p0_not_taken_0_end
p0_not_taken_0:
!	The following code should not be executed
	stda	%l6,[%i0+0x020]%asi
	nop
	ldsba	[%i6+0x01e]%asi,%l3
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
	add	%l7,0x671,%l4
	swapa	[%i3+%o4]ASI_AS_IF_USER_PRIMARY,%l5	! Mem[00000000100c1408]
	udivx	%l3,-0x15f,%l0
	or	%l0,%l7,%l3
	done

p0_trap1o:
	add	%l7,0x671,%l4
	swapa	[%o3+%i4]ASI_AS_IF_USER_PRIMARY,%l5	! Mem[00000000100c1408]
	udivx	%l3,-0x15f,%l0
	or	%l0,%l7,%l3
	done


p0_trap2e:
	ldstuba	[%i0+%g0]ASI_AS_IF_USER_PRIMARY,%l0	! Mem[0000000010001400]
	mulx	%l1,%l0,%l4
	done

p0_trap2o:
	ldstuba	[%o0+%g0]ASI_AS_IF_USER_PRIMARY,%l0	! Mem[0000000010001400]
	mulx	%l1,%l0,%l4
	done


p0_trap3e:
	sub	%l7,0xc41,%l3
	add	%l4,%l5,%l1
	andn	%l0,%l0,%l4
	and	%l2,%l4,%l5
	and	%l7,-0xcf7,%l5
	subc	%l1,-0xd80,%l4
	orn	%l6,-0xff6,%l0
	done

p0_trap3o:
	sub	%l7,0xc41,%l3
	add	%l4,%l5,%l1
	andn	%l0,%l0,%l4
	and	%l2,%l4,%l5
	and	%l7,-0xcf7,%l5
	subc	%l1,-0xd80,%l4
	orn	%l6,-0xff6,%l0
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
	ldx	[%g1+0x000],%l0		! %l0 = 3d9b2f6fe67d95db
	ldx	[%g1+0x008],%l1		! %l1 = cf44ab82a54854c0
	ldx	[%g1+0x010],%l2		! %l2 = 1d697016691ccadf
	ldx	[%g1+0x018],%l3		! %l3 = 2838fa4e274f4671
	ldx	[%g1+0x020],%l4		! %l4 = 208572882404f430
	ldx	[%g1+0x028],%l5		! %l5 = e29ca9bc93f1603a
	ldx	[%g1+0x030],%l6		! %l6 = c76d6721ed06b274
	ldx	[%g1+0x038],%l7		! %l7 = b716d14a6fc1097c

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
	st	%f0 ,[%i1+0x02c]	! Mem[000000001004142c]
	jmpl	%o7,%g0
	nop
p0_near_0_he:
	sdivx	%l0,0x980,%l3
	ldsb	[%i2+0x036],%l5		! Mem[0000000010081436]
	swap	[%i5+0x024],%l5		! Mem[0000000010141424]
	lduh	[%i0+0x03e],%l1		! Mem[000000001000143e]
	addc	%l2,-0xc2b,%l5
	jmpl	%o7,%g0
	add	%l5,0x4a2,%l5
near0_b2b_h:
	xnor	%l6,-0xd62,%l3
	jmpl	%o7,%g0
	nop
near0_b2b_l:
	or	%l2,-0x87a,%l0
	jmpl	%o7,%g0
	addc	%l1,-0x640,%l1
user_near0_end:
	.seg	"text"
	.align	0x2000
user_near1_start:
p0_near_1_le:
	stb	%l2,[%i1+0x03a]		! Mem[000000001004143a]
	lduh	[%i1+0x032],%l3		! Mem[0000000010041432]
	ldx	[%i5+0x018],%l1		! Mem[0000000010141418]
	add	%l5,0x2d6,%l4
	mulx	%l6,%l4,%l5
	jmpl	%o7,%g0
	nop
p0_near_1_he:
	and	%l6,%l3,%l6
	ld	[%i0+0x038],%f30	! Mem[0000000010001438]
	ldx	[%i6+0x018],%l1		! Mem[0000000010181418]
	xnor	%l7,-0xd75,%l5
	xnor	%l4,0x59e,%l7
	stw	%l6,[%i1+0x018]		! Mem[0000000010041418]
	std	%f30,[%i4+0x038]	! Mem[0000000010101438]
	jmpl	%o7,%g0
	lduw	[%i0+0x018],%l3		! Mem[0000000010001418]
near1_b2b_h:
	orn	%l4,-0xb8e,%l4
	add	%l0,%l5,%l6
	andn	%l6,-0x97f,%l2
	sdivx	%l4,-0xf91,%l6
	sdivx	%l7,-0xa84,%l7
	nop
	sub	%l4,0x653,%l5
	jmpl	%o7,%g0
	sdivx	%l1,-0x0fa,%l5
near1_b2b_l:
	add	%l6,0x2b6,%l2
	subc	%l2,%l3,%l4
	andn	%l2,-0x430,%l2
	sdivx	%l3,%l0,%l0
	addc	%l4,%l6,%l3
	orn	%l3,-0xdef,%l2
	xor	%l4,%l2,%l5
	jmpl	%o7,%g0
	smul	%l5,%l4,%l3
user_near1_end:
	.seg	"text"
	.align	0x2000
user_near2_start:
p0_near_2_le:
	sdivx	%l3,%l3,%l3
	mulx	%l1,0xe06,%l2
	jmpl	%o7,%g0
	std	%l0,[%i6+0x000]		! Mem[0000000010181400]
p0_near_2_he:
	nop
	stx	%l2,[%i6+0x018]		! Mem[0000000010181418]
	jmpl	%o7,%g0
	andn	%l5,-0xe33,%l3
near2_b2b_h:
	xnor	%l3,0x3e2,%l2
	umul	%l0,-0x8a0,%l6
	jmpl	%o7,%g0
	nop
near2_b2b_l:
	xor	%l1,%l1,%l2
	xor	%l7,0xa4a,%l4
	jmpl	%o7,%g0
	orn	%l3,-0x080,%l4
user_near2_end:
	.seg	"text"
	.align	0x2000
user_near3_start:
p0_near_3_le:
	ldd	[%i0+0x030],%l0		! Mem[0000000010001430]
	ldsh	[%i6+0x020],%l3		! Mem[0000000010181420]
	xnor	%l0,%l0,%l7
	swap	[%i0+0x018],%l1		! Mem[0000000010001418]
	nop
	jmpl	%o7,%g0
	st	%f13,[%i1+0x004]	! Mem[0000000010041404]
p0_near_3_he:
	jmpl	%o7,%g0
	ldsb	[%i6+0x03c],%l4		! Mem[000000001018143c]
	jmpl	%o7,%g0
	nop
near3_b2b_h:
	smul	%l5,0x1b1,%l5
	xnor	%l7,-0xb40,%l4
	jmpl	%o7,%g0
	mulx	%l3,%l1,%l7
near3_b2b_l:
	add	%l5,0xfb9,%l4
	mulx	%l7,%l2,%l5
	jmpl	%o7,%g0
	nop
user_near3_end:
	.seg	"text"
	.text
	.align	0x2000
user_far0_start:
p0_far_0_le:
	ldsh	[%i1+0x020],%l4		! Mem[0000000010041420]
	udivx	%l5,%l2,%l0
	ldstub	[%o0+0x000],%l3		! Mem[00000000201c0000]
	ld	[%i4+0x034],%f0 	! Mem[0000000010101434]
	nop
	st	%f8 ,[%i2+0x00c]	! Mem[000000001008140c]
	jmpl	%o7,%g0
	addc	%l2,%l4,%l0
p0_far_0_lem:
	membar	#Sync
	ldsh	[%i1+0x020],%l4		! Mem[0000000010041420]
	udivx	%l5,%l2,%l0
	ldstub	[%o0+0x000],%l3		! Mem[00000000201c0000]
	ld	[%i4+0x034],%f0 	! Mem[0000000010101434]
	nop
	st	%f8 ,[%i2+0x00c]	! Mem[000000001008140c]
	jmpl	%o7,%g0
	addc	%l2,%l4,%l0
p0_far_0_he:
	umul	%l7,%l2,%l1
	mulx	%l5,%l7,%l5
	stw	%l5,[%i4+0x000]		! Mem[0000000010101400]
	sub	%l5,%l3,%l1
	sth	%l2,[%i4+0x018]		! Mem[0000000010101418]
	andn	%l2,%l6,%l3
	jmpl	%o7,%g0
	xnor	%l3,%l5,%l1
p0_far_0_hem:
	umul	%l7,%l2,%l1
	mulx	%l5,%l7,%l5
	membar	#Sync
	stw	%l5,[%i4+0x000]		! Mem[0000000010101400]
	sub	%l5,%l3,%l1
	sth	%l2,[%i4+0x018]		! Mem[0000000010101418]
	andn	%l2,%l6,%l3
	jmpl	%o7,%g0
	xnor	%l3,%l5,%l1
p0_loop_branch_0:
	jmpl	%o7+12,%g0
	add	%l0,1,%l0
far0_b2b_h:
	nop
	nop
	or	%l1,0xc25,%l1
	sdivx	%l1,-0x494,%l0
	add	%l4,%l6,%l2
	orn	%l2,%l1,%l5
	subc	%l7,%l1,%l6
	jmpl	%o7,%g0
	umul	%l7,%l4,%l6
far0_b2b_l:
	xor	%l2,-0x2ad,%l5
	umul	%l2,%l6,%l7
	add	%l3,%l0,%l4
	andn	%l6,%l0,%l4
	mulx	%l0,-0x68f,%l0
	orn	%l3,0xb8c,%l4
	addc	%l7,0x76d,%l3
	jmpl	%o7,%g0
	umul	%l0,%l6,%l2
user_far0_end:
	.seg	"text"
	.text
	.align	0x2000
user_far1_start:
p0_far_1_le:
	ldstub	[%o1+0x040],%l7		! Mem[0000000020800040]
	sub	%l1,-0x29f,%l6
	jmpl	%o7,%g0
	ldub	[%i3+0x02d],%l7		! Mem[00000000100c142d]
p0_far_1_lem:
	ldstub	[%o1+0x040],%l7		! Mem[0000000020800040]
	sub	%l1,-0x29f,%l6
	membar	#Sync
	jmpl	%o7,%g0
	ldub	[%i3+0x02d],%l7		! Mem[00000000100c142d]
p0_far_1_he:
	subc	%l2,0xaea,%l4
	andn	%l5,%l5,%l3
	std	%f20,[%i6+0x030]	! Mem[0000000010181430]
	add	%l1,-0xdde,%l5
	std	%l6,[%i0+0x028]		! Mem[0000000010001428]
	jmpl	%o7,%g0
	lduh	[%i6+0x02e],%l1		! Mem[000000001018142e]
p0_far_1_hem:
	subc	%l2,0xaea,%l4
	andn	%l5,%l5,%l3
	membar	#Sync
	std	%f20,[%i6+0x030]	! Mem[0000000010181430]
	add	%l1,-0xdde,%l5
	std	%l6,[%i0+0x028]		! Mem[0000000010001428]
	membar	#Sync
	jmpl	%o7,%g0
	lduh	[%i6+0x02e],%l1		! Mem[000000001018142e]
p0_loop_branch_1:
	jmpl	%o7+12,%g0
	add	%l0,2,%l0
far1_b2b_h:
	and	%l7,0x738,%l4
	xnor	%l2,%l3,%l1
	xor	%l3,%l0,%l5
	xor	%l0,%l4,%l1
	smul	%l6,%l1,%l6
	sub	%l3,0xca7,%l4
	jmpl	%o7,%g0
	orn	%l2,%l0,%l0
far1_b2b_l:
	udivx	%l4,%l0,%l0
	sub	%l4,%l1,%l4
	andn	%l3,0xf09,%l7
	smul	%l0,0x6fd,%l5
	xor	%l2,0x4dc,%l6
	udivx	%l3,%l2,%l5
	jmpl	%o7,%g0
	smul	%l5,%l4,%l0
user_far1_end:
	.seg	"text"
	.text
	.align	0x2000
user_far2_start:
p0_far_2_le:
	ld	[%i0+0x00c],%f8 	! Mem[000000001000140c]
	or	%l6,%l6,%l1
	or	%l0,-0xdb2,%l7
	swap	[%i1+0x000],%l2		! Mem[0000000010041400]
	orn	%l0,%l7,%l6
	jmpl	%o7,%g0
	lduw	[%i0+0x014],%l3		! Mem[0000000010001414]
p0_far_2_lem:
	membar	#Sync
	ld	[%i0+0x00c],%f8 	! Mem[000000001000140c]
	or	%l6,%l6,%l1
	or	%l0,-0xdb2,%l7
	swap	[%i1+0x000],%l2		! Mem[0000000010041400]
	orn	%l0,%l7,%l6
	membar	#Sync
	jmpl	%o7,%g0
	lduw	[%i0+0x014],%l3		! Mem[0000000010001414]
p0_far_2_he:
	addc	%l6,-0x100,%l3
	stw	%l1,[%i1+0x02c]		! Mem[000000001004142c]
	lduh	[%i6+0x01c],%l2		! Mem[000000001018141c]
	ldsh	[%i4+0x02a],%l0		! Mem[000000001010142a]
	ldub	[%i5+0x016],%l1		! Mem[0000000010141416]
	ldstub	[%o3+0x101],%l7		! Mem[0000000021800101]
	stx	%l0,[%i5+0x020]		! Mem[0000000010141420]
	jmpl	%o7,%g0
	stb	%l6,[%i5+0x023]		! Mem[0000000010141423]
p0_far_2_hem:
	addc	%l6,-0x100,%l3
	membar	#Sync
	stw	%l1,[%i1+0x02c]		! Mem[000000001004142c]
	lduh	[%i6+0x01c],%l2		! Mem[000000001018141c]
	ldsh	[%i4+0x02a],%l0		! Mem[000000001010142a]
	ldub	[%i5+0x016],%l1		! Mem[0000000010141416]
	ldstub	[%o3+0x101],%l7		! Mem[0000000021800101]
	stx	%l0,[%i5+0x020]		! Mem[0000000010141420]
	membar	#Sync
	jmpl	%o7,%g0
	stb	%l6,[%i5+0x023]		! Mem[0000000010141423]
p0_loop_branch_2:
	jmpl	%o7+12,%g0
	add	%l0,3,%l0
far2_b2b_h:
	subc	%l4,0xc90,%l6
	sub	%l6,0xf8c,%l4
	subc	%l5,%l0,%l7
	jmpl	%o7,%g0
	udivx	%l2,-0x6cd,%l1
far2_b2b_l:
	or	%l3,0x010,%l5
	or	%l2,%l4,%l3
	sub	%l3,-0x269,%l6
	jmpl	%o7,%g0
	orn	%l7,%l3,%l6
user_far2_end:
	.seg	"text"
	.text
	.align	0x2000
user_far3_start:
p0_far_3_le:
	udivx	%l3,-0x3ba,%l7
	ldd	[%i2+0x010],%l0		! Mem[0000000010081410]
	ldx	[%i2+0x010],%l2		! Mem[0000000010081410]
	sth	%l1,[%i5+0x02c]		! Mem[000000001014142c]
	jmpl	%o7,%g0
	subc	%l5,0x90c,%l2
p0_far_3_lem:
	udivx	%l3,-0x3ba,%l7
	membar	#Sync
	ldd	[%i2+0x010],%l0		! Mem[0000000010081410]
	ldx	[%i2+0x010],%l2		! Mem[0000000010081410]
	sth	%l1,[%i5+0x02c]		! Mem[000000001014142c]
	jmpl	%o7,%g0
	subc	%l5,0x90c,%l2
p0_far_3_he:
	ldsw	[%i4+0x03c],%l3		! Mem[000000001010143c]
	smul	%l5,%l0,%l2
	stw	%l1,[%i5+0x030]		! Mem[0000000010141430]
	ldsb	[%i4+0x00c],%l5		! Mem[000000001010140c]
	jmpl	%o7,%g0
	andn	%l6,-0x7c8,%l3
p0_far_3_hem:
	membar	#Sync
	ldsw	[%i4+0x03c],%l3		! Mem[000000001010143c]
	smul	%l5,%l0,%l2
	stw	%l1,[%i5+0x030]		! Mem[0000000010141430]
	ldsb	[%i4+0x00c],%l5		! Mem[000000001010140c]
	jmpl	%o7,%g0
	andn	%l6,-0x7c8,%l3
p0_loop_branch_3:
	jmpl	%o7+12,%g0
	add	%l0,4,%l0
far3_b2b_h:
	umul	%l7,0x175,%l3
	jmpl	%o7,%g0
	xnor	%l6,%l1,%l2
far3_b2b_l:
	andn	%l0,0xfb6,%l0
	jmpl	%o7,%g0
	addc	%l1,%l7,%l6
user_far3_end:
	.seg	"text"
	.align	0x2000
user_jump0_start:
	INIT_MEM(0, 0x0010, 1, +, 0, +, 0)
p0_jmpl_0_le:
	jmpl	%g6+8,%g0
	and	%l1,0x3f0,%l2
p0_call_0_le:
	ldsb	[%i5+0x001],%l4		! Mem[0000000010141401]
	xnor	%l5,-0xc7c,%l7
	add	%l0,0xd6a,%l5
	retl
	mulx	%l6,%l1,%l2
p0_jmpl_0_lo:
	jmpl	%g6+8,%g0
	and	%l1,0x3f0,%l2
p0_call_0_lo:
	ldsb	[%o5+0x001],%l4		! Mem[0000000010141401]
	xnor	%l5,-0xc7c,%l7
	add	%l0,0xd6a,%l5
	retl
	mulx	%l6,%l1,%l2
p0_jmpl_0_he:
	lduh	[%i0+0x008],%l5		! Mem[0000000010001408]
	ldub	[%i5+0x036],%l4		! Mem[0000000010141436]
	smul	%l1,%l2,%l6
	ldsb	[%i6+0x004],%l4		! Mem[0000000010181404]
	ldstub	[%i5+0x036],%l7		! Mem[0000000010141436]
	and	%l1,0xc32,%l4
	ldsh	[%i0+0x026],%l1		! Mem[0000000010001426]
	jmpl	%g6+8,%g0
	ldd	[%i4+0x008],%l2		! Mem[0000000010101408]
p0_call_0_he:
	addc	%l5,-0x438,%l1
	retl
	std	%f22,[%i2+0x030]	! Mem[0000000010081430]
p0_jmpl_0_ho:
	lduh	[%o0+0x008],%l5		! Mem[0000000010001408]
	ldub	[%o5+0x036],%l4		! Mem[0000000010141436]
	smul	%l1,%l2,%l6
	ldsb	[%o6+0x004],%l4		! Mem[0000000010181404]
	ldstub	[%o5+0x036],%l7		! Mem[0000000010141436]
	and	%l1,0xc32,%l4
	ldsh	[%o0+0x026],%l1		! Mem[0000000010001426]
	jmpl	%g6+8,%g0
	ldd	[%o4+0x008],%l2		! Mem[0000000010101408]
p0_call_0_ho:
	addc	%l5,-0x438,%l1
	retl
	std	%f22,[%o2+0x030]	! Mem[0000000010081430]
user_jump0_end:
	.seg	"text"
	.align	0x2000
user_jump1_start:
	INIT_MEM(0, 0x0020, 1, +, 0, +, 0)
p0_jmpl_1_le:
	mulx	%l7,%l4,%l0
	ldsw	[%i1+0x014],%l7		! Mem[0000000010041414]
	ldx	[%i2+0x028],%l7		! Mem[0000000010081428]
	ldsh	[%i0+0x02c],%l4		! Mem[000000001000142c]
	add	%l6,%l5,%l6
	or	%l6,-0x524,%l5
	jmpl	%g6+8,%g0
	lduw	[%i5+0x014],%l2		! Mem[0000000010141414]
p0_call_1_le:
	std	%l6,[%i5+0x008]		! Mem[0000000010141408]
	stx	%l2,[%i1+0x020]		! Mem[0000000010041420]
	ldsw	[%i6+0x028],%l1		! Mem[0000000010181428]
	subc	%l0,0x03c,%l5
	retl
	andn	%l0,%l0,%l6
p0_jmpl_1_lo:
	mulx	%l7,%l4,%l0
	ldsw	[%o1+0x014],%l7		! Mem[0000000010041414]
	ldx	[%o2+0x028],%l7		! Mem[0000000010081428]
	ldsh	[%o0+0x02c],%l4		! Mem[000000001000142c]
	add	%l6,%l5,%l6
	or	%l6,-0x524,%l5
	jmpl	%g6+8,%g0
	lduw	[%o5+0x014],%l2		! Mem[0000000010141414]
p0_call_1_lo:
	std	%l6,[%o5+0x008]		! Mem[0000000010141408]
	stx	%l2,[%o1+0x020]		! Mem[0000000010041420]
	ldsw	[%o6+0x028],%l1		! Mem[0000000010181428]
	subc	%l0,0x03c,%l5
	retl
	andn	%l0,%l0,%l6
p0_jmpl_1_he:
	ldd	[%i6+0x020],%l6		! Mem[0000000010181420]
	jmpl	%g6+8,%g0
	ldsh	[%i5+0x002],%l3		! Mem[0000000010141402]
p0_call_1_he:
	ldsh	[%i4+0x008],%l0		! Mem[0000000010101408]
	retl
	addc	%l6,%l2,%l7
p0_jmpl_1_ho:
	ldd	[%o6+0x020],%l6		! Mem[0000000010181420]
	jmpl	%g6+8,%g0
	ldsh	[%o5+0x002],%l3		! Mem[0000000010141402]
p0_call_1_ho:
	ldsh	[%o4+0x008],%l0		! Mem[0000000010101408]
	retl
	addc	%l6,%l2,%l7
user_jump1_end:
	.seg	"text"
	.align	0x2000
user_jump2_start:
	INIT_MEM(0, 0x0030, 1, +, 0, +, 0)
p0_jmpl_2_le:
	subc	%l4,%l5,%l2
	xnor	%l6,0xad3,%l5
	sth	%l4,[%i4+0x034]		! Mem[0000000010101434]
	xnor	%l3,-0xed7,%l3
	nop
	jmpl	%g6+8,%g0
	ldsb	[%i6+0x029],%l3		! Mem[0000000010181429]
p0_call_2_le:
	umul	%l0,0x683,%l3
	retl
	sth	%l5,[%i5+0x002]		! Mem[0000000010141402]
p0_jmpl_2_lo:
	subc	%l4,%l5,%l2
	xnor	%l6,0xad3,%l5
	sth	%l4,[%o4+0x034]		! Mem[0000000010101434]
	xnor	%l3,-0xed7,%l3
	nop
	jmpl	%g6+8,%g0
	ldsb	[%o6+0x029],%l3		! Mem[0000000010181429]
p0_call_2_lo:
	umul	%l0,0x683,%l3
	retl
	sth	%l5,[%o5+0x002]		! Mem[0000000010141402]
p0_jmpl_2_he:
	udivx	%l2,%l6,%l5
	std	%f16,[%i5+0x018]	! Mem[0000000010141418]
	ldstub	[%i5+0x02a],%l0		! Mem[000000001014142a]
	swap	[%i2+0x034],%l0		! Mem[0000000010081434]
	nop
	jmpl	%g6+8,%g0
	ldsh	[%i1+0x004],%l5		! Mem[0000000010041404]
p0_call_2_he:
	ldstub	[%o0+0x000],%l2		! Mem[00000000201c0000]
	and	%l5,-0x9d3,%l6
	umul	%l7,0xd07,%l1
	sth	%l0,[%i2+0x02c]		! Mem[000000001008142c]
	retl
	andn	%l7,%l4,%l7
p0_jmpl_2_ho:
	udivx	%l2,%l6,%l5
	std	%f16,[%o5+0x018]	! Mem[0000000010141418]
	ldstub	[%o5+0x02a],%l0		! Mem[000000001014142a]
	swap	[%o2+0x034],%l0		! Mem[0000000010081434]
	nop
	jmpl	%g6+8,%g0
	ldsh	[%o1+0x004],%l5		! Mem[0000000010041404]
p0_call_2_ho:
	ldstub	[%i0+0x000],%l2		! Mem[00000000201c0000]
	and	%l5,-0x9d3,%l6
	umul	%l7,0xd07,%l1
	sth	%l0,[%o2+0x02c]		! Mem[000000001008142c]
	retl
	andn	%l7,%l4,%l7
user_jump2_end:
	.seg	"text"
	.align	0x2000
user_jump3_start:
	INIT_MEM(0, 0x0040, 1, +, 0, +, 0)
p0_jmpl_3_le:
	udivx	%l3,0xa42,%l5
	ldd	[%i6+0x008],%f4 	! Mem[0000000010181408]
	st	%f12,[%i3+0x004]	! Mem[00000000100c1404]
	jmpl	%g6+8,%g0
	std	%l6,[%i3+0x028]		! Mem[00000000100c1428]
p0_call_3_le:
	lduh	[%i5+0x01a],%l4		! Mem[000000001014141a]
	mulx	%l3,0xbcb,%l7
	nop
	std	%f4 ,[%i1+0x038]	! Mem[0000000010041438]
	retl
	ldstub	[%i5+0x036],%l2		! Mem[0000000010141436]
p0_jmpl_3_lo:
	udivx	%l3,0xa42,%l5
	ldd	[%o6+0x008],%f4 	! Mem[0000000010181408]
	st	%f12,[%o3+0x004]	! Mem[00000000100c1404]
	jmpl	%g6+8,%g0
	std	%l6,[%o3+0x028]		! Mem[00000000100c1428]
p0_call_3_lo:
	lduh	[%o5+0x01a],%l4		! Mem[000000001014141a]
	mulx	%l3,0xbcb,%l7
	nop
	std	%f4 ,[%o1+0x038]	! Mem[0000000010041438]
	retl
	ldstub	[%o5+0x036],%l2		! Mem[0000000010141436]
p0_jmpl_3_he:
	ldx	[%i0+0x028],%l6		! Mem[0000000010001428]
	ldstub	[%i5+0x032],%l3		! Mem[0000000010141432]
	ldstub	[%i1+0x030],%l7		! Mem[0000000010041430]
	lduw	[%i5+0x034],%l6		! Mem[0000000010141434]
	sdivx	%l5,0x210,%l1
	nop
	jmpl	%g6+8,%g0
	swap	[%i0+0x008],%l2		! Mem[0000000010001408]
p0_call_3_he:
	st	%f18,[%i5+0x024]	! Mem[0000000010141424]
	lduw	[%i0+0x018],%l5		! Mem[0000000010001418]
	orn	%l4,%l3,%l5
	ldstub	[%i0+0x00e],%l5		! Mem[000000001000140e]
	ldsw	[%i6+0x038],%l7		! Mem[0000000010181438]
	swap	[%i3+0x010],%l6		! Mem[00000000100c1410]
	addc	%l7,-0x1c2,%l6
	retl
	ldsw	[%i6+0x034],%l5		! Mem[0000000010181434]
p0_jmpl_3_ho:
	ldx	[%o0+0x028],%l6		! Mem[0000000010001428]
	ldstub	[%o5+0x032],%l3		! Mem[0000000010141432]
	ldstub	[%o1+0x030],%l7		! Mem[0000000010041430]
	lduw	[%o5+0x034],%l6		! Mem[0000000010141434]
	sdivx	%l5,0x210,%l1
	nop
	jmpl	%g6+8,%g0
	swap	[%o0+0x008],%l2		! Mem[0000000010001408]
p0_call_3_ho:
	st	%f18,[%o5+0x024]	! Mem[0000000010141424]
	lduw	[%o0+0x018],%l5		! Mem[0000000010001418]
	orn	%l4,%l3,%l5
	ldstub	[%o0+0x00e],%l5		! Mem[000000001000140e]
	ldsw	[%o6+0x038],%l7		! Mem[0000000010181438]
	swap	[%o3+0x010],%l6		! Mem[00000000100c1410]
	addc	%l7,-0x1c2,%l6
	retl
	ldsw	[%o6+0x034],%l5		! Mem[0000000010181434]
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
	.word	0x3d9b2f6f,0xe67d95db		! Init value for %l0
	.word	0xcf44ab82,0xa54854c0		! Init value for %l1
	.word	0x1d697016,0x691ccadf		! Init value for %l2
	.word	0x2838fa4e,0x274f4671		! Init value for %l3
	.word	0x20857288,0x2404f430		! Init value for %l4
	.word	0xe29ca9bc,0x93f1603a		! Init value for %l5
	.word	0xc76d6721,0xed06b274		! Init value for %l6
	.word	0xb716d14a,0x6fc1097c		! Init value for %l7
	.align	64
p0_init_freg:
	.word	0xb8fc05a1,0x6367b33f		! Init value for %f0 
	.word	0xd1c5e7a2,0x805884c5		! Init value for %f2 
	.word	0x9b8a3885,0x05e16164		! Init value for %f4 
	.word	0xe66bfd79,0xfd120472		! Init value for %f6 
	.word	0xec73f491,0x4b342b56		! Init value for %f8 
	.word	0x520d00d2,0x4f2f6302		! Init value for %f10
	.word	0x30c5f851,0x75cc2614		! Init value for %f12
	.word	0x45203f3f,0x926e6b34		! Init value for %f14
	.word	0x9c3a34d5,0xb5d7f295		! Init value for %f16
	.word	0xed8515c7,0xd7c87641		! Init value for %f18
	.word	0xb6ddc26c,0xf35fc89e		! Init value for %f20
	.word	0x58623cfa,0xbd883550		! Init value for %f22
	.word	0xc6585e18,0x2f2900a1		! Init value for %f24
	.word	0x29df2870,0x53294cbf		! Init value for %f26
	.word	0x10016ef2,0x0805fcd7		! Init value for %f28
	.word	0xdab1dfd1,0x17ec71b3		! Init value for %f30
	.word	0x87fac300,0x2b86419d		! Init value for %f32
	.word	0xf7dd17e2,0xdea39413		! Init value for %f34
	.word	0xc9130c03,0x0f91a033		! Init value for %f36
	.word	0xb7650081,0xdfe0d829		! Init value for %f38
	.word	0x27cb5b4a,0xff08d584		! Init value for %f40
	.word	0xc972e80e,0x3441b5dc		! Init value for %f42
	.word	0xcf0eda77,0x6774a8d2		! Init value for %f44
	.word	0xf58d4a00,0x40595e2e		! Init value for %f46
	.word	0x6e6032cd,0x3bef2cc7
	.word	0xc57d7929,0x24c8cffd
	.word	0x4dc7b40b,0x7ab5668a
	.word	0xc6d3e9b4,0x69e19906
	.word	0xf3a1965e,0x06a27b79
	.word	0x4e89bc4d,0xb085d84c
	.word	0x2229e0a9,0x61e50bad
	.word	0xbbebc6e4,0x81494a49
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
	.word	0x00000000,0x0000ffff
	.word	0x00000000,0x0000ff8a
	.word	0x00000000,0x00000000
	.word	0xffffffff,0xffffffff
	.word	0x00000000,0xffc0ffff
	.word	0x00000000,0x00ffffff
	.word	0xffffffff,0xffffffff
	.word	0x00000000,0x000000ff
p0_expected_fp_regs:
	.word	0x000000ff,0xe5022705
	.word	0x00000000,0x00000000
	.word	0x8a000000,0x00000000
	.word	0x000000fb,0x00000000
	.word	0xff59ffc8,0x6600ec00
	.word	0xf230c3b5,0xff3795a8
	.word	0x8a000000,0x00000000
	.word	0x000000fb,0x00000000
	.word	0xd0000000,0x00000000
	.word	0x00000000,0xff0000d0
	.word	0xd0000000,0x97e60f13
	.word	0x007bbbbd,0x835e80db
	.word	0xa89537ff,0x6685ec48
	.word	0x5a2bbe67,0x67be2b5a
	.word	0x3f2cb25d,0x3e2dee16
	.word	0x22873e41,0x0bc8eac7
	.word	0x00000000,0x00000000		! %fsr = 0000000000000000
p0_local0_expect:
	.word	0x00000000,0x00000000
	.word	0xfb000000,0xffffffff
	.word	0x00000000,0x6685ec48
	.word	0x7de5c496,0x9822ffb7
	.word	0x8a000000,0x00000000
	.word	0x00000000,0x4c000000
	.word	0x61000000,0x00000000
	.word	0x00000000,0xc8ff59ff
p0_local0_sec_expect:
	.word	0x0f000000,0x00000000
	.word	0x052702e5,0xff000000
	.word	0x00000000,0x000000ff
	.word	0x007bbbbd,0x835e80db
	.word	0xe3d6eb97,0x6685ec48
	.word	0x5a2bbe67,0x67be2b5a
	.word	0x3f2cb25d,0x3e2dee16
	.word	0x22873e41,0x0bc8eac7
p0_local1_expect:
	.word	0xffffdb1d,0xf6f796ed
	.word	0xffffffff,0x00000000
	.word	0xffffffff,0xffffffe6
	.word	0x2da07cf4,0x145879ff
	.word	0x000000ff,0x00000000
	.word	0x00006100,0x000000ff
	.word	0x8e0705b0,0x00000000
	.word	0xe5022705,0xffffc0ff
p0_local1_sec_expect:
	.word	0x00000000,0xa89537ff
	.word	0x000fe697,0x00000000
	.word	0x000000ff,0x000000d0
	.word	0xff3795a8,0xff000000
	.word	0x00000000,0x0000008a
	.word	0xa00c0000,0xb3d011ff
	.word	0x4e478378,0x82559f9b
	.word	0x000000ff,0xa89537ff
p0_local2_expect:
	.word	0xff000000,0xff000000
	.word	0xffff0000,0x000000ff
	.word	0x8aff8a00,0xffffffff
	.word	0xff6b0000,0x00000000
	.word	0x00006bff,0x000000ff
	.word	0xffffffff,0xea867e20
	.word	0xd0000000,0x97e60f13
	.word	0xed96f7f6,0x1ddb824c
p0_local2_sec_expect:
	.word	0x00000000,0x00000000
	.word	0xff59ffc8,0xff000000
	.word	0x00000000,0x00000000
	.word	0x7de5c496,0x982226b7
	.word	0x0e8b5533,0x22b7fa40
	.word	0xffffa11d,0x82434acb
	.word	0xbd6b53ba,0x5debeccd
	.word	0xeca45b45,0xd9bf64ea
p0_local3_expect:
	.word	0xff000000,0x000000ff
	.word	0xff000000,0x0000008a
	.word	0xff000000,0x00000000
	.word	0xa4590300,0x00000000
	.word	0x00ec0066,0x03eb00ff
	.word	0x00006100,0x00000000
	.word	0x130fe697,0x000000d0
	.word	0x0000b6b6,0x413e8722
p0_local3_sec_expect:
	.word	0x000000ff,0xe5022705
	.word	0x00000000,0x00000000
	.word	0x8a000000,0x00000000
	.word	0xff000000,0x000359a4
	.word	0xff59ffc8,0x6600ec00
	.word	0xf230c3b5,0xff3795a8
	.word	0x8a000000,0x00000000
	.word	0x000000fb,0x00000000
p0_local4_expect:
	.word	0xf230c3b5,0x00000000
	.word	0x00000000,0x0000ff00
	.word	0x8a9537ff,0xffffffff
	.word	0x007bbbbd,0x835e80db
	.word	0x16ee2d3e,0x5db22c3f
	.word	0xff59ffc8,0x00000000
	.word	0xffffffff,0xff3795a8
	.word	0x000000b5,0xff2bbe67
p0_local4_sec_expect:
	.word	0xff0000ff,0xff7cffff
	.word	0xd0000000,0x97e60f13
	.word	0xff9537ff,0x00000000
	.word	0xff000000,0x0000004c
	.word	0xb5c330f2,0x00000000
	.word	0x000000ff,0x00000000
	.word	0xa00000ff,0xff2bbe67
	.word	0xd00000ff,0x00000000
p0_local5_expect:
	.word	0x00610000,0x00000000
	.word	0x00000000,0x00000000
	.word	0xff591ac8,0x00000026
	.word	0xff970600,0xf47cffff
	.word	0x031a783d,0xb6b67068
	.word	0x00000000,0x000000ff
	.word	0x00000000,0x000000ff
	.word	0x00000000,0xff0000d0
p0_local5_sec_expect:
	.word	0xff000000,0xf230c3b5
	.word	0x00000000,0x000000ff
	.word	0xffc0ffff,0xf2000000
	.word	0xff795814,0x0a005f0c
	.word	0x86813ec1,0xd2f09e33
	.word	0x419e8199,0x88506935
	.word	0x4e478378,0x82559f9b
	.word	0xf55f280a,0xc63561c4
p0_local6_expect:
	.word	0x00ffffff,0x67000000
	.word	0x00000000,0xfb000000
	.word	0x00000000,0x00000000
	.word	0xffc70061,0xff11d0b3
	.word	0x004c0000,0x000000ff
	.word	0xf4000000,0x000000ff
	.word	0x00ff0000,0x0000d000
	.word	0xffff5b0e,0x83786dc7
p0_local6_sec_expect:
	.word	0xffdb824c,0xffffc0ff
	.word	0xffbe2b5a,0x00000000
	.word	0x000000ff,0x2bff0000
	.word	0x750f95e4,0x6b639271
	.word	0x5b709345,0x83786dc7
	.word	0x210f5094,0x868cb043
	.word	0x0f8fc972,0x29586e06
	.word	0xaba53952,0x0348c438
share0_expect:
	.word	0xffff9b8f,0x28a41182
	.word	0x35e9660a,0xd8040a72
	.word	0x7ffa67e6,0x582dbc22
	.word	0x198d4e3b,0x5621c754
	.word	0xa3d7755b,0x8e46d939
	.word	0xc7fabccb,0xe9b18917
	.word	0x0dba8d95,0xed9d4785
	.word	0xc17a1155,0xeb423c31
share1_expect:
	.word	0xffff7fc1,0x5d9a99b6
	.word	0x58f6e9e5,0xbf287bab
	.word	0xd8e6cde5,0x1df87f96
	.word	0x475e2f40,0x012f58a2
	.word	0x15ee89c6,0x2dbc9e8a
	.word	0xfb213ad8,0x24765d4f
	.word	0x48d78d9e,0x088f1595
	.word	0xfdd4e671,0xca136679
	.word	0xffffe25a,0xee3d423e
	.word	0x69de1e78,0xfaf54c0b
	.word	0xf02fe716,0xbddd52de
	.word	0xa4bc700b,0x5d64fcf1
	.word	0xfe78c75c,0x9cc16e23
	.word	0x409331fc,0xa3347fe2
	.word	0xb9d00306,0xb1cc2aee
	.word	0x2d70e9bf,0x952f216a
share2_expect:
	.word	0xffffb5d7,0x963b9519
	.word	0xb6416611,0xf66264cc
	.word	0xea293846,0x315801dd
	.word	0x2c276e0b,0x9d479123
	.word	0x592d0469,0xa8d150fc
	.word	0xc9dc5878,0x8282181f
	.word	0xbacbad56,0x9b1fd796
	.word	0xf2056cf5,0x1eb0696f
share3_expect:
	.word	0x0000c8c8,0x95a223bb
	.word	0xf71a85ed,0x369ed4e0
	.word	0x877d0413,0x40b03d46
	.word	0xe4ef378b,0xe3442d86
	.word	0xed79f770,0x6e547899
	.word	0x5a5effc0,0x6cb080e7
	.word	0xd58c4066,0x624c54ec
	.word	0xaebd3d9d,0x694afd48
	.word	0xff8a9ae4,0xb10aa81e
	.word	0x1cacfe2c,0xdd33a745
	.word	0x4b41d6fb,0xbae4dc1d
	.word	0x49eb47f5,0xdc9ede5a
	.word	0xd86fcba5,0x3904fd8d
	.word	0x17943f0b,0x2514319d
	.word	0x78dc7451,0xd760e20e
	.word	0x9f1302e5,0x2a9ec153
	.word	0xd8ff3b1a,0xd6f9905a
	.word	0xfe13ce6f,0xbc44d8e5
	.word	0x3dd12f2b,0xef7cb150
	.word	0x9345c486,0x0f3af785
	.word	0x3e9c67fd,0x79eaa332
	.word	0xdb9c3ba7,0x2a379d7b
	.word	0x1dd60df8,0x5098ede7
	.word	0x676166bf,0x7e46a806
	.word	0xafffcbcc,0x3c85dd80
	.word	0xae15df61,0x5c0763c6
	.word	0x66766d69,0x62e1560d
	.word	0x92d8ea41,0x038522bb
	.word	0xbb396585,0xf432b5c8
	.word	0x7a54171c,0x494569e6
	.word	0xe1037e6c,0xe5cd0632
	.word	0x025463c8,0x8e26ca65
	.word	0xffff4a7a,0x7a607ab1
	.word	0xcd35260c,0x403f5be7
	.word	0xcacbc30e,0x6c8e3544
	.word	0xb6011ba7,0xa741376f
	.word	0x21ee2a8d,0xf0750a19
	.word	0x6142019a,0xdf5410bf
	.word	0xf6e9ac0d,0x8262f5b1
	.word	0x68794f4a,0xd8a2ec4a
	.word	0x3e4cef3d,0x3e1f971f
	.word	0x7fa553b3,0x8940ef9e
	.word	0x0cac675b,0x7609b9d1
	.word	0xdf5f6842,0xe435592f
	.word	0x83b5ced7,0x26e1e9da
	.word	0xdcb79288,0xe72b6c77
	.word	0xf97d958a,0xe26ce9ca
	.word	0xb13a7560,0xcb8e5979
	.word	0xa1ff2710,0xf00dd386
	.word	0x5e8fe180,0xe7a3bb05
	.word	0x0f0b0806,0x72be38be
	.word	0xa9167f37,0x6b1d93d9
	.word	0x3b10a015,0x4ea4cec0
	.word	0x3588d02c,0xfbd72112
	.word	0x6a68f020,0x21ba2c6b
	.word	0x23319472,0xd88efabd
	.word	0x820067be,0x464c9006
	.word	0xd265a527,0x88273a59
	.word	0x6ce6d0c1,0xd2c38757
	.word	0x03501664,0x0153ec07
	.word	0x7ee24cc3,0x161e4157
	.word	0x83207f7e,0xc3e11085
	.word	0x59732567,0xaba9f63f
	.word	0x4b351e16,0x4c8093bb
p0_invalidate_semaphore:
	.word	0

!	Data for check points

	.align	8
p0_check_pt_data_1:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x009f455a		! Expected data for %l0
	.word	0x00000000,0x6f64bbd1		! Expected data for %l1
	.word	0x00000000,0x00000082		! Expected data for %l2
	.word	0x00000000,0x000000b6		! Expected data for %l3
	.word	0x00000000,0x00000044		! Expected data for %l4
	.word	0xc76d6721,0xed06b274		! Expected data for %l5
	.word	0x00000000,0x00000061		! Expected data for %l6
	.word	0xffffffff,0xffffffcb		! Expected data for %l7
	.word	0xb8fc05a1,0x44f7283c		! Expected data for %f0
	.word	0xf2bd4295,0xf876ea74		! Expected data for %f12
	.word	0xc76d6721,0xed06b274		! Expected data for %f14
	.word	0x615388c2,0xc81a59ff		! Expected data for %f16
	.word	0x441a1d72,0x0692c0bd		! Expected data for %f18
	.word	0xb46b74e9,0x3437cf0c		! Expected data for %f20
	.word	0xb7262298,0x96c4e57d		! Expected data for %f22
	.word	0x40fab722,0x33558b0e		! Expected data for %f24
	.word	0x4cef955e,0xc5fcce28		! Expected data for %f26
	.word	0xcdeceb5d,0xba536bbd		! Expected data for %f28
	.word	0xea64bfd9,0x455ba4ec		! Expected data for %f30
p0_check_pt_data_2:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x0000ff3c		! Expected data for %l0
	.word	0x00000000,0x00003cff		! Expected data for %l1
	.word	0x00000000,0x00000089		! Expected data for %l2
	.word	0xd3858246,0x0873e995		! Expected data for %l3
	.word	0x00000000,0x00000044		! Expected data for %l4
	.word	0x00000000,0x00006697		! Expected data for %l5
	.word	0x00000000,0xdc55a41e		! Expected data for %l6
	.word	0x02f5caf9,0x794a8491		! Expected data for %l7
	.word	0xc76d6721,0xed06b274		! Expected data for %f0
	.word	0xff64bfd9,0xe545dd67		! Expected data for %f2
	.word	0xd853a11d,0x94e9022f		! Expected data for %f4
	.word	0xff795814,0xf47ca02d		! Expected data for %f6
	.word	0x031a783d,0xb6b67068		! Expected data for %f8
	.word	0x348aa427,0x35edcef8		! Expected data for %f10
	.word	0xfa62794f,0x0000003a		! Expected data for %f12
	.word	0x3498af52,0x7ae32cb8		! Expected data for %f14
	.word	0xc76d6721,0x3437cf0c		! Expected data for %f20
p0_check_pt_data_3:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x0000009d		! Expected data for %l0
	.word	0x00000000,0x00009933		! Expected data for %l1
	.word	0x00000000,0x0000000e		! Expected data for %l2
	.word	0x00000000,0xff2de931		! Expected data for %l3
	.word	0x00000000,0x00000044		! Expected data for %l4
	.word	0x00000000,0xd3bfcf8b		! Expected data for %l5
	.word	0x00000000,0x82fa1028		! Expected data for %l6
	.word	0x00000000,0x00000049		! Expected data for %l7
	.word	0xc76d6721,0x0e5b9083		! Expected data for %f0
	.word	0x44000000,0x67be2b5a		! Expected data for %f2
	.word	0xd853a11d,0xd2c70061		! Expected data for %f4
	.word	0xff795814,0xf47ca02d		! Expected data for %f6
	.word	0x348aa427,0xffffffff		! Expected data for %f10
	.word	0x5a2bbe67,0xc81a59ff		! Expected data for %f16
	.word	0xcb4a4382,0x1da1ffff		! Expected data for %f26
p0_check_pt_data_4:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x1dfeb2e3		! Expected data for %l0
	.word	0x4dae9468,0x73f7e720		! Expected data for %l1
	.word	0x00000000,0x000000ff		! Expected data for %l2
	.word	0x00000000,0x00000061		! Expected data for %l3
	.word	0x00000000,0xcbc11310		! Expected data for %l4
	.word	0x00000000,0xc262779d		! Expected data for %l5
	.word	0x00000000,0x00000073		! Expected data for %l6
	.word	0x00000000,0x4f7962fa		! Expected data for %l7
	.word	0x44000000,0x67be2b5a		! Expected data for %f2
	.word	0xd853a11d,0xd2c70061		! Expected data for %f4
	.word	0xffffffff,0xb6b67068		! Expected data for %f8
	.word	0x3498af52,0xdc55a41e		! Expected data for %f14
	.word	0x000000ff,0xffffffd6		! Expected data for %f20
p0_check_pt_data_5:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x0000001d		! Expected data for %l0
	.word	0xffffffff,0xea64bfd9		! Expected data for %l1
	.word	0x00000000,0xd853a11d		! Expected data for %l2
	.word	0x00000000,0x0000522b		! Expected data for %l3
	.word	0x00000000,0x9d605229		! Expected data for %l4
	.word	0x00000000,0x00000082		! Expected data for %l5
	.word	0x00000000,0x00000000		! Expected data for %l6
	.word	0xffffffff,0xffffffeb		! Expected data for %l7
	.word	0xff1a1d72,0x0692c0bd		! Expected data for %f0
	.word	0x44000000,0x67be2b5a		! Expected data for %f2
	.word	0x348aa427,0x1da1ffff		! Expected data for %f10
	.word	0x000000ff,0xffffffd6		! Expected data for %f12
	.word	0xd853a11d,0x3437cf0c		! Expected data for %f14
	.word	0xa00c1120,0xf647d8f4		! Expected data for %f16
	.word	0xd9e7e5b7,0xf230c3b5		! Expected data for %f18
	.word	0x10016ef2,0x080500b6		! Expected data for %f20
	.word	0x58afbc96,0xbf2401ae		! Expected data for %f22
	.word	0x4e1850f6,0x1b9d2f10		! Expected data for %f24
	.word	0x39201c3d,0x40e1b60f		! Expected data for %f26
	.word	0xbb845332,0xa7a39013		! Expected data for %f28
	.word	0x441a1d72,0x85c701c8		! Expected data for %f30
p0_check_pt_data_6:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x00000012		! Expected data for %l0
	.word	0x00000000,0xda130a7f		! Expected data for %l1
	.word	0x00000000,0x00000000		! Expected data for %l2
	.word	0x00000000,0xba390000		! Expected data for %l3
	.word	0xffffffff,0xffffffd9		! Expected data for %l4
	.word	0x00000000,0xfffc3a38		! Expected data for %l5
	.word	0x00000000,0xff000000		! Expected data for %l7
	.word	0xff1a1d72,0x0692c0bd		! Expected data for %f0
	.word	0xff795814,0xf47ca02d		! Expected data for %f6
	.word	0x000000ff,0x5a2bbe67		! Expected data for %f12
	.word	0xff3795a8,0x052702e5		! Expected data for %f14
	.word	0xa00c1120,0xf647d8f4		! Expected data for %f16
	.word	0xd9e7e5b7,0xf230c3b5		! Expected data for %f18
	.word	0x10016ef2,0x080500b6		! Expected data for %f20
	.word	0x58afbc96,0xbf2401ae		! Expected data for %f22
	.word	0x4e1850f6,0x1b9d2f10		! Expected data for %f24
	.word	0x39201c3d,0x40e1b60f		! Expected data for %f26
	.word	0xbb845332,0xa7a39013		! Expected data for %f28
	.word	0x441a1d72,0x85c701c8		! Expected data for %f30
p0_check_pt_data_7:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x0000ffd9		! Expected data for %l0
	.word	0xffffffff,0xffffffff		! Expected data for %l1
	.word	0x00000000,0x00000000		! Expected data for %l3
	.word	0x00000000,0x325384bb		! Expected data for %l4
	.word	0x00000000,0x7adba270		! Expected data for %l5
	.word	0xffffffff,0xffffd9d6		! Expected data for %l6
	.word	0x00000000,0xff00348a		! Expected data for %l7
	.word	0x5a2bbe67,0x67be2b5a		! Expected data for %f2
	.word	0xd853a11d,0xd2c70061		! Expected data for %f4
	.word	0xcdeceb5d,0xba536bbd		! Expected data for %f10
	.word	0x67be2b5a,0xf647d8f4		! Expected data for %f16
	.word	0xbb845332,0x721d1a44		! Expected data for %f28
p0_check_pt_data_8:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0xb6000508		! Expected data for %l0
	.word	0x00000000,0x0000dc8b		! Expected data for %l1
	.word	0x00000000,0x130fe697		! Expected data for %l2
	.word	0x00000000,0xd3bfcf8b		! Expected data for %l3
	.word	0x00000000,0x00000061		! Expected data for %l4
	.word	0x00000000,0x00000000		! Expected data for %l5
	.word	0x00000000,0x00000000		! Expected data for %l6
	.word	0x00000000,0xe5022705		! Expected data for %l7
	.word	0x5a2bbe67,0x67be2b5a		! Expected data for %f2
	.word	0xff6b53ba,0x1b9d2f10		! Expected data for %f24
p0_check_pt_data_9:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x0000d000		! Expected data for %l0
	.word	0x00000000,0x67be2b5a		! Expected data for %l1
	.word	0x00000000,0x61000005		! Expected data for %l2
	.word	0x00000000,0x0000b6b6		! Expected data for %l3
	.word	0xffffffff,0xd0000000		! Expected data for %l4
	.word	0x00000000,0x0000ffd9		! Expected data for %l5
	.word	0x00000000,0x130fe697		! Expected data for %l6
	.word	0x00000000,0xf230c3b5		! Expected data for %l7
	.word	0x5a2bbe67,0x67be2b5a		! Expected data for %f2
	.word	0xffb60000,0xc2885361		! Expected data for %f4
	.word	0xff795814,0x00000000		! Expected data for %f6
	.word	0x4f550ab7,0x000000d0		! Expected data for %f12
	.word	0x441a07c3,0xff000000		! Expected data for %f16
	.word	0x6100c7d2,0x85c701c8		! Expected data for %f18
	.word	0xcdeceb5d,0xba536bff		! Expected data for %f20
	.word	0xdb805e83,0xbdbb7b00		! Expected data for %f22
	.word	0x48ec8566,0x97ebd6e3		! Expected data for %f24
	.word	0xd3b71ee5,0x2cd01e55		! Expected data for %f26
	.word	0x16ee2d3e,0x5db22c3f		! Expected data for %f28
	.word	0xc7eac80b,0x413e8722		! Expected data for %f30
p0_check_pt_data_10:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x000000b5		! Expected data for %l0
	.word	0x00000000,0x00ff0074		! Expected data for %l1
	.word	0x00000000,0x00000000		! Expected data for %l2
	.word	0x00000000,0x05000061		! Expected data for %l3
	.word	0x00000000,0x00000000		! Expected data for %l5
	.word	0x00000000,0xd853a11d		! Expected data for %l6
	.word	0xff3795a8,0x052702e5		! Expected data for %f6
	.word	0xffffffff,0x0692c0bd		! Expected data for %f8
	.word	0xff00348a,0x00000000		! Expected data for %f16
	.word	0xff6b53ba,0x5db22c3f		! Expected data for %f28
	.word	0x0000b6b6,0x413e8722		! Expected data for %f30
p0_check_pt_data_11:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0xff3795a8		! Expected data for %l0
	.word	0x00000000,0x000000ff		! Expected data for %l1
	.word	0x72006100,0xed06b274		! Expected data for %l2
	.word	0x00000000,0x0000009d		! Expected data for %l3
	.word	0x00000000,0x0000004c		! Expected data for %l5
	.word	0x00000000,0x000067be		! Expected data for %l6
	.word	0x00000000,0x0000008a		! Expected data for %l7
	.word	0xff1a1d72,0x0692c0bd		! Expected data for %f0
	.word	0x70a2db7a,0x00001da1		! Expected data for %f4
	.word	0x130fe697,0x000000d0		! Expected data for %f12
p0_check_pt_data_12:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x5a2bbe67		! Expected data for %l0
	.word	0x00000000,0x86ddcb5f		! Expected data for %l1
	.word	0x00000000,0x130fe697		! Expected data for %l2
	.word	0x00000000,0x00000096		! Expected data for %l3
	.word	0xffffffff,0xffffffff		! Expected data for %l4
	.word	0x00000000,0x00000061		! Expected data for %l5
	.word	0x00000000,0x000000ff		! Expected data for %l6
	.word	0x00000000,0xff6b53ba		! Expected data for %l7
	.word	0xff1a1d72,0x0692c0bd		! Expected data for %f0
	.word	0xff00d000,0x20110ca0		! Expected data for %f18
	.word	0x4f550ab7,0x2cd01e55		! Expected data for %f26
	.word	0x78f096f5,0x9711fcff		! Expected data for %f28
p0_check_pt_data_13:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x000000ff		! Expected data for %l0
	.word	0x00000000,0x000000ff		! Expected data for %l1
	.word	0x00000000,0x000000c5		! Expected data for %l2
	.word	0x00000000,0x00000000		! Expected data for %l3
	.word	0x00000000,0x0000004c		! Expected data for %l4
	.word	0xffffffff,0xffffffff		! Expected data for %l5
	.word	0x00000000,0x000000ff		! Expected data for %l6
	.word	0x00000000,0x00000072		! Expected data for %l7
	.word	0x4c000000,0x0692c0bd		! Expected data for %f0
	.word	0x70a2db7a,0x00001da1		! Expected data for %f4
	.word	0x031a783d,0xb6b67068		! Expected data for %f6
	.word	0xcdeceb5d,0x721d1aff		! Expected data for %f10
	.word	0xb6b60000,0x70a2db7a		! Expected data for %f16
	.word	0x0000004c,0x00000000		! Expected data for %f18
	.word	0xff536bff,0xd2c70061		! Expected data for %f20
	.word	0xff3795a8,0xff000000		! Expected data for %f22
	.word	0x86813ec1,0xd2f09e33		! Expected data for %f24
	.word	0x419e8199,0x88506935		! Expected data for %f26
	.word	0x4e478378,0x82559f9b		! Expected data for %f28
	.word	0xf55f280a,0xc63561c4		! Expected data for %f30
p0_check_pt_data_14:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x052702e5		! Expected data for %l0
	.word	0x00000000,0x00000000		! Expected data for %l1
	.word	0x00000000,0x00000000		! Expected data for %l2
	.word	0xe5022705,0x00000000		! Expected data for %l3
	.word	0x00000000,0x0000000e		! Expected data for %l4
	.word	0x00000000,0x0000004c		! Expected data for %l5
	.word	0x00000000,0x00000022		! Expected data for %l6
	.word	0x00000000,0x0000004f		! Expected data for %l7
	.word	0x78f096f5,0x9711fcff		! Expected data for %f0
	.word	0xcdeceb5d,0xffffffff		! Expected data for %f10
	.word	0xb6b60000,0x02e50000		! Expected data for %f16
	.word	0xa00c1120,0x67be2bff		! Expected data for %f24
	.word	0xa00c1120,0x67be2bff		! Expected data for %f26
p0_check_pt_data_15:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x00000000		! Expected data for %l0
	.word	0x00000000,0xbdc09206		! Expected data for %l2
	.word	0x00000000,0xffffffff		! Expected data for %l3
	.word	0xff1a1d72,0x000000b5		! Expected data for %l4
	.word	0xffffffff,0xffffffb8		! Expected data for %l5
	.word	0x00000000,0x000000ff		! Expected data for %l6
	.word	0x00000000,0x000000ff		! Expected data for %l7
	.word	0x78f096f5,0x9711fcff		! Expected data for %f0
	.word	0x5a2bbe67,0x67be2b5a		! Expected data for %f2
	.word	0x70a2db7a,0xff000000		! Expected data for %f4
	.word	0x031a783d,0xb6b67068		! Expected data for %f6
	.word	0xffffffff,0x0692c0bd		! Expected data for %f8
	.word	0xcdeceb5d,0xffffffff		! Expected data for %f10
	.word	0x130fe697,0x000000d0		! Expected data for %f12
	.word	0xff3795a8,0x052702e5		! Expected data for %f14
	.word	0xb6b60000,0xa89537ff		! Expected data for %f16
	.word	0x00000000,0x00000000		! Expected data for %f18
	.word	0xff3795a8,0xff000000		! Expected data for %f22
	.word	0xa00c1120,0xb3d011ff		! Expected data for %f26
	.word	0x9d000000,0xff3795a8		! Expected data for %f30
p0_check_pt_data_16:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0xff0011ff		! Expected data for %l0
	.word	0x00000000,0x70a2db7a		! Expected data for %l1
	.word	0x00000000,0x000000ff		! Expected data for %l2
	.word	0x00000000,0x000000ff		! Expected data for %l3
	.word	0x00000000,0x000000ff		! Expected data for %l5
	.word	0x00000000,0x000000ff		! Expected data for %l6
	.word	0x00000000,0x00000000		! Expected data for %l7
	.word	0x00000000,0x0000004c		! Expected data for %f0
	.word	0x70a2db7a,0xff000000		! Expected data for %f4
	.word	0x031a783d,0xf47cffff		! Expected data for %f6
	.word	0x00000000,0x0692c0bd		! Expected data for %f8
	.word	0x000000ff,0xff6b53ba		! Expected data for %f30
p0_check_pt_data_17:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x00000000		! Expected data for %l0
	.word	0x00000000,0x00000000		! Expected data for %l1
	.word	0xffffffff,0xffffffff		! Expected data for %l2
	.word	0x00000000,0x000000ff		! Expected data for %l3
	.word	0x00000000,0x00006100		! Expected data for %l4
	.word	0xffffffff,0xffffffff		! Expected data for %l5
	.word	0x00000000,0x000000ff		! Expected data for %l6
	.word	0x00000000,0x67be2bff		! Expected data for %l7
	.word	0x00000000,0x0000004c		! Expected data for %f0
	.word	0xfffc1197,0xf596f078		! Expected data for %f4
	.word	0x031a783d,0xf47cffff		! Expected data for %f6
	.word	0x35edcef8,0x00000000		! Expected data for %f18
	.word	0xd0000000,0x67be2b5a		! Expected data for %f22
	.word	0xd0000000,0x67be2bff		! Expected data for %f24
	.word	0x5a2bbe67,0xb3d011ff		! Expected data for %f26
p0_check_pt_data_18:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x000000ff		! Expected data for %l0
	.word	0x00000000,0xff591ac8		! Expected data for %l1
	.word	0x00000000,0x0000d000		! Expected data for %l2
	.word	0x00000000,0x000000ff		! Expected data for %l3
	.word	0x00000000,0x00000000		! Expected data for %l4
	.word	0x00000000,0x000000ff		! Expected data for %l5
	.word	0x00000000,0x000000ff		! Expected data for %l6
	.word	0x00000000,0x000000ff		! Expected data for %l7
	.word	0x00000000,0x0000004c		! Expected data for %f0
	.word	0x67be2b5a,0x5fcbdd86		! Expected data for %f14
	.word	0x00873e41,0xd2c70061		! Expected data for %f20
	.word	0xd0000000,0x0000e541		! Expected data for %f24
p0_check_pt_data_19:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x00006bff		! Expected data for %l0
	.word	0x00000000,0x0000ff6b		! Expected data for %l1
	.word	0x00000000,0xff0000ff		! Expected data for %l2
	.word	0x00000000,0x000000ff		! Expected data for %l3
	.word	0x00000000,0x00000000		! Expected data for %l4
	.word	0x6870b6b6,0x3d781a03		! Expected data for %l5
	.word	0x00000000,0x00000000		! Expected data for %l6
	.word	0x00000000,0x00000000		! Expected data for %l7
	.word	0x5a2bbe67,0x67be2b5a		! Expected data for %f2
	.word	0xfffc1197,0xf596f078		! Expected data for %f4
	.word	0xb5c330f2,0x4c0000ff		! Expected data for %f8
	.word	0x0000d000,0xc81a59ff		! Expected data for %f12
	.word	0x000000d0,0xa89537ff		! Expected data for %f16
	.word	0x5a2bbe67,0x5fcbdd86		! Expected data for %f18
	.word	0xff536bff,0xd2c70061		! Expected data for %f20
	.word	0xff3795a8,0xff000000		! Expected data for %f22
	.word	0xa00c1120,0x67be2bff		! Expected data for %f24
	.word	0x35edcef8,0x000000ff		! Expected data for %f26
	.word	0x4e478378,0x82559f9b		! Expected data for %f28
	.word	0x9d000000,0xff3795a8		! Expected data for %f30
p0_check_pt_data_20:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x00000013		! Expected data for %l0
	.word	0x00000000,0x00000000		! Expected data for %l2
	.word	0x00000000,0x000000ff		! Expected data for %l3
	.word	0x00000000,0x000078ff		! Expected data for %l4
	.word	0x00000000,0xff000000		! Expected data for %l5
	.word	0x00000000,0x000000ff		! Expected data for %l6
	.word	0x00000000,0x00000000		! Expected data for %l7
	.word	0x5a2bbe67,0xff000000		! Expected data for %f2
	.word	0x0000ff6b,0x5fcbdd86		! Expected data for %f4
	.word	0x031a783d,0xf47cffff		! Expected data for %f6
	.word	0xfffc1197,0xf596f078		! Expected data for %f12
	.word	0xba536bff,0x5fcbdd86		! Expected data for %f14
	.word	0x00000000,0xf8ceed35		! Expected data for %f30
p0_check_pt_data_21:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x0000003e		! Expected data for %l0
	.word	0x00000000,0x00000000		! Expected data for %l1
	.word	0x00000000,0x000000ff		! Expected data for %l2
	.word	0xffffffff,0xffffff6b		! Expected data for %l3
	.word	0x00000000,0xd0000000		! Expected data for %l4
	.word	0x00000000,0xff3795a8		! Expected data for %l5
	.word	0x00d011ff,0x000000ff		! Expected data for %l6
	.word	0x00000000,0x0000d03e		! Expected data for %l7
	.word	0x00000000,0x0000004c		! Expected data for %f0
	.word	0x5a2bbe67,0xff000000		! Expected data for %f2
	.word	0x0000ff6b,0x5fcbdd86		! Expected data for %f4
	.word	0x031a783d,0xf47cffff		! Expected data for %f6
	.word	0xb6b60000,0xa89537ff		! Expected data for %f10
	.word	0x5a2bbe67,0xff00c0bd		! Expected data for %f18
	.word	0xff3795a8,0x0000b6b6		! Expected data for %f30
p0_check_pt_data_22:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x00000006		! Expected data for %l0
	.word	0x00000000,0x000000d0		! Expected data for %l2
	.word	0x00000000,0x00000000		! Expected data for %l3
	.word	0x00000000,0x00ff00ff		! Expected data for %l4
	.word	0xffffffff,0xffffffff		! Expected data for %l5
	.word	0x00000000,0x00000000		! Expected data for %l6
	.word	0x00000000,0xd0000000		! Expected data for %l7
	.word	0x0000b6b6,0x00780000		! Expected data for %f0
	.word	0x00000000,0xff6b53ff		! Expected data for %f4
	.word	0x031a783d,0xf47cffff		! Expected data for %f6
	.word	0xb5c330f2,0x13000000		! Expected data for %f8
	.word	0xd0000000,0x00ff00ff		! Expected data for %f20
p0_check_pt_data_23:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0xff3795a8		! Expected data for %l0
	.word	0x00000000,0x0000b6b6		! Expected data for %l1
	.word	0xfffc1197,0x000000ff		! Expected data for %l2
	.word	0x00000000,0x000000bd		! Expected data for %l3
	.word	0x00000000,0xd2c70061		! Expected data for %l5
	.word	0x00000000,0x0000ffff		! Expected data for %l7
	.word	0x0000b6b6,0x00780000		! Expected data for %f0
	.word	0x00000000,0xff6b53ff		! Expected data for %f4
	.word	0x6bff00ff,0xf47cffff		! Expected data for %f6
	.word	0x13d90025,0xa97dff77		! Expected data for %f10
	.word	0xff000000,0xd00000ff		! Expected data for %f24
	.word	0x000000ff,0x000000ff		! Expected data for %f26
	.word	0xff6b53ff,0x82559f9b		! Expected data for %f28
p0_check_pt_data_24:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x00000000		! Expected data for %l0
	.word	0x00000000,0x00000000		! Expected data for %l1
	.word	0x00000000,0xff000000		! Expected data for %l3
	.word	0x00000000,0x000037ff		! Expected data for %l4
	.word	0x00000000,0x000000ff		! Expected data for %l5
	.word	0xffffffff,0xff000000		! Expected data for %l6
	.word	0x00000000,0x0000001d		! Expected data for %l7
	.word	0xd00059ff,0xa89537ff		! Expected data for %f0
	.word	0x00000000,0x00000000		! Expected data for %f2
	.word	0x39000000,0xff0000ff		! Expected data for %f4
	.word	0xff3795a8,0xff000000		! Expected data for %f6
	.word	0xa00c1120,0x67be2bff		! Expected data for %f8
	.word	0xa00c0000,0xb3d011ff		! Expected data for %f10
	.word	0x4e478378,0x82559f9b		! Expected data for %f12
	.word	0x000000ff,0xff6b53ba		! Expected data for %f14
	.word	0x00000000,0x00000000		! Expected data for %f18
	.word	0x6100c7d2,0xff6b53ff		! Expected data for %f20
	.word	0xff000000,0x9711fcff		! Expected data for %f22
	.word	0x00000000,0xff00ff6b		! Expected data for %f28
p0_check_pt_data_25:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0xffffffff,0xffffffff		! Expected data for %l0
	.word	0x00000000,0x000000f4		! Expected data for %l1
	.word	0x00000000,0xf230c3b5		! Expected data for %l3
	.word	0xffffffff,0xffffffff		! Expected data for %l4
	.word	0x00000000,0x0000008e		! Expected data for %l5
	.word	0xffffffff,0xffffe5ff		! Expected data for %l6
	.word	0x00000000,0x000000ff		! Expected data for %l7
	.word	0x00000000,0x00000000		! Expected data for %f2
	.word	0xa4590300,0xf9fbe3e0		! Expected data for %f4
	.word	0xa00c1120,0xb5000000		! Expected data for %f8
	.word	0xa00c0000,0x8e0705b0		! Expected data for %f10
	.word	0xff6b53ff,0xff6b53ff		! Expected data for %f20
	.word	0x00000000,0x00006bff		! Expected data for %f24
	.word	0x000000ff,0xf596f0ff		! Expected data for %f26
p0_check_pt_data_26:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x000000ff		! Expected data for %l0
	.word	0xffffffff,0x9b9f5582		! Expected data for %l1
	.word	0x00000000,0x00000600		! Expected data for %l2
	.word	0x00000000,0x8e0705b0		! Expected data for %l3
	.word	0x00000000,0x00000000		! Expected data for %l4
	.word	0x00000000,0x00000061		! Expected data for %l5
	.word	0x00000000,0x00000000		! Expected data for %l7
	.word	0xffffffff,0x5debeccd		! Expected data for %f4
	.word	0xff3795a8,0xff000000		! Expected data for %f6
	.word	0xe5022705,0x00000000		! Expected data for %f14
p0_check_pt_data_27:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x4e478378		! Expected data for %l0
	.word	0x00000000,0x82559f9b		! Expected data for %l1
	.word	0x00000000,0x00000082		! Expected data for %l2
	.word	0x00000000,0x00001197		! Expected data for %l3
	.word	0x00000000,0x00000000		! Expected data for %l4
	.word	0xffffffff,0xffffff8a		! Expected data for %l5
	.word	0x00000000,0xffffffff		! Expected data for %l6
	.word	0x00000000,0xf230c3b5		! Expected data for %l7
	.word	0x00000000,0xa89537ff		! Expected data for %f0
	.word	0x130fe697,0x000000d0		! Expected data for %f12
	.word	0xff3795a8,0xff000000		! Expected data for %f30
p0_check_pt_data_28:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0xffffffff		! Expected data for %l0
	.word	0x00000000,0xf8ceed35		! Expected data for %l1
	.word	0x00000000,0xffffffff		! Expected data for %l2
	.word	0x67be2bff,0x000000ff		! Expected data for %l3
	.word	0x97110000,0x82000000		! Expected data for %l5
	.word	0x00000000,0xff00e697		! Expected data for %l7
	.word	0x00000000,0x82000000		! Expected data for %f0
	.word	0x00000000,0x00000000		! Expected data for %f2
	.word	0xffffffff,0x83786dc7		! Expected data for %f4
	.word	0x06000000,0xf8ceed35		! Expected data for %f12
	.word	0x00000000,0xc8ff59ff		! Expected data for %f16
	.word	0xff000000,0x000000ff		! Expected data for %f18
	.word	0x00000000,0x000000ff		! Expected data for %f20
	.word	0xb7262298,0x96c4e57d		! Expected data for %f22
	.word	0x00000000,0x0000008a		! Expected data for %f24
	.word	0x0000004c,0x00000000		! Expected data for %f26
	.word	0x00000000,0x00000061		! Expected data for %f28
	.word	0xff64bfd9,0x0000008a		! Expected data for %f30
p0_check_pt_data_29:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x00000000		! Expected data for %l0
	.word	0x000000ff,0xc8ff59ff		! Expected data for %l1
	.word	0x00000000,0x00000000		! Expected data for %l2
	.word	0x00000000,0x000000ff		! Expected data for %l3
	.word	0xffffffff,0xffffffff		! Expected data for %l4
	.word	0xffffffff,0xffffffff		! Expected data for %l5
	.word	0x00000000,0xff536bff		! Expected data for %l6
	.word	0x00000000,0xd2c78255		! Expected data for %l7
	.word	0xff3795a8,0x000000ff		! Expected data for %f6
	.word	0x00000000,0x00000000		! Expected data for %f18
	.word	0x130fe697,0x000000d0		! Expected data for %f22
	.word	0x0000004c,0xff9f5582		! Expected data for %f26
	.word	0xf230c3b5,0xffffffff		! Expected data for %f28
p0_check_pt_data_30:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0xffffffff,0xffffffff		! Expected data for %l1
	.word	0x00000000,0x00000006		! Expected data for %l2
	.word	0x00000000,0xffffffff		! Expected data for %l3
	.word	0x00000000,0x00000000		! Expected data for %l4
	.word	0x00000000,0x000000ff		! Expected data for %l5
	.word	0x00000000,0x000000ff		! Expected data for %l6
	.word	0x00000000,0x00000000		! Expected data for %l7
	.word	0x00000000,0x82000000		! Expected data for %f0
	.word	0x00000000,0xc8ff59ff		! Expected data for %f2
	.word	0xffffffff,0x83786dc7		! Expected data for %f4
	.word	0xff3795a8,0x000000ff		! Expected data for %f6
	.word	0x00000000,0x00000000		! Expected data for %f12
	.word	0x00000000,0xa89537ff		! Expected data for %f18
	.word	0xff3795a8,0x0000008a		! Expected data for %f30
p0_check_pt_data_31:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x000000ff		! Expected data for %l0
	.word	0xf230c3b5,0xffffffff		! Expected data for %l1
	.word	0x00000000,0x000000ff		! Expected data for %l2
	.word	0x00000000,0x00000000		! Expected data for %l3
	.word	0x00000000,0x000000ff		! Expected data for %l4
	.word	0x00000000,0x00000000		! Expected data for %l5
	.word	0x00000000,0x00000000		! Expected data for %l6
	.word	0x00000000,0x000000ff		! Expected data for %l7
	.word	0x00000000,0xc8ff59ff		! Expected data for %f2
	.word	0xffffffff,0x83786dc7		! Expected data for %f4
	.word	0xff000000,0xd00000ff		! Expected data for %f6
	.word	0x00000000,0x000000ff		! Expected data for %f8
	.word	0x00000000,0xb7262298		! Expected data for %f12
	.word	0xff000000,0x000000ff		! Expected data for %f18
	.word	0xf47cffff,0x00000000		! Expected data for %f22
p0_check_pt_data_32:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x000000f4		! Expected data for %l0
	.word	0x00000000,0x0000004c		! Expected data for %l1
	.word	0x00000000,0x00000005		! Expected data for %l2
	.word	0x00000000,0x000000ff		! Expected data for %l3
	.word	0x00000000,0x00000500		! Expected data for %l5
	.word	0x00000000,0x00000000		! Expected data for %l6
	.word	0x00000000,0x000000ff		! Expected data for %l7
	.word	0x00000000,0xd2c78255		! Expected data for %f0
	.word	0xff3795a8,0x00000000		! Expected data for %f2
	.word	0x00000000,0x00000026		! Expected data for %f4
	.word	0xff790600,0xf47cffff		! Expected data for %f6
	.word	0x031a783d,0xb6b67068		! Expected data for %f8
	.word	0x00000000,0xff000000		! Expected data for %f10
	.word	0xff591ac8,0x000000ff		! Expected data for %f12
	.word	0x00000000,0xff0000d0		! Expected data for %f14
	.word	0xff59ffc8,0x0000004c		! Expected data for %f18
	.word	0x00000000,0xf230c3b5		! Expected data for %f20
p0_check_pt_data_33:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0xffffffff,0xffffffff		! Expected data for %l1
	.word	0x00000000,0x000000ff		! Expected data for %l2
	.word	0x00000000,0x000000ff		! Expected data for %l3
	.word	0x00000000,0x000000c8		! Expected data for %l4
	.word	0x00000000,0x0000ff0f		! Expected data for %l5
	.word	0xe5022705,0xffffc0ff		! Expected data for %l6
	.word	0x00000000,0x000000ff		! Expected data for %l7
	.word	0xff536bff,0xd2c70061		! Expected data for %f0
	.word	0xff59ffc8,0x00000026		! Expected data for %f4
	.word	0x4c000000,0x000000ff		! Expected data for %f6
	.word	0x00000000,0xf230c3b5		! Expected data for %f8
	.word	0x67be2bff,0xff0000a0		! Expected data for %f12
	.word	0x000000ff,0xc8ff59ff		! Expected data for %f18
	.word	0x00000000,0xff000000		! Expected data for %f30
p0_check_pt_data_34:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x000000ff		! Expected data for %l0
	.word	0x00000000,0x00000000		! Expected data for %l1
	.word	0xffffffff,0xff6b53ff		! Expected data for %l2
	.word	0x00000000,0xffffffff		! Expected data for %l3
	.word	0x00000000,0x4c000000		! Expected data for %l4
	.word	0x00000000,0x000000ff		! Expected data for %l5
	.word	0x00000000,0xff1a59ff		! Expected data for %l7
	.word	0x8affffff,0xffffffff		! Expected data for %f2
	.word	0xff59ffc8,0x00000026		! Expected data for %f4
	.word	0x00000000,0x00006100		! Expected data for %f6
	.word	0xff000000,0x00000000		! Expected data for %f12
	.word	0x000000ff,0xff7cffff		! Expected data for %f18
	.word	0x00000000,0xb5c330f2		! Expected data for %f26
p0_check_pt_data_35:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x0000ff00,0x00000000		! Expected data for %l0
	.word	0x00000000,0x00000000		! Expected data for %l1
	.word	0x00000000,0xff000000		! Expected data for %l2
	.word	0x00000000,0x000000f4		! Expected data for %l4
	.word	0xffffffff,0xffffd800		! Expected data for %l5
	.word	0x00000000,0xff00ff00		! Expected data for %l6
	.word	0x00000000,0x00000000		! Expected data for %l7
	.word	0xf230c3b5,0x00000000		! Expected data for %f0
	.word	0xa00000ff,0xff2bbe67		! Expected data for %f2
	.word	0x8affffff,0xffffffff		! Expected data for %f4
	.word	0x007bbbbd,0x835e80db		! Expected data for %f6
	.word	0xe3d6eb97,0x6685ec48		! Expected data for %f8
	.word	0xff59ffc8,0x00000000		! Expected data for %f10
	.word	0xffffffff,0xff3795a8		! Expected data for %f12
	.word	0x000000b5,0xff2bbe67		! Expected data for %f14
	.word	0x00610000,0x00000000		! Expected data for %f22
	.word	0x00ec0066,0x03eb00ff		! Expected data for %f24
	.word	0x00006bff,0x8e0705b0		! Expected data for %f28
p0_check_pt_data_36:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0xff30c3b5		! Expected data for %l0
	.word	0x00000000,0x00000000		! Expected data for %l1
	.word	0xffffffff,0xffffc0ff		! Expected data for %l2
	.word	0x00000000,0x000000ff		! Expected data for %l3
	.word	0x00000000,0x00000000		! Expected data for %l4
	.word	0x00000000,0x00000000		! Expected data for %l5
	.word	0x00000000,0x0000ff00		! Expected data for %l6
	.word	0x00000000,0x00000000		! Expected data for %l7
	.word	0x000000ff,0xe5022705		! Expected data for %f0
	.word	0x8a000000,0x00000000		! Expected data for %f2
	.word	0x00000000,0x000679ff		! Expected data for %f4
	.word	0xe0e3fff9,0x000359a4		! Expected data for %f6
	.word	0xff59ffc8,0x6600ec00		! Expected data for %f8
	.word	0x00000000,0x00610000		! Expected data for %f10
	.word	0xd0000000,0x97e60f13		! Expected data for %f12
	.word	0x22873e41,0xb6b60000		! Expected data for %f14
	.word	0xffff7cff,0xff000000		! Expected data for %f16
	.word	0xff3795a8,0x00000000		! Expected data for %f18
	.word	0x00000000,0xff3795a8		! Expected data for %f20
	.word	0x4c000000,0x000000ff		! Expected data for %f22
	.word	0x00000000,0xf230c3b5		! Expected data for %f24
	.word	0x00000000,0xff000000		! Expected data for %f26
	.word	0x67be2bff,0xff0000a0		! Expected data for %f28
	.word	0x00000000,0xff0000d0		! Expected data for %f30
p0_check_pt_data_37:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0xe5022705		! Expected data for %l0
	.word	0x00000000,0xff000000		! Expected data for %l1
	.word	0x00000000,0x0000ff00		! Expected data for %l2
	.word	0x00000000,0x000000ff		! Expected data for %l3
	.word	0x00000000,0x00000000		! Expected data for %l5
	.word	0x00000000,0xff3795a8		! Expected data for %l6
	.word	0x00000000,0x00006100		! Expected data for %l7
	.word	0x000000ff,0xe5022705		! Expected data for %f0
	.word	0x8a000000,0x00000000		! Expected data for %f2
	.word	0x00000000,0x000679ff		! Expected data for %f4
	.word	0xe0e3fff9,0x000359a4		! Expected data for %f6
	.word	0xf230c3b5,0x00610000		! Expected data for %f10
	.word	0xff000000,0xb6b60000		! Expected data for %f14
	.word	0xb5000000,0x000000ff		! Expected data for %f16
	.word	0xff000000,0xc81a00f4		! Expected data for %f18
	.word	0xffffffff,0x008affff		! Expected data for %f20
	.word	0x00000000,0x00006bff		! Expected data for %f22
	.word	0xff000000,0xff6b0000		! Expected data for %f24
	.word	0x207e86ea,0xffffffff		! Expected data for %f26
	.word	0x00000000,0xffff7cf4		! Expected data for %f28
	.word	0x4c82db1d,0xb5c330f2		! Expected data for %f30
p0_check_pt_data_38:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x00000000		! Expected data for %l1
	.word	0x00000000,0x00000000		! Expected data for %l2
	.word	0x00000000,0x00000000		! Expected data for %l3
	.word	0x00000000,0x000000a8		! Expected data for %l4
	.word	0x00000000,0x00000000		! Expected data for %l5
	.word	0x00000000,0x00000000		! Expected data for %l6
	.word	0x00000000,0x00000000		! Expected data for %l7
	.word	0x000000ff,0xe5022705		! Expected data for %f0
	.word	0x8a000000,0x00000000		! Expected data for %f4
	.word	0xff000000,0x000359a4		! Expected data for %f6
	.word	0x000000fb,0x00000000		! Expected data for %f14
	.word	0xd0000000,0x00000000		! Expected data for %f16
	.word	0x052702e5,0xff000000		! Expected data for %f18
	.word	0xd0000000,0x97e60f13		! Expected data for %f20
	.word	0x007bbbbd,0x835e80db		! Expected data for %f22
	.word	0xa89537ff,0x6685ec48		! Expected data for %f24
	.word	0x5a2bbe67,0x67be2b5a		! Expected data for %f26
	.word	0x3f2cb25d,0x3e2dee16		! Expected data for %f28
	.word	0x22873e41,0x0bc8eac7		! Expected data for %f30
p0_check_pt_data_39:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0xf4000000		! Expected data for %l0
	.word	0x00000000,0xffffffff		! Expected data for %l1
	.word	0x00000000,0x00006100		! Expected data for %l2
	.word	0x00000000,0x00000000		! Expected data for %l3
	.word	0x00000000,0x00000000		! Expected data for %l4
	.word	0x00000000,0x00000000		! Expected data for %l5
	.word	0x00000000,0x000000ff		! Expected data for %l6
	.word	0x00000000,0x00000000		! Expected data for %l7
	.word	0x000000ff,0xe5022705		! Expected data for %f0
	.word	0x00000000,0x00000000		! Expected data for %f2
	.word	0xff000000,0x000359a4		! Expected data for %f6
	.word	0xf230c3b5,0xff3795a8		! Expected data for %f10
p0_check_pt_data_40:
	.word	0x00000000,0x00000000		! FPU Reg ld/st area
	.word	0x00000000,0x0000ffff		! Expected data for %l0
	.word	0x00000000,0x0000ff8a		! Expected data for %l1
	.word	0x00000000,0x00000000		! Expected data for %l2
	.word	0xffffffff,0xffffffff		! Expected data for %l3
	.word	0x00000000,0xffc0ffff		! Expected data for %l4
	.word	0x00000000,0x00ffffff		! Expected data for %l5
	.word	0xffffffff,0xffffffff		! Expected data for %l6
	.word	0x00000000,0x000000ff		! Expected data for %l7
	.word	0x00000000,0x00000000		! Expected data for %f2
	.word	0x8a000000,0x00000000		! Expected data for %f4
	.word	0x000000fb,0x00000000		! Expected data for %f6
	.word	0x8a000000,0x00000000		! Expected data for %f12
	.word	0x00000000,0xff0000d0		! Expected data for %f18
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
	.word	0xd2c3d65f,0xeadb1c81
	.word	0x00000000,0x00000002
	.word	0x37f78018,0x3a274552
	.word	0x00000000,0x00000003
	.word	0x5feffbf7,0xb98cb6d7
	.word	0x00000000,0x00000004
	.word	0xb60c6647,0xd4973acc
	.word	0x00000000,0x00000005
	.word	0x66c7cb18,0x60d4b2a0
	.word	0x00000000,0x00000006
	.word	0x07eb4b2f,0xcf56c4f7
	.word	0x00000000,0x00000007
	.word	0x5717e548,0x70e53433
	.word	0x00000000,0x00000008
	.word	0xf7e94290,0x6dc0f0b1
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
	.word	0x1cb6a49a,0x8b7274a2,0xdc55a41e,0x35513158
	.word	0x44f7283c,0x9902143e,0xf17a36b8,0x5fca4fb3
	.word	0x190c89c6,0x56f95e55,0x8b9de9cd,0xd9d69556
	.word	0x130fe697,0xd3bfcf8b,0xc988bdb8,0x5df73ecc
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
	.word	0xcbc11310,0xc3071a44,0x147762c2,0x86496f75
	.word	0x40f4c7d2,0x6abc173c,0x007bbbbd,0x835e80db
	.word	0xe3d6eb97,0x6685ec48,0x551ed02c,0xe51eb7d3
	.word	0x3f2cb25d,0x3e2dee16,0x22873e41,0x0bc8eac7
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
	.word	0xcf2cf651,0xebc2cc5f,0x95e97308,0x468285d3
	.word	0xbd3795a8,0x052702e5,0x61f359ff,0x4268c889
	.word	0xc6d1caf1,0x8d68389a,0x71687c50,0x099744c1
	.word	0x9ec55acd,0xa0d902a2,0xef7386bb,0x6b95bf3f
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
	.word	0xf4d847f6,0x20110ca0,0xb5c330f2,0xb7e5e7d9
	.word	0x865010a3,0xf8df3020,0xae0124bf,0x96bcaf58
	.word	0x102f9d1b,0xf650184e,0x0fb6e140,0x3d1c2039
	.word	0x1390a3a7,0x325384bb,0xc801c785,0x42576a2f
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
	.word	0x669a25d8,0x7f0a13da,0x78feb2e3,0x5fcbdd86
	.word	0x74a87872,0x09c3a4a8,0x8e0705b0,0xef662ee2
	.word	0x45dd6172,0xc3168c16,0x30850e60,0xea867e20
	.word	0x87ff338b,0x0668c80a,0xed96f7f6,0x62db824c
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
	.word	0x5ffa1028,0xc9fad25a,0x02f5caf9,0x794a8491
	.word	0x71339fa6,0xc90d1ade,0x7c425919,0xed342521
	.word	0xe40fd451,0x1fb7fb1f,0x9a552507,0xdaa47038
	.word	0x4b655d3b,0x39411183,0x69210a1b,0x9939f3c1
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
	.word	0xb63c0655,0x8ca1280f,0x9d974afb,0x0b651a9a
	.word	0xff7a94da,0xf596f078,0xa4590319,0xf9fbe3e0
	.word	0x3cf18691,0x57606edb,0x89e8739e,0xcc34bfeb
	.word	0x7c81cf36,0x5681b46c,0x8fe52c5d,0x77db6f55
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
	.word	0x3a591ac8,0xc2885361,0x0cc09206,0x721d1a44
	.word	0x0ccf3734,0xe9746bb4,0x7de5c496,0x982226b7
	.word	0x0e8b5533,0x22b7fa40,0x28cefcc5,0x5e95ef4c
	.word	0xbd6b53ba,0x5debeccd,0xeca45b45,0xd9bf64ea
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
	.word	0x10914887,0xc5e795f0,0xcbda6747,0x82fee86e
	.word	0x612de931,0x0a1d82a8,0x05fbb0f7,0x8147b36e
	.word	0x91d171d1,0x847dc99c,0x81f2f4db,0xfcc59b12
	.word	0x60f7ad60,0x72cbddad,0x4d55d001,0x2de6dbd2
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
	.word	0x0d904643,0x64d1f116,0x6697c257,0xb46d80e5
	.word	0xc72bbe67,0xb70a554f,0xa82261ac,0x7517a6c8
	.word	0x5519edac,0x525e6ab4,0x043d9dcd,0x676a6fdd
	.word	0xb1a403c5,0xd0529db3,0xb71ba0a2,0xbd5328af
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
	.word	0x5377abe8,0x3f0132d0,0x61b66dea,0xe545dd67
	.word	0xffffafe3,0x94e9022f,0xff795814,0xf47ca02d
	.word	0x031a783d,0xb6b67068,0x348aa427,0x35edcef8
	.word	0xfa62794f,0x602eff93,0x3498af52,0x7ae32cb8
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
	.word	0x49399308,0x70a2db7a,0xb78cd31e,0x4d53bfe4
	.word	0x74ea76f8,0x9542bdf2,0xdd893e8c,0x0a005f0c
	.word	0x86813ec1,0xd2f09e33,0x419e8199,0x88506935
	.word	0x4e478378,0x82559f9b,0xf55f280a,0xc63561c4
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
	.word	0x2f89f8fb,0xac925426,0x5a459f00,0xb8528a1c
	.word	0x0514ff5e,0xee03ee04,0x769fac2d,0xc511fcb3
	.word	0x13d90025,0xa97d9677,0x8a7d31b3,0x90266667
	.word	0xca713b74,0x6e6bb475,0x3ab671d5,0x6f64bbd1
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
	.word	0x1da153d8,0x9d60522b,0x1cd7ab82,0xdd0019d0
	.word	0x7001eef5,0x82434acb,0x750f95e4,0x6b639271
	.word	0x5b709345,0x1f091f08,0x210f5094,0x868cb043
	.word	0x0f8fc972,0x29586e06,0xaba53952,0x0348c438
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
	.word	0xfdf39b8f,0x28a41182,0x35e9660a,0xd8040a72
	.word	0x7ffa67e6,0x582dbc22,0x198d4e3b,0x5621c754
	.word	0xa3d7755b,0x8e46d939,0xc7fabccb,0xe9b18917
	.word	0x0dba8d95,0xed9d4785,0xc17a1155,0xeb423c31
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
	.word	0x824c7fc1,0x5d9a99b6,0x58f6e9e5,0xbf287bab
	.word	0xd8e6cde5,0x1df87f96,0x475e2f40,0x012f58a2
	.word	0x15ee89c6,0x2dbc9e8a,0xfb213ad8,0x24765d4f
	.word	0x48d78d9e,0x088f1595,0xfdd4e671,0xca136679
	.word	0x46d9e25a,0xee3d423e,0x69de1e78,0xfaf54c0b
	.word	0xf02fe716,0xbddd52de,0xa4bc700b,0x5d64fcf1
	.word	0xfe78c75c,0x9cc16e23,0x409331fc,0xa3347fe2
	.word	0xb9d00306,0xb1cc2aee,0x2d70e9bf,0x952f216a
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
	.word	0xb341b5d7,0x963b9519,0xb6416611,0xf66264cc
	.word	0xea293846,0x315801dd,0x2c276e0b,0x9d479123
	.word	0x592d0469,0xa8d150fc,0xc9dc5878,0x8282181f
	.word	0xbacbad56,0x9b1fd796,0xf2056cf5,0x1eb0696f
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
	.word	0x9933c8c8,0x95a223bb,0xf71a85ed,0x369ed4e0
	.word	0x877d0413,0x40b03d46,0xe4ef378b,0xe3442d86
	.word	0xed79f770,0x6e547899,0x5a5effc0,0x6cb080e7
	.word	0xd58c4066,0x624c54ec,0xaebd3d9d,0x694afd48
	.word	0x9f179ae4,0xb10aa81e,0x1cacfe2c,0xdd33a745
	.word	0x4b41d6fb,0xbae4dc1d,0x49eb47f5,0xdc9ede5a
	.word	0xd86fcba5,0x3904fd8d,0x17943f0b,0x2514319d
	.word	0x78dc7451,0xd760e20e,0x9f1302e5,0x2a9ec153
	.word	0xd8a93b1a,0xd6f9905a,0xfe13ce6f,0xbc44d8e5
	.word	0x3dd12f2b,0xef7cb150,0x9345c486,0x0f3af785
	.word	0x3e9c67fd,0x79eaa332,0xdb9c3ba7,0x2a379d7b
	.word	0x1dd60df8,0x5098ede7,0x676166bf,0x7e46a806
	.word	0xafbdcbcc,0x3c85dd80,0xae15df61,0x5c0763c6
	.word	0x66766d69,0x62e1560d,0x92d8ea41,0x038522bb
	.word	0xbb396585,0xf432b5c8,0x7a54171c,0x494569e6
	.word	0xe1037e6c,0xe5cd0632,0x025463c8,0x8e26ca65
	.word	0xd03e4a7a,0x7a607ab1,0xcd35260c,0x403f5be7
	.word	0xcacbc30e,0x6c8e3544,0xb6011ba7,0xa741376f
	.word	0x21ee2a8d,0xf0750a19,0x6142019a,0xdf5410bf
	.word	0xf6e9ac0d,0x8262f5b1,0x68794f4a,0xd8a2ec4a
	.word	0x7312ef3d,0x3e1f971f,0x7fa553b3,0x8940ef9e
	.word	0x0cac675b,0x7609b9d1,0xdf5f6842,0xe435592f
	.word	0x83b5ced7,0x26e1e9da,0xdcb79288,0xe72b6c77
	.word	0xf97d958a,0xe26ce9ca,0xb13a7560,0xcb8e5979
	.word	0xaa532710,0xf00dd386,0x5e8fe180,0xe7a3bb05
	.word	0x0f0b0806,0x72be38be,0xa9167f37,0x6b1d93d9
	.word	0x3b10a015,0x4ea4cec0,0x3588d02c,0xfbd72112
	.word	0x6a68f020,0x21ba2c6b,0x23319472,0xd88efabd
	.word	0x39ba67be,0x464c9006,0xd265a527,0x88273a59
	.word	0x6ce6d0c1,0xd2c38757,0x03501664,0x0153ec07
	.word	0x7ee24cc3,0x161e4157,0x83207f7e,0xc3e11085
	.word	0x59732567,0xaba9f63f,0x4b351e16,0x4c8093bb
share3_end:
