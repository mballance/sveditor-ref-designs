/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T2 Processor File: mpgen_3000_0.s
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
!	Seed = 626172935
!	Riesling can be on
!	1 Thread, 3000 lines
!	mpgen   created on May 4, 2009 (15:17:56), Version 2.81
!	mpgen_3000l_0.s created on Jun 26, 2009 (17:29:35)
!	RC file : random.rc
!	cmd = /import/n2-tools/release/tools/mpgen/mpgen,1.090504 -rc random.rc -o mpgen_3000l_0 -p 1 -l 3000

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

!	Initialize the input and output registers

!	Random code for Thread 0

thread_0:
	ta	T_CHANGE_PRIV		! Trap to Supervisor Mode
	set	p0_fsr,%g3
	ldx	[%g3],%fsr		! Set %fsr to 0000000000
	wrpr	%g0,7,%cleanwin
	call	p0_init_memory_pointers
	wr	%g0,0x80,%asi		! Setting default %asi to 80

!	Initialize the floating point registers for processor 0

	wr	%g0,0x4,%fprs		! Make sure fef is 1
	set	p0_init_freg,%g1
!	%f0  = 5e2e91c0 000fb2d1 0bccf0fe 104ef657
!	%f4  = 4c723aac 4b5c348d 7109264a 081e96f3
!	%f8  = 0f144758 7d1c3309 42f5ed56 5b366a4f
!	%f12 = 2e7f03c4 5b314a45 643cf222 019dec6b
	ldda	[%g1]ASI_BLK_P,%f0
	add	%g1,64,%g1
!	%f16 = 55be7bf0 137fd641 7ec7a0ae 72c55947
!	%f20 = 592c7bdc 0c6af2fd 14cb24fa 5ae1ace3
!	%f24 = 0cdc8f88 6e107c79 6f946b06 1f08a33f
!	%f28 = 76c802f4 40450eb5 58141ed2 6c0cb85b
	ldda	[%g1]ASI_BLK_P,%f16
	add	%g1,64,%g1
!	%f32 = 28b9e220 395005b1 452aac5e 4c192837
!	%f36 = 4dfaf90c 19677d6d 6bb43faa 7f0deed3
!	%f40 = 38bdd3b8 2eec51e9 5c54c4b6 119bc82f
!	%f44 = 7b4abe24 5f661f25 1b03e782 6f20304b
	ldda	[%g1]ASI_BLK_P,%f32

!	Set up the Graphics Status Register

	setx	0x4c3059f800000028,%g7,%g1 ! %gsr scale =  5, align = 0
	wr	%g1,%g0,%gsr		! %gsr = 4c3059f800000028

	wr	%g0,%y			! Clear %y register
	xorcc	%g0,%g0,%g3		! %g3 = 0, %ccr = 44
	membar	#Sync			! Force the block loads to complete

!	Start of Random Code for processor 0

p0_label_1:
!	Starting 10 instruction Store Burst
!	Mem[0000000030001410] = 76edd89c, %l6 = 0000000034fda9e0
	swapa	[%i0+%o5]0x81,%l6	! %l6 = 0000000076edd89c
!	Mem[0000000010041408] = 1e73c660, %l1 = 00000000e8682899
	swapa	[%i1+%o4]0x88,%l1	! %l1 = 000000001e73c660
!	%l4 = f23999fa, %l5 = 1089b5e5, Mem[0000000030081410] = 1fb2f55c 2f3d967d
	stda	%l4,[%i2+%o5]0x81	! Mem[0000000030081410] = f23999fa 1089b5e5
!	%o1 = deadbeefdeadbeef
	set	share1_start,%o1	! set %o1[0] to VA
!	%l2 = 01d0ce61bd8eae54, Mem[0000000020800000] = 770bc750
	sth	%l2,[%o1+%g0]		! Mem[0000000020800000] = ae54c750
!	Mem[0000000010001410] = 6ca78024, %l2 = 01d0ce61bd8eae54
	ldstuba	[%i0+%o5]0x88,%l2	! %l2 = 0000000000000024
!	%l4 = f23999fa, %l5 = 1089b5e5, Mem[0000000030001400] = b0fcde78 01dc367c
	stda	%l4,[%i0+%g0]0x89	! Mem[0000000030001400] = f23999fa 1089b5e5
!	%l7 = 30e5d92a353b38eb, %l0 = da8a5c52c2880eee, %y  = 00000000
	sdiv	%l7,%l0,%l1		! %l1 = 0000000000000000
	mov	%l0,%y			! %y = c2880eee
!	Mem[0000000010141400] = 6074a633, %l6 = 0000000076edd89c
	swapa	[%i5+%g0]0x88,%l6	! %l6 = 000000006074a633
!	%l4 = dc1b0be3f23999fa, Mem[0000000030081408] = 26460e2e
	stha	%l4,[%i2+%o4]0x81	! Mem[0000000030081408] = 99fa0e2e
!	%l5 = 87060b391089b5e5, Mem[00000000300c1408] = 8e414d16
	stwa	%l5,[%i3+%o4]0x89	! Mem[00000000300c1408] = 1089b5e5

p0_label_2:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001428] = 63070c16, %l1 = 0000000000000000, %asi = 80
	lduwa	[%i0+0x028]%asi,%l1	! %l1 = 0000000063070c16
!	Mem[0000000030081410] = e5b58910 fa9939f2, %l2 = 00000024, %l3 = 70ad231f
	ldda	[%i2+%o5]0x89,%l2	! %l2 = 00000000fa9939f2 00000000e5b58910
!	%l0 = da8a5c52c2880eee, %l2 = 00000000fa9939f2, %l3 = 00000000e5b58910
	xor	%l0,%l2,%l3		! %l3 = da8a5c523811371c
!	Mem[0000000030081410] = f23999fa, %l1 = 0000000063070c16
	ldsba	[%i2+%o5]0x81,%l1	! %l1 = fffffffffffffff2
!	Mem[00000000300c1408] = 1089b5e5, %l2 = 00000000fa9939f2
	ldsba	[%i3+%o4]0x89,%l2	! %l2 = ffffffffffffffe5
!	Mem[00000000100c1404] = 705b3131, %l7 = 30e5d92a353b38eb, %asi = 80
	lduwa	[%i3+0x004]%asi,%l7	! %l7 = 00000000705b3131
!	Mem[0000000010181400] = 6e9f54c0, %l0 = da8a5c52c2880eee
	ldsba	[%i6+%g0]0x80,%l0	! %l0 = 000000000000006e
!	Mem[00000000100c1424] = 4a62ad69, %l5 = 87060b391089b5e5
	ldsh	[%i3+0x024],%l5		! %l5 = 0000000000004a62
!	Mem[0000000010101410] = cdb9ff69ecc0586d, %f16 = 55be7bf0 137fd641
	ldda	[%i4+%o5]0x88,%f16	! %f16 = cdb9ff69 ecc0586d
!	Mem[0000000030001400] = 1089b5e5 f23999fa, %l0 = 0000006e, %l1 = fffffff2
	ldda	[%i0+%g0]0x89,%l0	! %l0 = 00000000f23999fa 000000001089b5e5

p0_label_3:
!	Starting 10 instruction Store Burst
!	Mem[0000000010001410] = 4df6a51d6ca780ff, %l7 = 00000000705b3131
	ldxa	[%i0+%o5]0x88,%l7	! %l7 = 4df6a51d6ca780ff
!	%l4 = dc1b0be3f23999fa, Mem[00000000100c1400] = a0835a32
	stba	%l4,[%i3+%g0]0x88	! Mem[00000000100c1400] = a0835afa
!	Mem[00000000300c1410] = 21d2ebbc, %l0 = 00000000f23999fa
	swapa	[%i3+%o5]0x81,%l0	! %l0 = 0000000021d2ebbc
!	%o2 = deadbeefdeadbeef
	set	share2_start,%o2	! set %o2[0] to VA
!	%l7 = 4df6a51d6ca780ff, Mem[00000000211c0000] = 1d8e7fb0
	sth	%l7,[%o2+%g0]		! Mem[00000000211c0000] = 80ff7fb0
!	%f28 = 76c802f4 40450eb5, Mem[00000000100c1400] = a0835afa 31315b70
	stda	%f28,[%i3+%g0]0x88	! Mem[00000000100c1400] = 76c802f4 40450eb5
!	%l7 = 4df6a51d6ca780ff, Mem[0000000010041410] = cc45db72
	stwa	%l7,[%i1+%o5]0x88	! Mem[0000000010041410] = 6ca780ff
!	%f18 = 7ec7a0ae 72c55947, Mem[0000000010141400] = 76edd89c f1e6a924
	stda	%f18,[%i5+%g0]0x88	! Mem[0000000010141400] = 7ec7a0ae 72c55947
!	Mem[0000000030041408] = e786ba04ce4a000c, %f10 = 42f5ed56 5b366a4f
	ldda	[%i1+%o4]0x89,%f10	! %f10 = e786ba04 ce4a000c
!	Mem[00000000211c0000] = 80ff7fb0, %l6 = 000000006074a633
	ldstub	[%o2+%g0],%l6		! %l6 = 0000000000000080
!	%l6 = 00000080, %l7 = 6ca780ff, Mem[0000000030101410] = 2a3bd21c 52d2083d
	stda	%l6,[%i4+%o5]0x81	! Mem[0000000030101410] = 00000080 6ca780ff

p0_label_4:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = 2cd4e237, %l3 = da8a5c523811371c
	lduwa	[%i2+%o5]0x88,%l3	! %l3 = 000000002cd4e237
!	Mem[0000000010141410] = ad2246044c1f7727, %l2 = ffffffffffffffe5
	ldxa	[%i5+%o5]0x88,%l2	! %l2 = ad2246044c1f7727
!	Mem[0000000030101408] = eee42d36, %l6 = 0000000000000080
	ldsha	[%i4+%o4]0x89,%l6	! %l6 = 0000000000002d36
!	Mem[0000000030181408] = 59db7bae, %l1 = 000000001089b5e5
	lduba	[%i6+%o4]0x81,%l1	! %l1 = 0000000000000059
!	Mem[0000000030041408] = ce4a000c, %l2 = ad2246044c1f7727
	ldswa	[%i1+%o4]0x89,%l2	! %l2 = ffffffffce4a000c
!	Mem[0000000030141410] = 39c5a87c, %l0 = 0000000021d2ebbc
	ldswa	[%i5+%o5]0x81,%l0	! %l0 = 0000000039c5a87c
!	Mem[0000000010041418] = 579bc26a6626ae93, %f18 = 7ec7a0ae 72c55947
	ldd	[%i1+0x018],%f18	! %f18 = 579bc26a 6626ae93
!	Mem[0000000010181410] = 6ba26dac 4b8fbb8d, %l4 = f23999fa, %l5 = 00004a62
	ldda	[%i6+%o5]0x80,%l4	! %l4 = 000000006ba26dac 000000004b8fbb8d
!	Mem[0000000030041400] = 66f02510 495ea6e1, %l6 = 00002d36, %l7 = 6ca780ff
	ldda	[%i1+%g0]0x81,%l6	! %l6 = 0000000066f02510 00000000495ea6e1
!	Mem[0000000030041400] = 66f02510 495ea6e1, %l0 = 39c5a87c, %l1 = 00000059
	ldda	[%i1+%g0]0x81,%l0	! %l0 = 0000000066f02510 00000000495ea6e1

p0_label_5:
!	Starting 10 instruction Store Burst
!	%f19 = 6626ae93, Mem[0000000030081400] = 703d7770
	sta	%f19,[%i2+%g0]0x89	! Mem[0000000030081400] = 6626ae93
!	%f18 = 579bc26a 6626ae93, %l3 = 000000002cd4e237
!	Mem[0000000010101418] = 5bca4e8a3124f633
	add	%i4,0x018,%g1
	stda	%f18,[%g1+%l3]ASI_PST16_PL ! Mem[0000000010101418] = 93ae26666ac2f633
!	%l1 = 00000000495ea6e1, Mem[00000000100c141f] = 7f022e53, %asi = 80
	stba	%l1,[%i3+0x01f]%asi	! Mem[00000000100c141c] = 7f022ee1
!	%l2 = ce4a000c, %l3 = 2cd4e237, Mem[0000000010101408] = 0dc8e53e 16757197
	stda	%l2,[%i4+%o4]0x80	! Mem[0000000010101408] = ce4a000c 2cd4e237
!	%l4 = 000000006ba26dac, Mem[0000000030081410] = f23999fa
	stwa	%l4,[%i2+%o5]0x81	! Mem[0000000030081410] = 6ba26dac
!	Mem[0000000010041408] = e8682899, %l1 = 00000000495ea6e1
	swapa	[%i1+%o4]0x88,%l1	! %l1 = 00000000e8682899
!	Mem[0000000030081400] = 93ae2666, %l5 = 000000004b8fbb8d
	ldstuba	[%i2+%g0]0x81,%l5	! %l5 = 0000000000000093
!	%l4 = 000000006ba26dac, Mem[0000000030141408] = 4ef8ff5b
	stwa	%l4,[%i5+%o4]0x89	! Mem[0000000030141408] = 6ba26dac
!	Mem[0000000030141408] = ac6da26b, %l1 = 00000000e8682899
	ldstuba	[%i5+%o4]0x81,%l1	! %l1 = 00000000000000ac
!	%f18 = 579bc26a 6626ae93, %l6 = 0000000066f02510
!	Mem[0000000030001408] = 6963f76e10ab1d07
	add	%i0,0x008,%g1
	stda	%f18,[%g1+%l6]ASI_PST8_S ! Mem[0000000030001408] = 6963f76a10ab1d07

p0_label_6:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = 7e7e340f, %l2 = ffffffffce4a000c
	ldswa	[%i2+%o4]0x88,%l2	! %l2 = 000000007e7e340f
!	Mem[0000000010181410] = 8dbb8f4b ac6da26b, %l2 = 7e7e340f, %l3 = 2cd4e237
	ldda	[%i6+%o5]0x88,%l2	! %l2 = 00000000ac6da26b 000000008dbb8f4b
!	Mem[0000000030141400] = 5b402690, %l6 = 0000000066f02510
	ldswa	[%i5+%g0]0x81,%l6	! %l6 = 000000005b402690
!	%o0 = deadbeefdeadbeef
	set	share0_start,%o0	! set %o0[0] to VA
!	Mem[00000000201c0000] = 2b9a2520, %l2 = 00000000ac6da26b
	lduh	[%o0+%g0],%l2		! %l2 = 0000000000002b9a
!	Mem[0000000030181408] = 59db7bae, %l1 = 00000000000000ac
	lduha	[%i6+%o4]0x81,%l1	! %l1 = 00000000000059db
!	Mem[0000000010001408] = 170af54bbed77569, %l3 = 000000008dbb8f4b
	ldxa	[%i0+%o4]0x88,%l3	! %l3 = 170af54bbed77569
!	Mem[00000000100c140c] = 1722cfb7, %l3 = 170af54bbed77569
	ldsb	[%i3+0x00c],%l3		! %l3 = 0000000000000017
!	Mem[0000000010081400] = 40735729, %l2 = 0000000000002b9a
	lduba	[%i2+%g0]0x88,%l2	! %l2 = 0000000000000029
!	Mem[0000000010101410] = ecc0586d, %f31 = 6c0cb85b
	lda	[%i4+%o5]0x88,%f31	! %f31 = ecc0586d
!	Code Fragment 3, seed = 910857
p0_fragment_1:
!	%l0 = 0000000066f02510
	setx	0xf931614b8159a0de,%g7,%l0 ! %l0 = f931614b8159a0de
!	%l1 = 00000000000059db
	setx	0x97062691fb5fd789,%g7,%l1 ! %l1 = 97062691fb5fd789
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = f931614b8159a0de
	setx	0x001e461c7bd5ea44,%g7,%l0 ! %l0 = 001e461c7bd5ea44
!	%l1 = 97062691fb5fd789
	setx	0x17db0200d9f25c0f,%g7,%l1 ! %l1 = 17db0200d9f25c0f
p0_fragment_1_end:

p0_label_7:
!	Starting 10 instruction Store Burst
!	Mem[0000000020800001] = ae54c750, %l2 = 0000000000000029
	ldstuba	[%o1+0x001]%asi,%l2	! %l2 = 0000000000000054
!	%l4 = 000000006ba26dac, imm = 0000000000000843, %l0 = 001e461c7bd5ea44
	xnor	%l4,0x843,%l0		! %l0 = ffffffff945d9a10
!	%f17 = ecc0586d, %f18 = 579bc26a, %f27 = 1f08a33f
	fdivs	%f17,%f18,%f27		! %f27 = d49e10cd
!	Mem[0000000010181400] = 6e9f54c0, %l7 = 00000000495ea6e1
	swapa	[%i6+%g0]0x80,%l7	! %l7 = 000000006e9f54c0
!	%o3 = deadbeefdeadbeef
	set	share3_start,%o3	! set %o3[0] to VA
!	Mem[0000000021800100] = 6a78c6a0, %l0 = ffffffff945d9a10
	ldstub	[%o3+0x100],%l0		! %l0 = 000000000000006a
!	%l2 = 0000000000000054, Mem[000000001014142a] = 28ae00f6, %asi = 80
	stha	%l2,[%i5+0x02a]%asi	! Mem[0000000010141428] = 28ae0054
!	%l4 = 6ba26dac, %l5 = 00000093, Mem[00000000100c1400] = b50e4540 f402c876
	std	%l4,[%i3+%g0]		! Mem[00000000100c1400] = 6ba26dac 00000093
!	Mem[0000000010181410] = ac6da26b, %l5 = 0000000000000093
	ldstuba	[%i6+%o5]0x88,%l5	! %l5 = 000000000000006b
!	Mem[000000001008142e] = 0e6a01cf, %l0 = 000000000000006a, %asi = 80
	ldsba	[%i2+0x02e]%asi,%l0	! %l0 = 0000000000000001
!	%l3 = 0000000000000017, Mem[0000000010141438] = 0004d7c2
	sth	%l3,[%i5+0x038]		! Mem[0000000010141438] = 0017d7c2

p0_label_8:
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = bde40559 e0a9fd34, %l4 = 6ba26dac, %l5 = 0000006b
	ldda	[%i0+%o5]0x89,%l4	! %l4 = 00000000e0a9fd34 00000000bde40559
!	Mem[0000000010141418] = 225007ea, %l6 = 000000005b402690
	lduh	[%i5+0x018],%l6		! %l6 = 0000000000002250
!	Mem[0000000010081410] = 2cd4e237, %l4 = 00000000e0a9fd34
	lduwa	[%i2+%o5]0x88,%l4	! %l4 = 000000002cd4e237
!	Mem[0000000030041410] = 7f03eefc4732259d, %l5 = 00000000bde40559
	ldxa	[%i1+%o5]0x81,%l5	! %l5 = 7f03eefc4732259d
!	%f10 = e786ba04, %f14 = 643cf222
	fcmps	%fcc1,%f10,%f14		! %fcc1 = 1
!	Mem[0000000021800000] = 64f595e0, %l6 = 0000000000002250, %asi = 80
	ldsha	[%o3+0x000]%asi,%l6	! %l6 = 00000000000064f5
!	Mem[0000000010101430] = 2441720434b01785, %f4  = 4c723aac 4b5c348d, %asi = 80
	ldda	[%i4+0x030]%asi,%f4 	! %f4  = 24417204 34b01785
!	%l3 = 0000000000000017, %l2 = 0000000000000054, %y  = c2880eee
	smul	%l3,%l2,%l5		! %l5 = 000000000000078c, %y = 00000000
	membar	#Sync			! Added by membar checker (1)
!	Mem[0000000030101400] = 17473e30 23a72781 362de4ee 19fae487
!	Mem[0000000030101410] = 00000080 6ca780ff 20c79d3a 4ae41c23
!	Mem[0000000030101420] = 1026b9c8 64f295b9 636d5746 7d1d367f
!	Mem[0000000030101430] = 50354134 0dc16bf5 04e3bf12 6f7caf9b
	ldda	[%i4+%g0]ASI_BLK_S,%f16	! Block Load from 0000000030101400
!	%l7 = 000000006e9f54c0, %l5 = 000000000000078c, %l3 = 0000000000000017
	sdivx	%l7,%l5,%l3		! %l3 = 00000000000ea875

p0_label_9:
!	Starting 10 instruction Store Burst
!	Mem[0000000010181408] = fe0bf335, %l1 = 17db0200d9f25c0f
	ldstuba	[%i6+%o4]0x88,%l1	! %l1 = 0000000000000035
!	Mem[00000000211c0000] = ffff7fb0, %l6 = 00000000000064f5
	ldstuba	[%o2+0x000]%asi,%l6	! %l6 = 00000000000000ff
!	%l6 = 00000000000000ff, Mem[00000000201c0001] = 2b9a2520, %asi = 80
	stba	%l6,[%o0+0x001]%asi	! Mem[00000000201c0000] = 2bff2520
!	Mem[0000000010181408] = fff30bfe, %l1 = 0000000000000035
	swapa	[%i6+%o4]0x80,%l1	! %l1 = 00000000fff30bfe
!	%l4 = 000000002cd4e237, %l0 = 0000000000000001, %l4 = 000000002cd4e237
	and	%l4,%l0,%l4		! %l4 = 0000000000000001
!	%l7 = 000000006e9f54c0, Mem[0000000030181408] = 59db7bae
	stha	%l7,[%i6+%o4]0x81	! Mem[0000000030181408] = 54c07bae
!	%l2 = 0000000000000054, Mem[0000000010001408] = bed77569
	stha	%l2,[%i0+%o4]0x88	! Mem[0000000010001408] = bed70054
	membar	#Sync			! Added by membar checker (2)
!	%f8  = 0f144758 7d1c3309, Mem[0000000030101400] = 17473e30 23a72781
	stda	%f8 ,[%i4+%g0]0x81	! Mem[0000000030101400] = 0f144758 7d1c3309
!	Mem[0000000030101408] = 362de4ee, %l4 = 0000000000000001
	swapa	[%i4+%o4]0x81,%l4	! %l4 = 00000000362de4ee
!	%f29 = 0dc16bf5, Mem[0000000010141408] = 121f409e
	sta	%f29,[%i5+%o4]0x80	! Mem[0000000010141408] = 0dc16bf5

p0_label_10:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141408] = 0dc16bf50d71c377, %l3 = 00000000000ea875
	ldxa	[%i5+%o4]0x80,%l3	! %l3 = 0dc16bf50d71c377
!	Mem[00000000100c1434] = 38d552a5, %l3 = 0dc16bf50d71c377
	ldsw	[%i3+0x034],%l3		! %l3 = 0000000038d552a5
!	Mem[0000000030081408] = 2e0efa99, %l5 = 000000000000078c
	lduba	[%i2+%o4]0x89,%l5	! %l5 = 0000000000000099
!	%f2  = 0bccf0fe, %f14 = 643cf222
	fcmps	%fcc3,%f2 ,%f14		! %fcc3 = 1
!	Mem[0000000030181410] = 2d486edc478339fd, %l4 = 00000000362de4ee
	ldxa	[%i6+%o5]0x81,%l4	! %l4 = 2d486edc478339fd
!	Mem[0000000010101428] = 54f28996, %l2 = 0000000000000054, %asi = 80
	ldsba	[%i4+0x028]%asi,%l2	! %l2 = 0000000000000054
!	Mem[0000000030041408] = 0c004ace, %l7 = 000000006e9f54c0
	lduwa	[%i1+%o4]0x81,%l7	! %l7 = 000000000c004ace
!	Mem[00000000300c1400] = d045cc7e, %l0 = 0000000000000001
	ldsba	[%i3+%g0]0x89,%l0	! %l0 = 000000000000007e
!	Mem[00000000100c1410] = 4e6f528c704480ed, %f28 = 50354134 0dc16bf5, %asi = 80
	ldda	[%i3+0x010]%asi,%f28	! %f28 = 4e6f528c 704480ed
!	Mem[0000000010041430] = 31f302e417db58e5, %f14 = 643cf222 019dec6b, %asi = 80
	ldda	[%i1+0x030]%asi,%f14	! %f14 = 31f302e4 17db58e5

p0_label_11:
!	Starting 10 instruction Store Burst
!	%l6 = 00000000000000ff, Mem[0000000010141400] = 72c55947
	stha	%l6,[%i5+%g0]0x88	! Mem[0000000010141400] = 72c500ff
!	%l0 = 000000000000007e, Mem[0000000030141410] = 7ca8c539
	stba	%l0,[%i5+%o5]0x89	! Mem[0000000030141410] = 7ca8c57e
!	Mem[0000000010041400] = 1cf652e0, %l2 = 0000000000000054
	ldstuba	[%i1+%g0]0x80,%l2	! %l2 = 000000000000001c
!	%l5 = 0000000000000099, Mem[0000000010141408] = 0dc16bf5
	stwa	%l5,[%i5+%o4]0x80	! Mem[0000000010141408] = 00000099
!	Mem[0000000010101408] = ce4a000c, %l6 = 00000000000000ff
	swapa	[%i4+%o4]0x80,%l6	! %l6 = 00000000ce4a000c
!	%f8  = 0f144758, Mem[0000000010081410] = 37e2d42c
	sta	%f8 ,[%i2+%o5]0x80	! Mem[0000000010081410] = 0f144758
!	%f12 = 2e7f03c4 5b314a45, Mem[00000000100c1418] = 7ae5052a 7f022ee1, %asi = 80
	stda	%f12,[%i3+0x018]%asi	! Mem[00000000100c1418] = 2e7f03c4 5b314a45
!	%l4 = 478339fd, %l5 = 00000099, Mem[0000000030101410] = 00000080 6ca780ff
	stda	%l4,[%i4+%o5]0x81	! Mem[0000000030101410] = 478339fd 00000099
!	Mem[0000000010041408] = 495ea6e1, %l3 = 0000000038d552a5
	swapa	[%i1+%o4]0x88,%l3	! %l3 = 00000000495ea6e1
!	%l2 = 0000001c, %l3 = 495ea6e1, Mem[0000000030141410] = 7ec5a87c 4f4b091d
	stda	%l2,[%i5+%o5]0x81	! Mem[0000000030141410] = 0000001c 495ea6e1

p0_label_12:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = 29577340, %l5 = 0000000000000099
	ldsw	[%i2+%g0],%l5		! %l5 = 0000000029577340
!	Mem[0000000030041400] = e1a65e491025f066, %f26 = 636d5746 7d1d367f
	ldda	[%i1+%g0]0x89,%f26	! %f26 = e1a65e49 1025f066
!	Mem[0000000030001400] = fa9939f2 e5b58910 6963f76a 10ab1d07
!	Mem[0000000030001410] = 34fda9e0 5905e4bd 0a5837ba 284fbca3
!	Mem[0000000030001420] = 70658848 75e31a39 22bef9c6 5100beff
!	Mem[0000000030001430] = 54fb57b4 57ef1875 4424e992 4c3ca01b
	ldda	[%i0+%g0]ASI_BLK_AIUSL,%f16	! Block Load from 0000000030001400
!	Mem[0000000010181408] = 35000000, %l3 = 00000000495ea6e1
	ldsha	[%i6+%o4]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000030101410] = 478339fd00000099, %l7 = 000000000c004ace
	ldxa	[%i4+%o5]0x81,%l7	! %l7 = 478339fd00000099
!	Mem[0000000010081438] = 774f67a2751f1beb, %l4 = 2d486edc478339fd, %asi = 80
	ldxa	[%i2+0x038]%asi,%l4	! %l4 = 774f67a2751f1beb
!	Mem[00000000100c1400] = ac6da26b, %l1 = 00000000fff30bfe
	lduwa	[%i3+%g0]0x88,%l1	! %l1 = 00000000ac6da26b
!	Mem[0000000030141408] = ff6da26b 67d10e67, %l6 = ce4a000c, %l7 = 00000099
	ldda	[%i5+%o4]0x81,%l6	! %l6 = 00000000ff6da26b 0000000067d10e67
!	Mem[0000000030181408] = 54c07bae, %l2 = 000000000000001c
	ldsba	[%i6+%o4]0x81,%l2	! %l2 = 0000000000000054
!	Mem[0000000010181410] = ac6da2ff, %l7 = 0000000067d10e67
	lduba	[%i6+%o5]0x88,%l7	! %l7 = 00000000000000ff

p0_label_13:
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1400] = d045cc7e, %l1 = 00000000ac6da26b
	ldstuba	[%i3+%g0]0x89,%l1	! %l1 = 000000000000007e
!	%f12 = 2e7f03c4 5b314a45, Mem[0000000030081410] = 6ba26dac 1089b5e5
	stda	%f12,[%i2+%o5]0x81	! Mem[0000000030081410] = 2e7f03c4 5b314a45
!	Mem[0000000010141410] = 27771f4c, %l6 = 00000000ff6da26b
	lduha	[%i5+%o5]0x80,%l6	! %l6 = 0000000000002777
!	%f20 = bde40559 e0a9fd34, Mem[0000000010101410] = 6d58c0ec 69ffb9cd
	stda	%f20,[%i4+%o5]0x80	! Mem[0000000010101410] = bde40559 e0a9fd34
!	Mem[0000000030001410] = e0a9fd34, %l6 = 0000000000002777
	ldstuba	[%i0+%o5]0x89,%l6	! %l6 = 0000000000000034
!	%f24 = 391ae375 48886570, Mem[0000000030141410] = 1c000000 e1a65e49
	stda	%f24,[%i5+%o5]0x89	! Mem[0000000030141410] = 391ae375 48886570
!	%l3 = 0000000000000000, Mem[0000000010181410] = ac6da2ff
	stwa	%l3,[%i6+%o5]0x88	! Mem[0000000010181410] = 00000000
!	%f10 = e786ba04 ce4a000c, %l1 = 000000000000007e
!	Mem[00000000300c1418] = 6b451bda7e3bfc43
	add	%i3,0x018,%g1
	stda	%f10,[%g1+%l1]ASI_PST8_S ! Mem[00000000300c1418] = 6b86ba04ce4a0043
!	Mem[0000000030001408] = 6963f76a, %l6 = 0000000000000034
	ldstuba	[%i0+%o4]0x81,%l6	! %l6 = 0000000000000069
!	%f18 = 071dab10 6af76369, Mem[0000000030141410] = 70658848 75e31a39
	stda	%f18,[%i5+%o5]0x81	! Mem[0000000030141410] = 071dab10 6af76369

p0_label_14:
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = 10ab1d07, %l4 = 774f67a2751f1beb
	ldsha	[%i5+%o5]0x89,%l4	! %l4 = 0000000000001d07
!	Mem[0000000010141400] = 72c500ff, %l2 = 0000000000000054
	ldsha	[%i5+%g0]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[00000000300c1410] = f23999fa, %l2 = 00000000000000ff
	ldswa	[%i3+%o5]0x81,%l2	! %l2 = fffffffff23999fa
!	Mem[00000000100c1410] = 4e6f528c, %l6 = 0000000000000069
	ldsha	[%i3+%o5]0x80,%l6	! %l6 = 0000000000004e6f
!	Mem[0000000030001408] = 6af763ff, %l2 = fffffffff23999fa
	lduba	[%i0+%o4]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010081410] = 0f144758, %l0 = 000000000000007e
	ldsba	[%i2+%o5]0x80,%l0	! %l0 = 000000000000000f
!	Mem[0000000010181408] = 00000035, %l6 = 0000000000004e6f
	lduba	[%i6+%o4]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000010141400] = 72c500ff, %f14 = 31f302e4
	lda	[%i5+%g0]0x88,%f14	! %f14 = 72c500ff
!	Mem[0000000010141408] = 000000990d71c377, %l0 = 000000000000000f
	ldxa	[%i5+%o4]0x80,%l0	! %l0 = 000000990d71c377
!	Mem[0000000010141408] = 00000099, %l2 = 00000000000000ff
	lduwa	[%i5+%o4]0x80,%l2	! %l2 = 0000000000000099

p0_label_15:
!	Starting 10 instruction Store Burst
!	%f6  = 7109264a 081e96f3, %l4 = 0000000000001d07
!	Mem[0000000030101420] = 1026b9c864f295b9
	add	%i4,0x020,%g1
	stda	%f6,[%g1+%l4]ASI_PST16_S ! Mem[0000000030101420] = 1026264a081e96f3
!	Mem[0000000010081400] = 29577340, %l7 = 00000000000000ff
	ldstuba	[%i2+%g0]0x80,%l7	! %l7 = 0000000000000029
!	Mem[0000000030101400] = 5847140f, %l2 = 0000000000000099
	swapa	[%i4+%g0]0x89,%l2	! %l2 = 000000005847140f
!	Mem[00000000100c1413] = 4e6f528c, %l2 = 000000005847140f
	ldstuba	[%i3+0x013]%asi,%l2	! %l2 = 000000000000008c
!	%l4 = 0000000000001d07, Mem[0000000030101410] = fd398347
	stba	%l4,[%i4+%o5]0x89	! Mem[0000000030101410] = fd398307
!	Mem[0000000030001400] = fa9939f2 e5b58910 ff63f76a 10ab1d07
!	%f0  = 5e2e91c0 000fb2d1 0bccf0fe 104ef657
!	%f4  = 24417204 34b01785 7109264a 081e96f3
!	%f8  = 0f144758 7d1c3309 e786ba04 ce4a000c
!	%f12 = 2e7f03c4 5b314a45 72c500ff 17db58e5
	stda	%f0 ,[%i0+%g0]ASI_COMMIT_S	! Block Store to 0000000030001400
!	%f2  = 0bccf0fe 104ef657, Mem[00000000300c1408] = 1089b5e5 a76aaa0c
	stda	%f2 ,[%i3+%o4]0x89	! Mem[00000000300c1408] = 0bccf0fe 104ef657
!	%f28 = 7518ef57, Mem[000000001014142c] = 41bd6b6f
	sta	%f28,[%i5+0x02c]%asi	! Mem[000000001014142c] = 7518ef57
!	%l2 = 0000008c, %l3 = 00000000, Mem[0000000030041408] = ce4a000c e786ba04
	stda	%l2,[%i1+%o4]0x89	! Mem[0000000030041408] = 0000008c 00000000
!	%l2 = 0000008c, %l3 = 00000000, Mem[0000000010081408] = 7e7e340f d7ddc106
	stda	%l2,[%i2+%o4]0x88	! Mem[0000000010081408] = 0000008c 00000000

p0_label_16:
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = a1cc1e7a d045ccff, %l4 = 00001d07, %l5 = 29577340
	ldda	[%i3+%g0]0x89,%l4	! %l4 = 00000000d045ccff 00000000a1cc1e7a
!	%f2  = 0bccf0fe, %f1  = 000fb2d1, %f16 = 1089b5e5
	fsubs	%f2 ,%f1 ,%f16		! tt=0x22, %l0 = 000000990d71c399
!	Mem[0000000010041428] = 4e24c376597d93ef, %f28 = 7518ef57 b457fb54
	ldd	[%i1+0x028],%f28	! %f28 = 4e24c376 597d93ef
!	Mem[000000001014141d] = 6b606e13, %l1 = 000000000000007e
	ldsb	[%i5+0x01d],%l1		! %l1 = 0000000000000060
!	Mem[00000000201c0000] = 2bff2520, %l5 = 00000000a1cc1e7a
	ldsh	[%o0+%g0],%l5		! %l5 = 0000000000002bff
!	Mem[0000000010101410] = bde40559, %l2 = 000000000000008c
	ldsba	[%i4+%o5]0x80,%l2	! %l2 = ffffffffffffffbd
!	Mem[0000000010081410] = 0d789c765847140f, %l0 = 000000990d71c399
	ldxa	[%i2+%o5]0x88,%l0	! %l0 = 0d789c765847140f
!	Mem[0000000010101410] = bde40559, %f29 = 597d93ef
	lda	[%i4+%o5]0x80,%f29	! %f29 = bde40559
	membar	#Sync			! Added by membar checker (3)
!	Mem[0000000030001400] = 5e2e91c0, %f27 = c6f9be22
	lda	[%i0+%g0]0x81,%f27	! %f27 = 5e2e91c0
!	%f15 = 17db58e5, %f19 = 6af76369
	fcmpes	%fcc0,%f15,%f19		! %fcc0 = 1

p0_label_17:
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1408] = def9d754, %l0 = 0d789c765847140f
	ldstuba	[%i3+%o4]0x88,%l0	! %l0 = 0000000000000054
!	%f4  = 24417204 34b01785, Mem[0000000010001410] = 6ca780ff 4df6a51d
	stda	%f4 ,[%i0+%o5]0x88	! Mem[0000000010001410] = 24417204 34b01785
!	%f8  = 0f144758 7d1c3309, Mem[0000000010181400] = e1a65e49 d189e732
	stda	%f8 ,[%i6+%g0]0x88	! Mem[0000000010181400] = 0f144758 7d1c3309
!	%f30 = 1ba03c4c 92e92444, Mem[0000000010181410] = 00000000 4b8fbb8d
	stda	%f30,[%i6+%o5]0x80	! Mem[0000000010181410] = 1ba03c4c 92e92444
!	Mem[00000000300c1410] = f23999fa, %l7 = 0000000000000029
	swapa	[%i3+%o5]0x81,%l7	! %l7 = 00000000f23999fa
!	%l0 = 00000054, %l1 = 00000060, Mem[0000000010141400] = 72c500ff 7ec7a0ae
	stda	%l0,[%i5+%g0]0x88	! Mem[0000000010141400] = 00000054 00000060
!	%l0 = 0000000000000054, Mem[0000000010141408] = 99000000
	stba	%l0,[%i5+%o4]0x88	! Mem[0000000010141408] = 99000054
!	%l2 = ffffffffffffffbd, Mem[0000000030141400] = 9026405b
	stba	%l2,[%i5+%g0]0x89	! Mem[0000000030141400] = 902640bd
!	Mem[0000000010101408] = ff000000, %l2 = ffffffffffffffbd
	ldstuba	[%i4+%o4]0x88,%l2	! %l2 = 0000000000000000
!	%f14 = 72c500ff 17db58e5, %l7 = 00000000f23999fa
!	Mem[0000000030001420] = 0f1447587d1c3309
	add	%i0,0x020,%g1
	stda	%f14,[%g1+%l7]ASI_PST16_SL ! Mem[0000000030001420] = 0f14db177d1cc572

p0_label_18:
!	Starting 10 instruction Load Burst
!	%l5 = 0000000000002bff, %l4 = 00000000d045ccff, %l5 = 0000000000002bff
	andn	%l5,%l4,%l5		! %l5 = 0000000000002300
!	Mem[0000000030041400] = 66f02510 495ea6e1, %l6 = 00000000, %l7 = f23999fa
	ldda	[%i1+%g0]0x81,%l6	! %l6 = 0000000066f02510 00000000495ea6e1
!	Mem[0000000030041410] = fcee037f, %l2 = 0000000000000000
	ldsha	[%i1+%o5]0x89,%l2	! %l2 = 000000000000037f
!	Mem[000000001014140c] = 0d71c377, %f7  = 081e96f3
	lda	[%i5+0x00c]%asi,%f7 	! %f7 = 0d71c377
!	Mem[0000000030001408] = 0bccf0fe 104ef657, %l0 = 00000054, %l1 = 00000060
	ldda	[%i0+%o4]0x81,%l0	! %l0 = 000000000bccf0fe 00000000104ef657
	membar	#Sync			! Added by membar checker (4)
!	Mem[0000000010101400] = 2f578400 37787411 ff0000ff 2cd4e237
!	Mem[0000000010101410] = bde40559 e0a9fd34 93ae2666 6ac2f633
!	Mem[0000000010101420] = 6c1ca198 5225bc49 54f28996 0cd1ed8f
!	Mem[0000000010101430] = 24417204 34b01785 40bf4262 5e87d3ab
	ldda	[%i4+%g0]ASI_BLK_P,%f0 	! Block Load from 0000000010101400
!	Mem[0000000010001417] = 04724124, %l0 = 000000000bccf0fe
	ldsb	[%i0+0x017],%l0		! %l0 = 0000000000000024
!	Mem[0000000030001410] = 8517b03404724124, %f18 = 071dab10 6af76369
	ldda	[%i0+%o5]0x89,%f18	! %f18 = 8517b034 04724124
!	Mem[0000000030001408] = fef0cc0b, %l4 = 00000000d045ccff
	ldsha	[%i0+%o4]0x89,%l4	! %l4 = ffffffffffffcc0b
!	%f22 = a3bc4f28, %f16 = 1089b5e5, %f22 = a3bc4f28
	fsubs	%f22,%f16,%f22		! %f22 = a3bc4f28

p0_label_19:
!	Starting 10 instruction Store Burst
!	Mem[0000000030141410] = 071dab10, %l6 = 0000000066f02510
	ldstuba	[%i5+%o5]0x81,%l6	! %l6 = 0000000000000007
!	%l4 = ffffcc0b, %l5 = 00002300, Mem[0000000030101410] = 078339fd 00000099
	stda	%l4,[%i4+%o5]0x81	! Mem[0000000030101410] = ffffcc0b 00002300
!	Mem[0000000030181400] = f0fe0e08, %l2 = 000000000000037f
	swapa	[%i6+%g0]0x89,%l2	! %l2 = 00000000f0fe0e08
!	%l6 = 0000000000000007, Mem[0000000010181430] = 422f16c41c793145, %asi = 80
	stxa	%l6,[%i6+0x030]%asi	! Mem[0000000010181430] = 0000000000000007
!	%f11 = 0cd1ed8f, Mem[0000000010001408] = bed70054
	sta	%f11,[%i0+%o4]0x88	! Mem[0000000010001408] = 0cd1ed8f
	membar	#Sync			! Added by membar checker (5)
!	%f12 = 24417204 34b01785, %l3 = 0000000000000000
!	Mem[0000000010101438] = 40bf42625e87d3ab
	add	%i4,0x038,%g1
	stda	%f12,[%g1+%l3]ASI_PST32_P ! Mem[0000000010101438] = 40bf42625e87d3ab
!	%f2  = ff0000ff 2cd4e237, Mem[0000000030141408] = ff6da26b 67d10e67
	stda	%f2 ,[%i5+%o4]0x81	! Mem[0000000030141408] = ff0000ff 2cd4e237
!	Mem[0000000030041408] = 0000008c, %l0 = 0000000000000024
	swapa	[%i1+%o4]0x89,%l0	! %l0 = 000000000000008c
!	Mem[0000000010101400] = 2f578400, %l3 = 0000000000000000
	ldstuba	[%i4+%g0]0x80,%l3	! %l3 = 000000000000002f
!	%l6 = 0000000000000007, Mem[00000000300c1410] = 00000029
	stha	%l6,[%i3+%o5]0x81	! Mem[00000000300c1410] = 00070029

p0_label_20:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = 0000008c, %l2 = 00000000f0fe0e08
	lduwa	[%i2+%o4]0x88,%l2	! %l2 = 000000000000008c
!	Mem[00000000211c0000] = ffff7fb0, %l4 = ffffffffffffcc0b, %asi = 80
	ldsha	[%o2+0x000]%asi,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000030141408] = ff0000ff, %l0 = 000000000000008c
	lduha	[%i5+%o4]0x81,%l0	! %l0 = 000000000000ff00
!	Mem[0000000030041400] = 1025f066, %l2 = 000000000000008c
	ldsba	[%i1+%g0]0x89,%l2	! %l2 = 0000000000000066
!	Mem[0000000010101408] = ff0000ff2cd4e237, %f18 = 8517b034 04724124
	ldda	[%i4+%o4]0x80,%f18	! %f18 = ff0000ff 2cd4e237
!	Mem[0000000021800080] = 04063640, %l6 = 0000000000000007, %asi = 80
	lduha	[%o3+0x080]%asi,%l6	! %l6 = 0000000000000406
!	Mem[0000000030181400] = 0000037f, %l0 = 000000000000ff00
	ldsba	[%i6+%g0]0x89,%l0	! %l0 = 000000000000007f
!	Mem[0000000030001400] = d1b20f00c0912e5e, %l4 = ffffffffffffffff
	ldxa	[%i0+%g0]0x89,%l4	! %l4 = d1b20f00c0912e5e
!	Mem[0000000010081430] = 4b7f8d44, %l6 = 0000000000000406, %asi = 80
	lduba	[%i2+0x030]%asi,%l6	! %l6 = 000000000000004b
!	%l7 = 00000000495ea6e1, immd = 0000000000000ac5, %l6  = 000000000000004b
	mulx	%l7,0xac5,%l6		! %l6 = 00000316285b3525

p0_label_21:
!	Starting 10 instruction Store Burst
!	%l5 = 0000000000002300, Mem[0000000030101400] = 00000099
	stba	%l5,[%i4+%g0]0x89	! Mem[0000000030101400] = 00000000
!	%f6  = 93ae2666, Mem[0000000030141400] = 902640bd
	sta	%f6 ,[%i5+%g0]0x89	! Mem[0000000030141400] = 93ae2666
!	%f18 = ff0000ff, %f26 = ffbe0051, %f21 = e0a9fd34
	fsubs	%f18,%f26,%f21		! %f21 = fffe0051
!	Mem[0000000010101408] = ff0000ff, %l1 = 00000000104ef657
	swapa	[%i4+%o4]0x88,%l1	! %l1 = 00000000ff0000ff
!	%l7 = 00000000495ea6e1, Mem[0000000030041408] = 2400000000000000
	stxa	%l7,[%i1+%o4]0x81	! Mem[0000000030041408] = 00000000495ea6e1
!	%l6 = 285b3525, %l7 = 495ea6e1, Mem[0000000030041408] = 00000000 e1a65e49
	stda	%l6,[%i1+%o4]0x89	! Mem[0000000030041408] = 285b3525 495ea6e1
!	%l7 = 00000000495ea6e1, Mem[0000000030041408] = 25355b28
	stba	%l7,[%i1+%o4]0x81	! Mem[0000000030041408] = e1355b28
!	Mem[0000000010001438] = 24b94ce27411242b, %l0 = 000000000000007f, %l4 = d1b20f00c0912e5e
	add	%i0,0x38,%g1
	casxa	[%g1]0x80,%l0,%l4	! %l4 = 24b94ce27411242b
!	Mem[0000000010181410] = 4c3ca01b, %l1 = 00000000ff0000ff
	ldstuba	[%i6+%o5]0x88,%l1	! %l1 = 000000000000001b
!	%l3 = 000000000000002f, Mem[0000000030101408] = 01000000
	stba	%l3,[%i4+%o4]0x89	! Mem[0000000030101408] = 0100002f

p0_label_22:
!	Starting 10 instruction Load Burst
!	%l2 = 0000000000000066, Mem[0000000030041408] = 285b35e1
	stwa	%l2,[%i1+%o4]0x89	! Mem[0000000030041408] = 00000066
!	Mem[0000000010181420] = 6e5eea58, %l5 = 0000000000002300
	ldub	[%i6+0x020],%l5		! %l5 = 000000000000006e
!	Mem[0000000010041410] = 6ca780ff, %l5 = 000000000000006e
	lduwa	[%i1+%o5]0x88,%l5	! %l5 = 000000006ca780ff
!	Mem[0000000010141408] = 99000054, %l0 = 000000000000007f
	lduha	[%i5+%o4]0x88,%l0	! %l0 = 0000000000000054
!	Mem[0000000030101400] = 000000007d1c3309, %l3 = 000000000000002f
	ldxa	[%i4+%g0]0x81,%l3	! %l3 = 000000007d1c3309
!	Mem[00000000300c1408] = 57f64e10, %l5 = 000000006ca780ff
	ldsba	[%i3+%o4]0x81,%l5	! %l5 = 0000000000000057
!	Mem[0000000030001410] = 24417204, %l4 = 24b94ce27411242b
	lduha	[%i0+%o5]0x81,%l4	! %l4 = 0000000000002441
!	Mem[0000000030181400] = 0000037f, %l3 = 000000007d1c3309
	lduba	[%i6+%g0]0x89,%l3	! %l3 = 000000000000007f
!	Mem[0000000030041410] = fcee037f, %l0 = 0000000000000054
	ldsba	[%i1+%o5]0x89,%l0	! %l0 = 000000000000007f
!	%l4 = 0000000000002441, immd = fffffffffffff1fa, %l108 = 0000000000000004
	sdivx	%l4,-0xe06,%l4		! %l4 = fffffffffffffffe

p0_label_23:
!	Starting 10 instruction Store Burst
!	Mem[0000000030101410] = 0bccffff, %l5 = 0000000000000057
	swapa	[%i4+%o5]0x89,%l5	! %l5 = 000000000bccffff
!	%l4 = fffffffffffffffe, Mem[0000000010041408] = a552d538
	stba	%l4,[%i1+%o4]0x80	! Mem[0000000010041408] = fe52d538
!	%l6 = 00000316285b3525, Mem[00000000100c1408] = b7cf2217def9d7ff
	stxa	%l6,[%i3+%o4]0x88	! Mem[00000000100c1408] = 00000316285b3525
!	%l2 = 0000000000000066, Mem[0000000010181428] = 784ce8567618994f
	stx	%l2,[%i6+0x028]		! Mem[0000000010181428] = 0000000000000066
!	Mem[0000000030181408] = 54c07bae, %l6 = 00000000285b3525
	swapa	[%i6+%o4]0x81,%l6	! %l6 = 0000000054c07bae
!	%f8  = 6c1ca198, Mem[0000000010001434] = 5fcc2405
	sta	%f8 ,[%i0+0x034]%asi	! Mem[0000000010001434] = 6c1ca198
!	%l1 = 000000000000001b, %l4 = fffffffffffffffe, %l1 = 000000000000001b
	xnor	%l1,%l4,%l1		! %l1 = 000000000000001a
!	Mem[0000000030101410] = 00000057, %l6 = 0000000054c07bae
	ldstuba	[%i4+%o5]0x89,%l6	! %l6 = 0000000000000057
!	%l0 = 000000000000007f, Mem[0000000010041438] = 43f52242
	sth	%l0,[%i1+0x038]		! Mem[0000000010041438] = 007f2242
!	%l2 = 00000066, %l3 = 0000007f, Mem[0000000030081410] = 2e7f03c4 5b314a45
	stda	%l2,[%i2+%o5]0x81	! Mem[0000000030081410] = 00000066 0000007f

p0_label_24:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = 00000054, %l3 = 000000000000007f
	ldsha	[%i5+%g0]0x88,%l3	! %l3 = 0000000000000054
!	Mem[0000000030101408] = 2f00000119fae487, %l7 = 00000000495ea6e1
	ldxa	[%i4+%o4]0x81,%l7	! %l7 = 2f00000119fae487
!	Mem[00000000300c1410] = 000700294fa0375d, %l3 = 0000000000000054
	ldxa	[%i3+%o5]0x81,%l3	! %l3 = 000700294fa0375d
!	Mem[0000000030041410] = 7f03eefc, %l3 = 000700294fa0375d
	lduba	[%i1+%o5]0x81,%l3	! %l3 = 000000000000007f
!	Mem[0000000010181400] = 0f1447587d1c3309, %l5 = 000000000bccffff
	ldxa	[%i6+%g0]0x88,%l5	! %l5 = 0f1447587d1c3309
!	Mem[0000000010041400] = 713b7d44e052f6ff, %f16 = 1089b5e5 f23999fa
	ldda	[%i1+%g0]0x88,%f16	! %f16 = 713b7d44 e052f6ff
!	Mem[00000000300c1400] = ffcc45d07a1ecca1, %l2 = 0000000000000066
	ldxa	[%i3+%g0]0x81,%l2	! %l2 = ffcc45d07a1ecca1
!	Mem[0000000030181410] = 2d486edc, %l1 = 000000000000001a
	lduwa	[%i6+%o5]0x81,%l1	! %l1 = 000000002d486edc
!	Mem[000000001008143c] = 751f1beb, %f7  = 6ac2f633
	lda	[%i2+0x03c]%asi,%f7 	! %f7 = 751f1beb
!	Mem[0000000030081410] = 00000066, %f25 = 48886570
	lda	[%i2+%o5]0x81,%f25	! %f25 = 00000066

p0_label_25:
!	Starting 10 instruction Store Burst
!	Mem[0000000010141408] = 54000099, %l3 = 000000000000007f
	swapa	[%i5+%o4]0x80,%l3	! %l3 = 0000000054000099
!	Mem[000000001018143c] = 4a0b4b6b, %l2 = 000000007a1ecca1
	swap	[%i6+0x03c],%l2		! %l2 = 000000004a0b4b6b
!	Mem[0000000030181408] = 25355b28, %l0 = 000000000000007f
	swapa	[%i6+%o4]0x89,%l0	! %l0 = 0000000025355b28
!	%l7 = 2f00000119fae487, Mem[0000000030181410] = fd398347dc6e482d
	stxa	%l7,[%i6+%o5]0x89	! Mem[0000000030181410] = 2f00000119fae487
!	Mem[00000000100c1400] = ac6da26b, %l0 = 0000000025355b28
	swapa	[%i3+%g0]0x88,%l0	! %l0 = 00000000ac6da26b
!	Mem[0000000010141414] = 044622ad, %l6 = 0000000000000057
	swap	[%i5+0x014],%l6		! %l6 = 00000000044622ad
!	%l7 = 2f00000119fae487, Mem[00000000100c1408] = 25355b28, %asi = 80
	stwa	%l7,[%i3+0x008]%asi	! Mem[00000000100c1408] = 19fae487
!	%l6 = 044622ad, %l7 = 19fae487, Mem[00000000300c1400] = d045ccff a1cc1e7a
	stda	%l6,[%i3+%g0]0x89	! Mem[00000000300c1400] = 044622ad 19fae487
!	%l1 = 000000002d486edc, Mem[00000000100c1408] = 19fae487
	stwa	%l1,[%i3+%o4]0x80	! Mem[00000000100c1408] = 2d486edc
!	Mem[0000000010001410] = 8517b034, %l0 = 00000000ac6da26b
	ldstuba	[%i0+%o5]0x80,%l0	! %l0 = 0000000000000085

p0_label_26:
!	Starting 10 instruction Load Burst
!	Mem[0000000030001400] = c0912e5e, %l0 = 0000000000000085
	ldsha	[%i0+%g0]0x89,%l0	! %l0 = 0000000000002e5e
!	Mem[0000000010141400] = 00000054, %l0 = 0000000000002e5e
	lduha	[%i5+%g0]0x88,%l0	! %l0 = 0000000000000054
!	Mem[0000000010101400] = 11747837008457ff, %f28 = 4e24c376 bde40559
	ldda	[%i4+%g0]0x88,%f28	! %f28 = 11747837 008457ff
!	Mem[0000000030081410] = 00000066, %f1  = 37787411
	lda	[%i2+%o5]0x81,%f1 	! %f1 = 00000066
!	Mem[0000000030101400] = 09331c7d00000000, %f6  = 93ae2666 751f1beb
	ldda	[%i4+%g0]0x89,%f6 	! %f6  = 09331c7d 00000000
!	Mem[0000000020800041] = 51eee580, %l7 = 2f00000119fae487
	ldsb	[%o1+0x041],%l7		! %l7 = ffffffffffffffee
!	Mem[0000000030181408] = 7f00000050e4e847, %l5 = 0f1447587d1c3309
	ldxa	[%i6+%o4]0x81,%l5	! %l5 = 7f00000050e4e847
!	Mem[00000000300c1408] = 57f64e10, %f3  = 2cd4e237
	lda	[%i3+%o4]0x81,%f3 	! %f3 = 57f64e10
!	Mem[0000000010041400] = e052f6ff, %l3 = 0000000054000099
	lduwa	[%i1+%g0]0x88,%l3	! %l3 = 00000000e052f6ff
!	Mem[0000000030041408] = 66000000, %l1 = 000000002d486edc
	ldsba	[%i1+%o4]0x81,%l1	! %l1 = 0000000000000066

p0_label_27:
!	Starting 10 instruction Store Burst
!	%f28 = 11747837 008457ff, %l4 = fffffffffffffffe
!	Mem[0000000030101400] = 000000007d1c3309
	stda	%f28,[%i4+%l4]ASI_PST8_SL ! Mem[0000000030101400] = 0057840037787411
!	%f9  = 5225bc49, Mem[0000000010041410] = 6ca780ff
	sta	%f9 ,[%i1+%o5]0x88	! Mem[0000000010041410] = 5225bc49
!	Mem[00000000300c1410] = 29000700, %l4 = fffffffffffffffe
	ldstuba	[%i3+%o5]0x89,%l4	! %l4 = 0000000000000000
!	%l3 = 00000000e052f6ff, Mem[0000000030081408] = c7a027712e0efa99
	stxa	%l3,[%i2+%o4]0x89	! Mem[0000000030081408] = 00000000e052f6ff
!	%f30 = 1ba03c4c, Mem[0000000010001410] = 34b017ff
	sta	%f30,[%i0+%o5]0x88	! Mem[0000000010001410] = 1ba03c4c
!	%l1 = 0000000000000066, Mem[00000000100c143a] = 79601d02
	sth	%l1,[%i3+0x03a]		! Mem[00000000100c1438] = 79600066
!	Mem[0000000010081438] = 774f67a2, %l7 = ffffffee, %l2 = 4a0b4b6b
	add	%i2,0x38,%g1
	casa	[%g1]0x80,%l7,%l2	! %l2 = 00000000774f67a2
!	%l4 = 0000000000000000, Mem[0000000030001408] = 0bccf0fe104ef657
	stxa	%l4,[%i0+%o4]0x81	! Mem[0000000030001408] = 0000000000000000
!	Mem[0000000010081400] = ff577340, %l5 = 0000000050e4e847
	swapa	[%i2+%g0]0x80,%l5	! %l5 = 00000000ff577340
!	%l6 = 044622ad, %l7 = ffffffee, Mem[0000000010041408] = 38d552fe f79b9a68
	stda	%l6,[%i1+%o4]0x88	! Mem[0000000010041408] = 044622ad ffffffee

p0_label_28:
!	Starting 10 instruction Load Burst
!	Mem[0000000030041410] = 7f03eefc, %l6 = 00000000044622ad
	ldswa	[%i1+%o5]0x81,%l6	! %l6 = 000000007f03eefc
!	Mem[0000000010041431] = 31f302e4, %l1 = 0000000000000066
	ldub	[%i1+0x031],%l1		! %l1 = 00000000000000f3
!	Mem[0000000030181400] = 0000037f, %l2 = 00000000774f67a2
	lduba	[%i6+%g0]0x89,%l2	! %l2 = 000000000000007f
!	Mem[0000000010041400] = fff652e0, %l0 = 0000000000000054
	lduha	[%i1+%g0]0x80,%l0	! %l0 = 000000000000fff6
!	Mem[0000000010001408] = 8fedd10c 4bf50a17, %l4 = 00000000, %l5 = ff577340
	ldda	[%i0+%o4]0x80,%l4	! %l4 = 000000008fedd10c 000000004bf50a17
!	Mem[00000000100c1400] = 285b3525, %l6 = 000000007f03eefc
	ldsha	[%i3+%g0]0x80,%l6	! %l6 = 000000000000285b
!	Mem[0000000030001400] = 5e2e91c0, %l6 = 000000000000285b
	lduba	[%i0+%g0]0x81,%l6	! %l6 = 000000000000005e
!	Mem[00000000100c1408] = dc6e482d, %l1 = 00000000000000f3
	ldsba	[%i3+%o4]0x88,%l1	! %l1 = 000000000000002d
!	Mem[0000000010141434] = 0e140c65, %l1 = 000000000000002d, %asi = 80
	ldsha	[%i5+0x034]%asi,%l1	! %l1 = 0000000000000e14
!	%l6 = 000000000000005e, %l0 = 000000000000fff6, %l6 = 000000000000005e
	sdivx	%l6,%l0,%l6		! %l6 = 0000000000000000

p0_label_29:
!	Starting 10 instruction Store Burst
!	Mem[0000000030141400] = 6626ae93, %l4 = 000000008fedd10c
	swapa	[%i5+%g0]0x81,%l4	! %l4 = 000000006626ae93
!	%f16 = 713b7d44, Mem[0000000010101410] = bde40559
	sta	%f16,[%i4+%o5]0x80	! Mem[0000000010101410] = 713b7d44
!	%l6 = 00000000, %l7 = ffffffee, Mem[0000000010181400] = 09331c7d 5847140f
	stda	%l6,[%i6+%g0]0x80	! Mem[0000000010181400] = 00000000 ffffffee
!	Mem[0000000010001400] = 8022df31, %l2 = 000000000000007f
	swapa	[%i0+%g0]0x88,%l2	! %l2 = 000000008022df31
!	%f16 = 713b7d44 e052f6ff, Mem[0000000030181410] = 87e4fa19 0100002f
	stda	%f16,[%i6+%o5]0x81	! Mem[0000000030181410] = 713b7d44 e052f6ff
!	%f24 = 391ae375 00000066, Mem[0000000010081418] = 0c082bca 4ec01673
	std	%f24,[%i2+0x018]	! Mem[0000000010081418] = 391ae375 00000066
!	%f12 = 24417204 34b01785, %l1 = 0000000000000e14
!	Mem[00000000100c1418] = 2e7f03c45b314a45
	add	%i3,0x018,%g1
	stda	%f12,[%g1+%l1]ASI_PST16_P ! Mem[00000000100c1418] = 2e7f72045b314a45
!	Mem[0000000010101428] = 54f289960cd1ed8f, %l1 = 0000000000000e14, %l4 = 000000006626ae93
	add	%i4,0x28,%g1
	casxa	[%g1]0x80,%l1,%l4	! %l4 = 54f289960cd1ed8f
!	Mem[00000000100c1408] = 2d486edc, %l2 = 8022df31, %l4 = 0cd1ed8f
	add	%i3,0x08,%g1
	casa	[%g1]0x80,%l2,%l4	! %l4 = 000000002d486edc
!	Mem[0000000010141404] = 60000000, %l5 = 4bf50a17, %l7 = ffffffee
	add	%i5,0x04,%g1
	casa	[%g1]0x80,%l5,%l7	! %l7 = 0000000060000000

p0_label_30:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = 0f144758769c780d, %f6  = 09331c7d 00000000
	ldda	[%i2+%o5]0x80,%f6 	! %f6  = 0f144758 769c780d
!	Mem[0000000030181410] = 447d3b71, %l2 = 000000008022df31
	lduwa	[%i6+%o5]0x89,%l2	! %l2 = 00000000447d3b71
!	Mem[0000000030101410] = 000000ff, %f13 = 34b01785
	lda	[%i4+%o5]0x89,%f13	! %f13 = 000000ff
!	Mem[0000000020800040] = 51eee580, %l1 = 0000000000000e14, %asi = 80
	lduba	[%o1+0x040]%asi,%l1	! %l1 = 0000000000000051
!	Mem[0000000010101408] = 57f64e10, %l7 = 0000000060000000
	ldswa	[%i4+%o4]0x80,%l7	! %l7 = 0000000057f64e10
!	Mem[0000000030041408] = 66000000, %l0 = 000000000000fff6
	ldsha	[%i1+%o4]0x81,%l0	! %l0 = 0000000000006600
!	Mem[0000000030081400] = 6626aeff, %l0 = 0000000000006600
	lduha	[%i2+%g0]0x89,%l0	! %l0 = 000000000000aeff
!	Mem[0000000030141410] = 10ab1dff, %l3 = 00000000e052f6ff
	ldsba	[%i5+%o5]0x89,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000030041408] = 00000066, %l1 = 0000000000000051
	ldswa	[%i1+%o4]0x89,%l1	! %l1 = 0000000000000066
!	Mem[0000000030041400] = 66f02510, %l0 = 000000000000aeff
	lduba	[%i1+%g0]0x81,%l0	! %l0 = 0000000000000066

p0_label_31:
!	Starting 10 instruction Store Burst
!	Mem[0000000030001408] = 00000000, %l3 = 00000000ffffffff
	swapa	[%i0+%o4]0x81,%l3	! %l3 = 0000000000000000
!	%f5  = e0a9fd34, %f9  = 5225bc49, %f1  = 00000066
	fdivs	%f5 ,%f9 ,%f1 		! %f1  = ce0348fd
!	%l7 = 0000000057f64e10, Mem[0000000010101410] = 713b7d44
	stwa	%l7,[%i4+%o5]0x80	! Mem[0000000010101410] = 57f64e10
!	%f12 = 24417204, Mem[0000000030141408] = ff0000ff
	sta	%f12,[%i5+%o4]0x89	! Mem[0000000030141408] = 24417204
!	%l2 = 00000000447d3b71, Mem[0000000010141408] = 7f000000
	stwa	%l2,[%i5+%o4]0x88	! Mem[0000000010141408] = 447d3b71
!	%l2 = 00000000447d3b71, Mem[0000000030181408] = 47e8e4500000007f
	stxa	%l2,[%i6+%o4]0x89	! Mem[0000000030181408] = 00000000447d3b71
!	%f4  = bde40559 e0a9fd34, Mem[00000000100c1420] = 52f36538 4a62ad69
	std	%f4 ,[%i3+0x020]	! Mem[00000000100c1420] = bde40559 e0a9fd34
!	Mem[0000000010101408] = 57f64e10, %l2 = 00000000447d3b71
	ldstuba	[%i4+%o4]0x80,%l2	! %l2 = 0000000000000057
!	Mem[0000000030081400] = ffae2666, %l0 = 0000000000000066
	ldstuba	[%i2+%g0]0x81,%l0	! %l0 = 00000000000000ff
!	%f10 = 54f28996 0cd1ed8f, Mem[0000000010041418] = 579bc26a 6626ae93, %asi = 80
	stda	%f10,[%i1+0x018]%asi	! Mem[0000000010041418] = 54f28996 0cd1ed8f

p0_label_32:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = 47e8e450, %l4 = 000000002d486edc
	ldsha	[%i2+%g0]0x88,%l4	! %l4 = ffffffffffffe450
!	Mem[0000000030081400] = ffae2666, %l0 = 00000000000000ff
	lduwa	[%i2+%g0]0x81,%l0	! %l0 = 00000000ffae2666
!	Mem[0000000010041430] = 31f302e4, %l4 = ffffffffffffe450, %asi = 80
	ldsha	[%i1+0x030]%asi,%l4	! %l4 = 00000000000031f3
!	%f6  = 0f144758 769c780d, Mem[0000000010141408] = 713b7d44 0d71c377
	stda	%f6 ,[%i5+%o4]0x80	! Mem[0000000010141408] = 0f144758 769c780d
!	Mem[00000000300c1410] = 290007ff, %l0 = 00000000ffae2666
	ldsba	[%i3+%o5]0x89,%l0	! %l0 = ffffffffffffffff
!	Mem[00000000300c1408] = 57f64e10fef0cc0b, %l7 = 0000000057f64e10
	ldxa	[%i3+%o4]0x81,%l7	! %l7 = 57f64e10fef0cc0b
!	Mem[0000000010181430] = 00000000 00000007, %l6 = 00000000, %l7 = fef0cc0b
	ldd	[%i6+0x030],%l6		! %l6 = 0000000000000000 0000000000000007
!	Mem[0000000030181408] = 00000000 447d3b71, %l6 = 00000000, %l7 = 00000007
	ldda	[%i6+%o4]0x89,%l6	! %l6 = 00000000447d3b71 0000000000000000
!	Mem[00000000211c0000] = ffff7fb0, %l1 = 0000000000000066
	lduh	[%o2+%g0],%l1		! %l1 = 000000000000ffff
!	Mem[0000000030101408] = 87e4fa190100002f, %f16 = 713b7d44 e052f6ff
	ldda	[%i4+%o4]0x89,%f16	! %f16 = 87e4fa19 0100002f

p0_label_33:
!	Starting 10 instruction Store Burst
!	%f18 = ff0000ff 2cd4e237, %l5 = 000000004bf50a17
!	Mem[0000000030181438] = 4311c9d2060cd75b
	add	%i6,0x038,%g1
	stda	%f18,[%g1+%l5]ASI_PST8_SL ! Mem[0000000030181438] = 37e2d4d2ff0cd75b
!	%f14 = 40bf4262 5e87d3ab, Mem[00000000100c1400] = 25355b28 93000000
	stda	%f14,[%i3+%g0]0x88	! Mem[00000000100c1400] = 40bf4262 5e87d3ab
!	%f8  = 6c1ca198 5225bc49, Mem[0000000030101410] = 000000ff 00230000
	stda	%f8 ,[%i4+%o5]0x89	! Mem[0000000030101410] = 6c1ca198 5225bc49
!	%l6 = 447d3b71, %l7 = 00000000, Mem[0000000010001418] = 6207c90a 56fdf6b3, %asi = 80
	stda	%l6,[%i0+0x018]%asi	! Mem[0000000010001418] = 447d3b71 00000000
!	Mem[0000000030181408] = 713b7d44, %l2 = 0000000000000057
	swapa	[%i6+%o4]0x81,%l2	! %l2 = 00000000713b7d44
!	%l7 = 0000000000000000, Mem[000000001000143f] = 7411242b, %asi = 80
	stba	%l7,[%i0+0x03f]%asi	! Mem[000000001000143c] = 74112400
!	%l0 = ffffffff, %l1 = 0000ffff, Mem[0000000010101408] = fff64e10 2cd4e237, %asi = 80
	stda	%l0,[%i4+0x008]%asi	! Mem[0000000010101408] = ffffffff 0000ffff
!	Mem[00000000300c1410] = 290007ff, %l3 = 0000000000000000
	swapa	[%i3+%o5]0x89,%l3	! %l3 = 00000000290007ff
!	%l1 = 000000000000ffff, Mem[00000000300c1400] = 044622ad
	stha	%l1,[%i3+%g0]0x89	! Mem[00000000300c1400] = 0446ffff
!	Mem[00000000300c1410] = 00000000, %l3 = 00000000290007ff
	swapa	[%i3+%o5]0x81,%l3	! %l3 = 0000000000000000

p0_label_34:
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = 00845700, %l4 = 00000000000031f3
	lduba	[%i4+%g0]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000030041408] = 66000000e1a65e49, %f10 = 54f28996 0cd1ed8f
	ldda	[%i1+%o4]0x81,%f10	! %f10 = 66000000 e1a65e49
!	Mem[0000000021800100] = ff78c6a0, %l5 = 000000004bf50a17
	lduh	[%o3+0x100],%l5		! %l5 = 000000000000ff78
!	Mem[0000000030181400] = 7f030000, %l7 = 0000000000000000
	ldswa	[%i6+%g0]0x81,%l7	! %l7 = 000000007f030000
!	Mem[00000000100c143c] = 47ac1fcb, %f11 = e1a65e49
	ld	[%i3+0x03c],%f11	! %f11 = 47ac1fcb
!	Mem[0000000010141410] = 570000004c1f7727, %f12 = 24417204 000000ff
	ldda	[%i5+%o5]0x88,%f12	! %f12 = 57000000 4c1f7727
!	Mem[0000000030181410] = 713b7d44, %f6  = 0f144758
	lda	[%i6+%o5]0x81,%f6 	! %f6 = 713b7d44
!	Mem[00000000100c1400] = abd3875e 6242bf40, %l6 = 447d3b71, %l7 = 7f030000
	ldda	[%i3+%g0]0x80,%l6	! %l6 = 00000000abd3875e 000000006242bf40
!	Mem[0000000030101400] = 00845700, %l4 = 0000000000000000
	lduwa	[%i4+%g0]0x89,%l4	! %l4 = 0000000000845700
!	Mem[0000000030081410] = 66000000, %l6 = 00000000abd3875e
	lduwa	[%i2+%o5]0x89,%l6	! %l6 = 0000000066000000

p0_label_35:
!	Starting 10 instruction Store Burst
!	%l6 = 0000000066000000, Mem[0000000030081410] = 66000000
	stha	%l6,[%i2+%o5]0x89	! Mem[0000000030081410] = 66000000
!	Mem[0000000030141400] = 8fedd10c, %l2 = 00000000713b7d44
	swapa	[%i5+%g0]0x81,%l2	! %l2 = 000000008fedd10c
!	Mem[0000000030141408] = 24417204, %l0 = 00000000ffffffff
	swapa	[%i5+%o4]0x89,%l0	! %l0 = 0000000024417204
!	%l4 = 0000000000845700, Mem[0000000030141400] = 447d3b71
	stwa	%l4,[%i5+%g0]0x89	! Mem[0000000030141400] = 00845700
!	%f23 = ba37580a, %f20 = bde40559, %f21 = fffe0051
	fsubs	%f23,%f20,%f21		! %f21 = 3de296a9
!	%f30 = 1ba03c4c, Mem[0000000030101410] = 5225bc49
	sta	%f30,[%i4+%o5]0x89	! Mem[0000000030101410] = 1ba03c4c
!	Mem[0000000010041400] = fff652e0, %l0 = 0000000024417204
	ldstuba	[%i1+%g0]0x80,%l0	! %l0 = 00000000000000ff
!	Mem[0000000021800180] = 6fa54700, %l1 = 000000000000ffff
	ldstub	[%o3+0x180],%l1		! %l1 = 000000000000006f
!	Code Fragment 4, seed = 534898
p0_fragment_2:
!	%l0 = 00000000000000ff
	setx	0xaa944ce6d9143e96,%g7,%l0 ! %l0 = aa944ce6d9143e96
!	%l1 = 000000000000006f
	setx	0x7611e3f450b467c1,%g7,%l1 ! %l1 = 7611e3f450b467c1
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = aa944ce6d9143e96
	setx	0x6a32f498d873e4fc,%g7,%l0 ! %l0 = 6a32f498d873e4fc
!	%l1 = 7611e3f450b467c1
	setx	0x864f648167cfb947,%g7,%l1 ! %l1 = 864f648167cfb947
p0_fragment_2_end:
!	Mem[00000000300c1400] = 0446ffff, %l7 = 000000006242bf40
	swapa	[%i3+%g0]0x89,%l7	! %l7 = 000000000446ffff

p0_label_36:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = 49bc2552488f9f2d, %f14 = 40bf4262 5e87d3ab
	ldda	[%i1+%o5]0x80,%f14	! %f14 = 49bc2552 488f9f2d
!	Mem[00000000100c1400] = abd3875e, %l5 = 000000000000ff78
	ldsha	[%i3+%g0]0x80,%l5	! %l5 = ffffffffffffabd3
!	Mem[0000000030101400] = 00845700, %l0 = 6a32f498d873e4fc
	ldsha	[%i4+%g0]0x89,%l0	! %l0 = 0000000000005700
!	Mem[0000000010101400] = ff578400, %l5 = ffffffffffffabd3
	lduwa	[%i4+%g0]0x80,%l5	! %l5 = 00000000ff578400
!	Mem[0000000030001400] = 5e2e91c0, %l1 = 864f648167cfb947
	ldsha	[%i0+%g0]0x81,%l1	! %l1 = 0000000000005e2e
!	Mem[0000000030081410] = 00000066, %l5 = 00000000ff578400
	lduwa	[%i2+%o5]0x81,%l5	! %l5 = 0000000000000066
!	Mem[0000000010081408] = 000000000000008c, %f16 = 87e4fa19 0100002f
	ldda	[%i2+%o4]0x88,%f16	! %f16 = 00000000 0000008c
!	Mem[0000000030181410] = fff652e0 447d3b71, %l0 = 00005700, %l1 = 00005e2e
	ldda	[%i6+%o5]0x89,%l0	! %l0 = 00000000447d3b71 00000000fff652e0
!	Mem[0000000030101400] = 00578400, %l6 = 0000000066000000
	ldsha	[%i4+%g0]0x81,%l6	! %l6 = 0000000000000057
!	Mem[0000000010001410] = 4c3ca01b04724124, %l3 = 0000000000000000, %asi = 80
	ldxa	[%i0+0x010]%asi,%l3	! %l3 = 4c3ca01b04724124

p0_label_37:
!	Starting 10 instruction Store Burst
!	%f18 = ff0000ff 2cd4e237, Mem[00000000300c1410] = 290007ff 4fa0375d
	stda	%f18,[%i3+%o5]0x81	! Mem[00000000300c1410] = ff0000ff 2cd4e237
!	Mem[00000000201c0000] = 2bff2520, %l0 = 00000000447d3b71
	ldstuba	[%o0+0x000]%asi,%l0	! %l0 = 000000000000002b
!	Mem[00000000300c1410] = ff0000ff, %l2 = 000000008fedd10c
	swapa	[%i3+%o5]0x81,%l2	! %l2 = 00000000ff0000ff
!	Mem[0000000010081408] = 0000008c, %l3 = 0000000004724124
	swapa	[%i2+%o4]0x88,%l3	! %l3 = 000000000000008c
!	Mem[0000000030101408] = 2f000001, %l6 = 0000000000000057
	ldstuba	[%i4+%o4]0x81,%l6	! %l6 = 000000000000002f
!	%l5 = 0000000000000066, Mem[0000000010181400] = 00000000
	stba	%l5,[%i6+%g0]0x80	! Mem[0000000010181400] = 66000000
!	%f20 = bde40559 3de296a9, Mem[0000000030141400] = 00845700 61b23f7b
	stda	%f20,[%i5+%g0]0x89	! Mem[0000000030141400] = bde40559 3de296a9
!	Mem[0000000030181400] = 0000037f, %l2 = 00000000ff0000ff
	ldstuba	[%i6+%g0]0x89,%l2	! %l2 = 000000000000007f
!	%l6 = 000000000000002f, Mem[0000000010041408] = 044622ad
	stha	%l6,[%i1+%o4]0x88	! Mem[0000000010041408] = 0446002f
!	%l4 = 0000000000845700, imm = 0000000000000cb2, %l4 = 0000000000845700
	sub	%l4,0xcb2,%l4		! %l4 = 0000000000844a4e

p0_label_38:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = 4c3ca01b, %l1 = 00000000fff652e0
	swapa	[%i0+%o5]0x80,%l1	! %l1 = 000000004c3ca01b
!	Code Fragment 3, seed = 446615
p0_fragment_3:
!	%l0 = 000000000000002b
	setx	0xdbfc3a7185883a6e,%g7,%l0 ! %l0 = dbfc3a7185883a6e
!	%l1 = 000000004c3ca01b
	setx	0xfbad324f5f767c19,%g7,%l1 ! %l1 = fbad324f5f767c19
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = dbfc3a7185883a6e
	setx	0x99d05c3f6472a9d4,%g7,%l0 ! %l0 = 99d05c3f6472a9d4
!	%l1 = fbad324f5f767c19
	setx	0xfd4627512e96469f,%g7,%l1 ! %l1 = fd4627512e96469f
p0_fragment_3_end:
!	Mem[0000000030141400] = 3de296a9, %f3  = 57f64e10
	lda	[%i5+%g0]0x89,%f3 	! %f3 = 3de296a9
!	Mem[00000000100c1408] = 00000316 dc6e482d, %l0 = 6472a9d4, %l1 = 2e96469f
	ldda	[%i3+%o4]0x88,%l0	! %l0 = 00000000dc6e482d 0000000000000316
!	Mem[00000000300c1408] = 104ef657, %l6 = 000000000000002f
	lduba	[%i3+%o4]0x89,%l6	! %l6 = 0000000000000057
!	%f18 = ff0000ff 2cd4e237, %l7 = 000000000446ffff
!	Mem[0000000030081418] = 1a170a7a7d108c63
	add	%i2,0x018,%g1
	stda	%f18,[%g1+%l7]ASI_PST8_SL ! Mem[0000000030081418] = 37e2d42cff0000ff
!	Mem[00000000300c1410] = 8fedd10c, %l6 = 0000000000000057
	lduha	[%i3+%o5]0x81,%l6	! %l6 = 0000000000008fed
!	Mem[0000000010041400] = fff652e0447d3b71, %l1 = 0000000000000316
	ldxa	[%i1+%g0]0x80,%l1	! %l1 = fff652e0447d3b71
!	Mem[0000000010141408] = 0f144758769c780d, %l6 = 0000000000008fed
	ldxa	[%i5+%o4]0x80,%l6	! %l6 = 0f144758769c780d
!	Mem[0000000010081408] = 0000000004724124, %l3 = 000000000000008c
	ldxa	[%i2+%o4]0x88,%l3	! %l3 = 0000000004724124

p0_label_39:
!	Starting 10 instruction Store Burst
!	%l4 = 0000000000844a4e, Mem[0000000010001400] = 7f000000
	stwa	%l4,[%i0+%g0]0x80	! Mem[0000000010001400] = 00844a4e
!	%f14 = 49bc2552 488f9f2d, Mem[0000000030141410] = ff1dab10 6af76369
	stda	%f14,[%i5+%o5]0x81	! Mem[0000000030141410] = 49bc2552 488f9f2d
!	%l0 = 00000000dc6e482d, Mem[0000000010141400] = 00000054
	stba	%l0,[%i5+%g0]0x88	! Mem[0000000010141400] = 0000002d
!	%l6 = 0f144758769c780d, Mem[0000000030101410] = 4c3ca01b
	stwa	%l6,[%i4+%o5]0x81	! Mem[0000000030101410] = 769c780d
!	Mem[000000001004143c] = 49a8c80b, %l0 = dc6e482d, %l4 = 00844a4e
	add	%i1,0x3c,%g1
	casa	[%g1]0x80,%l0,%l4	! %l4 = 0000000049a8c80b
!	Mem[0000000030101408] = 010000ff, %l1 = fff652e0447d3b71
	ldstuba	[%i4+%o4]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010001400] = 00844a4e 45cc8891 8fedd10c 4bf50a17
!	%f0  = 2f578400 ce0348fd ff0000ff 3de296a9
!	%f4  = bde40559 e0a9fd34 713b7d44 769c780d
!	%f8  = 6c1ca198 5225bc49 66000000 47ac1fcb
!	%f12 = 57000000 4c1f7727 49bc2552 488f9f2d
	stda	%f0 ,[%i0+%g0]ASI_BLK_AIUPL	! Block Store to 0000000010001400
!	Mem[00000000201c0000] = ffff2520, %l5 = 0000000000000066
	ldstuba	[%o0+0x000]%asi,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030001400] = 5e2e91c0 000fb2d1 ffffffff 00000000
!	%f0  = 2f578400 ce0348fd ff0000ff 3de296a9
!	%f4  = bde40559 e0a9fd34 713b7d44 769c780d
!	%f8  = 6c1ca198 5225bc49 66000000 47ac1fcb
!	%f12 = 57000000 4c1f7727 49bc2552 488f9f2d
	stda	%f0 ,[%i0+%g0]ASI_COMMIT_S	! Block Store to 0000000030001400
!	Mem[000000001008140f] = 00000000, %l3 = 0000000004724124
	ldstuba	[%i2+0x00f]%asi,%l3	! %l3 = 0000000000000000

p0_label_40:
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = e052f6ff, %l7 = 000000000446ffff
	lduha	[%i2+%o4]0x89,%l7	! %l7 = 000000000000f6ff
!	Mem[00000000201c0001] = ffff2520, %l3 = 0000000000000000
	ldsb	[%o0+0x001],%l3		! %l3 = ffffffffffffffff
!	Mem[0000000010101404] = 37787411, %l1 = 00000000000000ff, %asi = 80
	lduba	[%i4+0x004]%asi,%l1	! %l1 = 0000000000000037
!	Mem[00000000300c1400] = 40bf4262, %f19 = 2cd4e237
	lda	[%i3+%g0]0x81,%f19	! %f19 = 40bf4262
!	Mem[0000000021800100] = ff78c6a0, %l7 = 000000000000f6ff
	lduh	[%o3+0x100],%l7		! %l7 = 000000000000ff78
	membar	#Sync			! Added by membar checker (6)
!	Mem[0000000010001400] = fd4803ce 0084572f a996e23d ff0000ff
!	Mem[0000000010001410] = 34fda9e0 5905e4bd 0d789c76 447d3b71
!	Mem[0000000010001420] = 49bc2552 98a11c6c cb1fac47 00000066
!	Mem[0000000010001430] = 27771f4c 00000057 2d9f8f48 5225bc49
	ldda	[%i0+%g0]ASI_BLK_PL,%f16	! Block Load from 0000000010001400
!	Mem[00000000100c1410] = ff526f4e, %l4 = 0000000049a8c80b
	lduwa	[%i3+%o5]0x88,%l4	! %l4 = 00000000ff526f4e
!	Mem[0000000010181410] = 4c3ca0ff, %l5 = 00000000000000ff
	ldsba	[%i6+%o5]0x88,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000010181408] = 35000000, %l5 = ffffffffffffffff
	lduba	[%i6+%o4]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000010041432] = 31f302e4, %l0 = 00000000dc6e482d, %asi = 80
	ldsha	[%i1+0x032]%asi,%l0	! %l0 = 00000000000002e4

p0_label_41:
!	Starting 10 instruction Store Burst
!	%l0 = 000002e4, %l1 = 00000037, Mem[0000000010041410] = 5225bc49 2d9f8f48
	stda	%l0,[%i1+%o5]0x88	! Mem[0000000010041410] = 000002e4 00000037
	membar	#Sync			! Added by membar checker (7)
!	%l5 = 0000000000000000, Mem[0000000010001410] = bde40559e0a9fd34
	stxa	%l5,[%i0+%o5]0x88	! Mem[0000000010001410] = 0000000000000000
!	Mem[0000000030081400] = ffae2666 19aea1c1 fff652e0 00000000
!	%f0  = 2f578400 ce0348fd ff0000ff 3de296a9
!	%f4  = bde40559 e0a9fd34 713b7d44 769c780d
!	%f8  = 6c1ca198 5225bc49 66000000 47ac1fcb
!	%f12 = 57000000 4c1f7727 49bc2552 488f9f2d
	stda	%f0 ,[%i2+%g0]ASI_BLK_SL	! Block Store to 0000000030081400
!	%l2 = 0000007f, %l3 = ffffffff, Mem[0000000030081410] = 34fda9e0 5905e4bd
	stda	%l2,[%i2+%o5]0x81	! Mem[0000000030081410] = 0000007f ffffffff
!	%l1 = 0000000000000037, Mem[0000000030101400] = 00578400
	stba	%l1,[%i4+%g0]0x81	! Mem[0000000030101400] = 37578400
!	%f26 = 66000000 47ac1fcb, Mem[0000000010081400] = 50e4e847 005a1e51
	stda	%f26,[%i2+%g0]0x80	! Mem[0000000010081400] = 66000000 47ac1fcb
!	Mem[0000000010001400] = ce0348fd, %l5 = 0000000000000000
	swapa	[%i0+%g0]0x88,%l5	! %l5 = 00000000ce0348fd
!	%f2  = ff0000ff, Mem[0000000010041410] = e4020000
	sta	%f2 ,[%i1+%o5]0x80	! Mem[0000000010041410] = ff0000ff
!	Mem[0000000010041410] = ff0000ff, %l7 = 000000000000ff78
	swapa	[%i1+%o5]0x88,%l7	! %l7 = 00000000ff0000ff
!	%f19 = 3de296a9, Mem[0000000010141408] = 5847140f
	sta	%f19,[%i5+%o4]0x88	! Mem[0000000010141408] = 3de296a9

p0_label_42:
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1410] = 37e2d42c 0cd1ed8f, %l4 = ff526f4e, %l5 = ce0348fd
	ldda	[%i3+%o5]0x89,%l4	! %l4 = 000000000cd1ed8f 0000000037e2d42c
	membar	#Sync			! Added by membar checker (8)
!	Mem[0000000010081430] = 4b7f8d442f0bbdc5, %l1 = 0000000000000037
	ldx	[%i2+0x030],%l1		! %l1 = 4b7f8d442f0bbdc5
!	Mem[0000000030101408] = 010000ff, %l6 = 0f144758769c780d
	lduwa	[%i4+%o4]0x89,%l6	! %l6 = 00000000010000ff
!	Mem[0000000030001400] = fd4803ce0084572f, %f12 = 57000000 4c1f7727
	ldda	[%i0+%g0]0x89,%f12	! %f12 = fd4803ce 0084572f
!	Mem[00000000211c0000] = ffff7fb0, %l0 = 00000000000002e4, %asi = 80
	lduha	[%o2+0x000]%asi,%l0	! %l0 = 000000000000ffff
!	Mem[0000000010001410] = 00000000, %l5 = 0000000037e2d42c, %asi = 80
	lduwa	[%i0+0x010]%asi,%l5	! %l5 = 0000000000000000
!	Mem[0000000030101400] = 00845737, %l1 = 4b7f8d442f0bbdc5
	ldsba	[%i4+%g0]0x89,%l1	! %l1 = 0000000000000037
!	Mem[0000000030141410] = 5225bc49, %l3 = ffffffffffffffff
	ldsba	[%i5+%o5]0x89,%l3	! %l3 = 0000000000000049
!	Mem[0000000021800041] = 0cef2810, %l6 = 00000000010000ff
	ldub	[%o3+0x041],%l6		! %l6 = 00000000000000ef
!	Mem[0000000010101400] = ff57840037787411, %l2 = 000000000000007f
	ldxa	[%i4+%g0]0x80,%l2	! %l2 = ff57840037787411

p0_label_43:
!	Starting 10 instruction Store Burst
!	%l6 = 00000000000000ef, Mem[0000000030001410] = 5905e4bd
	stha	%l6,[%i0+%o5]0x89	! Mem[0000000030001410] = 590500ef
!	Mem[0000000020800000] = aeffc750, %l6 = 00000000000000ef
	ldstub	[%o1+%g0],%l6		! %l6 = 00000000000000ae
!	Mem[0000000010101400] = ff578400, %l7 = 00000000ff0000ff
	swapa	[%i4+%g0]0x80,%l7	! %l7 = 00000000ff578400
!	%f17 = ce0348fd, Mem[0000000030081408] = 3de296a9
	sta	%f17,[%i2+%o4]0x89	! Mem[0000000030081408] = ce0348fd
!	%l4 = 000000000cd1ed8f, Mem[0000000030081408] = fd4803ce
	stha	%l4,[%i2+%o4]0x81	! Mem[0000000030081408] = ed8f03ce
!	%f14 = 49bc2552 488f9f2d, Mem[00000000100c1410] = 4e6f52ff 704480ed, %asi = 80
	stda	%f14,[%i3+0x010]%asi	! Mem[00000000100c1410] = 49bc2552 488f9f2d
!	%l6 = 00000000000000ae, %l6 = 00000000000000ae, %l7 = 00000000ff578400
	subc	%l6,%l6,%l7		! %l7 = 0000000000000000
!	%l0 = 000000000000ffff, Mem[000000001004142c] = 597d93ef
	stw	%l0,[%i1+0x02c]		! Mem[000000001004142c] = 0000ffff
!	%f12 = fd4803ce 0084572f, Mem[0000000030001400] = 0084572f fd4803ce
	stda	%f12,[%i0+%g0]0x89	! Mem[0000000030001400] = fd4803ce 0084572f
!	%f6  = 713b7d44 769c780d, %l0 = 000000000000ffff
!	Mem[0000000030141430] = 0eb113947bf6f8d5
	add	%i5,0x030,%g1
	stda	%f6,[%g1+%l0]ASI_PST8_SL ! Mem[0000000030141430] = 0d789c76447d3b71

p0_label_44:
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = ffff7fb0, %l3 = 0000000000000049
	lduh	[%o2+%g0],%l3		! %l3 = 000000000000ffff
!	Mem[0000000010141424] = 529afb29, %l3 = 000000000000ffff
	ldsw	[%i5+0x024],%l3		! %l3 = 00000000529afb29
!	Mem[0000000010081408] = 24417204 000000ff, %l2 = 37787411, %l3 = 529afb29
	ldd	[%i2+%o4],%l2		! %l2 = 0000000024417204 00000000000000ff
!	Mem[0000000010081410] = 5847140f, %f0  = 2f578400
	lda	[%i2+%o5]0x88,%f0 	! %f0 = 5847140f
!	Mem[0000000030081410] = 7f000000, %l4 = 000000000cd1ed8f
	ldswa	[%i2+%o5]0x89,%l4	! %l4 = 000000007f000000
!	Mem[0000000010141400] = 0000002d, %l4 = 000000007f000000
	lduba	[%i5+%g0]0x88,%l4	! %l4 = 000000000000002d
!	Mem[0000000010141400] = 2d000000, %l1 = 0000000000000037
	ldsba	[%i5+%g0]0x80,%l1	! %l1 = 000000000000002d
!	%l4 = 000000000000002d, imm = fffffffffffff2b3, %l3 = 00000000000000ff
	subc	%l4,-0xd4d,%l3		! %l3 = 0000000000000d7a
!	Mem[00000000100c1400] = abd3875e, %l4 = 000000000000002d
	ldsha	[%i3+%g0]0x80,%l4	! %l4 = ffffffffffffabd3
!	Mem[0000000030141410] = 5225bc49, %l5 = 0000000000000000
	lduha	[%i5+%o5]0x89,%l5	! %l5 = 000000000000bc49

p0_label_45:
!	Starting 10 instruction Store Burst
!	%l5 = 000000000000bc49, Mem[00000000300c1410] = 0cd1ed8f
	stwa	%l5,[%i3+%o5]0x89	! Mem[00000000300c1410] = 0000bc49
!	Mem[0000000010081428] = 10c5ead6, %l6 = 00000000000000ae, %asi = 80
	swapa	[%i2+0x028]%asi,%l6	! %l6 = 0000000010c5ead6
!	Mem[0000000010041408] = 2f004604, %l6 = 0000000010c5ead6
	ldstuba	[%i1+0x008]%asi,%l6	! %l6 = 000000000000002f
!	%l0 = 000000000000ffff, Mem[0000000030041410] = 7f03eefc
	stwa	%l0,[%i1+%o5]0x81	! Mem[0000000030041410] = 0000ffff
!	%l2 = 24417204, %l3 = 00000d7a, Mem[0000000030041400] = 1025f066 e1a65e49
	stda	%l2,[%i1+%g0]0x89	! Mem[0000000030041400] = 24417204 00000d7a
!	%l4 = ffffffffffffabd3, Mem[00000000100c1408] = 2d486edc
	stha	%l4,[%i3+%o4]0x80	! Mem[00000000100c1408] = abd36edc
!	%l0 = 000000000000ffff, %l7 = 0000000000000000, %l3 = 0000000000000d7a
	sdivx	%l0,%l7,%l3		! Div by zero, %l0 = 0000000000010027
!	Mem[0000000010081400] = 6600000047ac1fcb, %l4 = ffffffffffffabd3, %l6 = 000000000000002f
	casxa	[%i2]0x80,%l4,%l6	! %l6 = 6600000047ac1fcb
!	Mem[0000000010001408] = 3de296a9, %l5 = 000000000000bc49
	ldstuba	[%i0+%o4]0x88,%l5	! %l5 = 00000000000000a9
!	Mem[0000000010081408] = 24417204, %l1 = 000000000000002d
	swapa	[%i2+%o4]0x80,%l1	! %l1 = 0000000024417204

p0_label_46:
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = a996e23d, %l5 = 00000000000000a9
	lduha	[%i5+%g0]0x81,%l5	! %l5 = 000000000000a996
!	Mem[00000000100c1430] = 47a707a4, %l4 = ffffffffffffabd3, %asi = 80
	lduwa	[%i3+0x030]%asi,%l4	! %l4 = 0000000047a707a4
!	Mem[000000001010142c] = 0cd1ed8f, %l0 = 0000000000010027
	ldsh	[%i4+0x02c],%l0		! %l0 = 0000000000000cd1
!	Mem[000000001008143c] = 751f1beb, %f10 = 66000000
	ld	[%i2+0x03c],%f10	! %f10 = 751f1beb
!	Mem[0000000010101400] = ff0000ff, %l2 = 0000000024417204, %asi = 80
	ldswa	[%i4+0x000]%asi,%l2	! %l2 = ffffffffff0000ff
!	Mem[0000000010141408] = 0d789c763de296a9, %f16 = 2f578400 ce0348fd
	ldda	[%i5+%o4]0x88,%f16	! %f16 = 0d789c76 3de296a9
!	Mem[0000000030101410] = 0d789c76, %l1 = 0000000024417204
	ldswa	[%i4+%o5]0x89,%l1	! %l1 = 000000000d789c76
!	%l7 = 0000000000000000, imm = 0000000000000bcf, %l3 = 0000000000000d7a
	andn	%l7,0xbcf,%l3		! %l3 = 0000000000000000
!	Mem[00000000300c1400] = 6242bf40, %l3 = 0000000000000000
	ldsba	[%i3+%g0]0x89,%l3	! %l3 = 0000000000000040
!	Mem[0000000010081400] = 00000066, %l2 = ffffffffff0000ff
	lduha	[%i2+%g0]0x88,%l2	! %l2 = 0000000000000066

p0_label_47:
!	Starting 10 instruction Store Burst
!	Mem[0000000010181410] = ffa03c4c, %l3 = 0000000000000040
	swapa	[%i6+%o5]0x80,%l3	! %l3 = 00000000ffa03c4c
!	%l6 = 6600000047ac1fcb, Mem[00000000100c1410] = 49bc2552
	stba	%l6,[%i3+%o5]0x80	! Mem[00000000100c1410] = cbbc2552
!	%f7  = 769c780d, Mem[0000000030101410] = 0d789c76
	sta	%f7 ,[%i4+%o5]0x89	! Mem[0000000030101410] = 769c780d
!	Mem[0000000020800041] = 51eee580, %l5 = 000000000000a996
	ldstub	[%o1+0x041],%l5		! %l5 = 00000000000000ee
!	Mem[0000000030001410] = ef000559, %l0 = 0000000000000cd1
	ldstuba	[%i0+%o5]0x81,%l0	! %l0 = 00000000000000ef
!	%l5 = 00000000000000ee, Mem[0000000010041410] = 78ff0000
	stba	%l5,[%i1+%o5]0x80	! Mem[0000000010041410] = eeff0000
!	Mem[00000000211c0000] = ffff7fb0, %l0 = 00000000000000ef
	ldstub	[%o2+%g0],%l0		! %l0 = 00000000000000ff
!	Mem[0000000030101410] = 0d789c76, %l3 = 00000000ffa03c4c
	swapa	[%i4+%o5]0x81,%l3	! %l3 = 000000000d789c76
!	Mem[0000000030081408] = ed8f03ce, %l4 = 0000000047a707a4
	ldstuba	[%i2+%o4]0x81,%l4	! %l4 = 00000000000000ed
!	Mem[0000000030041408] = 00000066, %l6 = 0000000047ac1fcb
	swapa	[%i1+%o4]0x89,%l6	! %l6 = 0000000000000066

p0_label_48:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = 2f57840000000000, %f20 = bde40559 e0a9fd34
	ldda	[%i0+%g0]0x88,%f20	! %f20 = 2f578400 00000000
!	Mem[0000000010001400] = 00000000, %l0 = 00000000000000ff
	lduba	[%i0+%g0]0x88,%l0	! %l0 = 0000000000000000
!	%l0 = 0000000000000000, %l0 = 0000000000000000, %l6 = 0000000000000066
	udivx	%l0,%l0,%l6		! Div by zero, %l0 = 0000000000000028
!	Mem[000000001008141a] = 391ae375, %l4 = 00000000000000ed
	lduh	[%i2+0x01a],%l4		! %l4 = 000000000000e375
!	Mem[0000000010141408] = a996e23d, %l2 = 0000000000000066
	ldswa	[%i5+%o4]0x80,%l2	! %l2 = ffffffffa996e23d
!	Mem[00000000100c1410] = 5225bccb, %l1 = 000000000d789c76
	lduwa	[%i3+%o5]0x88,%l1	! %l1 = 000000005225bccb
!	Mem[0000000010001408] = 3de296ff, %l2 = ffffffffa996e23d
	lduha	[%i0+%o4]0x88,%l2	! %l2 = 00000000000096ff
!	%l0 = 0000000000000028, %l3 = 000000000d789c76, %l6  = 0000000000000066
	mulx	%l0,%l3,%l6		! %l6 = 000000021ad87270
!	Mem[0000000010001400] = 00000000, %l5 = 00000000000000ee
	lduba	[%i0+%g0]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000030081400] = fd4803ce, %l0 = 0000000000000028
	lduba	[%i2+%g0]0x81,%l0	! %l0 = 00000000000000fd

p0_label_49:
!	Starting 10 instruction Store Burst
!	Mem[0000000030081410] = 0000007f, %l4 = 000000000000e375
	swapa	[%i2+%o5]0x81,%l4	! %l4 = 000000000000007f
!	%l6 = 1ad87270, %l7 = 00000000, Mem[0000000010001400] = 00000000 0084572f
	stda	%l6,[%i0+%g0]0x80	! Mem[0000000010001400] = 1ad87270 00000000
!	Mem[0000000030101408] = 010000ff, %l7 = 0000000000000000
	ldstuba	[%i4+%o4]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010181408] = 00000035, %l3 = 0d789c76, %l7 = 000000ff
	add	%i6,0x08,%g1
	casa	[%g1]0x80,%l3,%l7	! %l7 = 0000000000000035
!	%l4 = 0000007f, %l5 = 00000000, Mem[0000000010181408] = 35000000 57c5cf10
	stda	%l4,[%i6+%o4]0x88	! Mem[0000000010181408] = 0000007f 00000000
!	%l4 = 0000007f, %l5 = 00000000, Mem[0000000010001410] = 00000000 00000000
	stda	%l4,[%i0+%o5]0x88	! Mem[0000000010001410] = 0000007f 00000000
!	Mem[00000000100c1400] = 5e87d3ab, %l3 = 000000000d789c76
	swapa	[%i3+%g0]0x88,%l3	! %l3 = 000000005e87d3ab
!	%f14 = 49bc2552, Mem[0000000010001408] = ff96e23d
	sta	%f14,[%i0+%o4]0x80	! Mem[0000000010001408] = 49bc2552
!	Mem[0000000010181410] = 00000040, %l2 = 00000000000096ff
	ldstuba	[%i6+%o5]0x80,%l2	! %l2 = 0000000000000000
!	%l6 = 1ad87270, %l7 = 00000035, Mem[0000000010181400] = 66000000 ffffffee
	stda	%l6,[%i6+%g0]0x80	! Mem[0000000010181400] = 1ad87270 00000035

p0_label_50:
!	Starting 10 instruction Load Burst
!	Mem[0000000030101408] = ff000001, %l5 = 0000000000000000
	ldswa	[%i4+%o4]0x81,%l5	! %l5 = ffffffffff000001
!	Mem[0000000030101410] = ffa03c4c, %l1 = 000000005225bccb
	lduha	[%i4+%o5]0x81,%l1	! %l1 = 000000000000ffa0
!	Mem[0000000030041400] = 047241247a0d0000, %l2 = 0000000000000000
	ldxa	[%i1+%g0]0x81,%l2	! %l2 = 047241247a0d0000
!	Mem[0000000010101400] = ff0000ff, %l4 = 000000000000007f
	lduha	[%i4+%g0]0x80,%l4	! %l4 = 000000000000ff00
!	Mem[0000000010181404] = 00000035, %l6 = 000000021ad87270
	lduh	[%i6+0x004],%l6		! %l6 = 0000000000000000
!	Mem[00000000300c1400] = 40bf4262, %l0 = 00000000000000fd
	lduba	[%i3+%g0]0x81,%l0	! %l0 = 0000000000000040
!	Mem[0000000030181400] = 416de011000003ff, %f14 = 49bc2552 488f9f2d
	ldda	[%i6+%g0]0x89,%f14	! %f14 = 416de011 000003ff
!	%l2 = 047241247a0d0000, immd = 0000000000000ff5, %l108 = 0000000000000005
	sdivx	%l2,0xff5,%l5		! %l5 = 000047551ccb6caa
!	Mem[00000000100c1400] = 769c780d, %l5 = 000047551ccb6caa
	lduwa	[%i3+%g0]0x80,%l5	! %l5 = 00000000769c780d
!	Mem[00000000300c1410] = 49bc0000, %l3 = 000000005e87d3ab
	lduba	[%i3+%o5]0x81,%l3	! %l3 = 0000000000000049

p0_label_51:
!	Starting 10 instruction Store Burst
!	%l0 = 0000000000000040, Mem[0000000010001420] = 49bc2552
	stw	%l0,[%i0+0x020]		! Mem[0000000010001420] = 00000040
!	%l3 = 0000000000000049, Mem[0000000030001400] = fd4803ce0084572f
	stxa	%l3,[%i0+%g0]0x89	! Mem[0000000030001400] = 0000000000000049
!	Mem[0000000010141410] = 27771f4c, %l3 = 0000000000000049
	ldstuba	[%i5+%o5]0x80,%l3	! %l3 = 0000000000000027
!	Mem[00000000211c0000] = ffff7fb0, %l4 = 000000000000ff00
	ldstuba	[%o2+0x000]%asi,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010081400] = 00000066, %l7 = 0000000000000035
	swapa	[%i2+%g0]0x88,%l7	! %l7 = 0000000000000066
!	%l3 = 0000000000000027, Mem[0000000030141400] = a996e23d5905e4bd
	stxa	%l3,[%i5+%g0]0x81	! Mem[0000000030141400] = 0000000000000027
!	%f15 = 000003ff, Mem[0000000030041410] = 0000ffff
	sta	%f15,[%i1+%o5]0x81	! Mem[0000000030041410] = 000003ff
!	%f8  = 6c1ca198 5225bc49, Mem[0000000010001410] = 7f000000 00000000
	stda	%f8 ,[%i0+%o5]0x80	! Mem[0000000010001410] = 6c1ca198 5225bc49
!	%l5 = 00000000769c780d, %l0 = 0000000000000040, %y  = 00000000
	umul	%l5,%l0,%l6		! %l6 = 0000001da71e0340, %y = 0000001d
!	Mem[0000000030181400] = 000003ff, %l7 = 0000000000000066
	ldstuba	[%i6+%g0]0x89,%l7	! %l7 = 00000000000000ff

p0_label_52:
!	Starting 10 instruction Load Burst
!	Mem[0000000020800041] = 51ffe580, %l0 = 0000000000000040
	ldub	[%o1+0x041],%l0		! %l0 = 00000000000000ff
!	Mem[0000000010181408] = 000000000000007f, %f2  = ff0000ff 3de296a9
	ldda	[%i6+%o4]0x88,%f2 	! %f2  = 00000000 0000007f
!	Mem[0000000010141400] = 2d00000060000000, %l3 = 0000000000000027, %asi = 80
	ldxa	[%i5+0x000]%asi,%l3	! %l3 = 2d00000060000000
!	%f1  = ce0348fd, %f30 = 49bc2552
	fcmpes	%fcc0,%f1 ,%f30		! %fcc0 = 1
!	Mem[00000000300c1408] = 57f64e10 fef0cc0b, %l6 = a71e0340, %l7 = 000000ff
	ldda	[%i3+%o4]0x81,%l6	! %l6 = 0000000057f64e10 00000000fef0cc0b
!	Mem[0000000030081408] = ff0000ffce038fff, %f20 = 2f578400 00000000
	ldda	[%i2+%o4]0x89,%f20	! %f20 = ff0000ff ce038fff
!	Mem[0000000010001408] = 5225bc49, %l6 = 0000000057f64e10
	ldswa	[%i0+%o4]0x88,%l6	! %l6 = 000000005225bc49
!	Mem[0000000030101410] = 4c3ca0ff, %l7 = 00000000fef0cc0b
	ldswa	[%i4+%o5]0x89,%l7	! %l7 = 000000004c3ca0ff
!	Mem[0000000030041408] = cb1fac47, %l2 = 047241247a0d0000
	lduba	[%i1+%o4]0x81,%l2	! %l2 = 00000000000000cb
!	Mem[0000000010081410] = 0d789c76 5847140f, %l2 = 000000cb, %l3 = 60000000
	ldda	[%i2+%o5]0x88,%l2	! %l2 = 000000005847140f 000000000d789c76

p0_label_53:
!	Starting 10 instruction Store Burst
!	%l4 = 00000000000000ff, Mem[00000000100c1428] = 1a028236, %asi = 80
	stwa	%l4,[%i3+0x028]%asi	! Mem[00000000100c1428] = 000000ff
!	%f30 = 49bc2552 488f9f2d, Mem[0000000030001400] = 49000000 00000000
	stda	%f30,[%i0+%g0]0x81	! Mem[0000000030001400] = 49bc2552 488f9f2d
!	Mem[0000000021800000] = 64f595e0, %l6 = 000000005225bc49
	ldstub	[%o3+%g0],%l6		! %l6 = 0000000000000064
!	Mem[0000000030141408] = ffffffff, %l7 = 000000004c3ca0ff
	ldstuba	[%i5+%o4]0x81,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010181430] = 0000000000000007, %l2 = 000000005847140f, %l0 = 00000000000000ff
	add	%i6,0x30,%g1
	casxa	[%g1]0x80,%l2,%l0	! %l0 = 0000000000000007
!	%f23 = 769c780d, Mem[0000000010101400] = ff0000ff
	sta	%f23,[%i4+%g0]0x80	! Mem[0000000010101400] = 769c780d
!	Mem[0000000010041439] = 007f2242, %l2 = 000000005847140f
	ldstuba	[%i1+0x039]%asi,%l2	! %l2 = 000000000000007f
!	%l7 = 00000000000000ff, Mem[0000000030041410] = ff030000
	stwa	%l7,[%i1+%o5]0x89	! Mem[0000000030041410] = 000000ff
!	%l2 = 000000000000007f, Mem[0000000010001410] = 6c1ca198
	stha	%l2,[%i0+%o5]0x80	! Mem[0000000010001410] = 007fa198
!	%l1 = 000000000000ffa0, Mem[0000000030081400] = ce0348fd
	stwa	%l1,[%i2+%g0]0x89	! Mem[0000000030081400] = 0000ffa0

p0_label_54:
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = a0ff0000, %f26 = 66000000
	lda	[%i2+%g0]0x81,%f26	! %f26 = a0ff0000
!	Mem[0000000010101410] = 57f64e10e0a9fd34, %f10 = 751f1beb 47ac1fcb, %asi = 80
	ldda	[%i4+0x010]%asi,%f10	! %f10 = 57f64e10 e0a9fd34
!	Mem[0000000010181400] = 7072d81a, %f24 = 6c1ca198
	lda	[%i6+%g0]0x88,%f24	! %f24 = 7072d81a
!	Mem[0000000021800100] = ff78c6a0, %l4 = 00000000000000ff
	ldsh	[%o3+0x100],%l4		! %l4 = ffffffffffffff78
!	Mem[00000000300c1408] = 0bccf0fe 104ef657, %l4 = ffffff78, %l5 = 769c780d
	ldda	[%i3+%o4]0x89,%l4	! %l4 = 00000000104ef657 000000000bccf0fe
!	Mem[00000000300c1400] = 40bf4262, %l7 = 00000000000000ff
	ldswa	[%i3+%g0]0x81,%l7	! %l7 = 0000000040bf4262
!	%f27 = 47ac1fcb, %f21 = ce038fff
	fcmpes	%fcc0,%f27,%f21		! %fcc0 = 2
!	Mem[0000000021800000] = fff595e0, %l3 = 000000000d789c76, %asi = 80
	lduha	[%o3+0x000]%asi,%l3	! %l3 = 000000000000fff5
!	Mem[00000000100c1400] = 769c780d, %l7 = 0000000040bf4262
	ldswa	[%i3+%g0]0x80,%l7	! %l7 = 00000000769c780d
!	%f22 = 713b7d44, %f1  = ce0348fd
	fcmpes	%fcc2,%f22,%f1 		! %fcc2 = 2

p0_label_55:
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1400] = 0d789c76, %l1 = 000000000000ffa0
	ldstuba	[%i3+%g0]0x88,%l1	! %l1 = 0000000000000076
!	%l2 = 000000000000007f, %l2 = 000000000000007f, %l2 = 000000000000007f
	orn	%l2,%l2,%l2		! %l2 = ffffffffffffffff
!	%f26 = a0ff0000 47ac1fcb, %l0 = 0000000000000007
!	Mem[0000000010081400] = 3500000047ac1fcb
	stda	%f26,[%i2+%l0]ASI_PST16_PL ! Mem[0000000010081400] = cb1fac4700001fcb
!	Mem[00000000100c1400] = 0d789cff, %l2 = ffffffffffffffff
	ldstuba	[%i3+%g0]0x88,%l2	! %l2 = 00000000000000ff
!	%f27 = 47ac1fcb, Mem[0000000010101410] = 57f64e10
	st	%f27,[%i4+%o5]		! Mem[0000000010101410] = 47ac1fcb
!	%f29 = 4c1f7727, Mem[0000000010101434] = 34b01785
	st	%f29,[%i4+0x034]	! Mem[0000000010101434] = 4c1f7727
!	%f14 = 416de011, Mem[0000000010101410] = 47ac1fcb
	sta	%f14,[%i4+%o5]0x80	! Mem[0000000010101410] = 416de011
!	%f26 = a0ff0000 47ac1fcb, Mem[0000000010041408] = 044600ff ffffffee
	stda	%f26,[%i1+%o4]0x88	! Mem[0000000010041408] = a0ff0000 47ac1fcb
!	%l6 = 00000064, %l7 = 769c780d, Mem[0000000010041410] = 0000ffee 00000037
	stda	%l6,[%i1+%o5]0x88	! Mem[0000000010041410] = 00000064 769c780d
!	%l5 = 000000000bccf0fe, Mem[0000000030181410] = 713b7d44e052f6ff
	stxa	%l5,[%i6+%o5]0x81	! Mem[0000000030181410] = 000000000bccf0fe

p0_label_56:
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = 00000d7a24417204, %f10 = 57f64e10 e0a9fd34
	ldda	[%i1+%g0]0x89,%f10	! %f10 = 00000d7a 24417204
!	Mem[0000000010081410] = 0d789c76 5847140f, %l6 = 00000064, %l7 = 769c780d
	ldda	[%i2+%o5]0x88,%l6	! %l6 = 000000005847140f 000000000d789c76
!	Mem[0000000020800000] = ffffc750, %l3 = 000000000000fff5
	lduh	[%o1+%g0],%l3		! %l3 = 000000000000ffff
!	Mem[0000000010141408] = a996e23d769c780d, %f10 = 00000d7a 24417204
	ldda	[%i5+%o4]0x80,%f10	! %f10 = a996e23d 769c780d
!	Mem[0000000010101408] = ffffffff, %l3 = 000000000000ffff
	lduwa	[%i4+%o4]0x80,%l3	! %l3 = 00000000ffffffff
!	Mem[0000000030081410] = 0000e375 ffffffff, %l4 = 104ef657, %l5 = 0bccf0fe
	ldda	[%i2+%o5]0x81,%l4	! %l4 = 000000000000e375 00000000ffffffff
!	Mem[0000000030141400] = 00000000 00000027, %l4 = 0000e375, %l5 = ffffffff
	ldda	[%i5+%g0]0x81,%l4	! %l4 = 0000000000000000 0000000000000027
!	Mem[0000000010181400] = 7072d81a, %l0 = 0000000000000007
	lduba	[%i6+%g0]0x88,%l0	! %l0 = 000000000000001a
!	Mem[0000000030041410] = ff000000, %f8  = 6c1ca198
	lda	[%i1+%o5]0x81,%f8 	! %f8 = ff000000
!	Mem[0000000010001400] = 7072d81a, %f1  = ce0348fd
	lda	[%i0+%g0]0x88,%f1 	! %f1 = 7072d81a

p0_label_57:
!	Starting 10 instruction Store Burst
!	%l5 = 0000000000000027, Mem[0000000030041408] = cb1fac47
	stba	%l5,[%i1+%o4]0x81	! Mem[0000000030041408] = 271fac47
!	Mem[00000000300c1400] = 6242bf40, %l1 = 0000000000000076
	ldstuba	[%i3+%g0]0x89,%l1	! %l1 = 0000000000000040
!	Mem[0000000010041414] = 0d789c76, %l3 = ffffffff, %l7 = 0d789c76
	add	%i1,0x14,%g1
	casa	[%g1]0x80,%l3,%l7	! %l7 = 000000000d789c76
!	%l6 = 000000005847140f, Mem[0000000010041400] = e052f6ff
	stha	%l6,[%i1+%g0]0x88	! Mem[0000000010041400] = e052140f
!	Mem[0000000010101410] = 11e06d41, %l3 = 00000000ffffffff
	swapa	[%i4+%o5]0x88,%l3	! %l3 = 0000000011e06d41
!	Mem[0000000010081424] = 1159ce89, %l2 = 00000000000000ff, %asi = 80
	swapa	[%i2+0x024]%asi,%l2	! %l2 = 000000001159ce89
!	%f16 = 0d789c76, Mem[0000000010001410] = 98a17f00
	sta	%f16,[%i0+%o5]0x88	! Mem[0000000010001410] = 0d789c76
!	%l2 = 000000001159ce89, Mem[0000000030141410] = 2d9f8f485225bc49
	stxa	%l2,[%i5+%o5]0x89	! Mem[0000000030141410] = 000000001159ce89
!	Mem[0000000010041408] = 47ac1fcb, %l7 = 000000000d789c76
	swapa	[%i1+%o4]0x88,%l7	! %l7 = 0000000047ac1fcb
!	Mem[0000000030181408] = 00000057, %l6 = 000000005847140f
	ldstuba	[%i6+%o4]0x81,%l6	! %l6 = 0000000000000000

p0_label_58:
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0001] = ffff2520, %l4 = 0000000000000000, %asi = 80
	lduba	[%o0+0x001]%asi,%l4	! %l4 = 00000000000000ff
	membar	#Sync			! Added by membar checker (9)
!	Mem[0000000010001400] = 1ad87270 00000000 49bc2552 ff0000ff
!	Mem[0000000010001410] = 769c780d 5225bc49 0d789c76 447d3b71
!	Mem[0000000010001420] = 00000040 98a11c6c cb1fac47 00000066
!	Mem[0000000010001430] = 27771f4c 00000057 2d9f8f48 5225bc49
	ldda	[%i0+%g0]ASI_BLK_P,%f16	! Block Load from 0000000010001400
!	Mem[0000000030041400] = 04724124 7a0d0000 271fac47 e1a65e49
!	Mem[0000000030041410] = ff000000 4732259d 17a5691a 6729cc83
!	Mem[0000000030041420] = 2c3beca8 1b45b119 3f7b6926 11ee54df
!	Mem[0000000030041430] = 6bab6a14 2fdfe555 75dcf6f2 4b5c9bfb
	ldda	[%i1+%g0]ASI_BLK_S,%f16	! Block Load from 0000000030041400
!	Mem[0000000010081400] = cb1fac47 00001fcb 0000002d 000000ff
!	Mem[0000000010081410] = 0f144758 769c780d 391ae375 00000066
!	Mem[0000000010081420] = 67fa18d8 000000ff 000000ae 0e6a01cf
!	Mem[0000000010081430] = 4b7f8d44 2f0bbdc5 774f67a2 751f1beb
	ldda	[%i2+%g0]ASI_BLK_P,%f16	! Block Load from 0000000010081400
!	Mem[0000000030141400] = 2700000000000000, %f4  = bde40559 e0a9fd34
	ldda	[%i5+%g0]0x89,%f4 	! %f4  = 27000000 00000000
!	Mem[00000000201c0000] = ffff2520, %l2 = 000000001159ce89, %asi = 80
	ldsba	[%o0+0x000]%asi,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000010041400] = 0f1452e0 447d3b71, %l0 = 0000001a, %l1 = 00000040
	ldda	[%i1+%g0]0x80,%l0	! %l0 = 000000000f1452e0 00000000447d3b71
!	Mem[0000000010001408] = 49bc2552, %l0 = 000000000f1452e0
	ldswa	[%i0+%o4]0x80,%l0	! %l0 = 0000000049bc2552
!	Mem[0000000010001433] = 27771f4c, %l4 = 00000000000000ff
	ldub	[%i0+0x033],%l4		! %l4 = 000000000000004c
!	Mem[00000000201c0000] = ffff2520, %l0 = 0000000049bc2552
	ldsh	[%o0+%g0],%l0		! %l0 = ffffffffffffffff

p0_label_59:
!	Starting 10 instruction Store Burst
!	%l0 = ffffffff, %l1 = 447d3b71, Mem[0000000030181410] = 00000000 fef0cc0b
	stda	%l0,[%i6+%o5]0x89	! Mem[0000000030181410] = ffffffff 447d3b71
!	Mem[0000000030081400] = a0ff0000 0084572f ff8f03ce ff0000ff
!	%f16 = cb1fac47 00001fcb 0000002d 000000ff
!	%f20 = 0f144758 769c780d 391ae375 00000066
!	%f24 = 67fa18d8 000000ff 000000ae 0e6a01cf
!	%f28 = 4b7f8d44 2f0bbdc5 774f67a2 751f1beb
	stda	%f16,[%i2+%g0]ASI_BLK_SL	! Block Store to 0000000030081400
!	Mem[0000000030101400] = 37578400 37787411 ff000001 19fae487
!	%f0  = 5847140f 7072d81a 00000000 0000007f
!	%f4  = 27000000 00000000 713b7d44 769c780d
!	%f8  = ff000000 5225bc49 a996e23d 769c780d
!	%f12 = fd4803ce 0084572f 416de011 000003ff
	stda	%f0 ,[%i4+%g0]ASI_BLK_S	! Block Store to 0000000030101400
!	%l0 = ffffffffffffffff, Mem[00000000211c0000] = ffff7fb0
	sth	%l0,[%o2+%g0]		! Mem[00000000211c0000] = ffff7fb0
!	%l5 = 0000000000000027, Mem[0000000010141408] = 3de296a9
	stba	%l5,[%i5+%o4]0x88	! Mem[0000000010141408] = 3de29627
!	%l7 = 0000000047ac1fcb, Mem[00000000300c1408] = 104ef657
	stha	%l7,[%i3+%o4]0x89	! Mem[00000000300c1408] = 104e1fcb
!	%l6 = 0000000000000000, %l4 = 000000000000004c, %l2 = ffffffffffffffff
	sub	%l6,%l4,%l2		! %l2 = ffffffffffffffb4
!	Mem[0000000010141400] = 2d00000060000000, %l6 = 0000000000000000, %l7 = 0000000047ac1fcb
	casxa	[%i5]0x80,%l6,%l7	! %l7 = 2d00000060000000
	membar	#Sync			! Added by membar checker (10)
!	%f2  = 00000000 0000007f, Mem[0000000030041400] = 04724124 7a0d0000
	stda	%f2 ,[%i1+%g0]0x81	! Mem[0000000030041400] = 00000000 0000007f
!	Code Fragment 4, seed = 307530
p0_fragment_4:
!	%l0 = ffffffffffffffff
	setx	0x19e1c0d7b87757d6,%g7,%l0 ! %l0 = 19e1c0d7b87757d6
!	%l1 = 00000000447d3b71
	setx	0xe7e88e0d23953d01,%g7,%l1 ! %l1 = e7e88e0d23953d01
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 19e1c0d7b87757d6
	setx	0xf92611fb6615b63c,%g7,%l0 ! %l0 = f92611fb6615b63c
!	%l1 = e7e88e0d23953d01
	setx	0x372da1a88511c687,%g7,%l1 ! %l1 = 372da1a88511c687
p0_fragment_4_end:

p0_label_60:
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = 104e1fcb, %l2 = ffffffffffffffb4
	lduha	[%i3+%o4]0x89,%l2	! %l2 = 0000000000001fcb
!	Mem[0000000010101410] = ffffffff, %f6  = 713b7d44
	lda	[%i4+%o5]0x80,%f6 	! %f6 = ffffffff
!	Mem[0000000010101408] = ffffffff 0000ffff, %l6 = 00000000, %l7 = 60000000
	ldd	[%i4+%o4],%l6		! %l6 = 00000000ffffffff 000000000000ffff
!	Code Fragment 3, seed = 874567
p0_fragment_5:
!	%l0 = f92611fb6615b63c
	setx	0x1d0ea64522daacee,%g7,%l0 ! %l0 = 1d0ea64522daacee
!	%l1 = 372da1a88511c687
	setx	0xb17f1418c3106699,%g7,%l1 ! %l1 = b17f1418c3106699
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 1d0ea64522daacee
	setx	0x35f75a46eb1a8c54,%g7,%l0 ! %l0 = 35f75a46eb1a8c54
!	%l1 = b17f1418c3106699
	setx	0x2b1b0244fc4aa11f,%g7,%l1 ! %l1 = 2b1b0244fc4aa11f
p0_fragment_5_end:
!	Mem[0000000010181410] = ff000040, %l4 = 000000000000004c
	lduha	[%i6+%o5]0x80,%l4	! %l4 = 000000000000ff00
!	Mem[0000000030041400] = 00000000, %l4 = 000000000000ff00
	lduwa	[%i1+%g0]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000020800040] = 51ffe580, %l6 = 00000000ffffffff, %asi = 80
	ldsha	[%o1+0x040]%asi,%l6	! %l6 = 00000000000051ff
!	Mem[0000000010181400] = 1ad87270 00000035 7f000000 00000000
!	Mem[0000000010181410] = ff000040 92e92444 7e0e314a 7fec95f3
!	Mem[0000000010181420] = 6e5eea58 21ba6a09 00000000 00000066
!	Mem[0000000010181430] = 00000000 00000007 25c8dd22 7a1ecca1
	ldda	[%i6+%g0]ASI_BLK_AIUP,%f0 	! Block Load from 0000000010181400
!	Mem[0000000010041400] = e052140f, %f30 = 774f67a2
	lda	[%i1+%g0]0x88,%f30	! %f30 = e052140f
!	Mem[0000000010101408] = ffffffff, %f17 = 00001fcb
	ld	[%i4+%o4],%f17		! %f17 = ffffffff

p0_label_61:
!	Starting 10 instruction Store Burst
!	%f24 = 67fa18d8 000000ff, Mem[0000000010041408] = 0d789c76 a0ff0000
	stda	%f24,[%i1+%o4]0x88	! Mem[0000000010041408] = 67fa18d8 000000ff
!	%f20 = 0f144758 769c780d, Mem[0000000030001410] = ff000559 e0a9fd34
	stda	%f20,[%i0+%o5]0x81	! Mem[0000000030001410] = 0f144758 769c780d
!	%f16 = cb1fac47 ffffffff, %l1 = 2b1b0244fc4aa11f
!	Mem[0000000030041438] = 75dcf6f24b5c9bfb
	add	%i1,0x038,%g1
	stda	%f16,[%g1+%l1]ASI_PST16_S ! Mem[0000000030041438] = cb1fac47ffffffff
!	Code Fragment 4, seed = 923864
p0_fragment_6:
!	%l0 = 35f75a46eb1a8c54
	setx	0x063a7e11862f0966,%g7,%l0 ! %l0 = 063a7e11862f0966
!	%l1 = 2b1b0244fc4aa11f
	setx	0xa198a479a2c97991,%g7,%l1 ! %l1 = a198a479a2c97991
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 063a7e11862f0966
	setx	0x566c3617013c8dcc,%g7,%l0 ! %l0 = 566c3617013c8dcc
!	%l1 = a198a479a2c97991
	setx	0x2781676d62044917,%g7,%l1 ! %l1 = 2781676d62044917
p0_fragment_6_end:
!	Mem[00000000300c1400] = ffbf4262, %l1 = 0000000062044917
	swapa	[%i3+%g0]0x81,%l1	! %l1 = 00000000ffbf4262
!	%l0 = 013c8dcc, %l1 = ffbf4262, Mem[0000000010041400] = e052140f 713b7d44
	stda	%l0,[%i1+%g0]0x88	! Mem[0000000010041400] = 013c8dcc ffbf4262
	membar	#Sync			! Added by membar checker (11)
!	%l1 = 00000000ffbf4262, Mem[0000000010181400] = 7072d81a
	stba	%l1,[%i6+%g0]0x88	! Mem[0000000010181400] = 7072d862
!	Mem[0000000010081400] = cb1fac47, %l2 = 0000000000001fcb
	ldstuba	[%i2+%g0]0x80,%l2	! %l2 = 00000000000000cb
!	Mem[0000000010101400] = 769c780d, %l2 = 00000000000000cb
	ldstuba	[%i4+%g0]0x80,%l2	! %l2 = 0000000000000076
!	%f22 = 391ae375 00000066, %l3 = 0000000011e06d41
!	Mem[0000000030081428] = cf016a0eae000000
	add	%i2,0x028,%g1
	stda	%f22,[%g1+%l3]ASI_PST16_SL ! Mem[0000000030081428] = 66006a0eae000000

p0_label_62:
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = ff000057, %l0 = 566c3617013c8dcc
	lduha	[%i6+%o4]0x81,%l0	! %l0 = 000000000000ff00
!	Mem[00000000300c1400] = 6204491787e4fa19, %f0  = 1ad87270 00000035
	ldda	[%i3+%g0]0x81,%f0 	! %f0  = 62044917 87e4fa19
!	Mem[0000000021800181] = ffa54700, %l2 = 0000000000000076, %asi = 80
	ldsba	[%o3+0x181]%asi,%l2	! %l2 = ffffffffffffffa5
!	Mem[0000000021800141] = 17aa48d0, %l7 = 000000000000ffff
	ldub	[%o3+0x141],%l7		! %l7 = 00000000000000aa
!	Mem[0000000020800040] = 51ffe580, %l1 = 00000000ffbf4262
	ldsh	[%o1+0x040],%l1		! %l1 = 00000000000051ff
!	Mem[0000000030041410] = 000000ff, %l2 = ffffffffffffffa5
	ldswa	[%i1+%o5]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030141400] = 2700000000000000, %l3 = 0000000011e06d41
	ldxa	[%i5+%g0]0x89,%l3	! %l3 = 2700000000000000
!	Mem[0000000010141410] = 57000000 4c1f77ff, %l4 = 00000000, %l5 = 00000027
	ldda	[%i5+%o5]0x88,%l4	! %l4 = 000000004c1f77ff 0000000057000000
!	Mem[0000000010141424] = 529afb29, %l1 = 00000000000051ff
	lduw	[%i5+0x024],%l1		! %l1 = 00000000529afb29
!	Mem[00000000300c1410] = 0000bc49, %l7 = 00000000000000aa
	lduwa	[%i3+%o5]0x89,%l7	! %l7 = 000000000000bc49

p0_label_63:
!	Starting 10 instruction Store Burst
!	Mem[000000001000142c] = 00000066, %l6 = 00000000000051ff
	ldstub	[%i0+0x02c],%l6		! %l6 = 0000000000000000
!	%l6 = 0000000000000000, Mem[00000000300c1400] = 17490462
	stba	%l6,[%i3+%g0]0x89	! Mem[00000000300c1400] = 17490400
!	Mem[0000000010181408] = 0000007f, %l2 = 00000000000000ff
	swapa	[%i6+%o4]0x88,%l2	! %l2 = 000000000000007f
!	%l7 = 000000000000bc49, Mem[0000000030081410] = 0d789c76
	stwa	%l7,[%i2+%o5]0x81	! Mem[0000000030081410] = 0000bc49
!	Mem[0000000030081410] = 49bc0000, %l4 = 000000004c1f77ff
	swapa	[%i2+%o5]0x89,%l4	! %l4 = 0000000049bc0000
!	Mem[0000000010001400] = 1ad87270 00000000 49bc2552 ff0000ff
!	%f0  = 62044917 87e4fa19 7f000000 00000000
!	%f4  = ff000040 92e92444 7e0e314a 7fec95f3
!	%f8  = 6e5eea58 21ba6a09 00000000 00000066
!	%f12 = 00000000 00000007 25c8dd22 7a1ecca1
	stda	%f0 ,[%i0+%g0]ASI_BLK_AIUP	! Block Store to 0000000010001400
!	%f14 = 25c8dd22 7a1ecca1, %l6 = 0000000000000000
!	Mem[0000000010001410] = ff00004092e92444
	add	%i0,0x010,%g1
	stda	%f14,[%g1+%l6]ASI_PST8_PL ! Mem[0000000010001410] = ff00004092e92444
!	%l7 = 000000000000bc49, Mem[0000000010001410] = ff000040
	stba	%l7,[%i0+%o5]0x80	! Mem[0000000010001410] = 49000040
!	Mem[0000000010101400] = 0d789cff, %l4 = 0000000049bc0000
	ldstuba	[%i4+%g0]0x88,%l4	! %l4 = 00000000000000ff
!	%l4 = 00000000000000ff, Mem[0000000010141426] = 529afb29, %asi = 80
	stha	%l4,[%i5+0x026]%asi	! Mem[0000000010141424] = 529a00ff

p0_label_64:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = 400000ff, %l0 = 000000000000ff00
	ldsba	[%i6+%o5]0x88,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000030041400] = 00000000, %f19 = 000000ff
	lda	[%i1+%g0]0x89,%f19	! %f19 = 00000000
!	Mem[0000000010181410] = 400000ff, %l1 = 00000000529afb29
	ldsba	[%i6+%o5]0x88,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000030141408] = ffffffff, %l0 = ffffffffffffffff
	ldsba	[%i5+%o4]0x89,%l0	! %l0 = ffffffffffffffff
!	Mem[00000000100c143f] = 47ac1fcb, %l5 = 0000000057000000
	ldub	[%i3+0x03f],%l5		! %l5 = 00000000000000cb
!	Mem[000000001010140c] = 0000ffff, %l6 = 0000000000000000
	lduw	[%i4+0x00c],%l6		! %l6 = 000000000000ffff
!	Mem[0000000030141410] = 00000000 1159ce89, %l2 = 0000007f, %l3 = 00000000
	ldda	[%i5+%o5]0x89,%l2	! %l2 = 000000001159ce89 0000000000000000
!	Mem[0000000030101410] = 2700000000000000, %l3 = 0000000000000000
	ldxa	[%i4+%o5]0x81,%l3	! %l3 = 2700000000000000
!	Mem[0000000030181408] = 570000ff, %l5 = 00000000000000cb
	lduha	[%i6+%o4]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030001410] = 0f144758 769c780d, %l2 = 1159ce89, %l3 = 00000000
	ldda	[%i0+%o5]0x81,%l2	! %l2 = 000000000f144758 00000000769c780d

p0_label_65:
!	Starting 10 instruction Store Burst
!	Mem[0000000010101428] = 54f28996, %l3 = 769c780d, %l5 = 000000ff
	add	%i4,0x28,%g1
	casa	[%g1]0x80,%l3,%l5	! %l5 = 0000000054f28996
!	Mem[0000000030001408] = ff0000ff, %l5 = 0000000054f28996
	ldstuba	[%i0+%o4]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030141400] = 00000000, %l1 = ffffffffffffffff
	ldstuba	[%i5+%g0]0x89,%l1	! %l1 = 0000000000000000
!	%l0 = ffffffffffffffff, Mem[0000000030041410] = ff000000
	stha	%l0,[%i1+%o5]0x81	! Mem[0000000030041410] = ffff0000
!	%l3 = 00000000769c780d, Mem[0000000010181410] = ff000040
	stha	%l3,[%i6+%o5]0x80	! Mem[0000000010181410] = 780d0040
!	%f28 = 4b7f8d44 2f0bbdc5, %l6 = 000000000000ffff
!	Mem[0000000030181438] = 37e2d4d2ff0cd75b
	add	%i6,0x038,%g1
	stda	%f28,[%g1+%l6]ASI_PST8_SL ! Mem[0000000030181438] = c5bd0b2f448d7f4b
!	Mem[000000001010143c] = 5e87d3ab, %l7 = 0000bc49, %l1 = 00000000
	add	%i4,0x3c,%g1
	casa	[%g1]0x80,%l7,%l1	! %l1 = 000000005e87d3ab
!	Mem[0000000020800000] = ffffc750, %l2 = 000000000f144758
	ldstuba	[%o1+0x000]%asi,%l2	! %l2 = 00000000000000ff
!	%l6 = 000000000000ffff, Mem[0000000020800001] = ffffc750
	stb	%l6,[%o1+0x001]		! Mem[0000000020800000] = ffffc750
!	Mem[0000000030041410] = ffff0000, %l0 = 00000000ffffffff
	swapa	[%i1+%o5]0x81,%l0	! %l0 = 00000000ffff0000

p0_label_66:
!	Starting 10 instruction Load Burst
!	Code Fragment 3, seed = 944320
p0_fragment_7:
!	%l0 = 00000000ffff0000
	setx	0xea93f076fa08f226,%g7,%l0 ! %l0 = ea93f076fa08f226
!	%l1 = 000000005e87d3ab
	setx	0x69738dd5443e0651,%g7,%l1 ! %l1 = 69738dd5443e0651
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = ea93f076fa08f226
	setx	0xe092c2556d1a7e8c,%g7,%l0 ! %l0 = e092c2556d1a7e8c
!	%l1 = 69738dd5443e0651
	setx	0x8505f0b3d2de5dd7,%g7,%l1 ! %l1 = 8505f0b3d2de5dd7
p0_fragment_7_end:
!	Mem[0000000010101408] = ffffffff, %l0 = e092c2556d1a7e8c
	ldswa	[%i4+%o4]0x88,%l0	! %l0 = ffffffffffffffff
	membar	#Sync			! Added by membar checker (12)
!	Mem[0000000010001414] = 92e92444, %l7 = 000000000000bc49, %asi = 80
	ldsha	[%i0+0x014]%asi,%l7	! %l7 = ffffffffffff92e9
!	Mem[0000000010181400] = 62d8727000000035, %l4 = 00000000000000ff
	ldxa	[%i6+%g0]0x80,%l4	! %l4 = 62d8727000000035
!	Mem[0000000010001408] = 7f00000000000000, %f12 = 00000000 00000007, %asi = 80
	ldda	[%i0+0x008]%asi,%f12	! %f12 = 7f000000 00000000
!	Mem[0000000030081410] = 4c1f77ff, %l0 = ffffffffffffffff
	lduha	[%i2+%o5]0x89,%l0	! %l0 = 00000000000077ff
!	Mem[00000000100c143c] = 47ac1fcb, %f23 = 00000066
	ld	[%i3+0x03c],%f23	! %f23 = 47ac1fcb
!	Mem[0000000030181400] = 000003ff, %f29 = 2f0bbdc5
	lda	[%i6+%g0]0x89,%f29	! %f29 = 000003ff
!	Mem[0000000030141400] = ff000000 00000027 ffffffff 2cd4e237
!	Mem[0000000030141410] = 89ce5911 00000000 0c368e9a 0f40ec03
!	Mem[0000000030141420] = 4abcde28 333dec99 3cf786a6 0c098c5f
!	Mem[0000000030141430] = 0d789c76 447d3b71 21d58c72 3dd76b7b
	ldda	[%i5+%g0]ASI_BLK_AIUSL,%f0 	! Block Load from 0000000030141400
!	Mem[0000000010101400] = ff9c780d 37787411 ffffffff 0000ffff
!	Mem[0000000010101410] = ffffffff e0a9fd34 93ae2666 6ac2f633
!	Mem[0000000010101420] = 6c1ca198 5225bc49 54f28996 0cd1ed8f
!	Mem[0000000010101430] = 24417204 4c1f7727 40bf4262 5e87d3ab
	ldda	[%i4+%g0]ASI_BLK_P,%f16	! Block Load from 0000000010101400

p0_label_67:
!	Starting 10 instruction Store Burst
!	%l2 = 00000000000000ff, Mem[0000000030001400] = 2d9f8f485225bc49
	stxa	%l2,[%i0+%g0]0x89	! Mem[0000000030001400] = 00000000000000ff
!	Mem[0000000010081400] = ff1fac47 00001fcb 0000002d 000000ff
!	%f0  = 27000000 000000ff 37e2d42c ffffffff
!	%f4  = 00000000 1159ce89 03ec400f 9a8e360c
!	%f8  = 99ec3d33 28debc4a 5f8c090c a686f73c
!	%f12 = 713b7d44 769c780d 7b6bd73d 728cd521
	stda	%f0 ,[%i2+%g0]ASI_BLK_PL	! Block Store to 0000000010081400
!	%l7 = ffffffffffff92e9, Mem[00000000100c1414] = 488f9f2d
	stw	%l7,[%i3+0x014]		! Mem[00000000100c1414] = ffff92e9
!	%l3 = 00000000769c780d, immd = fffff12b, %y  = 0000001d
	smul	%l3,-0xed5,%l6		! %l6 = fffff920c13f672f, %y = fffff920
!	Mem[0000000010181406] = 00000035, %l6 = fffff920c13f672f
	ldstub	[%i6+0x006],%l6		! %l6 = 0000000000000000
!	%l4 = 00000035, %l5 = 000000ff, Mem[0000000010081438] = 21d58c72 3dd76b7b, %asi = 80
	stda	%l4,[%i2+0x038]%asi	! Mem[0000000010081438] = 00000035 000000ff
!	%l6 = 00000000, %l7 = ffff92e9, Mem[00000000300c1408] = cb1f4e10 fef0cc0b
	stda	%l6,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00000000 ffff92e9
!	Mem[000000001018140c] = 00000000, %l1 = d2de5dd7, %l4 = 00000035
	add	%i6,0x0c,%g1
	casa	[%g1]0x80,%l1,%l4	! %l4 = 0000000000000000
!	Mem[0000000010101410] = ffffffff, %l1 = 8505f0b3d2de5dd7
	ldstuba	[%i4+%o5]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[00000000100c1408] = abd36edc, %l5 = 00000000000000ff
	swapa	[%i3+%o4]0x80,%l5	! %l5 = 00000000abd36edc

p0_label_68:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1432] = 47a707a4, %l6 = 0000000000000000
	lduh	[%i3+0x032],%l6		! %l6 = 00000000000007a4
!	Mem[0000000010041420] = 1cd8bc78 29131fa9, %l2 = 000000ff, %l3 = 769c780d
	ldd	[%i1+0x020],%l2		! %l2 = 000000001cd8bc78 0000000029131fa9
!	Mem[000000001014142c] = 7518ef57, %l4 = 0000000000000000, %asi = 80
	ldsha	[%i5+0x02c]%asi,%l4	! %l4 = 0000000000007518
!	Code Fragment 4, seed = 863275
p0_fragment_8:
!	%l0 = 00000000000077ff
	setx	0x44b45c0be9e931ce,%g7,%l0 ! %l0 = 44b45c0be9e931ce
!	%l1 = 00000000000000ff
	setx	0x82bf7bfce2e15579,%g7,%l1 ! %l1 = 82bf7bfce2e15579
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 44b45c0be9e931ce
	setx	0x9954274a07e9c534,%g7,%l0 ! %l0 = 9954274a07e9c534
!	%l1 = 82bf7bfce2e15579
	setx	0x09a4d3b91b0e03ff,%g7,%l1 ! %l1 = 09a4d3b91b0e03ff
p0_fragment_8_end:
!	Mem[0000000010181408] = 000000ff, %l3 = 0000000029131fa9
	lduwa	[%i6+%o4]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010041410] = 640000000d789c76, %f26 = 54f28996 0cd1ed8f
	ldda	[%i1+%o5]0x80,%f26	! %f26 = 64000000 0d789c76
!	Mem[0000000010001410] = 49000040, %l7 = ffffffffffff92e9
	lduha	[%i0+%o5]0x80,%l7	! %l7 = 0000000000004900
	membar	#Sync			! Added by membar checker (13)
!	Mem[0000000010081408] = ffffffff, %l3 = 00000000000000ff
	lduwa	[%i2+%o4]0x80,%l3	! %l3 = 00000000ffffffff
!	Mem[0000000030001400] = 00000000 000000ff, %l2 = 1cd8bc78, %l3 = ffffffff
	ldda	[%i0+%g0]0x89,%l2	! %l2 = 00000000000000ff 0000000000000000
!	Mem[0000000010101400] = ff9c780d, %f21 = e0a9fd34
	lda	[%i4+%g0]0x80,%f21	! %f21 = ff9c780d

p0_label_69:
!	Starting 10 instruction Store Burst
!	Mem[000000001014141a] = 225007ea, %l1 = 09a4d3b91b0e03ff
	ldstub	[%i5+0x01a],%l1		! %l1 = 0000000000000007
!	%f13 = 769c780d, Mem[0000000010101400] = ff9c780d
	sta	%f13,[%i4+%g0]0x80	! Mem[0000000010101400] = 769c780d
!	%l5 = 00000000abd36edc, Mem[000000001000143c] = 7a1ecca1, %asi = 80
	stha	%l5,[%i0+0x03c]%asi	! Mem[000000001000143c] = 6edccca1
!	Mem[00000000300c1410] = 0000bc49, %l7 = 0000000000004900
	swapa	[%i3+%o5]0x89,%l7	! %l7 = 000000000000bc49
!	%l7 = 000000000000bc49, Mem[0000000030001400] = ff000000
	stwa	%l7,[%i0+%g0]0x81	! Mem[0000000030001400] = 0000bc49
!	%l6 = 00000000000007a4, Mem[0000000010041400] = ffbf4262013c8dcc
	stxa	%l6,[%i1+%g0]0x88	! Mem[0000000010041400] = 00000000000007a4
!	Mem[0000000010181421] = 6e5eea58, %l0 = 9954274a07e9c534
	ldstuba	[%i6+0x021]%asi,%l0	! %l0 = 000000000000005e
!	%l6 = 00000000000007a4, Mem[0000000010101420] = 6c1ca1985225bc49
	stx	%l6,[%i4+0x020]		! Mem[0000000010101420] = 00000000000007a4
!	Mem[00000000100c1410] = cbbc2552, %l4 = 0000000000007518
	swap	[%i3+%o5],%l4		! %l4 = 00000000cbbc2552
!	%f18 = ffffffff 0000ffff, Mem[0000000030041400] = 00000000 0000007f
	stda	%f18,[%i1+%g0]0x81	! Mem[0000000030041400] = ffffffff 0000ffff

p0_label_70:
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = 000000001159ce89, %l6 = 00000000000007a4
	ldxa	[%i5+%o5]0x89,%l6	! %l6 = 000000001159ce89
!	Mem[0000000030001408] = ff0000ff, %l0 = 000000000000005e
	ldsba	[%i0+%o4]0x81,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000021800140] = 17aa48d0, %l5 = 00000000abd36edc, %asi = 80
	ldsba	[%o3+0x140]%asi,%l5	! %l5 = 0000000000000017
!	Mem[0000000030181410] = ffffffff713b7d44, %l5 = 0000000000000017
	ldxa	[%i6+%o5]0x81,%l5	! %l5 = ffffffff713b7d44
!	Mem[0000000010181408] = ff000000, %l4 = 00000000cbbc2552
	lduha	[%i6+%o4]0x80,%l4	! %l4 = 000000000000ff00
!	Mem[0000000030001408] = ff0000ff3de296a9, %f26 = 64000000 0d789c76
	ldda	[%i0+%o4]0x81,%f26	! %f26 = ff0000ff 3de296a9
!	Mem[00000000300c1408] = 00000000, %l3 = 0000000000000000
	ldswa	[%i3+%o4]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000030141410] = 89ce5911, %f17 = 37787411
	lda	[%i5+%o5]0x81,%f17	! %f17 = 89ce5911
!	Mem[0000000010141418] = 2250ffea, %f25 = 5225bc49
	ld	[%i5+0x018],%f25	! %f25 = 2250ffea
!	Mem[0000000010081418] = 0c368e9a0f40ec03, %l3 = 0000000000000000, %asi = 80
	ldxa	[%i2+0x018]%asi,%l3	! %l3 = 0c368e9a0f40ec03

p0_label_71:
!	Starting 10 instruction Store Burst
!	%l0 = ffffffffffffffff, Mem[0000000030041400] = ffffffff
	stwa	%l0,[%i1+%g0]0x89	! Mem[0000000030041400] = ffffffff
!	Mem[0000000010041400] = a4070000, %l3 = 000000000f40ec03
	swapa	[%i1+%g0]0x80,%l3	! %l3 = 00000000a4070000
!	%l2 = 00000000000000ff, Mem[0000000010041410] = 640000000d789c76
	stxa	%l2,[%i1+%o5]0x80	! Mem[0000000010041410] = 00000000000000ff
!	Mem[00000000300c1400] = 00044917 87e4fa19 00000000 ffff92e9
!	%f16 = ff9c780d 89ce5911 ffffffff 0000ffff
!	%f20 = ffffffff ff9c780d 93ae2666 6ac2f633
!	%f24 = 6c1ca198 2250ffea ff0000ff 3de296a9
!	%f28 = 24417204 4c1f7727 40bf4262 5e87d3ab
	stda	%f16,[%i3+%g0]ASI_BLK_AIUSL	! Block Store to 00000000300c1400
!	Mem[0000000010141400] = 2d000000, %l4 = 000000000000ff00
	swap	[%i5+%g0],%l4		! %l4 = 000000002d000000
!	%f31 = 5e87d3ab, %f23 = 6ac2f633
	fcmps	%fcc1,%f31,%f23		! %fcc1 = 1
!	Mem[0000000030041410] = ffffffff, %l1 = 0000000000000007
	ldstuba	[%i1+%o5]0x81,%l1	! %l1 = 00000000000000ff
!	%l6 = 000000001159ce89, Mem[0000000010001408] = 7f000000
	stwa	%l6,[%i0+%o4]0x80	! Mem[0000000010001408] = 1159ce89
!	%l6 = 1159ce89, %l7 = 0000bc49, Mem[0000000030141410] = 1159ce89 00000000
	stda	%l6,[%i5+%o5]0x89	! Mem[0000000030141410] = 1159ce89 0000bc49
!	%l3 = 00000000a4070000, Mem[0000000010081408] = ffffffff
	stba	%l3,[%i2+%o4]0x88	! Mem[0000000010081408] = ffffff00

p0_label_72:
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (14)
!	Mem[00000000100c1410] = 00007518 ffff92e9, %l2 = 000000ff, %l3 = a4070000
	ldd	[%i3+%o5],%l2		! %l2 = 0000000000007518 00000000ffff92e9
!	%l5 = ffffffff713b7d44, %l7 = 000000000000bc49, %l6 = 000000001159ce89
	addc	%l5,%l7,%l6		! %l6 = ffffffff713c398d
!	Mem[0000000030041410] = ffffffff, %l1 = 00000000000000ff
	lduha	[%i1+%o5]0x81,%l1	! %l1 = 000000000000ffff
!	Mem[0000000010001410] = 40000049, %l3 = 00000000ffff92e9
	lduwa	[%i0+%o5]0x88,%l3	! %l3 = 0000000040000049
!	Mem[00000000201c0000] = ffff2520, %l6 = ffffffff713c398d
	ldsb	[%o0+%g0],%l6		! %l6 = ffffffffffffffff
!	Mem[00000000300c1400] = 1159ce89 0d789cff, %l2 = 00007518, %l3 = 40000049
	ldda	[%i3+%g0]0x81,%l2	! %l2 = 000000001159ce89 000000000d789cff
!	Mem[0000000020800001] = ffffc750, %l2 = 000000001159ce89, %asi = 80
	lduba	[%o1+0x001]%asi,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010181410] = 40000d78, %l1 = 000000000000ffff
	lduwa	[%i6+%o5]0x88,%l1	! %l1 = 0000000040000d78
!	Mem[0000000020800040] = 51ffe580, %l2 = 00000000000000ff
	lduh	[%o1+0x040],%l2		! %l2 = 00000000000051ff
!	Mem[00000000100c1400] = 0d789cff, %l6 = ffffffffffffffff
	ldsba	[%i3+%g0]0x88,%l6	! %l6 = ffffffffffffffff

p0_label_73:
!	Starting 10 instruction Store Burst
!	Mem[0000000030041400] = ffffffff, %l2 = 00000000000051ff
	swapa	[%i1+%g0]0x81,%l2	! %l2 = 00000000ffffffff
!	Mem[0000000030041410] = ffffffff, %l5 = ffffffff713b7d44
	ldstuba	[%i1+%o5]0x89,%l5	! %l5 = 00000000000000ff
!	%f9  = 28debc4a, Mem[0000000010081428] = 3cf786a6
	sta	%f9 ,[%i2+0x028]%asi	! Mem[0000000010081428] = 28debc4a
!	Mem[0000000010141410] = 4c1f77ff, %l4 = 000000002d000000
	ldstuba	[%i5+%o5]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010181410] = 40000d78, %l5 = 00000000000000ff
	ldstuba	[%i6+%o5]0x88,%l5	! %l5 = 0000000000000078
!	%f24 = 6c1ca198 2250ffea, %l0 = ffffffffffffffff
!	Mem[0000000030181438] = c5bd0b2f448d7f4b
	add	%i6,0x038,%g1
	stda	%f24,[%g1+%l0]ASI_PST32_SL ! Mem[0000000030181438] = eaff502298a11c6c
!	Mem[0000000010141408] = 2796e23d, %l0 = ffffffffffffffff
	ldstuba	[%i5+%o4]0x80,%l0	! %l0 = 0000000000000027
!	%l6 = ffffffffffffffff, Mem[0000000030081410] = 0f1447584c1f77ff
	stxa	%l6,[%i2+%o5]0x89	! Mem[0000000030081410] = ffffffffffffffff
!	Mem[0000000010041400] = 03ec400f, %l6 = ffffffffffffffff
	ldstuba	[%i1+%g0]0x88,%l6	! %l6 = 000000000000000f
!	%f12 = 713b7d44 769c780d, %l7 = 000000000000bc49
!	Mem[0000000030181420] = 31def2882baf7379
	add	%i6,0x020,%g1
	stda	%f12,[%g1+%l7]ASI_PST8_SL ! Mem[0000000030181420] = 0ddef2762baf3b79

p0_label_74:
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = 0f144758, %l6 = 000000000000000f
	lduwa	[%i4+%g0]0x89,%l6	! %l6 = 000000000f144758
!	Mem[0000000030081400] = cb1f0000, %l4 = 00000000000000ff
	ldsha	[%i2+%g0]0x81,%l4	! %l4 = ffffffffffffcb1f
!	Mem[00000000100c1430] = 47a707a438d552a5, %l2 = 00000000ffffffff
	ldx	[%i3+0x030],%l2		! %l2 = 47a707a438d552a5
!	Mem[0000000030081400] = cb1f000047ac1fcb, %f30 = 40bf4262 5e87d3ab
	ldda	[%i2+%g0]0x81,%f30	! %f30 = cb1f0000 47ac1fcb
!	Mem[0000000010181408] = ff000000, %l1 = 0000000040000d78
	lduha	[%i6+%o4]0x80,%l1	! %l1 = 000000000000ff00
!	Code Fragment 3, seed = 79759
p0_fragment_9:
!	%l0 = 0000000000000027
	setx	0x3b45d95300a57aae,%g7,%l0 ! %l0 = 3b45d95300a57aae
!	%l1 = 000000000000ff00
	setx	0x3057556c2944c859,%g7,%l1 ! %l1 = 3057556c2944c859
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 3b45d95300a57aae
	setx	0x9374ebe0dc144214,%g7,%l0 ! %l0 = 9374ebe0dc144214
!	%l1 = 3057556c2944c859
	setx	0x0cb75c4ae6996adf,%g7,%l1 ! %l1 = 0cb75c4ae6996adf
p0_fragment_9_end:
!	Mem[0000000030081400] = cb1f0000 47ac1fcb, %l4 = ffffcb1f, %l5 = 00000078
	ldda	[%i2+%g0]0x81,%l4	! %l4 = 00000000cb1f0000 0000000047ac1fcb
!	Mem[0000000010101410] = ffffffff, %l4 = 00000000cb1f0000
	lduwa	[%i4+%o5]0x80,%l4	! %l4 = 00000000ffffffff
!	Mem[0000000010041408] = ff000000, %l2 = 47a707a438d552a5
	ldsha	[%i1+%o4]0x80,%l2	! %l2 = ffffffffffffff00
!	Mem[00000000201c0001] = ffff2520, %l5 = 0000000047ac1fcb
	ldsb	[%o0+0x001],%l5		! %l5 = ffffffffffffffff

p0_label_75:
!	Starting 10 instruction Store Burst
!	%l0 = dc144214, %l1 = e6996adf, Mem[0000000030081410] = ffffffff ffffffff
	stda	%l0,[%i2+%o5]0x89	! Mem[0000000030081410] = dc144214 e6996adf
!	%l2 = ffffff00, %l3 = 0d789cff, Mem[0000000030001408] = ff0000ff a996e23d
	stda	%l2,[%i0+%o4]0x89	! Mem[0000000030001408] = ffffff00 0d789cff
!	%l0 = dc144214, %l1 = e6996adf, Mem[00000000300c1400] = 1159ce89 0d789cff
	stda	%l0,[%i3+%g0]0x81	! Mem[00000000300c1400] = dc144214 e6996adf
!	Mem[0000000010001410] = 49000040, %l3 = 000000000d789cff
	swapa	[%i0+%o5]0x80,%l3	! %l3 = 0000000049000040
!	%f26 = ff0000ff 3de296a9, %l3 = 0000000049000040
!	Mem[0000000030081438] = eb1b1f75a2674f77
	add	%i2,0x038,%g1
	stda	%f26,[%g1+%l3]ASI_PST8_S ! Mem[0000000030081438] = eb001f75a2674f77
!	%l4 = 00000000ffffffff, Mem[0000000010001400] = 19fae48717490462
	stxa	%l4,[%i0+%g0]0x88	! Mem[0000000010001400] = 00000000ffffffff
!	%l5 = ffffffffffffffff, Mem[0000000030181410] = ffffffff
	stha	%l5,[%i6+%o5]0x81	! Mem[0000000030181410] = ffffffff
!	Mem[0000000010001408] = 89ce5911, %l1 = 00000000e6996adf
	swapa	[%i0+%o4]0x88,%l1	! %l1 = 0000000089ce5911
!	Mem[0000000010101420] = 00000000000007a4, %f30 = cb1f0000 47ac1fcb
	ldd	[%i4+0x020],%f30	! %f30 = 00000000 000007a4
!	%f3  = ffffffff, Mem[0000000030181408] = ff000057
	sta	%f3 ,[%i6+%o4]0x81	! Mem[0000000030181408] = ffffffff

p0_label_76:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041418] = 54f289960cd1ed8f, %f6  = 03ec400f 9a8e360c
	ldd	[%i1+0x018],%f6 	! %f6  = 54f28996 0cd1ed8f
!	Mem[0000000010081410] = 89ce591100000000, %f14 = 7b6bd73d 728cd521
	ldda	[%i2+%o5]0x80,%f14	! %f14 = 89ce5911 00000000
!	Mem[0000000030001400] = 0000bc4900000000, %f16 = ff9c780d 89ce5911
	ldda	[%i0+%g0]0x81,%f16	! %f16 = 0000bc49 00000000
!	Mem[0000000010181400] = 62d87270 0000ff35, %l6 = 0f144758, %l7 = 0000bc49
	ldda	[%i6+%g0]0x80,%l6	! %l6 = 0000000062d87270 000000000000ff35
!	Mem[00000000100c143c] = 47ac1fcb, %f11 = a686f73c
	lda	[%i3+0x03c]%asi,%f11	! %f11 = 47ac1fcb
!	Mem[0000000010001410] = 0d789cff, %f11 = 47ac1fcb
	lda	[%i0+%o5]0x80,%f11	! %f11 = 0d789cff
!	Mem[0000000030181410] = ffffffff, %l5 = ffffffffffffffff
	ldsha	[%i6+%o5]0x81,%l5	! %l5 = ffffffffffffffff
!	Mem[000000001010142c] = 0cd1ed8f, %l4 = 00000000ffffffff, %asi = 80
	ldsha	[%i4+0x02c]%asi,%l4	! %l4 = 0000000000000cd1
!	Mem[0000000030181410] = 447d3b71ffffffff, %l0 = 9374ebe0dc144214
	ldxa	[%i6+%o5]0x89,%l0	! %l0 = 447d3b71ffffffff
!	Mem[0000000010181400] = 7072d862, %l1 = 0000000089ce5911
	ldswa	[%i6+%g0]0x88,%l1	! %l1 = 000000007072d862

p0_label_77:
!	Starting 10 instruction Store Burst
!	%f20 = ffffffff ff9c780d, Mem[0000000010001400] = ffffffff 00000000
	stda	%f20,[%i0+%g0]0x80	! Mem[0000000010001400] = ffffffff ff9c780d
!	Mem[0000000010141408] = 3de296ff, %l2 = ffffffffffffff00
	ldstuba	[%i5+%o4]0x88,%l2	! %l2 = 00000000000000ff
!	%l2 = 00000000000000ff, Mem[0000000030181410] = ffffffff
	stba	%l2,[%i6+%o5]0x81	! Mem[0000000030181410] = ffffffff
!	%l2 = 00000000000000ff, Mem[0000000010181400] = 62d87270
	stwa	%l2,[%i6+%g0]0x80	! Mem[0000000010181400] = 000000ff
!	%f30 = 00000000, Mem[0000000030181400] = 000003ff
	sta	%f30,[%i6+%g0]0x89	! Mem[0000000030181400] = 00000000
!	Mem[0000000030101410] = 27000000, %l4 = 0000000000000cd1
	swapa	[%i4+%o5]0x81,%l4	! %l4 = 0000000027000000
!	%l6 = 0000000062d87270, Mem[00000000100c1400] = 0d789cff
	stha	%l6,[%i3+%g0]0x88	! Mem[00000000100c1400] = 0d787270
!	%l1 = 000000007072d862, Mem[0000000030181400] = 00000000
	stwa	%l1,[%i6+%g0]0x89	! Mem[0000000030181400] = 7072d862
!	%l7 = 000000000000ff35, Mem[0000000030041408] = 495ea6e147ac1f27
	stxa	%l7,[%i1+%o4]0x89	! Mem[0000000030041408] = 000000000000ff35
!	Mem[000000001014140d] = 769c780d, %l3 = 0000000049000040
	ldstub	[%i5+0x00d],%l3		! %l3 = 000000000000009c

p0_label_78:
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = 0d789cff ffffff00, %l4 = 27000000, %l5 = ffffffff
	ldda	[%i0+%o4]0x89,%l4	! %l4 = 00000000ffffff00 000000000d789cff
!	Mem[00000000100c1410] = 18750000, %l0 = 447d3b71ffffffff
	ldswa	[%i3+%o5]0x88,%l0	! %l0 = 0000000018750000
!	Mem[0000000010041400] = 00000000 03ec40ff, %l0 = 18750000, %l1 = 7072d862
	ldda	[%i1+%g0]0x88,%l0	! %l0 = 0000000003ec40ff 0000000000000000
!	Mem[0000000010141410] = ff771f4c00000057, %l1 = 0000000000000000
	ldx	[%i5+%o5],%l1		! %l1 = ff771f4c00000057
!	Mem[0000000010141408] = 3de296ff, %f12 = 713b7d44
	lda	[%i5+%o4]0x88,%f12	! %f12 = 3de296ff
!	Mem[000000001014142d] = 7518ef57, %l6 = 0000000062d87270, %asi = 80
	ldsba	[%i5+0x02d]%asi,%l6	! %l6 = 0000000000000018
!	Mem[0000000030001410] = 5847140f, %l6 = 0000000000000018
	ldsba	[%i0+%o5]0x89,%l6	! %l6 = 000000000000000f
!	Mem[0000000021800080] = 04063640, %l4 = 00000000ffffff00
	ldsh	[%o3+0x080],%l4		! %l4 = 0000000000000406
!	%l1 = ff771f4c00000057, immd = 0000000000000f40, %l108 = 0000000000000007
	sdivx	%l1,0xf40,%l7		! %l7 = fffff7063fbcda3b
!	Mem[0000000021800001] = fff595e0, %l2 = 00000000000000ff
	ldsb	[%o3+0x001],%l2		! %l2 = fffffffffffffff5

p0_label_79:
!	Starting 10 instruction Store Burst
!	%l4 = 00000406, %l5 = 0d789cff, Mem[0000000030081400] = 00001fcb cb1fac47
	stda	%l4,[%i2+%g0]0x89	! Mem[0000000030081400] = 00000406 0d789cff
!	%l3 = 000000000000009c, Mem[00000000300c1410] = ff9c780d
	stha	%l3,[%i3+%o5]0x89	! Mem[00000000300c1410] = ff9c009c
!	Mem[0000000010101400] = 769c780d, %f21 = ff9c780d
	lda	[%i4+%g0]0x80,%f21	! %f21 = 769c780d
!	%l2 = fffffff5, %l3 = 0000009c, Mem[0000000030101410] = 00000cd1 00000000
	stda	%l2,[%i4+%o5]0x81	! Mem[0000000030101410] = fffffff5 0000009c
!	Mem[0000000010081404] = 00000027, %l6 = 000000000000000f
	swap	[%i2+0x004],%l6		! %l6 = 0000000000000027
!	%l6 = 0000000000000027, Mem[0000000010001420] = 6e5eea5821ba6a09
	stx	%l6,[%i0+0x020]		! Mem[0000000010001420] = 0000000000000027
!	%l2 = fffffffffffffff5, Mem[0000000030181410] = ffffffff
	stwa	%l2,[%i6+%o5]0x89	! Mem[0000000030181410] = fffffff5
!	%l6 = 0000000000000027, %l5 = 000000000d789cff, %l5 = 000000000d789cff
	udivx	%l6,%l5,%l5		! %l5 = 0000000000000000
!	%l2 = fffffffffffffff5, Mem[0000000010041400] = 03ec40ff
	stha	%l2,[%i1+%g0]0x88	! Mem[0000000010041400] = 03ecfff5
!	Mem[0000000010141410] = 4c1f77ff, %l1 = ff771f4c00000057
	ldstuba	[%i5+%o5]0x88,%l1	! %l1 = 00000000000000ff

p0_label_80:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141424] = 529a00ff, %l5 = 0000000000000000, %asi = 80
	lduba	[%i5+0x024]%asi,%l5	! %l5 = 0000000000000052
!	Mem[0000000030181408] = ffffffff, %l1 = 00000000000000ff
	ldsha	[%i6+%o4]0x89,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010101404] = 37787411, %f20 = ffffffff
	ld	[%i4+0x004],%f20	! %f20 = 37787411
!	Mem[0000000030101408] = 00000000, %f19 = 0000ffff
	lda	[%i4+%o4]0x89,%f19	! %f19 = 00000000
!	Mem[0000000030081410] = 144214dcdf6a99e6, %l4 = 0000000000000406
	ldxa	[%i2+%o5]0x81,%l4	! %l4 = 144214dcdf6a99e6
!	Code Fragment 4, seed = 584130
p0_fragment_10:
!	%l0 = 0000000003ec40ff
	setx	0x1505ca284d4f8c16,%g7,%l0 ! %l0 = 1505ca284d4f8c16
!	%l1 = ffffffffffffffff
	setx	0xd18511bcac3c3d41,%g7,%l1 ! %l1 = d18511bcac3c3d41
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 1505ca284d4f8c16
	setx	0x4d28a3beda41c27c,%g7,%l0 ! %l0 = 4d28a3beda41c27c
!	%l1 = d18511bcac3c3d41
	setx	0x6c6164463ba51ec7,%g7,%l1 ! %l1 = 6c6164463ba51ec7
p0_fragment_10_end:
!	Mem[0000000030001408] = ffffff00, %l0 = 4d28a3beda41c27c
	ldsha	[%i0+%o4]0x89,%l0	! %l0 = ffffffffffffff00
!	Mem[0000000030181408] = ffffffff, %l3 = 000000000000009c
	lduha	[%i6+%o4]0x89,%l3	! %l3 = 000000000000ffff
!	Mem[00000000300c1400] = 144214dc, %l4 = 144214dcdf6a99e6
	lduwa	[%i3+%g0]0x89,%l4	! %l4 = 00000000144214dc
!	Mem[0000000030141408] = ffffffff, %l7 = fffff7063fbcda3b
	lduba	[%i5+%o4]0x89,%l7	! %l7 = 00000000000000ff

p0_label_81:
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1410] = 18750000, %l2 = fffffffffffffff5
	ldstuba	[%i3+%o5]0x88,%l2	! %l2 = 0000000000000000
!	%l4 = 144214dc, %l5 = 00000052, Mem[0000000030041410] = ffffffff 4732259d
	stda	%l4,[%i1+%o5]0x81	! Mem[0000000030041410] = 144214dc 00000052
!	%l7 = 00000000000000ff, Mem[00000000100c1408] = ff000000
	stha	%l7,[%i3+%o4]0x88	! Mem[00000000100c1408] = ff0000ff
!	%f4  = 00000000 1159ce89, Mem[0000000030141410] = 89ce5911 49bc0000
	stda	%f4 ,[%i5+%o5]0x81	! Mem[0000000030141410] = 00000000 1159ce89
!	%l2 = 00000000, %l3 = 0000ffff, Mem[0000000030101400] = 5847140f 7072d81a
	stda	%l2,[%i4+%g0]0x81	! Mem[0000000030101400] = 00000000 0000ffff
!	Mem[0000000030081410] = 144214dc, %l6 = 0000000000000027
	ldstuba	[%i2+%o5]0x81,%l6	! %l6 = 0000000000000014
!	Mem[000000001004140f] = d818fa67, %l7 = 00000000000000ff
	ldstub	[%i1+0x00f],%l7		! %l7 = 0000000000000067
!	%f30 = 00000000, Mem[0000000030101408] = 00000000
	sta	%f30,[%i4+%o4]0x81	! Mem[0000000030101408] = 00000000
!	%l4 = 144214dc, %l5 = 00000052, Mem[0000000030041408] = 0000ff35 00000000
	stda	%l4,[%i1+%o4]0x89	! Mem[0000000030041408] = 144214dc 00000052
!	Mem[0000000010141408] = ff96e23d, %l3 = 000000000000ffff
	ldstuba	[%i5+%o4]0x80,%l3	! %l3 = 00000000000000ff

p0_label_82:
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = 7072d862, %f5  = 1159ce89
	lda	[%i6+%g0]0x89,%f5 	! %f5 = 7072d862
!	Mem[00000000201c0000] = ffff2520, %l0 = ffffffffffffff00, %asi = 80
	ldsba	[%o0+0x000]%asi,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000030081410] = ff4214dc, %l4 = 00000000144214dc
	lduba	[%i2+%o5]0x81,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030141408] = ffffffff, %l3 = 00000000000000ff
	ldsha	[%i5+%o4]0x89,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010081400] = ff000000, %l2 = 0000000000000000, %asi = 80
	ldsha	[%i2+0x000]%asi,%l2	! %l2 = ffffffffffffff00
!	Mem[0000000030101400] = ffff000000000000, %l0 = ffffffffffffffff
	ldxa	[%i4+%g0]0x89,%l0	! %l0 = ffff000000000000
	membar	#Sync			! Added by membar checker (15)
!	Mem[00000000300c1400] = dc144214 e6996adf ffff0000 ffffffff
!	Mem[00000000300c1410] = 9c009cff ffffffff 33f6c26a 6626ae93
!	Mem[00000000300c1420] = eaff5022 98a11c6c a996e23d ff0000ff
!	Mem[00000000300c1430] = 27771f4c 04724124 abd3875e 6242bf40
	ldda	[%i3+%g0]ASI_BLK_S,%f16	! Block Load from 00000000300c1400
!	Mem[0000000010141410] = 4c1f77ff, %l6 = 0000000000000014
	ldsha	[%i5+%o5]0x88,%l6	! %l6 = 00000000000077ff
!	Mem[0000000030101410] = f5ffffff, %f5  = 7072d862
	lda	[%i4+%o5]0x89,%f5 	! %f5 = f5ffffff
!	Mem[0000000030141408] = ffffffff 2cd4e237, %l0 = 00000000, %l1 = 3ba51ec7
	ldda	[%i5+%o4]0x81,%l0	! %l0 = 00000000ffffffff 000000002cd4e237

p0_label_83:
!	Starting 10 instruction Store Burst
!	%l4 = 000000ff, %l5 = 00000052, Mem[0000000030041400] = ff510000 ffff0000
	stda	%l4,[%i1+%g0]0x89	! Mem[0000000030041400] = 000000ff 00000052
!	Mem[0000000030041410] = dc144214, %l4 = 00000000000000ff
	ldstuba	[%i1+%o5]0x89,%l4	! %l4 = 0000000000000014
!	%l1 = 000000002cd4e237, Mem[0000000030081410] = ff4214dc
	stha	%l1,[%i2+%o5]0x81	! Mem[0000000030081410] = e23714dc
!	Mem[0000000010181428] = 00000000, %l1 = 000000002cd4e237, %asi = 80
	swapa	[%i6+0x028]%asi,%l1	! %l1 = 0000000000000000
!	Mem[00000000100c141c] = 5b314a45, %l7 = 0000000000000067, %asi = 80
	swapa	[%i3+0x01c]%asi,%l7	! %l7 = 000000005b314a45
!	%l3 = ffffffffffffffff, Mem[0000000010001400] = ffffffff
	stwa	%l3,[%i0+%g0]0x88	! Mem[0000000010001400] = ffffffff
!	%l0 = ffffffff, %l1 = 00000000, Mem[0000000010041408] = ff000000 d818faff
	stda	%l0,[%i1+%o4]0x80	! Mem[0000000010041408] = ffffffff 00000000
!	%f6  = 54f28996, Mem[0000000030001408] = ffffff00
	sta	%f6 ,[%i0+%o4]0x89	! Mem[0000000030001408] = 54f28996
!	Mem[0000000030181408] = ffffffff, %l6 = 00000000000077ff
	ldstuba	[%i6+%o4]0x81,%l6	! %l6 = 00000000000000ff
!	%l2 = ffffffffffffff00, Mem[0000000030141408] = ffffffff
	stha	%l2,[%i5+%o4]0x81	! Mem[0000000030141408] = ff00ffff

p0_label_84:
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = ffff00ff, %l4 = 0000000000000014
	lduwa	[%i5+%o4]0x89,%l4	! %l4 = 00000000ffff00ff
!	Mem[0000000010081410] = 1159ce89, %f11 = 0d789cff
	lda	[%i2+%o5]0x88,%f11	! %f11 = 1159ce89
!	Mem[0000000010141434] = 0e140c65, %l5 = 0000000000000052
	lduw	[%i5+0x034],%l5		! %l5 = 000000000e140c65
!	Mem[0000000030001410] = 5847140f, %l7 = 000000005b314a45
	lduba	[%i0+%o5]0x89,%l7	! %l7 = 000000000000000f
!	Mem[0000000010081438] = 00000035000000ff, %f10 = 5f8c090c 1159ce89, %asi = 80
	ldda	[%i2+0x038]%asi,%f10	! %f10 = 00000035 000000ff
!	Mem[0000000010041410] = 00000000, %l4 = 00000000ffff00ff
	lduba	[%i1+%o5]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000030101408] = 00000000, %l2 = ffffffffffffff00
	lduwa	[%i4+%o4]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000010141410] = ff771f4c, %l5 = 000000000e140c65
	lduha	[%i5+%o5]0x80,%l5	! %l5 = 000000000000ff77
!	Mem[0000000030101400] = ffff0000 00000000, %l6 = 000000ff, %l7 = 0000000f
	ldda	[%i4+%g0]0x89,%l6	! %l6 = 0000000000000000 00000000ffff0000
!	Mem[0000000010081418] = 0c368e9a, %f3  = ffffffff
	lda	[%i2+0x018]%asi,%f3 	! %f3 = 0c368e9a

p0_label_85:
!	Starting 10 instruction Store Burst
!	%l7 = 00000000ffff0000, Mem[0000000010141400] = 0000ff0060000000, %asi = 80
	stxa	%l7,[%i5+0x000]%asi	! Mem[0000000010141400] = 00000000ffff0000
!	%f6  = 54f28996 0cd1ed8f, Mem[0000000010041420] = 1cd8bc78 29131fa9, %asi = 80
	stda	%f6 ,[%i1+0x020]%asi	! Mem[0000000010041420] = 54f28996 0cd1ed8f
!	%l5 = 000000000000ff77, Mem[0000000010001420] = 00000000
	stb	%l5,[%i0+0x020]		! Mem[0000000010001420] = 77000000
!	%l4 = 00000000, %l5 = 0000ff77, Mem[0000000030101400] = 00000000 ffff0000
	stda	%l4,[%i4+%g0]0x89	! Mem[0000000030101400] = 00000000 0000ff77
!	%l4 = 0000000000000000, Mem[0000000010001410] = 0d789cff92e92444
	stxa	%l4,[%i0+%o5]0x80	! Mem[0000000010001410] = 0000000000000000
!	%f2  = 37e2d42c, Mem[0000000010101400] = 769c780d
	st	%f2 ,[%i4+%g0]		! Mem[0000000010101400] = 37e2d42c
!	Mem[0000000030001400] = 49bc0000, %l2 = 0000000000000000
	ldstuba	[%i0+%g0]0x89,%l2	! %l2 = 0000000000000000
!	%f11 = 000000ff, Mem[0000000030101400] = 00000000
	sta	%f11,[%i4+%g0]0x81	! Mem[0000000030101400] = 000000ff
!	Mem[0000000010041436] = 17db58e5, %l1 = 0000000000000000
	ldstuba	[%i1+0x036]%asi,%l1	! %l1 = 0000000000000058
!	%l3 = ffffffffffffffff, Mem[0000000010081402] = ff000000, %asi = 80
	stha	%l3,[%i2+0x002]%asi	! Mem[0000000010081400] = ff00ffff

p0_label_86:
!	Starting 10 instruction Load Burst
!	Mem[0000000030101410] = f5ffffff, %l5 = 000000000000ff77
	ldsba	[%i4+%o5]0x89,%l5	! %l5 = ffffffffffffffff
!	Mem[00000000300c1410] = ff9c009c, %l4 = 0000000000000000
	lduha	[%i3+%o5]0x89,%l4	! %l4 = 000000000000009c
!	Mem[0000000010081408] = ffffff00, %l2 = 0000000000000000
	lduha	[%i2+%o4]0x88,%l2	! %l2 = 000000000000ff00
!	Mem[0000000030001400] = 49bc00ff, %l5 = ffffffffffffffff
	ldswa	[%i0+%g0]0x89,%l5	! %l5 = 0000000049bc00ff
!	Mem[00000000100c1400] = 7072780d, %l3 = ffffffffffffffff
	ldsba	[%i3+%g0]0x80,%l3	! %l3 = 0000000000000070
!	Mem[0000000030181400] = 62d8727011e06d41, %l4 = 000000000000009c
	ldxa	[%i6+%g0]0x81,%l4	! %l4 = 62d8727011e06d41
!	Mem[0000000010001408] = e6996adf, %l1 = 0000000000000058
	ldsba	[%i0+%o4]0x88,%l1	! %l1 = ffffffffffffffdf
!	Mem[000000001010143a] = 40bf4262, %l6 = 0000000000000000, %asi = 80
	ldsha	[%i4+0x03a]%asi,%l6	! %l6 = 0000000000004262
!	Mem[0000000010081408] = 00ffffff, %l5 = 0000000049bc00ff
	ldsha	[%i2+%o4]0x80,%l5	! %l5 = 00000000000000ff
!	%l5 = 00000000000000ff, imm = 00000000000006f1, %l7 = 00000000ffff0000
	xnor	%l5,0x6f1,%l7		! %l7 = fffffffffffff9f1

p0_label_87:
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1414] = ffff92e9, %l4 = 0000000011e06d41, %asi = 80
	swapa	[%i3+0x014]%asi,%l4	! %l4 = 00000000ffff92e9
!	%l0 = ffffffff, %l1 = ffffffdf, Mem[0000000030181400] = 62d87270 11e06d41
	stda	%l0,[%i6+%g0]0x81	! Mem[0000000030181400] = ffffffff ffffffdf
!	Mem[0000000030181408] = ffffffff, %l2 = 000000000000ff00
	swapa	[%i6+%o4]0x81,%l2	! %l2 = 00000000ffffffff
!	Mem[00000000100c1408] = ff0000ff, %l5 = 000000ff, %l6 = 00004262
	add	%i3,0x08,%g1
	casa	[%g1]0x80,%l5,%l6	! %l6 = 00000000ff0000ff
!	Mem[0000000030041408] = 144214dc, %l1 = 00000000ffffffdf
	swapa	[%i1+%o4]0x89,%l1	! %l1 = 00000000144214dc
!	%f8  = 99ec3d33, Mem[0000000010041414] = 000000ff
	st	%f8 ,[%i1+0x014]	! Mem[0000000010041414] = 99ec3d33
!	%f28 = 27771f4c 04724124, Mem[0000000010081408] = 00ffffff 2cd4e237
	stda	%f28,[%i2+%o4]0x80	! Mem[0000000010081408] = 27771f4c 04724124
!	%f11 = 000000ff, Mem[0000000010101410] = ffffffff
	sta	%f11,[%i4+%o5]0x88	! Mem[0000000010101410] = 000000ff
!	%l3 = 0000000000000070, Mem[0000000030101400] = ff000000
	stba	%l3,[%i4+%g0]0x89	! Mem[0000000030101400] = ff000070
!	%f16 = dc144214 e6996adf, Mem[0000000010101410] = 000000ff 34fda9e0
	stda	%f16,[%i4+%o5]0x88	! Mem[0000000010101410] = dc144214 e6996adf

p0_label_88:
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = 00000000, %l4 = 00000000ffff92e9
	lduba	[%i5+%o5]0x81,%l4	! %l4 = 0000000000000000
!	%l0 = 00000000ffffffff, %l7 = fffffffffffff9f1, %l7 = fffffffffffff9f1
	xnor	%l0,%l7,%l7		! %l7 = 00000000fffff9f1
!	Mem[0000000010181408] = 00000000 000000ff, %l4 = 00000000, %l5 = 000000ff
	ldda	[%i6+%o4]0x88,%l4	! %l4 = 00000000000000ff 0000000000000000
!	Mem[0000000030141400] = ff00000000000027, %l3 = 0000000000000070
	ldxa	[%i5+%g0]0x81,%l3	! %l3 = ff00000000000027
!	Mem[0000000010001410] = 00000000, %l7 = 00000000fffff9f1
	ldstuba	[%i0+%o5]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000030101400] = 0000ff77ff000070, %l0 = 00000000ffffffff
	ldxa	[%i4+%g0]0x89,%l0	! %l0 = 0000ff77ff000070
!	%l6 = 00000000ff0000ff, imm = 0000000000000eee, %l4 = 00000000000000ff
	addc	%l6,0xeee,%l4		! %l4 = 00000000ff000fed
!	Mem[0000000010141400] = 00000000, %l4 = 00000000ff000fed
	lduwa	[%i5+%g0]0x88,%l4	! %l4 = 0000000000000000
!	%l2 = 00000000ffffffff, immd = fffffffffffff878, %l108 = 0000000000000000
	udivx	%l2,-0x788,%l0		! %l0 = 0000000000000000
!	Mem[0000000030081400] = 0d789cff00000406, %f20 = 9c009cff ffffffff
	ldda	[%i2+%g0]0x89,%f20	! %f20 = 0d789cff 00000406

p0_label_89:
!	Starting 10 instruction Store Burst
!	%l3 = ff00000000000027, Mem[00000000100c1408] = ff0000ff
	stba	%l3,[%i3+%o4]0x88	! Mem[00000000100c1408] = ff000027
!	Mem[00000000201c0000] = ffff2520, %l0 = 0000000000000000
	ldstub	[%o0+%g0],%l0		! %l0 = 00000000000000ff
!	%f24 = eaff5022 98a11c6c, %l3 = ff00000000000027
!	Mem[0000000010041420] = 54f289960cd1ed8f
	add	%i1,0x020,%g1
	stda	%f24,[%g1+%l3]ASI_PST32_PL ! Mem[0000000010041420] = 6c1ca1982250ffea
!	%l2 = ffffffff, %l3 = 00000027, Mem[0000000030141408] = ffff00ff 37e2d42c
	stda	%l2,[%i5+%o4]0x89	! Mem[0000000030141408] = ffffffff 00000027
!	%l4 = 0000000000000000, Mem[0000000030081400] = 00000406
	stba	%l4,[%i2+%g0]0x89	! Mem[0000000030081400] = 00000400
!	Mem[00000000300c1400] = dc144214, %l6 = 00000000ff0000ff
	swapa	[%i3+%g0]0x81,%l6	! %l6 = 00000000dc144214
!	Mem[0000000010001408] = df6a99e600000000, %l3 = ff00000000000027, %l5 = 0000000000000000
	add	%i0,0x08,%g1
	casxa	[%g1]0x80,%l3,%l5	! %l5 = df6a99e600000000
!	%l7 = 0000000000000000, Mem[0000000030101400] = ff000070
	stha	%l7,[%i4+%g0]0x89	! Mem[0000000030101400] = ff000000
!	Mem[0000000030101400] = ff000000, %l6 = 00000000dc144214
	ldstuba	[%i4+%g0]0x89,%l6	! %l6 = 0000000000000000
!	%f10 = 00000035 000000ff, Mem[00000000100c1418] = 2e7f7204 00000067, %asi = 80
	stda	%f10,[%i3+0x018]%asi	! Mem[00000000100c1418] = 00000035 000000ff

p0_label_90:
!	Starting 10 instruction Load Burst
!	Mem[000000001008143c] = 000000ff, %f19 = ffffffff
	lda	[%i2+0x03c]%asi,%f19	! %f19 = 000000ff
!	Mem[0000000030081410] = e23714dc, %l5 = df6a99e600000000
	ldsba	[%i2+%o5]0x81,%l5	! %l5 = ffffffffffffffe2
!	Mem[0000000010041400] = 03ecfff5, %l0 = 00000000000000ff
	ldsba	[%i1+%g0]0x88,%l0	! %l0 = fffffffffffffff5
!	Mem[00000000300c1408] = ffff0000ffffffff, %l7 = 0000000000000000
	ldxa	[%i3+%o4]0x81,%l7	! %l7 = ffff0000ffffffff
!	Mem[0000000010141406] = ffff0000, %l6 = 0000000000000000
	lduh	[%i5+0x006],%l6		! %l6 = 0000000000000000
!	Mem[00000000300c1408] = 0000ffff, %l5 = ffffffffffffffe2
	ldswa	[%i3+%o4]0x89,%l5	! %l5 = 000000000000ffff
!	Mem[0000000030101410] = fffffff5, %f31 = 6242bf40
	lda	[%i4+%o5]0x81,%f31	! %f31 = fffffff5
!	%l4 = 0000000000000000, imm = 000000000000012e, %l6 = 0000000000000000
	xnor	%l4,0x12e,%l6		! %l6 = fffffffffffffed1
!	Mem[0000000030081400] = 00000400, %l5 = 000000000000ffff
	lduha	[%i2+%g0]0x89,%l5	! %l5 = 0000000000000400
!	Mem[0000000010081408] = 27771f4c, %l1 = 00000000144214dc
	ldsha	[%i2+%o4]0x80,%l1	! %l1 = 0000000000002777

p0_label_91:
!	Starting 10 instruction Store Burst
!	%l5 = 0000000000000400, Mem[0000000010081400] = ff00ffff0000000f
	stxa	%l5,[%i2+%g0]0x80	! Mem[0000000010081400] = 0000000000000400
!	%f30 = abd3875e, Mem[0000000010141418] = 2250ffea
	st	%f30,[%i5+0x018]	! Mem[0000000010141418] = abd3875e
!	%l7 = ffff0000ffffffff, Mem[00000000100c1408] = ff000027
	stba	%l7,[%i3+%o4]0x88	! Mem[00000000100c1408] = ff0000ff
!	%l4 = 0000000000000000, Mem[0000000030001410] = 5847140f
	stwa	%l4,[%i0+%o5]0x89	! Mem[0000000030001410] = 00000000
!	%l0 = fffffffffffffff5, imm = 0000000000000244, %l5 = 0000000000000400
	orn	%l0,0x244,%l5		! %l5 = ffffffffffffffff
	membar	#Sync			! Added by membar checker (16)
!	%l2 = ffffffff, %l3 = 00000027, Mem[00000000300c1410] = 9c009cff ffffffff
	stda	%l2,[%i3+%o5]0x81	! Mem[00000000300c1410] = ffffffff 00000027
!	%f16 = dc144214, %f5  = f5ffffff, %f14 = 89ce5911
	fadds	%f16,%f5 ,%f14		! %f14 = f5ffffff
!	%f14 = f5ffffff 00000000, %l4 = 0000000000000000
!	Mem[00000000100c1400] = 7072780d6242bf40
	stda	%f14,[%i3+%l4]ASI_PST8_PL ! Mem[00000000100c1400] = 7072780d6242bf40
!	Mem[0000000030041400] = ff000000 52000000 dfffffff 52000000
!	%f0  = 27000000 000000ff 37e2d42c 0c368e9a
!	%f4  = 00000000 f5ffffff 54f28996 0cd1ed8f
!	%f8  = 99ec3d33 28debc4a 00000035 000000ff
!	%f12 = 3de296ff 769c780d f5ffffff 00000000
	stda	%f0 ,[%i1+%g0]ASI_BLK_SL	! Block Store to 0000000030041400
!	Mem[00000000300c1408] = ffff0000, %l7 = 00000000ffffffff
	swapa	[%i3+%o4]0x81,%l7	! %l7 = 00000000ffff0000

p0_label_92:
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = 00000000, %l3 = ff00000000000027
	ldsha	[%i0+%o5]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000010181400] = 000000ff0000ff35, %l3 = 0000000000000000
	ldxa	[%i6+%g0]0x80,%l3	! %l3 = 000000ff0000ff35
!	Mem[00000000300c1408] = ffffffff, %l5 = ffffffffffffffff
	ldsba	[%i3+%o4]0x81,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000030101408] = 00000000, %l5 = ffffffffffffffff
	ldsha	[%i4+%o4]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000030081410] = e6996adfdc1437e2, %f24 = eaff5022 98a11c6c
	ldda	[%i2+%o5]0x89,%f24	! %f24 = e6996adf dc1437e2
!	Mem[0000000010141408] = ff96e23d, %l7 = 00000000ffff0000
	lduwa	[%i5+%o4]0x80,%l7	! %l7 = 00000000ff96e23d
!	Mem[00000000300c1408] = ffffffff, %l5 = 0000000000000000
	lduba	[%i3+%o4]0x81,%l5	! %l5 = 00000000000000ff
!	Mem[00000000201c0000] = ffff2520, %l4 = 0000000000000000, %asi = 80
	lduha	[%o0+0x000]%asi,%l4	! %l4 = 000000000000ffff
!	Mem[00000000100c141c] = 000000ff, %f28 = 27771f4c
	ld	[%i3+0x01c],%f28	! %f28 = 000000ff
!	Mem[0000000010181400] = 000000ff 0000ff35, %l6 = fffffed1, %l7 = ff96e23d
	ldd	[%i6+%g0],%l6		! %l6 = 00000000000000ff 000000000000ff35

p0_label_93:
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1410] = ffffffff, %l3 = 000000000000ff35
	swapa	[%i3+%o5]0x81,%l3	! %l3 = 00000000ffffffff
!	%l2 = ffffffff, %l3 = ffffffff, Mem[0000000010041408] = ffffffff 00000000
	stda	%l2,[%i1+%o4]0x80	! Mem[0000000010041408] = ffffffff ffffffff
!	%l7 = 000000000000ff35, Mem[0000000010101408] = ffffffff
	stba	%l7,[%i4+%o4]0x80	! Mem[0000000010101408] = 35ffffff
!	%f16 = dc144214, Mem[0000000030101410] = fffffff5
	sta	%f16,[%i4+%o5]0x81	! Mem[0000000030101410] = dc144214
!	%l3 = 00000000ffffffff, Mem[0000000030001410] = 00000000
	stha	%l3,[%i0+%o5]0x81	! Mem[0000000030001410] = ffff0000
!	%l4 = 000000000000ffff, Mem[0000000030081408] = 0000002d000000ff
	stxa	%l4,[%i2+%o4]0x89	! Mem[0000000030081408] = 000000000000ffff
!	%f14 = f5ffffff 00000000, Mem[0000000010001408] = e6996adf 00000000
	stda	%f14,[%i0+%o4]0x88	! Mem[0000000010001408] = f5ffffff 00000000
!	Mem[0000000030181408] = 00ff0000, %l6 = 00000000000000ff
	swapa	[%i6+%o4]0x89,%l6	! %l6 = 0000000000ff0000
!	%l5 = 00000000000000ff, Mem[0000000020800000] = ffffc750
	sth	%l5,[%o1+%g0]		! Mem[0000000020800000] = 00ffc750
!	%l0 = fffffff5, %l1 = 00002777, Mem[00000000100c1428] = 000000ff 4f9e1faf
	std	%l0,[%i3+0x028]		! Mem[00000000100c1428] = fffffff5 00002777

p0_label_94:
!	Starting 10 instruction Load Burst
!	Mem[0000000030181410] = f5ffffff, %l7 = 000000000000ff35
	lduha	[%i6+%o5]0x81,%l7	! %l7 = 000000000000f5ff
!	Mem[0000000010181410] = ff0d0040, %f22 = 33f6c26a
	lda	[%i6+0x010]%asi,%f22	! %f22 = ff0d0040
!	Mem[0000000010141400] = 00000000, %l7 = 000000000000f5ff
	ldsba	[%i5+%g0]0x80,%l7	! %l7 = 0000000000000000
!	Mem[00000000300c1408] = ffffffff, %f16 = dc144214
	lda	[%i3+%o4]0x89,%f16	! %f16 = ffffffff
!	Mem[0000000030181410] = f5ffffff, %l6 = 0000000000ff0000
	ldsha	[%i6+%o5]0x81,%l6	! %l6 = fffffffffffff5ff
!	Mem[00000000100c1438] = 79600066, %l2 = 00000000ffffffff
	ldsw	[%i3+0x038],%l2		! %l2 = 0000000079600066
!	Mem[00000000100c1410] = ff007518, %f25 = dc1437e2
	lda	[%i3+%o5]0x80,%f25	! %f25 = ff007518
!	Mem[0000000010001417] = 00000000, %l5 = 00000000000000ff
	ldub	[%i0+0x017],%l5		! %l5 = 0000000000000000
!	Mem[0000000010001408] = 00000000, %l0 = fffffffffffffff5
	ldsha	[%i0+%o4]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000030081410] = dc1437e2, %l6 = fffffffffffff5ff
	ldsha	[%i2+%o5]0x89,%l6	! %l6 = 00000000000037e2

p0_label_95:
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1400] = ff0000ff, %l4 = 000000000000ffff
	swapa	[%i3+%g0]0x89,%l4	! %l4 = 00000000ff0000ff
!	%f26 = a996e23d ff0000ff, Mem[00000000300c1400] = 0000ffff df6a99e6
	stda	%f26,[%i3+%g0]0x89	! Mem[00000000300c1400] = a996e23d ff0000ff
!	Mem[0000000010181438] = 25c8dd22, %l6 = 00000000000037e2, %asi = 80
	swapa	[%i6+0x038]%asi,%l6	! %l6 = 0000000025c8dd22
!	%l0 = 0000000000000000, Mem[0000000010041410] = 0000000099ec3d33
	stxa	%l0,[%i1+%o5]0x80	! Mem[0000000010041410] = 0000000000000000
!	%l3 = 00000000ffffffff, Mem[0000000010041410] = 0000000000000000
	stxa	%l3,[%i1+%o5]0x80	! Mem[0000000010041410] = 00000000ffffffff
	membar	#Sync			! Added by membar checker (17)
!	Mem[0000000010041428] = 4e24c3760000ffff, %l5 = 0000000000000000, %l3 = 00000000ffffffff
	add	%i1,0x28,%g1
	casxa	[%g1]0x80,%l5,%l3	! %l3 = 4e24c3760000ffff
!	%l2 = 0000000079600066, Mem[0000000030141400] = ff000000
	stwa	%l2,[%i5+%g0]0x81	! Mem[0000000030141400] = 79600066
!	%f18 = ffff0000 000000ff, %l1 = 0000000000002777
!	Mem[0000000030141418] = 0c368e9a0f40ec03
	add	%i5,0x018,%g1
	stda	%f18,[%g1+%l1]ASI_PST32_SL ! Mem[0000000030141418] = ff0000000000ffff
!	%f12 = 3de296ff 769c780d, Mem[0000000030181410] = fffffff5 447d3b71
	stda	%f12,[%i6+%o5]0x89	! Mem[0000000030181410] = 3de296ff 769c780d
!	%l3 = 4e24c3760000ffff, Mem[0000000010181410] = 40000dff
	stha	%l3,[%i6+%o5]0x88	! Mem[0000000010181410] = 4000ffff

p0_label_96:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = ff007518, %l3 = 4e24c3760000ffff
	ldsha	[%i3+%o5]0x80,%l3	! %l3 = ffffffffffffff00
!	Mem[0000000010141408] = 3de296ff, %l1 = 0000000000002777
	lduwa	[%i5+%o4]0x88,%l1	! %l1 = 000000003de296ff
!	%f12 = 3de296ff, %f21 = 00000406
	fcmps	%fcc0,%f12,%f21		! %fcc0 = 2
!	Mem[0000000010181410] = 4000ffff, %f20 = 0d789cff
	lda	[%i6+%o5]0x88,%f20	! %f20 = 4000ffff
!	Mem[0000000010001408] = 00000000, %l0 = 0000000000000000
	lduba	[%i0+%o4]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000010141410] = ff771f4c, %l5 = 0000000000000000
	ldsba	[%i5+%o5]0x80,%l5	! %l5 = ffffffffffffffff
!	Mem[0000000030141410] = 00000000, %l2 = 0000000079600066
	ldsha	[%i5+%o5]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000010041410] = 00000000, %l0 = 0000000000000000
	lduba	[%i1+%o5]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000010001410] = ff000000, %l2 = 0000000000000000
	ldsha	[%i0+%o5]0x80,%l2	! %l2 = ffffffffffffff00
!	Mem[0000000010041400] = f5ffec03 00000000 ffffffff ffffffff
!	Mem[0000000010041410] = 00000000 ffffffff 54f28996 0cd1ed8f
!	Mem[0000000010041420] = 6c1ca198 2250ffea 4e24c376 0000ffff
!	Mem[0000000010041430] = 31f302e4 17dbffe5 00ff2242 49a8c80b
	ldda	[%i1+%g0]ASI_BLK_AIUPL,%f0 	! Block Load from 0000000010041400

p0_label_97:
!	Starting 10 instruction Store Burst
!	%l4 = 00000000ff0000ff, Mem[0000000030081408] = 0000ffff
	stba	%l4,[%i2+%o4]0x89	! Mem[0000000030081408] = 0000ffff
!	%f24 = e6996adf, Mem[0000000010181408] = ff000000
	sta	%f24,[%i6+%o4]0x80	! Mem[0000000010181408] = e6996adf
!	%l2 = ffffffffffffff00, Mem[0000000030081408] = 0000ffff
	stwa	%l2,[%i2+%o4]0x89	! Mem[0000000030081408] = ffffff00
!	%f12 = e5ffdb17 e402f331, %l6 = 0000000025c8dd22
!	Mem[00000000100c1430] = 47a707a438d552a5
	add	%i3,0x030,%g1
	stda	%f12,[%g1+%l6]ASI_PST16_P ! Mem[00000000100c1430] = 47a707a4e40252a5
!	%l2 = ffffff00, %l3 = ffffff00, Mem[0000000010001410] = 000000ff 00000000
	stda	%l2,[%i0+%o5]0x88	! Mem[0000000010001410] = ffffff00 ffffff00
!	%l3 = ffffffffffffff00, Mem[0000000010001408] = 00000000
	stwa	%l3,[%i0+%o4]0x88	! Mem[0000000010001408] = ffffff00
!	%l6 = 0000000025c8dd22, Mem[0000000030141400] = 7960006600000027
	stxa	%l6,[%i5+%g0]0x81	! Mem[0000000030141400] = 0000000025c8dd22
!	%l4 = ff0000ff, %l5 = ffffffff, Mem[0000000030081408] = ffffff00 00000000
	stda	%l4,[%i2+%o4]0x89	! Mem[0000000030081408] = ff0000ff ffffffff
!	%f20 = 4000ffff, Mem[0000000030101400] = ff0000ff
	sta	%f20,[%i4+%g0]0x89	! Mem[0000000030101400] = 4000ffff
!	Mem[0000000010101400] = 37e2d42c 37787411 35ffffff 0000ffff
!	%f0  = 00000000 03ecfff5 ffffffff ffffffff
!	%f4  = ffffffff 00000000 8fedd10c 9689f254
!	%f8  = eaff5022 98a11c6c ffff0000 76c3244e
!	%f12 = e5ffdb17 e402f331 0bc8a849 4222ff00
	stda	%f0 ,[%i4+%g0]ASI_BLK_AIUPL	! Block Store to 0000000010101400

p0_label_98:
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = 9689f254, %f17 = e6996adf
	lda	[%i0+%o4]0x81,%f17	! %f17 = 9689f254
!	%f15 = 4222ff00, %f2  = ffffffff
	fcmps	%fcc1,%f15,%f2 		! %fcc1 = 3
!	Mem[0000000010141400] = 00000000, %l2 = ffffffffffffff00
	lduwa	[%i5+%g0]0x80,%l2	! %l2 = 0000000000000000
!	%l6 = 0000000025c8dd22, %l1 = 000000003de296ff, %l3 = ffffffffffffff00
	subc	%l6,%l1,%l3		! %l3 = ffffffffe7e64623
!	Mem[0000000010041408] = ffffffff ffffffff, %l6 = 25c8dd22, %l7 = 00000000
	ldda	[%i1+%o4]0x88,%l6	! %l6 = 00000000ffffffff 00000000ffffffff
!	%l2 = 0000000000000000, imm = fffffffffffffd2b, %l4 = 00000000ff0000ff
	orn	%l2,-0x2d5,%l4		! %l4 = 00000000000002d4
	membar	#Sync			! Added by membar checker (18)
!	Mem[0000000010001400] = ffffffff ff9c780d 00ffffff fffffff5
!	Mem[0000000010001410] = 00ffffff 00ffffff 7e0e314a 7fec95f3
!	Mem[0000000010001420] = 77000000 00000027 00000000 00000066
!	Mem[0000000010001430] = 00000000 00000007 25c8dd22 6edccca1
	ldda	[%i0+%g0]ASI_BLK_PL,%f0 	! Block Load from 0000000010001400
!	Mem[0000000030101400] = 4000ffff, %l2 = 0000000000000000
	ldsha	[%i4+%g0]0x89,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000010081410] = 1159ce89, %l4 = 00000000000002d4
	ldsba	[%i2+%o5]0x88,%l4	! %l4 = ffffffffffffff89
!	Mem[00000000100c1420] = bde40559, %l6 = 00000000ffffffff
	ldsh	[%i3+0x020],%l6		! %l6 = ffffffffffffbde4

p0_label_99:
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1410] = 0000ff35, %l5 = ffffffffffffffff
	ldstuba	[%i3+%o5]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000010081410] = 89ce5911, %l1 = 000000003de296ff
	swapa	[%i2+%o5]0x80,%l1	! %l1 = 0000000089ce5911
!	%f16 = ffffffff 9689f254, %l2 = ffffffffffffffff
!	Mem[0000000010081438] = 00000035000000ff
	add	%i2,0x038,%g1
	stda	%f16,[%g1+%l2]ASI_PST32_P ! Mem[0000000010081438] = ffffffff9689f254
	membar	#Sync			! Added by membar checker (19)
!	%l0 = 00000000, %l1 = 89ce5911, Mem[0000000010001400] = ffffffff ff9c780d
	stda	%l0,[%i0+%g0]0x80	! Mem[0000000010001400] = 00000000 89ce5911
!	Mem[0000000010141410] = 4c1f77ff, %l3 = 00000000e7e64623
	swapa	[%i5+%o5]0x88,%l3	! %l3 = 000000004c1f77ff
!	%l5 = 0000000000000000, Mem[0000000010141418] = abd3875e, %asi = 80
	stha	%l5,[%i5+0x018]%asi	! Mem[0000000010141418] = 0000875e
!	%f12 = 07000000 00000000, Mem[0000000030181408] = ff000000 00000000
	stda	%f12,[%i6+%o4]0x81	! Mem[0000000030181408] = 07000000 00000000
!	Mem[0000000010001410] = 00ffffff00ffffff, %l4 = ffffffffffffff89, %l1 = 0000000089ce5911
	add	%i0,0x10,%g1
	casxa	[%g1]0x80,%l4,%l1	! %l1 = 00ffffff00ffffff
!	Mem[0000000010141400] = 00000000, %l0 = 0000000000000000
	ldstuba	[%i5+%g0]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000010081408] = 4c1f7727, %l2 = 00000000ffffffff
	swapa	[%i2+%o4]0x88,%l2	! %l2 = 000000004c1f7727

p0_label_100:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = ffffffff, %l0 = 0000000000000000
	lduw	[%i4+%o4],%l0		! %l0 = 00000000ffffffff
!	%f17 = 9689f254, %f16 = ffffffff
	fsqrts	%f17,%f16		! %f16 = 7fffffff
!	Mem[00000000100c1408] = ff0000ff, %l7 = 00000000ffffffff
	lduba	[%i3+%o4]0x80,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010101400] = 03ecfff5, %l7 = 00000000000000ff
	ldswa	[%i4+%g0]0x88,%l7	! %l7 = 0000000003ecfff5
!	Mem[0000000030001410] = 0000ffff, %f8  = 27000000
	lda	[%i0+%o5]0x89,%f8 	! %f8 = 0000ffff
!	Mem[0000000021800041] = 0cef2810, %l3 = 000000004c1f77ff, %asi = 80
	ldsba	[%o3+0x041]%asi,%l3	! %l3 = ffffffffffffffef
!	Mem[0000000010101438] = 00ff224249a8c80b, %l3 = ffffffffffffffef, %asi = 80
	ldxa	[%i4+0x038]%asi,%l3	! %l3 = 00ff224249a8c80b
!	Mem[00000000100c1400] = 0d787270, %f15 = 22ddc825
	lda	[%i3+%g0]0x88,%f15	! %f15 = 0d787270
!	Mem[0000000030081408] = ff0000ffffffffff, %f28 = 000000ff 04724124
	ldda	[%i2+%o4]0x81,%f28	! %f28 = ff0000ff ffffffff
!	Mem[00000000100c1410] = ff00751811e06d41, %f6  = f395ec7f 4a310e7e
	ldda	[%i3+%o5]0x80,%f6 	! %f6  = ff007518 11e06d41

p0_label_101:
!	Starting 10 instruction Store Burst
!	%l2 = 4c1f7727, %l3 = 49a8c80b, Mem[00000000100c1408] = ff0000ff 16030000
	stda	%l2,[%i3+%o4]0x80	! Mem[00000000100c1408] = 4c1f7727 49a8c80b
!	Mem[0000000030181408] = 07000000, %l2 = 000000004c1f7727
	swapa	[%i6+%o4]0x81,%l2	! %l2 = 0000000007000000
!	Mem[0000000030081408] = ff0000ff, %l1 = 00ffffff00ffffff
	ldstuba	[%i2+%o4]0x89,%l1	! %l1 = 00000000000000ff
!	%l0 = ffffffff, %l1 = 000000ff, Mem[0000000010041420] = 6c1ca198 2250ffea, %asi = 80
	stda	%l0,[%i1+0x020]%asi	! Mem[0000000010041420] = ffffffff 000000ff
!	%l7 = 0000000003ecfff5, Mem[0000000030001410] = 0000ffff
	stba	%l7,[%i0+%o5]0x89	! Mem[0000000030001410] = 0000fff5
!	%l2 = 0000000007000000, Mem[0000000010141408] = ff96e23d
	stba	%l2,[%i5+%o4]0x80	! Mem[0000000010141408] = 0096e23d
!	%l6 = ffffffffffffbde4, Mem[0000000030001408] = 9689f254ff9c780d
	stxa	%l6,[%i0+%o4]0x81	! Mem[0000000030001408] = ffffffffffffbde4
!	%l0 = 00000000ffffffff, Mem[00000000300c1408] = ffffffffffffffff
	stxa	%l0,[%i3+%o4]0x89	! Mem[00000000300c1408] = 00000000ffffffff
!	Mem[0000000030181408] = 4c1f7727, %l3 = 00ff224249a8c80b
	ldstuba	[%i6+%o4]0x81,%l3	! %l3 = 000000000000004c
!	%f18 = ffff0000 000000ff, %l4 = ffffffffffffff89
!	Mem[0000000030181400] = ffffffffffffffdf
	stda	%f18,[%i6+%l4]ASI_PST32_SL ! Mem[0000000030181400] = ff000000ffffffdf

p0_label_102:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = 00000000 ffffffff, %l2 = 07000000, %l3 = 0000004c
	ldd	[%i1+%o5],%l2		! %l2 = 0000000000000000 00000000ffffffff
!	Mem[0000000010181410] = ffff004092e92444, %f2  = f5ffffff ffffff00
	ldd	[%i6+%o5],%f2 		! %f2  = ffff0040 92e92444
!	Mem[0000000010041400] = f5ffec03, %l0 = 00000000ffffffff
	swapa	[%i1+%g0]0x80,%l0	! %l0 = 00000000f5ffec03
!	Mem[0000000030141400] = 00000000, %l6 = ffffffffffffbde4
	ldsba	[%i5+%g0]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000030041408] = 9a8e360c, %l6 = 0000000000000000
	lduba	[%i1+%o4]0x81,%l6	! %l6 = 000000000000009a
!	Mem[0000000030081408] = ff0000ff, %l7 = 0000000003ecfff5
	ldswa	[%i2+%o4]0x89,%l7	! %l7 = ffffffffff0000ff
!	Mem[00000000100c1410] = ff00751811e06d41, %l7 = ffffffffff0000ff
	ldxa	[%i3+%o5]0x80,%l7	! %l7 = ff00751811e06d41
!	Mem[0000000030101408] = 00000000, %l2 = 0000000000000000
	ldsha	[%i4+%o4]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000030041410] = 00000000f5ffffff, %f4  = ffffff00 ffffff00
	ldda	[%i1+%o5]0x89,%f4 	! %f4  = 00000000 f5ffffff
!	Mem[0000000020800001] = 00ffc750, %l3 = 00000000ffffffff, %asi = 80
	lduba	[%o1+0x001]%asi,%l3	! %l3 = 00000000000000ff

p0_label_103:
!	Starting 10 instruction Store Burst
!	%l7 = ff00751811e06d41, Mem[00000000201c0001] = ffff2520, %asi = 80
	stba	%l7,[%o0+0x001]%asi	! Mem[00000000201c0000] = ff412520
!	%l0 = 00000000f5ffec03, Mem[0000000030141408] = ffffffff
	stba	%l0,[%i5+%o4]0x81	! Mem[0000000030141408] = 03ffffff
!	%l4 = ffffffffffffff89, Mem[0000000030101410] = 144214dc
	stwa	%l4,[%i4+%o5]0x89	! Mem[0000000030101410] = ffffff89
!	%f24 = e6996adf, Mem[0000000010101408] = ffffffff
	sta	%f24,[%i4+%o4]0x80	! Mem[0000000010101408] = e6996adf
!	Mem[0000000010081400] = 00000000, %l7 = 0000000011e06d41
	swapa	[%i2+%g0]0x80,%l7	! %l7 = 0000000000000000
!	%l2 = 0000000000000000, Mem[0000000030081410] = dc1437e2
	stba	%l2,[%i2+%o5]0x89	! Mem[0000000030081410] = dc143700
!	Mem[0000000030101408] = 00000000, %l5 = 0000000000000000
	ldstuba	[%i4+%o4]0x89,%l5	! %l5 = 0000000000000000
!	%f22 = ff0d0040 6626ae93, Mem[0000000010101438] = 00ff2242 49a8c80b
	std	%f22,[%i4+0x038]	! Mem[0000000010101438] = ff0d0040 6626ae93
!	Mem[0000000010181410] = 4000ffff, %l2 = 0000000000000000
	swapa	[%i6+%o5]0x88,%l2	! %l2 = 000000004000ffff
!	Mem[00000000100c1424] = e0a9fd34, %l3 = 00000000000000ff
	ldstub	[%i3+0x024],%l3		! %l3 = 00000000000000e0

p0_label_104:
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = f5ff0000, %l2 = 000000004000ffff
	lduba	[%i0+%o5]0x81,%l2	! %l2 = 00000000000000f5
!	Mem[00000000100c1400] = 0d787270, %l3 = 00000000000000e0
	lduba	[%i3+%g0]0x88,%l3	! %l3 = 0000000000000070
!	Mem[0000000010101410] = 00000000, %l7 = 0000000000000000
	lduha	[%i4+%o5]0x80,%l7	! %l7 = 0000000000000000
!	%l4 = ffffffffffffff89, %l3 = 0000000000000070, %l2  = 00000000000000f5
	mulx	%l4,%l3,%l2		! %l2 = ffffffffffffcbf0
!	Mem[00000000300c1408] = ffffffff, %l0 = 00000000f5ffec03
	ldsba	[%i3+%o4]0x81,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010181400] = 000000ff 0000ff35, %l0 = ffffffff, %l1 = 000000ff
	ldda	[%i6+%g0]0x80,%l0	! %l0 = 00000000000000ff 000000000000ff35
!	Mem[0000000010041408] = ffffffff, %l1 = 000000000000ff35
	ldsba	[%i1+%o4]0x80,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010141438] = 0017d7c222ea378b, %f2  = ffff0040 92e92444
	ldd	[%i5+0x038],%f2 	! %f2  = 0017d7c2 22ea378b
!	Mem[0000000010141418] = 0000875e6b606e13, %l4 = ffffffffffffff89, %asi = 80
	ldxa	[%i5+0x018]%asi,%l4	! %l4 = 0000875e6b606e13
!	Mem[0000000030101410] = 89ffffff, %l1 = ffffffffffffffff
	lduba	[%i4+%o5]0x81,%l1	! %l1 = 0000000000000089

p0_label_105:
!	Starting 10 instruction Store Burst
!	%l1 = 0000000000000089, Mem[0000000030081410] = dc143700
	stha	%l1,[%i2+%o5]0x89	! Mem[0000000030081410] = dc140089
!	Mem[0000000030001400] = 49bc00ff, %l7 = 0000000000000000
	ldstuba	[%i0+%g0]0x89,%l7	! %l7 = 00000000000000ff
!	%l0 = 00000000000000ff, %l4 = 0000875e6b606e13, %l0 = 00000000000000ff
	sub	%l0,%l4,%l0		! %l0 = ffff78a1949f92ec
!	Mem[0000000030001400] = ff00bc49, %l2 = 00000000ffffcbf0
	swapa	[%i0+%g0]0x81,%l2	! %l2 = 00000000ff00bc49
!	Mem[0000000010181418] = 7e0e314a, %l2 = 00000000ff00bc49, %asi = 80
	ldsba	[%i6+0x018]%asi,%l2	! %l2 = 000000000000007e
!	Mem[0000000030081400] = 00040000, %l5 = 0000000000000000
	swapa	[%i2+%g0]0x81,%l5	! %l5 = 0000000000040000
!	%l6 = 000000000000009a, imm = fffffffffffff719, %l2 = 000000000000007e
	or	%l6,-0x8e7,%l2		! %l2 = fffffffffffff79b
!	Mem[0000000010001408] = 00ffffff, %l3 = 0000000000000070
	swapa	[%i0+%o4]0x80,%l3	! %l3 = 0000000000ffffff
!	%f27 = ff0000ff, %f19 = 000000ff, %f25 = ff007518
	fdivs	%f27,%f19,%f25		! %f25 = ff800000
!	Mem[0000000030101410] = ffffff89, %l2 = fffffffffffff79b
	ldstuba	[%i4+%o5]0x89,%l2	! %l2 = 0000000000000089

p0_label_106:
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = 000000ff, %l7 = 00000000000000ff
	ldswa	[%i6+%g0]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010141410] = 2346e6e7, %f25 = ff800000
	lda	[%i5+%o5]0x80,%f25	! %f25 = 2346e6e7
!	Mem[00000000100c1400] = 7072780d, %l7 = 00000000000000ff
	ldsb	[%i3+%g0],%l7		! %l7 = 0000000000000070
!	Mem[0000000030181408] = 00000000 27771fff, %l4 = 6b606e13, %l5 = 00040000
	ldda	[%i6+%o4]0x89,%l4	! %l4 = 0000000027771fff 0000000000000000
!	Mem[00000000100c141c] = 000000ff, %l0 = ffff78a1949f92ec, %asi = 80
	ldswa	[%i3+0x01c]%asi,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030141400] = 00000000 25c8dd22, %l2 = 00000089, %l3 = 00ffffff
	ldda	[%i5+%g0]0x81,%l2	! %l2 = 0000000000000000 0000000025c8dd22
!	Mem[0000000010081408] = ffffffff, %l2 = 0000000000000000
	lduha	[%i2+%o4]0x88,%l2	! %l2 = 000000000000ffff
!	Mem[00000000100c1400] = 7072780d6242bf40, %l3 = 0000000025c8dd22
	ldxa	[%i3+%g0]0x80,%l3	! %l3 = 7072780d6242bf40
	membar	#Sync			! Added by membar checker (20)
!	Mem[0000000030141400] = 00000000 25c8dd22 03ffffff 27000000
!	Mem[0000000030141410] = 00000000 1159ce89 ff000000 0000ffff
!	Mem[0000000030141420] = 4abcde28 333dec99 3cf786a6 0c098c5f
!	Mem[0000000030141430] = 0d789c76 447d3b71 21d58c72 3dd76b7b
	ldda	[%i5+%g0]ASI_BLK_AIUS,%f0 	! Block Load from 0000000030141400
!	Mem[0000000030001400] = 00000000f0cbffff, %f26 = a996e23d ff0000ff
	ldda	[%i0+%g0]0x89,%f26	! %f26 = 00000000 f0cbffff

p0_label_107:
!	Starting 10 instruction Store Burst
!	Mem[0000000030001410] = 0000fff5, %l5 = 0000000000000000
	ldstuba	[%i0+%o5]0x89,%l5	! %l5 = 00000000000000f5
!	%l6 = 000000000000009a, Mem[0000000010181408] = 00000000df6a99e6
	stxa	%l6,[%i6+%o4]0x88	! Mem[0000000010181408] = 000000000000009a
!	%f2  = 03ffffff, Mem[00000000300c1410] = ff00ff35
	sta	%f2 ,[%i3+%o5]0x81	! Mem[00000000300c1410] = 03ffffff
!	%l0 = 00000000000000ff, Mem[00000000100c1408] = 4c1f7727
	stha	%l0,[%i3+%o4]0x80	! Mem[00000000100c1408] = 00ff7727
!	Mem[0000000010041410] = 00000000, %l3 = 7072780d6242bf40
	ldstuba	[%i1+%o5]0x80,%l3	! %l3 = 0000000000000000
	membar	#Sync			! Added by membar checker (21)
!	%f12 = 0d789c76, Mem[0000000030141400] = 00000000
	sta	%f12,[%i5+%g0]0x89	! Mem[0000000030141400] = 0d789c76
!	%f10 = 3cf786a6 0c098c5f, %l6 = 000000000000009a
!	Mem[0000000010181438] = 000037e27a1ecca1
	add	%i6,0x038,%g1
	stda	%f10,[%g1+%l6]ASI_PST32_PL ! Mem[0000000010181438] = 000037e2a686f73c
!	%l6 = 0000009a, %l7 = 00000070, Mem[0000000010141400] = ff000000 ffff0000
	stda	%l6,[%i5+%g0]0x80	! Mem[0000000010141400] = 0000009a 00000070
!	%f28 = ff0000ff ffffffff, %l0 = 00000000000000ff
!	Mem[00000000100c1430] = 47a707a4e40252a5
	add	%i3,0x030,%g1
	stda	%f28,[%g1+%l0]ASI_PST8_P ! Mem[00000000100c1430] = ff0000ffffffffff
!	%l7 = 0000000000000070, Mem[0000000010001430] = 0000000000000007
	stx	%l7,[%i0+0x030]		! Mem[0000000010001430] = 0000000000000070

p0_label_108:
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = ff0000ff, %l1 = 0000000000000089
	lduba	[%i2+%o4]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030041410] = fffffff5, %l4 = 0000000027771fff
	lduha	[%i1+%o5]0x81,%l4	! %l4 = 000000000000ffff
!	%l5 = 00000000000000f5, %l6 = 000000000000009a, %l2 = 000000000000ffff
	orn	%l5,%l6,%l2		! %l2 = fffffffffffffff5
!	Mem[0000000010181408] = 0000009a, %f5  = 1159ce89
	lda	[%i6+%o4]0x88,%f5 	! %f5 = 0000009a
!	Mem[0000000010141408] = 0096e23d, %l1 = 00000000000000ff, %asi = 80
	ldswa	[%i5+0x008]%asi,%l1	! %l1 = 000000000096e23d
!	Mem[00000000100c1410] = 187500ff, %l2 = fffffffffffffff5
	ldsha	[%i3+%o5]0x88,%l2	! %l2 = 00000000000000ff
!	%f11 = 0c098c5f, %f12 = 0d789c76, %f28 = ff0000ff ffffffff
	fsmuld	%f11,%f12,%f28		! %f28 = 3340b281 9f12f940
!	Mem[0000000010001400] = 00000000, %l7 = 0000000000000070
	lduba	[%i0+%g0]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000010101400] = f5ffec03, %l5 = 00000000000000f5
	ldswa	[%i4+%g0]0x80,%l5	! %l5 = fffffffff5ffec03
!	Mem[00000000100c1410] = ff007518, %l0 = 00000000000000ff
	ldswa	[%i3+%o5]0x80,%l0	! %l0 = ffffffffff007518

p0_label_109:
!	Starting 10 instruction Store Burst
!	%l3 = 0000000000000000, Mem[0000000030041400] = 000000ff
	stwa	%l3,[%i1+%g0]0x89	! Mem[0000000030041400] = 00000000
!	%l6 = 000000000000009a, Mem[0000000010081410] = 3de296ff00000000
	stx	%l6,[%i2+%o5]		! Mem[0000000010081410] = 000000000000009a
!	Mem[0000000030081400] = 00000000, %l1 = 000000000096e23d
	swapa	[%i2+%g0]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000010141438] = 0017d7c2, %l2 = 000000ff, %l0 = ff007518
	add	%i5,0x38,%g1
	casa	[%g1]0x80,%l2,%l0	! %l0 = 000000000017d7c2
!	%f26 = 00000000 f0cbffff, Mem[0000000030081408] = ff0000ff ffffffff
	stda	%f26,[%i2+%o4]0x89	! Mem[0000000030081408] = 00000000 f0cbffff
!	%l6 = 0000009a, %l7 = 00000000, Mem[00000000100c1410] = ff007518 11e06d41
	stda	%l6,[%i3+%o5]0x80	! Mem[00000000100c1410] = 0000009a 00000000
!	Mem[000000001000140e] = fffffff5, %l0 = 000000000017d7c2
	ldstub	[%i0+0x00e],%l0		! %l0 = 00000000000000ff
!	Mem[0000000030101400] = ffff0040 77ff0000 ff000000 0000007f
!	%f16 = 7fffffff 9689f254 ffff0000 000000ff
!	%f20 = 4000ffff 00000406 ff0d0040 6626ae93
!	%f24 = e6996adf 2346e6e7 00000000 f0cbffff
!	%f28 = 3340b281 9f12f940 abd3875e fffffff5
	stda	%f16,[%i4+%g0]ASI_BLK_SL	! Block Store to 0000000030101400
!	%l4 = 0000ffff, %l5 = f5ffec03, Mem[00000000100c1408] = 2777ff00 0bc8a849
	stda	%l4,[%i3+%o4]0x88	! Mem[00000000100c1408] = 0000ffff f5ffec03
!	%l6 = 0000009a, %l7 = 00000000, Mem[0000000030141408] = ffffff03 00000027
	stda	%l6,[%i5+%o4]0x89	! Mem[0000000030141408] = 0000009a 00000000

p0_label_110:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041410] = ff000000, %l6 = 000000000000009a
	swapa	[%i1+%o5]0x80,%l6	! %l6 = 00000000ff000000
!	Mem[0000000020800001] = 00ffc750, %l5 = fffffffff5ffec03, %asi = 80
	lduba	[%o1+0x001]%asi,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010001408] = 00000070fffffff5, %l1 = 0000000000000000
	ldxa	[%i0+%o4]0x80,%l1	! %l1 = 00000070fffffff5
	membar	#Sync			! Added by membar checker (22)
!	Mem[000000001010143c] = 6626ae93, %l6 = 00000000ff000000
	ldsw	[%i4+0x03c],%l6		! %l6 = 000000006626ae93
!	Mem[00000000100c1408] = f5ffec03 0000ffff, %l2 = 000000ff, %l3 = 00000000
	ldda	[%i3+%o4]0x88,%l2	! %l2 = 000000000000ffff 00000000f5ffec03
!	Mem[0000000030041410] = f5ffffff, %l0 = 00000000000000ff
	lduha	[%i1+%o5]0x89,%l0	! %l0 = 000000000000ffff
!	Mem[0000000010141408] = 3de29600, %f13 = 447d3b71
	lda	[%i5+%o4]0x88,%f13	! %f13 = 3de29600
!	Mem[0000000030001408] = e4bdffff ffffffff, %l6 = 6626ae93, %l7 = 00000000
	ldda	[%i0+%o4]0x89,%l6	! %l6 = 00000000ffffffff 00000000e4bdffff
!	Mem[0000000010081410] = 00000000, %f23 = 6626ae93
	lda	[%i2+%o5]0x88,%f23	! %f23 = 00000000
!	Mem[0000000010081408] = 24417204ffffffff, %l3 = 00000000f5ffec03
	ldxa	[%i2+%o4]0x88,%l3	! %l3 = 24417204ffffffff

p0_label_111:
!	Starting 10 instruction Store Burst
!	%l7 = 00000000e4bdffff, Mem[0000000010001400] = 0000000089ce5911
	stxa	%l7,[%i0+%g0]0x80	! Mem[0000000010001400] = 00000000e4bdffff
!	%l0 = 000000000000ffff, Mem[0000000030101400] = 9689f254
	stha	%l0,[%i4+%g0]0x89	! Mem[0000000030101400] = 9689ffff
!	%l0 = 000000000000ffff, Mem[0000000030001408] = ffffffffffffbde4
	stxa	%l0,[%i0+%o4]0x81	! Mem[0000000030001408] = 000000000000ffff
!	%l5 = 00000000000000ff, Mem[0000000010101418] = 54f28996, %asi = 80
	stwa	%l5,[%i4+0x018]%asi	! Mem[0000000010101418] = 000000ff
!	Mem[0000000010141435] = 0e140c65, %l0 = 000000000000ffff
	ldstuba	[%i5+0x035]%asi,%l0	! %l0 = 0000000000000014
!	%l6 = 00000000ffffffff, Mem[0000000030141400] = 769c780d
	stha	%l6,[%i5+%g0]0x81	! Mem[0000000030141400] = ffff780d
!	Mem[0000000030041400] = 00000000 00000027 9a8e360c 2cd4e237
!	%f0  = 00000000 25c8dd22 03ffffff 27000000
!	%f4  = 00000000 0000009a ff000000 0000ffff
!	%f8  = 4abcde28 333dec99 3cf786a6 0c098c5f
!	%f12 = 0d789c76 3de29600 21d58c72 3dd76b7b
	stda	%f0 ,[%i1+%g0]ASI_BLK_AIUSL	! Block Store to 0000000030041400
!	%l6 = ffffffff, %l7 = e4bdffff, Mem[0000000010081410] = 00000000 0000009a
	stda	%l6,[%i2+%o5]0x80	! Mem[0000000010081410] = ffffffff e4bdffff
!	Mem[0000000030081408] = f0cbffff, %l0 = 0000000000000014
	ldstuba	[%i2+%o4]0x89,%l0	! %l0 = 00000000000000ff
!	%l6 = 00000000ffffffff, %l5 = 00000000000000ff, %l3 = 24417204ffffffff
	subc	%l6,%l5,%l3		! %l3 = 00000000ffffff00

p0_label_112:
!	Starting 10 instruction Load Burst
!	%f23 = 00000000, %f17 = 9689f254, %f24 = e6996adf
	fmuls	%f23,%f17,%f24		! %f24 = 80000000
!	Mem[0000000010181400] = ff000000, %l7 = 00000000e4bdffff
	ldsba	[%i6+%g0]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000030081410] = dc140089, %l4 = 000000000000ffff
	lduba	[%i2+%o5]0x89,%l4	! %l4 = 0000000000000089
!	Mem[00000000100c1422] = bde40559, %l2 = 000000000000ffff
	ldsh	[%i3+0x022],%l2		! %l2 = 0000000000000559
!	Mem[00000000201c0000] = ff412520, %l4 = 0000000000000089
	lduh	[%o0+%g0],%l4		! %l4 = 000000000000ff41
!	Mem[0000000010141410] = 2346e6e7, %l6 = 00000000ffffffff
	lduha	[%i5+%o5]0x80,%l6	! %l6 = 0000000000002346
!	Mem[0000000010181410] = 4424e99200000000, %l5 = 00000000000000ff
	ldxa	[%i6+%o5]0x88,%l5	! %l5 = 4424e99200000000
!	Mem[0000000030181400] = 000000ff, %l4 = 000000000000ff41
	lduba	[%i6+%g0]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[000000001000140c] = fffffff5, %l4 = 00000000000000ff
	ldsw	[%i0+0x00c],%l4		! %l4 = fffffffffffffff5
!	Mem[0000000030141410] = 00000000, %l2 = 0000000000000559
	lduwa	[%i5+%o5]0x89,%l2	! %l2 = 0000000000000000

p0_label_113:
!	Starting 10 instruction Store Burst
!	Mem[00000000100c141c] = 000000ff, %l7 = 00000000, %l6 = 00002346
	add	%i3,0x1c,%g1
	casa	[%g1]0x80,%l7,%l6	! %l6 = 00000000000000ff
!	%f6  = ff000000 0000ffff, %l7 = 0000000000000000
!	Mem[0000000030141408] = 9a00000000000000
	add	%i5,0x008,%g1
	stda	%f6,[%g1+%l7]ASI_PST32_S ! Mem[0000000030141408] = 9a00000000000000
!	%l7 = 0000000000000000, Mem[00000000201c0000] = ff412520, %asi = 80
	stha	%l7,[%o0+0x000]%asi	! Mem[00000000201c0000] = 00002520
!	%l7 = 0000000000000000, Mem[0000000030101400] = ffff8996
	stwa	%l7,[%i4+%g0]0x81	! Mem[0000000030101400] = 00000000
!	%l2 = 0000000000000000, immd = fffffba7, %y  = fffff920
	sdiv	%l2,-0x459,%l4		! %l4 = 000000007fffffff
	mov	%l0,%y			! %y = 000000ff
!	%f8  = 4abcde28 333dec99, Mem[0000000030001410] = 0000ffff 0d789c76
	stda	%f8 ,[%i0+%o5]0x89	! Mem[0000000030001410] = 4abcde28 333dec99
!	%l4 = 000000007fffffff, Mem[0000000010101400] = f5ffec03
	stwa	%l4,[%i4+%g0]0x80	! Mem[0000000010101400] = 7fffffff
!	%f17 = 9689f254, Mem[0000000030101400] = 00000000
	sta	%f17,[%i4+%g0]0x81	! Mem[0000000030101400] = 9689f254
!	%f3  = 27000000, Mem[0000000010041400] = ffffffff
	sta	%f3 ,[%i1+%g0]0x80	! Mem[0000000010041400] = 27000000
!	%f12 = 0d789c76, Mem[00000000300c1400] = ff0000ff
	sta	%f12,[%i3+%g0]0x89	! Mem[00000000300c1400] = 0d789c76

p0_label_114:
!	Starting 10 instruction Load Burst
!	Mem[0000000030101410] = 06040000, %l5 = 4424e99200000000
	lduba	[%i4+%o5]0x81,%l5	! %l5 = 0000000000000006
!	Mem[0000000010081408] = ffffffff04724124, %l3 = 00000000ffffff00
	ldxa	[%i2+%o4]0x80,%l3	! %l3 = ffffffff04724124
!	Mem[0000000020800000] = 00ffc750, %l1 = 00000070fffffff5
	ldsh	[%o1+%g0],%l1		! %l1 = 00000000000000ff
!	%f24 = 80000000, %f15 = 3dd76b7b, %f27 = f0cbffff
	fmuls	%f24,%f15,%f27		! %f27 = 80000000
!	Mem[0000000010181410] = 0000000092e92444, %l4 = 000000007fffffff
	ldx	[%i6+%o5],%l4		! %l4 = 0000000092e92444
!	Mem[0000000010001414] = 00ffffff, %l0 = 00000000000000ff
	lduw	[%i0+0x014],%l0		! %l0 = 0000000000ffffff
!	Mem[0000000030101410] = 06040000, %l3 = ffffffff04724124
	ldswa	[%i4+%o5]0x81,%l3	! %l3 = 0000000006040000
!	Mem[0000000010181420] = 6effea58, %f31 = fffffff5
	ld	[%i6+0x020],%f31	! %f31 = 6effea58
!	Mem[0000000010001428] = 0000000000000066, %f20 = 4000ffff 00000406, %asi = 80
	ldda	[%i0+0x028]%asi,%f20	! %f20 = 00000000 00000066
!	Mem[0000000030081410] = 890014dc, %l2 = 0000000000000000
	ldswa	[%i2+%o5]0x81,%l2	! %l2 = ffffffff890014dc

p0_label_115:
!	Starting 10 instruction Store Burst
!	%l2 = 890014dc, %l3 = 06040000, Mem[0000000030081410] = dc140089 e6996adf
	stda	%l2,[%i2+%o5]0x89	! Mem[0000000030081410] = 890014dc 06040000
!	%l1 = 00000000000000ff, Mem[0000000010081400] = 11e06d41
	stba	%l1,[%i2+%g0]0x80	! Mem[0000000010081400] = ffe06d41
!	%f0  = 00000000 25c8dd22, %l1 = 00000000000000ff
!	Mem[0000000010181400] = 000000ff0000ff35
	stda	%f0,[%i6+%l1]ASI_PST8_P ! Mem[0000000010181400] = 0000000025c8dd22
!	Mem[0000000010001421] = 77000000, %l5 = 0000000000000006
	ldstuba	[%i0+0x021]%asi,%l5	! %l5 = 0000000000000000
!	Mem[00000000100c1410] = 9a000000, %l1 = 00000000000000ff
	ldstuba	[%i3+%o5]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000030081410] = dc140089, %l7 = 0000000000000000
	swapa	[%i2+%o5]0x81,%l7	! %l7 = 00000000dc140089
!	%l7 = 00000000dc140089, Mem[0000000010081426] = 333dec99, %asi = 80
	stba	%l7,[%i2+0x026]%asi	! Mem[0000000010081424] = 333d8999
!	%l6 = 00000000000000ff, Mem[0000000010041408] = ffffffffffffffff
	stxa	%l6,[%i1+%o4]0x80	! Mem[0000000010041408] = 00000000000000ff
!	%l1 = 0000000000000000, Mem[0000000010081410] = ffffffff
	stwa	%l1,[%i2+%o5]0x80	! Mem[0000000010081410] = 00000000
!	%f18 = ffff0000, Mem[0000000010101410] = 00000000
	sta	%f18,[%i4+%o5]0x80	! Mem[0000000010101410] = ffff0000

p0_label_116:
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (23)
!	Mem[0000000010041415] = ffffffff, %l5 = 0000000000000000, %asi = 80
	ldsba	[%i1+0x015]%asi,%l5	! %l5 = ffffffffffffffff
!	%l5 = ffffffffffffffff, imm = 0000000000000b35, %l7 = 00000000dc140089
	subc	%l5,0xb35,%l7		! %l7 = fffffffffffff4ca
!	Mem[0000000010081410] = 00000000, %l1 = 0000000000000000
	ldsba	[%i2+%o5]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000030181400] = dfffffff000000ff, %l4 = 0000000092e92444
	ldxa	[%i6+%g0]0x89,%l4	! %l4 = dfffffff000000ff
!	Mem[0000000010041408] = ff00000000000000, %f10 = 3cf786a6 0c098c5f
	ldda	[%i1+%o4]0x88,%f10	! %f10 = ff000000 00000000
!	Mem[0000000030101400] = 9689f254, %l3 = 0000000006040000
	ldsba	[%i4+%g0]0x81,%l3	! %l3 = ffffffffffffff96
!	Mem[0000000021800140] = 17aa48d0, %l4 = dfffffff000000ff
	ldsh	[%o3+0x140],%l4		! %l4 = 00000000000017aa
!	Mem[0000000010081430] = 0d789c76447d3b71, %f30 = abd3875e 6effea58, %asi = 80
	ldda	[%i2+0x030]%asi,%f30	! %f30 = 0d789c76 447d3b71
!	Mem[0000000010181411] = 00000000, %l4 = 00000000000017aa, %asi = 80
	ldsba	[%i6+0x011]%asi,%l4	! %l4 = 0000000000000000
!	%f4  = 00000000, %f27 = 80000000, %f16 = 7fffffff
	fsubs	%f4 ,%f27,%f16		! %f16 = 00000000

p0_label_117:
!	Starting 10 instruction Store Burst
!	Mem[00000000201c0000] = 00002520, %l7 = fffffffffffff4ca
	ldstub	[%o0+%g0],%l7		! %l7 = 0000000000000000
!	Mem[00000000300c1408] = ffffffff, %l4 = 0000000000000000
	swapa	[%i3+%o4]0x89,%l4	! %l4 = 00000000ffffffff
!	%l2 = ffffffff890014dc, Mem[00000000100c140c] = 03ecfff5
	sth	%l2,[%i3+0x00c]		! Mem[00000000100c140c] = 14dcfff5
!	Mem[00000000218000c0] = 7285c070, %l7 = 0000000000000000
	ldstuba	[%o3+0x0c0]%asi,%l7	! %l7 = 0000000000000072
!	%l4 = ffffffff, %l5 = ffffffff, Mem[0000000010001408] = 70000000 f5ffffff
	stda	%l4,[%i0+%o4]0x88	! Mem[0000000010001408] = ffffffff ffffffff
!	Mem[000000001018143c] = a686f73c, %l6 = 00000000000000ff, %asi = 80
	swapa	[%i6+0x03c]%asi,%l6	! %l6 = 00000000a686f73c
!	Mem[0000000010141421] = 5dcdcdf8, %l0 = 0000000000ffffff
	ldstub	[%i5+0x021],%l0		! %l0 = 00000000000000cd
!	%l0 = 000000cd, %l1 = 00000000, Mem[0000000010141400] = 9a000000 70000000
	stda	%l0,[%i5+%g0]0x88	! Mem[0000000010141400] = 000000cd 00000000
!	%l7 = 0000000000000072, %l4 = 00000000ffffffff, %l0 = 00000000000000cd
	add	%l7,%l4,%l0		! %l0 = 0000000100000071
!	%l5 = ffffffffffffffff, Mem[0000000010081424] = 333d8999
	stb	%l5,[%i2+0x024]		! Mem[0000000010081424] = ff3d8999

p0_label_118:
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = 00000000, %l0 = 0000000100000071
	ldswa	[%i5+%o5]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000010181410] = 00000000 92e92444, %l2 = 890014dc, %l3 = ffffff96
	ldda	[%i6+%o5]0x80,%l2	! %l2 = 0000000000000000 0000000092e92444
!	Mem[00000000211c0000] = ffff7fb0, %l1 = 0000000000000000, %asi = 80
	lduha	[%o2+0x000]%asi,%l1	! %l1 = 000000000000ffff
!	Mem[000000001004143c] = 49a8c80b, %l6 = 00000000a686f73c
	lduw	[%i1+0x03c],%l6		! %l6 = 0000000049a8c80b
!	Mem[0000000010181410] = 00000000, %l7 = 0000000000000072
	lduba	[%i6+%o5]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000030041408] = 00000027, %l5 = ffffffffffffffff
	lduba	[%i1+%o4]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000010141400] = 00000000000000cd, %l0 = 0000000000000000
	ldxa	[%i5+%g0]0x88,%l0	! %l0 = 00000000000000cd
!	Mem[0000000010041400] = 0000000000000027, %f2  = 03ffffff 27000000
	ldda	[%i1+%g0]0x88,%f2 	! %f2  = 00000000 00000027
!	Mem[0000000010181400] = 00000000, %f6  = ff000000
	lda	[%i6+%g0]0x88,%f6 	! %f6 = 00000000
!	Mem[00000000300c1410] = ffffff03, %l7 = 0000000000000000
	ldsba	[%i3+%o5]0x89,%l7	! %l7 = 0000000000000003

p0_label_119:
!	Starting 10 instruction Store Burst
!	%f22 = ff0d0040 00000000, %l3 = 0000000092e92444
!	Mem[0000000030001400] = ffffcbf000000000
	stda	%f22,[%i0+%l3]ASI_PST16_SL ! Mem[0000000030001400] = ffffcbf040000000
!	%l5 = 0000000000000000, Mem[0000000030081408] = ffffcbf000000000
	stxa	%l5,[%i2+%o4]0x81	! Mem[0000000030081408] = 0000000000000000
!	Mem[0000000010081410] = 00000000, %l7 = 0000000000000003
	swapa	[%i2+%o5]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000010101404] = 00000000, %l6 = 0000000049a8c80b, %asi = 80
	swapa	[%i4+0x004]%asi,%l6	! %l6 = 0000000000000000
!	Mem[0000000010001410] = 00ffffff, %l4 = 00000000ffffffff
	ldstuba	[%i0+%o5]0x80,%l4	! %l4 = 0000000000000000
!	Mem[00000000300c1400] = 769c780d, %l3 = 0000000092e92444
	ldstuba	[%i3+%g0]0x81,%l3	! %l3 = 0000000000000076
!	Mem[0000000010141400] = cd000000, %l4 = 0000000000000000
	swapa	[%i5+%g0]0x80,%l4	! %l4 = 00000000cd000000
!	Mem[0000000030181400] = ff000000, %l6 = 0000000000000000
	swapa	[%i6+%g0]0x81,%l6	! %l6 = 00000000ff000000
!	%l6 = 00000000ff000000, Mem[0000000021800140] = 17aa48d0, %asi = 80
	stha	%l6,[%o3+0x140]%asi	! Mem[0000000021800140] = 000048d0
!	%f12 = 0d789c76 3de29600, %l2 = 0000000000000000
!	Mem[0000000030101428] = ffffcbf000000000
	add	%i4,0x028,%g1
	stda	%f12,[%g1+%l2]ASI_PST16_S ! Mem[0000000030101428] = ffffcbf000000000

p0_label_120:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141426] = 529a00ff, %l3 = 0000000000000076
	ldsb	[%i5+0x026],%l3		! %l3 = 0000000000000000
!	%l7 = 0000000000000000, %l4 = 00000000cd000000, %l1 = 000000000000ffff
	xor	%l7,%l4,%l1		! %l1 = 00000000cd000000
!	Mem[0000000010181410] = 00000000, %l2 = 0000000000000000
	lduwa	[%i6+%o5]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000030181408] = 27771fff, %l6 = 00000000ff000000
	lduha	[%i6+%o4]0x89,%l6	! %l6 = 0000000000001fff
!	Mem[0000000010081410] = 03000000 e4bdffff, %l2 = 00000000, %l3 = 00000000
	ldda	[%i2+%o5]0x80,%l2	! %l2 = 0000000003000000 00000000e4bdffff
!	%f28 = 3340b281, %f31 = 447d3b71
	fcmpes	%fcc3,%f28,%f31		! %fcc3 = 1
!	Mem[0000000020800000] = 00ffc750, %l5 = 0000000000000000, %asi = 80
	ldsha	[%o1+0x000]%asi,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030001408] = 00000000, %l2 = 0000000003000000
	ldsba	[%i0+%o4]0x89,%l2	! %l2 = 0000000000000000
!	Mem[00000000300c1400] = 0d789cff, %l4 = 00000000cd000000
	lduwa	[%i3+%g0]0x89,%l4	! %l4 = 000000000d789cff
!	Mem[0000000030041410] = 000000000000009a, %l5 = 00000000000000ff
	ldxa	[%i1+%o5]0x89,%l5	! %l5 = 000000000000009a

p0_label_121:
!	Starting 10 instruction Store Burst
!	%f2  = 00000000, Mem[00000000300c1410] = 03ffffff
	sta	%f2 ,[%i3+%o5]0x81	! Mem[00000000300c1410] = 00000000
!	Code Fragment 3, seed = 173831
p0_fragment_11:
!	%l0 = 00000000000000cd
	setx	0xe176d55b4b7af6ee,%g7,%l0 ! %l0 = e176d55b4b7af6ee
!	%l1 = 00000000cd000000
	setx	0x906e70fb47069099,%g7,%l1 ! %l1 = 906e70fb47069099
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = e176d55b4b7af6ee
	setx	0x1ab3b6ea08009654,%g7,%l0 ! %l0 = 1ab3b6ea08009654
!	%l1 = 906e70fb47069099
	setx	0xefdfd16c049a8b1f,%g7,%l1 ! %l1 = efdfd16c049a8b1f
p0_fragment_11_end:
!	Mem[0000000010101413] = ffff0000, %l5 = 000000000000009a
	ldstuba	[%i4+0x013]%asi,%l5	! %l5 = 0000000000000000
!	%l0 = 1ab3b6ea08009654, immd = fffff620, %y  = 000000ff
	udiv	%l0,-0x9e0,%l4		! %l4 = 00000000000000ff
	mov	%l0,%y			! %y = 08009654
!	%l3 = 00000000e4bdffff, Mem[0000000010141428] = 28ae00547518ef57
	stx	%l3,[%i5+0x028]		! Mem[0000000010141428] = 00000000e4bdffff
!	%l0 = 1ab3b6ea08009654, Mem[0000000010181404] = 25c8dd22
	stw	%l0,[%i6+0x004]		! Mem[0000000010181404] = 08009654
!	Mem[0000000030041410] = 9a000000, %l3 = 00000000e4bdffff
	swapa	[%i1+%o5]0x81,%l3	! %l3 = 000000009a000000
!	Mem[0000000030041408] = 00000027, %l5 = 0000000000000000
	ldstuba	[%i1+%o4]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000030041400] = 22ddc825, %l7 = 0000000000000000
	ldstuba	[%i1+%g0]0x81,%l7	! %l7 = 0000000000000022
!	%l5 = 0000000000000000, Mem[0000000030101408] = ffff0000000000ff
	stxa	%l5,[%i4+%o4]0x89	! Mem[0000000030101408] = 0000000000000000

p0_label_122:
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = 00000000 00000000, %l2 = 00000000, %l3 = 9a000000
	ldda	[%i2+%o4]0x89,%l2	! %l2 = 0000000000000000 0000000000000000
!	Mem[00000000300c1410] = 00000000 00000027, %l2 = 00000000, %l3 = 00000000
	ldda	[%i3+%o5]0x81,%l2	! %l2 = 0000000000000000 0000000000000027
!	Mem[0000000010181410] = 0000000092e92444, %l6 = 0000000000001fff
	ldxa	[%i6+%o5]0x80,%l6	! %l6 = 0000000092e92444
!	Mem[0000000030001408] = ffff000000000000, %f16 = 00000000 9689f254
	ldda	[%i0+%o4]0x89,%f16	! %f16 = ffff0000 00000000
!	Mem[00000000100c1408] = ffff0000, %l0 = 1ab3b6ea08009654
	lduba	[%i3+%o4]0x80,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030181410] = 3de296ff769c780d, %f10 = ff000000 00000000
	ldda	[%i6+%o5]0x89,%f10	! %f10 = 3de296ff 769c780d
!	Mem[0000000030181410] = 769c780d, %l4 = 00000000000000ff
	lduba	[%i6+%o5]0x89,%l4	! %l4 = 000000000000000d
!	Mem[0000000030001408] = 00000000, %l4 = 000000000000000d
	lduba	[%i0+%o4]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000030101400] = 7fffffff54f28996, %l5 = 0000000000000000
	ldxa	[%i4+%g0]0x89,%l5	! %l5 = 7fffffff54f28996
!	Mem[0000000010081400] = ffe06d41, %l3 = 0000000000000027
	lduha	[%i2+%g0]0x80,%l3	! %l3 = 000000000000ffe0

p0_label_123:
!	Starting 10 instruction Store Burst
!	%l6 = 0000000092e92444, Mem[0000000010141408] = 3de29600
	stha	%l6,[%i5+%o4]0x88	! Mem[0000000010141408] = 3de22444
!	Mem[00000000100c1400] = 7072780d, %l1 = 00000000049a8b1f
	swapa	[%i3+%g0]0x80,%l1	! %l1 = 000000007072780d
!	%f17 = 00000000, Mem[0000000030141410] = 00000000
	sta	%f17,[%i5+%o5]0x81	! Mem[0000000030141410] = 00000000
!	%l0 = 00000000000000ff, Mem[0000000030181400] = 00000000
	stba	%l0,[%i6+%g0]0x81	! Mem[0000000030181400] = ff000000
!	%f8  = 4abcde28 333dec99, Mem[0000000010141408] = 4424e23d 76ff780d
	stda	%f8 ,[%i5+%o4]0x80	! Mem[0000000010141408] = 4abcde28 333dec99
!	%l2 = 00000000, %l3 = 0000ffe0, Mem[0000000010041400] = 27000000 00000000
	stda	%l2,[%i1+%g0]0x80	! Mem[0000000010041400] = 00000000 0000ffe0
!	Mem[0000000010041420] = ffffffff, %l2 = 0000000000000000
	swap	[%i1+0x020],%l2		! %l2 = 00000000ffffffff
!	Mem[00000000100c1408] = ffff000014dcfff5, %l7 = 0000000000000022, %l1 = 000000007072780d
	add	%i3,0x08,%g1
	casxa	[%g1]0x80,%l7,%l1	! %l1 = ffff000014dcfff5
!	%l1 = ffff000014dcfff5, Mem[0000000030181400] = 000000ff
	stwa	%l1,[%i6+%g0]0x89	! Mem[0000000030181400] = 14dcfff5
!	%l1 = ffff000014dcfff5, Mem[0000000010101400] = ffffff7f
	stwa	%l1,[%i4+%g0]0x88	! Mem[0000000010101400] = 14dcfff5

p0_label_124:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001410] = ffffffff, %l3 = 000000000000ffe0
	lduba	[%i0+%o5]0x80,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030041408] = ff000027, %l3 = 00000000000000ff
	lduwa	[%i1+%o4]0x81,%l3	! %l3 = 00000000ff000027
!	Mem[0000000030101410] = 4000ffff00000406, %l0 = 00000000000000ff
	ldxa	[%i4+%o5]0x89,%l0	! %l0 = 4000ffff00000406
!	Mem[0000000030081410] = 00000000, %l1 = ffff000014dcfff5
	lduha	[%i2+%o5]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000010001400] = 00000000, %l6 = 0000000092e92444
	ldsba	[%i0+%g0]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000010001408] = ffffffff, %f18 = ffff0000
	lda	[%i0+%o4]0x88,%f18	! %f18 = ffffffff
!	Mem[000000001000141e] = 7fec95f3, %l1 = 0000000000000000
	ldsb	[%i0+0x01e],%l1		! %l1 = ffffffffffffff95
!	Mem[0000000030101408] = 00000000, %l7 = 0000000000000022
	lduba	[%i4+%o4]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000030081408] = 00000000 00000000, %l2 = ffffffff, %l3 = ff000027
	ldda	[%i2+%o4]0x81,%l2	! %l2 = 0000000000000000 0000000000000000
!	Mem[0000000010001408] = ffffffff ffffffff, %l2 = 00000000, %l3 = 00000000
	ldda	[%i0+%o4]0x88,%l2	! %l2 = 00000000ffffffff 00000000ffffffff

p0_label_125:
!	Starting 10 instruction Store Burst
!	Mem[0000000010181400] = 00000000, %l4 = 0000000000000000
	swapa	[%i6+%g0]0x88,%l4	! %l4 = 0000000000000000
!	%l7 = 0000000000000000, Mem[0000000010041408] = 00000000
	stwa	%l7,[%i1+%o4]0x88	! Mem[0000000010041408] = 00000000
!	%l2 = ffffffff, %l3 = ffffffff, Mem[0000000010101400] = 14dcfff5 0bc8a849
	stda	%l2,[%i4+%g0]0x88	! Mem[0000000010101400] = ffffffff ffffffff
!	%l1 = ffffffffffffff95, Mem[00000000100c1438] = 79600066
	stb	%l1,[%i3+0x038]		! Mem[00000000100c1438] = 95600066
!	Mem[0000000030141400] = 0d78ffff, %l2 = 00000000ffffffff
	swapa	[%i5+%g0]0x89,%l2	! %l2 = 000000000d78ffff
!	Mem[0000000010081400] = 416de0ff, %l4 = 0000000000000000
	ldstuba	[%i2+%g0]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010041400] = 00000000, %l3 = 00000000ffffffff
	ldstuba	[%i1+%g0]0x80,%l3	! %l3 = 0000000000000000
!	%f10 = 3de296ff, Mem[0000000010001408] = ffffffff
	sta	%f10,[%i0+%o4]0x88	! Mem[0000000010001408] = 3de296ff
!	%l0 = 4000ffff00000406, immd = 000002a9, %y  = 08009654
	smul	%l0,0x2a9,%l6		! %l6 = 00000000000ab3f6, %y = 00000000
!	%l2 = 000000000d78ffff, Mem[0000000030141410] = 00000000
	stba	%l2,[%i5+%o5]0x81	! Mem[0000000030141410] = ff000000

p0_label_126:
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = ffff7fb0, %l4 = 00000000000000ff, %asi = 80
	ldsba	[%o2+0x000]%asi,%l4	! %l4 = ffffffffffffffff
!	Mem[00000000100c1400] = 049a8b1f, %l6 = 00000000000ab3f6
	lduha	[%i3+%g0]0x80,%l6	! %l6 = 000000000000049a
!	Mem[0000000030041410] = ffffbde4, %l3 = 0000000000000000
	lduba	[%i1+%o5]0x89,%l3	! %l3 = 00000000000000e4
!	Mem[0000000010001430] = 00000000 00000070, %l6 = 0000049a, %l7 = 00000000, %asi = 80
	ldda	[%i0+0x030]%asi,%l6	! %l6 = 0000000000000000 0000000000000070
!	Mem[0000000030001400] = f0cbffff, %l4 = ffffffffffffffff
	ldswa	[%i0+%g0]0x89,%l4	! %l4 = fffffffff0cbffff
!	Mem[00000000100c1408] = 0000ffff, %f10 = 3de296ff
	lda	[%i3+%o4]0x88,%f10	! %f10 = 0000ffff
!	Mem[0000000030141400] = ffffffff, %l6 = 0000000000000000
	lduba	[%i5+%g0]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010041438] = 00ff2242, %l4 = fffffffff0cbffff
	ldsw	[%i1+0x038],%l4		! %l4 = 0000000000ff2242
!	Mem[0000000030081408] = 0000000000000000, %l5 = 7fffffff54f28996
	ldxa	[%i2+%o4]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000010081408] = ffffffff, %l5 = 0000000000000000
	ldsha	[%i2+%o4]0x88,%l5	! %l5 = ffffffffffffffff

p0_label_127:
!	Starting 10 instruction Store Burst
!	%l6 = 00000000000000ff, Mem[0000000010081420] = 4abcde28ff3d8999
	stx	%l6,[%i2+0x020]		! Mem[0000000010081420] = 00000000000000ff
!	%l6 = 00000000000000ff, Mem[0000000010001410] = ffffffff
	stha	%l6,[%i0+%o5]0x80	! Mem[0000000010001410] = 00ffffff
!	Mem[00000000300c1400] = ff9c780d 3de296a9 00000000 00000000
!	%f0  = 00000000 25c8dd22 00000000 00000027
!	%f4  = 00000000 0000009a 00000000 0000ffff
!	%f8  = 4abcde28 333dec99 0000ffff 769c780d
!	%f12 = 0d789c76 3de29600 21d58c72 3dd76b7b
	stda	%f0 ,[%i3+%g0]ASI_COMMIT_S	! Block Store to 00000000300c1400
!	Mem[0000000010141415] = 00000057, %l4 = 0000000000ff2242
	ldstuba	[%i5+0x015]%asi,%l4	! %l4 = 0000000000000000
!	%l7 = 0000000000000070, Mem[0000000010081400] = 00040000416de0ff
	stxa	%l7,[%i2+%g0]0x88	! Mem[0000000010081400] = 0000000000000070
!	Mem[0000000030001400] = ffffcbf0, %l5 = 00000000ffffffff
	swapa	[%i0+%g0]0x81,%l5	! %l5 = 00000000ffffcbf0
!	Randomly selected nop
	nop
!	Mem[0000000010141410] = 2346e6e7, %l6 = 00000000000000ff
	swapa	[%i5+%o5]0x80,%l6	! %l6 = 000000002346e6e7
!	Mem[0000000030141410] = 000000ff, %l0 = 4000ffff00000406
	ldstuba	[%i5+%o5]0x89,%l0	! %l0 = 00000000000000ff
!	%f20 = 00000000, Mem[0000000010081400] = 70000000
	st	%f20,[%i2+%g0]		! Mem[0000000010081400] = 00000000

p0_label_128:
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (24)
!	Mem[00000000100c1410] = ff00009a00000000, %l3 = 00000000000000e4
	ldxa	[%i3+%o5]0x80,%l3	! %l3 = ff00009a00000000
!	%l4 = 0000000000000000, immd = 00000baa, %y  = 00000000
	umul	%l4,0xbaa,%l0		! %l0 = 0000000000000000, %y = 00000000
!	Mem[0000000010001400] = 00000000, %l0 = 0000000000000000
	ldswa	[%i0+%g0]0x88,%l0	! %l0 = 0000000000000000
!	%f30 = 0d789c76 447d3b71, Mem[0000000030101408] = 00000000 00000000
	stda	%f30,[%i4+%o4]0x89	! Mem[0000000030101408] = 0d789c76 447d3b71
!	Mem[00000000211c0000] = ffff7fb0, %l3 = ff00009a00000000, %asi = 80
	lduha	[%o2+0x000]%asi,%l3	! %l3 = 000000000000ffff
!	Mem[00000000300c1410] = 00000000, %f24 = 80000000
	lda	[%i3+%o5]0x89,%f24	! %f24 = 00000000
!	Mem[0000000010081410] = 03000000, %l1 = ffffffffffffff95
	lduha	[%i2+%o5]0x80,%l1	! %l1 = 0000000000000300
!	Mem[0000000030041400] = 25c8ddff, %l3 = 000000000000ffff
	lduwa	[%i1+%g0]0x89,%l3	! %l3 = 0000000025c8ddff
!	Mem[0000000010181410] = 4424e992 00000000, %l2 = 0d78ffff, %l3 = 25c8ddff
	ldda	[%i6+%o5]0x88,%l2	! %l2 = 0000000000000000 000000004424e992
!	Mem[00000000300c1408] = 00000000, %l0 = 0000000000000000
	lduwa	[%i3+%o4]0x81,%l0	! %l0 = 0000000000000000

p0_label_129:
!	Starting 10 instruction Store Burst
!	%l7 = 0000000000000070, Mem[0000000010001408] = 3de296ff
	stwa	%l7,[%i0+%o4]0x88	! Mem[0000000010001408] = 00000070
!	%f22 = ff0d0040, Mem[0000000030101410] = 00000406
	sta	%f22,[%i4+%o5]0x89	! Mem[0000000030101410] = ff0d0040
!	Mem[0000000010141400] = 00000000, %l6 = 000000002346e6e7, %asi = 80
	swapa	[%i5+0x000]%asi,%l6	! %l6 = 0000000000000000
!	Mem[0000000030181400] = f5ffdc14, %l4 = 0000000000000000
	swapa	[%i6+%g0]0x81,%l4	! %l4 = 00000000f5ffdc14
!	%f26 = 00000000, Mem[0000000010181410] = 00000000
	sta	%f26,[%i6+%o5]0x88	! Mem[0000000010181410] = 00000000
!	%l6 = 0000000000000000, %l1 = 0000000000000300, %l2 = 0000000000000000
	udivx	%l6,%l1,%l2		! %l2 = 0000000000000000
!	Mem[0000000030101410] = 40000dff, %l2 = 0000000000000000
	ldstuba	[%i4+%o5]0x81,%l2	! %l2 = 0000000000000040
!	Mem[0000000010041435] = 17dbffe5, %l6 = 0000000000000000
	ldstuba	[%i1+0x035]%asi,%l6	! %l6 = 00000000000000db
!	%l1 = 0000000000000300, Mem[00000000300c1410] = 00000000
	stba	%l1,[%i3+%o5]0x81	! Mem[00000000300c1410] = 00000000
!	Mem[0000000030001410] = 333dec99, %l5 = 00000000ffffcbf0
	ldstuba	[%i0+%o5]0x89,%l5	! %l5 = 0000000000000099

p0_label_130:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = ffffffff, %l3 = 000000004424e992
	ldsha	[%i2+%o4]0x80,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000030181410] = 0d789c76, %l3 = ffffffffffffffff
	lduba	[%i6+%o5]0x81,%l3	! %l3 = 000000000000000d
!	Mem[0000000030041408] = 270000ff, %f24 = 00000000
	lda	[%i1+%o4]0x89,%f24	! %f24 = 270000ff
!	Mem[0000000030041400] = 25c8ddff, %l7 = 0000000000000070
	ldswa	[%i1+%g0]0x89,%l7	! %l7 = 0000000025c8ddff
!	Mem[0000000030081400] = 0096e23d, %l3 = 000000000000000d
	ldsba	[%i2+%g0]0x89,%l3	! %l3 = 000000000000003d
!	Mem[0000000030001410] = ffec3d3328debc4a, %f6  = 00000000 0000ffff
	ldda	[%i0+%o5]0x81,%f6 	! %f6  = ffec3d33 28debc4a
!	Mem[0000000010141410] = 000000ff, %l6 = 00000000000000db
	ldsha	[%i5+%o5]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000010181400] = 00000000, %f5  = 0000009a
	lda	[%i6+%g0]0x88,%f5 	! %f5 = 00000000
!	Mem[00000000300c1408] = 2700000000000000, %f10 = 0000ffff 769c780d
	ldda	[%i3+%o4]0x89,%f10	! %f10 = 27000000 00000000
!	Mem[0000000010041400] = e0ff0000 000000ff, %l4 = f5ffdc14, %l5 = 00000099
	ldda	[%i1+%g0]0x88,%l4	! %l4 = 00000000000000ff 00000000e0ff0000

p0_label_131:
!	Starting 10 instruction Store Burst
!	%l0 = 0000000000000000, Mem[0000000030141410] = 89ce5911000000ff
	stxa	%l0,[%i5+%o5]0x89	! Mem[0000000030141410] = 0000000000000000
!	%l7 = 0000000025c8ddff, Mem[0000000030181400] = 00000000
	stha	%l7,[%i6+%g0]0x89	! Mem[0000000030181400] = 0000ddff
!	%l3 = 000000000000003d, Mem[0000000030081408] = 00000000
	stwa	%l3,[%i2+%o4]0x89	! Mem[0000000030081408] = 0000003d
!	Mem[0000000030181410] = 769c780d, %l2 = 0000000000000040
	swapa	[%i6+%o5]0x89,%l2	! %l2 = 00000000769c780d
!	Mem[0000000010101410] = ffff00ff, %l3 = 000000000000003d
	swapa	[%i4+%o5]0x80,%l3	! %l3 = 00000000ffff00ff
!	%f2  = 00000000 00000027, Mem[0000000010101410] = 0000003d ffffffff
	stda	%f2 ,[%i4+%o5]0x80	! Mem[0000000010101410] = 00000000 00000027
!	%l2 = 00000000769c780d, Mem[00000000201c0000] = ff002520
	stb	%l2,[%o0+%g0]		! Mem[00000000201c0000] = 0d002520
!	%f28 = 3340b281 9f12f940, %l0 = 0000000000000000
!	Mem[0000000030181430] = 4abbd5f42369b5b5
	add	%i6,0x030,%g1
	stda	%f28,[%g1+%l0]ASI_PST8_S ! Mem[0000000030181430] = 4abbd5f42369b5b5
!	%f3  = 00000027, Mem[0000000010081410] = 03000000
	st	%f3 ,[%i2+%o5]		! Mem[0000000010081410] = 00000027
!	%l7 = 0000000025c8ddff, Mem[0000000010181410] = 00000000
	stba	%l7,[%i6+%o5]0x80	! Mem[0000000010181410] = ff000000

p0_label_132:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001400] = ffffbde400000000, %l5 = 00000000e0ff0000
	ldxa	[%i0+%g0]0x88,%l5	! %l5 = ffffbde400000000
	membar	#Sync			! Added by membar checker (25)
!	Mem[0000000010001400] = 00000000 e4bdffff 70000000 ffffffff
!	Mem[0000000010001410] = 00ffffff 00ffffff 7e0e314a 7fec95f3
!	Mem[0000000010001420] = 77ff0000 00000027 00000000 00000066
!	Mem[0000000010001430] = 00000000 00000070 25c8dd22 6edccca1
	ldda	[%i0+%g0]ASI_BLK_AIUP,%f16	! Block Load from 0000000010001400
!	Mem[00000000300c1410] = 00000000, %l1 = 0000000000000300
	lduha	[%i3+%o5]0x89,%l1	! %l1 = 0000000000000000
!	Mem[00000000300c1408] = 27000000 00000000, %l0 = 00000000, %l1 = 00000000
	ldda	[%i3+%o4]0x89,%l0	! %l0 = 0000000000000000 0000000027000000
!	Mem[0000000010181410] = ff000000 92e92444, %l6 = 00000000, %l7 = 25c8ddff
	ldda	[%i6+%o5]0x80,%l6	! %l6 = 00000000ff000000 0000000092e92444
!	Mem[0000000030081408] = 3d000000, %l0 = 0000000000000000
	ldsba	[%i2+%o4]0x81,%l0	! %l0 = 000000000000003d
!	Mem[0000000010141410] = 5700ff00ff000000, %f10 = 27000000 00000000
	ldda	[%i5+%o5]0x88,%f10	! %f10 = 5700ff00 ff000000
!	Mem[0000000010001410] = 00ffffff00ffffff, %f12 = 0d789c76 3de29600
	ldda	[%i0+%o5]0x80,%f12	! %f12 = 00ffffff 00ffffff
!	Mem[0000000010081408] = ffffffff 04724124, %l0 = 0000003d, %l1 = 27000000
	ldda	[%i2+%o4]0x80,%l0	! %l0 = 00000000ffffffff 0000000004724124
!	Mem[0000000010001410] = 00ffffff, %l0 = 00000000ffffffff
	lduha	[%i0+%o5]0x80,%l0	! %l0 = 00000000000000ff

p0_label_133:
!	Starting 10 instruction Store Burst
!	Mem[0000000010141408] = 4abcde28, %l3 = 00000000ffff00ff
	swapa	[%i5+%o4]0x80,%l3	! %l3 = 000000004abcde28
!	%l5 = ffffbde400000000, Mem[0000000030001410] = 4abcde28333decff
	stxa	%l5,[%i0+%o5]0x89	! Mem[0000000030001410] = ffffbde400000000
!	%l3 = 000000004abcde28, Mem[0000000010041408] = 00000000
	stha	%l3,[%i1+%o4]0x80	! Mem[0000000010041408] = de280000
!	Mem[0000000010101418] = 000000ff, %l2 = 00000000769c780d
	swap	[%i4+0x018],%l2		! %l2 = 00000000000000ff
!	%f23 = 7fec95f3, Mem[0000000030141408] = 0000009a
	sta	%f23,[%i5+%o4]0x89	! Mem[0000000030141408] = 7fec95f3
!	%l2 = 00000000000000ff, Mem[0000000030081410] = 0604000000000000
	stxa	%l2,[%i2+%o5]0x89	! Mem[0000000030081410] = 00000000000000ff
!	Mem[00000000100c1400] = 049a8b1f, %l1 = 0000000004724124
	ldstuba	[%i3+%g0]0x80,%l1	! %l1 = 0000000000000004
!	%l0 = 00000000000000ff, Mem[00000000300c1408] = 00000000
	stwa	%l0,[%i3+%o4]0x89	! Mem[00000000300c1408] = 000000ff
!	%l7 = 0000000092e92444, Mem[0000000010041400] = ff000000
	stha	%l7,[%i1+%g0]0x80	! Mem[0000000010041400] = 24440000
!	%l5 = ffffbde400000000, Mem[0000000010141400] = 00000000e7e64623
	stxa	%l5,[%i5+%g0]0x88	! Mem[0000000010141400] = ffffbde400000000

p0_label_134:
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = ffff7fb0, %l7 = 0000000092e92444, %asi = 80
	ldsha	[%o2+0x000]%asi,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000030081408] = 3d000000, %f4  = 00000000
	lda	[%i2+%o4]0x81,%f4 	! %f4 = 3d000000
!	Mem[0000000010181408] = 9a000000, %l2 = 00000000000000ff
	lduha	[%i6+%o4]0x80,%l2	! %l2 = 0000000000009a00
!	Mem[0000000030041408] = 270000ff, %l1 = 0000000000000004
	lduba	[%i1+%o4]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010081434] = 447d3b71, %l4 = 00000000000000ff, %asi = 80
	ldsha	[%i2+0x034]%asi,%l4	! %l4 = 000000000000447d
!	Mem[0000000010181400] = 00000000, %f7  = 28debc4a
	lda	[%i6+%g0]0x88,%f7 	! %f7 = 00000000
!	Mem[0000000010141400] = 00000000, %l3 = 000000004abcde28
	lduha	[%i5+%g0]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000020800000] = 00ffc750, %l7 = ffffffffffffffff
	ldsh	[%o1+%g0],%l7		! %l7 = 00000000000000ff
!	Mem[0000000010181400] = 00000000, %l0 = 00000000000000ff
	ldswa	[%i6+%g0]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000030001408] = 00000000, %l5 = ffffbde400000000
	lduwa	[%i0+%o4]0x81,%l5	! %l5 = 0000000000000000

p0_label_135:
!	Starting 10 instruction Store Burst
!	%l3 = 0000000000000000, Mem[00000000300c1408] = ff000000
	stwa	%l3,[%i3+%o4]0x81	! Mem[00000000300c1408] = 00000000
!	%f24 = 77ff0000, Mem[000000001018140c] = 00000000
	sta	%f24,[%i6+0x00c]%asi	! Mem[000000001018140c] = 77ff0000
!	%f4  = 3d000000 00000000, Mem[0000000030101400] = 54f28996 7fffffff
	stda	%f4 ,[%i4+%g0]0x89	! Mem[0000000030101400] = 3d000000 00000000
!	Mem[0000000010081410] = 00000027, %l3 = 0000000000000000
	ldstuba	[%i2+%o5]0x80,%l3	! %l3 = 0000000000000000
!	%f28 = 00000000 00000070, %l2 = 0000000000009a00
!	Mem[0000000030101410] = ff000dffffff0040
	add	%i4,0x010,%g1
	stda	%f28,[%g1+%l2]ASI_PST8_S ! Mem[0000000030101410] = ff000dffffff0040
!	Mem[000000001014141e] = 6b606e13, %l2 = 0000000000009a00
	ldstub	[%i5+0x01e],%l2		! %l2 = 000000000000006e
!	%l2 = 000000000000006e, Mem[0000000010141430] = 3b26cc640eff0c65, %asi = 80
	stxa	%l2,[%i5+0x030]%asi	! Mem[0000000010141430] = 000000000000006e
!	%l2 = 000000000000006e, Mem[00000000100c1424] = ffa9fd34, %asi = 80
	stha	%l2,[%i3+0x024]%asi	! Mem[00000000100c1424] = 006efd34
!	%f24 = 77ff0000 00000027, Mem[0000000010081408] = ffffffff 04724124
	stda	%f24,[%i2+%o4]0x80	! Mem[0000000010081408] = 77ff0000 00000027
!	Code Fragment 3, seed = 699201
p0_fragment_12:
!	%l0 = 0000000000000000
	setx	0x4454d14f1c562f1e,%g7,%l0 ! %l0 = 4454d14f1c562f1e
!	%l1 = 00000000000000ff
	setx	0x5191939bcb8411c9,%g7,%l1 ! %l1 = 5191939bcb8411c9
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 4454d14f1c562f1e
	setx	0x2b1a455b53021084,%g7,%l0 ! %l0 = 2b1a455b53021084
!	%l1 = 5191939bcb8411c9
	setx	0x0176e7389912ae4f,%g7,%l1 ! %l1 = 0176e7389912ae4f
p0_fragment_12_end:

p0_label_136:
!	Starting 10 instruction Load Burst
!	Mem[0000000030101410] = ff000dff, %l4 = 000000000000447d
	ldsba	[%i4+%o5]0x81,%l4	! %l4 = ffffffffffffffff
!	%l1 = 0176e7389912ae4f, Mem[0000000030181408] = ff1f7727
	stwa	%l1,[%i6+%o4]0x81	! Mem[0000000030181408] = 9912ae4f
!	Mem[0000000021800040] = 0cef2810, %l7 = 00000000000000ff, %asi = 80
	lduha	[%o3+0x040]%asi,%l7	! %l7 = 0000000000000cef
!	Mem[00000000100c1410] = 9a0000ff, %f2  = 00000000
	lda	[%i3+%o5]0x88,%f2 	! %f2 = 9a0000ff
!	Mem[0000000030181400] = ffdd0000ffffffdf, %f8  = 4abcde28 333dec99
	ldda	[%i6+%g0]0x81,%f8 	! %f8  = ffdd0000 ffffffdf
!	Mem[0000000010101420] = 6c1ca198, %l4 = ffffffffffffffff, %asi = 80
	lduwa	[%i4+0x020]%asi,%l4	! %l4 = 000000006c1ca198
!	Mem[00000000100c1404] = 6242bf40, %f17 = e4bdffff
	ld	[%i3+0x004],%f17	! %f17 = 6242bf40
!	%f28 = 00000000, %f31 = 6edccca1, %f4  = 3d000000
	fdivs	%f28,%f31,%f4 		! %f4  = 00000000
!	Mem[0000000010181408] = 0000ff77 0000009a, %l6 = ff000000, %l7 = 00000cef
	ldda	[%i6+%o4]0x88,%l6	! %l6 = 000000000000009a 000000000000ff77
!	Mem[000000001004140a] = de280000, %l5 = 0000000000000000, %asi = 80
	ldsba	[%i1+0x00a]%asi,%l5	! %l5 = 0000000000000000

p0_label_137:
!	Starting 10 instruction Store Burst
!	Mem[0000000010181400] = 00000000 08009654 9a000000 77ff0000
!	%f0  = 00000000 25c8dd22 9a0000ff 00000027
!	%f4  = 00000000 00000000 ffec3d33 00000000
!	%f8  = ffdd0000 ffffffdf 5700ff00 ff000000
!	%f12 = 00ffffff 00ffffff 21d58c72 3dd76b7b
	stda	%f0 ,[%i6+%g0]ASI_COMMIT_P	! Block Store to 0000000010181400
!	%l2 = 0000006e, %l3 = 00000000, Mem[0000000030001400] = ffffffff 40000000
	stda	%l2,[%i0+%g0]0x81	! Mem[0000000030001400] = 0000006e 00000000
!	%l0 = 2b1a455b53021084, Mem[0000000010081410] = ff000027, %asi = 80
	stwa	%l0,[%i2+0x010]%asi	! Mem[0000000010081410] = 53021084
!	%l0 = 2b1a455b53021084, Mem[00000000100c1410] = ff00009a00000000, %asi = 80
	stxa	%l0,[%i3+0x010]%asi	! Mem[00000000100c1410] = 2b1a455b53021084
!	%l3 = 0000000000000000, Mem[0000000010101408] = e6996adf
	stwa	%l3,[%i4+%o4]0x80	! Mem[0000000010101408] = 00000000
!	Mem[00000000100c1429] = fffffff5, %l5 = 0000000000000000
	ldstuba	[%i3+0x029]%asi,%l5	! %l5 = 00000000000000ff
!	%l5 = 00000000000000ff, Mem[0000000010101408] = 00000000
	stha	%l5,[%i4+%o4]0x80	! Mem[0000000010101408] = 00ff0000
!	Mem[0000000030101410] = ff000dff, %l0 = 0000000053021084
	swapa	[%i4+%o5]0x81,%l0	! %l0 = 00000000ff000dff
!	%f7  = 00000000, Mem[00000000100c1408] = ffff0000
	sta	%f7 ,[%i3+%o4]0x80	! Mem[00000000100c1408] = 00000000
!	Mem[00000000100c1400] = ff9a8b1f, %l7 = 000000000000ff77
	swap	[%i3+%g0],%l7		! %l7 = 00000000ff9a8b1f

p0_label_138:
!	Starting 10 instruction Load Burst
	membar	#Sync			! Added by membar checker (26)
!	Mem[0000000010181410] = 0000000000000000, %f20 = 00ffffff 00ffffff
	ldda	[%i6+%o5]0x88,%f20	! %f20 = 00000000 00000000
!	Mem[00000000300c1408] = 00000000, %f9  = ffffffdf
	lda	[%i3+%o4]0x81,%f9 	! %f9 = 00000000
!	Mem[0000000030081408] = 0000003d, %l7 = 00000000ff9a8b1f
	ldsha	[%i2+%o4]0x89,%l7	! %l7 = 000000000000003d
!	Mem[0000000010141410] = 5700ff00ff000000, %f14 = 21d58c72 3dd76b7b
	ldda	[%i5+%o5]0x88,%f14	! %f14 = 5700ff00 ff000000
!	Mem[0000000010181416] = 00000000, %l2 = 000000000000006e
	ldsh	[%i6+0x016],%l2		! %l2 = 0000000000000000
!	Mem[00000000300c1400] = 0000000025c8dd22, %f8  = ffdd0000 00000000
	ldda	[%i3+%g0]0x81,%f8 	! %f8  = 00000000 25c8dd22
!	Mem[00000000300c1400] = 00000000, %f7  = 00000000
	lda	[%i3+%g0]0x81,%f7 	! %f7 = 00000000
!	Mem[0000000010001414] = 00ffffff, %l6 = 000000000000009a, %asi = 80
	lduwa	[%i0+0x014]%asi,%l6	! %l6 = 0000000000ffffff
!	Mem[00000000211c0000] = ffff7fb0, %l6 = 0000000000ffffff, %asi = 80
	lduba	[%o2+0x000]%asi,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010181410] = 00000000, %l7 = 000000000000003d
	ldsba	[%i6+%o5]0x80,%l7	! %l7 = 0000000000000000

p0_label_139:
!	Starting 10 instruction Store Burst
!	%l4 = 000000006c1ca198, Mem[000000001010143e] = 6626ae93
	sth	%l4,[%i4+0x03e]		! Mem[000000001010143c] = 6626a198
!	%f2  = 9a0000ff 00000027, Mem[0000000010001400] = 00000000 e4bdffff
	stda	%f2 ,[%i0+%g0]0x80	! Mem[0000000010001400] = 9a0000ff 00000027
!	Mem[0000000030181400] = ffdd0000 ffffffdf 9912ae4f 00000000
!	%f16 = 00000000 6242bf40 70000000 ffffffff
!	%f20 = 00000000 00000000 7e0e314a 7fec95f3
!	%f24 = 77ff0000 00000027 00000000 00000066
!	%f28 = 00000000 00000070 25c8dd22 6edccca1
	stda	%f16,[%i6+%g0]ASI_BLK_S	! Block Store to 0000000030181400
	membar	#Sync			! Added by membar checker (27)
!	Mem[0000000030181410] = 00000000, %l6 = 00000000000000ff
	swapa	[%i6+%o5]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000010041438] = 00ff2242, %l0 = ff000dff, %l6 = 00000000
	add	%i1,0x38,%g1
	casa	[%g1]0x80,%l0,%l6	! %l6 = 0000000000ff2242
!	%f2  = 9a0000ff 00000027, Mem[0000000010001408] = 00000070 ffffffff
	stda	%f2 ,[%i0+%o4]0x88	! Mem[0000000010001408] = 9a0000ff 00000027
!	%l0 = 00000000ff000dff, Mem[0000000010041408] = de280000
	stwa	%l0,[%i1+%o4]0x80	! Mem[0000000010041408] = ff000dff
!	Mem[00000000300c1408] = 00000000, %l7 = 0000000000000000
	swapa	[%i3+%o4]0x89,%l7	! %l7 = 0000000000000000
!	%l7 = 0000000000000000, Mem[0000000010001410] = 00ffffff
	stha	%l7,[%i0+%o5]0x80	! Mem[0000000010001410] = 0000ffff
!	%l4 = 000000006c1ca198, Mem[0000000030041400] = ffddc82500000000
	stxa	%l4,[%i1+%g0]0x81	! Mem[0000000030041400] = 000000006c1ca198

p0_label_140:
!	Starting 10 instruction Load Burst
!	Mem[0000000020800040] = 51ffe580, %l4 = 000000006c1ca198
	ldsh	[%o1+0x040],%l4		! %l4 = 00000000000051ff
!	Mem[0000000010141400] = 00000000, %l4 = 00000000000051ff
	ldsba	[%i5+%g0]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000030101408] = 713b7d44, %l0 = 00000000ff000dff
	ldsba	[%i4+%o4]0x81,%l0	! %l0 = 0000000000000071
!	Mem[00000000100c1434] = ffffffff, %l4 = 0000000000000000
	ldub	[%i3+0x034],%l4		! %l4 = 00000000000000ff
!	Mem[0000000030081408] = 3d000000, %l6 = 0000000000ff2242
	swapa	[%i2+%o4]0x81,%l6	! %l6 = 000000003d000000
!	Mem[0000000010181420] = ffdd0000ffffffdf, %l2 = 0000000000000000
	ldx	[%i6+0x020],%l2		! %l2 = ffdd0000ffffffdf
!	Mem[0000000010101400] = ffffffff, %f10 = 5700ff00
	lda	[%i4+%g0]0x88,%f10	! %f10 = ffffffff
!	%f14 = 5700ff00 ff000000, Mem[0000000030041410] = e4bdffff 00000000
	stda	%f14,[%i1+%o5]0x81	! Mem[0000000030041410] = 5700ff00 ff000000
!	Mem[00000000100c1430] = ff0000ff ffffffff, %l6 = 3d000000, %l7 = 00000000, %asi = 80
	ldda	[%i3+0x030]%asi,%l6	! %l6 = 00000000ff0000ff 00000000ffffffff
!	Mem[00000000211c0000] = ffff7fb0, %l5 = 00000000000000ff, %asi = 80
	lduha	[%o2+0x000]%asi,%l5	! %l5 = 000000000000ffff

p0_label_141:
!	Starting 10 instruction Store Burst
!	%l0 = 0000000000000071, Mem[0000000010001408] = 27000000
	stw	%l0,[%i0+%o4]		! Mem[0000000010001408] = 00000071
!	Mem[00000000218000c1] = ff85c070, %l6 = 00000000ff0000ff
	ldstub	[%o3+0x0c1],%l6		! %l6 = 0000000000000085
!	Mem[0000000010041432] = 31f302e4, %l4 = 00000000000000ff
	ldstuba	[%i1+0x032]%asi,%l4	! %l4 = 0000000000000002
!	%l2 = ffffffdf, %l3 = 00000000, Mem[0000000010181408] = 9a0000ff 00000027
	stda	%l2,[%i6+%o4]0x80	! Mem[0000000010181408] = ffffffdf 00000000
!	%l0 = 0000000000000071, Mem[0000000030101410] = 84100253
	stwa	%l0,[%i4+%o5]0x89	! Mem[0000000030101410] = 00000071
!	%f28 = 00000000 00000070, Mem[0000000030001408] = 00000000 ffff0000
	stda	%f28,[%i0+%o4]0x89	! Mem[0000000030001408] = 00000000 00000070
!	Mem[00000000100c1418] = 00000035, %l2 = ffdd0000ffffffdf
	ldstuba	[%i3+0x018]%asi,%l2	! %l2 = 0000000000000000
!	%l2 = 0000000000000000, Mem[0000000030181410] = 000000ff
	stba	%l2,[%i6+%o5]0x89	! Mem[0000000030181410] = 00000000
!	%l0 = 0000000000000071, Mem[00000000100c1408] = 00000000
	stha	%l0,[%i3+%o4]0x88	! Mem[00000000100c1408] = 00000071
!	Mem[0000000010041410] = 9a000000, %l3 = 0000000000000000
	swapa	[%i1+%o5]0x88,%l3	! %l3 = 000000009a000000

p0_label_142:
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = 00ff2242, %f5  = 00000000
	lda	[%i2+%o4]0x81,%f5 	! %f5 = 00ff2242
!	Mem[000000001008143e] = 9689f254, %l2 = 0000000000000000, %asi = 80
	lduha	[%i2+0x03e]%asi,%l2	! %l2 = 000000000000f254
!	Mem[0000000010041410] = 00000000, %l4 = 0000000000000002
	lduha	[%i1+%o5]0x88,%l4	! %l4 = 0000000000000000
!	Mem[000000001018143d] = 3dd76b7b, %l5 = 000000000000ffff
	ldub	[%i6+0x03d],%l5		! %l5 = 00000000000000d7
!	Mem[0000000030041408] = 270000ff, %f10 = ffffffff
	lda	[%i1+%o4]0x89,%f10	! %f10 = 270000ff
!	Mem[00000000100c1408] = 00000071, %l6 = 0000000000000085
	lduwa	[%i3+%o4]0x88,%l6	! %l6 = 0000000000000071
!	Mem[00000000211c0000] = ffff7fb0, %l3 = 000000009a000000
	ldsh	[%o2+%g0],%l3		! %l3 = ffffffffffffffff
!	%f20 = 00000000, %f10 = 270000ff, %f31 = 6edccca1
	fmuls	%f20,%f10,%f31		! %f31 = 00000000
!	%f16 = 00000000, %f6  = ffec3d33, %f6  = ffec3d33 00000000
	fsmuld	%f16,%f6 ,%f6 		! %f6  = fffd87a6 60000000
!	Mem[0000000010041408] = ff000dff, %l5 = 00000000000000d7, %asi = 80
	lduwa	[%i1+0x008]%asi,%l5	! %l5 = 00000000ff000dff

p0_label_143:
!	Starting 10 instruction Store Burst
!	Mem[0000000010141410] = 000000ff, %l5 = 00000000ff000dff
	swapa	[%i5+%o5]0x80,%l5	! %l5 = 00000000000000ff
!	Mem[00000000211c0000] = ffff7fb0, %l6 = 0000000000000071
	ldstuba	[%o2+0x000]%asi,%l6	! %l6 = 00000000000000ff
!	%l6 = 00000000000000ff, Mem[00000000300c1400] = 22ddc82500000000
	stxa	%l6,[%i3+%g0]0x89	! Mem[00000000300c1400] = 00000000000000ff
!	Mem[0000000010141420] = 5dffcdf8, %l1 = 9912ae4f, %l7 = ffffffff
	add	%i5,0x20,%g1
	casa	[%g1]0x80,%l1,%l7	! %l7 = 000000005dffcdf8
!	%l7 = 000000005dffcdf8, Mem[0000000030081410] = ff000000
	stba	%l7,[%i2+%o5]0x81	! Mem[0000000030081410] = f8000000
!	Mem[0000000010001408] = 71000000, %l1 = 000000009912ae4f
	swapa	[%i0+%o4]0x88,%l1	! %l1 = 0000000071000000
!	Mem[0000000010041408] = ff000dff, %l0 = 0000000000000071
	ldstuba	[%i1+%o4]0x80,%l0	! %l0 = 00000000000000ff
!	%l4 = 0000000000000000, Mem[0000000010181410] = 0000000000000000
	stxa	%l4,[%i6+%o5]0x80	! Mem[0000000010181410] = 0000000000000000
!	%l2 = 000000000000f254, Mem[0000000030041408] = 270000ff
	stha	%l2,[%i1+%o4]0x89	! Mem[0000000030041408] = 2700f254
!	Mem[0000000010141408] = ffff00ff, %l2 = 000000000000f254
	ldstuba	[%i5+%o4]0x80,%l2	! %l2 = 00000000000000ff

p0_label_144:
!	Starting 10 instruction Load Burst
!	Code Fragment 3, seed = 379277
p0_fragment_13:
!	%l0 = 00000000000000ff
	setx	0xe5ca60fad7e948be,%g7,%l0 ! %l0 = e5ca60fad7e948be
!	%l1 = 0000000071000000
	setx	0x940c4ad083e47969,%g7,%l1 ! %l1 = 940c4ad083e47969
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = e5ca60fad7e948be
	setx	0x844eff2273466624,%g7,%l0 ! %l0 = 844eff2273466624
!	%l1 = 940c4ad083e47969
	setx	0xbe675d0e5d0f91ef,%g7,%l1 ! %l1 = be675d0e5d0f91ef
p0_fragment_13_end:
!	Mem[0000000010041400] = e0ff000000004424, %f28 = 00000000 00000070
	ldda	[%i1+%g0]0x88,%f28	! %f28 = e0ff0000 00004424
!	%f18 = 70000000 ffffffff, Mem[0000000010101400] = ffffffff ffffffff
	stda	%f18,[%i4+%g0]0x80	! Mem[0000000010101400] = 70000000 ffffffff
!	Mem[0000000010141400] = ffffbde400000000, %l5 = 00000000000000ff
	ldxa	[%i5+%g0]0x88,%l5	! %l5 = ffffbde400000000
!	Mem[0000000010141408] = ff00ffff, %l6 = 00000000000000ff
	lduwa	[%i5+%o4]0x88,%l6	! %l6 = 00000000ff00ffff
!	Mem[00000000211c0000] = ffff7fb0, %l5 = ffffbde400000000
	lduh	[%o2+%g0],%l5		! %l5 = 000000000000ffff
!	Mem[00000000100c1400] = 77ff0000, %l5 = 000000000000ffff
	ldsba	[%i3+%g0]0x88,%l5	! %l5 = 0000000000000000
!	%l1 = be675d0e5d0f91ef, imm = 0000000000000dc3, %l4 = 0000000000000000
	or	%l1,0xdc3,%l4		! %l4 = be675d0e5d0f9def
!	Mem[0000000010001408] = 4fae1299, %l3 = ffffffffffffffff
	ldswa	[%i0+%o4]0x80,%l3	! %l3 = 000000004fae1299
!	Mem[000000001014142c] = e4bdffff, %l2 = 00000000000000ff, %asi = 80
	ldsba	[%i5+0x02c]%asi,%l2	! %l2 = ffffffffffffffe4

p0_label_145:
!	Starting 10 instruction Store Burst
!	%l0 = 73466624, %l1 = 5d0f91ef, Mem[0000000030181400] = 00000000 6242bf40
	stda	%l0,[%i6+%g0]0x81	! Mem[0000000030181400] = 73466624 5d0f91ef
!	Mem[0000000030101400] = 00000000, %l6 = 00000000ff00ffff
	ldstuba	[%i4+%g0]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000030041408] = 54f20027, %l5 = 0000000000000000
	swapa	[%i1+%o4]0x81,%l5	! %l5 = 0000000054f20027
!	Mem[0000000010141400] = 00000000, %l1 = 000000005d0f91ef
	swapa	[%i5+%g0]0x80,%l1	! %l1 = 0000000000000000
!	%f26 = 00000000, Mem[0000000030141400] = ffffffff
	sta	%f26,[%i5+%g0]0x89	! Mem[0000000030141400] = 00000000
!	Mem[0000000030001400] = 0000006e, %l4 = be675d0e5d0f9def
	ldstuba	[%i0+%g0]0x81,%l4	! %l4 = 0000000000000000
!	%l6 = 0000000000000000, Mem[0000000030081408] = 4222ff00
	stba	%l6,[%i2+%o4]0x89	! Mem[0000000030081408] = 4222ff00
!	Mem[0000000030081400] = 3de29600, %l5 = 0000000054f20027
	swapa	[%i2+%g0]0x81,%l5	! %l5 = 000000003de29600
!	%f8  = 00000000 25c8dd22, Mem[0000000010101410] = 00000000 00000027
	stda	%f8 ,[%i4+%o5]0x80	! Mem[0000000010101410] = 00000000 25c8dd22
!	Mem[00000000300c1400] = ff000000, %l2 = 00000000ffffffe4
	swapa	[%i3+%g0]0x81,%l2	! %l2 = 00000000ff000000

p0_label_146:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001416] = 00ffffff, %l0 = 844eff2273466624
	ldsh	[%i0+0x016],%l0		! %l0 = ffffffffffffffff
!	Mem[00000000300c1400] = ffffffe400000000, %f26 = 00000000 00000066
	ldda	[%i3+%g0]0x81,%f26	! %f26 = ffffffe4 00000000
!	Mem[0000000030101410] = 71000000, %l7 = 000000005dffcdf8
	lduwa	[%i4+%o5]0x81,%l7	! %l7 = 0000000071000000
!	Mem[0000000010081410] = 53021084, %l2 = 00000000ff000000
	ldswa	[%i2+%o5]0x80,%l2	! %l2 = 0000000053021084
!	Mem[0000000030181400] = 73466624, %l0 = ffffffffffffffff
	ldsba	[%i6+%g0]0x81,%l0	! %l0 = 0000000000000073
!	Mem[0000000010081400] = 00000000, %l1 = 0000000000000000
	ldsba	[%i2+%g0]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000010101410] = 00000000, %l0 = 0000000000000073
	lduba	[%i4+%o5]0x88,%l0	! %l0 = 0000000000000000
!	Mem[0000000030181400] = 73466624, %l6 = 0000000000000000
	lduba	[%i6+%g0]0x81,%l6	! %l6 = 0000000000000073
!	Mem[0000000010181400] = 00000000, %l1 = 0000000000000000
	lduba	[%i6+%g0]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000030181400] = ef910f5d 24664673, %l2 = 53021084, %l3 = 4fae1299
	ldda	[%i6+%g0]0x89,%l2	! %l2 = 0000000024664673 00000000ef910f5d

p0_label_147:
!	Starting 10 instruction Store Burst
!	%l0 = 0000000000000000, Mem[00000000300c1408] = 00000000
	stha	%l0,[%i3+%o4]0x89	! Mem[00000000300c1408] = 00000000
!	Mem[00000000100c1424] = 006efd34, %l3 = ef910f5d, %l6 = 00000073
	add	%i3,0x24,%g1
	casa	[%g1]0x80,%l3,%l6	! %l6 = 00000000006efd34
!	Mem[0000000010041408] = ff000dff, %l5 = 000000003de29600
	ldstuba	[%i1+%o4]0x80,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030001408] = 00000070, %l2 = 0000000024664673
	ldstuba	[%i0+%o4]0x89,%l2	! %l2 = 0000000000000070
!	Mem[0000000030181410] = 00000000, %l6 = 00000000006efd34
	swapa	[%i6+%o5]0x89,%l6	! %l6 = 0000000000000000
!	Mem[00000000300c1408] = 00000000, %l1 = 0000000000000000
	swapa	[%i3+%o4]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000010101410] = 00000000, %l1 = 0000000000000000
	swapa	[%i4+%o5]0x80,%l1	! %l1 = 0000000000000000
!	%f31 = 00000000, Mem[0000000010081400] = 00000000
	sta	%f31,[%i2+%g0]0x88	! Mem[0000000010081400] = 00000000
!	%l0 = 0000000000000000, Mem[0000000010181408] = dfffffff
	stba	%l0,[%i6+%o4]0x88	! Mem[0000000010181408] = dfffff00
!	%f25 = 00000027, Mem[0000000010001414] = 00ffffff
	st	%f25,[%i0+0x014]	! Mem[0000000010001414] = 00000027

p0_label_148:
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = e4ffffff, %l4 = 0000000000000000
	lduha	[%i3+%g0]0x89,%l4	! %l4 = 000000000000ffff
!	Mem[0000000030041410] = 00ff0057, %l2 = 0000000000000070
	lduwa	[%i1+%o5]0x89,%l2	! %l2 = 0000000000ff0057
!	Mem[000000001018141e] = 00000000, %l0 = 0000000000000000
	ldsh	[%i6+0x01e],%l0		! %l0 = 0000000000000000
!	Mem[0000000010081400] = 0000000000000000, %l0 = 0000000000000000
	ldxa	[%i2+%g0]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000030081400] = 2700f254, %l6 = 0000000000000000
	ldsha	[%i2+%g0]0x89,%l6	! %l6 = fffffffffffff254
!	Mem[0000000010101400] = 70000000ffffffff, %f12 = 00ffffff 00ffffff
	ldda	[%i4+%g0]0x80,%f12	! %f12 = 70000000 ffffffff
!	Mem[0000000010001410] = 0000ffff, %l0 = 0000000000000000
	lduba	[%i0+%o5]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000010081400] = 00000000, %l4 = 000000000000ffff
	lduba	[%i2+%g0]0x88,%l4	! %l4 = 0000000000000000
!	Mem[00000000100c1410] = 2b1a455b53021084, %f10 = 270000ff ff000000, %asi = 80
	ldda	[%i3+0x010]%asi,%f10	! %f10 = 2b1a455b 53021084
!	Mem[0000000010181410] = 0000000000000000, %l0 = 0000000000000000
	ldxa	[%i6+%o5]0x80,%l0	! %l0 = 0000000000000000

p0_label_149:
!	Starting 10 instruction Store Burst
!	Mem[0000000010181400] = 00000000, %l4 = 0000000000000000
	ldstuba	[%i6+%g0]0x88,%l4	! %l4 = 0000000000000000
!	%f22 = 7e0e314a 7fec95f3, %l0 = 0000000000000000
!	Mem[0000000010181400] = ff00000025c8dd22
	stda	%f22,[%i6+%l0]ASI_PST16_PL ! Mem[0000000010181400] = ff00000025c8dd22
!	%l5 = 00000000000000ff, Mem[0000000010001432] = 00000000, %asi = 80
	stha	%l5,[%i0+0x032]%asi	! Mem[0000000010001430] = 000000ff
!	%l3 = 00000000ef910f5d, Mem[00000000211c0001] = ffff7fb0
	stb	%l3,[%o2+0x001]		! Mem[00000000211c0000] = ff5d7fb0
!	%l3 = 00000000ef910f5d, Mem[00000000100c1408] = 71000000
	stha	%l3,[%i3+%o4]0x80	! Mem[00000000100c1408] = 0f5d0000
!	%f0  = 00000000, Mem[0000000030081400] = 54f20027
	sta	%f0 ,[%i2+%g0]0x81	! Mem[0000000030081400] = 00000000
!	%l6 = fffffffffffff254, Mem[00000000100c1410] = 5b451a2b
	stha	%l6,[%i3+%o5]0x88	! Mem[00000000100c1410] = 5b45f254
!	Mem[00000000100c1430] = ff0000ffffffffff, %l1 = 0000000000000000, %l0 = 0000000000000000
	add	%i3,0x30,%g1
	casxa	[%g1]0x80,%l1,%l0	! %l0 = ff0000ffffffffff
!	Mem[0000000030041400] = 00000000, %l7 = 0000000071000000
	swapa	[%i1+%g0]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000010181420] = ffdd0000, %l4 = 00000000, %l3 = ef910f5d
	add	%i6,0x20,%g1
	casa	[%g1]0x80,%l4,%l3	! %l3 = 00000000ffdd0000

p0_label_150:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = 5d0f91ef, %l6 = fffffffffffff254
	ldswa	[%i5+%g0]0x80,%l6	! %l6 = 000000005d0f91ef
!	Mem[0000000010181420] = ffdd0000ffffffdf, %f16 = 00000000 6242bf40, %asi = 80
	ldda	[%i6+0x020]%asi,%f16	! %f16 = ffdd0000 ffffffdf
!	Mem[0000000010041408] = ff000dff000000ff, %f24 = 77ff0000 00000027
	ldda	[%i1+%o4]0x80,%f24	! %f24 = ff000dff 000000ff
!	Mem[0000000030081400] = 00000000, %l0 = ff0000ffffffffff
	lduwa	[%i2+%g0]0x81,%l0	! %l0 = 0000000000000000
!	Code Fragment 3, seed = 426989
p0_fragment_14:
!	%l0 = 0000000000000000
	setx	0xf77e7e124d8bd5be,%g7,%l0 ! %l0 = f77e7e124d8bd5be
!	%l1 = 0000000000000000
	setx	0x1f9d49b8a4c57669,%g7,%l1 ! %l1 = 1f9d49b8a4c57669
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = f77e7e124d8bd5be
	setx	0x4e2804cb0fdad324,%g7,%l0 ! %l0 = 4e2804cb0fdad324
!	%l1 = 1f9d49b8a4c57669
	setx	0x19a113ff3fbc6eef,%g7,%l1 ! %l1 = 19a113ff3fbc6eef
p0_fragment_14_end:
!	Mem[0000000030181408] = 70000000ffffffff, %f2  = 9a0000ff 00000027
	ldda	[%i6+%o4]0x81,%f2 	! %f2  = 70000000 ffffffff
!	Mem[0000000030181400] = ef910f5d24664673, %f28 = e0ff0000 00004424
	ldda	[%i6+%g0]0x89,%f28	! %f28 = ef910f5d 24664673
!	Mem[0000000010081410] = 53021084, %l2 = 0000000000ff0057
	ldub	[%i2+%o5],%l2		! %l2 = 0000000000000053
!	Mem[0000000030141408] = 7fec95f3, %l6 = 000000005d0f91ef
	lduha	[%i5+%o4]0x89,%l6	! %l6 = 00000000000095f3
!	Mem[0000000030141410] = 0000000000000000, %f22 = 7e0e314a 7fec95f3
	ldda	[%i5+%o5]0x89,%f22	! %f22 = 00000000 00000000

p0_label_151:
!	Starting 10 instruction Store Burst
!	%l2 = 0000000000000053, Mem[00000000100c143c] = 47ac1fcb, %asi = 80
	stwa	%l2,[%i3+0x03c]%asi	! Mem[00000000100c143c] = 00000053
!	%l6 = 00000000000095f3, imm = fffffffffffff4cd, %l4 = 0000000000000000
	sub	%l6,-0xb33,%l4		! %l4 = 000000000000a126
!	%l7 = 0000000000000000, Mem[0000000030081400] = 0d789cff00000000
	stxa	%l7,[%i2+%g0]0x89	! Mem[0000000030081400] = 0000000000000000
!	Mem[000000001014143e] = 22ea378b, %l0 = 4e2804cb0fdad324
	ldstuba	[%i5+0x03e]%asi,%l0	! %l0 = 0000000000000037
!	%f17 = ffffffdf, Mem[0000000010141438] = 0017d7c2
	sta	%f17,[%i5+0x038]%asi	! Mem[0000000010141438] = ffffffdf
!	%f1  = 25c8dd22, %f3  = ffffffff, %f3  = ffffffff
	fsubs	%f1 ,%f3 ,%f3 		! %f3  = ffffffff
!	Mem[00000000300c1408] = 00000000, %l3 = 00000000ffdd0000
	swapa	[%i3+%o4]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000030081410] = f8000000, %l2 = 0000000000000053
	ldstuba	[%i2+%o5]0x81,%l2	! %l2 = 00000000000000f8
!	%f14 = 5700ff00 ff000000, %l1 = 19a113ff3fbc6eef
!	Mem[0000000030101408] = 713b7d44769c780d
	add	%i4,0x008,%g1
	stda	%f14,[%g1+%l1]ASI_PST16_SL ! Mem[0000000030101408] = 000000ff00ff0057
!	%l2 = 00000000000000f8, Mem[0000000030181408] = 70000000ffffffff
	stxa	%l2,[%i6+%o4]0x81	! Mem[0000000030181408] = 00000000000000f8

p0_label_152:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041408] = ff000dff, %l3 = 0000000000000000
	lduw	[%i1+%o4],%l3		! %l3 = 00000000ff000dff
!	Mem[0000000030141410] = 00000000, %l1 = 19a113ff3fbc6eef
	lduha	[%i5+%o5]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000010001410] = 27000000 ffff0000, %l4 = 0000a126, %l5 = 000000ff
	ldda	[%i0+%o5]0x88,%l4	! %l4 = 00000000ffff0000 0000000027000000
!	Mem[0000000010141410] = ff000dff, %l1 = 0000000000000000
	lduba	[%i5+%o5]0x80,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010001408] = 9912ae4f, %l3 = 00000000ff000dff
	ldsha	[%i0+%o4]0x88,%l3	! %l3 = ffffffffffffae4f
!	Mem[0000000010081400] = 00000000 00000000, %l4 = ffff0000, %l5 = 27000000
	ldda	[%i2+%g0]0x80,%l4	! %l4 = 0000000000000000 0000000000000000
!	Mem[0000000010101404] = ffffffff, %l6 = 00000000000095f3, %asi = 80
	ldsha	[%i4+0x004]%asi,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010101410] = 00000000, %l3 = ffffffffffffae4f
	ldsha	[%i4+%o5]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000030041408] = 00000000, %l2 = 00000000000000f8
	lduwa	[%i1+%o4]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000010081400] = 0000000000000000, %l4 = 0000000000000000
	ldxa	[%i2+%g0]0x88,%l4	! %l4 = 0000000000000000

p0_label_153:
!	Starting 10 instruction Store Burst
!	%l6 = ffffffffffffffff, Mem[0000000030001408] = ff000000
	stba	%l6,[%i0+%o4]0x81	! Mem[0000000030001408] = ff000000
!	%l6 = ffffffffffffffff, Mem[00000000100c1430] = ff0000ffffffffff, %asi = 80
	stxa	%l6,[%i3+0x030]%asi	! Mem[00000000100c1430] = ffffffffffffffff
!	%l2 = 0000000000000000, Mem[0000000010001410] = ffff0000
	stba	%l2,[%i0+%o5]0x88	! Mem[0000000010001410] = ffff0000
!	Mem[0000000030001410] = 00000000, %l1 = 00000000000000ff
	swapa	[%i0+%o5]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000030181400] = 73466624, %l1 = 0000000000000000
	ldstuba	[%i6+%g0]0x81,%l1	! %l1 = 0000000000000073
!	Mem[0000000010101430] = 31f302e4, %l6 = ffffffffffffffff
	ldstuba	[%i4+0x030]%asi,%l6	! %l6 = 0000000000000031
!	Mem[0000000030081408] = 00ff2242, %l6 = 0000000000000031
	swapa	[%i2+%o4]0x81,%l6	! %l6 = 0000000000ff2242
!	%f10 = 2b1a455b 53021084, Mem[0000000010041408] = ff000dff 000000ff, %asi = 80
	stda	%f10,[%i1+0x008]%asi	! Mem[0000000010041408] = 2b1a455b 53021084
!	%f29 = 24664673, Mem[0000000030101400] = 000000ff
	sta	%f29,[%i4+%g0]0x89	! Mem[0000000030101400] = 24664673
!	%l6 = 0000000000ff2242, Mem[0000000030081408] = 0000003100000000
	stxa	%l6,[%i2+%o4]0x81	! Mem[0000000030081408] = 0000000000ff2242

p0_label_154:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = 9912ae4f, %l0 = 0000000000000037
	ldsba	[%i0+%o4]0x88,%l0	! %l0 = 000000000000004f
!	Mem[0000000030081400] = 0000000000000000, %l3 = 0000000000000000
	ldxa	[%i2+%g0]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000010081410] = 53021084, %l5 = 0000000000000000
	lduba	[%i2+%o5]0x80,%l5	! %l5 = 0000000000000053
!	%l2 = 0000000000000000, Mem[0000000030141400] = 00000000
	stha	%l2,[%i5+%g0]0x81	! Mem[0000000030141400] = 00000000
!	Mem[0000000010141434] = 0000006e, %l6 = 0000000000ff2242, %asi = 80
	ldsha	[%i5+0x034]%asi,%l6	! %l6 = 0000000000000000
!	Mem[0000000010141410] = ff0d00ff, %l3 = 0000000000000000
	lduwa	[%i5+%o5]0x88,%l3	! %l3 = 00000000ff0d00ff
!	Mem[0000000030181400] = ff466624, %l2 = 0000000000000000
	ldswa	[%i6+%g0]0x81,%l2	! %l2 = ffffffffff466624
!	Mem[0000000030101410] = 00000071, %f2  = 70000000
	lda	[%i4+%o5]0x89,%f2 	! %f2 = 00000071
!	Mem[00000000218000c0] = ffffc070, %l3 = 00000000ff0d00ff
	ldsh	[%o3+0x0c0],%l3		! %l3 = ffffffffffffffff
!	Mem[0000000010081400] = 00000000, %l2 = ffffffffff466624
	lduha	[%i2+%g0]0x88,%l2	! %l2 = 0000000000000000

p0_label_155:
!	Starting 10 instruction Store Burst
!	%l6 = 0000000000000000, Mem[0000000010041400] = e0ff000000004424
	stxa	%l6,[%i1+%g0]0x88	! Mem[0000000010041400] = 0000000000000000
!	%l5 = 0000000000000053, Mem[0000000030001400] = 6e0000ff
	stba	%l5,[%i0+%g0]0x89	! Mem[0000000030001400] = 6e000053
!	%l4 = 0000000000000000, Mem[0000000030181400] = 246646ff
	stba	%l4,[%i6+%g0]0x89	! Mem[0000000030181400] = 24664600
!	%l3 = ffffffffffffffff, Mem[0000000010001408] = 4fae1299ff00009a
	stxa	%l3,[%i0+%o4]0x80	! Mem[0000000010001408] = ffffffffffffffff
!	Mem[0000000030101408] = 000000ff, %l5 = 0000000000000053
	ldstuba	[%i4+%o4]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000030101400] = 24664673, %l7 = 0000000000000000
	ldstuba	[%i4+%g0]0x89,%l7	! %l7 = 0000000000000073
!	%l0 = 000000000000004f, Mem[0000000030001408] = 000000ff
	stwa	%l0,[%i0+%o4]0x89	! Mem[0000000030001408] = 0000004f
!	%l2 = 00000000, %l3 = ffffffff, Mem[0000000010041408] = 5b451a2b 84100253
	stda	%l2,[%i1+%o4]0x88	! Mem[0000000010041408] = 00000000 ffffffff
!	%l4 = 0000000000000000, Mem[000000001010143c] = 6626a198
	stw	%l4,[%i4+0x03c]		! Mem[000000001010143c] = 00000000
!	%l0 = 000000000000004f, %l7 = 0000000000000073, %l3 = ffffffffffffffff
	xor	%l0,%l7,%l3		! %l3 = 000000000000003c

p0_label_156:
!	Starting 10 instruction Load Burst
!	Mem[0000000030181410] = 00000000006efd34, %f16 = ffdd0000 ffffffdf
	ldda	[%i6+%o5]0x89,%f16	! %f16 = 00000000 006efd34
!	Mem[0000000030081408] = 00000000, %l4 = 0000000000000000
	lduba	[%i2+%o4]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000010101412] = 00000000, %l4 = 0000000000000000
	ldub	[%i4+0x012],%l4		! %l4 = 0000000000000000
!	Mem[0000000030141408] = 7fec95f3, %l2 = 0000000000000000
	ldsba	[%i5+%o4]0x89,%l2	! %l2 = fffffffffffffff3
!	Mem[0000000010001400] = 27000000ff00009a, %f22 = 00000000 00000000
	ldda	[%i0+%g0]0x88,%f22	! %f22 = 27000000 ff00009a
!	Mem[0000000010181408] = 00000000dfffff00, %l2 = fffffffffffffff3
	ldxa	[%i6+%o4]0x88,%l2	! %l2 = 00000000dfffff00
	membar	#Sync			! Added by membar checker (28)
!	Mem[0000000010101400] = 70000000 ffffffff 00ff0000 ffffffff
!	Mem[0000000010101410] = 00000000 25c8dd22 769c780d 0cd1ed8f
!	Mem[0000000010101420] = 6c1ca198 2250ffea 4e24c376 0000ffff
!	Mem[0000000010101430] = fff302e4 17dbffe5 ff0d0040 00000000
	ldda	[%i4+%g0]ASI_BLK_AIUPL,%f16	! Block Load from 0000000010101400
!	Mem[0000000010001431] = 000000ff, %l3 = 000000000000003c, %asi = 80
	lduba	[%i0+0x031]%asi,%l3	! %l3 = 0000000000000000
!	Mem[00000000100c1400] = 0000ff77, %l7 = 0000000000000073
	ldsh	[%i3+%g0],%l7		! %l7 = 0000000000000000
!	Mem[0000000030181410] = 34fd6e00, %f12 = 70000000
	lda	[%i6+%o5]0x81,%f12	! %f12 = 34fd6e00

p0_label_157:
!	Starting 10 instruction Store Burst
!	%l6 = 0000000000000000, Mem[0000000030041410] = 5700ff00
	stba	%l6,[%i1+%o5]0x81	! Mem[0000000030041410] = 0000ff00
!	Mem[00000000211c0000] = ff5d7fb0, %l6 = 0000000000000000
	ldstub	[%o2+%g0],%l6		! %l6 = 00000000000000ff
!	%l1 = 0000000000000073, Mem[0000000030141408] = 7fec95f3
	stha	%l1,[%i5+%o4]0x89	! Mem[0000000030141408] = 7fec0073
!	%f10 = 2b1a455b 53021084, Mem[00000000100c1400] = 0000ff77 6242bf40
	stda	%f10,[%i3+%g0]0x80	! Mem[00000000100c1400] = 2b1a455b 53021084
!	Mem[0000000010101408] = 00ff0000, %l5 = 0000000000000000
	swapa	[%i4+%o4]0x80,%l5	! %l5 = 0000000000ff0000
!	Mem[0000000010181410] = 00000000, %l1 = 0000000000000073
	swapa	[%i6+%o5]0x80,%l1	! %l1 = 0000000000000000
!	%l2 = dfffff00, %l3 = 00000000, Mem[0000000030181410] = 34fd6e00 00000000
	stda	%l2,[%i6+%o5]0x81	! Mem[0000000030181410] = dfffff00 00000000
!	Mem[0000000030101408] = ff0000ff, %l6 = 00000000000000ff
	swapa	[%i4+%o4]0x89,%l6	! %l6 = 00000000ff0000ff
!	%l0 = 000000000000004f, Mem[0000000010141400] = ef910f5d
	stha	%l0,[%i5+%g0]0x88	! Mem[0000000010141400] = ef91004f
!	Mem[0000000030081410] = 000000ff, %l5 = 0000000000ff0000
	swapa	[%i2+%o5]0x89,%l5	! %l5 = 00000000000000ff

p0_label_158:
!	Starting 10 instruction Load Burst
!	Mem[0000000030081410] = 0000ff0000000000, %f10 = 2b1a455b 53021084
	ldda	[%i2+%o5]0x81,%f10	! %f10 = 0000ff00 00000000
!	%f1  = 25c8dd22, %f14 = 5700ff00 ff000000
	fitod	%f1 ,%f14		! %f14 = 41c2e46e 91000000
!	Mem[0000000030181408] = 00000000, %l0 = 000000000000004f
	lduha	[%i6+%o4]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000010081410] = ffffbde484100253, %f8  = 00000000 25c8dd22
	ldda	[%i2+%o5]0x88,%f8 	! %f8  = ffffbde4 84100253
!	Mem[00000000211c0000] = ff5d7fb0, %l3 = 0000000000000000
	lduh	[%o2+%g0],%l3		! %l3 = 000000000000ff5d
!	Mem[0000000030001410] = ff000000 e4bdffff, %l6 = ff0000ff, %l7 = 00000000
	ldda	[%i0+%o5]0x81,%l6	! %l6 = 00000000ff000000 00000000e4bdffff
!	Mem[0000000010141410] = ff000dff, %l3 = 000000000000ff5d
	ldswa	[%i5+%o5]0x80,%l3	! %l3 = ffffffffff000dff
!	%l1 = 0000000000000000, %l6 = 00000000ff000000, %y  = 00000000
	umul	%l1,%l6,%l6		! %l6 = 0000000000000000, %y = 00000000
!	Mem[0000000020800000] = 00ffc750, %l7 = 00000000e4bdffff, %asi = 80
	ldsha	[%o1+0x000]%asi,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030181400] = 004666245d0f91ef, %f14 = 41c2e46e 91000000
	ldda	[%i6+%g0]0x81,%f14	! %f14 = 00466624 5d0f91ef

p0_label_159:
!	Starting 10 instruction Store Burst
!	%l6 = 0000000000000000, Mem[0000000010181438] = 21d58c723dd76b7b
	stx	%l6,[%i6+0x038]		! Mem[0000000010181438] = 0000000000000000
!	%f24 = eaff5022, Mem[0000000030001400] = 6e000053
	sta	%f24,[%i0+%g0]0x89	! Mem[0000000030001400] = eaff5022
!	%f24 = eaff5022 98a11c6c, %l4 = 0000000000000000
!	Mem[0000000010081408] = 77ff000000000027
	add	%i2,0x008,%g1
	stda	%f24,[%g1+%l4]ASI_PST8_P ! Mem[0000000010081408] = 77ff000000000027
!	%l4 = 00000000, %l5 = 000000ff, Mem[0000000010141410] = ff0d00ff 5700ff00
	stda	%l4,[%i5+%o5]0x88	! Mem[0000000010141410] = 00000000 000000ff
!	Mem[0000000010001414] = 00000027, %l3 = 00000000ff000dff
	swap	[%i0+0x014],%l3		! %l3 = 0000000000000027
!	%l2 = 00000000dfffff00, Mem[0000000030001410] = 000000ff
	stba	%l2,[%i0+%o5]0x89	! Mem[0000000030001410] = 00000000
	membar	#Sync			! Added by membar checker (29)
!	%l5 = 00000000000000ff, Mem[0000000010101408] = 00000000
	stba	%l5,[%i4+%o4]0x80	! Mem[0000000010101408] = ff000000
!	%f4  = 00000000 00ff2242, %l1 = 0000000000000000
!	Mem[00000000300c1408] = 0000ddff00000027
	add	%i3,0x008,%g1
	stda	%f4,[%g1+%l1]ASI_PST8_S ! Mem[00000000300c1408] = 0000ddff00000027
!	%f2  = 00000071 ffffffff, %l3 = 0000000000000027
!	Mem[0000000030001430] = 570000004c1f7727
	add	%i0,0x030,%g1
	stda	%f2,[%g1+%l3]ASI_PST8_S ! Mem[0000000030001430] = 570000004cffffff
!	%l5 = 00000000000000ff, Mem[0000000010181408] = 00ffffdf00000000
	stxa	%l5,[%i6+%o4]0x80	! Mem[0000000010181408] = 00000000000000ff

p0_label_160:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1430] = ffffffff ffffffff, %l0 = 00000000, %l1 = 00000000
	ldd	[%i3+0x030],%l0		! %l0 = 00000000ffffffff 00000000ffffffff
!	Mem[0000000030001408] = 0000004f, %l4 = 0000000000000000
	ldsha	[%i0+%o4]0x89,%l4	! %l4 = 000000000000004f
!	Mem[0000000030141410] = 00000000, %l4 = 000000000000004f
	ldswa	[%i5+%o5]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000010081400] = 00000000 00000000, %l0 = ffffffff, %l1 = ffffffff
	ldda	[%i2+%g0]0x80,%l0	! %l0 = 0000000000000000 0000000000000000
!	Mem[0000000030041400] = 71000000, %l7 = 00000000000000ff
	lduba	[%i1+%g0]0x81,%l7	! %l7 = 0000000000000071
!	Mem[0000000030001410] = 00000000, %l4 = 0000000000000000
	lduwa	[%i0+%o5]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000010001410] = 0000ffff, %l5 = 00000000000000ff
	lduba	[%i0+%o5]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000030041408] = 03ffffff00000000, %l0 = 0000000000000000
	ldxa	[%i1+%o4]0x89,%l0	! %l0 = 03ffffff00000000
!	Mem[0000000010041400] = 00000000 00000000, %l6 = 00000000, %l7 = 00000071
	ldda	[%i1+%g0]0x88,%l6	! %l6 = 0000000000000000 0000000000000000
!	Mem[0000000010181410] = 0000007300000000, %f28 = e5ffdb17 e402f3ff
	ldda	[%i6+%o5]0x80,%f28	! %f28 = 00000073 00000000

p0_label_161:
!	Starting 10 instruction Store Burst
!	%l6 = 0000000000000000, Mem[0000000020800040] = 51ffe580
	sth	%l6,[%o1+0x040]		! Mem[0000000020800040] = 0000e580
!	%l5 = 0000000000000000, Mem[0000000030181408] = 00000000000000f8
	stxa	%l5,[%i6+%o4]0x81	! Mem[0000000030181408] = 0000000000000000
!	%l7 = 0000000000000000, Mem[0000000010101408] = ff000000
	stha	%l7,[%i4+%o4]0x80	! Mem[0000000010101408] = 00000000
!	%l5 = 0000000000000000, Mem[0000000010041408] = 00000000ffffffff
	stxa	%l5,[%i1+%o4]0x80	! Mem[0000000010041408] = 0000000000000000
!	Mem[0000000030041400] = 71000000 6c1ca198 00000000 ffffff03
!	%f16 = ffffffff 00000070 ffffffff 0000ff00
!	%f20 = 22ddc825 00000000 8fedd10c 0d789c76
!	%f24 = eaff5022 98a11c6c ffff0000 76c3244e
!	%f28 = 00000073 00000000 00000000 40000dff
	stda	%f16,[%i1+%g0]ASI_BLK_S	! Block Store to 0000000030041400
!	Mem[00000000100c1430] = ffffffff, %l1 = 0000000000000000
	ldstub	[%i3+0x030],%l1		! %l1 = 00000000000000ff
!	%l5 = 0000000000000000, Mem[0000000030101408] = 000000ff
	stwa	%l5,[%i4+%o4]0x89	! Mem[0000000030101408] = 00000000
!	%l4 = 0000000000000000, Mem[0000000010181408] = ff00000000000000
	stxa	%l4,[%i6+%o4]0x88	! Mem[0000000010181408] = 0000000000000000
!	%l2 = 00000000dfffff00, Mem[0000000030001400] = 2250ffea00000000
	stxa	%l2,[%i0+%g0]0x81	! Mem[0000000030001400] = 00000000dfffff00
!	%f10 = 0000ff00 00000000, Mem[0000000030101410] = 00000071 4000ffff
	stda	%f10,[%i4+%o5]0x89	! Mem[0000000030101410] = 0000ff00 00000000

p0_label_162:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141428] = 00000000, %l4 = 0000000000000000, %asi = 80
	lduwa	[%i5+0x028]%asi,%l4	! %l4 = 0000000000000000
!	Mem[00000000100c1430] = ffffffffffffffff, %l3 = 0000000000000027, %asi = 80
	ldxa	[%i3+0x030]%asi,%l3	! %l3 = ffffffffffffffff
	membar	#Sync			! Added by membar checker (30)
!	Mem[0000000030041400] = ffffffff, %l2 = 00000000dfffff00
	ldsha	[%i1+%g0]0x89,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000030081408] = 00000000, %l0 = 03ffffff00000000
	lduwa	[%i2+%o4]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000030041400] = ffffffff, %l7 = 0000000000000000
	ldsha	[%i1+%g0]0x81,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000030141408] = 000000007fec0073, %l1 = 00000000000000ff
	ldxa	[%i5+%o4]0x89,%l1	! %l1 = 000000007fec0073
!	Mem[0000000010181410] = 73000000, %l5 = 0000000000000000
	ldsha	[%i6+%o5]0x88,%l5	! %l5 = 0000000000000000
!	Mem[00000000300c1408] = 0000ddff00000027, %f12 = 34fd6e00 ffffffff
	ldda	[%i3+%o4]0x81,%f12	! %f12 = 0000ddff 00000027
!	Mem[0000000010001408] = ffffffff, %l3 = ffffffffffffffff
	lduba	[%i0+%o4]0x80,%l3	! %l3 = 00000000000000ff
!	Mem[00000000100c1400] = 2b1a455b 53021084, %l2 = ffffffff, %l3 = 000000ff
	ldd	[%i3+%g0],%l2		! %l2 = 000000002b1a455b 0000000053021084

p0_label_163:
!	Starting 10 instruction Store Burst
!	Mem[000000001018141c] = 00000000, %l2 = 000000002b1a455b
	ldstuba	[%i6+0x01c]%asi,%l2	! %l2 = 0000000000000000
!	%l4 = 0000000000000000, Mem[0000000030001400] = 00000000
	stha	%l4,[%i0+%g0]0x89	! Mem[0000000030001400] = 00000000
!	%l5 = 0000000000000000, Mem[0000000030141400] = 00000000
	stba	%l5,[%i5+%g0]0x81	! Mem[0000000030141400] = 00000000
!	Mem[0000000010081408] = 0000ff77, %l0 = 0000000000000000
	ldstuba	[%i2+%o4]0x88,%l0	! %l0 = 0000000000000077
!	%l6 = 0000000000000000, Mem[0000000030141410] = 00000000
	stwa	%l6,[%i5+%o5]0x89	! Mem[0000000030141410] = 00000000
!	%l2 = 00000000, %l3 = 53021084, Mem[0000000010081400] = 00000000 00000000
	stda	%l2,[%i2+%g0]0x80	! Mem[0000000010081400] = 00000000 53021084
!	%f20 = 22ddc825, %f1  = 25c8dd22, %f26 = ffff0000
	fsubs	%f20,%f1 ,%f26		! %f26 = a5c56601
!	%l3 = 0000000053021084, Mem[0000000010101408] = 00000000
	stba	%l3,[%i4+%o4]0x80	! Mem[0000000010101408] = 84000000
!	Mem[0000000030101408] = 00000000, %l2 = 0000000000000000
	ldstuba	[%i4+%o4]0x81,%l2	! %l2 = 0000000000000000
!	%f8  = ffffbde4 84100253, %l5 = 0000000000000000
!	Mem[0000000030081408] = 0000000000ff2242
	add	%i2,0x008,%g1
	stda	%f8,[%g1+%l5]ASI_PST8_S ! Mem[0000000030081408] = 0000000000ff2242

p0_label_164:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = 22ddc82500000000, %l0 = 0000000000000077
	ldxa	[%i4+%o5]0x88,%l0	! %l0 = 22ddc82500000000
!	Mem[0000000030001408] = 4f000000, %l1 = 000000007fec0073
	lduba	[%i0+%o4]0x81,%l1	! %l1 = 000000000000004f
!	%l6 = 0000000000000000, %l3 = 0000000053021084, %l2 = 0000000000000000
	add	%l6,%l3,%l2		! %l2 = 0000000053021084
!	Mem[0000000010141400] = ef91004f, %l6 = 0000000000000000
	ldsba	[%i5+%g0]0x88,%l6	! %l6 = 000000000000004f
!	Mem[0000000010001400] = 9a0000ff 00000027 ffffffff ffffffff
!	Mem[0000000010001410] = 0000ffff ff000dff 7e0e314a 7fec95f3
!	Mem[0000000010001420] = 77ff0000 00000027 00000000 00000066
!	Mem[0000000010001430] = 000000ff 00000070 25c8dd22 6edccca1
	ldda	[%i0+%g0]ASI_BLK_PL,%f16	! Block Load from 0000000010001400
!	Mem[0000000010101438] = ff0d004000000000, %f10 = 0000ff00 00000000
	ldd	[%i4+0x038],%f10	! %f10 = ff0d0040 00000000
!	Mem[0000000030081400] = 0000000000000000, %l3 = 0000000053021084
	ldxa	[%i2+%g0]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000010101410] = 00000000, %l0 = 22ddc82500000000
	lduha	[%i4+%o5]0x80,%l0	! %l0 = 0000000000000000
!	Mem[00000000100c1410] = 54f2455b53021084, %f8  = ffffbde4 84100253
	ldd	[%i3+%o5],%f8 		! %f8  = 54f2455b 53021084
!	%f25 = 0000ff77, %f31 = 22ddc825, %f9  = 53021084
	fdivs	%f25,%f31,%f9 		! tt=0x22, %l0 = 0000000000000022

p0_label_165:
!	Starting 10 instruction Store Burst
!	%f22 = f395ec7f 4a310e7e, Mem[00000000100c1408] = 0f5d0000 14dcfff5, %asi = 80
	stda	%f22,[%i3+0x008]%asi	! Mem[00000000100c1408] = f395ec7f 4a310e7e
!	Mem[0000000030101410] = 00000000, %l3 = 0000000000000000
	ldstuba	[%i4+%o5]0x89,%l3	! %l3 = 0000000000000000
!	%f6  = fffd87a6, Mem[0000000030001410] = 00000000
	sta	%f6 ,[%i0+%o5]0x89	! Mem[0000000030001410] = fffd87a6
!	%l4 = 00000000, %l5 = 00000000, Mem[0000000030101408] = 000000ff 5700ff00
	stda	%l4,[%i4+%o4]0x89	! Mem[0000000030101408] = 00000000 00000000
!	Mem[0000000030181400] = 00466624, %l2 = 0000000053021084
	ldstuba	[%i6+%g0]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000010181400] = 000000ff, %l4 = 0000000000000000
	swapa	[%i6+%g0]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030181410] = dfffff00, %l2 = 0000000000000000
	swapa	[%i6+%o5]0x81,%l2	! %l2 = 00000000dfffff00
!	Mem[0000000010101410] = 00000000, %l5 = 0000000000000000
	swapa	[%i4+%o5]0x88,%l5	! %l5 = 0000000000000000
!	%l4 = 000000ff, %l5 = 00000000, Mem[0000000010141400] = 4f0091ef e4bdffff
	stda	%l4,[%i5+%g0]0x80	! Mem[0000000010141400] = 000000ff 00000000
!	%f26 = 66000000 00000000, Mem[0000000030141408] = 7fec0073 00000000
	stda	%f26,[%i5+%o4]0x89	! Mem[0000000030141408] = 66000000 00000000

p0_label_166:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181436] = 00ffffff, %l5 = 0000000000000000, %asi = 80
	lduha	[%i6+0x036]%asi,%l5	! %l5 = 000000000000ffff
!	Mem[0000000030101400] = 3d000000246646ff, %f8  = 54f2455b 53021084
	ldda	[%i4+%g0]0x89,%f8 	! %f8  = 3d000000 246646ff
!	Mem[0000000020800041] = 0000e580, %l6 = 000000000000004f, %asi = 80
	lduba	[%o1+0x041]%asi,%l6	! %l6 = 0000000000000000
!	Mem[00000000300c1400] = e4ffffff, %l7 = ffffffffffffffff
	lduba	[%i3+%g0]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[00000000100c1408] = f395ec7f4a310e7e, %l3 = 0000000000000000
	ldxa	[%i3+%o4]0x80,%l3	! %l3 = f395ec7f4a310e7e
!	Mem[0000000010041410] = 00000000, %l4 = 00000000000000ff
	lduwa	[%i1+%o5]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000010081400] = 00000000 53021084, %l6 = 00000000, %l7 = 000000ff, %asi = 80
	ldda	[%i2+0x000]%asi,%l6	! %l6 = 0000000000000000 0000000053021084
!	Mem[0000000010001400] = 27000000 ff00009a, %l6 = 00000000, %l7 = 53021084
	ldda	[%i0+%g0]0x88,%l6	! %l6 = 00000000ff00009a 0000000027000000
!	Mem[00000000300c1408] = ffdd0000, %l7 = 0000000027000000
	ldsba	[%i3+%o4]0x89,%l7	! %l7 = 0000000000000000
!	Mem[00000000100c1404] = 53021084, %l4 = 0000000000000000, %asi = 80
	lduha	[%i3+0x004]%asi,%l4	! %l4 = 0000000000005302

p0_label_167:
!	Starting 10 instruction Store Burst
!	%l4 = 00005302, %l5 = 0000ffff, Mem[0000000030081400] = 00000000 00000000
	stda	%l4,[%i2+%g0]0x89	! Mem[0000000030081400] = 00005302 0000ffff
!	Mem[00000000100c1400] = 5b451a2b, %l7 = 0000000000000000
	swapa	[%i3+%g0]0x88,%l7	! %l7 = 000000005b451a2b
	membar	#Sync			! Added by membar checker (31)
!	%l3 = f395ec7f4a310e7e, Mem[0000000010001410] = 0000ffff
	stwa	%l3,[%i0+%o5]0x80	! Mem[0000000010001410] = 4a310e7e
!	%l0 = 0000000000000022, Mem[0000000010001434] = 00000070
	stw	%l0,[%i0+0x034]		! Mem[0000000010001434] = 00000022
!	Mem[0000000030141408] = 00000000, %l1 = 000000000000004f
	ldstuba	[%i5+%o4]0x81,%l1	! %l1 = 0000000000000000
!	Mem[00000000100c1400] = 00000000 53021084 f395ec7f 4a310e7e
!	%f0  = 00000000 25c8dd22 00000071 ffffffff
!	%f4  = 00000000 00ff2242 fffd87a6 60000000
!	%f8  = 3d000000 246646ff ff0d0040 00000000
!	%f12 = 0000ddff 00000027 00466624 5d0f91ef
	stda	%f0 ,[%i3+%g0]ASI_BLK_P	! Block Store to 00000000100c1400
!	%l5 = 000000000000ffff, Mem[0000000030001410] = ffffbde4fffd87a6
	stxa	%l5,[%i0+%o5]0x89	! Mem[0000000030001410] = 000000000000ffff
!	%l1 = 0000000000000000, Mem[00000000211c0000] = ff5d7fb0
	sth	%l1,[%o2+%g0]		! Mem[00000000211c0000] = 00007fb0
!	%l6 = 00000000ff00009a, Mem[0000000010041408] = 00000000
	stwa	%l6,[%i1+%o4]0x80	! Mem[0000000010041408] = ff00009a
!	%f25 = 0000ff77, Mem[0000000030181400] = ff466624
	sta	%f25,[%i6+%g0]0x81	! Mem[0000000030181400] = 0000ff77

p0_label_168:
!	Starting 10 instruction Load Burst
!	Mem[0000000030141400] = 00000000, %l5 = 000000000000ffff
	lduwa	[%i5+%g0]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000030041410] = 25c8dd22, %l5 = 0000000000000000
	ldsba	[%i1+%o5]0x89,%l5	! %l5 = 0000000000000022
	membar	#Sync			! Added by membar checker (32)
!	Mem[00000000100c1410] = 0000000000ff2242, %f30 = a1ccdc6e 22ddc825
	ldda	[%i3+%o5]0x80,%f30	! %f30 = 00000000 00ff2242
!	Mem[0000000010101410] = 00000000, %l3 = f395ec7f4a310e7e
	ldsha	[%i4+%o5]0x80,%l3	! %l3 = 0000000000000000
!	Mem[00000000218000c0] = ffffc070, %l7 = 000000005b451a2b, %asi = 80
	lduha	[%o3+0x0c0]%asi,%l7	! %l7 = 000000000000ffff
!	%f3  = ffffffff, %f11 = 00000000
	fsqrts	%f3 ,%f11		! %f11 = ffffffff
!	Mem[0000000030041408] = 00ff0000 ffffffff, %l2 = dfffff00, %l3 = 00000000
	ldda	[%i1+%o4]0x89,%l2	! %l2 = 00000000ffffffff 0000000000ff0000
!	Mem[0000000030101410] = 000000ff, %l5 = 0000000000000022
	ldsha	[%i4+%o5]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030081410] = 00ff0000, %l7 = 000000000000ffff
	ldswa	[%i2+%o5]0x89,%l7	! %l7 = 0000000000ff0000
!	%f11 = ffffffff, %f21 = ffff0000, %f28 = 70000000
	fadds	%f11,%f21,%f28		! %f28 = ffff0000

p0_label_169:
!	Starting 10 instruction Store Burst
!	%f2  = 00000071 ffffffff, Mem[0000000010141408] = ffff00ff 333dec99
	stda	%f2 ,[%i5+%o4]0x80	! Mem[0000000010141408] = 00000071 ffffffff
!	%l4 = 0000000000005302, Mem[0000000010001410] = 4a310e7eff000dff
	stxa	%l4,[%i0+%o5]0x80	! Mem[0000000010001410] = 0000000000005302
!	Mem[0000000010081418] = 0c368e9a, %l2 = 00000000ffffffff
	ldstub	[%i2+0x018],%l2		! %l2 = 000000000000000c
!	%l0 = 0000000000000022, Mem[0000000010001400] = 9a0000ff
	stha	%l0,[%i0+%g0]0x80	! Mem[0000000010001400] = 002200ff
!	Mem[0000000030141408] = ff000000, %l6 = 00000000ff00009a
	swapa	[%i5+%o4]0x81,%l6	! %l6 = 00000000ff000000
!	%l4 = 00005302, %l5 = 000000ff, Mem[00000000100c1408] = 00000071 ffffffff
	stda	%l4,[%i3+%o4]0x80	! Mem[00000000100c1408] = 00005302 000000ff
!	Mem[0000000010101408] = 84000000, %l3 = 0000000000ff0000
	ldstuba	[%i4+%o4]0x80,%l3	! %l3 = 0000000000000084
!	%f16 = 27000000 ff00009a, %l6 = 00000000ff000000
!	Mem[0000000010141400] = 000000ff00000000
	stda	%f16,[%i5+%l6]ASI_PST32_P ! Mem[0000000010141400] = 000000ff00000000
!	Mem[0000000030181408] = 00000000, %l5 = 00000000000000ff
	ldstuba	[%i6+%o4]0x89,%l5	! %l5 = 0000000000000000
!	%l7 = 0000000000ff0000, Mem[0000000010101400] = 70000000
	stw	%l7,[%i4+%g0]		! Mem[0000000010101400] = 00ff0000

p0_label_170:
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = 00000000000000ff, %l5 = 0000000000000000
	ldxa	[%i6+%o4]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010181400] = 0000000025c8dd22, %f18 = ffffffff ffffffff
	ldd	[%i6+%g0],%f18		! %f18 = 00000000 25c8dd22
!	Mem[00000000211c0000] = 00007fb0, %l4 = 0000000000005302, %asi = 80
	lduha	[%o2+0x000]%asi,%l4	! %l4 = 0000000000000000
!	Mem[0000000010141410] = 00000000, %l2 = 000000000000000c
	lduba	[%i5+%o5]0x80,%l2	! %l2 = 0000000000000000
!	Mem[0000000030101410] = 000000ff, %l3 = 0000000000000084
	ldsba	[%i4+%o5]0x89,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010101400] = ffffffff0000ff00, %f16 = 27000000 ff00009a
	ldda	[%i4+%g0]0x88,%f16	! %f16 = ffffffff 0000ff00
!	Mem[0000000010081400] = 00000000, %l3 = ffffffffffffffff
	lduha	[%i2+%g0]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000010101410] = 0000000025c8dd22, %f4  = 00000000 00ff2242, %asi = 80
	ldda	[%i4+0x010]%asi,%f4 	! %f4  = 00000000 25c8dd22
!	%l5 = 00000000000000ff, %l5 = 00000000000000ff, %l1 = 0000000000000000
	udivx	%l5,%l5,%l1		! %l1 = 0000000000000001
!	Mem[00000000300c1400] = e4ffffff, %l6 = 00000000ff000000
	lduba	[%i3+%g0]0x89,%l6	! %l6 = 00000000000000ff

p0_label_171:
!	Starting 10 instruction Store Burst
!	%l5 = 00000000000000ff, Mem[0000000010141418] = 0000875e6b60ff13, %asi = 80
	stxa	%l5,[%i5+0x018]%asi	! Mem[0000000010141418] = 00000000000000ff
!	Mem[0000000010181408] = 00000000, %l7 = 0000000000ff0000
	ldstuba	[%i6+%o4]0x80,%l7	! %l7 = 0000000000000000
!	Code Fragment 4, seed = 254316
p0_fragment_15:
!	%l0 = 0000000000000022
	setx	0x3b8d08db771198c6,%g7,%l0 ! %l0 = 3b8d08db771198c6
!	%l1 = 0000000000000001
	setx	0x3154709c5ce26af1,%g7,%l1 ! %l1 = 3154709c5ce26af1
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 3b8d08db771198c6
	setx	0x5e6b0ad947e6412c,%g7,%l0 ! %l0 = 5e6b0ad947e6412c
!	%l1 = 3154709c5ce26af1
	setx	0xb7790321710b1e77,%g7,%l1 ! %l1 = b7790321710b1e77
p0_fragment_15_end:
!	Mem[0000000010101410] = 00000000, %l1 = 00000000710b1e77
	swapa	[%i4+%o5]0x80,%l1	! %l1 = 0000000000000000
!	%l3 = 0000000000000000, Mem[0000000010181400] = 00000000
	stba	%l3,[%i6+%g0]0x88	! Mem[0000000010181400] = 00000000
!	Mem[00000000300c1408] = 0000ddff, %l1 = 0000000000000000
	ldstuba	[%i3+%o4]0x81,%l1	! %l1 = 0000000000000000
!	%l1 = 0000000000000000, Mem[0000000020800000] = 00ffc750, %asi = 80
	stha	%l1,[%o1+0x000]%asi	! Mem[0000000020800000] = 0000c750
!	Mem[000000001010142c] = 0000ffff, %l6 = 00000000000000ff
	swap	[%i4+0x02c],%l6		! %l6 = 000000000000ffff
!	Mem[0000000010001410] = 0000000000005302, %l6 = 000000000000ffff, %l4 = 0000000000000000
	add	%i0,0x10,%g1
	casxa	[%g1]0x80,%l6,%l4	! %l4 = 0000000000005302
!	%l7 = 0000000000000000, Mem[0000000030001400] = 00000000dfffff00
	stxa	%l7,[%i0+%g0]0x81	! Mem[0000000030001400] = 0000000000000000

p0_label_172:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = 00000073, %l1 = 0000000000000000
	ldsba	[%i6+%o5]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000010081410] = 53021084, %l2 = 0000000000000000
	lduha	[%i2+%o5]0x80,%l2	! %l2 = 0000000000005302
!	Mem[0000000010081410] = 84100253, %l3 = 0000000000000000
	ldsba	[%i2+%o5]0x88,%l3	! %l3 = 0000000000000053
!	Mem[0000000010141410] = 00000000, %l5 = 00000000000000ff
	lduba	[%i5+%o5]0x80,%l5	! %l5 = 0000000000000000
!	Mem[00000000100c1400] = 00000000, %f31 = 00ff2242
	lda	[%i3+%g0]0x88,%f31	! %f31 = 00000000
!	Mem[0000000030041400] = ffffffff, %l2 = 0000000000005302
	ldsba	[%i1+%g0]0x89,%l2	! %l2 = ffffffffffffffff
!	Mem[0000000010101408] = ff000000ffffffff, %f26 = 66000000 00000000
	ldda	[%i4+%o4]0x80,%f26	! %f26 = ff000000 ffffffff
!	Mem[0000000010141400] = 000000ff, %l7 = 0000000000000000
	lduwa	[%i5+%g0]0x80,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030001410] = ffff0000 00000000, %l0 = 47e6412c, %l1 = 00000000
	ldda	[%i0+%o5]0x81,%l0	! %l0 = 00000000ffff0000 0000000000000000
!	Mem[0000000010181408] = 00000000000000ff, %f10 = ff0d0040 ffffffff
	ldda	[%i6+%o4]0x88,%f10	! %f10 = 00000000 000000ff

p0_label_173:
!	Starting 10 instruction Store Burst
!	%l5 = 0000000000000000, Mem[00000000100c1400] = 00000000
	stha	%l5,[%i3+%g0]0x80	! Mem[00000000100c1400] = 00000000
!	%l6 = 000000000000ffff, Mem[0000000030081410] = 0000ff0000000000
	stxa	%l6,[%i2+%o5]0x81	! Mem[0000000030081410] = 000000000000ffff
!	Mem[0000000010081408] = ffff000000000027, %l2 = ffffffffffffffff, %l0 = 00000000ffff0000
	add	%i2,0x08,%g1
	casxa	[%g1]0x80,%l2,%l0	! %l0 = ffff000000000027
!	%l5 = 0000000000000000, imm = fffffffffffff6fe, %l0 = ffff000000000027
	sub	%l5,-0x902,%l0		! %l0 = 0000000000000902
!	%l4 = 0000000000005302, Mem[0000000010081410] = 53021084e4bdffff, %asi = 80
	stxa	%l4,[%i2+0x010]%asi	! Mem[0000000010081410] = 0000000000005302
!	%l0 = 0000000000000902, Mem[0000000010041410] = 00000000
	stwa	%l0,[%i1+%o5]0x80	! Mem[0000000010041410] = 00000902
!	Mem[00000000100c142c] = 00000000, %l5 = 00000000, %l5 = 00000000
	add	%i3,0x2c,%g1
	casa	[%g1]0x80,%l5,%l5	! %l5 = 0000000000000000
!	%f21 = ffff0000, %f1  = 25c8dd22, %f18 = 00000000
	fdivs	%f21,%f1 ,%f18		! %f18 = ffff0000
!	%l7 = 00000000000000ff, Mem[0000000030081410] = ffff000000000000
	stxa	%l7,[%i2+%o5]0x89	! Mem[0000000030081410] = 00000000000000ff
!	%f6  = fffd87a6 60000000, Mem[0000000030101400] = ff466624 0000003d
	stda	%f6 ,[%i4+%g0]0x81	! Mem[0000000030101400] = fffd87a6 60000000

p0_label_174:
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = 00000000e4ffffff, %l4 = 0000000000005302
	ldxa	[%i3+%g0]0x89,%l4	! %l4 = 00000000e4ffffff
!	Mem[0000000010181408] = ff000000, %l6 = 000000000000ffff
	ldsha	[%i6+%o4]0x80,%l6	! %l6 = ffffffffffffff00
!	Mem[00000000300c1408] = ff00ddff, %l4 = 00000000e4ffffff
	ldswa	[%i3+%o4]0x81,%l4	! %l4 = ffffffffff00ddff
!	Mem[0000000010041408] = ff00009a, %l4 = ffffffffff00ddff
	ldsba	[%i1+%o4]0x80,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000030101408] = 00000000 00000000, %l4 = ffffffff, %l5 = 00000000
	ldda	[%i4+%o4]0x89,%l4	! %l4 = 0000000000000000 0000000000000000
!	Mem[0000000010001410] = 00000000, %l3 = 0000000000000053
	ldswa	[%i0+%o5]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000030181400] = 0000ff77, %f9  = 246646ff
	lda	[%i6+%g0]0x81,%f9 	! %f9 = 0000ff77
!	Mem[0000000010181408] = 000000ff, %l0 = 0000000000000902
	lduwa	[%i6+%o4]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010101408] = ff000000, %l6 = ffffffffffffff00
	ldsha	[%i4+%o4]0x80,%l6	! %l6 = ffffffffffffff00
!	Mem[0000000030141400] = 00000000, %l4 = 0000000000000000
	ldsha	[%i5+%g0]0x81,%l4	! %l4 = 0000000000000000

p0_label_175:
!	Starting 10 instruction Store Burst
!	%l6 = ffffffffffffff00, Mem[00000000201c0000] = 0d002520, %asi = 80
	stha	%l6,[%o0+0x000]%asi	! Mem[00000000201c0000] = ff002520
!	Mem[0000000030001408] = 0000004f, %l4 = 0000000000000000
	swapa	[%i0+%o4]0x89,%l4	! %l4 = 000000000000004f
!	Mem[0000000030041408] = ffffffff, %l1 = 0000000000000000
	swapa	[%i1+%o4]0x81,%l1	! %l1 = 00000000ffffffff
!	%l6 = ffffffffffffff00, imm = fffffffffffff5e4, %l2 = ffffffffffffffff
	orn	%l6,-0xa1c,%l2		! %l2 = ffffffffffffff1b
!	%f20 = ff0d00ff ffff0000, %l2 = ffffffffffffff1b
!	Mem[0000000010101400] = 00ff0000ffffffff
	stda	%f20,[%i4+%l2]ASI_PST8_PL ! Mem[0000000010101400] = 000000ffffffffff
!	%f14 = 00466624 5d0f91ef, Mem[0000000030101408] = 00000000 00000000
	stda	%f14,[%i4+%o4]0x89	! Mem[0000000030101408] = 00466624 5d0f91ef
!	Mem[0000000021800080] = 04063640, %l2 = ffffffffffffff1b
	ldstuba	[%o3+0x080]%asi,%l2	! %l2 = 0000000000000004
!	Mem[0000000010141410] = 00000000, %l3 = 0000000000000000
	swapa	[%i5+%o5]0x88,%l3	! %l3 = 0000000000000000
!	%f9  = 0000ff77, Mem[0000000010041418] = 54f28996
	st	%f9 ,[%i1+0x018]	! Mem[0000000010041418] = 0000ff77
!	%f20 = ff0d00ff ffff0000, Mem[0000000010041408] = 9a0000ff 00000000
	stda	%f20,[%i1+%o4]0x88	! Mem[0000000010041408] = ff0d00ff ffff0000

p0_label_176:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = 000000ffffffffff, %l3 = 0000000000000000, %asi = 80
	ldxa	[%i4+0x000]%asi,%l3	! %l3 = 000000ffffffffff
!	Mem[0000000010081420] = 00000000000000ff, %f22 = f395ec7f 4a310e7e
	ldd	[%i2+0x020],%f22	! %f22 = 00000000 000000ff
!	%f2  = 00000071, %f16 = ffffffff
	fitos	%f2 ,%f16		! %f16 = 42e20000
!	Mem[0000000010141400] = 000000ff, %l3 = 000000ffffffffff
	ldsha	[%i5+%g0]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000030141408] = ff00009a, %l7 = 00000000000000ff
	lduha	[%i5+%o4]0x81,%l7	! %l7 = 000000000000ff00
!	Mem[0000000010081400] = 00000000, %l4 = 000000000000004f
	lduha	[%i2+%g0]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000010101438] = ff0d004000000000, %l5 = 0000000000000000
	ldx	[%i4+0x038],%l5		! %l5 = ff0d004000000000
!	Mem[0000000010101438] = ff0d0040, %l0 = 00000000000000ff
	ldsw	[%i4+0x038],%l0		! %l0 = ffffffffff0d0040
!	Mem[0000000030041400] = ffffffff, %f17 = 0000ff00
	lda	[%i1+%g0]0x89,%f17	! %f17 = ffffffff
!	Mem[0000000030041408] = 00ff000000000000, %l5 = ff0d004000000000
	ldxa	[%i1+%o4]0x89,%l5	! %l5 = 00ff000000000000

p0_label_177:
!	Starting 10 instruction Store Burst
!	%l7 = 000000000000ff00, Mem[0000000030041408] = 00000000
	stha	%l7,[%i1+%o4]0x81	! Mem[0000000030041408] = ff000000
!	%f20 = ff0d00ff, Mem[0000000010041438] = 00ff2242
	st	%f20,[%i1+0x038]	! Mem[0000000010041438] = ff0d00ff
!	%f8  = 3d000000 0000ff77, Mem[0000000010041410] = 02090000 ffffffff
	stda	%f8 ,[%i1+%o5]0x88	! Mem[0000000010041410] = 3d000000 0000ff77
!	%f18 = ffff0000 25c8dd22, Mem[0000000010041400] = 00000000 00000000
	stda	%f18,[%i1+%g0]0x80	! Mem[0000000010041400] = ffff0000 25c8dd22
!	Mem[0000000010101408] = ff000000, %l7 = 000000000000ff00
	swapa	[%i4+%o4]0x80,%l7	! %l7 = 00000000ff000000
!	%l2 = 00000004, %l3 = 00000000, Mem[0000000010041438] = ff0d00ff 49a8c80b, %asi = 80
	stda	%l2,[%i1+0x038]%asi	! Mem[0000000010041438] = 00000004 00000000
!	Mem[0000000030001400] = 00000000, %l3 = 0000000000000000
	ldstuba	[%i0+%g0]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000030081410] = ff000000, %l7 = 00000000ff000000
	ldstuba	[%i2+%o5]0x81,%l7	! %l7 = 00000000000000ff
!	%l3 = 0000000000000000, Mem[0000000010181408] = 000000ff
	stha	%l3,[%i6+%o4]0x88	! Mem[0000000010181408] = 00000000
!	%f9  = 0000ff77, Mem[00000000300c1400] = e4ffffff
	sta	%f9 ,[%i3+%g0]0x89	! Mem[00000000300c1400] = 0000ff77

p0_label_178:
!	Starting 10 instruction Load Burst
!	Mem[0000000030081400] = 02530000, %l7 = 00000000000000ff
	lduha	[%i2+%g0]0x81,%l7	! %l7 = 0000000000000253
!	Mem[0000000030101400] = 00000060a687fdff, %f4  = 00000000 25c8dd22
	ldda	[%i4+%g0]0x89,%f4 	! %f4  = 00000060 a687fdff
!	Mem[00000000201c0000] = ff002520, %l0 = ffffffffff0d0040
	lduh	[%o0+%g0],%l0		! %l0 = 000000000000ff00
!	Mem[0000000010141400] = 00000000ff000000, %l3 = 0000000000000000
	ldxa	[%i5+%g0]0x88,%l3	! %l3 = 00000000ff000000
!	Mem[0000000030141408] = 9a0000ff, %l5 = 00ff000000000000
	ldswa	[%i5+%o4]0x89,%l5	! %l5 = ffffffff9a0000ff
!	Mem[00000000100c1418] = fffd87a660000000, %l6 = ffffffffffffff00
	ldx	[%i3+0x018],%l6		! %l6 = fffd87a660000000
!	Mem[00000000100c1408] = 00005302, %l4 = 0000000000000000
	lduba	[%i3+%o4]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000010141408] = 00000071ffffffff, %f30 = 00000000 00000000
	ldda	[%i5+%o4]0x80,%f30	! %f30 = 00000071 ffffffff
!	Mem[0000000030001400] = ff000000, %l7 = 0000000000000253
	ldsha	[%i0+%g0]0x81,%l7	! %l7 = ffffffffffffff00
!	Mem[0000000010001427] = 00000027, %l0 = 000000000000ff00
	ldsb	[%i0+0x027],%l0		! %l0 = 0000000000000027

p0_label_179:
!	Starting 10 instruction Store Burst
!	%l0 = 0000000000000027, Mem[0000000010041410] = 77ff0000
	stba	%l0,[%i1+%o5]0x80	! Mem[0000000010041410] = 27ff0000
!	Mem[00000000300c1408] = ff00ddff, %l4 = 0000000000000000
	ldstuba	[%i3+%o4]0x81,%l4	! %l4 = 00000000000000ff
!	%f8  = 3d000000, Mem[0000000010101400] = ff000000
	sta	%f8 ,[%i4+%g0]0x88	! Mem[0000000010101400] = 3d000000
!	%f20 = ff0d00ff, Mem[0000000010001410] = 00000000
	sta	%f20,[%i0+%o5]0x88	! Mem[0000000010001410] = ff0d00ff
!	Mem[0000000010101413] = 710b1e77, %l2 = 0000000000000004
	ldstub	[%i4+0x013],%l2		! %l2 = 0000000000000077
!	%f0  = 00000000, %f22 = 00000000, %f3  = ffffffff
	fsubs	%f0 ,%f22,%f3 		! %f3  = 00000000
!	%l1 = 00000000ffffffff, Mem[0000000010141418] = 00000000000000ff, %asi = 80
	stxa	%l1,[%i5+0x018]%asi	! Mem[0000000010141418] = 00000000ffffffff
!	Mem[0000000030001400] = 000000ff, %l3 = 00000000ff000000
	lduha	[%i0+%g0]0x89,%l3	! %l3 = 00000000000000ff
!	%f13 = 00000027, %f31 = ffffffff, %f18 = ffff0000
	fdivs	%f13,%f31,%f18		! %f18 = ffffffff
!	Mem[0000000010041410] = 0000ff27, %l0 = 0000000000000027
	ldstuba	[%i1+%o5]0x88,%l0	! %l0 = 0000000000000027

p0_label_180:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = 00000000, %l4 = 00000000000000ff
	ldsba	[%i6+%o4]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000010041410] = 0000ffff, %l6 = fffd87a660000000
	ldswa	[%i1+%o5]0x88,%l6	! %l6 = 000000000000ffff
!	Mem[00000000211c0000] = 00007fb0, %l5 = ffffffff9a0000ff
	ldsh	[%o2+%g0],%l5		! %l5 = 0000000000000000
!	Mem[0000000010081408] = 0000ffff, %f17 = ffffffff
	lda	[%i2+%o4]0x88,%f17	! %f17 = 0000ffff
!	Mem[0000000010041415] = 0000003d, %l3 = 00000000000000ff, %asi = 80
	ldsba	[%i1+0x015]%asi,%l3	! %l3 = 0000000000000000
!	Mem[0000000010141410] = 00000000ff000000, %l5 = 0000000000000000
	ldxa	[%i5+%o5]0x80,%l5	! %l5 = 00000000ff000000
!	Mem[00000000100c1414] = 00ff2242, %l2 = 0000000000000077
	lduw	[%i3+0x014],%l2		! %l2 = 0000000000ff2242
!	Mem[0000000010081408] = ffff0000, %l1 = 00000000ffffffff
	ldswa	[%i2+%o4]0x80,%l1	! %l1 = ffffffffffff0000
!	Mem[0000000010081410] = 00000000, %l7 = ffffffffffffff00
	lduwa	[%i2+%o5]0x80,%l7	! %l7 = 0000000000000000
!	Mem[00000000100c1408] = 02530000, %f20 = ff0d00ff
	lda	[%i3+%o4]0x88,%f20	! %f20 = 02530000

p0_label_181:
!	Starting 10 instruction Store Burst
!	Mem[0000000010001424] = 00000027, %l4 = 0000000000000000, %asi = 80
	swapa	[%i0+0x024]%asi,%l4	! %l4 = 0000000000000027
!	%l0 = 0000000000000027, Mem[0000000010141410] = 00000000
	stba	%l0,[%i5+%o5]0x88	! Mem[0000000010141410] = 00000027
!	Mem[0000000030041410] = 22ddc825, %l5 = 00000000ff000000
	ldstuba	[%i1+%o5]0x81,%l5	! %l5 = 0000000000000022
!	%f23 = 000000ff, Mem[000000001018141c] = ff000000
	sta	%f23,[%i6+0x01c]%asi	! Mem[000000001018141c] = 000000ff
!	%f16 = 42e20000 0000ffff, %l0 = 0000000000000027
!	Mem[0000000030141408] = ff00009a00000066
	add	%i5,0x008,%g1
	stda	%f16,[%g1+%l0]ASI_PST8_S ! Mem[0000000030141408] = ff00009a0000ffff
!	Mem[0000000010001400] = ff002200, %l1 = ffffffffffff0000
	ldstuba	[%i0+%g0]0x88,%l1	! %l1 = 0000000000000000
!	%l4 = 0000000000000027, immd = fffff196, %y  = 00000000
	sdiv	%l4,-0xe6a,%l6		! %l6 = 0000000000000000
	mov	%l0,%y			! %y = 00000027
!	%f19 = 25c8dd22, Mem[0000000010141408] = 00000071
	st	%f19,[%i5+%o4]		! Mem[0000000010141408] = 25c8dd22
!	%l0 = 0000000000000027, Mem[0000000010141420] = 5dffcdf8, %asi = 80
	stba	%l0,[%i5+0x020]%asi	! Mem[0000000010141420] = 27ffcdf8
!	Mem[0000000010041400] = ffff0000, %l3 = 0000000000000000
	ldstuba	[%i1+%g0]0x80,%l3	! %l3 = 00000000000000ff

p0_label_182:
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = 00000000, %l7 = 0000000000000000
	ldswa	[%i0+%o4]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000010001408] = ffffffff, %l4 = 0000000000000027
	lduha	[%i0+%o4]0x80,%l4	! %l4 = 000000000000ffff
!	Mem[0000000010081402] = 00000000, %l1 = 0000000000000000, %asi = 80
	ldsba	[%i2+0x002]%asi,%l1	! %l1 = 0000000000000000
!	Mem[0000000030181400] = 0000ff77 5d0f91ef, %l6 = 00000000, %l7 = 00000000
	ldda	[%i6+%g0]0x81,%l6	! %l6 = 000000000000ff77 000000005d0f91ef
!	Mem[0000000030041408] = ff0000000000ff00, %f22 = 00000000 000000ff
	ldda	[%i1+%o4]0x81,%f22	! %f22 = ff000000 0000ff00
!	Mem[0000000030141408] = ff00009a, %l0 = 0000000000000027
	ldsba	[%i5+%o4]0x81,%l0	! %l0 = ffffffffffffffff
!	Mem[00000000100c1400] = 22ddc82500000000, %f30 = 00000071 ffffffff
	ldda	[%i3+%g0]0x88,%f30	! %f30 = 22ddc825 00000000
!	Mem[00000000100c140c] = 000000ff, %l5 = 0000000000000022
	lduh	[%i3+0x00c],%l5		! %l5 = 0000000000000000
	membar	#Sync			! Added by membar checker (33)
!	Mem[0000000010001400] = ff2200ff 00000027 ffffffff ffffffff
!	Mem[0000000010001410] = ff000dff 00005302 7e0e314a 7fec95f3
!	Mem[0000000010001420] = 77ff0000 00000000 00000000 00000066
!	Mem[0000000010001430] = 000000ff 00000022 25c8dd22 6edccca1
	ldda	[%i0+%g0]ASI_BLK_AIUP,%f16	! Block Load from 0000000010001400
!	%f1  = 25c8dd22, %f13 = 00000027
	fsqrts	%f1 ,%f13		! %f13 = 32a0585c

p0_label_183:
!	Starting 10 instruction Store Burst
!	%l7 = 000000005d0f91ef, Mem[0000000010181410] = 0000000073000000
	stxa	%l7,[%i6+%o5]0x88	! Mem[0000000010181410] = 000000005d0f91ef
!	%l2 = 0000000000ff2242, Mem[0000000010141408] = 22ddc825
	stwa	%l2,[%i5+%o4]0x88	! Mem[0000000010141408] = 00ff2242
!	Mem[0000000010081430] = 0d789c76, %l1 = 0000000000000000, %asi = 80
	swapa	[%i2+0x030]%asi,%l1	! %l1 = 000000000d789c76
!	%l4 = 0000ffff, %l5 = 00000000, Mem[0000000010041410] = 0000ffff 3d000000
	stda	%l4,[%i1+%o5]0x88	! Mem[0000000010041410] = 0000ffff 00000000
!	Mem[0000000010141408] = 00ff2242, %l6 = 000000000000ff77
	ldstuba	[%i5+%o4]0x88,%l6	! %l6 = 0000000000000042
!	Mem[00000000211c0001] = 00007fb0, %l4 = 000000000000ffff
	ldstuba	[%o2+0x001]%asi,%l4	! %l4 = 0000000000000000
!	Mem[0000000030101400] = fffd87a6 60000000 ef910f5d 24664600
!	%f0  = 00000000 25c8dd22 00000071 00000000
!	%f4  = 00000060 a687fdff fffd87a6 60000000
!	%f8  = 3d000000 0000ff77 00000000 000000ff
!	%f12 = 0000ddff 32a0585c 00466624 5d0f91ef
	stda	%f0 ,[%i4+%g0]ASI_BLK_AIUSL	! Block Store to 0000000030101400
!	Mem[0000000030041400] = ffffffff, %l1 = 000000000d789c76
	lduha	[%i1+%g0]0x89,%l1	! %l1 = 000000000000ffff
!	Mem[0000000030001408] = 00000000, %l5 = 0000000000000000
	ldstuba	[%i0+%o4]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000010141408] = 00ff22ff, %l7 = 000000005d0f91ef
	ldstuba	[%i5+%o4]0x88,%l7	! %l7 = 00000000000000ff

p0_label_184:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1428] = ff0d0040, %f25 = 00000000
	lda	[%i3+0x028]%asi,%f25	! %f25 = ff0d0040
!	Mem[0000000010141408] = ffffffff 00ff22ff, %l2 = 00ff2242, %l3 = 000000ff
	ldda	[%i5+%o4]0x88,%l2	! %l2 = 0000000000ff22ff 00000000ffffffff
!	Mem[0000000030081408] = 00000000, %l4 = 0000000000000000
	lduha	[%i2+%o4]0x81,%l4	! %l4 = 0000000000000000
!	Mem[00000000100c1418] = fffd87a6, %l1 = 000000000000ffff, %asi = 80
	ldswa	[%i3+0x018]%asi,%l1	! %l1 = fffffffffffd87a6
!	Mem[000000001004143c] = 00000000, %l7 = 00000000000000ff
	lduw	[%i1+0x03c],%l7		! %l7 = 0000000000000000
!	Mem[0000000010081408] = ffff0000, %l3 = 00000000ffffffff
	ldswa	[%i2+%o4]0x80,%l3	! %l3 = ffffffffffff0000
!	Mem[0000000010081418] = ff368e9a, %f29 = 00000022
	ld	[%i2+0x018],%f29	! %f29 = ff368e9a
!	Mem[0000000020800001] = 0000c750, %l6 = 0000000000000042
	ldub	[%o1+0x001],%l6		! %l6 = 0000000000000000
!	Mem[0000000030181400] = 0000ff77 5d0f91ef, %l4 = 00000000, %l5 = 00000000
	ldda	[%i6+%g0]0x81,%l4	! %l4 = 000000000000ff77 000000005d0f91ef
!	Mem[00000000211c0000] = 00ff7fb0, %l4 = 000000000000ff77
	ldsh	[%o2+%g0],%l4		! %l4 = 00000000000000ff

p0_label_185:
!	Starting 10 instruction Store Burst
!	Mem[00000000218000c0] = ffffc070, %l4 = 00000000000000ff
	ldstub	[%o3+0x0c0],%l4		! %l4 = 00000000000000ff
!	%l2 = 0000000000ff22ff, Mem[0000000010101400] = 3d000000
	stwa	%l2,[%i4+%g0]0x88	! Mem[0000000010101400] = 00ff22ff
!	%f16 = ff2200ff, Mem[0000000010181424] = ffffffdf
	st	%f16,[%i6+0x024]	! Mem[0000000010181424] = ff2200ff
!	%f6  = fffd87a6 60000000, Mem[0000000010081400] = 00000000 84100253
	stda	%f6 ,[%i2+%g0]0x88	! Mem[0000000010081400] = fffd87a6 60000000
!	%f6  = fffd87a6 60000000, %l1 = fffffffffffd87a6
!	Mem[0000000010181430] = 00ffffff00ffffff
	add	%i6,0x030,%g1
	stda	%f6,[%g1+%l1]ASI_PST32_PL ! Mem[0000000010181430] = 00ffffffa687fdff
!	Mem[0000000030141408] = 9a0000ff, %l1 = fffffffffffd87a6
	ldstuba	[%i5+%o4]0x89,%l1	! %l1 = 00000000000000ff
!	%f6  = fffd87a6 60000000, Mem[0000000010081410] = 00000000 00005302
	stda	%f6 ,[%i2+%o5]0x80	! Mem[0000000010081410] = fffd87a6 60000000
!	%f24 = 77ff0000 ff0d0040, Mem[0000000030141408] = ff00009a 0000ffff
	stda	%f24,[%i5+%o4]0x81	! Mem[0000000030141408] = 77ff0000 ff0d0040
!	%f12 = 0000ddff 32a0585c, Mem[0000000010141428] = 00000000 e4bdffff, %asi = 80
	stda	%f12,[%i5+0x028]%asi	! Mem[0000000010141428] = 0000ddff 32a0585c
!	%f6  = fffd87a6 60000000, Mem[0000000030001408] = 000000ff 00000000
	stda	%f6 ,[%i0+%o4]0x89	! Mem[0000000030001408] = fffd87a6 60000000

p0_label_186:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = ffffffff ffffffff, %l0 = ffffffff, %l1 = 000000ff
	ldda	[%i0+%o4]0x88,%l0	! %l0 = 00000000ffffffff 00000000ffffffff
!	Mem[0000000010181400] = 00000000, %f19 = ffffffff
	lda	[%i6+%g0]0x80,%f19	! %f19 = 00000000
!	Mem[00000000100c1408] = 02530000, %l2 = 0000000000ff22ff
	lduwa	[%i3+%o4]0x88,%l2	! %l2 = 0000000002530000
!	Mem[000000001018140a] = 00000000, %l1 = 00000000ffffffff
	ldub	[%i6+0x00a],%l1		! %l1 = 0000000000000000
!	Mem[0000000030081410] = ff00000000000000, %f22 = 7e0e314a 7fec95f3
	ldda	[%i2+%o5]0x81,%f22	! %f22 = ff000000 00000000
!	Mem[00000000100c1420] = 3d000000246646ff, %f16 = ff2200ff 00000027
	ldd	[%i3+0x020],%f16	! %f16 = 3d000000 246646ff
!	Mem[0000000030181408] = ff000000, %l0 = 00000000ffffffff
	lduba	[%i6+%o4]0x81,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010141408] = 00ff22ff, %f18 = ffffffff
	lda	[%i5+%o4]0x88,%f18	! %f18 = 00ff22ff
!	Mem[0000000010181430] = 00ffffff, %l4 = 00000000000000ff, %asi = 80
	ldsha	[%i6+0x030]%asi,%l4	! %l4 = 00000000000000ff
!	Mem[00000000201c0000] = ff002520, %l4 = 00000000000000ff, %asi = 80
	ldsba	[%o0+0x000]%asi,%l4	! %l4 = ffffffffffffffff

p0_label_187:
!	Starting 10 instruction Store Burst
!	%l2 = 0000000002530000, Mem[0000000020800040] = 0000e580, %asi = 80
	stha	%l2,[%o1+0x040]%asi	! Mem[0000000020800040] = 0000e580
!	Mem[0000000030181408] = 000000ff, %l7 = 0000000000000000
	ldstuba	[%i6+%o4]0x89,%l7	! %l7 = 00000000000000ff
!	%l4 = ffffffffffffffff, Mem[0000000030181408] = ff00000000000000
	stxa	%l4,[%i6+%o4]0x81	! Mem[0000000030181408] = ffffffffffffffff
	membar	#Sync			! Added by membar checker (34)
!	Mem[0000000030101410] = fffd87a6, %l7 = 00000000000000ff
	swapa	[%i4+%o5]0x81,%l7	! %l7 = 00000000fffd87a6
!	Mem[00000000100c1410] = 00000000, %l6 = 0000000000000000
	swapa	[%i3+%o5]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000010181410] = ef910f5d, %l5 = 000000005d0f91ef
	swapa	[%i6+%o5]0x80,%l5	! %l5 = 00000000ef910f5d
!	%l2 = 02530000, %l3 = ffff0000, Mem[0000000030181400] = 0000ff77 5d0f91ef
	stda	%l2,[%i6+%g0]0x81	! Mem[0000000030181400] = 02530000 ffff0000
!	%l3 = ffffffffffff0000, Mem[0000000030101408] = 00000000
	stba	%l3,[%i4+%o4]0x89	! Mem[0000000030101408] = 00000000
!	Mem[0000000030141400] = 00000000, %l7 = 00000000fffd87a6
	swapa	[%i5+%g0]0x81,%l7	! %l7 = 0000000000000000
!	%l3 = ffffffffffff0000, Mem[0000000010001400] = ff2200ff
	stha	%l3,[%i0+%g0]0x80	! Mem[0000000010001400] = 000000ff

p0_label_188:
!	Starting 10 instruction Load Burst
!	Mem[0000000030141410] = 00000000 00000000, %l0 = 000000ff, %l1 = 00000000
	ldda	[%i5+%o5]0x89,%l0	! %l0 = 0000000000000000 0000000000000000
!	Mem[0000000010181438] = 00000000, %l6 = 0000000000000000, %asi = 80
	lduwa	[%i6+0x038]%asi,%l6	! %l6 = 0000000000000000
!	Mem[00000000211c0000] = 00ff7fb0, %l4 = ffffffffffffffff
	ldsh	[%o2+%g0],%l4		! %l4 = 00000000000000ff
!	%f21 = 00005302, %f26 = 00000000, %f22 = ff000000
	fdivs	%f21,%f26,%f22		! %f22 = 7f800000
!	Mem[0000000030001400] = ff000000, %f13 = 32a0585c
	lda	[%i0+%g0]0x81,%f13	! %f13 = ff000000
!	Mem[0000000030041400] = ffffffff, %l0 = 0000000000000000
	lduha	[%i1+%g0]0x81,%l0	! %l0 = 000000000000ffff
!	Mem[0000000030141410] = 0000000000000000, %l6 = 0000000000000000
	ldxa	[%i5+%o5]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000030101408] = 00000000, %l2 = 0000000002530000
	ldsba	[%i4+%o4]0x89,%l2	! %l2 = 0000000000000000
!	Mem[00000000300c1408] = ff00ddff00000027, %l6 = 0000000000000000
	ldxa	[%i3+%o4]0x81,%l6	! %l6 = ff00ddff00000027
!	Mem[0000000010181410] = 5d0f91ef, %l0 = 000000000000ffff
	lduha	[%i6+%o5]0x80,%l0	! %l0 = 0000000000005d0f

p0_label_189:
!	Starting 10 instruction Store Burst
!	%f18 = 00ff22ff 00000000, Mem[0000000030081410] = ff000000 00000000
	stda	%f18,[%i2+%o5]0x81	! Mem[0000000030081410] = 00ff22ff 00000000
!	%f6  = fffd87a6 60000000, %l0 = 0000000000005d0f
!	Mem[0000000030101438] = ef910f5d24664600
	add	%i4,0x038,%g1
	stda	%f6,[%g1+%l0]ASI_PST32_S ! Mem[0000000030101438] = fffd87a660000000
!	%l1 = 0000000000000000, Mem[0000000010081400] = 00000060a687fdff
	stxa	%l1,[%i2+%g0]0x80	! Mem[0000000010081400] = 0000000000000000
!	%l6 = ff00ddff00000027, Mem[0000000010081400] = 00000000
	stha	%l6,[%i2+%g0]0x80	! Mem[0000000010081400] = 00270000
!	%f24 = 77ff0000, Mem[0000000030141408] = 0000ff77
	sta	%f24,[%i5+%o4]0x89	! Mem[0000000030141408] = 77ff0000
!	%f20 = ff000dff 00005302, Mem[00000000100c1418] = fffd87a6 60000000
	std	%f20,[%i3+0x018]	! Mem[00000000100c1418] = ff000dff 00005302
!	%l1 = 0000000000000000, Mem[0000000010081410] = fffd87a6
	stwa	%l1,[%i2+%o5]0x80	! Mem[0000000010081410] = 00000000
!	%l5 = 00000000ef910f5d, Mem[0000000030141408] = 40000dff77ff0000
	stxa	%l5,[%i5+%o4]0x89	! Mem[0000000030141408] = 00000000ef910f5d
!	%l0 = 00005d0f, %l1 = 00000000, Mem[0000000030181400] = 02530000 ffff0000
	stda	%l0,[%i6+%g0]0x81	! Mem[0000000030181400] = 00005d0f 00000000
!	Code Fragment 4, seed = 751484
p0_fragment_16:
!	%l0 = 0000000000005d0f
	setx	0x2e43974f9e97f846,%g7,%l0 ! %l0 = 2e43974f9e97f846
!	%l1 = 0000000000000000
	setx	0xd43de59334b0b271,%g7,%l1 ! %l1 = d43de59334b0b271
	setx    0x7ff8, %g1, %g2
	and     %l0, %g2, %l0
	setx    0xffffffff, %g1, %g2
	and     %l1, %g2, %l1
	setx    0x100000000, %g1, %g2
	or      %l1, %g2, %l1 ! Set bit 32 - perrinj
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_ICACHE_INSTR
	ta      T_CHANGE_NONHPRIV
!	%l0 = 2e43974f9e97f846
	setx	0xe1f6d8cf6997f0ac,%g7,%l0 ! %l0 = e1f6d8cf6997f0ac
!	%l1 = d43de59334b0b271
	setx	0xabcb43250963b5f7,%g7,%l1 ! %l1 = abcb43250963b5f7
p0_fragment_16_end:

p0_label_190:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = ffffffff, %l7 = 0000000000000000
	lduha	[%i0+%o4]0x88,%l7	! %l7 = 000000000000ffff
!	Mem[0000000021800100] = ff78c6a0, %l7 = 000000000000ffff
	lduh	[%o3+0x100],%l7		! %l7 = 000000000000ff78
!	Mem[0000000030101410] = 000000ff60000000, %l5 = 00000000ef910f5d
	ldxa	[%i4+%o5]0x81,%l5	! %l5 = 000000ff60000000
!	Mem[0000000010081422] = 00000000, %l7 = 000000000000ff78
	ldub	[%i2+0x022],%l7		! %l7 = 0000000000000000
!	Mem[0000000010181408] = 0000000000000000, %f10 = 00000000 000000ff
	ldda	[%i6+%o4]0x88,%f10	! %f10 = 00000000 00000000
!	Mem[00000000100c1438] = 004666245d0f91ef, %l4 = 00000000000000ff
	ldx	[%i3+0x038],%l4		! %l4 = 004666245d0f91ef
!	Mem[0000000030001400] = 000000ff, %l3 = ffffffffffff0000
	lduba	[%i0+%g0]0x89,%l3	! %l3 = 00000000000000ff
!	%f14 = 00466624 5d0f91ef, %f4  = 00000060
	fdtos	%f14,%f4 		! %f4  = 00000000
!	Mem[0000000010001400] = 000000ff, %l4 = 004666245d0f91ef
	ldsha	[%i0+%g0]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000010081408] = ffff0000, %l3 = 00000000000000ff
	lduba	[%i2+%o4]0x80,%l3	! %l3 = 00000000000000ff

p0_label_191:
!	Starting 10 instruction Store Burst
!	%l5 = 000000ff60000000, Mem[0000000010001408] = ffffffffffffffff
	stxa	%l5,[%i0+%o4]0x88	! Mem[0000000010001408] = 000000ff60000000
!	Mem[0000000030181410] = 00000000, %l3 = 00000000000000ff
	ldstuba	[%i6+%o5]0x89,%l3	! %l3 = 0000000000000000
!	%l2 = 0000000000000000, Mem[00000000211c0000] = 00ff7fb0
	sth	%l2,[%o2+%g0]		! Mem[00000000211c0000] = 00007fb0
!	%f27 = 00000066, Mem[0000000030101408] = 00000000
	sta	%f27,[%i4+%o4]0x81	! Mem[0000000030101408] = 00000066
!	%l6 = ff00ddff00000027, %l1 = abcb43250963b5f7, %l7 = 0000000000000000
	orn	%l6,%l1,%l7		! %l7 = ff34fdfff69c4a2f
!	%l5 = 000000ff60000000, Mem[0000000030181408] = ffffffff
	stwa	%l5,[%i6+%o4]0x89	! Mem[0000000030181408] = 60000000
!	%l6 = ff00ddff00000027, Mem[0000000010101432] = fff302e4, %asi = 80
	stba	%l6,[%i4+0x032]%asi	! Mem[0000000010101430] = fff327e4
!	%l6 = ff00ddff00000027, Mem[00000000100c1420] = 3d000000246646ff
	stx	%l6,[%i3+0x020]		! Mem[00000000100c1420] = ff00ddff00000027
!	%f20 = ff000dff 00005302, Mem[0000000010041408] = 0000ffff ff000dff
	stda	%f20,[%i1+%o4]0x80	! Mem[0000000010041408] = ff000dff 00005302
!	%f10 = 00000000 00000000, %l6 = ff00ddff00000027
!	Mem[0000000030181438] = 25c8dd226edccca1
	add	%i6,0x038,%g1
	stda	%f10,[%g1+%l6]ASI_PST8_SL ! Mem[0000000030181438] = 000000226e00cca1

p0_label_192:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001418] = 7e0e314a 7fec95f3, %l6 = 00000027, %l7 = f69c4a2f, %asi = 80
	ldda	[%i0+0x018]%asi,%l6	! %l6 = 000000007e0e314a 000000007fec95f3
!	Mem[0000000010081400] = 00270000, %l7 = 000000007fec95f3, %asi = 80
	ldswa	[%i2+0x000]%asi,%l7	! %l7 = 0000000000270000
!	Mem[00000000201c0001] = ff002520, %l7 = 0000000000270000
	ldsb	[%o0+0x001],%l7		! %l7 = 0000000000000000
!	Mem[0000000030101408] = 0000007166000000, %f8  = 3d000000 0000ff77
	ldda	[%i4+%o4]0x89,%f8 	! %f8  = 00000071 66000000
!	Mem[0000000010141400] = ff000000, %l5 = 000000ff60000000
	ldsha	[%i5+%g0]0x88,%l5	! %l5 = 0000000000000000
!	Mem[0000000030101408] = 00000066, %l1 = abcb43250963b5f7
	lduha	[%i4+%o4]0x81,%l1	! %l1 = 0000000000000000
!	%l4 = 0000000000000000, %l7 = 0000000000000000, %l1 = 0000000000000000
	xnor	%l4,%l7,%l1		! %l1 = ffffffffffffffff
!	Mem[0000000030001408] = 60000000, %f28 = 000000ff
	lda	[%i0+%o4]0x89,%f28	! %f28 = 60000000
!	Mem[0000000010081400] = 00002700, %l7 = 0000000000000000
	lduwa	[%i2+%g0]0x88,%l7	! %l7 = 0000000000002700
!	Mem[00000000201c0001] = ff002520, %l3 = 0000000000000000
	ldsb	[%o0+0x001],%l3		! %l3 = 0000000000000000

p0_label_193:
!	Starting 10 instruction Store Burst
!	Mem[00000000201c0001] = ff002520, %l1 = ffffffffffffffff
	ldstub	[%o0+0x001],%l1		! %l1 = 0000000000000000
!	%l7 = 0000000000002700, Mem[0000000030081410] = 00ff22ff00000000
	stxa	%l7,[%i2+%o5]0x81	! Mem[0000000030081410] = 0000000000002700
!	%l6 = 000000007e0e314a, Mem[0000000030181410] = ff000000
	stba	%l6,[%i6+%o5]0x81	! Mem[0000000030181410] = 4a000000
!	Mem[0000000030041408] = 000000ff, %l4 = 0000000000000000
	swapa	[%i1+%o4]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030101408] = 66000000, %l4 = 00000000000000ff
	ldstuba	[%i4+%o4]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000010001428] = 00000000, %l7 = 00002700, %l2 = 00000000
	add	%i0,0x28,%g1
	casa	[%g1]0x80,%l7,%l2	! %l2 = 0000000000000000
!	Mem[0000000010101430] = fff327e4, %l7 = 0000000000002700
	swap	[%i4+0x030],%l7		! %l7 = 00000000fff327e4
!	%f0  = 00000000 25c8dd22, %l0 = e1f6d8cf6997f0ac
!	Mem[0000000030001428] = 6600000047ac1fcb
	add	%i0,0x028,%g1
	stda	%f0,[%g1+%l0]ASI_PST32_S ! Mem[0000000030001428] = 6600000047ac1fcb
!	Mem[0000000030081400] = 02530000 ffff0000 00000000 00ff2242
!	%f0  = 00000000 25c8dd22 00000071 00000000
!	%f4  = 00000000 a687fdff fffd87a6 60000000
!	%f8  = 00000071 66000000 00000000 00000000
!	%f12 = 0000ddff ff000000 00466624 5d0f91ef
	stda	%f0 ,[%i2+%g0]ASI_BLK_AIUS	! Block Store to 0000000030081400
!	%l3 = 0000000000000000, Mem[0000000010101419] = 769c780d
	stb	%l3,[%i4+0x019]		! Mem[0000000010101418] = 7600780d

p0_label_194:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = 000000ff, %l6 = 000000007e0e314a
	lduwa	[%i5+%g0]0x80,%l6	! %l6 = 00000000000000ff
!	Mem[00000000201c0000] = ffff2520, %l7 = 00000000fff327e4, %asi = 80
	ldsba	[%o0+0x000]%asi,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000030001400] = ff000000, %l0 = e1f6d8cf6997f0ac
	ldswa	[%i0+%g0]0x81,%l0	! %l0 = ffffffffff000000
!	Mem[00000000100c1408] = 02530000, %f17 = 246646ff
	lda	[%i3+%o4]0x88,%f17	! %f17 = 02530000
!	Mem[0000000010001408] = 60000000, %l7 = ffffffffffffffff
	ldsba	[%i0+%o4]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000030101400] = 25c8dd22, %l1 = 0000000000000000
	ldsha	[%i4+%g0]0x89,%l1	! %l1 = ffffffffffffdd22
!	Mem[0000000010141410] = 27000000, %l3 = 0000000000000000
	lduba	[%i5+%o5]0x80,%l3	! %l3 = 0000000000000027
!	Mem[00000000100c1408] = 00005302, %f29 = ff368e9a
	lda	[%i3+%o4]0x80,%f29	! %f29 = 00005302
!	Mem[0000000010001436] = 00000022, %l3 = 0000000000000027
	ldsh	[%i0+0x036],%l3		! %l3 = 0000000000000022
!	Mem[0000000021800040] = 0cef2810, %l5 = 0000000000000000
	lduh	[%o3+0x040],%l5		! %l5 = 0000000000000cef

p0_label_195:
!	Starting 10 instruction Store Burst
!	%l0 = ffffffffff000000, Mem[0000000010041410] = 0000ffff
	stba	%l0,[%i1+%o5]0x88	! Mem[0000000010041410] = 0000ff00
	membar	#Sync			! Added by membar checker (35)
!	Mem[0000000010081408] = 0000ffff, %l2 = 0000000000000000
	swapa	[%i2+%o4]0x88,%l2	! %l2 = 000000000000ffff
!	Mem[0000000010141410] = 00000027, %l1 = ffffffffffffdd22
	ldstuba	[%i5+%o5]0x88,%l1	! %l1 = 0000000000000027
!	Mem[0000000020800041] = 0000e580, %l0 = ffffffffff000000
	ldstub	[%o1+0x041],%l0		! %l0 = 0000000000000000
!	Mem[0000000030001410] = ffff0000, %l1 = 0000000000000027
	swapa	[%i0+%o5]0x81,%l1	! %l1 = 00000000ffff0000
!	%f13 = ff000000, %f12 = 0000ddff
	fsqrts	%f13,%f12		! %f12 = 7fffffff
!	Mem[0000000010001400] = 000000ff, %l7 = 0000000000000000
	swapa	[%i0+%g0]0x80,%l7	! %l7 = 00000000000000ff
!	Mem[0000000010141408] = ff22ff00, %l6 = 00000000000000ff
	ldstuba	[%i5+%o4]0x80,%l6	! %l6 = 00000000000000ff
!	%l6 = 00000000000000ff, Mem[00000000300c1408] = ffdd00ff
	stha	%l6,[%i3+%o4]0x89	! Mem[00000000300c1408] = ffdd00ff
!	Mem[0000000010041400] = ffff000025c8dd22, %l1 = 00000000ffff0000, %l3 = 0000000000000022
	casxa	[%i1]0x80,%l1,%l3	! %l3 = ffff000025c8dd22

p0_label_196:
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = ffffffff 00000070 00000000 0000ff00
!	Mem[0000000030041410] = ffddc825 00000000 8fedd10c 0d789c76
!	Mem[0000000030041420] = eaff5022 98a11c6c ffff0000 76c3244e
!	Mem[0000000030041430] = 00000073 00000000 00000000 40000dff
	ldda	[%i1+%g0]ASI_BLK_S,%f16	! Block Load from 0000000030041400
!	Mem[0000000010081410] = 00000000, %l7 = 00000000000000ff
	ldsba	[%i2+%o5]0x80,%l7	! %l7 = 0000000000000000
!	Mem[00000000300c1410] = 00000000, %l5 = 0000000000000cef
	ldsba	[%i3+%o5]0x81,%l5	! %l5 = 0000000000000000
!	Mem[00000000300c1410] = 00000000, %l4 = 0000000000000000
	lduha	[%i3+%o5]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000010041410] = 0000ff00, %l1 = 00000000ffff0000
	lduba	[%i1+%o5]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010041410] = 00ff0000, %l6 = 00000000000000ff
	ldsba	[%i1+%o5]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000010101408] = 0000ff00ffffffff, %f0  = 00000000 25c8dd22
	ldda	[%i4+%o4]0x80,%f0 	! %f0  = 0000ff00 ffffffff
!	Mem[0000000010001416] = 00005302, %l4 = 0000000000000000
	ldsh	[%i0+0x016],%l4		! %l4 = 0000000000005302
!	%f21 = 00000000, %f9  = 66000000
	fitos	%f21,%f9 		! %f9  = 00000000
!	Mem[00000000100c1408] = 02530000, %l4 = 0000000000005302
	lduha	[%i3+%o4]0x88,%l4	! %l4 = 0000000000000000

p0_label_197:
!	Starting 10 instruction Store Burst
!	Mem[00000000211c0001] = 00007fb0, %l7 = 0000000000000000
	ldstub	[%o2+0x001],%l7		! %l7 = 0000000000000000
!	%f29 = 00000000, Mem[0000000030141408] = ef910f5d
	sta	%f29,[%i5+%o4]0x89	! Mem[0000000030141408] = 00000000
!	%l1 = 0000000000000000, Mem[00000000201c0000] = ffff2520, %asi = 80
	stha	%l1,[%o0+0x000]%asi	! Mem[00000000201c0000] = 00002520
!	Mem[0000000010101400] = ff22ff00 ffffffff 0000ff00 ffffffff
!	%f0  = 0000ff00 ffffffff 00000071 00000000
!	%f4  = 00000000 a687fdff fffd87a6 60000000
!	%f8  = 00000071 00000000 00000000 00000000
!	%f12 = 7fffffff ff000000 00466624 5d0f91ef
	stda	%f0 ,[%i4+%g0]ASI_BLK_AIUPL	! Block Store to 0000000010101400
!	Mem[00000000300c1410] = 00000000, %l4 = 0000000000000000
	swapa	[%i3+%o5]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000030001400] = ff000000, %l3 = 0000000025c8dd22
	swapa	[%i0+%g0]0x81,%l3	! %l3 = 00000000ff000000
!	Mem[00000000201c0000] = 00002520, %l0 = 0000000000000000
	ldstuba	[%o0+0x000]%asi,%l0	! %l0 = 0000000000000000
!	Mem[00000000300c1408] = ffdd00ff, %l7 = 0000000000000000
	ldstuba	[%i3+%o4]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030101410] = 000000ff, %l1 = 0000000000000000
	ldstuba	[%i4+%o5]0x81,%l1	! %l1 = 0000000000000000
!	Mem[00000000100c1410] = 00000000, %l6 = 0000000000000000
	lduwa	[%i3+%o5]0x80,%l6	! %l6 = 0000000000000000

p0_label_198:
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = ff00ddff, %l5 = 0000000000000000
	lduba	[%i3+%o4]0x81,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030181410] = 4a000000, %f26 = ffff0000
	lda	[%i6+%o5]0x81,%f26	! %f26 = 4a000000
!	Mem[000000001018142e] = ff000000, %l7 = 00000000000000ff, %asi = 80
	ldsha	[%i6+0x02e]%asi,%l7	! %l7 = 0000000000000000
!	%l1 = 0000000000000000, %l3 = 00000000ff000000, %l1 = 0000000000000000
	xor	%l1,%l3,%l1		! %l1 = 00000000ff000000
!	Mem[0000000010041408] = ff0d00ff, %f17 = 00000070
	lda	[%i1+%o4]0x88,%f17	! %f17 = ff0d00ff
!	Mem[00000000300c1408] = ff00ddff, %l5 = 00000000000000ff
	ldswa	[%i3+%o4]0x81,%l5	! %l5 = ffffffffff00ddff
!	%l6 = 0000000000000000, imm = fffffffffffff376, %l0 = 0000000000000000
	xnor	%l6,-0xc8a,%l0		! %l0 = 0000000000000c89
!	Mem[0000000030141408] = 00000000, %l2 = 000000000000ffff
	lduha	[%i5+%o4]0x89,%l2	! %l2 = 0000000000000000
!	%l1 = 00000000ff000000, %l2 = 0000000000000000, %l0 = 0000000000000c89
	and	%l1,%l2,%l0		! %l0 = 0000000000000000
!	Mem[0000000030001400] = 22ddc825, %l2 = 0000000000000000
	lduha	[%i0+%g0]0x89,%l2	! %l2 = 000000000000c825

p0_label_199:
!	Starting 10 instruction Store Burst
!	Mem[0000000030001400] = 25c8dd22 00000000 00000060 a687fdff
!	%f16 = ffffffff ff0d00ff 00000000 0000ff00
!	%f20 = ffddc825 00000000 8fedd10c 0d789c76
!	%f24 = eaff5022 98a11c6c 4a000000 76c3244e
!	%f28 = 00000073 00000000 00000000 40000dff
	stda	%f16,[%i0+%g0]ASI_BLK_AIUSL	! Block Store to 0000000030001400
!	%l2 = 000000000000c825, Mem[0000000010001408] = 00000060ff000000, %asi = 80
	stxa	%l2,[%i0+0x008]%asi	! Mem[0000000010001408] = 000000000000c825
!	%l2 = 000000000000c825, Mem[0000000030181410] = 0000004a
	stha	%l2,[%i6+%o5]0x89	! Mem[0000000030181410] = 0000c825
	membar	#Sync			! Added by membar checker (36)
!	%l1 = 00000000ff000000, Mem[0000000030041400] = ffffffff00000070
	stxa	%l1,[%i1+%g0]0x81	! Mem[0000000030041400] = 00000000ff000000
!	%f14 = 00466624 5d0f91ef, Mem[0000000030181410] = 0000c825 00000000
	stda	%f14,[%i6+%o5]0x89	! Mem[0000000030181410] = 00466624 5d0f91ef
!	%l7 = 0000000000000000, Mem[0000000030081408] = 00000071
	stha	%l7,[%i2+%o4]0x81	! Mem[0000000030081408] = 00000071
!	%l6 = 0000000000000000, Mem[0000000010141412] = ff000000
	sth	%l6,[%i5+0x012]		! Mem[0000000010141410] = ff000000
!	%l5 = ffffffffff00ddff, imm = fffffffffffff1af, %l6 = 0000000000000000
	orn	%l5,-0xe51,%l6		! %l6 = ffffffffff00dfff
!	Mem[0000000010141400] = ff000000, %l6 = 00000000ff00dfff
	swapa	[%i5+%g0]0x88,%l6	! %l6 = 00000000ff000000
!	%l2 = 000000000000c825, Mem[0000000010101412] = fffd87a6
	sth	%l2,[%i4+0x012]		! Mem[0000000010101410] = fffdc825

p0_label_200:
!	Starting 10 instruction Load Burst
!	Mem[000000001010140a] = 00000000, %l6 = 00000000ff000000, %asi = 80
	lduha	[%i4+0x00a]%asi,%l6	! %l6 = 0000000000000000
!	Mem[0000000010181400] = 00000000, %l0 = 0000000000000000, %asi = 80
	ldswa	[%i6+0x000]%asi,%l0	! %l0 = 0000000000000000
!	Mem[0000000010081434] = 447d3b71, %l7 = 0000000000000000, %asi = 80
	lduba	[%i2+0x034]%asi,%l7	! %l7 = 0000000000000044
!	Mem[0000000010141400] = ff00dfff, %l6 = 0000000000000000
	ldswa	[%i5+%g0]0x88,%l6	! %l6 = ffffffffff00dfff
!	Mem[00000000211c0001] = 00ff7fb0, %l5 = ffffffffff00ddff, %asi = 80
	lduba	[%o2+0x001]%asi,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030081408] = 00000071 00000000, %l4 = 00000000, %l5 = 000000ff
	ldda	[%i2+%o4]0x81,%l4	! %l4 = 0000000000000071 0000000000000000
!	Mem[0000000030101408] = 660000ff, %l2 = 000000000000c825
	ldsba	[%i4+%o4]0x89,%l2	! %l2 = ffffffffffffffff
!	%f22 = 8fedd10c, %f17 = ff0d00ff
	fcmpes	%fcc2,%f22,%f17		! %fcc2 = 2
!	Mem[0000000030141410] = 00000000, %l2 = ffffffffffffffff
	lduwa	[%i5+%o5]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000030141410] = 00000000, %l1 = 00000000ff000000
	lduwa	[%i5+%o5]0x81,%l1	! %l1 = 0000000000000000

p0_label_201:
!	Starting 10 instruction Store Burst
!	Mem[0000000010041434] = 17ffffe5, %l0 = 0000000000000000, %asi = 80
	swapa	[%i1+0x034]%asi,%l0	! %l0 = 0000000017ffffe5
!	%l0 = 17ffffe5, %l1 = 00000000, Mem[0000000030001410] = 00000000 ffddc825
	stda	%l0,[%i0+%o5]0x89	! Mem[0000000030001410] = 17ffffe5 00000000
!	Mem[0000000030041400] = 000000ff 00000000, %l2 = 00000000, %l3 = ff000000
	ldda	[%i1+%g0]0x89,%l2	! %l2 = 0000000000000000 00000000000000ff
!	%l0 = 17ffffe5, %l1 = 00000000, Mem[0000000030101408] = 660000ff 00000071
	stda	%l0,[%i4+%o4]0x89	! Mem[0000000030101408] = 17ffffe5 00000000
!	%f4  = 00000000 a687fdff, %l4 = 0000000000000071
!	Mem[0000000010181430] = 00ffffffa687fdff
	add	%i6,0x030,%g1
	stda	%f4,[%g1+%l4]ASI_PST8_PL ! Mem[0000000010181430] = ffffffff000000ff
!	%f30 = 00000000, Mem[0000000010181408] = 00000000
	sta	%f30,[%i6+%o4]0x80	! Mem[0000000010181408] = 00000000
!	%l5 = 0000000000000000, Mem[0000000030041408] = 00ff000000000000
	stxa	%l5,[%i1+%o4]0x89	! Mem[0000000030041408] = 0000000000000000
!	%f28 = 00000073 00000000, %l3 = 00000000000000ff
!	Mem[00000000300c1428] = 0000ffff769c780d
	add	%i3,0x028,%g1
	stda	%f28,[%g1+%l3]ASI_PST16_S ! Mem[00000000300c1428] = 0000007300000000
!	Mem[0000000030041410] = ffddc825, %l7 = 0000000000000044
	swapa	[%i1+%o5]0x81,%l7	! %l7 = 00000000ffddc825
!	%l4 = 00000071, %l5 = 00000000, Mem[0000000030141400] = a687fdff 22ddc825
	stda	%l4,[%i5+%g0]0x89	! Mem[0000000030141400] = 00000071 00000000

p0_label_202:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081400] = 00000000 00002700, %l6 = ff00dfff, %l7 = ffddc825
	ldda	[%i2+%g0]0x88,%l6	! %l6 = 0000000000002700 0000000000000000
!	Mem[00000000300c1410] = 00000000, %l0 = 0000000017ffffe5
	ldswa	[%i3+%o5]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000030081410] = 00000000, %l2 = 0000000000000000
	lduha	[%i2+%o5]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000010181410] = 5d0f91ef, %l7 = 0000000000000000
	ldswa	[%i6+%o5]0x80,%l7	! %l7 = 000000005d0f91ef
!	Mem[0000000030001408] = 00ff0000, %l4 = 0000000000000071
	lduba	[%i0+%o4]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000010181400] = 00000000, %l3 = 00000000000000ff
	lduha	[%i6+%g0]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000020800001] = 0000c750, %l6 = 0000000000002700
	ldsb	[%o1+0x001],%l6		! %l6 = 0000000000000000
!	Mem[0000000030081400] = 00000000 25c8dd22, %l4 = 00000000, %l5 = 00000000
	ldda	[%i2+%g0]0x81,%l4	! %l4 = 0000000000000000 0000000025c8dd22
!	Mem[0000000030081400] = 00000000, %l5 = 0000000025c8dd22
	ldsha	[%i2+%g0]0x89,%l5	! %l5 = 0000000000000000
!	Mem[00000000300c1400] = 0000ff77, %l1 = 0000000000000000
	lduha	[%i3+%g0]0x89,%l1	! %l1 = 000000000000ff77

p0_label_203:
!	Starting 10 instruction Store Burst
!	%f24 = eaff5022 98a11c6c, Mem[00000000100c1410] = 00000000 00ff2242
	stda	%f24,[%i3+%o5]0x80	! Mem[00000000100c1410] = eaff5022 98a11c6c
!	%l4 = 0000000000000000, Mem[0000000020800001] = 0000c750, %asi = 80
	stba	%l4,[%o1+0x001]%asi	! Mem[0000000020800000] = 0000c750
!	Mem[0000000010081408] = 00000000, %l6 = 0000000000000000
	swapa	[%i2+%o4]0x80,%l6	! %l6 = 0000000000000000
!	%l1 = 000000000000ff77, Mem[0000000010181400] = 0000000025c8dd22
	stxa	%l1,[%i6+%g0]0x80	! Mem[0000000010181400] = 000000000000ff77
!	Mem[0000000010101400] = ffffffff, %l5 = 0000000000000000
	ldstuba	[%i4+%g0]0x80,%l5	! %l5 = 00000000000000ff
!	%l5 = 00000000000000ff, Mem[0000000010101408] = 00000000
	stwa	%l5,[%i4+%o4]0x80	! Mem[0000000010101408] = 000000ff
!	Mem[0000000010101410] = 25c8fdff, %l1 = 000000000000ff77
	ldstuba	[%i4+%o5]0x88,%l1	! %l1 = 00000000000000ff
!	Mem[0000000010081408] = 00000000, %l4 = 0000000000000000
	ldsha	[%i2+%o4]0x80,%l4	! %l4 = 0000000000000000
!	%f0  = 0000ff00 ffffffff, %l0 = 0000000000000000
!	Mem[0000000010081428] = 28debc4a0c098c5f
	add	%i2,0x028,%g1
	stda	%f0,[%g1+%l0]ASI_PST32_PL ! Mem[0000000010081428] = 28debc4a0c098c5f
!	%l2 = 00000000, %l3 = 00000000, Mem[00000000300c1400] = 77ff0000 00000000
	stda	%l2,[%i3+%g0]0x81	! Mem[00000000300c1400] = 00000000 00000000

p0_label_204:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081438] = ffffffff, %l1 = 00000000000000ff
	ldsb	[%i2+0x038],%l1		! %l1 = ffffffffffffffff
!	Mem[00000000201c0000] = ff002520, %l6 = 0000000000000000
	ldsh	[%o0+%g0],%l6		! %l6 = ffffffffffffff00
!	Mem[0000000010141400] = ffdf00ff, %l6 = ffffffffffffff00
	ldswa	[%i5+%g0]0x80,%l6	! %l6 = ffffffffffdf00ff
!	Mem[000000001000143c] = 6edccca1, %l5 = 00000000000000ff
	lduw	[%i0+0x03c],%l5		! %l5 = 000000006edccca1
!	Mem[0000000030101408] = e5ffff1700000000, %f28 = 00000073 00000000
	ldda	[%i4+%o4]0x81,%f28	! %f28 = e5ffff17 00000000
!	Mem[0000000010181400] = 00000000, %l0 = 0000000000000000
	lduwa	[%i6+%g0]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000030041408] = 00000000, %f28 = e5ffff17
	lda	[%i1+%o4]0x89,%f28	! %f28 = 00000000
!	%l0 = 0000000000000000, immd = fffff972, %y  = 00000027
	udiv	%l0,-0x68e,%l7		! %l7 = 0000000000000027
	mov	%l0,%y			! %y = 00000000
!	Mem[0000000030081400] = 00000000, %l7 = 0000000000000027
	lduha	[%i2+%g0]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000010141400] = ffdf00ff00000000, %f24 = eaff5022 98a11c6c
	ldda	[%i5+%g0]0x80,%f24	! %f24 = ffdf00ff 00000000

p0_label_205:
!	Starting 10 instruction Store Burst
!	Mem[0000000010141428] = 0000ddff, %l4 = 00000000, %l2 = 00000000
	add	%i5,0x28,%g1
	casa	[%g1]0x80,%l4,%l2	! %l2 = 000000000000ddff
!	Mem[0000000010041400] = ffff0000 25c8dd22 ff000dff 00005302
!	%f16 = ffffffff ff0d00ff 00000000 0000ff00
!	%f20 = ffddc825 00000000 8fedd10c 0d789c76
!	%f24 = ffdf00ff 00000000 4a000000 76c3244e
!	%f28 = 00000000 00000000 00000000 40000dff
	stda	%f16,[%i1+%g0]ASI_BLK_AIUPL	! Block Store to 0000000010041400
!	Mem[000000001018140c] = 00000000, %l6 = 00000000ffdf00ff
	swap	[%i6+0x00c],%l6		! %l6 = 0000000000000000
!	%l2 = 0000ddff, %l3 = 00000000, Mem[0000000010141408] = ff22ff00 ffffffff
	stda	%l2,[%i5+%o4]0x80	! Mem[0000000010141408] = 0000ddff 00000000
!	%l5 = 000000006edccca1, immd = fffffffffffff5b3, %l2  = 000000000000ddff
	mulx	%l5,-0xa4d,%l2		! %l2 = fffffb8a07982993
!	%l3 = 0000000000000000, Mem[0000000030001410] = e5ffff17
	stba	%l3,[%i0+%o5]0x81	! Mem[0000000030001410] = 00ffff17
!	%l5 = 000000006edccca1, Mem[0000000030081408] = 0000000071000000
	stxa	%l5,[%i2+%o4]0x89	! Mem[0000000030081408] = 000000006edccca1
!	Mem[0000000030041400] = 00000000, %l3 = 0000000000000000
	ldstuba	[%i1+%g0]0x89,%l3	! %l3 = 0000000000000000
!	%l3 = 0000000000000000, Mem[0000000010081418] = ff368e9a0f40ec03, %asi = 80
	stxa	%l3,[%i2+0x018]%asi	! Mem[0000000010081418] = 0000000000000000
!	Mem[0000000030141410] = 00000000, %l7 = 0000000000000000
	swapa	[%i5+%o5]0x81,%l7	! %l7 = 0000000000000000

p0_label_206:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001408] = 000000000000c825, %l6 = 0000000000000000
	ldxa	[%i0+%o4]0x80,%l6	! %l6 = 000000000000c825
!	Mem[0000000010141408] = ffdd0000, %l5 = 000000006edccca1
	lduwa	[%i5+%o4]0x88,%l5	! %l5 = 00000000ffdd0000
!	Mem[0000000030041410] = 00000044, %l3 = 0000000000000000
	lduwa	[%i1+%o5]0x81,%l3	! %l3 = 0000000000000044
!	Mem[0000000010141408] = ffdd0000, %l7 = 0000000000000000
	lduba	[%i5+%o4]0x88,%l7	! %l7 = 0000000000000000
!	Mem[00000000100c1400] = 0000000025c8dd22, %l3 = 0000000000000044
	ldxa	[%i3+%g0]0x80,%l3	! %l3 = 0000000025c8dd22
!	Mem[000000001010141d] = a687fdff, %l1 = ffffffffffffffff
	ldsb	[%i4+0x01d],%l1		! %l1 = ffffffffffffff87
!	Mem[0000000010001410] = ff0d00ff, %l4 = 0000000000000000
	ldsba	[%i0+%o5]0x88,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010081410] = 00000000, %f3  = 00000000
	lda	[%i2+%o5]0x88,%f3 	! %f3 = 00000000
!	Mem[0000000030041410] = 0000004400000000, %l3 = 0000000025c8dd22
	ldxa	[%i1+%o5]0x81,%l3	! %l3 = 0000004400000000
!	Mem[0000000010141418] = 00000000 ffffffff, %l2 = 07982993, %l3 = 00000000
	ldd	[%i5+0x018],%l2		! %l2 = 0000000000000000 00000000ffffffff

p0_label_207:
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1410] = eaff5022, %l5 = 00000000ffdd0000
	ldstuba	[%i3+%o5]0x80,%l5	! %l5 = 00000000000000ea
!	%l3 = 00000000ffffffff, Mem[0000000030141408] = 0000000000000000
	stxa	%l3,[%i5+%o4]0x89	! Mem[0000000030141408] = 00000000ffffffff
!	%f24 = ffdf00ff, Mem[0000000010081420] = 00000000
	sta	%f24,[%i2+0x020]%asi	! Mem[0000000010081420] = ffdf00ff
!	%l2 = 0000000000000000, Mem[0000000010101400] = ffffffff00ff0000
	stxa	%l2,[%i4+%g0]0x80	! Mem[0000000010101400] = 0000000000000000
!	Mem[0000000010081400] = 00270000, %l2 = 0000000000000000
	swapa	[%i2+%g0]0x80,%l2	! %l2 = 0000000000270000
!	%f20 = ffddc825, Mem[0000000010181408] = 00000000
	sta	%f20,[%i6+%o4]0x80	! Mem[0000000010181408] = ffddc825
!	Mem[0000000010001400] = 00000000, %l0 = 0000000000000000
	ldstuba	[%i0+%g0]0x80,%l0	! %l0 = 0000000000000000
!	%f30 = 00000000 40000dff, Mem[0000000030041410] = 44000000 00000000
	stda	%f30,[%i1+%o5]0x89	! Mem[0000000030041410] = 00000000 40000dff
!	%l6 = 000000000000c825, Mem[00000000100c1410] = ffff5022
	stha	%l6,[%i3+%o5]0x80	! Mem[00000000100c1410] = c8255022
!	%l2 = 0000000000270000, Mem[00000000100c1408] = 00005302
	stba	%l2,[%i3+%o4]0x80	! Mem[00000000100c1408] = 00005302

p0_label_208:
!	Starting 10 instruction Load Burst
!	Mem[0000000030041400] = 000000ff, %l2 = 0000000000270000
	lduba	[%i1+%g0]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[00000000100c140b] = 00005302, %l6 = 000000000000c825
	ldsb	[%i3+0x00b],%l6		! %l6 = 0000000000000002
!	Mem[00000000100c1410] = 6c1ca198 225025c8, %l0 = 00000000, %l1 = ffffff87
	ldda	[%i3+%o5]0x88,%l0	! %l0 = 00000000225025c8 000000006c1ca198
!	Mem[0000000010001408] = 000000000000c825, %f4  = 00000000 a687fdff
	ldda	[%i0+%o4]0x80,%f4 	! %f4  = 00000000 0000c825
!	Mem[0000000030041400] = 000000ff, %l4 = ffffffffffffffff
	ldsha	[%i1+%g0]0x89,%l4	! %l4 = 00000000000000ff
!	%l1 = 000000006c1ca198, Mem[0000000010041410] = 00000000
	stwa	%l1,[%i1+%o5]0x88	! Mem[0000000010041410] = 6c1ca198
!	Mem[00000000201c0001] = ff002520, %l7 = 0000000000000000, %asi = 80
	ldsba	[%o0+0x001]%asi,%l7	! %l7 = 0000000000000000
!	Mem[00000000100c1400] = 00000000, %l1 = 000000006c1ca198
	lduba	[%i3+%g0]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000030141408] = ffffffff, %l4 = 00000000000000ff
	ldswa	[%i5+%o4]0x81,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000010181438] = 00000000, %l3 = 00000000ffffffff, %asi = 80
	lduha	[%i6+0x038]%asi,%l3	! %l3 = 0000000000000000

p0_label_209:
!	Starting 10 instruction Store Burst
!	%l6 = 0000000000000002, Mem[00000000100c1408] = 02530000
	stwa	%l6,[%i3+%o4]0x88	! Mem[00000000100c1408] = 00000002
!	%l7 = 0000000000000000, immd = 0000066e, %y  = 00000000
	smul	%l7,0x66e,%l6		! %l6 = 0000000000000000, %y = 00000000
!	%f28 = 00000000 00000000, Mem[0000000010001410] = ff000dff 00005302
	stda	%f28,[%i0+%o5]0x80	! Mem[0000000010001410] = 00000000 00000000
!	Mem[0000000030181410] = ef910f5d, %l0 = 00000000225025c8
	ldstuba	[%i6+%o5]0x81,%l0	! %l0 = 00000000000000ef
!	Mem[0000000010141410] = 000000ff, %l5 = 00000000000000ea
	ldstuba	[%i5+%o5]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010081400] = 00000000, %l4 = ffffffffffffffff
	ldstuba	[%i2+%g0]0x80,%l4	! %l4 = 0000000000000000
!	%f2  = 00000071 00000000, %l2 = 00000000000000ff
!	Mem[0000000030101408] = e5ffff1700000000
	add	%i4,0x008,%g1
	stda	%f2,[%g1+%l2]ASI_PST8_S ! Mem[0000000030101408] = 0000007100000000
!	%f8  = 00000071 00000000, Mem[00000000300c1410] = 00000000 0000009a
	stda	%f8 ,[%i3+%o5]0x81	! Mem[00000000300c1410] = 00000071 00000000
!	Mem[000000001000143a] = 25c8dd22, %l3 = 0000000000000000
	ldstub	[%i0+0x03a],%l3		! %l3 = 00000000000000dd
!	%l6 = 00000000, %l7 = 00000000, Mem[0000000010141408] = ffdd0000 00000000
	stda	%l6,[%i5+%o4]0x88	! Mem[0000000010141408] = 00000000 00000000

p0_label_210:
!	Starting 10 instruction Load Burst
!	Mem[000000001008140c] = 00000027, %l7 = 0000000000000000
	lduw	[%i2+0x00c],%l7		! %l7 = 0000000000000027
!	Mem[0000000010081410] = 00000000 60000000, %l4 = 00000000, %l5 = 000000ff
	ldda	[%i2+%o5]0x80,%l4	! %l4 = 0000000000000000 0000000060000000
!	Mem[0000000030141410] = 00000000, %f20 = ffddc825
	lda	[%i5+%o5]0x89,%f20	! %f20 = 00000000
!	Mem[0000000030181408] = 00000060 ffffffff, %l2 = 000000ff, %l3 = 000000dd
	ldda	[%i6+%o4]0x81,%l2	! %l2 = 0000000000000060 00000000ffffffff
!	Mem[0000000030001410] = 17ffff00, %l6 = 0000000000000000
	ldswa	[%i0+%o5]0x89,%l6	! %l6 = 0000000017ffff00
!	Mem[0000000030141400] = 7100000000000000, %f24 = ffdf00ff 00000000
	ldda	[%i5+%g0]0x81,%f24	! %f24 = 71000000 00000000
!	Mem[0000000030001410] = 17ffff00, %l1 = 0000000000000000
	lduba	[%i0+%o5]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000010081400] = ff000000, %l3 = 00000000ffffffff
	ldswa	[%i2+%g0]0x80,%l3	! %l3 = ffffffffff000000
!	Mem[00000000300c1410] = 0000000071000000, %f12 = 7fffffff ff000000
	ldda	[%i3+%o5]0x89,%f12	! %f12 = 00000000 71000000
!	%l1 = 0000000000000000, Mem[0000000030041400] = 000000ff000000ff
	stxa	%l1,[%i1+%g0]0x89	! Mem[0000000030041400] = 0000000000000000

p0_label_211:
!	Starting 10 instruction Store Burst
!	Mem[0000000010001410] = 00000000, %l4 = 0000000000000000
	swapa	[%i0+%o5]0x88,%l4	! %l4 = 0000000000000000
!	%f26 = 4a000000 76c3244e, %l3 = ffffffffff000000
!	Mem[0000000030101410] = ff0000ff60000000
	add	%i4,0x010,%g1
	stda	%f26,[%g1+%l3]ASI_PST32_S ! Mem[0000000030101410] = ff0000ff60000000
!	%l7 = 0000000000000027, Mem[0000000030041400] = 00000000
	stha	%l7,[%i1+%g0]0x81	! Mem[0000000030041400] = 00270000
!	%l5 = 0000000060000000, Mem[0000000030101400] = 22ddc825
	stwa	%l5,[%i4+%g0]0x81	! Mem[0000000030101400] = 60000000
!	%l2 = 0000000000000060, Mem[0000000020800000] = 0000c750, %asi = 80
	stba	%l2,[%o1+0x000]%asi	! Mem[0000000020800000] = 6000c750
!	%f12 = 00000000, %f12 = 00000000
	fcmpes	%fcc2,%f12,%f12		! %fcc2 = 0
!	Mem[0000000030001400] = ff0d00ff, %l2 = 0000000000000060
	ldstuba	[%i0+%g0]0x89,%l2	! %l2 = 00000000000000ff
!	%l5 = 0000000060000000, Mem[0000000030081410] = 00000000
	stha	%l5,[%i2+%o5]0x89	! Mem[0000000030081410] = 00000000
	membar	#Sync			! Added by membar checker (37)
!	Mem[000000001004143d] = 00000000, %l2 = 00000000000000ff
	ldstuba	[%i1+0x03d]%asi,%l2	! %l2 = 0000000000000000
!	Mem[0000000010141408] = 00000000, %l6 = 0000000017ffff00
	swapa	[%i5+%o4]0x80,%l6	! %l6 = 0000000000000000

p0_label_212:
!	Starting 10 instruction Load Burst
!	Mem[000000001000143e] = 6edccca1, %l0 = 00000000000000ef
	ldsh	[%i0+0x03e],%l0		! %l0 = ffffffffffffcca1
!	Mem[0000000010141400] = 00000000ff00dfff, %l0 = ffffffffffffcca1
	ldxa	[%i5+%g0]0x88,%l0	! %l0 = 00000000ff00dfff
!	Mem[0000000030041408] = 00000000 00000000, %l2 = 00000000, %l3 = ff000000
	ldda	[%i1+%o4]0x81,%l2	! %l2 = 0000000000000000 0000000000000000
!	Mem[0000000010181418] = ffec3d33000000ff, %f4  = 00000000 0000c825
	ldd	[%i6+0x018],%f4 	! %f4  = ffec3d33 000000ff
!	Mem[0000000010181400] = 000000000000ff77, %l1 = 0000000000000000, %l1 = 0000000000000000
	casxa	[%i6]0x80,%l1,%l1	! %l1 = 000000000000ff77
!	Code Fragment 3, seed = 858049
p0_fragment_17:
!	%l0 = 00000000ff00dfff
	setx	0x554724a838d74b1e,%g7,%l0 ! %l0 = 554724a838d74b1e
!	%l1 = 000000000000ff77
	setx	0x3cf953452b6a6dc9,%g7,%l1 ! %l1 = 3cf953452b6a6dc9
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 554724a838d74b1e
	setx	0x24ae38317249ac84,%g7,%l0 ! %l0 = 24ae38317249ac84
!	%l1 = 3cf953452b6a6dc9
	setx	0x4be1b41be2f78a4f,%g7,%l1 ! %l1 = 4be1b41be2f78a4f
p0_fragment_17_end:
!	Mem[0000000010101410] = 25c8fdff, %l0 = 24ae38317249ac84
	lduwa	[%i4+%o5]0x88,%l0	! %l0 = 0000000025c8fdff
!	Mem[0000000010001418] = 7e0e314a, %l1 = 4be1b41be2f78a4f, %asi = 80
	lduba	[%i0+0x018]%asi,%l1	! %l1 = 000000000000007e
!	Mem[0000000030101400] = 60000000, %l1 = 000000000000007e
	ldsba	[%i4+%g0]0x81,%l1	! %l1 = 0000000000000060
!	Mem[0000000021800080] = ff063640, %l1 = 0000000000000060, %asi = 80
	ldsha	[%o3+0x080]%asi,%l1	! %l1 = ffffffffffffff06

p0_label_213:
!	Starting 10 instruction Store Burst
!	Mem[0000000010181410] = ef910f5d, %l0 = 0000000025c8fdff
	ldstuba	[%i6+%o5]0x88,%l0	! %l0 = 000000000000005d
!	%l3 = 0000000000000000, Mem[0000000010081412] = 00000000
	sth	%l3,[%i2+0x012]		! Mem[0000000010081410] = 00000000
!	%f16 = ffffffff ff0d00ff, Mem[0000000010001408] = 00000000 25c80000
	stda	%f16,[%i0+%o4]0x88	! Mem[0000000010001408] = ffffffff ff0d00ff
!	Mem[00000000100c1410] = c8255022, %l4 = 0000000000000000
	swapa	[%i3+%o5]0x80,%l4	! %l4 = 00000000c8255022
!	Mem[0000000010001408] = ff0d00ff, %l3 = 0000000000000000
	ldstuba	[%i0+%o4]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010081430] = 00000000447d3b71, %l0 = 000000000000005d, %l1 = ffffffffffffff06
	add	%i2,0x30,%g1
	casxa	[%g1]0x80,%l0,%l1	! %l1 = 00000000447d3b71
!	%l3 = 00000000000000ff, Mem[0000000030041408] = 00000000
	stba	%l3,[%i1+%o4]0x89	! Mem[0000000030041408] = 000000ff
!	%f8  = 00000071 00000000, Mem[0000000010181410] = ef910fff 00000000
	stda	%f8 ,[%i6+%o5]0x88	! Mem[0000000010181410] = 00000071 00000000
!	%f28 = 00000000 00000000, Mem[0000000030041400] = 00270000 00000000
	stda	%f28,[%i1+%g0]0x81	! Mem[0000000030041400] = 00000000 00000000
!	Mem[0000000010141410] = 000000ff, %l7 = 0000000000000027
	ldstuba	[%i5+%o5]0x88,%l7	! %l7 = 00000000000000ff

p0_label_214:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = 25c8ddff, %l6 = 0000000000000000
	lduha	[%i6+%o4]0x88,%l6	! %l6 = 000000000000ddff
!	Mem[0000000010081400] = 000000ff, %l4 = 00000000c8255022
	lduwa	[%i2+%g0]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010081438] = ffffffff9689f254, %l3 = 00000000000000ff
	ldx	[%i2+0x038],%l3		! %l3 = ffffffff9689f254
!	Mem[0000000030041410] = ff0d004000000000, %f30 = 00000000 40000dff
	ldda	[%i1+%o5]0x81,%f30	! %f30 = ff0d0040 00000000
!	Mem[00000000201c0000] = ff002520, %l0 = 000000000000005d
	ldsb	[%o0+%g0],%l0		! %l0 = ffffffffffffffff
!	Mem[0000000030081408] = 6edccca1, %l3 = ffffffff9689f254
	ldsha	[%i2+%o4]0x89,%l3	! %l3 = ffffffffffffcca1
!	Mem[00000000211c0000] = 00ff7fb0, %l1 = 00000000447d3b71, %asi = 80
	ldsba	[%o2+0x000]%asi,%l1	! %l1 = 0000000000000000
!	Mem[0000000010001400] = ff000000, %l2 = 0000000000000000
	lduha	[%i0+%g0]0x80,%l2	! %l2 = 000000000000ff00
!	Mem[0000000030181410] = 5d0f91ff, %f13 = 71000000
	lda	[%i6+%o5]0x89,%f13	! %f13 = 5d0f91ff
!	Mem[00000000100c1418] = ff000dff, %l6 = 000000000000ddff
	ldsb	[%i3+0x018],%l6		! %l6 = ffffffffffffffff

p0_label_215:
!	Starting 10 instruction Store Burst
!	%f3  = 00000000, %f8  = 00000071
	fsqrts	%f3 ,%f8 		! %f8  = 00000000
!	%f18 = 00000000, Mem[0000000030081408] = 6edccca1
	sta	%f18,[%i2+%o4]0x89	! Mem[0000000030081408] = 00000000
!	%l6 = ffffffffffffffff, Mem[0000000010001400] = 27000000000000ff
	stxa	%l6,[%i0+%g0]0x88	! Mem[0000000010001400] = ffffffffffffffff
!	Mem[0000000030181410] = 5d0f91ff, %l5 = 0000000060000000
	ldstuba	[%i6+%o5]0x89,%l5	! %l5 = 00000000000000ff
!	Mem[0000000021800180] = ffa54700, %l3 = ffffffffffffcca1
	ldstub	[%o3+0x180],%l3		! %l3 = 00000000000000ff
!	%l7 = 00000000000000ff, %l7 = 00000000000000ff, %l5 = 00000000000000ff
	subc	%l7,%l7,%l5		! %l5 = 0000000000000000
!	%f28 = 00000000 00000000, Mem[00000000300c1410] = 71000000 00000000
	stda	%f28,[%i3+%o5]0x89	! Mem[00000000300c1410] = 00000000 00000000
!	Mem[0000000030141408] = ffffffff, %l5 = 0000000000000000
	swapa	[%i5+%o4]0x89,%l5	! %l5 = 00000000ffffffff
!	Mem[0000000021800001] = fff595e0, %l2 = 000000000000ff00
	ldstuba	[%o3+0x001]%asi,%l2	! %l2 = 00000000000000f5
!	Mem[0000000010041424] = ff00dfff, %l2 = 00000000000000f5, %asi = 80
	swapa	[%i1+0x024]%asi,%l2	! %l2 = 00000000ff00dfff

p0_label_216:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041400] = ff000dff, %l3 = 00000000000000ff
	lduba	[%i1+%g0]0x80,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030041400] = 00000000, %l4 = 00000000000000ff
	ldsha	[%i1+%g0]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000010101408] = 000000ff, %f27 = 76c3244e
	lda	[%i4+%o4]0x80,%f27	! %f27 = 000000ff
!	Mem[00000000211c0000] = 00ff7fb0, %l4 = 0000000000000000
	ldsh	[%o2+%g0],%l4		! %l4 = 00000000000000ff
!	Mem[0000000010101410] = 25c8fdff, %l6 = ffffffffffffffff
	lduba	[%i4+%o5]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030141410] = 00000000 00000000, %l6 = 000000ff, %l7 = 000000ff
	ldda	[%i5+%o5]0x81,%l6	! %l6 = 0000000000000000 0000000000000000
!	Mem[0000000030001410] = 00ffff17, %l3 = 00000000000000ff
	lduha	[%i0+%o5]0x81,%l3	! %l3 = 00000000000000ff
!	Mem[0000000030041400] = 00000000, %l5 = 00000000ffffffff
	lduwa	[%i1+%g0]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000030101400] = 60000000, %l1 = 0000000000000000
	ldswa	[%i4+%g0]0x81,%l1	! %l1 = 0000000060000000
!	%l3 = 00000000000000ff, imm = fffffffffffff5db, %l1 = 0000000060000000
	sub	%l3,-0xa25,%l1		! %l1 = 0000000000000b24

p0_label_217:
!	Starting 10 instruction Store Burst
!	Mem[00000000300c1400] = 00000000, %l1 = 0000000000000b24
	ldstuba	[%i3+%g0]0x81,%l1	! %l1 = 0000000000000000
!	%f1  = ffffffff, Mem[0000000010001400] = ffffffff
	sta	%f1 ,[%i0+%g0]0x88	! Mem[0000000010001400] = ffffffff
!	Mem[0000000010181400] = 00000000, %l6 = 0000000000000000
	ldstuba	[%i6+%g0]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000030101410] = ff0000ff, %l4 = 00000000000000ff
	ldstuba	[%i4+%o5]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[0000000030141410] = 00000000, %l6 = 0000000000000000
	ldstuba	[%i5+%o5]0x81,%l6	! %l6 = 0000000000000000
!	%l1 = 0000000000000000, Mem[00000000100c143b] = 00466624
	stb	%l1,[%i3+0x03b]		! Mem[00000000100c1438] = 00466600
!	Mem[0000000010081430] = 00000000, %l7 = 0000000000000000
	ldstuba	[%i2+0x030]%asi,%l7	! %l7 = 0000000000000000
!	Mem[0000000030141408] = 00000000, %l2 = 00000000ff00dfff
	swapa	[%i5+%o4]0x89,%l2	! %l2 = 0000000000000000
!	%f8  = 00000000, Mem[0000000010101408] = ff000000
	sta	%f8 ,[%i4+%o4]0x88	! Mem[0000000010101408] = 00000000
!	%l7 = 0000000000000000, Mem[0000000010101424] = 71000000, %asi = 80
	stba	%l7,[%i4+0x024]%asi	! Mem[0000000010101424] = 00000000

p0_label_218:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101400] = 00000000, %l7 = 0000000000000000
	lduha	[%i4+%g0]0x88,%l7	! %l7 = 0000000000000000
!	Mem[00000000211c0000] = 00ff7fb0, %l6 = 0000000000000000, %asi = 80
	lduha	[%o2+0x000]%asi,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010041408] = 000000000000ff00, %f16 = ffffffff ff0d00ff
	ldda	[%i1+%o4]0x88,%f16	! %f16 = 00000000 0000ff00
!	Mem[0000000030041400] = 0000000000000000, %l2 = 0000000000000000
	ldxa	[%i1+%g0]0x89,%l2	! %l2 = 0000000000000000
!	Mem[00000000211c0000] = 00ff7fb0, %l0 = ffffffffffffffff, %asi = 80
	ldsha	[%o2+0x000]%asi,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010041408] = 0000ff00, %l0 = 00000000000000ff
	lduha	[%i1+%o4]0x88,%l0	! %l0 = 000000000000ff00
!	%f24 = 71000000, %f16 = 00000000, %f14 = 00466624
	fsubs	%f24,%f16,%f14		! %f14 = 71000000
!	Mem[0000000030141410] = 000000ff, %l1 = 0000000000000000
	ldsha	[%i5+%o5]0x89,%l1	! %l1 = 00000000000000ff
!	%f26 = 4a000000, %f14 = 71000000
	fcmps	%fcc2,%f26,%f14		! %fcc2 = 1
!	%l1 = 00000000000000ff, %l7 = 0000000000000000, %y  = 00000000
	sdiv	%l1,%l7,%l3		! Div by zero, %l0 = 000000000000ff28

p0_label_219:
!	Starting 10 instruction Store Burst
!	%l5 = 0000000000000000, Mem[0000000010141400] = ff00dfff
	stha	%l5,[%i5+%g0]0x88	! Mem[0000000010141400] = ff000000
!	%l3 = 00000000000000ff, Mem[0000000010141418] = 00000000
	stw	%l3,[%i5+0x018]		! Mem[0000000010141418] = 000000ff
!	Mem[0000000030081408] = 00000000, %l5 = 0000000000000000
	swapa	[%i2+%o4]0x81,%l5	! %l5 = 0000000000000000
!	Mem[00000000100c1420] = ff00ddff, %l6 = 00000000000000ff, %asi = 80
	swapa	[%i3+0x020]%asi,%l6	! %l6 = 00000000ff00ddff
!	%l4 = 00000000000000ff, Mem[0000000030081410] = 00000000
	stha	%l4,[%i2+%o5]0x89	! Mem[0000000030081410] = 000000ff
!	Mem[0000000010141410] = 000000ff, %l4 = 00000000000000ff
	ldstuba	[%i5+%o5]0x88,%l4	! %l4 = 00000000000000ff
!	%l2 = 0000000000000000, Mem[0000000030081408] = 0000000000000000
	stxa	%l2,[%i2+%o4]0x81	! Mem[0000000030081408] = 0000000000000000
!	%l2 = 0000000000000000, Mem[0000000010181410] = 0000007100000000
	stxa	%l2,[%i6+%o5]0x88	! Mem[0000000010181410] = 0000000000000000
!	%f30 = ff0d0040 00000000, Mem[0000000030081408] = 00000000 00000000
	stda	%f30,[%i2+%o4]0x81	! Mem[0000000030081408] = ff0d0040 00000000
!	Mem[00000000100c1424] = 00000027, %l7 = 00000000, %l5 = 00000000
	add	%i3,0x24,%g1
	casa	[%g1]0x80,%l7,%l5	! %l5 = 0000000000000027

p0_label_220:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = 00000000, %l0 = 000000000000ff28
	ldsha	[%i2+%o4]0x80,%l0	! %l0 = 0000000000000000
!	Mem[00000000300c1400] = 000000ff, %l2 = 0000000000000000
	lduha	[%i3+%g0]0x89,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030141408] = ffdf00ff 00000000, %l2 = 000000ff, %l3 = 000000ff
	ldda	[%i5+%o4]0x81,%l2	! %l2 = 00000000ffdf00ff 0000000000000000
!	%f24 = 71000000, %f11 = 00000000
	fsqrts	%f24,%f11		! %f11 = 583504f3
!	Mem[00000000300c1400] = 000000ff, %l3 = 0000000000000000
	ldswa	[%i3+%g0]0x89,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010141400] = ff000000, %l6 = 00000000ff00ddff
	lduba	[%i5+%g0]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000010001410] = 00000000, %l0 = 0000000000000000
	ldswa	[%i0+%o5]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000010041410] = 98a11c6c, %l6 = 0000000000000000, %asi = 80
	ldswa	[%i1+0x010]%asi,%l6	! %l6 = ffffffff98a11c6c
!	Mem[0000000030081410] = fffd87a6000000ff, %f8  = 00000000 00000000
	ldda	[%i2+%o5]0x89,%f8 	! %f8  = fffd87a6 000000ff
!	Mem[0000000030001400] = ffffffffff0d00ff, %l3 = 00000000000000ff
	ldxa	[%i0+%g0]0x89,%l3	! %l3 = ffffffffff0d00ff

p0_label_221:
!	Starting 10 instruction Store Burst
!	Mem[0000000010001408] = ff0d00ff, %l7 = 0000000000000000
	ldstuba	[%i0+%o4]0x88,%l7	! %l7 = 00000000000000ff
!	%l4 = 000000ff, %l5 = 00000027, Mem[0000000010101410] = fffdc825 00000000, %asi = 80
	stda	%l4,[%i4+0x010]%asi	! Mem[0000000010101410] = 000000ff 00000027
!	%l2 = 00000000ffdf00ff, Mem[0000000010001409] = ff000dff, %asi = 80
	stba	%l2,[%i0+0x009]%asi	! Mem[0000000010001408] = ffff0dff
!	Mem[00000000300c1400] = 000000ff, %l4 = 00000000000000ff
	swapa	[%i3+%g0]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010081400] = ff000000, %l2 = 00000000ffdf00ff
	ldstuba	[%i2+%g0]0x80,%l2	! %l2 = 00000000000000ff
!	Mem[00000000100c143c] = 5d0f91ef, %l5 = 0000000000000027
	swap	[%i3+0x03c],%l5		! %l5 = 000000005d0f91ef
!	%l3 = ffffffffff0d00ff, Mem[0000000010141414] = ff000000
	stw	%l3,[%i5+0x014]		! Mem[0000000010141414] = ff0d00ff
!	%f9  = 000000ff, Mem[0000000030101410] = ff0000ff
	sta	%f9 ,[%i4+%o5]0x81	! Mem[0000000030101410] = 000000ff
!	Mem[0000000030181408] = 60000000, %l1 = 00000000000000ff
	swapa	[%i6+%o4]0x89,%l1	! %l1 = 0000000060000000
!	Mem[00000000100c1408] = 02000000, %l4 = 00000000000000ff
	swapa	[%i3+%o4]0x80,%l4	! %l4 = 0000000002000000

p0_label_222:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101430] = 000000ff ffffff7f, %l4 = 02000000, %l5 = 5d0f91ef
	ldd	[%i4+0x030],%l4		! %l4 = 00000000000000ff 00000000ffffff7f
!	Mem[0000000030041400] = 0000000000000000, %l5 = 00000000ffffff7f
	ldxa	[%i1+%g0]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000010041400] = ff0d00ff, %l5 = 0000000000000000
	ldswa	[%i1+%g0]0x88,%l5	! %l5 = ffffffffff0d00ff
!	Mem[0000000010001410] = 00000000, %f7  = 60000000
	lda	[%i0+%o5]0x80,%f7 	! %f7 = 00000000
!	Mem[0000000010041400] = ff000dff, %l6 = ffffffff98a11c6c
	lduba	[%i1+%g0]0x80,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030101408] = 00000071, %l1 = 0000000060000000
	lduba	[%i4+%o4]0x81,%l1	! %l1 = 0000000000000000
!	Mem[00000000300c1400] = ff000000, %l4 = 00000000000000ff
	lduwa	[%i3+%g0]0x81,%l4	! %l4 = 00000000ff000000
!	Mem[0000000010001408] = ffff0dff, %l0 = 0000000000000000
	lduwa	[%i0+%o4]0x80,%l0	! %l0 = 00000000ffff0dff
!	Mem[0000000030101400] = 00000060, %l6 = 00000000000000ff
	lduha	[%i4+%g0]0x89,%l6	! %l6 = 0000000000000060
!	Mem[000000001008143c] = 9689f254, %f30 = ff0d0040
	ld	[%i2+0x03c],%f30	! %f30 = 9689f254

p0_label_223:
!	Starting 10 instruction Store Burst
!	Code Fragment 3, seed = 201865
p0_fragment_18:
!	%l0 = 00000000ffff0dff
	setx	0xc636ef7696a6acde,%g7,%l0 ! %l0 = c636ef7696a6acde
!	%l1 = 0000000000000000
	setx	0x6ed20a74dd0f2389,%g7,%l1 ! %l1 = 6ed20a74dd0f2389
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = c636ef7696a6acde
	setx	0x26dcc76ed9537644,%g7,%l0 ! %l0 = 26dcc76ed9537644
!	%l1 = 6ed20a74dd0f2389
	setx	0x4569f830b6ea280f,%g7,%l1 ! %l1 = 4569f830b6ea280f
p0_fragment_18_end:
!	Mem[0000000030041410] = ff0d0040, %l3 = 00000000ff0d00ff
	swapa	[%i1+%o5]0x81,%l3	! %l3 = 00000000ff0d0040
!	%l2 = 000000ff, %l3 = ff0d0040, Mem[0000000010101408] = 00000000 00000071
	stda	%l2,[%i4+%o4]0x88	! Mem[0000000010101408] = 000000ff ff0d0040
!	%l3 = 00000000ff0d0040, Mem[0000000010101410] = ff000000
	stba	%l3,[%i4+%o5]0x88	! Mem[0000000010101410] = ff000040
!	Mem[00000000100c142a] = ff0d0040, %l0 = 26dcc76ed9537644
	ldstuba	[%i3+0x02a]%asi,%l0	! %l0 = 0000000000000000
!	%f12 = 00000000 5d0f91ff, Mem[0000000010181430] = ffffffff 000000ff, %asi = 80
	stda	%f12,[%i6+0x030]%asi	! Mem[0000000010181430] = 00000000 5d0f91ff
!	%f8  = fffd87a6 000000ff, Mem[00000000300c1400] = ff000000 00000000
	stda	%f8 ,[%i3+%g0]0x81	! Mem[00000000300c1400] = fffd87a6 000000ff
!	%l3 = 00000000ff0d0040, Mem[00000000100c1410] = 0000000098a11c6c
	stxa	%l3,[%i3+%o5]0x80	! Mem[00000000100c1410] = 00000000ff0d0040
!	%f17 = 0000ff00, %f21 = 00000000, %f7  = 00000000
	fmuls	%f17,%f21,%f7 		! %f7  = 00000000
!	Mem[00000000100c1408] = 000000ff, %l4 = 00000000ff000000, %asi = 80
	swapa	[%i3+0x008]%asi,%l4	! %l4 = 00000000000000ff

p0_label_224:
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = ffdf00ff, %l6 = 0000000000000060
	ldsha	[%i5+%o4]0x81,%l6	! %l6 = ffffffffffffffdf
!	%f31 = 00000000, %f0  = 0000ff00
	fcmpes	%fcc3,%f31,%f0 		! %fcc3 = 1
!	Mem[0000000030001410] = 00000000 17ffff00, %l2 = 000000ff, %l3 = ff0d0040
	ldda	[%i0+%o5]0x89,%l2	! %l2 = 0000000017ffff00 0000000000000000
!	Mem[0000000020800000] = 6000c750, %l3 = 0000000000000000, %asi = 80
	lduha	[%o1+0x000]%asi,%l3	! %l3 = 0000000000006000
!	Mem[0000000010081408] = 00000000, %l5 = ffffffffff0d00ff
	ldswa	[%i2+%o4]0x80,%l5	! %l5 = 0000000000000000
!	Mem[00000000100c1408] = ff000000000000ff, %l1 = 4569f830b6ea280f
	ldxa	[%i3+%o4]0x80,%l1	! %l1 = ff000000000000ff
!	Mem[0000000030041408] = 000000ff, %l7 = 00000000000000ff
	ldsba	[%i1+%o4]0x89,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010041400] = ff000dff ffffffff, %l6 = ffffffdf, %l7 = ffffffff
	ldda	[%i1+%g0]0x80,%l6	! %l6 = 00000000ff000dff 00000000ffffffff
!	Mem[0000000021800080] = ff063640, %l5 = 0000000000000000, %asi = 80
	lduha	[%o3+0x080]%asi,%l5	! %l5 = 000000000000ff06
!	Mem[0000000010001410] = 00000000 00000000, %l4 = 000000ff, %l5 = 0000ff06
	ldd	[%i0+%o5],%l4		! %l4 = 0000000000000000 0000000000000000

p0_label_225:
!	Starting 10 instruction Store Burst
!	Mem[0000000010001410] = 00000000, %l3 = 0000000000006000
	ldstuba	[%i0+%o5]0x88,%l3	! %l3 = 0000000000000000
!	%f26 = 4a000000 000000ff, %l3 = 0000000000000000
!	Mem[0000000010101410] = 400000ff00000027
	add	%i4,0x010,%g1
	stda	%f26,[%g1+%l3]ASI_PST32_PL ! Mem[0000000010101410] = 400000ff00000027
!	%f16 = 00000000 0000ff00, Mem[0000000030001408] = 00ff0000 00000000
	stda	%f16,[%i0+%o4]0x81	! Mem[0000000030001408] = 00000000 0000ff00
!	Mem[0000000010101408] = ff000000, %l3 = 0000000000000000
	swapa	[%i4+%o4]0x80,%l3	! %l3 = 00000000ff000000
!	%l5 = 0000000000000000, Mem[0000000030041408] = 00000000000000ff
	stxa	%l5,[%i1+%o4]0x89	! Mem[0000000030041408] = 0000000000000000
!	%l6 = ff000dff, %l7 = ffffffff, Mem[0000000010081410] = 00000000 60000000
	stda	%l6,[%i2+%o5]0x80	! Mem[0000000010081410] = ff000dff ffffffff
!	Mem[0000000030041410] = ff0d00ff, %l1 = ff000000000000ff
	ldstuba	[%i1+%o5]0x81,%l1	! %l1 = 00000000000000ff
!	%f20 = 00000000, Mem[0000000010101408] = 00000000
	sta	%f20,[%i4+%o4]0x88	! Mem[0000000010101408] = 00000000
!	Mem[0000000010001400] = ffffffff, %l5 = 0000000000000000
	ldstuba	[%i0+%g0]0x88,%l5	! %l5 = 00000000000000ff
!	%f28 = 00000000 00000000, Mem[0000000030041400] = 00000000 00000000
	stda	%f28,[%i1+%g0]0x81	! Mem[0000000030041400] = 00000000 00000000

p0_label_226:
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1400] = fffd87a6, %l1 = 00000000000000ff
	ldsba	[%i3+%g0]0x81,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010041408] = 00000000 0000ff00, %l2 = 17ffff00, %l3 = ff000000
	ldda	[%i1+%o4]0x88,%l2	! %l2 = 000000000000ff00 0000000000000000
!	Mem[0000000010141400] = ff000000, %l3 = 0000000000000000
	lduwa	[%i5+%g0]0x88,%l3	! %l3 = 00000000ff000000
!	Code Fragment 3, seed = 586623
p0_fragment_19:
!	%l0 = 0000000000000000
	setx	0x011a0c1e62968b2e,%g7,%l0 ! %l0 = 011a0c1e62968b2e
!	%l1 = ffffffffffffffff
	setx	0xc8057b758a12f0d9,%g7,%l1 ! %l1 = c8057b758a12f0d9
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 011a0c1e62968b2e
	setx	0xd349f7d71d140294,%g7,%l0 ! %l0 = d349f7d71d140294
!	%l1 = c8057b758a12f0d9
	setx	0xb266944122f7435f,%g7,%l1 ! %l1 = b266944122f7435f
p0_fragment_19_end:
!	Mem[0000000010081403] = ff000000, %l2 = 000000000000ff00, %asi = 80
	ldsba	[%i2+0x003]%asi,%l2	! %l2 = 0000000000000000
!	Mem[00000000211c0000] = 00ff7fb0, %l6 = 00000000ff000dff
	lduh	[%o2+%g0],%l6		! %l6 = 00000000000000ff
!	Mem[0000000010081400] = 000000ff, %l4 = 0000000000000000
	lduwa	[%i2+%g0]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010141430] = 00000000 0000006e, %l2 = 00000000, %l3 = ff000000
	ldd	[%i5+0x030],%l2		! %l2 = 0000000000000000 000000000000006e
!	Mem[0000000030001410] = 0000000017ffff00, %f22 = 8fedd10c 0d789c76
	ldda	[%i0+%o5]0x89,%f22	! %f22 = 00000000 17ffff00
!	Code Fragment 3, seed = 955708
p0_fragment_20:
!	%l0 = d349f7d71d140294
	setx	0x1296fca068c8ca46,%g7,%l0 ! %l0 = 1296fca068c8ca46
!	%l1 = b266944122f7435f
	setx	0x981b317a55f0e471,%g7,%l1 ! %l1 = 981b317a55f0e471
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 1296fca068c8ca46
	setx	0xa22dc795f04982ac,%g7,%l0 ! %l0 = a22dc795f04982ac
!	%l1 = 981b317a55f0e471
	setx	0xf40b5eafde48a7f7,%g7,%l1 ! %l1 = f40b5eafde48a7f7
p0_fragment_20_end:

p0_label_227:
!	Starting 10 instruction Store Burst
!	%l0 = a22dc795f04982ac, Mem[0000000010081438] = ffffffff9689f254, %asi = 80
	stxa	%l0,[%i2+0x038]%asi	! Mem[0000000010081438] = a22dc795f04982ac
!	%l3 = 000000000000006e, immd = fffffffffffffd40, %l6  = 00000000000000ff
	mulx	%l3,-0x2c0,%l6		! %l6 = fffffffffffed180
!	%l7 = 00000000ffffffff, Mem[0000000030101400] = 00000060
	stwa	%l7,[%i4+%g0]0x89	! Mem[0000000030101400] = ffffffff
!	%l7 = 00000000ffffffff, Mem[00000000300c1400] = fffd87a6
	stwa	%l7,[%i3+%g0]0x81	! Mem[00000000300c1400] = ffffffff
!	Mem[0000000010181400] = 000000ff, %l5 = 00000000000000ff
	swapa	[%i6+%g0]0x88,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010041408] = 00ff0000, %l3 = 0000006e, %l5 = 000000ff
	add	%i1,0x08,%g1
	casa	[%g1]0x80,%l3,%l5	! %l5 = 0000000000ff0000
!	Mem[0000000010181400] = 000000ff, %l6 = fffffffffffed180
	ldstuba	[%i6+%g0]0x88,%l6	! %l6 = 00000000000000ff
!	%l2 = 0000000000000000, %l3 = 000000000000006e, %l6 = 00000000000000ff
	andn	%l2,%l3,%l6		! %l6 = 0000000000000000
!	%l6 = 0000000000000000, Mem[0000000030041400] = 00000000
	stha	%l6,[%i1+%g0]0x81	! Mem[0000000030041400] = 00000000
!	%f3  = 00000000, Mem[0000000030141410] = ff000000
	sta	%f3 ,[%i5+%o5]0x81	! Mem[0000000030141410] = 00000000

p0_label_228:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = ff000dffffffffff, %l4 = 00000000000000ff
	ldxa	[%i2+%o5]0x80,%l4	! %l4 = ff000dffffffffff
!	Mem[0000000030101400] = ffffffff, %l0 = a22dc795f04982ac
	ldswa	[%i4+%g0]0x89,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010041406] = ffffffff, %l7 = 00000000ffffffff, %asi = 80
	lduha	[%i1+0x006]%asi,%l7	! %l7 = 000000000000ffff
!	Mem[0000000030041408] = 00000000, %l1 = f40b5eafde48a7f7
	ldswa	[%i1+%o4]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000010101420] = 00000000 00000000, %l2 = 00000000, %l3 = 0000006e
	ldd	[%i4+0x020],%l2		! %l2 = 0000000000000000 0000000000000000
!	Mem[000000001010143b] = ef910f5d, %l4 = ff000dffffffffff
	ldsb	[%i4+0x03b],%l4		! %l4 = 000000000000005d
!	Mem[0000000010181400] = ff000000, %l5 = 0000000000ff0000
	lduwa	[%i6+%g0]0x80,%l5	! %l5 = 00000000ff000000
!	Mem[0000000010081408] = 00000000, %l1 = 0000000000000000
	lduha	[%i2+%o4]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000030141410] = 00000000 00000000, %l0 = ffffffff, %l1 = 00000000
	ldda	[%i5+%o5]0x89,%l0	! %l0 = 0000000000000000 0000000000000000
!	Mem[0000000020800000] = 6000c750, %l4 = 000000000000005d, %asi = 80
	lduha	[%o1+0x000]%asi,%l4	! %l4 = 0000000000006000

p0_label_229:
!	Starting 10 instruction Store Burst
!	%l3 = 0000000000000000, Mem[0000000020800000] = 6000c750
	stb	%l3,[%o1+%g0]		! Mem[0000000020800000] = 0000c750
!	%l6 = 00000000, %l7 = 0000ffff, Mem[0000000030141400] = 71000000 00000000
	stda	%l6,[%i5+%g0]0x81	! Mem[0000000030141400] = 00000000 0000ffff
!	%f4  = ffec3d33 000000ff, Mem[0000000030181408] = 000000ff ffffffff
	stda	%f4 ,[%i6+%o4]0x89	! Mem[0000000030181408] = ffec3d33 000000ff
!	Mem[00000000300c1400] = ffffffff 000000ff ff00ddff 00000027
!	%f16 = 00000000 0000ff00 00000000 0000ff00
!	%f20 = 00000000 00000000 00000000 17ffff00
!	%f24 = 71000000 00000000 4a000000 000000ff
!	%f28 = 00000000 00000000 9689f254 00000000
	stda	%f16,[%i3+%g0]ASI_BLK_SL	! Block Store to 00000000300c1400
!	Mem[0000000010041400] = ff000dff, %l4 = 0000000000006000
	ldstuba	[%i1+%g0]0x80,%l4	! %l4 = 00000000000000ff
!	%l2 = 00000000, %l3 = 00000000, Mem[0000000010081410] = ff000dff ffffffff
	std	%l2,[%i2+%o5]		! Mem[0000000010081410] = 00000000 00000000
!	%l7 = 000000000000ffff, Mem[0000000010181408] = ff00dfff25c8ddff
	stxa	%l7,[%i6+%o4]0x88	! Mem[0000000010181408] = 000000000000ffff
!	%l3 = 0000000000000000, Mem[000000001004140c] = 00000000, %asi = 80
	stha	%l3,[%i1+0x00c]%asi	! Mem[000000001004140c] = 00000000
!	%l6 = 0000000000000000, Mem[00000000300c1400] = 0000ff00
	stwa	%l6,[%i3+%g0]0x89	! Mem[00000000300c1400] = 00000000
!	Mem[0000000010101408] = 00000000, %l5 = 00000000ff000000
	swapa	[%i4+%o4]0x88,%l5	! %l5 = 0000000000000000

p0_label_230:
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = 00005d0f, %l6 = 0000000000000000
	ldsha	[%i6+%g0]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000010101410] = ff000040, %l3 = 0000000000000000
	lduha	[%i4+%o5]0x88,%l3	! %l3 = 0000000000000040
!	Mem[0000000010101408] = 000000ff, %l0 = 0000000000000000
	lduwa	[%i4+%o4]0x80,%l0	! %l0 = 00000000000000ff
!	%f3  = 00000000, %f28 = 00000000, %f10 = 00000000
	fmuls	%f3 ,%f28,%f10		! %f10 = 00000000
	membar	#Sync			! Added by membar checker (38)
!	Mem[00000000300c1400] = 0000000000000000, %f0  = 0000ff00 ffffffff
	ldda	[%i3+%g0]0x81,%f0 	! %f0  = 00000000 00000000
!	Mem[00000000100c1410] = 00000000, %f2  = 00000071
	lda	[%i3+%o5]0x88,%f2 	! %f2 = 00000000
!	Mem[0000000030081410] = 000000ff, %l0 = 00000000000000ff
	ldswa	[%i2+%o5]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030141410] = 00000000, %l0 = 00000000000000ff
	ldsha	[%i5+%o5]0x81,%l0	! %l0 = 0000000000000000
!	Mem[0000000030141400] = 00000000, %l7 = 000000000000ffff
	ldsba	[%i5+%g0]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000010141408] = 17ffff00, %l3 = 0000000000000040
	lduha	[%i5+%o4]0x80,%l3	! %l3 = 00000000000017ff

p0_label_231:
!	Starting 10 instruction Store Burst
!	%f20 = 00000000 00000000, %l7 = 0000000000000000
!	Mem[0000000010001428] = 0000000000000066
	add	%i0,0x028,%g1
	stda	%f20,[%g1+%l7]ASI_PST16_P ! Mem[0000000010001428] = 0000000000000066
!	%l6 = 0000000000000000, Mem[0000000010001438] = 25c8ff22
	stw	%l6,[%i0+0x038]		! Mem[0000000010001438] = 00000000
!	%l1 = 0000000000000000, Mem[0000000010081400] = ff000000
	stba	%l1,[%i2+%g0]0x80	! Mem[0000000010081400] = 00000000
!	Mem[0000000030141400] = 00000000, %l7 = 0000000000000000
	swapa	[%i5+%g0]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000010141428] = 0000ddff, %l7 = 00000000, %l6 = 00000000
	add	%i5,0x28,%g1
	casa	[%g1]0x80,%l7,%l6	! %l6 = 000000000000ddff
!	Mem[0000000030081400] = 00000000, %l1 = 0000000000000000
	ldstuba	[%i2+%g0]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000010101407] = 00000000, %l3 = 00000000000017ff
	ldstub	[%i4+0x007],%l3		! %l3 = 0000000000000000
!	%l1 = 0000000000000000, Mem[0000000021800041] = 0cef2810
	stb	%l1,[%o3+0x041]		! Mem[0000000021800040] = 0c002810
!	%l3 = 0000000000000000, Mem[0000000030181400] = 00005d0f00000000
	stxa	%l3,[%i6+%g0]0x81	! Mem[0000000030181400] = 0000000000000000
!	%l4 = 00000000000000ff, %l3 = 0000000000000000, %l6 = 000000000000ddff
	andn	%l4,%l3,%l6		! %l6 = 00000000000000ff

p0_label_232:
!	Starting 10 instruction Load Burst
!	Mem[00000000300c1408] = 00ff0000, %l2 = 0000000000000000
	ldsba	[%i3+%o4]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000010081408] = 00000000, %l4 = 00000000000000ff
	ldsw	[%i2+%o4],%l4		! %l4 = 0000000000000000
!	Mem[0000000021800140] = 000048d0, %l6 = 00000000000000ff, %asi = 80
	lduba	[%o3+0x140]%asi,%l6	! %l6 = 0000000000000000
!	Mem[0000000010141418] = 000000ffffffffff, %l5 = 0000000000000000
	ldx	[%i5+0x018],%l5		! %l5 = 000000ffffffffff
!	Mem[0000000010041413] = 98a11c6c, %l2 = 0000000000000000
	ldub	[%i1+0x013],%l2		! %l2 = 000000000000006c
!	Mem[00000000100c141c] = 00005302, %l3 = 0000000000000000
	lduw	[%i3+0x01c],%l3		! %l3 = 0000000000005302
!	Mem[0000000030001400] = ff000dff, %l4 = 0000000000000000
	ldswa	[%i0+%g0]0x81,%l4	! %l4 = ffffffffff000dff
!	Mem[0000000021800000] = ffff95e0, %l7 = 0000000000000000, %asi = 80
	lduha	[%o3+0x000]%asi,%l7	! %l7 = 000000000000ffff
!	Mem[000000001000141e] = 7fec95f3, %l3 = 0000000000005302, %asi = 80
	lduha	[%i0+0x01e]%asi,%l3	! %l3 = 00000000000095f3
!	Mem[0000000010041424] = 000000f5, %l2 = 000000000000006c, %asi = 80
	ldsba	[%i1+0x024]%asi,%l2	! %l2 = 0000000000000000

p0_label_233:
!	Starting 10 instruction Store Burst
!	%l3 = 00000000000095f3, Mem[00000000300c1400] = 0000000000000000
	stxa	%l3,[%i3+%g0]0x81	! Mem[00000000300c1400] = 00000000000095f3
!	Mem[0000000010141438] = ffffffdf22eaff8b, %l2 = 0000000000000000, %l3 = 00000000000095f3
	add	%i5,0x38,%g1
	casxa	[%g1]0x80,%l2,%l3	! %l3 = ffffffdf22eaff8b
!	%l5 = 000000ffffffffff, Mem[0000000030181408] = ffec3d33000000ff
	stxa	%l5,[%i6+%o4]0x89	! Mem[0000000030181408] = 000000ffffffffff
!	%l3 = ffffffdf22eaff8b, Mem[0000000030181408] = ffffffff
	stha	%l3,[%i6+%o4]0x81	! Mem[0000000030181408] = ff8bffff
!	%l5 = 000000ffffffffff, Mem[00000000100c1406] = 25c8dd22, %asi = 80
	stha	%l5,[%i3+0x006]%asi	! Mem[00000000100c1404] = 25c8ffff
!	%f22 = 00000000 17ffff00, Mem[0000000010101428] = 00000000 00000000
	std	%f22,[%i4+0x028]	! Mem[0000000010101428] = 00000000 17ffff00
!	%l6 = 00000000, %l7 = 0000ffff, Mem[0000000010001408] = ffff0dff ffffffff, %asi = 80
	stda	%l6,[%i0+0x008]%asi	! Mem[0000000010001408] = 00000000 0000ffff
!	Mem[0000000030181408] = ffff8bff, %l5 = 000000ffffffffff
	ldstuba	[%i6+%o4]0x89,%l5	! %l5 = 00000000000000ff
!	%l2 = 0000000000000000, %l5 = 00000000000000ff, %l0 = 0000000000000000
	xnor	%l2,%l5,%l0		! %l0 = ffffffffffffff00
!	%f0  = 00000000 00000000, %l2 = 0000000000000000
!	Mem[0000000030041428] = ffff000076c3244e
	add	%i1,0x028,%g1
	stda	%f0,[%g1+%l2]ASI_PST16_SL ! Mem[0000000030041428] = ffff000076c3244e

p0_label_234:
!	Starting 10 instruction Load Burst
!	Mem[0000000010041418] = 769c780d, %l1 = 0000000000000000, %asi = 80
	ldswa	[%i1+0x018]%asi,%l1	! %l1 = 00000000769c780d
!	Mem[0000000030081408] = ff0d0040, %l2 = 0000000000000000
	ldsha	[%i2+%o4]0x81,%l2	! %l2 = ffffffffffffff0d
!	Mem[0000000030101400] = ffffffff, %l5 = 00000000000000ff
	lduha	[%i4+%g0]0x81,%l5	! %l5 = 000000000000ffff
!	Mem[0000000010041408] = 00ff0000, %l3 = ffffffdf22eaff8b
	lduba	[%i1+%o4]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000030181400] = 00000000, %l7 = 000000000000ffff
	ldsba	[%i6+%g0]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000010041423] = 00000000, %l2 = ffffffffffffff0d, %asi = 80
	ldsba	[%i1+0x023]%asi,%l2	! %l2 = 0000000000000000
!	%l5 = 000000000000ffff, imm = 000000000000052a, %l0 = ffffffffffffff00
	or	%l5,0x52a,%l0		! %l0 = 000000000000ffff
!	Mem[0000000030101400] = ffffffff, %l2 = 0000000000000000
	lduha	[%i4+%g0]0x89,%l2	! %l2 = 000000000000ffff
!	%l2 = 000000000000ffff, %l4 = ffffffffff000dff, %l5 = 000000000000ffff
	xor	%l2,%l4,%l5		! %l5 = ffffffffff00f200
!	Mem[0000000010101400] = 00000000000000ff, %l5 = ffffffffff00f200
	ldx	[%i4+%g0],%l5		! %l5 = 00000000000000ff

p0_label_235:
!	Starting 10 instruction Store Burst
!	%l6 = 0000000000000000, Mem[0000000030081408] = 40000dff
	stwa	%l6,[%i2+%o4]0x89	! Mem[0000000030081408] = 00000000
!	Mem[0000000030141408] = ff00dfff, %l3 = 0000000000000000
	swapa	[%i5+%o4]0x89,%l3	! %l3 = 00000000ff00dfff
!	%l2 = 000000000000ffff, Mem[0000000010001400] = ffffffffffffffff
	stxa	%l2,[%i0+%g0]0x88	! Mem[0000000010001400] = 000000000000ffff
!	Mem[0000000020800000] = 0000c750, %l2 = 000000000000ffff
	ldstuba	[%o1+0x000]%asi,%l2	! %l2 = 0000000000000000
!	%l0 = 000000000000ffff, Mem[0000000030041408] = 00000000
	stha	%l0,[%i1+%o4]0x89	! Mem[0000000030041408] = 0000ffff
!	%f5  = 000000ff, Mem[0000000030081400] = 000000ff
	sta	%f5 ,[%i2+%g0]0x89	! Mem[0000000030081400] = 000000ff
!	%l4 = ff000dff, %l5 = 000000ff, Mem[0000000030081410] = ff000000 a687fdff
	stda	%l4,[%i2+%o5]0x81	! Mem[0000000030081410] = ff000dff 000000ff
!	Mem[0000000030141408] = 00000000, %l2 = 0000000000000000
	swapa	[%i5+%o4]0x81,%l2	! %l2 = 0000000000000000
!	%f24 = 71000000 00000000, %l1 = 00000000769c780d
!	Mem[0000000030041408] = ffff000000000000
	add	%i1,0x008,%g1
	stda	%f24,[%g1+%l1]ASI_PST32_SL ! Mem[0000000030041408] = 0000000000000000
!	%l3 = 00000000ff00dfff, Mem[00000000201c0000] = ff002520, %asi = 80
	stha	%l3,[%o0+0x000]%asi	! Mem[00000000201c0000] = dfff2520

p0_label_236:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = 00000000 ff0d0040, %l4 = ff000dff, %l5 = 000000ff
	ldda	[%i3+%o5]0x80,%l4	! %l4 = 0000000000000000 00000000ff0d0040
!	Mem[0000000010081408] = 0000000000000027, %l2 = 0000000000000000
	ldxa	[%i2+%o4]0x80,%l2	! %l2 = 0000000000000027
!	Mem[00000000100c1408] = ff000000, %l5 = 00000000ff0d0040
	lduh	[%i3+%o4],%l5		! %l5 = 000000000000ff00
!	Mem[0000000030001400] = ff000dff, %f6  = fffd87a6
	lda	[%i0+%g0]0x81,%f6 	! %f6 = ff000dff
!	Mem[0000000010081400] = 00000000, %l4 = 0000000000000000
	lduwa	[%i2+%g0]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000010081400] = 00000000, %l3 = 00000000ff00dfff
	lduba	[%i2+%g0]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000010141400] = ff000000, %l0 = 000000000000ffff
	lduwa	[%i5+%g0]0x88,%l0	! %l0 = 00000000ff000000
!	Mem[00000000211c0000] = 00ff7fb0, %l1 = 00000000769c780d
	ldsh	[%o2+%g0],%l1		! %l1 = 00000000000000ff
!	Mem[00000000300c1408] = 00ff0000, %l6 = 0000000000000000
	lduwa	[%i3+%o4]0x81,%l6	! %l6 = 0000000000ff0000
!	Mem[0000000010141410] = ff000000, %f6  = ff000dff
	ld	[%i5+%o5],%f6 		! %f6 = ff000000

p0_label_237:
!	Starting 10 instruction Store Burst
!	%l6 = 0000000000ff0000, Mem[0000000010041400] = ff000dff
	stba	%l6,[%i1+%g0]0x80	! Mem[0000000010041400] = 00000dff
!	Mem[000000001000143f] = 6edccca1, %l2 = 0000000000000027
	ldstuba	[%i0+0x03f]%asi,%l2	! %l2 = 00000000000000a1
!	Mem[0000000010001410] = 000000ff, %l0 = 00000000ff000000
	ldstuba	[%i0+%o5]0x88,%l0	! %l0 = 00000000000000ff
!	Mem[000000001008142b] = 28debc4a, %l7 = 0000000000000000
	ldstub	[%i2+0x02b],%l7		! %l7 = 000000000000004a
!	%l7 = 000000000000004a, Mem[00000000300c1408] = 00ff0000
	stba	%l7,[%i3+%o4]0x81	! Mem[00000000300c1408] = 4aff0000
!	%l3 = 0000000000000000, Mem[0000000030141400] = 00000000
	stha	%l3,[%i5+%g0]0x81	! Mem[0000000030141400] = 00000000
!	%l0 = 000000ff, %l1 = 000000ff, Mem[0000000030181408] = ffff8bff 000000ff
	stda	%l0,[%i6+%o4]0x89	! Mem[0000000030181408] = 000000ff 000000ff
!	Mem[0000000030141408] = 00000000, %l7 = 000000000000004a
	ldstuba	[%i5+%o4]0x89,%l7	! %l7 = 0000000000000000
!	Mem[0000000010001420] = 77ff0000, %l3 = 00000000, %l6 = 00ff0000
	add	%i0,0x20,%g1
	casa	[%g1]0x80,%l3,%l6	! %l6 = 0000000077ff0000
!	Mem[0000000030181400] = 00000000, %l6 = 0000000077ff0000
	swapa	[%i6+%g0]0x89,%l6	! %l6 = 0000000000000000

p0_label_238:
!	Starting 10 instruction Load Burst
!	Mem[0000000030081410] = ff0d00ff, %l0 = 00000000000000ff
	ldsba	[%i2+%o5]0x89,%l0	! %l0 = ffffffffffffffff
!	Mem[0000000010181408] = 0000ffff, %l2 = 00000000000000a1
	lduha	[%i6+%o4]0x88,%l2	! %l2 = 000000000000ffff
!	Mem[0000000030181410] = ff910f5d, %l2 = 000000000000ffff
	lduba	[%i6+%o5]0x81,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030041410] = ff0d00ff, %l1 = 00000000000000ff
	ldsba	[%i1+%o5]0x81,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000030081408] = 00000000, %l7 = 0000000000000000
	ldsha	[%i2+%o4]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000030081410] = ff000dff, %l7 = 0000000000000000
	ldsba	[%i2+%o5]0x81,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000030101408] = 71000000, %l5 = 000000000000ff00
	lduha	[%i4+%o4]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000010041408] = 00ff0000, %l3 = 0000000000000000
	lduba	[%i1+%o4]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000030081400] = 22ddc825 000000ff, %l6 = 00000000, %l7 = ffffffff
	ldda	[%i2+%g0]0x89,%l6	! %l6 = 00000000000000ff 0000000022ddc825
!	Mem[0000000010041408] = 0000ff00, %l3 = 0000000000000000
	lduwa	[%i1+%o4]0x88,%l3	! %l3 = 000000000000ff00

p0_label_239:
!	Starting 10 instruction Store Burst
!	%f8  = fffd87a6 000000ff, %l2 = 00000000000000ff
!	Mem[00000000300c1400] = 00000000000095f3
	stda	%f8,[%i3+%l2]ASI_PST8_SL ! Mem[00000000300c1400] = ff000000a687fdff
!	Mem[0000000010001414] = 00000000, %l6 = 000000ff, %l7 = 22ddc825
	add	%i0,0x14,%g1
	casa	[%g1]0x80,%l6,%l7	! %l7 = 0000000000000000
!	Mem[0000000010101433] = 000000ff, %l4 = 0000000000000000
	ldstub	[%i4+0x033],%l4		! %l4 = 00000000000000ff
!	%f10 = 00000000 583504f3, Mem[0000000010141428] = 0000ddff 32a0585c
	std	%f10,[%i5+0x028]	! Mem[0000000010141428] = 00000000 583504f3
!	%l2 = 00000000000000ff, Mem[0000000030141408] = ff000000
	stwa	%l2,[%i5+%o4]0x81	! Mem[0000000030141408] = 000000ff
!	Mem[0000000030001410] = 00ffff17, %l1 = 00000000ffffffff
	swapa	[%i0+%o5]0x81,%l1	! %l1 = 0000000000ffff17
!	%l3 = 000000000000ff00, %l5 = 0000000000000000, %l7 = 0000000000000000
	add	%l3,%l5,%l7		! %l7 = 000000000000ff00
!	Mem[0000000010141410] = 000000ff, %l5 = 0000000000000000
	ldstuba	[%i5+%o5]0x88,%l5	! %l5 = 00000000000000ff
!	%l2 = 00000000000000ff, Mem[0000000030001408] = 000000000000ff00
	stxa	%l2,[%i0+%o4]0x81	! Mem[0000000030001408] = 00000000000000ff
!	Mem[0000000030041400] = 00000000, %l2 = 00000000000000ff
	swapa	[%i1+%g0]0x81,%l2	! %l2 = 0000000000000000

p0_label_240:
!	Starting 10 instruction Load Burst
!	Mem[0000000010001422] = 77ff0000, %l6 = 00000000000000ff
	ldsh	[%i0+0x022],%l6		! %l6 = 0000000000000000
!	Mem[0000000010001402] = ffff0000, %l5 = 00000000000000ff, %asi = 80
	lduha	[%i0+0x002]%asi,%l5	! %l5 = 0000000000000000
!	Mem[0000000030001400] = ff000dff, %l3 = 000000000000ff00
	lduha	[%i0+%g0]0x81,%l3	! %l3 = 000000000000ff00
!	Mem[000000001010140d] = 40000dff, %l1 = 0000000000ffff17
	ldub	[%i4+0x00d],%l1		! %l1 = 0000000000000000
!	Mem[0000000010181400] = ff000000 0000ff77, %l0 = ffffffff, %l1 = 00000000
	ldd	[%i6+%g0],%l0		! %l0 = 00000000ff000000 000000000000ff77
!	Mem[0000000010041410] = 98a11c6c, %l4 = 00000000000000ff
	ldsha	[%i1+%o5]0x80,%l4	! %l4 = ffffffffffff98a1
!	%l2 = 0000000000000000, Mem[00000000211c0001] = 00ff7fb0, %asi = 80
	stba	%l2,[%o2+0x001]%asi	! Mem[00000000211c0000] = 00007fb0
!	Mem[0000000030081408] = 00000000, %l5 = 0000000000000000
	ldstuba	[%i2+%o4]0x81,%l5	! %l5 = 0000000000000000
!	Mem[00000000300c1408] = 0000ff4a, %l6 = 0000000000000000
	ldsha	[%i3+%o4]0x89,%l6	! %l6 = ffffffffffffff4a
!	Mem[00000000300c1408] = 4aff0000, %l1 = 000000000000ff77
	ldswa	[%i3+%o4]0x81,%l1	! %l1 = 000000004aff0000

p0_label_241:
!	Starting 10 instruction Store Burst
!	Mem[0000000010081400] = 00000000, %l0 = 00000000ff000000
	ldstuba	[%i2+%g0]0x80,%l0	! %l0 = 0000000000000000
!	%l1 = 000000004aff0000, Mem[0000000020800041] = 00ffe580
	stb	%l1,[%o1+0x041]		! Mem[0000000020800040] = 0000e580
!	%l5 = 0000000000000000, Mem[0000000010181410] = 00000000
	stba	%l5,[%i6+%o5]0x80	! Mem[0000000010181410] = 00000000
!	%f5  = 000000ff, Mem[0000000030181408] = 000000ff
	sta	%f5 ,[%i6+%o4]0x89	! Mem[0000000030181408] = 000000ff
!	%l1 = 000000004aff0000, Mem[0000000030181400] = 0000ff77
	stba	%l1,[%i6+%g0]0x81	! Mem[0000000030181400] = 0000ff77
!	Mem[00000000300c1400] = ff000000, %l6 = ffffffffffffff4a
	ldstuba	[%i3+%g0]0x81,%l6	! %l6 = 00000000000000ff
!	%l6 = 000000ff, %l7 = 0000ff00, Mem[0000000010101408] = 000000ff 40000dff
	stda	%l6,[%i4+%o4]0x80	! Mem[0000000010101408] = 000000ff 0000ff00
!	%l2 = 0000000000000000, Mem[0000000010181408] = 0000ffff
	stwa	%l2,[%i6+%o4]0x88	! Mem[0000000010181408] = 00000000
!	%l2 = 0000000000000000, Mem[00000000100c1408] = ff000000000000ff
	stxa	%l2,[%i3+%o4]0x80	! Mem[00000000100c1408] = 0000000000000000
!	%l5 = 0000000000000000, Mem[000000001010141c] = a687fdff, %asi = 80
	stba	%l5,[%i4+0x01c]%asi	! Mem[000000001010141c] = 0087fdff

p0_label_242:
!	Starting 10 instruction Load Burst
!	Mem[00000000211c0000] = 00007fb0, %l4 = ffffffffffff98a1
	lduh	[%o2+%g0],%l4		! %l4 = 0000000000000000
!	Mem[0000000030101408] = 71000000, %l5 = 0000000000000000
	lduba	[%i4+%o4]0x89,%l5	! %l5 = 0000000000000000
!	Mem[00000000100c1410] = 00000000ff0d0040, %f12 = 00000000 5d0f91ff
	ldda	[%i3+%o5]0x80,%f12	! %f12 = 00000000 ff0d0040
!	Mem[0000000020800041] = 0000e580, %l2 = 0000000000000000
	ldub	[%o1+0x041],%l2		! %l2 = 0000000000000000
!	Mem[00000000100c1408] = 00000000, %l1 = 000000004aff0000
	lduwa	[%i3+%o4]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010001400] = ffff0000, %l7 = 000000000000ff00
	ldsba	[%i0+%g0]0x80,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000010041408] = 0000ff00, %l5 = 0000000000000000
	lduwa	[%i1+%o4]0x88,%l5	! %l5 = 000000000000ff00
!	Mem[0000000030101410] = 00000060ff000000, %f22 = 00000000 17ffff00
	ldda	[%i4+%o5]0x89,%f22	! %f22 = 00000060 ff000000
!	Mem[00000000100c1410] = 00000000, %l5 = 000000000000ff00
	ldswa	[%i3+%o5]0x88,%l5	! %l5 = 0000000000000000
!	Mem[00000000100c1400] = 00000000, %l5 = 0000000000000000
	ldsha	[%i3+%g0]0x80,%l5	! %l5 = 0000000000000000

p0_label_243:
!	Starting 10 instruction Store Burst
!	Mem[0000000010041400] = ff0d0000, %l4 = 0000000000000000
	ldstuba	[%i1+%g0]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000010101408] = 000000ff, %l5 = 0000000000000000
	ldstuba	[%i4+%o4]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000010001400] = 0000ffff, %l4 = 0000000000000000
	ldstuba	[%i0+%g0]0x88,%l4	! %l4 = 00000000000000ff
!	%f18 = 00000000, Mem[0000000030181400] = 77ff0000
	sta	%f18,[%i6+%g0]0x89	! Mem[0000000030181400] = 00000000
!	%l0 = 0000000000000000, Mem[0000000030141400] = 00000000
	stwa	%l0,[%i5+%g0]0x89	! Mem[0000000030141400] = 00000000
!	Mem[0000000030041410] = ff000dff, %l6 = 00000000000000ff
	ldstuba	[%i1+%o5]0x89,%l6	! %l6 = 00000000000000ff
!	%f8  = fffd87a6 000000ff, Mem[0000000010081400] = ff000000 00000000
	stda	%f8 ,[%i2+%g0]0x80	! Mem[0000000010081400] = fffd87a6 000000ff
!	%f29 = 00000000, Mem[0000000030141410] = 00000000
	sta	%f29,[%i5+%o5]0x81	! Mem[0000000030141410] = 00000000
!	%l7 = ffffffffffffffff, Mem[0000000010081400] = a687fdff
	stha	%l7,[%i2+%g0]0x88	! Mem[0000000010081400] = a687ffff
!	%f29 = 00000000, Mem[0000000010041400] = ff000dff
	sta	%f29,[%i1+%g0]0x80	! Mem[0000000010041400] = 00000000

p0_label_244:
!	Starting 10 instruction Load Burst
!	Mem[000000001010143c] = 24664600, %l0 = 0000000000000000, %asi = 80
	lduba	[%i4+0x03c]%asi,%l0	! %l0 = 0000000000000024
!	Mem[0000000010141400] = 000000ff 00000000, %l2 = 00000000, %l3 = 0000ff00
	ldda	[%i5+%g0]0x80,%l2	! %l2 = 00000000000000ff 0000000000000000
!	Mem[0000000010101428] = 00000000, %l7 = ffffffffffffffff
	ldsw	[%i4+0x028],%l7		! %l7 = 0000000000000000
!	Mem[0000000030001410] = 00000000 ffffffff, %l0 = 00000024, %l1 = 00000000
	ldda	[%i0+%o5]0x89,%l0	! %l0 = 00000000ffffffff 0000000000000000
!	Mem[0000000010181438] = 0000000000000000, %l1 = 0000000000000000
	ldx	[%i6+0x038],%l1		! %l1 = 0000000000000000
!	Mem[00000000100c1400] = 00000000, %l1 = 0000000000000000
	ldsba	[%i3+%g0]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000030181408] = ff000000, %l7 = 0000000000000000
	lduwa	[%i6+%o4]0x81,%l7	! %l7 = 00000000ff000000
!	Mem[0000000010181400] = ff0000000000ff77, %l5 = 0000000000000000
	ldxa	[%i6+%g0]0x80,%l5	! %l5 = ff0000000000ff77
!	Mem[0000000010141408] = 17ffff00, %l7 = 00000000ff000000
	lduba	[%i5+%o4]0x80,%l7	! %l7 = 0000000000000017
!	Mem[0000000030001400] = ffffffffff0d00ff, %f12 = 00000000 ff0d0040
	ldda	[%i0+%g0]0x89,%f12	! %f12 = ffffffff ff0d00ff

p0_label_245:
!	Starting 10 instruction Store Burst
!	%f26 = 4a000000 000000ff, %l6 = 00000000000000ff
!	Mem[0000000010141428] = 00000000583504f3
	add	%i5,0x028,%g1
	stda	%f26,[%g1+%l6]ASI_PST8_P ! Mem[0000000010141428] = 4a000000000000ff
!	%l4 = 00000000000000ff, Mem[0000000010041408] = 0000ff00
	stba	%l4,[%i1+%o4]0x88	! Mem[0000000010041408] = 0000ffff
!	%l4 = 00000000000000ff, Mem[0000000021800000] = ffff95e0, %asi = 80
	stha	%l4,[%o3+0x000]%asi	! Mem[0000000021800000] = 00ff95e0
!	Mem[0000000010041400] = 00000000, %l1 = 0000000000000000
	swapa	[%i1+%g0]0x88,%l1	! %l1 = 0000000000000000
!	%l4 = 000000ff, %l5 = 0000ff77, Mem[0000000030001410] = ffffffff 00000000
	stda	%l4,[%i0+%o5]0x81	! Mem[0000000030001410] = 000000ff 0000ff77
!	Mem[0000000010141410] = ff000000ff0d00ff, %l5 = ff0000000000ff77, %l7 = 0000000000000017
	add	%i5,0x10,%g1
	casxa	[%g1]0x80,%l5,%l7	! %l7 = ff000000ff0d00ff
!	%l6 = 00000000000000ff, Mem[0000000010181408] = 00000000
	stba	%l6,[%i6+%o4]0x88	! Mem[0000000010181408] = 000000ff
!	%l5 = ff0000000000ff77, Mem[0000000030081410] = ff000dff000000ff
	stxa	%l5,[%i2+%o5]0x81	! Mem[0000000030081410] = ff0000000000ff77
!	Mem[0000000021800180] = ffa54700, %l2 = 00000000000000ff
	ldstuba	[%o3+0x180]%asi,%l2	! %l2 = 00000000000000ff
!	%l2 = 00000000000000ff, Mem[0000000030181410] = 5d0f91ff
	stha	%l2,[%i6+%o5]0x89	! Mem[0000000030181410] = 5d0f00ff

p0_label_246:
!	Starting 10 instruction Load Burst
!	Mem[0000000030001408] = 00000000, %l3 = 0000000000000000
	lduha	[%i0+%o4]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000010181410] = 00000000, %l1 = 0000000000000000
	ldsba	[%i6+%o5]0x80,%l1	! %l1 = 0000000000000000
	membar	#Sync			! Added by membar checker (39)
!	Mem[0000000030141400] = 00000000 0000ffff 000000ff 00000000
!	Mem[0000000030141410] = 00000000 00000000 ff000000 0000ffff
!	Mem[0000000030141420] = 4abcde28 333dec99 3cf786a6 0c098c5f
!	Mem[0000000030141430] = 0d789c76 447d3b71 21d58c72 3dd76b7b
	ldda	[%i5+%g0]ASI_BLK_AIUS,%f16	! Block Load from 0000000030141400
!	Mem[0000000010101400] = 00000000 000000ff ff0000ff 0000ff00
!	Mem[0000000010101410] = 400000ff 00000027 00000060 0087fdff
!	Mem[0000000010101420] = 00000000 00000000 00000000 17ffff00
!	Mem[0000000010101430] = 000000ff ffffff7f ef910f5d 24664600
	ldda	[%i4+%g0]ASI_BLK_AIUPL,%f0 	! Block Load from 0000000010101400
!	Mem[0000000030041408] = 0000000000000000, %f28 = 0d789c76 447d3b71
	ldda	[%i1+%o4]0x81,%f28	! %f28 = 00000000 00000000
!	Mem[0000000030101400] = ffffffff, %l6 = 00000000000000ff
	ldsba	[%i4+%g0]0x81,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000010001420] = 77ff000000000000, %l2 = 00000000000000ff
	ldx	[%i0+0x020],%l2		! %l2 = 77ff000000000000
!	%l2 = 77ff000000000000, %l2 = 77ff000000000000, %l1 = 0000000000000000
	addc	%l2,%l2,%l1		! %l1 = effe000000000000
!	Mem[0000000010001438] = 00000000, %l3 = 0000000000000000, %asi = 80
	lduwa	[%i0+0x038]%asi,%l3	! %l3 = 0000000000000000
!	Mem[0000000010081408] = 00000000, %f16 = 00000000
	lda	[%i2+%o4]0x80,%f16	! %f16 = 00000000

p0_label_247:
!	Starting 10 instruction Store Burst
!	%l3 = 0000000000000000, Mem[0000000030081410] = ff000000
	stba	%l3,[%i2+%o5]0x81	! Mem[0000000030081410] = 00000000
!	%f16 = 00000000, %f3  = ff0000ff
	fcmpes	%fcc1,%f16,%f3 		! %fcc1 = 2
!	%l4 = 00000000000000ff, Mem[0000000010001400] = 0000ffff
	stha	%l4,[%i0+%g0]0x88	! Mem[0000000010001400] = 000000ff
!	%f23 = 0000ffff, Mem[0000000010141408] = 17ffff00
	sta	%f23,[%i5+%o4]0x80	! Mem[0000000010141408] = 0000ffff
	membar	#Sync			! Added by membar checker (40)
!	%l6 = ffffffff, %l7 = ff0d00ff, Mem[0000000010101438] = ef910f5d 24664600
	std	%l6,[%i4+0x038]		! Mem[0000000010101438] = ffffffff ff0d00ff
!	Mem[0000000010041410] = 6c1ca198, %l5 = 000000000000ff77
	swapa	[%i1+%o5]0x88,%l5	! %l5 = 000000006c1ca198
!	%l1 = effe000000000000, Mem[0000000010081408] = 00000000
	stba	%l1,[%i2+%o4]0x80	! Mem[0000000010081408] = 00000000
!	%l7 = ff000000ff0d00ff, Mem[0000000030041408] = 00000000
	stba	%l7,[%i1+%o4]0x89	! Mem[0000000030041408] = 000000ff
!	Mem[00000000211c0000] = 00007fb0, %l4 = 00000000000000ff
	ldstuba	[%o2+0x000]%asi,%l4	! %l4 = 0000000000000000
!	Mem[0000000010081400] = ffff87a6, %l6 = 00000000ffffffff
	swapa	[%i2+%g0]0x80,%l6	! %l6 = 00000000ffff87a6

p0_label_248:
!	Starting 10 instruction Load Burst
!	Mem[0000000030181408] = 000000ff, %l7 = ff000000ff0d00ff
	lduha	[%i6+%o4]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030081410] = 00000000, %l0 = 00000000ffffffff
	lduha	[%i2+%o5]0x81,%l0	! %l0 = 0000000000000000
!	Mem[000000001000142c] = 00000066, %l3 = 0000000000000000, %asi = 80
	ldswa	[%i0+0x02c]%asi,%l3	! %l3 = 0000000000000066
!	Mem[0000000010141410] = ff000000 ff0d00ff, %l2 = 00000000, %l3 = 00000066
	ldda	[%i5+%o5]0x80,%l2	! %l2 = 00000000ff000000 00000000ff0d00ff
!	Mem[0000000010181428] = 5700ff00ff000000, %l0 = 0000000000000000, %asi = 80
	ldxa	[%i6+0x028]%asi,%l0	! %l0 = 5700ff00ff000000
!	Mem[0000000030041410] = ff0d00ff 00000000, %l4 = 00000000, %l5 = 6c1ca198
	ldda	[%i1+%o5]0x81,%l4	! %l4 = 00000000ff0d00ff 0000000000000000
!	Mem[0000000010101410] = 400000ff, %l3 = 00000000ff0d00ff
	ldsba	[%i4+%o5]0x80,%l3	! %l3 = 0000000000000040
!	Mem[0000000030101410] = 000000ff, %l4 = 00000000ff0d00ff
	ldsba	[%i4+%o5]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000030181408] = 000000ff, %f14 = 00466624
	lda	[%i6+%o4]0x89,%f14	! %f14 = 000000ff
!	Mem[0000000030101408] = 71000000, %l3 = 0000000000000040
	lduba	[%i4+%o4]0x89,%l3	! %l3 = 0000000000000000

p0_label_249:
!	Starting 10 instruction Store Burst
!	%l2 = 00000000ff000000, Mem[00000000100c1400] = 00000000
	stba	%l2,[%i3+%g0]0x80	! Mem[00000000100c1400] = 00000000
!	%l4 = 00000000, %l5 = 00000000, Mem[00000000300c1410] = 00000000 00000000
	stda	%l4,[%i3+%o5]0x81	! Mem[00000000300c1410] = 00000000 00000000
!	Mem[0000000020800040] = 0000e580, %l1 = effe000000000000
	ldstuba	[%o1+0x040]%asi,%l1	! %l1 = 0000000000000000
!	%f7  = 60000000, Mem[0000000030181400] = 00000000
	sta	%f7 ,[%i6+%g0]0x81	! Mem[0000000030181400] = 60000000
!	Mem[00000000211c0000] = ff007fb0, %l7 = 00000000000000ff
	ldstub	[%o2+%g0],%l7		! %l7 = 00000000000000ff
!	%l7 = 00000000000000ff, Mem[0000000010141408] = 0000ffff
	stha	%l7,[%i5+%o4]0x80	! Mem[0000000010141408] = 00ffffff
!	%l1 = 0000000000000000, Mem[00000000300c1410] = 0000000000000000
	stxa	%l1,[%i3+%o5]0x89	! Mem[00000000300c1410] = 0000000000000000
!	%f16 = 00000000 0000ffff, Mem[0000000010141400] = ff000000 00000000
	stda	%f16,[%i5+%g0]0x88	! Mem[0000000010141400] = 00000000 0000ffff
!	%f28 = 00000000 00000000, %l4 = 0000000000000000
!	Mem[0000000030181408] = ff000000ff000000
	add	%i6,0x008,%g1
	stda	%f28,[%g1+%l4]ASI_PST16_SL ! Mem[0000000030181408] = ff000000ff000000
!	Mem[0000000010181408] = 000000ff, %l7 = 00000000000000ff
	ldstuba	[%i6+%o4]0x88,%l7	! %l7 = 00000000000000ff

p0_label_250:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = ff000dff000000ff, %l4 = 0000000000000000
	ldxa	[%i5+%o5]0x88,%l4	! %l4 = ff000dff000000ff
!	Mem[00000000300c1408] = 4aff0000, %l4 = ff000dff000000ff
	ldsha	[%i3+%o4]0x81,%l4	! %l4 = 0000000000004aff
!	Mem[0000000010141400] = ffff0000, %l4 = 0000000000004aff
	lduha	[%i5+%g0]0x80,%l4	! %l4 = 000000000000ffff
!	Mem[0000000030001408] = 00000000, %l7 = 00000000000000ff
	lduha	[%i0+%o4]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000010141410] = ff000000ff0d00ff, %l7 = 0000000000000000
	ldxa	[%i5+%o5]0x80,%l7	! %l7 = ff000000ff0d00ff
!	Mem[00000000100c1428] = ff0dff4000000000, %f28 = 00000000 00000000
	ldd	[%i3+0x028],%f28	! %f28 = ff0dff40 00000000
!	Mem[0000000030181410] = ff000f5d, %l0 = 5700ff00ff000000
	ldswa	[%i6+%o5]0x81,%l0	! %l0 = ffffffffff000f5d
!	Mem[00000000100c1400] = 00000000, %l4 = 000000000000ffff
	ldswa	[%i3+%g0]0x80,%l4	! %l4 = 0000000000000000
!	Mem[00000000100c1410] = 00000000ff0d0040, %f22 = ff000000 0000ffff
	ldda	[%i3+%o5]0x80,%f22	! %f22 = 00000000 ff0d0040
!	Mem[0000000030181408] = 000000ff, %l1 = 0000000000000000
	lduha	[%i6+%o4]0x89,%l1	! %l1 = 00000000000000ff

p0_label_251:
!	Starting 10 instruction Store Burst
!	%l2 = 00000000ff000000, imm = 0000000000000091, %l6 = 00000000ffff87a6
	xnor	%l2,0x091,%l6		! %l6 = ffffffff00ffff6e
!	%l6 = 00ffff6e, %l7 = ff0d00ff, Mem[0000000010101408] = ff0000ff 0000ff00
	stda	%l6,[%i4+%o4]0x80	! Mem[0000000010101408] = 00ffff6e ff0d00ff
!	Mem[0000000010041400] = 00000000 ffffffff ffff0000 00000000
!	%f16 = 00000000 0000ffff 000000ff 00000000
!	%f20 = 00000000 00000000 00000000 ff0d0040
!	%f24 = 4abcde28 333dec99 3cf786a6 0c098c5f
!	%f28 = ff0dff40 00000000 21d58c72 3dd76b7b
	stda	%f16,[%i1+%g0]ASI_BLK_P	! Block Store to 0000000010041400
!	%l1 = 00000000000000ff, immd = fffffffffffffa52, %l108 = 0000000000000000
	sdivx	%l1,-0x5ae,%l0		! %l0 = 0000000000000000
!	%l6 = ffffffff00ffff6e, Mem[0000000030181408] = 000000ff
	stwa	%l6,[%i6+%o4]0x89	! Mem[0000000030181408] = 00ffff6e
	membar	#Sync			! Added by membar checker (41)
!	Mem[0000000010041400] = 00000000, %l5 = 0000000000000000
	swapa	[%i1+%g0]0x80,%l5	! %l5 = 0000000000000000
!	Mem[00000000300c1400] = 000000ff, %l1 = 00000000000000ff
	swapa	[%i3+%g0]0x89,%l1	! %l1 = 00000000000000ff
!	%l3 = 0000000000000000, Mem[0000000010081400] = ff000000ffffffff
	stxa	%l3,[%i2+%g0]0x88	! Mem[0000000010081400] = 0000000000000000
!	%l2 = 00000000ff000000, Mem[00000000211c0000] = ff007fb0, %asi = 80
	stba	%l2,[%o2+0x000]%asi	! Mem[00000000211c0000] = 00007fb0
!	Mem[0000000010001410] = 000000ff, %l0 = 0000000000000000
	ldstuba	[%i0+%o5]0x88,%l0	! %l0 = 00000000000000ff

p0_label_252:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101418] = 000000600087fdff, %f12 = 7fffffff ff000000, %asi = 80
	ldda	[%i4+0x018]%asi,%f12	! %f12 = 00000060 0087fdff
!	Mem[0000000010041408] = 000000ff, %l3 = 0000000000000000
	ldsha	[%i1+%o4]0x80,%l3	! %l3 = 0000000000000000
!	Mem[0000000030001410] = ff000000, %l0 = 00000000000000ff
	ldsha	[%i0+%o5]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000030081408] = ff000000, %l3 = 0000000000000000
	ldsba	[%i2+%o4]0x81,%l3	! %l3 = ffffffffffffffff
!	Mem[00000000300c1410] = 0000000000000000, %l1 = 00000000000000ff
	ldxa	[%i3+%o5]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000010081410] = 00000000, %l4 = 0000000000000000
	ldsba	[%i2+%o5]0x88,%l4	! %l4 = 0000000000000000
!	Mem[0000000010081408] = 00000000, %l6 = ffffffff00ffff6e
	ldsha	[%i2+%o4]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000030101408] = 71000000, %l4 = 0000000000000000
	lduwa	[%i4+%o4]0x89,%l4	! %l4 = 0000000071000000
!	Mem[0000000010081410] = 0000000000000000, %f18 = 000000ff 00000000
	ldd	[%i2+%o5],%f18		! %f18 = 00000000 00000000
!	Mem[00000000300c1400] = ff000000, %l4 = 0000000071000000
	lduwa	[%i3+%g0]0x81,%l4	! %l4 = 00000000ff000000

p0_label_253:
!	Starting 10 instruction Store Burst
!	Mem[00000000201c0001] = dfff2520, %l3 = ffffffffffffffff
	ldstub	[%o0+0x001],%l3		! %l3 = 00000000000000ff
!	Mem[0000000030001400] = ff0d00ff, %l6 = 0000000000000000
	swapa	[%i0+%g0]0x89,%l6	! %l6 = 00000000ff0d00ff
!	%l4 = 00000000ff000000, Mem[00000000100c1408] = 00000000
	stwa	%l4,[%i3+%o4]0x88	! Mem[00000000100c1408] = ff000000
!	%f16 = 00000000 0000ffff, Mem[0000000010101408] = 6effff00 ff000dff
	stda	%f16,[%i4+%o4]0x88	! Mem[0000000010101408] = 00000000 0000ffff
!	%l3 = 00000000000000ff, Mem[0000000010181410] = 0000000000000000
	stxa	%l3,[%i6+%o5]0x88	! Mem[0000000010181410] = 00000000000000ff
!	%f26 = 3cf786a6 0c098c5f, Mem[0000000030181400] = 00000060 00000000
	stda	%f26,[%i6+%g0]0x89	! Mem[0000000030181400] = 3cf786a6 0c098c5f
!	%f22 = 00000000 ff0d0040, Mem[0000000010041418] = 00000000 ff0d0040, %asi = 80
	stda	%f22,[%i1+0x018]%asi	! Mem[0000000010041418] = 00000000 ff0d0040
!	%l4 = ff000000, %l5 = 00000000, Mem[0000000030181408] = 6effff00 ff000000
	stda	%l4,[%i6+%o4]0x81	! Mem[0000000030181408] = ff000000 00000000
!	Mem[00000000100c1410] = 00000000, %l6 = ff0d00ff, %l6 = ff0d00ff
	add	%i3,0x10,%g1
	casa	[%g1]0x80,%l6,%l6	! %l6 = 0000000000000000
!	%l3 = 00000000000000ff, Mem[0000000030101408] = 71000000
	stba	%l3,[%i4+%o4]0x89	! Mem[0000000030101408] = 710000ff

p0_label_254:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101408] = ffff0000 00000000, %l4 = ff000000, %l5 = 00000000, %asi = 80
	ldda	[%i4+0x008]%asi,%l4	! %l4 = 00000000ffff0000 0000000000000000
!	Mem[0000000010101408] = 0000ffff, %f1  = 00000000
	lda	[%i4+%o4]0x88,%f1 	! %f1 = 0000ffff
!	Mem[0000000010081408] = 00000000, %l1 = 0000000000000000
	lduwa	[%i2+%o4]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010141410] = ff000000, %l5 = 0000000000000000
	lduha	[%i5+%o5]0x80,%l5	! %l5 = 000000000000ff00
!	Mem[00000000100c1408] = 000000ff, %l0 = 0000000000000000
	ldsha	[%i3+%o4]0x80,%l0	! %l0 = 0000000000000000
	membar	#Sync			! Added by membar checker (42)
!	Mem[0000000030181400] = 5f8c090c a686f73c ff000000 00000000
!	Mem[0000000030181410] = ff000f5d 24664600 7e0e314a 7fec95f3
!	Mem[0000000030181420] = 77ff0000 00000027 00000000 00000066
!	Mem[0000000030181430] = 00000000 00000070 00000022 6e00cca1
	ldda	[%i6+%g0]ASI_BLK_AIUS,%f0 	! Block Load from 0000000030181400
!	Mem[0000000010081410] = 00000000 00000000, %l2 = ff000000, %l3 = 000000ff
	ldd	[%i2+%o5],%l2		! %l2 = 0000000000000000 0000000000000000
!	Mem[0000000030141408] = 00000000ff000000, %f26 = 3cf786a6 0c098c5f
	ldda	[%i5+%o4]0x89,%f26	! %f26 = 00000000 ff000000
!	Mem[0000000010181408] = 00000000000000ff, %f22 = 00000000 ff0d0040
	ldda	[%i6+%o4]0x88,%f22	! %f22 = 00000000 000000ff
!	Mem[0000000030101408] = ff000071, %l3 = 0000000000000000
	ldswa	[%i4+%o4]0x81,%l3	! %l3 = ffffffffff000071

p0_label_255:
!	Starting 10 instruction Store Burst
!	%l0 = 0000000000000000, Mem[0000000010081408] = 00000000
	stwa	%l0,[%i2+%o4]0x88	! Mem[0000000010081408] = 00000000
!	%l2 = 0000000000000000, Mem[0000000021800180] = ffa54700
	sth	%l2,[%o3+0x180]		! Mem[0000000021800180] = 00004700
!	%l0 = 00000000, %l1 = 00000000, Mem[0000000010181408] = ff000000 00000000
	stda	%l0,[%i6+%o4]0x80	! Mem[0000000010181408] = 00000000 00000000
!	Mem[00000000100c1408] = 000000ff, %l3 = 00000000ff000071
	swapa	[%i3+%o4]0x80,%l3	! %l3 = 00000000000000ff
!	%f6  = 7e0e314a, Mem[0000000010181410] = 000000ff
	sta	%f6 ,[%i6+%o5]0x88	! Mem[0000000010181410] = 7e0e314a
!	%f26 = 00000000 ff000000, Mem[0000000030041400] = ff000000 00000000
	stda	%f26,[%i1+%g0]0x89	! Mem[0000000030041400] = 00000000 ff000000
!	%l7 = ff000000ff0d00ff, Mem[0000000010081438] = a22dc795f04982ac
	stx	%l7,[%i2+0x038]		! Mem[0000000010081438] = ff000000ff0d00ff
!	Mem[00000000211c0001] = 00007fb0, %l6 = 0000000000000000
	ldstuba	[%o2+0x001]%asi,%l6	! %l6 = 0000000000000000
!	%l0 = 0000000000000000, Mem[0000000010141400] = 0000ffff
	stha	%l0,[%i5+%g0]0x88	! Mem[0000000010141400] = 00000000
!	Mem[0000000010081410] = 00000000, %l4 = 00000000ffff0000
	ldstuba	[%i2+%o5]0x80,%l4	! %l4 = 0000000000000000

p0_label_256:
!	Starting 10 instruction Load Burst
!	Mem[0000000030101400] = ffffffff 00000000, %l4 = 00000000, %l5 = 0000ff00
	ldda	[%i4+%g0]0x81,%l4	! %l4 = 00000000ffffffff 0000000000000000
!	Code Fragment 3, seed = 273754
p0_fragment_21:
!	%l0 = 0000000000000000
	setx	0x513c58601b048756,%g7,%l0 ! %l0 = 513c58601b048756
!	%l1 = 0000000000000000
	setx	0x85bc80c4ebf15481,%g7,%l1 ! %l1 = 85bc80c4ebf15481
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 513c58601b048756
	setx	0xb3b7b915032c35bc,%g7,%l0 ! %l0 = b3b7b915032c35bc
!	%l1 = 85bc80c4ebf15481
	setx	0x8b6fd3a637f62e07,%g7,%l1 ! %l1 = 8b6fd3a637f62e07
p0_fragment_21_end:
!	Mem[0000000030101410] = 00000060 ff000000, %l4 = ffffffff, %l5 = 00000000
	ldda	[%i4+%o5]0x89,%l4	! %l4 = 00000000ff000000 0000000000000060
!	%l4 = 00000000ff000000, %l0 = b3b7b915032c35bc, %l4 = 00000000ff000000
	add	%l4,%l0,%l4		! %l4 = b3b7b916022c35bc
!	Mem[0000000030081400] = 22ddc825 000000ff, %l2 = 00000000, %l3 = 000000ff
	ldda	[%i2+%g0]0x89,%l2	! %l2 = 00000000000000ff 0000000022ddc825
!	Mem[0000000030181408] = 000000ff, %f21 = 00000000
	lda	[%i6+%o4]0x89,%f21	! %f21 = 000000ff
!	Mem[0000000030141408] = 00000000ff000000, %f22 = 00000000 000000ff
	ldda	[%i5+%o4]0x89,%f22	! %f22 = 00000000 ff000000
!	Mem[00000000300c1400] = ff000000 a687fdff 4aff0000 00000000
!	Mem[00000000300c1410] = 00000000 00000000 00ffff17 00000000
!	Mem[00000000300c1420] = 00000000 00000071 ff000000 0000004a
!	Mem[00000000300c1430] = 00000000 00000000 00000000 54f28996
	ldda	[%i3+%g0]ASI_BLK_AIUSL,%f0 	! Block Load from 00000000300c1400
!	Mem[0000000010141400] = 00000000, %l4 = b3b7b916022c35bc
	ldsha	[%i5+%g0]0x80,%l4	! %l4 = 0000000000000000
!	Mem[0000000010141428] = 4a000000000000ff, %f22 = 00000000 ff000000
	ldd	[%i5+0x028],%f22	! %f22 = 4a000000 000000ff

p0_label_257:
!	Starting 10 instruction Store Burst
!	Mem[0000000021800040] = 0c002810, %l6 = 0000000000000000
	ldstuba	[%o3+0x040]%asi,%l6	! %l6 = 000000000000000c
!	Mem[00000000300c1410] = 00000000, %l4 = 0000000000000000
	swapa	[%i3+%o5]0x81,%l4	! %l4 = 0000000000000000
!	%l7 = ff000000ff0d00ff, Mem[0000000030101400] = 00000000ffffffff
	stxa	%l7,[%i4+%g0]0x89	! Mem[0000000030101400] = ff000000ff0d00ff
!	%f4  = 00000000 00000000, Mem[0000000030141410] = 00000000 00000000
	stda	%f4 ,[%i5+%o5]0x81	! Mem[0000000030141410] = 00000000 00000000
!	Mem[00000000211c0000] = 00ff7fb0, %l4 = 0000000000000000
	ldstuba	[%o2+0x000]%asi,%l4	! %l4 = 0000000000000000
!	%l0 = b3b7b915032c35bc, Mem[0000000010001400] = 000000ff
	stha	%l0,[%i0+%g0]0x88	! Mem[0000000010001400] = 000035bc
!	%f5  = 00000000, Mem[0000000030101410] = 000000ff
	sta	%f5 ,[%i4+%o5]0x81	! Mem[0000000030101410] = 00000000
!	Mem[00000000211c0000] = ffff7fb0, %l4 = 0000000000000000
	ldstub	[%o2+%g0],%l4		! %l4 = 00000000000000ff
!	%f11 = 000000ff, Mem[00000000100c1400] = 00000000
	sta	%f11,[%i3+%g0]0x80	! Mem[00000000100c1400] = 000000ff
!	%l2 = 00000000000000ff, Mem[0000000030101400] = ff000dff000000ff
	stxa	%l2,[%i4+%g0]0x81	! Mem[0000000030101400] = 00000000000000ff

p0_label_258:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = 27000000ff000040, %f22 = 4a000000 000000ff
	ldda	[%i4+%o5]0x88,%f22	! %f22 = 27000000 ff000040
!	Mem[0000000030001400] = 00000000, %l5 = 0000000000000060
	lduwa	[%i0+%g0]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000030001408] = 00000000, %f21 = 000000ff
	lda	[%i0+%o4]0x81,%f21	! %f21 = 00000000
!	Mem[00000000211c0001] = ffff7fb0, %l1 = 8b6fd3a637f62e07
	ldsb	[%o2+0x001],%l1		! %l1 = ffffffffffffffff
!	Mem[0000000010181400] = 000000ff, %l4 = 00000000000000ff
	lduwa	[%i6+%g0]0x88,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010141408] = 00000000ffffff00, %f28 = ff0dff40 00000000
	ldda	[%i5+%o4]0x88,%f28	! %f28 = 00000000 ffffff00
!	Mem[000000001010141d] = 0087fdff, %l4 = 00000000000000ff
	ldsb	[%i4+0x01d],%l4		! %l4 = ffffffffffffff87
!	Mem[0000000030041410] = ff0d00ff, %l6 = 000000000000000c
	ldsba	[%i1+%o5]0x81,%l6	! %l6 = ffffffffffffffff
!	Mem[00000000218000c0] = ffffc070, %l1 = ffffffffffffffff, %asi = 80
	ldsha	[%o3+0x0c0]%asi,%l1	! %l1 = ffffffffffffffff
!	Mem[0000000010041400] = 00000000 0000ffff 000000ff 00000000
!	Mem[0000000010041410] = 00000000 00000000 00000000 ff0d0040
!	Mem[0000000010041420] = 4abcde28 333dec99 3cf786a6 0c098c5f
!	Mem[0000000010041430] = ff0dff40 00000000 21d58c72 3dd76b7b
	ldda	[%i1+%g0]ASI_BLK_P,%f16	! Block Load from 0000000010041400

p0_label_259:
!	Starting 10 instruction Store Burst
!	%l5 = 0000000000000000, Mem[0000000010001410] = 000000ff
	stwa	%l5,[%i0+%o5]0x88	! Mem[0000000010001410] = 00000000
!	Mem[0000000030181408] = 000000ff, %l4 = ffffffffffffff87
	ldstuba	[%i6+%o4]0x89,%l4	! %l4 = 00000000000000ff
!	%l2 = 000000ff, %l3 = 22ddc825, Mem[0000000010081408] = 00000000 00000027
	stda	%l2,[%i2+%o4]0x80	! Mem[0000000010081408] = 000000ff 22ddc825
!	%l0 = b3b7b915032c35bc, Mem[0000000010001400] = 000035bc
	stba	%l0,[%i0+%g0]0x88	! Mem[0000000010001400] = 000035bc
!	Mem[00000000100c1410] = 00000000, %l5 = 0000000000000000
	ldstuba	[%i3+%o5]0x80,%l5	! %l5 = 0000000000000000
	membar	#Sync			! Added by membar checker (43)
!	%f6  = 00000000 17ffff00, Mem[0000000010041420] = 4abcde28 333dec99, %asi = 80
	stda	%f6 ,[%i1+0x020]%asi	! Mem[0000000010041420] = 00000000 17ffff00
!	Mem[0000000020800040] = ff00e580, %l5 = 0000000000000000
	ldstub	[%o1+0x040],%l5		! %l5 = 00000000000000ff
!	%l0 = 032c35bc, %l1 = ffffffff, Mem[0000000030001408] = 00000000 ff000000
	stda	%l0,[%i0+%o4]0x89	! Mem[0000000030001408] = 032c35bc ffffffff
!	Mem[0000000010181400] = 000000ff, %l2 = 00000000000000ff
	swapa	[%i6+%g0]0x88,%l2	! %l2 = 00000000000000ff
!	%f23 = ff0d0040, Mem[00000000100c1424] = 00000027
	st	%f23,[%i3+0x024]	! Mem[00000000100c1424] = ff0d0040

p0_label_260:
!	Starting 10 instruction Load Burst
!	Mem[0000000030001400] = 00000000, %l1 = ffffffffffffffff
	lduha	[%i0+%g0]0x81,%l1	! %l1 = 0000000000000000
!	Mem[0000000010041400] = 00000000, %f8  = 71000000
	lda	[%i1+%g0]0x88,%f8 	! %f8 = 00000000
!	Mem[0000000030041408] = ff000000, %l2 = 00000000000000ff
	ldswa	[%i1+%o4]0x81,%l2	! %l2 = ffffffffff000000
!	Mem[0000000010081410] = ff00000000000000, %l0 = b3b7b915032c35bc
	ldxa	[%i2+%o5]0x80,%l0	! %l0 = ff00000000000000
!	%l5 = 00000000000000ff, %l3 = 0000000022ddc825, %l1 = 0000000000000000
	andn	%l5,%l3,%l1		! %l1 = 00000000000000da
!	Mem[0000000030141410] = 00000000, %l6 = ffffffffffffffff
	lduha	[%i5+%o5]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000030101408] = ff000071, %l5 = 00000000000000ff
	lduba	[%i4+%o4]0x81,%l5	! %l5 = 00000000000000ff
!	Mem[0000000030041400] = 000000ff, %l7 = ff000000ff0d00ff
	lduba	[%i1+%g0]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000010181400] = ff000000 0000ff77, %l0 = 00000000, %l1 = 000000da
	ldda	[%i6+%g0]0x80,%l0	! %l0 = 00000000ff000000 000000000000ff77
!	%l2 = ffffffffff000000, Mem[00000000300c1400] = ff000000
	stwa	%l2,[%i3+%g0]0x81	! Mem[00000000300c1400] = ff000000

p0_label_261:
!	Starting 10 instruction Store Burst
!	%l6 = 0000000000000000, Mem[00000000201c0000] = dfff2520
	sth	%l6,[%o0+%g0]		! Mem[00000000201c0000] = 00002520
!	Mem[0000000030081410] = 00000000, %l4 = 00000000000000ff
	ldstuba	[%i2+%o5]0x89,%l4	! %l4 = 0000000000000000
!	%l4 = 0000000000000000, Mem[0000000010101410] = 27000000ff000040
	stxa	%l4,[%i4+%o5]0x88	! Mem[0000000010101410] = 0000000000000000
!	Mem[0000000010001400] = bc350000, %l0 = 00000000ff000000
	ldstuba	[%i0+%g0]0x80,%l0	! %l0 = 00000000000000bc
!	Mem[00000000100c141f] = 00005302, %l5 = 00000000000000ff
	ldstuba	[%i3+0x01f]%asi,%l5	! %l5 = 0000000000000002
!	%l4 = 0000000000000000, %l6 = 0000000000000000, %l6 = 0000000000000000
	andn	%l4,%l6,%l6		! %l6 = 0000000000000000
!	Mem[0000000030001400] = 00000000, %l2 = ffffffffff000000
	ldstuba	[%i0+%g0]0x81,%l2	! %l2 = 0000000000000000
!	%f15 = 00000000, Mem[0000000010141408] = 00ffffff
	sta	%f15,[%i5+0x008]%asi	! Mem[0000000010141408] = 00000000
!	%f21 = 00000000, Mem[0000000010041410] = 00000000
	sta	%f21,[%i1+%o5]0x88	! Mem[0000000010041410] = 00000000
!	%l7 = 0000000000000000, %l6 = 0000000000000000, %y  = 00000000
	umul	%l7,%l6,%l5		! %l5 = 0000000000000000, %y = 00000000

p0_label_262:
!	Starting 10 instruction Load Burst
!	Mem[0000000030001410] = 000000ff, %l4 = 0000000000000000
	lduba	[%i0+%o5]0x81,%l4	! %l4 = 0000000000000000
!	Mem[0000000010081408] = ff000000, %l1 = 000000000000ff77
	ldstuba	[%i2+%o4]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010181408] = 00000000, %f17 = 0000ffff
	lda	[%i6+%o4]0x88,%f17	! %f17 = 00000000
!	Mem[0000000030181400] = 5f8c090c, %f20 = 00000000
	lda	[%i6+%g0]0x81,%f20	! %f20 = 5f8c090c
!	Mem[0000000010041410] = 00000000, %l6 = 0000000000000000
	lduha	[%i1+%o5]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000030001410] = 000000ff, %l2 = 0000000000000000
	lduha	[%i0+%o5]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000010041433] = ff0dff40, %l2 = 0000000000000000
	ldsb	[%i1+0x033],%l2		! %l2 = 0000000000000040
!	Mem[0000000030141408] = 000000ff, %l2 = 0000000000000040
	ldsba	[%i5+%o4]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000030001400] = ff000000, %l2 = 0000000000000000
	lduba	[%i0+%g0]0x81,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010081400] = 0000000000000000, %l4 = 0000000000000000
	ldxa	[%i2+%g0]0x80,%l4	! %l4 = 0000000000000000

p0_label_263:
!	Starting 10 instruction Store Burst
!	%f8  = 00000000, %f4  = 00000000, %f7  = 17ffff00
	fdivs	%f8 ,%f4 ,%f7 		! %f7  = 7fffffff
!	Mem[00000000100c1410] = ff000000, %l6 = 00000000, %l0 = 000000bc
	add	%i3,0x10,%g1
	casa	[%g1]0x80,%l6,%l0	! %l0 = 00000000ff000000
!	%l0 = ff000000, %l1 = 00000000, Mem[0000000030141408] = ff000000 00000000
	stda	%l0,[%i5+%o4]0x89	! Mem[0000000030141408] = ff000000 00000000
!	%f21 = 00000000, Mem[000000001008143c] = ff0d00ff
	st	%f21,[%i2+0x03c]	! Mem[000000001008143c] = 00000000
!	%l3 = 0000000022ddc825, Mem[0000000030141408] = 00000000ff000000
	stxa	%l3,[%i5+%o4]0x89	! Mem[0000000030141408] = 0000000022ddc825
!	Mem[0000000010041428] = 3cf786a6 0c098c5f, %l4 = 00000000, %l5 = 00000000
	ldd	[%i1+0x028],%l4		! %l4 = 000000003cf786a6 000000000c098c5f
!	%l4 = 000000003cf786a6, Mem[0000000030041400] = 000000ff
	stba	%l4,[%i1+%g0]0x81	! Mem[0000000030041400] = a60000ff
!	Mem[0000000030141400] = 00000000, %l4 = 000000003cf786a6
	swapa	[%i5+%g0]0x89,%l4	! %l4 = 0000000000000000
!	%l3 = 0000000022ddc825, Mem[0000000030081400] = ff000000
	stba	%l3,[%i2+%g0]0x81	! Mem[0000000030081400] = 25000000
!	%l0 = 00000000ff000000, %l4 = 0000000000000000, %y  = 00000000
	umul	%l0,%l4,%l6		! %l6 = 0000000000000000, %y = 00000000

p0_label_264:
!	Starting 10 instruction Load Burst
!	Mem[0000000030181400] = 0c098c5f, %l5 = 000000000c098c5f
	lduha	[%i6+%g0]0x89,%l5	! %l5 = 0000000000008c5f
!	Mem[0000000030141410] = 00000000, %f5  = 00000000
	lda	[%i5+%o5]0x89,%f5 	! %f5 = 00000000
!	Mem[0000000010041400] = 000000000000ffff, %l7 = 0000000000000000
	ldxa	[%i1+%g0]0x80,%l7	! %l7 = 000000000000ffff
!	Mem[0000000010001432] = 000000ff, %l6 = 0000000000000000, %asi = 80
	ldsha	[%i0+0x032]%asi,%l6	! %l6 = 00000000000000ff
!	Mem[00000000300c1408] = 00000000 0000ff4a, %l0 = ff000000, %l1 = 00000000
	ldda	[%i3+%o4]0x89,%l0	! %l0 = 000000000000ff4a 0000000000000000
!	Mem[0000000010081400] = 00000000, %l5 = 0000000000008c5f
	lduwa	[%i2+%g0]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000030141400] = a686f73c 0000ffff, %l4 = 00000000, %l5 = 00000000
	ldda	[%i5+%g0]0x81,%l4	! %l4 = 00000000a686f73c 000000000000ffff
!	Mem[000000001018142a] = 5700ff00, %l1 = 0000000000000000, %asi = 80
	ldsha	[%i6+0x02a]%asi,%l1	! %l1 = ffffffffffffff00
!	Mem[0000000030041410] = ff000dff, %l4 = 00000000a686f73c
	lduba	[%i1+%o5]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[00000000300c1410] = 0000000000000000, %f30 = 21d58c72 3dd76b7b
	ldda	[%i3+%o5]0x89,%f30	! %f30 = 00000000 00000000

p0_label_265:
!	Starting 10 instruction Store Burst
!	Mem[0000000010101400] = 00000000, %l0 = 000000000000ff4a
	ldstuba	[%i4+%g0]0x80,%l0	! %l0 = 0000000000000000
!	Mem[0000000030141410] = 00000000, %l4 = 00000000000000ff
	swapa	[%i5+%o5]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000010181400] = ff000000, %l0 = 0000000000000000
	swapa	[%i6+%g0]0x80,%l0	! %l0 = 00000000ff000000
!	Mem[00000000201c0000] = 00002520, %l6 = 00000000000000ff
	ldstuba	[%o0+0x000]%asi,%l6	! %l6 = 0000000000000000
!	%l5 = 000000000000ffff, Mem[0000000010141418] = 000000ffffffffff, %asi = 80
	stxa	%l5,[%i5+0x018]%asi	! Mem[0000000010141418] = 000000000000ffff
!	%f27 = 0c098c5f, Mem[0000000010081400] = 00000000
	sta	%f27,[%i2+%g0]0x80	! Mem[0000000010081400] = 0c098c5f
!	%l0 = 00000000ff000000, immd = 0000000000000af2, %l6  = 0000000000000000
	mulx	%l0,0xaf2,%l6		! %l6 = 00000ae70e000000
!	Mem[00000000300c1400] = ff000000, %l5 = 000000000000ffff
	ldstuba	[%i3+%g0]0x81,%l5	! %l5 = 00000000000000ff
!	%l7 = 000000000000ffff, Mem[0000000010141436] = 0000006e, %asi = 80
	stha	%l7,[%i5+0x036]%asi	! Mem[0000000010141434] = 0000ffff
!	Mem[0000000030181408] = 000000ff, %l4 = 0000000000000000
	ldstuba	[%i6+%o4]0x89,%l4	! %l4 = 00000000000000ff

p0_label_266:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141400] = 00000000 00000000, %l0 = ff000000, %l1 = ffffff00
	ldda	[%i5+%g0]0x80,%l0	! %l0 = 0000000000000000 0000000000000000
!	Mem[0000000030181400] = 0c098c5f, %l1 = 0000000000000000
	lduba	[%i6+%g0]0x89,%l1	! %l1 = 000000000000005f
!	Mem[00000000100c140a] = ff000071, %l1 = 000000000000005f
	ldsh	[%i3+0x00a],%l1		! %l1 = 0000000000000071
!	Mem[0000000030081400] = 00000025, %l0 = 0000000000000000
	lduwa	[%i2+%g0]0x89,%l0	! %l0 = 0000000000000025
!	Mem[0000000030141408] = 0000000022ddc825, %f2  = 00000000 0000ff4a
	ldda	[%i5+%o4]0x89,%f2 	! %f2  = 00000000 22ddc825
!	Mem[000000001008143c] = 00000000, %l1 = 0000000000000071, %asi = 80
	lduha	[%i2+0x03c]%asi,%l1	! %l1 = 0000000000000000
!	Mem[0000000010101410] = 0000000000000000, %l6 = 00000ae70e000000
	ldxa	[%i4+%o5]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000010041408] = ff000000, %l2 = 00000000000000ff
	lduwa	[%i1+%o4]0x88,%l2	! %l2 = 00000000ff000000
!	Mem[00000000300c1400] = 000000ff, %l0 = 0000000000000025
	ldsha	[%i3+%g0]0x89,%l0	! %l0 = 00000000000000ff
!	Mem[0000000010181408] = 00000000, %l5 = 00000000000000ff
	lduwa	[%i6+%o4]0x80,%l5	! %l5 = 0000000000000000

p0_label_267:
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1408] = 710000ff, %l7 = 000000000000ffff
	swapa	[%i3+%o4]0x88,%l7	! %l7 = 00000000710000ff
!	%l1 = 0000000000000000, Mem[0000000010001400] = 00000000000035ff
	stxa	%l1,[%i0+%g0]0x88	! Mem[0000000010001400] = 0000000000000000
!	Mem[0000000030001400] = ff000000, %l3 = 0000000022ddc825
	ldstuba	[%i0+%g0]0x81,%l3	! %l3 = 00000000000000ff
!	%f10 = 4a000000, Mem[0000000030041410] = ff0d00ff
	sta	%f10,[%i1+%o5]0x81	! Mem[0000000030041410] = 4a000000
!	%l0 = 000000ff, %l1 = 00000000, Mem[0000000030101410] = 00000000 00000060
	stda	%l0,[%i4+%o5]0x89	! Mem[0000000030101410] = 000000ff 00000000
!	Code Fragment 3, seed = 274931
p0_fragment_22:
!	%l0 = 00000000000000ff
	setx	0x35e93d9a24094b8e,%g7,%l0 ! %l0 = 35e93d9a24094b8e
!	%l1 = 0000000000000000
	setx	0x78a8705898594339,%g7,%l1 ! %l1 = 78a8705898594339
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = 35e93d9a24094b8e
	setx	0x9546df1f14c146f4,%g7,%l0 ! %l0 = 9546df1f14c146f4
!	%l1 = 78a8705898594339
	setx	0x4356722307c0d9bf,%g7,%l1 ! %l1 = 4356722307c0d9bf
p0_fragment_22_end:
!	%f30 = 00000000 00000000, %l2 = 00000000ff000000
!	Mem[0000000010081438] = ff00000000000000
	add	%i2,0x038,%g1
	stda	%f30,[%g1+%l2]ASI_PST32_P ! Mem[0000000010081438] = ff00000000000000
!	%l6 = 0000000000000000, Mem[0000000010181408] = 0000000000000000
	stxa	%l6,[%i6+%o4]0x88	! Mem[0000000010181408] = 0000000000000000
!	%l4 = 00000000000000ff, Mem[0000000010001410] = 00000000
	stha	%l4,[%i0+%o5]0x80	! Mem[0000000010001410] = 00ff0000
!	Mem[0000000010041420] = 0000000017ffff00, %l7 = 00000000710000ff, %l0 = 9546df1f14c146f4
	add	%i1,0x20,%g1
	casxa	[%g1]0x80,%l7,%l0	! %l0 = 0000000017ffff00

p0_label_268:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = 000000ff, %l2 = 00000000ff000000
	ldswa	[%i5+%o5]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030101410] = ff00000000000000, %l3 = 00000000000000ff
	ldxa	[%i4+%o5]0x81,%l3	! %l3 = ff00000000000000
!	Mem[0000000010041410] = 00000000, %l7 = 00000000710000ff
	lduba	[%i1+%o5]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000030101410] = 000000ff, %f22 = 00000000
	lda	[%i4+%o5]0x89,%f22	! %f22 = 000000ff
!	%l6 = 0000000000000000, immd = 00000961, %y  = 00000000
	sdiv	%l6,0x961,%l3		! %l3 = 0000000000000000
	mov	%l0,%y			! %y = 17ffff00
!	Mem[0000000010101410] = 00000000, %f2  = 00000000
	lda	[%i4+%o5]0x88,%f2 	! %f2 = 00000000
!	Mem[0000000010101410] = 00000000, %l5 = 0000000000000000
	lduha	[%i4+%o5]0x80,%l5	! %l5 = 0000000000000000
!	Mem[0000000030181408] = ff000000, %f24 = 4abcde28
	lda	[%i6+%o4]0x81,%f24	! %f24 = ff000000
!	Mem[0000000030041400] = a60000ff, %l3 = 0000000000000000
	ldsba	[%i1+%g0]0x81,%l3	! %l3 = ffffffffffffffa6
!	Mem[0000000030141400] = a686f73c, %l4 = 00000000000000ff
	lduwa	[%i5+%g0]0x81,%l4	! %l4 = 00000000a686f73c

p0_label_269:
!	Starting 10 instruction Store Burst
!	%f4  = 00000000 00000000, Mem[0000000010101400] = 000000ff ff000000
	stda	%f4 ,[%i4+%g0]0x88	! Mem[0000000010101400] = 00000000 00000000
!	Mem[0000000010081410] = 000000ff, %l5 = 0000000000000000
	ldstuba	[%i2+%o5]0x88,%l5	! %l5 = 00000000000000ff
!	%f17 = 00000000, Mem[0000000010081438] = ff000000
	sta	%f17,[%i2+0x038]%asi	! Mem[0000000010081438] = 00000000
!	%l2 = 00000000000000ff, Mem[0000000010101426] = 00000000, %asi = 80
	stha	%l2,[%i4+0x026]%asi	! Mem[0000000010101424] = 000000ff
!	%l1 = 4356722307c0d9bf, Mem[0000000010141410] = 000000ff
	stba	%l1,[%i5+%o5]0x88	! Mem[0000000010141410] = 000000bf
!	Mem[0000000010081410] = ff000000, %l7 = 0000000000000000
	swapa	[%i2+%o5]0x80,%l7	! %l7 = 00000000ff000000
!	%l4 = a686f73c, %l5 = 000000ff, Mem[00000000100c1400] = ff000000 ffffc825
	stda	%l4,[%i3+%g0]0x88	! Mem[00000000100c1400] = a686f73c 000000ff
!	%l3 = ffffffffffffffa6, Mem[0000000010181410] = 4a310e7e00000000
	stxa	%l3,[%i6+%o5]0x80	! Mem[0000000010181410] = ffffffffffffffa6
!	%f22 = 000000ff ff0d0040, Mem[0000000010041408] = ff000000 00000000
	stda	%f22,[%i1+%o4]0x88	! Mem[0000000010041408] = 000000ff ff0d0040
!	Mem[0000000030001408] = 032c35bc, %l0 = 0000000017ffff00
	swapa	[%i0+%o4]0x89,%l0	! %l0 = 00000000032c35bc

p0_label_270:
!	Starting 10 instruction Load Burst
!	Mem[00000000201c0000] = ff002520, %l0 = 00000000032c35bc, %asi = 80
	lduha	[%o0+0x000]%asi,%l0	! %l0 = 000000000000ff00
!	Mem[0000000030101400] = 00000000, %l2 = 00000000000000ff
	ldswa	[%i4+%g0]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000030101408] = ff000071, %l7 = 00000000ff000000
	lduwa	[%i4+%o4]0x81,%l7	! %l7 = 00000000ff000071
!	Mem[0000000010181400] = 00000000, %l1 = 4356722307c0d9bf
	ldsba	[%i6+%g0]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000030181400] = 5f8c090c, %f7  = 7fffffff
	lda	[%i6+%g0]0x81,%f7 	! %f7 = 5f8c090c
!	Mem[00000000211c0000] = ffff7fb0, %l7 = 00000000ff000071
	ldub	[%o2+%g0],%l7		! %l7 = 00000000000000ff
!	Mem[0000000030141410] = ff00000000000000, %l0 = 000000000000ff00
	ldxa	[%i5+%o5]0x81,%l0	! %l0 = ff00000000000000
!	Mem[00000000100c1410] = 000000ff, %l3 = ffffffffffffffa6
	ldsba	[%i3+%o5]0x88,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010181410] = ffffffff, %f23 = ff0d0040
	lda	[%i6+%o5]0x80,%f23	! %f23 = ffffffff
!	Mem[0000000030041410] = 0000004a, %l6 = 0000000000000000
	ldsba	[%i1+%o5]0x89,%l6	! %l6 = 000000000000004a

p0_label_271:
!	Starting 10 instruction Store Burst
!	%l5 = 00000000000000ff, Mem[0000000010181410] = ffffffff
	stwa	%l5,[%i6+%o5]0x88	! Mem[0000000010181410] = 000000ff
!	Mem[0000000010101410] = 00000000, %l3 = ffffffffffffffff
	ldstuba	[%i4+%o5]0x88,%l3	! %l3 = 0000000000000000
!	%l2 = 00000000, %l3 = 00000000, Mem[0000000010181428] = 5700ff00 ff000000
	std	%l2,[%i6+0x028]		! Mem[0000000010181428] = 00000000 00000000
!	%l5 = 00000000000000ff, immd = fffff88e, %y  = 17ffff00
	sdiv	%l5,-0x772,%l1		! %l1 = ffffffff80000000
	mov	%l0,%y			! %y = 00000000
!	%f24 = ff000000 333dec99, Mem[0000000010101408] = ffff0000 00000000
	stda	%f24,[%i4+%o4]0x80	! Mem[0000000010101408] = ff000000 333dec99
!	%l0 = ff00000000000000, Mem[0000000021800100] = ff78c6a0
	sth	%l0,[%o3+0x100]		! Mem[0000000021800100] = 0000c6a0
!	Mem[0000000030041410] = 0000004a, %l5 = 00000000000000ff
	ldstuba	[%i1+%o5]0x89,%l5	! %l5 = 000000000000004a
!	Mem[0000000030141410] = ff000000, %l2 = 0000000000000000
	swapa	[%i5+%o5]0x81,%l2	! %l2 = 00000000ff000000
!	%f20 = 5f8c090c 00000000, Mem[00000000100c1410] = 000000ff 40000dff
	stda	%f20,[%i3+%o5]0x88	! Mem[00000000100c1410] = 5f8c090c 00000000
!	Mem[0000000010081407] = 00000000, %l1 = ffffffff80000000
	ldstuba	[%i2+0x007]%asi,%l1	! %l1 = 0000000000000000

p0_label_272:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = 00000000, %l7 = 00000000000000ff
	ldswa	[%i3+%o5]0x80,%l7	! %l7 = 0000000000000000
!	Mem[000000001004141c] = ff0d0040, %l3 = 0000000000000000, %asi = 80
	lduha	[%i1+0x01c]%asi,%l3	! %l3 = 000000000000ff0d
!	Mem[0000000010001400] = 00000000, %l6 = 000000000000004a
	ldsha	[%i0+%g0]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000010181408] = 0000000000000000, %f14 = 9689f254 00000000
	ldda	[%i6+%o4]0x80,%f14	! %f14 = 00000000 00000000
!	Mem[00000000100c1408] = ffff0000, %l2 = 00000000ff000000
	lduha	[%i3+%o4]0x80,%l2	! %l2 = 000000000000ffff
!	Mem[0000000010081410] = 00000000, %l4 = 00000000a686f73c
	lduba	[%i2+%o5]0x88,%l4	! %l4 = 0000000000000000
!	Mem[00000000100c1420] = 000000ff, %l2 = 000000000000ffff, %asi = 80
	lduwa	[%i3+0x020]%asi,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030141410] = 00000000 00000000, %l2 = 000000ff, %l3 = 0000ff0d
	ldda	[%i5+%o5]0x89,%l2	! %l2 = 0000000000000000 0000000000000000
!	Mem[0000000010081410] = 00000000, %f26 = 3cf786a6
	lda	[%i2+%o5]0x88,%f26	! %f26 = 00000000
!	Mem[0000000010081410] = 00000000, %l3 = 0000000000000000
	ldswa	[%i2+%o5]0x80,%l3	! %l3 = 0000000000000000

p0_label_273:
!	Starting 10 instruction Store Burst
!	Mem[00000000100c1410] = 00000000, %l7 = 0000000000000000
	ldstuba	[%i3+%o5]0x80,%l7	! %l7 = 0000000000000000
!	%l0 = ff00000000000000, Mem[0000000010101408] = ff000000
	stwa	%l0,[%i4+%o4]0x80	! Mem[0000000010101408] = 00000000
!	%l4 = 0000000000000000, Mem[0000000021800100] = 0000c6a0, %asi = 80
	stha	%l4,[%o3+0x100]%asi	! Mem[0000000021800100] = 0000c6a0
!	%l6 = 0000000000000000, Mem[0000000010041400] = 00000000
	stwa	%l6,[%i1+%g0]0x80	! Mem[0000000010041400] = 00000000
!	%f27 = 0c098c5f, Mem[0000000010101400] = 00000000
	sta	%f27,[%i4+%g0]0x88	! Mem[0000000010101400] = 0c098c5f
!	%l1 = 0000000000000000, Mem[0000000030141408] = 25c8dd22
	stha	%l1,[%i5+%o4]0x81	! Mem[0000000030141408] = 0000dd22
!	%l4 = 0000000000000000, Mem[0000000030181410] = ff000f5d
	stha	%l4,[%i6+%o5]0x81	! Mem[0000000030181410] = 00000f5d
!	%l6 = 0000000000000000, Mem[0000000030041410] = 00000000000000ff
	stxa	%l6,[%i1+%o5]0x89	! Mem[0000000030041410] = 0000000000000000
!	Mem[00000000211c0000] = ffff7fb0, %l3 = 0000000000000000
	ldstuba	[%o2+0x000]%asi,%l3	! %l3 = 00000000000000ff
!	Mem[0000000010181430] = 00000000, %l6 = 0000000000000000
	swap	[%i6+0x030],%l6		! %l6 = 0000000000000000

p0_label_274:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081408] = ff0000ff, %l6 = 0000000000000000
	ldsba	[%i2+%o4]0x80,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000030101400] = 00000000, %l7 = 0000000000000000
	ldswa	[%i4+%g0]0x81,%l7	! %l7 = 0000000000000000
!	Mem[0000000030001400] = 000000ff, %l6 = ffffffffffffffff
	lduha	[%i0+%g0]0x89,%l6	! %l6 = 00000000000000ff
!	Mem[0000000030041410] = 00000000, %f7  = 5f8c090c
	lda	[%i1+%o5]0x89,%f7 	! %f7 = 00000000
!	Mem[0000000030101410] = 00000000000000ff, %f30 = 00000000 00000000
	ldda	[%i4+%o5]0x89,%f30	! %f30 = 00000000 000000ff
!	Mem[0000000030041410] = 0000000000000000, %l6 = 00000000000000ff
	ldxa	[%i1+%o5]0x81,%l6	! %l6 = 0000000000000000
!	Mem[0000000030101408] = 710000ff, %l1 = 0000000000000000
	ldsha	[%i4+%o4]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030081400] = 00000025, %l6 = 0000000000000000
	ldsha	[%i2+%g0]0x89,%l6	! %l6 = 0000000000000025
!	Mem[0000000030041410] = 00000000, %l7 = 0000000000000000
	ldswa	[%i1+%o5]0x89,%l7	! %l7 = 0000000000000000
!	Mem[00000000100c1400] = a686f73c, %l7 = 0000000000000000
	lduwa	[%i3+%g0]0x88,%l7	! %l7 = 00000000a686f73c

p0_label_275:
!	Starting 10 instruction Store Burst
!	%f10 = 4a000000, Mem[0000000010001400] = 00000000
	sta	%f10,[%i0+%g0]0x88	! Mem[0000000010001400] = 4a000000
!	Mem[0000000010041410] = 00000000, %l4 = 0000000000000000
	swapa	[%i1+%o5]0x80,%l4	! %l4 = 0000000000000000
!	%l1 = 00000000000000ff, Mem[00000000100c140c] = 00000000, %asi = 80
	stwa	%l1,[%i3+0x00c]%asi	! Mem[00000000100c140c] = 000000ff
!	%l3 = 00000000000000ff, Mem[0000000020800000] = ff00c750, %asi = 80
	stha	%l3,[%o1+0x000]%asi	! Mem[0000000020800000] = 00ffc750
!	%l0 = 00000000, %l1 = 000000ff, Mem[0000000030141400] = a686f73c 0000ffff
	stda	%l0,[%i5+%g0]0x81	! Mem[0000000030141400] = 00000000 000000ff
!	%l6 = 00000025, %l7 = a686f73c, Mem[0000000010141420] = 27ffcdf8 529a00ff, %asi = 80
	stda	%l6,[%i5+0x020]%asi	! Mem[0000000010141420] = 00000025 a686f73c
!	%l6 = 00000025, %l7 = a686f73c, Mem[0000000010081408] = ff0000ff 22ddc825
	stda	%l6,[%i2+%o4]0x80	! Mem[0000000010081408] = 00000025 a686f73c
!	%f6  = 00000000 00000000, Mem[0000000030081408] = ff000000 00000000
	stda	%f6 ,[%i2+%o4]0x81	! Mem[0000000030081408] = 00000000 00000000
!	Mem[00000000100c1408] = ffff0000, %l7 = 00000000a686f73c
	swapa	[%i3+%o4]0x80,%l7	! %l7 = 00000000ffff0000
!	%l7 = 00000000ffff0000, Mem[0000000030081410] = ff000000
	stwa	%l7,[%i2+%o5]0x81	! Mem[0000000030081410] = ffff0000

p0_label_276:
!	Starting 10 instruction Load Burst
!	Mem[0000000030081408] = 0000000000000000, %l3 = 00000000000000ff
	ldxa	[%i2+%o4]0x89,%l3	! %l3 = 0000000000000000
!	Mem[0000000030141400] = 00000000000000ff, %l7 = 00000000ffff0000
	ldxa	[%i5+%g0]0x81,%l7	! %l7 = 00000000000000ff
!	Mem[0000000030181408] = 000000ff, %l7 = 00000000000000ff
	lduba	[%i6+%o4]0x89,%l7	! %l7 = 00000000000000ff
!	Mem[00000000100c143e] = 00000027, %l4 = 0000000000000000
	ldsh	[%i3+0x03e],%l4		! %l4 = 0000000000000027
!	%l2 = 0000000000000000, imm = 0000000000000229, %l6 = 0000000000000025
	subc	%l2,0x229,%l6		! %l6 = fffffffffffffdd7
!	Mem[0000000010081400] = 0c098c5f 000000ff, %l6 = fffffdd7, %l7 = 000000ff
	ldd	[%i2+%g0],%l6		! %l6 = 000000000c098c5f 00000000000000ff
!	Mem[0000000030081400] = 25000000, %l0 = ff00000000000000
	ldsha	[%i2+%g0]0x81,%l0	! %l0 = 0000000000002500
!	Mem[0000000030181408] = 000000ff, %l4 = 0000000000000027
	ldswa	[%i6+%o4]0x89,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010081400] = 5f8c090c, %l5 = 000000000000004a
	ldsha	[%i2+%g0]0x88,%l5	! %l5 = 000000000000090c
!	Mem[0000000010101408] = 00000000, %l0 = 0000000000002500
	ldsba	[%i4+%o4]0x88,%l0	! %l0 = 0000000000000000

p0_label_277:
!	Starting 10 instruction Store Burst
!	%l0 = 0000000000000000, Mem[0000000030001410] = ff000000
	stba	%l0,[%i0+%o5]0x89	! Mem[0000000030001410] = ff000000
!	%l0 = 00000000, %l1 = 000000ff, Mem[00000000300c1400] = 000000ff fffd87a6
	stda	%l0,[%i3+%g0]0x89	! Mem[00000000300c1400] = 00000000 000000ff
!	%l5 = 000000000000090c, Mem[0000000010141408] = 00000000
	stba	%l5,[%i5+%o4]0x88	! Mem[0000000010141408] = 0000000c
!	%f0  = fffd87a6 000000ff, %l1 = 00000000000000ff
!	Mem[00000000300c1420] = 0000000000000071
	add	%i3,0x020,%g1
	stda	%f0,[%g1+%l1]ASI_PST8_S ! Mem[00000000300c1420] = fffd87a6000000ff
!	%f14 = 00000000 00000000, Mem[00000000100c1428] = ff0dff40 00000000
	std	%f14,[%i3+0x028]	! Mem[00000000100c1428] = 00000000 00000000
!	%f14 = 00000000 00000000, Mem[0000000030001400] = 000000ff ffffffff
	stda	%f14,[%i0+%g0]0x89	! Mem[0000000030001400] = 00000000 00000000
!	Mem[0000000030081410] = ffff0000, %l5 = 000000000000090c
	ldstuba	[%i2+%o5]0x81,%l5	! %l5 = 00000000000000ff
!	Mem[0000000010181408] = 00000000, %l1 = 00000000000000ff
	swapa	[%i6+%o4]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000010001408] = 00000000, %l7 = 00000000000000ff
	ldstuba	[%i0+%o4]0x88,%l7	! %l7 = 0000000000000000
!	Mem[0000000010101418] = 00000060, %l7 = 0000000000000000
	swap	[%i4+0x018],%l7		! %l7 = 0000000000000060

p0_label_278:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101410] = ff000000, %l5 = 00000000000000ff
	lduha	[%i4+%o5]0x80,%l5	! %l5 = 000000000000ff00
!	Mem[00000000100c1410] = 000000ff, %l6 = 000000000c098c5f
	lduba	[%i3+%o5]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[0000000010141410] = ff000dff000000bf, %f0  = fffd87a6 000000ff
	ldda	[%i5+%o5]0x88,%f0 	! %f0  = ff000dff 000000bf
!	Mem[0000000030041400] = 00000000 ff0000a6, %l6 = 000000ff, %l7 = 00000060
	ldda	[%i1+%g0]0x89,%l6	! %l6 = 00000000ff0000a6 0000000000000000
!	Mem[0000000010081408] = 00000025, %l6 = 00000000ff0000a6
	lduwa	[%i2+%o4]0x80,%l6	! %l6 = 0000000000000025
!	Mem[0000000010141420] = 00000025, %l7 = 0000000000000000, %asi = 80
	ldsha	[%i5+0x020]%asi,%l7	! %l7 = 0000000000000000
!	Mem[0000000021800141] = 000048d0, %l6 = 0000000000000025
	ldsb	[%o3+0x141],%l6		! %l6 = 0000000000000000
!	Mem[0000000030141410] = 0000000000000000, %f0  = ff000dff 000000bf
	ldda	[%i5+%o5]0x81,%f0 	! %f0  = 00000000 00000000
!	Mem[0000000010141410] = bf000000, %l6 = 0000000000000000
	ldsba	[%i5+%o5]0x80,%l6	! %l6 = ffffffffffffffbf
!	Mem[0000000030141410] = 0000000000000000, %f2  = 00000000 22ddc825
	ldda	[%i5+%o5]0x81,%f2 	! %f2  = 00000000 00000000

p0_label_279:
!	Starting 10 instruction Store Burst
!	Mem[0000000010101403] = 5f8c090c, %l5 = 000000000000ff00
	ldstuba	[%i4+0x003]%asi,%l5	! %l5 = 000000000000000c
!	%l7 = 0000000000000000, Mem[00000000100c1430] = 0000ddff
	sth	%l7,[%i3+0x030]		! Mem[00000000100c1430] = 0000ddff
!	%l1 = 0000000000000000, Mem[0000000010041410] = 00000000
	stw	%l1,[%i1+%o5]		! Mem[0000000010041410] = 00000000
!	Mem[0000000030081410] = 0000ffff, %l2 = 0000000000000000
	swapa	[%i2+%o5]0x89,%l2	! %l2 = 000000000000ffff
!	%f20 = 5f8c090c 00000000, Mem[0000000010181438] = 00000000 00000000
	std	%f20,[%i6+0x038]	! Mem[0000000010181438] = 5f8c090c 00000000
!	%l2 = 000000000000ffff, Mem[0000000010101428] = 00000000
	stw	%l2,[%i4+0x028]		! Mem[0000000010101428] = 0000ffff
!	%l2 = 0000ffff, %l3 = 00000000, Mem[0000000010001400] = 4a000000 00000000
	stda	%l2,[%i0+%g0]0x88	! Mem[0000000010001400] = 0000ffff 00000000
!	Mem[0000000030101400] = 00000000, %l3 = 0000000000000000
	swapa	[%i4+%g0]0x81,%l3	! %l3 = 0000000000000000
!	Mem[0000000010181410] = ff000000, %l4 = 00000000000000ff
	ldstuba	[%i6+%o5]0x80,%l4	! %l4 = 00000000000000ff
!	Mem[0000000010101400] = 5f8c09ff, %l3 = 0000000000000000
	ldstuba	[%i4+%g0]0x80,%l3	! %l3 = 000000000000005f

p0_label_280:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1408] = 3cf786a6, %l1 = 0000000000000000
	lduwa	[%i3+%o4]0x88,%l1	! %l1 = 000000003cf786a6
!	Mem[0000000020800000] = 00ffc750, %l5 = 000000000000000c
	lduh	[%o1+%g0],%l5		! %l5 = 00000000000000ff
!	Mem[00000000100c1410] = ff000000, %l7 = 0000000000000000
	ldsba	[%i3+%o5]0x80,%l7	! %l7 = ffffffffffffffff
!	Mem[00000000100c1408] = ff000000 3cf786a6, %l6 = ffffffbf, %l7 = ffffffff
	ldda	[%i3+%o4]0x88,%l6	! %l6 = 000000003cf786a6 00000000ff000000
!	Mem[0000000010101400] = ff8c09ff, %l4 = 00000000000000ff
	lduwa	[%i4+%g0]0x80,%l4	! %l4 = 00000000ff8c09ff
!	Mem[0000000010001410] = 0000ff00, %l5 = 00000000000000ff
	ldswa	[%i0+%o5]0x88,%l5	! %l5 = 000000000000ff00
!	Mem[0000000010141420] = 00000025, %l0 = 0000000000000000, %asi = 80
	ldswa	[%i5+0x020]%asi,%l0	! %l0 = 0000000000000025
!	Mem[0000000030081408] = 0000000000000000, %l0 = 0000000000000025
	ldxa	[%i2+%o4]0x89,%l0	! %l0 = 0000000000000000
!	Mem[0000000021800000] = 00ff95e0, %l1 = 000000003cf786a6
	ldsb	[%o3+%g0],%l1		! %l1 = 0000000000000000
!	Mem[0000000030101400] = 00000000, %l7 = 00000000ff000000
	ldswa	[%i4+%g0]0x89,%l7	! %l7 = 0000000000000000

p0_label_281:
!	Starting 10 instruction Store Burst
!	%l4 = 00000000ff8c09ff, Mem[00000000201c0000] = ff002520
	sth	%l4,[%o0+%g0]		! Mem[00000000201c0000] = 09ff2520
!	%l4 = ff8c09ff, %l5 = 0000ff00, Mem[0000000010081408] = 25000000 3cf786a6
	stda	%l4,[%i2+%o4]0x88	! Mem[0000000010081408] = ff8c09ff 0000ff00
!	%l6 = 000000003cf786a6, immd = fffff0a8, %y  = 00000000
	smul	%l6,-0xf58,%l1		! %l1 = fffffc588a05fcf0, %y = fffffc58
!	%l7 = 0000000000000000, Mem[0000000010101414] = 00000000
	stw	%l7,[%i4+0x014]		! Mem[0000000010101414] = 00000000
!	Mem[0000000030141400] = 00000000, %l7 = 0000000000000000
	swapa	[%i5+%g0]0x81,%l7	! %l7 = 0000000000000000
!	Code Fragment 3, seed = 550628
p0_fragment_23:
!	%l0 = 0000000000000000
	setx	0xc15239aedec46506,%g7,%l0 ! %l0 = c15239aedec46506
!	%l1 = fffffc588a05fcf0
	setx	0x1881daf347408331,%g7,%l1 ! %l1 = 1881daf347408331
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = c15239aedec46506
	setx	0x3a2c5f920ffde56c,%g7,%l0 ! %l0 = 3a2c5f920ffde56c
!	%l1 = 1881daf347408331
	setx	0xe1a3403351968eb7,%g7,%l1 ! %l1 = e1a3403351968eb7
p0_fragment_23_end:
!	%f8  = 00000000, %f14 = 00000000, %f23 = ffffffff
	fadds	%f8 ,%f14,%f23		! %f23 = 00000000
!	%f30 = 00000000 000000ff, Mem[0000000030181408] = 000000ff 00000000
	stda	%f30,[%i6+%o4]0x89	! Mem[0000000030181408] = 00000000 000000ff
!	Mem[0000000010101400] = ff098cff, %l6 = 000000003cf786a6
	ldstuba	[%i4+%g0]0x88,%l6	! %l6 = 00000000000000ff
!	%l1 = e1a3403351968eb7, Mem[0000000010181420] = ffdd0000ff2200ff, %asi = 80
	stxa	%l1,[%i6+0x020]%asi	! Mem[0000000010181420] = e1a3403351968eb7

p0_label_282:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1410] = 000000ff, %l2 = 000000000000ffff
	ldswa	[%i3+%o5]0x88,%l2	! %l2 = 00000000000000ff
!	Mem[0000000010041400] = 00000000, %l1 = e1a3403351968eb7
	lduha	[%i1+%g0]0x80,%l1	! %l1 = 0000000000000000
!	Mem[0000000020800000] = 00ffc750, %l0 = 3a2c5f920ffde56c, %asi = 80
	lduha	[%o1+0x000]%asi,%l0	! %l0 = 00000000000000ff
!	Mem[0000000030101400] = 00000000000000ff, %f18 = 000000ff 00000000
	ldda	[%i4+%g0]0x81,%f18	! %f18 = 00000000 000000ff
!	Mem[0000000010001408] = ff000000, %l6 = 00000000000000ff
	lduha	[%i0+%o4]0x80,%l6	! %l6 = 000000000000ff00
!	Mem[0000000030181410] = 00000f5d, %f14 = 00000000
	lda	[%i6+%o5]0x81,%f14	! %f14 = 00000f5d
!	Mem[0000000021800140] = 000048d0, %l7 = 0000000000000000
	ldsh	[%o3+0x140],%l7		! %l7 = 0000000000000000
!	Mem[0000000010101400] = ff098cff, %l6 = 000000000000ff00
	lduwa	[%i4+%g0]0x88,%l6	! %l6 = 00000000ff098cff
!	Mem[0000000010001400] = 0000ffff, %l1 = 0000000000000000
	lduha	[%i0+%g0]0x88,%l1	! %l1 = 000000000000ffff
!	Mem[0000000030101400] = 00000000, %l3 = 000000000000005f
	ldswa	[%i4+%g0]0x89,%l3	! %l3 = 0000000000000000

p0_label_283:
!	Starting 10 instruction Store Burst
!	%f2  = 00000000 00000000, Mem[0000000030141400] = 00000000 000000ff
	stda	%f2 ,[%i5+%g0]0x81	! Mem[0000000030141400] = 00000000 00000000
!	%f26 = 00000000 0c098c5f, %l1 = 000000000000ffff
!	Mem[0000000010081410] = 0000000000000000
	add	%i2,0x010,%g1
	stda	%f26,[%g1+%l1]ASI_PST16_P ! Mem[0000000010081410] = 000000000c098c5f
!	Mem[00000000300c1410] = 00000000, %l1 = 000000000000ffff
	ldstuba	[%i3+%o5]0x89,%l1	! %l1 = 0000000000000000
!	%f5  = 00000000, Mem[0000000010101400] = ff098cff
	sta	%f5 ,[%i4+%g0]0x88	! Mem[0000000010101400] = 00000000
!	Mem[0000000010081400] = 0c098c5f, %l0 = 00000000000000ff
	swapa	[%i2+%g0]0x80,%l0	! %l0 = 000000000c098c5f
!	Mem[0000000030081408] = 00000000, %l3 = 0000000000000000
	ldstuba	[%i2+%o4]0x89,%l3	! %l3 = 0000000000000000
!	Mem[00000000201c0001] = 09ff2520, %l3 = 0000000000000000
	ldstub	[%o0+0x001],%l3		! %l3 = 00000000000000ff
!	Mem[0000000010181408] = ff000000, %l6 = 00000000ff098cff, %asi = 80
	swapa	[%i6+0x008]%asi,%l6	! %l6 = 00000000ff000000
!	%l3 = 00000000000000ff, Mem[0000000030101400] = 00000000
	stba	%l3,[%i4+%g0]0x89	! Mem[0000000030101400] = 000000ff
!	Mem[00000000300c1400] = 00000000, %l6 = 00000000ff000000
	ldstuba	[%i3+%g0]0x89,%l6	! %l6 = 0000000000000000

p0_label_284:
!	Starting 10 instruction Load Burst
!	Mem[0000000010101428] = 0000ffff, %l6 = 0000000000000000
	ldsh	[%i4+0x028],%l6		! %l6 = 0000000000000000
!	Mem[00000000100c1408] = a686f73c000000ff, %f20 = 5f8c090c 00000000
	ldda	[%i3+%o4]0x80,%f20	! %f20 = a686f73c 000000ff
!	Mem[0000000010081430] = ff000000, %l6 = 0000000000000000, %asi = 80
	lduwa	[%i2+0x030]%asi,%l6	! %l6 = 00000000ff000000
!	Mem[00000000100c1408] = a686f73c, %l0 = 000000000c098c5f, %asi = 80
	lduwa	[%i3+0x008]%asi,%l0	! %l0 = 00000000a686f73c
!	%f4  = 00000000, %f18 = 00000000, %f29 = 00000000
	fadds	%f4 ,%f18,%f29		! %f29 = 00000000
!	Mem[0000000030001408] = 00ffff17, %l5 = 000000000000ff00
	ldsba	[%i0+%o4]0x81,%l5	! %l5 = 0000000000000000
!	Mem[0000000010141400] = 00000000, %l7 = 0000000000000000
	lduwa	[%i5+%g0]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000010041410] = 00000000, %l7 = 0000000000000000
	lduha	[%i1+%o5]0x80,%l7	! %l7 = 0000000000000000
!	Mem[000000001004142c] = 0c098c5f, %l0 = 00000000a686f73c, %asi = 80
	lduha	[%i1+0x02c]%asi,%l0	! %l0 = 0000000000000c09
!	Mem[0000000030081408] = 000000ff, %l0 = 0000000000000c09
	lduwa	[%i2+%o4]0x89,%l0	! %l0 = 00000000000000ff

p0_label_285:
!	Starting 10 instruction Store Burst
!	Mem[00000000201c0001] = 09ff2520, %l6 = 00000000ff000000
	ldstub	[%o0+0x001],%l6		! %l6 = 00000000000000ff
!	%l3 = 00000000000000ff, %l6 = 00000000000000ff, %l4 = 00000000ff8c09ff
	subc	%l3,%l6,%l4		! %l4 = 0000000000000000
!	%f6  = 00000000 00000000, Mem[0000000010141410] = bf000000 ff0d00ff
	stda	%f6 ,[%i5+%o5]0x80	! Mem[0000000010141410] = 00000000 00000000
!	%f14 = 00000f5d 00000000, Mem[0000000010041430] = ff0dff40 00000000
	std	%f14,[%i1+0x030]	! Mem[0000000010041430] = 00000f5d 00000000
!	%l3 = 00000000000000ff, Mem[0000000010141410] = 00000000
	stha	%l3,[%i5+%o5]0x88	! Mem[0000000010141410] = 000000ff
!	%l2 = 000000ff, %l3 = 000000ff, Mem[0000000010001410] = 00ff0000 00000000
	stda	%l2,[%i0+%o5]0x80	! Mem[0000000010001410] = 000000ff 000000ff
!	Mem[0000000030141408] = 0000dd22, %l5 = 0000000000000000
	ldstuba	[%i5+%o4]0x81,%l5	! %l5 = 0000000000000000
!	%f4  = 00000000 00000000, %l5 = 0000000000000000
!	Mem[0000000030181430] = 0000000000000070
	add	%i6,0x030,%g1
	stda	%f4,[%g1+%l5]ASI_PST8_S ! Mem[0000000030181430] = 0000000000000070
!	Mem[0000000030081400] = 00000025, %l3 = 00000000000000ff
	swapa	[%i2+%g0]0x89,%l3	! %l3 = 0000000000000025
!	Mem[00000000300c1400] = ff000000, %l1 = 0000000000000000
	swapa	[%i3+%g0]0x81,%l1	! %l1 = 00000000ff000000

p0_label_286:
!	Starting 10 instruction Load Burst
!	Mem[0000000030141408] = 22dd00ff, %l4 = 0000000000000000
	ldswa	[%i5+%o4]0x89,%l4	! %l4 = 0000000022dd00ff
!	Mem[0000000010001410] = 000000ff, %l6 = 00000000000000ff
	ldsba	[%i0+%o5]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000010081438] = 00000000, %l1 = 00000000ff000000, %asi = 80
	lduwa	[%i2+0x038]%asi,%l1	! %l1 = 0000000000000000
!	Mem[0000000010141400] = 0000000000000000, %f8  = 00000000 00000000
	ldda	[%i5+%g0]0x88,%f8 	! %f8  = 00000000 00000000
!	Mem[0000000010081410] = 00000000, %f3  = 00000000
	lda	[%i2+%o5]0x80,%f3 	! %f3 = 00000000
!	Mem[0000000030081410] = 00000000, %l4 = 0000000022dd00ff
	lduha	[%i2+%o5]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000030001410] = ff000000, %f27 = 0c098c5f
	lda	[%i0+%o5]0x89,%f27	! %f27 = ff000000
!	Mem[00000000201c0000] = 09ff2520, %l7 = 0000000000000000
	lduh	[%o0+%g0],%l7		! %l7 = 00000000000009ff
!	Mem[0000000010141400] = 0000000000000000, %f22 = 000000ff 00000000
	ldda	[%i5+%g0]0x80,%f22	! %f22 = 00000000 00000000
!	Mem[0000000030101400] = ff000000000000ff, %f2  = 00000000 00000000
	ldda	[%i4+%g0]0x89,%f2 	! %f2  = ff000000 000000ff

p0_label_287:
!	Starting 10 instruction Store Burst
!	Mem[0000000010001418] = 7e0e314a, %l4 = 0000000000000000, %asi = 80
	swapa	[%i0+0x018]%asi,%l4	! %l4 = 000000007e0e314a
!	%f9  = 00000000, Mem[0000000030001408] = 00ffff17
	sta	%f9 ,[%i0+%o4]0x81	! Mem[0000000030001408] = 00000000
!	%l2 = 00000000000000ff, Mem[0000000010101400] = 00000000
	stha	%l2,[%i4+%g0]0x88	! Mem[0000000010101400] = 000000ff
!	%f16 = 00000000 00000000, Mem[0000000030081400] = 000000ff 22ddc825
	stda	%f16,[%i2+%g0]0x89	! Mem[0000000030081400] = 00000000 00000000
!	%f0  = 00000000 00000000, %l3 = 0000000000000025
!	Mem[0000000010081428] = 28debcff0c098c5f
	add	%i2,0x028,%g1
	stda	%f0,[%g1+%l3]ASI_PST32_P ! Mem[0000000010081428] = 28debcff00000000
!	%l0 = 00000000000000ff, Mem[0000000010141410] = ff00000000000000
	stxa	%l0,[%i5+%o5]0x80	! Mem[0000000010141410] = 00000000000000ff
!	%f28 = ff0dff40 00000000, Mem[0000000030181408] = 000000ff 00000000
	stda	%f28,[%i6+%o4]0x89	! Mem[0000000030181408] = ff0dff40 00000000
!	%f22 = 00000000, %f12 = 00000000, %f5  = 00000000
	fadds	%f22,%f12,%f5 		! %f5  = 00000000
!	%f30 = 00000000, Mem[0000000030141410] = 00000000
	sta	%f30,[%i5+%o5]0x89	! Mem[0000000030141410] = 00000000
!	%f4  = 00000000 00000000, %l2 = 00000000000000ff
!	Mem[0000000010181438] = 5f8c090c00000000
	add	%i6,0x038,%g1
	stda	%f4,[%g1+%l2]ASI_PST16_PL ! Mem[0000000010181438] = 0000000000000000

p0_label_288:
!	Starting 10 instruction Load Burst
!	Mem[00000000100c1404] = ff000000, %l1 = 0000000000000000, %asi = 80
	lduwa	[%i3+0x004]%asi,%l1	! %l1 = 00000000ff000000
!	Mem[00000000300c1400] = 00000000, %l6 = 0000000000000000
	ldsha	[%i3+%g0]0x89,%l6	! %l6 = 0000000000000000
!	Mem[0000000010081400] = 000000ff000000ff, %f8  = 00000000 00000000
	ldda	[%i2+%g0]0x80,%f8 	! %f8  = 000000ff 000000ff
!	Mem[0000000010141400] = 00000000, %f6  = 00000000
	lda	[%i5+%g0]0x88,%f6 	! %f6 = 00000000
!	Mem[0000000030101410] = 000000ff, %l3 = 0000000000000025
	ldsba	[%i4+%o5]0x89,%l3	! %l3 = ffffffffffffffff
!	Mem[0000000010041400] = 00000000, %l7 = 00000000000009ff
	ldsba	[%i1+%g0]0x80,%l7	! %l7 = 0000000000000000
!	Mem[0000000010041408] = 000000ffff0d0040, %f0  = 00000000 00000000
	ldda	[%i1+%o4]0x88,%f0 	! %f0  = 000000ff ff0d0040
!	Mem[0000000030101408] = ff000071, %l6 = 0000000000000000
	ldsba	[%i4+%o4]0x81,%l6	! %l6 = ffffffffffffffff
!	Mem[0000000030041400] = a60000ff 00000000 ff000000 00000000
!	%f16 = 00000000 00000000 00000000 000000ff
!	%f20 = a686f73c 000000ff 00000000 00000000
!	%f24 = ff000000 333dec99 00000000 ff000000
!	%f28 = ff0dff40 00000000 00000000 000000ff
	stda	%f16,[%i1+%g0]ASI_BLK_S	! Block Store to 0000000030041400
!	Mem[0000000030181400] = 5f8c090c, %l3 = ffffffffffffffff
	ldsba	[%i6+%g0]0x81,%l3	! %l3 = 000000000000005f

p0_label_289:
!	Starting 10 instruction Store Burst
!	%l2 = 00000000000000ff, Mem[0000000010041408] = 40000dff
	stha	%l2,[%i1+%o4]0x80	! Mem[0000000010041408] = 00ff0dff
!	%l1 = 00000000ff000000, %l5 = 0000000000000000, %y  = fffffc58
	smul	%l1,%l5,%l2		! %l2 = 0000000000000000, %y = 00000000
!	%l6 = ffffffffffffffff, Mem[0000000030101400] = ff000000000000ff
	stxa	%l6,[%i4+%g0]0x81	! Mem[0000000030101400] = ffffffffffffffff
!	%l5 = 0000000000000000, Mem[0000000030141400] = 00000000
	stba	%l5,[%i5+%g0]0x89	! Mem[0000000030141400] = 00000000
!	%f30 = 00000000, Mem[0000000010041410] = 00000000
	sta	%f30,[%i1+%o5]0x88	! Mem[0000000010041410] = 00000000
!	Mem[00000000300c1408] = 0000ff4a, %l2 = 0000000000000000
	ldstuba	[%i3+%o4]0x89,%l2	! %l2 = 000000000000004a
!	%f2  = ff000000 000000ff, %l6 = ffffffffffffffff
!	Mem[0000000030041430] = ff0dff4000000000
	add	%i1,0x030,%g1
	stda	%f2,[%g1+%l6]ASI_PST32_SL ! Mem[0000000030041430] = ff000000000000ff
!	%l6 = ffffffffffffffff, Mem[0000000010181408] = ff098cff
	stwa	%l6,[%i6+%o4]0x80	! Mem[0000000010181408] = ffffffff
!	Mem[000000001008140c] = 00ff0000, %l4 = 000000007e0e314a
	swap	[%i2+0x00c],%l4		! %l4 = 0000000000ff0000
	membar	#Sync			! Added by membar checker (44)
!	Mem[0000000010041430] = 00000f5d00000000, %l0 = 00000000000000ff, %l4 = 0000000000ff0000
	add	%i1,0x30,%g1
	casxa	[%g1]0x80,%l0,%l4	! %l4 = 00000f5d00000000

p0_label_290:
!	Starting 10 instruction Load Burst
!	Mem[000000001010141e] = 0087fdff, %l7 = 0000000000000000
	ldsb	[%i4+0x01e],%l7		! %l7 = fffffffffffffffd
!	Mem[000000001004143c] = 3dd76b7b, %l7 = fffffffffffffffd
	lduh	[%i1+0x03c],%l7		! %l7 = 0000000000003dd7
!	Mem[0000000010001438] = 00000000, %l5 = 0000000000000000
	lduw	[%i0+0x038],%l5		! %l5 = 0000000000000000
!	Mem[0000000010141410] = 00000000, %l3 = 000000000000005f
	lduha	[%i5+%o5]0x88,%l3	! %l3 = 0000000000000000
!	Mem[0000000010041410] = 00000000, %l1 = 00000000ff000000
	ldswa	[%i1+%o5]0x88,%l1	! %l1 = 0000000000000000
!	Mem[000000001008141c] = 00000000, %l3 = 0000000000000000
	lduh	[%i2+0x01c],%l3		! %l3 = 0000000000000000
!	Mem[00000000300c1410] = 000000ff, %l1 = 0000000000000000
	ldswa	[%i3+%o5]0x89,%l1	! %l1 = 00000000000000ff
!	Mem[0000000030081400] = 00000000, %l4 = 00000f5d00000000
	ldswa	[%i2+%g0]0x89,%l4	! %l4 = 0000000000000000
!	Mem[0000000010041400] = ffff000000000000, %l6 = ffffffffffffffff
	ldxa	[%i1+%g0]0x88,%l6	! %l6 = ffff000000000000
!	Mem[0000000030101410] = 000000ff, %l7 = 0000000000003dd7
	ldsba	[%i4+%o5]0x89,%l7	! %l7 = ffffffffffffffff

p0_label_291:
!	Starting 10 instruction Store Burst
!	Mem[0000000030101408] = 710000ff, %l3 = 0000000000000000
	ldstuba	[%i4+%o4]0x89,%l3	! %l3 = 00000000000000ff
!	%l6 = ffff000000000000, Mem[0000000030041408] = 00000000
	stwa	%l6,[%i1+%o4]0x81	! Mem[0000000030041408] = 00000000
!	Mem[0000000010041408] = 00ff0dff, %l6 = ffff000000000000
	ldstuba	[%i1+%o4]0x80,%l6	! %l6 = 0000000000000000
!	Mem[0000000010101410] = 000000ff, %l6 = 0000000000000000
	ldstuba	[%i4+%o5]0x88,%l6	! %l6 = 00000000000000ff
!	Mem[00000000100c1406] = ff000000, %l2 = 000000000000004a
	ldstuba	[%i3+0x006]%asi,%l2	! %l2 = 0000000000000000
!	%f8  = 000000ff 000000ff, Mem[0000000010181410] = ff000000 ffffffa6
	std	%f8 ,[%i6+%o5]		! Mem[0000000010181410] = 000000ff 000000ff
!	Mem[0000000030141408] = ff00dd22, %l2 = 0000000000000000
	ldstuba	[%i5+%o4]0x81,%l2	! %l2 = 00000000000000ff
!	Mem[0000000030141410] = 00000000, %l3 = 00000000000000ff
	swapa	[%i5+%o5]0x81,%l3	! %l3 = 0000000000000000
!	%l4 = 0000000000000000, Mem[00000000100c1408] = 3cf786a6
	stha	%l4,[%i3+%o4]0x88	! Mem[00000000100c1408] = 3cf70000
!	%l2 = 00000000000000ff, Mem[0000000030041408] = ff00000000000000
	stxa	%l2,[%i1+%o4]0x89	! Mem[0000000030041408] = 00000000000000ff

p0_label_292:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181408] = ffffffff, %l4 = 0000000000000000
	ldsha	[%i6+%o4]0x80,%l4	! %l4 = ffffffffffffffff
!	Mem[0000000030181408] = 00000000, %l2 = 00000000000000ff
	lduwa	[%i6+%o4]0x81,%l2	! %l2 = 0000000000000000
!	Mem[0000000010081408] = 4a310e7eff8c09ff, %l4 = ffffffffffffffff
	ldxa	[%i2+%o4]0x88,%l4	! %l4 = 4a310e7eff8c09ff
!	Mem[00000000100c1400] = a686f73c, %l7 = ffffffffffffffff
	ldsha	[%i3+%g0]0x88,%l7	! %l7 = fffffffffffff73c
!	Mem[0000000010101400] = 000000ff, %f18 = 00000000
	lda	[%i4+%g0]0x88,%f18	! %f18 = 000000ff
!	Mem[0000000010101407] = 00000000, %l3 = 0000000000000000, %asi = 80
	ldsba	[%i4+0x007]%asi,%l3	! %l3 = 0000000000000000
!	Mem[0000000030041400] = 00000000, %f23 = 00000000
	lda	[%i1+%g0]0x89,%f23	! %f23 = 00000000
!	Mem[0000000030041408] = ff000000, %l5 = 0000000000000000
	ldsha	[%i1+%o4]0x81,%l5	! %l5 = ffffffffffffff00
!	Mem[0000000010181408] = ffffffff, %l7 = fffffffffffff73c
	ldsba	[%i6+%o4]0x88,%l7	! %l7 = ffffffffffffffff
!	Mem[0000000030081408] = 000000ff, %l1 = 00000000000000ff
	lduba	[%i2+%o4]0x89,%l1	! %l1 = 00000000000000ff

p0_label_293:
!	Starting 10 instruction Store Burst
!	Mem[0000000030041408] = 000000ff, %l0 = 00000000000000ff
	ldstuba	[%i1+%o4]0x89,%l0	! %l0 = 00000000000000ff
!	%l4 = ff8c09ff, %l5 = ffffff00, Mem[0000000030041400] = 00000000 00000000
	stda	%l4,[%i1+%g0]0x89	! Mem[0000000030041400] = ff8c09ff ffffff00
!	%f27 = ff000000, Mem[00000000100c1408] = 0000f73c
	sta	%f27,[%i3+%o4]0x80	! Mem[00000000100c1408] = ff000000
!	%l3 = 0000000000000000, Mem[0000000010181405] = 0000ff77
	stb	%l3,[%i6+0x005]		! Mem[0000000010181404] = 0000ff77
!	Mem[0000000010181408] = ffffffff, %l4 = 4a310e7eff8c09ff
	ldstub	[%i6+%o4],%l4		! %l4 = 00000000000000ff
!	Mem[0000000010081400] = 000000ff, %l5 = 00000000ffffff00
	swapa	[%i2+%g0]0x80,%l5	! %l5 = 00000000000000ff
!	%f18 = 000000ff 000000ff, Mem[0000000030101410] = 000000ff 00000000
	stda	%f18,[%i4+%o5]0x89	! Mem[0000000030101410] = 000000ff 000000ff
!	Mem[0000000010081400] = ffffff00, %l2 = 0000000000000000
	ldstuba	[%i2+%g0]0x80,%l2	! %l2 = 00000000000000ff
!	%l3 = 0000000000000000, Mem[00000000211c0000] = ffff7fb0
	sth	%l3,[%o2+%g0]		! Mem[00000000211c0000] = 00007fb0
!	%l4 = 00000000000000ff, Mem[0000000021800000] = 00ff95e0, %asi = 80
	stha	%l4,[%o3+0x000]%asi	! Mem[0000000021800000] = 00ff95e0

p0_label_294:
!	Starting 10 instruction Load Burst
!	%f30 = 00000000, %f21 = 000000ff, %f25 = 333dec99
	fsubs	%f30,%f21,%f25		! tt=0x22, %l0 = 0000000000000121
!	Mem[0000000010181410] = ff000000 ff000000, %l0 = 00000121, %l1 = 000000ff
	ldda	[%i6+%o5]0x88,%l0	! %l0 = 00000000ff000000 00000000ff000000
!	Mem[0000000010001438] = 00000000, %l2 = 00000000000000ff
	lduw	[%i0+0x038],%l2		! %l2 = 0000000000000000
!	Mem[0000000030181410] = 5d0f0000, %l1 = 00000000ff000000
	lduha	[%i6+%o5]0x89,%l1	! %l1 = 0000000000000000
!	Mem[0000000010101418] = 00000000, %l7 = ffffffffffffffff
	lduw	[%i4+0x018],%l7		! %l7 = 0000000000000000
!	Mem[0000000030081400] = 00000000, %l7 = 0000000000000000
	ldsha	[%i2+%g0]0x81,%l7	! %l7 = 0000000000000000
!	Mem[000000001010140c] = 333dec99, %l6 = 00000000000000ff, %asi = 80
	lduwa	[%i4+0x00c]%asi,%l6	! %l6 = 00000000333dec99
!	Mem[00000000201c0000] = 09ff2520, %l4 = 00000000000000ff
	lduh	[%o0+%g0],%l4		! %l4 = 00000000000009ff
!	Mem[00000000100c1410] = 000000ff, %l3 = 0000000000000000
	lduwa	[%i3+%o5]0x88,%l3	! %l3 = 00000000000000ff
!	Mem[0000000021800100] = 0000c6a0, %l4 = 00000000000009ff, %asi = 80
	lduha	[%o3+0x100]%asi,%l4	! %l4 = 0000000000000000

p0_label_295:
!	Starting 10 instruction Store Burst
!	%l2 = 0000000000000000, immd = 000006a4, %y  = 00000000
	sdiv	%l2,0x6a4,%l6		! %l6 = 0000000000000000
	mov	%l0,%y			! %y = ff000000
!	Mem[0000000021800181] = 00004700, %l5 = 00000000000000ff
	ldstuba	[%o3+0x181]%asi,%l5	! %l5 = 0000000000000000
!	Mem[00000000100c1400] = a686f73c, %l1 = 0000000000000000
	ldstuba	[%i3+%g0]0x88,%l1	! %l1 = 000000000000003c
!	%l2 = 0000000000000000, Mem[000000001008141b] = 00000000
	stb	%l2,[%i2+0x01b]		! Mem[0000000010081418] = 00000000
!	%l3 = 00000000000000ff, Mem[0000000030141410] = 000000ff
	stha	%l3,[%i5+%o5]0x81	! Mem[0000000030141410] = 00ff00ff
!	%f19 = 000000ff, %f25 = 333dec99, %f24 = ff000000
	fadds	%f19,%f25,%f24		! tt=0x22, %l0 = 00000000ff000022
!	Mem[00000000100c1410] = ff000000, %l2 = 0000000000000000
	swapa	[%i3+%o5]0x80,%l2	! %l2 = 00000000ff000000
!	Mem[0000000030081408] = ff000000, %l4 = 0000000000000000
	ldstuba	[%i2+%o4]0x81,%l4	! %l4 = 00000000000000ff
!	%l0 = 00000000ff000022, Mem[0000000020800040] = ff00e580
	stb	%l0,[%o1+0x040]		! Mem[0000000020800040] = 2200e580
!	Code Fragment 3, seed = 20037
p0_fragment_24:
!	%l0 = 00000000ff000022
	setx	0xc3c9b1bdaa4f5afe,%g7,%l0 ! %l0 = c3c9b1bdaa4f5afe
!	%l1 = 000000000000003c
	setx	0x80cc1657508af7a9,%g7,%l1 ! %l1 = 80cc1657508af7a9
	setx    0x1fe000, %g1, %g3
	or      %l0, %g3, %l0 ! always set perrmask = 0xff
	setx    0x1ffff8, %g1, %g2
	and     %l0, %g2, %l0
	ta      T_CHANGE_HPRIV
	stxa    %l1, [%l0]ASI_DCACHE_DATA
	ta      T_CHANGE_NONHPRIV
!	%l0 = c3c9b1bdaa4f5afe
	setx	0xa99095697fb19064,%g7,%l0 ! %l0 = a99095697fb19064
!	%l1 = 80cc1657508af7a9
	setx	0x3067f6f07c8fa82f,%g7,%l1 ! %l1 = 3067f6f07c8fa82f
p0_fragment_24_end:

p0_label_296:
!	Starting 10 instruction Load Burst
!	Mem[0000000010081410] = 00000000, %l6 = 0000000000000000
	ldswa	[%i2+%o5]0x88,%l6	! %l6 = 0000000000000000
!	Mem[0000000030141410] = ff00ff00, %l2 = 00000000ff000000
	ldsba	[%i5+%o5]0x89,%l2	! %l2 = 0000000000000000
!	Mem[0000000030101408] = ff000071, %l1 = 3067f6f07c8fa82f
	lduha	[%i4+%o4]0x81,%l1	! %l1 = 000000000000ff00
!	Mem[0000000030101408] = 710000ff, %f11 = 000000ff
	lda	[%i4+%o4]0x89,%f11	! %f11 = 710000ff
!	Mem[00000000300c1408] = ffff000000000000, %l0 = a99095697fb19064
	ldxa	[%i3+%o4]0x81,%l0	! %l0 = ffff000000000000
!	Mem[0000000030181408] = 00000000, %l6 = 0000000000000000
	ldsba	[%i6+%o4]0x81,%l6	! %l6 = 0000000000000000
!	Mem[00000000211c0000] = 00007fb0, %l3 = 00000000000000ff, %asi = 80
	lduha	[%o2+0x000]%asi,%l3	! %l3 = 0000000000000000
!	%f22 = 00000000, %f1  = ff0d0040
	fcmps	%fcc1,%f22,%f1 		! %fcc1 = 2
!	Mem[0000000010141400] = 00000000, %l3 = 0000000000000000
	ldswa	[%i5+%g0]0x88,%l3	! %l3 = 0000000000000000
!	Mem[00000000300c1410] = ff000000, %l3 = 0000000000000000
	ldsba	[%i3+%o5]0x81,%l3	! %l3 = ffffffffffffffff

p0_label_297:
!	Starting 10 instruction Store Burst
!	%l1 = 000000000000ff00, Mem[0000000010001408] = 000000ff
	stba	%l1,[%i0+%o4]0x88	! Mem[0000000010001408] = 00000000
!	%l6 = 0000000000000000, Mem[0000000010041408] = ffff0dff
	stha	%l6,[%i1+%o4]0x80	! Mem[0000000010041408] = 00000dff
!	%l7 = 0000000000000000, Mem[0000000010181430] = 00000000
	sth	%l7,[%i6+0x030]		! Mem[0000000010181430] = 00000000
!	%l0 = ffff000000000000, Mem[0000000030181408] = 00000000
	stha	%l0,[%i6+%o4]0x81	! Mem[0000000030181408] = 00000000
!	Mem[00000000100c1438] = 00466600, %l2 = 00000000, %l3 = ffffffff
	add	%i3,0x38,%g1
	casa	[%g1]0x80,%l2,%l3	! %l3 = 0000000000466600
!	%l6 = 0000000000000000, Mem[0000000030181410] = 00000f5d
	stba	%l6,[%i6+%o5]0x81	! Mem[0000000030181410] = 00000f5d
!	Mem[0000000010081400] = 00ffffff, %l4 = 00000000000000ff
	swapa	[%i2+%g0]0x88,%l4	! %l4 = 0000000000ffffff
!	Mem[0000000010101414] = 00000000, %l6 = 00000000, %l1 = 0000ff00
	add	%i4,0x14,%g1
	casa	[%g1]0x80,%l6,%l1	! %l1 = 0000000000000000
!	%l2 = 0000000000000000, Mem[00000000100c1400] = fff786a6ff00ff00, %asi = 80
	stxa	%l2,[%i3+0x000]%asi	! Mem[00000000100c1400] = 0000000000000000
!	%l4 = 0000000000ffffff, Mem[0000000010001408] = 00000000
	stha	%l4,[%i0+%o4]0x80	! Mem[0000000010001408] = ffff0000

p0_label_298:
!	Starting 10 instruction Load Burst
!	Mem[0000000010141410] = ff000000 00000000, %l6 = 00000000, %l7 = 00000000
	ldda	[%i5+%o5]0x88,%l6	! %l6 = 0000000000000000 00000000ff000000
!	Mem[00000000100c1400] = 00000000, %l2 = 0000000000000000
	lduwa	[%i3+%g0]0x88,%l2	! %l2 = 0000000000000000
!	Mem[0000000030141400] = 0000000000000000, %f20 = a686f73c 000000ff
	ldda	[%i5+%g0]0x89,%f20	! %f20 = 00000000 00000000
!	Mem[0000000010101418] = 00000000, %l4 = 0000000000ffffff
	ldsw	[%i4+0x018],%l4		! %l4 = 0000000000000000
!	Mem[0000000010141410] = 00000000000000ff, %f24 = ff000000 333dec99
	ldda	[%i5+%o5]0x80,%f24	! %f24 = 00000000 000000ff
!	Mem[00000000300c1410] = ff000000, %l2 = 0000000000000000
	lduwa	[%i3+%o5]0x81,%l2	! %l2 = 00000000ff000000
!	Mem[00000000211c0001] = 00007fb0, %l1 = 0000000000000000, %asi = 80
	lduba	[%o2+0x001]%asi,%l1	! %l1 = 0000000000000000
!	%l1 = 0000000000000000, immd = fffffffffffff5b5, %l108 = 0000000000000001
	sdivx	%l1,-0xa4b,%l1		! %l1 = 0000000000000000
!	Mem[0000000010181410] = ff000000, %l6 = 0000000000000000
	ldsba	[%i6+%o5]0x88,%l6	! %l6 = 0000000000000000
!	Mem[00000000300c1408] = 0000ffff, %l5 = 0000000000000000
	ldsha	[%i3+%o4]0x89,%l5	! %l5 = ffffffffffffffff

p0_label_299:
!	Starting 10 instruction Store Burst
!	Mem[0000000010081400] = ff000000000000ff, %l4 = 0000000000000000, %l1 = 0000000000000000
	casxa	[%i2]0x80,%l4,%l1	! %l1 = ff000000000000ff
!	%l5 = ffffffffffffffff, Mem[00000000300c1408] = 0000ffff
	stba	%l5,[%i3+%o4]0x89	! Mem[00000000300c1408] = 0000ffff
!	Mem[0000000030001408] = 00000000, %l5 = ffffffffffffffff
	ldstuba	[%i0+%o4]0x89,%l5	! %l5 = 0000000000000000
!	Mem[0000000010141420] = 00000025, %l4 = 0000000000000000
	swap	[%i5+0x020],%l4		! %l4 = 0000000000000025
!	Mem[0000000020800001] = 00ffc750, %l4 = 0000000000000025
	ldstub	[%o1+0x001],%l4		! %l4 = 00000000000000ff
!	%l3 = 0000000000466600, Mem[000000001010142e] = 17ffff00, %asi = 80
	stha	%l3,[%i4+0x02e]%asi	! Mem[000000001010142c] = 17ff6600
!	%l2 = ff000000, %l3 = 00466600, Mem[0000000010101408] = 00000000 99ec3d33
	stda	%l2,[%i4+%o4]0x88	! Mem[0000000010101408] = ff000000 00466600
!	%l2 = 00000000ff000000, Mem[00000000211c0000] = 00007fb0, %asi = 80
	stba	%l2,[%o2+0x000]%asi	! Mem[00000000211c0000] = 00007fb0
!	Mem[0000000010181419] = ffec3d33, %l3 = 0000000000466600
	ldstuba	[%i6+0x019]%asi,%l3	! %l3 = 00000000000000ec
!	Mem[0000000010141400] = 00000000 00000000 0c000000 00000000
!	%f16 = 00000000 00000000 000000ff 000000ff
!	%f20 = 00000000 00000000 00000000 00000000
!	%f24 = 00000000 000000ff 00000000 ff000000
!	%f28 = ff0dff40 00000000 00000000 000000ff
	stda	%f16,[%i5+%g0]ASI_BLK_AIUPL	! Block Store to 0000000010141400

p0_label_300:
!	Starting 10 instruction Load Burst
!	Mem[0000000010181410] = 000000ff, %l1 = ff000000000000ff
	ldsha	[%i6+%o5]0x80,%l1	! %l1 = 0000000000000000
	membar	#Sync			! Added by membar checker (45)
!	Mem[000000001014143e] = 00000000, %l4 = 00000000000000ff
	ldub	[%i5+0x03e],%l4		! %l4 = 0000000000000000
!	Mem[0000000030081400] = 00000000, %l7 = 00000000ff000000
	ldswa	[%i2+%g0]0x89,%l7	! %l7 = 0000000000000000
!	Mem[000000001008140c] = 7e0e314a, %l0 = ffff000000000000
	lduw	[%i2+0x00c],%l0		! %l0 = 000000007e0e314a
!	Mem[0000000010101408] = ff000000, %l2 = 00000000ff000000
	ldswa	[%i4+%o4]0x88,%l2	! %l2 = ffffffffff000000
!	Mem[000000001014143f] = 00000000, %l7 = 0000000000000000, %asi = 80
	lduba	[%i5+0x03f]%asi,%l7	! %l7 = 0000000000000000
!	Mem[0000000030041410] = 3cf786a6, %l3 = 00000000000000ec
	lduha	[%i1+%o5]0x89,%l3	! %l3 = 00000000000086a6
!	Mem[00000000100c1400] = 00000000, %l1 = 0000000000000000
	ldsha	[%i3+%g0]0x88,%l1	! %l1 = 0000000000000000
!	Mem[0000000030041410] = a686f73c, %l3 = 00000000000086a6
	ldsba	[%i1+%o5]0x81,%l3	! %l3 = ffffffffffffffa6
!	Mem[00000000218001c0] = 61b4c130, %l6 = 0000000000000000, %asi = 80
	ldsba	[%o3+0x1c0]%asi,%l6	! %l6 = 0000000000000061

!	End of Random Code for Thread 0


!	Check Registers

p0_check_registers:
	set	p0_expected_registers,%g1
	ldx	[%g1+0x000],%g2
	cmp	%l0,%g2			! %l0 should be 000000007e0e314a
	bne	%xcc,p0_reg_l0_fail
	mov	%l0,%g3
	ldx	[%g1+0x008],%g2
	cmp	%l1,%g2			! %l1 should be 0000000000000000
	bne	%xcc,p0_reg_l1_fail
	mov	%l1,%g3
	ldx	[%g1+0x010],%g2
	cmp	%l2,%g2			! %l2 should be ffffffffff000000
	bne	%xcc,p0_reg_l2_fail
	mov	%l2,%g3
	ldx	[%g1+0x018],%g2
	cmp	%l3,%g2			! %l3 should be ffffffffffffffa6
	bne	%xcc,p0_reg_l3_fail
	mov	%l3,%g3
	ldx	[%g1+0x020],%g2
	cmp	%l4,%g2			! %l4 should be 0000000000000000
	bne	%xcc,p0_reg_l4_fail
	mov	%l4,%g3
	ldx	[%g1+0x028],%g2
	cmp	%l5,%g2			! %l5 should be 0000000000000000
	bne	%xcc,p0_reg_l5_fail
	mov	%l5,%g3
	ldx	[%g1+0x030],%g2
	cmp	%l6,%g2			! %l6 should be 0000000000000061
	bne	%xcc,p0_reg_l6_fail
	mov	%l6,%g3
	ldx	[%g1+0x038],%g2
	cmp	%l7,%g2			! %l7 should be 0000000000000000
	bne	%xcc,p0_reg_l7_fail
	mov	%l7,%g3

!	Check %y register

	set	0xff000000,%g2
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
	cmp	%l0,%l1			! %f0  should be 000000ff ff0d0040
	bne	%xcc,p0_freg_fail
	std	%f2,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x08],%l0
	cmp	%l0,%l1			! %f2  should be ff000000 000000ff
	bne	%xcc,p0_freg_fail
	std	%f4,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x10],%l0
	cmp	%l0,%l1			! %f4  should be 00000000 00000000
	bne	%xcc,p0_freg_fail
	std	%f6,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x18],%l0
	cmp	%l0,%l1			! %f6  should be 00000000 00000000
	bne	%xcc,p0_freg_fail
	std	%f8,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x20],%l0
	cmp	%l0,%l1			! %f8  should be 000000ff 000000ff
	bne	%xcc,p0_freg_fail
	std	%f10,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x28],%l0
	cmp	%l0,%l1			! %f10 should be 4a000000 710000ff
	bne	%xcc,p0_freg_fail
	std	%f12,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x30],%l0
	cmp	%l0,%l1			! %f12 should be 00000000 00000000
	bne	%xcc,p0_freg_fail
	std	%f14,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x38],%l0
	cmp	%l0,%l1			! %f14 should be 00000f5d 00000000
	bne	%xcc,p0_freg_fail
	std	%f16,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x40],%l0
	cmp	%l0,%l1			! %f16 should be 00000000 00000000
	bne	%xcc,p0_freg_fail
	std	%f18,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x48],%l0
	cmp	%l0,%l1			! %f18 should be 000000ff 000000ff
	bne	%xcc,p0_freg_fail
	std	%f20,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x50],%l0
	cmp	%l0,%l1			! %f20 should be 00000000 00000000
	bne	%xcc,p0_freg_fail
	std	%f22,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x58],%l0
	cmp	%l0,%l1			! %f22 should be 00000000 00000000
	bne	%xcc,p0_freg_fail
	std	%f24,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x60],%l0
	cmp	%l0,%l1			! %f24 should be 00000000 000000ff
	bne	%xcc,p0_freg_fail
	std	%f26,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x68],%l0
	cmp	%l0,%l1			! %f26 should be 00000000 ff000000
	bne	%xcc,p0_freg_fail
	std	%f28,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x70],%l0
	cmp	%l0,%l1			! %f28 should be ff0dff40 00000000
	bne	%xcc,p0_freg_fail
	std	%f30,[%g1]
	ldx	[%g1],%l1
	ldx	[%g3+0x78],%l0
	cmp	%l0,%l1			! %f30 should be 00000000 000000ff
	bne	%xcc,p0_freg_fail
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
p0_freg_fail:
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

inst_access_handler:
	done 

	.align	256
data_access_handler:
1:	done

check_critical_timed_out:
	ta	BAD_TRAP


get_thread_mask:
	retl
	mov	3,%i7

get_park_semaphore:
	set	park_semaphore,%g6
	mov	100,%g5
1:	ldstub	[%g6],%g7
	cmp	%g7,0
	bne	1b
	nop
	retl
	nop

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
	ldx	[%g1+0x000],%l0		! %l0 = da8a5c52c2880eee
	ldx	[%g1+0x008],%l1		! %l1 = 68f034efe8682899
	ldx	[%g1+0x010],%l2		! %l2 = 01d0ce61bd8eae54
	ldx	[%g1+0x018],%l3		! %l3 = 43e071af70ad231f
	ldx	[%g1+0x020],%l4		! %l4 = dc1b0be3f23999fa
	ldx	[%g1+0x028],%l5		! %l5 = 87060b391089b5e5
	ldx	[%g1+0x030],%l6		! %l6 = d973679e34fda9e0
	ldx	[%g1+0x038],%l7		! %l7 = 30e5d92a353b38eb

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
	.global	p0_near_0_le,p0_near_0_he
	.global	p0_near_0_lo,p0_near_0_ho
	.global	near0_b2b_l,near0_b2b_h
	.global	far0_b2b_l,far0_b2b_h
	.global	far1_b2b_l,far1_b2b_h
	.global	far2_b2b_l,far2_b2b_h
	.global	far3_b2b_l,far3_b2b_h
user_near0_start:
p0_near_0_le:
	fdivs	%f10,%f1 ,%f9 
	and	%l6,0x1fc,%l0
	xor	%l6,%l4,%l2
	umul	%l6,-0x1c5,%l2
	jmpl	%o7,%g0
	sth	%l5,[%i5+0x038]		! Mem[0000000010141438]
p0_near_0_he:
	udivx	%l5,0x847,%l4
	fadds	%f20,%f19,%f18
	and	%l5,-0xbe3,%l2
	umul	%l3,-0x62f,%l0
	mulx	%l3,%l0,%l0
	fstod	%f31,%f20
	ldstub	[%i5+0x025],%l2		! Mem[0000000010141425]
	jmpl	%o7,%g0
	sub	%l6,0x336,%l1
p0_near_0_lo:
	fdivs	%f10,%f1 ,%f9 
	and	%l6,0x1fc,%l0
	xor	%l6,%l4,%l2
	umul	%l6,-0x1c5,%l2
	jmpl	%o7,%g0
	sth	%l5,[%o5+0x038]		! Mem[0000000010141438]
p0_near_0_ho:
	udivx	%l5,0x847,%l4
	fadds	%f20,%f19,%f18
	and	%l5,-0xbe3,%l2
	umul	%l3,-0x62f,%l0
	mulx	%l3,%l0,%l0
	fstod	%f31,%f20
	ldstub	[%o5+0x025],%l2		! Mem[0000000010141425]
	jmpl	%o7,%g0
	sub	%l6,0x336,%l1
near0_b2b_h:
	orn	%l7,-0x1a5,%l1
	fsubs	%f17,%f17,%f21
	fdivs	%f23,%f29,%f27
	fdivs	%f16,%f18,%f30
	xnor	%l4,-0x198,%l3
	sub	%l4,%l7,%l2
	fcmps	%fcc2,%f29,%f19
	jmpl	%o7,%g0
	mulx	%l0,0xdf7,%l4
near0_b2b_l:
	subc	%l0,-0x6de,%l1
	umul	%l5,%l7,%l0
	sdivx	%l2,%l7,%l1
	mulx	%l7,%l6,%l1
	add	%l6,%l7,%l2
	xnor	%l0,0xbaa,%l0
	smul	%l6,%l0,%l3
	jmpl	%o7,%g0
	sdivx	%l7,%l4,%l0
user_near0_end:
	.seg	"text"
	.align	0x2000
	.global	p0_near_1_le,p0_near_1_he
	.global	p0_near_1_lo,p0_near_1_ho
	.global	near1_b2b_l,near1_b2b_h
	.global	far0_b2b_l,far0_b2b_h
	.global	far1_b2b_l,far1_b2b_h
	.global	far2_b2b_l,far2_b2b_h
	.global	far3_b2b_l,far3_b2b_h
user_near1_start:
p0_near_1_le:
	sdivx	%l0,0x3cd,%l3
	addc	%l5,%l4,%l2
	jmpl	%o7,%g0
	udivx	%l7,0xc5d,%l2
p0_near_1_he:
	mulx	%l6,0xcb0,%l2
	xor	%l6,%l2,%l7
	fdivs	%f25,%f28,%f28
	jmpl	%o7,%g0
	fdivs	%f30,%f21,%f24
p0_near_1_lo:
	sdivx	%l0,0x3cd,%l3
	addc	%l5,%l4,%l2
	jmpl	%o7,%g0
	udivx	%l7,0xc5d,%l2
p0_near_1_ho:
	mulx	%l6,0xcb0,%l2
	xor	%l6,%l2,%l7
	fdivs	%f25,%f28,%f28
	jmpl	%o7,%g0
	fdivs	%f30,%f21,%f24
near1_b2b_h:
	fdivs	%f25,%f20,%f25
	and	%l4,%l2,%l5
	jmpl	%o7,%g0
	smul	%l2,-0xe9e,%l5
near1_b2b_l:
	fdivs	%f11,%f9 ,%f6 
	fmuls	%f12,%f5 ,%f13
	jmpl	%o7,%g0
	addc	%l4,%l0,%l4
user_near1_end:
	.seg	"text"
	.align	0x2000
	.global	p0_near_2_le,p0_near_2_he
	.global	p0_near_2_lo,p0_near_2_ho
	.global	near2_b2b_l,near2_b2b_h
	.global	far0_b2b_l,far0_b2b_h
	.global	far1_b2b_l,far1_b2b_h
	.global	far2_b2b_l,far2_b2b_h
	.global	far3_b2b_l,far3_b2b_h
user_near2_start:
p0_near_2_le:
	and	%l6,-0x3c6,%l5
	umul	%l0,%l5,%l4
	and	%l1,0x275,%l6
	fsqrts	%f13,%f13
	udivx	%l1,0x199,%l6
	orn	%l1,-0x9bd,%l0
	xor	%l1,%l5,%l0
	jmpl	%o7,%g0
	sub	%l3,%l1,%l4
p0_near_2_he:
	udivx	%l7,0x1b9,%l7
	fadds	%f20,%f24,%f23
	fadds	%f30,%f25,%f19
	sdivx	%l7,%l3,%l7
	udivx	%l4,%l7,%l1
	jmpl	%o7,%g0
	fdivs	%f27,%f24,%f18
p0_near_2_lo:
	and	%l6,-0x3c6,%l5
	umul	%l0,%l5,%l4
	and	%l1,0x275,%l6
	fsqrts	%f13,%f13
	udivx	%l1,0x199,%l6
	orn	%l1,-0x9bd,%l0
	xor	%l1,%l5,%l0
	jmpl	%o7,%g0
	sub	%l3,%l1,%l4
p0_near_2_ho:
	udivx	%l7,0x1b9,%l7
	fadds	%f20,%f24,%f23
	fadds	%f30,%f25,%f19
	sdivx	%l7,%l3,%l7
	udivx	%l4,%l7,%l1
	jmpl	%o7,%g0
	fdivs	%f27,%f24,%f18
near2_b2b_h:
	sub	%l6,%l0,%l2
	jmpl	%o7,%g0
	mulx	%l6,%l0,%l2
near2_b2b_l:
	addc	%l2,%l5,%l3
	jmpl	%o7,%g0
	subc	%l0,%l7,%l6
user_near2_end:
	.seg	"text"
	.align	0x2000
	.global	p0_near_3_le,p0_near_3_he
	.global	p0_near_3_lo,p0_near_3_ho
	.global	near3_b2b_l,near3_b2b_h
	.global	far0_b2b_l,far0_b2b_h
	.global	far1_b2b_l,far1_b2b_h
	.global	far2_b2b_l,far2_b2b_h
	.global	far3_b2b_l,far3_b2b_h
user_near3_start:
p0_near_3_le:
	orn	%l5,%l0,%l1
	fsubs	%f3 ,%f8 ,%f8 
	mulx	%l2,-0xd81,%l6
	jmpl	%o7,%g0
	sdivx	%l6,%l7,%l1
p0_near_3_he:
	sub	%l7,0x6d5,%l1
	sdivx	%l5,%l0,%l6
	addc	%l7,0x3a1,%l3
	sub	%l6,0x4f1,%l5
	xnor	%l3,%l1,%l2
	andn	%l2,-0xa32,%l1
	jmpl	%o7,%g0
	fadds	%f16,%f26,%f20
p0_near_3_lo:
	orn	%l5,%l0,%l1
	fsubs	%f3 ,%f8 ,%f8 
	mulx	%l2,-0xd81,%l6
	jmpl	%o7,%g0
	sdivx	%l6,%l7,%l1
p0_near_3_ho:
	sub	%l7,0x6d5,%l1
	sdivx	%l5,%l0,%l6
	addc	%l7,0x3a1,%l3
	sub	%l6,0x4f1,%l5
	xnor	%l3,%l1,%l2
	andn	%l2,-0xa32,%l1
	jmpl	%o7,%g0
	fadds	%f16,%f26,%f20
near3_b2b_h:
	fadds	%f28,%f26,%f25
	jmpl	%o7,%g0
	xnor	%l2,-0x584,%l0
near3_b2b_l:
	udivx	%l5,0x656,%l6
	jmpl	%o7,%g0
	fdivs	%f15,%f1 ,%f11
user_near3_end:
	.seg	"text"
	.align	0x2000
	.global	p0_far_0_le,p0_far_0_he
	.global	p0_far_0_lo,p0_far_0_ho
	.global	far0_b2b_l,far0_b2b_h
	.global	near0_b2b_l,near0_b2b_h
	.global	near1_b2b_l,near1_b2b_h
	.global	near2_b2b_l,near2_b2b_h
	.global	near3_b2b_l,near3_b2b_h
user_far0_start:
p0_far_0_le:
	add	%l1,0x4d0,%l5
	umul	%l6,-0x2ed,%l6
	swap	[%i2+0x01c],%l7		! Mem[000000001008141c]
	jmpl	%o7,%g0
	fdivs	%f9 ,%f11,%f12
p0_far_0_he:
	fsqrts	%f19,%f30
	fcmps	%fcc0,%f27,%f26
	fcmps	%fcc3,%f28,%f25
	addc	%l3,0x9e5,%l1
	jmpl	%o7,%g0
	add	%l2,0x1fb,%l7
p0_far_0_lo:
	add	%l1,0x4d0,%l5
	umul	%l6,-0x2ed,%l6
	swap	[%o2+0x01c],%l7		! Mem[000000001008141c]
	jmpl	%o7,%g0
	fdivs	%f9 ,%f11,%f12
p0_far_0_ho:
	fsqrts	%f19,%f30
	fcmps	%fcc0,%f27,%f26
	fcmps	%fcc3,%f28,%f25
	addc	%l3,0x9e5,%l1
	jmpl	%o7,%g0
	add	%l2,0x1fb,%l7
far0_b2b_h:
	fadds	%f24,%f16,%f26
	fadds	%f30,%f31,%f27
	jmpl	%o7,%g0
	addc	%l2,-0x62a,%l2
far0_b2b_l:
	fdivs	%f11,%f4 ,%f1 
	andn	%l0,%l3,%l3
	jmpl	%o7,%g0
	smul	%l6,%l5,%l7
user_far0_end:
	.seg	"text"
	.align	0x2000
	.global	p0_far_1_le,p0_far_1_he
	.global	p0_far_1_lo,p0_far_1_ho
	.global	far1_b2b_l,far1_b2b_h
	.global	near0_b2b_l,near0_b2b_h
	.global	near1_b2b_l,near1_b2b_h
	.global	near2_b2b_l,near2_b2b_h
	.global	near3_b2b_l,near3_b2b_h
user_far1_start:
p0_far_1_le:
	umul	%l5,-0x595,%l0
	jmpl	%o7,%g0
	sub	%l1,-0xb30,%l3
p0_far_1_he:
	fadds	%f21,%f20,%f16
	umul	%l4,0x52d,%l3
	jmpl	%o7,%g0
	udivx	%l5,0x620,%l7
p0_far_1_lo:
	umul	%l5,-0x595,%l0
	jmpl	%o7,%g0
	sub	%l1,-0xb30,%l3
p0_far_1_ho:
	fadds	%f21,%f20,%f16
	umul	%l4,0x52d,%l3
	jmpl	%o7,%g0
	udivx	%l5,0x620,%l7
far1_b2b_h:
	jmpl	%o7,%g0
	smul	%l6,%l6,%l4
	jmpl	%o7,%g0
	nop
far1_b2b_l:
	jmpl	%o7,%g0
	fadds	%f9 ,%f6 ,%f1 
	jmpl	%o7,%g0
	nop
user_far1_end:
	.seg	"text"
	.align	0x2000
	.global	p0_far_2_le,p0_far_2_he
	.global	p0_far_2_lo,p0_far_2_ho
	.global	far2_b2b_l,far2_b2b_h
	.global	near0_b2b_l,near0_b2b_h
	.global	near1_b2b_l,near1_b2b_h
	.global	near2_b2b_l,near2_b2b_h
	.global	near3_b2b_l,near3_b2b_h
user_far2_start:
p0_far_2_le:
	udivx	%l6,0x4cf,%l7
	fsqrts	%f5 ,%f8 
	xnor	%l1,%l0,%l2
	jmpl	%o7,%g0
	mulx	%l2,-0xdd3,%l4
p0_far_2_he:
	jmpl	%o7,%g0
	fsqrts	%f25,%f27
	jmpl	%o7,%g0
	nop
p0_far_2_lo:
	udivx	%l6,0x4cf,%l7
	fsqrts	%f5 ,%f8 
	xnor	%l1,%l0,%l2
	jmpl	%o7,%g0
	mulx	%l2,-0xdd3,%l4
p0_far_2_ho:
	jmpl	%o7,%g0
	fsqrts	%f25,%f27
	jmpl	%o7,%g0
	nop
	jmpl	%o7,%g0
	nop
far2_b2b_h:
	fadds	%f28,%f24,%f28
	subc	%l0,%l2,%l3
	mulx	%l5,%l0,%l1
	add	%l0,-0xe75,%l0
	sub	%l4,%l0,%l2
	jmpl	%o7,%g0
	addc	%l6,-0x25e,%l6
far2_b2b_l:
	fmuls	%f4 ,%f5 ,%f14
	andn	%l4,%l7,%l4
	fsqrts	%f15,%f10
	udivx	%l0,0x274,%l3
	subc	%l0,%l7,%l2
	jmpl	%o7,%g0
	fstod	%f15,%f0 
user_far2_end:
	.seg	"text"
	.align	0x2000
	.global	p0_far_3_le,p0_far_3_he
	.global	p0_far_3_lo,p0_far_3_ho
	.global	far3_b2b_l,far3_b2b_h
	.global	near0_b2b_l,near0_b2b_h
	.global	near1_b2b_l,near1_b2b_h
	.global	near2_b2b_l,near2_b2b_h
	.global	near3_b2b_l,near3_b2b_h
user_far3_start:
p0_far_3_le:
	fcmps	%fcc0,%f13,%f2 
	xor	%l6,%l2,%l5
	xor	%l3,%l2,%l2
	smul	%l2,0x7a4,%l7
	fcmps	%fcc0,%f2 ,%f11
	jmpl	%o7,%g0
	mulx	%l4,%l0,%l1
p0_far_3_he:
	addc	%l1,0x251,%l1
	jmpl	%o7,%g0
	fmuls	%f27,%f23,%f16
p0_far_3_lo:
	fcmps	%fcc0,%f13,%f2 
	xor	%l6,%l2,%l5
	xor	%l3,%l2,%l2
	smul	%l2,0x7a4,%l7
	fcmps	%fcc0,%f2 ,%f11
	jmpl	%o7,%g0
	mulx	%l4,%l0,%l1
p0_far_3_ho:
	addc	%l1,0x251,%l1
	jmpl	%o7,%g0
	fmuls	%f27,%f23,%f16
far3_b2b_h:
	fmuls	%f26,%f17,%f26
	jmpl	%o7,%g0
	fcmps	%fcc1,%f22,%f31
far3_b2b_l:
	and	%l7,-0x13d,%l4
	jmpl	%o7,%g0
	mulx	%l5,-0xc80,%l5
user_far3_end:
	.seg	"text"
	.align	0x2000
user_jump0_start:
	.skip	16
p0_jmpl_0_le:
	fadds	%f0 ,%f1 ,%f14
	fsubs	%f12,%f7 ,%f4 
	fsubs	%f10,%f8 ,%f9 
	fdtos	%f0 ,%f9 
	jmpl	%g6+8,%g0
	orn	%l4,0xac9,%l4
p0_call_0_le:
	ldsh	[%o3+0x080],%l3		! Mem[0000000021800080]
	mulx	%l5,0x1a7,%l5
	sub	%l3,-0x648,%l7
	addc	%l0,-0x4ec,%l4
	fmuls	%f3 ,%f4 ,%f7 
	retl
	udivx	%l7,0xd73,%l7
p0_jmpl_0_lo:
	fadds	%f0 ,%f1 ,%f14
	fsubs	%f12,%f7 ,%f4 
	fsubs	%f10,%f8 ,%f9 
	fdtos	%f0 ,%f9 
	jmpl	%g6+8,%g0
	orn	%l4,0xac9,%l4
p0_call_0_lo:
	ldsh	[%i3+0x080],%l3		! Mem[0000000021800080]
	mulx	%l5,0x1a7,%l5
	sub	%l3,-0x648,%l7
	addc	%l0,-0x4ec,%l4
	fmuls	%f3 ,%f4 ,%f7 
	retl
	udivx	%l7,0xd73,%l7
p0_jmpl_0_he:
	mulx	%l1,0x7d4,%l2
	andn	%l6,-0x590,%l4
	jmpl	%g6+8,%g0
	fsubs	%f16,%f25,%f23
p0_call_0_he:
	xnor	%l2,0xdcf,%l0
	xor	%l1,%l2,%l7
	subc	%l5,-0x33c,%l6
	fmuls	%f27,%f27,%f22
	smul	%l5,%l2,%l5
	retl
	andn	%l0,%l3,%l0
p0_jmpl_0_ho:
	mulx	%l1,0x7d4,%l2
	andn	%l6,-0x590,%l4
	jmpl	%g6+8,%g0
	fsubs	%f16,%f25,%f23
p0_call_0_ho:
	xnor	%l2,0xdcf,%l0
	xor	%l1,%l2,%l7
	subc	%l5,-0x33c,%l6
	fmuls	%f27,%f27,%f22
	smul	%l5,%l2,%l5
	retl
	andn	%l0,%l3,%l0
user_jump0_end:
	.seg	"text"
	.align	0x2000
user_jump1_start:
	.skip	32
p0_jmpl_1_le:
	umul	%l0,%l1,%l4
	and	%l3,0x692,%l3
	xor	%l7,%l2,%l4
	fdivs	%f8 ,%f1 ,%f13
	fcmps	%fcc1,%f7 ,%f13
	jmpl	%g6+8,%g0
	addc	%l2,0xdb7,%l2
p0_call_1_le:
	sub	%l7,0xb7c,%l7
	fdivs	%f14,%f7 ,%f5 
	mulx	%l1,%l3,%l1
	fmuls	%f6 ,%f2 ,%f15
	or	%l4,%l5,%l4
	retl
	xnor	%l5,%l4,%l1
p0_jmpl_1_lo:
	umul	%l0,%l1,%l4
	and	%l3,0x692,%l3
	xor	%l7,%l2,%l4
	fdivs	%f8 ,%f1 ,%f13
	fcmps	%fcc1,%f7 ,%f13
	jmpl	%g6+8,%g0
	addc	%l2,0xdb7,%l2
p0_call_1_lo:
	sub	%l7,0xb7c,%l7
	fdivs	%f14,%f7 ,%f5 
	mulx	%l1,%l3,%l1
	fmuls	%f6 ,%f2 ,%f15
	or	%l4,%l5,%l4
	retl
	xnor	%l5,%l4,%l1
p0_jmpl_1_he:
	subc	%l5,%l5,%l1
	orn	%l7,%l5,%l2
	or	%l6,%l4,%l4
	and	%l2,-0x081,%l1
	jmpl	%g6+8,%g0
	orn	%l5,%l1,%l1
p0_call_1_he:
	fdivs	%f23,%f26,%f27
	retl
	swap	[%i6+0x038],%l0		! Mem[0000000010181438]
p0_jmpl_1_ho:
	subc	%l5,%l5,%l1
	orn	%l7,%l5,%l2
	or	%l6,%l4,%l4
	and	%l2,-0x081,%l1
	jmpl	%g6+8,%g0
	orn	%l5,%l1,%l1
p0_call_1_ho:
	fdivs	%f23,%f26,%f27
	retl
	swap	[%o6+0x038],%l0		! Mem[0000000010181438]
user_jump1_end:
	.seg	"text"
	.align	0x2000
user_jump2_start:
	.skip	48
p0_jmpl_2_le:
	jmpl	%g6+8,%g0
	fdivs	%f2 ,%f12,%f6 
p0_call_2_le:
	fadds	%f10,%f15,%f3 
	fmuls	%f12,%f5 ,%f13
	orn	%l1,%l6,%l4
	retl
	subc	%l4,%l5,%l5
p0_jmpl_2_lo:
	jmpl	%g6+8,%g0
	fdivs	%f2 ,%f12,%f6 
p0_call_2_lo:
	fadds	%f10,%f15,%f3 
	fmuls	%f12,%f5 ,%f13
	orn	%l1,%l6,%l4
	retl
	subc	%l4,%l5,%l5
p0_jmpl_2_he:
	sdivx	%l3,0x7ec,%l5
	fstod	%f28,%f16
	jmpl	%g6+8,%g0
	andn	%l1,%l3,%l7
p0_call_2_he:
	xor	%l4,%l5,%l5
	smul	%l3,%l4,%l1
	retl
	subc	%l1,%l5,%l1
p0_jmpl_2_ho:
	sdivx	%l3,0x7ec,%l5
	fstod	%f28,%f16
	jmpl	%g6+8,%g0
	andn	%l1,%l3,%l7
p0_call_2_ho:
	xor	%l4,%l5,%l5
	smul	%l3,%l4,%l1
	retl
	subc	%l1,%l5,%l1
user_jump2_end:
	.seg	"text"
	.align	0x2000
user_jump3_start:
	.skip	64
p0_jmpl_3_le:
	or	%l6,-0xdff,%l2
	jmpl	%g6+8,%g0
	fdivs	%f14,%f3 ,%f7 
p0_call_3_le:
	sub	%l7,%l2,%l6
	retl
	smul	%l2,%l3,%l2
p0_jmpl_3_lo:
	or	%l6,-0xdff,%l2
	jmpl	%g6+8,%g0
	fdivs	%f14,%f3 ,%f7 
p0_call_3_lo:
	sub	%l7,%l2,%l6
	retl
	smul	%l2,%l3,%l2
p0_jmpl_3_he:
	andn	%l4,0x203,%l2
	fdivs	%f25,%f16,%f21
	xor	%l0,%l3,%l1
	fsubs	%f29,%f27,%f25
	fstod	%f24,%f22
	jmpl	%g6+8,%g0
	andn	%l2,0xd46,%l3
p0_call_3_he:
	orn	%l3,%l3,%l3
	umul	%l4,-0x469,%l6
	sdivx	%l0,%l0,%l1
	sdivx	%l4,0xc48,%l1
	retl
	orn	%l6,%l2,%l5
p0_jmpl_3_ho:
	andn	%l4,0x203,%l2
	fdivs	%f25,%f16,%f21
	xor	%l0,%l3,%l1
	fsubs	%f29,%f27,%f25
	fstod	%f24,%f22
	jmpl	%g6+8,%g0
	andn	%l2,0xd46,%l3
p0_call_3_ho:
	orn	%l3,%l3,%l3
	umul	%l4,-0x469,%l6
	sdivx	%l0,%l0,%l1
	sdivx	%l4,0xc48,%l1
	retl
	orn	%l6,%l2,%l5
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
	.align	64
Finish_Flag:
	.word	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	.word	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	.align	8
num_processors:
	.word	1
v8_binary:
	.word	0
no_fpu:
	.word	0
max_ireg:
	.word	8,0
max_freg:
	.word	32,0
	.align	8
park_semaphore:
	.word	0,0
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
	.word	0xda8a5c52,0xc2880eee		! Init value for %l0
	.word	0x68f034ef,0xe8682899		! Init value for %l1
	.word	0x01d0ce61,0xbd8eae54		! Init value for %l2
	.word	0x43e071af,0x70ad231f		! Init value for %l3
	.word	0xdc1b0be3,0xf23999fa		! Init value for %l4
	.word	0x87060b39,0x1089b5e5		! Init value for %l5
	.word	0xd973679e,0x34fda9e0		! Init value for %l6
	.word	0x30e5d92a,0x353b38eb		! Init value for %l7
	.align	64
p0_init_freg:
	.word	0x5e2e91c0,0x000fb2d1		! Init value for %f0 
	.word	0x0bccf0fe,0x104ef657		! Init value for %f2 
	.word	0x4c723aac,0x4b5c348d		! Init value for %f4 
	.word	0x7109264a,0x081e96f3		! Init value for %f6 
	.word	0x0f144758,0x7d1c3309		! Init value for %f8 
	.word	0x42f5ed56,0x5b366a4f		! Init value for %f10
	.word	0x2e7f03c4,0x5b314a45		! Init value for %f12
	.word	0x643cf222,0x019dec6b		! Init value for %f14
	.word	0x55be7bf0,0x137fd641		! Init value for %f16
	.word	0x7ec7a0ae,0x72c55947		! Init value for %f18
	.word	0x592c7bdc,0x0c6af2fd		! Init value for %f20
	.word	0x14cb24fa,0x5ae1ace3		! Init value for %f22
	.word	0x0cdc8f88,0x6e107c79		! Init value for %f24
	.word	0x6f946b06,0x1f08a33f		! Init value for %f26
	.word	0x76c802f4,0x40450eb5		! Init value for %f28
	.word	0x58141ed2,0x6c0cb85b		! Init value for %f30
	.word	0x28b9e220,0x395005b1		! Init value for %f32
	.word	0x452aac5e,0x4c192837		! Init value for %f34
	.word	0x4dfaf90c,0x19677d6d		! Init value for %f36
	.word	0x6bb43faa,0x7f0deed3		! Init value for %f38
	.word	0x38bdd3b8,0x2eec51e9		! Init value for %f40
	.word	0x5c54c4b6,0x119bc82f		! Init value for %f42
	.word	0x7b4abe24,0x5f661f25		! Init value for %f44
	.word	0x1b03e782,0x6f20304b		! Init value for %f46
	.word	0x58ebc450,0x513f4121
	.word	0x5c59140e,0x6a416327
	.word	0x1a98b23c,0x1240d3dd
	.word	0x5497765a,0x784a5cc3
	.word	0x136313e8,0x56ceb359
	.word	0x4479fa66,0x1b46d91f
	.word	0x60a23554,0x2de37b95
	.word	0x2fbf4c32,0x36df543b
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
	.word	0x00000000,0x7e0e314a		! %l0
	.word	0x00000000,0x00000000		! %l1
	.word	0xffffffff,0xff000000		! %l2
	.word	0xffffffff,0xffffffa6		! %l3
	.word	0x00000000,0x00000000		! %l4
	.word	0x00000000,0x00000000		! %l5
	.word	0x00000000,0x00000061		! %l6
	.word	0x00000000,0x00000000		! %l7
p0_expected_fp_regs:
	.word	0x000000ff,0xff0d0040		! %f0
	.word	0xff000000,0x000000ff		! %f2
	.word	0x00000000,0x00000000		! %f4
	.word	0x00000000,0x00000000		! %f6
	.word	0x000000ff,0x000000ff		! %f8
	.word	0x4a000000,0x710000ff		! %f10
	.word	0x00000000,0x00000000		! %f12
	.word	0x00000f5d,0x00000000		! %f14
	.word	0x00000000,0x00000000		! %f16
	.word	0x000000ff,0x000000ff		! %f18
	.word	0x00000000,0x00000000		! %f20
	.word	0x00000000,0x00000000		! %f22
	.word	0x00000000,0x000000ff		! %f24
	.word	0x00000000,0xff000000		! %f26
	.word	0xff0dff40,0x00000000		! %f28
	.word	0x00000000,0x000000ff		! %f30
	.word	0x00000016,0x00000be0		! %fsr
p0_local0_expect:
	.word	0xffff0000,0x00000000,0xffff0000,0x0000ffff ! PA = 0000000010001400
	.word	0x000000ff,0x000000ff,0x00000000,0x7fec95f3 ! PA = 0000000010001410
	.word	0x77ff0000,0x00000000,0x00000000,0x00000066 ! PA = 0000000010001420
	.word	0x000000ff,0x00000022,0x00000000,0x6edcccff ! PA = 0000000010001430
p0_local0_sec_expect:
	.word	0x00000000,0x00000000,0xff000000,0xffffffff ! PA = 0000000030001400
	.word	0x000000ff,0x0000ff77,0x769c780d,0x0cd1ed8f ! PA = 0000000030001410
	.word	0x6c1ca198,0x2250ffea,0x4e24c376,0x0000004a ! PA = 0000000030001420
	.word	0x00000000,0x73000000,0xff0d0040,0x00000000 ! PA = 0000000030001430
!	Scratch Area for Non-Transactional Memory Stores
	.word	0x16b0b6ae,0xda6443df,0x677353d2,0x139520cb
	.word	0xcc7c0b16,0xcac8d817,0xbc5b757a,0x065094c3
	.word	0x17e733fe,0x1ddf99cf,0x44f42fa2,0xe212023b
	.word	0x7bf2d966,0x5d598107,0xabfd6a4a,0x0f002133
p0_local1_expect:
	.word	0x00000000,0x0000ffff,0x00000dff,0xff000000 ! PA = 0000000010041400
	.word	0x00000000,0x00000000,0x00000000,0xff0d0040 ! PA = 0000000010041410
	.word	0x00000000,0x17ffff00,0x3cf786a6,0x0c098c5f ! PA = 0000000010041420
	.word	0x00000f5d,0x00000000,0x21d58c72,0x3dd76b7b ! PA = 0000000010041430
p0_local1_sec_expect:
	.word	0xff098cff,0x00ffffff,0xff000000,0x00000000 ! PA = 0000000030041400
	.word	0xa686f73c,0x000000ff,0x00000000,0x00000000 ! PA = 0000000030041410
	.word	0xff000000,0x333dec99,0x00000000,0xff000000 ! PA = 0000000030041420
	.word	0xff000000,0x000000ff,0x00000000,0x000000ff ! PA = 0000000030041430
p0_local2_expect:
	.word	0xff000000,0x000000ff,0xff098cff,0x7e0e314a ! PA = 0000000010081400
	.word	0x00000000,0x0c098c5f,0x00000000,0x00000000 ! PA = 0000000010081410
	.word	0xffdf00ff,0x000000ff,0x28debcff,0x00000000 ! PA = 0000000010081420
	.word	0xff000000,0x447d3b71,0x00000000,0x00000000 ! PA = 0000000010081430
p0_local2_sec_expect:
	.word	0x00000000,0x00000000,0xff000000,0x00000000 ! PA = 0000000030081400
	.word	0x00000000,0x0000ff77,0xfffd87a6,0x60000000 ! PA = 0000000030081410
	.word	0x00000071,0x66000000,0x00000000,0x00000000 ! PA = 0000000030081420
	.word	0x0000ddff,0xff000000,0x00466624,0x5d0f91ef ! PA = 0000000030081430
p0_local3_expect:
	.word	0x00000000,0x00000000,0xff000000,0x000000ff ! PA = 00000000100c1400
	.word	0x00000000,0x0c098c5f,0xff000dff,0x000053ff ! PA = 00000000100c1410
	.word	0x000000ff,0xff0d0040,0x00000000,0x00000000 ! PA = 00000000100c1420
	.word	0x0000ddff,0x00000027,0x00466600,0x00000027 ! PA = 00000000100c1430
p0_local3_sec_expect:
	.word	0x00000000,0xff000000,0xffff0000,0x00000000 ! PA = 00000000300c1400
	.word	0xff000000,0x00000000,0x00ffff17,0x00000000 ! PA = 00000000300c1410
	.word	0xfffd87a6,0x000000ff,0xff000000,0x0000004a ! PA = 00000000300c1420
	.word	0x00000000,0x00000000,0x00000000,0x54f28996 ! PA = 00000000300c1430
p0_local4_expect:
	.word	0xff000000,0x00000000,0x000000ff,0x00664600 ! PA = 0000000010101400
	.word	0xff000000,0x0000ff00,0x00000000,0x0087fdff ! PA = 0000000010101410
	.word	0x00000000,0x000000ff,0x0000ffff,0x17ff6600 ! PA = 0000000010101420
	.word	0x000000ff,0xffffff7f,0xffffffff,0xff0d00ff ! PA = 0000000010101430
p0_local4_sec_expect:
	.word	0xffffffff,0xffffffff,0xff000071,0x00000000 ! PA = 0000000030101400
	.word	0xff000000,0xff000000,0x00000060,0xa687fdff ! PA = 0000000030101410
	.word	0x77ff0000,0x0000003d,0xff000000,0x00000000 ! PA = 0000000030101420
	.word	0x5c58a032,0xffdd0000,0xfffd87a6,0x60000000 ! PA = 0000000030101430
p0_local5_expect:
	.word	0x00000000,0x00000000,0xff000000,0xff000000 ! PA = 0000000010141400
	.word	0x00000000,0x00000000,0x00000000,0x00000000 ! PA = 0000000010141410
	.word	0xff000000,0x00000000,0x000000ff,0x00000000 ! PA = 0000000010141420
	.word	0x00000000,0x40ff0dff,0xff000000,0x00000000 ! PA = 0000000010141430
p0_local5_sec_expect:
	.word	0x00000000,0x00000000,0xff00dd22,0x00000000 ! PA = 0000000030141400
	.word	0x00ff00ff,0x00000000,0xff000000,0x0000ffff ! PA = 0000000030141410
	.word	0x4abcde28,0x333dec99,0x3cf786a6,0x0c098c5f ! PA = 0000000030141420
	.word	0x0d789c76,0x447d3b71,0x21d58c72,0x3dd76b7b ! PA = 0000000030141430
p0_local6_expect:
	.word	0x00000000,0x0000ff77,0xffffffff,0x00000000 ! PA = 0000000010181400
	.word	0x000000ff,0x000000ff,0xffff3d33,0x000000ff ! PA = 0000000010181410
	.word	0xe1a34033,0x51968eb7,0x00000000,0x00000000 ! PA = 0000000010181420
	.word	0x00000000,0x5d0f91ff,0x00000000,0x00000000 ! PA = 0000000010181430
p0_local6_sec_expect:
	.word	0x5f8c090c,0xa686f73c,0x00000000,0x40ff0dff ! PA = 0000000030181400
	.word	0x00000f5d,0x24664600,0x7e0e314a,0x7fec95f3 ! PA = 0000000030181410
	.word	0x77ff0000,0x00000027,0x00000000,0x00000066 ! PA = 0000000030181420
	.word	0x00000000,0x00000070,0x00000022,0x6e00cca1 ! PA = 0000000030181430
share0_expect:
	.word	0x09ff2520,0x09295cb1,0x495c475e,0x41477737 ! PA = 00000000201c0000
	.word	0x04b2ac0c,0x3854846d,0x5a9ccaaa,0x0d016dd3 ! PA = 00000000201c0010
	.word	0x0027f6b8,0x417c08e9,0x22e73fb6,0x3d9b772f ! PA = 00000000201c0020
	.word	0x4b325124,0x23578625,0x5ca35282,0x55230f4b ! PA = 00000000201c0030
share1_expect:
	.word	0x00ffc750,0x24815821,0x7dd86f0e,0x3bee7227 ! PA = 0000000020800000
	.word	0x3d9c253c,0x29f29add,0x7739c15a,0x2bf89bc3 ! PA = 0000000020800010
	.word	0x75e4f6e8,0x263f2a59,0x30f23566,0x4afd481f ! PA = 0000000020800020
	.word	0x442d8854,0x7d91a295,0x31307732,0x2f54f33b ! PA = 0000000020800030
	.word	0x2200e580,0x7a675f91,0x1872f2be,0x4b90d917 ! PA = 0000000020800040
	.word	0x197fda6c,0x2f0c7d4d,0x5f93d40a,0x7cd6f5b3 ! PA = 0000000020800050
	.word	0x1180f318,0x5fd7d7c9,0x03950716,0x37fe050f ! PA = 0000000020800060
	.word	0x44087b84,0x52270b05,0x0b2c37e2,0x1169832b ! PA = 0000000020800070
share2_expect:
	.word	0x00007fb0,0x1c1a7301,0x120ed26e,0x1ba5ac07 ! PA = 00000000211c0000
	.word	0x7f98cb9c,0x51112bbd,0x45fe02ba,0x58c37ba3 ! PA = 00000000211c0010
	.word	0x6326eb48,0x26e51139,0x0192b4c6,0x3a74adff ! PA = 00000000211c0020
	.word	0x16de2ab4,0x6fe6bf75,0x70c99492,0x6ce7bf1b ! PA = 00000000211c0030
share3_expect:
	.word	0x00ff95e0,0x05999271,0x6b4f0e1e,0x6863eaf7 ! PA = 0000000021800000
	.word	0x2ce1f8cc,0x002fa62d,0x708b4d6a,0x05a52d93 ! PA = 0000000021800010
	.word	0x3cc1df78,0x56c5d6a9,0x716e3e76,0x10f842ef ! PA = 0000000021800020
	.word	0x768995e4,0x445fbfe5,0x53fb8d42,0x1816a70b ! PA = 0000000021800030
	.word	0xff002810,0x0da3bde1,0x5c96a5ce,0x6ec295e7 ! PA = 0000000021800040
	.word	0x641661fc,0x0356ec9d,0x690eb41a,0x26230b83 ! PA = 0000000021800050
	.word	0x61fccfa8,0x5d992819,0x296aa426,0x72dfc3df ! PA = 0000000021800060
	.word	0x3aa5bd14,0x4be10c55,0x427521f2,0x3dfd3afb ! PA = 0000000021800070
	.word	0xff063640,0x55b7f551,0x0608997e,0x5c78acd7 ! PA = 0000000021800080
	.word	0x1db1072c,0x6835ff0d,0x2d1b36ca,0x29a41573 ! PA = 0000000021800090
	.word	0x3842bbd8,0x2c3e0589,0x3f8ae5d6,0x004230cf ! PA = 00000000218000a0
	.word	0x088da044,0x0179a4c5,0x15a952a2,0x4e627aeb ! PA = 00000000218000b0
	.word	0xffffc070,0x3a1538c1,0x1f87e92e,0x3ffd2fc7 ! PA = 00000000218000c0
	.word	0x37ece85c,0x733bdd7d,0x5e03d57a,0x3c4f4b63 ! PA = 00000000218000d0
	.word	0x76bea408,0x26536ef9,0x39920386,0x31f689bf ! PA = 00000000218000e0
	.word	0x035c3f74,0x4ef88935,0x22cb1f52,0x6dcd66db ! PA = 00000000218000f0
	.word	0x0000c6a0,0x41ba8831,0x28b794de,0x78871eb7 ! PA = 0000000021800100
	.word	0x26c5058c,0x0f9787ed,0x70db902a,0x370bad53 ! PA = 0000000021800110
	.word	0x565b8838,0x12386469,0x3d02fd36,0x4993ceaf ! PA = 0000000021800120
	.word	0x7bec9aa4,0x7cecb9a5,0x6acd8802,0x6584fecb ! PA = 0000000021800130
	.word	0x000048d0,0x0e66e3a1,0x18fa9c8e,0x260d79a7 ! PA = 0000000021800140
	.word	0x23f45ebc,0x3f37fe5d,0x5e7566da,0x0f803b43 ! PA = 0000000021800150
	.word	0x41c46868,0x090be5d9,0x3f20d2e6,0x4170ff9f ! PA = 0000000021800160
	.word	0x20d9b1d4,0x22a53615,0x4a638cb2,0x139042bb ! PA = 0000000021800170
	.word	0x00ff4700,0x4c994b11,0x0f74003e,0x19474097 ! PA = 0000000021800180
	.word	0x5ef5f3ec,0x0acc40cd,0x5364598a,0x4813f533 ! PA = 0000000021800190
	.word	0x05644498,0x66acf349,0x34ee8496,0x3ca51c8f ! PA = 00000000218001a0
	.word	0x2e7e8504,0x1630fe85,0x2a002d62,0x5ab632ab ! PA = 00000000218001b0
	.word	0x61b4c130,0x2390be81,0x0306bfee,0x43ab7387 ! PA = 00000000218001c0
	.word	0x2d04c51c,0x71c34f3d,0x5ffb683a,0x5feddb23 ! PA = 00000000218001d0
	.word	0x7f661cc8,0x39ba8cb9,0x432f1246,0x7707257f ! PA = 00000000218001e0
	.word	0x1ef61434,0x5c5f12f5,0x2dd66a12,0x127dce9b ! PA = 00000000218001f0
p0_invalidate_semaphore:
	.word	0,0
user_data_end:


SECTION	.p0_local0	DATA_VA=0x000800000

attr_data {
	Name = .p0_local0,
	VA = 0x0000000000800000,
	RA = ra2pa(0x0000000010000000,0),
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
	.word	0x31df2280,0x45cc8891,0x6975d7be,0x4bf50a17	! PA = 0000000010001400
	.word	0x2480a76c,0x1da5f64d,0x6207c90a,0x56fdf6b3	! PA = 0000000010001410
	.word	0x7f375018,0x3f96a0c9,0x63070c16,0x4d20d60f	! PA = 0000000010001420
	.word	0x59296884,0x5fcc2405,0x24b94ce2,0x7411242b	! PA = 0000000010001430
p0_local0_end:

SECTION	.p0_local0_sec	DATA_VA=0x000800000

attr_data {
	Name = .p0_local0_sec,
	VA = 0x0000000000800000,
	RA = ra2pa(0x0000000030000000,0),
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
	.word	0x78defcb0,0x7c36dc01,0x6963f76e,0x10ab1d07	! PA = 0000000030001400
	.word	0x76edd89c,0x5905e4bd,0x0a5837ba,0x284fbca3	! PA = 0000000030001410
	.word	0x70658848,0x75e31a39,0x22bef9c6,0x5100beff	! PA = 0000000030001420
	.word	0x54fb57b4,0x57ef1875,0x4424e992,0x4c3ca01b	! PA = 0000000030001430
p0_local0_sec_end:

SECTION	.p0_local1	DATA_VA=0x000802000

attr_data {
	Name = .p0_local1,
	VA = 0x0000000000802000,
	RA = ra2pa(0x0000000010040000,0),
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
	.word	0x1cf652e0,0x447d3b71,0x60c6731e,0x689a9bf7	! PA = 0000000010041400
	.word	0x72db45cc,0x488f9f2d,0x579bc26a,0x6626ae93	! PA = 0000000010041410
	.word	0x1cd8bc78,0x29131fa9,0x4e24c376,0x597d93ef	! PA = 0000000010041420
	.word	0x31f302e4,0x17db58e5,0x43f52242,0x49a8c80b	! PA = 0000000010041430
p0_local1_end:

SECTION	.p0_local1_sec	DATA_VA=0x000802000

attr_data {
	Name = .p0_local1_sec,
	VA = 0x0000000000802000,
	RA = ra2pa(0x0000000030040000,0),
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
	.word	0x66f02510,0x495ea6e1,0x0c004ace,0x04ba86e7	! PA = 0000000030041400
	.word	0x7f03eefc,0x4732259d,0x17a5691a,0x6729cc83	! PA = 0000000030041410
	.word	0x2c3beca8,0x1b45b119,0x3f7b6926,0x11ee54df	! PA = 0000000030041420
	.word	0x6bab6a14,0x2fdfe555,0x75dcf6f2,0x4b5c9bfb	! PA = 0000000030041430
p0_local1_sec_end:

SECTION	.p0_local2	DATA_VA=0x000804000

attr_data {
	Name = .p0_local2,
	VA = 0x0000000000804000,
	RA = ra2pa(0x0000000010080000,0),
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
	.word	0x29577340,0x005a1e51,0x0f347e7e,0x06c1ddd7	! PA = 0000000010081400
	.word	0x37e2d42c,0x769c780d,0x0c082bca,0x4ec01673	! PA = 0000000010081410
	.word	0x67fa18d8,0x1159ce89,0x10c5ead6,0x0e6a01cf	! PA = 0000000010081420
	.word	0x4b7f8d44,0x2f0bbdc5,0x774f67a2,0x751f1beb	! PA = 0000000010081430
p0_local2_end:

SECTION	.p0_local2_sec	DATA_VA=0x000804000

attr_data {
	Name = .p0_local2_sec,
	VA = 0x0000000000804000,
	RA = ra2pa(0x0000000030080000,0),
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
	.word	0x70773d70,0x19aea1c1,0x26460e2e,0x7127a0c7	! PA = 0000000030081400
	.word	0x1fb2f55c,0x2f3d967d,0x1a170a7a,0x7d108c63	! PA = 0000000030081410
	.word	0x6b3e4108,0x42ee77f9,0x4bc74886,0x3bc79abf	! PA = 0000000030081420
	.word	0x188a6c74,0x132de235,0x617f7452,0x1f7747db	! PA = 0000000030081430
p0_local2_sec_end:

SECTION	.p0_local3	DATA_VA=0x000806000

attr_data {
	Name = .p0_local3,
	VA = 0x0000000000806000,
	RA = ra2pa(0x00000000100c0000,0),
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
	.word	0x325a83a0,0x705b3131,0x54d7f9de,0x1722cfb7	! PA = 00000000100c1400
	.word	0x4e6f528c,0x704480ed,0x7ae5052a,0x7f022e53	! PA = 00000000100c1410
	.word	0x52f36538,0x4a62ad69,0x1a028236,0x4f9e1faf	! PA = 00000000100c1420
	.word	0x47a707a4,0x38d552a5,0x79601d02,0x47ac1fcb	! PA = 00000000100c1430
p0_local3_end:

SECTION	.p0_local3_sec	DATA_VA=0x000806000

attr_data {
	Name = .p0_local3_sec,
	VA = 0x0000000000806000,
	RA = ra2pa(0x00000000300c0000,0),
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
	.word	0x7ecc45d0,0x7a1ecca1,0x164d418e,0x0caa6aa7	! PA = 00000000300c1400
	.word	0x21d2ebbc,0x4fa0375d,0x6b451bda,0x7e3bfc43	! PA = 00000000300c1410
	.word	0x6dc48568,0x14d56ed9,0x74ba97e6,0x3844909f	! PA = 00000000300c1420
	.word	0x2b705ed4,0x4b510f15,0x5fa461b2,0x7fc4a3bb	! PA = 00000000300c1430
p0_local3_sec_end:

SECTION	.p0_local4	DATA_VA=0x000808000

attr_data {
	Name = .p0_local4,
	VA = 0x0000000000808000,
	RA = ra2pa(0x0000000010100000,0),
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
	.word	0x2f578400,0x37787411,0x0dc8e53e,0x16757197	! PA = 0000000010101400
	.word	0x6d58c0ec,0x69ffb9cd,0x5bca4e8a,0x3124f633	! PA = 0000000010101410
	.word	0x6c1ca198,0x5225bc49,0x54f28996,0x0cd1ed8f	! PA = 0000000010101420
	.word	0x24417204,0x34b01785,0x40bf4262,0x5e87d3ab	! PA = 0000000010101430
p0_local4_end:

SECTION	.p0_local4_sec	DATA_VA=0x000808000

attr_data {
	Name = .p0_local4_sec,
	VA = 0x0000000000808000,
	RA = ra2pa(0x0000000030100000,0),
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
	.word	0x17473e30,0x23a72781,0x362de4ee,0x19fae487	! PA = 0000000030101400
	.word	0x2a3bd21c,0x52d2083d,0x20c79d3a,0x4ae41c23	! PA = 0000000030101410
	.word	0x1026b9c8,0x64f295b9,0x636d5746,0x7d1d367f	! PA = 0000000030101420
	.word	0x50354134,0x0dc16bf5,0x04e3bf12,0x6f7caf9b	! PA = 0000000030101430
p0_local4_sec_end:

SECTION	.p0_local5	DATA_VA=0x00080a000

attr_data {
	Name = .p0_local5,
	VA = 0x000000000080a000,
	RA = ra2pa(0x0000000010140000,0),
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
	.word	0x33a67460,0x24a9e6f1,0x121f409e,0x0d71c377	! PA = 0000000010141400
	.word	0x27771f4c,0x044622ad,0x225007ea,0x6b606e13	! PA = 0000000010141410
	.word	0x5dcdcdf8,0x529afb29,0x28ae00f6,0x41bd6b6f	! PA = 0000000010141420
	.word	0x3b26cc64,0x0e140c65,0x0004d7c2,0x22ea378b	! PA = 0000000010141430
p0_local5_end:

SECTION	.p0_local5_sec	DATA_VA=0x00080a000

attr_data {
	Name = .p0_local5_sec,
	VA = 0x000000000080a000,
	RA = ra2pa(0x0000000030140000,0),
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
	.word	0x5b402690,0x7b3fb261,0x5bfff84e,0x67d10e67	! PA = 0000000030141400
	.word	0x39c5a87c,0x4f4b091d,0x0c368e9a,0x0f40ec03	! PA = 0000000030141410
	.word	0x4abcde28,0x333dec99,0x3cf786a6,0x0c098c5f	! PA = 0000000030141420
	.word	0x0eb11394,0x7bf6f8d5,0x21d58c72,0x3dd76b7b	! PA = 0000000030141430
p0_local5_sec_end:

SECTION	.p0_local6	DATA_VA=0x00080c000

attr_data {
	Name = .p0_local6,
	VA = 0x000000000080c000,
	RA = ra2pa(0x0000000010180000,0),
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
	.word	0x6e9f54c0,0x32e789d1,0x35f30bfe,0x10cfc557	! PA = 0000000010181400
	.word	0x6ba26dac,0x4b8fbb8d,0x7e0e314a,0x7fec95f3	! PA = 0000000010181410
	.word	0x6e5eea58,0x21ba6a09,0x784ce856,0x7618994f	! PA = 0000000010181420
	.word	0x422f16c4,0x1c793145,0x25c8dd22,0x4a0b4b6b	! PA = 0000000010181430
p0_local6_end:

SECTION	.p0_local6_sec	DATA_VA=0x00080c000

attr_data {
	Name = .p0_local6_sec,
	VA = 0x000000000080c000,
	RA = ra2pa(0x0000000030180000,0),
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
	.word	0x080efef0,0x11e06d41,0x59db7bae,0x50e4e847	! PA = 0000000030181400
	.word	0x2d486edc,0x478339fd,0x3b29effa,0x438a6be3	! PA = 0000000030181410
	.word	0x31def288,0x2baf7379,0x22712606,0x72c1923f	! PA = 0000000030181420
	.word	0x4abbd5f4,0x2369b5b5,0x4311c9d2,0x060cd75b	! PA = 0000000030181430
p0_local6_sec_end:

SECTION	.share0	DATA_VA=0x00080e000

attr_data {
	Name = .share0,
	VA = 0x000000000080e000,
	RA = ra2pa(0x00000000201c0000,0),
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
	.word	0x2b9a2520,0x09295cb1,0x495c475e,0x41477737	! PA = 00000000201c0000
	.word	0x04b2ac0c,0x3854846d,0x5a9ccaaa,0x0d016dd3	! PA = 00000000201c0010
	.word	0x0027f6b8,0x417c08e9,0x22e73fb6,0x3d9b772f	! PA = 00000000201c0020
	.word	0x4b325124,0x23578625,0x5ca35282,0x55230f4b	! PA = 00000000201c0030
share0_end:

SECTION	.share1	DATA_VA=0x000810000

attr_data {
	Name = .share1,
	VA = 0x0000000000810000,
	RA = ra2pa(0x0000000020800000,0),
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
	.word	0x770bc750,0x24815821,0x7dd86f0e,0x3bee7227	! PA = 0000000020800000
	.word	0x3d9c253c,0x29f29add,0x7739c15a,0x2bf89bc3	! PA = 0000000020800010
	.word	0x75e4f6e8,0x263f2a59,0x30f23566,0x4afd481f	! PA = 0000000020800020
	.word	0x442d8854,0x7d91a295,0x31307732,0x2f54f33b	! PA = 0000000020800030
	.word	0x51eee580,0x7a675f91,0x1872f2be,0x4b90d917	! PA = 0000000020800040
	.word	0x197fda6c,0x2f0c7d4d,0x5f93d40a,0x7cd6f5b3	! PA = 0000000020800050
	.word	0x1180f318,0x5fd7d7c9,0x03950716,0x37fe050f	! PA = 0000000020800060
	.word	0x44087b84,0x52270b05,0x0b2c37e2,0x1169832b	! PA = 0000000020800070
share1_end:

SECTION	.share2	DATA_VA=0x000812000

attr_data {
	Name = .share2,
	VA = 0x0000000000812000,
	RA = ra2pa(0x00000000211c0000,0),
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
	.word	0x1d8e7fb0,0x1c1a7301,0x120ed26e,0x1ba5ac07	! PA = 00000000211c0000
	.word	0x7f98cb9c,0x51112bbd,0x45fe02ba,0x58c37ba3	! PA = 00000000211c0010
	.word	0x6326eb48,0x26e51139,0x0192b4c6,0x3a74adff	! PA = 00000000211c0020
	.word	0x16de2ab4,0x6fe6bf75,0x70c99492,0x6ce7bf1b	! PA = 00000000211c0030
share2_end:

SECTION	.share3	DATA_VA=0x000814000

attr_data {
	Name = .share3,
	VA = 0x0000000000814000,
	RA = ra2pa(0x0000000021800000,0),
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
	.word	0x64f595e0,0x05999271,0x6b4f0e1e,0x6863eaf7	! PA = 0000000021800000
	.word	0x2ce1f8cc,0x002fa62d,0x708b4d6a,0x05a52d93	! PA = 0000000021800010
	.word	0x3cc1df78,0x56c5d6a9,0x716e3e76,0x10f842ef	! PA = 0000000021800020
	.word	0x768995e4,0x445fbfe5,0x53fb8d42,0x1816a70b	! PA = 0000000021800030
	.word	0x0cef2810,0x0da3bde1,0x5c96a5ce,0x6ec295e7	! PA = 0000000021800040
	.word	0x641661fc,0x0356ec9d,0x690eb41a,0x26230b83	! PA = 0000000021800050
	.word	0x61fccfa8,0x5d992819,0x296aa426,0x72dfc3df	! PA = 0000000021800060
	.word	0x3aa5bd14,0x4be10c55,0x427521f2,0x3dfd3afb	! PA = 0000000021800070
	.word	0x04063640,0x55b7f551,0x0608997e,0x5c78acd7	! PA = 0000000021800080
	.word	0x1db1072c,0x6835ff0d,0x2d1b36ca,0x29a41573	! PA = 0000000021800090
	.word	0x3842bbd8,0x2c3e0589,0x3f8ae5d6,0x004230cf	! PA = 00000000218000a0
	.word	0x088da044,0x0179a4c5,0x15a952a2,0x4e627aeb	! PA = 00000000218000b0
	.word	0x7285c070,0x3a1538c1,0x1f87e92e,0x3ffd2fc7	! PA = 00000000218000c0
	.word	0x37ece85c,0x733bdd7d,0x5e03d57a,0x3c4f4b63	! PA = 00000000218000d0
	.word	0x76bea408,0x26536ef9,0x39920386,0x31f689bf	! PA = 00000000218000e0
	.word	0x035c3f74,0x4ef88935,0x22cb1f52,0x6dcd66db	! PA = 00000000218000f0
	.word	0x6a78c6a0,0x41ba8831,0x28b794de,0x78871eb7	! PA = 0000000021800100
	.word	0x26c5058c,0x0f9787ed,0x70db902a,0x370bad53	! PA = 0000000021800110
	.word	0x565b8838,0x12386469,0x3d02fd36,0x4993ceaf	! PA = 0000000021800120
	.word	0x7bec9aa4,0x7cecb9a5,0x6acd8802,0x6584fecb	! PA = 0000000021800130
	.word	0x17aa48d0,0x0e66e3a1,0x18fa9c8e,0x260d79a7	! PA = 0000000021800140
	.word	0x23f45ebc,0x3f37fe5d,0x5e7566da,0x0f803b43	! PA = 0000000021800150
	.word	0x41c46868,0x090be5d9,0x3f20d2e6,0x4170ff9f	! PA = 0000000021800160
	.word	0x20d9b1d4,0x22a53615,0x4a638cb2,0x139042bb	! PA = 0000000021800170
	.word	0x6fa54700,0x4c994b11,0x0f74003e,0x19474097	! PA = 0000000021800180
	.word	0x5ef5f3ec,0x0acc40cd,0x5364598a,0x4813f533	! PA = 0000000021800190
	.word	0x05644498,0x66acf349,0x34ee8496,0x3ca51c8f	! PA = 00000000218001a0
	.word	0x2e7e8504,0x1630fe85,0x2a002d62,0x5ab632ab	! PA = 00000000218001b0
	.word	0x61b4c130,0x2390be81,0x0306bfee,0x43ab7387	! PA = 00000000218001c0
	.word	0x2d04c51c,0x71c34f3d,0x5ffb683a,0x5feddb23	! PA = 00000000218001d0
	.word	0x7f661cc8,0x39ba8cb9,0x432f1246,0x7707257f	! PA = 00000000218001e0
	.word	0x1ef61434,0x5c5f12f5,0x2dd66a12,0x127dce9b	! PA = 00000000218001f0
share3_end:
